; c2 -- MPC2000XL flash: C layer, 60744 bytes.
; v1.20 0x46f8e-0x55cd6, v1.14 0x4698e-0x556d6, v1.12 0x4678e-0x554d6.
; v1.11 0x46638-0x552e6 (60590 bytes), v1.10 0x46538-0x551e6 (60590 bytes).
; C only: the direct descendant of MPC2000.SYS, ENTER prologues end to end.

C1_CSBASE set     C1_SEG*16-SEGBASE

        call    EP_FIELD_HANDLER_NOP_OFF+C1_CSBASE
        mov     ax, di
        mov     dx, word ptr [bp-6]
        pop     si
        pop     di
        leave
        retf
L_46F9A:
        db      "Disk is changed"
        db      00h
far_46FAA:
        push    ds
        push    C2_W_00F7C
        nop
        push    cs
        if      FW_VERSION >= 112
        db      0e8h, 01h, 79h
        elseif  FW_VERSION >= 110
        db      0e8h, 27h, 79h
        else
        db      0e8h, 23h, 79h
        endif
        add     sp, 4
        retf
        db      00h
X_46FB8:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    EP_TGT_47992_OFF+C1_CSBASE
        pop     ds
        retf
        db      00h
L_46FC6:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    EP_FAR_3E99C_OFF+C1_CSBASE
        pop     ds
        retf
        db      00h
L_46FD4:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_47004
        pop     ds
        retf
        db      00h
L_460B0:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    C1_SEG
        push    (C1_BASE+L_43254-C1_SEG*16)
        nop
        push    cs
        call    EP_FAR_3ED98_OFF+C1_CSBASE
        add     sp, 4
        push    ds
        push    C2_W_00F9A
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        pop     ds
        retf
far_47004:
        push    si
        push    ds
        push    C2_W_01088
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        mov     byte ptr [C2_B_CONV_MPC60_PAD], 0
        nop
        push    cs
        call    EP_INT4D_SAMPLE_WRAPPER_OFF+C1_CSBASE
        mov     es, dx
        mov     bx, ax
        mov     al, byte ptr [C2_B_CONV_MPC60_PAD]
        cbw
        mov     si, ax
        mov     al, byte ptr es:[bx+si]
        mov     byte ptr [C2_B_PAD_NOTE], al
        cmp     word ptr [C2_W_CONV_TABLE_CURSOR], 0
        jl      L_466E3
        cmp     word ptr [C2_W_CONV_TABLE_CURSOR], 2
        jb      br_4703F
L_466E3:
        mov     word ptr [C2_W_CONV_TABLE_CURSOR], 0
br_4703F:
        imul    bx, word ptr [C2_W_CONV_TABLE_CURSOR], 2ah
        callf   [bx+C2_TBL_010EA]
        pop     si
        retf
conversion_table_cancel:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    EP_FAR_3E99C_OFF+C1_CSBASE
        pop     ds
        retf
        db      00h
conversion_table_load:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   EP_L_395D8_SEG:EP_L_395D8_OFF
        pop     ds
        retf
        db      00h
conversion_table_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    C1_SEG
        push    (C2_BASE+L_4735C-C1_SEG*16)
        nop
        push    cs
        call    EP_FAR_3ED98_OFF+C1_CSBASE
        add     sp, 4
        push    ds
        push    C2_W_010A2
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        mov     al, byte ptr [C2_B_CONV_MPC60_PAD]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C2_TBL_01002]
        push    word ptr [bx+C2_TBL_01000]
        push    0fh
        push    7fh
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 60h
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        push    dx
        push    ax
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        push    ax
        push    25h
        push    91h
        nop
        push    cs
        call    EP_FAR_47CB4_OFF+C1_CSBASE
        add     sp, 0ah
        nop
        push    cs
        call    EP_FIELD_ENGINE_REDRAW_OFF+C1_CSBASE
        pop     ds
        retf
conv_table_focus_field0:
        mov     word ptr [C2_W_CONV_TABLE_CURSOR], 0
        push    ds
        push    C2_B_CONV_MPC60_PAD
        push    ds
        push    C2_W_010DC
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_468E8:
        push    bp
        mov     bp, sp
        push    si
        nop
        push    cs
        call    EP_INT4D_SAMPLE_WRAPPER_OFF+C1_CSBASE
        mov     es, dx
        mov     si, ax
        mov     al, byte ptr [bp+6]
        cbw
        mov     bx, ax
        mov     al, byte ptr es:[bx+si]
        mov     byte ptr [C2_B_PAD_NOTE], al
        pop     si
        leave
        retf
conv_table_focus_field1:
        mov     word ptr [C2_W_CONV_TABLE_CURSOR], 1
        push    ds
        push    C2_B_PAD_NOTE
        push    ds
        push    C2_W_01106
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
far_467C6:
far_46B1C:
        enter   4, 0
        push    si
        nop
        push    cs
        call    EP_INT4D_SAMPLE_WRAPPER_OFF+C1_CSBASE
        mov     si, ax
        mov     al, byte ptr [C2_B_CONV_MPC60_PAD]
        cbw
        mov     bx, ax
        add     bx, si
        mov     es, dx
        mov     al, byte ptr [bp+6]
        mov     byte ptr es:[bx], al
        pop     si
        leave
        retf
        db      90h
L_4713C:
        db      "HIHT CLSD (A01)"
        db      00h
        if      FW_VERSION >= 110
far_4714C:
        endif
        db      "HIHT MEDM (A01)"
        db      00h
far_4715C:
        db      "HIHT OPEN (A01)"
        db      00h
far_4716C:
        db      "SNR1      (A02)"
        db      00h
L_4717C:
        db      "SNR2      (A03)"
        db      00h
far_4718C:
        db      "BASS      (A04)"
        db      00h
L_4719C:
        db      "TOM1      (A05)"
        db      00h
far_471AC:
        db      "TOM2      (A06)"
        db      00h
L_471BC:
        db      "TOM3      (A07)"
        db      00h
L_471CC:
        db      "TOM4      (A08)"
        db      00h
L_471DC:
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
L_471FC:
        endif
        db      "RID1      (A09)"
        db      00h
L_471EC:
        if      FW_VERSION < 112
far_4720C:
        if      FW_VERSION < 110
far_4714C:
        endif
        endif
        db      "RID2      (A10)"
        db      00h
        if      FW_VERSION < 112
far_4721C:
        endif
        if      (FW_VERSION >= 112)
L_471FC:
        endif
        db      "CRS1      (A11)"
        db      00h
        if      FW_VERSION >= 112
far_4720C:
        else
far_4722C:
        endif
        db      "CRS2      (A12)"
        db      00h
        if      FW_VERSION >= 112
far_4721C:
        endif
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
L_4723C:
        endif
L_462EA:
        db      "PRC1      (A13)"
        db      00h
L_468D6:
        if      FW_VERSION >= 112
far_4722C:
        else
far_4724C:
        endif
        db      "PRC2      (A14)"
        db      00h
        if      FW_VERSION < 112
far_4725C:
        endif
        if      (FW_VERSION >= 112)
L_4723C:
        endif
        db      "PRC3      (A15)"
        db      00h
L_468F6:
        if      FW_VERSION >= 112
far_4724C:
        endif
        db      "PRC4      (A16)"
        db      00h
        if      FW_VERSION >= 112
far_4725C:
        endif
        db      "DR01      (B01)"
        db      00h
far_4726C:
        db      "DR02      (B02)"
        db      00h
        if      (FW_VERSION >= 112)
L_4727C:
        endif
        db      "DR03      (B03)"
        db      00h
far_4728C:
        db      "DR04      (B04)"
        db      00h
        if      FW_VERSION >= 112
far_4729C:
        endif
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
L_4727C:
        endif
        db      "DR05      (B05)"
        db      00h
L_46956:
        if      FW_VERSION >= 112
far_472AC:
        endif
        db      "DR06      (B06)"
        db      00h
        if      FW_VERSION < 112
far_4729C:
        endif
        if      (FW_VERSION >= 112)
L_472BC:
        endif
        db      "DR07      (B07)"
        db      00h
        if      FW_VERSION >= 112
L_472CC:
        else
far_472AC:
        endif
        db      "DR08      (B08)"
        db      00h
        if      FW_VERSION >= 112
L_472DC:
        endif
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
L_472BC:
        endif
        db      "DR09      (B09)"
        db      00h
L_46996:
L_472EC:
        if      FW_VERSION < 112
L_472CC:
        endif
        db      "DR10      (B10)"
        db      00h
        if      FW_VERSION < 112
L_472DC:
        endif
L_472FC:
        db      "DR11      (B11)"
        db      00h
        if      FW_VERSION >= 110
far_469B6:
        endif
L_46D0C:
        if      FW_VERSION < 110
FAR_469B6:
        endif
        db      "DR12      (B12)"
        db      00h
L_46D1C:
        db      "DR13      (B13)"
        db      00h
L_46D2C:
        db      "DR14      (B14)"
        db      00h
L_4733C:
        db      "DR15      (B15)"
        db      00h
L_46D4C:
        db      "DR16      (B16)"
        db      00h
L_4735C:
        db      "Conversion tabl"
        db      65h, 00h, 00h
far_4736E:
        enter   0ch, 0
        push    di
        push    si
        mov     al, 3bh
        mov     bx, word ptr [bp+6]
        mov     si, 7c00h
        mov     es, si
        mov     si, 7dbh
        imul    byte ptr es:[bx+si]
        add     ax, 5
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], es
        and     byte ptr es:[0cc4h], 0feh
        push    0
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    EP_DISK_PROGRESS_MSG_OFF+C1_CSBASE
        add     sp, 6
        push    0
        push    ds
        push    C0_W_098C2
        nop
        push    cs
        call    EP_FS_OPEN_OFF+C1_CSBASE
        add     sp, 6
        mov     si, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jne     br_473DB
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        lea     ax, [bp-0ch]
        push    ss
        push    ax
        nop
        push    cs
        call    far_4756A
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-6], dx
        if      FW_VERSION >= 112
        or      dx, ax
        jne     br_473DB
        endif
        callf   EP_DISK_FILE_CLOSE_SEG:EP_DISK_FILE_CLOSE_OFF
br_473DB:
        nop
        push    cs
        call    EP_FIELD_HANDLER_NOP_OFF+C1_CSBASE
        mov     ax, word ptr [bp-6]
        or      ax, si
        jne     br_473FA
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        nop
        push    cs
        call    EP_FAR_46126_OFF+C1_CSBASE
        add     sp, 4
        pop     si
        pop     di
        leave
        retf
        db      90h
br_473FA:
        mov     word ptr [bp-8], si
        mov     ax, C1_SEG
        mov     cx, (C1_BASE+L_3E1AA-C1_SEG*16)
        mov     di, C2_W_05BC4
        mov     es, ax
        push    ds
        mov     ds, word ptr [bp-6]
        xor     ax, ax
        repe cmpsb
        je      br_47417
        sbb     ax, ax
        sbb     ax, 0ffffh
br_47417:
        pop     ds
        or      ax, ax
        jne     br_47426
        nop
        push    cs
        call    EP_TGT_47AC4_OFF+C1_CSBASE
        pop     si
        pop     di
        leave
        retf
        db      90h
br_47426:
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        callf   EP_DISP_ALERT_WAIT_KEY_SEG:EP_DISP_ALERT_WAIT_KEY_OFF
        add     sp, 4
        nop
        push    cs
        call    EP_FAR_3E99C_OFF+C1_CSBASE
        pop     si
        pop     di
        leave
        retf
        db      00h
far_4743E:
        enter   0eh, 0
        push    si
        mov     word ptr [bp-4], 0
        mov     word ptr [bp-2], 7c00h
        mov     byte ptr [C0_B_098D5], 32h
        push    0
        mov     bx, 7c00h
        mov     es, bx
        push    word ptr es:[0cc2h]
        push    word ptr es:[0cc0h]
        nop
        push    cs
        call    EP_DISK_PROGRESS_MSG_OFF+C1_CSBASE
        add     sp, 6
        push    0
        push    ds
        push    C0_W_098C2
        nop
        push    cs
        call    EP_FS_OPEN_OFF+C1_CSBASE
        add     sp, 6
        mov     si, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      br_47485
        jmp     br_47519
br_47485:
        push    1
        push    2
        lea     ax, [bp-0ah]
        push    ss
        push    ax
        nop
        push    cs
        call    EP_FS_READ_OFF+C1_CSBASE
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jne     br_4750D
        cmp     byte ptr [bp-0ah], 6
        jne     br_47504
        mov     bx, 7c00h
        mov     es, bx
        or      byte ptr es:[0cc4h], 2
        push    0
        push    0
        push    0c00h
        nop
        push    cs
        call    EP_FS_SEEK_OFF+C1_CSBASE
        add     sp, 6
        mov     si, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jne     br_4750D
        mov     bx, 7c00h
        mov     es, bx
        test    byte ptr es:[0cc4h], 4
        je      br_474EA
        lea     ax, [bp-0eh]
        push    ss
        push    ax
        nop
        push    cs
        call    EP_TGT_47916_OFF+C1_CSBASE
        add     sp, 4
loop_474E2:
        mov     si, ax
        mov     word ptr [bp-6], dx
        jmp     br_4750D
        db      90h
br_474EA:
        push    word ptr es:[0cc2h]
        push    word ptr es:[0cc0h]
        lea     ax, [bp-0eh]
        push    ss
        push    ax
        nop
        push    cs
        call    far_4756A
        add     sp, 8
        jmp     loop_474E2
        db      90h
br_47504:
        if      FW_VERSION >= 112
        mov     si, (C1_BASE+L_43A98-C1_SEG*16)
        else
        mov     ax, (C1_BASE+L_43A98-C1_SEG*16)
        endif
        mov     cx, C1_SEG
        if      FW_VERSION < 112
        mov     si, ax
        endif
        mov     word ptr [bp-6], cx
br_4750D:
        if      FW_VERSION >= 112
        mov     ax, word ptr [bp-6]
        or      ax, si
        jne     br_47519
        endif
        callf   EP_DISK_FILE_CLOSE_SEG:EP_DISK_FILE_CLOSE_OFF
br_47519:
        nop
        push    cs
        call    EP_FIELD_HANDLER_NOP_OFF+C1_CSBASE
        mov     ax, word ptr [bp-6]
        or      ax, si
        je      br_47558
        mov     bx, 7c00h
        mov     es, bx
        test    byte ptr es:[0cc4h], 4
        je      br_47544
        push    word ptr es:[0cbah]
        push    word ptr es:[0cb8h]
        nop
        push    cs
        call    EP_SOUND_LIST_UNLINK_OFF+C1_CSBASE
        add     sp, 4
br_47544:
        push    word ptr [bp-6]
        push    si
        callf   EP_DISP_ALERT_WAIT_KEY_SEG:EP_DISP_ALERT_WAIT_KEY_OFF
        add     sp, 4
        nop
        push    cs
        call    EP_FAR_3E99C_OFF+C1_CSBASE
        pop     si
        leave
        retf
        if      FW_VERSION < 112
        db      90h
        endif
br_47558:
        push    word ptr [bp-0ch]
        push    word ptr [bp-0eh]
        nop
        push    cs
        call    EP_FAR_46126_OFF+C1_CSBASE
        add     sp, 4
        pop     si
        leave
        retf
        db      00h
far_4756A:
        enter   8, 0
        push    di
        push    si
        mov     word ptr [bp-4], 0
        mov     word ptr [bp-2], 7c00h
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        mov     bx, 7c00h
        mov     es, bx
        db      26h, 89h, 06h, 0c0h, 0ch
        mov     word ptr es:[0cc2h], dx
        lea     ax, [bp-8]
        push    ss
        push    ax
        nop
        push    cs
        call    EP_SOUND_RECORD_ALLOC_OFF+C1_CSBASE
        add     sp, 4
        or      ax, ax
        jne     br_475A3
        jmp     br_478F2
br_475A3:
        mov     bx, word ptr [bp-8]
        mov     cx, word ptr [bp-6]
        add     bx, 12h
        push    ds
        mov     si, bx
        mov     ds, cx
        les     di, [bp+0ah]
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        xchg    di, si
        push    ds
        push    es
        pop     ds
        pop     es
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        les     bx, [bp+0ah]
        mov     ax, word ptr es:[bx+16h]
        mov     dx, word ptr es:[bx+18h]
        les     bx, [bp-8]
        mov     word ptr es:[bx+2eh], ax
        mov     word ptr es:[bx+30h], dx
        mov     ax, 28h
        les     bx, [bp+0ah]
        imul    word ptr es:[bx+22h]
        les     bx, [bp-8]
        mov     word ptr es:[bx+26h], ax
        mov     word ptr es:[bx+28h], dx
        mov     ax, 28h
        les     bx, [bp+0ah]
        imul    word ptr es:[bx+24h]
        les     bx, [bp-8]
        mov     word ptr es:[bx+2ah], ax
        mov     word ptr es:[bx+2ch], dx
        les     bx, [bp-8]
        mov     byte ptr es:[bx+24h], 0efh
        mov     bx, 7c00h
        mov     es, bx
        cmp     byte ptr es:[0cc8h], 1
        jne     br_47642
        les     bx, [bp+0ah]
        sub     ah, ah
        mov     al, byte ptr es:[bx+2ch]
        inc     ax
        imul    ax, ax, 0c8h
        cwd
        sub     dh, dh
        add     ax, dx
        sar     ax, 8
        les     bx, [bp-8]
        mov     byte ptr es:[bx+23h], al
        jmp     br_4764A
br_47642:
        les     bx, [bp-8]
        mov     byte ptr es:[bx+23h], 64h
br_4764A:
        les     bx, [bp-8]
        mov     byte ptr es:[bx+25h], 0
        les     bx, [bp-8]
        mov     ax, word ptr es:[bx+2eh]
        mov     dx, word ptr es:[bx+30h]
        cmp     word ptr es:[bx+28h], dx
        jl      br_47673
        jg      br_4766B
        cmp     word ptr es:[bx+26h], ax
        jbe     br_47673
br_4766B:
        mov     word ptr es:[bx+26h], ax
        mov     word ptr es:[bx+28h], dx
br_47673:
        les     bx, [bp-8]
        mov     ax, word ptr es:[bx+2eh]
        mov     dx, word ptr es:[bx+30h]
        cmp     word ptr es:[bx+2ch], dx
        jl      br_47694
        jg      br_4768C
        cmp     word ptr es:[bx+2ah], ax
        jbe     br_47694
br_4768C:
        mov     word ptr es:[bx+2ah], ax
        mov     word ptr es:[bx+2ch], dx
br_47694:
        push    0
        les     bx, [bp-8]
        push    word ptr es:[bx+34h]
        push    word ptr es:[bx+32h]
        callf   EP_ADDR_CALC_SEGMENT_SEG:EP_ADDR_CALC_SEGMENT_OFF
        add     sp, 6
        les     bx, [bp-8]
        mov     word ptr es:[bx+3ah], ax
        mov     word ptr es:[bx+3ch], dx
        push    1
        les     bx, [bp-8]
        push    word ptr es:[bx+30h]
        push    word ptr es:[bx+2eh]
        nop
        push    cs
        call    EP_SIZE_PARA_ROUND_MUL_OFF+C1_CSBASE
        add     sp, 6
        les     bx, [bp-8]
        mov     word ptr es:[bx+0eh], ax
        mov     word ptr es:[bx+10h], dx
        nop
        push    cs
        call    EP_SMEM_FREE_BYTES_OFF+C1_CSBASE
        or      dx, dx
        jge     br_47704
        mov     ax, (C1_BASE+L_415CA-C1_SEG*16)
        mov     cx, C1_SEG
loop_476E3:
        mov     di, ax
        mov     word ptr [bp-2], cx
loop_476E8:
        mov     ax, word ptr [bp-2]
        or      ax, di
        jne     br_476F2
        jmp     br_478FD
br_476F2:
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        nop
        push    cs
        call    EP_SOUND_LIST_UNLINK_OFF+C1_CSBASE
        add     sp, 4
        jmp     br_478FD
        db      90h
br_47704:
        les     bx, [bp-8]
        mov     ax, word ptr es:[bx+0ah]
        mov     dx, word ptr es:[bx+0ch]
        add     ax, word ptr es:[bx+0eh]
        adc     dx, word ptr es:[bx+10h]
        cmp     dx, word ptr [C2_W_SMEM_SIZE_HI]
        jl      br_4772A
        jg      br_47725
        cmp     ax, word ptr [C0_W_SMEM_SIZE]
        jbe     br_4772A
br_47725:
        nop
        push    cs
        call    EP_SMEM_COMPACT_OFF+C1_CSBASE
br_4772A:
        mov     si, word ptr [bp+0ah]
        mov     es, word ptr [bp+0ch]
        mov     ax, word ptr es:[si+12h]
        mov     dx, word ptr es:[si+14h]
        add     ax, word ptr es:[si+16h]
        adc     dx, word ptr es:[si+18h]
        mov     bx, 7c00h
        mov     es, bx
        cmp     dx, word ptr es:[0c02h]
        jg      br_477C8
        jl      br_47755
        cmp     ax, word ptr es:[0c00h]
        ja      br_477C8
br_47755:
        push    0
        push    0
        push    2
        mov     es, word ptr [bp+0ch]
        push    word ptr es:[si+14h]
        push    word ptr es:[si+12h]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     cx, ax
        mov     bx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, cx
        adc     dx, bx
        mov     bx, 7c00h
        mov     es, bx
        add     ax, word ptr es:[0c04h]
        adc     dx, 0
loop_47784:
        push    dx
        push    ax
        nop
        push    cs
        if      FW_VERSION >= 112
        call    EP_FS_SEEK_OFF+C1_CSBASE
        elseif  FW_VERSION >= 110
        db      0e8h, 21h, 0b3h
        else
        db      0e8h, 1dh, 0b3h
        endif
        add     sp, 6
        mov     di, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_4779A
        jmp     NEAR loop_476E8
br_4779A:
        push    1
        nop
        push    cs
        call    EP_FAR_4610A_OFF+C1_CSBASE
        add     sp, 2
        les     bx, [bp-8]
        push    word ptr es:[bx+30h]
        push    word ptr es:[bx+2eh]
        push    word ptr es:[bx+0ch]
        push    word ptr es:[bx+0ah]
        nop
        push    cs
        call    EP_FAR_42B98_OFF+C1_CSBASE
        add     sp, 8
        mov     di, ax
        mov     word ptr [bp-2], dx
        jmp     loop_476E8
        db      90h
br_477C8:
        db      26h, 8bh, 06h, 00h, 0ch
        mov     dx, word ptr es:[0c02h]
        mov     es, word ptr [bp+0ch]
        cmp     word ptr es:[si+14h], dx
        jl      br_47836
        jg      br_477E3
        cmp     word ptr es:[si+12h], ax
        jb      br_47836
br_477E3:
        mov     bx, 7c00h
        mov     es, bx
        test    byte ptr es:[0cc4h], 2
        je      br_4782C
        push    0
        push    0
        push    2
        mov     es, word ptr [bp+0ch]
        mov     ax, word ptr es:[si+12h]
        mov     dx, word ptr es:[si+14h]
        mov     bx, 7c00h
        mov     es, bx
        sub     ax, word ptr es:[0c00h]
        sbb     dx, word ptr es:[0c02h]
        push    dx
        push    ax
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        add     ah, 4
        adc     dx, 0
        mov     cx, ax
        mov     bx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, cx
        adc     dx, bx
        jmp     loop_47784
br_4782C:
        mov     ax, C2_W_05BC4
        mov     cx, C1_SEG
        jmp     loop_476E3
        db      90h
br_47836:
        push    0
        push    0
        push    2
        push    word ptr es:[si+14h]
        push    word ptr es:[si+12h]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     cx, ax
        mov     bx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, cx
        adc     dx, bx
        mov     bx, 7c00h
        mov     es, bx
        add     ax, word ptr es:[0c04h]
        adc     dx, 0
        push    dx
        push    ax
        nop
        push    cs
        call    EP_FS_SEEK_OFF+C1_CSBASE
        add     sp, 6
        mov     di, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_47878
        jmp     NEAR loop_476E8
br_47878:
        push    1
        nop
        push    cs
        call    EP_FAR_4610A_OFF+C1_CSBASE
        add     sp, 2
        mov     bx, 7c00h
        mov     es, bx
        db      26h, 8bh, 06h, 00h, 0ch
        mov     dx, word ptr es:[0c02h]
        mov     es, word ptr [bp+0ch]
        sub     ax, word ptr es:[si+12h]
        sbb     dx, word ptr es:[si+14h]
        push    dx
        push    ax
        les     bx, [bp-8]
        push    word ptr es:[bx+0ch]
        push    word ptr es:[bx+0ah]
        nop
        push    cs
        call    EP_FAR_42B98_OFF+C1_CSBASE
        add     sp, 8
        mov     di, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_478BD
        jmp     NEAR loop_476E8
br_478BD:
        mov     bx, 7c00h
        mov     es, bx
        or      byte ptr es:[0cc4h], 4
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        db      26h, 89h, 06h, 0b8h, 0ch
        mov     word ptr es:[0cbah], dx
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        les     bx, [bp+6]
        mov     word ptr es:[bx], ax
        mov     word ptr es:[bx+2], dx
        mov     ax, C2_W_05BC4
        mov     dx, C1_SEG
        pop     si
        pop     di
        leave
        retf
br_478F2:
        mov     ax, (C1_BASE+msg_sound_dir_full-C1_SEG*16)
        mov     cx, C1_SEG
        mov     di, ax
        mov     word ptr [bp-2], cx
br_478FD:
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        les     bx, [bp+6]
        mov     word ptr es:[bx], ax
        mov     word ptr es:[bx+2], dx
        mov     ax, di
        mov     dx, word ptr [bp-2]
        pop     si
        pop     di
        leave
        retf
tgt_47916:
        enter   4, 0
        push    si
        mov     bx, 7c00h
        mov     es, bx
        db      26h, 8bh, 06h, 00h, 0ch
        mov     dx, word ptr es:[0c02h]
        les     bx, es:[0cc0h]
        sub     ax, word ptr es:[bx+12h]
        sbb     dx, word ptr es:[bx+14h]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     si, word ptr [bp+6]
        mov     bx, 7c00h
        mov     es, bx
        db      26h, 8bh, 06h, 0b8h, 0ch
        mov     dx, word ptr es:[0cbah]
        mov     es, word ptr [bp+8]
        mov     word ptr es:[si], ax
        mov     word ptr es:[si+2], dx
        mov     es, bx
        les     bx, es:[0cc0h]
        mov     ax, word ptr es:[bx+16h]
        mov     dx, word ptr es:[bx+18h]
        sub     ax, word ptr [bp-4]
        sbb     dx, word ptr [bp-2]
        push    dx
        push    ax
        mov     es, word ptr [bp+8]
        les     bx, es:[si]
        mov     ax, word ptr es:[bx+0ah]
        mov     dx, word ptr es:[bx+0ch]
        add     ax, word ptr [bp-4]
        adc     dx, word ptr [bp-2]
        push    dx
        push    ax
        nop
        push    cs
        call    EP_FAR_42B98_OFF+C1_CSBASE
        add     sp, 8
        pop     si
        leave
        retf
        nop
tgt_47992:
        push    ds
        push    C2_W_01130
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        mov     byte ptr [C0_B_098B8], 0
        callf   [C2_FP_0117A]
        retf
load_mpc60_sound_cancel:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_46FAA
        pop     ds
        retf
        db      00h
load_mpc60_sound_do_it:
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C0_B_098B8]
        cbw
        mov     bx, ax
        mov     di, 7c00h
        mov     es, di
        mov     di, 7dbh
        mov     al, 3bh
        imul    byte ptr es:[bx+di]
        add     ax, 5
        mov     si, ax
        cmp     byte ptr es:[bx+di], 0ffh
        je      br_479EE
        cmp     byte ptr es:[si], 0
        je      br_479EE
        mov     al, bl
        cbw
        push    ax
        nop
        push    cs
        call    far_4736E
        add     sp, 2
br_479EE:
        pop     ds
        pop     si
        pop     di
        retf
load_mpc60_sound_paint:
        enter   6, 0
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C0_B_098B8]
        cbw
        mov     bx, ax
        mov     si, 7c00h
        mov     es, si
        mov     si, 7dbh
        mov     al, byte ptr es:[bx+si]
        mov     byte ptr [bp-1], al
        mov     al, 3bh
        imul    byte ptr [bp-1]
        add     ax, 5
        mov     si, ax
        mov     word ptr [bp-4], es
        push    C1_SEG
        push    EP_L_46332_OFF
        nop
        push    cs
        call    EP_DRAW_CONFIRM_WINDOW_OFF+C1_CSBASE
        add     sp, 4
        push    ds
        push    C2_W_0114A
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        mov     al, byte ptr [C0_B_098B8]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C2_TBL_01002]
        push    word ptr [bx+C2_TBL_01000]
        push    14h
        push    7dh
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        cmp     byte ptr [bp-1], 0ffh
        je      br_47A84
        mov     es, word ptr [bp-4]
        cmp     byte ptr es:[si], 0
        je      br_47A84
        push    es
        push    si
        push    24h
        push    7dh
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        push    EP_FAR_47ABE_SEG
        push    EP_FAR_47ABE_OFF
        push    1
        push    5
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        jmp     br_47A93
        db      90h
br_47A84:
        push    EP_L_47AB2_SEG
        push    EP_L_47AB2_OFF
        push    24h
        push    7dh
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
br_47A93:
        add     sp, 8
        nop
        push    cs
        call    field_engine_redraw
        pop     ds
        pop     si
        leave
        retf
        db      00h
L_47AA0:
        push    ds
        push    C0_B_098B8
        push    ds
        push    C2_W_0116C
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      90h
L_47AB2:
        db      "(no assign)"
        db      00h
far_47ABE:
        db      44h, 4fh, 20h
        db      49h, 54h, 00h
tgt_47AC4:
        push    ds
        push    C2_W_01196
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        nop
        push    cs
        call    EP_DISP_REQUEST_FLUSH_OFF+C1_CSBASE
        retf
change_disk_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     bx, 7c00h
        mov     es, bx
        test    byte ptr es:[0cc4h], 4
        je      br_47AFB
        push    word ptr es:[0cbah]
        push    word ptr es:[0cb8h]
        nop
        push    cs
        call    EP_SOUND_LIST_UNLINK_OFF+C1_CSBASE
        add     sp, 4
br_47AFB:
        pop     ds
        retf
        db      00h
change_disk_f4:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    change_disk_refresh
        nop
        push    cs
        call    EP_FAR_3E99C_OFF+C1_CSBASE
        pop     ds
        retf
change_disk_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    C1_SEG
        push    EP_L_47B84_OFF
        nop
        push    cs
        call    EP_DRAW_CONFIRM_WINDOW_OFF+C1_CSBASE
        add     sp, 4
        push    ds
        push    C2_W_011B4
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        push    ds
        if      FW_VERSION >= 110
        push    C2_W_07B98
        else
        push    C2_W_07B98
        endif
        push    14h
        push    48h
        nop
        push    cs
        call    EP_DRAW_BITMAP_PTR_OFF+C1_CSBASE
        add     sp, 8
        pop     ds
        retf
change_disk_f5:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   EP_DISK_MEDIA_READY_CHECK_SEG:EP_DISK_MEDIA_READY_CHECK_OFF
        or      ax, ax
        jne     br_47B62
        push    EP_MSG_CHANGE_DISK_SEG
        push    EP_MSG_CHANGE_DISK_OFF
        callf   EP_DISP_ALERT_WAIT_KEY_SEG:EP_DISP_ALERT_WAIT_KEY_OFF
        add     sp, 4
        pop     ds
        retf
        db      90h
br_47B62:
        nop
        push    cs
        call    EP_FAR_42AFE_OFF+C1_CSBASE
        mov     bx, 7c00h
        mov     es, bx
        test    byte ptr es:[0cc4h], 1
        je      br_47B7C
        callf   EP_L_3B418_SEG:EP_L_3B418_OFF
        pop     ds
        retf
        db      90h
br_47B7C:
        nop
        push    cs
        call    far_4743E
        pop     ds
        retf
        db      90h
L_47B84:
        db      "Channge Disk"
        db      00h, 00h
install_text2_vectors:
        push    ds
        push    C2_W_011F0
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        push    EP_L_3E59E_SEG
        push    EP_L_3E59E_OFF
        push    41h
        callf   EP_IVT_SET_VECTOR_SEG:EP_IVT_SET_VECTOR_OFF
        add     sp, 6
        push    EP_L_5596A_SEG
        push    EP_L_5596A_OFF
        push    4ch
        callf   EP_IVT_SET_VECTOR_SEG:EP_IVT_SET_VECTOR_OFF
        add     sp, 6
        retf
        db      00h
far_47BC0:
        enter   4, 0
        push    si
        mov     si, word ptr [bp+0ah]
        cmp     si, 40h
        jae     br_47C06
        mov     ax, si
        cwd
        and     dx, 0fh
        add     ax, dx
        sar     ax, 4
        add     al, 41h
        mov     byte ptr [bp-4], al
        mov     cx, 10h
        mov     ax, si
        cwd
        idiv    cx
        mov     si, dx
        lea     ax, [si+1]
        mov     cx, 0ah
        cwd
        idiv    cx
        add     al, 30h
        mov     byte ptr [bp-3], al
        lea     ax, [si+1]
        cwd
        idiv    cx
        add     dl, 30h
        mov     byte ptr [bp-2], dl
        mov     byte ptr [bp-1], ch
        jmp     br_47C19
br_47C06:
        mov     es, word ptr [C2_W_0811E]
        if      FW_VERSION >= 112
        mov     ax, word ptr es:[0a5d4h]
        mov     dx, word ptr es:[0a5d6h]
        elseif  FW_VERSION >= 110
        mov     ax, word ptr es:[0a5a6h]
        mov     dx, word ptr es:[0a5a8h]
        else
        mov     ax, word ptr es:[0a5aah]
        mov     dx, word ptr es:[0a5ach]
        endif
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
br_47C19:
        lea     ax, [bp-4]
        push    ss
        push    ax
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        pop     si
        leave
        retf
        db      00h
far_47C30:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     cx, word ptr [bp+0ah]
        cmp     cx, 23h
        jl      br_47C48
        cmp     cx, 62h
        jg      br_47C48
        mov     dx, 1
        jmp     br_47C4A
        db      90h
br_47C48:
        xor     dx, dx
br_47C4A:
        or      dx, dx
        je      br_47C70
        xor     si, si
        mov     di, word ptr [bp+6]
        mov     ax, word ptr [bp+8]
loop_47C56:
        mov     bx, di
        mov     es, word ptr [bp+8]
        mov     al, byte ptr es:[bx+si]
        cbw
        cmp     ax, cx
        je      br_47C73
        inc     si
        cmp     si, 40h
        jl      loop_47C56
        mov     ax, si
        pop     si
        pop     di
        leave
        retf
        db      90h
br_47C70:
        mov     si, 0ffffh
br_47C73:
        mov     ax, si
        pop     si
        pop     di
        leave
        retf
        db      00h
far_47C7A:
        push    bp
        mov     bp, sp
        cmp     word ptr [bp+0ah], 23h
        jl      br_47CA0
        cmp     word ptr [bp+0ah], 62h
        jg      br_47CA0
        push    2
        mov     ax, word ptr [bp+0ah]
        cwd
        push    dx
        push    ax
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    EP_DRAW_UNSIGNED_VALUE_OFF+C1_CSBASE
        mov     sp, bp
        leave
        retf
br_47CA0:
        push    EP_FAR_48768_SEG
        push    EP_FAR_48768_OFF
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        leave
        retf
        db      00h
far_47CB4:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     di, word ptr [bp+6]
        mov     si, word ptr [bp+8]
        push    word ptr [bp+0ah]
        push    si
        push    di
        nop
        push    cs
        call    far_47C7A
        add     sp, 6
        push    2fh
        push    si
        lea     ax, [di+0ch]
        push    ax
        callf   EP_DRAW_CHAR_AT_SEG:EP_DRAW_CHAR_AT_OFF
        add     sp, 6
        push    word ptr [bp+0ah]
        push    word ptr [bp+0eh]
        push    word ptr [bp+0ch]
        nop
        push    cs
        call    far_47C30
        add     sp, 6
        push    ax
        push    si
        lea     ax, [di+12h]
        push    ax
        nop
        push    cs
        call    far_47BC0
        add     sp, 6
        pop     si
        pop     di
        leave
        retf
L_47CFE:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     di, word ptr [bp+8]
        mov     si, word ptr [bp+0ah]
        push    word ptr [bp+0eh]
        push    word ptr [bp+0ch]
        push    si
        push    di
        push    word ptr [bp+6]
        nop
        push    cs
        call    far_47CB4
        add     sp, 0ah
        cmp     si, 23h
        jl      br_47D2C
        cmp     si, 62h
        jg      br_47D2C
        mov     dx, 1
        jmp     br_47D2E
        db      90h
br_47D2C:
        xor     dx, dx
br_47D2E:
        or      dx, dx
        je      br_47D5A
        push    2dh
        push    di
        mov     ax, word ptr [bp+6]
        add     ax, 24h
        push    ax
        callf   EP_DRAW_CHAR_AT_SEG:EP_DRAW_CHAR_AT_OFF
        add     sp, 6
        push    word ptr [bp+12h]
        push    word ptr [bp+10h]
        push    di
        mov     ax, word ptr [bp+6]
        add     ax, 2ah
        push    ax
        nop
        push    cs
        call    far_47D5E
        add     sp, 8
br_47D5A:
        pop     si
        pop     di
        leave
        retf
far_47D5E:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+0ah]
        mov     ax, word ptr [bp+0ch]
        or      ax, si
        jne     br_47D74
        push    EP_L_4782A_SEG
        push    EP_L_4782A_OFF
        jmp     br_47D89
br_47D74:
        mov     ax, word ptr [bp+0ch]
        mov     cx, ds
        cmp     si, C1_TBL_SOUNDS_END
        jne     br_47D92
        cmp     ax, cx
        jne     br_47D92
        push    EP_L_47832_SEG
        push    EP_L_47832_OFF
br_47D89:
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        jmp     br_47DC4
        db      90h
br_47D92:
        mov     ax, si
        mov     dx, word ptr [bp+0ch]
        add     ax, 12h
        push    dx
        push    ax
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        mov     es, word ptr [bp+0ch]
        cmp     byte ptr es:[si+25h], 0
        je      br_47DCC
        push    EP_L_4783E_SEG
        push    EP_L_4783E_OFF
        push    word ptr [bp+8]
        mov     ax, word ptr [bp+6]
        add     ax, 60h
        push    ax
br_47DC4:
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
br_47DCC:
        pop     si
        leave
        retf
        db      00h
L_47DD0:
        push    bp
        mov     bp, sp
        mov     cx, word ptr [bp+0ah]
        mov     ax, cx
        add     ax, 0dh
        or      ax, ax
        jg      br_47DF2
        push    ds
        push    C2_W_07A1D
        mov     ax, word ptr [bp+8]
        inc     ax
        push    ax
        push    word ptr [bp+6]
        nop
        push    cs
        call    EP_DRAW_BITMAP_PTR_OFF+C1_CSBASE
        jmp     SHORT br_47E0A
br_47DF2:
        push    2
        mov     ax, cx
        add     ax, cx
        add     ax, cx
        add     ax, ax
        cwd
        push    dx
        push    ax
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    EP_DRAW_SIGNED_VALUE_OFF+C1_CSBASE
br_47E0A:
        mov     sp, bp
        push    EP_FAR_4877E_SEG
        push    EP_FAR_4877E_OFF
        push    word ptr [bp+8]
        mov     ax, word ptr [bp+6]
        add     ax, 12h
        push    ax
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        leave
        retf
        db      00h
L_47E24:
        enter   0ch, 0
        push    di
        push    si
        mov     di, word ptr [bp+0ah]
        mov     byte ptr [bp-0ch], 7
        mov     al, byte ptr [bp+6]
        mov     byte ptr [bp-0bh], al
        mov     al, byte ptr [bp+8]
        mov     byte ptr [bp-0ah], al
        lea     ax, [bp-9]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], ss
        or      di, di
        jne     br_47E64
        mov     byte ptr [bp-9], 4dh
        lea     bx, [bp-9]
        inc     bx
        mov     word ptr [bp-2], ss
        mov     byte ptr ss:[bx], 49h
        inc     bx
        mov     word ptr [bp-2], ss
        mov     byte ptr ss:[bx], 44h
        jmp     br_47E9B
        db      90h
br_47E64:
        or      di, di
        jl      br_47E6C
        mov     al, 52h
        jmp     br_47E6E
br_47E6C:
        mov     al, 4ch
br_47E6E:
        mov     byte ptr [bp-9], al
        mov     ax, di
        cwd
        xor     ax, dx
        sub     ax, dx
        mov     di, ax
        mov     cx, 0ah
        cwd
        idiv    cx
        add     al, 30h
        lea     bx, [bp-9]
        inc     bx
        mov     word ptr [bp-2], ss
        mov     byte ptr ss:[bx], al
        inc     bx
        mov     word ptr [bp-2], ss
        mov     ax, di
        cwd
        idiv    cx
        add     dl, 30h
        mov     byte ptr ss:[bx], dl
br_47E9B:
        lea     ax, [bx+1]
        mov     si, ax
        mov     word ptr [bp-2], ss
        mov     es, word ptr [bp-2]
        mov     bx, ax
        inc     si
        mov     byte ptr es:[bx], 0
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si], 0
        lea     ax, [bp-0ch]
        push    ss
        push    ax
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        pop     si
        pop     di
        leave
        retf
        db      00h
L_47EC6:
        enter   14h, 0
        push    di
        push    si
        mov     di, word ptr [bp+6]
        mov     si, word ptr [bp+0ch]
        mov     byte ptr [bp-14h], 11h
        mov     byte ptr [bp-11h], 33h
        mov     byte ptr [bp-10h], 1dh
        mov     al, 24h
        mov     byte ptr [bp-0fh], al
        mov     byte ptr [bp-0ah], al
        mov     byte ptr [bp-5], 0bh
        mov     al, 23h
        mov     byte ptr [bp-9], al
        mov     byte ptr [bp-8], al
        mov     byte ptr [bp-7], al
        mov     byte ptr [bp-6], al
        mov     byte ptr [bp-4], al
        mov     byte ptr [bp-3], al
        mov     byte ptr [bp-2], al
        mov     byte ptr [bp-1], 0
        mov     cx, 5
        mov     ax, si
        cwd
        idiv    cx
        mov     si, ax
        mov     ax, di
        mov     byte ptr [bp-13h], al
        mov     dl, byte ptr [bp+8]
        mov     byte ptr [bp-12h], dl
        mov     byte ptr [bp-0eh], al
        add     dl, 1ch
        mov     byte ptr [bp-0dh], dl
        mov     ax, word ptr [bp+0ah]
        cwd
        idiv    cx
        mov     word ptr [bp+0ah], ax
        mov     cx, di
        add     al, cl
        mov     byte ptr [bp-0ch], al
        mov     al, byte ptr [bp+8]
        add     al, 9
        mov     byte ptr [bp-0bh], al
        cmp     word ptr [bp+0eh], 0
        jne     br_47F76
        mov     bx, di
        lea     ax, [bx+32h]
        mov     byte ptr [bp-7], al
        mov     cl, byte ptr [bp-0dh]
        mov     byte ptr [bp-6], cl
        mov     cx, si
        sub     al, cl
        mov     byte ptr [bp-9], al
        mov     al, byte ptr [bp-0bh]
        mov     byte ptr [bp-8], al
        mov     byte ptr [bp-5], 0bh
        mov     dl, byte ptr [bp-0ch]
        mov     byte ptr [bp-4], dl
        mov     byte ptr [bp-3], al
        mov     al, 32h
        sub     al, byte ptr [bp+0ah]
        sub     al, cl
        mov     byte ptr [bp-2], al
        jmp     br_47F93
        db      90h
br_47F76:
        mov     al, byte ptr [bp-0ch]
        mov     byte ptr [bp-9], al
        mov     cl, byte ptr [bp-0bh]
        mov     byte ptr [bp-8], cl
        mov     cx, si
        add     al, cl
        mov     byte ptr [bp-7], al
        mov     al, byte ptr [bp-0dh]
        mov     byte ptr [bp-6], al
        mov     byte ptr [bp-5], 0
br_47F93:
        lea     ax, [bp-14h]
        push    ss
        push    ax
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        pop     si
        pop     di
        leave
        retf
far_47FA4:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     di, word ptr [bp+8]
        mov     si, word ptr [bp+6]
        push    8
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    di
        push    si
        nop
        push    cs
        call    EP_DRAW_UNSIGNED_VALUE_OFF+C1_CSBASE
        add     sp, 0ah
        lea     ax, [di+7]
        sub     ah, ah
        mov     di, ax
        push    ax
        lea     ax, [si+0bh]
        sub     ah, ah
        mov     si, ax
        push    ax
        nop
        push    cs
        call    far_4EAD4
        add     sp, 4
        push    di
        add     si, 12h
        push    si
        nop
        push    cs
        call    far_4EAD4
        add     sp, 4
        pop     si
        pop     di
        leave
        retf
field_engine_redraw:
        enter   0ch, 0
        push    di
        push    si
        mov     ax, word ptr [C2_W_FE_DESC_OFF]
        mov     dx, word ptr [C2_W_08B1C]
        mov     si, ax
        mov     word ptr [bp-0ah], dx
        mov     bx, ax
        mov     es, dx
        mov     cx, word ptr es:[bx+4]
        mov     al, byte ptr es:[bx]
        sub     ah, ah
        mov     word ptr [bp-4], ax
        mov     al, byte ptr es:[bx+1]
        mov     word ptr [bp-6], ax
        mov     al, byte ptr es:[bx+3]
        mov     word ptr [bp-8], ax
        mov     di, word ptr es:[bx+4]
        and     di, 0f0h
        sar     di, 4
        test    byte ptr [FE_FLAGS], 1
        jne     br_4802F
        jmp     br_480B0
br_4802F:
        or      cx, cx
        jge     br_48056
        mov     al, byte ptr [FE_FLAGS]
        and     ax, 2
        cmp     ax, 1
        sbb     ax, ax
        and     al, 0f3h
        add     ax, 2dh
        push    ax
        push    word ptr [bp-6]
        push    word ptr [bp-4]
        callf   EP_DRAW_CHAR_AT_SEG:EP_DRAW_CHAR_AT_OFF
        add     sp, 6
        add     word ptr [bp-4], 6
br_48056:
        or      di, di
        je      br_4807A
        push    di
        mov     ax, word ptr [bp-8]
        sub     ax, di
        push    ax
        push    word ptr [C2_W_FE_PENDING_HI]
        push    word ptr [C2_W_FE_PENDING_LO]
        push    word ptr [bp-6]
        push    word ptr [bp-4]
        nop
        push    cs
        call    EP_DRAW_FIXED_DECIMAL_OFF+C1_CSBASE
        add     sp, 0ch
        jmp     br_48093
        db      90h
br_4807A:
        push    word ptr [bp-8]
        push    word ptr [C2_W_FE_PENDING_HI]
        push    word ptr [C2_W_FE_PENDING_LO]
        push    word ptr [bp-6]
        push    word ptr [bp-4]
        nop
        push    cs
        call    EP_DRAW_UNSIGNED_VALUE_OFF+C1_CSBASE
        add     sp, 0ah
br_48093:
        push    0
        mov     es, word ptr [bp-0ah]
        mov     al, byte ptr es:[si+2]
        sub     ah, ah
        push    ax
        mov     al, byte ptr es:[si+1]
        add     ax, 8
        push    ax
        mov     al, byte ptr es:[si]
        sub     ah, ah
        push    ax
        jmp     br_480E5
        db      90h
br_480B0:
        cmp     byte ptr [C2_B_08B2E], 0
        je      br_480D6
        mov     si, ax
        mov     al, byte ptr [C2_B_08B2E]
        sub     ah, ah
        sub     si, ax
        or      cx, cx
        jge     br_480C5
        inc     si
br_480C5:
        mov     al, byte ptr [C2_B_08B2E]
        sub     ah, ah
        cmp     ax, di
        jge     br_480CF
        inc     si
br_480CF:
        mov     ax, 6
        imul    si
        jmp     br_480DC
br_480D6:
        mov     al, byte ptr es:[si+2]
        sub     ah, ah
br_480DC:
        push    8
        push    ax
        push    word ptr [bp-6]
        push    word ptr [bp-4]
br_480E5:
        callf   EP_DRAW_INVERT_BOX_SEG:EP_DRAW_INVERT_BOX_OFF
        add     sp, 8
        pop     si
        pop     di
        leave
        retf
        db      00h
field_nav_up:
        enter   4, 0
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        les     bx, [C2_W_FE_DESC_OFF]
        mov     ax, word ptr es:[bx+FIELD_UP]
        mov     dx, word ptr es:[bx+FIELD_UP+2]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_48115
        callf   [bp-4]
br_48115:
        pop     ds
        leave
        retf
field_nav_down:
        enter   4, 0
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        les     bx, [C2_W_FE_DESC_OFF]
        mov     ax, word ptr es:[bx+FIELD_DOWN]
        mov     dx, word ptr es:[bx+FIELD_DOWN+2]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_4813B
        callf   [bp-4]
br_4813B:
        pop     ds
        leave
        retf
field_nav_left:
        enter   4, 0
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        les     bx, [C2_W_FE_DESC_OFF]
        mov     ax, word ptr es:[bx+FIELD_LEFT]
        mov     dx, word ptr es:[bx+FIELD_LEFT+2]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_48161
        callf   [bp-4]
br_48161:
        pop     ds
        leave
        retf
field_nav_right:
        enter   4, 0
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        les     bx, [C2_W_FE_DESC_OFF]
        mov     ax, word ptr es:[bx+FIELD_RIGHT]
        mov     dx, word ptr es:[bx+FIELD_RIGHT+2]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_48187
        callf   [bp-4]
br_48187:
        pop     ds
        leave
        retf
field_digit_cursor_inc:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        les     bx, [C2_W_FE_DESC_OFF]
        sub     ah, ah
        mov     al, byte ptr es:[bx+3]
        mov     cl, byte ptr [C2_B_08B2E]
        sub     ch, ch
        inc     cx
        cmp     ax, cx
        jle     br_481A9
        inc     byte ptr [C2_B_08B2E]
br_481A9:
        pop     ds
        retf
        db      00h
field_digit_cursor_dec:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        cmp     byte ptr [C2_B_08B2E], 0
        je      br_481BD
        dec     byte ptr [C2_B_08B2E]
br_481BD:
        pop     ds
        retf
        db      00h
field_digit_commit:
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        test    byte ptr [C2_B_FE_FLAGS], 1
        jne     br_481D2
        jmp     br_48284
br_481D2:
        and     byte ptr [C2_B_FE_FLAGS], 0feh
        test    byte ptr [C2_B_FE_FLAGS], 2
        je      br_481EB
        neg     word ptr [C2_W_FE_PENDING_LO]
        adc     word ptr [C2_W_FE_PENDING_HI], 0
        neg     word ptr [C2_W_FE_PENDING_HI]
br_481EB:
        les     bx, [C2_W_FE_DESC_OFF]
        test    byte ptr es:[bx+5], 20h
        je      br_48200
        sub     word ptr [C2_W_FE_PENDING_LO], 1
        sbb     word ptr [C2_W_FE_PENDING_HI], 0
br_48200:
        mov     ax, word ptr [C2_W_FE_PENDING_LO]
        mov     dx, word ptr [C2_W_FE_PENDING_HI]
        cmp     word ptr es:[bx+0ch], dx
        jg      br_48224
        jl      br_48215
        cmp     word ptr es:[bx+0ah], ax
        jae     br_48224
br_48215:
        mov     ax, word ptr es:[bx+0ah]
        mov     dx, word ptr es:[bx+0ch]
        mov     word ptr [C2_W_FE_PENDING_LO], ax
        mov     word ptr [C2_W_FE_PENDING_HI], dx
br_48224:
        cmp     word ptr es:[bx+8], dx
        jl      br_48241
        jg      br_48232
        cmp     word ptr es:[bx+6], ax
        jbe     br_48241
br_48232:
        mov     ax, word ptr es:[bx+6]
        mov     dx, word ptr es:[bx+8]
        mov     word ptr [C2_W_FE_PENDING_LO], ax
        mov     word ptr [C2_W_FE_PENDING_HI], dx
br_48241:
        mov     ax, word ptr [C2_W_FE_VALUE_OFF]
        mov     dx, word ptr [C2_W_08B20]
        mov     cl, byte ptr es:[bx+4]
        and     cx, 0fh
        mov     di, ax
        mov     si, C2_W_FE_PENDING_LO
        mov     es, dx
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        les     bx, [C2_W_FE_DESC_OFF]
        mov     ax, word ptr es:[bx+24h]
        or      ax, word ptr es:[bx+22h]
        je      br_4827B
        push    word ptr [C2_W_FE_PENDING_HI]
        push    word ptr [C2_W_FE_PENDING_LO]
        db      26h, 0ffh, 5fh, 22h
        add     sp, 4
br_4827B:
        and     byte ptr [C2_B_FE_FLAGS], 0fdh
        pop     ds
        pop     si
        pop     di
        retf
br_48284:
        xor     ax, ax
        callf   EP_FIELD_DIGIT_ACCUMULATE_SEG:EP_FIELD_DIGIT_ACCUMULATE_OFF
        les     bx, [C2_W_FE_DESC_OFF]
        cmp     word ptr es:[bx+4], 0
        jge     br_4829B
        or      byte ptr [C2_B_FE_FLAGS], 2
br_4829B:
        pop     ds
        pop     si
        pop     di
        retf
        db      00h
field_digit_entry_reset:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        and     byte ptr [C2_B_FE_FLAGS], 0fch
        pop     ds
        retf
        db      00h
L_482AE:
        enter   8, 0
        push    si
        les     bx, [C2_W_FE_VALUE_OFF]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     ax, C1_TBL_SOUNDS_END
        mov     cx, ds
        cmp     ax, word ptr [C0_W_098DC]
        jne     br_482D4
        cmp     cx, word ptr [C0_W_098DE]
        je      br_48339
br_482D4:
        mov     ax, dx
        or      ax, si
        jne     br_482E8
        mov     ax, word ptr [C0_W_098DC]
        mov     dx, word ptr [C0_W_098DE]
        mov     si, ax
        mov     word ptr [bp-2], dx
        jmp     br_4830C
br_482E8:
        mov     bx, word ptr [bp+0ah]
loop_482EB:
        mov     ax, C1_TBL_SOUNDS_END
        mov     cx, ds
        mov     es, dx
        cmp     word ptr es:[si], ax
        jne     br_482FD
        cmp     word ptr es:[si+2], cx
        je      br_4830C
br_482FD:
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     si, ax
        mov     word ptr [bp-2], dx
        dec     bx
        jne     loop_482EB
br_4830C:
        mov     ax, word ptr [bp-2]
        les     bx, [C2_W_FE_VALUE_OFF]
        mov     word ptr es:[bx], si
        mov     word ptr es:[bx+2], ax
        les     bx, [bp+6]
        mov     ax, word ptr es:[bx+22h]
        mov     dx, word ptr es:[bx+24h]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      br_48339
        push    word ptr [bp-2]
        push    si
        callf   [bp-8]
        add     sp, 4
br_48339:
        pop     si
        leave
        retf
L_4833C:
        enter   8, 0
        push    di
        push    si
        les     bx, [C2_W_FE_VALUE_OFF]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     br_48359
        jmp     br_483D9
br_48359:
        mov     ax, C1_TBL_SOUNDS_END
        mov     cx, ds
        cmp     ax, word ptr [C0_W_098DC]
        jne     br_4836A
        cmp     cx, word ptr [C0_W_098DE]
        je      br_483D9
br_4836A:
        mov     bx, word ptr [bp+0ah]
loop_4836D:
        mov     ax, word ptr [bp-2]
        cmp     si, word ptr [C0_W_098DC]
        jne     br_4837C
        cmp     ax, word ptr [C0_W_098DE]
        je      br_48394
br_4837C:
        mov     es, ax
        mov     ax, word ptr es:[si+4]
        mov     dx, word ptr es:[si+6]
        mov     si, ax
        mov     word ptr [bp-2], dx
        dec     bx
        jne     loop_4836D
        mov     di, word ptr [bp+6]
        jmp     br_483AC
        db      90h
br_48394:
        mov     di, word ptr [bp+6]
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[di+8]
        or      ax, word ptr es:[di+6]
        jne     br_483AC
        xor     ax, ax
        cwd
        mov     si, ax
        mov     word ptr [bp-2], dx
br_483AC:
        mov     ax, word ptr [bp-2]
        les     bx, [C2_W_FE_VALUE_OFF]
        mov     word ptr es:[bx], si
        mov     word ptr es:[bx+2], ax
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[di+22h]
        mov     dx, word ptr es:[di+24h]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      br_483D9
        push    word ptr [bp-2]
        push    si
        callf   [bp-8]
        add     sp, 4
br_483D9:
        pop     si
        pop     di
        leave
        retf
        db      00h
L_47A80:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    EP_FAR_483FC_SEG
        push    EP_FAR_483FC_OFF
        push    word ptr [C2_W_08B20]
        push    word ptr [FE_VALUE]
        nop
        push    cs
        call    EP_FAR_3EE00_OFF+C1_CSBASE
        add     sp, 8
        pop     ds
        retf
far_483FC:
        enter   8, 0
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     cx, ax
        mov     word ptr [bp-6], dx
        les     bx, [C2_W_FE_DESC_OFF]
        mov     ax, word ptr es:[bx+22h]
        mov     dx, word ptr es:[bx+24h]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_4842E
        push    word ptr [bp-6]
        push    cx
        callf   [bp-4]
        add     sp, 4
        pop     ds
        leave
        retf
br_4842E:
        mov     ax, 1
        pop     ds
        leave
        retf
far_48434:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [FE_COMMITTED]
        sub     ah, ah
        push    ax
        push    word ptr [bp+8]
        nop
        push    cs
        call    EP_L_3F3D0_OFF+C1_CSBASE
        add     sp, 4
        les     bx, [FE_VALUE]
        mov     byte ptr es:[bx], al
        push    ax
        push    word ptr [bp+6]
        nop
        push    cs
        call    EP_DRUM_PROGRAM_SELECT_OFF+C1_CSBASE
        add     sp, 4
        leave
        retf
        db      00h
L_4845E:
        push    bp
        mov     bp, sp
        push    word ptr [bp+6]
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    far_48434
        leave
        retf
        db      00h
far_48472:
        push    bp
        mov     bp, sp
        push    word ptr [bp+6]
        mov     al, byte ptr [C2_B_MIXER_DRUM]
        cbw
        push    ax
        nop
        push    cs
        call    far_48434
        leave
        retf
far_48484:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [FE_COMMITTED]
        sub     ah, ah
        push    ax
        push    word ptr [bp+6]
        nop
        push    cs
        call    EP_L_3F3D0_OFF+C1_CSBASE
        add     sp, 4
        les     bx, [FE_VALUE]
        mov     byte ptr es:[bx], al
        leave
        retf
        db      00h
name_field_enter:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+6]
        push    word ptr [bp+8]
        push    si
        push    0
        push    0
        nop
        push    cs
        call    EP_FAR_3FE9E_OFF+C1_CSBASE
        add     sp, 8
        or      ax, ax
        jne     br_484D0
        push    word ptr [bp+8]
        push    si
        nop
        push    cs
        call    name_split_number_suffix
        add     sp, 4
        mov     ax, 1
        pop     si
        leave
        retf
        db      90h
br_484D0:
        xor     ax, ax
        pop     si
        leave
        retf
        db      00h
far_484D6:
        enter   18h, 0
        push    di
        push    si
        mov     ax, word ptr [bp+0ch]
        or      ax, word ptr [bp+0ah]
        je      br_4850E
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    name_split_number_suffix
        add     sp, 4
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    0
        push    0
        nop
        push    cs
        call    EP_FAR_3FE9E_OFF+C1_CSBASE
        add     sp, 8
        or      ax, ax
        jne     br_4850E
        les     di, [bp+0ah]
        jmp     br_485FF
br_4850E:
        push    ds
        mov     di, C2_W_08B32
        lea     si, [bp-18h]
        mov     cx, ds
        mov     es, cx
        mov     cx, ss
        mov     ds, cx
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        xchg    di, si
        push    ds
        push    es
        pop     ds
        pop     es
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        mov     word ptr [bp-2], ax
        mov     di, ax
loop_4853C:
        cmp     byte ptr [di+C2_TBL_08B32], 20h
        je      br_48549
        inc     di
        cmp     di, 10h
        jl      loop_4853C
br_48549:
        mov     word ptr [bp-2], di
loop_4854C:
        mov     si, di
        inc     word ptr [C2_W_AUTONAME_NUM]
        cmp     word ptr [C2_W_AUTONAME_NUM], 3e7h
        jbe     br_48560
        mov     word ptr [C2_W_AUTONAME_NUM], 0
br_48560:
        cmp     word ptr [C2_W_AUTONAME_NUM], 64h
        jb      br_48574
        lea     ax, [si+3]
        cmp     ax, 10h
        jle     br_48574
        mov     si, 0dh
        jmp     br_48593
br_48574:
        cmp     word ptr [C2_W_AUTONAME_NUM], 0ah
        jb      br_48588
        lea     ax, [si+2]
        cmp     ax, 10h
        jle     br_48588
        mov     si, 0eh
        jmp     br_48593
br_48588:
        lea     ax, [si+1]
        cmp     ax, 10h
        jle     br_48593
        mov     si, 0fh
br_48593:
        push    64h
        push    word ptr [C2_W_AUTONAME_NUM]
        callf   EP_DIV_SEG:EP_DIV_OFF
        add     sp, 4
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-4], dx
        or      ax, ax
        je      br_485B4
        mov     al, byte ptr [bp-6]
        add     al, 30h
        mov     byte ptr [bp+si-18h], al
        inc     si
br_485B4:
        mov     cx, 0ah
        mov     ax, word ptr [bp-4]
        cwd
        idiv    cx
        mov     word ptr [bp-4], ax
        cmp     word ptr [bp-6], 0
        jne     br_485CA
        or      ax, ax
        je      br_485D3
br_485CA:
        mov     al, byte ptr [bp-4]
        add     al, 30h
        mov     byte ptr [bp+si-18h], al
        inc     si
br_485D3:
        mov     ax, word ptr [C2_W_AUTONAME_NUM]
        sub     dx, dx
        div     cx
        add     dl, 30h
        mov     byte ptr [bp+si-18h], dl
        lea     ax, [bp-18h]
        push    ss
        push    ax
        push    0
        push    0
        nop
        push    cs
        call    EP_FAR_3FE9E_OFF+C1_CSBASE
        add     sp, 8
        or      ax, ax
        je      br_485F8
        jmp     loop_4854C
br_485F8:
        lea     di, [bp-18h]
        mov     cx, ss
        mov     es, cx
br_485FF:
        push    ds
        lds     si, [bp+6]
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        xchg    di, si
        push    ds
        push    es
        pop     ds
        pop     es
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        pop     si
        pop     di
        leave
        retf
        db      00h
name_split_number_suffix:
        enter   2, 0
        push    di
        push    si
        mov     word ptr [C2_W_AUTONAME_NUM], 0
        mov     ax, 2020h
        mov     bx, C2_W_08B32
        mov     cx, 8
        mov     di, bx
        push    ds
        pop     es
        rep stosw
        mov     byte ptr [C2_B_08B42], 0
        push    ds
        mov     si, bx
        les     di, [bp+6]
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        xchg    di, si
        push    ds
        push    es
        pop     ds
        pop     es
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        mov     word ptr [bp-2], 0fh
        mov     si, word ptr [bp-2]
loop_4866E:
        cmp     byte ptr [si+C2_TBL_08B32], 20h
        je      br_48687
        mov     al, byte ptr [si+C2_TBL_08B32]
        cbw
        mov     bx, ax
        test    byte ptr [bx+C2_B_076CB], 4
        jne     br_48687
        or      al, al
        jne     br_4868A
br_48687:
        dec     si
        jns     loop_4866E
br_4868A:
        mov     word ptr [C2_W_AUTONAME_NUM], 0
        inc     si
        cmp     si, 10h
        jge     br_486C5
loop_48696:
        mov     al, byte ptr [si+C2_TBL_08B32]
        cbw
        mov     bx, ax
        test    byte ptr [bx+C2_B_076CB], 4
        je      br_486BA
        cbw
        mov     cx, word ptr [C2_W_AUTONAME_NUM]
        mov     dx, cx
        shl     cx, 2
        add     cx, dx
        add     cx, cx
        add     ax, cx
        sub     ax, 30h
        mov     word ptr [C2_W_AUTONAME_NUM], ax
br_486BA:
        mov     byte ptr [si+C2_TBL_08B32], 20h
        inc     si
        cmp     si, 10h
        jl      loop_48696
br_486C5:
        cmp     word ptr [C2_W_AUTONAME_NUM], 3e7h
        jbe     br_486D3
        mov     word ptr [C2_W_AUTONAME_NUM], 0
br_486D3:
        pop     si
        pop     di
        leave
        retf
        db      00h
far_486D8:
        enter   8, 0
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        push    0
        push    193ch
        mov     bx, word ptr [bp+0ch]
        add     bx, bx
        mov     ax, word ptr [bx+TBL_PITCH_RATIO]
        imul    word ptr [bp+0ah]
        push    dx
        push    ax
        callf   EP_AFLMUL_SEG:EP_AFLMUL_OFF
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     ax, word ptr [bp-6]
        or      ax, word ptr [bp-8]
        je      L_47DE4
        push    0
        push    2
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        add     ax, word ptr [bp-4]
        adc     dx, word ptr [bp-2]
        cmp     dx, word ptr [bp-2]
        jl      L_47DE4
        jg      br_4872F
        cmp     ax, word ptr [bp-4]
        jb      L_47DE4
br_4872F:
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        lea     ax, [bp-4]
        push    ss
        push    ax
        callf   EP_AFFALDIV_SEG:EP_AFFALDIV_OFF
        jmp     br_4874C
        db      90h
L_47DE4:
        mov     word ptr [bp-4], 7fffh
        mov     word ptr [bp-2], 0
br_4874C:
        cmp     word ptr [bp-2], 0
        jg      br_48760
        jl      br_4875B
        cmp     word ptr [bp-4], 2710h
        jae     br_48760
br_4875B:
        mov     ax, word ptr [bp-4]
        leave
        retf
br_48760:
        xor     ax, ax
        leave
        retf
L_4782A:
        db      4fh, 46h, 46h, 00h
far_48768:
        db      2dh, 2dh, 00h, 00h
L_47832:
        db      "(no sound)"
        db      00h, 00h
L_4783E:
        db      "(ST)"
        db      00h, 00h
far_4877E:
        db      64h, 42h, 00h, 00h
far_48782:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    EP_VOICES_RELEASE_ALL_OFF+C1_CSBASE
resume_4878D:
        push    0
        push    0
        callf   EP_EVENT_CB_SET_MAIN_SEG:EP_EVENT_CB_SET_MAIN_OFF
        add     sp, 4
        mov     byte ptr [C2_B_06474], 0
        callf   EP_FAR_5545E_SEG:EP_FAR_5545E_OFF
        callf   EP_ASIC_REG1_BANK_CLEAR_SEG:EP_ASIC_REG1_BANK_CLEAR_OFF
        nop
        push    cs
        call    EP_SMEM_COMPACT_OFF+C1_CSBASE
        sub     ax, ax
        mov     word ptr [C2_W_REC_SOUND_SEG], ax
        mov     word ptr [C2_FP_REC_SOUND], ax
        mov     word ptr [C2_W_08B48], ax
        mov     word ptr [C2_W_REC_STATE], ax
        nop
        push    cs
        call    far_489C6
        pop     ds
        retf
far_487C2:
        nop
        push    cs
        call    far_49092
        nop
        push    cs
        call    far_490A6
        or      ax, ax
        je      br_487FB
        nop
        push    cs
        call    far_49266
        push    0
        nop
        push    cs
        call    far_49308
        add     sp, 2
        xor     al, al
        mov     byte ptr [C2_B_098BC], al
        mov     byte ptr [C2_B_REC_CANCEL_REQ], al
        mov     byte ptr [C2_B_08EBE], al
        mov     byte ptr [C2_B_08FCA], al
        push    C1_SEG
        if      FW_VERSION >= 112
        push    EP_L_487FC_OFF
        else
        push    C2_W_0A63E
        endif
        callf   EP_EVENT_CB_SET_MAIN_SEG:EP_EVENT_CB_SET_MAIN_OFF
        add     sp, 4
br_487FB:
        retf
L_487FC:
        cmp     byte ptr [C2_B_098BC], 0
        je      br_4882E
        nop
        push    cs
        call    far_493E4
        or      ax, ax
        je      br_4882E
        push    0
        push    0
        callf   EP_EVENT_CB_SET_MAIN_SEG:EP_EVENT_CB_SET_MAIN_OFF
        add     sp, 4
        push    EP_L_48860_SEG
        push    EP_L_48860_OFF
        callf   EP_EVENT_CB_SET_MAIN_SEG:EP_EVENT_CB_SET_MAIN_OFF
        add     sp, 4
        mov     word ptr [C2_W_REC_STATE], 1
        retf
        db      90h
br_4882E:
        cmp     byte ptr [C2_B_REC_CANCEL_REQ], 0
        je      br_4885F
        push    0
        push    0
        callf   EP_EVENT_CB_SET_MAIN_SEG:EP_EVENT_CB_SET_MAIN_OFF
        add     sp, 4
        nop
        push    cs
        call    far_493D2
        push    32h
        nop
        push    cs
        if      FW_VERSION >= 112
        call    far_4EE54
        elseif  FW_VERSION >= 110
        db      0e8h, 35h, 66h
        else
        call    EP_DELAY_TICKS_OFF+C1_CSBASE
        endif
        add     sp, 2
        nop
        push    cs
        call    far_49218
        nop
        push    cs
        call    far_491A8
        nop
        push    cs
        call    far_487C2
br_4885F:
        retf
L_48860:
        cmp     byte ptr [C2_B_REC_CANCEL_REQ], 0
        je      br_488A8
        push    0
        push    0
        callf   EP_EVENT_CB_SET_MAIN_SEG:EP_EVENT_CB_SET_MAIN_OFF
        add     sp, 4
        nop
        push    cs
        call    far_493D2
        push    32h
        nop
        push    cs
        if      FW_VERSION >= 112
        call    far_4EE54
        elseif  FW_VERSION >= 110
        db      0e8h, 03h, 66h
        else
        call    EP_DELAY_TICKS_OFF+C1_CSBASE
        endif
        add     sp, 2
        nop
        push    cs
        call    far_49218
        nop
        push    cs
        call    far_491A8
        push    word ptr [C2_W_REC_SOUND_SEG]
        push    word ptr [C2_FP_REC_SOUND]
        nop
        push    cs
        call    EP_SOUND_LIST_UNLINK_OFF+C1_CSBASE
        add     sp, 4
        sub     ax, ax
        mov     word ptr [C2_W_REC_SOUND_SEG], ax
        mov     word ptr [C2_FP_REC_SOUND], ax
        mov     word ptr [C2_W_REC_STATE], ax
        retf
br_488A8:
        nop
        push    cs
        call    far_49816
        or      ax, ax
        je      br_488B6
        mov     byte ptr [C2_B_08EBE], 1
br_488B6:
        cmp     byte ptr [C2_B_08EBE], 0
        je      br_488F1
        push    0
        push    0
        callf   EP_EVENT_CB_SET_MAIN_SEG:EP_EVENT_CB_SET_MAIN_OFF
        add     sp, 4
        nop
        push    cs
        call    far_493D2
        nop
        push    cs
        call    far_49602
        push    1
        nop
        push    cs
        call    far_49308
        add     sp, 2
        push    C1_SEG
        if      FW_VERSION >= 112
        push    EP_L_488F2_OFF
        else
        push    C2_W_0A734
        endif
        callf   EP_EVENT_CB_SET_MAIN_SEG:EP_EVENT_CB_SET_MAIN_OFF
        add     sp, 4
        mov     word ptr [C2_W_REC_STATE], 2
br_488F1:
        retf
L_488F2:
        cmp     byte ptr [C2_B_REC_CANCEL_REQ], 0
        je      br_4893A
        push    0
        push    0
        callf   EP_EVENT_CB_SET_MAIN_SEG:EP_EVENT_CB_SET_MAIN_OFF
        add     sp, 4
        nop
        push    cs
        call    far_493D2
        push    32h
        nop
        push    cs
        if      FW_VERSION >= 112
        call    far_4EE54
        elseif  FW_VERSION >= 110
        db      0e8h, 71h, 65h
        else
        call    EP_DELAY_TICKS_OFF+C1_CSBASE
        endif
        add     sp, 2
        nop
        push    cs
        call    far_49218
        nop
        push    cs
        call    far_491A8
        push    word ptr [C2_W_REC_SOUND_SEG]
        push    word ptr [C2_FP_REC_SOUND]
        nop
        push    cs
        call    EP_SOUND_LIST_UNLINK_OFF+C1_CSBASE
        add     sp, 4
        sub     ax, ax
        mov     word ptr [C2_W_REC_SOUND_SEG], ax
        mov     word ptr [C2_FP_REC_SOUND], ax
        mov     word ptr [C2_W_REC_STATE], ax
        retf
br_4893A:
        nop
        push    cs
        call    far_49668
        or      ax, ax
        je      br_4894D
        mov     byte ptr [C2_B_REC_CANCEL_REQ], 0
        mov     byte ptr [C2_B_08FCA], 1
br_4894D:
        cmp     byte ptr [C2_B_08FCA], 0
        je      br_4897F
        push    0
        push    0
        callf   EP_EVENT_CB_SET_MAIN_SEG:EP_EVENT_CB_SET_MAIN_OFF
        add     sp, 4
        nop
        push    cs
        call    far_493D2
        push    32h
        nop
        push    cs
        if      FW_VERSION >= 112
        call    far_4EE54
        elseif  FW_VERSION >= 110
        db      0e8h, 16h, 65h
        else
        call    EP_DELAY_TICKS_OFF+C1_CSBASE
        endif
        add     sp, 2
        nop
        push    cs
        call    far_49218
        nop
        push    cs
        call    far_491A8
        mov     word ptr [C2_W_REC_STATE], 3
br_4897F:
        retf
far_48980:
        mov     cx, word ptr [C2_W_REC_STATE]
        cmp     cx, word ptr [C2_W_08B48]
        je      br_489C2
        mov     ax, cx
        mov     word ptr [C2_W_08B48], cx
        or      ax, cx
        je      br_489A0
        dec     ax
        je      br_489A8
        dec     ax
        je      br_489B0
        dec     ax
        je      br_489B8
        jmp     br_489BD
        db      90h
br_489A0:
        nop
        push    cs
        call    far_489C6
        jmp     br_489BD
        db      90h
br_489A8:
        nop
        push    cs
        call    far_48A04
        jmp     br_489BD
        db      90h
br_489B0:
        nop
        push    cs
        call    far_48A12
        jmp     br_489BD
        db      90h
br_489B8:
        nop
        push    cs
        call    far_48A20
br_489BD:
        mov     ax, 1
        retf
        db      90h
br_489C2:
        xor     ax, ax
        retf
        db      00h
far_489C6:
        nop
        push    cs
        call    far_48F64
        nop
        push    cs
        call    far_48FBA
        push    ds
        push    C2_W_012EA
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        cmp     word ptr [C2_W_SAMPLE_REC_CURSOR], 0
        jl      L_4808C
        cmp     word ptr [C2_W_SAMPLE_REC_CURSOR], 6
        jb      br_489F0
L_4808C:
        mov     word ptr [C2_W_SAMPLE_REC_CURSOR], 0
br_489F0:
        imul    bx, word ptr [C2_W_SAMPLE_REC_CURSOR], 2ah
        callf   [bx+C2_TBL_01446]
        nop
        push    cs
        call    far_487C2
        nop
        push    cs
        call    far_496B0
        retf
far_48A04:
        push    ds
        push    C2_W_01312
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        retf
        db      00h
far_48A12:
        push    ds
        push    C2_W_01336
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        retf
        db      00h
far_48A20:
        nop
        push    cs
        call    far_4982C
        mov     ax, word ptr [C2_FP_REC_SOUND]
        mov     dx, word ptr [C2_W_REC_SOUND_SEG]
        mov     word ptr [C0_W_0D7C2], ax
        mov     word ptr [C0_W_0D7C4], dx
        sub     ax, ax
        mov     word ptr [C2_W_REC_SOUND_SEG], ax
        mov     word ptr [C2_FP_REC_SOUND], ax
        nop
        push    cs
        call    sample_record_refresh
        nop
        push    cs
        call    far_49C2C
        nop
        push    cs
        call    EP_DISP_REQUEST_FLUSH_OFF+C1_CSBASE
        retf
        db      00h
sample_record_reset_peak:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     ax, 0ffc1h
        mov     word ptr [C2_W_08B50], ax
        mov     word ptr [C2_W_08B4E], ax
        mov     ax, 0ffc0h
        mov     word ptr [C2_W_08B54], ax
        mov     word ptr [C2_W_08B52], ax
        pop     ds
        retf
sample_record_record:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    EP_FAR_3FE60_OFF+C1_CSBASE
        cmp     ax, 100h
        jl      br_48A86
        push    EP_MSG_SOUND_DIR_FULL_SEG
        push    EP_MSG_SOUND_DIR_FULL_OFF
        callf   EP_DISP_ALERT_WAIT_KEY_SEG:EP_DISP_ALERT_WAIT_KEY_OFF
        add     sp, 4
        pop     ds
        retf
br_48A86:
        cmp     word ptr [C1_W_0D7D2], 0
        je      br_48A92
        mov     byte ptr [C2_B_098BC], 1
br_48A92:
        pop     ds
        retf
sample_record_cancel:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        cmp     word ptr [C2_W_REC_STATE], 1
        je      L_4814A
        cmp     word ptr [C2_W_REC_STATE], 2
        jne     br_48AAD
L_4814A:
        mov     byte ptr [C2_B_REC_CANCEL_REQ], 1
br_48AAD:
        pop     ds
        retf
        db      00h
sample_record_start:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     byte ptr [C2_B_08EBE], 1
        pop     ds
        retf
        db      00h
sample_record_stop:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     byte ptr [C2_B_08FCA], 1
        pop     ds
        retf
        db      00h
sample_record_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
resume_48AD2:
        nop
        push    cs
        call    sample_record_refresh
        nop
        push    cs
        call    far_49ADA
        pop     ds
        retf
sample_record_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
resume_48AE4:
        nop
        push    cs
        call    far_493D2
        push    32h
        nop
        push    cs
        if      FW_VERSION >= 112
        call    far_4EE54
        elseif  FW_VERSION >= 110
        db      0e8h, 92h, 63h
        else
        call    EP_DELAY_TICKS_OFF+C1_CSBASE
        endif
        add     sp, 2
        nop
        push    cs
        call    far_49218
        nop
        push    cs
        call    far_491A8
resume_48AFD:
        mov     ax, word ptr [C2_W_REC_SOUND_SEG]
        or      ax, word ptr [C2_FP_REC_SOUND]
        je      br_48B16
        push    word ptr [C2_W_REC_SOUND_SEG]
        push    word ptr [C2_FP_REC_SOUND]
        nop
        push    cs
        call    EP_SOUND_LIST_UNLINK_OFF+C1_CSBASE
        add     sp, 4
br_48B16:
        mov     byte ptr [C2_B_06474], 1
        callf   EP_FAR_5545E_SEG:EP_FAR_5545E_OFF
        push    EP_SAMPLE_ERROR_HANDLER_SEG
        push    EP_SAMPLE_ERROR_HANDLER_OFF
        callf   EP_EVENT_CB_SET_MAIN_SEG:EP_EVENT_CB_SET_MAIN_OFF
        add     sp, 4
        pop     ds
        retf
sample_record_key_33:
        push    bp
        mov     bp, sp
        push    ax
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_48980
        or      ax, ax
        jne     br_48B9F
        nop
        push    cs
        call    far_491D0
        or      ax, ax
        jne     br_48B72
        cmp     byte ptr [C2_B_0D7CC], 0
        je      br_48B69
        nop
        push    cs
        call    far_49070
        or      ax, ax
        jne     br_48B64
        nop
        push    cs
        call    far_487C2
        jmp     br_48B69
        db      90h
br_48B64:
        nop
        push    cs
        call    far_4907E
br_48B69:
        nop
        push    cs
        call    EP_DISP_REQUEST_FLUSH_OFF+C1_CSBASE
        pop     ds
        leave
        retf
        db      90h
br_48B72:
        cmp     byte ptr [C2_B_0D7CC], 0
        je      br_48B94
        nop
        push    cs
        call    far_49070
        or      ax, ax
        je      br_48B94
        mov     byte ptr [C2_B_REC_CANCEL_REQ], 1
        nop
        push    cs
        call    far_496B0
        nop
        push    cs
        call    far_49092
        pop     ds
        leave
        retf
br_48B94:
        push    word ptr [bp-2]
        nop
        push    cs
        call    far_496CA
        add     sp, 2
br_48B9F:
        pop     ds
        leave
        retf
sample_record_paint:
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    135ah
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        cmp     byte ptr [C2_B_0D7CC], 0
        je      br_48BC4
        mov     ax, (C2_BASE+L_49AA8-C1_SEG*16)
        mov     dx, C1_SEG
        jmp     br_48BCA
br_48BC4:
        mov     ax, (C2_BASE+L_49AB0-C1_SEG*16)
        mov     dx, C1_SEG
br_48BCA:
        push    dx
        push    ax
        push    1
        push    25h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        mov     al, byte ptr [C2_B_REC_MODE]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C2_TBL_012C8]
        push    word ptr [bx+C2_TBL_012C6]
        push    1
        push    79h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        mov     al, byte ptr [C2_B_0D7CE]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C2_TBL_012D4]
        push    word ptr [bx+C2_TBL_012D2]
        push    1
        push    0d9h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        cmp     word ptr [C1_W_0D7D0], -40h
        jg      br_48C2C
        push    ds
        push    C2_W_07A1D
        push    0bh
        push    3dh
        nop
        push    cs
        call    EP_DRAW_BITMAP_PTR_OFF+C1_CSBASE
        add     sp, 8
        jmp     br_48C40
br_48C2C:
        push    2
        mov     ax, word ptr [C1_W_0D7D0]
        cwd
        push    dx
        push    ax
        push    0ah
        push    3dh
        nop
        push    cs
        call    EP_DRAW_SIGNED_VALUE_OFF+C1_CSBASE
        add     sp, 0ah
br_48C40:
        push    1
        push    3
        mov     ax, word ptr [C1_W_0D7D2]
        cwd
        push    dx
        push    ax
        push    0ah
        push    79h
        nop
        push    cs
        call    EP_DRAW_FIXED_DECIMAL_OFF+C1_CSBASE
        add     sp, 0ch
        push    3
        mov     ax, word ptr [C1_W_0D7D4]
        cwd
        push    dx
        push    ax
        push    0ah
        push    0d9h
        nop
        push    cs
        call    EP_DRAW_UNSIGNED_VALUE_OFF+C1_CSBASE
        add     sp, 0ah
        cmp     byte ptr [C2_B_0D7CC], 0
        je      br_48C90
        nop
        push    cs
        call    far_49070
        or      ax, ax
        je      br_48C90
        push    EP_L_49AB8_SEG
        push    EP_L_49AB8_OFF
        push    34h
        push    1
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
loop_48C8A:
        add     sp, 8
        jmp     br_48CD6
        db      90h
br_48C90:
        mov     ax, word ptr [C2_W_REC_STATE]
        or      ax, ax
        je      br_48CA0
        dec     ax
        je      br_48CC4
        dec     ax
        je      br_48CCA
        jmp     br_48CD6
        db      90h
br_48CA0:
        push    ds
        push    C2_W_013A8
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        cmp     word ptr [C1_W_0D7D2], 0
        je      br_48CD6
        push    EP_L_49AD2_SEG
        push    EP_L_49AD2_OFF
        push    1
        push    6
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        jmp     loop_48C8A
br_48CC4:
        push    ds
        push    C2_W_013BC
        jmp     br_48CCE
br_48CCA:
        push    ds
        push    C2_W_013F0
br_48CCE:
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
br_48CD6:
        push    1eh
        push    0f7h
        push    13h
        push    0
        nop
        push    cs
        call    EP_DRAW_SHADOW_BOX_OFF+C1_CSBASE
        add     sp, 8
        push    ds
        push    C2_W_01414
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        push    1
        nop
        push    cs
        call    EP_DISP_SELECT_PLANE_OFF+C1_CSBASE
        add     sp, 2
        cmp     word ptr [C1_W_0D7D0], -40h
        jle     br_48D46
        push    word ptr [C1_W_0D7D0]
        nop
        push    cs
        call    io_ctrl_setup
        add     sp, 2
        mov     si, ax
        add     si, ax
        add     si, ax
        add     si, si
        cmp     byte ptr [C2_B_REC_MODE], 1
        je      br_48D2F
        push    9
        push    1eh
        lea     ax, [si+28h]
        push    ax
        callf   EP_DRAW_CHAR_AT_SEG:EP_DRAW_CHAR_AT_OFF
        add     sp, 6
br_48D2F:
        cmp     byte ptr [C2_B_REC_MODE], 0
        je      br_48D46
        push    9
        push    27h
        lea     ax, [si+28h]
        push    ax
        callf   EP_DRAW_CHAR_AT_SEG:EP_DRAW_CHAR_AT_OFF
        add     sp, 6
br_48D46:
        push    2
        nop
        push    cs
        call    EP_DISP_SELECT_PLANE_OFF+C1_CSBASE
        add     sp, 2
        cmp     byte ptr [C2_B_REC_MODE], 1
        je      br_48D7B
        push    0bh
        push    1eh
        push    word ptr [C2_W_08B4E]
        nop
        push    cs
        call    io_ctrl_setup
        add     sp, 2
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        add     ax, ax
        add     ax, 28h
        push    ax
        callf   EP_DRAW_CHAR_AT_SEG:EP_DRAW_CHAR_AT_OFF
        add     sp, 6
br_48D7B:
        cmp     byte ptr [C2_B_REC_MODE], 0
        je      br_48DA6
        push    0bh
        push    27h
        push    word ptr [C2_W_08B50]
        nop
        push    cs
        call    io_ctrl_setup
        add     sp, 2
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        add     ax, ax
        add     ax, 28h
        push    ax
        callf   EP_DRAW_CHAR_AT_SEG:EP_DRAW_CHAR_AT_OFF
        add     sp, 6
br_48DA6:
        push    3
        nop
        push    cs
        call    EP_DISP_SELECT_PLANE_OFF+C1_CSBASE
        add     sp, 2
        cmp     byte ptr [C2_B_REC_MODE], 1
        je      br_48DE0
        push    word ptr [C2_W_08B52]
        nop
        push    cs
        call    io_ctrl_setup
        add     sp, 2
        mov     si, ax
        inc     si
        mov     byte ptr [si+C2_TBL_012A2], 0
        push    ds
        push    C2_TBL_012A2
        push    1eh
        push    28h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        mov     byte ptr [si+C2_TBL_012A2], 0ah
br_48DE0:
        cmp     byte ptr [C2_B_REC_MODE], 0
        je      br_48E10
        push    word ptr [C2_W_08B54]
        nop
        push    cs
        call    io_ctrl_setup
        add     sp, 2
        mov     si, ax
        inc     si
        mov     byte ptr [si+C2_TBL_012A2], 0
        push    ds
        push    C2_TBL_012A2
        push    27h
        push    28h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        mov     byte ptr [si+C2_TBL_012A2], 0ah
br_48E10:
        push    1
        nop
        push    cs
        call    EP_DISP_SELECT_PLANE_OFF+C1_CSBASE
        add     sp, 2
        nop
        push    cs
        call    field_engine_redraw
        pop     ds
        pop     si
        retf
sample_record_focus_field0:
        mov     word ptr [C2_W_SAMPLE_REC_CURSOR], 0
        mov     al, byte ptr [C2_B_0D7CC]
        mov     byte ptr [C0_B_098B8], al
        push    ds
        push    C0_B_098B8
        push    ds
        push    C2_W_01438
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
far_48E40:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp+6]
        mov     byte ptr [C2_B_0D7CC], al
        nop
        push    cs
        call    far_493D2
        push    32h
        nop
        push    cs
        if      FW_VERSION >= 112
        call    far_4EE54
        elseif  FW_VERSION >= 110
        db      0e8h, 2dh, 60h
        else
        call    EP_DELAY_TICKS_OFF+C1_CSBASE
        endif
        mov     sp, bp
        nop
        push    cs
        call    far_49218
        nop
        push    cs
        call    far_491A8
        nop
        push    cs
        call    far_49092
        nop
        push    cs
        call    far_490A6
        or      ax, ax
        je      br_48E7B
        nop
        push    cs
        call    far_49266
        push    0
        nop
        push    cs
        call    far_49308
br_48E7B:
        leave
        retf
        db      00h
sample_record_focus_field1:
        mov     word ptr [C2_W_SAMPLE_REC_CURSOR], 1
        mov     al, byte ptr [C2_B_REC_MODE]
        mov     byte ptr [C0_B_098B8], al
        push    ds
        push    C0_B_098B8
        push    ds
        push    C2_W_01462
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_48E9C:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp+6]
        mov     byte ptr [C2_B_REC_MODE], al
        nop
        push    cs
        call    far_48FBA
        nop
        push    cs
        call    far_493D2
        push    32h
        nop
        push    cs
        if      FW_VERSION >= 112
        call    far_4EE54
        elseif  FW_VERSION >= 110
        db      0e8h, 0cch, 5fh
        else
        call    EP_DELAY_TICKS_OFF+C1_CSBASE
        endif
        mov     sp, bp
        nop
        push    cs
        call    far_49218
        nop
        push    cs
        call    far_491A8
        nop
        push    cs
        call    far_49092
        nop
        push    cs
        call    far_490A6
        or      ax, ax
        je      br_48EDC
        nop
        push    cs
        call    far_49266
        push    0
        nop
        push    cs
        call    far_49308
br_48EDC:
        leave
        retf
sample_record_focus_field2:
        mov     word ptr [C2_W_SAMPLE_REC_CURSOR], 2
        mov     al, byte ptr [C2_B_0D7CE]
        mov     byte ptr [C0_B_098B8], al
        push    ds
        push    C0_B_098B8
        push    ds
        push    C2_W_0148C
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_48EFC:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp+6]
        mov     byte ptr [C2_B_0D7CE], al
        nop
        push    cs
        call    far_493D2
        push    32h
        nop
        push    cs
        if      FW_VERSION >= 112
        call    far_4EE54
        elseif  FW_VERSION >= 110
        db      0e8h, 71h, 5fh
        else
        call    EP_DELAY_TICKS_OFF+C1_CSBASE
        endif
        mov     sp, bp
        push    0
        nop
        push    cs
        call    far_49308
        leave
        retf
sample_record_focus_field3:
        mov     word ptr [C2_W_SAMPLE_REC_CURSOR], 3
        push    ds
        push    C1_W_0D7D0
        push    ds
        push    C2_W_014B6
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
sample_record_focus_field4:
        mov     word ptr [C2_W_SAMPLE_REC_CURSOR], 4
        push    ds
        push    C1_W_0D7D2
        push    ds
        push    C2_W_014E0
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
sample_record_focus_field5:
        mov     word ptr [C2_W_SAMPLE_REC_CURSOR], 5
        push    ds
        push    C1_W_0D7D4
        push    ds
        push    C2_W_0150A
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
far_48F64:
        enter   2, 0
        nop
        push    cs
        call    EP_DETECT_MEMORY_OFF+C1_CSBASE
        or      ax, ax
        jne     L_48F7C
        mov     byte ptr [bp-1], 0
        mov     byte ptr [bp-2], 1
        jmp     SHORT br_48F84
        db      90h
L_48F7C:
        mov     byte ptr [bp-1], 1
        mov     byte ptr [bp-2], 5
br_48F84:
        mov     al, byte ptr [C2_B_0D7CC]
        cmp     byte ptr [bp-1], al
        jge     br_48F92
        mov     al, byte ptr [bp-1]
        mov     byte ptr [C2_B_0D7CC], al
br_48F92:
        mov     al, byte ptr [C2_B_0D7CE]
        cmp     byte ptr [bp-2], al
        jge     br_48FA0
        mov     al, byte ptr [bp-2]
        mov     byte ptr [C2_B_0D7CE], al
br_48FA0:
        mov     al, byte ptr [bp-1]
        cbw
        cwd
        mov     word ptr [C2_W_01442], ax
        mov     word ptr [C2_W_01444], dx
        mov     al, byte ptr [bp-2]
        cbw
        cwd
        mov     word ptr [C2_W_01496], ax
        mov     word ptr [C2_W_01498], dx
        leave
        retf
far_48FBA:
        nop
        push    cs
        call    far_49BEA
        cmp     word ptr [C1_W_0D7D2], ax
        jle     br_48FC8
        mov     word ptr [C1_W_0D7D2], ax
br_48FC8:
        cwd
        mov     word ptr [C2_W_014EA], ax
        mov     word ptr [C2_W_014EC], dx
        retf
        db      00h
io_ctrl_setup:
        push    bp
        mov     bp, sp
        mov     bx, word ptr [bp+6]
        cmp     bx, -23h
        jg      br_48FEE
        mov     ax, bx
        cwd
        and     dx, 3
        add     ax, dx
        sar     ax, 2
        add     ax, 0fh
        leave
        retf
        db      90h
br_48FEE:
        cmp     bx, -11h
        jg      br_49000
        mov     ax, bx
        cwd
        sub     ax, dx
        sar     ax, 1
        add     ax, 19h
        leave
        retf
        db      90h
br_49000:
        lea     ax, [bx+21h]
        leave
        retf
        db      00h
far_49006:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     di, word ptr [bp+6]
        cmp     di, 8000h
        jne     br_4901A
        xor     ax, ax
        pop     si
        pop     di
        leave
        retf
br_4901A:
        xor     si, si
        test    di, 4000h
        jne     br_49030
loop_49022:
        cmp     si, 8
        jge     br_49030
        inc     si
        add     di, di
        test    di, 4000h
        je      loop_49022
br_49030:
        mov     bx, di
        mov     bl, bh
        sub     bh, bh
        mov     al, byte ptr [bx+C2_TBL_01534]
        cbw
        mov     cx, si
        add     si, si
        add     si, cx
        add     si, si
        sub     ax, si
        pop     si
        pop     di
        leave
        retf
        db      00h
far_4904A:
        push    si
        mov     ax, word ptr [C0_W_0989E]
        XL2K_MON_ROUTE
        out     0c0h, al
        mov     si, ax
        mov     word ptr [C0_W_0989E], ax
        XL2K_MON_KEEP
        mov     ax, si
        out     0c0h, al
        mov     word ptr [C0_W_0989E], si
        push    5dh
        nop
        push    cs
        if      FW_VERSION >= 112
        call    far_4EE54
        elseif  FW_VERSION >= 110
        db      0e8h, 17h, 5eh
        else
        call    EP_DELAY_TICKS_OFF+C1_CSBASE
        endif
        add     sp, 2
        pop     si
        retf
far_49070:
        mov     dx, 0c002h
        in      al, dx
        and     al, 80h
        cmp     al, 1
        sbb     ax, ax
        neg     ax
        retf
        db      00h
far_4907E:
        mov     ax, 7
        mov     dx, 0c002h
        out     dx, al
        nop
        push    cs
        call    EP_TIMER_LOOP_IO_OFF+C1_CSBASE
        mov     ax, 5
        mov     dx, 0c002h
        out     dx, al
        retf
far_49092:
        push    di
        xor     ax, ax
        mov     cx, 400h
        xor     bx, bx
        mov     dx, 7f00h
        mov     di, bx
        mov     es, dx
        rep stosw
        pop     di
        retf
        db      00h
far_490A6:
        enter   6, 0
        push    di
        push    si
        XL2K_MON_CODES
        mov     al, byte ptr [C2_B_REC_MODE]
        cbw
        mov     si, ax
        mov     di, word ptr [bp+si-6]
        and     di, 0ffh
        in      ax, 88h
        test    al, 60h
        je      br_490D0
        mov     ax, 80h
        out     88h, ax
br_490D0:
        push    0ch
        nop
        push    cs
        call    EP_L_3E502_OFF+C1_CSBASE
        add     sp, 2
        mov     dx, ASIC_DMA_STATUS
        in      al, dx
        test    al, 40h
        je      br_49123
        mov     ax, 2
        mov     dx, ASIC_DMA_C031
        out     dx, al
        push    7
        push    0f000h
        nop
        push    cs
        call    EP_L_3E4EE_OFF+C1_CSBASE
        add     sp, 4
        mov     ax, 3ffh
        mov     dx, ASIC_DMA_COUNT
        out     dx, ax
        mov     ax, 55h
        mov     dx, ASIC_DMA_C03A
        out     dx, al
        push    4
        nop
        push    cs
        call    EP_L_3E524_OFF+C1_CSBASE
        add     sp, 2
        mov     word ptr [bp-2], di
loop_49111:
        mov     dx, ASIC_DMA_STATUS
        in      al, dx
        test    al, 40h
        jne     loop_49111
        push    4
        nop
        push    cs
        call    EP_L_3E502_OFF+C1_CSBASE
        add     sp, 2
br_49123:
        mov     ax, 2
        mov     dx, ASIC_DMA_C031
        out     dx, al
        push    7
        push    0f000h
        nop
        push    cs
        call    EP_L_3E4EE_OFF+C1_CSBASE
        add     sp, 4
        mov     ax, 3ffh
        mov     dx, ASIC_DMA_COUNT
        out     dx, ax
        mov     ax, 55h
        mov     dx, ASIC_DMA_C03A
        out     dx, al
        cmp     byte ptr [C2_B_0D7CC], ah
        jne     br_4915E
        nop
        push    cs
        call    far_4904A
        mov     ax, word ptr [C0_W_0989E]
        XL2K_MON_CLEAR
        out     0c0h, al
        mov     si, ax
        or      si, di
        jmp     SHORT br_4918C
        db      90h
br_4915E:
        mov     ax, word ptr [C0_W_0989E]
        XL2K_MON_BOTH
        mov     si, ax
        out     0c0h, al
        nop
        push    cs
        call    EP_TIMER_LOOP_IO_OFF+C1_CSBASE
        or      si, di
        push    14h
        nop
        push    cs
        if      FW_VERSION >= 112
        call    far_4EE54
        elseif  FW_VERSION >= 110
        db      0e8h, 0bh, 5dh
        else
        call    EP_DELAY_TICKS_OFF+C1_CSBASE
        endif
        add     sp, 2
        nop
        push    cs
        call    far_4907E
        nop
        push    cs
        call    far_49070
        or      ax, ax
        je      br_4918C
        xor     ax, ax
        jmp     br_491A1
br_4918C:
        push    4
        nop
        push    cs
        call    EP_L_3E524_OFF+C1_CSBASE
        add     sp, 2
        mov     ax, si
        out     0c0h, al
        mov     word ptr [C0_W_0989E], si
        mov     ax, 1
br_491A1:
        mov     word ptr [C2_W_08B58], ax
        pop     si
        pop     di
        leave
        retf
far_491A8:
        cmp     word ptr [C2_W_08B58], 0
        je      br_491BC
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        mov     bl, al
        sub     bh, bh
        mov     ax, bx
        or      al, 4
        out     dx, al
br_491BC:
        mov     ax, word ptr [C0_W_0989E]
        XL2K_MON_SET
        out     0c0h, al
        mov     word ptr [C0_W_0989E], ax
        mov     word ptr [C2_W_08B58], 0
        retf
        db      00h
far_491D0:
        mov     ax, word ptr [C2_W_08B58]
        retf
mpc_config_rate:
        push    bp
        mov     bp, sp
        push    si
        pushf
        cli
        mov     ax, 2
        mov     dx, ASIC_DMA_C031
        out     dx, al
        mov     dx, ASIC_DMA_ADDR
        in      ax, dx
        mov     si, ax
        popf
        lea     ax, [si+1000h]
        shr     ax, 1
        pop     si
        leave
        retf
        db      00h
far_491F2:
        push    bp
        mov     bp, sp
        mov     al, 3
        mov     dx, ASIC_DMA_C031
        out     dx, al
        pushf
        cli
        xor     cx, cx
        mov     dx, ASIC_DMA_ADDR
tgt_49202:
        in      al, dx
        test    al, 2
        loope   tgt_49202
        xor     cx, cx
tgt_49209:
        in      ax, dx
        test    al, 2
        loopne  tgt_49209
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        or      al, 8
        out     dx, al
        popf
        leave
        retf
far_49218:
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        test    al, 8
        jne     br_49233
        nop
        push    cs
        call    far_491F2
        xor     ax, ax
        nop
        push    cs
        call    EP_L_3DE94_OFF+C1_CSBASE
        mov     word ptr [C2_W_08B5A], ax
        mov     word ptr [C2_W_08B5C], dx
br_49233:
        in      ax, 88h
        test    al, 60h
        je      br_49264
        mov     ax, 3
        mov     dx, ASIC_DMA_C031
        out     dx, al
        mov     dx, ASIC_DMA_C03A
        in      al, dx
        and     ax, 0e3h
        out     dx, al
        xor     bx, bx
loop_4924A:
        mov     dx, ASIC_DMA_STATUS
        in      al, dx
        test    al, 8
        jne     br_49255
        dec     bx
        jne     loop_4924A
br_49255:
        xor     ax, ax
        out     88h, ax
        xor     bx, bx
loop_4925B:
        in      al, 88h
        test    al, 80h
        je      br_49264
        dec     bx
        jne     loop_4925B
br_49264:
        retf
        db      00h
far_49266:
        enter   2eh, 0
        push    di
        push    si
        mov     word ptr [bp-2], 0
        lea     di, [bp-2eh]
        mov     si, 15b4h
        mov     ax, ss
        mov     es, ax
        mov     cx, 16h
        rep movsw
        push    1e06h
        lea     ax, [bp-2eh]
        push    ss
        push    ax
        push    0
        nop
        push    cs
        if      FW_VERSION >= 112
        call    far_4E5FC
        else
        call    (C1_BASE+dma_field_write-C1_SEG*16)+C1_CSBASE
        endif
        add     sp, 8
        cmp     byte ptr [C2_B_REC_MODE], 2
        jne     br_492BA
        mov     word ptr [bp-2ch], 1114h
        mov     word ptr [bp-26h], 1228h
        mov     word ptr [bp-24h], 10h
        push    1e06h
        lea     ax, [bp-2eh]
        push    ss
        push    ax
        push    10h
        nop
        push    cs
        if      FW_VERSION >= 112
        call    far_4E5FC
        else
        call    (C1_BASE+dma_field_write-C1_SEG*16)+C1_CSBASE
        endif
        add     sp, 8
br_492BA:
        mov     ax, 3
        mov     dx, ASIC_DMA_C031
        out     dx, al
        push    7
        push    0f000h
        nop
        push    cs
        call    EP_L_3E4EE_OFF+C1_CSBASE
        add     sp, 4
        mov     ax, 3ffh
        mov     dx, ASIC_DMA_COUNT
        out     dx, ax
resume_492D5:
        mov     ax, 59h
        mov     dx, ASIC_DMA_C03A
        out     dx, al
        push    8
        nop
        push    cs
        call    EP_L_3E524_OFF+C1_CSBASE
        add     sp, 2
        cmp     byte ptr [C2_B_REC_MODE], 2
        jne     L_48994
        mov     ax, 58h
        jmp     SHORT br_492F5
L_48994:
        mov     ax, 40h
br_492F5:
        out     88h, ax
        mov     bx, word ptr [bp-2]
loop_492FA:
        in      al, 88h
        test    al, 80h
        je      br_49303
        dec     bx
        jne     loop_492FA
br_49303:
        pop     si
        pop     di
        leave
        retf
        db      00h
far_49308:
        push    bp
        mov     bp, sp
        push    di
        push    si
        cmp     byte ptr [C2_B_0D7CE], 0
        jne     br_49317
        jmp     br_493CE
br_49317:
        cmp     word ptr [bp+6], 0
        jne     br_4935C
        mov     ax, C2_W_08B62
        mov     di, ax
        mov     si, 15e0h
        push    ds
        pop     es
        mov     cx, 16h
        rep movsw
        push    ds
        mov     di, C2_W_08B8E
        mov     si, ax
        mov     cx, 16h
        rep movsw
        pop     ds
        mov     ax, 1114h
        mov     dx, 10h
        mov     word ptr [C2_W_08B6A], ax
        mov     word ptr [C2_W_08B6C], dx
        mov     word ptr [C2_W_08B96], ax
        mov     word ptr [C2_W_08B98], dx
        cmp     byte ptr [C2_B_REC_MODE], 2
        jne     br_4935C
        mov     word ptr [C2_W_08B90], ax
        mov     word ptr [C2_W_08B96], 1228h
br_4935C:
        cmp     byte ptr [C2_B_0D7CE], 1
        jne     br_4937A
        mov     word ptr [C2_W_08B82], 8000h
        xor     ax, ax
        mov     word ptr [C2_W_08B84], ax
        mov     word ptr [C2_W_08BB0], ax
        mov     word ptr [C2_W_08BAE], 80h
        jmp     br_493A4
        db      90h
br_4937A:
        mov     word ptr [C2_W_08B82], 0
        mov     al, byte ptr [C2_B_0D7CE]
        cbw
        mov     bx, ax
        add     bx, ax
        mov     al, byte ptr [bx+C2_TBL_00485]
        cbw
        or      ah, 40h
        mov     word ptr [C2_W_08B84], ax
        mov     word ptr [C2_W_08BAE], 0
        mov     al, byte ptr [bx+C2_TBL_00486]
        cbw
        or      ah, 40h
        mov     word ptr [C2_W_08BB0], ax
br_493A4:
        push    1ffeh
        push    ds
        push    C2_W_08B62
        push    15h
        nop
        push    cs
        if      FW_VERSION >= 112
        call    far_4E5FC
        else
        call    (C1_BASE+dma_field_write-C1_SEG*16)+C1_CSBASE
        endif
        add     sp, 8
        push    1ffeh
        push    ds
        push    C2_W_08B8E
        push    17h
        nop
        push    cs
        if      FW_VERSION >= 112
        call    far_4E5FC
        else
        call    (C1_BASE+dma_field_write-C1_SEG*16)+C1_CSBASE
        endif
        add     sp, 8
        in      al, 88h
        and     al, 7fh
        mov     ah, 1
        out     88h, ax
br_493CE:
        pop     si
        pop     di
        leave
        retf
far_493D2:
        mov     ax, 15h
        nop
        push    cs
        call    far_4E7B2
        mov     ax, 17h
        nop
        push    cs
        call    far_4E7B2
        retf
        db      00h
far_493E4:
        enter   0ah, 0
        push    di
        push    si
        xor     ax, ax
        mov     cx, 16h
        mov     di, C2_W_08BBA
        push    ds
        pop     es
        rep stosw
        mov     cx, 16h
        mov     di, C2_W_08BE6
        rep stosw
        mov     dx, C2_W_08B62
        mov     di, dx
        mov     si, 15e0h
        mov     cx, 16h
        rep movsw
        mov     dx, C2_W_08B8E
        mov     di, dx
        mov     si, 15e0h
        mov     cx, 16h
        rep movsw
        push    ds
        push    C2_FP_REC_SOUND
        nop
        push    cs
        call    EP_SOUND_RECORD_ALLOC_OFF+C1_CSBASE
        add     sp, 4
        or      ax, ax
        jne     br_49432
        mov     word ptr [C2_W_REC_SOUND_SEG], ax
        mov     word ptr [C2_FP_REC_SOUND], ax
        pop     si
        pop     di
        leave
        retf
br_49432:
        cmp     byte ptr [C2_B_REC_MODE], 2
        jne     br_4943E
        mov     ax, 2
        jmp     br_49441
br_4943E:
        mov     ax, 1
br_49441:
        push    ax
        imul    ax, word ptr [C1_W_0D7D4], 1b9h
        mov     cx, 0ah
        sub     dx, dx
        div     cx
        sub     dx, dx
        mov     word ptr [C2_W_095F4], ax
        mov     word ptr [C2_W_095F6], dx
        mov     ax, 113ah
        imul    word ptr [C1_W_0D7D2]
        add     ax, word ptr [C2_W_095F4]
        adc     dx, word ptr [C2_W_095F6]
        push    dx
        push    ax
        nop
        push    cs
        call    EP_SIZE_PARA_ROUND_MUL_OFF+C1_CSBASE
        add     sp, 6
        mov     word ptr [C2_W_095FC], ax
        mov     word ptr [C2_W_095FE], dx
        nop
        push    cs
        call    EP_SMEM_FREE_BYTES_OFF+C1_CSBASE
        les     bx, [C2_FP_REC_SOUND]
        mov     word ptr es:[bx+R8B4A_DD_0E], ax
        mov     word ptr es:[bx+R8B4A_DD_0E+2], dx
        mov     ax, word ptr [C2_W_095FC]
        mov     dx, word ptr [C2_W_095FE]
        les     bx, [C2_FP_REC_SOUND]
        add     bx, 0eh
        mov     word ptr [bp-0ah], bx
        mov     word ptr [bp-8], es
        cmp     word ptr es:[bx+2], dx
        jg      br_494BE
        jl      br_494AA
        cmp     word ptr es:[bx], ax
        jae     br_494BE
br_494AA:
        mov     es, word ptr [bp-8]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        mov     word ptr [C2_W_095FC], ax
        mov     word ptr [C2_W_095FE], dx
        jmp     br_494C8
        db      90h
br_494BE:
        mov     es, word ptr [bp-8]
        mov     word ptr es:[bx], ax
        mov     word ptr es:[bx+2], dx
br_494C8:
        cmp     byte ptr [C2_B_REC_MODE], 2
        jne     br_494DB
        push    0
        push    2
        push    95fch
        callf   EP_AFNALDIV_SEG:EP_AFNALDIV_OFF
br_494DB:
        les     bx, [C2_FP_REC_SOUND]
        mov     ax, word ptr es:[bx+R8B4A_DD_0A]
        mov     dx, word ptr es:[bx+R8B4A_DD_0A+2]
        add     ax, word ptr [C2_W_095F4]
        adc     dx, word ptr [C2_W_095F6]
        push    dx
        push    ax
        nop
        push    cs
        call    EP_MEMCPY_FAR_SEG_OFF+C1_CSBASE
        add     sp, 4
        push    ds
        lea     di, [bp-6]
        mov     si, ax
        push    ss
        pop     es
        mov     ds, dx
        movsw
        movsw
        movsw
        pop     ds
        mov     ax, word ptr [bp-6]
        mov     word ptr [C2_W_08BBA], ax
        mov     word ptr [C2_W_08B62], ax
        mov     ax, word ptr [bp-4]
        mov     word ptr [C2_W_08BBC], ax
        mov     word ptr [C2_W_08B64], ax
        mov     ax, word ptr [bp-2]
        or      ah, 1
        mov     word ptr [C2_W_08BBE], ax
        mov     word ptr [C2_W_08B66], ax
        mov     word ptr [C2_W_08BC0], 1000h
        push    0
        push    10h
        les     bx, [C2_FP_REC_SOUND]
        mov     ax, word ptr es:[bx+R8B4A_DD_0A]
        mov     dx, word ptr es:[bx+R8B4A_DD_0A+2]
        add     ax, word ptr [C2_W_095FC]
        adc     dx, word ptr [C2_W_095FE]
        push    dx
        push    ax
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     word ptr [C2_W_08BC2], ax
        mov     word ptr [C2_W_08BC4], dx
        mov     word ptr [C2_W_08B6A], ax
        mov     word ptr [C2_W_08B6C], dx
        cmp     byte ptr [C2_B_REC_MODE], 2
        je      br_49562
        jmp     br_495EC
br_49562:
        les     bx, [C2_FP_REC_SOUND]
        mov     ax, word ptr es:[bx+R8B4A_DD_0A]
        mov     dx, word ptr es:[bx+R8B4A_DD_0A+2]
        add     ax, word ptr [C2_W_095FC]
        adc     dx, word ptr [C2_W_095FE]
        add     ax, word ptr [C2_W_095F4]
        adc     dx, word ptr [C2_W_095F6]
        push    dx
        push    ax
        nop
        push    cs
        call    EP_MEMCPY_FAR_SEG_OFF+C1_CSBASE
        add     sp, 4
        push    ds
        lea     di, [bp-6]
        mov     si, ax
        push    ss
        pop     es
        mov     ds, dx
        movsw
        movsw
        movsw
        pop     ds
        mov     ax, word ptr [bp-6]
        mov     word ptr [C2_W_08BE6], ax
        mov     word ptr [C2_W_08B8E], ax
        mov     ax, word ptr [bp-4]
        mov     word ptr [C2_W_08BE8], ax
        mov     word ptr [C2_W_08B90], ax
        mov     ax, word ptr [bp-2]
        or      ah, 1
        mov     word ptr [C2_W_08BEA], ax
        mov     word ptr [C2_W_08B92], ax
        mov     word ptr [C2_W_08BEC], 1000h
        push    0
        push    10h
        mov     ax, word ptr [C2_W_095FC]
        mov     dx, word ptr [C2_W_095FE]
        add     ax, ax
        adc     dx, dx
        les     bx, [C2_FP_REC_SOUND]
        add     ax, word ptr es:[bx+R8B4A_DD_0A]
        adc     dx, word ptr es:[bx+R8B4A_DD_0A+2]
        push    dx
        push    ax
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     word ptr [C2_W_08BEE], ax
        mov     word ptr [C2_W_08BF0], dx
        mov     word ptr [C2_W_08B96], ax
        mov     word ptr [C2_W_08B98], dx
        jmp     br_495FB
br_495EC:
        mov     ax, C2_W_08B8E
        mov     di, ax
        mov     si, C2_W_08B62
        push    ds
        pop     es
        mov     cx, 16h
        rep movsw
br_495FB:
        mov     ax, 1
        pop     si
        pop     di
        leave
        retf
far_49602:
        enter   2, 0
        nop
        push    cs
        call    far_491F2
        xor     ax, ax
        out     80h, ax
        in      ax, 82h
        shr     ax, 0ch
        mov     cx, ax
        in      ax, 84h
        shl     ax, 4
        or      cx, ax
        mov     word ptr [C2_W_08B5E], cx
        mov     word ptr [C2_W_08B60], 0
        push    1e06h
        push    ds
        push    C2_W_08BBA
        push    0
        nop
        push    cs
        if      FW_VERSION >= 112
        call    far_4E5FC
        else
        call    (C1_BASE+dma_field_write-C1_SEG*16)+C1_CSBASE
        endif
        add     sp, 8
        cmp     byte ptr [C2_B_REC_MODE], 2
        jne     br_49650
        push    1e06h
        push    ds
        push    C2_W_08BE6
        push    10h
        nop
        push    cs
        if      FW_VERSION >= 112
        call    far_4E5FC
        else
        call    (C1_BASE+dma_field_write-C1_SEG*16)+C1_CSBASE
        endif
        add     sp, 8
br_49650:
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        and     ax, 0f7h
        out     dx, al
        mov     dx, 88h
        in      al, dx
        mov     ah, 1
        out     dx, ax
        xor     cx, cx
tgt_49661:
        in      al, dx
        test    al, 80h
        loopne  tgt_49661
        leave
        retf
far_49668:
        enter   4, 0
        push    di
        push    si
        xor     ax, ax
        out     80h, ax
        in      ax, 84h
        mov     di, ax
        mov     ax, word ptr [C2_W_08BC2]
        mov     dx, word ptr [C2_W_08BC4]
        and     dx, 0fh
        mov     word ptr [bp-4], ax
        in      ax, 86h
        cmp     dx, ax
        ja      br_496AA
        sub     si, si
        mov     cx, word ptr [bp-4]
        sub     cx, si
        sbb     dx, ax
        sub     cx, di
        sbb     dx, si
        or      dx, dx
        jg      br_496AA
        jl      br_496A2
        cmp     cx, 0a5h
        ja      br_496AA
br_496A2:
        mov     ax, 1
        pop     si
        pop     di
        leave
        retf
        db      90h
br_496AA:
        xor     ax, ax
        pop     si
        pop     di
        leave
        retf
far_496B0:
        mov     ax, 0ffc1h
        mov     word ptr [C2_W_08B50], ax
        mov     word ptr [C2_W_08B4E], ax
        mov     ax, 0ffc0h
        mov     word ptr [C2_W_08B54], ax
        mov     word ptr [C2_W_08B52], ax
        mov     word ptr [C2_W_08C12], 0
        retf
        db      00h
far_496CA:
        enter   4, 0
        push    di
        push    si
        mov     cx, word ptr [bp+6]
        mov     word ptr [bp-4], 0
        mov     word ptr [bp-2], 7f00h
        mov     bx, cx
        sub     bx, word ptr [C2_W_0160C]
        cmp     bx, 32h
        jb      br_49738
        mov     word ptr [C2_W_0160C], cx
        cmp     bx, 200h
        jbe     br_496F5
        mov     bx, 200h
br_496F5:
        mov     ax, 200h
        sub     ax, bx
        mul     word ptr [C2_W_08B52]
        shr     ax, 0bh
        sub     ax, 0ffc0h
        neg     ax
        mov     word ptr [C2_W_08B52], ax
        cmp     ax, 0ffc0h
        jge     br_49714
        mov     word ptr [C2_W_08B52], 0ffc0h
br_49714:
        mov     ax, 200h
        sub     ax, bx
        mul     word ptr [C2_W_08B54]
        shr     ax, 0bh
        sub     ax, 0ffc0h
        neg     ax
        mov     word ptr [C2_W_08B54], ax
        cmp     ax, 0ffc0h
        jge     br_49733
        mov     word ptr [C2_W_08B54], 0ffc0h
br_49733:
        nop
        push    cs
        call    EP_DISP_REQUEST_FLUSH_OFF+C1_CSBASE
br_49738:
        mov     si, word ptr [C2_W_08C12]
        nop
        push    cs
        call    mpc_config_rate
        and     al, 0feh
        mov     word ptr [C2_W_08C12], ax
        xor     di, di
        mov     word ptr [bp-2], di
        cmp     byte ptr [C2_B_REC_MODE], 2
        jne     br_497A6
        cmp     ax, si
        jne     br_49759
        jmp     br_497D9
br_49759:
        mov     word ptr [bp-4], di
loop_4975C:
        mov     bx, si
        add     bx, si
        xor     ax, ax
        mov     dx, 7f00h
        add     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx]
        cwd
        xor     ax, dx
        sub     ax, dx
        inc     si
        cmp     word ptr [bp-4], ax
        jae     br_4977A
        mov     word ptr [bp-4], ax
br_4977A:
        mov     bx, si
        add     bx, si
        xor     ax, ax
        add     bx, ax
        mov     ax, word ptr es:[bx]
        cwd
        xor     ax, dx
        sub     ax, dx
        inc     si
        cmp     word ptr [bp-2], ax
        jae     br_49793
        mov     word ptr [bp-2], ax
br_49793:
        cmp     si, 400h
        jb      br_4979B
        xor     si, si
br_4979B:
        cmp     word ptr [C2_W_08C12], si
        jne     loop_4975C
        mov     di, word ptr [bp-4]
        jmp     br_497D9
br_497A6:
        cmp     ax, si
        je      br_497D6
loop_497AA:
        mov     bx, si
        add     bx, si
        xor     ax, ax
        mov     dx, 7f00h
        add     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx]
        cwd
        xor     ax, dx
        sub     ax, dx
        mov     cx, ax
        inc     si
        cmp     cx, di
        jbe     br_497C8
        mov     di, ax
br_497C8:
        cmp     si, 400h
        jb      br_497D0
        xor     si, si
br_497D0:
        cmp     word ptr [C2_W_08C12], si
        jne     loop_497AA
br_497D6:
        mov     word ptr [bp-2], di
br_497D9:
        push    di
        nop
        push    cs
        call    far_49006
        add     sp, 2
        cmp     word ptr [C2_W_08B4E], ax
        jge     br_497EB
        mov     word ptr [C2_W_08B4E], ax
br_497EB:
        cmp     word ptr [C2_W_08B52], ax
        jge     br_497F4
        mov     word ptr [C2_W_08B52], ax
br_497F4:
        push    word ptr [bp-2]
        nop
        push    cs
        call    far_49006
        add     sp, 2
        cmp     word ptr [C2_W_08B50], ax
        jge     br_49808
        mov     word ptr [C2_W_08B50], ax
br_49808:
        cmp     word ptr [C2_W_08B54], ax
        jge     br_49811
        mov     word ptr [C2_W_08B54], ax
br_49811:
        pop     si
        pop     di
        leave
        retf
        db      00h
far_49816:
        mov     ax, word ptr [C1_W_0D7D0]
        cmp     word ptr [C2_W_08B52], ax
        jge     br_49828
        cmp     word ptr [C2_W_08B54], ax
        jge     br_49828
        xor     ax, ax
        retf
br_49828:
        mov     ax, 1
        retf
far_4982C:
        nop
        push    cs
        call    far_4989E
        nop
        push    cs
        call    far_499CC
        cmp     byte ptr [C2_B_REC_MODE], 2
        jne     br_49862
        les     bx, [C2_FP_REC_SOUND]
        mov     byte ptr es:[bx+R8B4A_B_25], 1
        push    0
        push    2
        les     bx, [C2_FP_REC_SOUND]
        push    word ptr es:[bx+R8B4A_DD_0E+2]
        push    word ptr es:[bx+R8B4A_DD_0E]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        les     bx, [C2_FP_REC_SOUND]
        jmp     br_4986E
        db      90h
br_49862:
        les     bx, [C2_FP_REC_SOUND]
        mov     ax, word ptr es:[bx+R8B4A_DD_0E]
        mov     dx, word ptr es:[bx+R8B4A_DD_0E+2]
br_4986E:
        mov     word ptr es:[bx+2eh], ax
        mov     word ptr es:[bx+30h], dx
        les     bx, [C2_FP_REC_SOUND]
        mov     ax, word ptr es:[bx+R8B4A_DD_2E]
        mov     dx, word ptr es:[bx+R8B4A_DD_2E+2]
        mov     word ptr es:[bx+R8B4A_DD_2A], ax
        mov     word ptr es:[bx+R8B4A_DD_2A+2], dx
        mov     ax, word ptr [C2_W_095F4]
        mov     dx, word ptr [C2_W_095F6]
        les     bx, [C2_FP_REC_SOUND]
        mov     word ptr es:[bx+R8B4A_DD_26], ax
        mov     word ptr es:[bx+R8B4A_DD_26+2], dx
        retf
far_4989E:
        enter   0ch, 0
        push    di
        push    si
        mov     ax, word ptr [C2_W_095F6]
        or      ax, word ptr [C2_W_095F4]
        jne     br_498B0
        jmp     br_499C8
br_498B0:
        mov     ax, word ptr [C2_W_08B5E]
        mov     di, ax
        mov     cx, word ptr [C2_W_095F4]
        mov     si, cx
        push    0
        push    2
        les     bx, [C2_FP_REC_SOUND]
        push    word ptr es:[bx+R8B4A_DD_0E+2]
        push    word ptr es:[bx+R8B4A_DD_0E]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        les     bx, [C2_FP_REC_SOUND]
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        mov     ax, word ptr es:[bx+R8B4A_DD_0A]
        mov     dx, word ptr es:[bx+R8B4A_DD_0A+2]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        add     ax, word ptr [bp-0ch]
        adc     dx, word ptr [bp-0ah]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     ax, word ptr [C2_W_095F4]
        cmp     word ptr [C2_W_08B5E], ax
        jb      br_49946
        sub     ax, ax
        push    ax
        push    si
        mov     cx, di
        sub     dx, dx
        sub     cx, si
        sbb     dx, ax
        add     cx, ax
        adc     dx, 1
        push    dx
        push    cx
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        nop
        push    cs
        call    EP_FAR_3E3B8_OFF+C1_CSBASE
        add     sp, 0ch
        cmp     byte ptr [C2_B_REC_MODE], 2
        je      br_49928
        jmp     br_499C8
br_49928:
        sub     ax, ax
        push    ax
        push    si
        mov     cx, di
        sub     dx, dx
        sub     cx, si
        sbb     dx, ax
        add     cx, 1140h
        adc     dx, 1
        push    dx
        push    cx
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        jmp     br_499C0
        db      90h
br_49946:
        sub     si, di
        sub     ax, ax
        push    ax
        push    si
        mov     cx, 1140h
        mov     dx, 1
        sub     cx, si
        sbb     dx, ax
        push    dx
        push    cx
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        nop
        push    cs
        call    EP_FAR_3E3B8_OFF+C1_CSBASE
        add     sp, 0ch
        push    0
        push    di
        push    1
        push    0
        mov     ax, si
        sub     dx, dx
        les     bx, [C2_FP_REC_SOUND]
        add     ax, word ptr es:[bx+R8B4A_DD_0A]
        adc     dx, word ptr es:[bx+R8B4A_DD_0A+2]
        push    dx
        push    ax
        nop
        push    cs
        call    EP_FAR_3E3B8_OFF+C1_CSBASE
        add     sp, 0ch
        cmp     byte ptr [C2_B_REC_MODE], 2
        jne     br_499C8
        sub     ax, ax
        push    ax
        push    si
        mov     cx, 2280h
        mov     dx, 1
        sub     cx, si
        sbb     dx, ax
        push    dx
        push    cx
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    EP_FAR_3E3B8_OFF+C1_CSBASE
        add     sp, 0ch
        push    0
        push    di
        push    1
        push    1140h
        mov     ax, si
        sub     dx, dx
        add     ax, word ptr [bp-4]
        adc     dx, word ptr [bp-2]
        push    dx
        push    ax
br_499C0:
        nop
        push    cs
        call    EP_FAR_3E3B8_OFF+C1_CSBASE
        add     sp, 0ch
br_499C8:
        pop     si
        pop     di
        leave
        retf
far_499CC:
        enter   0ch, 0
        push    si
        cmp     byte ptr [C2_B_REC_MODE], 2
        jne     br_499FC
        push    0
        push    2
        les     bx, [C2_FP_REC_SOUND]
        push    word ptr es:[bx+R8B4A_DD_0E+2]
        push    word ptr es:[bx+R8B4A_DD_0E]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        les     bx, [C2_FP_REC_SOUND]
        add     ax, word ptr es:[bx+R8B4A_DD_0A]
        adc     dx, word ptr es:[bx+R8B4A_DD_0A+2]
        jmp     br_49A10
        db      90h
br_499FC:
        les     bx, [C2_FP_REC_SOUND]
        mov     ax, word ptr es:[bx+R8B4A_DD_0A]
        mov     dx, word ptr es:[bx+R8B4A_DD_0A+2]
        add     ax, word ptr es:[bx+R8B4A_DD_0E]
        adc     dx, word ptr es:[bx+R8B4A_DD_0E+2]
br_49A10:
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     ax, word ptr [C2_W_08B5A]
        mov     dx, word ptr [C2_W_08B5C]
        and     al, 0f0h
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        mov     cx, ax
        mov     si, dx
        sub     ax, word ptr es:[bx+0ah]
        sbb     dx, word ptr es:[bx+0ch]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        cmp     word ptr [bp-2], si
        jl      br_49A78
        jg      br_49A43
        cmp     word ptr [bp-4], cx
        jbe     br_49A78
br_49A43:
        mov     word ptr es:[bx+0eh], ax
        mov     word ptr es:[bx+10h], dx
        cmp     byte ptr [C2_B_REC_MODE], 2
        jne     br_49A78
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        nop
        push    cs
        call    EP_FAR_3E3B8_OFF+C1_CSBASE
        add     sp, 0ch
        les     bx, [C2_FP_REC_SOUND]
        shl     word ptr es:[bx+R8B4A_DD_0E], 1
        rcl     word ptr es:[bx+R8B4A_DD_0E+2], 1
br_49A78:
        pop     si
        leave
        retf
        nop
far_4947C:
        db      "MONO L", 00h, 00h
far_49A84:
        db      "MONO R", 00h, 00h
far_49A8C:
        db      "STEREO", 00h, 00h
far_49A94:
        db      4ch, 2fh, 52h, 00h
far_49A98:
        db      31h, 2fh, 32h, 00h
L_49A9C:
        db      33h, 2fh, 34h, 00h
L_49AA0:
        db      35h, 2fh, 36h, 00h
far_49AA4:
        db      37h, 2fh, 38h, 00h
L_49AA8:
        db      "DIGITAL", 00h
L_49AB0:
        db      "ANALOG", 00h, 00h
L_49AB8:
        db      "No digital signal carrier", 00h
L_49AD2:
        db      "RECORD", 00h, 00h
far_49ADA:
        push    ds
        push    C2_W_0160E
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        retf
        db      00h
sound_memory_close:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_48782
        pop     ds
        retf
        db      00h
sound_memory_paint:
        enter   4, 0
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    EP_L_49C1E_SEG
        push    EP_L_49C1E_OFF
        nop
        push    cs
        call    EP_SMEM_PROC_WRAPPER_OFF+C1_CSBASE
        add     sp, 4
        push    ds
        push    C2_W_01628
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        push    1
        push    3
        nop
        push    cs
        call    far_49BEA
        cwd
        push    dx
        push    ax
        push    0ch
        push    9dh
        nop
        push    cs
        call    EP_DRAW_FIXED_DECIMAL_OFF+C1_CSBASE
        add     sp, 0ch
        push    2
        push    8
        push    0
        push    word ptr [C2_W_SMEM_SIZE_HI]
        push    word ptr [C0_W_SMEM_SIZE]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        push    dx
        push    ax
        push    28h
        push    43h
        nop
        push    cs
        call    EP_DRAW_UNSIGNED_VALUE_OFF+C1_CSBASE
        add     sp, 0ah
        mov     ax, word ptr [C0_W_SMEM_SIZE]
        mov     dx, word ptr [C2_W_SMEM_SIZE_HI]
        sub     ax, 2680h
        sbb     dx, 1
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    dx
        push    ax
        push    0
        push    0c8h
        nop
        push    cs
        call    EP_SMEM_FREE_BYTES_OFF+C1_CSBASE
        mov     cx, word ptr [bp-4]
        mov     bx, word ptr [bp-2]
        sub     cx, ax
        sbb     bx, dx
        push    bx
        push    cx
        callf   EP_AFLMUL_SEG:EP_AFLMUL_OFF
        push    dx
        push    ax
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     si, ax
        or      si, ax
        je      br_49BBB
        mov     byte ptr [C2_B_0169F], al
        mov     byte ptr [C2_B_01697], al
        mov     byte ptr [C2_B_0168F], al
        mov     byte ptr [C2_B_01687], al
        mov     bx, si
        lea     ax, [bx-1]
        mov     byte ptr [C2_B_016A3], al
        mov     byte ptr [C2_B_0169B], al
        mov     byte ptr [C2_B_01693], al
        mov     byte ptr [C2_B_0168B], al
        push    ds
        push    C2_W_01684
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
br_49BBB:
        cmp     si, 0c8h
        jge     br_49BE5
        push    8
        push    1ah
        lea     ax, [si+17h]
        push    ax
        callf   EP_DRAW_VLINE_SEG:EP_DRAW_VLINE_OFF
        add     sp, 6
        mov     ax, 0c8h
        sub     ax, si
        push    ax
        push    1ah
        lea     ax, [si+17h]
        push    ax
        callf   EP_DRAW_HLINE_SEG:EP_DRAW_HLINE_OFF
        add     sp, 6
br_49BE5:
        pop     ds
        pop     si
        leave
        retf
        db      00h
far_49BEA:
        push    si
        nop
        push    cs
        call    EP_SMEM_FREE_BYTES_OFF+C1_CSBASE
        or      dx, dx
        jl      br_49C1A
        push    0
        push    113ah
        push    dx
        push    ax
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     si, ax
        cmp     byte ptr [C2_B_REC_MODE], 2
        jne     br_49C11
        mov     cx, 2
        cwd
        idiv    cx
        mov     si, ax
br_49C11:
        dec     si
        jns     br_49C16
        xor     si, si
br_49C16:
        mov     ax, si
        pop     si
        retf
br_49C1A:
        xor     ax, ax
        pop     si
        retf
L_49C1E:
        db      "Sound memory"
        db      00h, 00h
far_49C2C:
        push    si
        nop
        push    cs
        call    EP_FAR_3E8D0_OFF+C1_CSBASE
        mov     si, ax
        or      si, ax
        jl      br_49C40
        cmp     si, 3
        jg      br_49C40
        mov     byte ptr [C2_B_PAD_DRUM], al
br_49C40:
        push    0
        push    0
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        push    dx
        push    ax
        nop
        push    cs
        call    far_484D6
        add     sp, 8
        mov     byte ptr [C2_B_PAD_NOTE], 0
        push    ds
        push    C2_W_016A6
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        cmp     word ptr [C2_W_KEEP_OR_RETRY_CURSOR], 0
        jl      L_49319
        cmp     word ptr [C2_W_KEEP_OR_RETRY_CURSOR], 2
        jb      br_49C7D
L_49319:
        mov     word ptr [C2_W_KEEP_OR_RETRY_CURSOR], 0
br_49C7D:
        imul    bx, word ptr [C2_W_KEEP_OR_RETRY_CURSOR], 2ah
        callf   [bx+C2_TBL_01720]
        pop     si
        retf
far_49C88:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    EP_SOUND_LIST_UNLINK_OFF+C1_CSBASE
        add     sp, 4
        nop
        push    cs
        call    far_48782
        pop     ds
        retf
        db      00h
keep_or_retry_f5:
        enter   4, 0
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        add     cx, 5ch
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     si, ax
        mov     word ptr [bp-2], dx
        nop
        push    cs
        call    far_49D2A
        mov     cl, byte ptr [C2_B_PAD_NOTE]
        sub     ch, ch
        cmp     cx, 23h
        jl      br_49CE2
        cmp     cx, 62h
        jg      br_49CE2
        mov     dx, 1
        jmp     br_49CE4
br_49CE2:
        xor     dx, dx
br_49CE4:
        or      dx, dx
        je      br_49D07
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        mov     es, word ptr [bp-2]
        mov     bl, byte ptr [C2_B_PAD_NOTE]
        sub     bh, bh
        shl     bx, 2
        add     bx, si
        mov     word ptr es:[bx+752h], ax
        mov     word ptr es:[bx+754h], dx
br_49D07:
        nop
        push    cs
        call    far_48782
        pop     ds
        pop     si
        leave
        retf
L_493B2:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    7fh
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    EP_FAR_41C08_OFF+C1_CSBASE
        add     sp, 6
        pop     ds
        retf
far_49D2A:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    0
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    EP_FAR_41C08_OFF+C1_CSBASE
        add     sp, 6
        pop     ds
        retf
keep_or_retry_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    EP_SOUND_LIST_UNLINK_OFF+C1_CSBASE
        add     sp, 4
        pop     ds
        retf
L_49D5C:
        push    bp
        mov     bp, sp
        push    ax
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        or      al, al
        jne     br_49D76
        nop
        push    cs
        call    EP_VOICES_RELEASE_ALL_OFF+C1_CSBASE
        pop     ds
        pop     si
        pop     di
        leave
        retf
br_49D76:
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        mov     al, byte ptr [bp-1]
        mov     byte ptr [C2_B_CUR_PAD], al
        add     cx, 60h
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, word ptr [C2_B_CUR_PAD]
        and     si, 0ffh
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     si, ax
        cmp     si, 23h
        jl      br_49DB0
        cmp     si, 62h
        jg      br_49DB0
        mov     dx, 1
        jmp     br_49DB2
        db      90h
br_49DB0:
        xor     dx, dx
br_49DB2:
        or      dx, dx
        je      br_49DEB
        mov     byte ptr [C2_B_PAD_NOTE], al
        mov     al, byte ptr [bp-2]
        sub     ah, ah
        push    ax
        mov     bx, si
        shl     bx, 2
        mov     al, byte ptr [C2_B_PAD_DRUM]
        add     ax, 5ch
        push    ax
        mov     di, bx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        push    word ptr es:[bx+di+754h]
        push    word ptr es:[bx+di+752h]
        nop
        push    cs
        call    EP_FAR_41C08_OFF+C1_CSBASE
        add     sp, 6
br_49DEB:
        imul    bx, word ptr [C2_W_KEEP_OR_RETRY_CURSOR], 2ah
        callf   [bx+C2_TBL_01720]
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h
keep_or_retry_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    C1_SEG
        push    (C2_BASE+L_4954E-C1_SEG*16)
        nop
        push    cs
        call    EP_SMEM_PROC_WRAPPER_OFF+C1_CSBASE
        add     sp, 4
        push    ds
        push    C2_W_016CE
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        push    dx
        push    ax
        push    13h
        push    85h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 60h
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        push    dx
        push    ax
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        push    ax
        push    25h
        push    85h
        nop
        push    cs
        call    far_47CB4
        add     sp, 0ah
        nop
        push    cs
        call    field_engine_redraw
        pop     ds
        retf
L_49E60:
        nop
        push    cs
        call    EP_VOICES_RELEASE_ALL_OFF+C1_CSBASE
        mov     word ptr [C2_W_KEEP_OR_RETRY_CURSOR], 0
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        push    dx
        push    ax
        push    ds
        push    C2_W_01712
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
L_49E84:
        mov     word ptr [C2_W_KEEP_OR_RETRY_CURSOR], 1
        push    ds
        push    C2_B_PAD_NOTE
        push    ds
        push    C2_W_0173C
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        push    C1_SEG
        push    (C2_BASE+L_49D5C-C1_SEG*16)
        push    37h
        nop
        push    cs
        call    EP_HANDLER_INSTALL_ONE_OFF+C1_CSBASE
        add     sp, 6
        retf
        db      90h
L_4954E:
        db      "KEEP or RETRY"
        db      00h
X_49EBA:
        enter   8, 0
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    EP_SOUND_LIST_CONTAINS_OFF+C1_CSBASE
        add     sp, 4
        or      ax, ax
        jne     br_49EE6
        mov     ax, word ptr [C0_W_098DC]
        mov     dx, word ptr [C0_W_098DE]
        mov     word ptr [C0_W_0D7C2], ax
        mov     word ptr [C0_W_0D7C4], dx
br_49EE6:
        mov     byte ptr [bp-8], 0b0h
        mov     byte ptr [bp-7], 78h
        xor     al, al
        mov     byte ptr [bp-6], al
        mov     byte ptr [bp-5], al
loop_49EF6:
        mov     byte ptr [bp-1], 0
loop_49EFA:
        mov     al, byte ptr [bp-1]
        sub     al, 50h
        mov     byte ptr [bp-8], al
        push    word ptr [bp-4]
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        callf   EP_MIDI_CHANNEL_MSG_DISPATCH_SEG:EP_MIDI_CHANNEL_MSG_DISPATCH_OFF
        add     sp, 6
        inc     byte ptr [bp-1]
        cmp     byte ptr [bp-1], 3
        jbe     loop_49EFA
        inc     byte ptr [bp-5]
        cmp     byte ptr [bp-5], 3
        jl      loop_49EF6
        callf   EP_SOUND_WAVE_OVERVIEW_BUILD_SEG:EP_SOUND_WAVE_OVERVIEW_BUILD_OFF
        nop
        push    cs
        call    far_4D678
        nop
        push    cs
        call    trim_screen_draw
        pop     ds
        leave
        retf
        db      00h
trim_screen_draw:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    1766h
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        mov     ax, C1_TBL_SOUNDS_END
        mov     cx, ds
        cmp     ax, word ptr [C0_W_0D7C2]
        jne     br_49F5B
        cmp     cx, word ptr [C0_W_0D7C4]
        je      br_49F84
br_49F5B:
        push    cx
        push    178eh
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        cmp     word ptr [C2_W_TRIM_CURSOR], 0
        jl      L_49975
        cmp     word ptr [C2_W_TRIM_CURSOR], 5
        jb      br_49F7B
L_49975:
        mov     word ptr [C2_W_TRIM_CURSOR], 0
br_49F7B:
        imul    bx, word ptr [C2_W_TRIM_CURSOR], 2ah
        callf   [bx+C2_TBL_01810]
br_49F84:
        pop     ds
        retf
far_49F86:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     ax, C1_TBL_SOUNDS_END
        cmp     ax, word ptr [C0_W_0D7C2]
        jne     br_49F9B
        cmp     cx, word ptr [C0_W_0D7C4]
        je      br_49FC2
br_49F9B:
        nop
        push    cs
        call    trim_screen_refresh
        les     bx, [C0_W_0D7C2]
        push    word ptr es:[bx+SND_END+2]
        push    word ptr es:[bx+SND_END]
        push    word ptr es:[bx+SND_START+2]
        push    word ptr es:[bx+SND_START]
        push    EP_TRIM_SCREEN_DRAW_SEG
        push    EP_TRIM_SCREEN_DRAW_OFF
        nop
        push    cs
        call    far_4CC94
        add     sp, 0ch
br_49FC2:
        pop     ds
        retf
trim_screen_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        imul    bx, word ptr [C2_W_TRIM_CURSOR], 2ah
        mov     ax, word ptr [bx+C2_TBL_0182A]
        or      ax, word ptr [bx+C2_TBL_01828]
        je      br_49FE7
        nop
        push    cs
        call    trim_screen_refresh
        imul    bx, word ptr [C2_W_TRIM_CURSOR], 2ah
        callf   [bx+C2_TBL_01828]
br_49FE7:
        pop     ds
        retf
        db      00h
trim_screen_key_33:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   EP_WAVE_OVERVIEW_BUILD_STEP_SEG:EP_WAVE_OVERVIEW_BUILD_STEP_OFF
        pop     ds
        retf
        db      00h
trim_screen_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    EP_VOICES_RELEASE_ALL_OFF+C1_CSBASE
        pop     ds
        retf
        db      00h
far_4A006:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    trim_screen_refresh
        push    EP_TRIM_SCREEN_DRAW_SEG
        push    EP_TRIM_SCREEN_DRAW_OFF
        callf   EP_FAR_55112_SEG:EP_FAR_55112_OFF
        add     sp, 4
        pop     ds
        retf
        db      00h
far_49822:
        enter   8, 0
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    cx
        push    17b6h
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        push    91h
        nop
        push    cs
        call    EP_L_3EA6A_OFF+C1_CSBASE
        add     sp, 2
        mov     al, byte ptr [C0_B_0D7D6]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C2_TBL_018FA]
        push    word ptr [bx+C2_TBL_018F8]
        push    1
        push    0c7h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        les     bx, [C0_W_0D7C2]
        test    byte ptr es:[bx+SND_FLAGS_HI], 1
        je      br_4A084
        mov     ax, STR_C1_ROM
        mov     dx, C1_SEG
        jmp     br_4A08A
br_4A084:
        mov     ax, C2_W_0CD82
        mov     dx, C1_SEG
br_4A08A:
        push    dx
        push    ax
        push    2
        push    2
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        push    2
        push    1ah
        nop
        push    cs
        call    far_47D5E
        add     sp, 8
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+16h]
        push    word ptr es:[si+14h]
        push    0ch
        push    1ah
        nop
        push    cs
        call    far_47FA4
        add     sp, 8
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+1ah]
        push    word ptr es:[si+18h]
        push    0ch
        push    7ah
        nop
        push    cs
        call    far_47FA4
        add     sp, 8
        cmp     byte ptr [C1_B_0D7D7], 0
        je      br_4A0EA
        mov     ax, C2_W_0CDB6
        mov     dx, C1_SEG
        jmp     br_4A0F0
        db      90h
br_4A0EA:
        mov     ax, C2_W_0CDBC
        mov     dx, C1_SEG
br_4A0F0:
        push    dx
        push    ax
        push    0ch
        push    0d4h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        mov     ax, C1_TBL_SOUNDS_END
        mov     cx, ds
        cmp     ax, word ptr [C0_W_0D7C2]
        jne     br_4A110
        cmp     cx, word ptr [C0_W_0D7C4]
        je      br_4A159
br_4A110:
        push    EP_FAR_4A018_SEG
        push    EP_FAR_4A018_OFF
        push    1
        push    5
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
        push    C1_SEG
        if      FW_VERSION >= 120
        push    EP_L_4A01E_OFF
        else
        push    EP_L_4A958_OFF
        endif
        push    1
        push    6
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
        nop
        push    cs
        call    field_engine_redraw
        callf   EP_WAVE_OVERVIEW_DRAW_SEG:EP_WAVE_OVERVIEW_DRAW_OFF
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+1ah]
        push    word ptr es:[si+18h]
        push    word ptr es:[si+16h]
        push    word ptr es:[si+14h]
        callf   C2_SEG:(CONSTS_BASE+wave_region_highlight-C2_SEG*16)
        add     sp, 8
br_4A159:
        pop     ds
        pop     si
        leave
        retf
        db      00h
trim_focus_sound:
        mov     word ptr [C2_W_TRIM_CURSOR], 0
        push    ds
        push    C0_W_0D7C2
        push    ds
        push    C2_W_01802
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
far_4A176:
        callf   EP_SOUND_WAVE_OVERVIEW_BUILD_SEG:EP_SOUND_WAVE_OVERVIEW_BUILD_OFF
        nop
        push    cs
        call    far_4D678
        retf
        db      00h
far_49824:
far_4A182:
        push    EP_TRIM_SCREEN_DRAW_SEG
        push    EP_TRIM_SCREEN_DRAW_OFF
        nop
        push    cs
        call    far_4C0D8
        add     sp, 4
        retf
        db      00h
trim_focus_play_x:
        mov     word ptr [C2_W_TRIM_CURSOR], 1
        push    ds
        push    C0_B_0D7D6
        push    ds
        push    C2_W_0182C
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
trim_focus_start:
        mov     word ptr [C2_W_TRIM_CURSOR], 2
        push    ds
        push    C2_W_01856
        nop
        push    cs
        call    far_4A1F0
        add     sp, 4
        retf
        db      00h
trim_focus_end:
        mov     word ptr [C2_W_TRIM_CURSOR], 3
        push    ds
        push    C2_W_01880
        nop
        push    cs
        call    far_4A5E8
        add     sp, 4
        retf
        db      00h
trim_focus_view:
        mov     word ptr [C2_W_TRIM_CURSOR], 4
        push    ds
        push    C1_B_0D7D7
        push    ds
        push    C2_W_018AA
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_4A1EA:
        callf   EP_SOUND_WAVE_OVERVIEW_BUILD_SEG:EP_SOUND_WAVE_OVERVIEW_BUILD_OFF
        retf
far_4A1F0:
        enter   8, 0
        push    di
        push    si
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     ax, FE_RAM_DESC
        mov     dx, word ptr [bp+6]
        mov     bx, word ptr [bp+8]
        push    ds
        mov     di, ax
        mov     si, dx
        push    ds
        pop     es
        mov     ds, bx
        mov     cx, 15h
        rep movsw
        pop     ds
        mov     word ptr [C2_W_FE_SAVED_DESC_OFF], dx
        mov     word ptr [C2_W_FE_SAVED_DESC_SEG], bx
        les     bx, [bp-8]
        mov     ax, word ptr es:[bx+14h]
        mov     dx, word ptr es:[bx+16h]
        mov     word ptr [C0_B_098B8], ax
        mov     word ptr [C2_W_098BA], dx
        mov     word ptr [bp-4], 98b8h
        mov     word ptr [bp-2], ds
        les     bx, [C0_W_0D7C2]
        test    byte ptr es:[bx+SND_FLAGS_HI], 1
        je      br_4A256
        xor     ax, ax
        cwd
        mov     cx, ax
        mov     word ptr [bp-2], dx
        jmp     br_4A36C
br_4A256:
        cmp     byte ptr [C1_B_0D7D8], 0
        jne     br_4A290
        cmp     byte ptr [C1_B_0D7DB], 0
        jne     br_4A290
        mov     bx, word ptr [bp-8]
        mov     es, word ptr [bp-6]
        mov     ax, word ptr es:[bx+1ch]
        mov     dx, word ptr es:[bx+1eh]
        mov     word ptr [C2_W_FE_SCRATCH_MAX_LO], ax
        mov     word ptr [C2_W_FE_SCRATCH_MAX_HI], dx
        sub     ax, ax
        mov     word ptr [C2_W_FE_SCRATCH_MIN_HI], ax
        mov     word ptr [C2_W_FE_SCRATCH_MIN_LO], ax
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_OFF], (C2_BASE+L_4A380-C1_SEG*16)
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_SEG], C1_SEG
        jmp     NEAR br_4A369
br_4A290:
        mov     bx, word ptr [bp-8]
        cmp     byte ptr [C1_B_0D7D8], 0
        jne     br_4A2CA
        cmp     byte ptr [C1_B_0D7DB], 0
        je      br_4A2CA
        mov     es, word ptr [bp-6]
        mov     ax, word ptr es:[bx+1ch]
        mov     dx, word ptr es:[bx+1eh]
        mov     word ptr [C2_W_FE_SCRATCH_MAX_LO], ax
        mov     word ptr [C2_W_FE_SCRATCH_MAX_HI], dx
        sub     ax, ax
        mov     word ptr [C2_W_FE_SCRATCH_MIN_HI], ax
        mov     word ptr [C2_W_FE_SCRATCH_MIN_LO], ax
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_OFF], C2_W_0C2B2
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_SEG], C1_SEG
        jmp     NEAR br_4A369
br_4A2CA:
        cmp     byte ptr [C1_B_0D7D8], 0
        je      br_4A310
        cmp     byte ptr [C1_B_0D7DB], 0
        jne     br_4A310
        sub     ax, ax
        mov     word ptr [C2_W_FE_SCRATCH_MIN_HI], ax
        mov     word ptr [C2_W_FE_SCRATCH_MIN_LO], ax
        mov     es, word ptr [bp-6]
        mov     ax, word ptr es:[bx+14h]
        mov     dx, word ptr es:[bx+16h]
        sub     ax, word ptr es:[bx+18h]
        sbb     dx, word ptr es:[bx+1ah]
        add     ax, word ptr es:[bx+1ch]
        adc     dx, word ptr es:[bx+1eh]
        mov     word ptr [C2_W_FE_SCRATCH_MAX_LO], ax
        mov     word ptr [C2_W_FE_SCRATCH_MAX_HI], dx
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_OFF], C2_W_0C31E
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_SEG], C1_SEG
        jmp     SHORT br_4A369
br_4A310:
        mov     es, word ptr [bp-6]
        mov     ax, word ptr es:[bx+14h]
        mov     dx, word ptr es:[bx+16h]
        sub     ax, word ptr es:[bx+18h]
        sbb     dx, word ptr es:[bx+1ah]
        add     ax, word ptr es:[bx+20h]
        adc     dx, word ptr es:[bx+22h]
        mov     word ptr [C2_W_FE_SCRATCH_MIN_LO], ax
        mov     word ptr [C2_W_FE_SCRATCH_MIN_HI], dx
        or      dx, dx
        jge     br_4A33E
        sub     ax, ax
        mov     word ptr [C2_W_FE_SCRATCH_MIN_HI], ax
        mov     word ptr [C2_W_FE_SCRATCH_MIN_LO], ax
br_4A33E:
        mov     ax, word ptr es:[bx+14h]
        mov     dx, word ptr es:[bx+16h]
        sub     ax, word ptr es:[bx+18h]
        sbb     dx, word ptr es:[bx+1ah]
        add     ax, word ptr es:[bx+1ch]
        adc     dx, word ptr es:[bx+1eh]
        mov     word ptr [C2_W_FE_SCRATCH_MAX_LO], ax
        mov     word ptr [C2_W_FE_SCRATCH_MAX_HI], dx
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_OFF], C2_W_0C3F6
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_SEG], C1_SEG
br_4A369:
        mov     cx, word ptr [bp-4]
br_4A36C:
        push    word ptr [bp-2]
        push    cx
        push    ds
        push    FE_RAM_DESC
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        pop     si
        pop     di
        leave
        retf
L_4A380:
        enter   10h, 0
        push    di
        push    si
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        les     bx, [C0_W_0D7C2]
        add     bx, 12h
        mov     si, bx
        mov     word ptr [bp-2], es
        cmp     word ptr es:[bx+1ah], dx
        jg      br_4A405
        jl      br_4A3A6
        cmp     word ptr es:[bx+18h], ax
        jae     br_4A405
br_4A3A6:
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+20h]
        mov     dx, word ptr es:[si+22h]
        sub     ax, word ptr es:[si+18h]
        sbb     dx, word ptr es:[si+1ah]
        add     ax, word ptr [bp+6]
        adc     dx, word ptr [bp+8]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     word ptr es:[si+20h], ax
        mov     word ptr es:[si+22h], dx
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        mov     di, ax
        mov     word ptr [bp-0ah], dx
        push    0
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        callf   EP_ADDR_CALC_SEGMENT_SEG:EP_ADDR_CALC_SEGMENT_OFF
        add     sp, 6
        mov     es, word ptr [bp-0ah]
        mov     word ptr es:[di+3ah], ax
        mov     word ptr es:[di+3ch], dx
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+18h], ax
        mov     word ptr es:[si+1ah], dx
br_4A405:
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+14h], ax
        mov     word ptr es:[si+16h], dx
        les     bx, [C2_W_FE_SAVED_DESC_OFF]
        mov     ax, word ptr es:[bx+22h]
        mov     dx, word ptr es:[bx+24h]
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_4A43D
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+16h]
        push    word ptr es:[si+14h]
        callf   [bp-10h]
        add     sp, 4
br_4A43D:
        pop     si
        pop     di
        leave
        retf
        db      00h
L_4A442:
        enter   8, 0
        push    si
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        les     bx, [C0_W_0D7C2]
        add     bx, 12h
        mov     si, bx
        mov     word ptr [bp-2], es
        cmp     word ptr es:[bx+1ah], dx
        jg      br_4A472
        jl      br_4A467
        cmp     word ptr es:[bx+18h], ax
        jae     br_4A472
br_4A467:
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+18h], ax
        mov     word ptr es:[si+1ah], dx
br_4A472:
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+14h], ax
        mov     word ptr es:[si+16h], dx
        les     bx, [C2_W_FE_SAVED_DESC_OFF]
        mov     ax, word ptr es:[bx+22h]
        mov     dx, word ptr es:[bx+24h]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      br_4A4AA
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+16h]
        push    word ptr es:[si+14h]
        callf   [bp-8]
        add     sp, 4
br_4A4AA:
        pop     si
        leave
        retf
        db      00h
L_4A4AE:
        enter   18h, 0
        push    di
        push    si
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     bx, ax
        mov     es, dx
        mov     cx, word ptr es:[bx+18h]
        mov     di, word ptr es:[bx+1ah]
        mov     word ptr [bp-14h], cx
        mov     word ptr [bp-12h], di
        sub     cx, word ptr es:[bx+14h]
        sbb     di, word ptr es:[bx+16h]
        add     cx, word ptr [bp+6]
        adc     di, word ptr [bp+8]
        mov     word ptr [bp-10h], cx
        mov     word ptr [bp-0eh], di
        sub     cx, word ptr [bp-14h]
        sbb     di, word ptr [bp-12h]
        add     cx, word ptr es:[bx+20h]
        adc     di, word ptr es:[bx+22h]
        mov     word ptr [bp-0ch], cx
        mov     word ptr [bp-0ah], di
        or      di, di
        jge     br_4A509
        sub     ax, ax
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-0ch], ax
br_4A509:
        mov     ax, word ptr [bp-0ch]
        mov     dx, word ptr [bp-0ah]
        mov     word ptr es:[si+20h], ax
        mov     word ptr es:[si+22h], dx
        mov     cx, word ptr [C0_W_0D7C2]
        mov     bx, word ptr [C0_W_0D7C4]
        mov     di, cx
        mov     word ptr [bp-6], bx
        push    0
        push    dx
        push    ax
        callf   EP_ADDR_CALC_SEGMENT_SEG:EP_ADDR_CALC_SEGMENT_OFF
        add     sp, 6
        mov     es, word ptr [bp-6]
        mov     word ptr es:[di+3ah], ax
        mov     word ptr es:[di+3ch], dx
        mov     ax, word ptr [bp-10h]
        mov     dx, word ptr [bp-0eh]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+18h], ax
        mov     word ptr es:[si+1ah], dx
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr es:[si+14h], ax
        mov     word ptr es:[si+16h], dx
        les     bx, [C2_W_FE_SAVED_DESC_OFF]
        mov     ax, word ptr es:[bx+22h]
        mov     dx, word ptr es:[bx+24h]
        mov     word ptr [bp-18h], ax
        mov     word ptr [bp-16h], dx
        or      dx, ax
        je      br_4A581
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+16h]
        push    word ptr es:[si+14h]
        callf   [bp-18h]
        add     sp, 4
br_4A581:
        pop     si
        pop     di
        leave
        retf
        db      00h
L_4A586:
        enter   8, 0
        push    si
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        les     bx, [C0_W_0D7C2]
        add     bx, 12h
        mov     si, bx
        mov     word ptr [bp-2], es
        sub     ax, word ptr es:[bx+14h]
        sbb     dx, word ptr es:[bx+16h]
        add     word ptr es:[bx+18h], ax
        adc     word ptr es:[bx+1ah], dx
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+14h], ax
        mov     word ptr es:[si+16h], dx
        les     bx, [C2_W_FE_SAVED_DESC_OFF]
        mov     ax, word ptr es:[bx+22h]
        mov     dx, word ptr es:[bx+24h]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      br_4A5E5
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+16h]
        push    word ptr es:[si+14h]
        callf   [bp-8]
        add     sp, 4
br_4A5E5:
        pop     si
        leave
        retf
far_4A5E8:
        enter   0ch, 0
        push    di
        push    si
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        mov     ax, FE_RAM_DESC
        mov     dx, word ptr [bp+6]
        mov     bx, word ptr [bp+8]
        push    ds
        mov     di, ax
        mov     si, dx
        push    ds
        pop     es
        mov     ds, bx
        mov     cx, 15h
        rep movsw
        pop     ds
        mov     word ptr [C2_W_FE_SAVED_DESC_OFF], dx
        mov     word ptr [C2_W_FE_SAVED_DESC_SEG], bx
        les     bx, [bp-0ch]
        mov     ax, word ptr es:[bx+18h]
        mov     dx, word ptr es:[bx+1ah]
        mov     word ptr [C0_B_098B8], ax
        mov     word ptr [C2_W_098BA], dx
        mov     word ptr [bp-8], 98b8h
        mov     word ptr [bp-6], ds
        les     bx, [C0_W_0D7C2]
        test    byte ptr es:[bx+SND_FLAGS_HI], 1
        je      br_4A64E
        xor     ax, ax
        cwd
        mov     cx, ax
        mov     word ptr [bp-6], dx
        jmp     br_4A768
br_4A64E:
        cmp     byte ptr [C1_B_0D7D8], 0
        jne     br_4A688
        cmp     byte ptr [C1_B_0D7DB], 0
        jne     br_4A688
        sub     ax, ax
        mov     word ptr [C2_W_FE_SCRATCH_MIN_HI], ax
        mov     word ptr [C2_W_FE_SCRATCH_MIN_LO], ax
        mov     bx, word ptr [bp-0ch]
        mov     es, word ptr [bp-0ah]
        mov     ax, word ptr es:[bx+1ch]
        mov     dx, word ptr es:[bx+1eh]
        mov     word ptr [C2_W_FE_SCRATCH_MAX_LO], ax
        mov     word ptr [C2_W_FE_SCRATCH_MAX_HI], dx
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_OFF], (C2_BASE+L_4A77C-C1_SEG*16)
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_SEG], C1_SEG
        jmp     NEAR br_4A765
br_4A688:
        mov     bx, word ptr [bp-0ch]
        cmp     byte ptr [C1_B_0D7D8], 0
        jne     br_4A6CA
        cmp     byte ptr [C1_B_0D7DB], 0
        je      br_4A6CA
        mov     es, word ptr [bp-0ah]
        mov     ax, word ptr es:[bx+20h]
        mov     dx, word ptr es:[bx+22h]
        mov     word ptr [C2_W_FE_SCRATCH_MIN_LO], ax
        mov     word ptr [C2_W_FE_SCRATCH_MIN_HI], dx
        mov     ax, word ptr es:[bx+1ch]
        mov     dx, word ptr es:[bx+1eh]
        mov     word ptr [C2_W_FE_SCRATCH_MAX_LO], ax
        mov     word ptr [C2_W_FE_SCRATCH_MAX_HI], dx
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_OFF], C2_W_0C6BA
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_SEG], C1_SEG
        jmp     NEAR br_4A765
        db      90h
br_4A6CA:
        cmp     byte ptr [C1_B_0D7D8], 0
        je      br_4A710
        cmp     byte ptr [C1_B_0D7DB], 0
        jne     br_4A710
        mov     es, word ptr [bp-0ah]
        mov     ax, word ptr es:[bx+18h]
        mov     dx, word ptr es:[bx+1ah]
        sub     ax, word ptr es:[bx+14h]
        sbb     dx, word ptr es:[bx+16h]
        mov     word ptr [C2_W_FE_SCRATCH_MIN_LO], ax
        mov     word ptr [C2_W_FE_SCRATCH_MIN_HI], dx
        mov     ax, word ptr es:[bx+1ch]
        mov     dx, word ptr es:[bx+1eh]
        mov     word ptr [C2_W_FE_SCRATCH_MAX_LO], ax
        mov     word ptr [C2_W_FE_SCRATCH_MAX_HI], dx
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_OFF], C2_W_0C6F8
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_SEG], C1_SEG
        jmp     SHORT br_4A765
        db      90h
br_4A710:
        mov     es, word ptr [bp-0ah]
        mov     ax, word ptr es:[bx+18h]
        mov     dx, word ptr es:[bx+1ah]
        sub     ax, word ptr es:[bx+14h]
        sbb     dx, word ptr es:[bx+16h]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     ax, word ptr es:[bx+1ch]
        mov     dx, word ptr es:[bx+1eh]
        mov     word ptr [C2_W_FE_SCRATCH_MAX_LO], ax
        mov     word ptr [C2_W_FE_SCRATCH_MAX_HI], dx
        mov     ax, word ptr es:[bx+20h]
        mov     dx, word ptr es:[bx+22h]
        cmp     dx, word ptr [bp-2]
        jg      br_4A752
        jl      br_4A74C
        cmp     ax, word ptr [bp-4]
        jae     br_4A752
br_4A74C:
        mov     dx, word ptr [bp-2]
        mov     ax, word ptr [bp-4]
br_4A752:
        mov     word ptr [C2_W_FE_SCRATCH_MIN_LO], ax
        mov     word ptr [C2_W_FE_SCRATCH_MIN_HI], dx
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_OFF], (C2_BASE+L_4A97C-C1_SEG*16)
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_SEG], C1_SEG
br_4A765:
        mov     cx, word ptr [bp-8]
br_4A768:
        push    word ptr [bp-6]
        push    cx
        push    ds
        push    FE_RAM_DESC
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        pop     si
        pop     di
        leave
        retf
L_4A77C:
        enter   10h, 0
        push    di
        push    si
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     bx, ax
        mov     es, dx
        mov     cx, word ptr es:[bx+20h]
        mov     di, word ptr es:[bx+22h]
        sub     cx, word ptr es:[bx+18h]
        sbb     di, word ptr es:[bx+1ah]
        add     cx, word ptr [bp+6]
        adc     di, word ptr [bp+8]
        mov     word ptr [bp-0ch], cx
        mov     word ptr [bp-0ah], di
        or      di, di
        jge     br_4A7BD
        sub     ax, ax
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-0ch], ax
br_4A7BD:
        mov     ax, word ptr [bp-0ch]
        mov     dx, word ptr [bp-0ah]
        mov     word ptr es:[si+20h], ax
        mov     word ptr es:[si+22h], dx
        mov     cx, word ptr [C0_W_0D7C2]
        mov     bx, word ptr [C0_W_0D7C4]
        mov     di, cx
        mov     word ptr [bp-6], bx
        push    0
        push    dx
        push    ax
        callf   EP_ADDR_CALC_SEGMENT_SEG:EP_ADDR_CALC_SEGMENT_OFF
        add     sp, 6
        mov     es, word ptr [bp-6]
        mov     word ptr es:[di+3ah], ax
        mov     word ptr es:[di+3ch], dx
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     es, word ptr [bp-2]
        cmp     word ptr es:[si+16h], dx
        jl      br_4A80E
        jg      br_4A806
        cmp     word ptr es:[si+14h], ax
        jbe     br_4A80E
br_4A806:
        mov     word ptr es:[si+14h], ax
        mov     word ptr es:[si+16h], dx
br_4A80E:
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+18h], ax
        mov     word ptr es:[si+1ah], dx
        les     bx, [C2_W_FE_SAVED_DESC_OFF]
        mov     ax, word ptr es:[bx+22h]
        mov     dx, word ptr es:[bx+24h]
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_4A846
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+1ah]
        push    word ptr es:[si+18h]
        callf   [bp-10h]
        add     sp, 4
br_4A846:
        pop     si
        pop     di
        leave
        retf
L_4A84A:
        enter   8, 0
        push    si
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        les     bx, [C0_W_0D7C2]
        add     bx, 12h
        mov     si, bx
        mov     word ptr [bp-2], es
        cmp     word ptr es:[bx+16h], dx
        jl      br_4A87A
        jg      br_4A86F
        cmp     word ptr es:[bx+14h], ax
        jbe     br_4A87A
br_4A86F:
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+14h], ax
        mov     word ptr es:[si+16h], dx
br_4A87A:
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+18h], ax
        mov     word ptr es:[si+1ah], dx
        les     bx, [C2_W_FE_SAVED_DESC_OFF]
        mov     ax, word ptr es:[bx+22h]
        mov     dx, word ptr es:[bx+24h]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      br_4A8B2
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+1ah]
        push    word ptr es:[si+18h]
        callf   [bp-8]
        add     sp, 4
br_4A8B2:
        pop     si
        leave
        retf
        db      00h
L_4A8B6:
        enter   10h, 0
        push    di
        push    si
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     bx, ax
        mov     es, dx
        mov     cx, word ptr es:[bx+20h]
        mov     di, word ptr es:[bx+22h]
        sub     cx, word ptr es:[bx+18h]
        sbb     di, word ptr es:[bx+1ah]
        add     cx, word ptr [bp+6]
        adc     di, word ptr [bp+8]
        mov     word ptr [bp-0ch], cx
        mov     word ptr [bp-0ah], di
        or      di, di
        jge     br_4A8F7
        sub     ax, ax
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-0ch], ax
br_4A8F7:
        mov     ax, word ptr [bp-0ch]
        mov     dx, word ptr [bp-0ah]
        mov     word ptr es:[si+20h], ax
        mov     word ptr es:[si+22h], dx
        mov     cx, word ptr [C0_W_0D7C2]
        mov     bx, word ptr [C0_W_0D7C4]
        mov     di, cx
        mov     word ptr [bp-6], bx
        push    0
        push    dx
        push    ax
        callf   EP_ADDR_CALC_SEGMENT_SEG:EP_ADDR_CALC_SEGMENT_OFF
        add     sp, 6
        mov     es, word ptr [bp-6]
        mov     word ptr es:[di+3ah], ax
        mov     word ptr es:[di+3ch], dx
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     es, word ptr [bp-2]
        sub     ax, word ptr es:[si+18h]
        sbb     dx, word ptr es:[si+1ah]
        add     word ptr es:[si+14h], ax
        adc     word ptr es:[si+16h], dx
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr es:[si+18h], ax
        mov     word ptr es:[si+1ah], dx
        les     bx, [C2_W_FE_SAVED_DESC_OFF]
        mov     ax, word ptr es:[bx+22h]
        mov     dx, word ptr es:[bx+24h]
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_4A977
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+1ah]
        push    word ptr es:[si+18h]
        callf   [bp-10h]
        add     sp, 4
br_4A977:
        pop     si
        pop     di
        leave
        retf
        db      00h
L_4A97C:
        enter   8, 0
        push    si
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        les     bx, [C0_W_0D7C2]
        add     bx, 12h
        mov     si, bx
        mov     word ptr [bp-2], es
        sub     ax, word ptr es:[bx+18h]
        sbb     dx, word ptr es:[bx+1ah]
        add     word ptr es:[bx+14h], ax
        adc     word ptr es:[bx+16h], dx
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+18h], ax
        mov     word ptr es:[si+1ah], dx
        les     bx, [C2_W_FE_SAVED_DESC_OFF]
        mov     ax, word ptr es:[bx+22h]
        mov     dx, word ptr es:[bx+24h]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      br_4A9DB
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+1ah]
        push    word ptr es:[si+18h]
        callf   [bp-8]
        add     sp, 4
br_4A9DB:
        pop     si
        leave
        retf
far_4A9DE:
        enter   8, 0
        push    di
        push    si
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     ax, FE_RAM_DESC
        mov     dx, word ptr [bp+6]
        mov     bx, word ptr [bp+8]
        push    ds
        mov     di, ax
        mov     si, dx
        push    ds
        pop     es
        mov     ds, bx
        mov     cx, 15h
        rep movsw
        pop     ds
        mov     word ptr [C2_W_FE_SAVED_DESC_OFF], dx
        mov     word ptr [C2_W_FE_SAVED_DESC_SEG], bx
        mov     word ptr [bp-8], 98b8h
        mov     word ptr [bp-6], ds
        les     bx, [bp-4]
        mov     ax, word ptr es:[bx+18h]
        mov     dx, word ptr es:[bx+1ah]
        sub     ax, word ptr es:[bx+20h]
        sbb     dx, word ptr es:[bx+22h]
        mov     word ptr [C0_B_098B8], ax
        mov     word ptr [C2_W_098BA], dx
        les     bx, [C0_W_0D7C2]
        test    byte ptr es:[bx+SND_FLAGS_HI], 1
        je      br_4AA4C
        xor     ax, ax
        cwd
        mov     cx, ax
        mov     word ptr [bp-6], dx
        jmp     br_4AAE3
br_4AA4C:
        sub     ax, ax
        mov     word ptr [C2_W_FE_SCRATCH_MIN_HI], ax
        mov     word ptr [C2_W_FE_SCRATCH_MIN_LO], ax
        cmp     byte ptr [C1_B_0D7DB], al
        jne     br_4AA7E
        mov     si, word ptr [bp-4]
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+18h]
        mov     dx, word ptr es:[si+1ah]
        mov     word ptr [C2_W_FE_SCRATCH_MAX_LO], ax
        mov     word ptr [C2_W_FE_SCRATCH_MAX_HI], dx
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_OFF], (C2_BASE+L_4AAF8-C1_SEG*16)
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_SEG], C1_SEG
        jmp     SHORT br_4AAE0
        db      90h
br_4AA7E:
        mov     si, word ptr [bp-4]
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+1ch]
        mov     dx, word ptr es:[si+1eh]
        sub     ax, word ptr es:[si+20h]
        sbb     dx, word ptr es:[si+22h]
        mov     word ptr [C2_W_FE_SCRATCH_MAX_LO], ax
        mov     word ptr [C2_W_FE_SCRATCH_MAX_HI], dx
        cmp     byte ptr [C1_B_0D7D8], 0
        jne     br_4AAB0
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_OFF], (C2_BASE+L_4AB88-C1_SEG*16)
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_SEG], C1_SEG
        jmp     br_4AAE0
br_4AAB0:
        mov     ax, word ptr [C0_B_098B8]
        mov     dx, word ptr [C2_W_098BA]
        cmp     word ptr es:[si+16h], dx
        jg      br_4AAD4
        jl      br_4AAC5
        cmp     word ptr es:[si+14h], ax
        jae     br_4AAD4
br_4AAC5:
        sub     ax, word ptr es:[si+14h]
        sbb     dx, word ptr es:[si+16h]
        mov     word ptr [C2_W_FE_SCRATCH_MIN_LO], ax
        mov     word ptr [C2_W_FE_SCRATCH_MIN_HI], dx
br_4AAD4:
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_OFF], P_CA82
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_SEG], C1_SEG
br_4AAE0:
        mov     cx, word ptr [bp-8]
br_4AAE3:
        push    word ptr [bp-6]
        push    cx
        push    ds
        push    FE_RAM_DESC
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        pop     si
        pop     di
        leave
        retf
        db      00h
L_4AAF8:
        enter   0ch, 0
        push    di
        push    si
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     bx, ax
        mov     es, dx
        mov     cx, word ptr es:[bx+18h]
        mov     di, word ptr es:[bx+1ah]
        sub     cx, word ptr [bp+6]
        sbb     di, word ptr [bp+8]
        mov     word ptr es:[bx+20h], cx
        mov     word ptr es:[bx+22h], di
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        mov     di, ax
        mov     word ptr [bp-6], dx
        push    0
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+22h]
        push    word ptr es:[si+20h]
        callf   EP_ADDR_CALC_SEGMENT_SEG:EP_ADDR_CALC_SEGMENT_OFF
        add     sp, 6
        mov     es, word ptr [bp-6]
        mov     word ptr es:[di+3ah], ax
        mov     word ptr es:[di+3ch], dx
        les     bx, [C2_W_FE_SAVED_DESC_OFF]
        mov     ax, word ptr es:[bx+22h]
        mov     dx, word ptr es:[bx+24h]
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        je      br_4AB84
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+18h]
        mov     dx, word ptr es:[si+1ah]
        sub     ax, word ptr es:[si+20h]
        sbb     dx, word ptr es:[si+22h]
        push    dx
        push    ax
        callf   [bp-0ch]
        add     sp, 4
br_4AB84:
        pop     si
        pop     di
        leave
        retf
L_4AB88:
        enter   10h, 0
        push    di
        push    si
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        mov     si, ax
        mov     word ptr [bp-6], dx
        mov     bx, ax
        mov     es, dx
        mov     cx, word ptr es:[bx+20h]
        mov     di, word ptr es:[bx+22h]
        add     cx, word ptr [bp+6]
        adc     di, word ptr [bp+8]
        mov     word ptr [bp-4], cx
        mov     word ptr [bp-2], di
        cmp     di, word ptr es:[bx+16h]
        jg      br_4ABCB
        jl      br_4ABC3
        cmp     cx, word ptr es:[bx+14h]
        jae     br_4ABCB
br_4ABC3:
        mov     word ptr es:[si+14h], cx
        mov     word ptr es:[si+16h], di
br_4ABCB:
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        mov     es, word ptr [bp-6]
        mov     word ptr es:[si+18h], ax
        mov     word ptr es:[si+1ah], dx
        les     bx, [C2_W_FE_SAVED_DESC_OFF]
        mov     ax, word ptr es:[bx+22h]
        mov     dx, word ptr es:[bx+24h]
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_4AC0D
        mov     es, word ptr [bp-6]
        mov     ax, word ptr es:[si+18h]
        mov     dx, word ptr es:[si+1ah]
        sub     ax, word ptr es:[si+20h]
        sbb     dx, word ptr es:[si+22h]
        push    dx
        push    ax
        callf   [bp-10h]
        add     sp, 4
br_4AC0D:
        pop     si
        pop     di
        leave
        retf
        db      00h
L_4AC12:
        enter   0ch, 0
        push    di
        push    si
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     bx, ax
        mov     es, dx
        mov     cx, word ptr es:[bx+20h]
        mov     di, word ptr es:[bx+22h]
        add     cx, word ptr [bp+6]
        adc     di, word ptr [bp+8]
        mov     word ptr [bp-8], cx
        mov     word ptr [bp-6], di
        sub     cx, word ptr es:[bx+18h]
        sbb     di, word ptr es:[bx+1ah]
        add     word ptr es:[bx+14h], cx
        adc     word ptr es:[bx+16h], di
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+18h], ax
        mov     word ptr es:[si+1ah], dx
        les     bx, [C2_W_FE_SAVED_DESC_OFF]
        mov     ax, word ptr es:[bx+22h]
        mov     dx, word ptr es:[bx+24h]
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        je      br_4AC91
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+18h]
        mov     dx, word ptr es:[si+1ah]
        sub     ax, word ptr es:[si+20h]
        sbb     dx, word ptr es:[si+22h]
        push    dx
        push    ax
        callf   [bp-0ch]
        add     sp, 4
br_4AC91:
        pop     si
        pop     di
        leave
        retf
        db      00h
far_4AC96:
        enter   8, 0
        push    di
        push    si
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     word ptr [bp-4], 98b8h
        mov     word ptr [bp-2], ds
        mov     ax, FE_RAM_DESC
        mov     dx, word ptr [bp+6]
        mov     bx, word ptr [bp+8]
        push    ds
        mov     di, ax
        mov     si, dx
        push    ds
        pop     es
        mov     ds, bx
        mov     cx, 15h
        rep movsw
        pop     ds
        mov     word ptr [C2_W_FE_SAVED_DESC_OFF], dx
        mov     word ptr [C2_W_FE_SAVED_DESC_SEG], bx
        les     bx, [bp-8]
        mov     ax, word ptr es:[bx+20h]
        mov     dx, word ptr es:[bx+22h]
        mov     word ptr [C0_B_098B8], ax
        mov     word ptr [C2_W_098BA], dx
        les     bx, [C0_W_0D7C2]
        test    byte ptr es:[bx+SND_FLAGS_HI], 1
        je      br_4ACFC
        xor     ax, ax
        cwd
        mov     cx, ax
        mov     word ptr [bp-2], dx
        jmp     br_4AD89
br_4ACFC:
        cmp     byte ptr [C1_B_0D7D8], 0
        jne     br_4AD3E
        sub     ax, ax
        mov     word ptr [C2_W_FE_SCRATCH_MIN_HI], ax
        mov     word ptr [C2_W_FE_SCRATCH_MIN_LO], ax
        mov     bx, word ptr [bp-8]
        mov     es, word ptr [bp-6]
        mov     ax, word ptr es:[bx+1ch]
        mov     dx, word ptr es:[bx+1eh]
        sub     ax, word ptr es:[bx+18h]
        sbb     dx, word ptr es:[bx+1ah]
        add     ax, word ptr es:[bx+20h]
        adc     dx, word ptr es:[bx+22h]
        mov     word ptr [C2_W_FE_SCRATCH_MAX_LO], ax
        mov     word ptr [C2_W_FE_SCRATCH_MAX_HI], dx
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_OFF], (C2_BASE+L_4AD9E-C1_SEG*16)
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_SEG], C1_SEG
        jmp     br_4AD86
br_4AD3E:
        mov     bx, word ptr [bp-8]
        cmp     byte ptr [C1_B_0D7DB], 0
        jne     br_4AD70
        sub     ax, ax
        mov     word ptr [C2_W_FE_SCRATCH_MIN_HI], ax
        mov     word ptr [C2_W_FE_SCRATCH_MIN_LO], ax
        mov     es, word ptr [bp-6]
        mov     ax, word ptr es:[bx+18h]
        mov     dx, word ptr es:[bx+1ah]
        mov     word ptr [C2_W_FE_SCRATCH_MAX_LO], ax
        mov     word ptr [C2_W_FE_SCRATCH_MAX_HI], dx
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_OFF], C2_W_0CCC8
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_SEG], C1_SEG
        jmp     br_4AD86
br_4AD70:
        mov     word ptr [C2_W_FE_SCRATCH_MAX_LO], ax
        mov     word ptr [C2_W_FE_SCRATCH_MAX_HI], dx
        mov     word ptr [C2_W_FE_SCRATCH_MIN_LO], ax
        mov     word ptr [C2_W_FE_SCRATCH_MIN_HI], dx
        sub     ax, ax
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_SEG], ax
        mov     word ptr [C2_W_FE_SCRATCH_NOTIFY_OFF], ax
br_4AD86:
        mov     cx, word ptr [bp-4]
br_4AD89:
        push    word ptr [bp-2]
        push    cx
        push    ds
        push    FE_RAM_DESC
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        pop     si
        pop     di
        leave
        retf
        db      00h
L_4AD9E:
        enter   14h, 0
        push    di
        push    si
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     bx, ax
        mov     es, dx
        mov     cx, word ptr es:[bx+18h]
        mov     di, word ptr es:[bx+1ah]
        sub     cx, word ptr es:[bx+20h]
        sbb     di, word ptr es:[bx+22h]
        add     cx, word ptr [bp+6]
        adc     di, word ptr [bp+8]
        mov     word ptr [bp-8], cx
        mov     word ptr [bp-6], di
        cmp     di, word ptr es:[bx+16h]
        jg      br_4ADE9
        jl      br_4ADE1
        cmp     cx, word ptr es:[bx+14h]
        jae     br_4ADE9
br_4ADE1:
        mov     word ptr es:[si+14h], cx
        mov     word ptr es:[si+16h], di
br_4ADE9:
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+18h], ax
        mov     word ptr es:[si+1ah], dx
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr es:[si+20h], ax
        mov     word ptr es:[si+22h], dx
        mov     cx, word ptr [C0_W_0D7C2]
        mov     bx, word ptr [C0_W_0D7C4]
        mov     di, cx
        mov     word ptr [bp-0ah], bx
        push    0
        push    dx
        push    ax
        callf   EP_ADDR_CALC_SEGMENT_SEG:EP_ADDR_CALC_SEGMENT_OFF
        add     sp, 6
        mov     es, word ptr [bp-0ah]
        mov     word ptr es:[di+3ah], ax
        mov     word ptr es:[di+3ch], dx
        les     bx, [C2_W_FE_SAVED_DESC_OFF]
        mov     ax, word ptr es:[bx+22h]
        mov     dx, word ptr es:[bx+24h]
        mov     word ptr [bp-14h], ax
        mov     word ptr [bp-12h], dx
        or      dx, ax
        je      br_4AE53
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+22h]
        push    word ptr es:[si+20h]
        callf   [bp-14h]
        add     sp, 4
br_4AE53:
        pop     si
        pop     di
        leave
        retf
        db      00h
L_4AE58:
        enter   0ch, 0
        push    di
        push    si
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        les     bx, [C0_W_0D7C2]
        add     bx, 12h
        mov     si, bx
        mov     word ptr [bp-2], es
        mov     word ptr es:[bx+20h], ax
        mov     word ptr es:[bx+22h], dx
        mov     cx, word ptr [C0_W_0D7C2]
        mov     bx, word ptr [C0_W_0D7C4]
        mov     di, cx
        mov     word ptr [bp-6], bx
        push    0
        push    dx
        push    ax
        callf   EP_ADDR_CALC_SEGMENT_SEG:EP_ADDR_CALC_SEGMENT_OFF
        add     sp, 6
        mov     es, word ptr [bp-6]
        mov     word ptr es:[di+3ah], ax
        mov     word ptr es:[di+3ch], dx
        les     bx, [C2_W_FE_SAVED_DESC_OFF]
        mov     ax, word ptr es:[bx+22h]
        mov     dx, word ptr es:[bx+24h]
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        je      br_4AEC3
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+22h]
        push    word ptr es:[si+20h]
        callf   [bp-0ch]
        add     sp, 4
br_4AEC3:
        pop     si
        pop     di
        leave
        retf
        db      00h
L_4A56A:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        cmp     word ptr [C2_W_018D4], 3
        jb      br_4AEDB
        mov     word ptr [C2_W_018D4], 0
br_4AEDB:
        mov     ax, word ptr [C2_W_018D4]
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        add     ax, ax
        add     ax, cx
        add     ax, 18e2h
        push    ds
        push    ax
        push    C1_SEG
        if      FW_VERSION >= 112
        push    EP_FAR_4A026_OFF
        else
        push    EP_L_4A602_OFF
        endif
        callf   EP_DISP_MESSAGE_WINDOW_SEG:EP_DISP_MESSAGE_WINDOW_OFF
        add     sp, 8
        mov     bx, word ptr [C2_W_018D4]
        inc     word ptr [C2_W_018D4]
        shl     bx, 2
        push    word ptr [bx+C2_TBL_018D8]
        push    word ptr [bx+C2_TBL_018D6]
        nop
        push    cs
        call    EP_FAR_40138_OFF+C1_CSBASE
        add     sp, 4
        nop
        push    cs
        call    EP_FIELD_HANDLER_NOP_OFF+C1_CSBASE
        pop     ds
        retf
        db      00h
sound_pad_play:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        sub     ah, ah
        push    ax
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    EP_FAR_41C08_OFF+C1_CSBASE
        add     sp, 6
        pop     ds
        retf
        nop
L_4AF3A:
        db      "Rom:", 00h, 00h
L_4AF40:
        db      "Snd:", 00h, 00h
L_4AF46:
        db      "RIGHT", 00h
L_4AF4C:
        db      "^LEFT", 00h
far_4A018:
        db      "EDIT", 00h, 00h
L_4A958:
        if      FW_VERSION >= 114
        db      "PLAY X", 00h, 00h
far_4A026:
        db      "Sort by ", 00h, 00h
far_4A030:
        db      41h, 4ch, 4ch, 00h
L_4AF6E:
        db      "ZONE", 00h, 00h
L_4AF74:
        else
        push    ax
        dec     sp
        inc     cx
        pop     cx
        db      20h, 58h, 00h
FAR_4A026                       equ     $+1
        db      00h, "Sort by ", 00h
L_4A76A                         equ     $+1
        add     byte ptr [bx+di+4ch], al
        dec     sp
L_4A76E                         equ     $+1
        db      00h, "ZONE", 00h, 00h
        if      (FW_VERSION >= 110) && (FW_VERSION < 114)
L_4AF74:
        endif
        endif
        db      "BEFOR ST", 00h, 00h
far_4AF7E:
        db      "BEFOR TO", 00h, 00h
far_4AF88:
        db      "AFTR END", 00h, 00h
L_4AF92:
        push    ds
        push    C2_W_0190C
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        cmp     word ptr [C2_W_START_FINE_CURSOR], 0
        jl      L_4A64E
        cmp     word ptr [C2_W_START_FINE_CURSOR], 3
        jb      br_4AFB2
L_4A64E:
        mov     word ptr [C2_W_START_FINE_CURSOR], 0
br_4AFB2:
        les     bx, [C0_W_0D7C2]
        push    word ptr es:[bx+SND_START+2]
        push    word ptr es:[bx+SND_START]
        push    es
        push    bx
        nop
        push    cs
        call    far_4B16C
        add     sp, 8
        imul    bx, word ptr [C2_W_START_FINE_CURSOR], 2ah
        callf   [bx+C2_TBL_019A6]
        retf
L_4AFD2:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        cmp     byte ptr [C1_B_0D7D9], 1
        jbe     br_4AFE3
        shr     byte ptr [C1_B_0D7D9], 1
br_4AFE3:
        les     bx, [C0_W_0D7C2]
        push    word ptr es:[bx+SND_START+2]
        push    word ptr es:[bx+SND_START]
        push    es
        push    bx
        nop
        push    cs
        call    far_4B16C
        add     sp, 8
        pop     ds
        retf
        db      00h
far_4AFFC:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        cmp     byte ptr [C1_B_0D7D9], 40h
        jae     br_4B00D
        shl     byte ptr [C1_B_0D7D9], 1
br_4B00D:
        les     bx, [C0_W_0D7C2]
        push    word ptr es:[bx+SND_START+2]
        push    word ptr es:[bx+SND_START]
        push    es
        push    bx
        nop
        push    cs
        call    far_4B16C
        add     sp, 8
        pop     ds
        retf
        db      00h
start_fine_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    EP_VOICES_RELEASE_ALL_OFF+C1_CSBASE
        nop
        push    cs
        call    trim_screen_draw
        pop     ds
        retf
start_fine_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    EP_VOICES_RELEASE_ALL_OFF+C1_CSBASE
        pop     ds
        retf
        db      00h
start_fine_paint:
        enter   8, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    C1_SEG
        push    C2_W_0D20A
        nop
        push    cs
        call    EP_SMEM_PROC_WRAPPER_OFF+C1_CSBASE
        add     sp, 4
        push    ds
        push    C2_W_01944
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+16h]
        push    word ptr es:[si+14h]
        push    0ch
        push    0b5h
        mov     di, es
        nop
        push    cs
        call    far_47FA4
        add     sp, 8
        mov     es, di
        mov     ax, word ptr es:[si+18h]
        mov     dx, word ptr es:[si+1ah]
        sub     ax, word ptr es:[si+14h]
        sbb     dx, word ptr es:[si+16h]
        push    dx
        push    ax
        push    15h
        push    0b5h
        nop
        push    cs
        call    far_47FA4
        add     sp, 8
        cmp     byte ptr [C1_B_0D7D8], 0
        je      br_4B0C6
        mov     ax, C2_W_0D216
        mov     dx, C1_SEG
        jmp     br_4B0CC
        db      90h
br_4B0C6:
        mov     ax, C2_W_0D21C
        mov     dx, C1_SEG
br_4B0CC:
        push    dx
        push    ax
        push    1fh
        push    0cdh
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        mov     al, byte ptr [C0_B_0D7D6]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C2_TBL_018FA]
        push    word ptr [bx+C2_TBL_018F8]
        push    28h
        push    0b5h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        nop
        push    cs
        call    field_engine_redraw
        push    0fh
        push    16h
        nop
        push    cs
        call    far_4B2F8
        add     sp, 4
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h
L_4B110:
        mov     word ptr [C2_W_START_FINE_CURSOR], 0
        push    ds
        push    C2_W_01998
        nop
        push    cs
        call    far_4A1F0
        add     sp, 4
        retf
        db      00h
L_4B124:
        les     bx, [C0_W_0D7C2]
        push    word ptr es:[bx+SND_START+2]
        push    word ptr es:[bx+SND_START]
        push    es
        push    bx
        nop
        push    cs
        call    far_4B16C
        add     sp, 8
        retf
        db      00h
L_4B13C:
        mov     word ptr [C2_W_START_FINE_CURSOR], 1
        push    ds
        push    C1_B_0D7D8
        push    ds
        push    C2_W_019C2
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_4B154:
        mov     word ptr [C2_W_START_FINE_CURSOR], 2
        push    ds
        push    C0_B_0D7D6
        push    ds
        push    C2_W_019EC
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
far_4B16C:
        enter   1ch, 0
        push    di
        push    si
        mov     si, word ptr [bp+6]
        mov     word ptr [bp-0ah], 0
        mov     word ptr [bp-8], 7f00h
        mov     word ptr [bp-2], 800h
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[si+0ah]
        mov     dx, word ptr es:[si+0ch]
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-4], dx
        cmp     byte ptr es:[si+25h], 0
        je      br_4B1BA
        cmp     byte ptr [C1_B_0D7D7], 0
        je      br_4B1BA
        push    0
        push    2
        push    word ptr es:[si+10h]
        push    word ptr es:[si+0eh]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        add     word ptr [bp-6], ax
        adc     word ptr [bp-4], dx
br_4B1BA:
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[si+2eh]
        mov     dx, word ptr es:[si+30h]
        add     ax, word ptr [bp-6]
        adc     dx, word ptr [bp-4]
        mov     word ptr [bp-12h], ax
        mov     word ptr [bp-10h], dx
        mov     ax, word ptr [bp-6]
        mov     dx, word ptr [bp-4]
        add     word ptr [bp+0ah], ax
        adc     word ptr [bp+0ch], dx
        mov     al, 37h
        mul     byte ptr [C1_B_0D7D9]
        cwd
        mov     cx, word ptr [bp+0ah]
        mov     bx, word ptr [bp+0ch]
        sub     cx, ax
        sbb     bx, dx
        mov     word ptr [bp-0eh], cx
        mov     word ptr [bp-0ch], bx
        mov     word ptr [bp-0ah], cx
        mov     word ptr [bp-8], bx
        mov     word ptr [bp-16h], 800h
        mov     word ptr [bp-18h], 0
loop_4B204:
        xor     si, si
        mov     word ptr [bp-2], si
        mov     di, si
        cmp     byte ptr [C1_B_0D7D9], 0
        jne     br_4B215
        jmp     br_4B29D
br_4B215:
        mov     word ptr [bp-14h], si
        mov     di, word ptr [bp-16h]
loop_4B21B:
        cmp     di, 800h
        jne     br_4B242
        push    1000h
        push    di
        push    7f00h
        push    0
        push    word ptr [bp-0ch]
        push    word ptr [bp-0eh]
        nop
        push    cs
        call    EP_SMEM_BLOCK_COPY_OFF+C1_CSBASE
        add     sp, 0ch
        add     byte ptr [bp-0dh], 8
        adc     word ptr [bp-0ch], 0
        xor     di, di
br_4B242:
        mov     ax, word ptr [bp-0ah]
        mov     dx, word ptr [bp-8]
        cmp     word ptr [bp-4], dx
        jg      br_4B272
        jl      br_4B254
        cmp     word ptr [bp-6], ax
        ja      br_4B272
br_4B254:
        cmp     word ptr [bp-10h], dx
        jl      br_4B272
        jg      br_4B260
        cmp     word ptr [bp-12h], ax
        jbe     br_4B272
br_4B260:
        mov     bx, di
        add     bx, di
        xor     ax, ax
        mov     dx, 7f00h
        add     bx, ax
        mov     es, dx
        mov     cx, word ptr es:[bx]
        jmp     br_4B274
br_4B272:
        xor     cx, cx
br_4B274:
        inc     di
        add     word ptr [bp-0ah], 1
        adc     word ptr [bp-8], 0
        cmp     word ptr [bp-14h], cx
        jge     br_4B285
        mov     word ptr [bp-14h], cx
br_4B285:
        cmp     word ptr [bp-2], cx
        jle     br_4B28D
        mov     word ptr [bp-2], cx
br_4B28D:
        mov     al, byte ptr [C1_B_0D7D9]
        sub     ah, ah
        inc     si
        cmp     ax, si
        jg      loop_4B21B
        mov     word ptr [bp-16h], di
        mov     di, word ptr [bp-14h]
br_4B29D:
        cmp     word ptr [bp-2], 8000h
        jne     br_4B2AA
        mov     si, 7fffh
        jmp     br_4B2AF
        db      90h
br_4B2AA:
        mov     si, word ptr [bp-2]
        neg     si
br_4B2AF:
        push    97bh
        push    di
        callf   EP_DIV_SEG:EP_DIV_OFF
        add     sp, 4
        mov     di, ax
        cmp     dx, 4bdh
        jle     br_4B2C4
        inc     di
br_4B2C4:
        push    97bh
        push    si
        callf   EP_DIV_SEG:EP_DIV_OFF
        add     sp, 4
        mov     si, ax
        cmp     dx, 4bdh
        jle     br_4B2D9
        inc     si
br_4B2D9:
        mov     bx, word ptr [bp-18h]
        mov     ax, si
        mov     byte ptr [bx+C2_TBL_08C48], al
        mov     ax, di
        mov     byte ptr [bx+C2_TBL_08CB6], al
        inc     word ptr [bp-18h]
        cmp     word ptr [bp-18h], 6eh
        jge     br_4B2F4
        jmp     loop_4B204
br_4B2F4:
        pop     si
        pop     di
        leave
        retf
far_4B2F8:
        enter   4, 0
        push    di
        push    si
        mov     si, word ptr [bp+6]
        mov     di, word ptr [bp+8]
        mov     ax, 1dh
        push    ax
        push    70h
        push    di
        push    si
        if      FW_VERSION <> 112
        callf   C0_SEG:EP_DRAW_ERASE_RECT_OFF
        else
        callf   C0_SEG:(C0_BASE+L_3780E-C0_SEG*16)
        endif
        add     sp, 8
        push    1dh
        push    70h
        push    di
        push    si
        nop
        push    cs
        call    EP_DRAW_SHADOW_BOX_OFF+C1_CSBASE
        add     sp, 8
        push    ds
        push    C2_W_07A0A
        lea     ax, [di-3]
        push    ax
        lea     ax, [si+36h]
        push    ax
        nop
        push    cs
        call    EP_DRAW_BITMAP_PTR_OFF+C1_CSBASE
        add     sp, 8
        mov     word ptr [bp-2], 0
        mov     si, word ptr [bp-2]
loop_4B33E:
        mov     al, byte ptr [si+C2_TBL_08C48]
        cbw
        mov     cx, ax
        mov     al, byte ptr [si+C2_TBL_08CB6]
        cbw
        mov     dx, ax
        add     ax, cx
        push    ax
        mov     ax, di
        sub     ax, dx
        add     ax, 0eh
        push    ax
        mov     ax, word ptr [bp+6]
        add     ax, si
        inc     ax
        push    ax
        callf   EP_DRAW_VLINE_SEG:EP_DRAW_VLINE_OFF
        add     sp, 6
        inc     si
        cmp     si, 6eh
        jl      loop_4B33E
        push    3
        nop
        push    cs
        call    EP_DISP_SELECT_PLANE_OFF+C1_CSBASE
        add     sp, 2
        push    1bh
        lea     ax, [di+1]
        push    ax
        mov     ax, word ptr [bp+6]
        add     ax, 38h
        push    ax
        callf   EP_DRAW_VLINE_SEG:EP_DRAW_VLINE_OFF
        add     sp, 6
        push    1
        nop
        push    cs
        call    EP_DISP_SELECT_PLANE_OFF+C1_CSBASE
        add     sp, 2
        pop     si
        pop     di
        leave
        retf
        nop
        if      FW_VERSION >= 112
L_4B39A:
        push    bx
        je      br_4B3FE
        jb      br_4B413
        db      " fine", 00h, 00h
        else
        db      "Start fine", 00h, 00h
        endif
L_4B3A6:
        db      "^FIX", 00h, 00h
L_4B3AC:
        db      "VARI", 00h, 00h
L_4B3B2:
        push    ds
        push    C2_W_01A16
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        cmp     word ptr [C2_W_END_FINE_CURSOR], 0
        jl      br_4B3CC
        cmp     word ptr [C2_W_END_FINE_CURSOR], 3
        jb      br_4B3D2
br_4B3CC:
        mov     word ptr [C2_W_END_FINE_CURSOR], 0
br_4B3D2:
        les     bx, [C0_W_0D7C2]
        push    word ptr es:[bx+SND_END+2]
        push    word ptr es:[bx+SND_END]
        push    es
        push    bx
        nop
        push    cs
        call    far_4B16C
        add     sp, 8
        imul    bx, word ptr [C2_W_END_FINE_CURSOR], 2ah
        callf   [bx+C2_TBL_01AAE]
        retf
far_4B3F2:
        push    ds
        mov     cx, DS_SEG
        db      8eh, 0d9h, 80h, 3eh, 0d9h, 0d7h, 01h, 76h
br_4B3FE:
        add     al, 0d0h
        db      2eh
        db      0d9h
        xlat
        les     bx, [C0_W_0D7C2]
        push    word ptr es:[bx+SND_END+2]
        push    word ptr es:[bx+SND_END]
        push    es
        push    bx
        nop
        push    cs
br_4B413:
        call    far_4B16C
        add     sp, 8
        pop     ds
        retf
        db      00h
L_4AABE:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        cmp     byte ptr [C1_B_0D7D9], 40h
        jae     br_4B42D
        shl     byte ptr [C1_B_0D7D9], 1
br_4B42D:
        les     bx, [C0_W_0D7C2]
        push    word ptr es:[bx+SND_END+2]
        push    word ptr es:[bx+SND_END]
        push    es
        push    bx
        nop
        push    cs
        call    far_4B16C
        add     sp, 8
        pop     ds
        retf
        db      00h
end_fine_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    EP_VOICES_RELEASE_ALL_OFF+C1_CSBASE
        nop
        push    cs
        call    trim_screen_draw
        pop     ds
        retf
end_fine_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    EP_VOICES_RELEASE_ALL_OFF+C1_CSBASE
        pop     ds
        retf
        db      00h
end_fine_paint:
        enter   8, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    C1_SEG
        push    (C2_BASE+L_4B58C-C1_SEG*16)
        nop
        push    cs
        call    EP_SMEM_PROC_WRAPPER_OFF+C1_CSBASE
        add     sp, 4
        push    ds
        push    C2_W_01A4E
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+1ah]
        push    word ptr es:[si+18h]
        push    0ch
        push    0b5h
        mov     di, es
        nop
        push    cs
        call    far_47FA4
        add     sp, 8
        mov     es, di
        mov     ax, word ptr es:[si+18h]
        mov     dx, word ptr es:[si+1ah]
        sub     ax, word ptr es:[si+14h]
        sbb     dx, word ptr es:[si+16h]
        push    dx
        push    ax
        push    15h
        push    0b5h
        nop
        push    cs
        call    far_47FA4
        add     sp, 8
        cmp     byte ptr [C1_B_0D7D8], 0
        je      br_4B4E6
        mov     ax, C2_W_0D216
        mov     dx, C1_SEG
        jmp     br_4B4EC
        db      90h
br_4B4E6:
        mov     ax, C2_W_0D21C
        mov     dx, C1_SEG
br_4B4EC:
        push    dx
        push    ax
        push    1fh
        push    0cdh
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        mov     al, byte ptr [C0_B_0D7D6]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C2_TBL_018FA]
        push    word ptr [bx+C2_TBL_018F8]
        push    28h
        push    0b5h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        nop
        push    cs
        call    field_engine_redraw
        push    0fh
        push    16h
        nop
        push    cs
        call    far_4B2F8
        add     sp, 4
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h
L_4B530:
        mov     word ptr [C2_W_END_FINE_CURSOR], 0
        push    ds
        push    C2_W_01AA0
        nop
        push    cs
        call    far_4A5E8
        add     sp, 4
        retf
        db      00h
L_4B544:
        les     bx, [C0_W_0D7C2]
        push    word ptr es:[bx+SND_END+2]
        push    word ptr es:[bx+SND_END]
        push    es
        push    bx
        nop
        push    cs
        call    far_4B16C
        add     sp, 8
        retf
        db      00h
L_4B55C:
        mov     word ptr [C2_W_END_FINE_CURSOR], 1
        push    ds
        push    C1_B_0D7D8
        push    ds
        push    C2_W_01ACA
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_4B574:
        mov     word ptr [C2_W_END_FINE_CURSOR], 2
        push    ds
        push    C0_B_0D7D6
        push    ds
        push    C2_W_01AF4
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      90h
L_4B58C:
        db      "End fine"
        db      00h, 00h
L_4AF96:
        enter   4, 0
        les     bx, [C0_W_0D7C2]
        mov     ax, word ptr es:[bx+SND_END]
        mov     dx, word ptr es:[bx+SND_END+2]
        sub     ax, word ptr es:[bx+SND_LOOP]
        sbb     dx, word ptr es:[bx+SND_LOOP+2]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    ds
        push    C2_W_01B1E
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        cmp     word ptr [C2_W_LOOP_FINE_CURSOR], 0
        jl      br_4B5CE
        cmp     word ptr [C2_W_LOOP_FINE_CURSOR], 4
        jb      br_4B5D4
br_4B5CE:
        mov     word ptr [C2_W_LOOP_FINE_CURSOR], 0
br_4B5D4:
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    far_4B16C
        add     sp, 8
        imul    bx, word ptr [C2_W_LOOP_FINE_CURSOR], 2ah
        callf   [bx+C2_TBL_01BB6]
        leave
        retf
        db      00h
far_4B5F6:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        les     bx, [C0_W_0D7C2]
        mov     ax, word ptr es:[bx+SND_END]
        mov     dx, word ptr es:[bx+SND_END+2]
        sub     ax, word ptr es:[bx+SND_LOOP]
        sbb     dx, word ptr es:[bx+SND_LOOP+2]
        cmp     byte ptr [C1_B_0D7D9], 1
        jbe     br_4B61B
        shr     byte ptr [C1_B_0D7D9], 1
br_4B61B:
        push    dx
        push    ax
        push    es
        push    bx
        nop
        push    cs
        call    far_4B16C
        add     sp, 8
        pop     ds
        retf
        db      00h
far_4B62A:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        les     bx, [C0_W_0D7C2]
        mov     ax, word ptr es:[bx+SND_END]
        mov     dx, word ptr es:[bx+SND_END+2]
        sub     ax, word ptr es:[bx+SND_LOOP]
        sbb     dx, word ptr es:[bx+SND_LOOP+2]
        cmp     byte ptr [C1_B_0D7D9], 40h
        jae     br_4B64F
        shl     byte ptr [C1_B_0D7D9], 1
br_4B64F:
        push    dx
        push    ax
        push    es
        push    bx
        nop
        push    cs
        call    far_4B16C
        add     sp, 8
        pop     ds
        retf
        db      00h
loop_fine_close:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    EP_VOICES_RELEASE_ALL_OFF+C1_CSBASE
        nop
        push    cs
        call    loop_screen_draw
        pop     ds
        retf
loop_fine_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    EP_VOICES_RELEASE_ALL_OFF+C1_CSBASE
        pop     ds
        retf
        db      00h
loop_fine_paint:
        enter   0ch, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        mov     si, ax
        mov     word ptr [bp-6], dx
        mov     bx, ax
        mov     es, dx
        mov     cx, word ptr es:[bx+18h]
        mov     di, word ptr es:[bx+1ah]
        sub     cx, word ptr es:[bx+20h]
        sbb     di, word ptr es:[bx+22h]
        mov     word ptr [bp-4], cx
        mov     word ptr [bp-2], di
        push    C1_SEG
        push    (C2_BASE+L_4B7EE-C1_SEG*16)
        nop
        push    cs
        call    EP_SMEM_PROC_WRAPPER_OFF+C1_CSBASE
        add     sp, 4
        push    ds
        push    C2_W_01B56
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    0ch
        push    0b5h
        nop
        push    cs
        call    far_47FA4
        add     sp, 8
        mov     es, word ptr [bp-6]
        push    word ptr es:[si+22h]
        push    word ptr es:[si+20h]
        push    15h
        push    0b5h
        nop
        push    cs
        call    far_47FA4
        add     sp, 8
        cmp     byte ptr [C1_B_0D7DB], 0
        je      br_4B708
        mov     ax, C2_W_0D216
        mov     dx, C1_SEG
        jmp     br_4B70E
        db      90h
br_4B708:
        mov     ax, C2_W_0D21C
        mov     dx, C1_SEG
br_4B70E:
        push    dx
        push    ax
        push    1fh
        push    0cdh
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        mov     al, byte ptr [C0_B_0D7D6]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C2_TBL_018FA]
        push    word ptr [bx+C2_TBL_018F8]
        push    28h
        push    0b5h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        nop
        push    cs
        call    field_engine_redraw
        push    0fh
        push    16h
        nop
        push    cs
        call    far_4B2F8
        add     sp, 4
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h
L_4B752:
        mov     word ptr [C2_W_LOOP_FINE_CURSOR], 0
        push    ds
        push    C2_W_01BA8
        nop
        push    cs
        call    far_4A9DE
        add     sp, 4
        retf
        db      00h
far_4B766:
        les     bx, [C0_W_0D7C2]
        mov     ax, word ptr es:[bx+SND_END]
        mov     dx, word ptr es:[bx+SND_END+2]
        sub     ax, word ptr es:[bx+SND_LOOP]
        sbb     dx, word ptr es:[bx+SND_LOOP+2]
        push    dx
        push    ax
        push    es
        push    bx
        nop
        push    cs
        call    far_4B16C
        add     sp, 8
        retf
        db      00h
L_4B788:
        mov     word ptr [C2_W_LOOP_FINE_CURSOR], 1
        push    ds
        push    C2_W_01BD2
        nop
        push    cs
        call    far_4AC96
        add     sp, 4
        retf
        db      00h
L_4B79C:
        les     bx, [C0_W_0D7C2]
        mov     ax, word ptr es:[bx+SND_END]
        mov     dx, word ptr es:[bx+SND_END+2]
        sub     ax, word ptr es:[bx+SND_LOOP]
        sbb     dx, word ptr es:[bx+SND_LOOP+2]
        push    dx
        push    ax
        push    es
        push    bx
        nop
        push    cs
        call    far_4B16C
        add     sp, 8
        retf
        db      00h
L_4B7BE:
        mov     word ptr [C2_W_LOOP_FINE_CURSOR], 2
        push    ds
        push    C1_B_0D7DB
        push    ds
        push    C2_W_01BFC
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_4B7D6:
        mov     word ptr [C2_W_LOOP_FINE_CURSOR], 3
        push    ds
        push    C0_B_0D7D6
        push    ds
        push    C2_W_01C26
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        nop
L_4B7EE:
        db      "Loop To fine", 00h, 00h
        if      FW_VERSION >= 110
far_4A8C2:
        endif
L_4B7FC:
        if      FW_VERSION < 110
far_4A8C2:
        endif
        push    ds
        push    C2_W_01C50
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        cmp     word ptr [C2_W_LOOP_END_FINE_CURSOR], 0
        jl      br_4B816
        cmp     word ptr [C2_W_LOOP_END_FINE_CURSOR], 4
        jb      br_4B81C
br_4B816:
        mov     word ptr [C2_W_LOOP_END_FINE_CURSOR], 0
br_4B81C:
        les     bx, [C0_W_0D7C2]
        push    word ptr es:[bx+SND_END+2]
        push    word ptr es:[bx+SND_END]
        push    es
        push    bx
        nop
        push    cs
        call    far_4B16C
        add     sp, 8
        imul    bx, word ptr [C2_W_LOOP_END_FINE_CURSOR], 2ah
        callf   [bx+C2_TBL_01CE8]
        retf
far_4B83C:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        cmp     byte ptr [C1_B_0D7D9], 1
        jbe     br_4B84D
        shr     byte ptr [C1_B_0D7D9], 1
br_4B84D:
        les     bx, [C0_W_0D7C2]
        push    word ptr es:[bx+SND_END+2]
        push    word ptr es:[bx+SND_END]
        push    es
        push    bx
        nop
        push    cs
        call    far_4B16C
        add     sp, 8
        pop     ds
        retf
        db      00h
far_4B866:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        cmp     byte ptr [C1_B_0D7D9], 40h
        jae     br_4B877
        shl     byte ptr [C1_B_0D7D9], 1
br_4B877:
        les     bx, [C0_W_0D7C2]
        push    word ptr es:[bx+SND_END+2]
        push    word ptr es:[bx+SND_END]
        push    es
        push    bx
        nop
        push    cs
        call    far_4B16C
        add     sp, 8
        pop     ds
        retf
        db      00h
loop_end_fine_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    EP_VOICES_RELEASE_ALL_OFF+C1_CSBASE
        nop
        push    cs
        call    loop_screen_draw
        pop     ds
        retf
loop_end_fine_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    EP_VOICES_RELEASE_ALL_OFF+C1_CSBASE
        pop     ds
        retf
        db      00h
loop_end_fine_paint:
        enter   8, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    C1_SEG
        push    (C2_BASE+L_4B9F8-C1_SEG*16)
        nop
        push    cs
        call    EP_SMEM_PROC_WRAPPER_OFF+C1_CSBASE
        add     sp, 4
        push    ds
        push    C2_W_01C88
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+1ah]
        push    word ptr es:[si+18h]
        push    0ch
        push    0b5h
        mov     di, es
        nop
        push    cs
        call    far_47FA4
        add     sp, 8
        mov     es, di
        push    word ptr es:[si+22h]
        push    word ptr es:[si+20h]
        push    15h
        push    0b5h
        nop
        push    cs
        call    far_47FA4
        add     sp, 8
        cmp     byte ptr [C1_B_0D7DB], 0
        je      br_4B926
        mov     ax, C2_W_0D216
        mov     dx, C1_SEG
        jmp     br_4B92C
        db      90h
br_4B926:
        mov     ax, C2_W_0D21C
        mov     dx, C1_SEG
br_4B92C:
        push    dx
        push    ax
        push    1fh
        push    0cdh
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        mov     al, byte ptr [C0_B_0D7D6]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C2_TBL_018FA]
        push    word ptr [bx+C2_TBL_018F8]
        push    28h
        push    0b5h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        nop
        push    cs
        call    field_engine_redraw
        push    0fh
        push    16h
        nop
        push    cs
        call    far_4B2F8
        add     sp, 4
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h
L_4B970:
        mov     word ptr [C2_W_LOOP_END_FINE_CURSOR], 0
        push    ds
        push    C2_W_01CDA
        nop
        push    cs
        call    far_4A5E8
        add     sp, 4
        retf
        db      00h
far_4B984:
        les     bx, [C0_W_0D7C2]
        push    word ptr es:[bx+SND_END+2]
        push    word ptr es:[bx+SND_END]
        push    es
        push    bx
        nop
        push    cs
        call    far_4B16C
        add     sp, 8
        retf
        db      00h
L_4B99C:
        mov     word ptr [C2_W_LOOP_END_FINE_CURSOR], 1
        push    ds
        push    C2_W_01D04
        nop
        push    cs
        call    far_4AC96
        add     sp, 4
        retf
        db      00h
L_4B9B0:
        les     bx, [C0_W_0D7C2]
        push    word ptr es:[bx+SND_END+2]
        push    word ptr es:[bx+SND_END]
        push    es
        push    bx
        nop
        push    cs
        call    far_4B16C
        add     sp, 8
        retf
        db      00h
L_4B9C8:
        mov     word ptr [C2_W_LOOP_END_FINE_CURSOR], 2
        push    ds
        push    C1_B_0D7DB
        push    ds
        push    C2_W_01D2E
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_4B9E0:
        mov     word ptr [C2_W_LOOP_END_FINE_CURSOR], 3
        push    ds
        push    C0_B_0D7D6
        push    ds
        push    C2_W_01D58
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      90h
L_4B9F8:
        db      "Loop End fine"
        db      00h
loop_screen_draw:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    1d82h
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        mov     ax, C1_TBL_SOUNDS_END
        mov     cx, ds
        cmp     ax, word ptr [C0_W_0D7C2]
        jne     br_4BA29
        cmp     cx, word ptr [C0_W_0D7C4]
        je      br_4BA52
br_4BA29:
        push    cx
        push    1daah
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        cmp     word ptr [C2_W_LOOP_CURSOR], 0
        jl      L_4B443
        cmp     word ptr [C2_W_LOOP_CURSOR], 6
        jb      br_4BA49
L_4B443:
        mov     word ptr [C2_W_LOOP_CURSOR], 0
br_4BA49:
        imul    bx, word ptr [C2_W_LOOP_CURSOR], 2ah
        callf   [bx+C2_TBL_01E24]
br_4BA52:
        pop     ds
        retf
far_4BA54:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     ax, C1_TBL_SOUNDS_END
        cmp     ax, word ptr [C0_W_0D7C2]
        jne     br_4BA69
        cmp     cx, word ptr [C0_W_0D7C4]
        je      br_4BA97
br_4BA69:
        nop
        push    cs
        call    loop_screen_refresh
        les     bx, [C0_W_0D7C2]
        push    word ptr es:[bx+SND_END+2]
        mov     ax, word ptr es:[bx+SND_END]
        push    ax
        mov     dx, word ptr es:[bx+SND_END+2]
        sub     ax, word ptr es:[bx+SND_LOOP]
        sbb     dx, word ptr es:[bx+SND_LOOP+2]
        push    dx
        push    ax
        push    C1_SEG
        push    EP_LOOP_SCREEN_DRAW_OFF
        nop
        push    cs
        call    far_4CC94
        add     sp, 0ch
br_4BA97:
        pop     ds
        retf
        db      00h
loop_screen_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    EP_VOICES_RELEASE_ALL_OFF+C1_CSBASE
        pop     ds
        retf
        db      00h
far_4BAA8:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    loop_screen_refresh
        push    EP_LOOP_SCREEN_DRAW_SEG
        push    EP_LOOP_SCREEN_DRAW_OFF
        callf   EP_FAR_55112_SEG:EP_FAR_55112_OFF
        add     sp, 4
        pop     ds
        retf
        db      00h
loop_screen_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        imul    bx, word ptr [C2_W_LOOP_CURSOR], 2ah
        mov     ax, word ptr [bx+C2_TBL_01E3E]
        or      ax, word ptr [bx+C2_TBL_01E3C]
        je      br_4BAE7
        nop
        push    cs
        call    loop_screen_refresh
        imul    bx, word ptr [C2_W_LOOP_CURSOR], 2ah
        callf   [bx+C2_TBL_01E3C]
br_4BAE7:
        pop     ds
        retf
        db      00h
loop_screen_key_33:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   EP_WAVE_OVERVIEW_BUILD_STEP_SEG:EP_WAVE_OVERVIEW_BUILD_STEP_OFF
        pop     ds
        retf
        db      00h
far_4BAF8:
        enter   10h, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        mov     si, ax
        mov     word ptr [bp-6], dx
        mov     bx, ax
        mov     es, dx
        mov     cx, word ptr es:[bx+18h]
        mov     di, word ptr es:[bx+1ah]
        sub     cx, word ptr es:[bx+20h]
        sbb     di, word ptr es:[bx+22h]
        mov     word ptr [bp-0ch], cx
        mov     word ptr [bp-0ah], di
        push    ds
        push    C2_W_01DD2
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        push    91h
        nop
        push    cs
        call    EP_L_3EA6A_OFF+C1_CSBASE
        add     sp, 2
        mov     al, byte ptr [C0_B_0D7D6]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C2_TBL_018FA]
        push    word ptr [bx+C2_TBL_018F8]
        push    1
        push    0c7h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        les     bx, [C0_W_0D7C2]
        test    byte ptr es:[bx+SND_FLAGS_HI], 1
        je      br_4BB76
        mov     ax, STR_C1_ROM
        mov     dx, C1_SEG
        jmp     br_4BB7C
        db      90h
br_4BB76:
        mov     ax, C2_W_0CD82
        mov     dx, C1_SEG
br_4BB7C:
        push    dx
        push    ax
        push    2
        push    2
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        push    2
        push    1ah
        nop
        push    cs
        call    far_47D5E
        add     sp, 8
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        push    0ch
        push    1ah
        nop
        push    cs
        call    far_47FA4
        add     sp, 8
        cmp     byte ptr [C1_B_0D7DA], 0
        je      br_4BBC0
        mov     ax, C2_W_0DBCC
        mov     dx, C1_SEG
        jmp     br_4BBC6
        db      90h
br_4BBC0:
        mov     ax, C2_W_0DBD4
        mov     dx, C1_SEG
br_4BBC6:
        push    dx
        push    ax
        push    0ch
        push    56h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        cmp     byte ptr [C1_B_0D7DA], 0
        je      br_4BBE8
        mov     es, word ptr [bp-6]
        mov     ax, word ptr es:[si+18h]
        mov     dx, word ptr es:[si+1ah]
        jmp     br_4BBF3
br_4BBE8:
        mov     es, word ptr [bp-6]
        mov     ax, word ptr es:[si+20h]
        mov     dx, word ptr es:[si+22h]
br_4BBF3:
        push    dx
        push    ax
        push    0ch
        push    7ah
        nop
        push    cs
        call    far_47FA4
        add     sp, 8
        mov     es, word ptr [bp-6]
        cmp     byte ptr es:[si+24h], 0
        je      br_4BC14
        mov     ax, C2_W_0DBDC
        mov     dx, C1_SEG
        jmp     br_4BC1A
        db      90h
br_4BC14:
        mov     ax, C2_W_0A5D4
        mov     dx, C1_SEG
br_4BC1A:
        push    dx
        push    ax
        push    0ch
        push    0d4h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        mov     ax, C1_TBL_SOUNDS_END
        mov     cx, ds
        cmp     ax, word ptr [C0_W_0D7C2]
        jne     br_4BC3A
        cmp     cx, word ptr [C0_W_0D7C4]
        je      br_4BC81
br_4BC3A:
        push    EP_FAR_4A018_SEG
        push    EP_FAR_4A018_OFF
        push    1
        push    5
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
        push    C1_SEG
        if      FW_VERSION >= 120
        push    EP_L_4A01E_OFF
        else
        push    EP_L_4A958_OFF
        endif
        push    1
        push    6
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
        nop
        push    cs
        call    field_engine_redraw
        callf   EP_WAVE_OVERVIEW_DRAW_SEG:EP_WAVE_OVERVIEW_DRAW_OFF
        mov     es, word ptr [bp-6]
        push    word ptr es:[si+1ah]
        push    word ptr es:[si+18h]
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        callf   EP_WAVE_REGION_HIGHLIGHT_SEG:EP_WAVE_REGION_HIGHLIGHT_OFF
        add     sp, 8
br_4BC81:
        pop     ds
        pop     si
        pop     di
        leave
        retf
loop_focus_sound:
        mov     word ptr [C2_W_LOOP_CURSOR], 0
        push    ds
        push    C0_W_0D7C2
        push    ds
        push    C2_W_01E16
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
far_4BC9E:
        callf   EP_SOUND_WAVE_OVERVIEW_BUILD_SEG:EP_SOUND_WAVE_OVERVIEW_BUILD_OFF
        nop
        push    cs
        call    far_4D678
        retf
        db      00h
far_4BCAA:
        push    EP_LOOP_SCREEN_DRAW_SEG
        push    EP_LOOP_SCREEN_DRAW_OFF
        nop
        push    cs
        call    far_4C0D8
        add     sp, 4
        retf
        db      00h
loop_focus_play_x:
        mov     word ptr [C2_W_LOOP_CURSOR], 1
        push    ds
        push    C0_B_0D7D6
        push    ds
        push    C2_W_01E40
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
loop_focus_to:
        mov     word ptr [C2_W_LOOP_CURSOR], 2
        push    ds
        push    C2_W_01E6A
        nop
        push    cs
        call    far_4A9DE
        add     sp, 4
        retf
        db      00h
loop_focus_lock:
        mov     word ptr [C2_W_LOOP_CURSOR], 3
        push    ds
        push    C1_B_0D7DA
        push    ds
        push    C2_W_01E94
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
loop_focus_length:
        enter   4, 0
        mov     word ptr [C2_W_LOOP_CURSOR], 4
        push    ds
        push    C2_W_01EBE
        cmp     byte ptr [C1_B_0D7DA], 0
        je      br_4BD1C
        mov     ax, (C2_BASE+far_4A5E8-C1_SEG*16)
        mov     dx, C1_SEG
        jmp     br_4BD22
        db      90h
br_4BD1C:
        mov     ax, (C2_BASE+far_4AC96-C1_SEG*16)
        mov     dx, C1_SEG
br_4BD22:
        mov     word ptr [bp-2], dx
        mov     word ptr [bp-4], ax
        callf   [bp-4]
        leave
        retf
        db      00h
loop_focus_loop_on:
        enter   4, 0
        mov     word ptr [C2_W_LOOP_CURSOR], 5
        les     bx, [C0_W_0D7C2]
        test    byte ptr es:[bx+SND_FLAGS_HI], 1
        je      br_4BD48
        xor     ax, ax
        cwd
        jmp     br_4BD4F
br_4BD48:
        mov     ax, bx
        mov     dx, es
        add     ax, 36h
br_4BD4F:
        push    dx
        push    ax
        push    ds
        push    C2_W_01EE8
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        leave
        retf
        if      FW_VERSION >= 112
L_4BD5C:
        db      20h, 20h, 45h, 6eh, 64h, 3ah, 00h, 00h
L_4BD64:
        db      4ch, 6eh, 67h, 74h, 68h, 3ah, 00h, 00h
L_4BD6C:
        db      5eh, 4fh, 4eh, 00h
        if      FW_VERSION >= 114
far_4BD70:
        else
far_4BD70                       equ     $+00h
        endif
        else
        db      "  End:", 00h, 00h
        db      "Lngth:", 00h, 00h
        db      "^ON", 00h
far_4BD70:
        endif
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    1f12h
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        mov     ax, C1_TBL_SOUNDS_END
        mov     cx, ds
        cmp     ax, word ptr [C0_W_0D7C2]
        jne     br_4BD93
        cmp     cx, word ptr [C0_W_0D7C4]
        je      br_4BDBC
br_4BD93:
        push    cx
        push    1f3ah
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        cmp     word ptr [C2_W_SND_PARAMS_CURSOR], 0
        jl      br_4BDAD
        cmp     word ptr [C2_W_SND_PARAMS_CURSOR], 5
        jb      br_4BDB3
br_4BDAD:
        mov     word ptr [C2_W_SND_PARAMS_CURSOR], 0
br_4BDB3:
        imul    bx, word ptr [C2_W_SND_PARAMS_CURSOR], 2ah
        callf   [bx+C2_TBL_01FD2]
br_4BDBC:
        pop     ds
        retf
snd_params_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    EP_VOICES_RELEASE_ALL_OFF+C1_CSBASE
        pop     ds
        retf
        db      00h
        if      FW_VERSION >= 110
L_4BDCC:
        endif
        push    ds
        mov     cx, DS_SEG
        db      8eh
        db      0d9h
        nop
        push    cs
        call    snd_params_refresh
        push    EP_FAR_4BD70_SEG
        push    EP_FAR_4BD70_OFF
        callf   EP_FAR_55112_SEG:EP_FAR_55112_OFF
        add     sp, 4
        pop     ds
        retf
        db      00h
snd_params_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        imul    bx, word ptr [C2_W_SND_PARAMS_CURSOR], 2ah
        mov     ax, word ptr [bx+C2_TBL_01FEC]
        or      ax, word ptr [bx+C2_TBL_01FEA]
        je      br_4BE0B
        nop
        push    cs
        call    snd_params_refresh
        imul    bx, word ptr [C2_W_SND_PARAMS_CURSOR], 2ah
        callf   [bx+C2_TBL_01FEA]
br_4BE0B:
        pop     ds
        retf
        db      00h
L_4BE0E:
        enter   8, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        mov     di, ax
        mov     word ptr [bp-6], dx
        push    cx
        push    1f58h
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        push    91h
        nop
        push    cs
        call    EP_L_3EA6A_OFF+C1_CSBASE
        add     sp, 2
        mov     al, byte ptr [C0_B_0D7D6]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C2_TBL_018FA]
        push    word ptr [bx+C2_TBL_018F8]
        push    1
        push    0c7h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        les     bx, [C0_W_0D7C2]
        test    byte ptr es:[bx+SND_FLAGS_HI], 1
        je      br_4BE72
        mov     ax, STR_C1_ROM
        mov     dx, C1_SEG
        jmp     br_4BE78
        db      90h
br_4BE72:
        mov     ax, C2_W_0CD82
        mov     dx, C1_SEG
br_4BE78:
        push    dx
        push    ax
        push    2
        push    2
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        push    2
        push    1ah
        nop
        push    cs
        call    far_47D5E
        add     sp, 8
        push    3
        mov     es, word ptr [bp-6]
        mov     al, byte ptr es:[di+11h]
        sub     ah, ah
        push    0
        push    ax
        push    13h
        push    31h
        nop
        push    cs
        call    EP_DRAW_UNSIGNED_VALUE_OFF+C1_CSBASE
        add     sp, 0ah
        push    3
        mov     es, word ptr [bp-6]
        mov     al, byte ptr es:[di+12h]
        cbw
        cwd
        push    dx
        push    ax
        push    23h
        push    2bh
        nop
        push    cs
        call    EP_DRAW_SIGNED_VALUE_OFF+C1_CSBASE
        add     sp, 0ah
        push    2
        mov     es, word ptr [bp-6]
        mov     al, byte ptr es:[di+25h]
        sub     ah, ah
        push    0
        push    ax
        push    11h
        push    0d3h
        nop
        push    cs
        call    EP_DRAW_UNSIGNED_VALUE_OFF+C1_CSBASE
        add     sp, 0ah
        mov     es, word ptr [bp-6]
        cmp     byte ptr es:[di+24h], 0
        jne     br_4BEF5
        jmp     br_4BF98
br_4BEF5:
        push    0
        mov     al, byte ptr es:[di+25h]
        sub     ah, ah
        push    ax
        push    word ptr es:[di+22h]
        push    word ptr es:[di+20h]
        nop
        push    cs
        call    far_486D8
        add     sp, 8
        mov     si, ax
        push    EP_L_4B73E_SEG
        push    EP_L_4B73E_OFF
        push    1ah
        push    85h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        or      si, si
        jle     br_4BF43
        cmp     si, 2710h
        jge     br_4BF43
        push    1
        push    3
        mov     ax, si
        cwd
        push    dx
        push    si
        push    1ah
        push    0d3h
        nop
        push    cs
        call    EP_DRAW_FIXED_DECIMAL_OFF+C1_CSBASE
        add     sp, 0ch
br_4BF43:
        mov     es, word ptr [bp-6]
        mov     al, byte ptr es:[di+12h]
        cbw
        push    ax
        mov     al, byte ptr es:[di+25h]
        sub     ah, ah
        push    ax
        push    word ptr es:[di+22h]
        push    word ptr es:[di+20h]
        nop
        push    cs
        call    far_486D8
        add     sp, 8
        mov     si, ax
        push    EP_L_4B176_SEG
        push    EP_L_4B176_OFF
        push    23h
        push    97h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        or      si, si
        jle     br_4BF98
        cmp     si, 2710h
        jge     br_4BF98
        push    1
        push    3
        mov     ax, si
        cwd
        push    dx
        push    si
        push    23h
        push    0d3h
        nop
        push    cs
        call    EP_DRAW_FIXED_DECIMAL_OFF+C1_CSBASE
        add     sp, 0ch
br_4BF98:
        mov     ax, C1_TBL_SOUNDS_END
        mov     cx, ds
        cmp     ax, word ptr [C0_W_0D7C2]
        jne     br_4BFA9
        cmp     cx, word ptr [C0_W_0D7C4]
        je      br_4BFC0
br_4BFA9:
        push    C1_SEG
        if      FW_VERSION >= 120
        push    EP_L_4A01E_OFF
        elseif  FW_VERSION >= 110
        push    EP_L_4A958_OFF
        else
        push    C2_W_0CD9A
        endif
        push    1
        push    6
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
        nop
        push    cs
        call    field_engine_redraw
br_4BFC0:
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h
snd_params_focus_sound:
        mov     word ptr [C2_W_SND_PARAMS_CURSOR], 0
        push    ds
        push    C0_W_0D7C2
        push    ds
        push    C2_W_01FC4
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_4BFDE:
        callf   EP_SOUND_WAVE_OVERVIEW_BUILD_SEG:EP_SOUND_WAVE_OVERVIEW_BUILD_OFF
        nop
        push    cs
        call    far_4D678
        retf
        db      00h
far_4BFEA:
        push    EP_FAR_4BD70_SEG
        push    EP_FAR_4BD70_OFF
        nop
        push    cs
        call    far_4C0D8
        add     sp, 4
        retf
        db      00h
snd_params_focus_play_x:
        mov     word ptr [C2_W_SND_PARAMS_CURSOR], 1
        push    ds
        push    C0_B_0D7D6
        push    ds
        push    C2_W_01FEE
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
snd_params_focus_level:
        enter   4, 0
        mov     word ptr [C2_W_SND_PARAMS_CURSOR], 2
        les     bx, [C0_W_0D7C2]
        test    byte ptr es:[bx+SND_FLAGS_HI], 1
        je      br_4C02C
        xor     ax, ax
        cwd
        jmp     br_4C033
br_4C02C:
        mov     ax, bx
        mov     dx, es
        add     ax, 23h
br_4C033:
        push    dx
        push    ax
        push    ds
        push    C2_W_02018
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        leave
        retf
snd_params_focus_tune:
        enter   4, 0
        mov     word ptr [C2_W_SND_PARAMS_CURSOR], 3
        les     bx, [C0_W_0D7C2]
        test    byte ptr es:[bx+SND_FLAGS_HI], 1
        je      br_4C05A
        xor     ax, ax
        cwd
        jmp     br_4C061
br_4C05A:
        mov     ax, bx
        mov     dx, es
        add     ax, 24h
br_4C061:
        push    dx
        push    ax
        push    ds
        push    C2_W_02042
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        leave
        retf
snd_params_focus_beat:
        enter   4, 0
        mov     word ptr [C2_W_SND_PARAMS_CURSOR], 4
        les     bx, [C0_W_0D7C2]
        test    byte ptr es:[bx+SND_FLAGS_HI], 1
        je      br_4C088
        xor     ax, ax
        cwd
        jmp     br_4C08F
br_4C088:
        mov     ax, bx
        mov     dx, es
        add     ax, 37h
br_4C08F:
        push    dx
        push    ax
        push    ds
        push    C2_W_0206C
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        leave
        retf
L_4B73E:
        db      "Sample tempo=---.-"
        db      00h, 00h
L_4B176:
        db      "New tempo=--"
        db      2dh, 2eh, 2dh, 00h
far_4C0C0:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    word ptr [C2_W_08D30]
        push    word ptr [C2_W_08D2E]
        nop
        push    cs
        call    far_4C0D8
        add     sp, 4
        pop     ds
        retf
far_4C0D8:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr [C2_W_08D2E], ax
        mov     word ptr [C2_W_08D30], dx
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    EP_SOUND_LIST_CONTAINS_OFF+C1_CSBASE
        mov     sp, bp
        or      ax, ax
        jne     br_4C102
        nop
        push    cs
        call    sound_spec_open
        leave
        retf
br_4C102:
        push    ds
        push    C2_W_02096
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        les     bx, [C0_W_0D7C2]
        test    byte ptr es:[bx+SND_FLAGS_HI], 1
        jne     br_4C11D
        callf   [C2_FP_02128]
br_4C11D:
        leave
        retf
        db      00h
sound_spec_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   [C2_W_08D2E]
        pop     ds
        retf
L_4B7CE:
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        push    dx
        push    ax
        push    ds
        push    C2_W_0211A
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
far_4C146:
        push    bp
        mov     bp, sp
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    0
        push    0
        nop
        push    cs
        call    EP_FAR_3FE9E_OFF+C1_CSBASE
        cmp     ax, 1
        sbb     ax, ax
        neg     ax
        leave
        retf
        db      00h
L_4C162:
        push    bx
        outsw
        db      75h, 6eh
        db      64h
L_4C168                         equ     $+1
        db      00h
L_4C168_120:
        db      "MONO", 00h, 00h
L_4C16E:
        db      "To edit, copy to RAM fi"
        db      "rst."
L_4C18A                         equ     $+1
        db      00h, "Sound name:", 00h
L_4C196:
        if      FW_VERSION >= 112
        db      "kbytes", 00h
L_4C19E                         equ     $+1
        if      FW_VERSION < 114
L_4B99E                         equ     $+1
        endif
        db      00h, "Mbytes", 00h
        db      00h
        else
        db      "kbytes", 00h, 00h
L_4B99E:
        db      "Mbytes", 00h, 00h
        endif
L_4B848:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    2144h
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        callf   [C2_FP_021C4]
        pop     ds
        retf
delete_sound_cancel:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_4C0C0
        pop     ds
        retf
        db      00h
delete_sound_do_it:
        enter   4, 0
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        les     bx, [C0_W_0D7C2]
        mov     si, bx
        mov     word ptr [bp-2], es
        push    word ptr es:[bx+SND_FP_04+2]
        push    word ptr es:[bx+SND_FP_04]
        nop
        push    cs
        call    EP_SOUND_LIST_CONTAINS_OFF+C1_CSBASE
        add     sp, 4
        or      ax, ax
        je      br_4C202
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+4]
        mov     dx, word ptr es:[si+6]
        jmp     br_4C227
        db      90h
br_4C202:
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+2]
        push    word ptr es:[si]
        nop
        push    cs
        call    EP_SOUND_LIST_CONTAINS_OFF+C1_CSBASE
        add     sp, 4
        or      ax, ax
        je      br_4C224
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        jmp     br_4C227
br_4C224:
        xor     ax, ax
        cwd
br_4C227:
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    EP_SOUND_LIST_UNLINK_OFF+C1_CSBASE
        add     sp, 4
        mov     ax, word ptr [bp-2]
        or      ax, si
        jne     br_4C24F
        mov     ax, word ptr [C0_W_098DC]
        mov     dx, word ptr [C0_W_098DE]
        mov     si, ax
        mov     word ptr [bp-2], dx
br_4C24F:
        mov     ax, word ptr [bp-2]
        mov     word ptr [C0_W_0D7C2], si
        mov     word ptr [C0_W_0D7C4], ax
        callf   EP_SOUND_WAVE_OVERVIEW_BUILD_SEG:EP_SOUND_WAVE_OVERVIEW_BUILD_OFF
        nop
        push    cs
        call    delete_sound_cancel
        pop     ds
        pop     si
        leave
        retf
        db      00h
delete_sound_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    C1_SEG
        if      FW_VERSION >= 112
        push    EP_L_4C2E2_OFF
        else
        push    C2_W_0E124
        endif
        nop
        push    cs
        call    EP_DRAW_CONFIRM_WINDOW_OFF+C1_CSBASE
        add     sp, 4
        push    ds
        push    C2_W_02168
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        les     bx, [C0_W_0D7C2]
        test    byte ptr es:[bx+SND_FLAGS_HI], 1
        je      br_4C29C
        mov     ax, STR_C1_ROM
        mov     dx, C1_SEG
        jmp     br_4C2A2
        db      90h
br_4C29C:
        mov     ax, C2_W_0CD82
        mov     dx, C1_SEG
br_4C2A2:
        push    dx
        push    ax
        push    11h
        push    49h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        push    dx
        push    ax
        push    11h
        push    61h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        nop
        push    cs
        call    field_engine_redraw
        pop     ds
        retf
        db      00h
far_4C2D0:
        push    ds
        push    C0_W_0D7C2
        push    ds
        push    C2_W_021B6
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        nop
L_4C2E2:
        inc     sp
        db      "elete"
        db      " Sound", 00h, 00h
delete_sound_all:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    21e0h
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        pop     ds
        retf
delete_all_sounds_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    L_4B848
        pop     ds
        retf
        db      00h
        if      FW_VERSION >= 111
far_4C312:
        endif
        push    ds
        mov     cx, DS_SEG
        if      FW_VERSION >= 110
        mov     ds, cx
        push    C1_SEG
        db      68h, 12h
        if      FW_VERSION >= 114
        dw      EP_L_44990_OFF, C1_SEG
        elseif  FW_VERSION >= 111
        dw      (C1_BASE+L_44190-C1_SEG*16), C1_SEG
        else
        dw      (C1_BASE+L_43F60-C1_SEG*16), C1_SEG
        endif
        if      FW_VERSION >= 112
        db      68h, 0ah, 0e2h, 9ah
        else
        db      68h, 0dch, 0e1h, 9ah
        endif
        else
        db      8eh, 0d9h
        db      "h(=h"
        db      12h
        dw      EP_L_44990_OFF, C1_SEG
        db      68h, 0e0h, 0e1h, 9ah
        endif
        dw      EP_DISP_MESSAGE_WINDOW_OFF, EP_DISP_MESSAGE_WINDOW_SEG
        db      83h, 0c4h, 08h, 0b8h, 1ah, 0d7h, 8ch, 0d9h
        db      3bh, 06h, 0dch, 98h
        jne     loop_4C33D
        db      3bh, 0eh, 0deh, 98h
        je      L_4C35E
loop_4C33D:
        push    word ptr [C0_W_098DE]
        push    word ptr [C0_W_098DC]
        nop
        push    cs
        call    EP_SOUND_LIST_UNLINK_OFF+C1_CSBASE
        add     sp, 4
        mov     ax, C1_TBL_SOUNDS_END
        mov     cx, ds
        cmp     ax, word ptr [C0_W_098DC]
        jne     loop_4C33D
        cmp     cx, word ptr [C0_W_098DE]
        jne     loop_4C33D
L_4C35E:
        mov     ax, word ptr [C0_W_098DC]
        mov     dx, word ptr [C0_W_098DE]
        mov     word ptr [C0_W_0D7C2], ax
        mov     word ptr [C0_W_0D7C4], dx
        nop
        push    cs
        call    EP_FIELD_HANDLER_NOP_OFF+C1_CSBASE
        nop
        push    cs
        call    far_4C0C0
        pop     ds
        retf
delete_all_sounds_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    C1_SEG
        if      FW_VERSION >= 112
        push    EP_L_4C3A6_OFF
        else
        push    C2_W_0E1E8
        endif
        nop
        push    cs
        call    EP_DRAW_CONFIRM_WINDOW_OFF+C1_CSBASE
        add     sp, 4
        push    ds
        push    C2_W_021FE
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        pop     ds
        retf
L_4BD9A:
        db      "processing", 00h, 00h
L_4C3A6:
        db      "Delete ALL Sound", 00h, 00h
sound_spec_f5:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    2248h
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        push    dx
        push    ax
        push    ds
        push    C1_W_08FCB
        nop
        push    cs
        call    far_484D6
        add     sp, 8
        cmp     word ptr [C2_W_COPY_SOUND_CURSOR], 0
        jl      br_4C3F0
        cmp     word ptr [C2_W_COPY_SOUND_CURSOR], 2
        jb      br_4C3F6
br_4C3F0:
        mov     word ptr [C2_W_COPY_SOUND_CURSOR], 0
br_4C3F6:
        imul    bx, word ptr [C2_W_COPY_SOUND_CURSOR], 2ah
        callf   [bx+C2_TBL_022A2]
        pop     ds
        retf
        db      00h
copy_sound_cancel:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_4C0C0
        pop     ds
        retf
        db      00h
copy_sound_do_it:
        enter   8, 0
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    8fcbh
        push    C1_SEG
        if      FW_VERSION >= 112
        push    EP_L_4C55E_OFF
        else
        push    C2_W_0E3A0
        endif
        callf   EP_DISP_MESSAGE_WINDOW_SEG:EP_DISP_MESSAGE_WINDOW_OFF
        add     sp, 8
        push    ds
        push    C1_W_08FCB
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        lea     ax, [bp-8]
        push    ss
        push    ax
        nop
        push    cs
        call    EP_FAR_40556_OFF+C1_CSBASE
        add     sp, 0ch
        mov     si, ax
        mov     word ptr [bp-2], dx
        nop
        push    cs
        call    EP_FIELD_HANDLER_NOP_OFF+C1_CSBASE
        mov     ax, word ptr [bp-2]
        or      ax, si
        je      br_4C466
        push    word ptr [bp-2]
        push    si
        callf   EP_DISP_ALERT_WAIT_KEY_SEG:EP_DISP_ALERT_WAIT_KEY_OFF
        add     sp, 4
        jmp     br_4C47D
        db      90h
br_4C466:
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        mov     word ptr [C0_W_0D7C2], ax
        mov     word ptr [C0_W_0D7C4], dx
        callf   EP_SOUND_WAVE_OVERVIEW_BUILD_SEG:EP_SOUND_WAVE_OVERVIEW_BUILD_OFF
        nop
        push    cs
        call    far_4D678
br_4C47D:
        nop
        push    cs
        call    copy_sound_cancel
        pop     ds
        pop     si
        leave
        retf
copy_sound_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        les     bx, [C0_W_0D7C2]
        test    byte ptr es:[bx+SND_FLAGS_HI], 1
        je      br_4C4A0
        mov     ax, C2_W_0E3D8
        mov     dx, C1_SEG
        jmp     br_4C4A6
        db      90h
br_4C4A0:
        mov     ax, C2_W_0E3E4
        mov     dx, C1_SEG
br_4C4A6:
        push    dx
        push    ax
        nop
        push    cs
        call    EP_DRAW_CONFIRM_WINDOW_OFF+C1_CSBASE
        add     sp, 4
        push    ds
        push    C2_W_02266
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        les     bx, [C0_W_0D7C2]
        test    byte ptr es:[bx+SND_FLAGS_HI], 1
        je      br_4C4D0
        mov     ax, STR_C1_ROM
        mov     dx, C1_SEG
        jmp     br_4C4D6
        db      90h
br_4C4D0:
        mov     ax, C2_W_0CD82
        mov     dx, C1_SEG
br_4C4D6:
        push    dx
        push    ax
        push    10h
        push    5bh
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        push    dx
        push    ax
        push    10h
        push    73h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        push    ds
        push    C1_W_08FCB
        push    28h
        push    73h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        nop
        push    cs
        call    field_engine_redraw
        pop     ds
        retf
        db      00h
far_4C514:
        mov     word ptr [C2_W_COPY_SOUND_CURSOR], 0
        push    ds
        push    C0_W_0D7C2
        push    ds
        push    C2_W_02294
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_4BBCE:
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        push    dx
        push    ax
        push    ds
        push    C1_W_08FCB
        nop
        push    cs
        call    far_484D6
        add     sp, 8
        retf
        db      00h
L_4BBE8:
        mov     word ptr [C2_W_COPY_SOUND_CURSOR], 1
        push    ds
        push    C1_W_08FCB
        push    ds
        push    C2_W_022BE
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        nop
L_4C55E:
        db      "copying ", 00h
        db      00h
L_4C568:
        db      43h, 6fh, 70h, 79h, 20h, 74h, 6fh, 20h, 52h, 41h, 4dh, 00h
L_4C574:
        db      "Copy Sound", 00h, 00h
sound_spec_f3:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    22e8h
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        mov     byte ptr [C0_B_098B8], 0
        callf   [C2_FP_02334]
        pop     ds
        retf
        db      00h
L_4C59E:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_4C0C0
        pop     ds
        retf
        db      00h
far_4C5AC:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        cmp     byte ptr [C0_B_098B8], 0
        je      br_4C5C0
        nop
        push    cs
        call    far_4CA2A
        pop     ds
        retf
br_4C5C0:
        les     bx, [C0_W_0D7C2]
        cmp     byte ptr es:[bx+SND_STEREO], 0
        je      br_4C5D2
        nop
        push    cs
        call    sample_string_access
        pop     ds
        retf
br_4C5D2:
        nop
        push    cs
        call    far_4C684
        pop     ds
        retf
        db      00h
far_4C5DA:
        db      1eh
        mov     cx, DS_SEG
        mov     ds, cx
        push    C1_SEG
        if      FW_VERSION >= 114
        push    EP_C1_E4BC_OFF
        elseif  FW_VERSION >= 112
        push    EP_L_4BE4C_OFF
        else
        push    C2_W_0E48E
        endif
        nop
        push    cs
        call    EP_DRAW_CONFIRM_WINDOW_OFF+C1_CSBASE
        add     sp, 4
        push    ds
        push    C2_W_02306
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        cmp     byte ptr [C0_B_098B8], 0
        je      br_4C60A
        mov     ax, C2_W_0E4CA
        mov     dx, C1_SEG
        jmp     br_4C624
        db      90h
br_4C60A:
        les     bx, [C0_W_0D7C2]
        cmp     byte ptr es:[bx+SND_STEREO], 0
        je      BR_4C61E
        mov     ax, C2_W_0E4D4
        mov     dx, C1_SEG
        jmp     SHORT br_4C624
        db      90h
BR_4C61E:
        mov     ax, C2_W_0E4E4
        mov     dx, C1_SEG
br_4C624:
        push    dx
        push    ax
        push    1ch
        push    7fh
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        nop
        push    cs
        call    field_engine_redraw
        pop     ds
        retf
        db      00h
L_4C63A:
        push    ds
        push    C0_B_098B8
        push    ds
        push    C2_W_02326
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        nop
L_4C04C:
        db      "Convert Sound", 00h
L_4C65A:
        db      "RE-SAMPLE", 00h
L_4BD06:
        db      "STEREO TO MONO", 00h, 00h
L_4BD16:
        db      "MONO TO STEREO", 00h, 00h
far_4C684:
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    2350h
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        mov     word ptr [C0_B_098B8], ax
        mov     word ptr [C2_W_098BA], dx
        xor     si, si
loop_4C6A7:
        les     bx, [C0_W_0D7C2]
        add     bx, 12h
        cmp     byte ptr es:[bx+si], 20h
        jne     br_4C6BC
        mov     byte ptr [si+C1_W_08FCB], 5fh
        jmp     br_4C6CA
        db      90h
br_4C6BC:
        mov     bx, word ptr [C0_W_0D7C2]
        add     bx, 12h
        mov     al, byte ptr es:[bx+si]
        mov     byte ptr [si+C1_W_08FCB], al
br_4C6CA:
        inc     si
        cmp     si, 0eh
        jl      loop_4C6A7
        mov     byte ptr [C2_B_08FD9], 2dh
        mov     byte ptr [C2_B_08FDA], 53h
        mov     byte ptr [C2_B_08FDB], 0
        mov     word ptr [C2_W_MONO_TO_STEREO_CURSOR], 0
        callf   [C2_FP_023B6]
        pop     ds
        pop     si
        retf
mono_to_stereo_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_4C0C0
        pop     ds
        retf
        db      00h
mono_to_stereo_f5:
        enter   4, 0
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        les     bx, [C0_W_0D7C2]
        cmp     byte ptr es:[bx+SND_STEREO], 0
        jne     br_4C76F
        les     bx, [C0_B_098B8]
        cmp     byte ptr es:[bx+25h], 0
        jne     br_4C76F
        push    cx
        push    8fcbh
        push    EP_L_4C84E_SEG
        push    EP_L_4C84E_OFF
        callf   EP_DISP_MESSAGE_WINDOW_SEG:EP_DISP_MESSAGE_WINDOW_OFF
        add     sp, 8
        push    ds
        push    C1_W_08FCB
        push    word ptr [C2_W_098BA]
        push    word ptr [C0_B_098B8]
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    EP_L_3FED6_OFF+C1_CSBASE
        add     sp, 0ch
        mov     si, ax
        mov     word ptr [bp-2], dx
        nop
        push    cs
        call    EP_FIELD_HANDLER_NOP_OFF+C1_CSBASE
        mov     ax, word ptr [bp-2]
        or      ax, si
        je      br_4C76A
        push    word ptr [bp-2]
        push    si
        callf   EP_DISP_ALERT_WAIT_KEY_SEG:EP_DISP_ALERT_WAIT_KEY_OFF
        add     sp, 4
        pop     ds
        pop     si
        leave
        retf
br_4C76A:
        nop
        push    cs
        call    mono_to_stereo_open
br_4C76F:
        pop     ds
        pop     si
        leave
        retf
        db      00h
mono_to_stereo_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    EP_L_4BD16_SEG
        push    EP_L_4BD16_OFF
        nop
        push    cs
        call    EP_DRAW_CONFIRM_WINDOW_OFF+C1_CSBASE
        add     sp, 4
        push    ds
        push    C2_W_0236E
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        push    dx
        push    ax
        push    0fh
        push    8bh
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        mov     ax, word ptr [C0_B_098B8]
        mov     dx, word ptr [C2_W_098BA]
        add     ax, 12h
        push    dx
        push    ax
        push    1eh
        push    8bh
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        push    ds
        push    C1_W_08FCB
        push    28h
        push    8bh
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        les     bx, [C0_W_0D7C2]
        cmp     byte ptr es:[bx+SND_STEREO], 0
        jne     br_4C7FF
        les     bx, [C0_B_098B8]
        cmp     byte ptr es:[bx+25h], 0
        jne     br_4C7FF
        push    EP_FAR_47ABE_SEG
        push    EP_FAR_47ABE_OFF
        push    1
        push    5
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
br_4C7FF:
        nop
        push    cs
        call    field_engine_redraw
        pop     ds
        retf
L_4BEA8:
        mov     word ptr [C2_W_MONO_TO_STEREO_CURSOR], 0
        push    ds
        push    C0_W_0D7C2
        push    ds
        push    C2_W_023A8
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_4C81E:
        mov     word ptr [C2_W_MONO_TO_STEREO_CURSOR], 1
        push    ds
        push    C0_B_098B8
        push    ds
        push    C2_W_023D2
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_4BED8:
        mov     word ptr [C2_W_MONO_TO_STEREO_CURSOR], 2
        push    ds
        push    C1_W_08FCB
        push    ds
        push    C2_W_023FC
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      90h
L_4C84E:
        db      "Binding "
        db      00h, 00h
sample_string_access:
        enter   2, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    2426h
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        xor     si, si
loop_4C872:
        les     bx, [C0_W_0D7C2]
        add     bx, 12h
        mov     al, byte ptr es:[bx+si]
        mov     byte ptr [bp-2], al
        cmp     al, 20h
        jne     L_4BF2C
        mov     byte ptr [si+C1_W_08FCB], 5fh
        jmp     SHORT br_4C891
L_4BF2C:
        mov     al, byte ptr [bp-2]
        mov     byte ptr [si+C1_W_08FCB], al
br_4C891:
        inc     si
        cmp     si, 0eh
        jl      loop_4C872
        mov     byte ptr [C2_B_08FD9], 2dh
        mov     byte ptr [C2_B_08FDA], 4ch
        mov     byte ptr [C2_B_08FDB], 0
        mov     di, 8fcbh
        mov     si, C2_W_08D38
        mov     cx, ds
        mov     es, cx
        push    cx
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        xchg    di, si
        push    ds
        push    es
        pop     ds
        pop     es
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        mov     byte ptr [C2_B_08D47], 52h
        mov     word ptr [C2_W_STEREO_TO_MONO_CURSOR], ax
        callf   [C2_FP_02492]
        pop     ds
        pop     si
        pop     di
        leave
        retf
stereo_to_mono_cancel:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_4C0C0
        pop     ds
        retf
        db      00h
stereo_to_mono_do_it:
        enter   4, 0
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        les     bx, [C0_W_0D7C2]
        cmp     byte ptr es:[bx+SND_STEREO], 0
        je      br_4C951
        lea     ax, [bx+SND_NAME]
        push    es
        push    ax
        push    C1_SEG
        push    STR_C1_SEPARATING
        callf   EP_DISP_MESSAGE_WINDOW_SEG:EP_DISP_MESSAGE_WINDOW_OFF
        add     sp, 8
        push    ds
        push    C2_W_08D38
        push    ds
        push    C1_W_08FCB
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    far_5066A
        add     sp, 0ch
        mov     si, ax
        mov     word ptr [bp-2], dx
        nop
        push    cs
        call    EP_FIELD_HANDLER_NOP_OFF+C1_CSBASE
        mov     ax, word ptr [bp-2]
        or      ax, si
        je      br_4C94C
        push    word ptr [bp-2]
        push    si
        callf   EP_DISP_ALERT_WAIT_KEY_SEG:EP_DISP_ALERT_WAIT_KEY_OFF
        add     sp, 4
        pop     ds
        pop     si
        leave
        retf
br_4C94C:
        nop
        push    cs
        call    stereo_to_mono_cancel
br_4C951:
        pop     ds
        pop     si
        leave
        retf
        db      00h
stereo_to_mono_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    C1_SEG
        push    (C2_BASE+L_4BD06-C1_SEG*16)
        nop
        push    cs
        call    EP_DRAW_CONFIRM_WINDOW_OFF+C1_CSBASE
        add     sp, 4
        push    ds
        push    C2_W_02444
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        push    dx
        push    ax
        push    0fh
        push    8bh
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        push    ds
        push    C1_W_08FCB
        push    1eh
        push    8bh
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        push    ds
        push    C2_W_08D38
        push    28h
        push    8bh
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        les     bx, [C0_W_0D7C2]
        cmp     byte ptr es:[bx+SND_STEREO], 0
        je      br_4C9CE
        push    EP_FAR_47ABE_SEG
        push    EP_FAR_47ABE_OFF
        push    1
        push    5
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
br_4C9CE:
        nop
        push    cs
        call    field_engine_redraw
        pop     ds
        retf
        db      00h
st_to_mono_focus_source:
        mov     word ptr [C2_W_STEREO_TO_MONO_CURSOR], 0
        push    ds
        push    C0_W_0D7C2
        push    ds
        push    C2_W_02484
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
st_to_mono_focus_l_name:
        mov     word ptr [C2_W_STEREO_TO_MONO_CURSOR], 1
        push    ds
        push    C1_W_08FCB
        push    ds
        push    C2_W_024AE
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
st_to_mono_focus_r_name:
far_4BACC:
        mov     word ptr [C2_W_STEREO_TO_MONO_CURSOR], 2
        push    ds
        push    C2_W_08D38
        push    ds
        push    C2_W_024D8
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        nop
L_4C41E:
L_4CA1E:
        db      "Separating ", 00h
far_4CA2A:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        push    dx
        push    ax
        push    cx
        push    8fcbh
        nop
        push    cs
        call    far_484D6
        add     sp, 8
        les     bx, [C0_W_0D7C2]
        mov     ax, word ptr es:[bx+SND_RATE]
        mov     word ptr [C2_W_02502], ax
        push    ds
        push    C2_W_02516
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        mov     word ptr [C2_W_RESAMPLE_CURSOR], 0
        callf   [C2_FP_02542]
        pop     ds
        retf
        db      00h
resample_cancel:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_4C0C0
        pop     ds
        retf
        db      00h
resample_do_it:
        enter   8, 0
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        push    dx
        push    ax
        push    C1_SEG
        push    EP_L_4C440_OFF
        callf   EP_DISP_MESSAGE_WINDOW_SEG:EP_DISP_MESSAGE_WINDOW_OFF
        add     sp, 8
        push    ds
        push    C2_W_02502
        push    ds
        push    C1_W_08FCB
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        lea     ax, [bp-8]
        push    ss
        push    ax
        callf   EP_L_577F4_SEG:EP_L_577F4_OFF
        add     sp, 10h
        mov     si, ax
        mov     word ptr [bp-2], dx
        nop
        push    cs
        call    EP_FIELD_HANDLER_NOP_OFF+C1_CSBASE
        mov     ax, word ptr [bp-2]
        or      ax, si
        je      br_4CADC
        push    word ptr [bp-2]
        push    si
        callf   EP_DISP_ALERT_WAIT_KEY_SEG:EP_DISP_ALERT_WAIT_KEY_OFF
        add     sp, 4
        jmp     br_4CAE9
        db      90h
br_4CADC:
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        mov     word ptr [C0_W_0D7C2], ax
        mov     word ptr [C0_W_0D7C4], dx
br_4CAE9:
        callf   EP_SOUND_WAVE_OVERVIEW_BUILD_SEG:EP_SOUND_WAVE_OVERVIEW_BUILD_OFF
        nop
        push    cs
        call    resample_cancel
        pop     ds
        pop     si
        leave
        retf
        db      00h
resample_paint:
        enter   4, 0
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     byte ptr [bp-4], 10h
        mov     byte ptr [bp-3], 0ch
        mov     byte ptr [bp-2], 8
        push    C1_SEG
        push    EP_L_4C64C_OFF
        nop
        push    cs
        call    EP_DRAW_CONFIRM_WINDOW_OFF+C1_CSBASE
        add     sp, 4
        push    C1_SEG
        push    (C2_BASE+L_4C2F8-C1_SEG*16)
        push    0fh
        push    37h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        push    5
        push    0
        push    word ptr [C2_W_02502]
        push    0fh
        push    6dh
        nop
        push    cs
        call    EP_DRAW_UNSIGNED_VALUE_OFF+C1_CSBASE
        add     sp, 0ah
        mov     al, byte ptr [C2_B_02504]
        sub     ah, ah
        mov     cx, ax
        shl     ax, 2
        add     ax, cx
        add     ax, 2506h
        push    ds
        push    ax
        push    0fh
        push    0d3h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        push    EP_FAR_4CC72_SEG
        push    EP_FAR_4CC72_OFF
        push    1ah
        push    37h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        push    2
        mov     si, word ptr [C2_W_02505]
        and     si, 0ffh
        mov     al, byte ptr [bp+si-4]
        cbw
        cwd
        push    dx
        push    ax
        push    1ah
        push    6dh
        nop
        push    cs
        call    EP_DRAW_UNSIGNED_VALUE_OFF+C1_CSBASE
        add     sp, 0ah
        push    EP_L_4CC82_SEG
        push    EP_L_4CC82_OFF
        push    25h
        push    37h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        push    ds
        push    C1_W_08FCB
        push    25h
        push    6dh
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        push    C1_SEG
        if      FW_VERSION >= 111
        push    EP_FAR_4CC8C_OFF
        else
        push    EP_FAR_4C32E_OFF
        endif
        push    2
        push    4
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
        push    EP_FAR_47ABE_SEG
        push    EP_FAR_47ABE_OFF
        push    1
        push    5
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
        nop
        push    cs
        call    field_engine_redraw
        pop     ds
        pop     si
        leave
        retf
        db      00h
resample_focus_new_fs:
        mov     word ptr [C2_W_RESAMPLE_CURSOR], 0
        push    ds
        push    C2_W_02502
        push    ds
        push    C2_W_02534
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
resample_focus_quality:
        mov     word ptr [C2_W_RESAMPLE_CURSOR], 1
        push    ds
        push    C2_W_02505
        push    ds
        push    C2_W_0255E
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
resample_focus_new_name:
        mov     word ptr [C2_W_RESAMPLE_CURSOR], 2
        push    ds
        push    C1_W_08FCB
        push    ds
        push    C2_W_02588
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
resample_focus_new_bit:
        mov     word ptr [C2_W_RESAMPLE_CURSOR], 3
        push    ds
        push    C2_B_02504
        push    ds
        push    C2_W_025B2
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      90h
L_4C440:
        db      "Resampling "
        db      00h
L_4C64C:
        db      "Resample"
        db      00h, 00h
L_4C2F8:
        db      "  New Fs:_____Hz  Quality:"
        db      00h, 00h
far_4CC72:
        db      " New Bit:16bit"
        db      00h, 00h
L_4CC82:
        db      "New name:"
        db      00h
far_4C32E:
far_4CC8C:
        db      "CANCEL", 00h, 00h
far_4CC94:
        db      "U"
        mov     bp, sp
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr [C2_W_08D52], ax
        mov     word ptr [C2_W_08D54], dx
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        mov     word ptr [C2_W_098AE], ax
        mov     word ptr [C2_W_098B0], dx
        mov     ax, word ptr [bp+0eh]
        mov     dx, word ptr [bp+10h]
        mov     word ptr [C2_W_098B2], ax
        mov     word ptr [C2_W_098B4], dx
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        mov     word ptr [C2_W_098A6], ax
        mov     word ptr [C2_W_098A8], dx
        mov     word ptr [C2_W_08D4E], ax
        mov     word ptr [C2_W_08D50], dx
        cmp     word ptr [C2_W_08D52], C2_W_0BD7A
        jne     br_4CCE3
        cmp     word ptr [C2_W_08D54], C1_SEG
        je      br_4CD22
br_4CCE3:
        cmp     word ptr [C2_W_08D52], C2_W_0D876
        jne     br_4CCFC
        cmp     word ptr [C2_W_08D54], C1_SEG
        jne     br_4CCFC
        mov     word ptr [C2_W_08D4C], 1
        jmp     br_4CD28
        db      90h
br_4CCFC:
        cmp     word ptr [C2_W_08D52], C2_W_0F1DC
        jne     br_4CD14
        cmp     word ptr [C2_W_08D54], C1_SEG
        jne     br_4CD14
        mov     word ptr [C2_W_08D4C], 8
        jmp     br_4CD28
br_4CD14:
        cmp     word ptr [C2_W_08D4C], 0
        jle     br_4CD22
        cmp     word ptr [C2_W_08D4C], 7
        jle     br_4CD28
br_4CD22:
        mov     word ptr [C2_W_08D4C], 0
br_4CD28:
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        push    dx
        push    ax
        push    ds
        push    C1_W_08FCB
        nop
        push    cs
        call    far_484D6
        mov     sp, bp
        nop
        push    cs
        call    EP_VOICES_RELEASE_ALL_OFF+C1_CSBASE
        nop
        push    cs
        call    far_4CD4C
        leave
        retf
        db      00h
far_4CD4C:
        push    ds
        push    C2_W_02606
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        mov     word ptr [C2_W_TS_CURSOR], 0
        callf   [C2_FP_0269A]
        retf
        db      00h
edit_sound_cancel:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_4D21C
        pop     ds
        retf
        db      00h
edit_sound_f2:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        cmp     word ptr [C2_W_08D4C], 7
        jne     br_4CD84
        callf   EP_L_56FFA_SEG:EP_L_56FFA_OFF
br_4CD84:
        pop     ds
        retf
edit_sound_do_it:
X_4CD86:
        enter   6, 0
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    C1_SEG
        push    word 12h
        push    EP_L_4BD9A_SEG
        push    EP_L_4BD9A_OFF
        callf   EP_DISP_MESSAGE_WINDOW_SEG:EP_DISP_MESSAGE_WINDOW_OFF
        add     sp, 8
        mov     ax, word ptr [C2_W_08D4C]
        cmp     ax, 7
        ja      br_4CDC6
        add     ax, ax
        xchg    bx, ax
        jmp     word ptr cs:[bx+TBL_4CDB6-C1_CSBASE]
        db      90h
TBL_4CDB6:
        dw      tgt_4CE02-C1_CSBASE, tgt_4CE0E-C1_CSBASE, tgt_4CE2A-C1_CSBASE, tgt_4CE3A-C1_CSBASE
        dw      tgt_4CE50-C1_CSBASE, tgt_4CE5E-C1_CSBASE, tgt_4CE7A-C1_CSBASE, tgt_4CE86-C1_CSBASE
br_4CDC6:
        mov     al, byte ptr [C1_B_0D7E0]
        cbw
        push    ax
        push    word ptr [C1_W_0D7DE]
        push    ds
        push    C0_TBL_08E76
        mov     al, byte ptr [C1_B_0D7DC]
        cbw
        push    ax
        push    word ptr [C2_W_098A8]
        push    word ptr [C2_W_098A6]
        nop
        push    cs
        call    EP_L_40958_OFF+C1_CSBASE
        add     sp, 0eh
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      byte ptr [bp-6], 3
loop_4CDF1:
        mov     ax, word ptr [C2_W_098A6]
        mov     dx, word ptr [C2_W_098A8]
        mov     word ptr [C2_W_098AA], ax
        mov     word ptr [C2_W_098AC], dx
        jmp     br_4CEA3
tgt_4CE02:
        push    ds
        push    C2_W_098A6
        nop
        push    cs
        call    EP_L_409A8_OFF+C1_CSBASE
        jmp     br_4CE59
        nop
tgt_4CE0E:
        push    word ptr [C2_W_098A8]
        push    word ptr [C2_W_098A6]
        nop
        push    cs
        if      FW_VERSION >= 112
        db      0e8h, 2fh, 3dh
        elseif  FW_VERSION >= 110
        db      0e8h, 5dh, 3dh
        else
        db      0e8h, 59h, 3dh
        endif
        add     sp, 4
        mov     si, ax
        mov     word ptr [bp-2], dx
        and     byte ptr [bp-6], 0fch
        jmp     loop_4CDF1
        nop
tgt_4CE2A:
        push    ds
        push    C1_W_08FCB
        push    ds
        push    C2_W_098A6
        nop
        push    cs
        call    EP_FAR_40B9A_OFF+C1_CSBASE
        jmp     SHORT br_4CE4B
        db      90h
tgt_4CE3A:
        push    word ptr [C2_W_08D50]
        push    word ptr [C2_W_08D4E]
        push    ds
        push    C2_W_098A6
        nop
        push    cs
        call    EP_L_40C5A_OFF+C1_CSBASE
br_4CE4B:
        add     sp, 8
        jmp     br_4CE9A
tgt_4CE50:
        if      FW_VERSION >= 112
        db      1eh, 68h, 0a6h, 98h, 90h, 0eh, 0e8h, 21h, 3fh
        elseif  FW_VERSION >= 110
        db      1eh, 68h, 0a6h, 98h, 90h, 0eh, 0e8h, 4fh, 3fh
        else
        db      1eh, 68h, 0a6h, 98h, 90h, 0eh, 0e8h, 4bh, 3fh
        endif
br_4CE59:
        add     sp, 4
        jmp     br_4CE9A
tgt_4CE5E:
        push    ds
        push    C2_W_098A6
        nop
        push    cs
        call    EP_L_406C0_OFF+C1_CSBASE
loop_4CE67:
        add     sp, 4
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      byte ptr [bp-6], 1
        and     byte ptr [bp-6], 0fdh
        jmp     br_4CEA3
        nop
tgt_4CE7A:
        push    ds
        push    C2_W_098A6
        nop
        push    cs
        if      FW_VERSION >= 112
        db      0e8h, 0f7h, 41h
        jmp     loop_4CE67
        else
        call    EP_L_4107A_OFF+C1_CSBASE
        jmp     SHORT loop_4CE67
        endif
        db      90h
tgt_4CE86:
        push    ds
        push    C2_W_02600
        push    ds
        push    C1_W_08FCB
        push    ds
        push    C2_W_098A6
        db      9ah
        dw      EP_TS_EXECUTE_OFF, C2_SEG
        db      83h, 0c4h, 0ch
br_4CE9A:
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      byte ptr [bp-6], 3
br_4CEA3:
        nop
        push    cs
        call    EP_FIELD_HANDLER_NOP_OFF+C1_CSBASE
        mov     ax, word ptr [bp-2]
        or      ax, si
        je      br_4CEBE
        push    word ptr [bp-2]
        push    si
        callf   EP_DISP_ALERT_WAIT_KEY_SEG:EP_DISP_ALERT_WAIT_KEY_OFF
        add     sp, 4
        jmp     br_4CECC
        db      90h
br_4CEBE:
        mov     ax, word ptr [C2_W_098AA]
        mov     dx, word ptr [C2_W_098AC]
        mov     word ptr [C0_W_0D7C2], ax
        mov     word ptr [C0_W_0D7C4], dx
br_4CECC:
        test    byte ptr [bp-6], 1
        je      br_4CED7
        callf   EP_SOUND_WAVE_OVERVIEW_BUILD_SEG:EP_SOUND_WAVE_OVERVIEW_BUILD_OFF
br_4CED7:
        test    byte ptr [bp-6], 2
        je      br_4CEE2
        nop
        push    cs
        call    far_4D678
br_4CEE2:
        nop
        push    cs
        call    far_4D21C
        pop     ds
        pop     si
        leave
        retf
        db      00h
edit_sound_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    C1_SEG
        if      FW_VERSION >= 114
        push    EP_L_4D2BA_OFF
        elseif  FW_VERSION >= 112
        push    EP_L_4CABA_OFF
        else
        push    EP_L_4C95C_OFF
        endif
        nop
        push    cs
        call    EP_SMEM_PROC_WRAPPER_OFF+C1_CSBASE
        add     sp, 4
        push    EP_FAR_4D2C0_SEG
        push    EP_FAR_4D2C0_OFF
        push    0bh
        push    13h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        mov     bx, word ptr [C2_W_08D4C]
        shl     bx, 2
        push    word ptr [bx+C2_TBL_025DE]
        push    word ptr [bx+C2_TBL_025DC]
        push    0bh
        push    31h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        mov     ax, word ptr [C2_W_08D4C]
        cmp     ax, 8
        ja      br_4CF50
        add     ax, ax
        xchg    bx, ax
        jmp     word ptr cs:[bx+TBL_4CF3E-C1_CSBASE]
        nop
TBL_4CF3E:
        dw      tgt_4CF6A-C1_CSBASE, tgt_4CF7A-C1_CSBASE, br_4D0BA-C1_CSBASE, tgt_4CF9A-C1_CSBASE
        dw      br_4CF50-C1_CSBASE, br_4CF50-C1_CSBASE, br_4CF50-C1_CSBASE, tgt_4CFC0-C1_CSBASE
        dw      tgt_4D062-C1_CSBASE
br_4CF50:
        push    C1_SEG
        if      FW_VERSION >= 120
        push    EP_FAR_4D33C_OFF
        elseif  FW_VERSION >= 114
        push    EP_C1_F1AC_OFF
        else
        push    EP_FAR_4CB3C_OFF
        endif
        push    17h
        push    2bh
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        push    C1_SEG
        if      FW_VERSION >= 112
        if      FW_VERSION >= 114
        push    EP_L_4D358_OFF
        else
        push    EP_L_4CB58_OFF
        endif
        jmp     br_4CF92
        else
        push    EP_L_4C9FA_OFF
        jmp     SHORT br_4CF92
        endif
tgt_4CF6A:
        push    ds
        push    C2_W_0262A
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        jmp     br_4D0DC
        nop
tgt_4CF7A:
        push    C1_SEG
        push    (C2_BASE+str_do_it_set-C1_SEG*16)
        push    17h
        push    2bh
        nop
        push    cs
        if      FW_VERSION >= 112
        call    far_4EB18
        else
        call    far_4E1EA-2
        endif
        add     sp, 8
        push    C1_SEG
        push    (C2_BASE+str_do_it_loop-C1_SEG*16)
br_4CF92:
        push    21h
        push    2bh
        jmp     br_4D0D4
        nop
tgt_4CF9A:
        push    C1_SEG
        push    (C2_BASE+L_4C9B2-C1_SEG*16)
        push    15h
        push    13h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        push    word ptr [C2_W_08D50]
        push    word ptr [C2_W_08D4E]
        push    15h
        push    55h
        nop
        push    cs
        call    far_47D5E
        jmp     NEAR L_4D0D9
tgt_4CFC0:
        push    EP_L_4CCF4_SEG
        push    EP_L_4CCF4_OFF
        push    1
        push    2
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
        push    C1_SEG
        push    (C2_BASE+L_4C99A-C1_SEG*16)
        push    1fh
        push    25h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        push    2
        push    3
        push    0
        push    word ptr [C2_W_02602]
        push    1fh
        push    49h
        nop
        push    cs
        call    EP_DRAW_FIXED_DECIMAL_OFF+C1_CSBASE
        add     sp, 0ch
        push    25h
        push    1fh
        push    6dh
        callf   EP_DRAW_CHAR_AT_SEG:EP_DRAW_CHAR_AT_OFF
        add     sp, 6
        push    C1_SEG
        if      FW_VERSION >= 114
        push    EP_L_4D300_OFF
        elseif  FW_VERSION >= 112
        push    EP_L_4CB00_OFF
        else
        push    EP_C1_F170_OFF
        endif
        push    29h
        push    1fh
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        mov     al, byte ptr [C2_W_02600]
        sub     ah, ah
        push    ax
        callf   EP_L_55CC2_SEG:EP_L_55CC2_OFF
        add     sp, 2
        push    dx
        push    ax
        push    29h
        push    49h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        push    C1_SEG
        if      FW_VERSION >= 114
        push    EP_L_4D308_OFF
        elseif  FW_VERSION >= 112
        push    EP_L_4CB08_OFF
        else
        push    EP_L_4C9AA_OFF
        endif
        push    29h
        push    0a9h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        push    2
        mov     al, byte ptr [C2_B_02604]
        cbw
        cwd
        push    dx
        push    ax
        push    29h
        push    0d3h
        nop
        push    cs
        call    EP_DRAW_SIGNED_VALUE_OFF+C1_CSBASE
        add     sp, 0ah
        jmp     br_4D0BA
        nop
tgt_4D062:
        push    C1_SEG
        push    (C2_BASE+L_4C9BE-C1_SEG*16)
        push    18h
        push    4fh
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        push    2
        push    0
        push    word ptr [C1_W_0D7DE]
        push    18h
        push    91h
        nop
        push    cs
        call    EP_DRAW_UNSIGNED_VALUE_OFF+C1_CSBASE
        add     sp, 0ah
        push    C1_SEG
        if      FW_VERSION >= 114
        push    (C2_BASE+L_4D328-C1_SEG*16)
        elseif  FW_VERSION >= 112
        push    (C2_BASE+L_4CB28-C1_SEG*16)
        else
        push    (C2_BASE+L_4C9CA-C1_SEG*16)
        endif
        push    23h
        push    1fh
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        cmp     byte ptr [C1_B_0D7E0], 0
        je      br_4D0AA
        mov     ax, C2_W_05A00
        mov     dx, C1_SEG
        jmp     br_4D0B0
br_4D0AA:
        mov     ax, C1_W_067E4
        mov     dx, C1_SEG
br_4D0B0:
        push    dx
        push    ax
        push    23h
        push    91h
        jmp     br_4D0D4
        db      90h
br_4D0BA:
        push    EP_L_4CC82_SEG
        push    EP_L_4CC82_OFF
        push    15h
        push    13h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        push    ds
        push    C1_W_08FCB
        push    15h
        push    49h
br_4D0D4:
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
L_4D0D9:
        add     sp, 8
br_4D0DC:
        push    C1_SEG
        if      FW_VERSION >= 111
        push    EP_FAR_4CC8C_OFF
        else
        push    EP_FAR_4C32E_OFF
        endif
        push    2
        push    4
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
        push    EP_FAR_47ABE_SEG
        push    EP_FAR_47ABE_OFF
        push    1
        push    5
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
        nop
        push    cs
        call    field_engine_redraw
        pop     ds
        retf
        db      00h
L_4D108:
        mov     word ptr [C2_W_TS_CURSOR], 0
        cmp     word ptr [C2_W_08D52], C2_W_0F1DC
        jne     br_4D124
        cmp     word ptr [C2_W_08D54], C1_SEG
        jne     br_4D124
        mov     ax, 8
        jmp     br_4D127
        db      90h
br_4D124:
        mov     ax, 7
br_4D127:
        cwd
        mov     word ptr [C2_W_02696], ax
        mov     word ptr [C2_W_02698], dx
        push    ds
        push    C2_W_08D4C
        push    ds
        push    C2_W_0268C
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
L_4D140:
        mov     ax, word ptr [C2_W_08D4C]
        dec     ax
        dec     ax
        je      br_4D154
        dec     ax
        je      br_4D15A
        sub     ax, 4
        je      br_4D154
        dec     ax
        je      br_4D160
        retf
        db      90h
br_4D154:
        nop
        push    cs
        call    far_4D17E
        retf
br_4D15A:
        nop
        push    cs
        call    far_4D166
        retf
br_4D160:
        nop
        push    cs
        call    far_4D1A4
        retf
far_4D166:
        mov     word ptr [C2_W_TS_CURSOR], 1
        push    ds
        push    C2_W_08D4E
        push    ds
        push    C2_W_026B6
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
far_4D17E:
        mov     word ptr [C2_W_TS_CURSOR], 2
        push    ds
        push    C1_W_08FCB
        push    ds
        push    C2_W_026E0
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_4C838:
        mov     ax, word ptr [C2_W_08D4C]
        sub     ax, 7
        jne     L_4D1A3
        nop
        push    cs
        call    far_4D1D4
        if      FW_VERSION >= 114
far_4CB3C                       equ     $+0199h
        endif
L_4D1A3:
        retf
far_4D1A4:
        mov     word ptr [C2_W_TS_CURSOR], 3
        push    ds
        push    C1_W_0D7DE
        push    ds
        push    C2_W_0270A
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_4C85E:
        mov     word ptr [C2_W_TS_CURSOR], 4
        push    ds
        push    C1_B_0D7E0
        push    ds
        push    C2_W_02734
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
far_4D1D4:
        mov     word ptr [C2_W_TS_CURSOR], 5
        push    ds
        push    C2_W_02602
        push    ds
        push    C2_W_0275E
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_4D1EC:
        mov     word ptr [C2_W_TS_CURSOR], 6
        push    ds
        push    C2_W_02600
        push    ds
        push    C2_W_02788
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_4D204:
        mov     word ptr [C2_W_TS_CURSOR], 7
        push    ds
        push    C2_B_02604
        push    ds
        push    C2_W_027B2
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
far_4D21C:
        callf   [C2_W_08D52]
        retf
        nop
L_4C8C4:
        db      "DISCARD", 00h
L_4D22A_120:
        db      "LOOP FROM ST TO END", 00h
far_4D23E:
        db      "SECTION ", 0ch, " NEW SOUND", 00h
L_4D252:
        db      "INSERT SOUND ", 0ch, " SECTION START", 00h, 00h
far_4D270:
        db      "DELETE SECTION", 00h, 00h
        if      FW_VERSION >= 111
L_4D280:
        db      "SILENCE SECTION"
L_4D290                         equ     $+1
        db      00h, "REVERSE SECTION"
L_4D2A0                         equ     $+1
        if      FW_VERSION < 114
L_4CAA0                         equ     $+1
        endif
        db      00h, "TIME STRETCH", 00h, 00h
far_4D2AE:
        db      "SLICE SOUND"
L_4C95C                         equ     $+1
        db      00h, "Edit", 00h, 00h
        else
        db      "SILENCE SECTION", 00h
L_4D290:
        db      "REVERSE SECTION", 00h
L_4CAA0:
        db      "TIME STRETCH", 00h, 00h
FAR_4D2AE:
        db      "SLICE SOUND", 00h
L_4C95C:
        db      "Edit", 00h, 00h
        endif
far_4D2C0:
        db      "Edit:", 00h
str_do_it_set:
        db      "Pressing DO IT will set", 00h
str_do_it_loop:
        db      "loop from St to End.", 00h, 00h
L_4CCF4:
        if      FW_VERSION >= 112
        db      "BPM", 00h
L_4C99A:
        db      "Ratio:", 00h
L_4D300                         equ     $+1
        add     byte ptr [bx+si+72h], dl
        db      65h, 73h, 65h
        je      br_4D341
        else
        db      "BPM"
L_4C99A                         equ     $+1
        db      00h, "Ratio:", 00h
L_4D300                         equ     $+1
        db      00h
        db      "Preset:"
        endif
L_4D308                         equ     $+1
        db      00h, "Adjust:", 00h
L_4C9B2:
        db      "In"
        db      "sert"
        db      " Snd:", 00h
L_4C9BE:
        if      FW_VERSION >= 111
        db      "End marg"
        if      FW_VERSION >= 112
L_4D328                         equ     $+4
        if      FW_VERSION < 114
L_4CB28                         equ     $+4
        endif
        db      "in:", 00h, "Create"
        else
        db      "in:", 00h
L_4D328:
L_4CB28:
L_4C9CA:
        db      "Create"
        endif
        else
        db      "End margin:", 00h
L_4C9CA:
        db      "Create"
        endif
        db      " new program:", 00h
        if      FW_VERSION >= 112
        if      FW_VERSION < 114
far_4CB3C:
        endif
        else
far_4CB3C:
        endif
        db      "Press"
br_4D341:
        db      "ing DO IT will exe"
        db      "cute"
L_4C9FA                         equ     $+1
L_4D358                         equ     $+1
        if      FW_VERSION >= 112
        db      00h, "the selec"
        if      FW_VERSION <> 114
        db      74h, 65h
        else
        je      br_4D3CF
        endif
        db      "d edit.", 00h, 00h
        else
        db      00h, "the selected edit.", 00h, 00h
        endif
far_4D36C:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    27dch
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        mov     ax, C1_TBL_SOUNDS_END
        mov     cx, ds
        cmp     ax, word ptr [C0_W_0D7C2]
        jne     L_4D38F
        cmp     cx, word ptr [C0_W_0D7C4]
        je      br_4D3B8
L_4D38F:
        push    cx
        push    2804h
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        cmp     word ptr [C2_W_ZONE_CURSOR], 0
        jl      L_4CA4B
        cmp     word ptr [C2_W_ZONE_CURSOR], 5
        jb      L_4CA51
L_4CA4B:
        mov     word ptr [C2_W_ZONE_CURSOR], 0
L_4CA51:
        imul    bx, word ptr [C2_W_ZONE_CURSOR], 2ah
        callf   [bx+C2_TBL_02886]
br_4D3B8:
        pop     ds
        retf
far_4D3BA:
        db      1eh, 0b9h
        if      FW_VERSION >= 110
        if      FW_VERSION >= 120
        sub     bx, word ptr [bx+si-72h]
        db      0d9h
        mov     ax, C1_TBL_SOUNDS_END
        cmp     ax, word ptr [C0_W_0D7C2]
        jne     br_4D3CF
        elseif  FW_VERSION >= 114
        retf
        db      57h, 8eh, 0d9h, 0b8h, 1ah, 0d7h, 3bh, 06h, 0c2h, 0d7h, 75h
br_4D3CF:
        push    es
        else
        if      FW_VERSION >= 112
        stosw
        push    di
        mov     ds, cx
        else
        if      FW_VERSION >= 111
        mov     word ptr [bx-72h], ss
        else
        db      7ch, 57h, 8eh
        endif
        db      0d9h
        endif
        mov     ax, C1_TBL_SOUNDS_END
        cmp     ax, word ptr [C0_W_0D7C2]
        jne     br_4D3CF
        endif
        else
        db      2eh, 57h
        mov     ds, cx
        mov     ax, C1_TBL_SOUNDS_END
        cmp     ax, word ptr [C0_W_0D7C2]
        jne     br_4D3CF
        endif
        cmp     cx, word ptr [C2_W_0D7C4]
        je      br_4D3FB
        if      FW_VERSION < 114
br_4D3CF:
        endif
        if      FW_VERSION >= 120
br_4D3CF:
        endif
        nop
        push    cs
        call    zone_screen_refresh
        mov     al, byte ptr [C0_B_0D7DD]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C0_TBL_08E78]
        push    word ptr [bx+C0_TBL_08E76]
        push    word ptr [bx+C0_TBL_08E74]
        push    word ptr [bx+C0_TBL_08E72]
        push    C1_SEG
        push    EP_FAR_4D36C_OFF
        nop
        push    cs
        call    far_4CC94
        add     sp, 0ch
br_4D3FB:
        pop     ds
        retf
        db      00h
zone_screen_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    EP_VOICES_RELEASE_ALL_OFF+C1_CSBASE
        pop     ds
        retf
        db      00h
L_4D40C:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    zone_screen_refresh
        push    EP_FAR_4D36C_SEG
        push    EP_FAR_4D36C_OFF
        callf   EP_FAR_55112_SEG:EP_FAR_55112_OFF
        add     sp, 4
        pop     ds
        retf
        db      00h
zone_screen_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        imul    bx, word ptr [C2_W_ZONE_CURSOR], 2ah
        mov     ax, word ptr [bx+C2_TBL_028A0]
        or      ax, word ptr [bx+C2_TBL_0289E]
        je      br_4D44B
        nop
        push    cs
        call    zone_screen_refresh
        imul    bx, word ptr [C2_W_ZONE_CURSOR], 2ah
        callf   [bx+C2_TBL_0289E]
br_4D44B:
        pop     ds
        retf
        db      00h
zone_screen_key_33:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   EP_WAVE_OVERVIEW_BUILD_STEP_SEG:EP_WAVE_OVERVIEW_BUILD_STEP_OFF
        pop     ds
        retf
        db      00h
far_4D45C:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    282ch
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        push    91h
        nop
        push    cs
        call    EP_L_3EA6A_OFF+C1_CSBASE
        add     sp, 2
        mov     al, byte ptr [C0_B_0D7D6]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C2_TBL_018FA]
        push    word ptr [bx+C2_TBL_018F8]
        push    1
        push    0c7h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        les     bx, [C0_W_0D7C2]
        test    byte ptr es:[bx+SND_FLAGS_HI], 1
        je      br_4D4AA
        mov     ax, STR_C1_ROM
        mov     dx, C1_SEG
        jmp     br_4D4B0
br_4D4AA:
        mov     ax, C2_W_0CD82
        mov     dx, C1_SEG
br_4D4B0:
        push    dx
        push    ax
        push    2
        push    2
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        push    2
        push    1ah
        nop
        push    cs
        call    far_47D5E
        add     sp, 8
        mov     al, byte ptr [C0_B_0D7DD]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C0_TBL_08E74]
        push    word ptr [bx+C0_TBL_08E72]
        push    0ch
        push    1ah
        nop
        push    cs
        call    far_47FA4
        add     sp, 8
        mov     al, byte ptr [C0_B_0D7DD]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C0_TBL_08E78]
        push    word ptr [bx+C0_TBL_08E76]
        push    0ch
        push    7ah
        nop
        push    cs
        call    far_47FA4
        add     sp, 8
        push    2
        mov     al, byte ptr [C0_B_0D7DD]
        cbw
        cwd
        push    dx
        push    ax
        push    0ch
        push    0d4h
        nop
        push    cs
        call    EP_DRAW_UNSIGNED_VALUE_OFF+C1_CSBASE
        add     sp, 0ah
        mov     ax, C1_TBL_SOUNDS_END
        mov     cx, ds
        cmp     ax, word ptr [C0_W_0D7C2]
        jne     br_4D533
        cmp     cx, word ptr [C0_W_0D7C4]
        je      br_4D582
br_4D533:
        push    EP_FAR_4A018_SEG
        push    EP_FAR_4A018_OFF
        push    1
        push    5
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
        push    C1_SEG
        if      FW_VERSION >= 120
        push    EP_L_4A01E_OFF
        else
        push    EP_L_4A958_OFF
        endif
        push    1
        push    6
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
        nop
        push    cs
        call    field_engine_redraw
        callf   EP_WAVE_OVERVIEW_DRAW_SEG:EP_WAVE_OVERVIEW_DRAW_OFF
        mov     al, byte ptr [C0_B_0D7DD]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C0_TBL_08E78]
        push    word ptr [bx+C0_TBL_08E76]
        push    word ptr [bx+C0_TBL_08E74]
        push    word ptr [bx+C0_TBL_08E72]
        callf   EP_WAVE_REGION_HIGHLIGHT_SEG:EP_WAVE_REGION_HIGHLIGHT_OFF
        add     sp, 8
br_4D582:
        pop     ds
        retf
zone_focus_sound:
        mov     word ptr [C2_W_ZONE_CURSOR], 0
        push    ds
        push    C0_W_0D7C2
        push    ds
        push    C2_W_02878
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_4D59C:
        callf   EP_SOUND_WAVE_OVERVIEW_BUILD_SEG:EP_SOUND_WAVE_OVERVIEW_BUILD_OFF
        nop
        push    cs
        call    far_4D678
        retf
        db      00h
L_4D5A8:
        push    EP_FAR_4D36C_SEG
        push    EP_FAR_4D36C_OFF
        nop
        push    cs
        call    far_4C0D8
        add     sp, 4
        retf
        db      00h
zone_focus_play_x:
        mov     word ptr [C2_W_ZONE_CURSOR], 1
        push    ds
        push    C0_B_0D7D6
        push    ds
        push    C2_W_028A2
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_4D5D0:
        enter   2, 0
        mov     word ptr [C2_W_ZONE_CURSOR], 2
        mov     al, byte ptr [C0_B_0D7DD]
        cbw
        mov     bx, ax
        shl     bx, 2
        mov     ax, word ptr [bx+C2_TBL_08E6E]
        mov     dx, word ptr [bx+C0_B_08E70]
        mov     word ptr [C2_W_028D2], ax
        mov     word ptr [C2_W_028D4], dx
        mov     ax, word ptr [bx+C0_TBL_08E76]
        mov     dx, word ptr [bx+C0_TBL_08E78]
        mov     word ptr [C2_W_028D6], ax
        mov     word ptr [C2_W_028D8], dx
        add     bx, 8e72h
        push    ds
        push    bx
        push    ds
        push    C2_W_028CC
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        leave
        retf
L_4D612:
        enter   2, 0
        mov     word ptr [C2_W_ZONE_CURSOR], 3
        mov     al, byte ptr [C0_B_0D7DD]
        cbw
        mov     bx, ax
        shl     bx, 2
        mov     ax, word ptr [bx+C0_TBL_08E72]
        mov     dx, word ptr [bx+C0_TBL_08E74]
        mov     word ptr [C2_W_028FC], ax
        mov     word ptr [C2_W_028FE], dx
        mov     ax, word ptr [bx+C2_TBL_08E7A]
        mov     dx, word ptr [bx+C2_TBL_08E7C]
        mov     word ptr [C2_W_02900], ax
        mov     word ptr [C2_W_02902], dx
        add     bx, 8e76h
        push    ds
        push    bx
        push    ds
        push    C2_W_028F6
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        leave
        retf
L_4D654:
        mov     word ptr [C2_W_ZONE_CURSOR], 4
        mov     al, byte ptr [C1_B_0D7DC]
        cbw
        cwd
        mov     word ptr [C2_W_0292A], ax
        mov     word ptr [C2_W_0292C], dx
        push    ds
        push    C0_B_0D7DD
        push    ds
        push    C2_W_02920
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
xl_zone_field_thunk_cluster:
        db      00h
far_4D678:
        enter   6, 0
        push    di
        push    si
        cmp     byte ptr [C0_B_0D7DD], 1
        jl      br_4D68E
        mov     al, byte ptr [C0_B_0D7DD]
        cmp     byte ptr [C1_B_0D7DC], al
        jge     br_4D693
br_4D68E:
        mov     byte ptr [C0_B_0D7DD], 1
br_4D693:
        mov     ax, C1_TBL_SOUNDS_END
        mov     cx, ds
        cmp     ax, word ptr [C0_W_0D7C2]
        jne     br_4D6AE
        cmp     cx, word ptr [C0_W_0D7C4]
        jne     br_4D6AE
        sub     ax, ax
        mov     word ptr [bp-2], ax
        mov     word ptr [bp-4], ax
        jmp     br_4D6C0
br_4D6AE:
        les     bx, [C0_W_0D7C2]
        mov     ax, word ptr es:[bx+SND_LENGTH]
        mov     dx, word ptr es:[bx+SND_LENGTH+2]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
br_4D6C0:
        sub     ax, ax
        mov     word ptr [C0_TBL_08E74], ax
        mov     word ptr [C0_TBL_08E72], ax
        mov     si, 1
        mov     al, byte ptr [C1_B_0D7DC]
        cbw
        mov     word ptr [bp-6], ax
        inc     ax
        cmp     ax, si
        jb      br_4D709
        mov     di, 8e76h
loop_4D6DA:
        mov     ax, word ptr [bp-6]
        cwd
        push    dx
        push    ax
        lea     ax, [si-1]
        push    0
        push    ax
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        callf   EP_AFLMUL_SEG:EP_AFLMUL_OFF
        push    dx
        push    ax
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     word ptr [di], ax
        mov     word ptr [di+2], dx
        add     di, 4
        mov     ax, word ptr [bp-6]
        inc     ax
        inc     si
        cmp     ax, si
        jae     loop_4D6DA
br_4D709:
        mov     ax, word ptr [bp-4]
        shl     si, 2
        mov     dx, word ptr [bp-2]
        mov     word ptr [si+C0_TBL_08E72], ax
        mov     word ptr [si+C0_TBL_08E74], dx
        pop     si
        pop     di
        leave
        retf
L_4D71E:
        push    ds
        push    C2_W_0294A
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        cmp     word ptr [C2_W_08D5A], 0
        jl      br_4D738
        cmp     word ptr [C2_W_08D5A], 2
        jb      br_4D73E
br_4D738:
        mov     word ptr [C2_W_08D5A], 0
br_4D73E:
        mov     al, byte ptr [C0_B_0D7DD]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C0_TBL_08E74]
        push    word ptr [bx+C0_TBL_08E72]
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    far_4B16C
        add     sp, 8
        imul    bx, word ptr [C2_W_08D5A], 2ah
        callf   [bx+C2_TBL_029D6]
        retf
        db      00h
far_4D16A:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        cmp     byte ptr [C1_B_0D7D9], 1
        jbe     br_4D77B
        shr     byte ptr [C1_B_0D7D9], 1
br_4D77B:
        mov     al, byte ptr [C0_B_0D7DD]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C0_TBL_08E74]
        push    word ptr [bx+C0_TBL_08E72]
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    far_4B16C
        add     sp, 8
        pop     ds
        retf
L_4D79E:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        cmp     byte ptr [C1_B_0D7D9], 40h
        jae     br_4D7AF
        shl     byte ptr [C1_B_0D7D9], 1
br_4D7AF:
        mov     al, byte ptr [C0_B_0D7DD]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C0_TBL_08E74]
        push    word ptr [bx+C0_TBL_08E72]
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    far_4B16C
        add     sp, 8
        pop     ds
        retf
zone_start_fine_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    EP_VOICES_RELEASE_ALL_OFF+C1_CSBASE
        nop
        push    cs
        call    far_4D36C
        pop     ds
        retf
zone_start_fine_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    EP_VOICES_RELEASE_ALL_OFF+C1_CSBASE
        pop     ds
        retf
        db      00h
zone_start_fine_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    C1_SEG
        push    (C2_BASE+L_4D906-C1_SEG*16)
        nop
        push    cs
        call    EP_SMEM_PROC_WRAPPER_OFF+C1_CSBASE
        add     sp, 4
        push    ds
        push    C2_W_02982
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        mov     al, byte ptr [C0_B_0D7DD]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C0_TBL_08E74]
        push    word ptr [bx+C0_TBL_08E72]
        push    0ch
        push    0b5h
        nop
        push    cs
        call    far_47FA4
        add     sp, 8
        mov     al, byte ptr [C0_B_0D7DD]
        cbw
        mov     bx, ax
        shl     bx, 2
        mov     ax, word ptr [bx+C0_TBL_08E76]
        mov     dx, word ptr [bx+C0_TBL_08E78]
        sub     ax, word ptr [bx+C0_TBL_08E72]
        sbb     dx, word ptr [bx+C0_TBL_08E74]
        push    dx
        push    ax
        push    15h
        push    0b5h
        nop
        push    cs
        call    far_47FA4
        add     sp, 8
        mov     al, byte ptr [C0_B_0D7D6]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C2_TBL_018FA]
        push    word ptr [bx+C2_TBL_018F8]
        push    28h
        push    0b5h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        nop
        push    cs
        call    field_engine_redraw
        push    0fh
        push    16h
        nop
        push    cs
        call    far_4B2F8
        add     sp, 4
        pop     ds
        retf
        db      00h
L_4D28A:
        enter   2, 0
        mov     word ptr [C2_W_08D5A], 0
        mov     al, byte ptr [C0_B_0D7DD]
        cbw
        mov     bx, ax
        shl     bx, 2
        mov     ax, word ptr [bx+C2_TBL_08E6E]
        mov     dx, word ptr [bx+C0_B_08E70]
        mov     word ptr [C2_W_029CE], ax
        mov     word ptr [C2_W_029D0], dx
        mov     ax, word ptr [bx+C0_TBL_08E76]
        mov     dx, word ptr [bx+C0_TBL_08E78]
        mov     word ptr [C2_W_029D2], ax
        mov     word ptr [C2_W_029D4], dx
        add     bx, 8e72h
        push    ds
        push    bx
        push    ds
        push    C2_W_029C8
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        leave
        retf
L_4D8CC:
        mov     al, byte ptr [C0_B_0D7DD]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C0_TBL_08E74]
        push    word ptr [bx+C0_TBL_08E72]
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    far_4B16C
        add     sp, 8
        retf
L_4D8EE:
        mov     word ptr [C2_W_08D5A], 1
        push    ds
        push    C0_B_0D7D6
        push    ds
        push    C2_W_029F2
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        nop
L_4D906:
        db      "Zone start fine", 00h
L_4D916:
        db      1eh, 68h, 1ch
        sub     dl, byte ptr [bx+si+C2_TBL_0E80E]
        if      FW_VERSION >= 110
        if      FW_VERSION >= 112
        xchg    bp, ax
        else
        ret
        endif
        db      0fh
        add     sp, 4
        else
        mov     di, 830fh
        les     ax, [si]
        endif
        cmp     word ptr [C2_W_ZONE_END_FINE_CURSOR], 0
        jl      br_4D930
        cmp     word ptr [C2_W_ZONE_END_FINE_CURSOR], 2
        jb      br_4D936
br_4D930:
        mov     word ptr [C2_W_ZONE_END_FINE_CURSOR], 0
br_4D936:
        mov     al, byte ptr [C0_B_0D7DD]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C0_TBL_08E78]
        push    word ptr [bx+C0_TBL_08E76]
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    far_4B16C
        add     sp, 8
        imul    bx, word ptr [C2_W_ZONE_END_FINE_CURSOR], 2ah
        callf   [bx+C2_TBL_02AA6]
        retf
        db      00h
far_4D962:
        push    ds
        mov     cx, DS_SEG
        db      8eh, 0d9h, 80h, 3eh, 0d9h, 0d7h, 01h, 76h, 04h, 0d0h, 2eh
        db      0d9h, 0d7h, 0a0h, 0ddh, 0d7h, 98h, 8bh, 0d8h, 0c1h, 0e3h, 02h, 0ffh, 0b7h, 78h, 8eh, 0ffh
        db      0b7h, 76h, 8eh
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    far_4B16C
        add     sp, 8
        pop     ds
        retf
far_4D996:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        cmp     byte ptr [C1_B_0D7D9], 40h
        jae     br_4D9A7
        shl     byte ptr [C1_B_0D7D9], 1
br_4D9A7:
        mov     al, byte ptr [C0_B_0D7DD]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C0_TBL_08E78]
        push    word ptr [bx+C0_TBL_08E76]
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    far_4B16C
        add     sp, 8
        pop     ds
        retf
zone_end_fine_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    EP_VOICES_RELEASE_ALL_OFF+C1_CSBASE
        nop
        push    cs
        call    far_4D36C
        pop     ds
        retf
zone_end_fine_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    EP_VOICES_RELEASE_ALL_OFF+C1_CSBASE
        pop     ds
        retf
        db      00h
zone_end_fine_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    C1_SEG
        push    (C2_BASE+L_4DAFE-C1_SEG*16)
        nop
        push    cs
        call    EP_SMEM_PROC_WRAPPER_OFF+C1_CSBASE
        add     sp, 4
        push    ds
        push    C2_W_02A54
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        mov     al, byte ptr [C0_B_0D7DD]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C0_TBL_08E78]
        push    word ptr [bx+C0_TBL_08E76]
        push    0ch
        push    0b5h
        nop
        push    cs
        call    far_47FA4
        add     sp, 8
        mov     al, byte ptr [C0_B_0D7DD]
        cbw
        mov     bx, ax
        shl     bx, 2
        mov     ax, word ptr [bx+C0_TBL_08E76]
        mov     dx, word ptr [bx+C0_TBL_08E78]
        sub     ax, word ptr [bx+C0_TBL_08E72]
        sbb     dx, word ptr [bx+C0_TBL_08E74]
        push    dx
        push    ax
        push    15h
        push    0b5h
        nop
        push    cs
        call    far_47FA4
        add     sp, 8
        mov     al, byte ptr [C0_B_0D7D6]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C2_TBL_018FA]
        push    word ptr [bx+C2_TBL_018F8]
        push    28h
        push    0b5h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        nop
        push    cs
        call    field_engine_redraw
        push    0fh
        push    16h
        nop
        push    cs
        call    far_4B2F8
        add     sp, 4
        pop     ds
        retf
        db      00h
L_4DA82:
        enter   2, 0
        mov     word ptr [C2_W_ZONE_END_FINE_CURSOR], 0
        mov     al, byte ptr [C0_B_0D7DD]
        cbw
        mov     bx, ax
        shl     bx, 2
        mov     ax, word ptr [bx+C0_TBL_08E72]
        mov     dx, word ptr [bx+C0_TBL_08E74]
        mov     word ptr [C2_W_02A9E], ax
        mov     word ptr [C2_W_02AA0], dx
        mov     ax, word ptr [bx+C2_TBL_08E7A]
        mov     dx, word ptr [bx+C2_TBL_08E7C]
        mov     word ptr [C2_W_02AA2], ax
        mov     word ptr [C2_W_02AA4], dx
        add     bx, 8e76h
        push    ds
        push    bx
        push    ds
        push    C2_W_02A98
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        leave
        retf
L_4DAC4:
        mov     al, byte ptr [C0_B_0D7DD]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C0_TBL_08E78]
        push    word ptr [bx+C0_TBL_08E76]
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    far_4B16C
        add     sp, 8
        retf
L_4DAE6:
        mov     word ptr [C2_W_ZONE_END_FINE_CURSOR], 1
        push    ds
        push    C0_B_0D7D6
        push    ds
        push    C2_W_02AC2
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        nop
L_4DAFE:
        db      "Zone end fine", 00h
far_4DB0C:
        push    ds
        push    C2_W_02AEC
        nop
        push    cs
        if      FW_VERSION >= 112
        db      0e8h, 9fh, 0dh
        elseif  FW_VERSION >= 110
        db      0e8h, 0cdh, 0dh
        else
        db      0e8h, 0c9h, 0dh
        endif
        add     sp, 4
        mov     al, byte ptr [C1_B_0D7DC]
        mov     byte ptr [C0_B_098B8], al
        callf   [C2_FP_02B72]
        retf
        db      00h
zone_count_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    EP_L_4D23C_SEG
        push    EP_L_4D23C_OFF
        nop
        push    cs
        call    EP_SMEM_PROC_WRAPPER_OFF+C1_CSBASE
        add     sp, 4
        push    ds
        push    C2_W_02B0A
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        push    2
        mov     al, byte ptr [C0_B_098B8]
        cbw
        cwd
        push    dx
        push    ax
        push    0dh
        push    9dh
        nop
        push    cs
        call    EP_DRAW_UNSIGNED_VALUE_OFF+C1_CSBASE
        add     sp, 0ah
        nop
        push    cs
        call    field_engine_redraw
        pop     ds
        retf
        db      00h
zone_count_close:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_4D36C
        pop     ds
        retf
xl_number_of_zones_thunk:
        db      00h
zone_count_do_it:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C0_B_098B8]
        mov     byte ptr [C1_B_0D7DC], al
        nop
        push    cs
        call    far_4D678
        nop
        push    cs
        call    zone_count_close
        pop     ds
        retf
L_4D22A:
        push    ds
        push    C0_B_098B8
        push    ds
        push    C2_W_02B64
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      90h
L_4D23C:
        db      "Number of Zones"
        db      00h
far_4DBAA:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 112
        SKIP_DRUM_HOOK EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        else
        SKIP_DRUM_HOOK L_4DF84
        endif
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr [C2_W_DRUM_SELECT_HOOK_OFF], ax
        mov     word ptr [C2_W_DRUM_SELECT_HOOK_SEG], dx
        leave
        retf
        db      00h
mixer_select_pgm_drum_1:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     byte ptr [C2_B_PAD_DRUM], 0
        callf   [C2_W_DRUM_SELECT_HOOK_OFF]
        pop     ds
        retf
        db      00h
mixer_select_pgm_drum_2:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     byte ptr [C2_B_PAD_DRUM], 1
        callf   [C2_W_DRUM_SELECT_HOOK_OFF]
        pop     ds
        retf
        db      00h
mixer_select_pgm_drum_3:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     byte ptr [C2_B_PAD_DRUM], 2
        callf   [C2_W_DRUM_SELECT_HOOK_OFF]
        pop     ds
        retf
        db      00h
mixer_select_pgm_drum_4:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     byte ptr [C2_B_PAD_DRUM], 3
        callf   [C2_W_DRUM_SELECT_HOOK_OFF]
        pop     ds
        retf
        db      00h
mixer_select_pgm_setup:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        if      FW_VERSION >= 112
        cmp     word ptr [C2_W_DRUM_SELECT_HOOK_OFF], 2d82h
        else
        cmp     word ptr [C2_W_DRUM_SELECT_HOOK_OFF], 2d42h
        endif
        jne     br_4DC29
        cmp     word ptr [C2_W_DRUM_SELECT_HOOK_SEG], C2_SEG
        jne     br_4DC29
        callf   EP_FX_NOT_INSTALLED_F5_SEG:EP_FX_NOT_INSTALLED_F5_OFF
br_4DC29:
        pop     ds
        retf
        db      00h
mixer_select_pgm_fxedit:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        if      FW_VERSION >= 112
        cmp     word ptr [C2_W_DRUM_SELECT_HOOK_OFF], 2d82h
        else
        cmp     word ptr [C2_W_DRUM_SELECT_HOOK_OFF], 2d42h
        endif
        jne     br_4DC47
        cmp     word ptr [C2_W_DRUM_SELECT_HOOK_SEG], C2_SEG
        jne     br_4DC47
        callf   EP_MIXER_SETUP_F6_SEG:EP_MIXER_SETUP_F6_OFF
br_4DC47:
        pop     ds
        retf
        db      00h
mixer_select_pgm_paint:
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    EP_DISP_CLEAR_ALL_OFF+C1_CSBASE
        push    31h
        push    0f7h
        push    0
        push    0
        nop
        push    cs
        call    EP_DRAW_SHADOW_BOX_OFF+C1_CSBASE
        add     sp, 8
        push    C1_SEG
        push    (C2_BASE+L_4D3EE-C1_SEG*16)
        push    14h
        push    10h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        xor     si, si
loop_4DC7B:
        lea     ax, [si+31h]
        mov     bx, C2_W_0FB86
        mov     es, word ptr [C2_W_08120]
        mov     byte ptr es:[bx+5], al
        push    es
        push    bx
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        cmp     ax, si
        jne     L_4D33C
        mov     ax, 2
        jmp     SHORT br_4DC9D
        db      90h
L_4D33C:
        mov     ax, 1
br_4DC9D:
        push    ax
        lea     ax, [si+1]
        push    ax
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
        lea     ax, [si+1]
        mov     si, ax
        cmp     si, 4
        jl      loop_4DC7B
        if      FW_VERSION >= 112
        cmp     word ptr [C2_W_DRUM_SELECT_HOOK_OFF], 2d82h
        else
        cmp     word ptr [C2_W_DRUM_SELECT_HOOK_OFF], 2d42h
        endif
        jne     br_4DCE8
        cmp     word ptr [C2_W_DRUM_SELECT_HOOK_SEG], C2_SEG
        jne     br_4DCE8
        push    C1_SEG
        if      FW_VERSION >= 112
        push    EP_L_4D772_OFF
        else
        push    C2_W_0FBB4
        endif
        push    2
        push    5
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
        push    EP_L_4DD78_SEG
        push    EP_L_4DD78_OFF
        push    2
        push    6
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
br_4DCE8:
        pop     ds
        pop     si
        retf
        db      00h
L_4DCEC:
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    EP_FAR_3E8D0_OFF+C1_CSBASE
        mov     si, ax
        or      si, ax
        jl      br_4DD06
        cmp     si, 3
        jg      br_4DD06
        mov     byte ptr [C2_B_PAD_DRUM], al
br_4DD06:
        push    EP_PGM_ASSIGN_SCREEN_DRAW_SEG
        push    EP_PGM_ASSIGN_SCREEN_DRAW_OFF
        nop
        push    cs
        call    far_4DBAA
        add     sp, 4
        pop     ds
        pop     si
        retf
        db      00h
X_4DD18:
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    EP_FAR_3E8D0_OFF+C1_CSBASE
        mov     si, ax
        or      si, ax
        jl      br_4DD32
        cmp     si, 3
        jg      br_4DD32
        mov     byte ptr [C2_B_PAD_DRUM], al
br_4DD32:
        push    EP_FAR_50EE2_SEG
        push    EP_FAR_50EE2_OFF
        nop
        push    cs
        call    far_4DBAA
        add     sp, 4
        pop     ds
        pop     si
        retf
        db      90h
L_4DD44:
        db      "DRUM _"
        db      00h, 00h
L_4D3EE:
        db      "Please select a DRUM program to edit."
        db      00h
L_4D772:
        db      "SETUP"
        db      00h
L_4DD78:
        db      "FXedit"
        db      00h, 00h
pgm_assign_screen_draw:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    2bbch
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        mov     word ptr [C2_W_PARAM_HOOK_OFF], (C2_BASE+L_4E144-C1_SEG*16)
        mov     word ptr [C2_W_PARAM_HOOK_SEG], C1_SEG
        push    1
        nop
        push    cs
        call    EP_PAD_ROUTE_MODE_SET_OFF+C1_CSBASE
        add     sp, 2
        mov     byte ptr [C2_B_PAD_VELOCITY], 7fh
        mov     cl, byte ptr [C2_B_PAD_NOTE]
        sub     ch, ch
        cmp     cx, 23h
        jl      br_4DDC2
        cmp     cx, 62h
        jg      br_4DDC2
        mov     dx, 1
        jmp     br_4DDC4
br_4DDC2:
        xor     dx, dx
br_4DDC4:
        or      dx, dx
        jne     br_4DDCD
        mov     byte ptr [C2_B_PAD_NOTE], 23h
br_4DDCD:
        cmp     word ptr [C2_W_PGM_ASSIGN_CURSOR], 0
        jl      L_4D7DB
        cmp     word ptr [C2_W_PGM_ASSIGN_CURSOR], 0bh
        jb      br_4DDE1
L_4D7DB:
        mov     word ptr [C2_W_PGM_ASSIGN_CURSOR], 0
br_4DDE1:
        imul    bx, word ptr [C2_W_PGM_ASSIGN_CURSOR], 2ah
        callf   [bx+C2_TBL_02C9C]
        pop     ds
        retf
pgm_assign_pad:
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     cx, ax
        or      cl, cl
        je      br_4DE48
        mov     di, word ptr [C2_B_PAD_DRUM]
        and     di, 0ffh
        mov     al, ch
        mov     byte ptr [C2_B_CUR_PAD], ch
        lea     ax, [di+60h]
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, word ptr [C2_B_CUR_PAD]
        and     si, 0ffh
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     si, ax
        cmp     si, 23h
        jl      br_4DE36
        cmp     si, 62h
        jg      br_4DE36
        mov     dx, 1
        jmp     br_4DE38
        db      90h
br_4DE36:
        xor     dx, dx
br_4DE38:
        or      dx, dx
        je      br_4DE3F
        mov     byte ptr [C2_B_PAD_NOTE], al
br_4DE3F:
        imul    bx, word ptr [C2_W_PGM_ASSIGN_CURSOR], 2ah
        callf   [bx+C2_TBL_02C9C]
br_4DE48:
        pop     ds
        pop     si
        pop     di
        retf
pgm_assign_paint:
        enter   14h, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        mov     si, ax
        imul    bx, si, 184h
        mov     al, byte ptr [bx+C0_TBL_09160]
        mov     word ptr [bp-10h], ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        mov     cx, ax
        add     cx, 5ch
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     di, ax
        mov     word ptr [bp-12h], dx
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     ax, di
        sub     ax, 32ah
        mov     si, ax
        mov     word ptr [bp-0ah], dx
        mov     bl, byte ptr [C2_B_PAD_NOTE]
        sub     bh, bh
        shl     bx, 2
        add     bx, di
        mov     es, dx
        mov     ax, word ptr es:[bx+752h]
        mov     dx, word ptr es:[bx+754h]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 60h
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    ds
        push    C2_W_02C0E
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        push    8ch
        nop
        push    cs
        call    EP_L_3EA6A_OFF+C1_CSBASE
        add     sp, 2
        push    2
        mov     ax, word ptr [bp-10h]
        inc     ax
        cwd
        push    dx
        push    ax
        push    2
        push    1bh
        nop
        push    cs
        call    EP_DRAW_UNSIGNED_VALUE_OFF+C1_CSBASE
        add     sp, 0ah
        mov     ax, di
        mov     dx, word ptr [bp-12h]
        add     ax, 2
        push    dx
        push    ax
        push    2
        push    2dh
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        mov     al, byte ptr [C2_B_CUR_PAD]
        sub     ah, ah
        push    ax
        push    0ch
        push    21h
        nop
        push    cs
        call    far_47BC0
        add     sp, 6
        les     bx, [bp-4]
        mov     di, word ptr [C2_B_CUR_PAD]
        and     di, 0ffh
        mov     al, byte ptr es:[bx+di]
        cbw
        push    ax
        push    0ch
        push    57h
        nop
        push    cs
        call    far_47C7A
        add     sp, 6
        cmp     byte ptr [C2_B_PAD_ASSIGN_MASTER], 0
        je      br_4DF44
        mov     ax, (C2_BASE+L_4E688-C2_SEG*16)
        mov     dx, C2_SEG
        jmp     br_4DF4A
        db      90h
br_4DF44:
        mov     ax, (C2_BASE+L_4E690-C2_SEG*16)
        mov     dx, C2_SEG
br_4DF4A:
        push    dx
        push    ax
        push    0ch
        push    0c3h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        push    ax
        push    16h
        push    27h
        nop
        push    cs
        call    far_47C7A
        add     sp, 6
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    16h
        push    51h
        nop
        push    cs
        call    far_47D5E
        add     sp, 8
        mov     es, word ptr [bp-0ah]
        mov     bl, byte ptr es:[si]
        sub     bh, bh
        shl     bx, 2
        push    word ptr [bx+C2_TBL_02C00]
        push    word ptr [bx+C2_TBL_02BFE]
        push    28h
        push    27h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        mov     es, word ptr [bp-0ah]
        mov     al, byte ptr es:[si]
        sub     ah, ah
        dec     ax
        je      br_4DFB8
        dec     ax
        jge     br_4DFAD
        jmp     br_4E072
br_4DFAD:
        jno     br_4DFB2
        jmp     br_4E072
br_4DFB2:
        dec     ax
        jle     br_4DFDE
        jmp     br_4E072
br_4DFB8:
        push    EP_FAR_4E698_SEG
        push    EP_FAR_4E698_OFF
        push    1fh
        push    6dh
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        push    EP_FAR_4E698_SEG
        push    EP_FAR_4E698_OFF
        push    28h
        push    6dh
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        jmp     br_4E038
br_4DFDE:
        push    EP_L_4E0A8_SEG
        push    EP_L_4E0A8_OFF
        push    1fh
        push    61h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        push    EP_L_4E0A8_SEG
        push    EP_L_4E0A8_OFF
        push    28h
        push    61h
        nop
        push    cs
        call    EP_DRAW_STRING_AT_OFF+C1_CSBASE
        add     sp, 8
        push    3
        mov     es, word ptr [bp-0ah]
        mov     al, byte ptr es:[si+1]
        sub     ah, ah
        push    0
        push    ax
        push    1fh
        push    91h
        nop
        push    cs
        call    EP_DRAW_UNSIGNED_VALUE_OFF+C1_CSBASE
        add     sp, 0ah
        push    3
        mov     es, word ptr [bp-0ah]
        mov     al, byte ptr es:[si+3]
        sub     ah, ah
        push    0
        push    ax
        push    28h
        push    91h
        nop
        push    cs
        call    EP_DRAW_UNSIGNED_VALUE_OFF+C1_CSBASE
        add     sp, 0ah
br_4E038:
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        mov     es, word ptr [bp-0ah]
        mov     al, byte ptr es:[si+2]
        sub     ah, ah
        push    ax
        push    1fh
        push    0c7h
        nop
        push    cs
        call    far_47CB4
        add     sp, 0ah
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        mov     es, word ptr [bp-0ah]
        mov     al, byte ptr es:[si+4]
        sub     ah, ah
        push    ax
        push    28h
        push    0c7h
        nop
        push    cs
        call    far_47CB4
        add     sp, 0ah
br_4E072:
        nop
        push    cs
        call    field_engine_redraw
        mov     ax, word ptr [bp-6]
        or      ax, word ptr [bp-8]
        je      br_4E08C
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        mov     word ptr [C0_W_0D7C2], ax
        mov     word ptr [C0_W_0D7C4], dx
br_4E08C:
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h
far_4E092:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    pgm_assign_refresh
        push    EP_PGM_ASSIGN_SCREEN_DRAW_SEG
        push    EP_PGM_ASSIGN_SCREEN_DRAW_OFF
        nop
        push    cs
        call    far_4DBAA
        add     sp, 4
        pop     ds
        retf
        db      00h
far_4E0AE:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    pgm_assign_refresh
        callf   EP_PGM_PARAMS_ENTER_SEG:EP_PGM_PARAMS_ENTER_OFF
        pop     ds
        retf
far_4E0C0:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    pgm_assign_refresh
        callf   EP_FAR_4EC12_SEG:EP_FAR_4EC12_OFF
        pop     ds
        retf
far_4E0D2:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    pgm_assign_refresh
        callf   EP_FAR_4EF20_SEG:EP_FAR_4EF20_OFF
        pop     ds
        retf
far_4E0E4:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    pgm_assign_refresh
        push    EP_PGM_ASSIGN_SCREEN_DRAW_SEG
        push    EP_PGM_ASSIGN_SCREEN_DRAW_OFF
        callf   EP_FAR_50972_SEG:EP_FAR_50972_OFF
        add     sp, 4
        pop     ds
        retf
        db      00h
pgm_assign_open_window:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
resume_4E106:
        imul    bx, word ptr [C2_W_PGM_ASSIGN_CURSOR], 2ah
        mov     ax, word ptr [bx+C2_TBL_02CB6]
        or      ax, word ptr [bx+C2_TBL_02CB4]
        je      br_4E123
        nop
        push    cs
        call    pgm_assign_refresh
        imul    bx, word ptr [C2_W_PGM_ASSIGN_CURSOR], 2ah
        callf   [bx+C2_TBL_02CB4]
br_4E123:
        pop     ds
        retf
        db      00h
pgm_assign_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   EP_PAD_AUDITION_NOTE_OFF_SEG:EP_PAD_AUDITION_NOTE_OFF_OFF
        sub     ax, ax
        mov     word ptr [C2_W_PARAM_HOOK_SEG], ax
        mov     word ptr [C2_W_PARAM_HOOK_OFF], ax
        push    ax
        nop
        push    cs
        call    EP_PAD_ROUTE_MODE_SET_OFF+C1_CSBASE
        add     sp, 2
        pop     ds
        retf
L_4E144:
        imul    bx, word ptr [C2_W_PGM_ASSIGN_CURSOR], 2ah
        callf   [bx+C2_TBL_02C9C]
        nop
        push    cs
        call    EP_DISP_REQUEST_FLUSH_OFF+C1_CSBASE
        retf
        if      FW_VERSION >= 112
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        else
        db      00h
L_4D7F6:
        endif
        mov     word ptr [C2_W_PGM_ASSIGN_CURSOR], 0
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        imul    ax, ax, 184h
        add     ax, 9160h
        push    ds
        push    ax
        push    ds
        push    C2_W_02C8E
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
far_4E182:
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        imul    bx, ax, 184h
        mov     al, byte ptr [bx+C0_TBL_09160]
        push    ax
        push    EP_PGM_ASSIGN_SCREEN_DRAW_SEG
        push    EP_PGM_ASSIGN_SCREEN_DRAW_OFF
        if      FW_VERSION >= 112
        nop
        push    cs
        call    far_4EFFA
        else
        callf   C2_SEG:EP_FAR_4EFFA_OFF
        endif
        add     sp, 6
        retf
        if      FW_VERSION >= 112
        db      00h
pgm_assign_focus_pgm:
        else
        if      FW_VERSION >= 110
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        else
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h
        endif
PGM_ASSIGN_FOCUS_PGM:
        endif
        mov     word ptr [C2_W_PGM_ASSIGN_CURSOR], 1
        push    ds
        push    C0_B_0D7C1
        push    ds
        push    C2_W_02CB8
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
far_4E1B8:
        push    bp
        mov     bp, sp
        push    si
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        add     cx, 60h
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, word ptr [bp+6]
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     si, ax
        cmp     si, 23h
        jl      L_4D88A
        cmp     si, 62h
        jg      L_4D88A
        mov     dx, 1
        jmp     br_4E1EC
L_4D88A:
        xor     dx, dx
br_4E1EC:
        or      dx, dx
        je      br_4E1F3
        mov     byte ptr [C2_B_PAD_NOTE], al
br_4E1F3:
        imul    bx, word ptr [C2_W_PGM_ASSIGN_CURSOR], 2ah
        callf   [bx+C2_TBL_02C9C]
        pop     si
        leave
        retf
        db      00h
        ifdef   GROWTH_PROOF
        db      GROWTH_PROOF dup (90h)
        endif
pgm_assign_focus_pad:
        if      FW_VERSION >= 110
        mov     word ptr [C2_W_PGM_ASSIGN_CURSOR], 2
        else
        mov     word ptr [C2_W_PGM_ASSIGN_CURSOR], 2
        endif
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 60h
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     cl, byte ptr [C2_B_CUR_PAD]
        sub     ch, ch
        add     ax, cx
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_PGM_ASSIGN_CURSOR], 2ah
        add     ax, 2c8eh
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
L_4E234:
        push    bp
        mov     bp, sp
        mov     bx, word ptr [bp+6]
        cmp     bx, 23h
        jl      br_4E24A
        cmp     bx, 62h
        jg      br_4E24A
        mov     dx, 1
        jmp     br_4E24C
        db      90h
br_4E24A:
        xor     dx, dx
br_4E24C:
        or      dx, dx
        je      br_4E254
        mov     byte ptr [C2_B_PAD_NOTE], bl
br_4E254:
        leave
        retf
pgm_assign_focus_pad_assign:
        push    di
        push    si
        mov     word ptr [C2_W_PGM_ASSIGN_CURSOR], 3
        mov     si, word ptr [C2_B_PAD_DRUM]
        and     si, 0ffh
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        imul    di, ax, 18h
        lea     ax, [si+5ch]
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        cmp     byte ptr es:[bx+di-32ah], 0
        jne     br_4E28C
        xor     ax, ax
        cwd
        jmp     br_4E292
        db      90h
br_4E28C:
        mov     ax, (C2_BASE+pgm_assign_focus_alt_note1-C2_SEG*16)
        mov     dx, C2_SEG
br_4E292:
        mov     bx, 2d0ch
        mov     word ptr [bx+16h], ax
        mov     word ptr [bx+18h], dx
        mov     al, byte ptr [C2_B_PAD_ASSIGN_MASTER]
        mov     byte ptr [C0_B_098B8], al
        push    ds
        push    C0_B_098B8
        push    ds
        push    bx
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        pop     si
        pop     di
        retf
L_4E2B2:
        push    bp
        mov     bp, sp
        sub     ah, ah
        mov     al, byte ptr [bp+6]
        push    ax
        callf   EP_PAD_ASSIGN_MASTER_SET_SEG:EP_PAD_ASSIGN_MASTER_SET_OFF
        leave
        retf
pgm_assign_focus_note:
        mov     word ptr [C2_W_PGM_ASSIGN_CURSOR], 4
        push    ds
        push    C2_B_PAD_NOTE
        push    ds
        push    C2_W_02D36
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_4E2DA:
        push    C1_SEG
        push    C2_W_0FBC2
        nop
        push    cs
        call    far_4FA52
        add     sp, 4
        retf
        db      00h
pgm_assign_focus_sound:
        enter   8, 0
        push    si
        mov     word ptr [C2_W_PGM_ASSIGN_CURSOR], 5
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        sub     ax, 23h
        mov     word ptr [bp-6], ax
        imul    si, ax, 18h
        les     bx, [bp-4]
        sub     ah, ah
        mov     al, byte ptr es:[bx+si+1eh]
        or      ax, ax
        je      br_4E338
        dec     ax
        je      br_4E342
        mov     word ptr [C2_W_02D76], (C2_BASE+pgm_assign_mode_field-C2_SEG*16)
        mov     word ptr [C2_W_02D78], C2_SEG
        jmp     br_4E34E
br_4E338:
        sub     ax, ax
        mov     word ptr [C2_W_02D78], ax
        mov     word ptr [C2_W_02D76], ax
        jmp     br_4E34E
br_4E342:
        mov     word ptr [C2_W_02D76], (C2_BASE+pgm_assign_focus_alt_note1-C2_SEG*16)
        mov     word ptr [C2_W_02D78], C2_SEG
br_4E34E:
        mov     ax, word ptr [bp-6]
        shl     ax, 2
        add     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        add     ax, 7deh
        push    dx
        push    ax
        push    ds
        push    C2_W_02D60
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        pop     si
        leave
        retf
L_4DD6E:
        push    si
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        mov     si, word ptr [C2_B_PAD_NOTE]
        and     si, 0ffh
        shl     si, 2
        add     cx, 5ch
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx+si+752h]
        mov     dx, word ptr es:[bx+si+754h]
        mov     word ptr [C0_W_0D7C2], ax
        mov     word ptr [C0_W_0D7C4], dx
        push    EP_PGM_ASSIGN_SCREEN_DRAW_SEG
        push    EP_PGM_ASSIGN_SCREEN_DRAW_OFF
        callf   EP_FAR_4C0D8_SEG:EP_FAR_4C0D8_OFF
        add     sp, 4
        pop     si
        retf
        db      00h
pgm_assign_focus_6:
        mov     word ptr [C2_W_PGM_ASSIGN_CURSOR], 6
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     cx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     cx, ax
        sub     cx, 32ah
        push    dx
        push    cx
        imul    ax, word ptr [C2_W_PGM_ASSIGN_CURSOR], 2ah
        add     ax, 2c8eh
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
L_4E3EC:
        push    si
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        imul    bx, ax, 18h
        mov     al, byte ptr [C2_B_PAD_DRUM]
        add     ax, 5ch
        push    ax
        mov     si, bx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+si-32ah]
        sub     ah, ah
        or      ax, ax
        je      br_4E425
        dec     ax
        je      br_4E420
        nop
        push    cs
        call    pgm_assign_mode_field
        pop     si
        retf
        db      90h
br_4E420:
        nop
        push    cs
        call    pgm_assign_focus_alt_note1
br_4E425:
        pop     si
        retf
        db      00h
pgm_assign_mode_field:
        push    si
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     bx, ax
        sub     bx, 32ah
        mov     si, bx
        cmp     byte ptr es:[bx], 0
        je      br_4E472
        cmp     byte ptr es:[si], 1
        je      br_4E472
        mov     word ptr [C2_W_PGM_ASSIGN_CURSOR], 7
        lea     ax, [bx+1]
        push    dx
        push    ax
        push    ds
        push    C2_W_02DB4
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        pop     si
        retf
        db      90h
br_4E472:
        nop
        push    cs
        call    pgm_assign_focus_6
        pop     si
        retf
        db      00h
L_4E47A:
        enter   4, 0
        push    di
        push    si
        mov     di, word ptr [bp+6]
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     bx, ax
        sub     bx, 32ah
        mov     si, bx
        mov     al, byte ptr es:[bx+3]
        sub     ah, ah
        cmp     ax, di
        jg      br_4E4B7
        lea     ax, [di+1]
        mov     byte ptr es:[si+3], al
br_4E4B7:
        pop     si
        pop     di
        leave
        retf
        db      00h
pgm_assign_focus_threshold2:
        push    si
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     bx, ax
        sub     bx, 32ah
        mov     si, bx
        cmp     byte ptr es:[bx], 0
        je      br_4E514
        cmp     byte ptr es:[si], 1
        je      br_4E514
        mov     word ptr [C2_W_PGM_ASSIGN_CURSOR], 8
        mov     al, byte ptr es:[si+1]
        sub     ah, ah
        inc     ax
        cwd
        mov     word ptr [C2_W_02DE4], ax
        mov     word ptr [C2_W_02DE6], dx
        lea     ax, [si+3]
        push    es
        push    ax
        push    ds
        push    C2_W_02DDE
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        pop     si
        retf
br_4E514:
        nop
        push    cs
        call    pgm_assign_focus_6
        pop     si
        retf
        db      00h
pgm_assign_focus_alt_note1:
        mov     word ptr [C2_W_PGM_ASSIGN_CURSOR], 9
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     bx, ax
        sub     bx, 32ah
        sub     ah, ah
        mov     al, byte ptr es:[bx]
        or      ax, ax
        je      br_4E55E
        dec     ax
        je      br_4E564
        mov     word ptr [C2_W_02E22], P_02C8
        mov     word ptr [C2_W_02E24], C2_SEG
        jmp     SHORT br_4E570
        db      90h
br_4E55E:
        nop
        push    cs
        call    pgm_assign_focus_6
        retf
br_4E564:
        mov     word ptr [C2_W_02E22], (C2_BASE+pgm_assign_focus_6-C2_SEG*16)
        mov     word ptr [C2_W_02E24], C2_SEG
br_4E570:
        lea     ax, [bx+2]
        push    dx
        push    ax
        push    ds
        push    C2_W_02E08
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
pgm_assign_focus_alt_note2:
        mov     word ptr [C2_W_PGM_ASSIGN_CURSOR], 0ah
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     bx, ax
        sub     bx, 32ah
        sub     ah, ah
        mov     al, byte ptr es:[bx]
        or      ax, ax
        je      br_4E5C4
        dec     ax
        je      br_4E5CA
        mov     word ptr [C2_W_02E4C], P_035C
        mov     word ptr [C2_W_02E4E], C2_SEG
        jmp     SHORT br_4E5D6
        db      90h
br_4E5C4:
        nop
        push    cs
        call    pgm_assign_focus_6
        retf
br_4E5CA:
        mov     word ptr [C2_W_02E4C], (C2_BASE+pgm_assign_focus_6-C2_SEG*16)
        mov     word ptr [C2_W_02E4E], C2_SEG
br_4E5D6:
        lea     ax, [bx+4]
        push    dx
        push    ax
        push    ds
        push    C2_W_02E32
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
L_4E5E8:
        push    ds
        mov     cx, DS_SEG
        db      8eh, 0d9h, 80h, 3eh, 5ch, 2eh, 00h, 74h, 05h, 90h, 0eh, 0e8h
        if      FW_VERSION >= 110
        if      FW_VERSION >= 112
        db      3ch, 00h, 0a0h, 0beh
        else
        db      3ch, 00h, 0a0h, 0beh, 0d7h, 0ch, 90h, 0a2h, 60h, 8dh, 0a0h, 0c0h, 0d7h, 0a2h, 61h, 8dh
        db      0a0h, 0c6h, 0d7h, 0a2h, 62h, 8dh, 32h, 0c0h, 0a2h, 63h, 8dh, 0a2h, 64h, 8dh, 0c6h, 06h
        db      65h, 8dh, 40h
        inc     byte ptr [C2_B_02E5C]
        db      0ffh, 36h, 64h, 8dh, 0ffh, 36h, 62h, 8dh, 0ffh
        db      36h, 60h, 8dh, 9ah
        endif
far_4E5FC:
        if      FW_VERSION >= 112
        xlat
        or      al, 90h
        mov     byte ptr [C2_W_08D60], al
        mov     al, byte ptr [C2_B_PAD_NOTE]
        mov     byte ptr [C2_B_08D61], al
        mov     al, byte ptr [C2_B_PAD_VELOCITY]
        mov     byte ptr [C2_W_08D62], al
        xor     al, al
        mov     byte ptr [C2_B_08D63], al
        mov     byte ptr [C2_W_08D64], al
        mov     byte ptr [C2_B_08D65], 40h
        inc     byte ptr [C2_B_02E5C]
        push    word ptr [C2_W_08D64]
        push    word ptr [C2_W_08D62]
        push    word ptr [C2_W_08D60]
        callf   EP_MIDI_CHANNEL_MSG_DISPATCH_SEG:EP_MIDI_CHANNEL_MSG_DISPATCH_OFF
        add     sp, 6
        else
        db      64h
        if      FW_VERSION >= 111
        db      28h, 20h
        else
        db      28h, 10h
        endif
        xor     ax, 0c483h
        push    es
        endif
        pop     ds
        retf
        db      00h
        else
        db      3ch, 00h, 0a0h, 0beh, 0d7h, 0ch, 90h, 0a2h, 5ah, 8dh, 0a0h, 0c0h, 0d7h, 0a2h, 5bh, 8dh
        db      0a0h, 0c6h, 0d7h, 0a2h, 5ch, 8dh, 32h, 0c0h, 0a2h, 5dh, 8dh, 0a2h, 5eh, 8dh, 0c6h, 06h
        db      5fh, 8dh, 40h
        inc     byte ptr [C2_B_02E5C]
        db      0ffh, 36h, 5eh, 8dh, 0ffh, 36h, 5ch, 8dh, 0ffh
        db      36h, 5ah, 8dh, 9ah
        dw      EP_MIDI_CHANNEL_MSG_DISPATCH_OFF, EP_MIDI_CHANNEL_MSG_DISPATCH_SEG
        db      83h, 0c4h, 06h, 1fh, 0cbh, 00h
        endif
pad_audition_note_off:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        cmp     byte ptr [C2_B_02E5C], 0
        je      br_4E661
        mov     al, byte ptr [C2_W_08D60]
        and     al, 0fh
        or      al, 80h
        mov     byte ptr [C2_W_08D60], al
        push    word ptr [C2_W_08D64]
        push    word ptr [C2_W_08D62]
        push    word ptr [C2_W_08D60]
        callf   EP_MIDI_CHANNEL_MSG_DISPATCH_SEG:EP_MIDI_CHANNEL_MSG_DISPATCH_OFF
        add     sp, 6
br_4E661:
        mov     byte ptr [C2_B_02E5C], 0
        pop     ds
        retf
L_4E668:
        db      "NORMAL", 00h, 00h
L_4DD10:
        db      "SIMULT", 00h, 00h
L_4DD18:
        db      "VEL SW", 00h, 00h
L_4DD20:
        db      "DCY SW", 00h, 00h
L_4E688:
        db      "^MASTER", 00h
L_4E690:
        db      "PROGRAM", 00h
far_4E698:
        db      "Also play note:", 00h
L_4E0A8:
        db      "If over:___, use:", 00h
pgm_params_enter:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    2e5eh
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        mov     word ptr [C2_W_PARAM_HOOK_OFF], (C2_BASE+L_4E9EA-C2_SEG*16)
        mov     word ptr [C2_W_PARAM_HOOK_SEG], C2_SEG
        push    1
        callf   EP_PAD_ROUTE_MODE_SET_SEG:EP_PAD_ROUTE_MODE_SET_OFF
        add     sp, 2
        mov     byte ptr [C2_B_PAD_VELOCITY], 7fh
        cmp     word ptr [C2_W_PARAMS_CURSOR], 0
        jl      L_4E0F5
        cmp     word ptr [C2_W_PARAMS_CURSOR], 9
        jb      br_4E6FB
L_4E0F5:
        mov     word ptr [C2_W_PARAMS_CURSOR], 0
br_4E6FB:
        imul    bx, word ptr [C2_W_PARAMS_CURSOR], 2ah
        callf   [bx+C2_TBL_PARAMS_FIELD_THUNK]
        pop     ds
        retf
far_4E706:
        if      FW_VERSION >= 120
        db      57h, 56h, 1eh, 0b9h, 2bh
        elseif  FW_VERSION >= 114
        db      57h, 56h, 1eh, 0b9h, 0cbh
        elseif  FW_VERSION >= 112
        db      57h, 56h, 1eh, 0b9h, 0abh
        elseif  FW_VERSION >= 111
        db      57h, 56h, 1eh, 0b9h, 8ch
        elseif  FW_VERSION >= 110
        db      57h, 56h, 1eh, 0b9h, 7ch
        else
        db      57h, 56h, 1eh, 0b9h, 2eh
        endif
        if      FW_VERSION >= 120
        pop     ax
        else
        push    di
        endif
        mov     ds, cx
        mov     cx, ax
        or      cl, cl
        je      br_4E762
        mov     di, word ptr [C2_B_PAD_DRUM]
        and     di, 0ffh
        mov     al, ch
        mov     byte ptr [C2_B_CUR_PAD], ch
        lea     ax, [di+60h]
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, word ptr [C2_B_CUR_PAD]
        and     si, 0ffh
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     si, ax
        cmp     si, 23h
        jl      br_4E750
        cmp     si, 62h
        jg      br_4E750
        mov     dx, 1
        jmp     br_4E752
        db      90h
br_4E750:
        xor     dx, dx
br_4E752:
        or      dx, dx
        je      br_4E759
        mov     byte ptr [C2_B_PAD_NOTE], al
br_4E759:
        imul    bx, word ptr [C2_W_PARAMS_CURSOR], 2ah
        callf   [bx+C2_TBL_PARAMS_FIELD_THUNK]
br_4E762:
        pop     ds
        pop     si
        pop     di
        retf
far_4E766:
        enter   0eh, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        mov     si, ax
        imul    bx, si, 184h
        mov     al, byte ptr [bx+C0_TBL_09160]
        mov     word ptr [bp-0eh], ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        mov     cx, ax
        add     cx, 5ch
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     word ptr [bp-8], ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        mov     cx, word ptr [bp-8]
        add     cx, ax
        sub     cx, 32ah
        mov     si, cx
        mov     word ptr [bp-2], dx
        mov     bl, byte ptr [C2_B_PAD_NOTE]
        sub     bh, bh
        if      FW_VERSION >= 112
far_4E7B2:
        endif
        shl     bx, 2
        add     bx, word ptr [bp-8]
        mov     es, dx
        mov     ax, word ptr es:[bx+752h]
        mov     dx, word ptr es:[bx+754h]
        mov     di, ax
        mov     word ptr [bp-0ah], dx
        push    ds
        push    C2_W_02EAC
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        push    0ech
        callf   EP_L_3EA6A_SEG:EP_L_3EA6A_OFF
        add     sp, 2
        push    2
        if      FW_VERSION < 112
far_4E7B2:
        endif
        mov     ax, word ptr [bp-0eh]
        inc     ax
        cwd
        push    dx
        push    ax
        push    2
        push    1bh
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    word ptr [bp-0ah]
        push    di
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 60h
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        push    dx
        push    ax
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        push    ax
        push    2
        push    4bh
        callf   EP_L_47CFE_SEG:EP_L_47CFE_OFF
        add     sp, 0eh
        push    3
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+0ah]
        sub     ah, ah
        push    0
        push    ax
        push    16h
        push    2dh
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    3
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+0bh]
        sub     ah, ah
        push    0
        push    ax
        push    1fh
        push    2dh
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        mov     es, word ptr [bp-2]
        cmp     byte ptr es:[si+0ch], 0
        je      br_4E864
        mov     ax, STR_C2_START
        mov     dx, C2_SEG
        jmp     SHORT br_4E86A
br_4E864:
        mov     ax, (C2_BASE+L_4EC0E-C2_SEG*16)
        mov     dx, C2_SEG
br_4E86A:
        push    dx
        push    ax
        push    28h
        push    2dh
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+0ch]
        sub     ah, ah
        push    ax
        mov     al, byte ptr es:[si+0bh]
        push    ax
        mov     al, byte ptr es:[si+0ah]
        push    ax
        push    0fh
        push    4bh
        callf   EP_L_47EC6_SEG:EP_L_47EC6_OFF
        add     sp, 0ah
        push    3
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+0dh]
        sub     ah, ah
        push    0
        push    ax
        push    19h
        push    0a4h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    2
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+0eh]
        sub     ah, ah
        push    0
        push    ax
        push    24h
        push    0aah
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    3
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+8]
        cwd
        push    dx
        push    ax
        push    0ch
        push    0dch
        callf   EP_DRAW_SIGNED_VALUE_SEG:EP_DRAW_SIGNED_VALUE_OFF
L_4DF84:
        add     sp, 0ah
        mov     es, word ptr [bp-0ah]
        cmp     byte ptr es:[di+36h], 0
        je      br_4E90A
        mov     ax, word ptr es:[di+34h]
        or      ax, word ptr es:[di+32h]
        je      br_4E90A
        mov     es, word ptr [bp-2]
        cmp     byte ptr es:[si+0ch], 0
        jne     br_4E90A
        mov     di, 2
        jmp     br_4E915
br_4E90A:
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+5]
        sub     ah, ah
        mov     di, ax
br_4E915:
        shl     di, 2
        push    word ptr [di+C2_TBL_02EA2]
        push    word ptr [di+C2_TBL_02EA0]
        push    28h
        push    0beh
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h
L_4E338:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    audition_stop
        callf   EP_PGM_ASSIGN_SCREEN_DRAW_SEG:EP_PGM_ASSIGN_SCREEN_DRAW_OFF
        pop     ds
        retf
L_4E34A:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    audition_stop
        push    EP_PGM_PARAMS_ENTER_SEG
        push    EP_PGM_PARAMS_ENTER_OFF
        callf   EP_FAR_4DBAA_SEG:EP_FAR_4DBAA_OFF
        add     sp, 4
        pop     ds
        retf
        db      00h
L_4E966:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    audition_stop
        nop
        push    cs
        call    far_4EC12
        pop     ds
        retf
L_4E018:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    audition_stop
        nop
        push    cs
        call    far_4EF20
        pop     ds
        retf
tgt_4E98A:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    audition_stop
        push    EP_PGM_PARAMS_ENTER_SEG
        push    EP_PGM_PARAMS_ENTER_OFF
        nop
        push    cs
        call    far_50972
        add     sp, 4
        pop     ds
        retf
        db      00h
far_4E9A6:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        imul    bx, word ptr [C2_W_PARAMS_CURSOR], 2ah
        mov     ax, word ptr [bx+C2_TBL_02F92]
        or      ax, word ptr [bx+C2_TBL_PARAMS_FIELD_ENTER]
        je      L_4E1C9
        nop
        push    cs
        call    audition_stop
        imul    bx, word ptr [C2_W_PARAMS_CURSOR], 2ah
        callf   [bx+C2_TBL_PARAMS_FIELD_ENTER]
L_4E1C9:
        pop     ds
        retf
        db      00h
audition_stop:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        if      FW_VERSION >= 110
        call    pad_audition_note_off
        else
        call    (C1_BASE+L_3D6F6-C1_SEG*16)+C1_CSBASE
        endif
        sub     ax, ax
        mov     word ptr [C2_W_PARAM_HOOK_SEG], ax
        mov     word ptr [C2_W_PARAM_HOOK_OFF], ax
        push    ax
        callf   EP_PAD_ROUTE_MODE_SET_SEG:EP_PAD_ROUTE_MODE_SET_OFF
        add     sp, 2
        pop     ds
        retf
L_4E9EA:
        imul    bx, word ptr [C2_W_PARAMS_CURSOR], 2ah
        callf   [bx+C2_TBL_PARAMS_FIELD_THUNK]
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
        retf
        db      00h
L_4E09A:
far_4E9FA:
        mov     word ptr [C2_W_PARAMS_CURSOR], 0
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        imul    ax, ax, 184h
        add     ax, 9160h
        push    ds
        push    ax
        push    ds
        push    C2_W_02F6A
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_4EA1C:
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        imul    bx, ax, 184h
        mov     al, byte ptr [bx+C0_TBL_09160]
        push    ax
        push    C2_SEG
        push    (C2_BASE+pgm_params_enter-C2_SEG*16)
        nop
        push    cs
        call    far_4EFFA
        add     sp, 6
        retf
        db      00h
L_4EA3A:
far_4E0DA:
        if      FW_VERSION >= 110
        mov     word ptr [C2_W_PARAMS_CURSOR], 1
        else
        mov     word ptr [C2_W_PARAMS_CURSOR], 1
        endif
        push    ds
        push    C2_B_PAD_NOTE
        push    ds
        push    C2_W_02F94
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
far_4E0F2:
        push    EP_PGM_PARAMS_ENTER_SEG
        push    EP_PGM_PARAMS_ENTER_OFF
        nop
        push    cs
        call    far_4FA52
        add     sp, 4
        retf
        db      00h
far_4E102:
        if      FW_VERSION >= 112
        db      0c7h, 06h, 66h, 8dh, 02h, 00h, 0a0h, 0beh
        xlat
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     cx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     cx, ax
        sub     cx, 320h
        push    dx
        push    cx
        imul    ax, word ptr [C2_W_PARAMS_CURSOR], 2ah
        add     ax, 2f6ah
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
L_4EA9C:
        db      0c7h, 06h, 66h, 8dh, 03h, 00h, 0a0h, 0beh, 0d7h, 2ah, 0e4h, 05h, 5ch, 00h, 50h, 9ah
        else
        if      FW_VERSION >= 110
        db      0c7h, 06h, 66h, 8dh, 02h, 00h, 0a0h, 0beh, 0d7h, 2ah, 0e4h, 05h, 5ch, 00h, 50h
        else
        db      0c7h, 06h, 60h, 8dh, 02h, 00h, 0a0h, 0beh, 0d7h, 2ah, 0e4h, 05h, 5ch, 00h, 50h
        endif
        db      9ah
        endif
        dw      EP_IVT_GET_VECTOR_OFF, EP_IVT_GET_VECTOR_SEG
        if      FW_VERSION >= 112
        db      83h, 0c4h, 02h, 8bh, 0c8h, 0b0h, 18h, 0f6h, 26h, 0c0h, 0d7h, 03h
        db      0c8h, 81h, 0e9h, 1fh, 03h, 52h, 51h, 6bh, 06h, 66h, 8dh, 2ah, 05h, 6ah, 2fh, 1eh
        db      50h, 9ah
        else
        db      83h, 0c4h, 02h, 8bh, 0c8h, 0b0h, 18h, 0f6h, 26h, 0c0h, 0d7h
        if      FW_VERSION >= 110
        db      03h, 0c8h, 81h, 0e9h, 20h, 03h, 52h, 51h, 6bh, 06h, 66h, 8dh, 2ah, 05h, 6ah, 2fh ; .... .RQk.f.*.j/
        else
        db      03h, 0c8h, 81h, 0e9h, 20h, 03h, 52h, 51h, 6bh, 06h, 60h, 8dh, 2ah, 05h, 6ah, 2fh ; .... .RQk.f.*.j/
        endif
        db      1eh, 50h, 9ah
        endif
        dw      EP_UI_FIELD_ENGINE_OFF, EP_UI_FIELD_ENGINE_SEG
        db      83h, 0c4h
        if      FW_VERSION >= 112
far_4EAD4:
        endif
        or.d0   bl, cl
L_4EAD6:
        if      FW_VERSION < 110
L_4EA9C:
        endif
        if      FW_VERSION >= 112
        mov     word ptr [C2_W_PARAMS_CURSOR], 4
        else
        mov     word ptr [C2_W_PARAMS_CURSOR], 3
        endif
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     cx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     cx, ax
        if      FW_VERSION >= 112
        sub     cx, 31eh
        else
        sub     cx, 31fh
        endif
        push    dx
        push    cx
        imul    ax, word ptr [C2_W_PARAMS_CURSOR], 2ah
        add     ax, 2f6ah
        if      FW_VERSION < 112
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        if      FW_VERSION < 110
FAR_4E176:
        endif
        if      FW_VERSION >= 110
far_4E176:
        endif
        dw      06c7h, C2_W_PARAMS_CURSOR
        db      04h, 00h, 0a0h, 0beh, 0d7h, 2ah, 0e4h, 05h, 5ch, 00h, 50h, 9ah
        dw      EP_IVT_GET_VECTOR_OFF, EP_IVT_GET_VECTOR_SEG
        db      83h, 0c4h, 02h, 8bh, 0c8h, 0b0h, 18h, 0f6h, 26h, 0c0h, 0d7h, 03h
        db      0c8h, 81h, 0e9h, 1eh, 03h, 52h, 51h
        dw      066bh, C2_W_PARAMS_CURSOR
        db      2ah, 05h, 6ah
far_4EAD4:
        das
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
L_4EB10:
        dw      06c7h, C2_W_PARAMS_CURSOR
        db      05h, 00h, 0a0h, 0beh
far_4EB18:
        xlat
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     cx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     cx, ax
        sub     cx, 31dh
        push    dx
        push    cx
        imul    ax, word ptr [C2_W_PARAMS_CURSOR], 2ah
        add     ax, 2f6ah
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
far_4E1EA:
        mov     word ptr [C2_W_PARAMS_CURSOR], 6
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     cx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     cx, ax
        sub     cx, 31ch
        push    dx
        push    cx
        imul    ax, word ptr [C2_W_PARAMS_CURSOR], 2ah
        add     ax, 2f6ah
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
far_4EB84:
        if      FW_VERSION >= 111
        mov     word ptr [C2_W_PARAMS_CURSOR], 7
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     cx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     cx, ax
        sub     cx, 322h
        push    dx
        push    cx
        imul    ax, word ptr [C2_W_PARAMS_CURSOR], 2ah
        else
        if      FW_VERSION >= 110
        db      0c7h, 06h, 66h, 8dh, 07h, 00h, 0a0h, 0beh, 0d7h, 2ah, 0e4h, 05h, 5ch, 00h, 50h, 9ah
        else
        db      0c7h, 06h, 60h, 8dh, 07h, 00h, 0a0h, 0beh, 0d7h, 2ah, 0e4h, 05h, 5ch, 00h, 50h, 9ah
        endif
        dw      EP_IVT_GET_VECTOR_OFF, EP_IVT_GET_VECTOR_SEG
        db      83h, 0c4h, 02h, 8bh, 0c8h, 0b0h, 18h, 0f6h, 26h, 0c0h, 0d7h, 03h
        if      FW_VERSION >= 110
        db      0c8h, 81h, 0e9h, 22h, 03h, 52h, 51h, 6bh, 06h, 66h
        else
        db      0c8h, 81h, 0e9h, 22h, 03h, 52h, 51h, 6bh, 06h, 60h
        endif
        lea     bp, [bp+si]
        endif
        add     ax, 2f6ah
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        if      FW_VERSION >= 112
L_4EBBE:
        db      0c7h, 06h, 66h, 8dh, 08h, 00h, 0a0h, 0beh, 0d7h, 2ah
far_4EBC8:
        in      al, 5
        pop     sp
        add     byte ptr [bx+si-66h], dl
        sbb     byte ptr [si], al
        if      FW_VERSION >= 120
        mov     al, 35h
        add     sp, 2
        mov     cx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     cx, ax
        sub     cx, 325h
        push    dx
        push    cx
        imul    ax, word ptr [C2_W_PARAMS_CURSOR], 2ah
        elseif  FW_VERSION >= 114
        push    ax
        xor     ax, 0c483h
        add     cl, byte ptr [bp+di-4f38h]
        db      18h, 0f6h, 26h, 0c0h, 0d7h, 03h
        enter   -167fh, 25h
        add     dx, word ptr [bp+si+51h]
        imul    ax, word ptr [C2_W_PARAMS_CURSOR], 2ah
        else
        xor     byte ptr [di], dh
        add     sp, 2
        mov     cx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     cx, ax
        sub     cx, 325h
        push    dx
        push    cx
        imul    ax, word ptr [C2_W_PARAMS_CURSOR], 2ah
        endif
        else
L_4E25E:
        if      FW_VERSION < 110
L_4EBBE:
        endif
        mov     word ptr [C2_W_PARAMS_CURSOR], 8
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     cx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     cx, ax
        sub     cx, 325h
        push    dx
        push    cx
        imul    ax, word ptr [C2_W_PARAMS_CURSOR], 2ah
        endif
        add     ax, 2f6ah
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        if      FW_VERSION < 111
far_4EBC8:
        endif
L_4EBF8:
        db      "POLY", 00h, 00h
L_4E29E:
far_4EBFE:
        db      "NOTE OFF", 00h, 00h
L_4EC08:
        db      "START", 00h
L_4EC0E:
        db      "END", 00h
far_4EC12:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    30e4h
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        mov     word ptr [C2_W_PARAM_HOOK_OFF], (C2_BASE+L_4EE1E-C2_SEG*16)
        mov     word ptr [C2_W_PARAM_HOOK_SEG], C2_SEG
        push    1
        callf   EP_PAD_ROUTE_MODE_SET_SEG:EP_PAD_ROUTE_MODE_SET_OFF
        add     sp, 2
        cmp     word ptr [C2_W_PGM_MIDI_CURSOR], 0
        jl      br_4EC48
        cmp     word ptr [C2_W_PGM_MIDI_CURSOR], 6
        jb      br_4EC4E
br_4EC48:
        mov     word ptr [C2_W_PGM_MIDI_CURSOR], 0
br_4EC4E:
        imul    bx, word ptr [C2_W_PGM_MIDI_CURSOR], 2ah
        callf   [bx+C2_TBL_031AA]
        pop     ds
        retf
        db      00h
pgm_midi_paint:
        enter   14h, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        mov     si, ax
        imul    ax, si, 184h
        add     ax, 8fe0h
        mov     di, ax
        mov     word ptr [bp-2], cx
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        mov     cx, ax
        add     cx, 5ch
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        push    ds
        push    C2_W_03112
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        push    47h
        callf   EP_L_3EA6A_SEG:EP_L_3EA6A_OFF
        add     sp, 2
        push    1
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        inc     ax
        cwd
        push    dx
        push    ax
        push    2
        push    21h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        cmp     byte ptr [C0_B_0D776], 0
        je      br_4ECCE
        mov     ax, C2_W_0DBDC
        mov     dx, C1_SEG
        jmp     SHORT br_4ECD4
br_4ECCE:
        mov     ax, C2_W_0A5D4
        mov     dx, C1_SEG
br_4ECD4:
        push    dx
        push    ax
        push    2
        push    0ddh
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        push    2
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[di+180h]
        sub     ah, ah
        inc     ax
        cwd
        push    dx
        push    ax
        push    0eh
        push    21h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        add     ax, 2
        push    dx
        push    ax
        push    0eh
        push    33h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        mov     es, word ptr [bp-2]
        cmp     byte ptr es:[di+181h], 0
        je      BR_4ED2A
        mov     ax, STR_C2_RECEIVE
        mov     dx, C2_SEG
        jmp     SHORT br_4ED30
        db      90h
BR_4ED2A:
        mov     ax, STR_C2_IGNORE
        mov     dx, C2_SEG
br_4ED30:
        push    dx
        push    ax
        push    19h
        push    5dh
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        mov     es, word ptr [bp-2]
        cmp     byte ptr es:[di+182h], 0
        je      br_4ED52
        mov     ax, STR_C2_RECEIVE
        mov     dx, C2_SEG
        jmp     SHORT br_4ED58
        db      90h
br_4ED52:
        mov     ax, (C2_BASE+L_4EF18-C2_SEG*16)
        mov     dx, C2_SEG
br_4ED58:
        push    dx
        push    ax
        push    24h
        push    5dh
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        push    3
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[di+183h]
        sub     ah, ah
        push    0
        push    ax
        push    24h
        push    0e1h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        pop     si
        pop     di
        leave
        retf
pgm_midi_f1:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    pgm_midi_refresh
        callf   EP_PGM_ASSIGN_SCREEN_DRAW_SEG:EP_PGM_ASSIGN_SCREEN_DRAW_OFF
        pop     ds
        retf
pgm_midi_f2:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    pgm_midi_refresh
        nop
        push    cs
        call    pgm_params_enter
        pop     ds
        retf
pgm_midi_f3:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    pgm_midi_refresh
        push    EP_FAR_4EC12_SEG
        push    EP_FAR_4EC12_OFF
        callf   EP_FAR_4DBAA_SEG:EP_FAR_4DBAA_OFF
        add     sp, 4
        pop     ds
        retf
        db      00h
pgm_midi_f4:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        if      FW_VERSION >= 112
far_4EDD2:
        endif
        nop
        push    cs
        call    pgm_midi_refresh
        nop
        push    cs
        call    far_4EF20
        pop     ds
        retf
pgm_midi_open:
        push    ds
        mov     cx, DS_SEG
        if      FW_VERSION >= 112
        db      8eh, 0d9h, 6bh, 1eh, 68h, 8dh, 2ah, 8bh, 87h, 0c4h, 31h, 0bh
        db      87h, 0c2h, 31h, 74h, 0eh, 90h, 0eh
        call    pgm_midi_refresh
        db      6bh, 1eh, 68h, 8dh, 2ah, 0ffh
        db      9fh, 0c2h
        xor     word ptr [bx], bx
        else
        mov     ds, cx
        imul    bx, word ptr [C2_W_PGM_MIDI_CURSOR], 2ah
        mov     ax, word ptr [bx+C2_TBL_031C4]
        or      ax, word ptr [bx+C2_TBL_031C2]
        je      L_4E4A1
        nop
        push    cs
        call    pgm_midi_refresh
        imul    bx, word ptr [C2_W_PGM_MIDI_CURSOR], 2ah
        callf   [bx+C2_TBL_031C2]
L_4E4A1:
        pop     ds
far_4EDD2:
        endif
        retf
        db      00h
pgm_midi_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        sub     ax, ax
        mov     word ptr [C2_W_PARAM_HOOK_SEG], ax
        mov     word ptr [C2_W_PARAM_HOOK_OFF], ax
        push    ax
        callf   EP_PAD_ROUTE_MODE_SET_SEG:EP_PAD_ROUTE_MODE_SET_OFF
        add     sp, 2
        pop     ds
        retf
        db      00h
L_4EE1E:
        imul    bx, word ptr [C2_W_PGM_MIDI_CURSOR], 2ah
        callf   [bx+C2_TBL_031AA]
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
        retf
        db      00h
pgm_midi_focus_pgm:
        mov     word ptr [C2_W_PGM_MIDI_CURSOR], 0
        push    ds
        push    C2_B_PAD_DRUM
        push    ds
        push    C2_W_0319C
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_4EE46:
        push    1
        callf   EP_PAD_ROUTE_MODE_SET_SEG:EP_PAD_ROUTE_MODE_SET_OFF
        add     sp, 2
        retf
        db      00h
far_4EE52:
        if      FW_VERSION >= 110
        db      0c7h, 06h
far_4EE54:
        push    18dh
        add     byte ptr [C2_B_07668], bl
        xlat
        else
        mov     word ptr [C2_W_PGM_MIDI_CURSOR], 1
        push    ds
        push    C0_B_0D776
        endif
        push    ds
        push    C2_W_031C6
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
far_4EE6A:
        mov     word ptr [C2_W_PGM_MIDI_CURSOR], 2
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        imul    ax, ax, 184h
        add     ax, 9160h
        push    ds
        push    ax
        push    ds
        push    C2_W_031F0
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_4EE8C:
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        imul    bx, ax, 184h
        mov     al, byte ptr [bx+C0_TBL_09160]
        push    ax
        push    EP_FAR_4EC12_SEG
        push    EP_FAR_4EC12_OFF
        nop
        push    cs
        call    far_4EFFA
        add     sp, 6
        retf
        db      00h
pgm_midi_focus_field3:
        mov     word ptr [C2_W_PGM_MIDI_CURSOR], 3
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        imul    ax, ax, 184h
        add     ax, 9161h
        push    ds
        push    ax
        push    ds
        push    C2_W_0321A
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
pgm_midi_focus_field4:
        mov     word ptr [C2_W_PGM_MIDI_CURSOR], 4
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        imul    ax, ax, 184h
        add     ax, 9162h
        push    ds
        push    ax
        push    ds
        push    C2_W_03244
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
pgm_midi_focus_field5:
        mov     word ptr [C2_W_PGM_MIDI_CURSOR], 5
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        imul    ax, ax, 184h
        add     ax, 9163h
        push    ds
        push    ax
        push    ds
        push    C2_W_0326E
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      90h
L_4EF10:
        db      "RECEIVE"
        db      00h
L_4EF18:
        db      "^IGNORE"
        db      00h
far_4EF20:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    3298h
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        callf   EP_L_40008_SEG:EP_L_40008_OFF
        mov     word ptr [C0_B_098B8], ax
        or      ax, ax
        je      br_4EF4E
        push    EP_L_4EF66_SEG
        push    EP_L_4EF66_OFF
        push    7
        callf   EP_HANDLER_INSTALL_ONE_SEG:EP_HANDLER_INSTALL_ONE_OFF
        add     sp, 6
br_4EF4E:
        pop     ds
        retf
purge_f4:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    EP_FAR_4EF20_SEG
        push    EP_FAR_4EF20_OFF
        callf   EP_FAR_4DBAA_SEG:EP_FAR_4DBAA_OFF
        add     sp, 4
        pop     ds
        retf
L_4EF66:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    C1_SEG
        push    word 12h
        push    EP_L_4BD9A_SEG
        push    EP_L_4BD9A_OFF
        callf   EP_DISP_MESSAGE_WINDOW_SEG:EP_DISP_MESSAGE_WINDOW_OFF
        add     sp, 8
        callf   EP_L_400DC_SEG:EP_L_400DC_OFF
        callf   EP_FIELD_HANDLER_NOP_SEG:EP_FIELD_HANDLER_NOP_OFF
        nop
        push    cs
        call    far_4EF20
        pop     ds
        retf
        db      00h
purge_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    32bch
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        push    31h
        push    0f7h
        push    0
        push    0
        callf   EP_DRAW_SHADOW_BOX_SEG:EP_DRAW_SHADOW_BOX_OFF
        add     sp, 8
        push    3
        mov     ax, word ptr [C0_B_098B8]
        cwd
        push    dx
        push    ax
        push    25h
        push    18h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        cmp     word ptr [C0_B_098B8], 0
        je      br_4EFE2
        push    EP_FAR_47ABE_SEG
        push    EP_FAR_47ABE_OFF
        push    1
        push    6
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
br_4EFE2:
        pop     ds
        retf
far_4EFE4:
        mov     al, byte ptr [C1_B_0D7BF]
        push    ax
        push    word ptr [C2_W_08D6C]
        push    word ptr [C2_W_08D6A]
        nop
        push    cs
        call    far_4EFFA
        add     sp, 6
        retf
        db      00h
far_4EFFA:
        enter   2, 0
        push    si
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr [C2_W_08D6A], ax
        mov     word ptr [C2_W_08D6C], dx
        mov     al, byte ptr [bp+0ah]
        cbw
        mov     word ptr [bp-2], ax
        imul    si, ax, 99eh
        les     bx, [C2_FP_PGM_ARRAY]
        cmp     byte ptr es:[bx+si+2], 0
        jne     br_4F02A
        callf   [C2_W_08D6A]
        pop     si
        leave
        retf
        db      90h
br_4F02A:
        mov     al, byte ptr [bp+0ah]
        mov     byte ptr [C1_B_0D7BF], al
        mov     si, word ptr [C2_B_PAD_DRUM]
        and     si, 0ffh
        if      FW_VERSION >= 112
        cmp     word ptr [bp+6], 3dcah
        else
        cmp     word ptr [bp+6], 3d8ah
        endif
        jne     br_4F04B
        cmp     dx, C2_SEG
        jne     br_4F04B
        mov     al, byte ptr [C2_B_MIXER_DRUM]
        cbw
        mov     si, ax
br_4F04B:
        imul    bx, si, 184h
        mov     al, byte ptr [bx+C0_TBL_09160]
        sub     ah, ah
        cmp     ax, word ptr [bp-2]
        je      br_4F066
        push    word ptr [bp-2]
        push    si
        callf   EP_DRUM_PROGRAM_SELECT_SEG:EP_DRUM_PROGRAM_SELECT_OFF
        add     sp, 4
br_4F066:
        push    ds
        push    C2_W_0335E
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        cmp     word ptr [C2_W_PROGRAM_CURSOR], 0
        jl      br_4F080
        cmp     word ptr [C2_W_PROGRAM_CURSOR], 2
        jb      br_4F086
br_4F080:
        mov     word ptr [C2_W_PROGRAM_CURSOR], 0
br_4F086:
        imul    bx, word ptr [C2_W_PROGRAM_CURSOR], 2ah
        callf   [bx+C2_TBL_033E0]
        pop     si
        leave
        retf
program_paint:
        enter   8, 0
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C1_B_0D7BF]
        cbw
        imul    ax, ax, 99eh
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    EP_L_4F178_SEG
        push    EP_L_4F178_OFF
        callf   EP_SMEM_PROC_WRAPPER_SEG:EP_SMEM_PROC_WRAPPER_OFF
        add     sp, 4
        push    ds
        push    C2_W_03386
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        mov     cx, word ptr [bp-2]
        mov     word ptr [bp-8], si
        mov     word ptr [bp-6], cx
        add     si, 2
        push    cx
        push    si
        push    13h
        push    73h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        push    3
        les     bx, [bp-8]
        sub     ah, ah
        mov     al, byte ptr es:[bx+1ch]
        inc     ax
        cwd
        push    dx
        push    ax
        push    25h
        push    0a9h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        pop     si
        leave
        retf
        db      00h
program_close:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   [C2_W_08D6A]
        pop     ds
        retf
L_4F118:
        mov     word ptr [C2_W_PROGRAM_CURSOR], 0
        mov     al, byte ptr [C1_B_0D7BF]
        cbw
        imul    ax, ax, 99eh
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        add     ax, 2
        push    dx
        push    ax
        push    ds
        push    C2_W_033D2
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
L_4F140:
        mov     word ptr [C2_W_PROGRAM_CURSOR], 1
        mov     al, byte ptr [C1_B_0D7BF]
        cbw
        imul    ax, ax, 99eh
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        add     ax, 1ch
        push    dx
        push    ax
        push    ds
        push    C2_W_033FC
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        push    EP_FIELD_HANDLER_NOP_2_SEG
        push    EP_FIELD_HANDLER_NOP_2_OFF
        push    37h
        callf   EP_HANDLER_INSTALL_ONE_SEG:EP_HANDLER_INSTALL_ONE_OFF
        add     sp, 6
        retf
L_4F178:
        db      "Program", 00h
L_4F180:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    3426h
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        mov     al, byte ptr [C1_B_0D7BF]
        mov     byte ptr [C0_B_098B8], al
        callf   [C2_FP_034B4]
        pop     ds
        retf
delete_pgm_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_4EFE4
        pop     ds
        retf
        db      00h
far_4F1AC:
        db      57h, 56h
        push    ds
        mov     cx, DS_SEG
        db      8eh, 0d9h, 0a0h, 0b8h, 98h, 98h, 50h, 9ah
        dw      EP_PGM_DELETE_SLOT_OFF, EP_PGM_DELETE_SLOT_SEG
        add     sp, 2
        mov     al, byte ptr [C1_B_0D7BF]
        cmp     byte ptr [C0_B_098B8], al
        jne     L_4F1F8
        mov     al, byte ptr [C0_B_098B8]
        db      98h, 50h, 9ah
        dw      EP_FAR_3F43A_OFF, EP_FAR_3F43A_SEG
        db      83h, 0c4h, 02h, 8bh, 0f0h, 69h, 0feh
        db      9eh, 09h, 0c4h, 1eh, 9ah, 98h, 26h, 80h, 79h, 02h, 00h
        jne     br_4F1F5
        mov     al, byte ptr [C0_B_098B8]
        cbw
        push    ax
        callf   EP_FAR_3F39A_SEG:EP_FAR_3F39A_OFF
        add     sp, 2
br_4F1F5:
        mov     byte ptr [C1_B_0D7BF], al
L_4F1F8:
        nop
        push    cs
        call    delete_pgm_open
        pop     ds
        pop     si
        pop     di
        retf
        db      00h
delete_pgm_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    EP_L_4E912_SEG
        push    EP_L_4E912_OFF
        callf   EP_DRAW_CONFIRM_WINDOW_SEG:EP_DRAW_CONFIRM_WINDOW_OFF
        add     sp, 4
        push    ds
        push    C2_W_0344A
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        push    2
        mov     al, byte ptr [C0_B_098B8]
        cbw
        inc     ax
        cwd
        push    dx
        push    ax
        push    11h
        push    61h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        mov     al, byte ptr [C0_B_098B8]
        cbw
        imul    ax, ax, 99eh
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        add     ax, 2
        push    dx
        push    ax
        push    11h
        push    73h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        retf
far_4F260:
        push    ds
        push    C0_B_098B8
        push    ds
        push    C2_W_034A6
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        nop
L_4E912:
        inc     sp
        db      "elete"
        db      " Program", 00h, 00h
far_4F282:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    34d0h
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        pop     ds
        retf
far_4F296:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    L_4F180
        pop     ds
        retf
        db      00h
far_4F2A4:
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        xor     si, si
loop_4F2AD:
        push    si
        callf   EP_PGM_DELETE_SLOT_SEG:EP_PGM_DELETE_SLOT_OFF
        add     sp, 2
        inc     si
        cmp     si, 17h
        jle     loop_4F2AD
        mov     byte ptr [C1_B_0D7BF], 0
        nop
        push    cs
        call    far_4F296
        pop     ds
        pop     si
        retf
        db      00h
        if      FW_VERSION >= 114
L_4F2CA:
        else
L_4E96A:
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
L_4F2CA:
        endif
        endif
        push    ds
        mov     cx, DS_SEG
        db      8eh
        if      FW_VERSION >= 110
        dw      EP_FAR_54A39_OFF, C2_SEG
        if      FW_VERSION >= 112
        db      68h, 8ch, 11h, 9ah
        else
        db      68h, 4ch, 11h, 9ah
        endif
        else
        dw      EP_L_54119_OFF, C2_SEG
        db      68h, 4ch
        db      11h, 9ah
        endif
        dw      EP_DRAW_CONFIRM_WINDOW_OFF, EP_DRAW_CONFIRM_WINDOW_SEG
        db      83h, 0c4h
        add     al, 1eh
        push    34eeh
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        pop     ds
        retf
        db      "Delete ALL Progr"
        db      61h, 6dh
        jae     program_new
program_new:
        enter   6, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   EP_PGM_ALLOC_SLOT_SEG:EP_PGM_ALLOC_SLOT_OFF
        mov     word ptr [bp-2], ax
        or      ax, ax
        jl      br_4F38D
        imul    ax, ax, 99eh
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-4], dx
        add     ax, 2
        mov     di, ax
        mov     si, 8fcbh
        mov     es, dx
        push    ds
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        xchg    di, si
        push    ds
        push    dx
        pop     ds
        pop     es
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        les     bx, [bp-6]
        mov     al, byte ptr es:[bx+1ch]
        mov     byte ptr [C0_B_098B8], al
        push    word ptr [bp-2]
        callf   EP_PGM_DELETE_SLOT_SEG:EP_PGM_DELETE_SLOT_OFF
        add     sp, 2
        push    ds
        push    C2_W_0353A
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        cmp     word ptr [C2_W_NEW_PGM_CURSOR], 0
        jl      L_4EA1E
        cmp     word ptr [C2_W_NEW_PGM_CURSOR], 2
        jb      br_4F384
L_4EA1E:
        mov     word ptr [C2_W_NEW_PGM_CURSOR], 0
br_4F384:
        imul    bx, word ptr [C2_W_NEW_PGM_CURSOR], 2ah
        callf   [bx+C2_TBL_035A0]
br_4F38D:
        pop     ds
        pop     si
        pop     di
        leave
        retf
new_pgm_cancel:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_4EFE4
        pop     ds
        retf
        db      00h
new_pgm_do_it:
        enter   6, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   EP_PGM_ALLOC_SLOT_SEG:EP_PGM_ALLOC_SLOT_OFF
        mov     word ptr [bp-2], ax
        or      ax, ax
        jl      br_4F408
        imul    ax, ax, 99eh
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-4], dx
        add     ax, 2
        push    ds
        mov     di, 8fcbh
        mov     si, ax
        mov     cx, ds
        mov     es, cx
        mov     ds, dx
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        xchg    di, si
        push    dx
        push    es
        pop     ds
        pop     es
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        mov     al, byte ptr [C0_B_098B8]
        les     bx, [bp-6]
        mov     byte ptr es:[bx+1ch], al
        mov     al, byte ptr [bp-2]
        mov     byte ptr [C1_B_0D7BF], al
        nop
        push    cs
        call    new_pgm_cancel
br_4F408:
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h
new_pgm_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    EP_L_4EB2C_SEG
        push    EP_L_4EB2C_OFF
        callf   EP_DRAW_CONFIRM_WINDOW_SEG:EP_DRAW_CONFIRM_WINDOW_OFF
        add     sp, 4
        push    ds
        push    C2_W_03558
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        push    ds
        push    C1_W_08FCB
        push    13h
        push    7fh
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        push    3
        mov     al, byte ptr [C0_B_098B8]
        cbw
        inc     ax
        cwd
        push    dx
        push    ax
        push    25h
        push    0c1h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        retf
delete_pgm_field0_thunk:
        mov     word ptr [C2_W_NEW_PGM_CURSOR], 0
        push    ds
        push    C1_W_08FCB
        push    ds
        push    C2_W_03592
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
delete_pgm_field1_thunk:
        mov     word ptr [C2_W_NEW_PGM_CURSOR], 1
        push    ds
        push    C0_B_098B8
        push    ds
        push    C2_W_035BC
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        nop
L_4EB2C:
        db      "Create New Program", 00h, 00h
program_copy:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    35e6h
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        mov     al, byte ptr [C1_B_0D7BF]
        mov     byte ptr [C0_B_098B8], al
        mov     byte ptr [C2_B_098B9], al
        callf   [C2_FP_0366A]
        pop     ds
        retf
        db      00h
copy_pgm_cancel:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_4EFE4
        pop     ds
        retf
        db      00h
far_4F4D0:
        push    ds
        mov     cx, DS_SEG
        db      8eh, 0d9h, 0a0h, 0b8h, 98h, 38h, 06h, 0b9h, 98h
        je      L_4F4F9
        db      98h, 50h, 0a0h, 0b9h, 98h, 98h, 50h, 9ah
        dw      EP_FAR_3F346_OFF, EP_FAR_3F346_SEG
        db      83h, 0c4h, 04h, 0a0h
        db      0b9h, 98h, 0a2h, 0bfh, 0d7h
        nop
        push    cs
        call    copy_pgm_cancel
L_4F4F9:
        pop     ds
        retf
        db      00h
copy_pgm_paint:
        enter   8, 0
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    EP_L_4F5F4_SEG
        push    EP_L_4F5F4_OFF
        callf   EP_DRAW_CONFIRM_WINDOW_SEG:EP_DRAW_CONFIRM_WINDOW_OFF
        add     sp, 4
        push    ds
        push    C2_W_03604
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        push    2
        mov     al, byte ptr [C0_B_098B8]
        cbw
        inc     ax
        cwd
        push    dx
        push    ax
        push    10h
        push    61h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        mov     al, byte ptr [C0_B_098B8]
        cbw
        mov     si, ax
        imul    ax, si, 99eh
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        add     ax, 2
        push    dx
        push    ax
        push    10h
        push    73h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        push    2
        mov     al, byte ptr [C2_B_098B9]
        cbw
        inc     ax
        cwd
        push    dx
        push    ax
        push    28h
        push    61h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        mov     al, byte ptr [C2_B_098B9]
        cbw
        imul    bx, ax, 99eh
        mov     es, word ptr [C2_W_PGM_ARRAY_SEG]
        add     bx, word ptr [C2_FP_PGM_ARRAY]
        add     bx, 2
        cmp     byte ptr es:[bx], 0
        je      br_4F590
        mov     si, bx
        mov     word ptr [bp-2], es
        jmp     br_4F59B
br_4F590:
        mov     ax, (C2_BASE+L_4F602-C2_SEG*16)
        mov     cx, C2_SEG
        mov     si, ax
        mov     word ptr [bp-2], cx
br_4F59B:
        push    word ptr [bp-2]
        push    si
        push    28h
        push    73h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        mov     al, byte ptr [C0_B_098B8]
        cmp     byte ptr [C2_B_098B9], al
        je      br_4F5C6
        push    C1_SEG
        push    EP_FAR_47ABE_OFF
        push    1
        push    5
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
br_4F5C6:
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        pop     si
        leave
        retf
        db      00h
L_4F5D0:
        push    ds
        push    C0_B_098B8
        push    ds
        push    C2_W_03632
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_4F5E2:
        push    ds
        push    C2_B_098B9
        push    ds
        push    C2_W_0365C
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        nop
L_4F5F4:
        db      "Copy Program", 00h, 00h
L_4F602:
        db      "(no program)", 00h, 00h
L_4F610:
        push    ds
        push    C2_W_03686
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        callf   [C2_FP_036E0]
        retf
        db      00h
init_pad_assign_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   EP_PGM_ASSIGN_SCREEN_DRAW_SEG:EP_PGM_ASSIGN_SCREEN_DRAW_OFF
        pop     ds
        retf
        db      00h
init_pad_assign_f5:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 60h
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        push    dx
        push    ax
        callf   EP_FAR_3F46E_SEG:EP_FAR_3F46E_OFF
        add     sp, 4
        nop
        push    cs
        call    init_pad_assign_open
        pop     ds
        retf
init_pad_assign_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    C2_SEG
        push    (C2_BASE+str_init_pad_assign-C2_SEG*16)
        callf   EP_SMEM_PROC_WRAPPER_SEG:EP_SMEM_PROC_WRAPPER_OFF
        add     sp, 4
        push    ds
        push    C2_W_036A4
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        cmp     byte ptr [C2_B_PAD_ASSIGN_MASTER], 0
        je      br_4F688
        mov     ax, STR_C2_MASTER
        mov     dx, C2_SEG
        jmp     SHORT br_4F68E
        db      90h
br_4F688:
        mov     ax, (C2_BASE+L_4E690-C2_SEG*16)
        mov     dx, C2_SEG
br_4F68E:
        push    dx
        push    ax
        push    17h
        push    0a9h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        retf
L_4F6A4:
        mov     al, byte ptr [C2_B_PAD_ASSIGN_MASTER]
        mov     byte ptr [C0_B_098B8], al
        push    ds
        push    C0_B_098B8
        push    ds
        push    C2_W_036D2
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
far_4F6BC:
        push    bp
        mov     bp, sp
        sub     ah, ah
        mov     al, byte ptr [bp+6]
        push    ax
        callf   EP_PAD_ASSIGN_MASTER_SET_SEG:EP_PAD_ASSIGN_MASTER_SET_OFF
        leave
        retf
str_init_pad_assign:
        db      "Initialize Pad Assign", 00h
L_4F6E2:
        push    ds
        push    C2_W_036FC
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        mov     word ptr [C2_W_PARAM_HOOK_OFF], (C2_BASE+L_4F982-C2_SEG*16)
        mov     word ptr [C2_W_PARAM_HOOK_SEG], C2_SEG
        push    1
        callf   EP_PAD_ROUTE_MODE_SET_SEG:EP_PAD_ROUTE_MODE_SET_OFF
        add     sp, 2
        callf   [C0_FP_03762]
        retf
        db      00h
far_4F70A:
        db      57h, 56h
        push    ds
        mov     cx, DS_SEG
        db      8eh, 0d9h, 8bh, 0c8h, 0ah, 0c9h
        je      L_4F761
        db      8bh
        if      FW_VERSION >= 112
        db      3eh
        mov     si, 81d7h
        out     0ffh, ax
        add     byte ptr [bp+si-773bh], cl
        db      2eh, 0c1h, 0d7h, 8dh
        inc     bp
        pusha
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, word ptr [C2_B_CUR_PAD]
        and     si, 0ffh
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     si, ax
        cmp     si, 23h
        jl      br_4F754
        cmp     si, 62h
        else
        db      3eh, 0beh, 0d7h, 81h, 0e7h, 0ffh, 00h, 8ah, 0c5h, 88h, 2eh, 0c1h, 0d7h, 8dh, 45h, 60h
        db      50h, 9ah
        dw      EP_IVT_GET_VECTOR_OFF, EP_IVT_GET_VECTOR_SEG
        db      83h, 0c4h, 02h, 8eh, 0c2h, 8bh, 0d8h, 8bh, 36h, 0c1h
        db      0d7h, 81h, 0e6h, 0ffh, 00h, 26h, 8ah, 00h, 98h, 8bh, 0f0h, 83h, 0feh, 23h, 7ch
        or      ax, word ptr [bp+di+62feh]
        endif
        jg      br_4F754
        mov     dx, 1
        jmp     br_4F756
        db      90h
br_4F754:
        xor     dx, dx
br_4F756:
        or      dx, dx
        je      br_4F75D
        mov     byte ptr [C2_B_PAD_NOTE], al
br_4F75D:
        callf   [C0_FP_03762]
L_4F761:
        pop     ds
        pop     si
        pop     di
        retf
        db      00h
assign_view_paint:
        enter   2ah, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        add     cx, 60h
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     si, ax
        mov     word ptr [bp-1eh], dx
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        add     cx, 5ch
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        add     ax, 7deh
        mov     word ptr [bp-14h], ax
        mov     word ptr [bp-12h], dx
        mov     al, byte ptr [C2_B_CUR_PAD]
        shr     al, 4
        sub     ah, ah
        mov     di, ax
        mov     al, byte ptr [C2_B_CUR_PAD]
        and     ax, 0fh
        mov     word ptr [bp-18h], ax
        mov     bx, si
        mov     es, word ptr [bp-1eh]
        mov     al, byte ptr [C2_B_CUR_PAD]
        sub     ah, ah
        add     bx, ax
        mov     al, byte ptr es:[bx]
        cbw
        mov     word ptr [bp-6], ax
        push    C2_SEG
        push    EP_L_4FA42_OFF
        callf   EP_SMEM_PROC_WRAPPER_SEG:EP_SMEM_PROC_WRAPPER_OFF
        add     sp, 4
        push    ds
        push    C2_W_03734
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        lea     ax, [di+41h]
        push    ax
        push    0ah
        push    31h
        callf   EP_DRAW_CHAR_AT_SEG:EP_DRAW_CHAR_AT_OFF
        add     sp, 6
        push    word ptr [bp-6]
        push    0ah
        push    5bh
        callf   EP_FAR_47C7A_SEG:EP_FAR_47C7A_OFF
        add     sp, 6
        cmp     word ptr [bp-6], 23h
        jl      br_4F814
        cmp     word ptr [bp-6], 62h
        jg      br_4F814
        mov     dx, 1
        jmp     br_4F816
br_4F814:
        xor     dx, dx
br_4F816:
        or      dx, dx
        je      br_4F83C
        mov     bx, word ptr [bp-6]
        shl     bx, 2
        mov     es, word ptr [bp-12h]
        add     bx, word ptr [bp-14h]
        push    word ptr es:[bx-8ah]
        push    word ptr es:[bx-8ch]
        push    0ah
        push    6dh
        callf   EP_FAR_47D5E_SEG:EP_FAR_47D5E_OFF
        add     sp, 8
br_4F83C:
        mov     word ptr [bp-10h], 2bh
        mov     ax, di
        shl     ax, 4
        add     ax, si
        mov     cx, word ptr [bp-1eh]
        mov     word ptr [bp-0eh], ax
        mov     word ptr [bp-0ch], cx
        mov     word ptr [bp-16h], 4
        mov     word ptr [bp-20h], si
        mov     word ptr [bp-1ch], di
loop_4F85C:
        mov     word ptr [bp-8], 0
        mov     word ptr [bp-0ah], 13h
loop_4F866:
        mov     bx, word ptr [bp-8]
        les     si, [bp-0eh]
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     si, ax
        cmp     si, 23h
        jl      br_4F882
        cmp     si, 62h
        jg      br_4F882
        mov     dx, 1
        jmp     br_4F884
        db      90h
br_4F882:
        xor     dx, dx
br_4F884:
        or      dx, dx
        je      br_4F8E6
        mov     bx, ax
        shl     bx, 2
        les     si, [bp-14h]
        mov     ax, word ptr es:[bx+si-8ch]
        mov     dx, word ptr es:[bx+si-8ah]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_4F8C2
        push    8
        mov     dx, word ptr [bp-2]
        add     ax, 12h
        push    dx
        push    ax
        lea     ax, [bp-2ah]
        push    ss
        push    ax
        callf   EP_FSTRNCPY_SEG:EP_FSTRNCPY_OFF
        add     sp, 0ah
        mov     byte ptr [bp-22h], 0
        jmp     br_4F8D3
        db      90h
br_4F8C2:
        mov     ax, C1_SEG
        push    ds
        lea     di, [bp-2ah]
        mov     si, C2_W_0A5D8
        push    ss
        pop     es
        mov     ds, ax
        movsw
        movsb
        pop     ds
br_4F8D3:
        lea     ax, [bp-2ah]
        push    ss
        push    ax
        push    word ptr [bp-10h]
        push    word ptr [bp-0ah]
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
br_4F8E6:
        add     word ptr [bp-0ah], 36h
        inc     word ptr [bp-8]
        cmp     word ptr [bp-8], 4
        jge     br_4F8F6
        jmp     loop_4F866
br_4F8F6:
        sub     word ptr [bp-10h], 8
        add     word ptr [bp-0eh], 4
        dec     word ptr [bp-16h]
        je      br_4F906
        jmp     loop_4F85C
br_4F906:
        mov     si, word ptr [bp-18h]
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        push    3
        callf   EP_DISP_SELECT_PLANE_SEG:EP_DISP_SELECT_PLANE_OFF
        add     sp, 2
        push    9
        push    31h
        mov     ax, si
        cwd
        and     dx, 3
        add     ax, dx
        sar     ax, 2
        shl     ax, 3
        sub     ax, 2ah
        neg     ax
        push    ax
        mov     ax, si
        mov     cx, 4
        cwd
        idiv    cx
        imul    ax, dx, 36h
        add     ax, 12h
        push    ax
        callf   EP_DRAW_FILL_RECT_SEG:EP_DRAW_FILL_RECT_OFF
        add     sp, 8
        push    1
        callf   EP_DISP_SELECT_PLANE_SEG:EP_DISP_SELECT_PLANE_OFF
        add     sp, 2
        pop     ds
        pop     si
        pop     di
        leave
        retf
assign_view_close:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    assign_view_refresh
        callf   EP_PGM_ASSIGN_SCREEN_DRAW_SEG:EP_PGM_ASSIGN_SCREEN_DRAW_OFF
        pop     ds
        retf
assign_view_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        sub     ax, ax
        mov     word ptr [C2_W_PARAM_HOOK_SEG], ax
        mov     word ptr [C2_W_PARAM_HOOK_OFF], ax
        push    ax
        callf   EP_PAD_ROUTE_MODE_SET_SEG:EP_PAD_ROUTE_MODE_SET_OFF
        add     sp, 2
        pop     ds
        retf
        db      00h
L_4F982:
        callf   [C0_FP_03762]
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
        retf
far_4F98C:
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 60h
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     cl, byte ptr [C2_B_CUR_PAD]
        sub     ch, ch
        add     ax, cx
        push    dx
        push    ax
        push    ds
        push    C2_W_03754
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
far_4F9B4:
        push    si
        mov     si, word ptr [C2_B_CUR_PAD]
        and     si, 0ffh
        mov     ax, si
        mov     cx, 10h
        cwd
        idiv    cx
        cmp     dx, 0ch
        jge     br_4F9D5
        lea     ax, [si+4]
        mov     byte ptr [C2_B_CUR_PAD], al
        nop
        push    cs
        call    far_4F98C
br_4F9D5:
        pop     si
        retf
        db      00h
far_4F9D8:
        push    si
        mov     si, word ptr [C2_B_CUR_PAD]
        and     si, 0ffh
        mov     ax, si
        mov     cx, 10h
        cwd
        idiv    cx
        cmp     dx, 4
        jl      br_4F9F9
        lea     ax, [si-4]
        mov     byte ptr [C2_B_CUR_PAD], al
        nop
        push    cs
        call    far_4F98C
br_4F9F9:
        pop     si
        retf
        db      00h
L_4F9FC:
        push    si
        mov     si, word ptr [C2_B_CUR_PAD]
        and     si, 0ffh
        mov     ax, si
        mov     cx, 4
        cwd
        idiv    cx
        or      dx, dx
        jle     br_4FA1C
        lea     ax, [si-1]
        mov     byte ptr [C2_B_CUR_PAD], al
        nop
        push    cs
        call    far_4F98C
br_4FA1C:
        pop     si
        retf
far_4F0BE:
        push    si
        mov     si, word ptr [C2_B_CUR_PAD]
        and     si, 0ffh
        mov     ax, si
        mov     cx, 4
        cwd
        idiv    cx
        cmp     dx, 3
        jge     br_4FA3F
        lea     ax, [si+1]
        mov     byte ptr [C2_B_CUR_PAD], al
        nop
        push    cs
        call    far_4F98C
br_4FA3F:
        pop     si
        retf
        db      90h
L_4FA42:
        db      "Assignment View"
        db      00h
far_4FA52:
        push    bp
        mov     bp, sp
        push    si
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr [C2_W_08D72], ax
        mov     word ptr [C2_W_08D74], dx
        push    ds
        push    CP_WIN
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        cmp     word ptr [C2_W_COPY_NOTE_CURSOR], 0
        jl      br_4FA7D
        cmp     word ptr [C2_W_COPY_NOTE_CURSOR], 4
        jb      br_4FA83
br_4FA7D:
        mov     word ptr [C2_W_COPY_NOTE_CURSOR], 0
br_4FA83:
        mov     si, word ptr [C2_B_PAD_DRUM]
        and     si, 0ffh
        imul    bx, si, 184h
        mov     al, byte ptr [bx+C0_TBL_09160]
        mov     byte ptr [C2_B_098B9], al
        mov     byte ptr [C0_B_098B8], al
        mov     al, byte ptr [C2_B_PAD_NOTE]
        mov     byte ptr [C2_W_098BA], al
        imul    bx, word ptr [C2_W_COPY_NOTE_CURSOR], 2ah
        callf   [bx+C2_TBL_037FC]
        pop     si
        leave
        retf
        db      00h
copy_note_close:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   [C2_W_08D72]
        pop     ds
        retf
copy_note_f5:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [C0_B_098B8]
        cbw
        push    ax
        mov     al, byte ptr [C2_W_098BA]
        cbw
        push    ax
        mov     al, byte ptr [C2_B_098B9]
        cbw
        push    ax
        callf   EP_COPY_NOTE_PARAMS_BODY_SEG:EP_COPY_NOTE_PARAMS_BODY_OFF
        add     sp, 8
        or      ax, ax
        je      br_4FAEA
        mov     al, byte ptr [C2_W_098BA]
        mov     byte ptr [C2_B_PAD_NOTE], al
        nop
        push    cs
        call    copy_note_close
br_4FAEA:
        pop     ds
        retf
copy_note_paint:
        enter   16h, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C0_B_098B8]
        cbw
        mov     si, ax
        imul    ax, si, 99eh
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        mov     di, ax
        mov     word ptr [bp-6], dx
        mov     bl, byte ptr [C2_B_PAD_NOTE]
        sub     bh, bh
        shl     bx, 2
        mov     es, dx
        mov     ax, word ptr es:[bx+di+752h]
        mov     dx, word ptr es:[bx+di+754h]
        mov     si, ax
        mov     word ptr [bp-0ah], dx
        push    EP_L_4FD00_SEG
        push    EP_L_4FD00_OFF
        mov     word ptr [bp-10h], di
        mov     word ptr [bp-0eh], es
        callf   EP_SMEM_PROC_WRAPPER_SEG:EP_SMEM_PROC_WRAPPER_OFF
        add     sp, 4
        push    ds
        push    CP_WIN_ITEMS
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        push    2
        mov     al, byte ptr [C0_B_098B8]
        cbw
        inc     ax
        cwd
        push    dx
        push    ax
        push    0bh
        push    55h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        mov     ax, word ptr [bp-10h]
        mov     dx, word ptr [bp-0eh]
        add     ax, 2
        push    dx
        push    ax
        push    0bh
        push    67h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        mov     ax, word ptr [bp-10h]
        mov     dx, word ptr [bp-0eh]
        add     ax, 79eh
        push    dx
        push    ax
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        push    ax
        push    14h
        push    55h
        callf   EP_FAR_47CB4_SEG:EP_FAR_47CB4_OFF
        add     sp, 0ah
        mov     ax, word ptr [bp-0ah]
        or      ax, si
        jne     L_4F246
        mov     word ptr [bp-4], C2_W_0A5D4
        mov     word ptr [bp-2], C1_SEG
        jmp     br_4FBB4
L_4F246:
        mov     ax, si
        mov     dx, word ptr [bp-0ah]
        add     ax, 12h
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
br_4FBB4:
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    14h
        push    7fh
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        mov     al, byte ptr [C2_B_098B9]
        cbw
        imul    cx, ax, 99eh
        add     cx, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        mov     si, cx
        mov     word ptr [bp-6], dx
        mov     bx, ax
        mov     al, byte ptr [C2_W_098BA]
        cbw
        mov     word ptr [bp-12h], bx
        mov     bx, ax
        shl     bx, 2
        add     bx, cx
        mov     es, dx
        mov     ax, word ptr es:[bx+752h]
        mov     dx, word ptr es:[bx+754h]
        mov     di, ax
        mov     word ptr [bp-0ah], dx
        push    2
        mov     ax, word ptr [bp-12h]
        inc     ax
        cwd
        push    dx
        push    ax
        push    20h
        push    55h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        mov     cx, word ptr [bp-6]
        mov     word ptr [bp-16h], si
        mov     word ptr [bp-14h], cx
        add     si, 2
        push    cx
        push    si
        push    20h
        push    67h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        mov     ax, word ptr [bp-16h]
        mov     dx, word ptr [bp-14h]
        add     ax, 79eh
        push    dx
        push    ax
        mov     al, byte ptr [C2_W_098BA]
        cbw
        push    ax
        push    29h
        push    55h
        callf   EP_FAR_47CB4_SEG:EP_FAR_47CB4_OFF
        add     sp, 0ah
        mov     ax, word ptr [bp-0ah]
        or      ax, di
        jne     br_4FC56
        mov     ax, C2_W_0A5D4
        mov     dx, C1_SEG
        jmp     br_4FC5E
br_4FC56:
        mov     ax, di
        mov     dx, word ptr [bp-0ah]
        add     ax, 12h
br_4FC5E:
        push    dx
        push    ax
        push    29h
        push    7fh
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        mov     al, byte ptr [C0_B_098B8]
        cmp     byte ptr [C2_B_098B9], al
        jne     br_4FC83
        mov     al, byte ptr [C2_W_098BA]
        cbw
        mov     cl, byte ptr [C2_B_PAD_NOTE]
        sub     ch, ch
        cmp     ax, cx
        je      br_4FC95
br_4FC83:
        push    EP_FAR_47ABE_SEG
        push    EP_FAR_47ABE_OFF
        push    1
        push    5
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
br_4FC95:
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h
copy_note_field0_thunk:
        mov     word ptr [C2_W_COPY_NOTE_CURSOR], 0
        push    ds
        push    C0_B_098B8
        push    ds
        push    C2_W_037EE
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
copy_note_field1_thunk:
        mov     word ptr [C2_W_COPY_NOTE_CURSOR], 1
        push    ds
        push    C2_B_PAD_NOTE
        push    ds
        push    C2_W_03818
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
copy_note_field2_thunk:
        mov     word ptr [C2_W_COPY_NOTE_CURSOR], 2
        push    ds
        push    C2_B_098B9
        push    ds
        push    C2_W_03842
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
far_4FCE8:
        mov     word ptr [C2_W_COPY_NOTE_CURSOR], 3
        push    ds
        push    C2_W_098BA
        push    ds
        push    C2_W_0386C
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        if      FW_VERSION < 112
        retf
        db      90h
L_4FD00:
        db      "Copy Note Parameters"
L_4FD16                         equ     $+2
        db      00h, 00h, 1eh, 68h, 96h, 38h, 9ah
        dw      EP_HANDLER_SET_INSTALL_OFF, EP_HANDLER_SET_INSTALL_SEG
        db      83h, 0c4h, 04h, 0c7h, 06h, 0beh, 98h, 50h, 1dh, 0c7h, 06h
        dw      EP_L_56B20_OFF, C2_SEG
        endif
        if      FW_VERSION >= 112
        retf
        nop
L_4FD00:
        db      "Copy Note Parameters", 00h, 00h
L_4FD16:
        push    ds
        push    C2_W_03896
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        mov     word ptr [C2_W_PARAM_HOOK_OFF], (C2_BASE+L_4FEF0-C2_SEG*16)
        mov     word ptr [C2_W_PARAM_HOOK_SEG], C2_SEG
        endif
        push    1
        callf   EP_PAD_ROUTE_MODE_SET_SEG:EP_PAD_ROUTE_MODE_SET_OFF
        add     sp, 2
        cmp     word ptr [C2_W_VELOCITY_MOD_CURSOR], 0
        jl      br_4FD46
        cmp     word ptr [C2_W_VELOCITY_MOD_CURSOR], 5
        jb      br_4FD4C
br_4FD46:
        mov     word ptr [C2_W_VELOCITY_MOD_CURSOR], 0
br_4FD4C:
        imul    bx, word ptr [C2_W_VELOCITY_MOD_CURSOR], 2ah
        callf   [bx+C2_TBL_0392C]
        retf
velocity_mod_pad:
        push    bp
        mov     bp, sp
        push    ax
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        or      al, al
        je      br_4FDB4
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        mov     byte ptr [C2_B_CUR_PAD], ah
        add     cx, 60h
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, word ptr [C2_B_CUR_PAD]
        and     si, 0ffh
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     si, ax
        cmp     si, 23h
        jl      br_4FD9C
        cmp     si, 62h
        jg      br_4FD9C
        mov     dx, 1
        jmp     br_4FD9E
br_4FD9C:
        xor     dx, dx
br_4FD9E:
        or      dx, dx
        je      br_4FDA5
        mov     byte ptr [C2_B_PAD_NOTE], al
br_4FDA5:
        mov     al, byte ptr [bp-2]
        mov     byte ptr [C2_B_PAD_VELOCITY], al
        imul    bx, word ptr [C2_W_VELOCITY_MOD_CURSOR], 2ah
        callf   [bx+C2_TBL_0392C]
br_4FDB4:
        pop     ds
        pop     si
        leave
        retf
velocity_mod_paint:
        enter   0ch, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        add     cx, 5ch
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        mov     cx, word ptr [bp-4]
        add     cx, ax
        sub     cx, 32ah
        mov     si, cx
        mov     word ptr [bp-0ah], dx
        mov     bl, byte ptr [C2_B_PAD_NOTE]
        sub     bh, bh
        shl     bx, 2
        les     di, [bp-4]
        mov     ax, word ptr es:[bx+di+752h]
        mov     dx, word ptr es:[bx+di+754h]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        push    EP_L_4F684_SEG
        push    EP_L_4F684_OFF
        callf   EP_SMEM_PROC_WRAPPER_SEG:EP_SMEM_PROC_WRAPPER_OFF
        add     sp, 4
        push    ds
        push    C2_W_038C4
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        add     cx, 60h
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        push    dx
        push    ax
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        push    ax
        push    0bh
        push    37h
        callf   EP_L_47CFE_SEG:EP_L_47CFE_OFF
        add     sp, 0eh
        push    3
        mov     es, word ptr [bp-0ah]
        mov     al, byte ptr es:[si+13h]
        sub     ah, ah
        push    0
        push    ax
        push    17h
        push    67h
        mov     di, es
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    3
        mov     es, di
        mov     al, byte ptr es:[si+14h]
        sub     ah, ah
        push    0
        push    ax
        push    21h
        push    67h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    3
        mov     es, di
        mov     al, byte ptr es:[si+12h]
        sub     ah, ah
        push    0
        push    ax
        push    2bh
        push    67h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    3
        mov     al, byte ptr [C2_B_PAD_VELOCITY]
        cbw
        cwd
        push    dx
        push    ax
        push    28h
        push    0c7h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        pop     si
        pop     di
        leave
        retf
velocity_mod_open:
        push    ds
        mov     cx, DS_SEG
        if      FW_VERSION >= 112
        mov     ds, cx
        nop
        push    cs
        call    velocity_mod_refresh
        nop
        push    cs
        call    pgm_params_enter
        pop     ds
        retf
        else
        db      8eh, 0d9h, 90h, 0eh, 0e8h, 07h, 00h, 90h, 0eh, 0e8h
        endif
velocity_mod_refresh:
        if      FW_VERSION >= 112
        push    ds
        else
far_4F572                       equ     $+4
        db      0eah, 0e7h, 1fh, 0cbh, 1eh
        endif
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        if      FW_VERSION >= 110
        call    pad_audition_note_off
        else
        call    (C1_BASE+L_3D6F6-C1_SEG*16)+C1_CSBASE
        endif
        sub     ax, ax
        mov     word ptr [C2_W_PARAM_HOOK_SEG], ax
        mov     word ptr [C2_W_PARAM_HOOK_OFF], ax
        push    ax
        callf   EP_PAD_ROUTE_MODE_SET_SEG:EP_PAD_ROUTE_MODE_SET_OFF
        add     sp, 2
        pop     ds
        retf
L_4FEF0:
        imul    bx, word ptr [C2_W_VELOCITY_MOD_CURSOR], 2ah
        callf   [bx+C2_TBL_0392C]
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
        retf
        db      00h
velocity_mod_field0_thunk:
        mov     word ptr [C2_W_VELOCITY_MOD_CURSOR], 0
        push    ds
        push    C2_B_PAD_NOTE
        push    ds
        push    C2_W_0391E
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
velocity_mod_field1_thunk:
        push    si
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     cx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     cx, ax
        sub     cx, 32ah
        mov     si, cx
        mov     word ptr [C2_W_VELOCITY_MOD_CURSOR], 1
        lea     ax, [si+13h]
        push    dx
        push    ax
        push    ds
        push    C2_W_03948
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        pop     si
        retf
        db      00h
velocity_mod_field2_thunk:
        push    si
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     cx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     cx, ax
        sub     cx, 32ah
        mov     si, cx
        mov     word ptr [C2_W_VELOCITY_MOD_CURSOR], 2
        lea     ax, [si+14h]
        push    dx
        push    ax
        push    ds
        push    C2_W_03972
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        pop     si
        retf
        db      00h
velocity_mod_field3_thunk:
        push    si
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     cx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     cx, ax
        sub     cx, 32ah
        mov     si, cx
        mov     word ptr [C2_W_VELOCITY_MOD_CURSOR], 3
        lea     ax, [si+12h]
        push    dx
        push    ax
        push    ds
        push    C2_W_0399C
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        pop     si
        retf
        db      00h
velocity_mod_field4_thunk:
        mov     word ptr [C2_W_VELOCITY_MOD_CURSOR], 4
        push    ds
        push    C1_B_0D7C6
        push    ds
        push    C2_W_039C6
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        nop
L_4F684:
        db      "Velocity Modulation", 00h
velo_mod_enter:
        push    ds
        push    C2_W_039F0
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        mov     word ptr [C2_W_PARAM_HOOK_OFF], (C2_BASE+L_4F8A8-C2_SEG*16)
        mov     word ptr [C2_W_PARAM_HOOK_SEG], C2_SEG
        push    1
        callf   EP_PAD_ROUTE_MODE_SET_SEG:EP_PAD_ROUTE_MODE_SET_OFF
        add     sp, 2
        cmp     word ptr [C2_W_VELO_ENV_FILTER_CURSOR], 0
        jl      br_50028
        cmp     word ptr [C2_W_VELO_ENV_FILTER_CURSOR], 6
        jb      br_5002E
br_50028:
        mov     word ptr [C2_W_VELO_ENV_FILTER_CURSOR], 0
br_5002E:
        imul    bx, word ptr [C2_W_VELO_ENV_FILTER_CURSOR], 2ah
        callf   [bx+C2_TBL_03A86]
        retf
velo_env_filter_pad:
        push    bp
        mov     bp, sp
        push    ax
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        or      al, al
        je      br_50096
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        mov     byte ptr [C2_B_CUR_PAD], ah
        add     cx, 60h
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, word ptr [C2_B_CUR_PAD]
        and     si, 0ffh
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     si, ax
        cmp     si, 23h
        jl      br_5007E
        cmp     si, 62h
        jg      br_5007E
        mov     dx, 1
        jmp     br_50080
br_5007E:
        xor     dx, dx
br_50080:
        or      dx, dx
        je      br_50087
        mov     byte ptr [C2_B_PAD_NOTE], al
br_50087:
        mov     al, byte ptr [bp-2]
        mov     byte ptr [C2_B_PAD_VELOCITY], al
        imul    bx, word ptr [C2_W_VELO_ENV_FILTER_CURSOR], 2ah
        callf   [bx+C2_TBL_03A86]
br_50096:
        pop     ds
        pop     si
        leave
        retf
velo_env_filter_paint:
        enter   0ch, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        add     cx, 5ch
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        mov     cx, word ptr [bp-4]
        add     cx, ax
        sub     cx, 32ah
        mov     si, cx
        mov     word ptr [bp-0ah], dx
        mov     bl, byte ptr [C2_B_PAD_NOTE]
        sub     bh, bh
        shl     bx, 2
        les     di, [bp-4]
        mov     ax, word ptr es:[bx+di+752h]
        mov     dx, word ptr es:[bx+di+754h]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        push    EP_L_4F9D8_SEG
        push    EP_L_4F9D8_OFF
        callf   EP_SMEM_PROC_WRAPPER_SEG:EP_SMEM_PROC_WRAPPER_OFF
        add     sp, 4
        push    ds
        push    C2_W_03A1E
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        add     cx, 60h
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        push    dx
        push    ax
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        push    ax
        push    0bh
        push    37h
        callf   EP_L_47CFE_SEG:EP_L_47CFE_OFF
        add     sp, 0eh
        push    3
        mov     es, word ptr [bp-0ah]
        mov     al, byte ptr es:[si+0fh]
        sub     ah, ah
        push    0
        push    ax
        push    17h
        push    3dh
        mov     di, es
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    3
        mov     es, di
        mov     al, byte ptr es:[si+10h]
        sub     ah, ah
        push    0
        push    ax
        push    21h
        push    3dh
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    3
        mov     es, di
        mov     al, byte ptr es:[si+11h]
        sub     ah, ah
        push    0
        push    ax
        push    2bh
        push    3dh
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    1
        mov     es, di
        mov     al, byte ptr es:[si+10h]
        sub     ah, ah
        push    ax
        mov     al, byte ptr es:[si+0fh]
        push    ax
        push    15h
        push    5bh
        callf   EP_L_47EC6_SEG:EP_L_47EC6_OFF
        add     sp, 0ah
        push    3
        mov     es, di
        mov     al, byte ptr es:[si+15h]
        sub     ah, ah
        push    0
        push    ax
        push    1ch
        push    0d3h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    3
        mov     al, byte ptr [C2_B_PAD_VELOCITY]
        cbw
        cwd
        push    dx
        push    ax
        push    28h
        push    0d3h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        pop     si
        pop     di
        leave
        retf
velo_env_filter_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    velo_env_filter_refresh
        nop
        push    cs
        call    pgm_params_enter
        pop     ds
        retf
velo_env_filter_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        if      FW_VERSION >= 110
        call    pad_audition_note_off
        else
        call    (C1_BASE+L_3D6F6-C1_SEG*16)+C1_CSBASE
        endif
        sub     ax, ax
        mov     word ptr [C2_W_PARAM_HOOK_SEG], ax
        mov     word ptr [C2_W_PARAM_HOOK_OFF], ax
        push    ax
        callf   EP_PAD_ROUTE_MODE_SET_SEG:EP_PAD_ROUTE_MODE_SET_OFF
        add     sp, 2
        pop     ds
        retf
L_4F8A8:
        imul    bx, word ptr [C2_W_VELO_ENV_FILTER_CURSOR], 2ah
        callf   [bx+C2_TBL_03A86]
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
        retf
        db      00h
velo_env_filter_field0_thunk:
        mov     word ptr [C2_W_VELO_ENV_FILTER_CURSOR], 0
        push    ds
        push    C2_B_PAD_NOTE
        push    ds
        push    C2_W_03A78
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
velo_env_filter_field1_thunk:
        push    si
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     cx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     cx, ax
        sub     cx, 32ah
        mov     si, cx
        mov     word ptr [C2_W_VELO_ENV_FILTER_CURSOR], 1
        lea     ax, [si+0fh]
        push    dx
        push    ax
        push    ds
        push    C2_W_03AA2
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        pop     si
        retf
        db      00h
velo_env_filter_field2_thunk:
        push    si
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     cx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     cx, ax
        sub     cx, 32ah
        mov     si, cx
        mov     word ptr [C2_W_VELO_ENV_FILTER_CURSOR], 2
        lea     ax, [si+10h]
        push    dx
        push    ax
        push    ds
        push    C2_W_03ACC
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        pop     si
        retf
        db      00h
velo_env_filter_field3_thunk:
        push    si
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     cx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     cx, ax
        sub     cx, 32ah
        mov     si, cx
        mov     word ptr [C2_W_VELO_ENV_FILTER_CURSOR], 3
        lea     ax, [si+11h]
        push    dx
        push    ax
        push    ds
        push    C2_W_03AF6
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        pop     si
        retf
        db      00h
velo_env_filter_field4_thunk:
        push    si
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     cx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     cx, ax
        sub     cx, 32ah
        mov     si, cx
        mov     word ptr [C2_W_VELO_ENV_FILTER_CURSOR], 4
        lea     ax, [si+15h]
        push    dx
        push    ax
        push    ds
        push    C2_W_03B20
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        pop     si
        retf
        db      00h
velo_env_filter_field5_thunk:
        mov     word ptr [C2_W_VELO_ENV_FILTER_CURSOR], 5
        push    ds
        push    C1_B_0D7C6
        push    ds
        push    C2_W_03B4A
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        nop
L_4F9D8:
        db      "Velo/Env >> filter", 00h
        db      00h
velo_pitch_enter:
        push    ds
        push    C2_W_03B74
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        mov     word ptr [C2_W_PARAM_HOOK_OFF], (C2_BASE+L_4FC3C-C2_SEG*16)
        mov     word ptr [C2_W_PARAM_HOOK_SEG], C2_SEG
        push    1
        callf   EP_PAD_ROUTE_MODE_SET_SEG:EP_PAD_ROUTE_MODE_SET_OFF
        add     sp, 2
        cmp     word ptr [C2_W_VELO_PITCH_CURSOR], 0
        jl      br_5037C
        cmp     word ptr [C2_W_VELO_PITCH_CURSOR], 4
        jb      br_50382
br_5037C:
        mov     word ptr [C2_W_VELO_PITCH_CURSOR], 0
br_50382:
        imul    bx, word ptr [C2_W_VELO_PITCH_CURSOR], 2ah
        callf   [bx+C2_TBL_03BF4]
        retf
velo_pitch_pad:
        push    bp
        mov     bp, sp
        push    ax
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        or      al, al
        je      br_503EA
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        mov     byte ptr [C2_B_CUR_PAD], ah
        add     cx, 60h
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, word ptr [C2_B_CUR_PAD]
        and     si, 0ffh
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     si, ax
        cmp     si, 23h
        jl      br_503D2
        cmp     si, 62h
        jg      br_503D2
        mov     dx, 1
        jmp     br_503D4
br_503D2:
        xor     dx, dx
br_503D4:
        or      dx, dx
        je      br_503DB
        mov     byte ptr [C2_B_PAD_NOTE], al
br_503DB:
        mov     al, byte ptr [bp-2]
        mov     byte ptr [C2_B_PAD_VELOCITY], al
        imul    bx, word ptr [C2_W_VELO_PITCH_CURSOR], 2ah
        callf   [bx+C2_TBL_03BF4]
br_503EA:
        pop     ds
        pop     si
        leave
        retf
velo_pitch_paint:
        enter   16h, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        add     cx, 5ch
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     cl, byte ptr [C2_B_PAD_NOTE]
        sub     ch, ch
        mov     word ptr [bp-12h], cx
        imul    cx, cx, 18h
        add     ax, cx
        sub     ax, 32ah
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     bx, word ptr [bp-12h]
        shl     bx, 2
        les     si, [bp-4]
        mov     ax, word ptr es:[bx+si+752h]
        mov     dx, word ptr es:[bx+si+754h]
        mov     di, ax
        mov     word ptr [bp-0eh], dx
        add     ax, 12h
        mov     si, ax
        mov     word ptr [bp-0ah], dx
        push    EP_L_50654_SEG
        push    EP_L_50654_OFF
        callf   EP_SMEM_PROC_WRAPPER_SEG:EP_SMEM_PROC_WRAPPER_OFF
        add     sp, 4
        push    ds
        push    C2_W_03BA2
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        mov     ax, word ptr [bp-0eh]
        push    ax
        push    di
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        add     cx, 60h
        push    cx
        mov     word ptr [bp-16h], di
        mov     word ptr [bp-14h], ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        push    dx
        push    ax
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        push    ax
        push    0bh
        push    37h
        callf   EP_L_47CFE_SEG:EP_L_47CFE_OFF
        add     sp, 0eh
        push    3
        les     bx, [bp-8]
        mov     ax, word ptr es:[bx+8]
        cwd
        push    dx
        push    ax
        push    1ch
        push    61h
        callf   EP_DRAW_SIGNED_VALUE_SEG:EP_DRAW_SIGNED_VALUE_OFF
        add     sp, 0ah
        mov     ax, word ptr [bp-14h]
        or      ax, word ptr [bp-16h]
        je      br_50531
        mov     es, word ptr [bp-0ah]
        cmp     byte ptr es:[si+24h], 0
        je      br_50531
        mov     al, byte ptr es:[si+12h]
        cbw
        mov     di, ax
        les     bx, [bp-8]
        add     di, word ptr es:[bx+8]
        cmp     di, 0f0h
        jle     br_504D5
        mov     di, 0f0h
br_504D5:
        cmp     di, 0ff10h
        jge     br_504DE
        mov     di, 0ff10h
br_504DE:
        push    di
        mov     es, word ptr [bp-0ah]
        mov     al, byte ptr es:[si+25h]
        sub     ah, ah
        push    ax
        push    word ptr es:[si+22h]
        push    word ptr es:[si+20h]
        callf   EP_FAR_486D8_SEG:EP_FAR_486D8_OFF
        add     sp, 8
        mov     word ptr [bp-2], ax
        push    EP_FAR_50662_SEG
        push    EP_FAR_50662_OFF
        push    28h
        push    1fh
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        cmp     word ptr [bp-2], 0
        jle     br_50531
        cmp     word ptr [bp-2], 2710h
        jge     br_50531
        push    1
        push    3
        mov     ax, word ptr [bp-2]
        cwd
        push    dx
        push    ax
        push    28h
        push    61h
        callf   EP_DRAW_FIXED_DECIMAL_SEG:EP_DRAW_FIXED_DECIMAL_OFF
        add     sp, 0ch
br_50531:
        push    3
        les     bx, [bp-8]
        mov     al, byte ptr es:[bx+17h]
        cbw
        cwd
        push    dx
        push    ax
        push    1ch
        push    0cdh
        callf   EP_DRAW_SIGNED_VALUE_SEG:EP_DRAW_SIGNED_VALUE_OFF
        add     sp, 0ah
        push    3
        mov     al, byte ptr [C2_B_PAD_VELOCITY]
        cbw
        cwd
        push    dx
        push    ax
        push    28h
        push    0cdh
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h
velo_pitch_close:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    velo_pitch_refresh
        nop
        push    cs
        call    pgm_params_enter
        pop     ds
        retf
velo_pitch_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        if      FW_VERSION >= 110
        call    pad_audition_note_off
        else
        call    (C1_BASE+L_3D6F6-C1_SEG*16)+C1_CSBASE
        endif
        sub     ax, ax
        mov     word ptr [C2_W_PARAM_HOOK_SEG], ax
        mov     word ptr [C2_W_PARAM_HOOK_OFF], ax
        push    ax
        callf   EP_PAD_ROUTE_MODE_SET_SEG:EP_PAD_ROUTE_MODE_SET_OFF
        add     sp, 2
        pop     ds
        retf
L_4FC3C:
        imul    bx, word ptr [C2_W_VELO_PITCH_CURSOR], 2ah
        callf   [bx+C2_TBL_03BF4]
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
        retf
        db      00h
far_4FC4C:
velo_pitch_field0_thunk:
        mov     word ptr [C2_W_VELO_PITCH_CURSOR], 0
        push    ds
L_4FC53:
        push    C2_B_PAD_NOTE
        push    ds
        push    C2_W_03BE6
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
velo_pitch_field1_thunk:
        push    si
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     cx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     cx, ax
        sub     cx, 32ah
        mov     si, cx
        mov     word ptr [C2_W_VELO_PITCH_CURSOR], 1
        lea     ax, [si+8]
        push    dx
        push    ax
        push    ds
        push    C2_W_03C10
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        pop     si
        retf
        db      00h
far_4FCA0:
        if      FW_VERSION >= 111
        push    si
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     cx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     cx, ax
L_4FCBF                         equ     $+3
        sub     cx, 32ah
        mov     si, cx
        mov     word ptr [C2_W_VELO_PITCH_CURSOR], 2
        else
        db      56h, 0a0h, 0beh, 0d7h, 2ah, 0e4h, 05h, 5ch, 00h, 50h, 9ah
        dw      EP_IVT_GET_VECTOR_OFF, EP_IVT_GET_VECTOR_SEG
        db      83h, 0c4h, 02h, 8bh, 0c8h, 0b0h, 18h, 0f6h, 26h, 0c0h, 0d7h, 03h, 0c8h, 81h, 0e9h, 2ah
L_4FCBF:
        add     cx, word ptr [bp+di-380fh]
        push    es
        if      FW_VERSION >= 110
        jl      L_4FC53
        else
        jbe     L_4FC53
        endif
        add     al, byte ptr [bx+si]
        endif
        lea     ax, [si+17h]
        push    dx
        push    ax
        push    ds
        push    C2_W_03C3A
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        pop     si
        retf
        db      00h
velo_pitch_field3_thunk:
        mov     word ptr [C2_W_VELO_PITCH_CURSOR], 3
        push    ds
        push    C1_B_0D7C6
        push    ds
        push    C2_W_03C64
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      90h
L_50654:
        db      "Velo >> Pitch"
        db      00h
far_50662:
        if      FW_VERSION >= 112
        db      "Prog tem"
        else
        db      "Prog tempo=---.-"
        db      00h
        db      00h
L_50674:
        db      1eh, 68h, 8eh, 3ch, 9ah
        dw      EP_HANDLER_SET_INSTALL_OFF, EP_HANDLER_SET_INSTALL_SEG
        db      83h, 0c4h, 04h, 0c7h, 06h, 0beh
        db      98h, 26h, 27h, 0c7h, 06h
        dw      EP_L_56B20_OFF, C2_SEG
        db      6ah, 01h, 9ah
        dw      EP_PAD_ROUTE_MODE_SET_OFF, EP_PAD_ROUTE_MODE_SET_SEG
        db      83h, 0c4h, 02h, 0c6h, 06h, 0c6h, 0d7h
        endif
far_5066A:
        if      FW_VERSION >= 112
        db      "po=---.-", 00h, 00h
L_50674:
        push    ds
        push    C2_W_03C8E
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        mov     word ptr [C2_W_PARAM_HOOK_OFF], (C2_BASE+L_508C6-C2_SEG*16)
        mov     word ptr [C2_W_PARAM_HOOK_SEG], C2_SEG
        push    1
        callf   EP_PAD_ROUTE_MODE_SET_SEG:EP_PAD_ROUTE_MODE_SET_OFF
        add     sp, 2
        mov     byte ptr [C2_B_PAD_VELOCITY], 7fh
        cmp     word ptr [C2_W_MUTE_ASSIGN_CURSOR], 0
        jl      L_500A9
        else
        jg      L_4FCBF
        db      3eh
        dw      C2_W_MUTE_ASSIGN_CURSOR
        add     byte ptr [si+7], bh
        endif
        cmp     word ptr [MUTE_CURSOR], MUTE_FIELD_COUNT
        jb      br_506AF
L_500A9:
        mov     word ptr [C2_W_MUTE_ASSIGN_CURSOR], 0
br_506AF:
        imul    bx, word ptr [C2_W_MUTE_ASSIGN_CURSOR], 2ah
        callf   [bx+MUTE_FIELDS+MUTE_FIELD_THUNK]
        retf
        db      00h
mute_assign_pad:
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     cx, ax
        or      cl, cl
        jne     br_506CB
        jmp     br_5076F
br_506CB:
        mov     di, word ptr [C2_B_PAD_DRUM]
        and     di, 0ffh
        mov     al, ch
        mov     byte ptr [C2_B_CUR_PAD], ch
        lea     ax, [di+60h]
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, word ptr [C2_B_CUR_PAD]
        and     si, 0ffh
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     si, ax
        cmp     si, 23h
        jl      br_50706
        cmp     si, 62h
        jg      br_50706
        mov     dx, 1
        jmp     br_50708
br_50706:
        xor     dx, dx
br_50708:
        or      dx, dx
        je      br_50766
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        add     ax, 1eh
        mov     di, ax
        mov     ax, word ptr [C2_W_MUTE_ASSIGN_CURSOR]
        or      ax, ax
        je      br_50732
        dec     ax
        je      br_5073A
        dec     ax
        je      br_50750
        MG_PAD_SKIP br_50766
        nop
br_50732:
        mov     ax, si
        mov     byte ptr [C2_B_PAD_NOTE], al
        jmp     br_50766
        nop
br_5073A:
        mov     ax, si
        mov     es, dx
        mov     cl, byte ptr [C2_B_PAD_NOTE]
        sub     ch, ch
        imul    bx, cx, 18h
        add     bx, di
        sub     bx, 342h
        jmp     SHORT L_4FE03
        db      90h
br_50750:
        mov     ax, si
        mov     es, dx
        mov     cl, byte ptr [C2_B_PAD_NOTE]
        sub     ch, ch
        imul    bx, cx, 18h
        add     bx, di
        sub     bx, 341h
L_4FE03:
        mov     byte ptr es:[bx], al
br_50766:
        imul    bx, word ptr [C2_W_MUTE_ASSIGN_CURSOR], 2ah
        callf   [bx+MUTE_FIELDS+MUTE_FIELD_THUNK]
br_5076F:
        pop     ds
        pop     si
        pop     di
        retf
        db      00h
params_voice_window_draw:
        enter   16h, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        add     cx, 5ch
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     si, ax
        mov     word ptr [bp-6], dx
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     ax, si
        sub     ax, 32ah
        mov     di, ax
        mov     word ptr [bp-0ah], dx
        mov     bl, byte ptr [C2_B_PAD_NOTE]
        sub     bh, bh
        shl     bx, 2
        add     bx, si
        mov     es, dx
        mov     ax, word ptr es:[bx+752h]
        mov     dx, word ptr es:[bx+754h]
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 60h
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    EP_L_50966_SEG
        push    EP_L_50966_OFF
        callf   EP_SMEM_PROC_WRAPPER_SEG:EP_SMEM_PROC_WRAPPER_OFF
        add     sp, 4
        push    ds
        push    C2_W_03CBC
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        push    word ptr [bp-0eh]
        push    word ptr [bp-10h]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        push    ax
        push    0bh
        push    37h
        callf   EP_L_47CFE_SEG:EP_L_47CFE_OFF
        add     sp, 0eh
        push    0d6h
        push    13h
        push    13h
        callf   EP_DRAW_HDOTS_SEG:EP_DRAW_HDOTS_OFF
        add     sp, 6
        mov     es, word ptr [bp-0ah]
        mov     al, byte ptr es:[di+6]
        sub     ah, ah
        mov     cx, di
        mov     di, ax
        shl     di, 2
        mov     dx, es
        mov     es, word ptr [bp-6]
        mov     bx, si
        push    word ptr es:[bx+di+754h]
        push    word ptr es:[bx+di+752h]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    ax
        push    1eh
        push    37h
        mov     word ptr [bp-16h], cx
        mov     word ptr [bp-14h], dx
        callf   EP_L_47CFE_SEG:EP_L_47CFE_OFF
        add     sp, 0eh
        les     bx, [bp-16h]
        sub     ah, ah
        mov     al, byte ptr es:[bx+7]
        mov     di, ax
        shl     di, 2
        mov     bx, si
        mov     es, word ptr [bp-6]
        push    word ptr es:[bx+di+754h]
        push    word ptr es:[bx+di+752h]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    ax
        push    27h
        push    37h
        callf   EP_L_47CFE_SEG:EP_L_47CFE_OFF
        add     sp, 0eh
        MG_REDRAW
        pop     ds
        pop     si
        pop     di
        leave
        retf
mute_assign_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    mute_assign_refresh
        nop
        push    cs
        call    pgm_params_enter
        pop     ds
        retf
mute_assign_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        if      FW_VERSION >= 110
        call    pad_audition_note_off
        else
        call    (C1_BASE+L_3D6F6-C1_SEG*16)+C1_CSBASE
        endif
        sub     ax, ax
        mov     word ptr [C2_W_PARAM_HOOK_SEG], ax
        mov     word ptr [C2_W_PARAM_HOOK_OFF], ax
        push    ax
        callf   EP_PAD_ROUTE_MODE_SET_SEG:EP_PAD_ROUTE_MODE_SET_OFF
        add     sp, 2
        pop     ds
        retf
L_508C6:
        imul    bx, word ptr [C2_W_MUTE_ASSIGN_CURSOR], 2ah
        callf   [bx+MUTE_FIELDS+MUTE_FIELD_THUNK]
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
        retf
        db      00h
mute_assign_field0_thunk:
        mov     word ptr [C2_W_MUTE_ASSIGN_CURSOR], 0
        push    ds
        push    C2_B_PAD_NOTE
        push    ds
        push    MUTE_FIELDS
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
mute_assign_field1_thunk:
        push    si
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     cx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     cx, ax
        sub     cx, 32ah
        mov     si, cx
        mov     word ptr [C2_W_MUTE_ASSIGN_CURSOR], 1
        lea     ax, [si+6]
        push    dx
        push    ax
        push    ds
        push    MUTE_FIELDS+MUTE_FIELD_SIZE
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        pop     si
        retf
        db      00h
mute_assign_field2_thunk:
        push    si
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     cx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     cx, ax
        sub     cx, 32ah
        mov     si, cx
        mov     word ptr [C2_W_MUTE_ASSIGN_CURSOR], 2
        lea     ax, [si+7]
        push    dx
        push    ax
        push    ds
        push    MUTE_FIELDS+2*MUTE_FIELD_SIZE
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        pop     si
        retf
        db      90h
L_50966:
FAR_50972_V107                  equ     $+7
        db      "Mute Assign"
        db      00h
far_50972:
        enter   2, 0
        push    di
        push    si
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr [C2_W_095F8], ax
        mov     word ptr [C2_W_095FA], dx
        callf   EP_PGM_ALLOC_SLOT_SEG:EP_PGM_ALLOC_SLOT_OFF
        mov     word ptr [bp-2], ax
        or      ax, ax
        jge     br_5099A
        nop
        push    cs
        call    auto_chromatic_cancel
        pop     si
        pop     di
        leave
        retf
br_5099A:
        imul    bx, ax, 99eh
        add     bx, word ptr [C2_FP_PGM_ARRAY]
        mov     cx, word ptr [C2_W_PGM_ARRAY_SEG]
        add     bx, 2
        mov     di, bx
        mov     si, 8fcbh
        mov     es, cx
        push    ds
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        xchg    di, si
        push    ds
        push    es
        pop     ds
        pop     es
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        push    word ptr [bp-2]
        callf   EP_PGM_DELETE_SLOT_SEG:EP_PGM_DELETE_SLOT_OFF
        add     sp, 2
        mov     word ptr [C2_W_08D82], 0
        mov     byte ptr [C2_W_08D84], 43h
        mov     bl, byte ptr [C2_B_PAD_NOTE]
        sub     bh, bh
        shl     bx, 2
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        mov     si, bx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx+si+752h]
        mov     dx, word ptr es:[bx+si+754h]
        mov     word ptr [C0_B_098B8], ax
        mov     word ptr [C2_W_098BA], dx
        push    ds
        push    C2_W_03D76
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        cmp     word ptr [C2_W_AUTO_CHROMATIC_CURSOR], 0
        jl      br_50A2C
        cmp     word ptr [C2_W_AUTO_CHROMATIC_CURSOR], 5
        jb      br_50A32
br_50A2C:
        mov     word ptr [C2_W_AUTO_CHROMATIC_CURSOR], 0
br_50A32:
        imul    bx, word ptr [C2_W_AUTO_CHROMATIC_CURSOR], 2ah
        callf   [bx+C2_TBL_03DB6]
        pop     si
        pop     di
        leave
        retf
        db      00h
auto_chromatic_cancel:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   [C2_W_095F8]
        pop     ds
        retf
auto_chromatic_do_it:
        enter   8, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   EP_PGM_ALLOC_SLOT_SEG:EP_PGM_ALLOC_SLOT_OFF
        mov     word ptr [bp-2], ax
        or      ax, ax
        jge     br_50A67
        jmp     br_50AFC
br_50A67:
        imul    ax, ax, 99eh
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-4], dx
        add     ax, 2
        push    ds
        mov     di, 8fcbh
        mov     si, ax
        mov     cx, ds
        mov     es, cx
        mov     ds, dx
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        xchg    di, si
        push    dx
        push    es
        pop     ds
        pop     es
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        mov     al, byte ptr [C2_B_PAD_DRUM]
        mov     word ptr [bp-8], ax
        push    word ptr [C2_W_08D82]
        mov     al, byte ptr [C2_W_08D84]
        cbw
        push    ax
        push    word ptr [C2_W_098BA]
        push    word ptr [C0_B_098B8]
        mov     ax, word ptr [bp-8]
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     cx, ax
        mov     al, 18h
        mul     byte ptr [C2_B_PAD_NOTE]
        add     cx, ax
        sub     cx, 32ah
        push    dx
        push    cx
        push    word ptr [bp-4]
        push    word ptr [bp-6]
        nop
        push    cs
        call    far_50DC0
        add     sp, 10h
        push    word ptr [bp-2]
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        push    ax
        callf   EP_DRUM_PROGRAM_SELECT_SEG:EP_DRUM_PROGRAM_SELECT_OFF
        add     sp, 4
        nop
        push    cs
        call    auto_chromatic_cancel
br_50AFC:
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h
auto_chromatic_pad:
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     cx, ax
        or      cl, cl
        je      br_50B8D
        mov     di, word ptr [C2_B_PAD_DRUM]
        and     di, 0ffh
        mov     al, ch
        mov     byte ptr [C2_B_CUR_PAD], ch
        lea     ax, [di+60h]
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, word ptr [C2_B_CUR_PAD]
        and     si, 0ffh
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     si, ax
        cmp     si, 23h
        jl      br_50B4C
        cmp     si, 62h
        jg      br_50B4C
        mov     dx, 1
        jmp     br_50B4E
        db      90h
br_50B4C:
        xor     dx, dx
br_50B4E:
        or      dx, dx
        je      br_50B84
        mov     byte ptr [C2_B_PAD_NOTE], al
        mov     bl, al
        sub     bh, bh
        shl     bx, 2
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        mov     si, bx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx+si+752h]
        mov     dx, word ptr es:[bx+si+754h]
        mov     word ptr [C0_B_098B8], ax
        mov     word ptr [C2_W_098BA], dx
br_50B84:
        imul    bx, word ptr [C2_W_AUTO_CHROMATIC_CURSOR], 2ah
        callf   [bx+C2_TBL_03DB6]
br_50B8D:
        pop     ds
        pop     si
        pop     di
        retf
        db      00h
auto_chromatic_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    EP_L_5052A_SEG
        push    EP_L_5052A_OFF
        callf   EP_SMEM_PROC_WRAPPER_SEG:EP_SMEM_PROC_WRAPPER_OFF
        add     sp, 4
        push    ds
        push    C2_W_03D94
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        push    EP_BR_50EA4_SEG
        push    EP_BR_50EA4_OFF
        push    0bh
        push    15h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 60h
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        push    dx
        push    ax
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        push    ax
        push    0bh
        push    3fh
        callf   EP_FAR_47CB4_SEG:EP_FAR_47CB4_OFF
        add     sp, 0ah
        push    word ptr [C2_W_098BA]
        push    word ptr [C0_B_098B8]
        push    0bh
        push    69h
        callf   EP_FAR_47D5E_SEG:EP_FAR_47D5E_OFF
        add     sp, 8
        push    EP_L_50554_SEG
        push    EP_L_50554_OFF
        push    15h
        push    1bh
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        push    2
        mov     al, byte ptr [C2_W_08D84]
        cbw
        cwd
        push    dx
        push    ax
        push    15h
        push    69h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        mov     al, byte ptr [C2_W_08D84]
        cbw
        sub     ax, 23h
        cwd
        and     dx, 0fh
        add     ax, dx
        sar     ax, 4
        add     ax, 41h
        push    ax
        push    15h
        push    7bh
        callf   EP_DRAW_CHAR_AT_SEG:EP_DRAW_CHAR_AT_OFF
        add     sp, 6
        mov     al, byte ptr [C2_W_08D84]
        cbw
        sub     ax, 23h
        mov     cx, 10h
        cwd
        idiv    cx
        mov     ax, dx
        inc     ax
        mov     dx, 0ah
        mov     bx, dx
        cwd
        idiv    bx
        add     ax, 30h
        push    ax
        push    15h
        push    81h
        callf   EP_DRAW_CHAR_AT_SEG:EP_DRAW_CHAR_AT_OFF
        add     sp, 6
        mov     al, byte ptr [C2_W_08D84]
        cbw
        sub     ax, 23h
        mov     cx, 10h
        cwd
        idiv    cx
        mov     ax, dx
        inc     ax
        mov     cx, 0ah
        cwd
        idiv    cx
        add     dx, 30h
        push    dx
        push    15h
        push    87h
        callf   EP_DRAW_CHAR_AT_SEG:EP_DRAW_CHAR_AT_OFF
        add     sp, 6
        push    EP_L_50566_SEG
        push    EP_L_50566_OFF
        push    1fh
        push    1bh
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        push    3
        mov     ax, word ptr [C2_W_08D82]
        cwd
        push    dx
        push    ax
        push    1fh
        push    69h
        callf   EP_DRAW_SIGNED_VALUE_SEG:EP_DRAW_SIGNED_VALUE_OFF
        add     sp, 0ah
        push    EP_L_50574_SEG
        push    EP_L_50574_OFF
        push    29h
        push    1bh
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        push    ds
        push    C1_W_08FCB
        push    29h
        push    69h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        retf
        db      00h
auto_chromatic_field0_thunk:
        mov     word ptr [C2_W_AUTO_CHROMATIC_CURSOR], 0
        push    ds
        push    C2_B_PAD_NOTE
        push    ds
        push    C2_W_03DA8
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_50CFC:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+6]
        shl     si, 2
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx+si+752h]
        mov     dx, word ptr es:[bx+si+754h]
        mov     word ptr [C0_B_098B8], ax
        mov     word ptr [C2_W_098BA], dx
        pop     si
        leave
        retf
        db      00h
auto_chromatic_field1_thunk:
        mov     word ptr [C2_W_AUTO_CHROMATIC_CURSOR], 1
        push    ds
        push    C0_B_098B8
        push    ds
        push    C2_W_03DD2
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        push    EP_AUTO_CHROMATIC_PAD_SEG
        push    EP_AUTO_CHROMATIC_PAD_OFF
        push    37h
        callf   EP_HANDLER_INSTALL_ONE_SEG:EP_HANDLER_INSTALL_ONE_OFF
        add     sp, 6
        retf
        db      00h
auto_chromatic_field2_thunk:
        mov     word ptr [C2_W_AUTO_CHROMATIC_CURSOR], 2
        push    ds
        push    C2_W_08D84
        push    ds
        push    C2_W_03DFC
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        push    EP_AUTO_CHROMATIC_PAD_SEG
        push    EP_AUTO_CHROMATIC_PAD_OFF
        push    37h
        callf   EP_HANDLER_INSTALL_ONE_SEG:EP_HANDLER_INSTALL_ONE_OFF
        add     sp, 6
        retf
        db      00h
auto_chromatic_field3_thunk:
        mov     word ptr [C2_W_AUTO_CHROMATIC_CURSOR], 3
        push    ds
        push    C2_W_08D82
        push    ds
        push    C2_W_03E26
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        push    EP_AUTO_CHROMATIC_PAD_SEG
        push    EP_AUTO_CHROMATIC_PAD_OFF
        push    37h
        callf   EP_HANDLER_INSTALL_ONE_SEG:EP_HANDLER_INSTALL_ONE_OFF
        add     sp, 6
        retf
        db      00h
auto_chromatic_field4_thunk:
        mov     word ptr [C2_W_AUTO_CHROMATIC_CURSOR], 4
        push    ds
        push    C1_W_08FCB
        push    ds
        push    C2_W_03E50
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
far_50DC0:
        enter   10h, 0
        push    di
        push    si
        mov     di, word ptr [bp+6]
        xor     bx, bx
        mov     es, word ptr [bp+8]
loop_50DCE:
        mov     si, di
        lea     ax, [bx+23h]
        mov     byte ptr es:[bx+si+79eh], al
        inc     bx
        cmp     bx, 40h
        jl      loop_50DCE
        push    word ptr [bp+10h]
        push    word ptr [bp+0eh]
        callf   EP_SOUND_LIST_CONTAINS_SEG:EP_SOUND_LIST_CONTAINS_OFF
        add     sp, 4
        or      ax, ax
        jne     br_50DF6
        mov     word ptr [bp+10h], ax
        mov     word ptr [bp+0eh], ax
br_50DF6:
        mov     ax, di
        mov     dx, word ptr [bp+8]
        add     ax, 7deh
        mov     word ptr [bp-0eh], ax
        mov     word ptr [bp-0ch], dx
        lea     ax, [di+1eh]
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-4], dx
        mov     ax, 23h
        sub     ax, word ptr [bp+12h]
        mov     cx, ax
        shl     ax, 2
        add     ax, cx
        add     ax, ax
        add     ax, word ptr [bp+14h]
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-10h], 40h
loop_50E27:
        mov     bx, word ptr [bp-0ah]
        cmp.w   bx, -TUNE_MAX
        jge     br_50E38
        mov     word ptr [bp-8], -TUNE_MAX
        jmp     br_50E46
        db      90h
br_50E38:
        mov     word ptr [bp-8], bx
        cmp.w   bx, TUNE_MAX
        jle     br_50E46
        mov     word ptr [bp-8], TUNE_MAX
br_50E46:
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        push    ds
        mov     si, ax
        mov     ds, dx
        les     di, [bp-6]
        mov     cx, 0ch
        rep movsw
        pop     ds
        mov     bx, word ptr [bp-6]
        mov     ax, word ptr [bp-8]
        mov     word ptr es:[bx+8], ax
        mov     ax, word ptr [bp+0eh]
        mov     dx, word ptr [bp+10h]
        les     bx, [bp-0eh]
        add     word ptr [bp-0eh], 4
        mov     word ptr es:[bx], ax
        mov     word ptr es:[bx+2], dx
        add     word ptr [bp-6], 18h
        add     word ptr [bp-0ah], 0ah
        dec     word ptr [bp-10h]
        jne     loop_50E27
        pop     si
        pop     di
        leave
        retf
        nop
L_5052A:
        db      "Auto Chromatic Assignment", 00h
br_50EA4:
        db      "Source:      :", 00h, 00h
L_50554:
        db      "Original key:__/", 00h, 00h
L_50566:
        db      "        Tune:", 00h
L_50574:
        if      FW_VERSION >= 112
        push    ax
        jb      br_50F46
        db      67h
        jb      br_50F3B
        db      "m name:", 00h
        else
        db      "Program name:", 00h
        endif
far_50EE2:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C2_B_03EDC]
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    far_50EF8
        add     sp, 2
        pop     ds
        retf
far_50EF8:
        push    bp
        mov     bp, sp
        push    di
        push    si
        push    ds
        push    C2_W_03F0E
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        mov     word ptr [C2_W_PARAM_HOOK_OFF], (C2_BASE+L_51030-C2_SEG*16)
        mov     word ptr [C2_W_PARAM_HOOK_SEG], C2_SEG
        push    1
        callf   EP_PAD_ROUTE_MODE_SET_SEG:EP_PAD_ROUTE_MODE_SET_OFF
        add     sp, 2
        mov     di, word ptr [bp+6]
        mov     al, byte ptr [C2_B_CUR_PAD]
        and     ax, 0fh
        mov     si, ax
        callf   EP_PAD_BANK_GET_SEG:EP_PAD_BANK_GET_OFF
        shl     al, 4
        mov     cx, si
        add     al, cl
        mov     byte ptr [C2_B_CUR_PAD], al
        mov     ax, di
br_50F3B:
        mov     byte ptr [C2_B_03EDC], al
        push    EP_L_50FBA_SEG
        push    EP_L_50FBA_OFF
        sub     ah, ah
br_50F46:
        add     ax, 2
        push    ax
        callf   EP_HANDLER_INSTALL_ONE_SEG:EP_HANDLER_INSTALL_ONE_OFF
        add     sp, 6
        and     byte ptr [C0_B_08D86], 0fdh
        cmp     word ptr [C0_W_03EDA], 0
        jne     br_50F68
        mov     cx, si
        mov     ax, 1
        shl     ax, cl
        mov     word ptr [C0_W_03EDA], ax
br_50F68:
        test    byte ptr [C0_B_08D86], 1
        je      br_50F78
        nop
        push    cs
        call    far_50F82
        pop     si
        pop     di
        leave
        retf
br_50F78:
        nop
        push    cs
        call    far_50F90
        pop     si
        pop     di
        leave
        retf
        db      00h
far_50F82:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        or      byte ptr [C0_B_08D86], 1
        pop     ds
        retf
        db      00h
far_50F90:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        and     byte ptr [C0_B_08D86], 0feh
        pop     ds
        retf
        db      00h
L_50F9E:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        or      byte ptr [C0_B_08D86], 2
        pop     ds
        retf
        db      00h
L_50FAC:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        and     byte ptr [C0_B_08D86], 0fdh
        pop     ds
        retf
        db      00h
L_50FBA:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_51016
        push    EP_FAR_50EE2_SEG
        push    EP_FAR_50EE2_OFF
        callf   EP_FAR_4DBAA_SEG:EP_FAR_4DBAA_OFF
        add     sp, 4
        pop     ds
        retf
        db      00h
        if      FW_VERSION >= 112
far_50FD6:
        push    ds
        mov     cx, DS_SEG
        db      8eh, 0d9h, 90h, 0eh, 0e8h, 35h
        dw      EP_FAR_54960_OFF, C2_SEG
        db      68h
        db      82h, 2dh, 90h, 0eh
        call    L_50FF6
        db      83h, 0c4h, 04h, 1fh
        else
FAR_50FD6:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_51016
        push    EP_FAR_50EE2_SEG
        push    EP_FAR_50EE2_OFF
        nop
        push    cs
        call    L_50FF6
        add     sp, 4
        pop     ds
        endif
        retf
        db      00h
L_50FF2:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_51016
        nop
        push    cs
        call    fx_not_installed_f5
        pop     ds
        retf
far_51004:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_51016
        nop
        push    cs
        call    mixer_setup_f6
        pop     ds
        retf
far_51016:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        sub     ax, ax
        mov     word ptr [C2_W_PARAM_HOOK_SEG], ax
        mov     word ptr [C2_W_PARAM_HOOK_OFF], ax
        push    ax
        callf   EP_PAD_ROUTE_MODE_SET_SEG:EP_PAD_ROUTE_MODE_SET_OFF
        add     sp, 2
        pop     ds
        retf
        db      00h
L_51030:
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
        retf
far_51036:
        push    bp
        mov     bp, sp
        cmp     byte ptr [C2_B_RECORD_MIX_CHANGES], 0
        je      br_5104E
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   EP_L_3E95E_SEG:EP_L_3E95E_OFF
br_5104E:
        leave
        retf
L_51050:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    0
        nop
        push    cs
        call    far_50EF8
        add     sp, 2
        pop     ds
        retf
L_51062:
        enter   6, 0
        push    si
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        add     cx, 60h
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, word ptr [bp+6]
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     si, ax
        cmp     si, 23h
        jl      br_51096
        cmp     si, 62h
        jg      br_51096
        mov     dx, 1
        jmp     br_51098
        db      90h
br_51096:
        xor     dx, dx
br_51098:
        or      dx, dx
        je      br_510E3
        push    ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        push    ax
        callf   EP_PGM_STEREO_MIX_PTR_SEG:EP_PGM_STEREO_MIX_PTR_OFF
        add     sp, 4
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx]
        sub     ah, ah
        add     ax, 2
        mov     cx, 3
        cwd
        idiv    cx
        mov     word ptr [bp-6], ax
        cmp     ax, 22h
        jge     br_510E3
        mov     al, byte ptr [bp-6]
        mov     cl, al
        add     al, al
        add     al, cl
        inc     al
        sub     ah, ah
        mov     byte ptr es:[bx], al
        push    ax
        push    word ptr [bp+6]
        push    1
        nop
        push    cs
        call    far_51036
        add     sp, 6
br_510E3:
        pop     si
        leave
        retf
L_510E6:
        enter   6, 0
        push    si
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        add     cx, 60h
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, word ptr [bp+6]
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     si, ax
        cmp     si, 23h
        jl      br_5111A
        cmp     si, 62h
        jg      br_5111A
        mov     dx, 1
        jmp     br_5111C
        db      90h
br_5111A:
        xor     dx, dx
br_5111C:
        or      dx, dx
        je      br_51178
        push    ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        push    ax
        callf   EP_PGM_STEREO_MIX_PTR_SEG:EP_PGM_STEREO_MIX_PTR_OFF
        add     sp, 4
        mov     es, dx
        mov     bx, ax
        mov     word ptr [bp-6], ax
        mov     al, byte ptr es:[bx]
        sub     ah, ah
        add     ax, 2
        mov     cx, 3
        cwd
        idiv    cx
        mov     word ptr [bp-2], ax
        or      ax, ax
        jle     br_51178
        dec     word ptr [bp-2]
        je      br_5115F
        mov     ax, word ptr [bp-2]
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        sub     ax, 2
        mov     word ptr [bp-2], ax
br_5115F:
        mov     al, byte ptr [bp-2]
        mov     bx, word ptr [bp-6]
        sub     ah, ah
        mov     byte ptr es:[bx], al
        push    ax
        push    word ptr [bp+6]
        push    1
        nop
        push    cs
        call    far_51036
        add     sp, 6
br_51178:
        pop     si
        leave
        retf
        db      00h
L_5117C:
        enter   4, 0
        push    di
        push    si
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        add     cx, 60h
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, word ptr [bp+6]
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     di, ax
        cmp     di, 23h
        jl      br_511B0
        cmp     di, 62h
        jg      br_511B0
        mov     dx, 1
        jmp     br_511B2
br_511B0:
        xor     dx, dx
br_511B2:
        or      dx, dx
        je      br_51204
        push    ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        push    ax
        callf   EP_PGM_STEREO_MIX_PTR_SEG:EP_PGM_STEREO_MIX_PTR_OFF
        add     sp, 4
        mov     es, dx
        mov     bx, ax
        inc     bx
        sub     ah, ah
        mov     al, byte ptr es:[bx]
        sub     ax, 32h
        cmp     ax, 32h
        jge     br_51204
        mov     cx, 3
        cwd
        idiv    cx
        inc     ax
        mov     dx, ax
        add     ax, ax
        add     ax, dx
        mov     si, ax
        cmp     si, 32h
        jle     br_511EE
        mov     si, 32h
br_511EE:
        lea     ax, [si+32h]
        sub     ah, ah
        mov     byte ptr es:[bx], al
        push    ax
        push    word ptr [bp+6]
        push    2
        nop
        push    cs
        call    far_51036
        add     sp, 6
br_51204:
        pop     si
        pop     di
        leave
        retf
L_51208:
        enter   4, 0
        push    di
        push    si
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        add     cx, 60h
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, word ptr [bp+6]
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     di, ax
        cmp     di, 23h
        jl      br_5123C
        cmp     di, 62h
        jg      br_5123C
        mov     dx, 1
        jmp     br_5123E
br_5123C:
        xor     dx, dx
br_5123E:
        or      dx, dx
        je      br_51290
        push    ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        push    ax
        callf   EP_PGM_STEREO_MIX_PTR_SEG:EP_PGM_STEREO_MIX_PTR_OFF
        add     sp, 4
        mov     es, dx
        mov     bx, ax
        inc     bx
        sub     ah, ah
        mov     al, byte ptr es:[bx]
        sub     ax, 32h
        cmp     ax, 0ffceh
        jle     br_51290
        mov     cx, 3
        cwd
        idiv    cx
        dec     ax
        mov     dx, ax
        add     ax, ax
        add     ax, dx
        mov     si, ax
        cmp     si, -32h
        jge     br_5127A
        mov     si, 0ffceh
br_5127A:
        lea     ax, [si+32h]
        sub     ah, ah
        mov     byte ptr es:[bx], al
        push    ax
        push    word ptr [bp+6]
        push    2
        nop
        push    cs
        call    far_51036
        add     sp, 6
br_51290:
        pop     si
        pop     di
        leave
        retf
L_51294:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    1
        nop
        push    cs
        call    far_50EF8
        add     sp, 2
        pop     ds
        retf
L_512A6:
        enter   6, 0
        push    si
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        add     cx, 60h
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, word ptr [bp+6]
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     si, ax
        cmp     si, 23h
        jl      br_512DA
        cmp     si, 62h
        jg      br_512DA
        mov     dx, 1
        jmp     br_512DC
        db      90h
br_512DA:
        xor     dx, dx
br_512DC:
        or      dx, dx
        je      br_5132A
        push    ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        push    ax
        callf   EP_PGM_INDIV_FX_MIX_PTR_SEG:EP_PGM_INDIV_FX_MIX_PTR_OFF
        add     sp, 4
        mov     es, dx
        mov     bx, ax
        add     bx, 2
        sub     ah, ah
        mov     al, byte ptr es:[bx]
        add     ax, 2
        mov     cx, 3
        cwd
        idiv    cx
        mov     word ptr [bp-6], ax
        cmp     ax, 22h
        jge     br_5132A
        mov     al, byte ptr [bp-6]
        mov     cl, al
        add     al, al
        add     al, cl
        inc     al
        sub     ah, ah
        mov     byte ptr es:[bx], al
        push    ax
        push    word ptr [bp+6]
        push    5
        nop
        push    cs
        call    far_51036
        add     sp, 6
br_5132A:
        pop     si
        leave
        retf
        db      00h
L_5132E:
        enter   6, 0
        push    si
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        add     cx, 60h
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, word ptr [bp+6]
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     si, ax
        cmp     si, 23h
        jl      br_51362
        cmp     si, 62h
        jg      br_51362
        mov     dx, 1
        jmp     br_51364
        db      90h
br_51362:
        xor     dx, dx
br_51364:
        or      dx, dx
        je      br_513BD
        push    ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        push    ax
        callf   EP_PGM_INDIV_FX_MIX_PTR_SEG:EP_PGM_INDIV_FX_MIX_PTR_OFF
        add     sp, 4
        mov     es, dx
        mov     bx, ax
        add     bx, 2
        sub     ah, ah
        mov     al, byte ptr es:[bx]
        add     ax, 2
        mov     cx, 3
        cwd
        idiv    cx
        mov     word ptr [bp-2], ax
        or      ax, ax
        jle     br_513BD
        dec     word ptr [bp-2]
        je      br_513A7
        mov     ax, word ptr [bp-2]
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        sub     ax, 2
        mov     word ptr [bp-2], ax
br_513A7:
        mov     al, byte ptr [bp-2]
        sub     ah, ah
        mov     byte ptr es:[bx], al
        push    ax
        push    word ptr [bp+6]
        push    5
        nop
        push    cs
        call    far_51036
        add     sp, 6
br_513BD:
        pop     si
        leave
        retf
L_513C0:
        enter   6, 0
        push    di
        push    si
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        add     cx, 60h
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, word ptr [bp+6]
        mov     al, byte ptr es:[bx+si]
        cbw
        cmp     ax, 23h
        jl      br_513F2
        cmp     ax, 62h
        jg      br_513F2
        mov     dx, 1
        jmp     br_513F4
br_513F2:
        xor     dx, dx
br_513F4:
        or      dx, dx
        je      br_5142A
        push    ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        push    ax
        callf   EP_PGM_INDIV_FX_MIX_PTR_SEG:EP_PGM_INDIV_FX_MIX_PTR_OFF
        add     sp, 4
        mov     es, dx
        mov     bx, ax
        mov     si, ax
        mov     al, byte ptr es:[bx+3]
        and     ax, 0fh
        mov     di, ax
        cmp     ax, 8
        jae     br_5142A
        mov     al, byte ptr es:[si+3]
        and     al, 80h
        lea     cx, [di+1]
        or      al, cl
        mov     byte ptr es:[si+3], al
br_5142A:
        pop     si
        pop     di
        leave
        retf
L_5142E:
        enter   6, 0
        push    di
        push    si
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        add     cx, 60h
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, word ptr [bp+6]
        mov     al, byte ptr es:[bx+si]
        cbw
        cmp     ax, 23h
        jl      br_51460
        cmp     ax, 62h
        jg      br_51460
        mov     dx, 1
        jmp     br_51462
br_51460:
        xor     dx, dx
br_51462:
        or      dx, dx
        je      br_51497
        push    ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        push    ax
        callf   EP_PGM_INDIV_FX_MIX_PTR_SEG:EP_PGM_INDIV_FX_MIX_PTR_OFF
        add     sp, 4
        mov     es, dx
        mov     bx, ax
        mov     si, ax
        mov     al, byte ptr es:[bx+3]
        and     ax, 0fh
        mov     di, ax
        or      ax, ax
        je      br_51497
        mov     al, byte ptr es:[si+3]
        and     al, 80h
        lea     cx, [di-1]
        or      al, cl
        mov     byte ptr es:[si+3], al
br_51497:
        pop     si
        pop     di
        leave
        retf
        db      00h
L_5149C:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    2
        nop
        push    cs
        call    far_50EF8
        add     sp, 2
        pop     ds
        retf
L_514AE:
        enter   6, 0
        push    si
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        add     cx, 60h
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, word ptr [bp+6]
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     si, ax
        cmp     si, 23h
        jl      br_514E2
        cmp     si, 62h
        jg      br_514E2
        mov     dx, 1
        jmp     br_514E4
        db      90h
br_514E2:
        xor     dx, dx
br_514E4:
        or      dx, dx
        je      br_51532
        push    ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        push    ax
        callf   EP_PGM_INDIV_FX_MIX_PTR_SEG:EP_PGM_INDIV_FX_MIX_PTR_OFF
        add     sp, 4
        mov     es, dx
        mov     bx, ax
        add     bx, 4
        sub     ah, ah
        mov     al, byte ptr es:[bx]
        add     ax, 2
        mov     cx, 3
        cwd
        idiv    cx
        mov     word ptr [bp-6], ax
        cmp     ax, 22h
        jge     br_51532
        mov     al, byte ptr [bp-6]
        mov     cl, al
        add     al, al
        add     al, cl
        inc     al
        sub     ah, ah
        mov     byte ptr es:[bx], al
        push    ax
        push    word ptr [bp+6]
        push    3
        nop
        push    cs
        call    far_51036
        add     sp, 6
br_51532:
        pop     si
        leave
        retf
        db      00h
L_51536:
        enter   6, 0
        push    si
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        add     cx, 60h
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, word ptr [bp+6]
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     si, ax
        cmp     si, 23h
        jl      br_5156A
        cmp     si, 62h
        jg      br_5156A
        mov     dx, 1
        jmp     br_5156C
        db      90h
br_5156A:
        xor     dx, dx
br_5156C:
        or      dx, dx
        je      br_515C5
        push    ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        push    ax
        callf   EP_PGM_INDIV_FX_MIX_PTR_SEG:EP_PGM_INDIV_FX_MIX_PTR_OFF
        add     sp, 4
        mov     es, dx
        mov     bx, ax
        add     bx, 4
        sub     ah, ah
        mov     al, byte ptr es:[bx]
        add     ax, 2
        mov     cx, 3
        cwd
        idiv    cx
        mov     word ptr [bp-2], ax
        or      ax, ax
        jle     br_515C5
        dec     word ptr [bp-2]
        je      br_515AF
        mov     ax, word ptr [bp-2]
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        sub     ax, 2
        mov     word ptr [bp-2], ax
br_515AF:
        mov     al, byte ptr [bp-2]
        sub     ah, ah
        mov     byte ptr es:[bx], al
        push    ax
        push    word ptr [bp+6]
        push    3
        nop
        push    cs
        call    far_51036
        add     sp, 6
br_515C5:
        pop     si
        leave
        retf
L_515C8:
        enter   6, 0
        push    si
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        add     cx, 60h
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, word ptr [bp+6]
        mov     al, byte ptr es:[bx+si]
        cbw
        cmp     ax, 23h
        jl      br_515FA
        cmp     ax, 62h
        jg      br_515FA
        mov     dx, 1
        jmp     br_515FC
        db      90h
br_515FA:
        xor     dx, dx
br_515FC:
        or      dx, dx
        je      br_51620
        push    ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        push    ax
        callf   EP_PGM_INDIV_FX_MIX_PTR_SEG:EP_PGM_INDIV_FX_MIX_PTR_OFF
        add     sp, 4
        mov     es, dx
        mov     bx, ax
        mov     si, ax
        cmp     byte ptr es:[bx+5], 4
        jae     br_51620
        inc     byte ptr es:[si+5]
br_51620:
        pop     si
        leave
        retf
        db      00h
L_51624:
        enter   6, 0
        push    si
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        add     cx, 60h
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, word ptr [bp+6]
        mov     al, byte ptr es:[bx+si]
        cbw
        cmp     ax, 23h
        jl      br_51656
        cmp     ax, 62h
        jg      br_51656
        mov     dx, 1
        jmp     br_51658
        db      90h
br_51656:
        xor     dx, dx
br_51658:
        or      dx, dx
        je      br_5167C
        push    ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        push    ax
        callf   EP_PGM_INDIV_FX_MIX_PTR_SEG:EP_PGM_INDIV_FX_MIX_PTR_OFF
        add     sp, 4
        mov     es, dx
        mov     bx, ax
        mov     si, ax
        cmp     byte ptr es:[bx+5], 0
        je      br_5167C
        dec     byte ptr es:[si+5]
br_5167C:
        pop     si
        leave
        retf
        nop
L_51080:
        db      "INDIV", 00h
far_50D26:
        db      "FXsend", 00h, 00h
L_5168E:
        db      "CLEAR", 00h
L_51694:
        db      "ALL CH", 00h, 00h
fx_not_installed_f5:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    3f86h
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        cmp     word ptr [C2_W_MIXER_SETUP_CURSOR], 0
        jl      br_516BC
        cmp     word ptr [C2_W_MIXER_SETUP_CURSOR], 6
        jb      br_516C2
br_516BC:
        mov     word ptr [C2_W_MIXER_SETUP_CURSOR], 0
br_516C2:
        imul    bx, word ptr [C2_W_MIXER_SETUP_CURSOR], 2ah
        callf   [bx+C2_TBL_04074]
        pop     ds
        retf
        db      00h
mixer_setup_f1:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     byte ptr [C2_B_PAD_DRUM], 0
        nop
        push    cs
        call    far_50EE2
        pop     ds
        retf
mixer_setup_f2:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     byte ptr [C2_B_PAD_DRUM], 1
        nop
        push    cs
        call    far_50EE2
        pop     ds
        retf
mixer_setup_f3:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     byte ptr [C2_B_PAD_DRUM], 2
        nop
        push    cs
        call    far_50EE2
        pop     ds
        retf
mixer_setup_f4:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     byte ptr [C2_B_PAD_DRUM], 3
        nop
        push    cs
        call    far_50EE2
        pop     ds
        retf
mixer_setup_paint:
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    3fb8h
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        xor     si, si
loop_5172B:
        lea     ax, [si+31h]
        mov     bx, C2_W_0FB86
        mov     es, word ptr [C2_W_08122]
        mov     byte ptr es:[bx+5], al
        push    es
        push    bx
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        cmp     ax, si
        jne     L_50DEA
        mov     ax, 2
        jmp     SHORT br_5174D
        db      90h
L_50DEA:
        mov     ax, 1
br_5174D:
        push    ax
        lea     ax, [si+1]
        push    ax
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
        lea     ax, [si+1]
        mov     si, ax
        cmp     si, 4
        jl      loop_5172B
        push    31h
        push    0a3h
        push    0
        push    0
        callf   EP_DRAW_SHADOW_BOX_SEG:EP_DRAW_SHADOW_BOX_OFF
        add     sp, 8
        cmp     byte ptr [C0_B_0D7B8], 0
        je      br_51784
        mov     ax, (C2_BASE+L_51950-C2_SEG*16)
        mov     dx, C2_SEG
        jmp     SHORT br_5178A
br_51784:
        mov     ax, STR_C2_PROGRAM
        mov     dx, C2_SEG
br_5178A:
        push    dx
        push    ax
        push    0dh
        push    75h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        cmp     byte ptr [C0_B_0D7B9], 0
        je      br_517A8
        mov     ax, (C2_BASE+L_51950-C2_SEG*16)
        mov     dx, C2_SEG
        jmp     SHORT br_517AE
        db      90h
br_517A8:
        mov     ax, STR_C2_PROGRAM
        mov     dx, C2_SEG
br_517AE:
        push    dx
        push    ax
        push    16h
        push    75h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        cmp     byte ptr [C1_B_0D7BA], 0
        je      br_517CC
        mov     ax, C2_W_05A00
        mov     dx, C1_SEG
        jmp     SHORT br_517D2
        db      90h
br_517CC:
        mov     ax, C1_W_067E4
        mov     dx, C1_SEG
br_517D2:
        push    dx
        push    ax
        push    1fh
        push    8dh
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        cmp     byte ptr [C2_B_RECORD_MIX_CHANGES], 0
        je      br_517F0
        mov     ax, C2_W_05A00
        mov     dx, C1_SEG
        jmp     SHORT br_517F6
br_517F0:
        mov     ax, C1_W_067E4
        mov     dx, C1_SEG
br_517F6:
        push    dx
        push    ax
        push    28h
        push    8dh
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        push    18h
        push    52h
        push    0
        push    0a5h
        callf   EP_DRAW_SHADOW_BOX_SEG:EP_DRAW_SHADOW_BOX_OFF
        add     sp, 8
        mov     al, byte ptr [C1_B_0D775]
        cbw
        push    ax
        push    0eh
        push    0c1h
        callf   EP_L_47DD0_SEG:EP_L_47DD0_OFF
        add     sp, 6
        push    17h
        push    52h
        push    1ah
        push    0a5h
        callf   EP_DRAW_SHADOW_BOX_SEG:EP_DRAW_SHADOW_BOX_OFF
        add     sp, 8
        push    1
        mov     al, byte ptr [C2_B_MIXER_DRUM]
        cbw
        inc     ax
        cwd
        push    dx
        push    ax
        push    27h
        push    0d9h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        pop     si
        retf
mixer_setup_open:
        enter   4, 0
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        imul    bx, word ptr [C2_W_MIXER_SETUP_CURSOR], 2ah
        mov     ax, word ptr [bx+C2_TBL_0408C]
        mov     dx, word ptr [bx+C2_TBL_0408E]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_5187C
        callf   [bp-4]
br_5187C:
        pop     ds
        leave
        retf
        db      00h
mixer_setup_field0_thunk:
        mov     word ptr [C2_W_MIXER_SETUP_CURSOR], 0
        push    ds
        push    C0_B_0D7B8
        push    ds
        push    C2_W_04066
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
mixer_setup_field1_thunk:
        mov     word ptr [C2_W_MIXER_SETUP_CURSOR], 1
        push    ds
        push    C0_B_0D7B9
        push    ds
        push    C2_W_04090
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
mixer_setup_field2_thunk:
        mov     al, byte ptr [C1_B_0D7BA]
        mov     byte ptr [C0_B_098B8], al
        mov     word ptr [C2_W_MIXER_SETUP_CURSOR], 2
        push    ds
        push    C0_B_098B8
        push    ds
        push    C2_W_040BA
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_518CE:
pending_ops_set:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp+6]
        mov     byte ptr [C1_B_0D7BA], al
        leave
        retf
        db      00h
mixer_setup_field3_thunk:
        mov     word ptr [C2_W_MIXER_SETUP_CURSOR], 3
        push    ds
        push    C0_B_0D7BB
        push    ds
        push    C2_W_040E4
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
mixer_setup_field4_thunk:
        mov     al, byte ptr [C1_B_0D775]
        mov     byte ptr [C0_B_098B8], al
        mov     word ptr [C2_W_MIXER_SETUP_CURSOR], 4
        push    ds
        push    C0_B_098B8
        push    ds
        push    C2_W_0410E
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_51910:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp+6]
        push    ax
        callf   EP_FAR_3F084_SEG:EP_FAR_3F084_OFF
        leave
        retf
mixer_setup_field5_thunk:
        mov     al, byte ptr [C2_B_MIXER_DRUM]
        mov     byte ptr [C0_B_098B8], al
        mov     word ptr [C2_W_MIXER_SETUP_CURSOR], 5
        push    ds
        push    C0_B_098B8
        push    ds
        push    C2_W_04138
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_5193C:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp+6]
        mov     byte ptr [C2_B_MIXER_DRUM], al
        push    0
        push    0fh
        nop
        push    cs
        call    fx_dsp_update_request
        leave
        retf
L_51950:
        db      "DRUM", 000h, 000h
L_50FF6:
        push    bp
        mov     bp, sp
        push    si
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr [C2_W_08D8A], ax
        mov     word ptr [C2_W_08D8C], dx
        mov     cl, byte ptr [C2_B_PAD_DRUM]
        sub     ch, ch
        add     cx, 60h
        push    cx
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, word ptr [C2_B_CUR_PAD]
        and     si, 0ffh
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     si, ax
        cmp     si, 23h
        jl      br_5199A
        cmp     si, 62h
        jg      br_5199A
        mov     dx, 1
        jmp     br_5199C
br_5199A:
        xor     dx, dx
br_5199C:
        or      dx, dx
        je      L_51044
        mov     bx, ax
        jmp     SHORT br_519A7
L_51044:
        mov     bx, 23h
br_519A7:
        mov     byte ptr [C2_B_PAD_NOTE], bl
        push    ds
        push    C2_W_041B2
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        mov     word ptr [C2_W_PARAM_HOOK_OFF], (C2_BASE+L_51C2A-C2_SEG*16)
        mov     word ptr [C2_W_PARAM_HOOK_SEG], C2_SEG
        push    1
        callf   EP_PAD_ROUTE_MODE_SET_SEG:EP_PAD_ROUTE_MODE_SET_OFF
        add     sp, 2
        cmp     word ptr [C2_W_CHANSET_CURSOR], 0
        jl      br_519DB
        cmp     word ptr [C2_W_CHANSET_CURSOR], 8
        jb      br_519E1
br_519DB:
        mov     word ptr [C2_W_CHANSET_CURSOR], 0
br_519E1:
        imul    bx, word ptr [C2_W_CHANSET_CURSOR], 2ah
        callf   [bx+C2_TBL_CHANSET_FIELD_THUNK]
        pop     si
        leave
        retf
        db      00h
far_519EE:
        enter   0eh, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        push    ax
        callf   EP_PGM_STEREO_MIX_PTR_SEG:EP_PGM_STEREO_MIX_PTR_OFF
        add     sp, 4
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        push    ax
        callf   EP_PGM_INDIV_FX_MIX_PTR_SEG:EP_PGM_INDIV_FX_MIX_PTR_OFF
        add     sp, 4
        mov     di, ax
        mov     word ptr [bp-0ch], dx
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        shl     ax, 2
        add     bx, ax
        mov     ax, word ptr es:[bx+752h]
        mov     dx, word ptr es:[bx+754h]
        mov     si, ax
        mov     word ptr [bp-8], dx
        push    C2_SEG
        push    EP_L_51E60_OFF
        callf   EP_SMEM_PROC_WRAPPER_SEG:EP_SMEM_PROC_WRAPPER_OFF
        add     sp, 4
        push    ds
        push    C2_W_041D6
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        push    word ptr [bp-8]
        push    si
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 60h
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        push    dx
        push    ax
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        push    ax
        push    0bh
        push    37h
        callf   EP_L_47CFE_SEG:EP_L_47CFE_OFF
        add     sp, 0eh
        push    3
        les     bx, [bp-4]
        sub     ah, ah
        mov     al, byte ptr es:[bx]
        push    0
        push    ax
        push    20h
        push    3dh
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        les     bx, [bp-4]
        sub     ah, ah
        mov     al, byte ptr es:[bx+1]
        sub     ax, 32h
        push    ax
        push    29h
        push    3dh
        callf   EP_L_47E24_SEG:EP_L_47E24_OFF
        add     sp, 6
        push    3
        mov     es, word ptr [bp-0ch]
        mov     al, byte ptr es:[di+2]
        sub     ah, ah
        push    0
        push    ax
        push    20h
        push    79h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        mov     ax, word ptr [bp-8]
        or      ax, si
        je      br_51AFC
        mov     es, word ptr [bp-8]
        mov     al, byte ptr es:[si+25h]
        sub     ah, ah
        mov     word ptr [bp-2], ax
        jmp     br_51B01
        db      90h
br_51AFC:
        mov     word ptr [bp-2], 1
br_51B01:
        mov     es, word ptr [bp-0ch]
        mov     bl, byte ptr es:[di+3]
        and     bx, 0fh
        mov     ax, word ptr [bp-2]
        mov     cx, ax
        shl     ax, 2
        add     ax, cx
        add     ax, ax
        add     bx, ax
        shl     bx, 2
        push    word ptr [bx+C2_TBL_04164]
        push    word ptr [bx+C2_TBL_04162]
        push    29h
        push    79h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        push    3
        mov     es, word ptr [bp-0ch]
        mov     al, byte ptr es:[di+4]
        sub     ah, ah
        push    0
        push    ax
        push    20h
        push    9ah
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        mov     es, word ptr [bp-0ch]
        mov     al, byte ptr es:[di+5]
        sub     ah, ah
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        add     ax, 3ecah
        push    ds
        push    ax
        push    29h
        push    9dh
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        mov     es, word ptr [bp-0ch]
        test    byte ptr es:[di+3], 80h
        je      far_51B7E
        mov     ax, C2_W_05A00
        mov     dx, C1_SEG
        jmp     br_51B84
        if      FW_VERSION < 112
far_51B7E:
        endif
        if      FW_VERSION >= 112
far_51B7E:
        endif
        mov     ax, C1_W_067E4
        mov     dx, C1_SEG
br_51B84:
        push    dx
        push    ax
        push    29h
        push    0c7h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h
far_5123E:
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     cx, ax
        or      cl, cl
        je      br_51BFA
        mov     di, word ptr [C2_B_PAD_DRUM]
        and     di, 0ffh
        mov     al, ch
        mov     byte ptr [C2_B_CUR_PAD], ch
        lea     ax, [di+60h]
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, word ptr [C2_B_CUR_PAD]
        and     si, 0ffh
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     si, ax
        cmp     si, 23h
        jl      br_51BE8
        cmp     si, 62h
        jg      br_51BE8
        mov     dx, 1
        jmp     br_51BEA
        db      90h
br_51BE8:
        xor     dx, dx
br_51BEA:
        or      dx, dx
        je      br_51BF1
        mov     byte ptr [C2_B_PAD_NOTE], al
br_51BF1:
        imul    bx, word ptr [C2_W_CHANSET_CURSOR], 2ah
        callf   [bx+C2_TBL_CHANSET_FIELD_THUNK]
br_51BFA:
        pop     ds
        pop     si
        pop     di
        retf
L_51BFE:
        if      FW_VERSION >= 112
        push    ds
        mov     cx, DS_SEG
        db      8eh, 0d9h, 90h, 0eh, 0e8h, 07h
        db      00h, 0ffh
        endif
        push    ds
        if      FW_VERSION >= 112
        mov     cl, byte ptr [di+C2_TBL_0CB1F]
        else
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    L_51C10
        callf   [C2_W_08D8A]
        pop     ds
        retf
        endif
        db      00h
L_51C10:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        sub     ax, ax
        mov     word ptr [C2_W_PARAM_HOOK_SEG], ax
        mov     word ptr [C2_W_PARAM_HOOK_OFF], ax
        push    ax
        callf   EP_PAD_ROUTE_MODE_SET_SEG:EP_PAD_ROUTE_MODE_SET_OFF
        add     sp, 2
        pop     ds
        retf
        db      00h
L_51C2A:
        imul    bx, word ptr [C2_W_CHANSET_CURSOR], 2ah
        callf   [bx+C2_TBL_CHANSET_FIELD_THUNK]
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
        retf
        db      00h
mixer_chan_field0_thunk:
        mov     word ptr [C2_W_CHANSET_CURSOR], 0
        push    ds
        push    C2_B_PAD_NOTE
        push    ds
        push    C2_W_04240
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
mixer_chan_field1_thunk:
        mov     word ptr [C2_W_CHANSET_CURSOR], 1
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        push    ax
        callf   EP_PGM_STEREO_MIX_PTR_SEG:EP_PGM_STEREO_MIX_PTR_OFF
        add     sp, 4
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_CHANSET_CURSOR], 2ah
        add     ax, 4240h
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
mixer_chan_field2_thunk:
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        push    ax
        callf   EP_PGM_STEREO_MIX_PTR_SEG:EP_PGM_STEREO_MIX_PTR_OFF
        add     sp, 4
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+1]
        sub     al, 32h
        mov     byte ptr [C0_B_098B8], al
        mov     word ptr [C2_W_CHANSET_CURSOR], 2
        push    ds
        push    C0_B_098B8
        push    ds
        push    C2_W_04294
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
L_51CB6:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        push    ax
        callf   EP_PGM_STEREO_MIX_PTR_SEG:EP_PGM_STEREO_MIX_PTR_OFF
        mov     es, dx
        mov     bx, ax
        mov     al, byte ptr [bp+6]
        add     al, 32h
        mov     byte ptr es:[bx+1], al
        leave
        retf
        db      00h
mixer_chan_field3_thunk:
        mov     word ptr [C2_W_CHANSET_CURSOR], 3
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        push    ax
        callf   EP_PGM_INDIV_FX_MIX_PTR_SEG:EP_PGM_INDIV_FX_MIX_PTR_OFF
        add     sp, 4
        add     ax, 2
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_CHANSET_CURSOR], 2ah
        add     ax, 4240h
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
mixer_chan_field4_thunk:
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        push    ax
        callf   EP_PGM_INDIV_FX_MIX_PTR_SEG:EP_PGM_INDIV_FX_MIX_PTR_OFF
        add     sp, 4
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+3]
        and     al, 7fh
        mov     byte ptr [C0_B_098B8], al
        mov     word ptr [C2_W_CHANSET_CURSOR], 4
        push    ds
        push    C0_B_098B8
        push    ds
        push    C2_W_042E8
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
L_51D3E:
        enter   4, 0
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        push    ax
        callf   EP_PGM_INDIV_FX_MIX_PTR_SEG:EP_PGM_INDIV_FX_MIX_PTR_OFF
        mov     es, dx
        mov     bx, ax
        add     bx, 3
        and     byte ptr es:[bx], 80h
        mov     al, byte ptr es:[bx]
        add     al, byte ptr [bp+6]
        mov     byte ptr es:[bx], al
        leave
        retf
        db      00h
mixer_chan_field5_thunk:
        mov     word ptr [C2_W_CHANSET_CURSOR], 5
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        push    ax
        callf   EP_PGM_INDIV_FX_MIX_PTR_SEG:EP_PGM_INDIV_FX_MIX_PTR_OFF
        add     sp, 4
        add     ax, 4
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_CHANSET_CURSOR], 2ah
        add     ax, 4240h
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
mixer_chan_field6_thunk:
        mov     word ptr [C2_W_CHANSET_CURSOR], 6
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        push    ax
        callf   EP_PGM_INDIV_FX_MIX_PTR_SEG:EP_PGM_INDIV_FX_MIX_PTR_OFF
        add     sp, 4
        add     ax, 5
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_CHANSET_CURSOR], 2ah
        add     ax, 4240h
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
mixer_chan_field7_thunk:
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        push    ax
        callf   EP_PGM_INDIV_FX_MIX_PTR_SEG:EP_PGM_INDIV_FX_MIX_PTR_OFF
        add     sp, 4
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+3]
        and     al, 80h
        cmp     al, 1
        sbb     al, al
        inc     al
        mov     byte ptr [C0_B_098B8], al
        mov     word ptr [C2_W_CHANSET_CURSOR], 7
        push    ds
        push    C0_B_098B8
        push    ds
        push    C2_W_04366
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
L_51E04:
        enter   4, 0
        push    si
        mov     al, byte ptr [C2_B_PAD_NOTE]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        push    ax
        callf   EP_PGM_INDIV_FX_MIX_PTR_SEG:EP_PGM_INDIV_FX_MIX_PTR_OFF
        add     sp, 4
        mov     es, dx
        mov     bx, ax
        add     bx, 3
        mov     si, bx
        mov     word ptr [bp-2], es
        and     byte ptr es:[bx], 7fh
        cmp     word ptr [bp+6], 0
        je      br_51E38
        mov     es, word ptr [bp-2]
        or      byte ptr es:[si], 80h
br_51E38:
        pop     si
        leave
        retf
        db      90h
far_514DC:
        db      20h, 2dh, 00h, 00h
far_514E0:
        db      20h, 31h, 00h, 00h
far_514E4:
far_51E48                       equ     $+4
        db      20h, 32h, 00h, 00h, 20h, 33h, 00h
        if      FW_VERSION < 114
far_51E4C                       equ     $+1
far_51E50                       equ     $+5
        endif
far_51E54                       equ     $+9
far_51E58                       equ     $+0dh
        if      FW_VERSION >= 114
far_51E4C                       equ     $+1
far_51E50                       equ     $+5
        endif
        db      00h, 20h, 34h, 00h, 00h, 20h, 35h, 00h, 00h, 20h, 36h, 00h, 00h, 20h, 37h, 00h
        db      00h
far_514FC:
        db      20h, 38h, 00h, 00h
L_51E60:
        db      "Channel Set"
        db      "tings", 000h, 000h
far_51E72:
        push    ds
        push    C2_W_04390
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        retf
        db      00h
fx_not_installed_paint:
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    43b8h
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        push    ds
        push    C2_W_07A2E
        push    0ah
        push    0a9h
        callf   EP_DRAW_BITMAP_PTR_SEG:EP_DRAW_BITMAP_PTR_OFF
        add     sp, 8
        xor     si, si
loop_51EA6:
        lea     ax, [si+31h]
        mov     bx, C2_W_0FB86
        mov     es, word ptr [C2_W_08124]
        mov     byte ptr es:[bx+5], al
        push    es
        push    bx
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        cmp     ax, si
        jne     L_51EC4
        mov     ax, 2
        jmp     SHORT br_51EC7
L_51EC4:
        mov     ax, 1
br_51EC7:
        push    ax
        lea     ax, [si+1]
        push    ax
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
        lea     ax, [si+1]
        mov     si, ax
        cmp     si, 4
        jl      loop_51EA6
        pop     ds
        pop     si
        retf
        db      00h
fx_not_installed_f1:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     byte ptr [C2_B_PAD_DRUM], 0
        nop
        push    cs
        call    far_50EE2
        pop     ds
        retf
fx_not_installed_f2:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     byte ptr [C2_B_PAD_DRUM], 1
        nop
        push    cs
        call    far_50EE2
        pop     ds
        retf
fx_not_installed_f3:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     byte ptr [C2_B_PAD_DRUM], 2
        nop
        push    cs
        call    far_50EE2
        pop     ds
        retf
fx_not_installed_f4:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     byte ptr [C2_B_PAD_DRUM], 3
        nop
        push    cs
        call    far_50EE2
        pop     ds
        retf
mixer_setup_f6:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_51F38
        pop     ds
        retf
        db      00h
far_51F38:
        cmp     byte ptr [C0_B_0D7C7], 0
        jl      br_51F46
        cmp     byte ptr [C0_B_0D7C7], 3
        jle     br_51F4B
br_51F46:
        mov     byte ptr [C0_B_0D7C7], 0
br_51F4B:
        mov     al, byte ptr [C2_B_MIXER_DRUM]
        mov     byte ptr [C0_B_098B8], al
        cmp     byte ptr [C2_B_FX_BOARD_PRESENT], 0
        je      br_51FAC
        push    ds
        push    C2_W_0442A
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        mov     word ptr [C2_W_PARAM_HOOK_OFF], (C2_BASE+L_520B8-C2_SEG*16)
        mov     word ptr [C2_W_PARAM_HOOK_SEG], C2_SEG
        cmp     word ptr [C2_W_MIXER_CURSOR], 0
        jl      loop_51F8C
        cmp     word ptr [C2_W_MIXER_CURSOR], 0ah
        jae     loop_51F8C
        cmp     byte ptr [C0_B_0D7C7], 2
        jge     br_51F9C
        cmp     word ptr [C2_W_MIXER_CURSOR], 2
        jne     loop_51F92
loop_51F8C:
        mov     word ptr [C2_W_MIXER_CURSOR], 0
loop_51F92:
        imul    bx, word ptr [C2_W_MIXER_CURSOR], 2ah
        callf   [bx+C2_TBL_MIXER_FIELD_THUNK]
        retf
br_51F9C:
        cmp     word ptr [C2_W_MIXER_CURSOR], 3
        jl      loop_51F92
        cmp     word ptr [C2_W_MIXER_CURSOR], 6
        jg      loop_51F92
        jmp     loop_51F8C
br_51FAC:
        nop
        push    cs
        call    far_51E72
        retf
mixer_f6:
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        cmp     byte ptr [C0_B_0D7C7], 2
        jl      br_51FE8
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_REVERB_PTR_SEG:EP_PGM_FX_REVERB_PTR_OFF
        add     sp, 2
        mov     si, ax
        mov     al, byte ptr [C2_B_08D90]
        mov     es, dx
        xor     byte ptr es:[si+1], al
        mov     al, byte ptr [C0_B_0D7C7]
        push    ax
        nop
        push    cs
        call    smem_dma_channel_23
        add     sp, 2
        pop     ds
        pop     si
        retf
        db      90h
br_51FE8:
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     si, ax
        mov     al, byte ptr [C2_B_08D90]
        mov     es, dx
        xor     byte ptr es:[si+45h], al
        mov     al, byte ptr [C0_B_0D7C7]
        push    ax
        nop
        push    cs
        call    smem_dma_channel_01
        add     sp, 2
        pop     ds
        pop     si
        retf
        db      00h
mixer_f1:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    mixer_refresh
        mov     byte ptr [C2_B_PAD_DRUM], 0
        nop
        push    cs
        call    far_50EE2
        pop     ds
        retf
        db      00h
mixer_drum_2:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    mixer_refresh
        mov     byte ptr [C2_B_PAD_DRUM], 1
        nop
        push    cs
        call    far_50EE2
        pop     ds
        retf
        db      00h
mixer_drum_3:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    mixer_refresh
        mov     byte ptr [C2_B_PAD_DRUM], 2
        nop
        push    cs
        call    far_50EE2
        pop     ds
        retf
        db      00h
mixer_drum_4:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    mixer_refresh
        mov     byte ptr [C2_B_PAD_DRUM], 3
        nop
        push    cs
        call    far_50EE2
        pop     ds
        retf
        db      00h
mixer_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        imul    bx, word ptr [C2_W_MIXER_CURSOR], 2ah
        mov     ax, word ptr [bx+C2_TBL_MIXER_FIELD_ENTER_SEG]
        or      ax, word ptr [bx+C2_TBL_MIXER_FIELD_ENTER]
        je      br_52093
        nop
        push    cs
        call    mixer_refresh
        imul    bx, word ptr [C2_W_MIXER_CURSOR], 2ah
        callf   [bx+C2_TBL_MIXER_FIELD_ENTER]
br_52093:
        pop     ds
        retf
        db      00h
mixer_f5:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    mixer_refresh
        nop
        push    cs
        call    fx_not_installed_f5
        pop     ds
        retf
mixer_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        sub     ax, ax
        mov     word ptr [C2_W_PARAM_HOOK_SEG], ax
        mov     word ptr [C2_W_PARAM_HOOK_OFF], ax
        pop     ds
        retf
L_520B8:
        imul    bx, word ptr [C2_W_MIXER_CURSOR], 2ah
        callf   [bx+C2_TBL_MIXER_FIELD_THUNK]
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
        retf
        db      00h
mixer_field0_thunk:
        mov     byte ptr [C2_B_08D90], 1
        mov     word ptr [C2_W_MIXER_CURSOR], 0
        mov     al, byte ptr [C2_B_MIXER_DRUM]
        cbw
        imul    ax, ax, 184h
        add     ax, 9160h
        push    ds
        push    ax
        push    ds
        push    C2_W_044C8
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_520EE:
        mov     al, byte ptr [C2_B_MIXER_DRUM]
        cbw
        imul    bx, ax, 184h
        mov     al, byte ptr [bx+C0_TBL_09160]
        push    ax
        push    EP_MIXER_SETUP_F6_SEG
        push    EP_MIXER_SETUP_F6_OFF
        nop
        push    cs
        call    far_4EFFA
        add     sp, 6
        retf
mixer_field1_thunk:
        mov     byte ptr [C2_B_08D90], 1
        mov     word ptr [C2_W_MIXER_CURSOR], 1
        push    ds
        push    C0_B_0D7C7
        push    ds
        push    C2_W_044F2
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
L_52126:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp+6]
        mov     byte ptr [C0_B_0D7C7], al
        nop
        push    cs
        call    mixer_setup_f6
        leave
        retf
far_52136:
        cmp     byte ptr [C0_B_0D7C7], 2
        jge     br_52144
        nop
        push    cs
        call    mixer_field3_thunk
        retf
        db      90h
br_52144:
        mov     byte ptr [C2_B_08D90], 1
        mov     word ptr [C2_W_MIXER_CURSOR], 2
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        sub     ax, 2
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 47h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_MIXER_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 44c8h
        else
        add     ax, 44c2h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_52178:
        mov     al, byte ptr [C0_B_0D7C7]
        sub     al, 2
        push    ax
        nop
        push    cs
        call    smem_dma_channel_01
        add     sp, 2
        retf
        db      00h
mixer_field3_thunk:
        mov     byte ptr [C2_B_08D90], 20h
        mov     word ptr [C2_W_MIXER_CURSOR], 3
        push    0
        push    0
        push    ds
        push    C2_W_04546
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
mixer_field4_thunk:
        mov     byte ptr [C2_B_08D90], 10h
        mov     word ptr [C2_W_MIXER_CURSOR], 4
        push    0
        push    0
        push    ds
        push    C2_W_04570
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
L_521C0:
        enter   2, 0
        mov     word ptr [C2_W_MIXER_CURSOR], 5
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        cmp     byte ptr es:[bx+46h], 1
        jne     br_521FE
        mov     byte ptr [C2_B_08D90], 2
        imul    bx, word ptr [C2_W_MIXER_CURSOR], 2ah
        mov     word ptr [bp-2], bx
        mov     word ptr [bx+C2_TBL_MIXER_FIELD_ENTER], (C2_BASE+L_54130-C2_SEG*16)
        mov     word ptr [bx+C2_TBL_MIXER_FIELD_ENTER_SEG], C2_SEG
        jmp     br_52217
        db      90h
br_521FE:
        mov     byte ptr [C2_B_08D90], 8
        imul    bx, word ptr [C2_W_MIXER_CURSOR], 2ah
        mov     word ptr [bp-2], bx
        mov     word ptr [bx+C2_TBL_MIXER_FIELD_ENTER], (C2_BASE+far_531E0-C2_SEG*16)
        mov     word ptr [bx+C2_TBL_MIXER_FIELD_ENTER_SEG], C2_SEG
br_52217:
        push    0
        push    0
        mov     ax, word ptr [bp-2]
        if      FW_VERSION >= 110
        add     ax, 44c8h
        else
        add     ax, 44c2h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        leave
        retf
L_5222A:
        enter   2, 0
        cmp     byte ptr [C0_B_0D7C7], 2
        jge     br_5229E
        mov     word ptr [C2_W_MIXER_CURSOR], 6
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        cmp     byte ptr es:[bx+46h], 1
        jne     br_5226E
        mov     byte ptr [C2_B_08D90], 8
        imul    bx, word ptr [C2_W_MIXER_CURSOR], 2ah
        mov     word ptr [bp-2], bx
        mov     word ptr [bx+C2_TBL_MIXER_FIELD_ENTER], (C2_BASE+far_531E0-C2_SEG*16)
        mov     word ptr [bx+C2_TBL_MIXER_FIELD_ENTER_SEG], C2_SEG
        jmp     br_52287
br_5226E:
        mov     byte ptr [C2_B_08D90], 4
        imul    bx, word ptr [C2_W_MIXER_CURSOR], 2ah
        mov     word ptr [bp-2], bx
        mov     word ptr [bx+C2_TBL_MIXER_FIELD_ENTER], (C2_BASE+L_53CA4-C2_SEG*16)
        mov     word ptr [bx+C2_TBL_MIXER_FIELD_ENTER_SEG], C2_SEG
br_52287:
        push    0
        push    0
        mov     ax, word ptr [bp-2]
        if      FW_VERSION >= 110
        add     ax, 44c8h
        else
        add     ax, 44c2h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        leave
        retf
        db      90h
br_5229E:
        nop
        push    cs
        call    far_52136
        leave
        retf
        db      00h
L_522A6:
        mov     word ptr [C2_W_MIXER_CURSOR], 7
        cmp     byte ptr [C0_B_0D7C7], 2
        jl      br_522C6
        mov     byte ptr [C2_B_08D90], 1
        mov     word ptr [C2_W_04614], (C2_BASE+L_54130-C2_SEG*16)
        mov     word ptr [C2_W_04616], C2_SEG
        jmp     br_5230C
br_522C6:
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        cmp     byte ptr es:[bx+46h], 1
        jne     br_522F6
        mov     byte ptr [C2_B_08D90], 4
        imul    bx, word ptr [C2_W_MIXER_CURSOR], 2ah
        mov     word ptr [bx+C2_TBL_MIXER_FIELD_ENTER], (C2_BASE+L_53CA4-C2_SEG*16)
        mov     word ptr [bx+C2_TBL_MIXER_FIELD_ENTER_SEG], C2_SEG
        jmp     br_5230C
br_522F6:
        mov     byte ptr [C2_B_08D90], 2
        imul    bx, word ptr [C2_W_MIXER_CURSOR], 2ah
        mov     word ptr [bx+C2_TBL_MIXER_FIELD_ENTER], (C2_BASE+L_54130-C2_SEG*16)
        mov     word ptr [bx+C2_TBL_MIXER_FIELD_ENTER_SEG], C2_SEG
br_5230C:
        push    0
        push    0
        imul    ax, word ptr [C2_W_MIXER_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 44c8h
        else
        add     ax, 44c2h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
mixer_field8_thunk:
        mov     byte ptr [C2_B_08D90], 1
        mov     word ptr [C2_W_MIXER_CURSOR], 8
        push    0
        push    0
        push    ds
        push    C2_W_04618
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
L_52340:
        enter   4, 0
        push    0
        push    0
        push    EP_FAR_51F38_SEG
        push    EP_FAR_51F38_OFF
        cmp     byte ptr [C0_B_0D7C7], 2
        jl      br_5235E
        mov     ax, (C2_BASE+L_549F0-C2_SEG*16)
        mov     dx, C2_SEG
        jmp     br_52364
        db      90h
br_5235E:
        mov     ax, (C2_BASE+far_54566-C2_SEG*16)
        mov     dx, C2_SEG
br_52364:
        mov     word ptr [bp-2], dx
        mov     word ptr [bp-4], ax
        callf   [bp-4]
        leave
        retf
        db      00h
mixer_field9_thunk:
        mov     word ptr [C2_W_MIXER_CURSOR], 9
        push    ds
        push    C0_B_098B8
        push    ds
        push    C2_W_04642
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
mixer_drum_field_notify:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp+6]
        mov     byte ptr [C2_B_MIXER_DRUM], al
        push    0
        push    0fh
        nop
        push    cs
        call    fx_dsp_update_request
        leave
        retf
L_51A3C:
        db      "MULTI FX1", 00h
far_523A6:
        db      "MULTI FX2", 00h
L_51A50:
        db      "REVERB 1", 00h, 00h
L_51A5A:
        db      "REVERB 2", 00h, 00h
far_523C4:
        db      "R1", 00h, 00h
far_523C8:
far_51A68:
far_51488:
        db      "M1", 00h, 00h
far_523CC:
far_51A6C:
far_5148C:
        db      "FX1 DIST/FLT", 00h, 00h
far_523DA:
far_51A7A:
far_5149A:
        db      "FX1 MOD/ECHO", 00h, 00h
far_523E8:
far_51A88:
far_514A8:
        db      "FX1 REVERB", 00h, 00h
far_523F4:
far_51A94:
far_514B4:
        db      "R2", 00h, 00h
far_523F8:
far_51A98:
far_514B8:
        db      "M2", 00h, 00h
far_523FC:
far_51A9C:
far_514BC:
        db      "FX2 DIST/FLT", 00h, 00h
far_5240A:
        db      "FX2 MOD/ECHO", 00h, 00h
far_52418:
        db      "FX2 REVERB", 00h, 00h
L_52424:
        db      "Input:", 00h, 00h
far_51ACC:
        db      "DIST", 00h, 00h
L_51E32:
far_514F2:
        db      "FILT", 00h, 00h
L_51AD8:
        db      "^MOD", 00h, 00h
L_51C3E:
        db      "ECHO", 00h, 00h
L_51AE4:
        db      "^REV", 00h, 00h
L_51AEA:
        db      "^MIX", 00h, 00h
L_52450:
        push    si
        push    ds
        push    C2_W_0466C
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        mov     si, ax
        imul    bx, si, 184h
        mov     al, byte ptr [bx+C0_TBL_09160]
        mov     byte ptr [C2_B_098B9], al
        mov     byte ptr [C0_B_098B8], al
        mov     al, byte ptr [C0_B_0D7C7]
        mov     byte ptr [C2_B_COPY_FX_DST_SET], al
        mov     byte ptr [C2_W_098BA], al
        cmp     word ptr [C2_W_COPY_FX_CURSOR], 0
        jl      br_52488
        cmp     word ptr [C2_W_COPY_FX_CURSOR], 4
        jb      br_5248E
br_52488:
        mov     word ptr [C2_W_COPY_FX_CURSOR], 0
br_5248E:
        imul    bx, word ptr [C2_W_COPY_FX_CURSOR], 2ah
        callf   [bx+C2_W_046D8]
        pop     si
        retf
        db      00h
copy_fx_f5:
        enter   12h, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C0_B_098B8]
        cmp     byte ptr [C2_B_098B9], al
        jne     br_524BB
        mov     al, byte ptr [C2_B_COPY_FX_DST_SET]
        cmp     byte ptr [C2_W_098BA], al
        jne     br_524BB
        jmp     br_525D6
br_524BB:
        mov     al, byte ptr [C0_B_098B8]
        cbw
        mov     si, ax
        mov     al, 48h
        imul    byte ptr [C2_W_098BA]
        imul    cx, si, 99eh
        add     ax, cx
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        add     ax, 8deh
        mov     word ptr [bp-0eh], ax
        mov     word ptr [bp-0ch], dx
        mov     al, byte ptr [C0_B_098B8]
        cbw
        mov     di, ax
        mov     al, byte ptr [C2_W_098BA]
        cbw
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        shl     ax, 2
        imul    cx, di, 99eh
        add     ax, cx
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        add     ax, PGM_FX_REVERBS
        mov     word ptr [bp-12h], ax
        mov     word ptr [bp-10h], dx
        mov     al, byte ptr [C2_B_098B9]
        cbw
        mov     si, ax
        mov     al, byte ptr [C2_B_COPY_FX_DST_SET]
        cbw
        imul    cx, ax, 48h
        imul    dx, si, 99eh
        add     cx, dx
        add     cx, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        add     cx, 8deh
        mov     word ptr [bp-8], cx
        mov     word ptr [bp-6], dx
        mov     cx, ax
        mov     al, byte ptr [C2_B_098B9]
        cbw
        imul    ax, ax, 99eh
        mov     dx, cx
        add     cx, cx
        add     cx, dx
        shl     cx, 2
        add     cx, ax
        add     cx, word ptr [C2_FP_PGM_ARRAY]
        mov     ax, word ptr [C2_W_PGM_ARRAY_SEG]
        add     cx, PGM_FX_REVERBS
        mov     word ptr [bp-4], cx
        mov     word ptr [bp-2], ax
        cmp     byte ptr [C2_W_098BA], 2
        jge     br_52582
        cmp     dl, 2
        jge     br_52582
        les     bx, [bp-8]
        mov     al, byte ptr es:[bx+47h]
        mov     byte ptr [bp-9], al
        mov     ax, word ptr [bp-0eh]
        mov     dx, word ptr [bp-0ch]
        push    ds
        mov     di, bx
        mov     si, ax
        mov     ds, dx
        mov     cx, 24h
        rep movsw
        pop     ds
        mov     bx, word ptr [bp-8]
        mov     al, byte ptr [bp-9]
        mov     byte ptr es:[bx+47h], al
br_52582:
        les     bx, [bp-4]
        mov     al, byte ptr es:[bx+0ah]
        mov     byte ptr [bp-5], al
        mov     al, byte ptr es:[bx+0bh]
        mov     byte ptr [bp-6], al
        mov     ax, word ptr [bp-12h]
        mov     dx, word ptr [bp-10h]
        push    ds
        mov     di, bx
        mov     si, ax
        mov     ds, dx
        mov     cx, 6
        rep movsw
        pop     ds
        cmp     byte ptr [C2_W_098BA], 2
        jge     br_525C5
        cmp     byte ptr [C2_B_COPY_FX_DST_SET], 2
        jl      br_525C5
        mov     bx, word ptr [bp-4]
        mov     al, byte ptr [bp-5]
        mov     byte ptr es:[bx+0ah], al
        mov     al, byte ptr [bp-6]
        mov     byte ptr es:[bx+0bh], al
br_525C5:
        push    0
        push    0fh
        nop
        push    cs
        call    fx_dsp_update_request
        add     sp, 4
        nop
        push    cs
        call    copy_fx_open
br_525D6:
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h
copy_fx_paint:
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    EP_L_51DE2_SEG
        push    EP_L_51DE2_OFF
        callf   EP_SMEM_PROC_WRAPPER_SEG:EP_SMEM_PROC_WRAPPER_OFF
        add     sp, 4
        push    ds
        push    C2_W_0468A
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        push    2
        mov     al, byte ptr [C0_B_098B8]
        cbw
        inc     ax
        cwd
        push    dx
        push    ax
        push    0bh
        push    55h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        mov     al, byte ptr [C0_B_098B8]
        cbw
        mov     si, ax
        imul    ax, si, 99eh
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        add     ax, 2
        push    dx
        push    ax
        push    0bh
        push    67h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        mov     al, byte ptr [C2_W_098BA]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C2_TBL_043F4]
        push    word ptr [bx+C2_TBL_043F2]
        push    14h
        push    55h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        push    2
        mov     al, byte ptr [C2_B_098B9]
        cbw
        inc     ax
        cwd
        push    dx
        push    ax
        push    20h
        push    55h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        mov     al, byte ptr [C2_B_098B9]
        cbw
        imul    ax, ax, 99eh
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        add     ax, 2
        push    dx
        push    ax
        push    20h
        push    67h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        mov     al, byte ptr [C2_B_COPY_FX_DST_SET]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C2_TBL_043F4]
        push    word ptr [bx+C2_TBL_043F2]
        push    29h
        push    55h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        mov     al, byte ptr [C0_B_098B8]
        cmp     byte ptr [C2_B_098B9], al
        jne     br_526B9
        mov     al, byte ptr [C2_B_COPY_FX_DST_SET]
        cmp     byte ptr [C2_W_098BA], al
        je      br_526CB
br_526B9:
        push    EP_FAR_47ABE_SEG
        push    EP_FAR_47ABE_OFF
        push    1
        push    5
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
br_526CB:
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        pop     si
        retf
        db      00h
copy_fx_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    mixer_setup_f6
        pop     ds
        retf
        db      00h
copy_fx_field0_thunk:
        mov     word ptr [C2_W_COPY_FX_CURSOR], 0
        push    ds
        push    C0_B_098B8
        push    ds
        push    C2_W_046CA
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
copy_fx_field1_thunk:
        mov     word ptr [C2_W_COPY_FX_CURSOR], 1
        push    ds
        push    C2_W_098BA
        push    ds
        push    C2_W_046F4
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
copy_fx_field2_thunk:
        mov     word ptr [C2_W_COPY_FX_CURSOR], 2
        push    ds
        push    C2_B_098B9
        push    ds
        push    C2_W_0471E
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
copy_fx_field3_thunk:
        mov     word ptr [C2_W_COPY_FX_CURSOR], 3
        push    ds
        push    C2_W_098BB
        push    ds
        push    C2_W_04748
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        nop
L_51DE2:
        db      "Copy Effect Settings", 00h
        db      00h
fx_dist_ringmod_enter:
        and     byte ptr [C2_B_09604], 0fch
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+45h]
        mov     byte ptr [C2_B_09606], al
        nop
        push    cs
        call    far_5277C
        retf
        db      00h
far_5277C:
        test    byte ptr [C2_B_09604], 1
        jne     br_5278A
        test    byte ptr [C2_B_09604], 2
        je      br_5279F
br_5278A:
        mov     al, byte ptr [C2_B_09606]
        push    ax
        mov     cl, byte ptr [C0_B_0D7C7]
        mov     al, 1
        shl     al, cl
        push    ax
        nop
        push    cs
        call    fx_dsp_update_request
        add     sp, 4
br_5279F:
        push    ds
        push    C2_W_04772
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        mov     word ptr [C2_W_PARAM_HOOK_OFF], (C2_BASE+L_528D4-C2_SEG*16)
        mov     word ptr [C2_W_PARAM_HOOK_SEG], C2_SEG
        cmp     word ptr [C2_W_DIST_RINGMOD_CURSOR], 0
        jl      L_51E65
        cmp     word ptr [C2_W_DIST_RINGMOD_CURSOR], 4
        jb      br_527CB
L_51E65:
        mov     word ptr [C2_W_DIST_RINGMOD_CURSOR], 0
br_527CB:
        imul    bx, word ptr [C2_W_DIST_RINGMOD_CURSOR], 2ah
        callf   [bx+C2_W_04804]
        retf
        db      00h
fx_dist_ringmod_f2:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    20h
        nop
        push    cs
        call    far_52A4C
        add     sp, 2
        pop     ds
        retf
fx_dist_ringmod_f3:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    20h
        nop
        push    cs
        call    far_52ADE
        add     sp, 2
        pop     ds
        retf
fx_dist_ringmod_paint:
        enter   4, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    EP_L_52276_SEG
        push    EP_L_52276_OFF
        nop
        push    cs
        call    far_529AC
        add     sp, 4
        push    ds
        push    C2_W_047A4
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        push    2
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+3]
        sub     ah, ah
        push    0
        push    ax
        push    19h
        push    4fh
        mov     di, es
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    2
        mov     es, di
        mov     al, byte ptr es:[si+4]
        sub     ah, ah
        push    0
        push    ax
        push    24h
        push    4fh
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    4
        mov     es, di
        push    0
        push    word ptr es:[si]
        push    19h
        push    0afh
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    2
        mov     es, di
        mov     al, byte ptr es:[si+2]
        sub     ah, ah
        push    0
        push    ax
        push    24h
        push    0afh
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h
fx_dist_ringmod_f5:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    fx_edit_refresh
        push    ds
        push    C0_B_09604
        push    EP_FAR_5277C_SEG
        push    EP_FAR_5277C_OFF
        nop
        push    cs
        call    far_54566
        add     sp, 8
        pop     ds
        retf
        db      00h
fx_dist_ringmod_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    fx_edit_refresh
        nop
        push    cs
        call    mixer_setup_f6
        pop     ds
        retf
L_528D4:
        and     byte ptr [C2_B_09604], 0fch
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+45h]
        mov     byte ptr [C2_B_09606], al
        imul    bx, word ptr [C2_W_DIST_RINGMOD_CURSOR], 2ah
        callf   [bx+C2_W_04804]
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
        retf
fx_dist_ringmod_field0_thunk:
        mov     word ptr [C2_W_DIST_RINGMOD_CURSOR], 0
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 3
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_DIST_RINGMOD_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 47f6h
        else
        add     ax, 47f0h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_dist_ringmod_field1_thunk:
        mov     word ptr [C2_W_DIST_RINGMOD_CURSOR], 1
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 4
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_DIST_RINGMOD_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 47f6h
        else
        add     ax, 47f0h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_dist_ringmod_field2_thunk:
        mov     word ptr [C2_W_DIST_RINGMOD_CURSOR], 2
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_DIST_RINGMOD_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 47f6h
        else
        add     ax, 47f0h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
fx_dist_ringmod_field3_thunk:
        mov     word ptr [C2_W_DIST_RINGMOD_CURSOR], 3
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 2
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_DIST_RINGMOD_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 47f6h
        else
        add     ax, 47f0h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
far_529AC:
        enter   4, 0
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   EP_SMEM_PROC_WRAPPER_SEG:EP_SMEM_PROC_WRAPPER_OFF
        add     sp, 4
        test    byte ptr [C2_B_09604], 4
        je      br_529D4
        test    byte ptr [C2_B_09604], 1
        je      br_529D4
        mov     ax, (C1_BASE+L_3EECC-C1_SEG*16)
        mov     dx, C1_SEG
        jmp     SHORT br_529DA
br_529D4:
        mov     ax, STR_C2_SOLO
        mov     dx, C2_SEG
br_529DA:
        push    dx
        push    ax
        push    1
        push    2
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
        test    byte ptr [C2_B_09604], 4
        je      br_529FE
        test    byte ptr [C2_B_09604], 2
        je      br_529FE
        mov     ax, (C1_BASE+L_3EECC-C1_SEG*16)
        mov     dx, C1_SEG
        jmp     br_52A04
br_529FE:
        mov     ax, (C2_BASE+L_52BF0-C2_SEG*16)
        mov     dx, C2_SEG
br_52A04:
        push    dx
        push    ax
        push    1
        push    3
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
        push    EP_L_52298_SEG
        push    EP_L_52298_OFF
        push    2
        push    4
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
        push    EP_FAR_52BFE_SEG
        push    EP_FAR_52BFE_OFF
        push    1
        push    5
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        leave
        retf
        db      00h
fx_section_field_notify:
        mov     al, byte ptr [C2_B_09606]
        push    ax
        mov     cl, byte ptr [C0_B_0D7C7]
        mov     al, 1
        shl     al, cl
        push    ax
        nop
        push    cs
        call    fx_dsp_update_request
        add     sp, 4
        retf
far_52A4C:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp+6]
        not     al
        and     al, 0feh
        mov     byte ptr [C2_B_09606], al
        and     byte ptr [C2_B_09604], 0fdh
        mov     al, byte ptr [C2_B_09604]
        and     ax, 1
        cmp     ax, 1
        sbb     ax, ax
        neg     ax
        xor     al, byte ptr [C2_B_09604]
        and     ax, 1
        xor     word ptr [C2_B_09604], ax
        cmp     byte ptr [C0_B_0D7C7], 2
        jge     br_52AB0
        test    byte ptr [C2_B_09604], 1
        jne     br_52A9B
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        mov     sp, bp
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+45h]
        mov     byte ptr [C2_B_09606], al
br_52A9B:
        mov     al, byte ptr [C2_B_09606]
        push    ax
        mov     cl, byte ptr [C0_B_0D7C7]
        mov     al, 1
        shl     al, cl
        push    ax
        nop
        push    cs
        call    fx_dsp_update_request
        leave
        retf
        db      90h
br_52AB0:
        test    byte ptr [C2_B_09604], 1
        jne     br_52ACF
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_REVERB_PTR_SEG:EP_PGM_FX_REVERB_PTR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+1]
        mov     byte ptr [C2_B_09606], al
br_52ACF:
        mov     al, byte ptr [C2_B_09606]
        push    ax
        mov     al, byte ptr [C0_B_0D7C7]
        push    ax
        nop
        push    cs
        call    lcd_clear_rect
        leave
        retf
far_52ADE:
        push    bp
        mov     bp, sp
        and     byte ptr [C2_B_09604], 0feh
        mov     al, byte ptr [C2_B_09604]
        and     ax, 2
        cmp     ax, 1
        sbb     ax, ax
        neg     ax
        add     al, al
        xor     al, byte ptr [C2_B_09604]
        and     ax, 2
        xor     word ptr [C2_B_09604], ax
        cmp     byte ptr [C0_B_0D7C7], 2
        jl      br_52B3A
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_REVERB_PTR_SEG:EP_PGM_FX_REVERB_PTR_OFF
        mov     sp, bp
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+1]
        mov     byte ptr [C2_B_09606], al
        test    byte ptr [C2_B_09604], 2
        je      br_52B2A
        or      byte ptr [C2_B_09606], 2
br_52B2A:
        mov     al, byte ptr [C2_B_09606]
        push    ax
        mov     al, byte ptr [C0_B_0D7C7]
        push    ax
        nop
        push    cs
        call    lcd_clear_rect
        leave
        retf
        db      90h
br_52B3A:
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+45h]
        mov     byte ptr [C2_B_09606], al
        test    byte ptr [C2_B_09604], 2
        je      br_52B60
        mov     al, byte ptr [bp+6]
        or      byte ptr [C2_B_09606], al
br_52B60:
        mov     al, byte ptr [C2_B_09606]
        push    ax
        mov     cl, byte ptr [C0_B_0D7C7]
        mov     al, 1
        shl     al, cl
        push    ax
        nop
        push    cs
        call    fx_dsp_update_request
        leave
        retf
fx_edit_key_33:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     cx, ax
        sub     ax, word ptr [C2_W_0489E]
        cmp     ax, 1f4h
        jbe     br_52BA9
        mov     word ptr [C2_W_0489E], cx
        mov     al, byte ptr [C2_B_09604]
        and     ax, 4
        cmp     ax, 1
        sbb     ax, ax
        neg     ax
        shl     al, 2
        xor     al, byte ptr [C2_B_09604]
        and     ax, 4
        xor     word ptr [C2_B_09604], ax
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
br_52BA9:
        pop     ds
        retf
        db      00h
fx_edit_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        test    byte ptr [C2_B_09604], 1
        jne     br_52BC0
        test    byte ptr [C2_B_09604], 2
        je      br_52BCC
br_52BC0:
        mov     al, byte ptr [C0_B_0D7C7]
        push    ax
        nop
        push    cs
        call    smem_dma_channel_01
        add     sp, 2
br_52BCC:
        sub     ax, ax
        mov     word ptr [C2_W_PARAM_HOOK_SEG], ax
        mov     word ptr [C2_W_PARAM_HOOK_OFF], ax
        pop     ds
        retf
L_52276:
        db      "DISTORTION/RINGMOD", 00h, 00h
L_52BEA:
        db      "SOLO", 00h, 00h
L_52BF0:
        db      "BYPASS", 00h, 00h
L_52298:
        db      "CLOSE", 00h
far_52BFE:
        db      "MIXER", 00h
far_52C04:
        and     byte ptr [C0_B_09604], 0fch
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+45h]
        mov     byte ptr [C2_B_09606], al
        nop
        push    cs
        call    far_52C28
        retf
        db      00h
far_52C28:
        test    byte ptr [C2_B_09604], 1
        jne     br_52C36
        test    byte ptr [C2_B_09604], 2
        je      br_52C4B
br_52C36:
        mov     al, byte ptr [C2_B_09606]
        push    ax
        mov     cl, byte ptr [C0_B_0D7C7]
        mov     al, 1
        shl     al, cl
        push    ax
        nop
        push    cs
        call    fx_dsp_update_request
        add     sp, 4
br_52C4B:
        push    ds
        push    C2_W_048A0
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        mov     word ptr [C2_W_PARAM_HOOK_OFF], (C2_BASE+L_52E54-C2_SEG*16)
        mov     word ptr [C2_W_PARAM_HOOK_SEG], C2_SEG
        cmp     word ptr [C2_W_FILTER4_CURSOR], 0
        jl      L_52311
        cmp     word ptr [C2_W_FILTER4_CURSOR], 0eh
        jb      br_52C77
L_52311:
        mov     word ptr [C2_W_FILTER4_CURSOR], 0
br_52C77:
        imul    bx, word ptr [C2_W_FILTER4_CURSOR], 2ah
        callf   [bx+C2_TBL_FILTER4_FIELD_THUNK]
        retf
        db      00h
filter4_f2:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    10h
        nop
        push    cs
        call    far_52A4C
        add     sp, 2
        pop     ds
        retf
filter4_f3:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    10h
        nop
        push    cs
        call    far_52ADE
        add     sp, 2
        pop     ds
        retf
filter4_paint:
        enter   4, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    EP_L_52872_SEG
        push    EP_L_52872_OFF
        nop
        push    cs
        call    far_529AC
        add     sp, 4
        push    ds
        push    C2_W_048D2
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+0eh]
        push    ax
        push    0bh
        push    31h
        mov     di, es
        nop
        push    cs
        call    far_530E8
        add     sp, 6
        mov     es, di
        mov     al, byte ptr es:[si+0bh]
        push    ax
        push    15h
        push    31h
        nop
        push    cs
        call    far_530E8
        add     sp, 6
        mov     es, di
        mov     al, byte ptr es:[si+8]
        push    ax
        push    1fh
        push    31h
        nop
        push    cs
        call    far_530E8
        add     sp, 6
        mov     es, di
        mov     al, byte ptr es:[si+6]
        push    ax
        push    29h
        push    31h
        nop
        push    cs
        call    far_530E8
        add     sp, 6
        mov     es, di
        mov     al, byte ptr es:[si+0fh]
        push    ax
        push    0bh
        push    55h
        nop
        push    cs
        call    far_5317E
        add     sp, 6
        mov     es, di
        mov     al, byte ptr es:[si+0ch]
        push    ax
        push    15h
        push    55h
        nop
        push    cs
        call    far_5317E
        add     sp, 6
        mov     es, di
        mov     al, byte ptr es:[si+9]
        push    ax
        push    1fh
        push    55h
        nop
        push    cs
        call    far_5317E
        add     sp, 6
        mov     es, di
        mov     al, byte ptr es:[si+7]
        push    ax
        push    29h
        push    55h
        nop
        push    cs
        call    far_5317E
        add     sp, 6
        push    2
        mov     es, di
        mov     al, byte ptr es:[si+0dh]
        sub     ah, ah
        push    0
        push    ax
        push    15h
        push    7fh
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    2
        mov     es, di
        mov     al, byte ptr es:[si+0ah]
        sub     ah, ah
        push    0
        push    ax
        push    1fh
        push    7fh
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    1
        push    1
        mov     es, di
        mov     al, byte ptr es:[si+12h]
        sub     ah, ah
        push    0
        push    ax
        push    15h
        push    9dh
        callf   EP_DRAW_FIXED_DECIMAL_SEG:EP_DRAW_FIXED_DECIMAL_OFF
        add     sp, 0ch
        push    1
        push    1
        mov     es, di
        mov     al, byte ptr es:[si+10h]
        sub     ah, ah
        push    0
        push    ax
        push    1fh
        push    9dh
        callf   EP_DRAW_FIXED_DECIMAL_SEG:EP_DRAW_FIXED_DECIMAL_OFF
        add     sp, 0ch
        push    2
        mov     es, di
        mov     al, byte ptr es:[si+13h]
        sub     ah, ah
        push    0
        push    ax
        push    15h
        push    0d3h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    2
        mov     es, di
        mov     al, byte ptr es:[si+11h]
        sub     ah, ah
        push    0
        push    ax
        push    1fh
        push    0d3h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h
filter4_f5:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    fx_edit_refresh
        push    ds
        push    C0_B_09604
        push    EP_FAR_52C28_SEG
        push    EP_FAR_52C28_OFF
        nop
        push    cs
        call    far_54566
        add     sp, 8
        pop     ds
        retf
        db      00h
filter4_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    fx_edit_refresh
        nop
        push    cs
        call    mixer_setup_f6
        pop     ds
        retf
L_52E54:
        and     byte ptr [C2_B_09604], 0fch
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+45h]
        mov     byte ptr [C2_B_09606], al
        imul    bx, word ptr [C2_W_FILTER4_CURSOR], 2ah
        callf   [bx+C2_TBL_FILTER4_FIELD_THUNK]
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
        retf
filter4_field0_thunk:
        mov     word ptr [C2_W_FILTER4_CURSOR], 0
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 0eh
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FILTER4_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 493ch
        else
        add     ax, 4936h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
filter4_field1_thunk:
        mov     word ptr [C2_W_FILTER4_CURSOR], 1
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 0fh
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FILTER4_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 493ch
        else
        add     ax, 4936h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
filter4_field2_thunk:
        mov     word ptr [C2_W_FILTER4_CURSOR], 2
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 0bh
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FILTER4_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 493ch
        else
        add     ax, 4936h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
filter4_field3_thunk:
        mov     word ptr [C2_W_FILTER4_CURSOR], 3
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 0ch
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FILTER4_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 493ch
        else
        add     ax, 4936h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
filter4_field4_thunk:
        mov     word ptr [C2_W_FILTER4_CURSOR], 4
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 0dh
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FILTER4_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 493ch
        else
        add     ax, 4936h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
filter4_field5_thunk:
        mov     word ptr [C2_W_FILTER4_CURSOR], 5
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 12h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FILTER4_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 493ch
        else
        add     ax, 4936h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
filter4_field6_thunk:
far_52048:
        mov     word ptr [C2_W_FILTER4_CURSOR], 6
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 13h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FILTER4_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 493ch
        else
        add     ax, 4936h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
filter4_field7_thunk:
        mov     word ptr [C2_W_FILTER4_CURSOR], 7
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 8
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FILTER4_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 493ch
        else
        add     ax, 4936h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
filter4_field8_thunk:
        mov     word ptr [C2_W_FILTER4_CURSOR], 8
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 9
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FILTER4_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 493ch
        else
        add     ax, 4936h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
filter4_field9_thunk:
        mov     word ptr [C2_W_FILTER4_CURSOR], 9
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 0ah
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FILTER4_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 493ch
        else
        add     ax, 4936h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
filter4_field10_thunk:
        mov     word ptr [C2_W_FILTER4_CURSOR], 0ah
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 10h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FILTER4_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 493ch
        else
        add     ax, 4936h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
filter4_field11_thunk:
        mov     word ptr [C2_W_FILTER4_CURSOR], 0bh
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 11h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FILTER4_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 493ch
        else
        add     ax, 4936h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
filter4_field12_thunk:
        mov     word ptr [C2_W_FILTER4_CURSOR], 0ch
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 6
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FILTER4_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 493ch
        else
        add     ax, 4936h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
filter4_field13_thunk:
        mov     word ptr [C2_W_FILTER4_CURSOR], 0dh
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 7
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FILTER4_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 493ch
        else
        add     ax, 4936h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
far_530E8:
        enter   8, 0
        push    14h
        mov     al, byte ptr [bp+0ah]
        cbw
        push    ax
        callf   EP_DIV_SEG:EP_DIV_OFF
        add     sp, 4
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        or      ax, ax
        je      br_53110
        dec     ax
        je      br_53128
        dec     ax
        je      br_53140
        dec     ax
        je      br_53152
        jmp     br_53168
br_53110:
        mov     byte ptr [bp-4], 20h
        mov     bx, dx
        add     bx, dx
        mov     al, byte ptr [bx+C2_B_04B88]
        mov     byte ptr [bp-3], al
loop_5311F:
        mov     al, byte ptr [bx+C2_B_04B89]
        mov     byte ptr [bp-2], al
        jmp     br_53168
br_53128:
        mov     bx, dx
        add     bx, dx
        mov     al, byte ptr [bx+C2_B_04B88]
        mov     byte ptr [bp-4], al
        mov     al, byte ptr [bx+C2_B_04B89]
        mov     byte ptr [bp-3], al
        mov     byte ptr [bp-2], 30h
        jmp     br_53168
br_53140:
        mov     bx, dx
        add     bx, dx
        mov     al, byte ptr [bx+C2_B_04B88]
        mov     byte ptr [bp-4], al
        mov     byte ptr [bp-3], 6bh
        jmp     loop_5311F
        db      90h
br_53152:
        mov     bx, dx
        add     bx, dx
        mov     al, byte ptr [bx+C2_B_04B88]
        mov     byte ptr [bp-4], al
        mov     al, byte ptr [bx+C2_B_04B89]
        mov     byte ptr [bp-3], al
        mov     byte ptr [bp-2], 6bh
br_53168:
        mov     byte ptr [bp-1], 0
        lea     ax, [bp-4]
        push    ss
        push    ax
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        leave
        retf
far_5317E:
        push    bp
        mov     bp, sp
        push    di
        push    si
        cmp     byte ptr [bp+0ah], 0dbh
        jle     br_531A4
        mov     di, word ptr [bp+8]
        mov     si, word ptr [bp+6]
        push    2
        mov     al, byte ptr [bp+0ah]
        cbw
        cwd
        push    dx
        push    ax
        push    di
        push    si
        callf   EP_DRAW_SIGNED_VALUE_SEG:EP_DRAW_SIGNED_VALUE_OFF
        add     sp, 0ah
        jmp     br_531BB
br_531A4:
        mov     di, word ptr [bp+8]
        mov     si, word ptr [bp+6]
        push    ds
        push    C2_W_07A1D
        lea     ax, [di+1]
        push    ax
        push    si
        callf   EP_DRAW_BITMAP_PTR_SEG:EP_DRAW_BITMAP_PTR_OFF
        add     sp, 8
br_531BB:
        push    EP_FAR_4877E_SEG
        push    EP_FAR_4877E_OFF
        push    di
        lea     ax, [si+12h]
        push    ax
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        pop     si
        pop     di
        leave
        retf
L_52872:
        db      "4-BAND FILTER"
        db      00h
far_531E0:
        enter   4, 0
        push    si
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     si, ax
        mov     word ptr [bp-2], dx
        and     byte ptr [C2_B_09604], 0fch
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+45h]
        mov     byte ptr [C2_B_09606], al
        mov     es, word ptr [bp-2]
        cmp     byte ptr es:[si+16h], 0
        jne     br_53224
        mov     al, byte ptr es:[si+17h]
        jmp     br_5322A
br_53224:
        mov     al, byte ptr es:[si+16h]
        add     al, 2
br_5322A:
        mov     byte ptr [C2_B_FX_MOD_TYPE], al
        nop
        push    cs
        call    far_53236
        pop     si
        leave
        retf
        db      00h
far_53236:
        test    byte ptr [C2_B_09604], 1
        jne     br_53244
        test    byte ptr [C2_B_09604], 2
        je      br_53259
br_53244:
        mov     al, byte ptr [C2_B_09606]
        push    ax
        mov     cl, byte ptr [C0_B_0D7C7]
        mov     al, 1
        shl     al, cl
        push    ax
        nop
        push    cs
        call    fx_dsp_update_request
        add     sp, 4
br_53259:
        cmp     byte ptr [C2_B_FX_MOD_TYPE], 3
        jne     br_53266
        nop
        push    cs
        call    far_53510
        retf
br_53266:
        cmp     byte ptr [C2_B_FX_MOD_TYPE], 4
        jne     br_53274
        nop
        push    cs
        call    far_537C4
        retf
        db      90h
br_53274:
        cmp     byte ptr [C2_B_FX_MOD_TYPE], 5
        je      br_532B8
        cmp     byte ptr [C2_B_FX_MOD_TYPE], 6
        je      br_532B8
        push    ds
        push    C2_W_04BCC
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        mov     word ptr [C2_W_PARAM_HOOK_OFF], (C2_BASE+L_533C6-C2_SEG*16)
        mov     word ptr [C2_W_PARAM_HOOK_SEG], C2_SEG
        cmp     word ptr [C2_W_FX_MOD_CURSOR], 0
        jl      br_532A8
        cmp     word ptr [C2_W_FX_MOD_CURSOR], 4
        jb      br_532AE
br_532A8:
        mov     word ptr [C2_W_FX_MOD_CURSOR], 0
br_532AE:
        imul    bx, word ptr [C2_W_FX_MOD_CURSOR], 2ah
        callf   [bx+C2_W_04C3C]
        retf
br_532B8:
        nop
        push    cs
        call    far_53AD4
        retf
fx_chorus_f2:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    8
        nop
        push    cs
        call    far_52A4C
        add     sp, 2
        pop     ds
        retf
fx_chorus_f3:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    8
        nop
        push    cs
        call    far_52ADE
        add     sp, 2
        pop     ds
        retf
fx_chorus_paint:
        enter   4, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    C2_SEG
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
        push    EP_C2_5364_OFF
        else
        push    EP_FAR_53504_OFF
        endif
        nop
        push    cs
        call    far_529AC
        add     sp, 4
        push    ds
        push    C2_W_04BFE
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        mov     al, byte ptr [C2_B_FX_MOD_TYPE]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C2_TBL_FX_MOD_TYPE_NAMES_SEG]
        push    word ptr [bx+C2_TBL_FX_MOD_TYPE_NAMES]
        push    0bh
        push    31h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        push    1
        push    1
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+18h]
        sub     ah, ah
        push    0
        push    ax
        push    15h
        push    0bbh
        mov     di, es
        callf   EP_DRAW_FIXED_DECIMAL_SEG:EP_DRAW_FIXED_DECIMAL_OFF
        add     sp, 0ch
        push    2
        mov     es, di
        mov     al, byte ptr es:[si+19h]
        sub     ah, ah
        push    0
        push    ax
        push    1fh
        push    0bbh
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    2
        mov     es, di
        mov     al, byte ptr es:[si+1ah]
        cbw
        cwd
        push    dx
        push    ax
        push    29h
        push    0bbh
        callf   EP_DRAW_SIGNED_VALUE_SEG:EP_DRAW_SIGNED_VALUE_OFF
        add     sp, 0ah
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h
fx_chorus_f5:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    fx_edit_refresh
        push    ds
        push    C0_B_09604
        push    EP_FAR_53236_SEG
        push    EP_FAR_53236_OFF
        nop
        push    cs
        call    far_54566
        add     sp, 8
        pop     ds
        retf
        db      00h
fx_chorus_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    fx_edit_refresh
        nop
        push    cs
        call    mixer_setup_f6
        pop     ds
        retf
L_533C6:
        nop
        push    cs
        call    far_531E0
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
        retf
        db      00h
fx_chorus_field1_thunk:
        mov     word ptr [C2_W_FX_MOD_CURSOR], 1
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 18h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MOD_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 4c2eh
        else
        add     ax, 4c28h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_chorus_field2_thunk:
        mov     word ptr [C2_W_FX_MOD_CURSOR], 2
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 19h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MOD_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 4c2eh
        else
        add     ax, 4c28h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_chorus_field3_thunk:
        mov     word ptr [C2_W_FX_MOD_CURSOR], 3
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 1ah
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MOD_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 4c2eh
        else
        add     ax, 4c28h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_chorus_field0_thunk:
        mov     word ptr [C2_W_FX_MOD_CURSOR], 0
        push    ds
        push    C0_B_08E70
        push    ds
        push    C2_W_04C2E
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_5346E:
        push    si
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     si, ax
        cmp     byte ptr [C2_B_FX_MOD_TYPE], 2
        jg      br_53496
        mov     es, dx
        mov     byte ptr es:[si+16h], 0
        mov     al, byte ptr [C2_B_FX_MOD_TYPE]
        mov     byte ptr es:[si+17h], al
        jmp     br_534A1
        db      90h
br_53496:
        mov     al, byte ptr [C2_B_FX_MOD_TYPE]
        sub     al, 2
        mov     es, dx
        mov     byte ptr es:[si+16h], al
br_534A1:
        nop
        push    cs
        call    fx_section_field_notify
        nop
        push    cs
        call    far_53236
        pop     si
        retf
        db      90h
far_5256E:
        db      "PHASE SHIFT"
        db      00h
far_534BA:
        db      "FLANGE"
        db      00h, 00h
far_534C2:
        db      "CHORUS"
        db      00h, 00h
far_534CA:
        db      "ROTARY SPEAKERS"
        db      00h
L_534DA:
        db      "FMOD/AUTOPAN"
        db      00h, 00h
far_534E8:
        db      "PITCH SHIFT"
        db      00h
far_534F4:
        db      "PITCH+FEEDBACK"
        db      00h, 00h
far_52BA4:
far_53504:
        db      "MODULATIO"
        db      4eh, 00h, 00h
far_53510:
        push    ds
        push    P_4CD6
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        mov     word ptr [C2_W_PARAM_HOOK_OFF], (C2_BASE+L_53684-C2_SEG*16)
        mov     word ptr [C2_W_PARAM_HOOK_SEG], C2_SEG
        cmp     word ptr [C2_W_FX_MOD_CURSOR], 0
        jl      L_52BD6
        cmp     word ptr [C2_W_FX_MOD_CURSOR], 6
        jb      br_5353C
L_52BD6:
        mov     word ptr [C2_W_FX_MOD_CURSOR], 0
br_5353C:
        imul    bx, word ptr [C2_W_FX_MOD_CURSOR], 2ah
        callf   [bx+C2_W_04D76]
        retf
fx_rotary_f2:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    8
        nop
        push    cs
        call    far_52A4C
        add     sp, 2
        pop     ds
        retf
fx_rotary_f3:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    8
        nop
        push    cs
        call    far_52ADE
        add     sp, 2
        pop     ds
        retf
fx_rotary_paint:
        enter   4, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    C2_SEG
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
        push    EP_C2_5364_OFF
        else
        push    EP_FAR_53504_OFF
        endif
        nop
        push    cs
        call    far_529AC
        add     sp, 4
        push    ds
        push    C2_W_04D08
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        mov     al, byte ptr [C2_B_FX_MOD_TYPE]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C2_TBL_FX_MOD_TYPE_NAMES_SEG]
        push    word ptr [bx+C2_TBL_FX_MOD_TYPE_NAMES]
        push    0bh
        push    31h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        push    1
        push    1
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+1bh]
        sub     ah, ah
        push    0
        push    ax
        push    19h
        push    43h
        mov     di, es
        callf   EP_DRAW_FIXED_DECIMAL_SEG:EP_DRAW_FIXED_DECIMAL_OFF
        add     sp, 0ch
        push    2
        mov     es, di
        mov     al, byte ptr es:[si+1eh]
        sub     ah, ah
        push    0
        push    ax
        push    24h
        push    43h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    3
        mov     es, di
        mov     al, byte ptr es:[si+1fh]
        sub     ah, ah
        push    0
        push    ax
        push    15h
        push    0c7h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    1
        push    1
        mov     es, di
        mov     al, byte ptr es:[si+1dh]
        sub     ah, ah
        push    0
        push    ax
        push    1fh
        push    0c7h
        callf   EP_DRAW_FIXED_DECIMAL_SEG:EP_DRAW_FIXED_DECIMAL_OFF
        add     sp, 0ch
        push    1
        push    1
        mov     es, di
        mov     al, byte ptr es:[si+1ch]
        sub     ah, ah
        push    0
        push    ax
        push    29h
        push    0c7h
        callf   EP_DRAW_FIXED_DECIMAL_SEG:EP_DRAW_FIXED_DECIMAL_OFF
        add     sp, 0ch
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        pop     si
        pop     di
        leave
        retf
fx_rotary_f5:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    fx_edit_refresh
        push    ds
        push    C0_B_09604
        push    EP_FAR_53236_SEG
        push    EP_FAR_53236_OFF
        nop
        push    cs
        call    far_54566
        add     sp, 8
        pop     ds
        retf
        db      00h
fx_rotary_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    fx_edit_refresh
        nop
        push    cs
        call    mixer_setup_f6
        pop     ds
        retf
L_53684:
        nop
        push    cs
        call    far_531E0
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
        retf
        db      00h
fx_rotary_field1_thunk:
        mov     word ptr [C2_W_FX_MOD_CURSOR], 1
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 1bh
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MOD_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 4d68h
        else
        add     ax, 4d62h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_rotary_field2_thunk:
        mov     word ptr [C2_W_FX_MOD_CURSOR], 2
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 1eh
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MOD_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 4d68h
        else
        add     ax, 4d62h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_rotary_field3_thunk:
        mov     word ptr [C2_W_FX_MOD_CURSOR], 3
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 1fh
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MOD_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 4d68h
        else
        add     ax, 4d62h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_rotary_field4_thunk:
        mov     word ptr [C2_W_FX_MOD_CURSOR], 4
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 1dh
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MOD_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 4d68h
        else
        add     ax, 4d62h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_rotary_field5_thunk:
        mov     word ptr [C2_W_FX_MOD_CURSOR], 5
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 1ch
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MOD_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 4d68h
        else
        add     ax, 4d62h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_rotary_field0_thunk:
        mov     word ptr [C2_W_FX_MOD_CURSOR], 0
        push    ds
        push    C0_B_08E70
        push    ds
        push    C2_W_04D68
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
far_53784:
        push    si
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     si, ax
        cmp     byte ptr [C2_B_FX_MOD_TYPE], 2
        jg      br_537AC
        mov     es, dx
        mov     byte ptr es:[si+16h], 0
        mov     al, byte ptr [C2_B_FX_MOD_TYPE]
        mov     byte ptr es:[si+17h], al
        jmp     br_537B7
        db      90h
br_537AC:
        mov     al, byte ptr [C2_B_FX_MOD_TYPE]
        sub     al, 2
        mov     es, dx
        mov     byte ptr es:[si+16h], al
br_537B7:
        nop
        push    cs
        call    fx_section_field_notify
        nop
        push    cs
        call    far_53236
        pop     si
        retf
        db      90h
far_537C4:
        push    ds
        push    P_4E74
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        mov     word ptr [C2_W_PARAM_HOOK_OFF], P_57F6
        mov     word ptr [C2_W_PARAM_HOOK_SEG], C2_SEG
        cmp     word ptr [C2_W_FX_MOD_CURSOR], 0
        jl      L_52E8A
        cmp     word ptr [C2_W_FX_MOD_CURSOR], 7
        jb      br_537F0
L_52E8A:
        mov     word ptr [C2_W_FX_MOD_CURSOR], 0
br_537F0:
        imul    bx, word ptr [C2_W_FX_MOD_CURSOR], 2ah
        callf   [bx+C2_W_04F20]
        retf
fx_fmod_autopan_f2:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    8
        nop
        push    cs
        call    far_52A4C
        add     sp, 2
        pop     ds
        retf
fx_fmod_autopan_f3:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    8
        nop
        push    cs
        call    far_52ADE
        add     sp, 2
        pop     ds
        retf
fx_fmod_autopan_paint:
        enter   4, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    C2_SEG
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
        push    EP_C2_5364_OFF
        else
        push    EP_FAR_53504_OFF
        endif
        nop
        push    cs
        call    far_529AC
        add     sp, 4
        push    ds
        push    C2_W_04EA6
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        mov     al, byte ptr [C2_B_FX_MOD_TYPE]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C2_TBL_FX_MOD_TYPE_NAMES_SEG]
        push    word ptr [bx+C2_TBL_FX_MOD_TYPE_NAMES]
        push    0bh
        push    31h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        push    1
        push    1
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+20h]
        sub     ah, ah
        push    0
        push    ax
        push    15h
        push    6dh
        mov     di, es
        callf   EP_DRAW_FIXED_DECIMAL_SEG:EP_DRAW_FIXED_DECIMAL_OFF
        add     sp, 0ch
        push    2
        mov     es, di
        mov     al, byte ptr es:[si+21h]
        sub     ah, ah
        push    0
        push    ax
        push    1fh
        push    6dh
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    2
        mov     es, di
        mov     al, byte ptr es:[si+22h]
        sub     ah, ah
        push    0
        push    ax
        push    29h
        push    6dh
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    1
        push    1
        mov     es, di
        mov     al, byte ptr es:[si+23h]
        sub     ah, ah
        push    0
        push    ax
        push    15h
        push    0c1h
        callf   EP_DRAW_FIXED_DECIMAL_SEG:EP_DRAW_FIXED_DECIMAL_OFF
        add     sp, 0ch
        push    2
        mov     es, di
        mov     al, byte ptr es:[si+24h]
        sub     ah, ah
        push    0
        push    ax
        push    1fh
        push    0c1h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        mov     es, di
        mov     al, byte ptr es:[si+25h]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C2_W_04E66]
        push    word ptr [bx+C2_W_04E64]
        push    29h
        push    0c1h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        pop     si
        pop     di
        leave
        retf
fx_fmod_autopan_f5:
X_53924:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    fx_edit_refresh
        push    ds
        push    C0_B_09604
        push    EP_FAR_53236_SEG
        push    EP_FAR_53236_OFF
        nop
        push    cs
        call    far_54566
        add     sp, 8
        pop     ds
        retf
        db      00h
copy_pgm_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    fx_edit_refresh
        nop
        push    cs
        call    mixer_setup_f6
        pop     ds
        retf
L_53956:
        nop
        push    cs
        call    far_531E0
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
        retf
        db      00h
fx_fmod_autopan_field1_thunk:
        mov     word ptr [C2_W_FX_MOD_CURSOR], 1
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 20h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MOD_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 4f12h
        else
        add     ax, 4f0ch
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_fmod_autopan_field2_thunk:
        mov     word ptr [C2_W_FX_MOD_CURSOR], 2
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 21h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MOD_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 4f12h
        else
        add     ax, 4f0ch
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_fmod_autopan_field3_thunk:
        mov     word ptr [C2_W_FX_MOD_CURSOR], 3
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 22h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MOD_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 4f12h
        else
        add     ax, 4f0ch
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_fmod_autopan_field4_thunk:
        mov     word ptr [C2_W_FX_MOD_CURSOR], 4
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 23h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MOD_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 4f12h
        else
        add     ax, 4f0ch
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_fmod_autopan_field5_thunk:
        mov     word ptr [C2_W_FX_MOD_CURSOR], 5
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 24h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MOD_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 4f12h
        else
        add     ax, 4f0ch
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_fmod_autopan_field6_thunk:
        mov     word ptr [C2_W_FX_MOD_CURSOR], 6
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 25h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MOD_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 4f12h
        else
        add     ax, 4f0ch
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_fmod_autopan_field0_thunk:
        mov     word ptr [C2_W_FX_MOD_CURSOR], 0
        push    ds
        push    C0_B_08E70
        push    ds
        push    C2_W_04F12
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
far_53A82:
        push    si
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     si, ax
        cmp     byte ptr [C2_B_FX_MOD_TYPE], 2
        jg      br_53AAA
        mov     es, dx
        mov     byte ptr es:[si+16h], 0
        mov     al, byte ptr [C2_B_FX_MOD_TYPE]
        mov     byte ptr es:[si+17h], al
        jmp     br_53AB5
        db      90h
br_53AAA:
        mov     al, byte ptr [C2_B_FX_MOD_TYPE]
        sub     al, 2
        mov     es, dx
        mov     byte ptr es:[si+16h], al
br_53AB5:
        nop
        push    cs
        call    fx_section_field_notify
        nop
        push    cs
        call    far_53236
        pop     si
        retf
        db      90h
far_53AC2:
        db      50h, 41h, 4eh, 00h
far_53AC6:
        db      4ch, 3eh, 52h, 00h
far_53ACA:
        db      52h, 3eh, 4ch, 00h
L_53ACE:
        db      54h, 45h, 52h
        db      4dh, 00h, 00h
far_53AD4:
        push    ds
        push    P_5038
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        mov     word ptr [C2_W_PARAM_HOOK_OFF], (C2_BASE+L_53B60-C2_SEG*16)
        mov     word ptr [C2_W_PARAM_HOOK_SEG], C2_SEG
        cmp     word ptr [C2_W_FX_MOD_CURSOR], 0
        jl      L_5319A
        cmp     word ptr [C2_W_FX_MOD_CURSOR], 7
        jb      br_53B00
L_5319A:
        mov     word ptr [C2_W_FX_MOD_CURSOR], 0
br_53B00:
        imul    bx, word ptr [C2_W_FX_MOD_CURSOR], 2ah
        if      FW_VERSION >= 110
        callf   [bx+C2_TBL_050C0]
        else
        callf   [bx+C2_TBL_050C0]
        endif
        retf
fx_pitch_shift_f2:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    8
        nop
        push    cs
        call    far_52A4C
        add     sp, 2
        pop     ds
        retf
fx_pitch_shift_f3:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    8
        nop
        push    cs
        call    far_52ADE
        add     sp, 2
        pop     ds
        retf
fx_pitch_shift_f5:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    fx_edit_refresh
        push    ds
        push    C0_B_09604
        push    EP_FAR_53236_SEG
        push    EP_FAR_53236_OFF
        nop
        push    cs
        call    far_54566
        add     sp, 8
        pop     ds
        retf
        db      00h
fx_pitch_shift_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    fx_edit_refresh
        nop
        push    cs
        call    mixer_setup_f6
        pop     ds
        retf
L_53B60:
        nop
        push    cs
        call    far_531E0
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
        retf
        db      00h
fx_pitch_shift_field3_thunk:
        cmp     byte ptr [C2_B_FX_MOD_TYPE], 6
        jne     br_53B9E
        mov     word ptr [C2_W_FX_MOD_CURSOR], 3
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 2ah
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MOD_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 50b2h
        else
        add     ax, 50ach
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
br_53B9E:
        nop
        push    cs
        call    fx_pitch_shift_field0_thunk
        retf
fx_pitch_shift_field4_thunk:
        cmp     byte ptr [C2_B_FX_MOD_TYPE], 6
        jne     br_53BD6
        mov     word ptr [C2_W_FX_MOD_CURSOR], 4
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 2ch
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MOD_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 50b2h
        else
        add     ax, 50ach
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
br_53BD6:
        nop
        push    cs
        call    fx_pitch_shift_field0_thunk
        retf
fx_pitch_shift_field5_thunk:
        cmp     byte ptr [C2_B_FX_MOD_TYPE], 6
        jne     br_53C0E
        mov     word ptr [C2_W_FX_MOD_CURSOR], 5
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 2eh
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MOD_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 50b2h
        else
        add     ax, 50ach
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
br_53C0E:
        nop
        push    cs
        call    fx_pitch_shift_field0_thunk
        retf
fx_pitch_shift_field6_thunk:
        cmp     byte ptr [C2_B_FX_MOD_TYPE], 6
        jne     br_53C46
        mov     word ptr [C2_W_FX_MOD_CURSOR], 6
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 2fh
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MOD_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 50b2h
        else
        add     ax, 50ach
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
br_53C46:
        nop
        push    cs
        call    fx_pitch_shift_field0_thunk
        retf
fx_pitch_shift_field0_thunk:
        mov     word ptr [C2_W_FX_MOD_CURSOR], 0
        push    ds
        push    C0_B_08E70
        push    ds
        if      FW_VERSION >= 110
        push    C2_W_050B2
        else
        push    C2_W_050B2
        endif
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
far_53C64:
        push    si
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     si, ax
        cmp     byte ptr [C2_B_FX_MOD_TYPE], 2
        jg      br_53C8C
        mov     es, dx
        mov     byte ptr es:[si+16h], 0
        mov     al, byte ptr [C2_B_FX_MOD_TYPE]
        mov     byte ptr es:[si+17h], al
        jmp     br_53C97
        db      90h
br_53C8C:
        mov     al, byte ptr [C2_B_FX_MOD_TYPE]
        sub     al, 2
        mov     es, dx
        mov     byte ptr es:[si+16h], al
br_53C97:
        nop
        push    cs
        call    fx_section_field_notify
        nop
        push    cs
        call    far_53236
        pop     si
        retf
        db      00h
L_53CA4:
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        and     byte ptr [C2_B_09604], 0fch
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+45h]
        mov     byte ptr [C2_B_09606], al
        callf   EP_L_3D1F0_SEG:EP_L_3D1F0_OFF
        retf
fx_delay_f2:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    4
        nop
        push    cs
        call    far_52A4C
        add     sp, 2
        pop     ds
        retf
fx_delay_f3:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    4
        nop
        push    cs
        call    far_52ADE
        add     sp, 2
        pop     ds
        retf
fx_delay_paint:
        enter   4, 0
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    EP_FAR_5411E_SEG
        push    EP_FAR_5411E_OFF
        nop
        push    cs
        call    far_529AC
        add     sp, 4
        push    EP_L_537CA_SEG
        push    EP_L_537CA_OFF
        push    0bh
        push    13h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+30h]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C2_W_051DA]
        push    word ptr [bx+C2_W_051D8]
        push    0bh
        push    31h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        mov     es, word ptr [bp-2]
        cmp     byte ptr es:[si+30h], 3
        jl      br_53D63
        jmp     br_53DE4
br_53D63:
        push    ds
        push    C2_W_0521A
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        push    2
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+36h]
        sub     ah, ah
        push    0
        push    ax
        push    0bh
        push    0c1h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        mov     es, word ptr [bp-2]
        cmp     byte ptr es:[si+30h], 2
        jne     L_5343C
        mov     cx, word ptr es:[si+34h]
        jmp     SHORT br_53DA0
        db      90h, 90h
L_5343C:
        mov     cx, word ptr es:[si+32h]
br_53DA0:
        push    3
        push    0
        push    cx
        push    15h
        push    0c1h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+37h]
        push    ax
        push    1fh
        push    0c1h
        nop
        push    cs
        call    far_530E8
        add     sp, 6
        push    2
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+31h]
        cbw
        cwd
        push    dx
        push    ax
        push    29h
        push    0c1h
        callf   EP_DRAW_SIGNED_VALUE_SEG:EP_DRAW_SIGNED_VALUE_OFF
        add     sp, 0ah
        jmp     br_53E80
br_53DE4:
        push    ds
        push    C2_W_05270
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        push    2
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+3ah]
        sub     ah, ah
        push    0
        push    ax
        push    15h
        push    9dh
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    2
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+3eh]
        sub     ah, ah
        push    0
        push    ax
        push    15h
        push    0c7h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    3
        mov     es, word ptr [bp-2]
        push    0
        push    word ptr es:[si+38h]
        push    1fh
        push    97h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    3
        mov     es, word ptr [bp-2]
        push    0
        push    word ptr es:[si+3ch]
        push    1fh
        push    0c1h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+3bh]
        push    ax
        push    29h
        push    97h
        nop
        push    cs
        call    far_530E8
        add     sp, 6
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+3fh]
        push    ax
        push    29h
        push    0c1h
        nop
        push    cs
        call    far_530E8
        add     sp, 6
br_53E80:
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        pop     si
        leave
        retf
        db      00h
fx_delay_f5:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    fx_edit_refresh
        push    ds
        push    C0_B_09604
        push    EP_L_3D1F0_SEG
        push    EP_L_3D1F0_OFF
        nop
        push    cs
        call    far_54566
        add     sp, 8
        pop     ds
        retf
        db      00h
fx_delay_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    fx_edit_refresh
        nop
        push    cs
        call    mixer_setup_f6
        pop     ds
        retf
fx_delay_field0_thunk:
        mov     word ptr [C2_W_FX_DELAY_CURSOR], 0
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 30h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_DELAY_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 52d0h
        else
        add     ax, 52cah
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_delay_field1_thunk:
        mov     word ptr [C2_W_FX_DELAY_CURSOR], 1
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 36h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_DELAY_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 52d0h
        else
        add     ax, 52cah
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_delay_field3_thunk:
        mov     word ptr [C2_W_FX_DELAY_CURSOR], 3
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 37h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_DELAY_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 52d0h
        else
        add     ax, 52cah
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_delay_field4_thunk:
        mov     word ptr [C2_W_FX_DELAY_CURSOR], 4
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 31h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_DELAY_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 52d0h
        else
        add     ax, 52cah
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_delay_field5_thunk:
        mov     word ptr [C2_W_FX_DELAY_CURSOR], 5
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 3ah
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_DELAY_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 52d0h
        else
        add     ax, 52cah
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_delay_field6_thunk:
        mov     word ptr [C2_W_FX_DELAY_CURSOR], 6
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 38h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_DELAY_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 52d0h
        else
        add     ax, 52cah
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_delay_field7_thunk:
        mov     word ptr [C2_W_FX_DELAY_CURSOR], 7
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 3bh
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_DELAY_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 52d0h
        else
        add     ax, 52cah
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_delay_field8_thunk:
far_530B0:
        mov     word ptr [C2_W_FX_DELAY_CURSOR], 8
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 3eh
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_DELAY_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 52d0h
        else
        add     ax, 52cah
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_delay_field9_thunk:
far_530DC:
        mov     word ptr [C2_W_FX_DELAY_CURSOR], 9
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 3ch
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_DELAY_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 52d0h
        else
        add     ax, 52cah
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_delay_field10_thunk:
far_53108:
        mov     word ptr [C2_W_FX_DELAY_CURSOR], 0ah
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 3fh
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_DELAY_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 52d0h
        else
        add     ax, 52cah
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_delay_field2_thunk:
far_53134:
        mov     word ptr [C2_W_FX_DELAY_CURSOR], 2
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        cmp     byte ptr es:[bx+FXS_ECHO_TYPE], 2
        jne     br_540B0
        mov     word ptr [C2_W_0532E], 14fh
        mov     word ptr [C2_W_05330], 0
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 34h
        jmp     br_540CC
br_540B0:
        mov     word ptr [C2_W_0532E], 29eh
        mov     word ptr [C2_W_05330], 0
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 32h
br_540CC:
        push    dx
        push    ax
        push    ds
        push    C2_W_05324
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_540DC:
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        cmp     byte ptr es:[bx+30h], 3
        jge     br_540FA
        nop
        push    cs
        call    fx_delay_field1_thunk
        retf
br_540FA:
        nop
        push    cs
        call    fx_delay_field5_thunk
        retf
far_54100:
        db      "MONO LEFT", 00h
far_5410A:
        db      "MONO L+R", 00h, 00h
L_54114:
        db      "XOVER L&R", 00h
far_5411E:
        db      "DELAY/ECHO", 00h, 00h
L_537CA:
        db      "Type:", 00h
L_54130:
        and     byte ptr [C2_B_09604], 0fch
        cmp     byte ptr [C0_B_0D7C7], 2
        jl      br_54154
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_REVERB_PTR_SEG:EP_PGM_FX_REVERB_PTR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+1]
        jmp     br_54169
        db      90h
br_54154:
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+45h]
br_54169:
        mov     byte ptr [C2_B_09606], al
        nop
        push    cs
        call    far_54172
        retf
far_54172:
        test    byte ptr [C2_B_09604], 1
        jne     br_54180
        test    byte ptr [C2_B_09604], 2
        je      br_54195
br_54180:
        mov     al, byte ptr [C2_B_09606]
        push    ax
        mov     cl, byte ptr [C0_B_0D7C7]
        mov     al, 1
        shl     al, cl
        push    ax
        nop
        push    cs
        call    fx_dsp_update_request
        add     sp, 4
br_54195:
        push    ds
        push    C2_W_054BA
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        mov     word ptr [C2_W_PARAM_HOOK_OFF], (C2_BASE+L_5435E-C2_SEG*16)
        mov     word ptr [C2_W_PARAM_HOOK_SEG], C2_SEG
        cmp     word ptr [C2_W_FX_REVERB_CURSOR], 0
        jl      L_5385B
        cmp     word ptr [C2_W_FX_REVERB_CURSOR], 7
        jb      br_541C1
L_5385B:
        mov     word ptr [C2_W_FX_REVERB_CURSOR], 0
br_541C1:
        imul    bx, word ptr [C2_W_FX_REVERB_CURSOR], 2ah
        callf   [bx+C2_TBL_0555C]
        retf
        db      00h
fx_reverb_f2:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    2
        nop
        push    cs
        call    far_52A4C
        add     sp, 2
        pop     ds
        retf
fx_reverb_f3:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    2
        nop
        push    cs
        call    far_52ADE
        add     sp, 2
        pop     ds
        retf
fx_reverb_paint:
        enter   4, 0
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_REVERB_PTR_SEG:EP_PGM_FX_REVERB_PTR_OFF
        add     sp, 2
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    C2_SEG
        if      FW_VERSION >= 112
        push    EP_L_5455E_OFF
        else
        push    EP_FAR_5361E_OFF
        endif
        nop
        push    cs
        call    far_529AC
        add     sp, 4
        push    ds
        push    C2_W_054EC
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C2_W_054A0]
        push    word ptr [bx+C2_W_0549E]
        push    0bh
        push    31h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        push    2
        mov     es, word ptr [bp-2]
        push    0
        push    word ptr es:[si+2]
        push    15h
        push    61h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    2
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+8]
        sub     ah, ah
        push    0
        push    ax
        push    29h
        push    61h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        mov     es, word ptr [bp-2]
        cmp     byte ptr es:[si], 3
        jg      br_542EE
        push    ds
        push    C2_W_0551C
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        push    2
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+7]
        sub     ah, ah
        push    0
        push    ax
        push    1fh
        push    61h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    2
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+4]
        sub     ah, ah
        push    0
        push    ax
        push    15h
        push    0c7h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+5]
        push    ax
        push    1fh
        push    0c7h
        nop
        push    cs
        call    far_530E8
        add     sp, 6
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+6]
        push    ax
        push    29h
        push    0c7h
        nop
        push    cs
        call    far_530E8
        add     sp, 6
        jmp     br_54305
br_542EE:
        push    2
        mov     al, byte ptr es:[si+9]
        sub     ah, ah
        push    0
        push    ax
        push    1fh
        push    61h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
br_54305:
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        pop     si
        leave
        retf
fx_reverb_f5:
        enter   4, 0
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    fx_edit_refresh
        push    ds
        push    C0_B_09604
        push    EP_FAR_54172_SEG
        push    EP_FAR_54172_OFF
        cmp     byte ptr [C0_B_0D7C7], 2
        jl      br_54336
        mov     ax, (C2_BASE+L_549F0-C2_SEG*16)
        mov     dx, C2_SEG
        jmp     br_5433C
br_54336:
        mov     ax, (C2_BASE+far_54566-C2_SEG*16)
        mov     dx, C2_SEG
br_5433C:
        mov     word ptr [bp-2], dx
        mov     word ptr [bp-4], ax
        callf   [bp-4]
        add     sp, 8
        pop     ds
        leave
        retf
        db      00h
fx_reverb_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    fx_edit_refresh
        nop
        push    cs
        call    mixer_setup_f6
        pop     ds
        retf
L_5435E:
        and     byte ptr [C2_B_09604], 0fch
        cmp     byte ptr [C0_B_0D7C7], 2
        jl      br_54382
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_REVERB_PTR_SEG:EP_PGM_FX_REVERB_PTR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+1]
        jmp     br_54397
        db      90h
br_54382:
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+45h]
br_54397:
        mov     byte ptr [C2_B_09606], al
        imul    bx, word ptr [C2_W_FX_REVERB_CURSOR], 2ah
        callf   [bx+C2_TBL_0555C]
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
        retf
        db      00h
fx_reverb_field0_thunk:
        mov     word ptr [C2_W_FX_REVERB_CURSOR], 0
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_REVERB_PTR_SEG:EP_PGM_FX_REVERB_PTR_OFF
        add     sp, 2
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_REVERB_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 554eh
        else
        add     ax, 5548h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
fx_reverb_field1_thunk:
        mov     word ptr [C2_W_FX_REVERB_CURSOR], 1
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_REVERB_PTR_SEG:EP_PGM_FX_REVERB_PTR_OFF
        add     sp, 2
        add     ax, 2
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_REVERB_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 554eh
        else
        add     ax, 5548h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_reverb_field2_thunk:
        push    si
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_REVERB_PTR_SEG:EP_PGM_FX_REVERB_PTR_OFF
        add     sp, 2
        mov     si, ax
        mov     word ptr [C2_W_FX_REVERB_CURSOR], 2
        mov     es, dx
        cmp     byte ptr es:[si], 3
        jle     L_53AC2
        add     ax, 9
        jmp     SHORT br_54425
        db      90h
L_53AC2:
        add     ax, 7
br_54425:
        push    dx
        push    ax
        push    ds
        push    C2_W_055A2
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        pop     si
        retf
        db      00h
fx_reverb_field3_thunk:
        mov     word ptr [C2_W_FX_REVERB_CURSOR], 3
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_REVERB_PTR_SEG:EP_PGM_FX_REVERB_PTR_OFF
        add     sp, 2
        add     ax, 8
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_REVERB_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 554eh
        else
        add     ax, 5548h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_reverb_field4_thunk:
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_REVERB_PTR_SEG:EP_PGM_FX_REVERB_PTR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        cmp     byte ptr es:[bx], 3
        jg      br_54492
        mov     word ptr [C2_W_FX_REVERB_CURSOR], 4
        add     ax, 4
        push    dx
        push    ax
        push    ds
        push    C2_W_055F6
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      90h
br_54492:
        nop
        push    cs
        call    fx_reverb_field1_thunk
        retf
fx_reverb_field5_thunk:
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_REVERB_PTR_SEG:EP_PGM_FX_REVERB_PTR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        cmp     byte ptr es:[bx], 3
        jg      br_544C8
        mov     word ptr [C2_W_FX_REVERB_CURSOR], 5
        add     ax, 5
        push    dx
        push    ax
        push    ds
        push    C2_W_05620
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      90h
br_544C8:
        nop
        push    cs
        call    fx_reverb_field2_thunk
        retf
fx_reverb_field6_thunk:
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_REVERB_PTR_SEG:EP_PGM_FX_REVERB_PTR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        cmp     byte ptr es:[bx], 3
        jg      br_544FE
        mov     word ptr [C2_W_FX_REVERB_CURSOR], 6
        add     ax, 6
        push    dx
        push    ax
        push    ds
        push    C2_W_0564A
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      90h
br_544FE:
        nop
        push    cs
        call    fx_reverb_field3_thunk
        retf
fx_reverb_field_notify:
        mov     al, byte ptr [C2_B_09606]
        push    ax
        mov     al, byte ptr [C0_B_0D7C7]
        push    ax
        nop
        push    cs
        call    lcd_clear_rect
        add     sp, 4
        retf
        db      90h
L_54516:
        db      "LARGE HALL"
        db      00h, 00h
L_54522:
        db      "SMALL HALL"
        db      00h, 00h
L_5452E:
        db      "LARGE ROOM"
        db      00h, 00h
L_5453A:
        db      "SMALL ROOM"
        db      00h, 00h
L_54546:
        db      "GATED 1"
        db      00h
L_53BEE:
        db      "GATED 2"
        db      00h
L_53BF6:
        db      "REVERSE"
        db      00h
L_5455E:
far_5361E:
        db      "REVERB"
        db      00h
        db      00h
far_54566:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr [C2_W_08D9C], ax
        mov     word ptr [C2_W_08D9E], dx
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        mov     word ptr [C2_FP_08DA0], ax
        mov     word ptr [C2_W_08DA2], dx
        push    ds
        push    C2_W_05694
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        mov     sp, bp
        mov     ax, word ptr [C2_W_08DA2]
        or      ax, word ptr [C2_FP_08DA0]
        je      br_545CA
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        mov     sp, bp
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+45h]
        les     bx, [C2_FP_08DA0]
        cmp     al, byte ptr es:[bx+2]
        je      br_545CA
        mov     al, byte ptr es:[bx+2]
        push    ax
        mov     cl, byte ptr [C0_B_0D7C7]
        mov     al, 1
        shl     al, cl
        push    ax
        nop
        push    cs
        call    fx_dsp_update_request
        mov     sp, bp
br_545CA:
        mov     word ptr [C2_W_PARAM_HOOK_OFF], (C2_BASE+L_547A0-C2_SEG*16)
        mov     word ptr [C2_W_PARAM_HOOK_SEG], C2_SEG
        cmp     word ptr [C2_W_FX_MIXER_CURSOR], 0
        jl      br_545E4
        cmp     word ptr [C2_W_FX_MIXER_CURSOR], 0ah
        jb      br_545EA
br_545E4:
        mov     word ptr [C2_W_FX_MIXER_CURSOR], 0
br_545EA:
        imul    bx, word ptr [C2_W_FX_MIXER_CURSOR], 2ah
        callf   [bx+C2_W_05726]
        leave
        retf
        db      00h
fx_mixer_paint:
        enter   8, 0
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    EP_STR_EFFECT_MIXER_TITLE_SEG
        push    EP_STR_EFFECT_MIXER_TITLE_OFF
        callf   EP_SMEM_PROC_WRAPPER_SEG:EP_SMEM_PROC_WRAPPER_OFF
        add     sp, 4
        push    ds
        push    C2_W_056B2
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        mov     es, word ptr [bp-2]
        cmp     byte ptr es:[si+5], 0
        je      br_54640
        mov     ax, C2_W_0DBDC
        mov     dx, C1_SEG
        jmp     SHORT br_54646
        db      90h
br_54640:
        mov     ax, C2_W_0A5D4
        mov     dx, C1_SEG
br_54646:
        push    dx
        push    ax
        push    0bh
        push    55h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+46h]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C2_W_05676]
        push    word ptr [bx+C2_W_05674]
        push    1fh
        push    19h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        mov     al, byte ptr [C1_B_0D7BD]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C2_W_05682]
        push    word ptr [bx+C2_W_05680]
        push    29h
        push    3dh
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        push    2
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+14h]
        sub     ah, ah
        push    0
        push    ax
        push    15h
        push    0a9h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+15h]
        cbw
        push    ax
        push    15h
        push    0bbh
        callf   EP_L_47E24_SEG:EP_L_47E24_OFF
        add     sp, 6
        push    2
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+40h]
        sub     ah, ah
        push    0
        push    ax
        push    1fh
        push    0a9h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+41h]
        cbw
        push    ax
        push    1fh
        push    0bbh
        callf   EP_L_47E24_SEG:EP_L_47E24_OFF
        add     sp, 6
        push    2
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+42h]
        sub     ah, ah
        push    0
        push    ax
        push    1fh
        push    0d3h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    2
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+43h]
        sub     ah, ah
        push    0
        push    ax
        push    29h
        push    0a9h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+44h]
        cbw
        push    ax
        push    29h
        push    0bbh
        callf   EP_L_47E24_SEG:EP_L_47E24_OFF
        add     sp, 6
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        pop     si
        leave
        retf
        db      00h
fx_mixer_close:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    fx_mixer_refresh
        callf   [C2_W_08D9C]
        pop     ds
        retf
        db      00h
fx_mixer_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     ax, word ptr [C2_W_08DA2]
        or      ax, word ptr [C2_FP_08DA0]
        je      br_54796
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+45h]
        les     bx, [C2_FP_08DA0]
        cmp     al, byte ptr es:[bx+2]
        je      br_54796
        mov     al, byte ptr [C0_B_0D7C7]
        push    ax
        nop
        push    cs
        call    smem_dma_channel_01
        add     sp, 2
br_54796:
        sub     ax, ax
        mov     word ptr [C2_W_PARAM_HOOK_SEG], ax
        mov     word ptr [C2_W_PARAM_HOOK_OFF], ax
        pop     ds
        retf
L_547A0:
        mov     ax, word ptr [C2_W_08DA2]
        or      ax, word ptr [C2_FP_08DA0]
        je      br_547C6
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+45h]
        les     bx, [C2_FP_08DA0]
        mov     byte ptr es:[bx+2], al
br_547C6:
        imul    bx, word ptr [C2_W_MIXER_CURSOR], 2ah
        callf   [bx+C2_W_05726]
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
        retf
        db      00h
fx_mixer_field0_thunk:
        mov     word ptr [C2_W_FX_MIXER_CURSOR], 0
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 5
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MIXER_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 5718h
        else
        add     ax, 5712h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_mixer_field1_thunk:
        mov     word ptr [C2_W_FX_MIXER_CURSOR], 1
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 46h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MIXER_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 5718h
        else
        add     ax, 5712h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_mixer_field3_thunk:
        mov     word ptr [C2_W_FX_MIXER_CURSOR], 3
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 14h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MIXER_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 5718h
        else
        add     ax, 5712h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_mixer_field4_thunk:
        mov     word ptr [C2_W_FX_MIXER_CURSOR], 4
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 40h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MIXER_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 5718h
        else
        add     ax, 5712h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_mixer_field5_thunk:
        mov     word ptr [C2_W_FX_MIXER_CURSOR], 5
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 43h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MIXER_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 5718h
        else
        add     ax, 5712h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_mixer_field6_thunk:
        mov     word ptr [C2_W_FX_MIXER_CURSOR], 6
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 15h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MIXER_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 5718h
        else
        add     ax, 5712h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_mixer_field7_thunk:
        mov     word ptr [C2_W_FX_MIXER_CURSOR], 7
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 41h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MIXER_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 5718h
        else
        add     ax, 5712h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_mixer_field8_thunk:
        mov     word ptr [C2_W_FX_MIXER_CURSOR], 8
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 44h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MIXER_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 5718h
        else
        add     ax, 5712h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_mixer_field9_thunk:
        mov     word ptr [C2_W_FX_MIXER_CURSOR], 9
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        add     ax, 42h
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_FX_MIXER_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 5718h
        else
        add     ax, 5712h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
far_54960:
        retf
        db      00h
fx_mixer_field2_thunk:
        mov     word ptr [C2_W_FX_MIXER_CURSOR], 2
        push    ds
        push    C1_B_0D7BD
        push    ds
        push    C2_W_0576C
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
fx_mixer_field_notify:
        enter   2, 0
        mov     ax, word ptr [C2_W_08DA2]
        or      ax, word ptr [C2_FP_08DA0]
        je      br_54992
        les     bx, [C2_FP_08DA0]
        mov     al, byte ptr es:[bx+2]
        jmp     br_549A7
        db      90h
br_54992:
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+45h]
br_549A7:
        push    ax
        mov     cl, byte ptr [C0_B_0D7C7]
        mov     al, 1
        shl     al, cl
        push    ax
        nop
        push    cs
        call    fx_dsp_update_request
        leave
        retf
L_54058:
        db      "MOD/ECHO"
        db      0ch, 52h, 45h, 56h, 00h, 00h
far_549C6:
        db      52h, 45h, 56h, 0ch
        db      "MOD/ECHO"
        db      00h, 00h
far_549D4:
        db      "MOD/ECHO+REV"
        db      00h, 00h
str_effect_mixer_title:
        db      "Effect"
        db      " Mixer", 000h, 000h
L_549F0:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr [C2_W_08DA6], ax
        mov     word ptr [C2_W_08DA8], dx
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        mov     word ptr [C2_FP_08DAA], ax
        mov     word ptr [C2_W_08DAC], dx
        push    ds
        push    C2_W_058BC
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        mov     sp, bp
        mov     ax, word ptr [C2_W_08DAC]
        or      ax, word ptr [C2_FP_08DAA]
        je      br_54A54
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_REVERB_PTR_SEG:EP_PGM_FX_REVERB_PTR_OFF
        mov     sp, bp
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+1]
        les     bx, [C2_FP_08DAA]
        if      FW_VERSION >= 112
far_54A39:
        endif
        cmp     al, byte ptr es:[bx+2]
        je      br_54A54
        mov     al, byte ptr es:[bx+2]
        push    ax
        mov     cl, byte ptr [C0_B_0D7C7]
        mov     al, 1
        shl     al, cl
        push    ax
        nop
        push    cs
        call    fx_dsp_update_request
        mov     sp, bp
br_54A54:
        mov     word ptr [C2_W_PARAM_HOOK_OFF], (C2_BASE+L_54B4A-C2_SEG*16)
        mov     word ptr [C2_W_PARAM_HOOK_SEG], C2_SEG
        cmp     word ptr [C2_W_EFFECT_MIXER_CURSOR], 0
        jl      br_54A6E
        cmp     word ptr [C2_W_EFFECT_MIXER_CURSOR], 2
        jb      br_54A74
br_54A6E:
        mov     word ptr [C2_W_EFFECT_MIXER_CURSOR], 0
br_54A74:
        imul    bx, word ptr [C2_W_EFFECT_MIXER_CURSOR], 2ah
L_54119:
        if      FW_VERSION < 112
far_54A39:
        endif
        if      FW_VERSION >= 110
        callf   [bx+C2_TBL_05908]
        else
        callf   [bx+C2_TBL_05908]
        endif
        leave
        retf
        db      00h
effect_mixer_paint:
        enter   4, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_REVERB_PTR_SEG:EP_PGM_FX_REVERB_PTR_OFF
        add     sp, 2
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    EP_STR_EFFECT_MIXER_TITLE_SEG
        push    EP_STR_EFFECT_MIXER_TITLE_OFF
        callf   EP_SMEM_PROC_WRAPPER_SEG:EP_SMEM_PROC_WRAPPER_OFF
        add     sp, 4
        push    ds
        push    C2_W_058DA
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+0bh]
        cbw
        push    ax
        push    1fh
        push    0bbh
        mov     di, es
        callf   EP_L_47E24_SEG:EP_L_47E24_OFF
        add     sp, 6
        push    2
        mov     es, di
        mov     al, byte ptr es:[si+0ah]
        sub     ah, ah
        push    0
        push    ax
        push    1fh
        push    0a9h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        pop     si
        pop     di
        leave
        retf
effect_mixer_close:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    effect_mixer_refresh
        callf   [C2_W_08DA6]
        pop     ds
        retf
        db      00h
effect_mixer_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     ax, word ptr [C2_W_08DAC]
        or      ax, word ptr [C2_FP_08DAA]
        je      br_54B40
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_REVERB_PTR_SEG:EP_PGM_FX_REVERB_PTR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+1]
        les     bx, [C2_FP_08DAA]
        cmp     al, byte ptr es:[bx+2]
        je      br_54B40
        mov     al, byte ptr [C0_B_0D7C7]
        push    ax
        nop
        push    cs
        call    smem_dma_channel_01
        add     sp, 2
br_54B40:
        sub     ax, ax
        mov     word ptr [C2_W_PARAM_HOOK_SEG], ax
        mov     word ptr [C2_W_PARAM_HOOK_OFF], ax
        pop     ds
        retf
L_54B4A:
        mov     ax, word ptr [C2_W_08DAC]
        or      ax, word ptr [C2_FP_08DAA]
        je      br_54B70
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_REVERB_PTR_SEG:EP_PGM_FX_REVERB_PTR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+1]
        les     bx, [C2_FP_08DAA]
        mov     byte ptr es:[bx+2], al
br_54B70:
        imul    bx, word ptr [C2_W_MIXER_CURSOR], 2ah
        if      FW_VERSION >= 110
        callf   [bx+C2_TBL_05908]
        else
        callf   [bx+C2_TBL_05908]
        endif
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
        retf
        db      00h
effect_mixer_field0_thunk:
        mov     word ptr [C2_W_EFFECT_MIXER_CURSOR], 0
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_REVERB_PTR_SEG:EP_PGM_FX_REVERB_PTR_OFF
        add     sp, 2
        add     ax, 0ah
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_EFFECT_MIXER_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 58fah
        else
        add     ax, 58f4h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
effect_mixer_field1_thunk:
        mov     word ptr [C2_W_EFFECT_MIXER_CURSOR], 1
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_REVERB_PTR_SEG:EP_PGM_FX_REVERB_PTR_OFF
        add     sp, 2
        add     ax, 0bh
        push    dx
        push    ax
        imul    ax, word ptr [C2_W_EFFECT_MIXER_CURSOR], 2ah
        if      FW_VERSION >= 110
        add     ax, 58fah
        else
        add     ax, 58f4h
        endif
        push    ds
        push    ax
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_54BD8:
        enter   2, 0
        mov     ax, word ptr [C2_W_08DAC]
        or      ax, word ptr [C2_FP_08DAA]
        je      br_54BF0
        les     bx, [C2_FP_08DAA]
        mov     al, byte ptr es:[bx+2]
        jmp     br_54C05
        db      90h
br_54BF0:
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_REVERB_PTR_SEG:EP_PGM_FX_REVERB_PTR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+1]
br_54C05:
        push    ax
        mov     al, byte ptr [C0_B_0D7C7]
        push    ax
        nop
        push    cs
        call    lcd_clear_rect
        leave
        retf
        nop
mixer_setup_key_46:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    C2_W_0594E
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        pop     ds
        retf
build_info_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   EP_DISP_CLEAR_ALL_SEG:EP_DISP_CLEAR_ALL_OFF
        push    31h
        push    0f7h
        push    0
        push    0
        callf   EP_DRAW_SHADOW_BOX_SEG:EP_DRAW_SHADOW_BOX_OFF
        add     sp, 8
        push    EP_FAR_54E32_SEG
        push    EP_FAR_54E32_OFF
        push    2
        push    3
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        push    word ptr [C0_W_0073A]
        push    word ptr [C0_W_00738]
        push    0ch
        push    3
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        push    C2_SEG
        if      FW_VERSION >= 112
        push    EP_FAR_54E52_OFF
        else
        push    EP_FAR_54852_OFF
        endif
        push    0ch
        push    6ah
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        push    word ptr [C2_W_PGM_ARRAY_SEG]
        push    word ptr [C2_FP_PGM_ARRAY]
        callf   EP_FAR_TO_DMA_LINEAR_SEG:EP_FAR_TO_DMA_LINEAR_OFF
        add     sp, 4
        add     ax, 0e6d0h
        adc     dx, 0
        push    dx
        push    ax
        push    0ch
        push    82h
        callf   EP_L_3ECCC_SEG:EP_L_3ECCC_OFF
        add     sp, 8
        pop     ds
        retf
        db      00h
build_info_f6:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    C2_W_05962
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        callf   EP_DISP_CLEAR_ALL_SEG:EP_DISP_CLEAR_ALL_OFF
        nop
        push    cs
        call    far_54CD4
        pop     ds
        retf
far_54CC0:
        push    bp
        mov     bp, sp
        xor     ax, ax
        mov     bl, byte ptr [bp+6]
        mov     cx, 8
tgt_54CCB:
        shl     bl, 1
        rcr     al, 1
        loop    tgt_54CCB
        leave
        retf
        db      00h
far_54CD4:
        push    si
        cmp     byte ptr [C2_B_060B8], 0
        jne     br_54CFC
        mov     byte ptr [C2_B_060B8], 1
        mov     si, 2
loop_54CE4:
        mov     al, byte ptr [si+C2_W_05972]
        push    ax
        nop
        push    cs
        call    far_54CC0
        add     sp, 2
        mov     byte ptr [si+C2_W_05972], al
        inc     si
        cmp     si, 746h
        jl      loop_54CE4
br_54CFC:
        push    ds
        push    C2_W_05972
        push    0
        push    0
        callf   EP_DRAW_BITMAP_PTR_SEG:EP_DRAW_BITMAP_PTR_OFF
        add     sp, 8
        pop     si
        retf
far_54D0E:
        enter   4, 0
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    C2_W_062B0
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        callf   EP_FAR_3E8C8_SEG:EP_FAR_3E8C8_OFF
        mov     word ptr [C2_W_08DB0], ax
        mov     word ptr [C2_W_08DB2], 0
        mov     word ptr [C2_W_08DB4], 9
        cmp     byte ptr [C2_B_062AE], 0
        jne     br_54D5B
        mov     ax, C2_W_060BA
        mov     si, ax
        mov     word ptr [bp-2], ds
        mov     byte ptr [C2_B_062AE], 1
        mov     cx, 1f4h
        mov     es, word ptr [bp-2]
loop_54D53:
        xor     byte ptr es:[si], 7fh
        inc     si
        dec     cx
        jne     loop_54D53
br_54D5B:
        pop     ds
        pop     si
        leave
        retf
        db      00h
show_dev_credits_scroll:
        enter   4, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     bx, ax
        mov     word ptr [bp-2], 19h
        sub     ax, word ptr [C2_W_08DB0]
        cmp     ax, 1f4h
        ja      br_54D7F
        jmp     NEAR L_544CD
br_54D7F:
        mov     word ptr [C2_W_08DB0], bx
        dec     word ptr [C2_W_08DB4]
        jne     br_54DA0
        mov     word ptr [C2_W_08DB4], 9
        inc     word ptr [C2_W_08DB2]
        cmp     word ptr [C2_W_08DB2], 19h
        jbe     br_54DA0
        mov     word ptr [C2_W_08DB2], 0
br_54DA0:
        push    C2_SEG
        if      FW_VERSION >= 112
        push    EP_FAR_54E58_OFF
        else
        push    EP_L_54858_OFF
        endif
        callf   EP_SMEM_PROC_WRAPPER_SEG:EP_SMEM_PROC_WRAPPER_OFF
        add     sp, 4
        xor     di, di
        cmp     word ptr [C2_W_08DB4], 5
        jbe     L_547BC
        mov     ax, 4
        jmp     SHORT br_54DBF
L_547BC:
        mov     ax, 5
br_54DBF:
        or      ax, ax
        jle     L_544C8
        xor     si, si
loop_54DC5:
        mov     ax, word ptr [C2_W_08DB2]
        add     ax, di
        mov     word ptr [bp-2], ax
        cmp     ax, 19h
        jb      br_54DD6
        sub     word ptr [bp-2], 19h
br_54DD6:
        imul    bx, word ptr [bp-2], 14h
        cmp     byte ptr [bx+C2_W_060BA], 9
        jne     br_54DF6
        mov     ax, bx
        if      FW_VERSION >= 110
        add     ax, 60bbh
        else
        add     ax, 60b5h
        endif
        push    ds
        push    ax
        mov     ax, word ptr [C2_W_08DB4]
        add     ax, si
        add     ax, 8
        push    ax
        push    44h
        jmp     br_54E08
        db      90h
br_54DF6:
        mov     ax, bx
        if      FW_VERSION >= 110
        add     ax, 60bah
        else
        add     ax, 60b4h
        endif
        push    ds
        push    ax
        mov     ax, word ptr [C2_W_08DB4]
        add     ax, si
        add     ax, 8
        push    ax
        push    14h
br_54E08:
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        add     si, 9
        cmp     word ptr [C2_W_08DB4], 5
        jbe     L_544C0
        mov     ax, 4
        jmp     SHORT br_54E23
        db      90h
L_544C0:
        mov     ax, 5
br_54E23:
        inc     di
        cmp     ax, di
        jg      loop_54DC5
L_544C8:
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
L_544CD:
        pop     ds
        pop     si
        pop     di
        leave
        retf
far_54E32:
        if      FW_VERSION >= 120
        db      "Last Build:Sep 25 2002 18:21:48"
        elseif  FW_VERSION >= 114
        db      "Last Build:May 15 2001 14:11:07"
        elseif  FW_VERSION >= 112
        db      "Last Build:Dec  4 2000 13:04:57"
        elseif  FW_VERSION >= 111
        db      "Last Build:Mar 15 2000 15:59:49"
        elseif  FW_VERSION >= 110
        db      "Last Build:Feb 23 2000 11:09:42"
        else
        db      "Last Build:Oct 29 1999 10:49:36"
        endif
        db      00h
far_54852:
far_54E52:
        db      "END:", 00h, 00h
L_54858:
far_54E58:
        db      "MPC2000XL Development Team", 00h, 00h
X_54E74:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr [C2_W_08DB8], ax
        mov     word ptr [C2_W_08DBA], dx
        push    ds
        push    C2_W_062C4
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        mov     byte ptr [C2_B_WAVE_MEM_ERR_MASK], 0
        leave
        retf
wave_mem_detect:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    C1_SEG
        db      68h, 12h, 00h
        push    C1_SEG
        db      68h, 16h, 00h
        callf   EP_DISP_MESSAGE_WINDOW_SEG:EP_DISP_MESSAGE_WINDOW_OFF
        add     sp, 8
        callf   EP_WAVE_MEM_SIZE_PROBE_SEG:EP_WAVE_MEM_SIZE_PROBE_OFF
        callf   EP_PGM_MEMORY_INIT_SEG:EP_PGM_MEMORY_INIT_OFF
        callf   EP_FIELD_HANDLER_NOP_SEG:EP_FIELD_HANDLER_NOP_OFF
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
        pop     ds
        retf
wave_mem_check:
        enter   6, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     word ptr [bp-6], 55aah
        mov     word ptr [bp-4], 0aa55h
        mov     word ptr [bp-2], 1248h
        mov     byte ptr [C2_B_WAVE_MEM_ERR_MASK], 0
        nop
        push    cs
        call    wave_mem_paint
        callf   EP_DISP_FLUSH_NOW_SEG:EP_DISP_FLUSH_NOW_OFF
        xor     si, si
        lea     di, [bp-6]
loop_54EF3:
        push    EP_L_5507E_SEG
        push    EP_L_5507E_OFF
        push    word ptr ss:[di]
        callf   EP_SYSTEM_INIT_HANDLER_SEG:EP_SYSTEM_INIT_HANDLER_OFF
        add     sp, 6
        or      ax, ax
        je      br_54F28
        mov     cx, si
        mov     al, 1
        shl     al, cl
        or      byte ptr [C2_B_WAVE_MEM_ERR_MASK], al
        nop
        push    cs
        call    wave_mem_paint
        callf   EP_DISP_FLUSH_NOW_SEG:EP_DISP_FLUSH_NOW_OFF
        add     di, 2
        inc     si
        cmp     si, 3
        jl      loop_54EF3
        jmp     br_54F32
        db      90h
br_54F28:
        or      byte ptr [C2_B_WAVE_MEM_ERR_MASK], 8
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
br_54F32:
        callf   EP_PGM_MEMORY_INIT_SEG:EP_PGM_MEMORY_INIT_OFF
        pop     ds
        pop     si
        pop     di
        leave
        retf
wave_mem_padchk:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   EP_L_3E954_SEG:EP_L_3E954_OFF
        pop     ds
        retf
        db      00h
wave_mem_paint:
        if      FW_VERSION >= 112
        enter   0ah, 0
        push    di
        push    si
        endif
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    C2_W_062E8
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        push    31h
        push    0f7h
        push    0
        push    0
        callf   EP_DRAW_SHADOW_BOX_SEG:EP_DRAW_SHADOW_BOX_OFF
        add     sp, 8
        push    2
        push    10h
        push    0
        push    word ptr [C2_W_SMEM_SIZE_HI]
        push    word ptr [C0_W_SMEM_SIZE]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        push    dx
        push    ax
        push    2
        push    69h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        test    byte ptr [C2_B_WAVE_MEM_ERR_MASK], 1
        je      br_54FAE
        push    EP_L_54AC6_SEG
        push    EP_L_54AC6_OFF
        push    0ch
        push    99h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
br_54FAE:
        test    byte ptr [C2_B_WAVE_MEM_ERR_MASK], 2
        je      br_54FC8
        push    EP_L_54AC6_SEG
        push    EP_L_54AC6_OFF
        push    15h
        push    99h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
br_54FC8:
        test    byte ptr [C2_B_WAVE_MEM_ERR_MASK], 4
        je      br_54FE2
        push    EP_L_54AC6_SEG
        push    EP_L_54AC6_OFF
        push    1eh
        push    99h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
br_54FE2:
        test    byte ptr [C2_B_WAVE_MEM_ERR_MASK], 8
        je      br_54FFB
        push    C2_SEG
        if      FW_VERSION >= 114
        push    EP_L_550CC_OFF
        elseif  FW_VERSION >= 112
        push    EP_C2_6F6C_OFF
        else
        push    EP_FAR_546E6_OFF
        endif
        push    27h
        push    3
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
br_54FFB:
        if      FW_VERSION >= 112
        mov     ax, C2_SEG
        push    ds
        lea     di, [bp-0ah]
        mov     si, 6f76h
        push    ss
        pop     es
        mov     ds, ax
        movsw
        movsw
        movsw
        movsw
        movsb
        endif
        pop     ds
        if      FW_VERSION >= 112
        test    byte ptr [C0_W_098B6], 1
        je      br_5501A
        mov     byte ptr [bp-0ah], 31h
br_5501A:
        test    byte ptr [C0_W_098B6], 2
        je      br_55025
        mov     byte ptr [bp-9], 31h
br_55025:
        test    byte ptr [C0_W_098B6], 4
        je      br_55030
        mov     byte ptr [bp-8], 31h
br_55030:
        test    byte ptr [C0_W_098B6], 8
        je      br_5503B
        mov     byte ptr [bp-7], 31h
br_5503B:
        test    byte ptr [C0_W_098B6], 10h
        je      br_55046
        mov     byte ptr [bp-6], 31h
br_55046:
        test    byte ptr [C0_W_098B6], 20h
        je      br_55051
        mov     byte ptr [bp-5], 31h
br_55051:
        test    byte ptr [C0_W_098B6], 40h
        je      br_5505C
        mov     byte ptr [bp-4], 31h
br_5505C:
        test    byte ptr [C0_W_098B6], 80h
        je      br_55067
        mov     byte ptr [bp-3], 31h
br_55067:
        lea     ax, [bp-0ah]
        push    ss
        push    ax
        push    2
        push    0b7h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        pop     ds
        pop     si
        pop     di
        leave
        endif
        retf
        if      FW_VERSION < 112
        db      00h
        endif
L_5507E:
        push    bp
        mov     bp, sp
        push    C2_SEG
        push    (C2_BASE+far_546F0-C2_SEG*16)
        push    27h
        push    3
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        mov     sp, bp
        push    8
        push    0
        push    400h
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        push    dx
        push    ax
        push    27h
        push    3fh
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        callf   EP_DISP_FLUSH_NOW_SEG:EP_DISP_FLUSH_NOW_OFF
        leave
        retf
        db      00h
wave_mem_return:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   [C2_W_08DB8]
        pop     ds
        retf
L_54AC6:
        db      "Okay", 00h, 00h
L_550CC:
far_546E6:
        db      "Failure!", 00h, 00h
        if      FW_VERSION >= 112
        db      "00000000", 00h, 00h
        endif
far_546F0:
        db      "Testing...        Kwords.", 00h
far_550FA:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    word ptr [C2_W_08DC0]
        push    word ptr [C2_W_08DBE]
        nop
        push    cs
        call    far_55112
        add     sp, 4
        pop     ds
        retf
far_55112:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr [C2_W_08DBE], ax
        mov     word ptr [C2_W_08DC0], dx
        push    ds
        push    C2_W_06366
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        mov     sp, bp
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        callf   EP_SOUND_LIST_CONTAINS_SEG:EP_SOUND_LIST_CONTAINS_OFF
        mov     sp, bp
        or      ax, ax
        jne     br_5514E
        mov     ax, word ptr [C0_W_098DC]
        mov     dx, word ptr [C0_W_098DE]
        mov     word ptr [C0_W_0D7C2], ax
        mov     word ptr [C0_W_0D7C4], dx
br_5514E:
        cmp     word ptr [C2_W_SND_DEBUG_CURSOR], 0
        jl      br_5515C
        cmp     word ptr [C2_W_SND_DEBUG_CURSOR], 1
        jb      br_55162
br_5515C:
        mov     word ptr [C2_W_SND_DEBUG_CURSOR], 0
br_55162:
        imul    bx, word ptr [C2_W_SND_DEBUG_CURSOR], 2ah
        callf   [bx+C2_W_06458]
        leave
        retf
        db      00h
snd_debug_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    C2_W_06398
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        les     bx, [C0_W_0D7C2]
        test    byte ptr es:[bx+SND_FLAGS_HI], 1
        je      br_55194
        mov     ax, STR_C1_ROM
        mov     dx, C1_SEG
        jmp     SHORT br_5519A
        db      90h
br_55194:
        mov     ax, C2_W_0CD82
        mov     dx, C1_SEG
br_5519A:
        push    dx
        push    ax
        push    1
        push    1
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        push    1
        push    19h
        callf   EP_FAR_47D5E_SEG:EP_FAR_47D5E_OFF
        add     sp, 8
        les     bx, [C0_W_0D7C2]
        push    word ptr es:[bx+SND_FLAGS_0C]
        push    word ptr es:[bx+SND_DD_0A]
        push    0bh
        push    1fh
        callf   EP_L_3ECCC_SEG:EP_L_3ECCC_OFF
        add     sp, 8
        les     bx, [C0_W_0D7C2]
        push    word ptr es:[bx+SND_DD_0E+2]
        push    word ptr es:[bx+SND_DD_0E]
        push    14h
        push    1fh
        callf   EP_L_3ECCC_SEG:EP_L_3ECCC_OFF
        add     sp, 8
        les     bx, [C0_W_0D7C2]
        push    word ptr es:[bx+SND_NEXT]
        push    1dh
        push    25h
        callf   EP_CMD_DISPATCH_SETUP_SEG:EP_CMD_DISPATCH_SETUP_OFF
        add     sp, 6
        les     bx, [C0_W_0D7C2]
        push    word ptr es:[bx+SND_NEXT+2]
        push    26h
        push    25h
        callf   EP_CMD_DISPATCH_SETUP_SEG:EP_CMD_DISPATCH_SETUP_OFF
        add     sp, 6
        push    3
        callf   EP_FAR_3FE60_SEG:EP_FAR_3FE60_OFF
        cwd
        push    dx
        push    ax
        push    0bh
        push    73h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        callf   EP_SMEM_FREE_BYTES_SEG:EP_SMEM_FREE_BYTES_OFF
        push    dx
        push    ax
        push    14h
        push    73h
        callf   EP_L_3ECCC_SEG:EP_L_3ECCC_OFF
        add     sp, 8
        callf   EP_SMEM_HIGH_WATER_SEG:EP_SMEM_HIGH_WATER_OFF
        mov     cx, word ptr [C0_W_SMEM_SIZE]
        mov     bx, word ptr [C2_W_SMEM_SIZE_HI]
        sub     cx, ax
        sbb     bx, dx
        push    bx
        push    cx
        push    1dh
        push    73h
        callf   EP_L_3ECCC_SEG:EP_L_3ECCC_OFF
        add     sp, 8
        callf   EP_SMEM_HIGH_WATER_SEG:EP_SMEM_HIGH_WATER_OFF
        push    dx
        push    ax
        push    26h
        push    73h
        callf   EP_L_3ECCC_SEG:EP_L_3ECCC_OFF
        add     sp, 8
        push    3
        les     bx, [C0_W_0D7C2]
        sub     ah, ah
        mov     al, byte ptr es:[bx+SND_B_08]
        push    0
        push    ax
        push    1
        push    0e5h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        mov     ax, word ptr [C0_W_0D7C2]
        les     bx, [C0_W_098DC]
        mov     cx, 3eh
        sub     ax, word ptr es:[bx+4]
        cwd
        idiv    cx
        push    ax
        push    0bh
        push    0dfh
        callf   EP_CMD_DISPATCH_SETUP_SEG:EP_CMD_DISPATCH_SETUP_OFF
        add     sp, 6
        les     bx, [C0_W_0D7C2]
        mov     ax, word ptr es:[bx+SND_FP_04]
        les     bx, [C0_W_098DC]
        mov     cx, 3eh
        sub     ax, word ptr es:[bx+4]
        cwd
        idiv    cx
        push    ax
        push    14h
        push    0dfh
        callf   EP_CMD_DISPATCH_SETUP_SEG:EP_CMD_DISPATCH_SETUP_OFF
        add     sp, 6
        les     bx, [C0_W_0D7C2]
        mov     ax, word ptr es:[bx]
        les     bx, [C0_W_098DC]
        mov     cx, 3eh
        sub     ax, word ptr es:[bx+4]
        cwd
        idiv    cx
        push    ax
        push    1dh
        push    0dfh
        callf   EP_CMD_DISPATCH_SETUP_SEG:EP_CMD_DISPATCH_SETUP_OFF
        add     sp, 6
        mov     ax, C1_TBL_SOUNDS_END
        les     bx, [C0_W_098DC]
        mov     cx, 3eh
        sub     ax, word ptr es:[bx+4]
        cwd
        idiv    cx
        push    ax
        push    26h
        push    0dfh
        callf   EP_CMD_DISPATCH_SETUP_SEG:EP_CMD_DISPATCH_SETUP_OFF
        add     sp, 6
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        retf
        db      00h
snd_debug_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        imul    bx, word ptr [C2_W_SND_DEBUG_CURSOR], 2ah
        callf   [bx+C2_W_06470]
        pop     ds
        retf
        db      00h
snd_debug_create:
        enter   4, 0
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        lea     ax, [bp-4]
        push    ss
        push    ax
        callf   EP_SOUND_RECORD_ALLOC_SEG:EP_SOUND_RECORD_ALLOC_OFF
        add     sp, 4
        or      ax, ax
        je      br_55356
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        mov     word ptr [C0_W_0D7C2], ax
        mov     word ptr [C0_W_0D7C4], dx
        pop     ds
        leave
        retf
        db      90h
br_55356:
        push    EP_MSG_SOUND_DIR_FULL_SEG
        push    EP_MSG_SOUND_DIR_FULL_OFF
        callf   EP_DISP_ALERT_WAIT_KEY_SEG:EP_DISP_ALERT_WAIT_KEY_OFF
        add     sp, 4
        pop     ds
        leave
        retf
        db      00h
snd_debug_id_sort:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    EP_FAR_55416_SEG
        push    EP_FAR_55416_OFF
        push    C1_SEG
        if      FW_VERSION >= 112
        push    EP_FAR_4A026_OFF
        else
        push    C2_W_0CDA2
        endif
        callf   EP_DISP_MESSAGE_WINDOW_SEG:EP_DISP_MESSAGE_WINDOW_OFF
        add     sp, 8
        push    EP_L_3F9AC_SEG
        push    EP_L_3F9AC_OFF
        callf   EP_FAR_40138_SEG:EP_FAR_40138_OFF
        add     sp, 4
        callf   EP_FIELD_HANDLER_NOP_SEG:EP_FIELD_HANDLER_NOP_OFF
        pop     ds
        retf
        db      00h
snd_debug_re_id:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    EP_L_4BD9A_SEG
        push    EP_L_4BD9A_OFF
        push    C2_SEG
        if      FW_VERSION >= 112
        push    EP_L_5541A_OFF
        else
        push    EP_FAR_5444A_OFF
        endif
        callf   EP_DISP_MESSAGE_WINDOW_SEG:EP_DISP_MESSAGE_WINDOW_OFF
        add     sp, 8
        callf   EP_SOUND_LIST_RENUMBER_SEG:EP_SOUND_LIST_RENUMBER_OFF
        callf   EP_FIELD_HANDLER_NOP_SEG:EP_FIELD_HANDLER_NOP_OFF
        pop     ds
        retf
snd_debug_ver:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    mixer_setup_key_46
        pop     ds
        retf
        db      00h
snd_debug_memchk:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    C2_SEG
        push    (C2_BASE+FAR_550FA-C2_SEG*16)
        nop
        push    cs
        call    X_54E74
        add     sp, 4
        pop     ds
        retf
snd_debug_return:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   [C2_W_08DBE]
        pop     ds
        retf
far_553EE:
        mov     word ptr [C2_W_SND_DEBUG_CURSOR], 0
        push    ds
        push    C0_W_0D7C2
        push    ds
        push    C2_W_0644A
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
far_55406:
        push    C2_SEG
        push    (C2_BASE+FAR_550FA-C2_SEG*16)
        callf   EP_FAR_4C0D8_SEG:EP_FAR_4C0D8_OFF
        add     sp, 4
        retf
        db      90h
far_55416:
        db      49h, 44h, 00h, 00h
L_5541A:
far_5444A:
        db      "Re-ID "
        db      00h, 00h
fx_asic_reg1_write:
        push    bp
        mov     bp, sp
        cmp     byte ptr [C2_B_06474], 0
        je      br_55448
        mov     bx, word ptr [bp+6]
        mov     ax, bx
        mov     al, bl
        mov     ah, 1
        out     0a2h, ax
        mov     ax, bx
        mov     al, ah
        and     ax, 3
        mov     cx, word ptr [bp+8]
        and     cl, 0fch
        or      ax, cx
        out     0a0h, ax
br_55448:
        leave
        retf
asic_reg1_bank_clear:
        xor     bx, bx
loop_5544C:
        mov     ax, bx
        or      ah, 1
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        inc     bx
        cmp     bx, 20h
        jl      loop_5544C
        retf
far_5545E:
        cmp     byte ptr [C2_B_FX_BOARD_PRESENT], 0
        jne     br_55468
        jmp     br_554F7
br_55468:
        mov     ax, 600h
        out     80h, ax
        mov     ax, 8000h
        out     84h, ax
        xor     ax, ax
        out     80h, ax
        out     86h, ax
        mov     ax, 610h
        out     80h, ax
        mov     ax, 8000h
        out     84h, ax
        mov     ax, 10h
        out     80h, ax
        xor     ax, ax
        out     86h, ax
        cmp     byte ptr [C2_B_06474], al
        jne     br_554A4
        mov     ax, 700h
        out     80h, ax
        xor     ax, ax
        out     8ch, ax
        mov     ax, 710h
        out     80h, ax
        xor     ax, ax
        out     8ch, ax
        retf
br_554A4:
        cmp     byte ptr [C1_B_0D7BD], 0
        jne     br_554C8
        mov     ax, 700h
        out     80h, ax
        mov     ax, 0ff00h
        out     82h, ax
        xor     ax, ax
        out     84h, ax
        mov     ax, 710h
        out     80h, ax
        mov     ax, 0ffh
        out     82h, ax
        xor     ax, ax
        jmp     SHORT L_54B05
        db      90h
br_554C8:
        mov     ax, 700h
        out     80h, ax
        xor     ax, ax
        out     82h, ax
        mov     al, byte ptr [C1_B_0D7BD]
        cbw
        mov     bx, ax
        add     bx, ax
        dec     bx
        mov     al, byte ptr [bx+C1_TBL_00488]
        cbw
        add     ah, 80h
        out     84h, ax
        mov     ax, 710h
        out     80h, ax
        xor     ax, ax
        out     82h, ax
        mov     al, byte ptr [bx+C2_TBL_00489]
        cbw
        add     ah, 80h
L_54B05:
        out     84h, ax
br_554F7:
        retf
lcd_write_data:
        push    bp
        mov     bp, sp
        push    di
        push    si
        cmp     byte ptr [C2_B_FX_BOARD_PRESENT], 0
        je      br_5557F
        mov     si, word ptr [bp+0ah]
        shl     si, 2
        dec     si
        mov     di, word ptr [bp+8]
        mov     word ptr [bp+0ah], si
        mov     si, word ptr [bp+6]
loop_55514:
        mov     ax, 182h
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        mov     ax, 185h
        out     0a2h, ax
        mov     ax, di
        out     0a0h, ax
        mov     ax, 186h
        out     0a2h, ax
        mov     ax, word ptr [bp+0ah]
        out     0a0h, ax
        mov     ax, 182h
        out     0a2h, ax
        mov     ax, si
        out     0a0h, ax
loop_55539:
        mov     al, byte ptr [C2_B_FX_UPDATE_MASK]
        cbw
        mov     cl, byte ptr [C0_B_DSP_CHAN]
        mov     dx, 1
        shl     dx, cl
        test    ax, dx
        je      br_55561
        mov     ax, 182h
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        push    1
        push    ds
        push    C2_W_09888
        callf   C0_SEG:(C0_BASE+_longjmp-C0_SEG*16)
        add     sp, 6
br_55561:
        mov     ax, 180h
        out     0a2h, ax
        in      ax, 0a0h
        test    al, 1
        jne     loop_55539
        mov     ax, 182h
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        shr     word ptr [bp+0ah], 4
        cmp     word ptr [bp+0ah], 4
        ja      loop_55514
br_5557F:
        pop     si
        pop     di
        leave
        retf
        db      00h
L_55584:
        push    2000h
        mov     al, byte ptr [C0_B_DSP_CHAN]
        sub     ah, ah
        shl     ax, 0dh
        push    ax
        cmp     byte ptr [C0_B_DSP_CHAN], 1
        sbb     ax, ax
        and     al, 0f9h
        add     ax, 8
        push    ax
        nop
        push    cs
        call    lcd_write_data
        add     sp, 6
        retf
L_555A6:
        push    1000h
        mov     al, byte ptr [C0_B_DSP_CHAN]
        sub     ah, ah
        mov     bx, ax
        add     ax, 4
        shl     ax, 0ch
        push    ax
        sub     ah, ah
        mov     al, byte ptr [bx+C2_B_06478]
        push    ax
        nop
        push    cs
        call    lcd_write_data
        add     sp, 6
        retf
        db      00h
fx_dsp_update_request:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp+6]
        mov     byte ptr [C2_B_FX_UPDATE_MASK], al
        mov     al, byte ptr [bp+8]
        mov     byte ptr [P_8DC3], al
        or      al, al
        je      br_555E0
        or      byte ptr [C2_B_FX_UPDATE_MASK], 80h
br_555E0:
        leave
        retf
fx_dsp_update_isr:
        pusha
        push    ds
        push    es
        mov     bp, sp
        push    ds
        mov     ax, DS_SEG
        mov     ds, ax
        cld
        sti
        cmp     byte ptr [C2_B_FX_UPDATE_MASK], 0
        jne     isr_555F9
        jmp     isr_556AC
isr_555F9:
        cmp     byte ptr [C2_B_06474], 0
        jne     isr_55603
        jmp     isr_556AC
isr_55603:
        nop
        push    cs
        call    far_5545E
        test    byte ptr [C2_B_FX_UPDATE_MASK], 80h
        je      isr_55666
        test    byte ptr [C2_B_FX_UPDATE_MASK], 1
        je      isr_55624
        mov     al, byte ptr [P_8DC3]
        push    ax
        push    0
        nop
        push    cs
        call    lcd_clear_region_impl
        add     sp, 4
isr_55624:
        test    byte ptr [C2_B_FX_UPDATE_MASK], 2
        je      isr_55639
        mov     al, byte ptr [P_8DC3]
        push    ax
        push    1
        nop
        push    cs
        call    lcd_clear_region_impl
        add     sp, 4
isr_55639:
        test    byte ptr [C2_B_FX_UPDATE_MASK], 4
        je      isr_5564E
        mov     al, byte ptr [P_8DC3]
        push    ax
        push    2
        nop
        push    cs
        call    lcd_clear_rect
        add     sp, 4
isr_5564E:
        test    byte ptr [C2_B_FX_UPDATE_MASK], 8
        je      isr_556A7
        mov     al, byte ptr [P_8DC3]
        push    ax
        push    3
        nop
        push    cs
        call    lcd_clear_rect
        add     sp, 4
        jmp     isr_556A7
        db      90h
isr_55666:
        test    byte ptr [C2_B_FX_UPDATE_MASK], 1
        je      isr_55677
        push    0
        nop
        push    cs
        call    smem_dma_channel_01
        add     sp, 2
isr_55677:
        test    byte ptr [C2_B_FX_UPDATE_MASK], 2
        je      isr_55688
        push    1
        nop
        push    cs
        call    smem_dma_channel_01
        add     sp, 2
isr_55688:
        test    byte ptr [C2_B_FX_UPDATE_MASK], 4
        je      isr_55699
        push    2
        nop
        push    cs
        call    smem_dma_channel_23
        add     sp, 2
isr_55699:
        test    byte ptr [C2_B_FX_UPDATE_MASK], 8
        je      isr_556A7
        push    3
        nop
        push    cs
        call    smem_dma_channel_23
isr_556A7:
        mov     byte ptr [C2_B_FX_UPDATE_MASK], 0
isr_556AC:
        mov     sp, bp
        pop     es
        pop     ds
        popa
        iret
fx_dsp_reload_all:
        nop
        push    cs
        call    far_5545E
        push    0
        nop
        push    cs
        call    smem_dma_channel_01
        add     sp, 2
        push    1
        nop
        push    cs
        call    smem_dma_channel_01
        add     sp, 2
        push    2
        nop
        push    cs
        call    smem_dma_channel_23
        add     sp, 2
        push    3
        nop
        push    cs
        call    smem_dma_channel_23
        add     sp, 2
        retf
smem_dma_channel_01:
        push    bp
        mov     bp, sp
        cmp     byte ptr [bp+6], 2
        jae     br_55708
        mov     al, byte ptr [bp+6]
        sub     ah, ah
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        mov     sp, bp
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+45h]
        push    ax
        mov     al, byte ptr [bp+6]
        push    ax
        nop
        push    cs
        call    lcd_clear_region_impl
br_55708:
        leave
        retf
lcd_clear_region_impl:
        push    bp
        mov     bp, sp
        cmp     byte ptr [bp+6], 2
        jae     br_55750
        mov     cl, byte ptr [bp+6]
        mov     al, 1
        shl     al, cl
        not     al
        and     byte ptr [C2_B_FX_UPDATE_MASK], al
        push    ds
        push    C2_W_09888
        if      FW_VERSION >= 112
        callf   C0_SEG:(C0_BASE+__setjmp-C0_SEG*16)
        else
        callf   C0_SEG:(C0_BASE+L_35530-C0_SEG*16)
        endif
        mov     sp, bp
        or      ax, ax
        jne     br_55750
        mov     al, byte ptr [bp+6]
        mov     byte ptr [C0_B_DSP_CHAN], al
        mov     al, byte ptr [bp+8]
        mov     byte ptr [C0_B_0D7E2], al
        test    al, 1
        je      br_55746
        nop
        push    cs
        call    dsp_chan_reg_clear
        leave
        retf
br_55746:
        nop
        push    cs
        call    far_55752
        nop
        push    cs
        call    L_54DE4
br_55750:
        leave
        retf
far_55752:
        callf   EP_L_3614A_SEG:EP_L_3614A_OFF
        callf   EP_L_36604_SEG:EP_L_36604_OFF
        retf
        db      00h
smem_dma_channel_23:
        push    bp
        mov     bp, sp
        cmp     byte ptr [bp+6], 4
        jae     br_55786
        mov     al, byte ptr [bp+6]
        sub     ah, ah
        push    ax
        callf   EP_PGM_FX_REVERB_PTR_SEG:EP_PGM_FX_REVERB_PTR_OFF
        mov     sp, bp
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+1]
        push    ax
        mov     al, byte ptr [bp+6]
        push    ax
        nop
        push    cs
        call    lcd_clear_rect
br_55786:
        leave
        retf
lcd_clear_rect:
        push    bp
        mov     bp, sp
        cmp     byte ptr [bp+6], 4
        jae     br_557D1
        mov     cl, byte ptr [bp+6]
        mov     al, 1
        shl     al, cl
        not     al
        and     byte ptr [C2_B_FX_UPDATE_MASK], al
        push    ds
        push    C2_W_09888
        if      FW_VERSION >= 112
        callf   C0_SEG:(C0_BASE+__setjmp-C0_SEG*16)
        else
        callf   C0_SEG:(C0_BASE+L_35530-C0_SEG*16)
        endif
        mov     sp, bp
        or      ax, ax
        jne     br_557D1
        mov     al, byte ptr [bp+6]
        mov     byte ptr [C0_B_DSP_CHAN], al
        mov     al, byte ptr [bp+8]
        mov     byte ptr [C0_B_0D7E2], al
        test    al, 2
        jne     br_557CC
        test    byte ptr [C0_B_0D7E2], 1
        jne     br_557CC
        nop
        push    cs
        call    L_54DE4
        leave
        retf
        db      90h
br_557CC:
        nop
        push    cs
        call    L_01D18
br_557D1:
        leave
        retf
        db      00h
L_54DE4:
        callf   EP_L_37431_SEG:EP_L_37431_OFF
        callf   EP_L_37683_SEG:EP_L_37683_OFF
        retf
        db      00h
        if      FW_VERSION >= 114
DSP_CHAN_ADDR equ 09603h
        include "../../../common/dsp_chan_clear.inc"
        else
dsp_chan_reg_clear:
        enter   2, 0
        mov     al, byte ptr [C0_B_DSP_CHAN]
        sub     ah, ah
        mov     word ptr [bp-2], ax
        add     ax, 0cah
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0cch
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0ceh
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0d4h
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0d0h
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0d2h
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        mov     ax, word ptr [bp-2]
        add     ax, 54h
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        mov     ax, word ptr [bp-2]
        add     ax, 58h
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0b2h
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0b6h
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0b4h
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0b8h
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0bah
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0c4h
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0bch
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0beh
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0c0h
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0c2h
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        mov     al, byte ptr [C0_B_DSP_CHAN]
        push    ax
        endif
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        if      FW_VERSION >= 114
        include "../../../common/dsp_chan_clear2.inc"
        else
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        cmp     byte ptr es:[bx+47h], 0
        jne     L_552EA
        mov     al, byte ptr [C0_B_DSP_CHAN]
        sub     ah, ah
        add     ax, 0c6h
        out     0a2h, ax
        mov     ax, 1fffh
        out     0a0h, ax
        leave
        retf
        db      90h
L_552EA:
        mov     al, byte ptr [C0_B_DSP_CHAN]
        sub     ah, ah
        add     ax, 0c6h
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        leave
        retf
L_01D18:
        mov     al, byte ptr [C0_B_DSP_CHAN]
        sub     ah, ah
        add     ax, 54h
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        mov     al, byte ptr [C0_B_DSP_CHAN]
        add     ax, 58h
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        retf
        db      00h
        endif
X_55916:
        push    bp
        mov     bp, sp
        sub     al, al
        mov     dl, byte ptr [bp+6]
        mov     dh, byte ptr [bp+8]
        callf   EP_L_37804_SEG:EP_L_37804_OFF
        leave
        retf
L_55928:
        pusha
        push    ds
        push    es
        mov     bp, sp
        push    ds
        mov     ax, DS_SEG
        mov     ds, ax
        cld
        sti
        mov     al, byte ptr [C2_W_0647C]
        cbw
        mov     cl, byte ptr [bp+13h]
        sub     ch, ch
        cmp     cx, ax
        jne     isr_55963
        cmp     byte ptr [bp+12h], 0f8h
        jae     isr_55963
        mov     al, byte ptr [bp+12h]
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     cl, byte ptr es:[bx+R6480_IDX]
        mov     si, cx
        mov     byte ptr es:[bx+si+62h], al
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        inc     byte ptr es:[bx+R6480_IDX]
isr_55963:
        mov     sp, bp
        pop     es
        pop     ds
        popa
        iret
        db      00h
L_5596A:
        pusha
        push    ds
        push    es
        mov     bp, sp
        push    ds
        mov     ax, DS_SEG
        mov     ds, ax
        cld
        sti
        xor     ax, ax
        mov     cx, 2
        mov     bx, word ptr [C2_FP_MIDI_IN_BLOCK]
        mov     dx, word ptr [C2_W_06482]
        mov     di, bx
        mov     es, dx
        rep stosw
        mov     ax, word ptr [bp+0ch]
        mov     cx, word ptr [bp+12h]
        mov     word ptr [C2_W_08E48], cx
        mov     word ptr [C2_W_08E4A], ax
        mov     ax, word ptr [bp+0eh]
        mov     cx, word ptr [bp+10h]
        mov     word ptr [C2_W_08E4C], cx
        mov     word ptr [C2_W_08E4E], ax
        push    EP_L_5529C_SEG
        push    EP_L_5529C_OFF
        callf   EP_NAME_SPLIT_NUMBER_SUFFIX_SEG:EP_NAME_SPLIT_NUMBER_SUFFIX_OFF
        add     sp, 4
        callf   EP_L_3D724_SEG:EP_L_3D724_OFF
        mov     sp, bp
        pop     es
        pop     ds
        popa
        iret
        db      00h
sample_dump_open:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        imul    bx, word ptr [C2_W_SAMPLE_DUMP_CURSOR], 2ah
        mov     ax, word ptr [bx+C2_W_065DC]
        or      ax, word ptr [bx+C2_TBL_SDUMP_FIELD_ENTER]
        je      br_559E1
        callf   EP_SAMPLE_DUMP_REFRESH_SEG:EP_SAMPLE_DUMP_REFRESH_OFF
        imul    bx, word ptr [C2_W_SAMPLE_DUMP_CURSOR], 2ah
        callf   [bx+C2_TBL_SDUMP_FIELD_ENTER]
br_559E1:
        pop     ds
        retf
        db      00h
sample_dump_sync:
        push    bp
        mov     bp, sp
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   EP_SAMPLE_DUMP_REFRESH_SEG:EP_SAMPLE_DUMP_REFRESH_OFF
        push    bp
        callf   [C2_W_08E48]
        pop     bp
        pop     ds
        leave
        retf
        db      00h
sample_dump_midisw:
        push    bp
        mov     bp, sp
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   EP_SAMPLE_DUMP_REFRESH_SEG:EP_SAMPLE_DUMP_REFRESH_OFF
        push    bp
        callf   [C2_W_08E4C]
        pop     bp
        pop     ds
        leave
        retf
        db      00h
sample_dump_send:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        callf   EP_SOUND_LIST_CONTAINS_SEG:EP_SOUND_LIST_CONTAINS_OFF
        add     sp, 4
        or      ax, ax
        je      br_55A34
        mov     word ptr [C2_W_08DC4], 1
br_55A34:
        pop     ds
        retf
sample_dump_paint:
        enter   4, 0
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        push    C2_W_064F8
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        push    31h
        push    7bh
        push    0
        push    0
        callf   EP_DRAW_SHADOW_BOX_SEG:EP_DRAW_SHADOW_BOX_OFF
        add     sp, 8
        push    31h
        push    7ah
        push    0
        push    7dh
        callf   EP_DRAW_SHADOW_BOX_SEG:EP_DRAW_SHADOW_BOX_OFF
        add     sp, 8
        push    1
        mov     al, byte ptr [C2_W_0647C]
        cbw
        inc     ax
        cwd
        push    dx
        push    ax
        push    2
        push    69h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    5
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        push    0
        push    word ptr es:[bx+R6480_W_02]
        push    25h
        push    4bh
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        mov     al, byte ptr [C2_B_0647D]
        add     al, 41h
        cbw
        push    ax
        push    2
        push    0e6h
        callf   EP_DRAW_CHAR_AT_SEG:EP_DRAW_CHAR_AT_OFF
        add     sp, 6
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        callf   EP_SOUND_LIST_CONTAINS_SEG:EP_SOUND_LIST_CONTAINS_OFF
        add     sp, 4
        or      ax, ax
        jne     br_55AD0
        push    EP_L_47832_SEG
        push    EP_L_47832_OFF
        push    17h
        push    80h
        jmp     br_55B18
        db      90h
br_55AD0:
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        push    dx
        push    ax
        push    17h
        push    80h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        les     bx, [C0_W_0D7C2]
        cmp     byte ptr es:[bx+SND_STEREO], 0
        je      br_55B20
        mov     byte ptr [bp-4], 3ah
        mov     byte ptr [bp-3], 4ch
        mov     byte ptr [bp-2], 0
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        cmp     byte ptr es:[bx], 0
        je      br_55B0E
        mov     byte ptr [bp-3], 52h
br_55B0E:
        lea     ax, [bp-4]
        push    ss
        push    ax
        push    17h
        push    0e0h
br_55B18:
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
br_55B20:
        push    3
        mov     al, byte ptr [P_647E]
        cbw
        cwd
        push    dx
        push    ax
        push    25h
        push    0bch
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        mov     ax, word ptr [C2_W_08DC4]
        dec     ax
        jl      br_55B49
        jo      br_55B49
        dec     ax
        jle     br_55B7E
        dec     ax
        je      br_55B86
br_55B49:
        push    ds
        push    C2_W_06582
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        callf   EP_SOUND_LIST_CONTAINS_SEG:EP_SOUND_LIST_CONTAINS_OFF
        add     sp, 4
        or      ax, ax
        je      br_55BA4
        push    C2_SEG
        if      FW_VERSION >= 112
        push    EP_L_55CBC_OFF
        else
        push    EP_FAR_54CEC_OFF
        endif
        push    1
        push    6
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
        pop     ds
        leave
        retf
br_55B7E:
        push    EP_L_55C9E_SEG
        push    EP_L_55C9E_OFF
        jmp     br_55B8C
br_55B86:
        push    EP_L_552BC_SEG
        push    EP_L_552BC_OFF
br_55B8C:
        push    34h
        push    1
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        push    ds
        push    C2_W_065A8
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
br_55BA4:
        pop     ds
        leave
        retf
        db      00h
sample_dump_field0_thunk:
far_54BD8:
        mov     word ptr [C2_W_SAMPLE_DUMP_CURSOR], 0
        push    ds
        push    C2_W_0647C
        push    ds
        push    C2_W_065B4
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
sample_dump_field1_thunk:
        mov     word ptr [C2_W_SAMPLE_DUMP_CURSOR], 1
        mov     ax, word ptr [C2_FP_MIDI_IN_BLOCK]
        mov     dx, word ptr [C2_W_06482]
        add     ax, 2
        push    dx
        push    ax
        push    ds
        push    C2_W_065DE
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
sample_dump_field2_thunk:
        mov     word ptr [C2_W_SAMPLE_DUMP_CURSOR], 2
        push    ds
        push    C2_B_0647D
        push    ds
        push    C2_W_06608
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
sample_dump_field3_thunk:
        mov     word ptr [C2_W_SAMPLE_DUMP_CURSOR], 3
        push    ds
        push    C0_W_0D7C2
        push    ds
        push    C2_W_06632
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_55C10:
        les     bx, [C0_W_0D7C2]
        sub     ah, ah
        mov     al, byte ptr es:[bx+SND_B_08]
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     word ptr es:[bx+R6480_W_02], ax
        retf
        db      00h
L_55C24:
        push    EP_L_3D724_SEG
        push    EP_L_3D724_OFF
        callf   EP_FAR_4C0D8_SEG:EP_FAR_4C0D8_OFF
        add     sp, 4
        retf
        db      00h
sample_dump_field4_thunk:
        mov     word ptr [C2_W_SAMPLE_DUMP_CURSOR], 4
        push    ds
        push    P_647E
        push    ds
        push    C2_W_0665C
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
sample_dump_field5_thunk:
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        callf   EP_SOUND_LIST_CONTAINS_SEG:EP_SOUND_LIST_CONTAINS_OFF
        add     sp, 4
        or      ax, ax
        je      br_55C86
        les     bx, [C0_W_0D7C2]
        cmp     byte ptr es:[bx+SND_STEREO], 0
        je      br_55C86
        mov     word ptr [C2_W_SAMPLE_DUMP_CURSOR], 5
        push    word ptr [C2_W_06482]
        push    word ptr [C2_FP_MIDI_IN_BLOCK]
        push    ds
        push    C2_W_06686
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
br_55C86:
        nop
        push    cs
        call    sample_dump_field3_thunk
        retf
L_5529C:
        db      "MIDI_           "
        db      00h, 00h
L_55C9E:
        db      "Sending....."
        db      00h, 00h
L_552BC:
        db      "Receiving....."
        db      00h, 00h
L_55CBC:
far_54CEC:
        db      "SEND"
        db      00h, 00h
L_55CC2:
        push    bp
        mov     bp, sp
        mov     bx, word ptr [bp+6]
        shl     bx, 2
        mov     ax, word ptr [bx+C2_W_066B0]
        mov     dx, word ptr [bx+C2_W_066B2]
        leave
        retf
        db      00h
        FRAME_PAD SEG_DS                ; growth in c2 keeps DS_SEG on a paragraph
C2_END:
