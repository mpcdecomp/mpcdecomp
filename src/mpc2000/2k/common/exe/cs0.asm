; CS=0000h: native x86 + INT 2Bh bytecode, BC_* in bytecode_macros.inc
; handler steps over bytecode operands
; screens from exe_screens.inc (identical v1.50/v1.72); FW_VERSION: others

; the 64 track names of an empty sequence, 16 bytes each
SEQ_TRACK_NAMES macro
_trk    set     1
        rept    64
        db      "TRACK-", '0'+_trk/10, '0'+_trk#10, "        "
_trk    set     _trk+1
        endm
        endm

NULL_HANDLER_OFS                equ     L_00EBD+3
P_0A58                          equ     L_00A4D+11
P_0A74                          equ     L_00A69+11
P_2CAC                          equ     bc_int6c_02ca1+11
P_7114                          equ     calls_init_with_int50_0710e+6
P_8A6A                          equ     L_08A69+1
STR_SYS_FILENAME                equ     L_0F9D1+4
        if      FW_VERSION = 172
P_6176                          equ     L_06176
        else
P_6176                          equ     L_0616F+7
        endif

        if      FW_VERSION = 172
isr_45                          equ     L_0D8BF+23
isr_46                          equ     softkey_close_04a98+2
isr_55                          equ     L_00FCC+20
        endif
isr_70                          equ     jmp_word_00c2c+7

; the interrupt vector table, copied to 0000:0000 with the image
ivt:
        dw      isr_div_error, CS0_SEG               ; 00h
        dw      isr_int01_int03, CS1_SEG             ; 01h
        dw      isr_iret, CS0_SEG                    ; 02h
        dw      isr_int01_int03, CS1_SEG             ; 03h
        dw      isr_int04_overflow, CS1_SEG          ; 04h
        dw      isr_iret, CS0_SEG                    ; 05h
        dw      isr_int06, CS1_SEG                   ; 06h
        dw      isr_iret, CS0_SEG                    ; 07h
        dw      isr_iret, CS0_SEG                    ; 08h
        dw      isr_iret, CS0_SEG                    ; 09h
        dw      isr_iret, CS0_SEG                    ; 0Ah
        dw      isr_iret, CS0_SEG                    ; 0Bh
        dw      isr_iret, CS0_SEG                    ; 0Ch
        dw      isr_iret, CS0_SEG                    ; 0Dh
        dw      isr_iret, CS0_SEG                    ; 0Eh
        dw      isr_iret, CS0_SEG                    ; 0Fh
        dw      isr_iret, CS0_SEG                    ; 10h
        dw      isr_iret, CS0_SEG                    ; 11h
        dw      isr_iret, CS0_SEG                    ; 12h
        dw      isr_iret, CS0_SEG                    ; 13h
        dw      isr_iret, CS0_SEG                    ; 14h
        dw      isr_iret, CS0_SEG                    ; 15h
        dw      isr_iret, CS0_SEG                    ; 16h
        dw      isr_iret, CS0_SEG                    ; 17h
        dw      isr_iret, CS0_SEG                    ; 18h
        dw      isr_iret, CS0_SEG                    ; 19h
        dw      isr_iret, CS0_SEG                    ; 1Ah
        dw      isr_iret, CS0_SEG                    ; 1Bh
        dw      isr_iret, CS0_SEG                    ; 1Ch
        dw      isr_iret, CS0_SEG                    ; 1Dh
        dw      isr_iret, CS0_SEG                    ; 1Eh
        dw      isr_iret, CS0_SEG                    ; 1Fh
        dw      isr_int20, CS0_SEG                   ; 20h
        dw      timer_isr_panel_decay, CS1_SEG       ; 21h
        dw      isr_iret, CS0_SEG                    ; 22h
        dw      isr_int23, CS1_SEG                   ; 23h
        dw      serial_rx_isr, CS1_SEG               ; 24h
        dw      isr_int25, CS1_SEG                   ; 25h
        dw      midi_tx_isr_1a0, CS1_SEG             ; 26h
        dw      midi_tx_isr_180, CS1_SEG             ; 27h
        dw      isr_iret, CS0_SEG                    ; 28h
        dw      isr_iret, CS0_SEG                    ; 29h
        dw      isr_int2a_error_msg, CS0_SEG         ; 2Ah
        dw      int2b_bytecode_dispatch, CS1_SEG     ; 2Bh
        dw      isr_2c, CS1_SEG                      ; 2Ch
        dw      isr_int2d_disk_io, CS1_SEG           ; 2Dh
        dw      isr_int2e, CS1_SEG                   ; 2Eh
        dw      isr_int2f, CS1_SEG                   ; 2Fh
        dw      isr_int30, CS1_SEG                   ; 30h
        dw      isr_iret, CS0_SEG                    ; 31h
        dw      isr_int32, CS0_SEG                   ; 32h
        dw      isr_int33, CS1_SEG                   ; 33h
        dw      isr_iret, CS0_SEG                    ; 34h
        dw      isr_iret, CS0_SEG                    ; 35h
        dw      isr_iret, CS0_SEG                    ; 36h
        dw      isr_int37, CS0_SEG                   ; 37h
        dw      isr_int38, CS1_SEG                   ; 38h
        dw      isr_iret, CS0_SEG                    ; 39h
        dw      isr_int3a, CS0_SEG                   ; 3Ah
        dw      isr_int3b, CS0_SEG                   ; 3Bh
; INT 3Ch-3Eh are never raised: their slots hold far pointers
vec_3c:
        dw      isr_iret, CS0_SEG                    ; 3Ch
vec_3d:
        dw      isr_iret, CS0_SEG                    ; 3Dh
vec_3e:
        dw      isr_iret, CS0_SEG                    ; 3Eh
        dw      isr_int3f, CS0_SEG                   ; 3Fh
        dw      error_disk_full_1b7c6, CS1_SEG       ; 40h
        dw      isr_iret, CS0_SEG                    ; 41h
        dw      isr_iret, CS0_SEG                    ; 42h
        dw      isr_int43, CS1_SEG                   ; 43h
        dw      isr_int44, CS1_SEG                   ; 44h
        dw      isr_45, CS0_SEG                      ; 45h
        dw      isr_46, CS0_SEG                      ; 46h
        dw      isr_iret, CS0_SEG                    ; 47h
        dw      isr_int48, CS1_SEG                   ; 48h
        dw      isr_iret, CS0_SEG                    ; 49h
        dw      isr_int4a, CS1_SEG                   ; 4Ah
        dw      isr_4b, CS0_SEG                      ; 4Bh
        dw      isr_iret, CS0_SEG                    ; 4Ch
        dw      isr_4d, CS0_SEG                      ; 4Dh
        dw      isr_iret, CS0_SEG                    ; 4Eh
        dw      isr_iret, CS0_SEG                    ; 4Fh
        dw      isr_int50_int51, CS0_SEG             ; 50h
        dw      isr_int50_int51, CS0_SEG             ; 51h
        dw      calls_reset_state_vars_004be, CS0_SEG ; 52h
        if      FW_VERSION = 172
        dw      isr_53, CS0_SEG                      ; 53h
        dw      isr_54, CS0_SEG                      ; 54h
        dw      isr_55, CS0_SEG                      ; 55h
        else
        dw      isr_iret, CS0_SEG                      ; 53h
        dw      isr_iret, CS0_SEG                      ; 54h
        dw      isr_iret, CS0_SEG                    ; 55h
        endif
        dw      isr_iret, CS0_SEG                    ; 56h
        dw      isr_iret, CS0_SEG                    ; 57h
        dw      isr_iret, CS0_SEG                    ; 58h
        dw      isr_iret, CS0_SEG                    ; 59h
        dw      isr_int5a, CS1_SEG                   ; 5Ah
        dw      L_1025E, CS1_SEG                     ; 5Bh
        dw      isr_int5c, CS1_SEG                   ; 5Ch
        dw      isr_int5d, CS1_SEG                   ; 5Dh
        dw      isr_int5e, CS1_SEG                   ; 5Eh
        dw      isr_int5f, CS1_SEG                   ; 5Fh
        dw      isr_int60, CS1_SEG                   ; 60h
        dw      isr_int61, CS1_SEG                   ; 61h
        dw      isr_int62, CS1_SEG                   ; 62h
        dw      isr_int63, CS1_SEG                   ; 63h
        dw      isr_int64, CS1_SEG                   ; 64h
        dw      isr_int65, CS1_SEG                   ; 65h
        dw      isr_int66, CS1_SEG                   ; 66h
        dw      isr_int67, CS1_SEG                   ; 67h
        dw      isr_int68, CS1_SEG                   ; 68h
        dw      isr_int69, CS1_SEG                   ; 69h
        dw      isr_int6a, CS1_SEG                   ; 6Ah
        dw      isr_int6b, CS1_SEG                   ; 6Bh
        dw      isr_int6c, CS1_SEG                   ; 6Ch
        dw      isr_int6d, CS1_SEG                   ; 6Dh
        dw      isr_int6e, CS1_SEG                   ; 6Eh
        dw      isr_int6f, CS1_SEG                   ; 6Fh
        dw      isr_70, CS0_SEG                      ; 70h
isr_iret:
        iret
isr_div_error:
        mov     ax, DATA_SEG
        mov     ds, ax
        BC_PRINT "   DIV.Error at 0000:0000"
        BC_PLANE_E
        db      58h, 0b1h, 0a4h, 0b5h, 05h
        BC_PUT_HEX_HIGH
        db      58h, 0b1h, 86h, 0b5h, 05h
        BC_PUT_HEX_HIGH
        BC_FLUSH
        jmp     NEAR calls_compare_bytes_d20_00f1e
isr_4b:
        mov     ax, DATA_SEG
        mov     es, ax
        mov     al, byte ptr es:[seq_running]
        mov     ah, 0
        iret
isr_4d:
        mov     ax, DATA_SEG
        mov     es, ax
        mov     si, P_7D3D
        iret
        ifdef   GROWTH_PROOF
        db      GROWTH_PROOF dup (90h)
        endif
exe_entry_point:
        mov     bp, ax
        cli
        mov     ax, cs
        cmp     ax, 0c000h
        je      copy_code_segments
        cmp     ax, 0
        je      copy_code_segments
        mov     dx, 10a4h
        mov     ax, DATA_SEG
        mov     ds, ax
        mov     ah, 9
        int     21h
        mov     ah, 4ch
        int     21h
copy_code_segments:
        sub     si, si
        sub     di, di
        mov     ax, 0fffdh
        mov     es, ax
        mov     cx, 30h
        rep movsb
        mov     ax, 0
        mov     es, ax
        mov     ax, 0c000h
        mov     ds, ax
        mov     si, 0
        mov     di, 0
        mov     cx, 8000h
        rep movsw
        mov     ax, 1000h
        mov     es, ax
        mov     ax, 0d000h
        mov     ds, ax
        mov     cx, 8000h
        mov     si, 0
        mov     di, 0
        rep movsw
        mov     ax, 2000h
        mov     es, ax
        mov     ax, 0e000h
        mov     ds, ax
        mov     cx, 8000h
        mov     si, 0
        mov     di, 0
        rep movsw
        mov     ax, 3000h
        mov     es, ax
        mov     ax, 0f000h
        mov     ds, ax
        mov     cx, 8000h
        mov     si, 0
        mov     di, 0
        rep movsw
        jmpf    00h:image_copied
image_copied:
        cli
        cld
        mov     ax, 0fffdh
        mov     ds, ax
        sub     si, si
        mov     ax, DATA_SEG
        mov     es, ax
        mov     di, 0ac3h
        mov     cx, 30h
        rep movsb
        mov     ax, DATA_SEG
        mov     ds, ax
        mov     es, ax
        mov     ss, ax
handler_BC_MEM_FULL:
        mov     ax, STACK_TOP
        mov     sp, ax
        mov     ax, ds
        mov     es, ax
        mov     di, P_7DD8
        mov     cx, DATA_SIZE
        sub     cx, di
        shr     cx, 1
        sub     ax, ax
        rep stosw
        push    bp
        callf   CS1_SEG:exe_v53_peripheral_init
init_hardware:
        BC_INIT
flush_002DA:
        BC_CLEAR
L_002DD:
        mov     dx, 120h
        mov     al, byte ptr [G_LCD_CONTRAST]
        out     dx, al
        mov     dx, ds
        mov     si, 0a67h
        if      FW_VERSION = 172
ui_a_002E9:
        endif
        BC_UI_A0
        db      0b8h, 00h, 5ah, 8bh, 0f8h, 25h
        if      FW_VERSION = 150
ui_a_002E9                      equ     $+9
        endif
        db      00h, 0f0h, 8eh, 0c0h, 0c1h, 0e7h, 04h, 2bh, 0c0h, 26h, 89h, 05h, 83h, 0c7h, 02h, 75h
        db      0f8h, 8ch, 0c3h
init_interrupts:
        add     bx, 1000h
        mov     es, bx
L_0030B:
        sub     ax, ax
        mov     di, ax
        mov     cx, 8000h
        rep stosw
        mov     bx, es
L_00316:
        add     bx, 1000h
        mov     es, bx
L_0031C:
        jne     L_0030B
        sti
        mov     byte ptr [G_DISK_DEVICE], 0
        if      FW_VERSION = 150
L_0032C:
        endif
        mov     bl, 0
        mov     bh, byte ptr [G_DISK_DEVICE]
init_memory:
        int     2ch
        if      FW_VERSION = 172
L_0032C:
        endif
        mov     bl, 0fh
        mov     bh, byte ptr [G_DISK_DEVICE]
L_00332:
        int     2ch
L_00334:
        pop     ax
        mov     byte ptr [G_DISK_DEVICE], al
        mov     byte ptr [B_78AA], al
        mov     dl, 0
        cmp     al, 0
        je      L_0034A
        cmp     dl, 9
        jae     L_0034A
        mov     dl, al
        dec     dl
L_0034A:
        mov     ah, 0
disk_init:
        int     2dh
        mov     si, D_0B1F
        mov     di, D_0C1F
        mov     ax, ds
        mov     es, ax
        mov     cx, 100h
        rep movsb
        mov     ax, ds
        mov     es, ax
        mov     di, D_1036

        mov     ax, NULL_HANDLER_OFS
        mov     cx, 0ah
L_0036A:
        stosw
        mov     word ptr [di], cs
        add     di, 2
        loop    L_0036A
L_00372:
        call    dispatch_table_init
        callf   CS1_SEG:arena_init_far
        jmp     L_0F9E9
isr_int32:
        cli
        cld
        mov     ax, DATA_SEG
        mov     ds, ax
        mov     es, ax
        mov     ss, ax
        mov     ax, STACK_TOP
        mov     sp, ax
        call    memory_copy
        callf   CS1_SEG:error_f_rom_data_1b847
        mov     byte ptr [G_FROM_CARD_STATE], al
        mov     ax, ds
        mov     es, ax
        mov     si, D_0F6C
        mov     di, D_1036
        mov     cx, 14h
        rep movsw
        push    dx
        mov     dx, 0c000h
        in      al, dx
        pop     dx
        push    dx
        mov     dx, 1a0h
        in      al, dx
        pop     dx
        push    dx
        mov     dx, 180h
        in      al, dx
        pop     dx
        mov     dx, 1a0h
        mov     al, 0
        out     dx, al
        mov     dx, 180h
        mov     al, 0
        out     dx, al
        sti
L_003C6:
        call    init_state
        mov     byte ptr [UI_REDRAW_REQ], 1
L_003CE:
        call    ui_dispatch_refresh_if_requested
lcd_coord_003D1:
        BC_FLUSH
L_003D4:
        call    calls_clear_flag_78c1_0f88d
        mov     al, byte ptr [G_SYNC_IN_MODE]
        push    ax
        mov     byte ptr [G_SYNC_IN_MODE], 0
calls_init_state_003e0:
        call    init_state
        mov     byte ptr [UI_REDRAW_REQ], 1
main_init:
        call    ui_dispatch_refresh_if_requested
        call    calls_clear_flag_78c1_0f8ce
        mov     byte ptr [UI_REDRAW_REQ], 1
        pop     ax
        mov     byte ptr [G_SYNC_IN_MODE], al
        cmp     al, 0
        je      L_003FE
calls_check_and_call_003fb:
        call    check_and_call
L_003FE:
        cli
        cld
        mov     ax, DATA_SEG
        mov     ds, ax
        mov     es, ax
        mov     ss, ax
        mov     ax, STACK_TOP
        mov     sp, ax
state_init:
        BC_SEQ_INIT
L_00411:
        call    L_009F4
        sti
L_00415:
        callf   CS1_SEG:L_17462
L_0041A:
        call    panel_event_consumer
L_0041D:
        call    panel_held_key_repeat
L_00420:
        call    ui_dispatch_pending_inc
L_00423:
        call    ui_dispatch_pending_dec
L_00426:
        call    pad_event_ring_dispatch
L_00429:
        call    slider_change_dispatch
L_0042C:
        call    calls_setup_handler_00444
L_0042F:
        if      FW_VERSION = 172
        call    calls_check_flags_1d8a_1d8b_016ec
L_00432:
        call    ui_blink_timer_tick
        endif
        cmp     byte ptr [SEQ_LOOP_JUMP_STATE], 0
        jne     L_00415
L_0043C:
        call    ui_dispatch_refresh_if_requested
        if      FW_VERSION = 172
L_0043F:
        else
        cmp     byte ptr [SEQ_LOOP_JUMP_STATE], 0
        jne     L_00411+4
        call    L_015D0
        endif
        call    fn_00463
        if      FW_VERSION = 150
L_0043F:
        call    calls_check_flags_1d8a_1d8b_016ec
        endif
        jmp     L_00415
calls_setup_handler_00444:
        mov     ax, word ptr [G_TICK_COUNT]
        mov     bx, UI_SLOT_IDLE
calls_setup_handler_0044a:
        call    setup_handler
        ret
ui_dispatch_refresh_if_requested:
        sub     ax, ax
        xchg    byte ptr [UI_REDRAW_REQ], al
        cmp     al, 0
L_00456:
        jne     L_00459
        ret
L_00459:
        mov     bx, UI_SLOT_REFRESH
L_0045C:
        call    setup_handler
lcd_coord_0045F:
        BC_FLUSH
L_00462:
        ret
fn_00463:
        push    ds
        int     49h
        pop     ds
        ret
calls_compare_bytes_d20_00468:
        call    panel_event_dequeue
        retf
panel_event_dequeue:
        sub     bx, bx
        mov     al, byte ptr [PANEL_RING_RD]
        cmp     al, byte ptr [PANEL_RING_WR]
L_00475:
        jne     br_00478
        ret
br_00478:
        mov     bl, al
        mov     si, BUF_PANEL_EVENT_RING
        mov     bx, word ptr [bx+si]
        add     byte ptr [PANEL_RING_RD], 2
        ret
panel_event_consumer:
        call    panel_event_dequeue
        or      bx, bx
L_0048A:
        jne     br_0048D
        ret
br_0048D:
        cmp     bl, 2ah
        jb      L_00493
        ret
L_00493:
        push    panel_event_consumer
        sub     ah, ah
        mov     al, bl
L_0049A:
        cmp     bh, 85h
L_0049D:
        jne     L_004A2
        jmp     br_00677
L_004A2:
        cmp     bh, 84h
L_004A5:
        jne     L_004A9
        jmp     L_00523
L_004A9:
        cmp     bh, 82h
L_004AC:
        jne     L_004B1
        jmp     br_008CB
L_004B1:
        cmp     bh, 83h
L_004B4:
        jne     calls_reset_state_vars_004b9
        jmp     br_008E7
calls_reset_state_vars_004b9:
        ret
calls_reset_state_vars_004ba:
        call    reset_state_vars
        retf
calls_reset_state_vars_004be:
        call    reset_state_vars
        iret
reset_state_vars:
        sub     ax, ax
        mov     word ptr [G_WHEEL_INC_PENDING], ax
        mov     word ptr [G_WHEEL_DEC_PENDING], ax
        mov     byte ptr [G_REPEAT_KEYS_HELD], al
calls_compare_bytes_d20_004cd:
        call    panel_event_dequeue
L_004D0:
        or      bx, bx
L_004D2:
        jne     L_004D5
        ret
L_004D5:
        call    panel_key_release_clear_held
        jmp     SHORT calls_compare_bytes_d20_004cd
panel_key_release_clear_held_far:
        call    panel_key_release_clear_held
        retf
panel_key_release_clear_held:
        pusha
        cmp     bh, 85h
        jne     br_00521
        sub     ax, ax
        cmp     bl, 1fh
        jne     br_004EE
        mov     byte ptr [D_0B16], al
br_004EE:
        if      FW_VERSION = 150
        cmp     bl, 16h
        jne     BR_004EE_V150
        mov     byte ptr [B_14CF], al
BR_004EE_V150:
        endif
        cmp     bl, 13h
        jne     br_004F9
        mov     byte ptr [G_SHIFT_HELD], al
        mov     byte ptr [B_0B15], al
br_004F9:
        cmp     bl, 1bh
        jne     br_00501
        mov     byte ptr [B_0B15], al
br_00501:
        cmp     bl, 1ch
        jne     br_00509
        mov     byte ptr [G_REC_KEY_HELD], al
br_00509:
        cmp     bl, 1dh
        jne     br_00511
        mov     byte ptr [G_ODUB_KEY_HELD], al
br_00511:
        cmp     bl, 18h
        jne     br_00519
        mov     byte ptr [G_TAP_HELD], al
br_00519:
        cmp     bl, 0ch
        jne     br_00521
        mov     byte ptr [G_OPEN_WINDOW_HELD], al
br_00521:
        popa
        ret
L_00523:
        mov     word ptr [G_KEY_REPEAT_DELAY], 258h
        cmp     byte ptr [G_SHIFT_HELD], 0
L_0052E:
        je      add_acc_00564
        mov     bh, 0
        mov     al, byte ptr [bx+TBL_KEY_SLOT_OFS]
        cmp     al, 20h
        jb      br_00541
        cmp     al, 45h
        jae     br_00541
        jmp     br_006EB
br_00541:
        cmp     al, 68h
        jne     br_00548
        jmp     br_006EB
br_00548:
        cmp     al, 8
        jne     br_0054F
        jmp     br_006EB
br_0054F:
        cmp     al, 0ch
        jne     br_00556
        jmp     br_006EB
br_00556:
        cmp     al, 10h
        jne     L_0055D
        jmp     br_006EB
L_0055D:
        cmp     al, 14h
L_0055F:
        jne     add_acc_00564
        jmp     br_006EB
add_acc_00564:
        if      FW_VERSION = 172
handler_BC_ADD_ACC              equ     $+1
        endif
        cmp     bl, 1fh
        jne     br_0056E
        mov     byte ptr [D_0B16], 1
br_0056E:
        cmp     bl, 1ch
        jne     br_00578
        mov     byte ptr [G_REC_KEY_HELD], 1
br_00578:
        cmp     bl, 1dh
        jne     br_00582
        mov     byte ptr [G_ODUB_KEY_HELD], 1
br_00582:
        cmp     bl, 28h
        jne     br_0058C
        or      byte ptr [G_REPEAT_KEYS_HELD], 1
br_0058C:
        cmp     bl, 20h
        jne     br_00596
        or      byte ptr [G_REPEAT_KEYS_HELD], 2
br_00596:
        cmp     bl, 1ah
        jne     br_005A0
        or      byte ptr [G_REPEAT_KEYS_HELD], 4
br_005A0:
        cmp     bl, 19h
        jne     br_005AA
        or      byte ptr [G_REPEAT_KEYS_HELD], 8
br_005AA:
        cmp     bl, 24h
        jne     br_005B4
        or      byte ptr [G_REPEAT_KEYS_HELD], 10h
br_005B4:
        cmp     bl, 21h
        jne     br_005BE
        or      byte ptr [G_REPEAT_KEYS_HELD], 20h
br_005BE:
        cmp     bl, 0ch
        jne     br_005C8
        mov     byte ptr [G_OPEN_WINDOW_HELD], 1
br_005C8:
        cmp     bl, 13h
        jne     br_005D7
        mov     byte ptr [G_SHIFT_HELD], 1
        mov     byte ptr [B_0B15], 1
br_005D7:
        cmp     bl, 1bh
        jne     L_005E1
        mov     byte ptr [B_0B15], 1
L_005E1:
        cmp     bl, 16h
        jne     L_005EB
        pusha
L_005E7:
        call    L_00D65
        popa
L_005EB:
        sub     bh, bh
        push    bx
        cmp     bl, 0bh
        jne     L_005F9
        mov     bx, UI_SLOT_EXIT
calls_setup_handler_005f6:
        call    setup_handler
L_005F9:
        pop     bx
        mov     bl, byte ptr [bx+TBL_KEY_SLOT_OFS]
        push    bx
        add     bx, D_0D7C
calls_setup_handler_00603:
        call    setup_handler
        pop     bx
        cmp     bl, 20h
L_0060A:
        jae     L_0060D
        ret
L_0060D:
        cmp     bl, 45h
L_00610:
        jb      L_00613
        ret
L_00613:
        mov     al, bl
        sub     al, 20h
        shr     al, 2
        sub     ah, ah
        mov     bx, UI_SLOT_DIGIT
calls_setup_handler_0061f:
        call    setup_handler
        ret
calls_setup_handler_00623:
        call    setup_handler
        retf
setup_handler:
        mov     cx, cs
        cmp     cx, word ptr [bx+2]
L_0062C:
        jne     br_00656
        cmp     word ptr [bx], NULL_HANDLER_OFS
L_00632:
        jne     handler_dispatch_00635
        ret
handler_dispatch_00635:
        cmp     bx, UI_SLOT_IDLE
handler_BC_HANDLER_DISPATCH     equ     $+1
        je      calls_word_00651
        cmp     bx, UI_SLOT_REFRESH
        je      calls_word_00651
        mov     byte ptr [UI_REDRAW_REQ], 1
        mov     byte ptr [G_BLINK_PHASE], 0
        mov     word ptr [G_BLINK_TIMER], 2
calls_word_00651:
        push    ds
        call    word ptr [bx]
        pop     ds
        ret

br_00656:
        cmp     bx, UI_SLOT_IDLE
        je      br_00672
        cmp     bx, UI_SLOT_REFRESH
        je      br_00672
        mov     byte ptr [UI_REDRAW_REQ], 1
        mov     byte ptr [G_BLINK_PHASE], 0
        mov     word ptr [G_BLINK_TIMER], 2
br_00672:
        push    ds
        callf   [bx]
        pop     ds
        ret
br_00677:
        mov     byte ptr [G_REPEAT_KEYS_HELD], 0
        cmp     bl, 0ch
        jne     br_00686
        mov     byte ptr [G_OPEN_WINDOW_HELD], 0
br_00686:
        cmp     bl, 1fh
        jne     br_00690
        mov     byte ptr [D_0B16], 0
br_00690:
        cmp     bl, 1ch
        jne     br_0069A
        mov     byte ptr [G_REC_KEY_HELD], 0
br_0069A:
        cmp     bl, 1dh
        jne     L_006A4
        mov     byte ptr [G_ODUB_KEY_HELD], 0
L_006A4:
        if      FW_VERSION = 172
        cmp     bl, 13h
        else
        cmp     bl, 16h
        jne     L_006A7
        mov     byte ptr [B_14CF], 0
        endif
L_006A7:
        if      FW_VERSION = 150
        cmp     bl, 13h
        endif
        jne     br_006BA
        mov     byte ptr [G_SHIFT_HELD], 0
        mov     byte ptr [B_0B15], 0
        mov     bx, D_0EB0
calls_setup_handler_006b6:
        call    setup_handler
        ret
br_006BA:
        cmp     bl, 1bh
        jne     br_006C4
        mov     byte ptr [B_0B15], 0
br_006C4:
        cmp     bl, 16h
        jne     calls_setup_handler_006d7
        cmp     word ptr [G_TAP_TIMER], 9c4h
        jae     calls_setup_handler_006d7
        mov     word ptr [G_TAP_TIMER], 0
calls_setup_handler_006d7:
        sub     bh, bh
        mov     bl, byte ptr [bx+TBL_KEY_SLOT_OFS]
        add     bx, D_0E64
calls_setup_handler_006e1:
        call    setup_handler
        mov     bx, D_0E54
calls_setup_handler_006e7:
        call    setup_handler
        ret
br_006EB:
        mov     al, bl
        sub     bh, bh
        mov     bl, byte ptr [bx+TBL_KEY_SLOT_OFS]
        add     bx, D_0F4C
        mov     cx, cs
        cmp     cx, word ptr [bx+2]
        jne     L_00705
        cmp     word ptr [bx], NULL_HANDLER_OFS
        jne     L_00705
        ret
L_00705:
        cmp     al, 12h
L_00707:
        je      br_0075D
        cmp     al, 0ah
calls_check_status_flag_596c_0070b:
        je      L_00783
calls_check_status_flag_596c_0070d:
        call    seq_edit_allowed
        je      L_00713
        ret
L_00713:
        cmp     al, 11h
L_00715:
        je      br_0074C
        cmp     al, 10h
        je      br_0073B
        cmp     al, 0ah
L_0071D:
        je      br_0072F
calls_setup_handler_0071f:
        push    bx
        mov     bx, UI_SLOT_EXIT
calls_setup_handler_00723:
        call    setup_handler
        mov     bl, 0
        int     4eh
        pop     bx
calls_setup_handler_0072b:
        call    setup_handler
        ret
br_0072F:
        push    bx
        callf   CS1_SEG:seq_edit_end_far
        callf   CS1_SEG:undo_seq_discard_far
        pop     bx
br_0073B:
        mov     byte ptr [B_14D5], 1
        mov     byte ptr [B_14D6], 0
        mov     byte ptr [B_14D1], 0
        jmp     SHORT calls_setup_handler_0071f
br_0074C:
        mov     byte ptr [B_14D6], 1
        mov     byte ptr [B_14D5], 1
        mov     byte ptr [B_14D1], 0
        jmp     SHORT calls_setup_handler_0071f
br_0075D:
        cmp     byte ptr [G_NEXT_SEQ], 0ffh
        je      L_00765
        ret
L_00765:
        cmp     byte ptr [B_14CF], 0
L_0076A:
        je      br_0076D
        ret
br_0076D:
        mov     byte ptr [B_14D1], 1
        mov     byte ptr [B_14D2], 0
        mov     byte ptr [G_SONG_MODE], 0
        mov     byte ptr [B_14D6], 0
        jmp     SHORT calls_setup_handler_0071f
L_00783:
        cmp     byte ptr [G_NEXT_SEQ], 0ffh
L_00788:
        je      L_0078B
        ret
L_0078B:
        cmp     byte ptr [B_14CF], 0
calls_check_status_flag_596c_00790:
        je      calls_check_status_flag_596c_00793
        ret
calls_check_status_flag_596c_00793:
        call    seq_edit_allowed
        jne     L_007A4
        push    bx
        callf   CS1_SEG:seq_edit_end_far
        callf   CS1_SEG:undo_seq_discard_far
        pop     bx
L_007A4:
        mov     byte ptr [B_14D2], 1
        mov     byte ptr [B_14D1], 0
        mov     byte ptr [G_SONG_MODE], 0
        mov     byte ptr [B_14D6], 0
        jmp     NEAR calls_setup_handler_0071f
L_007BB:
        INT_6D  transport_key_exit_screen, transport_key_exit_screen, transport_key_exit_screen, transport_key_exit_screen, transport_key_exit_screen
L_007C7:
        INT_6E transport_key_rec, jmp_mode_03102_007da, jmp_mode_03102_007e0, transport_key_play, transport_key_play_start
L_007D3:
        ret
transport_key_rec:
        call    transport_key_exit_screen
        jmp     transport_handler_rec
jmp_mode_03102_007da:
        call    transport_key_exit_screen
        jmp     transport_handler_over_dub
jmp_mode_03102_007e0:
        call    transport_key_exit_screen
        jmp     transport_handler_stop
transport_key_play:
        call    transport_key_exit_screen
        jmp     transport_handler_play
transport_key_play_start:
        call    transport_key_exit_screen
        jmp     transport_handler_play_start
transport_key_exit_screen:
        mov     bx, UI_SLOT_EXIT
        push    cs
calls_init_state_007f6:
        call    calls_setup_handler_00623
calls_init_state_007f9:
        call    init_state
        ret
FN_007FD_V150:
panel_held_key_repeat:
        sub     ax, ax
        cmp     al, byte ptr [G_REPEAT_KEYS_HELD]
        jne     br_00806
        ret
br_00806:
        cmp     ax, word ptr [G_KEY_REPEAT_DELAY]
        je      value_0080D
        ret
value_0080D:
        if      FW_VERSION = 172
handler_BC_VALUE                equ     $+3
        endif
        cmp     ax, word ptr [G_KEY_REPEAT_TIMER]
        je      L_00814
        ret
L_00814:
        mov     word ptr [G_KEY_REPEAT_TIMER], 64h
        mov     al, byte ptr [G_REPEAT_KEYS_HELD]
        mov     bx, D_0E04
        shr     al, 1
L_00822:
        jb      jmp_setup_handler_00848
        mov     bx, D_0E00
        shr     al, 1
L_00829:
        jb      jmp_setup_handler_00848
        mov     bx, D_0DF8
        shr     al, 1
L_00830:
        jb      jmp_setup_handler_00848
        mov     bx, D_0DF4
        shr     al, 1
L_00837:
        jb      jmp_setup_handler_00848
        mov     bx, D_0DDC
        shr     al, 1
L_0083E:
        jb      jmp_setup_handler_00848
        mov     bx, D_0DE0
        shr     al, 1
jmp_setup_handler_00845:
        jb      jmp_setup_handler_00848
        ret
jmp_setup_handler_00848:
        jmp     setup_handler
ui_dispatch_pending_inc:
        sub     ax, ax
        xchg    word ptr [G_WHEEL_INC_PENDING], ax
        or      ax, ax
L_00853:
        jne     L_00856
        ret
L_00856:
        cmp     byte ptr [G_SHIFT_HELD], 0
L_0085B:
        je      calls_setup_handler_0085f
        jmp     SHORT br_008B9
calls_setup_handler_0085f:
        mov     bx, UI_SLOT_WHEEL_INC
calls_setup_handler_00862:
        call    setup_handler
        mov     al, byte ptr [B_0B1E]
        or      byte ptr [B_0B1D], al
        cmp     byte ptr [B_14D2], 0
        jne     br_00874
        ret
br_00874:
        nop
        push    cs
        call    note_program_lookup
        ret
L_0084B_V150:
ui_dispatch_pending_dec:
        sub     ax, ax
        xchg    word ptr [G_WHEEL_DEC_PENDING], ax
        or      ax, ax
L_00882:
        jne     L_00885
        ret
L_00885:
        cmp     byte ptr [G_SHIFT_HELD], 0
calls_setup_handler_0088a:
        jne     br_008A7
        mov     bx, UI_SLOT_WHEEL_DEC
calls_setup_handler_0088f:
        call    setup_handler
        mov     al, byte ptr [B_0B1E]
        or      byte ptr [B_0B1D], al
        cmp     byte ptr [B_14D2], 0
        jne     br_008A1
        ret
br_008A1:
        nop
        push    cs
        call    note_program_lookup
        ret
br_008A7:
        mov     al, byte ptr [G_LCD_CONTRAST]
        or      al, al
        jne     br_008AF
        ret
br_008AF:
        dec     al
        mov     byte ptr [G_LCD_CONTRAST], al
        mov     dx, 120h
        out     dx, al
        ret
br_008B9:
        mov     al, byte ptr [G_LCD_CONTRAST]
        cmp     al, 1fh
        jne     br_008C1
        ret
br_008C1:
        inc     al
        mov     byte ptr [G_LCD_CONTRAST], al
        mov     dx, 120h
        out     dx, al
        ret
br_008CB:
        sub     al, 1
        jae     br_008D1
        mov     al, 0
br_008D1:
        sub     dh, dh
        mov     dl, al
        mov     bh, al
        xchg    byte ptr [D_0D2C], bh
        sub     dl, bh
        jae     jmp_setup_handler_008e1
        mov     dl, 0
jmp_setup_handler_008e1:
        mov     bx, D_0E30
        jmp     setup_handler
br_008E7:
        sub     al, 1
        jae     br_008ED
        mov     al, 0
br_008ED:
        sub     dh, dh
        mov     dl, al
        mov     bh, al
        xchg    byte ptr [D_0D2C], bh
        sub     dl, bh
        jae     jmp_setup_handler_008fd
        mov     dl, 0
jmp_setup_handler_008fd:
        mov     bx, D_0E34
        jmp     setup_handler
slider_change_dispatch:
        mov     al, byte ptr [G_SLIDER_POS]
        mov     ah, al
        xchg    byte ptr [D_0D2B], ah
        cmp     al, ah
        jne     jmp_setup_handler_00911
        ret
jmp_setup_handler_00911:
        sub     ah, ah
        mov     bx, D_0E60
        jmp     setup_handler
isr_int37:
        push    ds
        mov     ax, DATA_SEG
        mov     ds, ax
        sub     ah, ah
        mov     al, byte ptr [G_PAD_BANK_OFS]
        shr     al, 4
        pop     ds
        iret
isr_int3f:
        push    ds
        mov     bx, DATA_SEG
        mov     ds, bx
        sub     ah, ah
        shl     al, 4
        mov     byte ptr [G_PAD_BANK_OFS], al
        pop     ds
        iret
pad_event_ring_dispatch:
        mov     bl, byte ptr [PAD_RING_RD_UI]
        cmp     bl, byte ptr [PAD_RING_WR]
        jne     L_00944
        ret
L_00944:
        sub     bh, bh
        mov     ax, word ptr [bx+BUF_PAD_EVENT_RING]
L_0094A:
        add     byte ptr [PAD_RING_RD_UI], 2
        mov     bl, ah
        or      bl, byte ptr [G_PAD_BANK_OFS]
        mov     byte ptr [G_LAST_PAD], bl
        sub     bh, bh
        les     si, cs:[vec_3c]
        mov     bh, byte ptr es:[bx+si]
        mov     byte ptr [G_LAST_PAD_NOTE], bh
        mov     bx, UI_SLOT_PAD_HIT
        jmp     setup_handler
note_to_pad_lookup:
        mov     bl, 40h
        cmp     al, 23h
        jb      L_0098B
        cmp     al, 63h
        jae     L_0098B
        les     si, cs:[vec_3c]
        mov     bx, 0
L_0097F:
        cmp     al, byte ptr es:[bx+si]
        je      L_0098B
        inc     bl
L_00986:
        cmp     bl, 40h
        jne     L_0097F
L_0098B:
        mov     al, bl
L_0098D:
        ret
L_0098E:
        add     byte ptr [G_PAD_BANK_OFS], 10h
        and     byte ptr [G_PAD_BANK_OFS], 30h
        mov     byte ptr [SIXTEEN_LEVELS_ON], 0
        ret
L_0099E:
        xor     byte ptr [G_FULL_LEVEL], 7fh
        ret
after_key_toggle:
        cmp     byte ptr [G_STEP_EDIT_ACTIVE], 0
L_009A9:
        je      br_009AC
        ret
br_009AC:
        xor     byte ptr [NOTE_VAR_AFTER], 1
        ret
panel_leds_update_far:
        call    panel_leds_update
        retf
L_015D0:
ui_blink_timer_tick:
        sub     ax, ax
        cmp     ax, word ptr [G_BLINK_TIMER]
L_009BC:
        je      L_009BF
        ret
L_009BF:
        mov     ax, word ptr [G_BLINK_PERIOD]
        mov     word ptr [G_BLINK_TIMER], ax
L_009C5:
        call    panel_leds_update
        test    byte ptr [G_BLINK_ENABLE], 1
L_009CD:
        jne     br_009D0
        ret
br_009D0:
        add     byte ptr [G_BLINK_ENABLE], 80h
        mov     bx, D_0E3C
        jb      L_009DD
L_009DA:
        mov     bx, D_0E38
L_009DD:
        mov     cx, cs
        cmp     cx, word ptr [bx+2]
L_009E2:
        je      L_009E5
        ret
L_009E5:
        cmp     word ptr [bx], NULL_HANDLER_OFS
calls_word_009e9:
        jne     L_009EC
        ret
L_009EC:
        push    ds
        call    word ptr [bx]
        pop     ds
lcd_coord_009F0:
        BC_FLUSH
L_009F3:
        ret
L_009F4:
        call    L_009DA
        mov     byte ptr [G_BLINK_ENABLE], 0
        ret
L_009FD:
        mov     byte ptr [G_BLINK_ENABLE], 1
        ret
L_00A03:
        mov     word ptr [G_BLINK_PERIOD], ax
        ret
panel_leds_update:
        mov     ah, byte ptr [G_BLINK_PHASE]
        xor     ah, 0ffh
        mov     byte ptr [G_BLINK_PHASE], ah
L_00A12:
        call    panel_bank_leds_update
        mov     dx, 144h
        cmp     byte ptr [G_UNDO_SEQ_LED], 0
        jne     L_00A22
        or      dl, 10h
L_00A22:
        out     dx, al
L_00A23:
        mov     dx, 14ah
        cmp     byte ptr [G_FULL_LEVEL], 0
        jne     L_00A30
        or      dl, 10h
L_00A30:
        out     dx, al
L_00A31:
        mov     dx, 14ch
        cmp     byte ptr [SIXTEEN_LEVELS_ON], 0
        jne     L_00A3E
        or      dl, 10h
L_00A3E:
        out     dx, al
L_00A3F:
        mov     dx, 146h
        cmp     byte ptr [SEQ_RUNNING], 0
        jne     L_00A4C
        or      dl, 10h
L_00A4C:
        out     dx, al
L_00A4D:
        mov     dx, 140h
        cmp     byte ptr [NOTE_VAR_AFTER], 0
        jne     L_00A5A
        or      dl, 10h
L_00A5A:
        out     dx, al
L_00A5B:
        mov     dx, 142h
        cmp     byte ptr [SEQ_REC_ARMED], 0
        jne     L_00A68
        or      dl, 10h
L_00A68:
        out     dx, al
L_00A69:
        mov     dx, 148h
        cmp     byte ptr [SEQ_ODUB_ARMED], 0
        jne     L_00A76
        or      dl, 10h
L_00A76:
        out     dx, al
L_00A77:
        ret
panel_bank_leds_update:
        mov     al, byte ptr [G_PAD_BANK_OFS]
        cmp     al, 10h
L_00A7D:
        je      br_00A98
        cmp     al, 20h
L_00A81:
        je      br_00AA9
        cmp     al, 30h
L_00A85:
        je      br_00ABA
        mov     dx, 164h
        out     dx, al
        mov     dx, 170h
        out     dx, al
        mov     dx, 172h
        out     dx, al
        mov     dx, 15eh
        out     dx, al
        ret
br_00A98:
        mov     dx, 174h
        out     dx, al
        mov     dx, 160h
        out     dx, al
        mov     dx, 172h
        out     dx, al
        mov     dx, 15eh
        out     dx, al
        ret
br_00AA9:
        mov     dx, 174h
        out     dx, al
        mov     dx, 170h
        out     dx, al
        mov     dx, 162h
        out     dx, al
        mov     dx, 15eh
        out     dx, al
        ret
br_00ABA:
        mov     dx, 174h
        out     dx, al
        mov     dx, 170h
        out     dx, al
        mov     dx, 172h
        out     dx, al
        mov     dx, 14eh
        out     dx, al
        ret



setup_callback_vectors:
        mov     word ptr [FIELD_VAL_PTR], si
        mov     byte ptr [FIELD_MAX_B], al
        mov     word ptr [FIELD_CHANGE_CB], bx
        mov     word ptr [UI_SLOT_WHEEL_DEC], P_0B35
        mov     word ptr [UI_SLOT_WHEEL_INC], P_0B13
        mov     word ptr [UI_SLOT_WHEEL_DEC_SEG], cs
        mov     word ptr [UI_SLOT_WHEEL_INC_SEG], cs
        ret
setup_callback_alt:
        mov     word ptr [FIELD_VAL_PTR], si
        mov     byte ptr [FIELD_MAX_B], al
        mov     word ptr [FIELD_CHANGE_CB], bx
        mov     word ptr [UI_SLOT_WHEEL_DEC], L_00B2D
        mov     word ptr [UI_SLOT_WHEEL_INC], L_00B0B
        mov     word ptr [UI_SLOT_WHEEL_DEC_SEG], cs
        mov     word ptr [UI_SLOT_WHEEL_INC_SEG], cs
        ret
L_00B0B:
        cmp     byte ptr [SEQ_RUNNING], 0
L_00B10:
        je      br_00B13
        ret
br_00B13:
        mov     si, word ptr [FIELD_VAL_PTR]
        mov     bl, byte ptr [FIELD_MAX_B]
        add     al, byte ptr [si]
        jb      jmp_word_00b23
        cmp     al, bl
L_00B21:
        jb      jmp_word_00b25
jmp_word_00b23:
        mov     al, bl
jmp_word_00b25:
        mov     byte ptr [si], al
        sub     ah, ah
        jmp     word ptr [FIELD_CHANGE_CB]
L_00B2D:
        cmp     byte ptr [SEQ_RUNNING], 0
L_00B32:
        je      br_00B35
        ret
br_00B35:
        mov     si, word ptr [FIELD_VAL_PTR]
        mov     ah, byte ptr [si]
        sub     ah, al
        jae     jmp_word_00b41
        sub     ah, ah
jmp_word_00b41:
        mov     byte ptr [si], ah
        mov     al, ah
        sub     ah, ah
        jmp     word ptr [FIELD_CHANGE_CB]
        db      89h, 16h, 84h, 10h, 89h, 36h, 86h, 10h, 88h, 26h, 8ah, 10h, 0a2h, 8bh, 10h, 0c7h
        db      06h, 2ch, 0eh
        dw      L_00B8A
        db      0c7h, 06h, 28h, 0eh
        dw      L_00B6F
        db      8ch, 0eh, 2eh, 0eh, 8ch
        db      0eh, 2ah, 0eh, 0c3h
L_00B6F:
        mov     es, word ptr [FIELD_VAL_SEG]
        mov     si, word ptr [FIELD_VAL_PTR]
        mov     bl, byte ptr [FIELD_MAX_B]
        add     al, byte ptr es:[si]
        jb      L_00B84
        cmp     al, bl
L_00B82:
        jb      L_00B86
L_00B84:
        mov     al, bl
L_00B86:
        mov     byte ptr es:[si], al
        ret
L_00B8A:
        mov     bl, al
        mov     es, word ptr [FIELD_VAL_SEG]
        mov     si, word ptr [FIELD_VAL_PTR]
        mov     al, byte ptr es:[si]
        sub     al, bl
L_00B99:
        jae     br_00B9D
        sub     ax, ax
br_00B9D:
        cmp     al, byte ptr [D_108B]
        jae     br_00BA6
        mov     al, byte ptr [D_108B]
br_00BA6:
        mov     byte ptr es:[si], al
        ret
ui_numeric_field_setup:
        mov     word ptr [FIELD_VAL_SEG], ds
        mov     word ptr [FIELD_VAL_PTR], si
        mov     word ptr [FIELD_MAX_W], ax
        mov     word ptr [FIELD_MIN_W], bx
        mov     word ptr [FIELD_CHANGE_CB], cx
        mov     word ptr [UI_SLOT_WHEEL_DEC], p_0c10
        mov     word ptr [UI_SLOT_WHEEL_INC], P_0BF2
        mov     word ptr [UI_SLOT_WHEEL_DEC_SEG], cs
        mov     word ptr [UI_SLOT_WHEEL_INC_SEG], cs
        ret
L_00BD2:
        mov     word ptr [FIELD_VAL_SEG], dx
        mov     word ptr [FIELD_VAL_PTR], si
        mov     word ptr [FIELD_MAX_W], ax
        mov     word ptr [FIELD_MIN_W], bx
        mov     word ptr [FIELD_CHANGE_CB], cx
        mov     word ptr [UI_SLOT_WHEEL_DEC], p_0c10
        mov     word ptr [UI_SLOT_WHEEL_INC], P_0BF2
        ret
L_00BF2:
        mov     es, word ptr [FIELD_VAL_SEG]
        mov     si, word ptr [FIELD_VAL_PTR]
        mov     bx, word ptr [FIELD_MAX_W]
        add     ax, word ptr es:[si]
        jb      jmp_word_00c07
        cmp     ax, bx
L_00C05:
        jb      jmp_word_00c09
jmp_word_00c07:
        mov     ax, bx
jmp_word_00c09:
        mov     word ptr es:[si], ax
        jmp     word ptr [FIELD_CHANGE_CB]
p_0c10:
        db      8bh, 0d8h, 8eh, 06h, 84h, 10h, 8bh, 36h, 86h, 10h, 26h, 8bh, 04h, 2bh, 0c3h
L_00C1F:
        jae     br_00C23
        sub     ax, ax
br_00C23:
        cmp     ax, word ptr [FIELD_MIN_W]
        jae     jmp_word_00c2c
        mov     ax, word ptr [FIELD_MIN_W]
L_01846:
jmp_word_00c2c:
        mov     word ptr es:[si], ax
        jmp     word ptr [FIELD_CHANGE_CB]
        db      0fbh, 0b4h, 00h, 0a3h, 94h, 10h, 8bh, 0ech, 8bh, 76h, 00h, 8eh, 46h, 02h, 26h, 8bh
        db      04h, 50h, 26h, 8bh, 44h, 02h, 0a3h, 8ch, 10h, 26h, 8bh, 44h, 04h, 0a3h, 92h, 10h
        db      83h, 46h, 00h, 06h
bc_int6a_00c57:
        INT_6A jmp_word_00cff, jmp_word_00cff
ui_ctrl_00c5d:
        mov     word ptr [UI_SLOT_DIGIT], P_0CD1
        mov     word ptr [W_0DC8], P_0CFF
        mov     word ptr [W_0DC4], P_0CF5
ui_setup_callback_alt_c6f:
        BC_UI_CTRL 0, 0, 0, 0
L_00C76:
        pop     cx
        push    cx
        add     ch, 7
        add     cl, 5
        cmp     word ptr [FIELD_MAX_W], 270fh
        jb      seq_op_00C89
        add     cl, 0ch
seq_op_00C89:
        mov     dl, 7
        mov     dh, 1
seq_op_main:
        BC_SEQ_OP
L_00C90:
        pop     ax
        mov     byte ptr [LCD_PEN_X], al
        mov     byte ptr [LCD_PEN_Y], ah
        mov     ax, ds
        mov     es, ax
        mov     si, D_0DD4
        mov     di, D_105E
        mov     cx, 8
        rep movsw
        mov     ax, word ptr [UI_SLOT_REFRESH]
        mov     word ptr [UI_SLOT_REFRESH_SAVE], ax
bc_int6c_00cad:
        INT_6C digit_entry_left, digit_entry_right, digit_entry_up, jmp_setup_handler_00d18
bc_int5d_00cb7:
        INT_5D digit_entry_refresh
        db      0cfh
digit_entry_refresh:
        mov     ax, word ptr [DIGIT_ENTRY_VALUE]
        cmp     word ptr [FIELD_MAX_W], 3e7h
L_00CC5:
        jne     L_00CCB
return_handler_00CC7:
        BC_RETURN
        db      0c3h
L_00CCB:
        sub     dx, dx
part_disp_00CCD:
        BC_PART_DISP
        db      0c3h
digit_entry_add_digit:
        mov     cl, al
        mov     ch, 0
        mov     ax, word ptr [DIGIT_ENTRY_VALUE]
        mov     bx, 0ah
        mul     bx
        add     ax, cx
        mov     cx, word ptr [FIELD_MAX_W]
        inc     cx
        cmp     ax, cx
        jb      L_00CF1
loop_00CE8:
        sub     ax, cx
        sbb     dx, 0
        jae     loop_00CE8
        add     ax, cx
L_00CF1:
        mov     word ptr [DIGIT_ENTRY_VALUE], ax
        ret
jmp_word_00cf5:
        call    digit_entry_restore_slots
        mov     ax, word ptr [DIGIT_ENTRY_VALUE]
        jmp     word ptr [DIGIT_ENTRY_DONE_CB]
jmp_word_00cff:
        call    digit_entry_restore_slots
        mov     ax, 0ffffh
        jmp     word ptr [DIGIT_ENTRY_DONE_CB]
digit_entry_left:
        db      0bbh, 0d4h, 0dh, 0ebh, 0dh
digit_entry_right:
        mov     bx, D_0DD8
        jmp     SHORT jmp_setup_handler_00d1b
digit_entry_up:
        mov     bx, D_0DDC
        jmp     SHORT jmp_setup_handler_00d1b
jmp_setup_handler_00d18:
        mov     bx, D_0DE0
jmp_setup_handler_00d1b:
        call    digit_entry_restore_slots
        jmp     setup_handler
digit_entry_restore_slots:
        mov     ax, ds
        mov     es, ax
        mov     di, D_0DD4
        mov     si, D_105E
        mov     cx, 8
        rep movsw
        mov     ax, word ptr [UI_SLOT_REFRESH_SAVE]
        mov     word ptr [UI_SLOT_REFRESH], ax
        push    bx
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
        mov     word ptr [W_0DC4], NULL_HANDLER_OFS
        mov     word ptr [W_0DC8], NULL_HANDLER_OFS
        mov     cl, byte ptr [LCD_PEN_X]
        mov     ch, byte ptr [LCD_PEN_Y]
        cmp     word ptr [FIELD_MAX_W], 270fh
        jb      L_00D5C
        add     cl, 6
L_00D5C:
        mov     dh, 8
        mov     dl, 12h
b_00D60:
        BC_B2
        db      5bh, 0c3h
L_00D65:
        callf   CS1_SEG:L_1019D
        ret
isr_int3a:
        sti
        mov     bx, DATA_SEG
        mov     ds, bx
        call    L_00D75
        iret
L_00D75:
        cmp     al, 28h
L_00D77:
        je      br_00D92
        cmp     al, 29h
L_00D7B:
        je      br_00D9D
        cmp     al, 1ah
L_00D7F:
        je      br_00DA8
        cmp     al, 1bh
L_00D83:
        je      br_00DB3
        cmp     al, 14h
L_00D87:
        db      74h, 35h
        cmp     al, 4bh
L_00D8B:

        je      br_00DC9
        cmp     al, 49h
L_00D8F:
        je      L_00DD4
        ret
br_00D92:
        mov     word ptr [UI_SLOT_BANK], P_098E
        mov     word ptr [UI_SLOT_BANK_SEG], cs
        ret
br_00D9D:
        mov     word ptr [UI_SLOT_FULL_LEVEL], P_099E
        mov     word ptr [UI_SLOT_FULL_LEVEL_SEG], cs
        ret
br_00DA8:
        mov     word ptr [UI_SLOT_AFTER], P_09A4
        mov     word ptr [UI_SLOT_AFTER_SEG], cs
        ret
br_00DB3:
        mov     word ptr [D_0DE8], P_0D65
        mov     word ptr [W_0DEA], cs
        ret
        mov     word ptr [D_0DCC], init_state
        mov     word ptr [D_0DCE], cs
        ret
br_00DC9:
        mov     word ptr [W_0F70], seq_init_04E2E
        mov     word ptr [W_0F72], cs
        ret
L_00DD4:
        mov     word ptr [W_0F78], P_E107
        mov     word ptr [W_0F7A], cs
        ret
dispatch_table_init_far:
        call    dispatch_table_init
        retf
isr_int50_int51:
        sti
L_00DE4:
        call    dispatch_table_init
        iret
init_state_pointers:
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
        mov     word ptr [W_0DC4], NULL_HANDLER_OFS
        mov     word ptr [W_0DC8], NULL_HANDLER_OFS
        ret
dispatch_table_init:
        mov     cx, D_1034
        mov     ax, ds
        mov     es, ax
        mov     di, D_0D7C
        mov     ax, NULL_HANDLER_OFS
loop_00E08:
        stosw
        mov     word ptr [di], cs
        add     di, 2
        cmp     di, cx
        jne     loop_00E08
        mov     ax, ds
        mov     es, ax
        mov     si, D_1036
        mov     di, D_0F6C
        mov     cx, 14h
        rep movsw
        mov     byte ptr [G_SHIFT_HELD], 0
        mov     byte ptr [B_14CF], 0
        mov     si, D_0D7C
        mov     word ptr [si+0a0h], P_098E
        mov     word ptr [si+0a4h], P_099E
        mov     word ptr [si+68h], P_09A4
        mov     word ptr [si+0e4h], slider_note_variation
        mov     word ptr [si+0a8h], P_A987
        mov     word ptr [si+50h], init_state
        mov     word ptr [si+52h], cs
        mov     si, D_0F4C
        mov     word ptr [si+24h], seq_init_04E2E
        mov     word ptr [si+26h], cs
        mov     word ptr [si+28h], calls_buffer_init_10_0aaab+1
        mov     word ptr [si+2ah], cs
        mov     word ptr [si+TBL_002C], P_E107
        mov     word ptr [si+2eh], cs
        mov     word ptr [si+68h], L_0A3D8
        mov     word ptr [si+6ah], cs
        mov     word ptr [si+40h], other_screen_others
        mov     word ptr [si+42h], cs
        mov     word ptr [si+44h], calls_buffer_init_10_0b41d
        mov     word ptr [si+46h], cs
        sub     ax, ax
        mov     word ptr cs:[vec_3e], ax
        mov     word ptr cs:[vec_3e+2], ax
        cmp     byte ptr [B_14D5], 0
L_00E95:
        je      L_00E9A
        jmp     L_0301F
L_00E9A:
        mov     al, byte ptr [B_14D2]
        or      al, byte ptr [B_14D1]
L_00EA1:
        jne     calls_check_status_flag_596c_00ea4
        ret
calls_check_status_flag_596c_00ea4:
        mov     word ptr [D_0DE8], L_015AA
        if      FW_VERSION = 172
        mov     word ptr [D_0ED0], L_015CD
        else
        mov     word ptr [D_0ED0], L_015D6
        endif
calls_check_status_flag_596c_00eb0:
        call    seq_edit_allowed
        jne     L_00EBB
        nop
        push    cs
L_00EB7:
        call    main_screen_install_transport_handlers_far
        ret
L_00EBB:
        nop
        push    cs
L_00EBD:
        call    main_screen_install_play_handlers_far
        if      FW_VERSION = 150
save_a_sound_refresh:
        endif
        ret
L_00EC1:
        cmp     byte ptr [B_14CF], 0
L_00EC6:
        jne     L_00EC9
        ret
L_00EC9:
        mov     bx, word ptr [SEQ_AFTER_GAP_SEG]
        mov     si, word ptr [FP_SEQ_AFTER_GAP]
        int     4
        ret
L_00ED4:
        cmp     byte ptr [B_14CF], 0
L_00ED9:
        jne     L_00EDC
        ret
L_00EDC:
        mov     bx, word ptr [CUR_SEQ_SEG]
        mov     si, 0
        int     4
        ret
L_00EE6:
        cmp     byte ptr [B_14CF], 0
L_00EEB:
        jne     L_00EEE
        ret
L_00EEE:
        mov     bx, word ptr [SEQ_EVENTS_SEG]
        sub     si, si
        int     4
        ret
isr_int2a_error_msg:
        pop     si
        pop     dx
        mov     ax, DATA_SEG
        mov     ds, ax
        sti
display_00EFF:
        BC_DISPLAY
L_00F02:
        les     si, cs:[vec_3e]
        mov     ax, es
        or      ax, si
        je      calls_compare_bytes_d20_00f1e
        push    ds
        int     3eh
        pop     ds
lcd_coord_00F11:
        BC_FLUSH
calls_compare_bytes_d20_00f14:
        sub     ax, ax
        mov     word ptr cs:[vec_3e], ax
        mov     word ptr cs:[vec_3e+2], ax
calls_compare_bytes_d20_00f1e:
        call    panel_event_dequeue
        cmp     bh, 84h
L_00F24:
        je      seq_init_00F36
        cmp     word ptr [G_WHEEL_INC_PENDING], 0
L_00F2B:
        jne     seq_init_00F36
        cmp     word ptr [G_WHEEL_DEC_PENDING], 0
L_00F32:
        jne     seq_init_00F36
        jmp     SHORT calls_compare_bytes_d20_00f1e
seq_init_00F36:
        BC_SEQ_INIT
calls_setup_handler_00f39:
        mov     byte ptr [B_14CF], 0
        mov     bx, UI_SLOT_EXIT
print_00F41:
        call    setup_handler
        jmp     L_003FE
wait_msg:
        call    wait_loop
        retf
wait_loop:
WAIT_LOOP_V150:
        FEAT_BANNER
print_wait_00f63:
        ret
delay_loop:
        mov     cx, 2bch
        jmp     SHORT delay_ticks
delay_ticks_far:
        call    delay_ticks
        retf
delay_ticks:
        mov     bx, word ptr [G_TICK_COUNT]
L_00F71:
        mov     ax, word ptr [G_TICK_COUNT]
        sub     ax, bx
        cmp     ax, cx
        jb      L_00F71
        ret
L_00F7B:
        sub     ax, ax
        cmp     ax, word ptr [G_TIMEOUT_TICKS]
        clc
L_00F82:
        je      L_00F85
        ret
L_00F85:
        mov     word ptr [G_TIMEOUT_TICKS], cx
        stc
        ret
L_00F8B:
        mov     ax, ds
        mov     es, ax
loop_00F8F:
        lodsb
        or      al, al
        jne     isr_00F95
        ret
isr_00F95:
        stosb
        jmp     SHORT loop_00F8F
        if      FW_VERSION = 172
string_compare:
        endif
        pop     bp
        if      FW_VERSION = 150
string_compare:
        endif
        mov     dx, si
isr_00F9B:
        mov     al, byte ptr cs:[bp]
        inc     bp
        or      al, al
        je      jmp_bp_00fb9
        mov     ah, byte ptr [si]
        inc     si
        cmp     ah, al
        je      isr_00F9B

isr_00FAB:
        mov     al, byte ptr cs:[bp]
        inc     bp
        or      al, al
        jne     isr_00FAB
        mov     si, dx
        stc
        jmp     bp
jmp_bp_00fb9:
        mov     si, dx
        clc
        jmp     bp
        if      FW_VERSION = 172
isr_53:
        db      52h, 0b4h, 00h, 0c1h, 0e0h, 02h, 0d1h, 0e0h, 8bh, 0d0h, 81h, 0c2h, 00h, 0ffh
L_00FCC:
        mov     bp, L_00FD2
        db      0fh, 0f0h
        push    bp
L_00FD2:
        in      ax, dx
        mov     bp, L_00FD9
        db      0fh
        db      0e0h, 54h
L_00FD9:
        shr     ax, 2
        pop     dx
        iret
isr_54:
        db      0ffh, 0e5h, 0ffh, 0e5h
        endif
calls_init_with_int50_00fe2:
        call    main_screen_enter
        retf
calls_input_handler_00fe6:
        call    input_handler
        retf
calls_process_input_00fea:
        call    process_input
        retf
calls_calc_bar_beat_00fee:
        call    calc_bar_beat
        retf
init_state:
        call    main_screen_enter
calls_check_status_flag_596c_00ff5:
        call    seq_edit_allowed
L_00FF8:
        je      L_00FFB
        ret
L_00FFB:
        mov     bl, 0
        int     4eh
        sub     ax, ax
        mov     byte ptr [SEQ_LOOP_JUMP_STATE], al
        mov     word ptr [G_SONG_STEP_START_LO], ax
        mov     word ptr [G_SONG_STEP_START_HI], ax
        mov     byte ptr [G_MIDI_IN_RAW_MODE], al
        cmp     byte ptr [P_2081], 0
L_01012:
        jne     calls_system_call_0102a
        mov     ax, 530h
        shr     ax, 4
        mov     bx, ds
        add     ax, bx
calls_system_call_0101e:
        mov     word ptr [CUR_SEQ_SEG], ax
calls_system_call_01021:
        call    system_call
        mov     al, byte ptr [SEL_SEQ]
calls_input_handler_01027:
        call    input_handler
calls_system_call_0102a:
        call    system_call
        ret
main_screen_enter:
        push    cs
calls_buffer_init_10_0102f:
        call    buffer_init_10A2
        callf   CS1_SEG:P_CACC
bc_int6b_01037:
        int     50h
bc_int6b_01039:
        if      FW_VERSION = 172
bc_int5d_01043                  equ     $+10
        endif
        INT_6B calls_check_status_flag_596c_07974, calls_check_status_flag_596c_0c071, main_screen_tronof, main_screen_solo, calls_call_with_check_011b4, calls_call_with_check_01197
bc_int5d_01047:
        INT_5D system_call
bc_int5c_0104b:
        INT_5C main_screen_idle
L_0104F:
        mov     word ptr [D_0E24], L_0A85D
        mov     word ptr [D_0DEC], calls_check_status_flag_596c_0108b
        mov     word ptr [D_0DF0], calls_check_status_flag_596c_015fe
        mov     word ptr [D_0DE8], L_015AA
        mov     word ptr [P_0ED8], L_01612
        if      FW_VERSION = 150
        mov     word ptr [D_0ED0], L_015D6
        endif
        cmp     byte ptr [SEQ_RUNNING], 0
        jne     L_01077
L_01074:
        call    main_screen_install_transport_handlers
L_01077:
        cmp     byte ptr [SEQ_RUNNING], 0
        je      calls_time_convert_01081
calls_time_convert_0107e:
        call    main_screen_install_play_handlers
calls_time_convert_01081:
        call    time_convert
calls_solo_status_018_01084:
        call    L_01844
calls_solo_status_018_01087:
        call    solo_status_018B0
        ret
calls_check_status_flag_596c_0108b:
        call    seq_edit_allowed
L_0108E:
        je      L_01091
        ret
L_01091:
        callf   CS1_SEG:undo_seq_swap_far
        cmp     word ptr [UI_SLOT_OPEN_WINDOW], main_screen_tempo_window
        jne     L_010A1
L_0109E:
        call    fn_0228E
L_010A1:
        ret
buffer_init_10A2:
        sub     ax, ax
        mov     byte ptr [B_14D1], al
        mov     byte ptr [B_14D2], al
        mov     byte ptr [B_14D3], al
        mov     byte ptr [B_14D5], al
        mov     byte ptr [B_14D6], al
        mov     byte ptr [G_STEP_EDIT_ACTIVE], al
        mov     byte ptr [G_SONG_MODE], al
handler_BC_SERIAL_ALLOC:
        mov     byte ptr [B_1A2A], al
        mov     byte ptr [B_63C8], al
        retf
L_01CBC:
system_call:
        BC_PLANE_A
L_010C3:
        cmp     byte ptr [B_14D3], 0
calls_ui_a_011_010c8:
        je      calls_ui_a_011_010cd
        jmp     calls_ui_a_011_07020
calls_ui_a_011_010cd:
        call    ui_a_011CC
calls_cursor_handler_010d0:
        call    cursor_handler
ext_status_010D3:
        if      FW_VERSION = 172
        call    handler_BC_EXT_STATUS
        else
        call    ext_status_01205+1
        endif
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     al, byte ptr es:[20h]
jump_handler_010DE:
        BC_JUMP 01fe2h
bc_target_010e3:
        mov     al, byte ptr [G_COUNT_ENABLE]
jump_handler_010E6:
        BC_JUMP 028e2h
status_a_010EB:
        BC_STATUS_A 138, 13, G_TC_NOTE_VALUE, TBL_NOTE_VALUE_NAMES
L_010F4:
        call    L_011F5
L_010F7:
        call    main_screen_bars_field
        mov     es, word ptr [CUR_SEQ_SEG]
main_track_channel_draw:
        call    main_screen_track_field
        mov     bl, byte ptr [SEL_TRACK]
        sub     bh, bh
        mov     al, byte ptr es:[bx+TRK_CHANNEL]
        push    ax
        push    ax
        and     al, 80h
drum_status:
        BC_VALUE 01aa2h
drum_display:
        BC_STATUS 6, 36, "Drum"
midi_status_0111F:
        pop     ax
        test    al, 40h
midi_status:
        jne     status_midi_0112e
midi_display:
        BC_STATUS 6, 36, "MIDI"
status_midi_0112e:
        pop     ax
        and     al, 3fh
        xor     al, 20h
        test    al, 20h
        je      L_01139
        mov     al, 20h
L_01139:
        mov     ah, 3
        mul     ah
        add     ax, D_1555
        mov     si, ax
        mov     dx, ds
status_b_01144:
        if      FW_VERSION = 172
L_01149                         equ     $+5
        endif
        BC_STATUS_B 36, 36, 3
clear_rect_0114A:
        BC_CLEAR_RECT 102, 36, 18, 7
call_handler_01151:
        mov     al, byte ptr es:[bx+TRK_VELOCITY]
        sub     ah, ah
off_status:
        BC_CALL 02466h
off_status_display:
        BC_STATUS 162, 36, "OFF"
status_off_01166:
        mov     al, byte ptr es:[bx+470h]
        cmp     al, 0
L_0116D:
        je      reset_0117F
        sub     ah, ah
        push    ax
clear_rect_01172:
        BC_CLEAR_RECT 162, 36, 18, 7
call_handler_01179:
        pop     ax
bc_dispatch_0117A:
        BC_CALL 024a2h
reset_0117F:
        BC_PLANE_C
clear_rect_01182:
        BC_CLEAR_RECT 0, 51, 248, 9
close_handler_01189:
        BC_PLANE_A
clear_rect_0118C:
        BC_CLEAR_RECT 0, 51, 248, 9
calls_call_with_check_01193:
        call    calls_check_flags_1d8a_1d8b_0126c
        ret
calls_call_with_check_01197:
        call    call_with_check
        cmp     byte ptr [SEL_TRACK], 3fh
L_0119F:
        jne     L_011A2
        ret
L_011A2:
        cmp     byte ptr [G_TRACK_SOLO], 0
L_011A7:
        call    L_06FA3
        inc     byte ptr [SEL_TRACK]
        mov     byte ptr [G_REC_EVENTS_ADDED], 0
        ret
calls_call_with_check_011b4:
        call    call_with_check
        cmp     byte ptr [SEL_TRACK], 0
L_011BC:
        jne     L_011BF
        ret
L_011BF:
        call    L_06FA3
        dec     byte ptr [SEL_TRACK]
        mov     byte ptr [G_REC_EVENTS_ADDED], 0
        ret
ui_a_011CC:
        BC_UI_A4 42, 2
        mov     al, byte ptr [SEL_SEQ]
        sub     ah, ah
        inc     al
ui_menu_011D8:
        BC_UI_MENU 24, 2
        if      FW_VERSION = 172
L_011DE                         equ     $+1
        endif
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[TBL_0013], 0
        je      L_011F4
        mov     si, 2
        mov     dx, es
status_b_011EE:
        BC_STATUS_B 42, 2, 16
L_011F4:
        ret
L_011F5:
        mov     al, byte ptr [SEQ_TSIG_NUM]
arith_ext_011F8:
        BC_ARITH_EXT 00dd8h
L_011FD:
        mov     al, byte ptr [SEQ_TSIG_DEN]
arith_ext_01200:
        BC_ARITH_EXT 00deah
ext_status_01205:
        ret
        if      FW_VERSION = 172
handler_BC_EXT_STATUS:
        endif
        cmp     byte ptr [B_1D85], 0
L_0120B:
        jne     ext_display
status_a_0120D:
        BC_STATUS_A 60, 13, G_TEMPO_SOURCE_SEQ, D_1506
calls_timer_handler_01216:
        call    timer_handler
ui_a_01219:
        BC_UI_A2 24, 13
ext_status:
        ret
        if      FW_VERSION = 150
handler_BC_EXT_STATUS:
        endif
ext_display:
        if      FW_VERSION = 150
L_01E23                         equ     $+8
        endif
        BC_STATUS 24, 13, "(Ext)"
status_ext_0122a:
        ret
main_screen_bars_field:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ax, word ptr es:[18h]
raw_01233:
        BC_FIELD 216, 22
L_01238:
        ret
main_screen_track_field:
        mov     al, byte ptr [SEL_TRACK]
        sub     ah, ah
        push    ax
        inc     al
ui_menu_01241:
        if      FW_VERSION = 172
L_01247                         equ     $+6
        endif
        BC_UI_MENU 24, 26
        BC_UI_A4 42, 26
        pop     bx
        mov     es, word ptr [CUR_SEQ_SEG]
        test    byte ptr es:[bx+TRK_STATUS], 1
        jne     L_01259
        ret
L_01259:
        shl     bx, 4
        add     bx, 30h
        mov     si, bx
        push    es
        mov     dx, es
status_b_01264:
        BC_STATUS_B 42, 26, 16
        db      07h, 0c3h
L_01E68:
calls_check_flags_1d8a_1d8b_0126c:
        call    check_flags_1d8a_1d8b
L_0126F:
        je      auto_punch_function_is_ac_status_01274
        jmp     L_01326
        if      FW_VERSION = 150
L_01E70:
        endif
auto_punch_function_is_ac_status_01274:
        cmp     byte ptr [P_70F9], 0
auto_punch_function_is_ac_status:
        je      calls_check_status_flag_596c_012b8
auto_punch_status:
        BC_STATUS 0, 51, "Auto punch function is active!!"
softkey_off:
        BC_SOFTKEY 6, BC_SK_BOX,   "OFF"
softkey_off_012a9:
        INT_6B NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_ctrl_0abb9
        db      0c3h
calls_check_status_flag_596c_012b8:
        call    seq_edit_allowed
calls_check_status_flag_596c_012bb:
        je      step_record_mode
calls_check_status_flag_596c_012bd:
        call    seq_edit_allowed
        je      L_012C5
L_012C2:
        call    L_014D3
L_01EC1:
L_012C5:
        cmp     byte ptr [G_NEXT_SEQ], 0ffh
jmp_softkey_tronof_012ca:
        je      step_record_mode
        cmp     byte ptr [G_OPEN_WINDOW_HELD], 0
soft_key_012D1:
        jne     softkey_tr__01313
        jmp     SHORT softkey_tronof
L_01ED1:
step_record_mode:
        if      FW_VERSION = 150
L_01EF8                         equ     $+39
        endif
        BC_SOFTKEY 1, BC_SK_FILL,  "STEP"
event_edit_mode:
        BC_SOFTKEY 2, BC_SK_FILL,  "EDIT"
softkey_tronof:
        BC_SOFTKEY 3, BC_SK_BOX,   "TrONOF"
solo_mode_toggle_alt:
        BC_SOFTKEY 4, BC_SK_BOX,   "SOLO"
softkey_tr:
        BC_SOFTKEY 5, BC_SK_BOX,   "Tr -"
track_select_b:
        BC_SOFTKEY 6, BC_SK_BOX,   "Tr +"
softkey_tr__01313:
        if      FW_VERSION = 172
bc_int6f_0131d                  equ     $+10
        endif
        INT_6B calls_check_status_flag_596c_07974, calls_check_status_flag_596c_0c071, main_screen_tronof, main_screen_solo, calls_call_with_check_011b4, calls_call_with_check_01197
bc_int6f_01321:
        INT_6F L_01559
L_01325:
        ret
L_01326:
        if      FW_VERSION = 150
L_01F23                         equ     $+1
        endif
        cmp     byte ptr [P_70F9], 0
L_0132B:
        je      calls_check_status_flag_596c_012b8
bc_int69_0132d:
        call    punch_in_out_display
bc_int69_01330:
        call    calls_check_flags_1d8a_1d8b_01389
bc_int69_01333:
        INT_69 NULL_HANDLER_OFS
L_01337:
        ret
L_01F34:
punch_in_out_display:
        cmp     byte ptr [G_PUNCH_MODE], 0
L_0133D:
        je      punch_in_point
        cmp     byte ptr [G_PUNCH_MODE], 1
L_01344:
        je      out_display
L_01346:
        call    punch_in_point
status_01349:
        call    out_display
        ret
L_01F49:
punch_in_point:
        BC_STATUS 32, 52, "IN:"
status_in_01356:
        mov     dx, word ptr [G_RANGE_START_BEAT_TICKS]
        mov     ax, word ptr [PUNCH_IN_BAR]
        mov     cx, word ptr [PUNCH_IN_TICK]
range_01361:
        BC_RANGE 50, 52
out_status:
        ret
L_01F63:
out_display:
        BC_STATUS 138, 52, "OUT:"
status_out_01371:
        mov     dx, word ptr [G_RANGE_END_BEAT_TICKS]
        mov     ax, word ptr [PUNCH_OUT_BAR]
        mov     cx, word ptr [PUNCH_OUT_TICK]
range_0137C:
        BC_RANGE 162, 52
bc_int5c_01381:
        ret
calls_check_flags_1d8a_1d8b_01382:
        INT_5C main_screen_idle
calls_check_flags_1d8a_1d8b_01386:
        jmp     NEAR calls_check_flags_1d8a_1d8b_0126c
L_01F85:
calls_check_flags_1d8a_1d8b_01389:
        call    check_flags_1d8a_1d8b
calls_check_status_flag_596c_0138c:
        jne     calls_check_status_flag_596c_0138f
        ret
L_01F8B:
calls_check_status_flag_596c_0138f:
        call    seq_edit_allowed
L_01392:
        jne     L_01395
        ret
L_01395:
        cmp     byte ptr [P_70F9], 0
L_0139A:
        jne     L_0139D
        ret
L_0139D:
        cmp     byte ptr [G_PUNCH_MODE], 0
L_013A2:
        je      br_013EE
        cmp     byte ptr [G_PUNCH_MODE], 1
L_013A9:
        je      br_01411
        mov     ax, word ptr [SEQ_CUR_BAR]
        mov     cx, word ptr [SEQ_BAR_TICK]
        cmp     ax, word ptr [PUNCH_IN_BAR]
        jb      calls_ui__01461_013d0
        db      75h, 06h
        cmp     cx, word ptr [PUNCH_IN_TICK]
        jb      calls_ui__01461_013d0
        if      FW_VERSION = 150
L_013C6:
        endif
        cmp     ax, word ptr [PUNCH_OUT_BAR]
        ja      calls_pad_handler_01434_013e4
        if      FW_VERSION = 172
L_013C6:
        endif
        jne     calls_pad_handler_01434_013da
        cmp     cx, word ptr [PUNCH_OUT_TICK]
        ja      calls_pad_handler_01434_013e4
        jmp     SHORT calls_pad_handler_01434_013da
CALLS_PAD_HANDLER_01434_013E4_V150:
calls_ui__01461_013d0:
        call    ui__01461
calls_pad_handler_01443_013d3:
        call    clear_rect_01443
calls_pad_handler_01452_013d6:
        call    clear_rect_01452
        ret
calls_pad_handler_01434_013da:
        call    clear_rect_01434
calls_ui__01487_013dd:
        call    ui__01487
calls_pad_handler_01452_013e0:
        call    clear_rect_01452
        ret
calls_pad_handler_01434_013e4:
        call    clear_rect_01434
calls_pad_handler_01443_013e7:
        call    clear_rect_01443
calls_ui__014_013ea:
        call    ui__014AD
        ret
br_013EE:
        mov     ax, word ptr [SEQ_CUR_BAR]
        mov     cx, word ptr [SEQ_BAR_TICK]
        cmp     ax, word ptr [PUNCH_IN_BAR]
        jb      calls_ui__01461_01403
        jne     calls_pad_handler_01434_0140a
        cmp     cx, word ptr [PUNCH_IN_TICK]
        jae     calls_pad_handler_01434_0140a
calls_ui__01461_01403:
        call    ui__01461
calls_pad_handler_01443_01406:
        call    clear_rect_01443
        ret
calls_pad_handler_01434_0140a:
        call    clear_rect_01434
calls_ui__01487_0140d:
        call    ui__01487
        ret
br_01411:
        mov     ax, word ptr [SEQ_CUR_BAR]
        mov     cx, word ptr [SEQ_BAR_TICK]
        cmp     ax, word ptr [PUNCH_OUT_BAR]
        ja      calls_pad_handler_01443_0142d
        jne     calls_ui__01487_01426
        cmp     cx, word ptr [PUNCH_OUT_TICK]
        ja      calls_pad_handler_01443_0142d
calls_ui__01487_01426:
        call    ui__01487
calls_pad_handler_01452_01429:
        call    clear_rect_01452
        ret
calls_pad_handler_01443_0142d:
        call    clear_rect_01443
calls_ui__014_01430:
        call    ui__014AD
        ret
clear_rect_01434:
        BC_CLEAR_RECT 0, 52, 30, 7
ui__0143B:
        BC_UI_5C 0, 52, 30, 7
L_01442:
        ret
clear_rect_01443:
        BC_CLEAR_RECT 105, 52, 30, 7
ui__0144A:
        BC_UI_5C 105, 52, 30, 7
L_01451:
        ret
clear_rect_01452:
        BC_CLEAR_RECT 217, 52, 30, 7
ui__01459:
        BC_UI_5C 217, 52, 30, 7
L_01460:
        ret
ui__01461:
        PANE_BOTROW_DITHER_L
L_01486:
        ret
ui__01487:
        PANE_BOTROW_DITHER_M
L_014AC:
        ret
ui__014AD:
        PANE_BOTROW_DITHER_R
L_014D2:
        ret
L_014D3:
        mov     al, byte ptr [G_NEXT_SEQ]
        inc     al
        if      FW_VERSION = 172
L_014D8:
        endif
        jne     L_014DB
        ret
        if      FW_VERSION = 150
L_014D8:
        endif
L_014DB:
        cmp     byte ptr [B_14D3], 0
L_014E0:
        jne     reset_0155F
        cmp     byte ptr [G_OPEN_WINDOW_HELD], 0
        jne     reset_0150C
reset_014E9:
        BC_PLANE_C
next_sq_status_014EC:
        BC_UI_5E 51, 51, 13, 9
next_sq_status:
        BC_PLANE_A
next_display:
        BC_STATUS 4, 52, "Next Sq:"
        db      2ah, 0e4h
jump__01506:
        BC_JUMP_3C 03434h
bc_target_0150b:
        ret
reset_0150C:
        SCR_NEXT_SQ_BAR
        db      2ah, 0e4h
jump__01537:
        BC_JUMP_3C 03434h
status_display_153C:
        BC_STATUS 64, 52, "-"
        db      0feh, 0c8h, 9ah
        dw      far_wrapper_19743
        dw      CS1_SEG
        db      0beh, 02h, 00h, 8ch, 0c2h
status_b_0154F:
        BC_STATUS_B 70, 52, 16
close_handler_01555:
        BC_PLANE_A
L_01558:
        ret
L_01559:
        mov     byte ptr [G_POS_REDRAW_REQ], 1
        ret
reset_0155F:
        BC_PLANE_C
next_sequence_status_01562:
        BC_UI_5E 87, 51, 115, 9
next_sequence_status:
        BC_PLANE_A
next_sequence_display:
        BC_STATUS 4, 52, "Next Sequence:"
        db      2ah, 0e4h
jump__01582:
        BC_JUMP_3C 03458h
status_display_1587:
        BC_STATUS 100, 52, "-"
        db      0feh, 0c8h, 9ah
        dw      far_wrapper_19743
        dw      CS1_SEG
        db      0beh, 02h, 00h, 8ch, 0c2h
status_b_0159A:
        BC_STATUS_B 106, 52, 16
close_handler_015A0:
        BC_PLANE_A
L_015A3:
        ret
L_021A0:
L_015A4:
        mov     byte ptr [G_POS_REDRAW_REQ], 1
        ret
L_015AA:
        if      FW_VERSION = 172
        mov     ax, cs
        cmp     ax, word ptr [D_0E46]
L_015B0:
        je      L_015B3
        ret
L_015B3:
        mov     word ptr [D_0ED0], L_015CD
        xor     byte ptr [B_14CF], 1
        cmp     byte ptr [B_14CF], 0
L_015C3:
        jne     L_015C6
        ret
L_015C6:
        mov     word ptr [W_0DC8], calls_check_status_flag_596c_015eb
L_015CC:
        ret
L_015CD:
        mov     ax, cs
        cmp     ax, word ptr [D_0E46]
L_015D3:
        je      L_015D6
        else
        mov     byte ptr [B_14CF], 1
        endif
        ret
L_015D6:
        mov     byte ptr [B_14CF], 0
mode_015DB:
        BC_MODE
        if      FW_VERSION = 172
        db      0c7h
L_015DF:
        push    es
        enter   -3ff3h, 0eh
        mov     word ptr [D_0ED0], NULL_HANDLER_OFS
        ret
calls_check_status_flag_596c_015eb:
        call    seq_edit_allowed
L_015EE:
        jne     calls_check_status_flag_596c_015f1
        ret
calls_check_status_flag_596c_015f1:
        mov     word ptr [D_0ED0], NULL_HANDLER_OFS
        mov     word ptr [W_0DC8], NULL_HANDLER_OFS
        endif
        ret
calls_check_status_flag_596c_015fe:
        call    seq_edit_allowed
calls_check_flags_1d8a_1d8b_01601:
        jne     calls_check_flags_1d8a_1d8b_01606
        jmp     L_0D32C
L_021BD:
calls_check_flags_1d8a_1d8b_01606:
        call    check_flags_1d8a_1d8b
L_01609:
        jne     L_0160C
        ret
L_0160C:
        mov     byte ptr [G_TAP_HELD], 1
        ret
L_01612:
        mov     byte ptr [G_TAP_HELD], 0
        if      FW_VERSION = 172
mode_01617:
        endif
        BC_MODE
        db      0c3h
main_screen_idle:
        cmp     byte ptr [B_14D3], 0
L_01620:
        je      L_01625
        jmp     NEAR L_01755
L_021DC:
L_01625:
        call    main_screen_redraw_if_dirty
L_01628:
        call    calls_check_flags_1d8a_1d8b_01389
L_0162B:
        call    main_screen_time_update_if_pending
L_021E5:
        ret
L_021E6:
main_screen_redraw_if_dirty:
        sub     ax, ax
        xchg    byte ptr [G_POS_REDRAW_REQ], al
        cmp     al, 0
L_01637:
        jne     L_0163A
        ret
L_021F1:
L_0163A:
        cmp     byte ptr [SEQ_LOOP_JUMP_STATE], 0
L_0163F:
        jne     L_0167D
close_handler_01641:
        BC_PLANE_A
L_01644:
        sub     ax, ax
        xchg    byte ptr [B_1D83], al
        cmp     al, 0
        je      calls_cursor_handler_01651
ext_status_0164E:
        if      FW_VERSION = 172
        call    handler_BC_EXT_STATUS
        else
        call    ext_status_01205+1
mode_01617:
        endif
calls_cursor_handler_01651:
        cmp     byte ptr [SEQ_LOOP_JUMP_STATE], 0
calls_cursor_handler_01656:
        jne     L_0167D
calls_cursor_handler_01658:
        call    cursor_handler
L_0165B:
        call    L_011F5
L_0165E:
        call    main_screen_note_repeat_hint
        cmp     byte ptr [G_REC_EVENTS_ADDED], 1
        jne     L_01673
        call    L_0674A
L_0166B:
        call    main_screen_track_field
        mov     byte ptr [G_REC_EVENTS_ADDED], 2
L_0222A:
L_01673:
        cmp     byte ptr [SEQ_LOOP_JUMP_STATE], 0
L_01678:
        jne     L_0167D
lcd_coord_0167A:
        BC_FLUSH
L_0167D:
        ret
L_02235:
main_screen_note_repeat_hint:
        cmp     byte ptr [B_1D84], 0
L_01683:
        jne     L_01686
        ret
L_0223D:
L_01686:
        cmp     byte ptr [G_TC_NOTE_VALUE], 0
L_0168B:
        je      L_016BC
        cmp     byte ptr [B_14CF], 0
L_01692:
        je      L_016BC
seq_nav_0224B:
seq_nav_01694:
        BC_SEQ_NAV "      (Hold pads or Keys to repeat)"
L_016BB:
        ret
L_016BC:
        cmp     byte ptr [G_TAP_HELD], 0
L_016C1:
        jne     seq_nav_016C4
        ret
seq_nav_016C4:
        if      FW_VERSION = 150
seq_nav_0227B:
L_0227F                         equ     $+4
        endif
        BC_SEQ_NAV "      (Hold pads or Keys to erase) "
calls_check_flags_1d8a_1d8b_016eb:
        ret
calls_check_flags_1d8a_1d8b_016ec:
        call    check_flags_1d8a_1d8b
L_016EF:
        jne     L_016F2
        ret
L_016F2:
        cmp     byte ptr [G_SEQ_MEM_FULL], 0
calls_mode_03248_016f7:
        jne     calls_mode_03248_016fa
        ret
calls_mode_03248_016fa:
        call    mode_03248
        nop
        push    cs
L_016FF:
        call    panel_leds_update_far
        mov     byte ptr [G_SEQ_MEM_FULL], 0
        mov     al, byte ptr [B_14D1]
        or      al, byte ptr [B_14D2]
calls_init_with_int50_0170e:
        jne     print_01713
        if      FW_VERSION = 172
        db      0e9h, 0c0h, 0c9h
        else
        db      0e9h
        db      0e1h, 0c6h
        endif
print_01713:
        call    main_screen_enter
insufficient_memory_msg:
        call    system_call
print_insufficient_memory:
        if      FW_VERSION = 150
L_022D9                         equ     $+9
        endif
        BC_PRINT "    Insufficient Memory !!  "
print_insufficient_memory_01739:
        call    delay_loop
        if      FW_VERSION = 172
        db      0e9h, 94h, 0c9h
        else
        db      0e9h
        db      0b5h, 0c6h
        endif
main_screen_time_update_if_pending:
        cmp     byte ptr [B_14CE], 0
L_01744:
        jne     calls_time_convert_01747
        ret
calls_time_convert_01747:
        mov     byte ptr [B_14CE], 0
calls_time_convert_0174c:
        call    time_convert
        mov     byte ptr [UI_REDRAW_REQ], 1
        ret
L_01755:
        call    main_screen_time_update_if_pending
        sub     ax, ax
        xchg    byte ptr [G_POS_REDRAW_REQ], al
        cmp     al, 0
L_01760:
        jne     L_01763
        ret
L_01763:
        cmp     byte ptr [SEQ_LOOP_JUMP_STATE], 0
L_01768:
        je      close_handler_0176B
        ret
close_handler_0176B:
        BC_PLANE_A
L_0176E:
        call    cursor_handler
lcd_coord_01771:
        BC_FLUSH
L_01774:
        ret
seq_edit_allowed:
        cmp     byte ptr [G_STEP_EDIT_ACTIVE], 1
L_0177A:
        jne     br_0177D
        ret
br_0177D:
        push    ax
        mov     al, byte ptr [SEQ_RUNNING]
        or      al, byte ptr [SEQ_REC_ARMED]
        or      al, byte ptr [SEQ_ODUB_ARMED]
        pop     ax
        ret
calls_cursor_handler_0178b:
        call    cursor_handler
        retf
cursor_handler:
        call    status_017A5
        cmp     byte ptr [B_14D3], 0
        if      FW_VERSION = 172
L_01797:
        endif
        je      L_0179A
        if      FW_VERSION = 150
L_01797:
        endif
        ret
L_02351:
L_0179A:
        cmp     byte ptr [G_SONG_MODE], 0
        jne     L_017A4
L_017A1:
        call    main_screen_bars_field
L_0235B:
L_017A4:
        ret
status_017A5:
        cmp     byte ptr [B_0B28], 0
status_017AA_status:
        jne     time_display_bars
L_02363:
status_display_02363:
status_display_17AC:
        BC_STATUS 192, 1, "   .  .  "
range_017BB:
        mov     ax, word ptr [SEQ_CUR_BAR]
        mov     cx, word ptr [SEQ_BAR_TICK]
        mov     dl, byte ptr [SEQ_BEAT_TICKS]
h_m_s_status_017C6:
        BC_RANGE 192, 1
h_m_s_status:
        ret
L_02383:
time_display_bars:
        BC_STATUS 192, 1, "  H  M  S"
status_h__m__s_017db:
        cmp     byte ptr [G_SYNC_OUT_MODE], 2
        jb      L_017E9
        cmp     byte ptr [SEQ_RUNNING], 0
        jne     L_017EE
L_017E9:
        callf   CS1_SEG:P_63E9
L_017EE:
        cli
        mov     ax, word ptr [SMPTE_HOUR]
        mov     bx, word ptr [SMPTE_SEC]
        mov     cl, byte ptr [SMPTE_SUBFRAME]
        sti
        and     al, 1fh
ui_menu_017FD:
        BC_UI_MENU 192, 1
        db      8ah
L_01803:
        db      0c4h
ui_menu_01804:
        BC_UI_MENU 210, 1
        db      8ah
L_0180A:
        ret
ui_menu_0180B:
        BC_UI_MENU 228, 1
        db      8ah
L_01811:
        mov.l   bx, 1e8h
        add.d0  bl, cl
L_023CE:
status_01817:
        cmp     byte ptr [B_0B28], 0
status_0181C_status:
        jne     status_display_1831
status_display_023D5:
status_display_181E:
        BC_STATUS 192, 1, "---.--.--"
lcd_coord_0182D:
        BC_FLUSH
h_m_s_1_status_01830:
        ret
status_display_1831:
status_display_023E8:
        BC_STATUS 192, 1, "--H--M--S"
lcd_coord_01840:
        BC_FLUSH
L_01843:
        ret
L_01844:
        mov     bp, D_0BC8
        callf   CS1_SEG:TIME_ACCUM_HOURS_FAR_OFS
        mov     word ptr [SEQ_START_TIME_LO], di
        mov     word ptr [SEQ_START_TIME_HI], si
        ret
main_screen_solo:
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[TBL_0013], 0
L_0185F:
        jne     calls_solo_status_018_01862
        ret
calls_solo_status_018_01862:
        xor     byte ptr [G_TRACK_SOLO], 1
calls_solo_status_018_01867:
        call    solo_status_018B0
        cmp     byte ptr [G_TRACK_SOLO], 0
L_0186F:
        jne     L_01872
        ret
L_01872:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bx, 0
loop_01879:
        push    bx
        push    si
        push    es
        cmp     bl, byte ptr [SEL_TRACK]
        je      L_018A5
        mov     ch, byte ptr es:[bx+TRK_CHANNEL]
        and     ch, 0bfh
        mov     dx, 40h
        mov     ah, 0b0h
        mov     al, 40h
        mov     cl, 0
        cli
        callf   CS1_SEG:MIDI_EVENT_ROUTE_OFS
        mov     ah, 0b0h
        mov     al, 7bh
        mov     cl, 0
        callf   CS1_SEG:MIDI_EVENT_ROUTE_OFS
        sti
L_018A5:
        pop     es
        pop     si
        pop     bx
        inc     bl
L_018AA:
        cmp     bl, 40h
        jne     loop_01879
        ret
solo_status_018B0:
        call    L_009F4
        cmp     byte ptr [P_70F9], 0
        db      75h, 11h
        cmp     byte ptr [G_TRACK_SOLO], 0
        db      74h, 0ah
        mov     ax, 190h
solo_status:
        if      FW_VERSION = 172
        call    handler_BC_CODE_COPY_EXEC
        int 3
        sbb.d0  bh, dl
        sbb.d0  bl, al
        else
        db      0e8h
        db      09h, 0e7h
        sbb     word ptr [bx+si], -72h
        db      18h, 0c3h
        endif
solo_display:
        BC_STATUS 133, 52, "SOLO"
status_solo_018d6:
        ret
clear_rect_018D7:
        BC_CLEAR_RECT 126, 52, 37, 7
handler_BC_NOP_AA:
        ret
        if      FW_VERSION = 172
handler_BC_CODE_COPY_EXEC:
        mov     cx, 2
        mov     word ptr [G_BLINK_PERIOD], ax
        mov     byte ptr [G_BLINK_ENABLE], 1
        mov     di, D_0E38
        pop     si
        mov     dx, ds
        mov     ax, cs
        mov     bx, ds
        mov     es, bx
L_018F6:
        mov     ds, ax
jmp_si_018f8:
        movsw
        stosw
        loop    jmp_si_018f8
        mov     ds, dx
        jmp     si
        endif
main_screen_tronof:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bl, byte ptr [SEL_TRACK]
        mov     bh, 0
        mov     ch, byte ptr es:[bx+430h]
        xor     byte ptr es:[bx+430h], 80h
calls_file_operation_01915:
        call    midi_route_sustain_off
calls_file_operation_01918:
        call    track_mark_used
        ret
dispatch_int6d_6e:
        INT_6D init_state, init_state, init_state, init_state, init_state
L_01928:
        if      FW_VERSION = 150
error_disk_read                 equ     $+9
        endif
        INT_6E transport_thunk_rec, calls_init_state_0193b, calls_init_state_01941, calls_init_state_01947, calls_init_state_0194d
calls_init_state_01934:
        ret
transport_thunk_rec:
        call    init_state
        jmp     transport_handler_rec
calls_init_state_0193b:
        call    init_state
        jmp     transport_handler_over_dub
calls_init_state_01941:
        call    init_state
        jmp     transport_handler_stop
calls_init_state_01947:
        call    init_state
        jmp     transport_handler_play
calls_init_state_0194d:
        call    init_state
        jmp     transport_handler_play_start
time_convert:
        call    seq_edit_allowed
L_01956:
        je      ui_ctrl_0195b
        jmp     ui_ctrl_01aab
ui_ctrl_0195b:
        mov     byte ptr [G_NEXT_SEQ], 0ffh
ui_time_convert_960:
        BC_UI_CTRL 23, 1, 116, 9
bc_int6c_01967:
        INT_6C NULL_HANDLER_OFS, main_screen_now_field, NULL_HANDLER_OFS, main_screen_tempo_field
bc_int5d_01971:
        INT_5B calls_check_status_flag_596c_01cab
bc_int5d_01975:
        INT_5D system_call
L_01979:
        mov     ax, ds
        mov     es, ax
        mov     bp, ui_time_convert_960
        mov     ax, D_14D7
        mov     bx, calls_check_status_flag_596c_019e0
        mov     cx, 62h
        mov     dx, 0
        call    set_mode_flag_1
bc_int6a_0198f:
        INT_6A calls_check_status_flag_596c_01996, calls_check_status_flag_596c_019ba
calls_check_status_flag_596c_01995:
        ret
calls_check_status_flag_596c_01996:
        if      FW_VERSION = 172
        mov     byte ptr [P_70F9], 0
        endif
calls_check_status_flag_596c_0199b:
        call    seq_edit_allowed
tgt_0199E:
        jne     L_019B2
        add     al, byte ptr [SEL_SEQ]
        jae     br_019A8
        mov     al, 62h
br_019A8:
        cmp     al, 62h
        jb      L_019AE
        mov     al, 62h
L_019AE:
        call    calls_input_handler_019e5
        ret
L_019B2:
        push    ax
L_019B3:
        call    ui_ctrl_01aab
        pop     ax
        jmp     main_screen_sq_inc
calls_check_status_flag_596c_019ba:
        if      FW_VERSION = 172
        mov     byte ptr [P_70F9], 0
        endif
calls_check_status_flag_596c_019bf:
        call    seq_edit_allowed
tgt_019C2:
        jne     L_019D8
        mov     ah, al
        mov     al, byte ptr [SEL_SEQ]
        cmp     al, 0
        jne     br_019CE
        ret
br_019CE:
        sub     al, ah
        jae     L_019D4
        mov     al, 0
L_019D4:
        call    calls_input_handler_019e5
        ret
L_019D8:
        push    ax
calls_check_status_flag_596c_019d9:
        call    ui_ctrl_01aab
        pop     ax
        jmp     main_screen_sq_dec
calls_check_status_flag_596c_019e0:
        call    seq_edit_allowed
calls_input_handler_019e3:
        jne     L_019F4
calls_input_handler_019e5:
        mov     byte ptr [SEL_SEQ], al
calls_input_handler_019e8:
        call    input_handler
L_019EB:
        call    seq_send_track_program_changes
        callf   CS1_SEG:P_60B0
        ret
L_019F4:
        push    ax
calls_check_status_flag_596c_019f5:
        call    ui_ctrl_01aab
        pop     ax
        jmp     calls_check_flags_1d8a_1d8b_01b67
input_handler:
        call    seq_edit_allowed
L_019FF:
        jne     L_019F4
        push    ax
        callf   CS1_SEG:seq_edit_end_far
        callf   CS1_SEG:undo_seq_discard_far
        mov     word ptr [G_SEQ_MEM_RESERVE], 0f78h
        pop     ax
calls_process_input_01a13:
        call    process_input
calls_check_and_call_01a16:
        call    main_screen_install_transport_handlers
        cmp     byte ptr [G_SYNC_IN_MODE], 0
        je      L_01A23
calls_check_and_call_01a20:
        call    check_and_call
L_01A23:
        ret
process_input:
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        mov     word ptr [CUR_SEQ_SEG], es
        cmp     byte ptr [G_SONG_MODE], 0
        jne     L_01A46
        mov     si, 21h
        mov     di, D_0BC8
        mov     cx, 5
tgt_01A3D:
        mov     al, byte ptr es:[si]
        mov     byte ptr [di], al
        inc     si
        inc     di
        loop    tgt_01A3D
L_01A46:
        callf   CS1_SEG:P_71B5
        mov     byte ptr [G_NEXT_SEQ], 0ffh
L_01A50:
        call    L_01844
        call    L_0AC61
        if      FW_VERSION = 172
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     word ptr [D_0C15], 0
        mov     ax, word ptr es:[18h]
        mov     word ptr [D_0C17], ax
        endif
        ret
seq_send_track_program_changes:
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[TBL_0013], 0
L_01A72:
        jne     L_01A75
        ret
L_01A75:
        mov     bx, 0
loop_01A78:
        push    bx
        test    byte ptr es:[bx+TRK_STATUS], 1
        je      L_01AA2
        mov     ch, byte ptr es:[bx+TRK_CHANNEL]
        test    ch, 80h
        je      L_01AA2
        mov     al, byte ptr es:[bx+470h]
        sub     al, 1
        jb      L_01AA2
        mov     ah, 0c0h
        mov     cl, 0
        mov     dx, 40h
        cli
        callf   CS1_SEG:MIDI_EVENT_ROUTE_OFS
        sti
L_01AA2:
        pop     bx
        inc     bl
L_01AA5:
        cmp     bl, 40h
        jne     loop_01A78
        ret
ui_ctrl_01aab:
        mov     al, byte ptr [SEL_SEQ]
        mov     byte ptr [G_NEXT_SEQ], 0ffh
ui_process_input_ab3:
        BC_UI_CTRL 23, 1, 116, 9
bc_int6c_01aba:
        INT_6C NULL_HANDLER_OFS, main_screen_now_field, NULL_HANDLER_OFS, main_screen_tempo_field
bc_int5d_01ac4:
        INT_5B calls_check_status_flag_596c_01cab
bc_int5d_01ac8:
        INT_5D system_call
L_01ACC:
        mov     ax, ds
        mov     es, ax
        mov     bp, ui_ctrl_01aab
        mov     ax, D_14D7
        mov     bx, calls_check_flags_1d8a_1d8b_01b67
        mov     cx, 62h
        mov     dx, 0
        call    set_mode_flag_1
bc_int6a_01ae2:
        INT_6A main_screen_sq_inc, main_screen_sq_dec
L_01AE8:
        ret
main_screen_sq_inc:
        cmp     byte ptr [P_70F9], 0
calls_check_flags_1d8a_1d8b_01aee:
        je      calls_check_flags_1d8a_1d8b_01af1
        ret
calls_check_flags_1d8a_1d8b_01af1:
        call    check_flags_1d8a_1d8b
calls_check_status_flag_596c_01af4:
        je      calls_check_status_flag_596c_01af7
        ret
calls_check_status_flag_596c_01af7:
        call    seq_edit_allowed
tgt_01AFA:
        je      calls_time_convert_01b21
        mov     al, byte ptr [G_NEXT_SEQ]
        cmp     al, 0ffh
        jne     loop_01B06
        mov     al, byte ptr [SEL_SEQ]
loop_01B06:
        inc     al
        cmp     al, 63h
        jb      L_01B0D
        ret
L_01B0D:
        cmp     al, byte ptr [SEL_SEQ]
L_01B11:
        jne     L_01B14
        ret
L_01B14:
        push    ax
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        pop     ax
        jb      loop_01B06
L_01B1D:
        call    calls_ui_1b92_01b83
        ret
calls_time_convert_01b21:
        push    ax
calls_time_convert_01b22:
        call    time_convert
        pop     ax
        jmp     calls_check_status_flag_596c_01996
main_screen_sq_dec:
        cmp     byte ptr [P_70F9], 0
calls_check_flags_1d8a_1d8b_01b2e:
        je      calls_check_flags_1d8a_1d8b_01b31
        ret
calls_check_flags_1d8a_1d8b_01b31:
        call    check_flags_1d8a_1d8b
calls_check_status_flag_596c_01b34:
        je      calls_check_status_flag_596c_01b37
        ret
calls_check_status_flag_596c_01b37:
        call    seq_edit_allowed
tgt_01B3A:
        je      calls_time_convert_01b5f
        mov     al, byte ptr [G_NEXT_SEQ]
        cmp     al, 0ffh
        jne     loop_01B46
        mov     al, byte ptr [SEL_SEQ]
loop_01B46:
        sub     al, 1
        jae     L_01B4B
        ret
L_01B4B:
        cmp     al, byte ptr [SEL_SEQ]
L_01B4F:
        jne     L_01B52
        ret
L_01B52:
        push    ax
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        pop     ax
        jb      loop_01B46
L_01B5B:
        call    calls_ui_1b92_01b83
        ret
calls_time_convert_01b5f:
        push    ax
calls_time_convert_01b60:
        call    time_convert
        pop     ax
        jmp     calls_check_status_flag_596c_019ba
calls_check_flags_1d8a_1d8b_01b67:
        call    check_flags_1d8a_1d8b
calls_check_status_flag_596c_01b6a:
        je      calls_check_status_flag_596c_01b6d
        ret
calls_check_status_flag_596c_01b6d:
        call    seq_edit_allowed
seq_edit_01B70:
        je      calls_time_convert_01b8a
        db      3ah, 06h
handler_BC_SEQ_EDIT:
        and     byte ptr [bp+di], cl
L_01B76:
        jne     L_01B79
        ret
L_01B79:
        push    ax
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        pop     ax
L_01B80:
        jae     calls_ui_1b92_01b83
        ret
calls_ui_1b92_01b83:
        mov     byte ptr [G_NEXT_SEQ], al
calls_ui_1b92_01b86:
        call    ui_process_input_b92
calls_time_convert_01b89:
        ret
calls_time_convert_01b8a:
        push    ax
calls_time_convert_01b8b:
        call    time_convert
        pop     ax
        jmp     calls_check_status_flag_596c_019e0
ui_process_input_b92:
        BC_UI_CTRL 51, 51, 13, 9
ui_ctrl_01b99:
        cmp     byte ptr [B_14D3], 0
ui_ctrl_01b9e:
        je      bc_int6c_01ba7
ui_process_input_ba0:
        BC_UI_CTRL 87, 51, 13, 9
bc_int6c_01ba7:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS
bc_int5d_01bb1:
        INT_5B calls_check_status_flag_596c_01cab
bc_int5d_01bb5:
        INT_5D system_call
L_01BB9:
        mov     ax, ds
        mov     es, ax
        mov     bp, ui_process_input_b92
        mov     ax, D_14D7
        mov     bx, L_01C28
        mov     cx, 62h
        mov     dx, 0
        call    set_mode_flag_1
calls_check_flags_1d8a_1d8b_01bcf:
        INT_6A calls_check_flags_1d8a_1d8b_01bd6, calls_check_flags_1d8a_1d8b_01bff
calls_check_flags_1d8a_1d8b_01bd5:
        ret
calls_check_flags_1d8a_1d8b_01bd6:
        call    check_flags_1d8a_1d8b
L_01BD9:
        je      L_01BDC
        ret
L_01BDC:
        mov     al, byte ptr [G_NEXT_SEQ]
L_01BDF:
        inc     al
        jne     L_01BE4
        ret
L_01BE4:
        cmp     al, 63h
        jb      L_01BE9
        ret
L_01BE9:
        cmp     al, byte ptr [SEL_SEQ]
L_01BED:
        jne     L_01BF2
        jmp     NEAR ui_ctrl_01aab
L_01BF2:
        push    ax
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        pop     ax
        jb      L_01BDF
calls_check_flags_1d8a_1d8b_01bfb:
        call    calls_check_and_call_01c41
        ret
calls_check_flags_1d8a_1d8b_01bff:
        call    check_flags_1d8a_1d8b
L_01C02:
        je      L_01C05
        ret
L_01C05:
        mov     al, byte ptr [G_NEXT_SEQ]
        cmp     al, 0ffh
error_scsi_write_sys:
        jne     L_01C0D
        ret
L_01C0D:
        sub     al, 1
        jae     L_01C12
        ret
L_01C12:
        cmp     al, byte ptr [SEL_SEQ]
L_01C16:
        jne     L_01C1B
        jmp     NEAR ui_ctrl_01aab
L_01C1B:
        push    ax
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        pop     ax
        jb      L_01C0D
L_01C24:
        call    calls_check_and_call_01c41
        ret
L_01C28:
        call    check_flags_1d8a_1d8b
        je      error_scsi_not_ready_sys
        ret
error_scsi_not_ready_sys:
        cmp     al, byte ptr [SEL_SEQ]
L_01C32:
        jne     L_01C37
        jmp     NEAR ui_ctrl_01aab
L_01C37:
        push    ax
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        pop     ax
L_01C3E:
        jae     calls_check_and_call_01c41
        ret
calls_check_and_call_01c41:
        mov     byte ptr [G_NEXT_SEQ], al
        ret
calls_check_and_call_01c45:
        call    check_and_call
        retf
check_and_call:
        mov     es, word ptr [CUR_SEQ_SEG]
        if      FW_VERSION = 172
error_scsi_disk_change_sys      equ     $+2
        endif
        cmp     byte ptr es:[TBL_0013], 0
        jne     L_01C56
        ret
L_01C56:
        cmp     byte ptr [P_2081], 0
L_01C5B:
        je      calls_wait_loop_01c5e
        ret
calls_wait_loop_01c5e:
        push    ax
calls_wait_loop_01c5f:
        call    wait_loop
        callf   CS1_SEG:seq_edit_begin_far
        callf   CS1_SEG:P_7241
        call    main_screen_install_transport_handlers
        call    timer_handler
        callf   CS1_SEG:P_71B5
seq_init_01C77:
        BC_SEQ_INIT
calls_call_with_check_01c7a:
        pop     ax
        ret
calls_call_with_check_01c7c:
        call    call_with_check
        retf
call_with_check:
        call    check_es_flag_13
calls_pusha_01c83:
        jne     check_and_call
        pusha
        callf   CS1_SEG:seq_create_new_far
        mov     al, byte ptr [SEL_SEQ]
calls_process_input_01c8e:
        call    process_input
calls_check_and_call_01c91:
        call    check_and_call
        popa
        ret
check_es_flag_13:
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[TBL_0013], 0
        ret
check_flags_1d8a_1d8b:
        push    ax
        mov     al, byte ptr [SEQ_REC_ARMED]
        or      al, byte ptr [SEQ_ODUB_ARMED]
        pop     ax
        ret
calls_check_status_flag_596c_01cab:
        call    seq_edit_allowed
L_01CAE:
        je      br_01CB1
        ret
br_01CB1:
        callf   CS1_SEG:seq_edit_end_far
        callf   CS1_SEG:undo_seq_discard_far
        callf   CS1_SEG:SEQUENCE_DIALOG_OFS
        call    sequence_window_name_field
        ret
sequence_window_name_field:
        call    bc_int5b_01d31
        mov     si, 2
        mov     dx, ds
status_b_01CCC:
        BC_STATUS_B 116, 29, 16
bc_int63_01cd2:
        INT_63 bc_int62_01d4d
L_01CD6:
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[TBL_0013], 0
        je      bc_int6a_01d04
        mov     si, 2
        mov     cl, 74h
        mov     ch, 10h
        int     42h
        ret
sequence_window_name_display:
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[TBL_0013], 0
L_01CF6:
        je      bc_int6a_01d04
        mov     si, 2
        mov     dx, es
status_b_01CFD:
        BC_STATUS_B 116, 16, 16
        db      0c3h
L_0287F:
bc_int6a_01d04:
        INT_6A calls_call_with_check_01d27, calls_call_with_check_01d27
bc_int61_01d0a:
        INT_61 calls_call_with_check_01d27
L_01D0E:
        mov     word ptr [UI_SLOT_DIGIT], calls_call_with_check_01d27
        mov     word ptr [UI_SLOT_PAD_HIT], calls_call_with_check_01d27
ui_a_01D1A:
        BC_UI_A4 116, 16
        BC_UI_CTRL 115, 15, 7, 9
        db      0c3h
calls_call_with_check_01d27:
        call    call_with_check
        callf   CS1_SEG:seq_edit_end_far
        jmp     SHORT sequence_window_name_field
bc_int5b_01d31:
        int     50h
bc_int5b_01d33:
        INT_5B main_screen_enter
bc_int67_68_01d37:
        mov     word ptr [W_0DC4], main_screen_enter
bc_int67_68_01d3d:
        INT_65 bc_int66_01d69
calls_dispatch_int6d_6e_01d41:
        INT_67 main_screen_enter
calls_dispatch_int6d_6e_01d45:
        INT_68 sequence_window_copy
calls_dispatch_int6d_6e_01d49:
        call    dispatch_int6d_6e
        ret
bc_int62_01d4d:
        call    bc_int5b_01d31
bc_int62_01d50:
        call    sequence_window_name_display
bc_int62_01d53:
        INT_62 ui_a_011CC
L_01D57:
        mov     ax, ds
        mov     es, ax
        mov     si, 2
        mov     cl, 74h
        mov     ch, 1dh
        int     42h
bc_int62_01d64:
        INT_62 sequence_window_name_field
L_01D68:
        ret
bc_int66_01d69:
        callf   CS1_SEG:delete_sequence_dialog_1CAED
bc_int67_68_01d6e:
        int     50h
bc_int67_68_01d70:
        INT_66 bc_int5b_01d95
bc_int5b_01d74:
        INT_67 select_01D85
bc_int5d_01d78:
        INT_68 delete_sequence_do_it
bc_int5d_01d7c:
        INT_5B select_01D85
calls_init_with_int50_01d80:
        INT_5D delete_sequence_refresh
calls_init_with_int50_01d84:
        ret
select_01D85:
        call    main_screen_enter
        if      FW_VERSION = 172
handler_BC_SELECT               equ     $+4
        endif
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
calls_system_call_01d8e:
        call    system_call
L_01D91:
        call    calls_check_status_flag_596c_01cab
        ret
bc_int5b_01d95:
        callf   CS1_SEG:delete_all_sequences_dialog_1CB6F
bc_int5b_01d9a:
        int     50h
bc_int5b_01d9c:
        INT_5B bc_int66_01d69
bc_int67_68_01da0:
        INT_67 bc_int66_01d69
bc_int67_68_01da4:
        INT_68 calls_input_handler_01da9
L_01DA8:
        ret
calls_input_handler_01da9:
        callf   CS1_SEG:seq_delete_all_far
        mov     al, 0
calls_input_handler_01db0:
        call    input_handler
        jmp     main_screen_enter
delete_sequence_do_it:
        callf   CS1_SEG:seq_edit_end_far
        mov     al, byte ptr [SEL_SEQ]
        callf   CS1_SEG:seq_delete_far
        mov     al, byte ptr [SEL_SEQ]
calls_input_handler_01dc6:
        call    input_handler
        jmp     main_screen_enter
delete_sequence_refresh:
        mov     al, byte ptr [SEL_SEQ]
        sub     ah, ah
        push    ax
        inc     al
ui_menu_01DD4:
        BC_UI_MENU 88, 17
        db      58h
L_01DDA:
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        mov     si, 2
        mov     dx, es
status_b_01DE4:
        BC_STATUS_B 106, 17, 16
        db      0c3h
sequence_window_copy:
        callf   CS1_SEG:seq_find_free_slot_far
        mov     byte ptr [COPY_SEQ_DEST], al
        callf   CS1_SEG:COPY_SEQUENCE_DIALOG_OFS
bc_int5d_01df8:
        int     50h
bc_int5d_01dfa:
        INT_5D copy_sequence_refresh
bc_int67_68_01dfe:
        INT_66 copy_sequence_param
bc_int5b_01e02:
        INT_67 calls_input_handler_01e4f
calls_ui_1e5f_01e06:
        INT_68 copy_sequence_do_it
calls_ui_1e5f_01e0a:
        INT_5B select_01D85
calls_ui_1e5f_01e0e:
        call    ui_stat_b_1e48_e5f
        ret
copy_sequence_refresh:
        mov     al, byte ptr [SEL_SEQ]
        sub     ah, ah
        push    ax
        inc     al
ui_menu_01E1A:
        BC_UI_MENU 88, 16
        db      58h
L_01E20:
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        mov     si, 2
        mov     dx, es
status_b_01E2A:
        BC_STATUS_B 106, 16, 16
        db      0a0h, 0e1h, 14h, 2ah, 0e4h, 50h, 0feh, 0c0h
ui_menu_01E38:
        BC_UI_MENU 88, 40
        db      58h
L_01E3E:
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        mov     si, 2
        mov     dx, es
status_b_01E48:
        BC_STATUS_B 106, 40, 16
        db      0c3h
calls_input_handler_01e4f:
        mov     al, byte ptr [SEL_SEQ]
calls_input_handler_01e52:
        call    input_handler
calls_init_with_int50_01e55:
        call    main_screen_enter
calls_system_call_01e58:
        call    system_call
ui_ctrl_01e5b:
        call    calls_check_status_flag_596c_01cab
        ret
ui_stat_b_1e48_e5f:
        BC_UI_CTRL 86, 15, 118, 9
calls_setup_callback_alt_01e66:
        mov     al, 62h
        mov     si, SEL_SEQ
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_alt_01e6e:
        call    setup_callback_alt
ui_ctrl_01e71:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_stat_b_1e48_e7c
ui_ctrl_01e7b:
        ret
ui_stat_b_1e48_e7c:
        BC_UI_CTRL 86, 39, 118, 9
calls_setup_callback_alt_01e83:
        mov     al, 62h
        mov     si, COPY_SEQ_DEST
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_alt_01e8b:
        call    setup_callback_alt
bc_int6c_01e8e:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_stat_b_1e48_e5f, NULL_HANDLER_OFS
L_01E98:
        ret
copy_sequence_do_it:
        mov     al, byte ptr [SEL_SEQ]
        push    ax
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        pop     ax
L_01EA3:
        jae     L_01EA6
        ret
L_01EA6:
        mov     ah, byte ptr [COPY_SEQ_DEST]
        cmp     al, ah
L_01EAC:
        jne     L_01EAF
        ret
L_01EAF:
        push    ax
        callf   CS1_SEG:seq_copy_far
        pop     ax
        mov     byte ptr [SEL_SEQ], ah
        mov     al, ah
calls_input_handler_01ebc:
        call    input_handler
calls_init_with_int50_01ebf:
        call    main_screen_enter
        ret
copy_sequence_param:
        mov     al, byte ptr [SEL_SEQ]
        push    ax
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        pop     ax
L_01ECD:
        jae     L_01ED0
        ret
L_01ED0:
        mov     ah, byte ptr [COPY_SEQ_DEST]
        cmp     al, ah
L_01ED6:
        jne     L_01ED9
        ret
L_01ED9:
        push    ax
        callf   CS1_SEG:seq_copy_params_far
        pop     ax
        mov     byte ptr [SEL_SEQ], ah
        mov     al, ah
calls_input_handler_01ee6:
        call    input_handler
calls_init_with_int50_01ee9:
        call    main_screen_enter
        ret
main_screen_now_field:
        cmp     byte ptr [B_14D3], 0
calls_call_with_check_01ef2:
        je      calls_call_with_check_01ef5
        ret
calls_call_with_check_01ef5:
        call    call_with_check
        cmp     byte ptr [B_0B28], 0
ui_ctrl_01efd:
        je      ui_stat_b_1e48_f02
ui_ctrl_01eff:
        jmp     NEAR ui_calc_bar_beat_031
L_02A7D:
ui_stat_b_1e48_f02:
        BC_UI_CTRL 191, 0, 19, 9
bc_int6c_01f09:
        INT_6C time_convert, ui_calc_bar_beat_f63, NULL_HANDLER_OFS, ui_arith_ext_02535_85c
bc_int5b_01f13:
        INT_5B main_screen_now_window
L_01F17:
        mov     ax, ds
        mov     es, ax
        mov     ax, SEQ_CUR_BAR
        mov     bx, L_01F30
        mov     cx, 3e7h
        sub     dx, dx
        mov     bp, main_screen_now_field
        call    bc_int6a_0de38
calls_calc_bar_beat_01f2c:
        call    calc_bar_beat
        ret
L_01F30:
        callf   CS1_SEG:calls_locate_dialog_18556_1704d
        sub     ax, ax
        mov     word ptr [NOW_BEAT_IDX], ax
        mov     word ptr [NOW_BEAT_CLOCK], ax
        les     si, [FP_SEQ_AFTER_GAP]
        callf   CS1_SEG:scsi_operation_far
        callf   CS1_SEG:sync_out_send_song_position
        ret
calc_bar_beat:
        mov     ax, word ptr [SEQ_BAR_TICK]
        mov     bl, byte ptr [SEQ_BEAT_TICKS]
        div     bl
        mov     cl, ah
        mov     ah, 0
        mov     ch, 0
        mov     word ptr [NOW_BEAT_IDX], ax
        mov     word ptr [NOW_BEAT_CLOCK], cx
        ret
ui_calc_bar_beat_f63:
        BC_UI_CTRL 215, 0, 13, 9
bc_int6c_01f6a:
        INT_6C main_screen_now_field, ui_calc_bar_beat_fcf, NULL_HANDLER_OFS, ui_arith_ext_02535_85c
bc_int5b_01f74:
        INT_5B main_screen_now_window
L_01F78:
        mov     ax, ds
        mov     es, ax
        mov     ax, NOW_BEAT_IDX
        mov     bx, L_01F91
        mov     cl, byte ptr [SEQ_TSIG_NUM]
        mov     ch, 0
        sub     dx, dx
        mov     bp, ui_calc_bar_beat_f63
        call    bc_int6a_0de38
        ret
L_01F91:
        mov     bx, word ptr [SEQ_CUR_BAR]
        cmp     bx, word ptr [SEQ_BAR_COUNT]
        jne     calls_calc_bar_beat_01f9d
        sub     ax, ax
calls_calc_bar_beat_01f9d:
        push    ax
calls_calc_bar_beat_01f9e:
        call    calc_bar_beat
        pop     ax
        cmp     al, byte ptr [SEQ_TSIG_NUM]
        jb      L_01FAD
        mov     al, byte ptr [SEQ_TSIG_NUM]
        dec     al
L_01FAD:
        mov     ah, 0
        mov     word ptr [NOW_BEAT_IDX], ax
        mov     ah, byte ptr [SEQ_BEAT_TICKS]
        mul     ah
        add     ax, word ptr [NOW_BEAT_CLOCK]
        mov     word ptr [SEQ_BAR_TICK], ax
L_01FBF:
        mov     cx, ax
        mov     ax, word ptr [SEQ_CUR_BAR]
        callf   CS1_SEG:SEQ_POSITION_SET_FAR_OFS
        callf   CS1_SEG:P_60B0
        ret
ui_calc_bar_beat_fcf:
        BC_UI_CTRL 233, 0, 13, 9
bc_int6c_01fd6:
        INT_6C ui_calc_bar_beat_f63, NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_arith_ext_02535_85c
bc_int6a_01fe0:
        INT_6A main_screen_step_fwd, main_screen_step_back
bc_int5b_01fe6:
        INT_5B main_screen_now_window
L_01FEA:
        mov     ax, ds
        mov     es, ax
        mov     ax, NOW_BEAT_CLOCK
        mov     bx, L_02000
        mov     cx, 63h
        sub     dx, dx
        mov     bp, ui_calc_bar_beat_fcf
        if      FW_VERSION = 172
        call    bc_int6a_0de4d
        else
        call    L_0DE46+7
        endif
        ret
L_02000:
        mov     bx, word ptr [SEQ_CUR_BAR]
        cmp     bx, word ptr [SEQ_BAR_COUNT]
        jne     calls_calc_bar_beat_0200c
        sub     ax, ax
calls_calc_bar_beat_0200c:
        push    ax
calls_calc_bar_beat_0200d:
        call    calc_bar_beat
        pop     ax
        cmp     al, byte ptr [SEQ_BEAT_TICKS]
        jb      L_0201C
        mov     al, byte ptr [SEQ_BEAT_TICKS]
        dec     al
L_0201C:
        mov     word ptr [NOW_BEAT_CLOCK], ax
        mov     bx, ax
        mov     ax, word ptr [NOW_BEAT_IDX]
        mov     ah, byte ptr [SEQ_BEAT_TICKS]
        mul     ah
        add     ax, bx
ui_ctrl_0202c:
        mov     word ptr [SEQ_BAR_TICK], ax
        jmp     SHORT L_01FBF
L_02BAC:
ui_calc_bar_beat_031:
        BC_UI_CTRL 191, 0, 55, 9
bc_int6c_02038:
        INT_6C time_convert, NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_arith_ext_02535_85c
bc_int6a_02042:
        INT_6A NULL_HANDLER_OFS, NULL_HANDLER_OFS
bc_int5b_02048:
        INT_5B main_screen_now_window
L_0204C:
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
        ret
main_screen_now_window:
        mov     si, D_0BC8
        push    ds
        pop     es
calls_check_status_flag_596c_02058:
        call    calls_check_status_flag_596c_0205c
        ret
calls_check_status_flag_596c_0205c:
        call    seq_edit_allowed
L_0205F:
        je      L_02062
        ret
L_02062:
        mov     word ptr [FP_TIME_EDIT_VALUE], si
        mov     word ptr [TIME_EDIT_VALUE_SEG], es
        callf   CS1_SEG:TIME_DISPLAY_DIALOG_OFS
bc_int67_68_0206f:
        int     50h
bc_int5b_02071:
        INT_5C NULL_HANDLER_OFS
bc_int5b_02075:
        INT_67 calls_table_lookup_020_0208a
calls_ui_20f5_02079:
        INT_5B calls_table_lookup_020_0208a
calls_ui_20f5_0207d:
        mov     word ptr [UI_SLOT_EXIT], table_lookup_020A2
calls_ui_20f5_02083:
        call    ui_stat_a_20b2_0f5
calls_dispatch_int6d_6e_02086:
        call    dispatch_int6d_6e
        ret
calls_table_lookup_020_0208a:
        mov     ax, word ptr [SEQ_CUR_BAR]
        mov     cx, word ptr [SEQ_BAR_TICK]
        callf   CS1_SEG:SEQ_POSITION_SET_FAR_OFS
        call    table_lookup_020A2
        call    main_screen_enter
calls_cursor_handler_0209c:
        call    cursor_handler
        jmp     NEAR main_screen_now_field
table_lookup_020A2:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     di, 21h
        mov     si, D_0BC8
        mov     cx, 5
        db      0f3h
handler_BC_TABLE_LOOKUP:
        movsb
        ret
status_a_020B2:
        BC_STATUS_A 116, 13, B_0B28, D_165A
        db      0c4h, 36h, 0dch, 14h, 26h, 8ah, 04h
ui_menu_020C2:
        BC_UI_MENU 116, 23
        db      26h
L_020C8:
        mov     al, byte ptr [si+1]
ui_menu_020CB:
        BC_UI_MENU 134, 23
        db      26h
L_020D1:
        mov     al, byte ptr [si+2]
ui_menu_020D4:
        BC_UI_MENU 152, 23
        db      26h
L_020DA:
        mov     al, byte ptr [si+3]
ui_menu_020DD:
        BC_UI_MENU 170, 23
        db      26h
L_020E3:
        mov     al, byte ptr [si+4]
ui_menu_020E6:
        if      FW_VERSION = 172
L_020EC                         equ     $+6
        endif
        BC_UI_MENU 188, 23
        BC_STATUS_A 116, 33, G_FRAME_RATE, D_14F9
        db      0c3h
ui_stat_a_20b2_0f5:
        BC_UI_CTRL 115, 12, 91, 9
bc_int6c_020fc:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_stat_a_20b2_116
bc_int5d_02106:
        INT_5D status_a_020B2
calls_setup_callback_vectors_0210a:
        mov     al, 1
        mov     si, B_0B28
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_02112:
        call    setup_callback_vectors
        ret
ui_stat_a_20b2_116:
        BC_UI_CTRL 115, 22, 13, 9
calls_setup_callback_vectors_0211d:
        mov     al, 17h
        mov     si, D_0BC8
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_02125:
        call    setup_callback_vectors
bc_int6c_02128:
        INT_6C NULL_HANDLER_OFS, calls_check_status_flag_596c_02147, ui_stat_a_20b2_0f5, ui_stat_a_20b2_22b
L_02132:
        les     si, [FP_TIME_EDIT_VALUE]
        mov     ax, si
        mov     bx, NULL_HANDLER_OFS
        mov     cx, 17h
        sub     dx, dx
        mov     bp, ui_stat_a_20b2_116
        call    set_mode_flag_0
        ret
calls_check_status_flag_596c_02147:
        call    seq_edit_allowed
ui_ctrl_0214a:
        je      ui_stat_a_20b2_14d
        ret
ui_stat_a_20b2_14d:
        BC_UI_CTRL 133, 22, 13, 9
bc_int6c_02154:
        INT_6C ui_stat_a_20b2_116, ui_stat_a_20b2_174, ui_stat_a_20b2_0f5, ui_stat_a_20b2_22b
L_0215E:
        les     si, [FP_TIME_EDIT_VALUE]
        inc     si
        mov     ax, si
        mov     bx, L_021CF
        mov     cx, 3bh
        sub     dx, dx
        mov     bp, calls_check_status_flag_596c_02147
        call    set_mode_flag_0
        ret
ui_stat_a_20b2_174:
        BC_UI_CTRL 151, 22, 13, 9
bc_int6c_0217b:
        INT_6C calls_check_status_flag_596c_02147, ui_stat_a_20b2_19c, ui_stat_a_20b2_0f5, ui_stat_a_20b2_22b
L_02185:
        les     si, [FP_TIME_EDIT_VALUE]
        inc     si
        inc     si
        mov     ax, si
        mov     bx, L_021CF
        mov     cx, 3bh
        sub     dx, dx
        mov     bp, ui_stat_a_20b2_174
        call    set_mode_flag_0
        ret
ui_stat_a_20b2_19c:
        BC_UI_CTRL 169, 22, 13, 9
bc_int6c_021a3:
        INT_6C ui_stat_a_20b2_174, ui_stat_a_20b2_202, ui_stat_a_20b2_0f5, ui_stat_a_20b2_22b
L_021AD:
        les     si, [FP_TIME_EDIT_VALUE]
        add     si, 3
        mov     ax, si
        mov     bl, byte ptr [G_FRAME_RATE]
        mov     bh, 0
        mov     cl, byte ptr [bx+TBL_SMPTE_FPS]
        mov     ch, 0
        dec     cx
        mov     bx, L_021CF
        sub     dx, dx
        mov     bp, ui_stat_a_20b2_19c
        call    set_mode_flag_0
        ret
L_021CF:
        cmp     byte ptr [G_FRAME_RATE], 2
L_021D4:
        je      L_021D7
        ret
L_021D7:
        les     si, [FP_TIME_EDIT_VALUE]
        mov     al, byte ptr es:[si+3]
        cmp     al, 2
L_021E1:
        jb      L_021E4
        ret
L_021E4:
        cmp     byte ptr es:[si+2], 0
L_021E9:
        je      L_021EC
        ret
L_021EC:
        sub     ax, ax
        mov     al, byte ptr es:[si+1]
        mov     bl, 0ah
        div     bl
        cmp     ah, 0
L_021F9:
        jne     ui_ctrl_021fc
        ret
ui_ctrl_021fc:
        mov     byte ptr es:[si+3], 2
        ret
ui_stat_a_20b2_202:
        BC_UI_CTRL 187, 22, 13, 9
bc_int6c_02209:
        INT_6C ui_stat_a_20b2_19c, NULL_HANDLER_OFS, ui_stat_a_20b2_0f5, ui_stat_a_20b2_22b
L_02213:
        les     si, [FP_TIME_EDIT_VALUE]
        add     si, 4
        mov     ax, si
        mov     bx, L_021CF
        mov     cx, 63h
        sub     dx, dx
        mov     bp, ui_stat_a_20b2_202
        call    set_mode_flag_0
        ret
ui_stat_a_20b2_22b:
        BC_UI_CTRL 115, 32, 19, 9
calls_setup_callback_vectors_02232:
        mov     al, 3
        mov     si, G_FRAME_RATE
        mov     bx, L_02248
calls_setup_callback_vectors_0223a:
        call    setup_callback_vectors
bc_int6c_0223d:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_stat_a_20b2_116, NULL_HANDLER_OFS
L_02247:
        ret
L_02248:
        les     si, [FP_TIME_EDIT_VALUE]
        mov     al, byte ptr es:[si+3]
        mov     bl, byte ptr [G_FRAME_RATE]
        mov     bh, 0
        mov     bl, byte ptr [bx+TBL_SMPTE_FPS]
        dec     bl
        cmp     al, bl
L_0225E:
        jb      L_02264
        mov     byte ptr es:[si+3], bl
L_02264:
        jmp     NEAR L_021CF
main_screen_tempo_field:
        cmp     byte ptr [B_14D3], 0
calls_call_with_check_0226c:
        je      calls_call_with_check_0226f
        ret
calls_call_with_check_0226f:
        call    call_with_check
calls_check_and_call_02272:
        call    check_and_call
ui_stat_a_20b2_275:
        BC_UI_CTRL 23, 12, 31, 9
bc_int6c_0227c:
        INT_6C main_screen_tempo_field, calls_call_with_check_0232c, time_convert, ui_field_23_61a
bc_int5d_02286:
        INT_5B main_screen_tempo_window
bc_int5d_0228a:
        INT_5D system_call

fn_0228E:
        mov     ax, ds
        mov     es, ax
        mov     ax, G_MASTER_TEMPO
        cmp     byte ptr [G_TEMPO_SOURCE_SEQ], 0
        je      dequeue_serial_022A3
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ax, 14h
dequeue_serial_022A3:
        mov     bx, L_022DE
        mov     cx, 0bb8h
        mov     dx, 0
        mov     bp, main_screen_tempo_field
        db      0e8h
        if      FW_VERSION = 172
handler_BC_DEQUEUE_SERIAL:
        db      7dh, 0bbh
        else
        db      0dah, 0b8h
        endif
bc_int6a_022b2:
        INT_6A calls_event_handler_02305, main_screen_tempo_dec
L_022B8:
        ret
calls_timer_handler_022b9:
        cli
        callf   CS1_SEG:P_7231
        sti
calls_timer_handler_022c0:
        call    timer_handler
calls_check_status_flag_596c_022c3:
        call    seq_edit_allowed
L_022C6:
        je      L_022C9
        ret
L_022C9:
        cmp     byte ptr [B_0B28], 0
L_022CE:
        jne     L_022D1
        ret
L_022D1:
        mov     ax, word ptr [SEQ_CUR_BAR]
        mov     cx, word ptr [SEQ_BAR_TICK]
        callf   CS1_SEG:SEQ_POSITION_SET_FAR_OFS
        ret
L_022DE:
        call    tempo_value_clamp
        les     si, [FP_VALUE_FIELD]
        mov     word ptr es:[si], ax
        jmp     SHORT calls_timer_handler_022b9
tempo_value_clamp:
        cmp     ax, 12ch
        ja      br_022FC
        mov     bx, 0ah
        mul     bx
        cmp     ax, 12ch
        jae     br_022FC
        mov     ax, 12ch
br_022FC:
        cmp     ax, 0bb8h
        jb      L_02304
        mov     ax, 0bb8h
L_02304:
        ret
calls_event_handler_02305:
        les     si, [FP_VALUE_FIELD]
        add     ax, word ptr es:[si]
calls_event_handler_0230c:
        call    event_handler
        mov     word ptr es:[si], ax
        jmp     SHORT calls_timer_handler_022b9
main_screen_tempo_dec:
        les     si, [FP_VALUE_FIELD]
        mov     bx, word ptr es:[si]
        sub     bx, ax
        jae     calls_event_handler_02322
        mov     bx, 12ch
calls_event_handler_02322:
        mov     ax, bx
calls_event_handler_02324:
        call    event_handler
        mov     word ptr es:[si], ax
        jmp     SHORT calls_timer_handler_022b9
calls_call_with_check_0232c:
        call    call_with_check
calls_check_and_call_0232f:
        call    check_and_call
ui_stat_a_20b2_332:
        BC_UI_CTRL 59, 12, 19, 9
bc_int6c_02339:

        INT_6C main_screen_tempo_field, ui_event_3ce, time_convert, ui_field_23_61a
calls_setup_callback_vectors_02343:
        mov     al, 1
        mov     si, G_TEMPO_SOURCE_SEQ
        mov     bx, calls_call_with_check_02359
calls_setup_callback_vectors_0234b:
        call    setup_callback_vectors
bc_int5b_0234e:
        INT_5B NULL_HANDLER_OFS
calls_call_with_check_02352:
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
        ret
calls_call_with_check_02359:
        call    call_with_check
calls_check_and_call_0235c:
        call    check_and_call
calls_timer_handler_0235f:
        call    calls_timer_handler_022b9
        ret
calls_timer_handler_02363:
        call    timer_handler
        retf

timer_handler:
        push    es
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ax, word ptr es:[TBL_0014]
        mov     bl, byte ptr es:[16h]
        cmp     byte ptr [G_SONG_MODE], 0
        je      br_02383
        mov     bl, byte ptr [G_SONG_IGNORE_TEMPO]
        xor     bl, 1
br_02383:
        pop     es
        cmp     byte ptr [G_TEMPO_SOURCE_SEQ], 0
        jne     br_0238E
        mov     ax, word ptr [G_MASTER_TEMPO]
br_0238E:
        mov     word ptr [W_1D72], ax
        cmp     bl, 0
        if      FW_VERSION = 172
        je      calls_event_handler_023b4+5
        else
        je      L_02F34
        endif
        mov     bx, word ptr [SEQ_TEMPO_CHG_RATIO]
        cmp     bx, 64h
        jae     br_023A2
        mov     bx, 64h
br_023A2:
        if      FW_VERSION = 172
        cmp     bx, 270fh
        else
        cmp     bx, 0bb8h
        endif
        jb      br_023AB
        if      FW_VERSION = 172
        mov     bx, 270fh
        else
        mov     bx, 0bb8h
        endif
br_023AB:
        mul     bx
        cmp     dx, bx
        jb      calls_event_handler_023b4
        mov     dx, 3e7h
calls_event_handler_023b4:
        mov     bx, 3e8h
        div     bx
L_02F34:
        call    event_handler
        ret
event_handler:
        cmp     ax, 12ch
        jae     br_023C5
        mov     ax, 12ch
br_023C5:
        cmp     ax, 0bb8h
        jb      ui_ctrl_023cd
        mov     ax, 0bb8h
ui_ctrl_023cd:
        ret
ui_event_3ce:
        BC_UI_CTRL 136, 12, 44, 9
bc_int6c_023d5:
        INT_6C calls_call_with_check_0232c, ui_arith_ext_02535_85c, time_convert, ui_field_23_61a
calls_setup_callback_vectors_023df:
        mov     al, 6
        mov     si, G_TC_NOTE_VALUE
        mov     bx, calls_call_with_check_023f5
calls_setup_callback_vectors_023e7:
        call    setup_callback_vectors
bc_int5b_023ea:
        INT_5B calls_check_status_flag_596c_02403
L_023EE:
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
        ret
calls_call_with_check_023f5:
        mov     byte ptr [G_SHIFT_TIMING_AMOUNT], 0
calls_call_with_check_023fa:
        call    call_with_check
        callf   CS1_SEG:L_170D5
        ret
calls_check_status_flag_596c_02403:
        call    seq_edit_allowed
calls_call_with_check_02406:
        je      calls_call_with_check_02409
        ret
calls_call_with_check_02409:
        call    call_with_check
        call    clamp_edit_range_to_seq_end
        callf   CS1_SEG:timing_correct_dialog
L_02414:
        call    timing_correct_amount_clamp
        mov     al, 0
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bl, byte ptr [SEL_TRACK]
        mov     bh, 0
        test    byte ptr es:[bx+TRK_CHANNEL], 40h
        je      bc_int5d_0242d
        mov     al, 1
bc_int5d_0242d:
        mov     byte ptr [D_14F8], al
bc_int5d_02430:
        int     50h
bc_int5d_02432:
        INT_5D status_a_02455
bc_int5b_02436:
        INT_67 calls_init_with_int50_0244f
bc_int5b_0243a:
        INT_68 timing_correct_do_it
bc_int5b_0243e:
        INT_5B calls_init_with_int50_0244f
calls_dispatch_int6d_6e_02442:
        mov     word ptr [UI_SLOT_PAD_HIT], L_0C197
calls_dispatch_int6d_6e_02448:
        call    calls_setup_callback_alt_0253b
calls_dispatch_int6d_6e_0244b:
        call    dispatch_int6d_6e
        ret
calls_init_with_int50_0244f:
        call    main_screen_enter
        jmp     NEAR ui_event_3ce
status_a_02455:
        BC_STATUS_A 92, 12, G_TC_NOTE_VALUE, TBL_NOTE_VALUE_NAMES
status_display_02FD9:
status_display_245E:
        BC_STATUS 170, 12, "         "
L_0246D:
        cmp     byte ptr [G_TC_NOTE_VALUE], 1
        jne     L_02477
L_02474:
        call    swing_percent_display_02521
L_02477:
        cmp     byte ptr [G_TC_NOTE_VALUE], 3
L_0247C:
        jne     status_a_02481
L_0247E:
        call    swing_percent_display_02521
status_a_02481:
        BC_STATUS_A 104, 22, G_SHIFT_TIMING_LATER, D_153F
        db      0a0h, 2dh, 0bh
arith_ext_0248D:
        BC_ARITH_EXT 016d5h
L_02492:
        mov     dx, word ptr [G_RANGE_START_BEAT_TICKS]
        mov     ax, word ptr [G_RANGE_START_BAR]
        mov     cx, word ptr [G_RANGE_START_TICK]
range_0249D:
        BC_RANGE 62, 32
L_024A2:
        mov     dx, word ptr [G_RANGE_END_BEAT_TICKS]
        mov     ax, word ptr [G_RANGE_END_BAR]
        mov     cx, word ptr [G_RANGE_END_TICK]
range_024AD:
        BC_RANGE 134, 32
notes_status_024B2:
        cmp     byte ptr [D_14F8], 0
notes_status:
        je      notes_display
        jmp     SHORT pad_prompt_and_note_display
notes_display:
        BC_STATUS 26, 40, "Notes:          -          "
notesall_hit_pad_status:
        mov     al, byte ptr [TC_NOTE_LO]
midi_fmt_pad_display:
        BC_MIDI_FIELD 62, 40
L_024E4:
        mov     al, byte ptr [TC_NOTE_HI]
midi_fmt_pad_value:
        BC_MIDI_FIELD 134, 40
L_024EC:
        ret
pad_prompt_and_note_display:
        BC_STATUS 26, 40, "Notes:ALL               (Hit pad)"
swing_status_02514:
        mov     al, byte ptr [G_EDIT_DRUM_NOTE]
        mov     ah, byte ptr [G_EDIT_DRUM_PAD]
mem_status_pad_62_40:
        BC_MEM_STATUS 62, 40
swing_status:
        ret
swing_percent_display_02521:
        BC_STATUS 170, 12, "Swing%:  "
status_swing_02530:
        mov     al, byte ptr [G_SWING_PCT]
        add     al, 32h
arith_ext_02535:
        BC_ARITH_EXT 00cd5h
L_0253A:
        ret
calls_setup_callback_alt_0253b:
        mov     al, 6
        mov     si, G_TC_NOTE_VALUE
        mov     bx, L_02558
calls_setup_callback_alt_02543:
        call    setup_callback_alt
ui_arith_ext_02535_546:
        BC_UI_CTRL 91, 11, 43, 9
bc_int6c_0254d:
        INT_6C NULL_HANDLER_OFS, timing_correct_note_value_right, NULL_HANDLER_OFS, calls_setup_callback_alt_025aa
L_02557:
        ret
L_02558:
        mov     byte ptr [G_SHIFT_TIMING_AMOUNT], 0
        ret
timing_correct_note_value_right:
        cmp     byte ptr [G_TC_NOTE_VALUE], 1
L_02563:
        jne     L_02567
        jmp     SHORT calls_setup_callback_alt_02572
L_02567:
        cmp     byte ptr [G_TC_NOTE_VALUE], 3
jmp_ui_25da_0256c:
        jne     jmp_ui_25da_02570
        jmp     SHORT calls_setup_callback_alt_02572
jmp_ui_25da_02570:
        jmp     SHORT ui_arith_ext_02535_5da
calls_setup_callback_alt_02572:
        mov     al, 19h
        mov     si, G_SWING_PCT
        mov     bx, L_02595
calls_setup_callback_alt_0257a:
        call    setup_callback_alt
ui_arith_ext_02535_57d:
        BC_UI_CTRL 212, 11, 13, 9
bc_int6c_02584:
        INT_6C calls_setup_callback_alt_0253b, NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_arith_ext_02535_5da
L_0258E:
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
        ret
L_02595:
        mov     ah, 20h
        cmp     byte ptr [G_TC_NOTE_VALUE], 1
        je      L_025A0
        mov     ah, 10h
L_025A0:
        mul     ah
        mov     bl, 63h
        div     bl
        mov     word ptr [G_SWING_OFFSET], ax
        ret
calls_setup_callback_alt_025aa:
        mov     al, 1
        mov     si, G_SHIFT_TIMING_LATER
        mov     bx, timing_correct_amount_clamp
calls_setup_callback_alt_025b2:
        call    setup_callback_alt
ui_arith_ext_02535_5b5:
        BC_UI_CTRL 103, 21, 43, 9
bc_int6c_025bc:
        INT_6C ui_arith_ext_02535_63f, ui_arith_ext_02535_5da, calls_setup_callback_alt_0253b, ui_arith_ext_02535_63f
L_025C6:
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
        ret
timing_correct_amount_clamp:
        call    timing_correct_amount_max
        cmp     al, ah
        jb      ui_ctrl_025d9
        mov     al, ah
        mov     byte ptr [G_SHIFT_TIMING_AMOUNT], al
ui_ctrl_025d9:
        ret
ui_arith_ext_02535_5da:
        BC_UI_CTRL 212, 21, 13, 9
bc_int6c_025e1:
        INT_6A timing_correct_amount_inc, timing_correct_amount_dec
bc_int6c_025e7:
        INT_6C calls_setup_callback_alt_025aa, NULL_HANDLER_OFS, timing_correct_amount_up, ui_arith_ext_02535_687
L_025F1:
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
        ret
timing_correct_amount_inc:
        call    timing_correct_amount_max
        inc     al
        cmp     al, ah
        jb      L_02603
        mov     al, ah
L_02603:
        mov     byte ptr [G_SHIFT_TIMING_AMOUNT], al
        ret
timing_correct_amount_dec:
        call    timing_correct_amount_max
        cmp     al, 0
        je      L_02603
        dec     al
        jmp     SHORT L_02603
timing_correct_amount_max:
        mov     al, byte ptr [G_TC_NOTE_VALUE]
        mov     bx, D_154E
        xlat
        mov     ah, al
        mov     al, byte ptr [G_SHIFT_TIMING_AMOUNT]
        cmp     byte ptr [G_SHIFT_TIMING_LATER], 0
        jne     L_02627
        dec     ah
L_02627:
        ret
timing_correct_amount_up:
        cmp     byte ptr [G_TC_NOTE_VALUE], 1
L_0262D:
        jne     L_02632
        jmp     NEAR calls_setup_callback_alt_02572
L_02632:
        cmp     byte ptr [G_TC_NOTE_VALUE], 3
L_02637:
        jne     ui_ctrl_0263c
        jmp     NEAR calls_setup_callback_alt_02572
ui_ctrl_0263c:
        jmp     NEAR calls_setup_callback_alt_0253b
ui_arith_ext_02535_63f:
        BC_UI_CTRL 61, 31, 19, 9
bc_int6c_02646:
        INT_6C NULL_HANDLER_OFS, ui_arith_ext_02535_657, calls_setup_callback_alt_025aa, jmp_ui_2768_026cf
ui_ctrl_02650:
        mov     bp, ui_arith_ext_02535_63f
        if      FW_VERSION = 172
        db      0e8h, 4ch, 0b3h
        else
        db      0e8h
        db      0adh, 0b0h
        endif
        ret
ui_arith_ext_02535_657:
        BC_UI_CTRL 85, 31, 13, 9
bc_int6c_0265e:
        INT_6C ui_arith_ext_02535_63f, ui_arith_ext_02535_66f, calls_setup_callback_alt_025aa, jmp_ui_2768_026cf
ui_ctrl_02668:
        mov     bp, ui_arith_ext_02535_657
        call    L_0D9F9
        ret
ui_arith_ext_02535_66f:
        BC_UI_CTRL 103, 31, 13, 9
bc_int6c_02676:
        INT_6C ui_arith_ext_02535_657, ui_arith_ext_02535_687, ui_arith_ext_02535_5da, jmp_ui_2768_026cf
ui_ctrl_02680:
        mov     bp, ui_arith_ext_02535_66f
        call    L_0DA5D
        ret
ui_arith_ext_02535_687:
        BC_UI_CTRL 133, 31, 19, 9
bc_int6c_0268e:
        INT_6C ui_arith_ext_02535_66f, ui_arith_ext_02535_69f, ui_arith_ext_02535_5da, ui_ctrl_0271b
ui_ctrl_02698:
        mov     bp, ui_arith_ext_02535_687
        call    L_0DAC6
        ret
ui_arith_ext_02535_69f:
        BC_UI_CTRL 157, 31, 13, 9
bc_int6c_026a6:
        INT_6C ui_arith_ext_02535_687, ui_arith_ext_02535_6b7, ui_arith_ext_02535_5da, ui_ctrl_0271b
ui_ctrl_026b0:
        mov     bp, ui_arith_ext_02535_69f
        call    L_0DB18
        ret
ui_arith_ext_02535_6b7:
        BC_UI_CTRL 175, 31, 13, 9
bc_int6c_026be:
        INT_6C ui_arith_ext_02535_69f, ui_arith_ext_02535_5da, ui_arith_ext_02535_5da, ui_ctrl_0271b
L_026C8:
        mov     bp, ui_arith_ext_02535_6b7
        call    L_0DB7E
        ret
jmp_ui_2768_026cf:
        cmp     byte ptr [D_14F8], 0
ui_ctrl_026d4:
        je      ui_arith_ext_02535_6d9
ui_ctrl_026d6:
        jmp     NEAR ui_arith_ext_02535_768
ui_arith_ext_02535_6d9:
        BC_UI_CTRL 61, 39, 49, 9
bc_int6c_026e0:
        if      FW_VERSION = 172
        INT_6A timing_correct_notes_lo_inc, timing_correct_notes_lo_dec
        else
        INT_6A L_026F0+7, L_0270B+4
        endif
bc_int6c_026e6:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_0271b, ui_arith_ext_02535_63f, NULL_HANDLER_OFS
L_026F0:
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
        ret
timing_correct_notes_lo_inc:
        add     al, byte ptr [TC_NOTE_LO]
L_026FC                         equ     $+1
        cmp     al, 7fh
        jb      timing_correct_notes_lo_inc+10
        mov     al, 7fh
        mov     byte ptr [TC_NOTE_LO], al
        cmp     al, byte ptr [TC_NOTE_HI]
        jae     L_0270B
        ret
L_0270B:
        mov     byte ptr [TC_NOTE_HI], al
        ret
timing_correct_notes_lo_dec:
        sub     byte ptr [TC_NOTE_LO], al
        jae     timing_correct_notes_lo_dec+11
        mov     byte ptr [TC_NOTE_LO], 0
        ret
ui_ctrl_0271b:
        cmp     byte ptr [D_14F8], 0
ui_ctrl_02720:
        jne     ui_arith_ext_02535_768
ui_arith_ext_02535_722:
        BC_UI_CTRL 133, 39, 49, 9
bc_int6c_02729:
        INT_6A timing_correct_notes_hi_inc, timing_correct_notes_hi_dec
bc_int6c_0272f:
        INT_6C jmp_ui_2768_026cf, ui_arith_ext_02535_5da, ui_arith_ext_02535_687, NULL_HANDLER_OFS
L_02739:
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
        ret
timing_correct_notes_hi_inc:
        add     al, byte ptr [TC_NOTE_HI]
        cmp     al, 7fh
        db      72h, 02h
        mov     al, 7fh
        mov     byte ptr [TC_NOTE_HI], al
        ret
timing_correct_notes_hi_dec:
        mov     ah, byte ptr [TC_NOTE_HI]
        sub     ah, al
        jae     L_02758
        mov     ah, 0
L_02758:
        mov     byte ptr [TC_NOTE_HI], ah
        cmp     ah, byte ptr [TC_NOTE_LO]
L_02760:
        jb      ui_ctrl_02763
        ret
ui_ctrl_02763:
        mov     byte ptr [TC_NOTE_LO], ah
        ret
ui_arith_ext_02535_768:
        BC_UI_CTRL 61, 39, 37, 9
bc_int6c_0276f:
        INT_6A pad_note_inc, pad_note_dec
bc_int6c_02775:
        INT_6C NULL_HANDLER_OFS, ui_arith_ext_02535_687, ui_arith_ext_02535_63f, NULL_HANDLER_OFS
L_0277F:
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
        ret
timing_correct_do_it:
        cmp     byte ptr [D_14F8], 0
        je      timing_correct_do_it+30
        mov     al, 0
        mov     ah, 7fh
        cmp     byte ptr [G_EDIT_DRUM_PAD], 41h
        je      timing_correct_do_it+23
        mov     al, byte ptr [G_EDIT_DRUM_NOTE]
        mov     ah, al
        mov     byte ptr [TC_NOTE_LO], al
        mov     byte ptr [TC_NOTE_HI], ah
        mov     al, byte ptr [G_SHIFT_TIMING_AMOUNT]
        or      al, byte ptr [G_TC_NOTE_VALUE]
        jne     L_027B0
        jmp     NEAR calls_init_with_int50_0244f
L_027B0:
        mov     ax, word ptr [G_RANGE_START_BAR]
        cmp     ax, word ptr [G_RANGE_END_BAR]
        jne     L_027C5
        mov     ax, word ptr [G_RANGE_START_TICK]
        cmp     ax, word ptr [G_RANGE_END_TICK]
        jne     L_027C5
        jmp     NEAR calls_init_with_int50_0244f
L_027C5:
        push    word ptr [SEQ_CUR_BAR]
        push    word ptr [SEQ_BAR_TICK]
        mov     al, byte ptr [SEL_TRACK]
        mov     byte ptr [G_REC_TRACK], al
        callf   CS1_SEG:seq_undo_checkpoint_far
        callf   CS1_SEG:timing_swing_offset_calc_far
        mov     byte ptr [TC_IN_PROGRESS], 1
        mov     al, byte ptr [G_SHIFT_TIMING_AMOUNT]
        sub     ah, ah
        cmp     byte ptr [G_SHIFT_TIMING_LATER], 0
        jne     L_027F0
        neg     ax
L_027F0:
        mov     word ptr [G_SHIFT_TIMING_TICKS], ax
        cmp     byte ptr [G_SHIFT_TIMING_LATER], 0
        je      L_027FD
        mov     word ptr [W_63E2], ax
L_027FD:
        les     si, [FP_SEQ_AFTER_GAP]
        cmp     byte ptr es:[si], 0c0h
        jne     L_0280E
        cmp     byte ptr es:[si+6], 0ffh
L_0280C:
        if      FW_VERSION = 172
        je      L_0281F
        else
        je      L_02848
        endif
L_0280E:
        callf   CS1_SEG:calls_timer_check_1705d
        callf   CS1_SEG:midi_process_far
        callf   CS1_SEG:rec_calc_quantized_pos_far
        jmp     SHORT L_027FD
        if      FW_VERSION = 172
L_0281F:
        mov     ax, word ptr [SEQ_CUR_BAR]
        cmp     ax, word ptr [SEQ_BAR_COUNT]
L_02826:
        je      calls_state_update_02834
        callf   CS1_SEG:midi_process_far
        callf   CS1_SEG:rec_calc_quantized_pos_far
        jmp     L_0281F
calls_state_update_02834:
        mov     ax, word ptr [G_RANGE_END_BAR]
        cmp     ax, word ptr [SEQ_BAR_COUNT]
        jne     L_02848
        mov     bx, ax
        call    state_update
        mul     bl
        dec     ax
        mov     word ptr [W_63E2], ax
        endif
L_02848:
        callf   CS1_SEG:record_flush_held_far
        pop     cx
        pop     ax
        callf   CS1_SEG:seq_position_set_far
        mov     byte ptr [TC_IN_PROGRESS], 0
        jmp     calls_init_with_int50_0244f
L_033AE:
ui_arith_ext_02535_85c:
        BC_UI_CTRL 215, 12, 31, 9
bc_int6c_02863:
        INT_6C ui_event_3ce, NULL_HANDLER_OFS, main_screen_now_field, ui_ctrl_215_aa6
bc_int6a_0286d:
        if      FW_VERSION = 150
tgt_02877                       equ     $+1
        endif
        INT_5B calls_check_status_flag_596c_0289a
bc_int6a_02871:
        INT_6A calls_check_status_flag_596c_0289a, calls_check_status_flag_596c_0289a
        if      FW_VERSION = 172
tgt_02877:
        endif
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ax, word ptr es:[18h]
        dec     ax
        cmp     ax, word ptr [TSIG_BAR_FROM]
        jae     L_0288F
        mov     word ptr [TSIG_BAR_FROM], ax
L_0288F:
        cmp     ax, word ptr [TSIG_BAR_TO]
L_02893:
        jb      calls_check_status_flag_596c_02896
        ret
calls_check_status_flag_596c_02896:
        mov     word ptr [TSIG_BAR_TO], ax
        ret
calls_check_status_flag_596c_0289a:
        call    seq_edit_allowed
calls_call_with_check_0289d:
        je      file_dialog_028A0
        ret
file_dialog_028A0:
        call    call_with_check
        if      FW_VERSION = 172
        mov     byte ptr [P_70F9], 0
        endif
change_tsig_dialog:
        BC_FILE_DIALOG 41, 6, 205, 54, "Change Tsig"
calls_ui_298a_028bb:
        int     50h
calls_ui_298a_028bd:
        INT_5B change_tsig_cancel
calls_ui_298a_028c1:
        call    ui_change_tsig_dialog_98a
calls_dispatch_int6d_6e_028c4:
        call    dispatch_int6d_6e
        ret
        if      FW_VERSION = 150
L_03422                         equ     $+13
        endif
change_tsig_refresh:
        callf   CS1_SEG:bar_new_tsig_status
        mov     ax, word ptr [TSIG_BAR_FROM]
        inc     ax
raw_028D1:
        BC_UI_DIALOG 75, 16
L_028D6:
        mov     ax, word ptr [TSIG_BAR_TO]
        inc     ax
ui_dialog_028DA:
        BC_UI_DIALOG 111, 16
L_028DF:
        mov     bl, byte ptr [D_14E7]
        sub     bh, bh
        shl     bx, 1
        mov     ax, word ptr [bx+TBL_XS_15B8]
        push    ax
arith_ext_028EC:
        BC_ARITH_EXT 010cfh
L_028F1:
        pop     ax
        mov     al, ah
arith_ext_028F4:
        BC_ARITH_EXT 010e1h
ui_ctrl_028f9:
        ret
ui_change_tsig_dialog_8fa:
        BC_UI_CTRL 74, 15, 19, 9
bc_int6c_02901:
        INT_6A change_tsig_bar_from_inc, change_tsig_bar_from_dec
bc_int6c_02907:
        INT_6C NULL_HANDLER_OFS, ui_change_tsig_dialog_939, NULL_HANDLER_OFS, NULL_HANDLER_OFS
bc_int5d_02911:
        INT_5D change_tsig_refresh
L_02915:
        ret
change_tsig_bar_from_inc:
        add     ax, word ptr [TSIG_BAR_FROM]
L_0291A:
        call    seq_bar_clamp_to_length
        mov     word ptr [TSIG_BAR_FROM], ax
        cmp     ax, word ptr [TSIG_BAR_TO]
        jb      L_02929
        mov     word ptr [TSIG_BAR_TO], ax
L_02929:
        ret
change_tsig_bar_from_dec:
        mov     bx, word ptr [TSIG_BAR_FROM]
        sub     bx, ax
        jae     ui_ctrl_02934
        sub     bx, bx
ui_ctrl_02934:
        mov     word ptr [TSIG_BAR_FROM], bx
        ret
ui_change_tsig_dialog_939:
        BC_UI_CTRL 110, 15, 19, 9
bc_int6c_02940:
        INT_6A change_tsig_bar_to_inc, change_tsig_bar_to_dec
bc_int6c_02946:
        INT_6C ui_change_tsig_dialog_8fa, ui_change_tsig_dialog_98a, NULL_HANDLER_OFS, NULL_HANDLER_OFS
bc_int5d_02950:
        INT_5D change_tsig_refresh
L_02954:
        ret
change_tsig_bar_to_inc:
        add     ax, word ptr [TSIG_BAR_TO]
L_02959:
        call    seq_bar_clamp_to_length
        mov     word ptr [TSIG_BAR_TO], ax
        ret
change_tsig_bar_to_dec:
        mov     bx, word ptr [TSIG_BAR_TO]
        sub     bx, ax
        jae     L_0296A
        sub     bx, bx
L_0296A:
        cmp     bx, word ptr [TSIG_BAR_FROM]
        jae     L_02974
        mov     word ptr [TSIG_BAR_FROM], bx
L_02974:
        mov     word ptr [TSIG_BAR_TO], bx
        ret
seq_bar_clamp_to_length:
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     ax, word ptr es:[18h]
        jb      ui_ctrl_02989
        mov     ax, word ptr es:[18h]
        dec     ax
ui_ctrl_02989:
        ret
ui_change_tsig_dialog_98a:
        BC_UI_CTRL 206, 15, 32, 9
calls_setup_callback_alt_02991:
        mov     al, 50h
        mov     si, D_14E7
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_alt_02999:
        call    setup_callback_alt
bc_int6c_0299c:
        INT_67 change_tsig_cancel
bc_int6c_029a0:
        INT_68 change_tsig_do_it
bc_int6c_029a4:
        INT_6C ui_change_tsig_dialog_939, NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS
bc_int5d_029ae:
        INT_5D change_tsig_refresh
L_029B2:
        ret
change_tsig_do_it:
        callf   CS1_SEG:seq_undo_checkpoint_far
        mov     bl, byte ptr [D_14E7]
        sub     bh, bh
        shl     bx, 1
        mov     bx, word ptr [bx+TBL_XS_15B8]
        cmp     word ptr [TSIG_BAR_FROM], 0
        jne     L_029D9
truncate_bars_warning           equ     $+1
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     byte ptr es:[1ah], bl
        mov     byte ptr es:[1bh], bh
L_029D9:
        push    bx
        mov     ax, word ptr [TSIG_BAR_FROM]
        callf   CS1_SEG:calls_locate_dialog_18556_1704d
add_blank_bars_screen:
        pop     bx
        push    bx
        callf   CS1_SEG:L_170CD
        pop     bx
L_029EA:
        les     si, [FP_SEQ_AFTER_GAP]
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
        je      br_02A54
        cmp     al, 0c0h
L_029F7:
        jne     br_02A33
        mov     ax, word ptr es:[si+1]
        cmp     ax, word ptr [TSIG_BAR_TO]
L_02A01:
        ja      br_02A3C
        mov     word ptr es:[si+3], bx
loop_02A07:
        push    bx
        callf   CS1_SEG:P_7239
        pop     bx
L_02A0E:
        les     si, [FP_SEQ_AFTER_GAP]
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
L_02A17:
        je      br_02A3C
        cmp     al, 0c0h
        je      L_029EA
        mov     ax, word ptr es:[si+1]
        and     ah, 7
        cmp     ax, word ptr [SEQ_BAR_LEN_TICKS]
        jb      loop_02A07
L_03577:
        push    bx
        callf   CS1_SEG:P_723D
L_02A30:
        pop     bx
        jmp     SHORT L_02A0E
br_02A33:
        push    bx
        callf   CS1_SEG:P_7239
        pop     bx
        jmp     SHORT L_029EA

br_02A3C:
        push    es
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     ax, word ptr es:[18h]
        pop     es
        jne     br_02A54
        mov     al, byte ptr [SEQ_TSIG_NUM]
        mov     ah, byte ptr [SEQ_TSIG_DEN]
        mov     word ptr es:[si+3], ax
br_02A54:
        callf   CS1_SEG:seq_rewind_to_start_far
        callf   CS1_SEG:P_7241
        mov     ax, word ptr [TSIG_BAR_FROM]
        callf   CS1_SEG:P_71CD
        sub     ax, ax
        mov     word ptr [PUNCH_IN_BAR], ax
        mov     word ptr [PUNCH_IN_TICK], ax
        mov     word ptr [PUNCH_OUT_BAR], ax
        mov     word ptr [PUNCH_OUT_TICK], ax
        mov     word ptr [G_RANGE_START_BEATS], ax
        mov     word ptr [G_RANGE_START_BEAT_TICKS], ax
        mov     word ptr [G_RANGE_END_BEATS], ax
        mov     word ptr [G_RANGE_END_BEAT_TICKS], ax
        mov     word ptr [G_RANGE_TO_BEATS], ax
        mov     word ptr [G_RANGE_TO_BEAT_TICKS], ax
        mov     word ptr [G_RANGE_START_BAR], ax
        mov     word ptr [G_RANGE_START_TICK], ax
        mov     word ptr [G_RANGE_END_BAR], ax
        mov     word ptr [G_RANGE_END_TICK], ax
        mov     word ptr [G_RANGE_START_BEAT], ax
        mov     word ptr [G_RANGE_START_CLOCK], ax
        mov     word ptr [G_RANGE_END_BEAT], ax
        mov     word ptr [G_RANGE_END_CLOCK], ax
        jmp     change_tsig_cancel
change_tsig_cancel:
        call    main_screen_enter
        jmp     ui_arith_ext_02535_85c
L_035F3:
ui_ctrl_215_aa6:
        BC_UI_CTRL 215, 21, 19, 9
bc_int6c_02aad:
        INT_6C ui_ext_display_4_f49, NULL_HANDLER_OFS, ui_arith_ext_02535_85c, close_handler_07610
bc_int6a_02ab7:
        INT_6A calls_check_status_flag_596c_02ad3, calls_check_status_flag_596c_02ad3
bc_int5b_02abd:
        INT_5B calls_check_status_flag_596c_02c12
L_02AC1:
        mov     word ptr [UI_SLOT_DIGIT], calls_check_status_flag_596c_02ad3
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ax, word ptr es:[18h]
        mov     word ptr [CHANGE_BARS_NEW_LEN], ax
        ret
calls_check_status_flag_596c_02ad3:
        call    seq_edit_allowed
L_02AD6:
        je      L_02AD9
        ret
L_03626:
L_02AD9:
        callf   CS1_SEG:CHANGE_BARS_DIALOG_OFS
        if      FW_VERSION = 172
        mov     byte ptr [P_70F9], 0
        endif
bc_int5d_02ae3:
        int     50h
bc_int5d_02ae5:
        INT_5D change_bars_refresh
bc_int67_68_02ae9:
        INT_66 calls_check_status_flag_596c_02c12
bc_int6c_02aed:
        INT_67 calls_init_with_int50_02bc0
bc_int6c_02af1:
        INT_68 calls_call_with_check_02bc6
bc_int6c_02af5:
        INT_6C calls_init_with_int50_02bc0, calls_init_with_int50_02bc0, calls_init_with_int50_02bc0, calls_init_with_int50_02bc0
L_02AFF:
        mov     ax, ds
        mov     es, ax
        mov     ax, CHANGE_BARS_NEW_LEN
        mov     bx, NULL_HANDLER_OFS
        mov     cx, 3e7h
        mov     dx, 1
        mov     bp, calls_check_status_flag_596c_02ad3
        call    set_mode_flag_0
        ret
change_bars_refresh:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ax, word ptr es:[18h]
        push    ax
raw_02B1F:
        BC_FIELD 114, 16
L_02B24:
        mov     ax, word ptr [CHANGE_BARS_NEW_LEN]
        push    ax
raw_02B28:
        BC_FIELD 216, 16
L_02B2D:
        pop     bx
        pop     ax
        cmp     ax, bx
L_02B31:
        jne     L_02B34
        ret
L_02B34:
        jb      pressing_do_it_will_add_b_status
clear_rect_02B36:
        BC_CLEAR_RECT 50, 29, 160, 22
pressing_do_it_will_trunc_status_02B3D:
        if      FW_VERSION = 172
pressing_do_it_will_trunc_status equ     $+5
        endif
        BC_WAIT 50, 29, BMP_WARNING
pressing_will_truncate_display:
        BC_STATUS 74, 30, "Pressing DO^IT will^truncate"
last_bars_status:
        BC_STATUS 74, 39, "last bars."
pressing_do_it_will_add_b_status_02B76:
        ret
pressing_do_it_will_add_b_status:
        if      FW_VERSION = 150
L_036F9                         equ     $+58
        endif
        BC_CLEAR_RECT 50, 29, 160, 22
confirm_dialog:
        BC_STATUS 50, 30, "Pressing DO^IT will^add^blank    "
bars_after_last_status:
        BC_STATUS 50, 39, "bars after last bar."
status_bars_after_last_bar_02bbf:
        ret
calls_init_with_int50_02bc0:
        call    main_screen_enter
        jmp     ui_ctrl_215_aa6
calls_call_with_check_02bc6:
        call    call_with_check
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ax, word ptr es:[18h]
L_03719:
        mov     bx, word ptr [CHANGE_BARS_NEW_LEN]
L_0371D:
        cmp     ax, bx
L_02BD7:
        jne     br_02BDB
        jmp     SHORT calls_init_with_int50_02bc0
br_02BDB:
        jae     L_02BE9
        mov     word ptr [INSBARS_AFTER_BAR], ax
        sub     bx, ax
        mov     word ptr [INSBARS_COUNT], bx
        jmp     change_bars_indel_insert
L_02BE9:
        callf   CS1_SEG:seq_undo_checkpoint_far
        mov     ax, word ptr [CHANGE_BARS_NEW_LEN]
        callf   CS1_SEG:P_71CD
        les     di, [FP_SEQ_GAP_WRITE]
        push    di
L_03743:
        push    es
        callf   CS1_SEG:P_71D9
        pop     es
        pop     di
        mov     word ptr [FP_SEQ_GAP_WRITE], di
        mov     word ptr [SEQ_GAP_WRITE_SEG], es
        call    L_02DC0
        call    L_0AC61
        ret
calls_check_status_flag_596c_02c12:
        call    seq_edit_allowed
L_02C15:
        je      calls_call_with_check_02c18
        ret
calls_call_with_check_02c18:
        if      FW_VERSION = 172
        mov     byte ptr [P_70F9], 0
        endif
calls_call_with_check_02c1d:
        call    call_with_check
calls_init_with_int50_02c20:
        call    main_screen_enter
        callf   CS1_SEG:CHANGE_BARS_INSDEL_OFS
        sub     ax, ax
        mov     word ptr [INSBARS_AFTER_BAR], ax
        mov     word ptr [DELBARS_FIRST], ax
        mov     word ptr [DELBARS_LAST], ax
        mov     word ptr [INSBARS_COUNT], 0
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ax, word ptr es:[18h]
        dec     ax
        mov     word ptr [INDEL_SEQ_LAST_BAR], ax
bc_int5d_02c45:
        int     50h
bc_int5d_02c47:
        call    change_bars_indel_after_bar_field
bc_int5d_02c4a:
        INT_5D change_bars_indel_refresh
bc_int67_68_02c4e:
        INT_65 change_bars_indel_insert
bc_int5b_02c52:
        INT_67 calls_init_with_int50_02bc0
bc_int5b_02c56:
        INT_68 change_bars_indel_delete
bc_int5b_02c5a:
        INT_5B calls_init_with_int50_02bc0
calls_dispatch_int6d_6e_02c5e:
        if      FW_VERSION = 172
        db      0c7h, 06h, 50h, 0eh, 0c0h
calls_dispatch_int6d_6e_02c63:
        push    cs
        else
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
        endif
calls_dispatch_int6d_6e_02c64:
        call    dispatch_int6d_6e
        ret
change_bars_indel_refresh:
        mov     ax, word ptr [INSBARS_AFTER_BAR]
raw_02C6B:
        BC_FIELD 114, 11
L_02C70:
        mov     ax, word ptr [INSBARS_COUNT]
raw_02C73:
        BC_FIELD 114, 33
L_02C78:
        mov     ax, word ptr [DELBARS_FIRST]
        inc     ax
raw_02C7C:
        BC_FIELD 204, 11
L_02C81:
        mov     ax, word ptr [DELBARS_LAST]
        inc     ax
raw_02C85:
        BC_FIELD 204, 33
L_02C8A:
        ret
change_bars_indel_after_bar_field:
        mov     si, INSBARS_AFTER_BAR
        mov     ax, 3e6h
        mov     bx, 0
        mov     cx, P_2CAC
ui_ctrl_02c97:
        call    ui_numeric_field_setup
ui_display_112_c9a:
        BC_UI_CTRL 112, 10, 21, 9
bc_int6c_02ca1:
        if      FW_VERSION = 172
        INT_6C NULL_HANDLER_OFS, change_bars_indel_first_bar_field, NULL_HANDLER_OFS, change_bars_indel_num_bars_field
        else
        db      0cdh, 6ch
        db      0dah
        db      0eh
        db      2fh, 2ch, 0dah, 0eh, 0fdh, 2bh, 0c3h, 8bh, 1eh, 0f0h, 14h, 3bh, 0c3h, 72h, 02h, 8bh
        db      0c3h, 0a3h, 0e8h, 14h, 0c3h, 0beh, 0eah, 14h
        mov     ax, 3e6h
        mov     bx, 0
        mov     cx, 2c1eh
        call    ui_numeric_field_setup
        BC_UI_CTRL 112, 32, 21, 9
        db      0cdh, 6ch, 0dah, 0eh, 67h, 2ch, 0ceh, 2bh, 0dah, 0eh, 0c3h, 0bbh, 0e6h, 03h, 2bh, 1eh
        db      0f0h, 14h, 3bh, 0c3h, 72h, 02h, 8bh, 0c3h, 0a3h, 0eah, 14h, 0c3h, 0beh
        db      0ech
        db      14h, 0b8h, 0e6h, 03h, 0bbh, 00h, 00h, 0b9h, 50h
        db      2ch
        db      0e8h, 86h, 0dfh
        BC_UI_CTRL 202, 10, 21, 9
        db      0cdh, 6ch, 0ceh, 2bh, 0dah
        db      0eh
        db      0dah, 0eh, 67h
        db      2ch
        endif
L_02CAB:
        ret
L_02CAC:
        mov     bx, word ptr [INDEL_SEQ_LAST_BAR]
        cmp     ax, bx
L_02CB2:
        if      FW_VERSION = 172
        jb      L_02CB6
        mov     ax, bx
L_02CB6:
        mov     word ptr [INSBARS_AFTER_BAR], ax
        ret
change_bars_indel_num_bars_field:
        mov     si, INSBARS_COUNT
        mov     ax, 3e6h
        mov     bx, 0
        mov     cx, L_02CDB
ui_ctrl_02cc6:
        call    ui_numeric_field_setup
ui_display_112_cc9:
        BC_UI_CTRL 112, 32, 21, 9
bc_int6c_02cd0:
        INT_6C NULL_HANDLER_OFS, change_bars_indel_last_bar_field, change_bars_indel_after_bar_field, NULL_HANDLER_OFS
L_02CDA:
        ret
L_02CDB:
        mov     bx, 3e6h
        sub     bx, word ptr [INDEL_SEQ_LAST_BAR]
        cmp     ax, bx
L_02CE4:
        jb      L_02CE8
        mov     ax, bx
L_02CE8:
        mov     word ptr [INSBARS_COUNT], ax
        ret
change_bars_indel_first_bar_field:
        mov     si, DELBARS_FIRST
        mov     ax, 3e6h
        mov     bx, 0
        mov     cx, L_02D0D
ui_ctrl_02cf8:
        call    ui_numeric_field_setup
ui_ctrl_202_cfb:
        BC_UI_CTRL 202, 10, 21, 9
bc_int6c_02d02:
        INT_6C change_bars_indel_after_bar_field, NULL_HANDLER_OFS, NULL_HANDLER_OFS, change_bars_indel_last_bar_field
L_02D0C:
        ret
L_02D0D:
        mov     bx, word ptr [INDEL_SEQ_LAST_BAR]
        cmp     ax, bx
L_02D13:
        endif
        jb      br_02D17
        mov     ax, bx
br_02D17:
        mov     word ptr [DELBARS_FIRST], ax
        cmp     ax, word ptr [DELBARS_LAST]
        jb      L_02D23
        mov     word ptr [DELBARS_LAST], ax
L_02D23:
        ret
change_bars_indel_last_bar_field:
        mov     si, DELBARS_LAST
        mov     ax, 3e6h
        mov     bx, 0
        mov     cx, p_2d45
ui_ctrl_02d30:
        call    ui_numeric_field_setup
ui_ctrl_202_d33:
        BC_UI_CTRL 202, 32, 21, 9
bc_int6c_02d3a:
        if      FW_VERSION = 172
        INT_6C change_bars_indel_num_bars_field, NULL_HANDLER_OFS, change_bars_indel_first_bar_field, NULL_HANDLER_OFS
L_02D44:
        else
        db      0cdh
        insb
        std
        sub     bx, dx
        push    cs
        das
        sub     al, 0dah
        push    cs
        endif
        ret
p_2d45:
        if      FW_VERSION = 150
L_03891                         equ     $+9
        endif
        db      3bh, 06h, 0f0h, 14h, 72h, 03h, 0a1h, 0f0h, 14h, 0a3h, 0eeh, 14h, 3bh, 06h, 0ech, 14h
        if      FW_VERSION = 150
L_02D44                         equ     $+5
        endif
        db      73h, 03h, 0a3h, 0ech, 14h, 0c3h
change_bars_indel_insert:
        mov     ax, word ptr [INSBARS_COUNT]
        or      ax, ax
L_02D60:
        jne     L_02D63
        ret
L_02D63:
        mov     bx, 6
        mul     bx
        shr     ax, 4
        add     ax, 4
        mov     bx, word ptr [SEQ_AFTER_GAP_SEG]
        sub     bx, word ptr [SEQ_GAP_WRITE_SEG]
        cmp     ax, bx
L_02D78:
        jb      br_02D7D
        if      FW_VERSION = 172
        db      0e9h, 56h, 0b3h
        else
        db      0e9h
        db      0ebh, 0b0h
        endif
br_02D7D:
        callf   CS1_SEG:seq_undo_checkpoint_far
        mov     ax, word ptr [INSBARS_AFTER_BAR]
        callf   CS1_SEG:P_71CD
        les     di, [FP_SEQ_GAP_WRITE]
        mov     cx, word ptr [INSBARS_COUNT]
        mov     dl, byte ptr [SEQ_TEMPLATE+1ah]
        mov     dh, byte ptr [SEQ_TEMPLATE+1bh]
        sub     bx, bx
tgt_02D9C:
        mov     al, 0c0h
        stosb
        mov     ax, bx
        stosw
        mov     ax, dx
        stosw
        mov     al, 0
        stosb
        inc     bx
        cmp     di, 10h
        jb      br_02DB6
        sub     di, 10h
        mov     ax, es
        inc     ax
        mov     es, ax
br_02DB6:
        loop    tgt_02D9C
        mov     word ptr [FP_SEQ_GAP_WRITE], di
        mov     word ptr [SEQ_GAP_WRITE_SEG], es
L_02DC0:
        mov     al, 0ffh
        stosb
L_02DC3:
        call    seq_renumber_bar_markers_from_start
        callf   CS1_SEG:P_71B5
        callf   CS1_SEG:seq_rewind_to_start_far
        callf   CS1_SEG:P_7241
L_02DD5:
        call    calls_init_with_int50_02bc0
        ret
change_bars_indel_delete:
        mov     ax, word ptr [DELBARS_FIRST]
        mov     bx, word ptr [DELBARS_LAST]
        mov     cx, word ptr [INDEL_SEQ_LAST_BAR]
        or      ax, ax
        jne     br_02DF4
        cmp     ax, cx
        jne     br_02DEF
        jmp     calls_init_with_int50_02bc0
br_02DEF:
        cmp     bx, cx
        jne     br_02DF4
        inc     ax
br_02DF4:
        push    ax
        callf   CS1_SEG:seq_undo_checkpoint_far
        pop     ax
        callf   CS1_SEG:P_71CD
        les     di, [FP_SEQ_GAP_WRITE]
        push    es
        push    di
        mov     ax, word ptr [DELBARS_LAST]
        inc     ax
        callf   CS1_SEG:P_71CD
        pop     di
        pop     es
        mov     word ptr [FP_SEQ_GAP_WRITE], di
        mov     word ptr [SEQ_GAP_WRITE_SEG], es
        call    L_02DC0
L_02E1C:
        call    L_0AC61
        ret
seq_renumber_bar_markers_far:
        call    seq_renumber_bar_markers
        retf
seq_renumber_bar_markers_from_start:
        callf   CS1_SEG:seq_rewind_to_start_far
        les     si, [FP_SEQ_AFTER_GAP]
seq_renumber_bar_markers:
        sub     ax, ax
loop_02E2F:
        cmp     byte ptr es:[si], 0ffh
        je      br_02E52
        cmp     byte ptr es:[si], 0c0h
        jne     br_02E40
        mov     word ptr es:[si+1], ax
        inc     ax
br_02E40:
        add     si, 6
        cmp     si, 10h
        jb      loop_02E2F
        sub     si, 10h
        mov     dx, es
        inc     dx
        mov     es, dx
        jmp     loop_02E2F
br_02E52:
        dec     ax
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     word ptr es:[18h], ax
        cmp     ax, word ptr es:[1ch]
        ja      br_02E68
        dec     ax
        mov     word ptr es:[1ch], ax
        inc     ax
br_02E68:
        cmp     word ptr es:[1eh], -1
        je      calls_check_status_flag_596c_02e7c
        cmp     ax, word ptr es:[1eh]
        ja      calls_check_status_flag_596c_02e7c
        dec     ax
        mov     word ptr es:[1eh], ax
calls_check_status_flag_596c_02e7c:
        ret
calls_check_status_flag_596c_02e7d:
        call    seq_edit_allowed
        je      br_02E83
        ret
br_02E83:
        mov     al, byte ptr [B_14D2]
        or      al, byte ptr [B_14D1]
calls_check_es_flag_13_02e8a:
        je      calls_check_es_flag_13_02e8f
        jmp     calls_init_state_03052
calls_check_es_flag_13_02e8f:
        call    check_es_flag_13
calls_check_and_call_02e92:
        jne     calls_check_and_call_02e95
        ret
L_039D8:


calls_check_and_call_02e95:
        call    check_and_call
L_02E98:
        INT_6D locate_key_step_back, locate_key_step_fwd, NULL_HANDLER_OFS, locate_key_bar_back, locate_key_bar_fwd
L_02EA4:
        INT_6E NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS
L_02EB0:
        mov     word ptr [W_0EE4], P_2EE4
        ret
locate_key_step_back:
        callf   CS1_SEG:P_71F5
        jmp     SHORT L_02ED1
locate_key_step_fwd:
        callf   CS1_SEG:P_71F1
        jmp     SHORT L_02ED1
locate_key_bar_back:
        callf   CS1_SEG:P_7209
        jmp     SHORT L_02ED1
locate_key_bar_fwd:
        if      FW_VERSION = 172
        callf   CS1_SEG:locate_bar_fwd_to_end_far
        else
        callf   CS1_SEG:L_17869_V150
L_03A14:
        endif
L_02ED1:
        mov     word ptr [W_0EE4], main_screen_install_transport_handlers
L_02ED7:
        INT_6E transport_handler_rec, transport_handler_over_dub, transport_handler_stop, transport_handler_play, transport_handler_play_start
L_02EE3:
        ret
L_02EE4:
        callf   CS1_SEG:LOCATE_DIALOG_FAR_OFS
bc_int67_68_02ee9:
        int     50h
bc_int67_68_02eeb:
        mov     word ptr [UI_SLOT_DIGIT], p_2f04
bc_int5b_02ef1:
        INT_67 main_screen_enter
bc_int5b_02ef5:
        INT_68 pressing_1_9_keys_will_status
bc_int5b_02ef9:
        INT_5B main_screen_enter
L_02EFD:
        mov     word ptr [W_0DFC], main_screen_enter
        ret
p_2f04:
        if      FW_VERSION = 172
        db      2ch, 01h, 73h, 01h, 0c3h, 2ah, 0e4h, 0c1h, 0e0h, 02h, 05h, 0dfh, 0bh, 8bh, 0f0h, 0adh
        db      8bh, 0ch, 8eh, 06h, 0ah, 1dh, 26h, 3bh, 06h, 18h, 00h
L_02F1F:
        jb      calls_state_update_02f29
L_02F21:
        je      L_02F24
        else
        sub     al, 1
        jae     L_02F24
        endif
        ret
        if      FW_VERSION = 172
L_02F24:
        or      cx, cx
L_02F26:
        je      calls_state_update_02f29
        ret
calls_state_update_02f29:
        push    ax
        push    cx
        mov     bx, ax
        call    state_update
        mul     bx
        mov     bx, ax
        pop     cx
        pop     ax
        cmp     cx, bx
pressing_1_9_keys_will_status_02F38:
        jb      store_locate_point_dialog
        ret
        else
L_02F24:
        sub     ah, ah
        shl     ax, 2
        add     ax, LOCATE_PT1
        mov     si, ax
        lodsw
        mov     cx, word ptr [si]
        endif
store_locate_point_dialog:
        callf   CS1_SEG:SEQ_POSITION_SET_FAR_OFS
        callf   CS1_SEG:seq_pos_recalc_and_send_spp_far
        call    main_screen_enter
        ret
pressing_1_9_keys_will_status:
        if      FW_VERSION = 150
PRESSING_1_9_KEYS_WILL_STATUS_V150:
L_03ABA                         equ     $+83
        endif
        BC_FILE_DIALOG 29, 2, 190, 58, "Store locate point"
locate_keys_screen:
        BC_STATUS 60, 20, "Pressing 1-9 keys will"
store_now_time_display:
        BC_STATUS 60, 30, "store Now time."
cancel_button_a:
        BC_SOFTKEY 5, BC_SK_FILL,  "CANCEL"
softkey_cancel_02fa0:
        int     50h
bc_int5b_02fa2:
        INT_68 main_screen_enter
calls_dispatch_int6d_6e_02fa6:
        mov     word ptr [UI_SLOT_DIGIT], L_02FC0
calls_dispatch_int6d_6e_02fac:
        if      FW_VERSION = 150
L_03ACC_V150                    equ     $+2
        endif
        INT_5B calls_check_status_flag_596c_02e7d
calls_dispatch_int6d_6e_02fb0:
        call    dispatch_int6d_6e
L_02FB3:
        INT_6D main_screen_enter, main_screen_enter, main_screen_enter, main_screen_enter, main_screen_enter
calls_init_with_int50_02fbf:
        ret
        if      FW_VERSION = 150
L_03AE0                         equ     $+2
L_03AE3                         equ     $+5
        endif
L_02FC0:
        db      2ch, 01h, 73h, 01h, 0c3h, 2ah, 0e4h, 0c1h, 0e0h, 02h, 05h, 0dfh, 0bh, 8bh, 0f0h, 0a1h
        if      FW_VERSION = 172
        db      40h, 1dh, 89h, 04h, 0a1h, 42h, 1dh, 89h, 44h, 02h
        else
        db      34h, 1dh, 89h, 04h, 0a1h, 36h, 1dh, 89h, 44h, 02h
        endif
calls_init_with_int50_02fda:
        call    main_screen_enter
        ret
main_screen_install_transport_handlers_far:
        call    main_screen_install_transport_handlers
        retf
main_screen_install_play_handlers_far:
        call    main_screen_install_play_handlers
        retf
L_02FE6:
        mov     word ptr [UI_REL_SLOT_REC], P_3242
        retf
L_02FED:
        mov     word ptr [UI_REL_SLOT_ODUB], P_3242
        retf
L_03B12:
main_screen_install_transport_handlers:
        if      FW_VERSION = 150
L_03B18                         equ     $+6
        endif
        INT_6D main_screen_step_back, main_screen_step_fwd, calls_check_status_flag_596c_02e7d, main_screen_bar_back, main_screen_bar_fwd
L_03000:
        INT_6E transport_handler_rec, transport_handler_over_dub, transport_handler_stop, transport_handler_play, transport_handler_play_start
L_0300C:
        mov     word ptr [W_0EE4], NULL_HANDLER_OFS
        mov     word ptr [UI_REL_SLOT_REC], NULL_HANDLER_OFS
        mov     word ptr [UI_REL_SLOT_ODUB], NULL_HANDLER_OFS
        ret
L_0301F:
        cmp     byte ptr [B_14D6], 0
L_03024:
        je      L_03027
        ret
L_03B45:
L_03027:
        if      FW_VERSION = 150
L_03B47                         equ     $+2
        endif
        INT_6D calls_init_state_03052, calls_init_state_03052, calls_init_state_03052, calls_init_state_03052, calls_init_state_03052
L_03033:
        INT_6E calls_init_state_030c8, calls_init_state_030e2, calls_init_state_030fc, calls_init_state_03156, calls_init_state_03177
L_0303F:
        mov     word ptr [W_0EE4], NULL_HANDLER_OFS
        mov     word ptr [UI_REL_SLOT_REC], NULL_HANDLER_OFS
        mov     word ptr [UI_REL_SLOT_ODUB], NULL_HANDLER_OFS
        ret
calls_init_state_03052:
        call    calls_setup_handler_03059
calls_init_state_03055:
        call    init_state
        ret
calls_setup_handler_03059:
        mov     bx, UI_SLOT_EXIT
calls_setup_handler_0305c:
        call    setup_handler
        ret
main_screen_step_fwd:
        mov     al, byte ptr [B_14D2]
        or      al, byte ptr [B_14D1]
calls_check_es_flag_13_03067:
        je      calls_check_es_flag_13_0306b
        jmp     SHORT calls_init_state_03052
calls_check_es_flag_13_0306b:
        call    check_es_flag_13
        if      FW_VERSION = 172
calls_check_and_call_0306e:
        endif
        jne     calls_check_and_call_03071
        ret
        if      FW_VERSION = 150
calls_check_and_call_0306e:
        endif
calls_check_and_call_03071:
        call    check_and_call
        callf   CS1_SEG:P_71ED
        ret
main_screen_step_back:
        mov     al, byte ptr [B_14D2]
        or      al, byte ptr [B_14D1]
calls_check_es_flag_13_03081:
        je      calls_check_es_flag_13_03085
        jmp     SHORT calls_init_state_03052
calls_check_es_flag_13_03085:
        call    check_es_flag_13
calls_check_and_call_03088:
        jne     calls_check_and_call_0308b
        ret
calls_check_and_call_0308b:
        call    check_and_call
        callf   CS1_SEG:locate_step_back_far
        ret
main_screen_bar_fwd:
        mov     al, byte ptr [B_14D2]
        or      al, byte ptr [B_14D1]
calls_check_es_flag_13_0309b:
        je      calls_check_es_flag_13_0309f
        jmp     SHORT calls_init_state_03052
calls_check_es_flag_13_0309f:
        call    check_es_flag_13
calls_check_and_call_030a2:
        jne     calls_check_and_call_030a5
        ret
calls_check_and_call_030a5:
        call    check_and_call
        callf   CS1_SEG:P_71E5
        ret
main_screen_bar_back:
        mov     al, byte ptr [B_14D2]
        or      al, byte ptr [B_14D1]
calls_check_es_flag_13_030b5:
        je      calls_check_es_flag_13_030b9
        jmp     SHORT calls_init_state_03052
calls_check_es_flag_13_030b9:
        call    check_es_flag_13
calls_check_and_call_030bc:
        jne     calls_check_and_call_030bf
        ret
calls_check_and_call_030bf:
        call    check_and_call
L_030C2:
        callf   CS1_SEG:P_71E9
        ret
calls_init_state_030c8:
        call    calls_setup_handler_03059
calls_init_state_030cb:
        call    init_state
transport_handler_rec:
        cmp     byte ptr [B_14D3], 0
L_030D3:
        je      L_030D6
        ret
L_03C0E:
L_030D6:
        if      FW_VERSION = 172
        db      0e8h
free_memory_display:
        cmpsw
        jmp     L_030C2
        db      6dh, 0ebh, 9ah
        dw      transport_far_thunk_table
        dw      CS1_SEG
        db      0c3h
        else
        call    call_with_check
        call    check_and_call
        callf   CS1_SEG:transport_far_thunk_table
        ret
        endif
calls_init_state_030e2:
        call    calls_setup_handler_03059
calls_init_state_030e5:
        call    init_state
transport_handler_over_dub:
        cmp     byte ptr [B_14D3], 0
calls_call_with_check_030ed:
        je      calls_call_with_check_030f0
        ret
calls_call_with_check_030f0:
        call    call_with_check
calls_check_and_call_030f3:
        call    check_and_call
        callf   CS1_SEG:OVER_DUB_ARM_TOGGLE_FAR_OFS
        ret
calls_init_state_030fc:
        call    calls_setup_handler_03059
calls_init_state_030ff:
        call    init_state
transport_handler_stop:
        BC_MODE
        if      FW_VERSION = 172
        db      0c6h
L_03106:
        push    es
        dec     dx
        and     byte ptr [bx+si], al
        endif
        cmp     byte ptr [G_SEND_MMC], 0
L_0310F:
        je      calls_check_es_flag_13_03128
        mov     al, 0
        xchg    byte ptr [P_1D95], al
        cmp     al, 0
L_03119:
        jne     calls_check_es_flag_13_03128
        callf   CS1_SEG:P_62EF
        cmp     byte ptr [G_SYNC_IN_MODE], 1
calls_check_es_flag_13_03125:
        jne     calls_check_es_flag_13_03128
        ret
calls_check_es_flag_13_03128:
        call    check_es_flag_13
L_0312B:
        jne     br_0312E
        ret
br_0312E:
        cmp     byte ptr [G_SYNC_OUT_MODE], 1
        jne     calls_init_state_03155
        mov     ax, word ptr [SEQ_ABS_TICK_LO]
        mov     dx, word ptr [SEQ_ABS_TICK_HI]
        mov     bx, 18h
        cmp     dx, bx
        jae     calls_init_state_03155
        div     bx
        or      dx, dx
        je      L_03150
        mul     bx
        callf   CS1_SEG:seq_position_set_from_ticks_far
L_03150:
        callf   CS1_SEG:seq_pos_recalc_and_send_spp_far
calls_init_state_03155:
        ret
calls_init_state_03156:
        call    calls_setup_handler_03059
calls_init_state_03159:
        call    init_state
transport_handler_play:
        call    check_es_flag_13
calls_check_and_call_0315f:
        jne     calls_check_and_call_03162
        ret
calls_check_and_call_03162:
        call    check_and_call
        mov     al, byte ptr [SEQ_REC_ARMED]
        or      al, byte ptr [SEQ_ODUB_ARMED]
        je      L_03171
L_0316E:
        call    calls_call_with_check_03198
L_03171:
        callf   CS1_SEG:sequencer_start_keep_position_far
        ret
calls_init_state_03177:
        call    calls_setup_handler_03059
calls_init_state_0317a:
        call    init_state
transport_handler_play_start:
        call    check_es_flag_13
calls_check_and_call_03180:
        jne     calls_check_and_call_03183
        ret
calls_check_and_call_03183:
        call    check_and_call
        mov     al, byte ptr [SEQ_REC_ARMED]
        or      al, byte ptr [SEQ_ODUB_ARMED]
        je      calls_call_with_check_03192
L_0318F:
        call    calls_call_with_check_03198
calls_call_with_check_03192:
        callf   CS1_SEG:SEQUENCER_START_FROM_TOP_FAR_OFS
        ret
calls_call_with_check_03198:
        call    call_with_check
        push    word ptr [SEQ_CUR_BAR]
        push    word ptr [SEQ_BAR_TICK]
        callf   CS1_SEG:seq_edit_end_far
        callf   CS1_SEG:undo_seq_save_far
        callf   CS1_SEG:seq_edit_begin_far
        pop     cx
        pop     ax
        callf   CS1_SEG:SEQ_POSITION_SET_FAR_OFS
        ret
L_03CD3:
main_screen_install_play_handlers:
        INT_6D NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS
L_031C6:
        INT_6E main_screen_rec, handler_BC_UI_A4, mode_03248, main_screen_play, NULL_HANDLER_OFS
L_031D2:
        mov     word ptr [W_0EE4], NULL_HANDLER_OFS
        ret
main_screen_rec:
        cmp     byte ptr [G_NEXT_SEQ], 0ffh
L_031DE:
        je      L_031E1
        ret
L_031E1:
        cmp     byte ptr [G_NEXTSEQ_CHAINED], 0
L_031E6:
        je      L_031E9
        ret
L_031E9:
        cmp     byte ptr [B_14D3], 0
L_031EE:
        je      ui_a_031F1
        ret
ui_a_031F1:
        mov     al, byte ptr [SEQ_REC_ARMED]
        xor     al, 1
        and     al, byte ptr [D_0B16]
        mov     byte ptr [SEQ_REC_ARMED], al
        mov     byte ptr [B_1D92], al
        mov     byte ptr [SEQ_ODUB_ARMED], 0
        ret
handler_BC_UI_A4:
        cmp     byte ptr [G_NEXT_SEQ], 0ffh
L_0320B:
        je      L_0320E
        ret
L_0320E:
        cmp     byte ptr [G_NEXTSEQ_CHAINED], 0
L_03213:
        je      L_03216
        ret
L_03216:
        cmp     byte ptr [B_14D3], 0
L_0321B:
        je      L_0321E
        ret
L_0321E:
        mov     al, byte ptr [SEQ_ODUB_ARMED]
        xor     al, 1
        and     al, byte ptr [D_0B16]
        mov     byte ptr [SEQ_ODUB_ARMED], al
        mov     byte ptr [B_1D92], al
        mov     byte ptr [SEQ_REC_ARMED], 0
        ret
main_screen_play:
        cmp     byte ptr [G_REC_KEY_HELD], 0
L_03238:
        jne     main_screen_rec
        cmp     byte ptr [G_ODUB_KEY_HELD], 0

ui_a_0323F:
        jne     handler_BC_UI_A4
        ret
L_03242:
        if      FW_VERSION = 172
        db      9ah
        dw      L_170B5
save_as_screen:
        dw      CS1_SEG
        db      0c3h
        else
        callf   CS1_SEG:L_17899_V150
        ret
        endif
mode_03248:
        BC_MODE
        db      81h
L_0324C:
        db      3eh
        push    ax
        push    cs
        if      FW_VERSION = 172
        dec     dx
        db      0e0h, 75h
        add     bp, ax
        mov     ah, 0adh
        else
        and     bl, ch
        jne     L_03D6F
        db      0e8h
        db      73h, 0abh
L_03D6F:
        endif
        cmp     byte ptr [G_NEXT_SEQ], 0ffh
        je      br_03260
L_0325D:
        call    ui_ctrl_0195b
br_03260:
        cmp     byte ptr [B_14D3], 0
        je      L_0326A
L_03267:
        call    calls_check_flags_1d8a_1d8b_06fbe
L_0326A:
        cmp     word ptr [UI_SLOT_OPEN_WINDOW], main_screen_tempo_window
        jne     L_03275
L_03272:
        call    fn_0228E
L_03275:
        cmp     byte ptr [G_SEND_MMC], 0
L_0327A:
        je      L_03299
        if      FW_VERSION = 172
        cmp     byte ptr [P_1D95], 0
L_03281:
        je      L_0329F
        cmp     byte ptr [P_1D95], 0fch
L_03288:
        je      L_03299
        else
        mov     al, 0
        xchg    byte ptr [P_1D95], al
        cmp     al, 0
        jne     L_03DB5
        endif
        mov     al, byte ptr [SYNC_OUT_STARTED]
        push    ax
        callf   CS1_SEG:P_62EF
        if      FW_VERSION = 150
        cmp     byte ptr [G_SYNC_IN_MODE], 1
        endif
        pop     ax
        if      FW_VERSION = 150
        jne     L_03DB5
        endif
        cmp     al, 0
L_03296:
        je      L_03299
        ret
L_03DB5:
L_03299:
        callf   CS1_SEG:P_7215
        ret
        if      FW_VERSION = 172
L_0329F:
        callf   CS1_SEG:midi_send_stop
        callf   CS1_SEG:sequencer_stop_far
        ret
        else
        db      00h
        endif
jmp_ferr_too_many_files:
        jmpf    CS1_SEG:ferr_too_many_files
jmp_ferr_write_protect:
        jmpf    CS1_SEG:ferr_write_protect
jmp_ferr_no_disk:
        jmpf    CS1_SEG:ferr_no_disk
jmp_ferr_format_invalid:
        jmpf    CS1_SEG:ferr_format_invalid
jmp_ferr_scsi_not_ready:
        jmpf    CS1_SEG:ferr_scsi_not_ready
jmp_ferr_no_scsi_device:
        jmpf    CS1_SEG:ferr_no_scsi_device
jmp_ferr_write_error:
        jmpf    CS1_SEG:ferr_write_error
jmp_ferr_wrong_disk:
        jmpf    CS1_SEG:ferr_wrong_disk
jmp_ferr_no_f_rom:
        jmpf    CS1_SEG:ferr_no_f_rom
L_03DE9:
L_032D7:
        cmp     byte ptr [G_DISK_DEVICE], 9
saving_msg:
        jne     error_disk_full_032FB
error_from_full:
        INT_2A "       F-ROM full  !!     "
L_03E0D:
error_disk_full_032FB:
        INT_2A "        Disk full  !!     "
saving_screen_display:
SAVING_SCREEN_DISPLAY_V150:
        BC_PRINT "          Saving....."
print_saving_03331:
        ret
calls_mode_handler_03332:
        call    mode_handler
        call    word ptr [PTR_SAVE_SCREEN_FN]
        call    word ptr [UI_SLOT_REFRESH]
        cmp     word ptr [PTR_SAVE_SCREEN_FN], save_copy_os_screen
calls_wait_loop_03343:
        jne     free_eq_status
        ret
free_eq_status:
        call    wait_loop
free_status:
        call    memory_copy
memory_free_display_a:
        BC_STATUS 170, 39, " Free=       "
lcd_coord_0335F:
        BC_FLUSH
L_03362:
        db      0e8h
        if      FW_VERSION = 172
new_name_screen:
        inc     dx
L_03365                         equ     $+1
        mov     ch, 0e8h
calls_pad_handler_0421_03368    equ     $+2
        imul    cx, word ptr [di], -18h
        mov     bl, 0eh
        else
        aad     0b2h
L_03365:
        call    lcd_update
calls_pad_handler_0421_03368:
        call    clear_rect_0421E
        endif
seq_init_0336B:
        BC_SEQ_INIT
L_0336E:
        mov     ax, ds
        mov     es, ax
        mov     cx, 10h
        mov     al, 20h
        mov     di, P_17F2
        rep stosb
L_0337C:
        call    int2c_device_is_9
        mov     al, 3
        int     3bh
        call    L_03AB2
        ret
calls_word_03387:
        call    word ptr [PTR_SAVE_SCREEN_FN]
        ret
L_03E9E:
mode_handler:
        callf   CS1_SEG:DISK_SAVE_VIEW_OFS
L_03391:
        int     50h
calls_pad_handler_0421_03393:
        mov     byte ptr [B_0B1C], 1
        call    load_page_softkeys
calls_pad_handler_0421_0339b:
        call    clear_rect_0421E
        ret
ui_a_0339F:
        if      FW_VERSION = 172
handler_BC_UI_A0                equ     $+1
        endif
        mov     bl, 11h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_033A5:
        int     2ch
L_033A7:
        jb      calls_memory_copy_033b3
        mov     al, byte ptr [G_DISK_DEVICE]
        cmp     al, byte ptr [G_DIR_CACHED_DEVICE]
calls_memory_copy_033b0:
        jne     calls_memory_copy_033b3
        ret
calls_memory_copy_033b3:
        call    memory_copy
        ret
poll_033B7:
        if      FW_VERSION = 172
handler_BC_POLL                 equ     $+2
        mov     word ptr [PTR_SAVE_SCREEN_FN], poll_033B7
        callf   CS1_SEG:save_all_sequences_songs_status
        else
        db      0c7h, 06h
handler_BC_POLL:
        push    si
        pop     ss
        db      0c9h, 32h
        db      9ah
        dw      save_all_sequences_songs_status
        dw      CS1_SEG
        endif
L_033C2:
        INT_5F save_seq_screen
bc_int6c_033c6:
        INT_5E NULL_HANDLER_OFS
bc_int6c_033ca:
        if      FW_VERSION = 172
        INT_6C NULL_HANDLER_OFS, save_device_field, NULL_HANDLER_OFS, calls_poll_033_033e1
        else
        db      0cdh, 6ch
        db      0dah
        db      0eh
        db      59h, 40h, 0dah
        db      0eh
        db      0f3h, 32h, 0cdh, 5bh, 4fh
        db      33h
        endif
bc_int5d_033d4:
        if      FW_VERSION = 172
        INT_5B bc_int5b_0343d
        endif
bc_int5d_033d8:
        INT_5D clear_rect_03404
calls_poll_033_033dc:
        INT_69 file_name_status
calls_poll_033_033e0:
        ret
calls_poll_033_033e1:
        call    poll_033B7
        mov     word ptr [PTR_SAVE_SCREEN_FN], calls_poll_033_033e1
ui_mode_3ea:
        BC_UI_CTRL 29, 8, 139, 9
bc_int6c_033f1:
        INT_6C NULL_HANDLER_OFS, save_device_field, poll_033B7, save_device_field
L_033FB:
        INT_5F NULL_HANDLER_OFS
L_033FF:
        INT_5E NULL_HANDLER_OFS
L_03403:
        ret
clear_rect_03404:
        BC_CLEAR_RECT 30, 9, 120, 7
L_0340B:
        mov     si, STR_DEFAULT_ALL_FILENAME
        mov     dx, ds
status_b_03410:
        BC_STATUS_B 30, 9, 16
        db      9ah
        dw      arena_first_seq_far
        dw      CS1_SEG
        db      06h, 9ah
        dw      arena_find_end_far
        dw      CS1_SEG
        db      8ch, 0c0h, 5bh, 2bh
        db      0c3h, 05h, 53h, 00h, 05h, 10h, 00h, 05h, 94h, 02h, 05h, 0c6h, 00h, 0c1h, 0e8h, 06h
        db      2bh, 0d2h
op__03437:
        BC_OP_3A 206, 9
L_0343C:
        ret
bc_int5b_0343d:
        callf   CS1_SEG:all_sequence_and_songs_dialog
bc_int5b_03442:
        int     50h
bc_int5b_03444:
        INT_5B save_all_file_dialog_03460
bc_int67_68_03448:
        mov     word ptr [W_0DC4], save_all_file_dialog_03460
bc_int67_68_0344e:
        INT_67 save_all_file_dialog_03460
file_name_status_03452:
        mov     cl, 5ah
        mov     ch, 18h
        mov     ax, ds
        mov     es, ax
        mov     si, STR_DEFAULT_ALL_FILENAME
        int     42h
        ret
save_all_file_dialog_03460:
        call    mode_handler
        jmp     NEAR poll_033B7
file_name_status:
        call    check_flag_78a8
save_all_file_dialog:
        BC_FILE_DIALOG 29, 2, 190, 58, "Save ALL file"
file_name_display:
        BC_STATUS 36, 24, "File^name:"
status_filename_0348e:
        mov     si, D_1679
        mov     dx, ds
status_b_03493:
        BC_STATUS_B 54, 40, 24
        mov     si, STR_DEFAULT_ALL_FILENAME
        mov     dx, ds
status_b_0349E:
        BC_STATUS_B 93, 24, 20
        if      FW_VERSION = 172
        db      0b8h, 0c9h, 34h
        else
        db      0b8h
        db      0dbh, 33h
        endif
bc_int5d_034a7:
        call    save_dialog_common_setup
bc_int5d_034aa:
        INT_5D NULL_HANDLER_OFS
bc_int67_68_034ae:
        INT_68 save_all_file_save
L_034B2:
        mov     ax, ds
        mov     es, ax
        mov     cl, 5dh
        mov     ch, 18h
        mov     si, STR_DEFAULT_ALL_FILENAME
        int     42h
        ret
save_all_file_save:
        mov     si, STR_DEFAULT_ALL_FILENAME
        mov     ax, L_034C9
        jmp     L_03C4E
L_034C9:
        call    file_create_sized
L_034CC:
        jae     L_034D1
        jmp     NEAR disk_error_report
L_034D1:
        mov     ax, ds
        mov     es, ax
        mov     si, 0a99h
        mov     cx, 10h
L_034DB:
        call    file_write_block
        mov     si, 0
        mov     cx, 530h
L_034E4:
        call    file_write_block
        mov     si, D_0B1F
        mov     cx, 100h
L_034ED:
        call    file_write_block
        mov     si, TBL_SONGS
        mov     cx, 2940h
L_034F6:
        call    file_write_block
        mov     ax, ds
        mov     es, ax
        mov     cx, 63h
        mov     di, P_7DD8
tgt_03503:
        push    cx
        mov     cx, 20h
        mov     si, P_182B
        rep movsb
        pop     cx
        loop    tgt_03503
        callf   CS1_SEG:arena_first_seq_far
        mov     ax, 0
L_03517:
        mov     bx, word ptr es:[0]
        or      bx, bx
L_0351E:
        je      br_03539
        sub     si, si
        mov     cx, 20h
        push    ax
        push    es
L_03527:
        call    file_write_block
        pop     es
        mov     bx, es
L_0352D:
        add     bx, word ptr es:[0]
        mov     es, bx
L_03534:
        pop     ax
        inc     al
        jmp     SHORT L_03517
br_03539:
        mov     ah, 63h
        sub     ah, al
        je      L_0354F
        mov     al, 20h
        mul     ah
        mov     cx, ax
        mov     ax, ds
        mov     es, ax
        mov     si, P_7DD8
L_0354C:
        call    file_write_block
L_0354F:
        callf   CS1_SEG:arena_first_seq_far
        push    es
        callf   CS1_SEG:DISK_READ_SECTOR_FAR_OFS
        mov     dx, es
        pop     es
        mov     ax, es
        sub     dx, ax
        je      L_03566
L_03563:
        call    L_043DA
L_03566:
        mov     bl, 0ah
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0356C:
        int     2ch
midi_fmt_0356E:
        call    lcd_update
midi_fmt_event_display:
        call    handler_BC_MIDI_FIELD
        ret
save_seq_screen:
        mov     word ptr [PTR_SAVE_SCREEN_FN], save_seq_screen
        callf   CS1_SEG:save_a_sequence_status
L_03580:
        INT_5F save_all_pgms_screen
bc_int6c_03584:
        INT_5E poll_033B7
bc_int6c_03588:
        INT_6C NULL_HANDLER_OFS, save_device_field, save_seq_screen, save_seq_file_field
bc_int5d_03592:
        INT_5B NULL_HANDLER_OFS
bc_int5d_03596:
        INT_5D save_seq_refresh
bc_int69_0359a:
        INT_69 save_seq_f6
L_0359E:
        ret
save_seq_file_field:
        call    save_seq_screen
        mov     word ptr [PTR_SAVE_SCREEN_FN], save_seq_file_field
        mov     al, 62h
        mov     si, SEL_SEQ
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_035b0:
        call    setup_callback_vectors
ui_field_29_5b3:
        BC_UI_CTRL 29, 8, 139, 9
bc_int6c_035ba:
        INT_6C NULL_HANDLER_OFS, save_device_field, save_seq_screen, save_device_field
L_035C4:
        ret
save_seq_refresh:
        mov     al, byte ptr [SEL_SEQ]
        push    ax
        inc     al
ui_menu_035CB:
        if      FW_VERSION = 172
L_035D1                         equ     $+6
        endif
        BC_UI_MENU 30, 9
        BC_STATUS 42, 9, ":"
        pop     ax
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        mov     word ptr [CUR_SEQ_SEG], es
L_035E1:
        jb      ui_a_035FD
        mov     si, 2
        mov     dx, es
status_b_035E8:
        BC_STATUS_B 48, 9, 16
        db      26h, 0a1h, 00h, 00h, 0c1h, 0e8h, 06h, 2bh, 0d2h
op__035F7:
        BC_OP_3A 206, 9
L_035FC:
        ret
ui_a_035FD:
        BC_UI_A4 48, 9
        db      2bh, 0c0h, 2bh, 0d2h
op__03606:
        BC_OP_3A 206, 9
L_0360B:
        ret
save_seq_f6:
        callf   CS1_SEG:rec_note_is_unset_far
        jae     save_as_status_03614
        ret
save_as_status_03614:
        push    ds
        mov     si, 2
        mov     di, STR_DEFAULT_MID_FILENAME
        mov     cx, 10h
        mov     bx, ds
        mov     es, bx
save_a_sequence_dialog:
        mov     ds, word ptr [CUR_SEQ_SEG]
        rep movsb
        pop     ds
save_as_status:
        call    check_flag_78a8
save_sequence_file_dialog:
        BC_FILE_DIALOG 29, 2, 190, 58, "Save a Sequence"
file_save_screen_a:
        BC_STATUS 36, 16, " Save as:"
file_display:
        BC_STATUS 36, 34, "    File:"
status_file_03661:
        mov     si, STR_DEFAULT_MID_FILENAME
        mov     ax, L_036B3
bc_int5d_03667:
        call    save_dialog_common_setup
ui_ctrl_0366a:
        INT_5D status_a_03685
ui_ctrl_0366e:
        INT_68 save_a_sequence_save
ui_file_display_672:
        BC_UI_CTRL 89, 15, 97, 9
calls_setup_callback_vectors_03679:
        mov     al, 1
        mov     si, P_189B
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_03681:
        call    setup_callback_vectors
        ret
status_a_03685:
        BC_STATUS_A 90, 16, P_189B, D_175F
time_0368E:
        BC_TIME 90, 34, STR_DEFAULT_MID_FILENAME
        db      0c3h
save_a_sequence_save:
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[TBL_0013], 0
midi_fmt_036A0:
        jne     L_036A5
        jmp     NEAR L_04769
L_036A5:
        callf   CS1_SEG:seq_position_reset_far
        mov     si, STR_DEFAULT_MID_FILENAME
        mov     ax, L_036B3
        jmp     L_03C4E
L_036B3:
        call    file_create_sized
L_036B6:
        jae     L_036BB
        jmp     NEAR disk_error_report
L_036BB:
        mov     al, byte ptr [P_189B]
        mov     si, P_1807
        callf   CS1_SEG:midi_file_save_far
        if      FW_VERSION = 172
        cmp     dx, 4
L_036C9:
        jae     L_036D9
caution_250k_save:
        endif
        mov     bl, 0ah
        mov     bh, byte ptr [G_DISK_DEVICE]
L_036D1:
        int     2ch
midi_fmt_036D3:
        call    lcd_update
        jmp     handler_BC_MIDI_FIELD
L_036D9:
        if      FW_VERSION = 172
        callf   CS1_SEG:caution_dialog_1EB27
seq_init_036DE:
        BC_SEQ_INIT
bc_int67_68_036e1:
        int     50h
bc_int67_68_036e3:
        INT_68 caution_250k_save
bc_int67_68_036e7:
        INT_67 calls_mode_handler_03332
        endif
L_036EB:
        ret
save_all_pgms_screen:
        mov     word ptr [PTR_SAVE_SCREEN_FN], save_all_pgms_screen
        callf   CS1_SEG:save_all_programs_sounds_status
L_036F7:
        INT_5F save_pgm_screen
bc_int6c_036fb:
        INT_5E save_seq_screen
bc_int6c_036ff:
        INT_6C NULL_HANDLER_OFS, save_device_field, NULL_HANDLER_OFS, ui_ctrl_03716
bc_int5d_03709:
        INT_5B all_programs_sounds_save
        if      FW_VERSION = 172
bc_int5d_0370d:
        endif
        INT_5D clear_rect_03739
        if      FW_VERSION = 172
bc_int69_03711:
        endif
        INT_69 calls_check_flag_78a8_037c6
L_03715:
        ret
ui_ctrl_03716:
        call    save_all_pgms_screen
        mov     word ptr [PTR_SAVE_SCREEN_FN], ui_ctrl_03716
ui_stat_a_3685_71f:
        BC_UI_CTRL 29, 8, 139, 9
bc_int6c_03726:
        if      FW_VERSION = 172
        INT_6C NULL_HANDLER_OFS, save_device_field, save_all_pgms_screen, save_device_field
L_03730:
        else
        db      0cdh, 6ch
        db      0dah
        db      0eh
        db      59h, 40h, 0e7h, 35h, 59h, 40h
bc_int5d_0370d:
        endif
        INT_5F NULL_HANDLER_OFS
        if      FW_VERSION = 150
bc_int69_03711:
        endif
L_03734:
        INT_5E NULL_HANDLER_OFS
L_03738:
        ret
clear_rect_03739:
        BC_CLEAR_RECT 48, 9, 96, 7
status_b_03740:
        mov     si, STR_DEFAULT_APS_FILENAME
        mov     dx, ds
new_name_status_03745:
        BC_STATUS_B 30, 9, 16
        db      9ah
        dw      arena_first_seq_far
        dw      CS1_SEG
        db      8ch, 0c0h, 2dh
        dw      PROGRAM_ARENA_SEG
        db      0c1h, 0e8h, 06h, 2bh, 0d2h
all_programs_and_sounds_dialog:
        BC_OP_3A 206, 9
new_name_status:
        ret
all_programs_sounds_save:
        BC_FILE_DIALOG 29, 2, 190, 58, "ALL Programs & Sounds"
new_name_display:
        BC_STATUS 36, 24, "New name:"
status_new_name_0378c:
        mov     si, D_1679
        mov     dx, ds
status_b_03791:
        BC_STATUS_B 54, 40, 24
screen_close:
        BC_SOFTKEY 4, BC_SK_FILL,  "CLOSE"
softkey_close_037a2:
        int     50h
bc_int5b_037a4:
        INT_5B calls_mode_handler_037c0
bc_int67_68_037a8:
        mov     word ptr [W_0DC4], calls_mode_handler_037c0
bc_int67_68_037ae:
        INT_67 calls_mode_handler_037c0
L_037B2:
        mov     cl, 5ah
        mov     ch, 18h
        mov     ax, ds
        mov     es, ax
        mov     si, STR_DEFAULT_APS_FILENAME
        int     42h
        ret
calls_mode_handler_037c0:
        call    mode_handler
        jmp     NEAR save_all_pgms_screen
calls_check_flag_78a8_037c6:
        call    check_flag_78a8
        callf   CS1_SEG:save_aps_files_dialog
        mov     ax, calls_mode_handler_037ef
        mov     si, STR_DEFAULT_APS_FILENAME
calls_ui_39bd_037d4:
        call    save_dialog_common_setup
calls_ui_39bd_037d7:
        call    ui_stat_a_39ab_9bd
calls_ui_3841_037da:
        INT_5D status_a_03824
calls_ui_3841_037de:
        INT_68 save_aps_files_save
calls_ui_3841_037e2:
        call    ui_stat_b_383a_841
        ret
save_aps_files_save:
        mov     si, STR_DEFAULT_APS_FILENAME
        mov     ax, calls_mode_handler_037ef
        jmp     NEAR L_03C4E
calls_mode_handler_037ef:
        pusha
        push    es
calls_mode_handler_037f1:
        call    mode_handler
        pop     es
        popa
        sub     bx, bx
        sub     cx, cx
        sub     dx, dx
        mov     cl, byte ptr [P_189D]
        mov     dl, byte ptr [P_189E]
L_03804:
        call    int2c_device_is_9
        mov     al, 0
        int     3bh
        cmp     ax, 0
L_0380E:
        je      midi_fmt_0381E
L_03810:
        call    lcd_update
        mov     word ptr [D_0D90], midi_fmt_0381E
        mov     word ptr [D_0D92], cs
        ret
midi_fmt_0381E:
        call    lcd_update
        jmp     NEAR L_04769
status_a_03824:
        if      FW_VERSION = 172
L_03829                         equ     $+5
        endif
        BC_STATUS_A 108, 13, P_189D, TBL_WITH_SOUNDS_LABELS
        db      0a0h
        if      FW_VERSION = 172
        sahf
        else
        db      95h
        endif
        db      18h
value_03830:
        BC_VALUE 017aeh
L_03835:
        mov     si, STR_DEFAULT_APS_FILENAME
        mov     dx, ds
status_b_0383A:
        BC_STATUS_B 96, 40, 20
        db      0c3h
ui_stat_b_383a_841:
        BC_UI_CTRL 107, 12, 67, 9
bc_int6c_03848:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_stat_b_383a_862
calls_setup_callback_vectors_03852:
        mov     al, 1
        mov     si, P_189D
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_0385a:
        call    setup_callback_vectors
ui_ctrl_0385d:
        INT_5D status_a_03824
ui_ctrl_03861:
        ret
ui_stat_b_383a_862:
        BC_UI_CTRL 173, 22, 19, 9
bc_int6c_03869:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_stat_b_383a_841, bc_int6c_038a1
calls_setup_callback_vectors_03873:
        mov     al, 1
        mov     si, P_189E
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_0387b:
        call    setup_callback_vectors
bc_int5d_0387e:
        INT_5D status_a_03824
L_03882:
        mov     word ptr [D_0E30], NULL_HANDLER_OFS
        mov     word ptr [D_0E32], cs
        mov     word ptr [D_0E34], NULL_HANDLER_OFS
        mov     word ptr [D_0E36], cs
        mov     word ptr [UI_SLOT_PAD_HIT], NULL_HANDLER_OFS
        mov     word ptr [D_0E5A], cs
        ret
bc_int6c_038a1:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_stat_b_383a_862, NULL_HANDLER_OFS
bc_int5d_038ab:
        INT_5D NULL_HANDLER_OFS
L_038AF:
        mov     ax, ds
        mov     es, ax
        mov     ch, 28h
        mov     cl, 60h
        mov     si, STR_DEFAULT_APS_FILENAME
        int     42h
        ret
save_pgm_screen:
        mov     word ptr [PTR_SAVE_SCREEN_FN], save_pgm_screen
        callf   CS1_SEG:save_a_program_sounds_status
        if      FW_VERSION = 150
L_03730:
        endif
L_038C8:
        INT_5F calls_mode_handler_03a40
bc_int6c_038cc:
        INT_5E save_all_pgms_screen
bc_int6c_038d0:
        INT_6C NULL_HANDLER_OFS, save_device_field, save_pgm_screen, print_038E7
bc_int5d_038da:
        INT_5B NULL_HANDLER_OFS
bc_int5d_038de:
        INT_5D clear_rect_0390D
bc_int69_038e2:
        INT_69 save_pgm_f6
L_038E6:
        ret
print_038E7:
handler_BC_PRINT                equ     $+1
        call    save_pgm_screen
        mov     word ptr [PTR_SAVE_SCREEN_FN], print_038E7
        mov     al, 17h
        mov     si, P_189A
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_038f8:
        call    setup_callback_vectors
ui_stat_b_383a_8fb:
        BC_UI_CTRL 29, 8, 139, 9
bc_int6c_03902:
        INT_6C NULL_HANDLER_OFS, save_device_field, save_pgm_screen, save_device_field
L_0390C:
        ret
clear_rect_0390D:
        BC_CLEAR_RECT 48, 9, 96, 7
L_03914:
        mov     al, byte ptr [P_189A]
        push    ax
        inc     al
ui_menu_0391A:
        if      FW_VERSION = 172
L_03920                         equ     $+6
        endif
        BC_UI_MENU 30, 9
        BC_STATUS 42, 9, ":"
        pop     ax
        callf   CS1_SEG:arena_record_seek_far
        cmp     word ptr es:[0], 2
L_03932:
        je      ui_a_03966
        push    es
        mov     si, 2
        mov     ax, ds
        mov     bx, es
L_0393C:
        mov     ds, bx
        mov     es, ax
        mov     di, P_17DD
        mov     dx, di
        mov     cx, 10h
        rep movsb
        mov     ds, ax
        mov     si, dx
        mov     dx, ds
status_b_03950:
        BC_STATUS_B 48, 9, 16
        db      07h, 26h, 0a1h, 00h, 00h, 0c1h, 0e8h, 06h, 2bh, 0d2h
op__03960:
        BC_OP_3A 206, 9
L_03965:
        ret
ui_a_03966:
        BC_UI_A4 48, 9
        db      2bh, 0c0h, 2bh, 0d2h
op__0396F:
        BC_OP_3A 206, 9
L_03974:
        ret
save_pgm_f6:
        mov     al, byte ptr [P_189A]
        callf   CS1_SEG:arena_record_seek_far
        cmp     word ptr es:[0], 2
calls_check_flag_78a8_03983:
        jne     calls_check_flag_78a8_03986
        ret
calls_check_flag_78a8_03986:
        call    check_flag_78a8
        callf   CS1_SEG:save_a_program_dialog
        mov     si, P_17DD
        mov     dx, ds
status_b_03993:
        BC_STATUS_B 84, 40, 20
        if      FW_VERSION = 172
        db      0b8h, 00h, 3ah
        else
        db      0b8h
        db      0fbh, 38h
        endif
calls_ui_39bd_0399c:
        call    save_dialog_common_setup
calls_ui_39bd_0399f:
        call    ui_stat_a_39ab_9bd
bc_int5d_039a2:
        INT_5D status_a_039AB
bc_int67_68_039a6:
        INT_68 save_a_program_save
L_039AA:
        ret
status_a_039AB:
        if      FW_VERSION = 172
L_039B0                         equ     $+5
        endif
        BC_STATUS_A 108, 13, P_189D, TBL_WITH_SOUNDS_LABELS
        db      0a0h
        if      FW_VERSION = 172
        sahf
        else
        db      95h
        endif
        db      18h
value_039B7:
        BC_VALUE 017aeh
ui_ctrl_039bc:
        ret
ui_stat_a_39ab_9bd:
        BC_UI_CTRL 107, 12, 67, 9
bc_int6c_039c4:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_stat_a_39ab_9da
calls_setup_callback_vectors_039ce:
        mov     al, 1
        mov     si, P_189D
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_039d6:
        call    setup_callback_vectors
        ret
ui_stat_a_39ab_9da:
        BC_UI_CTRL 173, 22, 19, 9
bc_int6c_039e1:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_stat_a_39ab_9bd, NULL_HANDLER_OFS
calls_setup_callback_vectors_039eb:
        mov     al, 1
        mov     si, P_189E
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_039f3:
        call    setup_callback_vectors
        ret
save_a_program_save:
        mov     si, P_17DD
        mov     ax, calls_mode_handler_03a00
        jmp     NEAR L_03C4E
calls_mode_handler_03a00:
        pusha
        push    es
calls_mode_handler_03a02:
        call    mode_handler
toggle_03A05:
        call    clear_rect_0390D
        callf   CS1_SEG:save_a_program_sounds_status
handler_BC_TOGGLE:
        pop     es
        popa
        sub     bx, bx
        sub     cx, cx
        sub     dx, dx
        mov     bl, byte ptr [P_189A]
        mov     cl, byte ptr [P_189D]
        mov     dl, byte ptr [P_189E]
L_03A21:
        call    int2c_device_is_9
        mov     al, 1
        int     3bh
        push    ax
L_03A29:
        call    lcd_update
        pop     ax
        cmp     ax, 0
midi_fmt_03A30:
        jne     L_03A35
        jmp     NEAR L_04769
L_03A35:
        mov     word ptr [D_0D90], handler_BC_MIDI_FIELD
        mov     word ptr [D_0D92], cs
        ret
calls_mode_handler_03a40:
        mov     word ptr [PTR_SAVE_SCREEN_FN], calls_mode_handler_03a40
calls_mode_handler_03a46:
        call    mode_handler
        callf   CS1_SEG:save_a_sound_status
bc_int6c_03a4e:
        INT_6A save_copy_os_screen, save_pgm_screen
bc_int6c_03a54:
        INT_6C NULL_HANDLER_OFS, save_device_field, calls_mode_handler_03a40, ui_ctrl_03a6b
bc_int5d_03a5e:
        INT_5B NULL_HANDLER_OFS
bc_int5d_03a62:
        INT_5D save_sound_refresh
bc_int69_03a66:
        INT_69 save_a_sound_dialog
L_03A6A:
        ret
ui_ctrl_03a6b:
        call    calls_mode_handler_03a40
        mov     word ptr [PTR_SAVE_SCREEN_FN], ui_ctrl_03a6b
ui_stat_a_39ab_a74:
        BC_UI_CTRL 29, 8, 139, 9
bc_int6c_03a7b:
        if      FW_VERSION = 172
        INT_6A save_sound_file_inc, save_sound_file_dec
        else
        INT_6A L_03A8B+1, L_03A96+11
        endif
bc_int6c_03a81:
        INT_6C NULL_HANDLER_OFS, save_device_field, calls_mode_handler_03a40, save_device_field
L_03A8B:
        ret
        if      FW_VERSION = 150
        db      0a1h
        db      88h
        db      18h
        db      0bh, 06h
        db      8ah
        db      18h
        endif
save_sound_file_inc:
        if      FW_VERSION = 172
        mov     ax, word ptr [P_1890]
        or      ax, word ptr [P_1892]
        endif
L_03A93:
        jne     L_03A96
        ret
L_03A96:
        call    int2c_device_is_9
        mov     al, 4
        int     3bh
        call    L_03AB2
        ret
        if      FW_VERSION = 150
        db      0a1h
        db      88h
        db      18h
        db      0bh, 06h
        db      8ah
        db      18h
        endif
save_sound_file_dec:
        if      FW_VERSION = 172
        mov     ax, word ptr [P_1890]
        or      ax, word ptr [P_1892]
        endif
L_03AA8:
        jne     L_03AAB
        ret
L_03AAB:
        call    int2c_device_is_9
        mov     al, 5
        int     3bh
L_03AB2:
        mov     word ptr [P_1890], ax
        mov     word ptr [P_1892], dx
        mov     word ptr [P_1894], si
        mov     word ptr [P_1896], es
        or      ax, dx
        jne     L_03ACC
L_03AC5:
        mov     ax, ds
        mov     es, ax
        mov     si, STR_NO_SOUND_NAME
L_03ACC:
        mov     ax, es
        mov     bx, ds
        mov     es, bx
L_03AD2:
        mov     ds, ax
        mov     cx, 10h
        mov     di, P_17F2
        rep movsb
        mov     ds, bx
        ret
save_sound_refresh:
        mov     si, P_17F2
        mov     dx, ds
status_b_03AE4:
        BC_STATUS_B 30, 9, 16
        if      FW_VERSION = 172
        db      0a1h, 90h, 18h, 8bh, 16h, 92h, 18h, 81h, 0e2h, 0ffh, 03h, 0bbh, 00h, 04h, 0f7h
        else
        db      0a1h, 88h, 18h, 8bh, 16h, 8ah, 18h, 81h, 0e2h, 0ffh, 03h, 0bbh, 00h, 04h, 0f7h
        endif
        db      0f3h, 2bh, 0d2h
op__03AFC:
        BC_OP_3A 206, 9
file_type_status_03B01:
        ret
save_a_sound_dialog:
        mov     ax, word ptr [P_1890]
        or      ax, word ptr [P_1892]
        jne     file_type_status
        ret
file_type_status:
        call    check_flag_78a8
save_sound_file_dialog:
        BC_FILE_DIALOG 29, 2, 190, 58, "Save a Sound"
file_type_label:
        if      FW_VERSION = 172
        BC_STATUS 51, 16, "File type:"
        endif
file_label:
        if      FW_VERSION = 172
        BC_STATUS 51, 34, "File:"
        else
        BC_STATUS 51, 24, "File:"
        endif
status_file_03b3e:
        mov     si, P_17F2
        mov     dx, ds
status_b_03B43:
        if      FW_VERSION = 172
        BC_STATUS_B 81, 34, 16
        db      0b8h, 96h, 3bh
bc_int5d_03b4c:
        call    save_dialog_common_setup
        else
        BC_STATUS_B 81, 24, 20
        db      0b8h
        dec     sp
        cmp     ch, al
        db      26h
        db      00h
        endif
bc_int5d_03b4f:
        INT_5D save_a_sound_refresh
bc_int67_68_03b53:
        INT_68 save_a_sound_save
calls_setup_callback_vectors_03b57:
        if      FW_VERSION = 172
        mov     al, 1
        mov     si, D_189C
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_03b5f:
        call    setup_callback_vectors
ui_stat_b_3b43_b62:
        BC_UI_CTRL 110, 15, 19, 9
L_03B69:
        ret
save_a_sound_refresh:
        mov     si, D_1781
        cmp     byte ptr [D_189C], 0
        je      L_03B77
        add     si, 3
L_03B77:
        mov     ax, ds
        mov     es, ax
        mov     di, D_1803
        mov     cx, 3
        rep movsb
status_a_03B83:
L_03B88                         equ     $+5
        BC_STATUS_A 111, 16, D_189C, D_1780
        endif
        db      0c3h
save_a_sound_save:
        mov     si, P_17F2
        mov     ax, L_03B96
        jmp     L_03C4E
L_03B96:
        mov     ax, ds
        mov     es, ax
        mov     si, P_1807
        if      FW_VERSION = 172
        mov     bl, byte ptr [D_189C]
        push    bx
        endif
L_03BA2:
        call    int2c_device_is_9
        if      FW_VERSION = 172
        pop     bx
        endif
        mov     al, 2
        int     3bh
midi_fmt_03BAA:
        call    lcd_update
        jmp     NEAR handler_BC_MIDI_FIELD
save_dialog_common_setup:
        mov     word ptr [P_188E], si
        mov     word ptr [P_1898], ax
        mov     ax, ds
        mov     es, ax
        mov     di, P_1807
        mov     cx, 14h
        rep movsb
softkey_cancel:
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
file_save_screen_b:
        BC_SOFTKEY 5, BC_SK_BOX,   "SAVE"
softkey_save_03bd9:
        if      FW_VERSION = 150
L_0468A                         equ     $+1
        endif
        int     50h
bc_int5b_03bdb:
        INT_67 handler_BC_MIDI_FIELD
bc_int5b_03bdf:
        INT_5B handler_BC_MIDI_FIELD
L_03BE3:
        cmp     byte ptr [G_DISK_DEVICE], 9
soft_key_03BE8:
        jne     wipe_flash_screen
        ret
wipe_flash_screen:
        if      FW_VERSION = 150
WIPE_FLASH_SCREEN_V150:
L_046A1                         equ     $+6
        endif
        BC_SOFTKEY 3, BC_SK_BOX,   "WIPE"
softkey_wipe_03bf5:
        INT_66 bc_int5d_03bfa
bc_int5d_03bf9:
        ret
bc_int5d_03bfa:
        callf   CS1_SEG:WIPE_DISK_DIALOG_OFS
bc_int5d_03bff:
        INT_5D NULL_HANDLER_OFS
bc_int67_68_03c03:
        INT_66 NULL_HANDLER_OFS
bc_int67_68_03c07:
        INT_67 handler_BC_MIDI_FIELD
calls_check_flag_78a8_03c0b:
        INT_68 print_03C10
L_03C0F:
        ret
print_03C10:
        call    check_flag_78a8
wipe_disk_msg:
        BC_PRINT "        WIPE DISK........"
print_wipe_disk_03c30:
        mov     bl, 15h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_03C36:
        int     2ch
L_03C38:
        call    delay_loop
L_03C3B:
        call    saving_screen_display
        mov     ax, ds
        mov     es, ax
        mov     si, word ptr [P_188E]
        call    word ptr [P_1898]
        call    file_list_first
        ret
L_03C4E:
        mov     word ptr [P_1898], ax
        mov     word ptr [P_188E], si
        mov     ax, ds
        mov     es, ax
        mov     di, P_1807
        mov     cx, 14h
        rep movsb
calls_check_flag_78a8_03c61:
        call    check_flag_78a8
        mov     ax, ds
        mov     es, ax
        mov     si, P_1807
        mov     bl, 0eh
        mov     bh, byte ptr [G_DISK_DEVICE]
L_03C71:
        int     2ch
L_03C73:
        jae     bc_int5d_03c77
        jmp     SHORT midi_fmt_03CA7
bc_int5d_03c77:
        callf   CS1_SEG:FILE_EXISTS_DIALOG_OFS
bc_int5d_03c7c:
        INT_5D NULL_HANDLER_OFS
bc_int67_68_03c80:
        INT_67 handler_BC_MIDI_FIELD
bc_int67_68_03c84:
        INT_68 bc_int67_68_03cc3
L_03C88:
        cmp     byte ptr [G_DISK_DEVICE], 9
bc_int66_03c8d:
        jne     calls_check_flag_78a8_03c90
        ret
calls_check_flag_78a8_03c90:
        INT_66 calls_check_flag_78a8_03c95
calls_check_flag_78a8_03c94:
        ret
calls_check_flag_78a8_03c95:
        call    check_flag_78a8
        mov     ax, ds
        mov     es, ax
        mov     si, P_1807
        mov     bl, 14h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_03CA5:
        int     2ch
midi_fmt_03CA7:
        call    saving_screen_display
        mov     ax, ds
        mov     es, ax
        mov     si, P_1807
        call    word ptr [P_1898]
        call    file_list_first
        ret
L_04769:
handler_BC_MIDI_FIELD:
        BC_SEQ_INIT
calls_mode_handler_03cbc:
        call    mode_handler
        call    calls_word_03387
        ret
bc_int67_68_03cc3:
        callf   CS1_SEG:rename_file_1_dialog
bc_int67_68_03cc8:
        int     50h
bc_int67_68_03cca:
        INT_67 handler_BC_MIDI_FIELD
bc_int67_68_03cce:
        INT_68 calls_check_flag_78a8_03c61
L_03CD2:
        mov     si, P_1807
        mov     cl, 5ah
        mov     ch, 18h
        mov     ax, ds
        mov     es, ax
        int     42h
        ret
save_copy_os_screen:
        mov     word ptr [PTR_SAVE_SCREEN_FN], save_copy_os_screen
        callf   CS1_SEG:COPY_OS_SCREEN_OFS
L_03CEB:
        INT_5F NULL_HANDLER_OFS
bc_int6c_03cef:
        INT_5E calls_mode_handler_03a40
bc_int6c_03cf3:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS
bc_int5d_03cfd:
        INT_5B NULL_HANDLER_OFS
bc_int5d_03d01:
        INT_69 save_copy_os_f6
L_03D05:
        INT_5D NULL_HANDLER_OFS
L_03D09:
        ret
save_copy_os_f6:
        call    loading_screen_display
        mov     byte ptr [G_DISK_DEVICE], 0
        call    memory_copy
        mov     bl, 11h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_03D1B:
        int     2ch
L_03D1D:
        jae     L_03D22
        jmp     NEAR jmp_ferr_no_disk
L_03D22:
        if      FW_VERSION = 172
        call    loading_screen_display
        endif
        cmp     byte ptr [G_DIR_HAS_FILES], 1
L_03D2A:
        je      L_03D2F
        jmp     NEAR jmp_ferr_format_invalid
L_03D2F:
        mov     ax, cs
        mov     es, ax
        mov     si, str_exe_filename
        mov     bl, 0eh
        mov     bh, byte ptr [G_DISK_DEVICE]
L_03D3C:
        int     2ch
L_03D3E:
        jae     L_03D43
        jmp     NEAR jmp_ferr_wrong_disk
L_03D43:
        mov     ax, 0f000h
        mov     es, ax
        mov     ax, word ptr es:[si+16h]
        mov     cx, word ptr es:[si+18h]
        mov     word ptr [COPYOS_EXE_TIME], ax
        mov     word ptr [COPYOS_EXE_DATE], cx
        mov     word ptr [COPYOS_EXE_SIZE_LO], bx
        mov     word ptr [COPYOS_EXE_SIZE_HI], dx
        shr     bx, 4
        shl     dl, 4
        or      bh, dl
        inc     bx
        push    bx
        push    bx
        callf   CS1_SEG:DISK_READ_SECTOR_FAR_OFS
        mov     ax, es
        inc     ax
        mov     word ptr [COPYOS_EXE_SEG], ax
        pop     bx
        add     bx, ax
        mov     word ptr [COPYOS_SYS_SEG], bx
        mov     ax, cs
        mov     es, ax
        mov     si, STR_SYS_FILENAME
        mov     bl, 0eh
        mov     bh, byte ptr [G_DISK_DEVICE]
L_03D89:
        int     2ch
L_03D8B:
        pop     ax
        if      FW_VERSION = 172
L_03D8C:
        endif
        jae     L_03D91
        jmp     NEAR jmp_ferr_wrong_disk
        if      FW_VERSION = 150
L_03D8C:
        endif
L_03D91:
        push    ax
        mov     ax, 0f000h
        mov     es, ax
        mov     ax, word ptr es:[si+16h]
        mov     cx, word ptr es:[si+18h]
        mov     word ptr [COPYOS_SYS_TIME], ax
        mov     word ptr [COPYOS_SYS_DATE], cx
        pop     ax
        mov     word ptr [COPYOS_SYS_SIZE_LO], bx
        mov     word ptr [COPYOS_SYS_SIZE_HI], dx
        shr     bx, 4
        shl     dl, 4
        or      bh, dl
        inc     bx
        add     ax, bx
L_03DBA:
        push    ax
        callf   CS1_SEG:arena_free_paras_far
        pop     bx
        cmp     ax, bx
jmp_seq_init_03_03dc3:
        jae     L_03DC8
        jmp     NEAR seq_init_03F78
L_03DC8:
        push    bx
        mov     es, word ptr [COPYOS_EXE_SEG]
        mov     bx, cs
L_03DCF:
        mov     si, str_exe_filename
        call    file_load_named_far
        mov     si, STR_SYS_FILENAME
        mov     bx, cs
L_03DDA:
        mov     es, bx
L_03DDC:
        mov     bl, 4
        mov     bh, byte ptr [G_DISK_DEVICE]
L_03DE2:
        int     2ch
L_03DE4:
        pop     bx
lcd_pos_03DE5:
        jae     handler_BC_LCD_POS
        ret
handler_BC_LCD_POS:
        push    bx
        mov     es, word ptr [COPYOS_SYS_SEG]
L_03DED:
        push    es
        sub     di, di
        mov     cx, 8000h
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_03DF9:
        int     2ch
        db      07h, 3dh, 00h, 80h, 75h, 0ah, 8ch, 0c3h
        if      FW_VERSION = 172
L_03E03:
        endif
        add     bx, 800h
        mov     es, bx
L_03E09:
        jmp     SHORT L_03DED
        if      FW_VERSION = 150
L_03E03:
        endif
        db      2dh, 10h, 00h
tgt_03E0E:
        jae     L_03E1B
        sub     ax, 10h
        and     ax, 0fh
        mov     bx, es
        dec     bx
        mov     es, bx
L_03E1B:
        push    es
        push    ax
seq_init_03E1D:
        BC_SEQ_INIT
status_b_03E20:
        int     52h
        callf   CS1_SEG:SELECT_DESTINATION_DIALOG_OFS
        pop     si
        pop     es
        mov     dx, es
device_status_03E2B:
        BC_STATUS_B 56, 26, 4
        db      58h, 0c1h, 0e8h, 06h
device_status:
        BC_FIELD 68, 36
device_display_disk:
        BC_STATUS 130, 16, "Device:"
cancel_button_c:
        BC_SOFTKEY 3, BC_SK_FILL,  "CANCEL"
screen_do_it_a:
        BC_SOFTKEY 4, BC_SK_BOX,   "DO IT"
softkey_do_it_03e5e:
        int     50h
bc_int6a_03e60:
        INT_6A select_destination_device_inc, select_destination_device_dec
bc_int5d_03e66:
        INT_5D status_a_03EB5
bc_int67_68_03e6a:
        INT_66 handler_BC_MIDI_FIELD
bc_int67_68_03e6e:
        INT_67 select_destination_do_it
L_03E72:
        ret
select_destination_device_inc:
        mov     al, byte ptr [G_DISK_DEVICE]
        cmp     al, 7
        jne     L_03E7B
        ret
L_03E7B:
        inc     al
        cmp     al, 7
        jne     L_03E83
        inc     al
L_03E83:
        cmp     al, 0ah
        jb      L_03E89
        mov     al, 9
L_03E89:
        mov     byte ptr [G_DISK_DEVICE], al
L_04939:
        mov     byte ptr [G_DISK_PARTITION], 0
status_a_03E91:
        if      FW_VERSION = 172
L_03E97                         equ     $+6
L_03E99                         equ     $+8
        endif
        BC_STATUS_A 172, 16, G_DISK_DEVICE, TBL_DISK_DEVICE_LABELS
lcd_coord_03E9A:
        BC_FLUSH
L_03E9D:
        call    memory_copy
L_03EA0:
        call    lcd_update
        ret
select_destination_device_dec:
        if      FW_VERSION = 150
L_03D51   equ     $+1
        endif
        mov     al, byte ptr [G_DISK_DEVICE]
        sub     al, 1
        jae     L_03EAD
        sub     al, al
L_03EAD:
        cmp     al, 7
        jne     L_03EB3
        dec     al
L_03EB3:
        jmp     SHORT L_03E89
status_a_03EB5:
        if      FW_VERSION = 172
L_03EBB                         equ     $+6
        endif
        BC_STATUS_A 172, 16, G_DISK_DEVICE, TBL_DISK_DEVICE_LABELS
clear_rect_03EBE:
        BC_CLEAR_RECT 100, 22, 22, 23
L_03EC5:
        mov     al, byte ptr [G_DISK_DEVICE]
        cmp     al, 0
        je      status_03ECE
        jmp     SHORT jmp_wait_handler_03_03efa
status_03ECE:
        if      FW_VERSION = 150
L_04981                         equ     $+6
        endif
        BC_16_LEVELS_6 100, 22, FROM_DEL_SEL, TBL_16_LEVELS_BMP_A
status_display_3ED7:
        BC_STATUS 130, 26, "        "
status_display_3EE5:
        BC_STATUS 130, 36, "              "
L_03EF9:
        ret
jmp_wait_handler_03_03efa:
        cmp     byte ptr [G_DISK_DEVICE], 9
parta_status_03EFF:
        jne     parta_status
        jmp     SHORT wait_handler_03F4E
parta_status:
        if      FW_VERSION = 150
L_049B8                         equ     $+8
        endif
        BC_16_LEVELS_6 100, 22, FROM_DEL_SEL-1, TBL_16_LEVELS_BMP_B
parta_display:
        BC_STATUS 130, 26, "  Part:A"
memory_free_display_b:
        BC_STATUS 130, 36, "  Free=    . M"
status_free_____m_03f2e:
        mov     ax, word ptr [G_FREE_SPACE]
        cmp     byte ptr [G_SCSI_DEV_TYPE], 5
        jne     L_03F3A
        sub     ax, ax
L_03F3A:
        sub     dx, dx
        mov     bx, 0ah
        div     bx
        push    dx
arith_03F42:
        BC_ARITH 024ach
L_03F47:
        pop     ax
op__03F48:
        BC_OP_32 202, 36
L_03F4D:
        ret
wait_handler_03F4E:
        if      FW_VERSION = 150
L_04A1D                         equ     $+34
        endif
        BC_WAIT 100, 22, BMP_FLASH_ROM
status_display_3F55:
        BC_STATUS 130, 26, "        "
status_display_3F63:
        BC_STATUS 130, 36, "              "
L_03F77:
        ret
L_04A25:
seq_init_03F78:
        BC_SEQ_INIT
bc_int67_68_03f7b:
        callf   CS1_SEG:not_enough_memory_dialog_1E52E
bc_int67_68_03f80:
        int     50h
bc_int67_68_03f82:
        INT_68 handler_BC_MIDI_FIELD
L_03F86:
        ret
select_destination_do_it:
        cmp     byte ptr [G_DISK_DEVICE], 0
L_03F8C:
        je      L_03F90
        jmp     SHORT change_disk_do_it
L_03F90:
        callf   CS1_SEG:CHANGE_DISK_DIALOG_OFS
soft_key_03F95:
        int     50h
cancel_button_d:
        BC_SOFTKEY 3, BC_SK_FILL,  "CANCEL"
softkey_do_it:
        BC_SOFTKEY 4, BC_SK_BOX,   "DO IT"
softkey_do_it_03fae:
        INT_66 handler_BC_MIDI_FIELD
L_03FB2:
        INT_67 change_disk_do_it
L_03FB6:
        ret
change_disk_do_it:
        call    saving_screen_display
        cmp     byte ptr [G_DISK_DEVICE], 9
L_03FBF:
        jne     calls_clear_flag_78c1_03fc4
        jmp     L_04063
calls_clear_flag_78c1_03fc4:
        cmp     byte ptr [G_DISK_DEVICE], 0
        je      calls_check_flag_78a8_03fd6
        mov     byte ptr [G_DISK_PARTITION], 0
        call    L_0E8A7
        call    file_list_first
calls_check_flag_78a8_03fd6:
        call    check_flag_78a8
        mov     ax, cs
        mov     es, ax
        mov     si, str_exe_filename
        push    es
        push    si
        mov     bl, 14h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_03FE8:
        int     2ch
L_03FEA:
        pop     si
        pop     es
        mov     cx, word ptr [COPYOS_EXE_TIME]
        mov     dx, word ptr [COPYOS_EXE_DATE]
        mov     bl, 7
        mov     bh, byte ptr [G_DISK_DEVICE]
L_03FFA:
        int     2ch
L_03FFC:
        jae     L_04001
        jmp     disk_error_report
L_04001:
        if      FW_VERSION = 172
        call    saving_screen_display
        endif
        mov     es, word ptr [COPYOS_EXE_SEG]
        mov     ax, word ptr [COPYOS_EXE_SIZE_LO]
        mov     dx, word ptr [COPYOS_EXE_SIZE_HI]
        sub     si, si
L_04011:
        call    L_0439C
        mov     bl, 0ah
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0401A:
        int     2ch
L_0401C:
        mov     ax, cs
        mov     es, ax
        mov     si, STR_SYS_FILENAME
        push    es
        push    si
        mov     bl, 14h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0402B:
        int     2ch
L_0402D:
        pop     si
        pop     es
        mov     cx, word ptr [COPYOS_SYS_TIME]
        mov     dx, word ptr [COPYOS_SYS_DATE]
        mov     bl, 7
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0403D:
        int     2ch
L_0403F:
        jae     L_04044
        jmp     NEAR disk_error_report
L_04044:
        mov     es, word ptr [COPYOS_SYS_SEG]
        mov     ax, word ptr [COPYOS_SYS_SIZE_LO]
        mov     dx, word ptr [COPYOS_SYS_SIZE_HI]
        sub     si, si
L_04051:
        call    L_0439C
        mov     bl, 0ah
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0405A:
        int     2ch
L_0405C:
        db      0e8h
L_0405D:
        je      seq_init_0405F
seq_init_0405F:
        BC_SEQ_INIT
L_04062:
        ret
L_04063:
        cmp     byte ptr [G_FROM_CARD_STATE], 20h
L_04068:
        jne     L_0406D
        jmp     jmp_ferr_no_f_rom
L_0406D:
        cmp     byte ptr [G_FROM_CARD_STATE], 22h
L_04072:
        je      L_04077
        jmp     NEAR jmp_ferr_format_invalid
L_04077:
        mov     ax, cs
        mov     es, ax
        mov     si, str_exe_filename
        mov     cx, word ptr [COPYOS_EXE_TIME]
        mov     dx, word ptr [COPYOS_EXE_DATE]
        mov     bl, 1bh
        mov     bh, 9
        int     40h
        mov     es, word ptr [COPYOS_EXE_SEG]
        mov     ax, word ptr [COPYOS_EXE_SIZE_LO]
        mov     dx, word ptr [COPYOS_EXE_SIZE_HI]
        sub     si, si
L_04099:
        call    L_0439C
        mov     bl, 1dh
        mov     bh, 9
        int     40h
        mov     ax, cs
        mov     es, ax
        mov     si, STR_SYS_FILENAME
        mov     cx, word ptr [COPYOS_SYS_TIME]
        mov     dx, word ptr [COPYOS_SYS_DATE]
        mov     bl, 1ch
        mov     bh, 9
        int     40h
        mov     es, word ptr [COPYOS_SYS_SEG]
        mov     ax, word ptr [COPYOS_SYS_SIZE_LO]
        mov     dx, word ptr [COPYOS_SYS_SIZE_HI]
        sub     si, si
L_040C4:
        call    L_0439C
        mov     bl, 0ah
        mov     bh, byte ptr [G_DISK_DEVICE]
L_040CD:
        int     2ch
seq_init_040CF:
        BC_SEQ_INIT
L_040D2:
        ret
lcd_update:
        sub     di, di
        sub     si, si
        cmp     byte ptr [G_DIR_HAS_FILES], 0
L_040DC:
        je      status_040E6
        mov     bl, 0dh
        mov     bh, byte ptr [G_DISK_DEVICE]
L_040E4:
        int     2ch
status_040E6:
        if      FW_VERSION = 172
handler_BC_STATUS               equ     $+2
        endif
        mov     word ptr [G_FREE_SPACE], di
        mov     word ptr [G_FRAG_SPACE], si
        ret
file_create_sized:
        mov     cx, word ptr [G_CREATE_SIZE]
        mov     dx, word ptr [G_CREATE_SIZE_HI]
        mov     bl, 7
        mov     bh, byte ptr [G_DISK_DEVICE]
L_040FD:
        int     2ch
L_040FF:
        ret
file_write_block:
        push    es
        mov     bl, 9
        mov     bh, byte ptr [G_DISK_DEVICE]
L_04107:
        int     2ch
        pop     es
L_0410A:
        jae     L_0410F
        jmp     NEAR disk_error_report
L_0410F:
        ret
isr_int3b:
        mov     ax, ds
        mov     es, ax
        sub     ax, ax
        mov     si, STR_NO_SOUND_NAME
        iret
check_flag_78a8:
        call    ui_a_0339F
        cmp     byte ptr [G_DISK_DEVICE], 0
L_04122:
        jne     L_04144
        mov     bl, 11h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0412A:
        int     2ch
L_0412C:
        jae     L_04131
        jmp     jmp_ferr_no_disk
L_04131:
        cmp     byte ptr [G_DIR_HAS_FILES], 1
L_04136:
        je      L_0413B
        jmp     NEAR jmp_ferr_wrong_disk
L_0413B:
        cmp     bl, 0
L_0413E:
        je      L_04143
        jmp     jmp_ferr_write_protect
L_04143:
        ret
L_04144:
        cmp     byte ptr [G_DISK_DEVICE], 9
L_04149:
        je      L_0419A
        mov     bl, 11h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_04151:
        int     2ch
L_04153:
        jb      L_04182
        cmp     al, 4
L_04157:
        jne     L_0415C
        jmp     jmp_ferr_write_protect
L_0415C:
        cmp     byte ptr [G_DISK_FORMAT], 10h
L_04161:
        jne     L_04166
        jmp     NEAR jmp_ferr_no_scsi_device
L_04166:
        cmp     byte ptr [G_SCSI_DEV_TYPE], 0
L_0416B:
        je      L_04177
        cmp     byte ptr [G_SCSI_DEV_TYPE], 7
L_04172:
        je      L_04177
        jmp     NEAR jmp_ferr_wrong_disk
L_04177:
        cmp     byte ptr [G_DIR_HAS_FILES], 1
L_0417C:
        je      L_04181
        jmp     NEAR jmp_ferr_format_invalid
L_04181:
        ret
L_04182:
        cmp     al, 6
calls_memory_copy_04184:
        je      calls_memory_copy_04189
        jmp     NEAR jmp_ferr_scsi_not_ready
calls_memory_copy_04189:
        call    memory_copy
        mov     bl, 11h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_04192:
        int     2ch
L_04194:
        jae     L_04199
        jmp     NEAR jmp_ferr_scsi_not_ready
L_04199:
        ret
L_0419A:
        cmp     byte ptr [G_FROM_CARD_STATE], 20h
L_0419F:
        jne     L_041A4
        jmp     jmp_ferr_no_f_rom
L_041A4:
        cmp     byte ptr [G_FROM_CARD_STATE], 22h
L_041A9:
        je      L_041AE
        jmp     NEAR jmp_ferr_format_invalid
L_041AE:
        ret
L_04C59:
save_device_field:
        INT_5F save_device_inc
bc_int6c_041b3:
        INT_5E save_device_dec
ui_ctrl_041b7:
        INT_6C calls_word_03387, NULL_HANDLER_OFS, calls_word_03387, save_device_down
ui_check_flag_78a8_1c1:
        BC_UI_CTRL 205, 20, 37, 9
bc_int5d_041c8:
        INT_5B save_device_window
bc_int5d_041cc:
        INT_5D NULL_HANDLER_OFS
L_041D0:
        ret
save_device_inc:
        mov     al, byte ptr [G_DISK_DEVICE]
        cmp     al, 7
        jne     br_041D9
        ret
br_041D9:
        inc     al
        cmp     al, 7
        jne     br_041E1
        inc     al
br_041E1:
        cmp     al, 0ah
        jb      jmp_stat_a_4202_041e7
        mov     al, 0
jmp_stat_a_4202_041e7:
        mov     byte ptr [G_DISK_DEVICE], al
        mov     byte ptr [G_DISK_PARTITION], 0
        jmp     SHORT status_a_04202
save_device_dec:
        if      FW_VERSION = 150
tgt_041FA                       equ     $+2
        endif
        mov     al, byte ptr [G_DISK_DEVICE]
        sub     al, 1
        if      FW_VERSION = 172
        jae     tgt_041FA
        else
        jae     tgt_041FA+7
        endif
        mov     al, 9
        if      FW_VERSION = 172
tgt_041FA:
        endif
        cmp     al, 7
        jne     L_04200
        dec     al
L_04200:
        jmp     SHORT jmp_stat_a_4202_041e7
status_a_04202:
        BC_STATUS_A 206, 21, G_DISK_DEVICE, TBL_DISK_DEVICE_LABELS
lcd_coord_0420B:
        BC_FLUSH
        if      FW_VERSION = 172
L_0420E:
        endif
        call    wait_loop
L_04211:
        call    memory_copy
        if      FW_VERSION = 150
L_0420E:
        endif
L_04214:
        call    lcd_update
seq_init_04217:
        BC_SEQ_INIT
calls_pad_handler_0421_0421a:
        call    clear_rect_0421E
        ret
clear_rect_0421E:
        if      FW_VERSION = 150
L_04CCB                         equ     $+3
        endif
        BC_CLEAR_RECT 136, 22, 22, 23
        if      FW_VERSION = 150
L_04CE2                         equ     $+19
        endif
status_a_04225:
        if      FW_VERSION = 172
L_0422B                         equ     $+6
free_eq_k_status                equ     $+8
        endif
        BC_STATUS_A 206, 21, G_DISK_DEVICE, TBL_DISK_DEVICE_LABELS
        db      80h
        db      3eh
        if      FW_VERSION = 172
        test    al, 78h
        else
        db      8eh
        db      78h
        endif
        add     byte ptr [di+4bh], dh
        if      FW_VERSION = 172
status_display_4235:
        endif
        BC_STATUS 176, 30, "            "
free_k_status:
        BC_16_LEVELS_6 136, 22, FROM_DEL_SEL, TBL_16_LEVELS_BMP_A
status_display_4250:
        BC_STATUS 164, 30, "              "
memory_free_display_c:
        BC_STATUS 170, 39, " Free=      K"
status_free______k_04277:
        mov     ax, word ptr [G_FREE_SPACE]
arith_0427A:
        BC_ARITH 027dah
L_0427F:
        ret
save_partition_refresh:
        if      FW_VERSION = 150
status_display_4235             equ     $+4
        endif
        cmp     byte ptr [G_DISK_DEVICE], 9
free_eq_m_status:
        je      fragd_eq_k_status
free_m_status:
        BC_16_LEVELS_6 136, 22, FROM_DEL_SEL-1, TBL_16_LEVELS_BMP_B
status_display_4290:
        BC_STATUS 164, 30, "              "
free_display:
        BC_STATUS 170, 39, " Free=    . M"
status_free_____m_042b7:
        mov     ax, word ptr [G_FREE_SPACE]
        cmp     byte ptr [G_SCSI_DEV_TYPE], 5
        jne     L_042C3
        sub     ax, ax
L_042C3:
        sub     dx, dx
        mov     bx, 0ah
        div     bx
        push    dx
arith_042CB:
        BC_ARITH 027ceh
L_042D0:
        pop     ax
op__042D1:
        BC_OP_32 236, 39
part_status_042D6:
        cmp     byte ptr [G_DISK_PART_COUNT], 0
part_status:
        jne     part_label_display
        ret
part_label_display:
PART_LABEL_DISPLAY_V150:
        BC_STATUS 176, 30, "Part:       "
status_part_042f0:
        mov     al, byte ptr [G_DISK_PARTITION]
        add     al, 41h
        mov     cl, 0ceh
        mov     ch, 1eh
select_042F9:
        BC_PUTCHAR
        db      0c3h
fragd_eq_k_status:
        if      FW_VERSION = 172
fragd_k_status                  equ     $+3
        endif
        BC_WAIT 136, 22, BMP_FLASH_ROM
fragmented_memory_display:
        BC_STATUS 164, 30, "Frag'd=      K"
free_eq_k_1_status:
        mov     ax, word ptr [G_FRAG_SPACE]
free_k_1_status:
        BC_ARITH 01edah
free_display_2:
        BC_STATUS 164, 39, "  Free=      K"
status_free______k_04334:
        mov     ax, word ptr [G_FREE_SPACE]
arith_04337:
        BC_ARITH 027dah
L_0433C:
        ret
save_device_down:
        cmp     byte ptr [G_DISK_PART_COUNT], 0
L_04342:
        jne     ui_arith_04337_345
        ret
ui_arith_04337_345:
        BC_UI_CTRL 205, 29, 7, 9
lcd_coord_0434C:
        BC_FLUSH
L_0434F:
        mov     bl, 1
        mov     bh, byte ptr [G_DISK_DEVICE]
bc_int6c_04355:
        int     2ch
bc_int6c_04357:
        INT_6A save_partition_inc, save_partition_dec
bc_int6c_0435d:
        INT_6C calls_word_03387, NULL_HANDLER_OFS, save_device_field, NULL_HANDLER_OFS
bc_int5d_04367:
        INT_5D save_partition_refresh
bc_int5b_0436b:
        if      FW_VERSION = 150
L_04E17                         equ     $+2
        endif
        INT_5B NULL_HANDLER_OFS
L_0436F:
        ret
save_partition_inc:
        add     al, byte ptr [G_DISK_PARTITION]
        cmp     al, byte ptr [G_DISK_PART_COUNT]
        if      FW_VERSION = 172
        jb      save_partition_inc+13
L_0437C                         equ     $+2
        else
        jb      L_04E27
        endif
        mov     al, byte ptr [G_DISK_PART_COUNT]
L_04E27:
        mov     byte ptr [G_DISK_PARTITION], al
        call    wait_loop
        call    memory_copy
        call    L_0E8A7
seq_init_04389:
        BC_SEQ_INIT
L_0438C:
        int     52h
        ret
save_partition_dec:
        mov     bl, al
        mov     al, byte ptr [G_DISK_PARTITION]
        sub     al, bl
L_04396:
        jae     L_04E27
        mov     al, 0
        jmp     L_04E27
L_0439C:
        mov     bx, si
        shr     bx, 4
L_043A1:
        mov     cx, es
        add     cx, bx
L_043A5:
        mov     es, cx
        and     si, 0fh
L_043AA:
        mov     cx, ax
        or      cx, dx
L_043AE:
        jne     br_043B1
L_043B0:
        ret
br_043B1:
        mov     cx, 8000h
        sub     ax, cx
        sbb     dx, 0
        jae     L_043C1
        add     cx, ax
        sub     ax, ax
        sub     dx, dx
L_043C1:
        pusha
        mov     bl, 9
        mov     bh, byte ptr [G_DISK_DEVICE]
L_043C8:
        int     2ch
L_043CA:
        jae     L_043CE
        jmp     SHORT disk_error_report
L_043CE:
        popa
        shr     cx, 4
        mov     bx, es
L_043D4:
        add     bx, cx
        mov     es, bx
L_043D8:
        jmp     SHORT L_043AA
L_043DA:
        sub     si, si
        cmp     dx, 800h
L_043E0:
        jb      L_04402
        mov     cx, 8000h
        push    es
        push    dx
        mov     bl, 9
        mov     bh, byte ptr [G_DISK_DEVICE]
L_043ED:
        int     2ch
L_043EF:
        pop     dx
        pop     es
L_043F1:
        jae     br_043F5
        jmp     SHORT disk_error_report
br_043F5:
        mov     ax, es
        add     ax, 800h
        mov     es, ax
        sub     dx, 800h
        jmp     SHORT L_043DA
L_04402:
        mov     cx, dx
        shl     cx, 4
        mov     bl, 9
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0440D:
        int     2ch
L_0440F:
        jae     L_04413
        jmp     SHORT disk_error_report
L_04413:
        ret
disk_error_report:
        cmp     al, 1
        jne     br_0441B
        jmp     jmp_ferr_write_protect
br_0441B:
        cmp     al, 2
        jne     br_04422
        jmp     jmp_ferr_too_many_files
br_04422:
        cmp     al, 3
        jne     L_04429
        jmp     L_032D7
L_04429:
        cmp     al, 4
        if      FW_VERSION = 150
        jne     L_0442B
        jmp     jmp_ferr_wrong_disk
        endif
L_0442B:
        if      FW_VERSION = 172
        jne     L_04430
        jmp     NEAR jmp_ferr_wrong_disk
        endif
L_04430:
        jmp     NEAR jmp_ferr_write_error
save_device_window:
        call    arrange_window
bc_int5b_04436:
        jae     bc_int5b_04439
        ret
L_04EE3:
bc_int5b_04439:
        INT_5B arrange_window_close
bc_int67_68_0443d:
        INT_67 arrange_window_close
bc_int67_68_04441:
        INT_68 bc_int67_68_04446
bc_int67_68_04445:
        ret
bc_int67_68_04446:
        call    arrange_from_dialog_draw
bc_int67_68_04449:
        INT_68 arrange_from_do_it
L_0444D:
        ret
arrange_from_do_it:
        callf   CS1_SEG:from_arrange_far
        call    lcd_update
arrange_window_close:
        call    calls_mode_handler_03332
L_04459:
        call    save_device_field
        ret
arrange_window:
        cmp     byte ptr [G_DISK_DEVICE], 9
L_04462:
        je      L_04465
        ret
L_04465:
        cmp     byte ptr [G_FROM_CARD_STATE], 22h
pressing_arrang_will_arra_status_0446A:
        je      pressing_arrang_will_arra_status
        ret
pressing_arrang_will_arra_status:
        callf   CS1_SEG:calls_f_rom_fragmentation_dialog_1c6d0
arrange_data_prompt:
        BC_STATUS 27, 41, "Pressing^ARRANG will^arrange^data."
soft_key_0449A:
        int     50h
screen_close_alt:
        BC_SOFTKEY 4, BC_SK_FILL,  "CLOSE"
screen_arrange:
        BC_SOFTKEY 5, BC_SK_BOX,   "ARRANG"
softkey_arrang_044b3:
        ret
arrange_from_dialog_draw:
        callf   CS1_SEG:ARRANGE_FROM_DIALOG_OFS
        ret
int2c_device_is_9:
        mov     ah, 0
        cmp     byte ptr [G_DISK_DEVICE], 9
        jne     L_044C5
        mov     ah, 1
L_04F6F:
L_044C5:
        ret
close_handler_044C6:
        BC_PLANE_A
L_044C9:
        call    error_scsi_not_ready_044f1
        mov     byte ptr [FMT_LAST_PARTITION], 0
L_044D1:
        call    L_0454C
        ret
L_04F7F:
error_scsi_not_ready_044D5:
        if      FW_VERSION = 150
L_04F89                         equ     $+10
        endif
        INT_2A "    SCSI Not ready  !!   "
error_scsi_not_ready_044f1:
        callf   CS1_SEG:format_disk_screen_draw
bc_int6c_044f6:
        int     50h
bc_int6c_044f8:
        if      FW_VERSION = 150
L_04FAB                         equ     $+9
        endif
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS
L_04502:
        call    load_page_softkeys
L_04505:
        if      FW_VERSION = 172
        INT_5F tgt_0451E
        else
        INT_5F L_043C8_V150
        endif
bc_int5d_04509:
        INT_5E format_device_dec
bc_int5d_0450d:
        INT_5D format_from_init
bc_int5b_04511:
        INT_5C NULL_HANDLER_OFS
bc_int5b_04515:
        if      FW_VERSION = 172
        INT_69 format_f6
bc_int5b_04519:
        INT_5B format_window
L_0451D:
        else
        INT_68 format_window
        db      0cdh
        imul    cx, dx, 0c345h
L_043C8_V150:
        mov     al, byte ptr [G_DISK_DEVICE]
        cmp     al, 7
        jne     tgt_0451E
        endif
        ret
tgt_0451E:
        if      FW_VERSION = 172
        mov     al, byte ptr [G_DISK_DEVICE]
        endif
        inc     al
        cmp     al, 7
        jne     L_04529
        inc     al
L_04529:
        cmp     al, 0ah
        jb      loop_0452F
        if      FW_VERSION = 172
        mov     al, 0
        else
        mov     al, 9
        endif
loop_0452F:
        mov     byte ptr [G_DISK_DEVICE], al
        mov     byte ptr [G_DISK_PARTITION], 0
        call    L_0454C
        ret
        if      FW_VERSION = 172
format_device_dec:
        mov     al, byte ptr [G_DISK_DEVICE]
        sub     al, 1
        jae     L_04544
        mov     al, 9
L_04544:
        cmp     al, 7
        jne     L_0454A
        dec     al
L_0454A:
        jmp     loop_0452F
        endif
L_0454C:
        mov     al, byte ptr [G_DISK_DEVICE]
        cmp     al, 0
        jne     L_04555
        jmp     SHORT L_045A1
L_04FF3:
L_04555:
        cmp     al, 9
L_04557:
        jne     calls_wait_loop_0455b
        jmp     SHORT L_045AB
calls_wait_loop_0455b:
        push    ax
L_0455C:
        call    wait_loop
        pop     dx
        dec     dl
        mov     ah, 0
disk_init_1:
        int     2dh
        mov     ah, 8
        int     2dh
        mov     al, 10h
        mov     ah, 9
        jb      L_04596
        mov     ah, 3
        mov     dx, ds
        mov     di, P_7DD8
        mov     cx, 2ch
        mov     cx, 24h
        int     2dh
        mov     ah, byte ptr [BUF_FILE_HEADER]
        mov     al, 11h
        cmp     ah, 0
        je      L_04596
        cmp     ah, 5
        je      L_04596
        cmp     ah, 7
        je      L_04596
        mov     ah, 9
L_04596:
        mov     byte ptr [G_SCSI_DEV_TYPE], ah
        mov     byte ptr [G_DISK_FORMAT], al
seq_init_0459D:
        BC_SEQ_INIT
L_045A0:
        ret
L_045A1:
        if      FW_VERSION = 172
format_disk_dialog              equ     $+1
        endif
        call    wait_loop
calls_memory_copy_045a4:
        call    memory_copy
seq_init_045A7:
        BC_SEQ_INIT
L_045AA:
        ret
L_045AB:
        mov     bl, 1
        mov     bh, byte ptr [G_DISK_DEVICE]
calls_wait_handler_04896_045b1:
        int     2ch
        if      FW_VERSION = 172
calls_wait_handler_04896_045b3:
        endif
        ret
        if      FW_VERSION = 150
format_device_dec:
        mov     al, byte ptr [G_DISK_DEVICE]
        sub     al, 1
        jae     L_0505B
        sub     al, al
L_0505B:
        cmp     al, 7
        jne     calls_wait_handler_04896_045b3
        dec     al
calls_wait_handler_04896_045b3:
        cmp     al, 0
        jmp     loop_0452F
        endif
format_from_init:
        call    wait_handler_04896
        if      FW_VERSION = 150
L_0506B                         equ     $+2
        endif
status_a_045B7:
        BC_STATUS_A 48, 1, G_DISK_DEVICE, TBL_DISK_DEVICE_LABELS
lcd_coord_045C0:
        BC_FLUSH
clear_rect_045C3:
        BC_CLEAR_RECT 84, 0, 164, 26
clear_rect_045CA:
        BC_CLEAR_RECT 48, 10, 48, 7
jmp_pad_handler_046_045d1:
        mov     al, byte ptr [G_DISK_DEVICE]
        cmp     al, 0
        jne     jmp_pad_handler_046_045db
        jmp     NEAR clear_rect_046BB
jmp_pad_handler_046_045db:
        cmp     al, 9
jmp_pad_handler_046_045dd:
        jne     partition_size_m_status
        if      FW_VERSION = 172
partition_size_eq_m_status:
        endif
        jmp     clear_rect_046E0
        if      FW_VERSION = 150
partition_size_eq_m_status:
L_050BD                         equ     $+41
L_050EA                         equ     $+86
L_050FC                         equ     $+104
        endif
partition_size_m_status:
        BC_16_LEVELS_6 220, 1, FROM_DEL_SEL-1, TBL_16_LEVELS_BMP_B
partition_size_display:
        BC_STATUS 96, 1, "Partition size=   M "
parts_count_display:
        BC_STATUS 150, 9, "Parts:A-  "
vender_display:
        BC_STATUS 0, 10, " Vender=        "
product_version_display:
        BC_STATUS 0, 18, "Product=                  Ver.=         "
status_product__________________ver_04659:
        cmp     byte ptr [G_DISK_FORMAT], 10h
bc_int61_0465e:
        jne     bc_int61_04661
L_05112:
        ret
L_05192:
bc_int61_04661:
        if      FW_VERSION = 150
L_04665                         equ     $+2
        endif
        INT_61 bc_int6c_04a0f
        if      FW_VERSION = 172
L_04665:
        mov     si, P_7DE0
        else
        mov     si, P_7DE0
        mov     dx, ds
        BC_STATUS_B 48, 10, 8
        mov     si, P_7DE8
        endif
        mov     dx, ds
status_b_0466A:
        if      FW_VERSION = 172
        BC_STATUS_B 48, 10, 8
L_04672                         equ     $+2
        mov     si, P_7DE8
        mov     dx, ds
        endif
status_b_04675:
        BC_STATUS_B 48, 18, 16
        if      FW_VERSION = 172
L_0467D                         equ     $+2
        mov     si, P_7DF8
        mov     dx, ds
        else
        mov     si, P_7DF8
        mov     dx, ds
L_05134                         equ     $+2
        endif
status_b_04680:
        BC_STATUS_B 186, 18, 4
        if      FW_VERSION = 172
        db      80h, 3eh, 0abh
L_04689:
        js      arith_04694
        else
        cmp     byte ptr [G_SCSI_DEV_TYPE], 9
        endif
L_0468B:
        jne     L_0468E
        ret
L_0468E:
        call    disk_format
        mov     ax, word ptr [FMT_DISK_SIZE_MB]
arith_04694:
        BC_ARITH 013d6h
megabyte_suffix:
        BC_STATUS 238, 19, "M"
status_m_046a0:
        mov     al, byte ptr [FMT_LAST_PARTITION]
L_046A3:
        call    L_04A34
        mov     ax, word ptr [FMT_PART_SIZE_MB]
raw_046A9:
        BC_FIELD 186, 1
L_046AE:
        mov     al, byte ptr [FMT_LAST_PARTITION]
        add     al, 41h
        mov     cl, 0c6h
        mov     ch, 9
select_046B7:
        BC_PUTCHAR
        db      0c3h
clear_rect_046BB:
        BC_CLEAR_RECT 0, 9, 220, 16
clear_rect_046C2:
        BC_CLEAR_RECT 96, 1, 120, 7
L_046C9:
        BC_16_LEVELS_6 220, 1, FROM_DEL_SEL, TBL_16_LEVELS_BMP_A
status_a_046D2:
        if      FW_VERSION = 172
bc_int61_046d7                  equ     $+5
        endif
        BC_STATUS_A 170, 1, G_DISK_TYPE_SEL, TBL_DISK_TYPE_LABELS
bc_int61_046db:
        INT_61 ui_print_no_from_9f2
L_046DF:
        ret
clear_rect_046E0:
        BC_CLEAR_RECT 0, 9, 220, 16
clear_rect_046E7:
        BC_CLEAR_RECT 96, 1, 120, 7
clear_rect_046EE:
        BC_CLEAR_RECT 220, 1, 22, 24
bc_int69_046f5:
        ret
clear_rect_046F6:
        BC_CLEAR_RECT 0, 10, 220, 16
L_046FD:
        INT_69 NULL_HANDLER_OFS
L_04701:
        ret

disk_format:
        mov     ah, 5
        int     2dh
        mov     ah, 6
        int     2dh
        mov     ax, di
        mov     bx, 7a1h
        div     bx
        mov     word ptr [FMT_DISK_SIZE_MB], ax
        mov     word ptr [FMT_PART_SIZE_MB], ax
        ret
format_f6:
        call    format_disk_dialog_04744
wait_handler_0471B:
        if      FW_VERSION = 172
soft_key_04720                  equ     $+5
        endif
        BC_WAIT 39, 22, BMP_WARNING
softkey_cancel_4722:
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
screen_do_it_c:
        BC_SOFTKEY 5, BC_SK_BOX,   "DO IT"
softkey_do_it_04739:
        int     50h
bc_int67_68_0473b:
        INT_67 error_scsi_not_ready_044f1
L_0473F:
        INT_68 calls_format_from_init_047d7
this_will_erase_status_04743:
        ret
format_disk_dialog_04744:
        cmp     byte ptr [G_DISK_DEVICE], 9
this_will_erase_status:
        je      this_will_erase_1_status
        if      FW_VERSION = 150
format_disk_dialog_051FD:
L_0521E                         equ     $+33
        endif
format_disk_dialog_0474B:
        BC_FILE_DIALOG 29, 6, 190, 54, "Format disk"
this_will_erase_display:
        BC_STATUS 70, 22, "THIS WILL ERASE"
the_entire_disk_display:
        BC_STATUS 70, 31, "      THE ENTIRE DISK!!"
format_f_rom_dialog:
        ret
this_will_erase_1_status:
        if      FW_VERSION = 150
THIS_WILL_ERASE_1_STATUS_V150:
L_05264                         equ     $+33
L_05271                         equ     $+46
L_05275                         equ     $+50
        endif
        BC_FILE_DIALOG 29, 6, 190, 54, "Format F-ROM"
erase_confirm_b:
        BC_STATUS 70, 22, "THIS WILL ERASE"
erase_entire_from_warning:
        BC_STATUS 70, 31, "    THE ENTIRE F-ROM!!"
status_the_entire_from_047d6:
        ret
calls_format_from_init_047d7:
        call    error_scsi_not_ready_044f1
calls_format_from_init_047da:
        call    format_from_init
        cmp     byte ptr [G_DISK_DEVICE], 0
L_047E2:
        je      L_047F1
        cmp     byte ptr [G_DISK_DEVICE], 9
L_047E9:
        jne     L_047EE
        jmp     NEAR L_04941
L_047EE:
        jmp     NEAR L_0489E
L_047F1:
        mov     bl, 11h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_047F7:
        int     2ch
L_047F9:
        jae     L_04810
        mov     bl, 1
        mov     bh, byte ptr [G_DISK_DEVICE]
L_04801:
        int     2ch
L_04803:
        mov     bl, 11h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_052BB:
L_04809:
        int     2ch
L_0480B:
        jae     L_04810
        jmp     NEAR jmp_ferr_no_disk
L_052C2:
L_04810:
        cmp     bl, 0
formating_0_status_04813:
        je      formating_0_status
        jmp     jmp_ferr_write_protect
L_052CA:
formating_0_status:
        mov     byte ptr [G_DIR_CACHED_DEVICE], 0ffh
formating_display:
        BC_STATUS 42, 36, " Formating..........   0%         "
lcd_coord_04845:
        BC_FLUSH
L_04848:
        mov     al, byte ptr [G_DISK_TYPE_SEL]
        mov     bl, 18h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_04851:
        int     2ch
L_05305:
L_04853:
        mov     bl, 0ch
        mov     bh, byte ptr [G_DISK_DEVICE]
L_04859:
        int     2ch
L_0485B:
        push    ax
        mov     ah, 64h
        mul     ah
        mov     bl, 50h
        div     bl
        sub     ah, ah
raw_04866:
        BC_FIELD 168, 36
L_0486B:
        pop     ax
        call    L_0488A
lcd_coord_0486F:
        BC_FLUSH
        db      3ch
handler_BC_PUSH_CONTEXT:
        push    ax
L_04874:
        jne     L_04853
        mov     cx, 1f4h
L_04879:
        call    delay_ticks
        mov     bl, 19h
        mov     bh, byte ptr [G_DISK_DEVICE]
calls_reset_state_vars_04882:
        int     2ch
calls_reset_state_vars_04884:
        call    reset_state_vars
        jmp     error_scsi_not_ready_044f1
L_0488A:
        test    al, 1
L_0488C:
        je      wait_handler_04896
        if      FW_VERSION = 150
L_05345                         equ     $+5
        endif
clear_rect_0488E:
        BC_CLEAR_RECT 6, 30, 21, 19
L_04895:
        ret
wait_handler_04896:
        if      FW_VERSION = 172
L_04899                         equ     $+3
        endif
        BC_WAIT 6, 30, BMP_WARNING
        ret
L_0489E:
        mov     bl, 11h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_048A4:
        int     2ch
L_048A6:
        jae     L_048AB
        jmp     error_scsi_not_ready_044D5
L_048AB:
        cmp     dh, 0
formating_status_048AE:
        je      formating_display_2
        cmp     dh, 7
formating_status:
        je      formating_display_2
        ret
formating_display_2:
FORMATING_DISPLAY_2_V150:
        BC_STATUS 42, 36, " Formating............             "
this_will_erase_the_whole_status:
        BC_FLUSH
disk_mode_erase_confirm:
        BC_STATUS 42, 36, "THIS WILL ERASE THE WHOLE DISK!!"
disk_verify:
        mov     byte ptr [G_DIR_CACHED_DEVICE], 0ffh
        mov     ah, 6
        int     2dh
        jae     L_0491B
        mov     ah, 4
        int     2dh
L_04917:
        jae     L_0491B
        jmp     SHORT L_0493F
L_0491B:
        mov     al, byte ptr [FMT_LAST_PARTITION]
        inc     al
        mov     bl, 0ch
        mov     bh, byte ptr [G_DISK_DEVICE]
calls_memory_copy_04926:
        int     2ch
calls_memory_copy_04928:
        call    memory_copy
        cmp     al, 13h
L_0492D:
        je      L_0493C
        mov     al, byte ptr [FMT_LAST_PARTITION]
        inc     al
        mov     bl, 0ch
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0493A:
        int     2ch
L_0493C:
        jmp     error_scsi_not_ready_044f1
L_0493F:
        stc
        ret
L_053F3:
L_04941:
        mov     bl, 1
        mov     bh, byte ptr [G_DISK_DEVICE]
        if      FW_VERSION = 172
formating_0_1_status_04947:
        endif
        int     2ch
        cmp     al, 20h
formating_0_1_status:
        if      FW_VERSION = 172
        jne     formating_0_1_status+4
        else
        jne     formating_0_1_status_04947
        endif
        jmp     SHORT print_no_from
        if      FW_VERSION = 172
        db      2bh, 0c0h, 0cdh, 47h, 0c6h, 06h, 0a9h, 78h, 0ffh
        else
formating_0_1_status_04947:
        db      2bh, 0c0h, 0cdh, 47h, 0c6h, 06h, 8fh, 78h, 0ffh
        endif
formating_display_3:
        BC_STATUS 42, 36, " Formating..........   0%         "
lcd_coord_04980:
        BC_FLUSH
L_04983:
        mov     ax, 0
L_04986:
        push    ax
        mov     bl, 0ch
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0498D:
        int     2ch
L_0498F:
        pop     ax
L_04990:
        call    format_progress_percent_display
        inc     al
        cmp     al, 80h
        jne     L_04986
        mov     cx, 1f4h
L_0499C:
        call    delay_ticks
        mov     bl, 19h
        mov     bh, byte ptr [G_DISK_DEVICE]
calls_reset_state_vars_049a5:
        int     2ch
calls_reset_state_vars_049a7:
        call    reset_state_vars
        jmp     error_scsi_not_ready_044f1
format_progress_percent_display:
        push    ax
        mov     dl, al
        mov     bl, 64h
        mul     bl
        mov     cl, 7fh
        div     cl
        mov     ah, 0
raw_049BA:
        BC_FIELD 168, 36
L_049BF:
        mov     al, dl
        call    L_0488A
lcd_coord_049C4:
        BC_FLUSH
        if      FW_VERSION = 172
no_f_rom_msg:
        pop     ax
        else
        db      5bh
        endif
        ret
L_0547B:
print_no_from:
        if      FW_VERSION = 150
L_05481                         equ     $+6
        endif
        BC_PRINT "        No F-ROM !!      "
buf_ptr_advance_049E6:
        if      FW_VERSION = 172
        db      0b9h, 0f4h
handler_BC_BUF_PTR_ADVANCE:
        add.d0  ax, bp
        db      81h, 0c5h
        else
        mov     cx, 1f4h
        call    delay_ticks
        endif
seq_init_049EC:
        BC_SEQ_INIT
ui_ctrl_049ef:
        jmp     error_scsi_not_ready_044f1
ui_print_no_from_9f2:
        BC_UI_CTRL 199, 0, 19, 9
bc_int6c_049f9:
        INT_6C error_scsi_not_ready_044f1, NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS
calls_setup_callback_vectors_04a03:
        mov     al, 1
        mov     si, G_DISK_TYPE_SEL
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_04a0b:
        call    setup_callback_vectors
        ret
bc_int6c_04a0f:
        INT_6C error_scsi_not_ready_044f1, NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS
calls_setup_callback_vectors_04a19:
        mov     al, 19h
        mov     si, P_18BC
        mov     bx, L_04A34
calls_setup_callback_vectors_04a21:
        call    setup_callback_vectors
calls_format_from_init_04a24:
        INT_5D calls_format_from_init_04a29
calls_format_from_init_04a28:
        ret
calls_format_from_init_04a29:
        call    format_from_init
ui_print_no_from_a2c:
        BC_UI_CTRL 185, 8, 19, 9
L_04A33:
        ret
L_04A34:
        mov     bl, al
        sub     bh, bh
L_04A38:
        mov     ax, word ptr [FMT_DISK_SIZE_MB]
        cmp     ax, 0ah
L_04A3E:
        jae     L_04A41
        ret
L_04A41:
        sub     dx, dx
        inc     bl
        div     bx
        cmp     ax, 0ah
        jae     L_04A57
        cmp     bl, 3
L_04A4F:
        jae     L_04A52
        ret
L_04A52:
        sub     bl, 2
L_04A55:
        jmp     SHORT L_04A38
L_04A57:
        cmp     ax, 3e8h
        jb      L_04A6C
        cmp     bl, 19h
        jae     L_04A6C
        inc     bl
L_04A63:
        mov     ax, word ptr [FMT_DISK_SIZE_MB]
        sub     dx, dx
        div     bx
        jmp     SHORT L_04A57
L_04A6C:
        dec     bl
L_04A6E:
        mov     byte ptr [FMT_LAST_PARTITION], bl
        mov     word ptr [FMT_PART_SIZE_MB], ax
        ret
format_window:
        cmp     byte ptr [G_DISK_DEVICE], 9
L_04A7B:
        if      FW_VERSION = 172
        je      L_04A7E
        ret
L_04A7E:
        cmp     byte ptr [G_FROM_CARD_STATE], 22h
L_04A83:
        endif
        je      L_04A86
        ret
L_04A86:
        callf   CS1_SEG:calls_f_rom_fragmentation_dialog_1c6d0
        if      FW_VERSION = 172
soft_key_04A8B:
        int     50h
        endif
screen_close_disk:
        BC_SOFTKEY 4, BC_SK_FILL,  "CLOSE"
        if      FW_VERSION = 150
        INT_5B error_scsi_not_ready_044f1
        INT_67 error_scsi_not_ready_044f1
        endif
softkey_close_04a98:
        ret
        if      FW_VERSION = 150
isr_46                          equ     $+1
        endif
        db      00h, 0b8h
        dw      DATA_SEG
        db      8eh, 0d8h
calls_flush_04_04a9f:
        call    flush_04AA3
        iret
flush_04AA3:
        DLG_SMPTE_TEST
soft_key_04AFD:
        int     50h
screen_start:
        BC_SOFTKEY 5, BC_SK_BOX,   "START"
softkey_stop:
        BC_SOFTKEY 6, BC_SK_BOX,   "STOP"
softkey_stop_04b14:
        INT_5C smpte_test_idle
bc_int6a_04b18:
        INT_68 smpte_test_start
bc_int6a_04b1c:
        INT_69 smpte_test_stop
bc_int6a_04b20:
        INT_6A smpte_test_inc, NULL_HANDLER_OFS
L_04B26:
        mov     word ptr [UI_SLOT_EXIT], L_04B4A
        push    cs
L_04B2D:
        call    smpte_frame_rate_params_load
        mov     dx, 1c0h
        mov     al, 18h
        out     dx, al
        sub     ax, ax
        mov     byte ptr [SMPTE_FRAME], al
        mov     byte ptr [SMPTE_SEC], al
        mov     byte ptr [SMPTE_MIN], al
        mov     byte ptr [SMPTE_HOUR], al
        mov     byte ptr [P_2083], 1
        ret
L_04B4A:
        mov     byte ptr [P_2083], 0
        ret
smpte_test_inc:
        mov     cl, al
        mov     ch, 0
L_04B54:
        push    cx
        callf   CS1_SEG:P_6272
        pop     cx
        loop    L_04B54
        ret
smpte_test_idle:
        sub     al, al
        xchg    byte ptr [P_2082], al
        test    al, 1
        push    ax
        if      FW_VERSION = 172
        je      L_04B69+3
L_04B69:
        else
        je      L_04B69
        endif
        call    smpte_test_rx_display
        if      FW_VERSION = 150
L_04B69:
        endif
        pop     ax
L_04B6D:
        call    smpte_test_tx_display
        ret
smpte_test_rx_display:
        mov     si, P_2084
        mov     cl, 96h
        mov     ch, 1dh
        call    put_bcd_digit_low
        lodsb
        and     al, 3
        call    put_digit_step_left
        sub     cl, 6
L_04B84:
        call    put_two_bcd_digits
L_04B87:
        call    put_two_bcd_digits
L_04B8A:
        call    put_two_bcd_digits
        mov     byte ptr [UI_REDRAW_REQ], 1
        ret
put_two_bcd_digits:
        call    put_bcd_digit_low
        call    put_bcd_digit_low
        sub     cl, 6
        ret
put_bcd_digit_low:
        lodsb
        and     al, 0fh
put_digit_step_left:
        or      al, 30h
        pusha
select_04BA3:
        BC_PUTCHAR
        db      61h
L_04BA7:
        sub     cl, 6
        ret
smpte_test_tx_display:
        mov     si, P_1A6C
        mov     cl, 5ah
        mov     ch, 25h
        lodsb
        and     al, 1fh
        call    put_decimal2_al
        add     cl, 6
        call    put_two_decimal_digits
        add     cl, 6
        call    put_two_decimal_digits
        add     cl, 6
        call    put_two_decimal_digits
        mov     byte ptr [UI_REDRAW_REQ], 1
        ret
put_two_decimal_digits:
        lodsb
put_decimal2_al:
        mov     ah, 0
        mov     bl, 0ah
        div     bl
        push    ax
        call    put_digit_step_right
        pop     ax
        mov     al, ah
put_digit_step_right:
        or      al, 30h
        pusha
select_04BE1:
        BC_PUTCHAR
        db      61h
L_04BE5:
        add     cl, 6
        ret
smpte_frame_rate_params_load:
        mov     al, byte ptr [G_FRAME_RATE]
        mov     ah, 7
        mul     ah
        add     ax, P_209B
        mov     si, ax
        mov     ax, word ptr [si]
        mov     byte ptr [P_2094], al
        mov     byte ptr [P_2095], ah
        mov     ax, word ptr [si+2]
        mov     word ptr [P_2096], ax
        mov     ax, word ptr [si+4]
        mov     word ptr [P_2098], ax
        mov     al, byte ptr [si+6]
        mov     byte ptr [P_209A], al
        mov     dx, 0c016h
        mov     al, 0b6h
        out     dx, al
        mov     dx, 1c0h
        mov     al, 0
        out     dx, al
        mov     al, 34h
        mov     dx, 1c4h
        out     dx, al
        mov     al, 0a0h
        mov     dx, 1c6h
        out     dx, al
        mov     al, 35h
        mov     dx, 1c4h
        out     dx, al
        mov     al, 0fh
        mov     dx, 1c6h
        out     dx, al
        mov     al, 36h
        mov     dx, 1c4h
        out     dx, al
        mov     al, byte ptr [P_2094]
        mov     dx, 1c6h
        out     dx, al
        mov     al, 37h
        mov     dx, 1c4h
        out     dx, al
        mov     al, byte ptr [P_2095]
        mov     dx, 1c6h
        out     dx, al
        cmp     byte ptr [G_SYNC_IN_MODE], 3
L_04C53:
        je      L_04C56
        retf
L_04C56:
        mov     dx, 1c0h
        mov     al, 8
        out     dx, al
        retf
isr_int20:
        pusha
        push    ds
        push    es
        mov     ax, DATA_SEG
        mov     ds, ax
        mov     es, ax
        push    dx
        mov     dx, 1c0h
        in      al, dx
        pop     dx
        mov     byte ptr [P_2082], al
        test    al, 2
L_04C72:
        jne     br_04C93
        mov     di, P_2084
        mov     dx, 1c4h
        mov     al, 80h
        out     dx, ax
        mov     dx, 1c6h
        mov     cx, 8
        rep insb
        mov     byte ptr [P_208C], 0c8h
        mov     byte ptr [P_208D], 1
isr_04C8F:
        pop     es
        pop     ds
        popa
        iret
br_04C93:
        cmp     byte ptr [P_2083], 0
        jne     br_04CA1
        cmp     byte ptr [SEQ_RUNNING], 0
        je      isr_04C8F
br_04CA1:
        mov     ax, word ptr [P_2096]
        cmp     byte ptr [SMPTE_FRAME], 2
        jae     L_04CC2
        cmp     byte ptr [SMPTE_FRAME], 0
        jne     br_04CB6
        add     ax, word ptr [P_2098]
br_04CB6:
        push    ax
        mov     dx, 0c014h
        out     dx, al
        pop     ax
        mov     al, ah
        mov     dx, 0c014h
        out     dx, al

L_04CC2:
        callf   CS1_SEG:P_6272
L_04CC7:
        call    smpte_tx_write_time
        mov     byte ptr [P_208E], 1
        jmp     SHORT isr_04C8F
L_04CD1:
        mov     al, 0
        xchg    byte ptr [P_208E], al
        cmp     al, 0
        jne     br_04CDC
        retf
br_04CDC:
        stc
        retf
smpte_tx_write_time:
        mov     dx, 1c4h
        mov     al, 88h
        out     dx, al
        mov     dx, 1c6h
        mov     al, byte ptr [SMPTE_FRAME]
        mov     ah, 0
        mov     bl, 0ah
        div     bl
        push    ax
        mov     al, ah
        out     dx, al
        pop     ax
        cmp     byte ptr [G_FRAME_RATE], 2
        jne     br_04CFE
        or      al, 0ch
br_04CFE:
        out     dx, al
        mov     al, byte ptr [SMPTE_SEC]
        call    smpte_out_decimal2
        mov     al, byte ptr [SMPTE_MIN]
        call    smpte_out_decimal2
        mov     al, byte ptr [SMPTE_HOUR]
        and     al, 1fh
smpte_out_decimal2:
        mov     ah, 0
        mov     bl, 0ah
        div     bl
        push    ax
        mov     al, ah
        out     dx, al
        pop     ax
        out     dx, al
        ret
smpte_hw_start_far:
        call    smpte_hw_start
        retf
smpte_test_start:
        sub     ax, ax
        mov     byte ptr [SMPTE_FRAME], al
        mov     byte ptr [SMPTE_SEC], al
        mov     byte ptr [SMPTE_MIN], al
        mov     byte ptr [SMPTE_HOUR], al
smpte_hw_start:
        push    dx
        mov     dx, 1c0h
        in      al, dx
        pop     dx
        mov     dx, 1c0h
        mov     al, 18h
        out     dx, al
        mov     al, 34h
        mov     dx, 1c4h
        out     dx, al
        mov     al, 30h
        mov     dx, 1c6h
        out     dx, al
        mov     dx, 0c016h
        mov     al, 0b6h
        out     dx, al
        callf   CS1_SEG:P_6272
L_04D52:
        call    smpte_tx_write_time
        mov     ax, word ptr [P_2096]
        push    ax
        mov     dx, 0c014h
        out     dx, al
        pop     ax
        mov     al, ah
        mov     dx, 0c014h
        out     dx, al
        ret
smpte_test_stop_far:
        call    smpte_test_stop
        retf
smpte_test_stop:
        mov     dx, 0c016h
        mov     al, 0b6h
        out     dx, al
        mov     al, 34h
        mov     dx, 1c4h
        out     dx, al
        mov     al, 0a0h
        mov     dx, 1c6h
        out     dx, al
        mov     dx, 1c0h
        mov     al, 0
        out     dx, al
        cmp     byte ptr [G_SYNC_IN_MODE], 3
L_04D86:
        je      L_04D89
        ret
L_04D89:
        mov     dx, 1c0h
        mov     al, 8
        out     dx, al
        ret
L_04D90:
        mov     ax, ds
        mov     es, ax
        mov     al, 0
        xchg    byte ptr [P_208D], al
        cmp     al, 0
L_04D9C:
        jne     L_04D9F
        retf
L_04D9F:
        cli
        mov     si, P_2084
        and     byte ptr [si], 0fh
        and     byte ptr [si+1], 3
        and     byte ptr [si+2], 0fh
        and     byte ptr [si+3], 7
        and     byte ptr [si+4], 0fh
        and     byte ptr [si+5], 7
        and     byte ptr [si+6], 0fh
        and     byte ptr [si+7], 3
        mov     di, P_208F
L_04DC5:
        call    smpte_digit_pair_to_byte
        mov     bl, byte ptr [G_FRAME_RATE]
        mov     bh, 0
        mov     bl, byte ptr [bx+TBL_SMPTE_FPS]
        cmp     cl, bl
L_04DD4:
        jae     br_04E15
        mov     byte ptr [di+3], cl
L_04DD9:
        call    smpte_digit_pair_to_byte
        cmp     cl, 3ch
L_04DDF:
        jae     br_04E15
        mov     byte ptr [di+2], cl
L_04DE4:
        call    smpte_digit_pair_to_byte
        cmp     cl, 3ch
L_04DEA:
        jae     br_04E15
        mov     byte ptr [di+1], cl
L_04DEF:
        call    smpte_digit_pair_to_byte
        cmp     cl, 18h
L_04DF5:
        jae     br_04E15
        mov     byte ptr [di], cl
        mov     bp, di
        callf   CS1_SEG:TIME_ACCUM_HOURS_FAR_OFS
        mov     bl, byte ptr [G_FRAME_RATE]
        mov     bh, 0
        mov     bl, byte ptr [bx+TBL_1A76]
        sub     bl, 5
L_04E0D:
        add     di, bx
        adc     si, 0
        sti
        stc
        retf
br_04E15:
        sti
        clc
        retf
smpte_digit_pair_to_byte:
        mov     ch, byte ptr [si+1]
        shl     ch, 1
        mov     cl, ch
        shl     ch, 2
L_04E22:
        add     cl, ch
        add     cl, byte ptr [si]
        add     si, 2
        ret
song_advance_step_far:
        call    song_advance_step
        retf
L_058DE:
seq_init_04E2E:
        BC_SEQ_INIT
        db      90h, 0eh
calls_buffer_init_10_04e33:
        call    buffer_init_10A2
        callf   CS1_SEG:seq_edit_end_far
        callf   CS1_SEG:undo_seq_discard_far
        mov     byte ptr [P_70F9], 0
calls_ui_4e74_04e45:
        mov     byte ptr [B_0B1C], 1
        mov     byte ptr [G_SONG_MODE], 1
        callf   CS1_SEG:SONG_SCREEN_OFS
calls_ui_4e74_04e54:
        call    ui_softkey_stop_e74
        mov     byte ptr [G_SONG_STEP_REPEAT], 0
        mov     al, byte ptr [G_SONG_INDEX]
        call    song_select
L_04E62:
        call    song_screen_install_transport_handlers
        sub     ax, ax
        mov     word ptr [SEQ_ELAPSED_MS_LO], ax
        mov     word ptr [SEQ_ELAPSED_MS_HI], ax
        if      FW_VERSION = 172
        mov     word ptr [SEQ_CUR_BAR], ax
        mov     word ptr [SEQ_BAR_TICK], ax
        endif
        ret
ui_softkey_stop_e74:
        BC_UI_CTRL 34, 1, 117, 9
L_04E7B:
        int     50h
L_04E7D:
        if      FW_VERSION = 172
        call    bc_int5d_04eaa
        else
        call    bc_int6b_04ea9+1
        endif
        mov     al, 13h
        mov     si, G_SONG_INDEX
        mov     bx, song_select
calls_setup_callback_alt_04e88:
        call    setup_callback_alt
bc_int6c_04e8b:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_05686, NULL_HANDLER_OFS, ui_stat_b_564f_743
bc_int5d_04e95:
        INT_5B file_dialog_052CC
calls_check_status_flag_596c_04e99:
        INT_5D close_handler_05072
calls_check_status_flag_596c_04e9d:
        INT_5C song_screen_idle
calls_check_status_flag_596c_04ea1:
        call    seq_edit_allowed
        jne     bc_int6b_04ea9
        call    song_screen_install_transport_handlers
bc_int6b_04ea9:
        ret
        if      FW_VERSION = 150
        db      0cdh, 6bh
        db      0dah
        db      0eh
        db      0dah
        db      0eh
        db      0dah
        db      0eh
        db      01h, 63h, 0dah
        db      0eh
        db      0dah
        db      0eh
        endif
bc_int5d_04eaa:
        if      FW_VERSION = 172
        INT_6B NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, file_dialog_06481, NULL_HANDLER_OFS, NULL_HANDLER_OFS
        endif
bc_int5d_04eb8:
        INT_5D close_handler_05072
bc_int5c_04ebc:
        INT_5C song_screen_idle
L_04EC0:
        cmp     byte ptr [SEQ_RUNNING], 0
L_04EC5:
        jne     bc_int6b_04eca
        jmp     song_screen_install_transport_handlers
L_05974:
bc_int6b_04eca:
        jmp     L_05E72
L_05977:
bc_int6b_04ecd:
        INT_6B NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, file_dialog_06481, calls_check_status_flag_596c_05d1a, calls_check_status_flag_596c_05d3f
        db      0ebh, 0dbh
song_select:
        sub     ah, ah
        mov     bx, 210h
        mul     bx
        add     ax, TBL_SONGS
        mov     word ptr [PTR_CUR_SONG], ax
        mov     si, ax
        mov     al, byte ptr [si+SONG_LOOP_FIRST]
        mov     byte ptr [G_SONG_LOOP_FIRST], al
        mov     al, byte ptr [si+SONG_LOOP_LAST]
        mov     byte ptr [G_SONG_LOOP_LAST], al
        mov     byte ptr [G_SONG_STEP], 0
        mov     al, byte ptr [si+SONG_LOOP_ON]
        mov     byte ptr [G_SONG_LOOP_ON], al
        mov     ax, ds
        mov     es, ax
        add     si, 20ah
        mov     di, D_0BC8
        mov     cx, 5
        rep movsb
calls_get_table_entry_04f16:
        call    get_table_entry
L_04F19:
        jne     calls_process_input_04f1c
        ret
calls_process_input_04f1c:
        mov     byte ptr [SEL_SEQ], al
calls_process_input_04f1f:
        call    process_input
calls_check_flag_1d86_04f22:
        call    check_flag_1d86
calls_get_table_entry_b20_04f25:
        call    get_table_entry_b20
        sub     ax, ax
        mov     word ptr [G_SONG_STEP_START_LO], ax
        mov     word ptr [G_SONG_STEP_START_HI], ax
        mov     word ptr [W_4C20], ax
        mov     word ptr [W_4C22], ax
        mov     word ptr [W_582E], ax
        mov     word ptr [W_5830], ax
        ret
check_flag_1d86:
        cmp     byte ptr [SEQ_RUNNING], 0
L_04F42:
        je      br_04F45
        ret
br_04F45:
        mov     byte ptr [G_SONG_STEP_REPEAT], 0
        mov     byte ptr [G_SONG_EDITED], 0
        sub     ax, ax
        mov     word ptr [W_582E], ax
        mov     word ptr [W_5830], ax
        mov     word ptr [W_4C20], ax
        mov     word ptr [W_4C22], ax
        mov     word ptr [G_SONG_STEP_START_LO], ax
        mov     word ptr [G_SONG_STEP_START_HI], ax
        mov     word ptr [SEQ_ELAPSED_MS_LO], ax
        mov     word ptr [SEQ_ELAPSED_MS_HI], ax
        mov     ax, ds
        mov     es, ax
        mov     si, P_4C2A
        mov     di, P_502A
        mov     bp, P_9DD8
        push    si
        push    di
        push    bp
        mov     cx, 0fah
        sub     ax, ax
L_04F7E:
        mov     word ptr [si], ax
        mov     word ptr [si+2], ax
        mov     word ptr [bp], ax
        mov     word ptr [bp+2], ax
        stosw
        stosw
        stosw
        stosw
        add     si, 4
        add     bp, 8
        loop    L_04F7E
        pop     bp
        pop     di
L_04F97:
        pop     si
        add     si, 4
        add     bp, 8
        add     di, 8
        mov     bx, word ptr [PTR_CUR_SONG]
        add     bx, 10h
L_04FA8:
        mov     ax, word ptr [bx]
        cmp     al, 0ffh
L_04FAC:
        jne     calls_process_input_04fb1
        jmp     NEAR br_0506C

calls_process_input_04fb1:
        pusha
calls_process_input_04fb2:
        call    process_input
        popa
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[TBL_0013], 0
L_04FC0:
        jne     br_04FC5
        jmp     NEAR br_05059
br_04FC5:
        mov     ax, word ptr es:[26h]
        or      ax, word ptr es:[28h]
        jne     br_04FD9
        pusha
        push    es
        callf   CS1_SEG:P_7241
        pop     es
        popa
br_04FD9:
        mov     ax, word ptr es:[18h]
        mov     word ptr [SEQ_CUR_BAR], ax
        mov     word ptr [SEQ_BAR_TICK], 0
        mov     cl, byte ptr [bx+1]
        mov     ch, 0
        jcxz    br_05059
        mov     word ptr [si-4], ax
        mul     cx
        cmp     dx, 0
        je      br_04FFA
        mov     ax, 3e7h

br_04FFA:
        cmp     ax, 3e8h
        jb      br_05002
        mov     ax, 3e7h

br_05002:
        mov     word ptr [si+2], ax
        mov     ax, word ptr es:[26h]
        mov     dx, word ptr es:[28h]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     cl, byte ptr [bx+1]
        mov     ch, 0
        sub     ax, ax
        sub     dx, dx
tgt_0501D:
        add     ax, word ptr es:[26h]
        adc     dx, word ptr es:[28h]
        loop    tgt_0501D
        mov     word ptr [bp+4], ax
        mov     word ptr [bp+6], dx
        mov     ax, word ptr es:[2ah]
        mov     dx, word ptr es:[TBL_002C]
        mov     word ptr [di-8], ax
        mov     word ptr [di-6], dx
        mov     cl, byte ptr [bx+1]
        mov     ch, 0
        sub     ax, ax
        sub     dx, dx
tgt_05047:
        add     ax, word ptr es:[2ah]
        adc     dx, word ptr es:[TBL_002C]
        loop    tgt_05047
        mov     word ptr [di+4], ax
        mov     word ptr [di+6], dx
br_05059:
        add     si, 4
        add     bp, 8
        add     di, 8
        add     bx, 2
        sub     ax, ax
        mov     word ptr [si], ax
        jmp     NEAR L_04FA8
br_0506C:
        callf   CS1_SEG:P_71B5
        ret
close_handler_05072:
        BC_PLANE_A
clear_rect_05075:
        BC_CLEAR_RECT 104, 23, 114, 24
clear_rect_0507C:
        BC_CLEAR_RECT 228, 23, 12, 24
clear_rect_05083:
        BC_CLEAR_RECT 84, 23, 18, 24
L_0508A:
        call    L_01844
L_0508D:
        call    song_screen_name_display
L_05090:
        call    L_05B75
L_05093:
        call    L_0516F
L_05096:
        call    L_051C7
        mov     al, byte ptr [G_SONG_LOOP_ON]

jump_handler_0509C:
        BC_JUMP 0242ah
bc_target_050a1:
        ret
song_screen_name_display:
        mov     al, byte ptr [G_SONG_INDEX]
        inc     al
ui_menu_050A7:
        BC_UI_MENU 36, 2
        mov     si, word ptr [PTR_CUR_SONG]
        cmp     byte ptr [si+SONG_USED], 0
        je      ui_a_050C5
        push    si
        add     si, 0
        mov     dx, ds
status_b_050BD:
        BC_STATUS_B 54, 2, 16
handler_BC_CHECK_COND:
        pop     si
        ret
ui_a_050C5:
        BC_UI_A4 54, 2
        db      0c3h
L_05B75:
        BC_CLEAR_RECT 105, 23, 114, 24
        mov     bl, byte ptr [G_SONG_STEP]
        cmp     bl, 0
L_050D9:
        je      L_050E3
        dec     bl
L_050DD:
        call    song_step_row_display
L_050E0:
        jae     L_050E3
        ret
L_050E3:
        mov     al, 8
seq_edit_050E5:
        BC_SEQ_EDIT
L_050E8:
        call    song_step_row_display
L_050EB:
        jae     L_050EE
        ret
L_050EE:
        mov     al, 10h
seq_edit_050F0:
        BC_SEQ_EDIT
L_050F3:
        call    song_step_row_display
close_handler_050F6:
        BC_PLANE_A
L_050F9:
        ret
song_step_row_display:
        mov     al, bl
        if      FW_VERSION = 172
L_050FC:
        endif
        mov     ah, 0
        shl     ax, 1
        add     ax, word ptr [PTR_CUR_SONG]
        add     ax, 10h
        mov     si, ax
        mov     cx, word ptr [si]
        cmp     cl, 0ffh
L_0510E:
        je      end_song_display
        pusha
        mov     al, bl
        inc     al
        mov     ah, 0
raw_05117:
        BC_FIELD 84, 23
L_0511C:
        mov     al, cl
        inc     al
arith_ext_05120:
        BC_ARITH_EXT 01769h
status_display_05BCF:
status_display_5125:
        BC_STATUS 117, 23, "-"
L_0512C:
        mov     al, ch
        sub     ah, ah
jump__05130:
        BC_JUMP_3C 017e4h
end_of_song_status_05135:
        mov     al, cl
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        mov     si, 2
        mov     dx, es
end_of_song_status:
        BC_STATUS_B 123, 23, 16
        db      61h, 0feh, 0c3h, 0f8h, 0c3h
end_song_display:
END_SONG_DISPLAY_V150:
        BC_STATUS 105, 23, "   (end of song)"
status_display_05C0C:
status_display_5162:
        BC_STATUS 228, 23, "  "
close_handler_0516A:
        BC_PLANE_A
        db      0f9h, 0c3h
L_0516F:
        cmp     byte ptr [B_1D85], 0
L_05174:
        jne     ext_display_2
status_a_05176:
        BC_STATUS_A 42, 13, G_TEMPO_SOURCE_SEQ, D_1506
ui_a_0517F:
        call    timer_handler
ext_1_status_05182:
        BC_UI_A2 42, 21
ext_1_status:
        ret
ext_display_2:
EXT_DISPLAY_2_V150:
        BC_STATUS 42, 21, "(Ext)"
status_ext_05193:
        ret
song_screen_idle:
        sub     ax, ax
        xchg    byte ptr [B_1D87], al
        cmp     al, 0
        je      L_051A1
calls_mode_05_0519e:
        call    mode_05F30
L_051A1:
        sub     ax, ax
        xchg    byte ptr [G_POS_REDRAW_REQ], al
        or      al, al
L_051A9:
        jne     close_handler_051AC
        ret
close_handler_051AC:
        BC_PLANE_A
L_051AF:
        call    L_051C7
        sub     ax, ax
        xchg    byte ptr [B_1D83], al
        cmp     al, 0
L_051BA:
        je      lcd_coord_051BF
L_051BC:
        call    L_0516F
lcd_coord_051BF:
        BC_FLUSH
buffer_051C2:
        ret
handler_BC_BUFFER:
        call    L_051C7
        retf
L_051C7:
        cmp     byte ptr [B_0B28], 0
L_051CC:
        jne     status_display_522C
        mov     cl, byte ptr [G_SONG_STEP]
        mov     ch, 0
        shl     cx, 1
        mov     di, word ptr [PTR_CUR_SONG]
        add     di, 10h
        mov     si, P_4C26
        sub     ax, ax
        mov     bx, 0fffeh
loop_051E5:
        add     bx, 2
        add     si, 4
        add     ax, word ptr [si+2]
        cmp     word ptr [bx+di], -1
        je      L_05204
        cmp     bx, cx
        jne     loop_051E5
        mov     cx, ax
        mov     al, byte ptr [G_SONG_STEP_REPEAT]
        mov     ah, 0
        mov     bx, word ptr [si]
        mul     bx
        add     ax, cx
L_05CAE:
L_05204:
        add     ax, word ptr [SEQ_CUR_BAR]
range_05208:
        cmp     ax, 3e8h
        jb      L_05CBA
        sub     ax, 3e8h
        if      FW_VERSION = 172
        jmp     range_05208
        endif
L_05CBA:
        if      FW_VERSION = 172
        db      0a3h, 18h, 4ch, 0a1h, 42h, 1dh, 0a3h, 1ah, 4ch, 0a1h, 18h, 4ch, 8bh, 0eh, 1ah, 4ch
        db      8ah, 16h, 48h, 1dh
        else
        mov     word ptr [W_4C18], ax
        mov     ax, word ptr [SEQ_BAR_TICK]
        mov     word ptr [D_4C1A], ax
        mov     ax, word ptr [W_4C18]
        mov     cx, word ptr [D_4C1A]
        db      8ah, 16h, 3ch, 1dh
        endif
h_m_s_2_status:
        BC_RANGE 192, 1
h_m_s_1_status:
        ret
status_display_522C:
        BC_STATUS 192, 1, "  H  M  S"
status_h__m__s_0523b:
        call    fn_05285
        cmp     byte ptr [G_SYNC_OUT_MODE], 2
L_05243:
        jb      br_0524E
        cmp     byte ptr [SEQ_RUNNING], 0
L_0524A:
        je      br_0524E
        jmp     L_05D0A
br_0524E:
        cmp     byte ptr [SEQ_RUNNING], 0
        jne     L_0525D
        sub     ax, ax
        mov     word ptr [SEQ_ELAPSED_MS_LO], ax
        mov     word ptr [SEQ_ELAPSED_MS_HI], ax
L_0525D:
        callf   CS1_SEG:P_63E9
L_05D0A:
        cli
        mov     ax, word ptr [SMPTE_HOUR]
        mov     bx, word ptr [SMPTE_SEC]
        mov     cl, byte ptr [SMPTE_SUBFRAME]
        sti
        and     al, 1fh
ui_menu_05271:
        BC_UI_MENU 192, 1
        db      8ah
L_05277:
        db      0c4h
ui_menu_05278:
        BC_UI_MENU 210, 1
        db      8ah
L_0527E:
        ret
ui_menu_0527F:
        BC_UI_MENU 228, 1
        db      0c3h
fn_05285:
        mov     cl, byte ptr [G_SONG_STEP]
        mov     ch, 0
        shl     cx, 1
        mov     di, word ptr [PTR_CUR_SONG]
        add     di, 10h
        mov     si, P_5022
        mov     bx, 0fffeh
        sub     ax, ax
        sub     dx, dx
L_0529E:
        add     bx, 2
        add     si, 8
        cmp     word ptr [bx+di], -1
        je      calls_check_status_flag_596c_052c4
        cmp     bx, cx
L_052AB:
        je      br_052B5
        add     ax, word ptr [si+0ch]
        adc     dx, word ptr [si+0eh]
        jmp     SHORT L_0529E
br_052B5:
        mov     cl, byte ptr [G_SONG_STEP_REPEAT]
        mov     ch, 0
        jcxz    calls_check_status_flag_596c_052c4
tgt_052BD:
        add     ax, word ptr [si]
        adc     dx, word ptr [si+2]
        loop    tgt_052BD
calls_check_status_flag_596c_052c4:
        mov     word ptr [G_SONG_STEP_START_LO], ax
        mov     word ptr [G_SONG_STEP_START_HI], dx
        ret
file_dialog_052CC:
        call    seq_edit_allowed
song_name_status_052CF:
        je      song_dialog
        ret
song_dialog:
SONG_DIALOG_V150:
        BC_FILE_DIALOG 16, 2, 216, 58, "SONG"
song_name_status:
        BC_PLANE_A
song_name_display:
        if      FW_VERSION = 150
L_05D8E                         equ     $+5
        endif
        BC_STATUS 32, 15, "    Song name:"
default_name_display:
        BC_STATUS 32, 29, " Default name:"
status_default_name_05309:
        mov     si, D_1679
        mov     dx, ds
status_b_0530E:
        BC_STATUS_B 54, 40, 24
        db      0beh, 0cfh
L_05316:
        db      0bh, 8ch, 0dah
        if      FW_VERSION = 150
L_05DCB                         equ     $+10
        endif
status_b_05319:
        BC_STATUS_B 116, 29, 16
softkey_delete:
        BC_SOFTKEY 2, BC_SK_BOX,   "DELETE"
softkey_close:
        BC_SOFTKEY 4, BC_SK_FILL,  "CLOSE"
softkey_copy:
        BC_SOFTKEY 5, BC_SK_BOX,   " COPY "
softkey_copy_05342:
        int     50h
L_05344:
        call    song_window_name_field
        ret
L_05DF0:
bc_int67_68_05348:
        int     50h
bc_int67_68_0534a:
        INT_65 delete_song_dialog_05420
bc_int5b_0534e:
        INT_67 seq_init_04E2E
bc_int5b_05352:
        INT_68 song_window_copy
bc_int5b_05356:
        INT_5B seq_init_04E2E
L_0535A:
        ret
song_window_name_field:
        call    bc_int67_68_05348
        mov     si, D_0BCF
        mov     dx, ds
status_b_05363:
        BC_STATUS_B 116, 29, 16
bc_int63_05369:
        if      FW_VERSION = 172
        INT_63 bc_int62_053c9
        else
        INT_63 bc_int62_053c4+5
        endif
L_0536D:
        mov     si, word ptr [PTR_CUR_SONG]
        cmp     byte ptr [si+SONG_USED], 0
L_05376:
        je      bc_int6a_053a1
        mov     ax, ds
        mov     es, ax
        mov     si, word ptr [PTR_CUR_SONG]
        add     si, 0
        mov     cl, 74h
        mov     ch, 0fh
        int     42h
        ret
        if      FW_VERSION = 150
        db      8bh, 36h
        db      0fbh, 4bh
        db      80h
        endif
song_window_name_display:
        if      FW_VERSION = 172
        mov     si, word ptr [PTR_CUR_SONG]
        cmp     byte ptr [si+SONG_USED], 0
L_05393:
        je      bc_int6a_053a1
        else
        mov     sp, 206h
        add     byte ptr [si+0ch], dh
        endif
        add     si, 0
        mov     dx, ds
status_b_0539A:
        BC_STATUS_B 116, 15, 16
        db      0c3h
L_05E49:
bc_int6a_053a1:
        INT_6A bc_int62_053c4, bc_int62_053c4
bc_int61_053a7:
        INT_61 bc_int62_053c4
L_053AB:
        mov     word ptr [UI_SLOT_DIGIT], bc_int62_053c4
        mov     word ptr [UI_SLOT_PAD_HIT], bc_int62_053c4
ui_a_053B7:
        if      FW_VERSION = 172
L_053C0                         equ     $+9
        endif
        BC_UI_A4 116, 15
        if      FW_VERSION = 150
L_05E67                         equ     $+3
        endif
        BC_UI_CTRL 115, 14, 7, 9
        db      0c3h
bc_int62_053c4:
        call    L_053DE
        jmp     SHORT song_window_name_field
        if      FW_VERSION = 150
        db      0cdh, 62h
        endif
bc_int62_053c9:
        if      FW_VERSION = 172
        INT_62 song_window_name_field
tgt_053CD:
        call    song_window_name_display
        mov     ax, ds
        else
        add     dx, word ptr [bp+si-18h]
        mov     dx, 8cffh
        db      0d8h
        endif
        mov     es, ax
        mov     si, D_0BCF
        mov     cl, 74h
        mov     ch, 1dh
        int     42h
        ret
L_053DE:
        mov     di, word ptr [PTR_CUR_SONG]
        cmp     byte ptr [di+SONG_USED], 0
L_053E7:
        je      song_status_053EA
        ret

song_status_053EA:
        mov     byte ptr [di+SONG_USED], 1
        add     di, 0
        mov     si, D_0BCF
        mov     ax, ds
        mov     es, ax
        mov     cx, 10h
        push    di
        rep movsb
        pop     di
delete_all_song_dialog:
        mov     cx, 0eh
delete_song_dialog_05403:
        mov     ah, byte ptr es:[di]
        cmp     ah, 20h
        je      song_status
        inc     di
        loop    delete_song_dialog_05403
song_status:
        mov     al, byte ptr [G_SONG_INDEX]
        inc     al
        sub     ah, ah
        mov     bh, 0ah
        div     bh
        or      ax, 3030h
        mov     word ptr es:[di], ax
        ret
        if      FW_VERSION = 150
delete_song_dialog_05EC8:
L_05EEE                         equ     $+38
        endif
delete_song_dialog_05420:
        DLG_DELETE_SONG
softkey_do_it_0549b:
        int     50h
bc_int67_68_0549d:
        INT_66 delete_all_songs_dialog
bc_int5b_054a1:
        INT_67 calls_seq_init_04_054b2
bc_int5d_054a5:
        INT_68 delete_song_do_it
bc_int5d_054a9:
        INT_5B calls_seq_init_04_054b2
calls_seq_init_04_054ad:
        if      FW_VERSION = 172
        INT_5D delete_song_refresh
        else
L_05F57                         equ     $+2
        INT_5D L_0540B
        endif
calls_seq_init_04_054b1:
        ret
calls_seq_init_04_054b2:
        call    seq_init_04E2E
file_dialog_054B5:
        call    close_handler_05072
delete_all_song_dialog_054B8:
        call    file_dialog_052CC
        ret
delete_all_songs_dialog:
        if      FW_VERSION = 150
L_05F66                         equ     $+2
L_05F71                         equ     $+13
L_05F9A                         equ     $+54
        endif
        DLG_DELETE_ALL_SONG
softkey_do_it_05528:
        int     50h
bc_int5b_0552a:
        INT_5B delete_song_dialog_05420
bc_int67_68_0552e:
        if      FW_VERSION = 150
L_05FD8                         equ     $+2
        endif
        INT_67 delete_song_dialog_05420
bc_int67_68_05532:
        INT_68 delete_all_songs_do_it
L_05536:
        ret
delete_all_songs_do_it:
        mov     ax, ds
        mov     es, ax
        mov     di, TBL_SONGS
        mov     cx, 14h
L_05541:
        mov     si, SONG_RECORD_BLANK
        push    cx
        mov     cx, 210h
        rep movsb
        pop     cx
        loop    L_05541
        jmp     seq_init_04E2E
delete_song_do_it:
        mov     ax, ds
        mov     es, ax
        mov     di, word ptr [PTR_CUR_SONG]
        mov     si, SONG_RECORD_BLANK
        mov     cx, 210h
L_06006:
        rep movsb
        jmp     seq_init_04E2E
        if      FW_VERSION = 172
delete_song_refresh:
        else
L_0540B:
delete_song_refresh             equ     $+1
        endif
        mov     al, byte ptr [G_SONG_INDEX]
        inc     al
ui_menu_05568:
        BC_UI_MENU 88, 17
        db      8bh
L_0556E:
        if      FW_VERSION = 172
        or      word ptr ss:[si-7dh], cx
        mov     byte ptr [bx+si], 8ch
        db      0dah
        else
        db      36h
        db      0fbh
        dec     bx
        add     si, 0
        mov     dx, ds
        endif
status_b_05576:
        BC_STATUS_B 106, 17, 16
        db      0c3h
song_window_copy:
        mov     al, 0
        mov     si, TBL_SONGS
song_1_status_05582:
        cmp     byte ptr [si+SONG_USED], 0
        je      copy_song_dialog_05595
        add     si, 210h
        inc     al
        cmp     al, 14h
        jne     song_1_status_05582
        mov     al, 13h
copy_song_dialog_05595:
        mov     byte ptr [G_COPY_SONG_DEST], al
song_1_status:
        DLG_COPY_SONG
L_055F4:
        int     50h
calls_setup_callback_alt_055f6:
        mov     al, 13h
        mov     si, G_SONG_INDEX
        mov     bx, song_select
calls_setup_callback_alt_055fe:
        call    setup_callback_alt
bc_int5d_05601:
        INT_63 ui_stat_b_564f_656
bc_int5d_05605:
        INT_5D copy_song_refresh
bc_int5b_05609:
        INT_67 calls_seq_init_04_054b2
bc_int5b_0560d:
        INT_68 copy_song_do_it
bc_int5b_05611:
        INT_5B calls_seq_init_04_054b2
L_05615:
        ret
copy_song_refresh:
        mov     al, byte ptr [G_SONG_INDEX]
        inc     al
ui_menu_0561B:
        BC_UI_MENU 100, 16
        db      8bh
L_05621:
        if      FW_VERSION = 172
        or      word ptr ss:[si-7dh], cx
        mov     byte ptr [bx+si], 8ch
        db      0dah
        else
        db      36h
        db      0fbh
        dec     bx
        add     si, 0
        mov     dx, ds
        endif
status_b_05629:
        BC_STATUS_B 118, 16, 16
        if      FW_VERSION = 172
        db      0a0h, 0bh, 4ch, 0b4h, 00h, 50h, 0feh, 0c0h
        else
        db      0a0h
        db      0fdh, 4bh
        mov     ah, 0
        push    ax
        inc     al
        endif
ui_menu_05637:
        BC_UI_MENU 100, 40
        db      58h
L_0563D:
        mov     bx, 210h
        mul     bx
        add     ax, TBL_SONGS
        mov     si, ax
        mov     word ptr [PTR_COPY_SONG_DEST], ax
        add     si, 0
        mov     dx, ds
status_b_0564F:
        BC_STATUS_B 118, 40, 16
        db      0c3h
ui_stat_b_564f_656:
        BC_UI_CTRL 99, 39, 118, 9
calls_setup_callback_vectors_0565d:
        mov     al, 13h
        mov     si, g_copy_song_dest
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_05665:
        call    setup_callback_vectors
bc_int63_05668:
        INT_63 NULL_HANDLER_OFS
bc_int62_0566c:
        INT_62 song_window_copy
L_05670:
        ret
copy_song_do_it:
        mov     ax, ds
        mov     es, ax
        mov     si, word ptr [PTR_CUR_SONG]
        mov     di, word ptr [PTR_COPY_SONG_DEST]
        mov     cx, 210h
        rep movsb
calls_seq_init_04_05682:
        call    seq_init_04E2E
        ret
ui_ctrl_05686:
        cmp     byte ptr [B_0B28], 0
ui_ctrl_0568b:
        jne     ui_stat_b_564f_6ce
ui_stat_b_564f_68d:
        BC_UI_CTRL 191, 0, 19, 9
bc_int6c_05694:
        int     50h
bc_int6c_05696:
        if      FW_VERSION = 172
        call    bc_int5d_04eaa
        else
        call    bc_int6b_04ea9+1
        endif
bc_int6c_05699:
        INT_6C ui_softkey_stop_e74, ui_stat_b_564f_6b2, NULL_HANDLER_OFS, ui_get_table_entry_c87
bc_int6a_056a3:
        INT_6A calls_check_status_flag_596c_05fa3, calls_check_status_flag_596c_0601f
bc_int5d_056a9:
        INT_5B song_screen_now_window
ui_ctrl_056ad:
        INT_5D close_handler_05072
ui_ctrl_056b1:
        ret
ui_stat_b_564f_6b2:
        BC_UI_CTRL 215, 0, 31, 9
bc_int6c_056b9:
        INT_6C ui_ctrl_05686, NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_get_table_entry_c87
bc_int6a_056c3:
        INT_6A calls_check_status_flag_596c_060c3, calls_check_status_flag_596c_060f8
ui_ctrl_056c9:
        INT_5B song_screen_now_window
ui_ctrl_056cd:
        ret
        if      FW_VERSION = 150
L_06176:
        endif
ui_stat_b_564f_6ce:
        BC_UI_CTRL 191, 0, 55, 9
bc_int6c_056d5:
        INT_6C ui_softkey_stop_e74, NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_get_table_entry_c87
bc_int6a_056df:
        INT_6A NULL_HANDLER_OFS, NULL_HANDLER_OFS
bc_int5d_056e5:
        INT_5B song_screen_now_window
bc_int5d_056e9:
        INT_5D close_handler_05072
L_056ED:
        ret
song_screen_now_window:
        cmp     byte ptr [SEQ_RUNNING], 0
L_056F3:
        je      L_056F6
        ret
L_056F6:
        mov     si, word ptr [PTR_CUR_SONG]
        add     si, 20ah
        push    ds
        pop     es
bc_int5b_05700:
        call    calls_check_status_flag_596c_0205c
bc_int5b_05703:
        INT_67 song_now_window_close
bc_int5b_05707:
        INT_5B song_now_window_close
L_0570B:
        INT_6D NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS
L_05717:
        INT_6E NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS
L_05723:
        ret
song_now_window_close:
        mov     si, word ptr [PTR_CUR_SONG]
        mov     ax, ds
        mov     es, ax
        add     si, 20ah
        mov     di, D_0BC8
        mov     cx, 5
        rep movsb
calls_ui_4e74_05738:
        callf   CS1_SEG:SONG_SCREEN_OFS
        call    ui_softkey_stop_e74
        jmp     NEAR ui_ctrl_05686
ui_stat_b_564f_743:
        BC_UI_CTRL 41, 12, 20, 9
bc_int6c_0574a:
        int     50h
bc_int6c_0574c:
        if      FW_VERSION = 172
        call    bc_int5d_04eaa
        else
        call    bc_int6b_04ea9+1
        endif
bc_int6c_0574f:
        INT_6C NULL_HANDLER_OFS, ui_input_76_b5f, ui_softkey_stop_e74, ui_in_sequence_prompt_832
bc_int6a_05759:
        INT_6A song_screen_tempo_inc, song_screen_tempo_dec
bc_int5d_0575f:
        INT_5B ignore_tempo_change_event_status_057A8
bc_int5d_05763:
        INT_5D close_handler_05072
L_05767:
        ret
song_screen_tempo_inc:
        cmp     byte ptr [SEQ_RUNNING], 0
L_0576D:
        je      L_05777
        cmp     byte ptr [B_0B28], 0
L_05774:
        je      L_05777
        ret
L_05777:
        cmp     byte ptr [G_TEMPO_SOURCE_SEQ], 1
L_0577C:
        jne     L_0577F
        ret
L_0577F:
        mov     byte ptr [G_TEMPO_SOURCE_SEQ], 1
L_05784:
        call    L_05888
        ret
song_screen_tempo_dec:
        cmp     byte ptr [SEQ_RUNNING], 0
L_0578D:
        je      L_05797
        cmp     byte ptr [B_0B28], 0
L_05794:
        je      L_05797
        ret
L_05797:
        cmp     byte ptr [G_TEMPO_SOURCE_SEQ], 0
L_0579C:
        jne     L_0579F
        ret
L_0579F:
        mov     byte ptr [G_TEMPO_SOURCE_SEQ], 0
calls_check_status_flag_596c_057a4:
        call    L_05888
        ret
ignore_tempo_change_event_status_057A8:
        call    seq_edit_allowed
tempo_change_dialog_057AB:
        if      FW_VERSION = 172
        je      tempo_change_dialog_a
        else
        je      tempo_change_dialog_057AB+3
        endif
        ret
        if      FW_VERSION = 172
tempo_change_dialog_a:
        endif
        DLG_IGNORE_TEMPO_CHANGE
softkey_close_05809:
        int     50h
bc_int5d_0580b:
        INT_5B calls_seq_init_04_05823
bc_int5d_0580f:
        INT_5D ignore_tempo_change_refresh
bc_int67_68_05813:
        INT_67 calls_seq_init_04_05823
calls_setup_callback_vectors_05817:
        mov     al, 1
        mov     si, G_SONG_IGNORE_TEMPO
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_0581f:
        call    setup_callback_vectors
        ret
calls_seq_init_04_05823:
        call    seq_init_04E2E
jmp_ui_5743_05826:
        jmp     NEAR ui_stat_b_564f_743
ignore_tempo_change_refresh:
        mov     al, byte ptr [G_SONG_IGNORE_TEMPO]
jump_handler_0582C:
        BC_JUMP 01a74h
bc_target_05831:
        ret
ui_in_sequence_prompt_832:
        BC_UI_CTRL 41, 20, 32, 9
bc_int6c_05839:
        int     50h
bc_int6c_0583b:
        if      FW_VERSION = 172
        call    bc_int5d_04eaa
        else
        call    bc_int6b_04ea9+1
        endif
bc_int6c_0583e:
        INT_6C NULL_HANDLER_OFS, ui_input_76_b5f, ui_stat_b_564f_743, ui_wait_load_05856_93a
bc_int6a_05848:
        INT_5B calls_check_status_flag_596c_05871
bc_int6a_0584c:
        INT_5D close_handler_05072
bc_int6a_05850:
        INT_6A NULL_HANDLER_OFS, NULL_HANDLER_OFS
wait_load_05856:
handler_BC_WAIT_LOAD            equ     $+3
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
        cmp     byte ptr [G_TEMPO_SOURCE_SEQ], 0
bc_int6a_05861:
        je      bc_int6a_05864
        ret
bc_int6a_05864:
        if      FW_VERSION = 172
        INT_6A L_058AB, L_058CD
        else
        INT_6A calls_check_flag_1d86_058a6+5, L_058C9+4
        endif
calls_check_status_flag_596c_0586a:
        if      FW_VERSION = 172
        mov     word ptr [UI_SLOT_DIGIT], L_058F6
        else
        mov     word ptr [UI_SLOT_DIGIT], L_058F2+4
        endif
        ret
calls_check_status_flag_596c_05871:
        call    seq_edit_allowed
calls_ignore_tempo_change_event_stat_05874:
        je      calls_ignore_tempo_change_event_stat_05877
        ret
calls_ignore_tempo_change_event_stat_05877:
        call    ignore_tempo_change_event_status_057A8
bc_int5b_0587a:
        INT_67 calls_seq_init_04_05883
calls_seq_init_04_0587e:
        INT_5B calls_seq_init_04_05883
calls_seq_init_04_05882:
        ret
calls_seq_init_04_05883:
        call    seq_init_04E2E
        jmp     SHORT ui_in_sequence_prompt_832
L_05888:
        mov     byte ptr [B_1D83], 1
        cmp     byte ptr [B_0B28], 0
L_05892:
        jne     calls_check_flag_1d86_0589f
        nop
        push    cs
L_05896:
        call    calls_timer_handler_02363
        callf   CS1_SEG:seq_tempo_rate_update_far
        ret
calls_check_flag_1d86_0589f:
        cli
        mov     al, byte ptr [G_SONG_INDEX]
        call    song_select
calls_check_flag_1d86_058a6:
        call    check_flag_1d86
        sti
        ret
        if      FW_VERSION = 150
        db      80h, 3eh
        db      7ah
        db      1dh, 00h
        endif
L_058AB:
        if      FW_VERSION = 172
        cmp     byte ptr [SEQ_RUNNING], 0
L_058B0:
        endif
        je      L_058BA
        cmp     byte ptr [B_0B28], 0
        if      FW_VERSION = 150
L_058B0:
        endif
L_058B7:
        je      L_058BA
        ret
L_058BA:
        add     ax, word ptr [G_MASTER_TEMPO]
        cmp     ax, 0bb8h
        jb      L_058C6
        mov     ax, 0bb8h
L_058C6:
        mov     word ptr [G_MASTER_TEMPO], ax
L_058C9:
        call    L_05888
        ret
        if      FW_VERSION = 150
        db      80h, 3eh
        db      7ah
        db      1dh, 00h
        endif
L_058CD:
        if      FW_VERSION = 172
        cmp     byte ptr [SEQ_RUNNING], 0
L_058D2:
        endif
        je      L_058DC
        cmp     byte ptr [B_0B28], 0
        if      FW_VERSION = 150
L_058D2:
        endif
L_058D9:
        je      L_058DC
        ret
L_058DC:
        mov     bx, ax
        mov     ax, word ptr [G_MASTER_TEMPO]
        sub     ax, bx
L_058E3:
        jae     L_058E7
        sub     ax, ax
L_058E7:
        cmp     ax, 12ch
        jae     L_058EF
        mov     ax, 12ch
L_058EF:
        mov     word ptr [G_MASTER_TEMPO], ax
L_058F2:
        call    L_05888
        ret
        if      FW_VERSION = 150
        db      80h, 3eh
        db      7ah
        db      1dh, 00h
        endif
L_058F6:
        if      FW_VERSION = 172
        cmp     byte ptr [SEQ_RUNNING], 0
L_058FB:
        endif
        je      L_05905
        cmp     byte ptr [B_0B28], 0
        if      FW_VERSION = 150
L_058FB:
        endif
L_05902:
        je      L_05905
        ret
L_05905:
        int     70h
        sub     dl, byte ptr [di]
        db      0fh
        daa
        if      FW_VERSION = 172
        push    cs
        pop     cx
        else
        mov     dh, 57h
        endif
        ret
        db      3dh, 0ffh, 0ffh, 75h, 03h, 0e9h, 1ch, 0ffh, 3dh, 2ch, 01h, 77h, 0dh, 0bbh, 0ah, 00h
        db      0f7h, 0e3h, 3dh, 2ch, 01h, 73h, 03h, 0b8h, 2ch, 01h, 3dh, 0b8h, 0bh, 72h, 03h, 0b8h
        db      0b8h, 0bh, 0a3h, 23h, 0bh
jmp_ui_5832_05933:
        call    L_05888
        jmp     NEAR ui_in_sequence_prompt_832
ui_ctrl_05939:
        ret
ui_wait_load_05856_93a:
        BC_UI_CTRL 41, 35, 19, 9
bc_int6c_05941:
        int     50h
bc_int6c_05943:
        if      FW_VERSION = 172
        call    bc_int5d_04eaa
        else
        call    bc_int6b_04ea9+1
        endif
bc_int6c_05946:
        INT_6C NULL_HANDLER_OFS, ui_input_76_b5f, ui_in_sequence_prompt_832, NULL_HANDLER_OFS
calls_setup_callback_alt_05950:
        mov     al, 1
        mov     si, G_SONG_LOOP_ON
        mov     bx, L_05964
calls_setup_callback_alt_05958:
        call    setup_callback_alt
bc_int5d_0595b:
        INT_5B close_handler_05973
bc_int5d_0595f:
        INT_5D close_handler_05072
L_05963:
        ret
L_05964:
        mov     si, word ptr [PTR_CUR_SONG]
        mov     al, byte ptr [G_SONG_LOOP_ON]
        mov     byte ptr [si+SONG_LOOP_ON], al
calls_check_status_flag_596c_0596f:
        call    song_count_steps
        ret
close_handler_05973:
        call    seq_edit_allowed
first_step_status_05976:
        je      loop_dialog_05979
        ret
        if      FW_VERSION = 150
tempo_change_dialog_a:
        endif
loop_dialog_05979:
        DLG_LOOP_STEPS
bc_int5d_05a28:
        int     50h
bc_int5d_05a2a:
        INT_5D song_loop_refresh
bc_int5b_05a2e:
        INT_67 calls_seq_init_04_05b1c
bc_int5b_05a32:
        INT_5B calls_seq_init_04_05b1c
L_05A36:
        call    song_count_steps
L_05A39:
        call    calls_setup_callback_vectors_05a71
        ret
song_loop_refresh:
        if      FW_VERSION = 150
L_064E8                         equ     $+3
        endif
        mov     si, word ptr [PTR_CUR_SONG]
        mov     al, byte ptr [G_SONG_LOOP_FIRST]
        mov     byte ptr [si+SONG_LOOP_FIRST], al
        inc     al
        mov     ah, 0
disk_save_05A4C:
        BC_FIELD 156, 11
L_05A51:
        mov     al, byte ptr [G_SONG_LOOP_LAST]
        mov     byte ptr [si+SONG_LOOP_LAST], al
        push    ax
        inc     al
        mov     ah, 0
raw_05A5D:
        BC_FIELD 156, 33
L_05A62:
        pop     ax
        sub     al, byte ptr [G_SONG_LOOP_FIRST]
        inc     al
        mov     ah, 0
raw_05A6B:
        BC_FIELD 156, 42
L_05A70:
        ret
calls_setup_callback_vectors_05a71:
        mov     al, 0f9h
        mov     si, P_4C14
        mov     bx, L_05A8E
calls_setup_callback_vectors_05a79:
        call    setup_callback_vectors
ui_area_154_a7c:
        BC_UI_CTRL 154, 10, 21, 9
bc_int6c_05a83:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, calls_setup_callback_vectors_05aa4
L_05A8D:
        ret
L_05A8E:
        if      FW_VERSION = 172
        db      3ah, 06h, 0fh, 4ch, 76h, 03h, 0a0h, 0fh, 4ch, 3ah
        else
        db      3ah, 06h
        db      01h
        db      4ch, 76h, 03h, 0a0h
        db      01h
        db      4ch, 3ah
        endif
L_05A98:
        push    es
        if      FW_VERSION = 172
        adc     ax, 724ch
        add     sp, word ptr [bp+si+4c15h]
        else
        pop     es
        dec     sp
        jb      L_05A98+8
        mov     byte ptr [G_SONG_LOOP_LAST], al
        endif
        mov     byte ptr [G_SONG_LOOP_FIRST], al
        ret
calls_setup_callback_vectors_05aa4:
        mov     al, 0f9h
        mov     si, G_SONG_LOOP_LAST
        mov     bx, L_05AC1
calls_setup_callback_vectors_05aac:
        call    setup_callback_vectors
ui_area_154_aaf:
        BC_UI_CTRL 154, 32, 21, 9
bc_int6c_05ab6:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, calls_setup_callback_vectors_05a71, ui_ctrl_05ad7
bc_int6a_05ac0:
        ret
L_05AC1:
        if      FW_VERSION = 172
        db      3ah, 06h, 0fh, 4ch, 76h, 03h, 0a0h, 0fh, 4ch, 3ah, 06h, 14h, 4ch, 73h, 03h, 0a2h
        db      14h, 4ch, 0a2h, 15h, 4ch, 0c3h
        else
        db      3ah, 06h
        db      01h
        db      4ch, 76h, 03h, 0a0h
        db      01h
        db      4ch, 3ah, 06h
        db      06h
        db      4ch, 73h, 03h, 0a2h
        db      06h
        db      4ch, 0a2h
        db      07h
        db      4ch, 0c3h
        endif
ui_ctrl_05ad7:
        INT_6A song_loop_num_steps_inc, song_loop_num_steps_dec
ui_area_154_add:
        BC_UI_CTRL 154, 41, 21, 9
bc_int6c_05ae4:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, calls_setup_callback_vectors_05aa4, NULL_HANDLER_OFS
L_05AEE:
        ret
song_loop_num_steps_inc:
        add     al, byte ptr [G_SONG_LOOP_LAST]
        jae     song_loop_inc_no_carry
        mov     al, 0f9h
song_loop_inc_no_carry:
        cmp     al, byte ptr [B_4C0F]
        jb      song_loop_inc_store
        mov     al, byte ptr [B_4C0F]
song_loop_inc_store:
        mov     byte ptr [G_SONG_LOOP_LAST], al
        ret
song_loop_num_steps_dec:
        mov     ah, al
        mov     al, byte ptr [G_SONG_LOOP_LAST]
        sub     al, ah
        jae     L_05B0F
        mov     al, 0
L_05B0F:
        cmp     al, byte ptr [G_SONG_LOOP_FIRST]
        jae     calls_seq_init_04_05b18
        mov     al, byte ptr [G_SONG_LOOP_FIRST]
calls_seq_init_04_05b18:
        mov     byte ptr [G_SONG_LOOP_LAST], al
        ret
calls_seq_init_04_05b1c:
        call    seq_init_04E2E
jmp_ui_593a_05b1f:
        jmp     NEAR ui_wait_load_05856_93a
song_count_steps:
        mov     si, word ptr [PTR_CUR_SONG]
        mov     di, si
        add     si, 0eh
        mov     cl, 0ffh

loop_05B2D:
        inc     cl
        add     si, 2
        cmp     byte ptr [si], 0ffh
        jne     loop_05B2D
        sub     cl, 1
        jae     br_05B3E
        mov     cl, 0
br_05B3E:
        mov     byte ptr [B_4C0F], cl
        cmp     cl, byte ptr [di+SONG_LOOP_FIRST]
        ja      br_05B50
        mov     byte ptr [di+SONG_LOOP_FIRST], cl
        mov     byte ptr [G_SONG_LOOP_FIRST], cl
br_05B50:
        cmp     cl, byte ptr [di+SONG_LOOP_LAST]
        ja      ui_ctrl_05b5e
        mov     byte ptr [di+SONG_LOOP_LAST], cl
        mov     byte ptr [G_SONG_LOOP_LAST], cl
ui_ctrl_05b5e:
        ret
ui_input_76_b5f:
        BC_UI_CTRL 76, 30, 27, 9
bc_int6a_05b66:
        int     50h
bc_int6c_05b68:
        call    bc_int6b_04ecd
bc_int6c_05b6b:
        INT_6A calls_check_status_flag_596c_05be1, calls_check_status_flag_596c_05b9e
bc_int6c_05b71:
        INT_6C ui_in_sequence_prompt_832, ui_get_table_entry_c87, calls_check_status_flag_596c_05b84, calls_check_status_flag_596c_05bb9
bc_int5d_05b7b:
        INT_5B NULL_HANDLER_OFS
calls_check_status_flag_596c_05b7f:
        INT_5D close_handler_05072
calls_check_status_flag_596c_05b83:
        ret
calls_check_status_flag_596c_05b84:
        call    seq_edit_allowed
L_05B87:
        je      L_05B8A
        ret
L_05B8A:
        mov     byte ptr [G_SONG_STEP_REPEAT], 0
        cmp     byte ptr [G_SONG_STEP], 0
L_05B94:
        jne     calls_list_handler_05b97
        ret
calls_list_handler_05b97:
        call    calls_get_table_entry_b20_05bb1
calls_list_handler_05b9a:
        call    list_handler
        ret
calls_check_status_flag_596c_05b9e:
        call    seq_edit_allowed
L_05BA1:
        je      br_05BA4
        ret
br_05BA4:
        mov     byte ptr [G_SONG_STEP_REPEAT], 0
        cmp     byte ptr [G_SONG_STEP], 0
        jne     calls_get_table_entry_b20_05bb1
        ret
calls_get_table_entry_b20_05bb1:
        dec     byte ptr [G_SONG_STEP]
calls_get_table_entry_b20_05bb5:
        call    get_table_entry_b20
        ret
calls_check_status_flag_596c_05bb9:
        call    seq_edit_allowed
L_05BBC:
        je      L_05BBF
        ret
L_05BBF:
        mov     byte ptr [G_SONG_STEP_REPEAT], 0
        mov     si, word ptr [PTR_CUR_SONG]
        cmp     word ptr [si+10h], 0ffh
calls_get_table_entry_05bcd:
        jne     calls_get_table_entry_05bd0
        ret
calls_get_table_entry_05bd0:
        call    get_table_entry
        jne     calls_list_handler_05bd6
        ret
calls_list_handler_05bd6:
        inc     byte ptr [G_SONG_STEP]
        call    calls_get_table_entry_b20_05bb5
calls_list_handler_05bdd:
        call    list_handler
        ret
calls_check_status_flag_596c_05be1:
        call    seq_edit_allowed
L_05BE4:
        je      L_05BE7
        ret
L_05BE7:
        mov     byte ptr [G_SONG_STEP_REPEAT], 0
        mov     si, word ptr [PTR_CUR_SONG]
L_05BF0:
        cmp     word ptr [si+10h], 0ffh
calls_get_table_entry_05bf5:
        jne     calls_get_table_entry_05bf8
        ret
calls_get_table_entry_05bf8:
        call    get_table_entry
        jne     calls_get_table_entry_05bfe
        ret
calls_get_table_entry_05bfe:
        inc     byte ptr [G_SONG_STEP]
        jmp     SHORT calls_get_table_entry_b20_05bb5
calls_get_table_entry_05c04:
        call    get_table_entry
L_05C07:
        jne     calls_process_input_05c0a
        ret
calls_process_input_05c0a:
        pusha
calls_process_input_05c0b:
        call    process_input
        popa
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[TBL_0013], 0
L_05C19:
        jne     br_05C1C
        ret
br_05C1C:
        mov     dx, word ptr es:[18h]
        mov     cl, ah
        mov     ch, 0
        sub     ax, ax
        jcxz    br_05C2D
tgt_05C29:
        add     ax, dx
        loop    tgt_05C29
br_05C2D:
        add     bx, 2
        shl     bx, 1
        mov     word ptr [bx+TBL_4C2A], dx
        mov     word ptr [bx+TBL_4C2C], ax
        mov     cl, byte ptr [si+1]
        mov     ch, 0
        sub     ax, ax
        sub     dx, dx
        jcxz    br_05C51

tgt_05C45:
        add     ax, word ptr es:[2ah]
        adc     dx, word ptr es:[TBL_002C]
        loop    tgt_05C45
br_05C51:
        shl     bx, 2
        mov     word ptr [bx+P_502A], ax
        mov     word ptr [bx+P_502C], dx
        mov     ax, word ptr [SEQ_ELAPSED_MS_LO]
        mov     dx, word ptr [SEQ_ELAPSED_MS_HI]
        mov     word ptr [bx+P_502E], ax
        mov     word ptr [bx+P_5030], dx
        callf   CS1_SEG:P_71B5
        ret

get_table_entry:
        mov     si, word ptr [PTR_CUR_SONG]
        add     si, 10h
        mov     bl, byte ptr [G_SONG_STEP]
        sub     bh, bh
        shl     bx, 1
        add     si, bx
        mov     ax, word ptr [si]
        cmp     al, 0ffh
        ret
ui_get_table_entry_c87:
        BC_UI_CTRL 104, 30, 115, 9
bc_int6a_05c8e:
        int     50h
bc_int6c_05c90:
        call    bc_int6b_04ecd
bc_int6c_05c93:
        INT_6A calls_check_status_flag_596c_05ce0, calls_check_status_flag_596c_05cfd
bc_int6c_05c99:
        INT_6C calls_check_flag_1d86_05cc6, calls_check_flag_1d86_05cd3, calls_check_flag_1d86_05cac, calls_check_flag_1d86_05cb9
bc_int5d_05ca3:
        INT_5B NULL_HANDLER_OFS
bc_int5d_05ca7:
        INT_5D close_handler_05072
L_05CAB:
        ret
calls_check_flag_1d86_05cac:
        cmp     byte ptr [G_SONG_EDITED], 0
        je      L_05CB6
calls_check_flag_1d86_05cb3:
        call    check_flag_1d86
L_05CB6:
        jmp     NEAR calls_check_status_flag_596c_05b84
calls_check_flag_1d86_05cb9:
        cmp     byte ptr [G_SONG_EDITED], 0
        je      L_05CC3
calls_check_flag_1d86_05cc0:
        call    check_flag_1d86
L_05CC3:
        jmp     NEAR calls_check_status_flag_596c_05bb9
calls_check_flag_1d86_05cc6:
        cmp     byte ptr [G_SONG_EDITED], 0
calls_check_flag_1d86_05ccb:
        je      jmp_ui_5b5f_05cd0
calls_check_flag_1d86_05ccd:
        call    check_flag_1d86
jmp_ui_5b5f_05cd0:
        jmp     NEAR ui_input_76_b5f
calls_check_flag_1d86_05cd3:
        cmp     byte ptr [G_SONG_EDITED], 0
calls_check_flag_1d86_05cd8:
        je      calls_check_status_flag_596c_05cdd
calls_check_flag_1d86_05cda:
        call    check_flag_1d86
calls_check_status_flag_596c_05cdd:
        jmp     NEAR ui_get_table_entry_b20_d9a
calls_check_status_flag_596c_05ce0:
        call    seq_edit_allowed
calls_get_table_entry_05ce3:
        je      calls_get_table_entry_05ce6
        ret
calls_get_table_entry_05ce6:
        call    get_table_entry
L_05CE9:
        je      calls_check_status_flag_596c_05d3f
        cmp     al, 62h
        jne     calls_get_table_entry_b20_05cf0
        ret
calls_get_table_entry_b20_05cf0:
        inc     al
        mov     byte ptr [si], al
calls_get_table_entry_b20_05cf4:
        call    get_table_entry_b20
        mov     byte ptr [G_SONG_EDITED], 1
        ret
calls_check_status_flag_596c_05cfd:
        call    seq_edit_allowed
calls_get_table_entry_05d00:
        je      calls_get_table_entry_05d03
        ret
calls_get_table_entry_05d03:
        call    get_table_entry
L_05D06:
        je      calls_check_status_flag_596c_05d3f
        cmp     al, 0
        jne     calls_get_table_entry_b20_05d0d
        ret
calls_get_table_entry_b20_05d0d:
        dec     al
        mov     byte ptr [si], al
calls_get_table_entry_b20_05d11:
        call    get_table_entry_b20
        mov     byte ptr [G_SONG_EDITED], 1
        ret
calls_check_status_flag_596c_05d1a:
        call    seq_edit_allowed
calls_get_table_entry_05d1d:
        je      calls_get_table_entry_05d20
        ret
calls_get_table_entry_05d20:
        call    get_table_entry
CALLS_GET_TABLE_ENTRY_05D1D_V150:
L_05D23:
        jne     L_05D26
L_05BCD:
        ret
L_05D26:
        mov     ax, ds
        mov     es, ax
        mov     di, si
        add     si, 2
L_05D2F:
        lodsw
        stosw
        cmp     al, 0ffh
        jne     L_05D2F
calls_check_flag_1d86_05d35:
        call    check_flag_1d86
calls_get_table_entry_b20_05d38:
        call    get_table_entry_b20
calls_check_status_flag_596c_05d3b:
        call    song_count_steps
        ret
calls_check_status_flag_596c_05d3f:
        call    seq_edit_allowed
calls_check_status_flag_596c_05d3f_V150:
L_05D42:
        je      calls_get_table_entry_05d45
        ret
calls_get_table_entry_05d45:
        call    L_053DE
calls_get_table_entry_05d48:
        call    get_table_entry
        mov     bx, si
        mov     si, word ptr [PTR_CUR_SONG]
        mov     byte ptr [si+SONG_USED], 1
        add     si, 202h
        mov     ax, word ptr [si]
        cmp     al, 0ffh
L_05D5E:
        je      L_05D61
        ret
L_05D61:
        mov     di, si
        cmp     bx, si
        je      calls_check_flag_1d86_05d7c
        sub     si, 2
        mov     ax, ds
        mov     es, ax
L_05D6E:
        mov     ax, word ptr [si]
        mov     word ptr [di], ax
        sub     si, 2
        sub     di, 2
        cmp     bx, di
        jne     L_05D6E
calls_check_flag_1d86_05d7c:
        mov     word ptr [di], 100h
calls_check_flag_1d86_05d80:
        call    check_flag_1d86
calls_get_table_entry_b20_05d83:
        call    get_table_entry_b20
        ret
get_table_entry_b20:
        call    get_table_entry
        jne     calls_process_input_05d8e
        mov     al, 0
calls_process_input_05d8e:
        mov     byte ptr [SEL_SEQ], al
calls_process_input_05d91:
        call    process_input
        callf   CS1_SEG:P_7241
        ret
ui_get_table_entry_b20_d9a:
        BC_UI_CTRL 227, 30, 13, 9
bc_int6a_05da1:
        int     50h
bc_int6c_05da3:
        call    bc_int6b_04ecd
bc_int6c_05da6:
        INT_6A calls_check_status_flag_596c_05dbf, calls_check_status_flag_596c_05ddf
bc_int6c_05dac:
        INT_6C calls_check_flag_1d86_05dff, calls_check_flag_1d86_05e0f, calls_check_flag_1d86_05e1f, calls_check_flag_1d86_05e25
bc_int5d_05db6:
        INT_5B NULL_HANDLER_OFS
calls_check_status_flag_596c_05dba:
        INT_5D close_handler_05072
calls_check_status_flag_596c_05dbe:
        ret
calls_check_status_flag_596c_05dbf:
        call    seq_edit_allowed
L_05DC2:
        je      calls_get_table_entry_05dc5
        ret
calls_get_table_entry_05dc5:
        mov     byte ptr [G_SONG_STEP_REPEAT], 0
calls_get_table_entry_05dca:
        call    get_table_entry
L_05DCD:
        jne     br_05DD0
        ret
br_05DD0:
        cmp     ah, 63h
        jne     L_05DD6
        ret
L_05DD6:
        inc     ah
        mov     byte ptr [si+1], ah
calls_check_status_flag_596c_05ddb:
        call    calls_get_table_entry_05c04
        ret
calls_check_status_flag_596c_05ddf:
        call    seq_edit_allowed
L_05DE2:
        je      calls_get_table_entry_05de5
        ret
calls_get_table_entry_05de5:
        mov     byte ptr [G_SONG_STEP_REPEAT], 0
calls_get_table_entry_05dea:
        call    get_table_entry
L_05DED:
        jne     br_05DF0
        ret
br_05DF0:
        cmp     ah, 0
        jne     L_05DF6
        ret
L_05DF6:
        dec     ah
        mov     byte ptr [si+1], ah
calls_check_flag_1d86_05dfb:
        call    calls_get_table_entry_05c04
        ret
calls_check_flag_1d86_05dff:
        call    check_flag_1d86
        cmp     byte ptr [SEQ_RUNNING], 0
calls_get_table_entry_b20_05e07:
        jne     calls_check_flag_1d86_05e0c
calls_get_table_entry_b20_05e09:
        call    get_table_entry_b20
calls_check_flag_1d86_05e0c:
        jmp     NEAR ui_get_table_entry_c87
calls_check_flag_1d86_05e0f:
        call    check_flag_1d86
        cmp     byte ptr [SEQ_RUNNING], 0
        jne     calls_check_flag_1d86_05e1c
calls_get_table_entry_b20_05e19:
        call    get_table_entry_b20
calls_check_flag_1d86_05e1c:
        jmp     NEAR ui_ctrl_05686
calls_check_flag_1d86_05e1f:
        call    check_flag_1d86
        jmp     NEAR calls_check_status_flag_596c_05b84
calls_check_flag_1d86_05e25:
        call    check_flag_1d86
        jmp     NEAR calls_check_status_flag_596c_05bb9
song_screen_play_start:
        sub     ax, ax
        mov     byte ptr [G_SONG_STEP], al
        mov     word ptr [W_4C18], ax
        mov     word ptr [G_SONG_STEP_START_LO], ax
        mov     word ptr [G_SONG_STEP_START_HI], ax
calls_get_table_entry_05e39:
        call    get_table_entry
L_05E3C:
        jne     L_05E3F
        ret
L_05E3F:
        cmp     ah, 0
L_05E42:
        jne     L_05E45
        ret
L_05E45:
        push    ax
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        cmp     byte ptr es:[TBL_0013], 0
        pop     ax
L_05E52:
        jne     calls_process_input_05e55
        ret
calls_process_input_05e55:
        mov     byte ptr [SEL_SEQ], al
calls_process_input_05e58:
        call    process_input
        mov     byte ptr [G_SONG_STEP_REPEAT], 0
calls_close_handler_05072_05e60:
        call    close_handler_05072
        callf   CS1_SEG:P_7221
loop_05E68:
        cmp     byte ptr [SEQ_RUNNING], 0
        jne     L_05E72
        jmp     NEAR song_screen_install_transport_handlers
        if      FW_VERSION = 150
L_0691A:
        endif
L_05E72:
        INT_6E NULL_HANDLER_OFS, NULL_HANDLER_OFS, mode_05F30, NULL_HANDLER_OFS, NULL_HANDLER_OFS
L_05E7E:
        INT_6D NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS
calls_handler__05e8a:
        mov     ax, 0c8h
code_copy_exec_05E8D:
        if      FW_VERSION = 172
        call    handler_BC_CODE_COPY_EXEC
        salc
        pop     si
        or      word ptr [bx-39h], bx
        push    es
        dec     sp
        push    cs
        out     63h, ax
        else
        db      0e8h, 4fh
        db      0a2h
        jle     close_handler_05EE8
        mov     cl, 5dh
        mov     word ptr [UI_SLOT_EXIT], calls_mode_05_063e7
        endif
        ret
calls_get_table_entry_05e9b:
        call    calls_get_table_entry_05e9f
        retf
calls_get_table_entry_05e9f:
        call    get_table_entry
L_05EA2:
        db      74h, 1bh
        cmp     ah, 0
L_05EA7:
        jne     L_05EAA
        ret
L_05EAA:
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        cmp     byte ptr es:[TBL_0013], 0
L_05EB5:
        jne     br_05EB8
        ret
br_05EB8:
        callf   CS1_SEG:sequencer_start_keep_position_far
        jmp     SHORT loop_05E68
        if      FW_VERSION = 172
        db      80h, 3eh, 0eh, 4ch, 00h, 75h, 01h, 0c3h
        else
L_06967:
        db      80h, 3eh, 0h, 4ch, 00h, 75h, 01h, 0c3h
L_0696F:
        endif
L_05EC7:
        cmp     byte ptr [G_SYNC_IN_MODE], 2
L_05ECC:
        jae     L_05ECF
        ret
L_06977:
L_05ECF:
        callf   CS1_SEG:sequencer_start_keep_position_far
        jmp     SHORT loop_05E68
close_handler_05ED6:
        BC_PLANE_A
L_05ED9:
        call    L_05F1E
        mov     bl, byte ptr [G_SONG_STEP]
        mov     al, 8
seq_edit_05EE2:
        BC_SEQ_EDIT
        if      FW_VERSION = 172
calls_get_table_entry_05ee5:
        endif
        call    song_step_row_display
        if      FW_VERSION = 172
close_handler_05EE8:
        endif
        BC_PLANE_A
        if      FW_VERSION = 150
calls_get_table_entry_05ee5:
        endif
calls_get_table_entry_05eeb:
        call    get_table_entry
        if      FW_VERSION = 150
close_handler_05EE8             equ     $+1
        endif
        cmp     al, 0ffh
        jne     status_05EF3
        ret
status_05EF3:
        sub     ah, byte ptr [G_SONG_STEP_REPEAT]
        mov     al, ah
status_display_069A1:
status_display_5EF9:
        BC_STATUS 228, 31, "  "
        db      2ah, 0e4h
jump__05F03:
        BC_JUMP_3C 01fe4h
bc_target_05f08:
        ret
close_handler_05F09:
        BC_PLANE_A
clear_rect_05F0C:
        BC_CLEAR_RECT 104, 31, 114, 7
clear_rect_05F13:
        BC_CLEAR_RECT 228, 31, 12, 7
L_05F1A:
        call    L_05F1E
        ret
L_05F1E:
        sub     ax, ax
        xchg    byte ptr [B_4C12], al
        cmp     al, 0
jmp_close_handler_05072_05f26:
        jne     calls_mode_05_05f29
        ret
calls_mode_05_05f29:
        jmp     close_handler_05072
calls_mode_05_05f2c:
        call    mode_05F30
        retf
mode_05F30:
        BC_MODE
        db      80h
L_05F34:
        db      3eh, 0c6h
        or      ax, word ptr [bx+si]
L_05F38:
        je      L_05F58
        mov     al, 0
        xchg    byte ptr [P_1D95], al
        cmp     al, 0
L_05F42:
        jne     L_05F58
        callf   CS1_SEG:P_62EF
        cmp     byte ptr [G_SYNC_IN_MODE], 1
L_05F4E:
        jne     L_05F58
        cmp     byte ptr [B_1D84], 0
L_05F55:
        je      L_05F58
        ret
L_05F58:
        callf   CS1_SEG:P_7215
        call    L_009F4
L_05F60:
        call    song_screen_install_transport_handlers
        push    word ptr [SEQ_CUR_BAR]
        push    word ptr [SEQ_BAR_TICK]
        mov     ax, word ptr [SEQ_EVENTS_SEG]
        mov     word ptr [SEQ_READ_PTR_SEG], ax
        mov     word ptr [FP_SEQ_READ_PTR], 0
        callf   CS1_SEG:P_7241
        pop     cx
        pop     ax
        callf   CS1_SEG:P_9343
        ret
L_06A2C:
song_screen_install_transport_handlers:
        INT_6D calls_check_status_flag_596c_060f8, calls_check_status_flag_596c_060c3, NULL_HANDLER_OFS, calls_check_status_flag_596c_0601f, calls_check_status_flag_596c_05fa3
L_05F90:
        INT_6E NULL_HANDLER_OFS, NULL_HANDLER_OFS, mode_05F30, calls_get_table_entry_05e9f, song_screen_play_start
calls_check_status_flag_596c_05f9c:
        mov     word ptr [UI_SLOT_EXIT], NULL_HANDLER_OFS
        ret
calls_check_status_flag_596c_05fa3:
        call    seq_edit_allowed
        je      calls_get_table_entry_05fa9
        ret
calls_get_table_entry_05fa9:
        call    get_table_entry
L_05FAC:
        jne     L_05FAF
        ret
L_05FAF:
        mov     byte ptr [G_POS_REDRAW_REQ], 1
        cmp     byte ptr [B_0B15], 0
L_05FB9:
        jne     calls_get_table_entry_06003
        mov     ax, word ptr [SEQ_CUR_BAR]
        sub     cx, cx
        inc     ax
L_05FC1:
        mov     es, word ptr [CUR_SEQ_SEG]
        if      FW_VERSION = 172
        cmp     byte ptr es:[TBL_0013], 0
        je      calls_get_table_entry_b20_05fdf
        endif
        cmp     ax, word ptr es:[18h]
calls_get_table_entry_05fd2:
        jne     calls_list_handler_0600f
calls_get_table_entry_05fd4:
        call    get_table_entry
        inc     byte ptr [G_SONG_STEP_REPEAT]
        cmp     ah, byte ptr [G_SONG_STEP_REPEAT]
calls_get_table_entry_b20_05fdf:
        jne     calls_get_table_entry_b20_05fe4
calls_get_table_entry_b20_05fe1:
        call    calls_check_status_flag_596c_05be1
calls_get_table_entry_b20_05fe4:
        call    get_table_entry_b20
        if      FW_VERSION = 172
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[TBL_0013], 0
L_05FF1:
        je      calls_check_status_flag_596c_05fa3
        endif
        mov     ax, word ptr [SEQ_CUR_BAR]
        mov     cx, word ptr [SEQ_BAR_TICK]
        callf   CS1_SEG:P_9343
calls_list_handler_05fff:
        call    list_handler
        ret
calls_get_table_entry_06003:
        call    calls_check_status_flag_596c_05be1
calls_get_table_entry_06006:
        call    get_table_entry
calls_list_handler_06009:
        jne     calls_get_table_entry_06003
calls_list_handler_0600b:
        call    list_handler
        ret
calls_list_handler_0600f:
        mov     word ptr [SEQ_CUR_BAR], ax
        mov     word ptr [SEQ_BAR_TICK], cx
        callf   CS1_SEG:P_9343
        call    list_handler
        ret
calls_check_status_flag_596c_0601f:
        call    seq_edit_allowed
L_06022:
        je      L_06025
        ret
L_06025:
        mov     byte ptr [G_POS_REDRAW_REQ], 1
        cmp     byte ptr [B_0B15], 0
L_0602F:
        jne     L_060AE
        mov     ax, word ptr [SEQ_CUR_BAR]
        sub     cx, cx
        cmp     word ptr [SEQ_BAR_TICK], cx
L_0603A:
        jne     calls_list_handler_0600f
        sub     ax, 1
L_0603F:
        jae     calls_list_handler_0600f
        cmp     byte ptr [G_SONG_STEP_REPEAT], 0
L_06046:
        je      L_0605F
        dec     byte ptr [G_SONG_STEP_REPEAT]
L_0604C:
        mov     es, word ptr [CUR_SEQ_SEG]
        if      FW_VERSION = 172
        cmp     byte ptr es:[TBL_0013], 0
L_06056:
        je      L_0605F
        endif
        mov     ax, word ptr es:[18h]
        dec     ax
        jmp     calls_list_handler_0600f
L_0605F:
        cmp     byte ptr [G_SONG_STEP], 0
L_06064:
        jne     calls_get_table_entry_06067
        ret
calls_get_table_entry_06067:
        call    calls_check_status_flag_596c_05b9e
calls_get_table_entry_0606a:
        call    get_table_entry
        dec     ah
        mov     byte ptr [G_SONG_STEP_REPEAT], ah
        jmp     L_0604C
L_06075:
        mov     ax, word ptr [SEQ_CUR_BAR]
        or      ax, word ptr [SEQ_BAR_TICK]
        jne     calls_list_handler_06089
        cmp     byte ptr [G_SONG_STEP_REPEAT], 0
calls_list_handler_06083:
        je      calls_get_table_entry_06092
        dec     byte ptr [G_SONG_STEP_REPEAT]
calls_list_handler_06089:
        callf   CS1_SEG:P_71B5
        call    list_handler
        ret
calls_get_table_entry_06092:
        call    calls_check_status_flag_596c_05b9e
calls_get_table_entry_06095:
        call    get_table_entry
        dec     ah
        mov     byte ptr [G_SONG_STEP_REPEAT], ah
        mov     ax, word ptr [SEQ_CUR_BAR]
        mov     cx, word ptr [SEQ_BAR_TICK]
        callf   CS1_SEG:P_9343
        call    list_handler
        ret
L_060AE:
        sub     ax, ax
        mov     byte ptr [G_SONG_STEP], al
        mov     word ptr [W_4C18], ax
        mov     word ptr [G_SONG_STEP_START_LO], ax
        mov     word ptr [G_SONG_STEP_START_HI], ax
calls_get_table_entry_b20_060bc:
        call    get_table_entry_b20
calls_list_handler_060bf:
        call    list_handler
        ret
calls_check_status_flag_596c_060c3:
        call    seq_edit_allowed
calls_get_table_entry_060c6:
        je      calls_get_table_entry_060c9
        ret
calls_get_table_entry_060c9:
        call    get_table_entry
L_060CC:
        jne     br_060CF
        ret
br_060CF:
        callf   CS1_SEG:P_7255
        mov     bx, ax
        add     ax, word ptr [SEQ_BAR_TICK]
        sub     dx, dx
        div     bx
        mul     bx
        mov     cx, ax
        mov     ax, word ptr [SEQ_CUR_BAR]
        cmp     cx, word ptr [SEQ_BAR_LEN_TICKS]
        jb      calls_check_status_flag_596c_060ee
        sub     cx, cx
        inc     ax
calls_check_status_flag_596c_060ee:
        mov     word ptr [SEQ_BAR_TICK], cx
        mov     word ptr [SEQ_CUR_BAR], ax
        jmp     L_05FC1
calls_check_status_flag_596c_060f8:
        call    seq_edit_allowed
L_060FB:
        je      L_060FE
        ret
L_060FE:
        callf   CS1_SEG:P_7255
        mov     bx, ax
        mov     ax, word ptr [SEQ_BAR_TICK]
        sub     ax, bx
L_0610A:
        jae     br_0612A
        mov     ax, word ptr [SEQ_CUR_BAR]
        or      ax, ax
        jne     br_06115
        jmp     SHORT L_06138
br_06115:
        dec     ax
        sub     cx, cx
        push    ax
        push    bx
        callf   CS1_SEG:P_9343
        pop     bx
        pop     ax
        mov     cx, word ptr [SEQ_BAR_LEN_TICKS]
        sub     cx, bx
L_06127:
        jmp     calls_list_handler_0600f
br_0612A:
        sub     dx, dx
        div     bx
        mul     bx
        mov     cx, ax
        mov     ax, word ptr [SEQ_CUR_BAR]
        jmp     calls_list_handler_0600f
L_06138:
        cmp     byte ptr [G_SONG_STEP], 0
L_0613D:
        je      L_0615F
        push    bx
L_06140:
        call    calls_check_status_flag_596c_0601f
        pop     bx
        if      FW_VERSION = 172
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[TBL_0013], 0
L_0614E:
        je      L_0615F
        endif
        mov     cx, word ptr [SEQ_BAR_LEN_TICKS]
        sub     cx, bx
L_06156:
        jae     br_06159
        ret
br_06159:
        mov     ax, word ptr [SEQ_CUR_BAR]
        jmp     calls_list_handler_0600f
L_0615F:
        sub     ax, ax
        sub     cx, cx
        jmp     calls_list_handler_0600f
L_06166:
        ret
L_06167:
        callf   CS1_SEG:REC_NOTE_IS_UNSET_FAR_OFS
        jae     L_0616F
        ret
L_0616F:
        mov     word ptr [W_0EE4], P_6176
        ret
        if      FW_VERSION = 172
L_06176:
        endif
        callf   CS1_SEG:LOCATE_DIALOG_FAR_OFS
bc_int67_68_0617b:
        int     50h
bc_int67_68_0617d:
        mov     word ptr [UI_SLOT_DIGIT], p_61a8
bc_int5b_06183:
        INT_67 ui_get_table_entry_c87
bc_int5b_06187:
        INT_68 calls_pressing_1_9_keys_will_status_061c2
bc_int5b_0618b:
        INT_5B ui_get_table_entry_c87
L_0618F:
        INT_6E ui_get_table_entry_c87, ui_get_table_entry_c87, ui_get_table_entry_c87, ui_get_table_entry_c87, ui_get_table_entry_c87
L_0619B:
        INT_6D ui_get_table_entry_c87, ui_get_table_entry_c87, ui_get_table_entry_c87, ui_get_table_entry_c87, ui_get_table_entry_c87
L_061A7:
        ret
p_61a8:
        if      FW_VERSION = 150
L_06C2D                         equ     $+5
        endif
        db      2ch, 01h, 73h, 01h, 0c3h, 2ah, 0e4h, 0c1h, 0e0h, 02h, 05h, 0dfh, 0bh, 8bh, 0f0h, 0adh
        if      FW_VERSION = 172
        db      8bh, 0ch, 9ah
        dw      seq_set_position_far
calls_pressing_1_9_keys_will_status_061bd:
        dw      CS1_SEG
        db      0e9h, 0c5h
        cli
        else
        mov     cx, word ptr [si]
        callf   CS1_SEG:seq_set_position_far
        jmp     ui_get_table_entry_c87
        endif
calls_pressing_1_9_keys_will_status_061c2:
        call    pressing_1_9_keys_will_status
bc_int67_68_061c5:
        int     50h
bc_int5b_061c7:
        INT_68 ui_get_table_entry_c87
bc_int5b_061cb:
        mov     word ptr [UI_SLOT_DIGIT], p_61ee
bc_int5b_061d1:
        INT_5B ui_get_table_entry_c87
L_061D5:
        INT_6E ui_get_table_entry_c87, ui_get_table_entry_c87, ui_get_table_entry_c87, ui_get_table_entry_c87, ui_get_table_entry_c87
L_061E1:
        INT_6D ui_get_table_entry_c87, ui_get_table_entry_c87, ui_get_table_entry_c87, ui_get_table_entry_c87, ui_get_table_entry_c87
L_061ED:
        ret
p_61ee:
        if      FW_VERSION = 150
L_06C73                         equ     $+5
        endif
        db      2ch, 01h, 73h, 01h, 0c3h, 2ah, 0e4h, 0c1h, 0e0h, 02h, 05h, 0dfh, 0bh, 8bh, 0f0h, 0a1h
        if      FW_VERSION = 172
        db      18h, 4ch, 89h, 04h, 0a1h, 1ah, 4ch, 89h, 44h, 02h, 0e9h, 7ch, 0fah
        else
        db      0ah, 4ch, 89h, 04h, 0a1h, 0ch, 4ch, 89h, 44h, 02h, 0e9h, 0a4h, 0fah
        endif
L_0620B:
        call    fn_0620F
        retf

fn_0620F:
        mov     byte ptr [UI_REDRAW_REQ], 1
        mov     bx, 18h
        mul     bx
        mov     word ptr [W_582A], ax
        mov     word ptr [W_582C], dx
        sub     ax, ax
        mov     byte ptr [G_SONG_STEP], al
        mov     word ptr [W_4C18], ax
        mov     word ptr [G_SONG_STEP_START_LO], ax
        mov     word ptr [G_SONG_STEP_START_HI], ax
L_06CAE:
calls_get_table_entry_0622e:
        call    get_table_entry
L_06231:
        jne     L_06234
        ret
L_06234:
        cmp     ah, 0
L_06237:
        jne     L_0623A
        ret
L_0623A:
        push    ax
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        cmp     byte ptr es:[TBL_0013], 0
        pop     ax
L_06247:
        jne     calls_process_input_0624a
        ret
calls_process_input_0624a:
        mov     word ptr [CUR_SEQ_SEG], es
        mov     byte ptr [SEL_SEQ], al
        push    ax
calls_process_input_06252:
        call    process_input
        mov     byte ptr [G_SONG_STEP_REPEAT], 0
        pop     cx
        mov     ax, word ptr [W_582A]
        mov     dx, word ptr [W_582C]
        mov     es, word ptr [CUR_SEQ_SEG]
L_06266:
        sub     ax, word ptr es:[26h]
        sbb     dx, word ptr es:[28h]
L_06270:
        jb      br_06287
        inc     byte ptr [G_SONG_STEP_REPEAT]
        dec     ch
        jne     L_06266
        mov     word ptr [W_582A], ax
        mov     word ptr [W_582C], dx
        inc     byte ptr [G_SONG_STEP]
        jmp     SHORT calls_get_table_entry_0622e
br_06287:
        add     ax, word ptr es:[26h]
        adc     dx, word ptr es:[28h]
        mov     cx, ax
        mov     ax, es
        add     ax, 53h
        mov     es, ax
        sub     si, si

loop_0629C:
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
        je      L_062EB
        cmp     al, 0c0h
        jne     br_062CB
        mov     bx, word ptr es:[si+3]
        cmp     bh, 4
        jae     br_062B2
        mov     bh, 4
br_062B2:
        cmp     bl, 0
        jne     cond_exec_062B9
        mov     bl, 4
L_06D39:
cond_exec_062B9:
        if      FW_VERSION = 172
handler_BC_COND_EXEC            equ     $+1
        endif
        mov     ax, 180h
        div     bh
        mul     bl
        sub     cx, ax
        sbb     dx, 0
L_062C5:
        jb      br_062D6
        inc     word ptr [SEQ_CUR_BAR]
br_062CB:
        push    dx
        push    cx
        callf   CS1_SEG:SEQUENCE_DATA_READ_FAR_OFS
        pop     cx
        pop     dx
        jmp     SHORT loop_0629C
br_062D6:
        pusha
        callf   CS1_SEG:P_7241
        popa
        add     cx, ax
        mov     word ptr [SEQ_BAR_TICK], cx
        mov     ax, word ptr [SEQ_CUR_BAR]
        callf   CS1_SEG:P_9343
L_062EB:
        ret
list_handler:
        cmp     byte ptr [G_SYNC_OUT_MODE], 1
L_062F1:
        jne     L_0633D
        mov     cl, byte ptr [G_SONG_STEP]
        mov     ch, 0
        shl     cx, 1
        mov     di, word ptr [PTR_CUR_SONG]
        add     di, 10h
        mov     si, P_9DD0
        sub     ax, ax
        sub     dx, dx
        mov     bx, 0fffeh
loop_0630C:
        add     bx, 2
        add     si, 8
        add     ax, word ptr [si+4]
        adc     dx, word ptr [si+6]
        cmp     word ptr [bx+di], -1
        je      br_06329
        cmp     bx, cx
        jne     loop_0630C
        mov     cl, byte ptr [G_SONG_STEP_REPEAT]
        mov     ch, 0
        jcxz    br_06330
br_06329:
        add     ax, word ptr [si]
        adc     dx, word ptr [si+2]
        loop    br_06329
br_06330:
        mov     word ptr [W_582E], ax
        mov     word ptr [W_5830], dx
        callf   CS1_SEG:P_60B0
        ret
L_0633D:
        call    fn_05285
        callf   CS1_SEG:SEQ_POS_RECALC_BAR_BEAT_FAR_OFS
        callf   CS1_SEG:P_60B0
        ret
L_0634B:
        call    fn_0634F
        retf
fn_0634F:
        mov     byte ptr [UI_REDRAW_REQ], 1
        sub     ax, ax
        mov     byte ptr [G_SONG_STEP], al
        mov     word ptr [W_4C18], ax
        mov     word ptr [G_SONG_STEP_START_LO], ax
        mov     word ptr [G_SONG_STEP_START_HI], ax

calls_get_table_entry_06362:
        call    get_table_entry
        je      L_063D5
        cmp     ah, 0
        je      L_063D5
        push    ax
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        cmp     byte ptr es:[TBL_0013], 0
        pop     ax
        je      L_063D5
        mov     word ptr [CUR_SEQ_SEG], es
        mov     byte ptr [SEL_SEQ], al
        push    ax
calls_process_input_06383:
        call    process_input
        mov     byte ptr [G_SONG_STEP_REPEAT], 0
        pop     cx
        mov     ax, word ptr [G_SONG_STEP_START_LO]
        mov     dx, word ptr [G_SONG_STEP_START_HI]
        mov     es, word ptr [CUR_SEQ_SEG]
L_06397:
        add     ax, word ptr es:[2ah]
        adc     dx, word ptr es:[TBL_002C]
        mov     bx, ax
        mov     bp, dx
        sub     bx, word ptr [W_1D60]
        sbb     bp, word ptr [W_1D62]
L_063AD:
        jae     br_063C4
        inc     byte ptr [G_SONG_STEP_REPEAT]
        dec     ch
        jne     L_06397
        mov     word ptr [G_SONG_STEP_START_LO], ax
        mov     word ptr [G_SONG_STEP_START_HI], dx
        inc     byte ptr [G_SONG_STEP]
        jmp     SHORT calls_get_table_entry_06362
br_063C4:
        sub     ax, word ptr es:[2ah]
        sbb     dx, word ptr es:[TBL_002C]
        mov     word ptr [G_SONG_STEP_START_LO], ax
        if      FW_VERSION = 172
        db      89h, 16h, 26h
convert_song_to_seq_dialog:
        dec     sp
        else
        mov     word ptr [G_SONG_STEP_START_HI], dx
        endif
L_063D5:
        mov     ax, word ptr [SEQ_EVENTS_SEG]
        mov     word ptr [SEQ_READ_PTR_SEG], ax
        mov     word ptr [FP_SEQ_READ_PTR], 0
        callf   CS1_SEG:P_7241
        ret
calls_mode_05_063e7:
        call    mode_05F30
L_063EA:
        INT_6E NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS
L_063F6:
        ret
song_advance_step:
        mov     ax, word ptr [SEQ_ELAPSED_MS_LO]
        mov     dx, word ptr [SEQ_ELAPSED_MS_HI]
        add     word ptr [G_SONG_STEP_START_LO], ax
        adc     word ptr [G_SONG_STEP_START_HI], dx
        mov     byte ptr [B_4C12], 1
        inc     byte ptr [G_SONG_STEP_REPEAT]
calls_get_table_entry_0640f:
        call    get_table_entry
        cmp     ah, byte ptr [G_SONG_STEP_REPEAT]
        jne     calls_get_table_entry_0643a
        mov     byte ptr [G_SONG_STEP_REPEAT], 0
        inc     byte ptr [G_SONG_STEP]
        mov     bl, byte ptr [G_SONG_STEP]
        cmp     byte ptr [G_SONG_LOOP_ON], 0
        je      calls_get_table_entry_0643a
        cmp     bl, byte ptr [G_SONG_LOOP_LAST]
        jbe     calls_get_table_entry_0643a
        mov     bl, byte ptr [G_SONG_LOOP_FIRST]
        mov     byte ptr [G_SONG_STEP], bl
calls_get_table_entry_0643a:
        call    get_table_entry
        mov     ax, word ptr [si]
        cmp     al, 0ffh
L_06441:
        je      calls_check_status_flag_596c_0647a
        cmp     ah, 0
L_06446:
        je      calls_check_status_flag_596c_0647a
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        cmp     byte ptr es:[TBL_0013], 0
L_06453:
        je      calls_check_status_flag_596c_0647a
        mov     word ptr [CUR_SEQ_SEG], es
        mov     bl, byte ptr [G_SONG_STEP]
        sub     bh, bh
        shl     bx, 3
        add     bx, P_9DDC
        mov     ax, word ptr [bx]
        mov     dx, word ptr [bx+2]
        add     word ptr [W_582E], ax
        adc     word ptr [W_5830], dx
        callf   CS1_SEG:P_71B5
        clc
        ret
calls_check_status_flag_596c_0647a:
        callf   CS1_SEG:P_71B5
        stc
        ret
file_dialog_06481:
        call    seq_edit_allowed
from_song_status_06484:
        je      convert_song_to_seq_dialog_06487
        ret
convert_song_to_seq_dialog_06487:
convert_song_to_seq_dialog_06F07:
        DLG_CONVERT_SONG_TO_SEQ
status_convert_064fa:
        int     50h
bc_int5b_064fc:
        INT_67 seq_init_04E2E
bc_int5d_06500:
        INT_68 convert_song_do_it
bc_int5d_06504:
        INT_5B seq_init_04E2E
bc_int5d_06508:
        INT_5D convert_song_refresh
L_0650C:
        callf   CS1_SEG:seq_find_free_slot_far
        mov     byte ptr [SEL_SEQ], al
L_06514:
        call    calls_setup_callback_vectors_0658c
        ret
        if      FW_VERSION = 150
L_06F9E                         equ     $+6
        endif
convert_song_refresh:
        mov     al, byte ptr [G_SONG_INDEX]
        inc     al
arith_ext_0651D:
        BC_ARITH_EXT 01062h
L_06522:
        mov     si, word ptr [PTR_CUR_SONG]
        cmp     byte ptr [si+SONG_USED], 0
L_0652B:
        je      ui_a_0653A
        add     si, 0
        if      FW_VERSION = 150
L_06FBB                         equ     $+11
        endif
        mov     dx, ds
status_b_06532:
        BC_STATUS_B 116, 16, 16
        db      0ebh, 05h
ui_a_0653A:
        BC_UI_A4 116, 16
        db      0a0h, 20h, 0bh, 0feh
        db      0c0h
arith_ext_06544:
        BC_ARITH_EXT 02862h
        db      0feh, 0c8h, 9ah
        dw      far_wrapper_19743
        dw      CS1_SEG
        mov     si, 2
        mov     dx, es
status_b_06555:
        BC_STATUS_B 116, 40, 16
        db      0c3h
calls_setup_callback_vectors_0655c:
        mov     al, 13h
        mov     si, G_SONG_INDEX
        mov     bx, P_6579
calls_setup_callback_vectors_06564:
        call    setup_callback_vectors
ui_stat_b_6555_567:
        BC_UI_CTRL 97, 15, 115, 9
bc_int6c_0656e:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, calls_setup_callback_vectors_0658c
L_06578:
        ret
L_06579:
        mov     byte ptr [G_SONG_STEP], 0
        sub     ah, ah
        mov     bx, 210h
        mul     bx
        add     ax, TBL_SONGS
        mov     word ptr [PTR_CUR_SONG], ax
        ret
calls_setup_callback_vectors_0658c:
        mov     al, 62h
        mov     si, SEL_SEQ
        mov     bx, process_input
calls_setup_callback_vectors_06594:
        call    setup_callback_vectors
ui_stat_b_6555_597:
        BC_UI_CTRL 97, 39, 115, 9
bc_int6c_0659e:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, calls_setup_callback_vectors_0655c, NULL_HANDLER_OFS
L_065A8:
        ret
convert_song_do_it:
        mov     si, word ptr [PTR_CUR_SONG]
        add     si, 10h
        mov     ax, word ptr [si]
        cmp     al, 0ffh
L_065B4:
        jne     L_065B7
        ret
L_065B7:
        cmp     ah, 0
L_065BA:
        jne     L_065BD
        ret
L_065BD:
        sub     bx, bx
        mov     di, D_4C30
L_065C2:
        mov     ax, word ptr [di]
        add     di, 4
        add     bx, ax
        jae     L_065CE
        mov     bx, 0ffffh
L_065CE:
        or      ax, ax
        jne     L_065C2
        cmp     bx, 3e7h
L_065D6:
        jae     ui_ctrl_06616
        mov     al, byte ptr [si]
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        cmp     byte ptr es:[TBL_0013], 0
bc_int2a_065e5:
        jne     error_unused_sequence_06600
error_unused_sequence_065E7:
        INT_2A "     Unused sequence !"
error_unused_sequence_06600:
        callf   CS1_SEG:arena_free_paras_far
        cmp     ax, 5dh
L_06608:
        jae     calls_check_flag_1d86_0660d
calls_check_flag_1d86_0660a:
        jmp     NEAR jmp_ferr_insufficient_memory
calls_check_flag_1d86_0660d:
        callf   CS1_SEG:calls_convert_msg_19bcc
        if      FW_VERSION = 172
        call    check_flag_1d86
        endif
        ret
ui_ctrl_06616:
        jmp     too_many_bars_error
        if      FW_VERSION = 172
        db      00h
        endif
ui_field_23_61a:
        BC_UI_CTRL 23, 25, 116, 9
bc_int6c_06621:
        INT_6C NULL_HANDLER_OFS, ui_ext_display_4_f49, main_screen_tempo_field, close_handler_06AA7
bc_int5d_0662b:
        INT_5B calls_check_status_flag_596c_06653
bc_int5d_0662f:
        INT_5D system_call
L_06633:
        mov     ax, ds
        mov     es, ax
        mov     bp, calls_init_with_int50_06741
        mov     ax, SEL_TRACK
        mov     bx, L_0664A
        mov     cx, 3fh
        mov     dx, 0
calls_set_mode_flag_1_06646:
        call    set_mode_flag_1
        ret
L_0664A:
        mov     byte ptr [G_REC_EVENTS_ADDED], 0
calls_check_status_flag_596c_0664f:
        call    L_06FA3
        ret
calls_check_status_flag_596c_06653:
        call    seq_edit_allowed
L_06656:
        je      L_06659
        ret
L_06659:
        callf   CS1_SEG:TRACK_DIALOG_OFS
        mov     bl, byte ptr [SEL_TRACK]
        sub     bh, bh
        shl     bx, 4
        add.w   bx, 30h
        mov     si, bx
        mov     dx, ds
status_b_0666F:
        BC_STATUS_B 116, 30, 16
calls_dispatch_int6d_6e_06675:
        call    track_window_name_field
calls_dispatch_int6d_6e_06678:
        call    dispatch_int6d_6e
        ret
L_070F8:
bc_int67_68_0667c:
        int     50h
bc_int67_68_0667e:
        INT_65 calls_check_and_call_067ac
        if      FW_VERSION = 150
        db      0cdh
        db      67h
        mov     bp, 0cd65h
        push    track_window_copy
        endif
bc_int5b_06682:
        if      FW_VERSION = 172
        INT_67 calls_init_with_int50_06741
bc_int5b_06686:
        INT_68 track_window_copy
bc_int5b_0668a:
        endif
        INT_5B calls_init_with_int50_06741
L_0668E:
        ret
track_window_name_field:
        call    bc_int67_68_0667c
        mov     bl, byte ptr [SEL_TRACK]
        sub     bh, bh
        shl     bx, 4
        add.w   bx, 30h
        mov     si, bx
        mov     dx, ds
status_b_066A3:
        BC_STATUS_B 116, 30, 16
bc_int63_066a9:
        INT_63 bc_int62_0671d
L_066AD:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bl, byte ptr [SEL_TRACK]
        sub     bh, bh
        test    byte ptr es:[bx+TRK_STATUS], 1
L_066BD:
        je      bc_int6a_066f1
        shl     bx, 4
        mov     si, 30h
        add     si, bx
        mov     cl, 74h
        mov     ch, 0fh
        int     42h
        ret
track_window_name_display:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bl, byte ptr [SEL_TRACK]
        sub     bh, bh
        test    byte ptr es:[bx+TRK_STATUS], 1
L_066DE:
        je      bc_int6a_066f1
        shl     bx, 4
        mov     si, 30h
        add     si, bx
        mov     dx, es
status_b_066EA:
        BC_STATUS_B 116, 15, 16
        db      0c3h
bc_int6a_066f1:
        INT_6A calls_call_with_check_06714, calls_call_with_check_06714
bc_int61_066f7:
        INT_61 calls_call_with_check_06714
L_066FB:
        mov     word ptr [UI_SLOT_DIGIT], calls_call_with_check_06714
        mov     word ptr [UI_SLOT_PAD_HIT], calls_call_with_check_06714
ui_a_06707:
        if      FW_VERSION = 172
calls_call_with_check_06710     equ     $+9
        endif
        BC_UI_A4 116, 15
        BC_UI_CTRL 115, 14, 7, 9
        db      0c3h
calls_call_with_check_06714:
        call    call_with_check
calls_file_operation_06717:
        call    track_mark_used
        if      FW_VERSION = 150
L_06590      equ     $+1
        endif
        jmp     track_window_name_field
bc_int62_0671d:
        call    bc_int67_68_0667c
bc_int62_06720:
        call    track_window_name_display
bc_int62_06723:
        INT_62 track_window_name_field
tgt_06727:
        mov     ax, ds
        mov     es, ax
        mov     bl, byte ptr [SEL_TRACK]
        sub     bh, bh
        shl     bx, 4
        add.w   bx, 30h
        mov     si, bx
        mov     cl, 74h
        mov     ch, 1eh
        int     42h
        ret
calls_init_with_int50_06741:
        call    main_screen_enter
        jmp     NEAR ui_field_23_61a
track_mark_used:
        call    call_with_check
L_0674A:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bl, byte ptr [SEL_TRACK]
        sub     bh, bh
        test    byte ptr es:[bx+TRK_STATUS], 1
L_0675A:
        je      br_0675D
        ret
br_0675D:
        or      byte ptr es:[bx+TRK_STATUS], 1
        push    ax
        shl     bx, 4
        add     bx, 30h
        mov     si, 0
        add     si, bx
        mov     di, bx
        mov     cx, 10h
        rep movsb
        pop     ax
        ret
track_reset_defaults:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bl, byte ptr [SEL_TRACK]
        sub     bh, bh
        mov     byte ptr es:[bx+TRK_CHANNEL], 0c0h
        mov     byte ptr es:[bx+TRK_VELOCITY], 64h
        mov     byte ptr es:[bx+TRK_STATUS], 2
        mov     byte ptr es:[bx+470h], 0
        ret
L_0679B:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bl, byte ptr [SEL_TRACK]
        sub     bh, bh
        test    byte ptr es:[bx+TRK_CHANNEL], 40h
        ret
calls_check_and_call_067ac:
        call    check_and_call
        callf   CS1_SEG:seq_rewind_to_start_far
        callf   CS1_SEG:DELETE_TRACK_DIALOG_OFS
L_067B9:
        int     50h
calls_setup_callback_vectors_067bb:
        mov     al, 3fh
        mov     si, SEL_TRACK
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_067c3:
        call    setup_callback_vectors
bc_int67_68_067c6:
        INT_66 bc_int5b_0681f
bc_int5b_067ca:
        INT_67 track_dialog_cancel
bc_int5d_067ce:

        if      FW_VERSION = 172
        INT_68 delete_track_do_it
        else
        INT_68 L_066DF
        endif
calls_dispatch_int6d_6e_067d2:
        INT_5B track_dialog_cancel
calls_dispatch_int6d_6e_067d6:
        INT_5D delete_track_refresh
calls_dispatch_int6d_6e_067da:
        call    dispatch_int6d_6e
        ret
delete_track_refresh:
        mov     al, byte ptr [SEL_TRACK]
        sub     ah, ah
        push    ax
        inc     al
ui_menu_067E6:
        BC_UI_MENU 88, 17
        db      58h
L_067EC:
        mov     bx, ax
        mov     es, word ptr [CUR_SEQ_SEG]
        test    byte ptr es:[bx+TRK_STATUS], 1
L_067F8:
        je      ui_a_0680F
        shl     ax, 4
        add     ax, 30h
        mov     si, ax
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     dx, es
status_b_06808:
        BC_STATUS_B 106, 17, 16
        db      0c3h
ui_a_0680F:
        BC_UI_A4 106, 17
        ret
track_dialog_cancel:
        call    main_screen_enter
calls_system_call_06818:
        call    system_call
L_0681B:
        call    calls_check_status_flag_596c_06653
        ret
bc_int5b_0681f:
        callf   CS1_SEG:DELETE_ALL_TRACKS_DIALOG_OFS
bc_int5b_06824:
        int     50h
bc_int5b_06826:
        INT_5B calls_check_and_call_067ac
bc_int67_68_0682a:
        INT_67 calls_check_and_call_067ac
bc_int67_68_0682e:
        INT_68 delete_all_tracks_do_it
L_06832:
        ret
delete_all_tracks_do_it:
        if      FW_VERSION = 172
        callf   CS1_SEG:seq_undo_checkpoint_far
        else
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[TBL_0013], 0
        jne     L_072BE
        jmp     calls_init_with_int50_06741
L_072BE:
        endif
        or      byte ptr [SEL_TRACK], 80h
L_0683D:
        call    seq_delete_track_events
        mov     byte ptr [SEL_TRACK], 0
loop_06845:
        call    track_reset_defaults
        inc     byte ptr [SEL_TRACK]
        cmp     byte ptr [SEL_TRACK], 40h
        jne     loop_06845
        mov     byte ptr [SEL_TRACK], 0
        ret
        if      FW_VERSION = 150
L_066DF:
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[TBL_0013], 0
        jne     delete_track_do_it
        jmp     calls_init_with_int50_06741
        endif
delete_track_do_it:
        callf   CS1_SEG:seq_undo_checkpoint_far
L_0685E:
        call    seq_delete_track_events
L_06861:
        call    track_reset_defaults
        ret
seq_delete_track_events:
        mov     ah, byte ptr [SEL_TRACK]
        les     si, [FP_SEQ_AFTER_GAP]
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
L_06872:
        je      calls_init_with_int50_0689c
L_06874:
        cmp     al, 0c0h
L_06876:
        je      calls_init_with_int50_0689c_V150
        cmp     al, 0c1h
L_0687A:
        je      calls_init_with_int50_0689c_V150
        cmp     ah, 80h
        jb      L_06888
        callf   CS1_SEG:P_723D
        jmp     SHORT seq_delete_track_events
L_06888:
        and     al, 3fh
        cmp     ah, al
L_0688C:
        jne     calls_init_with_int50_0689c_V150
        callf   CS1_SEG:P_723D
        jmp     SHORT seq_delete_track_events
calls_init_with_int50_0689c_V150:
        db      9ah
        dw      L_170B9
        dw      CS1_SEG
        db      0ebh, 0c9h
calls_init_with_int50_0689c:
        callf   CS1_SEG:seq_rewind_to_start_far
calls_init_with_int50_068a1:
        call    main_screen_enter
calls_ui_661a_068a4:
        call    ui_field_23_61a
        ret
track_window_copy:
        mov     al, byte ptr [SEL_TRACK]
        mov     byte ptr [G_COPY_TRACK_DEST], al
        callf   CS1_SEG:COPY_TRACK_DIALOG_OFS
L_068B3:
        int     50h
calls_setup_callback_vectors_068b5:
        mov     al, 3fh
        mov     si, SEL_TRACK
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_068bd:
        call    setup_callback_vectors
bc_int5d_068c0:
        INT_63 ui_stat_b_6938_93f
bc_int5d_068c4:
        INT_5D copy_track_refresh
bc_int5b_068c8:
        INT_67 track_dialog_cancel
bc_int5b_068cc:
        INT_68 copy_track_do_it
bc_int5b_068d0:
        INT_5B track_dialog_cancel
L_068D4:
        ret
copy_track_refresh:
        mov     al, byte ptr [SEL_TRACK]
        sub     ah, ah
        push    ax
        inc     al
ui_menu_068DD:
        BC_UI_MENU 88, 16
        db      58h
L_068E3:
        mov     bx, ax
        mov     es, word ptr [CUR_SEQ_SEG]
        test    byte ptr es:[bx+TRK_STATUS], 1
L_068EF:
        jne     L_0738D
ui_a_068F1:
        BC_UI_A4 106, 16
        db      0ebh, 14h
L_0738D:
        shl     ax, 4
        add     ax, 30h
        mov     si, ax
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     dx, es
status_b_06906:
        BC_STATUS_B 106, 16, 16
        mov     al, byte ptr [G_COPY_TRACK_DEST]
        sub     ah, ah
        push    ax
        inc     al
ui_menu_06914:
        BC_UI_MENU 88, 40
        db      58h
        if      FW_VERSION = 172
L_0691A:
        endif
        mov     bx, ax
        test    byte ptr es:[bx+TRK_STATUS], 1
L_06922:
        jne     L_073BF
ui_a_06924:
        BC_UI_A4 106, 40
L_073BF                         equ     $+1
        db      0c3h, 0c1h, 0e0h, 04h
        add     ax, 30h
        mov     si, ax
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     dx, es
status_b_06938:
        BC_STATUS_B 106, 40, 16
        db      0c3h
ui_stat_b_6938_93f:
        BC_UI_CTRL 86, 39, 118, 9
calls_setup_callback_vectors_06946:
        mov     al, 3fh
        mov     si, G_COPY_TRACK_DEST
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_0694e:
        call    setup_callback_vectors
bc_int63_06951:
        INT_63 NULL_HANDLER_OFS
bc_int62_06955:
        INT_62 track_window_copy
L_06959:
        ret
copy_track_do_it:
        mov     al, byte ptr [SEL_TRACK]
        cmp     al, byte ptr [G_COPY_TRACK_DEST]
L_06961:
        jne     L_06964
        ret
L_06964:
        mov     bl, al
        mov     bh, 0
        mov     es, word ptr [CUR_SEQ_SEG]
        test    byte ptr es:[bx+TRK_STATUS], 1
L_06972:
        jne     L_06975
        ret
L_06975:
        callf   CS1_SEG:seq_undo_checkpoint_far
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     al, byte ptr [SEL_TRACK]
        mov     ah, 0
        mov     si, ax
        mov     al, byte ptr [G_COPY_TRACK_DEST]
        mov     ah, 0
        mov     di, ax
        mov     al, byte ptr es:[si+TRK_CHANNEL]
        mov     ah, byte ptr es:[si+470h]
        mov     bl, byte ptr es:[si+TRK_VELOCITY]
        mov     bh, byte ptr es:[si+TRK_STATUS]
        mov     byte ptr es:[di+TRK_CHANNEL], al
        mov     byte ptr es:[di+470h], ah
        mov     byte ptr es:[di+TRK_VELOCITY], bl
        mov     byte ptr es:[di+TRK_STATUS], bh
        shl     si, 4
        shl     di, 4
        add     si, 30h
        add     di, 30h
        push    ds
        mov     ax, es
        mov     ds, ax
        mov     cx, 10h
        rep movsb
        pop     ds
L_069CB:
        les     si, [FP_SEQ_AFTER_GAP]
        mov     ax, es
        sub     ax, word ptr [SEQ_GAP_WRITE_SEG]
        cmp     ax, word ptr [G_SEQ_MEM_RESERVE]
L_069D9:
        jb      calls_system_call_06a3f
        callf   CS1_SEG:SCSI_STATUS_CHECK_FAR_OFS
        cmp     al, 0ffh
        jne     L_069E7
        jmp     calls_init_with_int50_0689c
L_069E7:
        mov     ah, al
        and     ax, 3fc0h
        cmp     al, 0c0h
L_069EE:
        jae     br_06A38
        cmp     ah, byte ptr [SEL_TRACK]
        jne     L_06A2B
        mov     bl, byte ptr es:[si+3]
        and     bl, 0f0h
        mov     bh, al
        push    es
        push    si
L_06A01:
        call    L_06A48
        cmp     bx, 4080h
        jne     br_06A0D
L_06A0A:
        call    L_06A48
br_06A0D:
        pop     si
        pop     es
        mov     word ptr [FP_SEQ_AFTER_GAP], si
        mov     word ptr [SEQ_AFTER_GAP_SEG], es
        push    bx
        callf   CS1_SEG:P_7239
        pop     bx
        cmp     bx, 4080h
        jne     L_06A29
        callf   CS1_SEG:P_7239
L_06A29:
        jmp     SHORT L_069CB
L_06A2B:
        cmp     ah, byte ptr [G_COPY_TRACK_DEST]
L_06A2F:
        jne     br_06A38
        callf   CS1_SEG:P_723D
        jmp     SHORT L_069CB
br_06A38:
        callf   CS1_SEG:P_7239
        jmp     SHORT L_069CB
calls_system_call_06a3f:
        call    calls_init_with_int50_0689c
calls_system_call_06a42:
        call    system_call
L_06A45:
        jmp     NEAR jmp_ferr_insufficient_memory
L_06A48:
        push    ax
        push    bx
        push    es
        push    si
        callf   CS1_SEG:P_7239
        pop     si
        pop     es
        pop     bx
        pop     ax
        or      al, byte ptr [G_COPY_TRACK_DEST]
        mov     byte ptr es:[si], al
        les     si, [FP_SEQ_AFTER_GAP]
        mov     al, 0
        ret
ui_stat_b_6938_a63:
        BC_UI_CTRL 5, 35, 25, 9
bc_int6c_06a6a:
        INT_6C NULL_HANDLER_OFS, close_handler_06AA7, ui_field_23_61a, NULL_HANDLER_OFS
bc_int6a_06a74:
        if      FW_VERSION = 172
        INT_6A calls_check_status_flag_596c_06a7f, calls_check_status_flag_596c_06a93
        else
        INT_6A calls_check_status_flag_596c_06a7e+1, calls_check_status_flag_596c_06a7f+17
        endif
calls_check_status_flag_596c_06a7a:
        INT_5B NULL_HANDLER_OFS
calls_check_status_flag_596c_06a7e:
        ret
        if      FW_VERSION = 150
        db      0e8h
        db      15h, 0aeh
        endif
calls_check_status_flag_596c_06a7f:
        if      FW_VERSION = 172
        call    seq_edit_allowed
        endif
L_06A82:
        if      FW_VERSION = 150
        db      74h, 01h
        ret
        db      0beh, 30h, 04h, 0e8h, 0d9h, 0eh
        or      byte ptr es:[si], 40h
        call    track_mark_used
        ret
        call    seq_edit_allowed
        endif
        je      calls_get_es_byte_06a85
        ret
calls_get_es_byte_06a85:
        if      FW_VERSION = 172
        mov     si, 430h
calls_get_es_byte_06a88:
        call    get_es_byte
        or      byte ptr es:[si], 40h
calls_file_operation_06a8f:
        call    track_mark_used
        ret
calls_check_status_flag_596c_06a93:
        call    seq_edit_allowed
L_06A96:
        je      calls_get_es_byte_06a99
        ret
        endif
calls_get_es_byte_06a99:
        mov     si, 430h
calls_get_es_byte_06a9c:
        call    get_es_byte
        and     byte ptr es:[si], 0bfh
calls_file_operation_06aa3:
        call    track_mark_used
        ret
close_handler_06AA7:
        BC_PLANE_A
bc_int6c_06aaa:
        INT_6C ui_stat_b_6938_a63, L_06B36, ui_field_23_61a, NULL_HANDLER_OFS
bc_int6a_06ab4:
        INT_6A main_track_channel_inc, main_track_channel_dec
bc_int5b_06aba:
        INT_5B calls_check_status_flag_596c_06bb4
calls_ui_6af1_06abe:
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
calls_ui_6af1_06ac4:
        call    L_06B1F
calls_ui_6af1_06ac7:
        call    ui_stat_b_6938_af1
        ret
main_track_channel_inc:
        call    seq_edit_allowed
calls_file_operation_06ace:
        je      calls_file_operation_06ad1
        ret
calls_file_operation_06ad1:
        call    track_mark_used
L_06AD4:
        call    L_06B1F
        or      ah, 20h
        test    byte ptr es:[bx], 20h
        je      ui_ctrl_06ae7
        cmp     al, 0fh
        jne     L_06AE5
        ret
L_06AE5:
        inc     al
ui_ctrl_06ae7:
        callf   CS1_SEG:P_65A2
        or      al, ah
        mov     byte ptr es:[bx], al
L_07586:
ui_stat_b_6938_af1:
        BC_UI_CTRL 35, 35, 13, 9
        db      0f6h, 0c4h, 20h
ui_ctrl_06afb:
        je      ui_stat_b_6938_afe
        ret
ui_stat_b_6938_afe:
        BC_UI_CTRL 35, 35, 19, 9
calls_check_status_flag_596c_06b05:
        ret
main_track_channel_dec:
        call    seq_edit_allowed
calls_file_operation_06b09:
        je      calls_file_operation_06b0c
        ret
calls_file_operation_06b0c:
        call    track_mark_used
L_06B0F:
        call    L_06B1F
        or      al, al
        jne     L_06B1B
        and     ah, 0dfh
        inc     al
L_06B1B:
        dec     al
        jmp     SHORT ui_ctrl_06ae7
L_06B1F:
        mov     bl, byte ptr [SEL_TRACK]
        sub     bh, bh
        add     bx, 430h
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     al, byte ptr es:[bx]
        mov     ah, al
        and     ax, 0f00fh
        ret
L_06B36:
        call    L_06B1F
        test    ah, 20h
jmp_ui_713b_06b3c:
        jne     close_handler_06B41
ui_ctrl_06b3e:
        jmp     NEAR ui_yield_07107_13b
L_075D6:
close_handler_06B41:
        BC_PLANE_A
ui_stat_b_6938_b44:
        BC_UI_CTRL 47, 35, 7, 9
bc_int6c_06b4b:
        INT_6C close_handler_06AA7, ui_yield_07107_13b, ui_field_23_61a, NULL_HANDLER_OFS
bc_int6a_06b55:
        INT_6A calls_check_status_flag_596c_06b60, calls_check_status_flag_596c_06b8a
calls_check_status_flag_596c_06b5b:
        INT_5B calls_check_status_flag_596c_06bb4
calls_check_status_flag_596c_06b5f:
        ret
calls_check_status_flag_596c_06b60:
        call    seq_edit_allowed
calls_file_operation_06b63:
        je      calls_file_operation_06b66
        ret
calls_file_operation_06b66:
        call    track_mark_used
        mov     si, 430h
        mov     bl, byte ptr [SEL_TRACK]
        sub     bh, bh
        mov     es, word ptr [CUR_SEQ_SEG]
        test    byte ptr es:[bx+TRK_CHANNEL], 10h
        jne     calls_file_operation_06b66+29
        callf   CS1_SEG:P_6506
L_07618:
        or      byte ptr es:[bx+TRK_CHANNEL], 10h
        ret
calls_check_status_flag_596c_06b8a:
        call    seq_edit_allowed
calls_file_operation_06b8d:
        je      calls_file_operation_06b90
        ret
calls_file_operation_06b90:
        call    track_mark_used
        mov     si, 430h
        mov     bl, byte ptr [SEL_TRACK]
        sub     bh, bh
        mov     es, word ptr [CUR_SEQ_SEG]
        test    byte ptr es:[bx+TRK_CHANNEL], 10h
        je      calls_check_status_flag_596c_06bad
        callf   CS1_SEG:P_6554
calls_check_status_flag_596c_06bad:
        and     byte ptr es:[bx+TRK_CHANNEL], 0efh
        ret
calls_check_status_flag_596c_06bb4:
        call    seq_edit_allowed
calls_call_with_check_06bb7:
        je      calls_call_with_check_06bba
        ret
calls_call_with_check_06bba:
        call    call_with_check
        callf   CS1_SEG:MIDI_INPUT_DIALOG_OFS
bc_int67_68_06bc2:
        int     50h
bc_int67_68_06bc4:
        INT_65 bc_int67_68_06d2e
bc_int5d_06bc8:
        INT_67 calls_init_with_int50_06d1d
bc_int5d_06bcc:
        INT_68 midi_input_panic
calls_ui_6c63_06bd0:
        INT_5D jump_handler_06BDF
calls_ui_6c63_06bd4:
        INT_5B calls_init_with_int50_06d1d
calls_ui_6c63_06bd8:
        call    ui_stat_a_6c59_c63
calls_dispatch_int6d_6e_06bdb:
        call    dispatch_int6d_6e
        ret
jump_handler_06BDF:
        mov     al, byte ptr [G_SOFT_THRU]
all_status:
        BC_JUMP 00d5ch
all_label:
        BC_STATUS 189, 13, "ALL"
status_all_06bf0:
        mov     al, byte ptr [G_MIDI_RECEIVE_CH]
        cmp     al, 0
L_06BF5:
        je      bc_target_06c07
        push    ax
clear_rect_06BF8:
        BC_CLEAR_RECT 189, 13, 18, 7
L_06BFF:
        pop     ax
        sub     ah, ah
jump__06C02:
        BC_JUMP_3C 00dc0h
bc_target_06c07:
        mov     al, byte ptr [G_SUSTAIN_TO_DURATION]
jump_handler_06C0A:
        BC_JUMP 016bdh
bc_target_06c0f:
        mov     al, byte ptr [G_MIDI_FILTER_ON]
jump_handler_06C12:
        BC_JUMP 02268h
bc_target_06c17:
        call    clear_rect_06C30
        mov     bl, byte ptr [D_0B3A]
        sub     bh, bh
init_06C20:
        BC_PLANE_B
L_06C23:
        mov     al, byte ptr [bx+D_0B3D]
value_06C27:
        BC_VALUE 02aceh
close_handler_06C2C:
        BC_PLANE_A
L_06C2F:
        ret
clear_rect_06C30:
        BC_CLEAR_RECT 62, 42, 96, 7
L_06C37:
        mov     al, byte ptr [D_0B3A]
        sub     al, 6
yield_06C3C:
        jae     L_06C48
handler_BC_YIELD:
        BC_STATUS_A 62, 42, D_0B3A, TBL_EVENT_TYPE_LABELS
        db      0c3h
L_06C48:
        mov     byte ptr [B_5832], al
        sub     ah, ah
raw_06C4D:
        BC_FIELD 62, 42
status_display_6C52:
        BC_STATUS 80, 42, "-"
status_a_06C59:
        BC_STATUS_A 86, 42, P_5832, TBL_MIDI_CC_LABELS
        db      0c3h
ui_stat_a_6c59_c63:
        BC_UI_CTRL 91, 12, 19, 9
calls_setup_callback_vectors_06c6a:
        mov     al, 1
        mov     si, G_SOFT_THRU
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_06c72:
        call    setup_callback_vectors
ui_ctrl_06c75:
        INT_6C NULL_HANDLER_OFS, ui_stat_a_6c59_c80, NULL_HANDLER_OFS, ui_stat_a_6c59_c9d
ui_ctrl_06c7f:
        ret
ui_stat_a_6c59_c80:
        BC_UI_CTRL 188, 12, 19, 9
calls_setup_callback_vectors_06c87:
        mov     al, 10h
        mov     si, G_MIDI_RECEIVE_CH
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_06c8f:
        call    setup_callback_vectors
ui_ctrl_06c92:
        INT_6C ui_stat_a_6c59_c63, NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_stat_a_6c59_c9d
ui_ctrl_06c9c:
        ret
ui_stat_a_6c59_c9d:
        BC_UI_CTRL 188, 21, 19, 9
calls_setup_callback_vectors_06ca4:
        mov     al, 1
        mov     si, G_SUSTAIN_TO_DURATION
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_06cac:
        call    setup_callback_vectors
ui_ctrl_06caf:
        INT_6C ui_stat_a_6c59_cba, NULL_HANDLER_OFS, ui_stat_a_6c59_c80, ui_stat_a_6c59_cba
ui_ctrl_06cb9:
        ret
ui_stat_a_6c59_cba:
        BC_UI_CTRL 103, 33, 19, 9
L_06B6C:
calls_setup_callback_vectors_06cc1:
        mov     al, 1
        mov     si, G_MIDI_FILTER_ON
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_06cc9:
        call    setup_callback_vectors
ui_ctrl_06ccc:
        INT_6C NULL_HANDLER_OFS, ui_stat_a_6c59_cf4, ui_stat_a_6c59_c9d, ui_stat_a_6c59_cd7
ui_ctrl_06cd6:
        ret
ui_stat_a_6c59_cd7:
        BC_UI_CTRL 61, 41, 97, 9
calls_setup_callback_vectors_06cde:
        mov     al, 85h
        mov     si, D_0B3A
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_06ce6:
        call    setup_callback_vectors
ui_ctrl_06ce9:
        INT_6C NULL_HANDLER_OFS, ui_stat_a_6c59_cf4, ui_stat_a_6c59_cba, NULL_HANDLER_OFS
ui_ctrl_06cf3:
        ret
ui_stat_a_6c59_cf4:
        BC_UI_CTRL 205, 41, 19, 9
bc_int6c_06cfb:
        INT_6A midi_input_pass_inc, calls_init_with_int50_06d19
bc_int6c_06d01:
        INT_6C ui_stat_a_6c59_cd7, NULL_HANDLER_OFS, ui_stat_a_6c59_c9d, NULL_HANDLER_OFS
L_06D0B:
        ret
midi_input_pass_inc:
        mov     al, 1
L_06D0E:
        mov     bl, byte ptr [D_0B3A]
        sub     bh, bh
        mov     byte ptr [bx+D_0B3D], al
        ret
calls_init_with_int50_06d19:
        mov     al, 0
        jmp     SHORT L_06D0E
calls_init_with_int50_06d1d:
        call    main_screen_enter
        jmp     NEAR close_handler_06AA7
midi_input_panic:
        callf   CS1_SEG:midi_all_notes_off_far
        callf   CS1_SEG:midi_all_notes_off_alt_far
        ret
bc_int67_68_06d2e:
        callf   CS1_SEG:record_all_16_channels_dialog
bc_int67_68_06d33:
        int     50h
bc_int5b_06d35:
        INT_67 calls_init_with_int50_06da8
bc_int5d_06d39:
        INT_68 bc_int5c_06db6
bc_int5d_06d3d:
        INT_5B calls_init_with_int50_06da8
bc_int5d_06d41:
        INT_5D record_16_refresh
L_06D45:
        mov     byte ptr [B_63C8], 0
        callf   CS1_SEG:seq_edit_end_far
        callf   CS1_SEG:undo_seq_discard_far
        mov     al, byte ptr [SEL_SEQ]
calls_process_input_06d57:
        call    process_input
        ret
record_16_refresh:
        mov     al, byte ptr [SEL_SEQ]
        inc     al
ui_menu_06D60:
        BC_UI_MENU 88, 15
        db      8eh
L_06D66:
        push    es
        if      FW_VERSION = 172
        or      bl, byte ptr [di]
        else
        db      0feh, 1ch
        endif
        mov     si, 2
        mov     dx, es
status_b_06D6E:
        BC_STATUS_B 106, 15, 16
status_a_06D74:
        BC_STATUS_A 124, 23, G_TEMPO_SOURCE_SEQ, D_1506
calls_timer_handler_06d7d:
        call    timer_handler
ui_a_06D80:
        BC_UI_A2 88, 23
ext_2_status_06D85:
        cmp     word ptr [MIDI_CLOCK_WATCHDOG], 0
ext_2_status:
        je      status_ext_06d97
ext_display_3:
        BC_STATUS 88, 23, "(Ext)"
status_ext_06d97:
        mov     al, byte ptr [SEQ_TSIG_NUM]
arith_ext_06D9A:
        BC_ARITH_EXT 017d0h
L_06D9F:
        mov     al, byte ptr [SEQ_TSIG_DEN]
arith_ext_06DA2:
        BC_ARITH_EXT 017e2h
calls_init_with_int50_06da7:
        ret
calls_init_with_int50_06da8:
        call    main_screen_enter
calls_system_call_06dab:
        call    system_call
        mov     byte ptr [B_63C8], 0
        jmp     NEAR calls_check_status_flag_596c_06bb4
bc_int5c_06db6:
        int     50h
bc_int67_68_06db8:
        INT_5C record_16_idle
bc_int5b_06dbc:
        mov     word ptr [UI_SLOT_EXIT], jmp_init_state_06e6f
bc_int5b_06dc2:
        INT_68 jmp_init_state_06e6f
bc_int5b_06dc6:
        INT_5B jmp_init_state_06e6f
L_06DCA:
        INT_6E NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, record_16_play, record_16_play
bc_int5d_06dd6:
        INT_5A NULL_HANDLER_OFS
bc_int5d_06dda:
        INT_5D record_16_proceed_refresh
L_06DDE:
        mov     al, byte ptr [SEQ_TSIG_NUM]
        mov     ah, byte ptr [SEQ_TSIG_DEN]
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bx, word ptr es:[TBL_0014]
        push    ax
        push    bx
        mov     al, byte ptr [SEL_SEQ]
        callf   CS1_SEG:seq_delete_far
        callf   CS1_SEG:seq_create_new_far
        callf   CS1_SEG:seq_edit_begin_far
        pop     bx
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     word ptr es:[TBL_0014], bx
        pop     bx
        mov     byte ptr [SEQ_TSIG_NUM], bl
        mov     byte ptr [SEQ_TSIG_DEN], bh
        les     si, [FP_SEQ_AFTER_GAP]
L_06E19:
        mov     al, byte ptr es:[si]
        cmp     al, 0c0h
L_06E1E:
        jne     L_06E29
        mov     word ptr es:[si+3], bx
        add     si, 6
        jmp     SHORT L_06E19
L_06E29:
        mov     es, word ptr [CUR_SEQ_SEG]
        sub     ax, ax
        mov     byte ptr es:[20h], al
        mov     word ptr es:[1ch], ax
        mov.l   word ptr es:[1eh], 0ffffh
        mov     di, 430h
        mov     cl, 0
L_06E43:
        mov     al, byte ptr es:[di]
        mov     al, 0a0h
        or      al, cl
        stosb
        inc     cl
        cmp     cl, 10h
        jne     L_06E43
        mov     al, 0a0h
        stosb
        mov     byte ptr [B_63C8], 1
        mov     byte ptr [SEQ_REC_ARMED], 1
soft_key_06E5F:
        call    L_06E85
softkey_cancel_6E62:
        BC_SOFTKEY 5, BC_SK_FILL,  "CANCEL"
softkey_cancel_06e6e:
        ret
jmp_init_state_06e6f:
        mov     byte ptr [SEQ_REC_ARMED], 0
        callf   CS1_SEG:seq_edit_end_far
        mov     al, byte ptr [SEL_SEQ]
        callf   CS1_SEG:seq_delete_far
        jmp     init_state
record_16_idle:
        ret
L_06E85:
        callf   CS1_SEG:record_all_16_channels_1_dialog
        mov     al, byte ptr [SEL_SEQ]
        inc     al
arith_ext_06E8F:
        BC_ARITH_EXT 01052h
L_06E94:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     si, 2
        mov     dx, es
status_b_06E9D:
        BC_STATUS_B 100, 16, 16
calls_timer_handler_06ea3:
        call    timer_handler
ui_a_06EA6:
        BC_UI_A2 82, 26
ext_3_status_06EAB:
        cmp     word ptr [MIDI_CLOCK_WATCHDOG], 0
ext_3_status:
        je      status_ext_06ebd
ext_display_4:
        BC_STATUS 82, 26, "(Ext)"
status_ext_06ebd:
        mov     al, byte ptr [SEQ_TSIG_NUM]
arith_ext_06EC0:
        BC_ARITH_EXT 01acah
L_06EC5:
        mov     al, byte ptr [SEQ_TSIG_DEN]
arith_ext_06EC8:
        BC_ARITH_EXT 01adch
L_06ECD:
        ret
record_16_play:
        int     50h
L_06ED0:
        db      9ah
        dw      sequencer_start_from_top_far
L_06ED2                         equ     $-1
        dw      CS1_SEG
bc_int5c_06ed5:
        INT_6E NULL_HANDLER_OFS, NULL_HANDLER_OFS, calls_reset_state_vars_06f30, NULL_HANDLER_OFS, NULL_HANDLER_OFS
bc_int5c_06ee1:
        INT_5C calls_check_status_flag_596c_06f09
L_06EE5:
        mov     word ptr [UI_SLOT_EXIT], calls_reset_state_vars_06f30
L_06EEB:
        call    L_06E85
        ret
record_16_proceed_refresh:
        mov     ax, word ptr [SEQ_CUR_BAR]
        inc     ax
ui_dialog_06EF3:
        BC_UI_DIALOG 202, 34
L_06EF8:
        mov     ax, word ptr [SEQ_CUR_BAR]
        mov     cx, word ptr [SEQ_BAR_TICK]
        mov     dl, byte ptr [SEQ_BEAT_TICKS]
range_06F03:
        BC_RANGE 94, 46
L_06F08:
        ret
calls_check_status_flag_596c_06f09:
        cmp     byte ptr [G_SEQ_MEM_FULL], 0
calls_check_status_flag_596c_06f0e:
        jne     calls_system_call_06f27
calls_check_status_flag_596c_06f10:
        call    seq_edit_allowed
L_06F13:
        je      calls_reset_state_vars_06f30
        sub     ax, ax
        xchg    byte ptr [G_POS_REDRAW_REQ], al
        or      al, al
L_06F1D:
        jne     L_06F20
        ret
L_06F20:
        call    record_16_proceed_refresh
lcd_coord_06F23:
        BC_FLUSH
calls_system_call_06f26:
        ret
calls_system_call_06f27:
        call    calls_reset_state_vars_06f30
calls_system_call_06f2a:
        call    system_call
calls_reset_state_vars_06f2d:
        jmp     NEAR jmp_ferr_insufficient_memory
calls_reset_state_vars_06f30:
        mov     byte ptr [B_63C8], 0
        callf   CS1_SEG:sequencer_stop_far
        call    reset_state_vars
        callf   CS1_SEG:midi_all_notes_off_far
        jmp     init_state
L_06F45:
        db      0e8h, 0e8h, 0ffh, 0cbh
        if      FW_VERSION = 150
L_079DE:
        endif
ui_ext_display_4_f49:
        BC_UI_CTRL 161, 25, 19, 9
bc_int6c_06f50:
        INT_6C ui_field_23_61a, close_handler_07610, ui_event_3ce, ui_area_161_55b
bc_int6a_06f5a:
        INT_6A calls_get_es_byte_06f6f, calls_get_es_byte_06f7d
bc_int5d_06f60:
        INT_5D system_call
bc_int5b_06f64:
        INT_5B calls_check_flags_1d8a_1d8b_06fbe
L_06F68:
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
        ret
calls_get_es_byte_06f6f:
        mov     si, 430h
calls_get_es_byte_06f72:
        call    get_es_byte
        or      byte ptr es:[si], 80h
calls_file_operation_06f79:
        call    track_mark_used
        ret
calls_get_es_byte_06f7d:
        mov     si, 430h
calls_get_es_byte_06f80:
        call    get_es_byte
        mov     ch, byte ptr es:[si]
        push    es
        push    si
L_06F88:
        call    midi_route_sustain_off
        pop     si
        pop     es
        and     byte ptr es:[si], 7fh
        ret
midi_route_sustain_off:
        mov     dx, 40h
        mov     ah, 0b0h
        mov     al, 40h
        mov     cl, 0
        cli
        callf   CS1_SEG:MIDI_EVENT_ROUTE_OFS
        sti
        ret
L_06FA3:
        cmp     byte ptr [G_TRACK_SOLO], 0
L_06FA8:
        jne     L_06FAB
        ret
L_06FAB:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bl, byte ptr [SEL_TRACK]
        mov     bh, 0
        mov     ch, byte ptr es:[bx+TRK_CHANNEL]
calls_check_flags_1d8a_1d8b_06fba:
        call    midi_route_sustain_off
        ret
calls_check_flags_1d8a_1d8b_06fbe:
        call    check_flags_1d8a_1d8b
L_06FC1:
        je      calls_solo_status_018_06fc4
        ret
calls_solo_status_018_06fc4:
        mov     byte ptr [G_TRACK_SOLO], 0
calls_solo_status_018_06fc9:
        call    solo_status_018B0
        callf   CS1_SEG:P_EC55
        call    time_convert
soft_key_06FD4:
        call    calls_ui_a_011_07020
softkey_close_07A6C:
softkey_close_6FD7:
        BC_SOFTKEY 6, BC_SK_FILL,  "CLOSE"
softkey_close_06fe2:
        INT_69 calls_init_with_int50_0710e
bc_int65_06fe6:
        INT_64 NULL_HANDLER_OFS
bc_int67_68_06fea:
        INT_65 NULL_HANDLER_OFS
bc_int67_68_06fee:
        INT_66 NULL_HANDLER_OFS
bc_int67_68_06ff2:
        INT_67 NULL_HANDLER_OFS
bc_int5b_06ff6:
        INT_68 NULL_HANDLER_OFS
bc_int5b_06ffa:
        mov     word ptr [UI_SLOT_PAD_HIT], P_7114
bc_int5b_07000:
        INT_5B calls_init_with_int50_0710e
L_07004:
        mov     word ptr [UI_SLOT_EXIT], calls_ui_a_011_07015
        mov     byte ptr [B_0B1C], 0
        mov     byte ptr [B_14D3], 1
        ret
calls_ui_a_011_07015:
        mov     byte ptr [B_0B1C], 1
        mov     byte ptr [B_14D3], 0
        ret
calls_ui_a_011_07020:
        call    ui_a_011CC
calls_cursor_handler_07023:
        call    cursor_handler
reset_07026:
        BC_PLANE_C
clear_rect_07029:
        BC_CLEAR_RECT 39, 12, 208, 36
clear_rect_07030:
        BC_CLEAR_RECT 0, 51, 204, 9
close_handler_07037:
        BC_PLANE_A
L_0703A:
        mov     bl, byte ptr [G_PAD_BANK_OFS]
        mov     bh, 0
L_07040:
        if      FW_VERSION = 172
        call    auto_punch_070C9+4
        else
        call    tgt_070DD
        endif
L_07043:
        call    L_070A4
L_07046:
        call    L_070EF
        inc     bl
L_0704B:
        mov     al, byte ptr [G_PAD_BANK_OFS]
        add     al, 10h
        if      FW_VERSION = 172
L_07051                         equ     $+1
        endif
        cmp     bl, al
L_07052:
        jne     L_07040
        mov     al, byte ptr [G_PAD_BANK_OFS]
        shr     al, 4
        mov     byte ptr [B_5945], al
        add     al, 41h
        mov     cl, 12h
        mov     ch, 25h
select_07063:
        if      FW_VERSION = 172
L_07067                         equ     $+4
L_07069                         equ     $+6
        endif
        BC_PUTCHAR
        BC_STATUS_A 6, 21, P_5945, TBL_TRACK_BANK_LABELS
clear_rect_0706F:
        BC_CLEAR_RECT 0, 52, 204, 7
press_pads_to_track_on_of_status:
        call    L_014D3
        cmp     byte ptr [G_NEXT_SEQ], 0ffh
press_pads_to_track_onoff_status:
        je      press_pads_track_display
        ret
press_pads_track_display:
PRESS_PADS_TRACK_DISPLAY_V150:
        BC_STATUS 0, 52, "  Press pads to Track ON/OFF"
status_press_pads_to_track_onoff_070a3:
        ret
L_07B39_V150:
L_070A4:
        mov     es, word ptr [CUR_SEQ_SEG]
        test    byte ptr es:[bx+TRK_STATUS], 1
L_070AE:
        je      L_07B57
        mov     si, bx
        shl     si, 4
        add     si, 30h
        mov     dx, word ptr [CUR_SEQ_SEG]
        mov     ah, 8
auto_punch_070BE:
        BC_PUTS_FAR
        ret
L_07B57:
        mov     dx, ds
        mov     si, TBL_TRACK_BANK_LABELS+21     ; "(Unused)"
        mov     ah, 8
auto_punch_070C9:
        BC_PUTS_FAR
        if      FW_VERSION = 172
        db      0c3h, 8bh
L_070CE:
        ret
        db      24h, 0fh, 0c1h
L_070D2:
        db      0e8h, 02h, 0b4h
        add     bp, word ptr [bp+si]
        loopne  press_pads_track_display+8
        or.d0   si, si
        in      al, 8ah
        else
        db      0c3h
        endif
tgt_070DD:
        if      FW_VERSION = 172
        call    file_display+14
        or      ax, 0c38ah
        else
        mov     ax, bx
        and     al, 0fh
        shr     ax, 2
        mov     ah, 3
        sub     ah, al
        mov     al, 9
        mul     ah
        mov     ch, al
        add     ch, 0dh
        mov     al, bl
        endif
        and     al, 3
        mov     ah, 34h
        mul     ah
        mov     cl, al
        if      FW_VERSION = 172
L_070ED                         equ     $+2
        endif
        add     cl, 28h
        ret
L_070EF:
        mov     es, word ptr [CUR_SEQ_SEG]
        test    byte ptr es:[bx+TRK_CHANNEL], 80h
L_070F9:
        jne     reset_070FC
        ret
L_07B91:
reset_070FC:
        BC_PLANE_C
        if      FW_VERSION = 172
        db      0feh, 0c9h, 0feh, 0cdh, 0b2h, 31h, 0b6h, 09h
        else
        db      0feh
        endif
yield_07107:
        if      FW_VERSION = 150
        leave
        dec     ch
        mov     dl, 31h
        mov     dh, 9
        endif
        BC_YIELD
        if      FW_VERSION = 172
close_handler_0710A:
        endif
        BC_PLANE_A
        if      FW_VERSION = 150
close_handler_0710A:
        endif
calls_init_with_int50_0710d:
        ret
calls_init_with_int50_0710e:
        call    main_screen_enter
        jmp     NEAR ui_ext_display_4_f49
        db      3ch, 00h
L_07116:
        jne     L_07119
        ret
L_07119:
        mov     bl, byte ptr [G_PAD_BANK_OFS]
        or      bl, ah
        mov     bh, 0
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ch, byte ptr es:[bx+TRK_CHANNEL]
        and     ch, 0bfh
        push    es
        push    bx
L_0712F:
        call    midi_route_sustain_off
        pop     bx
        pop     es
        xor     byte ptr es:[bx+TRK_CHANNEL], 80h
        ret
ui_yield_07107_13b:
        BC_UI_CTRL 101, 35, 19, 9
bc_int6c_07142:
        INT_6C bc_int5d_0719f, ui_area_161_55b, ui_field_23_61a, NULL_HANDLER_OFS
bc_int5d_0714c:
        INT_5B calls_check_status_flag_596c_071b7
bc_int5d_07150:
        INT_5D calls_system_call_07170
L_07154:
        mov     bp, P_713B
        mov     al, byte ptr [SEL_TRACK]
        sub     ah, ah
        add     ax, 4b0h
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bx, calls_file_operation_07175
        mov     cx, 0c8h
        mov     dx, 1
calls_set_mode_flag_0_0716c:
        call    set_mode_flag_0
        ret
calls_system_call_07170:
        call    system_call
        jmp     SHORT L_07154
calls_file_operation_07175:
        call    track_mark_used
        cmp     ax, 0c8h
        jb      L_07180
        mov     ax, 0c8h
L_07180:
        cmp     al, 0
        jne     L_07186
        mov     al, 1
L_07186:
        mov     bl, byte ptr [SEL_TRACK]
        sub     bh, bh
        add     bx, 4b0h
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     byte ptr es:[bx], al
        ret
calls_init_with_int50_07198:
        call    main_screen_enter
calls_ui_713b_0719b:
        call    ui_yield_07107_13b
        ret
bc_int5d_0719f:
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
bc_int5d_071a5:
        INT_5D system_call
jmp_close_handler_06_071a9:
        call    L_06B1F
        test    ah, 20h
jmp_close_handler_06_071af:
        jne     calls_check_status_flag_596c_071b4
        jmp     NEAR close_handler_06AA7
calls_check_status_flag_596c_071b4:
        jmp     NEAR close_handler_06B41
calls_check_status_flag_596c_071b7:
        call    seq_edit_allowed
calls_call_with_check_071ba:
        je      calls_call_with_check_071bd
        ret
calls_call_with_check_071bd:
        call    call_with_check
L_071C0:
        call    clamp_edit_range_to_seq_end
L_071C3:
        call    calls_state_update_0dda7
L_071C6:
        call    calls_state_update_0ddb6
        callf   CS1_SEG:edit_velocity_dialog_1D31B
bc_int5d_071ce:
        int     50h
bc_int5d_071d0:
        INT_5D edit_velocity_refresh
bc_int5b_071d4:
        INT_5B calls_init_with_int50_071ed
bc_int67_68_071d8:
        INT_67 calls_init_with_int50_071ed
calls_ui_72b1_071dc:
        INT_68 calls_wait_loop_0746f
calls_ui_72b1_071e0:
        mov     word ptr [UI_SLOT_PAD_HIT], L_0C197
calls_ui_72b1_071e6:
        call    ui_notes_______2b1
calls_dispatch_int6d_6e_071e9:
        call    dispatch_int6d_6e
        ret
calls_init_with_int50_071ed:
        call    main_screen_enter
        jmp     NEAR ui_yield_07107_13b
edit_velocity_refresh:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bl, byte ptr [SEL_TRACK]
        sub     bh, bh
        mov     al, 1
        test    byte ptr es:[bx+TRK_CHANNEL], 40h
        jne     L_07209
        mov     al, 0
L_07209:
        mov     byte ptr [G_EDIT_VEL_DRUM], al
status_a_0720C:
        if      FW_VERSION = 172
L_07211                         equ     $+5
        endif
        BC_STATUS_A 86, 16, G_EDIT_OP, TBL_EDIT_OP_LABELS
        mov     dx, word ptr [G_RANGE_START_BEAT_TICKS]
        mov     ax, word ptr [G_RANGE_START_BAR]
        mov     cx, word ptr [G_RANGE_START_TICK]
range_07220:
        BC_RANGE 62, 34
L_07225:
        mov     dx, word ptr [G_RANGE_END_BEAT_TICKS]
        mov     ax, word ptr [G_RANGE_END_BAR]
        mov     cx, word ptr [G_RANGE_END_TICK]
range_07230:
        BC_RANGE 134, 34
notes_1_status_07235:
        mov     al, byte ptr [G_EDIT_VEL_VALUE]
        mov     ah, 0
notes_1_status:
        BC_FIELD 206, 16
L_0723F:
        cmp     byte ptr [G_EDIT_VEL_DRUM], 0
L_07244:
        je      notes_range_display
        jmp     SHORT notes_hit_pad_display
notes_range_display:
        BC_STATUS 26, 43, "Notes:          -             "
notes_hit_pad_status:
        mov     al, byte ptr [G_EDIT_VEL_NOTE_LO]
midi_fmt_sample_display:
        BC_MIDI_FIELD 62, 42
L_07274:
        mov     al, byte ptr [G_EDIT_VEL_NOTE_HI]
midi_fmt_sample_value:
        BC_MIDI_FIELD 134, 42
L_0727C:
        ret
notes_hit_pad_display:
        BC_STATUS 26, 42, "Notes:                  (Hit pad)"
mem_status_072A4:
        mov     al, byte ptr [G_EDIT_DRUM_NOTE]
        mov     ah, byte ptr [G_EDIT_DRUM_PAD]
mem_status_sample_62_42:
        BC_MEM_STATUS 62, 42
ui_ctrl_072b0:
        ret
ui_notes_______2b1:
        BC_UI_CTRL 85, 15, 61, 9
calls_setup_callback_vectors_072b8:
        mov     al, 3
        mov     si, G_EDIT_OP
        if      FW_VERSION = 150
L_07D54                         equ     $+2
        endif
        mov     bx, L_072D4
calls_setup_callback_vectors_072c0:
        call    setup_callback_vectors
bc_int6c_072c3:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_205_2e7, NULL_HANDLER_OFS, ui_input_61_32a
L_072CD:
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
        ret
L_072D4:
        db      3ch, 02h
L_072D6:
        jne     L_072D9
        ret
L_072D9:
        mov     al, byte ptr [G_EDIT_VEL_VALUE]
        cmp     al, 7fh
        jae     ui_ctrl_072e1
        ret
ui_ctrl_072e1:
        mov     byte ptr [G_EDIT_VEL_VALUE], 7fh
        ret
ui_ctrl_205_2e7:
        BC_UI_CTRL 205, 15, 19, 9
bc_int6c_072ee:
        INT_6C ui_notes_______2b1, NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_display_133_372
L_072F8:
        if      FW_VERSION = 150
L_07D8E_V150                    equ     $+1
        endif
        mov     ax, ds
        mov     es, ax
        mov     bp, P_72E7
        mov     ax, P_5837
L_07D97:
        mov     bx, P_730F
        mov     cx, 0c8h
        mov     dx, 1
calls_set_mode_flag_0_0730b:
        call    set_mode_flag_0
        ret
L_0730F:
        mov     bl, 0c8h
        cmp     byte ptr [G_EDIT_OP], 2
        je      L_0731A
        mov     bl, 7fh
L_0731A:
        cmp     al, bl
L_0731C:
        jb      br_07320
        mov     al, bl
br_07320:
        cmp     al, 0
        jne     ui_ctrl_07326
        mov     al, 1
ui_ctrl_07326:
        mov     byte ptr [G_EDIT_VEL_VALUE], al
        ret
ui_input_61_32a:
        BC_UI_CTRL 61, 33, 19, 9
bc_int6c_07331:
        INT_6C NULL_HANDLER_OFS, ui_input_85_342, ui_notes_______2b1, jmp_ui_7451_073ba
ui_ctrl_0733b:
        mov     bp, ui_input_61_32a
        call    L_0D999+9
        ret
ui_input_85_342:
        BC_UI_CTRL 85, 33, 13, 9
bc_int6c_07349:
        INT_6C ui_input_61_32a, ui_display_103_35a, ui_notes_______2b1, jmp_ui_7451_073ba
L_07353:
        mov     bp, ui_input_85_342
ui_ctrl_07356:
        call    L_0D9F9
        ret
ui_display_103_35a:
        BC_UI_CTRL 103, 33, 13, 9
bc_int6c_07361:
        INT_6C ui_input_85_342, ui_display_133_372, ui_notes_______2b1, jmp_ui_7451_073ba
L_0736B:
        mov     bp, ui_display_103_35a
ui_ctrl_0736e:
        call    L_0DA5D
        ret
ui_display_133_372:
        BC_UI_CTRL 133, 33, 19, 9
bc_int6c_07379:
        INT_6C ui_display_103_35a, ui_area_157_38a, ui_notes_______2b1, ui_ctrl_07407
L_07383:
        mov     bp, ui_display_133_372
ui_ctrl_07386:
        call    L_0DAC6
        ret
ui_area_157_38a:
        BC_UI_CTRL 157, 33, 13, 9
bc_int6c_07391:
        INT_6C ui_display_133_372, ui_area_175_3a2, ui_notes_______2b1, ui_ctrl_07407
L_0739B:
        mov     bp, ui_area_157_38a
ui_ctrl_0739e:
        call    L_0DB18
        ret
ui_area_175_3a2:
        BC_UI_CTRL 175, 33, 13, 9
bc_int6c_073a9:
        INT_6C ui_area_157_38a, NULL_HANDLER_OFS, ui_notes_______2b1, ui_ctrl_07407
L_073B3:
        mov     bp, ui_area_175_3a2
L_073B6:
        call    L_0DB7E
        ret
jmp_ui_7451_073ba:
        cmp     byte ptr [G_EDIT_VEL_DRUM], 0
ui_ctrl_073bf:
        je      ui_input_61_3c4
ui_ctrl_073c1:
        jmp     NEAR ui_input_61_451
ui_input_61_3c4:
        BC_UI_CTRL 61, 41, 55, 9
bc_int6c_073cb:
        INT_6A edit_velocity_notes_lo_inc, save_state_073FA
bc_int6c_073d1:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_07407, ui_input_61_32a, NULL_HANDLER_OFS
L_073DB:
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
        ret
edit_velocity_notes_lo_inc:
        mov     al, byte ptr [G_EDIT_VEL_NOTE_LO]
        inc     al
        cmp     al, 7fh
        jb      edit_velocity_notes_lo_inc+11
        mov     al, 7fh
        mov     byte ptr [G_EDIT_VEL_NOTE_LO], al
        cmp     al, byte ptr [G_EDIT_VEL_NOTE_HI]
        jb      L_073F9
        mov     byte ptr [G_EDIT_VEL_NOTE_HI], al
L_073F9:
        ret
save_state_073FA:
        mov     al, byte ptr [G_EDIT_VEL_NOTE_LO]
        sub     al, 1
handler_BC_SAVE_STATE           equ     $+1
        jae     save_state_073FA+9
        mov     al, 0
        mov     byte ptr [G_EDIT_VEL_NOTE_LO], al
        ret
ui_ctrl_07407:
        cmp     byte ptr [G_EDIT_VEL_DRUM], 0
ui_ctrl_0740c:
        jne     ui_input_61_451
ui_display_133_40e:
        BC_UI_CTRL 133, 41, 55, 9
bc_int6c_07415:
        INT_6A edit_velocity_notes_hi_inc, edit_velocity_notes_hi_dec
bc_int6c_0741b:
        INT_6C jmp_ui_7451_073ba, NULL_HANDLER_OFS, ui_display_133_372, NULL_HANDLER_OFS
L_07425:
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
        ret
edit_velocity_notes_hi_inc:
        mov     al, byte ptr [G_EDIT_VEL_NOTE_HI]
        inc     al
        cmp     al, 7fh
        jb      edit_velocity_notes_hi_inc+11
        mov     al, 7fh
        mov     byte ptr [G_EDIT_VEL_NOTE_HI], al
        ret
edit_velocity_notes_hi_dec:
        mov     al, byte ptr [G_EDIT_VEL_NOTE_HI]
        sub     al, 1
        jae     L_07444
        mov     al, 0
L_07444:
        mov     byte ptr [G_EDIT_VEL_NOTE_HI], al
        cmp     al, byte ptr [G_EDIT_VEL_NOTE_LO]
        jae     ui_ctrl_07450
        mov     byte ptr [G_EDIT_VEL_NOTE_LO], al
ui_ctrl_07450:
        ret
ui_input_61_451:
        BC_UI_CTRL 61, 41, 37, 9
bc_int6c_07458:
        INT_6A pad_note_inc, pad_note_dec
bc_int6c_0745e:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_input_61_32a, NULL_HANDLER_OFS
calls_wait_loop_07468:
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
        ret
calls_wait_loop_0746f:
        call    wait_loop
        push    word ptr [SEQ_CUR_BAR]
        push    word ptr [SEQ_BAR_TICK]
        callf   CS1_SEG:seq_edit_end_far
        callf   CS1_SEG:undo_seq_save_far
        callf   CS1_SEG:undo_seq_flag_latch_far
        callf   CS1_SEG:seq_edit_begin_far
        cmp     byte ptr [G_EDIT_VEL_DRUM], 0
        je      L_074AF
        mov     byte ptr [G_EDIT_VEL_NOTE_LO], 0
        mov     byte ptr [G_EDIT_VEL_NOTE_HI], 7fh
        cmp     byte ptr [G_EDIT_DRUM_PAD], 41h
        je      L_074AF
        mov     al, byte ptr [G_EDIT_DRUM_NOTE]
        mov     byte ptr [G_EDIT_VEL_NOTE_LO], al
        mov     byte ptr [G_EDIT_VEL_NOTE_HI], al
L_074AF:
        mov     ax, word ptr [G_RANGE_START_BAR]
        mov     cx, word ptr [G_RANGE_START_TICK]
        callf   CS1_SEG:SEQ_POSITION_SET_FAR_OFS
        les     si, [FP_SEQ_AFTER_GAP]
L_07F54:
        callf   CS1_SEG:SCSI_STATUS_CHECK_FAR_OFS
        cmp     bx, word ptr [G_RANGE_END_BAR]
        ja      br_074ED
        jne     br_074D2
        cmp     cx, word ptr [G_RANGE_END_TICK]
        ja      br_074ED
br_074D2:
        mov     ah, al
        and     ax, 3fc0h
        cmp     al, 0
        jne     L_074E4
        cmp     ah, byte ptr [SEL_TRACK]
        jne     L_074E4
calls_struct_access_074_074e1:
        call    struct_access_074F7
L_074E4:
        db      9ah
L_074E5:
        dw      sequence_data_read_far
        dw      CS1_SEG
        cmp     al, 0ffh
        jne     L_074AF+16
br_074ED:
        pop     cx
        pop     ax
        callf   CS1_SEG:SEQ_POSITION_SET_FAR_OFS
        jmp     NEAR calls_init_with_int50_071ed
L_07F8C:
struct_access_074F7:
        mov     al, byte ptr es:[si+5]
        test    al, 80h
        jne     br_07529
        if      FW_VERSION = 172
handler_BC_STRUCT_ACCESS        equ     $+1
handler_BC_TEST_SIGN            equ     $+2
        endif
        mov     ah, byte ptr es:[si+4]
        and     ah, 7fh
        cmp     ah, byte ptr [G_EDIT_VEL_NOTE_LO]
        jb      br_07529
        cmp     ah, byte ptr [G_EDIT_VEL_NOTE_HI]
        ja      br_07529
        mov     bl, byte ptr [G_EDIT_OP]
        sub     bh, bh
handler_BC_CTRL_FIELD:
        shl     bx, 1
        call    word ptr cs:[bx+TBL_EDIT_VEL_OP]
        cmp     al, 0
        jne     L_07525
        mov     al, 1
L_07FBA:
L_07525:
        mov     byte ptr es:[si+5], al
br_07529:
        ret
TBL_EDIT_VEL_OP:
        dw      edit_vel_add, edit_vel_sub, edit_vel_scale, edit_vel_set
edit_vel_add:
        add     al, byte ptr [G_EDIT_VEL_VALUE]
        cmp     al, 7fh
        jb      L_07FD1
        mov     al, 7fh
L_07FD1:
        ret
edit_vel_sub:
        sub     al, byte ptr [G_EDIT_VEL_VALUE]
        jae     L_07545
        mov     al, 0
L_07545:
        ret
edit_vel_scale:
        mov     ah, byte ptr [G_EDIT_VEL_VALUE]
        mul     ah
        mov     bl, 64h
        div     bl
        cmp     al, 7fh
        jb      L_07556
        mov     al, 7fh
L_07556:
        ret
edit_vel_set:
        mov     al, byte ptr [G_EDIT_VEL_VALUE]
        ret
L_07FF0:
ui_area_161_55b:
        BC_UI_CTRL 161, 35, 19, 9
bc_int6c_07562:
        if      FW_VERSION = 150
L_07FFB                         equ     $+4
        endif
        INT_6C ui_yield_07107_13b, ui_ctrl_077db, ui_ext_display_4_f49, NULL_HANDLER_OFS
bc_int5d_0756c:
        INT_5D calls_system_call_07590
bc_int5b_07570:
        INT_5B calls_check_status_flag_596c_075bb
L_07574:
        mov     bp, L_07FF0
        mov     al, byte ptr [SEL_TRACK]
        sub     ah, ah
        add     ax, 470h
        mov     es, word ptr [CUR_SEQ_SEG]
        if      FW_VERSION = 172
calls_set_mode_flag_0_07585     equ     $+2
        endif
        mov     bx, calls_file_operation_07595
        mov     cx, 80h
        mov     dx, 0
calls_set_mode_flag_0_0758c:
        call    set_mode_flag_0
        ret
calls_system_call_07590:
        call    system_call
        jmp     L_07574
calls_file_operation_07595:
        call    track_mark_used
        mov     bl, byte ptr [SEL_TRACK]
L_08031:
        mov     bh, 0
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     byte ptr es:[bx+470h], al
        sub     al, 1
L_075A9:
        jae     L_075AC
        ret
L_075AC:
        mov     ch, byte ptr es:[bx+TRK_CHANNEL]
        mov     ah, 0c0h
        cli
        callf   CS1_SEG:MIDI_EVENT_ROUTE_OFS
        sti
        ret
calls_check_status_flag_596c_075bb:
        call    seq_edit_allowed
L_075BE:
        je      bc_int6a_075c1
        ret
bc_int6a_075c1:
        callf   CS1_SEG:program_change_dialog
bc_int6a_075c6:
        int     50h
bc_int6a_075c8:
        INT_6A calls_file_operation_075f5, calls_get_es_byte_07604
bc_int5d_075ce:
        INT_5D calls_file_operation_075de
calls_dispatch_int6d_6e_075d2:
        INT_5B calls_init_with_int50_075ef
calls_dispatch_int6d_6e_075d6:
        INT_67 calls_init_with_int50_075ef
calls_dispatch_int6d_6e_075da:
        call    dispatch_int6d_6e
        ret
calls_file_operation_075de:
        call    track_mark_used
        mov     si, 4f0h
calls_get_es_byte_075e4:
        call    get_es_byte
        and     al, 2
value_075E9:
        BC_VALUE 02384h
calls_init_with_int50_075ee:
        ret
calls_init_with_int50_075ef:
        call    main_screen_enter
        jmp     NEAR ui_area_161_55b
calls_file_operation_075f5:
        call    track_mark_used
L_0748A:
        mov     si, 4f0h
calls_get_es_byte_075fb:
        call    get_es_byte
        or      al, 2
        mov     byte ptr es:[si], al
        ret
calls_get_es_byte_07604:
        mov     si, 4f0h
calls_get_es_byte_07607:
        call    get_es_byte
        and     al, 0fdh
        mov     byte ptr es:[si], al
        ret
close_handler_07610:
        BC_PLANE_A
ui_close_07610_613:
        BC_UI_CTRL 225, 30, 19, 9
bc_int6c_0761a:
        INT_6C ui_ext_display_4_f49, NULL_HANDLER_OFS, ui_ctrl_215_aa6, ui_ctrl_077db
bc_int6a_07624:
        INT_6A calls_check_status_flag_596c_07635, calls_check_status_flag_596c_0763f
bc_int5b_0762a:
        INT_5B calls_check_status_flag_596c_07655
calls_check_status_flag_596c_0762e:
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
        ret
calls_check_status_flag_596c_07635:
        call    seq_edit_allowed
L_07638:
        je      calls_check_status_flag_596c_0763b
        ret
calls_check_status_flag_596c_0763b:
        mov     al, 1
        jmp     SHORT calls_call_with_check_07647
calls_check_status_flag_596c_0763f:
        call    seq_edit_allowed
L_07642:
        je      calls_call_with_check_07645
        ret
calls_call_with_check_07645:
        mov     al, 0
calls_call_with_check_07647:
        push    ax
calls_call_with_check_07648:
        call    call_with_check
        pop     ax
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     byte ptr es:[20h], al
        ret
calls_check_status_flag_596c_07655:
        call    seq_edit_allowed
calls_call_with_check_07658:
        je      calls_call_with_check_0765b
        ret
calls_call_with_check_0765b:
        call    call_with_check
        callf   CS1_SEG:LOOP_BARS_DIALOG_OFS
bc_int5d_07663:
        int     50h
bc_int5d_07665:
        INT_5D raw_07678
        if      FW_VERSION = 150
        db      0cdh
        db      67h
        push    76h
        endif
bc_int5b_07669:
        if      FW_VERSION = 172
        INT_67 calls_init_with_int50_077d5
calls_dispatch_int6d_6e_0766d:
        endif
        INT_5B calls_init_with_int50_077d5
calls_dispatch_int6d_6e_07671:
        call    ui_ctrl_076af
calls_dispatch_int6d_6e_07674:
        call    dispatch_int6d_6e
        ret
raw_07678:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ax, word ptr es:[1ch]
        inc     ax
        if      FW_VERSION = 150
L_08118                         equ     $+2
        endif
end_status:
        BC_FIELD 156, 11
end_display:
        BC_STATUS 156, 33, "END"
status_end_0768f:
        mov     ax, word ptr es:[18h]
        mov     bx, word ptr es:[1eh]
        inc     bx
        je      L_076A4
        mov     ax, bx
L_0769D:
        push    ax
raw_0769E:
        BC_FIELD 156, 33
L_076A3:
        pop     ax
L_076A4:
        sub     ax, word ptr es:[1ch]
raw_076A9:
        BC_FIELD 156, 42
L_076AE:
        ret
        if      FW_VERSION = 150
L_08144:
        endif
ui_ctrl_076af:
        INT_6A seq_loop_first_bar_inc, seq_loop_first_bar_dec
ui_end_display_6b5:
        BC_UI_CTRL 154, 10, 21, 9
bc_int6c_076bc:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_ctrl_07701
L_076C6:
        ret
seq_loop_first_bar_inc:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     cx, word ptr es:[18h]
L_08165:
        add     ax, word ptr es:[1ch]
L_0816A:
        cmp     ax, cx
        jb      br_076DC
        mov     ax, cx
        dec     ax
br_076DC:
        mov     word ptr es:[1ch], ax
        cmp     ax, word ptr es:[1eh]
        jb      L_076EB
        mov     word ptr es:[1eh], ax
L_076EB:
        ret
seq_loop_first_bar_dec:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bx, word ptr es:[1ch]
        sub     bx, ax
        jae     bc_int6a_076fb
        sub     bx, bx
bc_int6a_076fb:
        mov     word ptr es:[1ch], bx
        ret
ui_ctrl_07701:
        if      FW_VERSION = 172
        INT_6A tgt_07719, seq_loop_last_bar_dec
        else
        INT_6A L_075AE, seq_loop_last_bar_dec
        endif
ui_end_display_707:
        BC_UI_CTRL 154, 32, 21, 9
bc_int6c_0770e:
        if      FW_VERSION = 172
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_ctrl_076af, ui_ctrl_07765
L_07718:
        ret
        else
        db      0cdh
        insb
        db      0dah
        endif
tgt_07719:
        if      FW_VERSION = 150
        push    cs
        db      0dah
        push    cs
        inc     sp
        jne     tgt_07719
        jne     br_076DC
L_075AE:
        endif
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     cx, word ptr es:[18h]
        add     ax, word ptr es:[1eh]
        jb      L_0772D
        cmp     ax, cx
        jb      L_07730
L_0772D:
        mov     ax, 0ffffh
L_07730:
        mov     word ptr es:[1eh], ax
        ret
seq_loop_last_bar_dec:
        mov     es, word ptr [CUR_SEQ_SEG]
L_075CA:
        mov     bx, word ptr es:[1eh]
        cmp     bx, -1
L_07741:
        je      L_0775B
        sub     bx, ax
        jae     L_07749
        sub     bx, bx
L_07749:
        mov     word ptr es:[1eh], bx
        cmp     bx, word ptr es:[1ch]
        jae     L_0775A
L_081EA:
        mov     word ptr es:[1ch], bx
L_0775A:
        ret
L_0775B:
        mov     ax, word ptr es:[18h]
        dec     ax
        mov     word ptr es:[1eh], ax
        ret
ui_ctrl_07765:
        INT_6A seq_loop_num_bars_inc, seq_loop_num_bars_dec
ui_end_display_76b:
        BC_UI_CTRL 154, 41, 21, 9
bc_int6c_07772:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_ctrl_07701, NULL_HANDLER_OFS
L_0777C:
        ret
seq_loop_num_bars_inc:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     cx, word ptr es:[18h]
        mov     bx, word ptr es:[1eh]
        cmp     bx, -1
        jne     br_07792
        mov     bx, cx
br_07792:
        add     ax, bx
        cmp     ax, cx
        jb      L_0779B
        mov     ax, cx
        dec     ax
L_08230:
L_0779B:
        mov     word ptr es:[1eh], ax
        ret
seq_loop_num_bars_dec:
        mov     bx, ax
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ax, word ptr es:[1eh]
        cmp     ax, 0ffffh
L_077AD:
        je      L_077C5
        sub     ax, bx
L_077B1:
        jae     br_077B5
        sub     ax, ax
br_077B5:
        cmp     ax, word ptr es:[1ch]
        jae     L_077C0
        mov     ax, word ptr es:[1ch]
L_077C0:
        mov     word ptr es:[1eh], ax
L_08259:
        ret
L_077C5:
        mov     ax, word ptr es:[18h]
        sub     ax, 2
L_08261:
        jae     L_077D0
        sub     ax, ax
L_077D0:
        if      FW_VERSION = 172
waiting_midi_play               equ     $+1
        endif
        mov     word ptr es:[1eh], ax
        ret
calls_init_with_int50_077d5:
        call    main_screen_enter
        jmp     NEAR close_handler_07610
ui_ctrl_077db:
        BC_PLANE_A
        if      FW_VERSION = 172
ui_ctrl_077de:
        endif
        BC_UI_CTRL 225, 39, 19, 9
bc_int6c_077e5:
        if      FW_VERSION = 150
ui_ctrl_077de                   equ     $+7
        endif
        INT_6C ui_area_161_55b, NULL_HANDLER_OFS, close_handler_07610, NULL_HANDLER_OFS
calls_setup_callback_vectors_077ef:
        mov     al, 1
        mov     si, G_COUNT_ENABLE
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_077f7:
        call    setup_callback_vectors
bc_int5d_077fa:
        INT_5B calls_check_status_flag_596c_07809
bc_int5d_077fe:
        INT_5D system_call
calls_check_status_flag_596c_07802:
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
        ret
calls_check_status_flag_596c_07809:
        call    seq_edit_allowed
L_0780C:
        je      bc_int5d_0780f
        ret
L_082A4:
bc_int5d_0780f:
        callf   CS1_SEG:countmetronome_dialog
bc_int5d_07814:
        int     50h
bc_int5d_07816:
        INT_5D count_metronome_refresh
bc_int5b_0781a:
        INT_67 calls_init_with_int50_07867
calls_dispatch_int6d_6e_0781e:
        INT_5B calls_init_with_int50_07867
calls_dispatch_int6d_6e_07822:
        call    ui_ctrl_0786d
calls_dispatch_int6d_6e_07825:
        call    dispatch_int6d_6e
        ret
count_metronome_refresh:
        BC_STATUS_A 82, 11, G_COUNT_IN_MODE, TBL_COUNT_IN_LABELS
        db      0a0h, 32h, 0bh
L_07835:
        BC_VALUE 0145eh
L_0783A:
        mov     al, byte ptr [G_METRO_IN_REC]
L_0783D:
        BC_VALUE 01d5eh
L_07842:
        mov     al, byte ptr [D_0B35]
L_07845:
        BC_JUMP 02a6ah
bc_target_0784a:
        BC_STATUS_A 184, 11, G_METRO_RATE, TBL_NOTE_DIV_LABELS
L_07853:
        BC_STATUS_A 184, 29, D_0B34, TBL_OUTPUT_LABELS
        db      0a0h, 30h, 0bh, 2ah, 0e4h
        if      FW_VERSION = 150
L_082F8_V150                         equ     $+2
        endif
L_07861:
        BC_FIELD 184, 20
L_07866:
        ret
calls_init_with_int50_07867:
        call    main_screen_enter
        jmp     NEAR ui_ctrl_077db
ui_ctrl_0786d:
        BC_UI_CTRL 81, 10, 49, 9
bc_int6c_07874:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_078c4, NULL_HANDLER_OFS, ui_ctrl_0788a
calls_setup_callback_vectors_0787e:
        mov     al, 2
        mov     si, G_COUNT_IN_MODE
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_07886:
        call    setup_callback_vectors
        ret
ui_ctrl_0788a:
        BC_UI_CTRL 93, 19, 19, 9
bc_int6c_07891:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_078e1, ui_ctrl_0786d, ui_ctrl_078a7
calls_setup_callback_vectors_0789b:
        mov     al, 1
        mov     si, G_METRO_IN_PLAY
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_078a3:
        call    setup_callback_vectors
        ret
ui_ctrl_078a7:
        BC_UI_CTRL 93, 28, 19, 9
bc_int6c_078ae:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_078fe, ui_ctrl_0788a, ui_ctrl_0791b
calls_setup_callback_vectors_078b8:
        mov     al, 1
        mov     si, G_METRO_IN_REC
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_078c0:
        call    setup_callback_vectors
        ret
ui_ctrl_078c4:
        BC_UI_CTRL 183, 10, 43, 9
bc_int6c_078cb:
        INT_6C ui_ctrl_0786d, NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_ctrl_078e1
calls_setup_callback_vectors_078d5:
        mov     al, 7
        mov     si, G_METRO_RATE
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_078dd:
        call    setup_callback_vectors
ui_ctrl_078e0:
        ret
ui_ctrl_078e1:
        BC_UI_CTRL 183, 19, 19, 9
bc_int6c_078e8:
        INT_6C ui_ctrl_0788a, NULL_HANDLER_OFS, ui_ctrl_078c4, ui_ctrl_078fe
calls_setup_callback_vectors_078f2:
        mov     al, 64h
        mov     si, D_0B30
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_078fa:
        call    setup_callback_vectors
        ret
ui_ctrl_078fe:
        BC_UI_CTRL 183, 28, 43, 9
bc_int6c_07905:
        INT_6C ui_ctrl_078a7, NULL_HANDLER_OFS, ui_ctrl_078e1, ui_ctrl_0791b
calls_setup_callback_vectors_0790f:
        mov     al, 8
        mov     si, D_0B34
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_07917:
        call    setup_callback_vectors
        ret
ui_ctrl_0791b:
        BC_UI_CTRL 105, 41, 19, 9
bc_int6c_07922:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_078fe, ui_ctrl_078a7, NULL_HANDLER_OFS
calls_setup_callback_vectors_0792c:
        mov     al, 1
        mov     si, D_0B35
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_07934:
        call    setup_callback_vectors
        ret
calls_call_with_check_07938:
        push    ax
        push    si
calls_call_with_check_0793a:
        call    call_with_check
        pop     si
        pop     cx
calls_get_es_byte_0793f:
        call    get_es_byte
        add     al, cl
        jb      L_0794A
        cmp     al, ah
        jb      L_0794C
L_0794A:
        mov     al, ah
L_0794C:
        mov     byte ptr es:[si], al
        ret
calls_call_with_check_07950:
        push    ax
        push    si
calls_call_with_check_07952:
        call    call_with_check
        pop     si
        pop     cx
calls_get_es_byte_07957:
        call    get_es_byte
        sub     al, cl
        jae     L_07960
        mov     al, 0
L_07960:
        mov     byte ptr es:[si], al
        ret
get_es_byte:
        mov     bl, byte ptr [SEL_TRACK]
        sub     bh, bh
        add     si, bx
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     al, byte ptr es:[si]
        ret
        if      FW_VERSION = 150
        db      00h
        endif
calls_check_status_flag_596c_07974:
        call    seq_edit_allowed
        je      L_0797A
        ret
L_0797A:
        push    word ptr [SEQ_CUR_BAR]
        push    word ptr [SEQ_BAR_TICK]
        mov     byte ptr [NOTE_VAR_AFTER], 0
        callf   CS1_SEG:error_insufficient_memory_19ea7
        mov     byte ptr [G_STEP_EDIT_ACTIVE], 1
        call    call_with_check
        call    wait_loop
        callf   CS1_SEG:seq_edit_end_far
        callf   CS1_SEG:undo_seq_discard_far
        callf   CS1_SEG:undo_seq_save_far
        callf   CS1_SEG:seq_edit_begin_far
        callf   CS1_SEG:error_insufficient_memory_19ea7
        pop     cx
        pop     ax
        callf   CS1_SEG:SEQ_POSITION_SET_FAR_OFS
        mov     word ptr [G_STEP_PASTE_LEN], 0
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bl, byte ptr [SEL_TRACK]
        mov     bh, 0
        mov     al, byte ptr es:[bx+TRK_CHANNEL]
        mov     byte ptr [G_STEP_TRK_CHANNEL], al
        mov     byte ptr [B_0B1D], 0
        mov     byte ptr [B_5A6E], 0
        mov     byte ptr [SEQ_ODUB_ARMED], 1
        if      FW_VERSION = 172
L_079DE:
        endif
        BC_SEQ_INIT
step_edit_screen_draw:
        BC_CLEAR
view_status_079E4:
        BC_PLANE_A
view_status:
        BC_MEM_COPY 0, 9, 248
view_display:
        BC_STATUS 0, 1, "VIEW:"
now_time_display:
        BC_STATUS 168, 1, "Now:   .  ."
status_now______07a09:
        mov     word ptr [W_5A4C], L_094AE
        mov     word ptr [W_5A4E], W_5A4E_SELF
        mov     word ptr [W_5A50], P_93F6
        mov     word ptr [W_5A52], W_5A52_SELF
        mov     word ptr [W_5A54], W_5A54_SELF
        mov     word ptr [W_5A56], W_5A56_SELF
        mov     byte ptr [G_STEP_NOTES_HELD], 0
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bl, byte ptr [SEL_TRACK]
        sub     bh, bh
        add     bx, 430h
        mov     al, byte ptr es:[bx]
        mov     byte ptr [B_5979], al
        mov     al, byte ptr [G_STEP_DUR_TC_PCT]
        call    L_081B6
        callf   CS1_SEG:event_queues_reset_far
        mov     al, 0
        mov     byte ptr [NOTE_RING_RD], al
        mov     byte ptr [NOTE_RING_WR], al
        callf   CS1_SEG:metronome_rate_update_far
calls_softkey_tc_07a5e:
        call    softkey_tc
        mov     byte ptr [B_597B], 0
L_07A66:
        call    step_edit_refresh
        ret
step_edit_install_transport_handlers:
        INT_6E jmp_init_with_int50_0a124, jmp_init_with_int50_0a124, jmp_init_with_int50_0a124, jmp_init_with_int50_0a124, jmp_init_with_int50_0a124
L_07A76:
        INT_6D step_edit_step_back, step_edit_step_fwd, NULL_HANDLER_OFS, step_edit_bar_back, step_edit_bar_fwd
ui_ctrl_07a82:
        mov     word ptr [W_0EE4], NULL_HANDLER_OFS
        ret
calls_softkey_tc_07a89:
        BC_UI_CTRL 28, 0, 134, 9
calls_softkey_tc_07a90:
        int     50h
calls_softkey_tc_07a92:
        call    softkey_tc
        mov     al, 8
        mov     si, G_STEP_VIEW
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_07a9d:
        call    setup_callback_vectors
        mov     word ptr [UI_SLOT_EXIT], calls_wait_loop_0a12a
bc_int6c_07aa6:
        INT_5C step_edit_idle
bc_int6c_07aaa:
        INT_5B auto_step_increment_status
        if      FW_VERSION = 150
        INT_6C  0edah, step_edit_view_right, 0edah, softkey_tc
        endif
bc_int6c_07aae:
        if      FW_VERSION = 172
        INT_6C NULL_HANDLER_OFS, step_edit_view_right, NULL_HANDLER_OFS, softkey_tc
bc_int5d_07ab8:
        endif
        INT_5D step_edit_refresh
        if      FW_VERSION = 172
bc_int65_07abc:
        INT_64 NULL_HANDLER_OFS
        endif
bc_int67_68_07ac0:
        INT_65 NULL_HANDLER_OFS
bc_int67_68_07ac4:
        INT_66 NULL_HANDLER_OFS
bc_int67_68_07ac8:
        INT_67 step_edit_insert
bc_int67_68_07acc:
        INT_68 NULL_HANDLER_OFS
bc_int69_07ad0:
        INT_69 NULL_HANDLER_OFS
L_07AD4:
        mov     word ptr [D_0DEC], NULL_HANDLER_OFS
        mov     byte ptr [G_STEP_SEL_ACTIVE], 0
L_07ADF:
        call    step_edit_install_transport_handlers
        mov     byte ptr [B_5965], 0
        mov     byte ptr [B_0B1E], 0
        ret
step_edit_idle:
        call    step_edit_idle_poll
        cmp     byte ptr [UI_REDRAW_REQ], 0
L_07AF5:
        jne     L_07AF8
        ret
L_07AF8:
        call    calls_softkey_tc_07a89
        ret
step_edit_refresh:
        BC_CLEAR_RECT 30, 1, 132, 7
L_07B03:
        BC_STATUS_A 30, 1, P_5968, TBL_EVENT_FILTER_NAMES
        cmp     byte ptr [P_5968], 1
L_07B11:
        jne     L_07B66
        test    byte ptr [G_STEP_TRK_CHANNEL], 40h
L_07B18:
        jne     status_display_7B43
status_display_085AC:
status_display_7B1A:
        BC_STATUS 60, 1, "        -        "
L_07B31:
        mov     al, byte ptr [G_STEP_VIEW_NOTE_LO]
midi_fmt_program_display:
        BC_MIDI_FIELD 60, 1
        if      FW_VERSION = 172
L_07B39:
        endif
        mov     al, byte ptr [G_STEP_VIEW_NOTE_HI]
L_07B3C:
        BC_MIDI_FIELD 114, 1
        if      FW_VERSION = 150
L_07B39:
        endif
L_07B41:
        jmp     SHORT L_07B66
status_display_7B43:
        BC_STATUS 60, 1, "                 "
L_07B5A:
        mov     al, byte ptr [G_EDIT_DRUM_NOTE]
        mov     ah, byte ptr [G_EDIT_DRUM_PAD]
L_07B61:
        BC_MEM_STATUS 66, 1
L_07B66:
        cmp     byte ptr [G_STEP_VIEW], 3
        jne     L_07B80
        mov     al, byte ptr [G_STEP_VIEW_CTRL]
        sub     ah, ah
L_07B72:
        BC_FIELD 60, 1
L_07B77:
        BC_STATUS_A 84, 1, P_5964, TBL_MIDI_CC_LABELS
L_07B80:
        mov     byte ptr [G_STEP_CURSOR_ROW], 0
        mov     byte ptr [G_STEP_LIST_TOP], 0
        les     si, [FP_SEQ_AFTER_GAP]
        mov     word ptr [W_597E], si
        mov     word ptr [W_5980], es
L_07B96:
        call    step_edit_event_list_draw
        ret
step_edit_view_right:
        cmp     byte ptr [G_STEP_VIEW], 1
        je      step_edit_view_notes_field
        cmp     byte ptr [G_STEP_VIEW], 3
ui_ctrl_07ba6:
        je      ui_ctrl_07bab
ui_ctrl_07ba8:
        jmp     NEAR ui_ctrl_07fb8
L_0863D:
ui_ctrl_07bab:
        BC_UI_CTRL 58, 0, 98, 9
calls_setup_callback_vectors_07bb2:
        mov     al, 7fh
        mov     si, g_step_view_ctrl
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_07bba:
        call    setup_callback_vectors
bc_int6c_07bbd:
        INT_6C calls_softkey_tc_07a89, ui_ctrl_07fb8, NULL_HANDLER_OFS, softkey_tc
bc_int5c_07bc7:
        INT_5C step_edit_view_arg_idle
L_07BCB:
        ret
step_edit_view_arg_idle:
        call    step_edit_idle_poll
        cmp     byte ptr [UI_REDRAW_REQ], 0
L_07BD4:
        jne     L_07BD7
        ret
L_07BD7:
        call    calls_softkey_tc_07a89
        cmp     byte ptr [G_STEP_VIEW], 0
L_07BDF:
        jne     step_edit_view_right
        ret
step_edit_view_notes_field:
        test    byte ptr [G_STEP_TRK_CHANNEL], 40h
ui_ctrl_07be7:
        je      ui_ctrl_07bec
ui_ctrl_07be9:
        jmp     NEAR ui_ctrl_07c92
ui_ctrl_07bec:
        BC_UI_CTRL 59, 0, 49, 9
bc_int6c_07bf3:
        INT_6A step_edit_view_note_lo_inc, step_edit_view_note_lo_dec
bc_int6c_07bf9:
        INT_6C calls_softkey_tc_07a89, ui_ctrl_07c3f, NULL_HANDLER_OFS, softkey_tc
bc_int5c_07c03:
        INT_5C step_edit_view_note_lo_idle
L_07C07:
        ret
step_edit_view_note_lo_idle:
        call    step_edit_idle_poll
        cmp     byte ptr [UI_REDRAW_REQ], 0
L_07C10:
        jne     L_07C13
        ret
L_07C13:
        call    calls_softkey_tc_07a89
        call    step_edit_view_notes_field
        ret
step_edit_view_note_lo_inc:
        mov     al, byte ptr [G_STEP_VIEW_NOTE_LO]
        inc     al
        cmp     al, 7fh
        jb      step_edit_view_note_lo_inc+11
L_07C24                         equ     $+1
        mov     al, 7fh
        mov     byte ptr [G_STEP_VIEW_NOTE_LO], al
        cmp     al, byte ptr [G_STEP_VIEW_NOTE_HI]
        jb      L_07C31
        mov     byte ptr [G_STEP_VIEW_NOTE_HI], al
L_07C31:
        ret
step_edit_view_note_lo_dec:
        mov     al, byte ptr [G_STEP_VIEW_NOTE_LO]
        sub     al, 1
        jae     ui_ctrl_07c3b
        mov     al, 0
ui_ctrl_07c3b:
        mov     byte ptr [G_STEP_VIEW_NOTE_LO], al
        ret
ui_ctrl_07c3f:
        BC_UI_CTRL 113, 0, 49, 9
bc_int6c_07c46:
        INT_6A step_edit_view_note_hi_inc, step_edit_view_note_hi_dec
bc_int6c_07c4c:
        INT_6C step_edit_view_notes_field, ui_ctrl_07fb8, NULL_HANDLER_OFS, softkey_tc
bc_int5c_07c56:
        INT_5C step_edit_view_note_hi_idle
L_07C5A:
        ret
step_edit_view_note_hi_idle:
        call    step_edit_idle_poll
        cmp     byte ptr [UI_REDRAW_REQ], 0
L_07C63:
        jne     L_07C66
        ret
L_07C66:
        call    calls_softkey_tc_07a89
L_07C69:
        call    ui_ctrl_07c3f
        ret
step_edit_view_note_hi_inc:
        mov     al, byte ptr [G_STEP_VIEW_NOTE_HI]
        inc     al
        cmp     al, 7fh
        jb      L_07C78
        mov     al, 7fh
L_07C78:
        mov     byte ptr [G_STEP_VIEW_NOTE_HI], al
        ret
step_edit_view_note_hi_dec:
        mov     al, byte ptr [G_STEP_VIEW_NOTE_HI]
        sub     al, 1
        jae     L_07C85
        mov     al, 0
L_07C85:
        mov     byte ptr [G_STEP_VIEW_NOTE_HI], al
        cmp     al, byte ptr [G_STEP_VIEW_NOTE_LO]
        jae     ui_ctrl_07c91
        mov     byte ptr [G_STEP_VIEW_NOTE_LO], al
ui_ctrl_07c91:
        ret
L_08724:
ui_ctrl_07c92:
        BC_UI_CTRL 65, 0, 37, 9
bc_int6c_07c99:
        INT_6A step_edit_view_pad_inc, step_edit_view_pad_dec
bc_int6c_07c9f:
        INT_6C calls_softkey_tc_07a89, ui_ctrl_07fb8, NULL_HANDLER_OFS, softkey_tc
bc_int5c_07ca9:
        mov     word ptr [UI_SLOT_PAD_HIT], L_07CD5
bc_int5c_07caf:
        INT_5C step_edit_view_arg_idle
L_07CB3:
        ret
step_edit_view_pad_inc:
        call    pad_note_inc
L_07CB7:
        mov     al, byte ptr [G_EDIT_DRUM_NOTE]
        cmp     al, 0
L_07CBC:
        je      L_07CC5
        mov     byte ptr [G_STEP_VIEW_NOTE_LO], al
        mov     byte ptr [G_STEP_VIEW_NOTE_HI], al
        ret
L_07CC5:
        mov     byte ptr [G_STEP_VIEW_NOTE_LO], 0
        mov     byte ptr [G_STEP_VIEW_NOTE_HI], 7fh
        ret
step_edit_view_pad_dec:
        call    pad_note_dec
        jmp     SHORT L_07CB7
L_07CD5:
        call    L_0C197
        cmp     byte ptr [G_EDIT_DRUM_NOTE], 23h
L_07CDD:
        jae     L_07CE0
        ret
L_07CE0:
        cmp     byte ptr [G_EDIT_DRUM_NOTE], 63h
L_07CE5:
        jb      L_07CE8
        ret
L_07CE8:
        jmp     SHORT L_07CB7
step_dialog_idle:
        mov     bl, byte ptr [NOTE_RING_WR]
        mov     byte ptr [NOTE_RING_RD], bl
L_07CF2:
        call    L_09149
L_07CF5:
        call    L_09166
        ret
step_edit_idle_poll:
        call    step_edit_note_ring_poll
L_07CFC:
        call    L_09023
        cmp     byte ptr [G_STEP_LIST_DIRTY], 0
L_07D04:
        je      L_07D0D
        mov     byte ptr [G_STEP_LIST_DIRTY], 0
        jmp     SHORT L_07D2B
L_07D0D:
        sub     ax, ax
        xchg    byte ptr [G_POS_REDRAW_REQ], al
        or      al, al
L_07D15:
        jne     L_07D18
        ret
L_07D18:
        BC_PLANE_A
L_07D1B:
        mov     ax, word ptr [SEQ_CUR_BAR]
        mov     cx, word ptr [SEQ_BAR_TICK]
        mov     dl, byte ptr [SEQ_BEAT_TICKS]
L_07D26:
        BC_RANGE 192, 1
L_07D2B:
        call    step_edit_event_list_draw
        mov     byte ptr [UI_REDRAW_REQ], 1
        ret
step_edit_event_list_draw:
        BC_PLANE_A
L_07D37:
        mov     ax, word ptr [SEQ_CUR_BAR]
        mov     cx, word ptr [SEQ_BAR_TICK]
        mov     dl, byte ptr [SEQ_BEAT_TICKS]
L_07D42:
        BC_RANGE 192, 1
L_07D47:
        BC_CLEAR_RECT 0, 10, 248, 41
L_07D4E:
        call    step_edit_build_event_list
        mov     word ptr [W_5A4A], calls_get_screen_position_07f4e
        mov     al, byte ptr [G_STEP_LIST_TOP]
        mov     ah, 0
        shl     ax, 3
        add     ax, P_5986
        push    ax
        mov     di, ax
        mov     cx, 0
L_07D68:
        mov     al, cl
        shl     al, 3
L_07D6D:
        BC_SEQ_EDIT
L_07D70:
        mov     si, word ptr [di]
        mov     es, word ptr [di+2]
        mov     bx, word ptr [di+4]
L_07D78:
        pusha
L_07D79:
        call    step_edit_is_selected
        popa
        mov     ax, word ptr [di]
        or      ax, word ptr [di+2]
L_07D82:
        je      L_07D8E
        add     di, 8
        inc     cl
        cmp     cl, 5
        jne     L_07D68
L_07D8E:
        BC_PLANE_A
tgt_07D91:
        pop     di
        mov     al, byte ptr [G_STEP_CURSOR_ROW]
        mov     ah, 0
        shl     ax, 3
        add     di, ax
        mov     si, word ptr [di]
        mov     es, word ptr [di+2]
        mov     ax, word ptr [di+6]
        mov     word ptr [STEP_EVENT_PTR], si
        mov     word ptr [STEP_EVENT_SEG], es
        mov     word ptr [W_5A4A], ax
        ret
step_edit_is_selected:
        push    bx
        push    si
        push    es
        cmp     byte ptr [G_STEP_SEL_ACTIVE], 0
        je      L_07DD8
        mov     ax, word ptr [G_STEP_SEL_START]
        mov     bx, word ptr [G_STEP_SEL_END]
        cmp     ax, bx
L_07DC3:
        jb      L_07DC6
        xchg    bx, ax
L_07DC6:
        cmp     di, ax
        jb      L_07DD8
        cmp     bx, di
        jb      L_07DD8
L_07DCE:
        BC_UI_5E 0, 10, 194, 9
L_07DD5:
        BC_LCD_ATTR_FC
L_07DD8:
        pop     es
        pop     si
        pop     bx
        call    bx
L_07DDD:
        BC_LCD_ATTR_0
L_07DE0:
        ret
step_edit_build_event_list:
        mov     ax, ds
        mov     es, ax
        sub     ax, ax
        mov     di, P_5986
        push    di
        mov     cx, 50h
        rep stosw
        pop     di
        les     si, [FP_SEQ_AFTER_GAP]
        cmp     byte ptr es:[si], 0c0h
        je      br_07E22
L_07DFB:
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
L_07E00:
        je      br_07E27
L_07E02:
        call    fn_0A30F
L_07E05:
        jne     br_07E27
        push    di
L_07E08:
        call    fn_07E34
        pop     di
        jae     br_07E22
        mov     word ptr [di], si
        mov     word ptr [di+2], es
        mov     word ptr [di+4], bx
        mov     word ptr [di+6], dx
        add     di, 8
        cmp     di, P_5A26
L_07E20:
        je      br_07E27
br_07E22:
        call    fn_07F5F
        jmp     SHORT L_07DFB
br_07E27:
        mov     ax, calls_get_screen_position_07f4d
        mov     word ptr [di+4], ax
        mov     ax, calls_get_screen_position_07f4e
        mov     word ptr [di+6], ax
        ret
fn_07E34:
        call    L_07E4D
        cmp     cl, 0
        je      br_07E49
        cmp     byte ptr [G_STEP_VIEW], 0
        je      br_07E4B
        cmp     cl, byte ptr [G_STEP_VIEW]
        je      br_07E4B
br_07E49:
        clc
        ret
br_07E4B:
        stc
        ret
L_07E4D:
        mov     cl, 0
        test    byte ptr es:[si+5], 80h
L_07E54:
        je      L_07E57
        ret
L_07E57:
        mov     al, byte ptr es:[si]
        cmp     al, 0c1h
L_07E5C:
        jne     br_07E67
        mov     bx, P_9C77
        mov     dx, W_5A56_JMP
        mov     cl, 7
        ret
br_07E67:
        mov     cl, 0
        mov     ah, al
        and     ax, 3fc0h
        cmp     ah, byte ptr [SEL_TRACK]
        je      L_07E75
        ret
L_07E75:
        cmp     al, 0
        jne     L_07EAA
        cmp     byte ptr [G_STEP_VIEW], 0
L_07E7E:
        je      br_07E94
        mov     al, byte ptr es:[si+4]
        and     al, 7fh
        cmp     al, byte ptr [G_STEP_VIEW_NOTE_LO]
        jae     L_07E8D
        ret
L_07E8D:
        cmp     al, byte ptr [G_STEP_VIEW_NOTE_HI]
L_07E91:
        jbe     br_07E94
        ret
br_07E94:
        mov     bx, P_9613
        mov     dx, W_5A4C_JMP
        test    byte ptr [G_STEP_TRK_CHANNEL], 40h
        je      br_07EA7
        mov     bx, P_9469
        mov     dx, W_5A50_JMP
br_07EA7:
        mov     cl, 1
        ret
L_07EAA:
        cmp     al, 40h
L_07EAC:
        je      L_07EB1
        jmp     NEAR L_07F44
L_07EB1:
        mov     al, byte ptr es:[si+3]
        and     al, 0f0h
        cmp     al, 80h
        jne     br_07EEC
        cmp     byte ptr [G_STEP_VIEW], 0
L_07EC0:
        je      br_07ED6
        mov     al, byte ptr es:[si+4]
        and     al, 7fh
        cmp     al, byte ptr [G_STEP_VIEW_NOTE_LO]
        jae     L_07ECF
        ret
L_07ECF:
        cmp     al, byte ptr [G_STEP_VIEW_NOTE_HI]
L_07ED3:
        jbe     br_07ED6
        ret
br_07ED6:
        mov     bx, P_9308
        mov     dx, W_5A4E_SELF-4
        test    byte ptr [G_STEP_TRK_CHANNEL], 40h
        jne     br_07EE9
        mov     bx, P_9610
        mov     dx, P_9497
br_07EE9:
        mov     cl, 1
        ret
br_07EEC:
        cmp     al, 0a0h
        jne     L_07EF9
        mov     bx, P_96D6
        mov     dx, W_5A52_SELF-4
        mov     cl, 6
        ret
L_07EF9:
        cmp     al, 0b0h
        jne     br_07F1A
        cmp     byte ptr [G_STEP_VIEW], 0
L_07F02:
        je      br_07F11
        mov     al, byte ptr es:[si+4]
        and     al, 7fh
        cmp     al, byte ptr [G_STEP_VIEW_CTRL]
L_07F0E:
        je      br_07F11
        ret
br_07F11:
        mov     bx, control_change_display
        mov     dx, W_5A54_SELF-4
        mov     cl, 3
        ret
br_07F1A:
        cmp     al, 0c0h
        jne     L_07F27
        mov     bx, P_9805
        mov     dx, P_97E1
        mov     cl, 4
        ret
L_07F27:
        cmp     al, 0d0h
L_07F29:
        jne     L_07F34
        mov     bx, P_985B
        mov     dx, P_9837
        mov     cl, 5
        ret
L_07F34:
        cmp     al, 0e0h
L_07F36:
        jne     br_07F41
        mov     bx, P_990B
        mov     dx, P_9889
        mov     cl, 2
        ret
br_07F41:
        mov     cl, 0
        ret
L_07F44:
        mov     bx, P_9A59
        mov     dx, P_9964
        mov     cl, 8
        ret
calls_get_screen_position_07f4d:
        ret
calls_get_screen_position_07f4e:
        call    get_screen_position
        mov     cl, 5
        mov     dl, 7
L_07F55:
        BC_UI_84
        INT_6A  NULL_HANDLER_OFS, NULL_HANDLER_OFS
        db      0c3h
fn_07F5F:
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
        jne     L_07F67
        ret
L_07F67:
        and     al, 0c0h
        cmp     al, 80h
L_07F6B:
        je      L_07F7E
        mov     ah, byte ptr es:[si+3]
        and     ah, 0f0h
L_07F74:
        cmp     ax, 8040h
L_07F77:
        jne     seq_event_ptr_next_si
L_07F79:
        call    seq_event_ptr_next_si
        jmp     SHORT seq_event_ptr_next_si
L_07F7E:
        call    seq_event_ptr_next_si
        mov     al, byte ptr es:[si]
        cmp     al, 0c2h
L_07F86:
        jne     L_07F7E
seq_event_ptr_next_si:
        mov     cx, es
        add     si, 6
        cmp     si, 10h
        jb      L_07F98
        sub     si, 10h
        inc     cx
        mov     es, cx
L_07F98:
        ret
L_07F99:
        les     si, [FP_SEQ_AFTER_GAP]
L_07F9D:
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
        je      br_07FB3
        cmp     al, 0c0h
L_07FA6:
        je      br_07FAE
L_07FA8:
        call    fn_07E34
L_07FAB:
        jae     br_07FAE
        ret
br_07FAE:
        call    fn_07F5F
        jmp     SHORT L_07F9D
br_07FB3:
        clc
        ret
ui_ctrl_07fb5:
        call    calls_softkey_tc_07a89
ui_ctrl_07fb8:
        BC_UI_CTRL 191, 0, 19, 9
bc_int6c_07fbf:
        BC_CLEAR_RECT 191, 8, 19, 1
bc_int6c_07fc6:
        INT_6C step_edit_now_bar_left, ui_ctrl_0801f, NULL_HANDLER_OFS, softkey_tc
bc_int5d_07fd0:
        INT_5D step_edit_refresh
bc_int5c_07fd4:
        mov     word ptr [UI_SLOT_PAD_HIT], NULL_HANDLER_OFS
bc_int5c_07fda:
        INT_5C step_edit_now_bar_idle
L_07FDE:
        mov     ax, ds
        mov     es, ax
        mov     byte ptr [B_0B1E], 0
        mov     ax, SEQ_CUR_BAR
        mov     bx, L_01F30
        mov     cx, 3e7h
        sub     dx, dx
        mov     bp, ui_ctrl_07fb8
        call    bc_int6a_0de38
calls_calc_bar_beat_07ff8:
        call    calc_bar_beat
        ret
step_edit_now_bar_idle:
        call    L_08002
L_07FFF:
        jb      ui_ctrl_07fb8
        ret
L_08002:
        call    step_edit_note_ring_poll
L_08005:
        call    L_09023
        mov     al, 0
        xchg    byte ptr [D_596D], al
        cmp     al, 0
        jne     L_08013
        ret
L_08013:
        cmp     al, 2
L_08015:
        jne     L_0801A
L_08017:
        call    step_edit_event_list_draw
L_0801A:
        BC_FLUSH
        db      0f9h, 0c3h
ui_ctrl_0801f:
        BC_UI_CTRL 215, 0, 13, 9
bc_int6c_08026:
        BC_CLEAR_RECT 215, 8, 13, 1
bc_int6c_0802d:
        INT_6C ui_ctrl_07fb8, ui_ctrl_0806b, NULL_HANDLER_OFS, softkey_tc
bc_int5d_08037:
        INT_5D step_edit_refresh
bc_int5c_0803b:
        INT_5C step_edit_now_beat_idle
L_0803F:
        mov     ax, ds
        mov     es, ax
        mov     ax, NOW_BEAT_IDX
        mov     bx, L_01F91
        mov     cl, byte ptr [SEQ_TSIG_NUM]
        mov     ch, 0
        sub     dx, dx
        mov     bp, ui_ctrl_0801f
calls_set_mode_flag_1_08054:
        call    set_mode_flag_1
        ret
step_edit_now_beat_idle:
        call    L_08002
L_0805B:
        jb      ui_ctrl_0801f
        ret
step_edit_now_bar_left:
        cmp     byte ptr [G_STEP_VIEW], 3
L_08063:
        jne     ui_ctrl_08068
        jmp     NEAR ui_ctrl_07bab
ui_ctrl_08068:
        jmp     NEAR calls_softkey_tc_07a89
ui_ctrl_0806b:
        BC_UI_CTRL 233, 0, 13, 9
bc_int6c_08072:
        BC_CLEAR_RECT 233, 8, 13, 1
bc_int6c_08079:
        INT_6C ui_ctrl_0801f, NULL_HANDLER_OFS, NULL_HANDLER_OFS, softkey_tc
bc_int6a_08083:
        INT_6A step_edit_step_fwd, step_edit_step_back
bc_int5d_08089:
        INT_5C auto_step_increment_status_080AC
bc_int5d_0808d:
        INT_5D step_edit_refresh
L_08091:
        mov     byte ptr [B_0B1E], 0
        mov     ax, ds
        mov     es, ax
        mov     ax, NOW_BEAT_CLOCK
        mov     bx, L_02000
        mov     cx, 63h
        sub     dx, dx
        mov     bp, ui_ctrl_0806b
handler_BC_MODE_FLAG:
        call    set_mode_flag_0
        ret
auto_step_increment_status_080AC:
        call    L_08002
step_edit_options_dialog:
        jb      ui_ctrl_0806b
        ret
auto_step_increment_status:
        cmp     byte ptr [G_STEP_NOTES_HELD], 0
        je      step_edit_options_dialog_080BA
        ret
step_edit_options_dialog_08B4C:
step_edit_options_dialog_080BA:
        BC_FILE_DIALOG 29, 2, 190, 58, "Step Edit Options"
auto_step_increment_display:
        BC_STATUS 37, 16, "Auto step increment:"
duration_recorded_notes:
        BC_STATUS 37, 32, "Duration of recorded notes:"
softkey_close_810E:
        BC_SOFTKEY 5, BC_SK_FILL,  "CLOSE"
softkey_close_08119:
        int     50h
bc_int5d_0811b:
        mov     word ptr [UI_SLOT_EXIT], calls_wait_loop_0a12a
bc_int5d_08121:
        INT_5D step_edit_options_refresh
bc_int5b_08125:
        INT_68 step_edit_options_close
bc_int5b_08129:
        INT_5B step_edit_options_close
bc_int5c_0812d:
        INT_5C step_dialog_idle
L_08131:
        call    calls_setup_callback_vectors_08155
paste_event_dialog              equ     $+1
        mov     byte ptr [G_STEP_SEL_ACTIVE], 0
        mov     byte ptr [B_0B1E], 0
        ret
step_edit_options_close:
        cmp     byte ptr [B_5965], 0
        if      FW_VERSION = 172
L_08144:
        endif
        jne     jmp_softkey_tc_0814c
L_08146:
        call    step_edit_screen_draw
L_08149:
        jmp     NEAR calls_softkey_tc_07a89
jmp_softkey_tc_0814c:
        call    step_edit_screen_draw
jmp_softkey_tc_0814f:
        call    step_edit_refresh
jmp_softkey_tc_08152:
        jmp     NEAR softkey_tc
calls_setup_callback_vectors_08155:
        mov     al, 1
        mov     si, G_STEP_AUTO_INC
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_0815d:
        call    setup_callback_vectors
ui_ctrl_08160:
        INT_62 NULL_HANDLER_OFS
ui_ctrl_08164:
        INT_63 ui_ctrl_08170
ui_ctrl_08168:
        BC_UI_CTRL 156, 15, 19, 9
ui_ctrl_0816f:
        ret
ui_ctrl_08170:
        BC_UI_CTRL 48, 39, 55, 9
calls_setup_callback_vectors_08177:
        mov     al, 1
        mov     si, G_STEP_DUR_MODE
        mov     bx, L_0818D
calls_setup_callback_vectors_0817f:
        call    setup_callback_vectors
bc_int62_08182:
        INT_62 calls_setup_callback_vectors_08155
bc_int63_08186:
        INT_63 NULL_HANDLER_OFS
L_0818A:
        mov     al, byte ptr [G_STEP_DUR_MODE]
L_0818D:
        or      al, al
bc_int61_0818f:
        jne     ui_ctrl_08196
bc_int61_08191:
        INT_61 NULL_HANDLER_OFS
bc_int61_08195:
        ret
ui_ctrl_08196:
        if      FW_VERSION = 150
ui_ctrl_0819a                   equ     $+4
        endif
        INT_61 ui_ctrl_0819b
        if      FW_VERSION = 172
ui_ctrl_0819a:
        endif
        ret
ui_ctrl_0819b:
        BC_UI_CTRL 102, 39, 25, 9
calls_setup_callback_vectors_081a2:
        mov     al, 64h
        mov     si, G_STEP_DUR_TC_PCT
        mov     bx, L_081B6
calls_setup_callback_vectors_081aa:
        call    setup_callback_vectors
bc_int61_081ad:
        INT_61 NULL_HANDLER_OFS
bc_int60_081b1:
        INT_60 ui_ctrl_08170
L_081B5:
        ret
L_081B6:
        cmp     al, 0
        jne     L_081BF
L_08C4C:
        mov     al, 1
        mov     byte ptr [G_STEP_DUR_TC_PCT], al
L_081BF:
        push    ax
L_08C52:
        callf   CS1_SEG:P_7211
        pop     bx
        mul     bl
        mov     bl, 64h
        div     bl
        cmp     al, 0
        jne     L_081D2
        mov     al, 1
L_081D2:
        sub     ah, ah
        mov     word ptr [G_STEP_DUR_TICKS], ax
        ret
        if      FW_VERSION = 150
L_08C70                         equ     $+6
        endif
step_edit_options_refresh:
        mov     al, byte ptr [G_STEP_AUTO_INC]
L_081DB:
        BC_VALUE 0109dh
L_081E0:
        if      FW_VERSION = 172
L_081E5                         equ     $+5
        BC_STATUS_A 49, 40, P_5A77, TBL_TC_VELOCITY_LABELS
        else
        BC_STATUS_A 49, 40, G_STEP_DUR_MODE, TBL_TC_VELOCITY_LABELS
        endif
        db      80h
        db      3eh
        if      FW_VERSION = 172
        ja      bc_int65_08247
        else
        db      69h
        db      5ah
        endif
        add     byte ptr [di+1], dh
        ret
L_081F1:
        mov     al, byte ptr [G_STEP_DUR_TC_PCT]
        sub     ah, ah
L_081F6:
        BC_FIELD 103, 40
L_081FB:
        ret
softkey_tc:
        if      FW_VERSION = 172
        BC_SOFTKEY 1, BC_SK_BOX,   "TC"
        else
softkey_copy_08C8E:
        endif
softkey_copy_8204:
        BC_SOFTKEY 2, BC_SK_BOX,   "COPY"
softkey_delete_820E:
        BC_SOFTKEY 3, BC_SK_BOX,   "DELETE"
softkey_paste:
        BC_SOFTKEY 5, BC_SK_BOX,   "PASTE"
softkey_play:
        BC_SOFTKEY 6, BC_SK_BOX,   " PLAY "
softkey_play_08231:
        int     50h
bc_int6c_08233:
        mov     word ptr [UI_SLOT_EXIT], calls_wait_loop_0a12a
bc_int6c_08239:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, step_edit_event_up, step_edit_event_down
bc_int5d_08243:
        INT_5D jmp_word_082f1
        if      FW_VERSION = 172
bc_int65_08247:
        INT_64 value_status
bc_int67_68_0824b:
        endif
        INT_65 calls_get_table_status_085ab
bc_int67_68_0824f:
        INT_66 step_edit_delete
bc_int67_68_08253:
        INT_68 step_edit_paste
bc_int69_08257:
        INT_69 step_edit_play
bc_int5c_0825b:
        if      FW_VERSION = 150
L_08CE3                         equ     $+2
        endif
        INT_5C step_edit_idle_poll
bc_int62_0825f:
        mov     word ptr [W_0DC8], calls_get_table_status_084a9
bc_int62_08265:
        INT_62 step_edit_event_up
bc_int5b_08269:
        INT_63 step_edit_event_down
bc_int5b_0826d:
        call    step_edit_install_transport_handlers
bc_int5b_08270:
        INT_5B auto_step_increment_status
L_08274:
        call    step_edit_state_reset
        mov     byte ptr [B_5965], 1
        mov     byte ptr [B_0B1E], 1
        ret
softkey_insert:
SOFTKEY_INSERT_V150:
        BC_SOFTKEY 4, BC_SK_BOX,   "INSERT"
softkey_paste_828E:
        BC_SOFTKEY 5, BC_SK_BOX,   "PASTE"
softkey_play_8299:
        BC_SOFTKEY 6, BC_SK_BOX,   " PLAY "
softkey_play_082a5:
        INT_67 step_edit_insert
bc_int67_68_082a9:
        INT_68 step_edit_paste
bc_int69_082ad:
        INT_69 step_edit_play
L_082B1:
        mov     byte ptr [G_STEP_SEL_ACTIVE], 0
        ret
step_edit_state_reset:
        sub     ax, ax
        mov     byte ptr [G_STEP_CURSOR_ROW], al
        mov     byte ptr [G_STEP_LIST_TOP], al
        mov     byte ptr [G_STEP_SYSEX_COL], al
        mov     word ptr [G_STEP_SYSEX_SCROLL], ax
        mov     byte ptr [G_STEP_SEL_ACTIVE], al
        les     si, [FP_SEQ_AFTER_GAP]
        mov     word ptr [W_597E], si
        mov     word ptr [W_5980], es
calls_get_table_status_082d4:
        call    get_table_status
        mov     word ptr [G_STEP_SEL_START], si
        mov     word ptr [G_STEP_SEL_END], si
calls_softkey_insert_082df:
        call    softkey_insert
        ret
screen_handler:
        callf   CS1_SEG:TIMER_CHECK_FAR_OFS
        callf   CS1_SEG:P_726D
jmp_word_082ed:
        call    step_edit_state_reset
        ret
jmp_word_082f1:
        call    step_edit_event_list_draw
        jmp     word ptr [W_5A4A]
step_edit_event_up:
        cmp     byte ptr [G_SHIFT_HELD], 0
L_082FD:
        je      L_08302
        jmp     L_08512
L_08302:
        cmp     byte ptr [G_STEP_CURSOR_ROW], 0
calls_get_table_status_08307:
        je      L_0831C
        dec     byte ptr [G_STEP_CURSOR_ROW]
calls_get_table_status_0830d:
        call    get_table_status
        mov     byte ptr [G_STEP_SYSEX_COL], 0
        mov     word ptr [G_STEP_SYSEX_SCROLL], 0
        ret
L_0831C:
        cmp     byte ptr [G_STEP_LIST_TOP], 0
L_08321:
        je      L_08329
        dec     byte ptr [G_STEP_LIST_TOP]
        jmp     SHORT calls_get_table_status_0830d
L_08329:
        cmp     byte ptr [G_SHIFT_HELD], 0
L_0832E:
        jne     L_08333
        jmp     calls_softkey_tc_07a89
L_08333:
        ret
step_edit_event_down:
        cmp     byte ptr [G_SHIFT_HELD], 0
L_08339:
        je      L_0833E
        jmp     calls_get_table_status_08539
L_0833E:
        mov     byte ptr [G_STEP_SYSEX_COL], 0
        mov     word ptr [G_STEP_SYSEX_SCROLL], 0
calls_get_table_status_08349:
        cmp     byte ptr [G_STEP_CURSOR_ROW], 4
        je      calls_get_table_status_0835b
        call    get_table_status
        jne     calls_get_table_status_08356
        ret
calls_get_table_status_08356:
        inc     byte ptr [G_STEP_CURSOR_ROW]
        ret
calls_get_table_status_0835b:
        call    get_table_status
        jne     br_08361
        ret
br_08361:
        inc     byte ptr [G_STEP_LIST_TOP]
        ret
get_table_status:
        mov     al, byte ptr [G_STEP_CURSOR_ROW]
        add     al, byte ptr [G_STEP_LIST_TOP]
        shl     al, 3
        sub     ah, ah
        add     ax, P_5986
        mov     si, ax
        mov     ax, word ptr [si]
        or      ax, word ptr [si+2]
        ret
calls_get_table_status_0837d:
        call    calls_get_table_status_08349
calls_get_table_status_08380:
        call    get_table_status
value_status_08383:
        jne     calls_get_table_status_0837d
        ret
get_screen_position:
        mov     ch, byte ptr [G_STEP_CURSOR_ROW]
        shl     ch, 3
        add     ch, 0ah
        mov     dh, 9
        ret
        if      FW_VERSION = 172
value_status:
        BC_FILE_DIALOG 77, 20, 100, 21, ""
        db      00h
value_display:
        BC_STATUS 87, 27, "Value:"
status_value_083a8:
        BC_UI_CTRL 122, 26, 43, 9
bc_int5d_083af:
        INT_5D L_083C5
calls_setup_callback_vectors_083b3:
        mov     al, 6
        mov     si, G_TC_NOTE_VALUE
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_083bb:
        call    setup_callback_vectors
        mov     word ptr [D_0E54], softkey_tc
        ret
L_083C5:
        BC_STATUS_A 123, 27, G_TC_NOTE_VALUE, TBL_NOTE_VALUE_NAMES
        db      0c3h
        endif
step_edit_paste:
        call    seq_end_vs_position_cmp
pressing_do_it_will_paste_status_083D2:
        jne     paste_event_dialog_083D5
        ret
paste_event_dialog_083D5:
        cmp     word ptr [G_STEP_PASTE_LEN], 0
pressing_do_it_will_paste_status:
        jne     paste_event_dialog_083DD
        ret
paste_event_dialog_083DD:
paste_event_dialog_08E27:
        DLG_PASTE_EVENT
softkey_do_it_08442:
        int     50h
bc_int67_68_08444:
        mov     word ptr [UI_SLOT_EXIT], calls_wait_loop_0a12a
bc_int67_68_0844a:
        INT_67 calls_softkey_tc_09e83
bc_int67_68_0844e:
        if      FW_VERSION = 172
        INT_68 paste_event_do_it
        else
        INT_68 L_08452+1
paste_event_do_it:
        endif
L_08452:
        ret
        if      FW_VERSION = 172
paste_event_do_it:
        endif
        call    calls_get_table_status_08493
        if      FW_VERSION = 150
L_08453_V150                    equ     $+1
        endif
        mov     si, P_9DD8
L_08459:
        mov     al, byte ptr [si]
        if      FW_VERSION = 150
tgt_0845D                       equ     $+1
        endif
        cmp     al, 0ffh
        if      FW_VERSION = 172
tgt_0845D:
        endif
        je      L_08489
        mov     bx, di
        mov     cx, 3
        rep movsw
        mov     cx, word ptr es:[bx+1]
        and     cx, 0f800h
        or      cx, word ptr [SEQ_BAR_TICK]
        mov     word ptr es:[bx+1], cx
        and     al, 0c0h
        cmp     al, 80h
        if      FW_VERSION = 172
        jne     L_08459
        else
        jne     L_08453_V150+2
L_08EC6:
        endif
L_0847C:
        mov     al, byte ptr [si]
        mov     cx, 3
L_08ECB:
        rep movsw
        cmp     al, 0c2h
        jne     L_0847C
L_08487:
        jmp     L_08459
L_08489:
        mov     ax, word ptr [SEQ_CUR_BAR]
        mov     word ptr [SEQ_CURSOR_BAR], ax
calls_get_table_status_0848f:
        if      FW_VERSION = 172
edit_multiple_dialog            equ     $+2
        endif
        call    calls_softkey_tc_09e83
        ret
calls_get_table_status_08493:
        call    get_table_status
        mov     di, si
        mov     si, word ptr [di]
        mov     es, word ptr [di+2]
        mov     bx, word ptr [G_STEP_PASTE_LEN]
L_084A1:
        je      calls_get_table_status_084a6
        jmp     fn_0A06B
calls_get_table_status_084a6:
        jmp     fn_0A045
calls_get_table_status_084a9:
        call    get_table_status
L_084AC:
        jne     softkey_edit
        ret
softkey_edit:
SOFTKEY_EDIT_V150:
        BC_SOFTKEY 4, BC_SK_BOX,   "EDIT"
softkey_84B9:
        BC_SOFTKEY 5, BC_SK_PLAIN, " "
softkey_cancel_84C0:
        BC_SOFTKEY 6, BC_SK_BOX,   "CANCEL"
softkey_cancel_084cc:
        mov     word ptr [UI_SLOT_EXIT], calls_wait_loop_0a12a
bc_int5d_084d2:
        INT_5D jmp_word_082f1
bc_int67_68_084d6:
        INT_65 L_085B9
bc_int67_68_084da:
        INT_66 L_09D19
bc_int67_68_084de:
        INT_67 L_08669
bc_int67_68_084e2:
        INT_68 NULL_HANDLER_OFS
calls_get_table_status_084e6:
        INT_69 softkey_tc
calls_get_table_status_084ea:
        mov     word ptr [D_0EB0], bc_int6c_08501
calls_get_table_status_084f0:
        call    get_table_status
        mov     word ptr [G_STEP_SEL_START], si
        mov     word ptr [G_STEP_SEL_END], si
        mov     byte ptr [G_STEP_SEL_ACTIVE], 1
        ret
bc_int6c_08501:
        mov     word ptr [D_0EB0], NULL_HANDLER_OFS
bc_int6c_08507:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, L_08572, calls_get_table_status_0858b
L_08511:
        ret
L_08512:
        cmp     byte ptr [G_STEP_CURSOR_ROW], 0
calls_get_table_status_08517:
        je      br_08525
        dec     byte ptr [G_STEP_CURSOR_ROW]
calls_get_table_status_0851d:
        call    get_table_status
        mov     word ptr [G_STEP_SEL_END], si
        ret
br_08525:
        cmp     byte ptr [G_STEP_LIST_TOP], 0
        jne     calls_get_table_status_0852d
        ret
calls_get_table_status_0852d:
        dec     byte ptr [G_STEP_LIST_TOP]
calls_get_table_status_08531:
        call    get_table_status
        mov     word ptr [G_STEP_SEL_END], si
        ret
calls_get_table_status_08539:
        cmp     byte ptr [G_STEP_CURSOR_ROW], 4
calls_get_table_status_0853e:
        je      calls_get_table_status_08559
calls_get_table_status_08540:
        call    get_table_status
        jne     calls_get_table_status_08546
        ret
calls_get_table_status_08546:
        inc     byte ptr [G_STEP_CURSOR_ROW]
calls_get_table_status_0854a:
        call    get_table_status
        je      L_08554
        mov     word ptr [G_STEP_SEL_END], si
        ret
L_08FB7:
L_08554:
        if      FW_VERSION = 172
locate_dialog_init              equ     $+2
        endif
        dec     byte ptr [G_STEP_CURSOR_ROW]
        ret
calls_get_table_status_08559:
        call    get_table_status
        jne     calls_get_table_status_0855f
        ret
L_08FA9:
calls_get_table_status_0855f:
        inc     byte ptr [G_STEP_LIST_TOP]
calls_get_table_status_08563:
        call    get_table_status
        je      L_0856D
        mov     word ptr [G_STEP_SEL_END], si
        ret
L_0856D:
        dec     byte ptr [G_STEP_LIST_TOP]
        ret
L_08572:
        call    step_edit_event_up
        cmp     byte ptr [B_5965], 0
calls_get_table_status_0857a:
        jne     calls_get_table_status_0857d
        ret
calls_get_table_status_0857d:
        call    get_table_status
jmp_softkey_tc_08580:
        call    step_edit_selection_range
        cmp     si, dx
jmp_softkey_tc_08585:
        jae     calls_get_table_status_0858a
        jmp     softkey_tc
calls_get_table_status_0858a:
        ret
calls_get_table_status_0858b:
        call    step_edit_event_down
calls_get_table_status_0858e:
        call    get_table_status
jmp_softkey_tc_08591:
        call    step_edit_selection_range
        cmp     bx, si
jmp_softkey_tc_08596:
        jae     L_0859B
        jmp     softkey_tc
L_0859B:
        ret
step_edit_selection_range:
        mov     dx, word ptr [G_STEP_SEL_START]
        mov     bx, word ptr [G_STEP_SEL_END]
        cmp     dx, bx
        jb      calls_get_table_status_085aa
        xchg    dx, bx
calls_get_table_status_085aa:
        ret
calls_get_table_status_085ab:
        call    get_table_status
L_085AE:
        jne     br_085B1
        ret
br_085B1:
        mov     word ptr [G_STEP_SEL_START], si
        mov     word ptr [G_STEP_SEL_END], si
L_085B9:
        mov     ax, ds
        mov     es, ax
        mov     di, P_9DD8
        mov     si, word ptr [G_STEP_SEL_START]
        mov     bx, word ptr [G_STEP_SEL_END]
        cmp     si, bx
        jb      L_085CE
        xchg    si, bx
L_085CE:
        sub     dx, dx
L_085D0:
        push    bx
        push    si
L_085D2:
        call    L_085EB
        jb      calls_softkey_insert_085e3
        pop     si
        pop     bx
        add     si, 8
        cmp     bx, si
        jae     L_085D0
        mov     byte ptr [di], 0ffh
calls_softkey_insert_085e3:
        mov     word ptr [G_STEP_PASTE_LEN], dx
calls_softkey_insert_085e7:
        call    softkey_insert
        ret
L_085EB:
        push    ds
        mov     bx, si
        mov     si, word ptr [bx]
        mov     ds, word ptr [bx+2]
        mov     ax, ds
        or      ax, si
        je      L_08633
        mov     cx, 6
        mov     al, byte ptr [si]
        cmp     al, 0c1h
L_08600:
        je      br_0862F
        and     al, 0c0h
L_08604:
        je      br_0862F
        cmp     al, 80h
L_08608:
        je      L_08618
        mov     al, byte ptr [si+3]
        and     al, 0f0h
        cmp     al, 80h
L_08611:
        jne     br_0862F
        mov     cx, 0ch
        jmp     SHORT br_0862F
L_08618:
        push    si
L_08619:
        add     cx, 6
        mov     ax, cx
        add     ax, dx
        cmp     ax, 1e00h
L_08623:
        jae     data_too_bigcant_excute_msg
        add     si, 6
        mov     al, byte ptr [si]
        cmp     al, 0c2h
        jne     L_08619
L_0862E:
        pop     si
br_0862F:
        add     dx, cx
        rep movsb
L_08633:
        pop     ds
        cmp     dx, 1e00h
L_08638:
        jae     data_too_big_error
        clc
        ret
data_too_bigcant_excute_msg:
        pop     si
        pop     ds
data_too_big_error:
DATA_TOO_BIG_ERROR_V150:
        BC_PRINT " DATA TOO BIG:CAN'T EXCUTE !!"
print_data_too_big_0865f:
        call    delay_loop
L_08662:
        BC_SEQ_INIT
L_08665:
        sub     dx, dx
        stc
        ret
L_08669:
        cmp     byte ptr [G_STEP_NOTES_HELD], 0
L_0866E:
        je      br_08671
        ret
br_08671:
        les     si, [STEP_EVENT_PTR]
        mov     al, byte ptr es:[si]
        cmp     al, 0c1h
        jne     L_0867D
        ret
L_0867D:
        and     al, 0c0h
        cmp     al, 80h
L_08681:
        jne     edit_multiple_dialog_08684
        ret
edit_multiple_dialog_08684:
        pusha
        push    es
edit_multiple_dialog_090D0:
edit_multiple_dialog_08686:
        BC_FILE_DIALOG 16, 2, 216, 58, "Edit Multiple"
softkey_cancel_869B:
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
softkey_do_it_86A7:
        BC_SOFTKEY 5, BC_SK_BOX,   "DO IT"
softkey_do_it_086b2:
        int     50h
bc_int5b_086b4:
        mov     word ptr [UI_SLOT_EXIT], calls_wait_loop_0a12a
bc_int5b_086ba:
        INT_67 edit_multiple_cancel
bc_int5b_086be:
        INT_5B edit_multiple_cancel
bc_int5c_086c2:
        INT_5C step_dialog_idle
        db      07h, 61h, 3ch, 00h
L_086CA:
        je      loop_086CF
        jmp     NEAR L_089EA
loop_086CF:
        mov     word ptr [W_5A85], 0
        cmp     byte ptr [STEP_FIELD], 0
        je      change_note_to_status
        cmp     byte ptr [STEP_FIELD], 1
        jne     L_086E6
        jmp     NEAR edit_type_display_2
L_086E6:
        cmp     byte ptr [STEP_FIELD], 2
L_086EB:
        jne     jmp_variation_type_status_086f0
        jmp     NEAR edit_type_display
jmp_variation_type_status_086f0:
        cmp     byte ptr [STEP_FIELD], 3
jmp_variation_type_status_086f5:
        jne     jmp_variation_value_status_086fa
        jmp     NEAR variation_type_status
jmp_variation_value_status_086fa:
        cmp     byte ptr [STEP_FIELD], 4
        jne     edit_multiple_cancel
        jmp     NEAR variation_value_status
edit_multiple_cancel:
        mov     al, byte ptr [G_STEP_LIST_TOP]
        mov     ah, byte ptr [G_STEP_CURSOR_ROW]
        push    ax
change_note_to_status_0870C:
        call    calls_softkey_tc_09e83
        pop     ax
        mov     byte ptr [G_STEP_LIST_TOP], al
        mov     byte ptr [G_STEP_CURSOR_ROW], ah
        jmp     word ptr [G_STEP_FIELD_VEC]
        db      0c3h
change_note_to_status:
        mov     al, byte ptr es:[si+4]
        and     al, 7fh
        call    change_note_to_set
change_note_to_prompt:
        BC_STATUS 60, 26, "Change note to:"
status_change_note_to_0873a:
        mov     al, 7fh
        mov     si, P_7733
        mov     bx, P_8761
calls_setup_callback_vectors_08742:
        call    setup_callback_vectors
bc_int5d_08745:
        INT_5D edit_multiple_note_refresh
ui_ctrl_08749:
        INT_68 edit_type_status_0879B
ui_ctrl_0874d:
        mov     word ptr [UI_SLOT_PAD_HIT], L_0C197
ui_ctrl_08753:
        BC_UI_CTRL 149, 25, 49, 9
L_0875A:
        mov     word ptr [W_5A85], 0
        ret
L_08761:
        call    L_0679B
        jne     L_08767
        ret
L_08767:
        cmp     al, 62h
        jb      L_0876D
        mov     al, 62h
L_0876D:
        cmp     al, 23h
        jae     change_note_to_set
        mov     al, 23h
change_note_to_set:
        mov     byte ptr [G_EDIT_DRUM_NOTE], al
L_08776:
        call    note_to_pad_lookup
        mov     byte ptr [G_EDIT_DRUM_PAD], al
        ret
edit_multiple_note_refresh:
        mov     al, byte ptr [G_EDIT_DRUM_NOTE]
L_08780:
        call    L_0679B
L_08783:
        je      L_08792
        mov     al, byte ptr [G_EDIT_DRUM_NOTE]
        mov     ah, byte ptr [G_EDIT_DRUM_PAD]
L_0878C:
        BC_MEM_STATUS 150, 26
        if      FW_VERSION = 172
L_08791:
        endif
        ret
L_08792:
        mov     al, byte ptr [G_EDIT_DRUM_NOTE]
L_08795:
        BC_MIDI_FIELD 150, 26
        if      FW_VERSION = 150
L_08791:
        endif
L_0879A:
        ret
edit_type_status_0879B:
        mov     bx, 4
        mov     al, 0
        mov     dl, 3
        mov     dh, byte ptr [G_EDIT_DRUM_NOTE]
        xchg    byte ptr [STEP_WIN_VALUE], dh
        xchg    byte ptr [STEP_WIN_VAR_TYPE], dl
        push    dx
edit_type_status:
        call    fn_08BE0
        pop     dx
        mov     byte ptr [STEP_WIN_VALUE], dh
        mov     byte ptr [STEP_WIN_VAR_TYPE], dl
        jmp     NEAR edit_multiple_cancel
edit_type_display:
        BC_STATUS 60, 20, "Edit type:"
value_display_2:
        BC_STATUS 60, 30, "    Value:"
status_value_087de:
        mov     al, 3
        mov     si, STEP_WIN_VAR_TYPE
        mov     bx, P_8841
calls_setup_callback_vectors_087e6:
        call    setup_callback_vectors
ui_ctrl_087e9:
        INT_62 NULL_HANDLER_OFS
ui_ctrl_087ed:
        INT_63 ui_ctrl_08822
ui_ctrl_087f1:
        BC_UI_CTRL 119, 19, 61, 9
bc_int5d_087f8:
        INT_5D L_08810
bc_int67_68_087fc:
        INT_68 L_08859
L_08800:
        mov     word ptr [UI_SLOT_PAD_HIT], NULL_HANDLER_OFS
L_08806:
        call    L_08841
        mov     word ptr [W_5A85], 0
        ret
L_08810:
        if      FW_VERSION = 172
L_08815                         equ     $+5
        endif
        BC_STATUS_A 120, 20, STEP_WIN_VAR_TYPE, TBL_EDIT_OP_LABELS
        mov     ax, word ptr [G_EDIT_MULT_AMOUNT]
ui_ctrl_0881c:
        BC_ARITH 01e78h
ui_ctrl_08821:
        ret
ui_ctrl_08822:
        BC_UI_CTRL 119, 29, 25, 9
L_08829:
        mov     si, P_5A81
        mov     ax, 270fh
        mov     bx, 0
        mov     cx, P_8841
bc_int62_08835:
        call    ui_numeric_field_setup
bc_int62_08838:
        INT_62 edit_type_display
bc_int63_0883c:
        INT_63 NULL_HANDLER_OFS
L_08840:
        ret
L_08841:
        cmp     byte ptr [STEP_WIN_VAR_TYPE], 2
L_08846:
        je      L_08849
        ret
L_08849:
        mov     ax, word ptr [G_EDIT_MULT_AMOUNT]
        cmp     ax, 0c8h
L_0884F:
        jae     L_08852
        ret
L_08852:
        mov     word ptr [G_EDIT_MULT_AMOUNT], 0c8h
        ret
L_08859:
        les     si, [STEP_EVENT_PTR]
        mov     al, byte ptr es:[si]
        mov     bx, 2
        mov     al, 1
variation_type_status_08865:
        call    fn_08BE0
        jmp     NEAR edit_multiple_cancel
variation_type_status:
        mov     al, byte ptr es:[si+3]
        and     al, 7fh
L_092BB:
        mov     byte ptr [STEP_WIN_VALUE], al
variation_type_display:
        BC_STATUS 60, 26, "Variation type:"
status_variation_type_08889:
        mov     al, 3
        mov     si, STEP_WIN_VALUE
        mov     bx, NULL_HANDLER_OFS
calls_setup_callback_vectors_08891:
        call    setup_callback_vectors
bc_int5d_08894:
        INT_5D edit_multiple_var_type_refresh
ui_ctrl_08898:
        INT_68 edit_multiple_variation_do_it
ui_ctrl_0889c:
        mov     word ptr [UI_SLOT_PAD_HIT], NULL_HANDLER_OFS
ui_ctrl_088a2:
        BC_UI_CTRL 149, 25, 19, 9
L_088A9:
        ret
edit_multiple_var_type_refresh:
        if      FW_VERSION = 172
L_088AF                         equ     $+5
        endif
        BC_STATUS_A 150, 26, STEP_WIN_VALUE, TBL_NOTE_VAR_SHORT_LABELS
        ret
variation_value_status_088B4:
        ret
variation_value_status:
        mov     al, byte ptr es:[si+5]
        mov     byte ptr [STEP_WIN_VALUE], al
        mov     al, byte ptr es:[si+3]
        and     al, 7fh
        mov     byte ptr [STEP_WIN_VAR_TYPE], al
variation_value_display:
        BC_STATUS 54, 26, "Variation value:"
status_variation_value_088db:
        INT_6A  step_window_value_inc, step_window_value_dec
bc_int5d_088e1:
        INT_5D edit_multiple_var_value_refresh
ui_ctrl_088e5:
        INT_68 edit_multiple_variation_do_it
ui_ctrl_088e9:
        mov     word ptr [UI_SLOT_PAD_HIT], NULL_HANDLER_OFS
ui_ctrl_088ef:
        BC_UI_CTRL 149, 25, 25, 9
L_088F6:
        ret
step_window_value_inc:
        add     al, byte ptr [STEP_WIN_VALUE]
        cmp     al, 7fh
        jb      L_08901
L_08900                         equ     $+1
        mov     al, 7fh
L_08901:
        mov     byte ptr [STEP_WIN_VALUE], al
        ret
step_window_value_dec:
        mov     ah, byte ptr [STEP_WIN_VALUE]
        sub     ah, al
        jae     L_0890F
        mov     ah, 0
L_0890F:
        mov     byte ptr [STEP_WIN_VALUE], ah
        ret
edit_multiple_var_value_refresh:
        BC_CLEAR_RECT 150, 26, 24, 7
L_0891B:
        mov     al, byte ptr [STEP_WIN_VALUE]
        mov     ah, byte ptr [STEP_WIN_VAR_TYPE]
        cmp     ah, 0
L_08925:
        je      br_08930
        cmp     ah, 2
        je      br_0897B
        jb      br_0897B
        jmp     SHORT br_0896A
br_08930:
        mov     ah, 0
        cmp     al, 7ch
        jb      L_08938
        mov     al, 7ch
L_08938:
        cmp     al, 4
L_09384:
        jae     br_0893E
        mov     al, 4
br_0893E:
        mov     byte ptr [STEP_WIN_VALUE], al
        shl     al, 1
        sub     al, 80h
        jb      L_0895B
L_08947:
        push    ax
L_08948:
        BC_CALL 01a9ch
bc_target_0894d:
        pop     ax
        or      ax, ax
L_08950:
        jne     status_display_8953
        ret
status_display_0939D:
status_display_8953:
        BC_STATUS 150, 26, "+"
L_0895A:
        ret
L_0895B:
        neg     al
        if      FW_VERSION = 150
L_093AD_V150                         equ     $+6
        endif
L_0895D:
        BC_CALL 01a9ch
status_display_8962:
        BC_STATUS 150, 26, "-"
L_08969:
        ret
br_0896A:
        mov     ah, 0
        cmp     al, 64h
        jb      L_08972
        mov     al, 64h
L_08972:
        mov     byte ptr [STEP_WIN_VALUE], al
L_093BF:
        sub     al, 32h
        jb      L_0895B
        jmp     SHORT L_08947
br_0897B:
        cmp     al, 64h
        jb      L_08984
        mov     al, 64h
        mov     byte ptr [STEP_WIN_VALUE], al
L_08984:
        mov     ah, 0
off_1_status_08986:
        BC_CALL 01a9ch
off_1_status:
        ret
off_display:
        BC_STATUS 150, 26, "OFF"
status_off_08995:
        ret
edit_multiple_variation_do_it:
        mov     si, word ptr [G_STEP_SEL_START]
        mov     cx, word ptr [G_STEP_SEL_END]
        cmp     si, cx
        jb      loop_089A4
        xchg    si, cx
loop_089A4:
        mov     di, word ptr [si]
        mov     es, word ptr [si+2]
        mov     dh, byte ptr es:[di]
        mov     dl, byte ptr es:[di+3]
        and     dx, 0c0f0h
        cmp     dh, 0
        jne     L_089BB
        mov     dl, 0
L_089BB:
        cmp     dx, 4080h
        jne     L_089C6
        pusha
L_089C2:
        call    L_089D1
        popa
L_089C6:
        add     si, 8
        cmp     cx, si
        jae     loop_089A4
L_089CD:
        call    edit_multiple_cancel
        ret
L_089D1:
        cmp     byte ptr [STEP_FIELD], 4
L_089D6:
        je      br_089E2
        mov     al, byte ptr [STEP_WIN_VALUE]
        or      al, 80h
        mov     byte ptr es:[di+3], al
        ret
br_089E2:
        mov     al, byte ptr [STEP_WIN_VALUE]
        mov     byte ptr es:[di+5], al
        ret
L_089EA:
        mov     al, byte ptr es:[si+3]
        and     al, 0f0h
        cmp     al, 80h
L_089F2:
        jne     br_089F7
        jmp     NEAR loop_086CF
br_089F7:
        mov     ah, 40h
        mov     word ptr [W_5A85], ax
        cmp     al, 0e0h
L_089FE:
        jne     edit_type_1_status_08A03
        jmp     NEAR edit_type_display_3
edit_type_1_status_08A03:
        cmp     byte ptr [STEP_FIELD], 1
edit_type_1_status:
        je      edit_type_display_2
        jmp     NEAR edit_multiple_cancel
edit_type_display_2:
        BC_STATUS 60, 20, "Edit type:"
value_display_3:
        BC_STATUS 60, 30, "    Value:"
status_value_08a2d:
        mov     al, 3
        mov     si, STEP_WIN_VAR_TYPE
        mov     bx, P_8A6A
calls_setup_callback_vectors_08a35:
        call    setup_callback_vectors
ui_ctrl_08a38:
        INT_62 NULL_HANDLER_OFS
ui_ctrl_08a3c:
        INT_63 ui_ctrl_08a7d
ui_ctrl_08a40:
        BC_UI_CTRL 119, 19, 61, 9
bc_int5d_08a47:
        INT_5D L_08A56
bc_int67_68_08a4b:
        INT_68 L_08AAB
L_08A4F:
        mov     word ptr [UI_SLOT_PAD_HIT], NULL_HANDLER_OFS
        ret
L_08A56:
        if      FW_VERSION = 172
L_08A5B                         equ     $+5
        endif
        BC_STATUS_A 120, 20, STEP_WIN_VAR_TYPE, TBL_EDIT_OP_LABELS
        mov     al, byte ptr [STEP_WIN_VALUE]
        mov     ah, 0
L_08A64:
        BC_FIELD 120, 30
L_08A69:
        ret
        db      3ch, 02h
L_08A6C:
        jne     br_08A6F
        ret
br_08A6F:
        mov     al, byte ptr [STEP_WIN_VALUE]
        cmp     al, 7fh
        jae     ui_ctrl_08a77
        ret
ui_ctrl_08a77:
        mov     byte ptr [STEP_WIN_VALUE], 7fh
        ret
        if      FW_VERSION = 150
L_094CA                         equ     $+3
        endif
ui_ctrl_08a7d:
        BC_UI_CTRL 119, 29, 19, 9
calls_setup_callback_vectors_08a84:
        mov     al, 0c8h
        mov     si, STEP_WIN_VALUE
        mov     bx, P_8A98
calls_setup_callback_vectors_08a8c:
        call    setup_callback_vectors
bc_int62_08a8f:
        INT_62 L_089EA
bc_int63_08a93:
        INT_63 NULL_HANDLER_OFS
        if      FW_VERSION = 172
L_08A97:
        endif
        ret
L_08A98:
        cmp     byte ptr [STEP_WIN_VAR_TYPE], 2
        jne     L_08AA0
        if      FW_VERSION = 150
L_08A97:
        endif
        ret
L_08AA0:
        cmp     al, 7fh
        jae     br_08AA5
        ret
br_08AA5:
        mov     al, 7fh
        mov     byte ptr [STEP_WIN_VALUE], al
        ret
L_08AAB:
        if      FW_VERSION = 172
        db      0a0h, 072h, 059h, 08ah, "&sYP", 0c4h, 036h, 082h, 059h
        else
        db      0a0h, 064h, 059h, 08ah, "&eYP", 0c4h, 036h, 074h, 059h         ; .dY.&eYP.6tY
        endif
tgt_08AB7:
        mov     bx, 4
        cmp     byte ptr [W_5A85], 0c0h
        je      L_08ACB
        cmp     byte ptr [W_5A85], 0d0h
        je      L_08ACB
        mov     bx, 5
L_08ACB:
        mov     al, 0
edit_type_2_status_08ACD:
        call    fn_08BE0
edit_type_2_status:
        call    calls_softkey_tc_09e83
        pop     ax
        mov     byte ptr [G_STEP_LIST_TOP], al
        mov     byte ptr [G_STEP_CURSOR_ROW], ah
        ret
edit_type_display_3:
        if      FW_VERSION = 150
L_0952D                         equ     $+7
        endif
        BC_STATUS 60, 20, "Edit type:"
value_display_4:
        BC_STATUS 60, 30, "    Value:"
status_value_08afc:
        mov     al, 3
        mov     si, STEP_WIN_VAR_TYPE
        mov     bx, P_8B88
        call    setup_callback_vectors
ui_ctrl_08b07:
        INT_62 NULL_HANDLER_OFS
ui_ctrl_08b0b:
        INT_63 ui_ctrl_08b69
ui_ctrl_08b0f:
        BC_UI_CTRL 119, 19, 61, 9
bc_int5d_08b16:
        INT_5D L_08B28
bc_int67_68_08b1a:
        INT_68 L_08BCE
L_08B1E:
        mov     word ptr [UI_SLOT_PAD_HIT], NULL_HANDLER_OFS
L_08B24:
        call    L_08841
        ret
L_08B28:
        if      FW_VERSION = 172
L_08B2D                         equ     $+5
        endif
        BC_STATUS_A 120, 20, STEP_WIN_VAR_TYPE, TBL_EDIT_OP_LABELS
        mov     ax, word ptr [G_EDIT_MULT_AMOUNT]
        cmp     byte ptr [STEP_WIN_VAR_TYPE], 3
        je      L_08B48
L_08B3B:
        BC_ARITH 01e78h
status_display_8B40:
        BC_STATUS 144, 30, " "
L_08B47:
        ret
L_08B48:
        sub     ax, 2000h
        jb      L_08B5A
L_08B4D:
        BC_ARITH 01e7eh
status_display_0959C:
status_display_8B52:
        BC_STATUS 120, 30, "+"
L_08B59:
        ret
        if      FW_VERSION = 150
L_095A9                         equ     $+5
        endif
L_08B5A:
        neg     ax
L_08B5C:
        BC_ARITH 01e7eh
status_display_095AB:
status_display_8B61:
        BC_STATUS 120, 30, "-"
ui_ctrl_08b68:
        ret
ui_ctrl_08b69:
        BC_UI_CTRL 119, 29, 31, 9
L_08B70:
        mov     si, P_5A81
        if      FW_VERSION = 150
L_089B3                   equ     $+2
        endif
        mov     ax, 3fffh
        mov     bx, 0
        mov     cx, edit_mult_changed
bc_int62_08b7c:
        call    ui_numeric_field_setup
bc_int62_08b7f:
        INT_62 edit_type_display_3
        if      FW_VERSION = 150
        db      0cdh
        endif
bc_int63_08b83:
        if      FW_VERSION = 172
        INT_63 NULL_HANDLER_OFS
        else
        db      63h
        db      0dah
        push    cs
        endif
L_08B87:
        ret
loop_08B88:
        cmp     byte ptr [STEP_WIN_VAR_TYPE], 2
        je      L_08B90
        ret
L_08B90:
        mov     ax, word ptr [G_EDIT_MULT_AMOUNT]
        cmp     ax, 0c8h
        if      FW_VERSION = 172
L_08B96:
        endif
        jae     L_08B99
        ret
L_08B99:
        mov     word ptr [G_EDIT_MULT_AMOUNT], 0c8h
        ret
        if      FW_VERSION = 172
L_08BA0:
        endif
edit_mult_changed:
        cmp     byte ptr [STEP_WIN_VAR_TYPE], 2
L_08BA5:
        je      loop_08B88
        cmp     byte ptr [STEP_WIN_VAR_TYPE], 3
L_08BAC:
        je      L_08BBE
        cmp     word ptr [G_EDIT_MULT_AMOUNT], 1fffh
L_08BB4:
        jae     br_08BB7
        ret
        if      FW_VERSION = 150
L_08B96:
        endif
br_08BB7:
        mov     word ptr [G_EDIT_MULT_AMOUNT], 1fffh
        ret
        if      FW_VERSION = 150
L_08BA0:
        endif
L_08BBE:
        cmp     word ptr [G_EDIT_MULT_AMOUNT], 3fffh
L_08BC4:
        jae     L_08BC7
        ret
L_09611:
L_08BC7:
        mov     word ptr [G_EDIT_MULT_AMOUNT], 3fffh
        ret
L_08BCE:
        les     si, [STEP_EVENT_PTR]
        mov     al, byte ptr es:[si]
        mov     bx, 4
        mov     al, 2
L_08BDA:
        call    fn_08BE0
        jmp     NEAR edit_multiple_cancel
fn_08BE0:
        mov     si, word ptr [G_STEP_SEL_START]
        mov     cx, word ptr [G_STEP_SEL_END]
        cmp     si, cx
        jb      loop_08BEE
        xchg    si, cx
loop_08BEE:
        mov     di, word ptr [si]
        mov     es, word ptr [si+2]
        mov     dh, byte ptr es:[di]
        mov     dl, byte ptr es:[di+3]
        and     dx, 0c0f0h
        cmp     dh, 0
        jne     br_08C05
        mov     dl, 0
br_08C05:
        cmp     dx, word ptr [W_5A85]
        je      br_08C1B
        cmp     dx, 4080h
        jne     br_08C22
        cmp     word ptr [W_5A85], 0
        jne     br_08C22
        add     di, 6
br_08C1B:
        add     di, bx
        pusha
        call    fn_08C2A
        popa
br_08C22:
        add     si, 8
        cmp     cx, si
        jae     loop_08BEE
        ret
fn_08C2A:
        cmp     al, 1
        jne     L_08C31
        jmp     br_08CC9
L_08C31:
        cmp     al, 2
L_08C33:
        jne     L_08C38
        jmp     NEAR L_08D3C
L_08C38:
        mov     al, byte ptr es:[di]
        mov     ah, al
        and     ax, 807fh
        mov     bl, byte ptr [STEP_WIN_VAR_TYPE]
        sub     bh, bh
        shl     bx, 1
        mov     dl, byte ptr [STEP_WIN_VALUE]
        push    ax
        call    word ptr cs:[bx+TBL_EDIT_MULTI_VAL_OP]
        pop     bx
        or      al, bh
        mov     byte ptr es:[di], al
        ret
TBL_EDIT_MULTI_VAL_OP:
        dw      edit_multi_val_add, edit_multi_val_sub, edit_multi_val_scale, edit_multi_val_set
edit_multi_val_add:
        add     al, dl
        cmp     al, 7fh
L_08C65:
        jae     L_08C68
        ret
L_08C68:
        mov     al, 7fh
        ret
edit_multi_val_sub:
        sub     al, dl
        jae     L_08C6F
        mov     al, 0
L_08C6F:
        cmp     al, 0
L_08C73:
        je      br_08C76
        ret
br_08C76:
        sub     ax, ax
        cmp     al, byte ptr [STEP_FIELD]
        jne     L_08C7F
        ret
L_08C7F:
        cmp     ax, word ptr [W_5A85]
L_08C83:
        je      L_08C86
        ret
L_08C86:
        mov     al, 1
        ret
edit_multi_val_scale:
        mov     ah, dl
        mul     ah
        mov     bl, 64h
        div     bl
        cmp     al, 7fh
        jb      L_08C97
        mov     al, 7fh
L_08C97:
        cmp     al, 0
L_08C99:
        je      L_08C9C
        ret
L_08C9C:
        cmp     byte ptr [STEP_FIELD], 0
L_08CA1:
        jne     L_08CA4
        ret
L_08CA4:
        cmp     word ptr [W_5A85], 0
L_08CA9:
        je      L_08CAC
        ret
L_08CAC:
        mov     al, 1
        ret
edit_multi_val_set:
        mov     al, dl
        cmp     al, 0
L_08CB3:
        je      L_08CB6
        ret
L_08CB6:
        cmp     byte ptr [STEP_FIELD], 0
L_08CBB:
        jne     L_08CBE
        ret
L_08CBE:
        cmp     word ptr [W_5A85], 0
L_08CC3:
        je      br_08CC6
        ret
br_08CC6:
        mov     al, 1
        ret
br_08CC9:
        mov     ah, byte ptr es:[di]
        mov     al, byte ptr es:[di+1]
        mov     ch, ah
        and     ch, 7
        mov     dl, byte ptr es:[di+2]
        shl     dl, 1
        rcr     ah, 1
        shr     ah, 2
        mov     bl, byte ptr [STEP_WIN_VAR_TYPE]
        sub     bh, bh
        shl     bx, 1
        push    cx
        push    dx
        call    word ptr cs:[bx+TBL_EDIT_MULTI_DUR_OP]
        pop     dx
        pop     cx
        shl     ah, 3
        rcr     dl, 1
        or      ah, ch
        mov     byte ptr es:[di+2], dl
        mov     byte ptr es:[di], ah
        mov     byte ptr es:[di+1], al
        ret
TBL_EDIT_MULTI_DUR_OP:
        dw      edit_multi_dur_add, edit_multi_dur_sub, edit_multi_dur_scale, edit_multi_dur_set
edit_multi_dur_add:
        add     ax, word ptr [G_EDIT_MULT_AMOUNT]
        cmp     ax, 270fh
L_08D13:
        jae     L_08D16
        ret
L_08D16:
        mov     ax, 270fh
        ret
edit_multi_dur_sub:
        sub     ax, word ptr [G_EDIT_MULT_AMOUNT]
L_08D1E:
        jb      L_08D21
        ret
L_08D21:
        sub     ax, ax
        ret
edit_multi_dur_scale:
        mov     bx, word ptr [G_EDIT_MULT_AMOUNT]
        mul     bx
        mov     bl, 64h
        div     bx
        cmp     ax, 270fh
L_08D31:
        jae     br_08D34
        ret
br_08D34:
        mov     ax, 270fh
        ret
edit_multi_dur_set:
        mov     ax, word ptr [G_EDIT_MULT_AMOUNT]
        ret
L_08D3C:
        mov     ax, word ptr es:[di]
        shl     al, 1
        shr     ax, 1
        mov     bl, byte ptr [STEP_WIN_VAR_TYPE]
        sub     bh, bh
        shl     bx, 1
        call    word ptr cs:[bx+TBL_EDIT_MULTI_BEND_OP]
        shl     ax, 1
        shr     al, 1
        mov     word ptr es:[di], ax
        ret
TBL_EDIT_MULTI_BEND_OP:
        dw      edit_multi_bend_add, edit_multi_bend_sub, edit_multi_bend_scale, edit_multi_bend_set
edit_multi_bend_add:
        add     ax, word ptr [G_EDIT_MULT_AMOUNT]
        cmp     ax, 3fffh
L_08D67:
        jae     L_08D6A
        ret
L_08D6A:
        mov     ax, 3fffh
        ret
edit_multi_bend_sub:
        sub     ax, word ptr [G_EDIT_MULT_AMOUNT]
L_08D72:
        jb      L_08D75
        ret
L_08D75:
        sub     ax, ax
        ret
edit_multi_bend_scale:
        shl     ax, 2
        mov     bl, byte ptr [STEP_WIN_VALUE]
        mov     bh, 0
        imul    bx
        mov     bl, 64h
        idiv    bx
        shr     ax, 2
        and     ah, 3fh
        ret
edit_multi_bend_set:
        mov     ax, word ptr [G_EDIT_MULT_AMOUNT]
        ret
step_edit_note_ring_poll:
        mov     bl, byte ptr [NOTE_RING_RD]
        cmp     bl, byte ptr [NOTE_RING_WR]
L_08D9A:
        jne     bc_int5d_08d9d
        ret
bc_int5d_08d9d:
        call    fn_08DAC
        if      FW_VERSION = 172
bc_int5d_08da0:
        INT_5D jmp_word_082f1
L_08DA4:
        mov     word ptr [D_0E54], NULL_HANDLER_OFS
        endif
        jmp     step_edit_note_ring_poll
fn_08DAC:
        sub     bh, bh
        mov     ax, word ptr [bx+NOTE_EVENT_RING]
        add     byte ptr [NOTE_RING_RD], 2
        mov     byte ptr [G_STEP_LIST_DIRTY], 1
L_08DBC:
        cmp     al, 0
L_08DBE:
        jne     L_08DC3
        jmp     NEAR L_08E56
L_08DC3:
        call    seq_end_vs_position_cmp
        if      FW_VERSION = 172
L_08DC6:
        endif
        jne     L_08DC9
        if      FW_VERSION = 150
L_08DC6:
        endif
        ret
L_08DC9:
        push    ax
        call    L_0674A
        pop     ax
        push    ax
L_08DCF:
        call    fn_08F5E
        pop     ax
        mov     byte ptr es:[di+5], al
        mov     ch, byte ptr [SEL_TRACK]
        or      ch, 0
        mov     byte ptr es:[di], ch
        mov     cx, word ptr [SEQ_BAR_TICK]
        mov     bx, word ptr [G_STEP_DUR_TICKS]
        cmp     byte ptr [G_STEP_DUR_MODE], 0
        jne     br_08E05
        inc     byte ptr [G_STEP_NOTES_HELD]
        cmp     byte ptr [G_STEP_NOTES_HELD], 1
        jne     L_08E01
        mov     word ptr [SEQ_NOW_TICK], 0
L_08E01:
        mov     bx, word ptr [SEQ_NOW_TICK]

br_08E05:
        shl     ah, 1
        shl     bh, 3
        rcr     ah, 1
        or      ch, bh
        mov     byte ptr es:[di+1], cl
        mov     byte ptr es:[di+2], ch
        mov     byte ptr es:[di+3], bl
        mov     byte ptr es:[di+4], ah
        mov     byte ptr [B_0B1D], 1
        inc     byte ptr [B_597B]
        cmp     byte ptr [G_STEP_VIEW], 1
        je      calls_softkey_tc_08e3d
        cmp     byte ptr [G_STEP_VIEW], 0
        je      calls_softkey_tc_08e3d
        mov     byte ptr [G_STEP_VIEW], 0
L_08E3A:
        call    step_edit_refresh
calls_softkey_tc_08e3d:
        cmp     byte ptr [B_5965], 0
        jne     L_08E47
calls_softkey_tc_08e44:
        call    softkey_tc
L_08E47:
        mov     ax, word ptr [SEQ_CUR_BAR]
        mov     word ptr [SEQ_CURSOR_BAR], ax
L_08E4D:
        call    step_edit_event_list_draw
        mov     byte ptr [D_596D], 1
        ret
L_08E56:
        call    fn_08ED2
L_08E59:
        jae     br_08E5C
        ret
br_08E5C:
        cmp     byte ptr [G_STEP_NOTES_HELD], 0
        je      br_08E67
        dec     byte ptr [G_STEP_NOTES_HELD]

br_08E67:
        cmp     byte ptr [G_STEP_DUR_MODE], 0
        jne     br_08EAE
        mov     ch, byte ptr es:[di+2]
        mov     cl, byte ptr es:[di+3]
        mov     dl, byte ptr es:[di+4]
        mov     dh, ch
        shl     dl, 1
        rcr     ch, 1
        shr     ch, 2
        mov     ax, word ptr [SEQ_NOW_TICK]
        sub     ax, cx
        and     ah, 3fh
        cmp     ax, 2710h
        jb      br_08E93
        mov     ax, 270fh
br_08E93:
        or      ax, ax
        jne     br_08E98
        inc     ax

br_08E98:
        shl     ah, 3
        rcr     dl, 1
        and     dh, 7
        or      ah, dh
        mov     byte ptr es:[di+2], ah
        mov     byte ptr es:[di+3], al
        mov     byte ptr es:[di+4], dl
br_08EAE:
        cmp     byte ptr [B_597B], 0
        je      br_08ECC
        dec     byte ptr [B_597B]
        jne     br_08ECC
        cmp     byte ptr [G_TC_NOTE_VALUE], 0
        je      br_08ECC
        cmp     byte ptr [G_STEP_AUTO_INC], 0
        je      br_08ECC

L_08EC9:
        call    step_edit_step_fwd
br_08ECC:
        mov     byte ptr [D_596D], 2
        ret
fn_08ED2:
        mov     byte ptr [B_596B], ah
        les     si, [FP_SEQ_AFTER_GAP]
        mov     al, byte ptr es:[si]
        cmp     al, 0c0h
        jne     L_08EF0
        mov     cx, word ptr es:[si+1]
        cmp     cx, word ptr [SEQ_CUR_BAR]
        jne     L_08F35
        callf   CS1_SEG:SEQUENCE_DATA_READ_FAR_OFS
L_08EF0:
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
        je      L_08F35
        cmp     al, 0c0h
        je      L_08F35
        mov     cx, word ptr es:[si+1]
        and     ch, 7
        cmp     cx, word ptr [SEQ_BAR_TICK]
        jne     L_08F35
L_08F08:
        call    fn_07E34
        jae     br_08F28
        cmp     cl, 1
        jne     br_08F28
        test    byte ptr es:[si], 0c0h
        je      L_08F1B
        add     si, 6
L_08F1B:
        mov     ah, byte ptr es:[si+4]
        and     ah, 7fh
        cmp     ah, byte ptr [B_596B]
L_08F26:
        je      br_08F31
br_08F28:
        callf   CS1_SEG:SEQUENCE_DATA_READ_FAR_OFS
        cmp     al, 0ffh
        jmp     SHORT L_08EF0
br_08F31:
        mov     di, si
        clc
        ret
L_08F35:
        stc
        ret
L_08F37:
        mov     bx, word ptr [SEQ_CURSOR_BAR]
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
L_08F40:
        je      br_08F5A
        cmp     al, 0c0h
L_08F44:
        jne     br_08F51
        mov     bx, word ptr es:[si+1]
        mov     word ptr [SEQ_CURSOR_BAR], bx
        sub     cx, cx
        ret
br_08F51:
        mov     cx, word ptr es:[si+1]
        and     ch, 7
        clc
        ret
br_08F5A:
        sub     cx, cx
        stc
        ret
fn_08F5E:
        mov     byte ptr [B_596B], ah
        les     si, [FP_SEQ_AFTER_GAP]
L_08F66:
        callf   CS1_SEG:SCSI_STATUS_CHECK_FAR_OFS
        cmp     bx, word ptr [SEQ_CUR_BAR]
        jne     br_08FCA
        cmp     cx, word ptr [SEQ_BAR_TICK]
        jne     br_08FCA
        cmp     byte ptr es:[si], 0ffh
        je      br_08FCA
L_08F7D:
        call    fn_07E34
        jae     br_08F94
        cmp     cl, 1
        jne     br_08F94
        mov     ah, byte ptr es:[si+4]
        and     ah, 7fh
        cmp     ah, byte ptr [B_596B]
L_08F92:
        je      br_08F9B
br_08F94:
        callf   CS1_SEG:SEQUENCE_DATA_READ_FAR_OFS
        jmp     SHORT L_08F66
br_08F9B:
        mov     di, si
        mov     ah, byte ptr [B_596B]
        push    es
        push    si
        les     si, cs:[vec_3d]
        cmp     ah, byte ptr es:[si+TBL_0013]
        pop     si
        pop     es
        je      L_08FB5
L_08FB0:
        cmp     al, 80h
L_08FB2:
        je      step_edit_write_note_event
        ret
L_08FB5:
        test    byte ptr [G_STEP_TRK_CHANNEL], 40h
        je      L_08FB0
        cmp     al, 80h
L_08FBE:
        je      step_edit_write_note_event
        mov     bx, 6
L_08FC3:
        call    fn_0A06B
L_08FC6:
        call    step_edit_write_note_event
        ret
br_08FCA:
        test    byte ptr [G_STEP_TRK_CHANNEL], 40h
        je      L_08FE7
        mov     al, byte ptr [B_596B]
        cmp     al, 0
        je      L_08FE7
        push    es
        push    si
        les     si, cs:[vec_3d]
        cmp     al, byte ptr es:[si+TBL_0013]
        pop     si
        pop     es
L_08FE5:
        je      L_08FEE
L_08FE7:
        mov     bx, 6
L_08FEA:
        call    fn_0A06B
        ret
L_08FEE:
        mov     bx, 0ch
L_08FF1:
        call    fn_0A06B
L_08FF4:
        call    step_edit_write_note_event
        ret
step_edit_write_note_event:
        mov     al, byte ptr [B_596B]
        mov     byte ptr es:[di+4], al
        mov     al, 40h
        or      al, byte ptr [SEL_TRACK]
        mov     byte ptr es:[di], al
        mov     ax, word ptr [SEQ_BAR_TICK]
        mov     word ptr es:[di+1], ax
        mov     al, byte ptr [G_NOTE_VAR_TYPE]
        or      al, 80h
        mov     byte ptr es:[di+3], al
        mov     al, byte ptr [NOTE_VAR_VALUE]
        mov     byte ptr es:[di+5], al
        add     di, 6
        ret
L_09023:
        call    L_09149
L_09026:
        je      loop_09038
        cmp     al, 0f0h
L_0902A:
        jne     br_0902E
        jmp     SHORT br_09090
br_0902E:
        call    L_0904E
        or      byte ptr [G_STEP_LIST_DIRTY], 1
        jmp     SHORT L_09023
loop_09038:
        call    L_09166
        jne     L_0903E
        ret
L_0903E:
        cmp     al, 0f0h
L_09040:
        jne     br_09044
        jmp     SHORT L_09095
br_09044:
        call    L_0904E
        or      byte ptr [G_STEP_LIST_DIRTY], 1
        jmp     SHORT loop_09038
L_0904E:
        and     ah, 0f0h
        cmp     ah, 90h
L_09054:
        jne     L_0905E
        mov     ah, al
        mov     al, cl
        call    L_08DBC
        ret
L_0905E:
        call    seq_end_vs_position_cmp
L_09061:
        jne     L_09064
        ret
L_09064:
        cmp     ah, 0a0h
L_09067:
        jae     L_0906A
        ret
L_0906A:
        push    ax
        push    cx
L_0906C:
        call    L_0A007
        pop     cx
        pop     ax
        mov     bl, byte ptr [SEL_TRACK]
        or      bl, 40h
        mov     byte ptr es:[di], bl
        mov     bx, word ptr [SEQ_BAR_TICK]
        mov     word ptr es:[di+1], bx
        mov     byte ptr es:[di+3], ah
        mov     byte ptr es:[di+4], al
        mov     byte ptr es:[di+5], cl
        ret
br_09090:
        mov     bx, P_9149
        jmp     SHORT br_09098
L_09095:
        mov     bx, P_9166
br_09098:
        mov     si, P_9DD8
        mov     word ptr [G_STEP_PASTE_LEN], 0
        mov     dl, 0
L_090A3:
        call    L_090D4
L_090A6:
        je      L_090DC
        mov     al, ah
L_090AA:
        call    L_090D4
L_090AD:
        je      L_090DC
        mov     al, cl
L_090B1:
        call    L_090D4
L_090B4:
        je      L_090DC
        cmp     dl, 80h
L_090B9:
        jb      calls_bx_090bc
        ret
calls_bx_090bc:
        mov     word ptr [G_TIMEOUT_TICKS], 3e8h
        push    si
        push    dx
        push    bx
        call    bx
        pop     bx
        pop     dx
        pop     si
        jne     L_090A3
        cmp     word ptr [G_TIMEOUT_TICKS], 0
L_090D1:
        jne     calls_bx_090bc
        ret
L_090D4:
        mov     byte ptr [si], al
        inc     si
        inc     dl
        cmp     al, 0f7h
L_090DB:
        ret
L_090DC:
        call    seq_end_vs_position_cmp
L_090DF:
        jne     L_090E2
        ret
L_090E2:
        mov     al, dl
        mov     ah, 0
L_090E6:
        mov     bl, 6
        div     bl
        push    ax
        cmp     ah, 0
        je      L_090F2
        inc     al
L_090F2:
        add     al, 2
        mul     bl
        mov     bx, ax
        push    dx
L_090F9:
        call    calls_get_table_status_08493
        pop     dx
        mov     al, 80h
        or      al, byte ptr [SEL_TRACK]
        mov     byte ptr es:[di], al
        mov     ax, word ptr [SEQ_BAR_TICK]
        mov     word ptr es:[di+1], ax
        mov     byte ptr es:[di+3], dl
        sub     ax, ax
        mov     word ptr es:[di+4], ax
        add     di, 6
        mov     si, P_9DD8
        mov     cl, dl
        mov     ch, 0
        rep movsb
        pop     ax
        cmp     ah, 0
        je      L_09133
        mov     al, 0
loop_0912B:
        stosb
        inc     ah
        cmp     ah, 6
        jne     loop_0912B
L_09133:
        mov     al, 0c2h
        stosb
        mov     al, 0
        mov     cx, 5
        rep stosb
L_0913D:
        call    step_edit_event_list_draw
        or      byte ptr [G_STEP_LIST_DIRTY], 1
        call    L_0674A
        ret
L_09149:
        mov     bl, byte ptr [MIDI_IN1_RING_PEEK]
        cmp     bl, byte ptr [MIDI_IN1_RING_WR]
        if      FW_VERSION = 172
L_09151:
        endif
        jne     L_09154
        ret
        if      FW_VERSION = 150
L_09151:
        endif
L_09154:
        pushf
        sub     bh, bh
        mov     ax, word ptr [bx+BUF_MIDI_IN1_EVENTS]
        mov     cx, word ptr [bx+P_C5DA]
        if      FW_VERSION = 150
L_09B9F:
        endif
        add     byte ptr [MIDI_IN1_RING_PEEK], 4
        popf
        ret
L_09166:
        mov     bl, byte ptr [MIDI_IN2_RING_PEEK]
        cmp     bl, byte ptr [MIDI_IN2_RING_WR]
L_0916E:
        jne     br_09171
        ret
br_09171:
        pushf
        sub     bh, bh
        mov     ax, word ptr [bx+BUF_MIDI_IN2_EVENTS]
        mov     cx, word ptr [bx+P_C6DA]
        add     byte ptr [MIDI_IN2_RING_PEEK], 4
        popf
        ret
        jmp     word ptr [W_5A4E]
W_5A4E_SELF:
        mov     word ptr [W_5A4E], W_5A4E_SELF
bc_int6a_0918d:
        INT_60 calls_softkey_tc_07a89
calls_get_screen_position_09191:
        INT_61 calls_get_screen_position_091f0
calls_get_screen_position_09195:
        INT_6A step_edit_row2_pad_note_inc, step_edit_row2_pad_note_dec
calls_get_screen_position_0919b:
        call    get_screen_position
L_0919E:
        mov     cl, 11h
        mov     dl, 2bh
L_091A2:
        BC_UI_84
        mov     byte ptr [STEP_FIELD], 0
        mov     word ptr [G_STEP_FIELD_VEC], W_5A4E_SELF
        ret
step_edit_row2_pad_note_inc:
        mov     cl, al
        les     si, [STEP_EVENT_PTR]
        mov     al, byte ptr es:[si+0ah]
        mov     ah, al
        and     ax, 807fh
        add     al, cl
L_091C2:
        cmp     al, 62h
        jb      L_091C8
        mov     al, 62h
L_091C8:
        cmp     al, 23h
        jae     L_091CE
        mov     al, 23h
L_091CE:
        or      al, ah
        mov     byte ptr es:[si+0ah], al
        mov     byte ptr es:[si+4], al
        ret
step_edit_row2_pad_note_dec:
        mov     cl, al
        les     si, [STEP_EVENT_PTR]
        mov     al, byte ptr es:[si+0ah]
        mov     ah, al
        and     ax, 807fh
        sub     al, cl
        jae     L_091C2
        mov     al, 0
        jmp     SHORT L_091C2
calls_get_screen_position_091f0:
        mov     word ptr [W_5A4E], calls_get_screen_position_091f0
calls_get_screen_position_091f6:
        call    get_screen_position
        mov     cl, 41h
        mov     dl, 13h
bc_int6a_091fd:
        BC_UI_84
        INT_60 W_5A4E_SELF
bc_int6a_09204:
        INT_61 calls_get_screen_position_0923c
bc_int6a_09208:
        INT_6A step_var_type_inc, step_var_type_dec
L_0920E:
        mov     byte ptr [STEP_FIELD], 3
        ret
step_var_type_inc:
        les     si, [STEP_EVENT_PTR]
        mov     al, byte ptr es:[si+3]
        cmp     al, 83h
        jne     L_09221
        ret
L_09221:
        inc     al
        mov     byte ptr es:[si+3], al
        ret
step_var_type_dec:
        les     si, [STEP_EVENT_PTR]
        mov     al, byte ptr es:[si+3]
        cmp     al, 80h
        jne     L_09235
        ret
L_09235:
        dec     al
        mov     byte ptr es:[si+3], al
        ret
calls_get_screen_position_0923c:
        mov     word ptr [W_5A4E], calls_get_screen_position_0923c
calls_get_screen_position_09242:
        call    get_screen_position
        mov     cl, 5fh
        mov     dl, 13h
bc_int6a_09249:
        BC_UI_84
        INT_60 calls_get_screen_position_091f0
bc_int6a_09250:
        INT_61 calls_get_screen_position_09288
bc_int6a_09254:
        INT_6A step_var_value_inc, step_var_value_dec
L_0925A:
        mov     byte ptr [STEP_FIELD], 4
        ret
step_var_value_inc:
        les     si, [STEP_EVENT_PTR]
        mov     al, byte ptr es:[si+5]
        cmp     al, 7fh
        jne     L_0926D
        ret
L_0926D:
        inc     al
        mov     byte ptr es:[si+5], al
        ret
step_var_value_dec:
        les     si, [STEP_EVENT_PTR]
        mov     al, byte ptr es:[si+5]
        cmp     al, 0
        jne     L_09281
        ret
L_09281:
        dec     al
        mov     byte ptr es:[si+5], al
        ret
calls_get_screen_position_09288:
        mov     word ptr [W_5A4E], calls_get_screen_position_09288
calls_get_screen_position_0928e:
        call    get_screen_position
        mov     cl, 83h
        mov     dl, 19h
bc_int6a_09295:
        BC_UI_84
        INT_60 calls_get_screen_position_0923c
bc_int6a_0929c:
        INT_61 calls_get_screen_position_092ca
bc_int6a_092a0:
        INT_6A step_edit_row2_duration_inc, step_edit_row2_duration_dec
L_092A6:
        mov     byte ptr [STEP_FIELD], 2
        mov     word ptr [G_STEP_FIELD_VEC], calls_get_screen_position_09288
        ret
step_edit_row2_duration_inc:
        mov     cx, ax
        les     si, [STEP_EVENT_PTR]
        add     si, 6
        jmp     L_09542
step_edit_row2_duration_dec:
        mov     cx, ax
        les     si, [STEP_EVENT_PTR]
        add     si, 6
        jmp     NEAR L_0957E
calls_get_screen_position_092ca:
        mov     word ptr [W_5A4E], calls_get_screen_position_092ca
calls_get_screen_position_092d0:
        call    get_screen_position
        mov     cl, 0adh
        mov     dl, 13h
bc_int6a_092d7:
        BC_UI_84
        INT_60 calls_get_screen_position_09288
bc_int6a_092de:
        INT_61 ui_ctrl_07fb5
bc_int6a_092e2:
        INT_6A step_edit_row2_velocity_inc, step_edit_row2_velocity_dec
L_092E8:
        mov     byte ptr [STEP_FIELD], 1
        mov     word ptr [G_STEP_FIELD_VEC], calls_get_screen_position_092ca
        ret
step_edit_row2_velocity_inc:
        les     si, [STEP_EVENT_PTR]
        add     si, 6
        jmp     NEAR L_095DE
step_edit_row2_velocity_dec:
        les     si, [STEP_EVENT_PTR]
        add     si, 6
        jmp     NEAR L_095F9
L_09308:
        pusha
L_09309:
        call    off_display_2
        popa
n_off_d_v_status_0930D:
        call    step_draw_note_var
        add     si, 6
n_off_d_v_status:
        call    L_09644
        ret
off_display_2:
        BC_STATUS 0, 11, ">N:   /OFF    :     D:     V:"
status_n___off_________d_____v_0933a:
        mov     al, byte ptr es:[si+0ah]
fn_0933E:
        and     al, 7fh
        mov     dx, es
        les     di, cs:[vec_3c]
        sub     bx, bx
L_09349:
        cmp     al, byte ptr es:[bx+di]
        je      L_09355
        inc     bl
L_09350:
        cmp     bl, 40h
        jne     L_09349
L_09355:
        mov     ah, bl
mem_status_24_11:
        BC_MEM_STATUS 24, 11
L_0935C:
        mov     es, dx
        ret
step_draw_note_var:
        mov     al, byte ptr es:[si+3]
        and     al, 3
        mov     byte ptr [B_597A], al
L_09368:
        if      FW_VERSION = 172
L_0936D                         equ     $+5
        endif
        BC_STATUS_A 66, 11, P_597A, TBL_NOTE_VAR_PREFIX_LABELS
        cmp     al, 0
L_09373:
        je      br_0937D
        cmp     al, 2
L_09377:
        je      br_093D2
L_09379:
        jb      br_093D2
        jmp     SHORT br_093BC
br_0937D:
        mov     al, byte ptr es:[si+5]
        mov     ah, 0
        cmp     al, 7ch
        jb      br_09389
        mov     al, 7ch
br_09389:
        cmp     al, 4
        jae     br_0938F
        mov     al, 4
br_0938F:
        mov     byte ptr es:[si+5], al
        shl     al, 1
        sub     al, 80h
        jb      L_093AD
L_09399:
        push    ax
L_0939A:
        BC_CALL 00b60h
bc_target_0939f:
        pop     ax
        or      ax, ax
L_093A2:
        jne     status_display_93A5
        ret
status_display_09DE5:
status_display_93A5:
        BC_STATUS 90, 11, "+"
L_093AC:
        ret
L_093AD:
        neg     al
L_093AF:
        BC_CALL 00b60h
status_display_93B4:
        BC_STATUS 90, 11, "-"
L_093BB:
        ret
br_093BC:
        mov     al, byte ptr es:[si+5]
        mov     ah, 0
        cmp     al, 64h
        jb      br_093C8
        mov     al, 64h
br_093C8:
        mov     byte ptr es:[si+5], al
        sub     al, 32h
        jb      L_093AD
        jmp     SHORT L_09399
br_093D2:
        mov     al, byte ptr es:[si+5]
        cmp     al, 64h
        jb      L_093E0
        mov     al, 64h
        mov     byte ptr es:[si+5], al
L_093E0:
        mov     ah, 0
off_2_status_093E2:
        BC_CALL 00b60h
off_2_status:
        ret
off_display_3:
        BC_STATUS 36, 11, "OFF"
status_off_093f1:
        ret
W_5A50_JMP:
        jmp     word ptr [W_5A50]
step_edit_pad_note_field:
        if      FW_VERSION = 172
        call    br_09171+22
        else
        call    W_5A4E_SELF
        endif
        mov     word ptr [W_5A50], step_edit_pad_note_field
bc_int6a_093ff:
        INT_61 bc_int60_09445
bc_int6a_09403:
        INT_6A step_edit_pad_note_inc, step_edit_pad_note_dec
L_09409:
        ret
step_edit_pad_note_inc:
        mov     cl, al
        les     si, [STEP_EVENT_PTR]
        mov     al, byte ptr es:[si+4]
        mov     ah, al
        and     ax, 807fh
        add     al, cl
loop_0941B:
        cmp     al, 62h
        jb      br_09421
        mov     al, 62h
br_09421:
        cmp     al, 23h
        jae     L_09427
        mov     al, 23h
L_09427:
        or      al, ah
        mov     byte ptr es:[si+4], al
        ret
step_edit_pad_note_dec:
        mov     cl, al
        les     si, [STEP_EVENT_PTR]
        mov     al, byte ptr es:[si+4]
        mov     ah, al
        and     ax, 807fh
        sub     al, cl
        jae     loop_0941B
        mov     al, 0
        jmp     loop_0941B
bc_int60_09445:
        call    calls_get_screen_position_09512
        mov     word ptr [W_5A50], P_9445
bc_int60_0944e:
        INT_60 step_edit_pad_note_field
bc_int61_09452:
        INT_61 bc_int60_09457
L_09456:
        ret
bc_int60_09457:
        call    calls_get_screen_position_095b0
        mov     word ptr [W_5A50], P_9457
bc_int60_09460:
        INT_60 bc_int60_09445
n_off_d_v_1_status_09464:
        INT_61 ui_ctrl_07fb5
n_off_d_v_1_status:
        ret
off_display_4:
        BC_STATUS 0, 11, ">N:   /OFF          D:     V:"
status_n___off__________d_____v_0948c:
        mov     al, byte ptr es:[si+4]
        call    fn_0933E
L_09493:
        call    L_09644
        ret
jmp_word_09497:
        les     si, [STEP_EVENT_PTR]
        add     si, 6
        mov     word ptr [STEP_EVENT_PTR], si
        mov     word ptr [STEP_EVENT_SEG], es
        jmp     word ptr [W_5A4C]
W_5A4C_JMP:
        jmp     word ptr [W_5A4C]
L_094AE:
        mov     word ptr [W_5A4C], L_094AE
bc_int6a_094b4:
        INT_60 calls_softkey_tc_07a89
calls_get_screen_position_094b8:
        INT_61 calls_get_screen_position_09512
calls_get_screen_position_094bc:
        if      FW_VERSION = 150
L_09F01                         equ     $+5
        endif
        INT_6A step_edit_data1_inc, step_edit_data1_dec
calls_get_screen_position_094c2:
        call    get_screen_position
        mov     cl, 23h
        mov     dl, 37h
L_094C9:
        BC_UI_84
        mov     byte ptr [STEP_FIELD], 0
        mov     word ptr [G_STEP_FIELD_VEC], L_094AE
        ret
step_edit_data1_inc:
        mov     cl, al
        les     si, [STEP_EVENT_PTR]
        mov     al, byte ptr es:[si+4]
        mov     ah, al
        and     ax, 807fh
        add     al, cl
        cmp     al, 7fh
        jb      L_094EF
        mov     al, 7fh
L_094EF:
        or      al, ah
        mov     byte ptr es:[si+4], al
        ret
step_edit_data1_dec:
        mov     cl, al
        les     si, [STEP_EVENT_PTR]
        mov     al, byte ptr es:[si+4]
        mov     ah, al
        and     ax, 807fh
        sub     al, cl
        jae     br_0950B
        mov     al, 0
br_0950B:
        or      al, ah
        mov     byte ptr es:[si+4], al
        ret
calls_get_screen_position_09512:
        mov     word ptr [W_5A4C], P_9512
calls_get_screen_position_09518:
        call    get_screen_position
        mov     cl, 83h
        mov     dl, 19h
bc_int6a_0951f:
        BC_UI_84
        INT_60 L_094AE
bc_int6a_09526:
        INT_61 calls_get_screen_position_095b0
L_09F6A:
bc_int6a_0952a:
        INT_6A step_edit_duration_inc, step_edit_duration_dec
L_09530:
        mov     byte ptr [STEP_FIELD], 2
        mov     word ptr [G_STEP_FIELD_VEC], calls_get_screen_position_09512
        ret
step_edit_duration_inc:
        mov     cx, ax
        les     si, [STEP_EVENT_PTR]
L_09542:
        mov     dl, byte ptr es:[si+4]
        shl     dl, 1
        mov     ah, byte ptr es:[si+2]
        mov     dh, ah
        rcr     ah, 1
        shr     ah, 2
        mov     al, byte ptr es:[si+3]
        add     ax, cx
        cmp     ax, 270fh
        jb      br_09561
        mov     ax, 270fh
br_09561:
        shl     ah, 3
        rcr     dl, 1
        and     dh, 7
        or      ah, dh
        mov     byte ptr es:[si+4], dl
        mov     byte ptr es:[si+2], ah
        mov     byte ptr es:[si+3], al
        ret

step_edit_duration_dec:
        mov     cx, ax
        les     si, [STEP_EVENT_PTR]
L_0957E:
        mov     dl, byte ptr es:[si+4]
        shl     dl, 1
        mov     ah, byte ptr es:[si+2]
        mov     dh, ah
        rcr     ah, 1
        if      FW_VERSION = 150
br_09599                        equ     $+2
        endif
        shr     ah, 2
        mov     al, byte ptr es:[si+3]
        sub     ax, cx
        if      FW_VERSION = 172
        jae     br_09599
        else
        jae     br_09599+11
        endif
        sub     ax, ax
        if      FW_VERSION = 172
br_09599:
        endif
        shl     ah, 3
        rcr     dl, 1
        and     dh, 7
        or      ah, dh
        mov     byte ptr es:[si+4], dl
        mov     byte ptr es:[si+2], ah
        mov     byte ptr es:[si+3], al
        ret
calls_get_screen_position_095b0:
        mov     word ptr [W_5A4C], P_95B0
calls_get_screen_position_095b6:
        call    get_screen_position
        mov     cl, 0adh
        mov     dl, 13h
bc_int6a_095bd:
        BC_UI_84
        INT_60 calls_get_screen_position_09512
bc_int6a_095c4:
        INT_61 ui_ctrl_07fb5
bc_int6a_095c8:
        INT_6A step_edit_velocity_inc, step_edit_velocity_dec
L_095CE:
        mov     byte ptr [STEP_FIELD], 1
        mov     word ptr [G_STEP_FIELD_VEC], calls_get_screen_position_095b0
        ret
step_edit_velocity_inc:
        les     si, [STEP_EVENT_PTR]
L_095DE:
        mov     al, byte ptr es:[si+5]
        mov     ah, al
        and     ax, 807fh
        cmp     al, 7fh
        jne     L_095EC
        ret
L_095EC:
        inc     al
        or      al, ah
        mov     byte ptr es:[si+5], al
        ret
step_edit_velocity_dec:
        les     si, [STEP_EVENT_PTR]
L_095F9:
        mov     al, byte ptr es:[si+5]
        mov     ah, al
        and     ax, 807fh
        cmp     al, 2
        jae     note_d_v_status_09607
        ret
note_d_v_status_09607:
        dec     al
        or      al, ah
        mov     byte ptr es:[si+5], al
        ret
        if      FW_VERSION = 150
L_0A06C                         equ     $+28
L_0A071                         equ     $+33
        endif
note_d_v_status:
        add     si, 6
note_display:
        BC_STATUS 0, 11, ">Note:              D:     V:"
status_note______________d_____v_09636:
        mov     al, byte ptr es:[si+4]
        and     ax, 7fh
        mov     al, al
L_0963F:
        BC_MIDI_FIELD 36, 11
L_09644:
        mov     dl, byte ptr es:[si+4]
        shl     dl, 1
        mov     ah, byte ptr es:[si+2]
        rcr     ah, 1
        shr     ah, 2
        mov     al, byte ptr es:[si+3]
L_09657:
        BC_ARITH 00b84h
L_0965C:
        mov     al, byte ptr es:[si+5]
fn_09660:
        and     ax, 7fh
        push    ax
L_09664:
        BC_FIELD 174, 11
L_09669:
        pop     ax
        mov     ah, 32h
        mul     ah
        mov     bl, 7fh
        div     bl
        mov     cl, 0c6h
        mov     ch, 0ch
        mov     dl, al
        mov     dh, 5
L_0967A:
        BC_YIELD
calls_get_screen_position_0967d:
        ret
        jmp     word ptr [W_5A52]
W_5A52_SELF:
        mov     word ptr [W_5A52], W_5A52_SELF
calls_get_screen_position_09688:
        call    get_screen_position
        mov     cl, 5fh
        mov     dl, 49h
bc_int6a_0968f:
        BC_UI_84
        INT_60 calls_softkey_tc_07a89
bc_int6a_09696:
        INT_61 calls_get_screen_position_096ac
bc_int6a_0969a:
        INT_6A step_edit_data1_inc, step_edit_data1_dec
L_096A0:
        mov     byte ptr [STEP_FIELD], 0
        mov     word ptr [G_STEP_FIELD_VEC], W_5A52_SELF
        ret
calls_get_screen_position_096ac:
        mov     word ptr [W_5A52], P_96AC
calls_get_screen_position_096b2:
        call    get_screen_position
        mov     cl, 0adh
        mov     dl, 13h
bc_int6a_096b9:
        BC_UI_84
        INT_60 W_5A52_SELF
bc_int6a_096c0:
        INT_61 ui_ctrl_07fb5
poly_pressure_status_096C4:
        INT_6A step_edit_data2_inc, step_edit_data2_dec
poly_pressure_status:
        mov     byte ptr [STEP_FIELD], 1
        mov     word ptr [G_STEP_FIELD_VEC], calls_get_screen_position_096ac
        ret
poly_pressure_display:
        BC_STATUS 0, 11, ">POLY PRESSURE :            :"
status_poly_pressure______________096f9:
        mov     al, byte ptr es:[si+4]
        and     ax, 7fh
        mov     al, al
        if      FW_VERSION = 172
L_09702:
        endif
        BC_MIDI_FIELD 102, 11
L_09707:
        jmp     L_0965C
step_edit_data2_inc:
        mov     cl, al
        les     si, [STEP_EVENT_PTR]
        mov     al, byte ptr es:[si+5]
        mov     ah, al
        and     ax, 807fh
        add     al, cl
        cmp     al, 7fh
        if      FW_VERSION = 172
        jb      step_edit_data2_inc+23
        else
        jb      L_09702
        endif
        mov     al, 7fh
        if      FW_VERSION = 150
L_09702:
        endif
        or      al, ah
        mov     byte ptr es:[si+5], al
        ret
step_edit_data2_dec:
        if      FW_VERSION = 172
        db      8ah, 0c8h, 0c4h, 36h, 82h, 59h, 26h, 8ah, 44h, 05h, 8ah, 0e0h, 25h, 7fh, 80h, 2ah
        else
L_0A16A                         equ     $+2
        db      8ah, 0c8h, 0c4h, 36h, 74h, 59h, 26h, 8ah, 44h, 05h, 8ah, 0e0h, 25h, 7fh, 80h, 2ah
        endif
        db      0c1h, 73h, 02h, 0b0h, 00h
L_0973D:
        or      al, ah
        mov     byte ptr es:[si+5], al
        ret
        jmp     word ptr [W_5A54]
W_5A54_SELF:
        mov     word ptr [W_5A54], W_5A54_SELF
calls_get_screen_position_0974e:
        call    get_screen_position
        mov     cl, 5fh
        mov     dl, 49h
bc_int6a_09755:
        BC_UI_84
        INT_60 calls_softkey_tc_07a89
bc_int6a_0975c:
        INT_61 calls_get_screen_position_09772
bc_int6a_09760:
        INT_6A step_edit_data1_inc, step_edit_data1_dec
L_09766:
        mov     byte ptr [STEP_FIELD], 0
        mov     word ptr [G_STEP_FIELD_VEC], W_5A54_SELF-4
        ret
calls_get_screen_position_09772:
        mov     word ptr [W_5A54], calls_get_screen_position_09772
calls_get_screen_position_09778:
        call    get_screen_position
        mov     cl, 0adh
        mov     dl, 13h
bc_int6a_0977f:
        BC_UI_84
        INT_60 W_5A54_SELF
bc_int6a_09786:
        INT_61 ui_ctrl_07fb5
control_change_status_0978A:
        INT_6A step_edit_data2_inc, step_edit_data2_dec
control_change_status:
        mov     byte ptr [STEP_FIELD], 1
        mov     word ptr [G_STEP_FIELD_VEC], calls_get_screen_position_09772
        ret
control_change_display:
        if      FW_VERSION = 150
L_0A1FD                         equ     $+33
        endif
        BC_STATUS 0, 11, ">CONTROL CHANGE:            :"
status_control_change_____________097bf:
        mov     al, byte ptr es:[si+4]
        push    ax
        sub     ah, ah
        pop     ax
        push    si
        mov     ah, 0ch
        mul     ah
        add     ax, P_5C84
        mov     si, ax
        mov     cl, 60h
        mov     ch, 0bh
        mov     ah, 0ch
        mov     dx, ds
L_097D9:
        BC_PUTS_FAR
        db      5eh, 0e8h
calls_get_screen_position_097de:
        jl      calls_get_screen_position_097de
        ret
calls_get_screen_position_097e1:
        call    get_screen_position
        mov     cl, 5fh
        mov     dl, 49h
bc_int6a_097e8:
        BC_UI_84
        INT_60 calls_softkey_tc_07a89
bc_int6a_097ef:
        INT_61 ui_ctrl_07fb5
program_change_status_097F3:
        INT_6A step_edit_data1_inc, step_edit_data1_dec
program_change_status:
        mov     byte ptr [STEP_FIELD], 1
        mov     word ptr [G_STEP_FIELD_VEC], P_97E1
        ret
program_change_display:
        if      FW_VERSION = 150
L_0A253                         equ     $+14
L_0A257                         equ     $+18
        endif
        BC_STATUS 0, 11, ">PROGRAM CHANGE:            :"
        if      FW_VERSION = 150
        db      26h, 8ah, 44h
        endif
status_program_change_____________09828:
        if      FW_VERSION = 172
        mov     al, byte ptr es:[si+4]
        and     ax, 7fh
        else
        add     al, 25h
        jg      L_0A26F
L_0A26F:
        endif
        inc     al
L_09831:
        BC_FIELD 120, 11
L_09836:
        ret
calls_get_screen_position_09837:
        call    get_screen_position
        mov     cl, 0adh
        mov     dl, 13h
bc_int6a_0983e:
        BC_UI_84
        if      FW_VERSION = 172
        INT_60 calls_softkey_tc_07a89
bc_int6a_09845:
        INT_61 ui_ctrl_07fb5
ch_pressure_status_09849:
        INT_6A step_edit_data1_inc, step_edit_data1_dec
        endif
ch_pressure_status:
        if      FW_VERSION = 150
        INT_60 calls_softkey_tc_07a89
        db      0cdh
        popa
        inc     di
        jle     L_0A257
        push    18h
        xchg    bx, ax
        db      36h, 93h
        endif
        mov     byte ptr [STEP_FIELD], 1
        mov     word ptr [G_STEP_FIELD_VEC], P_9837
        ret
pressure_display:
        if      FW_VERSION = 150
L_0A2A9                         equ     $+14
        endif
        BC_STATUS 0, 11, ">CH PRESSURE   :            :"
status_ch_pressure________________0987e:
        mov     al, byte ptr es:[si+4]
        and     ax, 7fh
        call    fn_09660
        ret
calls_get_screen_position_09889:
        call    get_screen_position
        mov     cl, 5fh
        mov     dl, 49h
bc_int6a_09890:
        BC_UI_84
        INT_60 calls_softkey_tc_07a89
bc_int6a_09897:
        INT_61 ui_ctrl_07fb5
bc_int6a_0989b:
        INT_6A step_edit_bend_inc, step_edit_bend_dec
L_098A1:
        mov     byte ptr [STEP_FIELD], 1
        mov     word ptr [G_STEP_FIELD_VEC], P_9889
        ret
step_edit_bend_inc:
        mov     cx, ax
        les     si, [STEP_EVENT_PTR]
        mov     ax, word ptr es:[si+4]
        mov     bx, ax
        and     ax, 7f7fh
        and     bx, 8080h
        shl     al, 1
        shr     ax, 1
        add     ax, cx
        cmp     ax, 3fffh
        jb      L_098CE
        mov     ax, 3fffh
L_098CE:
        mov     cx, ax
        shl     cx, 1
        mov     ah, ch
        and     ax, 7f7fh
        or      ax, bx
L_098D9:
        mov     word ptr es:[si+4], ax
        ret
step_edit_bend_dec:
        mov     cx, ax
        les     si, [STEP_EVENT_PTR]
        mov     ax, word ptr es:[si+4]
        mov     bx, ax
        and     ax, 7f7fh
        and     bx, 8080h
        shl     al, 1
        shr     ax, 1
        sub     ax, cx
        jae     bend_0_status_098FB
        sub     ax, ax
bend_0_status_098FB:
        mov     cx, ax
        shl     cx, 1
        mov     ah, ch
        and     ax, 7f7fh
        or      ax, bx
bend_0_status:
        mov     word ptr es:[si+4], ax
        ret
bend_display:
        BC_STATUS 0, 11, ">BEND          :      0     :"
status_bend________________0______0992e:
        mov     al, byte ptr es:[si+4]
        shl     al, 1
        mov     ah, byte ptr es:[si+5]
        and     ah, 7fh
        shr     ax, 1
        sub     ax, 2000h
        je      L_09952
        jb      br_09953
        push    ax
status_display_0A385:
status_display_9945:
        BC_STATUS 108, 11, "+"
L_0994C:
        pop     ax
L_0994D:
        BC_ARITH 00b72h
L_09952:
        ret
br_09953:
        neg     ax
        push    ax
status_display_0A396:
status_display_9956:
        BC_STATUS 108, 11, "-"
L_0995D:
        pop     ax
error_insufficient_memory_b:
        BC_ARITH 00b72h
bc_int61_09963:
        ret
bc_int6a_09964:
        INT_61 step_edit_sysex_right
bc_int6a_09968:
        INT_60 step_edit_sysex_left
bc_int6a_0996c:
        if      FW_VERSION = 150
L_0A3AE                         equ     $+2
        endif
        INT_6A L_099F6, L_09A29
L_09972:
        call    calls_get_screen_position_099bf
        ret
step_edit_sysex_right:
        les     si, [STEP_EVENT_PTR]
        add     si, 6
        mov     bl, byte ptr [G_STEP_SYSEX_COL]
        sub     bh, bh
        add     bx, word ptr [G_STEP_SYSEX_SCROLL]
        mov     al, byte ptr es:[bx+si]
        cmp     al, 0f7h
L_0998C:
        jne     L_0998F
        ret
L_0998F:
        cmp     byte ptr [G_STEP_SYSEX_COL], 0bh
        je      L_0999E
        inc     byte ptr [G_STEP_SYSEX_COL]
L_0999A:
        call    calls_get_screen_position_099bf
        ret
L_0999E:
        inc     word ptr [G_STEP_SYSEX_SCROLL]
        ret
step_edit_sysex_left:
        cmp     byte ptr [G_STEP_SYSEX_COL], 0
L_099A8:
        je      br_099B2
        dec     byte ptr [G_STEP_SYSEX_COL]
L_099AE:
        call    calls_get_screen_position_099bf
        ret
br_099B2:
        cmp     word ptr [G_STEP_SYSEX_SCROLL], 0
        jne     calls_get_screen_position_099ba
        ret
calls_get_screen_position_099ba:
        dec     word ptr [G_STEP_SYSEX_SCROLL]
        ret
calls_get_screen_position_099bf:
        call    get_screen_position
        les     si, [STEP_EVENT_PTR]
        add     si, 6
        mov     ax, word ptr es:[si+1]
        cmp     ax, 47h
L_099D0:
        jne     L_099E5
        mov     ax, word ptr es:[si+3]
        cmp     ax, 4544h
L_099D9:
        jne     L_099E5
        test    byte ptr [G_STEP_TRK_CHANNEL], 40h
L_099E0:
        je      L_099E5
        jmp     NEAR bc_int61_09b34
L_099E5:
        mov     al, byte ptr [G_STEP_SYSEX_COL]
        mov     ah, 0fh
        mul     ah
        add     al, 41h
        mov     cl, al
        mov     dl, 0dh
L_099F2:
        BC_UI_84
        db      0c3h
L_099F6:
        if      FW_VERSION = 172
        db      0c4h, 36h, 82h
L_099F9:
        pop     cx
        else
        les     si, [STEP_EVENT_PTR]
        endif
        add     si, 6
        mov     bl, byte ptr [G_STEP_SYSEX_COL]
        sub     bh, bh
        add     bx, word ptr [G_STEP_SYSEX_SCROLL]
        mov     ah, byte ptr es:[bx+si]
        cmp     ah, 0f0h
L_09A0D:
        jne     L_09A10
        ret
L_09A10:
        cmp     ah, 0f7h
L_09A13:
        jne     br_09A16
        ret
br_09A16:
        cmp     ah, 7fh
        jne     br_09A1C
        ret
br_09A1C:
        add     ah, al
        cmp     ah, 7fh
        jb      L_09A25
        mov     ah, 7fh
L_09A25:
        mov     byte ptr es:[bx+si], ah
        ret
L_09A29:
        les     si, [STEP_EVENT_PTR]
        add     si, 6
        mov     bl, byte ptr [G_STEP_SYSEX_COL]
        sub     bh, bh
        add     bx, word ptr [G_STEP_SYSEX_SCROLL]
L_09A3A:
        mov     ah, byte ptr es:[bx+si]
        cmp     ah, 0f0h
L_09A40:
        jne     L_09A43
        ret
L_09A43:
        cmp     ah, 0f7h
L_09A46:
        jne     br_09A49
        ret
br_09A49:
        cmp     ah, 0
        jne     exclusive_status_09A4F
        ret
exclusive_status_09A4F:
        sub     ah, al
        jae     exclusive_status
        sub     ah, ah
exclusive_status:
        mov     byte ptr es:[bx+si], ah
        ret
exclusive_display:
        BC_STATUS 0, 11, ">Exclusive:"
status_exclusive_09a6a:
        mov     bx, word ptr es:[si+3]
        add     si, 6
        mov     ax, word ptr es:[si+1]
        cmp     ax, 47h
        jne     br_09A8A
        mov     ax, word ptr es:[si+3]
        cmp     ax, 4544h
        jne     br_09A8A
        test    byte ptr [G_STEP_TRK_CHANNEL], 40h
L_09A88:
        jne     L_09AB1
br_09A8A:
        cmp     bx, word ptr [G_STEP_SYSEX_SCROLL]
        jbe     L_09AB0
        add     si, word ptr [G_STEP_SYSEX_SCROLL]
        mov     cl, 42h
        mov     ch, 0bh
        mov     bl, 0ch
L_09A9A:
        mov     al, byte ptr es:[si]
        inc     si
        pusha
        push    es
L_09AA0:
        BC_PUT_HEX
        db      07h, 61h, 80h, 0c1h, 0fh, 3ch, 0f7h, 74h, 04h, 0feh, 0cbh
L_09AAE:
        jne     L_09A9A
L_09AB0:
        ret
L_09AB1:
        mov     al, byte ptr es:[si+5]
        push    ax
        mov     byte ptr [B_629F], al
L_09AB9:
        BC_STATUS_A 6, 11, P_629F, P_62A0
        if      FW_VERSION = 150
L_0A505                         equ     $+3
        endif
        mov     bl, byte ptr es:[si+6]
        mov     bh, 0
        push    es
        les     di, cs:[vec_3c]
        mov     al, byte ptr es:[bx+di]
        pop     es
        mov     ah, bl
        if      FW_VERSION = 150
L_0A518                         equ     $+4
        endif
L_09AD4:
        BC_MEM_STATUS 108, 11
L_09AD9:
        pop     ax
        cmp     al, 2
L_09ADC:
        je      L_09AED
        mov     al, byte ptr es:[si+7]
        mov     ah, 0
L_09AE4:
        BC_FIELD 174, 11
L_09AE9:
        call    L_09B26
        ret
L_09AED:
        mov     al, byte ptr es:[si+7]
        push    ax
        call    L_09B26
        pop     ax
        cmp     al, 32h
        jb      L_09B0B
L_09AFA:
        je      status_display_9B1C
status_display_9AFC:
        BC_STATUS 174, 11, "R"
        db      2ch, 32h
status_r_09b05:
        BC_ARITH_EXT 00bb4h
L_09B0A:
        ret
L_09B0B:
        sub     al, 32h
        neg     al
status_display_9B0F:
        BC_STATUS 174, 11, "L"
status_l_09b16:
        BC_ARITH_EXT 00bb4h
L_09B1B:
        ret
status_display_9B1C:
        BC_STATUS 174, 11, "  0"
status_0_09b25:
        ret
L_09B26:
        shr     al, 1
        mov     cl, 0c6h
        mov     ch, 0ch
        mov     dl, al
        mov     dh, 5
bc_int61_09b30:
        BC_YIELD
bc_int61_09b33:
        ret
L_0A574:
bc_int61_09b34:
        INT_61 L_09BF0
        if      FW_VERSION = 150
        db      0cdh, 60h
        cmp     ax, 809ah
        bound   bx, dword ptr ds:[bx+di + 1]
        endif
bc_int60_09b38:
        if      FW_VERSION = 172
        INT_60 L_09BFD
L_09B3C:
        cmp     byte ptr [B_5970], 1
        endif
L_09B41:
        jb      L_09B7C
        if      FW_VERSION = 150
L_09B3C:
        endif
L_09B43:
        je      L_09BB9
        mov     cl, 0adh
        mov     dl, 13h
L_09B49:
        BC_UI_84
        if      FW_VERSION = 172
        db      0cdh, 6ah, 53h, 9bh
        db      68h, 9bh, 0c3h
        else
        db      0cdh, 6ah
        db      93h, 99h, 0a8h, 99h
        db      0c3h
        endif
L_09B53:
        les     si, [STEP_EVENT_PTR]
        mov     al, byte ptr es:[si+0dh]
        inc     al
        cmp     al, 64h
        if      FW_VERSION = 172
        jb      L_09B63
        else
        jb      L_09B53+16
        endif
        mov     al, 64h
        if      FW_VERSION = 172
L_09B63:
        endif
        mov     byte ptr es:[si+0dh], al
        ret
L_09B68:
        les     si, [STEP_EVENT_PTR]
        mov     al, byte ptr es:[si+0dh]
        cmp     al, 0
        jne     L_09B75
        ret
L_09B75:
        dec     al
        mov     byte ptr es:[si+0dh], al
        ret
L_09B7C:
        mov     cl, 5
        mov     dl, 49h
L_09B80:
        BC_UI_84
        if      FW_VERSION = 172
        db      0cdh, 6ah, 8ah, 9bh
        db      9fh, 9bh, 0c3h
        else
        db      0cdh
        push    -36h
        cwd
        db      0dfh
        cwd
        ret
        endif
L_09B8A:
        les     si, [STEP_EVENT_PTR]
        mov     al, byte ptr es:[si+0bh]
        inc     al
        cmp     al, 4
        jb      L_09B9A
        mov     al, 5
        if      FW_VERSION = 150
L_09B63:
        endif
L_09B9A:
        mov     byte ptr es:[si+0bh], al
        ret
        if      FW_VERSION = 172
L_09B9F:
        endif
        les     si, [STEP_EVENT_PTR]
        mov     al, byte ptr es:[si+0bh]
        cmp     al, 1
        jne     br_09BAC
        ret
br_09BAC:
        dec     al
        cmp     al, 4
        jne     L_09BB4
        mov     al, 3
L_09BB4:
        mov     byte ptr es:[si+0bh], al
        ret
L_09BB9:
        mov     cl, 6bh
        mov     dl, 25h
L_09BBD:
        BC_UI_84
        INT_6A  L_09BC7, L_09BDC
        ret
L_09BC7:
        les     si, [STEP_EVENT_PTR]
L_09BCC                         equ     $+1
        mov     al, byte ptr es:[si+0ch]
        inc     al
        cmp     al, 3fh
        jb      L_09BD7
        mov     al, 3fh
L_09BD7:
        mov     byte ptr es:[si+0ch], al
        ret
L_09BDC:
        les     si, [STEP_EVENT_PTR]
        mov     al, byte ptr es:[si+0ch]
        cmp     al, 0
        jne     L_09BE9
        ret
L_09BE9:
        dec     al
        mov     byte ptr es:[si+0ch], al
        ret
L_09BF0:
        cmp     byte ptr [B_5970], 2
        jne     L_09BF8
        ret
L_09BF8:
        inc     byte ptr [B_5970]
        ret
L_09BFD:
        cmp     byte ptr [B_5970], 0
        jne     calls_get_screen_position_09c05
        ret
L_0A645:
calls_get_screen_position_09c05:
        dec     byte ptr [B_5970]
        ret
W_5A56_JMP:
        jmp     word ptr [W_5A56]
W_5A56_SELF:
        mov     word ptr [W_5A56], W_5A56_SELF
calls_get_screen_position_09c14:
        call    get_screen_position
        mov     cl, 5fh
        mov     dl, 1fh
bc_int6a_09c1b:
        BC_UI_84
        INT_60 calls_softkey_tc_07a89
bc_int6a_09c22:
        INT_61 calls_get_screen_position_09c2d
bc_int6a_09c26:
        INT_6A calls_event_handler_09c4c, tempo_change_status_09C5E
calls_get_screen_position_09c2c:
        ret
calls_get_screen_position_09c2d:
        mov     word ptr [W_5A56], calls_get_screen_position_09c2d
calls_get_screen_position_09c33:
        call    get_screen_position
        mov     cl, 8fh
        mov     dl, 1fh
bc_int6a_09c3a:
        BC_UI_84
        INT_60 W_5A56_SELF
bc_int6a_09c41:
        INT_61 ui_ctrl_07fb5
bc_int6a_09c45:
        INT_6A calls_event_handler_09c4c, tempo_change_status_09C5E
L_09C4B:
        ret
calls_event_handler_09c4c:
        les     bx, [STEP_EVENT_PTR]
        mov     cx, word ptr es:[bx+3]
        add     ax, cx
calls_event_handler_09c56:
        call    event_handler
        mov     word ptr es:[bx+3], ax
        ret
tempo_change_status_09C5E:
        mov     cx, ax
        les     bx, [STEP_EVENT_PTR]
        mov     ax, word ptr es:[bx+3]
        sub     ax, cx
        jae     tempo_change_status
        mov     ax, 12ch
tempo_change_status:
        call    event_handler
        mov     word ptr es:[bx+3], ax
        ret
tempo_change_percent_display:
        BC_STATUS 0, 11, ">Tempo change %:###.# \\:###.# "
status_tempo_change___09c9b:
        mov     ax, word ptr es:[si+3]
L_09C9F:
        BC_A8 96, 11
L_09CA4:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bx, word ptr es:[TBL_0014]
        mul     bx
        mov     bx, 3e8h
        div     bx
        call    event_handler
L_09CB7:
        BC_UI_A2 144, 11
L_09CBC:
        ret
step_edit_delete:
        call    seq_end_vs_position_cmp
L_09CC0:
        jne     L_09CC3
        ret
L_09CC3:
        les     si, [STEP_EVENT_PTR]
        cmp     byte ptr es:[si], 0ffh
L_09CCB:
        jne     br_09CCE
        ret
br_09CCE:
        call    L_09CD5
        call    L_09D43
        ret
L_09CD5:
        mov     byte ptr [B_0B1D], 1
        or      byte ptr es:[si+5], 80h
        mov     al, byte ptr es:[si]
        mov     ah, byte ptr es:[si+3]
L_09CE6:
        and     ax, 0f0c0h
        cmp     ax, 8040h
        jne     L_09CF3
        or      byte ptr es:[si+0bh], 80h
L_09CF3:
        cmp     al, 0
        jne     L_09D18
        sub     si, 6
L_09CFA:
        jae     br_09D04
        mov     bx, es
L_09CFE:
        sub     bx, 1000h
        mov     es, bx
br_09D04:
        mov     al, byte ptr es:[si]
        mov     ah, byte ptr es:[si+3]
        and     ax, 0f0c0h
        cmp     ax, 8040h
        jne     L_09D18
        or      byte ptr es:[si+5], 80h
L_09D18:
        ret
L_09D19:
        mov     di, word ptr [G_STEP_SEL_START]
        mov     bx, word ptr [G_STEP_SEL_END]
        cmp     di, bx
        jb      L_09D27
        xchg    di, bx
L_09D27:
        mov     si, word ptr [di]
        mov     es, word ptr [di+2]
        mov     ax, es
        or      ax, si
L_09D30:
        jne     L_09D33
        ret
L_09D33:
        pusha
L_09D34:
        call    L_09CD5
        popa
        add     di, 8
        cmp     bx, di
        jae     L_09D27
        jmp     softkey_tc
L_09D42:
        ret
L_09D43:
        inc     word ptr [SEQ_BAR_TICK]
        callf   CS1_SEG:P_71B9
        dec     word ptr [SEQ_BAR_TICK]
        callf   CS1_SEG:P_726D
        ret
step_edit_insert:
        call    seq_end_vs_position_cmp
type_status_09D59:
        jne     insert_event_dialog
        ret
insert_event_dialog:
        cmp     byte ptr [G_STEP_NOTES_HELD], 0
type_status:
        je      insert_event_dialog_09D64
        ret
L_0A7A4:
insert_event_dialog_0A7A4:
insert_event_dialog_09D64:
        BC_FILE_DIALOG 29, 2, 190, 58, "Insert Event"
L_0A7B8:
insert_event_type:
        BC_STATUS 37, 28, "Type:"
        if      FW_VERSION = 150
L_0A7C5                         equ     $+2
        endif
softkey_cancel_9D83:
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
softkey_do_it_9D8F:
        BC_SOFTKEY 5, BC_SK_BOX,   "DO IT"
softkey_do_it_09d9a:
        int     50h
bc_int5d_09d9c:
        mov     word ptr [UI_SLOT_EXIT], calls_wait_loop_0a12a
bc_int5d_09da2:
        INT_5D insert_event_refresh
bc_int5b_09da6:
        INT_67 calls_softkey_tc_09e83
bc_int5b_09daa:
        INT_68 insert_event_do_it
bc_int5b_09dae:
        INT_5B calls_softkey_tc_09e83
bc_int5c_09db2:
        INT_5C step_dialog_idle
L_09DB6:
        call    ui_ctrl_09dfe
        inc     byte ptr [G_STEP_EVENT_TYPE]
L_09DBD:
        call    insert_event_type_dec
        mov     byte ptr [G_STEP_SEL_ACTIVE], 0
        mov     byte ptr [B_0B1E], 0
        ret
insert_event_refresh:
        if      FW_VERSION = 172
byte_status_09DD0               equ     $+5
        endif
        BC_STATUS_A 67, 28, G_STEP_EVENT_TYPE, TBL_STEP_EVENT_LABELS
L_0A814:
status_display_0A814:
status_display_9DD4:
        BC_STATUS 157, 28, "       "
byte_status:
        if      FW_VERSION = 150
L_0A825                         equ     $+4
        endif
        cmp     byte ptr [G_STEP_EVENT_TYPE], 8
        je      byte_display
        ret
byte_display:
        if      FW_VERSION = 150
L_0A830                         equ     $+7
        endif
        BC_STATUS 175, 28, "Byte"
status_byte_09df3:
        mov     al, byte ptr [B_5A7B]
        sub     ah, ah
L_09DF8:
        BC_FIELD 157, 28
L_09DFD:
        ret
ui_ctrl_09dfe:
        BC_UI_CTRL 66, 27, 85, 9
bc_int6a_09e05:
        if      FW_VERSION = 172
        INT_6A insert_event_type_inc, insert_event_type_dec
        else
        INT_6A bc_int61_09e16+5, insert_event_type_dec
        endif
bc_int61_09e0b:
        INT_61 NULL_HANDLER_OFS
bc_int61_09e0f:
        cmp     byte ptr [G_STEP_EVENT_TYPE], 8
bc_int61_09e14:
        if      FW_VERSION = 172
        jne     L_09E1A
        else
        jne     bc_int61_09e16+4
        endif
bc_int61_09e16:
        INT_61 ui_ctrl_09e5d
        if      FW_VERSION = 172
L_09E1A:
        endif
        ret
        if      FW_VERSION = 172
insert_event_type_inc:
        endif
        mov     al, byte ptr [G_STEP_EVENT_TYPE]
        cmp     al, 9
        jne     L_09E23
        ret
L_09E23:
        inc     al
        test    byte ptr [B_5979], 40h
        jne     bc_int61_09e32
L_09E2C:
        cmp     al, 1
        jne     bc_int61_09e32
        if      FW_VERSION = 150
L_0A871                         equ     $+1
        endif
        inc     al
bc_int61_09e32:
        mov     byte ptr [G_STEP_EVENT_TYPE], al
        push    ax
bc_int61_09e36:
        INT_61 NULL_HANDLER_OFS
L_09E3A:
        pop     ax
        cmp     al, 8
bc_int61_09e3d:
        jne     L_09E43
bc_int61_09e3f:
        INT_61 ui_ctrl_09e5d
        if      FW_VERSION = 150
L_09E1A:
        endif
L_09E43:
        ret
        if      FW_VERSION = 150
insert_event_type_inc:
        endif
insert_event_type_dec:
        mov     al, byte ptr [G_STEP_EVENT_TYPE]
        cmp     al, 0
        jne     L_09E4C
        ret
L_0A88C:
L_09E4C:
        dec     al
        test    byte ptr [B_5979], 40h
        jne     bc_int61_09e32
        cmp     al, 1
L_0A897:
        jne     bc_int61_09e32
        mov     al, 0
        jmp     bc_int61_09e32
ui_ctrl_09e5d:
        BC_UI_CTRL 156, 27, 19, 9
bc_int61_09e64:
        INT_61 NULL_HANDLER_OFS
bc_int60_09e68:
        INT_60 ui_ctrl_09dfe
calls_setup_callback_vectors_09e6c:
        mov     al, 7fh
        mov     si, b_5a7b
        mov     bx, L_09E78
        call    setup_callback_vectors
        ret
L_09E78:
        db      3ch, 02h
L_09E7A:
        jb      L_09E7D
        ret
L_09E7D:
        mov     al, 2
        mov     byte ptr [B_5A7B], al
        ret
calls_softkey_tc_09e83:
        call    step_edit_screen_draw
calls_softkey_tc_09e86:
        call    step_edit_refresh
calls_softkey_tc_09e89:
        call    softkey_tc
        ret
insert_event_do_it:
        call    calls_get_table_status_0837d
        mov     al, byte ptr [G_STEP_CURSOR_ROW]
        mov     ah, byte ptr [G_STEP_LIST_TOP]
        push    ax
        call    L_0674A
L_09E9B:
        call    L_09EB5
        mov     ax, word ptr [SEQ_CUR_BAR]
        mov     word ptr [SEQ_CURSOR_BAR], ax
L_09EA4:
        call    calls_softkey_tc_09e83
        pop     ax
        mov     byte ptr [G_STEP_CURSOR_ROW], al
        mov     byte ptr [G_STEP_LIST_TOP], ah
        mov     byte ptr [B_0B1D], 1
        ret
L_09EB5:
        mov     al, byte ptr [G_STEP_EVENT_TYPE]
        cmp     al, 0
L_09EBA:
        je      L_09EFD
        cmp     al, 1
L_09EBE:
        je      br_09F10
        cmp     al, 8
        jne     L_09EC6
        jmp     SHORT br_09F2E
L_09EC6:
        cmp     al, 9
L_09EC8:
        jne     fn_09ECD
        jmp     NEAR L_09F9C
fn_09ECD:
        mov     bx, 6
L_09ED0:
        push    bx
tgt_09ED1:
        call    fn_0A045
        pop     cx
        mov     bl, byte ptr [G_STEP_EVENT_TYPE]
        sub     bh, bh
        shl     bx, 1
        mov     si, word ptr [bx+TBL_INSERT_EVENT_TMPL]
        push    di
        rep movsb
        pop     si
        cmp     byte ptr es:[si], 0c1h
        je      br_09EF1
        mov     al, byte ptr [SEL_TRACK]
        or      byte ptr es:[si], al
br_09EF1:
        mov     ax, word ptr [SEQ_BAR_TICK]
        mov     byte ptr es:[si+1], al
        mov     byte ptr es:[si+2], ah
        ret
L_09EFD:
        call    fn_09ECD
fn_09F00:
        push    es
        push    si
        push    di
        callf   CS1_SEG:P_7211
        pop     di
        pop     si
        pop     es
        mov     byte ptr es:[si+3], al
        ret
br_09F10:
        mov     bx, 0ch
        call    L_09ED0
        add     si, 6
        mov     al, byte ptr [SEL_TRACK]
        or      byte ptr es:[si], al
        mov     ax, word ptr [SEQ_BAR_TICK]
        mov     byte ptr es:[si+1], al
        mov     byte ptr es:[si+2], ah
        call    fn_09F00
        ret
br_09F2E:
        mov     al, byte ptr [B_5A7B]
        sub     ah, ah
        mov     cl, 6
        div     cl
        cmp     ah, 0
        je      L_09F3E
        add     al, 1
L_09F3E:
        add     al, 2
        mul     cl
        mov     bx, ax
        push    bx
L_09F45:
        call    fn_0A045
        pop     dx
        mov     cx, 6
        mov     si, P_5C3E
        push    di
        rep movsb
        pop     si
        mov     al, byte ptr [SEL_TRACK]
        or      byte ptr es:[si], al
        mov     ax, word ptr [SEQ_BAR_TICK]
        mov     byte ptr es:[si+1], al
        mov     byte ptr es:[si+2], ah
        mov     al, byte ptr [B_5A7B]
        mov     byte ptr es:[si+3], al
        sub     ax, ax
        mov     word ptr es:[si+4], ax
        mov     al, 0f0h
        stosb
        mov     cl, byte ptr [B_5A7B]
        sub     ch, ch
        sub     dx, cx
        sub     cl, 2
        mov     al, 0
        rep stosb
        mov     al, 0f7h
        stosb
        mov     cx, dx
        sub     cx, 0ch
        je      br_09F91
        mov     al, 0
        rep stosb
br_09F91:
        mov     si, P_5C44
        mov     cx, 6
        rep movsb
        jmp     NEAR calls_softkey_tc_09e83
L_09F9C:
        mov     bx, 18h
L_09F9F:
        call    fn_0A045
        mov     si, P_644A
        mov     cx, 18h
        push    di
        rep movsb
        pop     si
        mov     al, byte ptr [SEL_TRACK]
        or      byte ptr es:[si], al
        mov     ax, word ptr [SEQ_BAR_TICK]
        mov     byte ptr es:[si+1], al
        mov     byte ptr es:[si+2], ah
        jmp     NEAR calls_softkey_tc_09e83
step_edit_play:
        les     si, [STEP_EVENT_PTR]
        mov     ax, es
        or      ax, si
L_09FC8:
        jne     L_09FCB
        ret
L_09FCB:
        mov     byte ptr [G_STEP_PLAY_ACTIVE], 1
        pusha
        callf   CS1_SEG:P_71B1
        popa
        mov     al, byte ptr es:[si]
        mov     ah, byte ptr es:[si+3]
        and     ax, 0f0c0h
        cmp     ax, 8040h
L_09FE4:
        jne     calls_compare_bytes_d20_09ff4
        add     si, 6
        test    byte ptr es:[si], 0c0h
calls_compare_bytes_d20_09fed:
        jne     calls_compare_bytes_d20_09ff4
        callf   CS1_SEG:P_71B1
calls_compare_bytes_d20_09ff4:
        call    panel_event_dequeue
        cmp     bh, 85h
L_09FFA:
        jne     calls_compare_bytes_d20_09ff4
        mov     byte ptr [G_STEP_PLAY_ACTIVE], 0
        if      FW_VERSION = 172
        callf   CS1_SEG:note_off_queue_expire_all
        endif
        ret
L_0A007:
        mov     si, P_597E
L_0A00A:
        add     si, 8
        mov     di, word ptr [si]
        mov     dx, word ptr [si+2]
        mov     es, dx
        or      dx, di
L_0A016:
        je      L_0A03E
        mov     dl, byte ptr es:[di]
        mov     dh, byte ptr es:[di+3]
        mov     ch, byte ptr es:[di+4]
        and     dl, 0c0h
        cmp     dl, 40h
        jne     L_0A00A
        cmp     dh, 0a0h
handler_BC_REG_CMP:
        jb      L_0A00A
        cmp     ah, dh
        jne     L_0A00A
        cmp     dh, 0c0h
        jae     L_0A03D
        cmp     ch, al
        jne     L_0A00A
L_0A03D:
        ret
L_0A03E:
        mov     bx, 6
L_0A041:
        call    fn_0A045
        ret
fn_0A045:
        push    bx
        inc     word ptr [SEQ_BAR_TICK]
        callf   CS1_SEG:P_71B9
        dec     word ptr [SEQ_BAR_TICK]
        les     si, [FP_SEQ_AFTER_GAP]
        push    es
        push    si
        callf   CS1_SEG:P_726D
        mov     ax, word ptr [SEQ_CUR_BAR]
        mov     word ptr [SEQ_CURSOR_BAR], ax
        pop     si
        pop     es
        pop     bx
L_0A067:
        call    fn_0A06B
        ret
fn_0A06B:
        call    L_0A0CD
        mov     bp, es
        mov     dx, si
        les     di, [FP_SEQ_AFTER_GAP]
        sub     di, bx
        jae     br_0A08B
        mov     ax, es
        sub     ax, 1000h
        mov     cx, di
        shr     cx, 4
        add     ax, cx
        mov     es, ax
        and     di, 0fh
br_0A08B:
        mov     ax, word ptr [FP_SEQ_AFTER_GAP]
        mov     cx, word ptr [SEQ_AFTER_GAP_SEG]
        mov     word ptr [FP_SEQ_AFTER_GAP], di
        mov     word ptr [SEQ_AFTER_GAP_SEG], es
        push    ds
        mov     ds, cx
        mov     si, ax
L_0A09F:
        cmp     si, dx
L_0A0A1:
        jne     br_0A0A9
        mov     cx, ds
        cmp     bp, cx
        je      br_0A0BD
br_0A0A9:
        mov     cx, 3
        rep movsw
        cmp     si, 10h
        jb      L_0A09F
        sub     si, 10h
        mov     cx, ds
        inc     cx
        mov     ds, cx
        jmp     SHORT L_0A09F
br_0A0BD:
        pop     ds
        mov     cx, di
        shr     cx, 4
        mov     ax, es
        add     ax, cx
        mov     es, ax
        and     di, 0fh
        ret


L_0A0CD:
        push    ax
        push    bx
        shr     bx, 4
        inc     bx
        mov     ax, word ptr [SEQ_AFTER_GAP_SEG]
        add     bx, word ptr [SEQ_GAP_WRITE_SEG]
        sub     ax, bx
L_0A0DC:
        jae     L_0A0E1
        jmp     NEAR jmp_ferr_insufficient_memory
L_0A0E1:
        cmp     ax, word ptr [G_SEQ_MEM_RESERVE]
L_0A0E5:
        jae     L_0A0EA
        jmp     NEAR jmp_ferr_insufficient_memory
L_0A0EA:
        pop     bx
L_0A0EB:
        pop     ax
        ret
L_0A0ED:
        mov     es, word ptr [SEQ_EVENTS_SEG]
        sub     si, si
L_0A0F3:
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
L_0A0F8:
        je      L_0A108
        add     si, 6
        jae     L_0A0F3
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
        jmp     SHORT L_0A0F3
L_0A108:
        mov     ax, es
        mov     bx, si
        shr     bx, 4
L_0A10F:
        add     ax, bx
L_0A111:
        and     si, 0fh
        mov     es, ax
        mov     word ptr [W_5A5E], si
        mov     word ptr [W_5A60], ax
        ret
jmp_init_with_int50_0a11e:
        call    calls_wait_loop_0a12a
        jmp     NEAR L_0A85D
jmp_init_with_int50_0a124:
        call    calls_wait_loop_0a12a
        jmp     main_screen_enter
calls_wait_loop_0a12a:
        mov     word ptr [UI_SLOT_EXIT], NULL_HANDLER_OFS
calls_wait_loop_0a130:
        call    seq_chase_note_state
        call    wait_loop
        push    word ptr [SEQ_BAR_TICK]
        push    word ptr [SEQ_CUR_BAR]
        mov     byte ptr [G_STEP_NOTES_HELD], 0
        mov     byte ptr [SEQ_ODUB_ARMED], 0
L_0A14A                         equ     $+2
        mov     byte ptr [G_STEP_EDIT_ACTIVE], 0
        mov     byte ptr [B_597B], 0
        callf   CS1_SEG:undo_seq_flag_latch_far
        callf   CS1_SEG:seq_rewind_to_start_far
        callf   CS1_SEG:L_170C1
        pop     ax
        pop     cx
        callf   CS1_SEG:SEQ_POSITION_SET_FAR_OFS
L_0A168:
        BC_SEQ_INIT
L_0A16B:
        ret
step_edit_step_fwd:
        cmp     byte ptr [B_597B], 0
L_0A171:
        je      L_0A174
        ret
L_0A1CD_V150:
L_0A174:
        call    seq_chase_note_state
        cmp     byte ptr [B_0B15], 0
calls_screen_handler_0a17c:
        jne     L_0A187
        callf   CS1_SEG:locate_step_fwd_far
        call    screen_handler
        ret
L_0A1E0_V150:
L_0A187:
        callf   CS1_SEG:locate_next_event_far
L_0A18C:
        jb      calls_screen_handler_0a1ae
        les     si, [FP_SEQ_AFTER_GAP]
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
L_0A197:
        je      calls_screen_handler_0a1ae
L_0A199:
        call    L_0A25B
L_0A19C:
        jae     calls_screen_handler_0a1ae
        callf   CS1_SEG:SEQUENCE_DATA_READ_FAR_OFS
        cmp     al, 0ffh
L_0A1A5:
        je      calls_screen_handler_0a1ae
L_0A1A7:
        call    fn_0A30F
L_0A1AA:
        jne     L_0A187
        jmp     SHORT L_0A199
calls_screen_handler_0a1ae:
        mov     word ptr [W_0EE4], step_edit_install_transport_handlers
        callf   CS1_SEG:L_170D1
        callf   CS1_SEG:seq_pos_recalc_and_send_spp_far
        call    screen_handler
        call    calc_bar_beat
        ret
step_edit_step_back:
        cmp     byte ptr [B_597B], 0
        je      L_0A1CD
        ret
L_0A1CD:
        call    seq_chase_note_state
        cmp     byte ptr [B_0B15], 0
calls_screen_handler_0a1d5:
        jne     L_0A1E0
        callf   CS1_SEG:locate_step_back_far
calls_screen_handler_0a1dc:
        call    screen_handler
        ret
L_0A1E0:
        callf   CS1_SEG:locate_prev_event_far
        mov     ax, word ptr [SEQ_CUR_BAR]
        or      ax, word ptr [SEQ_BAR_TICK]
L_0A1EC:
        je      calls_screen_handler_0a1ae
        les     si, [FP_SEQ_AFTER_GAP]
L_0A1F2:
        call    L_0A25B
L_0A1F5:
        jae     calls_screen_handler_0a1ae
        callf   CS1_SEG:SEQUENCE_DATA_READ_FAR_OFS
        cmp     al, 0ffh
L_0A1FE:
        je      calls_screen_handler_0a1ae
L_0A200:
        call    fn_0A30F
L_0A203:
        jne     L_0A1E0
        jmp     SHORT L_0A1F2
step_edit_bar_fwd:
        cmp     byte ptr [B_597B], 0
        je      L_0A20F
        ret
L_0A20F:
        call    seq_chase_note_state
        cmp     byte ptr [B_0B15], 0
calls_screen_handler_0a217:
        jne     calls_screen_handler_0a222
        callf   CS1_SEG:P_71E5
calls_screen_handler_0a21e:
        call    screen_handler
        ret
L_0AC87:
calls_screen_handler_0a222:
        callf   CS1_SEG:P_7205
calls_screen_handler_0a227:
        call    screen_handler
        mov     word ptr [W_0EE4], step_edit_install_transport_handlers
        ret
step_edit_bar_back:
        cmp     byte ptr [B_597B], 0
L_0A236:
        je      L_0A239
        ret
L_0AC74:
L_0A239:
        call    seq_chase_note_state
        cmp     byte ptr [B_0B15], 0
calls_screen_handler_0a241:
        jne     calls_screen_handler_0a24c
        callf   CS1_SEG:P_71E9
        call    screen_handler
        ret
calls_screen_handler_0a24c:
        callf   CS1_SEG:P_7209
calls_screen_handler_0a251:
        call    screen_handler
        mov     word ptr [W_0EE4], step_edit_install_transport_handlers
        ret
L_0A25B:
        mov     al, byte ptr es:[si]
        cmp     al, 0c0h
        je      loop_0A2AA
        cmp     al, 0c1h
L_0A264:
        je      L_0A2AC
        mov     ah, al
        and     ax, 3fc0h
        cmp     ah, byte ptr [SEL_TRACK]
        jne     loop_0A2AA
        cmp     byte ptr [G_STEP_VIEW], 0
        jne     L_0A279
        ret
L_0A279:
        cmp     al, 80h
tgt_0A27B:
        je      L_0A2BC
        cmp     al, 0
        mov     al, 1
        je      br_0A292
        mov     al, byte ptr es:[si+3]
        and     al, 0f0h
        sub     al, 80h
        shr     al, 4
        mov     bx, P_5A87
        xlat

br_0A292:
        cmp     al, byte ptr [G_STEP_VIEW]
        jne     loop_0A2AA
        cmp     al, 3
        jne     br_0A2A8
        mov     al, byte ptr es:[si+4]
        and     al, 7fh
        cmp     al, byte ptr [G_STEP_VIEW_CTRL]
        jne     loop_0A2AA
br_0A2A8:
        clc
        ret
loop_0A2AA:
        stc
        ret
L_0A2AC:
        cmp     byte ptr [G_STEP_VIEW], 0
L_0A2B1:
        jne     br_0A2B4
        ret
br_0A2B4:
        cmp     byte ptr [G_STEP_VIEW], 7
        jne     loop_0A2AA
        ret
L_0A2BC:
        cmp     byte ptr [G_STEP_VIEW], 0
L_0A2C1:
        jne     L_0A2C4
        ret
L_0A2C4:
        cmp     byte ptr [G_STEP_VIEW], 8
        jne     loop_0A2AA
        ret
L_0A2CC:
        call    fn_0A2F2
        jb      br_0A2F0
        mov     al, byte ptr es:[si]
        cmp     al, 0c0h
        je      br_0A2EE
        cmp     al, 0c1h
        je      br_0A2EE
        cmp     al, 0c2h
        jne     br_0A2EE
L_0A2E0:
        call    fn_0A2F2
        jb      br_0A2F0
        mov     al, byte ptr es:[si]
        and     al, 0c0h
        cmp     al, 80h
L_0A2EC:
        jne     L_0A2E0
br_0A2EE:
        clc
        ret
br_0A2F0:
        stc
        ret
fn_0A2F2:
        or      si, si
        jne     br_0A2FE
        mov     cx, es
        cmp     cx, word ptr [SEQ_EVENTS_SEG]
        je      br_0A30D
br_0A2FE:
        sub     si, 6
        jae     L_0A30C
        and     si, 0fh
        mov     cx, es
        dec     cx
        mov     es, cx
        clc
L_0A30C:
        ret
br_0A30D:
        stc
        ret
fn_0A30F:
        mov     bx, word ptr [SEQ_CURSOR_BAR]
        mov     cx, word ptr es:[si+1]
        cmp     byte ptr es:[si], 0c0h
        jne     br_0A321
        mov     bx, cx
        sub     cx, cx
br_0A321:
        and     ch, 7
        cmp     bx, word ptr [SEQ_CUR_BAR]
        je      br_0A32B
        ret
br_0A32B:
        cmp     cx, word ptr [SEQ_BAR_TICK]
        ret
seq_end_vs_position_cmp:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bx, word ptr es:[18h]
        cmp     bx, word ptr [SEQ_CUR_BAR]
        ret
seq_chase_note_state:
        push    ds
        pop     es
        push    word ptr [SEQ_CURSOR_BAR]
        push    word ptr [SEQ_CUR_BAR]
        mov     di, P_5B88
        mov     cx, 80h
        mov     al, 0
        rep stosb
        mov     byte ptr [B_596B], 0
        les     si, [FP_SEQ_AFTER_GAP]
L_0A35B:
        callf   CS1_SEG:SCSI_STATUS_CHECK_FAR_OFS
        cmp     bx, word ptr [SEQ_CUR_BAR]
L_0A364:
        jne     L_0A3A5
        cmp     cx, word ptr [SEQ_BAR_TICK]
L_0A36A:
        jne     L_0A3A5
        cmp     byte ptr es:[si], 0ffh
L_0A370:
        je      L_0A3A5
L_0A372:
        call    fn_07E34
        jae     br_0A38A
        cmp     cl, 1
        jne     br_0A38A
        mov     bl, byte ptr es:[si+4]
        and     bl, 7fh
        push    si
        push    es
L_0A385:
        call    L_0A3BA
        pop     es
        pop     si
br_0A38A:
        mov     al, byte ptr es:[si]
        mov     ah, byte ptr es:[si+3]
        and     ax, 0f0c0h
        cmp     ax, 8040h
        jne     br_0A39E
        callf   CS1_SEG:SEQUENCE_DATA_READ_FAR_OFS
br_0A39E:
        callf   CS1_SEG:SEQUENCE_DATA_READ_FAR_OFS
        jmp     SHORT L_0A35B
L_0A3A5:
        cmp     byte ptr [B_596B], 0
        pop     ax
        pop     bx
        mov     word ptr [SEQ_CUR_BAR], ax
        mov     word ptr [SEQ_CURSOR_BAR], bx
L_0A3B3:
        jne     br_0A3B6
        ret
br_0A3B6:
        call    L_09D43
        ret
L_0A3BA:
        mov     bh, 0
        mov     al, byte ptr [bx+TBL_CHASE_NOTE_SEEN]
        or      al, al
L_0A3C2:
        jne     L_0A3CA
        mov     byte ptr [bx+TBL_CHASE_NOTE_SEEN], 1
        ret
L_0A3CA:
        pusha
        push    es
L_0A3CC:
        call    L_09CD5
        pop     es
        popa
        mov     byte ptr [B_596B], 1
        ret
        if      FW_VERSION = 172
        db      00h
        endif
L_0A3D8:
        SCR_NV_SLIDER_ASSIGN
bc_int5d_0a479:
        int     50h
bc_int5d_0a47b:
        mov     word ptr [D_0E60], slider_note_variation
assign_noteoff_status_0A481:
        if      FW_VERSION = 150
L_0AEBE                         equ     $+3
        endif
        INT_5D assign_note_off_screen
assign_noteoff_status:
        mov     word ptr [UI_SLOT_PAD_HIT], L_0A6ED
        mov     word ptr [D_0E24], L_0A85D
        call    dispatch_int6d_6e
        mov     byte ptr [SIXTEEN_LEVELS_ON], 0
        call    ui_ctrl_0a645
        ret
assign_note_off_screen:
        BC_STATUS 6, 2, "Assign note:OFF                    "
        if      FW_VERSION = 172
status_assign_noteoff_0a4c6:
        else
status_assign_noteoff_0a4c6     equ     $+1
        endif
        les     si, cs:[vec_3d]
        mov     al, byte ptr es:[si+TBL_0013]
        sub     ah, ah
        cmp     al, 0
L_0A4D3:
        jne     L_0A4D7
L_0AF0F:
        jmp     SHORT L_0A51B
L_0A4D7:
        mov     ah, byte ptr [G_SLIDER_PAD]
no_sound_status:
        BC_MEM_STATUS 78, 2
sound_display:
        BC_STATUS 114, 2, "-(No sound)"
        db      3ch, 23h, 72h, 20h, 3ch, 63h, 73h, 1ch, 0e8h, 14h, 01h, 56h, 06h, 26h, 8bh, 04h
        db      26h, 8eh, 44h, 02h, 8ch, 0c3h
L_0A507:
        or      bx, ax
        je      L_0A515
        mov     si, ax
        mov     dx, es
L_0A50F:
        BC_STATUS_B 120, 2, 16
L_0A515:
        pop     es
        pop     si
        mov     al, byte ptr es:[si+1bh]
L_0A51B:
        and     al, 3
        mov     byte ptr [G_NOTE_VAR_TYPE], al
L_0A520:
        BC_STATUS_A 66, 20, G_NOTE_VAR_TYPE, TBL_NOTE_VAR_TYPE_LABELS
L_0A529:
        BC_CLEAR_RECT 198, 14, 24, 7
L_0A530:
        BC_CLEAR_RECT 198, 24, 24, 7
off_3_status_0A537:
        call    L_0A7C9
        mov     bl, byte ptr [G_NOTE_VAR_TYPE]
        sub     bh, bh
        shl     bx, 1
        call    word ptr cs:[bx+TBL_NOTE_VAR_SHOW]
        mov     al, byte ptr [G_SLIDER_POS]
off_3_status:
        call    slider_note_variation
off_display_5:
        BC_STATUS 198, 36, "OFF"
status_off_0a556:
        mov     al, byte ptr [G_SLIDER_CTRL]
        cmp     al, 0
        jne     L_0A55E
        ret
L_0A55E:
        dec     al
        sub     ah, ah
L_0A562:
        BC_FIELD 198, 36
L_0A567:
        ret
TBL_NOTE_VAR_SHOW:
        dw      note_var_show_tune, note_var_show_env, note_var_show_env, note_var_show_filter
        ret
note_var_show_tune:
        push    ax
        mov     al, ah
        db      98h
        or      ah, ah
        js      L_0A587
L_0A579:
        BC_CALL 00ecch
status_display_A57E:
        BC_STATUS 198, 14, "+"
L_0A585:
        jmp     SHORT L_0A595
L_0A587:
        neg     ax
L_0A589:
        BC_CALL 00ecch
status_display_A58E:
        BC_STATUS 198, 14, "-"
L_0A595:
        pop     ax
        db      98h
        or      ah, ah
        js      L_0A5A8
L_0A59B:
        BC_CALL 018cch
status_display_A5A0:
        BC_STATUS 198, 24, "+"
L_0A5A7:
        ret
L_0A5A8:
        neg     ax
L_0A5AA:
        BC_CALL 018cch
status_display_A5AF:
        BC_STATUS 198, 24, "-"
L_0A5B6:
        ret
note_var_show_filter:
        push    ax
        mov     al, ah
        db      98h
        or      ah, ah
        js      L_0A5CD
L_0A5BF:
        BC_CALL 00ecch
status_display_A5C4:
        BC_STATUS 198, 14, "+"
L_0A5CB:
        jmp     SHORT L_0A5DB
L_0A5CD:
        neg     ax
L_0A5CF:
        BC_CALL 00ecch
status_display_A5D4:
        BC_STATUS 198, 14, "-"
L_0A5DB:
        pop     ax
        db      98h
        or      ah, ah
        js      L_0A5EE
L_0A5E1:
        BC_CALL 018cch
status_display_A5E6:
        BC_STATUS 198, 24, "+"
L_0A5ED:
        ret
L_0A5EE:
        neg     ax
L_0A5F0:
        BC_CALL 018cch
status_display_A5F5:
        BC_STATUS 198, 24, "-"
L_0A5FC:
        ret
note_var_show_env:
        push    ax
        mov     al, ah
        sub     ah, ah
L_0A602:
        BC_CALL 00ec9h
bc_target_0a607:
        pop     ax
        sub     ah, ah
L_0A60A:
        BC_CALL 018c9h
bc_target_0a60f:
        ret
pgm_note_entry:
        sub     al, 23h
        mov     ah, 1dh
        mul     ah
        add     ax, 1eh
        les     si, cs:[vec_3d]
        add     si, ax
        ret
note_program_lookup:
        les     si, cs:[vec_3d]
        mov     al, byte ptr es:[si+TBL_0013]
        cmp     al, 23h
        jb      L_0A635
        cmp     al, 63h
        jae     L_0A635
        call    pgm_note_entry
L_0A635:
        mov     al, byte ptr es:[si+1bh]
        and     al, 3
        mov     byte ptr [G_NOTE_VAR_TYPE], al
        mov     al, byte ptr [G_SLIDER_POS]
ui_ctrl_0a641:
        call    slider_note_variation
        retf
ui_ctrl_0a645:
        BC_UI_CTRL 76, 1, 140, 9
L_0A64C:
        INT_5F slider_note_inc
bc_int6c_0a650:
        INT_5E slider_note_dec
bc_int6c_0a654:

        INT_6C NULL_HANDLER_OFS, slider_note_right, NULL_HANDLER_OFS, slider_note_down
L_0A65E:
        les     si, cs:[vec_3d]
        mov     al, byte ptr es:[si+TBL_0013]
        cmp     al, 0
        jne     loop_0A6B9
        ret
slider_note_down:
        les     si, cs:[vec_3d]
L_0A671:
        call    note_in_range_check
L_0A674:
        jne     L_0A679
        jmp     NEAR ui_ctrl_0a7ed
L_0A679:
        jmp     NEAR ui_ctrl_0a705
slider_note_right:
        les     si, cs:[vec_3d]
L_0A681:
        call    note_in_range_check
L_0A684:
        jne     L_0A689
        jmp     NEAR ui_ctrl_0a7ed
L_0A689:
        jmp     NEAR ui_ctrl_0a757
note_in_range_check:
        cmp     byte ptr es:[si+TBL_0013], 23h
        jb      L_0A69B
        cmp     byte ptr es:[si+TBL_0013], 63h
        jae     L_0A69B
        ret
L_0A69B:
        sub     al, al
        ret
slider_note_inc:
        les     si, cs:[vec_3d]
        mov     al, byte ptr es:[si+TBL_0013]
        inc     al
        cmp     al, 23h
        jae     br_0A6AF
        mov     al, 23h
br_0A6AF:
        cmp     al, 62h
        jb      L_0A6B5
        mov     al, 62h
L_0A6B5:
        mov     byte ptr es:[si+TBL_0013], al
loop_0A6B9:
        les     si, cs:[vec_3c]
        mov     bx, 0
L_0A6C1:
        cmp     al, byte ptr es:[bx+si]
        je      L_0A6CD
        inc     bl
L_0A6C8:
        cmp     bl, 40h
        jne     L_0A6C1
L_0A6CD:
        mov     byte ptr [G_SLIDER_PAD], bl
        ret
slider_note_dec:
        les     si, cs:[vec_3d]
        mov     al, byte ptr es:[si+TBL_0013]
        sub     al, 1
        jae     br_0A6E0
        ret
br_0A6E0:
        cmp     al, 23h
        jae     L_0A6E6
        mov     al, 0
L_0A6E6:
        mov     byte ptr es:[si+TBL_0013], al
        jae     loop_0A6B9
        ret
L_0A6ED:
        db      3ch, 00h
L_0A6EF:
        jne     br_0A6F2
        ret
br_0A6F2:
        mov     al, byte ptr [G_LAST_PAD]
        mov     byte ptr [G_SLIDER_PAD], al
        mov     al, byte ptr [G_LAST_PAD_NOTE]
        les     si, cs:[vec_3d]
        mov     byte ptr es:[si+TBL_0013], al
        ret
ui_ctrl_0a705:
        BC_UI_CTRL 65, 19, 43, 9
L_0A70C:
        INT_5F  calls_calc_program_offset_0a71f
bc_int6c_0a710:
        if      FW_VERSION = 172
        INT_5E calls_calc_program_offset_0a73b
        else
L_0B14C                         equ     $+2
        INT_5E L_0A575
        endif
bc_int6c_0a714:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_0a757, ui_ctrl_0a645, ui_ctrl_0a7ed
calls_calc_program_offset_0a71e:
        ret
calls_calc_program_offset_0a71f:
        les     si, cs:[vec_3d]
        mov     al, byte ptr es:[si+TBL_0013]
        call    pgm_note_entry
        mov     al, byte ptr es:[si+1bh]
        cmp     al, 3
        jne     br_0A734
        ret
br_0A734:
        inc     al
        mov     byte ptr es:[si+1bh], al
        ret
        if      FW_VERSION = 172
calls_calc_program_offset_0a73b:
        else
L_0A575:
calls_calc_program_offset_0a73b equ     $+4
        endif
        les     si, cs:[vec_3d]
        mov     al, byte ptr es:[si+TBL_0013]
        call    pgm_note_entry
        mov     al, byte ptr es:[si+1bh]
        cmp     al, 0
        jne     ui_ctrl_0a750
        ret
ui_ctrl_0a750:
        dec     al
        mov     byte ptr es:[si+1bh], al
        ret
ui_ctrl_0a757:
        BC_UI_CTRL 197, 13, 25, 9
L_0A75E:
        INT_5F slider_high_range_inc
bc_int6c_0a762:
        INT_5E slider_high_range_dec
bc_int6c_0a766:
        INT_6C ui_ctrl_0a705, NULL_HANDLER_OFS, ui_ctrl_0a645, ui_ctrl_0a78f
L_0A770:
        ret
slider_high_range_inc:
        call    L_0A7C9
        cmp     ah, ch
        jne     L_0A779
        ret
L_0A779:
        inc     ah
        jmp     SHORT L_0A7B9
slider_high_range_dec:
        call    L_0A7C9
        cmp     ah, cl
        jne     br_0A785
        ret
br_0A785:
        dec     ah
        cmp     al, ah
        jl      ui_ctrl_0a78d
        mov     al, ah
ui_ctrl_0a78d:
        jmp     SHORT L_0A7B9
ui_ctrl_0a78f:
        BC_UI_CTRL 197, 23, 25, 9
L_0A796:
        INT_5F  L_0A7A9
bc_int6c_0a79a:
        INT_5E slider_low_range_dec
bc_int6c_0a79e:
        INT_6C ui_ctrl_0a705, NULL_HANDLER_OFS, ui_ctrl_0a757, ui_ctrl_0a7ed
L_0A7A8:
        ret
L_0A7A9:
        call    L_0A7C9
        cmp     al, ch
        jne     br_0A7B1
        ret
br_0A7B1:
        inc     al
        cmp     al, ah
        jl      L_0A7B9
        mov     ah, al
L_0A7B9:
        mov     word ptr es:[si], ax
        ret
slider_low_range_dec:
        call    L_0A7C9
        cmp     al, cl
        jne     br_0A7C5
        ret
br_0A7C5:
        dec     al
        jmp     SHORT L_0A7B9
L_0A7C9:
        les     si, cs:[vec_3d]
        mov     al, byte ptr [G_NOTE_VAR_TYPE]
        sub     ah, ah
        shl     ax, 1
        mov     bx, ax
        add     ax, 14h
        add     si, ax
        mov     ax, word ptr es:[si]
        mov     cx, word ptr cs:[bx+L_0A7E5]
        ret
L_0A7E5:
        mov.d8  byte ptr [bx+si], bh
        db      64h
        add     byte ptr [si-32h], ah
        db      32h
ui_ctrl_0a7ed:
        BC_UI_CTRL 197, 35, 19, 9
calls_setup_callback_vectors_0a7f4:
        mov     al, 80h
        mov     si, G_SLIDER_CTRL
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
bc_int6c_0a7ff:
        INT_6C slider_ctrl_change_left, NULL_HANDLER_OFS, slider_ctrl_change_up, NULL_HANDLER_OFS
L_0A809:
        ret
slider_ctrl_change_left:
        les     si, cs:[vec_3d]
L_0A80F:
        call    note_in_range_check
L_0A812:
        jne     L_0A817
        jmp     NEAR ui_ctrl_0a645
L_0A817:
        jmp     NEAR ui_ctrl_0a705
slider_ctrl_change_up:
        les     si, cs:[vec_3d]
L_0A81F:
        call    note_in_range_check
L_0A822:
        jne     L_0A827
        jmp     NEAR ui_ctrl_0a645
L_0A827:
        jmp     NEAR ui_ctrl_0a78f
slider_note_variation:
        push    ax
L_0A82B:
        call    L_0A7C9
        sub     ah, al
        cmp     byte ptr [G_NOTE_VAR_TYPE], 0
        jne     br_0A83A
        call    fn_0A853
br_0A83A:
        cmp     byte ptr [G_NOTE_VAR_TYPE], 3
        jne     L_0A844
        call    fn_0A85A
L_0A844:
        mov     bx, ax
        pop     ax
        mul     bh
        mov     bh, 7fh
        div     bh
        add     al, bl
L_0A84F:
        mov     byte ptr [NOTE_VAR_VALUE], al
        ret
fn_0A853:
        add     al, 80h
        shr     al, 1
        shr     ah, 1
        ret
fn_0A85A:
        add     al, 32h
        ret
L_0A85D:
        cmp     byte ptr [SIXTEEN_LEVELS_ON], 0
param_status_0A862:
        je      assign_16_levels_dialog_0A867
        jmp     NEAR sixteen_levels_toggle_off_init
assign_16_levels_dialog_0A867:
        call    seq_edit_allowed
param_status:
        je      assign_16_levels_dialog_0A86D
        ret
assign_16_levels_dialog_0A86D:
assign_16_levels_dialog_0B2A7:
        BC_FILE_DIALOG 16, 2, 216, 58, "Assign 16 levels"
param_display:
PARAM_DISPLAY_V150:
        BC_STATUS 37, 26, "Param:"
softkey_cancel_A891:
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
softkey_turnon:
        BC_SOFTKEY 5, BC_SK_BOX,   "TurnON"
softkey_turnon_0a8a9:
        int     50h
bc_int67_68_0a8ab:
        mov     word ptr [UI_SLOT_PAD_HIT], L_0AA03
bc_int5d_0a8b1:
        INT_67 jmp_init_with_int50_0a981
bc_int5d_0a8b5:
        INT_68 assign_16_levels_turn_on
note_off_no_sound_status_0A8B9:
        INT_5D note_off_sound_display
note_off_no_sound_status:
        call    ui_ctrl_0a9bc
        mov     al, byte ptr [SL_NOTE]
        call    sixteen_levels_note_inc_clamp
        ret
note_off_sound_display:
        if      FW_VERSION = 150
L_0B31B                         equ     $+26
        endif
        BC_STATUS 37, 16, "Note :--/OFF-(No sound)      "
status_note_offno_sound_0a8ea:
        mov     al, byte ptr [SL_NOTE]
        mov     ah, byte ptr [G_SL_PAD]
mem_status_levels_73_16:
        BC_MEM_STATUS 73, 16
L_0A8F6:
        mov     al, byte ptr [SL_NOTE]
        cmp     al, 23h
        jae     L_0A8FE
        ret
L_0A8FE:
        cmp     al, 63h
calls_calc_program_offset_0a900:
        jb      calls_calc_program_offset_0a903
        ret
calls_calc_program_offset_0a903:
        call    pgm_note_entry
        push    si
        push    es
        mov     ax, word ptr es:[si]
        mov     es, word ptr es:[si+2]
        mov     bx, es
L_0A911:
        or      bx, ax
L_0A913:
        je      L_0A91F
        mov     si, ax
        mov     dx, es
L_0A919:
        BC_STATUS_B 115, 16, 16
L_0A91F:
        BC_STATUS_A 73, 26, SL_PARAM, TBL_VELO_NOTEVAR_LABELS
        db      07h, 5eh
L_0A92A:
        BC_CLEAR_RECT 37, 36, 186, 7
type_1_status_0A931:
        cmp     byte ptr [SL_PARAM], 0
type_1_status:
        jne     type_display
        ret
type_display:
TYPE_DISPLAY_V150:
        BC_STATUS 37, 36, "Type :"
status_type__0a945:
        mov     al, byte ptr es:[si+1bh]
        and     al, 3
        mov     byte ptr [G_SL_TYPE], al
original_key_pad_status_0A94E:
        BC_STATUS_A 73, 36, P_636B, TBL_NOTE_VAR_TYPE_LABELS
        cmp     byte ptr [P_636B], 0
original_key_pad_status:
        je      original_key_pad_display
        ret
original_key_pad_display:
ORIGINAL_KEY_PAD_DISPLAY_V150:
        BC_STATUS 116, 36, "Original^key^pad:"
status_originalkeypad_0a976:
        mov     al, byte ptr [G_SL_ORIG_KEY_PAD]
        add     al, 4
L_0A97B:
        BC_ARITH_EXT 024d4h
jmp_init_with_int50_0a980:
        ret
jmp_init_with_int50_0a981:
        call    sixteen_levels_toggle_off_init
        jmp     main_screen_enter
sixteen_levels_toggle_off_init:
        mov     byte ptr [SIXTEEN_LEVELS_ON], 0
        mov     byte ptr [G_NOTE_VAR_TYPE], 0
        les     si, cs:[vec_3d]
        mov     byte ptr es:[si+TBL_0013], 0
        ret
assign_16_levels_turn_on:
        mov     byte ptr [SIXTEEN_LEVELS_ON], 1
        mov     byte ptr [NOTE_VAR_AFTER], 0
        cmp     byte ptr [SL_PARAM], 0
L_0A9AB:
        je      ui_ctrl_0a9b9
        mov     al, byte ptr [SL_NOTE]
        if      FW_VERSION = 150
L_0B3EB                         equ     $+1
        endif
        les     si, cs:[vec_3d]
        mov     byte ptr es:[si+TBL_0013], al
ui_ctrl_0a9b9:
        jmp     main_screen_enter
ui_ctrl_0a9bc:
        BC_UI_CTRL 72, 15, 139, 9
L_0A9C3:
        INT_5F tgt_0A9D6
bc_int6c_0a9c7:
        INT_5E assign_16_levels_note_dec
bc_int6c_0a9cb:
        if      FW_VERSION = 172
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_ctrl_0aa15
        else
        db      0cdh, 6ch
        db      0dah
        db      0eh
        db      0dah
L_0B40A:
        push    cs
        db      0dah
        push    cs
        dec     di
        endif
L_0A9D5:
        if      FW_VERSION = 172
        ret
        else
        test    al, 0c3h
        endif
tgt_0A9D6:
        mov     al, byte ptr [SL_NOTE]
        cmp     al, 23h
        jae     sixteen_levels_note_inc_clamp
        mov     al, 22h
sixteen_levels_note_inc_clamp:
        cmp     al, 63h
        jb      br_0A9E5
        mov     al, 22h
br_0A9E5:
        inc     al
        cmp     al, 62h
        jb      L_0A9ED
        mov     al, 62h
L_0A9ED:
        mov     byte ptr [SL_NOTE], al
        call    note_to_pad_lookup
        mov     byte ptr [G_SL_PAD], al
        ret
assign_16_levels_note_dec:
        mov     al, byte ptr [SL_NOTE]
        cmp     al, 23h
        jne     L_0A9FF
        ret
L_0A9FF:
        dec     al
        jae     L_0A9ED
L_0AA03:
        cmp     al, 0
L_0AA05:
        jne     L_0AA08
        ret
L_0AA08:
        mov     al, byte ptr [G_LAST_PAD]
        mov     byte ptr [G_SL_PAD], al
        mov     al, byte ptr [G_LAST_PAD_NOTE]
        mov     byte ptr [SL_NOTE], al
        ret
ui_ctrl_0aa15:
        BC_UI_CTRL 72, 25, 49, 9
calls_setup_callback_vectors_0aa1c:
        mov     al, 1
        mov     si, P_636A
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
bc_int6c_0aa27:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_ctrl_0a9bc, assign_16_levels_param_down
L_0AA31:
        ret
assign_16_levels_param_down:
        cmp     byte ptr [SL_PARAM], 0
ui_ctrl_0aa37:
        jne     ui_ctrl_0aa3a
        ret
ui_ctrl_0aa3a:
        BC_UI_CTRL 72, 35, 37, 9
L_0AA41:
        INT_5F calls_calc_program_offset_0aa54
bc_int6c_0aa45:
        INT_5E calls_calc_program_offset_0aa6a
bc_int6c_0aa49:
        INT_6C NULL_HANDLER_OFS, calls_calc_program_offset_0aa80, ui_ctrl_0aa15, NULL_HANDLER_OFS
calls_calc_program_offset_0aa53:
        ret
calls_calc_program_offset_0aa54:
        mov     al, byte ptr [SL_NOTE]
calls_calc_program_offset_0aa57:
        call    pgm_note_entry
        if      FW_VERSION = 150
L_0A88E equ     $+1
        endif
        mov     al, byte ptr es:[si+1bh]
        cmp     al, 3
        jne     L_0AA63
        ret
L_0AA63:
        inc     al
        mov     byte ptr es:[si+1bh], al
        ret
calls_calc_program_offset_0aa6a:
        mov     al, byte ptr [SL_NOTE]
        call    pgm_note_entry
        mov     al, byte ptr es:[si+1bh]
        cmp     al, 0
        jne     L_0AA79
        ret
L_0AA79:
        dec     al
        mov     byte ptr es:[si+1bh], al
        ret
calls_calc_program_offset_0aa80:
        mov     al, byte ptr [SL_NOTE]
        call    pgm_note_entry
        mov     al, byte ptr es:[si+1bh]
        cmp     al, 0
ui_ctrl_0aa8c:
        je      ui_ctrl_0aa8f
        ret
ui_ctrl_0aa8f:
        BC_UI_CTRL 211, 35, 13, 9
calls_setup_callback_vectors_0aa96:
        mov     al, 9
        mov     si, g_sl_orig_key_pad
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
bc_int6c_0aaa1:
        INT_6C assign_16_levels_param_down, NULL_HANDLER_OFS, ui_ctrl_0aa15, NULL_HANDLER_OFS
calls_buffer_init_10_0aaab:
        ret
        db      90h, 0eh
calls_buffer_init_10_0aaae:
        call    buffer_init_10A2
calls_call_with_check_0aab1:
        call    call_with_check
L_0AAB4:
        call    L_0AC61
        mov     ax, word ptr [PUNCH_IN_BAR]
        mov     bx, word ptr [PUNCH_IN_TICK]
        mov     cx, word ptr [PUNCH_OUT_BAR]
        mov     dx, word ptr [PUNCH_OUT_TICK]
        mov     word ptr [G_RANGE_START_BAR], ax
        mov     word ptr [G_RANGE_START_TICK], bx
        mov     word ptr [G_RANGE_END_BAR], cx
        mov     word ptr [G_RANGE_END_TICK], dx
        call    calls_state_update_0dda7
auto_punchpunch_status_0AAD8:
        call    calls_state_update_0ddb6
auto_punchpunch_status:
        SCR_AUTO_PUNCH
softkey_turnon_0ab0e:
        int     50h
bc_int5d_0ab10:
        INT_69 jmp_init_with_int50_0abae
bc_int5d_0ab14:
        INT_5D bc_int6c_0ab73
calls_dispatch_int6d_6e_0ab18:
        mov     word ptr [UI_SLOT_EXIT], L_0AB25
calls_dispatch_int6d_6e_0ab1e:
        call    bc_int6c_0ab79
calls_dispatch_int6d_6e_0ab21:
        call    dispatch_int6d_6e
        ret
L_0AB25:
        mov     word ptr [UI_SLOT_EXIT], NULL_HANDLER_OFS
        mov     ax, word ptr [G_RANGE_START_BAR]
        mov     bx, word ptr [G_RANGE_START_TICK]
        mov     cx, word ptr [G_RANGE_END_BAR]
        mov     dx, word ptr [G_RANGE_END_TICK]
        mov     word ptr [PUNCH_IN_BAR], ax
        mov     word ptr [PUNCH_IN_TICK], bx
        mov     word ptr [PUNCH_OUT_BAR], cx
        mov     word ptr [PUNCH_OUT_TICK], dx
        cmp     byte ptr [G_PUNCH_MODE], 0
L_0AB4E:
        je      br_0AB58
        cmp     byte ptr [G_PUNCH_MODE], 1
L_0AB55:
        je      L_0AB6A
        ret
br_0AB58:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ax, word ptr es:[18h]
        mov     word ptr [PUNCH_OUT_BAR], ax
        mov     word ptr [PUNCH_OUT_TICK], 0
        ret
L_0AB6A:
        sub     ax, ax
        mov     word ptr [PUNCH_IN_BAR], ax
        mov     word ptr [PUNCH_IN_TICK], ax
        ret
bc_int6c_0ab73:
        callf   CS1_SEG:auto_punch_graphic_draw
        ret
L_0B5B3:
bc_int6c_0ab79:
        INT_6C NULL_HANDLER_OFS, auto_punch_mode_right, NULL_HANDLER_OFS, auto_punch_mode_down
calls_setup_callback_vectors_0ab83:
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
        mov     al, 2
        mov     si, g_punch_mode
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
ui_ctrl_0ab94:
        BC_UI_CTRL 66, 0, 85, 9
L_0AB9B:
        ret
auto_punch_mode_right:
        cmp     byte ptr [G_PUNCH_MODE], 0
L_0ABA1:
        je      ui_ctrl_0abc1
        jmp     SHORT L_0AC11
auto_punch_mode_down:
        cmp     byte ptr [G_PUNCH_MODE], 1
L_0ABAA:
        je      L_0AC11
        jmp     SHORT ui_ctrl_0abc1
jmp_init_with_int50_0abae:
        call    L_0AB25
        mov     byte ptr [P_70F9], 1
        jmp     main_screen_enter
ui_ctrl_0abb9:
        mov     byte ptr [P_70F9], 0
        jmp     main_screen_enter
ui_ctrl_0abc1:
        BC_UI_CTRL 49, 22, 19, 9
bc_int6c_0abc8:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_0abd9, bc_int6c_0ab79, NULL_HANDLER_OFS
ui_ctrl_0abd2:
        mov     bp, ui_ctrl_0abc1
        if      FW_VERSION = 172
        call    L_0D999+9
        else
        db      0e8h
        db      6ch, 2ch
        endif
        ret
ui_ctrl_0abd9:
        BC_UI_CTRL 73, 22, 13, 9
bc_int6c_0abe0:
        INT_6C ui_ctrl_0abc1, L_0ABF1, bc_int6c_0ab79, NULL_HANDLER_OFS
L_0ABEA:
        mov     bp, ui_ctrl_0abd9
L_0ABED:
        call    L_0D9F9
        ret
L_0ABF1:
        cmp     byte ptr [G_PUNCH_MODE], 1
ui_ctrl_0abf6:
        jne     ui_ctrl_0abf9
        ret
ui_ctrl_0abf9:
        BC_UI_CTRL 91, 22, 13, 9
bc_int6c_0ac00:
        INT_6C ui_ctrl_0abd9, L_0AC11, bc_int6c_0ab79, NULL_HANDLER_OFS
L_0AC0A:
        mov     bp, L_0ABF1
L_0AC0D:
        call    L_0DA5D
        ret
L_0AC11:
        cmp     byte ptr [G_PUNCH_MODE], 0
ui_ctrl_0ac16:
        jne     ui_ctrl_0ac19
        ret
ui_ctrl_0ac19:
        BC_UI_CTRL 145, 22, 19, 9
bc_int6c_0ac20:
        INT_6C L_0ABF1, ui_ctrl_0ac31, bc_int6c_0ab79, NULL_HANDLER_OFS
L_0AC2A:
        mov     bp, L_0AC11
ui_ctrl_0ac2d:
        call    L_0DAC6
        ret
ui_ctrl_0ac31:
        BC_UI_CTRL 169, 22, 13, 9
bc_int6c_0ac38:
        INT_6C L_0AC11, ui_ctrl_0ac49, bc_int6c_0ab79, NULL_HANDLER_OFS
L_0AC42:
        mov     bp, ui_ctrl_0ac31
ui_ctrl_0ac45:
        call    L_0DB18
        ret
ui_ctrl_0ac49:
        BC_UI_CTRL 187, 22, 13, 9
bc_int6c_0ac50:
        INT_6C ui_ctrl_0ac31, NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS
L_0AC5A:
        mov     bp, ui_ctrl_0ac49
L_0AC5D:
        call    L_0DB7E
        ret
L_0AC61:
        sub     bx, bx
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[TBL_0013], 0
L_0AC6D:
        jne     L_0AC70
        ret
L_0AC70:
        mov     ax, word ptr es:[18h]
        dec     ax
        cmp     ax, word ptr [PUNCH_IN_BAR]
        if      FW_VERSION = 172
        jae     L_0AC70+18
        else
        ja      L_0B6BC
        endif
        mov     word ptr [PUNCH_IN_BAR], ax
        mov     word ptr [PUNCH_IN_TICK], bx
L_0B6BC:
        inc     ax
        cmp     ax, word ptr [PUNCH_OUT_BAR]
        ja      L_0B6CA
        mov     word ptr [PUNCH_OUT_BAR], ax
        mov     word ptr [PUNCH_OUT_TICK], bx
L_0B6CA:
        if      FW_VERSION = 172
        mov     bx, word ptr [PUNCH_IN_BAR]
calls_state_update_0ac94:
        call    state_update
        mul     bx
        cmp     ax, word ptr [PUNCH_IN_TICK]
        jae     calls_state_update_0aca5
        mov     word ptr [PUNCH_IN_TICK], 0
calls_state_update_0aca5:
        mov     bx, word ptr [PUNCH_OUT_BAR]
calls_state_update_0aca9:
        call    state_update
        mul     bx
        cmp     ax, word ptr [PUNCH_OUT_TICK]
        jae     calls_buffer_init_10_0acba
        mov     word ptr [PUNCH_OUT_TICK], 0
        endif
calls_buffer_init_10_0acba:
        ret
        db      0h
other_screen_others:
        nop
        push    cs
calls_buffer_init_10_0acbe:
        call    buffer_init_10A2
L_0ACC1:
        BC_CLEAR
L_0ACC4:
        int     50h
L_0ACC6:
        SCR_TAP_AVERAGE_CONTRAST
bc_int5d_0ad3e:
        INT_5D other_screen_refresh
calls_dispatch_int6d_6e_0ad42:
        call    bc_int6b_0ad4c
calls_dispatch_int6d_6e_0ad45:
        call    calls_setup_callback_vectors_0ad80
        call    dispatch_int6d_6e
        ret
L_0B75C:
bc_int6b_0ad4c:
        BC_WAIT_LOAD
        if      FW_VERSION = 150
L_0B760                         equ     $+1
L_0B762                         equ     $+3
        endif
        db      "OTHERS", 000h, "INIT", 000h, "VER."
        db      00h, 20h, 00h, 20h, 00h, 20h, 00h
bc_int6b_0ad66:
        INT_6B other_screen_others, other_screen_init, other_screen_ver, NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS
        ret
other_screen_refresh:
        mov     al, byte ptr [G_TAP_AVERAGING]
        add     al, 2
L_0AD7A:
        BC_OP_32 100, 3
L_0AD7F:
        ret
calls_setup_callback_vectors_0ad80:
        mov     al, 2
        mov     si, G_TAP_AVERAGING
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
        if      FW_VERSION = 150
L_0B7A5                         equ     $+10
        endif
ui_ctrl_0ad8b:
        BC_UI_CTRL 99, 2, 7, 9
L_0AD92:
        ret
other_screen_init:
        SCR_INIT_ALL_PARAMETERS
status_pressing_do_it_will_initialize_0adf7:
        call    bc_int6b_0ad4c
L_0ADFA:
        BC_BUFFER 2, 0, 2, 0, 0, 0
L_0AE03:
        int     50h
bc_int69_0ae05:
        call    bc_int6b_0ad4c
softkey_do_it_0B818:
softkey_do_it_AE08:
        BC_SOFTKEY 6, BC_SK_BOX,   "DO IT"
softkey_do_it_0ae13:
        INT_69 other_init_do_it
calls_dispatch_int6d_6e_0ae17:
        call    dispatch_int6d_6e
        ret
other_init_do_it:
        mov     si, D_0C1F
        mov     di, D_0B1F
        mov     ax, ds
        mov     es, ax
        mov     cx, 100h
        rep movsb
        mov     si, L_0AE40
        mov     di, 0
        mov     cx, 530h
        push    ds
        mov     ax, cs
        mov     ds, ax
        rep movsb
        pop     ds
        int     41h
        jmp     init_state
; the empty sequence other_init_do_it copies to ds:0, 530h bytes: header,
; 64 track names, then four per-track byte arrays
L_0AE40:
        db      000h, 000h, "Sequence      "
        db      20h, 20h, 00h, 00h, 0b0h, 04h, 01h, 00h, 02h, 00h, 04h, 04h, 00h, 00h, 0ffh, 0ffh
        db      01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        SEQ_TRACK_NAMES
; not free space: L_0AE40's per-track arrays
FREE_0BC80:
        db      64 dup (0c0h)
FREE_0BCC0:
        db      64 dup (00h)
FREE_0BD00:
        db      64 dup (64h)
FREE_0BD40:
        db      64 dup (02h)
other_screen_ver:
        PANE_FULLSCREEN_BOX
operating_system_status_0B38F:
        call    bc_int6b_0ad4c
operating_system_status:
        BC_WAIT 15, 16, BMP_MPC
operating_system_display:
        BC_STATUS 60, 10, "Operating system:    "
status_operating_system_0b3b4:
        mov     si, 0af5h
        mov     dx, ds
L_0B3B9:
        BC_STATUS_B 162, 10, 10
boot_rom_status_0B3BF:
        if      FW_VERSION = 172
boot_rom_status                 equ     $+5
        BC_TIME 84, 20, D_0A8B
        else
        BC_TIME 88, 20, D_0A8B
        endif
boot_rom_display:
        BC_STATUS 60, 30, "        Boot ROM:"
status_boot_rom_0b3dd:
        BC_TIME 162, 30, D_0AE1
L_0B3E4:
        BC_BUFFER 2, 2, 0, 0, 0, 0
bc_int69_0b3ed:
        int     50h
bc_int5d_0b3ef:
        call    bc_int6b_0ad4c
calls_dispatch_int6d_6e_0b3f2:
        INT_69 other_ver_f6
        if      FW_VERSION = 150
        db      0cdh
        pop     bp
        endif
calls_dispatch_int6d_6e_0b3f6:
        if      FW_VERSION = 172
        INT_5D NULL_HANDLER_OFS
        else
        db      0dah
        push    cs
        endif
calls_dispatch_int6d_6e_0b3fa:
        call    dispatch_int6d_6e
        ret
other_ver_f6:
        BC_TIME 60, 39, D_0AA9
        mov     word ptr [D_0E80], L_0B40C
        ret
L_0B40C:
L_0B411:
        BC_CLEAR_RECT 60, 39, 150, 7
L_0B413:
        ret
L_0B414:
        mov     ax, DATA_SEG
        mov     ds, ax
L_0B419:
        call    calls_buffer_init_10_0b41d
        retf
calls_buffer_init_10_0b41d:
        mov     byte ptr [G_MIDI_IN_RAW_MODE], 0
        nop
        push    cs
calls_buffer_init_10_0b424:
        call    buffer_init_10A2
L_0B427:
        SCR_SYNC_IN_OUT
softkey_midisw_0b4ce:
        int     50h
bc_int6b_0b4d0:
        if      FW_VERSION = 150
L_0BEE2                         equ     $+2
        endif
        INT_6B NULL_HANDLER_OFS, sync_screen_dump, midi_switch_screen_entry, NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS
        mov     si, D_0BC8
        mov     word ptr [FP_TIME_EDIT_VALUE], si
        mov     word ptr [TIME_EDIT_VALUE_SEG], ds
        call    dispatch_int6d_6e
L_0B4EC:
        call    sync_screen_refresh
ui_ctrl_0b4ef:
        call    ui_ctrl_0b4f3
        ret
ui_ctrl_0b4f3:
        BC_UI_CTRL 33, 11, 85, 9
calls_setup_callback_vectors_0b4fa:
        mov     al, 3
L_0BF0C:
        mov     si, G_SYNC_IN_MODE
L_0BF0F:
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
bc_int6c_0b505:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_0b677, L_0B51A, ui_ctrl_0b5da
bc_int5d_0b50f:
        INT_5D status_display_B525
L_0B513:
        mov     word ptr [MIDI_CLOCK_WATCHDOG], 0
        ret
L_0B51A:
        cmp     byte ptr [G_SYNC_IN_MODE], 3
L_0B51F:
        je      L_0B524
        jmp     ui_ctrl_0b626
L_0B524:
        ret
status_display_0BF35:
status_display_B525:
        BC_STATUS 76, 2, "      "
L_0B531:
        cmp     byte ptr [G_SYNC_IN_MODE], 3
in2_status:
        db      74h, 18h
in2_display:
        BC_STATUS 76, 2, "(In:2)"
status_in2_0b544:
        mov     al, byte ptr [G_SYNC_IN_PORT]
        add     al, 31h
        mov     cl, 64h
        mov     ch, 2
L_0B54D:
        BC_PUTCHAR
        db      90h
L_0B551:
        push    cs
L_0B552:
        call    smpte_frame_rate_params_load
L_0B555:
        if      FW_VERSION = 172
L_0B55A                         equ     $+5
L_0B55B                         equ     $+6
        endif
        BC_STATUS_A 34, 12, G_SYNC_IN_MODE, TBL_SYNC_MODE_LABELS
        db      0a0h
        or      al, 0ch
        and     al, 1
L_0B563:
        BC_JUMP 0264ch
status_display_B568:
        BC_STATUS 4, 22, "                  "
shift_earlyms_status_0B580:
        cmp     byte ptr [G_SYNC_IN_MODE], 1
shift_earlyms_status:
        jne     frame_rate_status_0B5A6
shift_early_display:
        BC_STATUS 4, 22, "Shift early(ms):"
status_shift_earlyms_0b59d:
        mov     al, byte ptr [G_SYNC_SHIFT_EARLY]
L_0B5A0:
        BC_ARITH_EXT 01664h
        if      FW_VERSION = 172
L_0B5A5:
        endif
        ret
frame_rate_status_0B5A6:
        cmp     byte ptr [G_SYNC_IN_MODE], 2
frame_rate_status:
        jae     frame_rate_display
        ret
frame_rate_display:
FRAME_RATE_DISPLAY_V150:
        BC_STATUS 4, 22, "Frame rate:"
        if      FW_VERSION = 172
status_frame_rate_0b5bf:
L_0B5C4                         equ     $+5
        else
L_0B5C4                         equ     $+5
        endif
        BC_STATUS_A 70, 22, G_FRAME_RATE, D_14F9
        db      80h
        les     cx, ds:[bp+di]
        if      FW_VERSION = 172
L_0B5CD                         equ     $+1
        add     dh, byte ptr [bp+di + 1]
        else
        add     dh, byte ptr [bp+di+1]
        endif
        ret
        if      FW_VERSION = 172
L_0B5D0:
L_0B5D5                         equ     $+5
        endif
        BC_STATUS_A 194, 22, G_FRAME_RATE, D_14F9
        db      0c3h
ui_ctrl_0b5da:
        cmp     byte ptr [G_SYNC_IN_MODE], 1
ui_ctrl_0b5df:
        jne     ui_ctrl_0b602
ui_ctrl_0b5e1:
        BC_UI_CTRL 99, 21, 13, 9
calls_setup_callback_vectors_0b5e8:
        mov     al, 14h
        mov     si, G_SYNC_SHIFT_EARLY
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
bc_int6c_0b5f3:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_0b677, ui_ctrl_0b4f3, ui_ctrl_0b647
bc_int5d_0b5fd:
        INT_5D status_display_B525
L_0B601:
        ret
ui_ctrl_0b602:
        cmp     byte ptr [G_SYNC_IN_MODE], 2
ui_ctrl_0b607:
        jb      ui_ctrl_0b647
ui_ctrl_0b609:
        BC_UI_CTRL 69, 21, 19, 9
calls_setup_callback_vectors_0b610:
        mov     al, 3
        mov     si, G_FRAME_RATE
        if      FW_VERSION = 150
L_0C027                         equ     $+2
        endif
        mov     bx, L_02248
        call    setup_callback_vectors
ui_ctrl_0b61b:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_0b677, ui_ctrl_0b4f3, ui_ctrl_0b647
ui_ctrl_0b625:
        ret
ui_ctrl_0b626:
        BC_UI_CTRL 99, 1, 7, 9
calls_setup_callback_vectors_0b62d:
        mov     al, 1
        mov     si, G_SYNC_IN_PORT
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
bc_int6c_0b638:
        INT_6C ui_ctrl_0b4f3, ui_ctrl_0b74a, NULL_HANDLER_OFS, ui_ctrl_0b4f3
ui_ctrl_0b642:
        INT_5D status_display_B525
ui_ctrl_0b646:
        ret
ui_ctrl_0b647:
        BC_UI_CTRL 75, 37, 19, 9
calls_setup_callback_vectors_0b64e:
        mov     al, 1
        mov     si, B_0C0C
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
bc_int6c_0b659:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_0b71f, L_0B668, NULL_HANDLER_OFS
bc_int5d_0b663:
        INT_5D status_display_B525
L_0B667:
        ret
L_0B668:
        cmp     byte ptr [G_SYNC_IN_MODE], 1
L_0B66D:
        jne     ui_ctrl_0b672
        jmp     NEAR ui_ctrl_0b5da
ui_ctrl_0b672:
        jae     ui_ctrl_0b609
ui_ctrl_0b674:
        jmp     NEAR ui_ctrl_0b4f3
ui_ctrl_0b677:
        BC_UI_CTRL 157, 11, 85, 9
calls_setup_callback_vectors_0b67e:
        mov     al, 3
        mov     si, G_SYNC_OUT_MODE
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
bc_int6c_0b689:
        INT_6C ui_ctrl_0b4f3, NULL_HANDLER_OFS, ui_ctrl_0b74a, ui_ctrl_0b6fb
bc_int5d_0b693:
        INT_5D sync_screen_refresh
L_0B697:
        ret
sync_screen_refresh:
        if      FW_VERSION = 172
L_0B69D                         equ     $+5
out_1_status_0B6A0              equ     $+8
        endif
        BC_STATUS_A 158, 12, G_SYNC_OUT_MODE, TBL_SYNC_MODE_LABELS
        db      0a0h
        db      0c6h, 0bh
out_1_status:
        BC_JUMP 026b6h
out_display_2:
        if      FW_VERSION = 172
        BC_STATUS 194, 2, "(Out:  )"
        else
        BC_STATUS 194, 2, "(Out: )"
        mov     al, byte ptr [D_0BCE]
        add     al, 41h
        mov     cl, 0e0h
        mov     ch, 2
        endif
status_out___0b6b7:
        if      FW_VERSION = 172
L_0B6BF                         equ     $+8
        BC_STATUS_A 224, 2, D_0BCE, D_7257
        else
        BC_PUTCHAR
        endif
L_0B6C0:
        BC_CLEAR_RECT 128, 22, 90, 7
frame_rate_1_status_0B6C7:
        db      80h
        les     cx, ds:[bp+di]
        add     dh, byte ptr [bp+di+1]
        ret
frame_rate_display_2:
        BC_STATUS 128, 22, "Frame rate:"
status_frame_rate_0b6e0:
        if      FW_VERSION = 172
L_0B6E5                         equ     $+5
        endif
        BC_STATUS_A 194, 22, G_FRAME_RATE, D_14F9
        db      80h
        db      3eh
        ret
L_0B6EC:
        or      ax, word ptr [bp+si]
L_0B6EE:
        jae     L_0B6F1
        ret
L_0B6F1:
        if      FW_VERSION = 172
L_0B6F6                         equ     $+5
        endif
        BC_STATUS_A 70, 22, G_FRAME_RATE, D_14F9
        db      0c3h
ui_ctrl_0b6fb:
        cmp     byte ptr [G_SYNC_OUT_MODE], 2
ui_ctrl_0b700:
        jb      ui_ctrl_0b71f
ui_ctrl_0b702:
        BC_UI_CTRL 193, 21, 19, 9
calls_setup_callback_vectors_0b709:
        mov     al, 3
        mov     si, G_FRAME_RATE
        mov     bx, L_02248
        call    setup_callback_vectors
ui_ctrl_0b714:
        INT_6C ui_ctrl_0b4f3, NULL_HANDLER_OFS, ui_ctrl_0b677, ui_ctrl_0b71f
ui_ctrl_0b71e:
        ret
ui_ctrl_0b71f:
        if      FW_VERSION = 150
L_0C136                         equ     $+5
        endif
        BC_UI_CTRL 181, 37, 19, 9
calls_setup_callback_vectors_0b726:
        mov     al, 1
        mov     si, G_SEND_MMC
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
bc_int6c_0b731:
        INT_6C ui_ctrl_0b647, NULL_HANDLER_OFS, L_0B740, NULL_HANDLER_OFS
bc_int5d_0b73b:
        INT_5D sync_screen_refresh
L_0B73F:
        ret
L_0B740:
        cmp     byte ptr [G_SYNC_OUT_MODE], 2
ui_ctrl_0b745:
        jae     ui_ctrl_0b702
ui_ctrl_0b747:
        jmp     ui_ctrl_0b677
ui_ctrl_0b74a:
        if      FW_VERSION = 172
        BC_UI_CTRL 223, 1, 13, 9
        else
        BC_UI_CTRL 223, 1, 7, 9
        endif
calls_setup_callback_vectors_0b751:
        if      FW_VERSION = 172
        mov     al, 2
        else
        db      0b0h
        db      01h
        endif
        mov     si, D_0BCE
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
bc_int6c_0b75c:
        INT_6C ui_ctrl_0b626, NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_ctrl_0b677
bc_int5d_0b766:
        INT_5D sync_screen_refresh
L_0B76A:
        ret
L_0B76B:
        mov     ax, DATA_SEG
        mov     ds, ax
L_0B770:
        call    midi_switch_screen_entry
        retf
midi_switch_screen_entry:
        mov     byte ptr [G_MIDI_IN_RAW_MODE], 0
L_0B779:
        SCR_MIDI_SW
softkey_midisw_0b867:
        int     50h
bc_int5d_0b869:
        INT_6B calls_buffer_init_10_0b41d, sync_screen_dump, NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS
bc_int5d_0b877:
        INT_5D midi_switch_refresh
L_0B87B:
        call    calls_setup_callback_vectors_0b8c4
        ret
midi_switch_refresh:
        mov     al, byte ptr [D_0C0D]
L_0B882:
        BC_CTRL_FIELD 35, 15
L_0B887:
        mov     al, byte ptr [D_0C0F]
L_0B88A:
        BC_CTRL_FIELD 97, 15
L_0B88F:
        mov     al, byte ptr [D_0C11]
L_0B892:
        BC_CTRL_FIELD 159, 15
L_0B897:
        mov     al, byte ptr [D_0C13]
L_0B89A:
        SCR_MIDI_SW_FIELDS
        db      0c3h
calls_setup_callback_vectors_0b8c4:
        mov     al, 80h
        mov     si, D_0C0D
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
ui_ctrl_0b8cf:
        BC_UI_CTRL 34, 14, 19, 9
bc_int6c_0b8d6:
        INT_6C NULL_HANDLER_OFS, calls_setup_callback_vectors_0b8fe, NULL_HANDLER_OFS, calls_setup_callback_vectors_0b8e1
L_0B8E0:
        ret
calls_setup_callback_vectors_0b8e1:
        mov     al, 1eh
        mov     si, D_0C0E
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
ui_ctrl_0b8ec:
        BC_UI_CTRL 4, 34, 55, 9
bc_int6c_0b8f3:
        INT_6C NULL_HANDLER_OFS, calls_setup_callback_vectors_0b91b, calls_setup_callback_vectors_0b8c4, NULL_HANDLER_OFS
L_0B8FD:
        ret
calls_setup_callback_vectors_0b8fe:
        mov     al, 80h
        mov     si, D_0C0F
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
ui_ctrl_0b909:
        BC_UI_CTRL 96, 14, 19, 9
bc_int6c_0b910:
        INT_6C calls_setup_callback_vectors_0b8c4, calls_setup_callback_vectors_0b938, NULL_HANDLER_OFS, calls_setup_callback_vectors_0b91b
L_0B91A:
        ret
calls_setup_callback_vectors_0b91b:
        mov     al, 1eh
        mov     si, D_0C10
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
ui_ctrl_0b926:
        BC_UI_CTRL 66, 34, 55, 9
bc_int6c_0b92d:
        INT_6C calls_setup_callback_vectors_0b8e1, calls_setup_callback_vectors_0b955, calls_setup_callback_vectors_0b8fe, NULL_HANDLER_OFS
L_0B937:
        ret
calls_setup_callback_vectors_0b938:
        mov     al, 80h
        mov     si, D_0C11
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
ui_ctrl_0b943:
        BC_UI_CTRL 158, 14, 19, 9
bc_int6c_0b94a:
        INT_6C calls_setup_callback_vectors_0b8fe, calls_setup_callback_vectors_0b972, NULL_HANDLER_OFS, calls_setup_callback_vectors_0b955
L_0B954:
        ret
calls_setup_callback_vectors_0b955:
        mov     al, 1eh
        mov     si, D_0C12
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
ui_ctrl_0b960:
        BC_UI_CTRL 128, 34, 55, 9
bc_int6c_0b967:
        INT_6C calls_setup_callback_vectors_0b91b, calls_setup_callback_vectors_0b98f, calls_setup_callback_vectors_0b938, NULL_HANDLER_OFS
L_0B971:
        ret
calls_setup_callback_vectors_0b972:
        mov     al, 80h
        mov     si, D_0C13
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
ui_ctrl_0b97d:
        BC_UI_CTRL 220, 14, 19, 9
bc_int6c_0b984:
        INT_6C calls_setup_callback_vectors_0b938, NULL_HANDLER_OFS, NULL_HANDLER_OFS, calls_setup_callback_vectors_0b98f
L_0B98E:
        ret
calls_setup_callback_vectors_0b98f:
        mov     al, 1eh
        mov     si, D_0C14
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
ui_ctrl_0b99a:
        BC_UI_CTRL 190, 34, 55, 9
bc_int6c_0b9a1:
        INT_6C calls_setup_callback_vectors_0b955, NULL_HANDLER_OFS, calls_setup_callback_vectors_0b972, NULL_HANDLER_OFS
L_0B9AB:
        ret
sync_screen_dump:
        mov     byte ptr [G_MIDI_IN_RAW_MODE], 1
        mov     ax, L_0B414
        mov     bx, cs
L_0B9B6:
        mov     cx, L_0B76B
        mov     dx, cs
        int     4ch
L_0B9BD:
        ret
main_screen_tempo_window:
        cmp     byte ptr [SEQ_RUNNING], 0
tempo_changeoff_status_0B9C3:
        je      tempo_change_1_dialog
        ret
tempo_change_1_dialog:
        mov     ax, word ptr [SEQ_CUR_BAR]
        mov     cx, word ptr [SEQ_BAR_TICK]
        mov     word ptr [G_TC_SAVED_BAR], ax
        mov     word ptr [G_TC_SAVED_TICK], cx
        callf   CS1_SEG:seq_edit_end_far
        callf   CS1_SEG:undo_seq_discard_far
        mov     al, byte ptr [SEL_SEQ]
        call    process_input
tempo_change_dialog_b:
        DLG_TEMPO_CHANGE_LIST
softkey_insert_0ba48:
        int     50h
bc_int5d_0ba4a:
        INT_5B tempo_change_exit
bc_int5d_0ba4e:
        INT_5D tempo_change_refresh
L_0BA52:
        mov     word ptr [UI_SLOT_EXIT], tempo_change_exit
L_0BA58:
        call    tempo_change_install_transport_handlers
        mov     word ptr [G_TC_CURSOR_ROW], 0
        mov     word ptr [G_TC_LIST_TOP], 0
L_0BA67:
        call    tempo_change_list_build
L_0BA6A:
        call    bc_int6c_0bc05
        mov     byte ptr [G_TC_DIRTY], 0
        mov     word ptr [G_TC_BAR_TICKS], 0
        ret
tempo_change_list_build:
        les     si, [FP_SEQ_READ_PTR]
        mov     di, P_7DD8
loop_0BA80:
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
        je      L_0BAC2
        cmp     al, 0c1h
        je      br_0BAA5
        cmp     al, 0c0h
        jne     L_0BA93
        mov     bp, word ptr es:[si+1]
L_0BA93:
        add     si, 6
        cmp     si, 10h
        jb      loop_0BA80
L_0C4AD:
        sub     si, 10h
        mov     ax, es
        inc     ax
        mov     es, ax
        jmp     SHORT loop_0BA80

br_0BAA5:
        inc     cx
        mov     dx, word ptr es:[si+1]
        and     dh, 7
        mov     word ptr [di], bp
        mov     word ptr [di+2], dx
        mov     ax, word ptr es:[si+3]
        mov     word ptr [di+4], ax
        add     di, 6
        cmp     di, P_9DC8
        jb      L_0BA93
L_0BAC2:
        if      FW_VERSION = 172
handler_BC_MEM_ALLOC            equ     $+1
        endif
        mov     ax, 0ffffh
        mov     word ptr [di], ax
        ret
tempo_change_refresh:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     al, byte ptr es:[16h]
L_0BAD0:
        BC_JUMP 00b68h
bc_target_0bad5:
        BC_CLEAR_RECT 26, 22, 200, 30
L_0BADC:
        mov     ax, word ptr [G_TC_LIST_TOP]
        mov     bx, 6
        mul     bx
        add     ax, BSS_START
        mov     si, ax
L_0BAE9:
        call    L_0BB00
        mov     al, 9
L_0BAEE:
        BC_SEQ_EDIT
L_0BAF1:
        call    L_0BB00
        mov     al, 12h
L_0BAF6:
        BC_SEQ_EDIT
L_0BAF9:
        call    L_0BB00
L_0BAFC:
        BC_PLANE_A
L_0BAFF:
        ret
L_0BB00:
        mov     ax, word ptr [si]
        inc     ax
L_0BB03:
        jne     L_0BB06
        ret
L_0BB06:
        push    si
        mov     ax, word ptr [si]
        mov     cx, word ptr [si+2]
        mov     dl, byte ptr [SEQ_BEAT_TICKS]
status_0BB10_status:
        BC_RANGE 26, 22
percent_timing_display:
        BC_STATUS 86, 22, "%:   .  \\:   ."
status__________0bb29:
        mov     ax, word ptr [si+4]
L_0BB2C:
        BC_A8 98, 22
L_0BB31:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bx, word ptr es:[TBL_0014]
        mul     bx
        mov     bx, 3e8h
        div     bx
        call    event_handler
L_0BB44:
        BC_UI_A2 146, 22
L_0BB49:
        mov     ax, word ptr [si+4]
        sub     dx, dx
        mov     bx, 28h
        div     bx
        cmp     al, 32h
        jb      L_0BB59
        mov     al, 32h
L_0BB59:
        mov     cl, 0b0h
        mov     ch, 17h
        mov     dl, al
        mov     dh, 5
L_0BB61:
        BC_YIELD
L_0BB64:
        pop     si
        add     si, 6
        ret
L_0BB69:
        mov     ax, word ptr [G_TC_CURSOR_ROW]
        mov     ah, 9
        mul     ah
        add     al, 15h
        mov     ch, al
        mov     dh, 9
        ret
tempo_change_install_transport_handlers:
        INT_6D calls_init_state_0bbae, calls_init_state_0bbae, calls_init_state_0bbae, calls_init_state_0bbae, calls_init_state_0bbae
L_0BB83:
        INT_6E tempo_change_rec, tempo_change_over_dub, jmp_mode_03102_0bb9c, tempo_change_play, tempo_change_play_start
L_0BB8F:
        ret
tempo_change_rec:
        call    calls_init_state_0bbae
L_0BB93:
        jmp     transport_handler_rec
tempo_change_over_dub:
        call    calls_init_state_0bbae
jmp_mode_03102_0bb99:
        jmp     transport_handler_over_dub
jmp_mode_03102_0bb9c:
        call    calls_init_state_0bbae
jmp_mode_03102_0bb9f:
        jmp     transport_handler_stop
tempo_change_play:
        call    calls_init_state_0bbae
L_0BBA5:
        jmp     transport_handler_play
tempo_change_play_start:
        call    calls_init_state_0bbae
calls_init_state_0bbab:
        jmp     transport_handler_play_start
L_0C5C0:
calls_init_state_0bbae:
        call    tempo_change_exit
        call    init_state
        ret
tempo_change_list_up:
        cmp     word ptr [G_TC_CURSOR_ROW], 0
L_0BBBA:
        je      br_0BBC1
        dec     word ptr [G_TC_CURSOR_ROW]
        ret
br_0BBC1:
        cmp     word ptr [G_TC_LIST_TOP], 0
        jne     L_0BBCA
        jmp     SHORT bc_int6c_0bc05
L_0BBCA:
        dec     word ptr [G_TC_LIST_TOP]
        ret
tempo_change_list_down:
        mov     ax, word ptr [G_TC_CURSOR_ROW]
        cmp     ax, 2
L_0BBD5:
        je      br_0BBE9
        call    tempo_change_entry_ptr
        jne     L_0BBDD
        ret
L_0C5EF:
L_0BBDD:
        if      FW_VERSION = 172
error_working_memory_full       equ     $+1
        endif
        inc     word ptr [G_TC_CURSOR_ROW]
        call    tempo_change_entry_ptr
        jne     L_0BBE8
        jmp     SHORT bc_int6c_0bc4f
L_0BBE8:
        ret
br_0BBE9:
        call    tempo_change_entry_ptr
        jne     L_0BBEF
        ret
L_0BBEF:
        inc     word ptr [G_TC_LIST_TOP]
        call    tempo_change_entry_ptr
L_0BBF6:
        jne     L_0BBFA
        jmp     SHORT bc_int6c_0bc4f
L_0BBFA:
        ret
tempo_change_close:
        call    tempo_change_exit
bc_int6c_0bbfe:
        mov     word ptr [UI_SLOT_EXIT], NULL_HANDLER_OFS
        ret
L_0C617:
bc_int6c_0bc05:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, tempo_change_enter_list
bc_int67_68_0bc0f:
        INT_65 tempo_change_enter_list
bc_int6a_0bc13:
        INT_67 tempo_change_close
bc_int6a_0bc17:
        INT_68 tempo_change_enter_list
bc_int6a_0bc1b:
        INT_6A tempo_change_onoff_inc, tempo_change_onoff_dec
bc_int5d_0bc21:
        INT_5D ui_ctrl_0bc26
ui_ctrl_0bc25:
        ret
ui_ctrl_0bc26:
        call    tempo_change_refresh
ui_ctrl_0bc29:
        BC_UI_CTRL 103, 10, 19, 9
L_0BC30:
        ret
tempo_change_onoff_inc:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     byte ptr es:[16h], 1
        ret
tempo_change_onoff_dec:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     byte ptr es:[16h], 0
        ret
tempo_change_enter_list:
        call    tempo_change_entry_ptr
bc_int6c_0bc4a:
        je      bc_int6c_0bc4f
bc_int6c_0bc4c:
        jmp     NEAR bc_int6c_0bdd5
L_0C661:
bc_int6c_0bc4f:
        INT_6C bc_int6c_0bc05, bc_int6c_0bc05, tempo_change_list_up, NULL_HANDLER_OFS
bc_int6a_0bc59:
        INT_6A NULL_HANDLER_OFS, NULL_HANDLER_OFS
bc_int67_68_0bc5f:
        INT_65 tempo_change_delete
bc_int5d_0bc63:
        INT_67 tempo_change_close
bc_int5d_0bc67:
        INT_68  L_0BE6F
bc_int5d_0bc6b:
        INT_5D tempo_change_row_refresh
L_0BC6F:
        db      0e8h, 0e1h, 00h
        ret
tempo_change_row_refresh:
        call    tempo_change_refresh
L_0BC76:
        call    L_0BB69
        mov     cl, 19h
        mov     dl, 9
L_0BC7D:
        BC_UI_84
        db      0e8h, 0b0h, 01h, 75h
        db      01h, 0c3h
L_0BC86:
        call    bc_int6c_0bc8d
bc_int6c_0bc89:
        call    tempo_change_bar_refresh
        ret
bc_int6c_0bc8d:
        INT_6C bc_int6c_0bc05, bc_int6c_0bd66, tempo_change_list_up, tempo_change_list_down
bc_int6a_0bc97:
        INT_6A tempo_change_bar_inc, tempo_change_bar_dec
bc_int5d_0bc9d:
        INT_5D tempo_change_bar_refresh
L_0BCA1:
        ret
tempo_change_bar_inc:
        call    tempo_change_entry_ptr_mark_dirty
        add     ax, word ptr [si]
        mov     bx, word ptr [si+6]
        cmp     bx, -1
        jne     L_0BCB9
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bx, word ptr es:[18h]
        dec     bx
L_0BCB9:
        cmp     ax, bx
L_0BCBB:
        jb      L_0BCBF
        mov     ax, bx
L_0BCBF:
        mov     word ptr [si], ax
        mov     bx, ax
        shl     bx, 1
        mov     di, word ptr [bx+P_D1D8]
        mov     word ptr [G_TC_BAR_TICKS], di
        mov     ax, word ptr [si+2]
        cmp     ax, di
        jb      L_0BCDA
        mov     ax, di
        dec     ax
        mov     word ptr [si+2], ax
L_0BCDA:
        mov     bx, word ptr [si]
        cmp     bx, word ptr [si+6]
        je      L_0BCE2
        ret
L_0BCE2:
        cmp     ax, word ptr [si+8]
L_0BCE5:
        jae     L_0BCE8
        ret
L_0BCE8:
        mov     ax, word ptr [si+8]
        mov     word ptr [si+2], ax
        ret
tempo_change_bar_dec:
        call    tempo_change_entry_ptr_mark_dirty
        mov     bx, ax
        mov     ax, word ptr [si]
        sub     ax, bx
L_0BCF8:
        jae     L_0BCFC
        sub     ax, ax
L_0BCFC:
        mov     bx, word ptr [si-6]
        cmp     si, P_7DD8
        jne     L_0BD08
        mov     bx, 0
L_0BD08:
        cmp     ax, bx
L_0BD0A:
        jae     L_0BD0E
        mov     ax, bx
L_0BD0E:
        mov     word ptr [si], ax
        mov     bx, ax
        shl     bx, 1
        mov     di, word ptr [bx+P_D1D8]
        mov     word ptr [G_TC_BAR_TICKS], di
        mov     ax, word ptr [si+2]
        cmp     ax, di
        jb      L_0BD29
        mov     ax, di
        dec     ax
        mov     word ptr [si+2], ax
L_0BD29:
        mov     bx, word ptr [si]
        cmp     si, P_7DD8
        jne     L_0BD32
        ret
L_0BD32:
        cmp     bx, word ptr [si-6]
        je      L_0BD38
        ret
L_0BD38:
        cmp     ax, word ptr [si-4]
L_0BD3B:
        jb      L_0BD3E
        ret
L_0BD3E:
        mov     ax, word ptr [si-4]
        mov     word ptr [si+2], ax
        ret
tempo_change_bar_refresh:
        call    tempo_change_refresh
L_0BD48:
        call    L_0BB69
        mov     cl, 19h
        mov     dl, 13h
L_0BD4F:
        BC_UI_84
        db      0c3h, 0e8h, 0ddh, 00h
L_0BD56:
        jne     L_0BD59
        ret
L_0BD59:
        mov     bx, word ptr [si]
        shl     bx, 1
        mov     di, word ptr [bx+P_D1D8]
        mov     word ptr [G_TC_BAR_TICKS], di
        ret
bc_int6c_0bd66:
        INT_6C bc_int6c_0bc8d, bc_int6c_0bdd5, tempo_change_list_up, tempo_change_list_down
        if      FW_VERSION = 150
        INT_6A  tempo_change_tick_inc, tempo_change_tick_dec
        endif
bc_int6a_0bd70:
        if      FW_VERSION = 172
        INT_6A tempo_change_tick_inc, tempo_change_tick_dec
bc_int5d_0bd76:
        endif
        INT_5D tempo_change_tick_refresh
L_0BD7A:
        db      0e8h, 0d6h, 0ffh
        ret
tempo_change_tick_refresh:
        call    tempo_change_refresh
L_0BD81:
        call    L_0BB69
        mov     cl, 31h
        mov     dl, 1fh
L_0BD88:
        BC_UI_84
        ret
tempo_change_tick_inc:
        call    tempo_change_entry_ptr_mark_dirty
L_0BD8F:
        add     ax, word ptr [si+2]
        if      FW_VERSION = 150
L_0C7A6                         equ     $+2
        endif
        cmp     ax, word ptr [G_TC_BAR_TICKS]
        jb      br_0BD9C
L_0C7AA:
        mov     ax, word ptr [G_TC_BAR_TICKS]
        dec     ax
br_0BD9C:
        mov     bx, word ptr [si]
        cmp     bx, word ptr [si+6]
        jne     L_0BDAB
        cmp     ax, word ptr [si+8]
        jb      L_0BDAB
        mov     ax, word ptr [si+8]
L_0BDAB:
        mov     word ptr [si+2], ax
        ret
tempo_change_tick_dec:
        call    tempo_change_entry_ptr_mark_dirty
        mov     bx, word ptr [si+2]
        sub     bx, ax
        jae     br_0BDBB
        sub     bx, bx
br_0BDBB:
        cmp     si, P_7DD8
        je      bc_int6c_0bdd1
        mov     ax, word ptr [si]
        cmp     ax, word ptr [si-6]
        jne     bc_int6c_0bdd1
        mov     ax, word ptr [si-4]
        cmp     bx, ax
        jae     bc_int6c_0bdd1
        mov     bx, ax
bc_int6c_0bdd1:
        mov     word ptr [si+2], bx
        ret
L_0C7E7:
bc_int6c_0bdd5:
        INT_6C bc_int6c_0bd66, bc_int6c_0be4c, tempo_change_list_up, tempo_change_list_down
bc_int6a_0bddf:
        INT_6A tempo_change_ratio_inc, tempo_change_ratio_dec
bc_int67_68_0bde5:
        INT_65 tempo_change_delete
bc_int5d_0bde9:
        INT_67 tempo_change_close
bc_int5d_0bded:
        INT_68  L_0BE6F
bc_int5d_0bdf1:
        INT_5D tempo_change_ratio_refresh
L_0BDF5:
        ret
tempo_change_ratio_refresh:
        call    tempo_change_refresh
L_0BDF9:
        call    L_0BB69
        mov     cl, 61h
        mov     dl, 1fh
L_0BE00:
        BC_UI_84
        ret
tempo_change_ratio_inc:
        call    tempo_change_entry_ptr_mark_dirty
L_0BE07:
        add     ax, word ptr [si+4]
        cmp     ax, 270fh
        jb      L_0BE12
L_0C821:
        mov     ax, 270fh
L_0BE12:
        mov     word ptr [si+4], ax
        ret
tempo_change_ratio_dec:
        call    tempo_change_entry_ptr_mark_dirty
        mov     bx, word ptr [si+4]
L_0C82E:
        sub     bx, ax
        jae     br_0BE22
        sub     bx, bx
br_0BE22:
        cmp     bx, 64h
        jae     br_0BE2A
        mov     bx, 64h
br_0BE2A:
        mov     word ptr [si+4], bx
        ret
tempo_change_entry_ptr_mark_dirty:
        mov     byte ptr [G_TC_DIRTY], 1
tempo_change_entry_ptr:
        push    ax
        push    bx
        mov     ax, word ptr [G_TC_LIST_TOP]
        add     ax, word ptr [G_TC_CURSOR_ROW]
        mov     bx, 6
        mul     bx
        add     ax, P_7DD8
        mov     si, ax
        mov     bx, word ptr [si]
        inc     bx
        pop     bx
        pop     ax
        ret
bc_int6c_0be4c:
        INT_6C bc_int6c_0bdd5, bc_int6c_0bc05, tempo_change_list_up, tempo_change_list_down
bc_int6a_0be56:
        INT_6A tempo_change_ratio_inc, tempo_change_ratio_dec
bc_int5d_0be5c:
        INT_5D L_0BE61
L_0BE60:
        ret
L_0BE61:
        call    tempo_change_refresh
L_0BE64:
        call    L_0BB69
        mov     cl, 91h
        mov     dl, 1fh
L_0BE6B:
        BC_UI_84
        db      0c3h
L_0BE6F:
        db      0e8h, 0bch, 0ffh
L_0BE72:
        mov     ax, word ptr [si]
        mov     cx, word ptr [si+2]
        cmp     ax, 0ffffh
        jne     br_0BE8E
        mov     ax, 0
        mov     cx, 0
        cmp     si, P_7DD8
        je      br_0BE8E
        mov     ax, word ptr [si-6]
        mov     cx, word ptr [si-4]
br_0BE8E:
        push    ax
        push    cx
        mov     dx, si
L_0BE92:
        lodsw
        cmp     si, P_9DC8
L_0BE97:
        jae     L_0BEC1
        cmp     ax, 0ffffh
        jne     L_0BE92
        mov     di, si
        add     di, 6
loop_0BEA3:
        mov     ax, word ptr [si]
        mov     word ptr [di], ax
        sub     si, 2
        sub     di, 2
        cmp     di, dx
        jae     loop_0BEA3
        pop     cx
        pop     ax
        mov     si, dx
        mov     word ptr [si], ax
        mov     word ptr [si+2], cx
        mov     ax, 3e8h
        mov     word ptr [si+4], ax
        ret
L_0BEC1:
        pop     cx
        pop     ax
        ret
tempo_change_delete:
        call    tempo_change_entry_ptr
L_0BEC7:
        jne     br_0BECA
        ret
br_0BECA:
        mov     byte ptr [G_TC_DIRTY], 1
        mov     di, si
        add     si, 6
        mov     ax, ds
        mov     es, ax
L_0BED8:
        lodsw
        stosw
        cmp     ax, 0ffffh
        jne     L_0BED8
        call    tempo_change_entry_ptr
        if      FW_VERSION = 172
L_0BEE2:
        endif
        je      br_0BEE5
        ret
br_0BEE5:
        call    tempo_change_list_up
        ret
tempo_change_exit:
        mov     word ptr [UI_SLOT_EXIT], NULL_HANDLER_OFS
        cmp     byte ptr [G_TC_DIRTY], 0
L_0BEF4:
        jne     br_0BEF9
        jmp     NEAR br_0BFA9
br_0BEF9:
        push    ds
        callf   CS1_SEG:undo_seq_save_far
        callf   CS1_SEG:undo_seq_flag_latch_far
        callf   CS1_SEG:seq_edit_begin_far
        les     di, [FP_SEQ_GAP_WRITE]
        lds     si, [FP_SEQ_AFTER_GAP]
        mov     bp, 0
        mov     bx, P_7DD8
L_0BF17:
        mov     ax, word ptr ss:[bx]
        inc     ax
L_0BF1B:
        je      L_0BF68
L_0BF1D:
        call    L_0BFC6
L_0BF20:
        jb      br_0BF72
        cmp     bp, word ptr ss:[bx]
        jb      br_0BF36
L_0BF27:
        jne     L_0BF3B
        cmp     dx, word ptr ss:[bx+2]
L_0BF2D:
        ja      L_0BF3B
        jne     br_0BF36
        cmp     byte ptr [si], 0c0h
L_0BF34:
        jne     L_0BF3B
br_0BF36:
        call    L_0BFF2
        jmp     SHORT L_0BF1D
L_0BF3B:
        mov     ax, word ptr ss:[bx]
        cmp     ax, word ptr ss:[bx+6]
L_0BF42:
        jne     L_0C965
        mov     ax, word ptr ss:[bx+2]
        cmp     ax, word ptr ss:[bx+8]
L_0BF4C:
        jne     L_0C965
        add     bx, 6
        jmp     SHORT L_0BF3B
L_0C965:
        db      0b0h, 0c1h, 0aah, 36h, 8bh, 47h, 02h, 0abh, 36h, 8bh, 47h, 04h, 0abh, 0b0h, 00h, 0aah
        db      83h, 0c3h, 06h, 0ebh, 0afh
L_0BF68:
        call    L_0BFC6
L_0BF6B:
        jb      br_0BF72
L_0BF6D:
        call    L_0BFF2
        jmp     SHORT L_0BF68
br_0BF72:
        mov     word ptr ss:[FP_SEQ_GAP_WRITE], di
        mov     word ptr ss:[SEQ_GAP_WRITE_SEG], es
        mov     word ptr ss:[FP_SEQ_AFTER_GAP], si
        mov     word ptr ss:[SEQ_AFTER_GAP_SEG], ds
        pop     ds
        mov     byte ptr [G_TC_DIRTY], 0
        callf   CS1_SEG:seq_rewind_to_start_far
        callf   CS1_SEG:P_7241
        mov     ax, word ptr [G_TC_SAVED_BAR]
        mov     cx, word ptr [G_TC_SAVED_TICK]
        callf   CS1_SEG:SEQ_POSITION_SET_FAR_OFS
        call    main_screen_enter
        call    main_screen_tempo_field
        ret
br_0BFA9:
        callf   CS1_SEG:seq_edit_begin_far
        callf   CS1_SEG:P_7241
        mov     ax, word ptr [G_TC_SAVED_BAR]
        mov     cx, word ptr [G_TC_SAVED_TICK]
        callf   CS1_SEG:SEQ_POSITION_SET_FAR_OFS
        call    main_screen_enter
        call    main_screen_tempo_field
        ret
L_0BFC6:
        mov     al, byte ptr [si]
        cmp     al, 0ffh
        je      br_0BFF0
        cmp     al, 0c1h
L_0BFCE:
        je      L_0BFE2
        and     al, 0c0h
        mov     dx, word ptr [si+1]
        and     dh, 7
        cmp     al, 0c0h
        jne     br_0BFE0
        mov     bp, dx
        sub     dx, dx
br_0BFE0:
        clc
        ret
L_0BFE2:
        add     si, 6
L_0BFE5:
        jae     L_0BFC6
        mov     ax, ds
        add     ax, 1000h
        mov     ds, ax
        jmp     SHORT L_0BFC6
br_0BFF0:
        stc
        ret
L_0BFF2:
        call    seq_event_copy6
        and     al, 0c0h
        cmp     al, 80h
L_0BFF9:
        je      L_0BFFC
        ret
L_0BFFC:
        call    seq_event_copy6
        cmp     al, 0c2h
L_0C001:
        jne     L_0BFFC
L_0C003:
        ret
seq_event_copy6:
        mov     al, byte ptr [si]
        mov     cx, 3
        rep movsw
        cmp     si, 10h
        jb      br_0C018
        sub     si, 10h
        mov     cx, ds
        inc     cx
        mov     ds, cx

br_0C018:
        cmp     di, 10h
        jb      bc_int2a_0c025
        sub     di, 10h
        mov     cx, es
        inc     cx
        mov     es, cx
L_0CA37:
bc_int2a_0c025:
        ret
        if      FW_VERSION = 172
bc_int2a_0c026:
        endif
        INT_2A "Working Memory Full !!"
error_generic_1_alt:
        INT_2A "       Error 1  !!        "
        if      FW_VERSION = 150
bc_int2a_0c026:
        endif
error_error_0c05c:
        INT_64 edit_events_screen
bc_int67_68_0c060:
        INT_65 edit_bars_screen
bc_int67_68_0c064:
        INT_66 edit_trmove_screen
bc_int67_68_0c068:
        INT_67 edit_trans_screen
calls_check_status_flag_596c_0c06c:
        if      FW_VERSION = 150
L_0CA80                         equ     $+2
        endif
        INT_68 bc_int5d_0d00b
calls_check_status_flag_596c_0c070:
        ret
calls_check_status_flag_596c_0c071:
        call    seq_edit_allowed
calls_wait_loop_0c074:
        je      calls_wait_loop_0c077
        ret
calls_wait_loop_0c077:
        call    wait_loop
calls_call_with_check_0c07a:
        call    call_with_check
        callf   CS1_SEG:seq_edit_end_far
        callf   CS1_SEG:undo_seq_discard_far
        mov     al, byte ptr [SEL_SEQ]
        mov     byte ptr [G_EDIT_FROM_SEQ], al
        mov     byte ptr [G_EDIT_TO_SEQ], al
        mov     al, byte ptr [SEL_TRACK]
        if      FW_VERSION = 172
wipe_from_progress              equ     $+2
        endif
        mov     byte ptr [G_EDIT_FROM_TRACK], al
        mov     byte ptr [G_EDIT_TO_TRACK], al
        mov     al, byte ptr [G_EDIT_FROM_SEQ]
L_0C09C:
        call    seq_record_select
        mov     al, byte ptr [G_EDIT_TO_SEQ]
L_0C0A2:
        call    L_0C279
edit_events_screen:
        callf   CS1_SEG:COPY_EVENTS_FIELDS_OFS
bc_int5d_0c0aa:
        int     50h
bc_int5d_0c0ac:
        call    error_error_0c05c
L_0CAC1:
bc_int5d_0c0af:
        INT_5D edit_events_refresh
bc_int5b_0c0b3:
        INT_69 edit_events_f6
bc_int5b_0c0b7:
        INT_5B bc_int5d_0c536
L_0C0BB:
        mov     word ptr [UI_SLOT_PAD_HIT], L_0C197
        mov     byte ptr [G_EDIT_NOTE_LO], 0
        mov     byte ptr [G_EDIT_NOTE_HI], 7fh
L_0C0CB:
        BC_SEQ_INIT
L_0C0CE:
        call    ui_ctrl_0c1a9
        ret
edit_events_refresh:
        mov     al, byte ptr [G_EDIT_FROM_SEQ]
L_0C0D5:
        inc     al
L_0C0D7:
        BC_ARITH_EXT 0033ah
L_0C0DC:
        mov     al, byte ptr [G_EDIT_FROM_TRACK]
        inc     al
L_0C0E1:
        BC_ARITH_EXT 00364h
L_0C0E6:
        mov     al, byte ptr [G_EDIT_TO_SEQ]
        inc     al
L_0C0EB:
        BC_ARITH_EXT 003beh
L_0C0F0:
        mov     al, byte ptr [G_EDIT_TO_TRACK]
        inc     al
L_0C0F5:
        BC_ARITH_EXT 003e8h
L_0C0FA:
        mov     dx, word ptr [G_RANGE_START_BEAT_TICKS]
        mov     ax, word ptr [G_RANGE_START_BAR]
        mov     cx, word ptr [G_RANGE_START_TICK]
L_0C105:
        BC_RANGE 10, 22
L_0C10A:
        mov     dx, word ptr [G_RANGE_END_BEAT_TICKS]
        mov     ax, word ptr [G_RANGE_END_BAR]
        mov     cx, word ptr [G_RANGE_END_TICK]
L_0C115:
        BC_RANGE 70, 22
L_0C11A:
        mov     dx, word ptr [G_RANGE_TO_BEAT_TICKS]
        mov     ax, word ptr [G_EDIT_TO_BAR]
        mov     cx, word ptr [G_EDIT_TO_TICK]
L_0C125:
        BC_RANGE 190, 22
L_0C12A:
        if      FW_VERSION = 172
L_0C130                         equ     $+6
        endif
        BC_STATUS_A 190, 13, G_REPLACE_MERGE, TBL_REPLACE_MERGE_LABELS
        db      0a1h
        if      FW_VERSION = 172
        db      3eh
        db      77h, 40h
        else
        and     al, 77h
        inc     ax
        endif
L_0C137:
        BC_FIELD 190, 31
L_0C13C:
        mov     al, byte ptr [G_EDIT_FROM_SEQ]
        cmp     al, byte ptr [SEL_SEQ]
L_0C143:
        je      L_0C146
        ret
L_0C146:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bl, byte ptr [G_EDIT_FROM_TRACK]
        sub     bh, bh
        test    byte ptr es:[bx+TRK_CHANNEL], 40h
L_0C156:
        je      time_range_field
        jmp     SHORT L_0C183
time_range_field:
        if      FW_VERSION = 150
TIME_RANGE_FIELD_V150:
L_0CB6E                         equ     $+2
        endif
        BC_STATUS 10, 40, "         -        "
L_0C172:
        mov     al, byte ptr [G_EDIT_NOTE_LO]
midi_fmt_main_screen:
        BC_MIDI_FIELD 10, 40
L_0C17A:
        mov     al, byte ptr [G_EDIT_NOTE_HI]
midi_fmt_main_value:
        BC_MIDI_FIELD 76, 40
L_0C182:
        ret
L_0C183:
        BC_CLEAR_RECT 10, 40, 114, 7
L_0C18A:
        mov     al, byte ptr [G_EDIT_DRUM_NOTE]
        mov     ah, byte ptr [G_EDIT_DRUM_PAD]
L_0C191:
        BC_MEM_STATUS 10, 40
L_0C196:
        ret
L_0C197:
        cmp     al, 0
L_0C199:
        jne     L_0C19C
        ret
L_0C19C:
        mov     al, byte ptr [G_LAST_PAD]
        mov     byte ptr [G_EDIT_DRUM_PAD], al
        mov     al, byte ptr [G_LAST_PAD_NOTE]
        mov     byte ptr [G_EDIT_DRUM_NOTE], al
        ret
ui_ctrl_0c1a9:
        BC_UI_CTRL 57, 2, 13, 9
bc_int6c_0c1b0:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_0c220, NULL_HANDLER_OFS, ui_ctrl_0c2b5
L_0C1BA:
        mov     ax, ds
        mov     es, ax
        mov     ax, G_EDIT_FROM_SEQ
        mov     bx, seq_record_select
        mov     cx, 62h
        sub     dx, dx
        mov     bp, ui_ctrl_0c1a9
calls_set_mode_flag_1_0c1cc:
        call    set_mode_flag_1
bc_int6a_0c1cf:
        if      FW_VERSION = 172
        INT_6A edit_events_from_sq_inc, edit_events_from_sq_dec
        else
        INT_6A edit_events_from_sq_inc, L_0C1FA+14
        endif
L_0C1D5:
        ret
seq_record_select:
        push    ax
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        pop     ax
        jb      L_0C1E9
L_0C1DF:
        mov     word ptr [CUR_SEQ_SEG], es
        mov     byte ptr [SEL_SEQ], al
L_0C1E6:
        call    clamp_edit_range_to_seq_end
L_0C1E9:
        mov     al, byte ptr [SEL_SEQ]
        mov     byte ptr [G_EDIT_FROM_SEQ], al
        ret
edit_events_from_sq_inc:
        mov     al, byte ptr [G_EDIT_FROM_SEQ]
L_0C1F3:
        inc     al
        cmp     al, 63h
L_0C1F7:
        jb      L_0C1FA
        ret
L_0C1FA:
        push    ax
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        pop     ax
        jb      L_0C1F3
        mov     byte ptr [G_EDIT_FROM_SEQ], al
        jmp     SHORT L_0C1DF
        if      FW_VERSION = 172
edit_events_from_sq_dec:
        endif
        mov     al, byte ptr [G_EDIT_FROM_SEQ]
        if      FW_VERSION = 150
edit_events_from_sq_dec:
        endif
        cmp     al, 0
        jne     L_0C210
        ret
L_0C210:
        dec     al
        push    ax
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        pop     ax
        if      FW_VERSION = 172
        jb      edit_events_from_sq_dec+3
        else
        jb      edit_events_from_sq_dec
        endif
        mov     byte ptr [G_EDIT_FROM_SEQ], al
        jmp     SHORT L_0C1DF
ui_ctrl_0c220:
        BC_UI_CTRL 99, 2, 13, 9
bc_int6c_0c227:
        INT_6C ui_ctrl_0c1a9, processing_status_a, ui_ctrl_0c220, ui_ctrl_0c2fd
L_0C231:
        mov     ax, ds
        mov     es, ax
        mov     ax, g_edit_from_track
        mov     bx, NULL_HANDLER_OFS
        mov     cx, 3fh
        sub     dx, dx
        mov     bp, ui_ctrl_0c220
calls_set_mode_flag_1_0c243:
        call    set_mode_flag_1
        ret
processing_status_a:
        BC_UI_CTRL 189, 2, 13, 9
bc_int6c_0c24e:
        INT_6C ui_ctrl_0c220, ui_ctrl_0c28e, processing_status_a, ui_ctrl_0c45d
calls_setup_callback_vectors_0c258:
        mov     al, 62h
        mov     si, g_edit_to_seq
        mov     bx, L_0C279
        call    setup_callback_vectors
        mov     ax, ds
        mov     es, ax
        mov     ax, G_EDIT_TO_SEQ
        mov     bx, L_0C279
        mov     cx, 62h
        sub     dx, dx
        mov     bp, processing_status_a
calls_set_mode_flag_1_0c275:
        call    set_mode_flag_1
        ret
L_0CC8B:
L_0C279:
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        mov     word ptr [EDIT_TO_SEQ_SEG], es
        sub     ax, ax
        mov     word ptr [G_EDIT_TO_BAR], ax
        mov     word ptr [G_EDIT_TO_TICK], ax
ui_ctrl_0c28a:
        call    calls_state_update_0ddc5
        ret
ui_ctrl_0c28e:
        BC_UI_CTRL 231, 2, 13, 9
bc_int6c_0c295:
        INT_6C processing_status_a, NULL_HANDLER_OFS, processing_status_a, ui_ctrl_0c45d
L_0C29F:
        mov     ax, ds
        mov     es, ax
        mov     ax, g_edit_to_track
        mov     bx, NULL_HANDLER_OFS
        mov     cx, 3fh
        sub     dx, dx
calls_set_mode_flag_1_0c2ae:
        mov     bp, ui_ctrl_0c28e
calls_set_mode_flag_1_0c2b1:
        call    set_mode_flag_1
        ret
ui_ctrl_0c2b5:
        BC_UI_CTRL 9, 21, 19, 9
bc_int6c_0c2bc:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_0c2cd, ui_ctrl_0c1a9, edit_events_notes_lo_field
ui_ctrl_0c2c6:
        mov     bp, ui_ctrl_0c2b5
        if      FW_VERSION = 172
        call    L_0D999+9
        else
        db      0e8h
        db      0a0h, 15h
        endif
        ret
ui_ctrl_0c2cd:
        BC_UI_CTRL 33, 21, 13, 9
bc_int6c_0c2d4:
        INT_6C ui_ctrl_0c2b5, ui_ctrl_0c2e5, ui_ctrl_0c1a9, edit_events_notes_lo_field
L_0C2DE:
        mov     bp, ui_ctrl_0c2cd
ui_ctrl_0c2e1:
        call    L_0D9F9
        ret
ui_ctrl_0c2e5:
        BC_UI_CTRL 51, 21, 13, 9
bc_int6c_0c2ec:
        INT_6C ui_ctrl_0c2cd, ui_ctrl_0c2fd, ui_ctrl_0c1a9, edit_events_notes_lo_field
L_0C2F6:
        mov     bp, ui_ctrl_0c2e5
ui_ctrl_0c2f9:
        call    L_0DA5D
        ret
ui_ctrl_0c2fd:
        BC_UI_CTRL 69, 21, 19, 9
bc_int6c_0c304:
        INT_6C ui_ctrl_0c2e5, ui_ctrl_0c315, ui_ctrl_0c220, edit_events_notes_hi_field
L_0C30E:
        mov     bp, ui_ctrl_0c2fd
ui_ctrl_0c311:
        call    L_0DAC6
        ret
ui_ctrl_0c315:
        BC_UI_CTRL 93, 21, 13, 9
bc_int6c_0c31c:
        INT_6C ui_ctrl_0c2fd, ui_ctrl_0c32d, ui_ctrl_0c220, edit_events_notes_hi_field
L_0C326:
        mov     bp, ui_ctrl_0c315
ui_ctrl_0c329:
        call    L_0DB18
        ret
ui_ctrl_0c32d:
        BC_UI_CTRL 111, 21, 13, 9
bc_int6c_0c334:
        INT_6C ui_ctrl_0c315, ui_ctrl_0c345, ui_ctrl_0c1a9, edit_events_notes_hi_field
L_0C33E:
        mov     bp, ui_ctrl_0c32d
ui_ctrl_0c341:
        call    L_0DB7E
        ret
ui_ctrl_0c345:
        BC_UI_CTRL 189, 21, 19, 9
bc_int6c_0c34c:
        INT_6C ui_ctrl_0c32d, ui_ctrl_0c35d, ui_ctrl_0c45d, ui_ctrl_0c47d
L_0C356:
        mov     bp, ui_ctrl_0c345
handler_BC_TEST_MODE:
        call    L_0DBF7
        ret
ui_ctrl_0c35d:
        BC_UI_CTRL 213, 21, 13, 9
bc_int6c_0c364:
        INT_6C ui_ctrl_0c345, ui_ctrl_0c375, ui_ctrl_0c45d, ui_ctrl_0c47d
L_0C36E:
        mov     bp, ui_ctrl_0c35d
ui_ctrl_0c371:
        call    L_0DC52
        ret
ui_ctrl_0c375:
        BC_UI_CTRL 231, 21, 13, 9
bc_int6c_0c37c:
        INT_6C ui_ctrl_0c35d, NULL_HANDLER_OFS, ui_ctrl_0c45d, ui_ctrl_0c47d
L_0C386:
        mov     bp, ui_ctrl_0c375
L_0C389:
        call    L_0DC95
        ret
edit_events_notes_lo_field:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bl, byte ptr [G_EDIT_FROM_TRACK]
        sub     bh, bh
        test    byte ptr es:[bx+TRK_CHANNEL], 40h
ui_ctrl_0c39d:
        je      ui_ctrl_0c3a1
        jmp     SHORT ui_ctrl_0c408
ui_ctrl_0c3a1:
        BC_UI_CTRL 9, 39, 49, 9
calls_setup_callback_vectors_0c3a8:
        mov     al, 7fh
        mov     si, g_edit_note_lo
        mov     bx, L_0C3C1
        call    setup_callback_vectors
calls_init_state_pointers_0c3b3:
        INT_6C NULL_HANDLER_OFS, edit_events_notes_hi_field, ui_ctrl_0c2fd, NULL_HANDLER_OFS
calls_init_state_pointers_0c3bd:
        call    init_state_pointers
        ret
L_0C3C1:
        cmp     al, byte ptr [G_EDIT_NOTE_HI]
L_0C3C5:
        jae     L_0C3C8
        ret
L_0C3C8:
        mov     byte ptr [G_EDIT_NOTE_HI], al
        ret
edit_events_notes_hi_field:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bl, byte ptr [G_EDIT_FROM_TRACK]
        sub     bh, bh
        test    byte ptr es:[bx+TRK_CHANNEL], 40h
ui_ctrl_0c3dc:
        je      ui_ctrl_0c3e0
        jmp     SHORT ui_ctrl_0c408
ui_ctrl_0c3e0:
        BC_UI_CTRL 75, 39, 49, 9
L_0C3E7:
        mov     al, 7fh
        if      FW_VERSION = 172
        mov     si, D_7731
handler_BC_MEM_COPY             equ     $+2
        else
        db      0beh
        db      17h
        db      77h
        endif
        mov     bx, L_0C3FD
calls_setup_callback_vectors_0c3ef:
        call    setup_callback_vectors
bc_int6c_0c3f2:
        INT_6C edit_events_notes_lo_field, ui_ctrl_0c47d, ui_ctrl_0c2fd, NULL_HANDLER_OFS
L_0C3FC:
        ret
L_0C3FD:
        if      FW_VERSION = 172
        db      3ah, 06h, 30h
        else
        db      3ah, 06h
        db      16h
        endif
L_0C400:
        db      77h, 72h
        add.d0  bx, ax
ui_ctrl_0c404:
        mov     byte ptr [G_EDIT_NOTE_LO], al
        ret
ui_ctrl_0c408:
        BC_UI_CTRL 9, 39, 37, 9
calls_init_state_pointers_0c40f:
        INT_6A pad_note_inc, pad_note_dec
calls_init_state_pointers_0c415:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_0c47d, ui_ctrl_0c2b5, NULL_HANDLER_OFS
calls_init_state_pointers_0c41f:
        call    init_state_pointers
        ret
pad_note_inc:
        mov     al, byte ptr [G_EDIT_DRUM_NOTE]
        cmp     al, 23h
        jae     L_0C42C
        mov     al, 22h
L_0C42C:
        cmp     al, 63h
        jb      L_0C432
        mov     al, 22h
L_0C432:
        inc     al
        cmp     al, 62h
        jb      L_0C43A
        mov     al, 62h
L_0C43A:
        mov     byte ptr [G_EDIT_DRUM_NOTE], al
        call    note_to_pad_lookup
        mov     byte ptr [G_EDIT_DRUM_PAD], al
        ret
pad_note_dec:
        mov     al, byte ptr [G_EDIT_DRUM_NOTE]
        cmp     al, 0
        jne     L_0C44C
        ret
L_0C44C:
        dec     al
        cmp     al, 23h
        jae     L_0C43A
        sub     al, al
        mov     byte ptr [G_EDIT_DRUM_NOTE], al
        mov     byte ptr [G_EDIT_DRUM_PAD], 41h
        ret
ui_ctrl_0c45d:
        BC_UI_CTRL 189, 12, 49, 9
calls_setup_callback_vectors_0c464:
        mov     al, 1
        mov     si, G_REPLACE_MERGE
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
calls_init_state_pointers_0c46f:
        INT_6C ui_ctrl_0c32d, NULL_HANDLER_OFS, processing_status_a, ui_ctrl_0c345
calls_init_state_pointers_0c479:
        call    init_state_pointers
        ret
ui_ctrl_0c47d:
        BC_UI_CTRL 189, 30, 19, 9
bc_int6c_0c484:
        INT_6C edit_events_notes_hi_field, NULL_HANDLER_OFS, ui_ctrl_0c345, NULL_HANDLER_OFS
L_0C48E:
        mov     ax, ds
        mov     es, ax
        mov     ax, G_EDIT_COPIES_M1
        mov     bx, NULL_HANDLER_OFS
        mov     cx, 3e6h
        sub     dx, dx
        mov     bp, ui_ctrl_0c47d
calls_set_mode_flag_1_0c4a0:
        call    set_mode_flag_1
        ret
edit_events_f6:
        mov     al, byte ptr [G_EDIT_FROM_SEQ]
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
L_0C4AC:
        jae     L_0C4AF
        ret
L_0C4AF:
        mov     ax, word ptr [G_RANGE_START_BAR]
        mov     cx, word ptr [G_RANGE_START_TICK]
        cmp     ax, word ptr [G_RANGE_END_BAR]
        jne     L_0C4C3
        cmp     cx, word ptr [G_RANGE_END_TICK]
        jne     L_0C4C3
        ret
L_0C4C3:
        mov     byte ptr [G_COPY_EVENTS_BUSY], 1
        mov     byte ptr [G_SEQ_OUTPUT_MUTE], 1
calls_wait_msg_0c4cd:
        call    L_0C50C
        nop
        push    cs
        call    wait_msg
        mov     byte ptr [G_SEQ_MEM_FULL], 0
        callf   CS1_SEG:copy_events_exec_far
error_from_buffer_not_ready_a   equ     $+1
        mov     al, 0
L_0C4E4                         equ     $+3
        xchg    byte ptr [G_SEQ_MEM_FULL], al
        push    ax
        mov     byte ptr [G_COPY_EVENTS_BUSY], 0
        mov     byte ptr [G_SEQ_OUTPUT_MUTE], 0
calls_init_with_int50_0c4f0:
        BC_SEQ_INIT
calls_init_with_int50_0c4f3:
        callf   CS1_SEG:seq_rewind_to_start_far
        callf   CS1_SEG:L_170C1
        call    main_screen_enter
        call    system_call
        pop     ax
        or      al, al
L_0C506:
        je      L_0C50B
        jmp     NEAR jmp_ferr_insufficient_memory
L_0C50B:
        ret
L_0C50C:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bl, byte ptr [G_EDIT_FROM_TRACK]
        mov     bh, 0
        test    byte ptr es:[bx+TRK_CHANNEL], 40h
L_0C51C:
        jne     L_0C51F
        ret
L_0C51F:
        mov     ax, 7f00h
        cmp     byte ptr [G_EDIT_DRUM_PAD], 41h
        je      L_0C52E
        mov     al, byte ptr [G_EDIT_DRUM_NOTE]
        mov     ah, al
L_0C52E:
        mov     byte ptr [G_EDIT_NOTE_LO], al
        if      FW_VERSION = 172
error_from_buffer_not_ready_b   equ     $+2
        endif
        mov     byte ptr [G_EDIT_NOTE_HI], ah
        ret
bc_int5d_0c536:
        callf   CS1_SEG:copy_events_dialog_1D636
bc_int5d_0c53b:
        int     50h
bc_int5d_0c53d:
        INT_5D copy_events_refresh
bc_int5b_0c541:
        INT_67 copy_events_close
bc_int5b_0c545:
        INT_5B copy_events_close
L_0C549:
        db      0e8h, 0cfh, 00h
        ret
copy_events_close:
        call    L_0C553
        jmp     NEAR edit_events_screen
L_0C553:
        mov     al, byte ptr [G_EDIT_FROM_SEQ]
        push    ax
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        pop     ax
        jae     L_0C573
        sub     al, 1
        jae     L_0C553+3
L_0C563:
        inc     al
        cmp     al, 63h
L_0C567:
        jne     L_0C56A
        ret
L_0C56A:
        push    ax
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        pop     ax
        jb      L_0C563
L_0C573:
        jmp     NEAR seq_record_select
copy_events_refresh:
        call    L_0C583
L_0C579:
        call    L_0C5A0
L_0C57C:
        db      0e8h, 50h, 00h
L_0C57F:
        call    L_0C5EC
        ret
L_0C583:
        mov     al, byte ptr [G_EDIT_FROM_SEQ]
        push    ax
        inc     al
L_0C589:
        BC_ARITH_EXT 00b56h
L_0C58E:
        pop     ax
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        mov     si, 2
        mov     dx, es
L_0C599:
        BC_STATUS_B 110, 11, 16
        db      0c3h
L_0C5A0:
        mov     al, byte ptr [G_EDIT_FROM_TRACK]
        push    ax
        inc     al
L_0C5A6:
        BC_ARITH_EXT 01356h
L_0C5AB:
        pop     ax
        sub     ah, ah
        mov     bx, ax
        test    byte ptr es:[bx+TRK_STATUS], 1
L_0C5B6:
        je      L_0C5C9
        shl     ax, 4
        add     ax, 30h
        mov     si, ax
        mov     dx, es
L_0C5C2:
        BC_STATUS_B 110, 19, 16
        db      0c3h
L_0C5C9:
        BC_UI_A4 110, 19
        ret
        mov     al, byte ptr [G_EDIT_TO_SEQ]
L_0C5D2:
        push    ax
        inc     al
L_0C5D5:
        BC_ARITH_EXT 01f56h
L_0C5DA:
        pop     ax
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        mov     si, 2
        mov     dx, es
L_0C5E5:
        BC_STATUS_B 110, 31, 16
        db      0c3h
L_0C5EC:
        mov     al, byte ptr [G_EDIT_TO_TRACK]
        push    ax
        inc     al
L_0C5F2:
        BC_ARITH_EXT 02756h
L_0C5F7:
        pop     ax
        sub     ah, ah
        mov     bx, ax
        test    byte ptr es:[bx+TRK_STATUS], 1
L_0C602:
        je      L_0C615
        shl     ax, 4
        add     ax, 30h
        mov     si, ax
        mov     dx, es
L_0C60E:
        BC_STATUS_B 110, 39, 16
        db      0c3h
L_0C615:
        if      FW_VERSION = 172
bc_int62_0c61e                  equ     $+9
        endif
        BC_UI_A4 110, 39
        db      0c3h
copy_events_from_sq_field:
        BC_UI_CTRL 85, 10, 13, 9
bc_int62_0c622:
        INT_62 NULL_HANDLER_OFS
bc_int63_0c626:
        INT_63 ui_ctrl_0c636
calls_setup_callback_vectors_0c62a:
        mov     al, 62h
        mov     si, g_edit_from_seq
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
        ret
ui_ctrl_0c636:
        BC_UI_CTRL 85, 18, 13, 9
bc_int62_0c63d:
        INT_62 copy_events_from_sq_field
bc_int63_0c641:
        INT_63 ui_ctrl_0c651
calls_setup_callback_vectors_0c645:
        mov     al, 3fh
        mov     si, g_edit_from_track
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
        ret
ui_ctrl_0c651:
        BC_UI_CTRL 85, 30, 13, 9
bc_int62_0c658:
        INT_62 ui_ctrl_0c636
bc_int63_0c65c:
        INT_63 ui_ctrl_0c66c
calls_setup_callback_vectors_0c660:
        mov     al, 62h
        mov     si, g_edit_to_seq
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
        ret
ui_ctrl_0c66c:
        BC_UI_CTRL 85, 38, 13, 9
bc_int62_0c673:
        INT_62 ui_ctrl_0c651
bc_int63_0c677:
        INT_63 NULL_HANDLER_OFS
calls_setup_callback_vectors_0c67b:
        mov     al, 3fh
        mov     si, g_edit_to_track
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
        ret
edit_bars_screen:
        callf   CS1_SEG:copy_bars_screen_draw
        mov     al, byte ptr [G_EDIT_TO_SEQ]
        call    L_0C279
        mov     al, byte ptr [G_EDIT_FROM_SEQ]
L_0C695:
        call    L_0C712
bc_int5d_0c698:
        int     50h
bc_int5d_0c69a:
        call    error_error_0c05c
bc_int5d_0c69d:
        INT_5D edit_bars_refresh
bc_int5b_0c6a1:
        INT_69 edit_bars_f6
bc_int5b_0c6a5:
        INT_5B bc_int5d_0c9a6
L_0C6A9:
        call    ui_ctrl_0c75c
        ret
edit_bars_refresh:
        mov     al, byte ptr [G_EDIT_FROM_SEQ]
        inc     al
L_0C6B2:
        BC_ARITH_EXT 0033fh
L_0C6B7:
        mov     al, byte ptr [G_EDIT_TO_SEQ]
        inc     al
L_0C6BC:
        BC_ARITH_EXT 003beh
L_0C6C1:
        mov     ax, word ptr [G_RANGE_START_BAR]
        inc     ax
L_0C6C5:
        BC_FIELD 82, 14
L_0C6CA:
        mov     ax, word ptr [G_RANGE_END_BAR]
        inc     ax
L_0C6CE:
        BC_FIELD 82, 36
L_0C6D3:
        if      FW_VERSION = 172
        db      0a1h, 3ah
        else
        db      0a1h
        db      20h
        endif
L_0C6D5:
        db      77h
L_0C6D6:
        BC_FIELD 214, 14
L_0C6DB:
        mov     ax, word ptr [G_EDIT_COPIES_M1]
from_fragmentation_dialog:
        inc     ax
L_0C6DF:
        BC_FIELD 214, 36
L_0C6E4:
        ret
ui_ctrl_0c6e5:
        BC_UI_CTRL 62, 2, 13, 9
bc_int6c_0c6ec:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_0c735, NULL_HANDLER_OFS, ui_ctrl_0c75c
L_0C6F6:
        mov     ax, ds
        mov     es, ax
        mov     ax, G_EDIT_FROM_SEQ
        mov     bx, L_0C712
seq_op_frag_display             equ     $+2
        mov     cx, 62h
        sub     dx, dx
        mov     bp, ui_ctrl_0c1a9
calls_set_mode_flag_1_0c708:
        call    set_mode_flag_1
bc_int6a_0c70b:
        INT_6A ui_ctrl_0c730, edit_bars_from_sq_dec
L_0C711:
        ret
L_0C712:
        call    seq_record_select
seq_op_from_display:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ax, word ptr es:[18h]
        sub     ax, 1
        cmp     ax, word ptr [G_RANGE_END_BAR]
        if      FW_VERSION = 172
        jb      L_0C727
        else
        jb      seq_op_from_display+18
        ret
        db      0a3h
        db      1eh
        db      78h
        endif
        ret
L_0C727:
        if      FW_VERSION = 172
        mov     word ptr [G_RANGE_END_BAR], ax
        ret
        endif
edit_bars_from_sq_dec:
        if      FW_VERSION = 172
        call    edit_events_from_sq_dec
        else
        call    L_0C1FA+14
        endif
        jmp     SHORT L_0C712
ui_ctrl_0c730:
        call    edit_events_from_sq_inc
        jmp     SHORT L_0C712
ui_ctrl_0c735:
        BC_UI_CTRL 189, 2, 13, 9
bc_int6c_0c73c:
        INT_6C ui_ctrl_0c6e5, ui_ctrl_0c78c, NULL_HANDLER_OFS, ui_ctrl_0c78c
L_0C746:
        mov     ax, ds
        mov     es, ax
        mov     ax, G_EDIT_TO_SEQ
        mov     bx, L_0C279
        mov     cx, 62h
        sub     dx, dx
        mov     bp, ui_ctrl_0c735
calls_set_mode_flag_1_0c758:
        call    set_mode_flag_1
        ret
ui_ctrl_0c75c:
        BC_UI_CTRL 81, 13, 19, 9
bc_int6c_0c763:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_0c78c, ui_ctrl_0c6e5, ui_ctrl_0c774
ui_ctrl_0c76d:
        mov     bp, ui_ctrl_0c75c
        if      FW_VERSION = 172
        call    L_0D999+9
        else
        db      0e8h
        db      0f9h, 10h
        endif
        ret
ui_ctrl_0c774:
        BC_UI_CTRL 81, 35, 19, 9
bc_int6c_0c77b:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_0c7a4, ui_ctrl_0c75c, NULL_HANDLER_OFS
L_0C785:
        mov     bp, ui_ctrl_0c774
ui_ctrl_0c788:
        call    L_0DCDB
        ret
ui_ctrl_0c78c:
        BC_UI_CTRL 213, 13, 19, 9
bc_int6c_0c793:
        INT_6C ui_ctrl_0c75c, NULL_HANDLER_OFS, ui_ctrl_0c735, ui_ctrl_0c7a4
L_0C79D:
        mov     bp, ui_ctrl_0c78c
ui_ctrl_0c7a0:
        call    L_0DD18
        ret
ui_ctrl_0c7a4:
        BC_UI_CTRL 213, 35, 19, 9
bc_int6c_0c7ab:
        INT_6C ui_ctrl_0c774, NULL_HANDLER_OFS, ui_ctrl_0c78c, NULL_HANDLER_OFS
L_0C7B5:
        mov     ax, ds
        mov     es, ax
        mov     ax, G_EDIT_COPIES_M1
        mov     bx, NULL_HANDLER_OFS
        mov     cx, 3e6h
        sub     dx, dx
        mov     bp, ui_ctrl_0c7a4
too_many_bars_999max_msg:
        call    set_mode_flag_1
        ret
too_many_bars_error:
        BC_PRINT "  Too many bars! (999max)"
print_too_many_bars_0c7e8:
        call    delay_loop
L_0C7EB:
        BC_SEQ_INIT
L_0C7EE:
        ret
edit_bars_f6:
        mov     al, byte ptr [G_EDIT_FROM_SEQ]
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        jae     L_0C7FA
        ret
L_0C7FA:
        mov     al, byte ptr [G_EDIT_TO_SEQ]
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        mov     cx, 0
        jb      L_0C80C
        mov     cx, word ptr es:[18h]
L_0C80C:
        mov     ax, word ptr [G_RANGE_END_BAR]
        sub     ax, word ptr [G_RANGE_START_BAR]
        inc     ax
        mov     bx, word ptr [G_EDIT_COPIES_M1]
        inc     bx
        mul     bx
        or      dx, dx
L_0C81D:
        jne     too_many_bars_error
        cmp     ax, 3e8h
L_0C822:
        jae     too_many_bars_error
        add     ax, cx
        cmp     ax, 3e8h
calls_process_input_0c829:
        jae     too_many_bars_error
        mov     al, byte ptr [G_EDIT_TO_SEQ]
        mov     byte ptr [SEL_SEQ], al
        call    process_input
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[TBL_0013], 0
        jne     L_0C857
        callf   CS1_SEG:seq_create_new_far
        mov     es, word ptr [SEQ_EVENTS_SEG]
        db      0bfh, 06h
seq_op_format:
        db      00h, 9ah
        dw      seq_events_terminate_far
        dw      CS1_SEG
        db      0a0h
        and     byte ptr [bp+di], cl
        call    process_input
L_0C857:
        callf   CS1_SEG:seq_undo_checkpoint_far
        mov     ax, word ptr [G_EDIT_TO_BAR]
        callf   CS1_SEG:calls_locate_dialog_18556_1704d
        mov     al, byte ptr [G_EDIT_FROM_SEQ]
        cmp     al, byte ptr [G_EDIT_TO_SEQ]
L_0C86B:
        jne     L_0C879
        mov     al, 64h
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
L_0C874:
        jae     L_0C881
        jmp     NEAR jmp_ferr_insufficient_memory
L_0C879:
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
L_0C87E:
        jae     L_0C881
        ret
L_0C881:
        push    es
        mov     dx, es
        mov     es, word ptr [CUR_SEQ_SEG]
L_0C888:
        call    L_0C94D
        pop     es
L_0C88C:
        mov     si, 530h
        mov     bx, word ptr [G_RANGE_START_BAR]
L_0C893:
        cmp     byte ptr es:[si], 0c0h
        jne     L_0C89F
        cmp     bx, word ptr es:[si+1]
L_0C89D:
        je      L_0C8AD
L_0C89F:
        add     si, 6
        jae     L_0C893
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
        jmp     SHORT L_0C893
L_0C8AD:
        mov     bx, es
L_0C8AF:
        mov     ax, si
        shr     ax, 4
        add     ax, bx
L_0C8B6:
        mov     es, ax
        and     si, 0fh
        mov     dx, word ptr [G_RANGE_END_BAR]
        inc     dx
        mov     cx, word ptr [G_EDIT_COPIES_M1]
        inc     cx
L_0C8C5:
        push    cx
        push    si
        push    es
L_0C8C8:
        call    L_0C8F2
        pop     es
        pop     si
        pop     cx
        jb      L_0C8D2
        loop    L_0C8C5
L_0C8D2:
        pushf
        call    seq_renumber_bar_markers_from_start
        callf   CS1_SEG:seq_position_reset_far
        callf   CS1_SEG:seq_rewind_to_start_far
        callf   CS1_SEG:L_170C1
        call    main_screen_enter
        call    system_call
        popf
L_0C8EC:
        jae     L_0C8F1
        jmp     NEAR jmp_ferr_insufficient_memory
L_0C8F1:
        ret
L_0C8F2:
        mov     bx, word ptr [SEQ_AFTER_GAP_SEG]
        push    ds
        mov     bp, es
        les     di, [FP_SEQ_GAP_WRITE]
        mov     ds, bp
L_0C8FF:
        mov     cx, 3
        rep movsw
        cmp     si, 10h
        jb      L_0C90F
        sub     si, 10h
        inc     bp
        mov     ds, bp
L_0C90F:
        cmp     di, 10h
        jb      L_0C91C
        sub     di, 10h
        mov     ax, es
        inc     ax
        mov     es, ax
L_0C91C:
        mov     ax, es
        mov     cx, bx
L_0C920:
        sub     cx, ax
        cmp     cx, word ptr ss:[G_SEQ_MEM_RESERVE]
        jb      L_0C93E
        cmp     byte ptr [si], 0c0h
        jne     L_0C8FF
        cmp     dx, word ptr [si+1]
        jne     L_0C8FF
        pop     ds
        mov     word ptr [FP_SEQ_GAP_WRITE], di
        mov     word ptr [SEQ_GAP_WRITE_SEG], es
        clc
        ret
L_0C93E:
        pop     ds
        mov     byte ptr es:[di], 0ffh
        mov     word ptr [FP_SEQ_GAP_WRITE], di
        mov     word ptr [SEQ_GAP_WRITE_SEG], es
        stc
        ret
L_0C94D:
        push    ds
L_0C94E:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ds, dx
        mov     bx, 0
L_0C957:
        mov     al, byte ptr [bx+TRK_STATUS]
        db      0f6h, 87h, 0f0h
main_sequence_display:
        add     al, 1
        je      L_0C99D
        test    byte ptr es:[bx+TRK_STATUS], 1
        jne     L_0C99D
        mov     al, byte ptr [bx+TRK_CHANNEL]
        mov     ah, byte ptr [bx+D_0470]
        mov     dl, byte ptr [bx+TRK_VELOCITY]
        mov     dh, byte ptr [bx+TRK_STATUS]
        mov     byte ptr es:[bx+TRK_CHANNEL], al
        mov     byte ptr es:[bx+470h], ah
        mov     byte ptr es:[bx+TRK_VELOCITY], dl
        mov     byte ptr es:[bx+TRK_STATUS], dh
        mov     si, bx
        shl     si, 4
        add     si, 30h
        mov     di, si
        mov     cx, 10h
        rep movsb
L_0C99D:
        inc     bl
L_0C99F:
        cmp     bl, 40h
        jne     L_0C957
        pop     ds
        ret
bc_int5d_0c9a6:
        callf   CS1_SEG:copy_bars_dialog_1D7A9
bc_int5d_0c9ab:
        int     50h
bc_int5d_0c9ad:
        INT_5D copy_bars_refresh
bc_int5b_0c9b1:
        INT_67 copy_bars_close
bc_int5b_0c9b5:
        INT_5B copy_bars_close
L_0C9B9:
        call    ui_ctrl_0c9cd
        ret
copy_bars_close:
        call    L_0C553
        jmp     NEAR edit_bars_screen
copy_bars_refresh:
        mov     al, byte ptr [G_EDIT_FROM_SEQ]
        call    L_0C583
        call    L_0C5C9+6
        ret
ui_ctrl_0c9cd:
        BC_UI_CTRL 85, 10, 13, 9
bc_int62_0c9d4:
        INT_62 NULL_HANDLER_OFS
bc_int63_0c9d8:
        INT_63 ui_ctrl_0c9e8
calls_setup_callback_vectors_0c9dc:
        mov     al, 62h
        mov     si, g_edit_from_seq
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
        ret
ui_ctrl_0c9e8:
        BC_UI_CTRL 85, 30, 13, 9
bc_int62_0c9ef:
        INT_62 ui_ctrl_0c9cd
bc_int63_0c9f3:
        INT_63 NULL_HANDLER_OFS
calls_setup_callback_vectors_0c9f7:
        mov     al, 62h
        mov     si, g_edit_to_seq
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
        ret
edit_trmove_screen:
        db      9ah
        dw      L_1D7F5
        if      FW_VERSION = 172
count_status_display:
        endif
        dw      CS1_SEG
L_0CA08:
        int     50h
L_0CA0A:
        callf   CS1_SEG:edit_seq_screen_draw
L_0CA0F:
        call    error_error_0c05c
L_0CA12:
        call    ui_ctrl_0caa5
        mov     al, byte ptr [SEL_SEQ]
        mov     byte ptr [G_EDIT_FROM_SEQ], al
        ret
calls_ui_a_011_0ca1c:
        call    ui_a_011CC
L_0CA1F:
        BC_CLEAR_RECT 108, 16, 132, 30
L_0CA26:
        mov     al, byte ptr [P_7742]
        cmp     al, 0
        je      L_0CA40
        cmp     al, 3fh
        je      L_0CA47
        dec     al
L_0CA33:
        call    status_display_CA60
L_0CA36:
        call    L_0CA59
L_0CA39:
        call    L_0CA50
L_0CA3C:
        BC_PLANE_A
L_0CA3F:
        ret
L_0CA40:
        call    L_0CA59
L_0CA43:
        call    L_0CA50
        ret
L_0CA47:
        dec     al
L_0CA49:
        call    status_display_CA60
L_0CA4C:
        call    L_0CA59
        ret
L_0CA50:
        push    ax
        mov     al, 14h
L_0CA53:
        BC_SEQ_EDIT
L_0CA56:
        pop     ax
        jmp     SHORT status_display_CA60
L_0CA59:
        push    ax
        mov     al, 0ah
L_0CA5C:
        BC_SEQ_EDIT
L_0CA5F:
        pop     ax
status_display_CA60:
        BC_STATUS 108, 16, "Tr:   -"
status_tr____0ca6d:
        push    ax
        inc     al
L_0CA70:
        BC_UI_MENU 126, 16
        db      0feh
L_0CA76:
        db      0c8h
L_0CA77:
        BC_UI_A4 150, 16
        if      FW_VERSION = 172
        db      8eh, 06h, 0ah, 1dh
L_0CA80:
        else
        db      8eh, 06h
        db      0feh, 1ch
        endif
        mov     bl, al
        mov     bh, 0
        test    byte ptr es:[bx+TRK_STATUS], 1
L_0CA8A:
        je      L_0CA9E
        sub     ah, ah
        shl     ax, 4
        add     ax, 30h
        mov     si, ax
        mov     dx, es
L_0CA98:
        BC_STATUS_B 150, 16, 16
L_0CA9E:
        BC_PLANE_A
ui_ctrl_0caa1:
        pop     ax
        inc     al
        ret
ui_ctrl_0caa5:
        BC_UI_CTRL 23, 1, 13, 9
softkey_CAAC:
        BC_SOFTKEY 6, BC_SK_PLAIN, " "
bc_int6c_0cab3:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_0caf9, NULL_HANDLER_OFS, ui_ctrl_0caf9
bc_int5d_0cabd:
        INT_69 NULL_HANDLER_OFS
bc_int5d_0cac1:
        INT_5D calls_ui_a_011_0ca1c
L_0CAC5:
        mov     ax, ds
        mov     es, ax
        mov     bp, ui_ctrl_0caa5
        mov     ax, G_EDIT_FROM_SEQ
        mov     bx, L_0CAE2
        mov     cx, 62h
        mov     dx, 0
calls_set_mode_flag_1_0cad8:
        call    set_mode_flag_1
bc_int6a_0cadb:
        INT_6A ui_ctrl_0caf4, edit_trmove_sq_dec
L_0CAE1:
        ret
L_0CAE2:
        call    seq_record_select
        mov     al, byte ptr [G_EDIT_FROM_SEQ]
L_0CAE8:
        mov     byte ptr [SEL_SEQ], al
        if      FW_VERSION = 172
        db      0e8h, 36h
delete_sequence_dialog:
        dec     di
        else
        db      0e8h
        db      0b0h, 50h
        endif
        ret
edit_trmove_sq_dec:
        if      FW_VERSION = 172
        call    edit_events_from_sq_dec
        else
        call    L_0C1FA+14
        endif
L_0CAF2:
        jmp     SHORT L_0CAE2+3
ui_ctrl_0caf4:
        call    edit_events_from_sq_inc
ui_ctrl_0caf7:
        jmp     SHORT L_0CAE2+3
ui_ctrl_0caf9:
        BC_UI_CTRL 107, 25, 115, 9
bc_int6c_0cb00:
        INT_6C ui_ctrl_0caa5, NULL_HANDLER_OFS, edit_trmove_track_up, edit_trmove_track_down
L_0CB0A:
        mov     al, 3fh
        mov     si, P_7742
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
softkey_select:
        BC_SOFTKEY 6, BC_SK_BOX,   "SELECT"
softkey_select_0cb21:
        INT_69 tr_1_status_0CB46
L_0CB25:
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
        ret
edit_trmove_track_down:
        cmp     byte ptr [P_7742], 3fh
        jne     L_0CB34
        ret
L_0CB34:
        inc     byte ptr [P_7742]
        ret
edit_trmove_track_up:
        cmp     byte ptr [P_7742], 0
        jne     L_0CB41
        ret
L_0CB41:
        dec     byte ptr [P_7742]
        ret
tr_1_status_0CB46:
        BC_CLEAR_RECT 4, 12, 96, 30
tr_1_status:
        mov     al, byte ptr [P_7742]
        mov     byte ptr [P_7743], al
        inc     byte ptr [P_7742]
status_display_CB57:
        BC_STATUS 10, 26, "Tr:   -"
        db      0feh, 0c0h
status_tr____0cb66:
        BC_UI_MENU 28, 26
        db      0feh
L_0CA76_V150:
L_0CB6C:
        db      0c8h
L_0CB6D:
        BC_UI_A4 52, 26
        if      FW_VERSION = 172
        db      8eh, 06h, 0ah, 1dh
        else
        db      8eh, 06h
        db      0feh, 1ch
        endif
L_0CB76:
        mov     bl, al
        mov     bh, 0
        test    byte ptr es:[bx+TRK_STATUS], 1
L_0CB80:
        je      ui_ctrl_0cb92
        shl     bx, 4
        add     bx, 30h
        mov     si, bx
        mov     dx, es
ui_ctrl_0cb8c:
        BC_STATUS_B 52, 26, 16
ui_ctrl_0cb92:
        BC_UI_CTRL 9, 25, 115, 9
erase_all_seq_warning:
        int     50h
bc_int6a_0cb9b:
        INT_6A edit_trmove_track_inc, edit_trmove_track_dec
L_0CBA1:
        BC_WAIT_LOAD
        db      020h, 000h, 020h, 000h, 020h, 000h, 020h, 000h, "CANCEL", 000h, 049h
        db      "NSERT", 000h
bc_int6c_0cbba:
        BC_BUFFER 0, 0, 0, 0, 2, 1
bc_int6c_0cbc3:
        if      FW_VERSION = 172
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, edit_trmove_track_up, edit_trmove_track_down
        else
        db      0cdh, 6ch
        db      0dah
        db      0eh
        db      0dah
        db      0eh
        db      4bh, 0c9h, 3eh, 0c9h, 0cdh, 68h, 0adh
        db      0cbh
        endif
bc_int5d_0cbcd:
        if      FW_VERSION = 172
        INT_68 edit_trmove_f5
        endif
bc_int5d_0cbd1:
        INT_69 edit_trmove_f6
copy_sequence_screen:
        INT_5D edit_trmove_refresh
L_0CBD9:
        ret
edit_trmove_track_dec:
        mov     al, byte ptr [P_7742]
        cmp     al, 0
        jne     L_0CBE2
        ret
L_0CBE2:
        dec     al
L_0CBE4:
copy_sequence_dialog            equ     $+1
        je      L_0CBF5
L_0CBE6:
        mov     byte ptr [P_7742], al
        cmp     al, byte ptr [P_7743]
        je      L_0CBF0
        ret
L_0CBF0:
        dec     byte ptr [P_7742]
        ret
L_0CBF5:
        cmp     byte ptr [P_7743], 0
        jne     L_0CBE6
        ret
edit_trmove_track_inc:
        mov     al, byte ptr [P_7742]
        cmp     al, 40h
        jne     L_0CC05
        ret
L_0CC05:
        inc     al
        mov     byte ptr [P_7742], al
        cmp     al, 3fh
        jne     L_0CC0F
        ret
L_0CC0F:
        cmp     al, byte ptr [P_7743]
        je      L_0CC16
        ret
L_0CC16:
        inc     byte ptr [P_7742]
        ret
edit_trmove_refresh:
        BC_CLEAR_RECT 108, 16, 132, 30
L_0CC22:
        db      0a0h
        if      FW_VERSION = 172
change_bars_screen:
        inc     dx
        ja      L_0CC5E+4
        else
        db      28h
        db      77h, 3ch
        endif
        add     byte ptr [si+23h], dh
        cmp     al, 1
        jne     L_0CC34
        cmp     byte ptr [P_7743], 0
        je      L_0CC4C
L_0CC34:
        cmp     al, 40h
        je      L_0CC50
        dec     al
        cmp     al, byte ptr [P_7743]
L_0CC3E:
        jne     L_0CC42
        dec     al
L_0CC42:
        call    status_display_CA60
        if      FW_VERSION = 172
time_display_dialog_0CC46       equ     $+1
        endif
time_display_settings           equ     $+2
        mov     al, byte ptr [P_7742]
        call    L_0CA50
        ret
L_0CC4C:
        call    L_0CA50
        ret
L_0CC50:
        if      FW_VERSION = 172
        sub     al, 2
        else
        dec     al
        endif
L_0CC52:
        call    status_display_CA60
        ret
edit_trmove_f6:
        callf   CS1_SEG:rec_note_is_unset_far
L_0CC5B:
        jae     L_0CC5E
        ret
L_0CC5E:
        callf   CS1_SEG:undo_seq_save_far
        callf   CS1_SEG:undo_seq_flag_latch_far
        mov     ax, ds
        mov     es, ax
        mov     di, P_7DD8
        mov     al, 0
        mov     cl, 40h
        push    di
L_0CC74:
        stosb
        inc     al
        loop    L_0CC74
        pop     di
insert_bars_screen              equ     $+4
        cmp     byte ptr [P_7742], 0
        je      L_0CCB5
        dec     byte ptr [P_7742]
        sub     bx, bx
        mov     bl, byte ptr [P_7743]
        mov     al, byte ptr [P_7742]
        cmp     bl, al
L_0CC90:
        jne     L_0CC95
        jmp     NEAR L_0CD99
L_0CC95:
        mov     byte ptr [bx+di], al
        jb      L_0CCA9
        if      FW_VERSION = 150
        dec     al
        endif
        inc     bl
        inc     byte ptr [P_7742]
L_0CC9F:
        dec     bl
        cmp     al, bl
L_0CCA3:
        je      note_value_display
        inc     byte ptr [bx+di]
        jmp     SHORT L_0CC9F
L_0CCA9:
        inc     al
L_0CCAB:
        inc     bl
        cmp     bl, al
L_0CCAF:
        je      note_value_display
        dec     byte ptr [bx+di]
timing_correct_dialog_0CCB3:
        jmp     SHORT L_0CCAB
L_0CCB5:
        sub     bx, bx
        mov     bl, byte ptr [P_7743]
        mov     al, byte ptr [P_7742]
        cmp     bl, al
L_0CCC0:
        jne     L_0CCC5
        jmp     NEAR L_0CD99
L_0CCC5:
        mov     byte ptr [bx+di], al
        jb      L_0CCA9
        dec     al
L_0CCCB:
        dec     bl
        cmp     al, bl
L_0CCCF:
        je      note_value_display
        inc     byte ptr [bx+di]
        jmp     SHORT L_0CCCB
note_value_display:
        mov     es, word ptr [SEQ_EVENTS_SEG]
        sub     si, si
        sub     bx, bx
L_0CCDD:
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
        jne     L_0CCE6
        jmp     SHORT L_0CD05
L_0CCE6:
        cmp     al, 0c0h
        je      L_0CCFE
        cmp     al, 0c1h
        je      L_0CCFE
        mov     ah, al
        and     ax, 3fc0h
shift_timing_display:
        mov     bl, ah
        mov     ah, byte ptr [bx+BUF_FILE_HEADER]
        or      al, ah
        mov     byte ptr es:[si], al
L_0CCFE:
        callf   CS1_SEG:SEQUENCE_DATA_READ_FAR_OFS
        jmp     SHORT L_0CCDD
L_0CD05:
        mov     ax, ds
        mov     es, ax
        mov     di, P_7E18
        mov     dx, word ptr [CUR_SEQ_SEG]
        push    ds
        mov     ds, dx
        mov     si, 30h
        mov     cx, 400h
        rep movsb
        pop     ds
        mov     es, dx
        sub     bx, bx
L_0CD20:
        sub     ax, ax
L_0CD22:
        mov     al, byte ptr [bx+BUF_FILE_HEADER]
        mov     di, ax
        shl     di, 4
        add     di, 30h
        mov     si, bx
        shl     si, 4
        add     si, P_7E18
        mov     cx, 10h
        rep movsb
        inc     bl
L_0CD3E:
        cmp     bl, 40h
        jne     L_0CD22
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     si, 430h
L_0CD4A:
        call    L_0CD61
        mov     si, 470h
L_0CD50:
        call    L_0CD61
        mov     si, 4b0h
L_0CD56:
        call    L_0CD61
        mov     si, 4f0h
L_0CD5C:
        call    L_0CD61
        jmp     SHORT L_0CD99
L_0CD61:
        sub     bx, bx
        mov     bl, byte ptr [P_7743]
midi_input_dialog               equ     $+1
        cmp     bl, byte ptr [P_7742]
        jb      L_0CD83
        mov     ah, byte ptr es:[bx+si]
L_0CD70:
        mov     al, byte ptr es:[bx+si-1]
handler_BC_CONTEXT_SYNC         equ     $+1
        mov     byte ptr es:[bx+si], al
        dec     bl
        cmp     bl, byte ptr [P_7742]
truncate_track_warning:
        jne     L_0CD70
        mov     byte ptr es:[bx+si], ah
        ret
L_0CD83:
        mov     ah, byte ptr es:[bx+si]
L_0CD86:
        mov     al, byte ptr es:[bx+si+1]
        mov     byte ptr es:[bx+si], al
        inc     bl
        cmp     bl, byte ptr [P_7742]
        jne     L_0CD86
        mov     byte ptr es:[bx+si], ah
        ret
L_0CD99:
        call    edit_trmove_screen
L_0CD9C:
        call    calls_ui_a_011_0ca1c
        jmp     ui_ctrl_0caf9
edit_trmove_f5:
        if      FW_VERSION = 172
        cmp     byte ptr [P_7742], 0
L_0CDA7:
        je      L_0CD99
        dec     byte ptr [P_7742]
        jmp     L_0CD99
        endif
edit_trans_screen:
        db      9ah
        dw      L_1D876
        dw      CS1_SEG
bc_int69_0cdb4:
        int     50h
bc_int5d_0cdb6:
        call    error_error_0c05c
bc_int5d_0cdb9:
        INT_69 bc_int67_68_0cf2d
bc_int5d_0cdbd:
        INT_5D edit_trans_refresh
        call    word ptr [D_779F]
        ret
edit_trans_refresh:
        if      FW_VERSION = 172
record_all_channels_a           equ     $+8
        endif
        BC_STATUS_A 106, 13, G_TRANSPOSE_AMOUNT, TBL_SEMITONE_LABELS
        if      FW_VERSION = 172
        db      0a1h
        adc     ax, 400ch
status_000_status:
        BC_UI_DIALOG 184, 36
L_0CDD8:
        mov     ax, word ptr [D_0C17]
        inc     ax
        cmp     ax, 3e8h
        jne     L_0CDEC
bar_number_display:
        BC_STATUS 220, 36, "000"
status_000_0cdea:
        jmp     L_0CDF1
L_0CDEC:
        BC_UI_DIALOG 220, 36
        endif
L_0CDF1:
        mov     al, byte ptr [G_TRANSPOSE_TRACK]
L_0CDF4:
        BC_UI_MENU 20, 2
        db      3ch
        db      00h
L_0CDFB:
        je      all_tracks_display
        mov     ah, 0
        dec     al
        push    ax
        shl     ax, 4
        add     ax, 30h
        mov     si, ax
        pop     bx
        mov     bh, 0
        mov     es, word ptr [CUR_SEQ_SEG]
        test    byte ptr es:[bx+TRK_STATUS], 1
all_1_status_0CE17:
        je      L_0CE39
        mov     dx, es
all_1_status:
        BC_STATUS_B 38, 2, 16
        db      0c3h
all_tracks_display:
        BC_STATUS 38, 2, "ALL             "
status_all_0ce38:
        ret
L_0CE39:
        BC_UI_A4 38, 2
        ret
L_0CE3F:
        if      FW_VERSION = 172
ui_ctrl_0ce42                   equ     $+3
        endif
        mov     word ptr [D_779F], L_0CE3F
ui_ctrl_0ce45:
        BC_UI_CTRL 19, 1, 13, 9
bc_int6c_0ce4c:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_0ce6d, NULL_HANDLER_OFS, ui_ctrl_0ce6d
L_0CE56:
        mov     ax, ds
        mov     es, ax
        mov     bp, L_0CE3F
        mov     ax, G_TRANSPOSE_TRACK
        mov     bx, NULL_HANDLER_OFS
        mov     cx, 40h
        mov     dx, 0
calls_set_mode_flag_0_0ce69:
        call    set_mode_flag_0
        ret
ui_ctrl_0ce6d:
        mov     word ptr [D_779F], ui_ctrl_0ce6d
ui_ctrl_0ce73:
        BC_UI_CTRL 105, 12, 19, 9
calls_setup_callback_vectors_0ce7a:
        mov     al, 18h
        mov     si, G_TRANSPOSE_AMOUNT
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
bc_int6c_0ce85:
        if      FW_VERSION = 172
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, L_0CE3F, ui_ctrl_0ce96
        else
        db      0cdh
        db      62h, 24h, 0cch, 0cdh, 63h, 0dah
        push    cs
        endif
L_0CE8F:
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
        if      FW_VERSION = 172
        ret
ui_ctrl_0ce96:
        mov     word ptr [D_779F], ui_ctrl_0ce96
ui_ctrl_0ce9c:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_0cee2, ui_ctrl_0ce6d, NULL_HANDLER_OFS
ui_ctrl_0cea6:
        BC_UI_CTRL 183, 35, 19, 9
L_0CEAD:
        mov     ax, ds
        mov     es, ax
        mov     bp, ui_ctrl_0ce96
        mov     ax, D_0C15
        mov     bx, L_0CEC4
        mov     cx, 3e6h
        mov     dx, 0
calls_set_mode_flag_1_0cec0:
        call    set_mode_flag_1
        ret
L_0CEC4:
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     ax, word ptr es:[18h]
        jb      L_0CED4
        mov     ax, word ptr es:[18h]
        dec     ax
L_0CED4:
        mov     word ptr [D_0C15], ax
        cmp     ax, word ptr [D_0C17]
L_0CEDB:
        jae     L_0CEDE
        ret
L_0CEDE:
        mov     word ptr [D_0C17], ax
        ret
ui_ctrl_0cee2:
        mov     word ptr [D_779F], ui_ctrl_0cee2
ui_ctrl_0cee8:
        INT_6C ui_ctrl_0ce96, NULL_HANDLER_OFS, ui_ctrl_0ce6d, NULL_HANDLER_OFS
ui_ctrl_0cef2:
        BC_UI_CTRL 219, 35, 19, 9
L_0CEF9:
        mov     ax, ds
        mov     es, ax
        mov     bp, ui_ctrl_0cee2
        mov     ax, D_0C17
        mov     bx, L_0CF10
calls_set_mode_flag_1_0cf06:
        mov     cx, 3e7h
        mov     dx, 0
calls_set_mode_flag_1_0cf0c:
        call    set_mode_flag_1
        ret
L_0CF10:
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     ax, word ptr es:[18h]
        jb      L_0CF1F
        mov     ax, word ptr es:[18h]
L_0CF1F:
        mov     word ptr [D_0C17], ax
        cmp     ax, word ptr [D_0C15]
L_0CF26:
        jb      L_0CF29
        ret
L_0CF29:
        mov     word ptr [D_0C15], ax
        endif
        ret
bc_int67_68_0cf2d:
        callf   CS1_SEG:transpose_permanent_dialog
bc_int67_68_0cf32:
        int     50h
bc_int67_68_0cf34:
        INT_67 edit_trans_screen
bc_int67_68_0cf38:
        INT_68 transpose_permanent_do_it
L_0CF3C:
        ret
transpose_permanent_do_it:
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[TBL_0013], 0
L_0CF47:
        if      FW_VERSION = 172
        jne     L_0CF4C
track_dialog_0CF49:
        jmp     jmp_init_with_int50_0d003
L_0CF4C:
        mov     ax, word ptr [D_0C15]
        cmp     ax, word ptr [D_0C17]
L_0CF53:
        endif
        jne     br_0CF58
        jmp     jmp_init_with_int50_0d003
br_0CF58:
        callf   CS1_SEG:undo_seq_save_far
        callf   CS1_SEG:undo_seq_flag_latch_far
        sub     si, si
        mov     es, word ptr [SEQ_EVENTS_SEG]
L_0D8A7:
L_0CF68:
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
        if      FW_VERSION = 172
        jne     L_0CF72
        jmp     jmp_init_with_int50_0d003
L_0CF72:
        cmp     al, 0c0h
        jne     L_0CF80
        mov     ax, word ptr es:[si+1]
        cmp     ax, word ptr [D_0C15]
        endif
L_0CF7E:
        if      FW_VERSION = 172
        je      L_0CF87
        else
        je      jmp_init_with_int50_0d003
        endif
L_0CF80:
        if      FW_VERSION = 172
        callf   CS1_SEG:SEQUENCE_DATA_READ_FAR_OFS
        jmp     L_0CF68
L_0CF87:
        callf   CS1_SEG:SEQUENCE_DATA_READ_FAR_OFS
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
        jne     L_0CF95
        jmp     jmp_init_with_int50_0d003
L_0CF95:
        cmp     al, 0c0h
L_0CF97:
        jne     L_0CFA7
        mov     ax, word ptr es:[si+1]
        cmp     ax, word ptr [D_0C17]
L_0CFA1:
        jne     L_0CFA5
        jmp     jmp_init_with_int50_0d003
L_0CFA5:
        jmp     L_0CF87
        endif
L_0CFA7:
        mov     ah, al
        and     ax, 3fc0h
        cmp     al, 0
        je      L_0CFBB
        cmp     al, 40h
L_0CFB2:
        jne     L_0CF87
        cmp     byte ptr es:[si+3], 50h
L_0CFB9:
        jne     L_0CF87
L_0CFBB:
        cmp     byte ptr [G_TRANSPOSE_TRACK], 0
        je      L_0CFCC
        inc     ah
        cmp     ah, byte ptr [G_TRANSPOSE_TRACK]
L_0CFC8:
        jne     L_0CF87
        dec     ah
L_0CFCC:
        push    es
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bl, ah
        sub     bh, bh
        if      FW_VERSION = 172
erase_track_warning             equ     $+1
        mov     bl, byte ptr es:[bx+TRK_CHANNEL]
        else
        mov     bl, byte ptr es:[bx+TRK_CHANNEL]
        endif
        pop     es
        test    bl, 40h
L_0CFDE:
        jne     L_0CF87
        mov     al, byte ptr es:[si+4]
        mov     ah, al
        and     ax, 807fh
        add     al, byte ptr [G_TRANSPOSE_AMOUNT]
        sub     al, 0ch
        jae     loop_0CFF3
        add     al, 0ch
loop_0CFF3:
        cmp     al, 80h
        jb      L_0CFFB
        sub     al, 0ch
        jmp     SHORT loop_0CFF3
L_0CFFB:
        or      al, ah
        mov     byte ptr es:[si+4], al
        if      FW_VERSION = 172
        jmp     L_0CF87
        else
L_0CF87:
        callf   CS1_SEG:SEQUENCE_DATA_READ_FAR_OFS
        jmp     L_0CF68
        endif
jmp_init_with_int50_0d003:
        mov     byte ptr [G_TRANSPOSE_AMOUNT], 0ch
        jmp     main_screen_enter
bc_int5d_0d00b:
        callf   CS1_SEG:P_DB6A
bc_int5d_0d010:
        int     50h
bc_int5d_0d012:
        INT_5D edit_user_refresh
L_0D016:
        call    error_error_0c05c
L_0D019:
        call    ui_ctrl_0d0c4
        ret
edit_user_refresh:
        mov     si, 0
        mov     ax, word ptr [si+TBL_0014]
L_0D023:
        BC_UI_A2 24, 13
L_0D028:
        mov     al, byte ptr [si+1ah]
L_0D02B:
        BC_ARITH_EXT 00dd8h
L_0D030:
        mov     al, byte ptr [si+1bh]
L_0D033:
        BC_ARITH_EXT 00deah
drum_1_status_0D038:
        db      8bh, 44h
delete_all_tracks_dialog:
        db      18h
drum_1_status:
        BC_FIELD 216, 22
L_0D040:
        mov     al, byte ptr [B_77A2]
        mov     bl, al
        inc     al
        sub     bh, bh
        add     bx, si
        if      FW_VERSION = 172
edit_velocity_dialog            equ     $+1
        mov     al, byte ptr [bx+D_0430]
        else
        mov     al, byte ptr [bx+TRK_CHANNEL]
        endif
        push    ax
        push    ax
        and     al, 80h
drum_display_2:
        BC_STATUS 6, 36, "Drum"
midi_1_status_0D05D:
        pop     ax
        test    al, 40h
midi_1_status:
        db      75h
erase_all_track_warning:
        db      0ah
midi_display_2:
        BC_STATUS 6, 36, "MIDI"
status_midi_0d06c:
        pop     ax
        and     al, 3fh
        xor     al, 20h
        test    al, 20h
        je      L_0D077
loop_dialog:
        mov     al, 20h
L_0D077:
        mov     ah, 3
        mul     ah
        add     ax, D_1555
        mov     si, ax
        mov     dx, ds
L_0D082:
        if      FW_VERSION = 172
L_0D087                         equ     $+5
        endif
        BC_STATUS_B 36, 36, 3
L_0D088:
        BC_CLEAR_RECT 102, 36, 18, 7
off_4_status_0D08F:
        mov     al, byte ptr [bx+TRK_VELOCITY]
        sub     ah, ah
off_4_status:
        BC_CALL 02466h
off_display_6:
        BC_STATUS 162, 36, "OFF"
status_off_0d0a3:
        mov     al, byte ptr [bx+D_0470]
        cmp     al, 0
L_0D0A9:
        je      bc_target_0d0bb
        sub     ah, ah
        push    ax
L_0D0AE:
        BC_CLEAR_RECT 162, 36, 18, 7
L_0D0B5:
        pop     ax
L_0D0B6:
        BC_CALL 024a2h
bc_target_0d0bb:
        mov     al, byte ptr [D_0020]
ui_ctrl_0d0be:
        BC_JUMP 01fd8h
bc_target_0d0c3:
        ret
L_0D9D0:
ui_ctrl_0d0c4:
        BC_UI_CTRL 23, 12, 31, 9
bc_int6c_0d0cb:
        INT_6C NULL_HANDLER_OFS, user_defaults_tsig_field, NULL_HANDLER_OFS, ui_ctrl_0d195
bc_int6a_0d0d5:
        INT_6A user_defaults_tempo_inc, user_defaults_tempo_dec
L_0D0DB:
        ret
user_defaults_tempo_inc:
        mov     bx, word ptr [TBL_0014]
        add     ax, bx
        cmp     ax, 0bb8h
        jb      L_0D0EA
        mov     ax, 0bb8h
L_0D0EA:
        mov     word ptr [TBL_0014], ax
        ret
user_defaults_tempo_dec:
        mov     bx, ax
        mov     ax, word ptr [TBL_0014]
        sub     ax, bx
L_0D0F5:
        jae     L_0D0F9
        sub     ax, ax
L_0D0F9:
        cmp     ax, 12ch
        jae     L_0D0EA
        mov     ax, 12ch
        jmp     SHORT L_0D0EA
user_defaults_tsig_field:
        BC_UI_CTRL 215, 12, 31, 9
L_0D10A:
        db      0b0h
midi_input_dialog_0D10B:
        push    ax
        mov     si, D_77A1
        mov     bx, L_0D120
        call    setup_callback_vectors
bc_int6c_0d115:
        INT_6C ui_ctrl_0d0c4, NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_ctrl_0d132
L_0D11F:
        ret
L_0D120:
        mov     bl, al
        sub     bh, bh
        shl     bx, 1
        mov     ax, word ptr [bx+TBL_XS_15B8]
        mov     byte ptr [SEQ_TEMPLATE+1ah], al
        mov     byte ptr [SEQ_TEMPLATE+1bh], ah
        ret
ui_ctrl_0d132:
        BC_UI_CTRL 215, 21, 19, 9
bc_int6c_0d139:
        INT_6A user_defaults_bars_inc, user_defaults_bars_dec
bc_int6c_0d13f:
        INT_6C ui_ctrl_0d0c4, NULL_HANDLER_OFS, user_defaults_tsig_field, ui_ctrl_0d171
L_0D149:
        ret
user_defaults_bars_inc:
        add     ax, word ptr [SEQ_TEMPLATE+18h]
        cmp     ax, 3e7h
        jb      L_0D156
        mov     ax, 3e7h
L_0D156:
        mov     word ptr [SEQ_TEMPLATE+18h], ax
        ret
user_defaults_bars_dec:
        db      8bh, 1eh, 18h
midi_filter_display:
        add     byte ptr [bp+di], ch
        db      0d8h
        jae     L_0D164
        sub     bx, bx
L_0D164:
        cmp     bx, 0
        jne     ui_ctrl_0d16c
        mov     bx, 1
ui_ctrl_0d16c:
        mov     word ptr [SEQ_TEMPLATE+18h], bx
        ret
ui_ctrl_0d171:
        BC_UI_CTRL 215, 30, 19, 9
bc_int6c_0d178:
        INT_6A user_defaults_loop_inc, ui_ctrl_0d18f
bc_int6c_0d17e:
        INT_6C ui_ctrl_0d2e4, NULL_HANDLER_OFS, ui_ctrl_0d132, NULL_HANDLER_OFS
L_0D188:
        ret
user_defaults_loop_inc:
        mov     byte ptr [D_0020], 1
        ret
ui_ctrl_0d18f:
        mov     byte ptr [D_0020], 0
        ret
ui_ctrl_0d195:
        BC_UI_CTRL 5, 35, 25, 9
bc_int6c_0d19c:
        INT_6A L_0D1AD, record_all_16_channels_a
bc_int6c_0d1a2:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_0d1c9, ui_ctrl_0d0c4, NULL_HANDLER_OFS
L_0D1AC:
        ret
L_0D1AD:
        sub     bx, bx
        mov     cx, 40h
L_0D1B2:
        or      byte ptr [bx+TRK_CHANNEL], 40h
        inc     bx
        loop    L_0D1B2
        ret
record_all_16_channels_a:
        sub     bx, bx
        mov     cx, 40h
L_0D1C0:
        and     byte ptr [bx+TRK_CHANNEL], 0bfh
        inc     bx
        loop    L_0D1C0
        ret
ui_ctrl_0d1c9:
        INT_6A user_defaults_channel_inc, user_defaults_channel_dec
ui_ctrl_0d1cf:
        INT_6C ui_ctrl_0d195, user_defaults_channel_right, ui_ctrl_0d0c4, NULL_HANDLER_OFS
ui_ctrl_0d1d9:
        BC_UI_CTRL 35, 35, 19, 9
        db      0f6h, 06h, 30h, 04h, 20h
ui_ctrl_0d1e5:
        jne     ui_ctrl_0d1e8
copy_events_dialog:
        ret
ui_ctrl_0d1e8:
        BC_UI_CTRL 35, 35, 13, 9
L_0D1EF:
        ret
user_defaults_channel_inc:
        sub     bx, bx
        mov     al, byte ptr [bx+TRK_CHANNEL]
        mov     ah, al
        and     ax, 0f00fh
        test    ah, 20h
        jne     L_0D205
        or      ah, 20h
        jmp     SHORT erase_record_warning
L_0D205:
        inc     al
        cmp     al, 0fh
        jb      erase_record_warning
        mov     al, 0fh
erase_record_warning:
        or      al, ah
        or      al, 20h
        mov     cx, 40h
L_0D214:
        mov     byte ptr [bx+TRK_CHANNEL], al
        inc     bx
        loop    L_0D214
        jmp     SHORT ui_ctrl_0d1d9
user_defaults_channel_dec:
        sub     bx, bx
        mov     al, byte ptr [bx+TRK_CHANNEL]
        mov     ah, al
        and     ax, 0f00fh
        sub     al, 1
        jae     L_0D231
        sub     al, al
        and     ah, 0dfh
L_0D231:
        or      al, ah
        mov     cx, 40h
L_0D236:
        mov     byte ptr [bx+TRK_CHANNEL], al
        inc     bx
        loop    L_0D236
        jmp     SHORT ui_ctrl_0d1d9
user_defaults_channel_right:
        sub     bx, bx
        test    byte ptr [bx+TRK_CHANNEL], 20h
L_0D246:
        jne     ui_ctrl_0d254
        jmp     SHORT ui_ctrl_0d295
L_0D24A:
        db      0f6h, 06h, 30h, 04h, 20h
ui_ctrl_0d24f:
        jne     ui_ctrl_0d254
ui_ctrl_0d251:
        jmp     NEAR ui_ctrl_0d1c9
ui_ctrl_0d254:
        BC_UI_CTRL 47, 35, 7, 9
bc_int6c_0d25b:
        INT_6A L_0D26C, L_0D27A
bc_int6c_0d261:
        INT_6C L_0D288, ui_ctrl_0d295, ui_ctrl_0d0c4, NULL_HANDLER_OFS
L_0D26B:
        ret
L_0D26C:
        sub     bx, bx
        mov     cx, 40h
L_0D271:
        or      byte ptr [bx+TRK_CHANNEL], 10h
        inc     bx
        loop    L_0D271
        ret
L_0D27A:
        sub     bx, bx
        mov     cx, 40h
L_0D27F:
        and     byte ptr [bx+TRK_CHANNEL], 0efh
        inc     bx
        loop    L_0D27F
        ret
L_0D288:
        db      0f6h, 06h, 30h, 04h, 20h
L_0D28D:
        jne     ui_ctrl_0d292
        jmp     NEAR ui_ctrl_0d195
ui_ctrl_0d292:
        jmp     NEAR ui_ctrl_0d1c9
ui_ctrl_0d295:
        BC_UI_CTRL 101, 35, 19, 9
bc_int6c_0d29c:
        INT_6A user_defaults_velo_inc, user_defaults_velo_dec
bc_int6c_0d2a2:
        INT_6C L_0D24A, ui_ctrl_0d2e4, ui_ctrl_0d0c4, NULL_HANDLER_OFS
L_0D2AC:
        ret
user_defaults_velo_inc:
        sub     bx, bx
        add     al, byte ptr [bx+TRK_VELOCITY]
        cmp     al, 0c8h
        jb      L_0D2B9
        mov     al, 0c8h
L_0D2B9:
        mov     cx, 40h
L_0D2BC:
        mov     byte ptr [bx+TRK_VELOCITY], al
        inc     bx
        loop    L_0D2BC
        ret
user_defaults_velo_dec:
        sub     bx, bx
        mov     cl, byte ptr [bx+TRK_VELOCITY]
        sub     cl, al
        jae     L_0D2D0
        sub     cl, cl
L_0D2D0:
        cmp     cl, 0
        jne     L_0D2D7
        mov     cl, 1
L_0D2D7:
        mov     al, cl
        mov     cx, 40h
L_0D2DC:
        mov     byte ptr [bx+TRK_VELOCITY], al
        inc     bx
        loop    L_0D2DC
copy_bars_dialog:
        ret
ui_ctrl_0d2e4:
        BC_UI_CTRL 161, 35, 19, 9
bc_int6c_0d2eb:
        INT_6A user_defaults_pgm_inc, user_defaults_pgm_dec
bc_int6c_0d2f1:
        INT_6C ui_ctrl_0d295, ui_ctrl_0d171, ui_ctrl_0d0c4, NULL_HANDLER_OFS
L_0D2FB:
        ret
user_defaults_pgm_inc:
        sub     bx, bx
        add     al, byte ptr [bx+D_0470]
        cmp     al, 80h
        jb      L_0D308
        mov     al, 7fh
L_0D308:
        mov     cx, 40h
L_0D30B:
        mov     byte ptr [bx+D_0470], al
        inc     bx
        loop    L_0D30B
        ret
user_defaults_pgm_dec:
        sub     bx, bx
        mov     cl, byte ptr [bx+D_0470]
        sub     cl, al
edit_velocity_dialog_0D31B:
        jae     L_0D31F
        sub     cl, cl
L_0D31F:
        mov     al, cl
        mov     cx, 40h
L_0D324:
        mov     byte ptr [bx+D_0470], al
        inc     bx
        loop    L_0D324
        ret
L_0D32C:
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[TBL_0013], 0
track_status_0D336:
        jne     erase_dialog
        ret
erase_dialog:
        mov     al, byte ptr [SEL_TRACK]
        inc     al
        mov     byte ptr [P_77AA], al
track_status:
        DLG_ERASE
softkey_do_it_0d3b3:
        int     50h
bc_int5b_0d3b5:
        INT_5B main_screen_enter
bc_int67_68_0d3b9:
        mov     word ptr [D_0DF0], main_screen_enter
bc_int5d_0d3bf:
        INT_67 main_screen_enter
bc_int5d_0d3c3:
        INT_68 erase_do_it
bc_int5d_0d3c7:
        INT_5D erase_refresh
L_0D3CB:
        mov     word ptr [UI_SLOT_PAD_HIT], L_0C197
L_0D3D1:
        call    clamp_edit_range_to_seq_end
L_0D3D4:
        call    ui_ctrl_0d53c
L_0D3D7:
        BC_SEQ_INIT
L_0D3DA:
        ret
erase_refresh:
        mov     al, 0
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bl, byte ptr [P_77AA]
        mov     bh, 0
        sub     bl, 1
status_0_all_status:
        jb      n0_all_status
loop_dialog_0D3ED               equ     $+1
        test    byte ptr es:[bx+430h], 40h
        je      n0_all_status
        mov     al, 1
n0_all_status:
        mov     byte ptr [P_77A9], al
zero_all_tracks_display:
        BC_STATUS 62, 13, " 0-ALL             "
status_0all_0d412:
        mov     al, byte ptr [P_77AA]
        mov     ah, 0
        cmp     al, 0
        je      L_0D44A
L_0D41B:
        BC_ARITH_EXT 00d3eh
L_0D420:
        mov     es, word ptr [CUR_SEQ_SEG]
        dec     al
        mov     bx, ax
        shl     ax, 4
loop_bars_count_display:
        add     ax, 30h
        mov     si, ax
        test    byte ptr es:[bx+TRK_STATUS], 1
L_0D436:
        db      75h, 07h
L_0D438:
        BC_UI_A4 80, 13
        db      0ebh, 0bh, 8ch, 0c2h
L_0D441:
        BC_STATUS_B 80, 13, 16
L_0D447:
        BC_PLANE_A
L_0D44A:
        mov     dx, word ptr [G_RANGE_START_BEAT_TICKS]
        mov     ax, word ptr [G_RANGE_START_BAR]
        mov     cx, word ptr [G_RANGE_START_TICK]
L_0D455:
        BC_RANGE 62, 23
L_0D45A:
        mov     dx, word ptr [G_RANGE_END_BEAT_TICKS]
        mov     ax, word ptr [G_RANGE_END_BAR]
load_aps_dialog                 equ     $+1
        mov     cx, word ptr [G_RANGE_END_TICK]
L_0D465:
        BC_RANGE 134, 23
L_0D46A:
        if      FW_VERSION = 172
        BC_CLEAR_RECT 62, 33, 162, 7
blank_line_display:
        BC_STATUS 26, 43, "                                 "
        else
        BC_CLEAR_RECT 62, 33, 162, 18
        endif
L_0D498:
        if      FW_VERSION = 172
count_metronome_dialog_0D49D    equ     $+5
        endif
        BC_STATUS_A 62, 33, G_ERASE_MODE, TBL_ERASE_MODE_LABELS
        db      80h
        db      3eh
        if      FW_VERSION = 172
        cmpsb
        else
        db      8ch
        endif
        ja      L_0D4A6
L_0D4A6:
        je      notes_2_status_0D4CB
L_0D4A8:
        if      FW_VERSION = 172
L_0D4AE                         equ     $+6
        endif
        BC_STATUS_A 140, 33, G_ERASE_EVENT_TYPE, TBL_ERASE_EVENT_LABELS
        db      80h
        db      3eh
        if      FW_VERSION = 172
        cmpsw
        else
        db      8dh
        endif
count_in_rate_display:
        ja      L_0D4B6
L_0D4B6:
        je      notes_2_status_0D4CB
        cmp     byte ptr [G_ERASE_EVENT_TYPE], 2
L_0D4BD:
        je      L_0D4C0
        ret
L_0D4C0:
        mov     al, byte ptr [P_77A8]
        sub     ah, ah
L_0D4C5:
        BC_FIELD 188, 33
L_0D4CA:
        ret
notes_2_status_0D4CB:
        cmp     byte ptr [P_77A9], 0
notes_2_status:
        je      notes_display_2
        jmp     SHORT notesall_hit_pad_display
notes_display_2:
        BC_STATUS 26, 43, "Notes:         -             "
notesall_hit_pad_status_0D4F7:
        mov     al, byte ptr [G_EDIT_NOTE_LO]
notesall_hit_pad_1_status:
        BC_MIDI_FIELD 62, 43
L_0D4FF:
        mov     al, byte ptr [G_EDIT_NOTE_HI]
midi_fmt_disk_value:
        BC_MIDI_FIELD 128, 43
L_0D507:
        ret
notesall_hit_pad_display:
        BC_STATUS 26, 43, "Notes:ALL               (Hit pad)"
status_notesall_______________hit_pad_0d52f:
        mov     al, byte ptr [G_EDIT_DRUM_NOTE]
        mov     ah, byte ptr [G_EDIT_DRUM_PAD]
ui_ctrl_0d536:
        BC_MEM_STATUS 62, 43
ui_ctrl_0d53b:
        ret
ui_ctrl_0d53c:
        BC_UI_CTRL 61, 12, 13, 9
calls_setup_callback_vectors_0d543:
        mov     al, 40h
        mov     si, P_77AA
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
bc_int62_0d54e:
        INT_62 NULL_HANDLER_OFS
bc_int63_0d552:
        INT_63 ui_ctrl_0d56d
L_0D556:
        mov     bp, ui_ctrl_0d53c
        mov     ax, ds
        mov     es, ax
        mov     ax, P_77AA
        mov     bx, NULL_HANDLER_OFS
        mov     cx, 40h
        mov     dx, 0
calls_set_mode_flag_0_0d569:
        call    set_mode_flag_0
        ret
ui_ctrl_0d56d:
        BC_UI_CTRL 61, 22, 19, 9
bc_int6c_0d574:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_0d585, ui_ctrl_0d53c, erase_type_field
ui_ctrl_0d57e:
        mov     bp, ui_ctrl_0d56d
        if      FW_VERSION = 172
        call    L_0D999+9
        else
        db      0e8h
        db      15h
        db      04h
        endif
        ret
ui_ctrl_0d585:
        BC_UI_CTRL 85, 22, 13, 9
bc_int6c_0d58c:
        INT_6C ui_ctrl_0d56d, ui_ctrl_0d59d, ui_ctrl_0d53c, erase_type_field
L_0D596:
        mov     bp, ui_ctrl_0d585
ui_ctrl_0d599:
        call    L_0D9F9
        ret
ui_ctrl_0d59d:
        BC_UI_CTRL 103, 22, 13, 9
bc_int6c_0d5a4:
        INT_6C ui_ctrl_0d585, ui_ctrl_0d5b5, ui_ctrl_0d53c, erase_type_field
L_0D5AE:
        mov     bp, ui_ctrl_0d59d
ui_ctrl_0d5b1:
        call    L_0DA5D
        ret
ui_ctrl_0d5b5:
        BC_UI_CTRL 133, 22, 19, 9
bc_int6c_0d5bc:
        INT_6C ui_ctrl_0d59d, ui_ctrl_0d5cd, ui_ctrl_0d53c, erase_type_field
L_0D5C6:
        mov     bp, ui_ctrl_0d5b5
ui_ctrl_0d5c9:
        call    L_0DAC6
        ret
ui_ctrl_0d5cd:
        BC_UI_CTRL 157, 22, 13, 9
bc_int6c_0d5d4:
        INT_6C ui_ctrl_0d5b5, ui_ctrl_0d5e5, ui_ctrl_0d53c, erase_type_field
L_0D5DE:
        mov     bp, ui_ctrl_0d5cd
ui_ctrl_0d5e1:
        call    L_0DB18
        ret
ui_ctrl_0d5e5:
        BC_UI_CTRL 175, 22, 13, 9
bc_int6c_0d5ec:
        INT_6C ui_ctrl_0d5cd, NULL_HANDLER_OFS, ui_ctrl_0d53c, erase_type_field
L_0D5F6:
        mov     bp, g_range_start_bar
ui_ctrl_0d5f9:
        call    L_0DB7E
        ret
erase_type_field:
        BC_UI_CTRL 61, 32, 61, 9
L_0D604:
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
mode_start_display:
        mov     al, 2
        mov     si, G_ERASE_MODE
        mov     bx, L_0D618
        call    setup_callback_vectors
        mov     al, byte ptr [G_ERASE_MODE]
L_0D618:
        cmp     al, 0
bc_int6c_0d61a:
        je      ui_ctrl_0d633
bc_int6c_0d61c:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_0d63e, ui_ctrl_0d56d, NULL_HANDLER_OFS
L_0D626:
        mov     al, byte ptr [G_ERASE_EVENT_TYPE]
        cmp     al, 0
        je      bc_int6c_0d62e
        ret
bc_int6c_0d62e:
        INT_63 erase_notes_field
bc_int6c_0d632:
        ret
ui_ctrl_0d633:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_ctrl_0d56d, erase_notes_field
ui_ctrl_0d63d:
        ret
ui_ctrl_0d63e:
        BC_UI_CTRL 139, 32, 73, 9
calls_setup_callback_vectors_0d645:
        mov     al, 6
        mov     si, G_ERASE_EVENT_TYPE
        mov     bx, L_0D657
        call    setup_callback_vectors
        mov     al, byte ptr [G_ERASE_EVENT_TYPE]
        call    L_0D657
        ret
L_0D657:
        cmp     al, 2
bc_int6c_0d659:
        je      ui_ctrl_0d671
        if      FW_VERSION = 172
        push    ax
        endif
bc_int6c_0d65c:
        if      FW_VERSION = 172
        INT_6C erase_type_field, NULL_HANDLER_OFS, ui_ctrl_0d56d, NULL_HANDLER_OFS
L_0D666:
        pop     ax
        else
        INT_6C  erase_type_field, NULL_HANDLER_OFS, ui_ctrl_0d56d, NULL_HANDLER_OFS
        endif
        cmp     al, 0
bc_int63_0d669:
        je      bc_int6c_0d66c
        ret
bc_int6c_0d66c:
        if      FW_VERSION = 150
bc_int6c_0d670                  equ     $+4
        endif
        INT_63 ui_ctrl_0d6df
        if      FW_VERSION = 172
bc_int6c_0d670:
        endif
        ret
ui_ctrl_0d671:
        INT_6C erase_type_field, ui_ctrl_0d67c, ui_ctrl_0d56d, NULL_HANDLER_OFS
ui_ctrl_0d67b:
        ret
ui_ctrl_0d67c:
        BC_UI_CTRL 187, 32, 19, 9
calls_setup_callback_vectors_0d683:
        mov     al, 7fh
        mov     si, P_77A8
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
bc_int6c_0d68e:
        INT_6C erase_type_field, NULL_HANDLER_OFS, ui_ctrl_0d56d, NULL_HANDLER_OFS
L_0D698:
        ret
erase_notes_field:
        cmp     byte ptr [P_77A9], 0
ui_ctrl_0d69e:
        je      ui_ctrl_0d6a3
ui_ctrl_0d6a0:
        jmp     NEAR ui_ctrl_0d726
ui_ctrl_0d6a3:
        BC_UI_CTRL 61, 42, 49, 9
bc_int6c_0d6aa:
        if      FW_VERSION = 172
        INT_6A erase_notes_lo_inc, erase_notes_lo_dec
        else
        INT_6A L_0D6BA+1, L_0D6CF+4
        endif
bc_int6c_0d6b0:
        INT_6C NULL_HANDLER_OFS, ui_ctrl_0d6df, erase_type_field, NULL_HANDLER_OFS
L_0D6BA:
        ret
erase_notes_lo_inc:
L_0D6BE                         equ     $+3
        add     al, byte ptr [G_EDIT_NOTE_LO]
L_0D6C0                         equ     $+1
        cmp     al, 7fh
        jb      erase_notes_lo_inc+10
        mov     al, 7fh
        mov     byte ptr [G_EDIT_NOTE_LO], al
        cmp     al, byte ptr [G_EDIT_NOTE_HI]
        jae     L_0D6CF
        ret
L_0D6CF:
        mov     byte ptr [G_EDIT_NOTE_HI], al
        ret
erase_notes_lo_dec:
        sub     byte ptr [G_EDIT_NOTE_LO], al
        jae     L_0D6DE
change_disk_dialog              equ     $+1
        mov     byte ptr [G_EDIT_NOTE_LO], 0
L_0D6DE:
        ret
ui_ctrl_0d6df:
        cmp     byte ptr [P_77A9], 0
ui_ctrl_0d6e4:
        jne     ui_ctrl_0d726
ui_ctrl_0d6e6:
        BC_UI_CTRL 127, 42, 49, 9
bc_int6c_0d6ed:
        if      FW_VERSION = 172
        INT_6A erase_notes_hi_inc, erase_notes_hi_dec
        else
        INT_6A L_0D6FD+1, erase_notes_hi_dec
        endif
bc_int6c_0d6f3:
        INT_6C erase_notes_field, NULL_HANDLER_OFS, erase_type_field, NULL_HANDLER_OFS
L_0D6FD:
        ret
erase_notes_hi_inc:
        add     al, byte ptr [G_EDIT_NOTE_HI]
        cmp     al, 7fh
        jb      erase_notes_hi_inc+10
L_0D707                         equ     $+1
        mov     al, 7fh
        mov     byte ptr [G_EDIT_NOTE_HI], al
        ret
erase_notes_hi_dec:
        mov     ah, byte ptr [G_EDIT_NOTE_HI]
        sub     ah, al
        jae     erase_notes_hi_dec+10
        mov     ah, 0
        mov     byte ptr [G_EDIT_NOTE_HI], ah
        cmp     ah, byte ptr [G_EDIT_NOTE_LO]
        jb      ui_ctrl_0d721
        ret
ui_ctrl_0d721:
        if      FW_VERSION = 172
ui_ctrl_0d723                   equ     $+2
        endif
        mov     byte ptr [G_EDIT_NOTE_LO], ah
        ret
ui_ctrl_0d726:
        BC_UI_CTRL 61, 42, 37, 9
bc_int6c_0d72d:
        INT_6A pad_note_inc, pad_note_dec
bc_int6c_0d733:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, erase_type_field, NULL_HANDLER_OFS
L_0D73D:
        ret
erase_do_it:
        callf   CS1_SEG:seq_undo_checkpoint_far
        mov     ax, word ptr [G_RANGE_START_BAR]
        mov     cx, word ptr [G_RANGE_START_TICK]
        callf   CS1_SEG:seq_position_set_far
        mov     bp, word ptr [G_RANGE_END_BAR]
        mov     dx, word ptr [G_RANGE_END_TICK]
        mov     bl, byte ptr [G_EDIT_NOTE_LO]
        mov     bh, byte ptr [G_EDIT_NOTE_HI]
        cmp     byte ptr [P_77A9], 0
        je      L_0D777
        mov     bl, 0
        mov     bh, 7fh
        cmp     byte ptr [G_EDIT_DRUM_PAD], 41h
        je      L_0D777
        mov     bl, byte ptr [G_EDIT_DRUM_NOTE]
        mov     bh, bl
L_0D777:
        cmp     byte ptr [G_ERASE_MODE], 0
        if      FW_VERSION = 172
        je      L_0D777+18
        cmp     byte ptr [D_77A7], 0
        je      L_0D777+18
        else
        je      L_0D78F
        cmp     byte ptr [G_ERASE_EVENT_TYPE], 0
        je      L_0D78F
        endif
        mov     bh, 80h
        mov     bl, 80h
        if      FW_VERSION = 172
        cmp     bp, word ptr [SEQ_CUR_BAR]
        je      L_0D7BC
        endif
L_0D78F:
        les     si, [FP_SEQ_AFTER_GAP]
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
L_0D798:
        je      L_0D7DF
        mov     cx, word ptr es:[si+1]
        and     ch, 7
        cmp     al, 0c0h
        jne     L_0D7AE
L_0D7A5:
        cmp     bp, cx
L_0D7A7:
        je      L_0D7BC
copy_bars_dialog_0D7A9:
        call    L_0D84E
        jmp     SHORT L_0D78F
L_0D7AE:
        cmp     al, 0c1h
L_0D7B0:
        jne     L_0D7B7
L_0D7B2:
        call    L_0D84E
        jmp     SHORT L_0D78F
L_0D7B7:
        call    L_0D7FA
        jmp     SHORT L_0D78F
L_0D7BC:
        call    L_0D84E
L_0D7BF:
        les     si, [FP_SEQ_AFTER_GAP]
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
L_0D7C8:
        je      L_0D7DF
        cmp     al, 0c0h
L_0D7CC:
        je      L_0D7DF
        cmp     al, 0c1h
L_0D7D0:
        je      L_0D7BC
        mov     cx, word ptr es:[si+1]
        cmp     cx, dx
L_0D7D8:
        jae     L_0D7DF
L_0D7DA:
        call    L_0D7FA
        jmp     SHORT L_0D7BF
L_0D7DF:
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
L_0D7E4:
        je      jmp_init_with_int50_0d7eb
L_0D7E6:
        call    L_0D84E
        jmp     SHORT L_0D7DF
jmp_init_with_int50_0d7eb:
        mov     ax, word ptr [G_RANGE_START_BAR]
        mov     cx, word ptr [G_RANGE_START_TICK]
        callf   CS1_SEG:seq_position_set_far
        jmp     main_screen_enter
L_0D7FA:
        mov     ah, al
        and     ax, 3fc0h
        cmp     byte ptr [P_77AA], 0
        je      error_insufficient_memory_c+8
        push    bx
        cmp     al, 40h
        jne     L_0D7FA+31
error_no_system_file            equ     $+3
        mov     bl, byte ptr es:[si+3]
        and     bl, 0f0h
error_unreadable_format         equ     $+2
        cmp     bl, 80h
        jne     L_0D7FA+31
        mov     al, 0
        pop     bx
error_insufficient_memory_c:
        inc     ah
        cmp     ah, byte ptr [P_77AA]
        jne     L_0D84E
        cmp     byte ptr [G_ERASE_MODE], 1
        jb      L_0D829+10h
L_0D829:
        je      error_relocation
L_0D82B:
        call    L_0D85E
L_0D82E:
        jb      error_no_scsi_device
        jmp     SHORT L_0D84E
error_relocation:
        call    L_0D85E
L_0D835:
        jae     error_no_scsi_device
        db      0ebh
error_too_many_files:
        db      15h, 3ch
main_sequence_display_alt:
        add     byte ptr [di+19h], dh
        db      26h
error_write_protect_b:
        mov     ah, byte ptr [si+4]
        and     ah, 7fh
        cmp     ah, bl
L_0D846:
        jb      L_0D84E
        cmp     ah, bh
L_0D84A:
        ja      L_0D84E
        jmp     SHORT error_no_scsi_device
L_0D84E:
        pusha
        db      9ah
error_scsi_not_ready_b:
        dw      L_170B9
        dw      CS1_SEG
        popa
        ret
error_no_scsi_device:
        pusha
        callf   CS1_SEG:L_170BD
error_write_b:
        popa
        ret
L_0D85E:
        mov     ah, byte ptr [G_ERASE_EVENT_TYPE]
        cmp     al, 0
L_0D864:
        je      L_0D8BF
        cmp     al, 80h
error_no_from:
        db      74h, 4ah
        mov     cl, byte ptr es:[si+3]
        cmp     cl, 50h
L_0D871:
        je      L_0D8BF
        cmp     cl, 0e0h
L_0D876:
        je      L_0D88E
        cmp     cl, 0b0h
L_0D87B:
        je      L_0D8A3
        cmp     cl, 0c0h
L_0D880:
        je      L_0D895
        cmp     cl, 0d0h
L_0D885:
        je      L_0D89C
        cmp     ah, 5
        je      L_0D8BB
        jmp     SHORT L_0D8BD
L_0D88E:
        cmp     ah, 1
        je      L_0D8BB
        jmp     SHORT L_0D8BD
L_0D895:
        cmp     ah, 3
        je      L_0D8BB
        jmp     SHORT L_0D8BD
L_0D89C:
        cmp     ah, 4
        je      L_0D8BB
        jmp     SHORT L_0D8BD
L_0D8A3:
        cmp     ah, 2
        jne     L_0D8BD
        mov     ah, byte ptr es:[si+4]
        cmp     ah, byte ptr [P_77A8]
        je      L_0D8BB
        jmp     SHORT L_0D8BD
        db      80h, 0fch, 06h, 74h, 02h, 0ebh, 02h
L_0D8BB:
        stc
        ret
L_0D8BD:
        clc
        ret
L_0D8BF:
        cmp     ah, 0
        jne     L_0D8BD
        mov     ah, byte ptr es:[si+4]
        and     ah, 7fh
        cmp     ah, bl
        jb      L_0D8BD
        cmp     ah, bh
        ja      L_0D8BD
        jmp     SHORT L_0D8BB
        if      FW_VERSION = 172
        db      00h, 0b8h
        else
isr_45:
        db      0b8h
        endif
        dw      DATA_SEG
        db      8eh, 0d8h
L_0D8DB:
        call    pad_test_screen_draw
        iret
pad_test_screen_draw:
        BC_CLEAR
bc_int5d_0d8e2:
        int     50h
bc_int5d_0d8e4:
        mov     word ptr [UI_SLOT_PAD_HIT], L_0D999
bc_int5d_0d8ea:
        INT_5D pad_test_refresh
pad_slider_status_0D8EE:
        INT_5C pad_test_idle
pad_slider_status:
        DLG_PAD_TEST
L_0D964:
        ret
pad_test_refresh:
        mov     al, byte ptr [P_7826]
        inc     al
L_0D96A:
        BC_ARITH_EXT 0154eh
L_0D96F:
        mov     al, byte ptr [D_7827]
        sub     ah, ah
L_0D974:
        BC_FIELD 76, 35
L_0D979:
        mov     al, byte ptr [G_SLIDER_POS]
        sub     ah, ah
L_0D97E:
        BC_FIELD 183, 21
L_0D983:
        ret
pad_test_idle:
        mov     bl, byte ptr [P_7826]
        sub     bh, bh
        mov     al, byte ptr [bx+TBL_PAD_VELOCITY]
        sub     ah, ah
L_0D990:
        BC_FIELD 183, 35
transpose_warning:
        BC_FLUSH
L_0D998:
        ret
L_0D999:
        mov     byte ptr [P_7826], ah
        mov     byte ptr [D_7827], al
        ret
        db      00h
        call    L_0DE07
L_0D9A5:
        jne     L_0D9A8
        ret
L_0D9A8:
        mov     ax, ds
        mov     es, ax
        mov     ax, G_RANGE_START_BAR
        mov     bx, L_0D9BB
        mov     cx, 3e7h
        sub     dx, dx
calls_set_mode_flag_1_0d9b7:
        call    set_mode_flag_1
        ret
L_0D9BB:
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     ax, word ptr es:[18h]
        jb      L_0D9CF
        mov     ax, word ptr es:[18h]
        or      ax, ax
        je      L_0D9CF
        dec     ax
L_0D9CF:
        mov     word ptr [G_RANGE_START_BAR], ax
        sub     bx, bx
        mov     word ptr [G_RANGE_START_TICK], bx
        mov     word ptr [G_RANGE_START_BEAT], bx
        mov     word ptr [G_RANGE_START_CLOCK], bx
        cmp     ax, word ptr [G_RANGE_END_BAR]
        jb      L_0D9CF+38
        mov     word ptr [G_RANGE_END_BAR], ax
        mov     word ptr [G_RANGE_END_BEAT], bx
L_0D9EE                         equ     $+1
        mov     word ptr [G_RANGE_END_CLOCK], bx
        mov     word ptr [G_RANGE_END_TICK], bx
        call    calls_state_update_0dda7
        ret
L_0D9F9:
        call    L_0DE07
L_0D9FC:
        jne     L_0D9FF
        ret
L_0D9FF:
        mov     ax, ds
        mov     es, ax
        mov     ax, G_RANGE_START_BEAT
        mov     bx, L_0DA12
        mov     cx, 63h
        sub     dx, dx
calls_set_mode_flag_1_0da0e:
        call    set_mode_flag_1
        ret
L_0DA12:
        if      FW_VERSION = 172
        db      3bh, 06h, 28h, 78h, 72h, 04h, 0a1h, 28h, 78h, 48h, 0a3h, 3ch, 78h, 8bh, 1eh, 34h
        db      78h, 3bh, 1eh, 38h
        else
        db      3bh, 06h
        db      0eh
        db      78h, 72h, 04h, 0a1h
        db      0eh
        db      78h, 48h, 0a3h
        db      22h
        db      78h, 8bh, 1eh
        db      1ah
        db      78h, 3bh, 1eh
        db      1eh
        endif
L_0DA26:
        js      L_0DA9D
        cmp     ax, word ptr es:[G_RANGE_END_BEAT]
        jb      L_0DA4F
        mov     word ptr [G_RANGE_END_BEAT], ax
        mov     bx, word ptr [G_RANGE_START_CLOCK]
        cmp     bx, word ptr [G_RANGE_END_CLOCK]
        jb      L_0DA40
        mov     word ptr [G_RANGE_END_CLOCK], bx
L_0DA40:
        push    ax
        mov     bx, word ptr [G_RANGE_END_BEAT_TICKS]
        mul     bl
L_0DA47:
        add     ax, word ptr [G_RANGE_END_CLOCK]
        mov     word ptr [G_RANGE_END_TICK], ax
        pop     ax
L_0DA4F:
        mov     bx, word ptr [G_RANGE_START_BEAT_TICKS]
        mul     bl
        add     ax, word ptr [G_RANGE_START_CLOCK]
        mov     word ptr [G_RANGE_START_TICK], ax
        ret
L_0DA5D:
        call    L_0DE07
L_0DA60:
        jne     L_0DA63
        ret
L_0DA63:
        mov     ax, ds
        mov     es, ax
program_velo_display_song       equ     $+2
        mov     ax, G_RANGE_START_CLOCK
        mov     bx, L_0DA76
        mov     cx, 63h
        sub     dx, dx
calls_set_mode_flag_0_0da72:
        call    set_mode_flag_0
        ret
L_0DA76:
        if      FW_VERSION = 172
        db      3bh, 06h, 2ah, 78h, 72h, 04h, 0a1h, 2ah, 78h, 48h, 0a3h, 36h, 78h, 8bh, 1eh, 34h
        db      78h, 3bh, 1eh, 38h, 78h, 72h, 25h, 8bh, 1eh, 3ch, 78h, 3bh, 1eh, 40h, 78h, 72h
        db      1bh, 3bh, 06h, 42h, 78h, 72h, 15h
        else
        db      3bh, 06h
        db      10h
        db      78h, 72h, 04h, 0a1h
        db      10h
        db      78h, 48h, 0a3h
        db      1ch
        db      78h, 8bh, 1eh
        db      1ah
        db      78h, 3bh, 1eh, 1eh, 78h, 72h, 25h, 8bh, 1eh, 22h, 78h, 3bh, 1eh, 26h, 78h, 72h ; x;..xr%.."x;.&xr
        db      1bh, 3bh, 06h
        db      28h
        db      78h, 72h, 15h
        endif
L_0DA9D:
        mov     word ptr [G_RANGE_END_CLOCK], ax
        push    ax
        mov     ax, word ptr [G_RANGE_END_BEAT]
        mov     bx, word ptr [G_RANGE_END_BEAT_TICKS]
        mul     bl
        add     ax, word ptr [G_RANGE_END_CLOCK]
L_0DAB0                         equ     $+2
        mov     word ptr [G_RANGE_END_TICK], ax
        pop     ax
        mov     word ptr [G_RANGE_START_CLOCK], ax
        mov     cx, ax
        mov     ax, word ptr [G_RANGE_START_BEAT_TICKS]
        mov     bx, word ptr [G_RANGE_START_BEAT]
        mul     bl
        add     ax, cx
        mov     word ptr [G_RANGE_START_TICK], ax
        ret
L_0DAC6:
        call    L_0DE07
L_0DAC9:
        jne     L_0DACC
        ret
L_0DACC:
        mov     ax, ds
        mov     es, ax
        mov     ax, G_RANGE_END_BAR
        mov     bx, L_0DADF
        mov     cx, 3e7h
        sub     dx, dx
calls_set_mode_flag_1_0dadb:
        call    set_mode_flag_1
        ret
L_0DADF:
        mov     es, word ptr [CUR_SEQ_SEG]
device_display_load             equ     $+1
        cmp     ax, word ptr es:[18h]
        jb      L_0DAEE
        mov     ax, word ptr es:[18h]
L_0DAEE:
        mov     word ptr [G_RANGE_END_BAR], ax
        sub     bx, bx
        mov     word ptr [G_RANGE_END_BEAT], bx
        mov     word ptr [G_RANGE_END_CLOCK], bx
        mov     word ptr [G_RANGE_END_TICK], bx
        cmp     ax, word ptr [G_RANGE_START_BAR]
        ja      L_0DB14
        mov     word ptr [G_RANGE_START_BAR], ax
        mov     word ptr [G_RANGE_START_BEAT], bx
        mov     word ptr [G_RANGE_START_CLOCK], bx
        mov     word ptr [G_RANGE_START_TICK], bx
L_0DB14:
        call    calls_state_update_0ddb6
        ret
L_0DB18:
        call    L_0DE07
L_0DB1B:
        jne     L_0DB1E
        ret
L_0DB1E:
        mov     ax, ds
        mov     es, ax
        mov     ax, G_RANGE_END_BEAT
        mov     bx, L_0DB31
        mov     cx, 63h
        sub     dx, dx
calls_set_mode_flag_1_0db2d:
        call    set_mode_flag_1
        ret
L_0DB31:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bx, word ptr es:[18h]
        cmp     bx, word ptr [G_RANGE_END_BAR]
        jne     L_0DB41
        ret
L_0DB41:
        cmp     ax, word ptr [G_RANGE_END_BEATS]
        jb      L_0DB4B
        mov     ax, word ptr [G_RANGE_END_BEATS]
        dec     ax
L_0DB4B:
        mov     word ptr [G_RANGE_END_BEAT], ax
        mov     bx, word ptr [G_RANGE_START_BAR]
        cmp     bx, word ptr [G_RANGE_END_BAR]
        jne     L_0DB70
        cmp     ax, word ptr [G_RANGE_START_BEAT]
        ja      L_0DB70
        mov     word ptr [G_RANGE_START_BEAT], ax
        push    ax
        mov     bx, word ptr [G_RANGE_END_BEAT_TICKS]
        mul     bl
        add     ax, word ptr [G_RANGE_END_CLOCK]
        mov     word ptr [G_RANGE_START_TICK], ax
        pop     ax
L_0DB70:
        mov     bx, word ptr [G_RANGE_END_BEAT_TICKS]
        mul     bl
        add     ax, word ptr [G_RANGE_END_CLOCK]
        mov     word ptr [G_RANGE_END_TICK], ax
        ret
L_0DB7E:
        call    L_0DE07
L_0DB81:
        jne     L_0DB84
        ret
L_0DB84:
        mov     ax, ds
        mov     es, ax
        mov     ax, G_RANGE_END_CLOCK
        mov     bx, L_0DB97
        mov     cx, 63h
        sub     dx, dx
calls_set_mode_flag_0_0db93:
        call    set_mode_flag_0
        ret
L_0DB97:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bx, word ptr es:[18h]
        cmp     bx, word ptr [G_RANGE_END_BAR]
        jne     L_0DBA7
        ret
L_0DBA7:
        cmp     ax, word ptr [G_RANGE_END_BEAT_TICKS]
        jb      L_0DBB1
        mov     ax, word ptr [G_RANGE_END_BEAT_TICKS]
        dec     ax
L_0DBB1:
        mov     word ptr [G_RANGE_END_CLOCK], ax
        mov     bx, word ptr [G_RANGE_START_BAR]
        cmp     bx, word ptr [G_RANGE_END_BAR]
        jne     L_0DBE3
        mov     bx, word ptr [G_RANGE_START_BEAT]
        cmp     bx, word ptr [G_RANGE_END_BEAT]
        jne     L_0DBE3
        cmp     ax, word ptr [G_RANGE_START_CLOCK]
        ja      L_0DBE3
        mov     word ptr [G_RANGE_START_CLOCK], ax
        push    ax
        mov     ax, word ptr [G_RANGE_START_BEAT]
        mov     bx, word ptr [G_RANGE_START_BEAT_TICKS]
        mul     bl
        add     ax, word ptr [G_RANGE_START_CLOCK]
        mov     word ptr [G_RANGE_START_TICK], ax
        pop     ax
L_0DBE3:
        mov     word ptr [G_RANGE_END_CLOCK], ax
        mov     cx, ax
        mov     ax, word ptr [G_RANGE_END_BEAT_TICKS]
        mov     bx, word ptr [G_RANGE_END_BEAT]
        mul     bl
        add     ax, cx
        mov     word ptr [G_RANGE_END_TICK], ax
        ret
L_0DBF7:
        call    L_0DE1A
L_0DBFA:
        je      bc_int6a_0dc39
        mov     ax, ds
        mov     es, ax
        mov     ax, G_EDIT_TO_BAR
        mov     bx, L_0DC0F
        mov     cx, 3e7h
        sub     dx, dx
calls_set_mode_flag_1_0dc0b:
        call    set_mode_flag_1
        ret
L_0DC0F:
        mov     es, word ptr [EDIT_TO_SEQ_SEG]
        cmp     byte ptr es:[TBL_0013], 0
L_0DC19:
        jne     L_0DC1C
        ret
L_0DC1C:
        cmp     ax, word ptr es:[18h]
        jb      L_0DC27
        mov     ax, word ptr es:[18h]
L_0DC27:
        mov     word ptr [G_EDIT_TO_BAR], ax
L_0DC2A:
        call    calls_state_update_0ddc5
        sub     ax, ax
        mov     word ptr [P_7846], ax
        mov     word ptr [P_7848], ax
        mov     word ptr [G_EDIT_TO_TICK], ax
        ret
bc_int6a_0dc39:
        INT_6A NULL_HANDLER_OFS, NULL_HANDLER_OFS
L_0DC3F:
        if      FW_VERSION = 172
        db      0c7h, 06h, 50h, 0eh, 0c0h
L_0DC44:
        push    cs
        mov     word ptr [W_0DC8], NULL_HANDLER_OFS
        mov     word ptr [W_0DC4], NULL_HANDLER_OFS
        else
L_0DC44                         equ     $+5
        mov     word ptr [UI_SLOT_DIGIT], NULL_HANDLER_OFS
        mov     word ptr [W_0DC8], NULL_HANDLER_OFS
        mov     word ptr [W_0DC4], NULL_HANDLER_OFS
        endif
        ret
L_0DC52:
        call    L_0DE1A
L_0DC55:
        je      bc_int6a_0dc39
        mov     ax, ds
        mov     es, ax
        mov     ax, P_7846
        mov     bx, L_0DC6A
        mov     cx, 63h
        sub     dx, dx
calls_set_mode_flag_1_0dc66:
        call    set_mode_flag_1
        ret
L_0DC6A:
        mov     es, word ptr [EDIT_TO_SEQ_SEG]
        mov     bx, word ptr es:[18h]
        cmp     bx, word ptr [G_EDIT_TO_BAR]
        jne     L_0DC7A
        ret
L_0DC7A:
        cmp     ax, word ptr [G_RANGE_TO_BEATS]
        jb      play_button_load_b
        mov     ax, word ptr [G_RANGE_TO_BEATS]
        dec     ax
play_button_load_b:
        mov     word ptr [P_7846], ax
        mov     bx, word ptr [G_RANGE_TO_BEAT_TICKS]
        mul     bl
        add     ax, word ptr [P_7848]
        mov     word ptr [G_EDIT_TO_TICK], ax
        ret
L_0DC95:
        call    L_0DE07
L_0DC98:
        je      bc_int6a_0dc39
        mov     ax, ds
        mov     es, ax
        mov     ax, P_7848
        mov     bx, L_0DCAD
        mov     cx, 63h
replace_existing_all_b          equ     $+1
        sub     dx, dx
        call    set_mode_flag_0
        ret
L_0DCAD:
        mov     es, word ptr [EDIT_TO_SEQ_SEG]
        mov     bx, word ptr es:[18h]
        cmp     bx, word ptr [G_EDIT_TO_BAR]
        jne     L_0DCBD
        ret
L_0DCBD:
        cmp     ax, word ptr [G_RANGE_TO_BEAT_TICKS]
        jb      L_0DCC7
        mov     ax, word ptr [G_RANGE_TO_BEAT_TICKS]
        dec     ax
L_0DCC7:
        mov     word ptr [P_7848], ax
        mov     cx, ax
        mov     ax, word ptr [P_7846]
        mov     bx, word ptr [G_RANGE_TO_BEAT_TICKS]
        mul     bl
        add     ax, cx
        mov     word ptr [G_EDIT_TO_TICK], ax
        ret
L_0DCDB:
        mov     ax, ds
        mov     es, ax
        mov     ax, G_RANGE_END_BAR
        mov     bx, L_0DCEE
        mov     cx, 3e7h
        sub     dx, dx
calls_set_mode_flag_1_0dcea:
        call    set_mode_flag_1
        ret
L_0DCEE:
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[TBL_0013], 0
L_0DCF8:
        jne     L_0DCFB
        ret
L_0DCFB:
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     ax, word ptr es:[18h]
        jb      L_0DD0B
        mov     ax, word ptr es:[18h]
        dec     ax
L_0DD0B:
        mov     word ptr [G_RANGE_END_BAR], ax
        cmp     ax, word ptr [G_RANGE_START_BAR]
        ja      L_0DD0B+12
        mov     word ptr [G_RANGE_START_BAR], ax
        ret
L_0DD18:
        call    L_0DE1A
L_0DD1B:
        jne     L_0DD20
        jmp     NEAR bc_int6a_0dc39
L_0DD20:
        mov     ax, ds
        mov     es, ax
        mov     ax, G_EDIT_TO_BAR
        mov     bx, L_0DC0F
        mov     cx, 3e7h
        sub     dx, dx
calls_set_mode_flag_0_0dd2f:
        call    set_mode_flag_0
        ret
clamp_edit_range_to_seq_end:
        mov     es, word ptr [CUR_SEQ_SEG]
        sub     bx, bx
        mov     ax, word ptr es:[18h]
        cmp     ax, word ptr [G_RANGE_START_BAR]
        ja      loop_0DD47
        mov     word ptr [G_RANGE_START_BAR], bx
loop_0DD47:
        cmp     ax, word ptr [G_RANGE_END_BAR]
        ja      br_0DD50
        mov     word ptr [G_RANGE_END_BAR], ax
br_0DD50:
        call    calls_state_update_0dda7
        cmp     bx, word ptr [G_RANGE_START_BEAT]
        jae     br_0DD5F
        mov     word ptr [G_RANGE_START_BEAT], 0
br_0DD5F:
        cmp     ax, word ptr [G_RANGE_START_CLOCK]
        jae     br_0DD6B
        mov     word ptr [G_RANGE_START_CLOCK], 0
br_0DD6B:
        mov     ax, word ptr [G_RANGE_START_BEAT]
        mov     bx, word ptr [G_RANGE_START_BEAT_TICKS]
        mul     bl
play_button_load_c:
        add     ax, word ptr [G_RANGE_START_CLOCK]
        mov     word ptr [G_RANGE_START_TICK], ax
L_0DD7B:
        call    calls_state_update_0ddb6
        cmp     bx, word ptr [G_RANGE_END_BEAT]
        jae     br_0DD8A
        mov     word ptr [G_RANGE_END_BEAT], 0
br_0DD8A:
        cmp     ax, word ptr [G_RANGE_END_CLOCK]
        jae     L_0DD96
        mov     word ptr [G_RANGE_END_CLOCK], 0
L_0E672:
L_0DD96:
        if      FW_VERSION = 172
rename_file_dialog_b            equ     $+1
        endif
        mov     ax, word ptr [G_RANGE_END_BEAT]
        mov     bx, word ptr [G_RANGE_END_BEAT_TICKS]
        mul     bl
        add     ax, word ptr [G_RANGE_END_CLOCK]
        mov     word ptr [G_RANGE_END_TICK], ax
        ret
calls_state_update_0dda7:
        mov     bx, word ptr [G_RANGE_START_BAR]
calls_state_update_0ddab:
        call    state_update
        mov     word ptr [G_RANGE_START_BEATS], bx
        mov     word ptr [G_RANGE_START_BEAT_TICKS], ax
        ret
calls_state_update_0ddb6:
        mov     bx, word ptr [G_RANGE_END_BAR]
calls_state_update_0ddba:
        call    state_update
        mov     word ptr [G_RANGE_END_BEATS], bx
        mov     word ptr [G_RANGE_END_BEAT_TICKS], ax
        ret
calls_state_update_0ddc5:
        mov     bx, word ptr [G_EDIT_TO_BAR]
calls_state_update_0ddc9:
        call    state_update
        mov     word ptr [G_RANGE_TO_BEATS], bx
        mov     word ptr [G_RANGE_TO_BEAT_TICKS], ax
        ret
        if      FW_VERSION = 172
calls_state_update_0ddd4:
        call    state_update
        retf
        endif
state_update:
        mov     al, byte ptr [bx+P_D9A8]
        mov     bl, al
        and     bl, 3fh
        shr     al, 6
        mov     bh, 4
        cmp     al, 0
        je      br_0DDF8
        mov     bh, 8
        cmp     al, 1
        je      br_0DDF8
        mov     bh, 10h
        cmp     al, 2
        je      br_0DDF8
        mov     bh, 20h
br_0DDF8:
        cmp     bl, 0
        jne     L_0DDFF
        mov     bl, 4
L_0DDFF:
        mov     ax, 180h
        div     bh
        mov     bh, 0
        ret
L_0DE07:
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[TBL_0013], 0
calls_init_state_pointers_0de11:
        je      calls_init_state_pointers_0de14
        ret
calls_init_state_pointers_0de14:
        call    init_state_pointers
        sub     ax, ax
        ret
L_0DE1A:
        mov     es, word ptr [EDIT_TO_SEQ_SEG]
        cmp     byte ptr es:[TBL_0013], 0
        jmp     SHORT calls_init_state_pointers_0de11
set_mode_flag_1:
        call    value_field_bind
        mov     byte ptr [VALUE_FIELD_ONE_BASED], 1
        ret
set_mode_flag_0:
        call    value_field_bind
        mov     byte ptr [VALUE_FIELD_ONE_BASED], 0
        ret
bc_int6a_0de38:
        call    value_field_bind
        mov     byte ptr [VALUE_FIELD_ONE_BASED], 1
bc_int6a_0de40:
        INT_6A calls_check_status_flag_596c_0de92, calls_check_status_flag_596c_0dedf
L_0DE46:
        mov     word ptr [UI_SLOT_DIGIT], P_DF37
        ret
        if      FW_VERSION = 172
bc_int6a_0de4d:
        endif
        call    value_field_bind
        mov     byte ptr [VALUE_FIELD_ONE_BASED], 0
bc_int6a_0de55:
        if      FW_VERSION = 150
bc_int6a_0de4d                  equ     $+3
        endif
        INT_6A calls_check_status_flag_596c_0de92, calls_check_status_flag_596c_0dedf
L_0DE5B:
        mov     word ptr [UI_SLOT_DIGIT], P_DF37
        ret
value_field_bind:
        mov     word ptr [VALUE_FIELD_CTRL], bp
        mov     word ptr [FP_VALUE_FIELD], ax
        mov     word ptr [VALUE_FIELD_SEG], es
        mov     word ptr [VALUE_FIELD_ONCHANGE], bx
        mov     word ptr [VALUE_FIELD_MAX], cx
        mov     word ptr [VALUE_FIELD_MIN], dx
bc_int6a_0de79:
        INT_6A value_field_inc, value_field_dec
L_0DE7F:
        mov     word ptr [UI_SLOT_DIGIT], L_0DF3D
        mov     word ptr [W_0DC4], NULL_HANDLER_OFS
        mov     word ptr [W_0DC8], NULL_HANDLER_OFS
        ret
calls_check_status_flag_596c_0de92:
        call    seq_edit_allowed
L_0DE95:
        je      value_field_inc
        ret
value_field_inc:
        call    fn_0E0AC
L_0DE9B:
        je      L_0DE9E
        ret
L_0DE9E:
        call    L_0E0B6
L_0DEA1:
        je      L_0DEA4
        ret
L_0DEA4:
        les     si, [FP_VALUE_FIELD]
        cmp     word ptr [VALUE_FIELD_MAX], 100h
L_0DEAE:
        jb      br_0DEC4
        add     ax, word ptr es:[si]
        cmp     ax, word ptr [VALUE_FIELD_MAX]
        jb      calls_word_0debc
        mov     ax, word ptr [VALUE_FIELD_MAX]
calls_word_0debc:
        mov     word ptr es:[si], ax
        call    word ptr [VALUE_FIELD_ONCHANGE]
        ret
br_0DEC4:
        add     al, byte ptr es:[si]
        jae     br_0DECC
        mov     al, byte ptr [VALUE_FIELD_MAX]
br_0DECC:
        cmp     al, byte ptr [VALUE_FIELD_MAX]
        jb      calls_word_0ded5
        mov     al, byte ptr [VALUE_FIELD_MAX]
calls_word_0ded5:
        mov     byte ptr es:[si], al
        mov     ah, 0
        call    word ptr [VALUE_FIELD_ONCHANGE]
        ret
calls_check_status_flag_596c_0dedf:
        call    seq_edit_allowed
L_0DEE2:
        je      value_field_dec
        ret
value_field_dec:
        call    fn_0E0AC
L_0DEE8:
        je      L_0DEEB
        ret
L_0DEEB:
        call    L_0E0B6
L_0DEEE:
        je      L_0DEF1
        ret
L_0DEF1:
        les     si, [FP_VALUE_FIELD]
        cmp     word ptr [VALUE_FIELD_MAX], 100h
L_0DEFB:
        jb      L_0DF19
        mov     bx, ax
        mov     ax, word ptr es:[si]
        sub     ax, bx
L_0DF04:
        jae     br_0DF08
        sub     ax, ax
br_0DF08:
        cmp     ax, word ptr [VALUE_FIELD_MIN]
        jae     calls_word_0df11
        mov     ax, word ptr [VALUE_FIELD_MIN]
calls_word_0df11:
        mov     word ptr es:[si], ax
        call    word ptr [VALUE_FIELD_ONCHANGE]
        ret
L_0DF19:
        mov     bl, al
        mov     al, byte ptr es:[si]
        sub     al, bl
L_0DF20:
        jae     br_0DF24
        sub     al, al
br_0DF24:
        cmp     al, byte ptr [VALUE_FIELD_MIN]
        jae     calls_word_0df2d
        mov     al, byte ptr [VALUE_FIELD_MIN]
calls_word_0df2d:
        mov     byte ptr es:[si], al
        mov     ah, 0
        call    word ptr [VALUE_FIELD_ONCHANGE]
        ret
calls_check_status_flag_596c_0df37:
        call    seq_edit_allowed
L_0DF3A:
        je      L_0DF3D
        ret
L_0DF3D:
        call    fn_0E0AC
programs_samples_replace:
        je      L_0DF43
        ret
L_0DF43:
        call    L_0E0B6
L_0DF46:
        je      bc_int6a_0df49
        ret
bc_int6a_0df49:
        call    fn_0E0A2
        mov     word ptr [W_0DC8], P_E00A
        mov     word ptr [UI_SLOT_DIGIT], P_E04A
bc_int6a_0df58:
        INT_6A L_0E00A, L_0E00A
L_0DF5E:
        mov     word ptr [W_0DC4], P_DF9E
        mov     cx, word ptr [LCD_HILITE_POS]
        push    cx
        add     ch, 8
        add     cl, 6
        mov     dl, 7
        mov     dh, 1
seq_op_load:
        BC_SEQ_OP
L_0DF76:
        pop     ax
        inc     ah
        inc     al
        mov     byte ptr [LCD_PEN_X], al
        mov     byte ptr [LCD_PEN_Y], ah
        mov     ax, word ptr [UI_SLOT_REFRESH]
        mov     word ptr [W_7858], ax
ui_ctrl_0df88:
        INT_6C L_0DFED, L_0DFF2, delete_sound_in_use_warning+1, L_0DFFC
ui_ctrl_0df92:
        INT_5D L_0E02A
ui_ctrl_0df96:
        BC_UI_CTRL 0, 0, 0, 0
L_0DF9D:
        ret
L_0DF9E:
        cmp     byte ptr [VALUE_FIELD_ONE_BASED], 0
        je      L_0DFB0
        cmp     word ptr [VALUE_FIELD_TYPED], 0
        je      L_0DFB0
        dec     word ptr [VALUE_FIELD_TYPED]
L_0DFB0:
        mov     ax, word ptr [VALUE_FIELD_TYPED]
        cmp     ax, word ptr [VALUE_FIELD_MAX]
        jb      L_0DFBC
        mov     ax, word ptr [VALUE_FIELD_MAX]
L_0DFBC:
        cmp     ax, word ptr [VALUE_FIELD_MIN]
delete_from_sound_dialog        equ     $+1
        jae     L_0DFC5
        mov     ax, word ptr [VALUE_FIELD_MIN]
L_0DFC5:
        les     si, [FP_VALUE_FIELD]
calls_word_0dfce                equ     $+5
        cmp     word ptr [VALUE_FIELD_MAX], 100h
        jb      calls_word_0dfdf
        mov     word ptr es:[si], ax
        call    word ptr [VALUE_FIELD_ONCHANGE]
        if      FW_VERSION = 172
        call    init_state_pointers
        else
        db      0e8h
        db      4fh, 31h
        endif
        call    L_0E00A
        ret
calls_word_0dfdf:
        mov     byte ptr es:[si], al
        call    word ptr [VALUE_FIELD_ONCHANGE]
        call    init_state_pointers
L_0DFE9:
        call    L_0E00A
        ret
L_0DFED:
        mov     bx, D_0DD4
        jmp     SHORT calls_init_state_pointers_0dfff
L_0DFF2:
        mov     bx, D_0DD8
        db      0ebh
delete_sound_in_use_warning:
        or      byte ptr [bp+di+0ddch], bh
        jmp     SHORT calls_init_state_pointers_0dfff
L_0DFFC:
        mov     bx, D_0DE0
calls_init_state_pointers_0dfff:
        push    bx
calls_init_state_pointers_0e000:
        call    L_0E00A
        call    init_state_pointers
        pop     bx
        jmp     setup_handler
L_0E00A:
        mov     ax, word ptr [W_7858]
        mov     word ptr [UI_SLOT_REFRESH], ax
        mov     cl, byte ptr [LCD_PEN_X]
        mov     ch, byte ptr [LCD_PEN_Y]
        add     cl, 5
        add     ch, 7
        mov     dl, 7
        mov     dh, 1
L_0E022:
        BC_B2
        db      0ffh, 16h
        if      FW_VERSION = 172
L_0E027:
        push    si
        else
        db      3ch
        endif
L_0E028:
        js      L_0DFED
L_0E02A:
        mov     ax, word ptr [VALUE_FIELD_TYPED]
        cmp     word ptr [VALUE_FIELD_MAX], 64h
L_0E032:
        jae     L_0E038
L_0E034:
        BC_OP_7C
L_0E037:
        ret
L_0E038:
        cmp     word ptr [VALUE_FIELD_MAX], 3e8h
        jae     L_0E044
L_0E040:
        BC_RETURN
        db      0c3h
L_0E044:
        sub     dx, dx
L_0E046:
        BC_PART_DISP
        db      0c3h
L_0E04A:
        cmp     word ptr [W_1078], 0
L_0E04F:
        je      fn_0E0A2
        cmp     word ptr [VALUE_FIELD_TYPED], 0
L_0E056:
        je      fn_0E0A2
        mov     cx, ax
        mov     ax, word ptr [VALUE_FIELD_TYPED]
L_0E05D:
        sub     ax, 3e8h
        jae     L_0E05D
        add     ax, 3e8h
        mov     bx, 0ah
        mul     bx
        mov     bx, 2710h
        or      dx, dx
        jne     L_0E093
        add     ax, cx
        mov     cx, word ptr [VALUE_FIELD_MAX]
        cmp     ax, cx
        if      FW_VERSION = 172
L_0E079:
        endif
        jbe     fn_0E0A2
        mov     bx, 2710h
        cmp     cx, bx
        if      FW_VERSION = 150
L_0E079:
        endif
L_0E080:
        jae     L_0E093
        mov     bx, 3e8h
        cmp     cx, bx
L_0E087:
        jae     L_0E093
        mov     bx, 64h
        cmp     cx, bx
L_0E087_V150:
L_0E08E:
        jae     L_0E093
        mov     bx, 0ah
L_0E093:
        add     bx, bx
        mov     cx, bx
        shl     cx, 2
        add     bx, cx
L_0E09C:
        sub     ax, bx
L_0E09E:
        jae     L_0E09C
        add     ax, bx
fn_0E0A2:
        mov     word ptr [VALUE_FIELD_TYPED], ax
        mov     word ptr [W_1078], 3e8h
        ret
fn_0E0AC:
        push    ax
        mov     al, byte ptr [G_REC_KEY_HELD]
        or      al, byte ptr [G_ODUB_KEY_HELD]
        pop     ax
        ret
L_0E0B6:
        cmp     byte ptr [G_STEP_EDIT_ACTIVE], 0
L_0E0BB:
        jne     br_0E0BE
        ret
br_0E0BE:
        cmp     byte ptr [B_597B], 0
        ret
jmp_ferr_disk_read_error:
        jmpf    CS1_SEG:ferr_disk_read_error
jmp_ferr_no_system_file:
        jmpf    CS1_SEG:ferr_no_system_file
jmp_ferr_unreadable_format:
        jmpf    CS1_SEG:ferr_unreadable_format
jmp_ferr_insufficient_memory:
        jmpf    CS1_SEG:ferr_insufficient_memory
jmp_ferr_wrong_file:
        jmpf    CS1_SEG:ferr_wrong_file
jmp_ferr_file_not_found:
        jmpf    CS1_SEG:ferr_file_not_found
jmp_ferr_scsi_conflict_id6:
        jmpf    CS1_SEG:ferr_scsi_conflict_id6
jmp_ferr_relocation_error:
        jmpf    CS1_SEG:ferr_relocation_error
loading_screen_display:
LOADING_SCREEN_DISPLAY_V150:
        BC_PRINT "          Loading....."
print_loading_0e106:
        ret
load_screen_enter:
        mov     bl, 0fh
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0E10D:
        int     2ch
L_0E10F:
        mov     bl, 1
        int     4eh
        nop
        push    cs
calls_buffer_init_10_0e115:
        call    buffer_init_10A2
        callf   CS1_SEG:seq_edit_end_far
        db      9ah
        dw      undo_seq_discard_far
        dw      CS1_SEG
L_0E122:
        call    load_page_draw
L_0E125:
        BC_FLUSH
calls_memory_copy_0e128:
        call    memory_copy
L_0E12B:
        call    load_page_draw
        ret
load_page_draw:
        BC_SEQ_INIT
load_status_0E132:
        int     52h
        mov     byte ptr [B_0B1C], 1
        callf   CS1_SEG:disk_load_view_draw
        call    load_view_type_draw
        call    load_free_seq_kb_draw
load_status:
        call    load_free_snd_kb_draw
load_label_display:
        if      FW_VERSION = 150
L_0EA39                         equ     $+26
        endif
        BC_STATUS 125, 21, "LOAD"
status_load_0e151:
        if      FW_VERSION = 172
L_0E154                         equ     $+3
        endif
        BC_WAIT 129, 30, BMP_ARROW_RIGHT
L_0E158:
        if      FW_VERSION = 172
L_0E15B                         equ     $+3
        endif
        BC_WAIT 156, 22, BMP_MPC
L_0E15F:
        BC_WAIT_LOAD
        db      "LOAD", 000h, "SAVE", 000h, "FORMAT"
        add     byte ptr [si+45h], al
        dec     sp
        inc     bp
L_0EA4F:
        push    sp
        inc     bp
        add     byte ptr [bx+si], ah
        add     byte ptr [si+4fh], al
        and     byte ptr [bx+di+54h], cl
        db      00h
ui_ctrl_0e182:
        BC_BUFFER 0, 2, 2, 2, 0, 1
ui_ctrl_0e18b:
        BC_UI_CTRL 28, 8, 122, 9
bc_int6a_0e192:
        mov     byte ptr [G_FILE_LIST_ROW], 0
L_0EA6F_V150:
bc_int6c_0e197:
        int     50h
bc_int6c_0e199:
        if      FW_VERSION = 150
L_0EA76                         equ     $+5
        endif
        INT_6A load_file_inc, load_file_dec
bc_int6c_0e19f:
        INT_6C NULL_HANDLER_OFS, load_view_right, load_view_field, bc_int6c_0e6f7
bc_int5d_0e1a9:
        INT_5D load_page_refresh
bc_int5b_0e1ad:
        INT_5B file_list_open
L_0EA89:
bc_int6b_0e1b1:
        call    load_page_softkeys
        ret
L_0EA8D:
load_page_softkeys:
        INT_6B load_screen_enter, calls_mode_handler_03332, close_handler_044C6, delete_screen_enter, NULL_HANDLER_OFS, load_do_it
        if      FW_VERSION = 172
        db      0e8h, 56h, 37h, 0c3h
        else
        call    dispatch_int6d_6e
        ret
L_0EA9F:
        endif
load_page_refresh:
        BC_PLANE_A
L_0E1CA:
        call    disk_media_check
        call    L_0E2ED
        call    load_device_field_draw
        call    load_file_name_size_draw
L_0E1D6:
        call    load_view_type_draw
        call    load_free_seq_kb_draw
L_0E1DC:
        call    load_free_snd_kb_draw
L_0E1DF:
        ret
load_view_type_draw:
        call    L_0E8D1
L_0E1E3:
        jb      status_display_E1EF
L_0E1E5:
        if      FW_VERSION = 172
L_0E1EB                         equ     $+6
        endif
        BC_STATUS_A 30, 1, G_FILE_TYPE, TBL_FILE_TYPE_LABELS
        db      0c3h
status_display_E1EF:
status_display_0EAC7:
        BC_STATUS 30, 1, "           "
L_0E200:
        ret
load_file_name_size_draw:
        BC_CLEAR_RECT 30, 9, 120, 7
L_0E208:
        if      FW_VERSION = 172
L_0E20D                         equ     $+5
L_0E20E                         equ     $+6
        endif
        BC_TIME 30, 9, BUF_NAME_ENTRY
        mov     ax, word ptr [D_7920]
        mov     dx, word ptr [D_7920+2]
        mov     di, 400h
        sub     si, si
        callf   CS1_SEG:state_check_104FB
L_0E220:
        BC_OP_3A 206, 9
L_0E225:
        ret
load_device_field_draw:
        BC_CLEAR_RECT 96, 20, 22, 23
L_0E22D:
        if      FW_VERSION = 172
L_0E233                         equ     $+6
        endif
        BC_STATUS_A 42, 21, G_DISK_DEVICE, TBL_DISK_DEVICE_LABELS
        db      0a0h
        if      FW_VERSION = 172
        test    al, 78h
        cmp     al, 9
        jne     L_0E23F
        else
        db      8eh
        js      L_0EB4E
        or      word ptr [di+2], si
        endif
        jmp     SHORT L_0E2AA
L_0E23F:
        cmp     al, 0
L_0E241:
        je      L_0E245
        jmp     SHORT L_0E267
L_0E245:
        if      FW_VERSION = 172
        BC_16_LEVELS_6 96, 22, FROM_DEL_SEL, TBL_16_LEVELS_BMP_A
L_0E24E:
L_0E256                         equ     $+8
        else
L_0EB1F                         equ     $+2
        BC_16_LEVELS_6 96, 22, FROM_DEL_SEL, TBL_16_LEVELS_BMP_A
        endif
        BC_STATUS_A 42, 39, FROM_DEL_SEL, TBL_DISK_FORMAT_NAMES
status_display_E257:
        BC_STATUS 0, 30, "         "
L_0E266:
        ret
        if      FW_VERSION = 150
L_0E24E:
L_0EB4E                         equ     $+15
L_0EB5A                         equ     $+27
        endif
L_0E267:
        BC_16_LEVELS_6 96, 22, FROM_DEL_SEL-1, TBL_16_LEVELS_BMP_B
L_0E270:
        if      FW_VERSION = 172
L_0E278                         equ     $+8
        endif
        BC_STATUS_A 42, 39, D_78AD, TBL_DISK_FORMAT_NAMES
status_display_E279:
        BC_STATUS 0, 30, "         "
part_1_status_0E288:
        cmp     byte ptr [G_DISK_PART_COUNT], 0
part_1_status:
        jne     part_field_display
        ret
part_field_display:
PART_FIELD_DISPLAY_V150:
        BC_STATUS 0, 30, "  Part:"
status_part_0e29d:
        mov     al, byte ptr [G_DISK_PARTITION]
        add     al, 41h
        mov     cl, 2ah
        mov     ch, 1eh
L_0E2A6:
        BC_PUTCHAR
        db      0c3h
L_0E2AA:
        if      FW_VERSION = 172
L_0E2AD                         equ     $+3
        else
L_0EB86                         equ     $+4
        endif
        BC_WAIT 96, 22, BMP_FLASH_ROM
L_0E2B1:
        if      FW_VERSION = 172
L_0E2B7                         equ     $+6
L_0E2B9                         equ     $+8
        endif
        BC_STATUS_A 42, 39, P_78AE, TBL_DISK_FORMAT_NAMES
status_display_E2BA:
        BC_STATUS 0, 30, "         "
L_0E2C9:
        ret
load_free_snd_kb_draw:
        sub     ax, ax
        sub     dx, dx
        int     39h
        mov     cx, 0ah
L_0E2D3:
        shr     dx, 1
L_0EBAD:
        rcr     ax, 1
        loop    L_0E2D3
L_0E2D9:
        BC_OP_3A 206, 30
L_0E2DE:
        ret
load_free_seq_kb_draw:
        callf   CS1_SEG:arena_free_paras_far
        shr     ax, 6
L_0E2E7:
        BC_FIELD 224, 39
L_0E2EC:
        ret
L_0E2ED:
        BC_CLEAR_RECT 104, 1, 144, 7
L_0E2F4:
        cmp     byte ptr [G_DISK_FORMAT], 15h
L_0E2F9:
        je      vol_display
        cmp     byte ptr [G_DISK_FORMAT], 16h
L_0E300:
        je      vol_display
        cmp     byte ptr [G_DISK_FORMAT], 1ah
vol_status:
        je      vol_display
        ret
vol_display:
VOL_DISPLAY_V150:
        BC_STATUS 152, 1, "Vol:            "
status_vol_0e320:
        if      FW_VERSION = 172
L_0E326                         equ     $+6
        endif
        BC_TIME 176, 1, P_78F3
        db      0c3h
load_file_inc:
        call    disk_media_check
L_0E32B:
        call    file_list_next
        ret
load_file_dec:
        call    disk_media_check
calls_check_flag_78af_0e332:
        call    file_list_prev
        ret
fn_0E336:
        mov     ax, word ptr [G_FILE_SIZE_LO]
        or      ax, word ptr [G_FILE_SIZE_HI]
        ret
file_list_first:
        mov     byte ptr [G_FILE_LIST_ROW], 0
L_0E343:
        call    name_entry_buf_clear
        sub     ax, ax
        mov     word ptr [G_FILE_SIZE_LO], ax
        mov     word ptr [G_FILE_SIZE_HI], ax
        cmp     byte ptr [G_DIR_HAS_FILES], 0
L_0E353:
        jne     L_0E356
        ret
L_0E356:
        mov     bl, 2
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0E35C:
        int     2ch
L_0E35E:
        jae     L_0E361
        ret
L_0E361:
        jmp     SHORT L_0E376
file_list_next:
        cmp     byte ptr [G_DIR_HAS_FILES], 0
        stc
L_0E369:
        jne     L_0E36C
        ret
L_0E36C:
        mov     bl, 3
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0E372:
        int     2ch
L_0E374:
        jb      L_0E3A4
L_0E376:
        call    file_type_filter_match
        if      FW_VERSION = 172
L_0E379:
        endif
        jne     file_list_next
        if      FW_VERSION = 150
L_0E379:
        endif
        mov     word ptr [G_FILE_SIZE_LO], bx
        mov     word ptr [G_FILE_SIZE_HI], dx
        shr     bx, 4
        shl     dl, 4
        or      bh, dl
        inc     bx
        mov     word ptr [G_FILE_SIZE_PARAS], bx
        mov     ax, ds
        mov     bx, es
L_0E394:
        mov     ds, bx
        mov     es, ax
        mov     di, BUF_NAME_ENTRY
        mov     cx, 14h
        rep movsb
        mov     ds, ax
        clc
        ret
L_0E3A4:
        call    file_type_filter_match
        je      br_0E3B3
        mov     bl, 16h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0E3AF:
        int     2ch
L_0E3B1:
        jae     L_0E3A4
br_0E3B3:
        stc
        ret
name_entry_buf_clear:
        mov     ax, ds
        mov     es, ax
        mov     di, BUF_NAME_ENTRY
        mov     al, 20h
        mov     cx, 14h
        rep stosb
        ret
file_list_prev:
        cmp     byte ptr [G_DIR_HAS_FILES], 0
L_0E3C9:
        jne     L_0E3CC
        ret
L_0E3CC:
        mov     bl, 16h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0E3D2:
        int     2ch
L_0E3D4:
        jb      calls_clear_flag_78c1_0e3dd
        if      FW_VERSION = 172
L_0E3D6:
        endif
        call    file_type_filter_match
calls_clear_flag_78c1_0e3d9:
        jne     file_list_prev
        if      FW_VERSION = 172
        jmp     SHORT L_0E379+2
        else
        jmp     SHORT L_0E379
L_0E3D6:
        endif
calls_clear_flag_78c1_0e3dd:
        call    file_list_first
calls_init_state_78c1_0e3e0:
        jb      calls_init_state_78c1_0e3e3
        ret
calls_init_state_78c1_0e3e3:
        call    file_list_next
        ret
file_type_filter_match:
        cmp     byte ptr [G_FILE_TYPE], 0
L_0E3EC:
        jne     br_0E3EF
        ret
br_0E3EF:
        pusha
        mov     al, byte ptr [G_FILE_TYPE]
        mov     ah, 3
        mul     ah
        mov     di, si
        add     ax, TBL_FILE_EXTENSIONS
        mov     si, ax
        add     di, 11h
        mov     cx, 3
        repe cmpsb
        popa
        ret
file_list_open:
        cmp     byte ptr [G_DIR_HAS_FILES], 0
L_0E40D:
        jne     file_list_dialog
        ret
file_list_dialog:
        if      FW_VERSION = 150
FILE_LIST_DIALOG_V150:
L_0ECEC                         equ     $+4
L_0ECF6                         equ     $+14
L_0ED03                         equ     $+27
        endif
        BC_FILE_DIALOG 29, 2, 190, 58, "FILE LIST"
softkey_close_E421:
        BC_SOFTKEY 5, BC_SK_FILL,  "CLOSE"
softkey_close_0e42c:
        int     50h
bc_int6c_0e42e:
        if      FW_VERSION = 172
        INT_6A file_list_scroll_down, jmp_check_flag_78af_0e513
        else
L_0ED09                         equ     $+3
        INT_6A file_list_scroll_down, jmp_check_flag_78af_0e513
        endif
bc_int6c_0e434:
        if      FW_VERSION = 172
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, jmp_check_flag_78af_0e513, file_list_scroll_down
        else
        db      0cdh
        insb
        db      0dah
        push    cs
        db      0dah
        push    cs
        db      0ebh, 0e1h, 0dch, 0e1h
        endif
bc_int5d_0e43e:
        INT_68 file_list_close
bc_int5d_0e442:
        INT_5B file_list_close
bc_int5d_0e446:
        INT_5D file_list_draw_rows
L_0E44A:
        cmp     byte ptr [G_DISK_DEVICE], 0
L_0E44F:
        je      br_0E467
        cmp     byte ptr [G_DISK_DEVICE], 9
L_0E456:
        je      br_0E467
        cmp     byte ptr [G_SCSI_DEV_TYPE], 0
L_0E45D:
        je      br_0E467
        cmp     byte ptr [G_SCSI_DEV_TYPE], 7
L_0E464:
        je      br_0E467
        ret
br_0E467:
        mov     si, BUF_NAME_ENTRY
        mov     al, 0
        mov     cx, 14h
L_0E46F:
        or      al, byte ptr [si]
        inc     si
        loop    L_0E46F
        cmp     al, 21h
L_0E476:
        jae     L_0E479
        ret
L_0E479:
        cmp     byte ptr [G_DISK_DEVICE], 9
L_0E47E:
        jne     L_0E481
        ret
L_0E481:
        cmp     byte ptr [G_DIR_HAS_FILES], 1
L_0E486:
        je      softkey_rename
        ret
softkey_rename:
        if      FW_VERSION = 150
SOFTKEY_RENAME_V150:
L_0ED6C                         equ     $+11
        endif
        BC_SOFTKEY 2, BC_SK_BOX,   "RENAME"
softkey_rename_0e495:
        INT_65 L_0E535
L_0E499:
        ret
file_list_draw_rows:
        call    disk_media_check
        if      FW_VERSION = 150
L_0ED78                         equ     $+3
        endif
L_0E49D:
        BC_CLEAR_RECT 64, 11, 120, 40
L_0E4A4:
        if      FW_VERSION = 172
L_0E4A9                         equ     $+5
L_0E4AA                         equ     $+6
        endif
        BC_TIME 64, 11, BUF_NAME_ENTRY
        db      0e8h
        mov     ch, 0feh
        jb      L_0E4EF
L_0E4B0:
        if      FW_VERSION = 172
L_0E4B5                         equ     $+5
L_0E4B6                         equ     $+6
        endif
        BC_TIME 64, 19, BUF_NAME_ENTRY
        db      0e8h
L_0ED90:
        test    ax, 72feh
        db      30h
L_0E4BC:
        if      FW_VERSION = 172
L_0E4C1                         equ     $+5
        endif
        BC_TIME 64, 27, BUF_NAME_ENTRY
        db      0e8h
L_0ED9C:
        popf
        db      0feh
        jb      calls_check_flag_78af_0e4e9
L_0E4C8:
        if      FW_VERSION = 172
L_0E4CD                         equ     $+5
        endif
        BC_TIME 64, 35, BUF_NAME_ENTRY
        db      0e8h
        xchg    cx, ax
        db      0feh
        jb      calls_check_flag_78af_0e4e6
L_0E4D4:
        if      FW_VERSION = 172
L_0E4D9                         equ     $+5
        endif
        BC_TIME 64, 43, BUF_NAME_ENTRY
        db      0e8h
        test    si, di
        jb      calls_check_flag_78af_0e4e3
calls_check_flag_78af_0e4e0:
        call    file_list_prev
calls_check_flag_78af_0e4e3:
        call    file_list_prev
calls_check_flag_78af_0e4e6:
        call    file_list_prev
calls_check_flag_78af_0e4e9:
        call    file_list_prev
calls_check_flag_78af_0e4ec:
        call    file_list_prev
L_0EDC7:
L_0E4EF:
        mov     al, byte ptr [G_FILE_LIST_ROW]
        mov     ah, 8
        mul     ah
        if      FW_VERSION = 172
mpc3000_all_dialog              equ     $+1
        endif
        add     al, 0ah
        mov     ch, al
        mov     cl, 3dh
        if      FW_VERSION = 172
mpc60_all_dialog                equ     $+1
        endif
        mov     dl, 7dh
        mov     dh, 9
jmp_init_state_78c1_0e500:
        BC_UI_84
        ret
        if      FW_VERSION = 172
file_list_scroll_down:
jmp_init_state_78c1_0e507       equ     $+3
        else
file_list_scroll_down:
        endif
        cmp     byte ptr [G_FILE_LIST_ROW], 4
        jne     L_0E50E
        jmp     NEAR file_list_next
L_0E50E:
        inc     byte ptr [G_FILE_LIST_ROW]
        ret
jmp_check_flag_78af_0e513:
        cmp     byte ptr [G_FILE_LIST_ROW], 0
        jne     br_0E51D
        jmp     NEAR file_list_prev
br_0E51D:
        dec     byte ptr [G_FILE_LIST_ROW]
        ret
file_list_close:
        cmp     byte ptr [G_FILE_LIST_ROW], 0
        jne     calls_init_state_78c1_0e52c
        jmp     NEAR load_page_draw
calls_init_state_78c1_0e52c:
        dec     byte ptr [G_FILE_LIST_ROW]
calls_init_state_78c1_0e530:
        call    file_list_next
        jmp     SHORT file_list_close
L_0E535:
        mov     bl, 11h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0E53B:
        int     2ch
L_0E53D:
        jae     L_0E542
        jmp     NEAR load_screen_enter
L_0E542:
        cmp     bl, 0
L_0E545:
        je      L_0E54A
        jmp     jmp_ferr_write_protect
L_0E54A:
        cmp     byte ptr [G_FILE_LIST_ROW], 0
new_name_1_status_0E54F:
        je      new_name_1_status
        dec     byte ptr [G_FILE_LIST_ROW]
rename_file_dialog_0E555:
        call    file_list_next
        jmp     SHORT L_0E535
new_name_1_status:
        mov     ax, ds
        mov     es, ax
        mov     si, BUF_NAME_ENTRY
        mov     di, BUF_RENAME_NAME
        mov     cx, 14h
        rep movsb
        if      FW_VERSION = 150
L_0EE5F                         equ     $+30
        endif
rename_file_dialog:
        BC_FILE_DIALOG 29, 2, 190, 58, "Rename file"
new_name_prompt_alt:
        BC_STATUS 36, 24, "New name:"
status_new_name_0e58b:
        mov     si, D_1679
        mov     dx, ds
L_0E590:
        BC_STATUS_B 54, 40, 24
softkey_cancel_E596:
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
softkey_do_it_E5A2:
        BC_SOFTKEY 5, BC_SK_BOX,   "DO IT"
softkey_do_it_0e5ad:
        int     50h
bc_int5b_0e5af:
        int     50h
bc_int5b_0e5b1:
        INT_5B calls_check_flag_78af_0e5cf
bc_int67_68_0e5b5:
        INT_65 calls_check_flag_78af_0e5cf
bc_int67_68_0e5b9:
        INT_67 calls_check_flag_78af_0e5cf
bc_int67_68_0e5bd:
        INT_68 rename_file_do_it
L_0E5C1:
        mov     ax, ds
        mov     es, ax
        mov     cl, 5ah
        mov     ch, 18h
        mov     si, BUF_RENAME_NAME
        int     42h
        ret
calls_check_flag_78af_0e5cf:
        call    load_page_draw
calls_check_flag_78af_0e5d2:
        call    file_list_prev
calls_clear_flag_78c1_0e5d5:
        jae     calls_init_state_78c1_0e5dc
calls_clear_flag_78c1_0e5d7:
        call    file_list_first
        jmp     SHORT L_0E5DF
calls_init_state_78c1_0e5dc:
        call    file_list_next
L_0E5DF:
        call    file_list_open
L_0E5E2:
        call    file_list_draw_rows
        ret
rename_file_do_it:
        mov     bl, 11h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0E5EC:
        int     2ch
L_0E5EE:
        jae     L_0E5F3
        jmp     NEAR load_screen_enter
L_0E5F3:
        mov     ax, ds
        mov     es, ax
        mov     si, BUF_RENAME_NAME
        mov     bl, 0eh
        mov     bh, byte ptr [G_DISK_DEVICE]
jmp_print_file_name_exists_0e600:
        int     2ch
jmp_print_file_name_exists_0e602:
        jb      L_0E606
        jmp     SHORT print_file_name_exists
L_0E606:
        mov     ax, ds
        mov     es, ax
        mov     si, BUF_NAME_ENTRY
        mov     bl, 4
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0E613:
        int     2ch
L_0E615:
        db      73h
L_0E616:
        add     bp, cx
        ret
L_0E619:
        cli
L_0E61A:
        mov     ax, ds
        mov     es, ax
        mov     si, BUF_RENAME_NAME
        mov     bl, 0bh
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0E627:
        int     2ch
file_name_exists_msg:
        jmp     SHORT calls_check_flag_78af_0e5cf
print_file_name_exists:
        if      FW_VERSION = 150
PRINT_FILE_NAME_EXISTS_V150:
L_0EF16                         equ     $+19
L_0EF1B                         equ     $+24
        endif
        BC_PRINT "    File name exists !!"
print_file_name_exists_0e646:
        mov     cx, 3e8h
        call    delay_ticks
jmp_rename_file_dialog_0e64c:
        BC_SEQ_INIT
jmp_rename_file_dialog_0e64f:
        jmp     NEAR rename_file_dialog
load_view_field:
        call    L_0E8D1
calls_setup_callback_vectors_0e655:
        jb      L_0E67B
        mov     al, 8
        mov     si, G_FILE_TYPE
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
bc_int6c_0e662:
        INT_6C NULL_HANDLER_OFS, load_view_right, NULL_HANDLER_OFS, load_page_draw
ui_ctrl_0e66c:
        INT_5D load_view_refresh
ui_ctrl_0e670:
        INT_5B file_list_open
L_0E674:
        BC_UI_CTRL 28, 0, 56, 9
L_0E67B:
        ret
load_view_refresh:
        call    disk_media_check
calls_clear_flag_78c1_0e67f:
        call    L_0E2ED
calls_clear_flag_78c1_0e682:
        call    file_list_first
L_0E685:
        call    load_view_type_draw
L_0E688:
        call    load_file_name_size_draw
        ret
load_view_right:
        cmp     byte ptr [G_DISK_FORMAT], 15h
L_0E691:
        je      bc_int6c_0e6a2
        cmp     byte ptr [G_DISK_FORMAT], 16h
L_0E698:
        je      bc_int6c_0e6a2
L_0E364:
        cmp     byte ptr [G_DISK_FORMAT], 1ah
bc_int6a_0e69f:
        je      bc_int6c_0e6a2
        ret
L_0EF7A:
bc_int6c_0e6a2:
        INT_6A load_view_arg_inc, load_view_arg_dec
bc_int6c_0e6a8:
        INT_6C load_page_draw, NULL_HANDLER_OFS, NULL_HANDLER_OFS, load_page_draw
ui_ctrl_0e6b2:
        INT_5D load_view_arg_refresh
ui_ctrl_0e6b6:
        INT_5B file_list_open
ui_ctrl_0e6ba:
        BC_UI_CTRL 175, 0, 73, 9
L_0E6C1:
        ret
load_view_arg_inc:
        mov     al, byte ptr [B_78B2]
        cmp     al, 62h
        jne     L_0E6CA
        ret
L_0E6CA:
        inc     al
        call    L_0E8F0
        jae     L_0E6D2
        ret
L_0E6D2:
        inc     byte ptr [B_78B2]
        ret
load_view_arg_dec:
        cmp     byte ptr [B_78B2], 0
        jne     L_0E6DF
        ret
L_0E6DF:
        dec     byte ptr [B_78B2]
L_0E6E3:
        call    L_0E8ED
        ret
load_view_arg_refresh:
        call    disk_media_check
calls_clear_flag_78c1_0e6ea:
        call    L_0E2ED
calls_clear_flag_78c1_0e6ed:
        call    file_list_first
L_0E6F0:
        call    load_view_type_draw
L_0E6F3:
        call    load_file_name_size_draw
        ret
        if      FW_VERSION = 150
L_0EFCF:
        endif
bc_int6c_0e6f7:
        int     50h
bc_int6c_0e6f9:
        INT_6A load_device_inc, load_device_dec
ui_ctrl_0e6ff:
        INT_6C NULL_HANDLER_OFS, load_view_right, load_page_draw, load_device_down
ui_ctrl_0e709:
        INT_5D load_device_refresh
L_0EFE5:
ui_ctrl_0e70d:
        BC_UI_CTRL 40, 20, 39, 9
bc_int5b_0e714:
        if      FW_VERSION = 150
L_0EFED                         equ     $+1
        endif
        INT_5B load_device_window
L_0E718:
        call    load_page_softkeys
        ret
load_device_inc:
        mov     al, byte ptr [G_DISK_DEVICE]
        inc     al
        cmp     al, 7
        jne     br_0E727
        inc     al
br_0E727:
        cmp     al, 0ah
        jb      calls_wait_loop_0e72d
        mov     al, 0
calls_wait_loop_0e72d:
        mov     byte ptr [G_DISK_DEVICE], al
        mov     byte ptr [G_DISK_PARTITION], 0
        if      FW_VERSION = 150
L_0F00D:
        endif
        call    wait_loop
calls_memory_copy_0e738:
        call    memory_copy
L_0E73B:
        BC_SEQ_INIT
L_0E73E:
        ret
load_device_dec:
        mov     al, byte ptr [G_DISK_DEVICE]
        sub     al, 1
        jae     br_0E748
        mov     al, 9
br_0E748:
        cmp     al, 7
        jne     L_0E74E
        dec     al
L_0E74E:
        jmp     SHORT calls_wait_loop_0e72d
load_device_refresh:
        BC_CLEAR_RECT 96, 20, 22, 23
L_0E757:
        BC_STATUS_A 42, 21, G_DISK_DEVICE, TBL_DISK_DEVICE_LABELS
L_0E760:
        BC_FLUSH
L_0E763:
        call    L_0E2ED
L_0E766:
        call    load_device_field_draw
L_0E769:
        call    load_file_name_size_draw
L_0E76C:
        call    load_view_type_draw
        ret
disk_media_check:
        mov     bl, 11h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0E776:
        int     2ch
L_0E778:
        jb      memory_copy
        mov     ah, byte ptr [G_DISK_DEVICE]
        cmp     ah, byte ptr [G_DIR_CACHED_DEVICE]
L_0E782:
        jne     memory_copy
        ret
memory_copy:
        mov     byte ptr [G_DISK_FORMAT], 10h
        mov     byte ptr [B_78B2], 0
        mov     byte ptr [G_DIR_HAS_FILES], 0
        sub     ax, ax
        mov     byte ptr [FROM_DEL_SEL], al
        mov     byte ptr [G_DISK_PART_COUNT], al
        mov     byte ptr [G_SCSI_DEV_TYPE], 9
        mov     word ptr [G_FILE_SIZE_LO], ax
        mov     word ptr [G_FILE_SIZE_HI], ax
        mov     byte ptr [G_DISK_FORMAT], 10h
L_0E7AC:
        call    name_entry_buf_clear
        mov     dl, byte ptr [G_DISK_DEVICE]
        mov     byte ptr [G_DIR_CACHED_DEVICE], dl
        cmp     dl, 0
        if      FW_VERSION = 172
        jne     L_0E7BE
L_0E7BC:
        jmp     L_0E826
        else
        je      L_0E826
        endif
L_0E7BE:
        cmp     dl, 9
        if      FW_VERSION = 172
L_0E7C1:
        jne     L_0E7C5
        jmp     L_0E826
L_0E7C5:
        mov     dl, byte ptr [G_DISK_DEVICE]
        else
        je      L_0E826
        endif
        dec     dl
        if      FW_VERSION = 150
        push    dx
        mov     ah, 7
        int     2dh
        pop     dx
        cmp     al, 2
        jne     L_0F0A8
        db      0e9h, 28h, 4dh
L_0F0A8:
        cmp     al, 1
        je      L_0F0AF
        jmp     jmp_ferr_scsi_conflict_id6
L_0F0AF:
        endif
        mov     ah, 0
disk_init_2:
        int     2dh
        mov     ah, 8
        int     2dh
        mov     ah, 8
        int     2dh
        if      FW_VERSION = 172
        cmp     al, 0
L_0E7D9:
        je      L_0E826
        endif
        cmp     al, 1
        jne     disk_verify_1
        ret
L_0F0C0:
disk_verify_1:
        if      FW_VERSION = 172
        cmp     al, 2
        jne     L_0E7F7
        db      0e8h, 64h
caution_dialog:
        daa
        mov     ah, 6
        int     2dh
        mov     ah, 5
        int     2dh
        mov     ah, 5
        int     2dh
        cmp     al, 0
L_0E7F5:
        je      L_0E826
L_0E7F7:
        mov     dl, byte ptr [G_DISK_DEVICE]
        dec     dl
        mov     ah, 7
disk_seek_0E7FF:
        int     2dh
        cmp     al, 0
L_0E803:
        jne     disk_init_3
        jmp     NEAR jmp_ferr_scsi_conflict_id6
disk_init_3:
        mov     ah, 0
        int     2dh
        mov     ah, 8
        int     2dh
        mov     ah, 8
        int     2dh
        or      al, al
L_0E816:
        je      L_0E826
        endif
        cmp     al, 3
        jne     L_0E81F
        jmp     jmp_ferr_no_disk
L_0E81F:
        or      al, al
handler_BC_SEQ_INIT:
        je      L_0E826
        if      FW_VERSION = 172
        db      0e9h, 98h, 4ah
        else
        db      0e9h
        db      02h, 4dh
        endif
L_0E826:
        mov     bl, 1
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0E82C:
        int     2ch
        if      FW_VERSION = 172
L_0E82E:
        pusha
L_0E82F:
        BC_SEQ_INIT
        else
        push    ax
        endif
L_0E832:
        mov     al, byte ptr [G_DISK_DEVICE]
        mov     byte ptr [G_DIR_CACHED_DEVICE], al
        if      FW_VERSION = 172
        popa
        else
        pop     ax
        endif
        cmp     byte ptr [G_DISK_DEVICE], 0
        jne     L_0E85D
        mov     byte ptr [FROM_DEL_SEL], al
        mov     byte ptr [G_DIR_HAS_FILES], ah
        mov     byte ptr [G_DISK_FORMAT], 0
        mov     byte ptr [G_DISK_PART_COUNT], 0
L_0E851:
        call    file_list_first
        call    lcd_update
L_0E857:
        call    L_0E8D1
        int     52h
        ret
L_0E85D:
        cmp     byte ptr [G_DISK_DEVICE], 9
L_0E862:
        je      L_0E896
        mov     byte ptr [G_DISK_FORMAT], al
        mov     byte ptr [G_DISK_PART_COUNT], dl
        mov     byte ptr [G_DIR_HAS_FILES], ah
        mov     byte ptr [G_SCSI_DEV_TYPE], dh
        mov     byte ptr [FROM_DEL_SEL], 0
L_0E878:
        mov     al, byte ptr [G_DISK_PARTITION]
        cmp     al, dl
        jb      L_0E87F+5
L_0E87F:
        mov     al, dl
        mov     byte ptr [G_DISK_PARTITION], al
        if      FW_VERSION = 150
L_0E88A:
        endif
        call    L_0E8A7
L_0E887:
        call    L_0E8ED
        if      FW_VERSION = 172
L_0E88A:
        endif
        call    file_list_first
        call    lcd_update
L_0E890:
        call    L_0E8D1
        int     52h
        ret
L_0E896:
        mov     byte ptr [G_FROM_CARD_STATE], al
        mov     byte ptr [G_DIR_HAS_FILES], 22h
        call    lcd_update
calls_clear_flag_78c1_0e8a1:
        call    file_list_first
        int     52h
        ret
L_0F14C:
L_0E8A7:
        cmp     byte ptr [G_SCSI_DEV_TYPE], 0
L_0E8AC:
        je      L_0E8BD
        if      FW_VERSION = 172
error_scsi_id_conflict          equ     $+4
        endif
        cmp     byte ptr [G_SCSI_DEV_TYPE], 5
        je      L_0E8BD
        cmp     byte ptr [G_SCSI_DEV_TYPE], 7
L_0E8BA:
        je      L_0E8BD
        ret
L_0E8BD:
        cmp     byte ptr [G_DISK_PART_COUNT], 0
L_0E8C2:
        jne     L_0E8C5
        ret
L_0E8C5:
        mov     al, byte ptr [G_DISK_PARTITION]
        mov     bl, 17h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0E8CE:
        int     2ch
L_0E8D0:
        ret
L_0E8D1:
        mov     al, byte ptr [G_DIR_HAS_FILES]
        cmp     al, 3
L_0E8D6:
        je      br_0E8E6
        cmp     al, 4
L_0E8DA:
        je      br_0E8E6
        cmp     al, 6
L_0E8DE:
        je      br_0E8E6
        cmp     al, 7
L_0E8E2:
        je      br_0E8E6
        clc
        ret
br_0E8E6:
        mov     byte ptr [G_FILE_TYPE], 0
        stc
        ret
L_0E8ED:
        mov     al, byte ptr [B_78B2]
L_0E8F0:
        mov     bl, 1ah
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0E8F6:
        int     2ch
L_0E8F8:
        jae     L_0E8FB
        ret
L_0E8FB:
        mov     bx, ds
        mov     ax, es
handler_BC_ERROR_MSG:
        mov     ds, ax
        mov     es, bx
L_0E903:
        mov     di, P_78F3
        mov     cx, 0ch
        rep movsb
        mov     ds, bx
        clc
        ret
load_device_down:
        call    disk_media_check
        cmp     byte ptr [G_DISK_PART_COUNT], 0
ui_ctrl_0e917:
        jne     L_0E91A
        ret
L_0F1BF:
L_0E91A:
        BC_UI_CTRL 41, 29, 7, 9
L_0E921:
        BC_FLUSH
calls_setup_callback_vectors_0e924:
        mov     al, byte ptr [G_DISK_PART_COUNT]
        mov     si, g_disk_partition
        mov     bx, L_0E93F
        call    setup_callback_vectors
bc_int6c_0e930:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, bc_int6c_0e6f7, NULL_HANDLER_OFS
L_0E93A:
        INT_5D load_partition_refresh
L_0E93E:
        ret
L_0E93F:
        call    part_field_display
L_0E942:
        call    wait_loop
L_0E945:
        BC_FLUSH
L_0E948:
        call    disk_media_check
        mov     al, byte ptr [G_DISK_PARTITION]
        mov     byte ptr [G_DIR_CACHED_DEVICE], 0ffh
        mov     bl, 17h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0E959:
        int     2ch
L_0E95B:
        mov     al, byte ptr [G_DISK_DEVICE]
        mov     byte ptr [G_DIR_CACHED_DEVICE], al
L_0E961:
        jb      L_0E97B
L_0E963:
        BC_SEQ_INIT
L_0E966:
        int     52h
        ret
load_partition_refresh:
        mov     byte ptr [B_78B2], 0
calls_clear_flag_78c1_0e96e:
        call    L_0E8ED
calls_clear_flag_78c1_0e971:
        call    L_0E2ED
calls_clear_flag_78c1_0e974:
        call    file_list_first
L_0E977:
        call    load_file_name_size_draw
        ret
L_0E97B:
        BC_SEQ_INIT
L_0E97E:
        int     52h
        mov     al, byte ptr [G_DISK_PARTITION]
        cmp     al, 0
        jne     L_0E988
        ret
L_0E988:
        dec     al
        mov     byte ptr [G_DISK_PARTITION], al
        jmp     SHORT L_0E93F
load_do_it:
        mov     bl, 11h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0E995:
        int     2ch
L_0E997:
        jae     L_0E99C
        jmp     load_screen_enter
L_0E99C:
        call    fn_0E336
L_0E99F:
        jne     calls_string_compare_0e9a2
        ret
calls_string_compare_0e9a2:
        mov     si, BUF_NAME_ENTRY_EXT
calls_string_compare_0e9a5:
        if      FW_VERSION = 172
        call    string_compare
        else
        call    isr_00F95+3
        endif
        inc     cx
        dec     sp
        dec     sp
        add     byte ptr [bp+si+3], dh
        jmp     calls_wait_loop_0ed49
calls_string_compare_0e9b1:
        if      FW_VERSION = 172
        call    string_compare
        else
        call    isr_00F95+3
        endif
        push    bx
        dec     si
        inc     sp
        add     byte ptr [bp+si+3], dh
        jmp     L_0F741
        if      FW_VERSION = 150
calls_string_compare_0e9d5:
        endif
calls_string_compare_0e9bd:
        if      FW_VERSION = 172
        call    string_compare
        else
        call    isr_00F95+3
        endif
        push    bx
        xor     sp, word ptr [bx+si]
        add     byte ptr [bp+si+3], dh
        jmp     L_0F741
calls_string_compare_0e9c9:
        if      FW_VERSION = 172
        call    string_compare
        else
        call    isr_00F95+3
        endif
        push    bx
        xor     word ptr [bx+si], sp
        add     byte ptr [bp+si+3], dh
        jmp     NEAR L_0F741
        if      FW_VERSION = 172
calls_string_compare_0e9d5:
        call    string_compare
        else
        call    isr_00F95+3
        endif
        push    ax
        inc     di
        dec     bp
        add     byte ptr [bp+si+3], dh
        jmp     bc_int66_0f562
calls_string_compare_0e9e1:
        if      FW_VERSION = 172
        call    string_compare
        else
        call    isr_00F95+3
        endif
        inc     cx
        push    ax
        push    bx
        add     byte ptr [bp+si+3], dh
        jmp     bc_int67_68_0f70f
calls_string_compare_0e9ed:
        if      FW_VERSION = 172
        call    string_compare
        else
        call    isr_00F95+3
        endif
        push    di
        inc     cx
        push    si
        add     byte ptr [bp+si+3], dh
        jmp     L_0F741
calls_string_compare_0e9f9:
        if      FW_VERSION = 172
        call    string_compare
        else
        call    isr_00F95+3
        endif
        push    bx
        inc     bp
        push    cx
        add     byte ptr [bp+si+3], dh
        jmp     NEAR L_0EA85
calls_string_compare_0ea05:
        if      FW_VERSION = 172
        call    string_compare
        else
        call    isr_00F95+3
        endif
        dec     bp
        dec     cx
        inc     sp
        add     byte ptr [bp+si+3], dh
        jmp     NEAR L_0EAF8+10
calls_string_compare_0ea11:
        if      FW_VERSION = 172
        call    string_compare
        else
        call    isr_00F95+3
        endif
        push    bx
        dec     bp
        inc     si
        add     byte ptr [bp+si+3], dh
        jmp     NEAR L_0EAF8+10
calls_string_compare_0ea1d:
        if      FW_VERSION = 172
        call    string_compare
        else
        call    isr_00F95+3
        endif
        push    bx
        inc     bp
        push    sp
        add     byte ptr [bp+si+3], dh
        jmp     bc_int66_0f62b
calls_string_compare_0ea29:
        if      FW_VERSION = 172
        call    string_compare
        else
        call    isr_00F95+3
        endif
        push    bx
        push    sp
        xor     word ptr [bx+si], ax
calls_string_compare_0ea30:
        jb      calls_string_compare_0ea35
        jmp     bc_int66_0f62b
calls_string_compare_0ea35:
        if      FW_VERSION = 172
        call    string_compare
        else
        call    isr_00F95+3
        endif
        push    bx
        push    sp
        xor     al, byte ptr [bx+si]
calls_string_compare_0ea3c:
        jb      calls_string_compare_0ea40
        jmp     SHORT L_0EA6F
calls_string_compare_0ea40:
        if      FW_VERSION = 172
        call    string_compare
        else
        call    isr_00F95+3
        endif
        push    dx
        dec     sp
        inc     sp
        add     byte ptr [bp+si+3], dh
from_arrange_dialog:
        jmp     L_0F741
calls_string_compare_0ea4c:
        if      FW_VERSION = 172
        call    string_compare
        else
        call    isr_00F95+3
        endif
        inc     bp
        dec     bp
        push    bp
        add     byte ptr [bp+si+3], dh
        jmp     L_0F741
calls_string_compare_0ea58:
        if      FW_VERSION = 172
        call    string_compare
        else
        call    isr_00F95+3
        endif
        inc     bp
        pop     ax
        inc     bp
        add     byte ptr [bp+si+1], dh
        ret
calls_string_compare_0ea62:
        if      FW_VERSION = 172
        call    string_compare
        else
        call    isr_00F95+3
        endif
        push    bx
        pop     cx
        push    bx
        add     byte ptr [bp+si+1], dh
        ret
L_0EA6C:
        db      0e9h, 93h, 00h
L_0EA6F:
        BC_PRINT "?????????????????"
L_0EA84:
        ret
L_0EA85:
        callf   CS1_SEG:arena_free_paras_far
        mov     bx, word ptr [G_FILE_SIZE_PARAS]
        cmp     ax, bx
L_0EA90:
        jae     L_0EA95
        jmp     jmp_ferr_insufficient_memory
L_0EA95:
        callf   CS1_SEG:seq_create_new_far
        sub     ax, ax
        mov     word ptr es:[0], ax
        mov     byte ptr es:[TBL_0013], al
L_0EAA4:
        call    cur_seq_name_from_entry
L_0EAA7:
        call    loading_screen_display
        mov     ax, ds
        mov     es, ax
        mov     si, BUF_NAME_ENTRY
        mov     bl, 4
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0EAB7:
        int     2ch
L_0EAB9:
        mov     ax, ds
        mov     es, ax
        mov     di, P_7DD8
        mov     cx, 2
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0EAC9:
        int     2ch
L_0EACB:
        mov     ax, L_0EAD2
L_0EACE:
        call    jmp_ax_0ec7d
        ret
L_0EAD2:
        mov     bx, 0eff8h
        if      FW_VERSION = 172
L_0EAD6                         equ     $+1
        endif
        mov     ax, word ptr [CUR_SEQ_SEG]
        mov     dx, 53h
        add     dx, ax
        callf   CS1_SEG:P_A9EA
L_0EAE2:
        jae     L_0EAE7
        jmp     NEAR br_0EC5D+10
L_0EAE7:
        mov     ax, dx
        if      FW_VERSION = 172
main_sequence_display_wait      equ     $+1
        endif
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bx, es
L_0EAEF:
        sub     ax, bx
L_0EAF1:
        mov     word ptr [W_7926], ax
        mov     es, dx
        sub     bx, bx
L_0EAF8:
        mov     word ptr es:[bx], bx
        callf   CS1_SEG:P_71B5
        jmp     SHORT L_0EB79
L_0F3A7:
        db      9ah
        dw      arena_free_paras_far
        dw      CS1_SEG
        if      FW_VERSION = 172
        db      8bh, 1eh, 24h, 79h, 03h, 0dbh, 73h, 03h, 0e9h, 5fh, 01h
        else
        mov     bx, word ptr [G_FILE_SIZE_PARAS]
        add     bx, bx
        jae     L_0EB12
        jmp     jmp_ferr_insufficient_memory
        endif
L_0EB12:
        cmp     ax, bx
L_0EB14:
        jae     L_0EB19
        if      FW_VERSION = 172
        jmp     bc_int67_68_0ec71
        else
        jmp     jmp_ferr_insufficient_memory
        endif
L_0EB19:
        callf   CS1_SEG:seq_create_new_far
        sub     ax, ax
        mov     word ptr es:[0], ax
        if      FW_VERSION = 172
caution_dialog_a                equ     $+3
        endif
        mov     byte ptr es:[TBL_0013], al
        sub     ax, ax
        mov     word ptr es:[1eh], ax
        mov     word ptr es:[1ch], ax
        mov     byte ptr es:[20h], al
L_0EB36:
        call    cur_seq_name_from_entry
        mov     ax, 0eff8h
        sub     ax, word ptr [G_FILE_SIZE_PARAS]
        push    ax
        mov     es, ax
L_0EB43:
        call    loading_screen_display
L_0EB46:
        call    file_load_entry_name
        pop     bp
        mov     bx, 0eff8h
        mov     ax, word ptr [CUR_SEQ_SEG]
        mov     dx, 53h
        add     dx, ax
        callf   CS1_SEG:midi_file_import_far
        jae     L_0EB5F
        jmp     NEAR br_0EC5D+10
L_0EB5F:
        mov     ax, dx
        mov     es, word ptr [CUR_SEQ_SEG]
        if      FW_VERSION = 172
L_0EB6A                         equ     $+5
        endif
        mov     byte ptr es:[TBL_0013], 0ffh
        mov     bx, es
        sub     ax, bx
L_0EB6F:
        mov     word ptr [W_7926], ax
        mov     es, dx
        sub     bx, bx
L_0EB76:
        mov     word ptr es:[bx], bx
L_0EB79:
        callf   CS1_SEG:load_sequence_dialog_draw
L_0EB7E:
        int     50h
calls_setup_callback_vectors_0eb80:
        mov     al, 62h
        mov     si, P_78B4
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
bc_int67_68_0eb8b:
        INT_66 load_a_sequence_play
bc_int5d_0eb8f:
        INT_67 load_page_draw
bc_int5d_0eb93:
        INT_68 load_a_sequence_keep
bc_int5d_0eb97:
        INT_5D load_a_sequence_refresh
L_0EB9B:
        callf   CS1_SEG:seq_find_free_slot_far
        mov     byte ptr [LOAD_INTO_SEQ], al
        ret
load_a_sequence_refresh:
        if      FW_VERSION = 172
L_0EBA9                         equ     $+5
        endif
        BC_TIME 66, 16, BUF_NAME_ENTRY
        mov     si, BUF_NAME_ENTRY
        mov     al, byte ptr [LOAD_INTO_SEQ]
        sub     ah, ah
        push    ax
        inc     al
L_0EBB6:
        BC_UI_MENU 102, 34
        db      58h
L_0EBBC:
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        cmp     byte ptr es:[TBL_0013], 0
L_0EBC7:
        je      br_0EBD5
        mov     si, 2
        mov     dx, es
L_0EBCE:
        BC_STATUS_B 120, 34, 16
        db      0c3h
br_0EBD5:
        if      FW_VERSION = 172
L_0EBDE                         equ     $+9
        endif
        BC_UI_A4 120, 34
        db      0c3h
load_a_sequence_play:
        BC_FILE_DIALOG 80, 20, 88, 21, ""
        db      00h
        mov     al, 0
caution_dialog_b:
        xchg    byte ptr [G_TRACK_SOLO], al
        push    ax
        mov     byte ptr [SEQ_RUNNING], 1
        callf   CS1_SEG:seq_position_reset_far
        callf   CS1_SEG:sequencer_run_by_sync_mode_far
        if      FW_VERSION = 150
        db      0a1h
        db      34h
        endif
L_0EBFA:
        if      FW_VERSION = 172
        mov     ax, word ptr [SEQ_CUR_BAR]
handler_BC_UI_DIALOG            equ     $+3
        mov     cx, word ptr [SEQ_BAR_TICK]
        else
        sbb     ax, 0e8bh
        db      36h
handler_BC_UI_DIALOG:
        db      1dh
        endif
handler_BC_INPUT_REGION:
        mov     dl, byte ptr [SEQ_BEAT_TICKS]
L_0EC05:
        BC_RANGE 98, 27
stop_status_0EC0A:
        BC_FLUSH
stop_status:
        call    panel_event_dequeue
        cmp     bh, 85h
        if      FW_VERSION = 172
        jne     L_0EBFA
        else
        jne     caution_dialog_b+20
        endif
        callf   CS1_SEG:sequencer_clear_running_far
stop_display:
        BC_STATUS 98, 27, "  STOP ! "
status_stop__0ec29:
        BC_FLUSH
calls_delay_loop_0ec2c:
        pop     ax
        mov     byte ptr [G_TRACK_SOLO], al
calls_delay_loop_0ec30:
        call    delay_loop
        jmp     NEAR L_0EB79
L_0EC36:
        ret
load_a_sequence_keep:
        mov     al, byte ptr [LOAD_INTO_SEQ]
        mov     byte ptr [SEL_SEQ], al
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        pushf
        mov     ax, word ptr [W_7926]
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     word ptr es:[0], ax
        mov     al, byte ptr [LOAD_INTO_SEQ]
        inc     al
        mov     byte ptr es:[TBL_0013], al
        popf
        jae     br_0EC5D
        jmp     load_page_draw
br_0EC5D:
        dec     al
        callf   CS1_SEG:seq_delete_far
        jmp     load_page_draw
L_0F50C:
        cmp     al, 1
L_0EC69:
        jne     L_0EC6E
        jmp     NEAR jmp_ferr_insufficient_memory
L_0EC6E:
        jmp     NEAR jmp_ferr_wrong_file
bc_int67_68_0ec71:
        if      FW_VERSION = 172
        callf   CS1_SEG:caution_1_dialog
bc_int67_68_0ec76:
        int     50h
bc_int67_68_0ec78:
        INT_67 load_page_draw
L_0EC7C:
        ret
        endif
jmp_ax_0ec7d:
        cmp     byte ptr [B_7DD9], 1
        je      L_0EC8D
        cmp     byte ptr [B_7DD9], 2
        je      L_0EC8D
        jmp     ax
L_0EC8D:
        mov     word ptr [W_7934], ax
L_0EC90:
        BC_SEQ_INIT
bc_int5d_0ec93:
        callf   CS1_SEG:conversion_table_dialog
bc_int5d_0ec98:
        int     50h
bc_int5d_0ec9a:
        INT_5D conversion_table_refresh
bc_int67_68_0ec9e:
        INT_67 load_page_draw
bc_int67_68_0eca2:
        call    ui_ctrl_0ecd8
bc_int67_68_0eca5:
        INT_68 jmp_ax_0ecbe
L_0ECA9:
        mov     word ptr [UI_SLOT_PAD_HIT], L_0ECB0
        ret
L_0ECB0:
        db      3ch, 00h
L_0ECB2:
        jne     L_0ECB5
        ret
L_0ECB5:
        call    conversion_table_entry_get
        mov     al, byte ptr [G_LAST_PAD_NOTE]
        mov     byte ptr [bx], al
        ret
jmp_ax_0ecbe:
        mov     ax, word ptr [W_7934]
        jmp     ax
conversion_table_refresh:
        if      FW_VERSION = 172
L_0ECC9                         equ     $+6
L_0ECCB                         equ     $+8
        endif
        BC_STATUS_A 128, 15, P_7D3C, TBL_DRUM_NOTE_LABELS
        db      0e8h
        push    si
        add.d0  al, ch
        pusha
        db      00h
mem_status_from_146_35:
        BC_MEM_STATUS 146, 35
ui_ctrl_0ecd7:
        ret
L_0F571:
ui_ctrl_0ecd8:
        BC_UI_CTRL 127, 14, 91, 9
bc_int6c_0ecdf:
        if      FW_VERSION = 172
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_ctrl_0ecf5
calls_setup_callback_vectors_0ece9:
        else
        db      0cdh, 6ch
        db      0dah
        db      0eh
        db      0dah
        db      0eh
        db      0dah
        db      0eh
        db      8eh, 0e9h
        endif
        mov     al, 21h
        mov     si, CONV_NOTE_SEL
        if      FW_VERSION = 150
calls_setup_callback_vectors_0ece9:
        endif
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
        ret
ui_ctrl_0ecf5:
        BC_UI_CTRL 145, 34, 37, 9
bc_int6c_0ecfc:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, ui_ctrl_0ecd8, NULL_HANDLER_OFS
handler_BC_ADDR_OP:
        INT_6A conversion_table_note_inc, conversion_table_note_dec
L_0ED0C:
        ret
conversion_table_note_dec:
        db      0e8h, 15h
L_0ED0F:
        add     byte ptr [si], bh
        and     si, word ptr [si+2]
        dec     al
L_0ED16:
        mov     byte ptr [bx], al
        ret
conversion_table_note_inc:
        call    conversion_table_entry_get
        cmp     al, 62h
        je      L_0ED22
        inc     al
L_0ED22:
        mov     byte ptr [bx], al
        ret
conversion_table_entry_get:
        mov     bl, byte ptr [CONV_NOTE_SEL]
        mov     bh, 0
        add     bx, P_7D3D
        mov     al, byte ptr [bx]
        ret
L_0ED32:
        les     si, cs:[vec_3c]
        mov     bx, 0
L_0ED3A:
        cmp     al, byte ptr es:[bx+si]
        je      calls_wait_loop_0ed46
        inc     bl
L_0ED41:
        cmp     bl, 40h
        jne     L_0ED3A
calls_wait_loop_0ed46:
        mov     ah, bl
        ret
calls_wait_loop_0ed49:
        call    wait_loop
L_0ED4C:
        call    int2c_service_04
        mov     cx, 0bh
        mov     si, 0a99h
        repe cmpsb
L_0ED57:
        je      L_0ED5C
        jmp     NEAR L_0F06F
L_0ED5C:
        mov     bl, 0ah
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0ED62:
        int     2ch
L_0ED64:
        if      FW_VERSION = 172
        db      9ah
        dw      L_1E087_V150
bc_int66_0ed67:
        dw      CS1_SEG
        else
        callf   CS1_SEG:L_1E087_V150
        endif
bc_int67_68_0ed69:
        int     50h
bc_int67_68_0ed6b:
        INT_66 L_0EE11
bc_int5b_0ed6f:
        INT_67 load_page_draw
bc_int5b_0ed73:
        INT_68 L_0ED7C
bc_int5b_0ed77:
        INT_5B load_page_draw
L_0ED7B:
        ret
L_0ED7C:
        call    all_file_read_globals_songs
        jmp     load_page_draw
all_file_read_globals_songs:
        call    loading_screen_display
L_0ED85:
        call    int2c_service_04
        mov     ax, ds
        mov     es, ax
        mov     di, 0
        mov     cx, 530h
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0ED98:
        int     2ch
L_0ED9A:
        mov     ax, ds
        mov     es, ax
        mov     di, D_0B1F
        mov     cx, 100h
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0EDAA:
        int     2ch
L_0EDAC:
        mov     ax, ds
        mov     es, ax
        mov     di, TBL_SONGS
        mov     cx, 2940h
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0EDBC:
        int     2ch
L_0EDBE:
        mov     ax, ds
        mov     es, ax
        mov     di, P_7DD8
        mov     cx, 0c60h
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0EDCE:
        int     2ch
L_0EDD0:
L_0EDD3                         equ     $+3
        callf   CS1_SEG:arena_first_seq_far
        call    file_read_chunks_to_es
        sub     ax, ax
        mov     word ptr es:[di], ax
        mov     ax, ds
        mov     es, ax
        mov     si, BUF_NAME_ENTRY
        mov     di, STR_DEFAULT_ALL_FILENAME
        mov     cx, 10h
        rep movsb
        ret
int2c_service_04:
        mov     ax, ds
        mov     es, ax
        mov     si, BUF_NAME_ENTRY
        push    es
        mov     bl, 4
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0EDFB:
        int     2ch
        pop     es
        if      FW_VERSION = 172
handler_BC_JUMP_COND            equ     $+2
        endif
        mov     di, P_7DD8
handler_BC_ARRAY_SEARCH:
        mov     cx, 10h
        pusha
        push    es
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0EE0C:
        int     2ch
        db      07h, 61h, 0c3h
L_0EE11:
        call    bc_int66_0ee2b
        mov     byte ptr [G_LOAD_SEQ_READ], 0
L_0EE19:
        call    loading_screen_display
L_0EE1C:
        call    L_0EE4D
        callf   CS1_SEG:seq_find_free_slot_far
        mov     byte ptr [LOAD_INTO_SEQ], al
L_0EE27:
        BC_SEQ_INIT
L_0EE2A:
        ret
bc_int66_0ee2b:
        callf   CS1_SEG:load_a_sequence_1_dialog
bc_int67_68_0ee30:
        int     50h
bc_int67_68_0ee32:
        INT_66 load_seq_from_all_play
bc_int5b_0ee36:
        INT_67 load_page_draw
bc_int5d_0ee3a:
        INT_68 load_seq_from_all_keep
bc_int5d_0ee3e:
        INT_5B load_page_draw
bc_int5d_0ee42:
        INT_5D load_seq_from_all_refresh
L_0EE46:
        call    calls_setup_callback_vectors_0ee9f
L_0EE49:
        call    load_seq_into_draw
        ret
L_0EE4D:
        call    int2c_service_04
        mov     ax, ds
L_0F6EB:
        mov     es, ax
        mov     di, P_7DD8
        mov     cx, 530h
        mov     bl, 13h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0EE60:
        int     2ch
L_0EE62:
        mov     ax, ds
        mov     es, ax
        mov     di, P_7DD8
        mov     cx, 100h
        mov     bl, 13h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0EE72:
        int     2ch
L_0EE74:
        mov     ax, ds
        mov     es, ax
        mov     di, P_7DD8
        mov     cx, 2940h
        mov     bl, 13h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0EE84:
        int     2ch
L_0EE86:
        mov     ax, ds
        mov     es, ax
        mov     di, P_7DD8
        mov     cx, 0c60h
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0EE96:
        int     2ch
L_0EE98:
        call    calls_setup_callback_vectors_0ee9f
L_0EE9B:
        call    load_seq_into_draw
        ret
CALLS_SETUP_CALLBACK_VECTORS_0EF03_V150:
calls_setup_callback_vectors_0ee9f:
        if      FW_VERSION = 172
calls_setup_callback_vectors_0eea0 equ     $+1
        endif
        mov     al, 62h
        mov     si, load_file_seq_idx
        mov     bx, L_0EEBA
        call    setup_callback_vectors
ui_ctrl_0eeaa:
        INT_63 calls_setup_callback_vectors_0ef03
ui_ctrl_0eeae:
        INT_62 NULL_HANDLER_OFS
ui_ctrl_0eeb2:
        BC_UI_CTRL 96, 15, 13, 9
L_0EEB9:
        ret
L_0EEBA:
        mov     byte ptr [G_LOAD_SEQ_READ], 0
        ret
load_seq_from_all_refresh:
        mov     ah, 63h
        mov     al, byte ptr [LOAD_FILE_SEQ_IDX]
        inc     al
        mov     si, P_7DD8
        sub     bx, bx
L_0EECC:
        mov     dx, word ptr [si]
        or      dx, dx
L_0EED0:
        je      L_0EEE3
        cmp     al, byte ptr [si+TBL_0013]
L_0EED5:
        je      L_0EEE3
        add     bx, dx
        add     si, 20h
        dec     ah
        jne     L_0EECC
        jmp     NEAR jmp_ferr_wrong_file
L_0EEE3:
        mov     word ptr [W_78B8], si
        mov     word ptr [W_78BA], dx
        add     si, 2
        mov     word ptr [W_78B6], bx
L_0EEF2:
        BC_UI_MENU 97, 16
        db      8ch
        db      0dah
L_0EEF9:
        BC_STATUS_B 115, 16, 16
L_0EEFF:
        call    load_seq_into_draw
        ret
calls_setup_callback_vectors_0ef03:
        mov     al, 62h
        mov     si, P_78B4
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
ui_ctrl_0ef0e:
        INT_62 calls_setup_callback_vectors_0ee9f
ui_ctrl_0ef12:
        INT_63 NULL_HANDLER_OFS
ui_ctrl_0ef16:
        BC_UI_CTRL 96, 37, 13, 9
L_0EF1D:
        ret
load_seq_into_draw:
        mov     al, byte ptr [LOAD_INTO_SEQ]
        push    ax
        inc     al
L_0EF24:
        BC_UI_MENU 97, 38
        db      58h
L_0EF2A:
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        mov     si, 2
        cmp     byte ptr es:[TBL_0013], 0
L_0EF38:
        je      L_0EF43
        mov     dx, es
L_0EF3C:
        BC_STATUS_B 115, 38, 16
        db      0c3h
L_0EF43:
        BC_UI_A4 115, 38
        ret
load_seq_from_all_play:
        if      FW_VERSION = 172
L_0EF4C                         equ     $+3
        endif
        cmp     word ptr [W_78BA], 0
L_0EF4E:
        jne     L_0EF51
        ret
L_0EF51:
        cmp     byte ptr [G_LOAD_SEQ_READ], 0
        jne     L_0EF5B
L_0EF58:
        call    L_0EFBC
L_0EF5B:
        callf   CS1_SEG:P_7271
x15_1_dialog:
        BC_FILE_DIALOG 80, 20, 88, 21, ""
        db      00h
L_0EF69:
        mov     ax, word ptr [SEQ_CUR_BAR]
        mov     cx, word ptr [SEQ_BAR_TICK]
        mov     dl, byte ptr [SEQ_BEAT_TICKS]
L_0EF74:
        BC_RANGE 98, 27
stop_1_status_0EF79:
        BC_FLUSH
stop_1_status:
        call    panel_event_dequeue
        cmp     bh, 85h
        jne     L_0EF69
        callf   CS1_SEG:sequencer_stop_far
stop_warning_display_b:
        BC_STATUS 98, 27, "  STOP ! "
status_stop__0ef98:
        BC_FLUSH
calls_delay_loop_0ef9b:
        call    delay_loop
L_0EF9E:
        call    bc_int66_0ee2b
        mov     byte ptr [G_LOAD_SEQ_READ], 1
        ret
load_seq_from_all_keep:
        cmp     word ptr [W_78BA], 0
        if      FW_VERSION = 172
L_0EFAC:
        endif
        jne     L_0EFAF
        ret
L_0EFAF:
        cmp     byte ptr [G_LOAD_SEQ_READ], 0
        if      FW_VERSION = 150
L_0EFAC:
        endif
        jne     L_0EFB9
L_0EFB6:
        call    L_0EFBC
L_0EFB9:
        jmp     load_a_sequence_keep
L_0EFBC:
        cmp     word ptr [W_78BA], 0
L_0EFC1:
        jne     L_0EFC4
        ret
L_0EFC4:
        callf   CS1_SEG:arena_free_paras_far
        mov     si, word ptr [W_78B8]
        cmp     ax, word ptr [si]
        if      FW_VERSION = 172
L_0EFCF:
        endif
        jae     L_0EFD4
        jmp     NEAR jmp_ferr_insufficient_memory
L_0EFD4:
        call    loading_screen_display
        mov     bl, 0ah
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0EFDD:
        int     2ch
L_0EFDF:
        call    L_0EE4D
        mov     cx, word ptr [W_78B6]
        cmp     cx, 0
L_0EFE9:
        je      L_0F00F
L_0EFEB:
        sub     cx, 800h
L_0EFEF:
        jb      L_0F000
        push    cx
        mov     cx, 8000h
        mov     bl, 13h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0EFFB:
        int     2ch
L_0EFFD:
        pop     cx
        jmp     SHORT L_0EFEB
L_0F000:
        add     cx, 800h
        shl     cx, 4
        mov     bl, 13h
        mov     bh, byte ptr [G_DISK_DEVICE]
        if      FW_VERSION = 172
L_0F00D:
        endif
        int     2ch
L_0F00F:
        if      FW_VERSION = 172
        db      9ah
        dw      arena_find_end_far
L_0F012:
        dw      CS1_SEG
        db      8ch
        push    es
        or      bl, byte ptr [di]
        else
        callf   CS1_SEG:arena_find_end_far
        mov     word ptr [CUR_SEQ_SEG], es
        endif
        mov     cx, word ptr [W_78BA]
        mov     word ptr [W_7926], cx
L_0F8B9:
        sub     cx, 800h
L_0F024:
        jb      L_0F040
        push    cx
        push    es
        mov     cx, 8000h
        sub     di, di
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F033:
        int     2ch
        pop     es
        pop     cx
        mov     ax, es
        add     ax, 800h
        mov     es, ax
        jmp     L_0F8B9
L_0F040:
        add     cx, 800h
        shl     cx, 4
        sub     di, di
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F04F:
        int     2ch
L_0F051:
        sub     ax, ax
        mov     word ptr es:[di], ax
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     word ptr es:[0], ax
        callf   CS1_SEG:P_71B5
L_0F063:
        BC_SEQ_INIT
L_0F066:
        mov     bl, 0ah
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F06C:
        db      0cdh
        sub     al, 0c3h
L_0F06F:
        mov     ax, word ptr [BUF_FILE_HEADER]
        cmp     ax, 304h
L_0F075:
        je      L_0F08E
        cmp     ax, 104h
L_0F07A:
        je      L_0F08E
        cmp     ax, 204h
L_0F07F:
        je      L_0F08E
        cmp     ax, 103h
L_0F084:
        je      L_0F08E
        cmp     ax, 203h
L_0F089:
        je      L_0F08E
        jmp     jmp_ferr_wrong_file
L_0F08E:
        mov     byte ptr [G_ALL_FILE_TYPE], ah
        mov     ax, L_0F099
L_0F095:
        call    jmp_ax_0ec7d
        ret
L_0F099:
        call    all_file_dialog_title_draw
        callf   CS1_SEG:mpc_all_file_load_warning_draw
bc_int67_68_0f0a1:
        int     50h
bc_int67_68_0f0a3:
        INT_66 calls_wait_loop_0f286
bc_int5b_0f0a7:
        INT_67 load_page_draw
bc_int5b_0f0ab:
        INT_68 mpc3000_all_file_load
        if      FW_VERSION = 172
L_0F0AF:
        endif
        INT_5B load_page_draw
L_0F0B3:
        ret
mpc3000_all_file_load:
        call    loading_screen_display
        mov     ax, ds
        mov     es, ax
        mov     si, BUF_NAME_ENTRY
        mov     bl, 4
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F0C4:
        int     2ch
L_0F0C6:
        mov     cx, 6
        mov     bl, 13h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F0CF:
        int     2ch
L_0F0D1:
        mov     byte ptr [SEL_SEQ], 0
        callf   CS1_SEG:arena_first_seq_far
        sub     ax, ax
        mov     word ptr es:[0], ax
loop_0F0E1:
        call    L_0F10F
        jae     loop_0F0E1
L_0F0E6:
        mov     bl, 5
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F0EC:
        int     2ch
L_0F0EE:
        jb      L_0F0FD
        cmp     al, 0ffh
L_0F0F2:
        je      L_0F0FD
        cmp     al, 0
L_0F0F6:
        je      L_0F0FD
L_0F0F8:
        call    L_0F153
        jmp     SHORT L_0F0E6
L_0F0FD:
        mov     ax, ds
L_0F0FF:
        mov     es, ax
        mov     si, BUF_NAME_ENTRY
        mov     di, STR_DEFAULT_ALL_FILENAME
        mov     cx, 10h
        rep movsb
        jmp     load_page_draw
L_0F10F:
        callf   CS1_SEG:seq_create_new_far
        sub     ax, ax
        mov     word ptr es:[0], ax
        mov     bx, 0eff8h
        mov     ax, es
        mov     dx, word ptr [SEQ_EVENTS_SEG]
L_0F123:
        jae     L_0F128
        jmp     L_0F50C
L_0F128:
        call    L_0F273
        cmp     al, 0ffh
        stc
L_0F12E:
        jne     L_0F131
        ret
L_0F131:
        push    ax
        mov     ax, dx
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bx, es
L_0F13A:
        sub     ax, bx
L_0F13C:
        mov     word ptr es:[0], ax
        pop     ax
        mov     byte ptr es:[TBL_0013], al
        dec     al
        mov     byte ptr [SEL_SEQ], al
        mov     es, dx
        sub     bx, bx
L_0F14E:
        mov     word ptr es:[bx], bx
        clc
        ret
L_0F153:
        cmp     byte ptr [G_ALL_FILE_TYPE], 1
L_0F158:
        jne     L_0F15C
        jmp     SHORT L_0F1D1
L_0F15C:
        push    ax
        mov     ah, 0
        shl     ax, 1
        add     ax, 18h
        mov     cx, ax
        mov     di, P_7DD8
        push    di
        mov     ax, ds
        mov     es, ax
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F174:
        int     2ch
L_0F176:
        pop     si
        pop     cx
        mov     al, byte ptr [si]
        dec     al
        sub     ah, ah
        mov     bx, 210h
        mul     bx
        add     ax, TBL_SONGS
        mov     di, ax
        mov     ax, ds
        mov     es, ax
        mov     byte ptr [di+SONG_USED], 1
        push    si
        push    di
        add     di, 10h
        add     si, 18h
        mov     ch, 0
        cmp     cl, 0fah
        jb      br_0F1A2
        mov     cl, 0fah
br_0F1A2:
        lodsw
        dec     al
        stosw
        loop    br_0F1A2
        mov     ax, 0ffffh
        stosw
        pop     di
        pop     si
        mov     al, byte ptr [si+2]
        mov     byte ptr [di+SONG_LOOP_LAST], al
        push    di
        push    si
        add     di, 0
        add     si, 3
        mov     cx, 10h
        rep movsb
        pop     si
        pop     di
        add     di, 20ah
        add     si, 13h
        mov     cx, 5
        rep movsb
        ret
L_0F1D1:
        push    ax
        mov     ah, 0
        shl     ax, 1
        add     ax, 3
        mov     cx, ax
        mov     di, P_7DD8
        push    di
        mov     ax, ds
        mov     es, ax
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F1E9:
        int     2ch
L_0F1EB:
        pop     si
        pop     cx
        mov     al, byte ptr [si]
        dec     al
        sub     ah, ah
        mov     bx, 210h
        mul     bx
        add     ax, TBL_SONGS
        mov     di, ax
        mov     ax, ds
        mov     es, ax
        mov     byte ptr [di+SONG_USED], 1
        pusha
        mov     si, D_0BCF
        mov     ax, ds
        mov     es, ax
        mov     cx, 10h
        add     di, 0
        rep movsb
        popa
        push    si
        push    di
        add     di, 10h
        add     si, 3
        mov     ch, 0
        cmp     cl, 0fah
        jb      br_0F228
        mov     cl, 0fah
br_0F228:
        lodsw
        dec     al
        stosw
        loop    br_0F228
        mov     ax, 0ffffh
        stosw
        pop     di
        pop     si
        if      FW_VERSION = 172
track_op_display_b              equ     $+2
        endif
        mov     al, byte ptr [si+2]
        mov     byte ptr [di+SONG_LOOP_LAST], al
        ret
        if      FW_VERSION = 150
track_op_display_b:
        endif
all_file_dialog_title_draw:
        if      FW_VERSION = 172
track_op_nav                    equ     $+3
        endif
        cmp     byte ptr [G_ALL_FILE_TYPE], 3
mpc3000_all_file_dialog_0F241:
        jne     mpc60_all_file_dialog
mpc3000_all_file_dialog:
        BC_FILE_DIALOG 29, 2, 190, 58, "MPC3000 ALL file"
mpc60_all_file_dialog_0F25B:
        ret
mpc60_all_file_dialog:
        if      FW_VERSION = 150
MPC60_ALL_FILE_DIALOG_V150:
L_0FAFD                         equ     $+8
        endif
        BC_FILE_DIALOG 29, 2, 190, 58, "MPC60 ALL file"
L_0F272:
        ret
L_0F273:
        cmp     byte ptr [G_ALL_FILE_TYPE], 3
L_0F278:
        jne     calls_wait_loop_0f280
        callf   CS1_SEG:P_A9EE
        ret
calls_wait_loop_0f280:
        callf   CS1_SEG:P_A9F2
        ret
calls_wait_loop_0f286:
        mov     byte ptr [G_LOAD_SEQ_READ], 0
        call    wait_loop
L_0F28E:
        call    L_0F2C4
        callf   CS1_SEG:seq_find_free_slot_far
        mov     byte ptr [LOAD_INTO_SEQ], al
L_0F299:
        BC_SEQ_INIT
L_0F29C:
        mov     byte ptr [LOAD_FILE_SEQ_IDX], 0
L_0F2A1:
        call    bc_int66_0f2a5
        ret
bc_int66_0f2a5:
        callf   CS1_SEG:load_a_sequence_2_dialog
bc_int67_68_0f2aa:
        int     50h
bc_int67_68_0f2ac:
        INT_66 load_seq_2_play
bc_int5b_0f2b0:
        INT_67 load_page_draw
bc_int5d_0f2b4:
        INT_68 load_seq_2_keep
bc_int5d_0f2b8:
        INT_5B load_page_draw
track_op_edit_b:
        INT_5D load_seq_2_refresh
L_0F2C0:
        call    bc_int6a_0f3e1
        ret
L_0F2C4:
        mov     ax, ds
track_op_edit_c:
        mov     es, ax
        mov     si, BUF_NAME_ENTRY
        mov     bl, 4
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F2D1:
        int     2ch
L_0F2D3:
        mov     cx, 6
        mov     bl, 13h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F2DC:
        int     2ch
L_0F2DE:
        db      0bfh
L_0F2DF:
        dw      P_8DD8
L_0F2E1:
        mov     byte ptr [di], 0ffh
        push    di
L_0F2E5:
        call    L_0F2FC
        pop     di
        jae     L_0F2EC
        ret
L_0F2EC:
        inc     bl
L_0F2EE:
        mov     si, P_7DD8
        mov     ax, ds
        mov     es, ax
        mov     cx, 20h
        rep movsb
        jmp     SHORT L_0F2E1
L_0F2FC:
        cmp     byte ptr [G_ALL_FILE_TYPE], 3
L_0F301:
        jne     L_0F366
        mov     di, P_7DDA
        mov     cx, 151h
        mov     ax, ds
        mov     es, ax
        push    cx
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F314:
        int     2ch
L_0F316:
        pop     cx
        cmp     ax, cx
        stc
L_0F31A:
        je      L_0F31D
        ret
L_0F31D:
        cmp     byte ptr [B_7DDA], 0ffh
        stc
L_0F323:
        jne     br_0F326
        ret
br_0F326:
        mov     al, byte ptr [B_7F2A]
        mov     ah, 18h
        mul     ah
        mov     cx, ax
        mov     al, byte ptr [B_7F29]
        mov     ah, 6
        mul     ah
        add     cx, ax
        mov     ax, word ptr [W_7DDB]
        mov     dx, word ptr [W_7DDD]
        add     ax, cx
        adc     dx, 0
L_0F344:
        mov     cx, 8000h
        sub     ax, cx
        sbb     dx, 0
L_0F34C:
        jb      L_0F35A
        pusha
        mov     bl, 13h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F355:
        int     2ch
L_0F357:
        popa
        jmp     SHORT L_0F344
L_0F35A:
        add     cx, ax
        mov     bl, 13h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F362:
        int     2ch
        clc
        ret
L_0F366:
        mov     di, P_7DDA
        mov     cx, 0cah
        mov     ax, ds
        mov     es, ax
        push    cx
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F377:
        int     2ch
L_0F379:
        pop     cx
        cmp     ax, cx
        stc
L_0F37D:
        je      L_0F380
        ret
L_0F380:
        cmp     byte ptr [B_7DDA], 0ffh
        stc
L_0F386:
        jne     br_0F389
        ret
br_0F389:
        mov     al, byte ptr [B_7EA3]
        mov     ah, 15h
        cmp     byte ptr [G_ALL_FILE_TYPE], 1
        je      L_0F398
        mov     cx, 18h
L_0F398:
        mul     ah
        mov     cx, ax
        mov     al, byte ptr [B_7EA2]
        mov     ah, 6
        mul     ah
L_0F3A3:
        add     cx, ax
        mov     ax, word ptr [W_7DDB]
        mov     dl, byte ptr [W_7DDD]
        mov     dh, 0
        add     ax, cx
        adc     dx, 0
        jmp     SHORT L_0F344
load_seq_2_refresh:
        mov     al, byte ptr [LOAD_FILE_SEQ_IDX]
        inc     al
L_0F3BA:
        BC_UI_MENU 67, 16
        db      0feh
L_0F3C0:
        enter   0b4h, -3fh
        db      0e0h, 05h

        add     ax, P_8DE3
        cmp     byte ptr [G_ALL_FILE_TYPE], 3
        je      L_0F3D3
        sub     ax, 2
L_0F3D3:
        mov     si, ax
        mov     dx, ds
L_0F3D7:
        BC_STATUS_B 85, 16, 16
bc_int6a_0f3dd:
        call    load_seq_into_draw
        ret
bc_int6a_0f3e1:
        INT_6A load_seq_2_file_inc, load_seq_2_file_dec
ui_ctrl_0f3e7:
        INT_62 NULL_HANDLER_OFS
ui_ctrl_0f3eb:
        INT_63 bc_int62_0f427
ui_ctrl_0f3ef:
        BC_UI_CTRL 66, 15, 139, 9
L_0F3F6:
        ret
load_seq_2_file_inc:
        mov     al, byte ptr [LOAD_FILE_SEQ_IDX]
        inc     al
        mov     bl, al
        mov     bh, 0
        shl     bx, 5
        cmp     byte ptr [bx+P_8DD8], 0ffh
        jne     L_0F40B
        ret
L_0F40B:
        inc     byte ptr [LOAD_FILE_SEQ_IDX]
        mov     byte ptr [G_LOAD_SEQ_READ], 0
        ret
load_seq_2_file_dec:
        cmp     byte ptr [LOAD_FILE_SEQ_IDX], 0
        jne     L_0F41D
        ret
L_0F41D:
        dec     byte ptr [LOAD_FILE_SEQ_IDX]
        mov     byte ptr [G_LOAD_SEQ_READ], 0
        ret
bc_int62_0f427:
        call    calls_setup_callback_vectors_0ef03
bc_int62_0f42a:
        INT_62 bc_int6a_0f3e1
L_0F42E:
        ret
load_seq_2_keep:
        cmp     byte ptr [G_LOAD_SEQ_READ], 0
L_0F434:
        jne     L_0F498
        mov     al, byte ptr [LOAD_INTO_SEQ]
        mov     byte ptr [SEL_SEQ], al
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        pushf
L_0F442:
        call    loading_screen_display
L_0F445:
        call    L_0F458
        popf
        jae     br_0F44E
        jmp     load_page_draw
br_0F44E:
        dec     al
        callf   CS1_SEG:seq_delete_far
        jmp     load_page_draw
L_0F458:
        mov     si, BUF_NAME_ENTRY
        mov     ax, ds
        mov     es, ax
        mov     bl, 4
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F465:
        int     2ch
L_0F467:
        mov     cx, 6
        mov     bl, 13h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F470:
        int     2ch
L_0F472:
        mov     al, byte ptr [LOAD_FILE_SEQ_IDX]
L_0F475:
        sub     al, 1
L_0F477:
        jb      br_0F480
        push    ax
L_0F47A:
        call    L_0F2FC
        pop     ax
        jmp     SHORT L_0F475
br_0F480:
        call    L_0F10F
        mov     al, byte ptr [LOAD_INTO_SEQ]
        inc     al
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     byte ptr es:[TBL_0013], al
        mov     ax, word ptr es:[0]
        mov     word ptr [W_7926], ax
        ret
L_0F498:
        mov     al, byte ptr [LOAD_INTO_SEQ]
        mov     byte ptr [SEL_SEQ], al
        callf   CS1_SEG:SCSI_LIST_OP_FAR_OFS
        pushf
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ax, word ptr [W_7926]
        mov     word ptr es:[0], ax
        mov     al, byte ptr [LOAD_INTO_SEQ]
        inc     al
        mov     byte ptr es:[TBL_0013], al
        popf
        callf   CS1_SEG:seq_delete_far
        jmp     load_page_draw
load_seq_2_play:
        sub     ax, ax
        mov     word ptr [SEQ_CUR_BAR], ax
        mov     word ptr [SEQ_BAR_TICK], ax
x15_2_dialog:
        BC_FILE_DIALOG 80, 20, 88, 21, ""
        if      FW_VERSION = 172
        db      00h, 0a1h, 40h, 1dh, 8bh, 0eh, 42h, 1dh, 8ah, 16h, 48h, 1dh
        else
        db      00h, 0a1h, 34h, 1dh, 8bh, 0eh, 36h, 1dh, 8ah, 16h, 3ch, 1dh
        endif
L_0F4DD:
        BC_RANGE 98, 27
L_0F4E2:
        BC_FLUSH
L_0F4E5:
        mov     al, 0
        xchg    byte ptr [G_TRACK_SOLO], al
        push    ax
        cmp     byte ptr [G_LOAD_SEQ_READ], 0
        jne     L_0F4F6
L_0F4F3:
        call    L_0F458
L_0F4F6:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     al, byte ptr [LOAD_INTO_SEQ]
        inc     al
        mov     byte ptr es:[TBL_0013], al
        call    transport_handler_play_start
L_0F506:
        mov     ax, word ptr [SEQ_CUR_BAR]
        mov     cx, word ptr [SEQ_BAR_TICK]
        mov     dl, byte ptr [SEQ_BEAT_TICKS]
L_0F511:
        BC_RANGE 98, 27
stop_2_status_0F516:
        BC_FLUSH
stop_2_status:
        call    panel_event_dequeue
        cmp     bh, 85h
        jne     L_0F506
        callf   CS1_SEG:sequencer_stop_far
stop_display_2:
        BC_STATUS 98, 27, "  STOP ! "
status_stop__0f535:
        BC_FLUSH
calls_delay_loop_0f538:
        pop     ax
        mov     byte ptr [G_TRACK_SOLO], al
calls_delay_loop_0f53c:
        call    delay_loop
L_0F53F:
        call    bc_int66_0f2a5
L_0F542:
        call    load_seq_2_refresh
        mov     byte ptr [G_LOAD_SEQ_READ], 1
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ax, word ptr es:[0]
        mov     word ptr [W_7926], ax
        if      FW_VERSION = 150
L_0FDEF                         equ     $+1
        endif
        sub     ax, ax
        mov     word ptr es:[0], ax
        mov     byte ptr es:[TBL_0013], 0
        ret
bc_int66_0f562:
        callf   CS1_SEG:LOAD_A_PROGRAM_DIALOG_OFS
bc_int67_68_0f567:
        int     50h
bc_int67_68_0f569:
        INT_66 load_a_program_clear
bc_int5d_0f56d:
        INT_67 load_page_draw
bc_int5d_0f571:
        INT_68 load_a_program_load
bc_int5d_0f575:
        INT_5D load_program_refresh
bc_int5b_0f579:
        INT_5B load_page_draw
calls_setup_callback_vectors_0f57d:
        mov     al, 1
        mov     si, P_78C2
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
        ret
load_program_refresh:
        if      FW_VERSION = 172
L_0F591                         equ     $+8
        endif
        BC_STATUS_A 94, 22, P_78C2, TBL_NOFASTER_YES_LABELS
        db      0c3h
load_a_program_clear:
        mov     bl, 11h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F599:
        int     2ch
L_0F59B:
        jae     L_0F5A0
        jmp     load_screen_enter
L_0F5A0:
        mov     cx, 1
L_0F5A3:
        call    L_0F5C5
L_0F5A6:
        je      L_0F5AB
        jmp     load_page_draw
L_0F5AB:
        ret
load_a_program_load:
        mov     bl, 11h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F5B2:
        int     2ch
L_0F5B4:
        jae     L_0F5B9
        jmp     load_screen_enter
L_0F5B9:
        mov     cx, 0
L_0F5BC:
        call    L_0F5C5
L_0F5BF:
        je      L_0F5C4
        jmp     load_page_draw
L_0F5C4:
        ret
L_0F5C5:
        push    cx
L_0F5C6:
        call    loading_screen_display
L_0F5C9:
        call    int3e_vector_install
        mov     ax, ds
        mov     es, ax
        mov     si, BUF_NAME_ENTRY
        mov     bl, 4
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F5D9:
        int     2ch
L_0F5DB:
        mov     ax, ds
        mov     es, ax
        mov     si, BUF_NAME_ENTRY
        mov     ax, bx
L_0F5E4:
        mov     bl, byte ptr [B_78C2]
        sub     bh, bh
        pop     cx
        push    ds
L_0F5EC:
        int     31h
        pop     ds
        or      ax, ax
        push    ax
        nop
        push    cs
L_0F5F4:
        call    note_program_lookup
        pop     ax
        cmp     ax, 1
L_0F5FB:
        je      br_0F5FE
        ret
br_0F5FE:
        mov     word ptr [UI_SLOT_F2], P_E12F
        mov     word ptr [UI_SLOT_F2_SEG], cs
        sub     ax, ax
        ret
int3e_vector_install:
        pusha
        mov     ax, 0
        mov     es, ax
        mov     si, P_F620
        mov     word ptr es:[0f8h], si
        mov     word ptr es:[0fah], cs
        popa
        ret
calls_load_status_0_0f620:
        sti
L_0F621:
        call    load_status_0E132
L_0F624:
        call    load_page_refresh
L_0F627:
        BC_FLUSH
        db      0cfh
bc_int66_0f62b:
        callf   CS1_SEG:load_a_set_1_dialog
bc_int67_68_0f630:
        int     50h
bc_int67_68_0f632:
        INT_66 load_a_set_sound
bc_int5b_0f636:
        INT_67 load_page_draw
bc_int5b_0f63a:
        INT_68 load_a_set_set
bc_int5b_0f63e:
        INT_5B load_page_draw
L_0F642:
        ret
load_a_set_sound:
        mov     bl, 11h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F649:
        int     2ch
L_0F64B:
        jae     L_0F650
        jmp     load_screen_enter
L_0F650:
        mov     cx, 2
L_0F653:
        call    L_0F6BC
L_0F656:
        je      L_0F65B
        jmp     load_page_draw
L_0F65B:
        ret
load_a_set_set:
        mov     ax, P_F663
        call    L_0EC8D
        ret
bc_int67_68_0f663:
        callf   CS1_SEG:load_a_set_dialog
bc_int67_68_0f668:
        INT_66 load_a_set_clear
bc_int5d_0f66c:
        INT_67 load_page_draw
bc_int5d_0f670:
        INT_68 load_a_set_load
bc_int5d_0f674:
        INT_5D load_program_refresh
calls_setup_callback_vectors_0f678:
        mov     al, 1
        mov     si, P_78C2
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
        ret
load_a_set_clear:
        mov     bl, 11h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F68A:
        int     2ch
L_0F68C:
        jae     L_0F691
        jmp     load_screen_enter
L_0F691:
        call    loading_screen_display
        mov     cx, 1
L_0F697:
        call    L_0F6BC
L_0F69A:
        je      L_0F69F
        jmp     load_page_draw
L_0F69F:
        ret
load_a_set_load:
        mov     bl, 11h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F6A6:
        int     2ch
L_0F6A8:
        jae     L_0F6AD
        jmp     load_screen_enter
L_0F6AD:
        call    loading_screen_display
        mov     cx, 0
L_0F6B3:
        call    L_0F6BC
L_0F6B6:
        je      L_0F6BB
        jmp     load_page_draw
L_0F6BB:
        ret
L_0F6BC:
        push    cx
L_0F6BD:
        call    int3e_vector_install
        mov     ax, ds
        mov     es, ax
        mov     si, BUF_NAME_ENTRY
        mov     bl, 4
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F6CD:
        int     2ch
L_0F6CF:
        mov     ax, ds
        mov     es, ax
        mov     si, BUF_NAME_ENTRY
        mov     ax, bx
L_0F6D8:
        mov     bl, byte ptr [B_78C2]
        sub     bh, bh
        pop     cx
        mov     di, P_F6FA
handler_BC_SOFTKEY:
        mov     bp, cs
        push    ds
L_0F6E5:
        int     31h
        pop     ds
        or      ax, ax
        push    ax
        nop
        push    cs
L_0F6ED:
        call    note_program_lookup
        pop     ax
        cmp     ax, 1
L_0F6F4:
        je      L_0F6F7
        ret
L_0F6F7:
        sub     ax, ax
        ret
L_0F6FA:
        pusha
        push    ds
        push    es
        mov     ax, DATA_SEG
        mov     ds, ax
        mov     bx, UI_SLOT_EXIT
        call    setup_handler
L_0F708:
        call    load_page_draw
        pop     es
        pop     ds
        popa
        ret
bc_int67_68_0f70f:
        callf   CS1_SEG:LOAD_APS_FILE_DIALOG_OFS
bc_int5b_0f714:
        int     50h
bc_int5b_0f716:
        INT_67 load_page_draw
bc_int5b_0f71a:
        INT_5B load_page_draw
bc_int67_68_0f71e:
        INT_68 load_aps_file_load
calls_setup_callback_vectors_0f722:
        mov     al, 1
        mov     si, P_78C2
        mov     bx, NULL_HANDLER_OFS
        call    setup_callback_vectors
        ret
load_aps_file_load:
        call    load_a_program_load
        mov     ax, ds
        mov     es, ax
        mov     si, BUF_NAME_ENTRY
        mov     di, STR_DEFAULT_APS_FILENAME
        mov     cx, 10h
        rep movsb
        ret
L_0F741:
        call    loading_screen_display
        mov     ax, ds
L_0F746:
        mov     es, ax
        mov     si, BUF_NAME_ENTRY
        mov     bl, 4
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F751:
        int     2ch
L_0F753:
        mov     ax, bx
L_0F755:
        mov     di, si
        mov     bx, es
L_0F759:
        push    ds
        pop     es
        mov     si, BUF_NAME_ENTRY
        push    ds
L_0F75F:
        int     31h
        pop     ds
        or      ax, ax
        cmp     ax, 1
L_0F767:
        je      bc_int67_68_0f76a
        ret
L_10003:
bc_int67_68_0f76a:
        BC_SEQ_INIT
bc_int67_68_0f76d:
        INT_67 L_0F772
L_0F771:
        ret
L_0F772:
        if      FW_VERSION = 172
        db      0ffh, 1eh, 4ch, 0eh, 0e9h, 0b6h, 0e9h
        else
        db      0ffh, 1eh, 4ch, 0eh, 0e9h, 0f5h, 0e9h
L_10022                         equ     $+16
        endif
off_5_status_0F779:
        if      FW_VERSION = 172
off_5_status                    equ     $+5
        endif
        BC_TIME 66, 16, BUF_NAME_ENTRY
off_display_padded:
        BC_STATUS 142, 34, "OFF    "
status_off_0f78d:
        mov     al, byte ptr [B_78C3]
        or      al, al
        jne     off_6_status_0F795
        ret
off_6_status_0F795:
        add     al, 22h
        sub     ah, ah
off_6_status:
        BC_ARITH_EXT 0228eh
slash_off_display:
        BC_STATUS 154, 34, "/OFF"
status_off_0f7a8:
        mov     al, byte ptr [B_78C4]
        cmp     al, 40h
L_0F7AD:
        jne     L_0F7B0
        ret
L_0F7B0:
        push    ax
        and     al, 0fh
        inc     al
L_0F7B5:
        BC_ARITH_EXT 022a6h
L_0F7BA:
        pop     ax
        shr     al, 4
        add     al, 41h
        mov     cl, 0a0h
        mov     ch, 22h
L_0F7C4:
        BC_PUTCHAR
        db      0c3h
L_0F7C8:
        mov     bl, 40h
        cmp     al, 0
        je      br_0F7E7
        add     al, 22h
        les     si, cs:[vec_3c]
        mov     bx, 0
L_0F7D8:
        mov     ah, byte ptr es:[bx+si]
        cmp     al, byte ptr es:[bx+si]
        je      br_0F7E7
        inc     bl
L_0F7E2:
        cmp     bl, 40h
        jne     L_0F7D8
br_0F7E7:
        mov     byte ptr [B_78C4], bl
        ret
        or      ah, byte ptr [G_PAD_BANK_OFS]
        mov     byte ptr [B_78C4], ah
        mov     bl, ah
        sub     bh, bh
        les     si, cs:[vec_3c]
        mov     al, byte ptr es:[bx+si]
        sub     al, 22h
        mov     byte ptr [B_78C3], al
        ret
file_load_entry_name:
        mov     byte ptr [G_DIR_CACHED_DEVICE], 0ffh
        push    es
        mov     ax, ds
        mov     es, ax
        mov     si, BUF_NAME_ENTRY
        mov     bl, 4
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F819:
        int     2ch
        pop     es
file_read_chunks_to_es:
        push    es
        sub     di, di
        mov     cx, 8000h
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F828:
        int     2ch
        pop     es
        cmp     ax, 8000h
L_0F82E:
        jne     L_0F83A
        mov     bx, es
L_0F832:
        add     bx, 800h
        mov     es, bx
L_0F838:
        jmp     SHORT file_read_chunks_to_es
L_0F83A:
        push    ax
        mov     al, byte ptr [G_DISK_DEVICE]
        mov     byte ptr [G_DIR_CACHED_DEVICE], al
        pop     ax
        ret
file_load_named_far:
        mov     byte ptr [G_DIR_CACHED_DEVICE], 0ffh
        push    es
        mov     es, bx
L_0F84B:
        mov     bl, 4
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F851:
        int     2ch
        pop     es
L_0F854:
        jae     L_0F857
        ret
L_0F857:
        pusha
L_0F858:
        push    es
        sub     di, di
        mov     cx, 8000h
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F864:
        int     2ch
        pop     es
        mov     bx, es
L_0F869:
        add     bx, 800h
        mov     es, bx
        cmp     ax, 8000h
        je      L_0F858
        mov     al, byte ptr [G_DISK_DEVICE]
        mov     byte ptr [G_DIR_CACHED_DEVICE], al
        popa
        clc
        ret
cur_seq_name_from_entry:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     di, 2
        mov     si, BUF_NAME_ENTRY
        mov     cx, 10h
        rep movsb
        ret
calls_clear_flag_78c1_0f88d:
        call    file_list_first
L_0F890:
        jae     calls_string_compare_0f893
        ret
calls_string_compare_0f893:
        mov     si, BUF_NAME_ENTRY_EXT
calls_string_compare_0f896:
        if      FW_VERSION = 172
        call    string_compare
        else
        call    isr_00F95+3
        endif
        inc     cx
        dec     sp
        dec     sp
        add     byte ptr [bp+di+8], dh
calls_init_state_78c1_0f89f:
        call    file_list_next
L_0F8A2:
        jae     L_0F8A5
        ret
L_0F8A5:
        jmp     SHORT calls_string_compare_0f893
L_0F8A7:
        call    int2c_service_04
        mov     cx, 0bh
        mov     si, 0a99h
        repe cmpsb
L_0F8B2:
        je      L_0F8B6
        jmp     SHORT calls_init_state_78c1_0f89f
L_0F8B6:
        mov     ax, ds
L_0F8B8:
        mov     es, ax
        mov     si, BUF_NAME_ENTRY
        mov     di, BUF_LOADING_NAME
        mov     cx, 14h
        rep movsb
        mov     dx, ds
        mov     si, STR_LOADING_MSG
calls_clear_flag_78c1_0f8ca:
        call    all_file_read_globals_songs
        ret
calls_clear_flag_78c1_0f8ce:
        call    file_list_first
L_0F8D1:
        jae     calls_string_compare_0f8d4
        ret
calls_string_compare_0f8d4:
        mov     si, BUF_NAME_ENTRY_EXT
calls_string_compare_0f8d7:
        if      FW_VERSION = 172
        call    string_compare
        else
        call    isr_00F95+3
        endif
        inc     cx
        push    ax
        push    bx
        add     byte ptr [bp+di+8], dh
calls_init_state_78c1_0f8e0:
        call    file_list_next
L_0F8E3:
        jae     L_0F8E6
        ret
L_0F8E6:
        jmp     SHORT calls_string_compare_0f8d4
L_0F8E8:
        int     50h
L_0F8EA:
        mov     ax, ds
        mov     es, ax
        mov     si, BUF_NAME_ENTRY
        mov     di, STR_DEFAULT_APS_FILENAME
        mov     cx, 10h
        rep movsb
jmp_init_state_0f8f9:
        call    L_0F5C5
jmp_init_state_0f8fc:
        je      br_0F901
        jmp     init_state
br_0F901:
        mov     word ptr [UI_SLOT_F2], init_state
        mov     word ptr [UI_SLOT_F2_SEG], cs
        ret
load_device_window:
        call    arrange_window
bc_int5b_0f90f:
        jae     bc_int5b_0f912
        ret
bc_int5b_0f912:
        INT_5B calls_memory_copy_0f92f
bc_int67_68_0f916:
        INT_67 calls_memory_copy_0f92f
bc_int67_68_0f91a:
        INT_68 bc_int67_68_0f91f
bc_int67_68_0f91e:
        ret
bc_int67_68_0f91f:
        call    arrange_from_dialog_draw
bc_int67_68_0f922:
        INT_68 load_arrange_from_do_it
L_0F926:
        ret
load_arrange_from_do_it:
        callf   CS1_SEG:from_arrange_far
        call    lcd_update
calls_memory_copy_0f92f:
        call    load_page_draw
        if      FW_VERSION = 172
calls_memory_copy_0f932:
        call    bc_int6c_0e6f7
        endif
calls_memory_copy_0f935:
        if      FW_VERSION = 150
        call    L_0EFCF
        endif
        call    memory_copy
        ret
str_exe_filename:
        db      "MPC2000         .EXE"
        mov     ax, cs
        mov     es, ax
        mov     si, str_exe_filename
        mov     bl, 4
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F95A:
        int     2ch
L_0F95C:
        jae     L_0F961
        jmp     jmp_ferr_disk_read_error
L_0F961:
        mov     di, P_7DD8
L_101FD:
        mov     cx, 200h
L_0F967:
        mov     ax, ds
        mov     es, ax
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F971:
        int     2ch
L_0F973:
        mov     di, P_7FD8
        sub     word ptr [P_7DE0], 20h
L_0F97B:
        je      jmp_loading_msg_0f98b
        jae     L_0F961+3
        mov     cx, word ptr [P_7DE0]
        add     cx, 20h
        shl     cx, 4
        jmp     SHORT L_0F967
jmp_loading_msg_0f98b:
        cmp     word ptr [BUF_FILE_HEADER], 5a4dh
jmp_loading_msg_0f991:
        je      br_0F996
        jmp     jmp_ferr_no_system_file
br_0F996:
        mov     ax, 0c000h
        mov     es, ax
        mov     cx, 8
L_0F99E:
        push    cx
        call    sys_image_read_chunk
        pop     cx
        mov     bx, es
L_0F9A5:
        add     bx, 800h
        mov     es, bx
        cmp     ax, 8000h
        jne     L_0F9B2
        loop    L_0F99E
L_0F9B2:
        mov     bl, 0ah
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F9B8:
        int     2ch
L_0F9BA:
        cli
        mov     word ptr [MZ_ENTRY_CS], 0c000h
        jmpf    [FP_MZ_ENTRY]
sys_image_read_chunk:
        push    es
        sub     di, di
        mov     cx, 8000h
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F9D1:
        int     2ch
        db      007h, 0c3h, "MPC2000       "
        db      "  .SYS"
L_0F9E9:
        mov     bl, 1
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0F9EF:
        int     2ch
L_0F9F1:
        jae     br_0F9F6
        jmp     jmp_ferr_disk_read_error
br_0F9F6:
        cmp     byte ptr [G_DISK_DEVICE], 9
        jne     L_0FA00
        mov     byte ptr [G_FROM_CARD_STATE], al
L_0FA00:
        mov     ax, cs
        mov     es, ax
        mov     si, STR_SYS_FILENAME
        mov     bl, 4
        mov     bh, byte ptr [G_DISK_DEVICE]
jmp_loading_msg_0fa0d:
        int     2ch
jmp_loading_msg_0fa0f:
        jae     L_0FA14
        jmp     jmp_ferr_no_system_file
L_0FA14:
        mov     di, P_7DD8
        mov     cx, 200h
        mov     ax, ds
        mov     es, ax
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0FA24:
        int     2ch
jmp_loading_msg_0fa26:
        cmp     word ptr [BUF_FILE_HEADER], 5a4dh
jmp_loading_msg_0fa2c:
        je      L_0FA31
        jmp     jmp_ferr_no_system_file
L_0FA31:
        mov     cx, word ptr [P_7DE0]
        shl     cx, 4
        sub     cx, 200h
L_0FA3C:
        je      br_0FA56
        cmp     cx, 3e00h
L_0FA42:
        jb      L_0FA47
        jmp     NEAR jmp_ferr_relocation_error
L_0FA47:
        mov     di, P_7FD8
        mov     ax, ds
        mov     es, ax
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0FA54:
        int     2ch
br_0FA56:
        mov     dx, 3000h
        push    dx
        mov     es, dx
L_0FA5C:
        call    sys_image_read_chunk
        cmp     ax, 8000h
        jne     L_0FA6E
        mov     bx, es
L_0FA66:
        add     bx, 800h
        mov     es, bx
L_0FA6C:
        jmp     SHORT L_0FA5C
L_0FA6E:
        sub     ax, 10h
L_0FA71:
        jae     L_0FA7E
        add     ax, 10h
        and     ax, 0fh
        mov     bx, es
        dec     bx
        mov     es, bx
L_0FA7E:
        mov     si, ax
        mov     di, 0af5h
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
L_0FA8B:
        mov     cx, 10h
        rep movsb
L_0FA90:
        mov     ds, bx
        mov     bl, 0ah
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0FA98:
        int     2ch
L_0FA9A:
        pop     dx
        mov     si, word ptr [MZ_RELOC_OFS]
        add     si, P_7DD8
        mov     cx, word ptr [MZ_RELOC_COUNT]
        jcxz    L_0FABA
L_10342:
        mov     di, word ptr [si]
        mov     ax, word ptr [si+2]
        add     ax, dx
        mov     es, ax
L_0FAB2:
        add     word ptr es:[di], dx
        add     si, 4
        loop    L_10342
L_0FABA:
        add     word ptr [MZ_ENTRY_CS], dx
        cli
        mov     ax, word ptr [MZ_INIT_SS]
        add     ax, dx
        mov     ss, ax
calls_delete_status_0_0fac6:
        mov     ax, word ptr [MZ_INIT_SP]
        mov     sp, ax
        les     si, [FP_MZ_ENTRY]
        jmpf    [FP_MZ_ENTRY]
delete_screen_enter:
        call    delete_status_0FAE3
        call    wait_loop
L_0FAD9:
        BC_FLUSH
L_0FADC:
        call    L_0FB71
L_0FADF:
        BC_SEQ_INIT
L_0FAE2:
        ret
delete_status_0FAE3:
        call    load_page_draw
delete_status:
        PANE_FROM_DELETE
bc_int6c_0fb19:
        INT_6C NULL_HANDLER_OFS, NULL_HANDLER_OFS, bc_int5d_0fb57, bc_int6a_0fb89
bc_int5d_0fb23:
        INT_69 delete_page_f6
bc_int5d_0fb27:
        INT_5B bc_int5b_0fbfb
free_eq_1_status:
        INT_5D delete_page_refresh
free_1_status:
        BC_CLEAR_RECT 182, 21, 66, 27
free_display_3:
        BC_STATUS 176, 39, "Free=       "
        if      FW_VERSION = 150
        INT_68 delete_device_window
        endif
status_free_0fb48:
        ret
L_103E6:
delete_page_refresh:
        call    load_page_refresh
L_0FB4C:
        BC_CLEAR_RECT 182, 21, 66, 27
L_0FB53:
        call    delete_free_space_draw
        ret
bc_int5d_0fb57:
        call    load_view_field
bc_int5d_0fb5a:
        INT_63 delete_status_0FAE3
bc_int5d_0fb5e:
        INT_5D delete_view_refresh
L_0FB62:
        ret
delete_view_refresh:
        call    load_view_refresh
L_0FB66:
        BC_CLEAR_RECT 182, 21, 66, 27
L_0FB6D:
        call    delete_free_space_draw
        ret
L_1040E:
L_0FB71:
        mov     bl, 11h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0FB77:
        int     2ch
L_0FB79:
        jb      calls_memory_copy_0fb85
        mov     al, byte ptr [G_DISK_DEVICE]
        cmp     al, byte ptr [G_DIR_CACHED_DEVICE]
calls_memory_copy_0fb82:
        jne     calls_memory_copy_0fb85
        ret
calls_memory_copy_0fb85:
        call    memory_copy
        ret
bc_int6a_0fb89:
        call    bc_int6c_0e6f7
bc_int6a_0fb8c:
        if      FW_VERSION = 150
bc_int5d_0fb92                  equ     $+6
        endif
        INT_6A delete_device_inc, delete_device_dec
        if      FW_VERSION = 172
bc_int5d_0fb92:
        endif
        INT_62 delete_status_0FAE3
bc_int5d_0fb96:
        INT_63 delete_device_down
bc_int5d_0fb9a:
        INT_5D delete_page_refresh
bc_int5b_0fb9e:
        if      FW_VERSION = 150
L_1043C                         equ     $+1
        endif
        INT_5B delete_device_window
L_0FBA2:
        ret
delete_device_inc:
        mov     al, byte ptr [G_DISK_DEVICE]
        cmp     al, 7
        jne     br_0FBAB
        ret
br_0FBAB:
        inc     al
        cmp     al, 7
        jne     L_0FBB3
        inc     al
L_0FBB3:
        cmp     al, 0ah
        jb      calls_wait_loop_0fbb9
        mov     al, 0
calls_wait_loop_0fbb9:
        mov     byte ptr [G_DISK_DEVICE], al
        mov     byte ptr [G_DISK_PARTITION], 0
        call    wait_loop
L_0FBC4:
        call    L_0FB71
L_0FBC7:
        BC_SEQ_INIT
L_0FBCA:
        ret
delete_device_dec:
        mov     al, byte ptr [G_DISK_DEVICE]
        sub     al, 1
        jae     br_0FBD4
        mov     al, 9
br_0FBD4:
        cmp     al, 7
        jne     L_0FBDA
        dec     al
L_0FBDA:
        jmp     SHORT calls_wait_loop_0fbb9
delete_device_down:
        cmp     byte ptr [G_DISK_PART_COUNT], 0
L_0FBE1:
        jne     bc_int62_0fbe4
        ret
bc_int62_0fbe4:
        call    load_device_down
bc_int5d_0fbe7:
        INT_62 bc_int6a_0fb89
bc_int5d_0fbeb:
        INT_63 NULL_HANDLER_OFS
bc_int5d_0fbef:
        INT_5D delete_partition_refresh
L_0FBF3:
        ret
delete_partition_refresh:
        call    load_partition_refresh
L_0FBF7:
        call    delete_free_space_draw
        ret
bc_int5b_0fbfb:
        call    file_list_open
bc_int5b_0fbfe:
        INT_68 jmp_delete_status_0_0fc07
bc_int5b_0fc02:
        INT_5B jmp_delete_status_0_0fc07
jmp_delete_status_0_0fc06:
        ret
jmp_delete_status_0_0fc07:
        cmp     byte ptr [G_FILE_LIST_ROW], 0
        jne     calls_init_state_78c1_0fc11
        jmp     delete_status_0FAE3
calls_init_state_78c1_0fc11:
        dec     byte ptr [G_FILE_LIST_ROW]
        call    file_list_next
        jmp     SHORT jmp_delete_status_0_0fc07
delete_free_space_draw:
        cmp     byte ptr [G_DISK_DEVICE], 0
L_0FC1F:
        je      status_display_FC31
        cmp     byte ptr [G_DISK_DEVICE], 9
L_0FC26:
        jne     free_eq_k_2_status
        jmp     SHORT fragmented_display
free_eq_k_2_status:
        cmp     byte ptr [G_DISK_DEVICE], 9
free_k_2_status:
        jne     status_display_FC5E
status_display_FC31:
        BC_STATUS 176, 30, "            "
free_display_4:
        BC_STATUS 176, 39, "Free=      K"
status_free______k_0fc55:
        mov     ax, word ptr [G_FREE_SPACE]
free_eq_m_1_status:
        BC_ARITH 027dah
free_m_1_status:
        ret
status_display_FC5E:
        BC_STATUS 176, 30, "            "
free_display_5:
        BC_STATUS 176, 39, "Free=    . M"
status_free_____m_0fc82:
        mov     ax, word ptr [G_FREE_SPACE]
        cmp     byte ptr [G_SCSI_DEV_TYPE], 5
        jne     L_0FC8E
        sub     ax, ax
L_0FC8E:
        sub     dx, dx
        mov     bx, 0ah
        div     bx
        push    dx
L_0FC96:
        BC_ARITH 027ceh
L_0FC9B:
        pop     ax
frag_eq_k_status:
        BC_OP_32 236, 39
frag_k_status:
        ret
fragmented_display:
        if      FW_VERSION = 150
FRAGMENTED_DISPLAY_V150:
L_1054D                         equ     $+14
        endif
        BC_STATUS 176, 30, "Frag=      K"
free_eq_k_3_status:
        mov     ax, word ptr [G_FRAG_SPACE]
free_k_3_status:
        BC_ARITH 01edah
free_memory_display_d:
        BC_STATUS 176, 39, "Free=      K"
status_free______k_0fcce:
        mov     ax, word ptr [G_FREE_SPACE]
L_0FCD1:
        BC_ARITH 027dah
L_0FCD6:
        ret
delete_page_f6:
        cmp     byte ptr [G_DISK_DEVICE], 9
L_0FCDC:
        if      FW_VERSION = 150
L_1057A                         equ     $+1
        endif
        je      L_0FCE6
        cmp     byte ptr [G_DIR_HAS_FILES], 1
L_0FCE3:
        je      L_0FCE6
        ret
L_0FCE6:
        mov     bl, 11h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0FCEC:
        int     2ch
L_0FCEE:
        jae     L_0FCF3
        jmp     NEAR delete_screen_enter
L_0FCF3:
        cmp     bl, 0
L_0FCF6:
        je      br_0FCFB
        jmp     jmp_ferr_write_protect
br_0FCFB:
        mov     si, BUF_NAME_ENTRY
        mov     cx, 14h
        mov     al, 0
L_0FD03:
        or      al, byte ptr [si]
        inc     si
        loop    L_0FD03
        cmp     al, 20h
L_0FD0A:
        jne     bc_int67_68_0fd0d
        ret
bc_int67_68_0fd0d:
        callf   CS1_SEG:DELETE_FILE_DIALOG_OFS
bc_int67_68_0fd12:
        int     50h
bc_int67_68_0fd14:
        INT_67 delete_status_0FAE3
bc_int67_68_0fd18:
        INT_68 delete_file_do_it
L_0FD1C:
        ret
delete_file_do_it:
        cmp     byte ptr [G_DISK_DEVICE], 9
L_0FD22:
        jne     L_0FD27
        jmp     calls_string_compare_0fe21
L_0FD27:
        mov     bl, 11h
L_105C6:
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0FD2D:
        int     2ch
calls_delete_status_0_0fd2f:
        jae     L_0FD34
        jmp     NEAR delete_screen_enter
L_0FD34:
        call    delete_status_0FAE3
L_0FD37:
        call    delete_page_refresh
L_0FD3A:
        BC_FLUSH
L_0FD3D:
        BC_CLEAR_RECT 158, 21, 19, 12
L_0FD44:
        BC_CLEAR_RECT 158, 21, 18, 24
L_0FD4B:
        BC_WAIT 158, 21, BMP_TRASH
        if      FW_VERSION = 172
        db      8ch, 0d8h, 8eh, 0c0h, 0beh, 0c9h
L_0FD58:
        db      78h, 0bfh
        movsw
L_0FD5B:
        jge     bc_int67_68_0fd14+2
        adc     al, 0
        else
        mov     ax, ds
        mov     es, ax
        mov     si, BUF_NAME_ENTRY
        mov     di, D150_7D8B
        mov     cx, 14h
        endif
        rep movsb
L_0FD61:
        BC_PLANE_A
L_0FD64:
        BC_CLEAR_RECT 30, 9, 120, 7
L_0FD6B:
        BC_PLANE_B
L_0FD6E:
        mov     word ptr [W_7DD6], 32h
        if      FW_VERSION = 172
handler_BC_TABLE_EXEC           equ     $+1
        endif
        mov     cx, 17h
        mov     si, P_7DBB
L_0FD7A:
        mov     al, byte ptr [si-1]
        mov     byte ptr [si], al
        dec     si
        loop    L_0FD7A
        mov     bl, 18h
        mov     di, P_7D74
L_10624:
        mov     cx, word ptr [di]
        add     ch, 9
        add     cl, 1dh
        inc     di
        inc     di
        lodsb
        or      ah, al
        pusha
L_0FD95:
        BC_PUTCHAR
        db      61h
L_0FD99:
        cmp     ah, 20h
L_0FD9C:
        je      L_0FDB6
        dec     bl
L_0FDA0:
        jne     L_0FD7A+13
        add     ch, 3
        mov     al, 20h
L_0FDA7:
        if      FW_VERSION = 172
L_0FDAB                         equ     $+4
        endif
        BC_PUTCHAR
        BC_FLUSH
        mov     cx, word ptr [W_7DD6]
        call    delay_ticks
        jmp     SHORT L_0FD6E
L_0FDB6:
        sub     word ptr [W_7DD6], 2
        dec     bl
L_0FDBD:
        jne     L_0FD7A+13
L_0FDBF:
        PANE_FROM_ICONS
L_0FDE1:
        mov     ax, ds
        mov     es, ax
        mov     si, BUF_NAME_ENTRY
        mov     bl, 14h
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0FDEE:
        int     2ch
        jae     L_0FDEE+7
        jmp     NEAR jmp_ferr_file_not_found
        if      FW_VERSION = 172
L_0FDF5:
        cmp     byte ptr [G_DISK_DEVICE], 0
L_0FDFA:
        je      L_0FE04
        mov     bl, 1
        mov     bh, byte ptr [G_DISK_DEVICE]
L_0FE02:
        int     2ch
L_0FE04:
        call    L_0E8A7
        endif
        call    lcd_update
        call    reset_state_vars
calls_check_flag_78af_0fe0d:
        call    file_list_prev
calls_check_flag_78af_0fe10:
        jae     calls_check_flag_78af_0fe15
        jmp     file_list_first
L_106A0:
calls_check_flag_78af_0fe15:
        if      FW_VERSION = 172
        call    file_list_prev
L_0FE18:
        jae     L_0FE18+5
handler_BC_HW_PORT_READ         equ     $+2
        jmp     NEAR file_list_first
        endif
        call    file_list_next
        ret
calls_string_compare_0fe21:
        mov     si, BUF_NAME_ENTRY_EXT
calls_string_compare_0fe24:
        if      FW_VERSION = 172
        call    string_compare
        else
        call    isr_00F95+3
        endif
        push    bx
        dec     si
        inc     sp
        add     byte ptr [bp+di+3], dh
        jmp     L_0FD27
L_0FE30:
        mov     si, BUF_NAME_ENTRY
        mov     ax, ds
        mov     es, ax
        mov     ax, 2
        int     47h
        cmp     al, 0
L_0FE3E:
        jne     bc_int67_68_0fe43
        jmp     L_0FD27
bc_int67_68_0fe43:
        callf   CS1_SEG:DELETE_FROM_SOUND_DIALOG_OFS
bc_int67_68_0fe48:
        int     50h
bc_int67_68_0fe4a:
        INT_67 delete_status_0FAE3
bc_int67_68_0fe4e:
        INT_68 delete_from_sound_do_it
L_0FE52:
        ret
delete_from_sound_do_it:
        mov     si, BUF_NAME_ENTRY
        mov     ax, ds
        mov     es, ax
        mov     ax, 3
        int     47h
        jmp     NEAR L_0FD27
delete_device_window:
        call    arrange_window
bc_int5b_0fe65:
        jae     bc_int5b_0fe68
        ret
bc_int5b_0fe68:
        INT_5B calls_delete_status_0_0fe85
bc_int67_68_0fe6c:
        INT_67 calls_delete_status_0_0fe85
bc_int67_68_0fe70:
        INT_68 bc_int67_68_0fe75
bc_int67_68_0fe74:
        ret
bc_int67_68_0fe75:
        call    arrange_from_dialog_draw
bc_int67_68_0fe78:
        INT_68 delete_arrange_from_do_it
L_0FE7C:
        ret
delete_arrange_from_do_it:
        callf   CS1_SEG:from_arrange_far
        call    lcd_update
calls_delete_status_0_0fe85:
        call    delete_status_0FAE3
L_0FE88:
        call    bc_int6a_0fb89
        ret
        WORD_END
CS0_END:
