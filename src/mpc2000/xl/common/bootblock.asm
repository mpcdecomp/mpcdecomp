; bootblock -- MPC2000XL flash 0x78000-0x80000, boot block at 0x7c000.
; One source for both boot ROMs: define BOOT_V101 for the Feb. 15,2001 block
; (OS v1.14, v1.20), leave it undefined for June 14,1999 (v1.07, v1.11, v1.12).
; The including boot.asm supplies org, SEGBASE, the erased fill and the checksum.

; Every XL target reaches this file, so it is where a 2K-only option is refused.
; ZONE SLICE is XL's own feature: the port exists for base MPC2000 only, and
; asking for it here would quietly build a stock image.
        ifdef   ZONE_SLICE
        fatal   "ZONE_SLICE is base-MPC2000 only -- the XL has ZONE SLICE natively"
        endif

CSBASE  equ     07C000h-SEGBASE         ; labels are SEGBASE-relative, the block runs at CS=0FC00h

        ifdef   BOOT_V101
DPG1    equ     4                       ; V1.01 data page: 4 bytes in at 0071h,
DPG2    equ     6                       ; 2 more between the CDB and the descriptor
TAILTAB equ     07FEA8h
TMO_PHASE equ   2710h
TMO_CMD equ     2710h
        else
DPG1    equ     0
DPG2    equ     0
TAILTAB equ     07FEA2h
TMO_PHASE equ   0BB8h                   ; bus-phase wait, ms
TMO_CMD equ     03E8h                   ; command wait, ms
        endif

; Data page at DS=0356h, shared with the OS.  DPG1/DPG2 carry the V1.01 growth.
pnl_lo      equ     06fh                ; panel byte, bit 7 clear; word-compared against 0E011h/0E022h
pnl_hi      equ     070h                ; panel byte, bit 7 set
tick        equ     072h+DPG1           ; ms counter, bumped by IVT[25h]
dev_ready   equ     074h+DPG1           ; set by IVT[23h], read back through an INT service ; ?
boot_dev    equ     075h+DPG1           ; boot source, handed to the OS in AL
prod        equ     076h+DPG1           ; 64-bit product accumulator
dvsr        equ     07eh+DPG1           ; 64-bit shift register, high word first
quot        equ     086h+DPG1           ; 64-bit quotient
txt_off0    equ     08eh+DPG1           ; banner line 0
txt_off1    equ     090h+DPG1           ; banner line 1
txt_seg1    equ     092h+DPG1           ; banner segment, rows 24-40
txt_seg0    equ     094h+DPG1           ; banner segment, rows 0-16
txt_off2    equ     096h+DPG1           ; banner line 2
txt_len     equ     09ah+DPG1           ; characters left to draw
cdb         equ     09ch+DPG1           ; 12-byte SCSI/ATAPI command block, bp addresses it
xfer_off    equ     0a8h+DPG2           ; transfer buffer, offset
xfer_seg    equ     0aah+DPG2           ; transfer buffer, segment
xfer_len    equ     0ach+DPG2           ; transfer byte count
xfer_stat   equ     0ach                ; V1.01 only: transport status, in the 2 bytes it gained
blk_size    equ     0aeh+DPG2           ; device block size
blk_count   equ     0b0h+DPG2           ; blocks per transfer
spc_stat    equ     0b2h+DPG2           ; transport status byte
spc_id      equ     0b3h+DPG2           ; SPC target byte, from tbl_spc_id
dev_type    equ     0b4h+DPG2           ; INQUIRY device type bits
msg_buf     equ     0b5h+DPG2           ; 10-byte message-in buffer
msg_idx     equ     0bfh+DPG2           ; index into msg_buf
dev_buf     equ     0c0h+DPG2           ; device reply buffer; +14h REQUEST SENSE, +16h the key
blk_left    equ     0e8h+DPG2           ; blocks still to move
sec_buf     equ     0eah+DPG2           ; one sector, staged
tmo_mark    equ     8eah+DPG2           ; INT 77h tick at the start of the wait
tmo_span    equ     8ech+DPG2           ; how long the wait may run
ata_id      equ     8eeh+DPG2           ; IDENTIFY DEVICE reply
ata_xfer_off equ     8fah+DPG2          ; ATA transfer buffer, offset
ata_xfer_seg equ     8fch+DPG2          ; ATA transfer buffer, segment
ata_xfer_len equ     8feh+DPG2          ; ATA transfer byte count
ata_buf     equ     900h+DPG2           ; ATA data staging
ata_mark    equ     93eh+DPG2           ; INT 77h tick at the start of the ATA wait
ata_present equ     940h+DPG2           ; 1 once an ATA device answered
ata_class   equ     941h+DPG2           ; ATA device class, high byte of the signature
lcd_pen     equ     942h+DPG2           ; pointer into lcd_fb
lcd_glyph   equ     944h+DPG2           ; glyph routine, called indirectly
lcd_style   equ     946h+DPG2           ; per-style byte table
lcd_fb      equ     94eh+DPG2           ; 1920-byte shadow framebuffer
mz_hdr      equ     10ceh+DPG2          ; staged OS image; +8 e_cparhdr, +14h e_ip, +16h e_cs

; Work area at DS=4000h: the boot drivers' work area, RAM the OS image is copied over later.
wk_b_0800d  equ     0800dh
wk_b_08010  equ     08010h
wk_b_081c2  equ     081c2h
wk_b_0a092  equ     0a092h
wk_b_0a093  equ     0a093h
wk_b_0a094  equ     0a094h
wk_b_0a095  equ     0a095h
wk_b_0a096  equ     0a096h
wk_b_0a0e3  equ     0a0e3h
wk_b_0a0e4  equ     0a0e4h
wk_b_0a0e5  equ     0a0e5h
wk_b_0a0e6  equ     0a0e6h
wk_b_0a0e7  equ     0a0e7h
wk_b_0a0e8  equ     0a0e8h
wk_b_0a0e9  equ     0a0e9h
wk_b_0a0ea  equ     0a0eah
wk_b_0a0eb  equ     0a0ebh
wk_b_0a0ec  equ     0a0ech
wk_b_0a0ed  equ     0a0edh
wk_b_0a0f0  equ     0a0f0h
wk_b_0a0f1  equ     0a0f1h
wk_b_0a0f2  equ     0a0f2h
wk_b_0a0f3  equ     0a0f3h
wk_b_0a0f5  equ     0a0f5h
wk_b_0d800  equ     0d800h
wk_b_0e804  equ     0e804h
wk_b_0e806  equ     0e806h
wk_b_0e866  equ     0e866h
wk_b_0e867  equ     0e867h
wk_b_0e89d  equ     0e89dh
wk_tbl_0720c equ     0720ch
wk_tbl_08000 equ     08000h
wk_w_0800b  equ     0800bh
wk_w_0800e  equ     0800eh
wk_w_08011  equ     08011h
wk_w_08013  equ     08013h
wk_w_08016  equ     08016h
wk_w_08020  equ     08020h
wk_w_08022  equ     08022h
wk_w_081fe  equ     081feh
wk_w_0a000  equ     0a000h
wk_w_0a098  equ     0a098h
wk_w_0a09a  equ     0a09ah
wk_w_0a09c  equ     0a09ch
wk_w_0a09e  equ     0a09eh
wk_w_0a0a0  equ     0a0a0h
wk_w_0a0a2  equ     0a0a2h
wk_w_0a0a4  equ     0a0a4h
wk_w_0a0a6  equ     0a0a6h
wk_w_0a0a8  equ     0a0a8h
wk_w_0a0aa  equ     0a0aah
wk_w_0a0ac  equ     0a0ach
wk_w_0a0ae  equ     0a0aeh
wk_w_0a0b0  equ     0a0b0h
wk_w_0a0b2  equ     0a0b2h
wk_w_0a0b4  equ     0a0b4h
wk_w_0a0b6  equ     0a0b6h
wk_w_0a0b8  equ     0a0b8h
wk_w_0a0ba  equ     0a0bah
wk_w_0a0bc  equ     0a0bch
wk_w_0a0be  equ     0a0beh
wk_w_0b400  equ     0b400h
wk_w_0e800  equ     0e800h
wk_w_0e87c  equ     0e87ch
wk_w_0e87e  equ     0e87eh
wk_w_0e884  equ     0e884h
wk_w_0e886  equ     0e886h
wk_w_0e888  equ     0e888h
wk_w_0e88a  equ     0e88ah
wk_w_0e88c  equ     0e88ch
wk_w_0e88e  equ     0e88eh
wk_w_0e890  equ     0e890h
wk_w_0e892  equ     0e892h
wk_w_0e894  equ     0e894h
wk_w_0e896  equ     0e896h
wk_w_0eca0  equ     0eca0h
wk_w_0eca2  equ     0eca2h
wk_w_0eca4  equ     0eca4h
wk_w_0ecaa  equ     0ecaah
wk_w_0eeac  equ     0eeach
wk_w_0eeae  equ     0eeaeh
wk_w_0eeb0  equ     0eeb0h
wk_w_0eeb6  equ     0eeb6h
wk_w_0eeb8  equ     0eeb8h
wk_w_0eeba  equ     0eebah
wk_w_0eebc  equ     0eebch
wk_w_0eebe  equ     0eebeh

; free space 0x78000-0x7c000, 16384 bytes of 00h -- add features here
free_low:
        PAD_TO  07C000h-SEGBASE, 000h

; IVT image, copied to 0000:0000 by boot_shadow_copy.  150 vectors.
ivt:
        dw      panic_halt-CSBASE, 0            ; INT 00h divide error
        dw      dbg_trap-CSBASE, 0              ; INT 01h single step
        dw      int_iret-CSBASE, 0              ; INT 02h
        dw      dbg_trap-CSBASE, 0              ; INT 03h breakpoint
        dw      ovf_trap-CSBASE, 0              ; INT 04h overflow
        rept    30                      ; INT 05h-22h
        dw      int_iret-CSBASE, 0
        endm
        dw      storage_complete_isr-CSBASE, 0  ; INT 23h ICU IR3, storage done
        dw      serial_rx_isr-CSBASE, 0         ; INT 24h ICU IR4, serial
        dw      tick_isr-CSBASE, 0              ; INT 25h ICU IR5, tick
        rept    4                       ; INT 26h-29h
        dw      int_iret-CSBASE, 0
        endm
        dw      003dh, 0356h                    ; INT 2ah straight into the OS
        dw      int_2b_stub-CSBASE, 0           ; INT 2bh
        dw      int_2c_stub-CSBASE, 0           ; INT 2ch
        dw      boot_shadow_entry-CSBASE, 0     ; INT 2dh expansion mode
        rept    73                      ; INT 2eh-76h
        dw      int_iret-CSBASE, 0
        endm
        dw      timer_read_svc-CSBASE, 0        ; INT 77h read the tick
        rept    19                      ; INT 78h-8ah
        dw      int_iret-CSBASE, 0
        endm
        dw      int_8b_svc-CSBASE, 0            ; INT 8bh
        dw      int_iret-CSBASE, 0              ; INT 8ch
        dw      int_iret-CSBASE, 0              ; INT 8dh
        dw      int_8e_svc-CSBASE, 0            ; INT 8eh
        dw      text_service-CSBASE, 0          ; INT 8fh draw text
        dw      glyph_service-CSBASE, 0         ; INT 90h draw a glyph
        dw      int_iret-CSBASE, 0              ; INT 91h
        dw      int_92_svc-CSBASE, 0            ; INT 92h
        dw      scsi_service-CSBASE, 0          ; INT 93h storage transport
        dw      int_94_svc-CSBASE, 0            ; INT 94h
        dw      int_95_svc-CSBASE, 0            ; INT 95h
int_iret:
        iret
panic_halt:
        mov     bp, 356h
        mov     ds, bp
        int     8fh
        add     ax, 1937h
        db      "       Error at     :    ", 00h
        pop     ax
        int     8fh
        or      al, 91h
        sbb     word ptr [bx+si-33h], bx
        db      8fh
        or      al, 0afh
        db      19h, 0cdh
        pop     word ptr [bx+di]
L001:
        jmp     L001

; free space 0x7c28e-0x7c400, 370 bytes of 00h -- add features here
free_boot_gap:
        PAD_TO  07C400h-SEGBASE, 000h

boot_sfr_init:                          ; reset lands here through FFFF0h; V53 SFR setup
        cli
        ifdef   BOOT_V101
        mov     cx, 0ffffh              ; settle before the first SFR write
L002:
        mov     ax, ax
        loop    L002
        endif
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
        mov     al, 30h
        out     dx, al
        mov     dx, 0c010h
        mov     al, 0ffh
        out     dx, al
        mov     dx, 0c010h
        mov     al, 0ffh
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
        mov     al, 0c7h
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
boot_shadow_copy:                       ; FC00:0 -> 0000:0
        mov     ax, 0
        mov     es, ax
        mov     ax, 0fc00h
        mov     ds, ax
        mov     si, 0
        mov     di, 0
        mov     cx, 4000h
        rep movsw
boot_program_page_regs:                 ; 32 word registers at 0FF00h, ascending values
        mov     dx, 0ff00h
        mov     ax, 0
        mov     cx, 20h
L003:
        out     dx, ax
        inc     ax
        add     dx, 2
        loop    L003
        mov     ax, 40h
        mov     cx, 20h
L004:
        out     dx, ax
        inc     ax
        add     dx, 2
        loop    L004
boot_enter_expansion_mode:              ; BRKXA 2Dh
        db      0fh, 0e0h, 2dh
boot_shadow_entry:                      ; running from the RAM shadow
        cli
        cld
        mov     ax, 356h
        mov     ds, ax
        mov     es, ax
        mov     ax, 7000h
        mov     ss, ax
        mov     ax, 0fffeh
        mov     sp, ax
        mov     al, 82h
        out     0c0h, al
        mov     al, 0
        out     0c2h, al
        mov     dx, 120h
        mov     al, 14h
        out     dx, al
        sti
boot_banner_print:                      ; INT 8Fh, the power-on banner
        int     8fh
        db      00h, 0cdh
        pop     word ptr [bp+si]
        int     8fh
        add     ax, 1961h
        dec     bp
        push    ax
        inc     bx
        xor     dh, byte ptr [bx+si]
        xor     byte ptr [bx+si], dh
        pop     ax
        dec     sp
        db      00h, 0cdh
        pop     word ptr [bx+di]
boot_power_on_key_gate:                 ; panel word [356h:6Fh] == 0E011h / 0E022h
        mov     word ptr [tick], 0
L005:
        cmp     word ptr [pnl_lo], 0e011h
        je      L006
        cmp     word ptr [pnl_lo], 0e022h
        je      L008
        cmp     word ptr [tick], 3e8h
        jb      L005
L006:
        call    boot_flash_device_id
        mov     ax, 0ah
        jae     L007
        call    L015
        mov     ax, 0bh
L007:
        call    boot_run_os_loader
        call    L010
L008:
        call    L017
        call    L020
        call    L028
        int     8fh
        add     ax, 1937h
        db      "  Insert MPC2000XL Disk !   ", 00h
        int     8fh
        add     word ptr [bx+di+3e8h], di
        call    L093
        jmp     L008
boot_flash_device_id:                   ; Intel identify at FC00h, two widths
        mov     bp, msg_no_device-CSBASE
        db      0fh
        db      0f0h
        db      2ch                                                                     ; ,
msg_no_device:
        db      0b8h
        db      00h, 0fch
        mov     es, ax
        mov     al, byte ptr es:[0]
        mov     byte ptr es:[0], 90h
        mov     al, byte ptr es:[0]
        mov     byte ptr es:[0], 90h
        mov     ah, byte ptr es:[2]
        mov     byte ptr es:[0], 0ffh
; V1.01 repeats the identify word-wide, taking 0089h/8892h as well.
        ifdef   BOOT_V101
        mov     word ptr es:[0], 90h
        mov     cx, word ptr es:[0]
        mov     dx, word ptr es:[2]
        mov     word ptr es:[0], 0ffffh
        pusha
L011:
        mov     bp, flash_id_x16-CSBASE
        db      0fh, 0e0h, 2bh
flash_id_x16:
        db      61h, 3dh, 89h, 70h, 75h, 01h, 0c3h, 3dh, 89h, 9ch, 75h                  ; a=.pu..=..u
L009:
        db      01h, 0c3h
        cmp     cx, 89h
L013:
        jne     L014
        cmp     dx, 8892h
        jne     L014
        ret
L014:
        stc
        ret
L010:
        cli
        push    ds
        mov     bp, msg_bad_flash-CSBASE
        db      0fh
        db      0f0h
        db      2ch                                                                     ; ,
msg_bad_flash:
        db      0b8h
        add     byte ptr [bx+si], al
        mov     es, ax
        mov     word ptr es:[0a0h], int_28_svc-CSBASE
        mov     word ptr es:[0a2h], 0fc00h
        int     28h
        mov     bp, boot_flash_ok-CSBASE
        db      0fh, 0e0h, 2bh
boot_flash_ok:
        db      1fh, 0fbh, 0c3h
int_28_svc:
        db      0b8h, 00h, 80h, 8eh, 0c0h, 2bh, 0f6h, 26h, 81h, 3ch
        db      4dh, 5ah, 74h, 03h, 0e9h, 0fch, 00h, 26h, 03h, 44h, 08h, 8eh, 0c0h, 26h, 8bh, 36h
        db      0a8h, 000h, 0e8h, 0b4h, 008h, "MPC2000XL", 000h, 073h ; .....MPC2000XL.s
        db      03h, 0e9h, 0dfh, 00h, 0b8h, 00h, 0b8h, 8eh, 0c0h, 2bh, 0f6h, 26h, 81h, 3ch, 4dh, 5ah
        db      74h, 03h, 0e9h, 0ceh, 00h, 0b8h, 00h, 80h, 8eh, 0c0h, 2bh, 0f6h, 26h, 8bh, 44h, 04h
        db      0c1h, 0e0h, 05h, 26h, 2bh, 44h, 08h, 0bbh, 00h, 80h, 26h, 03h, 5ch, 08h, 8eh, 0dbh
        db      2bh, 0ffh, 8bh, 0f7h, 8eh, 0c7h, 3dh, 00h, 10h, 72h, 1ah, 0b9h, 00h, 80h, 0f3h, 0a5h
        db      2dh, 00h, 10h, 8ch, 0dbh, 81h, 0c3h, 00h, 10h, 8eh, 0dbh, 8ch, 0c3h, 81h, 0c3h, 00h
        db      10h, 8eh, 0c3h, 0ebh, 0e1h, 8bh, 0c8h, 0c1h, 0e1h, 03h, 0f3h, 0a5h, 0b8h, 00h, 0b8h, 8eh
        db      0c0h, 2bh, 0f6h, 26h, 8bh, 44h, 04h, 0c1h, 0e0h, 05h, 26h, 2bh, 44h, 08h, 0bbh, 00h
        db      0b8h, 26h, 03h, 5ch, 08h, 8eh, 0dbh, 2bh, 0ffh, 8bh, 0f7h, 0bbh, 00h, 38h, 8eh, 0c3h
        db      3dh, 00h, 10h, 72h, 1ah, 0b9h, 00h, 80h, 0f3h, 0a5h, 2dh, 00h, 10h, 8ch, 0dbh, 81h
        db      0c3h, 00h, 10h, 8eh, 0dbh, 8ch, 0c3h, 81h, 0c3h, 00h, 10h, 8eh, 0c3h, 0ebh, 0e1h, 8bh
        db      0c8h, 0c1h, 0e1h, 03h, 0f3h, 0a5h, 0bah, 00h, 38h, 0b8h, 00h, 0b8h, 8eh, 0d8h, 8bh, 36h
        db      18h, 00h, 8bh, 0eh, 06h, 00h, 0e3h, 11h, 8bh, 3ch, 8bh, 44h, 02h, 03h, 0c2h, 8eh
        db      0c0h, 26h, 01h, 15h, 83h, 0c6h, 04h, 0e2h, 0efh, 03h, 16h, 16h, 00h, 0a1h, 14h, 00h
        db      0bbh, 00h, 00h, 8eh, 0c3h, 26h, 0a3h, 0a4h, 00h, 26h, 89h, 16h, 0a6h, 00h, 0b8h, 0bh
        db      00h, 0cdh, 28h, 0cfh
        else
        push    ax
        mov     bp, flash_id_x16-CSBASE
        db      0fh, 0e0h, 2bh
flash_id_x16:
        db      58h, 3dh, 89h, 70h, 75h, 01h, 0c3h, 3dh, 89h, 9ch, 75h, 01h, 0c3h
        db      0f9h, 0c3h
L010:
        cli
        push    ds
        db      0bdh
L011:
        db      0fah, 05h
        db      0fh
        db      0f0h
        db      2ch                                                                     ; ,
msg_bad_flash:
        db      0b8h
        add     byte ptr [bx+si], al
        mov     es, ax
        mov     word ptr es:[0a0h], int_28_svc-CSBASE
L012:
        db      26h, 0c7h, 06h, 0a2h, 00h, 00h
L013:
        db      0fch
        int     28h
        mov     bp, boot_flash_ok-CSBASE
        db      0fh, 0e0h, 2bh
boot_flash_ok:
        db      1fh, 0fbh, 0c3h
int_28_svc:
        db      0b8h, 00h, 80h, 8eh, 0c0h, 2bh, 0f6h, 26h, 81h, 3ch
        db      4dh, 5ah, 74h, 03h, 0e9h, 0ffh, 00h, 26h, 03h, 44h, 08h, 8eh, 0c0h, 26h, 8bh, 36h
        db      0a8h, 000h, 0e8h, 0b7h, 008h, "MPC2000XL", 000h, 073h ; .....MPC2000XL.s
        db      03h, 0e9h, 0e2h, 00h, 0b8h, 00h, 0b8h, 8eh, 0c0h, 2bh, 0f6h, 26h, 81h, 3ch, 4dh, 5ah
        db      74h, 03h, 0e9h, 0d1h, 00h, 0e8h, 0cfh, 00h, 0b8h, 00h, 80h, 8eh, 0c0h, 2bh, 0f6h, 26h
        db      8bh, 44h, 04h, 0c1h, 0e0h, 05h, 26h, 2bh, 44h, 08h, 0bbh, 00h, 80h, 26h, 03h, 5ch
        db      08h, 8eh, 0dbh, 2bh, 0ffh, 8bh, 0f7h, 8eh, 0c7h, 3dh, 00h, 10h, 72h, 1ah, 0b9h, 00h
        db      80h, 0f3h, 0a5h, 2dh, 00h, 10h, 8ch, 0dbh, 81h, 0c3h, 00h, 10h, 8eh, 0dbh, 8ch, 0c3h
        db      81h, 0c3h, 00h, 10h, 8eh, 0c3h, 0ebh, 0e1h, 8bh, 0c8h, 0c1h, 0e1h, 03h, 0f3h, 0a5h, 0b8h
        db      00h, 0b8h, 8eh, 0c0h, 2bh, 0f6h, 26h, 8bh, 44h, 04h, 0c1h, 0e0h, 05h, 26h, 2bh, 44h
        db      08h, 0bbh, 00h, 0b8h, 26h, 03h, 5ch, 08h, 8eh, 0dbh, 2bh, 0ffh, 8bh, 0f7h, 0bbh, 00h
        db      38h, 8eh, 0c3h, 3dh, 00h, 10h, 72h, 1ah, 0b9h, 00h, 80h, 0f3h, 0a5h, 2dh, 00h, 10h
        db      8ch, 0dbh, 81h, 0c3h, 00h, 10h, 8eh, 0dbh, 8ch, 0c3h, 81h, 0c3h, 00h, 10h, 8eh, 0c3h
        db      0ebh, 0e1h, 8bh, 0c8h, 0c1h, 0e1h, 03h, 0f3h, 0a5h, 0bah, 00h, 38h, 0b8h, 00h, 0b8h, 8eh
        db      0d8h, 8bh, 36h, 18h, 00h, 8bh, 0eh, 06h, 00h, 0e3h, 11h, 8bh, 3ch, 8bh, 44h, 02h
        db      03h, 0c2h, 8eh, 0c0h, 26h, 01h, 15h, 83h, 0c6h, 04h, 0e2h, 0efh, 03h, 16h, 16h, 00h
        db      0a1h, 14h, 00h, 0bbh, 00h, 00h, 8eh, 0c3h, 26h, 0a3h, 0a4h, 00h, 26h, 89h, 16h, 0a6h
        db      00h, 0b8h, 0bh, 00h, 0cdh, 28h, 0cfh
        endif
L015:
        mov     dx, ds
        mov     cl, 37h
        mov     ch, 0ah
        mov     si, 25h
        mov     ah, 18h
        mov     bl, 5
        int     90h
        mov     dx, ds
        mov     cl, 37h
        mov     ch, 19h
        mov     si, 3dh
        mov     ah, 18h
        mov     bl, 5
        int     90h
        mov     dx, ds
        mov     cl, 37h
        mov     ch, 28h
        mov     si, 56h
        mov     ah, 18h
        mov     bl, 5
        int     90h
        int     8fh
        add     word ptr [bp+di-46f9h], si
        db      0ffh, 0ffh
L016:
        mov     ax, 0ffffh
        mul     ax
        loop    L016
        dec     bl
        db      75h, 0f2h
        ret
boot_run_os_loader:
        cli
        push    ds
        push    ax
        mov     bp, msg_load_fail-CSBASE
        db      0fh
        db      0f0h
        db      2ch                                                                     ; ,
msg_load_fail:
        db      0b8h
        add     byte ptr [bx+si], al
        mov     es, ax
        mov     word ptr es:[0a0h], os_loader-CSBASE
        mov     word ptr es:[0a2h], 0fc00h
        pop     ax
        int     28h
        push    ax
        mov     bp, os_loader_ret-CSBASE
        db      0fh, 0e0h, 2bh
os_loader_ret:
        db      58h, 1fh, 0fbh, 0c3h
os_loader:                              ; FAT search for "MPC2000XL", stage to 8000h:0
        db      50h, 0b8h, 00h, 80h, 8eh, 0c0h, 26h, 8bh, 36h
        db      0a8h, 000h, 0e8h, 04ch, 007h, "MPC2000XL", 000h, 073h ; ...L.MPC2000XL.s
        db      02h, 0ebh, 59h, 0b2h, 07h, 0b8h, 00h, 00h, 0bbh, 00h, 80h, 8eh, 0c3h, 2bh, 0f6h, 0b9h
        db      00h, 80h, 26h, 03h, 04h, 83h, 0c6h, 02h, 0e2h, 0f8h, 81h, 0c3h, 00h, 10h, 0feh, 0cah
        db      75h, 0e9h, 8eh, 0c3h, 2bh, 0f6h, 0b9h, 0ffh, 3fh, 26h, 03h, 04h, 83h, 0c6h, 02h, 0e2h
        db      0f8h, 26h, 3bh, 04h, 74h, 02h, 0ebh, 24h, 0bah, 00h, 80h, 0bbh, 00h, 00h, 0e8h, 1dh
        db      00h, 0e8h, 1ah, 00h, 0e8h, 17h, 00h, 0e8h, 14h, 00h, 0e8h, 11h, 00h, 0e8h, 0eh, 00h
        db      0e8h, 0bh, 00h, 0b9h, 00h, 40h, 0e8h, 08h, 00h, 58h, 0cdh, 28h, 58h, 0cfh, 0b9h, 00h
        db      80h, 8eh, 0dah, 8eh, 0c3h, 2bh, 0ffh, 2bh, 0f6h, 0f3h, 0a5h, 81h, 0c3h, 00h, 10h, 81h
        db      0c2h, 00h, 10h, 0c3h
L017:
        mov     dx, 182h
        mov     al, 0
        out     dx, al
        mov     dx, 182h
        mov     al, 0
        out     dx, al
        mov     dx, 182h
        mov     al, 0
        out     dx, al
        mov     dx, 182h
        mov     al, 40h
        out     dx, al
        mov     dx, 182h
        mov     al, 4fh
        out     dx, al
        mov     dx, 182h
        mov     al, 15h
        out     dx, al
        mov     ax, 4000h
        mov     es, ax
        sub     ax, ax
        mov     di, ax
        mov     cx, 8000h
        rep stosw
        mov     al, 0
        db      0e8h, 0e4h, 03h
        mov     bl, 0
        int     91h
        mov     bl, 1
        int     91h
        jae     L018
        ret
L018:
        mov     si, 0
        cmp     ah, 2
        je      L019
        cmp     ah, 3
        je      L019
        ret
L019:
        mov     dx, ds
        mov     cl, 37h
        mov     ch, 19h
        mov     si, 3dh
        mov     ah, 18h
        mov     bl, 5
        int     90h
        int     8fh
        db      01h, 0e8h
        add     ax, 0e802h
        mov     ax, word ptr [bx+di]
        db      0e8h, 0a0h, 02h
        ret
L020:
        mov     dx, 182h
        mov     al, 0
        out     dx, al
        mov     dx, 182h
        mov     al, 0
        out     dx, al
        mov     dx, 182h
        mov     al, 0
        out     dx, al
        mov     dx, 182h
        mov     al, 40h
        out     dx, al
        mov     dx, 182h
        mov     al, 4fh
        out     dx, al
        mov     dx, 182h
        mov     al, 17h
        out     dx, al
        mov     bp, ata_service-CSBASE
        mov     word ptr cs:[ivt-CSBASE+24ch], bp
        mov     word ptr cs:[ivt-CSBASE+24eh], cs
        mov     ax, 4000h
        mov     es, ax
        sub     ax, ax
        mov     di, ax
        mov     cx, 8000h
        rep stosw
        mov     byte ptr [boot_dev], 1
        mov     al, byte ptr [boot_dev]
        db      0e8h, 65h, 03h, 0e8h, 0ach, 03h
        jae     L025
        cmp     al, 2ch
        jne     L021
        ret
L021:
        cmp     al, 1dh
        jne     L022
        db      0e8h, 9eh, 03h
        jae     L025
L022:
        cmp     al, 2fh
        je      L023
        ret
L023:
        mov     word ptr [tick], 0
L024:
        db      0e8h, 85h, 03h
        jae     L025
        cmp     word ptr [tick], 1388h
        jb      L024
        ret
L025:
        cmp     ah, 0
        jne     L026
        ret
L026:
        push    ax
        mov     bl, 2
        int     90h
        add     si, 8
        mov     dx, es
        mov     cl, 4ch
        mov     ch, 19h
        mov     ah, 10h
        mov     bl, 5
        int     90h
        int     8fh
        add     word ptr [bx+di+3e8h], di
        db      0e8h, 94h, 05h
        pop     ax
        cmp     ah, 0bh
        je      L027
        cmp     ah, 0ah
        je      L027
        cmp     ah, 0ch
        je      L027
        ret
L027:
        mov     byte ptr [boot_dev], 0ch
        db      0e8h, 4ch, 01h, 0e8h, 0d2h, 00h
        ret
L028:
        mov     dx, 182h
        mov     al, 15h
        out     dx, al
        mov     bp, scsi_service-CSBASE
        mov     word ptr cs:[ivt-CSBASE+24ch], bp
        mov     word ptr cs:[ivt-CSBASE+24eh], cs
        mov     ax, 4000h
        mov     es, ax
        sub     ax, ax
        mov     di, ax
        mov     cx, 8000h
        rep stosw
        int     8fh
        add     al, dh
        push    es
; V1.01 branches on the sign bit, not on zero.
        ifdef   BOOT_V101
        jns     L029
        else
        jne     L029
        endif
L029:
        db      01h, 0cdh
        pop     word ptr [di]
        aaa
        sbb     word ptr [bp+di+43h], dx
        push    bx
        dec     cx
        cmp     dh, byte ptr [bx+si]
        cmp     ah, byte ptr [bx+si]
        and     byte ptr [bx+si], ah
        and     byte ptr [bx+si], ah
        and     byte ptr [bx+si], ah
        and     byte ptr [bx+si], ah
        and     byte ptr [bx+si], ah
        and     byte ptr [bx+si], ah
        and     byte ptr [bx+si], ah
        and     byte ptr [bx+si], ah
        and     byte ptr [bx+si], ah
        db      000h, 0a0h, boot_dev, 000h
        cmp     al, 9
        jne     L030
        ret
L030:
        dec     al
        or      al, 30h
        int     8fh
        add     al, 55h
        db      19h, 0cdh
        pop     word ptr [bx+di]
        mov     al, byte ptr [boot_dev]
        call    L062
        call    L066
        jae     L031
        cmp     al, 1dh
        jne     L032
        call    L066
L031:
        jb      L032
        call    L033
L032:
        ret
        inc     byte ptr [boot_dev]
        cmp     byte ptr [boot_dev], 7
        db      75h, 0a9h
        inc     byte ptr [boot_dev]
        db      0ebh, 0a3h
L033:
        cmp     ah, 0
        jne     L034
        ret
L034:
        push    ax
        add     si, 8
        mov     dx, es
        mov     cl, 61h
        mov     ch, 19h
        mov     ah, 10h
        mov     bl, 5
        int     90h
        int     8fh
        add     word ptr [bx+di+3e8h], di
        call    L093
        pop     ax
        cmp     ah, 0bh
        je      L035
        cmp     ah, 0ah
        je      L035
        cmp     ah, 0ch
        je      L035
        ret
L035:
        call    L039
        call    L036
        ret
fn_mpc2kxl:
        db      "MPC2KXL         " ; MPC2KXL         
        db      ".BIN"
L036:
        mov     ax, cs
        mov     es, ax
        mov     si, fn_mpc2kxl-CSBASE
        mov     bl, 4
        int     91h
        jae     L037
        ret
L037:
        int     8fh
        add     cl, ch
        pop     word ptr [di]
        inc     bx
        db      19h
        db      "Loading:MPC2KXL.BIN", 00h
        db      0cdh, 8fh
        add     word ptr [bx+si+wk_tbl_08000], di
        mov     es, ax
L038:
        push    es
        sub     di, di
        mov     cx, 8000h
        mov     bl, 6
        int     91h
        pop     es
        mov     bx, es
        add     bx, 800h
        mov     es, bx
        cmp     ax, 8000h
        je      L038
        mov     bl, 0ah
        int     91h
        cli
        mov     ax, 8000h
        mov     es, ax
        add     word ptr es:[0a2h], ax
        sub     ax, ax
        mov     al, byte ptr [boot_dev]
        db      26h, 0ffh, 2eh, 0a0h, 00h
fn_mpc2kxl_exe:
        db      "MPC2KXL    "                   ; MPC2KXL    
        db      "     .EXE"                          ;      .EXE
L039:
        mov     si, fn_mpc2kxl_exe-CSBASE
        mov     ax, cs
        mov     es, ax
        mov     bl, 4
        int     91h
        jae     L040
        ret
L040:
        int     8fh
        add     cl, ch
        pop     word ptr [di]
        inc     bx
        sbb     word ptr [si+6fh], cx
        popa
        db      64h
        imul    bp, word ptr [bp+67h], 4d3ah
        push    ax
        inc     bx
        xor     cl, byte ptr [bp+di+58h]
        dec     sp
        db      2eh, 45h
        pop     ax
        inc     bp
        db      00h, 0cdh
        pop     word ptr [bx+di]
        mov     di, mz_hdr
L041:
        mov     cx, 200h
L042:
        mov     ax, ds
        mov     es, ax
        mov     bl, 6
        int     91h
        mov     di, mz_hdr+200h
        sub     word ptr [mz_hdr+8], 20h
        je      L043
        jae     L041
        mov     cx, word ptr [mz_hdr+8]
        add     cx, 20h
        shl     cx, 4
        jmp     L042
L043:
        cmp     word ptr [mz_hdr], 5a4dh
        je      L044
        ret
L044:
        mov     ax, 8000h
        mov     es, ax
L045:
        push    es
        sub     di, di
        mov     cx, 8000h
        mov     bl, 6
        int     91h
        pop     es
        mov     bx, es
        add     bx, 800h
        mov     es, bx
        cmp     ax, 8000h
        je      L045
        mov     bl, 0ah
        int     91h
        cli
        sub     ax, ax
        mov     al, byte ptr [boot_dev]
        mov     word ptr [mz_hdr+016h], 8000h
        jmpf    [mz_hdr+014h]
fn_mpc2000:
        db      "MPC2000         " ; MPC2000         
        db      ".EXE"
L046:
        mov     si, fn_mpc2000-CSBASE
        mov     ax, cs
        mov     es, ax
        mov     bl, 4
        int     91h
        jae     L047
        ret
L047:
        int     8fh
        add     cl, ch
        pop     word ptr [di]
        inc     bx
        sbb     word ptr [si+6fh], cx
        popa
        db      64h
        imul    bp, word ptr [bp+67h], 4d3ah
        push    ax
        inc     bx
        xor     dh, byte ptr [bx+si]
        xor     byte ptr [bx+si], dh
        db      2eh, 45h
        pop     ax
        inc     bp
        db      00h, 0cdh
        pop     word ptr [bx+di]
        mov     di, mz_hdr
L048:
        mov     cx, 200h
L049:
        mov     ax, ds
        mov     es, ax
        mov     bl, 6
        int     91h
        mov     di, mz_hdr+200h
        sub     word ptr [mz_hdr+8], 20h
        je      L050
        jae     L048
        mov     cx, word ptr [mz_hdr+8]
        add     cx, 20h
        shl     cx, 4
        jmp     L049
L050:
        cmp     word ptr [mz_hdr], 5a4dh
        je      L051
        ret
L051:
        mov     ax, 0c000h
        mov     es, ax
L052:
        push    es
        sub     di, di
        mov     cx, 8000h
        mov     bl, 6
        int     91h
        pop     es
        mov     bx, es
        add     bx, 800h
        mov     es, bx
        cmp     ax, 8000h
        je      L052
        mov     bl, 0ah
        int     91h
        cli
        sub     ax, ax
        mov     al, byte ptr [boot_dev]
        mov     word ptr [mz_hdr+016h], 0c000h
        jmpf    [mz_hdr+014h]
tick_isr:
        pusha
        push    ds
        mov     bp, 356h
        mov     ds, bp
        inc     word ptr [tick]
        pop     ds
        popa
        iret
serial_rx_isr:                          ; IVT[24h] ICU IR4: SCU at 0C000h/0C002h, bit 7 = channel tag
        pusha
        push    ds
        mov     bp, 356h
        mov     ds, bp
        call    L055
        call    L057
        push    dx
        mov     dx, 0c002h
        in      al, dx
        pop     dx
        test    al, 2
        je      L054
        push    dx
        mov     dx, 0c000h
        in      al, dx
        pop     dx
        test    al, 80h
        jne     L053
        mov     byte ptr [pnl_lo], al
        jmp     L054
L053:
        mov     byte ptr [pnl_hi], al
L054:
        pop     ds
        popa
        iret
L055:
        push    dx
        mov     dx, 182h
        in      al, dx
        pop     dx
        test    al, 2
        jne     L056
        ret
L056:
        push    dx
        mov     dx, 180h
        in      al, dx
        pop     dx
        ret
L057:
        push    dx
        mov     dx, 1a2h
        in      al, dx
        pop     dx
        test    al, 2
        jne     L058
        ret
L058:
        push    dx
        mov     dx, 1a0h
        in      al, dx
        pop     dx
        ret
int_94_svc:
        sti
        push    ds
        mov     bp, 356h
        mov     ds, bp
        call    L059
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
L059:
        cmp     ah, 0
        jne     L060
        jmp     L062
L060:
        cmp     ah, 1
        jne     L061
        jmp     L066
L061:
        ret
L062:
        cmp     al, 0ah
        jb      L063
        mov     al, 0
L063:
        mov     byte ptr [boot_dev], al
        mov     bl, al
        mov     bh, 0
        shl     bx, 1
        mov     bp, word ptr cs:[bx+tbl_scu_isr-CSBASE]
        mov     word ptr cs:[ivt-CSBASE+244h], bp
        mov     word ptr cs:[ivt-CSBASE+246h], cs
        cmp     al, 9
        jne     L064
        ret
L064:
        sub     al, 1
        jae     L065
        ret
L065:
        mov     bl, 1
        int     93h
        ret
tbl_scu_isr:
        dw      L108-CSBASE, L413-CSBASE, L413-CSBASE, L413-CSBASE
        dw      L413-CSBASE, L413-CSBASE, L413-CSBASE, L413-CSBASE
        dw      L413-CSBASE, L413-CSBASE
L066:
        cmp     byte ptr [boot_dev], 0
        jne     L067
        jmp     L070
L067:
        mov     bl, 0
        int     93h
        jae     L068
        ret
L068:
        mov     bl, 8
        int     93h
        jae     L069
        cmp     al, 0eh
        je      L071
L069:
        mov     bl, 8
        int     93h
        jb      L071
        mov     bl, 9
        int     93h
        jae     L071
        mov     al, byte ptr [boot_dev]
        dec     al
        mov     bl, 1
        int     93h
        mov     bl, 8
        int     93h
        mov     bl, 8
        int     93h
        jb      L072
L070:
        mov     bl, 1
        int     91h
        jb      L072
        mov     bl, byte ptr [boot_dev]
        clc
        ret
L071:
        stc
        ret
L072:
        cmp     al, 1dh
        jne     L073
        jmp     L067
L073:
        jmp     L071
int_8e_svc:
        push    dx
        mov     ah, 0
        shl     ax, 2
        shl     ax, 1
        mov     dx, ax
        add     dx, 0ff00h
        mov     bp, msg_scu_err-CSBASE
        db      0fh
        db      0f0h
        db      2ch                                                                     ; ,
msg_scu_err:
        db      0edh
        mov     bp, isr_tail-CSBASE
        db      0fh, 0e0h, 2bh
isr_tail:
        db      0c1h, 0e8h, 02h, 5ah, 0cfh
storage_complete_isr:                   ; IVT[23h] ICU IR3: [0356h:0078h] := 1
        push    ds
        push    bp
        mov     bp, 356h
        mov     ds, bp
        mov     byte ptr [dev_ready], 1
        pop     bp
        pop     ds
        iret
int_92_svc:
        push    ds
        push    bp
        mov     bp, 356h
        mov     ds, bp
        cmp     al, 0
        jne     L074
        mov     byte ptr [dev_ready], 0
L074:
        mov     al, byte ptr [dev_ready]
        pop     bp
        pop     ds
        iret
timer_read_svc:
        push    ds
        mov     bp, 356h
        mov     ds, bp
        mov     ax, word ptr [tick]
        pop     ds
        iret
int_2b_stub:
        jmp     bp
int_2c_stub:
        jmp     bp
int_95_svc:
        mov     dx, 356h
        mov     ds, dx
        int     8fh
        add     cl, ch
        pop     word ptr [di]
        dec     di
        db      1ah
        db      "Disk read error", 00h
L075:
        int     8fh
        db      01h, 0ebh, 0feh
        sti
        call    L076
        iret
L076:
        mov     bp, 1
L077:
        shl     di, 1
        rcl     si, 1
        jb      L078
        inc     bp
        cmp     bp, 20h
        jne     L077
        sub     di, di
        sub     si, si
        ret
L078:
        rcr     si, 1
        rcr     di, 1
        sub     cx, cx
        sub     bx, bx
L079:
        push    bp
        push    dx
        push    ax
        sub     ax, di
        sbb     dx, si
        jb      L080
        pop     bp
        pop     bp
        stc
        jmp     L081
L080:
        pop     ax
        pop     dx
        clc
L081:
        rcl     bx, 1
        rcl     cx, 1
        shr     si, 1
        rcr     di, 1
        pop     bp
        dec     bp
        jne     L079
        mov     di, ax
        mov     si, dx
        mov     ax, bx
        mov     dx, cx
        ret
int_8b_svc:
        call    L082
        iret
L082:
        mov     bp, dx
        mul     cx
        mov     di, ax
        mov     si, dx
        mov     ax, bp
        mul     cx
        add     si, ax
        mov     dx, si
        mov     ax, di
        ret
        db      2bh, 0c9h, 2bh, 0dbh, 89h, 0eh, prod, 000h, 89h, 0eh
L083:
; V1.01 branches on SF<>OF, not on SF.
        ifdef   BOOT_V101
        jl      L084
        else
        js      L084
        endif
L084:
        mov     word ptr [prod+4], cx
        mov     word ptr [prod+6], cx
        shr     dx, 1
        rcr     ax, 1
        rcr     cx, 1
        mov     bp, 20h
lcd_text_service:                       ; the boot block draws through this, not through the OS INT 8Fh table
        shl     di, 1
        rcl     si, 1
        jae     L085
        call    L086
L085:
        shr     dx, 1
        rcr     ax, 1
        rcr     cx, 1
        rcr     bx, 1
        dec     bp
        jne     lcd_text_service
        ret
L086:
        add     word ptr [prod], bx
        adc     word ptr [prod+2], cx
        adc     word ptr [prod+4], ax
        adc     word ptr [prod+6], dx
        ret
        mov     word ptr [dvsr], 0
        mov     word ptr [dvsr+2], bp
        mov     word ptr [dvsr+4], si
        mov     word ptr [dvsr+6], di
        mov     bp, 1
L087:
        shl     word ptr [dvsr+6], 1
        rcl     word ptr [dvsr+4], 1
        rcl     word ptr [dvsr+2], 1
        rcl     word ptr [dvsr], 1
        jae     L090
        rcr     word ptr [dvsr], 1
        rcr     word ptr [dvsr+2], 1
        rcr     word ptr [dvsr+4], 1
        rcr     word ptr [dvsr+6], 1
        mov     word ptr [quot], 0
        mov     word ptr [quot+2], 0
        mov     word ptr [quot+4], 0
        mov     word ptr [quot+6], 0
L088:
        push    ax
        push    bx
        push    cx
        push    dx
        call    L092
        jae     L091
        pop     dx
        pop     cx
        pop     bx
        pop     ax
        clc
L089:
        rcl     word ptr [quot+6], 1
        rcl     word ptr [quot+4], 1
        rcl     word ptr [quot+2], 1
        rcl     word ptr [quot], 1
        shr     word ptr [dvsr], 1
        rcr     word ptr [dvsr+2], 1
        rcr     word ptr [dvsr+4], 1
        rcr     word ptr [dvsr+6], 1
        dec     bp
        jne     L088
        ret
L090:
        inc     bp
        cmp     bp, 40h
        jne     L087
        mov     word ptr [quot], ax
        mov     word ptr [quot+2], bx
        mov     word ptr [quot+4], cx
        mov     word ptr [quot+6], dx
        ret
L091:
        pop     si
        pop     si
        pop     si
        pop     si
        stc
        jmp     L089
L092:
        sub     dx, word ptr [dvsr+6]
        sbb     cx, word ptr [dvsr+4]
        sbb     bx, word ptr [dvsr+2]
        sbb     ax, word ptr [dvsr]
        ret
        sti
        push    ds
        int     8fh
        push    es
        db      "         Wait.......", 00h
        pop     ds
        iret
        sti
        push    ds
        mov     bp, 356h
        mov     ds, bp
        call    L093
        pop     ds
        iret
L093:
        mov     bx, word ptr [tick]
L094:
        mov     ax, word ptr [tick]
        sub     ax, bx
        cmp     ax, cx
        jb      L094
        ret
        pop     bp
        mov     dx, si
L095:
        mov     al, byte ptr cs:[bp]
        inc     bp
        or      al, al
        je      L097
        mov     ah, byte ptr [si]
        inc     si
        cmp     ah, al
        je      L095
L096:
        mov     al, byte ptr cs:[bp]
        inc     bp
        or      al, al
        jne     L096
        mov     si, dx
        stc
        jmp     bp
L097:
        mov     si, dx
        clc
        jmp     bp
        pop     bp
        mov     dx, si
L098:
        mov     al, byte ptr cs:[bp]
        inc     bp
        or      al, al
        je      L100
        mov     ah, byte ptr es:[si]
        inc     si
        cmp     ah, al
        je      L098
L099:
        mov     al, byte ptr cs:[bp]
        inc     bp
        or      al, al
        jne     L099
        mov     si, dx
        stc
        jmp     bp
L100:
        mov     si, dx
        clc
        jmp     bp
dbg_trap:
        pusha
        push    ds
        push    es
        push    sp
        push    ss
        push    es
        push    ds
        push    di
        push    si
        push    bp
        push    dx
        push    cx
        push    bx
        push    ax
        mov     ax, 356h
        mov     ds, ax
        sti
        int     8fh
        add     cl, ch
        pop     word ptr [di]
        add     byte ptr [bx+si], al
        inc     cx
        pop     ax
        cmp     al, byte ptr [bx+si]
        pop     ax
        int     8fh
        or      al, 12h
        db      00h, 0cdh
        pop     word ptr [di]
        add     byte ptr [bx+si], cl
        inc     dx
        pop     ax
        cmp     al, byte ptr [bx+si]
        pop     ax
        int     8fh
        or      al, 12h
        db      08h, 0cdh
        pop     word ptr [di]
        add     byte ptr [bx+si], dl
        inc     bx
        pop     ax
        cmp     al, byte ptr [bx+si]
        pop     ax
        int     8fh
        or      al, 12h
        db      10h, 0cdh
        pop     word ptr [di]
        add     byte ptr [bx+si], bl
        inc     sp
        pop     ax
        cmp     al, byte ptr [bx+si]
        pop     ax
        int     8fh
        or      al, 12h
        db      18h, 0cdh
        pop     word ptr [di]
        add     byte ptr [bx+si], ah
        inc     dx
        push    ax
        cmp     al, byte ptr [bx+si]
        pop     ax
        mov     word ptr [txt_off2], ax
        int     8fh
        or      al, 12h
        db      20h, 0cdh
        pop     word ptr [di]
        xor     byte ptr [bx+si], al
        push    bx
        dec     cx
        cmp     al, byte ptr [bx+si]
        pop     ax
        mov     word ptr [txt_off0], ax
        int     8fh
        or      al, 42h
        db      00h, 0cdh
        pop     word ptr [di]
        xor     byte ptr [bx+si], cl
        inc     sp
        dec     cx
        cmp     al, byte ptr [bx+si]
        pop     ax
        mov     word ptr [txt_off1], ax
        int     8fh
        or      al, 42h
        db      08h, 0cdh
        pop     word ptr [di]
        xor     byte ptr [bx+si], dl
        inc     sp
        push    bx
        cmp     al, byte ptr [bx+si]
        pop     ax
        mov     word ptr [txt_seg0], ax
        int     8fh
        or      al, 42h
        db      10h, 0cdh
        pop     word ptr [di]
        xor     byte ptr [bx+si], bl
        inc     bp
        push    bx
        cmp     al, byte ptr [bx+si]
        pop     ax
        mov     word ptr [txt_seg1], ax
        int     8fh
        or      al, 42h
        db      18h, 0cdh
        pop     word ptr [di]
        xor     byte ptr [bx+si], ch
        push    bx
        push    bx
        cmp     al, byte ptr [bx+si]
        pop     ax
        int     8fh
        or      al, 42h
        db      28h, 0cdh
        pop     word ptr [di]
        add     byte ptr [bx+si], dh
        push    bx
        push    ax
        cmp     al, byte ptr [bx+si]
        pop     ax
        add     ax, 1eh
        int     8fh
        or      al, 12h
        db      30h, 0cdh
        pop     word ptr [di]
        add     byte ptr [bx+si], ch
        push    ax
        inc     bx
        cmp     al, byte ptr [bx+si]
        mov     bp, sp
        mov     ax, word ptr [bp+14h]
        int     8fh
        or      al, 12h
        db      28h, 0cdh
        pop     word ptr [di]
        xor     byte ptr [bx+si], ah
        inc     bx
        push    bx
        cmp     al, byte ptr [bx+si]
        mov     bp, sp
        mov     ax, word ptr [bp+16h]
        int     8fh
        or      al, 42h
        db      20h, 0cdh
        pop     word ptr [di]
        pusha
        add     byte ptr [si+53h], al
        cmp     dl, byte ptr [bp+di+49h]
        cmp     ax, 3eh
        int     8fh
        add     ax, 860h
        inc     sp
        push    bx
        cmp     al, byte ptr [si+49h]
        cmp     ax, 3eh
        int     8fh
        add     ax, 1060h
        inc     sp
        push    bx
        cmp     al, byte ptr [bp+si+50h]
        cmp     ax, 3eh
        int     8fh
        add     ax, 1860h
        inc     bp
        push    bx
        cmp     dl, byte ptr [bp+di+49h]
        cmp     ax, 3eh
        int     8fh
        add     ax, 2060h
        inc     bp
        push    bx
        cmp     al, byte ptr [si+49h]
        cmp     ax, 3eh
        int     8fh
        add     ax, 2860h
        inc     bp
        push    bx
        cmp     al, byte ptr [bp+si+50h]
        cmp     ax, 3eh
        mov     es, word ptr [txt_seg0]
        mov     si, word ptr [txt_off0]
        mov     ch, 0
        call    L101
        mov     si, word ptr [txt_off1]
        mov     ch, 8
        call    L101
        mov     si, word ptr [txt_off2]
        mov     ch, 10h
        call    L101
        mov     es, word ptr [txt_seg1]
        mov     si, word ptr [txt_off0]
        mov     ch, 18h
        call    L101
        mov     si, word ptr [txt_off1]
        mov     ch, 20h
        call    L101
        mov     si, word ptr [txt_off2]
        mov     ch, 28h
        call    L101
        int     8fh
        db      01h, 0ebh, 0feh
L101:
        mov     cl, 8ah
        mov     di, si
        mov     dl, 5
        mov     di, si
L102:
        mov     al, byte ptr es:[si]
        mov     bl, 0bh
        int     90h
        inc     si
        add     cl, 0eh
        dec     dl
        jne     L102
        add     cl, 1
        mov     dl, 5
        call    L105
        ret
ovf_trap:
        mov     ax, 356h
        mov     ds, ax
        mov     dh, 6
        mov     ch, 1
L103:
        push    dx
        mov     cl, 1
        mov     ax, es
        mov     bl, 0ch
        int     90h
        add     cl, 1ah
        mov     ax, si
        mov     bl, 0ch
        int     90h
        add     cl, 18h
        mov     al, 3ah
        mov     bl, 4
        int     90h
        add     cl, 6
        mov     di, si
        mov     dl, byte ptr [txt_len]
L104:
        mov     al, byte ptr es:[si]
        mov     bl, 0bh
        int     90h
        inc     si
        add     cl, 0fh
        dec     dl
        jne     L104
        mov     al, 3ah
        mov     bl, 4
        int     90h
        add     cl, 4
        push    es
        push    si
        push    cx
        db      0e8h, 10h, 00h
        pop     cx
        pop     si
        pop     es
        pop     dx
        add     ch, 8
        dec     dh
        jne     L103
        int     8fh
        db      01h, 0ebh
        inc     byte ptr [bx+si+1c1h]
        mov     dl, byte ptr [txt_len]
L105:
        mov     al, byte ptr es:[di]
        cmp     al, 20h
        jae     L106
        mov     al, 2ah
L106:
        cmp     al, 7bh
        jb      L107
        mov     al, 2ah
L107:
        mov     bl, 4
        int     90h
        inc     di
        add     cl, 8
        dec     dl
        jne     L105
        ret
        ifdef   BOOT_V101
        db      00h
        endif
L108:
        sti
        push    ds
        mov     bp, 4000h
        mov     ds, bp
        pusha
        call    L203
        popa
        mov     bp, tbl_text_op-CSBASE
        sub     bh, bh
        shl     bx, 1
        add     bx, bp
        mov     word ptr [wk_w_0a000], sp
        call    word ptr cs:[bx]
L109:
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
L110:
        mov     al, 9
        jmp     L112
        mov     al, 5
        jmp     L112
        mov     al, 18h
        jmp     L112
L111:
        mov     al, 1eh
        jmp     L112
L112:
        cli
        mov     sp, word ptr [wk_w_0a000]
        stc
        jmp     L109
tbl_text_op:
        dw      L115-CSBASE, L120-CSBASE, L114-CSBASE, L135-CSBASE
        dw      L157-CSBASE, L114-CSBASE, L164-CSBASE, L114-CSBASE
        dw      L114-CSBASE, L114-CSBASE, L114-CSBASE, L114-CSBASE
        dw      L114-CSBASE, L114-CSBASE, L152-CSBASE, L114-CSBASE
        dw      L207-CSBASE, L179-CSBASE, L114-CSBASE, L114-CSBASE
        dw      L114-CSBASE, L114-CSBASE, L138-CSBASE, L114-CSBASE
        dw      L114-CSBASE, L114-CSBASE, L114-CSBASE, L114-CSBASE
        dw      L114-CSBASE, L114-CSBASE, L114-CSBASE, L114-CSBASE
L114:
        db      2bh                                                                     ; +
        db      0ddh
        shr     bx, 1
        mov     ax, 23h
        stc
        ret
L115:
        mov     al, 36h
        out     20h, al
        mov     ax, ds
        mov     es, ax
        mov     di, 0a000h
        mov     cx, 7eh
        sub     ax, ax
        rep stosw
        mov     byte ptr [wk_b_0a0e3], 3
        mov     byte ptr [wk_b_0a0e4], 3
        mov     byte ptr [wk_b_0a0e5], 0c4h
        mov     byte ptr [wk_b_0a0e6], 14h
        call    L195
        mov     ah, 4bh
        call    check_disk_status
        mov     byte ptr [wk_b_0a095], 0
        call    L213
        ret
L120:
        call    L115
        call    L203
        call    L181
        jae     L121
        ret
L121:
        mov     al, 3
        call    L184
        jae     L122
        ret
L122:
        call    L179
        mov     al, 1
        mov     ah, 0
        jb      L125
        call    L126
        jne     L123
        ret
L123:
        call    L129
        jne     L124
        ret
L124:
        mov     al, 1
        mov     ah, 1
        sub     cx, cx
        sub     dx, dx
        sub     si, si
        sub     bx, bx
L125:
        clc
        ret
L126:
        mov     byte ptr [wk_b_0a0e9], 2
        mov     byte ptr [wk_b_0a0ea], 12h
        mov     byte ptr [wk_b_0a0eb], 1bh
        mov     byte ptr [wk_b_0a0ec], 0ffh
        mov     word ptr [wk_w_0a0a0], 200h
        mov     word ptr [wk_w_0a09c], 1200h
        mov     word ptr [wk_w_0a09e], 0b1fh
        mov     word ptr [wk_w_0a0ac], 21h
        mov     word ptr [wk_w_0a0ae], 1
        mov     word ptr [wk_w_0a0b0], 200h
        mov     word ptr [wk_w_0a0a4], 2600h
        mov     word ptr [wk_w_0a0a6], 0e0h
        mov     byte ptr [wk_b_0a093], 1
        mov     byte ptr [wk_b_0a094], 0
        mov     byte ptr [wk_b_0a0f0], 2
        mov     byte ptr [wk_b_0a0f1], 12h
        mov     byte ptr [wk_b_0a0f2], 54h
        mov     byte ptr [wk_b_0a0f3], 0f6h
        mov     ah, 4fh
        call    check_disk_status
        mov     ah, 4bh
        call    check_disk_status
        call    L132
        je      L127
        ret
L127:
        mov     di, bpb_1440k-CSBASE
        call    L134
        je      L128
        ret
L128:
        mov     al, 2
        mov     ah, 2
        sub     cx, cx
        sub     dx, dx
        sub     bx, bx
        ret
L129:
        mov     byte ptr [wk_b_0a0e9], 2
        mov     byte ptr [wk_b_0a0ea], 9
        mov     byte ptr [wk_b_0a0eb], 1bh
        mov     byte ptr [wk_b_0a0ec], 0ffh
        mov     word ptr [wk_w_0a0a0], 200h
        mov     word ptr [wk_w_0a09c], 600h
        mov     word ptr [wk_w_0a09e], 2c9h
        mov     word ptr [wk_w_0a0ac], 0eh
        mov     word ptr [wk_w_0a0ae], 2
        mov     word ptr [wk_w_0a0b0], 200h
        mov     word ptr [wk_w_0a0a4], 0e00h
        mov     word ptr [wk_w_0a0a6], 70h
        mov     byte ptr [wk_b_0a093], 0
        mov     byte ptr [wk_b_0a094], 0
        mov     byte ptr [wk_b_0a0f0], 2
        mov     byte ptr [wk_b_0a0f1], 9
        mov     byte ptr [wk_b_0a0f2], 54h
        mov     byte ptr [wk_b_0a0f3], 0e5h
        mov     ah, 4fh
        call    check_disk_status
        mov     ah, 0bh
        call    check_disk_status
        call    L132
        je      L130
        ret
L130:
        mov     di, bpb_720k-CSBASE
        call    L134
        je      L131
        ret
L131:
        mov     al, 3
        mov     ah, 3
        sub     cx, cx
        sub     dx, dx
        sub     bx, bx
        ret
L132:
        mov     ax, 0
        call    L177
        mov     ch, byte ptr [wk_b_0a0ea]
        add     ch, ch
        cmp     byte ptr [wk_b_0a0e9], 3
        jne     L133
        shl     ch, 1
L133:
        sub     cl, cl
        mov     ax, ds
        mov     es, ax
        mov     di, 0
        mov     si, 5000h
        rep movsw
        and     byte ptr [wk_b_0a0f5], 0c0h
        ret
L134:
        mov     si, 0bh
        mov     bx, cs
        mov     es, bx
        mov     cx, 11h
        repe cmpsb
        ret
L135:
        cmp     ax, word ptr [wk_w_0a0a6]
        jae     L137
        mov     si, ax
        shl     si, 5
        add     si, word ptr [wk_w_0a0a4]
        cmp     byte ptr [si], 0
        je      L137
        push    ax
        call    L141
        pop     ax
        jae     L136
        inc     ax
        jmp     L135
L136:
        push    ax
        mov     word ptr [wk_w_0a0a2], si
        call    L143
        pop     ax
        clc
        ret
L137:
        push    ax
        mov     si, 0a0ceh
        mov     di, si
        mov     ax, ds
        mov     es, ax
        mov     cx, 14h
        mov     al, 20h
        rep stosb
        sub     bx, bx
        sub     dx, dx
        pop     ax
        stc
        ret
L138:
        cmp     ax, word ptr [wk_w_0a0a6]
        jae     L140
L139:
        mov     si, ax
        shl     si, 5
        add     si, word ptr [wk_w_0a0a4]
        push    ax
        call    L141
        pop     ax
        jae     L136
        cmp     ax, 0
        je      L137
        dec     ax
        jmp     L139
L140:
        mov     ax, word ptr [wk_w_0a0a6]
        jmp     L137
L141:
        mov     al, byte ptr [si]
        cmp     al, 0
        je      L142
        cmp     al, 0e5h
        je      L142
        cmp     al, 5
        je      L142
        cmp     al, 2eh
        je      L142
        test    byte ptr [si+0bh], 0eh
        jne     L142
        clc
        ret
L142:
        stc
        ret
L143:
        mov     di, 0a0ceh
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
        call    L145
        jb      L144
        mov     cx, 8
        rep movsb
L144:
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
L145:
        push    si
        push    cx
        mov     cx, 8
L146:
        cmp     byte ptr [si], 20h
        jb      L147
        cmp     byte ptr [si], 7bh
        jae     L147
        inc     si
        loop    L146
        pop     cx
        pop     si
        clc
        ret
L147:
        pop     cx
        pop     si
        stc
        ret
        mov     cx, word ptr [wk_w_0a0a6]
        mov     di, word ptr [wk_w_0a0a4]
L148:
        mov     al, byte ptr [di]
        mov     word ptr [wk_w_0a0a2], si
        cmp     al, 0
        jne     L149
        ret
L149:
        cmp     al, 5
        jne     L150
        ret
L150:
        cmp     al, 0e5h
        jne     L151
        ret
L151:
        add     di, 20h
        loop    L148
        stc
        ret
L152:
        mov     dx, 0ffffh
        mov     bp, si
L153:
        inc     dx
        push    es
        push    bp
        push    dx
        push    es
        mov     ax, dx
        call    L135
        pop     es
        pop     dx
        pop     bp
        pop     es
        mov     ax, 8
        jae     L154
        ret
L154:
        mov     cx, 14h
        mov     si, bp
        mov     di, 0a0ceh
L155:
        mov     al, byte ptr es:[si]
        cmp     al, 61h
        jb      L156
        cmp     al, 7bh
        jae     L156
        sub     al, 20h
L156:
        cmp     al, byte ptr [di]
        jne     L153
        inc     si
        inc     di
        loop    L155
        sub     ax, ax
        clc
        ret
L157:
        pusha
        call    L179
        popa
        jae     L158
        jmp     L160
L158:
        call    L152
        jae     L159
        ret
L159:
        mov     si, word ptr [wk_w_0a0a2]
        mov     ax, word ptr [si+1ah]
        mov     word ptr [wk_w_0a0ba], ax
        sub     ax, ax
        mov     word ptr [wk_w_0a0bc], ax
        mov     word ptr [wk_w_0a0b4], ax
        mov     word ptr [wk_w_0a0b2], ax
        mov     word ptr [wk_w_0a0a8], ax
        mov     word ptr [wk_w_0a0aa], ax
        mov     bx, word ptr [si+1ch]
        mov     dx, word ptr [si+1eh]
        mov     word ptr [wk_w_0a0b6], bx
        mov     word ptr [wk_w_0a0b8], dx
        push    ds
        pop     es
        sub     ax, ax
        clc
        ret
L160:
        push    es
        pusha
        call    L120
        push    ax
        call    L179
        pop     ax
        jb      L161
        call    L162
        jne     L161
        popa
        pop     es
        jmp     L158
L161:
        popa
        pop     es
        mov     ax, 4
        stc
        ret
L162:
        cmp     ah, 2
        je      L163
        cmp     ah, 3
        je      L163
        cmp     ah, 0ah
        je      L163
        cmp     ah, 0bh
L163:
        ret
L164:
        mov     ax, word ptr [wk_w_0a0b6]
        or      ax, word ptr [wk_w_0a0b8]
        jne     L165
        ret
L165:
        sub     word ptr [wk_w_0a0b6], cx
        sbb     word ptr [wk_w_0a0b8], 0
        jae     L166
        add     cx, word ptr [wk_w_0a0b6]
        mov     word ptr [wk_w_0a0b6], 0
        mov     word ptr [wk_w_0a0b8], 0
L166:
        push    cx
        call    L167
        pop     ax
        clc
        ret
L167:
        cmp     cx, word ptr [wk_w_0a0bc]
        jbe     L168
        sub     cx, word ptr [wk_w_0a0bc]
        push    cx
        mov     cx, word ptr [wk_w_0a0bc]
        mov     word ptr [wk_w_0a0bc], 0
        mov     si, word ptr [wk_w_0a0be]
        rep movsb
        push    di
        push    es
        call    L169
        pop     es
        pop     di
        pop     cx
        cmp     word ptr [wk_w_0a0bc], 0
        jne     L167
        ret
L168:
        sub     word ptr [wk_w_0a0bc], cx
        mov     si, word ptr [wk_w_0a0be]
        rep movsb
        mov     word ptr [wk_w_0a0be], si
        ret
L169:
        mov     ax, word ptr [wk_w_0a0b4]
        cmp     word ptr [wk_w_0a0b2], 0
        jne     L171
        mov     ax, word ptr [wk_w_0a0ba]
        mov     bx, 0ff6h
        sub     bx, ax
        jae     L170
        ret
L170:
        call    L176
L171:
        cmp     ax, word ptr [wk_w_0a0a8]
        jb      L173
        cmp     ax, word ptr [wk_w_0a0aa]
        jae     L173
        sub     ax, word ptr [wk_w_0a0a8]
        mov     ah, al
        sub     al, al
        shl     ax, 1
        add     ax, 5000h
        mov     word ptr [wk_w_0a0be], ax
        mov     word ptr [wk_w_0a0bc], 200h
        inc     word ptr [wk_w_0a0b4]
        dec     word ptr [wk_w_0a0b2]
        je      L172
        ret
L172:
        call    L174
        ret
L173:
        call    L177
        test    byte ptr [wk_b_0a0f5], 0c0h
        je      L169
        mov     al, byte ptr [wk_b_0a0f5]
        jmp     L110
L174:
        mov     ax, word ptr [wk_w_0a0ba]
        mov     bx, ax
        shr     bx, 1
        pushf
        add     bx, ax
        add     bx, word ptr [wk_w_0a0a0]
        mov     ax, word ptr [bx]
        popf
        jae     L175
        shr     ax, 4
L175:
        and     ah, 0fh
        mov     word ptr [wk_w_0a0ba], ax
        ret
L176:
        sub     ax, 2
        mov     bx, word ptr [wk_w_0a0ae]
        mul     bx
        add     ax, word ptr [wk_w_0a0ac]
        mov     word ptr [wk_w_0a0b4], ax
        mov     word ptr [wk_w_0a0b2], bx
        ret
L177:
        push    ax
        mov     bh, byte ptr [wk_b_0a0ea]
        div     bh
        mov     bl, ah
        sub     ah, ah
        shr     al, 1
        rcl     ah, 1
        sub     bh, bl
        cmp     ah, 0
        jne     L178
        add     bh, byte ptr [wk_b_0a0ea]
L178:
        inc     bl
        push    bx
        call    L186
        pop     bx
        mov     bl, bh
        sub     bh, bh
        pop     ax
        mov     word ptr [wk_w_0a0a8], ax
        add     ax, bx
        mov     word ptr [wk_w_0a0aa], ax
        ret
L179:
        mov     byte ptr [wk_b_0a0e3], 2
        mov     byte ptr [wk_b_0a0e4], 4
        mov     byte ptr [wk_b_0a0e5], 0
        call    L195
        call    L192
        xor     al, 38h
        mov     ah, al
        mov     bl, al
        and     bl, 40h
        mov     byte ptr [wk_b_0a092], bl
        mov     bh, 0
        and     ah, 8
        sub     ah, 8
        jb      L180
        sub     ax, ax
        ret
L180:
        mov     al, 7
        stc
        ret
L181:
        mov     byte ptr [wk_b_0a0e3], 2
        mov     byte ptr [wk_b_0a0e4], 7
        mov     byte ptr [wk_b_0a0e5], 0
        cli
        call    L195
        sti
        call    L211
        call    L191
        cmp     al, 80h
        jne     L182
        ret
L182:
        cmp     al, 20h
        jne     L183
        ret
L183:
        stc
        ret
L184:
        mov     byte ptr [wk_b_0a0e3], 3
        mov     byte ptr [wk_b_0a0e4], 0fh
        mov     byte ptr [wk_b_0a0e5], 0
        mov     byte ptr [wk_b_0a0e6], al
        cli
        call    L195
        sti
        call    L211
        call    L191
        cmp     al, 20h
        jne     L185
        ret
L185:
        jmp     L111
L186:
        push    ax
        push    bx
        call    L184
        pop     bx
        pop     ax
        mov     byte ptr [wk_b_0a0e3], 9
        mov     cl, ah
        xor     cl, 1
        ror     cl, 1
        or      cl, 46h
        mov     byte ptr [wk_b_0a0e4], cl
        mov     cl, ah
        rol     cl, 2
        mov     byte ptr [wk_b_0a0e5], cl
        mov     byte ptr [wk_b_0a0e6], al
        mov     byte ptr [wk_b_0a0e7], ah
        mov     byte ptr [wk_b_0a0e8], bl
        call    L208
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
L187:
        shl     ax, 1
        rcl     bl, 1
        loop    L187
        add     ax, 5000h
        adc     bl, 0
        mov     dx, 0c034h
        out     dx, ax
        mov     al, bl
        int     8eh
        mov     dx, 0c036h
        out     dx, al
        mov     ah, bh
        shl     ah, 1
        sub     al, al
        cmp     byte ptr [wk_b_0a0e9], 3
        jne     L188
        shl     ax, 1
L188:
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
        call    L195
        call    L190
        call    L210
        ret
L189:
        jmp     L189
        db      090h, "MPC2KEX "                             ; .MPC2KEX 
bpb_1440k:
        db      00h, 02h, 01h, 01h, 00h, 02h, 0e0h
        db      00h, 40h, 0bh, 0f0h, 09h, 00h, 12h, 00h, 02h, 00h, 0ebh, 0feh, 90h, 4dh, 50h, 43h
        db      "2KEX "                                                 ; 2KEX 
bpb_720k:
        db      00h, 02h, 02h, 01h, 00h, 02h, 70h, 00h, 0a0h, 05h, 0f9h
        db      003h, 000h, 009h, 000h, 002h, 000h, 0ebh, 0feh, 090h, "MPC2000"
        db      20h
L190:
        call    L211
        in      al, 20h
        test    al, 40h
        je      L191
        jmp     L192
L191:
        mov     byte ptr [wk_b_0a0e3], 1
        mov     byte ptr [wk_b_0a0e4], 8
        call    L195
        call    L192
        and     al, 0f8h
        ret
L192:
        call    L201
        mov     si, 0a0f5h
        call    L214
L193:
        call    L215
        in      al, 20h
        and     al, 0c0h
        cmp     al, 80h
        je      L194
        cmp     al, 0c0h
        jne     L193
        in      al, 22h
        mov     byte ptr [si], al
        inc     si
        jmp     L193
L194:
        mov     al, byte ptr [wk_b_0a0f5]
        ret
L195:
        mov     si, 0a0e4h
        call    L213
L196:
        call    L199
        lodsb
        out     22h, al
        dec     byte ptr [wk_b_0a0e3]
        jne     L196
        ret
        mov     si, 0a0eeh
        call    L213
L197:
        call    L199
        lodsb
        out     22h, al
        dec     byte ptr [wk_b_0a0ed]
        jne     L197
        ret
check_disk_status:
        push    ax
        call    L199
        pop     ax
        mov     al, ah
        out     20h, al
        call    L201
        in      al, 22h
        ret
L199:
        call    L214
L200:
        call    L215
        in      al, 20h
        and     al, 0c0h
        cmp     al, 80h
        jne     L200
        ret
L201:
        call    L214
L202:
        call    L215
        in      al, 20h
        and     al, 0c0h
        cmp     al, 0c0h
        jne     L202
        ret
L203:
        mov     ah, 1eh
        call    check_disk_status
        cmp     byte ptr [wk_b_0a096], 0
        je      L204
        ret
L204:
        mov     byte ptr [wk_b_0a096], 1
        mov     bl, 7
L205:
        mov     cx, 0ffffh
L206:
        mul     ax
        loop    L206
        dec     bl
        jne     L205
        ret
L207:
        mov     ah, 0eh
        call    check_disk_status
        mov     byte ptr [wk_b_0a096], 0
        ret
L208:
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
        cmp     byte ptr [wk_b_0a093], 0
        jne     L209
        mov     al, 71h
L209:
        mov     dx, 0fff6h
        out     dx, al
        popa
        ret
L210:
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
L211:
        call    L214
L212:
        call    L215
        mov     al, 1
        int     92h
        cmp     al, 0
        je      L212
        ret
L213:
        pusha
        mov     al, 0
        int     92h
        popa
        ret
L214:
        mov     word ptr [wk_w_0a098], 0
        mov     word ptr [wk_w_0a09a], 14h
        ret
L215:
        push    ax
        push    dx
        mov     ax, 0ffffh
        mul     ax
        pop     dx
        pop     ax
        dec     word ptr [wk_w_0a098]
        je      L216
        ret
L216:
        dec     word ptr [wk_w_0a09a]
        jne     L217
        jmp     L110
L217:
        ret
        db      00h
scsi_service:
        sti
        push    ds
        push    es
        mov     bp, 356h
        mov     ds, bp
        and     bx, 0fh
        shl     bx, 1
        mov     bp, cdb
        call    word ptr cs:[bx+tbl_scsi_cmd-CSBASE]
        pop     es
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
tbl_scsi_cmd:
        dw      L218-CSBASE, L222-CSBASE, L234-CSBASE, L245-CSBASE
        dw      L223-CSBASE, L224-CSBASE, L232-CSBASE, L258-CSBASE
        dw      L259-CSBASE, L260-CSBASE, L233-CSBASE, L220-CSBASE
; V1.01 fills the last two slots; V1.00 leaves them on a bare RET.
        ifdef   BOOT_V101
        dw      L261-CSBASE, L262-CSBASE, L289-CSBASE, L219-CSBASE
L219:
        db      0c3h
        else
        dw      L261-CSBASE, L262-CSBASE, L326-CSBASE, L327-CSBASE
        ret
        endif
L218:
        mov     bx, 6
        mov     al, byte ptr cs:[bx+tbl_spc_id-CSBASE]
        mov     byte ptr [spc_id], al
        mov     al, bl
        mov     dx, 0
        out     dx, al
        mov     dx, 2
        mov     al, 80h
        out     dx, al
        mov     dx, 10h
        mov     al, 0
        out     dx, al
        mov     dx, 8
        mov     al, 0ffh
        out     dx, al
        mov     dx, 18h
        mov     al, 0
        out     dx, al
        mov     dx, 1ah
        mov     al, 0
        out     dx, al
        mov     dx, 1ch
        mov     al, 0
        out     dx, al
        mov     dx, 16h
        mov     al, 0
        out     dx, al
        mov     dx, 2
        mov     al, 1eh
        out     dx, al
        mov     word ptr [blk_count], 1
        sub     ax, ax
        clc
        ret
tbl_spc_id:
        add     word ptr [bp+si], ax
        add     al, 8
        adc     byte ptr [bx+si], ah
        inc     ax
        db      80h
L220:
        db      0e8h, 0aah, 0ffh
        mov     dx, 4
        mov     al, 10h
        out     dx, al
        mov     ax, 2
        call    L323
L221:
        call    L325
        jae     L221
        call    L218
        mov     word ptr [blk_count], 1
        sub     ax, ax
        clc
        ret
L222:
        mov     bl, al
        mov     bh, 0
        mov     al, byte ptr cs:[bx+tbl_spc_id-CSBASE]
        mov     byte ptr [spc_stat], al
        ret
L223:
        mov     byte ptr ds:[bp], 12h
        mov     al, 0
        mov     byte ptr ds:[bp+1], al
        mov     byte ptr ds:[bp+2], al
        mov     byte ptr ds:[bp+3], al
        mov     byte ptr ds:[bp+4], cl
        mov     byte ptr ds:[bp+5], al
        mov     word ptr [xfer_len], cx
        mov     word ptr [xfer_off], di
        mov     word ptr [xfer_seg], dx
        call    L263
        ret
L224:
        call    L230
; V1.01 derives blk_count with a DIV; V1.00 shift-adds and caps at 200h.
        ifdef   BOOT_V101
        jae     L226
        ret
L226:
        mov     dh, byte ptr ds:[bp]
        mov     dl, byte ptr ds:[bp+1]
        mov     ah, byte ptr ds:[bp+2]
        mov     al, byte ptr ds:[bp+3]
        add     ax, 1
        adc     dx, 0
        cmp     byte ptr [spc_stat], 2
        mov     bh, byte ptr ds:[bp+4]
        mov     bl, byte ptr ds:[bp+5]
        mov     ch, byte ptr ds:[bp+6]
        mov     cl, byte ptr ds:[bp+7]
        mov     word ptr [blk_size], cx
        cmp     cx, 801h
        jae     L229
        pusha
        mov     ax, cx
        mov     dx, 0
        mov     bx, 200h
        div     bx
        mov     word ptr [blk_count], ax
        popa
        else
        jae     L225
        ret
L225:
        cmp     word ptr ds:[bp+6], 2
        je      L226
        call    L231
        call    L230
L226:
        mov     dh, byte ptr ds:[bp]
        mov     dl, byte ptr ds:[bp+1]
        mov     ah, byte ptr ds:[bp+2]
        mov     al, byte ptr ds:[bp+3]
        add     ax, 1
        adc     dx, 0
        mov     bh, byte ptr ds:[bp+4]
        mov     bl, byte ptr ds:[bp+5]
        mov     ch, byte ptr ds:[bp+6]
        mov     cl, byte ptr ds:[bp+7]
        mov     word ptr [blk_size], cx
        cmp     cx, 200h
        je      L228
        cmp     cx, 801h
        jae     L229
        mov     ax, cx
        sub     dx, dx
        mov     bx, 200h
        div     bx
        mov     word ptr [blk_count], ax
        mov     cx, ax
        mov     dh, byte ptr ds:[bp]
        mov     dl, byte ptr ds:[bp+1]
        mov     ah, byte ptr ds:[bp+2]
        mov     al, byte ptr ds:[bp+3]
        add     ax, 1
        adc     dx, 0
        sub     di, di
        sub     si, si
L227:
        add     di, ax
        adc     si, dx
        loop    L227
        mov     dx, si
        mov     ax, di
        mov     cx, 200h
        sub     bx, bx
L228:
        endif
        clc
        ret
L229:
        mov     al, 1ch
        stc
        ret
L230:
        mov     bp, cdb
        mov     byte ptr ds:[bp], 25h
        mov     al, 0
        mov     byte ptr ds:[bp+1], al
        mov     byte ptr ds:[bp+2], al
        mov     byte ptr ds:[bp+3], al
        mov     byte ptr ds:[bp+4], al
        mov     byte ptr ds:[bp+5], al
        mov     byte ptr ds:[bp+6], al
        mov     byte ptr ds:[bp+7], al
        mov     byte ptr ds:[bp+8], al
        mov     byte ptr ds:[bp+9], al
        mov     word ptr [xfer_len], 8
        mov     bp, dev_buf
        mov     word ptr [xfer_off], bp
        mov     word ptr [xfer_seg], ds
        push    bp
        call    L263
        pop     bp
        ret
        ifndef  BOOT_V101
L231:
        endif
        mov     bp, cdb
        mov     byte ptr ds:[bp], 15h
        mov     al, 0
        mov     byte ptr ds:[bp+1], 10h
        mov     byte ptr ds:[bp+2], al
        mov     byte ptr ds:[bp+3], al
        mov     byte ptr ds:[bp+4], 0ch
        mov     byte ptr ds:[bp+5], al
        mov     bp, dev_buf
        mov     byte ptr ds:[bp], al
        mov     byte ptr ds:[bp+1], al
        mov     byte ptr ds:[bp+2], al
        mov     byte ptr ds:[bp+3], 8
        mov     byte ptr ds:[bp+4], al
        mov     byte ptr ds:[bp+5], al
        mov     byte ptr ds:[bp+6], al
        mov     byte ptr ds:[bp+7], al
        mov     byte ptr ds:[bp+8], al
        mov     byte ptr ds:[bp+9], al
        mov     byte ptr ds:[bp+0ah], 2
        mov     byte ptr ds:[bp+0bh], al
        mov     word ptr [xfer_len], 0ch
        mov     word ptr [xfer_off], dev_buf
        mov     word ptr [xfer_seg], ds
        call    L263
        ret
L232:
        mov     byte ptr ds:[bp], 4
        mov     al, 0
        mov     byte ptr ds:[bp+1], al
        mov     byte ptr ds:[bp+2], al
        mov     byte ptr ds:[bp+3], al
        mov     byte ptr ds:[bp+4], al
        mov     byte ptr ds:[bp+5], al
        call    L263
        ret
L233:
        mov     byte ptr ds:[bp], 43h
        mov     al, 0
        mov     byte ptr ds:[bp+1], al
        mov     byte ptr ds:[bp+2], al
        mov     byte ptr ds:[bp+3], al
        mov     byte ptr ds:[bp+4], al
        mov     byte ptr ds:[bp+5], al
        mov     byte ptr ds:[bp+6], 1
        mov     byte ptr ds:[bp+7], al
        mov     byte ptr ds:[bp+8], 68h
        mov     byte ptr ds:[bp+9], al
        mov     word ptr [xfer_len], 68h
        mov     word ptr [xfer_off], di
        mov     word ptr [xfer_seg], dx
        call    L263
        ret
L234:
        mov     byte ptr ds:[bp], 28h
        mov     bl, 0
        mov     byte ptr ds:[bp+1], bl
        mov     byte ptr ds:[bp+2], dh
        mov     byte ptr ds:[bp+3], dl
        mov     byte ptr ds:[bp+4], ah
        mov     byte ptr ds:[bp+5], al
        mov     byte ptr ds:[bp+6], bl
        mov     byte ptr ds:[bp+7], ch
        mov     byte ptr ds:[bp+8], cl
        mov     byte ptr ds:[bp+9], bl
        mov     word ptr [xfer_off], di
        mov     word ptr [xfer_seg], es
; V1.01 rebuilds READ(10)/WRITE(10); the sector helpers move to L289.
        ifdef   BOOT_V101
        mov     ax, word ptr [blk_size]
        cmp     byte ptr [spc_stat], 2
        mul     cx
        mov     word ptr [xfer_len], ax
        call    L263
        ret
L245:
        mov     byte ptr ds:[bp], 2ah
        mov     bl, 0
        mov     byte ptr ds:[bp+1], bl
        mov     byte ptr ds:[bp+2], dh
        mov     byte ptr ds:[bp+3], dl
        mov     byte ptr ds:[bp+4], ah
        mov     byte ptr ds:[bp+5], al
        mov     byte ptr ds:[bp+6], bl
        mov     byte ptr ds:[bp+7], ch
        mov     byte ptr ds:[bp+8], cl
        mov     byte ptr ds:[bp+9], bl
        mov     word ptr [xfer_off], di
        mov     word ptr [xfer_seg], es
        mov     ax, word ptr [blk_size]
        mul     cx
        mov     word ptr [xfer_len], ax
        call    L263
        else
        cmp     word ptr [blk_size], 200h
        je      L235
        jmp     L236
L235:
        mov     ax, word ptr [blk_size]
        mul     cx
        mov     word ptr [xfer_len], ax
        call    L263
        ret
L236:
        mov     word ptr [blk_left], cx
        mov     ax, dx
        mov     dx, bx
        mov     di, word ptr [blk_count]
        sub     si, si
        push    bp
        int     0b8h
        pop     bp
        mov     byte ptr ds:[bp+2], dh
        mov     byte ptr ds:[bp+3], dl
        mov     byte ptr ds:[bp+4], ah
        mov     byte ptr ds:[bp+5], al
        mov     byte ptr ds:[bp+7], 0
        mov     byte ptr ds:[bp+8], 1
        mov     bx, di
        les     di, [xfer_off]
        or      bx, bx
        je      L240
        call    L243
        jae     L237
        ret
L237:
        mov     ax, 200h
        mul     bx
        add     si, ax
L238:
        mov     cx, 100h
        rep movsw
        sub     word ptr [blk_left], 1
        jne     L239
        ret
L239:
        inc     bx
        cmp     bx, word ptr [blk_count]
        jne     L238
L240:
        call    L243
        jae     L241
        ret
L241:
        mov     cx, word ptr [blk_count]
        cmp     word ptr [blk_left], cx
        jae     L242
        mov     cx, word ptr [blk_left]
L242:
        sub     word ptr [blk_left], cx
        pushf
        mov     ch, cl
        mov     cl, 0
        rep movsw
        popf
        jne     L240
        ret
L243:
        pusha
        push    es
        mov     word ptr [xfer_off], sec_buf
        mov     word ptr [xfer_seg], ds
        mov     ax, word ptr [blk_size]
        mov     word ptr [xfer_len], ax
        call    L263
        pop     es
        popa
        mov     si, sec_buf
        jb      L244
        mov     bp, cdb+2
        add     byte ptr ds:[bp+3], 1
        adc     byte ptr ds:[bp+2], 0
        adc     byte ptr ds:[bp+1], 0
        adc     byte ptr ds:[bp], 0
        clc
        ret
L244:
        ret
L245:
        mov     byte ptr ds:[bp], 2ah
        mov     bl, 0
        mov     byte ptr ds:[bp+1], bl
        mov     byte ptr ds:[bp+2], dh
        mov     byte ptr ds:[bp+3], dl
        mov     byte ptr ds:[bp+4], ah
        mov     byte ptr ds:[bp+5], al
        mov     byte ptr ds:[bp+6], bl
        mov     byte ptr ds:[bp+7], ch
        mov     byte ptr ds:[bp+8], cl
        mov     byte ptr ds:[bp+9], bl
        mov     word ptr [xfer_off], di
        mov     word ptr [xfer_seg], es
        cmp     word ptr [blk_size], 200h
        jne     L246
        mov     ax, word ptr [blk_size]
        mul     cx
        mov     word ptr [xfer_len], ax
        call    L263
        ret
L246:
        mov     word ptr [blk_left], cx
        mov     di, word ptr [blk_count]
        sub     si, si
        push    bp
        int     0b8h
        pop     bp
        mov     byte ptr ds:[bp+2], dh
        mov     byte ptr ds:[bp+3], dl
        mov     byte ptr ds:[bp+4], ah
        mov     byte ptr ds:[bp+5], al
        mov     byte ptr ds:[bp+7], 0
        mov     byte ptr ds:[bp+8], 1
        mov     bx, di
        les     di, [xfer_off]
        or      bx, bx
        je      L249
        call    L257
        jae     L247
        ret
L247:
        mov     ax, 200h
        mul     bx
        add     si, ax
L248:
        call    L254
        sub     word ptr [blk_left], 1
        je      L251
        inc     bx
        cmp     bx, word ptr [blk_count]
        jne     L248
        call    L255
L249:
        mov     cx, word ptr [blk_count]
        cmp     word ptr [blk_left], cx
        jae     L252
        call    L257
        jae     L250
        ret
L250:
        call    L254
        sub     word ptr [blk_left], 1
        jne     L250
L251:
        call    L255
        sub     ax, ax
        ret
L252:
        sub     word ptr [blk_left], cx
        pushf
        mov     si, sec_buf
L253:
        call    L254
        loop    L253
        call    L255
        popf
        jne     L249
        sub     ax, ax
        ret
L254:
        push    es
        push    ds
        push    cx
        push    bx
        xchg    di, si
        mov     ax, ds
        mov     dx, es
        mov     ds, dx
        mov     es, ax
        mov     cx, 100h
        rep movsw
        xchg    di, si
        pop     bx
        pop     cx
        pop     ds
        pop     es
        ret
L255:
        pusha
        push    es
        mov     byte ptr [cdb], 2ah
        mov     word ptr [xfer_off], sec_buf
        mov     word ptr [xfer_seg], ds
        mov     ax, word ptr [blk_size]
        mov     word ptr [xfer_len], ax
        call    L263
        pop     es
        popa
        mov     si, sec_buf
        jb      L256
        mov     bp, cdb+2
        add     byte ptr ds:[bp+3], 1
        adc     byte ptr ds:[bp+2], 0
        adc     byte ptr ds:[bp+1], 0
        adc     byte ptr ds:[bp], 0
        clc
L256:
        ret
L257:
        pusha
        push    es
        mov     byte ptr [cdb], 28h
        mov     word ptr [xfer_off], sec_buf
        mov     word ptr [xfer_seg], ds
        mov     ax, word ptr [blk_size]
        mov     word ptr [xfer_len], ax
        call    L263
        pop     es
        popa
        mov     si, sec_buf
        endif
        ret
L258:
        mov     byte ptr ds:[bp], 0
        sub     ax, ax
        mov     byte ptr ds:[bp+1], al
        mov     byte ptr ds:[bp+2], al
        mov     byte ptr ds:[bp+3], al
        mov     byte ptr ds:[bp+4], al
        mov     byte ptr ds:[bp+5], al
        mov     word ptr [xfer_len], ax
        call    L263
        ret
L259:
        mov     byte ptr ds:[bp], 0
        sub     ax, ax
        mov     byte ptr ds:[bp+1], al
        mov     byte ptr ds:[bp+2], al
        mov     byte ptr ds:[bp+3], al
        mov     byte ptr ds:[bp+4], al
        mov     byte ptr ds:[bp+5], al
        mov     word ptr [xfer_len], ax
        mov     cx, 1f4h
        call    L264
        ret
L260:
        mov     al, byte ptr [spc_id]
        mov     byte ptr [spc_stat], al
        mov     byte ptr ds:[bp], 0
        sub     ax, ax
        mov     byte ptr ds:[bp+1], al
        mov     byte ptr ds:[bp+2], al
        mov     byte ptr ds:[bp+3], al
        mov     byte ptr ds:[bp+4], al
        mov     byte ptr ds:[bp+5], al
        mov     word ptr [xfer_len], ax
        mov     cx, 1f4h
        call    L264
        ret
L261:
        int     0b4h
        call    L230
        pushf
        int     8fh
        pop     es
        popf
        ret
L262:
        mov     bp, cdb
        mov     byte ptr ds:[bp], 15h
        mov     al, 0
        mov     byte ptr ds:[bp+1], 10h
        mov     byte ptr ds:[bp+2], al
        mov     byte ptr ds:[bp+3], al
        mov     byte ptr ds:[bp+4], 0ah
        mov     byte ptr ds:[bp+5], al
        mov     bp, dev_buf
        mov     byte ptr ds:[bp], al
        mov     byte ptr ds:[bp+1], al
        mov     byte ptr ds:[bp+2], al
        mov     byte ptr ds:[bp+3], al
        mov     byte ptr ds:[bp+4], 2fh
        mov     byte ptr ds:[bp+5], 4
        mov     byte ptr ds:[bp+6], 4
        mov     byte ptr ds:[bp+7], 1
        mov     byte ptr ds:[bp+8], 0
        mov     byte ptr ds:[bp+9], 5
        mov     word ptr [xfer_len], 0ah
        mov     word ptr [xfer_off], dev_buf
        mov     word ptr [xfer_seg], ds
        call    L263
        ret
L263:
        mov     cx, 3000h
L264:
        call    L275
        jae     L265
        ret
L265:
        call    L279
        jae     L266
        ret
L266:
        mov     bl, byte ptr [dev_type]
        and     bl, 3eh
        je      L267
        cmp     bl, 8
        je      L268
        cmp     bl, 18h
        je      L268
        cmp     bl, 2
        je      L269
L267:
        sub     ax, ax
        clc
        ret
L268:
        mov     al, 0fh
        stc
        ret
L269:
        mov     bp, cdb
        mov     byte ptr ds:[bp], 3
        sub     ax, ax
        mov     byte ptr ds:[bp+1], al
        mov     byte ptr ds:[bp+2], al
        mov     byte ptr ds:[bp+3], al
        mov     byte ptr ds:[bp+4], 12h
        mov     byte ptr ds:[bp+5], al
        mov     word ptr [xfer_len], 12h
        mov     di, dev_buf+014h
        mov     word ptr [xfer_off], di
        mov     word ptr [xfer_seg], ds
        mov     cx, 3000h
        call    L275
        jae     L270
        ret
L270:
        call    L279
        jae     L271
        ret
L271:
        and     byte ptr [dev_type], 3eh
        jne     L272
        mov     bl, byte ptr [dev_buf+016h]
        and     bl, 0fh
        cmp     bl, 5
        je      L274
        mov     al, 0fh
        cmp     bl, 2
        je      L273
; V1.01 adds device class 3, answering 35h.
        ifdef   BOOT_V101
        mov     al, 35h
        cmp     bl, 3
        je      L273
        endif
        mov     al, 1dh
        cmp     bl, 6
        je      L273
        mov     al, 1
        cmp     bl, 7
        je      L273
L272:
        mov     al, 0fh
L273:
        stc
        ret
L274:
        sub     ax, ax
        clc
        ret
L275:
        mov     dx, 8
        mov     al, 0ffh
        out     dx, al
        mov     dx, 2
        mov     al, 18h
        out     dx, al
        mov     dx, 10h
        mov     al, 0
        out     dx, al
        mov     al, byte ptr [spc_id]
        or      al, byte ptr [spc_stat]
        mov     dx, 16h
        out     dx, al
        mov     ax, cx
        mov     dx, 1ah
        out     dx, al
        mov     al, ah
        mov     dx, 18h
        out     dx, al
        mov     dx, 1ch
        mov     al, 4
        out     dx, al
        mov     dx, 4
        mov     al, 25h
        out     dx, al
        mov     ax, 2
        call    L323
L276:
        call    L325
        jb      L276
        mov     ax, 0bb8h
        call    L323
L277:
        call    L325
        jae     L278
        in      al, 8
        test    al, 1
        mov     cx, 3000h
        jne     L275
        test    al, 4
        jne     L278
        test    al, 10h
        je      L277
        sub     ax, ax
        ret
L278:
        call    L218
        mov     al, 0eh
        stc
        ret
L279:
        mov     byte ptr [dev_type], 0
        mov     byte ptr [msg_buf], 0
        mov     byte ptr [msg_idx], 0
L280:
        mov     ax, 7530h
        call    L323
L281:
        call    L325
        jae     L283
        push    dx
        mov     dx, 0ah
        in      al, dx
        pop     dx
        mov     ah, al
        and     ah, 88h
        jne     L282
        ret
L282:
        test    ah, 80h
        je      L281
        and     ax, 7
        shl     ax, 1
        mov     bx, ax
        call    word ptr cs:[bx+tbl_read_step-CSBASE]
        jae     L280
        mov     al, 11h
        stc
        ret
L283:
        mov     al, 11h
        stc
        ret
tbl_read_step:
        ifdef   BOOT_V101
        pop     es
        push    ds
        mov     bp, 821eh
        pop     ds
        neg     word ptr [bx]
        push    es
        push    ds
        push    es
        push    ds
        jge     L284
        xor     word ptr [bx+si], sp
        ret
        db      0bah, 10h, 00h, 0b0h, 00h, 0eeh, 8bh, 0eh, 0b2h, 00h, 0c4h, 36h, 0aeh, 00h, 8ah, 0c1h
        db      0bah, 1ch, 00h, 0eeh, 8ah, 0c5h, 0bah, 1ah, 00h, 0eeh, 0bah, 18h, 00h
L284:
        else
        db      0c6h
        pop     ds
        jl      L284
        inc     cx
        and     word ptr [bp-3adfh], si
        pop     ds
        lds     bx, [bx]
        cmp     al, 22h
        db      0f0h, 21h, 0c3h
        mov     dx, 10h
        mov     al, 0
        out     dx, al
        mov     cx, word ptr [xfer_len]
        les     si, [xfer_off]
        mov     al, cl
        mov     dx, 1ch
L284:
        out     dx, al
        mov     al, ch
        mov     dx, 1ah
        out     dx, al
        mov     dx, 18h
        endif
        mov     al, 0
        out     dx, al
        mov     dx, 8
        mov     al, 0ffh
        out     dx, al
        mov     dx, 4
        mov     al, 80h
        out     dx, al
        mov     dx, 0c030h
        mov     al, 1
        out     dx, al
        mov     dx, 0c038h
        mov     al, 10h
        out     dx, al
        mov     dx, 0c039h
        mov     al, 1
        out     dx, al
        mov     dx, 0c031h
        mov     al, 0
        out     dx, al
        push    dx
        mov     dx, 0c03fh
        in      al, dx
        pop     dx
        or      al, 1
        mov     dx, 0c03fh
        out     dx, al
        mov     ax, es
        push    cx
        mov     cx, 4
        sub     bl, bl
L285:
        shl     ax, 1
        rcl     bl, 1
        loop    L285
        pop     cx
        add     ax, si
        adc     bl, 0
        mov     dx, 0c034h
        out     dx, ax
        mov     al, bl
        int     8eh
        mov     dx, 0c036h
        out     dx, al
        mov     ax, cx
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
        and     al, 0feh
        mov     dx, 0c03fh
        out     dx, al
        mov     ax, 0bb8h
        call    L323
L286:
        call    L325
        jae     L287
        in      al, 8
        test    al, 10h
        je      L286
        mov     dx, 8
        mov     al, 10h
        out     dx, al
        mov     dx, 0c030h
        mov     al, 1
        out     dx, al
        clc
        ret
L287:
        mov     dx, 0c030h
        mov     al, 1
        out     dx, al
        stc
        ret
        mov     dx, 10h
        mov     al, 1
        out     dx, al
        mov     cx, word ptr [xfer_len]
        les     di, [xfer_off]
        or      cx, cx
        jne     L288
        jmp     L300
L288:
        mov     al, cl
        mov     dx, 1ch
        out     dx, al
        mov     al, ch
        mov     dx, 1ah
        out     dx, al
        mov     dx, 18h
        mov     al, 0
        out     dx, al
        mov     dx, 8
        mov     al, 0ffh
        out     dx, al
        mov     dx, 4
        mov     al, 81h
        out     dx, al
        mov     dx, 0c030h
        mov     al, 1
        out     dx, al
        mov     dx, 0c038h
        mov     al, 10h
        out     dx, al
        mov     dx, 0c039h
        mov     al, 1
        out     dx, al
        mov     dx, 0c031h
        mov     al, 0
        out     dx, al
        push    dx
        mov     dx, 0c03fh
        in      al, dx
        pop     dx
        or      al, 1
        mov     dx, 0c03fh
        out     dx, al
        mov     ax, es
        push    cx
        mov     cx, 4
        sub     bl, bl
L290:
        shl     ax, 1
        rcl     bl, 1
        loop    L290
        pop     cx
        add     ax, di
        adc     bl, 0
        mov     dx, 0c034h
        out     dx, ax
        mov     al, bl
        int     8eh
        mov     dx, 0c036h
        out     dx, al
        mov     ax, cx
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
        and     al, 0feh
        mov     dx, 0c03fh
        out     dx, al
        mov     ax, TMO_PHASE
        call    L323
L297:
        call    L325
        jae     L300
        in      al, 0ah
        and     al, 7
        cmp     al, 1
        jne     L299
        in      al, 8
        test    al, 10h
        je      L297
        mov     dx, 8
        mov     al, 10h
        out     dx, al
L299:
        mov     dx, 0c030h
        mov     al, 1
        out     dx, al
        clc
        ret
L300:
        mov     dx, 0c030h
        mov     al, 1
        out     dx, al
        stc
        ret
        mov     dx, 10h
        mov     al, 2
        out     dx, al
        mov     si, cdb
        mov     ah, byte ptr [si]
        shr     ah, 5
        mov     al, 6
        cmp     ah, 0
        je      L302
        mov     al, 0ah
        cmp     ah, 3
        jb      L302
        mov     al, 0ch
L302:
        mov     cl, al
        mov     ch, 0
        mov     dx, 1ch
        out     dx, al
        mov     dx, 1ah
        mov     al, 0
        out     dx, al
        mov     dx, 18h
        mov     al, 0
        out     dx, al
        mov     dx, 8
        mov     al, 0ffh
        out     dx, al
        mov     dx, 4
        mov     al, 84h
        out     dx, al
L303:
        mov     bx, 3e8h
L304:
        dec     bx
        je      L309
        in      al, 0ch
        test    al, 2
        jne     L304
        lodsb
        out     14h, al
        loop    L303
        sub     bx, bx
L305:
        dec     bx
        je      L309
        in      al, 0ch
        test    al, 4
        je      L305
        mov     ax, TMO_PHASE
        call    L323
L308:
        call    L325
        jae     L309
        in      al, 8
        test    al, 10h
        je      L308
        mov     dx, 8
        mov     al, 10h
        out     dx, al
        clc
        ret
L309:
        stc
        ret
        mov     dx, 10h
        mov     al, 3
        out     dx, al
        mov     dx, 8
        mov     al, 0ffh
        out     dx, al
        mov     dx, 4
        mov     al, 0e4h
        out     dx, al
        mov     ax, TMO_CMD
        call    L323
L312:
        call    L325
        jae     L317
        push    dx
        mov     dx, 0ah
        in      al, dx
        pop     dx
        test    al, 80h
        jne     L312
        push    dx
        mov     dx, 16h
        in      al, dx
        pop     dx
        mov     byte ptr [dev_type], al
        mov     dx, 4
        mov     al, 0c4h
        out     dx, al
        clc
        ret
L317:
        stc
        ret
        mov     dx, 10h
        mov     al, 7
        out     dx, al
        mov     dx, 8
        mov     al, 0ffh
        out     dx, al
        mov     dx, 4
        mov     al, 0e4h
        out     dx, al
        mov     ax, TMO_CMD
        call    L323
L319:
        call    L325
        jae     L321
        push    dx
        mov     dx, 0ah
        in      al, dx
        pop     dx
        test    al, 80h
        jne     L319
        push    dx
        mov     dx, 16h
        in      al, dx
        pop     dx
        mov     bl, byte ptr [msg_idx]
        mov     bh, 0
        mov     byte ptr [bx+msg_buf], al
        inc     bl
        cmp     bl, 0ah
        je      L320
        mov     byte ptr [msg_idx], bl
L320:
        mov     dx, 4
        mov     al, 0c4h
        out     dx, al
        clc
        ret
L321:
        stc
        ret
        db      0f9h, 0c3h
L323:
        mov     word ptr [tmo_span], ax
        int     77h
        mov     word ptr [tmo_mark], ax
        ret
L325:
        int     77h
        sub     ax, word ptr [tmo_mark]
        cmp     ax, word ptr [tmo_span]
        ret
; V1.01 keeps READ(10)/WRITE(10) here; in V1.00 they are inline above.
        ifdef   BOOT_V101
L289:
        mov     byte ptr [bp], 28h
        mov     bl, 0
        mov     byte ptr ds:[bp+1], bl
        mov     byte ptr ds:[bp+6], bl
        mov     byte ptr ds:[bp+9], bl
        mov     word ptr [xfer_off], di
        mov     word ptr [xfer_seg], es
        mov     word ptr [blk_left], cx
        mov     di, word ptr [blk_count]
        sub     si, si
        push    bp
        int     0b8h
        pop     bp
        mov     byte ptr ds:[bp+2], dh
        mov     byte ptr ds:[bp+3], dl
        mov     byte ptr ds:[bp+4], ah
        mov     byte ptr ds:[bp+5], al
        mov     byte ptr ds:[bp+7], 0
        mov     byte ptr ds:[bp+8], 1
        mov     bx, di
        les     di, [xfer_off]
        or      bx, bx
        je      L294
        call    L298
        jae     L291
        ret
L291:
        mov     ax, 200h
        mul     bx
        add     si, ax
L292:
        mov     cx, 100h
        rep movsw
        sub     word ptr [blk_left], 1
        jne     L293
        ret
L293:
        inc     bx
        cmp     bx, word ptr [blk_count]
        jne     L292
L294:
        call    L298
        jae     L295
        ret
L295:
        mov     cx, word ptr [blk_count]
        cmp     word ptr [blk_left], cx
        jae     L296
        mov     cx, word ptr [blk_left]
L296:
        sub     word ptr [blk_left], cx
        pushf
        mov     ch, cl
        mov     cl, 0
        rep movsw
        popf
        jne     L294
        ret
L298:                                ; one sector in, through the transport
        pusha
        push    es
        mov     word ptr [xfer_off], sec_buf
        mov     word ptr [xfer_seg], ds
        mov     ax, word ptr [blk_size]
        mov     word ptr [xfer_len], ax
        call    L263
        mov     byte ptr [xfer_stat], al ; kept, and returned in AX at L301
        pop     es
        popa
        mov     si, sec_buf
        jb      L301
        mov     bp, cdb+2
        add     byte ptr ds:[bp+3], 1
        adc     byte ptr ds:[bp+2], 0
        adc     byte ptr ds:[bp+1], 0
        adc     byte ptr ds:[bp], 0
        clc
        ret
L301:
        mov     al, byte ptr [xfer_stat]
        mov     ah, 0
        ret
        mov     word ptr [blk_left], cx
        mov     di, word ptr [blk_count]
        sub     si, si
        push    bp
        int     0b8h
        pop     bp
        mov     byte ptr ds:[bp+2], dh
        mov     byte ptr ds:[bp+3], dl
        mov     byte ptr ds:[bp+4], ah
        mov     byte ptr ds:[bp+5], al
        mov     byte ptr ds:[bp+7], 0
        mov     byte ptr ds:[bp+8], 1
        mov     bx, di
        les     di, [xfer_off]
        or      bx, bx
        je      L310
        call    L324
        jae     L306
        ret
L306:
        mov     ax, 200h
        mul     bx
        add     si, ax
L307:
        call    L316
        sub     word ptr [blk_left], 1
        je      L313
        inc     bx
        cmp     bx, word ptr [blk_count]
        jne     L307
        call    L318
L310:
        mov     cx, word ptr [blk_count]
        cmp     word ptr [blk_left], cx
        jae     L314
        call    L324
        jae     L311
        ret
L311:
        call    L316
        sub     word ptr [blk_left], 1
        jne     L311
L313:
        call    L318
        sub     ax, ax
        ret
L314:
        sub     word ptr [blk_left], cx
        pushf
        mov     si, sec_buf
L315:
        call    L316
        loop    L315
        call    L318
        popf
        jne     L310
        sub     ax, ax
        ret
L316:
        push    es
        push    ds
        push    cx
        push    bx
        xchg    di, si
        mov     ax, ds
        mov     dx, es
        mov     ds, dx
        mov     es, ax
        mov     cx, 100h
        rep movsw
        xchg    di, si
        pop     bx
        pop     cx
        pop     ds
        pop     es
        ret
L318:
        pusha
        push    es
        mov     byte ptr [cdb], 2ah
        mov     word ptr [xfer_off], sec_buf
        mov     word ptr [xfer_seg], ds
        mov     ax, word ptr [blk_size]
        mov     word ptr [xfer_len], ax
        call    L263
        pop     es
        popa
        mov     si, sec_buf
        jb      L322
        mov     bp, cdb+2
        add     byte ptr ds:[bp+3], 1
        adc     byte ptr ds:[bp+2], 0
        adc     byte ptr ds:[bp+1], 0
        adc     byte ptr ds:[bp], 0
        clc
L322:
        ret
L324:
        pusha
        push    es
        mov     byte ptr [cdb], 28h
        mov     word ptr [xfer_off], sec_buf
        mov     word ptr [xfer_seg], ds
        mov     ax, word ptr [blk_size]
        mov     word ptr [xfer_len], ax
        call    L263
        pop     es
        popa
        mov     si, sec_buf
        else
L326:
        ret
L327:
        endif
        ret
ata_service:
        sti
        push    ds
        push    es
        mov     bp, 356h
        mov     ds, bp
        and     bx, 0fh
        shl     bx, 1
        call    word ptr cs:[bx+tbl_ata_cmd-CSBASE]
        pop     es
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
tbl_ata_cmd:
        dw      L330-CSBASE, L328-CSBASE, L346-CSBASE, L347-CSBASE
        dw      L339-CSBASE, L340-CSBASE, L341-CSBASE, L348-CSBASE
        dw      L348-CSBASE, L329-CSBASE, L328-CSBASE, L328-CSBASE
        dw      L328-CSBASE, L328-CSBASE, L328-CSBASE, L328-CSBASE
L328:
        db      2bh                                                                     ; +
        db      0c0h, 0c3h
L329:
        db      0f9h
        ret
L330:
        mov     dx, 1eeh
        mov     ax, 8
        out     dx, ax
        call    L369
        jae     L331
        ret
L331:
        push    dx
        mov     dx, 1e8h
        in      ax, dx
        pop     dx
        mov     cx, ax
        push    dx
        mov     dx, 1eah
        in      ax, dx
        pop     dx
        mov     ch, al
        cmp     cx, 0eb14h
        mov     ax, 2ch
        stc
        je      L332
        ret
L332:
        mov     dx, 0ech
        mov     ax, 0
        out     dx, ax
        mov     byte ptr [ata_present], 0
        call    L369
        jae     L333
        ret
L333:
        mov     dx, 1ech
        mov     ax, 0a0h
        out     dx, ax
        mov     dx, 1eeh
        mov     ax, 0a1h
        out     dx, ax
        call    L369
        jae     L334
        ret
L334:
        mov     ax, 0e2a0h
        mov     es, ax
        mov     di, 0
        mov     cx, 100h
L335:
        call    L374
        jae     L336
        ret
L336:
        push    dx
        mov     dx, 1e0h
        in      ax, dx
        pop     dx
        stosw
        loop    L335
        mov     ax, word ptr es:[7eh]
        mov     byte ptr [ata_class], ah
        cmp     al, 0
        je      L337
        mov     byte ptr [ata_present], 1
        mov     dx, 1ech
        mov     ax, 0a0h
        out     dx, ax
        mov     dx, 1e2h
        mov     ax, 3
        out     dx, ax
        mov     dx, 1e4h
        mov     ax, 1
        out     dx, ax
        mov     dx, 1eeh
        mov     ax, 0efh
        out     dx, ax
        clc
        ret
L337:
        cmp     word ptr es:[88h], 0
        mov     ax, 2ch
        stc
        jne     L338
        ret
L338:
        mov     dx, 1ech
        mov     ax, 0a0h
        out     dx, ax
        mov     dx, 1e2h
        mov     ax, 3
        out     dx, ax
        mov     dx, 1e4h
        mov     ax, 1
        out     dx, ax
        mov     dx, 1eeh
        mov     ax, 0efh
        out     dx, ax
        clc
        ret
L339:
        mov     word ptr [ata_xfer_off], di
        mov     word ptr [ata_xfer_seg], dx
        mov     word ptr [ata_xfer_len], cx
        call    L368
        mov     byte ptr ds:[bp], 12h
        mov     byte ptr ds:[bp+4], cl
        call    L349
        ret
L340:
        mov     word ptr [ata_xfer_off], ata_buf
        mov     word ptr [ata_xfer_seg], ds
        mov     word ptr [ata_xfer_len], 8
        call    L368
        mov     byte ptr ds:[bp], 25h
        call    L349
        mov     bp, ata_buf
        mov     dh, byte ptr ds:[bp]
        mov     dl, byte ptr ds:[bp+1]
        mov     ah, byte ptr ds:[bp+2]
        mov     al, byte ptr ds:[bp+3]
        add     ax, 1
        adc     dx, 0
        mov     bh, byte ptr ds:[bp+4]
        mov     bl, byte ptr ds:[bp+5]
        mov     ch, byte ptr ds:[bp+6]
        mov     cl, byte ptr ds:[bp+7]
        ifdef   BOOT_V101
        clc
        endif
        ret
L341:
        call    L368
        mov     word ptr [ata_xfer_len], 0
        mov     byte ptr ds:[bp], 4
        call    L351
        jb      L342
        ret
L342:
        call    L369
        mov     bx, 14h
L343:
        push    dx
        mov     dx, 1e2h
        in      ax, dx
        pop     dx
        test    al, 4
        stc
        je      L344
        ret
L344:
        dec     bx
        stc
        mov     ax, 18h
        jne     L345
        ret
L345:
        push    bx
        call    L369
        pop     bx
        jmp     L343
L346:
        mov     word ptr [ata_xfer_off], di
        mov     word ptr [ata_xfer_seg], es
        call    L368
        mov     byte ptr ds:[bp], 28h
        mov     byte ptr ds:[bp+2], dh
        mov     byte ptr ds:[bp+3], dl
        mov     byte ptr ds:[bp+4], ah
        mov     byte ptr ds:[bp+5], al
        mov     byte ptr ds:[bp+7], ch
        mov     byte ptr ds:[bp+8], cl
        shl     cx, 9
        mov     word ptr [ata_xfer_len], cx
        call    L349
        ret
L347:
        mov     word ptr [ata_xfer_off], di
        mov     word ptr [ata_xfer_seg], es
        call    L368
        mov     byte ptr ds:[bp], 2ah
        mov     byte ptr ds:[bp+2], dh
        mov     byte ptr ds:[bp+3], dl
        mov     byte ptr ds:[bp+4], ah
        mov     byte ptr ds:[bp+5], al
        mov     byte ptr ds:[bp+7], ch
        mov     byte ptr ds:[bp+8], cl
        shl     cx, 9
        mov     word ptr [ata_xfer_len], cx
        call    L349
        ret
L348:
        call    L368
        mov     word ptr [ata_xfer_len], 0
        mov     byte ptr ds:[bp], 0
        call    L349
        ret
L349:
        call    L372
        call    L369
        jae     L350
        ret
L350:
        call    L360
        jae     L351
        ret
L351:
        mov     ah, 0
        mov     cx, word ptr [ata_xfer_len]
        mov     al, cl
        mov     dx, 1e8h
        out     dx, ax
        mov     al, ch
        mov     dx, 1eah
        out     dx, ax
        mov     dx, 1ech
        mov     ax, 0a0h
        out     dx, ax
        mov     dx, 1eeh
        mov     ax, 0a0h
        out     dx, ax
        shl     ax, 7
        mov     si, ata_id
        mov     cx, 6
        call    L369
        jae     L352
        ret
L352:
        call    L374
        jae     L353
        ret
L353:
        cli
L354:
        lodsw
        mov     dx, 1e0h
        out     dx, ax
        shl     ax, 3
        loop    L354
        sti
        call    L369
        jae     L355
        ret
L355:
        call    L360
        jae     L356
        ret
L356:
        push    dx
        mov     dx, 1eeh
        in      ax, dx
        pop     dx
        test    al, 8
        jne     L357
        ret
L357:
        push    dx
        mov     dx, 1e4h
        in      ax, dx
        pop     dx
        and     al, 3
        cmp     al, 0
        jne     L358
        jmp     L392
L358:
        cmp     al, 2
        jne     L359
        jmp     L377
L359:
        mov     al, 2eh
        stc
        ret
L360:
        push    dx
        mov     dx, 1eeh
        in      ax, dx
        pop     dx
        test    al, 1
        jne     L361
        ret
L361:
        push    dx
        mov     dx, 1e2h
        in      ax, dx
        pop     dx
        shr     al, 4
        cmp     al, 0
        jne     L362
        ret
L362:
        cmp     al, 2
        je      L363
        cmp     al, 3
        je      L364
        cmp     al, 4
        je      L365
        cmp     al, 6
        je      L366
        cmp     al, 7
        je      L367
        mov     al, 2eh
        stc
        ret
L363:
        mov     ax, 2fh
        stc
        ret
L364:
        mov     ax, 4
        stc
        ret
L365:
        mov     ax, 30h
        stc
        ret
L366:
        mov     ax, 1dh
        stc
        ret
L367:
        mov     ax, 1
        stc
        ret
L368:
        pusha
        mov     ax, ds
        mov     es, ax
        mov     di, ata_id
        mov     cx, 6
        mov     ax, 0
        rep stosw
        popa
        mov     bp, ata_id
        ret
L369:
        call    L411
        push    dx
        mov     dx, 0ech
        in      ax, dx
        pop     dx
L370:
        call    L412
        jae     L371
        ret
L371:
        push    dx
        mov     dx, 1eeh
        in      ax, dx
        pop     dx
        test    al, 80h
        jne     L370
        clc
        ret
L372:
        push    dx
        mov     dx, 1eeh
        in      ax, dx
        pop     dx
        test    al, 8
        jne     L373
        ret
L373:
        push    dx
        mov     dx, 1e2h
        in      ax, dx
        pop     dx
        mov     bx, ax
        push    dx
        mov     dx, 1e4h
        in      ax, dx
        pop     dx
        mov     cx, ax
        mov     dx, 1eeh
        mov     ax, 8
        out     dx, ax
        ret
L374:
        call    L411
        push    dx
        mov     dx, 0ech
        in      ax, dx
        pop     dx
L375:
        call    L412
        jae     L376
        ret
L376:
        push    dx
        mov     dx, 1eeh
        in      ax, dx
        pop     dx
        test    al, 8
        je      L375
        clc
        ret
L377:
        cmp     byte ptr [ata_present], 1
        je      L388
        mov     cx, word ptr [ata_xfer_len]
        shr     cx, 1
        les     di, [ata_xfer_off]
        cmp     cx, 100h
        jb      L383
L378:
        push    cx
        call    L380
        pop     cx
        jae     L379
        ret
L379:
        sub     cx, 100h
        jne     L378
        ret
L380:
        mov     bx, 0ffffh
L381:
        push    dx
        mov     dx, 1eeh
        in      ax, dx
        pop     dx
        and     al, 8
        jne     L382
        dec     bx
        jne     L381
        mov     ax, 9
        stc
        ret
L382:
        mov     dx, 1e0h
        mov     cx, 100h
        cli
        rep insw
        sti
        clc
        ret
L383:
        mov     si, 0ffffh
        mov     bl, 8
        cli
L384:
        mov     dx, 1eeh
        in      ax, dx
        and     al, bl
        je      L386
L385:
        mov     dx, 1e0h
        in      ax, dx
        stosw
        loop    L384
        clc
        ret
L386:
        mov     bp, si
L387:
        in      ax, dx
        and     al, bl
        jne     L385
        dec     bp
        jne     L387
        sti
        mov     ax, 9
        stc
        ret
L388:
        call    L374
        jae     L389
        ret
L389:
        mov     cx, word ptr [ata_xfer_len]
        shr     cx, 1
        les     di, [ata_xfer_off]
        call    L410
        mov     dx, 0c030h
        mov     al, 1
        out     dx, al
        mov     dx, 0c038h
        mov     al, 10h
        out     dx, al
        mov     dx, 0c039h
        mov     al, 1
        out     dx, al
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
        mov     ax, es
        push    cx
        mov     cx, 4
        sub     bl, bl
L390:
        shl     ax, 1
        rcl     bl, 1
        loop    L390
        pop     cx
        add     ax, di
        adc     bl, 0
        mov     dx, 0c034h
        out     dx, ax
        mov     al, bl
        int     8eh
        mov     dx, 0c036h
        out     dx, al
        mov     ax, cx
        dec     ax
        mov     dx, 0c032h
        out     dx, ax
        mov     dx, 0c03ah
        mov     al, 5
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
        call    L407
        jb      L391
        ret
L391:
        mov     ax, 9
        stc
        ret
L392:
        cmp     byte ptr [ata_present], 1
        je      L403
        call    L374
        jae     L393
        ret
L393:
        mov     cx, word ptr [ata_xfer_len]
        shr     cx, 1
        les     si, [ata_xfer_off]
        mov     bp, es
        cmp     cx, 100h
        jb      L399
L394:
        push    cx
        call    L396
        pop     cx
        jae     L395
        ret
L395:
        sub     cx, 100h
        jne     L394
        ret
L396:
        mov     bx, 0ffffh
L397:
        push    dx
        mov     dx, 1eeh
        in      ax, dx
        pop     dx
        and     al, 8
        jne     L398
        dec     bx
        jne     L397
        mov     ax, 5
        stc
        ret
L398:
        mov     dx, 1e0h
        mov     cx, 100h
        push    ds
        mov     ds, bp
        cli
        rep outsw
        sti
        pop     ds
        clc
        ret
L399:
        mov     dx, 1e0h
L400:
        mov     bx, 0ffffh
L401:
        push    dx
        mov     dx, 1eeh
        in      ax, dx
        pop     dx
        test    al, 8
        je      L402
        mov     ax, word ptr es:[si]
        add     si, 2
        mov     dx, 1e0h
        out     dx, ax
        loop    L400
        call    L369
        clc
        ret
L402:
        shl     ax, 8
        dec     bx
        jne     L401
        sti
        mov     ax, 5
        stc
        ret
L403:
        call    L374
        jae     L404
        ret
L404:
        mov     cx, word ptr [ata_xfer_len]
        shr     cx, 1
        les     si, [ata_xfer_off]
        call    L410
        mov     dx, 0c030h
        mov     al, 1
        out     dx, al
        mov     dx, 0c038h
        mov     al, 10h
        out     dx, al
        mov     dx, 0c039h
        mov     al, 1
        out     dx, al
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
        mov     ax, es
        push    cx
        mov     cx, 4
        sub     bl, bl
L405:
        shl     ax, 1
        rcl     bl, 1
        loop    L405
        pop     cx
        add     ax, si
        adc     bl, 0
        mov     dx, 0c034h
        out     dx, ax
        mov     al, bl
        int     8eh
        mov     dx, 0c036h
        out     dx, al
        mov     ax, cx
        dec     ax
        mov     dx, 0c032h
        out     dx, ax
        mov     dx, 0c03ah
        mov     al, 9
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
        call    L407
        jb      L406
        ret
L406:
        mov     al, 5
        ret
L407:
        call    L411
L408:
        call    L412
        jae     L409
        ret
L409:
        mov     al, 1
        int     92h
        cmp     al, 0
        je      L408
        clc
        ret
L410:
        push    es
        pusha
        mov     al, 0
        int     92h
        popa
        pop     es
        ret
L411:
        int     77h
        mov     word ptr [ata_mark], ax
        ret
L412:
        int     77h
        sub     ax, word ptr [ata_mark]
        cmp     ax, 0bb8h
        cmc
        mov     ax, 2dh
        ret
        ifndef  BOOT_V101
        db      00h
        endif
L413:
        sti
        push    ds
        mov     bp, 4000h
        mov     ds, bp
        mov     bh, byte ptr [wk_b_0e804]
        mov     bp, tbl_fdc_cmd-CSBASE
        sub     bh, bh
        shl     bx, 1
        add     bx, bp
        mov     word ptr [wk_w_0e800], sp
        call    word ptr cs:[bx]
L414:
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
L415:
        cli
        mov     sp, word ptr [wk_w_0e800]
        stc
        jmp     L414
tbl_fdc_cmd:
        dw      L416-CSBASE, L418-CSBASE, L416-CSBASE, L454-CSBASE
        dw      L472-CSBASE, L474-CSBASE, L477-CSBASE, L416-CSBASE
        dw      L416-CSBASE, L416-CSBASE, L417-CSBASE, L416-CSBASE
        dw      L416-CSBASE, L416-CSBASE, L466-CSBASE, L416-CSBASE
        dw      L416-CSBASE, L491-CSBASE, L416-CSBASE, L416-CSBASE
        dw      L416-CSBASE, L416-CSBASE, L457-CSBASE, L416-CSBASE
        dw      L416-CSBASE, L416-CSBASE, L416-CSBASE, L416-CSBASE
        dw      L416-CSBASE, L416-CSBASE, L416-CSBASE, L416-CSBASE
        db      0b8h, 01h, 00h
        clc
        ret
L416:
        sub     bx, bp
        shr     bx, 1
        mov     ax, 23h
        stc
L417:
        ret
L418:
        call    L419
        push    ds
        pop     es
        mov     si, 0e806h
        mov     di, word ptr [wk_w_0e888]
        ret
L419:
        mov     ax, ds
        mov     es, ax
        mov     di, 0e800h
        mov     cx, 36ch
        sub     ax, ax
        rep stosw
        mov     byte ptr [wk_b_0e804], 0
        mov     bl, 8
        int     93h
        mov     dx, ds
        mov     di, 0e806h
        mov     cx, 2ch
        mov     cx, 24h
        mov     bl, 4
        int     93h
        jae     L420
        jmp     L430
L420:
        mov     ah, byte ptr [wk_b_0e806]
        cmp     ah, 0
        mov     al, 5
        je      L421
        cmp     ah, 5
        mov     al, 6
        je      L421
        cmp     ah, 7
        mov     al, 7
        je      L421
        jmp     L431
L421:
        mov     byte ptr [wk_b_0e867], al
        mov     bl, 5
        int     93h
        jae     L422
        jmp     L431
L422:
        mov     word ptr [wk_w_0e87c], ax
        mov     word ptr [wk_w_0e87e], dx
        mov     bx, 7a1h
        div     bx
        mov     word ptr [wk_w_0e888], ax
        mov     word ptr [wk_w_0e884], 0
        mov     word ptr [wk_w_0e886], 0
        sub     ax, ax
        sub     dx, dx
        mov     cx, 1
        mov     di, 8000h
        call    L489
        cmp     word ptr [wk_w_081fe], 0aa55h
        je      L423
        jmp     L447
L423:
        call    L432
        cmp     ah, 0bh
        jne     L424
        ret
L424:
        cmp     ah, 0ch
        jne     L425
        ret
L425:
        cmp     ah, 0ah
        jne     L426
        ret
L426:
        mov     si, 81beh
        call    L429
        jne     L427
        add     si, 10h
        call    L429
        jne     L427
        add     si, 10h
        call    L429
        jne     L427
        add     si, 10h
        call    L429
        jne     L427
        ret
L427:
        mov     word ptr [wk_w_0e884], ax
        mov     word ptr [wk_w_0e886], dx
        sub     ax, ax
        sub     dx, dx
        mov     cx, 1
        mov     di, 8000h
        call    L489
        call    L432
        cmp     ah, 0ch
        jne     L428
        ret
L428:
        sub     ax, ax
        mov     word ptr [wk_w_0e884], ax
        mov     word ptr [wk_w_0e886], dx
        call    L431
        sub     dx, dx
        sub     bx, bx
        ret
L429:
        mov     ax, word ptr [si+8]
        mov     dx, word ptr [si+0ah]
        mov     bx, ax
        or      bx, dx
        ret
L430:
        mov     byte ptr [0], 0
        mov     byte ptr [wk_b_0d800], 0
        mov     al, 4
        mov     ah, 0
        sub     dx, dx
        sub     cx, cx
        sub     bx, bx
        ret
L431:
        mov     al, 4
        mov     ah, 1
        sub     dx, dx
        sub     cx, cx
        sub     bx, bx
        ret
L432:
        cmp     byte ptr [wk_tbl_08000], 0ebh
        je      L433
        cmp     byte ptr [wk_tbl_08000], 0e9h
        je      L433
        jmp     L447
L433:
        mov     si, 8036h
        call    L498
        inc     si
        inc     cx
        push    sp
        xor     word ptr [bp+si], si
        add     byte ptr [si+wk_tbl_0720c], dh
        add     bp, cx
        db      63h
        db      01h, 0e8h
        xor     byte ptr [si], al
        inc     si
        inc     cx
        push    sp
        xor     word ptr [wk_w_0b400], si
        adc     byte ptr [bp+di+11h], dh
        cmp     byte ptr [wk_b_081c2], 4
        je      L434
        cmp     word ptr [wk_w_08013], 0
        je      L434
        jmp     L447
L434:
        mov     byte ptr [wk_b_0e866], ah
        cmp     word ptr [wk_w_0800b], 200h
        je      L435
        jmp     L447
L435:
        mov     bl, byte ptr [wk_b_08010]
        cmp     bl, 2
        je      L436
        jmp     L447
L436:
        mov     ax, word ptr [wk_w_0800e]
        mov     word ptr [wk_w_0e890], ax
        mov     cx, word ptr [wk_w_08016]
        mov     word ptr [wk_w_0e894], cx
        add     ax, cx
        mov     word ptr [wk_w_0e892], ax
        add     ax, cx
        mov     word ptr [wk_w_0eeac], ax
        mov     word ptr [wk_w_0eeae], 0
        mov     ax, word ptr [wk_w_08011]
        cmp     ax, 401h
        jb      L437
        mov     ax, 400h
L437:
        mov     word ptr [wk_w_0eeb0], ax
        mov     ax, word ptr [wk_w_08011]
        mov     dx, 20h
        mul     dx
        mov     bx, 200h
        div     bx
        or      dx, dx
        je      L438
        inc     ax
L438:
        add     ax, word ptr [wk_w_0eeac]
        mov     word ptr [wk_w_0e896], ax
        mov     di, ax
        mov     al, byte ptr [wk_b_0800d]
        or      al, al
        jne     L439
        jmp     L447
L439:
        cmp     al, 21h
        jb      L440
        jmp     L447
L440:
        sub     ah, ah
        mov     word ptr [wk_w_0e88e], ax
        mov     bx, 200h
        mul     bx
        mov     word ptr [wk_w_0e88a], ax
        sub     dx, dx
        mov     ax, word ptr [wk_w_08013]
        or      ax, ax
        jne     L441
        mov     ax, word ptr [wk_w_08020]
        mov     dx, word ptr [wk_w_08022]
L441:
        sub     ax, di
        sbb     dx, 0
        mov     bx, word ptr [wk_w_0e88e]
        cmp     dx, bx
        jb      L442
        jmp     L447
L442:
        div     bx
        mov     word ptr [wk_w_0e88c], ax
        mov     ax, 0
        call    L487
        cmp     byte ptr [wk_b_0e866], 0ch
        jne     L443
        mov     ax, word ptr [wk_w_0e890]
        sub     dx, dx
        mov     cx, word ptr [wk_w_0e894]
        mov     di, 0c000h
        call    L489
L443:
        mov     ax, 0
        call    L487
        mov     ax, word ptr [wk_w_0eeac]
        mov     dx, word ptr [wk_w_0eeae]
        mov     word ptr [wk_w_0eca0], ax
        mov     word ptr [wk_w_0eca2], dx
        mov     cx, word ptr [wk_w_0eeb0]
        mov     word ptr [wk_w_0eca4], cx
        shr     cx, 4
        mov     di, 0
        call    L489
        mov     si, 8003h
        call    L498
        dec     bp
        push    ax
        inc     bx
        xor     cl, byte ptr [bp+di+58h]
        dec     sp
        add     byte ptr [bp+si+6], dh
        call    L444
        mov     ah, 0bh
        ret
        mov     si, 8003h
        call    L498
        dec     bp
        push    ax
        inc     bx
        xor     dh, byte ptr [bx+si]
        xor     byte ptr [bx+si], dh
        add     byte ptr [bp+si+7], dh
        call    L444
        mov     ah, 0ah
        clc
        ret
        call    L448
        mov     cx, ax
        mov     al, byte ptr [wk_b_0e867]
        mov     ah, 0ch
        sub     dx, dx
        sub     bx, bx
        ret
L444:
        mov     si, 8044h
        mov     cx, 1ah
        mov     dh, 0ffh
L445:
        inc     dh
        lodsw
        mov     bx, ax
        lodsw
        or      ax, bx
        je      L446
        loop    L445
L446:
        mov     dl, 0
        push    dx
        call    L448
        mov     cx, ax
        pop     dx
        mov     al, byte ptr [wk_b_0e867]
        sub     bx, bx
        ret
L447:
        mov     ah, 1
        ret
L448:
        mov     ax, 0ea60h
        ret
        mov     ax, ds
        mov     es, ax
        mov     di, 0
        mov     si, 0
L449:
        call    L464
        jb      L450
        mov     cx, 10h
        rep movsw
        jmp     L449
L450:
        cmp     al, 0
        je      L451
        add     si, 20h
        jmp     L449
L451:
        mov     cx, 8000h
        sub     cx, di
        jne     L452
        ret
L452:
        jae     L453
        ret
L453:
        shr     cx, 1
        sub     ax, ax
        rep stosw
        ret
L454:
        cmp     ax, word ptr [wk_w_0eca4]
        jae     L456
        mov     si, ax
        shl     si, 5
        db      81h, 0c6h, 00h, 00h
        cmp     byte ptr [si], 0
        je      L456
        push    ax
        call    L464
        pop     ax
        jae     L455
        inc     ax
        jmp     L454
L455:
        push    ax
        mov     word ptr [wk_w_0ecaa], si
        call    L493
        pop     ax
        clc
        ret
L456:
        push    ax
        mov     si, 0e868h
        mov     di, si
        mov     ax, ds
        mov     es, ax
        mov     cx, 14h
        mov     al, 20h
        rep stosb
        sub     bx, bx
        sub     dx, dx
        pop     ax
        stc
        ret
L457:
        cmp     ax, word ptr [wk_w_0eca4]
        jae     L459
L458:
        push    ax
        shl     ax, 5
        add     ax, 0
        mov     si, ax
        call    L464
        pop     ax
        jae     L455
        cmp     ax, 0
        je      L456
        dec     ax
        jmp     L458
L459:
        mov     ax, word ptr [wk_w_0eca4]
        jmp     L456
        mov     cx, word ptr [wk_w_0eca4]
        mov     di, 0
L460:
        mov     al, byte ptr [di]
        cmp     al, 0
        jne     L461
        ret
L461:
        cmp     al, 5
        jne     L462
        ret
L462:
        cmp     al, 0e5h
        jne     L463
        ret
L463:
        add     di, 20h
        loop    L460
        stc
        ret
L464:
        mov     al, byte ptr [si]
        cmp     al, 0
        je      L465
        test    byte ptr [si+0bh], 10h
        jne     L465
        cmp     al, 0e5h
        je      L465
        cmp     al, 5
        je      L465
        test    byte ptr [si+0bh], 0eh
        jne     L465
        clc
        ret
L465:
        stc
        ret
L466:
        call    L467
        ret
L467:
        mov     dx, 0ffffh
        mov     bp, si
L468:
        inc     dx
        push    es
        push    bp
        push    dx
        mov     ax, dx
        call    L454
        pop     dx
        pop     bp
        pop     es
        mov     ax, 8
        jae     L469
        ret
L469:
        mov     cx, 14h
        mov     si, bp
        mov     di, 0e868h
L470:
        mov     al, byte ptr es:[si]
        cmp     al, 61h
        jb      L471
        cmp     al, 7bh
        jae     L471
        sub     al, 20h
L471:
        cmp     al, byte ptr [di]
        jne     L468
        inc     si
        inc     di
        loop    L470
        sub     ax, ax
        clc
        ret
L472:
        call    L467
        jae     L473
        ret
L473:
        mov     si, word ptr [wk_w_0ecaa]
        mov     ax, word ptr [si+1ah]
        mov     word ptr [wk_w_0eeba], ax
        mov     word ptr [wk_w_0eebc], 0
        mov     bx, word ptr [si+1ch]
        mov     dx, word ptr [si+1eh]
        mov     word ptr [wk_w_0eeb6], bx
        mov     word ptr [wk_w_0eeb8], dx
        push    ds
        pop     es
        sub     ax, ax
        clc
        ret
L474:
        mov     ax, word ptr [wk_w_0eeb6]
        or      ax, word ptr [wk_w_0eeb8]
        je      L476
        sub     word ptr [wk_w_0eeb6], 1
        sbb     word ptr [wk_w_0eeb8], 0
        cmp     word ptr [wk_w_0eebc], 0
        jne     L475
        call    L482
L475:
        mov     si, word ptr [wk_w_0eebe]
        mov     al, byte ptr [si]
        inc     word ptr [wk_w_0eebe]
        dec     word ptr [wk_w_0eebc]
        mov     ah, 0
        clc
        ret
L476:
        stc
        ret
L477:
        mov     ax, word ptr [wk_w_0eeb6]
        or      ax, word ptr [wk_w_0eeb8]
        jne     L478
        ret
L478:
        sub     word ptr [wk_w_0eeb6], cx
        sbb     word ptr [wk_w_0eeb8], 0
        jae     L479
        add     cx, word ptr [wk_w_0eeb6]
        mov     word ptr [wk_w_0eeb6], 0
        mov     word ptr [wk_w_0eeb8], 0
L479:
        push    cx
        call    L480
        pop     ax
        sub     ax, cx
        clc
        ret
L480:
        cmp     cx, word ptr [wk_w_0eebc]
        jbe     L481
        sub     cx, word ptr [wk_w_0eebc]
        push    cx
        mov     cx, word ptr [wk_w_0eebc]
        mov     word ptr [wk_w_0eebc], 0
        mov     si, word ptr [wk_w_0eebe]
        rep movsb
        push    di
        push    es
        call    L482
        pop     es
        pop     di
        pop     cx
        cmp     word ptr [wk_w_0eebc], 0
        jne     L480
        ret
L481:
        sub     word ptr [wk_w_0eebc], cx
        mov     si, word ptr [wk_w_0eebe]
        rep movsb
        mov     word ptr [wk_w_0eebe], si
        ret
L482:
        mov     ax, word ptr [wk_w_0eeba]
        cmp     ax, 0ffffh
        jne     L483
        ret
L483:
        call    L488
        mov     cx, word ptr [wk_w_0e88e]
        mov     di, 8000h
        mov     word ptr [wk_w_0eebe], di
        call    L489
        mov     ax, word ptr [wk_w_0e88a]
        mov     word ptr [wk_w_0eebc], ax
        call    L484
        ret
L484:
        mov     ax, word ptr [wk_w_0eeba]
        cmp     ah, byte ptr [wk_b_0e89d]
        je      L485
        call    L487
L485:
        sub     ah, ah
        shl     ax, 1
        add     ax, 0e8a0h
        mov     si, ax
        mov     ax, word ptr [si]
        cmp     ax, 0fff8h
        jb      L486
        mov     ax, 0ffffh
L486:
        mov     word ptr [wk_w_0eeba], ax
        ret
L487:
        push    ax
        mov     byte ptr [wk_b_0e89d], ah
        mov     al, ah
        sub     ah, ah
        add     ax, word ptr [wk_w_0e890]
        sub     dx, dx
        mov     cx, 2
        mov     di, 0e8a0h
        call    L489
        pop     ax
        ret
L488:
        sub     ax, 2
        mov     bx, word ptr [wk_w_0e88e]
        mul     bx
        add     ax, word ptr [wk_w_0e896]
        adc     dx, 0
        ret
L489:
        pusha
        add     ax, word ptr [wk_w_0e884]
        adc     dx, word ptr [wk_w_0e886]
        mov     bx, ds
        mov     es, bx
        mov     bl, 2
        int     93h
        popa
        jae     L490
        jmp     L415
L490:
        ret
L491:
        mov     bl, 7
        int     93h
        jae     L492
        cmp     al, 0
        je      L492
        cmp     al, 1
        je      L492
        stc
        ret
L492:
        clc
        ret
L493:
        mov     di, 0e868h
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
        call    L495
        jb      L494
        mov     cx, 8
        rep movsb
L494:
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
L495:
        push    si
        push    cx
        mov     cx, 8
L496:
        cmp     byte ptr [si], 20h
        jb      L497
        cmp     byte ptr [si], 7bh
        jae     L497
        inc     si
        loop    L496
        pop     cx
        pop     si
        clc
        ret
L497:
        pop     cx
        pop     si
        stc
        ret
L498:
        pop     bp
        mov     dx, si
L499:
        mov     al, byte ptr cs:[bp]
        inc     bp
        or      al, al
        je      L501
        mov     ah, byte ptr [si]
        inc     si
        cmp     ah, al
        je      L499
L500:
        mov     al, byte ptr cs:[bp]
        inc     bp
        or      al, al
        jne     L500
        mov     si, dx
        stc
        jmp     bp
L501:
        mov     si, dx
        clc
        jmp     bp
text_service:
        sti
        push    ds
        mov     bp, 356h
        mov     ds, bp
        mov     bp, sp
        mov     es, word ptr [bp+4]
        mov     bp, word ptr [bp+2]
        mov     bl, byte ptr es:[bp]
        and     bx, 1fh
        shl     bx, 1
        inc     bp
        call    word ptr cs:[bx+tbl_lcd_op-CSBASE]
        mov     ax, bp
        mov     bp, sp
        mov     word ptr [bp+2], ax
        pop     ds
        iret
tbl_lcd_op:
        dw      lcd_controller_init-CSBASE, L515-CSBASE, L523-CSBASE, L502-CSBASE
        dw      L524-CSBASE, L526-CSBASE, L502-CSBASE, L502-CSBASE
        dw      L502-CSBASE, L502-CSBASE, L502-CSBASE, L536-CSBASE
        dw      L539-CSBASE, L502-CSBASE, L502-CSBASE, L502-CSBASE
        dw      L502-CSBASE, L502-CSBASE, L502-CSBASE, L502-CSBASE
        dw      L502-CSBASE, L502-CSBASE, L502-CSBASE, L502-CSBASE
        dw      L502-CSBASE, L502-CSBASE, L502-CSBASE, L502-CSBASE
        dw      L502-CSBASE, L502-CSBASE, L502-CSBASE, L502-CSBASE
glyph_service:
        sti
        pusha
        push    es
        push    ds
        and     bl, 1fh
        mov     bp, 356h
        mov     ds, bp
        and     bx, 1fh
        shl     bx, 1
        call    word ptr cs:[bx+tbl_lcd_style-CSBASE]
        pop     ds
        pop     es
        popa
        iret
tbl_lcd_style:
        dw      lcd_controller_init-CSBASE, L515-CSBASE, L523-CSBASE, L502-CSBASE
        dw      L525-CSBASE, L527-CSBASE, L502-CSBASE, L502-CSBASE
        dw      L502-CSBASE, L502-CSBASE, L502-CSBASE, L537-CSBASE
        dw      L540-CSBASE, L502-CSBASE, L502-CSBASE, L502-CSBASE
        dw      L502-CSBASE, L502-CSBASE, L502-CSBASE, L502-CSBASE
        dw      L502-CSBASE, L502-CSBASE, L502-CSBASE, L502-CSBASE
        dw      L502-CSBASE, L502-CSBASE, L502-CSBASE, L502-CSBASE
        dw      L502-CSBASE, L502-CSBASE, L502-CSBASE, L502-CSBASE
L502:
        db      0c3h
lcd_controller_init:
        mov     al, 23h
        call    io_out_port_60
        mov     al, 85h
        call    io_wait_port_60
        call    io_out_port_62
        mov     al, 24h
        call    io_out_port_60
        mov     al, 1
        call    io_wait_port_60
        call    io_out_port_62
        mov     al, 23h
        call    io_out_port_100
        mov     al, 8dh
        call    io_wait_port_100
        call    io_out_port_102
        mov     al, 24h
        call    io_out_port_100
        mov     al, 1
        call    io_wait_port_100
        call    io_out_port_102
        call    L513
        mov     bl, 0
L504:
        mov     al, 22h
        call    io_out_port_60
        mov     al, bl
        call    io_wait_port_60
        call    io_out_port_62
        mov     al, 21h
        call    io_out_port_60
        mov     al, 0
        call    io_wait_port_60
        call    io_out_port_62
        mov     al, 20h
        call    io_out_port_60
        mov     cx, 14h
L505:
        mov     al, 0
        call    io_wait_port_60
        call    io_out_port_62
        loop    L505
        inc     bl
        cmp     bl, 41h
        jne     L504
        call    L513
        mov     bl, 0
L506:
        mov     al, 22h
        call    io_out_port_100
        mov     al, bl
        call    io_wait_port_100
        call    io_out_port_102
        mov     al, 21h
        call    io_out_port_100
        mov     al, 0
        call    io_wait_port_100
        call    io_out_port_102
        mov     al, 20h
        call    io_out_port_100
        mov     cx, 14h
L507:
        mov     al, 0
        call    io_wait_port_100
        call    io_out_port_102
        loop    L507
        inc     bl
        cmp     bl, 41h
        jne     L506
        call    L513
        mov     cx, 0
        mov     bl, 64h
L508:
        push    cx
        push    bx
        mov     al, 22h
        call    io_out_port_100
        mov     al, cl
        call    io_wait_port_100
        call    io_out_port_102
        mov     al, 21h
        call    io_out_port_100
        mov     al, bl
        sub     ah, ah
        mov     cl, 8
        div     cl
        mov     bl, ah
        sub     bh, bh
        call    io_wait_port_100
        call    io_out_port_102
        mov     al, 20h
        call    io_out_port_100
        mov     al, byte ptr [bx+lcd_style]
        call    io_wait_port_100
        call    io_out_port_102
        pop     bx
        pop     cx
        inc     bl
        inc     cl
        cmp     cl, 3ch
        jne     L508
        mov     al, 23h
        call    io_out_port_60
        mov     al, 5
        call    io_wait_port_60
        call    io_out_port_62
        mov     al, 24h
        call    io_out_port_60
        mov     al, 1
        call    io_wait_port_60
        call    io_out_port_62
        mov     al, 23h
        call    io_out_port_100
        mov     al, 2dh
        call    io_wait_port_100
        call    io_out_port_102
        mov     al, 24h
        call    io_out_port_100
        mov     al, 1
        call    io_wait_port_100
        call    io_out_port_102
        call    L513
        call    L523
        ret
io_out_port_60:                         ; left LCD controller, command
        mov     dx, 60h
        out     dx, al
        ret
io_out_port_62:                         ; left LCD controller, data
        mov     dx, 62h
        out     dx, al
        ret
io_wait_port_60:                        ; poll the left controller busy bit
        push    ax
        push    cx
        mov     cx, 0ffffh
L509:
        mov     dx, 60h
        in      al, dx
        test    al, 80h
        je      L510
        loop    L509
L510:
        pop     cx
        pop     ax
        ret
io_out_port_100:                        ; right LCD controller, command
        mov     dx, 100h
        out     dx, al
        ret
io_out_port_102:                        ; right LCD controller, data
        mov     dx, 102h
        out     dx, al
        ret
io_wait_port_100:                       ; poll the right controller busy bit
        push    ax
        push    cx
        mov     cx, 0ffffh
L511:
        mov     dx, 100h
        in      al, dx
        test    al, 80h
        je      L512
        loop    L511
L512:
        pop     cx
        pop     ax
        ret
L513:
        push    cx
        mov     cx, 2710h
L514:
        dec     cx
        jne     L514
        pop     cx
        ret
L515:
        mov     si, lcd_fb
        sub     bx, bx
        mov     cx, 3ch
L516:
        call    L517
        inc     bl
        cmp     bl, 20h
        jne     L516
        ret
L517:
        cmp     bl, 14h
        jae     L520
        push    bx
        push    cx
        mov     al, 22h
        call    io_out_port_60
        mov     al, 0
        call    io_wait_port_60
        call    io_out_port_62
        mov     al, 21h
        call    io_out_port_60
        mov     al, bl
        call    io_wait_port_60
        call    io_out_port_62
        mov     al, 20h
        call    io_out_port_60
        sub     bh, bh
L518:
        mov     ah, byte ptr [bx+si]
        mov     dx, 60h
        in      al, dx
        shl     al, 1
        je      L519
        call    io_wait_port_60
L519:
        mov     al, ah
        mov     dx, 62h
        out     dx, al
        add     bx, 20h
        loop    L518
        pop     cx
        pop     bx
        ret
L520:
        push    bx
        push    cx
        mov     al, 22h
        call    io_out_port_100
        mov     al, 0
        call    io_wait_port_100
        call    io_out_port_102
        mov     al, 21h
        call    io_out_port_100
        mov     al, bl
        sub     al, 14h
        call    io_wait_port_100
        call    io_out_port_102
        mov     al, 20h
        call    io_out_port_100
        sub     bh, bh
L521:
        mov     ah, byte ptr [bx+si]
        mov     dx, 100h
        in      al, dx
        shl     al, 1
        je      L522
        call    io_wait_port_100
L522:
        mov     al, ah
        mov     dx, 102h
        out     dx, al
        add     bx, 20h
        loop    L521
        pop     cx
        pop     bx
        ret
L523:
        mov     di, lcd_fb
        mov     word ptr [lcd_pen], di
        mov     ax, ds
        mov     es, ax
        mov     cx, 3c0h
        sub     ax, ax
        mov     ax, 0
        rep stosw
        ret
L524:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        add     bp, 2
L525:
        call    L541
        call    word ptr [lcd_glyph]
        ret
L526:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     ah, 50h
        mov     dx, es
        add     bp, 2
        mov     si, bp
        call    L527
        mov     bp, si
        ret
L527:
        call    L541
        mov     es, dx
L528:
        mov     al, byte ptr es:[si]
        inc     si
        or      al, al
        jne     L529
        ret
L529:
        call    word ptr [lcd_glyph]
        dec     ah
        jne     L530
        ret
L530:
        jmp     L528
L531:
        or      al, al
        jns     L532
        mov     al, 2ah
L532:
        mov     ch, 7
        push    ax
        push    si
        push    cx
        push    di
        mul     ch
        mov     si, glyphs-CSBASE
        add     si, ax
        mov     bl, cl
        sub     bh, bh
        shl     bx, 1
        mov     dx, word ptr cs:[bx+tbl_lcd_col-CSBASE]
L533:
        mov     ah, byte ptr [di]
        mov     al, byte ptr [di+1]
        and     ax, dx
        mov     bh, byte ptr cs:[si]
        sub     bl, bl
        shr     bx, cl
        or      ax, bx
        mov     byte ptr [di], ah
        mov     byte ptr [di+1], al
        inc     si
        add     di, 20h
        dec     ch
        jne     L533
        pop     di
        pop     cx
        pop     si
        pop     ax
        add     cl, 3
        cmp     al, 5eh
        je      L534
        add     cl, 3
L534:
        cmp     cl, 8
        jb      L535
        sub     cl, 8
        inc     di
L535:
        ret
tbl_lcd_col:
        inc     word ptr [bx]
        inc     word ptr [bp+di-3e01h]
        jmp     ax
        db      7fh, 0f0h, 3fh, 0f8h, 1fh, 0fch, 0fh, 0feh
L536:
        db      26h, 8ah, 4eh, 00h, 26h, 8ah, 4eh, 01h                                  ; &.N.&.N.
        db      83h, 0c5h, 02h
L537:
        db      0e8h, 45h, 00h
        mov     si, L538-CSBASE
        db      8ah, 0d8h, 0b7h, 00h, 53h, 0c0h, 0ebh
        db      04h, 2eh, 8ah, 00h, 0e8h, 7eh, 0ffh, 5bh, 80h, 0e3h, 0fh, 2eh, 8ah, 00h, 0e8h, 74h
        db      0ffh, 0c3h
L538:
        db      "0123456789ABCD"    ; 0123456789ABCD
        db      45h, 46h                                                                ; EF
L539:
        db      26h, 8ah, 4eh, 00h, 26h, 8ah, 6eh, 01h, 83h, 0c5h, 02h
L540:
        db      0e8h, 0bh, 00h
        db      50h, 8ah, 0c4h, 0e8h, 0c0h, 0ffh, 58h, 0e8h, 0bch, 0ffh, 0c3h
L541:
        mov     di, ax
        cmp     cl, 0f8h
        jb      L542
        mov     cl, 0
L542:
        cmp     ch, 3ch
        jb      L543
        mov     ch, 0
L543:
        mov     bl, cl
        and     cl, 7
        shr     bl, 3
        sub     bh, bh
        mov     al, 20h
        mul     ch
        add     ax, bx
        add     ax, word ptr [lcd_pen]
        xchg    di, ax
        sub     ch, ch
        ret
glyphs:
        db      0bch, 0a4h, 0a4h, 0a4h, 0a4h, 0a4h, 0bch, 88h, 88h, 88h, 88h, 88h, 88h, 88h, 0bch, 84h
        db      84h, 0bch, 0a0h, 0a0h, 0bch, 0bch, 84h, 84h, 0bch, 84h, 84h, 0bch, 0a0h, 0a8h, 0a8h, 0bch
        db      88h, 88h, 88h, 0bch, 0a0h, 0a0h, 0bch, 84h, 84h, 0bch, 0bch, 0a0h, 0a0h, 0bch, 0a4h, 0a4h
        db      0bch, 04h, 0ch, 0f8h, 0fch, 0f8h, 0ch, 04h, 10h, 0ch, 7ch, 0fch, 7ch, 0ch, 10h, 0f8h
        db      88h, 88h, 88h, 88h, 88h, 0f8h, 0f8h, 0f8h, 0f8h, 0f8h, 0f8h, 0f8h, 0f8h, 0a8h, 50h, 0a8h
        db      50h, 0a8h, 50h, 0a8h, 80h, 0c0h, 0e0h, 0f0h, 0e0h, 0c0h, 80h, 10h, 30h, 70h, 0f0h, 70h
        db      30h, 10h, 38h, 38h, 38h, 38h, 7ch, 38h, 10h, 10h, 38h, 7ch, 38h, 38h, 38h, 38h ; 0.8888|8..8|8888
        db      08h, 18h, 08h, 0e8h, 08h, 08h, 1ch, 1ch, 04h, 04h, 0dch, 10h, 10h, 1ch, 0fch, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0ch, 04h, 04h, 04h
        db      04h, 04h, 0ch, 80h, 00h, 00h, 00h, 00h, 00h, 80h, 1ch, 08h, 08h, 08h, 08h, 08h
        db      1ch, 0e0h, 40h, 40h, 40h, 40h, 40h, 0e0h, 3ch, 14h, 14h, 14h, 14h, 14h, 3ch, 0e0h
        db      40h, 40h, 40h, 40h, 40h, 0e0h, 3ch, 10h, 10h, 10h, 10h, 10h, 38h, 0f0h, 0a0h, 0a0h
        db      0a0h, 40h, 40h, 40h, 00h, 60h, 0a0h, 04h, 24h, 28h, 0ch, 00h, 0ch, 50h, 90h, 10h
        db      10h, 10h, 00h, 7ch, 7ch, 7ch, 7ch, 7ch, 00h, 04h, 0ch, 38h, 3ch, 38h, 0ch, 04h ; ...|||||...8<8..
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 20h, 20h, 20h, 20h, 00h, 00h, 20h, 50h, 50h
        db      50h, 00h, 00h, 00h, 00h, 50h, 50h, 0f8h, 50h, 0f8h, 50h, 50h, 20h, 78h, 0a0h, 70h ; P....PP.P.PP x.p
        db      28h, 0f0h, 20h, 0c0h, 0c8h, 10h, 20h, 40h, 98h, 18h, 60h, 90h, 0a0h, 40h, 0a8h, 90h
        db      68h, 60h, 20h, 40h, 00h, 00h, 00h, 00h, 10h, 20h, 40h, 40h, 40h, 20h, 10h, 40h ; h` @..... @@@ .@
        db      20h, 10h, 10h, 10h, 20h, 40h, 00h, 20h, 0a8h, 70h, 0a8h, 20h, 00h, 00h, 20h, 20h ;  ... @. .p. ..  
        db      0f8h, 20h, 20h, 00h, 00h, 00h, 00h, 00h, 60h, 20h, 40h, 00h, 00h, 00h, 0f8h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 60h, 60h, 00h, 08h, 10h, 20h, 40h, 80h, 00h
        db      70h, 88h, 98h, 0a8h, 0c8h, 88h, 70h, 20h, 60h, 20h, 20h, 20h, 20h, 70h, 70h, 88h ; p.....p `    pp.
        db      08h, 10h, 20h, 40h, 0f8h, 0f8h, 10h, 20h, 10h, 08h, 88h, 70h, 10h, 30h, 50h, 90h
        db      0f8h, 10h, 10h, 0f8h, 80h, 0f0h, 08h, 08h, 88h, 70h, 30h, 40h, 80h, 0f0h, 88h, 88h
        db      70h, 0f8h, 08h, 10h, 20h, 40h, 40h, 40h, 70h, 88h, 88h, 70h, 88h, 88h, 70h, 70h ; p... @@@p..p..pp
        db      88h, 88h, 70h, 08h, 10h, 60h, 00h, 60h, 60h, 00h, 60h, 60h, 00h, 00h, 60h, 60h ; ..p..`.``.``..``
        db      00h, 60h, 20h, 40h, 10h, 20h, 40h, 80h, 40h, 20h, 10h, 00h, 00h, 0f8h, 00h, 0f8h
        db      00h, 00h, 40h, 20h, 10h, 08h, 10h, 20h, 40h, 70h, 88h, 08h, 10h, 20h, 00h, 20h
        db      70h, 88h, 08h, 68h, 0a8h, 0a8h, 70h, 70h, 88h, 88h, 88h, 0f8h, 88h, 88h, 0f0h, 88h
        db      88h, 0f0h, 88h, 88h, 0f0h, 70h, 88h, 80h, 80h, 80h, 88h, 70h, 0e0h, 90h, 88h, 88h
        db      88h, 90h, 0e0h, 0f8h, 80h, 80h, 0f0h, 80h, 80h, 0f8h, 0f8h, 80h, 80h, 0f0h, 80h, 80h
        db      80h, 70h, 88h, 80h, 0b8h, 88h, 88h, 78h, 88h, 88h, 88h, 0f8h, 88h, 88h, 88h, 70h
        db      20h, 20h, 20h, 20h, 20h, 70h, 38h, 10h, 10h, 10h, 10h, 90h, 60h, 88h, 90h, 0a0h ;      p8.....`...
        db      0c0h, 0a0h, 90h, 88h, 80h, 80h, 80h, 80h, 80h, 80h, 0f8h, 88h, 0d8h, 0a8h, 0a8h, 88h
        db      88h, 88h, 88h, 88h, 0c8h, 0a8h, 98h, 88h, 88h, 70h, 88h, 88h, 88h, 88h, 88h, 70h
        db      0f0h, 88h, 88h, 0f0h, 80h, 80h, 80h, 70h, 88h, 88h, 88h, 0a8h, 90h, 68h, 0f0h, 88h
        db      88h, 0f0h, 0a0h, 90h, 88h, 78h, 80h, 80h, 70h, 08h, 08h, 0f0h, 0f8h, 20h, 20h, 20h
        db      20h, 20h, 20h, 88h, 88h, 88h, 88h, 88h, 88h, 70h, 88h, 88h, 88h, 88h, 88h, 50h
        db      20h, 88h, 88h, 88h, 0a8h, 0a8h, 0a8h, 50h, 88h, 88h, 50h, 20h, 50h, 88h, 88h, 88h
        db      88h, 88h, 50h, 20h, 20h, 20h, 0f8h, 08h, 10h, 20h, 40h, 80h, 0f8h, 70h, 40h, 40h ; ..P   ... @..p@@
        db      40h, 40h, 40h, 70h, 10h, 10h, 10h, 10h, 10h, 70h, 0e0h, 38h, 08h, 08h, 08h, 08h
        db      08h, 38h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0f8h
        db      40h, 20h, 10h, 00h, 00h, 00h, 00h, 00h, 00h, 70h, 08h, 78h, 88h, 78h, 80h, 80h
        db      0b0h, 0c8h, 88h, 88h, 0f0h, 00h, 00h, 70h, 80h, 80h, 88h, 70h, 08h, 08h, 68h, 98h
        db      88h, 88h, 78h, 00h, 00h, 70h, 88h, 0f8h, 80h, 70h, 30h, 48h, 40h, 0e0h, 40h, 40h ; ..x..p...p0H@.@@
        db      40h, 00h, 78h, 88h, 88h, 78h, 08h, 70h, 80h, 80h, 0b0h, 0c8h, 88h, 88h, 88h, 20h
        db      00h, 60h, 20h, 20h, 20h, 70h, 10h, 00h, 30h, 10h, 10h, 90h, 60h, 80h, 80h, 90h
        db      0a0h, 0c0h, 0a0h, 90h, 60h, 20h, 20h, 20h, 20h, 20h, 70h, 00h, 00h, 0d0h, 0a8h, 0a8h
        db      88h, 88h, 00h, 00h, 0b0h, 0c8h, 88h, 88h, 88h, 00h, 00h, 70h, 88h, 88h, 88h, 70h
        db      00h, 00h, 0f0h, 88h, 0f0h, 80h, 80h, 00h, 00h, 68h, 98h, 78h, 08h, 08h, 00h, 00h
        db      0b0h, 0c8h, 80h, 80h, 80h, 00h, 00h, 70h, 80h, 70h, 08h, 0f0h, 40h, 40h, 0e0h, 40h
        db      40h, 48h, 30h, 00h, 00h, 88h, 88h, 88h, 98h, 68h, 00h, 00h, 88h, 88h, 88h, 50h
        db      20h, 00h, 00h, 88h, 88h, 0a8h, 0a8h, 50h, 00h, 00h, 88h, 50h, 20h, 50h, 88h, 00h
        db      00h, 88h, 88h, 78h, 08h, 70h, 00h, 00h, 0f8h, 10h, 20h, 40h, 0f8h, 10h, 20h, 20h
        db      40h, 20h, 20h, 10h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 40h, 20h, 20h, 10h, 20h ; @  .       @  . 
        db      20h, 40h, 00h, 20h, 10h, 0f8h, 10h, 20h, 00h, 00h, 20h, 40h, 0f8h, 40h, 20h, 00h ;  @. ... .. @.@ .
; The banner, and the signature the block stamps at 0x7f5a7.
        ifdef   BOOT_V101
        db      000h, 000h, 000h, "This is MPC20" ; ...This is MPC20
        db      "00XL Boot progra" ; 00XL Boot progra
        db      "m file $      <<" ; m file $      <<
        db      " P-ROM >>       " ;  P-ROM >>       
        db      "MPC2000XL Boot R" ; MPC2000XL Boot R
        db      4fh, 4dh, 20h, 56h, 31h, 2eh, 30h, 31h, 00h, 20h, 20h, 20h, 20h, 20h, 46h, 65h ; OM V1.01.     Fe
        db      62h, 2eh, 20h, 31h, 35h, 2ch, 32h, 30h, 30h, 31h, 20h, 20h, 20h, 20h, 20h, 20h ; b. 15,2001      
        db      20h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h
        db      01h, 08h
        else
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 54h, 68h, 69h
        db      "s is MPC2000XL B" ; s is MPC2000XL B
        db      "oot program file" ; oot program file
        db      " $      << P-ROM" ;  $      << P-ROM
        db      " >>       MPC200" ;  >>       MPC200
        db      "0XL Boot ROM V1." ; 0XL Boot ROM V1.
        db      030h, 030h, 000h, "     June 14," ; 00.     June 14,
        db      31h, 39h, 39h, 39h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 00h, 00h, 00h, 00h, 00h ; 1999       .....
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 01h, 01h, 08h
        endif

; free space below the tail table -- add features here
free_tail:
        PAD_TO  TAILTAB-SEGBASE, 000h

        dw      lcd_fb, L531-CSBASE
        db      80h, 40h, 20h, 10h, 08h, 04h, 02h, 01h

; free space below the reset vector -- add features here
free_reset:
        PAD_TO  07FFF0h-SEGBASE, 000h

reset_vector:                           ; EA 00 04 00 FC = jmp far FC00:0400 -> boot_sfr_init
        db      0eah, 00h, 04h, 00h, 0fch, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
