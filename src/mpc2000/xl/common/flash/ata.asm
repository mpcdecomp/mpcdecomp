; ata -- MPC2000XL flash: INT 93h, the ATA/CF service.
; v1.20 0x0f68c-0x0fe70 (2020 bytes), v1.14 0x0f598-0x0fb80 (1512 bytes),
; v1.12 0x0f45a-0x0f9e0 (1414 bytes), v1.11 0x0f402-0x0f980 (1406 bytes),
; v1.10 0x0f3f6-0x0f970 (1402 bytes), v1.07 0x0f19a-0x0f720 (1414 bytes).
; a part of its own under ATA_SEG: stock put it in segment 0, so its offsets are
; the stock linear addresses and growth ahead of it moves the segment instead.
; entered by its INT 5Bh/93h vectors and app0's xl_ata_probe call; it makes no
; near call out of the part.
;
; the stock offsets leave it only the rest of segment 0 (v1.20: 400 bytes).  so
; once ata's body is not its stock size, it takes the lowest offset of the same
; paragraph phase instead (SEG_ATA's low nibble), and its 64K is its own.  the
; phase is the same both ways, so FRAME_PAD ahead pads the same, and a stock
; build keeps every stock byte.  the body (to ata_body_end) must not change size
; with the layout, or both layouts could be consistent: the one operand whose
; size follows its value is spelt out below, and the ATA_SEG-dependent thunk
; sits past the end of the body.  ATA_ANCHOR is in segments.inc.
ATA_CSBASE set     ATA_SEG*16-SEGBASE
        ifdef   XL_FOR_2K
        if      ATA_SEG <> 0
        error   "XL_FOR_2K: app0 reaches its caves here near, from segment 0"
        endif
        endif

isr_0F68C:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        KEY_SAVE        A1_TBL_0A6F0
        pop     ds
        iret
        ifdef   GROWTH_PROOF
        db      GROWTH_PROOF dup (90h)
        endif
isr_0F698:                              ; INT 93h, ATA (app0 installs it)
        sti
        push    ds
        push    es
        mov     bp, RAM_SEG
        mov     ds, bp
        and     bx, 0fh
        shl     bx, 1
        db      2eh, 0ffh, 97h                  ; call word ptr cs:[bx+disp16]: disp16 even
        dw      TBL_ATA_SERVICE-ATA_CSBASE      ;   where a low ATA_SEG would allow disp8
        pop     es
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
TBL_ATA_SERVICE:
        dw      xl_ata_probe-ATA_CSBASE, tgt_0F6D7-ATA_CSBASE, tgt_0F951-ATA_CSBASE, tgt_0F9BE-ATA_CSBASE
        dw      tgt_0F880-ATA_CSBASE, tgt_0F8B7-ATA_CSBASE, tgt_0F913-ATA_CSBASE, tgt_0FA2F-ATA_CSBASE
        dw      tgt_0FA2F-ATA_CSBASE, tgt_0F6DA-ATA_CSBASE, tgt_0F6D7-ATA_CSBASE, tgt_0F6D7-ATA_CSBASE
        if      FW_VERSION >= 114
        dw      tgt_0FA9B-ATA_CSBASE, tgt_0FA4A-ATA_CSBASE, tgt_0F6D7-ATA_CSBASE, tgt_0F6D7-ATA_CSBASE
        else
        dw      tgt_0F6D7-ATA_CSBASE, tgt_0F6D7-ATA_CSBASE, tgt_0F6D7-ATA_CSBASE, tgt_0F6D7-ATA_CSBASE
        endif
tgt_0F6D7:
        sub     ax, ax
        ret
tgt_0F6DA:
        stc
        ret
xl_ata_probe:
        if      FW_VERSION >= 114
        push    dx
        XL2K_ATA_PROBE
        pop     dx
        cmp     ax, 0ffffh
        stc
        jne     br_0F6E9
        ret
br_0F6E9:
        endif
        mov     dx, 1eeh
        mov     ax, 8
        out     dx, ax
        if      FW_VERSION >= 114
        call    fn_0FBFE
        jae     L_0F6F6
        else
        if      FW_VERSION >= 110
        db      0e8h, 0a7h, 02h
        else
        call    fn_0FBFE
        endif
        db      73h, 01h
        endif
        ret
L_0F6F6:
        push    dx
        mov     dx, 1e8h
        in      ax, dx
        pop     dx
        mov     cx, ax
        push    dx
        if      FW_VERSION >= 114
        if      FW_VERSION >= 120
; XL_FOR_2K 0x0F701 (58 bytes): wheel_isr.  PINNED: app0's near JMP here.  span
; straddles both ends: 0x0F701 = byte 3 of `mov dx,1eah` at 0x0F6FF, 0x0F73A =
; byte 1 of `mov di,0`; both fragments re-emitted.
        ifdef   XL_FOR_2K
        db      0bah, 0eah              ; head of the stock `mov dx, 1eah`
        XL2K_WHEEL_ISR
        db      000h, 000h              ; tail of the stock `mov di, 0`
        else
        mov     dx, 1eah
        in      ax, dx
        pop     dx
        mov     ch, al
xl_ata_atapi_signature_test:
        cmp     cx, 0eb14h
        je      br_0F70F
        jmp     L_0F7E8
br_0F70F:
        mov     dx, 0ech
        mov     ax, 0
        out     dx, ax
        mov     byte ptr [A1_B_0A88A], 0
        call    fn_0FBFE
        jae     br_0F721
        ret
br_0F721:
        mov     dx, 1ech
        mov     ax, 0a0h
        out     dx, ax
        mov     dx, 1eeh
        mov     ax, 0a1h
        out     dx, ax
        call    fn_0FBFE
        jae     br_0F735
        ret
br_0F735:
        mov     ax, 0e2a0h
        mov     es, ax
        mov     di, 0
        endif
        else
last_ticks:
wi_ccw:
wi_ck:
wi_ck2:
wi_cw:
wi_delta:
wi_done:
wi_have_dir:
        mov     dx, 1eah
        in      ax, dx
        pop     dx
        mov     ch, al
xl_ata_atapi_signature_test:
        cmp     cx, 0eb14h
        mov     ax, 2ch
        stc
        je      br_0F70F
        ret
br_0F70F:
        mov     dx, 0ech
        mov     ax, 0
        out     dx, ax
        mov     byte ptr [A1_B_0A88A], 0
        call    fn_0FBFE
        jae     br_0F721
        ret
br_0F721:
        mov     dx, 1ech
        mov     ax, 0a0h
        out     dx, ax
        mov     dx, 1eeh
        mov     ax, 0a1h
        out     dx, ax
        call    fn_0FBFE
        jae     br_0F735
        ret
br_0F735:
        mov     ax, 0e2a0h
        mov     es, ax
        mov     di, 0
        endif
        mov     cx, 100h
tgt_0F740:
        call    fn_0FC3C
        jae     L_0F4B1
        ret
L_0F4B1:
        push    dx
        mov     dx, 1e0h
        in      ax, dx
        pop     dx
        stosw
        loop    tgt_0F740
        mov     ax, word ptr es:[7eh]
        mov     byte ptr [AT_B_0A8AB], ah
        cmp     al, 0
        je      br_0F7BD
        mov     byte ptr [A1_B_0A88A], 1
        if      FW_VERSION >= 120
        mov     di, 3eh
        cmp     byte ptr es:[di], 49h
        jne     L_0F79F
        cmp     byte ptr es:[di+1], 5ah
        jne     L_0F79F
        cmp     byte ptr es:[di+2], 20h
        jne     L_0F79F
        cmp     byte ptr es:[di+3], 50h
        jne     L_0F79F
; XL_FOR_2K 0x0F781 (7 bytes): wheel_disarm.  span starts 3 bytes into
; `cmp es:[di+4],35h` (0x0F77E), ends 2 bytes into `cmp es:[di+5],32h`
; (0x0F785); both fragments re-emitted.
        ifdef   XL_FOR_2K
        db      026h, 080h, 07dh        ; head of the stock cmp es:[di+4], 35h
        XL2K_WHEEL_DISARM
        db      005h, 032h              ; tail of the stock cmp es:[di+5], 32h
        else
        cmp     byte ptr es:[di+4], 35h
        jne     L_0F79F
        cmp     byte ptr es:[di+5], 32h
        endif
        jne     L_0F79F
        cmp     byte ptr es:[di+6], 20h
        jne     L_0F79F
        cmp     byte ptr es:[di+7], 30h
        jne     L_0F79F
        mov     byte ptr [A1_B_0A88A], 0
        endif
L_0F79F:
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
        if      FW_VERSION >= 120
; XL_FOR_2K 0x0F7B9 (27 bytes): wheel_drain.  PINNED: app0's near CALL.  span
; starts 2 bytes into `mov ax,0efh` at 0x0F7B7 (fragment re-emitted); end at
; 0x0F7D3 is clean (last byte of `mov dx,1e2h`).
        ifdef   XL_FOR_2K
        db      0b8h, 0efh              ; head of the stock `mov ax, 0efh`
; 0x0F7BD is mid-instruction here; a `je 0F7BDh` outside the span targets it and
; its bytes are unchanged, so the symbol stays.
br_0F7BD                        equ     $+4
        XL2K_WHEEL_DRAIN
        else
        mov     ax, 0efh
        out     dx, ax
        clc
        ret
br_0F7BD:
        cmp     word ptr es:[88h], 0
        mov     ax, 2ch
        stc
        jne     L_0F7CA
        ret
L_0F7CA:
        mov     dx, 1ech
        mov     ax, 0a0h
        out     dx, ax
        mov     dx, 1e2h
        endif
        else
pending_step:
        mov     ax, 0efh
        out     dx, ax
        clc
        ret
br_0F7BD:
        cmp     word ptr es:[88h], 0
        mov     ax, 2ch
        stc
        jne     L_0F7CA
        ret
L_0F7CA:
        mov     dx, 1ech
        mov     ax, 0a0h
        out     dx, ax
        mov     dx, 1e2h
        endif
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
        else
last_ticks:
wi_ccw:
wi_ck:
wi_ck2:
wi_cw:
wi_delta:
wi_done:
wi_have_dir:
        mov     dx, 1eah
        in      ax, dx
        pop     dx
        if      FW_VERSION >= 112
        db      8ah, 0e8h, 81h, 0f9h, 14h, 0ebh, 0b8h, 2ch, 00h, 0f9h, 74h, 01h, 0c3h, 0bah, 0ech, 00h
        db      0b8h, 00h, 00h, 0efh, 0c6h, 06h, 8eh, 0a8h, 00h, 0e8h, 7ah, 02h, 73h, 01h, 0c3h, 0bah
        db      0ech, 01h, 0b8h, 0a0h, 00h, 0efh, 0bah, 0eeh, 01h, 0b8h, 0a1h, 00h, 0efh, 0e8h, 66h, 02h
        db      73h, 01h, 0c3h, 0b8h, 0a0h, 0e2h, 8eh, 0c0h, 0bfh, 00h, 00h, 0b9h, 00h, 01h, 0e8h, 93h
        db      02h, 73h, 01h, 0c3h, 52h, 0bah, 0e0h, 01h, 0edh, 5ah, 0abh, 0e2h, 0f1h, 26h, 0a1h, 7eh
        db      00h, 88h, 26h, 8fh, 0a8h, 3ch, 00h, 74h, 23h, 0c6h, 06h, 8eh, 0a8h, 01h, 0bah, 0ech
        db      01h, 0b8h, 0a0h, 00h, 0efh, 0bah, 0e2h, 01h, 0b8h, 03h, 00h, 0efh, 0bah, 0e4h, 01h, 0b8h
        db      01h, 00h, 0efh, 0bah, 0eeh, 01h, 0b8h, 0efh, 00h, 0efh, 0f8h, 0c3h, 26h, 83h, 3eh, 88h
        db      00h, 00h, 0b8h, 2ch, 00h, 0f9h, 75h, 01h, 0c3h, 0bah, 0ech, 01h, 0b8h, 0a0h, 00h, 0efh
        db      0bah, 0e2h, 01h, 0b8h, 03h, 00h, 0efh, 0bah, 0e4h, 01h, 0b8h, 01h, 00h, 0efh, 0bah, 0eeh
        db      01h, 0b8h, 0efh, 00h, 0efh, 0f8h, 0c3h
        elseif  FW_VERSION >= 110
        mov     ch, al
xl_ata_atapi_signature_test:
        cmp     cx, 0eb14h
        mov     ax, 2ch
        stc
        je      br_0F70F
        ret
br_0F70F:
        mov     dx, 0ech
        mov     ax, 0
        out     dx, ax
        mov     byte ptr [A1_B_0A88A], 0
        call    fn_0FBFE
        jae     br_0F721
        ret
br_0F721:
        mov     dx, 1ech
        mov     ax, 0a0h
        out     dx, ax
        mov     dx, 1eeh
        mov     ax, 0a1h
        out     dx, ax
        call    fn_0FBFE
        jae     br_0F735
        ret
br_0F735:
        mov     ax, 0e2a0h
        mov     es, ax
        mov     di, 0
        mov     cx, 100h
tgt_0F740:
        call    fn_0FC3C
        jae     L_0F4B1
        ret
L_0F4B1:
        push    dx
        mov     dx, 1e0h
        in      ax, dx
        pop     dx
        stosw
        loop    tgt_0F740
        mov     ax, word ptr es:[7eh]
        mov     byte ptr [AT_B_0A88B], ah
        cmp     al, 0
        je      br_0F7BD
        mov     byte ptr [A1_B_0A88A], 1
L_0F79F:
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
pending_step:
        mov     ax, 0efh
        out     dx, ax
        clc
        ret
br_0F7BD:
        cmp     word ptr es:[88h], 0
        mov     ax, 2ch
        stc
        jne     L_0F4F6
        ret
L_0F4F6:
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
        else
        db      8ah, 0e8h, 81h, 0f9h, 14h, 0ebh, 0b8h, 2ch, 00h, 0f9h, 74h, 01h, 0c3h, 0bah, 0ech, 00h
        db      0b8h, 00h, 00h, 0efh, 0c6h, 06h, 6ah, 0a8h, 00h, 0e8h, 79h, 02h, 73h, 01h, 0c3h, 0bah
        db      0ech, 01h, 0b8h, 0a0h, 00h, 0efh, 0bah, 0eeh, 01h, 0b8h, 0a1h, 00h, 0efh, 0e8h, 65h, 02h
        db      73h, 01h, 0c3h, 0b8h, 0a0h, 0e2h, 8eh, 0c0h, 0bfh, 00h, 00h, 0b9h, 00h, 01h, 0e8h, 92h
        db      02h, 73h, 01h, 0c3h, 52h, 0bah, 0e0h, 01h, 0edh, 5ah, 0abh, 0e2h, 0f1h, 26h, 0a1h, 7eh
        db      00h, 88h, 26h, 6bh, 0a8h, 3ch, 00h, 74h, 23h, 0c6h, 06h, 6ah, 0a8h, 01h, 0bah, 0ech
        db      01h, 0b8h, 0a0h, 00h, 0efh, 0bah, 0e2h, 01h, 0b8h, 03h, 00h, 0efh, 0bah, 0e4h, 01h, 0b8h
        db      01h, 00h, 0efh, 0bah, 0eeh, 01h, 0b8h, 0efh, 00h, 0efh, 0f8h, 0c3h, 26h, 83h, 3eh, 88h
        db      00h, 00h, 0b8h, 2ch, 00h, 0f9h, 75h, 01h, 0c3h, 0bah, 0ech, 01h, 0b8h, 0a0h, 00h, 0efh
        db      0bah, 0e2h, 01h, 0b8h, 03h, 00h, 0efh, 0bah, 0e4h, 01h, 0b8h, 01h, 00h, 0efh, 0bah, 0eeh
        db      01h, 0b8h, 0efh, 00h, 0efh, 0f8h, 0c3h
        endif
        endif
        if      FW_VERSION >= 120
L_0F7E8:
        mov     byte ptr [A1_B_0A88A], 0
        call    fn_0FBFE
        jae     L_0F7F3
        ret
L_0F7F3:
        mov     dx, 1ech
        mov     ax, 0a0h
        out     dx, ax
        mov     dx, 1eeh
        mov     ax, 0ech
        out     dx, ax
; XL_FOR_2K 0x0F803 (21 bytes): wheel_arm.  PINNED: app0's near CALL.  span
; starts 2 bytes into `call 0FBFEh` at 0x0F801 (fragment re-emitted).
        ifdef   XL_FOR_2K
        db      0e8h, 0fah              ; head of the stock `call 0FBFEh`
        XL2K_WHEEL_ARM
        else
        call    fn_0FBFE
        jae     L_0F807
        ret
L_0F807:
        mov     ax, ds
        mov     es, ax
        mov     di, 0a8b2h
        mov     cx, 100h
L_0F811:
        call    fn_0FC3C
        jae     L_0F817
        ret
L_0F817:
        push    dx
        endif
; XL_FOR_2K 0x0F818 (41 bytes): play_gate.  span ends 1 byte into
; `mov bx,[di+0eh]` at 0x0F83F; that byte is re-emitted.
        ifdef   XL_FOR_2K
        XL2K_PLAY_GATE_BODY
        db      00eh                    ; tail of the stock `mov bx, [di+0eh]`
        else
        mov     dx, 1e0h
        in      ax, dx
        pop     dx
        stosw
        loop    L_0F811
        mov     ax, word ptr [AT_W_0A8B2]
        cmp     ax, 848ah
        je      L_0F832
        cmp     ax, 35c3h
        je      L_0F832
        mov     ax, 2ch
        stc
        ret
L_0F832:
        mov     byte ptr [A1_B_0A88A], 0
        mov     byte ptr [AT_B_0A8AC], 1
        mov     di, 0a8b2h
        mov     bx, word ptr [di+0eh]
        endif
        mov     cx, word ptr [di+10h]
        mov     word ptr [AT_W_0A8AE], cx
        mov     word ptr [AT_W_0A8B0], bx
        mov     dx, 1e2h
        mov     ax, 3
        out     dx, ax
        mov     dx, 1e4h
        mov     ax, 1
        out     dx, ax
        mov     dx, 1e6h
        mov     ax, 0
        out     dx, ax
        mov     dx, 1e8h
        mov     ax, 0
        out     dx, ax
        mov     dx, 1eah
        mov     ax, 0
        out     dx, ax
        mov     dx, 1ech
        mov     ax, 0e0h
        out     dx, ax
        mov     dx, 1eeh
        mov     ax, 0efh
        out     dx, ax
        clc
        ret
        endif
tgt_0F880:
        if      FW_VERSION >= 120
        cmp     byte ptr [AT_B_0A8AC], 0
        jne     L_0F8A3
        endif
        mov     word ptr [P_A864], di
        mov     word ptr [P_A866], dx
        mov     word ptr [P_A868], cx
        if      FW_VERSION >= 114
        call    fn_0FBE9
        elseif  FW_VERSION >= 110
        db      0e8h, 0cbh, 01h
        else
        db      0e8h, 0cah, 01h
        endif
        mov     byte ptr ds:[bp], 12h
        mov     byte ptr ds:[bp+4], cl
        if      (FW_VERSION >= 110) && (FW_VERSION < 114)
        db      0e8h, 0f4h, 00h
        else
        call    fn_0FAA7
        endif
        ret
        if      FW_VERSION >= 120
L_0F8A3:
        mov     es, dx
        sub     ax, ax
        mov     byte ptr es:[di], al
        mov     si, 0a8e8h
        add     di, 8
        mov     cx, 1ch
        rep movsb
        clc
        ret
        endif
tgt_0F8B7:
        if      FW_VERSION >= 120
        cmp     byte ptr [AT_B_0A8AC], 0
        jne     L_0F904
        endif
        mov     word ptr [P_A864], P_A86A
        mov     word ptr [P_A866], ds
        mov     word ptr [P_A868], 8
        if      FW_VERSION >= 114
        call    fn_0FBE9
        elseif  FW_VERSION >= 110
        db      0e8h, 0abh, 01h
        else
        db      0e8h, 0aah, 01h
        endif
        mov     byte ptr ds:[bp], 25h
        if      (FW_VERSION >= 110) && (FW_VERSION < 114)
        db      0e8h, 0d8h, 00h
        else
        call    fn_0FAA7
        endif
        mov     bp, P_A86A
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
        if      FW_VERSION >= 110
        clc
        endif
        ret
        if      FW_VERSION >= 120
L_0F904:
        mov     ax, word ptr [AT_W_0A8AE]
        mov     dx, word ptr [AT_W_0A8B0]
        mov     bx, 0
        mov     cx, 200h
        clc
        ret
        endif
tgt_0F913:
        if      FW_VERSION >= 120
        cmp     byte ptr [AT_B_0A8AC], 0
        jne     L_0F94F
        endif
        if      FW_VERSION >= 114
        call    fn_0FBE9
        elseif  FW_VERSION >= 112
        db      0e8h, 75h, 01h
        elseif  FW_VERSION >= 110
        call    fn_0FBE9
        else
        db      0e8h, 75h, 01h
        endif
        mov     word ptr [P_A868], 0
        mov     byte ptr ds:[bp], 4
        if      FW_VERSION >= 114
        call    fn_0FAB6
        jb      br_0F92E
        else
        db      0e8h, 0abh, 00h
        db      72h, 01h
        endif
        ret
        if      FW_VERSION <> 112
br_0F92E:
        call    fn_0FBFE
        mov     bx, 14h
loop_0F934:
        push    dx
        mov     dx, 1e2h
        in      ax, dx
        pop     dx
        test    al, 4
        stc
        je      br_0F940
        ret
br_0F940:
        dec     bx
        stc
        mov     ax, 18h
        jne     L_0F5A4
        ret
L_0F5A4:
        push    bx
        call    fn_0FBFE
        pop     bx
        jmp     loop_0F934
        else
        db      0e8h, 76h, 01h
        db      0bbh, 14h, 00h, 52h, 0bah, 0e2h, 01h, 0edh, 5ah, 0a8h, 04h, 0f9h, 74h, 01h, 0c3h, 4bh
        db      0f9h, 0b8h, 18h, 00h, 75h, 01h, 0c3h, 53h, 0e8h, 5bh, 01h, 5bh, 0ebh, 0e5h
        endif
        if      FW_VERSION >= 120
L_0F94F:
        clc
        ret
        endif
tgt_0F951:
        if      FW_VERSION >= 120
        cmp     byte ptr [AT_B_0A8AC], 0
        jne     L_0F98B
        endif
        mov     word ptr [P_A864], di
        mov     word ptr [P_A866], es
        if      FW_VERSION >= 114
        call    fn_0FBE9
        else
        db      0e8h, 38h, 01h
        endif
        mov     byte ptr ds:[bp], 28h
        mov     byte ptr ds:[bp+2], dh
        mov     byte ptr ds:[bp+3], dl
        mov     byte ptr ds:[bp+4], ah
        mov     byte ptr ds:[bp+5], al
        mov     byte ptr ds:[bp+7], ch
        mov     byte ptr ds:[bp+8], cl
        shl     cx, 9
        if      FW_VERSION >= 114
        mov     word ptr [P_A868], cx
        call    fn_0FAA7
        ret
L_0F98B:
        else
        mov     word ptr [A1_W_0A868], cx
        db      0e8h, 46h, 00h
        db      0c3h
        endif
        if      FW_VERSION < 120
tgt_0F9BE:
        endif
        if      FW_VERSION >= 110
        mov     word ptr [P_A864], di
        mov     word ptr [P_A866], es
        if      FW_VERSION >= 120
        call    fn_0FBE9
        mov     byte ptr ds:[bp+7], 20h
        and     dh, 0fh
        or      dh, 0e0h
        mov     byte ptr ds:[bp+6], dh
        mov     byte ptr ds:[bp+5], dl
        mov     byte ptr ds:[bp+4], ah
        mov     byte ptr ds:[bp+3], al
        mov     byte ptr ds:[bp+2], cl
        mov     byte ptr ds:[bp+1], 0
        call    fn_0FB72
        ret
tgt_0F9BE:
        cmp     byte ptr [AT_B_0A8AC], 0
        jne     L_0F9F8
        mov     word ptr [P_A864], di
        mov     word ptr [P_A866], es
        endif
        if      FW_VERSION >= 114
        call    fn_0FBE9
        else
        db      0e8h, 05h, 01h
        endif
        mov     byte ptr ds:[bp], 2ah
        else
        db      89h, 3eh, 24h, 0a8h, 8ch, 06h, 26h, 0a8h, 0e8h, 05h, 01h, 3eh, 0c6h, 46h, 00h, 2ah
        endif
        mov     byte ptr ds:[bp+2], dh
        mov     byte ptr ds:[bp+3], dl
        mov     byte ptr ds:[bp+4], ah
        mov     byte ptr ds:[bp+5], al
        if      FW_VERSION >= 110
        mov     byte ptr ds:[bp+7], ch
        mov     byte ptr ds:[bp+8], cl
        shl     cx, 9
        if      FW_VERSION >= 114
        mov     word ptr [P_A868], cx
        call    fn_0FAA7
        else
        mov     word ptr [A1_W_0A868], cx
        db      0e8h, 13h, 00h, 0c3h
tgt_0FA2F:
        db      0e8h, 0dah, 00h
        mov     word ptr [P_A868], 0
        mov     byte ptr ds:[bp], 0
        db      0e8h, 01h, 00h
        endif
        else
        db      3eh, 88h, 6eh, 07h, 3eh, 88h, 4eh, 08h, 0c1h, 0e1h, 09h, 89h, 0eh, 28h, 0a8h, 0e8h
        db      13h, 00h, 0c3h
tgt_0FA2F:
        db      0e8h, 0dah, 00h
        mov     word ptr [P_A868], 0
        mov     byte ptr ds:[bp], 0
        db      0e8h, 01h, 00h
        endif
        ret
        if      FW_VERSION >= 120
L_0F9F8:
        mov     word ptr [P_A864], di
        mov     word ptr [P_A866], es
        call    fn_0FBE9
        mov     byte ptr ds:[bp+7], 38h
        and     dh, 0fh
        or      dh, 0e0h
        mov     byte ptr ds:[bp+6], dh
        mov     byte ptr ds:[bp+5], dl
        mov     byte ptr ds:[bp+4], ah
        mov     byte ptr ds:[bp+3], al
        mov     byte ptr ds:[bp+2], cl
        mov     byte ptr ds:[bp+1], 0
        mov     word ptr [P_A868], cx
        call    fn_0FB72
        ret
        endif
        if      FW_VERSION >= 114
tgt_0FA2F:
        if      FW_VERSION >= 120
        cmp     byte ptr [AT_B_0A8AC], 0
        jne     L_0FA48
        endif
        call    fn_0FBE9
        mov     word ptr [P_A868], 0
        mov     byte ptr ds:[bp], 0
        call    fn_0FAA7
        elseif  FW_VERSION >= 112
        db      0e8h, 0f8h, 00h
        db      0e8h, 0dah, 00h
        db      73h, 01h
        else
fn_0FAA7:
        call    fn_0FC19
        call    fn_0FBFE
        if      FW_VERSION >= 110
        jae     br_0FAB0
        else
        db      73h, 01h
        endif
        endif
        if      FW_VERSION >= 120
        ret
L_0FA48:
        clc
        endif
        ret
        if      FW_VERSION >= 114
tgt_0FA4A:
        mov     word ptr [P_A864], 0a86ah
        mov     word ptr [P_A866], ds
        mov     word ptr [P_A868], 0eh
        call    fn_0FBE9
        mov     byte ptr ds:[bp], 55h
        mov     byte ptr ds:[bp+1], 10h
        mov     byte ptr ds:[bp+7], 0
        mov     byte ptr ds:[bp+8], 0eh
        mov     ax, ds
        mov     es, ax
        mov     di, 0a86ah
        mov     cx, 4
        mov     ax, 0
        rep stosw
        mov     byte ptr [di], 2fh
        mov     byte ptr [di+1], 4
        mov     byte ptr [di+2], 5ch
        mov     byte ptr [di+3], 1
        mov     byte ptr [di+4], 0ffh
        mov     byte ptr [di+5], 0fh
        call    fn_0FAA7
        elseif  (FW_VERSION >= 110) && (FW_VERSION < 112)
br_0FAB0:
        call    fn_0FB28
        jae     fn_0FAB6
        else
        db      0e8h, 75h, 00h
        db      73h, 01h
        endif
        ret
        if      FW_VERSION < 112
fn_0FAB6:
        endif
        if      FW_VERSION >= 114
tgt_0FA9B:
        call    fn_0FBE9
        mov     byte ptr ds:[bp], 1
        call    fn_0FAA7
        ret
fn_0FAA7:
        call    fn_0FC19
        call    fn_0FBFE
        jae     br_0FAB0
        ret
br_0FAB0:
        call    fn_0FB28
        jae     fn_0FAB6
        ret
fn_0FAB6:
        endif
        mov     ah, 0
        mov     cx, word ptr [P_A868]
        mov     al, cl
        mov     dx, 1e8h
        if      FW_VERSION >= 114
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
        mov     si, 0a858h
        mov     cx, 6
        call    fn_0FBFE
        jae     br_0FAE5
        ret
br_0FAE5:
        call    fn_0FC3C
        jae     br_0FAEB
        ret
br_0FAEB:
        cli
tgt_0FAEC:
        lodsw
        mov     dx, 1e0h
        out     dx, ax
        shl     ax, 3
        loop    tgt_0FAEC
        sti
        call    fn_0FBFE
        jae     br_0FAFD
        ret
br_0FAFD:
        call    fn_0FB28
        jae     br_0FB03
        ret
br_0FB03:
        push    dx
        mov     dx, 1eeh
        in      ax, dx
        pop     dx
        test    al, 8
        jne     br_0FB0E
        ret
br_0FB0E:
        push    dx
        mov     dx, 1e4h
        in      ax, dx
        pop     dx
        and     al, 3
        cmp     al, 0
        jne     br_0FB1D
        jmp     br_0FD3E
br_0FB1D:
        cmp     al, 2
        jne     br_0FB24
        jmp     xl_ata_pio_data_phase
br_0FB24:
        mov     al, 2eh
        stc
        ret
fn_0FB28:
        push    dx
        mov     dx, 1eeh
        in      ax, dx
        pop     dx
        test    al, 1
        jne     br_0FB33
        ret
br_0FB33:
        push    dx
        mov     dx, 1e2h
        in      ax, dx
        pop     dx
        shr     al, 4
        cmp     al, 0
        jne     br_0FB41
        ret
br_0FB41:
        cmp     al, 2
        je      br_0FB59
        cmp     al, 3
        je      br_0FB5E
        cmp     al, 4
        je      br_0FB63
        cmp     al, 6
        je      br_0FB68
        cmp     al, 7
        je      br_0FB6D
        mov     al, 2eh
        stc
        ret
br_0FB59:
        mov     ax, 2fh
        stc
        ret
br_0FB5E:
        mov     ax, 4
        stc
        ret
br_0FB63:
        mov     ax, 30h
        stc
        ret
br_0FB68:
        mov     ax, 1dh
        stc
        ret
br_0FB6D:
        mov     ax, 1
        stc
        ret
        if      FW_VERSION >= 120
fn_0FB72:
        call    fn_0FC19
        call    fn_0FBFE
        jae     br_0FB7B
        ret
br_0FB7B:
        call    fn_0FB28
        jae     L_0FB81
        ret
L_0FB81:
        mov     ah, 0
        mov     si, 0a858h
        mov     al, byte ptr [si]
        inc     si
        mov     al, byte ptr [si]
        inc     si
        mov     dx, 1e2h
        out     dx, ax
xl_ata_issue_command_block:
        mov     al, byte ptr [si]
        inc     si
        mov     cx, ax
        shl     cx, 9
        mov     word ptr [P_A868], cx
        mov     dx, 1e4h
        out     dx, ax
        mov     al, byte ptr [si]
        inc     si
        mov     dx, 1e6h
        out     dx, ax
        mov     al, byte ptr [si]
        inc     si
        mov     dx, P_01E8
        out     dx, ax
        mov     al, byte ptr [si]
        inc     si
        mov     dx, 1eah
        out     dx, ax
        mov     al, byte ptr [si]
        inc     si
        mov     dx, 1ech
        out     dx, ax
        mov     al, byte ptr [si]
        inc     si
        mov     dx, 1eeh
        out     dx, ax
        shl     ax, 0fh
        call    fn_0FBFE
        jae     br_0FBCC
        ret
br_0FBCC:
        call    fn_0FB28
        jae     L_0FBD2
        ret
L_0FBD2:
        push    dx
        mov     dx, 1eeh
        in      ax, dx
        pop     dx
        test    al, 8
        jne     L_0FBDD
        ret
L_0FBDD:
        cmp     byte ptr [AT_B_0A85F], 20h
        jne     L_0FBE6
        jmp     xl_ata_pio_data_phase
L_0FBE6:
        jmp     br_0FD3E
        endif
fn_0FBE9:
        pusha
        mov     ax, ds
        mov     es, ax
        mov     di, 0a858h
        mov     cx, 6
        mov     ax, 0
        rep stosw
        popa
        mov     bp, 0a858h
        ret
fn_0FBFE:
        call    fn_0FE57
        push    dx
        mov     dx, 0ech
        in      ax, dx
        pop     dx
loop_0FC07:
        call    fn_0FE5D
        jae     br_0FC0D
        ret
br_0FC0D:
        push    dx
        mov     dx, 1eeh
        in      ax, dx
        pop     dx
xl_ata_wait_not_busy:
        test    al, 80h
        jne     loop_0FC07
        clc
        ret
fn_0FC19:
        push    dx
        mov     dx, 1eeh
        in      ax, dx
        pop     dx
        test    al, 8
        jne     br_0FC24
        ret
br_0FC24:
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
fn_0FC3C:
        call    fn_0FE57
        push    dx
        mov     dx, 0ech
        in      ax, dx
        pop     dx
loop_0FC45:
        call    fn_0FE5D
        jae     br_0FC4B
        ret
br_0FC4B:
        push    dx
        mov     dx, 1eeh
        in      ax, dx
        pop     dx
xl_ata_wait_drq:
        test    al, 8
        je      loop_0FC45
        clc
        ret
xl_ata_pio_data_phase:
        cmp     byte ptr [A1_B_0A88A], 1
        je      br_0FCC0
        mov     cx, word ptr [P_A868]
        shr     cx, 1
        les     di, [P_A864]
        cmp     cx, 100h
        jb      L_0F7A3
loop_0FC6E:
        push    cx
        call    L_0F782
        pop     cx
        jae     br_0FC76
        ret
br_0FC76:
        sub     cx, 100h
        jne     loop_0FC6E
        ret
L_0F782:
        mov     bx, 0ffffh
loop_0FC80:
        push    dx
        mov     dx, 1eeh
        in      ax, dx
        pop     dx
        if      FW_VERSION >= 120
        and     al, 88h
        cmp     al, 8
        je      br_0FC94
        else
        and     al, 8
        jne     br_0FC94
        endif
        dec     bx
        jne     loop_0FC80
        mov     ax, 9
        stc
        ret
br_0FC94:
        mov     dx, 1e0h
        mov     cx, 100h
        cli
        rep insw
        sti
        clc
        ret
L_0F7A3:
        if      FW_VERSION >= 120
        mov     bx, 0ffffh
L_0FCA3:
        push    dx
        else
        mov     si, 0ffffh
        mov     bl, 8
        cli
L_0F7A9:
        endif
        mov     dx, 1eeh
        in      ax, dx
        if      FW_VERSION >= 120
        pop     dx
        and     al, 88h
        cmp     al, 8
        je      L_0FCB7
        dec     bx
        jne     L_0FCA3
        else
        and     al, bl
        je      L_0F7BA
L_0F7B1:
        mov     dx, 1e0h
        in      ax, dx
        stosw
        loop    L_0F7A9
        clc
        ret
L_0F7BA:
        mov     bp, si
L_0F7BC:
        in      ax, dx
        and     al, bl
        jne     L_0F7B1
        dec     bp
        jne     L_0F7BC
        sti
        endif
        mov     ax, 9
        stc
        if      FW_VERSION >= 120
        ret
L_0FCB7:
        mov     dx, 1e0h
        cli
        rep insw
        sti
        clc
        endif
        ret
br_0FCC0:
        call    fn_0FC3C
        jae     br_0FCC6
        ret
br_0FCC6:
        mov     cx, word ptr [P_A868]
        shr     cx, 1
        les     di, [P_A864]
        call    fn_0FE4E
        mov     dx, ASIC_DMA_MODE
        mov     al, 1
        out     dx, al
        mov     dx, ASIC_DMA_C038
        mov     al, 10h
        out     dx, al
        mov     dx, ASIC_DMA_DIR
        mov     al, 1
        out     dx, al
        mov     dx, ASIC_DMA_C031
        mov     al, 1
        out     dx, al
        push    dx
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        pop     dx
        or      al, 2
        mov     dx, ASIC_DMA_C03F
        out     dx, al
        mov     ax, es
        push    cx
        mov     cx, 4
        sub     bl, bl
tgt_0FCFF:
        shl     ax, 1
        rcl     bl, 1
        loop    tgt_0FCFF
        pop     cx
        add     ax, di
        adc     bl, 0
        mov     dx, ASIC_DMA_ADDR
        out     dx, ax
        mov     al, bl
        int     8eh
        mov     dx, ASIC_DMA_ADDR_HI
        out     dx, al
        mov     ax, cx
        dec     ax
        mov     dx, ASIC_DMA_COUNT
        out     dx, ax
        mov     dx, ASIC_DMA_C03A
        mov     al, 5
        out     dx, al
        push    dx
        mov     dx, ASIC_DMA_STATUS
        in      al, dx
        pop     dx
        push    dx
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        pop     dx
        and     al, 0fdh
        mov     dx, ASIC_DMA_C03F
        out     dx, al
        call    fn_0FE3B
        jb      br_0FD3C
        ret
br_0FD3C:
        stc
        ret
br_0FD3E:
        cmp     byte ptr [A1_B_0A88A], 1
        je      br_0FDBE
        call    fn_0FC3C
        jae     br_0FD4B
        ret
br_0FD4B:
        mov     cx, word ptr [P_A868]
        shr     cx, 1
        les     si, [P_A864]
        mov     bp, es
        cmp     cx, 100h
        jb      L_0F89E
loop_0FD5D:
        push    cx
        call    L_0F879
        pop     cx
        jae     br_0FD65
        ret
br_0FD65:
        sub     cx, 100h
        jne     loop_0FD5D
        ret
L_0F879:
        mov     bx, 0ffffh
loop_0FD6F:
        push    dx
        mov     dx, 1eeh
        in      ax, dx
        pop     dx
        and     al, 8
        jne     br_0FD81
        dec     bx
        jne     loop_0FD6F
        mov     ax, 5
        stc
        ret
br_0FD81:
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
L_0F89E:
        mov     dx, 1e0h
L_0F8A1:
        mov     bx, 0ffffh
loop_0FD97:
        push    dx
        mov     dx, 1eeh
        in      ax, dx
        pop     dx
        test    al, 8
        je      br_0FDB2
        mov     ax, word ptr es:[si]
        add     si, 2
        mov     dx, 1e0h
        out     dx, ax
        loop    L_0F8A1
        call    fn_0FBFE
        clc
        ret
br_0FDB2:
        shl     ax, 8
        dec     bx
        jne     loop_0FD97
        sti
        mov     ax, 5
        stc
        ret
br_0FDBE:
        call    fn_0FC3C
        jae     br_0FDC4
        ret
br_0FDC4:
        mov     cx, word ptr [P_A868]
        shr     cx, 1
        les     si, [P_A864]
        call    fn_0FE4E
        mov     dx, ASIC_DMA_MODE
        mov     al, 1
        out     dx, al
        mov     dx, ASIC_DMA_C038
        mov     al, 10h
        out     dx, al
        mov     dx, ASIC_DMA_DIR
        mov     al, 1
        out     dx, al
        mov     dx, ASIC_DMA_C031
        mov     al, 1
        out     dx, al
        push    dx
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        pop     dx
        or      al, 2
        mov     dx, ASIC_DMA_C03F
        out     dx, al
        mov     ax, es
        push    cx
        mov     cx, 4
        sub     bl, bl
tgt_0FDFD:
        shl     ax, 1
        rcl     bl, 1
        loop    tgt_0FDFD
        pop     cx
        add     ax, si
        adc     bl, 0
        mov     dx, ASIC_DMA_ADDR
        out     dx, ax
        mov     al, bl
        int     8eh
        mov     dx, ASIC_DMA_ADDR_HI
        out     dx, al
        mov     ax, cx
        dec     ax
        mov     dx, ASIC_DMA_COUNT
        out     dx, ax
        mov     dx, ASIC_DMA_C03A
        mov     al, 9
        out     dx, al
        push    dx
        mov     dx, ASIC_DMA_STATUS
        in      al, dx
        pop     dx
        push    dx
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        pop     dx
        and     al, 0fdh
        mov     dx, ASIC_DMA_C03F
        out     dx, al
        call    fn_0FE3B
        jb      L_0FB44
        ret
L_0FB44:
        ret
fn_0FE3B:
        call    fn_0FE57
loop_0FE3E:
        call    fn_0FE5D
        jae     br_0FE44
        ret
br_0FE44:
        mov     al, 1
        int     92h
        cmp     al, 0
        je      loop_0FE3E
        clc
        ret
fn_0FE4E:
        push    es
        pusha
        mov     al, 0
        int     92h
        popa
        pop     es
        ret
fn_0FE57:
        int     77h
        mov     word ptr [A1_W_0A888], ax
        ret
fn_0FE5D:
        int     77h
        sub     ax, word ptr [A1_W_0A888]
xl_ata_related_fe63:
        cmp     ax, 4e20h
        mov     ax, 2dh
        cmc
        ret
        elseif  FW_VERSION >= 112
        db      0efh, 8ah, 0c5h, 0bah, 0eah, 01h, 0efh, 0bah, 0ech, 01h, 0b8h, 0a0h, 00h, 0efh, 0bah, 0eeh
        db      01h, 0b8h, 0a0h, 00h, 0efh, 0c1h, 0e0h, 07h, 0beh, 3ch, 0a8h, 0b9h, 06h, 00h, 0e8h, 0a5h
        db      00h, 73h, 01h, 0c3h, 0e8h, 0ddh, 00h, 73h, 01h, 0c3h, 0fah, 0adh, 0bah, 0e0h, 01h, 0efh
        db      0c1h, 0e0h, 03h, 0e2h, 0f6h, 0fbh, 0e8h, 8dh, 00h, 73h, 01h, 0c3h, 0e8h, 28h, 00h, 73h
        db      01h, 0c3h, 52h, 0bah, 0eeh, 01h, 0edh, 5ah, 0a8h, 08h, 75h, 01h, 0c3h, 52h, 0bah, 0e4h
        db      01h, 0edh, 5ah, 24h, 03h, 3ch, 00h, 75h, 03h, 0e9h, 0b2h, 01h, 3ch, 02h, 75h, 03h
        db      0e9h, 0bch, 00h, 0b0h, 2eh, 0f9h, 0c3h, 52h, 0bah, 0eeh, 01h, 0edh, 5ah, 0a8h, 01h, 75h
        db      01h, 0c3h, 52h, 0bah, 0e2h, 01h, 0edh, 5ah, 0c0h, 0e8h, 04h, 3ch, 00h, 75h, 01h, 0c3h
        db      3ch, 02h, 74h, 14h, 3ch, 03h, 74h, 15h, 3ch, 04h, 74h, 16h, 3ch, 06h, 74h, 17h ; <.t.<.t.<.t.<.t.
        db      3ch, 07h, 74h, 18h, 0b0h, 2eh, 0f9h, 0c3h, 0b8h, 2fh, 00h, 0f9h, 0c3h, 0b8h, 04h, 00h
        db      0f9h, 0c3h, 0b8h, 30h, 00h, 0f9h, 0c3h, 0b8h, 1dh, 00h, 0f9h, 0c3h, 0b8h, 01h, 00h, 0f9h
        db      0c3h, 60h, 8ch, 0d8h, 8eh, 0c0h, 0bfh, 3ch, 0a8h, 0b9h, 06h, 00h, 0b8h, 00h, 00h, 0f3h
        db      0abh, 61h, 0bdh, 3ch, 0a8h, 0c3h, 0e8h, 60h, 02h, 52h, 0bah, 0ech, 00h, 0edh, 5ah, 0e8h
        db      5dh, 02h, 73h, 01h, 0c3h, 52h, 0bah, 0eeh, 01h, 0edh, 5ah, 0a8h, 80h, 75h, 0f0h, 0f8h
        db      0c3h, 52h, 0bah, 0eeh, 01h, 0edh, 5ah, 0a8h, 08h, 75h, 01h, 0c3h, 52h, 0bah, 0e2h, 01h
        db      0edh, 5ah, 8bh, 0d8h, 52h, 0bah, 0e4h, 01h, 0edh, 5ah, 8bh, 0c8h, 0bah, 0eeh, 01h, 0b8h
        db      08h, 00h, 0efh, 0c3h, 0e8h, 22h, 02h, 52h, 0bah, 0ech, 00h, 0edh, 5ah, 0e8h, 1fh, 02h
        db      73h, 01h, 0c3h, 52h, 0bah, 0eeh, 01h, 0edh, 5ah, 0a8h, 08h, 74h, 0f0h, 0f8h, 0c3h, 80h
        db      3eh, 8eh, 0a8h, 01h, 74h, 67h, 8bh, 0eh, 4ch, 0a8h, 0d1h, 0e9h, 0c4h, 3eh, 48h, 0a8h
        db      81h, 0f9h, 00h, 01h, 72h, 30h, 51h, 0e8h, 0bh, 00h, 59h, 73h, 01h, 0c3h, 81h, 0e9h
        db      00h, 01h, 75h, 0f2h, 0c3h, 0bbh, 0ffh, 0ffh, 52h, 0bah, 0eeh, 01h, 0edh, 5ah, 24h, 08h
        db      75h, 08h, 4bh, 75h, 0f3h, 0b8h, 09h, 00h, 0f9h, 0c3h, 0bah, 0e0h, 01h, 0b9h, 00h, 01h
        db      0fah, 0f3h, 6dh, 0fbh, 0f8h, 0c3h, 0beh, 0ffh, 0ffh, 0b3h, 08h, 0fah, 0bah, 0eeh, 01h, 0edh
        db      22h, 0c3h, 74h, 09h, 0bah, 0e0h, 01h, 0edh, 0abh, 0e2h, 0f1h, 0f8h, 0c3h, 8bh, 0eeh, 0edh
        db      22h, 0c3h, 75h, 0f0h, 4dh, 75h, 0f8h, 0fbh, 0b8h, 09h, 00h, 0f9h, 0c3h, 0e8h, 74h, 0ffh
        db      73h, 01h, 0c3h, 8bh, 0eh, 4ch, 0a8h, 0d1h, 0e9h, 0c4h, 3eh, 48h, 0a8h, 0e8h, 80h, 01h
        db      0bah, 30h, 0c0h, 0b0h, 01h, 0eeh, 0bah, 38h, 0c0h, 0b0h, 10h, 0eeh, 0bah, 39h, 0c0h, 0b0h
        db      01h, 0eeh, 0bah, 31h, 0c0h, 0b0h, 01h, 0eeh, 52h, 0bah, 3fh, 0c0h, 0ech, 5ah, 0ch, 02h
        db      0bah, 3fh, 0c0h, 0eeh, 8ch, 0c0h, 51h, 0b9h, 04h, 00h, 2ah, 0dbh, 0d1h, 0e0h, 0d0h, 0d3h
        db      0e2h, 0fah, 59h, 03h, 0c7h, 80h, 0d3h, 00h, 0bah, 34h, 0c0h, 0efh, 8ah, 0c3h, 0cdh, 8eh
        db      0bah, 36h, 0c0h, 0eeh, 8bh, 0c1h, 48h, 0bah, 32h, 0c0h, 0efh, 0bah, 3ah, 0c0h, 0b0h, 05h
        db      0eeh, 52h, 0bah, 3bh, 0c0h, 0ech, 5ah, 52h, 0bah, 3fh, 0c0h, 0ech, 5ah, 24h, 0fdh, 0bah
        db      3fh, 0c0h, 0eeh, 0e8h, 07h, 01h, 72h, 01h, 0c3h, 0b8h, 09h, 00h, 0f9h, 0c3h, 80h, 3eh
        db      8eh, 0a8h, 01h, 74h, 79h, 0e8h, 0ech, 0feh, 73h, 01h, 0c3h, 8bh, 0eh, 4ch, 0a8h, 0d1h
        db      0e9h, 0c4h, 36h, 48h, 0a8h, 8ch, 0c5h, 81h, 0f9h, 00h, 01h, 72h, 34h, 51h, 0e8h, 0bh
        db      00h, 59h, 73h, 01h, 0c3h, 81h, 0e9h, 00h, 01h, 75h, 0f2h, 0c3h, 0bbh, 0ffh, 0ffh, 52h
        db      0bah, 0eeh, 01h, 0edh, 5ah, 24h, 08h, 75h, 08h, 4bh, 75h, 0f3h, 0b8h, 05h, 00h, 0f9h
        db      0c3h, 0bah, 0e0h, 01h, 0b9h, 00h, 01h, 1eh, 8eh, 0ddh, 0fah, 0f3h, 6fh, 0fbh, 1fh, 0f8h
        db      0c3h, 0bah, 0e0h, 01h, 0bbh, 0ffh, 0ffh, 52h, 0bah, 0eeh, 01h, 0edh, 5ah, 0a8h, 08h, 74h
        db      11h, 26h, 8bh, 04h, 83h, 0c6h, 02h, 0bah, 0e0h, 01h, 0efh, 0e2h, 0e7h, 0e8h, 46h, 0feh
        db      0f8h, 0c3h, 0c1h, 0e0h, 08h, 4bh, 75h, 0dfh, 0fbh, 0b8h, 05h, 00h, 0f9h, 0c3h, 0e8h, 73h
        db      0feh, 73h, 01h, 0c3h, 8bh, 0eh, 4ch, 0a8h, 0d1h, 0e9h, 0c4h, 36h, 48h, 0a8h, 0e8h, 7fh
        db      00h, 0bah, 30h, 0c0h, 0b0h, 01h, 0eeh, 0bah, 38h, 0c0h, 0b0h, 10h, 0eeh, 0bah, 39h, 0c0h
        db      0b0h, 01h, 0eeh, 0bah, 31h, 0c0h, 0b0h, 01h, 0eeh, 52h, 0bah, 3fh, 0c0h, 0ech, 5ah, 0ch
        db      02h, 0bah, 3fh, 0c0h, 0eeh, 8ch, 0c0h, 51h, 0b9h, 04h, 00h, 2ah, 0dbh, 0d1h, 0e0h, 0d0h
        db      0d3h, 0e2h, 0fah, 59h, 03h, 0c6h, 80h, 0d3h, 00h, 0bah, 34h, 0c0h, 0efh, 8ah, 0c3h, 0cdh
        db      8eh, 0bah, 36h, 0c0h, 0eeh, 8bh, 0c1h, 48h, 0bah, 32h, 0c0h, 0efh, 0bah, 3ah, 0c0h, 0b0h
        db      09h, 0eeh, 52h, 0bah, 3bh, 0c0h, 0ech, 5ah, 52h, 0bah, 3fh, 0c0h, 0ech, 5ah, 24h, 0fdh
        db      0bah, 3fh, 0c0h, 0eeh, 0e8h, 06h, 00h, 72h, 01h, 0c3h, 0b0h, 05h, 0c3h, 0e8h, 19h, 00h
        db      0e8h, 1ch, 00h, 73h, 01h, 0c3h, 0b0h, 01h, 0cdh, 92h, 3ch, 00h, 74h, 0f2h, 0f8h, 0c3h
        db      06h, 60h, 0b0h, 00h, 0cdh, 92h, 61h, 07h, 0c3h, 0cdh, 77h, 0a3h, 8ch, 0a8h, 0c3h, 0cdh
        db      77h, 2bh, 06h, 8ch, 0a8h, 3dh, 0b8h, 0bh, 0f5h, 0b8h, 2dh, 00h, 0c3h, 00h, 00h, 00h
        else
        out     dx, ax
        if      FW_VERSION >= 110
        mov     al, ch
        mov     dx, 1eah
        out     dx, ax
        mov     dx, 1ech
        mov     ax, 0a0h
        out     dx, ax
        mov     dx, P_01E8
        mov     ax, 0a0h
        out     dx, ax
        shl     ax, 7
        mov     si, 0a838h
        mov     cx, 6
        call    fn_0FBFE
        jae     br_0FAE5
        ret
br_0FAE5:
        call    fn_0FC3C
        jae     br_0FAEB
        ret
br_0FAEB:
        cli
tgt_0FAEC:
        lodsw
        mov     dx, 1e0h
        out     dx, ax
        shl     ax, 3
        loop    tgt_0FAEC
        sti
        call    fn_0FBFE
        jae     br_0FAFD
        ret
br_0FAFD:
        call    fn_0FB28
        jae     br_0FB03
        ret
br_0FB03:
        push    dx
        mov     dx, 1eeh
        in      ax, dx
        pop     dx
        test    al, 8
        jne     br_0FB0E
        ret
br_0FB0E:
        push    dx
        mov     dx, 1e4h
        in      ax, dx
        pop     dx
        and     al, 3
        cmp     al, 0
        jne     br_0FB1D
        jmp     br_0FD3E
br_0FB1D:
        cmp     al, 2
        jne     br_0FB24
        jmp     xl_ata_pio_data_phase
br_0FB24:
        mov     al, 2eh
        stc
        ret
fn_0FB28:
        push    dx
        mov     dx, 1eeh
        in      ax, dx
        pop     dx
        test    al, 1
        jne     br_0FB33
        ret
br_0FB33:
        push    dx
        mov     dx, 1e2h
        in      ax, dx
        pop     dx
        shr     al, 4
        cmp     al, 0
        jne     br_0FB41
        ret
br_0FB41:
        cmp     al, 2
        je      br_0FB59
        cmp     al, 3
        je      br_0FB5E
        cmp     al, 4
        je      br_0FB63
        cmp     al, 6
        je      br_0FB68
        cmp     al, 7
        je      br_0FB6D
        mov     al, 2eh
        stc
        ret
br_0FB59:
        mov     ax, 2fh
        stc
        ret
br_0FB5E:
        mov     ax, 4
        stc
        ret
br_0FB63:
        mov     ax, 30h
        stc
        ret
br_0FB68:
        mov     ax, 1dh
        stc
        ret
br_0FB6D:
        mov     ax, 1
        stc
        ret
fn_0FBE9:
        pusha
        mov     ax, ds
        mov     es, ax
        mov     di, 0a838h
        mov     cx, 6
        mov     ax, 0
        rep stosw
        popa
        mov     bp, 0a838h
        ret
        else
        db      8ah, 0c5h, 0bah, 0eah, 01h, 0efh, 0bah, 0ech, 01h, 0b8h, 0a0h, 00h, 0efh, 0bah, 0eeh, 01h
        db      0b8h, 0a0h, 00h, 0efh, 0c1h, 0e0h, 07h, 0beh, 18h, 0a8h, 0b9h, 06h, 00h, 0e8h, 0a5h, 00h
        db      73h, 01h, 0c3h, 0e8h, 0ddh, 00h, 73h, 01h, 0c3h, 0fah, 0adh, 0bah, 0e0h, 01h, 0efh, 0c1h
        db      0e0h, 03h, 0e2h, 0f6h, 0fbh, 0e8h, 8dh, 00h, 73h, 01h, 0c3h, 0e8h, 28h, 00h, 73h, 01h
        db      0c3h, 52h, 0bah, 0eeh, 01h, 0edh, 5ah, 0a8h, 08h, 75h, 01h, 0c3h, 52h, 0bah, 0e4h, 01h
        db      0edh, 5ah, 24h, 03h, 3ch, 00h, 75h, 03h, 0e9h, 0b2h, 01h, 3ch, 02h, 75h, 03h, 0e9h
        db      0bch, 00h, 0b0h, 2eh, 0f9h, 0c3h, 52h, 0bah, 0eeh, 01h, 0edh, 5ah, 0a8h, 01h, 75h, 01h
        db      0c3h, 52h, 0bah, 0e2h, 01h, 0edh, 5ah, 0c0h, 0e8h, 04h, 3ch, 00h, 75h, 01h, 0c3h, 3ch
        db      02h, 74h, 14h, 3ch, 03h, 74h, 15h, 3ch, 04h, 74h, 16h, 3ch, 06h, 74h, 17h, 3ch ; .t.<.t.<.t.<.t.<
        db      07h, 74h, 18h, 0b0h, 2eh, 0f9h, 0c3h, 0b8h, 2fh, 00h, 0f9h, 0c3h, 0b8h, 04h, 00h, 0f9h
        db      0c3h, 0b8h, 30h, 00h, 0f9h, 0c3h, 0b8h, 1dh, 00h, 0f9h, 0c3h, 0b8h, 01h, 00h, 0f9h, 0c3h
        db      60h, 8ch, 0d8h, 8eh, 0c0h, 0bfh, 18h, 0a8h, 0b9h, 06h, 00h, 0b8h, 00h, 00h, 0f3h, 0abh
        db      61h, 0bdh, 18h, 0a8h, 0c3h
        endif
fn_0FBFE:
        call    fn_0FE57
        push    dx
        mov     dx, 0ech
        in      ax, dx
        pop     dx
loop_0FC07:
        call    fn_0FE5D
        jae     br_0FC0D
        ret
br_0FC0D:
        push    dx
        mov     dx, 1eeh
        in      ax, dx
        pop     dx
        test    al, 80h
        jne     loop_0FC07
        clc
        ret
fn_0FC19:
        push    dx
        mov     dx, 1eeh
        in      ax, dx
        pop     dx
        test    al, 8
        jne     br_0FC24
        ret
br_0FC24:
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
fn_0FC3C:
        call    fn_0FE57
        push    dx
        mov     dx, 0ech
        in      ax, dx
        pop     dx
loop_0FC45:
        call    fn_0FE5D
        jae     br_0FC4B
        ret
br_0FC4B:
        push    dx
        mov     dx, 1eeh
        in      ax, dx
        pop     dx
        test    al, 8
        je      loop_0FC45
        clc
        ret
xl_ata_pio_data_phase:
        cmp     byte ptr [A1_B_0A88A], 1
        je      br_0FCC0
        mov     cx, word ptr [P_A868]
        shr     cx, 1
        les     di, [P_A864]
        cmp     cx, 100h
        jb      L_0F7A3
loop_0FC6E:
        push    cx
        call    L_0F782
        pop     cx
        jae     br_0FC76
        ret
br_0FC76:
        sub     cx, 100h
        jne     loop_0FC6E
        ret
L_0F782:
        mov     bx, 0ffffh
loop_0FC80:
        push    dx
        mov     dx, 1eeh
        in      ax, dx
        pop     dx
        and     al, 8
        jne     br_0FC94
        dec     bx
        jne     loop_0FC80
        mov     ax, 9
        stc
        ret
br_0FC94:
        mov     dx, 1e0h
        mov     cx, 100h
        cli
        rep insw
        sti
        clc
        ret
L_0F7A3:
        mov     si, 0ffffh
        mov     bl, 8
        cli
L_0F7A9:
        mov     dx, 1eeh
        in      ax, dx
        and     al, bl
        je      L_0F7BA
L_0F7B1:
        mov     dx, 1e0h
        in      ax, dx
        stosw
        loop    L_0F7A9
        clc
        ret
L_0F7BA:
        mov     bp, si
L_0F7BC:
        in      ax, dx
        and     al, bl
        jne     L_0F7B1
        dec     bp
        jne     L_0F7BC
        sti
        mov     ax, 9
        stc
        ret
br_0FCC0:
        call    fn_0FC3C
        jae     br_0FCC6
        ret
br_0FCC6:
        mov     cx, word ptr [P_A868]
        shr     cx, 1
        les     di, [P_A864]
        call    fn_0FE4E
        mov     dx, ASIC_DMA_MODE
        mov     al, 1
        out     dx, al
        mov     dx, ASIC_DMA_C038
        mov     al, 10h
        out     dx, al
        mov     dx, ASIC_DMA_DIR
        mov     al, 1
        out     dx, al
        mov     dx, ASIC_DMA_C031
        mov     al, 1
        out     dx, al
        push    dx
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        pop     dx
        or      al, 2
        mov     dx, ASIC_DMA_C03F
        out     dx, al
        mov     ax, es
        push    cx
        mov     cx, 4
        sub     bl, bl
tgt_0FCFF:
        shl     ax, 1
        rcl     bl, 1
        loop    tgt_0FCFF
        pop     cx
        add     ax, di
        adc     bl, 0
        mov     dx, ASIC_DMA_ADDR
        out     dx, ax
        mov     al, bl
        int     8eh
        mov     dx, ASIC_DMA_ADDR_HI
        out     dx, al
        mov     ax, cx
        dec     ax
        mov     dx, ASIC_DMA_COUNT
        out     dx, ax
        mov     dx, ASIC_DMA_C03A
        mov     al, 5
        out     dx, al
        push    dx
        mov     dx, ASIC_DMA_STATUS
        in      al, dx
        pop     dx
        push    dx
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        pop     dx
        and     al, 0fdh
        mov     dx, ASIC_DMA_C03F
        out     dx, al
        call    fn_0FE3B
        jb      L_0F846
        ret
L_0F846:
        mov     ax, 9
br_0FD3C:
        stc
        ret
br_0FD3E:
        cmp     byte ptr [A1_B_0A88A], 1
        je      br_0FDBE
        call    fn_0FC3C
        jae     br_0FD4B
        ret
br_0FD4B:
        mov     cx, word ptr [P_A868]
        shr     cx, 1
        les     si, [P_A864]
        mov     bp, es
        cmp     cx, 100h
        jb      L_0F89E
loop_0FD5D:
        push    cx
        call    L_0F879
        pop     cx
        jae     br_0FD65
        ret
br_0FD65:
        sub     cx, 100h
        jne     loop_0FD5D
        ret
L_0F879:
        mov     bx, 0ffffh
loop_0FD6F:
        push    dx
        mov     dx, 1eeh
        in      ax, dx
        pop     dx
        and     al, 8
        jne     br_0FD81
        dec     bx
        jne     loop_0FD6F
        mov     ax, 5
        stc
        ret
br_0FD81:
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
L_0F89E:
        mov     dx, 1e0h
L_0F8A1:
        mov     bx, 0ffffh
loop_0FD97:
        push    dx
        mov     dx, 1eeh
        in      ax, dx
        pop     dx
        test    al, 8
        je      br_0FDB2
        mov     ax, word ptr es:[si]
        add     si, 2
        mov     dx, 1e0h
        out     dx, ax
        loop    L_0F8A1
        call    fn_0FBFE
        clc
        ret
br_0FDB2:
        shl     ax, 8
        dec     bx
        jne     loop_0FD97
        sti
        mov     ax, 5
        stc
        ret
br_0FDBE:
        call    fn_0FC3C
        jae     br_0FDC4
        ret
br_0FDC4:
        mov     cx, word ptr [P_A868]
        shr     cx, 1
        les     si, [P_A864]
        call    fn_0FE4E
        mov     dx, ASIC_DMA_MODE
        mov     al, 1
        out     dx, al
        mov     dx, ASIC_DMA_C038
        mov     al, 10h
        out     dx, al
        mov     dx, ASIC_DMA_DIR
        mov     al, 1
        out     dx, al
        mov     dx, ASIC_DMA_C031
        mov     al, 1
        out     dx, al
        push    dx
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        pop     dx
        or      al, 2
        mov     dx, ASIC_DMA_C03F
        out     dx, al
        mov     ax, es
        push    cx
        mov     cx, 4
        sub     bl, bl
tgt_0FDFD:
        shl     ax, 1
        rcl     bl, 1
        loop    tgt_0FDFD
        pop     cx
        add     ax, si
        adc     bl, 0
        mov     dx, ASIC_DMA_ADDR
        out     dx, ax
        mov     al, bl
        int     8eh
        mov     dx, ASIC_DMA_ADDR_HI
        out     dx, al
        mov     ax, cx
        dec     ax
        mov     dx, ASIC_DMA_COUNT
        out     dx, ax
        mov     dx, ASIC_DMA_C03A
        mov     al, 9
        out     dx, al
        push    dx
        mov     dx, ASIC_DMA_STATUS
        in      al, dx
        pop     dx
        push    dx
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        pop     dx
        and     al, 0fdh
        mov     dx, ASIC_DMA_C03F
        out     dx, al
        call    fn_0FE3B
        jb      L_0F947
        ret
L_0F947:
        mov     al, 5
L_0FB44:
        ret
fn_0FE3B:
        call    fn_0FE57
loop_0FE3E:
        call    fn_0FE5D
        jae     br_0FE44
        ret
br_0FE44:
        mov     al, 1
        int     92h
        cmp     al, 0
        je      loop_0FE3E
        clc
        ret
fn_0FE4E:
        push    es
        pusha
        mov     al, 0
        int     92h
        popa
        pop     es
        ret
fn_0FE57:
        int     77h
        mov     word ptr [A1_W_0A888], ax
        ret
fn_0FE5D:
        int     77h
        sub     ax, word ptr [A1_W_0A888]
        cmp     ax, 0bb8h
        cmc
        mov     ax, 2dh
        ret
        endif
ata_body_end:
; app0's call to xl_ata_probe, once ata is off segment 0 (ATA_FAR).
        if      ATA_FAR
ata_probe_far:
        call    xl_ata_probe
        retf
        endif
; its offsets are ATA_SEG offsets: a byte past 64K of it is out of reach.
        if      $-ATA_CSBASE > 10000h
        error   "ata: code runs past 64K of ATA_SEG"
        endif
; the RAM frame (ram.asm) starts at the next paragraph.
        PARA_PAD
