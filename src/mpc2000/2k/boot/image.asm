; boot -- Akai MPC2000 boot EPROM: image 0x00000-0x08000 (32768 bytes)
; 32KB (AM27C256 IC12-A), no segments; shadow-copied to linear 0, run flat.
; "Nov.14,1996 MPC2000 Boot ROM V1.00" at 0x41A0. Finds system image,
; hands off; native x86 with bytecode VM display.
;
; ADDRESSING: cold_entry shadow-copies 0F000h:0000 to linear 0;
; BRKXA through IVT[28h] at CS=0; ROM offset == address, `org 0` literal.
; Windows: DS=041Ah (0x41A0, boot/LCD `bv_`) to 0x51A0+, glyph 0x794C;
; DS=04000h (0x40000, storage `dv_`) switched by int2ch_dispatch.
; Zero-init RAM: 0x41C9-0x794C, 0x7DD1-0x7FF0. Unused: 0x00E5-0x0400 (IVT).
;
; SHARED with MPC2000.EXE: ~6KB in ~60 runs (V53 init, floppy+FAT12, LCD,
; bytecode, F-ROM DMA, glyphs); v1.50 offsets:
;   ROM 0793h == EXE 10C67h  ROM 0D5Eh == EXE 01BB2h  ROM 1168h == EXE 1181Ah
;   ROM 2613h == EXE 1CD6Bh  ROM 2795h == EXE 14105h  ROM 794Ch == EXE 25D74h
;
; BYTECODE: `call bc_dispatch` and `int 2ah` sites followed inline by operand
; bytes, written as BC_*/INT_2A macros (bytecode_macros.inc), switch to near
; call; 71 sites, 414 bytes operand.
;
; int2ch_dispatch: CS=0, DS=SS=041Ah, SP=1430h. Floppy boot sequence (BL):
; 00h 0Fh 01h, then 12h/04h/06h interleaved (fdc_reset, drive_motor_on,
; disk_probe, IRQ flag, file_open, read_block).

        cpu     v53

; ---------------------------------------------------------------------------
; Ports.
; ---------------------------------------------------------------------------
P_SCSI_SPC        equ     00000h                ; MB89352 SCSI SPC, register N at port 2N (00h-1Ch even)
P_FDC_MSR         equ     00020h                ; uPD765 main status on read / aux command on write
P_FDC_FIFO        equ     00022h                ; uPD765 data FIFO
P_LCD_CMD_L       equ     00060h                ; LCD left controller: command / busy
P_LCD_DAT_L       equ     00062h                ; LCD left controller: data
P_SMEM_ADDR       equ     00080h                ; sample-memory / F-ROM DMA: device address
P_SMEM_GO         equ     00086h                ; sample-memory / F-ROM DMA: go
P_SMEM_STAT       equ     00088h                ; sample-memory / F-ROM DMA: status (bit 7 busy)
P_FLASH_CTL       equ     000c0h                ; FMX008M flash board: bit0 Vpp, bit1 board enable
P_LCD_CMD_R       equ     00100h                ; LCD right controller: command / busy
P_LCD_DAT_R       equ     00102h                ; LCD right controller: data
P_DMA_MODE        equ     0c030h                ; MPC ASIC DMA: channel/mode
P_DMA_COUNT       equ     0c032h                ; MPC ASIC DMA: byte count minus one
P_DMA_ADDR        equ     0c034h                ; MPC ASIC DMA: RAM target, low 16 bits
P_DMA_ADDR_HI     equ     0c036h                ; MPC ASIC DMA: RAM target, bits 16-19
P_DMA_DIR         equ     0c039h                ; MPC ASIC DMA: 1 = device -> RAM, 0 = RAM -> device
P_V53_PAGE0       equ     0ff00h                ; V53 address-expansion page registers, 64 x word

; ---------------------------------------------------------------------------
; Boot variables, DS = 0x41A, base linear 0x41A0, so this window lies on top
; of the ROM image itself: bv_xxx == ROM offset 0x41A0+xxx.
; ---------------------------------------------------------------------------
bv_banner         equ     00000h                ; linear 0x41A0: "Nov.14,1996 MPC2000 Boot ROM V1.00"
bv_boot_dev       equ     0002ah                ; byte: INT 2Ch device index the boot path is using
bv_ticks          equ     0002bh                ; word: timer tick counter, bumped only by timer_isr
bv_mz_header      equ     0002eh                ; 0x24 bytes: MPC2000.EXE MZ header lands here
bv_mz_cparhdr     equ     00036h                ; word: bv_mz_header+8,  e_cparhdr
bv_mz_ip          equ     00042h                ; word: bv_mz_header+14h, e_ip
bv_mz_cs          equ     00044h                ; word: bv_mz_header+16h, e_cs -- overwritten with 0C000h
bv_hdr_sink       equ     0022eh                ; the rest of the MZ header, incl. relocations, is dumped here
bv_mon_seg        equ     0102eh                ; word: debug monitor cursor, segment
bv_mon_off        equ     01030h                ; word: debug monitor cursor, offset
bv_mon_step_off   equ     01032h                ; word: monitor cursor step, offset part
bv_mon_step_seg   equ     01034h                ; word: monitor cursor step, segment part
bv_plane_cur      equ     01438h                ; word: current draw plane base
bv_plane_saved    equ     0143ah                ; word: plane base saved by plane_push
bv_plane_a        equ     0143ch                ; 0x780 = 60 rows x 32 bytes
bv_plane_b        equ     01bbch                ; 0x780
bv_plane_c        equ     0233ch                ; 0x780
bv_plane_d        equ     02abch                ; 0x220 = 17 rows -- popup-window sized
bv_plane_e        equ     02cdch                ; 0x220
bv_plane_f        equ     02efch                ; 0x120 = 9 rows -- soft-key-row sized
bv_lcd_fb         equ     0301ch                ; 0x780: the plane actually clocked out to the panel
bv_text_xor       equ     0379ch                ; byte: XOR applied to every glyph row (0FCh = inverse)
bv_pen_x          equ     037a0h                ; word: last pen x, reset by plane_clear_780      ; ?
bv_pen_y          equ     037a2h                ; word: last pen y                               ; ?
bv_zero_suppress  equ     037aah                ; byte: put_decimal leading-zero flag
bv_font           equ     037ach                ; 0x380: 128 glyphs x 7 rows, 6 px pitch (= 0x794C)
bv_scsi_ctx       equ     03d40h                ; word: handle the INT 2Dh services pass to the C layer

; ---------------------------------------------------------------------------
; Storage driver variables, DS = 0x4000, so dv_xxx == linear 0x40000+xxx.
; fdc_reset zeroes dv_vars..dv_vars+0x104.
; ---------------------------------------------------------------------------
dv_boot_sector    equ     00000h                ; read_boot_cylinder drops cylinder 0 here
dv_cyl_buffer     equ     05000h                ; the multi-sector read/write buffer
dv_vars           equ     0f800h                ; base of the zeroed driver variable block
dv_write_protect  equ     0f890h                ; byte: ST3 bit 6 from fdc_sense_drive_status
dv_density        equ     0f891h                ; byte: 1 = high density
dv_alt_table      equ     0f892h                ; byte: non-zero -> int2ch_table_dev0_alt
dv_file_state     equ     0f893h                ; byte: 2 = a file is open for writing
dv_motor          equ     0f894h                ; byte: drive motor shadow
dv_tmo_inner      equ     0f896h                ; word: inner timeout counter
dv_tmo_outer      equ     0f898h                ; word: outer timeout counter, armed to 14h
dv_fat_len        equ     0f89ah                ; word: bytes in one FAT
dv_cluster_count  equ     0f89ch                ; word: data clusters on the volume
dv_fat_off        equ     0f89eh                ; word: FAT offset inside dv_boot_sector
dv_dir_cursor     equ     0f8a0h                ; word: current root-directory entry
dv_dir_start      equ     0f8a2h                ; word: first root-directory entry
dv_dir_end        equ     0f8a4h                ; word: one past the last root-directory entry
dv_win_first      equ     0f8a6h                ; word: first LBA sector held in dv_cyl_buffer
dv_win_last       equ     0f8a8h                ; word: one past the last
dv_data_start     equ     0f8aah                ; word: LBA of the first data sector
dv_sec_per_clus   equ     0f8ach                ; word
dv_bytes_per_sec  equ     0f8aeh                ; word
dv_clus_sec_left  equ     0f8b0h                ; word: sectors left in the current cluster
dv_cur_lba        equ     0f8b2h                ; word: next LBA sector of the open file
dv_remain_lo      equ     0f8b4h                ; word: bytes left in the open file, low
dv_remain_hi      equ     0f8b6h                ; word: ... high
dv_cur_cluster    equ     0f8b8h                ; word: current FAT12 cluster
dv_buf_left       equ     0f8bah                ; word: valid bytes left at dv_buf_ptr
dv_buf_ptr        equ     0f8bch                ; word: read cursor into dv_cyl_buffer
dv_dir_entry      equ     0f8beh                ; word: directory entry of the file open for writing
dv_wr_base        equ     0f8c0h                ; word
dv_wr_ptr         equ     0f8c4h                ; word: write cursor into dv_cyl_buffer
dv_wr_left        equ     0f8c6h                ; word: space left at dv_wr_ptr
dv_name_buf       equ     0f8cch                ; 20 bytes: dir_format_name output / compare buffer
dv_cmd_len        equ     0f8e1h                ; byte: length of the uPD765 command block, consumed by sending
dv_cmd_buf        equ     0f8e2h                ; 9 bytes: the uPD765 command block
dv_sector_n       equ     0f8e7h                ; byte: uPD765 N (2 = 512 bytes, 3 = 1024)
dv_sec_per_trk    equ     0f8e8h                ; byte: sectors per track, also the READ DATA EOT
dv_gpl            equ     0f8e9h                ; byte: uPD765 GPL
dv_dtl            equ     0f8eah                ; byte: uPD765 DTL
dv_fmt_len        equ     0f8ebh                ; byte: length of the FORMAT TRACK parameter block
dv_fmt_buf        equ     0f8ech                ; the FORMAT TRACK parameter block
dv_fmt_track      equ     0f8f2h                ; byte: track fdc_format_track is working on
dv_result         equ     0f8f3h                ; 7 bytes: uPD765 result phase, dv_result[dv_boot_sector] = ST0
dv_cmd_done       equ     0f8fbh                ; byte: set by fdc_set_command_complete from the IRQ
dv_frm_addr       equ     0f8fch                ; dword: F-ROM read cursor as seg:off
dv_frm_remain     equ     0f900h                ; dword: bytes left in the F-ROM system image
dv_scsi_vars      equ     0f906h                ; base of the SCSI volume driver block, 0x6BA bytes
dv_scsi_inquiry   equ     0f908h                ; 0x24 bytes: INQUIRY result
dv_scsi_devtype   equ     0f969h                ; byte: INQUIRY byte 0 AND 1Fh
dv_scsi_blocks    equ     0f980h                ; dword: capacity in blocks
dv_cmd_hds        equ     0f8e3h                  ; byte: uPD765 command block +1 (HDS/DS)
dv_cmd_c          equ     0f8e4h                  ; byte: ... +2  C (cylinder)
dv_cmd_h          equ     0f8e5h                  ; byte: ... +3  H (head)
dv_cmd_r          equ     0f8e6h                  ; byte: ... +4  R (sector)
dv_fmt_hds        equ     0f8edh                  ; byte: FORMAT TRACK head select
dv_fmt_n          equ     0f8eeh                  ; byte: FORMAT TRACK N
dv_fmt_sc         equ     0f8efh                  ; byte: FORMAT TRACK SC (sectors per cylinder)
dv_fmt_gpl        equ     0f8f0h                  ; byte: FORMAT TRACK GPL
dv_fmt_filler     equ     0f8f1h                  ; byte: FORMAT TRACK filler byte
dv_wr_win         equ     0f8c8h                  ; word: buffer window the write path is filling
dv_frm_addr_seg   equ     0f8feh                  ; word: dv_frm_addr high half
dv_frm_remain_hi  equ     0f902h                  ; word: dv_frm_remain high half
dv_scsi_blocks_hi equ     0f982h                  ; word
dv_scsi_lba_hi    equ     0f986h                  ; word
dv_scsi_lba       equ     0f984h                ; dword: current LBA

BC_ROM_DISPATCH equ     1               ; the VM is entered by a near call here
        include "../../common/bytecode_macros.inc"
        org     0


; ===========================================================================
; INTERRUPT VECTOR TABLE IMAGE  (0x0000-0x00CC)
; ===========================================================================
; cold_entry REP MOVSWs 32KB to linear 0 as 0x33 IVT dwords; unused point
; to bare IRET at 0x00CC. Live vector entries:
; 00 0000:00CD null_jump_trap (divide error / JMP to 0:0)
; 01 0000:08B8 breakpoint_isr (single step)
; 03 0000:08B8 breakpoint_isr (INT 3)
; 04 0000:09DB monitor_isr (INT 4, memory/event browser)
; 21 0000:0767 timer_isr (V53 ICU timer)
; 23 0000:0777 fdc_complete_isr (V53 ICU floppy done)
; 28 0000:0436 brkxa_landing (BRKXA 28h target; CS 0F000h->0)
; 2A 0000:0880 int2ah_message_isr (print literal, key, IRET)
; 2B 0000:26E8 bc_dispatch (bytecode VM, same vector/opcode as MPC2000.EXE;
; no CD 2B in ROM, CALL used, vector installed)
; 2C 0000:0BFA int2ch_dispatch (storage device API)
; 2D 0000:396E int2dh_dispatch (MB89352 SCSI transport API)
; Vectors 33h+ are code/strings, not vectors.

        db      0cdh, 00h, 00h, 00h, 0b8h, 08h, 00h, 00h, 0cch, 00h, 00h, 00h, 0b8h, 08h, 00h, 00h
        db      0dbh, 09h, 00h, 00h, 0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h
        db      0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h
        db      0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h
        db      0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h
        db      0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h
        db      0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h
        db      0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h
        db      0cch, 00h, 00h, 00h, 67h, 07h, 00h, 00h, 0cch, 00h, 00h, 00h, 77h, 07h, 00h, 00h
        db      0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h
        db      36h, 04h, 00h, 00h, 0cch, 00h, 00h, 00h, 80h, 08h, 00h, 00h, 0e8h, 26h, 00h, 00h
        db      0fah, 0bh, 00h, 00h, 6eh, 39h, 00h, 00h, 0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h
        db      0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h, 0cch, 00h, 00h, 00h
        iret
null_jump_trap:                         ; IVT[0]
        INT_2A "JMP 0000:0000  ERROR !"

; 0x00E6-0x0400 (only unused run, 794 bytes); inside shadowed IVT vectors
; 39h-0FFh, so never reachable as interrupt vector.
FREE_000E6:
        rept    00400h-$
        db      000h
        endm


; ===========================================================================
; RESET AND COLD INIT  (0x0400-0x0793)
; ===========================================================================
; entry at 0x7FF0 via far jump, CS=0F000h; shadow ROM, program V53 regs
; and IVT[28h], set DS=ES=SS=041Ah SP=1436h; boot: floppy 0 -> F-ROM 9
; -> SCSI IDs 1..8

bootrom_cold_entry:
        cli
        mov     ax, 0
        mov     es, ax
        mov     ax, 0f000h
        mov     ds, ax
        mov     si, 0
        mov     di, 0
        mov     cx, 4000h
        rep movsw
        mov     dx, 0ff00h
        mov     ax, 0
        mov     cx, 20h
page_regs_identity_loop:                ; pages 00h-1Fh <- 00h-1Fh, word OUT to 0FF00h step 2
        out     dx, ax
        inc     ax
        add     dx, 2
        loop    page_regs_identity_loop
        mov     ax, 60h
        mov     cx, 20h
page_regs_high_loop:                    ; pages 20h-3Fh <- 60h-7Fh; XL uses 40h-5Fh here
        out     dx, ax
        inc     ax
        add     dx, 2
        loop    page_regs_high_loop

; BRKXA 28h (0F 0E0h 28h): enter V53 addr-expansion via IVT[28h]=0000:0436
; AS lacks mnemonic; decodes as MMX pavgb; encoded as db
        db      0fh, 0e0h, 28h
brkxa_landing:                          ; IVT[28h]; reached by the BRKXA 28h three bytes above
        cli
        cld
        mov     ax, 41ah
        mov     ds, ax
        mov     es, ax
        mov     ss, ax
        mov     ax, 1436h
        mov     sp, ax
        mov     ax, 4000h
        mov     es, ax
        sub     ax, ax
        mov     di, ax
        mov     cx, 8000h
        rep stosw
        mov     word ptr [bv_mon_seg], 4000h
        mov     word ptr [bv_mon_off], 0
        call    v53_peripheral_init
        mov     dx, 120h
        mov     al, 14h
        out     dx, al
        BC_INIT
        BC_CLEAR
        BC_PLANE_A
        db      0b1h                                                    ; .
        aaa
        mov     ch, 19h
        mov     si, 0bh
        mov     dx, ds
        mov     ah, 19h
        BC_PUTS_FAR
        BC_FLUSH
        sti
        mov     ah, 0
        int     2dh
        or      ax, ax
        mov     ah, 7
        int     2dh
        or      ax, ax
        mov     dx, 0c0h
        mov     al, 0
        out     dx, al
        mov     al, 2
        out     dx, al
        mov     cx, 3e8h
        call    tick_wait
        mov     byte ptr [bv_boot_dev], 0
        mov     bl, 0
        mov     bh, byte ptr [bv_boot_dev]
        int     2ch
        mov     bl, 0fh
        mov     bh, byte ptr [bv_boot_dev]
        int     2ch
        mov     byte ptr [bv_boot_dev], 0
        mov     bl, 1
        mov     bh, byte ptr [bv_boot_dev]
        int     2ch
        jb      boot_try_f_rom
        jmp     floppy_probe_result
boot_try_f_rom:                         ; floppy failed: probe device 9, load_os, complain if unsupported
        mov     byte ptr [bv_boot_dev], 9
        mov     bl, 1
        mov     bh, byte ptr [bv_boot_dev]
        int     2ch
        jb      boot_scan_scsi
        call    load_os
        BC_PRINT "No system file in F-ROM"
; code not data: 0B9h 0E8h 03h = mov cx, 3e8h (1000 ticks for tick_wait)
        db      0b9h, 0e8h, 03h                                         ; ...
        call    tick_wait
boot_scan_scsi:                         ; F-ROM declined too -- walk SCSI IDs 1..8
        mov     dl, 0
        mov     dh, 6
        mov     al, 1
scsi_scan_next_id:                      ; bv_boot_dev = AL, select the ID, probe it
        mov     byte ptr [bv_boot_dev], al
        push    ax
        call    scsi_id_select
        pop     ax
        cmp     byte ptr [bv_boot_dev], 0
        jne     scsi_id_probe_media
        mov     byte ptr [bv_boot_dev], al
        call    scsi_id_select
        cmp     byte ptr [bv_boot_dev], 0
        je      boot_wait_for_floppy
scsi_id_probe_media:                    ; INT 2Ch BL=1; media codes 12h/13h/14h are bootable here
        mov     bl, 1
        mov     bh, byte ptr [bv_boot_dev]
        int     2ch
        cmp     al, 13h
        je      scsi_id_load_os
        cmp     al, 14h
        je      scsi_id_load_os
        cmp     al, 12h
        je      scsi_id_load_os
        jmp     scsi_scan_advance
scsi_id_load_os:
        call    load_os
scsi_scan_advance:
        mov     al, byte ptr [bv_boot_dev]
        inc     al
        cmp     al, 9
        jne     scsi_scan_next_id
boot_wait_for_floppy:                   ; motor on, device 0, then loop until a disk shows up
        sti
        mov     bl, 0fh
        mov     bh, byte ptr [bv_boot_dev]
        int     2ch
        mov     byte ptr [bv_boot_dev], 0
floppy_probe_media:                     ; INT 2Ch BL=1 on device 0
        mov     bl, 1
        mov     bh, byte ptr [bv_boot_dev]
        int     2ch
floppy_probe_result:
        jae     floppy_media_accepted
        jmp     prompt_insert_disk
floppy_media_accepted:                  ; codes 2..7 are the six accepted floppy geometries
        cmp     al, 6
        je      floppy_load_os
        cmp     al, 7
        je      floppy_load_os
        cmp     al, 4
        je      floppy_load_os
        cmp     al, 5
        je      floppy_load_os
        cmp     al, 2
        je      floppy_load_os
        cmp     al, 3
        je      floppy_load_os
prompt_insert_disk:                     ; print, wait 1000 ticks, probe again
        BC_PRINT "  Insert MPC2000 Disk !   "
        mov     cx, 3e8h
        call    tick_wait
        jmp     floppy_probe_media
floppy_load_os:                         ; load_os returning at all means no system file
        call    load_os
        BC_PRINT "   No system file   !!    "
wait_disk_removed:                      ; spin on SENSE DRIVE STATUS until it errors, i.e. disk out
        mov     bl, 11h
        mov     bh, byte ptr [bv_boot_dev]
        int     2ch
        jae     wait_disk_removed
        jmp     prompt_insert_disk
scsi_id_select:
        BC_PRINT "SCSI:0:                   "
        BC_PLANE_E
        mov     al, byte ptr [bv_boot_dev]
        dec     al
        push    ax
        sub     ah, ah
scsi_id_show_number:
        BC_OP_32 80, 5
        BC_FLUSH
; code not data: pop ax / mov dl,al / mov dh,6 / cmp dl,dh
        db      58h, 8ah                                                ; X.
        db      0d0h, 0b6h, 06h, 3ah, 0d6h
        je      scsi_id_next
        mov     ah, 0
        int     2dh
        or      ax, ax
scsi_id_inquiry_retry:
        mov     ah, 3
        mov     dx, ds
        mov     di, 2eh
        mov     cx, 24h
        int     2dh
        or      ax, ax
        cmp     ax, 8
        je      scsi_id_inquiry_retry
scsi_id_result:
        or      ax, ax
        je      L_0063D
scsi_id_next:
        inc     byte ptr [bv_boot_dev]
        cmp     byte ptr [bv_boot_dev], 9
        je      scsi_scan_give_up
        jmp     scsi_id_select
scsi_scan_give_up:
        mov     byte ptr [bv_boot_dev], 0
        BC_MODE
        db      0f9h
        ret
L_0063D:
        mov     si, 36h
        mov     dx, ds
        mov     cl, 5ch
        mov     ch, 5
        mov     ah, 10h
        BC_PUTS_FAR
        BC_FLUSH
L_00650:
        mov     bx, 0
        mov     dx, 0
        mov     di, 0
        mov     ax, 3000h
        mov     es, ax
        mov     cx, 1
        mov     ah, 1
        int     2dh
        or      ax, ax
        js      L_0068B
        je      L_00689
        mov     ah, 0ffh
        int     2dh
        or      ax, ax
        mov     es, dx
        mov     al, byte ptr es:[di+2]
        and     al, 0fh
        mov     byte ptr es:[di+2], 0
        cmp     al, 6
        je      L_00650
        cmp     al, 2
        je      L_00693
        sub     ax, ax
        ret
L_00689:
        clc
        ret
L_0068B:
        mov     ah, 7
        int     2dh
        or      ax, ax
        jmp     scsi_id_next
L_00693:
        mov     word ptr [bv_ticks], 0
L_00699:
        cmp     word ptr [bv_ticks], 7530h
        jb      L_006A3
        jmp     scsi_id_next
L_006A3:
        mov     bx, 0
        mov     dx, 0
        mov     di, 0
        mov     ax, 3000h
        mov     es, ax
        mov     cx, 1
        mov     ah, 1
        int     2dh
        or      ax, ax
        mov     ah, 0ffh
        int     2dh
        or      ax, ax
        mov     es, dx
        mov     al, byte ptr es:[di+2]
        and     al, 0fh
        mov     byte ptr es:[di+2], 0
        cmp     al, 2
        je      L_00699
        sub     ax, ax
        ret

; 20 bytes, dir_format_name form: base name 16-bytes space-padded, dot at 10h
os_filename:                            ; searched for by dir_find_by_name in dir_format_name form
        db      "MPC2000         " ; MPC2000
        db      ".EXE"
load_os:                                ; open MPC2000.EXE, read header to bv_mz_header, body to 0C000:0000
        mov     ax, cs
        mov     es, ax
        mov     si, os_filename
        mov     bl, 4
        mov     bh, byte ptr [bv_boot_dev]
        int     2ch
        jae     load_os_read_header
        ret
load_os_read_header:
        mov     di, 2eh
load_os_header_chunk:                   ; read 200h; tail to bv_hdr_sink
        mov     cx, 200h
load_os_header_read:
        mov     ax, ds
        mov     es, ax
        mov     bl, 6
        mov     bh, byte ptr [bv_boot_dev]
        int     2ch
        mov     di, 22eh
        sub     word ptr [bv_mz_cparhdr], 20h
        je      load_os_check_mz
        jae     load_os_header_chunk
        mov     cx, word ptr [bv_mz_cparhdr]
        add     cx, 20h
        shl     cx, 4
        jmp     load_os_header_read
load_os_check_mz:                       ; the only validation: the "MZ" signature
        cmp     word ptr [bv_mz_header], 5a4dh
        stc
        je      load_os_body
        ret
load_os_body:
        mov     ax, 0c000h
        mov     es, ax
load_os_body_chunk:                     ; read 8000h/call; ES += 800h; loop until INT 2Ch AX returns 0
        push    es
        sub     di, di
        mov     cx, 8000h
        mov     bl, 6
        mov     bh, byte ptr [bv_boot_dev]
        int     2ch
        pop     es
        mov     bx, es
        add     bx, 800h
        mov     es, bx
        cmp     ax, 0
        jne     load_os_body_chunk
        mov     bl, 0ah
        mov     bh, byte ptr [bv_boot_dev]
        int     2ch
        cli
        sub     ax, ax
        mov     al, byte ptr [bv_boot_dev]
        mov     word ptr [bv_mz_cs], 0c000h
        jmpf    [bv_mz_ip]
timer_isr:                              ; IVT[21h]; the only thing that bumps bv_ticks
        pusha
        push    ds
        push    es
        mov     ax, 41ah
        mov     ds, ax
        inc     word ptr [bv_ticks]
        pop     es
        pop     ds
        popa
        iret
fdc_complete_isr:                       ; IVT[23h]; re-enters its own driver as INT 2Ch BL=12h
        pusha
        push    ds
        push    es
        mov     bl, 12h
        mov     bh, 0
        int     2ch
        pop     es
        pop     ds
        popa
        iret
tick_wait:                              ; spin until bv_ticks advances by CX; needs IVT[21h]
        mov     bx, word ptr [bv_ticks]
tick_wait_loop:
        mov     ax, word ptr [bv_ticks]
        sub     ax, bx
        cmp     ax, cx
        jb      tick_wait_loop
        ret
        db      0c3h

; ===========================================================================
; V53 ON-CHIP PERIPHERAL INIT  (0x0793-0x0880)
; ===========================================================================
; OUT run: V53 0FFE9h-0FFFEh (DMAU/ICU/timers/wait-state), MPC ASIC 0C002h-0C039h
; byte-identical routine in MPC2000.EXE

v53_peripheral_init:                    ; one long OUT run over the V53 SFRs and the MPC ASIC window
        mov     dx, 0fffeh
        mov     al, 10h
        out     dx, al
        mov     dx, 0fff1h
        mov     al, 0
        out     dx, al
        mov     dx, 0fffdh
        mov     al, 0fh
        out     dx, al
        mov     dx, 0fff2h
        mov     al, 90h
        out     dx, al
        mov     dx, 0ffeah
        mov     al, 0
        out     dx, al
        mov     dx, 0ffedh
        mov     al, 0
        out     dx, al
        mov     dx, 0fff3h
        mov     al, 75h
        out     dx, al
        mov     dx, 0ffech
        mov     al, 1
        out     dx, al
        mov     dx, 0ffebh
        mov     al, 11h
        out     dx, al
        mov     dx, 0fff4h
        mov     al, 11h
        out     dx, al
        mov     dx, 0fff5h
        mov     al, 31h
        out     dx, al
        mov     dx, 0fff6h
        mov     al, 11h
        out     dx, al
        mov     dx, 0fffch
        mov     al, 0c0h
        out     dx, al
        mov     dx, 0fff8h
        mov     al, 0
        out     dx, al
        mov     dx, 0fff9h
        mov     al, 10h
        out     dx, al
        mov     dx, 0fffah
        mov     al, 20h
        out     dx, al
        mov     dx, 0fffbh
        mov     al, 30h
        out     dx, al
        mov     dx, 0fff0h
        mov     al, 3
        out     dx, al
        mov     dx, 0c016h
        mov     al, 36h
        out     dx, al
        mov     dx, 0c010h
        mov     al, 0e8h
        out     dx, al
        mov     dx, 0c010h
        mov     al, 3
        out     dx, al
        mov     dx, 0c016h
        mov     al, 76h
        out     dx, al
        mov     dx, 0c012h
        mov     al, 0e8h
        out     dx, al
        mov     dx, 0c012h
        mov     al, 3
        out     dx, al
        mov     dx, 0c016h
        mov     al, 0b6h
        out     dx, al
        mov     dx, 0c014h
        mov     al, 40h
        out     dx, al
        mov     dx, 0c014h
        mov     al, 0fh
        out     dx, al
        mov     dx, 0c004h
        mov     al, 4fh
        out     dx, al
        mov     dx, 0c002h
        mov     al, 35h
        out     dx, al
        mov     dx, 0c006h
        mov     al, 2
        out     dx, al
        mov     al, 8
        mov     dx, 0ffe9h
        mov     al, al
        out     dx, al
        mov     dx, 0c020h
        mov     al, 13h
        out     dx, al
        mov     dx, 0c022h
        mov     al, 20h
        out     dx, al
        mov     dx, 0c022h
        mov     al, 3
        out     dx, al
        mov     dx, 0c022h
        mov     al, 0f5h
        out     dx, al
        mov     dx, 0c020h
        mov     al, 2bh
        out     dx, al
        mov     dx, 0c030h
        mov     al, 1
        out     dx, al
        mov     dx, 0c038h
        mov     al, 10h
        out     dx, al
        mov     dx, 0c039h
        mov     al, 0
        out     dx, al
        ret

; ===========================================================================
; MESSAGE PRINTER AND DEBUG MONITOR  (0x0880-0x0BFA)
; ===========================================================================
; int2ah_message_isr: prints NUL-terminated literal inline after INT 2Ah
; breakpoint_isr (INT 1/INT 3): dump AX..CS to panel via BC_STATUS/BC_PUT_HEX
; monitor_isr (INT 4): ES:SI browser, steps 1/8/100h/1000h/seg/6; MPC decoder
; monitor_event_labels: ":END/:EOX/:BAR/:NOTE/:EVNT/:EXC"
; factory/service monitor code, not on boot path

int2ah_message_isr:                     ; prints the literal that follows the INT and IRETs past it
        pop     si
        pop     dx
        sti
        mov     ax, 41ah
        mov     ds, ax
        BC_DISPLAY
        BC_FLUSH
        db      0c6h                                                    ; .
        push    es
        sub     al, byte ptr [bx+si]
        add     byte ptr [di+0dh], dh
wait_drive_ready:
        mov     bl, 11h
        mov     bh, byte ptr [bv_boot_dev]
        int     2ch
        jae     wait_drive_ready
        jmp     boot_wait_for_floppy
        mov     al, byte ptr [bv_boot_dev]
        inc     al
        cmp     al, 9
        jae     boot_dev_reset
        jmp     scsi_scan_next_id
boot_dev_reset:
        mov     byte ptr [bv_boot_dev], 0
        jmp     boot_wait_for_floppy
breakpoint_isr:                         ; IVT[1] and IVT[3]
        sti
        pusha
        push    ds
        push    es
        call    dump_registers
        BC_FLUSH
        db      0ebh                                                    ; .
        dec     byte ptr [bp+di-7514h]
        inc     si
        sbb     word ptr [si], cx
        add     word ptr [bx+si+1946h], cx
        jmp     breakpoint_isr_exit
; code (18 bytes): clear FLAGS[bp+19h] TF (no re-trap on step), pop es/ds/popa/iret
; int 4/jmp $-6 stub 0x08DF
        db      8bh, 0ech, 8ah, 46h, 19h, 24h, 0feh, 88h, 46h, 19h
breakpoint_isr_exit:
        pop     es
        pop     ds
        popa
        iret
        db      0cdh, 04h, 0ebh, 0f8h
dump_registers:                         ; AX BX CX DX BP SI DI DS ES PC CS, two columns at 0, 3Ch
        sti
        push    es
        push    ds
        push    di
        push    si
        push    bp
        push    dx
        push    cx
        push    bx
        push    ax
        mov     ax, 41ah
        mov     ds, ax
        BC_PLANE_PUSH_VIS
        BC_STATUS 0, 0, "AX:"
        pop     ax
        mov     cl, 12h
        mov     ch, 0
        BC_PUT_HEX_HIGH
        BC_STATUS 0, 8, "BX:"
        pop     ax
        mov     cl, 12h
        mov     ch, 8
        BC_PUT_HEX_HIGH
        BC_STATUS 0, 16, "CX:"
        pop     ax
        mov     cl, 12h
        mov     ch, 10h
        BC_PUT_HEX_HIGH
        BC_STATUS 0, 24, "DX:"
        pop     ax
        mov     cl, 12h
        mov     ch, 18h
        BC_PUT_HEX_HIGH
        BC_STATUS 0, 32, "BP:"
        pop     ax
        mov     cl, 12h
        mov     ch, 20h
        BC_PUT_HEX_HIGH
        BC_STATUS 60, 0, "SI:"
        pop     ax
        mov     cl, 4eh
        mov     ch, 0
        BC_PUT_HEX_HIGH
        BC_STATUS 60, 8, "DI:"
        pop     ax
        mov     cl, 4eh
        mov     ch, 8
        BC_PUT_HEX_HIGH
        BC_STATUS 60, 16, "DS:"
        pop     ax
        mov     cl, 4eh
        mov     ch, 10h
        BC_PUT_HEX_HIGH
        BC_STATUS 60, 24, "ES:"
        pop     ax
        mov     cl, 4eh
        mov     ch, 18h
        BC_PUT_HEX_HIGH
        BC_STATUS 0, 40, "PC:"
        mov     bp, sp
        mov     ax, word ptr [bp+16h]
        mov     cl, 12h
        mov     ch, 28h
        BC_PUT_HEX_HIGH
        BC_STATUS 60, 32, "CS:"
        mov     bp, sp
        mov     ax, word ptr [bp+18h]
        mov     cl, 4eh
        mov     ch, 20h
        BC_PUT_HEX_HIGH
        ret
        mov     es, word ptr [bv_mon_seg]
        mov     si, word ptr [bv_mon_off]
        int     4
        ret
monitor_isr:                            ; IVT[4]; interactive memory / sequencer-event browser
        sti
        pusha
        push    es
        push    ds
        mov     ax, 41ah
        mov     ds, ax
        mov     word ptr [bv_mon_seg], es
        mov     word ptr [bv_mon_off], si
        BC_PLANE_PUSH_VIS
        db      0c7h                                                    ; .
        push    es
        xor     dl, byte ptr [bx+si]
        or      byte ptr [bx+si], al
        mov     word ptr [bv_mon_step_seg], 0
monitor_loop:
        call    monitor_draw
        BC_FLUSH
        db      2ah                                                     ; *
        inc     word ptr [bx+si-7b01h]
        je      monitor_key
        cmp     bh, 80h
        je      monitor_exit
        cmp     bh, 81h
        je      monitor_exit
        jmp     monitor_loop
monitor_key:
        cmp     bl, 0bh
        db      74h, 0ch
monitor_exit:
        call    monitor_dispatch_key
        call    monitor_draw
        BC_FLUSH
        db      0ebh                                                    ; .
        db      0d5h                                                    ; .
        BC_PLANE_POP
        pop     ds
        pop     es
        popa
        iret
monitor_dispatch_key:
        cmp     bh, 80h
        je      monitor_cursor_fwd
        cmp     bh, 81h
        je      monitor_cursor_back
        cmp     bl, 1
        jne     L_00A41
        jmp     monitor_step_seg_1000
L_00A41:
        cmp     bl, 2
        jne     L_00A48
        jmp     monitor_step_1000
L_00A48:
        cmp     bl, 3
        jne     L_00A4F
        jmp     monitor_step_100
L_00A4F:
        cmp     bl, 4
        jne     L_00A56
        jmp     monitor_step_8
L_00A56:
        cmp     bl, 5
        jne     L_00A5D
        jmp     monitor_step_1
L_00A5D:
        cmp     bl, 6
        jne     L_00A65
        jmp     monitor_step_event
L_00A65:
        ret
monitor_cursor_fwd:
        mov     ax, word ptr [bv_mon_step_off]
        add     word ptr [bv_mon_off], ax
        mov     ax, word ptr [bv_mon_step_seg]
        add     word ptr [bv_mon_seg], ax
        call    monitor_draw
        BC_FLUSH
        db      0c3h                                                    ; .
monitor_cursor_back:
        mov     ax, word ptr [bv_mon_step_off]
        sub     word ptr [bv_mon_off], ax
        mov     ax, word ptr [bv_mon_step_seg]
        sub     word ptr [bv_mon_seg], ax
        call    monitor_draw
        BC_FLUSH
        db      0c3h                                                    ; .
monitor_step_1:
        mov     word ptr [bv_mon_step_off], 1
        mov     word ptr [bv_mon_step_seg], 0
        and     word ptr [bv_mon_off], 0fff8h
        ret
monitor_step_8:
        mov     word ptr [bv_mon_step_off], 8
        mov     word ptr [bv_mon_step_seg], 0
        ret
monitor_step_100:
        mov     word ptr [bv_mon_step_off], 100h
        mov     word ptr [bv_mon_step_seg], 0
        ret
monitor_step_1000:
        mov     word ptr [bv_mon_step_off], 1000h
        mov     word ptr [bv_mon_step_seg], 0
        ret
monitor_step_seg_1000:
        mov     word ptr [bv_mon_step_off], 0
        mov     word ptr [bv_mon_step_seg], 1000h
        and     word ptr [bv_mon_seg], 0f000h
        ret
        and     word ptr [bv_mon_seg], 8000h
        ret
monitor_step_event:
        mov     word ptr [bv_mon_step_off], 6
        mov     word ptr [bv_mon_step_seg], 0
        ret
monitor_draw:
        mov     es, word ptr [bv_mon_seg]
        mov     si, word ptr [bv_mon_off]
        mov     bl, 6
        mov     ch, 0
monitor_draw_row:
        push    bx
        mov     cl, 0
        mov     bl, 8
        cmp     word ptr [bv_mon_step_off], 6
        jne     monitor_draw_hex
        mov     bl, 6
monitor_draw_hex:
        mov     ax, es
        call    monitor_put_hex16
        add     cl, 1ah
        mov     ax, si
        call    monitor_put_hex16
        add     cl, 18h
        mov     al, 3ah
        call    monitor_putc
        add     cl, 6
        mov     di, si
monitor_draw_hex_byte:
        mov     al, byte ptr es:[si]
        call    monitor_put_hex8
        inc     si
        add     cl, 0fh
        dec     bl
        jne     monitor_draw_hex_byte
        push    es
        push    si
        push    cx
        call    monitor_draw_tail
        pop     cx
        pop     si
        pop     es
        pop     bx
        add     ch, 8
        dec     bl
        jne     monitor_draw_row
        ret
monitor_draw_tail:
        add     cl, 1
        cmp     word ptr [bv_mon_step_off], 6
        je      monitor_decode_event
        mov     bl, 8
monitor_draw_ascii:
        mov     al, byte ptr es:[di]
        cmp     al, 20h
        jae     L_00B5B
        mov     al, 2ah
L_00B5B:
        cmp     al, 7bh
        jb      L_00B61
        mov     al, 2ah
L_00B61:
        call    monitor_putc
        inc     di
        add     cl, 8
        dec     bl
        jne     monitor_draw_ascii
        ret
monitor_decode_event:                   ; renders bytes as MPC sequencer events, not hex
        mov     al, byte ptr es:[di]
        mov     dx, word ptr es:[di+1]
        mov     si, monitor_event_labels
        cmp     al, 0ffh
        je      monitor_event_label_done
        mov     si, 0bach
        cmp     al, 0feh
        je      monitor_event_label_done
        mov     si, 0bb6h
        cmp     al, 0c0h
        je      monitor_event_label_done
        and     al, 0c0h
        mov     si, 0bc0h
        cmp     al, 0
        je      monitor_event_label_done
        mov     si, 0bcah
        cmp     al, 40h
        je      monitor_event_label_done
        mov     si, 0bd4h
        cmp     al, 80h
        je      monitor_event_label_done
        ret
monitor_event_label_done:
        ret

; monitor_event_labels: six 10-byte labels INT 4 prints when decoding as MPC events:
;   0BA2 ":END [123]"  0BAC ":EOX      "  0BB6 ":BAR [123]"
;   0BC0 ":NOTE     "  0BCA ":EVNT     "  0BD4 ":EXC      "
monitor_event_labels:                   ; six 10-byte labels, see the table above
        db      ":END [123]:EOX  " ; :END [123]:EOX
        db      "    :BAR [123]:N" ;     :BAR [123]:N
        db      "OTE     :EVNT   " ; OTE     :EVNT
        db      "  :EXC      "           ;   :EXC
monitor_putc:
        pusha
        push    es
        BC_PUTCHAR
        db      07h
        popa
        ret
monitor_put_hex8:
        pusha
        push    es
        BC_PUT_HEX
        pop     es
        popa
        ret
monitor_put_hex16:
        pusha
        push    es
        BC_PUT_HEX_HIGH
        pop     es
        popa
        ret
        db      00h

; ===========================================================================
; INT 2Ch -- THE STORAGE DEVICE API (0x0BFA-0x0D8A)
; ===========================================================================
; BH = device, BL = sub-function; call routine's CARRY returned to caller
; Table selection: BH=9 -> int2ch_table_f_rom; BH<>0 -> int2ch_table_scsi
; BH=0 and dv_alt_table<>0 -> int2ch_table_dev0_alt; else int2ch_table_floppy

int2ch_dispatch:                        ; BH = device, BL = sub-function, CF returned to the caller
        sti
        push    ds
        mov     bp, 4000h
        mov     ds, bp
        mov     bp, int2ch_table_f_rom
        cmp     bh, 9
        je      int2ch_call
        mov     bp, int2ch_table_scsi
        cmp     bh, 0
        jne     int2ch_call
        mov     bp, int2ch_table_dev0_alt
        cmp     byte ptr [dv_alt_table], 0
        jne     int2ch_call
        mov     bp, int2ch_table_floppy
int2ch_call:                            ; BX = BL*2 + table base, then CALL WORD CS:[BX]
        sub     bh, bh
        shl     bx, 1
        add     bx, bp
        call    word ptr cs:[bx]
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret

; device 0, dv_alt_table=0: floppy sub-functions: 00-reset, 01-probe, 02-dir_first,
; 03-dir_next, 04-file_open, 05-read_byte, 06-read_block, 07-file_create, 08-write_byte,
; 09-write_block, 0a-file_close, 0b-flush, 0c-format, 0e-find_by_name, 0f-motor_on,
; 10-motor_off, 11-sense_status, 14-file_delete, 16-dir_prev; 0d/13/15/17-unsupported
int2ch_table_floppy:
        db      8ah, 0dh, 0c9h, 0dh, 99h, 11h, 0a3h, 11h, 0c4h, 12h, 0fah, 12h, 2eh, 13h, 0b4h, 14h
        db      5dh, 15h, 7eh, 15h, 0ddh, 16h, 36h, 17h, 0d2h, 19h, 63h, 0ch, 88h, 12h, 0d2h, 1bh
        db      0eah, 1bh, 0f0h, 17h, 84h, 0dh, 63h, 0ch, 0ach, 12h, 63h, 0ch, 0cah, 11h, 63h, 0ch
int2ch_unsupported:                     ; AX=DX=0 with CF CLEAR -- success with zero
        sub     ax, ax
        mov     dx, ax
        ret

; device 9 or alt: SCSI sub-functions: 00-init, 01-probe, 02-dir_first, 03-dir_next,
; 04-file_open, 05-read_byte, 06-read_block, 07-file_create, 08-write_byte, 09-write_block,
; 0a-file_close, 0c-format_volume, 0e-find_by_name, 11-sense_status, 14-file_delete,
; 16-dir_prev, 17-sub17; 0b/0d/12/13/15-unsupported
int2ch_table_scsi  equ     0c6ah                 ; = int2ch_table_dev0_alt + 2, see the banner below
int2ch_table_dev0_alt:
        db      8ah, 0dh, 0d4h, 1ch, 0dbh, 1ch, 55h, 1fh, 74h, 1fh, 70h, 20h, 95h, 20h, 0c9h, 20h
        db      9ah, 21h, 19h, 22h, 47h, 22h, 9fh, 22h, 9ah, 0ch, 1ch, 24h, 9ah, 0ch, 88h, 12h
        db      0d2h, 1bh, 0eah, 1bh, 25h, 25h, 9ah, 0ch, 9ah, 0ch, 0adh, 23h, 9ah, 0ch, 0b5h, 1fh
        db      42h, 1fh
int2ch_unsupported_scsi:
        sub     ax, ax
        mov     dx, ax
        ret

; device 9: 01-probe, 04-file_open, 06-read_block, 0a-file_close; others-unsupported
int2ch_table_f_rom:
        db      0cfh, 0ch, 0d6h, 0ch, 0cfh, 0ch, 0cfh, 0ch, 0f7h, 0ch, 0cfh, 0ch, 11h, 0dh, 0cfh, 0ch
        db      0cfh, 0ch, 0cfh, 0ch, 5dh, 0dh, 0cfh, 0ch, 0cfh, 0ch, 0cfh, 0ch, 0cfh, 0ch, 0cfh, 0ch
        db      0cfh, 0ch, 0cfh, 0ch, 0cfh, 0ch, 0cfh, 0ch, 0cfh, 0ch, 0cfh, 0ch, 0cfh, 0ch, 0cfh, 0ch

; ===========================================================================
; DEVICE 9 -- THE F-ROM BOOT DEVICE (0x0CCF-0x0D84)
; ===========================================================================
; five F-ROM sub-functions; all others unsupported (AX=20h CF); frm_probe: 8 words
; offset 0->0100:0000 need "MPC2000" literal; frm_file_open: 0x27FFF image from offset 8
; optional FMX008M board

frm_unsupported:                        ; AX=20h, CF set
        mov     ax, 20h
        sub     dx, dx
        stc
        ret
frm_probe:                              ; requires the literal "MPC2000" at F-ROM offset 0
        mov     ax, 100h
        mov     es, ax
        mov     di, 0
        mov     si, 0
        mov     cx, 8
        push    ds
        pusha
        call    smem_read
        popa
        pop     ds
        call    cs_literal_compare
        dec     bp
        push    ax
        inc     bx
        xor     dh, byte ptr [bx+si]
        xor     byte ptr [bx+si], dh
        db      00h, 0c3h
frm_file_open:                          ; fixed image: F-ROM offset 8, length 27FFFh
        mov     word ptr [dv_frm_addr], 8
        mov     word ptr [dv_frm_addr_seg], 100h
        mov     word ptr [dv_frm_remain], 7fffh
        mov     word ptr [dv_frm_remain_hi], 2
        clc
        ret
frm_read_block:                         ; 32-bit clamp on dv_frm_remain, then smem_read + REP MOVSW
        mov     ax, word ptr [dv_frm_remain]
        or      ax, word ptr [dv_frm_remain_hi]
        jne     frm_read_clip
        ret
frm_read_clip:
        sub     word ptr [dv_frm_remain], cx
        sbb     word ptr [dv_frm_remain_hi], 0
        jae     frm_read_fetch
        add     cx, word ptr [dv_frm_remain]
        mov     word ptr [dv_frm_remain], 0
        mov     word ptr [dv_frm_remain_hi], 0
frm_read_fetch:
        push    es
        push    di
        push    cx
        mov     si, 0
        push    si
        push    ds
        shr     cx, 1
        les     di, [dv_frm_addr]
        call    smem_read
        pop     ds
        pop     si
        pop     cx
        pop     di
        pop     es
        mov     ax, cx
        shr     cx, 1
        add     word ptr [dv_frm_addr], cx
        adc     word ptr [dv_frm_addr_seg], 0
        rep movsw
        clc
        ret
frm_file_close:
        ret
cs_literal_compare:                     ; compare DS:SI against NUL-terminated literal inline after the CALL
        pop     bp
        mov     dx, si
cs_literal_compare_loop:
        mov     al, byte ptr cs:[bp]
        inc     bp
        or      al, al
        je      cs_literal_match
        mov     ah, byte ptr [si]
        inc     si
        cmp     ah, al
        je      cs_literal_compare_loop
cs_literal_skip:
        mov     al, byte ptr cs:[bp]
        inc     bp
        or      al, al
        jne     cs_literal_skip
        mov     si, dx
        stc
        jmp     bp
cs_literal_match:
        mov     si, dx
        clc
        jmp     bp

; ===========================================================================
; uPD765-FAMILY FLOPPY DRIVER (0x0D84-0x0E1C, 0x17F0-0x1C9D)
; ===========================================================================
; Port 20h = main status register on read, auxiliary command register on
; write (36h = soft reset, 1Eh/0Eh = motor on/off, 4Fh/4Bh = drive and
; density select).  Port 22h = the FIFO.  The data path is the MPC ASIC
; DMA block at 0C030h-0C03Fh, whose count register takes BYTES MINUS ONE
; and which terminates every multi-sector transfer.  Not SCSI -- the real
; SCSI port is the MB89352 at 00h-1Ch even, driven through INT 2Dh.

fdc_set_command_complete:               ; two bytes; the whole synchronous driver hangs off this flag
        mov     byte ptr [dv_cmd_done], 1
        ret
fdc_reset:                              ; AUX 36h, zero dv_vars, SPECIFY 03 C4 14, AUX 4Bh, then INT 2Dh AH=0
        mov     al, 36h
        out     20h, al
        mov     ax, ds
        mov     es, ax
        mov     di, dv_vars
        mov     cx, 82h
        sub     ax, ax
        rep stosw
        mov     byte ptr [dv_cmd_len], 3
        mov     byte ptr [dv_cmd_buf], 3
        mov     byte ptr [dv_cmd_hds], 0c4h
        mov     byte ptr [dv_cmd_c], 14h
        call    fdc_send_command
        mov     ah, 4bh
        call    fdc_aux_write
        mov     byte ptr [dv_file_state], 0
        mov     byte ptr [dv_cmd_done], 0
        mov     ah, 0
        int     2dh
        or      ax, ax
        ret
disk_probe:                             ; reset, spin up, recalibrate, seek cyl 3, sense, then try six geometries
        call    fdc_reset
        call    drive_spinup_and_recal
        mov     dx, 0
        ret
drive_spinup_and_recal:
        call    drive_motor_on
        call    fdc_recalibrate
        mov     ax, 0
        jae     L_00DDF
        ret
L_00DDF:
        mov     al, 3
        call    fdc_seek
        mov     ax, 0
        jae     L_00DEA
        ret
L_00DEA:
        call    fdc_sense_drive_status
        mov     ax, 0
        jae     L_00DF3
        ret
L_00DF3:
        call    media_1440k
        jne     L_00DF9
        ret
L_00DF9:
        call    media_720k
        jne     L_00DFF
        ret
L_00DFF:
        call    media_1232k_n3
        jne     L_00E05
        ret
L_00E05:
        call    media_640k_n3
        jne     L_00E0B
        ret
L_00E0B:
        call    media_640k
        jne     L_00E11
        ret
L_00E11:
        call    media_800k
        jne     L_00E17
        ret
L_00E17:
        mov     ax, 1
        stc
        ret

; ===========================================================================
; MEDIA GEOMETRY CANDIDATES  (0x0E1C-0x1163)
; ===========================================================================
; tries these six, uses first with matching BPB; writes geometry into dv_xxx,
; sets drive/density via 2 aux; reads cyl 0; compares vs 0x1ACA templates
;   media_1440k     512 B/sec, 18 spt, 1 sec/clus   HD   dv_alt_table=0
;   media_720k      512 B/sec,  9 spt, 2 sec/clus   DD   dv_alt_table=0
;   media_1232k_n3 1024 B/sec, 10 spt, 1 sec/clus   HD   dv_alt_table=1
;   media_640k_n3  1024 B/sec,  5 spt, 1 sec/clus   DD   dv_alt_table=1
;   media_640k      512 B/sec,  8 spt, 2 sec/clus   DD   dv_alt_table=0
;   media_800k      512 B/sec, 10 spt, 2 sec/clus   DD   dv_alt_table=0

media_1440k:
        mov     byte ptr [dv_sector_n], 2
        mov     byte ptr [dv_sec_per_trk], 12h
        mov     byte ptr [dv_gpl], 1bh
        mov     byte ptr [dv_dtl], 0ffh
        mov     word ptr [dv_fat_off], 200h
        mov     word ptr [dv_fat_len], 1200h
        mov     word ptr [dv_cluster_count], 0b1fh
        mov     word ptr [dv_data_start], 21h
        mov     word ptr [dv_sec_per_clus], 1
        mov     word ptr [dv_bytes_per_sec], 200h
        mov     word ptr [dv_dir_start], 2600h
        mov     word ptr [dv_dir_end], 4200h
        mov     byte ptr [dv_density], 1
        mov     byte ptr [dv_alt_table], 0
        mov     byte ptr [dv_fmt_n], 2
        mov     byte ptr [dv_fmt_sc], 12h
        mov     byte ptr [dv_fmt_gpl], 54h
        mov     byte ptr [dv_fmt_filler], 0f6h
        mov     ah, 4fh
        call    fdc_aux_write
        mov     ah, 4bh
        call    fdc_aux_write
        call    read_boot_cylinder
        je      L_00E8E
        ret
L_00E8E:
        mov     di, 1acah
        mov     si, 0
        mov     bx, cs
        mov     es, bx
        mov     cx, 1ch
        repe cmpsb
        mov     al, 6
        mov     ah, 1
        jne     L_00EA4
        ret
L_00EA4:
        mov     di, 1ad5h
        call    bpb_compare_fields
        je      L_00EAD
        ret
L_00EAD:
        mov     si, 20h
        mov     cx, 0f0h
        sub     bx, bx
L_00EB5:
        lodsw
        or      bx, ax
        loop    L_00EB5
        or      bx, bx
        mov     al, 4
        mov     ah, 1
        jne     L_00EC3
        ret
L_00EC3:
        mov     al, 2
        mov     ah, 1
        sub     bx, bx
        ret
media_720k:
        mov     byte ptr [dv_sector_n], 2
        mov     byte ptr [dv_sec_per_trk], 9
        mov     byte ptr [dv_gpl], 1bh
        mov     byte ptr [dv_dtl], 0ffh
        mov     word ptr [dv_fat_off], 200h
        mov     word ptr [dv_fat_len], 600h
        mov     word ptr [dv_cluster_count], 2c9h
        mov     word ptr [dv_data_start], 0eh
        mov     word ptr [dv_sec_per_clus], 2
        mov     word ptr [dv_bytes_per_sec], 200h
        mov     word ptr [dv_dir_start], 0e00h
        mov     word ptr [dv_dir_end], 1c00h
        mov     byte ptr [dv_density], 0
        mov     byte ptr [dv_alt_table], 0
        mov     byte ptr [dv_fmt_n], 2
        mov     byte ptr [dv_fmt_sc], 9
        mov     byte ptr [dv_fmt_gpl], 54h
        mov     byte ptr [dv_fmt_filler], 0e5h
        mov     ah, 4fh
        call    fdc_aux_write
        mov     ah, 0bh
        call    fdc_aux_write
        call    read_boot_cylinder
        je      L_00F3C
        ret
L_00F3C:
        mov     di, 1af1h
        call    bpb_compare_fields
        mov     al, 3
        mov     ah, 1
        ret
media_1232k_n3:
        mov     byte ptr [dv_sector_n], 3
        mov     byte ptr [dv_sec_per_trk], 0ah
        mov     byte ptr [dv_gpl], 35h
        mov     byte ptr [dv_dtl], 0ffh
        mov     word ptr [dv_fat_off], 600h
        mov     word ptr [dv_fat_len], 0c80h
        mov     word ptr [dv_cluster_count], 62fh
        mov     word ptr [dv_data_start], 11h
        mov     word ptr [dv_sec_per_clus], 1
        mov     word ptr [dv_bytes_per_sec], 400h
        mov     word ptr [dv_dir_start], 1400h
        mov     word ptr [dv_dir_end], 3000h
        mov     byte ptr [dv_density], 1
        mov     byte ptr [dv_alt_table], 1
        mov     byte ptr [dv_fmt_n], 3
        mov     byte ptr [dv_fmt_sc], 0ah
        mov     byte ptr [dv_fmt_gpl], 90h
        mov     byte ptr [dv_fmt_filler], 0f6h
        mov     ah, 5fh
        call    fdc_aux_write
        mov     ah, 4bh
        call    fdc_aux_write
        call    read_boot_cylinder
        je      L_00FB9
        ret
L_00FB9:
        cmp     byte ptr [10h], 0ffh
        mov     al, 8
        mov     ah, 3
        jne     L_00FC5
        ret
L_00FC5:
        mov     word ptr [dv_dir_start], 0
        mov     word ptr [dv_dir_end], 600h
        mov     al, 0ah
        mov     ah, 4
        sub     bx, bx
        ret
media_640k_n3:
        mov     byte ptr [dv_sector_n], 3
        mov     byte ptr [dv_sec_per_trk], 5
        mov     byte ptr [dv_gpl], 35h
        mov     byte ptr [dv_dtl], 0ffh
        mov     word ptr [dv_fat_off], 600h
        mov     word ptr [dv_fat_len], 640h
        mov     word ptr [dv_cluster_count], 30fh
        mov     word ptr [dv_data_start], 11h
        mov     word ptr [dv_sec_per_clus], 1
        mov     word ptr [dv_bytes_per_sec], 400h
        mov     word ptr [dv_dir_start], 1400h
        mov     word ptr [dv_dir_end], 4400h
        mov     byte ptr [dv_density], 0
        mov     byte ptr [dv_alt_table], 1
        mov     byte ptr [dv_fmt_n], 3
        mov     byte ptr [dv_fmt_sc], 5
        mov     byte ptr [dv_fmt_gpl], 90h
        mov     byte ptr [dv_fmt_filler], 0e5h
        mov     ah, 4fh
        call    fdc_aux_write
        mov     ah, 0bh
        call    fdc_aux_write
        call    read_boot_cylinder
        je      L_0104A
        ret
L_0104A:
        cmp     byte ptr [10h], 0ffh
        mov     al, 9
        mov     ah, 3
        jne     L_01056
        ret
L_01056:
        mov     word ptr [dv_dir_start], 0
        mov     word ptr [dv_dir_end], 600h
        mov     al, 0bh
        mov     ah, 4
        sub     bx, bx
        ret
media_640k:
        mov     byte ptr [dv_sector_n], 2
        mov     byte ptr [dv_sec_per_trk], 8
        mov     byte ptr [dv_gpl], 1bh
        mov     byte ptr [dv_dtl], 0ffh
        mov     word ptr [dv_fat_off], 200h
        mov     word ptr [dv_fat_len], 600h
        mov     word ptr [dv_cluster_count], 27ah
        mov     word ptr [dv_data_start], 0ch
        mov     word ptr [dv_sec_per_clus], 2
        mov     word ptr [dv_bytes_per_sec], 200h
        mov     word ptr [dv_dir_start], 0a00h
        mov     word ptr [dv_dir_end], 1800h
        mov     byte ptr [dv_density], 0
        mov     byte ptr [dv_alt_table], 0
        mov     byte ptr [dv_fmt_n], 2
        mov     byte ptr [dv_fmt_sc], 8
        mov     byte ptr [dv_fmt_gpl], 54h
        mov     byte ptr [dv_fmt_filler], 0e5h
        mov     ah, 4fh
        call    fdc_aux_write
        mov     ah, 0bh
        call    fdc_aux_write
        call    read_boot_cylinder
        je      L_010DB
        ret
L_010DB:
        mov     di, 1b0dh
        call    bpb_compare_fields
        mov     al, 0ch
        mov     ah, 1
        ret
media_800k:
        mov     byte ptr [dv_sector_n], 2
        mov     byte ptr [dv_sec_per_trk], 0ah
        mov     byte ptr [dv_gpl], 1bh
        mov     byte ptr [dv_dtl], 0ffh
        mov     word ptr [dv_fat_off], 200h
        mov     word ptr [dv_fat_len], 600h
        mov     word ptr [dv_cluster_count], 319h
        mov     word ptr [dv_data_start], 0eh
        mov     word ptr [dv_sec_per_clus], 2
        mov     word ptr [dv_bytes_per_sec], 200h
        mov     word ptr [dv_dir_start], 0e00h
        mov     word ptr [dv_dir_end], 1c00h
        mov     byte ptr [dv_density], 0
        mov     byte ptr [dv_alt_table], 0
        mov     byte ptr [dv_fmt_n], 2
        mov     byte ptr [dv_fmt_sc], 0ah
        mov     byte ptr [dv_fmt_gpl], 54h
        mov     byte ptr [dv_fmt_filler], 0e5h
        mov     ah, 4fh
        call    fdc_aux_write
        mov     ah, 0bh
        call    fdc_aux_write
        call    read_boot_cylinder
        je      L_01158
        ret
L_01158:
        mov     di, 1b29h
        call    bpb_compare_fields
        mov     al, 5
        mov     ah, 1
        ret

; ===========================================================================
; FAT12 FILESYSTEM  (0x1163-0x17F0)
; ===========================================================================
; FAT12 reader/writer layered on floppy; root directory only;
; dir_entry_usable ignores DIRECTORY attribute; dir entries: +0Bh attr,
; +16h-+19h time/date, +1Ah cluster start, +1Ch/+1Eh 32-bit size

read_boot_cylinder:                     ; read all of cylinder 0 into dv_boot_sector -- both heads
        mov     ax, 0
        call    sector_to_chs_read
        mov     ch, byte ptr [dv_sec_per_trk]
        add     ch, ch
        cmp     byte ptr [dv_sector_n], 3
        jne     L_01178
        shl     ch, 1
L_01178:
        sub     cl, cl
        mov     ax, ds
        mov     es, ax
        mov     di, 0
        mov     si, 5000h
        rep movsw
        and     byte ptr [dv_result], 0c0h
        ret
bpb_compare_fields:                     ; 11h bytes from 0Bh: BPB only, skip jump and OEM
        mov     si, 0bh
        mov     bx, cs
        mov     es, bx
        mov     cx, 11h
        repe cmpsb
        ret
dir_first:                              ; position on the first usable root-directory entry
        mov     si, word ptr [dv_dir_start]
        mov     word ptr [dv_dir_cursor], si
        jmp     dir_advance
dir_next:                               ; +20h then the shared filter; CF set at end of directory
        mov     si, word ptr [dv_dir_cursor]
L_011A7:
        cmp     si, word ptr [dv_dir_end]
        je      L_011C8
        cmp     byte ptr [si], 0
        je      L_011C8
        add     si, 20h
dir_advance:
        cmp     byte ptr [si], 0
        je      L_011C8
        call    dir_entry_usable
        jb      L_011A7
        mov     word ptr [dv_dir_cursor], si
        call    dir_format_name
        clc
        ret
L_011C8:
        stc
        ret
dir_prev:                               ; -20h backward walk; ?
        mov     si, word ptr [dv_dir_cursor]
L_011CE:
        cmp     si, word ptr [dv_dir_start]
        je      L_011E5
        sub     si, 20h
        call    dir_entry_usable
        jb      L_011CE
        mov     word ptr [dv_dir_cursor], si
        call    dir_format_name
        clc
        ret
L_011E5:
        stc
        ret
dir_entry_usable:                       ; CF = skip; rejects 00h/0E5h/05h/2Eh names and attr bits 1..3
        mov     al, byte ptr [si]
        cmp     al, 0
        je      L_01201
        cmp     al, 0e5h
        je      L_01201
        cmp     al, 5
        je      L_01201
        cmp     al, 2eh
        je      L_01201
        test    byte ptr [si+0bh], 0eh
        jne     L_01201
        clc
        ret
L_01201:
        stc
        ret
dir_format_name:                        ; 8.3 -> fixed 20-byte dotted form at dv_name_buf; returns the size
        mov     di, dv_name_buf
L_01206:
        mov     ax, ds
        mov     es, ax
        push    di
        push    di
        mov     cx, 14h
        mov     al, 20h
        rep stosb
        pop     di
        mov     dx, si
        mov     bx, di
        mov     cx, 8
        rep movsb
        add     si, 4
        call    name_is_printable
        jb      L_0122A
        mov     cx, 8
        rep movsb
L_0122A:
        mov     si, dx
        mov     di, bx
        add     si, 8
        add     di, 10h
        mov     al, 2eh
        stosb
        mov     cx, 3
        rep movsb
        mov     si, dx
        mov     bx, word ptr [si+1ch]
        mov     dx, word ptr [si+1eh]
        pop     si
        ret
name_is_printable:                      ; 8 bytes all in 20h..7Ah
        push    si
        push    cx
        mov     cx, 8
L_0124B:
        cmp     byte ptr [si], 20h
        jb      L_0125C
        cmp     byte ptr [si], 7bh
        jae     L_0125C
        inc     si
        loop    L_0124B
        pop     cx
        pop     si
        clc
        ret
L_0125C:
        pop     cx
        pop     si
        stc
        ret
dir_find_free_entry:                    ; dir_first then walk to a 00h/05h/0E5h name byte; DI = entry, CF = full
        call    dir_first
        mov     si, word ptr [dv_dir_cursor]
        sub     si, 20h
L_0126A:
        add     si, 20h
        cmp     si, word ptr [dv_dir_end]
        je      L_01286
        cmp     byte ptr [si], 0
        je      L_01282
        cmp     byte ptr [si], 5
        je      L_01282
        cmp     byte ptr [si], 0e5h
        jne     L_0126A
L_01282:
        mov     di, si
        clc
        ret
L_01286:
        stc
        ret
dir_find_by_name:                       ; REPE CMPSB dv_name_buf against ES:DI, walking with dir_next
        push    si
        push    es
        call    dir_first
        pop     es
        pop     di
L_0128F:
        pusha
        mov     si, 0f8cch
        mov     cx, 14h
        repe cmpsb
        popa
        mov     ax, 0
        jne     L_0129F
        ret
L_0129F:
        push    es
        push    di
        call    dir_next
        pop     di
        pop     es
        jae     L_0128F
        mov     ax, 0ffffh
        ret
file_delete:                            ; mark 0E5h, free the chain, flush
        call    dir_find_by_name
        jae     L_012B2
        ret
L_012B2:
        mov     si, word ptr [dv_dir_cursor]
        mov     byte ptr [si], 0e5h
        mov     ax, word ptr [si+1ah]
        call    fat12_free_chain
        call    flush_system_area
        clc
        ret
file_open:                              ; start cluster from +1Ah, 32-bit size from +1Ch/+1Eh
        call    dir_find_by_name
        mov     ax, 0ffffh
        jae     L_012CD
        ret
L_012CD:
        mov     si, word ptr [dv_dir_cursor]
        mov     ax, word ptr [si+1ah]
        mov     word ptr [dv_cur_cluster], ax
        sub     ax, ax
        mov     word ptr [dv_buf_left], ax
        mov     word ptr [dv_cur_lba], ax
        mov     word ptr [dv_clus_sec_left], ax
        mov     word ptr [dv_win_first], ax
        mov     word ptr [dv_win_last], ax
        mov     bx, word ptr [si+1ch]
        mov     dx, word ptr [si+1eh]
        mov     word ptr [dv_remain_lo], bx
        mov     word ptr [dv_remain_hi], dx
        sub     ax, ax
        clc
        ret
read_byte:                              ; one byte from dv_buf_ptr, refilling when dv_buf_left hits 0
        mov     ax, word ptr [dv_remain_lo]
        or      ax, word ptr [dv_remain_hi]
        je      L_01329
        sub     word ptr [dv_remain_lo], 1
        sbb     word ptr [dv_remain_hi], 0
        cmp     word ptr [dv_buf_left], 0
        jne     L_01317
        call    buffer_refill
L_01317:
        mov     si, word ptr [dv_buf_ptr]
        mov     al, byte ptr [si]
        inc     word ptr [dv_buf_ptr]
        dec     word ptr [dv_buf_left]
        mov     ah, 0
        clc
        ret
L_01329:
        mov     ax, 0ffffh
        stc
        ret
read_block:                             ; CX bytes to ES:DI, clipped to the file size; returns bytes moved
        mov     ax, word ptr [dv_remain_lo]
        or      ax, word ptr [dv_remain_hi]
        jne     L_01338
        ret
L_01338:
        sub     word ptr [dv_remain_lo], cx
        sbb     word ptr [dv_remain_hi], 0
        jae     L_01353
        add     cx, word ptr [dv_remain_lo]
        mov     word ptr [dv_remain_lo], 0
        mov     word ptr [dv_remain_hi], 0
L_01353:
        push    cx
        call    L_0135A
        pop     ax
        clc
        ret
L_0135A:
        cmp     cx, word ptr [dv_buf_left]
        jbe     L_01385
        sub     cx, word ptr [dv_buf_left]
        push    cx
        mov     cx, word ptr [dv_buf_left]
        mov     word ptr [dv_buf_left], 0
        mov     si, word ptr [dv_buf_ptr]
        rep movsb
        push    di
        push    es
        call    buffer_refill
        pop     es
        pop     di
        pop     cx
        cmp     word ptr [dv_buf_left], 0
        jne     L_0135A
        ret
L_01385:
        sub     word ptr [dv_buf_left], cx
        mov     si, word ptr [dv_buf_ptr]
        rep movsb
        mov     word ptr [dv_buf_ptr], si
        ret
        mov     ax, word ptr [dv_remain_lo]
        or      ax, word ptr [dv_remain_hi]
        jne     L_0139E
        ret
L_0139E:
        sub     word ptr [dv_remain_lo], cx
        sbb     word ptr [dv_remain_hi], 0
        jae     L_013B9
        add     cx, word ptr [dv_remain_lo]
        mov     word ptr [dv_remain_lo], 0
        mov     word ptr [dv_remain_hi], 0
L_013B9:
        push    cx
        call    L_013C0
        pop     ax
        clc
        ret
L_013C0:
        cmp     cx, word ptr [dv_buf_left]
        jbe     L_013EB
        sub     cx, word ptr [dv_buf_left]
        push    cx
        mov     cx, word ptr [dv_buf_left]
        mov     word ptr [dv_buf_left], 0
        mov     si, word ptr [dv_buf_ptr]
        rep lodsb
        push    di
        push    es
        call    buffer_refill
        pop     es
        pop     di
        pop     cx
        cmp     word ptr [dv_buf_left], 0
        jne     L_013C0
        ret
L_013EB:
        sub     word ptr [dv_buf_left], cx
        mov     si, word ptr [dv_buf_ptr]
        rep lodsb
        mov     word ptr [dv_buf_ptr], si
        ret
buffer_refill:                          ; cluster chain + disk read; 0FF6h is the FAT12 end-of-chain test
        mov     ax, word ptr [dv_cur_lba]
        cmp     word ptr [dv_clus_sec_left], 0
        jne     L_01412
        mov     ax, word ptr [dv_cur_cluster]
        mov     bx, 0ff6h
        sub     bx, ax
        jae     L_0140F
        ret
L_0140F:
        call    cluster_to_sector
L_01412:
        cmp     ax, word ptr [dv_win_first]
        jb      L_01443
        cmp     ax, word ptr [dv_win_last]
        jae     L_01443
        sub     ax, word ptr [dv_win_first]
        mov     ah, al
        sub     al, al
        shl     ax, 1
        add     ax, 5000h
        mov     word ptr [dv_buf_ptr], ax
        mov     word ptr [dv_buf_left], 200h
        inc     word ptr [dv_cur_lba]
        dec     word ptr [dv_clus_sec_left]
        je      L_0143F
        ret
L_0143F:
        call    fat12_next_cluster
        ret
L_01443:
        call    sector_to_chs_read
        test    byte ptr [dv_result], 0c0h
        je      buffer_refill
        mov     al, byte ptr [dv_result]
        jmp     disk_read_error
fat12_next_cluster:                     ; classic 12-bit packed lookup: BX = cluster*3/2 + dv_fat_off
        mov     ax, word ptr [dv_cur_cluster]
        mov     bx, ax
        shr     bx, 1
        pushf
        add     bx, ax
        add     bx, word ptr [dv_fat_off]
        mov     ax, word ptr [bx]
        popf
        jae     L_01469
        shr     ax, 4
L_01469:
        and     ah, 0fh
        mov     word ptr [dv_cur_cluster], ax
        ret
cluster_to_sector:                      ; (cluster-2)*dv_sec_per_clus + dv_data_start
        sub     ax, 2
        mov     bx, word ptr [dv_sec_per_clus]
        mul     bx
        add     ax, word ptr [dv_data_start]
        mov     word ptr [dv_cur_lba], ax
        mov     word ptr [dv_clus_sec_left], bx
        ret
sector_to_chs_read:                     ; LBA -> CHS, then read to the end of the CYLINDER in one transfer
        push    ax
        mov     bh, byte ptr [dv_sec_per_trk]
        div     bh
        mov     bl, ah
        sub     ah, ah
        shr     al, 1
        rcl     ah, 1
        sub     bh, bl
        cmp     ah, 0
        jne     L_0149F
        add     bh, byte ptr [dv_sec_per_trk]
L_0149F:
        inc     bl
        push    bx
        call    fdc_read_sectors
        pop     bx
        mov     bl, bh
        sub     bh, bh
        pop     ax
        mov     word ptr [dv_win_first], ax
        add     ax, bx
        mov     word ptr [dv_win_last], ax
        ret
file_create:                            ; WP check, allocate a dir entry and the first cluster, dv_file_state = 2
        cmp     byte ptr [dv_write_protect], 0
        jne     L_0150D
        push    es
        push    si
        call    dir_find_free_entry
        sub     al, al
        mov     byte ptr [si+16h], al
        mov     byte ptr [si+17h], al
        mov     byte ptr [si+18h], al
        mov     byte ptr [si+19h], al
        pop     si
        pop     es
        jb      L_01512
        mov     word ptr [dv_dir_entry], di
        push    es
        push    si
        push    di
        call    fat12_alloc_first_cluster
        pop     di
        pop     si
        pop     es
        jb      L_01517
        mov     word ptr [dv_cur_cluster], ax
        mov     word ptr [di+1ah], ax
        call    L_0151C
        sub     ax, ax
        mov     word ptr [di+1ch], ax
        mov     word ptr [di+1eh], ax
        mov     byte ptr [di+0bh], al
        call    write_window_advance
        mov     ax, word ptr [dv_wr_ptr]
        mov     word ptr [dv_wr_base], ax
        mov     ax, word ptr [dv_wr_win]
        mov     word ptr [dv_win_first], ax
        mov     byte ptr [dv_file_state], 2
        sub     ax, ax
        clc
        ret
L_0150D:
        mov     ax, 1
        stc
        ret
L_01512:
        mov     ax, 2
        stc
        ret
L_01517:
        mov     ax, 3
        stc
        ret
L_0151C:
        push    di
        push    ds
        mov     ax, ds
        mov     bx, es
        mov     es, ax
        mov     ds, bx
        mov     cx, 8
        rep movsb
        push    di
        call    L_01539
        pop     di
        inc     si
        mov     cx, 3
        rep movsb
        pop     ds
        pop     di
        ret
L_01539:
        push    si
        mov     cx, 8
        mov     al, 0
L_0153F:
        or      al, byte ptr [si]
        inc     si
        loop    L_0153F
        pop     si
        add     di, 4
        cmp     al, 20h
        je      L_01552
        mov     cx, 8
        rep movsb
        ret
L_01552:
        mov     al, 0
        mov     cx, 8
        rep stosb
        add     si, 8
        ret
write_byte:                             ; store at dv_wr_ptr, bump the dir entry size, flush when full
        mov     di, word ptr [dv_dir_entry]
        add     word ptr [di+1ch], 1
        adc     word ptr [di+1eh], 0
        mov     di, word ptr [dv_wr_ptr]
        mov     byte ptr [di], al
        inc     word ptr [dv_wr_ptr]
        dec     word ptr [dv_wr_left]
        je      L_0157A
        ret
L_0157A:
        call    write_buffer_flush
        ret
write_block:                            ; CX bytes, flushing dv_cyl_buffer as it fills
        mov     di, word ptr [dv_dir_entry]
        add     word ptr [di+1ch], cx
        adc     word ptr [di+1eh], 0
        mov     di, word ptr [dv_dir_entry]
L_0158D:
        cmp     cx, 0
        je      L_015EC
        cmp     cx, word ptr [dv_wr_left]
        jbe     L_015C6
        sub     cx, word ptr [dv_wr_left]
        push    cx
        mov     cx, word ptr [dv_wr_left]
        mov     di, word ptr [dv_wr_ptr]
        add     word ptr [dv_wr_ptr], cx
        mov     word ptr [dv_wr_left], 0
        mov     ax, ds
        mov     bx, es
        mov     es, ax
        mov     ds, bx
        rep movsb
        mov     es, bx
        mov     ds, ax
        call    write_buffer_flush
        pop     cx
        jae     L_0158D
        jmp     L_01517
L_015C6:
        sub     word ptr [dv_wr_left], cx
        pushf
        mov     di, word ptr [dv_wr_ptr]
        add     word ptr [dv_wr_ptr], cx
        mov     ax, ds
        mov     bx, es
        mov     es, ax
        mov     ds, bx
        rep movsb
        mov     es, bx
        mov     ds, ax
        popf
        jne     L_015EC
        call    write_buffer_flush
        jae     L_015EC
        jmp     L_01517
L_015EC:
        sub     ax, ax
        ret
        mov     di, word ptr [dv_dir_cursor]
        call    L_0151C
        jmp     flush_system_area
write_buffer_flush:                     ; write the buffer out, advance the window; on failure undo the file
        push    si
        call    fat12_extend_chain
        pop     si
        jae     L_01602
        jmp     L_0161F
L_01602:
        call    write_window_advance
        jb      L_01608
        ret
L_01608:
        push    cx
        push    si
        push    es
        call    write_flush_partial
        mov     ax, word ptr [dv_wr_ptr]
        mov     word ptr [dv_wr_base], ax
        mov     ax, word ptr [dv_wr_win]
        mov     word ptr [dv_win_first], ax
        pop     es
        pop     si
        pop     cx
        clc
        ret
L_0161F:
        mov     di, word ptr [dv_dir_entry]
        mov     byte ptr [di], 0
        mov     ax, word ptr [di+1ah]
        call    fat12_free_chain
        stc
        ret
write_window_advance:                   ; cluster_to_sector on dv_cur_cluster, then set up the write window
        mov     ax, word ptr [dv_wr_ptr]
        mov     word ptr [0f8c2h], ax
        push    word ptr [dv_wr_ptr]
        push    word ptr [0f8cah]
        mov     ax, word ptr [dv_cur_cluster]
        call    cluster_to_sector
        mov     word ptr [dv_wr_win], ax
        mov     bl, byte ptr [dv_sec_per_trk]
        add     bl, bl
        div     bl
        mov     bl, ah
        sub     bh, bh
        sub     ah, ah
        mov     word ptr [0f8cah], ax
        mov     ax, word ptr [dv_bytes_per_sec]
        push    ax
        mul     bx
        add     ax, 5000h
        mov     word ptr [dv_wr_ptr], ax
        mov     ax, word ptr [dv_sec_per_clus]
        pop     dx
        mul     dx
        mov     word ptr [dv_wr_left], ax
        pop     bx
        pop     ax
        cmp     bx, word ptr [0f8cah]
        jne     L_0167B
        cmp     ax, word ptr [dv_wr_ptr]
        jne     L_0167B
        clc
        ret
L_0167B:
        stc
        ret
write_flush_partial:                    ; write dv_wr_base..dv_wr_ptr back out, whole sectors only
        mov     ax, word ptr [0f8c2h]
        sub     ax, word ptr [dv_wr_base]
        jne     L_01687
        ret
L_01687:
        mov     bx, word ptr [dv_bytes_per_sec]
        div     bx
        mov     bh, al
        mov     ax, word ptr [dv_win_first]
        mov     bl, byte ptr [dv_sec_per_trk]
        div     bl
        mov     bl, ah
        sub     ah, ah
        shr     al, 1
        rcl     ah, 1
        inc     bl
        mov     si, word ptr [dv_wr_base]
        call    fdc_write_sectors
        ret
fat12_extend_chain:                     ; allocate the next cluster and link it in, 12-bit packed
        mov     cx, word ptr [dv_cur_cluster]
        call    fat12_alloc_cluster
        jae     L_016B4
        ret
L_016B4:
        mov     cx, ax
        xchg    word ptr [dv_cur_cluster], ax
        mov     bx, ax
        shr     bx, 1
        pushf
        add     bx, ax
        add     bx, word ptr [dv_fat_off]
        mov     ax, word ptr [bx]
        popf
        jae     L_016D5
        shl     cx, 4
        and     ax, 0fh
        or      ax, cx
        mov     word ptr [bx], ax
        ret
L_016D5:
        and     ax, 0f000h
        or      ax, cx
        mov     word ptr [bx], ax
        ret
file_close:                             ; zero-pad the cluster, mirror the FAT, set attr 20h, write the system area
        sub     ax, ax
        xchg    byte ptr [dv_file_state], al
        cmp     al, 2
        jne     L_0170F
        mov     di, word ptr [dv_wr_ptr]
        mov     cx, word ptr [dv_wr_left]
        mov     ax, ds
        mov     es, ax
        mov     al, 0
        rep stosb
        mov     word ptr [dv_wr_ptr], di
        call    write_window_advance
        call    write_flush_partial
        mov     si, word ptr [dv_dir_entry]
        mov     byte ptr [si+0bh], 20h
        call    fat_mirror
        call    write_system_area
L_0170F:
        clc
        ret
fat_mirror:                             ; copy FAT1 over FAT2
        mov     ax, ds
        mov     es, ax
        mov     cx, word ptr [dv_fat_len]
        mov     si, word ptr [dv_fat_off]
        mov     di, si
        add     di, cx
        shr     cx, 1
        rep movsw
        ret
write_system_area:                      ; write boot sector + FATs + root back out
        mov     ax, 0
        mov     bl, 1
        mov     bh, byte ptr [dv_data_start]
        mov     si, 0
        call    fdc_write_sectors
        ret
flush_system_area:                      ; fat_mirror + write_system_area + ST0 check
        call    fat_mirror
        call    write_system_area
        test    byte ptr [dv_result], 0c0h
        je      L_01746
        jmp     disk_write_error
L_01746:
        clc
        ret
fat12_alloc_first_cluster:              ; CX = 2, then fall into fat12_alloc_cluster
        mov     cx, 2
fat12_alloc_cluster:                    ; scan the FAT from cluster CX for a 000h entry, claim it as 0FFFh
        mov     si, word ptr [dv_fat_off]
L_0174F:
        mov     bx, cx
        shr     bx, 1
        pushf
        add     bx, cx
        mov     ax, word ptr [bx+si]
        popf
        jb      L_01774
        and     ax, 0fffh
        cmp     ax, 0
        jne     L_0176B
        or      word ptr [bx+si], 0fffh
        mov     ax, cx
        clc
        ret
L_0176B:
        inc     cx
        cmp     cx, word ptr [dv_cluster_count]
        jne     L_0174F
        stc
        ret
L_01774:
        and     ax, 0fff0h
        cmp     ax, 0
        jne     L_0176B
        or      word ptr [bx+si], 0fff0h
        mov     ax, cx
        clc
        ret
        mov     si, word ptr [dv_fat_off]
        mov     cx, 2
        mov     dx, 0
L_0178D:
        inc     cx
        cmp     cx, word ptr [dv_cluster_count]
        je      L_017B6
        mov     bx, cx
        shr     bx, 1
        pushf
        add     bx, cx
        mov     ax, word ptr [bx+si]
        popf
        jb      L_017AB
        and     ax, 0fffh
        cmp     ax, 0
        jne     L_0178D
        inc     dx
        jmp     L_0178D
L_017AB:
        and     ax, 0fff0h
        cmp     ax, 0
        jne     L_0178D
        inc     dx
        jmp     L_0178D
L_017B6:
        mov     ax, word ptr [dv_sec_per_clus]
        mul     dx
        shr     ax, 1
        mov     di, ax
        mov     si, 0
        ret
fat12_free_chain:                       ; walk the chain from AX zeroing each link
        or      ax, ax
        jne     L_017C8
        ret
L_017C8:
        mov     si, word ptr [dv_fat_off]
L_017CC:
        mov     bx, ax
        shr     bx, 1
        pushf
        add     bx, ax
        mov     cx, word ptr [bx+si]
        popf
        jb      L_017E8
        and     word ptr [bx+si], 0f000h
L_017DC:
        and     cx, 0fffh
        mov     ax, cx
        cmp     ax, 0fffh
        jne     L_017CC
        ret
L_017E8:
        and     word ptr [bx+si], 0fh
        shr     cx, 4
        jmp     L_017DC
fdc_sense_drive_status:                 ; SENSE DRIVE STATUS; needs ST3 TS clear and keeps ST3 bit 6 as WP
        mov     byte ptr [dv_cmd_len], 2
        mov     byte ptr [dv_cmd_buf], 4
        mov     byte ptr [dv_cmd_hds], 0
        call    fdc_send_command
        call    fdc_read_result
        xor     al, 38h
        mov     ah, al
        mov     bl, al
        and     bl, 40h
        mov     byte ptr [dv_write_protect], bl
        and     ah, 8
        sub     ah, 8
        ret
fdc_recalibrate:                        ; RECALIBRATE; accepts masked ST0 of 80h or 20h  ; ? 80h is "invalid command"
        mov     byte ptr [dv_cmd_len], 2
        mov     byte ptr [dv_cmd_buf], 7
        mov     byte ptr [dv_cmd_hds], 0
        cli
        call    fdc_send_command
        sti
        call    fdc_wait_command_complete
        call    fdc_sense_interrupt
        cmp     al, 80h
        jne     L_01838
        ret
L_01838:
        cmp     al, 20h
        jne     L_0183D
        ret
L_0183D:
        stc
        ret
fdc_seek:                               ; SEEK to AL; requires masked ST0 == 20h or falls into the error message
        mov     byte ptr [dv_cmd_len], 3
        mov     byte ptr [dv_cmd_buf], 0fh
        mov     byte ptr [dv_cmd_hds], 0
        mov     byte ptr [dv_cmd_c], al
        cli
        call    fdc_send_command
        sti
        call    fdc_wait_command_complete
        call    fdc_sense_interrupt
        cmp     al, 20h
        jne     L_01861
        ret
L_01861:
        INT_2A "   FDC SEEK error !!      "
fdc_read_sectors:                       ; AL=cyl AH=head BL=first sector BH=sector count
        push    ax
        push    bx
        call    fdc_seek
        pop     bx
        pop     ax
        mov     byte ptr [dv_cmd_len], 9
        mov     cl, ah
        xor     cl, 1
        ror     cl, 1
        or      cl, 46h
        mov     byte ptr [dv_cmd_buf], cl
        mov     cl, ah
        rol     cl, 2
        mov     byte ptr [dv_cmd_hds], cl
        mov     byte ptr [dv_cmd_c], al
        mov     byte ptr [dv_cmd_h], ah
        mov     byte ptr [dv_cmd_r], bl
        call    dma_program_read
        mov     dx, 0c031h
        mov     al, 1
        out     dx, al
        push    dx
        mov     dx, 0c03fh
        in      al, dx
        pop     dx
        or      al, 2
        mov     dx, 0c03fh
        out     dx, al
        mov     ax, ds
        mov     cx, 4
        sub     bl, bl
L_018C8:
        shl     ax, 1
        rcl     bl, 1
        loop    L_018C8
        add     ax, 5000h
        adc     bl, 0
        mov     dx, 0c034h
        out     dx, ax
        mov     al, bl
        mov     dx, 0c036h
        out     dx, al
        mov     ah, bh
        shl     ah, 1
L_018E2:
        sub     al, al
        cmp     byte ptr [dv_sector_n], 3
        jne     L_018ED
        shl     ax, 1
L_018ED:
        dec     ax
        mov     dx, 0c032h
        out     dx, ax
        mov     dx, 0c03ah
        mov     al, 4
        out     dx, al
        push    dx
        mov     dx, 0c03bh
        in      al, dx
        pop     dx
        push    dx
        mov     dx, 0c03fh
        in      al, dx
        pop     dx
        and     al, 0fdh
        mov     dx, 0c03fh
        out     dx, al
        call    fdc_send_command
        call    fdc_wait_then_read_result
        call    dma_program_write
        ret
fdc_write_sectors:                      ; WRITE DATA; same shape, opcode 05h instead of 06h
        push    ax
        push    bx
        push    si
        call    fdc_seek
        pop     si
        pop     bx
        pop     ax
        mov     byte ptr [dv_cmd_len], 9
        mov     cl, ah
        xor     cl, 1
        ror     cl, 1
        or      cl, 45h
        mov     byte ptr [dv_cmd_buf], cl
        mov     cl, ah
        rol     cl, 2
        mov     byte ptr [dv_cmd_hds], cl
        mov     byte ptr [dv_cmd_c], al
        mov     byte ptr [dv_cmd_h], ah
        mov     byte ptr [dv_cmd_r], bl
        call    dma_program_read
        mov     dx, 0c031h
        mov     al, 1
        out     dx, al
        push    dx
        mov     dx, 0c03fh
        in      al, dx
        pop     dx
        or      al, 2
        mov     dx, 0c03fh
        out     dx, al
        mov     ax, ds
        mov     cx, 4
        sub     bl, bl
L_01960:
        shl     ax, 1
        rcl     bl, 1
        loop    L_01960
        add     ax, si
        adc     bl, 0
        mov     dx, 0c034h
        out     dx, ax
        mov     al, bl
        mov     dx, 0c036h
        out     dx, al
        mov     ah, bh
        shl     ah, 1
        sub     al, al
        cmp     byte ptr [dv_sector_n], 3
        jne     L_01984
        shl     ax, 1
L_01984:
        dec     ax
        mov     dx, 0c032h
        out     dx, ax
        mov     dx, 0c03ah
        mov     al, 8
        out     dx, al
        push    dx
        mov     dx, 0c03bh
        in      al, dx
        pop     dx
        push    dx
        mov     dx, 0c03fh
        in      al, dx
        pop     dx
        and     al, 0fdh
        mov     dx, 0c03fh
        out     dx, al
        call    fdc_send_command
        call    fdc_wait_then_read_result
        call    dma_program_write
        test    byte ptr [dv_result], 0c0h
        je      L_019B4
        jmp     disk_write_error
L_019B4:
        ret
L_019B5:
        INT_2A "Floppy disk format error!!"
fdc_format_track:                       ; FORMAT TRACK; builds the C/H/R/N id list for one cylinder at dv_vars
        mov     al, byte ptr [dv_fmt_track]
        push    ax
        shr     al, 1
        call    fdc_seek
        pop     ax
        mov     ah, al
L_019DE:
        shr     al, 1
        and     ah, 1
        push    ax
        shl     ah, 2
        mov     byte ptr [dv_fmt_hds], ah
        mov     bl, 1
        mov     bh, byte ptr [dv_fmt_n]
L_019F1:
        mov     cl, byte ptr [dv_fmt_sc]
        sub     ch, ch
        mov     di, dv_vars
        pop     ax
L_019FB:
        mov     byte ptr [di], al
        inc     di
        mov     byte ptr [di], ah
        inc     di
        mov     byte ptr [di], bl
        inc     di
        mov     byte ptr [di], bh
        inc     di
        inc     bl
        loop    L_019FB
        call    dma_program_read
        mov     dx, 0c031h
        mov     al, 1
        out     dx, al
        push    dx
        mov     dx, 0c03fh
        in      al, dx
        pop     dx
        or      al, 2
        mov     dx, 0c03fh
        out     dx, al
        mov     ax, ds
        mov     cx, 4
        sub     bl, bl
L_01A27:
        shl     ax, 1
        rcl     bl, 1
        loop    L_01A27
        add     ax, 0f800h
        adc     bl, 0
        mov     dx, 0c034h
        out     dx, ax
        mov     al, bl
        mov     dx, 0c036h
        out     dx, al
        mov     al, byte ptr [dv_fmt_sc]
        mov     ah, 4
        dec     ax
        mov     dx, 0c032h
        out     dx, ax
        mov     dx, 0c03ah
        mov     al, 8
        out     dx, al
        push    dx
        mov     dx, 0c03bh
        in      al, dx
        pop     dx
        push    dx
        mov     dx, 0c03fh
        in      al, dx
        pop     dx
        and     al, 0fdh
        mov     dx, 0c03fh
        out     dx, al
        mov     byte ptr [dv_fmt_len], 6
        mov     byte ptr [dv_fmt_buf], 4dh
        call    fdc_send_format_block
        call    fdc_wait_then_read_result
        call    dma_program_write
        test    al, 0c0h
        je      L_01A79
        jmp     L_019B5
L_01A79:
        inc     byte ptr [dv_fmt_track]
        mov     al, byte ptr [dv_fmt_track]
        shr     al, 1
        cmp     al, 50h
        je      L_01A87
        ret
L_01A87:
        call    fdc_recalibrate
        mov     ax, ds
        mov     es, ax
        mov     di, 0
        push    di
        mov     cx, 2100h
        sub     ax, ax
        rep stosw
        pop     di
        mov     si, 1acah
        mov     al, 0f0h
        mov     byte ptr [di+200h], al
        mov     word ptr [di+201h], 0ffffh
        mov     cx, 1ch
        push    ds
        mov     ax, cs
        mov     ds, ax
        rep movsb
        pop     ds
        call    fat_mirror
        mov     si, 0
        mov     al, 0
        mov     ah, 0
        mov     bl, 1
        mov     bh, byte ptr [dv_data_start]
        call    fdc_write_sectors
        mov     al, 50h
        ret

; ===========================================================================
; BPB REFERENCE TEMPLATES  (0x1ACA-0x1B3A)
; ===========================================================================
; Four 1Ch-byte boot-sector templates (JMP$/NOP + OEM name + BPB):
;   0x1ACA  "MPC2000 "  1.44 MB   media_1440k
;   0x1AE6  "MPC2000 "  720 KB    media_720k
;   0x1B02  "XXXXXXX "  640 KB    media_640k
;   0x1B1E  "MPC2000 "  800 KB    media_800k
; loose tier: 11h BPB bytes at 0Bh, skip jump/OEM (bpb_compare_fields)

bpb_template_1440k:                     ; `JMP $ / NOP` + OEM "MPC2000 " + the 1.44MB BPB
        jmp     bpb_template_1440k
        db      090h, "MPC2000 ", 000h, 002h, 001h, 001h, 000h, 002h, 0e0h ; .MPC2000 .......
        db      00h, 40h, 0bh, 0f0h, 09h, 00h, 12h, 00h, 02h, 00h, 0ebh, 0feh, 90h, 4dh, 50h, 43h
        db      32h, 30h, 30h, 30h, 20h, 00h, 02h, 02h, 01h, 00h, 02h, 70h, 00h, 0a0h, 05h, 0f9h
        db      003h, 000h, 009h, 000h, 002h, 000h, 0ebh, 0feh, 090h, "XXXXXXX"
        db      20h, 00h, 02h, 02h, 01h, 00h, 02h, 70h, 00h, 00h, 05h, 0fbh, 02h, 00h, 08h, 00h
        db      002h, 000h, 0ebh, 0feh, 090h, "MPC2000 ", 000h, 002h, 002h ; .....MPC2000 ...
        db      01h, 00h, 02h, 70h, 00h, 40h, 06h, 0f9h, 03h, 00h, 0ah, 00h, 02h, 00h
fdc_wait_then_read_result:              ; wait for completion, then drain the result phase if DIO is set
        call    fdc_wait_command_complete
        in      al, 20h
        test    al, 40h
        je      fdc_sense_interrupt
        jmp     fdc_read_result
fdc_sense_interrupt:                    ; SENSE INTERRUPT STATUS; returns ST0 AND 0F8h
        mov     byte ptr [dv_cmd_len], 1
        mov     byte ptr [dv_cmd_buf], 8
        call    fdc_send_command
        call    fdc_read_result
        and     al, 0f8h
        ret
fdc_read_result:                        ; drain the result phase into dv_result, return ST0
        call    fdc_wait_result
        mov     si, 0f8f3h
        call    fdc_timeout_arm
L_01B61:
        call    fdc_timeout_tick
        in      al, 20h
        and     al, 0c0h
        cmp     al, 80h
        je      L_01B77
        cmp     al, 0c0h
        jne     L_01B61
        in      al, 22h
        mov     byte ptr [si], al
        inc     si
        jmp     L_01B61
L_01B77:
        mov     al, byte ptr [dv_result]
        ret
fdc_send_command:                       ; shift dv_cmd_buf out byte by byte; DESTROYS dv_cmd_len
        mov     si, dv_cmd_buf
        mov     byte ptr [dv_cmd_done], 0
fdc_send_command_loop:
        call    fdc_wait_ready
        lodsb
        out     22h, al
        dec     byte ptr [dv_cmd_len]
        jne     fdc_send_command_loop
        ret
fdc_send_format_block:                  ; the same for dv_fmt_buf / dv_fmt_len
        mov     si, dv_fmt_buf
        mov     byte ptr [dv_cmd_done], 0
L_01B98:
        call    fdc_wait_ready
        lodsb
        out     22h, al
        dec     byte ptr [dv_fmt_len]
        jne     L_01B98
        ret
fdc_aux_write:                          ; AH -> port 20h, then one mandatory result byte read and discarded
        push    ax
        call    fdc_wait_ready
        pop     ax
        mov     al, ah
        out     20h, al
        call    fdc_wait_result
        in      al, 22h
        ret
fdc_wait_ready:                         ; MSR top two bits == 80h (RQM set, DIO clear)
        call    fdc_timeout_arm
L_01BB7:
        call    fdc_timeout_tick
        in      al, 20h
        and     al, 0c0h
        cmp     al, 80h
        jne     L_01BB7
        ret
fdc_wait_result:                        ; MSR top two bits == 0C0h (a result byte is waiting)
        call    fdc_timeout_arm
L_01BC6:
        call    fdc_timeout_tick
        in      al, 20h
        and     al, 0c0h
        cmp     al, 0c0h
        jne     L_01BC6
        ret
drive_motor_on:                         ; AUX 1Eh plus a ~458K-cycle spin-up delay
        mov     ah, 1eh
        call    fdc_aux_write
        mov     byte ptr [dv_motor], 1
        mov     bl, 7
L_01BDE:
        mov     cx, 0ffffh
L_01BE1:
        mul     ax
        loop    L_01BE1
        dec     bl
        jne     L_01BDE
        ret
drive_motor_off:                        ; AUX 0Eh; motor is bit 4 of the aux byte
        mov     ah, 0eh
        call    fdc_aux_write
        mov     byte ptr [dv_motor], 0
        ret
dma_program_read:                       ; MPC ASIC DMA, device -> RAM; port 0FFF6h gets 31h or 71h by density  ; ?
        pusha
        mov     dx, 0c030h
        mov     al, 1
        out     dx, al
        mov     dx, 0c038h
        mov     al, 10h
        out     dx, al
        mov     dx, 0c039h
        mov     al, 1
        out     dx, al
        mov     al, 31h
        cmp     byte ptr [dv_density], 0
        jne     L_01C13
        mov     al, 71h
L_01C13:
        mov     dx, 0fff6h
        out     dx, al
        popa
        ret
dma_program_write:                      ; the RAM -> device twin
        pusha
        mov     dx, 0c030h
        mov     al, 1
        out     dx, al
        mov     dx, 0c038h
        mov     al, 10h
        out     dx, al
        mov     dx, 0c039h
        mov     al, 0
        out     dx, al
        mov     dx, 0fff6h
        mov     al, 11h
        out     dx, al
        popa
        ret
fdc_wait_command_complete:              ; spin on dv_cmd_done, which only the IRQ sets
        call    fdc_timeout_arm
L_01C37:
        call    fdc_timeout_tick
        cmp     byte ptr [dv_cmd_done], 0
        je      L_01C37
        ret
fdc_timeout_arm:                        ; inner counter 0 (wraps to 65536 polls), outer counter 14h
        mov     word ptr [dv_tmo_inner], 0
        mov     word ptr [dv_tmo_outer], 14h
        ret
fdc_timeout_tick:                       ; one poll; on outer underflow FALLS THROUGH into disk_read_error
        push    ax
        push    dx
        mul     ax
        pop     dx
        pop     ax
        dec     word ptr [dv_tmo_inner]
        je      L_01C5C
        ret
L_01C5C:
        dec     word ptr [dv_tmo_outer]
        je      disk_read_error
        ret

; ===========================================================================
; TERMINAL ERROR PATHS  (0x1C63-0x1CD4)
; ===========================================================================
; Each is `call fdc_reset` (where applicable) then INT 2Ah with the message
; inline.  scsi_write_error and scsi_read_error are jumped to from
; scsi_format_volume and the SCSI read path.

disk_read_error:                        ; terminal
        call    fdc_reset
        INT_2A "     Disk read error  !!  "
disk_write_error:                       ; terminal
        call    fdc_reset
        INT_2A "    Disk write error  !!  "
scsi_write_error:
        INT_2A "SCSI WRITE ERROR !!   "
scsi_read_error:
        INT_2A "SCSI READ ERROR !!   "

; ===========================================================================
; SCSI VOLUME DRIVER  (0x1CD4-0x252A)
; ===========================================================================
; SCSI filesystem driver (int2ch_table_scsi), independent, bus via INT 2Dh;
; dv_scsi_vars 0F906h separate from floppy's; scsi_probe: INQUIRY AH=3
; byte 0&1Fh device type, READ CAPACITY AH=6 require 512-byte blocks;
; bpb_template_scsi: OEM "MPC1000 ", 32 sec/clus, 512 root, media 0F8h,
; label "MPC-1000"
;
; int2ch_table_scsi(0x0C6A) / table_dev0_alt(0x0C68): table_scsi[n] =
; table_dev0_alt[n+1]; aligned with floppy table (0Eh dir_find_by_name,
; 0Fh motor_on, 10h motor_off); dv_alt_table<>0: BL one entry early;
; names by table position, "?"

scsi_init:                              ; INT 2Dh AH=0
        mov     ah, 0
        int     2dh
        or      ax, ax
        ret
scsi_probe:                             ; INQUIRY (AH=3) then READ CAPACITY (AH=6); insists on 512-byte blocks
        mov     ax, ds
        mov     es, ax
        mov     di, dv_scsi_vars
        mov     cx, 35dh
        sub     ax, ax
        rep stosw
        sub     dh, dh
        mov     word ptr [dv_scsi_lba], 0
        mov     word ptr [dv_scsi_lba_hi], 0
        mov     ah, 3
        mov     dx, ds
L_01CFB:
        mov     di, 0f908h
        mov     cx, 24h
        int     2dh
        or      ax, ax
        je      L_01D09
        jmp     L_01D6C
L_01D09:
        mov     ah, byte ptr [dv_scsi_inquiry]
        and     ah, 1fh
        mov     byte ptr [dv_scsi_devtype], ah
        mov     ah, 6
        int     2dh
        or      ax, ax
        je      L_01D1F
        jmp     L_01F13
L_01D1F:
        cmp     si, 200h
        je      L_01D28
        jmp     L_01F13
L_01D28:
        mov     word ptr [dv_scsi_blocks], di
        mov     word ptr [dv_scsi_blocks_hi], dx
        call    L_01D76
        cmp     al, 11h
        clc
        je      L_01D39
        ret
L_01D39:
        mov     ax, word ptr [0a1c6h]
        mov     dx, word ptr [0a1c8h]
        mov     word ptr [dv_scsi_lba], ax
        mov     word ptr [dv_scsi_lba_hi], dx
        call    L_01D76
        mov     dh, byte ptr [dv_scsi_devtype]
        mov     dl, 0
        mov     ah, 1
        cmp     al, 12h
        jne     L_01D57
        ret
L_01D57:
        sub     ax, ax
        mov     word ptr [dv_scsi_lba], ax
        mov     word ptr [dv_scsi_lba_hi], dx
        mov     dh, byte ptr [dv_scsi_devtype]
        mov     dl, 0
        mov     al, 11h
        mov     ah, 0
        stc
        ret
L_01D6C:
        mov     al, 10h
        mov     ah, 0
        mov     dl, 0
        mov     dh, 9
        stc
        ret
L_01D76:
        sub     ax, ax
        sub     dx, dx
        mov     cx, 1
        mov     di, 0a000h
        call    L_023E0
        cmp     byte ptr [0a000h], 0ebh
        je      L_01D94
        cmp     byte ptr [0a000h], 0e9h
        je      L_01D94
        jmp     L_01F13
L_01D94:
        cmp     word ptr [0a1feh], 0aa55h
        je      L_01D9F
        jmp     L_01F13
L_01D9F:
        mov     si, 0a036h
        call    cs_literal_compare
        inc     si
        inc     cx
        push    sp
        xor     word ptr [bp+si], si
        add     byte ptr [si+730ch], dh
        sbb     ax, 0ace8h
        out     dx, ax
        inc     si
        inc     cx
        push    sp
        xor     word ptr [0b400h], si
        adc     byte ptr [bp+di+10h], dh
        cmp     byte ptr [0a1c2h], 4
        je      L_01DCC
        cmp     word ptr [0a013h], 0
        je      L_01DCC
        mov     ah, 0ch
L_01DCC:
        mov     byte ptr [0f968h], ah
        cmp     word ptr [0a00bh], 200h
        je      L_01DDB
        jmp     L_01F13
L_01DDB:
        mov     bl, byte ptr [0a010h]
        cmp     bl, 2
        je      L_01DE7
        jmp     L_01F13
L_01DE7:
        mov     ax, word ptr [0a00eh]
        mov     word ptr [0f99eh], ax
        mov     cx, word ptr [0a016h]
        mov     word ptr [0f9a2h], cx
        add     ax, cx
        mov     word ptr [0f9a0h], ax
        add     ax, cx
        mov     word ptr [0fdaah], ax
        mov     ax, word ptr [0a011h]
        mov     word ptr [0fdach], ax
        mov     ax, word ptr [0a011h]
        mov     dx, 20h
        mul     dx
        mov     bx, 200h
        div     bx
        or      dx, dx
        je      L_01E17
        inc     ax
L_01E17:
        add     ax, word ptr [0fdaah]
        mov     word ptr [0f9a4h], ax
        mov     di, ax
        mov     al, byte ptr [0a00dh]
        or      al, al
        jne     L_01E2A
        jmp     L_01F13
L_01E2A:
        cmp     al, 21h
        jb      L_01E31
        jmp     L_01F13
L_01E31:
        sub     ah, ah
        mov     word ptr [0f99ch], ax
        mov     bx, 200h
        mul     bx
        mov     word ptr [0f998h], ax
        sub     dx, dx
        mov     ax, word ptr [0a013h]
        or      ax, ax
        jne     L_01E4E
        mov     ax, word ptr [0a020h]
        mov     dx, word ptr [0a022h]
L_01E4E:
        sub     ax, di
        sbb     dx, 0
        mov     bx, word ptr [0f99ch]
        cmp     dx, bx
        jb      L_01E5E
        jmp     L_01F13
L_01E5E:
        div     bx
        mov     word ptr [0f99ah], ax
        mov     ax, 0
        call    L_01FEA
        mov     ax, 0
        call    L_02180
        cmp     byte ptr [0f968h], 0ch
        jne     L_01E85
        mov     ax, word ptr [0f99eh]
        sub     dx, dx
        mov     cx, word ptr [0f9a2h]
        mov     di, 0e000h
        call    L_023E0
L_01E85:
        mov     si, 0a003h
        call    cs_literal_compare
        dec     bp
        push    ax
        inc     bx
        xor     word ptr [bx+si], si
        xor     byte ptr [bx+si], dh
        add     byte ptr [bp+si+0ch], dh
        mov     al, 13h
        mov     ah, 1
        mov     dh, byte ptr [dv_scsi_devtype]
        mov     dl, 0
        clc
        ret
        mov     si, 0a020h
        mov     cx, 20h
        mov     al, 0
L_01EA9:
        or      al, byte ptr [si]
        inc     si
        loop    L_01EA9
        cmp     al, 0
        je      L_01EB4
        jmp     L_01F09
L_01EB4:
        mov     si, 0a040h
        mov     cx, 70h
        mov     al, 0
L_01EBC:
        or      al, byte ptr [si]
        inc     si
        loop    L_01EBC
        cmp     al, 0
        jne     L_01EC7
        jmp     L_01F09
L_01EC7:
        mov     si, 0a0b0h
        mov     cx, 14ch
        mov     al, 0
L_01ECF:
        or      al, byte ptr [si]
        inc     si
        loop    L_01ECF
        cmp     al, 0
        jne     L_01F09
        cmp     word ptr [0a1fch], 0aa55h
        jne     L_01F09
        mov     si, 0a044h
        mov     cx, 19h
        mov     dl, 0ffh
L_01EE8:
        inc     dl
        lodsw
        mov     bx, ax
        lodsw
        or      ax, bx
        je      L_01EF4
        loop    L_01EE8
L_01EF4:
        cmp     dl, 0
        je      L_01EFB
        dec     dl
L_01EFB:
        mov     dh, byte ptr [dv_scsi_devtype]
        mov     al, 14h
        mov     ah, 1
        mov     dh, byte ptr [dv_scsi_devtype]
        clc
        ret
L_01F09:
        mov     al, 12h
        mov     ah, 1
        mov     dh, byte ptr [dv_scsi_devtype]
        clc
        ret
L_01F13:
        cmp     byte ptr [dv_scsi_devtype], 5
        je      L_01F22
        mov     al, 11h
        mov     ah, 0
        sub     dx, dx
        clc
        ret
L_01F22:
        mov     al, 15h
        mov     ah, 3
        mov     dh, byte ptr [dv_scsi_devtype]
        mov     dl, 0
        clc
        ret
        mov     al, 16h
        mov     ah, 6
        mov     dl, byte ptr [dv_scsi_devtype]
        clc
        ret
        mov     al, 17h
        mov     ah, 7
        mov     dl, byte ptr [dv_scsi_devtype]
        clc
        ret
scsi_sub17:                             ; named by table position only  ; ?
        sub     ah, ah
        shl     ax, 2
        add     ax, 0a040h
        mov     si, ax
        lodsw
        mov     word ptr [dv_scsi_lba], ax
        lodsw
        mov     word ptr [dv_scsi_lba_hi], ax
        ret
scsi_dir_first:                         ; named by table position only  ; ?
        mov     ah, 5
        int     2dh
        or      ax, ax
        jne     L_01FB3
        sub     ax, ax
        mov     word ptr [0fdb0h], ax
        mov     word ptr [0fdaeh], ax
        call    L_01FEA
        mov     word ptr [0fdb2h], 0fdb4h
        sub     ax, ax
        call    L_01F7E
        ret
scsi_dir_next:                          ; named by table position only  ; ?
        mov     ax, word ptr [0fdaeh]
L_01F77:
        inc     ax
        cmp     ax, word ptr [0fdach]
        jae     L_01FB3
L_01F7E:
        push    ax
        push    ax
        shr     ax, 4
        cmp     ax, word ptr [0fdb0h]
        je      L_01F8C
        call    L_01FEA
L_01F8C:
        pop     si
        and     si, 0fh
        shl     si, 5
        add     si, 0fdb4h
        pop     ax
        cmp     byte ptr [si], 0
        je      L_01FB3
        push    ax
        call    dir_entry_usable
        pop     ax
        jb      L_01F77
        mov     word ptr [0fdaeh], ax
        mov     word ptr [0fdb2h], si
        mov     di, 0f96ah
        call    L_01206
        clc
        ret
L_01FB3:
        stc
        ret
scsi_dir_prev:                          ; named by table position only  ; ?
        mov     ax, word ptr [0fdaeh]
L_01FB8:
        or      ax, ax
        je      L_01FB3
        dec     ax
        push    ax
        push    ax
        shr     ax, 4
        cmp     ax, word ptr [0fdb0h]
        je      L_01FCB
        call    L_01FEA
L_01FCB:
        pop     si
        and     si, 0fh
        shl     si, 5
        add     si, 0fdb4h
        call    dir_entry_usable
        pop     ax
        jb      L_01FB8
        mov     word ptr [0fdaeh], ax
        mov     word ptr [0fdb2h], si
        mov     di, 0f96ah
        call    L_01206
        ret
L_01FEA:
        mov     word ptr [0fdb0h], ax
        add     ax, word ptr [0fdaah]
        mov     dx, 0
        mov     cx, 1
        mov     di, 0fdb4h
        call    L_023E0
        ret
L_01FFE:
        sub     ax, ax
        mov     word ptr [0fdb0h], ax
        mov     word ptr [0fdaeh], ax
        call    L_01FEA
        mov     word ptr [0fdb2h], 0fdb4h
L_0200F:
        mov     si, word ptr [0fdb2h]
        cmp     byte ptr [si], 0
        jne     L_02019
        ret
L_02019:
        cmp     byte ptr [si], 5
        jne     L_0201F
        ret
L_0201F:
        cmp     byte ptr [si], 0e5h
        jne     L_02025
        ret
L_02025:
        mov     ax, word ptr [0fdaeh]
        inc     ax
        cmp     ax, word ptr [0fdach]
        jae     L_01FB3
        mov     word ptr [0fdaeh], ax
        push    ax
        push    ax
        shr     ax, 4
        cmp     ax, word ptr [0fdb0h]
        je      L_02040
        call    L_01FEA
L_02040:
        pop     si
        and     si, 0fh
        shl     si, 5
        add     si, 0fdb4h
        mov     word ptr [0fdb2h], si
        pop     ax
        jmp     L_0200F
L_02052:
        push    si
        push    es
        call    scsi_dir_first
        pop     es
        pop     di
L_02059:
        pusha
        mov     si, 0f96ah
        mov     cx, 14h
        repe cmpsb
        popa
        jne     L_02066
        ret
L_02066:
        push    es
        push    di
        call    scsi_dir_next
        pop     di
        pop     es
        jae     L_02059
        ret
scsi_file_open:                         ; named by table position only  ; ?
        call    L_02052
        jae     L_02076
        ret
L_02076:
        mov     si, word ptr [0fdb2h]
        mov     ax, word ptr [si+1ah]
        mov     word ptr [0ffb8h], ax
        mov     word ptr [0ffbah], 0
        mov     ax, word ptr [si+1ch]
        mov     dx, word ptr [si+1eh]
        mov     word ptr [0ffb4h], ax
        mov     word ptr [0ffb6h], dx
        clc
        ret
scsi_read_byte:                         ; named by table position only  ; ?
        mov     ax, word ptr [0ffb4h]
        or      ax, word ptr [0ffb6h]
        je      L_020C4
        sub     word ptr [0ffb4h], 1
        sbb     word ptr [0ffb6h], 0
        cmp     word ptr [dv_buf_left], 0
        jne     L_020B2
        call    L_0212F
L_020B2:
        mov     si, word ptr [0ffbch]
        mov     al, byte ptr [si]
        inc     word ptr [0ffbch]
        dec     word ptr [0ffbah]
        mov     ah, 0
        clc
        ret
L_020C4:
        mov     ax, 0ffffh
        stc
        ret
scsi_read_block:                        ; named by table position only  ; ?
        mov     ax, word ptr [0ffb4h]
        or      ax, word ptr [0ffb6h]
        jne     L_020D3
        ret
L_020D3:
        sub     word ptr [0ffb4h], cx
        sbb     word ptr [0ffb6h], 0
        jae     L_020EE
        add     cx, word ptr [0ffb4h]
        mov     word ptr [0ffb4h], 0
        mov     word ptr [0ffb6h], 0
L_020EE:
        push    cx
        call    L_020F5
        pop     ax
        clc
        ret
L_020F5:
        cmp     cx, word ptr [0ffbah]
        jbe     L_02120
        sub     cx, word ptr [0ffbah]
        push    cx
        mov     cx, word ptr [0ffbah]
        mov     word ptr [dv_buf_left], 0
        mov     si, word ptr [0ffbch]
        rep movsb
        push    di
        push    es
        call    L_0212F
        pop     es
        pop     di
        pop     cx
        cmp     word ptr [0ffbah], 0
        jne     L_020F5
        ret
L_02120:
        sub     word ptr [0ffbah], cx
        mov     si, word ptr [0ffbch]
        rep movsb
        mov     word ptr [0ffbch], si
        ret
L_0212F:
        mov     ax, word ptr [0ffb8h]
        cmp     ax, 0ffffh
        jne     L_02138
        ret
L_02138:
        call    L_023BE
        mov     cx, word ptr [0f99ch]
        mov     di, 0a000h
        mov     word ptr [0ffbch], di
        call    L_023E0
        mov     ax, word ptr [0f998h]
        mov     word ptr [0ffbah], ax
        call    L_02153
        ret
L_02153:
        cmp     byte ptr [0f968h], 0ch
        jne     L_0215D
        jmp     L_02533
L_0215D:
        mov     ax, word ptr [0ffb8h]
        cmp     ah, byte ptr [0f9a7h]
        je      L_02169
        call    L_02180
L_02169:
        sub     ah, ah
        shl     ax, 1
        add     ax, 0f9aah
        mov     si, ax
        mov     ax, word ptr [si]
        cmp     ax, 0fff8h
        jb      L_0217C
        mov     ax, 0ffffh
L_0217C:
        mov     word ptr [0ffb8h], ax
        ret
L_02180:
        push    ax
        mov     byte ptr [0f9a7h], ah
        mov     al, ah
        sub     ah, ah
        add     ax, word ptr [0f99eh]
        sub     dx, dx
        mov     cx, 2
        mov     di, 0f9aah
        call    L_023E0
        pop     ax
        ret
scsi_file_create:                       ; named by table position only  ; ?
        push    es
        push    si
        call    L_01FFE
        mov     di, si
        pop     si
        pop     es
        jb      L_021D6
        push    es
        push    si
        push    di
        call    L_021E0
        pop     di
        pop     si
        pop     es
        jb      L_021DB
        mov     word ptr [0ffb8h], ax
        call    L_0151C
        sub     ax, ax
        mov     word ptr [di+1ch], ax
        mov     word ptr [di+1eh], ax
        mov     byte ptr [di+0bh], al
        mov     ax, word ptr [0ffb8h]
        mov     word ptr [di+1ah], ax
        mov     word ptr [0ffbeh], 0
        mov     byte ptr [0f9a6h], 2
        sub     ax, ax
        clc
        ret
L_021D6:
        mov     ax, 2
        stc
        ret
L_021DB:
        mov     ax, 3
        stc
        ret
L_021E0:
        cmp     byte ptr [0f968h], 10h
        je      L_021EA
        jmp     L_02550
L_021EA:
        sub     ax, ax
        call    L_02180
        mov     ax, 2
        mov     si, 0f9aah
L_021F5:
        mov     bx, ax
        sub     bh, bh
        shl     bx, 1
        cmp     word ptr [bx+si], 0
        jne     L_02205
        mov     word ptr [bx+si], 0ffffh
        ret
L_02205:
        inc     ax
        cmp     ax, word ptr [0f99ah]
        je      L_02217
        cmp     al, 0
        jne     L_021F5
        push    si
        call    L_02180
        pop     si
        jmp     L_021F5
L_02217:
        stc
        ret
scsi_write_byte:                        ; named by table position only  ; ?
        mov     di, word ptr [0fdb2h]
        add     word ptr [di+1ch], 1
        adc     word ptr [di+1eh], 0
        mov     di, word ptr [0ffbeh]
        mov     byte ptr [di-6000h], al
        inc     di
        cmp     di, word ptr [0f998h]
        jne     L_02240
        call    L_023CF
        call    L_02307
        jae     L_0223E
        jmp     L_021DB
L_0223E:
        sub     di, di
L_02240:
        mov     word ptr [dv_wr_ptr], di
        sub     ax, ax
        ret
scsi_write_block:                       ; named by table position only  ; ?
        mov     di, word ptr [0fdb2h]
        add     word ptr [di+1ch], cx
        adc     word ptr [di+1eh], 0
L_02252:
        mov     di, 0a000h
        mov     bx, word ptr [0ffbeh]
        add     di, bx
        mov     ax, word ptr [0f998h]
        sub     ax, bx
        cmp     cx, ax
        jb      L_0228B
        sub     cx, ax
        mov     word ptr [0ffbeh], 0
        push    cx
        mov     cx, ax
        mov     ax, ds
        mov     bx, es
        mov     es, ax
        mov     ds, bx
        rep movsb
        mov     es, bx
        mov     ds, ax
        call    L_023CF
        call    L_02307
        pop     cx
        jae     L_02289
        jmp     L_021DB
L_02289:
        jmp     L_02252
L_0228B:
        add     word ptr [0ffbeh], cx
        mov     ax, ds
        mov     bx, es
        mov     es, ax
        mov     ds, bx
        rep movsb
        mov     es, bx
        mov     ds, ax
        clc
        ret
scsi_file_close:                        ; named by table position only  ; ?
        sub     ax, ax
        xchg    byte ptr [0f9a6h], al
        cmp     al, 2
        jne     L_022CC
        mov     cx, word ptr [0f998h]
        mov     di, word ptr [0ffbeh]
        sub     cx, di
        add     di, 0a000h
        mov     al, 0
        rep stosb
        call    L_023CF
        mov     si, word ptr [0fdb2h]
        mov     byte ptr [si+0bh], 20h
        call    L_022E1
        call    L_022CE
L_022CC:
        clc
        ret
L_022CE:
        mov     ax, word ptr [0fdb0h]
        add     ax, word ptr [0fdaah]
        sub     dx, dx
        mov     di, 0fdb4h
        mov     cx, 1
        call    L_023FE
        ret
L_022E1:
        mov     al, byte ptr [0f9a7h]
        mov     ah, 0
        push    ax
        add     ax, word ptr [0f99eh]
        sub     dx, dx
        mov     cx, 1
        mov     di, 0f9aah
        call    L_023FE
        pop     ax
        add     ax, word ptr [0f9a0h]
        sub     dx, dx
        mov     cx, 1
        mov     di, 0f9aah
        call    L_023FE
        ret
L_02307:
        cmp     byte ptr [0f968h], 10h
        je      L_02311
        jmp     L_0258A
L_02311:
        call    L_02342
        jae     L_02317
        ret
L_02317:
        mov     bx, ax
        xchg    word ptr [0ffb8h], bx
        mov     cx, bx
        sub     bh, bh
        shl     bx, 1
        mov     word ptr [bx-656h], ax
        cmp     ah, ch
        je      L_02335
        push    ax
        call    L_022E1
        pop     ax
        push    ax
        call    L_02180
        pop     ax
L_02335:
        sub     ah, ah
        shl     ax, 1
        mov     bx, ax
        mov     word ptr [bx-656h], 0ffffh
        ret
L_02342:
        mov     ax, word ptr [0ffb8h]
        mov     si, 0f9aah
L_02348:
        mov     bx, ax
        sub     bh, bh
        shl     bx, 1
        cmp     word ptr [bx+si], 0
        jne     L_02354
        ret
L_02354:
        inc     ax
        cmp     ax, word ptr [0f99ah]
        stc
        jne     L_0235D
        ret
L_0235D:
        cmp     al, 0
        jne     L_02348
        push    ax
        mov     al, ah
        sub     ah, ah
        add     ax, word ptr [0f99eh]
        sub     dx, dx
        mov     cx, 1
        mov     di, 0fbaah
        push    di
        call    L_023E0
        pop     si
        pop     ax
        jmp     L_02348
L_0237A:
        or      ax, ax
        jne     L_0237F
        ret
L_0237F:
        cmp     byte ptr [0f968h], 10h
        je      L_02389
        jmp     L_025BD
L_02389:
        call    L_02180
L_0238C:
        mov     bl, al
        sub     bh, bh
        shl     bx, 1
        sub     cx, cx
        xchg    word ptr [bx-656h], cx
        cmp     cx, -1
        jne     L_023A0
        jmp     L_022E1
L_023A0:
        cmp     ah, ch
        mov     ax, cx
        je      L_0238C
        push    ax
        call    L_022E1
        pop     ax
        jmp     L_02389
scsi_file_delete:                       ; named by table position only  ; ?
        mov     si, word ptr [0fdb2h]
        mov     byte ptr [si], 0e5h
        mov     ax, word ptr [si+1ah]
        call    L_0237A
        call    L_022CE
        ret
L_023BE:
        sub     ax, 2
        mov     bx, word ptr [0f99ch]
        mul     bx
        add     ax, word ptr [0f9a4h]
        adc     dx, 0
        ret
L_023CF:
        mov     ax, word ptr [0ffb8h]
        call    L_023BE
        mov     cx, word ptr [0f99ch]
        mov     di, 0a000h
        call    L_023FE
        ret
L_023E0:
        pusha
        add     ax, word ptr [dv_scsi_lba]
        adc     dx, word ptr [dv_scsi_lba_hi]
        mov     bx, dx
        mov     dx, ax
        mov     ax, ds
        mov     es, ax
        mov     ah, 1
        int     2dh
        or      ax, ax
        popa
        je      L_023FD
        jmp     scsi_read_error
L_023FD:
        ret
L_023FE:
        pusha
        add     ax, word ptr [dv_scsi_lba]
        adc     dx, word ptr [dv_scsi_lba_hi]
        mov     bx, dx
        mov     dx, ax
        mov     ax, ds
        mov     es, ax
        mov     ah, 2
        int     2dh
        or      ax, ax
        popa
        je      L_0241B
        jmp     scsi_write_error
L_0241B:
        ret
scsi_format_volume:                     ; named by table position only  ; ?
        mov     ax, ds
        mov     es, ax
        mov     di, 0a000h
        mov     cx, 2000h
        sub     ax, ax
        rep stosw
        mov     word ptr [dv_scsi_lba], ax
        mov     word ptr [dv_scsi_lba_hi], ax
        mov     si, 24f1h
        mov     di, 0a000h
        push    ds
        mov     bx, cs
        mov     ds, bx
        mov     cx, 34h
        rep movsb
        pop     ds
        mov     di, 0a000h
        mov     byte ptr [di+1feh], 55h
        mov     byte ptr [di+1ffh], 0aah
        mov     ax, word ptr [dv_scsi_blocks]
        mov     dx, word ptr [dv_scsi_blocks_hi]
        push    ax
        push    dx
        mov     bx, 0
        mov     cx, 20h
        sub     ax, bx
        sbb     dx, cx
        pop     dx
        pop     ax
        jb      L_0246B
        mov     ax, 0ffffh
        mov     dx, 1fh
L_0246B:
        mov     word ptr [di+20h], ax
        mov     word ptr [di+22h], dx
        mov     cl, 1
L_02473:
        or      dx, dx
        je      L_0247F
        shr     dx, 1
        rcr     ax, 1
        shl     cl, 1
        jmp     L_02473
L_0247F:
        mov     byte ptr [di+0dh], cl
        mov     ax, 0
        mov     dx, 0
        mov     cx, 1
        push    di
        call    L_023FE
        pop     di
        mov     ax, ds
        mov     es, ax
        mov     cx, 100h
        sub     ax, ax
        push    di
        rep stosw
        pop     di
        mov     word ptr [di], 0fff8h
        mov     word ptr [di+2], 0ffffh
        mov     ax, 1
        mov     dx, 0
        mov     cx, 20h
        call    L_023FE
        mov     word ptr [di], 0
        mov     word ptr [di+2], 0
        mov     bl, 7
L_024BD:
        add     ax, cx
        call    L_023FE
        dec     bl
        jne     L_024BD
        mov     word ptr [di], 0fff8h
        mov     word ptr [di+2], 0ffffh
        add     ax, cx
        call    L_023FE
        mov     word ptr [di], 0
        mov     word ptr [di+2], 0
        mov     bl, 7
L_024DF:
        add     ax, cx
        call    L_023FE
        dec     bl
        jne     L_024DF
        add     ax, cx
        mov     cx, 20h
        call    L_023FE
        ret
L_024F1:
        jmp     L_024F1

; OEM "MPC1000 ", 512 B/sec, 32 sec/clus, 1 reserved, 2 FATs, 512 root,
; media 0F8h (fixed), 100h sec/FAT, volume label "MPC-1000"
bpb_template_scsi:
        db      090h, "MPC1000 ", 000h, 002h, 020h, 001h, 000h, 002h, 000h ; .MPC1000 .. ....
        db      02h, 00h, 00h, 0f8h, 00h, 01h, 10h, 00h, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      000h, 000h, 080h, 000h, 000h, 000h, 000h, 000h, 000h, "MPC-100"
        db      30h, 00h
scsi_sense_status:                      ; named by table position only  ; ?
        mov     ah, 5
        int     2dh
        or      ax, ax

; ===========================================================================
; SAMPLE-MEMORY / F-ROM DMA ENGINE  (~0x252B-0x26E8)
; ===========================================================================
; ports 80h-8Ch: 80h/82h device addr, 84h/86h go, 88h status (bit 7=busy);
; completion poll 0C03Bh. frm_probe/frm_read_block access F-ROM via smem_read.
; shared with MPC2000.EXE: ROM 2613h == v1.50 file offset 1CD6Bh.

        cmp     al, 2
        je      L_02531
        clc
        ret
L_02531:
        stc
        ret
L_02533:
        mov     ax, word ptr [0ffb8h]
        mov     bx, ax
        shr     bx, 1
        pushf
        add     bx, ax
        add     bx, 0e000h
        mov     ax, word ptr [bx]
        popf
        jae     L_02549
        shr     ax, 4
L_02549:
        and     ah, 0fh
        mov     word ptr [0ffb8h], ax
        ret
L_02550:
        mov     cx, 2
L_02553:
        mov     si, 0e000h
L_02556:
        mov     bx, cx
        shr     bx, 1
        pushf
        add     bx, cx
        mov     ax, word ptr [bx+si]
        popf
        jb      L_0257B
        and     ax, 0fffh
        cmp     ax, 0
        jne     L_02572
        or      word ptr [bx+si], 0fffh
        mov     ax, cx
        clc
        ret
L_02572:
        inc     cx
        cmp     cx, word ptr [0f99ah]
        jne     L_02556
        stc
        ret
L_0257B:
        and     ax, 0fff0h
        cmp     ax, 0
        jne     L_02572
        or      word ptr [bx+si], 0fff0h
        mov     ax, cx
        clc
        ret
L_0258A:
        mov     cx, word ptr [0ffb8h]
        call    L_02553
        jae     L_02594
        ret
L_02594:
        mov     cx, ax
        xchg    word ptr [dv_cur_cluster], ax
        mov     bx, ax
        shr     bx, 1
        pushf
        add     bx, ax
        add     bx, 0e000h
        mov     ax, word ptr [bx]
        popf
        jae     L_025B5
        shl     cx, 4
        and     ax, 0fh
        or      ax, cx
        mov     word ptr [bx], ax
        ret
L_025B5:
        and     ax, 0f000h
        or      ax, cx
        mov     word ptr [bx], ax
        ret
L_025BD:
        or      ax, ax
        jne     L_025C2
        ret
L_025C2:
        mov     si, 0e000h
L_025C5:
        mov     bx, ax
        shr     bx, 1
        pushf
        add     bx, ax
        mov     cx, word ptr [bx+si]
        popf
        jb      L_025FF
        and     word ptr [bx+si], 0f000h
L_025D5:
        and     cx, 0fffh
        mov     ax, cx
        cmp     ax, 0fffh
        jne     L_025C5
        mov     ax, word ptr [0f99eh]
        sub     dx, dx
        mov     cx, word ptr [0f9a2h]
        mov     si, 0e000h
        call    L_023FE
        mov     ax, word ptr [0f9a0h]
        sub     dx, dx
        mov     cx, word ptr [0f9a2h]
        mov     si, 0e000h
        call    L_023FE
        ret
L_025FF:
        and     word ptr [bx+si], 0fh
        shr     cx, 4
        jmp     L_025D5
smem_read:                              ; ES:DI = device address, CX = words
        mov     bh, 45h
        mov     bl, 6fh
        jmp     smem_dma_xfer
        mov     bh, 49h
        mov     bl, 4fh
        jmp     smem_dma_xfer
smem_dma_xfer:
        mov     dx, 0c03fh
        in      al, dx
        or      al, 8
        out     dx, al
        xor     ax, ax
        out     80h, ax
        mov     dx, di
        mov     ax, es
        sar     ax, 1
        rcr     dx, 1
        sar     ax, 1
        rcr     dx, 1
        sar     ax, 1
        rcr     dx, 1
        sar     ax, 1
        rcr     dx, 1
        mov     ah, 1
        out     86h, ax
        mov     ax, dx
        out     84h, ax
        mov     ax, di
        shl     ax, 0ch
        out     82h, ax
        mov     ax, 100h
        out     80h, ax
        mov     ax, 0fh
        out     86h, ax
        mov     ax, 0ffffh
        out     84h, ax
        mov     ax, 1000h
        out     82h, ax
        mov     ax, 200h
        out     80h, ax
        xor     ax, ax
        out     8ch, ax
        mov     dx, 1eh
L_02661:
        mov     ax, dx
        out     80h, ax
        mov     ax, 100h
        out     86h, ax
        sub     dx, 2
        jne     L_02661
        mov     ax, 3
        mov     dx, 0c031h
        out     dx, al
        mov     ax, ds
        sub     dx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, si
        adc     dx, 0
        push    dx
        mov     dx, 0c034h
        out     dx, ax
        pop     ax
        mov     dx, 0c036h
        out     dx, al
        mov     ax, cx
        dec     ax
        mov     dx, 0c032h
        out     dx, ax
        mov     al, bh
        mov     dx, 0c03ah
        out     dx, al
        mov     dx, 0c03fh
        in      al, dx
        and     al, 0f7h
        out     dx, al
        mov     al, bl
        xor     ah, ah
        out     88h, ax
L_026B3:
        mov     dx, 0c03bh
        in      al, dx
        test    al, 8
        je      L_026B3
        cmp     bl, 4fh
        jne     L_026D4
        mov     dx, di
        add     dx, cx
        shl     dx, 0ch
L_026C7:
        xor     ax, ax
        out     80h, ax
        in      ax, 82h
        and     ax, 0f000h
        cmp     ax, dx
        jne     L_026C7
L_026D4:
        xor     ax, ax
        out     80h, ax
        mov     ah, 1
        out     86h, ax
        xor     ax, ax
        out     88h, ax
L_026E0:
        in      al, 88h
        test    al, 80h
        jne     L_026E0
        ret
        db      00h

; ===========================================================================
; BYTECODE VM  (0x26E8-0x2796)
; ===========================================================================
; The ROM carries a 76-opcode subset of the same bytecode VM MPC2000.EXE
; dispatches on INT 2Bh, and IVT[2Bh] here is 0000:26E8.  Calling
; convention: `call bc_dispatch` followed inline by one opcode byte and its
; operands; the dispatcher pops the return address into BP, indexes
; bc_handler_table by the opcode BYTE (so opcodes are even and the table is
; 76 words), lets the handler advance BP past its own operands, and then
; `jmp bp` to resume after them.
; Opcode numbering and operand counts are the EXE's -- every opcode the two
; tables share advances BP by the same amount.  The handlers differ: 00h is
; the panel init, 02h the blit, 04h-0Ah plane select.

bc_dispatch:                            ; IVT[2Bh]: inline ops; jmp bp
        pop     bp
        push    es
        mov     bx, cs
        mov     es, bx
        mov     bl, byte ptr es:[bp]
        sub     bh, bh
        inc     bp
        call    word ptr cs:[bx+26fdh]
        pop     es
        jmp     bp

; bc_handler_table -- 76 word entries, indexed by the opcode byte (so only
; even opcodes exist).  0x2795 is the shared "not implemented" RET.
;   00 -> 2796  bc_op00_lcd_init            ; panel init + self test
;   02 -> 28d1  bc_op02_lcd_blit            ; blit planes to the panel
;   04 -> 2b7e  bc_op04_plane_a             ; select plane A
;   06 -> 2b85  bc_op06_plane_b             ; select plane B
;   08 -> 2b8c  bc_op08_plane_c             ; select plane C
;   0a -> 2b9a  bc_op0a_plane_e             ; select plane E
;   0c -> 2bc3  bc_op0c_clear_planes        ; clear all planes (780h)
;   0e -> 2f78  bc_op0e_text                ; x,y,"text"
;   10 -> 2f6a  bc_op10_text_inverse        ; x,mode,"text" inverse
;   12 -> 3243  bc_op12_box_chars           ; x,y,box-drawing chars
;   14 -> 2e72  bc_op14_puts_far            ; print far string at ES:SI
;   16 -> 2e50  bc_op16                       ? BC_STATUS_A
;   18 -> 2e8c  bc_op18                       ? BC_STATUS_B
;   1a -> 2eab  bc_op1a                       ? BC_TIME
;   1c -> 2cc9  bc_op1c                       ? BC_JUMP
;   1e -> 2ceb  bc_op1e                       ? BC_DISPLAY
;   20 -> 2d22  bc_op20_print               ; "text"
;   22 -> 2d19  bc_op22                       ? BC_SEQ_INIT
;   24 -> 2d7a  bc_op24                       ? BC_SEQ_NAV
;   26 -> 2de2  bc_op26                       ? BC_MODE
;   28 -> 2db6  bc_op28                       ? 0 + a string
;   2a -> 2eff  bc_op2a                       ? 2 + a string
;   2c -> 2ef1  bc_op2c_text_shaded
;   2e -> 2ebf  bc_op2e                       ? 6 operands
;   30 -> 2795  bc_unimplemented
;   32 -> 2f8c  bc_op32                       ? BC_OP_32
;   34 -> 2f97  bc_op34                       ? BC_ARITH_EXT
;   36 -> 2fa6  bc_op36                       ? BC_FIELD
;   38 -> 2fb6  bc_op38                       ? BC_ARITH
;   3a -> 2fe8  bc_op3a                       ? BC_OP_3A
;   3c -> 308a  bc_op3c                       ? BC_JUMP_3C
;   3e -> 3099  bc_op3e                       ? BC_CALL
;   40 -> 30a6  bc_op40                       ? 2 operands
;   42 -> 30b3  bc_op42                       ? BC_OP_42
;   44 -> 3069  bc_op44                       ? BC_UI_MENU
;   46 -> 3079  bc_op46                       ? BC_UI_DIALOG
;   48 -> 2795  bc_unimplemented
;   4a -> 2795  bc_unimplemented
;   4c -> 2795  bc_unimplemented
;   4e -> 2795  bc_unimplemented
;   50 -> 32d3  bc_op50                       ? BC_MEM_ALLOC
;   52 -> 33cd  bc_op52                       ? BC_MEM_FREE
;   54 -> 332d  bc_op54                       ? BC_MEM_COPY
;   56 -> 33ec  bc_op56                       ? BC_MEM_FULL
;   58 -> 337d  bc_op58                       ? 3 operands
;   5a -> 340f  bc_op5a                       ? 3 operands
;   5c -> 3429  bc_op5c                       ? BC_UI_5C
;   5e -> 34ea  bc_op5e                       ? BC_UI_5E
;   60 -> 3513  bc_op60                       ? BC_CLEAR_RECT
;   62 -> 353c  bc_op62                       ? BC_UI_CTRL
;   64 -> 3588  bc_op64                       ? 7 operands
;   66 -> 37f1  bc_op66                       ? BC_WAIT
;   68 -> 2c0b  bc_op68_soft_keys           ; fkey,style,"label"
;   6a -> 2ca0  bc_op6a                       ? BC_WAIT_LOAD
;   6c -> 2cb2  bc_op6c                       ? BC_BUFFER
;   6e -> 35c6  bc_op6e_pixel1              ; set 1 px
;   70 -> 35d0  bc_op70_pixel2              ; set 2 px
;   72 -> 35e1  bc_op72_pixel3              ; set 3 px
;   74 -> 35f5  bc_op74                       ? BC_TEST_MODE
;   76 -> 3688  bc_op76                       ? BC_FILE_DIALOG
;   78 -> 2795  bc_unimplemented
;   7a -> 2795  bc_unimplemented
;   7c -> 2795  bc_unimplemented
;   7e -> 2795  bc_unimplemented
;   80 -> 2795  bc_unimplemented
;   82 -> 2795  bc_unimplemented
;   84 -> 3564  bc_op84                       ? BC_UI_84
;   86 -> 3825  bc_op86                       ? BC_16_LEVELS_6
;   88 -> 2be7  bc_op88_clear_planes_660    ; clear all planes (660h)
;   8a -> 2795  bc_unimplemented
;   8c -> 2ba8  bc_op8c_plane_push_visible  ; push plane, select bv_lcd_fb
;   8e -> 2bbc  bc_op8e_plane_pop           ; pop plane
;   90 -> 2e3c  bc_op90_put_hex_high        ; put high nibble pair as hex
;   92 -> 2e08  bc_op92_put_hex             ; put byte as hex
;   94 -> 2e4a  bc_op94_putchar             ; put one character
;   96 -> 2795  bc_unimplemented
bc_handler_table:                       ; 76 words indexed by the opcode byte
        db      96h, 27h, 0d1h, 28h, 7eh, 2bh, 85h, 2bh, 8ch, 2bh, 9ah, 2bh, 0c3h, 2bh, 78h, 2fh ; .'.(~+.+.+.+.+x/
        db      6ah, 2fh, 43h, 32h, 72h, 2eh, 50h, 2eh, 8ch, 2eh, 0abh, 2eh, 0c9h, 2ch, 0ebh, 2ch ; j/C2r.P......,.,
        db      22h, 2dh, 19h, 2dh, 7ah, 2dh, 0e2h, 2dh, 0b6h, 2dh, 0ffh, 2eh, 0f1h, 2eh, 0bfh, 2eh ; "-.-z-.-.-......
        db      95h, 27h, 8ch, 2fh, 97h, 2fh, 0a6h, 2fh, 0b6h, 2fh, 0e8h, 2fh, 8ah, 30h, 99h, 30h ; .'./././././.0.0
        db      0a6h, 30h, 0b3h, 30h, 69h, 30h, 79h, 30h, 95h, 27h, 95h, 27h, 95h, 27h, 95h, 27h ; .0.0i0y0.'.'.'.'
        db      0d3h, 32h, 0cdh, 33h, 2dh, 33h, 0ech, 33h, 7dh, 33h, 0fh, 34h, 29h, 34h, 0eah, 34h ; .2.3-3.3}3.4)4.4
        db      13h, 35h, 3ch, 35h, 88h, 35h, 0f1h, 37h, 0bh, 2ch, 0a0h, 2ch, 0b2h, 2ch, 0c6h, 35h ; .5<5.5.7.,.,.,.5
        db      0d0h, 35h, 0e1h, 35h, 0f5h, 35h, 88h, 36h, 95h, 27h, 95h, 27h, 95h, 27h, 95h, 27h ; .5.5.5.6.'.'.'.'
        db      95h, 27h, 95h, 27h, 64h, 35h, 25h, 38h, 0e7h, 2bh, 95h, 27h, 0a8h, 2bh, 0bch, 2bh ; .'.'d5%8.+.'.+.+
        db      3ch, 2eh, 08h, 2eh, 4ah, 2eh, 95h, 27h
bc_unimplemented:                       ; shared RET for the 13 unimplemented opcodes
        ret

; ===========================================================================
; LCD PANEL DRIVER  (0x2796-0x3842)
; ===========================================================================
; two chips at 60h/62h (left) and 100h/102h (right); cmd 21h latches
; byte-column, 20h streams row bytes; bit 7 of command port is busy.
; lcd_blit_column: 60 rows (cx=3Ch), byte-columns 0..13h (left) and 14h..1Fh
; (right); 20 per chip: 320-px addressing, 248x60 glass. bc_fetch_xy clamps
; x<0F8h (248) and y<3Ch (60). 7 planes selected by bv_plane_cur; bv_lcd_fb
; clocked out. byte-identical to MPC2000.EXE: ROM 2796h == EXE v1.72 offset
; 14658h == v1.50 offset 14106h.

bc_op00_lcd_init:                       ; duty/display-on, clear, diagonal self-test
        mov     al, 23h
        call    lcd_cmd_left
        mov     al, 85h
        call    lcd_wait_left
        call    lcd_data_left
        mov     al, 24h
        call    lcd_cmd_left
        mov     al, 1
        call    lcd_wait_left
        call    lcd_data_left
        mov     al, 23h
        call    lcd_cmd_right
        mov     al, 8dh
        call    lcd_wait_right
        call    lcd_data_right
        mov     al, 24h
        call    lcd_cmd_right
        mov     al, 1
        call    lcd_wait_right
        call    lcd_data_right
        call    lcd_settle_delay
        mov     bl, 0
lcd_init_clear_col:
        mov     al, 22h
        call    lcd_cmd_right
        mov     al, bl
        call    lcd_wait_right
        call    lcd_data_right
        mov     al, 21h
        call    lcd_cmd_right
        mov     al, 0
        call    lcd_wait_right
        call    lcd_data_right
        mov     al, 20h
        call    lcd_cmd_right
        mov     cx, 14h
lcd_init_clear_row:
        mov     al, 0
        call    lcd_wait_right
        call    lcd_data_right
        loop    lcd_init_clear_row
        inc     bl
        cmp     bl, 41h
        jne     lcd_init_clear_col
        call    lcd_settle_delay
        mov     cx, 0
        mov     bl, 64h
lcd_init_selftest:
        push    cx
        push    bx
        mov     al, 22h
        call    lcd_cmd_right
        mov     al, cl
        call    lcd_wait_right
        call    lcd_data_right
        mov     al, 21h
        call    lcd_cmd_right
        mov     al, bl
        sub     ah, ah
        mov     cl, 8
        div     cl
        mov     bl, ah
        sub     bh, bh
        call    lcd_wait_right
        call    lcd_data_right
        mov     al, 20h
        call    lcd_cmd_right
        add     bx, 2888h
        mov     al, byte ptr cs:[bx]
        call    lcd_wait_right
        call    lcd_data_right
        pop     bx
        pop     cx
        inc     bl
        inc     cl
        cmp     cl, 3ch
        jne     lcd_init_selftest
        mov     al, 23h
        call    lcd_cmd_left
        mov     al, 5
        call    lcd_wait_left
        call    lcd_data_left
        mov     al, 24h
        call    lcd_cmd_left
        mov     al, 1
        call    lcd_wait_left
        call    lcd_data_left
        mov     al, 23h
        call    lcd_cmd_right
        mov     al, 2dh
        call    lcd_wait_right
        call    lcd_data_right
        mov     al, 24h
        call    lcd_cmd_right
        mov     al, 1
        call    lcd_wait_right
        call    lcd_data_right
        call    lcd_settle_delay
        call    L_02D4D
        ret
; lcd_init_selftest pattern: single-bit masks 80h shifted right 0..7.
        db      80h, 40h, 20h, 10h, 08h, 04h, 02h, 01h
lcd_cmd_left:                           ; command byte -> port 60h
        mov     dx, 60h
        out     dx, al
        ret
lcd_data_left:                          ; data byte -> port 62h
        mov     dx, 62h
        out     dx, al
        ret
lcd_wait_left:                          ; spin while bit 7 of port 60h is set, bounded by CX
        push    ax
        push    cx
        mov     cx, 0ffffh
L_0289F:
        mov     dx, 60h
        in      al, dx
        test    al, 80h
        je      L_028A9
        loop    L_0289F
L_028A9:
        pop     cx
        pop     ax
        ret
lcd_cmd_right:                          ; command byte -> port 100h
        mov     dx, 100h
        out     dx, al
        ret
lcd_data_right:                         ; data byte -> port 102h
        mov     dx, 102h
        out     dx, al
        ret
lcd_wait_right:                         ; spin while bit 7 of port 100h is set
        push    ax
        push    cx
        mov     cx, 0ffffh
L_028BB:
        mov     dx, 100h
        in      al, dx
        test    al, 80h
        je      L_028C5
        loop    L_028BB
L_028C5:
        pop     cx
        pop     ax
        ret
lcd_settle_delay:                       ; 10000 x DEC CX
        push    cx
        mov     cx, 2710h
L_028CC:
        dec     cx
        jne     L_028CC
        pop     cx
        ret
bc_op02_lcd_blit:                       ; if the current plane is bv_lcd_fb, blit the whole panel
        cmp     word ptr [bv_plane_cur], bv_lcd_fb
        jne     L_028DC
        jmp     lcd_blit_all
L_028DC:
        mov     bh, 0
        mov     bl, 0
        mov     cx, 3ch
L_028E3:
        call    L_02902
        inc     bl
        cmp     bl, 20h
        jne     L_028E3
        cmp     byte ptr [379dh], 0
        je      L_028F7
        jmp     L_02A36
L_028F7:
        cmp     byte ptr [379eh], 0
        je      L_02901
        jmp     L_02AEF
L_02901:
        ret
L_02902:
        cmp     bl, 14h
        jae     L_0294F
        push    bx
        push    cx
        mov     al, 22h
        call    lcd_cmd_left
        mov     al, 0
        call    lcd_wait_left
        call    lcd_data_left
        mov     al, 21h
        call    lcd_cmd_left
        mov     al, bl
        call    lcd_wait_left
        call    lcd_data_left
        mov     al, 20h
        call    lcd_cmd_left
        sub     bh, bh
L_0292A:
        mov     ah, byte ptr [bx+143ch]
        or      ah, byte ptr [bx+1bbch]
        xor     ah, byte ptr [bx+233ch]
        mov     dx, 60h
        in      al, dx
        shl     al, 1
        je      L_02941
        call    lcd_wait_left
L_02941:
        mov     al, ah
        mov     dx, 62h
        out     dx, al
        add     bx, 20h
        loop    L_0292A
        pop     cx
        pop     bx
        ret
L_0294F:
        push    bx
        push    cx
        mov     al, 22h
        call    lcd_cmd_right
        mov     al, 0
        call    lcd_wait_right
        call    lcd_data_right
        mov     al, 21h
        call    lcd_cmd_right
        mov     al, bl
        sub     al, 14h
        call    lcd_wait_right
        call    lcd_data_right
        mov     al, 20h
        call    lcd_cmd_right
        sub     bh, bh
L_02974:
        mov     ah, byte ptr [bx+143ch]
        or      ah, byte ptr [bx+1bbch]
        xor     ah, byte ptr [bx+233ch]
        mov     dx, 100h
        in      al, dx
        shl     al, 1
        je      L_0298B
        call    lcd_wait_right
L_0298B:
        mov     al, ah
        mov     dx, 102h
        out     dx, al
        add     bx, 20h
        loop    L_02974
        pop     cx
        pop     bx
        ret
lcd_blit_all:                           ; 32 byte-columns x 60 rows
        mov     bh, 0
        mov     bl, 0
        mov     cx, 3ch
lcd_blit_next_col:
        call    lcd_blit_column
        inc     bl
        cmp     bl, 20h
        jne     lcd_blit_next_col
        ret
lcd_blit_column:                        ; columns 0..13h go to the left chip, 14h..1Fh to the right
        cmp     bl, 14h
        jae     L_029F2
        push    bx
        push    cx
        mov     al, 22h
        call    lcd_cmd_left
        mov     al, 0
        call    lcd_wait_left
        call    lcd_data_left
        mov     al, 21h
        call    lcd_cmd_left
        mov     al, bl
        call    lcd_wait_left
        call    lcd_data_left
        mov     al, 20h
        call    lcd_cmd_left
        sub     bh, bh
        add     bx, 301ch
L_029D7:
        mov     ah, byte ptr [bx]
        mov     dx, 60h
        in      al, dx
        shl     al, 1
        je      L_029E4
        call    lcd_wait_left
L_029E4:
        mov     al, ah
        mov     dx, 62h
        out     dx, al
        add     bx, 20h
        loop    L_029D7
        pop     cx
        pop     bx
        ret
L_029F2:
        push    bx
        push    cx
        mov     al, 22h
        call    lcd_cmd_right
        mov     al, 0
        call    lcd_wait_right
        call    lcd_data_right
        mov     al, 21h
        call    lcd_cmd_right
        mov     al, bl
        sub     al, 14h
        call    lcd_wait_right
        call    lcd_data_right
        mov     al, 20h
        call    lcd_cmd_right
        sub     bh, bh
        add     bx, 301ch
L_02A1B:
        mov     ah, byte ptr [bx]
        mov     dx, 100h
        in      al, dx
        shl     al, 1
        je      L_02A28
        call    lcd_wait_right
L_02A28:
        mov     al, ah
        mov     dx, 102h
        out     dx, al
        add     bx, 20h
        loop    L_02A1B
        pop     cx
        pop     bx
        ret
L_02A36:
        mov     bh, 14h
        mov     bl, 0
        mov     cx, 11h
L_02A3D:
        call    L_02A52
        inc     bl
        cmp     bl, 20h
        jne     L_02A3D
        cmp     byte ptr [379eh], 0
        je      L_02A51
        jmp     L_02AEF
L_02A51:
        ret
L_02A52:
        cmp     bl, 14h
        jae     L_02AA2
        push    bx
        push    cx
        mov     al, 22h
        call    lcd_cmd_left
        mov     al, bh
        call    lcd_wait_left
        call    lcd_data_left
        mov     al, 21h
        call    lcd_cmd_left
        mov     al, bl
        call    lcd_wait_left
        call    lcd_data_left
        mov     al, 20h
        call    lcd_cmd_left
        mov     al, 20h
        mul     bh
        sub     bh, bh
        add     bx, ax
L_02A80:
        mov     al, byte ptr [bx+143ch]
        or      al, byte ptr [bx+1bbch]
        xor     al, byte ptr [bx+233ch]
        or      al, byte ptr [bx+283ch]
        xor     al, byte ptr [bx+2a5ch]
        call    lcd_wait_left
        call    lcd_data_left
        add     bx, 20h
        loop    L_02A80
        pop     cx
        pop     bx
        ret
L_02AA2:
        push    bx
        push    cx
        mov     al, 22h
        call    lcd_cmd_right
        mov     al, bh
        call    lcd_wait_right
        call    lcd_data_right
        mov     al, 21h
        call    lcd_cmd_right
        mov     al, bl
        sub     al, 14h
        call    lcd_wait_right
        call    lcd_data_right
        mov     al, 20h
        call    lcd_cmd_right
        mov     al, 20h
        mul     bh
        sub     bh, bh
        add     bx, ax
L_02ACD:
        mov     al, byte ptr [bx+143ch]
        or      al, byte ptr [bx+1bbch]
        xor     al, byte ptr [bx+233ch]
        or      al, byte ptr [bx+283ch]
        xor     al, byte ptr [bx+2a5ch]
        call    lcd_wait_right
        call    lcd_data_right
        add     bx, 20h
        loop    L_02ACD
        pop     cx
        pop     bx
        ret
L_02AEF:
        mov     bh, 33h
        mov     bl, 0
        mov     cx, 9
L_02AF6:
        call    L_02B01
        inc     bl
        cmp     bl, 20h
        jne     L_02AF6
        ret
L_02B01:
        cmp     bl, 14h
        jae     L_02B41
        push    bx
        push    cx
        mov     al, 22h
        call    lcd_cmd_left
        mov     al, bh
        call    lcd_wait_left
        call    lcd_data_left
        mov     al, 21h
        call    lcd_cmd_left
        mov     al, bl
        call    lcd_wait_left
        call    lcd_data_left
        mov     al, 20h
        call    lcd_cmd_left
        mov     al, 20h
        mul     bh
        sub     bh, bh
        add     bx, ax
L_02B2F:
        mov     al, byte ptr [bx+289ch]
        call    lcd_wait_left
        call    lcd_data_left
        add     bx, 20h
        loop    L_02B2F
        pop     cx
        pop     bx
        ret
L_02B41:
        push    bx
        push    cx
        mov     al, 22h
        call    lcd_cmd_right
        mov     al, bh
        call    lcd_wait_right
        call    lcd_data_right
        mov     al, 21h
        call    lcd_cmd_right
        mov     al, bl
        sub     al, 14h
        call    lcd_wait_right
        call    lcd_data_right
        mov     al, 20h
        call    lcd_cmd_right
        mov     al, 20h
        mul     bh
        sub     bh, bh
        add     bx, ax
L_02B6C:
        mov     al, byte ptr [bx+289ch]
        call    lcd_wait_right
        call    lcd_data_right
        add     bx, 20h
        loop    L_02B6C
        pop     cx
        pop     bx
        ret
bc_op04_plane_a:
        mov     word ptr [bv_plane_cur], bv_plane_a
        ret
bc_op06_plane_b:
        mov     word ptr [bv_plane_cur], bv_plane_b
        ret
bc_op08_plane_c:
        mov     word ptr [bv_plane_cur], bv_plane_c
        ret
plane_select_d:
        mov     word ptr [bv_plane_cur], bv_plane_d
        ret
bc_op0a_plane_e:
        mov     word ptr [bv_plane_cur], bv_plane_e
        ret
plane_select_f:
        mov     word ptr [bv_plane_cur], bv_plane_f
        ret
bc_op8c_plane_push_visible:
        mov     ax, word ptr [bv_plane_cur]
        mov     word ptr [bv_plane_saved], ax
        mov     word ptr [bv_plane_cur], bv_lcd_fb
        ret
plane_push:                             ; save bv_plane_cur into bv_plane_saved
        mov     ax, word ptr [bv_plane_cur]
        mov     word ptr [bv_plane_saved], ax
        ret
bc_op8e_plane_pop:
        mov     ax, word ptr [bv_plane_saved]
        mov     word ptr [bv_plane_cur], ax
        ret
bc_op0c_clear_planes:
        mov     ax, ds
        mov     es, ax
        mov     di, bv_plane_a
        call    plane_clear_780
        mov     di, bv_plane_b
        call    plane_clear_780
        mov     di, bv_plane_c
plane_clear_780:                        ; zero a full 60-row plane and reset the pen
        mov     cx, 3c0h
        sub     ax, ax
        rep stosw
        mov     word ptr [bv_pen_x], ax
        mov     word ptr [bv_pen_y], ax
        call    bc_op04_plane_a
        ret
bc_op88_clear_planes_660:
        mov     ax, ds
        mov     es, ax
        mov     di, bv_plane_a
        call    plane_clear_660
        mov     di, bv_plane_b
        call    plane_clear_660
        mov     di, bv_plane_c
plane_clear_660:                        ; zero 660h bytes
        mov     cx, 330h
        sub     ax, ax
        rep stosw
        mov     word ptr [bv_pen_x], ax
        mov     word ptr [bv_pen_y], ax
        call    bc_op04_plane_a
        ret
bc_op68_soft_keys:
        call    plane_push
        mov     al, byte ptr es:[bp]
        inc     bp
        or      al, al
        jne     L_02C18
        ret
L_02C18:
        cmp     al, 7
        jb      L_02C1D
        ret
L_02C1D:
        dec     al
        mov     ah, byte ptr es:[bp]
        inc     bp
        call    L_02C5D
        call    L_02C2E
        call    bc_op8e_plane_pop
        ret
L_02C2E:
        push    ax
        call    bc_op04_plane_a
        mov     ah, 0
        call    L_02C60
        mov     si, bp
        sub     bx, bx
        dec     bl
        dec     si
L_02C3E:
        inc     si
        inc     bl
        cmp     byte ptr es:[si], 0
        jne     L_02C3E
        mov     cl, byte ptr cs:[bx+2c99h]
        mov     bl, al
        add     cl, byte ptr cs:[bx+2c93h]
        mov     ch, 34h
        call    bc_clamp_xy
        call    L_02F7D
        pop     ax
        ret
L_02C5D:
        call    bc_op08_plane_c
L_02C60:
        push    ax
        push    bp
        push    es
        call    L_02C6A
        pop     es
        pop     bp
        pop     ax
        ret
L_02C6A:
        mov     bl, al
        sub     bh, bh
        mov     cl, byte ptr cs:[bx+2c93h]
        mov     ch, 33h
        mov     bl, 27h
        mov     bh, 9
        push    ax
        push    bx
        push    cx
        call    L_03533
        pop     cx
        pop     bx
        pop     ax
        cmp     ah, 1
        jne     L_02C8A
        jmp     L_0348A
L_02C8A:
        cmp     ah, 2
        jne     L_02C92
        jmp     L_0350A
L_02C92:
        ret
; soft-key geometry, read by bc_op68_soft_keys:
;   0x2C93  6 bytes  x origin of F1..F6: 2, 2Bh, 54h, 7Dh, 0A6h, 0CFh
;                    -- six keys evenly across the 248 px panel
;   0x2C99  7 bytes  centring indent by label length 0..6: 14h down to 2
;                    in steps of 3 (half a 6 px character pitch)
        add     ch, byte ptr [bp+di]
        push    sp
        jge     L_02C3E
        iret
        db      14h, 11h, 0eh, 0bh, 08h, 05h, 02h
bc_op6a:
        call    plane_push
        mov     al, 0
L_02CA5:
        call    L_02C2E
        inc     al
        cmp     al, 6
        jne     L_02CA5
        call    bc_op8e_plane_pop
        ret
bc_op6c:
        call    plane_push
        mov     al, 0
L_02CB7:
        mov     ah, byte ptr es:[bp]
        inc     bp
        call    L_02C5D
        inc     al
        cmp     al, 6
        jne     L_02CB7
        call    bc_op8e_plane_pop
        ret
bc_op1c:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        add     bp, 2
        mov     ah, 3
        mov     dx, cs
        mov     si, 2ce5h
        or      al, al
        je      L_02CE2
        add     si, 3
L_02CE2:
        jmp     bc_op14_puts_far
; "ON " / "OFF" -- the two 3-character states bc_op1c renders.
        db      "ON OFF"
bc_op1e:
        push    bp
        push    es
        call    plane_push
        push    dx
        push    si
        mov     word ptr [bv_plane_cur], bv_plane_e
        BC_CLEAR_RECT 50, 5, 156, 7
        pop     si
        pop     dx
        mov     cl, 32h
        mov     ch, 5
        mov     ah, 1ah
        call    bc_op14_puts_far
        call    bc_op8e_plane_pop
        mov     byte ptr [379dh], 1
        call    bc_op02_lcd_blit
        pop     es
        pop     bp
        ret
bc_op22:
        mov     byte ptr [379dh], 0
        call    bc_op02_lcd_blit
        ret
bc_op20_print:
        call    plane_push
        push    es
        push    bp
        mov     word ptr [bv_plane_cur], bv_plane_e
        BC_CLEAR_RECT 50, 5, 156, 7
        mov     cl, 32h
        mov     ch, 5
        call    bc_clamp_xy
        pop     bp
        pop     es
        call    L_02F7D
        call    bc_op8e_plane_pop
        mov     byte ptr [379dh], 1
        call    bc_op02_lcd_blit
        ret
L_02D4D:
        push    bp
        call    plane_select_d
        BC_LCD_BITMAP 36, 0, "ABBBBBBBBBC"
        db      0e8h                                                    ; .
        xor     al, 0feh
        BC_LCD_BITMAP 36, 0, "DEEEEEEEEEF"
        db      5dh, 0c3h                                               ; ].
bc_op24:
        mov     byte ptr [379eh], 1
        call    plane_push
        call    plane_select_f
        push    bp
        BC_CLEAR_RECT 0, 0, 248, 9
        BC_UI_5C 166, 0, 39, 9
        BC_UI_5C 207, 0, 39, 9
        BC_STATUS 180, 1, "NO"
        BC_STATUS 218, 1, "YES"
        call    bc_op8e_plane_pop
        pop     bp
        ret
bc_op28:
        mov     byte ptr [379eh], 1
        call    plane_push
        call    plane_select_f
        BC_CLEAR_RECT 0, 0, 248, 9
        BC_UI_5E 207, 0, 28, 9
        BC_LCD_TEXT 208, 001h, "CANCEL"
        db      0e8h, 0dbh                                              ; ..
        std
        ret
bc_op26:
        mov     byte ptr [379eh], 0
        mov     byte ptr [379dh], 0
        ret
        BC_SOFTKEY 4, BC_SK_BOX,   "CANCEL"
        BC_SOFTKEY 5, BC_SK_BOX,   "  GO  "
        db      0c3h                                                    ; .
bc_op92_put_hex:
        db      50h                                                     ; P
        push    cx
        mov     si, hex_digit_table
        mov     bl, al
        sub     bh, bh
        shr     bl, 4
        mov     al, byte ptr cs:[bx+si]
        call    bc_op94_putchar
        pop     cx
        pop     ax
        add     cl, 6
        mov     bl, al
        and     bl, 0fh
        sub     bh, bh
        mov     al, byte ptr cs:[bx+si]
        jmp     bc_op94_putchar
        ret

; hex_digit_table -- "0123456789ABCDEF" plus 'P' and 'Q'.
hex_digit_table:                        ; "0123456789ABCDEF" + 'P' + 'Q'
        db      "0123456789ABCDEF" ; 0123456789ABCDEF
bc_op90_put_hex_high:
        push    ax
        push    cx
        mov     al, ah
        call    bc_op92_put_hex
        pop     cx
        pop     ax
        add     cl, 0ch
        jmp     bc_op92_put_hex
bc_op94_putchar:
        call    bc_clamp_xy
        jmp     draw_glyph
bc_op16:
        call    bc_fetch_xy
        mov     si, word ptr es:[bp]
        add     bp, 2
        mov     al, byte ptr [si]
        mov     si, word ptr es:[bp]
        add     bp, 2
        mov     ah, byte ptr [si]
        inc     si
        push    ax
        mul     ah
        add     si, ax
        mov     ax, ds
        mov     es, ax
        pop     ax
        jmp     L_02E77
bc_op14_puts_far:
        mov     es, dx
        call    bc_clamp_xy
L_02E77:
        mov     al, byte ptr es:[si]
        inc     si
        or      al, al
        jne     L_02E80
        ret
L_02E80:
        push    ax
        push    es
        call    draw_glyph
        pop     es
        pop     ax
        dec     ah
        jne     L_02E77
        ret
bc_op18:
        push    dx
        call    bc_fetch_xy
        mov     ah, byte ptr es:[bp]
        inc     bp
        pop     es
L_02E96:
        mov     al, byte ptr es:[si]
        inc     si
        or      al, al
        jne     L_02E9F
        ret
L_02E9F:
        push    ax
        push    es
        call    draw_glyph
        pop     es
        pop     ax
        dec     ah
        jne     L_02E96
        ret
bc_op1a:
        call    bc_fetch_xy
        mov     si, word ptr es:[bp]
        inc     bp
        inc     bp
L_02EB4:
        lodsb
        or      al, al
        jne     L_02EBA
        ret
L_02EBA:
        call    draw_glyph
        jmp     L_02EB4
bc_op2e:
        call    bc_fetch_xy
        mov     si, word ptr es:[bp]
        add     bp, 2
        mov     al, byte ptr [si]
        mov     si, word ptr es:[bp]
        add     bp, 2
        mov     ah, byte ptr [si]
        inc     si
        push    ax
        mul     ah
        add     si, ax
        pop     ax
L_02EDB:
        mov     al, byte ptr [si]
        inc     si
        or      al, al
        jne     L_02EE3
        ret
L_02EE3:
        push    ax
        push    es
        push    si
        call    L_02F11
        pop     si
        pop     es
        pop     ax
        dec     ah
        jne     L_02EDB
        ret
bc_op2c_text_shaded:
        mov     byte ptr [bv_text_xor], 0e0h
        call    bc_op2a
        mov     byte ptr [bv_text_xor], 0
        ret
bc_op2a:
        call    bc_fetch_xy
L_02F02:
        mov     al, byte ptr es:[bp]
        inc     bp
        cmp     al, 0
        jne     L_02F0C
        ret
L_02F0C:
        call    L_02F11
        jmp     L_02F02
L_02F11:
        sub     al, 20h
        push    cx
        push    di
        push    si
        mov     ch, 5
        mul     ch
        mov     si, 3b2ch
        add     si, ax
        mov     bl, cl
        sub     bh, bh
        shl     bx, 1
        mov     dx, word ptr cs:[bx+2f5ah]
L_02F2A:
        mov     ah, byte ptr [di]
        mov     al, byte ptr [di+1]
        and     ax, dx
        mov     bh, byte ptr [si]
        xor     bh, byte ptr [bv_text_xor]
        sub     bl, bl
        shr     bx, cl
        or      ax, bx
        mov     byte ptr [di], ah
        mov     byte ptr [di+1], al
        inc     si
        add     di, 20h
        dec     ch
        jne     L_02F2A
        pop     si
        pop     di
        pop     cx
        add     cl, 4
        cmp     cl, 8
        jb      L_02F59
        sub     cl, 8
        inc     di
L_02F59:
        ret
        callf   [bx]
        dec     word ptr [bx-3801h]
        jmp     bx
; 4 word masks, byte-swapped as the framebuffer is read.  ?
        db      0ffh, 0f1h, 0ffh, 0f8h, 7fh, 0fch, 3fh, 0feh
bc_op10_text_inverse:
        mov     byte ptr [bv_text_xor], 0fch
        call    bc_op0e_text
        mov     byte ptr [bv_text_xor], 0
        ret
bc_op0e_text:
        sub     ax, ax
        call    bc_fetch_xy
L_02F7D:
        mov     al, byte ptr es:[bp]
        inc     bp
        or      al, al
        jne     L_02F87
        ret
L_02F87:
        call    draw_glyph
        jmp     L_02F7D
bc_op32:
        call    bc_fetch_xy
L_02F8F:
        mov     byte ptr [bv_zero_suppress], 1
        jmp     put_digit
bc_op34:
        call    bc_fetch_xy
        mov     byte ptr [bv_zero_suppress], 0
        sub     ah, ah
        call    put_decimal
        jmp     L_02F8F
bc_op36:
        call    bc_fetch_xy
L_02FA9:
        mov     byte ptr [bv_zero_suppress], 0
L_02FAE:
        call    put_dec_100
        call    put_decimal
        jmp     L_02F8F
bc_op38:
        call    bc_fetch_xy
        mov     byte ptr [bv_zero_suppress], 0
L_02FBE:
        call    put_dec_1000
        jmp     L_02FAE
; code, not data, 29 bytes: `push dx / call bc_fetch_xy / pop dx /
; mov byte [bv_zero_suppress],0 / mov bx,ax / mov si,dx / sub bx,86a0h ...`
; -- a sibling of bc_op3a just below.
        db      52h, 0e8h, 7bh, 08h, 5ah, 0c6h, 06h, 0aah, 37h, 00h, 8bh, 0d8h, 8bh, 0f2h, 81h, 0ebh
        db      0a0h, 86h, 83h, 0deh, 01h, 72h, 06h, 0b8h, 9fh, 86h, 0bah, 01h, 00h
L_02FE0:
        mov     bx, 2710h
        call    L_030C8
        jmp     L_02FBE
bc_op3a:
        push    dx
        call    bc_fetch_xy
        pop     dx
        mov     byte ptr [bv_zero_suppress], 0
L_02FF2:
        mov     bx, ax
        mov     si, dx
        sub     bx, 4240h
        sbb     si, 0fh
        jb      L_03005
        mov     ax, 423fh
        mov     dx, 0fh
L_03005:
        push    di
        push    si
        mov     si, 86a0h
        mov     di, 1
        mov     bl, 0ffh
L_0300F:
        inc     bl
        sub     ax, si
        sbb     dx, di
        jae     L_0300F
        add     ax, si
        adc     dx, di
        pop     si
        pop     di
        push    ax
        push    dx
        mov     al, bl
        call    put_digit
        pop     dx
        pop     ax
        jmp     L_02FE0
        push    dx
        call    bc_fetch_xy
        pop     dx
        mov     byte ptr [bv_zero_suppress], 0
        mov     bx, ax
        mov     si, dx
        sub     bx, 9680h
        sbb     si, 98h
        jb      L_03046
        mov     ax, 967fh
        mov     dx, 98h
L_03046:
        push    di
        push    si
        mov     si, 4240h
        mov     di, 0fh
        mov     bl, 0ffh
L_03050:
        inc     bl
        sub     ax, si
        sbb     dx, di
        jae     L_03050
        add     ax, si
        adc     dx, di
        pop     si
        pop     di
        push    ax
        push    dx
        mov     al, bl
        call    put_digit
        pop     dx
        pop     ax
        jmp     L_02FF2
bc_op44:
        call    bc_fetch_xy
        mov     byte ptr [bv_zero_suppress], 1
        sub     ah, ah
        call    put_decimal
        jmp     L_02F8F
bc_op46:
        call    bc_fetch_xy
        mov     byte ptr [bv_zero_suppress], 1
        call    put_dec_100
        call    put_decimal
        jmp     L_02F8F
bc_op3c:
        sub     ah, ah
        cmp     al, 0ah
        jb      L_03093
        jmp     bc_op34
L_03093:
        add     cl, 3
        jmp     bc_op32
bc_op3e:
        cmp     ax, 64h
        jb      L_030A1
        jmp     bc_op36
L_030A1:
        add     cl, 3
        jmp     bc_op3c
bc_op40:
        cmp     ax, 3e8h
        jb      L_030AE
        jmp     bc_op38
L_030AE:
        add     cl, 3
        jmp     bc_op3e
bc_op42:
        call    bc_clamp_xy
        jmp     L_02FA9
put_dec_1000:                           ; put_decimal with the divisor preset to 3E8h
        mov     bx, 3e8h
        jmp     L_030C6
put_dec_100:                            ; ... and to 64h
        mov     bx, 64h
        jmp     L_030C6

; ===========================================================================
; TEXT AND NUMBER RENDERING  (0x30C3-0x3243)
; ===========================================================================
; draw_glyph is the bottom of it: 7 rows per glyph from bv_font, ORed into
; the plane through glyph_hole_masks and bit_reverse_table, pen advanced 6
; px.  put_decimal recurses on DIV 10 with bv_zero_suppress deciding
; whether a leading zero prints as space or digit.

put_decimal:
        mov     bx, 0ah
L_030C6:
        sub     dx, dx
L_030C8:
        div     bx
        push    dx
        call    put_digit
        pop     ax
        ret
put_digit:
        or      byte ptr [bv_zero_suppress], al
        cmp     byte ptr [bv_zero_suppress], 0
        jne     L_030DF
        mov     al, 20h
        jmp     draw_glyph
L_030DF:
        or      al, 30h
        jmp     draw_glyph
draw_glyph:                             ; 7 rows from bv_font + 7*AL, masked, bit-reversed, pen += 6 px
        mov     ch, 7
        push    es
        push    si
        push    cx
        push    di
        mul     ch
        mov     si, bv_font
        add     si, ax
        mov     bl, cl
        sub     bh, bh
        shl     bx, 1
        mov     dx, word ptr cs:[bx+3133h]
draw_glyph_row:
        mov     ah, byte ptr [di]
        mov     al, byte ptr [di+1]
        and     ax, dx
        mov     bl, byte ptr [si]
        sub     bh, bh
        mov     bh, byte ptr cs:[bx+3143h]
        xor     bh, byte ptr [bv_text_xor]
        sub     bl, bl
        shr     bx, cl
        or      ax, bx
        mov     byte ptr [di], ah
        mov     byte ptr [di+1], al
        inc     si
        add     di, 20h
        dec     ch
        jne     draw_glyph_row
        pop     di
        pop     cx
        pop     si
        pop     es
        add     cl, 6
        cmp     cl, 8
        jb      L_03132
        sub     cl, 8
        inc     di
L_03132:
        ret

; glyph_hole_masks -- 8 words, indexed by (x AND 7).  draw_glyph reads the
; framebuffer word byte-swapped (mov ah,[di] / mov al,[di+1]) and ANDs with
; this to punch a 6-px hole before ORing the glyph row in.
glyph_hole_masks:                       ; 8 words, indexed by x AND 7
        db      0ffh, 03h, 0ffh, 81h, 0ffh, 0c0h, 7fh, 0e0h, 3fh, 0f0h, 1fh, 0f8h, 0fh, 0fch, 07h, 0feh

; bit_reverse_table -- 256 bytes, table[n] = n with its bits reversed.
; Font rows are stored bit 0 = leftmost; the panel wants the opposite.
bit_reverse_table:                      ; 256 bytes, table[n] = bit-reversed n
        db      00h, 80h, 40h, 0c0h, 20h, 0a0h, 60h, 0e0h, 10h, 90h, 50h, 0d0h, 30h, 0b0h, 70h, 0f0h
        db      08h, 88h, 48h, 0c8h, 28h, 0a8h, 68h, 0e8h, 18h, 98h, 58h, 0d8h, 38h, 0b8h, 78h, 0f8h
        db      04h, 84h, 44h, 0c4h, 24h, 0a4h, 64h, 0e4h, 14h, 94h, 54h, 0d4h, 34h, 0b4h, 74h, 0f4h
        db      0ch, 8ch, 4ch, 0cch, 2ch, 0ach, 6ch, 0ech, 1ch, 9ch, 5ch, 0dch, 3ch, 0bch, 7ch, 0fch
        db      02h, 82h, 42h, 0c2h, 22h, 0a2h, 62h, 0e2h, 12h, 92h, 52h, 0d2h, 32h, 0b2h, 72h, 0f2h
        db      0ah, 8ah, 4ah, 0cah, 2ah, 0aah, 6ah, 0eah, 1ah, 9ah, 5ah, 0dah, 3ah, 0bah, 7ah, 0fah
        db      06h, 86h, 46h, 0c6h, 26h, 0a6h, 66h, 0e6h, 16h, 96h, 56h, 0d6h, 36h, 0b6h, 76h, 0f6h
        db      0eh, 8eh, 4eh, 0ceh, 2eh, 0aeh, 6eh, 0eeh, 1eh, 9eh, 5eh, 0deh, 3eh, 0beh, 7eh, 0feh
        db      01h, 81h, 41h, 0c1h, 21h, 0a1h, 61h, 0e1h, 11h, 91h, 51h, 0d1h, 31h, 0b1h, 71h, 0f1h
        db      09h, 89h, 49h, 0c9h, 29h, 0a9h, 69h, 0e9h, 19h, 99h, 59h, 0d9h, 39h, 0b9h, 79h, 0f9h
        db      05h, 85h, 45h, 0c5h, 25h, 0a5h, 65h, 0e5h, 15h, 95h, 55h, 0d5h, 35h, 0b5h, 75h, 0f5h
        db      0dh, 8dh, 4dh, 0cdh, 2dh, 0adh, 6dh, 0edh, 1dh, 9dh, 5dh, 0ddh, 3dh, 0bdh, 7dh, 0fdh
        db      03h, 83h, 43h, 0c3h, 23h, 0a3h, 63h, 0e3h, 13h, 93h, 53h, 0d3h, 33h, 0b3h, 73h, 0f3h
        db      0bh, 8bh, 4bh, 0cbh, 2bh, 0abh, 6bh, 0ebh, 1bh, 9bh, 5bh, 0dbh, 3bh, 0bbh, 7bh, 0fbh
        db      07h, 87h, 47h, 0c7h, 27h, 0a7h, 67h, 0e7h, 17h, 97h, 57h, 0d7h, 37h, 0b7h, 77h, 0f7h
        db      0fh, 8fh, 4fh, 0cfh, 2fh, 0afh, 6fh, 0efh, 1fh, 9fh, 5fh, 0dfh, 3fh, 0bfh, 7fh, 0ffh
bc_op12_box_chars:
        call    bc_fetch_xy
L_03246:
        mov     al, byte ptr es:[bp]
        inc     bp
        cmp     al, 0
        jne     L_03250
        ret
L_03250:
        sub     al, 41h
        call    L_03257
        jmp     L_03246
L_03257:
        push    di
        mov     ah, 22h
        mul     ah
        mov     si, 3b31h
        add     si, ax
        mov     ch, 11h
L_03263:
        push    cx
        mov     bl, cl
        shl     bl, 1
        add     bl, cl
        sub     bh, bh
        add     bx, 32bbh
        mov     ch, byte ptr cs:[bx]
        mov     cl, byte ptr cs:[bx+1]
        mov     dl, byte ptr cs:[bx+2]
        mov     ah, byte ptr [di]
        mov     al, byte ptr [di+1]
        mov     dh, byte ptr [di+2]
        and     ax, cx
        and     dh, dl
        pop     cx
        mov     bx, word ptr [si]
        mov     dl, bl
        shr     bx, cl
        or      ax, bx
        mov     byte ptr [di], ah
        mov     byte ptr [di+1], al
        mov     bh, dl
        mov     bl, 0
        shr     bx, cl
        or      dh, bl
        mov     byte ptr [di+2], dh
        add     di, 20h
        add     si, 2
        dec     ch
        jne     L_03263
        pop     di
        add     cl, 10h
        mov     al, cl
        and     cl, 7
        shr     al, 3
        sub     ah, ah
        add     di, ax
        ret
; eight 3-byte bit-window masks, indexed by x AND 7: a 3-byte-wide hole
; punched at any pixel offset.  Used by the bc_op50/54/58 family.
        db      00h, 00h, 0ffh, 80h, 00h, 7fh, 0c0h, 00h, 3fh, 0e0h, 00h, 1fh, 0f0h, 00h, 0fh, 0f8h
        db      00h, 07h, 0fch, 00h, 03h, 0feh, 00h, 01h
bc_op50:
        call    bc_fetch_xy
        mov     bl, byte ptr es:[bp]
        inc     bp
L_032DB:
        mov     ax, ds
        mov     es, ax
        or      bl, bl
        je      L_0330B
        cmp     bl, 9
        jb      L_0330C
        mov     al, 0ffh
        shr     al, cl
        or      byte ptr [di], al
        inc     di
        xor     cl, 7
        inc     cl
        sub     bl, cl
        mov     cl, bl
        shr     cl, 3
        je      L_03301
        mov     al, 0ffh
        rep stosb
L_03301:
        and     bx, 7
        mov     al, byte ptr cs:[bx+331dh]
        or      byte ptr [di], al
L_0330B:
        ret
L_0330C:
        sub     bh, bh
        mov     ah, byte ptr cs:[bx+331dh]
        sub     al, al
        shr     ax, cl
        or      byte ptr [di], ah
        inc     di
        or      byte ptr [di], al
        ret
; "top n bits set" masks for n = 0..8: 00h 80h 0C0h ... 0FEh 0FFh.
        db      00h, 80h, 0c0h, 0e0h, 0f0h, 0f8h, 0fch, 0feh, 0ffh
L_03326:
        push    bx
        call    bc_clamp_xy
        pop     bx
        jmp     L_032DB
bc_op54:
        call    bc_fetch_xy
        mov     bl, byte ptr es:[bp]
        inc     bp
L_03335:
        mov     ax, ds
        mov     es, ax
        or      bl, bl
        je      L_03364
        cmp     bl, 9
        jb      L_03365
        mov     ax, 0aaaah
        shr     ax, cl
        or      byte ptr [di], ah
        inc     di
        xor     cl, 7
        inc     cl
        sub     bl, cl
        mov     cl, bl
        shr     cl, 3
        je      L_0335A
        rep stosb
L_0335A:
        and     bx, 7
        and     al, byte ptr cs:[bx+331dh]
        or      byte ptr [di], al
L_03364:
        ret
L_03365:
        sub     bh, bh
        and     ah, byte ptr cs:[bx+331dh]
        sub     al, al
        shr     ax, cl
        or      byte ptr [di], ah
        inc     di
        or      byte ptr [di], al
        ret
L_03376:
        push    bx
        call    bc_clamp_xy
        pop     bx
        jmp     L_03335
bc_op58:
        call    bc_fetch_xy
        mov     bl, byte ptr es:[bp]
        inc     bp
L_03385:
        mov     ax, ds
        mov     es, ax
        or      bl, bl
        je      L_033B9
        cmp     bl, 9
        jb      L_033BA
        mov     al, 0ffh
        shr     al, cl
        not     al
        and     byte ptr [di], al
        inc     di
        xor     cl, 7
        inc     cl
        sub     bl, cl
        mov     cl, bl
        shr     cl, 3
        je      L_033AD
        sub     al, al
        rep stosb
L_033AD:
        and     bx, 7
        mov     al, byte ptr cs:[bx+331dh]
        not     al
        and     byte ptr [di], al
L_033B9:
        ret
L_033BA:
        sub     bh, bh
        mov     ah, byte ptr cs:[bx+331dh]
        sub     al, al
        shr     ax, cl
        not     ax
        and     byte ptr [di], ah
        inc     di
        and     byte ptr [di], al
        ret
bc_op52:
        call    bc_fetch_xy
        mov     bl, byte ptr es:[bp]
        inc     bp
L_033D5:
        mov     al, 80h
        shr     al, cl
        mov     cl, bl
        jcxz    L_033E4
L_033DD:
        or      byte ptr [di], al
        add     di, 20h
        loop    L_033DD
L_033E4:
        ret
L_033E5:
        push    bx
        call    bc_clamp_xy
        pop     bx
        jmp     L_033D5
bc_op56:
        call    bc_fetch_xy
        mov     bl, byte ptr es:[bp]
        inc     bp
L_033F4:
        mov     al, 80h
        shr     al, cl
        sub     ah, ah
        mov     cl, bl
        jcxz    L_03407
        shr     cl, 1
L_03400:
        or      byte ptr [di], al
        add     di, 40h
        loop    L_03400
L_03407:
        ret
L_03408:
        push    bx
        call    bc_clamp_xy
        pop     bx
        jmp     L_033F4
bc_op5a:
        call    bc_fetch_xy
        mov     bl, byte ptr es:[bp]
        inc     bp
        mov     al, 80h
        shr     al, cl
        not     al
        mov     cl, bl
        jcxz    L_03428
L_03421:
        and     byte ptr [di], al
        add     di, 20h
        loop    L_03421
L_03428:
        ret
bc_op5c:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        call    bc_clamp_xy
        mov     bl, byte ptr es:[bp+2]
        push    es
        call    L_032DB
        pop     es
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        add     ch, byte ptr es:[bp+3]
        dec     ch
        and     ch, 3fh
        call    bc_clamp_xy
        mov     bl, byte ptr es:[bp+2]
        push    es
        call    L_032DB
        pop     es
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        call    bc_clamp_xy
        mov     bl, byte ptr es:[bp+3]
        push    es
        call    L_033D5
        pop     es
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        add     cl, byte ptr es:[bp+2]
        dec     cl
        call    bc_clamp_xy
        mov     bl, byte ptr es:[bp+3]
        call    L_033D5
        add     bp, 4
        ret
L_0348A:
        mov     byte ptr [37a6h], cl
        mov     byte ptr [37a7h], ch
        mov     byte ptr [37a8h], bl
        mov     byte ptr [37a9h], bh
        call    bc_clamp_xy
        mov     bl, byte ptr [37a8h]
        call    L_032DB
        mov     cl, byte ptr [37a6h]
        mov     ch, byte ptr [37a7h]
        add     ch, byte ptr [37a9h]
        dec     ch
        and     ch, 3fh
        call    bc_clamp_xy
        mov     bl, byte ptr [37a8h]
        call    L_032DB
        mov     cl, byte ptr [37a6h]
        mov     ch, byte ptr [37a7h]
        call    bc_clamp_xy
        mov     bl, byte ptr [37a9h]
        call    L_033D5
        mov     cl, byte ptr [37a6h]
        mov     ch, byte ptr [37a7h]
        add     cl, byte ptr [37a8h]
        dec     cl
        call    bc_clamp_xy
        mov     bl, byte ptr [37a9h]
        call    L_033D5
        ret
bc_op5e:
        call    bc_fetch_xy
        mov     bl, byte ptr es:[bp]
        inc     bp
        mov     bh, byte ptr es:[bp]
        inc     bp
L_034F7:
        push    bx
        push    cx
        push    di
        push    es
        call    L_032DB
        pop     es
        pop     di
        pop     cx
        pop     bx
        add     di, 20h
        dec     bh
        jne     L_034F7
        ret
L_0350A:
        push    bx
        call    bc_clamp_xy
        pop     bx
        call    L_034F7
        ret
bc_op60:
        call    bc_fetch_xy
        mov     bl, byte ptr es:[bp]
        inc     bp
        mov     bh, byte ptr es:[bp]
        inc     bp
L_03520:
        push    bx
        push    cx
        push    di
        push    es
        call    L_03385
        pop     es
        pop     di
        pop     cx
        pop     bx
        add     di, 20h
        dec     bh
        jne     L_03520
        ret
L_03533:
        push    bx
        call    bc_clamp_xy
        pop     bx
        call    L_03520
        ret
bc_op62:
        call    plane_push
        call    bc_op08_plane_c
        mov     cx, word ptr [bv_pen_x]
        mov     bx, word ptr [bv_pen_y]
        call    L_03533
        mov     cx, word ptr es:[bp]
        mov     bx, word ptr es:[bp+2]
        mov     word ptr [bv_pen_x], cx
        mov     word ptr [bv_pen_y], bx
        call    bc_op5e
        call    bc_op8e_plane_pop
        ret
bc_op84:
        push    dx
        push    cx
        call    plane_push
        call    bc_op08_plane_c
        mov     cx, word ptr [bv_pen_x]
        mov     bx, word ptr [bv_pen_y]
        call    L_03533
        pop     cx
        pop     bx
        mov     word ptr [bv_pen_x], cx
        mov     word ptr [bv_pen_y], bx
        call    L_0350A
        call    bc_op8e_plane_pop
        ret
bc_op64:
        call    plane_push
        call    bc_op08_plane_c
        mov     cx, word ptr [bv_pen_x]
        mov     bx, word ptr [bv_pen_y]
        call    L_03533
        mov     cx, word ptr es:[bp]
        mov     bx, word ptr es:[bp+2]
        mov     di, word ptr es:[bp+4]
        mov     al, byte ptr es:[bp+6]
        add     bp, 7
        mov     ah, byte ptr [di]
        mul     ah
        add     ch, al
        mov     word ptr [bv_pen_x], cx
        mov     word ptr [bv_pen_y], bx
        push    bx
        call    bc_clamp_xy
        pop     bx
        call    L_034F7
        call    bc_op8e_plane_pop
        ret
bc_op6e_pixel1:
        call    bc_fetch_xy
        mov     al, 80h
        shr     al, cl
        or      byte ptr [di], al
        ret
bc_op70_pixel2:
        call    bc_fetch_xy
        mov     ah, 0c0h
        sub     al, al
        shr     ax, cl
        xchg    ah, al
        or      word ptr [di], ax
        or      word ptr [di+20h], ax
        ret
bc_op72_pixel3:
        call    bc_fetch_xy
        mov     ah, 0e0h
        sub     al, al
        shr     ax, cl
        xchg    ah, al
        or      word ptr [di], ax
        or      word ptr [di+20h], ax
        or      word ptr [di+40h], ax
        ret
bc_op74:
        call    plane_push
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     bl, byte ptr es:[bp+2]
        mov     bh, byte ptr es:[bp+3]
        push    es
        call    bc_op08_plane_c
        pusha
        call    bc_op60
        popa
        call    bc_op06_plane_b
        pusha
        call    bc_op60
        popa
        call    bc_op04_plane_a
        pusha
        call    bc_op60
        popa
        pusha
        add     cl, 1
        add     ch, 1
        sub     bl, 2
        sub     bh, 2
        call    L_0348A
        popa
        pusha
        add     cl, 3
        add     ch, 3
        sub     bl, 6
        sub     bh, 6
        call    L_0348A
        popa
        pusha
        add     cl, 3
        add     ch, 0dh
        push    bx
        call    bc_clamp_xy
        pop     bx
        sub     bl, 6
        call    L_032DB
        popa
        pop     es
        add     bp, 4
        mov     si, bp
        mov     al, 0fdh
        dec     si
L_0365F:
        inc     si
        add     al, 3
        cmp     byte ptr es:[si], 0
        jne     L_0365F
        cmp     al, 0
        je      L_03682
        sub     bl, 6
        shr     bl, 1
        sub     bl, al
        add     cl, bl
        add     ch, 5
        call    bc_clamp_xy
        call    L_02F7D
        call    bc_op8e_plane_pop
        ret
L_03682:
        inc     bp
        inc     bp
        call    bc_op8e_plane_pop
        ret
bc_op76:
        call    plane_push
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     bl, byte ptr es:[bp+2]
        mov     bh, byte ptr es:[bp+3]
        add     bp, 4
        push    es
        call    bc_op08_plane_c
        pusha
        call    L_03533
        popa
        call    bc_op06_plane_b
        pusha
        call    L_03533
        popa
        call    bc_op04_plane_a
        pusha
        call    L_03533
        popa
        pusha
        add     cl, 2
        sub     bl, 4
        call    L_03326
        popa
        pusha
        add     cl, 2
        add     ch, bh
        sub     ch, 1
        sub     bl, 4
        call    L_03326
        popa
        pusha
        add     ch, 2
        mov     bl, bh
        sub     bl, 4
        call    L_033E5
        popa
        pusha
        add     ch, 2
        add     cl, bl
        sub     cl, 1
        mov     bl, bh
        sub     bl, 4
        call    L_033E5
        popa
        pusha
        add     cl, 1
        add     ch, 1
        call    bc_clamp_xy
        mov     al, 80h
        shr     al, cl
        or      byte ptr [di], al
        popa
        pusha
        add     cl, bl
        sub     cl, 2
        add     ch, 1
        call    bc_clamp_xy
        mov     al, 80h
        shr     al, cl
        or      byte ptr [di], al
        popa
        pusha
        add     cl, 1
        add     ch, bh
        sub     ch, 2
        call    bc_clamp_xy
        mov     al, 80h
        shr     al, cl
        or      byte ptr [di], al
        popa
        pusha
        add     cl, bl
        sub     cl, 2
        add     ch, bh
        sub     ch, 2
        call    bc_clamp_xy
        mov     al, 80h
        shr     al, cl
        or      byte ptr [di], al
        popa
        pusha
        add     cl, 4
        add     ch, 4
        sub     bl, 8
        sub     bh, 8
        call    L_0348A
        popa
        pusha
        add     cl, 4
        add     ch, 3
        sub     bl, 8
        call    L_03376
        popa
        pusha
        add     cl, 3
        add     ch, bh
        sub     ch, 2
        sub     bl, 5
        call    L_03376
        popa
        pusha
        add     cl, 3
        add     ch, 4
        mov     bl, bh
        sub     bl, 7
        call    L_03408
        popa
        pusha
        add     cl, bl
        sub     cl, 2
        add     ch, 3
        mov     bl, bh
        sub     bl, 5
        call    L_03408
        popa
        pop     es
        mov     si, bp
        mov     dl, 0fdh
        dec     si
L_03794:
        inc     si
        add     dl, 3
        cmp     byte ptr es:[si], 0
        jne     L_03794
        cmp     dl, 0
        je      L_037DA
        pusha
        push    es
        call    bc_op08_plane_c
        call    L_037E0
        call    bc_op06_plane_b
        call    L_037E0
        call    bc_op04_plane_a
        call    L_037E0
        add     cl, 14h
        sub     ch, 2
        sub     bl, 28h
        mov     bh, 9
        call    L_0348A
        pop     es
        popa
        shr     bl, 1
        add     cl, bl
        sub     cl, dl
        sub     ch, 1
        call    bc_clamp_xy
        call    L_02F7D
        call    bc_op8e_plane_pop
        ret
L_037DA:
        inc     bp
        inc     bp
        call    bc_op8e_plane_pop
        ret
L_037E0:
        pusha
        add     cl, 14h
        sub     ch, 2
        sub     bl, 28h
        mov     bh, 9
        call    L_03533
        popa
        ret
bc_op66:
        call    bc_fetch_xy
        mov     si, word ptr es:[bp]
        add     bp, 2
L_037FB:
        lodsb
        or      al, al
        jne     L_03801
        ret
L_03801:
        mov     bl, al
        sub     bh, bh
        lodsb
        mov     ch, al
L_03808:
        push    bx
L_03809:
        lodsb
        mov     ah, al
        sub     al, al
        shr     ax, cl
        or      byte ptr [di], ah
        or      byte ptr [di+1], al
        inc     di
        dec     bl
        jne     L_03809
        pop     bx
        add     di, 20h
        sub     di, bx
        dec     ch
        jne     L_03808
        ret
bc_op86:
        call    bc_fetch_xy
        mov     si, word ptr es:[bp]
        add     bp, 2
        mov     al, byte ptr [si]
        mov     si, word ptr es:[bp]
        add     bp, 2
        sub     ah, ah
        shl     ax, 1
        add     si, ax
        mov     si, word ptr [si]
        jmp     L_037FB
bc_fetch_xy:                            ; CL = x from the operand stream, CH = y; clamps to 248 x 60
        mov     cl, byte ptr es:[bp]
        inc     bp
        mov     ch, byte ptr es:[bp]
        inc     bp
bc_clamp_xy:                            ; the same with CL/CH already loaded
        mov     dx, ax
        cmp     cl, 0f8h
        jb      L_03855
        mov     cl, 0
L_03855:
        cmp     ch, 3ch
        jb      L_0385C
        mov     ch, 0
L_0385C:
        mov     bl, cl
        and     cl, 7
        shr     bl, 3
        sub     bh, bh
        mov     al, 20h
        mul     ch
        add     ax, bx
        add     ax, word ptr [bv_plane_cur]
        mov     di, ax
        sub     ch, ch
        mov     ax, dx
        ret
        db      00h

; ===========================================================================
; MB89352 SCSI TRANSPORT  (0x3878-0x41A0)
; ===========================================================================
; Everything behind INT 2Dh.  This block is the only C-compiled code in the
; ROM -- ENTER/LEAVE, arguments pushed on the stack, RET n -- and it is the
; only code that touches the MB89352 registers at ports 00h-1Ch even.

L_03878:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp+4]
        mov     word ptr [bv_scsi_ctx], ax
        sub     ax, ax
        mov     word ptr [3d44h], ax
        mov     word ptr [3d42h], ax
        mov     word ptr [3d48h], ax
        mov     word ptr [3d46h], ax
        push    word ptr [bp+6]
        call    L_03A5A
        cmp     ax, 1
        sbb     ax, ax
        neg     ax
        leave
        ret     4
L_038A0:
        push    si
        push    word ptr [bv_scsi_ctx]
        push    ds
        push    3d42h
        push    ds
        push    3d46h
        call    L_03C6A
        mov     si, ax
        or      si, ax
        je      L_038C4
        sub     ax, ax
        mov     word ptr [3d44h], ax
        mov     word ptr [3d42h], ax
        mov     word ptr [3d48h], ax
        mov     word ptr [3d46h], ax
L_038C4:
        mov     ax, si
        pop     si
        ret
L_038C8:
        push    bp
        mov     bp, sp
        push    si
        push    word ptr [bv_scsi_ctx]
        call    L_03D8A
        mov     si, ax
        cmp     si, 2
        jne     L_038E6
        cmp     byte ptr [3d4ch], 6
        jne     L_038E6
        call    L_038A0
        mov     si, ax
L_038E6:
        or      si, ax
        jne     L_03966
        mov     ax, word ptr [3d44h]
        or      ax, word ptr [3d42h]
        je      L_038FC
        mov     ax, word ptr [3d48h]
        or      ax, word ptr [3d46h]
        jne     L_03905
L_038FC:
        call    L_038A0
        mov     si, ax
        or      si, ax
        jne     L_03966
L_03905:
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        add     ax, word ptr [bp+4]
        adc     dx, 0
        cmp     dx, word ptr [3d44h]
        jb      L_03928
        ja      L_0391F
        cmp     ax, word ptr [3d42h]
        jbe     L_03928
L_0391F:
        mov     ax, 0ff01h
        pop     si
        leave
        ret     0ch
        db      90h
L_03928:
        cmp     word ptr [bp+0eh], 1
        jne     L_0394A
        push    word ptr [bv_scsi_ctx]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp+4]
        push    word ptr [3d46h]
        call    L_03BDC
        jmp     L_03964
L_0394A:
        push    word ptr [bv_scsi_ctx]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp+4]
        push    word ptr [3d46h]
        call    L_03DC6
L_03964:
        mov     si, ax
L_03966:
        mov     ax, si
        pop     si
        leave
        ret     0ch
        db      90h
int2dh_dispatch:                        ; AH = sub-function; the MB89352 SCSI transport API
        pusha
        push    ds
        push    es
        mov     bp, sp
        push    ds
        mov     ax, 41ah
        mov     ds, ax
        cld
        sti
        mov     al, byte ptr [bp+13h]
        sub     ah, ah
        cmp     ax, 0feh
        jne     L_03988
        jmp     scsi_svc_fe
L_03988:
        jg      L_039A8
        cmp     ax, 7
        ja      L_039B0
        add     ax, ax
        xchg    bx, ax
        jmp     word ptr cs:[bx+3998h]

; int2dh_dispatch sub-function table, AH = 0..7 (AH=0FEh and 0FFh are
; handled separately; anything else returns AX=0FF00h).  Entries:
;   0 -> 39b8  scsi_svc_init            4 -> 39fc  scsi_svc_04
;   1 -> 39cc  scsi_svc_rw              5 -> 3a06  scsi_svc_05
;   2 -> 39cc  scsi_svc_rw              6 -> 3a10  scsi_svc_read_capacity
;   3 -> 39e8  scsi_svc_request_sense   7 -> 3a30  scsi_svc_07
        db      90h, 0b8h, 39h, 0cch, 39h, 0cch, 39h, 0e8h, 39h, 0fch, 39h, 06h, 3ah, 10h, 3ah, 30h ; ..9.9.9.9.9.:.:0
        db      3ah
L_039A8:
        sub     ax, 0ffh
        jne     L_039B0
        jmp     scsi_svc_ff_status
L_039B0:
        mov     word ptr [bp+12h], 0ff00h
        jmp     int2dh_return
scsi_svc_init:                          ; named by table position only  ; ?
        mov     al, byte ptr [bp+0fh]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [bp+0eh]
        push    ax
        call    L_03878
L_039C5:
        mov     word ptr [bp+12h], ax
        jmp     int2dh_return
        db      90h
scsi_svc_rw:                            ; named by table position only  ; ?
        mov     al, byte ptr [bp+13h]
        sub     ah, ah
        push    ax
        push    word ptr [bp+0ch]
        push    word ptr [bp+0eh]
        mov     ax, word ptr [bp+4]
        mov     dx, word ptr [bp]
        push    dx
        push    ax
        push    word ptr [bp+10h]
        call    L_038C8
        jmp     L_039C5
scsi_svc_request_sense:                 ; named by table position only  ; ?
        push    word ptr [bv_scsi_ctx]
        mov     ax, word ptr [bp+4]
        mov     dx, word ptr [bp+0eh]
        push    dx
        push    ax
        push    word ptr [bp+10h]
        call    L_03B80
        jmp     L_039C5
scsi_svc_04:                            ; named by table position only  ; ?
        push    word ptr [bv_scsi_ctx]
        call    L_03B36
        jmp     L_039C5
        db      90h
scsi_svc_05:                            ; named by table position only  ; ?
        push    word ptr [bv_scsi_ctx]
        call    L_03D8A
        jmp     L_039C5
        db      90h
scsi_svc_read_capacity:                 ; returns the capacity words out of bv_scsi_ctx+2..+8
        call    L_038A0
        mov     word ptr [bp+12h], ax
        mov     ax, word ptr [3d44h]
        mov     word ptr [bp+0eh], ax
        mov     ax, word ptr [3d42h]
        mov     word ptr [bp+4], ax
        mov     ax, word ptr [3d48h]
        mov     word ptr [bp+0ch], ax
        mov     ax, word ptr [3d46h]
        mov     word ptr [bp+6], ax
        jmp     int2dh_return
scsi_svc_07:                            ; named by table position only  ; ?
        call    L_04180
        jmp     int2dh_return
        db      90h
scsi_svc_fe:                            ; named by table position only  ; ?
        mov     ax, word ptr [bp+4]
        mov     dx, word ptr [bp+0eh]
        push    dx
        push    ax
        call    L_03A68
        jmp     L_039C5
        db      90h
scsi_svc_ff_status:                     ; AH=0FFh: fetch the last status
        mov     word ptr [bp+12h], 0
        mov     ax, ds
        mov     word ptr [bp+0eh], ax
        mov     word ptr [bp+4], 3d4ah
int2dh_return:                          ; common exit; the result is left in the saved AX on the frame
        mov     sp, bp
        pop     es
        pop     ds
        popa
        iret
        db      90h
L_03A5A:
        push    bp
        mov     bp, sp
        push    word ptr [bp+4]
        call    L_04132
        leave
        ret     2
        db      90h
L_03A68:
        enter   0ch, 0
        push    di
        push    si
        les     bx, [bp+4]
        mov     si, bx
        mov     word ptr [bp-2], es
        mov     ax, word ptr es:[bx+14h]
        mov     dx, word ptr es:[bx+16h]
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        mov     ax, word ptr es:[bx+4]
        mov     dx, word ptr es:[bx+6]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        push    es
        push    bx
        call    L_0400A
        mov     di, ax
        or      di, ax
        je      L_03AA6
L_03A9D:
        mov     ax, di
        pop     si
        pop     di
        leave
        ret     4
        db      90h
L_03AA6:
        mov     es, word ptr [bp-2]
        cmp     byte ptr es:[si+1ch], 2
        jne     L_03B2A
        mov     byte ptr es:[si+8], 3
        xor     al, al
        mov     byte ptr es:[si+9], al
        mov     byte ptr es:[si+0ah], al
        mov     byte ptr es:[si+0bh], al
        mov     cl, byte ptr es:[si+3]
        mov     byte ptr es:[si+0ch], cl
        mov     byte ptr es:[si+0dh], al
        mov     byte ptr es:[si+2], 6
        mov     ax, word ptr es:[si+18h]
        mov     dx, word ptr es:[si+1ah]
        mov     word ptr es:[si+14h], ax
        mov     word ptr es:[si+16h], dx
        mov     al, byte ptr es:[si+3]
        sub     ah, ah
        mov     word ptr es:[si+4], ax
        mov     word ptr es:[si+6], 0
        push    es
        push    si
        call    L_0400A
        mov     di, ax
        mov     ax, word ptr [bp-0ch]
        mov     dx, word ptr [bp-0ah]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+14h], ax
        mov     word ptr es:[si+16h], dx
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        mov     word ptr es:[si+4], ax
        mov     word ptr es:[si+6], dx
        or      di, di
        je      L_03B21
        jmp     L_03A9D
L_03B21:
        mov     ax, 2
        pop     si
        pop     di
        leave
        ret     4
L_03B2A:
        mov     al, byte ptr es:[si+1ch]
        sub     ah, ah
        pop     si
        pop     di
        leave
        ret     4
L_03B36:
        push    bp
        mov     bp, sp
        push    di
        xor     ax, ax
        mov     bx, 3d5ch
        mov     cx, 0fh
        mov     di, bx
        push    ds
        pop     es
        rep stosw
        mov     word ptr [3d74h], 3d4ah
        mov     word ptr [3d76h], ds
        mov     byte ptr [3d5fh], 12h
        mov     ax, word ptr [bp+4]
        mov     word ptr [3d5ch], ax
        mov     byte ptr [3d64h], 4
        mov     byte ptr [3d5eh], 6
        sub     ax, ax
        mov     word ptr [3d72h], ax
        mov     word ptr [3d70h], ax
        mov     word ptr [3d62h], ax
        mov     word ptr [3d60h], ax
        push    ds
        push    bx
        call    L_03A68
        pop     di
        leave
        ret     2
        db      90h
L_03B80:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     si, word ptr [bp+4]
        xor     ax, ax
        mov     bx, 3d5ch
        mov     cx, 0fh
        mov     di, bx
        push    ds
        pop     es
        rep stosw
        mov     word ptr [3d74h], 3d4ah
        mov     word ptr [3d76h], ds
        mov     ax, word ptr [bp+0ah]
        mov     word ptr [3d5ch], ax
        mov     al, 12h
        mov     byte ptr [3d5fh], al
        mov     byte ptr [3d64h], al
        mov     ax, si
        mov     byte ptr [3d68h], al
        mov     byte ptr [3d5eh], 6
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr [3d70h], ax
        mov     word ptr [3d72h], dx
        mov     ax, si
        cwd
        mov     word ptr [3d60h], si
        mov     word ptr [3d62h], dx
        push    ds
        push    bx
        call    L_03A68
        pop     si
        pop     di
        leave
        ret     8
        db      90h
L_03BDC:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     si, word ptr [bp+6]
        xor     ax, ax
        mov     bx, 3d5ch
        mov     cx, 0fh
        mov     di, bx
        push    ds
        pop     es
        rep stosw
        mov     word ptr [3d74h], 3d4ah
        mov     word ptr [3d76h], ds
        mov     byte ptr [3d5fh], 12h
        mov     ax, word ptr [bp+10h]
        mov     word ptr [3d5ch], ax
        mov     byte ptr [3d64h], 28h
        mov     al, byte ptr [bp+0bh]
        sub     ah, ah
        mov     byte ptr [3d66h], al
        mov     al, byte ptr [bp+0ah]
        mov     byte ptr [3d67h], al
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        mov     al, ah
        mov     ah, dl
        mov     dl, dh
        sub     dh, dh
        mov     byte ptr [3d68h], al
        mov     al, byte ptr [bp+8]
        mov     byte ptr [3d69h], al
        mov     ax, si
        mov     al, ah
        mov     byte ptr [3d6bh], ah
        mov     ax, si
        mov     byte ptr [3d6ch], al
        mov     byte ptr [3d5eh], 0ah
        mov     ax, word ptr [bp+0ch]
        mov     dx, word ptr [bp+0eh]
        mov     word ptr [3d70h], ax
        mov     word ptr [3d72h], dx
        mov     ax, si
        mul     word ptr [bp+4]
        mov     word ptr [3d60h], ax
        mov     word ptr [3d62h], 0
        push    ds
        push    bx
        call    L_03A68
        pop     si
        pop     di
        leave
        ret     0eh
        db      90h
L_03C6A:
        enter   8, 0
        push    di
        push    si
        xor     ax, ax
        mov     bx, 3d5ch
        mov     cx, 0fh
        mov     di, bx
        push    ds
        pop     es
        rep stosw
        mov     cx, 4
        lea     di, [bp-8]
        push    ss
        pop     es
        rep stosw
        mov     word ptr [3d74h], 3d4ah
        mov     word ptr [3d76h], ds
        mov     byte ptr [3d5fh], 12h
        mov     ax, word ptr [bp+0ch]
        mov     word ptr [3d5ch], ax
        mov     byte ptr [3d64h], 25h
        mov     byte ptr [3d5eh], 0ah
        lea     ax, [bp-8]
        mov     word ptr [3d70h], ax
        mov     word ptr [3d72h], ss
        mov     word ptr [3d60h], 8
        mov     word ptr [3d62h], 0
        push    ds
        push    bx
        call    L_03A68
        mov     si, ax
        mov     al, byte ptr [bp-8]
        sub     ah, ah
        shl     ax, 8
        mov     cl, byte ptr [bp-7]
        sub     ch, ch
        add     ax, cx
        mov     dx, ax
        sub     cx, cx
        mov     ah, byte ptr [bp-6]
        sub     al, al
        add     cx, ax
        adc     dx, 0
        mov     al, byte ptr [bp-5]
        sub     ah, ah
        add     cx, ax
        adc     dx, 0
        les     bx, [bp+8]
        mov     word ptr es:[bx], cx
        mov     word ptr es:[bx+2], dx
        mov     al, byte ptr [bp-4]
        shl     ax, 8
        mov     cl, byte ptr [bp-3]
        sub     ch, ch
        add     ax, cx
        mov     dx, ax
        sub     cx, cx
        mov     ah, byte ptr [bp-2]
        sub     al, al
        add     cx, ax
        adc     dx, 0
        mov     al, byte ptr [bp-1]
        sub     ah, ah
        add     cx, ax
        adc     dx, 0
        les     bx, [bp+4]
        mov     word ptr es:[bx], cx
        mov     word ptr es:[bx+2], dx
        mov     ax, si
        pop     si
        pop     di
        leave
        ret     0ah
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     si, word ptr [bp+4]
        xor     ax, ax
        mov     bx, 3d5ch
        mov     cx, 0fh
        mov     di, bx
        push    ds
        pop     es
        rep stosw
        mov     word ptr [3d74h], 3d4ah
        mov     word ptr [3d76h], ds
        mov     byte ptr [3d5fh], 12h
        mov     ax, word ptr [bp+0ah]
        mov     word ptr [3d5ch], ax
        mov     byte ptr [3d64h], 3
        mov     ax, si
        mov     byte ptr [3d68h], al
        mov     byte ptr [3d5eh], 6
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr [3d70h], ax
        mov     word ptr [3d72h], dx
        mov     ax, si
        cwd
        mov     word ptr [3d60h], si
        mov     word ptr [3d62h], dx
        push    ds
        push    bx
        call    L_03A68
        pop     si
        pop     di
        leave
        ret     8
        db      90h
L_03D8A:
        push    bp
        mov     bp, sp
        push    di
        xor     ax, ax
        mov     bx, 3d5ch
        mov     cx, 0fh
        mov     di, bx
        push    ds
        pop     es
        rep stosw
        mov     word ptr [3d74h], 3d4ah
        mov     word ptr [3d76h], ds
        mov     byte ptr [3d5fh], 12h
        mov     ax, word ptr [bp+4]
        mov     word ptr [3d5ch], ax
        mov     byte ptr [3d64h], 0
        mov     byte ptr [3d5eh], 6
        push    ds
        push    bx
        call    L_03A68
        pop     di
        leave
        ret     2
        db      90h
L_03DC6:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     si, word ptr [bp+6]
        xor     ax, ax
        mov     bx, 3d5ch
        mov     cx, 0fh
        mov     di, bx
        push    ds
        pop     es
        rep stosw
        mov     word ptr [3d74h], 3d4ah
        mov     word ptr [3d76h], ds
        mov     byte ptr [3d5fh], 12h
        mov     ax, word ptr [bp+10h]
        mov     word ptr [3d5ch], ax
        mov     byte ptr [3d64h], 2ah
        mov     al, byte ptr [bp+0bh]
        sub     ah, ah
        mov     byte ptr [3d66h], al
        mov     al, byte ptr [bp+0ah]
        mov     byte ptr [3d67h], al
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        mov     al, ah
        mov     ah, dl
        mov     dl, dh
        sub     dh, dh
        mov     byte ptr [3d68h], al
        mov     al, byte ptr [bp+8]
        mov     byte ptr [3d69h], al
        mov     ax, si
        mov     al, ah
        mov     byte ptr [3d6bh], ah
        mov     ax, si
        mov     byte ptr [3d6ch], al
        mov     byte ptr [3d5eh], 0ah
        mov     ax, word ptr [bp+0ch]
        mov     dx, word ptr [bp+0eh]
        mov     word ptr [3d70h], ax
        mov     word ptr [3d72h], dx
        mov     ax, si
        mul     word ptr [bp+4]
        mov     word ptr [3d60h], ax
        mov     word ptr [3d62h], 0
        push    ds
        push    bx
        call    L_03A68
        pop     si
        pop     di
        leave
        ret     0eh
        db      90h
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp+4]
        out     0, al
        leave
        ret     2
L_03E60:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp+4]
        out     4, al
        mov     cx, 1eh
L_03E6B:
        loop    L_03E6B
        leave
        ret     2
        db      90h
L_03E72:
        in      al, 0ah
        test    al, 80h
        je      L_03E72
        ret
        db      90h
L_03E7A:
        push    0c0h
        call    L_03E60
        ret
        db      90h
L_03E82:
        enter   6, 0
        push    si
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        in      al, 10h
        and     ax, 1
        mov     si, ax
        mov     al, byte ptr [bp+6]
        sub     ah, ah
        out     18h, al
        mov     ax, word ptr [bp+4]
        mov     al, ah
        sub     ah, ah
        out     1ah, al
        mov     al, byte ptr [bp+4]
        out     1ch, al
        or      si, si
        je      L_03EC0
        cmp     word ptr [3d7ah], 0
        je      L_03EC0
        push    8ch
        jmp     L_03EC3
        db      90h
L_03EC0:
        push    84h
L_03EC3:
        call    L_03E60
L_03EC6:
        in      al, 0ch
        and     al, 0f0h
        cmp     al, 0b0h
        jne     L_03EC6
L_03ECE:
        in      al, 8
        mov     bl, al
        sub     bh, bh
        or      bx, bx
        je      L_03EF6
        test    bl, 8
        jne     L_03EE0
        jmp     L_03F70
L_03EE0:
        mov     word ptr [3d7ah], 1
        in      al, 0ch
        and     al, 0f0h
        cmp     al, 90h
        jne     L_03EFC
        mov     ax, 0fffbh
        pop     si
        leave
        ret     8
L_03EF6:
        in      al, 0eh
        test    al, 0c0h
        jne     L_03F78
L_03EFC:
        in      al, 0ch
        mov     bl, al
        and     bx, 3
        or      si, si
        jne     L_03F26
        cmp     bx, 2
        je      L_03F44
        les     bx, [bp-4]
        sub     ah, ah
        mov     al, byte ptr es:[bx]
        out     14h, al
        add     word ptr [bp-4], 1
        sbb     ax, ax
        and     ax, 1000h
        add     word ptr [bp-2], ax
        jmp     L_03F3C
        db      90h, 90h
L_03F26:
        dec     bx
        je      L_03F44
        in      al, 14h
        les     bx, [bp-4]
        add     word ptr [bp-4], 1
        jae     L_03F39
        add     word ptr [bp-2], 1000h
L_03F39:
        mov     byte ptr es:[bx], al
L_03F3C:
        sub     word ptr [bp+4], 1
        sbb     word ptr [bp+6], 0
L_03F44:
        mov     ax, word ptr [bp+6]
        or      ax, word ptr [bp+4]
        jne     L_03ECE
L_03F4C:
        in      al, 8
        test    al, 10h
        je      L_03F4C
        mov     ax, 10h
        out     8, al
        in      al, 0ah
        and     al, 87h
        mov     cx, ax
        in      al, 10h
        and     al, 7
        or      al, 80h
        cmp     al, cl
        je      L_03F80
        xor     ax, ax
        pop     si
        leave
        ret     8
        db      90h, 90h
L_03F70:
        mov     ax, 0fffch
        pop     si
        leave
        ret     8
L_03F78:
        mov     ax, 0fffdh
        pop     si
        leave
        ret     8
L_03F80:
        xor     ax, ax
        out     16h, al
        push    85h
        call    L_03E60
L_03F8A:
        in      al, 8
        and     al, 18h
        cmp     al, 18h
        je      L_03F8A
        mov     ax, 18h
        out     8, al
        mov     ax, 1
        pop     si
        leave
        ret     8
        db      90h
L_03FA0:
        push    bp
        mov     bp, sp
        in      al, 8
        sub     ah, ah
        out     8, al
        xor     ax, ax
        out     10h, al
        xor     dx, dx
        in      al, dx
        mov     cl, byte ptr [bp+4]
        mov     dx, 1
        shl     dx, cl
        or      ax, dx
        out     16h, al
        mov     ax, 0fh
        out     18h, al
        mov     ax, 46h
        out     1ah, al
        mov     ax, 4
        out     1ch, al
        push    20h
        call    L_03E60
L_03FD0:
        in      al, 8
        or      al, al
        jne     L_03FE4
        in      al, 0ch
        test    al, 0e0h
        jne     L_03FD0
        mov     ax, 0fffeh
        leave
        ret     2
        db      90h
L_03FE4:
        in      al, 8
        mov     bl, al
        sub     bh, bh
        mov     ax, bx
        out     8, al
        test    al, 10h
        je      L_03FF8
        xor     ax, ax
        leave
        ret     2
L_03FF8:
        mov     al, bl
        and     ax, 4
        cmp     ax, 1
        sbb     ax, ax
        and     al, 0fdh
        dec     ax
        leave
        ret     2
        db      90h
L_0400A:
        enter   4, 0
        push    di
        push    si
        mov     di, word ptr [bp+4]
        mov     es, word ptr [bp+6]
        mov     al, byte ptr es:[di+9]
        shr     al, 5
        or      al, 80h
        mov     byte ptr [bp-3], al
        push    word ptr es:[di]
        call    L_03FA0
        mov     si, ax
        or      si, ax
        jge     L_04031
        jmp     L_04129
L_04031:
        mov     word ptr [3d7ah], 0
        call    L_03E72
L_0403A:
        in      al, 0ah
        sub     ah, ah
        mov     word ptr [bp-2], ax
        and     word ptr [bp-2], 7
        mov     ax, word ptr [bp-2]
        or      al, 80h
        out     10h, al
        mov     ax, word ptr [bp-2]
        cmp     ax, 7
        ja      L_0406C
        add     ax, ax
        xchg    bx, ax
        jmp     word ptr cs:[bx+405ch]
; eight word entries, 4072h 4072h 408Ch 40A4h 406Ch 406Ch 40B4h 40BAh --
; a dispatch table inside the C SCSI layer.  ?
        db      72h, 40h, 72h, 40h, 8ch, 40h, 0a4h, 40h, 6ch, 40h, 6ch, 40h, 0b4h, 40h, 0bah, 40h ; r@r@.@.@l@l@.@.@
L_0406C:
        mov     si, 0fffah
        jmp     L_040CC
        db      90h
        mov     es, word ptr [bp+6]
        push    word ptr es:[di+16h]
        push    word ptr es:[di+14h]
        push    word ptr es:[di+6]
        push    word ptr es:[di+4]
L_04085:
        call    L_03E82
        mov     si, ax
        jmp     L_040CC
        mov     ax, di
        mov     dx, word ptr [bp+6]
        add     ax, 8
        push    dx
        push    ax
        mov     es, dx
        mov     al, byte ptr es:[di+2]
        sub     ah, ah
        push    0
        push    ax
        jmp     L_04085
        db      90h
        mov     ax, di
        mov     dx, word ptr [bp+6]
        add     ax, 1ch
        push    dx
L_040AD:
        push    ax
        push    0
        push    1
        jmp     L_04085
        lea     ax, [bp-3]
        push    ss
        jmp     L_040AD
        lea     ax, [bp-3]
        push    ss
        push    ax
        push    0
        push    1
        call    L_03E82
        mov     si, ax
        or      si, ax
        jge     L_040E6
L_040CC:
        or      si, si
        jge     L_040D5
        cmp     si, -5
        jne     L_04118
L_040D5:
        mov     bx, word ptr [bp-2]
L_040D8:
        in      al, 0ah
        and     ax, 7
        cmp     ax, bx
        je      L_040E4
        jmp     L_0403A
L_040E4:
        jmp     L_040D8
L_040E6:
        call    L_03E7A
        mov     ax, 10h
        out     8, al
        cmp     byte ptr [bp-3], ah
        je      L_040FC
        mov     ax, 0fff9h
        pop     si
        pop     di
        leave
        ret     4
L_040FC:
        in      al, 8
        test    al, 20h
        je      L_040FC
        in      al, 0ah
        and     ax, 7
        out     10h, al
        in      al, 8
        sub     ah, ah
        out     8, al
        mov     al, byte ptr [bp-3]
        pop     si
        pop     di
        leave
        ret     4
L_04118:
        in      al, 0ah
        mov     bl, al
        and     bx, 7
        mov     ax, bx
        out     10h, al
        in      al, 8
        sub     ah, ah
        out     8, al
L_04129:
        mov     ax, si
        pop     si
        pop     di
        leave
        ret     4
        db      90h
L_04132:
        enter   2, 0
        mov     bx, word ptr [bp+4]
        mov     ax, bx
        out     0, al
        mov     ax, 0c0h
        out     2, al
        in      al, 0
        mov     cx, bx
        mov     dx, 1
        shl     dx, cl
        cmp     ax, dx
        jne     L_0417A
        in      al, 2
        cmp     al, 0c0h
        jne     L_0417A
        mov     ax, bx
        out     0, al
        xor     ax, ax
        out     10h, al
        in      al, 8
        out     8, al
        xor     ax, ax
        out     18h, al
        out     1ah, al
        out     1ch, al
        out     16h, al
        out     0ah, al
        mov     ax, 1eh
        out     2, al
        mov     ax, 1
        leave
        ret     2
        db      90h
L_0417A:
        xor     ax, ax
        leave
        ret     2
L_04180:
        push    bp
        mov     bp, sp
        push    10h
        call    L_03E60
        mov     cx, 0ffffh
L_0418B:
        loop    L_0418B
        push    0
        call    L_03E60
        leave
        ret

; ===========================================================================
; VERSION BANNER  (0x41A0)
; ===========================================================================
; "Nov.14,1996 MPC2000 Boot ROM V1.00".  Also DS:0000 once DS=041Ah, i.e.
; offset 0 of the boot variable window (bv_banner).

        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, "Nov."
        db      "14,1996 MPC2000 " ; 14,1996 MPC2000
        db      "Boot ROM V1.00", 000h, 000h ; Boot ROM V1.00..
        db      00h, 00h, 00h, 00h, 06h

; 0x041C9-0x0794C: NOT FREE SPACE.  This is the zero-initialised body of the
; DS=041Ah variable window -- bv_ticks at 0x41CB, bv_mz_header at 0x41CE, the
; monitor cursor at 0x51CE, the seven LCD planes from 0x55DC to 0x379C+41A0h,
; and the stack top (SP=1436h) at 0x55D6.  14211 bytes, and every one of them
; is written at run time.
FREE_041C9:
        rept    0794Ch-$
        db      000h
        endm


; ===========================================================================
; LCD GLYPH TABLE  (0x794C-0x7CCC)
; ===========================================================================
; 128 glyphs of 7 bytes, indexed by the raw character code: glyph(c) is at
; bv_font + 7*c, read by draw_glyph with DS=041Ah.  Each byte is one pixel
; row, bit 0 leftmost, 5-6 px wide on a 6 px pitch.  Codes 00h-1Fh are the
; arrow/box specials; 20h onward is ASCII (0x7A2C space, 0x7A9C '0',
; 0x7B13 'A').  The DS=041Ah window has to reach here, which is why the
; 0x41C9-0x794C zero run is not free space.

lcd_font:                               ; 128 glyphs x 7 rows; glyph(c) at bv_font + 7*c
        db      3dh, 25h, 25h, 25h, 25h, 25h, 3dh, 11h, 11h, 11h, 11h, 11h, 11h, 11h, 3dh, 21h ; =%%%%%=.......=!
        db      21h, 3dh, 05h, 05h, 3dh, 3dh, 21h, 21h, 3dh, 21h, 21h, 3dh, 05h, 15h, 15h, 3dh ; !=..==!!=!!=...=
        db      11h, 11h, 11h, 3dh, 05h, 05h, 3dh, 21h, 21h, 3dh, 3dh, 05h, 05h, 3dh, 25h, 25h ; ...=..=!!==..=%%
        db      3dh, 04h, 0ch, 1fh, 3fh, 1fh, 0ch, 04h, 08h, 0ch, 3eh, 3fh, 3eh, 0ch, 08h, 1ch
        db      14h, 3eh, 3eh, 14h, 14h, 1ch, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 10h, 10h, 10h
        db      30h, 10h, 10h, 10h, 00h, 00h, 15h, 3fh, 15h, 00h, 00h, 01h, 01h, 15h, 3fh, 15h
        db      01h, 01h, 1ch, 1ch, 1ch, 1ch, 3eh, 1ch, 08h, 08h, 1ch, 3eh, 1ch, 1ch, 1ch, 1ch
        db      10h, 18h, 10h, 17h, 10h, 10h, 38h, 07h, 04h, 04h, 04h, 04h, 04h, 3ch, 3fh, 00h
        db      00h, 00h, 00h, 00h, 00h, 08h, 08h, 08h, 08h, 08h, 0eh, 07h, 30h, 20h, 20h, 20h
        db      20h, 20h, 30h, 01h, 00h, 00h, 00h, 00h, 00h, 01h, 38h, 10h, 10h, 10h, 10h, 10h
        db      38h, 07h, 02h, 02h, 02h, 02h, 02h, 07h, 3ch, 28h, 28h, 28h, 28h, 28h, 3ch, 07h ; 8.......<(((((<.
        db      02h, 02h, 02h, 02h, 02h, 07h, 3ch, 08h, 08h, 08h, 08h, 08h, 1ch, 0fh, 05h, 05h
        db      05h, 02h, 02h, 02h, 00h, 06h, 05h, 04h, 24h, 14h, 0ch, 00h, 0ch, 0ah, 09h, 08h
        db      08h, 08h, 00h, 3eh, 3eh, 3eh, 3eh, 3eh, 00h, 04h, 0ch, 1ch, 3ch, 1ch, 0ch, 04h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 04h, 04h, 04h, 04h, 00h, 00h, 04h, 0ah, 0ah
        db      0ah, 00h, 00h, 00h, 00h, 0ah, 0ah, 1fh, 0ah, 1fh, 0ah, 0ah, 04h, 1eh, 05h, 0eh
        db      14h, 0fh, 04h, 03h, 13h, 08h, 04h, 02h, 19h, 18h, 06h, 09h, 05h, 02h, 15h, 09h
        db      16h, 06h, 04h, 02h, 00h, 00h, 00h, 00h, 08h, 04h, 02h, 02h, 02h, 04h, 08h, 02h
        db      04h, 08h, 08h, 08h, 04h, 02h, 00h, 04h, 15h, 0eh, 15h, 04h, 00h, 00h, 04h, 04h
        db      1fh, 04h, 04h, 00h, 00h, 00h, 00h, 00h, 06h, 04h, 02h, 00h, 00h, 00h, 1fh, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 06h, 06h, 00h, 10h, 08h, 04h, 02h, 01h, 00h
        db      0eh, 11h, 19h, 15h, 13h, 11h, 0eh, 04h, 06h, 04h, 04h, 04h, 04h, 0eh, 0eh, 11h
        db      10h, 08h, 04h, 02h, 1fh, 1fh, 08h, 04h, 08h, 10h, 11h, 0eh, 08h, 0ch, 0ah, 09h
        db      1fh, 08h, 08h, 1fh, 01h, 0fh, 10h, 10h, 11h, 0eh, 0ch, 02h, 01h, 0fh, 11h, 11h
        db      0eh, 1fh, 10h, 08h, 04h, 02h, 02h, 02h, 0eh, 11h, 11h, 0eh, 11h, 11h, 0eh, 0eh
        db      11h, 11h, 0eh, 10h, 08h, 06h, 00h, 06h, 06h, 00h, 06h, 06h, 00h, 00h, 06h, 06h
        db      00h, 06h, 04h, 02h, 08h, 04h, 02h, 01h, 02h, 04h, 08h, 00h, 00h, 1fh, 00h, 1fh
        db      00h, 00h, 02h, 04h, 08h, 10h, 08h, 04h, 02h, 0eh, 11h, 10h, 08h, 04h, 00h, 04h
        db      0eh, 11h, 10h, 16h, 15h, 15h, 0eh, 0eh, 11h, 11h, 11h, 1fh, 11h, 11h, 0fh, 11h
        db      11h, 0fh, 11h, 11h, 0fh, 0eh, 11h, 01h, 01h, 01h, 11h, 0eh, 07h, 09h, 11h, 11h
        db      11h, 09h, 07h, 1fh, 01h, 01h, 0fh, 01h, 01h, 1fh, 1fh, 01h, 01h, 0fh, 01h, 01h
        db      01h, 0eh, 11h, 01h, 1dh, 11h, 11h, 1eh, 11h, 11h, 11h, 1fh, 11h, 11h, 11h, 0eh
        db      04h, 04h, 04h, 04h, 04h, 0eh, 1ch, 08h, 08h, 08h, 08h, 09h, 06h, 11h, 09h, 05h
        db      03h, 05h, 09h, 11h, 01h, 01h, 01h, 01h, 01h, 01h, 1fh, 11h, 1bh, 15h, 15h, 11h
        db      11h, 11h, 11h, 11h, 13h, 15h, 19h, 11h, 11h, 0eh, 11h, 11h, 11h, 11h, 11h, 0eh
        db      0fh, 11h, 11h, 0fh, 01h, 01h, 01h, 0eh, 11h, 11h, 11h, 15h, 09h, 16h, 0fh, 11h
        db      11h, 0fh, 05h, 09h, 11h, 1eh, 01h, 01h, 0eh, 10h, 10h, 0fh, 1fh, 04h, 04h, 04h
        db      04h, 04h, 04h, 11h, 11h, 11h, 11h, 11h, 11h, 0eh, 11h, 11h, 11h, 11h, 11h, 0ah
        db      04h, 11h, 11h, 11h, 15h, 15h, 15h, 0ah, 11h, 11h, 0ah, 04h, 0ah, 11h, 11h, 11h
        db      11h, 11h, 0ah, 04h, 04h, 04h, 1fh, 10h, 08h, 04h, 02h, 01h, 1fh, 0eh, 02h, 02h
        db      02h, 02h, 02h, 0eh, 12h, 12h, 12h, 12h, 12h, 12h, 12h, 1ch, 10h, 10h, 10h, 10h
        db      10h, 1ch, 00h, 0eh, 0ah, 0ah, 0ah, 0eh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 1fh
        db      02h, 04h, 08h, 00h, 00h, 00h, 00h, 00h, 00h, 0eh, 10h, 1eh, 11h, 1eh, 01h, 01h
        db      0dh, 13h, 11h, 11h, 0fh, 00h, 00h, 0eh, 01h, 01h, 11h, 0eh, 10h, 10h, 16h, 19h
        db      11h, 11h, 1eh, 00h, 00h, 0eh, 11h, 1fh, 01h, 0eh, 0ch, 12h, 02h, 07h, 02h, 02h
        db      02h, 00h, 1eh, 11h, 11h, 1eh, 10h, 0eh, 01h, 01h, 0dh, 13h, 11h, 11h, 11h, 04h
        db      00h, 06h, 04h, 04h, 04h, 0eh, 08h, 00h, 0ch, 08h, 08h, 09h, 06h, 01h, 01h, 09h
        db      05h, 03h, 05h, 09h, 06h, 04h, 04h, 04h, 04h, 04h, 0eh, 00h, 00h, 0bh, 15h, 15h
        db      11h, 11h, 00h, 00h, 0dh, 13h, 11h, 11h, 11h, 00h, 00h, 0eh, 11h, 11h, 11h, 0eh
        db      00h, 00h, 0fh, 11h, 0fh, 01h, 01h, 00h, 00h, 16h, 19h, 1eh, 10h, 10h, 00h, 00h
        db      0dh, 13h, 01h, 01h, 01h, 00h, 00h, 0eh, 01h, 0eh, 10h, 0fh, 02h, 02h, 07h, 02h
        db      02h, 12h, 0ch, 00h, 00h, 11h, 11h, 11h, 19h, 16h, 00h, 00h, 11h, 11h, 11h, 0ah
        db      04h, 00h, 00h, 11h, 11h, 15h, 15h, 0ah, 00h, 00h, 11h, 0ah, 04h, 0ah, 11h, 00h
        db      00h, 11h, 11h, 1eh, 10h, 0eh, 00h, 00h, 1fh, 08h, 04h, 02h, 1fh, 10h, 10h, 10h
        db      10h, 10h, 10h, 10h, 04h, 04h, 04h, 04h, 04h, 04h, 04h, 02h, 02h, 02h, 02h, 02h
        db      02h, 02h, 00h, 04h, 08h, 1fh, 08h, 04h, 00h, 00h, 04h, 02h, 1fh, 02h, 04h, 00h

; ===========================================================================
; LCD FRAME BITMAPS  (0x7CD1-0x7DD1)
; ===========================================================================
; 256 bytes of 16-px-wide (2 bytes per row) mask artwork: rounded corners,
; a 55h/0AAh dither and a small curve.  No code in this ROM references it;
; like the glyph table it arrives with the shared MPC2000.EXE source.

        db      00h, 00h, 00h, 00h, 00h, 0ffh, 03h, 0ffh, 0fh, 0ffh, 1fh, 0ffh, 3fh, 0ffh, 7fh, 0ffh
        db      7fh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 7fh, 0ffh, 7fh, 0ffh
        db      3fh, 0ffh, 1fh, 0ffh, 0fh, 0ffh, 03h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0c0h, 0ffh, 0f0h, 0ffh, 0f8h, 0ffh, 0fch
        db      0ffh, 0feh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh
        db      0ffh, 0feh, 0ffh, 0fch, 0ffh, 0f8h, 0ffh, 0f0h, 0ffh, 0c0h, 0ffh, 00h, 00h, 0ffh, 03h, 00h
        db      0eh, 00h, 18h, 00h, 30h, 00h, 20h, 00h, 60h, 00h, 40h, 00h, 40h, 00h, 40h, 00h
        db      60h, 00h, 20h, 00h, 30h, 00h, 18h, 00h, 0eh, 0ffh, 03h, 00h, 00h, 00h, 00h, 0ffh
        db      0ffh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0ffh, 0ffh, 00h, 00h, 00h
        db      00h, 0c0h, 0ffh, 70h, 00h, 18h, 00h, 0ch, 00h, 04h, 00h, 06h, 00h, 02h, 00h, 02h
        db      00h, 02h, 00h, 06h, 00h, 04h, 00h, 0ch, 00h, 18h, 00h, 70h, 00h, 0c0h, 0ffh, 00h
        db      00h, 55h, 55h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        db      0ffh, 55h, 55h, 03h, 15h, 03h, 15h, 03h, 11h, 03h, 10h, 03h, 14h, 04h, 0fh, 04h
        db      0fh, 02h, 0fh, 02h, 0fh

; 0x07DD1-0x07FF0: NOT FREE SPACE either -- the tail of the DS=041Ah window,
; holding the INT 2Dh/C layer's statics (bv_scsi_ctx is DS:3D40h = 0x7EE0).
; 543 bytes.
FREE_07DD1:
        rept    07FF0h-$
        db      000h
        endm


; ===========================================================================
; RESET VECTOR  (0x7FF0)
; ===========================================================================
; The 32KB ROM is mirrored across the top-of-memory window, so the CPU's
; reset fetch at 0FFFF0h reads this: `JMP FAR 0F000h:0400h`.

        db      0eah, 00h, 04h, 00h, 0f0h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h

        end
