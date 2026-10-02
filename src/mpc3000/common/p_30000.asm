; ROM 30000h v3.12 image; v3.08/v3.11/v3.12 shared; FW_VERSION for differences

        phase   0
        if      FW_VERSION >= 311
        db      0ffh, 0ffh
far_b0002:
        push    ds
        push    word STR_118C
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0ah
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_1199
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    9
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_11AD
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    9
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_11C4
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        push    word STR_067C
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        push    word P_06E0+3
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        retf
        endif
far_b0074:
        push    si
        xor     si, si
        callf   SEG_E931:far_e931c
        callf   SEG_EACB:far_ead2e
        callf   SEG_DEAB:far_deabe
        callf   SEG_DEAB:far_deb3f
        callf   SEG_DA72:far_da79d
        callf   SEG_BA17:far_ba179
        push    1
        push    1
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        if      FW_VERSION >= 311
        callf   0b035h:far_b0524
        callf   0b035h:far_b0541
        else
        callf   0b722h:far_b0524
        callf   0b722h:far_b0541
        endif
        push    0
        callf   SEG_B1AA:far_b1ab2
        add     sp, 2
        if      FW_VERSION >= 311
        push    cs
        call    far_b0002
        endif
        push    ds
        if      FW_VERSION >= 311
        push    word STR_11D3
        else
        push    word STR_118C
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        push    0ah
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_1197_V308
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    9
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_11AD
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    9
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_11C2_V308
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        push    word STR_0670_V308+0ch
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        push    word P_06E0+3
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    6
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        push    3dh
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_11D3
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        nop
        push    cs
        call    fn_b034e
        or      ax, ax
        jz      br_b00f3
        callf   SEG_B1AA:far_b1af9
        push    si
        push    0
        nop
        push    cs
        call    fn_b0141
        add     sp, 4
        mov     si, ax
        callf   SEG_B1AA:far_b1aff
br_b00f3:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_11F9
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_D546:far_d5be8
        or      ax, ax
        if      FW_VERSION >= 311
        jz      br_b0129
        else
        jz      L_b7011
        endif
        callf   SEG_B1AA:far_b1af9
        push    si
        push    1
        nop
        push    cs
        call    fn_b0141
        add     sp, 4
        callf   SEG_B1AA:far_b1aff
        if      FW_VERSION >= 311
br_b0129:
        cmp     byte ptr [B_8437], 0
        jz      br_b013a
        push    0ff88h
        callf   SEG_D79E:far_d7adf
        add     sp, 2
br_b013a:
        else
L_b7011:
        endif
        callf   SEG_C04A:far_c04ab
        pop     si
        retf
fn_b0141:
        push    bp
        mov     bp, sp
        sub     sp, 32h
        push    si
        push    di
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_1222
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        cmp     word ptr [bp + 6], 0
        jz      br_b018b
        push    ss
        pop     es
        lea     di, [bp - 32h]
        mov     si, STR_1234
        mov     cx, 8
        rep movsw
        movsb
        jmp     br_b0199
br_b018b:
        push    ss
        pop     es
        lea     di, [bp - 32h]
        mov     si, STR_1245
        mov     cx, 8
        rep movsw
        movsb
br_b0199:
        inc     byte ptr [B_956A]
        cmp     word ptr [bp + 6], 0
        jnz     br_b01d3
        push    ss
        pop     es
        lea     di, [bp - 22h]
        mov     si, STR_1256
        mov     cx, 2
        rep movsw
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        push    ss
        lea     ax, [bp - 32h]
        push    ax
        callf   SEG_CAA9:far_cac0f
        add     sp, 8
        or      ax, ax
        jnz     br_b01d3
        push    ss
        lea     ax, [bp - 17h]
        push    ax
        callf   0fb93h:far_fb98c
        add     sp, 4
br_b01d3:
        test    word ptr [bp + 8], 1
        jz      br_b01dd
        jmp     br_b02b1
br_b01dd:
        push    ss
        pop     es
        lea     di, [bp - 22h]
        mov     si, STR_125A
        mov     cx, 2
        rep movsw
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        push    ss
        lea     ax, [bp - 32h]
        push    ax
        callf   SEG_CAA9:far_cac0f
        add     sp, 8
        or      ax, ax
        jnz     br_b0222
        push    1
        push    ss
        lea     ax, [bp - 17h]
        push    ax
        callf   SEG_BE35:far_be846
        add     sp, 6
        or      ax, ax
        jz      br_b021b
        callf   SEG_CB18:far_cb18f
        jmp     near br_b02b1
br_b021b:
        or      word ptr [bp + 8], 1
        jmp     near br_b02b1
br_b0222:
        cmp     word ptr [bp + 6], 0
        jz      br_b022b
        jmp     near br_b02b1
br_b022b:
        push    ss
        pop     es
        lea     di, [bp - 22h]
        mov     si, STR_125E
        mov     cx, 2
        rep movsw
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        push    ss
        lea     ax, [bp - 32h]
        push    ax
        callf   SEG_CAA9:far_cac0f
        add     sp, 8
        mov     dx, ax
        mov     word ptr [bp - 2], 1
        jmp     br_b028c
loop_b0253:
        cmp     word ptr [bp - 2], 18h
        jg      br_b0290
        mov     al, byte ptr [bp - 2]
        push    ax
        push    ss
        lea     ax, [bp - 17h]
        push    ax
        callf   SEG_BE35:far_be357
        add     sp, 6
        or      ax, ax
        jz      br_b0275
        mov     word ptr [bp - 2], 0
        jmp     br_b0290
br_b0275:
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        push    ss
        lea     ax, [bp - 32h]
        push    ax
        callf   SEG_CAA9:far_cac7b
        add     sp, 8
        mov     dx, ax
        inc     word ptr [bp - 2]
br_b028c:
        or      dx, dx
        jz      loop_b0253
br_b0290:
        cmp     word ptr [bp - 2], 0
        jnz     br_b029d
        callf   SEG_CB18:far_cb18f
        jmp     br_b02a7
br_b029d:
        cmp     word ptr [bp - 2], 1
        jle     br_b02a7
        or      word ptr [bp + 8], 1
br_b02a7:
        push    0
        callf   SEG_C495:far_c6547
        add     sp, 2
br_b02b1:
        test    word ptr [bp + 8], 2
        jz      br_b02bb
        jmp     near br_b0343
br_b02bb:
        push    ss
        pop     es
        lea     di, [bp - 22h]
        mov     si, STR_1262
        mov     cx, 2
        rep movsw
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        push    ss
        lea     ax, [bp - 32h]
        push    ax
        callf   SEG_CAA9:far_cac0f
        add     sp, 8
        or      ax, ax
        jnz     br_b0343
        push    ss
        lea     ax, [bp - 17h]
        push    ax
        if      FW_VERSION <> 311
        callf   SEG_D7B9:far_d7b9c
        else
        callf   SEG_D7B8:far_d7b9c
        endif
        add     sp, 4
        mov     dx, ax
        or      ax, ax
        jz      br_b0301
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        callf   SEG_DEAB:far_deabe
        jmp     br_b0343
br_b0301:
        push    ss
        pop     es
        lea     di, [bp - 17h]
        mov     ax, ds
        mov     si, TBL_9419
        if      FW_VERSION >= 311
        mov     dx, 10h
        else
        mov     dx, 8
        endif
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        sub     dx, cx
        jnc     br_b0330
        add     cx, dx
        xor     dx, dx
br_b0330:
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        mov     cx, dx
        xor     ax, ax
        rep stosb
        pop     ds
        or      word ptr [bp + 8], 2
br_b0343:
        dec     byte ptr [B_956A]
        mov     ax, word ptr [bp + 8]
        pop     di
        pop     si
        leave
        retf
fn_b034e:
        callf   SEG_E7F0:far_e8338
        retf
        if      FW_VERSION >= 311
        phase   4
        else
        db      0ffh
        phase   0ch
        endif
fn_b0354:
        push    ds
        push    es
        mov     ax, SEG_A8EC
        mov     es, ax
        mov     ax, 8010h
        mov     ds, ax
        mov     al, 1
        mov     cx, 6a4h
        mov     bx, 0
        callf   0fb00h:far_fb651
        mov     cx, 80h
        mov     bx, 6ach
        callf   0fb00h:far_fb651
        mov     cx, 5f5h
        mov     bx, 734h
        callf   0fb00h:far_fb651
        mov     bx, 0d31h
        callf   0fb00h:far_fb651
        mov     cx, 5fah
        mov     bx, 132eh
        callf   0fb00h:far_fb651
        mov     bx, 1930h
        callf   0fb00h:far_fb651
        mov     bx, 1f32h
        callf   0fb00h:far_fb651
        mov     bx, 2534h
        callf   0fb00h:far_fb651
        mov     cx, 100h
        mov     bx, 2b36h
        callf   0fb00h:far_fb651
        mov     ax, 8010h
        mov     es, ax
        mov     al, 1
        if      FW_VERSION >= 311
        mov     cx, 10h
        mov     bx, 1266h
        else
        mov     cx, 8
        mov     bx, 1264h
        endif
        callf   0fb00h:far_fb651
        if      FW_VERSION >= 311
        mov     bx, 127eh
        else
        mov     bx, 1274h
        endif
        callf   0fb00h:far_fb651
        if      FW_VERSION >= 311
        mov     bx, 1296h
        else
        mov     bx, 1284h
        endif
        callf   0fb00h:far_fb651
        if      FW_VERSION >= 311
        mov     bx, 12aeh
        else
        mov     bx, 1294h
        endif
        callf   0fb00h:far_fb651
        mov     cx, 8
        mov     bx, A_12C6
        callf   0fb00h:far_fb651
        if      FW_VERSION >= 311
        mov     cx, 40h
        mov     bx, 12d6h
        callf   0fb00h:far_fb651
        endif
        mov     ax, SEG_D5E4
        mov     es, ax
        mov     bx, fn_d5e48
        mov     dl, 8
        callf   0fb00h:far_fb33d
        mov     ax, SEG_D69C
        mov     es, ax
        if      FW_VERSION >= 312
        mov     bx, far_d69ca
        elseif  FW_VERSION = 311
        mov     bx, 0ch
        else
        mov     bx, 6
        endif
        mov     dl, 0ch
        callf   0fb00h:far_fb33d
        mov     ax, SEG_D601
        mov     es, ax
        mov     bx, far_d6077
        mov     dl, 0dh
        callf   0fb00h:far_fb33d
        mov     ax, SEG_D6B2
        mov     es, ax
        mov     bx, far_d6b2c
        mov     dl, 0eh
        callf   0fb00h:far_fb33d
        mov     dx, 0c2h
        mov     al, 0
        out     dx, al
        mov     al, 0
        out     0c2h, al
        mov     al, 0
        out     0c2h, al
        mov     al, 0c0h
        out     0c2h, al
        mov     al, 2
        out     0c2h, al
        mov     al, 95h
        out     0c2h, al
        mov     dx, 0c4h
        mov     al, 0
        out     dx, al
        or      byte ptr [TBL_943B], 4
        mov     al, byte ptr [TBL_943B]
        mov     dx, 0c6h
        out     dx, al
        mov     dx, 0cah
        mov     al, 0
        out     dx, al
        mov     al, 0
        out     0cah, al
        mov     al, 0
        out     0cah, al
        mov     al, 0c0h
        out     0cah, al
        mov     al, 2
        out     0cah, al
        mov     al, 95h
        out     0cah, al
        mov     dx, 0cch
        mov     al, 0
        out     dx, al
        or      byte ptr [B_943C], 4
        mov     al, byte ptr [B_943C]
        mov     dx, 0ceh
        out     dx, al
        mov     dx, 0d2h
        mov     al, 0
        out     dx, al
        mov     al, 0
        out     0d2h, al
        mov     al, 0
        out     0d2h, al
        mov     al, 0c0h
        out     0d2h, al
        mov     al, 2
        out     0d2h, al
        mov     al, 95h
        out     0d2h, al
        mov     dx, 0d4h
        mov     al, 0
        out     dx, al
        or      byte ptr [B_943D], 4
        mov     al, byte ptr [B_943D]
        mov     dx, 0d6h
        out     dx, al
        mov     dx, 0dah
        mov     al, 0
        out     dx, al
        mov     al, 0
        out     0dah, al
        mov     al, 0
        out     0dah, al
        mov     al, 0c0h
        out     0dah, al
        mov     al, 2
        out     0dah, al
        mov     al, 91h
        out     0dah, al
        mov     dx, 0dch
        mov     al, 0
        out     dx, al
        or      byte ptr [B_943E], 0
        mov     al, byte ptr [B_943E]
        mov     dx, 0deh
        out     dx, al
        mov     al, 88h
        out     86h, al
        mov     al, 0
        out     80h, al
        mov     al, 83h
        out     82h, al
        mov     al, 0ch
        out     84h, al
        mov     al, 80h
        out     0feh, al
        mov     al, 8
        out     0f8h, al
        mov     al, 1
        out     0fch, al
        mov     al, 0e8h
        out     0fah, al
        callf   SEG_CDCC:far_cdcc2
        callf   SEG_CDCC:far_cdd04
        mov     al, 0eh
        out     6ah, al
        mov     dl, 7
        callf   0fb00h:far_fb38c
        mov     dl, 6
        callf   0fb00h:far_fb38c
        pop     es
        pop     ds
        retf
far_b0524:
        mov     cx, 3
loop_b0527:
        mov     dx, 0c0h
        in      al, dx
        mov     dx, 0c8h
        in      al, dx
        mov     dx, 0d0h
        in      al, dx
        mov     dx, 0d8h
        in      al, dx
        loop    loop_b0527
        mov     dx, 0c011h
        in      al, dx
        and     al, 0cfh
        out     dx, al
        retf
far_b0541:
        push    es
        mov     dx, 0c033h
        mov     al, 74h
        out     dx, al
        mov     ax, SEG_D6D9
        mov     es, ax
        mov     bx, far_d6d98
        mov     dl, 9
        callf   0fb00h:far_fb33d
        mov     al, 61h
        mov     dx, 0c010h
        out     dx, al
        mov     dx, 0c011h
        in      al, dx
        and     al, 0fdh
        out     dx, al
        mov     dx, 0c031h
        mov     ax, 28b1h
        out     dx, al
        mov     al, ah
        out     dx, al
        pop     es
        retf
        if      FW_VERSION >= 311
        phase   0
        else
        db      0ffh
        phase   0eh
        endif
far_b0570:
        push    bp
        mov     bp, sp
        mov     dx, word ptr [bp + 6]
        mov     cx, word ptr [bp + 8]
        callf   0fb00h:far_fb62d
        pop     bp
        retf
far_b0580:
        push    bp
        mov     bp, sp
        mov     dx, word ptr [bp + 6]
        callf   0fb00h:far_fb63e
        pop     bp
        retf
far_b058d:
        push    bp
        mov     bp, sp
        mov     dx, word ptr [bp + 6]
        callf   0fb00h:far_fb61a
        pop     bp
        retf
        if      FW_VERSION >= 311
        phase   0ah
        else
        phase   8
        endif
far_b059a:
        push    bp
        mov     bp, sp
        mov     cx, word ptr [bp + 6]
        callf   0fb00h:far_fb47a
        pop     bp
        retf
        if      FW_VERSION >= 311
        phase   7
        else
        phase   5
        endif
far_b05a7:
        mov     byte ptr [B_7B93], 0
        mov     byte ptr [B_7B94], 0
        mov     word ptr [W_7B91], ds
        mov     word ptr [FP_7B8F], B_7B93
        inc     word ptr [FP_7B8F]
        mov     byte ptr [B_7B8E], 0
        mov     byte ptr [B_7B88], 1
        retf
fn_b05ca:
        dec     byte ptr [B_7B8D]
        les     bx, dword ptr [FP_7B8F]
        mov     al, byte ptr es:[bx - 1]
        cbw
        mov     dx, ax
        sub     word ptr [FP_7B8F], ax
        retf
fn_b05de:
        push    si
        inc     byte ptr [B_7B8D]
        les     bx, dword ptr [FP_7B8F]
        mov     al, byte ptr es:[bx]
        cbw
        add     word ptr [FP_7B8F], ax
        les     bx, dword ptr [FP_7B8F]
        mov     al, byte ptr es:[bx]
        cbw
        mov     si, ax
        or      ax, ax
        jnz     br_b0601
        push    cs
        call    fn_b05ca
br_b0601:
        mov     ax, si
        pop     si
        retf
fn_b0605:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp + 6]
        or      si, si
        jge     br_b0612
        xor     si, si
br_b0612:
        mov     byte ptr [B_7B8D], 0
        mov     word ptr [W_7B91], ds
        mov     word ptr [FP_7B8F], B_7B93
        inc     word ptr [FP_7B8F]
        jmp     br_b062b
loop_b0627:
        push    cs
        call    fn_b05de
br_b062b:
        mov     ax, si
        dec     si
        or      ax, ax
        jnz     loop_b0627
        pop     si
        pop     bp
        retf
fn_b0635:
        push    bp
        mov     bp, sp
        sub     sp, 2
        mov     al, byte ptr [B_7B8D]
        mov     byte ptr [bp - 1], al
        jmp     br_b064e
loop_b0643:
        les     bx, dword ptr [FP_7B8F]
        cmp     byte ptr es:[bx + 3], 7
        jnz     br_b0662
br_b064e:
        cmp     word ptr [bp + 6], 0
        jle     br_b065a
        push    cs
        call    fn_b05de
        jmp     br_b065e
br_b065a:
        push    cs
        call    fn_b05ca
br_b065e:
        or      ax, ax
        jnz     loop_b0643
br_b0662:
        mov     al, byte ptr [B_7B8D]
        mov     byte ptr [B_7B8E], al
        mov     al, byte ptr [bp - 1]
        mov     byte ptr [B_7B8D], al
        leave
        retf
fn_b0670:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    si
        mov     si, word ptr [bp + 6]
        mov     al, byte ptr [B_7B8D]
        mov     byte ptr [bp - 6], al
        les     bx, dword ptr [FP_7B8F]
        mov     al, byte ptr es:[bx + 1]
        mov     byte ptr [bp - 1], al
        mov     al, byte ptr es:[bx + 2]
        mov     byte ptr [bp - 3], al
        mov     byte ptr [bp - 7], 7
        jmp     near br_b0751
br_b0699:
        mov     al, byte ptr [bp - 3]
        mov     byte ptr [bp - 2], al
        jmp     br_b06d6
loop_b06a1:
        les     bx, dword ptr [FP_7B8F]
        mov     al, byte ptr es:[bx + 1]
        mov     dl, al
        cmp     al, byte ptr [bp - 1]
        jz      br_b06d6
        mov     byte ptr [bp - 4], al
        mov     byte ptr [bp - 1], al
        mov     al, byte ptr es:[bx + 2]
        mov     byte ptr [bp - 3], al
        sub     al, byte ptr [bp - 2]
        mov     byte ptr [bp - 5], al
        cmp     byte ptr [bp - 5], 0
        jge     br_b06ce
        neg     al
        mov     byte ptr [bp - 5], al
br_b06ce:
        mov     al, byte ptr [B_7B8D]
        mov     byte ptr [B_7B8E], al
        jmp     br_b06e8
br_b06d6:
        or      si, si
        jle     br_b06e0
        push    cs
        call    fn_b05de
        jmp     br_b06e4
br_b06e0:
        push    cs
        call    fn_b05ca
br_b06e4:
        or      ax, ax
        jnz     loop_b06a1
br_b06e8:
        les     bx, dword ptr [FP_7B8F]
        mov     al, byte ptr es:[bx + 3]
        mov     byte ptr [bp - 7], al
        jmp     br_b0733
loop_b06f5:
        les     bx, dword ptr [FP_7B8F]
        mov     al, byte ptr es:[bx + 1]
        cmp     al, byte ptr [bp - 4]
        jnz     br_b0745
        les     bx, dword ptr [FP_7B8F]
        mov     dl, byte ptr es:[bx + 2]
        sub     dl, byte ptr [bp - 2]
        or      dl, dl
        jge     br_b0713
        neg     dl
br_b0713:
        cmp     dl, byte ptr [bp - 5]
        jge     br_b0733
        mov     al, byte ptr [B_7B8D]
        mov     byte ptr [B_7B8E], al
        mov     byte ptr [bp - 5], dl
        les     bx, dword ptr [FP_7B8F]
        mov     al, byte ptr es:[bx + 2]
        mov     byte ptr [bp - 3], al
        mov     al, byte ptr es:[bx + 3]
        mov     byte ptr [bp - 7], al
br_b0733:
        or      si, si
        jle     br_b073d
        push    cs
        call    fn_b05de
        jmp     br_b0741
br_b073d:
        push    cs
        call    fn_b05ca
br_b0741:
        or      ax, ax
        jnz     loop_b06f5
br_b0745:
        mov     al, byte ptr [B_7B8E]
        cbw
        push    ax
        push    cs
        call    fn_b0605
        add     sp, 2
br_b0751:
        cmp     byte ptr [bp - 7], 7
        jnz     br_b075a
        jmp     near br_b0699
br_b075a:
        mov     al, byte ptr [bp - 6]
        mov     byte ptr [B_7B8D], al
        pop     si
        leave
        retf
fn_b0763:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [B_7B8D]
        mov     byte ptr [B_7B8E], al
        mov     ax, word ptr [bp + 6]
        and     ax, 0f00h
        cmp     ax, 400h
        jz      br_b0795
        jg      br_b0785
        cmp     ax, 100h
        jz      br_b07a0
        cmp     ax, 200h
        jz      br_b07ab
        pop     bp
        retf
br_b0785:
        cmp     ax, 800h
        jnz     br_b07b4
        push    1
        push    cs
        call    fn_b0635
        add     sp, 2
        pop     bp
        retf
br_b0795:
        push    0ffffh
        push    cs
        call    fn_b0635
        add     sp, 2
        pop     bp
        retf
br_b07a0:
        push    0ffffh
        push    cs
        call    fn_b0670
        add     sp, 2
        pop     bp
        retf
br_b07ab:
        push    1
        push    cs
        call    fn_b0670
        add     sp, 2
br_b07b4:
        pop     bp
        retf
fn_b07b6:
        push    bp
        mov     bp, sp
        sub     sp, 4
        mov     ax, word ptr [W_7B91]
        mov     dx, word ptr [FP_7B8F]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx + 4]
        mov     byte ptr [B_7B8B], al
        mov     al, byte ptr es:[bx + 2]
        mov     byte ptr [B_7B89], al
        cbw
        push    ax
        mov     al, byte ptr es:[bx + 1]
        mov     byte ptr [B_7B8A], al
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        les     bx, dword ptr [bp - 4]
        mov     ax, word ptr es:[bx + 7]
        mov     dx, word ptr es:[bx + 5]
        mov     word ptr [W_7B57], ax
        mov     word ptr [FP_7B55], dx
        mov     al, 0
        mov     byte ptr [B_7B87], al
        cbw
        mov     bx, ax
        mov     byte ptr [bx + TBL_7B5E], 0
        mov     byte ptr [B_7B5D], 0
        mov     byte ptr [B_7B88], 1
        mov     bx, word ptr [bp - 4]
        mov     al, byte ptr es:[bx + 0dh]
        mov     byte ptr [B_7B54], al
        mov     al, byte ptr es:[bx + 3]
        mov     byte ptr [B_7B8C], al
        leave
        retf
fn_b0829:
        push    bp
        mov     bp, sp
        push    si
        mov     ax, word ptr [bp + 8]
        shl     ax, 8
        mov     cx, word ptr [bp + 6]
        add     cx, ax
        xor     dx, dx
        mov     si, 0ef5h
loop_b083d:
        mov     bx, word ptr [si]
        mov     ax, bx
        or      ax, ax
        jz      br_b0858
        cmp     bx, cx
        jnz     br_b084e
        mov     ax, dx
        pop     si
        pop     bp
        retf
br_b084e:
        add     si, 2
        inc     dx
        if      FW_VERSION >= 311
        cmp     si, TBL_0F77
        else
        cmp     si, 0f77h
        endif
        jnz     loop_b083d
br_b0858:
        mov     ax, 0ffffh
        pop     si
        if      FW_VERSION >= 311
        pop     bp
        retf
far_b085e:
        push    bp
        mov     bp, sp
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    cs
        call    fn_b0829
        add     sp, 4
        endif
        pop     bp
        retf
fn_b0870:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        mov     si, word ptr [bp + 6]
        cmp     si, 44h
        jz      br_b0889
        cmp     si, 4eh
        jz      br_b0889
        mov     ax, si
        pop     si
        leave
        retf
br_b0889:
        test    word ptr [bp + 8], 80h
        jnz     br_b0895
        mov     ax, si
        pop     si
        leave
        retf
br_b0895:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     word ptr [bp - 2], ax
        push    0
        push    cs
        call    fn_b0605
        add     sp, 2
loop_b08a5:
        push    cs
        call    fn_b07b6
        cmp     byte ptr [B_7B8C], 0
        jnz     br_b08e4
        test    byte ptr [B_7B54], 10h
        jz      br_b08e4
        cmp     si, 44h
        jnz     br_b08cb
        mov     al, byte ptr [B_D4C0]
        cbw
        push    ax
        callf   SEG_B30D:far_b32ec
        add     sp, 2
        jmp     br_b08d8
br_b08cb:
        mov     al, byte ptr [B_D4C1]
        cbw
        push    ax
        callf   SEG_B30D:far_b32ec
        add     sp, 2
br_b08d8:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     word ptr [bp - 2], ax
        mov     si, 8000h
        jmp     br_b08ec
br_b08e4:
        push    cs
        call    fn_b05de
        or      ax, ax
        jnz     loop_b08a5
br_b08ec:
        mov     al, byte ptr [bp - 2]
        mov     byte ptr [B_7B8D], al
        mov     ax, si
        pop     si
        leave
        retf
far_b08f7:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        push    di
        mov     al, byte ptr [B_D5DD]
        cbw
        push    ax
        mov     al, byte ptr [B_D5DE]
        cbw
        push    ax
        push    cs
        call    fn_b0829
        add     sp, 4
        mov     word ptr [bp - 4], ax
        or      ax, ax
        jl      br_b0921
        mov     bx, word ptr [bp - 4]
        mov     al, byte ptr [bx + TBL_83F3]
        mov     byte ptr [B_7B8E], al
br_b0921:
        mov     al, 0
        mov     byte ptr [B_D4BB], al
        cbw
        mov     si, ax
        jmp     br_b0c73
br_b092c:
        xor     si, si
        mov     byte ptr [B_7B8C], 0ffh
        mov     al, byte ptr [B_7B8E]
        cbw
        push    ax
        push    cs
        call    fn_b0605
        add     sp, 2
        les     bx, dword ptr [FP_7B8F]
        cmp     byte ptr es:[bx], 0
        jz      br_b094d
        push    cs
        call    fn_b07b6
br_b094d:
        mov     byte ptr [bp - 2], 1
        callf   SEG_B254:far_b284a
        jmp     tgt_b0c47
br_b0959:
        les     bx, dword ptr [FP_7B8F]
        cmp     byte ptr es:[bx], 0
        if      FW_VERSION >= 311
        jz      br_b098a
        else
        jz      L_b7844
        endif
        mov     al, byte ptr [B_D4BB]
        cbw
        or      ax, ax
        if      FW_VERSION >= 311
        jnz     br_b098a
        else
        jnz     L_b7844
        endif
        cmp     byte ptr [B_7B88], 0
        jz      br_b097e
        push    3
        callf   SEG_B1AA:far_b1ab2
        add     sp, 2
        if      FW_VERSION >= 311
        jmp     br_b0994
        else
        jmp     L_b7844
        endif
br_b097e:
        push    2
        callf   SEG_B1AA:far_b1ab2
        add     sp, 2
        if      FW_VERSION >= 311
        jmp     br_b0994
br_b098a:
        push    0
        callf   SEG_B1AA:far_b1ab2
        add     sp, 2
br_b0994:
        else
L_b7844:
        endif
        cmp     byte ptr [B_7B5D], 0
        jz      br_b09a5
        callf   SEG_D79E:far_d79ee
        mov     byte ptr [bp - 1], al
        jmp     br_b09b2
br_b09a5:
        push    0
        callf   SEG_BA0A:far_ba0a7
        add     sp, 2
        mov     byte ptr [bp - 1], al
br_b09b2:
        push    0
        callf   SEG_B1AA:far_b1ab2
        add     sp, 2
        cmp     byte ptr [bp - 1], 48h
        jnz     br_b09f3
        mov     al, byte ptr [B_D4BB]
        cbw
        or      ax, ax
        jz      br_b09cd
        jmp     tgt_b0c47
br_b09cd:
        mov     al, byte ptr [B_7B88]
        cbw
        or      ax, ax
        jnz     br_b09e1
        mov     al, byte ptr [B_7B8D]
        push    ax
        nop
        push    cs
        call    far_b1073
        add     sp, 2
br_b09e1:
        callf   SEG_B1AA:far_b1af9
        nop
        push    cs
        call    far_b129e
        mov     byte ptr [B_D4BB], 1
        jmp     tgt_b0c47
br_b09f3:
        cmp     byte ptr [B_D4BB], 0
        jz      br_b0a14
        callf   SEG_B1AA:far_b1aff
        mov     byte ptr [B_D4BB], 0
        les     bx, dword ptr [FP_7B8F]
        cmp     byte ptr es:[bx], 0
        jz      br_b0a14
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_b0a14:
        cmp     byte ptr [B_7B5D], 0
        jz      br_b0a2c
        mov     al, byte ptr [bp - 1]
        push    ax
        callf   SEG_B254:far_b2542
        add     sp, 2
        mov     si, ax
        jmp     tgt_b0c47
br_b0a2c:
        mov     dl, byte ptr [bp + 6]
        and     dl, 7
        mov     al, byte ptr [bp - 1]
        cbw
        if      FW_VERSION < 311
        mov     di, ax
        endif
        cmp     ax, 78h
        jz      br_b0a5a
        jg      br_b0a4e
        cmp     ax, 44h
        jz      br_b0a7a
        cmp     ax, 4eh
        jz      br_b0a7a
        cmp     ax, 75h
        jz      br_b0a72
        jmp     br_b0aa1
br_b0a4e:
        cmp     ax, 79h
        jz      br_b0a62
        cmp     ax, 7ah
        jz      br_b0a6a
        jmp     br_b0aa1
br_b0a5a:
        cmp     dl, 1
        jge     br_b0aa1
        jmp     tgt_b0c47
br_b0a62:
        cmp     dl, 2
        jge     br_b0aa1
        jmp     tgt_b0c47
br_b0a6a:
        cmp     dl, 3
        jge     br_b0aa1
        jmp     tgt_b0c47
br_b0a72:
        cmp     dl, 4
        jge     br_b0aa1
        jmp     tgt_b0c47
br_b0a7a:
        if      FW_VERSION >= 311
        test    word ptr [bp + 6], 0c0h
        jnz     br_b0a8b
        else
        test    byte ptr [bp + 6], 0c0h
        jnz     br_b0aa1
        endif
        cmp     byte ptr [B_7B8C], 0
        if      FW_VERSION >= 311
        jz      br_b0a8b
        else
        jz      br_b0aa1
        endif
        jmp     tgt_b0c47
        if      FW_VERSION >= 311
br_b0a8b:
        cmp     byte ptr [bp - 1], 4eh
        jnz     br_b0aa1
        mov     al, byte ptr [B_D4C0]
        cbw
        push    ax
        callf   SEG_DAB0:far_dab37
        add     sp, 2
        mov     byte ptr [B_D4BF], al
        endif
br_b0aa1:
        if      FW_VERSION >= 311
        test    word ptr [bp + 6], 10h
        else
        test    byte ptr [bp + 6], 10h
        endif
        jnz     br_b0ad0
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 1]
        cbw
        else
        mov     ax, di
        endif
        cmp     ax, 7bh
        jnz     br_b0ab4
        jmp     tgt_b0c47
br_b0ab4:
        jg      br_b0ac8
        cmp     ax, 5bh
        jnz     br_b0abe
        jmp     tgt_b0c47
br_b0abe:
        cmp     ax, 5dh
        jnz     br_b0ac6
        jmp     tgt_b0c47
br_b0ac6:
        jmp     br_b0ad0
br_b0ac8:
        cmp     ax, 7dh
        jnz     br_b0ad0
        jmp     tgt_b0c47
br_b0ad0:
        les     bx, dword ptr [FP_7B8F]
        cmp     byte ptr es:[bx], 0
        jnz     br_b0b51
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 1]
        cbw
        mov     di, ax
        else
        mov     ax, di
        endif
        cmp     ax, 2eh
        jnz     br_b0ae8
        jmp     tgt_b0c47
br_b0ae8:
        jg      br_b0b0d
        cmp     ax, 2bh
        jnz     br_b0af2
        jmp     tgt_b0c47
br_b0af2:
        jg      br_b0b03
        cmp     ax, 0dh
        jnz     br_b0afc
        jmp     tgt_b0c47
br_b0afc:
        cmp     ax, 21h
        jz      br_b0b30
        jmp     br_b0b3f
br_b0b03:
        cmp     ax, 2dh
        jnz     br_b0b0b
        jmp     tgt_b0c47
br_b0b0b:
        jmp     br_b0b3f
br_b0b0d:
        cmp     ax, 5eh
        jz      br_b0b30
        jg      br_b0b26
        cmp     ax, 3ch
        jnz     br_b0b1c
        jmp     tgt_b0c47
br_b0b1c:
        cmp     ax, 3eh
        jnz     br_b0b24
        jmp     tgt_b0c47
br_b0b24:
        jmp     br_b0b3f
br_b0b26:
        cmp     ax, 68h
        jnz     br_b0b2e
        jmp     tgt_b0c47
br_b0b2e:
        jmp     br_b0b3f
br_b0b30:
        if      FW_VERSION >= 311
        test    word ptr [bp + 6], 20h
        else
        test    byte ptr [bp + 6], 20h
        endif
        jnz     br_b0b3a
        jmp     tgt_b0c47
br_b0b3a:
        mov     si, di
        jmp     tgt_b0c47
br_b0b3f:
        mov     al, byte ptr [di + TBL_79A5]
        cbw
        test    ax, 2
        jz      br_b0b4c
        jmp     tgt_b0c47
br_b0b4c:
        mov     si, di
        jmp     tgt_b0c47
br_b0b51:
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 1]
        cbw
        mov     di, ax
        else
        mov     ax, di
        endif
        cmp     ax, 5eh
        jz      br_b0b74
        jg      br_b0b6a
        cmp     ax, 0dh
        jz      br_b0ba6
        cmp     ax, 21h
        jz      br_b0b8d
        jmp     br_b0bbb
br_b0b6a:
        cmp     ax, 68h
        jnz     br_b0b72
        jmp     tgt_b0c47
br_b0b72:
        jmp     br_b0bbb
br_b0b74:
        if      FW_VERSION >= 311
        test    word ptr [bp + 6], 20h
        else
        test    byte ptr [bp + 6], 20h
        endif
        jz      br_b0b80
        mov     si, di
        if      FW_VERSION >= 311
        jmp     near tgt_b0c47
        else
        jmp     tgt_b0c47
        endif
br_b0b80:
        nop
        push    cs
        call    far_b0caf
        add     ax, 100h
        mov     si, ax
        jmp     near tgt_b0c47
br_b0b8d:
        if      FW_VERSION >= 311
        test    word ptr [bp + 6], 20h
        else
        test    byte ptr [bp + 6], 20h
        endif
        jz      br_b0b99
        mov     si, di
        jmp     near tgt_b0c47
br_b0b99:
        nop
        push    cs
        call    far_b0caf
        add     ax, 200h
        mov     si, ax
        jmp     near tgt_b0c47
br_b0ba6:
        mov     si, 800h
        nop
        push    cs
        call    far_b0caf
        or      ax, ax
        jnz     br_b0bb5
        jmp     near tgt_b0c47
br_b0bb5:
        mov     si, 8000h
        jmp     near tgt_b0c47
br_b0bbb:
        mov     al, byte ptr [B_7B8C]
        cbw
        and     ax, 0fh
        mov     bx, ax
        cmp     bx, 9
        if      FW_VERSION >= 311
        ja      tgt_b0c47
        else
        jbe     L_b7a59
        jmp     near tgt_b0c47
L_b7a59:
        endif
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_b0c9b]
tgt_b0bd0:
        if      FW_VERSION >= 311
        push    word ptr [bp + 6]
        else
        mov     al, byte ptr [bp + 6]
        cbw
        push    ax
        endif
        mov     al, byte ptr [bp - 1]
        push    ax
        callf   SEG_B30D:far_b30df
        add     sp, 4
        mov     si, ax
        jmp     tgt_b0c47
tgt_b0be3:
        mov     al, byte ptr [bp - 1]
        push    ax
        callf   SEG_B254:far_b2542
        add     sp, 2
        mov     si, ax
        jmp     tgt_b0c47
tgt_b0bf3:
        cmp     byte ptr [bp - 2], 0
        jz      br_b0c07
        push    0
        callf   SEG_B2E3:far_b2e3a
        add     sp, 2
        mov     byte ptr [bp - 2], 0
br_b0c07:
        mov     al, byte ptr [bp - 1]
        push    ax
        callf   SEG_B2E3:far_b2e3a
        add     sp, 2
        mov     si, ax
        jmp     tgt_b0c47
tgt_b0c17:
        mov     al, byte ptr [bp - 1]
        push    ax
        callf   SEG_B2CD:far_b2cd7
        add     sp, 2
        mov     si, ax
        jmp     tgt_b0c47
tgt_b0c27:
        mov     al, byte ptr [bp - 1]
        push    ax
        callf   SEG_B292:far_b292f
        add     sp, 2
        mov     si, ax
        jmp     tgt_b0c47
tgt_b0c37:
        mov     al, byte ptr [bp - 1]
        push    ax
        callf   SEG_B285:far_b2850
        add     sp, 2
        mov     si, ax
        jmp     tgt_b0c47
tgt_b0c47:
        or      si, si
        jnz     br_b0c4e
        jmp     br_b0959
br_b0c4e:
        test    si, 0ffh
        jz      br_b0c56
        jmp     br_b0c7c
br_b0c56:
        push    si
        push    cs
        call    fn_b0763
        add     sp, 2
        cmp     word ptr [bp - 4], 0
        jl      br_b0c73
        mov     bx, word ptr [bp - 4]
        mov     al, byte ptr [B_7B8E]
        mov     byte ptr [bx + TBL_83F3], al
        mov     byte ptr [B_D4B4], 1
br_b0c73:
        test    si, 8000h
        jnz     br_b0c7c
        jmp     br_b092c
br_b0c7c:
        if      FW_VERSION >= 311
        push    word ptr [bp + 6]
        else
        mov     al, byte ptr [bp + 6]
        cbw
        push    ax
        endif
        push    si
        push    cs
        call    fn_b0870
        add     sp, 4
        mov     si, ax
        test    si, 8000h
        jz      br_b0c95
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_b0c95:
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
TBL_b0c9b:
        dw      tgt_b0bd0
        dw      tgt_b0be3
        dw      tgt_b0bf3
        dw      tgt_b0c17
        dw      tgt_b0c17
        dw      tgt_b0c27
        dw      tgt_b0bf3
        dw      tgt_b0c47
        dw      tgt_b0c37
        dw      tgt_b0bf3
far_b0caf:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    si
        push    di
        mov     ax, word ptr [W_7B91]
        mov     dx, word ptr [FP_7B8F]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        mov     al, byte ptr [B_7B88]
        cbw
        or      ax, ax
        jz      br_b0ccf
        jmp     br_b0e02
br_b0ccf:
        les     bx, dword ptr [bp - 8]
        mov     al, byte ptr es:[bx + 3]
        cbw
        and     ax, 0fh
        or      ax, ax
        jz      br_b0cee
        cmp     ax, 1
        jz      br_b0d45
        cmp     ax, 5
        jnz     br_b0ceb
        jmp     br_b0dbd
br_b0ceb:
        jmp     br_b0dfb
br_b0cee:
        les     bx, dword ptr [bp - 8]
        mov     al, byte ptr es:[bx + 4]
        cbw
        mov     bx, ax
        mov     byte ptr [bx + TBL_7B5E], 0
        push    ds
        push    word TBL_7B5E
        nop
        push    cs
        call    fn_b0e08
        add     sp, 4
        mov     si, ax
        les     bx, dword ptr [bp - 8]
        mov     ax, word ptr es:[bx + 0eh]
        or      ax, word ptr es:[bx + 10h]
        jz      br_b0d24
        push    1
        push    si
        seges
        callf   dword ptr [bx + 0eh]
        add     sp, 4
        mov     si, ax
br_b0d24:
        les     bx, dword ptr [bp - 8]
        test    byte ptr es:[bx + 0dh], 8
        jnz     br_b0d39
        callf   SEG_B30D:far_b342e
        or      ax, ax
        jge     br_b0d39
        neg     si
br_b0d39:
        push    si
        callf   SEG_B30D:far_b32ec
        add     sp, 2
        jmp     near br_b0dfb
br_b0d45:
        push    ds
        push    word TBL_7B5E
        nop
        push    cs
        call    fn_b0f1c
        add     sp, 4
        cmp     byte ptr [TBL_7B5E], 0
        jnz     br_b0d62
        mov     byte ptr [TBL_7B5E], 5fh
        mov     byte ptr [B_7B5F], 0
br_b0d62:
        les     bx, dword ptr [bp - 8]
        mov     al, byte ptr es:[bx + 4]
        cbw
        push    ax
        push    ds
        push    word TBL_7B5E
        nop
        push    cs
        call    far_b0fe4
        add     sp, 6
        mov     ax, word ptr [W_7B57]
        mov     si, word ptr [FP_7B55]
        push    ds
        pop     es
        mov     di, TBL_7B5E
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        mov     byte ptr [B_D4B4], 1
        push    word ptr [W_7B57]
        push    word ptr [FP_7B55]
        callf   SEG_B254:far_b2739
        add     sp, 4
        jmp     br_b0dfb
br_b0dbd:
        push    ds
        push    word TBL_7B5E
        callf   SEG_B292:far_b2b84
        add     sp, 4
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        mov     al, byte ptr [B_9446]
        cbw
        or      ax, ax
        jnz     br_b0ded
        push    dx
        push    word ptr [bp - 4]
        push    ds
        push    word B_901B
        callf   SEG_E3C0:far_e3c0f
        add     sp, 8
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
br_b0ded:
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        callf   SEG_B292:far_b2acb
        add     sp, 4
br_b0dfb:
        mov     ax, 8000h
        pop     di
        pop     si
        leave
        retf
br_b0e02:
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
fn_b0e08:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    si
        push    di
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   0f800h:far_fa2a0
        add     sp, 4
        mov     si, ax
        test    byte ptr [B_7B54], 4
        jz      br_b0e7a
        mov     dx, 0ah
        mov     ax, si
        imul    dx
        mov     si, ax
        les     di, dword ptr [bp + 6]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        mov     ax, 2eh
        sub     di, cx
        repne scasb
        jz      br_b0e4c
        mov     di, 1
        xor     ax, ax
        mov     es, ax
br_b0e4c:
        dec     di
        mov     ax, es
        mov     word ptr [bp - 4], ax
        mov     word ptr [bp - 6], di
        mov     dx, di
        or      dx, ax
        jz      br_b0e7a
        inc     word ptr [bp - 6]
        les     bx, dword ptr [bp - 6]
        mov     al, byte ptr es:[bx]
        mov     byte ptr [bp - 1], al
        cbw
        mov     bx, ax
        test    byte ptr [bx + TBL_79A5], 2
        jz      br_b0e7a
        mov     al, byte ptr [bp - 1]
        cbw
        add     ax, 0ffd0h
        add     si, ax
br_b0e7a:
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
far_b0e80:
        push    bp
        mov     bp, sp
        sub     sp, 2
        cmp     byte ptr [B_7B88], 0
        jnz     br_b0e90
        jmp     near br_b0f1a
br_b0e90:
        mov     byte ptr [B_7B87], 0
        mov     al, byte ptr [B_7B87]
        cmp     al, byte ptr [B_7B8B]
        jge     br_b0edd
loop_b0e9e:
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx], 0
        jz      br_b0eb2
        mov     al, byte ptr es:[bx]
        mov     byte ptr [bp - 1], al
        inc     word ptr [bp + 6]
        jmp     br_b0eb6
br_b0eb2:
        mov     byte ptr [bp - 1], 20h
br_b0eb6:
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        mov     al, byte ptr [B_7B87]
        cbw
        mov     dl, byte ptr [bp - 1]
        mov     bx, ax
        mov     byte ptr [bx + TBL_7B5E], dl
        inc     byte ptr [B_7B87]
        mov     al, byte ptr [B_7B87]
        cmp     al, byte ptr [B_7B8B]
        jl      loop_b0e9e
br_b0edd:
        mov     al, byte ptr [B_7B8B]
        cbw
        mov     bx, ax
        mov     byte ptr [bx + TBL_7B5E], 0
        mov     byte ptr [B_7B87], 0
        mov     al, byte ptr [B_7B89]
        cbw
        push    ax
        mov     al, byte ptr [B_7B8A]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     byte ptr [B_7B88], 0
        mov     al, byte ptr [B_7B8C]
        cbw
        and     ax, 0fh
        cmp     ax, 1
        jnz     br_b0f15
        mov     ax, 1
        jmp     br_b0f17
br_b0f15:
        xor     ax, ax
br_b0f17:
        mov     byte ptr [B_7B5D], al
br_b0f1a:
        leave
        retf
fn_b0f1c:
        push    bp
        mov     bp, sp
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    fn_b0f4b
        add     sp, 4
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    fn_b0f9e
        add     sp, 4
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    fn_b0f7e
        add     sp, 4
        pop     bp
        retf
fn_b0f4b:
        push    bp
        mov     bp, sp
        push    si
        push    di
        les     di, dword ptr [bp + 6]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        dec     cx
        dec     cx
        mov     dx, cx
        mov     si, word ptr [bp + 6]
        add     si, dx
        jmp     br_b0f76
loop_b0f67:
        mov     es, word ptr [bp + 8]
        cmp     byte ptr es:[si], 20h
        jnz     br_b0f7a
        mov     byte ptr es:[si], 0
        dec     si
        dec     dx
br_b0f76:
        or      dx, dx
        jge     loop_b0f67
br_b0f7a:
        pop     di
        pop     si
        pop     bp
        retf
fn_b0f7e:
        push    bp
        mov     bp, sp
        jmp     br_b0f93
loop_b0f83:
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx], 20h
        jnz     br_b0f90
        mov     byte ptr es:[bx], 5fh
br_b0f90:
        inc     word ptr [bp + 6]
br_b0f93:
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx], 0
        jnz     loop_b0f83
        pop     bp
        retf
fn_b0f9e:
        push    bp
        mov     bp, sp
        sub     sp, 4
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        jmp     br_b0fb5
loop_b0fb2:
        inc     word ptr [bp - 4]
br_b0fb5:
        les     bx, dword ptr [bp - 4]
        cmp     byte ptr es:[bx], 20h
        jz      loop_b0fb2
        jmp     br_b0fd2
loop_b0fc0:
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx]
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], al
        inc     word ptr [bp - 4]
        inc     word ptr [bp + 6]
br_b0fd2:
        les     bx, dword ptr [bp - 4]
        cmp     byte ptr es:[bx], 0
        jnz     loop_b0fc0
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], 0
        leave
        retf
far_b0fe4:
        push    bp
        mov     bp, sp
        mov     dx, word ptr [bp + 0ah]
        jmp     br_b0ff0
loop_b0fec:
        dec     dx
        inc     word ptr [bp + 6]
br_b0ff0:
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx], 0
        jnz     loop_b0fec
        jmp     br_b1005
loop_b0ffb:
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], 20h
        inc     word ptr [bp + 6]
br_b1005:
        mov     ax, dx
        dec     dx
        or      ax, ax
        jg      loop_b0ffb
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], 0
        pop     bp
        retf
far_b1015:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ss
        lea     ax, [bp - 1]
        push    ax
        callf   SEG_B1AA:far_b1b2b
        add     sp, 8
        mov     al, byte ptr [bp + 6]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        mov     al, byte ptr [B_7B87]
        cbw
        mov     dl, byte ptr [bp + 6]
        mov     bx, ax
        mov     byte ptr [bx + TBL_7B5E], dl
        inc     byte ptr [B_7B87]
        mov     al, byte ptr [B_7B87]
        cmp     al, byte ptr [B_7B8B]
        jl      br_b106f
        mov     al, byte ptr [bp - 2]
        cbw
        push    ax
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        dec     byte ptr [B_7B87]
        mov     ax, 0ffffh
        leave
        retf
br_b106f:
        xor     ax, ax
        leave
        retf
far_b1073:
        push    bp
        mov     bp, sp
        sub     sp, 26h
        push    si
        mov     al, byte ptr [bp + 6]
        cbw
        push    ax
        push    cs
        call    fn_b0605
        add     sp, 2
        les     bx, dword ptr [FP_7B8F]
        cmp     byte ptr es:[bx], 0
        jnz     br_b1093
        jmp     br_b11ef
br_b1093:
        mov     ax, word ptr [W_7B91]
        mov     dx, word ptr [FP_7B8F]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        push    cs
        call    fn_b07b6
        mov     al, byte ptr [B_7B8C]
        cbw
        and     ax, 0fh
        mov     bx, ax
        cmp     bx, 9
        jbe     br_b10bb
        jmp     tgt_b11ea
br_b10bb:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_b11f2]
tgt_b10c2:
        callf   SEG_B30D:far_b342e
        push    ax
        callf   SEG_B30D:far_b32ec
        add     sp, 2
        jmp     tgt_b11ea
tgt_b10d3:
        push    word ptr [W_7B57]
        push    word ptr [FP_7B55]
        callf   SEG_B254:far_b2739
        add     sp, 4
        jmp     tgt_b11ea
tgt_b10e6:
        les     bx, dword ptr [bp - 8]
        les     bx, dword ptr es:[bx + 5]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        shl     ax, 2
        les     bx, dword ptr [bp - 8]
        les     bx, dword ptr es:[bx + 9]
        add     bx, ax
        push    word ptr es:[bx + 2]
        push    word ptr es:[bx]
        callf   SEG_B254:far_b2739
        add     sp, 4
        jmp     tgt_b11ea
tgt_b1110:
        les     bx, dword ptr [bp - 8]
        les     bx, dword ptr es:[bx + 9]
        push    es
        les     si, dword ptr [bp - 8]
        les     si, dword ptr es:[si + 0bh]
        mov     ax, word ptr es:[si]
        shl     ax, 2
        add     bx, ax
        pop     es
        push    word ptr es:[bx + 2]
        push    word ptr es:[bx]
        callf   SEG_B254:far_b2739
        add     sp, 4
        jmp     near tgt_b11ea
tgt_b113a:
        les     bx, dword ptr [FP_7B55]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        les     bx, dword ptr [bp - 4]
        mov     cl, byte ptr es:[bx + 0dh]
        mov     dx, 1
        shl     dx, cl
        test    dx, ax
        jz      br_b1158
        mov     ax, 1
        jmp     br_b115a
br_b1158:
        xor     ax, ax
br_b115a:
        mov     word ptr [bp - 0eh], ax
        les     bx, dword ptr [bp - 4]
        les     bx, dword ptr es:[bx + 9]
        shl     ax, 2
        add     bx, ax
        push    word ptr es:[bx + 2]
        push    word ptr es:[bx]
        callf   SEG_B254:far_b2739
        add     sp, 4
        jmp     tgt_b11ea
tgt_b117a:
        mov     byte ptr [B_7B8B], 9
        les     bx, dword ptr [FP_7B55]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        push    ax
        callf   SEG_B2CD:far_b2da1
        add     sp, 2
        push    dx
        push    ax
        callf   SEG_B254:far_b2739
        add     sp, 4
        jmp     tgt_b11ea
tgt_b119d:
        les     bx, dword ptr [FP_7B55]
        mov     ax, word ptr es:[bx + 2]
        mov     dx, word ptr es:[bx]
        add     dx, 0
        adc     ax, word ptr [W_9563]
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp - 0ch], dx
        push    ax
        push    dx
        callf   SEG_B292:far_b2acb
        add     sp, 4
        jmp     tgt_b11ea
tgt_b11c1:
        mov     byte ptr [B_7B8B], 15h
        push    ss
        lea     ax, [bp - 26h]
        push    ax
        les     bx, dword ptr [FP_7B55]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        push    ax
        callf   SEG_E201:far_e201c
        add     sp, 6
        push    ss
        lea     ax, [bp - 26h]
        push    ax
        callf   SEG_B254:far_b2739
        add     sp, 4
tgt_b11ea:
        mov     byte ptr [B_D4B4], 1
br_b11ef:
        pop     si
        leave
        retf
TBL_b11f2:
        dw      tgt_b10c2
        dw      tgt_b10d3
        dw      tgt_b10e6
        dw      tgt_b117a
        dw      tgt_b11ea
        dw      tgt_b119d
        dw      tgt_b113a
        dw      tgt_b11ea
        dw      tgt_b11c1
        dw      tgt_b1110
far_b1206:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        mov     si, word ptr [bp + 6]
        push    si
        push    cs
        call    fn_b0605
        add     sp, 2
        les     bx, dword ptr [FP_7B8F]
        cmp     byte ptr es:[bx], 0
        jz      br_b1256
        mov     al, byte ptr [B_7B8D]
        cbw
        cmp     ax, si
        jnz     br_b1256
        mov     ax, word ptr [W_7B91]
        mov     dx, word ptr [FP_7B8F]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        les     bx, dword ptr [bp - 4]
        test    byte ptr es:[bx + 3], 0fh
        jnz     br_b1256
        les     bx, dword ptr [FP_7B8F]
        mov     ax, word ptr [bp + 8]
        mov     word ptr es:[bx + 9], ax
        les     bx, dword ptr [bp - 4]
        mov     ax, word ptr [bp + 0ah]
        mov     word ptr es:[bx + 0bh], ax
br_b1256:
        pop     si
        leave
        retf
far_b1259:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    word ptr [bp + 6]
        push    cs
        call    fn_b0605
        add     sp, 2
        les     bx, dword ptr [FP_7B8F]
        cmp     byte ptr es:[bx], 0
        jz      br_b129c
        mov     ax, word ptr [W_7B91]
        mov     dx, word ptr [FP_7B8F]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        les     bx, dword ptr [bp - 4]
        test    byte ptr es:[bx + 3], 0fh
        jnz     br_b129c
        les     bx, dword ptr [FP_7B8F]
        mov     ax, word ptr [bp + 0ah]
        mov     dx, word ptr [bp + 8]
        mov     word ptr es:[bx + 10h], ax
        mov     word ptr es:[bx + 0eh], dx
br_b129c:
        leave
        retf
far_b129e:
        callf   SEG_B1AA:far_b1aac
        push    ds
        push    word STR_131E
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        cmp     byte ptr [B_D4B7], 0
        jz      br_b12e9
        push    3
        push    0
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_7B8D]
        cbw
        push    ax
        mov     al, byte ptr [B_D5DD]
        cbw
        push    ax
        mov     al, byte ptr [B_D5DE]
        cbw
        push    ax
        push    ds
        push    word STR_1323
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ah
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
br_b12e9:
        mov     al, byte ptr [B_7B8D]
        push    ax
        mov     al, byte ptr [B_D5DD]
        push    ax
        mov     al, byte ptr [B_D5DE]
        push    ax
        callf   SEG_CDE9:far_d4dcd
        add     sp, 6
        push    ds
        push    word A_D4C3
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        retf
far_b130a:
        push    bp
        mov     bp, sp
        push    si
        mov     al, byte ptr [bp + 6]
        mov     byte ptr [B_7B8E], al
        mov     al, byte ptr [B_D5DD]
        cbw
        push    ax
        mov     al, byte ptr [B_D5DE]
        cbw
        push    ax
        push    cs
        call    fn_b0829
        add     sp, 4
        mov     si, ax
        or      ax, ax
        jl      br_b1337
        mov     al, byte ptr [B_7B8E]
        mov     byte ptr [si + TBL_83F3], al
        mov     byte ptr [B_D4B4], 1
br_b1337:
        pop     si
        pop     bp
        retf
        if      FW_VERSION >= 311
        phase   0ah
        else
        phase   0eh
        endif
far_b133a:
        push    bp
        mov     bp, sp
        push    ds
        push    si
        mov     ax, 8010h
        mov     ds, ax
        mov     word ptr [W_1D1B], 0
        les     si, dword ptr [bp + 6]
        mov     bx, word ptr [bp + 0ah]
        mov     ax, bx
        shr     ax, 3
        add     si, ax
        mov     dx, word ptr es:[si]
        mov     cx, word ptr [bp + 0eh]
        mov     ch, cl
        mov     ax, 0ff00h
        rol     ax, cl
        sub     ah, ah
        mov     cl, 8
        and     bx, 7
        add     bl, ch
        sub     cl, bl
        mov     bl, byte ptr [bp + 0ch]
        js      br_b137e
        mov     ch, cl
        shl     bl, cl
        mov     cl, ch
        shl     al, cl
        jmp     br_b1388
br_b137e:
        neg     cl
        mov     ch, cl
        ror     bx, cl
        mov     cl, ch
        ror     ax, cl
br_b1388:
        not     ax
        and     ax, dx
        or      ax, bx
        mov     word ptr es:[si], ax
        xchg    cx, ax
        test    byte ptr [bp + 10h], 0ffh
        jz      br_b139b
        jmp     near br_b1426
br_b139b:
        mov     bx, si
        sub     bx, TBL_159B
        cmp     cl, dl
        jz      br_b13e4
        mov     ah, 0ah
        mov     al, bl
        call    fn_b142d
        mov     ah, 0bh
        mov     al, bh
        call    fn_b142d
        sub     ax, ax
        or      ah, cl
        jz      br_b13d9
        shr     ah, 1
        rcl     al, 1
        shr     ah, 1
        rcl     al, 1
        shr     ah, 1
        rcl     al, 1
        shr     ah, 1
        rcl     al, 1
        shr     ah, 1
        rcl     al, 1
        shr     ah, 1
        rcl     al, 1
        shr     ah, 1
        rcl     al, 1
        shr     ah, 1
        rcl     al, 1
br_b13d9:
        mov     ah, 0ch
        call    fn_b142d
        cmp     ch, dh
        jz      br_b1422
        jmp     br_b13f7
br_b13e4:
        cmp     ch, dh
        jz      br_b1426
        inc     bx
        mov     ah, 0ah
        mov     al, bl
        call    fn_b142d
        inc     ah
        mov     al, bh
        call    fn_b142d
br_b13f7:
        sub     ax, ax
        or      ah, ch
        jz      br_b141d
        shr     ah, 1
        rcl     al, 1
        shr     ah, 1
        rcl     al, 1
        shr     ah, 1
        rcl     al, 1
        shr     ah, 1
        rcl     al, 1
        shr     ah, 1
        rcl     al, 1
        shr     ah, 1
        rcl     al, 1
        shr     ah, 1
        rcl     al, 1
        shr     ah, 1
        rcl     al, 1
br_b141d:
        mov     ah, 0ch
        call    fn_b142d
br_b1422:
        inc     word ptr [W_1D1B]
br_b1426:
        mov     ax, word ptr [W_1D1B]
        pop     si
        pop     ds
        pop     bp
        retf
fn_b142d:
        push    dx
        xchg    al, ah
        push    ax
loop_b1431:
        mov     dx, 0e2h
        in      al, dx
        rcl     al, 1
        jc      loop_b1431
        pop     ax
        mov     dx, 0e2h
        out     dx, al
        nop
        nop
        nop
        nop
        nop
        nop
        xchg    ah, al
        mov     dx, 0e0h
        out     dx, al
        pop     dx
        ret
fn_b144c:
        callf   SEG_E931:far_e931c
        mov     word ptr [W_E54E], 1
        jmp     near br_b14fd
br_b145a:
        mov     al, byte ptr [B_A5C3]
        cbw
        and     ax, 3fh
        cmp     ax, 8
        jz      br_b146d
        cmp     ax, 0ah
        jz      br_b1497
        jmp     br_b14bf
br_b146d:
        push    0
        push    7
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        push    word ptr [W_E54E]
        push    6
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        push    word ptr [W_E54E]
        push    6
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        jmp     br_b14e9
br_b1497:
        push    0
        push    6
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        push    0
        push    6
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        push    word ptr [W_E54E]
        push    7
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        jmp     br_b14e9
br_b14bf:
        push    0
        push    6
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        push    0
        push    6
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        push    0
        push    7
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        mov     byte ptr [B_A5BE], 0
        retf
br_b14e9:
        push    4
        callf   SEG_B059:far_b059a
        add     sp, 2
        mov     ax, 1
        sub     ax, word ptr [W_E54E]
        mov     word ptr [W_E54E], ax
br_b14fd:
        cmp     byte ptr [B_A5BE], 0
        jz      br_b1507
        jmp     near br_b145a
br_b1507:
        retf
fn_b1508:
        push    bp
        mov     bp, sp
        push    si
        push    di
        mov     ax, word ptr [W_D5DF]
        cwd
        mov     di, dx
        mov     si, ax
        push    bp
        mov     bx, si
        mov     ax, di
        cwd
        mov     bp, dx
        mov     cx, 3
loop_b1520:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b1520
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 4
loop_b1531:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b1531
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 4
loop_b1542:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b1542
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 3
loop_b1553:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b1553
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 3
loop_b1564:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b1564
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 2
loop_b1575:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b1575
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        pop     bp
        mov     cx, 4
loop_b1587:
        sar     dx, 1
        rcr     ax, 1
        loop    loop_b1587
        push    ax
        push    dx
        mov     ax, word ptr [W_D5E1]
        cwd
        mov     si, ax
        mov     di, dx
        push    bp
        mov     bx, si
        mov     ax, di
        cwd
        mov     bp, dx
        mov     cx, 2
loop_b15a2:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b15a2
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 2
loop_b15b3:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b15b3
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 2
loop_b15c4:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b15c4
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 3
loop_b15d5:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b15d5
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 3
loop_b15e6:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b15e6
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 4
loop_b15f7:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b15f7
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 2
loop_b1608:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b1608
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        pop     bp
        mov     cx, 4
loop_b161a:
        sar     dx, 1
        rcr     ax, 1
        loop    loop_b161a
        pop     di
        pop     si
        sub     si, ax
        sbb     di, dx
        push    si
        push    di
        mov     ax, word ptr [bp + 6]
        sar     ax, 1
        sar     ax, 1
        cwd
        mov     si, ax
        mov     di, dx
        push    bp
        mov     bx, si
        mov     ax, di
        cwd
        mov     bp, dx
        mov     cx, 4
loop_b163f:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b163f
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 2
loop_b1650:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b1650
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 4
loop_b1661:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b1661
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 3
loop_b1672:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b1672
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 2
loop_b1683:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b1683
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        pop     bp
        mov     cx, 4
loop_b1695:
        sar     dx, 1
        rcr     ax, 1
        loop    loop_b1695
        pop     di
        pop     si
        sub     si, ax
        sbb     di, dx
        mov     ax, word ptr [W_D5DF]
        mov     word ptr [W_D5E1], ax
        mov     ax, word ptr [bp + 6]
        sar     ax, 1
        sar     ax, 1
        mov     word ptr [W_D5DF], ax
        mov     ax, si
        mov     dx, di
        mov     cx, 11h
loop_b16b8:
        shl     ax, 1
        rcl     dx, 1
        loop    loop_b16b8
        mov     cx, word ptr [W_944D]
        idiv    cx
        cmp     ax, word ptr [W_944B]
        jle     br_b16d0
        mov     word ptr [W_944B], ax
        jmp     br_b16d9
        db      090h
br_b16d0:
        cmp     ax, word ptr [W_9449]
        jge     br_b16d9
        mov     word ptr [W_9449], ax
br_b16d9:
        pop     di
        pop     si
        pop     bp
        retf
        db      0ffh
        if      FW_VERSION >= 311
        phase   0eh
        endif
        if      FW_VERSION < 311
        phase   2
        endif
; MPC2000 timing_calc_rate; 246 instr all versions; 16-bit masked, no
; nops; shift/add mult, idiv, clamp
timing_calc_rate:
        push    bp
        mov     bp, sp
        push    si
        push    di
        mov     si, word ptr [W_9451]
        mov     di, word ptr [W_9453]
        push    bp
        mov     bx, si
        mov     ax, di
        cwd
        mov     bp, dx
        mov     cx, 2
loop_b16f6:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b16f6
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 4
loop_b1707:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b1707
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 4
loop_b1718:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b1718
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 4
loop_b1729:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b1729
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 2
loop_b173a:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b173a
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 3
loop_b174b:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b174b
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        pop     bp
        mov     cx, 4
loop_b175d:
        sar     dx, 1
        rcr     ax, 1
        loop    loop_b175d
        mov     di, word ptr [bp + 6]
        mov     cx, 8
loop_b1769:
        sar     di, 1
        rcr     si, 1
        loop    loop_b1769
        add     si, ax
        adc     di, dx
        push    si
        push    di
        push    bp
        mov     bx, si
        mov     ax, di
        cwd
        mov     bp, dx
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 3
loop_b178c:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b178c
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 3
loop_b179d:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b179d
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 3
loop_b17ae:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b17ae
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 5
loop_b17bf:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b17bf
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 3
loop_b17d0:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b17d0
        pop     bp
        mov     cx, 4
loop_b17dc:
        sar     dx, 1
        rcr     ax, 1
        loop    loop_b17dc
        push    ax
        push    dx
        mov     si, word ptr [W_9451]
        mov     di, word ptr [W_9453]
        push    bp
        mov     bx, si
        mov     ax, di
        cwd
        mov     bp, dx
        mov     cx, 2
loop_b17f7:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b17f7
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 3
loop_b1808:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b1808
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 4
loop_b1819:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b1819
        add     bx, si
        adc     ax, di
        adc     dx, bp
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 3
loop_b1836:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b1836
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 2
loop_b1847:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_b1847
        add     bx, si
        adc     ax, di
        adc     dx, bp
        pop     bp
        mov     cx, 4
loop_b1859:
        sar     dx, 1
        rcr     ax, 1
        loop    loop_b1859
        pop     di
        pop     si
        add     ax, si
        adc     dx, di
        pop     di
        pop     si
        mov     word ptr [W_9451], si
        mov     word ptr [W_9453], di
        mov     si, ax
        mov     di, dx
        sar     di, 1
        rcr     si, 1
        sar     di, 1
        rcr     si, 1
        sar     di, 1
        rcr     si, 1
        add     ax, si
        adc     dx, di
        sar     di, 1
        rcr     si, 1
        add     ax, si
        adc     dx, di
        js      br_b18a3
        cmp     dh, 0
        jnz     br_b189c
        mov     ch, dl
        mov     cl, ah
        cmp     cx, word ptr [W_944D]
        jc      br_b18bd
br_b189c:
        mov     ax, word ptr [W_944D]
        dec     ax
        jmp     br_b18cc
        db      090h
br_b18a3:
        cmp     dh, 0ffh
        jnz     br_b18b4
        mov     ch, dl
        mov     cl, ah
        neg     cx
        cmp     cx, word ptr [W_944D]
        jc      br_b18bd
br_b18b4:
        mov     ax, word ptr [W_944D]
        dec     ax
        neg     ax
        jmp     br_b18cc
        db      090h
br_b18bd:
        mov     cx, 7
loop_b18c0:
        shl     ax, 1
        rcl     dx, 1
        loop    loop_b18c0
        mov     cx, word ptr [W_944D]
        idiv    cx
br_b18cc:
        cmp     ax, word ptr [W_944B]
        jle     br_b18d8
        mov     word ptr [W_944B], ax
        jmp     br_b18e1
        db      090h
br_b18d8:
        cmp     ax, word ptr [W_9449]
        jge     br_b18e1
        mov     word ptr [W_9449], ax
br_b18e1:
        pop     di
        pop     si
        pop     bp
        retf
fn_b18e5:
        push    bp
        mov     bp, sp
        sub     sp, 2
        cmp     word ptr [W_944B], 7fffh
        jnz     br_b18fb
        mov     word ptr [W_944D], 7fffh
        jmp     br_b1923
br_b18fb:
        cmp     word ptr [W_9449], 8001h
        jg      br_b190b
        mov     word ptr [W_944D], 7fffh
        jmp     br_b1923
br_b190b:
        mov     ax, word ptr [W_9449]
        neg     ax
        mov     word ptr [bp - 2], ax
        cmp     ax, word ptr [W_944B]
        jle     br_b191c
        mov     word ptr [W_944B], ax
br_b191c:
        mov     ax, word ptr [W_944B]
        inc     ax
        mov     word ptr [W_944D], ax
br_b1923:
        mov     word ptr [W_9453], 0
        mov     word ptr [W_9451], 0
        xor     ax, ax
        mov     word ptr [W_D5E1], ax
        mov     word ptr [W_D5DF], ax
        xor     ax, ax
        mov     word ptr [W_9449], ax
        mov     word ptr [W_944B], ax
        leave
        retf
        if      FW_VERSION >= 311
        phase   61h
        else
        phase   65h
        endif
far_b1941:
        push    bp
        mov     bp, sp
        mov     word ptr [W_944D], 7fffh
        mov     word ptr [W_9453], 0
        mov     word ptr [W_9451], 0
        xor     ax, ax
        mov     word ptr [W_D5E1], ax
        mov     word ptr [W_D5DF], ax
        xor     ax, ax
        mov     word ptr [W_9449], ax
        mov     word ptr [W_944B], ax
        pop     bp
        retf
        if      FW_VERSION >= 311
        phase   8
        else
        phase   0ch
        endif
far_b1968:
        push    bp
        mov     bp, sp
        cmp     word ptr [bp + 6], 0
        jz      br_b1979
        mov     al, byte ptr [B_826A]
        cbw
        mov     dx, ax
        jmp     br_b1985
br_b1979:
        mov     al, byte ptr [B_826A]
        cbw
        mov     bx, 4
        cwd
        idiv    bx
        mov     dx, ax
br_b1985:
        mov     al, byte ptr [B_8187]
        cbw
        push    ax
        push    dx
        push    word 80h
        callf   SEG_CB8A:far_cc50a
        add     sp, 6
        pop     bp
        retf
far_b1998:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    si
        push    di
        mov     word ptr [bp - 2], 80h
        mov     ax, SEG_A28F
        push    ax
        mov     ax, 80h
        mov     dx, 24h
        imul    dx
        add     ax, 4800h
        mov     si, STR_1D1E
        mov     di, ax
        pop     es
        mov     cx, 3
        rep movsw
        mov     ax, word ptr [bp - 2]
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     word ptr es:[bx + 4822h], 1
        mov     word ptr es:[bx + 4820h], 0
        mov     ax, word ptr [bp - 2]
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     word ptr es:[bx + 481eh], 0
        mov     word ptr es:[bx + 481ch], 7d0h
        push    word ptr [bp - 2]
        callf   SEG_CC84:far_cd003
        add     sp, 2
        mov     ax, word ptr [bp - 2]
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     byte ptr es:[bx + 4813h], 0
        mov     ax, word ptr [bp - 2]
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     byte ptr es:[bx + 4811h], 0c8h
        mov     ax, word ptr [bp - 2]
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        add     word ptr es:[bx + 4818h], 373h
        adc     word ptr es:[bx + 481ah], 0
        mov     ax, SEG_A28F
        mov     di, 0
        push    ax
        xor     ax, ax
        pop     es
        mov     ah, al
        mov     cx, 7d0h
        rep stosw
        mov     word ptr [bp - 4], SEG_A28F
        mov     word ptr [bp - 6], 0
        xor     ax, ax
loop_b1a67:
        les     bx, dword ptr [bp - 6]
        mov     word ptr es:[bx], 7fffh
        add     word ptr [bp - 6], 2
        inc     ax
        cmp     ax, 32h
        jl      loop_b1a67
        push    0
        push    0
        push    word 7d0h
        mov     ax, word ptr [bp - 2]
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        push    word ptr es:[bx + 4822h]
        push    word ptr es:[bx + 4820h]
        push    word SEG_A28F
        push    word 0
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        pop     di
        pop     si
        leave
        retf
        db      0ffh
        if      FW_VERSION >= 311
        phase   0ch
        else
        phase   0
        endif
far_b1aac:
        mov     ax, 1
        int     43h
        retf
far_b1ab2:
        push    bp
        mov     bp, sp
        mov     bx, word ptr [bp + 6]
        if      FW_VERSION >= 311
        mov     word ptr [1d24h], bx
        endif
        test    bx, 2
        jz      br_b1ac5
        xor     bx, 1
br_b1ac5:
        mov     ax, 2
        int     43h
        pop     bp
        if      FW_VERSION >= 311
        retf
far_b1acc:
        mov     ax, word ptr [1d24h]
        endif
        retf
far_b1ad0:
        push    bp
        mov     bp, sp
        mov     bh, byte ptr [bp + 6]
        mov     bl, byte ptr [bp + 8]
        mov     ax, 3
        int     43h
        pop     bp
        retf
far_b1ae0:
        push    bp
        mov     bp, sp
        mov     bl, byte ptr [bp + 6]
        mov     ax, 4
        int     43h
        mov     ax, 7
        int     43h
        mov     bx, ax
        mov     ax, 3
        int     43h
        pop     bp
        retf
far_b1af9:
        mov     ax, 5
        int     43h
        retf
far_b1aff:
        mov     ax, 6
        int     43h
        retf
far_b1b05:
        push    bp
        mov     bp, sp
        push    ds
        push    di
        lds     di, dword ptr [bp + 6]
br_b1b0d:
        mov     bl, byte ptr [di]
        or      bl, bl
        jz      br_b1b1b
        mov     ax, 4
        int     43h
        inc     di
        jmp     br_b1b0d
br_b1b1b:
        mov     ax, 7
        int     43h
        mov     bx, ax
        mov     ax, 3
        int     43h
        pop     di
        pop     ds
        pop     bp
        retf
far_b1b2b:
        push    bp
        mov     bp, sp
        push    ds
        mov     ax, 7
        int     43h
        lds     bx, dword ptr [bp + 6]
        mov     byte ptr [bx], ah
        lds     bx, dword ptr [bp + 0ah]
        mov     byte ptr [bx], al
        pop     ds
        pop     bp
        retf
far_b1b41:
        push    bp
        mov     bp, sp
        mov     cx, word ptr [bp + 8]
        mov     bl, byte ptr [bp + 6]
loop_b1b4a:
        mov     ax, 4
        int     43h
        loop    loop_b1b4a
        mov     ax, 7
        int     43h
        mov     bx, ax
        mov     ax, 3
        int     43h
        pop     bp
        retf
        if      FW_VERSION >= 311
        phase   0fh
        else
        phase   0bh
L_b89eb:
        push    bp
        mov     bp, sp
        mov     ah, byte ptr [bp + 6]
        mov     al, byte ptr [bp + 8]
        int     46h
        pop     bp
        retf
        phase   8
        endif
fn_b1b5f:
        push    bp
        mov     bp, sp
        push    si
        cmp     word ptr [W_E559], 0
        jz      br_b1b97
        cmp     word ptr [bp + 6], 0
        jz      br_b1b97
        mov     ax, word ptr [W_E555]
        cmp     ax, word ptr [W_E553]
        jge     br_b1b97
        mov     si, word ptr [W_E555]
        cmp     ax, word ptr [W_E553]
        jge     br_b1b97
loop_b1b83:
        mov     al, byte ptr [B_E550]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        inc     si
        cmp     si, word ptr [W_E553]
        jl      loop_b1b83
br_b1b97:
        pop     si
        pop     bp
        retf
fn_b1b9a:
        push    bp
        mov     bp, sp
        push    di
        les     di, dword ptr [bp + 6]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        dec     cx
        mov     word ptr [W_E555], cx
        mov     al, byte ptr [B_E558]
        cbw
        neg     ax
        sbb     ax, ax
        inc     ax
        push    ax
        push    cs
        call    fn_b1b5f
        add     sp, 2
        jmp     br_b1bd5
loop_b1bc2:
        les     bx, dword ptr [bp + 6]
        inc     word ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
br_b1bd5:
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx], 0
        jz      br_b1be9
        mov     ax, word ptr [W_E551]
        dec     word ptr [W_E551]
        or      ax, ax
        jnz     loop_b1bc2
br_b1be9:
        les     di, dword ptr [bp + 6]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        dec     cx
        mov     word ptr [W_E555], cx
        mov     al, byte ptr [B_E558]
        cbw
        push    ax
        push    cs
        call    fn_b1b5f
        add     sp, 2
        pop     di
        pop     bp
        retf
fn_b1c09:
        push    bp
        mov     bp, sp
        sub     sp, 24h
        push    si
        push    di
        mov     si, word ptr [bp + 0ah]
        xor     di, di
        cmp     word ptr [bp + 8], 0
        jg      br_b1c41
        jl      br_b1c24
        cmp     word ptr [bp + 6], 0
        jnc     br_b1c41
br_b1c24:
        cmp     byte ptr [B_E557], 0
        jnz     br_b1c41
        mov     di, 1
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        neg     ax
        neg     dx
        sbb     ax, 0
        mov     word ptr [bp + 8], ax
        mov     word ptr [bp + 6], dx
br_b1c41:
        lea     ax, [bp - 24h]
        mov     word ptr [bp - 2], ss
        mov     word ptr [bp - 4], ax
loop_b1c4a:
        push    0
        push    si
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   0f800h:far_fa115
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_1D26]
        les     bx, dword ptr [bp - 4]
        mov     byte ptr es:[bx], al
        inc     word ptr [bp - 4]
        push    0
        push    si
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   0f800h:far_fa105
        mov     word ptr [bp + 8], dx
        mov     word ptr [bp + 6], ax
        or      dx, dx
        ja      loop_b1c4a
        jnz     br_b1c85
        or      ax, ax
        ja      loop_b1c4a
br_b1c85:
        or      di, di
        jz      br_b1c93
        les     bx, dword ptr [bp - 4]
        mov     byte ptr es:[bx], 2dh
        inc     word ptr [bp - 4]
br_b1c93:
        les     bx, dword ptr [bp - 4]
        mov     byte ptr es:[bx], 0
        dec     word ptr [bp - 4]
        push    ss
        pop     es
        lea     di, [bp - 24h]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        dec     cx
        mov     word ptr [W_E555], cx
        mov     al, byte ptr [B_E558]
        cbw
        neg     ax
        sbb     ax, ax
        inc     ax
        push    ax
        push    cs
        call    fn_b1b5f
        add     sp, 2
        jmp     br_b1cd6
loop_b1cc3:
        les     bx, dword ptr [bp - 4]
        dec     word ptr [bp - 4]
        mov     al, byte ptr es:[bx]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
br_b1cd6:
        lea     ax, [bp - 24h]
        cmp     ax, word ptr [bp - 4]
        jbe     loop_b1cc3
        mov     al, byte ptr [B_E558]
        cbw
        push    ax
        push    cs
        call    fn_b1b5f
        add     sp, 2
        pop     di
        pop     si
        leave
        retf
fn_b1cee:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        xor     cx, cx
        les     bx, dword ptr [bp + 6]
        mov     ax, word ptr es:[bx + 2]
        mov     dx, word ptr es:[bx]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        jmp     br_b1d1e
loop_b1d09:
        mov     ax, si
        push    ax
        mov     ax, cx
        mov     dx, 0ah
        imul    dx
        pop     dx
        add     dx, ax
        add     dx, 0ffd0h
        mov     cx, dx
        inc     word ptr [bp - 4]
br_b1d1e:
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx]
        cbw
        mov     si, ax
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_79A5]
        cbw
        test    ax, 2
        jnz     loop_b1d09
        les     bx, dword ptr [bp + 6]
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        mov     word ptr es:[bx + 2], ax
        mov     word ptr es:[bx], dx
        mov     ax, cx
        pop     si
        leave
        retf
far_b1d48:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    si
        push    di
        lea     ax, [bp + 0ah]
        mov     word ptr [bp - 6], ss
        mov     word ptr [bp - 8], ax
        jmp     br_b1f6c
br_b1d5c:
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx], 25h
        jz      br_b1d75
        mov     al, byte ptr es:[bx]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        jmp     tgt_b1f69
br_b1d75:
        xor     ax, ax
        mov     word ptr [W_E559], ax
        mov     byte ptr [B_E557], al
        mov     byte ptr [B_E558], al
        cbw
        mov     si, ax
        mov     di, ax
        mov     byte ptr [B_E550], 20h
        mov     word ptr [W_E551], 7fffh
br_b1d90:
        inc     word ptr [bp + 6]
        les     bx, dword ptr [bp + 6]
        mov     dl, byte ptr es:[bx]
        mov     al, dl
        cbw
        mov     cx, ax
        mov     bx, ax
        test    byte ptr [bx + TBL_79A5], 2
        jz      br_b1de0
        or      di, di
        jz      br_b1dbc
        push    ss
        lea     ax, [bp + 6]
        push    ax
        push    cs
        call    fn_b1cee
        add     sp, 4
        mov     word ptr [W_E551], ax
        jmp     br_b1ddb
br_b1dbc:
        cmp     dl, 30h
        jnz     br_b1dc6
        mov     byte ptr [B_E550], 30h
br_b1dc6:
        push    ss
        lea     ax, [bp + 6]
        push    ax
        push    cs
        call    fn_b1cee
        add     sp, 4
        mov     word ptr [W_E553], ax
        mov     word ptr [W_E559], 1
br_b1ddb:
        dec     word ptr [bp + 6]
        jmp     br_b1d90
br_b1de0:
        push    cx
        callf   0f800h:far_fa248
        add     sp, 2
        cmp     ax, 64h
        jz      br_b1e51
        jg      br_b1e17
        cmp     ax, 2eh
        jz      br_b1e40
        jg      br_b1e04
        cmp     ax, 25h
        jz      br_b1e2b
        cmp     ax, 2dh
        jz      br_b1e38
        jmp     tgt_b1f69
br_b1e04:
        cmp     ax, 5ch
        jnz     br_b1e0c
        jmp     br_b1efd
br_b1e0c:
        cmp     ax, 63h
        jnz     br_b1e14
        jmp     br_b1ee5
br_b1e14:
        jmp     tgt_b1f69
br_b1e17:
        sub     ax, 6ch
        mov     bx, ax
        cmp     bx, 0ch
        jbe     br_b1e24
        jmp     tgt_b1f69
br_b1e24:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_b1f7c]
br_b1e2b:
        push    25h
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        jmp     tgt_b1f69
br_b1e38:
        mov     byte ptr [B_E558], 1
        jmp     near br_b1d90
br_b1e40:
        mov     di, 1
        jmp     near br_b1d90
tgt_b1e46:
        mov     si, 1
        jmp     near br_b1d90
tgt_b1e4c:
        mov     byte ptr [B_E557], 1
br_b1e51:
        or      si, si
        jz      br_b1e73
        push    0ah
        mov     es, word ptr [bp - 6]
        add     word ptr [bp - 8], 4
        mov     bx, word ptr [bp - 8]
        push    word ptr es:[bx - 2]
        push    word ptr es:[bx - 4]
        push    cs
        call    fn_b1c09
        add     sp, 6
        jmp     tgt_b1f69
br_b1e73:
        add     word ptr [bp - 8], 2
        les     bx, dword ptr [bp - 8]
        mov     ax, word ptr es:[bx - 2]
        cwd
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        cmp     byte ptr [B_E557], 0
        jz      br_b1e94
        and     word ptr [bp - 4], 0ffffh
        and     word ptr [bp - 2], 0
br_b1e94:
        push    0ah
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    cs
        call    fn_b1c09
        add     sp, 6
        jmp     near tgt_b1f69
tgt_b1ea6:
        push    10h
        mov     es, word ptr [bp - 6]
        add     word ptr [bp - 8], 2
        mov     bx, word ptr [bp - 8]
        mov     ax, word ptr es:[bx - 2]
        cwd
        and     ax, 0ffffh
        and     dx, 0
        push    dx
        push    ax
        push    cs
        call    fn_b1c09
        add     sp, 6
        jmp     near tgt_b1f69
tgt_b1ec9:
        mov     es, word ptr [bp - 6]
        add     word ptr [bp - 8], 4
        mov     bx, word ptr [bp - 8]
        push    word ptr es:[bx - 2]
        push    word ptr es:[bx - 4]
        push    cs
        call    fn_b1b9a
        add     sp, 4
        jmp     near tgt_b1f69
br_b1ee5:
        mov     es, word ptr [bp - 6]
        add     word ptr [bp - 8], 2
        mov     bx, word ptr [bp - 8]
        push    word ptr es:[bx - 2]
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        jmp     tgt_b1f69
br_b1efd:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        cbw
        mov     dx, ax
        cmp     ax, 6eh
        jz      br_b1f44
        jg      br_b1f19
        cmp     ax, 61h
        jz      br_b1f20
        cmp     ax, 68h
        jz      br_b1f2c
        jmp     br_b1f5a
br_b1f19:
        cmp     ax, 72h
        jz      br_b1f38
        jmp     br_b1f5a
br_b1f20:
        push    7
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        jmp     br_b1f63
br_b1f2c:
        push    8
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        jmp     br_b1f63
br_b1f38:
        push    0dh
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        jmp     br_b1f63
br_b1f44:
        push    0dh
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        push    0ah
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        jmp     br_b1f63
br_b1f5a:
        push    dx
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
br_b1f63:
        inc     word ptr [bp + 6]
        jmp     br_b1d90
tgt_b1f69:
        inc     word ptr [bp + 6]
br_b1f6c:
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx], 0
        jz      br_b1f78
        jmp     br_b1d5c
br_b1f78:
        pop     di
        pop     si
        leave
        retf
TBL_b1f7c:
        dw      tgt_b1e46
        dw      tgt_b1f69
        dw      tgt_b1f69
        dw      tgt_b1f69
        dw      tgt_b1f69
        dw      tgt_b1f69
        dw      tgt_b1f69
        dw      tgt_b1ec9
        dw      tgt_b1f69
        dw      tgt_b1e4c
        dw      tgt_b1f69
        dw      tgt_b1f69
        dw      tgt_b1ea6
        if      FW_VERSION >= 311
        phase   6
        else
        phase   0fh
        endif
far_b1f96:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ss
        lea     ax, [bp - 1]
        push    ax
        callf   SEG_B1AA:far_b1b2b
        add     sp, 8
        jmp     br_b1fba
loop_b1fb0:
        push    20h
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
br_b1fba:
        mov     al, byte ptr [bp - 2]
        inc     byte ptr [bp - 2]
        cbw
        cmp     ax, word ptr [bp + 6]
        jl      loop_b1fb0
        leave
        retf
        if      FW_VERSION >= 311
        phase   8
        else
        db      0ffh
        phase   2
        endif
far_b1fc8:
        push    bp
        mov     bp, sp
        push    ds
        push    di
        les     di, dword ptr [bp + 6]
        lds     bx, dword ptr [bp + 0ah]
        mov     ax, word ptr [bx]
        add     word ptr es:[di], ax
        mov     ax, word ptr [bx + 2]
        adc     word ptr es:[di + 2], ax
        mov     ax, word ptr [bx + 4]
        adc     word ptr es:[di + 4], ax
        mov     ax, word ptr [bx + 6]
        adc     word ptr es:[di + 6], ax
        pop     di
        pop     ds
        pop     bp
        retf
        db      0ffh
        if      FW_VERSION >= 311
        phase   2
        else
        phase   0ch
        endif
far_b1ff2:
        push    bp
        mov     bp, sp
        add     sp, 0ffe8h
        push    ds
        push    di
        push    si
        lds     bx, dword ptr [bp + 6]
        mov     ax, word ptr [bx]
        mov     word ptr [bp - 2], ax
        mov     ax, word ptr [bx + 2]
        mov     word ptr [bp - 4], ax
        mov     ax, word ptr [bx + 4]
        mov     word ptr [bp - 6], ax
        mov     ax, word ptr [bx + 6]
        mov     word ptr [bp - 8], ax
        lds     bx, dword ptr [bp + 0ah]
        mov     ax, word ptr [bx]
        mov     word ptr [bp - 0ah], ax
        mov     dx, word ptr [bx + 2]
        mov     word ptr [bp - 0ch], dx
        mov     word ptr [bp - 18h], si
        xor     cx, cx
br_b2028:
        or      dx, dx
        js      br_b2033
        inc     cx
        rcl     ax, 1
        rcl     dx, 1
        jmp     br_b2028
br_b2033:
        mov     word ptr [bp - 16h], cx
        mov     word ptr [bp - 14h], dx
        mov     word ptr [bp - 12h], ax
br_b203c:
        jcxz    br_b204d
        shl     word ptr [bp - 2], 1
        rcl     word ptr [bp - 4], 1
        rcl     word ptr [bp - 6], 1
        rcl     word ptr [bp - 8], 1
        dec     cx
        jmp     br_b203c
br_b204d:
        xor     di, di
        mov     word ptr [bp - 0ah], di
loop_b2052:
        mov     dx, word ptr [bp+di - 0ah]
        mov     ax, word ptr [bp+di - 8]
        mov     bx, word ptr [bp - 14h]
        cmp     dx, bx
        jz      br_b2068
        div     bx
        mov     cx, ax
        mov     bx, dx
        jmp     br_b207e
        db      090h
br_b2068:
        mov     dx, 0ffffh
        jmp     br_b2073
        db      090h
loop_b206e:
        mov     dx, cx
        dec     dx
        mov     ax, bx
br_b2073:
        mov     cx, dx
        add     ax, word ptr [bp - 14h]
        jc      br_b208c
        mov     bx, ax
        mov     ax, cx
br_b207e:
        mul     word ptr [bp - 12h]
        cmp     dx, bx
        jc      br_b208c
        ja      loop_b206e
        cmp     ax, word ptr [bp+di - 6]
        ja      loop_b206e
br_b208c:
        mov     ax, word ptr [bp - 12h]
        mul     cx
        mov     bx, ax
        mov     si, dx
        mov     ax, word ptr [bp - 14h]
        mul     cx
        add     ax, si
        adc     dx, 0
        sub     word ptr [bp+di - 6], bx
        sbb     word ptr [bp+di - 8], ax
        sbb     word ptr [bp+di - 0ah], dx
        jnc     br_b20bb
        mov     ax, word ptr [bp - 12h]
        mov     dx, word ptr [bp - 14h]
        add     word ptr [bp+di - 6], ax
        adc     word ptr [bp+di - 8], dx
        adc     word ptr [bp+di - 0ah], 0
        dec     cx
br_b20bb:
        mov     word ptr [bp+di - 10h], cx
        inc     di
        inc     di
        cmp     di, 4
        jle     loop_b2052
        mov     cx, word ptr [bp - 16h]
br_b20c8:
        jcxz    br_b20d9
        shr     word ptr [bp - 8], 1
        rcr     word ptr [bp - 6], 1
        rcr     word ptr [bp - 4], 1
        rcr     word ptr [bp - 2], 1
        dec     cx
        jmp     br_b20c8
br_b20d9:
        mov     si, word ptr [bp - 18h]
        lds     bx, dword ptr [bp + 0eh]
        mov     ax, word ptr [bp - 2]
        mov     word ptr [bx + 4], ax
        mov     ax, word ptr [bp - 4]
        mov     word ptr [bx + 6], ax
        mov     ax, word ptr [bp - 0ch]
        mov     word ptr [bx], ax
        mov     dx, word ptr [bp - 0eh]
        mov     word ptr [bx + 2], dx
        pop     si
        pop     di
        pop     ds
        mov     sp, bp
        pop     bp
        retf
        if      FW_VERSION >= 311
        phase   0dh
        else
        phase   7
        endif
far_b20fd:
        nop
        push    cs
        call    far_b2121
        nop
        push    cs
        call    far_b2134
        nop
        push    cs
        call    far_b2190
        nop
        push    cs
        call    far_b21f5
        push    word 6c2h
        push    ds
        push    word A_7D87
        callf   SEG_DA72:far_da76f
        add     sp, 6
        retf
far_b2121:
        push    si
        xor     si, si
loop_b2124:
        mov     al, byte ptr [si + 87eh]
        mov     byte ptr [si + TBL_818A], al
        inc     si
        cmp     si, 40h
        jl      loop_b2124
        pop     si
        retf
far_b2134:
        push    di
        push    ds
        pop     es
        mov     di, TBL_7FEB
        mov     ax, 1
        mov     ah, al
        mov     cx, 45h
        rep stosw
        mov     byte ptr [B_806F], 0
        mov     byte ptr [B_7FEE], 0
        mov     byte ptr [B_8077], 2
        mov     byte ptr [B_8078], 5
        mov     byte ptr [B_807B], 5
        mov     byte ptr [B_807C], 5
        mov     byte ptr [B_807D], 5
        push    ds
        pop     es
        if      FW_VERSION >= 312
        mov     di, 807eh
        elseif  FW_VERSION = 311
        mov     di, 7fc6h
        else
        mov     di, 7454h
        endif
        mov     ax, 5
        mov     ah, al
        mov     cx, 10h
        rep stosw
        push    ds
        pop     es
        mov     di, A_80FF
        xor     ax, ax
        mov     ah, al
        mov     cx, 40h
        rep stosw
        mov     byte ptr [B_817F], 0
        mov     byte ptr [B_8180], 40h
        pop     di
        retf
far_b2190:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        push    di
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 0
loop_b21a2:
        push    ds
        pop     es
        mov     di, word ptr [bp - 4]
        add     di, A_7D87
        if      FW_VERSION >= 311
        mov     si, 1d6ah
        else
        mov     si, 1cfeh
        endif
        mov     cx, 3
        rep movsw
        push    30h
        push    2
        mov     ax, word ptr [bp - 4]
        if      FW_VERSION >= 312
        add     ax, 7d8ch
        elseif  FW_VERSION = 311
        add     ax, 7cd4h
        else
        add     ax, 7162h
        endif
        push    ds
        push    ax
        mov     ax, word ptr [bp - 2]
        and     ax, 0fh
        inc     ax
        push    ax
        callf   SEG_D780:far_d7805
        add     sp, 0ah
        mov     ax, word ptr [bp - 2]
        sar     ax, 4
        add     al, 41h
        mov     bx, word ptr [bp - 4]
        mov     byte ptr [bx + TBL_7D8E], al
        mov     byte ptr [bx + TBL_7D8F], 0
        add     word ptr [bp - 4], 9
        inc     word ptr [bp - 2]
        cmp     word ptr [bp - 4], 240h
        jnz     loop_b21a2
        pop     di
        pop     si
        leave
        retf
far_b21f5:
        push    si
        push    di
        mov     word ptr [W_7FC8], 4b0h
        mov     byte ptr [B_7FCA], 0
        mov     byte ptr [B_7FCB], 2
        mov     byte ptr [B_7FCC], 1
        mov     byte ptr [B_7FCD], 4
        mov     word ptr [TBL_7FD7], 1
        mov     word ptr [TBL_7FD5], 100h
        mov     word ptr [W_7FDB], 1
        mov     word ptr [W_7FD9], 100h
        mov     word ptr [W_7FDF], 1
        mov     word ptr [W_7FDD], 100h
        mov     byte ptr [B_7FE1], 0
        mov     byte ptr [B_7FE2], 32h
        mov     byte ptr [B_7FE3], 3
        mov     byte ptr [B_7FCE], 0
        mov     byte ptr [B_7FCF], 2
        mov     byte ptr [B_7FD0], 0
        if      FW_VERSION >= 311
        mov     byte ptr [B_8436], 0
        endif
        mov     byte ptr [B_7FD1], 0
        mov     byte ptr [B_7FD2], 0
        mov     byte ptr [B_7FE4], 1
        mov     byte ptr [B_7FE5], 0
        mov     byte ptr [B_7FE6], 0
        mov     byte ptr [B_7FE9], 0
        mov     byte ptr [B_7FEA], 0
        mov     byte ptr [B_8183], 1
        mov     byte ptr [B_8184], 1
        mov     byte ptr [B_8185], 1
        mov     byte ptr [B_8181], 1
        mov     byte ptr [B_8182], 1
        mov     byte ptr [B_8188], 0
        if      FW_VERSION >= 311
        mov     byte ptr [B_8437], 0
        mov     byte ptr [B_8438], 1
        mov     byte ptr [B_8189], 0
        else
        mov     byte ptr [B_8189], 0
        xor     di, di
        xor     si, si
L_b9137:
        mov     byte ptr [si +TBL_75A0_V308], 0
        mov     ax, di
        mov     bx, 8
        cwd
        idiv    bx
        mov     byte ptr [si +TBL_75A1_V308], dl
        mov     byte ptr [si +TBL_75A2_V308], 0fh
        mov     byte ptr [si +TBL_75A3_V308], 2ah
        mov     byte ptr [si +TBL_75A4_V308], 32h
        mov     byte ptr [si +TBL_75A5_V308], 0
        mov     byte ptr [si +TBL_75A6_V308], 3
        mov     byte ptr [si +TBL_75A7_V308], 10h
        mov     byte ptr [si +TBL_75A8_V308], 14h
        mov     byte ptr [si +TBL_75A9_V308], 1
        add     si, 0ah
        inc     di
        cmp     si, 0a0h
        jnz     L_b9137
        endif
        mov     byte ptr [B_7FC7], 0
        mov     byte ptr [B_826A], 64h
        mov     byte ptr [B_826B], 0
        mov     byte ptr [B_826C], 0
        mov     byte ptr [B_826D], 1
        mov     byte ptr [B_826E], 6
        mov     byte ptr [B_826F], 0
        mov     byte ptr [B_8270], 0
        mov     word ptr [W_8273], 0
        mov     word ptr [W_8271], 0
        mov     word ptr [W_8277], 0
        mov     word ptr [W_8275], 0
        mov     word ptr [W_827B], 0
        mov     word ptr [W_8279], 0
        mov     word ptr [W_827F], 0
        mov     word ptr [W_827D], 0
        mov     byte ptr [B_83B6], 0
        mov     byte ptr [B_83B7], 0
        mov     byte ptr [B_83B8], 32h
        mov     byte ptr [B_83B9], 0
        mov     byte ptr [B_83BA], 0
        mov     byte ptr [B_83BB], 1
        mov     byte ptr [B_83BC], 1
        mov     byte ptr [B_83BD], 1
        mov     word ptr [W_83BE], 0ah
        mov     word ptr [W_83C0], 0
        mov     byte ptr [B_83C2], 2
        mov     byte ptr [B_83C3], 1
        mov     byte ptr [B_83C4], 1
        mov     byte ptr [B_83C5], 1
        mov     byte ptr [B_83C6], 0
        mov     byte ptr [B_83C7], 0
        mov     byte ptr [B_83C8], 0
        mov     byte ptr [B_83C9], 14h
        if      FW_VERSION >= 311
        mov     byte ptr [B_8439], 1
        mov     byte ptr [B_843A], 0
        mov     byte ptr [B_843B], 0
        endif
        mov     word ptr [W_8281], 2
        mov     word ptr [W_8283], 1
        mov     word ptr [W_8285], 4b0h
        push    ds
        pop     es
        mov     di, TBL_82EE
        mov     ax, 0c0h
        mov     ah, al
        mov     cx, 32h
        rep stosw
        push    ds
        pop     es
        mov     di, TBL_8352
        mov     ah, al
        mov     cx, 32h
        rep stosw
        push    ds
        pop     es
        mov     di, TBL_828A
        xor     ax, ax
        mov     ah, al
        mov     cx, 32h
        rep stosw
        mov     byte ptr [B_8287], 4
        mov     byte ptr [B_8288], 0
        mov     byte ptr [B_8289], 1
        mov     byte ptr [B_83CA], 0
        mov     byte ptr [B_83CB], 0
        mov     byte ptr [B_83CC], 0
        mov     word ptr [W_83CD], 0
        push    ds
        pop     es
        mov     di, TBL_83F3
        mov     ah, al
        mov     cx, 20h
        rep stosw
        stosb
        mov     byte ptr [B_83CF], 1
        mov     byte ptr [B_83D0], 0
        mov     byte ptr [B_8434], 1eh
        mov     byte ptr [B_7FD3], 0
        mov     byte ptr [B_7FD4], 1
        mov     byte ptr [B_7FE7], 0
        mov     byte ptr [B_7FE8], 0
        mov     byte ptr [B_8186], 0
        mov     byte ptr [B_8181], 1
        mov     byte ptr [B_8182], 1
        mov     byte ptr [B_8270], 0
        if      FW_VERSION >= 311
        xor     si, si
loop_b2410:
        mov     al, byte ptr [si + 1d48h]
        mov     byte ptr [si + TBL_83D1], al
        inc     si
        cmp     si, 22h
        jl      loop_b2410
        mov     byte ptr [B_8435], 0
        else
        xor     di, di
L_b92d3:
        mov     al, byte ptr [di + 1cdch]
        mov     byte ptr [di +TBL_83D1], al
        inc     di
        cmp     di, 22h
        jl      L_b92d3
        endif
        push    ds
        pop     es
        if      FW_VERSION >= 312
        mov     di, 843ch
        elseif  FW_VERSION = 311
        mov     di, 8384h
        else
        mov     di, 780bh
        endif
        xor     ax, ax
        mov     ah, al
        if      FW_VERSION >= 311
        mov     cx, 6
        else
        mov     cx, 0ah
        endif
        rep stosw
        if      FW_VERSION >= 311
        stosb
        endif
        pop     di
        pop     si
        retf
        if      FW_VERSION >= 311
        db      0ffh
        phase   6
        else
        phase   2
        endif
far_b2436:
        push    bp
        mov     bp, sp
        push    es
        push    ds
        push    di
        push    si
        lds     bx, dword ptr [bp + 6]
        mov     ax, word ptr [bx]
        mov     dx, word ptr [bx + 2]
        lds     di, dword ptr [bp + 0eh]
        mov     word ptr [di], ax
        mov     word ptr [di + 2], dx
        les     bx, dword ptr [bp + 0ah]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx + 2]
        mov     word ptr [di + 4], ax
        mov     word ptr [di + 6], dx
        mov     si, di
        xor     cx, cx
        mov     ax, word ptr [si]
        mov     di, word ptr [si + 4]
        mul     di
        xchg    word ptr [si], ax
        mov     bx, dx
        mul     word ptr [si + 6]
        add     bx, ax
        adc     cx, dx
        mov     ax, word ptr [si + 2]
        mul     di
        add     ax, bx
        adc     cx, dx
        mov     bx, 0
        adc     bx, bx
        xchg    word ptr [si + 2], ax
        mul     word ptr [si + 6]
        add     ax, cx
        adc     dx, bx
        mov     word ptr [si + 4], ax
        mov     word ptr [si + 6], dx
        pop     si
        pop     di
        pop     ds
        pop     es
        pop     bp
        retf
        db      0ffh
fn_b2498:
        push    bp
        mov     bp, sp
        push    ds
        push    di
        lds     di, dword ptr [bp + 6]
        lds     bx, dword ptr [bp + 0ah]
        mov     ax, word ptr [bx]
        sub     word ptr [di], ax
        mov     ax, word ptr [bx + 2]
        sbb     word ptr [di + 2], ax
        mov     ax, word ptr [bx + 4]
        sbb     word ptr [di + 4], ax
        mov     ax, word ptr [bx + 6]
        sbb     word ptr [di + 6], ax
        pop     di
        pop     ds
        pop     bp
        retf
        db      0ffh
fn_b24be:
        mov     ax, 8010h
        mov     ds, ax
        mov     dx, 1
        callf   SEG_FB80:far_fb88f
        mov     dx, word ptr [W_E221]
        mov     cx, 0ffffh
        mov     bx, 0fffeh
loop_b24d5:
        add     bx, 2
        mov     ax, word ptr [bx + TBL_E223]
        test    ax, ax
        jz      loop_b24d5
        cmp     ax, 0ffffh
        jz      br_b2510
        sub     ax, dx
        jg      br_b2504
        mov     word ptr [bx + TBL_E223], 0
        push    ax
        push    bx
        push    cx
        push    dx
        push    si
        push    di
        push    es
        callf   SEG_CDD5:far_cdd52
        pop     es
        pop     di
        pop     si
        pop     dx
        pop     cx
        pop     bx
        pop     ax
        jmp     loop_b24d5
br_b2504:
        mov     word ptr [bx + TBL_E223], ax
        cmp     ax, cx
        jnc     loop_b24d5
        mov     cx, ax
        jmp     loop_b24d5
br_b2510:
        cmp     cx, 0ffffh
        jnz     br_b2517
        sub     cx, cx
br_b2517:
        mov     word ptr [W_E21F], cx
        mov     word ptr [W_E221], cx
        mov     dx, 1
        callf   SEG_FB80:far_fb8cd
        retf
fn_b2528:
        push    bp
        mov     bp, sp
        mov     dx, word ptr [bp + 6]
        callf   SEG_FB80:far_fb88f
        pop     bp
        retf
        if      FW_VERSION < 311
        phase   1
        endif
fn_b2535:
        push    bp
        mov     bp, sp
        mov     dx, word ptr [bp + 6]
        callf   SEG_FB80:far_fb8cd
        pop     bp
        retf
        if      FW_VERSION >= 311
        phase   2
        endif
far_b2542:
        push    bp
        mov     bp, sp
        push    si
        push    di
        xor     di, di
        mov     al, byte ptr [bp + 6]
        cbw
        mov     dx, ax
        mov     bx, ax
        test    byte ptr [bx + TBL_79A5], 2
        jz      br_b2572
        mov     al, byte ptr [B_7B88]
        cbw
        or      ax, ax
        jnz     br_b256c
        mov     al, byte ptr [bp + 6]
        push    ax
        callf   SEG_B05A:far_b1015
        add     sp, 2
br_b256c:
        xor     ax, ax
        pop     di
        pop     si
        pop     bp
        retf
br_b2572:
        cmp     byte ptr [bp + 6], 2eh
        jnz     br_b2590
        mov     al, byte ptr [B_7B88]
        cbw
        or      ax, ax
        jnz     br_b258a
        push    2dh
        callf   SEG_B05A:far_b1015
        add     sp, 2
br_b258a:
        xor     ax, ax
        pop     di
        pop     si
        pop     bp
        retf
br_b2590:
        cmp     byte ptr [B_7B88], 0
        jz      br_b25e2
        mov     ax, dx
        cmp     ax, 3ch
        jz      br_b25b7
        jg      br_b25ac
        cmp     ax, 2bh
        jz      br_b25bd
        cmp     ax, 2dh
        jz      br_b25bd
        jmp     br_b25dd
br_b25ac:
        cmp     ax, 3eh
        jnz     br_b25dd
        mov     di, 800h
        jmp     br_b2733
br_b25b7:
        mov     di, 400h
        jmp     br_b2733
br_b25bd:
        push    word ptr [W_7B57]
        push    word ptr [FP_7B55]
        callf   SEG_B05A:far_b0e80
        add     sp, 4
        mov     al, byte ptr [B_7B87]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_7B5E]
        mov     byte ptr [B_1D71], al
        jmp     br_b2733
br_b25dd:
        mov     di, dx
        jmp     br_b2733
br_b25e2:
        mov     ax, dx
        cmp     ax, 4dh
        jz      br_b265c
        jg      br_b2612
        cmp     ax, 2dh
        jz      br_b264f
        jg      br_b2602
        cmp     ax, 0dh
        jnz     br_b25fa
        jmp     br_b26dc
br_b25fa:
        cmp     ax, 2bh
        jz      br_b2642
        jmp     br_b26f3
br_b2602:
        cmp     ax, 3ch
        jnz     br_b260a
        jmp     near br_b26ac
br_b260a:
        cmp     ax, 3eh
        jz      br_b2675
        jmp     br_b26f3
br_b2612:
        cmp     ax, 78h
        jnz     br_b261a
        jmp     near br_b26d0
br_b261a:
        jg      br_b262f
        cmp     ax, 5ah
        jnz     br_b2624
        jmp     near br_b26e5
br_b2624:
        cmp     ax, 75h
        jnz     br_b262c
        jmp     near br_b26d0
br_b262c:
        jmp     near br_b26f3
br_b262f:
        cmp     ax, 79h
        jnz     br_b2637
        jmp     near br_b26d0
br_b2637:
        cmp     ax, 7ah
        jnz     br_b263f
        jmp     near br_b26d0
br_b263f:
        jmp     near br_b26f3
br_b2642:
        push    1
        nop
        push    cs
        call    fn_b27ab
        add     sp, 2
        jmp     br_b2733
br_b264f:
        push    0ffffh
        nop
        push    cs
        call    fn_b27ab
        add     sp, 2
        jmp     br_b2733
br_b265c:
        push    word ptr [W_7B57]
        push    word ptr [FP_7B55]
        nop
        push    cs
        call    far_b2739
        add     sp, 4
        mov     al, byte ptr [bp + 6]
        cbw
        mov     di, ax
        jmp     near br_b2733
br_b2675:
        mov     al, byte ptr [B_7B87]
        cbw
        push    ax
        mov     al, byte ptr [B_7B8B]
        cbw
        dec     ax
        pop     dx
        cmp     dx, ax
        jge     br_b269c
        mov     al, byte ptr [B_7B87]
        inc     byte ptr [B_7B87]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_7B5E]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
br_b269c:
        mov     al, byte ptr [B_7B87]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_7B5E]
        mov     byte ptr [B_1D71], al
        jmp     near br_b2733
br_b26ac:
        cmp     byte ptr [B_7B87], 0
        jz      br_b26c1
        push    8
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        dec     byte ptr [B_7B87]
br_b26c1:
        mov     al, byte ptr [B_7B87]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_7B5E]
        mov     byte ptr [B_1D71], al
        jmp     br_b2733
br_b26d0:
        mov     al, byte ptr [bp + 6]
        push    ax
        callf   SEG_D79E:far_d7a63
        add     sp, 2
br_b26dc:
        callf   SEG_B05A:far_b0caf
        mov     di, ax
        jmp     br_b2733
br_b26e5:
        mov     al, byte ptr [B_E55C]
        cbw
        neg     ax
        sbb     ax, ax
        inc     ax
        mov     byte ptr [B_E55C], al
        jmp     br_b2733
br_b26f3:
        xor     si, si
        jmp     br_b2701
loop_b26f7:
        mov     al, byte ptr [si + TBL_0F85]
        cmp     al, byte ptr [bp + 6]
        jz      br_b2708
        inc     si
br_b2701:
        cmp     byte ptr [si + TBL_0F85], 0
        jnz     loop_b26f7
br_b2708:
        mov     al, byte ptr [si + TBL_0FA3]
        mov     byte ptr [bp + 6], al
        or      al, al
        jz      br_b2733
        cmp     byte ptr [B_E55C], 0
        jz      br_b2727
        cbw
        push    ax
        callf   0f800h:far_fa248
        add     sp, 2
        mov     byte ptr [bp + 6], al
br_b2727:
        mov     al, byte ptr [bp + 6]
        push    ax
        callf   SEG_B05A:far_b1015
        add     sp, 2
br_b2733:
        mov     ax, di
        pop     di
        pop     si
        pop     bp
        retf
far_b2739:
        push    bp
        mov     bp, sp
        sub     sp, 2
        mov     al, byte ptr [B_7B89]
        cbw
        push    ax
        mov     al, byte ptr [B_7B8A]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     byte ptr [bp - 1], 0
        mov     al, byte ptr [bp - 1]
        cmp     al, byte ptr [B_7B8B]
        jge     br_b2792
loop_b275e:
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx], 0
        jz      br_b277c
        mov     bx, word ptr [bp + 6]
        inc     word ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        jmp     br_b2786
br_b277c:
        push    20h
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
br_b2786:
        inc     byte ptr [bp - 1]
        mov     al, byte ptr [bp - 1]
        cmp     al, byte ptr [B_7B8B]
        jl      loop_b275e
br_b2792:
        mov     al, byte ptr [B_7B89]
        cbw
        push    ax
        mov     al, byte ptr [B_7B8A]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     byte ptr [B_7B88], 1
        leave
        retf
fn_b27ab:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    di
        push    word ptr [W_7B57]
        push    word ptr [FP_7B55]
        callf   SEG_B05A:far_b0e80
        add     sp, 4
        mov     al, byte ptr [B_7B87]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_7B5E]
        cbw
        push    ds
        pop     es
        mov     di, STR_1D70
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        pop     ax
        sub     di, cx
        repne scasb
        jz      br_b27ea
        mov     di, 1
        xor     ax, ax
        mov     es, ax
br_b27ea:
        dec     di
        mov     ax, es
        mov     word ptr [bp - 4], ax
        mov     word ptr [bp - 6], di
        mov     dx, di
        or      dx, ax
        jz      br_b281d
        les     bx, dword ptr [bp - 6]
        add     bx, word ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        mov     byte ptr [bp - 1], al
        cmp     byte ptr [bp - 1], 3eh
        jnz     br_b2811
        mov     al, byte ptr [B_1D71]
        mov     byte ptr [bp - 1], al
br_b2811:
        cmp     byte ptr [bp - 1], 3ch
        jnz     br_b2823
        mov     byte ptr [bp - 1], 5fh
        jmp     br_b2823
br_b281d:
        mov     al, byte ptr [B_1D71]
        mov     byte ptr [bp - 1], al
br_b2823:
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        push    8
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        mov     al, byte ptr [B_7B87]
        cbw
        mov     dl, byte ptr [bp - 1]
        mov     bx, ax
        mov     byte ptr [bx + TBL_7B5E], dl
        pop     di
        leave
        retf
far_b284a:
        mov     byte ptr [B_E55C], 0
        retf
        if      FW_VERSION >= 311
        phase   0
        else
        phase   0ch
        endif
far_b2850:
        push    bp
        mov     bp, sp
        sub     sp, 1ah
        push    si
        xor     cx, cx
        mov     al, byte ptr [bp + 6]
        cbw
        mov     si, ax
        mov     bx, ax
        test    byte ptr [bx + TBL_79A5], 2
        jz      br_b286d
        xor     ax, ax
        pop     si
        leave
        retf
br_b286d:
        mov     byte ptr [B_7B8B], 15h
        mov     ax, word ptr [W_7B57]
        mov     dx, word ptr [FP_7B55]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        mov     ax, si
        cmp     ax, 2eh
        jnz     br_b2889
        jmp     near br_b292a
br_b2889:
        jg      br_b2898
        cmp     ax, 2bh
        jz      br_b28a8
        cmp     ax, 2dh
        jz      br_b28e3
        jmp     near br_b2928
br_b2898:
        cmp     ax, 3ch
        jnz     br_b28a0
        jmp     near br_b2923
br_b28a0:
        cmp     ax, 3eh
        jz      br_b291e
        jmp     near br_b2928
br_b28a8:
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx]
        inc     al
        mov     byte ptr es:[bx], al
        cmp     al, 8ah
        jc      br_b28bb
        mov     byte ptr es:[bx], 89h
br_b28bb:
        push    ss
        lea     ax, [bp - 1ah]
        push    ax
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        push    ax
        callf   SEG_E201:far_e201c
        add     sp, 6
        push    ss
        lea     ax, [bp - 1ah]
        push    ax
        callf   SEG_B254:far_b2739
        add     sp, 4
        mov     cx, 8000h
        jmp     br_b292a
br_b28e3:
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx]
        add     al, 0ffh
        mov     byte ptr es:[bx], al
        cmp     al, 8ah
        jc      br_b28f6
        mov     byte ptr es:[bx], 0
br_b28f6:
        push    ss
        lea     ax, [bp - 1ah]
        push    ax
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        push    ax
        callf   SEG_E201:far_e201c
        add     sp, 6
        push    ss
        lea     ax, [bp - 1ah]
        push    ax
        callf   SEG_B254:far_b2739
        add     sp, 4
        mov     cx, 8000h
        jmp     br_b292a
br_b291e:
        mov     cx, 800h
        jmp     br_b292a
br_b2923:
        mov     cx, 400h
        jmp     br_b292a
br_b2928:
        mov     cx, si
br_b292a:
        mov     ax, cx
        pop     si
        leave
        retf
        if      FW_VERSION >= 311
        phase   0fh
        else
        phase   0bh
        endif
far_b292f:
        push    bp
        mov     bp, sp
        sub     sp, 0ah
        push    si
        push    di
        xor     si, si
        mov     al, byte ptr [bp + 6]
        cbw
        mov     word ptr [bp - 0ah], ax
        mov     bx, ax
        test    byte ptr [bx + TBL_79A5], 2
        jz      br_b2967
        push    ds
        push    word A_1D82
        callf   SEG_B05A:far_b0e80
        add     sp, 4
        mov     al, byte ptr [bp + 6]
        push    ax
        callf   SEG_B05A:far_b1015
        add     sp, 2
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_b2967:
        mov     word ptr [bp - 2], 1
        mov     word ptr [bp - 4], 0
        mov     ax, word ptr [bp - 0ah]
        cmp     ax, 2eh
        jz      br_b299b
        jg      br_b298e
        cmp     ax, 2bh
        jnz     br_b2983
        jmp     near br_b2a2f
br_b2983:
        cmp     ax, 2dh
        jnz     br_b298b
        jmp     near br_b2a1c
br_b298b:
        jmp     br_b2aa4
br_b298e:
        cmp     ax, 3ch
        jz      br_b29c3
        cmp     ax, 3eh
        jz      br_b29b6
        jmp     br_b2aa4
br_b299b:
        push    ds
        push    word A_1D82
        callf   SEG_B05A:far_b0e80
        add     sp, 4
        mov     al, byte ptr [bp + 6]
        push    ax
        callf   SEG_B05A:far_b1015
        add     sp, 2
        jmp     br_b2ac5
br_b29b6:
        callf   SEG_B05A:far_b0caf
        add     ax, 800h
        mov     si, ax
        jmp     br_b2ac5
br_b29c3:
        cmp     byte ptr [B_7B88], 0
        jz      br_b29d0
        mov     si, 400h
        jmp     br_b2ac5
br_b29d0:
        cmp     byte ptr [B_7B87], 0
        jnz     br_b29da
        jmp     br_b2ac5
br_b29da:
        mov     al, byte ptr [B_7B87]
        cbw
        mov     di, ax
        push    ax
        mov     al, byte ptr [B_7B8B]
        cbw
        dec     ax
        pop     dx
        cmp     dx, ax
        jnz     br_b29ff
        cmp     byte ptr [di + TBL_7B5E], 20h
        jz      br_b29ff
        push    20h
        callf   SEG_B05A:far_b1015
        add     sp, 2
        jmp     near br_b2ac5
br_b29ff:
        mov     al, byte ptr [B_7B87]
        dec     al
        mov     byte ptr [B_7B87], al
        cbw
        mov     bx, ax
        mov     byte ptr [bx + TBL_7B5E], 20h
        push    7fh
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        jmp     near br_b2ac5
br_b2a1c:
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        neg     ax
        neg     dx
        sbb     ax, 0
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
br_b2a2f:
        callf   SEG_B05A:far_b0caf
        les     bx, dword ptr [FP_7B55]
        mov     ax, word ptr es:[bx + 2]
        xor     dx, dx
        and     ax, 0ffffh
        add     dx, word ptr [bp - 4]
        adc     ax, word ptr [bp - 2]
        add     dx, 100h
        adc     ax, 0
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        mov     ax, word ptr [W_9563]
        add     word ptr [bp - 6], ax
        cmp     word ptr [bp - 6], 1
        jge     br_b2a65
        mov     word ptr [bp - 6], 1
br_b2a65:
        cmp     word ptr [bp - 6], 3e7h
        jle     br_b2a71
        mov     word ptr [bp - 6], 3e7h
br_b2a71:
        mov     al, byte ptr [B_9446]
        cbw
        or      ax, ax
        jnz     br_b2a91
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        push    ds
        push    word B_901B
        callf   SEG_E3C0:far_e3c0f
        add     sp, 8
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
br_b2a91:
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        nop
        push    cs
        call    far_b2acb
        add     sp, 4
        mov     si, 8000h
        jmp     br_b2ac5
br_b2aa4:
        mov     al, byte ptr [B_7B88]
        cbw
        or      ax, ax
        jnz     br_b2abf
        les     bx, dword ptr [FP_7B55]
        push    word ptr es:[bx + 2]
        push    word ptr es:[bx]
        nop
        push    cs
        call    far_b2acb
        add     sp, 4
br_b2abf:
        mov     al, byte ptr [bp + 6]
        cbw
        mov     si, ax
br_b2ac5:
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
far_b2acb:
        push    bp
        mov     bp, sp
        sub     sp, 4
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        push    ds
        push    word TBL_7B5E
        push    ax
        push    dx
        nop
        push    cs
        call    far_b2b15
        add     sp, 8
        push    ds
        push    word TBL_7B5E
        callf   SEG_B254:far_b2739
        add     sp, 4
        mov     ax, word ptr [W_9563]
        sub     word ptr [bp - 2], ax
        les     bx, dword ptr [FP_7B55]
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        mov     word ptr es:[bx + 2], ax
        mov     word ptr es:[bx], dx
        mov     byte ptr [B_D4B4], 1
        leave
        retf
far_b2b15:
        push    bp
        mov     bp, sp
        sub     sp, 4
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        push    30h
        push    3
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    word ptr [bp - 2]
        callf   SEG_D780:far_d7805
        add     sp, 0ah
        les     bx, dword ptr [bp + 0ah]
        mov     byte ptr es:[bx + 3], 2eh
        push    30h
        push    2
        mov     ax, word ptr [bp + 0ah]
        add     ax, 4
        push    word ptr [bp + 0ch]
        push    ax
        mov     al, byte ptr [bp - 3]
        cbw
        push    ax
        callf   SEG_D780:far_d7805
        add     sp, 0ah
        les     bx, dword ptr [bp + 0ah]
        mov     byte ptr es:[bx + 6], 2eh
        push    30h
        push    2
        mov     ax, word ptr [bp + 0ah]
        add     ax, 7
        push    word ptr [bp + 0ch]
        push    ax
        mov     al, byte ptr [bp - 4]
        cbw
        push    ax
        callf   SEG_D780:far_d7805
        add     sp, 0ah
        leave
        retf
far_b2b84:
        push    bp
        mov     bp, sp
        sub     sp, 0eh
        push    di
        mov     byte ptr [bp - 0bh], 1
        mov     byte ptr [bp - 0ch], 0
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   0f800h:far_fa2a0
        add     sp, 4
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        mov     ax, word ptr [W_9563]
        inc     ax
        mov     word ptr [bp - 0eh], ax
        cwd
        cmp     dx, word ptr [bp - 6]
        jl      br_b2bca
        jg      br_b2bbb
        cmp     ax, word ptr [bp - 8]
        jbe     br_b2bca
br_b2bbb:
        mov     ax, word ptr [bp - 0eh]
        mov     word ptr [bp - 0ah], ax
        mov     dx, word ptr [bp - 0ah]
        mov     ax, word ptr [bp - 0ch]
        pop     di
        leave
        retf
br_b2bca:
        cmp     word ptr [bp - 6], 0
        jl      br_b2be7
        jg      br_b2bd9
        cmp     word ptr [bp - 8], 3e7h
        jbe     br_b2be7
br_b2bd9:
        mov     word ptr [bp - 0ah], 3e7h
        mov     dx, word ptr [bp - 0ah]
        mov     ax, word ptr [bp - 0ch]
        pop     di
        leave
        retf
br_b2be7:
        mov     ax, word ptr [bp - 8]
        mov     word ptr [bp - 0ah], ax
        les     di, dword ptr [bp + 6]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        mov     ax, 2eh
        sub     di, cx
        repne scasb
        jz      br_b2c09
        mov     di, 1
        xor     ax, ax
        mov     es, ax
br_b2c09:
        dec     di
        mov     ax, es
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], di
        mov     dx, di
        or      dx, ax
        jnz     br_b2c1b
        jmp     near br_b2cce
br_b2c1b:
        mov     dx, word ptr [bp - 4]
        inc     dx
        mov     word ptr [bp + 8], ax
        mov     word ptr [bp + 6], dx
        push    ax
        push    dx
        callf   0f800h:far_fa2a0
        add     sp, 4
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        cmp     word ptr [bp - 6], 0
        jg      br_b2c4d
        jl      br_b2c43
        cmp     word ptr [bp - 8], 1
        jnc     br_b2c4d
br_b2c43:
        mov     word ptr [bp - 6], 0
        mov     word ptr [bp - 8], 1
br_b2c4d:
        cmp     word ptr [bp - 6], 0
        jl      br_b2c65
        jg      br_b2c5b
        cmp     word ptr [bp - 8], 20h
        jbe     br_b2c65
br_b2c5b:
        mov     word ptr [bp - 6], 0
        mov     word ptr [bp - 8], 20h
br_b2c65:
        mov     al, byte ptr [bp - 8]
        mov     byte ptr [bp - 0bh], al
        les     di, dword ptr [bp + 6]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        mov     ax, 2eh
        sub     di, cx
        repne scasb
        jz      br_b2c87
        mov     di, 1
        xor     ax, ax
        mov     es, ax
br_b2c87:
        dec     di
        mov     ax, es
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], di
        mov     dx, di
        or      dx, ax
        jz      br_b2cce
        mov     dx, word ptr [bp - 4]
        inc     dx
        mov     word ptr [bp + 8], ax
        mov     word ptr [bp + 6], dx
        push    ax
        push    dx
        callf   0f800h:far_fa2a0
        add     sp, 4
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        cmp     word ptr [bp - 6], 0
        jl      br_b2cc8
        jg      br_b2cbe
        cmp     word ptr [bp - 8], 5fh
        jbe     br_b2cc8
br_b2cbe:
        mov     word ptr [bp - 6], 0
        mov     word ptr [bp - 8], 5fh
br_b2cc8:
        mov     al, byte ptr [bp - 8]
        mov     byte ptr [bp - 0ch], al
br_b2cce:
        mov     dx, word ptr [bp - 0ah]
        mov     ax, word ptr [bp - 0ch]
        pop     di
        leave
        retf
        if      FW_VERSION >= 311
        phase   7
        else
        phase   3
        endif
far_b2cd7:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        xor     cx, cx
        mov     al, byte ptr [bp + 6]
        cbw
        mov     si, ax
        mov     bx, ax
        test    byte ptr [bx + TBL_79A5], 2
        jz      br_b2cf4
        xor     ax, ax
        pop     si
        leave
        retf
br_b2cf4:
        mov     ax, word ptr [W_7B57]
        mov     dx, word ptr [FP_7B55]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        mov     byte ptr [B_7B8B], 9
        mov     ax, si
        cmp     ax, 2eh
        jnz     br_b2d10
        jmp     near br_b2d9c
br_b2d10:
        jg      br_b2d1e
        cmp     ax, 2bh
        jz      br_b2d2a
        cmp     ax, 2dh
        jz      br_b2d5d
        jmp     short br_b2d9a
br_b2d1e:
        cmp     ax, 3ch
        jz      br_b2d95
        cmp     ax, 3eh
        jz      br_b2d90
        jmp     br_b2d9a
br_b2d2a:
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx]
        inc     al
        mov     byte ptr es:[bx], al
        cmp     al, 80h
        jc      br_b2d3d
        mov     byte ptr es:[bx], 7fh
br_b2d3d:
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        push    ax
        nop
        push    cs
        call    far_b2da1
        add     sp, 2
        push    dx
        push    ax
        callf   SEG_B254:far_b2739
        add     sp, 4
        mov     cx, 8000h
        jmp     br_b2d9c
br_b2d5d:
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx]
        add     al, 0ffh
        mov     byte ptr es:[bx], al
        cmp     al, 80h
        jc      br_b2d70
        mov     byte ptr es:[bx], 0
br_b2d70:
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        push    ax
        nop
        push    cs
        call    far_b2da1
        add     sp, 2
        push    dx
        push    ax
        callf   SEG_B254:far_b2739
        add     sp, 4
        mov     cx, 8000h
        jmp     br_b2d9c
br_b2d90:
        mov     cx, 800h
        jmp     br_b2d9c
br_b2d95:
        mov     cx, 400h
        jmp     br_b2d9c
br_b2d9a:
        mov     cx, si
br_b2d9c:
        mov     ax, cx
        pop     si
        leave
        retf
far_b2da1:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        push    di
        mov     si, word ptr [bp + 6]
        push    20h
        push    3
        push    ds
        push    word A_E55E
        push    si
        callf   SEG_D780:far_d7805
        add     sp, 0ah
        mov     ax, si
        mov     bx, 0ch
        cwd
        idiv    bx
        mov     word ptr [bp - 2], dx
        mov     ax, si
        cwd
        idiv    bx
        add     ax, 0fffeh
        mov     dx, ax
        mov     byte ptr [B_E561], 28h
        mov     bx, word ptr [bp - 2]
        shl     bx, 2
        les     di, dword ptr [bx + TBL_1D84]
        mov     ax, ds
        if      FW_VERSION >= 312
        mov     si, 0e562h
        elseif  FW_VERSION = 311
        mov     si, 0e4aah
        else
        mov     si, 0df76h
        endif
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        or      dx, dx
        jge     br_b2e1b
        mov     byte ptr [B_E564], 2dh
        mov     al, 30h
        sub     al, dl
        mov     byte ptr [B_E565], al
        jmp     br_b2e27
br_b2e1b:
        mov     al, dl
        add     al, 30h
        mov     byte ptr [B_E564], al
        mov     byte ptr [B_E565], 20h
br_b2e27:
        mov     byte ptr [B_E566], 29h
        mov     byte ptr [B_E567], 0
        mov     dx, ds
        mov     ax, A_E55E
        pop     di
        pop     si
        leave
        retf
        if      FW_VERSION >= 311
        phase   0ah
        else
        phase   6
        endif
far_b2e3a:
        push    bp
        mov     bp, sp
        sub     sp, 0ch
        push    si
        push    di
        mov     ax, word ptr [W_7B91]
        mov     dx, word ptr [FP_7B8F]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp - 0ch], dx
        mov     al, byte ptr [B_7B8C]
        cbw
        and     ax, 0fh
        mov     si, ax
        cmp     si, 6
        jnz     br_b2e77
        les     bx, dword ptr [bp - 0ch]
        mov     cl, byte ptr es:[bx + 0dh]
        mov     ax, 1
        shl     ax, cl
        mov     cx, ax
br_b2e77:
        mov     al, byte ptr [bp + 6]
        cbw
        mov     di, ax
        or      ax, ax
        jnz     br_b2ed6
        mov     word ptr [W_E568], 0
        cmp     si, 9
        jnz     br_b2eae
        xor     dx, dx
        shl     dx, 2
        jmp     br_b2e9a
loop_b2e93:
        add     dx, 4
        inc     word ptr [W_E568]
br_b2e9a:
        les     bx, dword ptr [bp - 4]
        les     bx, dword ptr es:[bx + 6]
        add     bx, dx
        mov     ax, word ptr es:[bx]
        or      ax, word ptr es:[bx + 2]
        jnz     loop_b2e93
        jmp     br_b2ed0
br_b2eae:
        mov     dx, word ptr [W_E568]
        shl     dx, 2
        jmp     br_b2ebe
loop_b2eb7:
        add     dx, 4
        inc     word ptr [W_E568]
br_b2ebe:
        les     bx, dword ptr [bp - 8]
        les     bx, dword ptr es:[bx + 9]
        add     bx, dx
        mov     ax, word ptr es:[bx]
        or      ax, word ptr es:[bx + 2]
        jnz     loop_b2eb7
br_b2ed0:
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_b2ed6:
        xor     dx, dx
        test    byte ptr [di + TBL_79A5], 2
        jz      br_b2ee5
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_b2ee5:
        mov     ax, di
        cmp     ax, 2eh
        jnz     br_b2eef
        jmp     br_b30d9
br_b2eef:
        jg      br_b2f01
        cmp     ax, 2bh
        jz      br_b2f14
        cmp     ax, 2dh
        jnz     br_b2efe
        jmp     br_b2ffc
br_b2efe:
        jmp     br_b30d7
br_b2f01:
        cmp     ax, 3ch
        jnz     br_b2f09
        jmp     br_b30d2
br_b2f09:
        cmp     ax, 3eh
        jnz     br_b2f11
        jmp     br_b30cd
br_b2f11:
        jmp     br_b30d7
br_b2f14:
        cmp     si, 6
        jnz     br_b2f44
        les     bx, dword ptr [bp - 0ch]
        les     bx, dword ptr es:[bx + 5]
        or      byte ptr es:[bx], cl
        les     bx, dword ptr [bp - 0ch]
        les     bx, dword ptr es:[bx + 9]
        mov     ax, 1
        shl     ax, 2
        add     bx, ax
        push    word ptr es:[bx + 2]
        push    word ptr es:[bx]
        callf   SEG_B254:far_b2739
        add     sp, 4
        jmp     near br_b2ff1
br_b2f44:
        cmp     si, 9
        jnz     br_b2f96
        mov     ax, word ptr [W_E568]
        dec     ax
        mov     cx, ax
        les     bx, dword ptr [bp - 4]
        les     bx, dword ptr es:[bx + 0bh]
        sub     ax, word ptr es:[bx]
        cmp     ax, word ptr [W_D4AD]
        jnc     br_b2f67
        mov     ax, cx
        sub     ax, word ptr es:[bx]
        mov     word ptr [W_D4AD], ax
br_b2f67:
        les     bx, dword ptr [bp - 4]
        les     bx, dword ptr es:[bx + 0bh]
        mov     ax, word ptr [W_D4AD]
        add     word ptr es:[bx], ax
        mov     dx, word ptr es:[bx]
        les     bx, dword ptr [bp - 4]
        les     bx, dword ptr es:[bx + 6]
        mov     ax, dx
        shl     ax, 2
        add     bx, ax
        push    word ptr es:[bx + 2]
        push    word ptr es:[bx]
        callf   SEG_B254:far_b2739
        add     sp, 4
        jmp     br_b2ff1
br_b2f96:
        les     bx, dword ptr [bp - 8]
        les     bx, dword ptr es:[bx + 5]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        mov     dx, word ptr [W_E568]
        dec     dx
        mov     cx, dx
        sub     dx, ax
        cmp     dx, word ptr [W_D4AD]
        jge     br_b2fbe
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        mov     dx, cx
        sub     dx, ax
        mov     word ptr [W_D4AD], dx
br_b2fbe:
        les     bx, dword ptr [bp - 8]
        les     bx, dword ptr es:[bx + 5]
        mov     al, byte ptr es:[bx]
        add     al, byte ptr [W_D4AD]
        mov     byte ptr es:[bx], al
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        mov     dx, ax
        les     bx, dword ptr [bp - 8]
        les     bx, dword ptr es:[bx + 9]
        shl     ax, 2
        add     bx, ax
        push    word ptr es:[bx + 2]
        push    word ptr es:[bx]
        callf   SEG_B254:far_b2739
        add     sp, 4
br_b2ff1:
        mov     byte ptr [B_D4B4], 1
        mov     dx, 8000h
        jmp     br_b30d9
br_b2ffc:
        cmp     si, 6
        jnz     br_b302f
        les     bx, dword ptr [bp - 0ch]
        les     bx, dword ptr es:[bx + 5]
        mov     al, cl
        not     al
        and     byte ptr es:[bx], al
        les     bx, dword ptr [bp - 0ch]
        les     bx, dword ptr es:[bx + 9]
        xor     ax, ax
        shl     ax, 2
        add     bx, ax
        push    word ptr es:[bx + 2]
        push    word ptr es:[bx]
        callf   SEG_B254:far_b2739
        add     sp, 4
        jmp     near br_b30c3
br_b302f:
        cmp     si, 9
        jnz     br_b3076
        les     bx, dword ptr [bp - 4]
        les     bx, dword ptr es:[bx + 0bh]
        mov     ax, word ptr es:[bx]
        cmp     ax, word ptr [W_D4AD]
        jnc     br_b3047
        mov     word ptr [W_D4AD], ax
br_b3047:
        les     bx, dword ptr [bp - 4]
        les     bx, dword ptr es:[bx + 0bh]
        mov     ax, word ptr [W_D4AD]
        sub     word ptr es:[bx], ax
        mov     dx, word ptr es:[bx]
        les     bx, dword ptr [bp - 4]
        les     bx, dword ptr es:[bx + 6]
        mov     ax, dx
        shl     ax, 2
        add     bx, ax
        push    word ptr es:[bx + 2]
        push    word ptr es:[bx]
        callf   SEG_B254:far_b2739
        add     sp, 4
        jmp     br_b30c3
br_b3076:
        les     bx, dword ptr [bp - 8]
        les     bx, dword ptr es:[bx + 5]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        cmp     ax, word ptr [W_D4AD]
        jge     br_b3090
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        mov     word ptr [W_D4AD], ax
br_b3090:
        les     bx, dword ptr [bp - 8]
        les     bx, dword ptr es:[bx + 5]
        mov     al, byte ptr es:[bx]
        sub     al, byte ptr [W_D4AD]
        mov     byte ptr es:[bx], al
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        mov     dx, ax
        les     bx, dword ptr [bp - 8]
        les     bx, dword ptr es:[bx + 9]
        shl     ax, 2
        add     bx, ax
        push    word ptr es:[bx + 2]
        push    word ptr es:[bx]
        callf   SEG_B254:far_b2739
        add     sp, 4
br_b30c3:
        mov     byte ptr [B_D4B4], 1
        mov     dx, 8000h
        jmp     br_b30d9
br_b30cd:
        mov     dx, 800h
        jmp     br_b30d9
br_b30d2:
        mov     dx, 400h
        jmp     br_b30d9
br_b30d7:
        mov     dx, di
br_b30d9:
        mov     ax, dx
        pop     di
        pop     si
        leave
        retf
        if      FW_VERSION >= 311
        phase   0fh
        else
        phase   0bh
        endif
far_b30df:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    si
        push    di
        mov     cx, word ptr [bp + 8]
        mov     ax, word ptr [W_7B91]
        mov     dx, word ptr [FP_7B8F]
        mov     word ptr [bp - 4], ax
        mov     word ptr [bp - 6], dx
        xor     si, si
        mov     word ptr [bp - 2], 0
        mov     al, byte ptr [bp + 6]
        cbw
        mov     word ptr [bp - 8], ax
        mov     bx, ax
        test    byte ptr [bx + TBL_79A5], 2
        jz      br_b312c
        push    ds
        push    word A_1DD8
        callf   SEG_B05A:far_b0e80
        add     sp, 4
        mov     al, byte ptr [bp + 6]
        push    ax
        callf   SEG_B05A:far_b1015
        add     sp, 2
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_b312c:
        mov     di, word ptr [W_D4AD]
        les     bx, dword ptr [bp - 6]
        test    byte ptr es:[bx + 0dh], 4
        jz      br_b3143
        mov     dx, 0ah
        mov     ax, di
        imul    dx
        mov     di, ax
br_b3143:
        mov     ax, word ptr [bp - 8]
        cmp     ax, 3ch
        jnz     br_b314e
        jmp     near br_b31dc
br_b314e:
        jg      br_b3168
        cmp     ax, 2bh
        jnz     br_b3158
        jmp     br_b323b
br_b3158:
        cmp     ax, 2dh
        jnz     br_b3160
        jmp     br_b3239
br_b3160:
        cmp     ax, 2eh
        jz      br_b3180
        jmp     br_b32bf
br_b3168:
        cmp     ax, 3eh
        jz      br_b31cf
        cmp     ax, 44h
        jnz     br_b3175
        jmp     br_b3255
br_b3175:
        cmp     ax, 4eh
        jnz     br_b317d
        jmp     br_b3283
br_b317d:
        jmp     br_b32bf
br_b3180:
        les     bx, dword ptr [bp - 6]
        test    byte ptr es:[bx + 0dh], 4
        jz      br_b31a5
        push    ds
        push    word A_1DD8
        callf   SEG_B05A:far_b0e80
        add     sp, 4
        mov     al, byte ptr [bp + 6]
        push    ax
        callf   SEG_B05A:far_b1015
        add     sp, 2
        jmp     br_b32c4
br_b31a5:
        cmp     byte ptr [B_7B88], 0
        jz      br_b31c2
        nop
        push    cs
        call    far_b342e
        neg     ax
        push    ax
        nop
        push    cs
        call    far_b32ec
        add     sp, 2
        mov     si, 8000h
        jmp     br_b32c4
br_b31c2:
        callf   SEG_B05A:far_b0caf
        add     ax, 800h
        mov     si, ax
        jmp     br_b32c4
br_b31cf:
        callf   SEG_B05A:far_b0caf
        add     ax, 800h
        mov     si, ax
        jmp     br_b32c4
br_b31dc:
        cmp     byte ptr [B_7B88], 0
        jz      br_b31e9
        mov     si, 400h
        jmp     br_b32c4
br_b31e9:
        cmp     byte ptr [B_7B87], 0
        jnz     br_b31f3
        jmp     br_b32c4
br_b31f3:
        mov     al, byte ptr [B_7B87]
        cbw
        mov     di, ax
        les     bx, dword ptr [bp - 6]
        push    ax
        mov     al, byte ptr es:[bx + 4]
        cbw
        dec     ax
        pop     dx
        cmp     dx, ax
        jnz     br_b321c
        cmp     byte ptr [di + TBL_7B5E], 20h
        jz      br_b321c
        push    20h
        callf   SEG_B05A:far_b1015
        add     sp, 2
        jmp     near br_b32c4
br_b321c:
        mov     al, byte ptr [B_7B87]
        dec     al
        mov     byte ptr [B_7B87], al
        cbw
        mov     bx, ax
        mov     byte ptr [bx + TBL_7B5E], 20h
        push    7fh
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        jmp     near br_b32c4
br_b3239:
        neg     di
br_b323b:
        callf   SEG_B05A:far_b0caf
        nop
        push    cs
        call    far_b342e
        add     ax, di
        push    ax
        nop
        push    cs
        call    far_b32ec
        add     sp, 2
        mov     si, 8000h
        jmp     br_b32c4
br_b3255:
        les     bx, dword ptr [bp - 6]
        test    byte ptr es:[bx + 0dh], 10h
        jz      br_b3276
        callf   SEG_B05A:far_b0caf
        mov     al, byte ptr [B_D4C0]
        cbw
        push    ax
        nop
        push    cs
        call    far_b32ec
        add     sp, 2
        mov     si, 8000h
        jmp     br_b32c4
br_b3276:
        test    cx, 0c0h
        jz      br_b32c4
        mov     word ptr [bp - 2], 1
        jmp     br_b32c4
br_b3283:
        les     bx, dword ptr [bp - 6]
        test    byte ptr es:[bx + 0dh], 10h
        jz      br_b32b2
        cmp     byte ptr [B_D4C1], 23h
        jl      br_b32b2
        cmp     byte ptr [B_D4C1], 62h
        jg      br_b32b2
        callf   SEG_B05A:far_b0caf
        mov     al, byte ptr [B_D4C1]
        cbw
        push    ax
        nop
        push    cs
        call    far_b32ec
        add     sp, 2
        mov     si, 8000h
        jmp     br_b32c4
br_b32b2:
        test    cx, 40h
        jz      br_b32c4
        mov     word ptr [bp - 2], 1
        jmp     br_b32c4
br_b32bf:
        mov     word ptr [bp - 2], 1
br_b32c4:
        cmp     word ptr [bp - 2], 0
        jz      br_b32e6
        mov     al, byte ptr [B_7B88]
        cbw
        or      ax, ax
        jnz     br_b32e0
        nop
        push    cs
        call    far_b342e
        push    ax
        nop
        push    cs
        call    far_b32ec
        add     sp, 2
br_b32e0:
        mov     al, byte ptr [bp + 6]
        cbw
        mov     si, ax
br_b32e6:
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
far_b32ec:
        push    bp
        mov     bp, sp
        sub     sp, 8
        mov     ax, word ptr [W_7B91]
        mov     dx, word ptr [FP_7B8F]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        les     bx, dword ptr [bp - 4]
        test    byte ptr es:[bx + 0dh], 1
        jz      br_b330f
        mov     ax, word ptr [W_9563]
        sub     word ptr [bp + 6], ax
br_b330f:
        les     bx, dword ptr [bp - 4]
        mov     ax, word ptr es:[bx + 9]
        mov     word ptr [bp - 6], ax
        cmp     ax, word ptr [bp + 6]
        jle     br_b3321
        mov     word ptr [bp + 6], ax
br_b3321:
        les     bx, dword ptr [bp - 4]
        mov     ax, word ptr es:[bx + 0bh]
        mov     word ptr [bp - 8], ax
        cmp     ax, word ptr [bp + 6]
        jge     br_b3333
        mov     word ptr [bp + 6], ax
br_b3333:
        les     bx, dword ptr [bp - 4]
        test    byte ptr es:[bx + 0dh], 1
        jz      br_b3343
        mov     ax, word ptr [W_9563]
        add     word ptr [bp + 6], ax
br_b3343:
        les     bx, dword ptr [bp - 4]
        mov     ax, word ptr es:[bx + 0eh]
        or      ax, word ptr es:[bx + 10h]
        jz      br_b335f
        push    0
        push    word ptr [bp + 6]
        seges
        callf   dword ptr [bx + 0eh]
        add     sp, 4
        mov     word ptr [bp + 6], ax
br_b335f:
        mov     dl, 20h
        les     bx, dword ptr [bp - 4]
        test    byte ptr es:[bx + 0dh], 2
        jz      br_b336d
        mov     dl, 30h
br_b336d:
        push    dx
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx + 4]
        cbw
        push    ax
        push    ds
        push    word TBL_7B5E
        push    word ptr [bp + 6]
        callf   SEG_D780:far_d7805
        add     sp, 0ah
        les     bx, dword ptr [bp - 4]
        test    byte ptr es:[bx + 0dh], 4
        jz      br_b339c
        push    ds
        push    word TBL_7B5E
        callf   SEG_B347:far_b3ab6
        add     sp, 4
br_b339c:
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx + 2]
        cbw
        push    ax
        mov     al, byte ptr es:[bx + 1]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word TBL_7B5E
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx + 2]
        cbw
        push    ax
        mov     al, byte ptr es:[bx + 1]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        les     bx, dword ptr [bp - 4]
        mov     ax, word ptr es:[bx + 0eh]
        or      ax, word ptr es:[bx + 10h]
        jz      br_b33f2
        push    1
        push    word ptr [bp + 6]
        seges
        callf   dword ptr [bx + 0eh]
        add     sp, 4
        mov     word ptr [bp + 6], ax
br_b33f2:
        les     bx, dword ptr [bp - 4]
        test    byte ptr es:[bx + 0dh], 1
        jz      br_b3402
        mov     ax, word ptr [W_9563]
        sub     word ptr [bp + 6], ax
br_b3402:
        les     bx, dword ptr [bp - 4]
        test    byte ptr es:[bx + 0dh], 8
        jz      br_b3418
        les     bx, dword ptr [FP_7B55]
        mov     al, byte ptr [bp + 6]
        mov     byte ptr es:[bx], al
        jmp     br_b3422
br_b3418:
        les     bx, dword ptr [FP_7B55]
        mov     ax, word ptr [bp + 6]
        mov     word ptr es:[bx], ax
br_b3422:
        mov     byte ptr [B_D4B4], 1
        mov     byte ptr [B_7B88], 1
        leave
        retf
far_b342e:
        push    bp
        mov     bp, sp
        sub     sp, 4
        mov     ax, word ptr [W_7B91]
        mov     dx, word ptr [FP_7B8F]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        les     bx, dword ptr [bp - 4]
        test    byte ptr es:[bx + 0dh], 8
        jz      br_b3456
        les     bx, dword ptr [FP_7B55]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        jmp     br_b345d
br_b3456:
        les     bx, dword ptr [FP_7B55]
        mov     ax, word ptr es:[bx]
br_b345d:
        mov     dx, ax
        les     bx, dword ptr [bp - 4]
        test    byte ptr es:[bx + 0dh], 1
        jz      br_b346d
        add     dx, word ptr [W_9563]
br_b346d:
        mov     ax, dx
        leave
        retf
        if      FW_VERSION >= 311
        phase   1
        else
        phase   0dh
        endif
far_b3471:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    si
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ss
        lea     ax, [bp - 7]
        push    ax
        push    ss
        lea     ax, [bp - 6]
        push    ax
        callf   SEG_B1AA:far_b1b2b
        add     sp, 8
        mov     ax, word ptr [W_7B91]
        mov     dx, word ptr [FP_7B8F]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        les     bx, dword ptr [FP_7B8F]
        mov     byte ptr es:[bx], 0ah
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr [bp - 6]
        mov     byte ptr es:[bx + 1], al
        mov     al, byte ptr [bp - 7]
        mov     byte ptr es:[bx + 2], al
        mov     byte ptr es:[bx + 3], 1
        mov     al, byte ptr [bp + 0eh]
        mov     byte ptr es:[bx + 4], al
        mov     ax, word ptr [bp + 0ch]
        mov     dx, word ptr [bp + 0ah]
        mov     word ptr es:[bx + 7], ax
        mov     word ptr es:[bx + 5], dx
        push    es
        mov     si, word ptr [bp - 4]
        mov     al, byte ptr es:[si]
        pop     es
        mov     byte ptr es:[bx + 9], al
        mov     es, word ptr [bp - 2]
        cbw
        add     word ptr [FP_7B8F], ax
        les     bx, dword ptr [FP_7B8F]
        mov     byte ptr es:[bx], 0
        mov     byte ptr [bp - 5], 0
        mov     al, byte ptr [bp - 5]
        cmp     al, byte ptr [bp + 0eh]
        jge     br_b3533
loop_b3500:
        les     bx, dword ptr [bp + 0ah]
        cmp     byte ptr es:[bx], 0
        jz      br_b351e
        mov     bx, word ptr [bp + 0ah]
        inc     word ptr [bp + 0ah]
        mov     al, byte ptr es:[bx]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        jmp     br_b3528
br_b351e:
        push    20h
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
br_b3528:
        inc     byte ptr [bp - 5]
        mov     al, byte ptr [bp - 5]
        cmp     al, byte ptr [bp + 0eh]
        jl      loop_b3500
br_b3533:
        mov     byte ptr [B_7B8E], 0
        pop     si
        leave
        retf
        if      FW_VERSION >= 311
far_b353b:
        else
L_ba3f7:
        endif
        push    bp
        mov     bp, sp
        sub     sp, 0ch
        push    si
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ss
        lea     ax, [bp - 0bh]
        push    ax
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        callf   SEG_B1AA:far_b1b2b
        add     sp, 8
        mov     ax, word ptr [W_7B91]
        mov     dx, word ptr [FP_7B8F]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        les     bx, dword ptr [FP_7B8F]
        mov     byte ptr es:[bx], 0fh
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr [bp - 0ah]
        mov     byte ptr es:[bx + 1], al
        mov     al, byte ptr [bp - 0bh]
        mov     byte ptr es:[bx + 2], al
        mov     byte ptr es:[bx + 3], 9
        mov     al, byte ptr [bp + 12h]
        mov     byte ptr es:[bx + 4], al
        mov     ax, word ptr [bp + 0ch]
        mov     dx, word ptr [bp + 0ah]
        mov     word ptr es:[bx + 0dh], ax
        mov     word ptr es:[bx + 0bh], dx
        mov     ax, word ptr [bp + 10h]
        mov     dx, word ptr [bp + 0eh]
        mov     word ptr es:[bx + 8], ax
        mov     word ptr es:[bx + 6], dx
        push    es
        mov     si, word ptr [bp - 4]
        mov     al, byte ptr es:[si]
        pop     es
        mov     byte ptr es:[bx + 0ah], al
        mov     es, word ptr [bp - 2]
        cbw
        add     word ptr [FP_7B8F], ax
        les     bx, dword ptr [FP_7B8F]
        mov     byte ptr es:[bx], 0
        les     bx, dword ptr [bp + 0ah]
        mov     ax, word ptr es:[bx]
        shl     ax, 2
        les     bx, dword ptr [bp + 0eh]
        add     bx, ax
        mov     ax, word ptr es:[bx + 2]
        mov     dx, word ptr es:[bx]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        mov     byte ptr [bp - 9], 0
        mov     al, byte ptr [bp - 9]
        cmp     al, byte ptr [bp + 12h]
        jge     br_b3626
loop_b35f3:
        les     bx, dword ptr [bp - 8]
        cmp     byte ptr es:[bx], 0
        jz      br_b3611
        mov     bx, word ptr [bp - 8]
        inc     word ptr [bp - 8]
        mov     al, byte ptr es:[bx]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        jmp     br_b361b
br_b3611:
        push    20h
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
br_b361b:
        inc     byte ptr [bp - 9]
        mov     al, byte ptr [bp - 9]
        cmp     al, byte ptr [bp + 12h]
        jl      loop_b35f3
br_b3626:
        mov     byte ptr [B_7B8E], 0
        pop     si
        leave
        retf
far_b362e:
        push    bp
        mov     bp, sp
        sub     sp, 0ch
        push    si
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ss
        lea     ax, [bp - 0bh]
        push    ax
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        callf   SEG_B1AA:far_b1b2b
        add     sp, 8
        mov     ax, word ptr [W_7B91]
        mov     dx, word ptr [FP_7B8F]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        les     bx, dword ptr [FP_7B8F]
        mov     byte ptr es:[bx], 0eh
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr [bp - 0ah]
        mov     byte ptr es:[bx + 1], al
        mov     al, byte ptr [bp - 0bh]
        mov     byte ptr es:[bx + 2], al
        mov     byte ptr es:[bx + 3], 2
        mov     al, byte ptr [bp + 12h]
        mov     byte ptr es:[bx + 4], al
        mov     ax, word ptr [bp + 0ch]
        mov     dx, word ptr [bp + 0ah]
        mov     word ptr es:[bx + 7], ax
        mov     word ptr es:[bx + 5], dx
        mov     ax, word ptr [bp + 10h]
        mov     dx, word ptr [bp + 0eh]
        mov     word ptr es:[bx + 0bh], ax
        mov     word ptr es:[bx + 9], dx
        push    es
        mov     si, word ptr [bp - 4]
        mov     al, byte ptr es:[si]
        pop     es
        mov     byte ptr es:[bx + 0dh], al
        mov     es, word ptr [bp - 2]
        cbw
        add     word ptr [FP_7B8F], ax
        les     bx, dword ptr [FP_7B8F]
        mov     byte ptr es:[bx], 0
        les     bx, dword ptr [bp + 0ah]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        shl     ax, 2
        les     bx, dword ptr [bp + 0eh]
        add     bx, ax
        mov     ax, word ptr es:[bx + 2]
        mov     dx, word ptr es:[bx]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        mov     byte ptr [bp - 9], 0
        mov     al, byte ptr [bp - 9]
        cmp     al, byte ptr [bp + 12h]
        jge     br_b371b
loop_b36e8:
        les     bx, dword ptr [bp - 8]
        cmp     byte ptr es:[bx], 0
        jz      br_b3706
        mov     bx, word ptr [bp - 8]
        inc     word ptr [bp - 8]
        mov     al, byte ptr es:[bx]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        jmp     br_b3710
br_b3706:
        push    20h
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
br_b3710:
        inc     byte ptr [bp - 9]
        mov     al, byte ptr [bp - 9]
        cmp     al, byte ptr [bp + 12h]
        jl      loop_b36e8
br_b371b:
        if      FW_VERSION < 311
        mov     byte ptr [B_7B8E], 0
        pop     si
        leave
        retf
L_ba5df:
        push    bp
        mov     bp, sp
        sub     sp, 0ch
        push    si
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ss
        lea     ax, [bp - 0bh]
        push    ax
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        callf   SEG_B1AA:far_b1b2b
        add     sp, 8
        mov     ax, word ptr [W_7B91]
        mov     dx, word ptr [FP_7B8F]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        les     bx, dword ptr [FP_7B8F]
        mov     byte ptr es:[bx], 0fh
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr [bp - 0ah]
        mov     byte ptr es:[bx + 1], al
        mov     al, byte ptr [bp - 0bh]
        mov     byte ptr es:[bx + 2], al
        mov     byte ptr es:[bx + 3], 6
        mov     al, byte ptr [bp + 14h]
        mov     byte ptr es:[bx + 4], al
        mov     ax, word ptr [bp + 0ch]
        mov     dx, word ptr [bp + 0ah]
        mov     word ptr es:[bx + 7], ax
        mov     word ptr es:[bx + 5], dx
        mov     ax, word ptr [bp + 12h]
        mov     dx, word ptr [bp + 10h]
        mov     word ptr es:[bx + 0bh], ax
        mov     word ptr es:[bx + 9], dx
        mov     al, byte ptr [bp + 0eh]
        and     al, 7
        mov     byte ptr es:[bx + 0dh], al
        push    es
        mov     si, word ptr [bp - 4]
        mov     al, byte ptr es:[si]
        pop     es
        mov     byte ptr es:[bx + 0eh], al
        mov     es, word ptr [bp - 2]
        cbw
        add     word ptr [FP_7B8F], ax
        les     bx, dword ptr [FP_7B8F]
        mov     byte ptr es:[bx], 0
        les     bx, dword ptr [bp - 4]
        mov     cl, byte ptr es:[bx + 0dh]
        mov     al, 1
        shl     al, cl
        mov     byte ptr [bp - 0ch], al
        les     bx, dword ptr [bp + 0ah]
        test    byte ptr es:[bx], al
        jz      L_ba6a2
        les     bx, dword ptr [bp + 10h]
        mov     ax, word ptr es:[bx + 6]
        mov     dx, word ptr es:[bx + 4]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        jmp     L_ba6b2
L_ba6a2:
        les     bx, dword ptr [bp + 10h]
        mov     ax, word ptr es:[bx + 2]
        mov     dx, word ptr es:[bx]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
L_ba6b2:
        mov     byte ptr [bp - 9], 0
        mov     al, byte ptr [bp - 9]
        cmp     al, byte ptr [bp + 14h]
        jge     L_ba6f1
L_ba6be:
        les     bx, dword ptr [bp - 8]
        cmp     byte ptr es:[bx], 0
        jz      L_ba6dc
        mov     bx, word ptr [bp - 8]
        inc     word ptr [bp - 8]
        mov     al, byte ptr es:[bx]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        jmp     L_ba6e6
L_ba6dc:
        push    20h
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
L_ba6e6:
        inc     byte ptr [bp - 9]
        mov     al, byte ptr [bp - 9]
        cmp     al, byte ptr [bp + 14h]
        jl      L_ba6be
L_ba6f1:
        endif
        mov     byte ptr [B_7B8E], 0
        pop     si
        leave
        retf
far_b3723:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    si
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ss
        lea     ax, [bp - 5]
        push    ax
        callf   SEG_B1AA:far_b1b2b
        add     sp, 8
        mov     ax, word ptr [W_7B91]
        mov     dx, word ptr [FP_7B8F]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        les     bx, dword ptr [FP_7B8F]
        mov     byte ptr es:[bx], 13h
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr [bp - 5]
        mov     byte ptr es:[bx + 1], al
        mov     al, byte ptr [bp - 6]
        mov     byte ptr es:[bx + 2], al
        mov     byte ptr es:[bx + 3], 0
        mov     al, byte ptr [bp + 0eh]
        mov     byte ptr es:[bx + 4], al
        mov     ax, word ptr [bp + 0ch]
        mov     dx, word ptr [bp + 0ah]
        mov     word ptr es:[bx + 7], ax
        mov     word ptr es:[bx + 5], dx
        mov     ax, word ptr [bp + 10h]
        mov     word ptr es:[bx + 9], ax
        mov     ax, word ptr [bp + 12h]
        mov     word ptr es:[bx + 0bh], ax
        mov     ax, word ptr [bp + 18h]
        mov     dx, word ptr [bp + 16h]
        mov     word ptr es:[bx + 10h], ax
        mov     word ptr es:[bx + 0eh], dx
        mov     al, byte ptr [bp + 14h]
        mov     byte ptr es:[bx + 0dh], al
        push    es
        mov     si, word ptr [bp - 4]
        mov     al, byte ptr es:[si]
        pop     es
        mov     byte ptr es:[bx + 12h], al
        mov     es, word ptr [bp - 2]
        cbw
        add     word ptr [FP_7B8F], ax
        les     bx, dword ptr [FP_7B8F]
        mov     byte ptr es:[bx], 0
        test    byte ptr [bp + 14h], 8
        jz      br_b37db
        les     bx, dword ptr [bp + 0ah]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        mov     dx, ax
        jmp     br_b37e1
br_b37db:
        les     bx, dword ptr [bp + 0ah]
        mov     dx, word ptr es:[bx]
br_b37e1:
        mov     ax, word ptr [bp + 16h]
        or      ax, word ptr [bp + 18h]
        jz      br_b37f4
        push    0
        push    dx
        callf   dword ptr [bp + 16h]
        add     sp, 4
        mov     dx, ax
br_b37f4:
        test    byte ptr [bp + 14h], 1
        jz      br_b37fe
        add     dx, word ptr [W_9563]
br_b37fe:
        mov     al, byte ptr [bp + 14h]
        and     al, 0f7h
        push    ax
        mov     al, byte ptr [bp + 0eh]
        push    ax
        push    dx
        nop
        push    cs
        call    far_b3b12
        add     sp, 6
        mov     byte ptr [B_7B8E], 0
        pop     si
        leave
        retf
far_b3819:
        push    bp
        mov     bp, sp
        push    0
        push    0
        mov     al, byte ptr [bp + 14h]
        push    ax
        push    word ptr [bp + 12h]
        push    word ptr [bp + 10h]
        mov     al, byte ptr [bp + 0eh]
        push    ax
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    cs
        call    far_b3723
        add     sp, 14h
        pop     bp
        retf
far_b3843:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    si
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ss
        lea     ax, [bp - 5]
        push    ax
        callf   SEG_B1AA:far_b1b2b
        add     sp, 8
        mov     ax, word ptr [W_7B91]
        mov     dx, word ptr [FP_7B8F]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        les     bx, dword ptr [FP_7B8F]
        mov     byte ptr es:[bx], 0ah
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr [bp - 5]
        mov     byte ptr es:[bx + 1], al
        mov     al, byte ptr [bp - 6]
        mov     byte ptr es:[bx + 2], al
        mov     byte ptr es:[bx + 3], 3
        mov     byte ptr es:[bx + 4], 9
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        mov     word ptr es:[bx + 7], ax
        mov     word ptr es:[bx + 5], dx
        push    es
        mov     si, word ptr [bp - 4]
        mov     al, byte ptr es:[si]
        pop     es
        mov     byte ptr es:[bx + 9], al
        mov     es, word ptr [bp - 2]
        cbw
        add     word ptr [FP_7B8F], ax
        les     bx, dword ptr [FP_7B8F]
        mov     byte ptr es:[bx], 0
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        cbw
        push    ax
        callf   SEG_B2CD:far_b2da1
        add     sp, 2
        push    dx
        push    ax
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     byte ptr [B_7B8E], 0
        pop     si
        leave
        retf
far_b38d8:
        push    bp
        mov     bp, sp
        sub     sp, 22h
        push    si
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ss
        lea     ax, [bp - 5]
        push    ax
        callf   SEG_B1AA:far_b1b2b
        add     sp, 8
        mov     ax, word ptr [W_7B91]
        mov     dx, word ptr [FP_7B8F]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        les     bx, dword ptr [FP_7B8F]
        mov     byte ptr es:[bx], 0ah
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr [bp - 5]
        mov     byte ptr es:[bx + 1], al
        mov     al, byte ptr [bp - 6]
        mov     byte ptr es:[bx + 2], al
        mov     byte ptr es:[bx + 3], 8
        mov     byte ptr es:[bx + 4], 15h
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        mov     word ptr es:[bx + 7], ax
        mov     word ptr es:[bx + 5], dx
        push    es
        mov     si, word ptr [bp - 4]
        mov     al, byte ptr es:[si]
        pop     es
        mov     byte ptr es:[bx + 9], al
        mov     es, word ptr [bp - 2]
        cbw
        add     word ptr [FP_7B8F], ax
        les     bx, dword ptr [FP_7B8F]
        mov     byte ptr es:[bx], 0
        push    ss
        lea     ax, [bp - 22h]
        push    ax
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        push    ax
        callf   SEG_E201:far_e201c
        add     sp, 6
        lea     ax, [bp - 22h]
        mov     word ptr [bp - 8], ss
        mov     word ptr [bp - 0ah], ax
        xor     si, si
loop_b396c:
        les     bx, dword ptr [bp - 0ah]
        cmp     byte ptr es:[bx], 0
        jz      br_b398a
        mov     bx, word ptr [bp - 0ah]
        inc     word ptr [bp - 0ah]
        mov     al, byte ptr es:[bx]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        jmp     br_b3994
br_b398a:
        push    20h
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
br_b3994:
        inc     si
        cmp     si, 15h
        jl      loop_b396c
        mov     byte ptr [B_7B8E], 0
        pop     si
        leave
        retf
far_b39a2:
        push    bp
        mov     bp, sp
        sub     sp, 14h
        push    si
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ss
        lea     ax, [bp - 5]
        push    ax
        callf   SEG_B1AA:far_b1b2b
        add     sp, 8
        mov     ax, word ptr [W_7B91]
        mov     dx, word ptr [FP_7B8F]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        les     bx, dword ptr [FP_7B8F]
        mov     byte ptr es:[bx], 0ah
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr [bp - 5]
        mov     byte ptr es:[bx + 1], al
        mov     al, byte ptr [bp - 6]
        mov     byte ptr es:[bx + 2], al
        mov     byte ptr es:[bx + 3], 5
        mov     byte ptr es:[bx + 4], 9
        mov     ax, word ptr [bp + 0ch]
        mov     dx, word ptr [bp + 0ah]
        mov     word ptr es:[bx + 7], ax
        mov     word ptr es:[bx + 5], dx
        push    es
        mov     si, word ptr [bp - 4]
        mov     al, byte ptr es:[si]
        pop     es
        mov     byte ptr es:[bx + 9], al
        mov     es, word ptr [bp - 2]
        cbw
        add     word ptr [FP_7B8F], ax
        les     bx, dword ptr [FP_7B8F]
        mov     byte ptr es:[bx], 0
        les     bx, dword ptr [bp + 0ah]
        mov     ax, word ptr es:[bx + 2]
        mov     dx, word ptr es:[bx]
        add     dx, 0
        adc     ax, word ptr [W_9563]
        mov     word ptr [bp - 12h], ax
        mov     word ptr [bp - 14h], dx
        push    ss
        lea     ax, [bp - 10h]
        push    ax
        push    word ptr [bp - 12h]
        push    dx
        callf   SEG_B292:far_b2b15
        add     sp, 8
        push    ss
        lea     ax, [bp - 10h]
        push    ax
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     byte ptr [B_7B8E], 0
        pop     si
        leave
        retf
far_b3a60:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        mov     ax, word ptr [W_7B91]
        mov     dx, word ptr [FP_7B8F]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        les     bx, dword ptr [FP_7B8F]
        mov     byte ptr es:[bx], 5
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr [bp + 6]
        mov     byte ptr es:[bx + 1], al
        mov     al, byte ptr [bp + 8]
        mov     byte ptr es:[bx + 2], al
        mov     byte ptr es:[bx + 3], 7
        push    es
        mov     si, word ptr [bp - 4]
        mov     al, byte ptr es:[si]
        pop     es
        mov     byte ptr es:[bx + 4], al
        mov     es, word ptr [bp - 2]
        cbw
        add     word ptr [FP_7B8F], ax
        les     bx, dword ptr [FP_7B8F]
        mov     byte ptr es:[bx], 0
        mov     byte ptr [B_7B8E], 0
        pop     si
        leave
        retf
far_b3ab6:
        push    bp
        mov     bp, sp
        sub     sp, 4
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        mov     cl, 0
        jmp     br_b3ace
loop_b3acc:
        inc     cl
br_b3ace:
        les     bx, dword ptr [bp - 4]
        inc     word ptr [bp - 4]
        cmp     byte ptr es:[bx], 0
        jnz     loop_b3acc
        cmp     cl, 2
        jl      br_b3b10
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        dec     cl
        jmp     br_b3b01
loop_b3aef:
        inc     word ptr [bp + 6]
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        les     bx, dword ptr [bp - 4]
        mov     byte ptr es:[bx], al
        inc     word ptr [bp - 4]
br_b3b01:
        dec     cl
        mov     al, cl
        or      al, al
        jnz     loop_b3aef
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], 2eh
br_b3b10:
        leave
        retf
far_b3b12:
        push    bp
        mov     bp, sp
        sub     sp, 30h
        mov     dx, word ptr [bp + 6]
        test    byte ptr [bp + 0ah], 8
        jz      br_b3b25
        and     dx, 0ffh
br_b3b25:
        mov     bl, 20h
        test    byte ptr [bp + 0ah], 2
        jz      br_b3b2f
        mov     bl, 30h
br_b3b2f:
        push    bx
        mov     al, byte ptr [bp + 8]
        cbw
        push    ax
        push    ss
        lea     ax, [bp - 30h]
        push    ax
        push    dx
        callf   SEG_D780:far_d7805
        add     sp, 0ah
        test    byte ptr [bp + 0ah], 4
        jz      br_b3b55
        push    ss
        lea     ax, [bp - 30h]
        push    ax
        push    cs
        call    far_b3ab6
        add     sp, 4
br_b3b55:
        lea     ax, [bp - 30h]
        mov     word ptr [bp - 4], ss
        mov     word ptr [bp - 6], ax
        mov     byte ptr [bp - 1], 0
        mov     al, byte ptr [bp - 1]
        cmp     al, byte ptr [bp + 8]
        jge     br_b3b9d
loop_b3b6a:
        les     bx, dword ptr [bp - 6]
        cmp     byte ptr es:[bx], 0
        jz      br_b3b88
        mov     bx, word ptr [bp - 6]
        inc     word ptr [bp - 6]
        mov     al, byte ptr es:[bx]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        jmp     br_b3b92
br_b3b88:
        push    20h
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
br_b3b92:
        inc     byte ptr [bp - 1]
        mov     al, byte ptr [bp - 1]
        cmp     al, byte ptr [bp + 8]
        jl      loop_b3b6a
br_b3b9d:
        leave
        retf
        if      FW_VERSION >= 311
        phase   0fh
        else
        phase   5
        endif
far_b3b9f:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        push    di
        if      FW_VERSION >= 311
        mov     di, word ptr [bp + 6]
        or      di, di
        jnz     br_b3bb4
        mov     ax, di
        else
        mov     si, word ptr [bp + 6]
        or      si, si
        jnz     L_bab8a
        mov     ax, si
        endif
        pop     di
        pop     si
        leave
        retf
        if      FW_VERSION >= 311
br_b3bb4:
        or      di, di
        else
L_bab8a:
        or      si, si
        endif
        jle     br_b3bc2
        mov     word ptr [bp - 2], 2
        if      FW_VERSION >= 311
        mov     si, di
        else
        mov     di, si
        endif
        jmp     br_b3cc8
br_b3bc2:
        if      FW_VERSION >= 311
        cmp     di, 0ffe2h
        else
        cmp     si, 0ffe2h
        endif
        jle     br_b3bd3
        mov     word ptr [bp - 2], 1
        if      FW_VERSION >= 311
        mov     si, di
        neg     si
        else
        mov     di, si
        neg     di
        endif
        jmp     br_b3cc8
br_b3bd3:
        if      FW_VERSION >= 311
        cmp     di, 0ffc0h
        else
        cmp     si, 0ffc0h
        endif
        jle     br_b3be4
        mov     word ptr [bp - 2], 3
        if      FW_VERSION >= 311
        mov     si, di
        neg     si
        jmp     br_b3cc8
        else
        mov     di, si
        neg     di
        jmp     near br_b3cc8
        endif
br_b3be4:
        mov     word ptr [bp - 2], 0
        if      FW_VERSION >= 311
        mov     ax, di
        else
        mov     ax, si
        endif
        and     ax, 0ff00h
        cmp     ax, 0ff00h
        jz      br_b3bf6
        if      FW_VERSION >= 311
        jmp     br_b3cc1
        else
        jmp     near L_bac76
        endif
br_b3bf6:
        if      FW_VERSION >= 311
        cmp     di, 0ff80h
        else
        cmp     si, 0ff80h
        endif
        jz      br_b3c01
        if      FW_VERSION >= 311
        cmp     di, 0ff60h
        else
        cmp     si, 0ff60h
        endif
        jnz     br_b3c31
br_b3c01:
        cmp     byte ptr [B_7AC3], 0
        jnz     br_b3c17
        if      FW_VERSION >= 311
        mov     si, 15h
        else
        mov     di, 15h
        endif
        push    1
        callf   SEG_D546:far_d5b6a
        add     sp, 2
        jmp     br_b3c24
br_b3c17:
        if      FW_VERSION >= 311
        mov     si, 14h
        else
        mov     di, 14h
        endif
        push    0
        callf   SEG_D546:far_d5b6a
        add     sp, 2
br_b3c24:
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        if      FW_VERSION >= 311
        jmp     near br_b3cc8
        else
        jmp     br_b3cc8
        endif
br_b3c31:
        if      FW_VERSION >= 311
        mov     ax, di
        and     ax, 0ff7fh
        cmp     ax, 0ff30h
        jz      br_b3c94
        ja      br_b3c61
        cmp     ax, 0ff08h
        jz      br_b3c8f
        ja      br_b3c55
        cmp     ax, 0ff02h
        jz      br_b3c80
        cmp     ax, 0ff03h
        jz      br_b3c85
        cmp     ax, 0ff04h
        jz      br_b3c80
        else
        mov     bx, si
        and     bx, 0ff7fh
        cmp     bx, 0ff10h
        jz      L_bac4c
        ja      L_bac24
        sub     bx, 0ff02h
        cmp     bx, 6
        ja      br_b3cc8
        shl     bx, 1
        jmp     word ptr cs:[bx + L_bac90]
L_bac24:
        cmp     bx, 0ff40h
        jz      L_bac51
        ja      L_bac3a
        cmp     bx, 0ff20h
        jz      L_bac51
        cmp     bx, 0ff30h
        jz      L_bac56
        endif
        jmp     br_b3cc8
        if      FW_VERSION >= 311
br_b3c55:
        cmp     ax, 0ff10h
        jz      br_b3c8a
        cmp     ax, 0ff20h
        jz      br_b3c8f
        else
L_bac3a:
        cmp     bx, 0ff50h
        jz      L_bac5b
        endif
        jmp     br_b3cc8
        if      FW_VERSION >= 311
br_b3c61:
        cmp     ax, 0ff49h
        jz      br_b3c9e
        ja      br_b3c74
        cmp     ax, 0ff40h
        jz      br_b3c8f
        cmp     ax, 0ff48h
        jz      br_b3c99
        else
L_bac42:
        mov     di, 16h
        endif
        jmp     br_b3cc8
        if      FW_VERSION >= 311
br_b3c74:
        cmp     ax, 0ff50h
        jz      br_b3ca3
        cmp     ax, 0ff51h
        jz      br_b3cbc
        else
L_bac47:
        mov     di, 17h
        endif
        jmp     br_b3cc8
        if      FW_VERSION >= 311
br_b3c80:
        mov     si, 16h
        else
L_bac4c:
        mov     di, 18h
        endif
        jmp     br_b3cc8
        if      FW_VERSION >= 311
br_b3c85:
        mov     si, 17h
        else
L_bac51:
        mov     di, 19h
        endif
        jmp     br_b3cc8
        if      FW_VERSION >= 311
br_b3c8a:
        mov     si, 18h
        else
L_bac56:
        mov     di, 1bh
        endif
        jmp     br_b3cc8
        if      FW_VERSION >= 311
br_b3c8f:
        mov     si, 19h
        jmp     br_b3cc8
br_b3c94:
        mov     si, 1bh
        jmp     br_b3cc8
br_b3c99:
        mov     si, 1dh
        jmp     br_b3cc8
br_b3c9e:
        mov     si, 1eh
        jmp     br_b3cc8
br_b3ca3:
        mov     si, 1ch
        else
L_bac5b:
        mov     di, 1ch
        endif
        push    0
        callf   SEG_D546:far_d5b6a
        add     sp, 2
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        jmp     br_b3cc8
        if      FW_VERSION >= 311
br_b3cbc:
        mov     si, 1fh
        else
L_bac74:
        endif
        jmp     br_b3cc8
        if      FW_VERSION >= 311
br_b3cc1:
        mov     si, di
        sar     si, 8
        neg     si
        else
L_bac76:
        mov     di, si
        sar     di, 8
        neg     di
        endif
br_b3cc8:
        if      FW_VERSION < 311
        push    si
        endif
        push    di
        if      FW_VERSION >= 311
        push    si
        endif
        push    word ptr [bp - 2]
        nop
        push    cs
        call    far_b3d1d
        add     sp, 6
        if      FW_VERSION >= 311
        mov     ax, di
        else
        mov     ax, si
        endif
        pop     di
        pop     si
        leave
        retf
        if      FW_VERSION < 311
L_bac90:
        dw      L_bac42
        dw      L_bac47
        dw      L_bac42
        dw      L_bac74
        dw      L_bac74
        dw      L_bac74
        dw      L_bac51
        endif
far_b3cdb:
        push    bp
        mov     bp, sp
        callf   SEG_B1AA:far_b1aac
        push    ds
        push    word STR_1DDA
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp + 0ah]
        push    ax
        mov     al, byte ptr [bp + 8]
        push    ax
        mov     al, byte ptr [bp + 6]
        push    ax
        callf   SEG_CDE9:far_d4dcd
        add     sp, 6
        push    ds
        push    word A_D4C3
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        pop     bp
        retf
far_b3d1d:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 2
        endif
        push    si
        push    di
        mov     si, word ptr [bp + 6]
        if      FW_VERSION >= 311
        mov     di, word ptr [bp + 0ah]
        endif
        mov     byte ptr [B_9455], 1
        if      FW_VERSION >= 311
        mov     word ptr [bp - 2], 0
        else
        xor     di, di
        endif
        cmp     byte ptr [B_96EF], 0
        jz      br_b3d46
        callf   SEG_C0EE:far_c12e7
        if      FW_VERSION >= 311
        mov     word ptr [bp - 2], 1
        else
        mov     di, 1
        endif
br_b3d46:
        push    word ptr [bp + 8]
        push    si
        push    66h
        push    cs
        call    far_b3cdb
        add     sp, 6
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_1DE5
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        or      si, si
        jnz     br_b3dbc
        if      FW_VERSION >= 311
        cmp     word ptr [W_7AA8], 0
        jnz     br_b3d8f
        endif
        push    16h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        if      FW_VERSION >= 311
        push    di
        else
        push    word ptr [bp + 0ah]
        endif
        push    ds
        push    word STR_1DEC
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
        if      FW_VERSION >= 311
        jmp     br_b3dbc
br_b3d8f:
        push    18h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        mov     al, byte ptr [B_7AA6]
        mov     ah, 0
        push    ax
        mov     al, byte ptr [B_7AA7]
        mov     ah, 0
        push    ax
        push    word ptr [W_7AA8]
        push    di
        push    ds
        push    word STR_1DFF
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ch
        mov     word ptr [W_7AA8], 0
        endif
br_b3dbc:
        nop
        push    cs
        call    far_b3dda
        if      FW_VERSION >= 311
        cmp     word ptr [bp - 2], 0
        else
        or      di, di
        endif
        jz      br_b3dd1
        push    4dh
        callf   SEG_D79E:far_d7a63
        add     sp, 2
br_b3dd1:
        mov     byte ptr [B_9455], 0
        pop     di
        pop     si
        if      FW_VERSION >= 311
        leave
        else
        pop     bp
        endif
        retf
far_b3dda:
        push    bp
        mov     bp, sp
        sub     sp, 2
loop_b3de0:
        callf   SEG_D79E:far_d79ee
        mov     word ptr [bp - 2], ax
        cmp     word ptr [bp - 2], 4dh
        jnz     br_b3dfc
        mov     al, byte ptr [bp - 2]
        push    ax
        callf   SEG_D79E:far_d7a63
        add     sp, 2
        jmp     br_b3e02
br_b3dfc:
        cmp     word ptr [bp - 2], 78h
        jnz     loop_b3de0
br_b3e02:
        mov     ax, word ptr [bp - 2]
        leave
        retf
        if      FW_VERSION >= 311
        phase   7
        else
        phase   9
        endif
far_b3e07:
        push    bp
        mov     bp, sp
        sub     sp, 14h
        push    ds
        push    word STR_1E16
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        push    3
        push    ds
        push    word P_0030
        push    ds
        push    word B_8805
        push    ds
        push    word STR_1E25
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    8
        push    63h
        push    1
        push    2
        push    ds
        push    word B_83CF
        push    ds
        push    word STR_1E2D
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    ss
        lea     ax, [bp - 14h]
        push    ax
        push    0ffffh
        mov     al, byte ptr [B_83CF]
        cbw
        push    ax
        callf   SEG_E4D1:far_e4d15
        add     sp, 8
        push    10h
        push    ss
        lea     ax, [bp - 14h]
        push    ax
        push    ds
        if      FW_VERSION >= 311
        push    word lbl_dash
        else
        push    word lbl_dash
        endif
        callf   SEG_B347:far_b3471
        add     sp, 0ah
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_1E3B
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        if      FW_VERSION >= 311
        push    word STR_1E63
        else
        push    word STR_1E63
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        jmp     br_b3eeb
loop_b3e99:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jz      br_b3ead
        cmp     ax, 1
        jz      br_b3ec8
        cmp     ax, 2
        jz      br_b3eb4
        jmp     br_b3eeb
br_b3ead:
        callf   SEG_DEEA:far_deeab
        jmp     br_b3eeb
br_b3eb4:
        push    ss
        lea     ax, [bp - 14h]
        push    ax
        push    0ffffh
        mov     al, byte ptr [B_83CF]
        cbw
        push    ax
        callf   SEG_E57C:far_e57c8
        add     sp, 8
br_b3ec8:
        push    ss
        lea     ax, [bp - 14h]
        push    ax
        push    0ffffh
        mov     al, byte ptr [B_83CF]
        cbw
        push    ax
        callf   SEG_E4D1:far_e4d15
        add     sp, 8
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        callf   SEG_DEEA:far_deeab
br_b3eeb:
        push    0
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jz      loop_b3e99
        leave
        retf
        if      FW_VERSION >= 311
        phase   0eh
        else
        phase   0
        endif
far_b3efe:
        push    bp
        mov     bp, sp
        sub     sp, 3ah
        push    si
        push    di
        push    ds
        if      FW_VERSION >= 311
        push    word STR_1EB5
        else
        push    word STR_1EB5
        endif
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        mov     al, byte ptr [B_D5DE]
        mov     byte ptr [B_D4C2], al
        mov     al, byte ptr [B_D612]
        cbw
        mov     word ptr [bp - 14h], ax
        cmp     byte ptr [B_7FCC], 0
        jnz     br_b3f2b
        mov     byte ptr [B_D612], 0
br_b3f2b:
        mov     al, byte ptr [B_8800]
        mov     ah, 0
        or      ax, ax
        jnz     br_b3f42
        mov     al, byte ptr [B_8804]
        mov     ah, 0
        push    ax
        callf   SEG_E671:far_e6715
        add     sp, 2
br_b3f42:
        mov     al, byte ptr [B_8803]
        inc     al
        mov     byte ptr [B_A5CE], al
        mov     al, byte ptr [B_8804]
        mov     ah, 0
        mov     word ptr [bp - 10h], ax
        push    0
        push    14h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 10h]
        push    ax
        push    ds
        push    word STR_1EBF
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    ss
        lea     ax, [bp - 3ah]
        push    ax
        mov     ax, word ptr [bp - 10h]
        dec     ax
        push    ax
        callf   SEG_E65B:far_e65be
        add     sp, 6
        push    10h
        push    ss
        lea     ax, [bp - 3ah]
        push    ax
        push    ds
        push    word A_1EC5
        callf   SEG_B347:far_b3471
        add     sp, 0ah
        mov     al, byte ptr [B_8804]
        mov     ah, 0
        dec     ax
        mov     si, ax
        mov     al, byte ptr [si + TBL_A79B]
        mov     byte ptr [bp - 15h], al
        push    19h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    7
        push    ds
        if      FW_VERSION >= 311
        push    word P_1E88
        else
        push    word lbl_simul_seq_ptrs
        endif
        push    ss
        lea     ax, [bp - 15h]
        push    ax
        push    ds
        push    word STR_1EC7
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        mov     al, byte ptr [si + TBL_A787]
        mov     ah, 0
        mov     word ptr [bp - 8], ax
        or      ax, ax
        jg      br_b3fda
        mov     al, 1
        mov     byte ptr [si + TBL_A787], al
        mov     ah, 0
        mov     word ptr [bp - 8], ax
br_b3fda:
        push    0
        push    word 0fah
        push    1
        push    3
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    ds
        if      FW_VERSION >= 311
        push    word P_1EA5+3
        else
        push    word P_1EA5+3
        endif
        callf   SEG_B347:far_b3819
        add     sp, 10h
        cmp     byte ptr [bp - 15h], 0
        jnz     br_b4012
        push    25h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_1ECD
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_b4012:
        push    si
        nop
        push    cs
        call    fn_b48a4
        add     sp, 2
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0ah
        push    63h
        push    0
        push    2
        push    ds
        push    word B_E56E
        push    ds
        push    word STR_1ED1
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0ah
        push    3bh
        push    0
        push    2
        push    ds
        push    word B_E56D
        push    ds
        push    word A_1EC3
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0ah
        push    3bh
        push    0
        push    2
        push    ds
        push    word B_E56C
        push    ds
        push    word A_1EC3
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0ah
        push    1dh
        push    0
        push    2
        push    ds
        push    word B_E56B
        push    ds
        push    word A_1EC3
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0ah
        push    63h
        push    0
        push    2
        push    ds
        push    word TBL_E56A
        push    ds
        if      FW_VERSION >= 311
        push    word P_1EDE
        else
        push    word P_1EDE
        endif
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    word 0fah
        push    1
        push    3
        push    ds
        push    word B_A5CE
        push    ds
        push    word STR_1EE0
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    ds
        push    word STR_1EFC
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     al, byte ptr [B_A5CE]
        mov     ah, 0
        shl     ax, 1
        push    ax
        mov     ax, si
        mov     dx, 1f4h
        imul    dx
        pop     dx
        add     ax, dx
        mov     di, ax
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_A7AD]
        mov     ah, 0
        mov     word ptr [bp - 6], ax
        cmp     word ptr [bp - 6], 0
        jnz     br_b40ff
        mov     ax, 1
        mov     word ptr [bp - 6], ax
        mov     byte ptr [di + TBL_A7AD], al
br_b40ff:
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_A5CE]
        mov     ah, 0
        shl     ax, 1
        push    ax
        mov     ax, si
        mov     dx, 1f4h
        imul    dx
        pop     dx
        add     ax, dx
        mov     dx, TBL_A7AD
        inc     dx
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr [bx]
        mov     ah, 0
        mov     word ptr [bp - 0eh], ax
        push    0
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word STR_1F07
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    ss
        lea     ax, [bp - 28h]
        push    ax
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 6]
        nop
        push    cs
        call    fn_b4873
        add     sp, 8
        push    10h
        push    ss
        lea     ax, [bp - 28h]
        push    ax
        push    ds
        push    word A_1EC5
        callf   SEG_B347:far_b3471
        add     sp, 0ah
        push    19h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0
        push    63h
        push    0
        push    2
        push    ss
        lea     ax, [bp - 0eh]
        push    ax
        push    ds
        push    word STR_1F0D
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 6]
        nop
        push    cs
        call    fn_b47bb
        add     sp, 4
        callf   SEG_BF29:far_bffc9
        push    ds
        push    word STR_1F1B
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     word ptr [bp - 4], 0
        jmp     tgt_b4753
br_b41b5:
        push    4
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 12h], 0
        cmp     ax, 47h
        jnz     br_b41cf
        jmp     tgt_b4753
br_b41cf:
        cmp     ax, 50h
        jz      br_b41d7
        jmp     br_b42b8
br_b41d7:
        mov     al, byte ptr [B_A5CE]
        mov     ah, 0
        mov     dl, byte ptr [B_8803]
        mov     dh, 0
        inc     dx
        cmp     ax, dx
        jnz     br_b41ea
        jmp     tgt_b4753
br_b41ea:
        mov     al, byte ptr [B_8803]
        inc     al
        mov     byte ptr [B_A5CE], al
        mov     ah, 0
        shl     ax, 1
        push    ax
        mov     ax, si
        mov     dx, 1f4h
        imul    dx
        pop     dx
        add     ax, dx
        mov     di, ax
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_A7AD]
        mov     ah, 0
        mov     word ptr [bp - 6], ax
        mov     bx, TBL_A7AD
        inc     bx
        mov     al, byte ptr [bx+di]
        mov     ah, 0
        mov     word ptr [bp - 0eh], ax
        push    ss
        lea     ax, [bp - 28h]
        push    ax
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 6]
        nop
        push    cs
        call    fn_b4873
        add     sp, 8
        push    ss
        lea     ax, [bp - 3ah]
        push    ax
        push    si
        callf   SEG_E65B:far_e65be
        add     sp, 6
        push    si
        nop
        push    cs
        call    fn_b48a4
        add     sp, 2
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    4
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    5
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    6
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    7
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    8
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    9
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    0ah
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    0bh
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    0ch
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 6]
        nop
        push    cs
        call    fn_b47bb
        add     sp, 4
        jmp     tgt_b4753
br_b42b8:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     word ptr [bp - 0ah], ax
        push    si
        nop
        push    cs
        call    fn_b484b
        add     sp, 2
        mov     word ptr [bp - 0ch], ax
        mov     bx, word ptr [bp - 2]
        sub     bx, 6dh
        cmp     bx, 0dh
        ja      tgt_b4345
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_b479f]
tgt_b42dd:
        mov     byte ptr [B_D5DD], 1
        nop
        push    cs
        call    fn_b4a03
        mov     word ptr [bp - 2], ax
        jmp     tgt_b4345
tgt_b42ec:
        mov     byte ptr [B_D5DD], 4
        nop
        push    cs
        call    fn_b4e71
        mov     word ptr [bp - 2], ax
        jmp     tgt_b4345
tgt_b42fb:
        cmp     word ptr [bp - 2], 75h
        jnz     br_b4307
        inc     byte ptr [B_A5CE]
        jmp     br_b4312
br_b4307:
        cmp     byte ptr [B_A5CE], 1
        jbe     br_b4312
        dec     byte ptr [B_A5CE]
br_b4312:
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 0ah], 9
        jmp     tgt_b4345
tgt_b431e:
        mov     al, byte ptr [B_D4B1]
        cbw
        mov     word ptr [bp - 10h], ax
        cmp     word ptr [bp - 10h], 1
        jge     br_b4330
        mov     word ptr [bp - 10h], 1
br_b4330:
        cmp     word ptr [bp - 10h], 14h
        jle     br_b433b
        mov     word ptr [bp - 10h], 14h
br_b433b:
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 0ah], 0
tgt_b4345:
        cmp     word ptr [bp - 2], 0
        jz      br_b434e
        jmp     br_b475c
br_b434e:
        callf   SEG_E6FE:far_e6fef
        callf   SEG_D78B:far_d78b2
        mov     bx, word ptr [bp - 0ah]
        cmp     bx, 0ch
        jbe     br_b4363
        jmp     tgt_b4532
br_b4363:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_b4785]
tgt_b436a:
        mov     byte ptr [B_A5CE], 1
        jmp     tgt_b4532
tgt_b4372:
        push    ss
        lea     ax, [bp - 3ah]
        push    ax
        push    si
        callf   SEG_E65B:far_e664d
        add     sp, 6
        push    ss
        lea     ax, [bp - 3ah]
        push    ax
        push    si
        callf   SEG_E65B:far_e65be
        add     sp, 6
        mov     byte ptr [bp - 16h], al
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [bp - 16h]
        cbw
        or      ax, ax
        jz      br_b43a6
        jmp     tgt_b4532
br_b43a6:
        mov     ax, si
        mov     dx, 1f4h
        imul    dx
        mov     cx, ax
        mov     bx, ax
        mov     byte ptr [bx + TBL_A7B0], 1
        mov     al, byte ptr [B_A5CE]
        mov     ah, 0
        shl     ax, 1
        mov     bx, cx
        add     bx, ax
        mov     di, bx
        mov     al, byte ptr [bp - 6]
        mov     byte ptr [bx + TBL_A7AD], al
        mov     bx, TBL_A7AD
        inc     bx
        mov     al, byte ptr [bx+di]
        mov     ah, 0
        mov     word ptr [bp - 0eh], ax
        push    ss
        lea     ax, [bp - 28h]
        push    ax
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 6]
        nop
        push    cs
        call    fn_b4873
        add     sp, 8
        push    ss
        lea     ax, [bp - 3ah]
        push    ax
        push    si
        callf   SEG_E65B:far_e65be
        add     sp, 6
        nop
        push    cs
        call    fn_b498e
        mov     byte ptr [B_8802], 0
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    0bh
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    0ch
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    word ptr [bp - 6]
        nop
        push    cs
        call    fn_b4927
        add     sp, 2
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 6]
        nop
        push    cs
        call    fn_b47bb
        add     sp, 4
        push    0
        callf   SEG_EA92:far_ea926
        add     sp, 2
        jmp     tgt_b4532
tgt_b4444:
        mov     byte ptr [B_8802], 0
        jmp     tgt_b4532
tgt_b444c:
        push    ds
        push    word B_901B
        callf   SEG_E5A9:far_e5a99
        add     sp, 4
        mov     al, byte ptr [B_A5CE]
        add     al, 0ffh
        push    ax
        callf   SEG_E56A:far_e5796
        add     sp, 2
        mov     word ptr [bp - 12h], ax
        jmp     near tgt_b4532
tgt_b446c:
        nop
        push    cs
        call    fn_b498e
        mov     byte ptr [B_8802], 0
        mov     al, byte ptr [B_A5CE]
        mov     ah, 0
        shl     ax, 1
        push    ax
        mov     ax, si
        mov     dx, 1f4h
        imul    dx
        pop     dx
        add     ax, dx
        mov     dl, byte ptr [bp - 6]
        mov     bx, ax
        mov     byte ptr [bx + TBL_A7AD], dl
        push    ss
        lea     ax, [bp - 28h]
        push    ax
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 6]
        nop
        push    cs
        call    fn_b4873
        add     sp, 8
        push    0bh
        callf   SEG_B05A:far_b1073
        add     sp, 2
tgt_b44ae:
        push    word ptr [bp - 6]
        nop
        push    cs
        call    fn_b4927
        add     sp, 2
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 6]
        nop
        push    cs
        call    fn_b47bb
        add     sp, 4
        push    0
        callf   SEG_EA92:far_ea926
        add     sp, 2
        jmp     tgt_b4532
tgt_b44d3:
        mov     al, byte ptr [B_7FCB]
        cbw
        mov     di, ax
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_1EB1]
        cmp     al, byte ptr [B_E56B]
        jnc     tgt_b44f2
        mov     byte ptr [B_E56B], al
        push    7
        callf   SEG_B05A:far_b1073
        add     sp, 2
tgt_b44f2:
        push    si
        nop
        push    cs
        call    fn_b48da
        add     sp, 2
        jmp     tgt_b4532
tgt_b44fd:
        cmp     word ptr [bp - 0eh], 0
        jz      br_b4515
        push    ss
        lea     ax, [bp - 28h]
        push    ax
        push    0ffffh
        push    word ptr [bp - 6]
        callf   SEG_E57C:far_e57c8
        add     sp, 8
br_b4515:
        push    ss
        lea     ax, [bp - 28h]
        push    ax
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 6]
        nop
        push    cs
        call    fn_b4873
        add     sp, 8
        push    0bh
        callf   SEG_B05A:far_b1073
        add     sp, 2
tgt_b4532:
        mov     bx, word ptr [bp - 0ah]
        cmp     bx, 0dh
        jbe     br_b453d
        jmp     tgt_b4753
br_b453d:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_b4769]
tgt_b4544:
        cmp     word ptr [bp - 0eh], 0
        jz      br_b454d
        jmp     tgt_b4753
br_b454d:
        mov     word ptr [bp - 0eh], 1
tgt_b4552:
        nop
        push    cs
        call    fn_b498e
        mov     byte ptr [B_8802], 0
        mov     al, byte ptr [B_A5CE]
        mov     ah, 0
        shl     ax, 1
        push    ax
        mov     ax, si
        mov     dx, 1f4h
        imul    dx
        pop     dx
        add     ax, dx
        mov     dx, TBL_A7AD
        inc     dx
        add     ax, dx
        mov     dl, byte ptr [bp - 0eh]
        mov     bx, ax
        mov     byte ptr [bx], dl
        cmp     word ptr [bp - 0eh], 0
        jnz     tgt_b45a0
        cmp     byte ptr [B_A5CE], 1
        jnz     tgt_b45a0
        push    ds
        pop     es
        mov     di, TBL_E56A
        xor     ax, ax
        mov     ah, al
        mov     cx, 2
        rep stosw
        stosb
        push    si
        nop
        push    cs
        call    fn_b48da
        add     sp, 2
tgt_b45a0:
        mov     si, word ptr [bp - 10h]
        dec     si
        push    ss
        lea     ax, [bp - 3ah]
        push    ax
        push    si
        callf   SEG_E65B:far_e65be
        add     sp, 6
        push    si
        nop
        push    cs
        call    fn_b48a4
        add     sp, 2
        push    si
        nop
        push    cs
        call    fn_b484b
        add     sp, 2
        mov     word ptr [bp - 0ch], ax
        mov     al, byte ptr [B_A5CE]
        mov     ah, 0
        cmp     ax, word ptr [bp - 0ch]
        jle     br_b45d7
        mov     al, byte ptr [bp - 0ch]
        mov     byte ptr [B_A5CE], al
br_b45d7:
        push    9
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    4
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    5
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    6
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    7
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    8
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    0
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [B_A5CE]
        mov     ah, 0
        shl     ax, 1
        push    ax
        mov     ax, si
        mov     dx, 1f4h
        imul    dx
        mov     cx, ax
        pop     dx
        add     ax, dx
        mov     di, ax
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_A7AD]
        mov     ah, 0
        mov     word ptr [bp - 6], ax
        cmp     word ptr [bp - 6], 0
        jnz     br_b4658
        mov     ax, 1
        mov     word ptr [bp - 6], ax
        mov     byte ptr [di + TBL_A7AD], al
br_b4658:
        mov     bx, cx
        mov     byte ptr [bx + TBL_A9A2], 0
        mov     bx, TBL_A7AD
        inc     bx
        mov     al, byte ptr [bx+di]
        mov     ah, 0
        mov     word ptr [bp - 0eh], ax
        push    0ah
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    0ch
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    ss
        lea     ax, [bp - 28h]
        push    ax
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 6]
        nop
        push    cs
        call    fn_b4873
        add     sp, 8
        push    0bh
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [si + TBL_A79B]
        mov     byte ptr [bp - 15h], al
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [si + TBL_A787]
        mov     ah, 0
        mov     word ptr [bp - 8], ax
tgt_b46b5:
        mov     al, byte ptr [bp - 15h]
        mov     byte ptr [si + TBL_A79B], al
tgt_b46bc:
        mov     ax, word ptr [bp - 8]
        cmp     ax, word ptr [bp - 0ch]
        jl      br_b46cb
        mov     ax, word ptr [bp - 0ch]
        dec     ax
        mov     word ptr [bp - 8], ax
br_b46cb:
        cmp     word ptr [bp - 8], 1
        jge     br_b46d6
        mov     word ptr [bp - 8], 1
br_b46d6:
        mov     al, byte ptr [bp - 8]
        mov     byte ptr [si + TBL_A787], al
        cmp     byte ptr [bp - 15h], 0
        jnz     br_b46fd
        push    25h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_1ECD
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        if      FW_VERSION >= 311
        jmp     br_b4707
        else
        jmp     L_bb689
        endif
br_b46fd:
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
        if      FW_VERSION >= 311
br_b4707:
        else
L_bb689:
        cmp     word ptr [bp - 0ah], 0
        jz      L_bb69f
        cmp     word ptr [bp - 0ah], 3
        jz      L_bb69f
        push    1
        callf   0d266h:L_d280a
        add     sp, 2
L_bb69f:
        endif
        mov     al, byte ptr [B_8804]
        mov     ah, 0
        cmp     ax, word ptr [bp - 10h]
        jz      br_b471c
        push    word ptr [bp - 10h]
        callf   SEG_E671:far_e6715
        add     sp, 2
br_b471c:
        cmp     word ptr [bp - 12h], 0
        jz      br_b4736
        push    word ptr [bp - 12h]
        push    ds
        push    word B_901B
        callf   SEG_DEEE:far_deee8
        add     sp, 6
        callf   SEG_E561:far_e562e
br_b4736:
        if      FW_VERSION >= 311
        callf   SEG_E682:far_e6890
        else
        callf   SEG_E682:L_ef4d3
        endif
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 6]
        nop
        push    cs
        call    fn_b47bb
        add     sp, 4
        push    0
        callf   SEG_EA92:far_ea926
        add     sp, 2
tgt_b4753:
        cmp     word ptr [bp - 4], 0
        jnz     br_b475c
        jmp     br_b41b5
br_b475c:
        mov     al, byte ptr [bp - 14h]
        mov     byte ptr [B_D612], al
        mov     ax, word ptr [bp - 2]
        pop     di
        pop     si
        leave
        retf
TBL_b4769:
        dw      tgt_b45a0
        dw      tgt_b4753
        dw      tgt_b46b5
        dw      tgt_b46bc
        dw      tgt_b4753
        dw      tgt_b4753
        dw      tgt_b4753
        dw      tgt_b4753
        dw      tgt_b4753
        dw      tgt_b45a0
        dw      tgt_b4544
        dw      tgt_b4753
        dw      tgt_b4552
        dw      tgt_b45a0
TBL_b4785:
        dw      tgt_b436a
        dw      tgt_b4372
        dw      tgt_b4532
        dw      tgt_b4444
        dw      tgt_b44f2
        dw      tgt_b44f2
        dw      tgt_b44f2
        dw      tgt_b44d3
        dw      tgt_b44f2
        dw      tgt_b444c
        dw      tgt_b446c
        dw      tgt_b44fd
        dw      tgt_b44ae
TBL_b479f:
        dw      tgt_b431e
        dw      tgt_b4345
        dw      tgt_b4345
        dw      tgt_b4345
        dw      tgt_b4345
        dw      tgt_b4345
        dw      tgt_b4345
        dw      tgt_b4345
        dw      tgt_b42fb
        dw      tgt_b4345
        dw      tgt_b4345
        dw      tgt_b42dd
        dw      tgt_b42ec
        dw      tgt_b42fb
fn_b47bb:
        push    bp
        mov     bp, sp
        push    si
        xor     si, si
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_1F43
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        cmp     word ptr [bp + 8], 0
        jz      br_b47ec
        push    word ptr [bp + 6]
        callf   SEG_E49D:far_e49dd
        add     sp, 2
        mov     si, ax
br_b47ec:
        push    si
        push    ds
        push    word STR_1F49
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
        or      si, si
        jnz     br_b480a
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        pop     si
        pop     bp
        retf
br_b480a:
        push    19h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    ds
        push    word STR_1F4D
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_EA92:far_eac51
        push    20h
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        mov     al, byte ptr [B_7FCA]
        cbw
        shl     ax, 2
        mov     bx, ax
        push    word ptr [bx + 1feh]
        push    word ptr [bx + 1fch]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        pop     si
        pop     bp
        retf
fn_b484b:
        push    bp
        mov     bp, sp
        push    si
        xor     cx, cx
        mov     ax, word ptr [bp + 6]
        mov     dx, 1f4h
        imul    dx
        add     ax, TBL_A7B0
        mov     si, ax
loop_b485e:
        cmp     byte ptr [si], 0
        jz      br_b486d
        add     si, 2
        inc     cx
        cmp     cx, 0f9h
        jl      loop_b485e
br_b486d:
        mov     ax, cx
        inc     ax
        pop     si
        pop     bp
        retf
fn_b4873:
        push    bp
        mov     bp, sp
        push    si
        push    di
        cmp     word ptr [bp + 8], 0
        jz      br_b4895
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    0ffffh
        push    word ptr [bp + 6]
        callf   SEG_E4D1:far_e4d15
        add     sp, 8
        pop     di
        pop     si
        pop     bp
        retf
br_b4895:
        les     di, dword ptr [bp + 0ah]
        mov     si, STR_1F54
        mov     cx, 7
        rep movsw
        pop     di
        pop     si
        pop     bp
        retf
fn_b48a4:
        push    bp
        mov     bp, sp
        push    si
        mov     ax, word ptr [bp + 6]
        mov     dx, 5
        imul    dx
        mov     si, ax
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_A5CF]
        mov     byte ptr [TBL_E56A], al
        mov     al, byte ptr [si + TBL_A5D0]
        mov     byte ptr [B_E56B], al
        mov     al, byte ptr [si + TBL_A5D1]
        mov     byte ptr [B_E56C], al
        mov     al, byte ptr [si + TBL_A5D2]
        mov     byte ptr [B_E56D], al
        mov     al, byte ptr [si + TBL_A5D3]
        mov     byte ptr [B_E56E], al
        pop     si
        pop     bp
        retf
fn_b48da:
        push    bp
        mov     bp, sp
        push    si
        push    di
        xor     si, si
        mov     ax, word ptr [bp + 6]
        mov     dx, 5
        imul    dx
        add     ax, TBL_A5CF
        mov     di, ax
loop_b48ee:
        mov     al, byte ptr [si + TBL_E56A]
        mov     byte ptr [di], al
        mov     byte ptr [si + TBL_8A93], al
        inc     di
        inc     si
        cmp     si, 5
        jl      loop_b48ee
        push    ds
        push    word A_8A89
        push    ds
        push    word TBL_8A93
        callf   SEG_EB63:far_eb6bd
        add     sp, 8
        push    ds
        push    word W_D5F3
        push    word ptr [W_9047]
        push    word ptr [W_9045]
        callf   SEG_EB86:far_eb86b
        add     sp, 8
        pop     di
        pop     si
        pop     bp
        retf
fn_b4927:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [W_7FC8]
        mov     word ptr [W_8A98], ax
        mov     al, byte ptr [bp + 6]
        push    ax
        callf   SEG_E259:far_e259f
        add     sp, 2
        or      ax, ax
        jnz     br_b494b
        les     bx, dword ptr [W_8C35]
        mov     ax, word ptr es:[bx + 23h]
        mov     word ptr [W_8A98], ax
br_b494b:
        push    0
        push    word ptr [W_D651]
        mov     ax, word ptr [W_8A98]
        cwd
        mov     cl, 0ch
        callf   0f800h:far_fa1ac
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        mov     word ptr [W_D610], ax
        cmp     byte ptr [B_A5CE], 1
        jnz     br_b497a
        mov     word ptr [W_D610], 1000h
        callf   SEG_E707:far_e70e6
        pop     bp
        retf
br_b497a:
        cmp     byte ptr [B_7FCC], 0
        jnz     br_b4987
        mov     word ptr [W_D610], 1000h
br_b4987:
        callf   SEG_DE78:far_de78c
        pop     bp
        retf
fn_b498e:
        mov     al, byte ptr [B_A5CE]
        add     al, 0ffh
        push    ax
        callf   SEG_E56A:far_e5796
        add     sp, 2
        mov     dx, ax
        mov     al, byte ptr [B_8802]
        cmp     al, byte ptr [B_8804]
        jnz     br_b49b5
        push    dx
        push    ds
        push    word B_901B
        callf   SEG_DEEE:far_deee8
        add     sp, 6
        retf
br_b49b5:
        mov     word ptr [W_9053], dx
        mov     byte ptr [B_9052], 1
        mov     byte ptr [W_9051], 0
        retf
fn_b49c4:
        push    bp
        mov     bp, sp
        sub     sp, 14h
        push    ss
        lea     ax, [bp - 14h]
        push    ax
        mov     ax, word ptr [bp + 6]
        dec     ax
        push    ax
        callf   SEG_E65B:far_e65be
        add     sp, 6
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    2dh
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        push    ss
        lea     ax, [bp - 14h]
        push    ax
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        leave
        retf
fn_b4a03:
        push    bp
        mov     bp, sp
        sub     sp, 0ah
        push    si
        push    di
        callf   SEG_E6FE:far_e6fef
        callf   SEG_D78B:far_d78b2
        mov     al, byte ptr [B_8804]
        mov     ah, 0
        dec     ax
        mov     word ptr [bp - 2], ax
        mov     al, byte ptr [B_A5CE]
        mov     ah, 0
        mov     word ptr [bp - 8], ax
        mov     word ptr [bp - 4], ax
        mov     word ptr [bp - 6], ax
        push    ds
        push    word STR_1F62
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    word 0fah
        push    1
        push    3
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ds
        push    word STR_1F83
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    word 0fah
        push    1
        push    3
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word STR_1F94
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 311
        push    word P_1FA3
        else
        push    word P_1FA3
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    13h
        push    6
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 311
        push    word STR_1ECD+1
        else
        push    word STR_1ECD+1
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_203C
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    15h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    ds
        push    word STR_2045
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        xor     si, si
        jmp     br_b4b35
loop_b4adf:
        push    4
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        cmp     si, 79h
        jnz     br_b4af4
        xor     si, si
        jmp     br_b4b35
br_b4af4:
        push    word ptr [bp - 2]
        push    cs
        call    fn_b484b
        add     sp, 2
        mov     di, ax
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jz      br_b4b0f
        cmp     ax, 1
        jz      br_b4b23
        jmp     br_b4b35
br_b4b0f:
        cmp     word ptr [bp - 4], di
        jle     br_b4b17
        mov     word ptr [bp - 4], di
br_b4b17:
        push    0
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_b4b35
br_b4b23:
        cmp     word ptr [bp - 6], di
        jle     br_b4b2b
        mov     word ptr [bp - 6], di
br_b4b2b:
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_b4b35:
        or      si, si
        jz      loop_b4adf
        mov     ax, si
        cmp     ax, 75h
        jnz     br_b4b43
        jmp     br_b4c39
br_b4b43:
        cmp     ax, 78h
        jz      br_b4b53
        cmp     ax, 7ah
        jnz     br_b4b50
        jmp     near br_b4bd8
br_b4b50:
        jmp     br_b4c45
br_b4b53:
        mov     al, byte ptr [bp - 4]
        mov     byte ptr [B_A5CE], al
        add     al, 0ffh
        mov     byte ptr [B_8803], al
        mov     bx, word ptr [bp - 2]
        mov     al, byte ptr [bx + TBL_A787]
        cmp     al, byte ptr [bp - 4]
        jc      br_b4b6e
        inc     byte ptr [bx + TBL_A787]
br_b4b6e:
        mov     cx, 0f8h
        mov     ax, word ptr [bp - 2]
        mov     dx, 1f4h
        imul    dx
        mov     di, ax
        add     ax, 1f0h
        mov     si, ax
        mov     al, byte ptr [B_8803]
        mov     ah, 0
        mov     word ptr [bp - 0ah], ax
        jmp     br_b4b9e
loop_b4b8a:
        mov     al, byte ptr [si + TBL_A7AF]
        mov     byte ptr [si + TBL_A7B1], al
        mov     al, byte ptr [si + TBL_A7B0]
        mov     byte ptr [si + TBL_A7B2], al
        sub     si, 2
        dec     cx
br_b4b9e:
        cmp     word ptr [bp - 0ah], cx
        jle     loop_b4b8a
        mov     ax, word ptr [bp - 0ah]
        shl     ax, 1
        mov     bx, di
        add     bx, ax
        mov     si, bx
        cmp     byte ptr [bx + TBL_A7AF], 0
        jnz     br_b4bba
        mov     byte ptr [si + TBL_A7AF], 1
br_b4bba:
        cmp     byte ptr [si + TBL_A7B0], 0
        jnz     br_b4bc6
        mov     byte ptr [si + TBL_A7B0], 1
br_b4bc6:
        mov     byte ptr [di + TBL_A9A2], 0
        mov     byte ptr [B_8802], 0
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     si, ax
        jmp     br_b4c45
br_b4bd8:
        mov     al, byte ptr [bp - 6]
        mov     byte ptr [B_A5CE], al
        add     al, 0ffh
        mov     byte ptr [B_8803], al
        mov     bx, word ptr [bp - 2]
        mov     al, byte ptr [bx + TBL_A787]
        cmp     al, byte ptr [bp - 6]
        jbe     br_b4bf3
        dec     byte ptr [bx + TBL_A787]
br_b4bf3:
        mov     al, byte ptr [B_8803]
        mov     ah, 0
        mov     word ptr [bp - 0ah], ax
        mov     cx, ax
        mov     ax, word ptr [bp - 2]
        mov     dx, 1f4h
        imul    dx
        mov     dx, cx
        shl     dx, 1
        add     ax, dx
        mov     si, ax
        mov     ax, di
        dec     ax
        mov     dx, ax
        jmp     br_b4c28
loop_b4c14:
        mov     al, byte ptr [si + TBL_A7B1]
        mov     byte ptr [si + TBL_A7AF], al
        mov     al, byte ptr [si + TBL_A7B2]
        mov     byte ptr [si + TBL_A7B0], al
        add     si, 2
        inc     cx
br_b4c28:
        cmp     dx, cx
        jg      loop_b4c14
        mov     byte ptr [B_8802], 0
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     si, ax
        jmp     br_b4c45
br_b4c39:
        mov     byte ptr [B_D5DD], 2
        nop
        push    cs
        call    fn_b4c4b
        mov     si, ax
br_b4c45:
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
fn_b4c4b:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    si
        push    di
        push    ds
        push    word STR_2059
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    14h
        push    1
        push    2
        push    ds
        push    word B_8804
        push    ds
        push    word STR_2065
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0eh
        push    1
        mov     al, byte ptr [B_8804]
        mov     ah, 0
        push    ax
        push    cs
        call    fn_b49c4
        add     sp, 6
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 311
        push    word STR_2072
        else
        push    word STR_2072
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b9102
        push    8
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_20AA
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_b4ce4
loop_b4ccb:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jnz     br_b4ce4
        push    0eh
        push    1
        mov     al, byte ptr [B_8804]
        mov     ah, 0
        push    ax
        push    cs
        call    fn_b49c4
        add     sp, 6
br_b4ce4:
        push    2
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_b4ccb
        cmp     ax, 78h
        jz      br_b4d04
        cmp     ax, 79h
        jnz     br_b4d01
        jmp     br_b4dcf
br_b4d01:
        jmp     br_b4ddb
br_b4d04:
        xor     cx, cx
        xor     si, si
        mov     al, byte ptr [B_8804]
        mov     ah, 0
        mov     word ptr [bp - 6], ax
        mov     dx, 1f4h
        imul    dx
        mov     di, ax
loop_b4d17:
        mov     bx, di
        add     bx, si
        mov     dx, bx
        mov     byte ptr [bx + TBL_A5BB], 0
        mov     ax, TBL_A5BB
        inc     ax
        add     bx, ax
        mov     byte ptr [bx], 0
        add     si, 2
        inc     cx
        cmp     si, 1f4h
        jnz     loop_b4d17
        mov     bx, word ptr [bp - 6]
        mov     byte ptr [bx + TBL_A79A], 0
        mov     byte ptr [bx + TBL_A786], 1
        push    30h
        push    2
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    bx
        callf   SEG_D780:far_d7805
        add     sp, 0ah
        mov     al, byte ptr [bp - 4]
        mov     byte ptr [B_1E98], al
        mov     al, byte ptr [bp - 3]
        mov     byte ptr [B_1E99], al
        mov     ax, ds
        mov     dl, byte ptr [B_8804]
        mov     dh, 0
        mov     word ptr [bp - 6], dx
        mov     bx, 11h
        push    ax
        mov     ax, dx
        imul    bx
        if      FW_VERSION >= 312
        add     ax, 0a622h
        elseif  FW_VERSION = 311
        add     ax, 0a56ah
        else
        add     ax, 0a036h
        endif
        push    ds
        pop     es
        mov     di, STR_1E94
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        pop     si
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        xor     cx, cx
        mov     ax, word ptr [bp - 6]
        mov     dx, 1f4h
        imul    dx
        mov     dx, 5
        imul    dx
loop_b4dae:
        mov     bx, ax
        add     bx, cx
        mov     byte ptr [bx + TBL_A5CA], 0
        inc     cx
        cmp     cx, 5
        jl      loop_b4dae
        mov     byte ptr [B_8802], 0
        mov     byte ptr [B_8803], 0
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     dx, ax
        jmp     br_b4ddb
br_b4dcf:
        mov     byte ptr [B_D5DD], 3
        nop
        push    cs
        call    fn_b4de1
        mov     dx, ax
br_b4ddb:
        mov     ax, dx
        pop     di
        pop     si
        leave
        retf
fn_b4de1:
        push    di
        push    ds
        push    word STR_20BA
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 311
        push    word STR_20CB
        else
        push    word STR_20CB
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b9102
loop_b4e0b:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_b4e0b
        cmp     ax, 78h
        jnz     br_b4e6d
        push    ds
        pop     es
        mov     di, TBL_A7AF
        xor     ax, ax
        mov     ah, al
        mov     cx, 1388h
        rep stosw
        mov     di, TBL_A79B
        mov     ah, al
        mov     cx, 0ah
        rep stosw
        mov     di, TBL_A787
        mov     ax, 1
        mov     ah, al
        mov     cx, 0ah
        rep stosw
        callf   SEG_E65B:far_e66a4
        push    ds
        pop     es
        mov     di, TBL_A5CF
        xor     ax, ax
        mov     ah, al
        mov     cx, 32h
        rep stosw
        mov     byte ptr [B_8803], 0
        mov     byte ptr [B_8802], 0
        mov     byte ptr [B_8804], 1
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     dx, ax
br_b4e6d:
        mov     ax, dx
        pop     di
        retf
fn_b4e71:
        push    bp
        mov     bp, sp
        sub     sp, 6
        callf   SEG_E6FE:far_e6fef
        callf   SEG_D78B:far_d78b2
        mov     al, byte ptr [B_8804]
        mov     ah, 0
        mov     word ptr [bp - 2], ax
        callf   SEG_E600:far_e6006
        mov     word ptr [bp - 4], ax
        push    ds
        push    word STR_20FD
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    14h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ds
        push    word STR_2116
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    14h
        push    1
        push    word ptr [bp - 2]
        push    cs
        call    fn_b49c4
        add     sp, 6
        push    6
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ds
        push    word STR_2129
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    14h
        push    2
        push    word ptr [bp - 4]
        callf   SEG_B702:far_b8f3e
        add     sp, 6
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_2136
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_2154
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b9102
        jmp     br_b4f69
loop_b4f3b:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jz      br_b4f4a
        cmp     ax, 1
        jz      br_b4f5a
        jmp     br_b4f69
br_b4f4a:
        push    14h
        push    1
        push    word ptr [bp - 2]
        push    cs
        call    fn_b49c4
        add     sp, 6
        jmp     br_b4f69
br_b4f5a:
        push    14h
        push    2
        push    word ptr [bp - 4]
        callf   SEG_B702:far_b8f3e
        add     sp, 6
br_b4f69:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_b4f3b
        cmp     dx, 78h
        jnz     br_b4fbc
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_217B
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    word ptr [bp - 4]
        mov     ax, word ptr [bp - 2]
        dec     ax
        push    ax
        callf   SEG_E611:far_e611c
        add     sp, 4
        mov     word ptr [bp - 6], ax
        or      ax, ax
        jz      br_b4fb6
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
br_b4fb6:
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     dx, ax
br_b4fbc:
        mov     ax, dx
        leave
        retf
        if      FW_VERSION >= 311
        phase   0
        else
        phase   8
        endif
far_b4fc0:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    ds
        push    word STR_2190
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        mov     byte ptr [B_D5DD], 4
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_21A0
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        push    word STR_067C_2
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    3
        push    ds
        push    word P_0030
        push    ds
        push    word B_D4B7
        push    ds
        push    word STR_21B7
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        mov     word ptr [bp - 2], 0
loop_b5022:
        if      FW_VERSION >= 311
        push    word ptr [bp - 2]
        else
        mov     al, byte ptr [bp - 2]
        push    ax
        endif
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dl, al
        or      al, al
        jz      loop_b5022
        cbw
        cmp     ax, 78h
        jnz     br_b5042
        nop
        push    cs
        call    fn_b50ea
        mov     dl, byte ptr [B_D5DE]
br_b5042:
        mov     al, dl
        leave
        retf
fn_b5046:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    4
        callf   SEG_B059:far_b059a
        add     sp, 2
        callf   SEG_D7B2:far_d7b2c
        or      ax, ax
        jnz     br_b5062
        jmp     near br_b50e6
br_b5062:
        callf   SEG_D79E:far_d79ee
        mov     word ptr [bp - 2], ax
        cmp     ax, 58h
        jz      br_b50d3
        jg      br_b50a3
        cmp     ax, 50h
        jz      br_b50ca
        jg      br_b5092
        cmp     ax, 4dh
        jz      br_b50ce
        jg      br_b508b
        cmp     ax, 2fh
        jz      br_b50ca
        cmp     ax, 44h
        jz      br_b50ca
        jmp     br_b50e1
br_b508b:
        cmp     ax, 4eh
        jz      br_b50ca
        jmp     br_b50e1
br_b5092:
        cmp     ax, 51h
        jz      br_b50ca
        cmp     ax, 56h
        jz      br_b50d3
        cmp     ax, 57h
        jz      br_b50d3
        jmp     br_b50e1
br_b50a3:
        cmp     ax, 5dh
        jz      br_b50ca
        jg      br_b50bb
        cmp     ax, 59h
        jz      br_b50d3
        cmp     ax, 5ah
        jz      br_b50d3
        cmp     ax, 5bh
        jz      br_b50ca
        jmp     br_b50e1
br_b50bb:
        cmp     ax, 62h
        jz      br_b50ca
        cmp     ax, 7bh
        jz      br_b50ca
        cmp     ax, 7dh
        jnz     br_b50e1
br_b50ca:
        xor     ax, ax
        leave
        retf
br_b50ce:
        mov     ax, 4dh
        leave
        retf
br_b50d3:
        mov     al, byte ptr [bp - 2]
        push    ax
        callf   SEG_DF14:far_df14a
        add     sp, 2
        leave
        retf
br_b50e1:
        mov     ax, 4fh
        leave
        retf
br_b50e6:
        xor     ax, ax
        leave
        retf
fn_b50ea:
        callf   SEG_B1AA:far_b1af9
        callf   SEG_B1AA:far_b1aac
        push    ds
        push    word STR_21C3
        callf   SEG_B1B5:far_b1d48
        add     sp, 4
        callf   SEG_EACB:far_eace6
        push    ax
        callf   SEG_EACB:far_eacb4
        push    ax
        push    ds
        if      FW_VERSION >= 311
        push    word STR_21D5
        else
        push    word STR_21D5
        endif
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        callf   SEG_EACB:far_eacf0
        push    ax
        callf   SEG_EACB:far_eacbe
        push    ax
        push    ds
        if      FW_VERSION >= 311
        push    word STR_21F6
        else
        push    word STR_21F6
        endif
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        callf   SEG_EACB:far_eacfa
        push    ax
        callf   SEG_EACB:far_eacc8
        push    ax
        push    ds
        if      FW_VERSION >= 311
        push    word STR_2217
        else
        push    word STR_2217
        endif
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        callf   SEG_EACB:far_ead04
        push    ax
        callf   SEG_EACB:far_eacd2
        push    ax
        push    ds
        if      FW_VERSION >= 311
        push    word STR_2238
        else
        push    word STR_2238
        endif
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        callf   SEG_EACB:far_ead0e
        push    ax
        callf   SEG_EACB:far_eacdc
        push    ax
        push    ds
        if      FW_VERSION >= 311
        push    word STR_2259
        else
        push    word STR_2259
        endif
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        callf   SEG_D79E:far_d79ee
        callf   SEG_B1AA:far_b1aff
        retf
fn_b5183:
        push    bp
        mov     bp, sp
        mov     cx, word ptr [bp + 6]
        mov     ax, cx
        add     ax, 300h
        mov     dx, 60h
        out     dx, ax
        mov     dx, 62h
        in      ax, dx
        les     bx, dword ptr [bp + 0ch]
        mov     word ptr es:[bx], ax
        mov     dx, 64h
        in      ax, dx
        les     bx, dword ptr [bp + 8]
        mov     word ptr es:[bx], ax
        mov     ax, cx
        add     ax, 400h
        mov     dx, 60h
        out     dx, ax
        mov     dx, 62h
        in      ax, dx
        les     bx, dword ptr [bp + 14h]
        mov     word ptr es:[bx], ax
        mov     dx, 64h
        in      ax, dx
        les     bx, dword ptr [bp + 10h]
        mov     word ptr es:[bx], ax
        pop     bp
        retf
fn_b51c5:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    si
        push    di
        mov     di, word ptr [bp + 6]
        callf   SEG_B1AA:far_b1af9
        callf   SEG_B1AA:far_b1aac
        mov     si, di
        jmp     br_b522a
loop_b51de:
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    si
        push    cs
        call    fn_b5183
        add     sp, 12h
        mov     ax, si
        mov     bx, 8
        cwd
        idiv    bx
        or      dx, dx
        jz      br_b5210
        push    0ah
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
br_b5210:
        push    word ptr [bp - 4]
        push    word ptr [bp - 2]
        push    word ptr [bp - 8]
        push    word ptr [bp - 6]
        push    si
        push    ds
        push    word STR_227A
        callf   SEG_B1B5:far_b1d48
        add     sp, 0eh
        inc     si
br_b522a:
        mov     ax, di
        add     ax, 8
        cmp     ax, si
        jg      loop_b51de
        callf   SEG_D79E:far_d79ee
        callf   SEG_B1AA:far_b1aff
        pop     di
        pop     si
        leave
        retf
fn_b5241:
        push    si
        mov     word ptr [W_E3AA], 0
        xor     si, si
loop_b524a:
        push    si
        push    cs
        call    fn_b51c5
        add     sp, 2
        add     si, 8
        cmp     si, 20h
        jl      loop_b524a
        pop     si
        retf
far_b525c:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp + 0ch]
        cmp     word ptr [bp + 6], 80h
        jc      br_b526f
        xor     ax, ax
        pop     si
        pop     bp
        retf
br_b526f:
        callf   SEG_CDCC:far_cdcc2
        push    1
        push    0
        push    si
        push    word ptr [W_E3A8]
        push    word ptr [W_E3A6]
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        add     word ptr [W_E3A6], si
        adc     word ptr [W_E3A8], 0
        mov     ax, si
        pop     si
        pop     bp
        retf
far_b529d:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp + 0ch]
        cmp     word ptr [bp + 6], 80h
        jc      br_b52b0
        xor     ax, ax
        pop     si
        pop     bp
        retf
br_b52b0:
        callf   SEG_CDCC:far_cdcc2
        push    0
        push    0
        push    si
        push    word ptr [W_E3A8]
        push    word ptr [W_E3A6]
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        add     word ptr [W_E3A6], si
        adc     word ptr [W_E3A8], 0
        mov     ax, si
        pop     si
        pop     bp
        retf
        if      FW_VERSION >= 311
        phase   0eh
        else
        phase   7
        endif
far_b52de:
        push    bp
        mov     bp, sp
        sub     sp, 16h
        if      FW_VERSION >= 311
        push    si
        endif
        mov     byte ptr [B_D5DD], 0
        if      FW_VERSION >= 311
        mov     word ptr [W_7AA8], 0
        endif
        push    ds
        push    word STR_2405
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        push    ds
        if      FW_VERSION >= 311
        push    word P_2427
        else
        push    word P_2427
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        cmp     byte ptr [B_7AD0], 0
        jz      br_b5327
        push    15h
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 311
        push    word STR_24CD
        else
        push    word STR_24CD
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_b5327:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    0ah
        push    ss
        lea     ax, [bp - 1]
        push    ax
        callf   SEG_EBCC:far_ebcce
        add     sp, 8
        if      FW_VERSION >= 311
        mov     si, ax
        or      si, si
        else
        mov     dx, ax
        or      dx, dx
        endif
        jz      br_b534d
        jmp     br_b5513
br_b534d:
        mov     al, byte ptr [bp - 1]
        mov     byte ptr [B_D5DD], al
        cbw
        dec     ax
        mov     bx, ax
        cmp     bx, 9
        jbe     br_b535f
        jmp     br_b5513
br_b535f:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_b5522]
tgt_b5366:
        if      FW_VERSION >= 311
        push    1
        callf   SEG_D793:far_d796d
        add     sp, 2
        endif
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        if      FW_VERSION >= 311
        callf   SEG_C6D1:far_c6f79
        else
        callf   SEG_C6D1:fn_c6d1f
        endif
        add     sp, 2
        if      FW_VERSION >= 311
        mov     si, ax
        push    0
        callf   SEG_D793:far_d796d
        add     sp, 2
        else
        mov     dx, ax
        endif
        jmp     br_b5513
        if      FW_VERSION < 311
tgt_b54de:
        mov     word ptr [W_E570], 0
        jmp     L_bc44d
        endif
br_b538c:
        mov     al, byte ptr [bp - 1]
        mov     byte ptr [B_D5DD], al
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        nop
        push    cs
        call    fn_b56ff
        add     sp, 4
        if      FW_VERSION >= 311
        mov     si, ax
        mov     bx, si
        cmp     bx, 0fffbh
        else
        mov     dx, ax
        mov     bx, dx
        cmp     bx, 0fffch
        endif
        jnz     br_b53ab
        jmp     near br_b545c
br_b53ab:
        jg      br_b53bf
        if      FW_VERSION >= 311
        sub     bx, 0fff6h
        else
        sub     bx, 0fff7h
        endif
        cmp     bx, 4
        jbe     br_b53b8
        if      FW_VERSION >= 311
        jmp     tgt_b54de
        else
        jmp     L_bc44d
        endif
br_b53b8:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_b5518]
br_b53bf:
        if      FW_VERSION < 311
        cmp     bx, 0ffffh
        jz      L_bc365
        jg      br_b53d3
        cmp     bx, 0fffdh
        jz      br_b5440
        endif
        cmp     bx, 0fffeh
        if      FW_VERSION >= 311
        jz      br_b53ff
        jg      br_b53d3
        cmp     bx, 0fffch
        jz      br_b5440
        cmp     bx, 0fffdh
        jz      br_b542e
        jmp     tgt_b54de
        else
        jz      L_bc381
        jmp     L_bc44d
        endif
br_b53d3:
        if      FW_VERSION >= 311
        cmp     bx, 0ffffh
        jz      br_b53e3
        endif
        cmp     bx, 75h
        jnz     br_b53e0
        jmp     br_b54d1
br_b53e0:
        if      FW_VERSION >= 311
        jmp     tgt_b54de
br_b53e3:
        else
        jmp     L_bc44d
L_bc365:
        endif
        inc     byte ptr [B_956A]
        push    2
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        callf   SEG_BBD9:far_bbd9c
        add     sp, 6
        if      FW_VERSION >= 311
        mov     si, ax
        else
        mov     dx, ax
        endif
        dec     byte ptr [B_956A]
        if      FW_VERSION >= 311
        jmp     tgt_b54de
br_b53ff:
        else
        jmp     L_bc44d
L_bc381:
        endif
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        callf   SEG_D8B9:far_d8b9c
        add     sp, 4
        if      FW_VERSION >= 312
        mov     si, ax
        cmp     si, 4
        jl      br_b5420
        jmp     near tgt_b54de
        elseif  FW_VERSION = 311
        mov     si, ax
        or      si, si
        jnz     br_b5420
        jmp     near tgt_b54de
        else
        mov     dx, ax
        or      dx, dx
        jnz     br_b5420
        jmp     near L_bc44d
        endif
br_b5420:
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        if      FW_VERSION >= 311
        xor     si, si
        jmp     near tgt_b54de
br_b542e:
        else
        xor     dx, dx
        jmp     near L_bc44d
br_b5440:
        endif
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        callf   SEG_BD64:far_bd688
        add     sp, 4
        if      FW_VERSION >= 311
        mov     si, ax
        jmp     near tgt_b54de
br_b5440:
        else
        mov     dx, ax
        jmp     near L_bc44d
br_b545c:
        endif
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        callf   SEG_BD64:far_bda63
        add     sp, 4
        if      FW_VERSION >= 311
        mov     si, ax
        else
        mov     dx, ax
        endif
        or      byte ptr [B_955B], 40h
        or      byte ptr [B_955C], 80h
        if      FW_VERSION >= 311
        jmp     near tgt_b54de
br_b545c:
        else
        jmp     L_bc44d
tgt_b546d:
        endif
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        nop
        push    cs
        call    fn_b5d64
        add     sp, 4
        if      FW_VERSION >= 311
        mov     si, ax
        jmp     tgt_b54de
tgt_b546d:
        else
        mov     dx, ax
        jmp     L_bc44d
tgt_b5488:
        endif
        inc     byte ptr [B_956A]
        push    5
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        callf   SEG_BBD9:far_bbd9c
        add     sp, 6
        if      FW_VERSION >= 311
        mov     si, ax
        else
        mov     dx, ax
        endif
        dec     byte ptr [B_956A]
        if      FW_VERSION >= 311
        jmp     tgt_b54de
tgt_b5488:
        else
        jmp     L_bc44d
tgt_b549a:
        endif
        push    0ffd9h
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        if      FW_VERSION >= 311
        mov     si, ax
        jmp     tgt_b54de
tgt_b549a:
        else
        mov     dx, ax
        jmp     L_bc44d
tgt_b54ad:
        endif
        push    0
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        callf   SEG_BE35:far_be357
        add     sp, 6
        if      FW_VERSION >= 311
        mov     si, ax
        jmp     tgt_b54de
tgt_b54ad:
        else
        mov     dx, ax
        jmp     L_bc44d
tgt_b54c0:
        endif
        push    0
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        callf   SEG_BE35:far_be846
        add     sp, 6
        if      FW_VERSION >= 311
        mov     si, ax
        jmp     tgt_b54de
tgt_b54c0:
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        nop
        push    cs
        call    fn_b5b06
        add     sp, 4
        mov     si, ax
        jmp     tgt_b54de
        else
        mov     dx, ax
        jmp     L_bc44d
        endif
br_b54d1:
        nop
        push    cs
        call    far_b60ee
        if      FW_VERSION >= 311
        mov     si, ax
        else
        mov     dx, ax
        endif
        mov     word ptr [W_E570], 0
        if      FW_VERSION >= 311
tgt_b54de:
        or      si, si
        else
L_bc44d:
        or      dx, dx
        endif
        jnz     br_b54e5
        jmp     br_b538c
br_b54e5:
        jmp     br_b5513
tgt_b54e7:
        callf   SEG_BAA4:far_bb9e3
        if      FW_VERSION >= 311
        mov     si, ax
        else
        mov     dx, ax
        endif
        jmp     br_b5513
tgt_b54f0:
        nop
        push    cs
        call    fn_b61d5
        if      FW_VERSION >= 311
        mov     si, ax
        else
        mov     dx, ax
        endif
        jmp     br_b5513
tgt_b54f9:
        if      FW_VERSION >= 311
        xor     si, si
        else
        xor     dx, dx
        endif
        cmp     byte ptr [B_7AD0], 0
        jz      br_b5509
        nop
        push    cs
        call    far_b60ee
        if      FW_VERSION >= 311
        mov     si, ax
        else
        mov     dx, ax
        endif
br_b5509:
        if      FW_VERSION >= 311
        or      si, si
        else
        or      dx, dx
        endif
        jnz     br_b5513
        mov     al, byte ptr [B_D5DE]
        cbw
        if      FW_VERSION >= 311
        mov     si, ax
        else
        mov     dx, ax
        endif
br_b5513:
        if      FW_VERSION >= 311
        mov     ax, si
        pop     si
        else
        mov     ax, dx
        endif
        leave
        retf
TBL_b5518:
        dw      tgt_b54c0
        dw      tgt_b54ad
        dw      tgt_b549a
        dw      tgt_b5488
        dw      tgt_b546d
TBL_b5522:
        dw      tgt_b5366
        dw      tgt_b5366
        dw      tgt_b5366
        dw      tgt_b5366
        dw      tgt_b5366
        dw      tgt_b5366
        dw      tgt_b54de
        dw      tgt_b54e7
        dw      tgt_b54f0
        dw      tgt_b54f9
far_b5536:
        push    bp
        mov     bp, sp
        push    si
        push    di
        les     bx, dword ptr [bp + 6]
        mov     ax, word ptr es:[bx + 2]
        mov     si, word ptr es:[bx]
        les     bx, dword ptr [bp + 0ah]
        les     di, dword ptr es:[bx]
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        mov     ax, ds
        pop     ds
        push    ax
        xor     ax, ax
        repe cmpsb
        pop     ds
        jz      br_b5567
        sbb     ax, ax
        sbb     ax, 0ffffh
br_b5567:
        pop     di
        pop     si
        pop     bp
        retf
fn_b556b:
        push    bp
        mov     bp, sp
        sub     sp, 0ch
        push    si
        push    di
        push    18h
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    far_b6aab
        add     sp, 8
        les     bx, dword ptr [bp + 0ah]
        cmp     byte ptr es:[bx + 0bh], 0
        jz      br_b55a2
        mov     ax, 10h
        jmp     br_b55a5
br_b55a2:
        mov     ax, 8
br_b55a5:
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 6], 0ffffh
        mov     word ptr [bp - 4], 0
        if      FW_VERSION >= 311
        mov     dx, 229ch
        else
        mov     dx, 221ah
        endif
        mov     ax, word ptr [bp + 0ah]
        add     ax, word ptr [bp - 2]
        mov     word ptr [bp - 0ch], ax
        jmp     br_b55f8
loop_b55c0:
        mov     ax, word ptr [bp + 0ch]
        mov     si, word ptr [bp - 0ch]
        mov     bx, dx
        les     di, dword ptr [bx]
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        mov     ax, ds
        pop     ds
        push    ax
        xor     ax, ax
        repe cmpsb
        pop     ds
        jz      br_b55e6
        sbb     ax, ax
        sbb     ax, 0ffffh
br_b55e6:
        or      ax, ax
        jnz     br_b55f2
        mov     ax, word ptr [bp - 4]
        mov     word ptr [bp - 6], ax
        jmp     br_b5601
br_b55f2:
        add     dx, 4
        inc     word ptr [bp - 4]
br_b55f8:
        mov     bx, dx
        mov     ax, word ptr [bx]
        or      ax, word ptr [bx + 2]
        jnz     loop_b55c0
br_b5601:
        mov     bx, word ptr [bp - 6]
        sub     bx, 2
        cmp     bx, 9
        ja      tgt_b566d
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_b56eb]
tgt_b5613:
        mov     word ptr [bp - 6], 9
tgt_b5618:
        push    0
        push    word 400h
        callf   SEG_E2CE:far_e2ce3
        add     ax, 0fe70h
        adc     dx, 0ffffh
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        mov     word ptr [bp - 8], ax
        push    ax
        push    ds
        push    word STR_24DC
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        jmp     br_b56e4
tgt_b566d:
        push    0
        push    word 400h
        callf   SEG_CC84:far_cca70
        shl     ax, 1
        rcl     dx, 1
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        mov     word ptr [bp - 0ah], ax
        push    ax
        push    ds
        push    word STR_24EB
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
        cmp     word ptr [bp - 6], 2
        jl      br_b569e
        cmp     word ptr [bp - 6], 5
        jnz     br_b56b8
br_b569e:
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_24FA
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_b56e4
br_b56b8:
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
br_b56e4:
        mov     ax, word ptr [bp - 6]
        pop     di
        pop     si
        leave
        retf
TBL_b56eb:
        dw      tgt_b5618
        dw      tgt_b5618
        dw      tgt_b5618
        dw      tgt_b566d
        dw      tgt_b566d
        dw      tgt_b566d
        dw      tgt_b566d
        dw      tgt_b5613
        dw      tgt_b5613
        dw      tgt_b5613
fn_b56ff:
        push    bp
        mov     bp, sp
        sub     sp, 3652h
        push    si
        push    di
        mov     byte ptr [B_D5DD], 7
        push    ds
        push    word A_2317
        nop
        push    cs
        call    far_b6cd3
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_2542
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     si, 10h
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 0
        push    ss
        pop     es
        lea     di, [bp - 36h]
        mov     ax, 3fh
        mov     ah, al
        mov     cx, 0ah
        rep stosw
        mov     byte ptr [bp+si - 33h], 0
        mov     word ptr [bp - 83dh], 0
        mov     word ptr [bp - 38h], 0
        mov     word ptr [bp - 3ah], 0
        xor     si, si
        jmp     br_b5861
br_b5769:
        or      si, si
        jnz     br_b5783
        push    ss
        lea     ax, [bp - 22h]
        push    ax
        push    ss
        lea     ax, [bp - 36h]
        push    ax
        callf   SEG_CAA9:far_cac0f
        add     sp, 8
        mov     dx, ax
        jmp     br_b5797
br_b5783:
        push    ss
        lea     ax, [bp - 22h]
        push    ax
        push    ss
        lea     ax, [bp - 36h]
        push    ax
        callf   SEG_CAA9:far_cac7b
        add     sp, 8
        mov     dx, ax
br_b5797:
        or      dx, dx
        jge     br_b57fb
        cmp     dx, 0fd00h
        jz      br_b57b2
        push    dx
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_b57b2:
        mov     ax, si
        mov     dx, 17h
        imul    dx
        lea     dx, [bp - 363dh]
        add     ax, dx
        mov     bx, ax
        mov     word ptr ss:[bx], 0
        mov     bx, si
        shl     bx, 2
        lea     ax, [bp - 83ah]
        add     bx, ax
        mov     word ptr ss:[bx + 2], 0
        mov     word ptr ss:[bx], 0
        or      si, si
        jz      br_b57e3
        jmp     near br_b586a
br_b57e3:
        mov     word ptr [bp - 838h], ds
        mov     word ptr [bp - 83ah], STR_2300
        mov     word ptr [bp - 834h], 0
        mov     word ptr [bp - 836h], 0
        jmp     br_b586a
br_b57fb:
        mov     ax, si
        mov     dx, 17h
        imul    dx
        mov     dx, ss
        lea     bx, [bp - 3652h]
        add     ax, bx
        mov     bx, si
        shl     bx, 2
        lea     cx, [bp - 83ah]
        add     bx, cx
        mov     word ptr ss:[bx + 2], dx
        mov     word ptr ss:[bx], ax
        push    dx
        push    ax
        push    ss
        lea     ax, [bp - 1bh]
        push    ax
        nop
        push    cs
        call    far_b6beb
        add     sp, 8
        push    0
        push    word 400h
        mov     ax, word ptr [bp - 1fh]
        mov     dx, word ptr [bp - 21h]
        add     dx, 3ffh
        adc     ax, 0
        push    ax
        push    dx
        callf   0f800h:far_fa0fe
        push    ax
        mov     ax, si
        mov     dx, 17h
        imul    dx
        lea     dx, [bp - 363dh]
        add     ax, dx
        mov     bx, ax
        pop     ax
        mov     word ptr ss:[bx], ax
        mov     word ptr [bp - 2], 1
        inc     word ptr [bp - 4]
        inc     si
br_b5861:
        cmp     si, 200h
        jge     br_b586a
        jmp     br_b5769
br_b586a:
        if      FW_VERSION >= 311
        mov     ax, word ptr [W_E570]
        cmp     ax, word ptr [bp - 4]
        jc      br_b5878
        mov     word ptr [W_E570], 0
br_b5878:
        endif
        cmp     word ptr [bp - 4], 1
        jle     br_b58b9
        push    word ptr [bp - 4]
        push    ss
        lea     ax, [bp - 83ah]
        push    ax
        nop
        push    cs
        call    fn_b6cf0
        add     sp, 6
        push    word SEG_B52D
        if      FW_VERSION >= 312
        push    word 266h
        elseif  FW_VERSION = 311
        push    word 265h
        else
        push    word 234h
        endif
        push    4
        push    word ptr [bp - 4]
        push    ss
        lea     ax, [bp - 83ah]
        push    ax
        callf   0f800h:far_fa6e5
        add     sp, 0ch
        push    word ptr [bp - 4]
        push    ss
        lea     ax, [bp - 83ah]
        push    ax
        nop
        push    cs
        call    fn_b6dd7
        add     sp, 6
br_b58b9:
        mov     si, 0ffffh
br_b58bc:
        push    ds
        push    word A_2317
        nop
        push    cs
        call    far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    14h
        push    ss
        lea     ax, [bp - 83ah]
        push    ax
        push    ds
        push    word W_E570
        push    ds
        if      FW_VERSION >= 311
        push    word STR_2552_2
        callf   SEG_B347:far_b353b
        else
        push    word STR_2552_2
        callf   SEG_B347:L_ba3f7
        endif
        add     sp, 0eh
        mov     bx, word ptr [W_E570]
        shl     bx, 2
        lea     ax, [bp - 83ah]
        add     bx, ax
        les     bx, dword ptr ss:[bx]
        push    word ptr es:[bx + 15h]
        nop
        push    cs
        call    fn_b5aab
        add     sp, 2
        cmp     byte ptr [B_7AD0], 0
        jz      br_b5939
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_7AC3]
        if      FW_VERSION >= 311
        mov     ah, 0
        else
        cbw
        endif
        shl     ax, 2
        mov     bx, ax
        push    word ptr [bx +TBL_060E]
        push    word ptr [bx +TBL_060C]
        push    ds
        push    word STR_2558
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
br_b5939:
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        mov     bx, word ptr [W_E570]
        shl     bx, 2
        lea     ax, [bp - 83ah]
        add     bx, ax
        push    word ptr ss:[bx + 2]
        push    word ptr ss:[bx]
        push    cs
        call    fn_b556b
        add     sp, 8
        mov     di, ax
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_2560
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     word ptr [bp - 6], 3
        cmp     byte ptr [B_7AD0], 0
        jz      br_b598a
        push    ds
        push    word STR_257C
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     word ptr [bp - 6], 4
br_b598a:
        callf   SEG_D79E:far_d7a79
        jmp     short br_b5a0a
loop_b5991:
        mov     bx, word ptr [W_E570]
        shl     bx, 2
        lea     ax, [bp - 83ah]
        add     bx, ax
        les     bx, dword ptr ss:[bx]
        push    word ptr es:[bx + 15h]
        nop
        push    cs
        call    fn_b5aab
        add     sp, 2
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        mov     bx, word ptr [W_E570]
        shl     bx, 2
        lea     ax, [bp - 83ah]
        add     bx, ax
        push    word ptr ss:[bx + 2]
        push    word ptr ss:[bx]
        push    cs
        call    fn_b556b
        add     sp, 8
        mov     di, ax
        cmp     si, 75h
        jnz     loop_b59e2
        cmp     byte ptr [B_7AD0], 0
        jz      loop_b59e2
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
loop_b59e2:
        if      FW_VERSION >= 311
        push    word ptr [bp - 6]
        else
        mov     al, byte ptr [bp - 6]
        push    ax
        endif
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        or      ax, ax
        jz      loop_b5991
        cmp     word ptr [bp - 2], 0
        jnz     br_b5a0a
        cmp     ax, 78h
        jz      br_b5a08
        cmp     ax, 79h
        jz      br_b5a08
        cmp     ax, 7ah
        jnz     br_b5a0a
br_b5a08:
        xor     si, si
br_b5a0a:
        or      si, si
        jle     loop_b59e2
        mov     ax, si
        cmp     ax, 78h
        jz      br_b5a21
        cmp     ax, 79h
        jz      br_b5a46
        cmp     ax, 7ah
        jz      br_b5a7a
        if      FW_VERSION >= 311
        jmp     short br_b5a9e
        else
        jmp     br_b5a9e
        endif
br_b5a21:
        callf   SEG_B1AA:far_b1af9
        mov     si, di
        inc     si
        neg     si
        or      si, si
        jnz     br_b5a40
        push    0ffe2h
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        callf   SEG_B1AA:far_b1aff
        jmp     br_b5a9e
br_b5a40:
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
br_b5a46:
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    fn_b5e89
        add     sp, 4
        mov     si, ax
        or      ax, ax
        jnz     br_b5a9e
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     si, ax
        push    37h
        callf   SEG_D79E:far_d7a63
        add     sp, 2
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 4]
        dec     ax
        cmp     ax, word ptr [W_E570]
        jnz     br_b5a9e
        dec     word ptr [W_E570]
        endif
        jmp     br_b5a9e
br_b5a7a:
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    fn_b5f49
        add     sp, 4
        mov     si, ax
        or      ax, ax
        jnz     br_b5a9e
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     si, ax
        push    37h
        callf   SEG_D79E:far_d7a63
        add     sp, 2
br_b5a9e:
        or      si, si
        jg      br_b5aa5
        jmp     br_b58bc
br_b5aa5:
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
fn_b5aab:
        push    bp
        mov     bp, sp
        push    1dh
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp + 6]
        push    ds
        push    word STR_258A
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
        pop     bp
        if      FW_VERSION >= 311
        retf
fn_b5acb:
        push    bp
        mov     bp, sp
        push    15h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    12h
        push    20h
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        push    15h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    ds
        push    word STR_2594
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        pop     bp
        retf
fn_b5b06:
        push    bp
        mov     bp, sp
        sub     sp, 1eh
        push    si
        mov     byte ptr [bp - 0bh], 0
        xor     si, si
        push    ds
        push    word STR_25F5
        nop
        push    cs
        call    far_b6cd3
        add     sp, 4
        push    0
        push    6
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_2604
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_EC44:far_ec449
        add     sp, 10h
        mov     word ptr [bp - 0ah], ax
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        push    20h
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        cmp     word ptr [232fh], 0
        jz      br_b5b91
        cmp     word ptr [bp - 4], 1
        jnz     br_b5b91
        mov     byte ptr [bp - 0bh], 1
br_b5b91:
        cmp     word ptr [bp - 0ah], 0
        jnz     br_b5ba7
        push    word ptr [bp - 8]
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        xor     ax, ax
        pop     si
        leave
        retf
br_b5ba7:
        mov     byte ptr [B_D5DD], 82h
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        callf   SEG_E600:far_e6006
        mov     byte ptr [bp - 1], al
        push    0ah
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 1]
        push    ax
        push    ds
        push    word STR_261B
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        push    0ffffh
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_E4D1:far_e4d15
        add     sp, 8
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        push    cs
        call    fn_b5acb
        add     sp, 4
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    4
        push    ds
        push    word W_232F+0fh
        push    ds
        push    word W_232F+2
        push    ds
        push    word STR_262F
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 6]
        callf   SEG_EC70:far_ec70d
        add     sp, 2
        or      ax, ax
        jz      br_b5c4b
        push    ds
        push    word STR_264E
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     byte ptr [bp - 0bh], 1
        mov     si, 1
        jmp     br_b5c7a
br_b5c4b:
        cmp     word ptr [bp - 4], 1
        jnz     br_b5c6a
        push    13h
        push    ds
        push    word W_232F+3
        push    ss
        lea     ax, [bp - 0bh]
        push    ax
        push    ds
        push    word STR_266F
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        jmp     br_b5c7a
br_b5c6a:
        push    ds
        push    word STR_267F
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     byte ptr [bp - 0bh], 1
br_b5c7a:
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_26A5
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_b5ce3
loop_b5c8d:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jz      br_b5ca1
        cmp     ax, 1
        jz      br_b5ccd
        cmp     ax, 2
        jz      br_b5cd9
        jmp     br_b5ce3
br_b5ca1:
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        push    0ffffh
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_E4D1:far_e4d15
        add     sp, 8
        push    0
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        push    cs
        call    fn_b5acb
        add     sp, 4
        jmp     br_b5ce3
br_b5ccd:
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_b5ce3
br_b5cd9:
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_b5ce3:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_b5c8d
        cmp     dx, 78h
        jz      br_b5cfb
        pop     si
        leave
        retf
br_b5cfb:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_26AD
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        cmp     word ptr [bp - 4], 1
        jnz     br_b5d2d
        or      si, si
        jnz     br_b5d2d
        cmp     byte ptr [bp - 0bh], 1
        jnz     br_b5d28
        mov     ax, 1
        jmp     br_b5d2a
br_b5d28:
        xor     ax, ax
br_b5d2a:
        mov     word ptr [232fh], ax
br_b5d2d:
        mov     al, byte ptr [bp - 0bh]
        mov     ah, 0
        push    ax
        mov     al, byte ptr [2331h]
        mov     ah, 0
        dec     ax
        push    ax
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_EC44:far_ec4ad
        add     sp, 0ah
        mov     word ptr [bp - 8], ax
        cmp     word ptr [bp - 8], 0
        jz      br_b5d5f
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
br_b5d5f:
        xor     ax, ax
        pop     si
        leave
        endif
        retf
fn_b5d64:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        push    di
        push    ds
        push    word STR_26BE
        nop
        push    cs
        call    far_b6cd3
        add     sp, 4
        mov     byte ptr [B_D5DD], 68h
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 311
        push    word STR_26DB
        else
        push    word STR_26DB
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        if      FW_VERSION >= 311
        push    word STR_2702
        else
        push    word STR_2702
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        if      FW_VERSION >= 311
        push    word STR_2729
        else
        push    word STR_2729
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        push    word STR_2752
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    ds
        if      FW_VERSION >= 311
        push    word STR_275B
        else
        push    word STR_24DE_V308
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
loop_b5dca:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_b5dca
        cmp     dx, 78h
        jz      br_b5de2
        jmp     near br_b5e83
br_b5de2:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_2763
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        inc     byte ptr [B_956A]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_D7F6:far_d7f67
        add     sp, 4
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jz      br_b5e1e
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        jmp     br_b5e78
br_b5e1e:
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx + 0bh], 0
        jz      br_b5e2d
        mov     ax, 10h
        jmp     br_b5e30
br_b5e2d:
        mov     ax, 8
br_b5e30:
        mov     word ptr [bp - 4], ax
        push    ds
        pop     es
        mov     di, TBL_9408
        push    es
        mov     es, word ptr [bp + 8]
        push    di
        mov     di, word ptr [bp + 6]
        mov     dx, word ptr [bp - 4]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        mov     ax, word ptr [bp + 8]
        mov     si, word ptr [bp + 6]
        pop     di
        pop     es
        push    ds
        mov     ds, ax
        sub     dx, cx
        jnc     br_b5e61
        add     cx, dx
        xor     dx, dx
br_b5e61:
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        mov     cx, dx
        xor     ax, ax
        rep stosb
        pop     ds
        mov     bx, word ptr [bp - 4]
        mov     byte ptr [bx + TBL_9408], 0
br_b5e78:
        callf   SEG_D78B:far_d7903
        dec     byte ptr [B_956A]
        xor     dx, dx
br_b5e83:
        mov     ax, dx
        pop     di
        pop     si
        leave
        retf
fn_b5e89:
        push    bp
        mov     bp, sp
        sub     sp, 16h
        push    ds
        push    word STR_2773
        nop
        push    cs
        call    far_b6cd3
        add     sp, 4
        mov     byte ptr [B_D5DD], 47h
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_2780
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    far_b6beb
        add     sp, 8
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        push    word STR_2791
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_2794
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
loop_b5ef5:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_b5ef5
        cmp     dx, 78h
        jnz     br_b5f45
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_279F
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_CAA9:far_cab5c
        add     sp, 4
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        xor     dx, dx
br_b5f45:
        mov     ax, dx
        leave
        retf
fn_b5f49:
        push    bp
        mov     bp, sp
        sub     sp, 2eh
        push    si
        push    di
        push    ds
        push    word STR_27B0
        nop
        push    cs
        call    far_b6cd3
        add     sp, 4
        mov     byte ptr [B_D5DD], 48h
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_27BE
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ss
        lea     ax, [bp - 2eh]
        push    ax
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    far_b6beb
        add     sp, 8
        push    ss
        lea     ax, [bp - 2eh]
        push    ax
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ss
        pop     es
        lea     di, [bp - 18h]
        push    es
        mov     es, word ptr [bp + 8]
        push    di
        mov     di, word ptr [bp + 6]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, word ptr [bp + 8]
        mov     si, word ptr [bp + 6]
        pop     di
        pop     es
        push    ds
        mov     ds, ax
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx + 0bh], 0
        jz      br_b5fd5
        mov     ax, 10h
        jmp     br_b5fd8
br_b5fd5:
        mov     ax, 8
br_b5fd8:
        mov     word ptr [bp - 4], ax
        lea     ax, [bp - 18h]
        mov     bx, word ptr [bp - 4]
        add     bx, ax
        mov     byte ptr ss:[bx], 0
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    10h
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        push    ds
        push    word STR_27D0
        callf   SEG_B347:far_b3471
        add     sp, 0ah
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_27E2
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_b6040
loop_b6019:
        xor     si, si
        jmp     br_b601e
loop_b601d:
        inc     si
br_b601e:
        mov     al, byte ptr [bp+si - 18h]
        cbw
        push    ax
        callf   0f800h:far_fa274
        add     sp, 2
        mov     byte ptr [bp+si - 18h], al
        or      al, al
        jnz     loop_b601d
        mov     byte ptr [bp+si - 18h], 0
        push    0
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_b6040:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_b6019
        cmp     dx, 78h
        jz      br_b6058
        jmp     near br_b60e8
br_b6058:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_27EE
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ss
        pop     es
        lea     di, [bp - 18h]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        dec     cx
        cmp     cx, 8
        jbe     br_b6089
        mov     ax, 10h
        jmp     br_b608c
br_b6089:
        mov     ax, 8
br_b608c:
        mov     word ptr [bp - 2], ax
        push    ax
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        callf   SEG_B05A:far_b0fe4
        add     sp, 6
        xor     si, si
        mov     di, word ptr [bp - 4]
        add     di, word ptr [bp + 6]
        mov     dx, word ptr [bp - 2]
        lea     ax, [bp - 18h]
        add     dx, ax
loop_b60ad:
        mov     es, word ptr [bp + 8]
        mov     al, byte ptr es:[di]
        mov     bx, dx
        mov     byte ptr ss:[bx], al
        inc     di
        inc     dx
        inc     si
        cmp     si, 4
        jl      loop_b60ad
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_CAA9:far_cab9e
        add     sp, 8
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        xor     dx, dx
br_b60e8:
        mov     ax, dx
        pop     di
        pop     si
        leave
        retf
far_b60ee:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    ds
        push    word STR_2800
        nop
        push    cs
        call    far_b6cd3
        add     sp, 4
        mov     byte ptr [B_D5DD], 49h
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 311
        push    word STR_280C
        else
        push    word STR_280C
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        push    word STR_2834
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    10h
        push    ds
        push    word TBL_060C
        push    ds
        push    word B_7AC3
        push    ds
        push    word STR_284F
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_2855
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     al, byte ptr [B_7AC3]
        if      FW_VERSION >= 311
        mov     ah, 0
        else
        cbw
        endif
        mov     word ptr [bp - 2], ax
        jmp     br_b617e
loop_b6166:
        mov     al, byte ptr [B_7AC3]
        if      FW_VERSION >= 311
        mov     ah, 0
        else
        cbw
        endif
        push    ax
        callf   SEG_D546:far_d5b6a
        add     sp, 2
        push    0
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_b617e:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_b6166
        cmp     dx, 78h
        jnz     br_b61d1
        cmp     word ptr [bp - 2], 0
        jnz     br_b61c5
        cmp     byte ptr [B_7AC3], 0
        jz      br_b61c5
        if      FW_VERSION >= 311
        push    word ptr [W_7ACC]
        else
        mov     al, byte ptr [W_7ACC]
        cbw
        push    ax
        endif
        callf   SEG_D546:far_d549d
        add     sp, 2
        or      ax, ax
        jz      br_b61c5
        push    word 0ff50h
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        push    0
        callf   SEG_D546:far_d5b6a
        add     sp, 2
br_b61c5:
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        xor     dx, dx
br_b61d1:
        mov     ax, dx
        leave
        retf
fn_b61d5:
        push    bp
        mov     bp, sp
        sub     sp, 4
        mov     byte ptr [B_D5DD], 9
        mov     word ptr [bp - 2], 4
        push    ds
        push    word STR_2861
        nop
        push    cs
        call    far_b6cd3
        add     sp, 4
        push    ds
        if      FW_VERSION >= 311
        push    word STR_2875
        else
        push    word STR_2875
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        if      FW_VERSION >= 311
        push    word STR_2886
        else
        push    word STR_2886
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        if      FW_VERSION >= 311
        push    word STR_2899
        else
        push    word STR_261E_V308
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        if      FW_VERSION >= 311
        push    word STR_28B4
        else
        push    word STR_2637_V308
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    word ptr [bp - 2]
        push    ss
        lea     ax, [bp - 3]
        push    ax
        callf   SEG_EBCC:far_ebcce
        add     sp, 8
        mov     dx, ax
        or      dx, dx
        jnz     br_b627f
        mov     al, byte ptr [bp - 3]
        cbw
        dec     ax
        mov     bx, ax
        cmp     bx, 3
        ja      br_b627f
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_b6283]
tgt_b625d:
        nop
        push    cs
        call    fn_b669f
        mov     dx, ax
        jmp     br_b627f
tgt_b6266:
        nop
        push    cs
        call    fn_b628b
        mov     dx, ax
        jmp     br_b627f
tgt_b626f:
        nop
        push    cs
        call    fn_b6353
        mov     dx, ax
        jmp     br_b627f
tgt_b6278:
        nop
        push    cs
        call    fn_b6958
        mov     dx, ax
br_b627f:
        mov     ax, dx
        leave
        retf
TBL_b6283:
        dw      tgt_b625d
        dw      tgt_b6266
        dw      tgt_b626f
        dw      tgt_b6278
fn_b628b:
        mov     byte ptr [B_D5DD], 5eh
        push    ds
        push    word STR_28DC
        nop
        push    cs
        call    far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 311
        push    word P_28F1
        else
        push    word P_28F1
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_29B3
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        cmp     dx, 78h
        jnz     br_b6350
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_29BF
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        callf   SEG_D546:far_d5b6a
        add     sp, 2
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        push    5
        push    0
        push    0bh
        callf   SEG_CAD0:far_cad00
        add     sp, 6
        mov     dx, ax
        or      ax, ax
        jz      br_b6340
        cmp     dx, 0ff02h
        jz      br_b6328
        cmp     dx, 0ff04h
        jz      br_b6328
        cmp     dx, 0ff10h
        jnz     br_b6337
br_b6328:
        push    dx
        push    1ah
        push    0
        callf   SEG_B3B9:far_b3d1d
        add     sp, 6
        jmp     br_b6340
br_b6337:
        push    dx
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
br_b6340:
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     dx, ax
br_b6350:
        mov     ax, dx
        retf
fn_b6353:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 6
        else
        sub     sp, 8
        endif
        push    si
        if      FW_VERSION >= 311
        push    di
        endif
        mov     byte ptr [B_D5DD], 5fh
        push    ds
        if      FW_VERSION >= 311
        push    word STR_29CD
        else
        push    word STR_29CD
        nop
        push    cs
        call    far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    ds
        push    word P_223A_V308+8
        push    ds
        push    word B_83D0
        push    ds
        push    word STR_275E_V308
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_2775_V308
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_279D_V308
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_27C6_V308
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_2A32
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
L_bd09e:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      L_bd09e
        cmp     dx, 78h
        jz      L_bd0b6
        jmp     L_bd35e
L_bd0b6:
        mov     byte ptr [B_D5DD], 60h
        push    ds
        push    word STR_29CD
        nop
        push    cs
        call    far_b6cd3
        add     sp, 4
        mov     al, byte ptr [W_7ACC]
        cbw
        push    ax
        callf   SEG_D546:fn_d569e
        add     sp, 2
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        cmp     word ptr [bp - 6], 0
        jg      L_bd122
        jnz     L_bd0e8
        cmp     word ptr [bp - 8], 0
        ja      L_bd122
L_bd0e8:
        callf   SEG_D546:far_d5801
        mov     byte ptr [B_7AC4], al
        mov     al, byte ptr [W_7ACC]
        cbw
        push    ax
        callf   SEG_D546:fn_d569e
        add     sp, 2
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        cmp     word ptr [bp - 6], 0
        jg      L_bd122
        jnz     L_bd111
        cmp     word ptr [bp - 8], 0
        ja      L_bd122
L_bd111:
        push    0ffc4h
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     si
        leave
        retf
L_bd122:
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_27F1_V308
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_2815_V308
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     word ptr [bp - 2], 1
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        nop
        push    cs
        call    fn_b6f20
        add     sp, 8
        mov     si, ax
        push    1bh
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    2
        push    1ah
        push    1
        push    2
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ds
        push    word P_239C+3
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    1bh
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 2]
        push    ds
        push    word L_283B_V308
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_283F_V308
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0bh
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    word 3e8h
        push    0
        push    7dh
        mov     dx, word ptr [bp - 6]
        mov     ax, word ptr [bp - 8]
        mov     cl, 6
        callf   0f800h:far_fa1ac
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        add     ax, 1f4h
        adc     dx, 0
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        mov     word ptr [bp - 4], ax
        push    ax
        push    ds
        push    word STR_2856_V308
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_2A32
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     L_bd257
L_bd21d:
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        nop
        push    cs
        call    fn_b6f20
        add     sp, 8
        mov     si, ax
        push    0
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    1bh
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 2]
        push    ds
        push    word L_283B_V308
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
L_bd257:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      L_bd21d
        cmp     dx, 78h
        jz      L_bd26f
        jmp     L_bd35e
L_bd26f:
        mov     byte ptr [B_D5DD], 61h
        push    ds
        push    word STR_29CD
        endif
        nop
        push    cs
        call    far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 311
        push    word STR_29DE
        else
        push    word STR_285A_V308
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        if      FW_VERSION >= 311
        push    4
        else
        push    3
        endif
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION >= 311
        push    4
        endif
        push    ds
        if      FW_VERSION >= 311
        push    word P_22DC
        push    ds
        push    word B_8435
        push    ds
        push    word STR_2A11
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        else
        push    word STR_2882_V308
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        endif
        callf   SEG_B702:far_b90dd
        push    ds
        if      FW_VERSION >= 311
        push    word STR_2A32
        else
        push    word STR_2AE9
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
loop_b63b7:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        if      FW_VERSION >= 311
        mov     si, ax
        or      ax, ax
        jz      loop_b63b7
        cmp     si, 78h
        jz      br_b63cf
        jmp     br_b6699
br_b63cf:
        mov     byte ptr [B_D5DD], 61h
        push    ds
        push    word STR_29CD
        nop
        push    cs
        call    far_b6cd3
        add     sp, 4
        callf   SEG_D546:far_d5801
        mov     byte ptr [B_7AC4], al
        cmp     byte ptr [B_7AC4], 1
        jz      br_b63f6
        cmp     byte ptr [B_7AC4], 2
        jnz     br_b6409
br_b63f6:
        push    word 0ff48h
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_b6409:
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word P_2A40
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    22h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [W_7ACC]
        push    ds
        push    word STR_2AE6
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_2AE9
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_D78B:far_d78b2
loop_b6453:
        push    2
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        or      ax, ax
        jz      loop_b6453
        else
        mov     dx, ax
        endif
        cmp     ax, 78h
        jz      br_b6470
        if      FW_VERSION >= 311
        cmp     ax, 79h
        jz      br_b64d7
        jmp     br_b6699
        else
        jmp     near L_bd35e
        endif
br_b6470:
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word 0c8h
        push    20h
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_2AF6
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_2B19
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        if      FW_VERSION >= 311
        callf   SEG_D51E:far_d51e6
        mov     dx, ax
        or      dx, dx
        jz      br_b64d7
        push    word 0ff51h
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_b64d7:
        push    ds
        push    word STR_29CD
        nop
        push    cs
        call    far_b6cd3
        add     sp, 4
        mov     byte ptr [B_D5DD], 60h
        push    word ptr [W_7ACC]
        callf   SEG_D546:far_d5756
        add     sp, 2
        mov     word ptr [bp - 4], dx
        mov     word ptr [bp - 6], ax
        cmp     word ptr [bp - 4], 0
        jg      br_b651b
        jnz     br_b6508
        cmp     word ptr [bp - 6], 0
        ja      br_b651b
br_b6508:
        push    word 0ff51h
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_b651b:
        else
        mov     ax, 3
        cmp     byte ptr [B_83D0], 0
        jz      L_bd32a
        xor     ax, ax
L_bd32a:
        endif
        push    0
        if      FW_VERSION >= 311
        push    word 3e8h
        push    0
        push    7dh
        mov     dx, word ptr [bp - 4]
        mov     ax, word ptr [bp - 6]
        mov     cl, 6
        callf   0f800h:far_fa1ac
        push    dx
        else
        push    si
        endif
        push    ax
        if      FW_VERSION >= 311
        callf   0f800h:far_fa0fe
        add     ax, 1f4h
        adc     dx, 0
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        mov     si, ax
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_2B31
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     word ptr [bp - 2], 1
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    word ptr [bp - 4]
        push    word ptr [bp - 6]
        nop
        push    cs
        call    fn_b6f20
        add     sp, 8
        mov     di, ax
        or      di, di
        jnz     br_b6590
        push    word 0ff51h
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_b6590:
        push    1bh
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    2
        push    1ah
        push    1
        push    2
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ds
        push    word P_239C+3
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    1bh
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 2]
        push    ds
        push    word L_2BCB
        callf   SEG_B1B5:far_b1d48
        else
        callf   0de52h:L_de52a
        endif
        add     sp, 6
        if      FW_VERSION >= 312
        push    1ch
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     si, 30ch
        jle     br_b65e5
        mov     si, 30ch
br_b65e5:
        push    si
        push    ds
        push    word L_2BCB+4
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
        callf   SEG_B702:far_b9102
        jmp     br_b6633
loop_b65f9:
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    word ptr [bp - 4]
        push    word ptr [bp - 6]
        nop
        push    cs
        call    fn_b6f20
        add     sp, 8
        mov     di, ax
        push    0
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    1bh
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 2]
        push    ds
        push    word L_2BCB
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
br_b6633:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        or      ax, ax
        jz      loop_b65f9
        cmp     si, 78h
        jz      L_b664c
        pop     di
        pop     si
        leave
        retf
L_b664c:
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     si, ax
        elseif  FW_VERSION = 311
        push    1ch
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     si, 30ch
        jle     br_b65e5
        mov     si, 30ch
br_b65e5:
        push    si
        push    ds
        push    word L_2BCB+4
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
        callf   SEG_B702:far_b9102
        jmp     br_b6633
loop_b65f9:
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    word ptr [bp - 4]
        push    word ptr [bp - 6]
        nop
        push    cs
        call    fn_b6f20
        add     sp, 8
        mov     di, ax
        push    0
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    1bh
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 2]
        push    ds
        push    word L_2BCB
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
br_b6633:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        or      ax, ax
        jz      loop_b65f9
        cmp     si, 78h
        jnz     L_b664d
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     si, ax
        endif
L_b664d:
        if      FW_VERSION >= 311
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_2BD3
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    word ptr [bp - 2]
        push    di
        callf   SEG_D51E:far_d526f
        add     sp, 4
        endif
        mov     dx, ax
        or      dx, dx
        jnz     br_b6683
        callf   SEG_D546:far_d5801
        mov     dx, ax
br_b6683:
        or      dx, dx
        jz      br_b6694
        if      FW_VERSION >= 311
        push    word 0ff51h
        else
        push    0ffc4h
        endif
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        jmp     br_b6699
br_b6694:
        mov     byte ptr [B_7AC4], 0
br_b6699:
        if      FW_VERSION >= 311
        mov     ax, si
        pop     di
        else
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     dx, ax
L_bd35e:
        mov     ax, dx
        endif
        pop     si
        leave
        retf
fn_b669f:
        push    bp
        mov     bp, sp
        sub     sp, 28h
        push    si
        push    di
        mov     byte ptr [B_D5DD], 5bh
        xor     si, si
        jmp     br_b694b
br_b66b1:
        push    ds
        push    word A_2BED
        nop
        push    cs
        call    far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_2C00
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_2C29
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_2C4F
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        cmp     si, 78h
        jz      br_b6712
        jmp     br_b694b
br_b6712:
        push    0
        callf   SEG_D546:far_d5b6a
        add     sp, 2
        push    word ptr [W_8C3B]
        push    word ptr [W_8C39]
        push    word ptr [W_8C3F]
        push    word ptr [W_8C3D]
        callf   SEG_DA9B:far_daa07
        add     sp, 8
        mov     word ptr [bp - 0ah], dx
        mov     word ptr [bp - 0ch], ax
        push    0
        push    word 200h
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        mov     word ptr [bp - 2], ax
        xor     di, di
        mov     ax, di
        mov     byte ptr [B_CEC1], al
        push    word ptr [W_8C3B]
        push    word ptr [W_8C39]
        callf   SEG_DA9B:far_daa59
        add     sp, 4
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        mov     ax, 50h
        mov     word ptr [bp - 4], ax
        mov     byte ptr [B_CEC3], al
        jmp     br_b693d
br_b6772:
        push    ds
        push    word A_2BED
        nop
        push    cs
        call    far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_2C5E
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_2C82
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_2C88
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     byte ptr [B_D5DD], 5ch
        callf   SEG_D78B:far_d78b2
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        cmp     si, 78h
        jz      br_b67e4
        jmp     br_b6946
br_b67e4:
        xor     si, si
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_2C92
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        push    ss
        lea     ax, [bp - 28h]
        push    ax
        push    ds
        push    word STR_05D0+8
        callf   SEG_CAA9:far_cac0f
        add     sp, 8
        mov     dx, ax
        and     ax, 0ff00h
        cmp     ax, 0ff00h
        jnz     br_b682f
        push    dx
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        jmp     br_b6946
br_b682f:
        push    di
        push    word ptr [bp - 2]
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        callf   SEG_CAE6:far_cae62
        add     sp, 8
        mov     dx, ax
        or      ax, ax
        jz      br_b6853
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        jmp     br_b6946
br_b6853:
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_2CB6
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_2C88
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     byte ptr [B_D5DD], 5dh
        callf   SEG_D78B:far_d78b2
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        cmp     si, 78h
        jz      br_b68b7
        jmp     near br_b6946
br_b68b7:
        xor     si, si
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_2CDC
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        push    ss
        lea     ax, [bp - 28h]
        push    ax
        push    ds
        push    word STR_05D0+8
        callf   SEG_CAA9:far_cac0f
        add     sp, 8
        mov     dx, ax
        and     ax, 0ff00h
        cmp     ax, 0ff00h
        jnz     br_b6901
        push    dx
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        jmp     br_b6946
br_b6901:
        push    di
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        callf   SEG_CAF2:far_caf26
        add     sp, 6
        mov     dx, ax
        or      ax, ax
        jz      br_b6921
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        jmp     br_b6946
br_b6921:
        mov     al, byte ptr [B_CEC1]
        mov     ah, 0
        mov     di, ax
        mov     al, byte ptr [B_CEC3]
        mov     ah, 0
        mov     dx, ax
        sub     word ptr [bp - 4], ax
        cmp     dx, word ptr [bp - 4]
        jle     br_b693d
        mov     al, byte ptr [bp - 4]
        mov     byte ptr [B_CEC3], al
br_b693d:
        cmp     word ptr [bp - 4], 0
        jz      br_b6946
        jmp     br_b6772
br_b6946:
        callf   SEG_DEAB:far_deabe
br_b694b:
        or      si, si
        jnz     br_b6952
        jmp     br_b66b1
br_b6952:
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
fn_b6958:
        if      FW_VERSION >= 311
        push    bp
        mov     bp, sp
        sub     sp, 16h
        push    si
        push    di
        mov     si, 2386h
        lea     di, [bp - 16h]
        push    ss
        pop     es
        mov     cx, 0bh
        rep movsw
        endif
        mov     byte ptr [B_D5DD], 62h
        if      FW_VERSION >= 311
        xor     si, si
        endif
        push    ds
        if      FW_VERSION >= 311
        push    word STR_2D05
        else
        push    word STR_2A08_V308
        endif
        nop
        push    cs
        call    far_b6cd3
        add     sp, 4
        if      FW_VERSION >= 311
        jmp     br_b6a9e
br_b6983:
        endif
        push    0
        push    1
        if      FW_VERSION >= 311
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_2D11
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        cmp     word ptr [W_7ACC], 7
        jnc     br_b69aa
        mov     al, byte ptr [W_7ACC]
        add     al, 30h
        mov     byte ptr [bp - 0eh], al
br_b69aa:
        cmp     byte ptr [B_7ACA], 0
        jz      br_b69b8
        mov     dx, ss
        lea     ax, [bp - 16h]
        jmp     br_b69bd
br_b69b8:
        mov     dx, ds
        mov     ax, 2d19h
br_b69bd:
        push    dx
        push    ax
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_2D2F
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    4
        push    ds
        push    word P_22DC
        push    ds
        push    word B_8435
        push    ds
        push    word STR_2D58
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    5
        endif
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    63h
        push    0
        push    2
        push    ds
        push    word B_8434
        push    ds
        if      FW_VERSION >= 311
        push    word STR_2D7C
        else
        push    word STR_2A2A_V308
        endif
        callf   SEG_B347:far_b3819
        add     sp, 10h
        if      FW_VERSION >= 311
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_2D9A
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    1bh
        push    20h
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        mov     di, 1
loop_b6a45:
        push    di
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        or      ax, ax
        jz      loop_b6a45
        cmp     si, 78h
        jnz     br_b6a9e
        endif
        push    0
        if      FW_VERSION >= 311
        push    7
        else
        push    3
        endif
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 311
        push    word STR_2DA8
        else
        push    word STR_2A4D_V308
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        if      FW_VERSION >= 311
        callf   SEG_D546:far_d5be8
        push    0ffffh
        callf   SEG_CAA9:far_cab48
        else
        callf   SEG_B702:far_b90dd
        xor     dx, dx
        jmp     L_bd682
L_bd672:
        push    0ff80h
        callf   SEG_B05A:far_b08f7
        endif
        add     sp, 2
        if      FW_VERSION >= 311
        cmp     byte ptr [B_7ACA], 0
        jnz     br_b6a9c
        callf   SEG_B1AA:far_b1af9
        push    word 0ff48h
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        callf   SEG_B1AA:far_b1aff
br_b6a9c:
        xor     si, si
br_b6a9e:
        or      si, si
        jnz     br_b6aa5
        jmp     br_b6983
br_b6aa5:
        mov     ax, si
        pop     di
        pop     si
        leave
        else
        mov     dx, ax
        or      ax, ax
        jz      L_bd672
L_bd682:
        or      dx, dx
        jz      L_bd672
        mov     ax, dx
        endif
        retf
far_b6aab:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    si
        push    di
        les     di, dword ptr [bp + 6]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        mov     ax, 2eh
        sub     di, cx
        repne scasb
        jz      br_b6acf
        mov     di, 1
        xor     ax, ax
        mov     es, ax
br_b6acf:
        dec     di
        mov     ax, es
        mov     word ptr [bp - 4], ax
        mov     word ptr [bp - 6], di
        mov     dx, di
        or      dx, ax
        jz      br_b6aeb
        mov     dx, word ptr [bp - 6]
        xor     ax, ax
        sub     dx, word ptr [bp + 6]
        sbb     ax, 0
        jmp     br_b6afa
br_b6aeb:
        les     di, dword ptr [bp + 6]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        dec     cx
        mov     dx, cx
br_b6afa:
        cmp     dx, 8
        jle     br_b6b04
        mov     ax, 10h
        jmp     br_b6b07
br_b6b04:
        mov     ax, 8
br_b6b07:
        mov     word ptr [bp - 8], ax
        mov     byte ptr [bp - 2], 0
        mov     byte ptr [bp - 1], 0
        jmp     br_b6b60
loop_b6b14:
        mov     al, byte ptr [bp - 2]
        cbw
        les     bx, dword ptr [bp + 6]
        add     bx, ax
        mov     si, bx
        cmp     byte ptr es:[bx], 0
        jz      br_b6b2b
        cmp     byte ptr es:[si], 2eh
        jnz     br_b6b36
br_b6b2b:
        les     bx, dword ptr [bp + 0ah]
        add     bx, cx
        mov     byte ptr es:[bx], 20h
        jmp     br_b6b5d
br_b6b36:
        mov     al, byte ptr [bp - 2]
        inc     byte ptr [bp - 2]
        cbw
        les     bx, dword ptr [bp + 6]
        add     bx, ax
        mov     al, byte ptr es:[bx]
        cbw
        push    ax
        callf   0f800h:far_fa274
        add     sp, 2
        push    ax
        mov     al, byte ptr [bp - 1]
        cbw
        les     bx, dword ptr [bp + 0ah]
        add     bx, ax
        pop     ax
        mov     byte ptr es:[bx], al
br_b6b5d:
        inc     byte ptr [bp - 1]
br_b6b60:
        mov     al, byte ptr [bp - 1]
        cbw
        mov     cx, ax
        cmp     ax, word ptr [bp - 8]
        jl      loop_b6b14
        mov     al, byte ptr [bp - 2]
        cbw
        les     bx, dword ptr [bp + 6]
        add     bx, ax
        cmp     byte ptr es:[bx], 2eh
        jnz     br_b6b7d
        inc     byte ptr [bp - 2]
br_b6b7d:
        mov     al, byte ptr [bp - 8]
        mov     byte ptr [bp - 1], al
        jmp     br_b6bc9
loop_b6b85:
        mov     al, byte ptr [bp - 2]
        cbw
        les     bx, dword ptr [bp + 6]
        add     bx, ax
        cmp     byte ptr es:[bx], 0
        jz      br_b6bbd
        mov     al, byte ptr [bp - 2]
        inc     byte ptr [bp - 2]
        cbw
        mov     bx, word ptr [bp + 6]
        add     bx, ax
        mov     al, byte ptr es:[bx]
        cbw
        push    ax
        callf   0f800h:far_fa274
        add     sp, 2
        push    ax
        mov     al, byte ptr [bp - 1]
        cbw
        les     bx, dword ptr [bp + 0ah]
        add     bx, ax
        pop     ax
        mov     byte ptr es:[bx], al
        jmp     br_b6bc6
br_b6bbd:
        les     bx, dword ptr [bp + 0ah]
        add     bx, cx
        mov     byte ptr es:[bx], 20h
br_b6bc6:
        inc     byte ptr [bp - 1]
br_b6bc9:
        mov     al, byte ptr [bp - 1]
        cbw
        mov     cx, ax
        mov     dx, word ptr [bp - 8]
        add     dx, 3
        cmp     ax, dx
        jl      loop_b6b85
        mov     bx, word ptr [bp - 8]
        mov     es, word ptr [bp + 0ch]
        add     bx, word ptr [bp + 0ah]
        mov     byte ptr es:[bx + 3], 0
        pop     di
        pop     si
        leave
        retf
far_b6beb:
        push    bp
        mov     bp, sp
        sub     sp, 16h
        push    si
        push    di
        push    ss
        pop     es
        lea     di, [bp - 16h]
        xor     ax, ax
        mov     ah, al
        mov     cx, 0ah
        rep stosw
        stosb
        xor     si, si
        mov     di, word ptr [bp + 6]
loop_b6c07:
        mov     es, word ptr [bp + 8]
        cmp     byte ptr es:[di], 20h
        jc      br_b6c16
        cmp     byte ptr es:[di], 7fh
        jbe     br_b6c1c
br_b6c16:
        mov     byte ptr [bp+si - 16h], 2ah
        jmp     br_b6c25
br_b6c1c:
        mov     es, word ptr [bp + 8]
        mov     al, byte ptr es:[di]
        mov     byte ptr [bp+si - 16h], al
br_b6c25:
        inc     di
        inc     si
        cmp     si, 0bh
        jl      loop_b6c07
        les     bx, dword ptr [bp + 6]
        add     bx, si
        mov     dx, bx
        cmp     byte ptr es:[bx], 0
        jz      br_b6c62
        mov     di, dx
        jmp     br_b6c5d
loop_b6c3d:
        mov     es, word ptr [bp + 8]
        cmp     byte ptr es:[di], 20h
        jc      br_b6c4c
        cmp     byte ptr es:[di], 7fh
        jbe     br_b6c52
br_b6c4c:
        mov     byte ptr [bp+si - 16h], 2ah
        jmp     br_b6c5b
br_b6c52:
        mov     es, word ptr [bp + 8]
        mov     al, byte ptr es:[di]
        mov     byte ptr [bp+si - 16h], al
br_b6c5b:
        inc     di
        inc     si
br_b6c5d:
        cmp     si, 13h
        jl      loop_b6c3d
br_b6c62:
        cmp     byte ptr [bp - 0bh], 0
        jz      br_b6c6d
        mov     ax, 10h
        jmp     br_b6c70
br_b6c6d:
        mov     ax, 8
br_b6c70:
        mov     cx, ax
        xor     dx, dx
        mov     si, cx
        jmp     br_b6c95
loop_b6c78:
        cmp     byte ptr [bp+si - 16h], 20h
        jz      br_b6c95
        mov     dx, si
        inc     dx
loop_b6c81:
        mov     al, byte ptr [bp+si - 16h]
        les     bx, dword ptr [bp + 0ah]
        add     bx, si
        mov     byte ptr es:[bx], al
        mov     ax, si
        dec     si
        or      ax, ax
        jnz     loop_b6c81
        jmp     br_b6c9c
br_b6c95:
        mov     ax, si
        dec     si
        or      ax, ax
        jnz     loop_b6c78
br_b6c9c:
        les     bx, dword ptr [bp + 0ah]
        add     bx, dx
        mov     byte ptr es:[bx], 2eh
        inc     dx
        mov     si, cx
        mov     di, word ptr [bp + 0ah]
        add     di, dx
        mov     ax, cx
        add     ax, 3
        mov     cx, ax
        jmp     br_b6cc2
loop_b6cb6:
        mov     al, byte ptr [bp+si - 16h]
        mov     es, word ptr [bp + 0ch]
        mov     byte ptr es:[di], al
        inc     di
        inc     dx
        inc     si
br_b6cc2:
        cmp     cx, si
        jg      loop_b6cb6
        les     bx, dword ptr [bp + 0ah]
        add     bx, dx
        mov     byte ptr es:[bx], 0
        pop     di
        pop     si
        leave
        retf
far_b6cd3:
        push    bp
        mov     bp, sp
        callf   SEG_B05A:far_b05a7
        callf   SEG_B1AA:far_b1aac
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        pop     bp
        retf
fn_b6cf0:
        push    bp
        mov     bp, sp
        sub     sp, 30h
        push    si
        push    di
        mov     word ptr [bp - 2], 0
        mov     ax, word ptr [bp + 6]
        mov     word ptr [bp - 4], ax
        mov     ax, word ptr [bp - 2]
        cmp     ax, word ptr [bp + 0ah]
        jl      br_b6d0e
        jmp     near br_b6dd3
br_b6d0e:
        mov     es, word ptr [bp + 8]
        mov     bx, word ptr [bp - 4]
        les     di, dword ptr es:[bx]
        mov     ax, ss
        lea     si, [bp - 1ah]
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        xor     si, si
loop_b6d41:
        cmp     byte ptr [bp+si - 1ah], 0
        jz      br_b6d4d
        inc     si
        cmp     si, 15h
        jl      loop_b6d41
br_b6d4d:
        sub     si, 3
        mov     al, byte ptr [bp+si - 1ah]
        mov     byte ptr [bp - 30h], al
        inc     si
        mov     al, byte ptr [bp+si - 1ah]
        mov     byte ptr [bp - 2fh], al
        inc     si
        mov     al, byte ptr [bp+si - 1ah]
        mov     byte ptr [bp - 2eh], al
        mov     byte ptr [bp - 2dh], 2eh
        xor     si, si
        mov     di, 4
        jmp     br_b6d79
loop_b6d6f:
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        mov     byte ptr [bp+di - 30h], al
        inc     si
        inc     di
br_b6d79:
        lea     ax, [bp - 1ah]
        mov     bx, si
        add     bx, ax
        mov     ax, bx
        cmp     byte ptr ss:[bx], 2eh
        jnz     loop_b6d6f
        mov     byte ptr [bp+di - 30h], 0
        mov     es, word ptr [bp + 8]
        mov     bx, word ptr [bp - 4]
        mov     ax, word ptr es:[bx + 2]
        mov     si, word ptr es:[bx]
        push    ss
        pop     es
        lea     di, [bp - 30h]
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        add     word ptr [bp - 4], 4
        inc     word ptr [bp - 2]
        mov     ax, word ptr [bp - 2]
        cmp     ax, word ptr [bp + 0ah]
        jge     br_b6dd3
        jmp     near br_b6d0e
br_b6dd3:
        pop     di
        pop     si
        leave
        retf
fn_b6dd7:
        push    bp
        mov     bp, sp
        sub     sp, 30h
        push    si
        push    di
        mov     word ptr [bp - 2], 0
        mov     ax, word ptr [bp + 6]
        mov     word ptr [bp - 4], ax
        mov     ax, word ptr [bp - 2]
        cmp     ax, word ptr [bp + 0ah]
        jl      br_b6df5
        jmp     near br_b6eab
br_b6df5:
        mov     es, word ptr [bp + 8]
        mov     bx, word ptr [bp - 4]
        les     di, dword ptr es:[bx]
        mov     ax, ss
        lea     si, [bp - 1ah]
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        mov     di, 4
        xor     si, si
        jmp     br_b6e37
loop_b6e2d:
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        mov     byte ptr [bp+si - 30h], al
        inc     di
        inc     si
br_b6e37:
        lea     ax, [bp - 1ah]
        mov     bx, di
        add     bx, ax
        mov     ax, bx
        cmp     byte ptr ss:[bx], 0
        jnz     loop_b6e2d
        mov     byte ptr [bp+si - 30h], 2eh
        inc     si
        mov     al, byte ptr [bp - 1ah]
        mov     byte ptr [bp+si - 30h], al
        inc     si
        mov     al, byte ptr [bp - 19h]
        mov     byte ptr [bp+si - 30h], al
        inc     si
        mov     al, byte ptr [bp - 18h]
        mov     byte ptr [bp+si - 30h], al
        inc     si
        mov     byte ptr [bp+si - 30h], 0
        mov     es, word ptr [bp + 8]
        mov     bx, word ptr [bp - 4]
        mov     ax, word ptr es:[bx + 2]
        mov     si, word ptr es:[bx]
        push    ss
        pop     es
        lea     di, [bp - 30h]
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        add     word ptr [bp - 4], 4
        inc     word ptr [bp - 2]
        mov     ax, word ptr [bp - 2]
        cmp     ax, word ptr [bp + 0ah]
        jge     br_b6eab
        jmp     near br_b6df5
br_b6eab:
        pop     di
        pop     si
        leave
        retf
fn_b6eaf:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        push    di
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_CAA9:far_caade
        add     sp, 4
        mov     di, ax
        or      ax, ax
        jge     br_b6ed9
        pop     di
        pop     si
        leave
        retf
br_b6ed9:
        push    2
        push    di
        push    ds
        push    word TBL_F779
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     si, ax
        or      ax, ax
        jz      br_b6ef2
        pop     di
        pop     si
        leave
        retf
br_b6ef2:
        mov     al, byte ptr [TBL_F77A]
        mov     ah, 0
        mov     word ptr [bp - 2], ax
        cmp     ax, word ptr [bp + 0ah]
        jg      br_b6f03
        xor     si, si
        jmp     br_b6f06
br_b6f03:
        mov     si, 0fff7h
br_b6f06:
        push    di
        callf   SEG_CAA9:far_cab20
        add     sp, 2
        mov     word ptr [bp - 4], ax
        or      ax, ax
        jz      br_b6f1a
        pop     di
        pop     si
        leave
        retf
br_b6f1a:
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
fn_b6f20:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    si
        push    0
        push    word 0ea95h
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   0f800h:far_fa0fe
        mov     si, ax
        cwd
        push    ax
        push    dx
        xor     dx, dx
        mov     ax, 0ea95h
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        cmp     dx, word ptr [bp + 8]
        jg      br_b6f55
        jl      br_b6f54
        cmp     ax, word ptr [bp + 6]
        jnc     br_b6f55
br_b6f54:
        inc     si
br_b6f55:
        les     bx, dword ptr [bp + 0ah]
        cmp     word ptr es:[bx], si
        jge     br_b6f60
        mov     word ptr es:[bx], si
br_b6f60:
        push    0
        push    word 1000h
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   0f800h:far_fa0fe
        mov     si, ax
        les     bx, dword ptr [bp + 0ah]
        cmp     word ptr es:[bx], si
        jle     br_b6f7d
        mov     word ptr es:[bx], si
br_b6f7d:
        les     bx, dword ptr [bp + 0ah]
        mov     ax, word ptr es:[bx]
        cwd
        push    dx
        push    ax
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   0f800h:far_fa0fe
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        cmp     word ptr [bp - 2], 0
        jl      br_b6fb0
        jg      br_b6fa6
        cmp     word ptr [bp - 4], 0ea95h
        jbe     br_b6fb0
br_b6fa6:
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 0ea95h
br_b6fb0:
        les     bx, dword ptr [bp + 0ah]
        cmp     word ptr es:[bx], 1ah
        jl      br_b6fbe
        mov     word ptr es:[bx], 1ah
br_b6fbe:
        if      FW_VERSION >= 311
        push    0ah
        push    5
        else
        push    21h
        push    1
        endif
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        les     bx, dword ptr [bp + 0ah]
        mov     ax, word ptr es:[bx]
        add     ax, 40h
        push    ax
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        push    0
        push    word 3e8h
        push    0
        push    2
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        callf   0f800h:far_fa0fe
        add     ax, 1f4h
        adc     dx, 0
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        mov     word ptr [bp - 6], ax
        if      FW_VERSION >= 311
        push    1fh
        push    4
        else
        push    17h
        push    3
        endif
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 6]
        push    ds
        push    word STR_2BCB
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        pop     si
        leave
        retf
        if      FW_VERSION >= 312
        phase   4
        elseif  FW_VERSION = 311
        phase   0fh
        else
        phase   2
        endif
far_b7024:
        push    bp
        mov     bp, sp
        sub     sp, 2
        mov     byte ptr [B_D5DD], 0
        push    ds
        push    word STR_2E42
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        push    ds
        if      FW_VERSION >= 311
        push    word P_2E50
        else
        push    word P_2E50
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        nop
        push    cs
        call    far_b90dd
        callf   SEG_E6FE:far_e7069
        push    0
        push    0ah
        push    ss
        lea     ax, [bp - 1]
        push    ax
        callf   SEG_EBCC:far_ebcce
        add     sp, 8
        mov     dx, ax
        or      dx, dx
        jnz     br_b70cd
        mov     al, byte ptr [bp - 1]
        mov     byte ptr [B_D5DD], al
        cbw
        dec     ax
        mov     bx, ax
        cmp     bx, 8
        ja      br_b70cd
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_b70d1]
tgt_b707e:
        nop
        push    cs
        call    fn_b70e3
        mov     dx, ax
        jmp     br_b70cd
tgt_b7087:
        callf   SEG_C822:far_c822d
        mov     dx, ax
        jmp     br_b70cd
tgt_b7090:
        nop
        push    cs
        call    fn_b72de
        mov     dx, ax
        jmp     br_b70cd
tgt_b7099:
        nop
        push    cs
        call    fn_b7558
        mov     dx, ax
        jmp     br_b70cd
tgt_b70a2:
        nop
        push    cs
        call    fn_b7743
        mov     dx, ax
        jmp     br_b70cd
tgt_b70ab:
        nop
        push    cs
        call    fn_b79e8
        mov     dx, ax
        jmp     br_b70cd
tgt_b70b4:
        nop
        push    cs
        call    fn_b7eff
        mov     dx, ax
        jmp     br_b70cd
tgt_b70bd:
        nop
        push    cs
        call    fn_b8007
        mov     dx, ax
        jmp     br_b70cd
tgt_b70c6:
        nop
        push    cs
        call    fn_b8300
        mov     dx, ax
br_b70cd:
        mov     ax, dx
        leave
        retf
TBL_b70d1:
        dw      tgt_b707e
        dw      tgt_b7087
        dw      tgt_b7090
        dw      tgt_b7099
        dw      tgt_b70a2
        dw      tgt_b70ab
        dw      tgt_b70b4
        dw      tgt_b70bd
        dw      tgt_b70c6
fn_b70e3:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        push    di
        mov     byte ptr [B_D5DD], 1
        push    ds
        push    word STR_2EEC
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        xor     si, si
        push    0
        nop
        push    cs
        call    fn_b71a3
        add     sp, 2
        mov     word ptr [bp - 4], ax
        nop
        push    cs
        call    far_b90dd
        push    ds
        push    word STR_2F00
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     word ptr [bp - 2], 0
        jmp     br_b7197
loop_b7123:
        push    3
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     di, ax
        or      ax, ax
        mov     ax, di
        cmp     ax, 78h
        jz      br_b7144
        cmp     ax, 79h
        jz      br_b7159
        cmp     ax, 7ah
        jz      br_b7180
        jmp     br_b7192
br_b7144:
        or      si, si
        jle     br_b7197
        dec     si
        mov     ax, si
        push    ax
        nop
        push    cs
        call    fn_b71a3
        add     sp, 2
        mov     word ptr [bp - 4], ax
        jmp     br_b7197
br_b7159:
        cmp     word ptr [bp - 4], 0ah
        jnz     br_b7197
        mov     ax, si
        mov     dx, 28h
        imul    dx
        mov     bx, ax
        cmp     word ptr [bx + TBL_92DD], 0ffffh
        jz      br_b7197
        inc     si
        mov     ax, si
        push    ax
        nop
        push    cs
        call    fn_b71a3
        add     sp, 2
        mov     word ptr [bp - 4], ax
        jmp     br_b7197
br_b7180:
        nop
        push    cs
        call    fn_b83ad
        mov     di, ax
        or      ax, ax
        jz      br_b7197
        mov     word ptr [bp - 2], 1
        jmp     br_b7197
br_b7192:
        mov     word ptr [bp - 2], 1
br_b7197:
        cmp     word ptr [bp - 2], 0
        jz      loop_b7123
        mov     ax, di
        pop     di
        pop     si
        leave
        retf
fn_b71a3:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    si
        push    di
        mov     word ptr [bp - 4], 1
        xor     di, di
        mov     word ptr [bp - 6], 0
        mov     ax, word ptr [bp + 6]
        mov     dx, 0ah
        imul    dx
        mov     word ptr [bp - 2], ax
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word 0c8h
        push    20h
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        push    ds
        push    word B_901B
        callf   SEG_E5A9:far_e5a99
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     word ptr [W_92B5], 0ffffh
        jnz     br_b7216
        push    ds
        push    word STR_2F22
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_b7216:
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        mov     si, word ptr [bp - 2]
        shl     si, 2
        mov     ax, word ptr [bp - 2]
        shl     ax, 2
        add     ax, W_92B5
        mov     word ptr [bp - 8], ax
        jmp     near br_b72c6
br_b7235:
        mov     ax, di
        or      ax, ax
        jz      br_b7247
        cmp     ax, 1
        jz      br_b7257
        cmp     ax, 2
        jz      br_b7267
        jmp     br_b726f
br_b7247:
        push    0
        push    word ptr [bp - 4]
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        inc     di
        jmp     br_b726f
br_b7257:
        push    14h
        push    word ptr [bp - 4]
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        inc     di
        jmp     br_b726f
br_b7267:
        inc     word ptr [bp - 4]
        sub     di, 2
        jmp     br_b72c6
br_b726f:
        cmp     word ptr [si + TBL_92B9], 0ffffh
        jnz     br_b7299
        mov     al, byte ptr [si + TBL_92B8]
        cbw
        push    ax
        mov     al, byte ptr [si + TBL_92B7]
        cbw
        push    ax
        push    word ptr [W_904B]
        mov     bx, word ptr [bp - 8]
        push    word ptr [bx]
        push    ds
        push    word A_2F31
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ch
        jmp     br_b72bc
br_b7299:
        mov     al, byte ptr [si + TBL_92B8]
        cbw
        push    ax
        mov     al, byte ptr [si + TBL_92B7]
        cbw
        push    ax
        mov     ax, word ptr [si + TBL_92B9]
        dec     ax
        push    ax
        mov     bx, word ptr [bp - 8]
        push    word ptr [bx]
        push    ds
        push    word A_2F31
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ch
br_b72bc:
        add     si, 4
        add     word ptr [bp - 8], 4
        inc     word ptr [bp - 6]
br_b72c6:
        mov     bx, word ptr [bp - 8]
        cmp     word ptr [bx], 0ffffh
        jz      br_b72d7
        cmp     word ptr [bp - 6], 0ah
        jz      br_b72d7
        jmp     near br_b7235
br_b72d7:
        mov     ax, word ptr [bp - 6]
        pop     di
        pop     si
        leave
        retf
fn_b72de:
        push    bp
        mov     bp, sp
        sub     sp, 12h
        mov     byte ptr [B_D5DD], 3
        mov     ax, 1
        mov     word ptr [bp - 8], ax
        mov     word ptr [bp - 6], ax
        cmp     word ptr [W_904B], 3e7h
        jl      br_b72ff
        mov     word ptr [bp - 6], 0
br_b72ff:
        push    ds
        push    word STR_2F46
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_8A9F]
        mov     byte ptr [bp - 11h], al
        push    8
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 11h]
        push    ax
        push    ds
        push    word A_2F58
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0bh
        push    1
        mov     al, byte ptr [bp - 11h]
        cbw
        push    ax
        nop
        push    cs
        call    far_b8f3e
        add     sp, 6
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    word 3e7h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word STR_2F62
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_8287]
        cbw
        mov     word ptr [bp - 4], ax
        push    8
        push    1fh
        push    1
        push    2
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ds
        push    word STR_2F72
        callf   SEG_B347:far_b3819
        add     sp, 10h
        mov     al, byte ptr [B_8288]
        mov     byte ptr [bp - 1], al
        push    2
        push    ds
        push    word P_05C0+4
        push    ss
        lea     ax, [bp - 1]
        push    ax
        push    ds
        push    word A_2F83
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    word 3e7h
        push    1
        push    3
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    ds
        push    word STR_2F85
        callf   SEG_B347:far_b3819
        add     sp, 10h
        nop
        push    cs
        call    far_b9102
        jmp     near br_b7478
br_b73e4:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jz      br_b73f9
        cmp     ax, 1
        jz      br_b743e
        cmp     ax, 4
        jz      br_b745e
        jmp     near br_b7478
br_b73f9:
        push    0bh
        push    1
        mov     al, byte ptr [bp - 11h]
        cbw
        push    ax
        nop
        push    cs
        call    far_b8f3e
        add     sp, 6
        push    1
        mov     al, byte ptr [bp - 11h]
        cbw
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        mov     al, byte ptr [B_8287]
        cbw
        mov     word ptr [bp - 4], ax
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [B_8288]
        mov     byte ptr [bp - 1], al
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_b743e:
        mov     ax, word ptr [bp - 6]
        add     ax, word ptr [W_904B]
        cmp     ax, 3e7h
        jle     br_b7454
        mov     ax, 3e7h
        sub     ax, word ptr [W_904B]
        mov     word ptr [bp - 6], ax
br_b7454:
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_b745e:
        mov     ax, word ptr [bp - 8]
        cmp     ax, word ptr [W_904B]
        jle     br_b746e
        mov     ax, word ptr [W_904B]
        inc     ax
        mov     word ptr [bp - 8], ax
br_b746e:
        push    4
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_b7478:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jnz     br_b748b
        jmp     near br_b73e4
br_b748b:
        cmp     dx, 78h
        jz      br_b7493
        jmp     near br_b7554
br_b7493:
        cmp     word ptr [bp - 6], 0
        jnz     br_b749c
        jmp     near br_b754e
br_b749c:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_2F98
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        cmp     byte ptr [B_901B], 0
        jge     br_b7515
        mov     al, byte ptr [B_8287]
        cbw
        mov     word ptr [bp - 0ah], ax
        mov     al, byte ptr [B_8288]
        cbw
        mov     word ptr [bp - 0ch], ax
        mov     ax, word ptr [W_8281]
        mov     word ptr [bp - 0eh], ax
        mov     al, byte ptr [bp - 4]
        mov     byte ptr [B_8287], al
        mov     al, byte ptr [bp - 1]
        mov     byte ptr [B_8288], al
        mov     ax, word ptr [bp - 6]
        mov     word ptr [W_8281], ax
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_E15E:far_e15e2
        add     sp, 2
        mov     al, byte ptr [bp - 0ah]
        mov     byte ptr [B_8287], al
        mov     al, byte ptr [bp - 0ch]
        mov     byte ptr [B_8288], al
        mov     ax, word ptr [bp - 0eh]
        mov     word ptr [W_8281], ax
        jmp     br_b753f
br_b7515:
        mov     ax, 4
        mov     cl, byte ptr [bp - 1]
        shl     ax, cl
        push    ax
        push    word ptr [bp - 4]
        push    word ptr [bp - 8]
        push    word ptr [bp - 6]
        callf   SEG_E3AD:far_e3ad2
        add     sp, 8
        mov     word ptr [bp - 10h], ax
        or      ax, ax
        jge     br_b753f
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
br_b753f:
        push    word ptr [bp - 8]
        push    ds
        push    word B_901B
        callf   SEG_DEEE:far_deee8
        add     sp, 6
br_b754e:
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     dx, ax
br_b7554:
        mov     ax, dx
        leave
        retf
fn_b7558:
        push    bp
        mov     bp, sp
        sub     sp, 6
        mov     byte ptr [B_D5DD], 4
        mov     ax, word ptr [W_9053]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], ax
        push    word ptr [W_904B]
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ss
        lea     ax, [bp - 2]
        push    ax
        nop
        push    cs
        call    far_b9113
        add     sp, 0ah
        push    ds
        push    word STR_2FAB
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_8A9F]
        mov     byte ptr [bp - 5], al
        push    8
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 5]
        push    ax
        push    ds
        push    word A_2F58
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0bh
        push    1
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        nop
        push    cs
        call    far_b8f3e
        add     sp, 6
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    word 3e7h
        push    1
        push    3
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ds
        push    word A_2FB7
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    19h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0
        push    word 3e7h
        push    1
        push    3
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ds
        push    word A_2FC2
        callf   SEG_B347:far_b3819
        add     sp, 10h
        nop
        push    cs
        call    far_b9102
        jmp     br_b767d
loop_b761b:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jz      br_b762f
        cmp     ax, 1
        jz      br_b7653
        cmp     ax, 2
        jz      br_b7653
        jmp     br_b767d
br_b762f:
        push    0bh
        push    1
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        nop
        push    cs
        call    far_b8f3e
        add     sp, 6
        push    1
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
br_b7653:
        push    word ptr [W_904B]
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ss
        lea     ax, [bp - 2]
        push    ax
        nop
        push    cs
        call    far_b9113
        add     sp, 0ah
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_b767d:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_b761b
        cmp     dx, 78h
        jz      br_b7695
        jmp     near br_b773f
br_b7695:
        cmp     word ptr [W_904B], 0
        jg      br_b769f
        jmp     near br_b7739
br_b769f:
        mov     ax, word ptr [bp - 4]
        sub     ax, word ptr [bp - 2]
        inc     ax
        cmp     ax, word ptr [W_904B]
        jl      br_b7709
        push    1fh
        push    3
        push    66h
        callf   SEG_B3B9:far_b3cdb
        add     sp, 6
        nop
        push    cs
        call    far_b9102
        push    1
        callf   SEG_EBCC:far_ebda4
        add     sp, 2
        mov     dx, ax
        cmp     dx, 78h
        jnz     br_b773f
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_2FCC
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_E1E1:far_e1e11
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     dx, ax
        jmp     br_b773f
br_b7709:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_2FE2
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     ax, word ptr [bp - 4]
        inc     ax
        push    ax
        push    word ptr [bp - 2]
        callf   SEG_E1D5:far_e1d5f
        add     sp, 4
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     dx, ax
        jmp     br_b773f
br_b7739:
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     dx, ax
br_b773f:
        mov     ax, dx
        leave
        retf
fn_b7743:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        push    di
        mov     byte ptr [B_D5DD], 5
        push    ds
        push    word STR_2FF4
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        mov     al, byte ptr [B_8A9F]
        mov     byte ptr [B_9469], al
        mov     byte ptr [B_946B], al
        mov     ax, 1
        mov     word ptr [W_9466], ax
        mov     word ptr [W_9470], ax
        mov     ax, word ptr [W_904B]
        mov     word ptr [W_946E], ax
        inc     ax
        mov     word ptr [W_946C], ax
        mov     di, word ptr [W_904B]
        mov     si, di
        push    si
        push    ds
        push    word W_946E
        push    ds
        push    word W_9470
        nop
        push    cs
        call    far_b9113
        add     sp, 0ah
        push    8
        push    63h
        push    1
        push    2
        push    ds
        push    word B_946B
        push    ds
        push    word A_3003
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    6
        push    1
        mov     al, byte ptr [B_946B]
        cbw
        push    ax
        nop
        push    cs
        call    far_b8f3e
        add     sp, 6
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    word 3e7h
        push    1
        push    3
        push    ds
        push    word W_9470
        push    ds
        push    word A_2FB7
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    19h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0
        push    word 3e7h
        push    1
        push    3
        push    ds
        push    word W_946E
        push    ds
        push    word A_2FC2
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3008
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    63h
        push    1
        push    2
        push    ds
        push    word B_9469
        push    ds
        push    word A_3003
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    6
        push    4
        mov     al, byte ptr [B_9469]
        cbw
        push    ax
        nop
        push    cs
        call    far_b8f3e
        add     sp, 6
        push    19h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0
        push    word 3e7h
        push    1
        push    3
        push    ds
        push    word W_946C
        push    ds
        push    word STR_3015
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    word 3e7h
        push    1
        push    3
        push    ds
        push    word W_9466
        push    ds
        push    word A_3021
        callf   SEG_B347:far_b3819
        add     sp, 10h
        nop
        push    cs
        call    far_b9102
        jmp     br_b796a
br_b789d:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     bx, ax
        cmp     bx, 5
        jbe     br_b78ab
        jmp     near br_b796a
br_b78ab:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_b79dc]
tgt_b78b2:
        mov     al, byte ptr [B_946B]
        cbw
        push    ax
        callf   SEG_E49D:far_e49dd
        add     sp, 2
        mov     si, ax
        push    6
        push    1
        mov     al, byte ptr [B_946B]
        cbw
        push    ax
        nop
        push    cs
        call    far_b8f3e
        add     sp, 6
tgt_b78d2:
        push    si
        push    ds
        push    word W_946E
        push    ds
        push    word W_9470
        nop
        push    cs
        call    far_b9113
        add     sp, 0ah
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_b796a
tgt_b78f9:
        mov     al, byte ptr [B_9469]
        cbw
        push    ax
        callf   SEG_E49D:far_e49dd
        add     sp, 2
        mov     di, ax
        inc     ax
        mov     dx, ax
        cmp     ax, word ptr [W_946C]
        jge     br_b791f
        mov     word ptr [W_946C], dx
        push    4
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_b791f:
        push    6
        push    4
        mov     al, byte ptr [B_9469]
        cbw
        push    ax
        nop
        push    cs
        call    far_b8f3e
        add     sp, 6
        jmp     br_b796a
tgt_b7932:
        push    si
        push    word ptr [W_946E]
        push    word ptr [W_9470]
        push    ds
        push    word W_9466
        nop
        push    cs
        call    fn_b8379
        add     sp, 0ah
        push    5
        callf   SEG_B05A:far_b1073
        add     sp, 2
tgt_b7951:
        mov     ax, di
        inc     ax
        mov     dx, ax
        cmp     ax, word ptr [W_946C]
        jge     br_b796a
        mov     word ptr [W_946C], dx
        push    4
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_b796a:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jnz     br_b797d
        jmp     br_b789d
br_b797d:
        cmp     dx, 78h
        jnz     br_b79d6
        if      FW_VERSION >= 311
        mov     dx, word ptr [W_946E]
        sub     dx, word ptr [W_9470]
        inc     dx
        mov     ax, word ptr [W_9466]
        imul    dx
        add     ax, di
        cmp     ax, 3e7h
        jle     br_b79a3
        push    0fff6h
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        jmp     br_b79d0
br_b79a3:
        endif
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3029
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_E0E3:far_e0e31
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jge     br_b79d0
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
br_b79d0:
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     dx, ax
br_b79d6:
        mov     ax, dx
        pop     di
        pop     si
        leave
        retf
TBL_b79dc:
        dw      tgt_b78b2
        dw      tgt_b78d2
        dw      tgt_b78d2
        dw      tgt_b78f9
        dw      tgt_b7951
        dw      tgt_b7932
fn_b79e8:
        push    bp
        mov     bp, sp
        sub     sp, 4ch
        push    si
        push    di
        mov     byte ptr [B_D5DD], 6
        push    ds
        push    word STR_304A
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        mov     word ptr [W_9466], 1
        mov     al, byte ptr [B_8A9F]
        mov     byte ptr [B_9469], al
        mov     byte ptr [B_946B], al
        mov     al, byte ptr [B_8A9A]
        mov     byte ptr [bp - 0bh], al
        mov     byte ptr [B_9468], al
        mov     byte ptr [B_946A], al
        mov     word ptr [W_9480], 1
        mov     word ptr [W_947E], 100h
        mov     ax, word ptr [W_904B]
        xor     dx, dx
        add     dx, 100h
        adc     ax, 1
        mov     word ptr [W_947C], ax
        mov     word ptr [W_947A], dx
        mov     word ptr [W_9478], 1
        mov     word ptr [W_9476], 100h
        mov     al, byte ptr [B_946A]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_905D]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_90C1]
        cbw
        and     ax, 4
        mov     si, ax
        mov     word ptr [bp - 4], ax
        mov     word ptr [bp - 2], 1
        xor     di, di
        jmp     br_b7eea
br_b7a6b:
        cmp     word ptr [bp - 2], 0
        jnz     br_b7a74
        jmp     br_b7c34
br_b7a74:
        mov     word ptr [bp - 2], 0
        callf   SEG_B05A:far_b05a7
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    63h
        push    1
        push    2
        push    ds
        push    word B_946B
        push    ds
        push    word A_2F58
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0eh
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    8
        push    63h
        push    0
        push    2
        push    ds
        push    word B_946A
        push    ds
        push    word A_305B
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    16h
        push    1
        mov     al, byte ptr [B_946A]
        cbw
        push    ax
        mov     al, byte ptr [B_946B]
        cbw
        push    ax
        nop
        push    cs
        call    far_b9073
        add     sp, 8
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word W_947E
        push    ds
        push    word A_3062
        callf   SEG_B347:far_b39a2
        add     sp, 8
        push    ds
        push    word W_947A
        push    ds
        push    word A_3069
        callf   SEG_B347:far_b39a2
        add     sp, 8
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     byte ptr [B_946A], 0
        jnz     br_b7b27
        push    ds
        push    word STR_306B
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_b7b38
br_b7b27:
        mov     word ptr [bp - 4], si
        push    si
        push    ss
        lea     ax, [bp - 4ch]
        push    ax
        callf   SEG_B920:far_b9f33
        add     sp, 6
br_b7b38:
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3075
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    63h
        push    1
        push    2
        push    ds
        push    word B_9469
        push    ds
        push    word A_2F58
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0eh
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    63h
        push    0
        push    2
        push    ss
        lea     ax, [bp - 0bh]
        push    ax
        push    ds
        push    word A_305B
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    16h
        push    5
        mov     al, byte ptr [bp - 0bh]
        cbw
        push    ax
        mov     al, byte ptr [B_9469]
        cbw
        push    ax
        nop
        push    cs
        call    far_b9073
        add     sp, 8
        push    0
        push    6
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    7
        push    ds
        if      FW_VERSION >= 311
        push    word L_2DF1+1
        else
        push    word L_2AAF_V308+1
        endif
        push    ds
        push    word B_83CA
        push    ds
        push    word STR_3084
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0eh
        push    6
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    word 3e7h
        push    1
        push    3
        push    ds
        push    word W_9466
        push    ds
        push    word A_3021
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    19h
        push    6
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word W_9476
        push    ds
        push    word STR_308A
        callf   SEG_B347:far_b39a2
        add     sp, 8
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_3091
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_b7c34:
        or      si, si
        jz      br_b7c3c
        mov     al, 6
        jmp     br_b7c3e
br_b7c3c:
        mov     al, 3ch
br_b7c3e:
        mov     byte ptr [B_D5DD], al
        mov     byte ptr [B_9446], 1
        jmp     br_b7de3
br_b7c49:
        cmp     byte ptr [B_7B8D], 3
        jg      br_b7c81
        mov     byte ptr [B_D5DD], 6
        mov     al, byte ptr [B_7B8D]
        cbw
        push    ax
        callf   SEG_B05A:far_b130a
        add     sp, 2
        mov     byte ptr [B_D5DD], 3ch
        mov     al, byte ptr [B_7B8D]
        cbw
        push    ax
        callf   SEG_B05A:far_b130a
        add     sp, 2
        or      si, si
        jz      br_b7c7c
        mov     al, 6
        jmp     br_b7c7e
br_b7c7c:
        mov     al, 3ch
br_b7c7e:
        mov     byte ptr [B_D5DD], al
br_b7c81:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     bx, ax
        cmp     bx, 3
        jbe     br_b7c8f
        jmp     near br_b7d45
br_b7c8f:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_b7ef7]
tgt_b7c96:
        push    1
        mov     al, byte ptr [B_946B]
        cbw
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        mov     al, byte ptr [B_946B]
        cbw
        push    ax
        push    ds
        push    word W_947A
        push    ds
        push    word W_947E
        nop
        push    cs
        call    far_b915e
        add     sp, 0ah
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
tgt_b7cd2:
        push    17h
        push    1
        mov     al, byte ptr [B_946A]
        cbw
        push    ax
        mov     al, byte ptr [B_946B]
        cbw
        push    ax
        nop
        push    cs
        call    far_b9073
        add     sp, 8
        mov     al, byte ptr [B_946A]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_905D]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_90C1]
        cbw
        and     ax, 4
        mov     si, ax
        mov     word ptr [bp - 4], ax
        cmp     byte ptr [B_946A], 0
        jnz     br_b7d0f
        mov     byte ptr [bp - 0bh], 0
        jmp     br_b7d15
br_b7d0f:
        mov     al, byte ptr [B_9468]
        mov     byte ptr [bp - 0bh], al
br_b7d15:
        mov     word ptr [bp - 2], 1
        jmp     br_b7d45
tgt_b7d1c:
        mov     al, byte ptr [B_946B]
        cbw
        push    ax
        push    ds
        push    word W_947A
        push    ds
        push    word W_947E
        nop
        push    cs
        call    far_b915e
        add     sp, 0ah
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_b7d45:
        cmp     word ptr [bp - 2], 0
        jz      br_b7d4e
        jmp     near br_b7df6
br_b7d4e:
        or      si, si
        jz      br_b7d56
        xor     ax, ax
        jmp     br_b7d59
br_b7d56:
        mov     ax, 2
br_b7d59:
        mov     word ptr [bp - 6], ax
        mov     al, byte ptr [B_7B8D]
        cbw
        sub     ax, word ptr [bp - 6]
        cmp     ax, 4
        jz      br_b7d74
        cmp     ax, 5
        jz      br_b7da2
        cmp     ax, 8
        jz      br_b7d74
        jmp     br_b7de3
br_b7d74:
        mov     word ptr [bp - 8], 1
        mov     word ptr [bp - 0ah], 100h
        mov     al, byte ptr [B_9469]
        cbw
        push    ax
        push    ds
        push    word W_9476
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        nop
        push    cs
        call    far_b915e
        add     sp, 0ah
        mov     al, byte ptr [bp - 6]
        add     al, 8
        push    ax
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_b7da2:
        cmp     byte ptr [B_946A], 0
        jz      br_b7dbb
        cmp     byte ptr [bp - 0bh], 0
        jnz     br_b7db3
        mov     byte ptr [bp - 0bh], 1
br_b7db3:
        mov     al, byte ptr [bp - 0bh]
        mov     byte ptr [B_9468], al
        jmp     br_b7dbf
br_b7dbb:
        mov     byte ptr [bp - 0bh], 0
br_b7dbf:
        mov     al, byte ptr [bp - 6]
        add     al, 5
        push    ax
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    16h
        push    5
        mov     al, byte ptr [bp - 0bh]
        cbw
        push    ax
        mov     al, byte ptr [B_9469]
        cbw
        push    ax
        nop
        push    cs
        call    far_b9073
        add     sp, 8
br_b7de3:
        push    41h
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     di, ax
        or      ax, ax
        jnz     br_b7df6
        jmp     br_b7c49
br_b7df6:
        mov     byte ptr [B_9446], 0
        cmp     word ptr [bp - 2], 0
        jz      br_b7e04
        jmp     br_b7eea
br_b7e04:
        mov     ax, di
        cmp     ax, 44h
        jz      br_b7e18
        cmp     ax, 4eh
        jz      br_b7e18
        cmp     ax, 78h
        jz      br_b7e41
        jmp     br_b7eea
br_b7e18:
        cmp     byte ptr [B_946A], 0
        jnz     br_b7e24
        xor     di, di
        jmp     near br_b7eea
br_b7e24:
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ss
        lea     ax, [bp - 4ch]
        push    ax
        push    si
        push    4
        push    3
        push    di
        callf   SEG_B920:far_b9fbd
        add     sp, 10h
        mov     di, ax
        jmp     near br_b7eea
br_b7e41:
        callf   SEG_FF33:far_ffa1e
        mov     dx, ax
        or      ax, ax
        jz      br_b7e98
        cmp     dx, 0fffdh
        jnz     br_b7e85
        callf   SEG_B1AA:far_b1af9
        push    0bh
        push    1
        push    66h
        callf   SEG_B3B9:far_b3cdb
        add     sp, 6
        nop
        push    cs
        call    far_b9102
        push    1
        callf   SEG_EBCC:far_ebda4
        add     sp, 2
        mov     di, ax
        cmp     di, 78h
        jz      br_b7e7e
        pop     di
        pop     si
        leave
        retf
br_b7e7e:
        callf   SEG_B1AA:far_b1aff
        jmp     br_b7e98
br_b7e85:
        push    dx
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     di, ax
        pop     di
        pop     si
        leave
        retf
br_b7e98:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3099
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ss
        lea     ax, [bp - 4ch]
        push    ax
        mov     al, byte ptr [B_83CA]
        cbw
        push    ax
        callf   SEG_FF33:far_ff332
        add     sp, 6
        mov     dx, ax
        or      ax, ax
        jge     br_b7ed1
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
br_b7ed1:
        push    0
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     di, ax
br_b7eea:
        or      di, di
        jnz     br_b7ef1
        jmp     br_b7a6b
br_b7ef1:
        mov     ax, di
        pop     di
        pop     si
        leave
        retf
TBL_b7ef7:
        dw      tgt_b7c96
        dw      tgt_b7cd2
        dw      tgt_b7d1c
        dw      tgt_b7d1c
fn_b7eff:
        push    bp
        mov     bp, sp
        sub     sp, 6
        mov     byte ptr [B_D5DD], 7
        mov     al, byte ptr [B_8A9F]
        cbw
        mov     word ptr [bp - 2], ax
        callf   SEG_E600:far_e6006
        mov     word ptr [bp - 4], ax
        push    ds
        push    word STR_30AB
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ds
        push    word STR_30C8
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    17h
        push    2
        push    word ptr [bp - 2]
        nop
        push    cs
        call    far_b8f3e
        add     sp, 6
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ds
        push    word STR_30DE
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    17h
        push    3
        push    word ptr [bp - 4]
        nop
        push    cs
        call    far_b8f3e
        add     sp, 6
        nop
        push    cs
        call    far_b9102
        jmp     br_b7fb2
loop_b7f94:
        push    17h
        push    2
        push    word ptr [bp - 2]
        nop
        push    cs
        call    far_b8f3e
        add     sp, 6
        push    17h
        push    3
        push    word ptr [bp - 4]
        nop
        push    cs
        call    far_b8f3e
        add     sp, 6
br_b7fb2:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_b7f94
        cmp     dx, 78h
        jnz     br_b8003
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_30F4
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    word ptr [bp - 4]
        push    word ptr [bp - 2]
        callf   SEG_E13F:far_e13f9
        add     sp, 4
        mov     word ptr [bp - 6], ax
        or      ax, ax
        jz      br_b7ffd
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
br_b7ffd:
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     dx, ax
br_b8003:
        mov     ax, dx
        leave
        retf
fn_b8007:
        push    bp
        mov     bp, sp
        sub     sp, 46h
        push    si
        push    di
        mov     byte ptr [B_D5DD], 8
        push    ds
        push    word STR_3109
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        mov     word ptr [W_9480], 1
        mov     word ptr [W_947E], 100h
        mov     ax, word ptr [W_904B]
        xor     dx, dx
        add     dx, 100h
        adc     ax, 1
        mov     word ptr [W_947C], ax
        mov     word ptr [W_947A], dx
        mov     al, byte ptr [B_8A9F]
        mov     byte ptr [bp - 5], al
        mov     al, byte ptr [B_8A9A]
        mov     byte ptr [bp - 6], al
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_905D]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_90C1]
        cbw
        and     ax, 4
        mov     word ptr [bp - 4], ax
        mov     word ptr [bp - 2], ax
        mov     si, 1
        xor     di, di
        jmp     br_b82e7
br_b806b:
        or      si, si
        jnz     br_b8072
        jmp     br_b8252
br_b8072:
        xor     si, si
        callf   SEG_B05A:far_b05a7
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 5]
        push    ax
        push    ds
        push    word A_3116
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    8
        push    1
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        nop
        push    cs
        call    far_b8f3e
        add     sp, 6
        push    1bh
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    7
        push    ds
        push    word P_0220+8
        push    ds
        push    word B_E572
        push    ds
        push    word STR_311D
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word A_305B
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    8
        push    2
        mov     al, byte ptr [bp - 6]
        cbw
        push    ax
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        nop
        push    cs
        call    far_b9073
        add     sp, 8
        push    1bh
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    word 3e7h
        push    0
        push    3
        push    ds
        push    word W_E573
        push    ds
        push    word STR_3122
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word W_947E
        push    ds
        push    word A_3062
        callf   SEG_B347:far_b39a2
        add     sp, 8
        push    ds
        push    word W_947A
        push    ds
        push    word A_3069
        callf   SEG_B347:far_b39a2
        add     sp, 8
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 4]
        push    ss
        lea     ax, [bp - 46h]
        push    ax
        callf   SEG_B920:far_b9f33
        add     sp, 6
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        nop
        push    cs
        call    far_b9102
        jmp     near br_b8252
br_b818b:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     bx, ax
        cmp     bx, 5
        jbe     br_b8199
        jmp     near br_b824c
br_b8199:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_b82f4]
tgt_b81a0:
        push    8
        push    1
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        nop
        push    cs
        call    far_b8f3e
        add     sp, 6
        push    1
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        push    ds
        push    word W_947A
        push    ds
        push    word W_947E
        nop
        push    cs
        call    far_b915e
        add     sp, 0ah
        push    4
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    5
        callf   SEG_B05A:far_b1073
        add     sp, 2
tgt_b81ed:
        mov     al, byte ptr [bp - 6]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_905D]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_90C1]
        cbw
        and     ax, 4
        mov     word ptr [bp - 4], ax
        mov     word ptr [bp - 2], ax
        mov     si, 1
        jmp     br_b824c
tgt_b820d:
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_b824c
tgt_b8223:
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        push    ds
        push    word W_947A
        push    ds
        push    word W_947E
        nop
        push    cs
        call    far_b915e
        add     sp, 0ah
        push    4
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    5
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_b824c:
        or      si, si
        jz      br_b8252
        jmp     br_b8265
br_b8252:
        push    41h
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     di, ax
        or      ax, ax
        jnz     br_b8265
        jmp     br_b818b
br_b8265:
        or      si, si
        jz      br_b826b
        jmp     short br_b82e7
br_b826b:
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ss
        lea     ax, [bp - 46h]
        push    ax
        push    word ptr [bp - 4]
        if      FW_VERSION >= 311
        push    6
        else
        push    4
        endif
        push    4
        push    di
        callf   SEG_B920:far_b9fbd
        add     sp, 10h
        mov     di, ax
        cmp     di, 78h
        jnz     br_b82e7
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_312A
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ss
        lea     ax, [bp - 46h]
        push    ax
        push    word ptr [W_E573]
        mov     al, byte ptr [B_E572]
        cbw
        push    ax
        mov     al, byte ptr [bp - 6]
        cbw
        push    ax
        callf   SEG_FF33:far_ffbb1
        add     sp, 0ah
        mov     dx, ax
        or      ax, ax
        jge     br_b82e1
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        push    0
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
br_b82e1:
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     di, ax
br_b82e7:
        or      di, di
        jnz     br_b82ee
        jmp     br_b806b
br_b82ee:
        mov     ax, di
        pop     di
        pop     si
        leave
        retf
TBL_b82f4:
        dw      tgt_b81a0
        dw      tgt_b820d
        dw      tgt_b81ed
        dw      tgt_b820d
        dw      tgt_b8223
        dw      tgt_b8223
fn_b8300:
        push    bp
        mov     bp, sp
        sub     sp, 2
        mov     byte ptr [B_D5DD], 9
        push    ds
        push    word STR_313C
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    ds
        if      FW_VERSION >= 311
        push    word P_314B
        else
        push    word P_314B
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        nop
        push    cs
        call    far_b90dd
        push    0
        push    3
        push    ss
        lea     ax, [bp - 1]
        push    ax
        callf   SEG_EBCC:far_ebcce
        add     sp, 8
        mov     dx, ax
        or      dx, dx
        jnz     br_b8375
        mov     al, byte ptr [bp - 1]
        add     al, 5ah
        mov     byte ptr [B_D5DD], al
        mov     al, byte ptr [bp - 1]
        cbw
        cmp     ax, 1
        jz      br_b835c
        cmp     ax, 2
        jz      br_b8365
        cmp     ax, 3
        jz      br_b836e
        jmp     br_b8375
br_b835c:
        nop
        push    cs
        call    fn_b85a6
        mov     dx, ax
        jmp     br_b8375
br_b8365:
        nop
        push    cs
        call    fn_b88e1
        mov     dx, ax
        jmp     br_b8375
br_b836e:
        nop
        push    cs
        call    fn_b8bed
        mov     dx, ax
br_b8375:
        mov     ax, dx
        leave
        retf
fn_b8379:
        push    bp
        mov     bp, sp
        push    si
        mov     cx, word ptr [bp + 0eh]
        mov     si, word ptr [bp + 0ch]
        sub     si, word ptr [bp + 0ah]
        if      FW_VERSION >= 311
        inc     si
        endif
        cmp     cx, 3e7h
        jle     br_b8390
        mov     cx, 3e7h
br_b8390:
        les     bx, dword ptr [bp + 6]
        mov     ax, word ptr es:[bx]
        imul    si
        add     ax, cx
        cmp     ax, 3e7h
        jle     br_b83aa
        mov     ax, 3e7h
        sub     ax, cx
        cwd
        idiv    si
        mov     word ptr es:[bx], ax
br_b83aa:
        pop     si
        pop     bp
        retf
fn_b83ad:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    si
        mov     ax, word ptr [W_9053]
        mov     word ptr [bp - 8], ax
        cmp     ax, word ptr [W_904B]
        jle     br_b83c6
        mov     ax, word ptr [W_904B]
        mov     word ptr [bp - 8], ax
br_b83c6:
        cmp     byte ptr [B_901B], 0ffh
        jnz     br_b83d2
        xor     ax, ax
        pop     si
        leave
        retf
br_b83d2:
        mov     byte ptr [B_D5DD], 0bh
        push    ds
        push    word STR_319E
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    word 3e7h
        push    1
        push    3
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    ds
        push    word STR_31B4
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_8287]
        cbw
        mov     word ptr [bp - 2], ax
        push    8
        push    1fh
        push    1
        push    2
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ds
        push    word STR_31D6
        callf   SEG_B347:far_b3819
        add     sp, 10h
        mov     al, byte ptr [B_8288]
        mov     byte ptr [bp - 5], al
        push    2
        push    ds
        push    word P_05C0+4
        push    ss
        lea     ax, [bp - 5]
        push    ax
        push    ds
        push    word A_2F83
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_31E5
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_320E
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3232
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        push    word B_901B
        callf   SEG_E5A9:far_e5a99
        add     sp, 4
        push    word ptr [bp - 8]
        nop
        push    cs
        call    fn_b8557
        add     sp, 2
        mov     si, ax
        nop
        push    cs
        call    far_b9102
        jmp     br_b84e8
loop_b84ba:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jnz     br_b84e8
        mov     ax, word ptr [bp - 8]
        cmp     ax, word ptr [W_904B]
        jle     br_b84db
        mov     ax, word ptr [W_904B]
        mov     word ptr [bp - 8], ax
        push    0
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_b84db:
        push    word ptr [bp - 8]
        nop
        push    cs
        call    fn_b8557
        add     sp, 2
        mov     si, ax
br_b84e8:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_b84ba
        cmp     dx, 78h
        jnz     br_b8552
        mov     ax, word ptr [bp - 8]
        mov     word ptr [W_946C], ax
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3254
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     al, byte ptr [bp - 5]
        cbw
        shl     ax, 1
        mov     bx, ax
        mov     ax, word ptr [bx + TBL_2DFE]
        mov     word ptr [bp - 4], ax
        push    ax
        push    word ptr [bp - 2]
        mov     bx, si
        shl     bx, 2
        mov     al, byte ptr [bx + TBL_92B8]
        cbw
        push    ax
        mov     bx, si
        shl     bx, 2
        mov     al, byte ptr [bx + TBL_92B7]
        cbw
        push    ax
        callf   SEG_E6A4:far_e6a45
        add     sp, 8
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     dx, ax
br_b8552:
        mov     ax, dx
        pop     si
        leave
        retf
fn_b8557:
        push    bp
        mov     bp, sp
        push    si
        push    di
        mov     dx, word ptr [bp + 6]
        xor     di, di
        mov     si, TBL_92B9
loop_b8564:
        cmp     word ptr [si], dx
        ja      br_b8572
        add     si, 4
        inc     di
        if      FW_VERSION >= 312
        cmp     si, 93f9h
        elseif  FW_VERSION = 311
        cmp     si, 9341h
        else
        cmp     si, 87ceh
        endif
        jnz     loop_b8564
br_b8572:
        push    5
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     bx, di
        shl     bx, 2
        mov     al, byte ptr [bx + TBL_92B8]
        cbw
        push    ax
        mov     bx, di
        shl     bx, 2
        mov     al, byte ptr [bx + TBL_92B7]
        cbw
        push    ax
        push    ds
        if      FW_VERSION >= 311
        push    word STR_2F31+0dh
        else
        push    word STR_2F31+0dh
        endif
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        mov     ax, di
        pop     di
        pop     si
        pop     bp
        retf
fn_b85a6:
        push    bp
        mov     bp, sp
        sub     sp, 46h
        push    si
        push    di
        mov     byte ptr [B_D5DD], 5bh
        push    ds
        push    word STR_3265
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        mov     word ptr [W_9480], 1
        mov     word ptr [W_947E], 100h
        mov     ax, word ptr [W_904B]
        xor     dx, dx
        add     dx, 100h
        adc     ax, 1
        mov     word ptr [W_947C], ax
        mov     word ptr [W_947A], dx
        mov     al, byte ptr [B_8A9F]
        mov     byte ptr [bp - 6], al
        mov     al, byte ptr [B_8A9A]
        mov     byte ptr [bp - 5], al
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_905D]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_90C1]
        cbw
        and     ax, 4
        mov     word ptr [bp - 4], ax
        mov     word ptr [bp - 2], ax
        mov     si, 1
        xor     di, di
        jmp     br_b88c6
br_b860a:
        or      si, si
        jnz     br_b8611
        jmp     br_b883c
br_b8611:
        xor     si, si
        callf   SEG_B05A:far_b05a7
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word A_3116
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    8
        push    1
        mov     al, byte ptr [bp - 6]
        cbw
        push    ax
        nop
        push    cs
        call    far_b8f3e
        add     sp, 6
        push    1bh
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    8
        push    ds
        if      FW_VERSION >= 311
        push    word P_2DD1+1
        else
        push    word P_2A8F_V308+1
        endif
        push    ds
        push    word B_83CB
        push    ds
        push    word STR_327C
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 5]
        push    ax
        push    ds
        push    word A_305B
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    8
        push    2
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        mov     al, byte ptr [bp - 6]
        cbw
        push    ax
        nop
        push    cs
        call    far_b9073
        add     sp, 8
        push    1bh
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0ah
        push    ds
        if      FW_VERSION >= 311
        push    word P_2DD1+0dh
        else
        push    word P_2A8F_V308+0dh
        endif
        push    ds
        push    word B_83CC
        push    ds
        push    word STR_3282
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word W_947E
        push    ds
        push    word A_3062
        callf   SEG_B347:far_b39a2
        add     sp, 8
        push    ds
        push    word W_947A
        push    ds
        push    word A_3069
        callf   SEG_B347:far_b39a2
        add     sp, 8
        push    1bh
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0
        push    word 270fh
        push    0
        push    4
        push    ds
        push    word W_83CD
        push    ds
        push    word STR_3286
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 4]
        push    ss
        lea     ax, [bp - 46h]
        push    ax
        callf   SEG_B920:far_b9f33
        add     sp, 6
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        nop
        push    cs
        call    far_b9102
        jmp     br_b883c
br_b8746:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     bx, ax
        cmp     bx, 6
        jbe     br_b8754
        jmp     br_b8836
br_b8754:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_b88d3]
tgt_b875b:
        push    8
        push    1
        mov     al, byte ptr [bp - 6]
        cbw
        push    ax
        nop
        push    cs
        call    far_b8f3e
        add     sp, 6
        push    1
        mov     al, byte ptr [bp - 6]
        cbw
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        push    ds
        push    word W_947A
        push    ds
        push    word W_947E
        nop
        push    cs
        call    far_b915e
        add     sp, 0ah
        push    4
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    5
        callf   SEG_B05A:far_b1073
        add     sp, 2
tgt_b87a8:
        mov     al, byte ptr [bp - 5]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_905D]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_90C1]
        cbw
        and     ax, 4
        mov     word ptr [bp - 4], ax
        mov     word ptr [bp - 2], ax
        push    8
        push    2
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        mov     al, byte ptr [bp - 6]
        cbw
        push    ax
        nop
        push    cs
        call    far_b9073
        add     sp, 8
        mov     si, 1
tgt_b87dc:
        cmp     byte ptr [B_83CB], 0
        jz      br_b87e8
        mov     ax, 270fh
        jmp     br_b87eb
br_b87e8:
        mov     ax, 7fh
br_b87eb:
        mov     dx, ax
        cmp     byte ptr [B_83CC], 2
        jnz     br_b87f7
        mov     dx, 0c8h
br_b87f7:
        cmp     word ptr [W_83CD], dx
        jle     br_b8836
        mov     word ptr [W_83CD], dx
        push    6
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_b8836
tgt_b880d:
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        push    ds
        push    word W_947A
        push    ds
        push    word W_947E
        nop
        push    cs
        call    far_b915e
        add     sp, 0ah
        push    4
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    5
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_b8836:
        or      si, si
        jz      br_b883c
        jmp     br_b884f
br_b883c:
        push    41h
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     di, ax
        or      ax, ax
        jnz     br_b884f
        jmp     br_b8746
br_b884f:
        or      si, si
        jz      br_b8855
        jmp     br_b88c6
br_b8855:
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ss
        lea     ax, [bp - 46h]
        push    ax
        push    word ptr [bp - 4]
        push    7
        push    4
        push    di
        callf   SEG_B920:far_b9fbd
        add     sp, 10h
        mov     di, ax
        cmp     ax, 78h
        jz      br_b8878
        jmp     br_b88c6
br_b8878:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_328D
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    ss
        lea     ax, [bp - 46h]
        push    ax
        mov     al, byte ptr [B_8A9F]
        push    ax
        mov     al, byte ptr [bp - 5]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_905D]
        push    ax
        push    word ptr [W_83CD]
        mov     al, byte ptr [B_83CC]
        cbw
        push    ax
        mov     al, byte ptr [B_83CB]
        push    ax
        callf   SEG_E7A8:far_e7a8c
        add     sp, 0eh
        mov     di, 4dh
br_b88c6:
        or      di, di
        jnz     br_b88cd
        jmp     br_b860a
br_b88cd:
        mov     ax, di
        pop     di
        pop     si
        leave
        retf
TBL_b88d3:
        dw      tgt_b875b
        dw      tgt_b87dc
        dw      tgt_b87a8
        dw      tgt_b87dc
        dw      tgt_b880d
        dw      tgt_b880d
        dw      tgt_b87dc
fn_b88e1:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    si
        push    di
        mov     byte ptr [B_D5DD], 5ch
        push    ds
        push    word STR_32A2
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        cmp     byte ptr [B_E575], 0
        jnz     br_b8907
        mov     al, byte ptr [B_D4C0]
        mov     byte ptr [B_E575], al
br_b8907:
        cmp     byte ptr [B_E576], 0
        jnz     br_b8914
        mov     al, byte ptr [B_D4C0]
        mov     byte ptr [B_E576], al
br_b8914:
        mov     al, byte ptr [B_8A9F]
        cbw
        mov     word ptr [bp - 6], ax
        mov     al, byte ptr [B_8A9A]
        mov     byte ptr [bp - 3], al
        mov     word ptr [W_9480], 1
        mov     word ptr [W_947E], 100h
        mov     ax, word ptr [W_904B]
        xor     dx, dx
        add     dx, 100h
        adc     ax, 1
        mov     word ptr [W_947C], ax
        mov     word ptr [W_947A], dx
        mov     al, byte ptr [B_8A9A]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_905D]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_90C1]
        cbw
        and     ax, 4
        mov     word ptr [bp - 2], ax
        mov     si, 1
        xor     di, di
        jmp     br_b8bd4
br_b8960:
        or      si, si
        jnz     br_b8967
        jmp     br_b8b67
br_b8967:
        xor     si, si
        callf   SEG_B05A:far_b05a7
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word A_3116
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    8
        push    1
        push    word ptr [bp - 6]
        nop
        push    cs
        call    far_b8f3e
        add     sp, 6
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 3]
        push    ax
        push    ds
        push    word A_305B
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    8
        push    2
        mov     al, byte ptr [bp - 3]
        cbw
        push    ax
        push    word ptr [bp - 6]
        nop
        push    cs
        call    far_b9073
        add     sp, 8
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     word ptr [bp - 2], 0
        jnz     br_b89f0
        jmp     near br_b8a8a
br_b89f0:
        push    ds
        push    word W_947E
        push    ds
        push    word A_3062
        callf   SEG_B347:far_b39a2
        add     sp, 8
        push    ds
        push    word W_947A
        push    ds
        push    word A_3069
        callf   SEG_B347:far_b39a2
        add     sp, 8
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    18h
        push    62h
        push    23h
        push    2
        push    ds
        push    word B_E575
        push    ds
        push    word STR_32BE
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    10h
        push    0fh
        push    4
        mov     al, byte ptr [B_E575]
        cbw
        push    ax
        nop
        push    cs
        call    far_b9045
        add     sp, 8
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    18h
        push    62h
        push    23h
        push    2
        push    ds
        push    word B_E576
        push    ds
        push    word STR_32CC
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    10h
        push    0fh
        push    5
        mov     al, byte ptr [B_E576]
        cbw
        push    ax
        nop
        push    cs
        call    far_b9045
        add     sp, 8
        jmp     br_b8aa2
br_b8a8a:
        push    ds
        push    word A_32DA
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    50h
        push    20h
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
br_b8aa2:
        nop
        push    cs
        call    far_b9102
        jmp     near br_b8b67
br_b8aaa:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     bx, ax
        cmp     bx, 5
        jbe     br_b8ab8
        jmp     near br_b8b61
br_b8ab8:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_b8be1]
tgt_b8abf:
        push    8
        push    1
        push    word ptr [bp - 6]
        nop
        push    cs
        call    far_b8f3e
        add     sp, 6
        push    1
        push    word ptr [bp - 6]
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
tgt_b8adf:
        mov     al, byte ptr [bp - 3]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_905D]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_90C1]
        cbw
        and     ax, 4
        mov     word ptr [bp - 2], ax
        push    8
        push    2
        mov     al, byte ptr [bp - 3]
        cbw
        push    ax
        push    word ptr [bp - 6]
        nop
        push    cs
        call    far_b9073
        add     sp, 8
        mov     si, 1
tgt_b8b0e:
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        push    ds
        push    word W_947A
        push    ds
        push    word W_947E
        nop
        push    cs
        call    far_b915e
        add     sp, 0ah
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_b8b61
tgt_b8b39:
        push    10h
        push    0fh
        push    4
        mov     al, byte ptr [B_E575]
        cbw
        push    ax
        nop
        push    cs
        call    far_b9045
        add     sp, 8
        jmp     br_b8b61
tgt_b8b4e:
        push    10h
        push    0fh
        push    5
        mov     al, byte ptr [B_E576]
        cbw
        push    ax
        nop
        push    cs
        call    far_b9045
        add     sp, 8
br_b8b61:
        or      si, si
        jz      br_b8b67
        jmp     br_b8b7a
br_b8b67:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     di, ax
        or      ax, ax
        jnz     br_b8b7a
        jmp     br_b8aaa
br_b8b7a:
        or      si, si
        jz      br_b8b80
        jmp     br_b8bd4
br_b8b80:
        mov     ax, di
        cmp     ax, 78h
        jz      br_b8b89
        jmp     br_b8bd4
br_b8b89:
        if      FW_VERSION >= 311
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_328D_2
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        endif
        mov     al, byte ptr [B_E576]
        cbw
        push    ax
        mov     al, byte ptr [B_E575]
        cbw
        push    ax
        mov     al, byte ptr [bp - 3]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_905D]
        cbw
        push    ax
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_DEB7:far_deb78
        add     sp, 8
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     di, ax
br_b8bd4:
        or      di, di
        jnz     br_b8bdb
        jmp     br_b8960
br_b8bdb:
        mov     ax, di
        pop     di
        pop     si
        leave
        retf
TBL_b8be1:
        dw      tgt_b8abf
        dw      tgt_b8adf
        dw      tgt_b8b0e
        dw      tgt_b8b0e
        dw      tgt_b8b39
        dw      tgt_b8b4e
fn_b8bed:
        push    bp
        mov     bp, sp
        sub     sp, 46h
        push    si
        push    di
        mov     byte ptr [B_D5DD], 5dh
        push    ds
        push    word STR_32FC
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        mov     al, byte ptr [B_8A9F]
        cbw
        mov     word ptr [bp - 6], ax
        mov     al, byte ptr [B_8A9A]
        mov     byte ptr [bp - 3], al
        mov     word ptr [W_9480], 1
        mov     word ptr [W_947E], 100h
        mov     ax, word ptr [W_904B]
        xor     dx, dx
        add     dx, 100h
        adc     ax, 1
        mov     word ptr [W_947C], ax
        mov     word ptr [W_947A], dx
        mov     word ptr [bp - 2], 0
        mov     si, 1
        push    ds
        push    word B_E577
        callf   SEG_DA7E:far_da8cb
        add     sp, 4
        cmp     byte ptr [B_E577], 0
        jnz     br_b8c5a
        cmp     word ptr [W_E578], 0
        jnz     br_b8c5a
        mov     word ptr [W_E578], 40h
br_b8c5a:
        xor     di, di
        jmp     br_b8f1b
br_b8c5f:
        or      si, si
        jnz     br_b8c66
        jmp     br_b8e60
br_b8c66:
        xor     si, si
        callf   SEG_B05A:far_b05a7
        mov     al, byte ptr [bp - 3]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_905D]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_90C1]
        cbw
        and     ax, 4
        mov     di, ax
        mov     word ptr [bp - 2], ax
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word A_3116
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    8
        push    1
        push    word ptr [bp - 6]
        nop
        push    cs
        call    far_b8f3e
        add     sp, 6
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 3]
        push    ax
        push    ds
        push    word A_305B
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    8
        push    2
        mov     al, byte ptr [bp - 3]
        cbw
        push    ax
        push    word ptr [bp - 6]
        nop
        push    cs
        call    far_b9073
        add     sp, 8
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        or      di, di
        jnz     br_b8d07
        jmp     near br_b8d92
br_b8d07:
        push    ds
        push    word W_947E
        push    ds
        push    word A_3062
        callf   SEG_B347:far_b39a2
        add     sp, 8
        push    ds
        push    word W_947A
        push    ds
        push    word A_3069
        callf   SEG_B347:far_b39a2
        add     sp, 8
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    di
        push    ss
        lea     ax, [bp - 46h]
        push    ax
        callf   SEG_B920:far_b9f33
        add     sp, 6
        mov     word ptr [bp - 2], 1
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    6
        push    ds
        push    word P_0230+4
        push    ds
        push    word B_E577
        push    ds
        push    word STR_3315
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    word SEG_DA7E
        if      FW_VERSION >= 312
        push    word 0fdh
        elseif  FW_VERSION = 311
        push    word 103h
        else
        push    word 107h
        endif
        push    0
        push    7fh
        push    0
        push    4
        push    ds
        push    word W_E578
        push    ds
        push    word STR_3329
        callf   SEG_B347:far_b3723
        add     sp, 14h
        jmp     br_b8daa
br_b8d92:
        push    ds
        push    word A_32DA
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    50h
        push    20h
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
br_b8daa:
        nop
        push    cs
        call    far_b9102
        push    5
        callf   SEG_DA7E:far_da970
        add     sp, 2
        jmp     near br_b8e60
br_b8dbc:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     bx, ax
        cmp     bx, 4
        jbe     br_b8dca
        jmp     near br_b8e5a
br_b8dca:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_b8f34]
tgt_b8dd1:
        push    8
        push    1
        push    word ptr [bp - 6]
        nop
        push    cs
        call    far_b8f3e
        add     sp, 6
        push    1
        push    word ptr [bp - 6]
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
tgt_b8df1:
        mov     al, byte ptr [bp - 3]
        cbw
        mov     dx, ax
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_905D]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_90C1]
        cbw
        and     ax, 4
        push    8
        push    2
        push    dx
        push    word ptr [bp - 6]
        nop
        push    cs
        call    far_b9073
        add     sp, 8
        mov     si, 1
tgt_b8e1b:
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        push    ds
        push    word W_947A
        push    ds
        push    word W_947E
        nop
        push    cs
        call    far_b915e
        add     sp, 0ah
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_b8e5a
tgt_b8e46:
        push    5
        callf   SEG_DA7E:far_da970
        add     sp, 2
        push    5
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_b8e5a:
        or      si, si
        jz      br_b8e60
        jmp     br_b8e73
br_b8e60:
        push    41h
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     di, ax
        or      ax, ax
        jnz     br_b8e73
        jmp     near br_b8dbc
br_b8e73:
        or      si, si
        jz      br_b8e7a
        jmp     near br_b8f1b
br_b8e7a:
        mov     ax, di
        cmp     ax, 44h
        jz      br_b8e8e
        cmp     ax, 4eh
        jz      br_b8eea
        cmp     ax, 78h
        jz      br_b8eee
        jmp     near br_b8f1b
br_b8e8e:
        cmp     word ptr [bp - 2], 0
        jz      br_b8ebd
        push    ss
        pop     es
        lea     di, [bp - 46h]
        xor     ax, ax
        mov     ah, al
        mov     cx, 20h
        rep stosw
        push    6
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        mov     word ptr [bp - 2], 0
br_b8ebd:
        push    6
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_D4C0]
        cbw
        if      FW_VERSION < 311
        mov     cx, ax
        endif
        lea     dx, [bp - 69h]
        add     ax, dx
        mov     bx, ax
        mov     byte ptr ss:[bx], 1
        if      FW_VERSION >= 311
        mov     al, byte ptr [B_D4BF]
        cbw
        push    ax
        else
        push    cx
        endif
        push    ss
        lea     ax, [bp - 46h]
        push    ax
        callf   SEG_B920:far_b9755
        add     sp, 6
br_b8eea:
        xor     di, di
        jmp     br_b8f1b
br_b8eee:
        push    ss
        lea     ax, [bp - 46h]
        push    ax
        push    word ptr [W_E578]
        mov     al, byte ptr [B_E577]
        cbw
        push    ax
        mov     al, byte ptr [bp - 3]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_905D]
        cbw
        push    ax
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_E1EE:far_e1ee8
        add     sp, 0ch
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     di, ax
br_b8f1b:
        or      di, di
        jnz     br_b8f22
        jmp     br_b8c5f
br_b8f22:
        push    0
        push    0
        callf   SEG_DA7E:far_da8cb
        add     sp, 4
        mov     ax, di
        pop     di
        pop     si
        leave
        retf
TBL_b8f34:
        dw      tgt_b8dd1
        dw      tgt_b8df1
        dw      tgt_b8e1b
        dw      tgt_b8e1b
        dw      tgt_b8e46
far_b8f3e:
        push    bp
        mov     bp, sp
        sub     sp, 14h
        push    ss
        lea     ax, [bp - 14h]
        push    ax
        push    0ffffh
        push    word ptr [bp + 6]
        callf   SEG_E4D1:far_e4d15
        add     sp, 8
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    2dh
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        push    ss
        lea     ax, [bp - 14h]
        push    ax
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        leave
        retf
fn_b8f7d:
        push    bp
        mov     bp, sp
        sub     sp, 16h
        push    si
        push    di
        mov     di, word ptr [bp + 8]
        mov     si, word ptr [bp + 0ch]
        cmp     si, 14h
        jle     br_b8f93
        mov     si, 14h
br_b8f93:
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        push    word ptr [bp + 6]
        callf   SEG_CC84:far_cd8d0
        add     sp, 6
        mov     word ptr [bp - 2], ax
        push    word ptr [bp + 0ah]
        push    di
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    11h
        push    20h
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        push    word ptr [bp + 0ah]
        push    di
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     word ptr [bp - 2], 0
        jnz     br_b8fef
        or      si, si
        jle     br_b8fef
        push    2dh
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        mov     byte ptr [bp+si - 16h], 0
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_b8fef:
        pop     di
        pop     si
        leave
        retf
far_b8ff3:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        push    si
        mov     dx, word ptr [bp + 6]
        mov     al, byte ptr [B_D4C0]
        cbw
        cmp     ax, dx
        jnz     br_b900a
        mov     al, byte ptr [B_D4BF]
        cbw
        mov     si, ax
        jmp     br_b9015
br_b900a:
        push    dx
        else
        sub     sp, 2
        push    word ptr [bp + 6]
        endif
        callf   SEG_DAB0:far_dab37
        add     sp, 2
        if      FW_VERSION >= 311
        mov     si, ax
br_b9015:
        else
        mov     word ptr [bp - 2], ax
        endif
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    2fh
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        if      FW_VERSION >= 311
        mov     bx, si
        else
        mov     bx, word ptr [bp - 2]
        endif
        shl     bx, 2
        push    word ptr [bx + 276h]
        push    word ptr [bx + 274h]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        if      FW_VERSION >= 311
        pop     si
        pop     bp
        else
        leave
        endif
        retf
far_b9045:
        push    bp
        mov     bp, sp
        push    si
        push    di
        mov     si, word ptr [bp + 6]
        mov     di, word ptr [bp + 8]
        push    word ptr [bp + 0ah]
        push    di
        push    si
        push    cs
        call    far_b8ff3
        add     sp, 6
        push    word ptr [bp + 0ch]
        mov     ax, word ptr [bp + 0ah]
        add     ax, 4
        push    ax
        push    di
        push    si
        push    cs
        call    fn_b8f7d
        add     sp, 8
        pop     di
        pop     si
        pop     bp
        retf
far_b9073:
        push    bp
        mov     bp, sp
        sub     sp, 16h
        push    si
        push    di
        mov     si, word ptr [bp + 6]
        mov     ax, word ptr [bp + 8]
        or      ax, ax
        jnz     br_b9095
        push    ss
        pop     es
        lea     di, [bp - 16h]
        mov     si, STR_3333
        mov     cx, 8
        rep movsw
        movsb
        jmp     br_b90b4
br_b9095:
        push    ax
        push    si
        callf   SEG_E726:far_e7309
        add     sp, 4
        mov     word ptr [bp - 2], ax
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        mov     al, byte ptr [bp - 2]
        push    ax
        push    si
        callf   SEG_E4D1:far_e4d15
        add     sp, 8
br_b90b4:
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    2dh
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        pop     di
        pop     si
        leave
        retf
far_b90dd:
        push    0
        push    6
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        push    3dh
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        retf
far_b9102:
        push    cs
        call    far_b90dd
        push    ds
        push    word A_3091
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        retf
far_b9113:
        push    bp
        mov     bp, sp
        mov     dx, word ptr [bp + 0eh]
        cmp     dx, 1
        jge     br_b9121
        mov     dx, 1
br_b9121:
        les     bx, dword ptr [bp + 6]
        cmp     word ptr es:[bx], dx
        jle     br_b912c
        mov     word ptr es:[bx], dx
br_b912c:
        les     bx, dword ptr [bp + 6]
        cmp     word ptr es:[bx], 1
        jge     br_b913a
        mov     word ptr es:[bx], 1
br_b913a:
        les     bx, dword ptr [bp + 0ah]
        mov     ax, word ptr es:[bx]
        les     bx, dword ptr [bp + 6]
        cmp     ax, word ptr es:[bx]
        jge     br_b9151
        mov     ax, word ptr es:[bx]
        les     bx, dword ptr [bp + 0ah]
        mov     word ptr es:[bx], ax
br_b9151:
        les     bx, dword ptr [bp + 0ah]
        cmp     word ptr es:[bx], dx
        jle     br_b915c
        mov     word ptr es:[bx], dx
br_b915c:
        pop     bp
        retf
far_b915e:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    word ptr [bp + 0eh]
        callf   SEG_E49D:far_e49dd
        add     sp, 2
        xor     dx, dx
        add     dx, 100h
        adc     ax, 1
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        les     bx, dword ptr [bp + 6]
        mov     ax, word ptr es:[bx + 2]
        mov     dx, word ptr es:[bx]
        cmp     ax, word ptr [bp - 2]
        jl      br_b91a4
        jg      br_b9194
        cmp     dx, word ptr [bp - 4]
        jbe     br_b91a4
br_b9194:
        les     bx, dword ptr [bp + 6]
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        mov     word ptr es:[bx + 2], ax
        mov     word ptr es:[bx], dx
br_b91a4:
        les     bx, dword ptr [bp + 0ah]
        mov     ax, word ptr es:[bx + 2]
        mov     dx, word ptr es:[bx]
        les     bx, dword ptr [bp + 6]
        cmp     ax, word ptr es:[bx + 2]
        jg      br_b91d2
        jnz     br_b91be
        cmp     dx, word ptr es:[bx]
        ja      br_b91d2
br_b91be:
        les     bx, dword ptr [bp + 6]
        mov     ax, word ptr es:[bx + 2]
        mov     dx, word ptr es:[bx]
        les     bx, dword ptr [bp + 0ah]
        mov     word ptr es:[bx + 2], ax
        mov     word ptr es:[bx], dx
br_b91d2:
        les     bx, dword ptr [bp + 0ah]
        mov     ax, word ptr es:[bx + 2]
        mov     dx, word ptr es:[bx]
        cmp     ax, word ptr [bp - 2]
        jl      br_b91f8
        jg      br_b91e8
        cmp     dx, word ptr [bp - 4]
        jbe     br_b91f8
br_b91e8:
        les     bx, dword ptr [bp + 0ah]
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        mov     word ptr es:[bx + 2], ax
        mov     word ptr es:[bx], dx
br_b91f8:
        leave
        retf
        if      FW_VERSION >= 312
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        phase   5
        elseif  FW_VERSION = 311
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        phase   0eh
        else
        phase   4
far_fba0a:
        push    bp
        mov     bp, sp
        sub     sp, 2beh
        push    si
        push    di
        mov     byte ptr [B_D5DD], 6
        callf   SEG_B1AA:far_b1aac
        callf   SEG_B05A:far_b05a7
        push    0
        push    0
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3467
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    5
        push    0
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    ss
        lea     ax, [bp - 2beh]
        push    ax
        push    ss
        lea     ax, [bp - 0bah]
        push    ax
        nop
        push    cs
        call    far_fdcfb
        add     sp, 0ah
        mov     si, ax
        mov     al, byte ptr [B_DC32_V308]
        mov     byte ptr [bp - 2], al
        cmp     word ptr [B_DC32_V308], si
        jl      L_bfde8
        mov     byte ptr [bp - 2], 0
L_bfde8:
        push    10h
        push    ss
        lea     ax, [bp - 2beh]
        push    ax
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ds
        push    word STR_3490
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        cmp     si, 0ffffh
        jz      L_bfe22
        push    1fh
        push    0
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    L_c154c
        add     sp, 6
L_bfe22:
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_349A
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 4816h]
        mov     dx, word ptr es:[bx + 4814h]
        mov     word ptr [bp - 28h], ax
        mov     word ptr [bp - 2ah], dx
        cmp     si, 0ffffh
        jnz     L_bfe81
        mov     word ptr [bp - 28h], 0
        mov     word ptr [bp - 2ah], 0
L_bfe81:
        push    word ptr [bp - 28h]
        push    word ptr [bp - 2ah]
        push    ss
        lea     ax, [bp - 1ah]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    2
        push    word 3e7h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        push    ds
        push    word STR_34C3
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    2
        push    word 3e7h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        push    ds
        push    word P_34CD
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    2
        push    2bh
        push    0
        push    2
        push    ss
        lea     ax, [bp - 1ah]
        push    ax
        push    ds
        push    word P_34CD
        callf   SEG_B347:far_b3819
        add     sp, 10h
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 481eh]
        mov     dx, word ptr es:[bx + 481ch]
        mov     word ptr [bp - 30h], ax
        mov     word ptr [bp - 32h], dx
        mov     ax, word ptr [W_DF94_V308]
        mov     dx, word ptr [W_DF92_V308]
        cmp     ax, word ptr [bp - 30h]
        jl      L_bff2d
        jg      L_bff20
        cmp     dx, word ptr [bp - 32h]
        jbe     L_bff2d
L_bff20:
        mov     ax, word ptr [bp - 30h]
        mov     dx, word ptr [bp - 32h]
        mov     word ptr [W_DF94_V308], ax
        mov     word ptr [W_DF92_V308], dx
L_bff2d:
        cmp     word ptr [W_DF94_V308], 0
        jg      L_bff49
        jl      L_bff3d
        cmp     word ptr [W_DF92_V308], 0
        jnc     L_bff49
L_bff3d:
        mov     word ptr [W_DF94_V308], 0
        mov     word ptr [W_DF92_V308], 0
L_bff49:
        push    15h
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [W_DF94_V308]
        push    word ptr [W_DF92_V308]
        push    ss
        lea     ax, [bp - 0eh]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    2
        push    word 3e7h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        push    ds
        push    word STR_34CF
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    2
        push    word 3e7h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        push    ds
        push    word P_34CD
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    2
        push    2bh
        push    0
        push    2
        push    ss
        lea     ax, [bp - 0eh]
        push    ax
        push    ds
        push    word P_34CD
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 481ah]
        mov     dx, word ptr es:[bx + 4818h]
        mov     word ptr [bp - 2ch], ax
        mov     word ptr [bp - 2eh], dx
        cmp     si, 0ffffh
        jnz     27eh
        mov     word ptr [bp - 2ch], 0
        mov     word ptr [bp - 2eh], 0
        db      0ffh, 076h
        phase   280h
        db      0d4h
        push    word ptr [bp - 2eh]
        push    ss
        lea     ax, [bp - 20h]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    2
        push    word 3e7h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 1ch]
        push    ax
        push    ds
        push    word STR_34D9
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    2
        push    word 3e7h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        push    ds
        push    word P_34CD
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    2
        push    2bh
        push    0
        push    2
        push    ss
        lea     ax, [bp - 20h]
        push    ax
        push    ds
        push    word P_34CD
        callf   SEG_B347:far_b3819
        add     sp, 10h
        mov     ax, word ptr [W_DF90_V308]
        mov     dx, word ptr [W_DF8E_V308]
        cmp     ax, word ptr [bp - 30h]
        jl      L_c007e
        jg      L_c0071
        cmp     dx, word ptr [bp - 32h]
        jbe     L_c007e
L_c0071:
        mov     ax, word ptr [bp - 30h]
        mov     dx, word ptr [bp - 32h]
        mov     word ptr [W_DF90_V308], ax
        mov     word ptr [W_DF8E_V308], dx
L_c007e:
        mov     ax, word ptr [W_DF90_V308]
        mov     dx, word ptr [W_DF8E_V308]
        cmp     ax, word ptr [W_DF94_V308]
        jg      L_c00a1
        jl      L_c0093
        cmp     dx, word ptr [W_DF92_V308]
        jnc     L_c00a1
L_c0093:
        mov     ax, word ptr [W_DF94_V308]
        mov     dx, word ptr [W_DF92_V308]
        mov     word ptr [W_DF90_V308], ax
        mov     word ptr [W_DF8E_V308], dx
L_c00a1:
        cmp     word ptr [W_DF90_V308], 0
        jg      L_c00bd
        jl      L_c00b1
        cmp     word ptr [W_DF8E_V308], 0
        jnc     L_c00bd
L_c00b1:
        mov     word ptr [W_DF90_V308], 0
        mov     word ptr [W_DF8E_V308], 0
L_c00bd:
        push    15h
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [W_DF90_V308]
        push    word ptr [W_DF8E_V308]
        push    ss
        lea     ax, [bp - 14h]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    2
        push    word 3e7h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 10h]
        push    ax
        push    ds
        push    word STR_34E3
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    2
        push    word 3e7h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        push    ds
        push    word P_34CD
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    2
        push    2bh
        push    0
        push    2
        push    ss
        lea     ax, [bp - 14h]
        push    ax
        push    ds
        push    word P_34CD
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     si, 0ffffh
        jnz     L_c0146
        mov     word ptr [bp - 30h], 0
        mov     word ptr [bp - 32h], 0
L_c0146:
        push    word ptr [bp - 30h]
        push    word ptr [bp - 32h]
        push    ss
        lea     ax, [bp - 26h]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    word ptr [bp - 26h]
        push    word ptr [bp - 24h]
        push    word ptr [bp - 22h]
        push    ds
        push    word STR_34ED
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ah
        push    15h
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     byte ptr [bp - 4], 1
        push    0ch
        push    ds
        push    word P_3002_V308
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ds
        push    word STR_3505
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 4811h]
        mov     byte ptr [bp - 3], al
        cmp     si, 0ffffh
        jnz     L_c01ce
        mov     byte ptr [bp - 3], 64h
L_c01ce:
        push    8
        push    word 0c8h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 3]
        push    ax
        push    ds
        push    word STR_350D
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0ah
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 4812h]
        cbw
        mov     word ptr [bp - 8], ax
        cmp     si, 0ffffh
        jnz     L_c0223
        mov     word ptr [bp - 8], 0
L_c0223:
        push    0
        push    78h
        push    0ff88h
        push    4
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    ds
        push    word STR_3513
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    15h
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     byte ptr [bp - 5], 0
        push    10h
        push    ds
        push    word P_3022_V308
        push    ss
        lea     ax, [bp - 5]
        push    ax
        push    ds
        push    word STR_3519
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    6
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3519+4
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3546
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     byte ptr [bp - 1], 0
        jmp     L_c143a
L_c029a:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     bx, ax
        cmp     bx, 0fh
        jbe     L_c02a8
        jmp     L_c084d
L_c02a8:
        shl     bx, 1
        jmp     word ptr cs:[bx + L_c1483]
L_c02af:
        cmp     si, 0ffffh
        jnz     L_c02b7
        jmp     L_c084d
L_c02b7:
        mov     al, byte ptr [bp - 2]
        cbw
        mov     di, ax
        mov     word ptr [B_DC32_V308], ax
        mov     al, byte ptr [bp+di - 0bah]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 4811h]
        mov     byte ptr [bp - 3], al
        push    0eh
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 4812h]
        cbw
        mov     word ptr [bp - 8], ax
        push    0fh
        callf   SEG_B05A:far_b1073
        add     sp, 2
        cmp     si, 0ffffh
        jz      L_c0333
        push    1fh
        push    0
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    L_c154c
        add     sp, 6
L_c0333:
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 481eh]
        mov     dx, word ptr es:[bx + 481ch]
        mov     word ptr [bp - 30h], ax
        mov     word ptr [bp - 32h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 26h]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 26h]
        push    word ptr [bp - 24h]
        push    word ptr [bp - 22h]
        push    ds
        push    word STR_34ED
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ah
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 4816h]
        mov     dx, word ptr es:[bx + 4814h]
        mov     word ptr [bp - 28h], ax
        mov     word ptr [bp - 2ah], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 1ah]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 481ah]
        mov     dx, word ptr es:[bx + 4818h]
        mov     word ptr [bp - 2ch], ax
        mov     word ptr [bp - 2eh], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 20h]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    7
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    8
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    9
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     ax, word ptr [W_DF94_V308]
        mov     dx, word ptr [W_DF92_V308]
        cmp     ax, word ptr [bp - 30h]
        jl      L_c048e
        jg      L_c0454
        cmp     dx, word ptr [bp - 32h]
        jbe     L_c048e
L_c0454:
        mov     ax, word ptr [bp - 30h]
        mov     dx, word ptr [bp - 32h]
        mov     word ptr [W_DF94_V308], ax
        mov     word ptr [W_DF92_V308], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 0eh]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    4
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    5
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    6
        callf   SEG_B05A:far_b1073
        add     sp, 2
L_c048e:
        mov     ax, word ptr [W_DF90_V308]
        mov     dx, word ptr [W_DF8E_V308]
        cmp     ax, word ptr [bp - 30h]
        jge     L_c049d
        jmp     L_c084d
L_c049d:
        jg      L_c04a7
        cmp     dx, word ptr [bp - 32h]
        ja      L_c04a7
        jmp     L_c084d
L_c04a7:
        mov     ax, word ptr [bp - 30h]
        mov     dx, word ptr [bp - 32h]
        mov     word ptr [W_DF90_V308], ax
        mov     word ptr [W_DF8E_V308], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 14h]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    0ah
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    0bh
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    0ch
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     L_c084d
L_c04e4:
        push    ss
        lea     ax, [bp - 1ah]
        push    ax
        nop
        push    cs
        call    L_c231f
        add     sp, 4
        mov     word ptr [bp - 28h], dx
        mov     word ptr [bp - 2ah], ax
        mov     ax, word ptr [bp - 28h]
        mov     dx, word ptr [bp - 2ah]
        cmp     ax, word ptr [bp - 30h]
        jl      L_c0542
        jg      L_c0509
        cmp     dx, word ptr [bp - 32h]
        jbe     L_c0542
L_c0509:
        mov     ax, word ptr [bp - 30h]
        mov     dx, word ptr [bp - 32h]
        mov     word ptr [bp - 28h], ax
        mov     word ptr [bp - 2ah], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 1ah]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
L_c0542:
        mov     ax, word ptr [bp - 28h]
        mov     dx, word ptr [bp - 2ah]
        cmp     ax, word ptr [bp - 2ch]
        jl      L_c058d
        jg      L_c0554
        cmp     dx, word ptr [bp - 2eh]
        jbe     L_c058d
L_c0554:
        mov     ax, word ptr [bp - 28h]
        mov     dx, word ptr [bp - 2ah]
        mov     word ptr [bp - 2ch], ax
        mov     word ptr [bp - 2eh], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 20h]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    7
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    8
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    9
        callf   SEG_B05A:far_b1073
        add     sp, 2
L_c058d:
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, word ptr [bp - 28h]
        mov     cx, word ptr [bp - 2ah]
        mov     es, dx
        xchg    bx, ax
        mov     word ptr es:[bx + 4816h], ax
        mov     word ptr es:[bx + 4814h], cx
        jmp     L_c084d
L_c05bb:
        push    ss
        lea     ax, [bp - 0eh]
        push    ax
        nop
        push    cs
        call    L_c231f
        add     sp, 4
        mov     word ptr [W_DF94_V308], dx
        mov     word ptr [W_DF92_V308], ax
        mov     ax, word ptr [W_DF94_V308]
        mov     dx, word ptr [W_DF92_V308]
        cmp     ax, word ptr [bp - 30h]
        jl      L_c061c
        jg      L_c05e2
        cmp     dx, word ptr [bp - 32h]
        jbe     L_c061c
L_c05e2:
        mov     ax, word ptr [bp - 30h]
        mov     dx, word ptr [bp - 32h]
        mov     word ptr [W_DF94_V308], ax
        mov     word ptr [W_DF92_V308], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 0eh]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    4
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    5
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    6
        callf   SEG_B05A:far_b1073
        add     sp, 2
L_c061c:
        mov     ax, word ptr [W_DF94_V308]
        mov     dx, word ptr [W_DF92_V308]
        cmp     ax, word ptr [W_DF90_V308]
        jge     L_c062c
        jmp     L_c084d
L_c062c:
        jg      L_c0637
        cmp     dx, word ptr [W_DF8E_V308]
        ja      L_c0637
        jmp     L_c084d
L_c0637:
        mov     ax, word ptr [W_DF94_V308]
        mov     dx, word ptr [W_DF92_V308]
        mov     word ptr [W_DF90_V308], ax
        mov     word ptr [W_DF8E_V308], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 14h]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    0ah
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    0bh
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    0ch
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     L_c084d
L_c0675:
        push    ss
        lea     ax, [bp - 20h]
        push    ax
        nop
        push    cs
        call    L_c231f
        add     sp, 4
        mov     word ptr [bp - 2ch], dx
        mov     word ptr [bp - 2eh], ax
        mov     ax, word ptr [bp - 2ch]
        mov     dx, word ptr [bp - 2eh]
        cmp     ax, word ptr [bp - 30h]
        jl      L_c06d3
        jg      L_c069a
        cmp     dx, word ptr [bp - 32h]
        jbe     L_c06d3
L_c069a:
        mov     ax, word ptr [bp - 30h]
        mov     dx, word ptr [bp - 32h]
        mov     word ptr [bp - 2ch], ax
        mov     word ptr [bp - 2eh], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 20h]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    7
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    8
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    9
        callf   SEG_B05A:far_b1073
        add     sp, 2
L_c06d3:
        mov     ax, word ptr [bp - 2ch]
        mov     dx, word ptr [bp - 2eh]
        cmp     ax, word ptr [bp - 28h]
        jg      L_c071e
        jl      L_c06e5
        cmp     dx, word ptr [bp - 2ah]
        jnc     L_c071e
L_c06e5:
        mov     ax, word ptr [bp - 2ch]
        mov     dx, word ptr [bp - 2eh]
        mov     word ptr [bp - 28h], ax
        mov     word ptr [bp - 2ah], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 1ah]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
L_c071e:
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, word ptr [bp - 2ch]
        mov     cx, word ptr [bp - 2eh]
        mov     es, dx
        xchg    bx, ax
        mov     word ptr es:[bx + 481ah], ax
        mov     word ptr es:[bx + 4818h], cx
        jmp     L_c084d
L_c074c:
        push    ss
        lea     ax, [bp - 14h]
        push    ax
        nop
        push    cs
        call    L_c231f
        add     sp, 4
        mov     word ptr [W_DF90_V308], dx
        mov     word ptr [W_DF8E_V308], ax
        mov     ax, word ptr [W_DF90_V308]
        mov     dx, word ptr [W_DF8E_V308]
        cmp     ax, word ptr [bp - 30h]
        jl      L_c07ad
        jg      L_c0773
        cmp     dx, word ptr [bp - 32h]
        jbe     L_c07ad
L_c0773:
        mov     ax, word ptr [bp - 30h]
        mov     dx, word ptr [bp - 32h]
        mov     word ptr [W_DF90_V308], ax
        mov     word ptr [W_DF8E_V308], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 14h]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    0ah
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    0bh
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    0ch
        callf   SEG_B05A:far_b1073
        add     sp, 2
L_c07ad:
        mov     ax, word ptr [W_DF90_V308]
        mov     dx, word ptr [W_DF8E_V308]
        cmp     ax, word ptr [W_DF94_V308]
        jle     L_c07bd
        jmp     near L_c084d
L_c07bd:
        jl      L_c07c8
        cmp     dx, word ptr [W_DF92_V308]
        jc      L_c07c8
        jmp     near L_c084d
L_c07c8:
        mov     ax, word ptr [W_DF90_V308]
        mov     dx, word ptr [W_DF8E_V308]
        mov     word ptr [W_DF94_V308], ax
        mov     word ptr [W_DF92_V308], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 0eh]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    4
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    5
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    6
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     L_c084d
L_c0805:
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bl, byte ptr [bp - 3]
        mov     es, dx
        xchg    bx, ax
        mov     byte ptr es:[bx + 4811h], al
        jmp     L_c084d
L_c082a:
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bl, byte ptr [bp - 8]
        mov     es, dx
        xchg    bx, ax
        mov     byte ptr es:[bx + 4812h], al
L_c084d:
        push    44h
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     byte ptr [bp - 1], al
        or      al, al
        jnz     L_c0861
        jmp     L_c029a
L_c0861:
        cbw
        cmp     ax, 78h
        jz      L_c0894
        jg      L_c0884
        cmp     ax, 44h
        jnz     L_c0871
        jmp     L_c11ac
L_c0871:
        cmp     ax, 4eh
        jnz     L_c0879
        jmp     L_c11ac
L_c0879:
        cmp     ax, 75h
        jnz     L_c0881
        jmp     L_c0c9b
L_c0881:
        jmp     L_c143a
L_c0884:
        cmp     ax, 79h
        jz      L_c08cd
        cmp     ax, 7ah
        jnz     L_c0891
        jmp     near L_c093a
L_c0891:
        jmp     L_c143a
L_c0894:
        mov     byte ptr [bp - 1], 0
        cmp     si, 0ffffh
        jnz     L_c08a0
        jmp     L_c143a
L_c08a0:
        callf   SEG_CB8A:far_cc60f
        or      ax, ax
        jz      L_c08b1
        callf   SEG_CB8A:far_cc62d
        jmp     L_c143a
L_c08b1:
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        callf   SEG_CB8A:far_cc583
        add     sp, 2
        jmp     L_c143a
L_c08cd:
        mov     byte ptr [bp - 1], 0
        cmp     si, 0ffffh
        jnz     L_c08d9
        jmp     L_c143a
L_c08d9:
        push    ss
        lea     ax, [bp - 2ah]
        push    ax
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    L_c25ff
        add     sp, 6
        mov     byte ptr [bp - 1], al
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, word ptr [bp - 28h]
        mov     cx, word ptr [bp - 2ah]
        mov     es, dx
        xchg    bx, ax
        mov     word ptr es:[bx + 4816h], ax
        mov     word ptr es:[bx + 4814h], cx
        cmp     byte ptr [bp - 1], 4ch
        jz      L_c092d
        jmp     L_c143a
L_c092d:
        push    36h
        callf   SEG_D79E:far_d7a63
        add     sp, 2
        jmp     L_c143a
L_c093a:
        mov     byte ptr [bp - 1], 0
        cmp     si, 0ffffh
        jnz     L_c0946
        jmp     L_c143a
L_c0946:
        mov     ax, word ptr [bp - 28h]
        mov     dx, word ptr [bp - 2ah]
        mov     word ptr [bp - 34h], ax
        mov     word ptr [bp - 36h], dx
        mov     ax, word ptr [bp - 2ch]
        mov     dx, word ptr [bp - 2eh]
        mov     word ptr [bp - 38h], ax
        mov     word ptr [bp - 3ah], dx
        mov     al, byte ptr [bp - 4]
        cbw
        mov     bx, ax
        cmp     bx, 6
        jbe     L_c096c
        jmp     L_c0c42
L_c096c:
        shl     bx, 1
        jmp     word ptr cs:[bx + L_c1475]
L_c0973:
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     word ptr es:[bx + 4816h], 0
        mov     word ptr es:[bx + 4814h], 0
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, word ptr [bp - 30h]
        mov     cx, word ptr [bp - 32h]
        mov     es, dx
        xchg    bx, ax
        mov     word ptr es:[bx + 481ah], ax
        mov     word ptr es:[bx + 4818h], cx
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        nop
        push    cs
        call    L_c14a3
        add     sp, 2
        jmp     L_c0c42
L_c09e4:
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, word ptr [W_DF94_V308]
        mov     cx, word ptr [W_DF92_V308]
        mov     es, dx
        xchg    bx, ax
        mov     word ptr es:[bx + 4816h], ax
        mov     word ptr es:[bx + 4814h], cx
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, word ptr [W_DF90_V308]
        mov     cx, word ptr [W_DF8E_V308]
        mov     es, dx
        xchg    bx, ax
        mov     word ptr es:[bx + 481ah], ax
        mov     word ptr es:[bx + 4818h], cx
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        nop
        push    cs
        call    L_c14a3
        add     sp, 2
        jmp     L_c0c42
L_c0a5a:
        push    ds
        push    word STR_356C
        callf   SEG_CC84:far_cd551
        add     sp, 4
        mov     dl, al
        or      al, al
        jge     L_c0a6f
        jmp     L_c0c42
L_c0a6f:
        cbw
        push    ax
        nop
        push    cs
        call    L_c14a3
        add     sp, 2
        jmp     L_c0c42
L_c0a7c:
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     word ptr es:[bx + 4816h], 0
        mov     word ptr es:[bx + 4814h], 0
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, word ptr [W_DF94_V308]
        mov     cx, word ptr [W_DF92_V308]
        mov     es, dx
        xchg    bx, ax
        mov     word ptr es:[bx + 481ah], ax
        mov     word ptr es:[bx + 4818h], cx
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        nop
        push    cs
        call    L_c14a3
        add     sp, 2
        jmp     L_c0c42
L_c0aef:
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, word ptr [W_DF90_V308]
        mov     cx, word ptr [W_DF8E_V308]
        mov     es, dx
        xchg    bx, ax
        mov     word ptr es:[bx + 4816h], ax
        mov     word ptr es:[bx + 4814h], cx
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, word ptr [bp - 30h]
        mov     cx, word ptr [bp - 32h]
        mov     es, dx
        xchg    bx, ax
        mov     word ptr es:[bx + 481ah], ax
        mov     word ptr es:[bx + 4818h], cx
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        nop
        push    cs
        call    L_c14a3
        add     sp, 2
        jmp     L_c0c42
L_c0b63:
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     word ptr es:[bx + 4816h], 0
        mov     word ptr es:[bx + 4814h], 0
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, word ptr [bp - 28h]
        mov     cx, word ptr [bp - 2ah]
        mov     es, dx
        xchg    bx, ax
        mov     word ptr es:[bx + 481ah], ax
        mov     word ptr es:[bx + 4818h], cx
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        nop
        push    cs
        call    L_c14a3
        add     sp, 2
        jmp     L_c0c42
L_c0bd3:
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, word ptr [bp - 2ch]
        mov     cx, word ptr [bp - 2eh]
        mov     es, dx
        xchg    bx, ax
        mov     word ptr es:[bx + 4816h], ax
        mov     word ptr es:[bx + 4814h], cx
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, word ptr [bp - 30h]
        mov     cx, word ptr [bp - 32h]
        mov     es, dx
        xchg    bx, ax
        mov     word ptr es:[bx + 481ah], ax
        mov     word ptr es:[bx + 4818h], cx
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        nop
        push    cs
        call    L_c14a3
        add     sp, 2
L_c0c42:
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, word ptr [bp - 34h]
        mov     cx, word ptr [bp - 36h]
        mov     es, dx
        xchg    bx, ax
        mov     word ptr es:[bx + 4816h], ax
        mov     word ptr es:[bx + 4814h], cx
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, word ptr [bp - 38h]
        mov     cx, word ptr [bp - 3ah]
        mov     es, dx
        xchg    bx, ax
        mov     word ptr es:[bx + 481ah], ax
        mov     word ptr es:[bx + 4818h], cx
        jmp     L_c143a
L_c0c9b:
        mov     byte ptr [bp - 1], 0
        cmp     si, 0ffffh
        jnz     L_c0ca7
        jmp     L_c143a
L_c0ca7:
        mov     al, byte ptr [bp - 5]
        cbw
        mov     bx, ax
        cmp     bx, 5
        jbe     L_c0cb5
        jmp     L_c143a
L_c0cb5:
        shl     bx, 1
        jmp     word ptr cs:[bx + L_c1469]
L_c0cbc:
        mov     ax, word ptr [W_DF90_V308]
        mov     dx, word ptr [W_DF8E_V308]
        cmp     ax, word ptr [W_DF94_V308]
        jg      L_c0cd7
        jz      L_c0cce
        jmp     L_c143a
L_c0cce:
        cmp     dx, word ptr [W_DF92_V308]
        ja      L_c0cd7
        jmp     L_c143a
L_c0cd7:
        push    word ptr [W_DF90_V308]
        push    word ptr [W_DF8E_V308]
        push    word ptr [W_DF94_V308]
        push    word ptr [W_DF92_V308]
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    L_c1595
        add     sp, 0ah
        mov     di, ax
        or      di, di
        jl      L_c0d08
        jmp     L_c143a
L_c0d08:
        callf   SEG_B1AA:far_b1af9
        mov     ax, di
        mov     dx, 0ffffh
        imul    dx
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        callf   SEG_B1AA:far_b1aff
        jmp     L_c143a
L_c0d25:
        push    word ptr [W_DF94_V308]
        push    word ptr [W_DF92_V308]
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    L_c1712
        add     sp, 6
        mov     di, ax
        or      di, di
        jge     L_c0d65
        callf   SEG_B1AA:far_b1af9
        mov     ax, di
        mov     dx, 0ffffh
        imul    dx
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        callf   SEG_B1AA:far_b1aff
L_c0d65:
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 4816h]
        mov     dx, word ptr es:[bx + 4814h]
        mov     word ptr [bp - 28h], ax
        mov     word ptr [bp - 2ah], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 1ah]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 481ah]
        mov     dx, word ptr es:[bx + 4818h]
        mov     word ptr [bp - 2ch], ax
        mov     word ptr [bp - 2eh], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 20h]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    7
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    8
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    9
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 481eh]
        mov     dx, word ptr es:[bx + 481ch]
        mov     word ptr [bp - 30h], ax
        mov     word ptr [bp - 32h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 26h]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 26h]
        push    word ptr [bp - 24h]
        push    word ptr [bp - 22h]
        push    ds
        push    word STR_34ED
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ah
        jmp     L_c143a
L_c0e76:
        push    word ptr [W_DF90_V308]
        push    word ptr [W_DF8E_V308]
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    L_c1712
        add     sp, 6
        mov     di, ax
        or      di, di
        jge     L_c0eb6
        callf   SEG_B1AA:far_b1af9
        mov     ax, di
        mov     dx, 0ffffh
        imul    dx
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        callf   SEG_B1AA:far_b1aff
L_c0eb6:
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 4816h]
        mov     dx, word ptr es:[bx + 4814h]
        mov     word ptr [bp - 28h], ax
        mov     word ptr [bp - 2ah], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 1ah]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 481ah]
        mov     dx, word ptr es:[bx + 4818h]
        mov     word ptr [bp - 2ch], ax
        mov     word ptr [bp - 2eh], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 20h]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    7
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    8
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    9
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 481eh]
        mov     dx, word ptr es:[bx + 481ch]
        mov     word ptr [bp - 30h], ax
        mov     word ptr [bp - 32h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 26h]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 26h]
        push    word ptr [bp - 24h]
        push    word ptr [bp - 22h]
        push    ds
        push    word STR_34ED
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ah
        jmp     L_c143a
L_c0fc7:
        push    word ptr [W_DF90_V308]
        push    word ptr [W_DF8E_V308]
        push    word ptr [W_DF94_V308]
        push    word ptr [W_DF92_V308]
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    L_c1fec
        add     sp, 0ah
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 4816h]
        mov     dx, word ptr es:[bx + 4814h]
        mov     word ptr [bp - 28h], ax
        mov     word ptr [bp - 2ah], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 1ah]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 481ah]
        mov     dx, word ptr es:[bx + 4818h]
        mov     word ptr [bp - 2ch], ax
        mov     word ptr [bp - 2eh], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 20h]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    7
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    8
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    9
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 481eh]
        mov     dx, word ptr es:[bx + 481ch]
        mov     word ptr [bp - 30h], ax
        mov     word ptr [bp - 32h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 26h]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 26h]
        push    word ptr [bp - 24h]
        push    word ptr [bp - 22h]
        push    ds
        push    word STR_34ED
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ah
        mov     ax, word ptr [W_DF90_V308]
        mov     dx, word ptr [W_DF8E_V308]
        cmp     ax, word ptr [bp - 30h]
        jge     L_c110c
        jmp     L_c143a
L_c110c:
        jg      L_c1116
        cmp     dx, word ptr [bp - 32h]
        ja      L_c1116
        jmp     L_c143a
L_c1116:
        mov     ax, word ptr [bp - 30h]
        mov     dx, word ptr [bp - 32h]
        mov     word ptr [W_DF90_V308], ax
        mov     word ptr [W_DF8E_V308], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 14h]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    0ah
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    0bh
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    0ch
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     L_c143a
L_c1153:
        push    word ptr [W_DF90_V308]
        push    word ptr [W_DF8E_V308]
        push    word ptr [W_DF94_V308]
        push    word ptr [W_DF92_V308]
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    L_c1e74
        add     sp, 0ah
        jmp     L_c143a
L_c117e:
        push    word ptr [W_DF90_V308]
        push    word ptr [W_DF8E_V308]
        push    word ptr [W_DF94_V308]
        push    word ptr [W_DF92_V308]
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    L_c1bb4
        add     sp, 0ah
        jmp     L_c143a
L_c11a9:
        jmp     L_c143a
L_c11ac:
        mov     byte ptr [bp - 1], 0
        cmp     si, 0ffffh
        jnz     L_c11b8
        jmp     L_c143a
L_c11b8:
        mov     al, byte ptr [bp - 2]
        cbw
        mov     word ptr [B_DC32_V308], ax
        mov     al, byte ptr [B_D4C0]
        cbw
        mov     cx, ax
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        cmp     byte ptr es:[bx - 30ah], 0ffh
        jnz     L_c11db
        jmp     L_c143a
L_c11db:
        push    ss
        lea     ax, [bp - 0bah]
        push    ax
        push    cx
        callf   SEG_C495:far_c529a
        add     sp, 6
        cmp     ax, 0ffffh
        jnz     L_c11f2
        jmp     L_c143a
L_c11f2:
        push    ss
        lea     ax, [bp - 0bah]
        push    ax
        mov     al, byte ptr [B_D4C0]
        cbw
        push    ax
        callf   SEG_C495:far_c529a
        add     sp, 6
        dec     al
        mov     byte ptr [bp - 2], al
        push    0
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 4811h]
        mov     byte ptr [bp - 3], al
        push    0eh
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 4812h]
        cbw
        mov     word ptr [bp - 8], ax
        push    0fh
        callf   SEG_B05A:far_b1073
        add     sp, 2
        cmp     si, 0ffffh
        jz      L_c1292
        push    1fh
        push    0
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    L_c154c
        add     sp, 6
L_c1292:
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 481eh]
        mov     dx, word ptr es:[bx + 481ch]
        mov     word ptr [bp - 30h], ax
        mov     word ptr [bp - 32h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 26h]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 26h]
        push    word ptr [bp - 24h]
        push    word ptr [bp - 22h]
        push    ds
        push    word STR_34ED
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ah
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 4816h]
        mov     dx, word ptr es:[bx + 4814h]
        mov     word ptr [bp - 28h], ax
        mov     word ptr [bp - 2ah], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 1ah]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 481ah]
        mov     dx, word ptr es:[bx + 4818h]
        mov     word ptr [bp - 2ch], ax
        mov     word ptr [bp - 2eh], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 20h]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    7
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    8
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    9
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     ax, word ptr [W_DF94_V308]
        mov     dx, word ptr [W_DF92_V308]
        cmp     ax, word ptr [bp - 30h]
        jl      L_c13ed
        jg      L_c13b3
        cmp     dx, word ptr [bp - 32h]
        jbe     L_c13ed
L_c13b3:
        mov     ax, word ptr [bp - 30h]
        mov     dx, word ptr [bp - 32h]
        mov     word ptr [W_DF94_V308], ax
        mov     word ptr [W_DF92_V308], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 0eh]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    4
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    5
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    6
        callf   SEG_B05A:far_b1073
        add     sp, 2
L_c13ed:
        mov     ax, word ptr [W_DF90_V308]
        mov     dx, word ptr [W_DF8E_V308]
        cmp     ax, word ptr [bp - 30h]
        jl      L_c143a
        jg      L_c1400
        cmp     dx, word ptr [bp - 32h]
        jbe     L_c143a
L_c1400:
        mov     ax, word ptr [bp - 30h]
        mov     dx, word ptr [bp - 32h]
        mov     word ptr [W_DF90_V308], ax
        mov     word ptr [W_DF8E_V308], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 14h]
        push    ax
        nop
        push    cs
        call    L_c2373
        add     sp, 8
        push    0ah
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    0bh
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    0ch
        callf   SEG_B05A:far_b1073
        add     sp, 2
L_c143a:
        cmp     byte ptr [bp - 1], 0
        jnz     L_c1443
        jmp     L_c084d
L_c1443:
        push    ds
        push    word STR_356C
        callf   SEG_CC84:far_cd551
        add     sp, 4
        mov     dl, al
        or      al, al
        jl      L_c1461
        push    0
        cbw
        push    ax
        callf   SEG_CC84:far_cd353
        add     sp, 4
L_c1461:
        mov     al, byte ptr [bp - 1]
        cbw
        pop     di
        pop     si
        leave
        retf
L_c1469:
        dw      L_c0cbc
        dw      L_c0d25
        dw      L_c0e76
        dw      L_c0fc7
        dw      L_c1153
        dw      L_c117e
L_c1475:
        dw      L_c0973
        dw      L_c09e4
        dw      L_c0a5a
        dw      L_c0a7c
        dw      L_c0aef
        dw      L_c0b63
        dw      L_c0bd3
L_c1483:
        dw      L_c02af
        dw      L_c04e4
        dw      L_c04e4
        dw      L_c04e4
        dw      L_c05bb
        dw      L_c05bb
        dw      L_c05bb
        dw      L_c0675
        dw      L_c0675
        dw      L_c0675
        dw      L_c074c
        dw      L_c074c
        dw      L_c074c
        dw      L_c084d
        dw      L_c0805
        dw      L_c082a
L_c14a3:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    si
        push    di
        mov     di, word ptr [bp + 6]
        mov     ax, di
        mov     dx, 24h
        imul    dx
        mov     si, ax
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 481ah]
        mov     word ptr [bp - 6], ax
        mov     dx, word ptr es:[bx + 4818h]
        mov     word ptr [bp - 8], dx
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        add     dx, 557h
        adc     ax, 0
        mov     bx, SEG_A28F
        mov     es, bx
        cmp     ax, word ptr es:[si + 481eh]
        jg      L_c1504
        jnz     L_c14f0
        cmp     dx, word ptr es:[si + 481ch]
        ja      L_c1504
L_c14f0:
        mov     ax, SEG_A28F
        mov     es, ax
        add     word ptr es:[si + 4818h], 557h
        adc     word ptr es:[si + 481ah], 0
        jmp     L_c1522
L_c1504:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[si + 481eh]
        mov     dx, word ptr es:[si + 481ch]
        mov     bx, SEG_A28F
        mov     es, bx
        mov     word ptr es:[si + 481ah], ax
        mov     word ptr es:[si + 4818h], dx
L_c1522:
        push    di
        callf   SEG_CB8A:far_cc583
        add     sp, 2
        mov     ax, di
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, word ptr [bp - 2]
        mov     cx, word ptr [bp - 4]
        mov     es, dx
        xchg    bx, ax
        mov     word ptr es:[bx + 481ah], ax
        mov     word ptr es:[bx + 4818h], cx
        pop     di
        pop     si
        leave
        retf
L_c154c:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp + 0ah]
        cbw
        push    ax
        mov     al, byte ptr [bp + 8]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp + 6]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        cmp     byte ptr es:[bx + 4813h], 0
        jnz     L_c1587
        push    ds
        push    word STR_3579
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        pop     bp
        retf
L_c1587:
        push    ds
        push    word STR_3579+5
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        pop     bp
        retf
L_c1595:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    si
        push    ds
        push    word STR_356C
        callf   SEG_CC84:far_cd551
        add     sp, 4
        mov     byte ptr [bp - 1], al
        or      al, al
        jl      L_c15bb
        push    0
        cbw
        push    ax
        callf   SEG_CC84:far_cd353
        add     sp, 4
L_c15bb:
        mov     ax, word ptr [bp + 0eh]
        mov     dx, word ptr [bp + 0ch]
        sub     dx, word ptr [bp + 8]
        sbb     ax, word ptr [bp + 0ah]
        mov     word ptr [bp - 4], ax
        mov     word ptr [bp - 6], dx
        mov     al, byte ptr [bp + 6]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 4813h]
        mov     ah, 0
        push    ax
        push    word ptr [bp - 4]
        push    word ptr [bp - 6]
        push    ds
        push    word STR_356C
        callf   SEG_CC84:far_cce4b
        add     sp, 0ah
        mov     byte ptr [bp - 1], al
        cmp     byte ptr [bp - 1], 0
        jge     L_c1604
        cbw
        pop     si
        leave
        retf
L_c1604:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3583
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     ax, word ptr [bp + 0eh]
        mov     dx, word ptr [bp + 0ch]
        sub     dx, word ptr [bp + 8]
        sbb     ax, word ptr [bp + 0ah]
        push    ax
        push    dx
        mov     al, byte ptr [bp - 1]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        push    word ptr es:[bx + 4822h]
        push    word ptr es:[bx + 4820h]
        mov     al, byte ptr [bp + 6]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 4822h]
        mov     dx, word ptr es:[bx + 4820h]
        add     dx, word ptr [bp + 8]
        adc     ax, word ptr [bp + 0ah]
        push    ax
        push    dx
        callf   SEG_CC84:far_cd68a
        add     sp, 0ch
        mov     al, byte ptr [bp + 6]
        cbw
        mov     dx, 24h
        imul    dx
        mov     si, ax
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        cmp     byte ptr es:[bx + 4813h], 1
        jnz     L_c16f5
        mov     ax, word ptr [bp + 0eh]
        mov     dx, word ptr [bp + 0ch]
        sub     dx, word ptr [bp + 8]
        sbb     ax, word ptr [bp + 0ah]
        push    ax
        push    dx
        mov     al, byte ptr [bp - 1]
        cbw
        mov     dx, 24h
        imul    dx
        mov     word ptr [bp - 8], ax
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 4822h]
        mov     dx, word ptr es:[bx + 4820h]
        mov     bx, word ptr [bp - 8]
        mov     cx, SEG_A28F
        mov     es, cx
        add     dx, word ptr es:[bx + 481ch]
        adc     ax, word ptr es:[bx + 481eh]
        push    ax
        push    dx
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[si + 4822h]
        mov     dx, word ptr es:[si + 4820h]
        mov     bx, SEG_A28F
        mov     es, bx
        add     dx, word ptr es:[si + 481ch]
        adc     ax, word ptr es:[si + 481eh]
        add     dx, word ptr [bp + 8]
        adc     ax, word ptr [bp + 0ah]
        push    ax
        push    dx
        callf   SEG_CC84:far_cd68a
        add     sp, 0ch
L_c16f5:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3546
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        xor     ax, ax
        pop     si
        leave
        retf
L_c1712:
        push    bp
        mov     bp, sp
        sub     sp, 18h
        push    si
        push    di
        push    ds
        push    word STR_356C
        callf   SEG_CC84:far_cd551
        add     sp, 4
        mov     word ptr [bp - 14h], ax
        cmp     word ptr [bp - 14h], 0fffch
        jnz     L_c1735
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
L_c1735:
        mov     al, byte ptr [bp + 6]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        cmp     byte ptr es:[bx + 4813h], 0
        jz      L_c176c
        mov     ax, word ptr [bp - 14h]
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     dx, word ptr es:[bx + 481eh]
        mov     ax, word ptr es:[bx + 481ch]
        shl     ax, 1
        rcl     dx, 1
        jmp     L_c1785
L_c176c:
        mov     ax, word ptr [bp - 14h]
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     dx, word ptr es:[bx + 481eh]
        mov     ax, word ptr es:[bx + 481ch]
L_c1785:
        push    ax
        push    dx
        callf   SEG_CC84:far_cca70
        pop     bx
        cmp     bx, dx
        pop     dx
        jl      L_c179f
        jg      L_c1798
        cmp     dx, ax
        jbe     L_c179f
L_c1798:
        mov     ax, 0fffeh
        pop     di
        pop     si
        leave
        retf
L_c179f:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_35AB
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0ffffh
        push    0ffffh
        push    0
        callf   SEG_CC84:far_ccbdd
        add     sp, 6
        mov     al, byte ptr [bp + 6]
        cbw
        mov     dx, 24h
        imul    dx
        mov     di, ax
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 4822h]
        mov     dx, word ptr es:[bx + 4820h]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 481eh]
        mov     dx, word ptr es:[di + 481ch]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        mov     ax, SEG_A28F
        mov     es, ax
        mov     al, byte ptr es:[di + 4813h]
        mov     ah, 0
        mov     word ptr [bp - 18h], ax
        mov     ax, word ptr [bp - 14h]
        mov     dx, 24h
        imul    dx
        mov     si, ax
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 4822h]
        mov     dx, word ptr es:[bx + 4820h]
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp - 0ch], dx
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[si + 481eh]
        mov     dx, word ptr es:[si + 481ch]
        mov     word ptr [bp - 0eh], ax
        mov     word ptr [bp - 10h], dx
        mov     ax, SEG_A28F
        mov     es, ax
        mov     al, byte ptr es:[si + 4813h]
        mov     ah, 0
        mov     word ptr [bp - 16h], ax
        cmp     word ptr [bp - 18h], 1
        jnz     L_c18bf
        callf   SEG_CC84:far_ccab3
        add     ax, 7d0h
        adc     dx, 1
        mov     bx, word ptr [bp - 6]
        mov     si, word ptr [bp - 8]
        shl     si, 1
        rcl     bx, 1
        mov     cx, word ptr [bp - 2]
        mov     di, word ptr [bp - 4]
        add     di, si
        adc     cx, bx
        sub     ax, di
        sbb     dx, cx
        push    dx
        push    ax
        mov     ax, word ptr [bp - 6]
        mov     dx, word ptr [bp - 8]
        shl     dx, 1
        rcl     ax, 1
        mov     bx, word ptr [bp - 2]
        mov     cx, word ptr [bp - 4]
        add     cx, dx
        adc     bx, ax
        mov     ax, word ptr [bp - 0eh]
        mov     dx, word ptr [bp - 10h]
        shl     dx, 1
        rcl     ax, 1
        add     cx, dx
        adc     bx, ax
        push    bx
        push    cx
        mov     ax, word ptr [bp - 6]
        mov     dx, word ptr [bp - 8]
        shl     dx, 1
        rcl     ax, 1
        mov     bx, word ptr [bp - 2]
        mov     cx, word ptr [bp - 4]
        add     cx, dx
        adc     bx, ax
        push    bx
        push    cx
        callf   SEG_CC84:far_cd68a
        add     sp, 0ch
        jmp     L_c1906
L_c18bf:
        callf   SEG_CC84:far_ccab3
        add     ax, 7d0h
        adc     dx, 1
        mov     bx, word ptr [bp - 2]
        mov     cx, word ptr [bp - 4]
        add     cx, word ptr [bp - 8]
        adc     bx, word ptr [bp - 6]
        sub     ax, cx
        sbb     dx, bx
        push    dx
        push    ax
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        add     dx, word ptr [bp - 8]
        adc     ax, word ptr [bp - 6]
        add     dx, word ptr [bp - 10h]
        adc     ax, word ptr [bp - 0eh]
        push    ax
        push    dx
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        add     dx, word ptr [bp - 8]
        adc     ax, word ptr [bp - 6]
        push    ax
        push    dx
        callf   SEG_CC84:far_cd68a
        add     sp, 0ch
L_c1906:
        mov     word ptr [bp - 12h], 0
        xor     si, si
        mov     al, byte ptr [bp + 6]
        cbw
        mov     dx, 24h
        imul    dx
        mov     di, ax
L_c1918:
        mov     ax, SEG_A28F
        mov     es, ax
        cmp     byte ptr es:[si + 4800h], 0
        jz      L_c1970
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 4822h]
        mov     dx, word ptr es:[di + 4820h]
        mov     bx, SEG_A28F
        mov     es, bx
        cmp     ax, word ptr es:[si + 4822h]
        jg      L_c1970
        jl      L_c1949
        cmp     dx, word ptr es:[si + 4820h]
        jnc     L_c1970
L_c1949:
        cmp     word ptr [bp - 18h], 0
        jz      L_c195b
        mov     dx, word ptr [bp - 0eh]
        mov     ax, word ptr [bp - 10h]
        shl     ax, 1
        rcl     dx, 1
        jmp     L_c1961
L_c195b:
        mov     dx, word ptr [bp - 0eh]
        mov     ax, word ptr [bp - 10h]
L_c1961:
        mov     bx, SEG_A28F
        mov     es, bx
        add     word ptr es:[si + 4820h], ax
        adc     word ptr es:[si + 4822h], dx
L_c1970:
        add     si, 24h
        inc     word ptr [bp - 12h]
        cmp     si, 1200h
        jnz     L_c1918
        mov     ax, word ptr [bp - 14h]
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 4822h]
        mov     dx, word ptr es:[bx + 4820h]
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp - 0ch], dx
        mov     ax, SEG_A28F
        mov     es, ax
        cmp     byte ptr es:[di + 4813h], 1
        jz      L_c19ab
        jmp     near L_c1a35
L_c19ab:
        mov     ax, word ptr [bp - 6]
        mov     dx, word ptr [bp - 8]
        shl     dx, 1
        rcl     ax, 1
        mov     bx, word ptr [bp - 6]
        mov     cx, word ptr [bp - 8]
        add     cx, word ptr [bp + 8]
        adc     bx, word ptr [bp + 0ah]
        sub     dx, cx
        sbb     ax, bx
        push    ax
        push    dx
        mov     ax, word ptr [bp - 0eh]
        mov     dx, word ptr [bp - 10h]
        shl     dx, 1
        rcl     ax, 1
        mov     bx, word ptr [bp - 2]
        mov     cx, word ptr [bp - 4]
        add     cx, word ptr [bp - 8]
        adc     bx, word ptr [bp - 6]
        add     cx, word ptr [bp + 8]
        adc     bx, word ptr [bp + 0ah]
        add     cx, dx
        adc     bx, ax
        push    bx
        push    cx
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        add     dx, word ptr [bp - 8]
        adc     ax, word ptr [bp - 6]
        add     dx, word ptr [bp + 8]
        adc     ax, word ptr [bp + 0ah]
        push    ax
        push    dx
        callf   SEG_CC84:far_cd68a
        add     sp, 0ch
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        add     dx, word ptr [bp - 8]
        adc     ax, word ptr [bp - 6]
        add     dx, word ptr [bp - 10h]
        adc     ax, word ptr [bp - 0eh]
        push    ax
        push    dx
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        add     dx, word ptr [bp - 8]
        adc     ax, word ptr [bp - 6]
        push    ax
        push    dx
        callf   SEG_CC84:far_cd68a
        add     sp, 0ch
L_c1a35:
        mov     ax, word ptr [bp - 6]
        mov     dx, word ptr [bp - 8]
        sub     dx, word ptr [bp + 8]
        sbb     ax, word ptr [bp + 0ah]
        push    ax
        push    dx
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        add     dx, word ptr [bp + 8]
        adc     ax, word ptr [bp + 0ah]
        add     dx, word ptr [bp - 10h]
        adc     ax, word ptr [bp - 0eh]
        push    ax
        push    dx
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        add     dx, word ptr [bp + 8]
        adc     ax, word ptr [bp + 0ah]
        push    ax
        push    dx
        callf   SEG_CC84:far_cd68a
        add     sp, 0ch
        mov     al, byte ptr [bp + 6]
        cbw
        mov     dx, 24h
        imul    dx
        mov     di, ax
        mov     dx, SEG_A28F
        mov     bx, word ptr [bp - 0eh]
        mov     cx, word ptr [bp - 10h]
        mov     si, ax
        mov     es, dx
        add     word ptr es:[si + 481ch], cx
        mov     ax, word ptr es:[si + 481ch]
        adc     word ptr es:[si + 481eh], bx
        mov     dx, word ptr es:[si + 481eh]
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 4816h]
        mov     dx, word ptr es:[di + 4814h]
        cmp     ax, word ptr [bp + 0ah]
        jl      L_c1acf
        jg      L_c1aba
        cmp     dx, word ptr [bp + 8]
        jbe     L_c1acf
L_c1aba:
        mov     ax, SEG_A28F
        mov     dx, word ptr [bp - 0eh]
        mov     bx, word ptr [bp - 10h]
        mov     es, ax
        add     word ptr es:[di + 4814h], bx
        adc     word ptr es:[di + 4816h], dx
L_c1acf:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 481ah]
        mov     dx, word ptr es:[di + 4818h]
        cmp     ax, word ptr [bp + 0ah]
        jl      L_c1aff
        jg      L_c1aea
        cmp     dx, word ptr [bp + 8]
        jbe     L_c1aff
L_c1aea:
        mov     ax, SEG_A28F
        mov     dx, word ptr [bp - 0eh]
        mov     bx, word ptr [bp - 10h]
        mov     es, ax
        add     word ptr es:[di + 4818h], bx
        adc     word ptr es:[di + 481ah], dx
L_c1aff:
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 10h]
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        add     dx, word ptr [bp + 8]
        adc     ax, word ptr [bp + 0ah]
        push    ax
        push    dx
        push    word ptr [bp - 0ah]
        push    word ptr [bp - 0ch]
        callf   SEG_CC84:far_cd68a
        add     sp, 0ch
        cmp     word ptr [bp - 16h], 0
        jnz     L_c1b55
        cmp     word ptr [bp - 18h], 1
        jnz     L_c1b55
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 10h]
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        add     dx, word ptr [bp - 8]
        adc     ax, word ptr [bp - 6]
        add     dx, word ptr [bp + 8]
        adc     ax, word ptr [bp + 0ah]
        push    ax
        push    dx
        push    word ptr [bp - 0ah]
        push    word ptr [bp - 0ch]
        callf   SEG_CC84:far_cd68a
        add     sp, 0ch
L_c1b55:
        cmp     word ptr [bp - 16h], 1
        jnz     L_c1b91
        cmp     word ptr [bp - 18h], 1
        jnz     L_c1b91
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 10h]
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        add     dx, word ptr [bp - 8]
        adc     ax, word ptr [bp - 6]
        add     dx, word ptr [bp + 8]
        adc     ax, word ptr [bp + 0ah]
        push    ax
        push    dx
        mov     ax, word ptr [bp - 0ah]
        mov     dx, word ptr [bp - 0ch]
        add     dx, word ptr [bp - 10h]
        adc     ax, word ptr [bp - 0eh]
        push    ax
        push    dx
        callf   SEG_CC84:far_cd68a
        add     sp, 0ch
L_c1b91:
        callf   SEG_CC84:far_cd0a9
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3546
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
L_c1bb4:
        push    bp
        mov     bp, sp
        sub     sp, 24h
        push    si
        push    di
        mov     ax, word ptr [bp + 0ah]
        mov     dx, word ptr [bp + 8]
        cmp     ax, word ptr [bp + 0eh]
        jl      L_c1bd4
        jz      L_c1bcc
        jmp     L_c1dd4
L_c1bcc:
        cmp     dx, word ptr [bp + 0ch]
        jc      L_c1bd4
        jmp     L_c1dd4
L_c1bd4:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_35D3
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     word ptr [bp - 12h], 0
        mov     word ptr [bp - 14h], 1200h
        mov     word ptr [bp - 2], SEG_A28F
        mov     word ptr [bp - 4], 0
        mov     word ptr [bp - 6], SEG_A28F
        mov     word ptr [bp - 8], 2400h
        mov     al, byte ptr [bp + 6]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 481eh]
        mov     dx, word ptr es:[bx + 481ch]
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp - 0ch], dx
        mov     word ptr [bp - 22h], 0
        mov     word ptr [bp - 24h], 0
        xor     si, si
        jmp     L_c1d9b
L_c1c39:
        mov     bx, cx
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[bx + 4822h]
        mov     di, ax
        mov     dx, word ptr es:[bx + 4820h]
        mov     bx, dx
        add     dx, word ptr [bp - 24h]
        adc     ax, word ptr [bp - 22h]
        add     dx, word ptr [bp + 8]
        adc     ax, word ptr [bp + 0ah]
        mov     word ptr [bp - 1ah], ax
        mov     word ptr [bp - 1ch], dx
        mov     ax, di
        mov     dx, bx
        add     dx, word ptr [bp - 24h]
        adc     ax, word ptr [bp - 22h]
        add     dx, word ptr [bp + 0ch]
        adc     ax, word ptr [bp + 0eh]
        mov     word ptr [bp - 1eh], ax
        mov     word ptr [bp - 20h], dx
        push    0
        push    2
        mov     ax, word ptr [bp + 0eh]
        mov     dx, word ptr [bp + 0ch]
        sub     dx, word ptr [bp + 8]
        sbb     ax, word ptr [bp + 0ah]
        push    ax
        push    dx
        callf   0f800h:far_fa0fe
        mov     word ptr [bp - 16h], dx
        mov     word ptr [bp - 18h], ax
        jmp     L_c1d7a
L_c1c96:
        mov     ax, word ptr [bp - 16h]
        mov     dx, word ptr [bp - 18h]
        cmp     ax, word ptr [bp - 12h]
        jg      L_c1cb6
        jl      L_c1ca8
        cmp     dx, word ptr [bp - 14h]
        jnc     L_c1cb6
L_c1ca8:
        mov     ax, word ptr [bp - 16h]
        mov     dx, word ptr [bp - 18h]
        mov     word ptr [bp - 0eh], ax
        mov     word ptr [bp - 10h], dx
        jmp     L_c1cc2
L_c1cb6:
        mov     ax, word ptr [bp - 12h]
        mov     dx, word ptr [bp - 14h]
        mov     word ptr [bp - 0eh], ax
        mov     word ptr [bp - 10h], dx
L_c1cc2:
        push    1
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 10h]
        push    word ptr [bp - 1ah]
        push    word ptr [bp - 1ch]
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        push    0
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 10h]
        nop
        push    cs
        call    L_c1dd8
        add     sp, 6
        push    1
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 10h]
        mov     ax, word ptr [bp - 1eh]
        mov     dx, word ptr [bp - 20h]
        sub     dx, word ptr [bp - 10h]
        sbb     ax, word ptr [bp - 0eh]
        push    ax
        push    dx
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        push    1
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 10h]
        nop
        push    cs
        call    L_c1dd8
        add     sp, 6
        push    0
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 10h]
        push    word ptr [bp - 1ah]
        push    word ptr [bp - 1ch]
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        push    0
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 10h]
        mov     ax, word ptr [bp - 1eh]
        mov     dx, word ptr [bp - 20h]
        sub     dx, word ptr [bp - 10h]
        sbb     ax, word ptr [bp - 0eh]
        push    ax
        push    dx
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        mov     ax, word ptr [bp - 0eh]
        mov     dx, word ptr [bp - 10h]
        add     word ptr [bp - 1ch], dx
        adc     word ptr [bp - 1ah], ax
        sub     word ptr [bp - 20h], dx
        sbb     word ptr [bp - 1eh], ax
        sub     word ptr [bp - 18h], dx
        sbb     word ptr [bp - 16h], ax
L_c1d7a:
        cmp     word ptr [bp - 16h], 0
        jle     L_c1d83
        jmp     L_c1c96
L_c1d83:
        jnz     L_c1d8e
        cmp     word ptr [bp - 18h], 0
        jbe     L_c1d8e
        jmp     L_c1c96
L_c1d8e:
        mov     ax, word ptr [bp - 0ah]
        mov     dx, word ptr [bp - 0ch]
        add     word ptr [bp - 24h], dx
        adc     word ptr [bp - 22h], ax
        inc     si
L_c1d9b:
        mov     al, byte ptr [bp + 6]
        cbw
        mov     dx, 24h
        imul    dx
        mov     cx, ax
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 4813h]
        mov     ah, 0
        inc     ax
        cmp     ax, si
        jle     L_c1dbc
        jmp     L_c1c39
L_c1dbc:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3546
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
L_c1dd4:
        pop     di
        pop     si
        leave
        retf
L_c1dd8:
        push    bp
        mov     bp, sp
        sub     sp, 0eh
        cmp     word ptr [bp + 8], 0
        jl      L_c1df3
        jle     L_c1de9
        jmp     near L_c1e72
L_c1de9:
        cmp     word ptr [bp + 6], 1200h
        jbe     L_c1df3
        jmp     near L_c1e72
L_c1df3:
        mov     al, byte ptr [bp + 0ah]
        cbw
        mov     dx, 2400h
        imul    dx
        mov     word ptr [bp - 0eh], ax
        add     ax, 0
        mov     word ptr [bp - 2], SEG_A28F
        mov     word ptr [bp - 4], ax
        mov     ax, word ptr [bp - 0eh]
        mov     dx, word ptr [bp + 6]
        shl     dx, 1
        add     ax, dx
        add     ax, 0
        mov     word ptr [bp - 6], SEG_A28F
        mov     word ptr [bp - 8], ax
        sub     word ptr [bp - 8], 2
        mov     word ptr [bp - 0ah], 0
        mov     word ptr [bp - 0ch], 0
        jmp     L_c1e57
L_c1e2f:
        les     bx, dword ptr [bp - 4]
        mov     dx, word ptr es:[bx]
        les     bx, dword ptr [bp - 8]
        mov     cx, word ptr es:[bx]
        les     bx, dword ptr [bp - 4]
        mov     word ptr es:[bx], cx
        les     bx, dword ptr [bp - 8]
        mov     word ptr es:[bx], dx
        add     word ptr [bp - 4], 2
        sub     word ptr [bp - 8], 2
        add     word ptr [bp - 0ch], 1
        adc     word ptr [bp - 0ah], 0
L_c1e57:
        push    0
        push    2
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   0f800h:far_fa0fe
        cmp     dx, word ptr [bp - 0ah]
        jg      L_c1e2f
        jnz     L_c1e72
        cmp     ax, word ptr [bp - 0ch]
        ja      L_c1e2f
L_c1e72:
        leave
        retf
L_c1e74:
        push    bp
        mov     bp, sp
        sub     sp, 18h
        push    si
        push    di
        mov     ax, word ptr [bp + 0ah]
        mov     dx, word ptr [bp + 8]
        cmp     ax, word ptr [bp + 0eh]
        jl      L_c1e94
        jz      L_c1e8c
        jmp     L_c1fe8
L_c1e8c:
        cmp     dx, word ptr [bp + 0ch]
        jc      L_c1e94
        jmp     L_c1fe8
L_c1e94:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_35FB
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     ax, SEG_A28F
        mov     di, 0
        push    ax
        xor     ax, ax
        pop     es
        mov     ah, al
        mov     cx, 2400h
        rep stosw
        mov     word ptr [bp - 0ah], 0
        mov     word ptr [bp - 0ch], 2400h
        mov     word ptr [bp - 2], SEG_A28F
        mov     word ptr [bp - 4], 0
        mov     word ptr [bp - 12h], 0
        mov     word ptr [bp - 14h], 0
        xor     si, si
        jmp     L_c1fb1
L_c1ee0:
        mov     ax, word ptr [bp + 0eh]
        mov     dx, word ptr [bp + 0ch]
        sub     dx, word ptr [bp + 8]
        sbb     ax, word ptr [bp + 0ah]
        mov     word ptr [bp - 0eh], ax
        mov     word ptr [bp - 10h], dx
        mov     ax, word ptr [bp + 0ah]
        mov     dx, word ptr [bp + 8]
        mov     word ptr [bp - 16h], ax
        mov     word ptr [bp - 18h], dx
        jmp     short L_c1f7c
L_c1f00:
        mov     ax, word ptr [bp - 0eh]
        mov     dx, word ptr [bp - 10h]
        cmp     ax, word ptr [bp - 0ah]
        jg      L_c1f20
        jl      L_c1f12
        cmp     dx, word ptr [bp - 0ch]
        jnc     L_c1f20
L_c1f12:
        mov     ax, word ptr [bp - 0eh]
        mov     dx, word ptr [bp - 10h]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        jmp     L_c1f2c
L_c1f20:
        mov     ax, word ptr [bp - 0ah]
        mov     dx, word ptr [bp - 0ch]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
L_c1f2c:
        push    0
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        mov     al, byte ptr [bp + 6]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 4822h]
        mov     dx, word ptr es:[bx + 4820h]
        add     dx, word ptr [bp - 14h]
        adc     ax, word ptr [bp - 12h]
        add     dx, word ptr [bp - 18h]
        adc     ax, word ptr [bp - 16h]
        push    ax
        push    dx
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        mov     ax, word ptr [bp - 6]
        mov     dx, word ptr [bp - 8]
        add     word ptr [bp - 18h], dx
        adc     word ptr [bp - 16h], ax
        sub     word ptr [bp - 10h], dx
        sbb     word ptr [bp - 0eh], ax
L_c1f7c:
        cmp     word ptr [bp - 0eh], 0
        jle     L_c1f85
        jmp     near L_c1f00
L_c1f85:
        jnz     L_c1f90
        cmp     word ptr [bp - 10h], 0
        jbe     L_c1f90
        jmp     near L_c1f00
L_c1f90:
        mov     al, byte ptr [bp + 6]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 481eh]
        mov     dx, word ptr es:[bx + 481ch]
        add     word ptr [bp - 14h], dx
        adc     word ptr [bp - 12h], ax
        inc     si
L_c1fb1:
        mov     al, byte ptr [bp + 6]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 4813h]
        mov     ah, 0
        inc     ax
        cmp     ax, si
        jle     L_c1fd0
        jmp     L_c1ee0
L_c1fd0:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3546
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
L_c1fe8:
        pop     di
        pop     si
        leave
        retf
L_c1fec:
        push    bp
        mov     bp, sp
        sub     sp, 0ch
        push    si
        push    di
        mov     ax, word ptr [bp + 0ah]
        mov     dx, word ptr [bp + 8]
        cmp     ax, word ptr [bp + 0eh]
        jl      L_c200c
        jz      L_c2004
        jmp     L_c231b
L_c2004:
        cmp     dx, word ptr [bp + 0ch]
        jc      L_c200c
        jmp     L_c231b
L_c200c:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3623
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     al, byte ptr [bp + 6]
        cbw
        mov     dx, 24h
        imul    dx
        mov     di, ax
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        cmp     byte ptr es:[bx + 4813h], 0
        jnz     L_c2041
        jmp     L_c216f
L_c2041:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 481eh]
        mov     si, ax
        mov     dx, word ptr es:[di + 481ch]
        mov     word ptr [bp - 2], dx
        cmp     ax, word ptr [bp + 0eh]
        jnz     L_c20a2
        cmp     dx, word ptr [bp + 0ch]
        jnz     L_c20a2
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 4822h]
        mov     si, ax
        mov     dx, word ptr es:[di + 4820h]
        mov     word ptr [bp - 4], dx
        add     dx, word ptr [bp + 8]
        adc     ax, word ptr [bp + 0ah]
        push    ax
        push    dx
        mov     ax, si
        mov     dx, word ptr [bp - 4]
        mov     bx, SEG_A28F
        mov     es, bx
        add     dx, word ptr es:[di + 481ch]
        adc     ax, word ptr es:[di + 481eh]
        push    ax
        push    dx
        callf   SEG_CC84:far_cd68a
        add     sp, 0ch
        jmp     L_c21cb
L_c20a2:
        mov     ax, si
        mov     dx, word ptr [bp - 2]
        mov     bx, word ptr [bp + 0eh]
        mov     cx, word ptr [bp + 0ch]
        sub     cx, word ptr [bp + 8]
        sbb     bx, word ptr [bp + 0ah]
        sub     dx, cx
        sbb     ax, bx
        push    ax
        push    dx
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 4822h]
        mov     si, ax
        mov     dx, word ptr es:[di + 4820h]
        mov     word ptr [bp - 4], dx
        add     dx, word ptr [bp + 8]
        adc     ax, word ptr [bp + 0ah]
        push    ax
        push    dx
        mov     ax, si
        mov     dx, word ptr [bp - 4]
        add     dx, word ptr [bp + 0ch]
        adc     ax, word ptr [bp + 0eh]
        push    ax
        push    dx
        callf   SEG_CC84:far_cd68a
        add     sp, 0ch
        mov     al, byte ptr [bp + 6]
        cbw
        mov     dx, 24h
        imul    dx
        mov     di, ax
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 481eh]
        mov     dx, word ptr es:[bx + 481ch]
        sub     dx, word ptr [bp + 0ch]
        sbb     ax, word ptr [bp + 0eh]
        push    ax
        push    dx
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 4822h]
        mov     si, ax
        mov     dx, word ptr es:[di + 4820h]
        mov     word ptr [bp - 4], dx
        mov     bx, SEG_A28F
        mov     es, bx
        add     dx, word ptr es:[di + 481ch]
        adc     ax, word ptr es:[di + 481eh]
        add     dx, word ptr [bp + 8]
        adc     ax, word ptr [bp + 0ah]
        mov     bx, word ptr [bp + 0eh]
        mov     cx, word ptr [bp + 0ch]
        sub     cx, word ptr [bp + 8]
        sbb     bx, word ptr [bp + 0ah]
        sub     dx, cx
        sbb     ax, bx
        push    ax
        push    dx
        mov     ax, si
        mov     dx, word ptr [bp - 4]
        mov     bx, SEG_A28F
        mov     es, bx
        add     dx, word ptr es:[di + 481ch]
        adc     ax, word ptr es:[di + 481eh]
        add     dx, word ptr [bp + 0ch]
        adc     ax, word ptr [bp + 0eh]
        push    ax
        push    dx
        callf   SEG_CC84:far_cd68a
        add     sp, 0ch
        jmp     L_c21cb
L_c216f:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 481eh]
        mov     si, ax
        mov     dx, word ptr es:[di + 481ch]
        mov     word ptr [bp - 2], dx
        cmp     ax, word ptr [bp + 0eh]
        jnz     L_c218d
        cmp     dx, word ptr [bp + 0ch]
        jz      L_c21cb
L_c218d:
        mov     ax, si
        mov     dx, word ptr [bp - 2]
        sub     dx, word ptr [bp + 0ch]
        sbb     ax, word ptr [bp + 0eh]
        push    ax
        push    dx
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 4822h]
        mov     si, ax
        mov     dx, word ptr es:[di + 4820h]
        mov     word ptr [bp - 4], dx
        add     dx, word ptr [bp + 8]
        adc     ax, word ptr [bp + 0ah]
        push    ax
        push    dx
        mov     ax, si
        mov     dx, word ptr [bp - 4]
        add     dx, word ptr [bp + 0ch]
        adc     ax, word ptr [bp + 0eh]
        push    ax
        push    dx
        callf   SEG_CC84:far_cd68a
        add     sp, 0ch
L_c21cb:
        mov     al, byte ptr [bp + 6]
        cbw
        mov     dx, 24h
        imul    dx
        mov     di, ax
        mov     dx, SEG_A28F
        mov     bx, word ptr [bp + 0eh]
        mov     cx, word ptr [bp + 0ch]
        sub     cx, word ptr [bp + 8]
        sbb     bx, word ptr [bp + 0ah]
        mov     si, ax
        mov     es, dx
        sub     word ptr es:[si + 481ch], cx
        sbb     word ptr es:[si + 481eh], bx
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 481ah]
        mov     word ptr [bp - 6], ax
        mov     dx, word ptr es:[di + 4818h]
        mov     word ptr [bp - 8], dx
        cmp     ax, word ptr [bp + 0eh]
        jge     L_c2210
        jmp     near L_c22a0
L_c2210:
        jnz     L_c221a
        cmp     dx, word ptr [bp + 0ch]
        jnc     L_c221a
        jmp     near L_c22a0
L_c221a:
        mov     ax, SEG_A28F
        mov     dx, word ptr [bp + 0eh]
        mov     bx, word ptr [bp + 0ch]
        sub     bx, word ptr [bp + 8]
        sbb     dx, word ptr [bp + 0ah]
        mov     es, ax
        sub     word ptr es:[di + 4818h], bx
        sbb     word ptr es:[di + 481ah], dx
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 4816h]
        mov     word ptr [bp - 0ah], ax
        mov     dx, word ptr es:[di + 4814h]
        mov     word ptr [bp - 0ch], dx
        cmp     ax, word ptr [bp + 0ah]
        jge     L_c2252
        jmp     near L_c22fe
L_c2252:
        jnz     L_c225c
        cmp     dx, word ptr [bp + 8]
        jnc     L_c225c
        jmp     near L_c22fe
L_c225c:
        mov     ax, word ptr [bp - 0ah]
        mov     dx, word ptr [bp - 0ch]
        cmp     ax, word ptr [bp + 0eh]
        jl      L_c228b
        jg      L_c226e
        cmp     dx, word ptr [bp + 0ch]
        jbe     L_c228b
L_c226e:
        mov     ax, SEG_A28F
        mov     dx, word ptr [bp + 0eh]
        mov     bx, word ptr [bp + 0ch]
        sub     bx, word ptr [bp + 8]
        sbb     dx, word ptr [bp + 0ah]
        mov     es, ax
        sub     word ptr es:[di + 4814h], bx
        sbb     word ptr es:[di + 4816h], dx
        jmp     L_c22fe
L_c228b:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     word ptr es:[di + 4816h], 0
        mov     word ptr es:[di + 4814h], 0
        jmp     L_c22fe
L_c22a0:
        mov     ax, word ptr [bp - 6]
        mov     dx, word ptr [bp - 8]
        cmp     ax, word ptr [bp + 0ah]
        jl      L_c22fe
        jg      L_c22b2
        cmp     dx, word ptr [bp + 8]
        jbe     L_c22fe
L_c22b2:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 481eh]
        mov     dx, word ptr es:[di + 481ch]
        mov     bx, SEG_A28F
        mov     es, bx
        mov     word ptr es:[di + 481ah], ax
        mov     word ptr es:[di + 4818h], dx
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 4816h]
        mov     dx, word ptr es:[di + 4814h]
        cmp     ax, word ptr [bp + 0ah]
        jl      L_c22fe
        jnz     L_c22eb
        cmp     dx, word ptr [bp + 8]
        jc      L_c22fe
L_c22eb:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     word ptr es:[di + 4816h], 0
        mov     word ptr es:[di + 4814h], 0
L_c22fe:
        callf   SEG_CC84:far_cd0a9
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3546
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
L_c231b:
        pop     di
        pop     si
        leave
        retf
L_c231f:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    0
        push    0ah
        les     bx, dword ptr [bp + 6]
        mov     bx, word ptr es:[bx + 2]
        xor     cx, cx
        xor     dx, dx
        mov     ax, 1b9h
        callf   0f800h:far_fa0c8
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        les     bx, dword ptr [bp + 6]
        mov     bx, word ptr es:[bx + 4]
        xor     cx, cx
        xor     dx, dx
        mov     ax, 0ac44h
        callf   0f800h:far_fa0c8
        add     ax, word ptr [bp - 8]
        adc     dx, word ptr [bp - 6]
        les     bx, dword ptr [bp + 6]
        add     ax, word ptr es:[bx]
        adc     dx, 0
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        leave
        retf
L_c2373:
        push    bp
        mov     bp, sp
        sub     sp, 0ch
        push    0
        push    2ch
        push    0
        push    word 1b9h
        push    0
        push    word 0ac44h
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        callf   0f800h:far_fa115
        push    dx
        push    ax
        callf   0f800h:far_fa115
        push    dx
        push    ax
        callf   0f800h:far_fa115
        or      ax, dx
        jz      L_c23a7
        jmp     near L_c2436
L_c23a7:
        push    0
        push    word 0ac44h
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        callf   0f800h:far_fa105
        les     bx, dword ptr [bp + 6]
        mov     word ptr es:[bx + 4], ax
        mov     bx, word ptr es:[bx + 4]
        xor     cx, cx
        xor     dx, dx
        mov     ax, 0ac44h
        callf   0f800h:far_fa0c8
        mov     bx, word ptr [bp + 0ch]
        mov     cx, word ptr [bp + 0ah]
        sub     cx, ax
        sbb     bx, dx
        mov     word ptr [bp - 2], bx
        mov     word ptr [bp - 4], cx
        push    0
        push    word 1b9h
        push    bx
        push    cx
        callf   0f800h:far_fa10d
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        push    0
        push    word 1b9h
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        callf   0f800h:far_fa0fe
        push    ax
        push    dx
        xor     dx, dx
        mov     ax, 0ah
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        mov     word ptr [bp - 0ah], dx
        mov     word ptr [bp - 0ch], ax
        push    0
        push    2ch
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        callf   0f800h:far_fa0fe
        mov     dx, word ptr [bp - 0ch]
        add     dx, ax
        les     bx, dword ptr [bp + 6]
        mov     word ptr es:[bx + 2], dx
        mov     word ptr es:[bx], 0
        leave
        retf
L_c2436:
        push    0
        push    word 0ac44h
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        callf   0f800h:far_fa105
        les     bx, dword ptr [bp + 6]
        mov     word ptr es:[bx + 4], ax
        push    0
        push    word 1b9h
        mov     bx, word ptr es:[bx + 4]
        xor     cx, cx
        xor     dx, dx
        mov     ax, 0ac44h
        callf   0f800h:far_fa0c8
        mov     bx, word ptr [bp + 0ch]
        mov     cx, word ptr [bp + 0ah]
        sub     cx, ax
        sbb     bx, dx
        xor     dx, dx
        mov     ax, 0ah
        xchg    bx, cx
        callf   0f800h:far_fa0c8
        push    dx
        push    ax
        callf   0f800h:far_fa105
        les     bx, dword ptr [bp + 6]
        mov     word ptr es:[bx + 2], ax
        mov     bx, word ptr es:[bx + 4]
        xor     cx, cx
        xor     dx, dx
        mov     ax, 0ac44h
        callf   0f800h:far_fa0c8
        mov     dx, word ptr [bp + 0ah]
        sub     dx, ax
        push    dx
        push    0
        push    0ah
        les     bx, dword ptr [bp + 6]
        mov     bx, word ptr es:[bx + 2]
        xor     cx, cx
        xor     dx, dx
        mov     ax, 1b9h
        callf   0f800h:far_fa0c8
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        pop     dx
        sub     dx, ax
        les     bx, dword ptr [bp + 6]
        mov     word ptr es:[bx], dx
        leave
        retf
L_c24c5:
        push    bp
        mov     bp, sp
        les     bx, dword ptr [bp + 0ah]
        mov     al, byte ptr es:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        add     ax, 4800h
        push    word SEG_A28F
        push    ax
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        add     ax, 4800h
        push    word SEG_A28F
        push    ax
        callf   0f800h:far_fa70d
        add     sp, 8
        pop     bp
        retf
far_fdcfb:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        push    di
        mov     byte ptr [bp - 1], 0
        mov     cl, 0
L_c2506:
        mov     al, cl
        mov     ah, 0
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        cmp     byte ptr es:[bx + 4800h], 0
        jz      L_c252e
        mov     al, byte ptr [bp - 1]
        mov     ah, 0
        les     bx, dword ptr [bp + 6]
        add     bx, ax
        mov     byte ptr es:[bx], cl
        inc     byte ptr [bp - 1]
L_c252e:
        inc     cl
        cmp     cl, 80h
        jc      L_c2506
        cmp     byte ptr [bp - 1], 0
        jnz     L_c255a
        les     bx, dword ptr [bp + 0ah]
        mov     word ptr es:[bx + 2], ds
        mov     word ptr es:[bx], 303eh
        mov     word ptr es:[bx + 6], 0
        mov     word ptr es:[bx + 4], 0
        mov     ax, 0ffffh
        pop     di
        pop     si
        leave
        retf
L_c255a:
        push    word 0bfd8h
        push    word 2745h
        push    1
        mov     al, byte ptr [bp - 1]
        mov     ah, 0
        push    ax
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   0f800h:far_fa6e5
        add     sp, 0ch
        mov     byte ptr [bp - 2], 0
        cmp     byte ptr [bp + 0eh], 1
        jnz     L_c2595
        les     bx, dword ptr [bp + 0ah]
        mov     ax, word ptr [3051h]
        mov     dx, word ptr [304fh]
        mov     word ptr es:[bx + 2], ax
        mov     word ptr es:[bx], dx
        mov     byte ptr [bp - 2], 1
L_c2595:
        mov     cl, 0
        cmp     cl, byte ptr [bp - 1]
        jnc     L_c25d8
        mov     al, byte ptr [bp - 2]
        mov     ah, 0
        mov     di, ax
        jmp     L_c25d3
L_c25a5:
        mov     al, cl
        mov     ah, 0
        mov     dx, ax
        add     ax, di
        shl     ax, 2
        les     bx, dword ptr [bp + 0ah]
        add     bx, ax
        push    es
        les     si, dword ptr [bp + 6]
        add     si, dx
        mov     al, byte ptr es:[si]
        cbw
        mov     dx, 24h
        imul    dx
        add     ax, 4800h
        pop     es
        mov     word ptr es:[bx + 2], SEG_A28F
        mov     word ptr es:[bx], ax
        inc     cl
L_c25d3:
        cmp     cl, byte ptr [bp - 1]
        jc      L_c25a5
L_c25d8:
        mov     al, cl
        mov     ah, 0
        mov     dl, byte ptr [bp - 2]
        mov     dh, 0
        add     ax, dx
        shl     ax, 2
        les     bx, dword ptr [bp + 0ah]
        add     bx, ax
        mov     word ptr es:[bx + 2], 0
        mov     word ptr es:[bx], 0
        mov     al, byte ptr [bp - 1]
        mov     ah, 0
        pop     di
        pop     si
        leave
        retf
L_c25ff:
        push    bp
        mov     bp, sp
        sub     sp, 0ah
        push    si
        push    di
        mov     byte ptr [B_D5DD], 3dh
        push    ds
        push    word STR_364F
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     byte ptr [bp - 1], 5
        push    8
        push    64h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 1]
        push    ax
        push    ds
        push    word STR_3664
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3676
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_36C4
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
L_c2676:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dl, al
        or      al, al
        jz      L_c2676
        cmp     dl, 78h
        jz      L_c2690
        cbw
        pop     di
        pop     si
        leave
        retf
L_c2690:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_36CC
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     al, byte ptr [bp - 1]
        cbw
        mov     dx, 147h
        imul    dx
        mov     si, ax
        mov     al, byte ptr [bp + 6]
        cbw
        mov     dx, 24h
        imul    dx
        mov     di, ax
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        cmp     word ptr es:[bx + 481eh], 0
        jg      L_c26ef
        jl      L_c26d8
        cmp     word ptr es:[bx + 481ch], 2400h
        jnc     L_c26ef
L_c26d8:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 481eh]
        mov     dx, word ptr es:[di + 481ch]
        mov     word ptr [bp - 8], ax
        mov     word ptr [bp - 0ah], dx
        jmp     L_c26f9
L_c26ef:
        mov     word ptr [bp - 8], 0
        mov     word ptr [bp - 0ah], 2400h
L_c26f9:
        mov     word ptr [bp - 4], SEG_A28F
        mov     word ptr [bp - 6], 0
        push    1
        push    word ptr [bp - 8]
        push    word ptr [bp - 0ah]
        mov     ax, SEG_A28F
        mov     es, ax
        push    word ptr es:[di + 4822h]
        push    word ptr es:[di + 4820h]
        push    word SEG_A28F
        push    word 0
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        xor     cx, cx
        jmp     L_c2740
L_c272c:
        les     bx, dword ptr [bp - 6]
        mov     ax, word ptr es:[bx]
        cwd
        xor     ax, dx
        sub     ax, dx
        cmp     ax, si
        jge     L_c274f
        add     word ptr [bp - 6], 2
        inc     cx
L_c2740:
        mov     ax, cx
        cwd
        cmp     dx, word ptr [bp - 8]
        jl      L_c272c
        jnz     L_c274f
        cmp     ax, word ptr [bp - 0ah]
        jc      L_c272c
L_c274f:
        mov     ax, cx
        cwd
        les     bx, dword ptr [bp + 8]
        mov     word ptr es:[bx + 2], dx
        mov     word ptr es:[bx], ax
        mov     al, byte ptr [bp + 6]
        cbw
        mov     dx, 24h
        imul    dx
        mov     di, ax
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        cmp     byte ptr es:[bx + 4813h], 0
        jnz     L_c277d
        mov     ax, 4ch
        pop     di
        pop     si
        leave
        retf
L_c277d:
        mov     word ptr [bp - 4], SEG_A28F
        mov     word ptr [bp - 6], 0
        push    1
        push    word ptr [bp - 8]
        push    word ptr [bp - 0ah]
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 4822h]
        mov     dx, word ptr es:[di + 4820h]
        mov     bx, SEG_A28F
        mov     es, bx
        add     dx, word ptr es:[di + 481ch]
        adc     ax, word ptr es:[di + 481eh]
        push    ax
        push    dx
        push    word SEG_A28F
        push    word 0
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        xor     cx, cx
        jmp     L_c27d5
L_c27c1:
        les     bx, dword ptr [bp - 6]
        mov     ax, word ptr es:[bx]
        cwd
        xor     ax, dx
        sub     ax, dx
        cmp     ax, si
        jge     L_c27e4
        add     word ptr [bp - 6], 2
        inc     cx
L_c27d5:
        mov     ax, cx
        cwd
        cmp     dx, word ptr [bp - 8]
        jl      L_c27c1
        jnz     L_c27e4
        cmp     ax, word ptr [bp - 0ah]
        jc      L_c27c1
L_c27e4:
        mov     ax, cx
        cwd
        les     bx, dword ptr [bp + 8]
        cmp     dx, word ptr es:[bx + 2]
        jg      L_c2804
        jl      L_c27f7
        cmp     ax, word ptr es:[bx]
        jnc     L_c2804
L_c27f7:
        mov     ax, cx
        cwd
        les     bx, dword ptr [bp + 8]
        mov     word ptr es:[bx + 2], dx
        mov     word ptr es:[bx], ax
L_c2804:
        mov     ax, 4ch
        pop     di
        pop     si
        leave
        retf
L_c280b:
        push    bp
        mov     bp, sp
        sub     sp, 288h
        push    si
        mov     byte ptr [B_D5DD], 7
        mov     byte ptr [bp - 2], 0
        mov     byte ptr [bp - 1], 0
        jmp     L_c2a22
L_c2823:
        callf   SEG_B1AA:far_b1aac
        push    ds
        push    word STR_36E2
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    ss
        lea     ax, [bp - 288h]
        push    ax
        push    ss
        lea     ax, [bp - 84h]
        push    ax
        push    cs
        call    far_fdcfb
        add     sp, 0ah
        mov     si, ax
        cmp     si, 0ffffh
        jnz     L_c2860
        mov     byte ptr [bp - 2], 0
L_c2860:
        push    10h
        push    ss
        lea     ax, [bp - 288h]
        push    ax
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ds
        push    word STR_36FD
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        cmp     si, 0ffffh
        jz      L_c2899
        push    1dh
        push    1
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 84h]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        push    cs
        call    L_c154c
        add     sp, 6
L_c2899:
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_370B
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     byte ptr [bp - 3], 4
        cmp     si, 0ffffh
        jnz     L_c28ed
        mov     byte ptr [bp - 3], 0
        jmp     L_c28ed
L_c28c5:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jnz     L_c28ed
        cmp     si, 0ffffh
        jz      L_c28ed
        push    1dh
        push    1
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 84h]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        push    cs
        call    L_c154c
        add     sp, 6
L_c28ed:
        mov     al, byte ptr [bp - 3]
        add     al, 40h
        push    ax
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     byte ptr [bp - 1], al
        or      al, al
        jz      L_c28c5
        cbw
        cmp     ax, 78h
        jz      L_c292f
        jg      L_c2922
        cmp     ax, 44h
        jnz     L_c2912
        jmp     near L_c29aa
L_c2912:
        cmp     ax, 4eh
        jnz     L_c291a
        jmp     near L_c29aa
L_c291a:
        cmp     ax, 75h
        jz      L_c2973
        jmp     L_c2a22
L_c2922:
        cmp     ax, 79h
        jz      L_c294f
        cmp     ax, 7ah
        jz      L_c2961
        jmp     L_c2a22
L_c292f:
        mov     byte ptr [bp - 1], 0
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 84h]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        callf   SEG_CB8A:far_cc583
        add     sp, 2
        jmp     L_c2a22
L_c294f:
        mov     al, byte ptr [bp - 2]
        push    ax
        nop
        push    cs
        call    L_c2a32
        add     sp, 2
        mov     byte ptr [bp - 1], al
        jmp     near L_c2a22
L_c2961:
        mov     al, byte ptr [bp - 2]
        push    ax
        nop
        push    cs
        call    L_c2c2f
        add     sp, 2
        mov     byte ptr [bp - 1], al
        jmp     near L_c2a22
L_c2973:
        nop
        push    cs
        call    L_c3142
        mov     si, ax
        mov     al, byte ptr [bp - 2]
        push    ax
        nop
        push    cs
        call    L_c2f08
        add     sp, 2
        mov     byte ptr [bp - 1], al
        mov     ax, 33c2h
        or      ax, ax
        ja      L_c2993
        jmp     near L_c2a22
L_c2993:
        cmp     byte ptr [bp - 2], 0
        jg      L_c299c
        jmp     near L_c2a22
L_c299c:
        nop
        push    cs
        call    L_c3142
        cmp     ax, si
        jz      L_c2a22
        dec     byte ptr [bp - 2]
        jmp     short L_c2a22
L_c29aa:
        mov     byte ptr [bp - 1], 0
        cmp     si, 0ffffh
        jz      L_c2a22
        mov     al, byte ptr [B_D4C0]
        cbw
        mov     cx, ax
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        cmp     byte ptr es:[bx - 30ah], 0ffh
        jz      L_c2a22
        push    ss
        lea     ax, [bp - 84h]
        push    ax
        push    cx
        callf   SEG_C495:far_c529a
        add     sp, 6
        cmp     ax, 0ffffh
        jz      L_c2a22
        push    ss
        lea     ax, [bp - 84h]
        push    ax
        mov     al, byte ptr [B_D4C0]
        cbw
        push    ax
        callf   SEG_C495:far_c529a
        add     sp, 6
        dec     al
        mov     byte ptr [bp - 2], al
        push    0
        callf   SEG_B05A:far_b1073
        add     sp, 2
        cmp     si, 0ffffh
        jz      L_c2a22
        push    1dh
        push    1
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 84h]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        push    cs
        call    L_c154c
        add     sp, 6
L_c2a22:
        cmp     byte ptr [bp - 1], 0
        jnz     L_c2a2b
        jmp     L_c2823
L_c2a2b:
        mov     al, byte ptr [bp - 1]
        cbw
        pop     si
        leave
        retf
L_c2a32:
        push    bp
        mov     bp, sp
        sub     sp, 298h
        push    si
        push    di
        mov     byte ptr [B_D5DD], 47h
        callf   SEG_B1AA:far_b1aac
        push    ds
        push    word STR_3734
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    ss
        lea     ax, [bp - 298h]
        push    ax
        push    ss
        lea     ax, [bp - 94h]
        push    ax
        push    cs
        call    far_fdcfb
        add     sp, 0ah
        mov     word ptr [bp - 2], ax
        push    10h
        push    ss
        lea     ax, [bp - 298h]
        push    ax
        push    ss
        lea     ax, [bp + 6]
        push    ax
        push    ds
        push    word STR_36FD
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        cmp     word ptr [bp - 2], 0ffffh
        jz      L_c2aaf
        push    1dh
        push    1
        mov     al, byte ptr [bp + 6]
        cbw
        lea     dx, [bp - 94h]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        push    cs
        call    L_c154c
        add     sp, 6
L_c2aaf:
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp + 6]
        cbw
        shl     ax, 2
        lea     dx, [bp - 298h]
        add     ax, dx
        mov     bx, ax
        les     di, dword ptr ss:[bx]
        mov     ax, ss
        lea     si, [bp - 14h]
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        push    10h
        push    ss
        lea     ax, [bp - 14h]
        push    ax
        push    ds
        push    word STR_3741
        callf   SEG_B347:far_b3471
        add     sp, 0ah
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_36C4
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     L_c2b94
L_c2b27:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jnz     L_c2b94
        mov     al, byte ptr [bp + 6]
        cbw
        shl     ax, 2
        lea     dx, [bp - 298h]
        add     ax, dx
        mov     bx, ax
        les     di, dword ptr ss:[bx]
        mov     ax, ss
        lea     si, [bp - 14h]
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        cmp     word ptr [bp - 2], 0ffffh
        jz      L_c2b94
        push    1dh
        push    1
        mov     al, byte ptr [bp + 6]
        cbw
        lea     dx, [bp - 94h]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        push    cs
        call    L_c154c
        add     sp, 6
L_c2b94:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dl, al
        or      al, al
        jz      L_c2b27
        cbw
        cmp     ax, 78h
        jnz     L_c2c28
        push    10h
        push    ss
        lea     ax, [bp - 14h]
        push    ax
        callf   SEG_CC84:far_cdb31
        add     sp, 6
        push    ss
        lea     ax, [bp - 14h]
        push    ax
        callf   SEG_CC84:far_cd551
        add     sp, 4
        cmp     ax, 0fffch
        jz      L_c2be1
        callf   SEG_B1AA:far_b1af9
        push    1
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        callf   SEG_B1AA:far_b1aff
        jmp     L_c2c26
L_c2be1:
        mov     ax, SEG_A28F
        push    ax
        mov     al, byte ptr [bp + 6]
        cbw
        lea     dx, [bp - 94h]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        add     ax, 4800h
        push    ss
        pop     es
        lea     di, [bp - 14h]
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        pop     si
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
L_c2c26:
        mov     dl, 0
L_c2c28:
        mov     al, dl
        cbw
        pop     di
        pop     si
        leave
        retf
L_c2c2f:
        push    bp
        mov     bp, sp
        sub     sp, 2a0h
        push    si
        push    di
        mov     byte ptr [B_D5DD], 48h
        callf   SEG_B1AA:far_b1aac
        push    ds
        push    word STR_374F
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    ss
        lea     ax, [bp - 2a0h]
        push    ax
        push    ss
        lea     ax, [bp - 9ch]
        push    ax
        push    cs
        call    far_fdcfb
        add     sp, 0ah
        mov     word ptr [bp - 4], ax
        push    10h
        push    ss
        lea     ax, [bp - 2a0h]
        push    ax
        push    ss
        lea     ax, [bp + 6]
        push    ax
        push    ds
        push    word STR_36FD
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        cmp     word ptr [bp - 4], 0ffffh
        jz      L_c2cac
        push    1dh
        push    1
        mov     al, byte ptr [bp + 6]
        cbw
        lea     dx, [bp - 9ch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        push    cs
        call    L_c154c
        add     sp, 6
L_c2cac:
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp + 6]
        cbw
        shl     ax, 2
        lea     dx, [bp - 2a0h]
        add     ax, dx
        mov     bx, ax
        les     di, dword ptr ss:[bx]
        mov     ax, ss
        lea     si, [bp - 1ch]
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        push    10h
        push    ss
        lea     ax, [bp - 1ch]
        push    ax
        push    ds
        push    word STR_375A
        callf   SEG_B347:far_b3471
        add     sp, 0ah
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_36C4
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     L_c2d91
L_c2d24:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jnz     L_c2d91
        mov     al, byte ptr [bp + 6]
        cbw
        shl     ax, 2
        lea     dx, [bp - 2a0h]
        add     ax, dx
        mov     bx, ax
        les     di, dword ptr ss:[bx]
        mov     ax, ss
        lea     si, [bp - 1ch]
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        cmp     word ptr [bp - 4], 0ffffh
        jz      L_c2d91
        push    1dh
        push    1
        mov     al, byte ptr [bp + 6]
        cbw
        lea     dx, [bp - 9ch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        push    cs
        call    L_c154c
        add     sp, 6
L_c2d91:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jz      L_c2d24
        cmp     ax, 78h
        jz      L_c2daa
        jmp     L_c2f01
L_c2daa:
        mov     al, byte ptr [bp + 6]
        cbw
        lea     dx, [bp - 9ch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        mov     byte ptr [bp - 5], al
        mov     word ptr [bp - 2], 0
        cbw
        mov     dx, 24h
        imul    dx
        mov     si, ax
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 4813h]
        mov     ah, 0
        push    ax
        mov     ax, SEG_A28F
        mov     es, ax
        push    word ptr es:[si + 481eh]
        push    word ptr es:[si + 481ch]
        push    ss
        lea     ax, [bp - 1ch]
        push    ax
        callf   SEG_CC84:far_cce4b
        add     sp, 0ah
        mov     byte ptr [bp - 6], al
        or      al, al
        jge     L_c2e1b
        callf   SEG_B1AA:far_b1af9
        mov     al, byte ptr [bp - 6]
        cbw
        neg     ax
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        callf   SEG_B1AA:far_b1aff
        mov     ax, word ptr [bp - 2]
        pop     di
        pop     si
        leave
        retf
L_c2e1b:
        mov     al, byte ptr [bp - 5]
        cbw
        mov     dx, 24h
        imul    dx
        mov     si, ax
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 4811h]
        push    ax
        mov     al, byte ptr [bp - 6]
        cbw
        mov     dx, 24h
        imul    dx
        mov     di, ax
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        pop     ax
        mov     byte ptr es:[bx + 4811h], al
        mov     ax, SEG_A28F
        mov     es, ax
        mov     al, byte ptr es:[si + 4812h]
        mov     dx, SEG_A28F
        mov     es, dx
        mov     byte ptr es:[di + 4812h], al
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[si + 4816h]
        mov     dx, word ptr es:[si + 4814h]
        mov     bx, SEG_A28F
        mov     es, bx
        mov     word ptr es:[di + 4816h], ax
        mov     word ptr es:[di + 4814h], dx
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[si + 481ah]
        mov     dx, word ptr es:[si + 4818h]
        mov     bx, SEG_A28F
        mov     es, bx
        mov     word ptr es:[di + 481ah], ax
        mov     word ptr es:[di + 4818h], dx
        mov     ax, SEG_A28F
        mov     es, ax
        cmp     byte ptr es:[si + 4813h], 0
        jnz     L_c2ebf
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[si + 481eh]
        mov     dx, word ptr es:[si + 481ch]
        mov     word ptr [bp - 8], ax
        mov     word ptr [bp - 0ah], dx
        jmp     L_c2ed8
L_c2ebf:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[si + 481eh]
        mov     dx, word ptr es:[si + 481ch]
        shl     dx, 1
        rcl     ax, 1
        mov     word ptr [bp - 8], ax
        mov     word ptr [bp - 0ah], dx
L_c2ed8:
        push    word ptr [bp - 8]
        push    word ptr [bp - 0ah]
        mov     ax, SEG_A28F
        mov     es, ax
        push    word ptr es:[di + 4822h]
        push    word ptr es:[di + 4820h]
        mov     es, ax
        push    word ptr es:[si + 4822h]
        push    word ptr es:[si + 4820h]
        callf   SEG_CC84:far_cd68a
        add     sp, 0ch
L_c2f01:
        mov     ax, word ptr [bp - 2]
        pop     di
        pop     si
        leave
        retf
L_c2f08:
        push    bp
        mov     bp, sp
        sub     sp, 296h
        push    si
        push    di
        mov     si, 3053h
        lea     di, [bp - 296h]
        push    ss
        pop     es
        mov     cx, 8
        rep movsw
        mov     byte ptr [B_D5DD], 49h
        callf   SEG_B1AA:far_b1aac
        callf   SEG_B05A:far_b05a7
        push    ds
        push    word STR_36E2+0eh
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    ss
        lea     ax, [bp - 286h]
        push    ax
        push    ss
        lea     ax, [bp - 82h]
        push    ax
        push    cs
        call    far_fdcfb
        add     sp, 0ah
        mov     si, ax
        push    10h
        push    ss
        lea     ax, [bp - 286h]
        push    ax
        push    ss
        lea     ax, [bp + 6]
        push    ax
        push    ds
        push    word STR_36FD
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     byte ptr [bp - 1], 0
        push    20h
        push    ss
        lea     ax, [bp - 296h]
        push    ax
        push    ss
        lea     ax, [bp - 1]
        push    ax
        push    ds
        push    word STR_37C8
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        cmp     si, 0ffffh
        jz      L_c3011
        push    1dh
        push    1
        mov     al, byte ptr [bp + 6]
        cbw
        lea     dx, [bp - 82h]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        push    cs
        call    L_c154c
        add     sp, 6
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp + 6]
        cbw
        lea     dx, [bp - 82h]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        cmp     byte ptr es:[bx + 4813h], 1
        jnz     L_c3007
        push    ds
        push    word STR_37C8
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     L_c3011
L_c3007:
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
L_c3011:
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_37CE
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     near L_c30f2
L_c3031:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jz      L_c3041
        cmp     ax, 1
        jz      L_c30b8
        jmp     near L_c30f2
L_c3041:
        cmp     si, 0ffffh
        jnz     L_c3049
        jmp     near L_c30f2
L_c3049:
        push    1dh
        push    1
        mov     al, byte ptr [bp + 6]
        cbw
        lea     dx, [bp - 82h]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        push    cs
        call    L_c154c
        add     sp, 6
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp + 6]
        cbw
        lea     dx, [bp - 82h]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        cmp     byte ptr es:[bx + 4813h], 1
        jnz     L_c30ac
        push    ds
        push    word STR_37C8
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     L_c30f2
L_c30ac:
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        jmp     L_c30f2
L_c30b8:
        mov     al, byte ptr [bp + 6]
        cbw
        lea     dx, [bp - 82h]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        cmp     byte ptr es:[bx + 4813h], 0
        jnz     L_c30f2
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
L_c30f2:
        push    2
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dl, al
        or      al, al
        jnz     L_c3105
        jmp     L_c3031
L_c3105:
        cbw
        cmp     ax, 78h
        jz      L_c3112
        cmp     ax, 79h
        jz      L_c3134
        jmp     L_c313b
L_c3112:
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        mov     al, byte ptr [bp + 6]
        cbw
        lea     dx, [bp - 82h]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        callf   SEG_CC84:far_cd353
        add     sp, 4
        mov     dl, 0
        jmp     L_c313b
L_c3134:
        nop
        push    cs
        call    L_c3164
        mov     dl, al
L_c313b:
        mov     al, dl
        cbw
        pop     di
        pop     si
        leave
        retf
L_c3142:
        push    si
        xor     dx, dx
        xor     cx, cx
        mov     si, 4800h
L_c314a:
        mov     ax, SEG_A28F
        mov     es, ax
        cmp     byte ptr es:[si], 0
        jz      L_c3156
        inc     dx
L_c3156:
        add     si, 24h
        inc     cx
        cmp     si, 5a00h
        jnz     L_c314a
        mov     ax, dx
        pop     si
        retf
L_c3164:
        mov     byte ptr [B_D5DD], 4ah
        callf   SEG_B1AA:far_b1aac
        push    ds
        push    word STR_37E6
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3805
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_383D
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
L_c31af:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dl, al
        or      al, al
        jz      L_c31af
        cbw
        cmp     ax, 78h
        jnz     L_c31d1
        callf   SEG_CB18:far_cb23d
        callf   SEG_CC84:far_cd4d6
        mov     dl, 0
L_c31d1:
        mov     al, dl
        cbw
        retf
far_f07e8:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        push    ds
        push    word STR_384B
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    18h
        push    62h
        push    22h
        push    2
        push    ds
        push    word B_E427
        push    ds
        push    word STR_386A
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0bh
        push    2
        mov     al, byte ptr [B_E427]
        push    ax
        callf   SEG_C495:far_c530b
        add     sp, 6
        push    10h
        push    0dh
        push    2
        mov     al, byte ptr [B_E427]
        mov     ah, 0
        push    ax
        callf   SEG_B702:far_b9045
        add     sp, 8
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3876
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        mov     byte ptr [B_9569], 1
        mov     al, byte ptr [B_7FD1]
        cbw
        mov     word ptr [bp - 2], ax
        push    4
        callf   SEG_EB7C:far_eb7cc
        add     sp, 2
        xor     si, si
        jmp     L_c32a3
L_c3267:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jnz     L_c3293
        push    0bh
        push    2
        mov     al, byte ptr [B_E427]
        push    ax
        callf   SEG_C495:far_c530b
        add     sp, 6
        push    10h
        push    0dh
        push    2
        mov     al, byte ptr [B_E427]
        mov     ah, 0
        push    ax
        callf   SEG_B702:far_b9045
        add     sp, 8
L_c3293:
        push    0ff80h
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        or      ax, ax
        jz      L_c3267
L_c32a3:
        or      si, si
        jz      L_c3293
        push    word ptr [bp - 2]
        callf   SEG_EB7C:far_eb7cc
        add     sp, 2
        mov     byte ptr [B_9569], 0
        mov     ax, si
        pop     si
        leave
        retf
        phase   0ch
        endif
far_b9205:
        push    bp
        mov     bp, sp
        sub     sp, 4ah
        push    si
        push    di
        push    ds
        push    word STR_38E3
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        mov     word ptr [W_9480], 1
        mov     word ptr [W_947E], 100h
        mov     ax, word ptr [W_904B]
        inc     ax
        xor     dx, dx
        add     dx, 100h
        adc     ax, 0
        mov     word ptr [W_947C], ax
        mov     word ptr [W_947A], dx
        callf   SEG_BF29:far_c036b
        mov     byte ptr [bp - 8], al
        mov     al, byte ptr [B_8A9A]
        mov     byte ptr [bp - 9], al
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_905D]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_90C1]
        cbw
        and     ax, 4
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 6], ax
        mov     si, 1
        mov     al, byte ptr [B_83B7]
        mov     byte ptr [bp - 7], al
        xor     di, di
        jmp     br_b95dd
br_b926d:
        or      si, si
        jnz     br_b9274
        jmp     br_b950d
br_b9274:
        xor     si, si
        callf   SEG_B05A:far_b05a7
        nop
        push    cs
        call    fn_b9817
        mov     word ptr [bp - 4], ax
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    ds
        push    word STR_38E9
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    8
        push    1
        mov     al, byte ptr [bp - 8]
        cbw
        push    ax
        callf   SEG_B702:far_b8f3e
        add     sp, 6
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    63h
        push    0
        push    2
        push    ss
        lea     ax, [bp - 9]
        push    ax
        push    ds
        push    word STR_38F0
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    8
        push    2
        mov     al, byte ptr [bp - 9]
        cbw
        push    ax
        mov     al, byte ptr [bp - 8]
        cbw
        push    ax
        callf   SEG_B702:far_b9073
        add     sp, 8
        push    1bh
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    ds
        push    word STR_38F7
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word W_947E
        push    ds
        push    word STR_3901
        callf   SEG_B347:far_b39a2
        add     sp, 8
        push    ds
        push    word W_947A
        push    ds
        if      FW_VERSION >= 312
        push    word P_3908
        elseif  FW_VERSION = 311
        push    word P_3908
        else
        push    word P_3908
        endif
        callf   SEG_B347:far_b39a2
        add     sp, 8
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0bh
        push    ds
        push    word P_0000+4
        push    ds
        push    word B_83B6
        push    ds
        push    word STR_390A
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    ss
        lea     ax, [bp - 7]
        push    ax
        callf   SEG_B347:far_b38d8
        add     sp, 4
        cmp     byte ptr [B_83B6], 0
        jnz     br_b9382
        push    10h
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
br_b9382:
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     word ptr [bp - 4], 0
        jz      br_b93bc
        cmp     byte ptr [bp - 9], 0
        jnz     br_b93a8
        push    ds
        push    word STR_3911
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_b93bc
br_b93a8:
        mov     ax, word ptr [bp - 2]
        mov     word ptr [bp - 6], ax
        push    ax
        push    ss
        lea     ax, [bp - 4ah]
        push    ax
        nop
        push    cs
        call    far_b9f33
        add     sp, 6
br_b93bc:
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_391B
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_b950d
br_b93da:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     bx, ax
        cmp     bx, 5
        jbe     br_b93e8
        jmp     br_b9507
br_b93e8:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_b95ea]
tgt_b93ef:
        cmp     byte ptr [B_9562], 0
        jz      br_b941d
        callf   SEG_B1AA:far_b1af9
        push    0ffd8h
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        callf   SEG_B1AA:far_b1aff
        mov     al, byte ptr [B_9561]
        mov     byte ptr [bp - 8], al
        push    0
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_b9507
br_b941d:
        push    8
        push    1
        mov     al, byte ptr [bp - 8]
        cbw
        push    ax
        callf   SEG_B702:far_b8f3e
        add     sp, 6
        push    1
        mov     al, byte ptr [bp - 8]
        cbw
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        push    ds
        push    word W_947A
        push    ds
        push    word W_947E
        callf   SEG_B702:far_b915e
        add     sp, 0ah
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
tgt_b946a:
        mov     al, byte ptr [bp - 9]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_905D]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_90C1]
        cbw
        and     ax, 4
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 6], ax
        mov     si, 1
        jmp     short br_b9507
tgt_b948a:
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        push    ds
        push    word W_947A
        push    ds
        push    word W_947E
        callf   SEG_B702:far_b915e
        add     sp, 0ah
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_b9507
tgt_b94b5:
        mov     al, byte ptr [B_83B6]
        cbw
        or      ax, ax
        jnz     br_b94d3
        push    10h
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
br_b94d3:
        mov     si, 1
        jmp     br_b9507
tgt_b94d8:
        mov     al, byte ptr [B_83B6]
        cbw
        or      ax, ax
        jnz     br_b94fe
        push    10h
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        mov     al, byte ptr [B_83B7]
        mov     byte ptr [bp - 7], al
        jmp     br_b9504
br_b94fe:
        mov     al, byte ptr [bp - 7]
        mov     byte ptr [B_83B7], al
br_b9504:
        mov     si, 1
br_b9507:
        or      si, si
        jz      br_b950d
        jmp     br_b9520
br_b950d:
        push    44h
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     di, ax
        or      ax, ax
        jnz     br_b9520
        jmp     br_b93da
br_b9520:
        or      si, si
        jz      br_b9527
        jmp     near br_b95dd
br_b9527:
        mov     ax, di
        cmp     ax, 78h
        jz      br_b9580
        jg      br_b9545
        cmp     ax, 44h
        jz      br_b9552
        cmp     ax, 4eh
        jz      br_b9552
        cmp     ax, 75h
        jnz     br_b9542
        jmp     near br_b95d6
br_b9542:
        jmp     near br_b95dd
br_b9545:
        cmp     ax, 79h
        jz      br_b95c4
        cmp     ax, 7ah
        jz      br_b95cd
        jmp     near br_b95dd
br_b9552:
        cmp     word ptr [bp - 4], 0
        jz      br_b955e
        cmp     byte ptr [bp - 9], 0
        jnz     br_b9562
br_b955e:
        xor     di, di
        jmp     short br_b95dd
br_b9562:
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ss
        lea     ax, [bp - 4ah]
        push    ax
        push    word ptr [bp - 2]
        push    6
        push    5
        push    di
        nop
        push    cs
        call    far_b9fbd
        add     sp, 10h
        mov     di, ax
        jmp     br_b95dd
br_b9580:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3944
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        mov     al, byte ptr [B_83B7]
        mov     ah, 0
        push    ax
        mov     al, byte ptr [B_83B6]
        cbw
        push    ax
        push    ss
        lea     ax, [bp - 4ah]
        push    ax
        mov     al, byte ptr [bp - 9]
        cbw
        push    ax
        callf   SEG_E734:far_e7341
        add     sp, 0ah
        mov     di, 4dh
        jmp     br_b95dd
br_b95c4:
        nop
        push    cs
        call    fn_b9a31
        mov     di, ax
        jmp     br_b95dd
br_b95cd:
        nop
        push    cs
        call    fn_b95f6
        mov     di, ax
        jmp     br_b95dd
br_b95d6:
        nop
        push    cs
        call    fn_b96dc
        mov     di, ax
br_b95dd:
        or      di, di
        jnz     br_b95e4
        jmp     br_b926d
br_b95e4:
        mov     ax, di
        pop     di
        pop     si
        leave
        retf
TBL_b95ea:
        dw      tgt_b93ef
        dw      tgt_b946a
        dw      tgt_b948a
        dw      tgt_b948a
        dw      tgt_b94b5
        dw      tgt_b94d8
fn_b95f6:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    ds
        push    word STR_3950
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_8A9F]
        mov     byte ptr [bp - 1], al
        push    8
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 1]
        push    ax
        push    ds
        push    word STR_3960
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0bh
        push    1
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_B702:far_b8f3e
        add     sp, 6
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word STR_396A
        elseif  FW_VERSION = 311
        push    word STR_396A
        else
        push    word STR_396A
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b9102
        mov     byte ptr [B_D5DD], 2
        jmp     br_b968c
loop_b9668:
        push    0bh
        push    1
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_B702:far_b8f3e
        add     sp, 6
        push    1
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
br_b968c:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_b9668
        cmp     ax, 78h
        jnz     br_b96d8
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_39AF
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_E1E1:far_e1e11
        add     sp, 2
        mov     al, byte ptr [B_D4C2]
        cbw
        mov     dx, ax
br_b96d8:
        mov     ax, dx
        leave
        retf
fn_b96dc:
        push    ds
        push    word STR_39C5
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word STR_39DA
        elseif  FW_VERSION = 311
        push    word STR_39DA
        else
        push    word STR_39DA
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b9102
        mov     byte ptr [B_D5DD], 3
loop_b96fe:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_b96fe
        cmp     dx, 78h
        jnz     br_b9752
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3A40
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        callf   SEG_DEAB:far_deabe
        push    1
        push    1
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        mov     al, byte ptr [B_D4C2]
        cbw
        mov     dx, ax
br_b9752:
        mov     ax, dx
        retf
far_b9755:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 12h
        else
        sub     sp, 14h
        endif
        push    si
        push    di
        xor     di, di
        xor     dx, dx
        mov     si, word ptr [bp + 6]
loop_b9764:
        mov     es, word ptr [bp + 8]
        cmp     byte ptr es:[si], 0
        jz      br_b976e
        inc     di
br_b976e:
        inc     si
        inc     dx
        cmp     dx, 40h
        jl      loop_b9764
        cmp     di, 40h
        jnz     br_b97a0
        push    ds
        if      FW_VERSION >= 312
        push    word STR_3911_2+6
        elseif  FW_VERSION = 311
        push    word STR_3911_2+6
        else
        push    word STR_3911_2+6
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    1eh
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    ds
        push    word STR_3A5B
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        pop     di
        pop     si
        leave
        retf
br_b97a0:
        if      FW_VERSION < 311
        push    ss
        lea     ax, [bp - 14h]
        push    ax
        endif
        push    word ptr [bp + 0ah]
        if      FW_VERSION >= 311
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        mov     si, ax
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        push    si
        endif
        callf   SEG_CC84:far_cd8d0
        add     sp, 6
        if      FW_VERSION < 311
        push    word ptr [bp + 0ah]
        callf   SEG_DAB0:far_dab37
        add     sp, 2
        mov     word ptr [bp - 2], ax
        endif
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 12h]
        else
        lea     ax, [bp - 14h]
        endif
        push    ax
        if      FW_VERSION >= 311
        mov     bx, word ptr [bp + 0ah]
        else
        mov     bx, word ptr [bp - 2]
        endif
        shl     bx, 2
        push    word ptr [bx + 276h]
        push    word ptr [bx + 274h]
        if      FW_VERSION >= 311
        push    si
        else
        push    word ptr [bp + 0ah]
        endif
        push    ds
        push    word STR_3A66
        callf   SEG_B1B5:far_b1d48
        add     sp, 0eh
        push    1fh
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    di
        push    ds
        push    word STR_3A70
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
        cmp     di, 1
        jle     br_b9807
        push    ds
        if      FW_VERSION >= 312
        push    word STR_3A5B_2+8
        elseif  FW_VERSION = 311
        push    word STR_3A5B_2+8
        else
        push    word STR_3A5B_2+8
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        pop     di
        pop     si
        leave
        retf
br_b9807:
        push    ds
        push    word STR_3A79
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        pop     di
        pop     si
        leave
        retf
fn_b9817:
        mov     al, byte ptr [B_83B6]
        cbw
        or      ax, ax
        jnz     br_b9823
        mov     ax, 1
        retf
br_b9823:
        cmp     byte ptr [B_83B6], 1
        jnz     br_b9835
        cmp     byte ptr [B_83B7], 0
        jz      br_b9835
        mov     ax, 1
        retf
br_b9835:
        cmp     byte ptr [B_83B6], 2
        jnz     br_b9849
        mov     al, byte ptr [B_83B7]
        mov     ah, 0
        or      ax, ax
        jnz     br_b9849
        mov     ax, 1
        retf
br_b9849:
        xor     ax, ax
        retf
fn_b984c:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp + 6]
        test    byte ptr [si + TBL_82EE], 80h
        jnz     br_b985f
        mov     ax, 1
        jmp     br_b9861
br_b985f:
        xor     ax, ax
br_b9861:
        les     bx, dword ptr [bp + 8]
        mov     byte ptr es:[bx + 5], al
        test    byte ptr [si + TBL_8352], 80h
        jz      br_b9874
        mov     ax, 1
        jmp     br_b9876
br_b9874:
        xor     ax, ax
br_b9876:
        les     bx, dword ptr [bp + 8]
        mov     byte ptr es:[bx + 4], al
        mov     al, byte ptr [si + TBL_82EE]
        and     al, 0fh
        inc     al
        mov     byte ptr es:[bx], al
        test    byte ptr [si + TBL_82EE], 40h
        jz      br_b9893
        mov     byte ptr es:[bx], 0
br_b9893:
        mov     al, byte ptr [si + TBL_82EE]
        cbw
        sar     ax, 4
        and     al, 3
        les     bx, dword ptr [bp + 8]
        mov     byte ptr es:[bx + 2], al
        mov     al, byte ptr [si + TBL_8352]
        and     al, 0fh
        inc     al
        mov     byte ptr es:[bx + 1], al
        test    byte ptr [si + TBL_8352], 40h
        jz      br_b98bc
        mov     byte ptr es:[bx + 1], 0
br_b98bc:
        mov     al, byte ptr [si + TBL_8352]
        cbw
        sar     ax, 4
        and     al, 3
        les     bx, dword ptr [bp + 8]
        mov     byte ptr es:[bx + 3], al
        mov     al, byte ptr [si + TBL_828A]
        mov     byte ptr es:[bx + 6], al
        pop     si
        pop     bp
        retf
fn_b98d8:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp + 6]
        les     bx, dword ptr [bp + 8]
        cmp     byte ptr es:[bx], 0
        jz      br_b98fc
        mov     al, byte ptr es:[bx + 2]
        shl     al, 4
        mov     dl, byte ptr es:[bx]
        add     dl, al
        dec     dl
        mov     byte ptr [si + TBL_82EE], dl
        jmp     br_b990c
br_b98fc:
        les     bx, dword ptr [bp + 8]
        mov     al, byte ptr es:[bx + 2]
        shl     al, 4
        add     al, 40h
        mov     byte ptr [si + TBL_82EE], al
br_b990c:
        les     bx, dword ptr [bp + 8]
        cmp     byte ptr es:[bx + 1], 0
        jz      br_b992b
        mov     al, byte ptr es:[bx + 1]
        mov     dl, byte ptr es:[bx + 3]
        shl     dl, 4
        add     al, dl
        dec     al
        mov     byte ptr [si + TBL_8352], al
        jmp     br_b993b
br_b992b:
        les     bx, dword ptr [bp + 8]
        mov     al, byte ptr es:[bx + 3]
        shl     al, 4
        add     al, 40h
        mov     byte ptr [si + TBL_8352], al
br_b993b:
        les     bx, dword ptr [bp + 8]
        cmp     byte ptr es:[bx + 5], 0
        jnz     br_b994a
        or      byte ptr [si + TBL_82EE], 80h
br_b994a:
        les     bx, dword ptr [bp + 8]
        cmp     byte ptr es:[bx + 4], 0
        jz      br_b9959
        or      byte ptr [si + TBL_8352], 80h
br_b9959:
        les     bx, dword ptr [bp + 8]
        mov     al, byte ptr es:[bx + 6]
        mov     byte ptr [si + TBL_828A], al
        pop     si
        pop     bp
        retf
fn_b9967:
        push    bp
        mov     bp, sp
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    cs
        call    fn_b984c
        add     sp, 6
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    5
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    8
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    9
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    0ch
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    0dh
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    0eh
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    0fh
        callf   SEG_B05A:far_b1073
        add     sp, 2
        les     bx, dword ptr [bp + 8]
        cmp     byte ptr es:[bx + 6], 0
        jnz     br_b99ec
        push    25h
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_38CA
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_b99ec:
        les     bx, dword ptr [bp + 8]
        cmp     byte ptr es:[bx], 0
        jnz     br_b9a0d
        push    1ah
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_38CA
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_b9a0d:
        les     bx, dword ptr [bp + 8]
        cmp     byte ptr es:[bx + 1], 0
        jnz     br_b9a2f
        push    23h
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_38CA
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_b9a2f:
        pop     bp
        retf
fn_b9a31:
        push    bp
        mov     bp, sp
        sub     sp, 0ch
        push    si
        push    di
        push    ds
        push    word STR_3A7C
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        mov     al, byte ptr [B_8A9F]
        mov     byte ptr [bp - 0bh], al
        mov     al, byte ptr [B_8A9A]
        mov     byte ptr [bp - 0ch], al
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        mov     al, byte ptr [B_8A9A]
        cbw
        push    ax
        push    cs
        call    fn_b984c
        add     sp, 6
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 0bh]
        push    ax
        push    ds
        push    word STR_3A90
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    12h
        push    1
        mov     al, byte ptr [bp - 0bh]
        cbw
        push    ax
        callf   SEG_B702:far_b8f3e
        add     sp, 6
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3AA1
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    21h
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        push    ds
        push    word A_38CD
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    word 3e7h
        push    1
        push    3
        push    ds
        push    word W_8281
        push    ds
        push    word STR_3ACA
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    8
        push    1fh
        push    1
        push    2
        push    ds
        push    word B_8287
        push    ds
        push    word STR_3AD0
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    2
        push    ds
        push    word P_05C0+4
        push    ds
        push    word B_8288
        push    ds
        if      FW_VERSION >= 312
        push    word P_3AD7
        elseif  FW_VERSION = 311
        push    word P_3AD7
        else
        push    word P_3AD7
        endif
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    16h
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    7
        push    ds
        if      FW_VERSION >= 312
        push    word P_38B2+0ch
        elseif  FW_VERSION = 311
        push    word P_38A1_V311+0dh
        else
        push    word P_3535_V308+0dh
        endif
        push    ss
        lea     ax, [bp - 5]
        push    ax
        push    ds
        push    word STR_3AD9
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_7FCA]
        cbw
        push    ax
        mov     al, byte ptr [B_7FCB]
        cbw
        inc     ax
        mov     dx, ax
        pop     ax
        imul    dx
        mov     si, ax
        push    0
        push    0
        push    word ptr [W_8285]
        callf   SEG_DE78:far_de7ae
        add     sp, 6
        mov     di, ax
        mov     al, byte ptr [B_7FCB]
        cbw
        push    ax
        mov     al, byte ptr [B_7FCA]
        cbw
        push    ax
        push    di
        callf   SEG_DE78:far_de88f
        add     sp, 6
        mov     word ptr [bp - 2], ax
        push    3
        push    ds
        push    word P_01F0+0ch
        push    ds
        push    word B_7FCA
        push    ds
        push    word A_38CD
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    4
        mov     bx, si
        shl     bx, 1
        push    word ptr [bx + 252h]
        mov     bx, si
        shl     bx, 1
        push    word ptr [bx + 248h]
        push    5
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ds
        if      FW_VERSION >= 312
        push    word P_38E9+5
        elseif  FW_VERSION = 311
        push    word P_38E9+5
        else
        push    word P_38E9+5
        endif
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    16h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    4
        push    ds
        push    word P_0200+8
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word STR_3AE1
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    8
        push    word 80h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ds
        push    word STR_3AE7
        callf   SEG_B347:far_b3819
        add     sp, 10h
        cmp     byte ptr [bp - 4], 0
        jnz     br_b9c24
        push    25h
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_38CA
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_b9c24:
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    6
        push    ds
        if      FW_VERSION >= 312
        push    word P_38B2
        elseif  FW_VERSION = 311
        push    word P_38A1_V311+1
        else
        push    word P_3535_V308+1
        endif
        push    ds
        push    word B_8289
        push    ds
        push    word STR_3AEE
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    word 3e7h
        push    1
        push    3
        push    ds
        push    word W_8283
        push    ds
        push    word A_38CD
        callf   SEG_B347:far_b3819
        add     sp, 10h
        cmp     byte ptr [B_8289], 0
        jnz     br_b9c7e
        push    0ch
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_3AF4
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_b9c7e:
        push    16h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    8
        push    10h
        push    0
        push    2
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        push    ds
        push    word STR_3AF8
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    1
        push    ds
        push    word P_0250+0ch
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    ds
        push    word A_38CD
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        cmp     byte ptr [bp - 0ah], 0
        jnz     br_b9cd6
        push    1ah
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_38CA
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_b9cd6:
        push    8
        push    10h
        push    0
        push    2
        push    ss
        lea     ax, [bp - 9]
        push    ax
        push    ds
        push    word STR_3AFD
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    1
        push    ds
        push    word P_0250+0ch
        push    ss
        lea     ax, [bp - 7]
        push    ax
        push    ds
        push    word A_38CD
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        cmp     byte ptr [bp - 9], 0
        jnz     br_b9d24
        push    23h
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_38CA
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_b9d24:
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_3B04
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     byte ptr [B_D5DD], 1
        xor     si, si
        jmp     tgt_b9edb
br_b9d3f:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     bx, ax
        cmp     bx, 0fh
        jbe     br_b9d4d
        jmp     tgt_b9e41
br_b9d4d:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_b9f13]
tgt_b9d54:
        push    12h
        push    1
        mov     al, byte ptr [bp - 0bh]
        cbw
        push    ax
        callf   SEG_B702:far_b8f3e
        add     sp, 6
        jmp     tgt_b9e41
tgt_b9d68:
        mov     ax, word ptr [W_8283]
        cmp     ax, word ptr [W_8281]
        jle     tgt_b9d77
        mov     ax, word ptr [W_8281]
        mov     word ptr [W_8283], ax
tgt_b9d77:
        cmp     byte ptr [B_8289], 0
        jnz     br_b9d99
        push    0ch
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_3AF4
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     near tgt_b9e41
br_b9d99:
        push    0bh
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     near tgt_b9e41
tgt_b9da6:
        mov     al, byte ptr [B_7FCB]
        cbw
        push    ax
        mov     al, byte ptr [B_7FCA]
        cbw
        push    ax
        push    word ptr [bp - 2]
        callf   SEG_DE78:far_de7ae
        add     sp, 6
        mov     di, ax
        push    0
        mov     al, byte ptr [B_7FCA]
        cbw
        push    ax
        push    di
        callf   SEG_DE78:far_de88f
        add     sp, 6
        mov     word ptr [W_8285], ax
        jmp     tgt_b9e41
tgt_b9dd2:
        mov     al, byte ptr [B_7FCA]
        cbw
        push    ax
        mov     al, byte ptr [B_7FCB]
        cbw
        inc     ax
        mov     dx, ax
        pop     ax
        imul    dx
        mov     si, ax
        mov     bx, si
        shl     bx, 1
        push    word ptr [bx + 252h]
        mov     bx, si
        shl     bx, 1
        push    word ptr [bx + 248h]
        push    7
        callf   SEG_B05A:far_b1206
        add     sp, 6
        mov     al, byte ptr [B_7FCB]
        cbw
        push    ax
        mov     al, byte ptr [B_7FCA]
        cbw
        push    ax
        push    di
        callf   SEG_DE78:far_de88f
        add     sp, 6
        mov     word ptr [bp - 2], ax
        push    7
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     tgt_b9e41
tgt_b9e1f:
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        mov     al, byte ptr [bp - 0ch]
        cbw
        push    ax
        push    cs
        call    fn_b98d8
        add     sp, 6
tgt_b9e30:
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        mov     al, byte ptr [bp - 0ch]
        cbw
        push    ax
        push    cs
        call    fn_b9967
        add     sp, 6
tgt_b9e41:
        push    4
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        or      ax, ax
        jnz     br_b9e54
        jmp     br_b9d3f
br_b9e54:
        mov     bx, si
        sub     bx, 75h
        cmp     bx, 5
        if      FW_VERSION >= 311
        ja      tgt_b9edb
        else
        jbe     L_c3f1d
        jmp     near tgt_b9edb
L_c3f1d:
        endif
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_b9f07]
tgt_b9e65:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3B2D
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        mov     al, byte ptr [bp - 0bh]
        cbw
        push    ax
        callf   SEG_E1E1:far_e1e11
        add     sp, 2
        mov     al, byte ptr [bp - 0bh]
        cbw
        push    ax
        callf   SEG_E15E:far_e15e2
        add     sp, 2
        if      FW_VERSION < 311
        push    1
        mov     al, byte ptr [bp - 0bh]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
        endif
        mov     al, byte ptr [B_D4C2]
        cbw
        mov     si, ax
        jmp     tgt_b9edb
tgt_b9eab:
        xor     si, si
        jmp     tgt_b9edb
tgt_b9eaf:
        cmp     si, 7ah
        jnz     br_b9ebf
        cmp     byte ptr [bp - 0ch], 1
        jle     br_b9ec8
        dec     byte ptr [bp - 0ch]
        jmp     br_b9ec8
br_b9ebf:
        cmp     byte ptr [bp - 0ch], 63h
        jge     br_b9ec8
        inc     byte ptr [bp - 0ch]
br_b9ec8:
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        mov     al, byte ptr [bp - 0ch]
        cbw
        push    ax
        push    cs
        call    fn_b9967
        add     sp, 6
        xor     si, si
tgt_b9edb:
        or      si, si
        jnz     br_b9ee2
        jmp     near tgt_b9e41
br_b9ee2:
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
TBL_b9f07:
        dw      tgt_b9eaf
        dw      tgt_b9edb
        dw      tgt_b9edb
        dw      tgt_b9e65
        dw      tgt_b9eab
        dw      tgt_b9eaf
TBL_b9f13:
        dw      tgt_b9d54
        dw      tgt_b9e30
        dw      tgt_b9d68
        dw      tgt_b9e41
        dw      tgt_b9e41
        dw      tgt_b9e1f
        dw      tgt_b9dd2
        dw      tgt_b9da6
        dw      tgt_b9e1f
        dw      tgt_b9e1f
        dw      tgt_b9d77
        dw      tgt_b9d68
        dw      tgt_b9e1f
        dw      tgt_b9e1f
        dw      tgt_b9e1f
        dw      tgt_b9e1f
far_b9f33:
        push    bp
        mov     bp, sp
        push    di
        push    ds
        push    word STR_3B47
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        cmp     word ptr [bp + 0ah], 0
        jz      br_b9f68
        les     di, dword ptr [bp + 6]
        mov     ax, 1
        mov     ah, al
        mov     cx, 20h
        rep stosw
        if      FW_VERSION >= 311
        push    0ffffh
        else
        push    0
        endif
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    cs
        call    far_b9755
        add     sp, 6
        pop     di
        pop     bp
        retf
br_b9f68:
        les     di, dword ptr [bp + 6]
        xor     ax, ax
        mov     ah, al
        mov     cx, 20h
        rep stosw
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_B347:far_b3843
        add     sp, 4
        push    2dh
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx + 1], 7fh
        mov     ax, word ptr [bp + 6]
        inc     ax
        push    word ptr [bp + 8]
        push    ax
        callf   SEG_B347:far_b3843
        add     sp, 4
        push    1bh
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    ds
        push    word STR_3B4E
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        pop     di
        pop     bp
        retf
far_b9fbd:
        push    bp
        mov     bp, sp
        if      FW_VERSION < 311
        sub     sp, 2
        endif
        push    si
        push    di
        mov     si, word ptr [bp + 6]
        mov     dx, word ptr [bp + 0ch]
        mov     ax, si
        cmp     ax, 44h
        jz      br_b9fd7
        cmp     ax, 4eh
        jz      br_ba046
        jmp     br_ba0a1
br_b9fd7:
        xor     si, si
        or      dx, dx
        jnz     br_b9fe0
        jmp     near br_ba0a1
br_b9fe0:
        les     bx, dword ptr [bp + 12h]
        cmp     word ptr es:[bx], 0
        jz      br_ba014
        les     di, dword ptr [bp + 0eh]
        xor     ax, ax
        mov     ah, al
        mov     cx, 20h
        rep stosw
        push    6
        push    word ptr [bp + 8]
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        les     bx, dword ptr [bp + 12h]
        mov     word ptr es:[bx], 0
br_ba014:
        push    6
        push    word ptr [bp + 8]
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_D4C0]
        cbw
        if      FW_VERSION < 311
        mov     word ptr [bp - 2], ax
        endif
        mov     es, word ptr [bp + 10h]
        add     ax, word ptr [bp + 0eh]
        mov     bx, ax
        mov     byte ptr es:[bx - 23h], 1
        if      FW_VERSION >= 311
        mov     al, byte ptr [B_D4BF]
        cbw
        push    ax
        else
        push    word ptr [bp - 2]
        endif
        push    word ptr [bp + 10h]
        push    word ptr [bp + 0eh]
        push    cs
        call    far_b9755
        add     sp, 6
        jmp     br_ba0a1
br_ba046:
        xor     si, si
        or      dx, dx
        jnz     br_ba0a1
        les     bx, dword ptr [bp + 0eh]
        cmp     byte ptr es:[bx], 0
        jnz     br_ba061
        mov     al, byte ptr [B_D4C1]
        mov     byte ptr es:[bx + 1], al
        mov     byte ptr es:[bx], al
        jmp     br_ba087
br_ba061:
        les     bx, dword ptr [bp + 0eh]
        mov     al, byte ptr es:[bx]
        cmp     al, byte ptr [B_D4C1]
        jle     br_ba073
        mov     al, byte ptr [B_D4C1]
        mov     byte ptr es:[bx], al
br_ba073:
        les     bx, dword ptr [bp + 0eh]
        mov     al, byte ptr es:[bx + 1]
        cmp     al, byte ptr [B_D4C1]
        jge     br_ba087
        mov     al, byte ptr [B_D4C1]
        mov     byte ptr es:[bx + 1], al
br_ba087:
        mov     al, byte ptr [bp + 0ah]
        push    ax
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [bp + 0ah]
        inc     al
        push    ax
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_ba0a1:
        mov     ax, si
        pop     di
        pop     si
        if      FW_VERSION >= 311
        pop     bp
        else
        leave
        endif
        retf
        if      FW_VERSION >= 312
        phase   7
        elseif  FW_VERSION = 311
        phase   0
        else
        phase   9
        endif
far_ba0a7:
        push    bp
        mov     bp, sp
        if      FW_VERSION < 311
        sub     sp, 2
        endif
        push    si
        push    di
        if      FW_VERSION >= 311
        mov     dx, word ptr [bp + 6]
        jmp     near br_ba16e
        else
        mov     ax, word ptr [bp + 6]
        mov     word ptr [bp - 2], ax
        jmp     L_c4266
        endif
br_ba0b2:
        mov     dx, 1
        xor     si, si
        mov     al, byte ptr [B_9457]
        cbw
loop_ba0bb:
        test    dx, ax
        jz      br_ba0c9
        mov     al, dl
        not     al
        and     byte ptr [B_9457], al
        jmp     br_ba0d1
br_ba0c9:
        shl     dx, 1
        inc     si
        cmp     si, 8
        jl      loop_ba0bb
br_ba0d1:
        callf   SEG_E2CE:far_e2ce3
        mov     word ptr [W_96F8], dx
        mov     word ptr [W_96F6], ax
        cmp     si, 5
        jnz     br_ba0e7
        callf   SEG_E270:far_e270b
br_ba0e7:
        callf   SEG_B1AA:far_b1af9
        mov     ax, 0ffceh
        sub     ax, si
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        callf   SEG_B1AA:far_b1aff
        callf   SEG_E2CE:far_e2ce3
        mov     word ptr [W_96F8], dx
        mov     word ptr [W_96F6], ax
        push    ds
        pop     es
        mov     di, TBL_956E
        xor     ax, ax
        mov     ah, al
        mov     cx, 40h
        rep stosw
        mov     di, TBL_966E
        mov     ah, al
        mov     cx, 40h
        rep stosw
        mov     byte ptr [B_956D], 0
        callf   SEG_D78B:far_d78c6
        callf   SEG_D78B:far_d7903
        mov     al, byte ptr [B_7FD1]
        cbw
        push    ax
        callf   SEG_EB7C:far_eb7cc
        add     sp, 2
        callf   SEG_D797:far_d7978
loop_ba144:
        cmp     byte ptr [B_9457], 0
        jz      br_ba155
        cmp     byte ptr [B_A575], 0
        jz      br_ba155
        jmp     near br_ba0b2
br_ba155:
        push    ds
        push    word W_D4AD
        callf   SEG_D79E:far_d7a09
        add     sp, 4
        if      FW_VERSION >= 311
        mov     dx, ax
        push    dx
        else
        mov     word ptr [bp - 2], ax
        cmp     byte ptr [B_CEC6_V308], 1
        jnz     L_c4257
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
        mov     byte ptr [B_CEC6_V308], 0ffh
L_c4257:
        mov     al, byte ptr [bp - 2]
        push    ax
        endif
        callf   SEG_DF14:far_df14a
        add     sp, 2
        if      FW_VERSION >= 311
        mov     dx, ax
br_ba16e:
        cmp     dx, word ptr [bp + 6]
        else
        mov     word ptr [bp - 2], ax
L_c4266:
        mov     ax, word ptr [bp - 2]
        cmp     ax, word ptr [bp + 6]
        endif
        jz      loop_ba144
        if      FW_VERSION >= 311
        mov     ax, dx
        endif
        pop     di
        pop     si
        if      FW_VERSION >= 311
        pop     bp
        else
        leave
        endif
        retf
        if      FW_VERSION >= 312
        phase   9
        else
        phase   2
        endif
far_ba179:
        push    di
        push    word 6c2h
        push    ds
        push    word A_7D87
        callf   SEG_DA72:far_da72a
        add     sp, 6
        or      ax, ax
        jz      br_ba192
        callf   SEG_B20F:far_b20fd
br_ba192:
        if      FW_VERSION >= 311
        nop
        push    cs
        call    fn_ba378
        or      ax, ax
        jz      br_ba1a0
        callf   SEG_B20F:far_b20fd
br_ba1a0:
        endif
        and     byte ptr [B_83D0], 1
        if      FW_VERSION >= 311
        mov     byte ptr [B_CEC0], 20h
        mov     byte ptr [B_9781], 23h
        mov     byte ptr [B_977D], 0ch
        mov     byte ptr [B_977C], 0ch
        else
        mov     byte ptr [B_C8D4_V308], 20h
        mov     byte ptr [B_9781], 23h
        mov     byte ptr [B_977D], 0ch
        endif
        mov     byte ptr [B_E54C], 7fh
        mov     byte ptr [B_8805], 0
        mov     byte ptr [B_955F], 0
        mov     cx, 2
        mov     di, TBL_D5FF
        push    ds
        pop     es
        xor     ax, ax
        rep stosw
        mov     byte ptr [B_8804], 1
        mov     byte ptr [B_A5CE], 1
        mov     byte ptr [B_9560], 0
        mov     byte ptr [B_9562], 0
        mov     byte ptr [TBL_A5CA], 0
        mov     byte ptr [B_A5C9], 0
        mov     word ptr [W_D610], 1000h
        mov     byte ptr [B_9482], 0
        mov     ax, word ptr [W_7FC8]
        mov     word ptr [W_8A98], ax
        mov     word ptr [W_982F], 0ah
        push    ds
        pop     es
        mov     di, TBL_981B
        mov     ax, 0ffffh
        mov     ah, al
        mov     cx, 0ah
        rep stosw
        mov     di, TBL_9503
        mov     ah, al
        mov     cx, 20h
        rep stosw
        mov     di, TBL_94C3
        mov     ah, al
        mov     cx, 20h
        rep stosw
        mov     di, TBL_9483
        mov     ah, al
        mov     cx, 20h
        rep stosw
        mov     cx, 40h
        mov     di, TBL_9787
        push    ds
        pop     es
        mov     ax, 0ffffh
        rep stosw
        push    4
        push    4
        push    ds
        push    word B_901B
        callf   SEG_E723:far_e723d
        add     sp, 8
        callf   SEG_CB18:far_cb18f
        push    0
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        mov     byte ptr [B_D4C0], al
        callf   SEG_CDCC:far_cdd04
        push    ds
        pop     es
        mov     di, TBL_A787
        mov     ax, 1
        mov     ah, al
        mov     cx, 0ah
        rep stosw
        callf   SEG_DB0E:far_db0e8
        mov     byte ptr [B_D4B5], 0
        push    1
        push    9
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        nop
        push    cs
        call    far_ba2a4
        callf   SEG_C0EE:far_c12b7
        callf   SEG_B1AA:far_b1aac
        mov     dx, 50h
        in      al, dx
        pop     di
        retf
far_ba2a4:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    si
        mov     al, byte ptr [B_826C]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_0F77]
        cbw
        mov     word ptr [W_881C], ax
        mov     al, byte ptr [B_7FCE]
        cbw
        mov     dx, 7d0h
        imul    dx
        mov     word ptr [W_D60E], ax
        callf   SEG_CA3C:far_ca806
        cmp     byte ptr [B_7FCC], 0
        jz      br_ba2d6
        mov     ax, word ptr [W_8A98]
        jmp     br_ba2d9
br_ba2d6:
        mov     ax, word ptr [W_7FC8]
br_ba2d9:
        mov     word ptr [W_D651], ax
        mov     al, byte ptr [B_7FCB]
        cbw
        push    ax
        mov     al, byte ptr [B_7FCA]
        cbw
        push    ax
        push    word ptr [W_D651]
        callf   SEG_DE78:far_de7ae
        add     sp, 6
        mov     word ptr [W_D655], ax
        mov     word ptr [W_D657], ax
        mov     word ptr [W_D653], ax
        mov     al, byte ptr [B_7FCB]
        cbw
        mov     word ptr [bp - 6], ax
        shl     ax, 2
        mov     bx, ax
        mov     ax, word ptr [bx + 5e6h]
        mov     dx, word ptr [bx + 5e4h]
        mov     word ptr [W_D633], ax
        mov     word ptr [W_D631], dx
        mov     ax, word ptr [bp - 6]
        mov     dx, 6
        imul    dx
        mov     si, ax
        mov     bx, ax
        mov     ax, word ptr [bx + 5f4h]
        mov     word ptr [TBL_D62B], ax
        mov     ax, word ptr [si + 5f6h]
        mov     word ptr [W_D62D], ax
        mov     ax, word ptr [si + 5f8h]
        mov     word ptr [W_D62F], ax
        cmp     byte ptr [B_901B], 0
        jl      br_ba35e
        mov     ax, word ptr [W_9053]
        mov     dx, word ptr [W_9051]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        mov     word ptr [W_9053], 0
        push    ax
        push    word ptr [W_9051]
        callf   SEG_E561:far_e5612
        add     sp, 4
br_ba35e:
        mov     al, byte ptr [B_7FD1]
        cbw
        push    ax
        callf   SEG_EB7C:far_eb7cc
        add     sp, 2
        push    1
        callf   SEG_EB7C:far_eb845
        add     sp, 2
        pop     si
        leave
        retf
        if      FW_VERSION >= 312
fn_ba378:
        cmp     word ptr [W_7FC8], 0
        jg      br_ba383
        mov     ax, 1
        retf
br_ba383:
        cmp     byte ptr [B_8180], 0
        jg      br_ba38e
        mov     ax, 1
        retf
br_ba38e:
        cmp     byte ptr [B_7FCD], 0
        jg      br_ba399
        mov     ax, 1
        retf
br_ba399:
        cmp     byte ptr [B_7FE2], 32h
        jnc     br_ba3a4
        mov     ax, 1
        retf
br_ba3a4:
        cmp     byte ptr [B_7FCF], 0
        jg      br_ba3af
        mov     ax, 1
        retf
br_ba3af:
        cmp     byte ptr [B_83C2], 0
        jg      br_ba3ba
        mov     ax, 1
        retf
br_ba3ba:
        cmp     byte ptr [B_83C4], 0
        jg      br_ba3c5
        mov     ax, 1
        retf
br_ba3c5:
        cmp     word ptr [W_8281], 0
        jg      br_ba3d0
        mov     ax, 1
        retf
br_ba3d0:
        cmp     word ptr [W_8283], 0
        jg      br_ba3db
        mov     ax, 1
        retf
br_ba3db:
        cmp     word ptr [W_8285], 0
        jg      br_ba3e6
        mov     ax, 1
        retf
br_ba3e6:
        cmp     byte ptr [B_8287], 0
        jg      br_ba3f1
        mov     ax, 1
        retf
br_ba3f1:
        cmp     byte ptr [B_8438], 1
        jl      br_ba3ff
        cmp     byte ptr [B_8438], 4
        jle     br_ba403
br_ba3ff:
        mov     ax, 1
        retf
br_ba403:
        xor     ax, ax
        retf
        phase   6
        elseif  FW_VERSION = 311
fn_ba378:
        cmp     word ptr [W_7FC8], 0
        jg      br_ba383
        mov     ax, 1
        retf
br_ba383:
        cmp     byte ptr [B_8180], 0
        jg      br_ba38e
        mov     ax, 1
        retf
br_ba38e:
        cmp     byte ptr [B_7FCD], 0
        jg      br_ba399
        mov     ax, 1
        retf
br_ba399:
        cmp     byte ptr [B_7FE2], 32h
        jnc     br_ba3a4
        mov     ax, 1
        retf
br_ba3a4:
        cmp     byte ptr [B_7FCF], 0
        jg      br_ba3af
        mov     ax, 1
        retf
br_ba3af:
        cmp     byte ptr [B_83C2], 0
        jg      br_ba3ba
        mov     ax, 1
        retf
br_ba3ba:
        cmp     byte ptr [B_83C4], 0
        jg      br_ba3c5
        mov     ax, 1
        retf
br_ba3c5:
        cmp     word ptr [W_8281], 0
        jg      br_ba3d0
        mov     ax, 1
        retf
br_ba3d0:
        cmp     word ptr [W_8283], 0
        jg      br_ba3db
        mov     ax, 1
        retf
br_ba3db:
        cmp     word ptr [W_8285], 0
        jg      br_ba3e6
        mov     ax, 1
        retf
br_ba3e6:
        cmp     byte ptr [B_8287], 0
        jg      br_ba3f1
        mov     ax, 1
        retf
br_ba3f1:
        cmp     byte ptr [B_8438], 1
        jl      br_ba3ff
        cmp     byte ptr [B_8438], 4
        jle     br_ba403
br_ba3ff:
        mov     ax, 1
        retf
br_ba403:
        xor     ax, ax
        retf
        phase   0fh
        else
        phase   0eh
        endif
far_ba406:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 2
        push    si
        else
        sub     sp, 4
        endif
        push    ds
        push    word STR_3BD1
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        mov     al, byte ptr [B_D4C0]
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 1], al
        else
        mov     byte ptr [bp - 3], al
        endif
        push    18h
        push    62h
        push    23h
        push    2
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 1]
        else
        lea     ax, [bp - 3]
        endif
        push    ax
        push    ds
        push    word A_3BE4
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    10h
        push    7
        push    1
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 1]
        else
        mov     al, byte ptr [bp - 3]
        endif
        cbw
        push    ax
        callf   SEG_B702:far_b9045
        add     sp, 8
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    ds
        if      FW_VERSION >= 312
        push    word P_3B5B+1
        elseif  FW_VERSION = 311
        push    word P_3B4B_V311+1
        else
        push    word P_37DF_V308+1
        endif
        push    ds
        push    word B_7FC7
        push    ds
        push    word A_3BEA
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 1]
        else
        mov     al, byte ptr [bp - 3]
        endif
        cbw
        push    ax
        nop
        push    cs
        call    fn_ba607
        add     sp, 2
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 2], al
        else
        mov     byte ptr [bp - 4], al
        endif
        push    8
        push    ds
        if      FW_VERSION >= 312
        push    word P_3B5B+0dh
        elseif  FW_VERSION = 311
        push    word P_3B4B_V311+0dh
        else
        push    word P_37DF_V308+0dh
        endif
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 2]
        else
        lea     ax, [bp - 4]
        endif
        push    ax
        push    ds
        if      FW_VERSION >= 312
        push    word P_3BF1
        elseif  FW_VERSION = 311
        push    word P_3BF1
        else
        push    word P_3BF1
        endif
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    1bh
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    0dh
        push    4
        push    2
        push    ds
        push    word B_E426
        push    ds
        push    word A_3BF3
        callf   SEG_B347:far_b3819
        add     sp, 10h
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 2]
        else
        mov     al, byte ptr [bp - 4]
        endif
        push    ax
        mov     al, byte ptr [B_7FC7]
        push    ax
        nop
        push    cs
        call    fn_ba62f
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_3BFF
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        if      FW_VERSION >= 311
        mov     si, 1
        else
        mov     word ptr [bp - 2], 1
        endif
        xor     dx, dx
        jmp     br_ba5f6
br_ba4e1:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     bx, ax
        cmp     bx, 3
        jbe     br_ba4ef
        jmp     near loop_ba599
br_ba4ef:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_ba5ff]
tgt_ba4f6:
        push    10h
        push    7
        push    1
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 1]
        else
        mov     al, byte ptr [bp - 3]
        endif
        cbw
        push    ax
        callf   SEG_B702:far_b9045
        add     sp, 8
tgt_ba509:
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 1]
        else
        mov     al, byte ptr [bp - 3]
        endif
        cbw
        push    ax
        nop
        push    cs
        call    fn_ba607
        add     sp, 2
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 2], al
        else
        mov     byte ptr [bp - 4], al
        endif
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 2]
        else
        mov     al, byte ptr [bp - 4]
        endif
        push    ax
        mov     al, byte ptr [B_7FC7]
        push    ax
        nop
        push    cs
        call    fn_ba62f
        add     sp, 4
        jmp     loop_ba599
tgt_ba535:
        cmp     byte ptr [B_7FC7], 0
        jz      br_ba55d
        if      FW_VERSION >= 311
        cmp     byte ptr [bp - 2], 3
        jle     br_ba546
        mov     byte ptr [bp - 2], 3
br_ba546:
        mov     al, byte ptr [bp - 1]
        else
        cmp     byte ptr [bp - 4], 3
        jle     L_c459f
        mov     byte ptr [bp - 4], 3
L_c459f:
        mov     al, byte ptr [bp - 3]
        endif
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 2]
        else
        mov     al, byte ptr [bp - 4]
        endif
        mov     byte ptr es:[bx - 2f3h], al
br_ba55d:
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 1]
        else
        mov     al, byte ptr [bp - 3]
        endif
        cbw
        push    ax
        nop
        push    cs
        call    fn_ba607
        add     sp, 2
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 2], al
        else
        mov     byte ptr [bp - 4], al
        endif
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 2]
        else
        mov     al, byte ptr [bp - 4]
        endif
        push    ax
        mov     al, byte ptr [B_7FC7]
        push    ax
        nop
        push    cs
        call    fn_ba62f
        add     sp, 4
        jmp     loop_ba599
tgt_ba589:
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 2]
        else
        mov     al, byte ptr [bp - 4]
        endif
        push    ax
        mov     al, byte ptr [B_7FC7]
        push    ax
        nop
        push    cs
        call    fn_ba62f
        add     sp, 4
loop_ba599:
        if      FW_VERSION >= 311
        mov     ax, si
        add     ax, 80h
        else
        mov     al, byte ptr [bp - 2]
        add     al, 80h
        endif
        push    ax
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jnz     br_ba5b0
        jmp     br_ba4e1
br_ba5b0:
        cmp     ax, 78h
        jz      br_ba5bc
        cmp     ax, 79h
        jz      br_ba5ef
        jmp     br_ba5f6
br_ba5bc:
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 1]
        else
        mov     al, byte ptr [bp - 3]
        endif
        mov     byte ptr [B_9781], al
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2f3h]
        mov     byte ptr [B_9780], al
        mov     al, 1
        mov     byte ptr [B_D4AB], al
        cbw
        push    ax
        push    0eh
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        mov     al, byte ptr [B_D4C2]
        cbw
        mov     dx, ax
        jmp     br_ba5f6
br_ba5ef:
        nop
        push    cs
        call    far_ba670
        mov     dx, ax
br_ba5f6:
        or      dx, dx
        jz      loop_ba599
        mov     ax, dx
        if      FW_VERSION >= 311
        pop     si
        endif
        leave
        retf
TBL_ba5ff:
        dw      tgt_ba4f6
        dw      tgt_ba509
        dw      tgt_ba535
        dw      tgt_ba589
fn_ba607:
        push    bp
        mov     bp, sp
        mov     dx, 4
        cmp     byte ptr [B_7FC7], 0
        jz      br_ba62b
        mov     ax, word ptr [bp + 6]
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2f3h]
        mov     ah, 0
        mov     dx, ax
br_ba62b:
        mov     ax, dx
        pop     bp
        retf
fn_ba62f:
        push    bp
        mov     bp, sp
        push    1bh
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     byte ptr [bp + 6], 1
        jnz     br_ba662
        cmp     byte ptr [bp + 8], 0
        jnz     br_ba662
        push    ds
        push    word A_3BF3
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
        pop     bp
        retf
br_ba662:
        push    ds
        push    word STR_3C0F
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        pop     bp
        retf
far_ba670:
        push    bp
        mov     bp, sp
        sub     sp, 0eh
        push    si
        push    di
        push    ds
        push    word STR_3C1D
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_3BE4
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_3BEA
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3C3D
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    14h
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3C48
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        mov     si, 1
        jmp     br_baa24
br_ba6ef:
        callf   SEG_B05A:far_b05a7
        push    20h
        push    0
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_E421]
        inc     al
        mov     byte ptr [bp - 9], al
        push    8
        push    18h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 9]
        push    ax
        push    ds
        push    word A_3B9C
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    5
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        les     bx, dword ptr [FP_E40C]
        mov     al, byte ptr es:[bx + 11h]
        mov     byte ptr [B_977F], al
        push    18h
        push    62h
        push    22h
        push    2
        push    ds
        push    word B_977F
        push    ds
        push    word A_3B9C
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    5
        push    1
        mov     al, byte ptr [B_977F]
        push    ax
        callf   SEG_C495:far_c530b
        add     sp, 6
        push    10h
        push    7
        push    1
        mov     al, byte ptr [B_977F]
        cbw
        push    ax
        callf   SEG_B702:far_b9045
        add     sp, 8
        push    6
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     byte ptr [B_977E], 0
        cmp     byte ptr [B_977F], 23h
        jl      br_ba7a2
        mov     al, byte ptr [B_977F]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2f3h]
        mov     byte ptr [B_977E], al
br_ba7a2:
        push    6
        push    ds
        push    word P_0230+4
        push    ds
        push    word B_977E
        push    ds
        push    word A_3B9C
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        mov     al, byte ptr [B_977E]
        cbw
        mov     bx, ax
        cmp     bx, 3
        jbe     br_ba7c6
        jmp     near br_ba869
br_ba7c6:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_baa45]
tgt_ba7cd:
        les     bx, dword ptr [FP_E40C]
        mov     al, byte ptr es:[bx + 12h]
        cbw
        mov     word ptr [bp - 4], ax
        mov     al, byte ptr es:[bx + 13h]
        cbw
        mov     word ptr [bp - 6], ax
        mov     di, 0ff88h
        mov     word ptr [bp - 8], 78h
        mov     word ptr [bp - 0ch], 0
        mov     word ptr [bp - 0eh], 0
        jmp     br_ba869
tgt_ba7f5:
        les     bx, dword ptr [FP_E40C]
        mov     al, byte ptr es:[bx + 14h]
        cbw
        mov     word ptr [bp - 4], ax
        mov     al, byte ptr es:[bx + 15h]
        cbw
        mov     word ptr [bp - 6], ax
        xor     di, di
        mov     word ptr [bp - 8], 64h
        mov     word ptr [bp - 0ch], SEG_DA7E
        if      FW_VERSION >= 312
        mov     word ptr [bp - 0eh], 0c5h
        elseif  FW_VERSION = 311
        mov     word ptr [bp - 0eh], 0cbh
        else
        mov     word ptr [bp - 0eh], 0cfh
        endif
        jmp     br_ba869
tgt_ba81c:
        les     bx, dword ptr [FP_E40C]
        mov     al, byte ptr es:[bx + 16h]
        cbw
        mov     word ptr [bp - 4], ax
        mov     al, byte ptr es:[bx + 17h]
        cbw
        mov     word ptr [bp - 6], ax
        xor     di, di
        mov     word ptr [bp - 8], 64h
        mov     word ptr [bp - 0ch], SEG_DA7E
        if      FW_VERSION >= 312
        mov     word ptr [bp - 0eh], 0c5h
        elseif  FW_VERSION = 311
        mov     word ptr [bp - 0eh], 0cbh
        else
        mov     word ptr [bp - 0eh], 0cfh
        endif
        jmp     br_ba869
tgt_ba843:
        les     bx, dword ptr [FP_E40C]
        mov     al, byte ptr es:[bx + 18h]
        cbw
        mov     word ptr [bp - 4], ax
        mov     al, byte ptr es:[bx + 19h]
        cbw
        mov     word ptr [bp - 6], ax
        mov     di, 0ffceh
        mov     word ptr [bp - 8], 32h
        mov     word ptr [bp - 0ch], 0
        mov     word ptr [bp - 0eh], 0
br_ba869:
        push    0ah
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 0ch]
        push    word ptr [bp - 0eh]
        push    0
        push    word ptr [bp - 8]
        push    di
        push    4
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ds
        push    word A_3B9C
        callf   SEG_B347:far_b3723
        add     sp, 14h
        push    1fh
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 0ch]
        push    word ptr [bp - 0eh]
        push    0
        push    word ptr [bp - 8]
        push    di
        push    4
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word A_3B9C
        callf   SEG_B347:far_b3723
        add     sp, 14h
        cmp     byte ptr [B_977E], 2
        jz      br_ba8cd
        cmp     byte ptr [B_977E], 1
        jnz     br_ba8ed
br_ba8cd:
        push    word SEG_DA7E
        if      FW_VERSION >= 312
        push    word 0c5h
        elseif  FW_VERSION = 311
        push    word 0cbh
        else
        push    word 0cfh
        endif
        push    3
        callf   SEG_B05A:far_b1259
        add     sp, 6
        push    word SEG_DA7E
        if      FW_VERSION >= 312
        push    word 0c5h
        elseif  FW_VERSION = 311
        push    word 0cbh
        else
        push    word 0cfh
        endif
        push    4
        callf   SEG_B05A:far_b1259
        add     sp, 6
br_ba8ed:
        xor     si, si
        mov     word ptr [bp - 2], 0
        if      FW_VERSION >= 311
        jmp     br_baa0b
        else
        jmp     L_c4a50
        endif
br_ba8f7:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     bx, ax
        cmp     bx, 4
        jbe     br_ba905
        if      FW_VERSION >= 311
        jmp     br_ba9f8
        else
        jmp     L_c4a50
        endif
br_ba905:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_baa3b]
tgt_ba90c:
        mov     al, byte ptr [bp - 9]
        cbw
        dec     ax
        push    ax
        callf   SEG_C495:far_c6547
        add     sp, 2
        mov     si, 1
        if      FW_VERSION >= 311
        jmp     br_ba9f8
        else
        jmp     L_c4a50
        endif
tgt_ba920:
        les     bx, dword ptr [FP_E40C]
        mov     al, byte ptr [B_977F]
        mov     byte ptr es:[bx + 11h], al
        cmp     byte ptr [B_977F], 23h
        jl      br_ba942
        cbw
        mov     dx, 18h
        imul    dx
        add     bx, ax
        mov     al, byte ptr es:[bx - 2f3h]
        mov     byte ptr [B_977E], al
br_ba942:
        mov     si, 1
        if      FW_VERSION >= 311
        jmp     near br_ba9f8
        else
        jmp     near L_c4a50
        endif
tgt_ba948:
        cmp     byte ptr [B_977F], 23h
        jl      br_ba966
        mov     al, byte ptr [B_977F]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr [B_977E]
        mov     byte ptr es:[bx - 2f3h], al
br_ba966:
        mov     si, 1
        if      FW_VERSION >= 311
        jmp     near br_ba9f8
        else
        jmp     near L_c4a50
        endif
tgt_ba96c:
        mov     ax, word ptr [bp - 4]
        cmp     ax, word ptr [bp - 6]
        jle     br_ba977
        mov     word ptr [bp - 6], ax
br_ba977:
        push    4
        callf   SEG_B05A:far_b1073
        add     sp, 2
tgt_ba981:
        mov     ax, word ptr [bp - 6]
        cmp     ax, word ptr [bp - 4]
        jge     br_ba98c
        mov     word ptr [bp - 4], ax
br_ba98c:
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [B_977E]
        cbw
        mov     bx, ax
        cmp     bx, 3
        if      FW_VERSION >= 311
        ja      br_ba9f8
        else
        ja      L_c4a50
        endif
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_baa33]
tgt_ba9a8:
        les     bx, dword ptr [FP_E40C]
        mov     al, byte ptr [bp - 4]
        mov     byte ptr es:[bx + 12h], al
        mov     al, byte ptr [bp - 6]
        mov     byte ptr es:[bx + 13h], al
        if      FW_VERSION >= 311
        jmp     br_ba9f8
        else
        jmp     L_c4a50
        endif
tgt_ba9bc:
        les     bx, dword ptr [FP_E40C]
        mov     al, byte ptr [bp - 4]
        mov     byte ptr es:[bx + 14h], al
        mov     al, byte ptr [bp - 6]
        mov     byte ptr es:[bx + 15h], al
        if      FW_VERSION >= 311
        jmp     br_ba9f8
        else
        jmp     L_c4a50
        endif
tgt_ba9d0:
        les     bx, dword ptr [FP_E40C]
        mov     al, byte ptr [bp - 4]
        mov     byte ptr es:[bx + 16h], al
        mov     al, byte ptr [bp - 6]
        mov     byte ptr es:[bx + 17h], al
        if      FW_VERSION >= 311
        jmp     br_ba9f8
        else
        jmp     L_c4a50
        endif
tgt_ba9e4:
        les     bx, dword ptr [FP_E40C]
        mov     al, byte ptr [bp - 4]
        mov     byte ptr es:[bx + 18h], al
        mov     al, byte ptr [bp - 6]
        mov     byte ptr es:[bx + 19h], al
        if      FW_VERSION >= 311
        jmp     br_ba9f8
br_ba9f8:
        mov     al, byte ptr [B_977E]
        push    ax
        mov     al, byte ptr [B_977C]
        push    ax
        callf   SEG_DA7E:far_da7e0
        add     sp, 4
        mov     byte ptr [B_977D], al
br_baa0b:
        else
        jmp     L_c4a50
L_c4a50:
        endif
        or      si, si
        jnz     br_baa24
        if      FW_VERSION >= 311
        push    word 80h
        else
        push    0ff80h
        endif
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jnz     br_baa24
        jmp     br_ba8f7
br_baa24:
        cmp     si, 1
        jnz     br_baa2c
        jmp     br_ba6ef
br_baa2c:
        mov     ax, word ptr [bp - 2]
        pop     di
        pop     si
        leave
        retf
TBL_baa33:
        dw      tgt_ba9a8
        dw      tgt_ba9bc
        dw      tgt_ba9d0
        dw      tgt_ba9e4
TBL_baa3b:
        dw      tgt_ba90c
        dw      tgt_ba920
        dw      tgt_ba948
        dw      tgt_ba96c
        dw      tgt_ba981
TBL_baa45:
        dw      tgt_ba7cd
        dw      tgt_ba7f5
        dw      tgt_ba81c
        dw      tgt_ba843
        if      FW_VERSION >= 312
        phase   0dh
        elseif  FW_VERSION = 311
        phase   6
        else
        phase   1
        endif
fn_baa4d:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 4
        mov     bx, word ptr [bp + 0eh]
        cmp     byte ptr [B_7AC3], 0
        jnz     br_baa74
        push    bx
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_E7F0:far_e82dd
        add     sp, 0ah
        leave
        retf
br_baa74:
        cmp     byte ptr [B_7AC0], 5
        jnz     br_baa80
        mov     ax, 4
        jmp     br_baa83
br_baa80:
        mov     ax, 10h
br_baa83:
        else
        push    si
        push    di
        les     bx, dword ptr [bp + 6]
        mov     ax, word ptr es:[bx + 2]
        mov     si, word ptr es:[bx]
        les     bx, dword ptr [bp + 0ah]
        les     di, dword ptr es:[bx]
        endif
        push    ax
        if      FW_VERSION >= 311
        mov     ax, bx
        pop     dx
        imul    dx
        mov     dx, word ptr [W_7AD3]
        mov     bx, word ptr [W_7AD1]
        add     bx, ax
        adc     dx, 0
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], bx
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    0
        push    word 200h
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        callf   0f800h:far_fa0fe
        else
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        mov     ax, ds
        pop     ds
        endif
        push    ax
        if      FW_VERSION >= 311
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    word ptr [W_7ACC]
        callf   SEG_D546:far_d565e
        add     sp, 0ch
        or      ax, ax
        jz      br_baace
        mov     ax, 0fffdh
        leave
        retf
br_baace:
        endif
        xor     ax, ax
        if      FW_VERSION >= 312
        leave
        retf
fn_baad2:
        push    ds
        push    word STR_3CC8
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        mov     byte ptr [B_D5DD], 49h
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3CD6
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        push    word STR_3D00
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0ch
        push    ds
        push    word TBL_E589
        push    ds
        push    word B_7ACB
        push    ds
        push    word STR_3D1B
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_3D23
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_bab46
loop_bab3c:
        push    0
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_bab46:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_bab3c
        cmp     dx, 78h
        jnz     br_bab5d
        xor     dx, dx
br_bab5d:
        mov     ax, dx
        elseif  FW_VERSION = 311
        leave
        retf
fn_baad2:
        push    ds
        push    word STR_3CC8
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        mov     byte ptr [B_D5DD], 49h
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3CD6
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        push    word STR_3D00
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0ch
        push    ds
        push    word TBL_E589
        push    ds
        push    word B_7ACB
        push    ds
        push    word STR_3D1B
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_3D23
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_bab46
loop_bab3c:
        push    0
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_bab46:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_bab3c
        cmp     dx, 78h
        jnz     br_bab5d
        xor     dx, dx
br_bab5d:
        mov     ax, dx
        else
        repe cmpsb
        pop     ds
        jz      L_c4ac2
        sbb     ax, ax
        sbb     ax, 0ffffh
L_c4ac2:
        pop     di
        pop     si
        pop     bp
        endif
        retf
fn_bab60:
        push    bp
        mov     bp, sp
        sub     sp, 4
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 0
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 13h]
        mov     ah, 0
        cwd
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        mov     cl, 8
        callf   0f800h:far_fa1ac
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 12h]
        mov     ah, 0
        cwd
        or      word ptr [bp - 4], ax
        or      word ptr [bp - 2], dx
        mov     cl, 8
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        callf   0f800h:far_fa1ac
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 11h]
        mov     ah, 0
        cwd
        or      word ptr [bp - 4], ax
        or      word ptr [bp - 2], dx
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        leave
        retf
fn_babc8:
        push    bp
        mov     bp, sp
        push    si
        push    di
        les     di, dword ptr [bp + 6]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        dec     cx
        dec     cx
        mov     dx, cx
        mov     si, word ptr [bp + 6]
        add     si, dx
        jmp     br_babf3
loop_babe4:
        mov     es, word ptr [bp + 8]
        cmp     byte ptr es:[si], 5fh
        jnz     br_babf7
        mov     byte ptr es:[si], 0
        dec     si
        dec     dx
br_babf3:
        or      dx, dx
        jge     loop_babe4
br_babf7:
        pop     di
        pop     si
        pop     bp
        retf
fn_babfb:
        push    bp
        mov     bp, sp
        push    si
        xor     dx, dx
        mov     si, word ptr [bp + 6]
loop_bac04:
        mov     es, word ptr [bp + 8]
        mov     al, byte ptr es:[si]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_3C54]
        mov     byte ptr es:[si], al
        inc     si
        inc     dx
        cmp     dx, 0ch
        jl      loop_bac04
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx + 0ch], 0
        push    word ptr [bp + 8]
        push    bx
        push    cs
        call    fn_babc8
        add     sp, 4
        pop     si
        pop     bp
        retf
fn_bac31:
        push    bp
        mov     bp, sp
        sub     sp, 0eh
        push    si
        push    di
        if      FW_VERSION >= 311
        mov     word ptr [bp - 0ch], ds
        mov     word ptr [bp - 0eh], TBL_E589
        push    word ptr [W_3C84]
        push    word ptr [W_3C82]
        push    22h
        push    word ptr [W_7AD3]
        push    word ptr [W_7AD1]
        push    word ptr [W_7ACC]
        callf   SEG_D546:far_d565e
        add     sp, 0ch
        or      ax, ax
        jz      br_bac6a
        mov     ax, 0fffdh
        pop     di
        pop     si
        leave
        retf
br_bac6a:
        cmp     byte ptr [B_7ACA], 2
        jz      br_bac7b
        cmp     byte ptr [B_7ACA], 3
        jz      br_bac7b
        jmp     br_badbb
br_bac7b:
        else
        mov     word ptr [bp - 2], 96h
        mov     word ptr [bp - 4], 40h
        mov     byte ptr [bp - 5], 73h
        endif
        mov     ax, word ptr [W_3C84]
        mov     dx, word ptr [W_3C82]
        if      FW_VERSION >= 311
        add     dx, 0cah
        endif
        mov     word ptr [bp - 8], ax
        mov     word ptr [bp - 0ah], dx
        les     bx, dword ptr [bp - 0ah]
        if      FW_VERSION >= 312
        test    byte ptr es:[bx + 0ch], 2
        jz      br_bac9a
        mov     al, 3
        jmp     br_bac9c
br_bac9a:
        mov     al, 1
br_bac9c:
        mov     byte ptr [B_E584], al
        xor     di, di
        mov     ax, di
        mov     word ptr [bp - 2], ax
        mov     si, 0e781h
        jmp     br_bad0d
loop_bacab:
        les     bx, dword ptr [bp - 0ah]
        mov     al, byte ptr es:[bx]
        cbw
        or      ax, ax
        jnz     br_bacc8
        mov     al, byte ptr es:[bx + 1]
        cbw
        or      ax, ax
        jnz     br_bacc8
        mov     al, byte ptr es:[bx + 2]
        cbw
        or      ax, ax
        jz      br_bad13
br_bacc8:
        les     bx, dword ptr [bp - 0ah]
        test    byte ptr es:[bx + 0ch], 1
        jz      br_bad06
        cmp     word ptr es:[bx + 0eh], 0
        jz      br_bad06
        push    word ptr [bp - 8]
        push    bx
        push    cs
        call    fn_babfb
        add     sp, 4
        push    ds
        push    si
        push    word ptr [bp - 8]
        push    word ptr [bp - 0ah]
        mov     cx, 10h
        callf   0f800h:far_fa0df
        les     bx, dword ptr [bp - 0eh]
        mov     word ptr es:[bx + 2], ds
        mov     word ptr es:[bx], si
        add     si, 10h
        inc     di
        add     word ptr [bp - 0eh], 4
br_bad06:
        inc     word ptr [bp - 2]
        add     word ptr [bp - 0ah], 10h
br_bad0d:
        cmp     word ptr [bp - 2], 63h
        jl      loop_bacab
br_bad13:
        or      di, di
        jnz     br_bad1a
        jmp     near br_bad9f
br_bad1a:
        les     bx, dword ptr [bp - 0eh]
        mov     word ptr es:[bx + 2], 0
        mov     word ptr es:[bx], 0
        cmp     di, 1
        jle     br_bad42
        push    word SEG_B52D
        push    word 266h
        push    4
        push    di
        push    ds
        push    word TBL_E589
        callf   0f800h:far_fa6e5
        add     sp, 0ch
br_bad42:
        mov     al, byte ptr [B_7ACB]
        mov     ah, 0
        shl     ax, 2
        mov     bx, ax
        les     bx, dword ptr [bx + TBL_E589]
        mov     ax, word ptr es:[bx + 0eh]
        push    ax
        cmp     byte ptr [B_7AC0], 5
        jnz     br_bad61
        mov     ax, 4
        jmp     br_bad64
br_bad61:
        mov     ax, 10h
br_bad64:
        mov     dx, ax
        pop     ax
        imul    dx
        mov     dx, word ptr [W_7AD3]
        mov     bx, word ptr [W_7AD1]
        add     bx, ax
        adc     dx, 0
        mov     word ptr [bp - 4], dx
        mov     word ptr [bp - 6], bx
        push    word ptr [W_3C88]
        push    word ptr [W_3C86]
        push    18h
        push    dx
        push    bx
        push    word ptr [W_7ACC]
        callf   SEG_D546:far_d565e
        add     sp, 0ch
        or      ax, ax
        jz      br_bade0
        mov     ax, 0fffdh
        pop     di
        pop     si
        leave
        retf
br_bad9f:
        mov     ax, word ptr [W_3C90]
        mov     dx, word ptr [W_3C8E]
        mov     word ptr [TBL_E58B], ax
        mov     word ptr [TBL_E589], dx
        mov     word ptr [W_E58F], 0
        mov     word ptr [W_E58D], 0
        jmp     br_bade0
br_badbb:
        push    word ptr [W_3C80]
        push    word ptr [W_3C7E]
        push    1
        push    0
        push    30h
        push    word ptr [W_7ACC]
        callf   SEG_D546:far_d565e
        add     sp, 0ch
        or      ax, ax
        jz      br_bade0
        mov     ax, 0fffdh
        pop     di
        pop     si
        leave
        retf
br_bade0:
        mov     ax, di
        pop     di
        pop     si
        leave
        retf
fn_bade6:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    si
        push    di
        mov     al, byte ptr [B_7AC3]
        mov     ah, 0
        or      ax, ax
        jnz     br_bae15
        mov     ax, word ptr [W_3C80]
        mov     dx, word ptr [W_3C7E]
        add     dx, 600h
        mov     word ptr [W_E587], ax
        mov     word ptr [W_E585], dx
        mov     word ptr [bp - 4], 40h
        mov     word ptr [bp - 2], 96h
        jmp     br_bae56
br_bae15:
        cmp     byte ptr [B_E584], 1
        jnz     br_bae3a
        mov     ax, word ptr [W_3C84]
        mov     dx, word ptr [W_3C82]
        add     dx, 70ah
        mov     word ptr [W_E587], ax
        mov     word ptr [W_E585], dx
        mov     word ptr [bp - 4], 40h
        mov     word ptr [bp - 2], 96h
        jmp     br_bae56
br_bae3a:
        mov     ax, word ptr [W_3C84]
        mov     dx, word ptr [W_3C82]
        add     dx, 70ah
        mov     word ptr [W_E587], ax
        mov     word ptr [W_E585], dx
        elseif  FW_VERSION = 311
        test    byte ptr es:[bx + 0ch], 2
        jz      br_bac9a
        mov     al, 3
        jmp     br_bac9c
br_bac9a:
        mov     al, 1
br_bac9c:
        mov     byte ptr [B_E584], al
        xor     di, di
        mov     ax, di
        mov     word ptr [bp - 2], ax
        mov     si, 0e6c9h
        jmp     br_bad0d
loop_bacab:
        les     bx, dword ptr [bp - 0ah]
        mov     al, byte ptr es:[bx]
        cbw
        or      ax, ax
        jnz     br_bacc8
        mov     al, byte ptr es:[bx + 1]
        cbw
        or      ax, ax
        jnz     br_bacc8
        mov     al, byte ptr es:[bx + 2]
        cbw
        or      ax, ax
        jz      br_bad13
br_bacc8:
        les     bx, dword ptr [bp - 0ah]
        test    byte ptr es:[bx + 0ch], 1
        jz      br_bad06
        cmp     word ptr es:[bx + 0eh], 0
        jz      br_bad06
        push    word ptr [bp - 8]
        push    bx
        push    cs
        call    fn_babfb
        add     sp, 4
        push    ds
        push    si
        push    word ptr [bp - 8]
        push    word ptr [bp - 0ah]
        mov     cx, 10h
        callf   0f800h:far_fa0df
        les     bx, dword ptr [bp - 0eh]
        mov     word ptr es:[bx + 2], ds
        mov     word ptr es:[bx], si
        add     si, 10h
        inc     di
        add     word ptr [bp - 0eh], 4
br_bad06:
        inc     word ptr [bp - 2]
        add     word ptr [bp - 0ah], 10h
br_bad0d:
        cmp     word ptr [bp - 2], 63h
        jl      loop_bacab
br_bad13:
        or      di, di
        jnz     br_bad1a
        jmp     near br_bad9f
br_bad1a:
        les     bx, dword ptr [bp - 0eh]
        mov     word ptr es:[bx + 2], 0
        mov     word ptr es:[bx], 0
        cmp     di, 1
        jle     br_bad42
        push    word SEG_B52D
        push    word 265h
        push    4
        push    di
        push    ds
        push    word TBL_E589
        callf   0f800h:far_fa6e5
        add     sp, 0ch
br_bad42:
        mov     al, byte ptr [B_7ACB]
        mov     ah, 0
        shl     ax, 2
        mov     bx, ax
        les     bx, dword ptr [bx + TBL_E589]
        mov     ax, word ptr es:[bx + 0eh]
        push    ax
        cmp     byte ptr [B_7AC0], 5
        jnz     br_bad61
        mov     ax, 4
        jmp     br_bad64
br_bad61:
        mov     ax, 10h
br_bad64:
        mov     dx, ax
        pop     ax
        imul    dx
        mov     dx, word ptr [W_7AD3]
        mov     bx, word ptr [W_7AD1]
        add     bx, ax
        adc     dx, 0
        mov     word ptr [bp - 4], dx
        mov     word ptr [bp - 6], bx
        push    word ptr [W_3C88]
        push    word ptr [W_3C86]
        push    18h
        push    dx
        push    bx
        push    word ptr [W_7ACC]
        callf   SEG_D546:far_d565e
        add     sp, 0ch
        or      ax, ax
        jz      br_bade0
        mov     ax, 0fffdh
        pop     di
        pop     si
        leave
        retf
br_bad9f:
        mov     ax, word ptr [W_3C90]
        mov     dx, word ptr [W_3C8E]
        mov     word ptr [TBL_E58B], ax
        mov     word ptr [TBL_E589], dx
        mov     word ptr [W_E58F], 0
        mov     word ptr [W_E58D], 0
        jmp     br_bade0
br_badbb:
        push    word ptr [W_3C80]
        push    word ptr [W_3C7E]
        push    1
        push    0
        push    30h
        push    word ptr [W_7ACC]
        callf   SEG_D546:far_d565e
        add     sp, 0ch
        or      ax, ax
        jz      br_bade0
        mov     ax, 0fffdh
        pop     di
        pop     si
        leave
        retf
br_bade0:
        mov     ax, di
        pop     di
        pop     si
        leave
        retf
fn_bade6:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    si
        push    di
        mov     al, byte ptr [B_7AC3]
        mov     ah, 0
        or      ax, ax
        jnz     br_bae15
        mov     ax, word ptr [W_3C80]
        mov     dx, word ptr [W_3C7E]
        add     dx, 600h
        mov     word ptr [W_E587], ax
        mov     word ptr [W_E585], dx
        mov     word ptr [bp - 4], 40h
        mov     word ptr [bp - 2], 96h
        jmp     br_bae56
br_bae15:
        cmp     byte ptr [B_E584], 1
        jnz     br_bae3a
        mov     ax, word ptr [W_3C84]
        mov     dx, word ptr [W_3C82]
        add     dx, 70ah
        mov     word ptr [W_E587], ax
        mov     word ptr [W_E585], dx
        mov     word ptr [bp - 4], 40h
        mov     word ptr [bp - 2], 96h
        jmp     br_bae56
br_bae3a:
        mov     ax, word ptr [W_3C84]
        mov     dx, word ptr [W_3C82]
        add     dx, 70ah
        mov     word ptr [W_E587], ax
        mov     word ptr [W_E585], dx
        else
        cmp     byte ptr es:[bx + 10h], 0ffh
        jnz     br_bae56
        add     dx, 1400h
        mov     word ptr [bp - 8], ax
        mov     word ptr [bp - 0ah], dx
        endif
        mov     word ptr [bp - 4], 1feh
        if      FW_VERSION < 311
        mov     byte ptr [bp - 5], 0f3h
        endif
        mov     word ptr [bp - 2], 0c0h
br_bae56:
        xor     di, di
        mov     si, di
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp + 0ah]
        else
        mov     ax, word ptr [bp - 0ah]
        endif
        push    ax
        mov     ax, si
        mov     dx, 18h
        imul    dx
        pop     dx
        add     dx, ax
        if      FW_VERSION >= 311
        mov     word ptr [bp - 6], dx
        else
        mov     word ptr [bp - 0ch], dx
        endif
        mov     ax, word ptr [bp + 6]
        if      FW_VERSION >= 311
        mov     word ptr [bp - 8], ax
        else
        mov     word ptr [bp - 0eh], ax
        endif
        cmp     si, word ptr [bp - 4]
        jge     br_baec4
loop_bae76:
        if      FW_VERSION >= 311
        mov     es, word ptr [bp + 0ch]
        mov     bx, word ptr [bp - 6]
        else
        mov     es, word ptr [bp - 8]
        mov     bx, word ptr [bp - 0ch]
        endif
        mov     al, byte ptr es:[bx + 10h]
        if      FW_VERSION >= 311
        mov     ah, 0
        and     ax, 7fh
        cmp     ax, 73h
        jnz     br_baeba
        push    word ptr [bp + 0ch]
        else
        cmp     al, byte ptr [bp - 5]
        jnz     L_c4c3b
        push    word ptr [bp - 8]
        endif
        push    bx
        push    cs
        call    fn_babfb
        add     sp, 4
        if      FW_VERSION >= 311
        mov     es, word ptr [bp + 0ch]
        mov     bx, word ptr [bp - 6]
        else
        mov     es, word ptr [bp - 8]
        mov     bx, word ptr [bp - 0ch]
        endif
        mov     ax, word ptr [bp - 2]
        mov     word ptr es:[bx + 0eh], ax
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp + 0ch]
        mov     dx, word ptr [bp - 6]
        else
        mov     ax, word ptr [bp - 8]
        mov     dx, word ptr [bp - 0ch]
        endif
        mov     es, word ptr [bp + 8]
        if      FW_VERSION >= 311
        mov     bx, word ptr [bp - 8]
        else
        mov     bx, word ptr [bp - 0eh]
        endif
        mov     word ptr es:[bx + 2], ax
        mov     word ptr es:[bx], dx
        if      FW_VERSION >= 311
        add     word ptr [bp - 8], 4
        else
        add     word ptr [bp - 0eh], 4
        endif
        inc     di
        if      FW_VERSION >= 311
br_baeba:
        add     word ptr [bp - 6], 18h
        else
L_c4c3b:
        add     word ptr [bp - 0ch], 18h
        endif
        inc     si
        cmp     si, word ptr [bp - 4]
        jl      loop_bae76
br_baec4:
        mov     ax, di
        pop     di
        pop     si
        leave
        retf
fn_baeca:
        push    bp
        mov     bp, sp
        push    si
        les     bx, dword ptr [bp + 6]
        if      FW_VERSION >= 311
        mov     ax, word ptr [W_3C8C]
        mov     dx, word ptr [W_3C8A]
        mov     word ptr es:[bx + 2], ax
        mov     word ptr es:[bx], dx
        else
        mov     word ptr es:[bx + 2], ds
        mov     word ptr es:[bx], 3906h
        endif
        mov     word ptr es:[bx + 6], 0
        mov     word ptr es:[bx + 4], 0
        if      FW_VERSION >= 311
        cmp     byte ptr [B_7AC3], 0
        jnz     br_baf5f
        endif
        callf   SEG_E7F0:far_e8278
        mov     si, ax
        or      ax, ax
        jge     br_baf00
        pop     si
        pop     bp
        retf
br_baf00:
        push    0
        push    0
        push    word 43d0h
        push    word SEG_A28F
        push    word 0
        callf   SEG_E7F0:far_e82dd
        add     sp, 0ah
        or      ax, ax
        jz      br_baf1f
        mov     ax, 0fffdh
        pop     si
        pop     bp
        retf
br_baf1f:
        if      FW_VERSION >= 311
        les     bx, dword ptr [W_3C7E]
        cmp     byte ptr es:[bx + 10h], 0ffh
        jnz     br_baf46
        mov     ax, word ptr [W_3C7E]
        add     ax, 1400h
        push    word ptr [W_3C80]
        push    ax
        endif
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    cs
        if      FW_VERSION >= 311
        call    fn_bade6
        add     sp, 8
        else
        call    fn_bac31
        add     sp, 4
        endif
        mov     si, ax
        if      FW_VERSION >= 311
        jmp     br_baf96
br_baf46:
        push    word ptr [W_3C80]
        push    word ptr [W_3C7E]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    cs
        call    fn_bade6
        add     sp, 8
        mov     si, ax
        jmp     br_baf96
br_baf5f:
        cmp     byte ptr [B_7ACA], 2
        jz      br_baf6d
        cmp     byte ptr [B_7ACA], 3
        jnz     br_baf90
br_baf6d:
        push    cs
        call    fn_bac31
        mov     si, ax
        or      si, si
        jle     br_baf96
        push    word ptr [W_3C88]
        push    word ptr [W_3C86]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    cs
        call    fn_bade6
        add     sp, 8
        mov     si, ax
        jmp     br_baf96
br_baf90:
        mov     ax, 0fffeh
        else
        or      ax, ax
        jnz     L_c4cac
        xor     ax, ax
        endif
        pop     si
        pop     bp
        retf
        if      FW_VERSION >= 311
br_baf96:
        or      si, si
        jle     br_bafc6
        else
L_c4cac:
        endif
        mov     ax, si
        shl     ax, 2
        les     bx, dword ptr [bp + 6]
        add     bx, ax
        mov     word ptr es:[bx + 2], 0
        mov     word ptr es:[bx], 0
        if      FW_VERSION >= 312
        push    word SEG_B52D
        push    word 266h
        elseif  FW_VERSION = 311
        push    word SEG_B52D
        push    word 265h
        else
        cmp     si, 1
        jle     br_bafc6
        push    word 0c4a9h
        push    word 1
        endif
        push    4
        push    si
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   0f800h:far_fa6e5
        add     sp, 0ch
br_bafc6:
        mov     ax, si
        pop     si
        pop     bp
        retf
fn_bafcb:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp + 6]
        cmp     ax, 0fffeh
        jz      br_bafdd
        cmp     ax, 0ffffh
        jz      br_bafea
        jmp     br_baff6
br_bafdd:
        if      FW_VERSION >= 311
        push    word 0ff49h
        else
        push    word 0ff02h
        endif
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        pop     bp
        retf
br_bafea:
        push    0ff80h
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        pop     bp
        retf
br_baff6:
        push    word 0f500h
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        pop     bp
        retf
        if      FW_VERSION >= 311
fn_bb003:
        else
L_c4d1a:
        endif
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 312
        sub     sp, 4
        push    si
        push    di
        les     di, dword ptr [bp + 6]
        push    es
        mov     es, word ptr [bp + 0ch]
        push    di
        mov     di, word ptr [bp + 0ah]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, word ptr [bp + 0ch]
        mov     si, word ptr [bp + 0ah]
        pop     di
        pop     es
        push    ds
        mov     ds, ax
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        les     di, dword ptr [bp + 6]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        dec     cx
        dec     cx
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        add     dx, cx
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        les     bx, dword ptr [bp - 4]
        cmp     byte ptr es:[bx], 4ch
        jnz     br_bb05e
        mov     al, 52h
        jmp     br_bb060
br_bb05e:
        mov     al, 4ch
br_bb060:
        les     bx, dword ptr [bp - 4]
        mov     byte ptr es:[bx], al
        pop     di
        pop     si
        leave
        retf
fn_bb06a:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    di
        les     di, dword ptr [bp + 6]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        dec     cx
        mov     bx, cx
        cmp     bx, 2
        jle     br_bb0c0
        mov     ax, bx
        mov     dx, word ptr [bp + 8]
        add     ax, word ptr [bp + 6]
        add     ax, 0fffeh
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        les     bx, dword ptr [bp - 4]
        inc     word ptr [bp - 4]
        cmp     byte ptr es:[bx], 2dh
        jnz     br_bb0c0
        les     bx, dword ptr [bp - 4]
        cmp     byte ptr es:[bx], 4ch
        jnz     br_bb0b1
        mov     ax, 1
        pop     di
        leave
        retf
br_bb0b1:
        les     bx, dword ptr [bp - 4]
        cmp     byte ptr es:[bx], 52h
        jnz     br_bb0c0
        mov     ax, 2
        pop     di
        leave
        retf
br_bb0c0:
        xor     ax, ax
        pop     di
        leave
        retf
fn_bb0c5:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    si
        push    di
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        mov     word ptr [bp - 6], 0
        jmp     br_bb13c
loop_bb0e0:
        les     bx, dword ptr [bp - 4]
        les     di, dword ptr es:[bx]
        mov     ax, word ptr [bp + 0eh]
        mov     si, word ptr [bp + 0ch]
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        mov     ax, ds
        pop     ds
        push    ax
        xor     ax, ax
        repe cmpsb
        pop     ds
        jz      br_bb108
        sbb     ax, ax
        sbb     ax, 0ffffh
br_bb108:
        or      ax, ax
        jnz     br_bb135
        les     bx, dword ptr [bp - 4]
        push    word ptr es:[bx + 2]
        push    word ptr es:[bx]
        push    cs
        call    fn_bab60
        add     sp, 4
        cmp     dx, word ptr [bp + 12h]
        jnz     br_bb12e
        cmp     ax, word ptr [bp + 10h]
        jnz     br_bb12e
        mov     ax, word ptr [bp - 6]
        pop     di
        pop     si
        leave
        retf
br_bb12e:
        mov     ax, 0ffffh
        pop     di
        pop     si
        leave
        retf
br_bb135:
        inc     word ptr [bp - 6]
        add     word ptr [bp - 4], 4
br_bb13c:
        mov     ax, word ptr [bp - 6]
        cmp     ax, word ptr [bp + 0ah]
        jl      loop_bb0e0
        mov     ax, 0ffffh
        pop     di
        pop     si
        leave
        retf
fn_bb14b:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        cmp     byte ptr [B_7AC3], 0
        jz      br_bb15f
        mov     ax, 0ffffh
        pop     si
        leave
        retf
br_bb15f:
        mov     ax, word ptr [bp + 0eh]
        shl     ax, 2
        les     bx, dword ptr [bp + 0ah]
        add     bx, ax
        push    word ptr es:[bx + 2]
        push    word ptr es:[bx]
        push    cs
        call    fn_bab60
        add     sp, 4
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        callf   SEG_E7F0:far_e821c
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    cs
        call    fn_baeca
        add     sp, 4
        mov     si, ax
        callf   SEG_E7F0:far_e8248
        or      si, si
        jg      br_bb1a1
        mov     ax, 0ffffh
        pop     si
        leave
        retf
br_bb1a1:
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    si
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    cs
        call    fn_bb0c5
        add     sp, 0eh
        pop     si
        leave
        retf
fn_bb1be:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp + 0eh]
        callf   SEG_B1AA:far_b1af9
br_bb1ca:
        callf   SEG_B1AA:far_b1aac
        push    ds
        push    word STR_3D2F
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    ds
        push    word STR_3D3A
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    ds
        push    word STR_3D61
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        push    ds
        push    word STR_3D7F
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3D96
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    2
        callf   SEG_EBCC:far_ebda4
        add     sp, 2
        mov     dx, ax
        cmp     dx, 78h
        jz      br_bb239
        mov     ax, 0ffffh
        pop     si
        pop     bp
        retf
br_bb239:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        push    20h
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    ds
        push    word STR_3DA8
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        push    si
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    cs
        call    fn_bb14b
        add     sp, 0ah
        mov     dx, ax
        cmp     ax, 0ffffh
        jnz     br_bb28d
        jmp     near br_bb1ca
br_bb28d:
        pop     si
        pop     bp
        retf
fn_bb290:
        push    bp
        mov     bp, sp
        sub     sp, 0d8h
        elseif  FW_VERSION = 311
        sub     sp, 4
        push    si
        push    di
        les     di, dword ptr [bp + 6]
        push    es
        mov     es, word ptr [bp + 0ch]
        push    di
        mov     di, word ptr [bp + 0ah]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, word ptr [bp + 0ch]
        mov     si, word ptr [bp + 0ah]
        pop     di
        pop     es
        push    ds
        mov     ds, ax
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        les     di, dword ptr [bp + 6]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        dec     cx
        dec     cx
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        add     dx, cx
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        les     bx, dword ptr [bp - 4]
        cmp     byte ptr es:[bx], 4ch
        jnz     br_bb05e
        mov     al, 52h
        jmp     br_bb060
br_bb05e:
        mov     al, 4ch
br_bb060:
        les     bx, dword ptr [bp - 4]
        mov     byte ptr es:[bx], al
        pop     di
        pop     si
        leave
        retf
fn_bb06a:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    di
        les     di, dword ptr [bp + 6]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        dec     cx
        mov     bx, cx
        cmp     bx, 2
        jle     br_bb0c0
        mov     ax, bx
        mov     dx, word ptr [bp + 8]
        add     ax, word ptr [bp + 6]
        add     ax, 0fffeh
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        les     bx, dword ptr [bp - 4]
        inc     word ptr [bp - 4]
        cmp     byte ptr es:[bx], 2dh
        jnz     br_bb0c0
        les     bx, dword ptr [bp - 4]
        cmp     byte ptr es:[bx], 4ch
        jnz     br_bb0b1
        mov     ax, 1
        pop     di
        leave
        retf
br_bb0b1:
        les     bx, dword ptr [bp - 4]
        cmp     byte ptr es:[bx], 52h
        jnz     br_bb0c0
        mov     ax, 2
        pop     di
        leave
        retf
br_bb0c0:
        xor     ax, ax
        pop     di
        leave
        retf
fn_bb0c5:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    si
        push    di
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        mov     word ptr [bp - 6], 0
        jmp     br_bb13c
loop_bb0e0:
        les     bx, dword ptr [bp - 4]
        les     di, dword ptr es:[bx]
        mov     ax, word ptr [bp + 0eh]
        mov     si, word ptr [bp + 0ch]
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        mov     ax, ds
        pop     ds
        push    ax
        xor     ax, ax
        repe cmpsb
        pop     ds
        jz      br_bb108
        sbb     ax, ax
        sbb     ax, 0ffffh
br_bb108:
        or      ax, ax
        jnz     br_bb135
        les     bx, dword ptr [bp - 4]
        push    word ptr es:[bx + 2]
        push    word ptr es:[bx]
        push    cs
        call    fn_bab60
        add     sp, 4
        cmp     dx, word ptr [bp + 12h]
        jnz     br_bb12e
        cmp     ax, word ptr [bp + 10h]
        jnz     br_bb12e
        mov     ax, word ptr [bp - 6]
        pop     di
        pop     si
        leave
        retf
br_bb12e:
        mov     ax, 0ffffh
        pop     di
        pop     si
        leave
        retf
br_bb135:
        inc     word ptr [bp - 6]
        add     word ptr [bp - 4], 4
br_bb13c:
        mov     ax, word ptr [bp - 6]
        cmp     ax, word ptr [bp + 0ah]
        jl      loop_bb0e0
        mov     ax, 0ffffh
        pop     di
        pop     si
        leave
        retf
fn_bb14b:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        cmp     byte ptr [B_7AC3], 0
        jz      br_bb15f
        mov     ax, 0ffffh
        pop     si
        leave
        retf
br_bb15f:
        mov     ax, word ptr [bp + 0eh]
        shl     ax, 2
        les     bx, dword ptr [bp + 0ah]
        add     bx, ax
        push    word ptr es:[bx + 2]
        push    word ptr es:[bx]
        push    cs
        call    fn_bab60
        add     sp, 4
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        callf   SEG_E7F0:far_e821c
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    cs
        call    fn_baeca
        add     sp, 4
        mov     si, ax
        callf   SEG_E7F0:far_e8248
        or      si, si
        jg      br_bb1a1
        mov     ax, 0ffffh
        pop     si
        leave
        retf
br_bb1a1:
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    si
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    cs
        call    fn_bb0c5
        add     sp, 0eh
        pop     si
        leave
        retf
fn_bb1be:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp + 0eh]
        callf   SEG_B1AA:far_b1af9
br_bb1ca:
        callf   SEG_B1AA:far_b1aac
        push    ds
        push    word STR_3D2F
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    ds
        push    word STR_3D3A
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    ds
        push    word STR_3D61
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        push    ds
        push    word STR_3D7F
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3D96
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    2
        callf   SEG_EBCC:far_ebda4
        add     sp, 2
        mov     dx, ax
        cmp     dx, 78h
        jz      br_bb239
        mov     ax, 0ffffh
        pop     si
        pop     bp
        retf
br_bb239:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        push    20h
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    ds
        push    word STR_3DA8
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        push    si
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    cs
        call    fn_bb14b
        add     sp, 0ah
        mov     dx, ax
        cmp     ax, 0ffffh
        jnz     br_bb28d
        jmp     near br_bb1ca
br_bb28d:
        pop     si
        pop     bp
        retf
fn_bb290:
        push    bp
        mov     bp, sp
        sub     sp, 0d8h
        else
        sub     sp, 4d4h
        endif
        push    si
        push    di
        les     bx, dword ptr [bp + 6]
        mov     ax, word ptr es:[bx + 14h]
        mov     word ptr [bp - 6], ax
        if      FW_VERSION < 311
        mov     word ptr [bp - 8], 0
        mov     word ptr [bp - 0ah], 0
        endif
        mov     word ptr [bp - 0ch], 0
        mov     word ptr [bp - 0eh], 0
        mov     word ptr [bp - 10h], 0
        mov     word ptr [bp - 12h], 0
        if      FW_VERSION >= 311
        mov     word ptr [bp - 2], 1
        cmp     byte ptr [B_7AC3], 0
        jnz     br_bb2e3
        mov     word ptr [bp - 8], 0
        mov     word ptr [bp - 0ah], 400h
        else
        mov     si, 1
        endif
        callf   SEG_E7F0:far_e821c
        callf   SEG_E7F0:far_e8311
        if      FW_VERSION >= 311
        mov     si, ax
        else
        mov     word ptr [bp - 4], ax
        endif
        callf   SEG_E7F0:far_e8278
        if      FW_VERSION >= 311
        mov     word ptr [bp - 4], ax
        jmp     br_bb307
br_bb2e3:
        mov     word ptr [bp - 8], 0
        mov     word ptr [bp - 0ah], 2000h
        xor     si, si
        cmp     byte ptr [B_7ACA], 2
        jz      br_bb2fd
        cmp     byte ptr [B_7ACA], 3
        jnz     br_bb301
br_bb2fd:
        xor     ax, ax
        jmp     br_bb304
br_bb301:
        mov     ax, 0fffeh
br_bb304:
        mov     word ptr [bp - 4], ax
br_bb307:
        else
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jg      L_c4d6a
        jmp     br_bb4d8
L_c4d6a:
        endif
        cmp     word ptr [bp - 4], 0
        if      FW_VERSION >= 311
        jge     br_bb310
        else
        jz      L_c4d78
        mov     word ptr [bp - 2], 0fffdh
        endif
        jmp     br_bb4d8
        if      FW_VERSION >= 311
br_bb310:
        or      si, si
        jz      br_bb31c
        mov     word ptr [bp - 4], 0fffdh
        jmp     br_bb4d8
br_bb31c:
        mov     ax, 40h
        mov     di, 24dh
        mov     dx, word ptr [W_E587]
        mov     si, word ptr [W_E585]
        mov     cx, 1e7bh
        mov     es, ax
        push    ds
        mov     ds, dx
        rep movsw
        pop     ds
        mov     word ptr [W_E587], 40h
        mov     word ptr [W_E585], 24dh
        else
L_c4d78:
        endif
        push    word ptr [bp - 6]
        if      FW_VERSION >= 311
        push    word ptr [bp - 8]
        push    word ptr [bp - 0ah]
        push    word SEG_A28F
        push    word 0
        push    cs
        call    fn_baa4d
        else
        push    0
        push    word 400h
        push    ss
        lea     ax, [bp - 414h]
        push    ax
        callf   SEG_E7F0:far_e82dd
        endif
        add     sp, 0ah
        or      ax, ax
        jz      br_bb35e
        jmp     br_bb4d8
br_bb35e:
        les     bx, dword ptr [bp + 6]
        mov     cx, word ptr es:[bx + 0eh]
        push    ss
        pop     es
        if      FW_VERSION >= 311
        lea     di, [bp - 0d8h]
        mov     ax, SEG_A28F
        mov     si, 0
        else
        lea     di, [bp - 4d4h]
        mov     ax, ss
        lea     si, [bp - 414h]
        endif
        shr     cx, 1
        push    ds
        mov     ds, ax
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        if      FW_VERSION >= 311
        push    ss
        lea     ax, [bp - 0d5h]
        push    ax
        push    cs
        call    fn_babfb
        add     sp, 4
        mov     ax, ss
        lea     si, [bp - 0d5h]
        les     di, dword ptr [bp + 6]
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        mov     ax, ds
        pop     ds
        push    ax
        xor     ax, ax
        repe cmpsb
        pop     ds
        jz      br_bb3af
        sbb     ax, ax
        sbb     ax, 0ffffh
br_bb3af:
        or      ax, ax
        jz      br_bb3ba
        mov     ax, 0fffdh
        pop     di
        pop     si
        leave
        retf
br_bb3ba:
        mov     ax, word ptr [bp - 0bch]
        mov     dx, word ptr [bp - 0beh]
        mov     word ptr [bp - 0ch], ax
        mov     word ptr [bp - 0eh], dx
        else
        mov     ax, word ptr [bp - 4b8h]
        mov     dx, word ptr [bp - 4bah]
        mov     word ptr [bp - 8], ax
        mov     word ptr [bp - 0ah], dx
        endif
        push    0
        push    2
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp + 6]
        mov     ax, word ptr [bp - 8]
        mov     dx, word ptr [bp - 0ah]
        sub     dx, word ptr es:[bx + 0eh]
        sbb     ax, 0
        push    ax
        push    dx
        else
        mov     es, word ptr [bp + 8]
        mov     ax, word ptr es:[bx + 0eh]
        cwd
        xor     bx, bx
        mov     cx, 400h
        sub     cx, ax
        sbb     bx, dx
        push    bx
        push    cx
        endif
        callf   0f800h:far_fa0fe
        if      FW_VERSION >= 311
        mov     word ptr [bp - 10h], dx
        mov     word ptr [bp - 12h], ax
        else
        mov     word ptr [bp - 0ch], dx
        mov     word ptr [bp - 0eh], ax
        endif
        les     bx, dword ptr [bp + 6]
        mov     ax, word ptr es:[bx + 0eh]
        if      FW_VERSION >= 311
        add     ax, 0
        mov     word ptr [bp - 14h], SEG_A28F
        mov     word ptr [bp - 16h], ax
        mov     word ptr [bp - 2], 0
        jmp     br_bb4d8
        else
        lea     dx, [bp - 414h]
        add     ax, dx
        mov     word ptr [bp - 10h], ss
        mov     word ptr [bp - 12h], ax
        xor     si, si
        jmp     near br_bb4d8
        endif
br_bb403:
        if      FW_VERSION >= 311
        cmp     word ptr [bp - 2], 0
        else
        or      si, si
        endif
        jz      br_bb42e
        callf   SEG_E7F0:far_e8248
        if      FW_VERSION >= 311
        push    1
        endif
        push    0
        if      FW_VERSION >= 311
        push    word ptr [bp + 0ah]
        else
        push    word ptr [bp + 0eh]
        endif
        callf   SEG_CC84:far_cd353
        if      FW_VERSION >= 311
        add     sp, 6
        push    word ptr [bp - 4]
        else
        add     sp, 4
        push    word ptr [bp - 2]
        endif
        push    cs
        call    fn_bafcb
        add     sp, 2
        mov     ax, 1
        pop     di
        pop     si
        leave
        retf
br_bb42e:
        if      FW_VERSION < 311
        mov     ax, word ptr [bp - 8]
        mov     dx, word ptr [bp - 0ah]
        cmp     ax, word ptr [bp - 0ch]
        jg      br_bb44c
        jl      br_bb440
        cmp     dx, word ptr [bp - 0eh]
        jnc     br_bb44c
br_bb440:
        mov     ax, word ptr [bp - 8]
        mov     dx, word ptr [bp - 0ah]
        mov     word ptr [bp - 0ch], ax
        mov     word ptr [bp - 0eh], dx
br_bb44c:
        push    0
        push    word ptr [bp - 0ch]
        push    word ptr [bp - 0eh]
        push    word ptr [bp + 12h]
        push    word ptr [bp + 10h]
        push    word ptr [bp - 10h]
        push    word ptr [bp - 12h]
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        endif
        mov     ax, word ptr [bp - 0ch]
        mov     dx, word ptr [bp - 0eh]
        if      FW_VERSION >= 311
        cmp     ax, word ptr [bp - 10h]
        jg      br_bb44c
        jl      br_bb440
        cmp     dx, word ptr [bp - 12h]
        jnc     br_bb44c
br_bb440:
        mov     ax, word ptr [bp - 0ch]
        mov     dx, word ptr [bp - 0eh]
        mov     word ptr [bp - 10h], ax
        mov     word ptr [bp - 12h], dx
br_bb44c:
        push    0
        push    word ptr [bp - 10h]
        push    word ptr [bp - 12h]
        push    word ptr [bp + 0eh]
        push    word ptr [bp + 0ch]
        push    word ptr [bp - 14h]
        push    word ptr [bp - 16h]
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        mov     ax, word ptr [bp - 10h]
        mov     dx, word ptr [bp - 12h]
        add     word ptr [bp + 0ch], dx
        adc     word ptr [bp + 0eh], ax
        sub     word ptr [bp - 0eh], dx
        sbb     word ptr [bp - 0ch], ax
        mov     ax, word ptr [bp - 0eh]
        or      ax, word ptr [bp - 0ch]
        else
        add     word ptr [bp + 10h], dx
        adc     word ptr [bp + 12h], ax
        sub     word ptr [bp - 0ah], dx
        sbb     word ptr [bp - 8], ax
        mov     ax, word ptr [bp - 0ah]
        or      ax, word ptr [bp - 8]
        endif
        jz      br_bb4d8
        mov     ax, word ptr [bp - 6]
        shl     ax, 1
        if      FW_VERSION >= 311
        les     bx, dword ptr [W_E585]
        else
        les     bx, dword ptr [bp + 0ah]
        endif
        add     bx, ax
        mov     ax, word ptr es:[bx]
        mov     word ptr [bp - 6], ax
        cmp     word ptr [bp - 6], 8000h
        jnz     br_bb49f
        if      FW_VERSION >= 311
        mov     word ptr [bp - 2], 1
        else
        mov     si, 1
        endif
br_bb49f:
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 8]
        mov     dx, word ptr [bp - 0ah]
        shr     ax, 1
        rcr     dx, 1
        mov     word ptr [bp - 10h], ax
        mov     word ptr [bp - 12h], dx
        mov     word ptr [bp - 14h], SEG_A28F
        mov     word ptr [bp - 16h], 0
        else
        mov     word ptr [bp - 0ch], 0
        mov     word ptr [bp - 0eh], 200h
        lea     ax, [bp - 414h]
        mov     word ptr [bp - 10h], ss
        mov     word ptr [bp - 12h], ax
        endif
        push    word ptr [bp - 6]
        if      FW_VERSION >= 311
        push    word ptr [bp - 8]
        push    word ptr [bp - 0ah]
        push    word SEG_A28F
        push    word 0
        push    cs
        call    fn_baa4d
        else
        push    0
        push    word 400h
        push    word ptr [bp - 10h]
        push    ax
        callf   SEG_E7F0:far_e82dd
        endif
        add     sp, 0ah
        or      ax, ax
        jz      br_bb4d8
        if      FW_VERSION >= 311
        mov     word ptr [bp - 2], 1
        else
        mov     si, 1
        endif
br_bb4d8:
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 0eh]
        or      ax, word ptr [bp - 0ch]
        else
        mov     ax, word ptr [bp - 0ah]
        or      ax, word ptr [bp - 8]
        endif
        jz      br_bb4e3
        jmp     br_bb403
br_bb4e3:
        if      FW_VERSION >= 311
        cmp     word ptr [bp - 2], 0
        else
        or      si, si
        endif
        jz      br_bb4ec
        jmp     br_bb403
br_bb4ec:
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp + 0ah]
        else
        mov     ax, word ptr [bp + 0eh]
        endif
        mov     dx, 24h
        imul    dx
        if      FW_VERSION >= 311
        mov     word ptr [bp - 18h], ax
        else
        mov     word ptr [bp - 14h], ax
        endif
        mov     dx, SEG_A28F
        if      FW_VERSION >= 311
        mov     bx, word ptr [bp - 0b8h]
        mov     cx, word ptr [bp - 0bah]
        else
        mov     bx, word ptr [bp - 4b4h]
        mov     cx, word ptr [bp - 4b6h]
        endif
        mov     es, dx
        xchg    bx, ax
        mov     word ptr es:[bx + 4816h], ax
        mov     word ptr es:[bx + 4814h], cx
        if      FW_VERSION >= 311
        mov     bx, word ptr [bp - 18h]
        else
        mov     bx, word ptr [bp - 14h]
        endif
        mov     ax, SEG_A28F
        if      FW_VERSION >= 311
        mov     dx, word ptr [bp - 0b4h]
        mov     cx, word ptr [bp - 0b6h]
        else
        mov     dx, word ptr [bp - 4b0h]
        mov     cx, word ptr [bp - 4b2h]
        endif
        mov     es, ax
        mov     word ptr es:[bx + 481ah], dx
        mov     word ptr es:[bx + 4818h], cx
        if      FW_VERSION >= 311
        mov     cx, word ptr [bp - 0c4h]
        cmp     word ptr [bp - 0c4h], 0
        else
        mov     cx, word ptr [bp - 4c0h]
        cmp     word ptr [bp - 4c0h], 0
        endif
        jge     br_bb539
        sub     cx, 0dh
        jmp     br_bb53c
br_bb539:
        add     cx, 0dh
br_bb53c:
        push    0
        push    word 100h
        mov     ax, cx
        cwd
        push    ax
        push    dx
        xor     dx, dx
        mov     ax, 0ah
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        mov     cx, ax
        cmp     cx, 78h
        jle     br_bb563
        mov     cx, 78h
br_bb563:
        cmp     cx, 0ff88h
        jge     br_bb56b
        mov     cx, 0ff88h
br_bb56b:
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp + 0ah]
        else
        mov     ax, word ptr [bp + 0eh]
        endif
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     byte ptr es:[bx + 4812h], cl
        if      FW_VERSION >= 311
        cmp     byte ptr [B_7AC3], 0
        jnz     br_bb58b
        endif
        callf   SEG_E7F0:far_e8248
br_bb58b:
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
fn_bb591:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 58h
        else
        sub     sp, 0cb2h
        endif
        push    si
        push    di
        if      FW_VERSION >= 311
        mov     dx, word ptr [bp + 0ch]
        lea     ax, [bp - 3ch]
        push    ss
        push    ax
        mov     ax, word ptr [bp + 0ah]
        shl     ax, 2
        les     bx, dword ptr [bp + 6]
        add     bx, ax
        push    word ptr es:[bx + 2]
        push    word ptr es:[bx]
        mov     cx, 18h
        callf   0f800h:far_fa0df
        cmp     word ptr [bp + 0eh], 0
        jz      br_bb5c8
        mov     word ptr [bp - 0ch], 1
        jmp     br_bb5f7
br_bb5c8:
        cmp     dx, 0ffffh
        jz      br_bb5f2
        lea     ax, [bp - 24h]
        push    ss
        push    ax
        mov     ax, dx
        shl     ax, 2
        les     bx, dword ptr [bp + 6]
        add     bx, ax
        push    word ptr es:[bx + 2]
        push    word ptr es:[bx]
        mov     cx, 18h
        callf   0f800h:far_fa0df
        mov     word ptr [bp - 0ch], 1
        jmp     br_bb5f7
br_bb5f2:
        mov     word ptr [bp - 0ch], 0
br_bb5f7:
        endif
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION >= 311
        push    ss
        lea     ax, [bp - 3ch]
        push    ax
        else
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        endif
        push    ds
        push    word A_3DBC
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        if      FW_VERSION >= 311
        push    ss
        pop     es
        lea     di, [bp - 3ch]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        dec     cx
        mov     ax, 20h
        sub     ax, cx
        mov     si, ax
        jmp     br_bb636
loop_bb62c:
        push    20h
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
br_bb636:
        mov     ax, si
        dec     si
        or      ax, ax
        jnz     loop_bb62c
        endif
        push    0
        push    2
        if      FW_VERSION >= 311
        push    ss
        lea     ax, [bp - 3ch]
        push    ax
        else
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        endif
        push    cs
        call    fn_bab60
        add     sp, 4
        if      FW_VERSION >= 311
        sub     ax, word ptr [bp - 2eh]
        sbb     dx, 0
        else
        les     bx, dword ptr [bp + 6]
        push    ax
        mov     ax, word ptr es:[bx + 0eh]
        endif
        push    dx
        if      FW_VERSION >= 311
        push    ax
        else
        cwd
        pop     bx
        pop     cx
        sub     cx, ax
        sbb     bx, dx
        push    bx
        push    cx
        endif
        callf   0f800h:far_fa0fe
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        callf   SEG_CC84:far_cca70
        cmp     dx, word ptr [bp - 6]
        jg      br_bb682
        jl      br_bb671
        cmp     ax, word ptr [bp - 8]
        jnc     br_bb682
br_bb671:
        push    2
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     ax, 2
        pop     di
        pop     si
        leave
        retf
br_bb682:
        if      FW_VERSION >= 311
        mov     ax, ss
        lea     si, [bp - 4ah]
        endif
        push    ss
        pop     es
        if      FW_VERSION >= 311
        lea     di, [bp - 3ch]
        push    ax
        else
        lea     di, [bp - 0cb2h]
        push    es
        mov     es, word ptr [bp + 8]
        push    di
        mov     di, word ptr [bp + 6]
        endif
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        if      FW_VERSION >= 311
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        else
        mov     ax, word ptr [bp + 8]
        mov     si, word ptr [bp + 6]
        pop     di
        pop     es
        push    ds
        endif
        mov     ds, ax
        if      FW_VERSION >= 311
        mov     es, bx
        endif
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        if      FW_VERSION < 311
        mov     ax, word ptr [bp + 0ah]
        or      ax, word ptr [bp + 0ch]
        jz      L_c5021
        mov     ax, 1
        jmp     L_c5023
L_c5021:
        xor     ax, ax
L_c5023:
        mov     word ptr [bp - 0ch], ax
        endif
        cmp     word ptr [bp - 0ch], 0
        jz      br_bb6db
        push    ss
        pop     es
        if      FW_VERSION >= 311
        lea     di, [bp - 4ah]
        else
        lea     di, [bp - 0cb2h]
        endif
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        dec     cx
        sub     cx, 2
        if      FW_VERSION >= 311
        lea     ax, [bp - 4ah]
        else
        lea     ax, [bp - 0cb2h]
        endif
        add     cx, ax
        mov     bx, cx
        mov     byte ptr ss:[bx], 0
        push    ss
        push    ax
        push    cs
        call    fn_babc8
        add     sp, 4
br_bb6db:
        push    word ptr [bp - 0ch]
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 4ah]
        else
        lea     ax, [bp - 0cb2h]
        endif
        push    ax
        callf   SEG_CC84:far_cce4b
        add     sp, 0ah
        mov     word ptr [bp - 0ah], ax
        cmp     word ptr [bp - 0ah], 0
        jge     br_bb70c
        neg     ax
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     ax, 2
        pop     di
        pop     si
        leave
        retf
br_bb70c:
        if      FW_VERSION < 311
        mov     ax, word ptr [W_3C84]
        mov     si, word ptr [W_3C82]
        add     si, 600h
        push    ss
        pop     es
        lea     di, [bp - 0c8ch]
        mov     cx, 640h
        push    ds
        mov     ds, ax
        rep movsw
        pop     ds
        lea     di, [bp - 0ca4h]
        mov     ax, word ptr [bp + 0ch]
        mov     si, word ptr [bp + 0ah]
        mov     cx, 0ch
        push    ds
        mov     ds, ax
        rep movsw
        pop     ds
        endif
        mov     ax, word ptr [bp - 0ah]
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 4822h]
        mov     dx, word ptr es:[bx + 4820h]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        push    ax
        push    dx
        push    word ptr [bp - 0ah]
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 3ch]
        else
        lea     ax, [bp - 0c8ch]
        endif
        push    ax
        if      FW_VERSION < 311
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        endif
        push    cs
        if      FW_VERSION >= 311
        call    fn_bb290
        add     sp, 0ah
        else
        call    L_c4d1a
        add     sp, 0eh
        endif
        or      ax, ax
        jz      br_bb747
        mov     ax, 1
        pop     di
        pop     si
        leave
        retf
br_bb747:
        cmp     word ptr [bp - 0ch], 0
        if      FW_VERSION >= 311
        jnz     br_bb750
        jmp     br_bb823
br_bb750:
        cmp     word ptr [bp + 0eh], 0
        jz      br_bb7b5
        push    ss
        lea     ax, [bp - 3ch]
        push    ax
        push    ss
        lea     ax, [bp - 58h]
        push    ax
        push    cs
        call    fn_bb003
        add     sp, 8
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    ss
        lea     ax, [bp - 58h]
        push    ax
        push    cs
        call    fn_bb1be
        add     sp, 0ah
        mov     dx, ax
        or      dx, dx
        jge     br_bb797
        push    1
        push    0
        push    word ptr [bp - 0ah]
        callf   SEG_CC84:far_cd353
        add     sp, 6
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_bb797:
        lea     ax, [bp - 24h]
        push    ss
        push    ax
        mov     ax, dx
        shl     ax, 2
        les     bx, dword ptr [bp + 6]
        add     bx, ax
        push    word ptr es:[bx + 2]
        push    word ptr es:[bx]
        mov     cx, 18h
        callf   0f800h:far_fa0df
br_bb7b5:
        else
        jz      br_bb823
        endif
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION >= 311
        push    ss
        lea     ax, [bp - 24h]
        push    ax
        else
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        endif
        push    ds
        push    word A_3DBC
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        if      FW_VERSION >= 311
        push    ss
        pop     es
        lea     di, [bp - 24h]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        dec     cx
        mov     ax, 20h
        sub     ax, cx
        mov     si, ax
        jmp     br_bb7f4
loop_bb7ea:
        push    20h
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
br_bb7f4:
        mov     ax, si
        dec     si
        or      ax, ax
        jnz     loop_bb7ea
        endif
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        add     dx, word ptr [bp - 8]
        adc     ax, word ptr [bp - 6]
        push    ax
        push    dx
        push    word ptr [bp - 0ah]
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 24h]
        else
        lea     ax, [bp - 0c8ch]
        push    ax
        push    ss
        lea     ax, [bp - 0ca4h]
        endif
        push    ax
        push    cs
        if      FW_VERSION >= 311
        call    fn_bb290
        add     sp, 0ah
        else
        call    L_c4d1a
        add     sp, 0eh
        endif
        or      ax, ax
        jz      br_bb823
        mov     ax, 1
        pop     di
        pop     si
        leave
        retf
br_bb823:
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
fn_bb829:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 16h
        mov     cx, word ptr [bp + 0ch]
        mov     ax, cx
        else
        sub     sp, 8
        push    si
        push    di
        mov     ax, word ptr [bp + 0ah]
        endif
        shl     ax, 2
        les     bx, dword ptr [bp + 6]
        add     bx, ax
        mov     ax, word ptr es:[bx + 2]
        mov     dx, word ptr es:[bx]
        if      FW_VERSION >= 311
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        else
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        les     di, dword ptr [bp - 8]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        dec     cx
        dec     cx
        mov     word ptr [bp - 4], cx
        cmp     word ptr [bp - 4], 2
        jge     L_c518c
        mov     ax, 0ffffh
        pop     di
        pop     si
        leave
        retf
L_c518c:
        mov     bx, word ptr [bp - 4]
        mov     es, word ptr [bp - 6]
        add     bx, word ptr [bp - 8]
        cmp     byte ptr es:[bx - 1], 2dh
        jz      L_c51a3
        mov     ax, 0ffffh
        pop     di
        pop     si
        leave
        retf
L_c51a3:
        les     bx, dword ptr [bp - 8]
        add     bx, word ptr [bp - 4]
        mov     al, byte ptr es:[bx]
        cbw
        mov     bx, ax
        cmp     bx, 4ch
        jz      L_c51c0
        cmp     bx, 52h
        jz      L_c51c0
        mov     ax, 0ffffh
        pop     di
        pop     si
        leave
        retf
L_c51c0:
        mov     word ptr [bp - 2], 0
        mov     dx, word ptr [bp + 6]
        jmp     L_c5232
br_bb8af:
        mov     ax, word ptr [bp - 2]
        cmp     ax, word ptr [bp + 0ah]
        jz      br_bb86e
        mov     es, word ptr [bp + 8]
        mov     bx, dx
        les     di, dword ptr es:[bx]
        mov     ax, word ptr [bp - 6]
        mov     si, word ptr [bp - 8]
        endif
        push    ax
        if      FW_VERSION >= 311
        push    dx
        push    cs
        call    fn_bab60
        add     sp, 4
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    cs
        call    fn_bb06a
        add     sp, 4
        else
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        mov     ax, word ptr [bp - 4]
        cmp     ax, cx
        jnc     L_c51f6
        mov     cx, word ptr [bp - 4]
L_c51f6:
        mov     ax, ds
        pop     ds
        push    ax
        xor     ax, ax
        repe cmpsb
        pop     ds
        jz      L_c5206
        sbb     ax, ax
        sbb     ax, 0ffffh
L_c5206:
        endif
        or      ax, ax
        jnz     br_bb86e
        if      FW_VERSION >= 311
        mov     ax, 0ffffh
        else
        mov     es, word ptr [bp + 8]
        mov     bx, dx
        les     bx, dword ptr es:[bx]
        add     bx, word ptr [bp - 4]
        mov     al, byte ptr es:[bx]
        cbw
        mov     bx, ax
        cmp     bx, 4ch
        jz      L_c5225
        cmp     bx, 52h
        jnz     br_bb86e
L_c5225:
        mov     ax, word ptr [bp - 2]
        pop     di
        pop     si
        endif
        leave
        retf
br_bb86e:
        if      FW_VERSION >= 311
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        push    cs
        call    fn_bb003
        add     sp, 8
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    cs
        call    fn_bb0c5
        add     sp, 0eh
        mov     dx, ax
        or      dx, dx
        jl      br_bb8a3
        else
        add     dx, 4
        inc     word ptr [bp - 2]
L_c5232:
        mov     es, word ptr [bp + 8]
        mov     bx, dx
        mov     ax, word ptr es:[bx]
        or      ax, word ptr es:[bx + 2]
        jnz     br_bb8af
        mov     ax, 0ffffh
        pop     di
        pop     si
        endif
        leave
        retf
        if      FW_VERSION >= 311
br_bb8a3:
        cmp     byte ptr [B_7AC3], 0
        jnz     br_bb8af
        mov     ax, 0fffeh
        jmp     br_bb8b2
br_bb8af:
        mov     ax, 0ffffh
br_bb8b2:
        leave
        retf
fn_bb8b4:
        else
L_c5247:
        endif
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 2
        else
        sub     sp, 6
        push    di
        endif
        les     bx, dword ptr [bp + 0ah]
        mov     ax, word ptr es:[bx]
        shl     ax, 2
        les     bx, dword ptr [bp + 6]
        add     bx, ax
        if      FW_VERSION >= 311
        push    word ptr es:[bx + 2]
        push    word ptr es:[bx]
        push    cs
        call    fn_bb06a
        add     sp, 4
        cmp     ax, 2
        jnz     br_bb8f9
        else
        les     di, dword ptr es:[bx]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        dec     cx
        mov     word ptr [bp - 4], cx
        endif
        les     bx, dword ptr [bp + 0ah]
        mov     ax, word ptr es:[bx]
        if      FW_VERSION < 311
        mov     word ptr [bp - 6], ax
        shl     ax, 2
        les     bx, dword ptr [bp + 6]
        add     bx, ax
        mov     ax, word ptr es:[bx + 2]
        mov     dx, word ptr [bp - 4]
        add     dx, word ptr es:[bx]
        mov     bx, dx
        mov     es, ax
        cmp     byte ptr es:[bx - 1], 52h
        jnz     L_c52ad
        mov     ax, word ptr [bp - 6]
        endif
        mov     word ptr [bp - 2], ax
        les     bx, dword ptr [bp + 0eh]
        mov     ax, word ptr es:[bx]
        les     bx, dword ptr [bp + 0ah]
        mov     word ptr es:[bx], ax
        les     bx, dword ptr [bp + 0eh]
        mov     ax, word ptr [bp - 2]
        mov     word ptr es:[bx], ax
        if      FW_VERSION >= 311
br_bb8f9:
        else
L_c52ad:
        pop     di
        endif
        leave
        retf
        if      FW_VERSION >= 311
fn_bb8fb:
        else
L_c52b0:
        endif
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 12h
        endif
        push    si
        if      FW_VERSION >= 311
        mov     si, word ptr [bp + 0ch]
        else
        mov     si, word ptr [bp + 0ah]
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    si
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    cs
        call    fn_bb829
        add     sp, 6
        mov     si, ax
        or      ax, ax
        jge     L_c5320
        push    ds
        push    word STR_394C_V308
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_396C_V308
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        jmp     br_bb9de
L_c5320:
        endif
        mov     ax, si
        shl     ax, 2
        les     bx, dword ptr [bp + 6]
        add     bx, ax
        if      FW_VERSION >= 311
        mov     ax, word ptr es:[bx + 2]
        mov     dx, word ptr es:[bx]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    si
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    cs
        call    fn_bb829
        add     sp, 8
        mov     si, ax
        cmp     ax, 0ffffh
        jnz     br_bb972
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        else
        push    word ptr es:[bx + 2]
        push    word ptr es:[bx]
        endif
        push    ds
        if      FW_VERSION >= 312
        push    word STR_3DCA
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    word ptr [bp + 10h]
        push    word ptr [bp + 0eh]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_bb9de
br_bb972:
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        push    cs
        call    fn_bb003
        add     sp, 8
        or      si, si
        jle     br_bb99b
        mov     ax, si
        shl     ax, 2
        les     bx, dword ptr [bp + 6]
        add     bx, ax
        mov     dx, word ptr es:[bx + 2]
        mov     ax, word ptr es:[bx]
        jmp     br_bb9a0
br_bb99b:
        mov     dx, ss
        lea     ax, [bp - 12h]
br_bb9a0:
        push    dx
        push    ax
        push    ds
        push    word STR_3DDF
        elseif  FW_VERSION = 311
        push    word STR_3DCA
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    word ptr [bp + 10h]
        push    word ptr [bp + 0eh]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_bb9de
br_bb972:
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        push    cs
        call    fn_bb003
        add     sp, 8
        or      si, si
        jle     br_bb99b
        mov     ax, si
        shl     ax, 2
        les     bx, dword ptr [bp + 6]
        add     bx, ax
        mov     dx, word ptr es:[bx + 2]
        mov     ax, word ptr es:[bx]
        jmp     br_bb9a0
br_bb99b:
        mov     dx, ss
        lea     ax, [bp - 12h]
br_bb9a0:
        push    dx
        push    ax
        push    ds
        push    word STR_3DDF
        else
        push    word STR_3973_V308
        endif
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0
        if      FW_VERSION >= 311
        push    7
        else
        push    5
        endif
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word STR_3DFC
        elseif  FW_VERSION = 311
        push    word STR_3DFC
        else
        push    word STR_3991_V308
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        if      FW_VERSION >= 311
        push    word ptr [bp + 10h]
        push    word ptr [bp + 0eh]
        else
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_3998_V308
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_bb9de:
        mov     ax, si
        pop     si
        if      FW_VERSION >= 311
        leave
        else
        pop     bp
        endif
        retf
far_bb9e3:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 81ah
        else
        sub     sp, 806h
        endif
        push    si
        push    di
        if      FW_VERSION >= 311
        mov     word ptr [bp - 0ch], 0
        mov     word ptr [bp - 0eh], 1
        else
        mov     word ptr [bp - 8], 0
        mov     word ptr [bp - 0ah], 1
        endif
        xor     si, si
        xor     di, di
        if      FW_VERSION >= 311
        mov     word ptr [bp - 10h], 0
        mov     byte ptr [B_7AC1], 1
        endif
        jmp     tgt_bbd7e
br_bba07:
        push    ds
        if      FW_VERSION >= 312
        push    word STR_3C92
        elseif  FW_VERSION = 311
        push    word STR_3C92
        else
        push    word STR_3C92
        endif
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_3E11
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        if      FW_VERSION >= 311
        cmp     word ptr [bp - 0eh], 0
        else
        cmp     word ptr [bp - 0ah], 0
        endif
        jz      br_bba9f
        push    0ffffh
        push    0ffffh
        push    0
        callf   SEG_CC84:far_ccbdd
        add     sp, 6
        if      FW_VERSION >= 311
        cmp     byte ptr [B_7AC3], 0
        jnz     br_bba44
        endif
        callf   SEG_E7F0:far_e821c
        if      FW_VERSION >= 311
br_bba44:
        cmp     byte ptr [B_7AC3], 0
        jz      br_bba61
        cmp     byte ptr [B_7AC1], 0
        jz      br_bba61
        mov     byte ptr [B_7ACB], 0
        callf   SEG_D546:far_d5bc3
        mov     byte ptr [B_7AC1], 0
br_bba61:
        endif
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 80ch]
        else
        lea     ax, [bp - 806h]
        endif
        push    ax
        push    cs
        call    fn_baeca
        add     sp, 4
        mov     di, ax
        if      FW_VERSION >= 311
        cmp     byte ptr [B_7AC3], 0
        jnz     br_bba7c
        endif
        callf   SEG_E7F0:far_e8248
br_bba7c:
        or      di, di
        jge     br_bba90
        push    di
        push    cs
        call    fn_bafcb
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_bba90:
        if      FW_VERSION >= 311
        mov     word ptr [bp - 0eh], 0
        cmp     word ptr [bp - 0ch], di
        jc      br_bba9f
        mov     word ptr [bp - 0ch], 0
        else
        mov     word ptr [bp - 0ah], 0
        endif
br_bba9f:
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    14h
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 80ch]
        else
        lea     ax, [bp - 806h]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 0ch]
        else
        lea     ax, [bp - 8]
        endif
        push    ax
        push    ds
        if      FW_VERSION >= 312
        push    word STR_3E21
        callf   SEG_B347:far_b353b
        elseif  FW_VERSION = 311
        push    word STR_3E21
        callf   SEG_B347:far_b353b
        else
        push    word STR_3E21
        callf   SEG_B347:far_b362e
        endif
        add     sp, 0eh
        push    1dh
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    word 400h
        if      FW_VERSION >= 311
        mov     bx, word ptr [bp - 0ch]
        else
        mov     bx, word ptr [bp - 8]
        endif
        shl     bx, 2
        if      FW_VERSION >= 311
        lea     ax, [bp - 80ch]
        else
        lea     ax, [bp - 806h]
        endif
        add     bx, ax
        push    word ptr ss:[bx + 2]
        push    word ptr ss:[bx]
        push    cs
        call    fn_bab60
        add     sp, 4
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        push    dx
        push    ax
        push    ds
        if      FW_VERSION >= 312
        push    word A_3E27
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_7AC3]
        mov     ah, 0
        shl     ax, 2
        mov     bx, ax
        push    word ptr [bx + 60eh]
        push    word ptr [bx + 60ch]
        push    ds
        push    word STR_3E31
        elseif  FW_VERSION = 311
        push    word A_3E27
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_7AC3]
        mov     ah, 0
        shl     ax, 2
        mov     bx, ax
        push    word ptr [bx + 60eh]
        push    word ptr [bx + 60ch]
        push    ds
        push    word STR_3E31
        else
        push    word STR_3E27
        endif
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        push    18h
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    word 400h
        callf   SEG_CC84:far_cca70
        shl     ax, 1
        rcl     dx, 1
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        push    dx
        push    ax
        push    ds
        push    word STR_3E39
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        if      FW_VERSION >= 312
        cmp     byte ptr [B_7AC3], 0
        jz      br_bbb98
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_7ACB]
        mov     ah, 0
        shl     ax, 2
        mov     bx, ax
        push    word ptr [bx + TBL_E58B]
        push    word ptr [bx + TBL_E589]
        push    ds
        push    word STR_3E48
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        mov     word ptr [bp - 2], ds
        mov     word ptr [bp - 4], 3e52h
        jmp     br_bbba0
br_bbb98:
        mov     word ptr [bp - 2], ds
        mov     word ptr [bp - 4], 3e67h
br_bbba0:
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    word ptr [bp - 0ch]
        push    di
        elseif  FW_VERSION = 311
        cmp     byte ptr [B_7AC3], 0
        jz      br_bbb98
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_7ACB]
        mov     ah, 0
        shl     ax, 2
        mov     bx, ax
        push    word ptr [bx + TBL_E58B]
        push    word ptr [bx + TBL_E589]
        push    ds
        push    word STR_3E48
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        mov     word ptr [bp - 2], ds
        mov     word ptr [bp - 4], 3e42h
        jmp     br_bbba0
br_bbb98:
        mov     word ptr [bp - 2], ds
        mov     word ptr [bp - 4], 3e57h
br_bbba0:
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    word ptr [bp - 0ch]
        push    di
        else
        push    word ptr [bp - 8]
        endif
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 80ch]
        else
        lea     ax, [bp - 806h]
        endif
        push    ax
        push    cs
        if      FW_VERSION >= 311
        call    fn_bb8fb
        add     sp, 0ch
        mov     word ptr [bp - 0ah], ax
        else
        call    L_c52b0
        add     sp, 6
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 2], 0
        or      di, di
        jz      L_c54a7
        mov     word ptr [bp - 2], 2
L_c54a7:
        endif
        callf   SEG_D79E:far_d7a79
        if      FW_VERSION >= 311
        mov     word ptr [bp - 6], 4
        endif
        jmp     br_bbc20
loop_bbbc6:
        push    1dh
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    word 400h
        if      FW_VERSION >= 311
        mov     bx, word ptr [bp - 0ch]
        else
        mov     bx, word ptr [bp - 8]
        endif
        shl     bx, 2
        if      FW_VERSION >= 311
        lea     ax, [bp - 80ch]
        else
        lea     ax, [bp - 806h]
        endif
        add     bx, ax
        push    word ptr ss:[bx + 2]
        push    word ptr ss:[bx]
        push    cs
        call    fn_bab60
        add     sp, 4
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        push    dx
        push    ax
        push    ds
        push    word A_3E27
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        if      FW_VERSION >= 311
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    word ptr [bp - 0ch]
        push    di
        else
        push    word ptr [bp - 8]
        endif
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 80ch]
        else
        lea     ax, [bp - 806h]
        endif
        push    ax
        push    cs
        if      FW_VERSION >= 311
        call    fn_bb8fb
        add     sp, 0ch
        mov     word ptr [bp - 0ah], ax
        else
        call    L_c52b0
        add     sp, 6
        mov     word ptr [bp - 6], ax
        endif
br_bbc20:
        if      FW_VERSION >= 311
        push    word ptr [bp - 6]
        else
        mov     al, byte ptr [bp - 2]
        push    ax
        endif
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        or      ax, ax
        jz      loop_bbbc6
        if      FW_VERSION >= 311
        mov     bx, si
        sub     bx, 75h
        cmp     bx, 5
        jbe     br_bbc3e
        jmp     tgt_bbd7e
br_bbc3e:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_bbd90]
tgt_bbc45:
        or      di, di
        jnz     br_bbc4e
        else
        cmp     ax, 78h
        jz      L_c5530
        cmp     ax, 79h
        jz      L_c5520
        jmp     near tgt_bbd7e
L_c5520:
        cmp     word ptr [bp - 6], 0ffffh
        jnz     L_c552b
        endif
        xor     si, si
        if      FW_VERSION >= 311
        jmp     tgt_bbd7e
br_bbc4e:
        cmp     word ptr [bp - 0ah], 0ffffh
        jnz     br_bbc59
        else
        jmp     near tgt_bbd7e
L_c552b:
        mov     word ptr [bp - 6], 0ffffh
L_c5530:
        endif
        xor     si, si
        if      FW_VERSION >= 311
        jmp     tgt_bbd7e
br_bbc59:
        mov     word ptr [bp - 0ah], 0ffffh
tgt_bbc5e:
        or      di, di
        jnz     br_bbc67
        xor     si, si
        jmp     tgt_bbd7e
br_bbc67:
        xor     si, si
        cmp     word ptr [bp - 0ah], 0ffffh
        jnz     br_bbc72
        jmp     near br_bbd2a
br_bbc72:
        mov     ax, word ptr [bp - 0ch]
        mov     word ptr [bp - 8], ax
        cmp     word ptr [bp - 0ah], 0fffeh
        jnz     br_bbce4
        mov     word ptr [bp - 10h], 1
        mov     bx, word ptr [bp - 0ch]
        else
        cmp     word ptr [bp - 6], 0
        jl      L_c558b
        mov     ax, word ptr [bp - 8]
        mov     word ptr [bp - 4], ax
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ss
        lea     ax, [bp - 806h]
        push    ax
        push    cs
        call    L_c5247
        add     sp, 0ch
        mov     bx, word ptr [bp - 6]
        endif
        shl     bx, 2
        if      FW_VERSION >= 311
        lea     ax, [bp - 80ch]
        else
        lea     ax, [bp - 806h]
        add     bx, ax
        push    word ptr ss:[bx + 2]
        push    word ptr ss:[bx]
        mov     bx, word ptr [bp - 4]
        shl     bx, 2
        endif
        add     bx, ax
        push    word ptr ss:[bx + 2]
        push    word ptr ss:[bx]
        push    cs
        if      FW_VERSION >= 311
        call    fn_bb06a
        add     sp, 4
        cmp     ax, 2
        jnz     br_bbcfb
        mov     bx, word ptr [bp - 0ch]
        else
        call    fn_bb591
        add     sp, 8
        cmp     ax, 1
        jnz     tgt_bbd7e
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     si, ax
        jmp     tgt_bbd7e
L_c558b:
        push    0
        push    0
        mov     bx, word ptr [bp - 8]
        endif
        shl     bx, 2
        if      FW_VERSION >= 311
        lea     ax, [bp - 80ch]
        else
        lea     ax, [bp - 806h]
        endif
        add     bx, ax
        push    word ptr ss:[bx + 2]
        push    word ptr ss:[bx]
        if      FW_VERSION >= 311
        push    ss
        lea     ax, [bp - 81ah]
        push    ax
        push    cs
        call    fn_bb003
        add     sp, 8
        push    word ptr [bp - 0ch]
        push    ss
        lea     ax, [bp - 80ch]
        push    ax
        push    ss
        lea     ax, [bp - 81ah]
        push    ax
        push    cs
        call    fn_bb1be
        add     sp, 0ah
        mov     word ptr [bp - 8], ax
        cmp     word ptr [bp - 8], 0
        jge     br_bbcfb
        jmp     near tgt_bbd7e
br_bbce4:
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    ss
        lea     ax, [bp - 80ch]
        push    ax
        push    cs
        call    fn_bb8b4
        add     sp, 0ch
br_bbcfb:
        push    word ptr [bp - 10h]
        cmp     word ptr [bp - 10h], 0
        jz      br_bbd09
        mov     ax, 0ffffh
        jmp     br_bbd0c
br_bbd09:
        mov     ax, word ptr [bp - 0ah]
br_bbd0c:
        push    ax
        push    word ptr [bp - 8]
        push    ss
        lea     ax, [bp - 80ch]
        push    ax
        endif
        push    cs
        call    fn_bb591
        if      FW_VERSION >= 311
        add     sp, 0ah
        else
        add     sp, 8
        endif
        cmp     ax, 1
        if      FW_VERSION >= 311
        jnz     br_bbd49
        else
        jnz     tgt_bbd7e
        endif
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     si, ax
        if      FW_VERSION >= 311
        jmp     br_bbd49
br_bbd2a:
        push    0
        push    0ffffh
        push    word ptr [bp - 0ch]
        push    ss
        lea     ax, [bp - 80ch]
        push    ax
        push    cs
        call    fn_bb591
        add     sp, 0ah
        cmp     ax, 1
        jnz     br_bbd49
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     si, ax
br_bbd49:
        mov     word ptr [bp - 0eh], 1
        jmp     tgt_bbd7e
tgt_bbd50:
        cmp     byte ptr [B_7AC3], 0
        jz      br_bbd69
        push    cs
        call    fn_baad2
        mov     si, ax
        mov     word ptr [bp - 0eh], 1
        mov     word ptr [bp - 0ch], 0
        jmp     tgt_bbd7e
br_bbd69:
        xor     si, si
        jmp     tgt_bbd7e
tgt_bbd6d:
        callf   SEG_B52D:far_b60ee
        mov     si, ax
        mov     word ptr [bp - 0eh], 1
        mov     word ptr [bp - 0ch], 0
        endif
tgt_bbd7e:
        or      si, si
        jnz     br_bbd85
        jmp     br_bba07
br_bbd85:
        if      FW_VERSION >= 311
        mov     byte ptr [B_7AC1], 1
        endif
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
        if      FW_VERSION >= 312
TBL_bbd90:
        dw      tgt_bbd6d
        dw      tgt_bbd7e
        dw      tgt_bbd7e
        dw      tgt_bbc5e
        dw      tgt_bbc45
        dw      tgt_bbd50
        phase   0ch
        elseif  FW_VERSION = 311
TBL_bbd90:
        dw      tgt_bbd6d
        dw      tgt_bbd7e
        dw      tgt_bbd7e
        dw      tgt_bbc5e
        dw      tgt_bbc45
        dw      tgt_bbd50
        phase   5
        else
        phase   1
        endif
far_bbd9c:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 9e6h
        else
        sub     sp, 9cah
        endif
        push    si
        push    di
        mov     byte ptr [B_D5DD], 69h
        push    ds
        push    word A_3E9C
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word STR_3EB7
        elseif  FW_VERSION = 311
        push    word STR_3EB7
        else
        push    word STR_3EB7
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    0
        if      FW_VERSION < 311
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        endif
        push    2
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 19h]
        else
        lea     ax, [bp - 17h]
        endif
        push    ax
        callf   SEG_EBCC:far_ebcce
        add     sp, 8
        mov     si, ax
        or      ax, ax
        jz      br_bbdee
        pop     di
        pop     si
        leave
        retf
br_bbdee:
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 19h]
        else
        mov     al, byte ptr [bp - 17h]
        endif
        cbw
        dec     ax
        if      FW_VERSION >= 311
        mov     word ptr [bp - 10h], ax
        else
        mov     word ptr [bp - 0eh], ax
        endif
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3F29
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_CAA9:far_caade
        add     sp, 4
        mov     word ptr [W_EFA1], ax
        or      ax, ax
        jge     br_bbe3e
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_bbe3e:
        push    2
        push    word ptr [W_EFA1]
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 12h]
        else
        lea     ax, [bp - 10h]
        endif
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     si, ax
        or      ax, ax
        jz      br_bbe68
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_bbe68:
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 12h]
        else
        mov     al, byte ptr [bp - 10h]
        endif
        cbw
        cmp     ax, word ptr [bp + 0ah]
        jnz     br_bbe77
        if      FW_VERSION >= 311
        cmp     byte ptr [bp - 11h], 1
        else
        cmp     byte ptr [bp - 0fh], 1
        endif
        jle     br_bbe89
br_bbe77:
        push    0ffe0h
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_bbe89:
        if      FW_VERSION < 311
        mov     word ptr [bp - 1ah], 0
        endif
        mov     word ptr [bp - 1ch], 0
        if      FW_VERSION >= 311
        mov     word ptr [bp - 1eh], 0
        endif
        push    3
        push    word ptr [W_EFA1]
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 1eh]
        else
        lea     ax, [bp - 1ch]
        endif
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     si, ax
        or      ax, ax
        jz      br_bbebd
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_bbebd:
        push    word 7d6h
        push    word ptr [W_EFA1]
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 826h]
        else
        lea     ax, [bp - 81ch]
        endif
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     si, ax
        or      ax, ax
        jz      br_bbee9
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_bbee9:
        mov     di, 425h
        cmp     word ptr [bp + 0ah], 5
        jnz     br_bbf1c
        push    1
        push    word ptr [W_EFA1]
        push    ds
        if      FW_VERSION >= 312
        push    word P_EFA3
        elseif  FW_VERSION = 311
        push    word P_EEEB_V311
        else
        push    word P_DFD7_V308
        endif
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     si, ax
        or      ax, ax
        jz      br_bbf1b
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_bbf1b:
        dec     di
br_bbf1c:
        push    22h
        push    word ptr [W_EFA1]
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 848h]
        else
        lea     ax, [bp - 83eh]
        endif
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     si, ax
        or      ax, ax
        jz      br_bbf47
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_bbf47:
        sub     di, 22h
        mov     word ptr [bp - 2], 1
        cmp     word ptr [bp + 0ah], 2
        jz      br_bbf5b
        if      FW_VERSION >= 311
        cmp     byte ptr [bp - 11h], 0
        else
        cmp     byte ptr [bp - 0fh], 0
        endif
        jnz     br_bbf8c
br_bbf5b:
        push    1
        push    word ptr [W_EFA1]
        push    ss
        lea     ax, [bp - 2]
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     si, ax
        or      ax, ax
        jz      br_bbf85
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_bbf85:
        cmp     word ptr [bp + 0ah], 2
        jnz     br_bbf8c
        dec     di
br_bbf8c:
        cmp     word ptr [bp - 2], 0
        jnz     br_bbf95
        jmp     br_bc0d2
br_bbf95:
        push    20h
        push    word ptr [W_EFA1]
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 954h]
        else
        lea     ax, [bp - 94ah]
        endif
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     si, ax
        or      ax, ax
        jz      br_bbfc0
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_bbfc0:
        push    20h
        push    word ptr [W_EFA1]
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 974h]
        else
        lea     ax, [bp - 96ah]
        endif
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     si, ax
        or      ax, ax
        jz      br_bbfeb
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_bbfeb:
        push    20h
        push    word ptr [W_EFA1]
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 994h]
        else
        lea     ax, [bp - 98ah]
        endif
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     si, ax
        or      ax, ax
        jz      br_bc016
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_bc016:
        push    40h
        push    word ptr [W_EFA1]
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 9d4h]
        else
        lea     ax, [bp - 9cah]
        endif
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     si, ax
        or      ax, ax
        jz      br_bc041
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_bc041:
        sub     di, 0a0h
        if      FW_VERSION >= 311
        cmp     byte ptr [bp - 11h], 0
        else
        cmp     byte ptr [bp - 0fh], 0
        endif
        jg      br_bc04e
        jmp     near br_bc0d2
br_bc04e:
        push    20h
        push    word ptr [W_EFA1]
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 8f4h]
        else
        lea     ax, [bp - 8eah]
        endif
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     si, ax
        or      ax, ax
        jz      br_bc079
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_bc079:
        push    20h
        push    word ptr [W_EFA1]
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 914h]
        else
        lea     ax, [bp - 90ah]
        endif
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     si, ax
        or      ax, ax
        jz      br_bc0a4
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_bc0a4:
        push    20h
        push    word ptr [W_EFA1]
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 934h]
        else
        lea     ax, [bp - 92ah]
        endif
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     si, ax
        or      ax, ax
        jz      br_bc0cf
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_bc0cf:
        sub     di, 60h
br_bc0d2:
        push    di
        push    word ptr [W_EFA1]
        push    word SEG_A28F
        push    word 0
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     si, ax
        or      ax, ax
        jz      br_bc0fc
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_bc0fc:
        push    word ptr [W_EFA1]
        callf   SEG_CAA9:far_cab20
        add     sp, 2
        mov     si, ax
        or      ax, ax
        jge     br_bc11f
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_bc11f:
        if      FW_VERSION >= 311
        mov     word ptr [bp - 0ch], 0
        else
        mov     word ptr [bp - 0ah], 0
        mov     word ptr [bp - 1eh], 0
        endif
        mov     word ptr [bp - 20h], 0
        if      FW_VERSION >= 311
        mov     word ptr [bp - 22h], 0
        endif
        mov     word ptr [bp - 2], 0
        if      FW_VERSION >= 311
        lea     ax, [bp - 8d4h]
        mov     word ptr [bp - 3ah], ax
        else
        lea     ax, [bp - 8cah]
        mov     word ptr [bp - 34h], ax
        endif
br_bc13a:
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        if      FW_VERSION >= 311
        lea     dx, [bp - 826h]
        else
        lea     dx, [bp - 81ch]
        endif
        add     ax, dx
        mov     bx, ax
        cmp     byte ptr ss:[bx], 0
        jnz     br_bc153
        jmp     near br_bc1fc
br_bc153:
        if      FW_VERSION >= 311
        mov     word ptr [bp - 0eh], 0
        else
        mov     word ptr [bp - 0ch], 0
        endif
        mov     word ptr [bp - 4], 0
        if      FW_VERSION >= 311
        lea     ax, [bp - 8d4h]
        mov     word ptr [bp - 38h], ax
        else
        lea     ax, [bp - 8cah]
        mov     word ptr [bp - 32h], ax
        endif
        mov     ax, word ptr [bp - 4]
        if      FW_VERSION >= 311
        cmp     ax, word ptr [bp - 0ch]
        else
        cmp     ax, word ptr [bp - 0ah]
        endif
        jge     br_bc1ba
loop_bc16c:
        mov     ax, ss
        push    ax
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        if      FW_VERSION >= 311
        lea     dx, [bp - 826h]
        else
        lea     dx, [bp - 81ch]
        endif
        add     ax, dx
        if      FW_VERSION >= 311
        mov     bx, word ptr [bp - 38h]
        else
        mov     bx, word ptr [bp - 32h]
        endif
        les     di, dword ptr ss:[bx]
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        pop     si
        mov     ax, ds
        pop     ds
        push    ax
        xor     ax, ax
        repe cmpsb
        pop     ds
        jz      br_bc1a0
        sbb     ax, ax
        sbb     ax, 0ffffh
br_bc1a0:
        or      ax, ax
        jnz     br_bc1ab
        if      FW_VERSION >= 311
        mov     word ptr [bp - 0eh], 1
        else
        mov     word ptr [bp - 0ch], 1
        endif
        jmp     br_bc1ba
br_bc1ab:
        if      FW_VERSION >= 311
        add     word ptr [bp - 38h], 4
        else
        add     word ptr [bp - 32h], 4
        endif
        inc     word ptr [bp - 4]
        mov     ax, word ptr [bp - 4]
        if      FW_VERSION >= 311
        cmp     ax, word ptr [bp - 0ch]
        else
        cmp     ax, word ptr [bp - 0ah]
        endif
        jl      loop_bc16c
br_bc1ba:
        if      FW_VERSION >= 311
        cmp     word ptr [bp - 0eh], 0
        else
        cmp     word ptr [bp - 0ch], 0
        endif
        jnz     br_bc1fc
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        if      FW_VERSION >= 311
        lea     dx, [bp - 826h]
        else
        lea     dx, [bp - 81ch]
        endif
        add     ax, dx
        if      FW_VERSION >= 311
        mov     bx, word ptr [bp - 3ah]
        else
        mov     bx, word ptr [bp - 34h]
        endif
        mov     word ptr ss:[bx + 2], ss
        mov     word ptr ss:[bx], ax
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        if      FW_VERSION >= 311
        lea     dx, [bp - 810h]
        else
        lea     dx, [bp - 806h]
        endif
        add     ax, dx
        mov     bx, ax
        mov     ax, word ptr ss:[bx + 2]
        mov     dx, word ptr ss:[bx]
        if      FW_VERSION >= 311
        add     word ptr [bp - 22h], dx
        adc     word ptr [bp - 20h], ax
        add     word ptr [bp - 3ah], 4
        inc     word ptr [bp - 0ch]
        else
        add     word ptr [bp - 20h], dx
        adc     word ptr [bp - 1eh], ax
        add     word ptr [bp - 34h], 4
        inc     word ptr [bp - 0ah]
        endif
br_bc1fc:
        inc     word ptr [bp - 2]
        cmp     word ptr [bp - 2], 22h
        jge     br_bc208
        jmp     br_bc13a
br_bc208:
        if      FW_VERSION >= 311
        mov     bx, word ptr [bp - 0ch]
        else
        mov     bx, word ptr [bp - 0ah]
        endif
        shl     bx, 2
        if      FW_VERSION >= 311
        lea     ax, [bp - 8d4h]
        else
        lea     ax, [bp - 8cah]
        endif
        add     bx, ax
        mov     word ptr ss:[bx + 2], 0
        mov     word ptr ss:[bx], 0
        if      FW_VERSION >= 311
        mov     si, 1
        jmp     br_bd18d
br_bc225:
        cmp     word ptr [bp - 10h], 1
        else
        cmp     word ptr [bp - 0eh], 1
        endif
        jz      br_bc22e
        jmp     br_bc5d9
br_bc22e:
        push    ds
        push    word STR_3F48
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        mov     byte ptr [B_D5DD], 6dh
        if      FW_VERSION >= 311
        or      si, si
        jz      br_bc260
        endif
        push    word SEG_BBD9
        if      FW_VERSION >= 312
        push    word 1486h
        elseif  FW_VERSION = 311
        push    word 146bh
        else
        push    word 1374h
        endif
        push    4
        if      FW_VERSION >= 311
        push    word ptr [bp - 0ch]
        else
        push    word ptr [bp - 0ah]
        endif
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 8d4h]
        else
        lea     ax, [bp - 8cah]
        endif
        push    ax
        callf   0f800h:far_fa6e5
        add     sp, 0ch
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 17h], 0
br_bc260:
        else
        mov     byte ptr [bp - 15h], 0
        endif
        push    10h
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 8d4h]
        else
        lea     ax, [bp - 8cah]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 17h]
        else
        lea     ax, [bp - 15h]
        endif
        push    ax
        push    ds
        push    word STR_3F69
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        mov     word ptr [bp - 2], 0
        xor     ax, ax
        mov     dx, 3bh
        imul    dx
        if      FW_VERSION >= 311
        lea     dx, [bp - 826h]
        else
        lea     dx, [bp - 81ch]
        endif
        add     ax, dx
        mov     cx, ax
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 17h]
        else
        mov     al, byte ptr [bp - 15h]
        endif
        cbw
        shl     ax, 2
        if      FW_VERSION >= 311
        lea     dx, [bp - 8d4h]
        else
        lea     dx, [bp - 8cah]
        endif
        add     ax, dx
        mov     si, ax
loop_bc29c:
        mov     ax, ss
        cmp     word ptr ss:[si + 2], ax
        jnz     br_bc2a9
        cmp     word ptr ss:[si], cx
        jz      br_bc2b5
br_bc2a9:
        add     cx, 3bh
        inc     word ptr [bp - 2]
        cmp     word ptr [bp - 2], 22h
        jl      loop_bc29c
br_bc2b5:
        mov     al, byte ptr [bp - 2]
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 18h], al
        else
        mov     byte ptr [bp - 16h], al
        endif
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        if      FW_VERSION >= 311
        lea     dx, [bp - 810h]
        else
        lea     dx, [bp - 806h]
        endif
        add     ax, dx
        mov     bx, ax
        mov     ax, word ptr ss:[bx + 2]
        mov     dx, word ptr ss:[bx]
        if      FW_VERSION >= 311
        mov     word ptr [bp - 28h], ax
        mov     word ptr [bp - 2ah], dx
        else
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        endif
        push    1dh
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    word 400h
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 28h]
        mov     dx, word ptr [bp - 2ah]
        else
        mov     ax, word ptr [bp - 26h]
        mov     dx, word ptr [bp - 28h]
        endif
        shl     dx, 1
        rcl     ax, 1
        add     dx, 3ffh
        adc     ax, 0
        push    ax
        push    dx
        callf   0f800h:far_fa0fe
        push    dx
        push    ax
        push    ds
        push    word A_3F70
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        push    18h
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    word 400h
        callf   SEG_CC84:far_cca70
        shl     ax, 1
        rcl     dx, 1
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        mov     word ptr [bp - 2], ax
        push    ax
        push    ds
        push    word A_3F7A
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION >= 311
        push    28h
        push    20h
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        endif
        push    ds
        if      FW_VERSION >= 312
        push    word STR_3F89
        elseif  FW_VERSION = 311
        push    word STR_3F89
        else
        push    word STR_3ACB_V308
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_bc44a
br_bc378:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jz      br_bc383
        jmp     near br_bc44a
br_bc383:
        mov     word ptr [bp - 2], 0
        xor     ax, ax
        mov     dx, 3bh
        imul    dx
        if      FW_VERSION >= 311
        lea     dx, [bp - 826h]
        else
        lea     dx, [bp - 81ch]
        endif
        add     ax, dx
        mov     cx, ax
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 17h]
        else
        mov     al, byte ptr [bp - 15h]
        endif
        cbw
        shl     ax, 2
        if      FW_VERSION >= 311
        lea     dx, [bp - 8d4h]
        else
        lea     dx, [bp - 8cah]
        endif
        add     ax, dx
        mov     si, ax
loop_bc3a6:
        mov     ax, ss
        cmp     word ptr ss:[si + 2], ax
        jnz     br_bc3b3
        cmp     word ptr ss:[si], cx
        jz      br_bc3bf
br_bc3b3:
        add     cx, 3bh
        inc     word ptr [bp - 2]
        cmp     word ptr [bp - 2], 22h
        jl      loop_bc3a6
br_bc3bf:
        mov     al, byte ptr [bp - 2]
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 18h], al
        else
        mov     byte ptr [bp - 16h], al
        endif
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        if      FW_VERSION >= 311
        lea     dx, [bp - 810h]
        else
        lea     dx, [bp - 806h]
        endif
        add     ax, dx
        mov     bx, ax
        mov     ax, word ptr ss:[bx + 2]
        mov     dx, word ptr ss:[bx]
        if      FW_VERSION >= 311
        mov     word ptr [bp - 28h], ax
        mov     word ptr [bp - 2ah], dx
        else
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        endif
        push    1dh
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    word 400h
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 28h]
        mov     dx, word ptr [bp - 2ah]
        else
        mov     ax, word ptr [bp - 26h]
        mov     dx, word ptr [bp - 28h]
        endif
        shl     dx, 1
        rcl     ax, 1
        add     dx, 3ffh
        adc     ax, 0
        push    ax
        push    dx
        callf   0f800h:far_fa0fe
        push    dx
        push    ax
        push    ds
        push    word A_3F70
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        push    18h
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    word 400h
        callf   SEG_CC84:far_cca70
        shl     ax, 1
        rcl     dx, 1
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        mov     word ptr [bp - 2], ax
        push    ax
        push    ds
        push    word A_3F7A
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
br_bc44a:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        or      ax, ax
        jnz     br_bc45d
        jmp     br_bc378
br_bc45d:
        push    0
        push    2
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 18h]
        else
        mov     al, byte ptr [bp - 16h]
        endif
        cbw
        mov     dx, 3bh
        imul    dx
        if      FW_VERSION >= 311
        lea     dx, [bp - 814h]
        else
        lea     dx, [bp - 80ah]
        endif
        add     ax, dx
        mov     bx, ax
        push    word ptr ss:[bx + 2]
        push    word ptr ss:[bx]
        callf   0f800h:far_fa0fe
        push    ax
        push    dx
        xor     dx, dx
        mov     ax, 3
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        add     ax, 0c00h
        adc     dx, 0
        if      FW_VERSION >= 311
        mov     word ptr [bp - 30h], dx
        mov     word ptr [bp - 32h], ax
        else
        mov     word ptr [bp - 2eh], dx
        mov     word ptr [bp - 30h], ax
        endif
        cmp     si, 78h
        jz      br_bc4a3
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
br_bc4a3:
        push    0
        if      FW_VERSION < 311
        push    word ptr [bp - 26h]
        endif
        push    word ptr [bp - 28h]
        if      FW_VERSION >= 311
        push    word ptr [bp - 2ah]
        mov     al, byte ptr [bp - 17h]
        else
        mov     al, byte ptr [bp - 15h]
        endif
        cbw
        shl     ax, 2
        if      FW_VERSION >= 311
        lea     dx, [bp - 8d4h]
        else
        lea     dx, [bp - 8cah]
        endif
        add     ax, dx
        mov     bx, ax
        push    word ptr ss:[bx + 2]
        push    word ptr ss:[bx]
        callf   SEG_CC84:far_cce4b
        add     sp, 0ah
        if      FW_VERSION >= 311
        mov     word ptr [bp - 8], ax
        cmp     word ptr [bp - 8], 0
        else
        mov     word ptr [bp - 6], ax
        cmp     word ptr [bp - 6], 0
        endif
        jge     br_bc4ee
        neg     ax
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        if      FW_VERSION >= 311
        cmp     word ptr [bp - 8], 0ffffh
        jnz     br_bc4e6
        jmp     br_bd18b
br_bc4e6:
        endif
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_bc4ee:
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 8]
        else
        mov     ax, word ptr [bp - 6]
        endif
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 4822h]
        mov     dx, word ptr es:[bx + 4820h]
        if      FW_VERSION >= 312
        mov     word ptr [bp - 2ch], ax
        mov     word ptr [bp - 2eh], dx
        mov     ax, word ptr [bp - 28h]
        mov     dx, word ptr [bp - 2ah]
        mov     word ptr [bp - 24h], ax
        mov     word ptr [bp - 26h], dx
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        push    20h
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 17h]
        cbw
        shl     ax, 2
        lea     dx, [bp - 8d4h]
        add     ax, dx
        mov     bx, ax
        les     di, dword ptr ss:[bx]
        mov     ax, ss
        lea     si, [bp - 9e6h]
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        push    ss
        pop     es
        lea     di, [bp - 9e6h]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        xor     ax, ax
        sub     di, cx
        repne scasb
        jz      br_bc596
        mov     di, 1
        xor     ax, ax
        mov     es, ax
br_bc596:
        dec     di
        mov     ax, es
        mov     word ptr [bp - 3ch], ax
        mov     word ptr [bp - 3eh], di
        mov     ax, word ptr [bp - 3eh]
        or      ax, word ptr [bp - 3ch]
        jz      br_bc5c4
        jmp     br_bc5b6
loop_bc5a9:
        les     bx, dword ptr [bp - 3eh]
        cmp     byte ptr es:[bx], 20h
        jnz     br_bc5b6
        mov     byte ptr es:[bx], 0
br_bc5b6:
        dec     word ptr [bp - 3eh]
        mov     ax, word ptr [bp - 3eh]
        lea     dx, [bp - 9e6h]
        cmp     ax, dx
        ja      loop_bc5a9
br_bc5c4:
        push    ss
        lea     ax, [bp - 9e6h]
        push    ax
        push    ds
        push    word STR_3F91
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        elseif  FW_VERSION = 311
        mov     word ptr [bp - 2ch], ax
        mov     word ptr [bp - 2eh], dx
        mov     ax, word ptr [bp - 28h]
        mov     dx, word ptr [bp - 2ah]
        mov     word ptr [bp - 24h], ax
        mov     word ptr [bp - 26h], dx
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        push    20h
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 17h]
        cbw
        shl     ax, 2
        lea     dx, [bp - 8d4h]
        add     ax, dx
        mov     bx, ax
        les     di, dword ptr ss:[bx]
        mov     ax, ss
        lea     si, [bp - 9e6h]
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        push    ss
        pop     es
        lea     di, [bp - 9e6h]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        xor     ax, ax
        sub     di, cx
        repne scasb
        jz      br_bc596
        mov     di, 1
        xor     ax, ax
        mov     es, ax
br_bc596:
        dec     di
        mov     ax, es
        mov     word ptr [bp - 3ch], ax
        mov     word ptr [bp - 3eh], di
        mov     ax, word ptr [bp - 3eh]
        or      ax, word ptr [bp - 3ch]
        jz      br_bc5c4
        jmp     br_bc5b6
loop_bc5a9:
        les     bx, dword ptr [bp - 3eh]
        cmp     byte ptr es:[bx], 20h
        jnz     br_bc5b6
        mov     byte ptr es:[bx], 0
br_bc5b6:
        dec     word ptr [bp - 3eh]
        mov     ax, word ptr [bp - 3eh]
        lea     dx, [bp - 9e6h]
        cmp     ax, dx
        ja      loop_bc5a9
br_bc5c4:
        push    ss
        lea     ax, [bp - 9e6h]
        push    ax
        push    ds
        push    word STR_3F91
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        else
        mov     word ptr [bp - 2ah], ax
        mov     word ptr [bp - 2ch], dx
        mov     ax, word ptr [bp - 26h]
        mov     dx, word ptr [bp - 28h]
        mov     word ptr [bp - 22h], ax
        mov     word ptr [bp - 24h], dx
        endif
        jmp     br_bca3f
br_bc5d9:
        callf   SEG_CC84:far_cd087
        if      FW_VERSION >= 311
        cmp     ax, word ptr [bp - 0ch]
        else
        cmp     ax, word ptr [bp - 0ah]
        endif
        jge     br_bc5f5
        push    3
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_bc5f5:
        callf   SEG_CC84:far_cca70
        if      FW_VERSION >= 311
        cmp     dx, word ptr [bp - 20h]
        else
        cmp     dx, word ptr [bp - 1eh]
        endif
        jg      br_bc618
        jl      br_bc606
        if      FW_VERSION >= 311
        cmp     ax, word ptr [bp - 22h]
        else
        cmp     ax, word ptr [bp - 20h]
        endif
        jnc     br_bc618
br_bc606:
        push    2
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_bc618:
        push    ds
        push    word A_3E9C
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        mov     byte ptr [B_D5DD], 6ah
        push    ds
        push    word STR_3FA1
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_E421]
        inc     al
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 13h], al
        else
        mov     byte ptr [bp - 11h], al
        endif
        push    8
        push    18h
        push    1
        push    2
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 13h]
        else
        lea     ax, [bp - 11h]
        endif
        push    ax
        push    ds
        push    word STR_3FC6
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    ss
        pop     es
        if      FW_VERSION >= 311
        lea     di, [bp - 50h]
        else
        lea     di, [bp - 46h]
        endif
        push    es
        mov     es, word ptr [W_E40E]
        push    di
        mov     di, word ptr [FP_E40C]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, word ptr [W_E40E]
        mov     si, word ptr [FP_E40C]
        pop     di
        pop     es
        push    ds
        mov     ds, ax
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        push    10h
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 50h]
        else
        lea     ax, [bp - 46h]
        endif
        push    ax
        push    ds
        if      FW_VERSION >= 312
        push    word P_3FCF
        elseif  FW_VERSION = 311
        push    word P_3FCF
        else
        push    word P_3FCF
        endif
        callf   SEG_B347:far_b3471
        add     sp, 0ah
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word STR_3FD1
        elseif  FW_VERSION = 311
        push    word STR_3FC1_V311
        else
        push    word STR_3FC1_V311
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word STR_401F
        elseif  FW_VERSION = 311
        push    word STR_3FE2_V311
        else
        push    word STR_3FE2_V311
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     near br_bc763
br_bc6dc:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jz      br_bc6eb
        cmp     ax, 1
        jz      br_bc734
        jmp     short br_bc763
br_bc6eb:
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 13h]
        else
        mov     al, byte ptr [bp - 11h]
        endif
        cbw
        dec     ax
        push    ax
        callf   SEG_C495:far_c6547
        add     sp, 2
        push    ss
        pop     es
        if      FW_VERSION >= 311
        lea     di, [bp - 50h]
        else
        lea     di, [bp - 46h]
        endif
        push    es
        mov     es, word ptr [W_E40E]
        push    di
        mov     di, word ptr [FP_E40C]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, word ptr [W_E40E]
        mov     si, word ptr [FP_E40C]
        pop     di
        pop     es
        push    ds
        mov     ds, ax
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_bc763
br_bc734:
        push    ss
        pop     es
        if      FW_VERSION >= 311
        lea     di, [bp - 50h]
        else
        lea     di, [bp - 46h]
        endif
        mov     ax, word ptr [W_E40E]
        mov     si, word ptr [FP_E40C]
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
br_bc763:
        if      FW_VERSION >= 312
        push    2
        else
        push    1
        endif
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        or      ax, ax
        jnz     br_bc776
        jmp     near br_bc6dc
br_bc776:
        cmp     si, 78h
        if      FW_VERSION >= 312
        jz      L_bc784
        cmp     si, 79h
        jz      L_bc784
        elseif  FW_VERSION = 311
        jz      br_bc778
        else
        jz      L_bc793
        endif
        pop     di
        pop     si
        leave
        retf
        if      FW_VERSION >= 312
L_bc784:
        cmp     si, 79h
        jnz     L_bc793
        callf   SEG_CB18:far_cb23d
        callf   SEG_CC84:far_cd4d6
L_bc793:
        elseif  FW_VERSION = 311
br_bc778:
        else
L_bc793:
        endif
        mov     byte ptr [B_D5DD], 6bh
        push    ds
        push    word A_3E9C
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word P_4034
        elseif  FW_VERSION = 311
        push    word P_4034
        else
        push    word P_4034
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_40EE
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
loop_bc7cd:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        or      ax, ax
        jz      loop_bc7cd
        cmp     si, 78h
        jz      br_bc7e6
        pop     di
        pop     si
        leave
        retf
br_bc7e6:
        mov     byte ptr [B_D5DD], 6ch
        push    ds
        push    word A_3E9C
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    ds
        push    word STR_40FC
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 14h], 0
        else
        mov     byte ptr [bp - 12h], 0
        endif
        push    9
        push    ds
        push    word P_03F0+0ch
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 14h]
        else
        lea     ax, [bp - 12h]
        endif
        push    ax
        push    ds
        push    word STR_4173
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    14h
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 14h]
        else
        mov     al, byte ptr [bp - 12h]
        endif
        add     al, 0feh
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 15h], al
        cmp     byte ptr [bp - 15h], 0
        else
        mov     byte ptr [bp - 13h], al
        cmp     byte ptr [bp - 13h], 0
        endif
        jge     br_bc848
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 15h], 0
        else
        mov     byte ptr [bp - 13h], 0
        endif
br_bc848:
        push    ds
        push    word A_417E
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 15h]
        else
        mov     al, byte ptr [bp - 13h]
        endif
        cbw
        shl     ax, 2
        mov     bx, ax
        push    word ptr [bx + 276h]
        push    word ptr [bx + 274h]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        push    word A_401D
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 14h]
        else
        mov     al, byte ptr [bp - 12h]
        endif
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_83D1]
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 16h], al
        else
        mov     byte ptr [bp - 14h], al
        endif
        push    8
        push    62h
        push    23h
        push    2
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 16h]
        else
        lea     ax, [bp - 14h]
        endif
        push    ax
        push    ds
        push    word STR_4180
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    10h
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_418E
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    1ah
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 16h]
        else
        mov     al, byte ptr [bp - 14h]
        endif
        cbw
        shl     ax, 2
        mov     bx, ax
        push    word ptr [bx + 3feh]
        push    word ptr [bx + 3fch]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_41A5
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_bc9da
br_bc908:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jz      br_bc91b
        cmp     ax, 1
        jnz     br_bc918
        jmp     near br_bc9a8
br_bc918:
        jmp     near br_bc9da
br_bc91b:
        push    14h
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 14h]
        else
        mov     al, byte ptr [bp - 12h]
        endif
        add     al, 0feh
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 15h], al
        cmp     byte ptr [bp - 15h], 0
        else
        mov     byte ptr [bp - 13h], al
        cmp     byte ptr [bp - 13h], 0
        endif
        jge     br_bc939
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 15h], 0
        else
        mov     byte ptr [bp - 13h], 0
        endif
br_bc939:
        push    ds
        push    word A_417E
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 15h]
        else
        mov     al, byte ptr [bp - 13h]
        endif
        cbw
        shl     ax, 2
        mov     bx, ax
        push    word ptr [bx + 276h]
        push    word ptr [bx + 274h]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        push    word A_401D
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 14h]
        else
        mov     al, byte ptr [bp - 12h]
        endif
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_83D1]
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 16h], al
        else
        mov     byte ptr [bp - 14h], al
        endif
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    1ah
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 16h]
        else
        mov     al, byte ptr [bp - 14h]
        endif
        cbw
        shl     ax, 2
        mov     bx, ax
        push    word ptr [bx + 3feh]
        push    word ptr [bx + 3fch]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_bc9da
br_bc9a8:
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 14h]
        else
        mov     al, byte ptr [bp - 12h]
        endif
        cbw
        if      FW_VERSION >= 311
        mov     dl, byte ptr [bp - 16h]
        else
        mov     dl, byte ptr [bp - 14h]
        endif
        mov     bx, ax
        mov     byte ptr [bx + TBL_83D1], dl
        push    1ah
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 16h]
        else
        mov     al, byte ptr [bp - 14h]
        endif
        cbw
        shl     ax, 2
        mov     bx, ax
        push    word ptr [bx + 3feh]
        push    word ptr [bx + 3fch]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_bc9da:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        or      ax, ax
        jnz     br_bc9ed
        jmp     br_bc908
br_bc9ed:
        cmp     si, 78h
        jz      br_bc9f6
        pop     di
        pop     si
        leave
        retf
br_bc9f6:
        push    0
        if      FW_VERSION < 311
        push    word ptr [bp - 1eh]
        endif
        push    word ptr [bp - 20h]
        if      FW_VERSION >= 311
        push    word ptr [bp - 22h]
        endif
        push    ds
        push    word STR_41B1
        callf   SEG_CC84:far_cce4b
        add     sp, 0ah
        if      FW_VERSION >= 311
        mov     word ptr [bp - 8], ax
        else
        mov     word ptr [bp - 6], ax
        endif
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 4822h]
        mov     dx, word ptr es:[bx + 4820h]
        if      FW_VERSION >= 311
        mov     word ptr [bp - 2ch], ax
        mov     word ptr [bp - 2eh], dx
        mov     word ptr [bp - 30h], 0
        mov     word ptr [bp - 32h], 0c00h
        mov     ax, word ptr [bp - 20h]
        mov     dx, word ptr [bp - 22h]
        mov     word ptr [bp - 24h], ax
        mov     word ptr [bp - 26h], dx
        else
        mov     word ptr [bp - 2ah], ax
        mov     word ptr [bp - 2ch], dx
        mov     word ptr [bp - 2eh], 0
        mov     word ptr [bp - 30h], 0c00h
        mov     ax, word ptr [bp - 1eh]
        mov     dx, word ptr [bp - 20h]
        mov     word ptr [bp - 22h], ax
        mov     word ptr [bp - 24h], dx
        endif
br_bca3f:
        push    1
        callf   SEG_DA3F:far_da3fa
        add     sp, 2
        if      FW_VERSION >= 311
        push    word ptr [bp - 10h]
        else
        push    word ptr [bp - 1ah]
        endif
        push    word ptr [bp - 1ch]
        if      FW_VERSION >= 311
        push    word ptr [bp - 1eh]
        else
        push    word ptr [bp - 22h]
        endif
        push    word ptr [bp - 24h]
        if      FW_VERSION >= 311
        push    word ptr [bp - 26h]
        else
        push    word ptr [bp - 2ah]
        endif
        push    word ptr [bp - 2ch]
        push    word ptr [bp - 2eh]
        push    word ptr [bp - 30h]
        if      FW_VERSION >= 311
        push    word ptr [bp - 32h]
        endif
        push    word ptr [bp + 0ah]
        push    word ptr [W_EFA1]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    fn_bd237
        if      FW_VERSION >= 311
        add     sp, 1ah
        else
        add     sp, 18h
        endif
        mov     si, ax
        or      ax, ax
        jz      br_bcad1
        push    0
        callf   SEG_DA3F:far_da3fa
        add     sp, 2
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        if      FW_VERSION >= 311
        push    1
        endif
        push    0
        if      FW_VERSION >= 311
        push    word ptr [bp - 8]
        else
        push    word ptr [bp - 6]
        endif
        callf   SEG_CC84:far_cd353
        if      FW_VERSION >= 311
        add     sp, 6
        cmp     word ptr [bp - 10h], 0
        else
        add     sp, 4
        cmp     word ptr [bp - 0eh], 0
        endif
        jnz     br_bcab6
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 13h]
        else
        mov     al, byte ptr [bp - 11h]
        endif
        cbw
        dec     ax
        push    ax
        callf   SEG_CB18:far_cb457
        add     sp, 2
br_bcab6:
        or      si, si
        jge     br_bcacb
        push    si
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_bcacb:
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
br_bcad1:
        push    0
        callf   SEG_DA3F:far_da3fa
        add     sp, 2
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        if      FW_VERSION >= 311
        cmp     word ptr [bp - 10h], 1
        else
        cmp     word ptr [bp - 0eh], 1
        endif
        jz      br_bcaee
        if      FW_VERSION >= 311
        jmp     br_bcbbd
        else
        jmp     near br_bcbbd
        endif
br_bcaee:
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 18h]
        else
        mov     al, byte ptr [bp - 16h]
        endif
        cbw
        mov     dx, 3bh
        imul    dx
        if      FW_VERSION >= 311
        lea     dx, [bp - 804h]
        else
        lea     dx, [bp - 7fah]
        endif
        add     ax, dx
        mov     bx, ax
        mov     ax, word ptr ss:[bx]
        cwd
        push    ax
        push    dx
        xor     dx, dx
        mov     ax, 28h
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        push    ax
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 8]
        else
        mov     ax, word ptr [bp - 6]
        endif
        mov     bx, 24h
        push    dx
        imul    bx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        pop     ax
        mov     word ptr es:[bx + 4816h], ax
        pop     ax
        mov     word ptr es:[bx + 4814h], ax
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 18h]
        else
        mov     al, byte ptr [bp - 16h]
        endif
        cbw
        mov     dx, 3bh
        imul    dx
        if      FW_VERSION >= 311
        lea     dx, [bp - 802h]
        else
        lea     dx, [bp - 7f8h]
        endif
        add     ax, dx
        mov     bx, ax
        mov     ax, word ptr ss:[bx]
        cwd
        push    ax
        push    dx
        xor     dx, dx
        mov     ax, 28h
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        push    ax
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 8]
        else
        mov     ax, word ptr [bp - 6]
        endif
        mov     bx, 24h
        push    dx
        imul    bx
        mov     si, ax
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        pop     ax
        mov     word ptr es:[bx + 481ah], ax
        pop     ax
        mov     word ptr es:[bx + 4818h], ax
        mov     ax, SEG_A28F
        mov     es, ax
        mov     byte ptr es:[si + 4813h], 0
        mov     ax, SEG_A28F
        mov     es, ax
        mov     byte ptr es:[si + 4811h], 64h
        if      FW_VERSION >= 311
        cmp     byte ptr [bp - 11h], 0
        jz      br_bcba1
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        lea     dx, [bp - 80ah]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        jmp     br_bcba3
br_bcba1:
        mov     al, 0
br_bcba3:
        add     al, 0efh
        mov     dx, SEG_A28F
        mov     es, dx
        mov     byte ptr es:[si + 4812h], al
        push    word ptr [bp - 8]
        else
        mov     ax, SEG_A28F
        mov     es, ax
        mov     byte ptr es:[si + 4812h], 0efh
        push    word ptr [bp - 6]
        endif
        callf   SEG_CC84:far_cd5d8
        add     sp, 2
        jmp     br_bd18b
br_bcbbd:
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 13h]
        else
        mov     al, byte ptr [bp - 11h]
        endif
        cbw
        dec     ax
        push    ax
        callf   SEG_CB18:far_cb457
        add     sp, 2
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 13h]
        else
        mov     al, byte ptr [bp - 11h]
        endif
        cbw
        dec     ax
        push    ax
        callf   SEG_C495:far_c6547
        add     sp, 2
        xor     di, di
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 50h]
        else
        lea     ax, [bp - 46h]
        endif
        push    ax
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_B52D:far_b6beb
        add     sp, 8
        mov     word ptr [bp - 2], 0
loop_bcbf3:
        if      FW_VERSION >= 311
        lea     ax, [bp - 50h]
        else
        lea     ax, [bp - 46h]
        endif
        mov     bx, word ptr [bp - 2]
        add     bx, ax
        mov     si, bx
        cmp     byte ptr ss:[bx], 2eh
        jz      br_bcc08
        cmp     di, 1
        jnz     br_bcc0f
br_bcc08:
        mov     byte ptr ss:[si], 20h
        mov     di, 1
br_bcc0f:
        inc     word ptr [bp - 2]
        cmp     word ptr [bp - 2], 11h
        jl      loop_bcbf3
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 40h], 0
        else
        mov     byte ptr [bp - 36h], 0
        endif
        push    ss
        pop     es
        if      FW_VERSION >= 311
        lea     di, [bp - 50h]
        else
        lea     di, [bp - 46h]
        endif
        mov     ax, word ptr [W_E40E]
        mov     si, word ptr [FP_E40C]
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 8]
        else
        mov     ax, word ptr [bp - 6]
        endif
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     byte ptr es:[bx + 4800h], 0
        mov     word ptr [bp - 2], 0
br_bcc65:
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        if      FW_VERSION >= 311
        lea     dx, [bp - 826h]
        else
        lea     dx, [bp - 81ch]
        endif
        add     ax, dx
        mov     dx, ax
        mov     bx, ax
        cmp     byte ptr ss:[bx], 0
        jnz     br_bcc80
        jmp     br_bcfed
br_bcc80:
        push    ss
        push    dx
        callf   SEG_CC84:far_cd551
        add     sp, 4
        or      ax, ax
        jl      br_bcc91
        jmp     br_bcdfe
br_bcc91:
        callf   SEG_CC84:far_cd063
        if      FW_VERSION >= 311
        mov     word ptr [bp - 8], ax
        else
        mov     word ptr [bp - 6], ax
        endif
        push    ss
        pop     es
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        if      FW_VERSION >= 311
        lea     dx, [bp - 826h]
        else
        lea     dx, [bp - 81ch]
        endif
        add     ax, dx
        mov     dx, SEG_A28F
        push    es
        push    ax
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 8]
        else
        mov     ax, word ptr [bp - 6]
        endif
        mov     bx, 24h
        push    dx
        imul    bx
        add     ax, 4800h
        pop     dx
        pop     di
        pop     es
        push    dx
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        pop     si
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        if      FW_VERSION >= 311
        lea     dx, [bp - 814h]
        else
        lea     dx, [bp - 80ah]
        endif
        add     ax, dx
        if      FW_VERSION >= 311
        mov     dx, word ptr [bp - 2ch]
        mov     bx, word ptr [bp - 2eh]
        else
        mov     dx, word ptr [bp - 2ah]
        mov     bx, word ptr [bp - 2ch]
        endif
        xchg    bx, ax
        add     ax, word ptr ss:[bx]
        adc     dx, word ptr ss:[bx + 2]
        push    ax
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 8]
        else
        mov     ax, word ptr [bp - 6]
        endif
        mov     bx, 24h
        push    dx
        imul    bx
        mov     si, ax
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        pop     ax
        mov     word ptr es:[bx + 4822h], ax
        pop     ax
        mov     word ptr es:[bx + 4820h], ax
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        if      FW_VERSION >= 311
        lea     dx, [bp - 810h]
        else
        lea     dx, [bp - 806h]
        endif
        add     ax, dx
        mov     bx, ax
        mov     ax, word ptr ss:[bx + 2]
        mov     dx, word ptr ss:[bx]
        mov     bx, SEG_A28F
        mov     es, bx
        mov     word ptr es:[si + 481eh], ax
        mov     word ptr es:[si + 481ch], dx
        if      FW_VERSION >= 311
        cmp     byte ptr [bp - 11h], 0
        else
        cmp     byte ptr [bp - 0fh], 0
        endif
        jz      br_bcd5e
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        if      FW_VERSION >= 311
        lea     dx, [bp - 7fah]
        else
        lea     dx, [bp - 7f0h]
        endif
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        jmp     br_bcd60
br_bcd5e:
        mov     al, 64h
br_bcd60:
        mov     dx, SEG_A28F
        mov     es, dx
        mov     byte ptr es:[si + 4811h], al
        mov     ax, SEG_A28F
        mov     es, ax
        mov     byte ptr es:[si + 4812h], 0efh
        mov     ax, SEG_A28F
        mov     es, ax
        mov     byte ptr es:[si + 4813h], 0
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        if      FW_VERSION >= 311
        lea     dx, [bp - 804h]
        else
        lea     dx, [bp - 7fah]
        endif
        add     ax, dx
        mov     bx, ax
        mov     ax, word ptr ss:[bx]
        cwd
        push    ax
        push    dx
        xor     dx, dx
        mov     ax, 28h
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        push    ax
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 8]
        else
        mov     ax, word ptr [bp - 6]
        endif
        mov     bx, 24h
        push    dx
        imul    bx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        pop     ax
        mov     word ptr es:[bx + 4816h], ax
        pop     ax
        mov     word ptr es:[bx + 4814h], ax
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        if      FW_VERSION >= 311
        lea     dx, [bp - 802h]
        else
        lea     dx, [bp - 7f8h]
        endif
        add     ax, dx
        mov     bx, ax
        mov     ax, word ptr ss:[bx]
        cwd
        push    ax
        push    dx
        xor     dx, dx
        mov     ax, 28h
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        push    ax
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 8]
        else
        mov     ax, word ptr [bp - 6]
        endif
        mov     bx, 24h
        push    dx
        imul    bx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        pop     ax
        mov     word ptr es:[bx + 481ah], ax
        pop     ax
        mov     word ptr es:[bx + 4818h], ax
br_bcdfe:
        mov     word ptr [bp - 4], 0
loop_bce03:
        if      FW_VERSION >= 311
        lea     ax, [bp - 848h]
        else
        lea     ax, [bp - 83eh]
        endif
        mov     bx, word ptr [bp - 4]
        add     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        cmp     ax, word ptr [bp - 2]
        jnz     br_bce33
        mov     bx, word ptr [bp - 4]
        mov     al, byte ptr [bx + TBL_83D1]
        cbw
        if      FW_VERSION >= 311
        mov     word ptr [bp - 0ah], ax
        cmp     word ptr [bp - 4], 2
        jge     br_bce2a
        xor     ax, ax
        jmp     br_bce30
br_bce2a:
        mov     ax, word ptr [bp - 4]
        add     ax, 0fffeh
br_bce30:
        mov     word ptr [bp - 6], ax
        else
        mov     word ptr [bp - 8], ax
        endif
br_bce33:
        inc     word ptr [bp - 4]
        cmp     word ptr [bp - 4], 22h
        jl      loop_bce03
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 0ah]
        mov     dx, 18h
        imul    dx
        mov     dx, word ptr [W_E40E]
        mov     bx, word ptr [FP_E40C]
        add     bx, ax
        add     bx, 0fcf6h
        mov     word ptr [bp - 34h], dx
        mov     word ptr [bp - 36h], bx
        endif
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        if      FW_VERSION >= 311
        lea     dx, [bp - 826h]
        else
        lea     dx, [bp - 81ch]
        endif
        add     ax, dx
        push    ss
        push    ax
        callf   SEG_CC84:far_cd551
        add     sp, 4
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 36h]
        mov     byte ptr es:[bx], al
        cmp     byte ptr [bp - 11h], 1
        else
        push    ax
        mov     ax, word ptr [bp - 8]
        mov     dx, 18h
        imul    dx
        mov     cx, ax
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        pop     ax
        mov     byte ptr es:[bx - 30ah], al
        cmp     byte ptr [bp - 0fh], 1
        endif
        jnz     br_bceb1
        if      FW_VERSION >= 311
        mov     bx, word ptr [bp - 6]
        shl     bx, 1
        lea     ax, [bp - 9d4h]
        add     bx, ax
        mov     ax, word ptr ss:[bx]
        add     ax, 0e000h
        mov     bx, 14h
        cwd
        idiv    bx
        push    ax
        endif
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        if      FW_VERSION >= 311
        lea     dx, [bp - 80ah]
        else
        mov     si, ax
        lea     dx, [bp - 800h]
        endif
        add     ax, dx
        mov     bx, ax
        if      FW_VERSION >= 311
        pop     ax
        add     ax, word ptr ss:[bx]
        mov     bx, word ptr [bp - 36h]
        mov     word ptr es:[bx + 9], ax
        else
        mov     ax, word ptr ss:[bx]
        add     ax, word ptr [bp+si - 802h]
        mov     bx, word ptr [FP_E40C]
        add     bx, cx
        mov     word ptr es:[bx - 301h], ax
        endif
        jmp     br_bced3
br_bceb1:
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        if      FW_VERSION >= 311
        lea     dx, [bp - 7fch]
        else
        lea     dx, [bp - 7f2h]
        endif
        add     ax, dx
        mov     bx, ax
        push    word ptr ss:[bx]
        nop
        push    cs
        call    fn_bd1a3
        add     sp, 2
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 36h]
        mov     word ptr es:[bx + 9], ax
        else
        push    ax
        mov     ax, word ptr [bp - 8]
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        pop     ax
        mov     word ptr es:[bx - 301h], ax
        endif
br_bced3:
        if      FW_VERSION >= 311
        push    1
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        lea     dx, [bp - 800h]
        add     ax, dx
        mov     bx, ax
        push    word ptr ss:[bx]
        callf   SEG_DA7E:far_da8a5
        add     sp, 4
        les     bx, dword ptr [bp - 36h]
        mov     byte ptr es:[bx + 0bh], al
        push    1
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        lea     dx, [bp - 7feh]
        add     ax, dx
        mov     bx, ax
        push    word ptr ss:[bx]
        callf   SEG_DA7E:far_da8a5
        add     sp, 4
        les     bx, dword ptr [bp - 36h]
        mov     byte ptr es:[bx + 0ch], al
        cmp     byte ptr [bp - 11h], 0
        jz      br_bcf36
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        lea     dx, [bp - 7f9h]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        jmp     br_bcf38
br_bcf36:
        mov     al, 64h
br_bcf38:
        les     bx, dword ptr [bp - 36h]
        mov     byte ptr es:[bx + 13h], al
        cmp     byte ptr [bp - 11h], 0
        jz      br_bcf64
        endif
        push    1
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        lea     dx, [bp - 7f6h]
        add     ax, dx
        mov     bx, ax
        push    word ptr ss:[bx]
        callf   SEG_DA7E:far_da8a5
        add     sp, 4
        if      FW_VERSION >= 311
        jmp     br_bcf66
br_bcf64:
        mov     al, 0
br_bcf66:
        les     bx, dword ptr [bp - 36h]
        mov     byte ptr es:[bx + 14h], al
        cmp     byte ptr [bp - 11h], 0
        jz      br_bcf92
        else
        push    ax
        mov     ax, word ptr [bp - 8]
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        pop     ax
        mov     byte ptr es:[bx - 2ffh], al
        endif
        push    1
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        lea     dx, [bp - 7f4h]
        add     ax, dx
        mov     bx, ax
        push    word ptr ss:[bx]
        callf   SEG_DA7E:far_da8a5
        add     sp, 4
        if      FW_VERSION < 311
        push    ax
        mov     ax, word ptr [bp - 8]
        mov     dx, 18h
        imul    dx
        mov     cx, ax
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        pop     ax
        mov     byte ptr es:[bx - 2feh], al
        cmp     byte ptr [bp - 0fh], 0
        jz      br_bcf36
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        lea     dx, [bp - 7efh]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        jmp     br_bcf38
br_bcf36:
        mov     al, 64h
br_bcf38:
        les     bx, dword ptr [FP_E40C]
        add     bx, cx
        mov     byte ptr es:[bx - 2f7h], al
        cmp     byte ptr [bp - 0fh], 0
        jz      br_bcf64
        push    1
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        lea     dx, [bp - 7ech]
        add     ax, dx
        mov     bx, ax
        push    word ptr ss:[bx]
        callf   SEG_DA7E:far_da8a5
        add     sp, 4
        jmp     br_bcf66
br_bcf64:
        mov     al, 0
br_bcf66:
        push    ax
        mov     ax, word ptr [bp - 8]
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        pop     ax
        mov     byte ptr es:[bx - 2f6h], al
        cmp     byte ptr [bp - 0fh], 0
        jz      br_bcf92
        push    1
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        lea     dx, [bp - 7eah]
        add     ax, dx
        mov     bx, ax
        push    word ptr ss:[bx]
        callf   SEG_DA7E:far_da8a5
        add     sp, 4
        endif
        jmp     br_bcf94
br_bcf92:
        mov     al, 0
br_bcf94:
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 36h]
        mov     byte ptr es:[bx + 15h], al
        lea     ax, [bp - 954h]
        mov     bx, word ptr [bp - 6]
        else
        push    ax
        mov     ax, word ptr [bp - 8]
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        endif
        add     bx, ax
        if      FW_VERSION < 311
        pop     ax
        mov     byte ptr es:[bx - 2f5h], al
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        lea     dx, [bp - 7e7h]
        add     ax, dx
        mov     bx, ax
        endif
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 19h
        imul    dx
        mov     bx, 20h
        cwd
        idiv    bx
        if      FW_VERSION >= 311
        mov     dx, word ptr [bp - 0ah]
        else
        mov     dx, word ptr [bp - 8]
        endif
        shl     dx, 2
        if      FW_VERSION >= 311
        les     bx, dword ptr [FP_E40C]
        else
        mov     bx, word ptr [FP_E40C]
        endif
        add     bx, dx
        mov     byte ptr es:[bx + 5b2h], al
        if      FW_VERSION >= 311
        lea     ax, [bp - 974h]
        mov     bx, word ptr [bp - 6]
        add     bx, ax
        else
        mov     ax, word ptr [bp - 2]
        mov     dx, 3bh
        imul    dx
        lea     dx, [bp - 7e6h]
        add     ax, dx
        mov     bx, ax
        endif
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 19h
        imul    dx
        mov     bx, 20h
        cwd
        idiv    bx
        if      FW_VERSION >= 311
        mov     dx, word ptr [bp - 0ah]
        else
        mov     dx, word ptr [bp - 8]
        endif
        shl     dx, 2
        mov     bx, word ptr [FP_E40C]
        add     bx, dx
        mov     byte ptr es:[bx + 5b3h], al
br_bcfed:
        inc     word ptr [bp - 2]
        cmp     word ptr [bp - 2], 22h
        jge     br_bcff9
        jmp     br_bcc65
br_bcff9:
        callf   SEG_CC84:far_cd0a9
        mov     al, byte ptr [TBL_83D1]
        cbw
        if      FW_VERSION >= 311
        mov     word ptr [bp - 0ah], ax
        else
        mov     word ptr [bp - 8], ax
        endif
        mov     dx, 18h
        imul    dx
        if      FW_VERSION >= 311
        mov     dx, word ptr [W_E40E]
        else
        mov     cx, ax
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     byte ptr es:[bx - 309h], 3
        endif
        mov     bx, word ptr [FP_E40C]
        if      FW_VERSION >= 311
        add     bx, ax
        add     bx, 0fcf6h
        mov     word ptr [bp - 34h], dx
        mov     word ptr [bp - 36h], bx
        mov     es, word ptr [W_E40E]
        mov     byte ptr es:[bx + 1], 3
        mov     es, word ptr [bp - 34h]
        mov     byte ptr es:[bx + 2], 16h
        mov     al, byte ptr [B_83D2]
        mov     byte ptr es:[bx + 3], al
        mov     byte ptr es:[bx + 4], 29h
        mov     al, byte ptr [TBL_83D3]
        mov     byte ptr es:[bx + 5], al
        mov     al, byte ptr [B_83D2]
        mov     byte ptr es:[bx + 7], al
        mov     al, byte ptr [TBL_83D3]
        mov     byte ptr es:[bx + 8], al
        mov     byte ptr es:[bx + 0dh], 1
        les     bx, dword ptr [FP_E40C]
        mov     al, byte ptr [bp - 0ah]
        else
        add     bx, cx
        mov     byte ptr es:[bx - 308h], 16h
        mov     bx, word ptr [FP_E40C]
        add     bx, cx
        mov     al, byte ptr [B_77A8_V308]
        mov     byte ptr es:[bx - 307h], al
        mov     bx, word ptr [FP_E40C]
        add     bx, cx
        mov     byte ptr es:[bx - 306h], 29h
        mov     bx, word ptr [FP_E40C]
        add     bx, cx
        mov     al, byte ptr [TBL_83D3]
        mov     byte ptr es:[bx - 305h], al
        mov     bx, word ptr [FP_E40C]
        add     bx, cx
        mov     al, byte ptr [B_77A8_V308]
        mov     byte ptr es:[bx - 303h], al
        mov     bx, word ptr [FP_E40C]
        add     bx, cx
        mov     al, byte ptr [TBL_83D3]
        mov     byte ptr es:[bx - 302h], al
        mov     bx, word ptr [FP_E40C]
        add     bx, cx
        mov     byte ptr es:[bx - 2fdh], 1
        mov     bx, word ptr [FP_E40C]
        mov     al, byte ptr [bp - 8]
        endif
        mov     byte ptr es:[bx + 11h], al
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 36h]
        mov     byte ptr es:[bx + 17h], 1
        les     bx, dword ptr [FP_E40C]
        else
        add     bx, cx
        mov     byte ptr es:[bx - 2f3h], 1
        mov     bx, word ptr [FP_E40C]
        endif
        mov     al, byte ptr [TBL_83D1]
        mov     byte ptr es:[bx + 73eh], al
        mov     word ptr [bp - 2], 3
        if      FW_VERSION >= 311
        jmp     br_bd091
loop_bd07b:
        else
        jmp     br_bd0b4
loop_bd09e:
        endif
        mov     bx, word ptr [bp - 2]
        mov     al, byte ptr [bx + TBL_83D1]
        les     bx, dword ptr [FP_E40C]
        add     bx, word ptr [bp - 2]
        mov     byte ptr es:[bx + 73ch], al
        inc     word ptr [bp - 2]
        if      FW_VERSION >= 311
br_bd091:
        else
br_bd0b4:
        endif
        cmp     word ptr [bp - 2], 22h
        if      FW_VERSION >= 311
        jl      loop_bd07b
        mov     word ptr [bp - 2], 20h
        jmp     br_bd0b4
loop_bd09e:
        mov     bx, word ptr [bp - 2]
        mov     al, byte ptr [bx + TBL_3E5C]
        les     bx, dword ptr [FP_E40C]
        add     bx, word ptr [bp - 2]
        mov     byte ptr es:[bx + 73eh], al
        inc     word ptr [bp - 2]
br_bd0b4:
        cmp     word ptr [bp - 2], 40h
        endif
        jl      loop_bd09e
        if      FW_VERSION >= 311
        cmp     byte ptr [bp - 11h], 0
        jg      br_bd0c3
        jmp     near br_bd17d
br_bd0c3:
        endif
        mov     word ptr [bp - 2], 1
        jmp     near br_bd174
br_bd0cb:
        if      FW_VERSION >= 311
        lea     ax, [bp - 8f4h]
        else
        lea     ax, [bp - 8eah]
        endif
        mov     bx, word ptr [bp - 2]
        add     bx, ax
        cmp     byte ptr ss:[bx], 0
        jg      br_bd0dd
        jmp     near br_bd171
br_bd0dd:
        les     bx, dword ptr [FP_E40C]
        add     bx, word ptr [bp - 2]
        mov     al, byte ptr es:[bx + 73eh]
        mov     ah, 0
        if      FW_VERSION >= 311
        mov     word ptr [bp - 0ah], ax
        lea     ax, [bp - 914h]
        else
        mov     word ptr [bp - 8], ax
        lea     ax, [bp - 90ah]
        endif
        mov     bx, word ptr [bp - 2]
        add     bx, ax
        cmp     byte ptr ss:[bx], 1
        jnz     br_bd115
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 0ah]
        else
        mov     ax, word ptr [bp - 8]
        endif
        mov     dx, 18h
        imul    dx
        if      FW_VERSION >= 311
        mov     dx, ax
        else
        mov     cx, ax
        endif
        mov     bx, word ptr [FP_E40C]
        add     bx, ax
        mov     byte ptr es:[bx - 309h], 2
        jmp     br_bd12b
br_bd115:
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 0ah]
        else
        mov     ax, word ptr [bp - 8]
        endif
        mov     dx, 18h
        imul    dx
        if      FW_VERSION >= 311
        mov     dx, ax
        else
        mov     cx, ax
        endif
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     byte ptr es:[bx - 309h], 1
br_bd12b:
        if      FW_VERSION >= 311
        lea     ax, [bp - 8f4h]
        else
        lea     ax, [bp - 8eah]
        endif
        mov     bx, word ptr [bp - 2]
        add     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx + 73dh]
        mov     bx, word ptr [FP_E40C]
        if      FW_VERSION >= 311
        add     bx, dx
        else
        add     bx, cx
        endif
        mov     byte ptr es:[bx - 307h], al
        if      FW_VERSION >= 311
        lea     ax, [bp - 934h]
        else
        lea     ax, [bp - 92ah]
        endif
        mov     bx, word ptr [bp - 2]
        add     bx, ax
        mov     al, byte ptr ss:[bx]
        mov     bx, word ptr [FP_E40C]
        if      FW_VERSION >= 311
        add     bx, dx
        else
        add     bx, cx
        endif
        mov     byte ptr es:[bx - 308h], al
        mov     bx, word ptr [FP_E40C]
        if      FW_VERSION >= 311
        add     bx, dx
        else
        add     bx, cx
        endif
        mov     byte ptr es:[bx - 306h], 7fh
br_bd171:
        inc     word ptr [bp - 2]
br_bd174:
        cmp     word ptr [bp - 2], 20h
        jge     br_bd17d
        jmp     near br_bd0cb
br_bd17d:
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 13h]
        else
        mov     al, byte ptr [bp - 11h]
        endif
        cbw
        dec     ax
        push    ax
        callf   SEG_C495:far_c6547
        add     sp, 2
br_bd18b:
        if      FW_VERSION >= 311
        xor     si, si
br_bd18d:
        or      si, si
        jz      br_bd194
        jmp     br_bc225
br_bd194:
        cmp     word ptr [bp - 10h], 1
        jnz     br_bd19d
        jmp     br_bc225
br_bd19d:
        endif
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
fn_bd1a3:
        push    bp
        mov     bp, sp
        push    si
        mov     cx, word ptr [bp + 6]
        if      FW_VERSION >= 311
        xor     dx, dx
        xor     si, si
        else
        mov     dx, 0ff88h
        mov     si, 0ff10h
        endif
loop_bd1ae:
        cmp     word ptr [si + TBL_6AC0], cx
        jg      br_bd1c2
        cmp     word ptr [si + TBL_6AC2], cx
        jle     br_bd1c2
        mov     ax, dx
        if      FW_VERSION >= 311
        add     ax, 0ff88h
        endif
        pop     si
        pop     bp
        retf
br_bd1c2:
        add     si, 2
        inc     dx
        if      FW_VERSION >= 311
        cmp     si, 168h
        else
        cmp     si, 78h
        endif
        jnz     loop_bd1ae
        xor     ax, ax
        pop     si
        pop     bp
        retf
fn_bd1d1:
        push    bp
        mov     bp, sp
        les     bx, dword ptr [bp + 6]
        mov     ax, word ptr es:[bx + 2]
        mov     dx, word ptr es:[bx]
        les     bx, dword ptr [bp + 0ah]
        cmp     ax, word ptr es:[bx + 2]
        jg      br_bd1f3
        jl      br_bd1ee
        cmp     dx, word ptr es:[bx]
        jnc     br_bd1f3
br_bd1ee:
        mov     ax, 0ffffh
        pop     bp
        retf
br_bd1f3:
        les     bx, dword ptr [bp + 6]
        mov     ax, word ptr es:[bx + 2]
        mov     dx, word ptr es:[bx]
        les     bx, dword ptr [bp + 0ah]
        cmp     ax, word ptr es:[bx + 2]
        jl      br_bd212
        jg      br_bd20d
        cmp     dx, word ptr es:[bx]
        jbe     br_bd212
br_bd20d:
        mov     ax, 1
        pop     bp
        retf
br_bd212:
        xor     ax, ax
        pop     bp
        retf
far_bd216:
        push    bp
        mov     bp, sp
        les     bx, dword ptr [bp + 0ah]
        push    word ptr es:[bx + 2]
        push    word ptr es:[bx]
        les     bx, dword ptr [bp + 6]
        push    word ptr es:[bx + 2]
        push    word ptr es:[bx]
        callf   0f800h:far_fa70d
        add     sp, 8
        pop     bp
        retf
fn_bd237:
        push    bp
        mov     bp, sp
        sub     sp, 12h
        push    si
        mov     si, word ptr [bp + 0ah]
        mov     si, word ptr [bp + 0ch]
        if      FW_VERSION >= 311
        cmp     word ptr [bp + 1eh], 0
        jnz     br_bd26c
        endif
        callf   SEG_B1AA:far_b1aac
        push    ds
        push    word STR_41BE
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word P_41DD
        elseif  FW_VERSION = 311
        push    word P_41DD
        else
        push    word P_41DD
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
br_bd26c:
        cmp     si, 2
        jnz     br_bd2c1
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_CAA9:far_caade
        add     sp, 4
        mov     si, ax
        or      ax, ax
        jge     br_bd288
        pop     si
        leave
        retf
br_bd288:
        push    word ptr [bp + 10h]
        push    word ptr [bp + 0eh]
        push    si
        callf   SEG_CAA9:far_cace7
        add     sp, 6
        mov     dx, ax
        or      ax, ax
        jz      br_bd2a0
        pop     si
        leave
        retf
br_bd2a0:
        push    word ptr [bp + 18h]
        push    word ptr [bp + 16h]
        push    word ptr [bp + 14h]
        push    word ptr [bp + 12h]
        push    si
        callf   SEG_D8B9:far_d938a
        add     sp, 0ah
        mov     dx, ax
        or      ax, ax
        jl      br_bd2be
        jmp     br_bd5ad
br_bd2be:
        pop     si
        leave
        retf
br_bd2c1:
        cmp     si, 5
        jz      br_bd2c9
        jmp     br_bd5ad
br_bd2c9:
        push    0
        push    3
        mov     ax, word ptr [bp + 10h]
        mov     dx, word ptr [bp + 0eh]
        shl     dx, 1
        rcl     ax, 1
        add     dx, 0e800h
        adc     ax, 0ffffh
        push    ax
        push    dx
        callf   0f800h:far_fa0fe
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        add     dx, word ptr [bp + 16h]
        adc     ax, word ptr [bp + 18h]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        cmp     ax, word ptr [bp + 1ch]
        jg      br_bd36e
        jl      br_bd30f
        cmp     dx, word ptr [bp + 1ah]
        jnc     br_bd36e
br_bd30f:
        mov     ax, word ptr [bp - 6]
        mov     dx, word ptr [bp - 8]
        cmp     ax, word ptr [bp + 1ch]
        jg      br_bd36e
        jl      br_bd321
        cmp     dx, word ptr [bp + 1ah]
        jnc     br_bd36e
br_bd321:
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_CAA9:far_caade
        add     sp, 4
        mov     si, ax
        or      ax, ax
        jge     br_bd338
        pop     si
        leave
        retf
br_bd338:
        push    word ptr [bp + 10h]
        push    word ptr [bp + 0eh]
        push    si
        callf   SEG_CAA9:far_cace7
        add     sp, 6
        mov     dx, ax
        or      ax, ax
        jz      br_bd350
        pop     si
        leave
        retf
br_bd350:
        push    word ptr [bp + 18h]
        push    word ptr [bp + 16h]
        push    word ptr [bp + 14h]
        push    word ptr [bp + 12h]
        push    si
        callf   SEG_D8B9:far_d938a
        add     sp, 0ah
        mov     dx, ax
        or      ax, ax
        jge     br_bd36e
        pop     si
        leave
        retf
br_bd36e:
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        cmp     ax, word ptr [bp + 1ch]
        jge     br_bd37c
        jmp     br_bd469
br_bd37c:
        jg      br_bd386
        cmp     dx, word ptr [bp + 1ah]
        ja      br_bd386
        jmp     br_bd469
br_bd386:
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
loop_bd390:
        push    2
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    fn_bd5b2
        add     sp, 6
        mov     dx, ax
        cmp     ax, 78h
        jz      br_bd3aa
        pop     si
        leave
        retf
br_bd3aa:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_429F
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_CAA9:far_caade
        add     sp, 4
        mov     si, ax
        or      ax, ax
        jge     br_bd3e1
        cmp     si, 0fd00h
        jz      loop_bd390
        mov     ax, si
        pop     si
        leave
        retf
br_bd3e1:
        push    2
        push    si
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     dx, ax
        or      ax, ax
        jz      br_bd3fa
        pop     si
        leave
        retf
br_bd3fa:
        cmp     byte ptr [bp - 12h], 6
        jnz     br_bd406
        cmp     byte ptr [bp - 11h], 1
        jle     br_bd40c
br_bd406:
        mov     ax, 0ffdfh
        pop     si
        leave
        retf
br_bd40c:
        push    0
        push    2
        mov     cx, word ptr [bp + 1ch]
        mov     bx, word ptr [bp + 1ah]
        xor     dx, dx
        mov     ax, 3
        callf   0f800h:far_fa0c8
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        mov     bx, word ptr [bp + 10h]
        mov     cx, word ptr [bp + 0eh]
        sub     cx, ax
        sbb     bx, dx
        mov     word ptr [bp + 10h], bx
        mov     word ptr [bp + 0eh], cx
        push    bx
        push    cx
        push    si
        callf   SEG_CAA9:far_cace7
        add     sp, 6
        mov     dx, ax
        or      ax, ax
        jz      br_bd44b
        pop     si
        leave
        retf
br_bd44b:
        push    word ptr [bp + 18h]
        push    word ptr [bp + 16h]
        push    word ptr [bp + 14h]
        push    word ptr [bp + 12h]
        push    si
        callf   SEG_D8B9:far_d938a
        add     sp, 0ah
        mov     dx, ax
        or      ax, ax
        jge     br_bd469
        pop     si
        leave
        retf
br_bd469:
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        cmp     ax, word ptr [bp + 1ch]
        jle     br_bd477
        jmp     br_bd5ad
br_bd477:
        jl      br_bd481
        cmp     dx, word ptr [bp + 1ah]
        jc      br_bd481
        jmp     br_bd5ad
br_bd481:
        mov     ax, word ptr [bp - 6]
        mov     dx, word ptr [bp - 8]
        cmp     ax, word ptr [bp + 1ch]
        jge     br_bd48f
        jmp     br_bd5ad
br_bd48f:
        jg      br_bd499
        cmp     dx, word ptr [bp + 1ah]
        ja      br_bd499
        jmp     br_bd5ad
br_bd499:
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_CAA9:far_caade
        add     sp, 4
        mov     si, ax
        or      ax, ax
        jge     br_bd4b0
        pop     si
        leave
        retf
br_bd4b0:
        push    word ptr [bp + 10h]
        push    word ptr [bp + 0eh]
        push    si
        callf   SEG_CAA9:far_cace7
        add     sp, 6
        mov     dx, ax
        or      ax, ax
        jz      br_bd4c8
        pop     si
        leave
        retf
br_bd4c8:
        mov     ax, word ptr [bp + 1ch]
        mov     dx, word ptr [bp + 1ah]
        sub     dx, word ptr [bp - 4]
        sbb     ax, word ptr [bp - 2]
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp - 0ch], dx
        push    ax
        push    dx
        push    word ptr [bp + 14h]
        push    word ptr [bp + 12h]
        push    si
        callf   SEG_D8B9:far_d938a
        add     sp, 0ah
        mov     dx, ax
        or      ax, ax
        jge     loop_bd4f4
        pop     si
        leave
        retf
loop_bd4f4:
        push    2
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    fn_bd5b2
        add     sp, 6
        mov     dx, ax
        cmp     ax, 78h
        jz      br_bd50e
        pop     si
        leave
        retf
br_bd50e:
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_CAA9:far_caade
        add     sp, 4
        mov     si, ax
        or      ax, ax
        jge     br_bd537
        cmp     si, 0fd00h
        jz      loop_bd4f4
        mov     ax, si
        pop     si
        leave
        retf
br_bd537:
        push    2
        push    si
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     dx, ax
        or      ax, ax
        jz      br_bd550
        pop     si
        leave
        retf
br_bd550:
        cmp     byte ptr [bp - 12h], 6
        jnz     br_bd55c
        cmp     byte ptr [bp - 11h], 1
        jle     br_bd562
br_bd55c:
        mov     ax, 0ffdfh
        pop     si
        leave
        retf
br_bd562:
        push    0
        push    word 0c00h
        push    si
        callf   SEG_CAA9:far_cace7
        add     sp, 6
        mov     dx, ax
        or      ax, ax
        jz      br_bd579
        pop     si
        leave
        retf
br_bd579:
        mov     ax, word ptr [bp + 18h]
        mov     dx, word ptr [bp + 16h]
        sub     dx, word ptr [bp - 0ch]
        sbb     ax, word ptr [bp - 0ah]
        mov     word ptr [bp - 0eh], ax
        mov     word ptr [bp - 10h], dx
        push    ax
        push    dx
        mov     ax, word ptr [bp + 14h]
        mov     dx, word ptr [bp + 12h]
        add     dx, word ptr [bp - 0ch]
        adc     ax, word ptr [bp - 0ah]
        push    ax
        push    dx
        push    si
        callf   SEG_D8B9:far_d938a
        add     sp, 0ah
        mov     dx, ax
        or      ax, ax
        jge     br_bd5ad
        pop     si
        leave
        retf
br_bd5ad:
        xor     ax, ax
        pop     si
        leave
        retf
fn_bd5b2:
        push    bp
        mov     bp, sp
        sub     sp, 1ah
        callf   SEG_B1AA:far_b1af9
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx + 0bh], 0
        jz      br_bd5cc
        mov     ax, 10h
        jmp     br_bd5cf
br_bd5cc:
        mov     ax, 8
br_bd5cf:
        mov     word ptr [bp - 2], ax
        mov     bx, word ptr [bp - 2]
        mov     es, word ptr [bp + 8]
        add     bx, word ptr [bp + 6]
        mov     al, byte ptr [bp + 0ah]
        add     al, 30h
        mov     byte ptr es:[bx + 2], al
        push    25h
        push    3
        push    66h
        callf   SEG_B3B9:far_b3cdb
        add     sp, 6
        push    6
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ss
        lea     ax, [bp - 1ah]
        push    ax
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_B52D:far_b6beb
        add     sp, 8
        push    ss
        lea     ax, [bp - 1ah]
        push    ax
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    6
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        push    3dh
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        push    1
        callf   SEG_EBCC:far_ebda4
        add     sp, 2
        mov     word ptr [bp - 4], ax
        callf   SEG_B1AA:far_b1aff
        mov     ax, word ptr [bp - 4]
        leave
        retf
        if      FW_VERSION >= 312
        phase   0dh
fn_bd64d:
        push    bp
        mov     bp, sp
        push    15h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    11h
        push    20h
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        push    15h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    ds
        push    word STR_42BF+1
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        pop     bp
        retf
        elseif  FW_VERSION = 311
        phase   2
fn_bd64d:
        push    bp
        mov     bp, sp
        push    15h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    11h
        push    20h
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        push    15h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    ds
        push    word STR_42BF+1
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        pop     bp
        retf
        else
        phase   5
        endif
far_bd688:
        push    bp
        mov     bp, sp
        sub     sp, 16h
        mov     byte ptr [B_D5DD], 64h
        push    ds
        push    word STR_42C4
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        if      FW_VERSION >= 311
        push    1
        else
        push    2
        endif
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        callf   SEG_E600:far_e6006
        mov     byte ptr [bp - 3], al
        push    0ah
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 3]
        push    ax
        push    ds
        if      FW_VERSION >= 312
        push    word STR_42E0
        elseif  FW_VERSION = 311
        push    word STR_42E0
        else
        push    word STR_3DD8_V308
        endif
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        push    0ffffh
        mov     al, byte ptr [bp - 3]
        cbw
        push    ax
        callf   SEG_E4D1:far_e4d15
        add     sp, 8
        if      FW_VERSION < 311
        push    10h
        endif
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        if      FW_VERSION >= 311
        push    cs
        call    fn_bd64d
        add     sp, 4
        else
        push    ds
        push    word P_3DED_V308
        callf   SEG_B347:far_b3471
        add     sp, 0ah
        endif
        callf   SEG_B702:far_b90dd
        push    ds
        push    word A_42F4
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_bd727
loop_bd6ff:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        if      FW_VERSION >= 311
        jnz     br_bd727
        else
        jz      L_c6df2
        cmp     ax, 1
        jz      L_c6e12
        jmp     br_bd727
L_c6df2:
        endif
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        push    0ffffh
        mov     al, byte ptr [bp - 3]
        cbw
        push    ax
        callf   SEG_E4D1:far_e4d15
        add     sp, 8
        if      FW_VERSION < 311
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_bd727
L_c6e12:
        endif
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        if      FW_VERSION >= 311
        push    cs
        call    fn_bd64d
        add     sp, 4
        else
        push    0ffffh
        mov     al, byte ptr [bp - 3]
        cbw
        push    ax
        callf   SEG_E57C:far_e57c8
        add     sp, 8
        endif
br_bd727:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_bd6ff
        cmp     dx, 78h
        jz      br_bd73e
        leave
        retf
br_bd73e:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_42FC
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    3
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_D838:far_d8388
        add     sp, 0ah
        mov     dx, ax
        or      ax, ax
        jz      br_bd780
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        leave
        retf
br_bd780:
        cmp     word ptr [bp - 2], 3
        jge     br_bd79b
        push    ds
        push    word STR_430C
        nop
        push    cs
        call    fn_bd7ce
        add     sp, 4
        mov     dx, ax
        cmp     ax, 78h
        jz      br_bd79b
        leave
        retf
br_bd79b:
        inc     byte ptr [B_956A]
        mov     al, byte ptr [bp - 3]
        cbw
        push    ax
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_D838:far_d8444
        add     sp, 6
        mov     dx, ax
        or      ax, ax
        jz      br_bd7c1
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
br_bd7c1:
        callf   SEG_D78B:far_d7903
        dec     byte ptr [B_956A]
        xor     ax, ax
        leave
        retf
fn_bd7ce:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word P_4320
        elseif  FW_VERSION = 311
        push    word P_4320
        else
        push    word P_4320
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_43DE
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
loop_bd80c:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        or      ax, ax
        jz      loop_bd80c
        cmp     si, 78h
        jz      br_bd824
        pop     si
        leave
        retf
br_bd824:
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    ds
        push    word STR_43EC
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     byte ptr [bp - 3], 0
        push    4
        push    ds
        push    word P_0370+8
        push    ss
        lea     ax, [bp - 3]
        push    ax
        push    ds
        push    word STR_4463
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0fh
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_446E
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     al, byte ptr [bp - 3]
        cbw
        shl     ax, 2
        mov     bx, ax
        push    word ptr [bx + 276h]
        push    word ptr [bx + 274h]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        push    word A_42DE
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     byte ptr [bp - 3], 0
        jnz     br_bd8c4
        mov     al, byte ptr [bp - 3]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_83D1]
        cbw
        mov     word ptr [bp - 2], ax
        jmp     br_bd8d2
br_bd8c4:
        mov     al, byte ptr [bp - 3]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_83D3]
        cbw
        mov     word ptr [bp - 2], ax
br_bd8d2:
        push    8
        push    62h
        push    23h
        push    2
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ds
        push    word STR_4470
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    10h
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_447E
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    1ah
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     bx, word ptr [bp - 2]
        shl     bx, 2
        push    word ptr [bx + 3feh]
        push    word ptr [bx + 3fch]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_42F4
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_bda2b
br_bd945:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jz      br_bd958
        cmp     ax, 1
        jnz     br_bd955
        jmp     near br_bd9e7
br_bd955:
        jmp     br_bda2b
br_bd958:
        push    0fh
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_446E
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     al, byte ptr [bp - 3]
        cbw
        shl     ax, 2
        mov     bx, ax
        push    word ptr [bx + 276h]
        push    word ptr [bx + 274h]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        push    word A_42DE
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        cmp     byte ptr [bp - 3], 0
        jnz     br_bd9ab
        mov     al, byte ptr [bp - 3]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_83D1]
        cbw
        mov     word ptr [bp - 2], ax
        jmp     br_bd9b9
br_bd9ab:
        mov     al, byte ptr [bp - 3]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_83D3]
        cbw
        mov     word ptr [bp - 2], ax
br_bd9b9:
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    1ah
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     bx, word ptr [bp - 2]
        shl     bx, 2
        push    word ptr [bx + 3feh]
        push    word ptr [bx + 3fch]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_bda2b
br_bd9e7:
        cmp     byte ptr [bp - 3], 0
        jnz     br_bd9fc
        mov     al, byte ptr [bp - 3]
        cbw
        mov     dl, byte ptr [bp - 2]
        mov     bx, ax
        mov     byte ptr [bx + TBL_83D1], dl
        jmp     br_bda09
br_bd9fc:
        mov     al, byte ptr [bp - 3]
        cbw
        mov     dl, byte ptr [bp - 2]
        mov     bx, ax
        mov     byte ptr [bx + TBL_83D3], dl
br_bda09:
        push    1ah
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     bx, word ptr [bp - 2]
        shl     bx, 2
        push    word ptr [bx + 3feh]
        push    word ptr [bx + 3fch]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_bda2b:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        or      ax, ax
        jnz     br_bda3e
        jmp     br_bd945
br_bda3e:
        cmp     si, 78h
        jz      br_bda46
        pop     si
        leave
        retf
br_bda46:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_42FC
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     ax, si
        pop     si
        leave
        retf
far_bda63:
        push    bp
        mov     bp, sp
        sub     sp, 0ah
        push    si
        mov     byte ptr [B_D5DD], 65h
        push    ds
        push    word STR_4495
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word STR_44A3
        elseif  FW_VERSION = 311
        push    word STR_44A3
        else
        push    word STR_44A3
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    0
        push    2
        push    ss
        lea     ax, [bp - 3]
        push    ax
        callf   SEG_EBCC:far_ebcce
        add     sp, 8
        mov     dx, ax
        or      ax, ax
        jz      br_bdab2
        pop     si
        leave
        retf
br_bdab2:
        cmp     byte ptr [bp - 3], 1
        jz      br_bdabb
        jmp     near br_bdb6c
br_bdabb:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_44CF
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_CAA9:far_caade
        add     sp, 4
        mov     si, ax
        or      ax, ax
        jge     br_bdb01
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     si
        leave
        retf
br_bdb01:
        push    6
        push    si
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jz      br_bdb28
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     si
        leave
        retf
br_bdb28:
        push    si
        callf   SEG_CAA9:far_cab20
        add     sp, 2
        cmp     byte ptr [bp - 0ah], 4
        jnz     br_bdb3d
        cmp     byte ptr [bp - 9], 3
        jle     br_bdb5a
br_bdb3d:
        cmp     byte ptr [bp - 0ah], 3
        jnz     br_bdb49
        cmp     byte ptr [bp - 9], 1
        jz      br_bdb5a
br_bdb49:
        push    0ffe0h
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     si
        leave
        retf
br_bdb5a:
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    fn_be1ab
        add     sp, 4
        mov     dx, ax
        jmp     br_bdb7c
br_bdb6c:
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    fn_bde5d
        add     sp, 4
        mov     dx, ax
br_bdb7c:
        mov     ax, dx
        pop     si
        leave
        retf
fn_bdb81:
        push    bp
        mov     bp, sp
        sub     sp, 24h
        push    si
        push    di
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_CAA9:far_caade
        add     sp, 4
        mov     word ptr [bp - 8], ax
        or      ax, ax
        jge     br_bdbac
        pop     di
        pop     si
        leave
        retf
br_bdbac:
        push    6
        push    word ptr [bp - 8]
        push    ss
        lea     ax, [bp - 6]
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     dx, ax
        or      ax, ax
        jz      br_bdbc8
        pop     di
        pop     si
        leave
        retf
br_bdbc8:
        mov     al, byte ptr [bp - 5]
        cbw
        les     bx, dword ptr [bp + 0eh]
        mov     word ptr es:[bx], ax
        cmp     byte ptr [bp - 5], 3
        jnz     br_bdbdf
        mov     word ptr [bp - 1ah], 151h
        jmp     br_bdbe4
br_bdbdf:
        mov     word ptr [bp - 1ah], 0cah
br_bdbe4:
        mov     word ptr [bp - 12h], 0
        mov     word ptr [bp - 14h], 6
br_bdbee:
        push    1
        push    word ptr [bp - 8]
        push    ds
        push    word TBL_F779
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     dx, ax
        or      dx, dx
        jz      br_bdc09
        pop     di
        pop     si
        leave
        retf
br_bdc09:
        cmp     byte ptr [TBL_F779], 0ffh
        jnz     br_bdc13
        jmp     br_bde10
br_bdc13:
        mov     ax, word ptr [bp - 1ah]
        dec     ax
        push    ax
        push    word ptr [bp - 8]
        push    ds
        push    word TBL_F77A
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     dx, ax
        or      dx, dx
        jz      br_bdc31
        pop     di
        pop     si
        leave
        retf
br_bdc31:
        cmp     byte ptr [bp - 5], 3
        jnz     br_bdcae
        mov     word ptr [bp - 20h], ds
        mov     word ptr [bp - 22h], TBL_F779
        les     bx, dword ptr [bp - 22h]
        mov     ax, word ptr es:[bx + 3]
        mov     dx, word ptr es:[bx + 1]
        mov     word ptr [bp - 0eh], ax
        mov     word ptr [bp - 10h], dx
        mov     al, byte ptr es:[bx + 150h]
        cbw
        mov     word ptr [bp - 16h], ax
        mov     al, byte ptr es:[bx + 14fh]
        cbw
        mov     word ptr [bp - 18h], ax
        mov     al, byte ptr es:[bx]
        cbw
        mov     word ptr [bp - 24h], ax
        cmp     word ptr [bp - 24h], 64h
        jc      br_bdc74
        mov     word ptr [bp - 24h], 1
br_bdc74:
        mov     ax, word ptr [bp - 24h]
        mov     dx, 17h
        imul    dx
        mov     dx, word ptr [bp + 0ch]
        mov     si, word ptr [bp + 0ah]
        add     si, ax
        les     di, dword ptr [bp - 22h]
        add     di, 9
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        push    ds
        mov     ds, dx
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        jmp     near br_bdd3a
br_bdcae:
        mov     word ptr [bp - 1ch], ds
        mov     word ptr [bp - 1eh], TBL_F779
        les     bx, dword ptr [bp - 1eh]
        mov     ax, word ptr es:[bx + 3]
        mov     dx, word ptr es:[bx + 1]
        and     dx, 0ffffh
        and     ax, 0ffh
        mov     word ptr [bp - 0eh], ax
        mov     word ptr [bp - 10h], dx
        mov     al, byte ptr es:[bx + 0c9h]
        cbw
        mov     word ptr [bp - 16h], ax
        mov     al, byte ptr es:[bx + 0c8h]
        cbw
        mov     word ptr [bp - 18h], ax
        mov     al, byte ptr es:[bx]
        cbw
        mov     word ptr [bp - 24h], ax
        cmp     word ptr [bp - 24h], 64h
        jc      br_bdcf1
        mov     word ptr [bp - 24h], 1
br_bdcf1:
        mov     ax, word ptr [bp - 24h]
        mov     dx, 17h
        imul    dx
        mov     dx, word ptr [bp + 0ch]
        mov     si, word ptr [bp + 0ah]
        add     si, ax
        les     di, dword ptr [bp - 1eh]
        add     di, 7
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        push    ds
        mov     ds, dx
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        mov     ax, word ptr [bp - 24h]
        mov     dx, 17h
        imul    dx
        les     bx, dword ptr [bp + 0ah]
        add     bx, ax
        mov     byte ptr es:[bx + 10h], 0
br_bdd3a:
        cmp     byte ptr [bp - 5], 1
        jnz     br_bdd64
        mov     ax, word ptr [bp - 16h]
        cwd
        push    ax
        push    dx
        xor     dx, dx
        mov     ax, 15h
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        mov     bx, word ptr [bp - 0eh]
        mov     cx, word ptr [bp - 10h]
        add     cx, ax
        adc     bx, dx
        mov     word ptr [bp - 0ah], bx
        mov     word ptr [bp - 0ch], cx
        jmp     br_bdd86
br_bdd64:
        mov     ax, word ptr [bp - 16h]
        cwd
        push    ax
        push    dx
        xor     dx, dx
        mov     ax, 18h
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        mov     bx, word ptr [bp - 0eh]
        mov     cx, word ptr [bp - 10h]
        add     cx, ax
        adc     bx, dx
        mov     word ptr [bp - 0ah], bx
        mov     word ptr [bp - 0ch], cx
br_bdd86:
        mov     ax, word ptr [bp - 18h]
        cwd
        push    ax
        push    dx
        xor     dx, dx
        mov     ax, 6
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        add     word ptr [bp - 0ch], ax
        adc     word ptr [bp - 0ah], dx
        push    0
        push    word 400h
        mov     ax, word ptr [bp - 1ah]
        cwd
        add     ax, word ptr [bp - 0ch]
        adc     dx, word ptr [bp - 0ah]
        add     ax, 3ffh
        adc     dx, 0
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        push    ax
        mov     ax, word ptr [bp - 24h]
        mov     dx, 17h
        imul    dx
        mov     dx, ax
        les     bx, dword ptr [bp + 0ah]
        add     bx, ax
        pop     ax
        mov     word ptr es:[bx + 11h], ax
        mov     bx, word ptr [bp + 0ah]
        add     bx, dx
        mov     ax, word ptr [bp - 12h]
        mov     dx, word ptr [bp - 14h]
        mov     word ptr es:[bx + 15h], ax
        mov     word ptr es:[bx + 13h], dx
        mov     ax, word ptr [bp - 1ah]
        cwd
        add     ax, word ptr [bp - 0ch]
        adc     dx, word ptr [bp - 0ah]
        add     word ptr [bp - 14h], ax
        adc     word ptr [bp - 12h], dx
        push    word ptr [bp - 12h]
        push    word ptr [bp - 14h]
        push    word ptr [bp - 8]
        callf   SEG_CAA9:far_cace7
        add     sp, 6
        mov     dx, ax
        or      dx, dx
        jnz     br_bde0c
        jmp     br_bdbee
br_bde0c:
        pop     di
        pop     si
        leave
        retf
br_bde10:
        mov     ax, word ptr [bp - 8]
        pop     di
        pop     si
        leave
        retf
fn_bde17:
        push    bp
        mov     bp, sp
        push    0bh
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    2dh
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    1fh
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        les     bx, dword ptr [bp + 6]
        push    word ptr es:[bx + 11h]
        push    ds
        push    word STR_44EE
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
        pop     bp
        retf
fn_bde5d:
        push    bp
        mov     bp, sp
        sub     sp, 902h
        push    si
        push    di
        mov     byte ptr [B_D5DD], 6fh
        push    ds
        push    word A_44F8
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_4516
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     word ptr [bp - 2], 0
        xor     dx, dx
loop_bde8f:
        push    ss
        pop     es
        lea     ax, [bp - 902h]
        mov     di, dx
        add     di, ax
        mov     si, STR_452B
        mov     cx, 4
        rep movsw
        movsb
        mov     bx, dx
        lea     ax, [bp - 8f1h]
        add     bx, ax
        mov     word ptr ss:[bx], 0
        mov     bx, dx
        lea     ax, [bp - 8efh]
        add     bx, ax
        mov     word ptr ss:[bx + 2], 0
        mov     word ptr ss:[bx], 0
        add     dx, 17h
        inc     word ptr [bp - 2]
        cmp     dx, 8fch
        jnz     loop_bde8f
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ss
        lea     ax, [bp - 902h]
        push    ax
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    cs
        call    fn_bdb81
        add     sp, 0ch
        mov     di, ax
        or      di, di
        jge     br_bdf06
        push    ax
        callf   SEG_CAA9:far_cab20
        add     sp, 2
        push    di
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_bdf06:
        mov     byte ptr [bp - 6], 1
        xor     si, si
        jmp     br_be0bf
br_bdf0f:
        push    ds
        push    word A_44F8
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0ah
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word STR_4534
        callf   SEG_B347:far_b3819
        add     sp, 10h
        mov     al, byte ptr [bp - 6]
        cbw
        mov     dx, 17h
        imul    dx
        lea     dx, [bp - 902h]
        add     ax, dx
        push    ss
        push    ax
        push    cs
        call    fn_bde17
        add     sp, 4
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        callf   SEG_E600:far_e6006
        mov     byte ptr [bp - 5], al
        push    0ah
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 5]
        push    ax
        push    ds
        push    word STR_453E
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0bh
        push    2
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        callf   SEG_B702:far_b8f3e
        add     sp, 6
        push    1fh
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0
        push    word 400h
        callf   SEG_E2CE:far_e2ce3
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        mov     dx, ax
        push    ax
        push    ds
        push    word STR_4548
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
        callf   SEG_B702:far_b9102
        jmp     br_bdff5
loop_bdfbb:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jz      br_bdfca
        cmp     ax, 1
        jz      br_bdfe4
        jmp     br_bdff5
br_bdfca:
        mov     al, byte ptr [bp - 6]
        cbw
        mov     dx, 17h
        imul    dx
        lea     dx, [bp - 902h]
        add     ax, dx
        push    ss
        push    ax
        push    cs
        call    fn_bde17
        add     sp, 4
        jmp     br_bdff5
br_bdfe4:
        push    0bh
        push    2
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        callf   SEG_B702:far_b8f3e
        add     sp, 6
br_bdff5:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        or      ax, ax
        jz      loop_bdfbb
        cmp     si, 78h
        jz      br_be00d
        jmp     near br_be0bf
br_be00d:
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 6]
        cbw
        mov     dx, 17h
        imul    dx
        lea     dx, [bp - 8efh]
        add     ax, dx
        mov     bx, ax
        mov     ax, word ptr ss:[bx]
        or      ax, word ptr ss:[bx + 2]
        jnz     br_be02a
        jmp     near br_be0bd
br_be02a:
        endif
        cmp     word ptr [bp - 4], 3
        jge     br_be046
        push    ds
        push    word A_44F8
        push    cs
        call    fn_bd7ce
        add     sp, 4
        mov     si, ax
        cmp     ax, 78h
        jz      br_be046
        pop     di
        pop     si
        leave
        retf
br_be046:
        inc     byte ptr [B_956A]
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_4552
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        mov     al, byte ptr [bp - 6]
        cbw
        mov     dx, 17h
        imul    dx
        lea     dx, [bp - 8efh]
        add     ax, dx
        mov     bx, ax
        push    word ptr ss:[bx + 2]
        push    word ptr ss:[bx]
        push    word ptr [bp - 4]
        push    di
        nop
        push    cs
        call    fn_be0d5
        add     sp, 0ah
        mov     si, ax
        or      ax, ax
        jz      br_be0af
        push    di
        callf   SEG_CAA9:far_cab20
        add     sp, 2
        push    si
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        if      FW_VERSION >= 311
        dec     byte ptr [B_956A]
        endif
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_be0af:
        callf   SEG_D78B:far_d7903
        dec     byte ptr [B_956A]
        callf   SEG_B702:far_b9102
br_be0bd:
        xor     si, si
br_be0bf:
        or      si, si
        jnz     br_be0c6
        jmp     br_bdf0f
br_be0c6:
        push    di
        callf   SEG_CAA9:far_cab20
        add     sp, 2
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
fn_be0d5:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 48h
        else
        sub     sp, 8
        endif
        push    si
        push    di
        mov     di, word ptr [bp + 6]
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    di
        callf   SEG_CAA9:far_cace7
        add     sp, 6
        mov     si, ax
        or      ax, ax
        jz      br_be0f9
        pop     di
        pop     si
        leave
        retf
br_be0f9:
        mov     al, byte ptr [B_8A9F]
        cbw
        mov     word ptr [bp - 2], ax
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    ds
        push    word B_8C41
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    word ptr [bp + 0eh]
        callf   SEG_E1E1:far_e1e11
        add     sp, 2
        mov     al, byte ptr [bp + 0eh]
        push    ax
        callf   SEG_E259:far_e259f
        add     sp, 2
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 48h]
        push    ax
        push    ss
        endif
        lea     ax, [bp - 4]
        push    ax
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    0
        push    word ptr [bp + 8]
        push    di
        callf   SEG_D838:far_d85fa
        if      FW_VERSION >= 311
        add     sp, 12h
        else
        add     sp, 0eh
        endif
        mov     si, ax
        or      ax, ax
        jz      br_be15a
        mov     ax, word ptr [bp - 2]
        mov     word ptr [bp + 0eh], ax
        jmp     br_be164
br_be15a:
        les     bx, dword ptr [W_8C35]
        mov     al, byte ptr [bp + 0eh]
        mov     byte ptr es:[bx], al
br_be164:
        push    word ptr [bp + 0eh]
        callf   SEG_E344:far_e392e
        add     sp, 2
        cmp     word ptr [bp + 8], 2
        jg      br_be185
        if      FW_VERSION >= 311
        push    ss
        lea     ax, [bp - 48h]
        push    ax
        endif
        push    word ptr [bp + 0eh]
        callf   SEG_E546:far_e546f
        if      FW_VERSION >= 311
        add     sp, 6
        else
        add     sp, 2
        endif
br_be185:
        push    1
        push    word ptr [bp + 0eh]
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        callf   SEG_DEEA:far_deeab
        or      byte ptr [B_955B], 40h
        or      byte ptr [B_955C], 80h
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
fn_be1ab:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    si
        push    di
        mov     byte ptr [B_D5DD], 6eh
        push    ds
        push    word STR_4566
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word STR_4585
        elseif  FW_VERSION = 311
        push    word STR_4585
        else
        push    word STR_4585
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    ds
        push    word A_42F4
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     word ptr [bp - 2], ax
        cmp     word ptr [bp - 2], 78h
        jz      br_be204
        pop     di
        pop     si
        leave
        retf
br_be204:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_45C2
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    4
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_D838:far_d8388
        add     sp, 0ah
        mov     word ptr [bp - 4], ax
        or      ax, ax
        jz      br_be249
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_be249:
        cmp     word ptr [bp - 6], 3
        jge     br_be266
        push    ds
        push    word STR_45CE
        push    cs
        call    fn_bd7ce
        add     sp, 4
        mov     word ptr [bp - 2], ax
        cmp     ax, 78h
        jz      br_be266
        pop     di
        pop     si
        leave
        retf
br_be266:
        inc     byte ptr [B_956A]
        mov     word ptr [bp - 2], 0
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        if      FW_VERSION <> 311
        callf   SEG_D7B9:far_d7b9c
        else
        callf   SEG_D7B8:far_d7b9c
        endif
        add     sp, 4
        mov     word ptr [bp - 4], ax
        cmp     word ptr [bp - 4], 0
        jge     br_be289
        jmp     near br_be33c
br_be289:
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx + 0bh], 0
        jz      br_be298
        mov     ax, 10h
        jmp     br_be29b
br_be298:
        mov     ax, 8
br_be29b:
        mov     word ptr [bp - 8], ax
        push    ds
        pop     es
        mov     di, TBL_9419
        push    es
        mov     es, word ptr [bp + 8]
        push    di
        mov     di, word ptr [bp + 6]
        mov     dx, word ptr [bp - 8]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        mov     ax, word ptr [bp + 8]
        mov     si, word ptr [bp + 6]
        pop     di
        pop     es
        push    ds
        mov     ds, ax
        sub     dx, cx
        jnc     br_be2cc
        add     cx, dx
        xor     dx, dx
br_be2cc:
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        mov     cx, dx
        xor     ax, ax
        rep stosb
        pop     ds
        mov     bx, word ptr [bp - 8]
        mov     byte ptr [bx + TBL_9419], 0
        cmp     word ptr [bp - 4], 0
        jle     br_be347
        push    ds
        push    word STR_45E2
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        mov     ax, word ptr [bp - 4]
        dec     ax
        push    ax
        push    ds
        if      FW_VERSION >= 312
        push    word P_45FB
        elseif  FW_VERSION = 311
        push    word P_45FB
        else
        push    word P_45FB
        endif
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_46D8
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
loop_be31e:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jz      loop_be31e
        cmp     word ptr [bp - 2], 78h
        jnz     br_be347
        mov     word ptr [bp - 2], 0
        jmp     br_be347
br_be33c:
        push    word ptr [bp - 4]
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
br_be347:
        callf   SEG_D78B:far_d7903
        dec     byte ptr [B_956A]
        mov     ax, word ptr [bp - 2]
        pop     di
        pop     si
        leave
        retf
        if      FW_VERSION >= 312
        phase   7
        elseif  FW_VERSION = 311
        phase   0ch
        else
        phase   0bh
        endif
far_be357:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 312
        sub     sp, 0b36h
        else
        sub     sp, 0b3ch
        endif
        push    si
        push    di
        mov     word ptr [bp - 8], 0
        mov     word ptr [bp - 0ah], 0
        cmp     byte ptr [bp + 0ah], 0
        jz      br_be373
        if      FW_VERSION <> 311
        jmp     L_be509
        else
        jmp     br_be4c2
        endif
br_be373:
        mov     byte ptr [B_D5DD], 66h
        callf   SEG_B1AA:far_b1aac
        push    ds
        push    word STR_4703
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_E421]
        inc     al
        mov     byte ptr [bp + 0ah], al
        push    8
        push    18h
        push    1
        push    2
        push    ss
        lea     ax, [bp + 0ah]
        push    ax
        push    ds
        push    word STR_4712
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    ss
        pop     es
        if      FW_VERSION >= 312
        lea     di, [bp - 20h]
        else
        lea     di, [bp - 26h]
        endif
        push    es
        mov     es, word ptr [W_E40E]
        push    di
        mov     di, word ptr [FP_E40C]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, word ptr [W_E40E]
        mov     si, word ptr [FP_E40C]
        pop     di
        pop     es
        push    ds
        mov     ds, ax
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        push    10h
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 20h]
        else
        lea     ax, [bp - 26h]
        endif
        push    ax
        push    ds
        if      FW_VERSION >= 312
        push    word P_4728
        elseif  FW_VERSION = 311
        push    word P_4728
        else
        push    word P_4728
        endif
        callf   SEG_B347:far_b3471
        add     sp, 0ah
        if      FW_VERSION >= 312
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0ah
        push    ds
        push    word P_46DF+1
        push    ds
        push    word B_843B
        push    ds
        push    word STR_472A
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_4749
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        elseif  FW_VERSION = 311
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0ah
        push    ds
        push    word P_4697_V311+1
        push    ds
        push    word B_843B
        push    ds
        push    word STR_46E2_V311
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        else
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_4203_V308
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        endif
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word STR_4797
        elseif  FW_VERSION = 311
        push    word STR_4701_V311
        else
        push    word L_424E_V308
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     near br_be4d9
br_be452:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jz      br_be461
        cmp     ax, 1
        jz      br_be4aa
        jmp     short br_be4d9
br_be461:
        mov     al, byte ptr [bp + 0ah]
        cbw
        dec     ax
        push    ax
        callf   SEG_C495:far_c6547
        add     sp, 2
        push    ss
        pop     es
        if      FW_VERSION >= 312
        lea     di, [bp - 20h]
        else
        lea     di, [bp - 26h]
        endif
        push    es
        mov     es, word ptr [W_E40E]
        push    di
        mov     di, word ptr [FP_E40C]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, word ptr [W_E40E]
        mov     si, word ptr [FP_E40C]
        pop     di
        pop     es
        push    ds
        mov     ds, ax
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_be4d9
br_be4aa:
        push    ss
        pop     es
        if      FW_VERSION >= 312
        lea     di, [bp - 20h]
        else
        lea     di, [bp - 26h]
        endif
        mov     ax, word ptr [W_E40E]
        mov     si, word ptr [FP_E40C]
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
br_be4d9:
        if      FW_VERSION >= 312
        push    2
        else
        push    1
        endif
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jnz     br_be4ec
        jmp     near br_be452
br_be4ec:
        cmp     dx, 78h
        if      FW_VERSION >= 312
        jz      L_be4fa
        cmp     dx, 79h
        jz      L_be4fa
        elseif  FW_VERSION = 311
        jz      br_be4c2
        else
        jz      L_be509
        endif
        pop     di
        pop     si
        leave
        retf
        if      FW_VERSION >= 312
L_be4fa:
        cmp     dx, 79h
        jnz     L_be509
        callf   SEG_CB18:far_cb23d
        callf   SEG_CC84:far_cd4d6
L_be509:
        elseif  FW_VERSION = 311
br_be4c2:
        else
L_be509:
        endif
        mov     al, byte ptr [bp + 0ah]
        cbw
        dec     ax
        push    ax
        callf   SEG_C495:far_c6547
        add     sp, 2
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 36h]
        else
        lea     ax, [bp - 3ch]
        endif
        push    ax
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_B52D:far_b6beb
        add     sp, 8
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 36h]
        else
        lea     ax, [bp - 3ch]
        endif
        push    ax
        push    ds
        push    word A_47AC
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_CAA9:far_caade
        add     sp, 4
        mov     word ptr [bp - 4], ax
        or      ax, ax
        jge     br_be581
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_be581:
        push    2
        push    word ptr [bp - 4]
        push    ss
        lea     ax, [bp - 2]
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        if      FW_VERSION >= 312
        mov     si, ax
        else
        mov     dx, ax
        endif
        or      ax, ax
        jge     br_be5aa
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_be5aa:
        cmp     byte ptr [bp - 2], 7
        jz      br_be5c2
        push    0ffdfh
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_be5c2:
        cmp     byte ptr [bp - 1], 0
        jbe     br_be5da
        push    0ffe0h
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_be5da:
        push    word 880h
        push    word ptr [bp - 4]
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 8b6h]
        else
        lea     ax, [bp - 8bch]
        endif
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        if      FW_VERSION >= 312
        mov     si, ax
        else
        mov     dx, ax
        endif
        or      ax, ax
        jz      br_be605
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_be605:
        push    word 200h
        push    word ptr [bp - 4]
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 0ab6h]
        else
        lea     ax, [bp - 0abch]
        endif
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        if      FW_VERSION >= 312
        mov     si, ax
        else
        mov     dx, ax
        endif
        or      ax, ax
        jz      br_be630
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_be630:
        push    ss
        pop     es
        if      FW_VERSION >= 312
        lea     di, [bp - 0b36h]
        else
        lea     di, [bp - 0b3ch]
        endif
        xor     ax, ax
        mov     ah, al
        mov     cx, 40h
        rep stosw
        xor     si, si
        if      FW_VERSION >= 312
        lea     di, [bp - 8b6h]
        lea     ax, [bp - 0ab6h]
        mov     word ptr [bp - 0ch], ax
        else
        lea     di, [bp - 8bch]
        lea     ax, [bp - 0abch]
        mov     word ptr [bp - 12h], ax
        endif
loop_be64c:
        cmp     byte ptr ss:[di], 0
        jz      br_be683
        push    ss
        push    di
        callf   SEG_CC84:far_cd551
        add     sp, 4
        or      ax, ax
        if      FW_VERSION >= 312
        jl      br_be66e
        cmp     byte ptr [B_843B], 1
        jnz     br_be683
        mov     byte ptr [bp+si - 0b36h], 1
        jmp     br_be683
br_be66e:
        mov     byte ptr [bp+si - 0b36h], 1
        mov     bx, word ptr [bp - 0ch]
        elseif  FW_VERSION = 311
        jl      br_be66e
        cmp     byte ptr [B_843B], 1
        jnz     br_be683
        mov     byte ptr [bp+si - 0b3ch], 1
        jmp     br_be683
br_be66e:
        mov     byte ptr [bp+si - 0b3ch], 1
        mov     bx, word ptr [bp - 12h]
        else
        jge     br_be683
        mov     byte ptr [bp+si - 0b3ch], 1
        mov     bx, word ptr [bp - 12h]
        endif
        mov     ax, word ptr ss:[bx + 2]
        mov     dx, word ptr ss:[bx]
        add     word ptr [bp - 0ah], dx
        adc     word ptr [bp - 8], ax
br_be683:
        add     di, 11h
        if      FW_VERSION >= 312
        add     word ptr [bp - 0ch], 4
        else
        add     word ptr [bp - 12h], 4
        endif
        inc     si
        cmp     si, 80h
        jl      loop_be64c
        callf   SEG_CC84:far_cca70
        cmp     dx, word ptr [bp - 8]
        jg      br_be6b4
        jl      br_be6a2
        cmp     ax, word ptr [bp - 0ah]
        jnc     br_be6b4
br_be6a2:
        push    2
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_be6b4:
        push    word 77eh
        push    word ptr [bp - 4]
        push    word ptr [W_E40E]
        push    word ptr [FP_E40C]
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        if      FW_VERSION >= 312
        mov     si, ax
        else
        mov     dx, ax
        endif
        or      ax, ax
        jz      br_be6e1
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_be6e1:
        mov     word ptr [bp - 6], 0
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 20h]
        else
        lea     ax, [bp - 26h]
        endif
        push    ax
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_B52D:far_b6beb
        add     sp, 8
        xor     si, si
loop_be6fb:
        if      FW_VERSION >= 312
        lea     ax, [bp - 20h]
        else
        lea     ax, [bp - 26h]
        endif
        mov     bx, si
        add     bx, ax
        mov     di, bx
        cmp     byte ptr ss:[bx], 2eh
        jz      br_be710
        cmp     word ptr [bp - 6], 1
        jnz     br_be719
br_be710:
        mov     byte ptr ss:[di], 20h
        mov     word ptr [bp - 6], 1
br_be719:
        inc     si
        cmp     si, 10h
        jl      loop_be6fb
        if      FW_VERSION >= 312
        mov     byte ptr [bp - 10h], 0
        else
        mov     byte ptr [bp - 16h], 0
        endif
        push    ss
        pop     es
        if      FW_VERSION >= 312
        lea     di, [bp - 20h]
        else
        lea     di, [bp - 26h]
        endif
        mov     ax, word ptr [W_E40E]
        mov     si, word ptr [FP_E40C]
        mov     dx, 11h
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        sub     dx, cx
        jnc     br_be754
        add     cx, dx
        xor     dx, dx
br_be754:
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        mov     cx, dx
        xor     ax, ax
        rep stosb
        pop     ds
        push    word ptr [bp - 4]
        callf   SEG_CAA9:far_cab20
        add     sp, 2
        if      FW_VERSION >= 312
        mov     si, ax
        else
        mov     dx, ax
        endif
        or      ax, ax
        jge     br_be785
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_be785:
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 8b6h]
        elseif  FW_VERSION = 311
        pop     es
        lea     di, [bp - 10h]
        mov     si, 4719h
        mov     cx, 2
        rep movsw
        movsb
        xor     si, si
loop_be74e:
        cmp     byte ptr [bp+si - 0b3ch], 0
        jnz     br_be75f
        inc     si
        cmp     si, 80h
        jnz     loop_be74e
        jmp     br_be7c8
br_be75f:
        push    ss
        lea     ax, [bp - 3ch]
        else
        pop     es
        lea     di, [bp - 10h]
        mov     si, 4268h
        mov     cx, 2
        rep movsw
        movsb
        xor     si, si
loop_be74e:
        cmp     byte ptr [bp+si - 0b3ch], 0
        jnz     br_be75f
        inc     si
        cmp     si, 80h
        jnz     loop_be74e
        jmp     near br_be7c8
br_be75f:
        push    ss
        lea     ax, [bp - 3ch]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 0b36h]
        else
        lea     ax, [bp - 10h]
        endif
        push    ax
        if      FW_VERSION >= 312
        push    0
        nop
        push    cs
        call    L_bec2b
        add     sp, 0ah
        mov     si, ax
        elseif  FW_VERSION = 311
        mov     ax, si
        mov     dx, 11h
        imul    dx
        lea     dx, [bp - 8bch]
        add     ax, dx
        push    ss
        push    ax
        callf   SEG_C6D1:far_c812b
        add     sp, 0ch
        cmp     byte ptr [B_843B], 1
        jnz     L_be7c2_v311
        mov     ax, si
        mov     dx, 11h
        imul    dx
        lea     dx, [bp - 8bch]
        add     ax, dx
        push    ss
        push    ax
        callf   SEG_CC84:far_cd551
        add     sp, 4
        mov     di, ax
        or      ax, ax
        jl      L_be7c2_v311
        push    0
        push    0
        push    ax
        callf   SEG_CC84:far_cd353
        add     sp, 6
        callf   SEG_CC84:far_cd063
        mov     dx, ax
        push    ax
        push    di
        nop
        push    cs
        call    L_bec2b
        add     sp, 4
L_be7c2_v311:
        push    ss
        lea     ax, [bp - 3ch]
        push    ax
        callf   SEG_D8B9:far_d8b9c
        add     sp, 4
        mov     dx, ax
        else
        mov     ax, si
        mov     dx, 11h
        imul    dx
        lea     dx, [bp - 8bch]
        add     ax, dx
        push    ss
        push    ax
        callf   SEG_C6D1:far_c812b
        add     sp, 0ch
        push    ss
        lea     ax, [bp - 3ch]
        push    ax
        callf   SEG_D8B9:far_d8b9c
        add     sp, 4
        mov     dx, ax
        endif
        or      ax, ax
        if      FW_VERSION >= 312
        jz      br_be7c8
        or      si, si
        jge     L_be7c2_v312
        elseif  FW_VERSION = 311
        jnz     br_be7e6
        mov     byte ptr [bp+si - 0b3ch], 0
        inc     si
        cmp     si, 80h
        jz      L_be7e4
        jmp     near loop_be74e
L_be7e4:
        jmp     short br_be7c8
br_be7e6:
        or      dx, dx
        jle     br_be803
        jmp     br_be7f2
loop_be7ec:
        mov     byte ptr [bp+si - 0b3ch], 0
        inc     si
br_be7f2:
        cmp     si, 80h
        jl      loop_be7ec
        push    dx
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        jmp     br_be7c8
br_be803:
        cmp     dx, 0fd00h
        jnz     br_be846
        push    ss
        lea     ax, [bp - 3ch]
        push    ax
        nop
        push    cs
        call    fn_beda0
        add     sp, 4
        mov     dx, ax
        cmp     dx, 78h
        jnz     br_be82a
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        jmp     loop_be74e
br_be82a:
        cmp     dx, 79h
        jnz     br_be840
        mov     byte ptr [bp+si - 0b3ch], 0
        inc     si
        cmp     si, 80h
        jz      br_be83e
        jmp     loop_be74e
br_be83e:
        jmp     br_be7c8
br_be840:
        mov     ax, dx
        pop     di
        pop     si
        leave
        retf
br_be846:
        push    dx
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        else
        jnz     br_be7e6
        mov     byte ptr [bp+si - 0b3ch], 0
        inc     si
        cmp     si, 80h
        jnz     loop_be74e
        jmp     short br_be7c8
br_be7e6:
        or      dx, dx
        jle     br_be803
        jmp     br_be7f2
loop_be7ec:
        mov     byte ptr [bp+si - 0b3ch], 0
        inc     si
br_be7f2:
        cmp     si, 80h
        jl      loop_be7ec
        push    dx
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        jmp     br_be7c8
br_be803:
        cmp     dx, 0fd00h
        jnz     br_be846
        push    ss
        lea     ax, [bp - 3ch]
        push    ax
        nop
        push    cs
        call    L_bee4a
        add     sp, 4
        mov     dx, ax
        cmp     dx, 78h
        jnz     br_be82a
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        jmp     near loop_be74e
br_be82a:
        cmp     dx, 79h
        jnz     br_be840
        mov     byte ptr [bp+si - 0b3ch], 0
        inc     si
        cmp     si, 80h
        jz      br_be83e
        jmp     near loop_be74e
br_be83e:
        jmp     br_be7c8
br_be840:
        mov     ax, dx
        pop     di
        pop     si
        leave
        retf
br_be846:
        push    dx
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        endif
        mov     al, byte ptr [bp + 0ah]
        cbw
        dec     ax
        push    ax
        callf   SEG_CB18:far_cb457
        add     sp, 2
        if      FW_VERSION >= 312
        push    si
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        endif
        xor     ax, ax
        if      FW_VERSION >= 312
        pop     di
        pop     si
        leave
        retf
L_be7c2_v312:
        mov     ax, si
        endif
        pop     di
        pop     si
        leave
        retf
br_be7c8:
        xor     si, si
        jmp     br_be82d
loop_be7cc:
        mov     ax, si
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     di, bx
        cmp     byte ptr es:[bx + 3eh], 0ffh
        jz      br_be82c
        mov     es, word ptr [W_E40E]
        mov     al, byte ptr es:[di + 3eh]
        mov     ah, 0
        mov     dx, 11h
        imul    dx
        if      FW_VERSION >= 312
        lea     dx, [bp - 8b6h]
        else
        lea     dx, [bp - 8bch]
        endif
        add     ax, dx
        push    ss
        push    ax
        callf   SEG_CC84:far_cd551
        add     sp, 4
        mov     cx, ax
        or      ax, ax
        jl      br_be81a
        mov     ax, si
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     byte ptr es:[bx + 3eh], cl
        jmp     br_be82c
br_be81a:
        mov     ax, si
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     byte ptr es:[bx + 3eh], 0ffh
br_be82c:
        inc     si
br_be82d:
        cmp     si, 40h
        jl      loop_be7cc
        mov     al, byte ptr [bp + 0ah]
        cbw
        dec     ax
        push    ax
        callf   SEG_C495:far_c6547
        add     sp, 2
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
        if      FW_VERSION = 311
L_bec2b:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        push    di
        mov     al, byte ptr [B_E421]
        mov     ah, 0
        mov     word ptr [bp - 2], ax
        xor     di, di
L_be8f3:
        cmp     di, word ptr [bp - 2]
        jz      L_be929
        push    di
        callf   SEG_C495:far_c6547
        add     sp, 2
        xor     cx, cx
        xor     dx, dx
L_be905:
        les     bx, dword ptr [FP_E40C]
        add     bx, dx
        mov     si, bx
        mov     al, byte ptr es:[bx + 3eh]
        mov     ah, 0
        cmp     ax, word ptr [bp + 6]
        jnz     L_be91f
        mov     al, byte ptr [bp + 8]
        mov     byte ptr es:[si + 3eh], al
L_be91f:
        add     dx, 18h
        inc     cx
        cmp     dx, 600h
        jnz     L_be905
L_be929:
        inc     di
        cmp     di, 18h
        jl      L_be8f3
        push    word ptr [bp - 2]
        callf   SEG_C495:far_c6547
        add     sp, 2
        pop     di
        pop     si
        leave
        retf
        endif
far_be846:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 312
        sub     sp, 938h
        else
        sub     sp, 93eh
        endif
        push    si
        push    di
        cmp     byte ptr [bp + 0ah], 0
        jnz     br_be8b9
        mov     byte ptr [B_D5DD], 67h
        callf   SEG_B1AA:far_b1aac
        push    ds
        push    word STR_47BC
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word STR_47D7
        elseif  FW_VERSION = 311
        push    word STR_47D7
        else
        push    word STR_4288_V308
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word STR_4848
        elseif  FW_VERSION = 311
        push    word STR_4701_V311
        else
        push    word L_424E_V308
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
loop_be8a0:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_be8a0
        cmp     dx, 78h
        jz      br_be8b9
        pop     di
        pop     si
        leave
        retf
br_be8b9:
        callf   SEG_CB18:far_cb23d
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 38h]
        else
        lea     ax, [bp - 3eh]
        endif
        push    ax
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_B52D:far_b6beb
        add     sp, 8
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 38h]
        else
        lea     ax, [bp - 3eh]
        endif
        push    ax
        push    ds
        push    word A_47AC
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_CAA9:far_caade
        add     sp, 4
        mov     word ptr [bp - 6], ax
        or      ax, ax
        jge     br_be928
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_be928:
        push    2
        push    word ptr [bp - 6]
        push    ss
        lea     ax, [bp - 2]
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     di, ax
        or      ax, ax
        jge     br_be951
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_be951:
        cmp     byte ptr [bp - 2], 0ah
        jz      br_be969
        push    0ffdfh
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_be969:
        cmp     byte ptr [bp - 1], 0
        jbe     br_be981
        push    0ffe0h
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_be981:
        push    1
        push    word ptr [bp - 6]
        push    ss
        lea     ax, [bp - 3]
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     di, ax
        or      ax, ax
        jge     br_be9aa
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_be9aa:
        push    4
        push    word ptr [bp - 6]
        push    ss
        lea     ax, [bp - 0eh]
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     di, ax
        or      ax, ax
        jz      br_be9d3
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_be9d3:
        callf   SEG_CC84:far_cca70
        cmp     dx, word ptr [bp - 0ch]
        jg      br_be9f6
        jl      br_be9e4
        cmp     ax, word ptr [bp - 0eh]
        jnc     br_be9f6
br_be9e4:
        push    2
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_be9f6:
        cmp     byte ptr [bp - 3], 18h
        jnc     br_bea01
        callf   SEG_CB18:far_cb2af
br_bea01:
        push    word 13ch
        push    word ptr [bp - 6]
        push    ds
        push    word B_E410
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     di, ax
        or      ax, ax
        jz      br_bea2a
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_bea2a:
        mov     word ptr [bp - 0ah], 0
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 22h]
        else
        lea     ax, [bp - 28h]
        endif
        push    ax
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_B52D:far_b6beb
        add     sp, 8
        xor     si, si
loop_bea44:
        if      FW_VERSION >= 312
        lea     ax, [bp - 22h]
        else
        lea     ax, [bp - 28h]
        endif
        mov     bx, si
        add     bx, ax
        mov     di, bx
        cmp     byte ptr ss:[bx], 2eh
        jz      br_bea59
        cmp     word ptr [bp - 0ah], 1
        jnz     br_bea62
br_bea59:
        mov     byte ptr ss:[di], 20h
        mov     word ptr [bp - 0ah], 1
br_bea62:
        inc     si
        cmp     si, 10h
        jl      loop_bea44
        if      FW_VERSION >= 312
        mov     byte ptr [bp - 12h], 0
        else
        mov     byte ptr [bp - 18h], 0
        endif
        push    ss
        pop     es
        if      FW_VERSION >= 312
        lea     di, [bp - 22h]
        else
        lea     di, [bp - 28h]
        endif
        mov     ax, ds
        mov     si, B_E410
        mov     dx, 11h
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        sub     dx, cx
        jnc     br_bea9b
        add     cx, dx
        xor     dx, dx
br_bea9b:
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        mov     cx, dx
        xor     ax, ax
        rep stosb
        pop     ds
        xor     si, si
        jmp     br_beae5
loop_beaae:
        push    si
        callf   SEG_C495:far_c6547
        add     sp, 2
        push    word 77eh
        push    word ptr [bp - 6]
        push    word ptr [W_E40E]
        push    word ptr [FP_E40C]
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     di, ax
        or      ax, ax
        jz      br_beae4
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_beae4:
        inc     si
br_beae5:
        mov     al, byte ptr [bp - 3]
        mov     ah, 0
        cmp     ax, si
        jg      loop_beaae
        push    word 880h
        push    word ptr [bp - 6]
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 8b8h]
        else
        lea     ax, [bp - 8beh]
        endif
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     di, ax
        or      ax, ax
        jz      br_beb19
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_beb19:
        push    word ptr [bp - 6]
        callf   SEG_CAA9:far_cab20
        add     sp, 2
        mov     di, ax
        or      ax, ax
        jge     br_beb3b
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_beb3b:
        push    ss
        pop     es
        if      FW_VERSION >= 312
        lea     di, [bp - 938h]
        elseif  FW_VERSION = 311
        lea     di, [bp - 14h]
        mov     si, 4719h
        mov     cx, 2
        rep movsw
        movsb
        lea     di, [bp - 93eh]
        else
        lea     di, [bp - 14h]
        mov     si, 4268h
        mov     cx, 2
        rep movsw
        movsb
        lea     di, [bp - 93eh]
        endif
        xor     ax, ax
        mov     ah, al
        mov     cx, 40h
        rep stosw
        xor     si, si
        if      FW_VERSION >= 312
        lea     di, [bp - 8b8h]
        else
        lea     di, [bp - 8beh]
        endif
loop_beb50:
        cmp     byte ptr ss:[di], 0
        jz      br_beb5b
        if      FW_VERSION >= 312
        mov     byte ptr [bp+si - 938h], 1
        else
        mov     byte ptr [bp+si - 93eh], 1
        endif
br_beb5b:
        add     di, 11h
        inc     si
        cmp     si, 80h
        jl      loop_beb50
        if      FW_VERSION < 312
        xor     si, si
loop_bec6b:
        cmp     byte ptr [bp+si - 93eh], 0
        jnz     br_bec7c
        inc     si
        cmp     si, 80h
        jnz     loop_bec6b
        jmp     near br_bebae
br_bec7c:
        endif
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 8b8h]
        else
        lea     ax, [bp - 3eh]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 938h]
        else
        lea     ax, [bp - 14h]
        endif
        push    ax
        if      FW_VERSION >= 312
        push    1
        else
        mov     ax, si
        mov     dx, 11h
        imul    dx
        lea     dx, [bp - 8beh]
        add     ax, dx
        push    ss
        push    ax
        callf   SEG_C6D1:far_c812b
        add     sp, 0ch
        push    ss
        lea     ax, [bp - 3eh]
        push    ax
        callf   SEG_D8B9:far_d8b9c
        add     sp, 4
        mov     di, ax
        or      ax, ax
        jl      br_becbe
        mov     byte ptr [bp+si - 93eh], 0
        inc     si
        cmp     si, 80h
        jnz     loop_bec6b
        jmp     br_bebae
br_becbe:
        cmp     di, 0fd00h
        jnz     br_bed00
        push    ss
        lea     ax, [bp - 3eh]
        push    ax
        endif
        nop
        push    cs
        if      FW_VERSION >= 312
        call    L_bec2b
        add     sp, 0ah
        mov     di, ax
        or      ax, ax
        jz      br_bebae
        or      di, di
        jge     L_beba8
        elseif  FW_VERSION = 311
        call    fn_beda0
        add     sp, 4
        mov     dx, ax
        cmp     dx, 78h
        jnz     br_bece4
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        jmp     short loop_bec6b
br_bece4:
        cmp     dx, 79h
        jnz     br_becfa
        mov     byte ptr [bp+si - 93eh], 0
        inc     si
        cmp     si, 80h
        jz      br_becf8
        jmp     near loop_bec6b
br_becf8:
        jmp     br_bebae
br_becfa:
        mov     ax, dx
        pop     di
        pop     si
        leave
        retf
br_bed00:
        else
        call    L_bee4a
        add     sp, 4
        mov     dx, ax
        cmp     dx, 78h
        jnz     br_bece4
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        jmp     short loop_bec6b
br_bece4:
        cmp     dx, 79h
        jnz     br_becfa
        mov     byte ptr [bp+si - 93eh], 0
        inc     si
        cmp     si, 80h
        jz      br_becf8
        jmp     near loop_bec6b
br_becf8:
        jmp     br_bebae
br_becfa:
        mov     ax, dx
        pop     di
        pop     si
        leave
        retf
br_bed00:
        endif
        callf   SEG_CB18:far_cb23d
        callf   SEG_CB18:far_cb2af
        push    0
        callf   SEG_C495:far_c6547
        add     sp, 2
        push    di
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        xor     ax, ax
        if      FW_VERSION >= 312
        pop     di
        pop     si
        leave
        retf
L_beba8:
        mov     ax, di
        pop     di
        pop     si
        leave
        retf
        else
        pop     di
        pop     si
        leave
        retf
        endif
br_bebae:
        mov     word ptr [bp - 8], 0
        jmp     br_bec15
loop_bebb5:
        push    word ptr [bp - 8]
        callf   SEG_C495:far_c6547
        add     sp, 2
        xor     si, si
        jmp     br_bec0d
loop_bebc4:
        mov     ax, si
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     di, bx
        cmp     byte ptr es:[bx + 3eh], 0ffh
        jz      br_bec0c
        mov     es, word ptr [W_E40E]
        mov     al, byte ptr es:[di + 3eh]
        mov     ah, 0
        mov     dx, 11h
        imul    dx
        if      FW_VERSION >= 312
        lea     dx, [bp - 8b8h]
        else
        lea     dx, [bp - 8beh]
        endif
        add     ax, dx
        push    ss
        push    ax
        callf   SEG_CC84:far_cd551
        add     sp, 4
        push    ax
        mov     ax, si
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        pop     ax
        mov     byte ptr es:[bx + 3eh], al
br_bec0c:
        inc     si
br_bec0d:
        cmp     si, 40h
        jl      loop_bebc4
        inc     word ptr [bp - 8]
br_bec15:
        cmp     word ptr [bp - 8], 18h
        jl      loop_bebb5
        push    0
        callf   SEG_C495:far_c6547
        add     sp, 2
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
        if      FW_VERSION >= 312
L_bec2b:
        push    bp
        mov     bp, sp
        sub     sp, 32h
        push    si
        push    di
        mov     word ptr [bp - 4], 0ffffh
        mov     word ptr [bp - 2], 0
        mov     si, word ptr [bp + 0ch]
L_bec40:
        push    word ptr [bp + 0eh]
        push    si
        callf   SEG_E900:L_e92db
        add     sp, 4
        or      ax, ax
        jz      L_bec6e
        mov     ax, word ptr [bp - 2]
        mov     word ptr [bp - 4], ax
        mov     dx, 11h
        imul    dx
        mov     dx, word ptr [bp + 0ch]
        add     dx, ax
        push    word ptr [bp + 0eh]
        push    dx
        callf   SEG_E900:L_e9283
        add     sp, 4
        jmp     L_bec7b
L_bec6e:
        add     si, 11h
        inc     word ptr [bp - 2]
        cmp     word ptr [bp - 2], 80h
        jl      L_bec40
L_bec7b:
        push    ss
        pop     es
        lea     di, [bp - 0ah]
        mov     si, 4850h
        mov     cx, 2
        rep movsw
        movsb
        mov     word ptr [bp - 2], 0
L_bec8e:
        cmp     word ptr [bp - 4], 0ffffh
        jle     L_bec9a
        mov     ax, word ptr [bp - 4]
        mov     word ptr [bp - 2], ax
L_bec9a:
        les     bx, dword ptr [bp + 8]
        add     bx, word ptr [bp - 2]
        cmp     byte ptr es:[bx], 0
        jnz     L_becb3
        inc     word ptr [bp - 2]
        cmp     word ptr [bp - 2], 80h
        jnz     L_bec8e
        jmp     L_bee44
L_becb3:
        mov     ax, word ptr [bp - 2]
        mov     dx, 11h
        imul    dx
        les     di, dword ptr [bp + 0ch]
        add     di, ax
        mov     ax, ss
        lea     si, [bp - 32h]
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        cmp     word ptr [bp - 4], 0ffffh
        jle     L_becfd
        push    31h
        push    ss
        lea     ax, [bp - 32h]
        push    ax
        callf   SEG_E900:L_e9234
        add     sp, 6
L_becfd:
        push    ss
        pop     es
        lea     di, [bp - 20h]
        xor     ax, ax
        mov     ah, al
        mov     cx, 0ah
        rep stosw
        stosb
        push    ss
        lea     ax, [bp - 20h]
        push    ax
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        push    ss
        lea     ax, [bp - 32h]
        push    ax
        callf   SEG_C6D1:far_c812b
        add     sp, 0ch
        cmp     word ptr [bp + 6], 0
        jnz     L_bed6d
        cmp     byte ptr [B_843B], 1
        jnz     L_bed6d
        mov     ax, word ptr [bp - 2]
        mov     dx, 11h
        imul    dx
        mov     dx, word ptr [bp + 0ch]
        add     dx, ax
        push    word ptr [bp + 0eh]
        push    dx
        callf   SEG_CC84:far_cd551
        add     sp, 4
        mov     si, ax
        or      ax, ax
        jl      L_bed6d
        push    0
        push    0
        push    ax
        callf   SEG_CC84:far_cd353
        add     sp, 6
        callf   SEG_CC84:far_cd063
        mov     dx, ax
        push    ax
        push    si
        nop
        push    cs
        call    L_bef0f
        add     sp, 4
L_bed6d:
        push    ss
        lea     ax, [bp - 20h]
        push    ax
        callf   SEG_D8B9:far_d8b9c
        add     sp, 4
        mov     dx, ax
        or      ax, ax
        jnz     L_bedad
        les     bx, dword ptr [bp + 8]
        add     bx, word ptr [bp - 2]
        mov     byte ptr es:[bx], 0
        inc     word ptr [bp - 2]
        cmp     word ptr [bp - 2], 80h
        jnz     L_bed97
        jmp     near L_bee44
L_bed97:
        cmp     word ptr [bp - 4], 0ffffh
        jg      L_beda0
        jmp     L_bec8e
L_beda0:
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 0ffffh
        jmp     L_bec8e
L_bedad:
        or      dx, dx
        jle     L_bedd8
        cmp     dx, 4
        jge     L_bedd8
        mov     si, word ptr [bp + 8]
        add     si, word ptr [bp - 2]
        jmp     L_bedc9
L_bedbe:
        mov     es, word ptr [bp + 0ah]
        mov     byte ptr es:[si], 0
        inc     si
        inc     word ptr [bp - 2]
L_bedc9:
        cmp     word ptr [bp - 2], 80h
        jl      L_bedbe
        mov     ax, dx
        neg     ax
        pop     di
        pop     si
        leave
        retf
L_bedd8:
        cmp     dx, 3
        jle     L_bede3
        mov     ax, dx
        pop     di
        pop     si
        leave
        retf
L_bede3:
        cmp     dx, 0fd00h
        jnz     L_bee3e
        cmp     word ptr [bp - 4], 0ffffh
        jle     L_bedf9
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 0ffffh
L_bedf9:
        push    ss
        lea     ax, [bp - 20h]
        push    ax
        nop
        push    cs
        call    L_bee4a
        add     sp, 4
        mov     dx, ax
        cmp     dx, 78h
        jnz     L_bee1a
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        jmp     L_bec8e
L_bee1a:
        cmp     dx, 79h
        jnz     L_bee38
        les     bx, dword ptr [bp + 8]
        add     bx, word ptr [bp - 2]
        mov     byte ptr es:[bx], 0
        inc     word ptr [bp - 2]
        cmp     word ptr [bp - 2], 80h
        jz      L_bee36
        jmp     L_bec8e
L_bee36:
        jmp     L_bee44
L_bee38:
        mov     ax, dx
        pop     di
        pop     si
        leave
        retf
L_bee3e:
        mov     ax, dx
        pop     di
        pop     si
        leave
        retf
L_bee44:
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
L_bee4a:
        elseif  FW_VERSION = 311
fn_beda0:
        else
L_bee4a:
        endif
        push    bp
        mov     bp, sp
        sub     sp, 16h
        push    si
        callf   SEG_B1AA:far_b1af9
        callf   SEG_B1AA:far_b1aac
        push    ds
        push    word STR_4855
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        cmp     byte ptr [B_7AC3], 0
        jnz     br_bee7c
        push    ds
        if      FW_VERSION >= 312
        push    word P_4860
        elseif  FW_VERSION = 311
        push    word P_4860
        else
        push    word P_4860
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_bee88
br_bee7c:
        push    ds
        if      FW_VERSION >= 312
        push    word P_48ED
        elseif  FW_VERSION = 311
        push    word P_48ED
        else
        push    word P_48ED
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_bee88:
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     byte ptr [B_7AC3], 0
        jnz     br_beeae
        push    ds
        push    word STR_495F
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_beeba
br_beeae:
        push    ds
        if      FW_VERSION >= 312
        push    word STR_48D5+0ch
        elseif  FW_VERSION = 311
        push    word STR_48D5+0ch
        else
        push    word STR_48D5+0ch
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_beeba:
        push    10h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_B52D:far_b6beb
        add     sp, 8
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        push    ds
        push    word STR_4979
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        push    2
        callf   SEG_EBCC:far_ebda4
        add     sp, 2
        mov     si, ax
        callf   SEG_B1AA:far_b1aff
        cmp     byte ptr [B_7AC3], 0
        jz      br_bef0a
        cmp     si, 78h
        jnz     br_bef0a
        mov     si, 79h
br_bef0a:
        mov     ax, si
        pop     si
        leave
        retf
        if      FW_VERSION >= 312
L_bef0f:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        push    di
        mov     al, byte ptr [B_E421]
        mov     ah, 0
        mov     word ptr [bp - 2], ax
        xor     di, di
L_bef21:
        cmp     di, word ptr [bp - 2]
        jz      L_bef57
        push    di
        callf   SEG_C495:far_c6547
        add     sp, 2
        xor     cx, cx
        xor     dx, dx
L_bef33:
        les     bx, dword ptr [FP_E40C]
        add     bx, dx
        mov     si, bx
        mov     al, byte ptr es:[bx + 3eh]
        mov     ah, 0
        cmp     ax, word ptr [bp + 6]
        jnz     L_bef4d
        mov     al, byte ptr [bp + 8]
        mov     byte ptr es:[si + 3eh], al
L_bef4d:
        add     dx, 18h
        inc     cx
        cmp     dx, 600h
        jnz     L_bef33
L_bef57:
        inc     di
        cmp     di, 18h
        jl      L_bef21
        push    word ptr [bp - 2]
        callf   SEG_C495:far_c6547
        add     sp, 2
        pop     di
        pop     si
        leave
        retf
        phase   0ch
        elseif  FW_VERSION = 311
        phase   5
        else
        phase   0ah
        endif
far_bef6c:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    si
        push    ds
        push    word STR_497E
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        push    ds
        push    word B_901B
        callf   SEG_E5A9:far_e5a99
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_4985
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    9
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word TBL_7FD5
        push    ds
        push    word STR_49AE
        callf   SEG_B347:far_b39a2
        add     sp, 8
        push    9
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word W_7FD9
        push    ds
        push    word STR_49B9
        callf   SEG_B347:far_b39a2
        add     sp, 8
        push    9
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word W_7FDD
        push    ds
        push    word STR_49C4
        callf   SEG_B347:far_b39a2
        add     sp, 8
        callf   SEG_BF29:far_bffc9
        push    ds
        push    word STR_49CF
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     word ptr [bp - 4], ds
        mov     word ptr [bp - 6], W_9051
        mov     byte ptr [bp - 1], 0
        jmp     near br_bf0b7
loop_bf017:
        push    4
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     byte ptr [bp - 1], al
        or      al, al
        jz      loop_bf017
        cbw
        cmp     ax, 78h
        jz      br_bf050
        jg      br_bf03c
        cmp     ax, 2fh
        jz      br_bf048
        cmp     ax, 75h
        jz      br_bf08c
        jmp     short br_bf0b7
br_bf03c:
        cmp     ax, 79h
        jz      br_bf050
        cmp     ax, 7ah
        jz      br_bf050
        jmp     br_bf0b7
br_bf048:
        mov     al, byte ptr [B_7B8D]
        add     al, 78h
        mov     byte ptr [bp - 1], al
br_bf050:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        mov     al, byte ptr [bp - 1]
        cbw
        shl     ax, 2
        mov     bx, ax
        push    word ptr [bx + TBL_7DF7]
        push    word ptr [bx + TBL_7DF5]
        callf   SEG_E561:far_e5612
        add     sp, 4
        if      FW_VERSION >= 311
        callf   SEG_E682:far_e6890
        else
        callf   SEG_E682:L_ef4d3
        endif
        mov     al, byte ptr [B_D4C2]
        mov     byte ptr [bp - 1], al
        jmp     br_bf0b7
br_bf08c:
        mov     al, byte ptr [B_7B8D]
        cbw
        shl     ax, 2
        les     bx, dword ptr [bp - 6]
        mov     dx, word ptr es:[bx + 2]
        mov     bx, word ptr es:[bx]
        mov     si, ax
        mov     word ptr [si + TBL_7FD7], dx
        mov     word ptr [si + TBL_7FD5], bx
        mov     al, byte ptr [B_7B8D]
        push    ax
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     byte ptr [bp - 1], 0
br_bf0b7:
        cmp     byte ptr [bp - 1], 0
        jnz     br_bf0c0
        jmp     near loop_bf017
br_bf0c0:
        mov     al, byte ptr [bp - 1]
        cbw
        pop     si
        leave
        retf
        if      FW_VERSION >= 312
        phase   7
        elseif  FW_VERSION = 311
        phase   0
        else
        phase   5
        endif
far_bf0c7:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    ds
        push    word STR_49F8
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        mov     al, byte ptr [B_9562]
        cbw
        or      ax, ax
        jnz     br_bf10f
        mov     ax, word ptr [W_9053]
        mov     word ptr [W_9565], ax
        add     ax, word ptr [W_9567]
        dec     ax
        mov     word ptr [bp - 2], ax
        push    word ptr [W_904B]
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ds
        push    word W_9565
        callf   SEG_B702:far_b9113
        add     sp, 0ah
        mov     ax, word ptr [bp - 2]
        sub     ax, word ptr [W_9565]
        inc     ax
        mov     word ptr [W_9567], ax
br_bf10f:
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    word 3e7h
        push    1
        push    3
        push    ds
        push    word W_9567
        push    ds
        push    word STR_4A02
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    word 3e7h
        push    1
        push    3
        push    ds
        push    word W_9565
        push    ds
        push    word STR_4A0D
        callf   SEG_B347:far_b3819
        add     sp, 10h
        callf   SEG_B702:far_b90dd
        cmp     byte ptr [B_9562], 0
        jnz     br_bf15c
        jmp     near br_bf1f2
br_bf15c:
        push    ds
        push    word STR_4A1D
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B05A:far_b05a7
loop_bf16d:
        push    2
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dl, al
        or      al, al
        jz      loop_bf16d
        cbw
        cmp     ax, 78h
        jz      br_bf18a
        cmp     ax, 79h
        jz      br_bf1c4
        jmp     br_bf1ed
br_bf18a:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_4A35
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        callf   SEG_E44C:far_e46a8
        mov     dx, ax
        or      ax, ax
        jz      br_bf1c0
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
br_bf1c0:
        mov     dl, 4dh
        jmp     br_bf1ed
br_bf1c4:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_4A4A
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        callf   SEG_E44C:far_e481e
        mov     dl, 4dh
br_bf1ed:
        mov     al, dl
        cbw
        leave
        retf
br_bf1f2:
        push    ds
        push    word STR_4A6A
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_bf24c
loop_bf200:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jz      br_bf20d
        cmp     ax, 1
        jnz     br_bf24c
br_bf20d:
        mov     ax, word ptr [W_9565]
        add     ax, word ptr [W_9567]
        dec     ax
        mov     word ptr [bp - 2], ax
        push    word ptr [W_904B]
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ds
        push    word W_9565
        callf   SEG_B702:far_b9113
        add     sp, 0ah
        mov     ax, word ptr [bp - 2]
        sub     ax, word ptr [W_9565]
        inc     ax
        mov     word ptr [W_9567], ax
        push    0
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_bf24c:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dl, al
        or      al, al
        jz      loop_bf200
        cmp     dl, 78h
        jnz     br_bf28f
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_4A74
        callf   SEG_B1B5:far_b1d48
        add     sp, 4
        callf   SEG_E44C:far_e44c1
        mov     dx, ax
        or      ax, ax
        jz      br_bf28d
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
br_bf28d:
        mov     dl, 4dh
br_bf28f:
        mov     al, dl
        cbw
        leave
        retf
        if      FW_VERSION >= 312
        phase   4
        elseif  FW_VERSION = 311
        phase   0dh
        else
        phase   2
        endif
far_bf294:
        push    bp
        mov     bp, sp
        sub     sp, 1ah
        push    si
        push    di
        nop
        push    cs
        call    far_c036b
        mov     word ptr [bp - 6], ax
        nop
        push    cs
        call    fn_c0325
        mov     al, byte ptr [B_D5DE]
        mov     byte ptr [B_D4C2], al
        push    0
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word STR_4AAF
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    10h
        push    ds
        push    word A_EFC6
        push    ds
        push    word A_4AB4
        callf   SEG_B347:far_b3471
        add     sp, 0ah
        mov     al, byte ptr [B_7FCB]
        cbw
        push    ax
        mov     al, byte ptr [B_7FCA]
        cbw
        push    ax
        push    word ptr [W_D657]
        callf   SEG_DE78:far_de88f
        add     sp, 6
        mov     word ptr [W_D659], ax
        push    3
        push    ds
        push    word P_01F0+0ch
        push    ds
        push    word B_7FCA
        push    ds
        push    word A_4AB6
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        mov     al, byte ptr [B_7FCA]
        cbw
        push    ax
        mov     al, byte ptr [B_7FCB]
        cbw
        inc     ax
        mov     dx, ax
        pop     ax
        imul    dx
        mov     dx, ax
        push    4
        mov     bx, dx
        shl     bx, 1
        push    word ptr [bx + 252h]
        mov     bx, dx
        shl     bx, 1
        push    word ptr [bx + 248h]
        push    5
        push    ds
        push    word W_D659
        push    ds
        if      FW_VERSION >= 312
        push    word P_4AAF+3
        elseif  FW_VERSION = 311
        push    word P_4AAF+3
        else
        push    word P_4AAF+3
        endif
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    4
        push    ds
        push    word P_0050+8
        push    ds
        push    word B_7FCC
        push    ds
        push    word STR_4AB8
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    5
        push    2
        callf   SEG_B347:far_b3a60
        add     sp, 4
        mov     al, byte ptr [B_901C]
        and     al, 1
        mov     byte ptr [B_EFB3], al
        mov     ax, word ptr [W_904D]
        mov     word ptr [W_EFB1], ax
        push    6
        push    ds
        if      FW_VERSION >= 312
        push    word P_4A98
        elseif  FW_VERSION = 311
        push    word P_49EE_V311
        else
        push    word P_453E_V308
        endif
        push    ds
        push    word B_EFB3
        push    ds
        push    word STR_4ABB
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    word 3e7h
        push    1
        push    3
        push    ds
        push    word W_EFB1
        push    ds
        push    word A_4AB6
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_4AD9
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_8A9A]
        mov     byte ptr [bp - 7], al
        push    8
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 7]
        push    ax
        push    ds
        push    word STR_4AE4
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    10h
        push    ds
        push    word A_93F7
        push    ds
        push    word A_4AB4
        callf   SEG_B347:far_b3471
        add     sp, 0ah
        mov     al, byte ptr [B_8A9C]
        cbw
        push    ax
        callf   SEG_E4A1:far_e4a1d
        add     sp, 2
        mov     byte ptr [B_EFA7], al
        mov     byte ptr [B_EFA4], al
        push    4
        push    ds
        push    word P_0200+8
        push    ds
        push    word B_EFA4
        push    ds
        push    word STR_4AE9
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        nop
        push    cs
        call    fn_c0180
        mov     byte ptr [B_EFB0], al
        push    3
        push    ds
        push    word P_0020+4
        push    ds
        push    word B_EFB0
        push    ds
        push    word STR_4AF0
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    10h
        push    0
        push    2
        push    ds
        push    word B_EFAE
        push    ds
        push    word STR_4AF5
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    1
        push    ds
        push    word P_0250+0ch
        push    ds
        push    word B_EFAC
        push    ds
        push    word A_4AA7
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    ds
        push    word A_EFBD
        mov     al, byte ptr [B_EFAE]
        cbw
        push    ax
        mov     al, byte ptr [B_EFAC]
        cbw
        push    ax
        nop
        push    cs
        call    fn_c0274
        add     sp, 8
        push    8
        push    ds
        push    word A_EFBD
        push    ds
        push    word A_4AB4
        callf   SEG_B347:far_b3471
        add     sp, 0ah
        push    8
        push    10h
        push    0
        push    2
        push    ds
        push    word B_EFAF
        push    ds
        push    word STR_4AFA
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    1
        push    ds
        push    word P_0250+0ch
        push    ds
        push    word B_EFAD
        push    ds
        push    word A_4AA7
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    8
        push    word 0c8h
        push    1
        push    3
        push    ds
        push    word B_EFA6
        push    ds
        push    word STR_4AFE
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    8
        push    word 80h
        push    0
        push    3
        push    ds
        push    word B_EFA5
        push    ds
        push    word STR_4B06
        callf   SEG_B347:far_b3819
        add     sp, 10h
        nop
        push    cs
        call    fn_c0254
        nop
        push    cs
        call    far_bffc9
        push    ds
        push    word STR_4B0C
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        nop
        push    cs
        call    fn_c01e4
        nop
        push    cs
        call    fn_c0211
        nop
        push    cs
        call    fn_bfff8
        callf   SEG_D79E:far_d7a79
        mov     al, byte ptr [B_901B]
        cbw
        mov     word ptr [bp - 4], ax
        mov     word ptr [bp - 2], 0
        jmp     br_bfe3f
br_bf540:
        mov     al, byte ptr [B_901B]
        cbw
        cmp     ax, word ptr [bp - 4]
        jnz     br_bf54c
        jmp     tgt_bfb9d
br_bf54c:
        cmp     byte ptr [B_A5C1], 0
        jz      br_bf556
        jmp     tgt_bfb9d
br_bf556:
        push    ds
        push    word B_8C41
        callf   SEG_E003:far_e0031
        add     sp, 4
        callf   SEG_DEEA:far_deeab
        mov     al, byte ptr [B_901B]
        cbw
        mov     word ptr [bp - 4], ax
        jmp     tgt_bfb9d
br_bf571:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     di, ax
        mov     bx, ax
        cmp     bx, 12h
        jbe     br_bf581
        jmp     tgt_bfb9d
br_bf581:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_bfe6a]
tgt_bf588:
        cmp     byte ptr [B_9562], 0
        jz      br_bf5b7
        callf   SEG_B1AA:far_b1af9
        push    0ffd8h
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        callf   SEG_B1AA:far_b1aff
        mov     al, byte ptr [B_9561]
        cbw
        mov     word ptr [bp - 6], ax
        push    0
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     tgt_bfb9d
br_bf5b7:
        cmp     byte ptr [B_A5C2], 0
        jnz     br_bf5c1
        jmp     near br_bf64f
br_bf5c1:
        mov     al, byte ptr [B_8A9F]
        cbw
        cmp     ax, word ptr [bp - 6]
        jnz     br_bf5d1
        mov     byte ptr [B_8A9E], 0
        jmp     br_bf636
br_bf5d1:
        cmp     byte ptr [B_901B], 1
        jnz     br_bf603
        mov     al, byte ptr [bp - 6]
        push    ax
        callf   SEG_E259:far_e259f
        add     sp, 2
        or      ax, ax
        jnz     br_bf636
        les     bx, dword ptr [W_8C35]
        mov     ax, word ptr es:[bx + 21h]
        mov     dx, word ptr es:[bx + 1fh]
        mov     word ptr [W_A57C], ax
        mov     word ptr [W_A57A], dx
        mov     al, byte ptr [bp - 6]
        mov     byte ptr [B_8A9E], al
        jmp     br_bf636
br_bf603:
        callf   SEG_E6FE:far_e6fef
        callf   SEG_B1AA:far_b1af9
        push    0
        push    3eh
        push    3
        callf   SEG_B3B9:far_b3d1d
        add     sp, 6
        callf   SEG_B1AA:far_b1aff
        push    1
        push    word ptr [bp - 6]
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        callf   SEG_DEEA:far_deeab
br_bf636:
        mov     al, byte ptr [B_8A9F]
        cbw
        mov     word ptr [bp - 6], ax
        push    0
        callf   SEG_B05A:far_b1073
        add     sp, 2
        nop
        push    cs
        call    fn_c0325
        if      FW_VERSION < 311
        mov     byte ptr [B_CEC6_V308], 0
        endif
        jmp     tgt_bfb9d
br_bf64f:
        cmp     byte ptr [B_956D], 0
        jz      br_bf65f
        callf   SEG_E3B7:far_e3b75
        dec     byte ptr [B_956A]
br_bf65f:
        mov     byte ptr [B_8A9E], 0
        push    1
        push    word ptr [bp - 6]
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        callf   SEG_DEEA:far_deeab
        mov     al, byte ptr [B_8A9A]
        mov     byte ptr [bp - 7], al
        push    ss
        lea     ax, [bp - 6]
        push    ax
        nop
        push    cs
        call    fn_c03b2
        add     sp, 4
        if      FW_VERSION >= 311
        callf   SEG_E682:far_e6890
        else
        callf   SEG_E682:L_ef4d3
        endif
        or      byte ptr [B_955B], 40h
        or      byte ptr [B_955C], 80h
        jmp     tgt_bfb9d
tgt_bf69f:
        cmp     byte ptr [B_901B], 0
        jge     br_bf6f2
        push    ss
        lea     ax, [bp - 1ah]
        push    ax
        push    0ffffh
        push    0
        callf   SEG_E4D1:far_e4d15
        add     sp, 8
        push    ss
        pop     es
        lea     di, [bp - 1ah]
        mov     si, A_EFC6
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        xor     ax, ax
        repe cmpsb
        jz      br_bf6d5
        sbb     ax, ax
        sbb     ax, 0ffffh
br_bf6d5:
        or      ax, ax
        jz      br_bf6f2
        push    0
        push    0
        mov     al, byte ptr [bp - 7]
        cbw
        push    ax
        push    word ptr [bp - 6]
        nop
        push    cs
        call    fn_bfe90
        add     sp, 8
        if      FW_VERSION >= 311
        callf   SEG_E682:far_e6890
        else
        callf   SEG_E682:L_ef4d3
        endif
br_bf6f2:
        push    ds
        push    word A_EFC6
        push    0ffffh
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_E57C:far_e57c8
        add     sp, 8
        if      FW_VERSION < 311
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
        endif
        jmp     tgt_bfb9d
tgt_bf708:
        mov     al, byte ptr [B_7FCA]
        cbw
        push    ax
        mov     al, byte ptr [B_7FCB]
        cbw
        inc     ax
        mov     dx, ax
        pop     ax
        imul    dx
        mov     dx, ax
        mov     bx, dx
        shl     bx, 1
        push    word ptr [bx + 252h]
        mov     bx, dx
        shl     bx, 1
        push    word ptr [bx + 248h]
        push    3
        callf   SEG_B05A:far_b1206
        add     sp, 6
        push    0
        callf   SEG_EA92:far_ea926
        add     sp, 2
        jmp     tgt_bfb9d
tgt_bf740:
        cmp     byte ptr [B_901B], 0
        jge     br_bf75b
        push    ds
        push    word A_EFC6
        mov     al, byte ptr [bp - 7]
        cbw
        push    ax
        push    word ptr [bp - 6]
        nop
        push    cs
        call    fn_bfe90
        add     sp, 8
br_bf75b:
        nop
        push    cs
        call    far_bff70
        jmp     tgt_bfb9d
tgt_bf763:
        callf   SEG_E707:far_e70e6
        push    ds
        push    word W_D5F3
        push    word ptr [W_9047]
        push    word ptr [W_9045]
        callf   SEG_EB86:far_eb86b
        add     sp, 8
        push    0
        callf   SEG_EA92:far_ea926
        add     sp, 2
        jmp     tgt_bfb9d
tgt_bf789:
        cmp     byte ptr [B_9562], 0
        jnz     br_bf797
        cmp     byte ptr [B_A5C2], 0
        jz      br_bf79f
br_bf797:
        nop
        push    cs
        call    fn_c0211
        jmp     tgt_bfb9d
br_bf79f:
        cmp     byte ptr [B_901B], 0ffh
        jnz     br_bf7c0
        push    ds
        push    word A_EFC6
        mov     al, byte ptr [bp - 7]
        cbw
        push    ax
        push    word ptr [bp - 6]
        nop
        push    cs
        call    fn_bfe90
        add     sp, 8
        mov     ax, word ptr [W_904D]
        mov     word ptr [W_EFB1], ax
br_bf7c0:
        mov     al, byte ptr [B_901C]
        and     al, 0feh
        or      al, byte ptr [B_EFB3]
        mov     byte ptr [B_901C], al
        if      FW_VERSION >= 311
        mov     ax, word ptr [W_901D]
        or      ax, word ptr [W_901F]
        jz      br_bf7e2
        les     bx, dword ptr [W_901D]
        mov     al, byte ptr [B_901C]
        and     al, 0dh
        mov     byte ptr es:[bx + 1ah], al
br_bf7e2:
        else
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
        endif
        nop
        push    cs
        call    fn_c0211
        jmp     tgt_bfb9d
tgt_bf7ea:
        cmp     byte ptr [B_9562], 0
        jnz     br_bf7ff
        cmp     byte ptr [B_A5C2], 0
        jnz     br_bf7ff
        cmp     byte ptr [B_EFB3], 0
        jnz     br_bf807
br_bf7ff:
        nop
        push    cs
        call    fn_c0211
        jmp     tgt_bfb9d
br_bf807:
        cmp     byte ptr [B_901B], 0ffh
        jnz     br_bf822
        push    ds
        push    word A_EFC6
        mov     al, byte ptr [bp - 7]
        cbw
        push    ax
        push    word ptr [bp - 6]
        nop
        push    cs
        call    fn_bfe90
        add     sp, 8
br_bf822:
        push    0
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        mov     ax, word ptr [W_EFB1]
        cmp     ax, word ptr [W_904B]
        jle     br_bf849
        mov     ax, word ptr [W_904B]
        mov     word ptr [W_EFB1], ax
        nop
        push    cs
        call    fn_c0211
br_bf849:
        mov     ax, word ptr [W_EFB1]
        mov     word ptr [W_904D], ax
        test    byte ptr [B_901C], 2
        jz      br_bf881
        push    ax
        push    0
        callf   SEG_E56A:far_e570d
        add     sp, 4
        mov     word ptr [W_9037], dx
        mov     word ptr [W_9035], ax
        push    word ptr [W_904D]
        push    ds
        push    word B_901B
        callf   SEG_E718:far_e7189
        add     sp, 6
        mov     word ptr [W_903B], dx
        mov     word ptr [W_9039], ax
        jmp     br_bf88d
br_bf881:
        push    ds
        push    word B_901B
        callf   SEG_E5A9:far_e5a99
        add     sp, 4
br_bf88d:
        mov     word ptr [TBL_882E], 1000h
        cmp     byte ptr [B_8A88], 0
        jz      br_bf8df
        xor     cx, cx
        mov     si, TBL_8830
        mov     al, byte ptr [B_8A88]
        mov     ah, 0
        mov     di, ax
        jmp     br_bf8c1
loop_bf8a8:
        mov     ax, word ptr [si + 2]
        mov     dx, word ptr [si]
        cmp     ax, word ptr [W_903B]
        jc      br_bf8bd
        ja      br_bf8c5
        cmp     dx, word ptr [W_9039]
        jbe     br_bf8bd
        jmp     br_bf8c5
br_bf8bd:
        add     si, 6
        inc     cx
br_bf8c1:
        cmp     di, cx
        jg      loop_bf8a8
br_bf8c5:
        or      cx, cx
        jz      br_bf8df
        mov     ax, cx
        mov     dx, 6
        imul    dx
        mov     dx, TBL_882A
        add     dx, 4
        add     ax, dx
        mov     bx, ax
        mov     ax, word ptr [bx]
        mov     word ptr [TBL_882E], ax
br_bf8df:
        push    ds
        push    word W_D5F3
        push    word ptr [W_9047]
        push    word ptr [W_9045]
        callf   SEG_EB86:far_eb86b
        add     sp, 8
        if      FW_VERSION < 311
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
        endif
        jmp     tgt_bfb9d
tgt_bf8f6:
        mov     al, byte ptr [bp - 7]
        cbw
        push    ax
        nop
        push    cs
        call    fn_bfee6
        add     sp, 2
        jmp     tgt_bfb9d
tgt_bf906:
        cmp     byte ptr [B_A5C2], 0
        jz      br_bf945
        push    ds
        push    word A_93F7
        mov     al, byte ptr [B_8A9C]
        cbw
        push    ax
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_E57C:far_e57c8
        add     sp, 8
        push    ds
        push    word A_93F7
        mov     al, byte ptr [B_8A9C]
        push    ax
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_E4D1:far_e4d15
        add     sp, 8
        push    9
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     tgt_bfb9d
br_bf945:
        push    ds
        push    word A_93F7
        mov     al, byte ptr [B_8A9C]
        cbw
        push    ax
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_E4F5:far_e4f54
        add     sp, 8
        push    ds
        push    word A_EFC6
        push    0ffffh
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_E4D1:far_e4d15
        add     sp, 8
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    0
        callf   SEG_EA92:far_ea926
        add     sp, 2
        nop
        push    cs
        call    fn_c0325
        jmp     tgt_bfb9d
tgt_bf98a:
        cmp     byte ptr [B_A5C2], 0
        jz      br_bf994
        jmp     near br_bfa15
br_bf994:
        mov     al, byte ptr [B_9562]
        cbw
        or      ax, ax
        jnz     br_bf9cb
        push    0
        push    word ptr [bp - 6]
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        cmp     ax, 0ffffh
        jnz     br_bf9cb
        push    ds
        push    word A_EFC6
        mov     al, byte ptr [bp - 7]
        cbw
        push    ax
        push    word ptr [bp - 6]
        nop
        push    cs
        call    fn_bfe90
        add     sp, 8
        if      FW_VERSION >= 311
        callf   SEG_E682:far_e6890
        else
        callf   SEG_E682:L_ef4d3
        endif
br_bf9cb:
        mov     al, byte ptr [B_8A9C]
        cbw
        mov     si, ax
        mov     bx, ax
        test    byte ptr [bx + TBL_90C1], 2
        jnz     br_bfa15
        or      byte ptr [si + TBL_90C1], 2
        mov     al, byte ptr [B_8A9A]
        cbw
        push    ax
        push    ds
        push    word A_93F7
        callf   SEG_E4D1:far_e4e74
        add     sp, 6
        push    ds
        push    word A_93F7
        mov     al, byte ptr [B_8A9C]
        cbw
        push    ax
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_E4F5:far_e4f54
        add     sp, 8
        push    9
        callf   SEG_B05A:far_b1073
        add     sp, 2
        nop
        push    cs
        call    fn_c0254
br_bfa15:
        mov     al, byte ptr [B_8A9A]
        cbw
        mov     bx, ax
        cmp     byte ptr [bx + TBL_905D], 0ffh
        jnz     br_bfa2e
        push    ds
        push    word B_901B
        callf   SEG_E344:far_e37be
        add     sp, 4
br_bfa2e:
        mov     al, byte ptr [B_EFB0]
        cbw
        push    ax
        nop
        push    cs
        call    fn_c0194
        add     sp, 2
        mov     al, byte ptr [B_8A9C]
        cbw
        mov     si, ax
        mov     bx, ax
        or      byte ptr [bx + TBL_90C1], 2
        mov     al, byte ptr [B_EFA6]
        mov     byte ptr [si + TBL_9251], al
        cmp     di, 12h
        jnz     br_bfa86
        mov     al, byte ptr [B_EFA5]
        mov     byte ptr [si + TBL_91ED], al
        nop
        push    cs
        call    fn_c0254
        cmp     byte ptr [B_EFA5], 0
        jz      br_bfa86
        mov     al, byte ptr [B_8A9C]
        cbw
        mov     bx, ax
        test    byte ptr [bx + TBL_90C1], 1
        jnz     br_bfa86
        mov     al, byte ptr [B_EFA5]
        dec     al
        mov     byte ptr [B_9444], al
        or      byte ptr [B_955B], 10h
        or      byte ptr [B_955C], 80h
br_bfa86:
        if      FW_VERSION < 311
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
        endif
        nop
        push    cs
        call    fn_c0325
        jmp     tgt_bfb9d
tgt_bfa8e:
        cmp     byte ptr [B_A5C2], 0
        jz      br_bfa98
        jmp     near br_bfb4e
br_bfa98:
        mov     al, byte ptr [B_9562]
        cbw
        or      ax, ax
        jnz     br_bfad9
        push    0
        push    word ptr [bp - 6]
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        cmp     ax, 0ffffh
        jnz     br_bfacf
        push    ds
        push    word A_EFC6
        mov     al, byte ptr [bp - 7]
        cbw
        push    ax
        push    word ptr [bp - 6]
        nop
        push    cs
        call    fn_bfe90
        add     sp, 8
        if      FW_VERSION >= 311
        callf   SEG_E682:far_e6890
        else
        callf   SEG_E682:L_ef4d3
        endif
br_bfacf:
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_bfad9:
        mov     al, byte ptr [B_8A9C]
        cbw
        mov     si, ax
        mov     bx, ax
        test    byte ptr [bx + TBL_90C1], 2
        jnz     br_bfb1e
        or      byte ptr [si + TBL_90C1], 2
        mov     al, byte ptr [B_8A9A]
        cbw
        push    ax
        push    ds
        push    word A_93F7
        callf   SEG_E4D1:far_e4e74
        add     sp, 6
        push    ds
        push    word A_93F7
        mov     al, byte ptr [B_8A9C]
        cbw
        push    ax
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_E4F5:far_e4f54
        add     sp, 8
        push    9
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_bfb1e:
        nop
        push    cs
        call    fn_c0325
        push    4
        mov     al, byte ptr [B_EFA4]
        cbw
        push    ax
        nop
        push    cs
        call    fn_c01aa
        add     sp, 4
        mov     al, byte ptr [B_EFA4]
        mov     byte ptr [B_EFA7], al
        nop
        push    cs
        call    fn_c0109
        nop
        push    cs
        call    fn_bfff8
        push    0
        callf   SEG_EA92:far_ea926
        add     sp, 2
        jmp     br_bfb7b
br_bfb4e:
        mov     al, byte ptr [B_EFAA]
        mov     byte ptr [B_EFAE], al
        mov     al, byte ptr [B_EFAB]
        mov     byte ptr [B_EFAF], al
        mov     al, byte ptr [B_EFA8]
        mov     byte ptr [B_EFAC], al
        mov     al, byte ptr [B_EFA9]
        mov     byte ptr [B_EFAD], al
        nop
        push    cs
        call    fn_bfff8
        mov     al, byte ptr [B_EFA7]
        mov     byte ptr [B_EFA4], al
        push    0ah
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_bfb7b:
        if      FW_VERSION < 311
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
        endif
        nop
        push    cs
        call    fn_c0325
        jmp     tgt_bfb9d
tgt_bfb82:
        push    ds
        push    word A_EFBD
        mov     al, byte ptr [B_EFAE]
        cbw
        push    ax
        mov     al, byte ptr [B_EFAC]
        cbw
        push    ax
        nop
        push    cs
        call    fn_c02d7
        add     sp, 8
        nop
        push    cs
        call    fn_bfff8
tgt_bfb9d:
        push    4
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        or      ax, ax
        jnz     br_bfbb0
        jmp     br_bf571
br_bfbb0:
        mov     bx, si
        cmp     bx, 65h
        jnz     br_bfbba
        jmp     tgt_bfdfe
br_bfbba:
        jg      br_bfbf4
        cmp     bx, 50h
        jnz     br_bfbc4
        jmp     br_bfce4
br_bfbc4:
        jg      br_bfbe1
        cmp     bx, 24h
        jnz     br_bfbce
        jmp     br_bfe05
br_bfbce:
        cmp     bx, 45h
        jnz     br_bfbd6
        jmp     br_bfda4
br_bfbd6:
        cmp     bx, 4dh
        jnz     br_bfbde
        jmp     br_bfe3f
br_bfbde:
        jmp     tgt_bfe3a
br_bfbe1:
        cmp     bx, 52h
        jnz     br_bfbe9
        jmp     br_bfdd1
br_bfbe9:
        cmp     bx, 57h
        jnz     br_bfbf1
        jmp     br_bfd37
br_bfbf1:
        jmp     tgt_bfe3a
br_bfbf4:
        sub     bx, 6dh
        cmp     bx, 0dh
        jbe     br_bfbff
        jmp     tgt_bfe3a
br_bfbff:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_bfe4e]
tgt_bfc06:
        nop
        push    cs
        call    fn_c0180
        neg     ax
        sbb     ax, ax
        inc     ax
        push    ax
        nop
        push    cs
        call    fn_c0194
        add     sp, 2
        nop
        push    cs
        call    fn_c01d2
        nop
        push    cs
        call    fn_c0446
        if      FW_VERSION < 311
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
        endif
        jmp     br_bfe3f
tgt_bfc26:
        mov     al, byte ptr [B_A56E]
        cbw
        neg     ax
        sbb     ax, ax
        inc     ax
        mov     byte ptr [B_A56E], al
        nop
        push    cs
        call    fn_c01e4
        jmp     br_bfe3f
tgt_bfc3a:
        mov     al, byte ptr [bp - 7]
        dec     al
        mov     byte ptr [bp - 7], al
        cmp     al, 1
        jge     br_bfc4a
        mov     byte ptr [bp - 7], 1
br_bfc4a:
        mov     al, byte ptr [bp - 7]
        cbw
        push    ax
        nop
        push    cs
        call    fn_bfee6
        add     sp, 2
        push    8
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_bfe3f
tgt_bfc64:
        mov     al, byte ptr [bp - 7]
        inc     al
        mov     byte ptr [bp - 7], al
        cmp     al, 63h
        jle     br_bfc74
        mov     byte ptr [bp - 7], 63h
br_bfc74:
        mov     al, byte ptr [bp - 7]
        cbw
        push    ax
        nop
        push    cs
        call    fn_bfee6
        add     sp, 2
        push    8
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_bfe3f
tgt_bfc8e:
        cmp     byte ptr [B_9562], 0
        jz      br_bfc98
        jmp     br_bfe3f
br_bfc98:
        cmp     byte ptr [B_A5C2], 0
        jz      br_bfca2
        jmp     br_bfe3f
br_bfca2:
        mov     al, byte ptr [B_D4B1]
        cbw
        mov     word ptr [bp - 6], ax
        cmp     word ptr [bp - 6], 1
        jge     br_bfcb4
        mov     word ptr [bp - 6], 1
br_bfcb4:
        cmp     word ptr [bp - 6], 63h
        jle     br_bfcbf
        mov     word ptr [bp - 6], 63h
br_bfcbf:
        push    1
        push    word ptr [bp - 6]
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        if      FW_VERSION >= 311
        callf   SEG_E682:far_e6890
        mov     byte ptr [B_955B], 40h
        mov     byte ptr [B_955C], 80h
        else
        callf   SEG_E682:L_ef4d3
        endif
        mov     byte ptr [B_9443], 0
br_bfce4:
        cmp     byte ptr [B_9443], 0
        jz      br_bfd15
        mov     al, byte ptr [B_9443]
        cbw
        mov     word ptr [bp - 6], ax
        push    1
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        if      FW_VERSION >= 311
        callf   SEG_E682:far_e6890
        mov     byte ptr [B_955B], 40h
        mov     byte ptr [B_955C], 80h
        else
        callf   SEG_E682:L_ef4d3
        endif
        mov     byte ptr [B_9443], 0
br_bfd15:
        if      FW_VERSION >= 311
        cmp     byte ptr [B_8A9E], 0
        jge     br_bfd21
        endif
        mov     byte ptr [B_8A9E], 0
br_bfd21:
        mov     al, byte ptr [B_8A9A]
        mov     byte ptr [bp - 7], al
        push    ss
        lea     ax, [bp - 6]
        push    ax
        nop
        push    cs
        call    fn_c03b2
        add     sp, 4
        jmp     br_bfe3f
br_bfd37:
        mov     al, byte ptr [B_9562]
        cbw
        or      ax, ax
        jnz     br_bfd88
        push    0
        push    word ptr [bp - 6]
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        cmp     ax, 0ffffh
        jnz     br_bfd69
        push    ds
        push    word A_EFC6
        mov     al, byte ptr [bp - 7]
        cbw
        push    ax
        push    word ptr [bp - 6]
        nop
        push    cs
        call    fn_bfe90
        add     sp, 8
br_bfd69:
        cmp     byte ptr [B_A5C1], 0
        jnz     br_bfd88
        push    ds
        push    word B_8C41
        callf   SEG_E003:far_e0031
        add     sp, 4
        callf   SEG_DEEA:far_deeab
        mov     al, byte ptr [B_901B]
        cbw
        mov     word ptr [bp - 4], ax
br_bfd88:
        nop
        push    cs
        call    fn_c0211
        callf   SEG_DD59:far_dd970
        if      FW_VERSION < 311
        mov     byte ptr [B_CEC6_V308], 0
        endif
        nop
        push    cs
        call    fn_c0325
        push    0
        callf   SEG_EA92:far_ea926
        add     sp, 2
        jmp     near br_bfe3f
br_bfda4:
        test    byte ptr [B_A5C2], 14h
        jz      br_bfdc3
        push    0
        push    0
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_4B35
        callf   SEG_EC03:far_ec03b
        add     sp, 4
br_bfdc3:
        cmp     byte ptr [B_A5C2], 0
        jnz     br_bfe3f
        mov     word ptr [bp - 2], 1
        jmp     br_bfe3f
br_bfdd1:
        test    byte ptr [B_A5C2], 15h
        jz      br_bfdf0
        push    0
        push    0
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_4B52
        callf   SEG_EC03:far_ec03b
        add     sp, 4
br_bfdf0:
        cmp     byte ptr [B_A5C2], 0
        jnz     br_bfe3f
        mov     word ptr [bp - 2], 1
        jmp     br_bfe3f
tgt_bfdfe:
        nop
        push    cs
        call    fn_c0325
        jmp     br_bfe3f
br_bfe05:
        callf   SEG_E6FE:far_e7069
        callf   SEG_B1AA:far_b1af9
        push    0
        push    3dh
        push    3
        callf   SEG_B3B9:far_b3d1d
        add     sp, 6
        callf   SEG_B1AA:far_b1aff
        push    0
        push    word ptr [bp - 6]
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        callf   SEG_DEEA:far_deeab
        jmp     br_bfe3f
tgt_bfe3a:
        mov     word ptr [bp - 2], 1
br_bfe3f:
        cmp     word ptr [bp - 2], 0
        jnz     br_bfe48
        jmp     br_bf540
br_bfe48:
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
TBL_bfe4e:
        dw      tgt_bfc8e
        dw      tgt_bfe3a
        dw      tgt_bfe3a
        dw      tgt_bfe3a
        dw      tgt_bfe3a
        dw      tgt_bfdfe
        dw      tgt_bfe3a
        dw      tgt_bfe3a
        dw      tgt_bfc64
        dw      tgt_bfe3a
        dw      tgt_bfe3a
        dw      tgt_bfc06
        dw      tgt_bfc26
        dw      tgt_bfc3a
TBL_bfe6a:
        dw      tgt_bf588
        dw      tgt_bf69f
        dw      tgt_bf708
        dw      tgt_bf740
        dw      tgt_bf763
        dw      tgt_bfb9d
        dw      tgt_bf789
        dw      tgt_bf7ea
        dw      tgt_bf8f6
        dw      tgt_bf906
        dw      tgt_bfa8e
        dw      tgt_bf98a
        dw      tgt_bfa8e
        dw      tgt_bfa8e
        dw      tgt_bfb82
        dw      tgt_bfa8e
        dw      tgt_bfa8e
        dw      tgt_bf98a
        dw      tgt_bf98a
fn_bfe90:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        mov     si, word ptr [bp + 6]
        push    si
        callf   SEG_E15E:far_e15e2
        add     sp, 2
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jnz     br_bfee0
        push    word ptr [bp + 8]
        nop
        push    cs
        call    fn_bfee6
        add     sp, 2
        mov     ax, word ptr [bp + 0ah]
        or      ax, word ptr [bp + 0ch]
        jz      br_bfecc
        push    si
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        callf   SEG_E4D1:far_e4ee4
        add     sp, 6
br_bfecc:
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    0
        callf   SEG_EA92:far_ea926
        add     sp, 2
br_bfee0:
        mov     ax, word ptr [bp - 2]
        pop     si
        leave
        retf
fn_bfee6:
        push    bp
        mov     bp, sp
        callf   SEG_E3B7:far_e3b75
        dec     byte ptr [B_956A]
        mov     al, byte ptr [bp + 6]
        mov     byte ptr [B_8A9A], al
        cbw
        mov     bx, ax
        cmp     byte ptr [bx + TBL_905D], 0ffh
        jnz     br_bff0e
        push    ds
        push    word B_901B
        callf   SEG_E344:far_e37be
        add     sp, 4
br_bff0e:
        mov     al, byte ptr [B_8A9A]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_905D]
        mov     byte ptr [B_8A9C], al
        push    ds
        push    word A_93F7
        push    ax
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_E4D1:far_e4d15
        add     sp, 8
        push    9
        callf   SEG_B05A:far_b1073
        add     sp, 2
        nop
        push    cs
        call    fn_c01d2
        nop
        push    cs
        call    fn_c007f
        push    0ah
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    11h
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    12h
        callf   SEG_B05A:far_b1073
        add     sp, 2
        nop
        push    cs
        call    fn_c0254
        nop
        push    cs
        call    fn_bfff8
        nop
        push    cs
        call    fn_c0446
        pop     bp
        retf
far_bff70:
        cmp     byte ptr [B_D60A], 0
        jz      br_bff92
        mov     al, byte ptr [B_7FCB]
        cbw
        push    ax
        mov     al, byte ptr [B_7FCA]
        cbw
        push    ax
        push    word ptr [W_D657]
        callf   SEG_DE78:far_de88f
        add     sp, 6
        mov     word ptr [W_D659], ax
        jmp     br_bffa3
br_bff92:
        mov     al, byte ptr [B_7FCA]
        cbw
        push    ax
        push    word ptr [W_D659]
        callf   SEG_E707:far_e710e
        add     sp, 4
br_bffa3:
        cmp     byte ptr [B_A5C2], 0
        jnz     br_bffc8
        push    ds
        push    word W_D5F3
        push    word ptr [W_9047]
        push    word ptr [W_9045]
        callf   SEG_EB86:far_eb86b
        add     sp, 8
        push    0
        callf   SEG_EA92:far_ea926
        add     sp, 2
br_bffc8:
        retf
far_bffc9:
        push    0
        push    6
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_4B70
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        callf   SEG_EA92:far_ea926
        add     sp, 2
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
