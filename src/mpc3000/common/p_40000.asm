; ROM 40000h v3.12 image; v3.08/v3.11/v3.12 shared; FW_VERSION for differences

        retf
fn_bfff8:
        push    0ch
        callf   SEG_B05A:far_b1073
        if      FW_VERSION >= 312
        db      083h
        phase   0d70h
        db      0c4h, 002h
        else
        add     sp, 2
        endif
        push    0dh
        callf   SEG_B05A:far_b1073
        add     sp, 2
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
        push    0eh
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    0fh
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    10h
        callf   SEG_B05A:far_b1073
        add     sp, 2
        cmp     byte ptr [B_EFAE], 0
        jnz     br_c005f
        push    4
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_4AA4
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_c005f:
        cmp     byte ptr [B_EFAF], 0
        jnz     br_c007e
        push    13h
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_4AA4
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_c007e:
        retf
fn_c007f:
        push    si
        mov     al, byte ptr [B_8A9C]
        cbw
        mov     si, ax
        mov     bx, ax
        mov     dl, byte ptr [bx + TBL_9125]
        cmp     dl, 0ffh
        jz      br_c00a5
        mov     al, dl
        and     al, 0fh
        inc     al
        mov     byte ptr [B_EFAE], al
        mov     al, dl
        cbw
        sar     ax, 4
        mov     byte ptr [B_EFAC], al
        jmp     br_c00ad
br_c00a5:
        mov     al, 0
        mov     byte ptr [B_EFAC], al
        mov     byte ptr [B_EFAE], al
br_c00ad:
        mov     dl, byte ptr [si + TBL_9189]
        cmp     dl, 0ffh
        jz      br_c00ca
        mov     al, dl
        and     al, 0fh
        inc     al
        mov     byte ptr [B_EFAF], al
        mov     al, dl
        cbw
        sar     ax, 4
        mov     byte ptr [B_EFAD], al
        jmp     br_c00d2
br_c00ca:
        mov     al, 0
        mov     byte ptr [B_EFAD], al
        mov     byte ptr [B_EFAF], al
br_c00d2:
        mov     al, byte ptr [B_EFAE]
        mov     byte ptr [B_EFAA], al
        mov     al, byte ptr [B_EFAF]
        mov     byte ptr [B_EFAB], al
        mov     al, byte ptr [B_EFAC]
        mov     byte ptr [B_EFA8], al
        mov     al, byte ptr [B_EFAD]
        mov     byte ptr [B_EFA9], al
        mov     al, byte ptr [si + TBL_9251]
        mov     byte ptr [B_EFA6], al
        mov     al, byte ptr [si + TBL_91ED]
        mov     byte ptr [B_EFA5], al
        push    si
        callf   SEG_E4A1:far_e4a1d
        add     sp, 2
        mov     byte ptr [B_EFA4], al
        mov     byte ptr [B_EFA7], al
        if      FW_VERSION = 311
        phase   0e80h
        endif
        pop     si
        retf
fn_c0109:
        push    si
        callf   SEG_E3B7:far_e3b75
        mov     al, byte ptr [B_8A9C]
        cbw
        mov     si, ax
        mov     dl, byte ptr [B_EFA6]
        mov     bx, ax
        mov     byte ptr [bx + TBL_9251], dl
        mov     al, byte ptr [B_EFA5]
        mov     byte ptr [si + TBL_91ED], al
        mov     al, byte ptr [B_EFAE]
        cbw
        push    ax
        mov     al, byte ptr [B_EFAC]
        cbw
        push    ax
        nop
        push    cs
        call    fn_c0428
        add     sp, 4
        push    ax
        mov     al, byte ptr [B_8A9C]
        cbw
        mov     bx, ax
        pop     ax
        mov     byte ptr [bx + TBL_9125], al
        mov     al, byte ptr [B_EFAF]
        cbw
        push    ax
        mov     al, byte ptr [B_EFAD]
        cbw
        push    ax
        nop
        push    cs
        call    fn_c0428
        add     sp, 4
        push    ax
        mov     al, byte ptr [B_8A9C]
        cbw
        mov     bx, ax
        pop     ax
        mov     byte ptr [bx + TBL_9189], al
        mov     al, byte ptr [B_EFAE]
        mov     byte ptr [B_EFAA], al
        mov     al, byte ptr [B_EFAF]
        mov     byte ptr [B_EFAB], al
        mov     al, byte ptr [B_EFAC]
        mov     byte ptr [B_EFA8], al
        mov     al, byte ptr [B_EFAD]
        mov     byte ptr [B_EFA9], al
        dec     byte ptr [B_956A]
        pop     si
        retf
fn_c0180:
        mov     al, byte ptr [B_8A9C]
        cbw
        mov     bx, ax
        test    byte ptr [bx + TBL_90C1], 1
        jz      br_c0190
        xor     ax, ax
        retf
br_c0190:
        mov     ax, 1
        retf
fn_c0194:
        push    bp
        mov     bp, sp
        push    1
        mov     ax, 1
        sub     ax, word ptr [bp + 6]
        push    ax
        nop
        push    cs
        call    fn_c01aa
        add     sp, 4
        pop     bp
        retf
fn_c01aa:
        push    bp
        mov     bp, sp
        mov     cl, byte ptr [bp + 8]
        cmp     word ptr [bp + 6], 0
        jz      br_c01c2
        mov     al, byte ptr [B_8A9C]
        cbw
        mov     bx, ax
        or      byte ptr [bx + TBL_90C1], cl
        pop     bp
        retf
br_c01c2:
        mov     al, byte ptr [B_8A9C]
        cbw
        mov     dl, cl
        not     dl
        mov     bx, ax
        and     byte ptr [bx + TBL_90C1], dl
        pop     bp
        retf
fn_c01d2:
        push    cs
        call    fn_c0180
        mov     byte ptr [B_EFB0], al
        push    0bh
        callf   SEG_B05A:far_b1073
        add     sp, 2
        retf
fn_c01e4:
        push    12h
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     byte ptr [B_A56E], 0
        jnz     br_c0204
        push    ds
        push    word A_4AA4
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        retf
br_c0204:
        push    ds
        push    word STR_4B99
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        retf
fn_c0211:
        mov     al, byte ptr [B_901C]
        and     al, 1
        mov     byte ptr [B_EFB3], al
        mov     ax, word ptr [W_904D]
        mov     word ptr [W_EFB1], ax
        push    6
        callf   SEG_B05A:far_b1073
        add     sp, 2
        cmp     byte ptr [B_EFB3], 0
        jnz     br_c0249
        push    24h
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_4B9D
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        retf
br_c0249:
        push    7
        callf   SEG_B05A:far_b1073
        add     sp, 2
        retf
fn_c0254:
        cmp     byte ptr [B_EFA5], 0
        jnz     br_c0273
        push    25h
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_4AA4
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_c0273:
        retf
fn_c0274:
        push    bp
        mov     bp, sp
        push    si
        push    di
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    fn_c0428
        add     sp, 4
        mov     bx, ax
        cmp     bx, 0ffffh
        jnz     br_c029e
        les     di, dword ptr [bp + 0ah]
        mov     si, STR_4BA1
        mov     cx, 4
        rep movsw
        movsb
        pop     di
        pop     si
        pop     bp
        retf
br_c029e:
        push    ds
        pop     es
        mov     ax, bx
        mov     dx, 9
        imul    dx
        add     ax, A_7D87
        mov     dx, word ptr [bp + 0ch]
        mov     si, word ptr [bp + 0ah]
        mov     di, ax
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
        pop     di
        pop     si
        pop     bp
        retf
fn_c02d7:
        push    bp
        mov     bp, sp
        push    si
        push    di
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    fn_c0428
        add     sp, 4
        mov     bx, ax
        cmp     bx, 0ffffh
        jz      br_c0321
        push    ds
        pop     es
        mov     ax, bx
        mov     dx, 9
        imul    dx
        add     ax, A_7D87
        push    es
        les     di, dword ptr [bp + 0ah]
        push    ax
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
br_c0321:
        pop     di
        pop     si
        pop     bp
        retf
fn_c0325:
        push    0
        push    0
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     byte ptr [B_8A9E], 0
        jle     br_c034a
        mov     al, byte ptr [B_8A9E]
        cbw
        push    ax
        push    ds
        push    word STR_4BAA
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
        retf
br_c034a:
        cmp     byte ptr [B_901B], 0
        jnz     br_c035e
        push    ds
        push    word STR_4BD4
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        retf
br_c035e:
        push    ds
        push    word STR_4BEF
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        retf
far_c036b:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    ds
        push    word A_EFC6
        push    0ffffh
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_E4D1:far_e4d15
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
        push    cs
        call    fn_c007f
        cmp     byte ptr [B_9562], 0
        jz      br_c03a9
        mov     al, byte ptr [B_9561]
        jmp     br_c03ac
br_c03a9:
        mov     al, byte ptr [B_8A9F]
br_c03ac:
        cbw
        mov     word ptr [bp - 2], ax
        leave
        retf
fn_c03b2:
        push    bp
        mov     bp, sp
        push    cs
        call    far_c036b
        les     bx, dword ptr [bp + 6]
        mov     word ptr es:[bx], ax
        push    0
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    1
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
        push    11h
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    12h
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    cs
        call    fn_c0211
        push    cs
        call    fn_c01d2
        push    cs
        call    fn_bfff8
        push    cs
        call    fn_c0254
        mov     al, byte ptr [B_A5C2]
        cbw
        push    ax
        callf   SEG_EA92:far_ea926
        add     sp, 2
        push    cs
        call    fn_c0325
        pop     bp
        retf
fn_c0428:
        push    bp
        mov     bp, sp
        mov     bx, word ptr [bp + 8]
        or      bx, bx
        jz      br_c0441
        mov     ax, word ptr [bp + 6]
        shl     ax, 4
        push    ax
        mov     ax, bx
        pop     dx
        add     ax, dx
        dec     ax
        pop     bp
        retf
br_c0441:
        mov     ax, 0ffffh
        pop     bp
        retf
fn_c0446:
        push    bp
        mov     bp, sp
        sub     sp, 4
        mov     ax, word ptr [W_901D]
        or      ax, word ptr [W_901F]
        jz      br_c04a9
        les     bx, dword ptr [W_901D]
        mov     al, byte ptr [B_8A9A]
        mov     byte ptr es:[bx + 14eh], al
        mov     ax, word ptr [W_901F]
        mov     dx, word ptr [W_901D]
        add     dx, 151h
        adc     ax, 0
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        mov     al, byte ptr es:[bx + 150h]
        cbw
        mov     dx, ax
        jmp     br_c04a2
loop_c047f:
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx]
        cmp     al, byte ptr [B_8A9C]
        jnz     br_c049e
        mov     al, byte ptr [B_8A9C]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_90C1]
        mov     bx, word ptr [bp - 4]
        mov     byte ptr es:[bx + 2], al
        leave
        retf
br_c049e:
        add     word ptr [bp - 4], 18h
br_c04a2:
        mov     ax, dx
        dec     dx
        or      ax, ax
        jnz     loop_c047f
br_c04a9:
        leave
        retf
        if      FW_VERSION >= 312
        phase   0bh
        elseif  FW_VERSION = 311
        phase   4
        else
        phase   0ch
        endif
far_c04ab:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    si
        mov     word ptr [bp - 2], 4dh
        xor     si, si
        jmp     br_c06cb
br_c04bc:
        callf   SEG_B05A:far_b05a7
        callf   SEG_B1AA:far_b1aac
        mov     byte ptr [B_D5DD], 0
        cmp     byte ptr [B_9562], 0
        jz      br_c0508
        mov     ax, word ptr [bp - 2]
        cmp     ax, 47h
        jz      br_c04ef
        jg      br_c04e8
        cmp     ax, 42h
        jz      br_c04ef
        cmp     ax, 46h
        jz      br_c04ef
        jmp     br_c0500
br_c04e8:
        cmp     ax, 55h
        jz      br_c04ef
        jmp     br_c0500
br_c04ef:
        push    0ffd8h
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        callf   SEG_B1AA:far_b1aac
        jmp     br_c050e
br_c0500:
        mov     al, byte ptr [bp - 2]
        mov     byte ptr [B_D5DE], al
        jmp     br_c050e
br_c0508:
        mov     al, byte ptr [bp - 2]
        mov     byte ptr [B_D5DE], al
br_c050e:
        mov     al, byte ptr [B_D5DE]
        cbw
        cmp     ax, 4ch
        jnz     br_c051a
        jmp     br_c060d
br_c051a:
        jg      br_c056a
        cmp     ax, 45h
        jnz     br_c0524
        jmp     br_c0684
br_c0524:
        jg      br_c0556
        cmp     ax, 2fh
        jnz     br_c052e
        jmp     near br_c05cc
br_c052e:
        jg      br_c0543
        cmp     ax, 1
        jnz     br_c0538
        jmp     near br_c05dc
br_c0538:
        cmp     ax, 20h
        jnz     br_c0540
        jmp     br_c06ac
br_c0540:
        jmp     tgt_c06b1
br_c0543:
        cmp     ax, 41h
        jnz     br_c054b
        jmp     br_c066b
br_c054b:
        cmp     ax, 42h
        jnz     br_c0553
        jmp     br_c0652
br_c0553:
        jmp     tgt_c06b1
br_c0556:
        sub     ax, 46h
        mov     bx, ax
        cmp     bx, 5
        jbe     br_c0563
        jmp     tgt_c06b1
br_c0563:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c06ff]
br_c056a:
        cmp     ax, 62h
        jnz     br_c0572
        jmp     br_c0698
br_c0572:
        jg      br_c0588
        sub     ax, 4dh
        mov     bx, ax
        cmp     bx, 8
        jbe     br_c0581
        jmp     tgt_c06b1
br_c0581:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c06ed]
br_c0588:
        sub     ax, 69h
        mov     bx, ax
        cmp     bx, 0bh
        jbe     br_c0595
        jmp     tgt_c06b1
br_c0595:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c06d5]
tgt_c059c:
        cmp     byte ptr [B_8800], 0
        jz      br_c05a8
        callf   SEG_E6FE:far_e7069
br_c05a8:
        callf   SEG_BF29:far_bf294
        mov     word ptr [bp - 2], ax
        jmp     br_c06cb
tgt_c05b3:
        mov     al, byte ptr [B_8800]
        mov     ah, 0
        or      ax, ax
        jnz     br_c05c1
        callf   SEG_E6FE:far_e6fef
br_c05c1:
        callf   SEG_B3EF:far_b3efe
        mov     word ptr [bp - 2], ax
        jmp     br_c06cb
br_c05cc:
        callf   SEG_E6FE:far_e6fef
        callf   SEG_BEF6:far_bef6c
        mov     word ptr [bp - 2], ax
        jmp     br_c06cb
br_c05dc:
        callf   SEG_C689:far_c6ae0
        mov     word ptr [bp - 2], ax
        jmp     br_c06cb
tgt_c05e7:
        callf   SEG_E6FE:far_e7069
        callf   SEG_B52D:far_b52de
        mov     word ptr [bp - 2], ax
        jmp     br_c06cb
tgt_c05f7:
        callf   SEG_C936:far_c936b
        mov     word ptr [bp - 2], ax
        jmp     br_c06cb
tgt_c0602:
        callf   SEG_C0EE:far_c0eeb
        mov     word ptr [bp - 2], ax
        jmp     near br_c06cb
br_c060d:
        callf   SEG_C495:far_c495e
        mov     word ptr [bp - 2], ax
        jmp     near br_c06cb
tgt_c0618:
        callf   SEG_E6FE:far_e7069
        callf   SEG_B702:far_b7024
        mov     word ptr [bp - 2], ax
        jmp     near br_c06cb
tgt_c0628:
        callf   SEG_E6FE:far_e7069
        callf   SEG_C842:far_c842f
        mov     word ptr [bp - 2], ax
        jmp     near br_c06cb
tgt_c0638:
        callf   SEG_E6FE:far_e7069
        callf   SEG_BF0C:far_bf0c7
        mov     word ptr [bp - 2], ax
        jmp     near br_c06cb
tgt_c0648:
        callf   SEG_C46B:far_c46bf
        mov     word ptr [bp - 2], ax
        jmp     short br_c06cb
br_c0652:
        callf   SEG_E6FE:far_e6fef
        callf   SEG_B3E0:far_b3e07
        mov     word ptr [bp - 2], ax
        jmp     br_c06cb
tgt_c0661:
        callf   SEG_C074:far_c0743
        mov     word ptr [bp - 2], ax
        jmp     br_c06cb
br_c066b:
        callf   SEG_E6FE:far_e7069
        callf   SEG_C65C:far_c65cd
        mov     word ptr [bp - 2], ax
        jmp     br_c06cb
tgt_c067a:
        callf   SEG_CA83:far_ca832
        mov     word ptr [bp - 2], ax
        jmp     br_c06cb
br_c0684:
        callf   SEG_B920:far_b9205
        mov     word ptr [bp - 2], ax
        jmp     br_c06cb
tgt_c068e:
        callf   SEG_CA3C:far_ca3c4
        mov     word ptr [bp - 2], ax
        jmp     br_c06cb
br_c0698:
        callf   SEG_BA40:far_ba406
        mov     word ptr [bp - 2], ax
        jmp     br_c06cb
tgt_c06a2:
        callf   SEG_BA40:far_ba670
        mov     word ptr [bp - 2], ax
        jmp     br_c06cb
br_c06ac:
        mov     si, 1
        jmp     br_c06cb
tgt_c06b1:
        mov     al, byte ptr [bp - 2]
        mov     byte ptr [bp - 6], al
        mov     byte ptr [bp - 5], 0
        push    ss
        lea     ax, [bp - 6]
        push    ax
        nop
        push    cs
        call    fn_c070b
        add     sp, 4
        mov     word ptr [bp - 2], ax
br_c06cb:
        or      si, si
        jnz     br_c06d2
        jmp     br_c04bc
br_c06d2:
        pop     si
        leave
        retf
TBL_c06d5:
        dw      tgt_c06a2
        dw      tgt_c06b1
        dw      tgt_c06b1
        dw      tgt_c0638
        dw      tgt_c06b1
        dw      tgt_c06b1
        dw      tgt_c06b1
        dw      tgt_c06b1
        dw      tgt_c06b1
        dw      tgt_c06b1
        dw      tgt_c0661
        dw      tgt_c067a
TBL_c06ed:
        dw      tgt_c059c
        dw      tgt_c06b1
        dw      tgt_c0648
        dw      tgt_c06b1
        dw      tgt_c06b1
        dw      tgt_c068e
        dw      tgt_c0628
        dw      tgt_c06b1
        dw      tgt_c0618
TBL_c06ff:
        dw      tgt_c05e7
        dw      tgt_c05b3
        dw      tgt_c06b1
        dw      tgt_c06b1
        dw      tgt_c0602
        dw      tgt_c05f7
fn_c070b:
        push    bp
        mov     bp, sp
        callf   SEG_B1AA:far_b1aac
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word STR_4BFC
        elseif  FW_VERSION = 311
        push    word STR_4BFC
        else
        push    word STR_4BFC
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word STR_4C1C+2
        elseif  FW_VERSION = 311
        push    word STR_4C1C+2
        else
        push    word STR_4C1C+2
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_D79E:far_d79ee
        mov     ax, 4dh
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   3
        elseif  FW_VERSION = 311
        phase   0ch
        else
        phase   4
        endif
far_c0743:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    ds
        push    word STR_4CA4
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word P_4CA9
        elseif  FW_VERSION = 311
        push    word P_4CA9
        else
        push    word P_4CA9
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    0
        if      FW_VERSION >= 311
        push    5
        else
        push    4
        endif
        push    ss
        lea     ax, [bp - 1]
        push    ax
        callf   SEG_EBCC:far_ebcce
        add     sp, 8
        mov     dl, al
        or      dl, dl
        jnz     br_c07f1
        mov     al, byte ptr [bp - 1]
        mov     byte ptr [B_D5DD], al
        cbw
        dec     ax
        mov     bx, ax
        if      FW_VERSION >= 311
        cmp     bx, 4
        else
        cmp     bx, 3
        endif
        ja      br_c07f1
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c07f6]
        if      FW_VERSION >= 311
tgt_c0793:
        nop
        push    cs
        call    fn_c0857
        mov     dl, al
        jmp     br_c07f1
        endif
tgt_c079c:
        nop
        push    cs
        if      FW_VERSION >= 311
        call    fn_c09fd
        else
        call    L_c9dad
        endif
        mov     dl, al
        jmp     br_c07f1
tgt_c07a5:
        nop
        push    cs
        if      FW_VERSION >= 311
        call    fn_c0bc3
        else
        call    L_c9f26
        endif
        mov     dl, al
        jmp     br_c07f1
tgt_c07ae:
        nop
        push    cs
        if      FW_VERSION >= 311
        call    fn_c0e4d
        else
        call    L_ca0ec
        endif
        mov     dl, al
        jmp     br_c07f1
tgt_c07b7:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_4D2F
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        callf   SEG_E6FE:far_e6fef
        or      byte ptr [B_955C], 10h
        push    3
        callf   SEG_B059:far_b059a
        add     sp, 2
        mov     dl, byte ptr [B_D4C2]
br_c07f1:
        mov     al, dl
        cbw
        leave
        retf
TBL_c07f6:
        if      FW_VERSION >= 311
        dw      tgt_c0793
        endif
        dw      tgt_c079c
        dw      tgt_c07a5
        dw      tgt_c07ae
        dw      tgt_c07b7
fn_c0800:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp + 6]
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     si, 22h
        jle     br_c0848
        push    ds
        push    word STR_4D4C
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     bx, si
        shl     bx, 2
        push    word ptr [bx + 3feh]
        push    word ptr [bx + 3fch]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    29h
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        pop     si
        pop     bp
        retf
br_c0848:
        push    ds
        push    word STR_4D57
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        pop     si
        pop     bp
        retf
        if      FW_VERSION >= 311
fn_c0857:
        else
L_c9dad:
        endif
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    ds
        push    word STR_4D6E
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        callf   SEG_E6FE:far_e7069
        push    7
        push    ds
        if      FW_VERSION >= 312
        push    word P_4C3B+0dh
        elseif  FW_VERSION = 311
        push    word P_4B91_V311+0dh
        else
        push    word P_46E1_V308+0dh
        endif
        push    ds
        push    word B_8189
        push    ds
        push    word STR_4D8A
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION >= 312
        cmp     byte ptr [B_D4BF], 0
        jl      L_c089e
        cmp     byte ptr [B_D4BF], 3fh
        jle     L_c08a3
L_c089e:
        mov     byte ptr [B_D4BF], 0
L_c08a3:
        endif
        mov     al, byte ptr [B_D4BF]
        mov     byte ptr [bp - 1], al
        push    3
        push    ds
        push    word P_0270+4
        push    ss
        lea     ax, [bp - 1]
        push    ax
        push    ds
        push    word STR_4D90
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        mov     byte ptr [bp - 2], al
        push    8
        push    62h
        push    22h
        push    2
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ds
        push    word STR_4D95
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0fh
        push    2
        mov     al, byte ptr [bp - 2]
        push    ax
        callf   SEG_C495:far_c530b
        add     sp, 6
        push    12h
        push    2
        mov     al, byte ptr [bp - 2]
        cbw
        push    ax
        push    cs
        call    fn_c0800
        add     sp, 6
        callf   SEG_B702:far_b90dd
        xor     dx, dx
        if      FW_VERSION >= 312
        jmp     br_c09f2
        else
        jmp     near br_c09f2
        endif
loop_c0913:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jz      br_c0927
        cmp     ax, 1
        jz      br_c0927
        cmp     ax, 2
        jz      br_c0941
        jmp     br_c0973
br_c0927:
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        mov     byte ptr [bp - 2], al
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_c0941:
        mov     al, byte ptr [bp - 2]
        cbw
        push    ax
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_DAB0:far_dab6c
        add     sp, 4
        push    0fh
        push    2
        mov     al, byte ptr [bp - 2]
        push    ax
        callf   SEG_C495:far_c530b
        add     sp, 6
        push    12h
        push    2
        mov     al, byte ptr [bp - 2]
        cbw
        push    ax
        push    cs
        call    fn_c0800
        add     sp, 6
br_c0973:
        push    40h
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_c0913
        cmp     ax, 44h
        jz      L_c098f
        cmp     ax, 4eh
        jz      br_c09f0
        jmp     br_c09f2
L_c098f:
        if      FW_VERSION >= 312
        cmp     byte ptr [B_D4BF], 0
        jl      L_c099d
        cmp     byte ptr [B_D4BF], 3fh
        jle     L_c09a6
L_c099d:
        mov     byte ptr [B_D4BF], 0
        xor     dx, dx
        jmp     br_c09f2
L_c09a6:
        endif
        mov     al, byte ptr [B_D4BF]
        mov     byte ptr [bp - 1], al
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        mov     byte ptr [bp - 2], al
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    0fh
        push    2
        mov     al, byte ptr [bp - 2]
        push    ax
        callf   SEG_C495:far_c530b
        add     sp, 6
        push    12h
        push    2
        mov     al, byte ptr [bp - 2]
        cbw
        push    ax
        push    cs
        call    fn_c0800
        add     sp, 6
br_c09f0:
        xor     dx, dx
br_c09f2:
        or      dx, dx
        if      FW_VERSION >= 312
        jnz     L_c09f9
        jmp     near br_c0973
L_c09f9:
        else
        jz      br_c0973
        endif
        mov     ax, dx
        leave
        retf
        if      FW_VERSION >= 311
fn_c09fd:
        else
L_c9f26:
        endif
        push    si
        xor     si, si
        callf   SEG_E6FE:far_e7069
        jmp     tgt_c0b80
br_c0a08:
        push    ds
        push    word STR_4D9E
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    8
        push    10h
        push    0
        push    3
        push    ds
        push    word B_8188
        push    ds
        push    word STR_4DAB
        callf   SEG_B347:far_b3819
        add     sp, 10h
        nop
        push    cs
        call    fn_c0ba3
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    3
        push    ds
        push    word P_0030
        push    ds
        push    word B_8184
        push    ds
        push    word STR_4DC9
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    1bh
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    3
        push    ds
        push    word P_0030
        push    ds
        push    word B_8183
        push    ds
        push    word STR_4DD5
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    7fh
        push    0
        push    3
        push    ds
        push    word B_83C9
        push    ds
        push    word STR_4DE0
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    3
        push    ds
        push    word P_0030
        push    ds
        push    word B_8185
        push    ds
        push    word STR_4E06
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_4E29
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_c0adb
loop_c0acc:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jz      br_c0ad6
        jmp     br_c0adb
br_c0ad6:
        nop
        push    cs
        call    fn_c0ba3
br_c0adb:
        push    4
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        or      ax, ax
        jz      loop_c0acc
        mov     bx, si
        sub     bx, 75h
        cmp     bx, 5
        ja      tgt_c0b3a
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c0b97]
tgt_c0afc:
        push    ds
        push    word STR_4E52
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        mov     al, 3ah
        mov     byte ptr [B_D5DD], al
        push    ax
        push    3
        push    66h
        callf   SEG_CDE9:far_d4dcd
        add     sp, 6
        jmp     tgt_c0b3a
tgt_c0b1c:
        push    ds
        push    word STR_4E6F
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        mov     al, 3bh
        mov     byte ptr [B_D5DD], al
        push    ax
        push    3
        push    66h
        callf   SEG_CDE9:far_d4dcd
        add     sp, 6
tgt_c0b3a:
        mov     bx, si
        sub     bx, 75h
        cmp     bx, 5
        ja      tgt_c0b80
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c0b8b]
tgt_c0b4b:
        push    ds
        push    word A_D4C3
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_4E90
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        cmp     si, 78h
        jnz     br_c0b7b
        xor     si, si
br_c0b7b:
        mov     byte ptr [B_D5DD], 2
tgt_c0b80:
        or      si, si
        jnz     br_c0b87
        jmp     br_c0a08
br_c0b87:
        mov     ax, si
        pop     si
        retf
TBL_c0b8b:
        dw      tgt_c0b4b
        dw      tgt_c0b80
        dw      tgt_c0b80
        dw      tgt_c0b4b
        dw      tgt_c0b4b
        dw      tgt_c0b4b
TBL_c0b97:
        dw      tgt_c0b1c
        dw      tgt_c0b3a
        dw      tgt_c0b3a
        dw      tgt_c0afc
        dw      tgt_c0afc
        dw      tgt_c0b1c
fn_c0ba3:
        cmp     byte ptr [B_8188], 0
        jnz     br_c0bc2
        push    1dh
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_4E97
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_c0bc2:
        retf
        if      FW_VERSION >= 311
fn_c0bc3:
        else
L_ca0ec:
        endif
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        push    ds
        push    word STR_4E9B
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        callf   SEG_E6FE:far_e7069
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    7
        push    ds
        push    word A_4C54
        push    ds
        push    word B_8181
        push    ds
        push    word STR_4EB8
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    18h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    8
        push    7fh
        push    0
        push    3
        push    ds
        push    word B_E54C
        push    ds
        push    word STR_4EC5
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    7
        push    ds
        push    word A_4C54
        push    ds
        push    word B_8182
        push    ds
        push    word STR_4ED3
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_4EE0
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_4EF7
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ds
        push    word B_EFD8
        callf   SEG_B347:far_b38d8
        add     sp, 4
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_EFD8]
        mov     ah, 0
        mov     si, ax
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_7FEB]
        mov     byte ptr [bp - 1], al
        if      FW_VERSION >= 312
        mov     al, byte ptr [si +TBL_8075]
        elseif  FW_VERSION = 311
        mov     al, byte ptr [si +TBL_7FBD_V311]
        else
        mov     al, byte ptr [si +TBL_744B_V308]
        endif
        mov     byte ptr [bp - 2], al
        push    3
        push    ds
        push    word P_0020+4
        push    ss
        lea     ax, [bp - 1]
        push    ax
        push    ds
        push    word STR_4EFE
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    18h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    8
        push    7fh
        push    0
        push    3
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ds
        push    word A_4F0B
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    6
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    6
        push    ds
        if      FW_VERSION >= 312
        push    word P_4C3B+1
        elseif  FW_VERSION = 311
        push    word P_4B91_V311+1
        else
        push    word P_46E1_V308+1
        endif
        push    ds
        push    word B_817F
        push    ds
        push    word STR_4F17
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    18h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    8
        push    7fh
        push    1
        push    3
        push    ds
        push    word B_8180
        push    ds
        push    word STR_4F26
        callf   SEG_B347:far_b3819
        add     sp, 10h
        mov     al, byte ptr [bp - 2]
        cbw
        push    ax
        mov     al, byte ptr [B_EFD8]
        mov     ah, 0
        push    ax
        nop
        push    cs
        call    fn_c0df4
        add     sp, 4
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        push    3dh
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        xor     dx, dx
        jmp     near br_c0deb
br_c0d4e:
        mov     al, byte ptr [B_7B8D]
        cbw
        cmp     ax, 3
        jz      br_c0d63
        cmp     ax, 4
        jz      br_c0d98
        cmp     ax, 5
        jz      br_c0da8
        jmp     loop_c0dc7
br_c0d63:
        mov     al, byte ptr [B_EFD8]
        mov     ah, 0
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_7FEB]
        mov     byte ptr [bp - 1], al
        push    4
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [B_EFD8]
        mov     ah, 0
        mov     si, ax
        mov     bx, ax
        if      FW_VERSION >= 312
        mov     al, byte ptr [bx +TBL_8075]
        elseif  FW_VERSION = 311
        mov     al, byte ptr [bx +TBL_7FBD_V311]
        else
        mov     al, byte ptr [bx +TBL_744B_V308]
        endif
        mov     byte ptr [bp - 2], al
        cbw
        push    ax
        push    si
        nop
        push    cs
        call    fn_c0df4
        add     sp, 4
        jmp     loop_c0dc7
br_c0d98:
        mov     al, byte ptr [B_EFD8]
        mov     ah, 0
        mov     dl, byte ptr [bp - 1]
        mov     bx, ax
        mov     byte ptr [bx + TBL_7FEB], dl
        jmp     loop_c0dc7
br_c0da8:
        mov     al, byte ptr [bp - 2]
        cbw
        push    ax
        mov     al, byte ptr [B_EFD8]
        mov     ah, 0
        push    ax
        nop
        push    cs
        call    fn_c0df4
        add     sp, 4
        mov     dl, byte ptr [B_EFD8]
        mov     dh, 0
        mov     bx, dx
        if      FW_VERSION >= 312
        mov     byte ptr [bx +TBL_8075], al
        elseif  FW_VERSION = 311
        mov     byte ptr [bx +TBL_7FBD_V311], al
        else
        mov     byte ptr [bx +TBL_744B_V308], al
        endif
loop_c0dc7:
        push    0
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jnz     br_c0dda
        jmp     near br_c0d4e
br_c0dda:
        cmp     dx, 50h
        jnz     br_c0deb
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        xor     dx, dx
br_c0deb:
        or      dx, dx
        jz      loop_c0dc7
        mov     ax, dx
        pop     si
        leave
        retf
fn_c0df4:
        push    bp
        mov     bp, sp
        push    si
        push    di
        mov     si, word ptr [bp + 6]
        mov     di, word ptr [bp + 8]
        push    18h
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        or      si, si
        jz      br_c0e23
        cmp     si, 1
        jz      br_c0e23
        cmp     si, 4
        jz      br_c0e23
        cmp     si, 5
        jz      br_c0e23
        cmp     si, 29h
        jl      br_c0e31
br_c0e23:
        xor     di, di
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        jmp     br_c0e47
br_c0e31:
        push    ds
        push    word A_4F0B
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    5
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_c0e47:
        mov     ax, di
        pop     di
        pop     si
        pop     bp
        retf
        if      FW_VERSION >= 312
fn_c0e4d:
        push    ds
        push    word STR_4F3B
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        callf   SEG_E6FE:far_e7069
        push    3
        push    ds
        push    word P_0030
        push    ds
        push    word B_8437
        push    ds
        push    word STR_4F50
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    15h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    1
        push    ds
        push    word P_4C5B+5
        push    ds
        push    word B_8438
        push    ds
        push    word STR_4F5A
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_4F64
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        xor     dx, dx
        jmp     br_c0ee4
loop_c0eb5:
        mov     al, byte ptr [B_7B8D]
        cbw
        cmp     ax, 1
        jnz     loop_c0ed4
        cmp     byte ptr [B_8438], 0
        jnz     loop_c0ed4
        mov     byte ptr [B_8438], 1
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
loop_c0ed4:
        push    40h
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_c0eb5
br_c0ee4:
        or      dx, dx
        jz      loop_c0ed4
        mov     ax, dx
        retf
        phase   0bh
        elseif  FW_VERSION = 311
fn_c0e4d:
        push    ds
        push    word STR_4E91_V311
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        callf   SEG_E6FE:far_e7069
        push    3
        push    ds
        push    word P_0030
        push    ds
        push    word B_8437
        push    ds
        push    word STR_4EA6_V311
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    15h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    1
        push    ds
        push    word P_4BB1_V311+5
        push    ds
        push    word B_8438
        push    ds
        push    word STR_4EB0_V311
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_4EBA_V311
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        xor     dx, dx
        jmp     br_c0ee4
loop_c0eb5:
        mov     al, byte ptr [B_7B8D]
        cbw
        cmp     ax, 1
        jnz     loop_c0ed4
        cmp     byte ptr [B_8438], 0
        jnz     loop_c0ed4
        mov     byte ptr [B_8438], 1
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
loop_c0ed4:
        push    40h
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_c0eb5
br_c0ee4:
        or      dx, dx
        jz      loop_c0ed4
        mov     ax, dx
        retf
        phase   7
        else
        phase   6
        endif
far_c0eeb:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    ds
        push    word A_511C
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word P_5122
        elseif  FW_VERSION = 311
        push    word P_5122
        else
        push    word P_5122
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    5
        push    ss
        lea     ax, [bp - 1]
        push    ax
        callf   SEG_EBCC:far_ebcce
        add     sp, 8
        mov     dl, al
        or      dl, dl
        jnz     br_c0f72
        mov     al, byte ptr [bp - 1]
        mov     byte ptr [B_D5DD], al
        cbw
        dec     ax
        mov     bx, ax
        cmp     bx, 4
        ja      br_c0f72
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c0f77]
tgt_c0f47:
        nop
        push    cs
        call    fn_c0f81
        mov     dl, al
        jmp     br_c0f72
tgt_c0f50:
        nop
        push    cs
        call    fn_c1ebd
        mov     dl, al
        jmp     br_c0f72
tgt_c0f59:
        nop
        push    cs
        call    fn_c2187
        mov     dl, al
        jmp     br_c0f72
tgt_c0f62:
        nop
        push    cs
        call    fn_c29ef
        mov     dl, al
        jmp     br_c0f72
tgt_c0f6b:
        nop
        push    cs
        call    fn_c2c73
        mov     dl, al
br_c0f72:
        mov     al, dl
        cbw
        leave
        retf
TBL_c0f77:
        dw      tgt_c0f47
        dw      tgt_c0f50
        dw      tgt_c0f59
        dw      tgt_c0f62
        dw      tgt_c0f6b
fn_c0f81:
        push    bp
        mov     bp, sp
        sub     sp, 0eh
        push    si
        push    di
        mov     byte ptr [B_7B8D], 0
        callf   SEG_B1AA:far_b1aac
        cmp     byte ptr [B_901B], 0
        jge     br_c0fa7
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_E15E:far_e15e2
        add     sp, 2
br_c0fa7:
        mov     al, byte ptr [B_D4BF]
        cbw
        mov     bx, 10h
        cwd
        idiv    bx
        mov     word ptr [bp - 0ah], dx
        xor     ax, ax
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 0eh], ax
        mov     word ptr [bp - 0ch], ax
        mov     word ptr [bp - 8], 0
        push    ax
        push    ax
        push    dx
        mov     al, byte ptr [B_D4B5]
        cbw
        push    ax
        nop
        push    cs
        call    fn_c136e
        add     sp, 8
        jmp     br_c12a7
br_c0fd7:
        push    0
        callf   SEG_BA0A:far_ba0a7
        add     sp, 2
        mov     word ptr [bp - 6], ax
        cmp     ax, 48h
        jnz     br_c0fec
        jmp     br_c125b
br_c0fec:
        jg      br_c1026
        cmp     ax, 3ch
        jnz     br_c0ff6
        jmp     near br_c109d
br_c0ff6:
        jg      br_c1013
        cmp     ax, 21h
        jnz     br_c1000
        jmp     near br_c1085
br_c1000:
        cmp     ax, 2bh
        jnz     br_c1008
        jmp     br_c1244
br_c1008:
        cmp     ax, 2dh
        jnz     br_c1010
        jmp     br_c1244
br_c1010:
        jmp     br_c1287
br_c1013:
        cmp     ax, 3eh
        jnz     br_c101b
        jmp     near br_c10d2
br_c101b:
        cmp     ax, 44h
        jnz     br_c1023
        jmp     br_c1107
br_c1023:
        jmp     br_c1287
br_c1026:
        cmp     ax, 64h
        jnz     br_c102e
        jmp     br_c122c
br_c102e:
        jg      br_c1040
        cmp     ax, 50h
        jnz     br_c1038
        jmp     br_c1190
br_c1038:
        cmp     ax, 5eh
        jz      br_c106d
        jmp     br_c1287
br_c1040:
        cmp     ax, 68h
        jnz     br_c1048
        jmp     br_c1274
br_c1048:
        cmp     ax, 78h
        jz      br_c1050
        jmp     br_c1287
br_c1050:
        mov     ax, word ptr [bp - 0ch]
        neg     ax
        sbb     ax, ax
        inc     ax
        mov     word ptr [bp - 0ch], ax
        push    word ptr [bp - 0ah]
        push    word ptr [bp - 0eh]
        push    ax
        nop
        push    cs
        call    fn_c1326
        add     sp, 6
        jmp     br_c12a7
br_c106d:
        mov     word ptr [bp - 0eh], 1
        push    word ptr [bp - 0ah]
        push    1
        push    word ptr [bp - 0ch]
        nop
        push    cs
        call    fn_c1326
        add     sp, 6
        jmp     br_c12a7
br_c1085:
        mov     word ptr [bp - 0eh], 0
        push    word ptr [bp - 0ah]
        push    0
        push    word ptr [bp - 0ch]
        nop
        push    cs
        call    fn_c1326
        add     sp, 6
        jmp     br_c12a7
br_c109d:
        cmp     word ptr [bp - 0ah], 0
        jnz     br_c10a6
        jmp     br_c12a7
br_c10a6:
        cmp     word ptr [bp - 0ch], 0
        jz      br_c10b2
        dec     word ptr [bp - 0ah]
        jmp     br_c12a7
br_c10b2:
        push    word ptr [bp - 0ah]
        nop
        push    cs
        call    fn_c1da7
        add     sp, 2
        dec     word ptr [bp - 0ah]
        mov     ax, word ptr [bp - 0ah]
        push    ax
        push    word ptr [bp - 0eh]
        nop
        push    cs
        call    fn_c1805
        add     sp, 4
        jmp     br_c12a7
br_c10d2:
        cmp     word ptr [bp - 0ah], 0fh
        jl      br_c10db
        jmp     br_c12a7
br_c10db:
        cmp     word ptr [bp - 0ch], 0
        jz      br_c10e7
        inc     word ptr [bp - 0ah]
        jmp     br_c12a7
br_c10e7:
        push    word ptr [bp - 0ah]
        nop
        push    cs
        call    fn_c1da7
        add     sp, 2
        inc     word ptr [bp - 0ah]
        mov     ax, word ptr [bp - 0ah]
        push    ax
        push    word ptr [bp - 0eh]
        nop
        push    cs
        call    fn_c1805
        add     sp, 4
        jmp     br_c12a7
br_c1107:
        mov     al, byte ptr [B_D4BF]
        cbw
        mov     si, ax
        mov     al, byte ptr [B_D4B5]
        cbw
        or      ax, ax
        jz      br_c1121
        cmp     ax, 10h
        jz      br_c1129
        cmp     ax, 20h
        jz      br_c1139
        jmp     br_c1149
br_c1121:
        cmp     si, 10h
        jl      br_c1151
        jmp     br_c12a7
br_c1129:
        cmp     si, 10h
        jge     br_c1131
        jmp     br_c12a7
br_c1131:
        cmp     si, 20h
        jl      br_c1151
        jmp     br_c12a7
br_c1139:
        cmp     si, 20h
        jge     br_c1141
        jmp     br_c12a7
br_c1141:
        cmp     si, 30h
        jl      br_c1151
        jmp     br_c12a7
br_c1149:
        cmp     si, 30h
        jge     br_c1151
        jmp     br_c12a7
br_c1151:
        cmp     word ptr [bp - 0ch], 0
        jnz     br_c1162
        push    word ptr [bp - 0ah]
        nop
        push    cs
        call    fn_c1da7
        add     sp, 2
br_c1162:
        mov     ax, si
        mov     bx, 10h
        cwd
        idiv    bx
        mov     word ptr [bp - 0ah], dx
        cmp     word ptr [bp - 0ch], 0
        jz      br_c1176
        jmp     br_c12a7
br_c1176:
        push    dx
        nop
        push    cs
        call    fn_c1da7
        add     sp, 2
        push    word ptr [bp - 0ah]
        push    word ptr [bp - 0eh]
        nop
        push    cs
        call    fn_c1805
        add     sp, 4
        jmp     br_c12a7
br_c1190:
        mov     al, byte ptr [B_9482]
        cbw
        cmp     ax, 1
        jz      br_c11a1
        cmp     ax, 2
        jz      br_c11dd
        jmp     br_c12a7
br_c11a1:
        xor     di, di
loop_c11a3:
        mov     al, byte ptr [B_D4B5]
        cbw
        mov     si, di
        add     si, ax
        cmp     byte ptr [si + TBL_9503], 0ffh
        jz      br_c11cf
        mov     al, byte ptr [si + TBL_9503]
        cbw
        push    ax
        push    si
        if      FW_VERSION >= 311
        callf   SEG_DA5F:far_da5fe
        else
        callf   0e304h:L_e3041
        endif
        add     sp, 4
        push    di
        nop
        push    cs
        call    fn_c13d7
        add     sp, 2
        mov     byte ptr [si + TBL_9503], 0ffh
br_c11cf:
        inc     di
        cmp     di, 10h
        jl      loop_c11a3
        mov     byte ptr [B_9482], 0
        jmp     br_c12a7
br_c11dd:
        xor     di, di
loop_c11df:
        mov     al, byte ptr [B_D4B5]
        cbw
        mov     si, di
        add     si, ax
        cmp     byte ptr [si + TBL_94C3], 0ffh
        jz      br_c121f
        push    si
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        push    ax
        callf   SEG_CB8A:far_cbb70
        add     sp, 2
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        mov     al, byte ptr [si + TBL_94C3]
        les     bx, dword ptr [bp - 4]
        mov     byte ptr es:[bx + 1], al
        push    di
        nop
        push    cs
        call    fn_c1497
        add     sp, 2
        mov     byte ptr [si + TBL_94C3], 0ffh
br_c121f:
        inc     di
        cmp     di, 10h
        jl      loop_c11df
        mov     byte ptr [B_9482], 0
        jmp     short br_c12a7
br_c122c:
        push    word ptr [bp - 0ch]
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 0ah]
        mov     al, byte ptr [B_D4B5]
        cbw
        push    ax
        nop
        push    cs
        call    fn_c136e
        add     sp, 8
        jmp     br_c12a7
br_c1244:
        push    word ptr [bp - 0ch]
        push    word ptr [bp - 0ah]
        push    word ptr [bp - 0eh]
        mov     al, byte ptr [bp - 6]
        push    ax
        nop
        push    cs
        call    fn_c1b42
        add     sp, 8
        jmp     br_c12a7
br_c125b:
        mov     al, byte ptr [B_D4BB]
        cbw
        or      ax, ax
        jnz     br_c12a7
        nop
        push    cs
        call    far_c12e7
        callf   SEG_B05A:far_b129e
        mov     byte ptr [B_D4BB], 1
        jmp     br_c12a7
br_c1274:
        cmp     byte ptr [B_D4BB], 0
        jz      br_c12a7
        nop
        push    cs
        call    fn_c1e3d
        mov     byte ptr [B_D4BB], 0
        jmp     br_c12a7
br_c1287:
        push    0
        push    word ptr [bp - 6]
        callf   SEG_EBCC:far_ebde1
        add     sp, 4
        mov     word ptr [bp - 6], ax
        cmp     word ptr [bp - 6], 0
        jz      br_c12a7
        nop
        push    cs
        call    far_c12e7
        mov     word ptr [bp - 8], 1
br_c12a7:
        cmp     word ptr [bp - 8], 0
        jnz     br_c12b0
        jmp     br_c0fd7
br_c12b0:
        mov     ax, word ptr [bp - 6]
        pop     di
        pop     si
        leave
        retf
far_c12b7:
        push    si
        push    0
        push    0ah
        nop
        push    cs
        call    fn_c1e77
        add     sp, 4
        push    0
        push    0bh
        nop
        push    cs
        call    fn_c1e77
        add     sp, 4
        xor     si, si
loop_c12d2:
        push    0
        push    0ch
        nop
        push    cs
        call    fn_c1e77
        add     sp, 4
        inc     si
        cmp     si, 780h
        jl      loop_c12d2
        pop     si
        retf
far_c12e7:
        push    cs
        call    far_c12b7
        push    3ch
        push    0
        nop
        push    cs
        call    fn_c1e77
        add     sp, 4
        push    75h
        push    1
        nop
        push    cs
        call    fn_c1e77
        add     sp, 4
        push    27h
        push    2
        nop
        push    cs
        call    fn_c1e77
        add     sp, 4
        push    3fh
        push    3
        nop
        push    cs
        call    fn_c1e77
        add     sp, 4
        callf   SEG_B1AA:far_b1aac
        mov     byte ptr [B_96EF], 0
        retf
fn_c1326:
        push    bp
        mov     bp, sp
        push    si
        push    di
        mov     di, word ptr [bp + 8]
        cmp     word ptr [bp + 6], 0
        jz      br_c1348
        xor     si, si
loop_c1336:
        push    si
        push    di
        nop
        push    cs
        call    fn_c1805
        add     sp, 4
        inc     si
        cmp     si, 10h
        jl      loop_c1336
        jmp     br_c135e
br_c1348:
        xor     si, si
loop_c134a:
        cmp     si, word ptr [bp + 0ah]
        jz      br_c1358
        push    si
        nop
        push    cs
        call    fn_c1da7
        add     sp, 2
br_c1358:
        inc     si
        cmp     si, 10h
        jl      loop_c134a
br_c135e:
        push    word ptr [bp + 0ah]
        push    di
        nop
        push    cs
        call    fn_c1805
        add     sp, 4
        pop     di
        pop     si
        pop     bp
        retf
fn_c136e:
        push    bp
        mov     bp, sp
        push    si
        push    di
        inc     word ptr [B_EFDA]
        mov     cx, 3c0h
        mov     di, TBL_159B
        push    ds
        pop     es
        xor     ax, ax
        rep stosw
        push    0
        nop
        push    cs
        call    fn_c1977
        add     sp, 2
        push    word ptr [bp + 6]
        nop
        push    cs
        call    fn_c1860
        add     sp, 2
        xor     si, si
loop_c139a:
        push    si
        nop
        push    cs
        call    fn_c1497
        add     sp, 2
        inc     si
        cmp     si, 10h
        jl      loop_c139a
        push    word ptr [bp + 8]
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 0ch]
        push    cs
        call    fn_c1326
        add     sp, 6
        dec     word ptr [B_EFDA]
        nop
        push    cs
        call    fn_c1e3d
        xor     si, si
loop_c13c4:
        push    si
        nop
        push    cs
        call    fn_c13d7
        add     sp, 2
        inc     si
        cmp     si, 10h
        jl      loop_c13c4
        pop     di
        pop     si
        pop     bp
        retf
fn_c13d7:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 0ah
        else
        sub     sp, 8
        endif
        push    si
        push    di
        mov     si, word ptr [bp + 6]
        mov     al, byte ptr [B_D4B5]
        cbw
        mov     dx, si
        add     dx, ax
        push    dx
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        if      FW_VERSION >= 311
        mov     word ptr [bp - 4], ax
        cmp     ax, 23h
        jge     br_c13fe
        jmp     near br_c1493
br_c13fe:
        push    word ptr [bp - 4]
        else
        push    ax
        endif
        callf   SEG_CB8A:far_cbb70
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        if      FW_VERSION >= 311
        mov     word ptr [bp - 6], ax
        else
        mov     word ptr [bp - 4], ax
        endif
        mov     ax, si
        mov     dx, 0fh
        imul    dx
        add     ax, 7
        mov     word ptr [bp - 2], ax
        if      FW_VERSION >= 311
        mov     word ptr [bp - 8], ds
        mov     word ptr [bp - 0ah], 177bh
        mov     ax, word ptr [bp - 6]
        else
        mov     word ptr [bp - 6], ds
        mov     word ptr [bp - 8], 1711h
        mov     ax, word ptr [bp - 4]
        endif
        mov     dx, 0ch
        imul    dx
        mov     bx, 19h
        cwd
        idiv    bx
        mov     di, ax
        xor     si, si
        jmp     br_c145c
loop_c143e:
        mov     al, byte ptr [B_EFDA]
        push    ax
        push    3
        push    0
        push    word ptr [bp - 2]
        if      FW_VERSION < 311
        push    word ptr [bp - 6]
        endif
        push    word ptr [bp - 8]
        if      FW_VERSION >= 311
        push    word ptr [bp - 0ah]
        endif
        callf   SEG_B133:far_b133a
        add     sp, 0ch
        if      FW_VERSION >= 311
        add     word ptr [bp - 0ah], 1eh
        else
        add     word ptr [bp - 8], 1eh
        endif
        inc     si
br_c145c:
        mov     ax, 30h
        sub     ax, di
        cmp     ax, si
        jg      loop_c143e
        xor     si, si
        cmp     si, di
        jge     br_c1493
loop_c146b:
        mov     al, byte ptr [B_EFDA]
        push    ax
        push    3
        push    7
        push    word ptr [bp - 2]
        if      FW_VERSION < 311
        push    word ptr [bp - 6]
        endif
        push    word ptr [bp - 8]
        if      FW_VERSION >= 311
        push    word ptr [bp - 0ah]
        endif
        callf   SEG_B133:far_b133a
        add     sp, 0ch
        mov     dx, ax
        or      dx, dx
        jz      br_c1493
        if      FW_VERSION >= 311
        add     word ptr [bp - 0ah], 1eh
        else
        add     word ptr [bp - 8], 1eh
        endif
        inc     si
        cmp     si, di
        jl      loop_c146b
br_c1493:
        pop     di
        pop     si
        leave
        retf
fn_c1497:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 0ch
        else
        sub     sp, 0ah
        endif
        push    si
        push    di
        mov     si, word ptr [bp + 6]
        mov     al, byte ptr [B_D4B5]
        cbw
        mov     dx, si
        add     dx, ax
        push    dx
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        if      FW_VERSION >= 311
        mov     word ptr [bp - 4], ax
        cmp     ax, 23h
        jge     br_c14be
        jmp     near br_c1552
br_c14be:
        push    word ptr [bp - 4]
        else
        push    ax
        endif
        callf   SEG_CB8A:far_cbb70
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 1]
        mov     ah, 0
        mov     word ptr [bp - 2], ax
        if      FW_VERSION >= 311
        mov     word ptr [bp - 6], ds
        mov     word ptr [bp - 8], TBL_159B
        else
        mov     word ptr [bp - 4], ds
        mov     word ptr [bp - 6], TBL_159B
        endif
        mov     ax, si
        mov     dx, 0fh
        imul    dx
        mov     di, ax
        mov     ax, word ptr [bp - 2]
        mov     dx, 0ah
        imul    dx
        mov     bx, 43h
        cwd
        idiv    bx
        shl     ax, 1
        mov     bx, ax
        mov     ax, word ptr [bx + TBL_1433]
        if      FW_VERSION >= 311
        mov     word ptr [bp - 0ah], ds
        mov     word ptr [bp - 0ch], ax
        else
        mov     word ptr [bp - 8], ds
        mov     word ptr [bp - 0ah], ax
        endif
        xor     si, si
loop_c1505:
        mov     al, byte ptr [B_EFDA]
        push    ax
        push    8
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 0ch]
        inc     word ptr [bp - 0ch]
        else
        les     bx, dword ptr [bp - 0ah]
        inc     word ptr [bp - 0ah]
        endif
        mov     al, byte ptr es:[bx]
        push    ax
        mov     ax, di
        add     ax, 3
        push    ax
        if      FW_VERSION < 311
        push    word ptr [bp - 4]
        endif
        push    word ptr [bp - 6]
        if      FW_VERSION >= 311
        push    word ptr [bp - 8]
        endif
        callf   SEG_B133:far_b133a
        add     sp, 0ch
        mov     al, byte ptr [B_EFDA]
        push    ax
        push    3
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 0ch]
        inc     word ptr [bp - 0ch]
        else
        les     bx, dword ptr [bp - 0ah]
        inc     word ptr [bp - 0ah]
        endif
        mov     al, byte ptr es:[bx]
        push    ax
        push    di
        if      FW_VERSION < 311
        push    word ptr [bp - 4]
        endif
        push    word ptr [bp - 6]
        if      FW_VERSION >= 311
        push    word ptr [bp - 8]
        endif
        callf   SEG_B133:far_b133a
        add     sp, 0ch
        if      FW_VERSION >= 311
        add     word ptr [bp - 8], 1eh
        else
        add     word ptr [bp - 6], 1eh
        endif
        inc     si
        cmp     si, 0bh
        jl      loop_c1505
br_c1552:
        pop     di
        pop     si
        leave
        retf
fn_c1556:
        push    bp
        mov     bp, sp
        push    si
        push    di
        inc     word ptr [B_EFDA]
        mov     cx, 3c0h
        mov     di, TBL_159B
        push    ds
        pop     es
        xor     ax, ax
        rep stosw
        push    0
        nop
        push    cs
        call    fn_c1977
        add     sp, 2
        push    word ptr [bp + 6]
        nop
        push    cs
        call    fn_c1860
        add     sp, 2
        xor     si, si
loop_c1582:
        push    si
        nop
        push    cs
        call    fn_c1680
        add     sp, 2
        inc     si
        cmp     si, 10h
        jl      loop_c1582
        push    word ptr [bp + 8]
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 0ch]
        push    cs
        call    fn_c1326
        add     sp, 6
        dec     word ptr [B_EFDA]
        nop
        push    cs
        call    fn_c1e3d
        xor     si, si
loop_c15ac:
        push    si
        nop
        push    cs
        call    fn_c15bf
        add     sp, 2
        inc     si
        cmp     si, 10h
        jl      loop_c15ac
        pop     di
        pop     si
        pop     bp
        retf
fn_c15bf:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 0ah
        else
        sub     sp, 8
        endif
        push    si
        push    di
        mov     si, word ptr [bp + 6]
        mov     al, byte ptr [B_D4B5]
        cbw
        mov     dx, si
        add     dx, ax
        push    dx
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        if      FW_VERSION >= 311
        mov     word ptr [bp - 6], ax
        cmp     ax, 23h
        jge     br_c15e6
        jmp     near br_c167c
br_c15e6:
        push    word ptr [bp - 6]
        else
        push    ax
        endif
        callf   SEG_CB8A:far_cbbd4
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        mov     word ptr [bp - 4], ax
        mov     ax, si
        mov     dx, 0fh
        imul    dx
        add     ax, 7
        mov     word ptr [bp - 2], ax
        if      FW_VERSION >= 311
        mov     word ptr [bp - 8], ds
        mov     word ptr [bp - 0ah], 177bh
        else
        mov     word ptr [bp - 6], ds
        mov     word ptr [bp - 8], 1711h
        endif
        mov     ax, word ptr [bp - 4]
        mov     dx, 0ch
        imul    dx
        mov     bx, 19h
        cwd
        idiv    bx
        mov     di, ax
        xor     si, si
        jmp     br_c1645
loop_c1627:
        mov     al, byte ptr [B_EFDA]
        push    ax
        push    3
        push    0
        push    word ptr [bp - 2]
        if      FW_VERSION < 311
        push    word ptr [bp - 6]
        endif
        push    word ptr [bp - 8]
        if      FW_VERSION >= 311
        push    word ptr [bp - 0ah]
        endif
        callf   SEG_B133:far_b133a
        add     sp, 0ch
        if      FW_VERSION >= 311
        add     word ptr [bp - 0ah], 1eh
        else
        add     word ptr [bp - 8], 1eh
        endif
        inc     si
br_c1645:
        mov     ax, 30h
        sub     ax, di
        cmp     ax, si
        jg      loop_c1627
        xor     si, si
        cmp     si, di
        jge     br_c167c
loop_c1654:
        mov     al, byte ptr [B_EFDA]
        push    ax
        push    3
        push    7
        push    word ptr [bp - 2]
        if      FW_VERSION < 311
        push    word ptr [bp - 6]
        endif
        push    word ptr [bp - 8]
        if      FW_VERSION >= 311
        push    word ptr [bp - 0ah]
        endif
        callf   SEG_B133:far_b133a
        add     sp, 0ch
        mov     dx, ax
        or      dx, dx
        jz      br_c167c
        if      FW_VERSION >= 311
        add     word ptr [bp - 0ah], 1eh
        else
        add     word ptr [bp - 8], 1eh
        endif
        inc     si
        cmp     si, di
        jl      loop_c1654
br_c167c:
        pop     di
        pop     si
        leave
        retf
fn_c1680:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 0eh
        else
        sub     sp, 0ch
        endif
        push    si
        push    di
        mov     al, byte ptr [B_D4B5]
        cbw
        mov     dx, word ptr [bp + 6]
        add     dx, ax
        push    dx
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        if      FW_VERSION >= 311
        mov     word ptr [bp - 6], ax
        cmp     ax, 23h
        jge     br_c16a6
        pop     di
        pop     si
        leave
        retf
br_c16a6:
        push    word ptr [bp - 6]
        else
        push    ax
        endif
        callf   SEG_CB8A:far_cbbd4
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 3]
        mov     ah, 0
        and     ax, 0fh
        mov     si, ax
        xor     di, di
        mov     al, byte ptr [B_D4B5]
        cbw
        mov     dx, word ptr [bp + 6]
        add     dx, ax
        push    dx
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 30ah]
        mov     ah, 0
        mov     word ptr [bp - 4], ax
        cmp     ax, 0ffh
        jz      br_c1703
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 4813h]
        mov     ah, 0
        mov     di, ax
br_c1703:
        if      FW_VERSION >= 311
        mov     word ptr [bp - 8], ds
        mov     word ptr [bp - 0ah], TBL_159B
        else
        mov     word ptr [bp - 6], ds
        mov     word ptr [bp - 8], TBL_159B
        endif
        mov     ax, word ptr [bp + 6]
        mov     dx, 0fh
        imul    dx
        mov     word ptr [bp - 2], ax
        mov     bx, si
        cmp     bx, 9
        jbe     br_c1720
        jmp     near br_c17b2
br_c1720:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c17f1]
tgt_c1727:
        mov     si, 10h
        jmp     near br_c17b2
tgt_c172d:
        or      di, di
        jz      br_c1736
        mov     ax, 11h
        jmp     br_c1739
br_c1736:
        mov     ax, 2
br_c1739:
        mov     si, ax
        jmp     br_c17b2
tgt_c173d:
        or      di, di
        jz      br_c1746
        mov     ax, 11h
        jmp     br_c1749
br_c1746:
        mov     ax, 3
br_c1749:
        mov     si, ax
        jmp     br_c17b2
tgt_c174d:
        or      di, di
        jz      br_c1756
        mov     ax, 12h
        jmp     br_c1759
br_c1756:
        mov     ax, 4
br_c1759:
        mov     si, ax
        jmp     br_c17b2
tgt_c175d:
        or      di, di
        jz      br_c1766
        mov     ax, 12h
        jmp     br_c1769
br_c1766:
        mov     ax, 5
br_c1769:
        mov     si, ax
        jmp     br_c17b2
tgt_c176d:
        or      di, di
        jz      br_c1776
        mov     ax, 13h
        jmp     br_c1779
br_c1776:
        mov     ax, 6
br_c1779:
        mov     si, ax
        jmp     br_c17b2
tgt_c177d:
        or      di, di
        jz      br_c1786
        mov     ax, 13h
        jmp     br_c1789
br_c1786:
        mov     ax, 7
br_c1789:
        mov     si, ax
        jmp     br_c17b2
tgt_c178d:
        or      di, di
        jz      br_c1796
        mov     ax, 14h
        jmp     br_c1799
br_c1796:
        mov     ax, 8
br_c1799:
        mov     si, ax
        jmp     br_c17b2
tgt_c179d:
        or      di, di
        jz      br_c17a6
        mov     ax, 14h
        jmp     br_c17a9
br_c17a6:
        mov     ax, 9
br_c17a9:
        mov     si, ax
        jmp     br_c17b2
tgt_c17ad:
        mov     si, 0fh
        jmp     br_c17b2
br_c17b2:
        mov     bx, si
        shl     bx, 1
        mov     ax, word ptr [bx + TBL_1405]
        if      FW_VERSION >= 311
        mov     word ptr [bp - 0ch], ds
        mov     word ptr [bp - 0eh], ax
        else
        mov     word ptr [bp - 0ah], ds
        mov     word ptr [bp - 0ch], ax
        endif
        xor     si, si
loop_c17c2:
        mov     al, byte ptr [B_EFDA]
        push    ax
        push    5
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 0eh]
        inc     word ptr [bp - 0eh]
        else
        les     bx, dword ptr [bp - 0ch]
        inc     word ptr [bp - 0ch]
        endif
        mov     al, byte ptr es:[bx]
        push    ax
        push    word ptr [bp - 2]
        if      FW_VERSION < 311
        push    word ptr [bp - 6]
        endif
        push    word ptr [bp - 8]
        if      FW_VERSION >= 311
        push    word ptr [bp - 0ah]
        endif
        callf   SEG_B133:far_b133a
        add     sp, 0ch
        if      FW_VERSION >= 311
        add     word ptr [bp - 0ah], 1eh
        else
        add     word ptr [bp - 8], 1eh
        endif
        inc     si
        cmp     si, 9
        jl      loop_c17c2
        pop     di
        pop     si
        leave
        retf
TBL_c17f1:
        dw      tgt_c1727
        dw      tgt_c172d
        dw      tgt_c173d
        dw      tgt_c174d
        dw      tgt_c175d
        dw      tgt_c176d
        dw      tgt_c177d
        dw      tgt_c178d
        dw      tgt_c179d
        dw      tgt_c17ad
fn_c1805:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    si
        push    di
        mov     bx, word ptr [bp + 6]
        shl     bx, 1
        mov     ax, word ptr [bx + TBL_142F]
        mov     word ptr [bp - 6], ds
        mov     word ptr [bp - 8], ax
        mov     ax, word ptr [bp + 8]
        mov     dx, 0fh
        imul    dx
        add     ax, 3
        mov     di, ax
        mov     word ptr [bp - 2], ds
        if      FW_VERSION >= 311
        mov     word ptr [bp - 4], 1703h
        else
        mov     word ptr [bp - 4], 1699h
        endif
        xor     si, si
loop_c1833:
        mov     al, byte ptr [B_EFDA]
        push    ax
        push    5
        les     bx, dword ptr [bp - 8]
        inc     word ptr [bp - 8]
        mov     al, byte ptr es:[bx]
        push    ax
        push    di
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        callf   SEG_B133:far_b133a
        add     sp, 0ch
        add     word ptr [bp - 4], 1eh
        inc     si
        cmp     si, 3
        jl      loop_c1833
        pop     di
        pop     si
        leave
        retf
fn_c1860:
        push    bp
        mov     bp, sp
        sub     sp, 12h
        push    si
        push    di
        mov     word ptr [bp - 2], 0
        xor     di, di
        mov     ax, word ptr [bp + 6]
        shl     ax, 2
        add     ax, 274h
        mov     word ptr [bp - 12h], ax
        jmp     br_c18f2
loop_c187d:
        mov     word ptr [bp - 0eh], ds
        if      FW_VERSION >= 311
        mov     word ptr [bp - 10h], 177bh
        else
        mov     word ptr [bp - 10h], 1711h
        endif
        mov     bx, word ptr [bp - 12h]
        mov     ax, word ptr [bx + 2]
        mov     dx, word ptr [bx]
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp - 0ch], dx
        mov     word ptr [bp - 4], 0
loop_c1898:
        les     bx, dword ptr [bp - 0ch]
        inc     word ptr [bp - 0ch]
        mov     al, byte ptr es:[bx]
        push    ax
        nop
        push    cs
        call    fn_c1e8f
        add     sp, 2
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        xor     si, si
loop_c18b2:
        mov     al, byte ptr [B_EFDA]
        push    ax
        push    5
        les     bx, dword ptr [bp - 8]
        inc     word ptr [bp - 8]
        mov     al, byte ptr es:[bx]
        push    ax
        push    di
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 10h]
        callf   SEG_B133:far_b133a
        add     sp, 0ch
        add     word ptr [bp - 10h], 1eh
        inc     si
        cmp     si, 9
        jl      loop_c18b2
        add     word ptr [bp - 10h], 78h
        inc     word ptr [bp - 4]
        cmp     word ptr [bp - 4], 3
        jl      loop_c1898
        add     word ptr [bp - 12h], 4
        inc     word ptr [bp - 2]
        add     di, 0fh
br_c18f2:
        cmp     word ptr [bp - 2], 10h
        jl      loop_c187d
        pop     di
        pop     si
        leave
        retf
fn_c18fc:
        push    bp
        mov     bp, sp
        sub     sp, 0ch
        push    si
        push    di
        mov     ax, word ptr [bp + 0ah]
        mov     word ptr [bp - 4], ax
        mov     word ptr [bp - 2], 0
        mov     di, word ptr [bp + 0ch]
        jmp     br_c196a
loop_c1914:
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp - 0ch], dx
        mov     es, word ptr [bp + 0eh]
        mov     al, byte ptr es:[di]
        push    ax
        nop
        push    cs
        call    fn_c1e8f
        add     sp, 2
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        xor     si, si
loop_c1937:
        mov     al, byte ptr [B_EFDA]
        push    ax
        push    5
        les     bx, dword ptr [bp - 8]
        inc     word ptr [bp - 8]
        mov     al, byte ptr es:[bx]
        push    ax
        push    word ptr [bp - 4]
        push    word ptr [bp - 0ah]
        push    word ptr [bp - 0ch]
        callf   SEG_B133:far_b133a
        add     sp, 0ch
        add     word ptr [bp - 0ch], 1eh
        inc     si
        cmp     si, 9
        jl      loop_c1937
        add     word ptr [bp - 4], 6
        inc     di
        inc     word ptr [bp - 2]
br_c196a:
        mov     es, word ptr [bp + 0eh]
        cmp     byte ptr es:[di], 0
        jnz     loop_c1914
        pop     di
        pop     si
        leave
        retf
fn_c1977:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        push    di
        mov     bx, word ptr [bp + 6]
        mov     ax, bx
        mov     dx, 1eh
        imul    dx
        add     ax, TBL_159B
        mov     word ptr [bp - 2], ds
        mov     word ptr [bp - 4], ax
        mov     di, bx
        jmp     br_c19c4
loop_c1996:
        xor     si, si
        mov     dx, 0ch
        jmp     br_c19ba
loop_c199d:
        mov     ax, dx
        shr     ax, 3
        les     bx, dword ptr [bp - 4]
        add     bx, ax
        mov     al, dl
        and     al, 7
        mov     cl, 7
        sub     cl, al
        mov     al, 1
        shl     al, cl
        or      byte ptr es:[bx], al
        inc     si
        add     dx, 0fh
br_c19ba:
        cmp     si, 0fh
        jl      loop_c199d
        add     word ptr [bp - 4], 1eh
        inc     di
br_c19c4:
        cmp     di, 40h
        jl      loop_c1996
        pop     di
        pop     si
        leave
        retf
fn_c19cd:
        push    bp
        mov     bp, sp
        push    si
        push    di
        mov     di, word ptr [bp + 6]
        mov     si, di
        add     si, word ptr [bp + 8]
        cmp     word ptr [bp + 0ah], 0
        jnz     br_c1a24
        push    si
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        push    ax
        callf   SEG_CB8A:far_cbb70
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        mov     dx, ax
        or      dx, dx
        if      FW_VERSION >= 311
        jz      br_c1a69
        else
        jnz     L_cae5a
        jmp     near br_c1a69
L_cae5a:
        endif
        mov     ax, word ptr [W_D4AD]
        shl     ax, 1
        sub     dx, ax
        or      dx, dx
        jge     br_c1a0e
        xor     dx, dx
br_c1a0e:
        push    dx
        push    si
        if      FW_VERSION >= 311
        callf   SEG_DA5F:far_da5fe
        else
        callf   0e304h:L_e3041
        endif
        add     sp, 4
        push    di
        push    cs
        call    fn_c13d7
        add     sp, 2
        if      FW_VERSION < 311
        cmp     byte ptr [B_E422], 1
        jnz     br_c1a69
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
        endif
        pop     di
        pop     si
        pop     bp
        retf
br_c1a24:
        push    si
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        push    ax
        callf   SEG_CB8A:far_cbb70
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 1]
        mov     ah, 0
        mov     dx, ax
        or      dx, dx
        jz      br_c1a69
        mov     ax, word ptr [W_D4AD]
        shl     ax, 1
        add     ax, word ptr [W_D4AD]
        sub     dx, ax
        or      dx, dx
        jge     br_c1a57
        xor     dx, dx
br_c1a57:
        push    dx
        push    si
        callf   SEG_DA5F:far_da62b
        add     sp, 4
        push    di
        push    cs
        call    fn_c1497
        add     sp, 2
        if      FW_VERSION < 311
        cmp     byte ptr [B_E422], 1
        jnz     br_c1a69
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
        endif
br_c1a69:
        pop     di
        pop     si
        pop     bp
        retf
fn_c1a6d:
        push    bp
        mov     bp, sp
        push    si
        push    di
        mov     di, word ptr [bp + 6]
        mov     si, di
        add     si, word ptr [bp + 8]
        cmp     word ptr [bp + 0ah], 0
        jnz     br_c1ac7
        push    si
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        push    ax
        callf   SEG_CB8A:far_cbb70
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        mov     dx, ax
        cmp     dx, 64h
        if      FW_VERSION >= 311
        jge     br_c1b0f
        else
        jl      L_caf2a
        jmp     near br_c1b0f
L_caf2a:
        endif
        mov     ax, word ptr [W_D4AD]
        shl     ax, 1
        add     dx, ax
        cmp     dx, 64h
        jle     br_c1ab1
        mov     dx, 64h
br_c1ab1:
        push    dx
        push    si
        if      FW_VERSION >= 311
        callf   SEG_DA5F:far_da5fe
        else
        callf   0e304h:L_e3041
        endif
        add     sp, 4
        push    di
        push    cs
        call    fn_c13d7
        add     sp, 2
        if      FW_VERSION < 311
        cmp     byte ptr [B_E422], 1
        jnz     br_c1b0f
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
        endif
        pop     di
        pop     si
        pop     bp
        retf
br_c1ac7:
        push    si
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        push    ax
        callf   SEG_CB8A:far_cbb70
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 1]
        mov     ah, 0
        mov     dx, ax
        cmp     dx, 64h
        jge     br_c1b0f
        mov     ax, word ptr [W_D4AD]
        shl     ax, 1
        add     ax, word ptr [W_D4AD]
        add     dx, ax
        cmp     dx, 64h
        jl      br_c1afd
        mov     dx, 64h
br_c1afd:
        push    dx
        push    si
        callf   SEG_DA5F:far_da62b
        add     sp, 4
        push    di
        push    cs
        call    fn_c1497
        add     sp, 2
        if      FW_VERSION < 311
        cmp     byte ptr [B_E422], 1
        jnz     br_c1b0f
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
        endif
br_c1b0f:
        pop     di
        pop     si
        pop     bp
        retf
fn_c1b13:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 0ah]
        cmp     byte ptr [bp + 6], 2bh
        jnz     br_c1b32
        push    ax
        mov     al, byte ptr [B_D4B5]
        cbw
        push    ax
        push    dx
        push    cs
        call    fn_c1a6d
        add     sp, 6
        pop     bp
        retf
br_c1b32:
        push    ax
        mov     al, byte ptr [B_D4B5]
        cbw
        push    ax
        push    dx
        push    cs
        call    fn_c19cd
        add     sp, 6
        pop     bp
        retf
fn_c1b42:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        push    di
        mov     di, word ptr [bp + 8]
        mov     al, byte ptr [B_D4B5]
        mov     ah, 0
        sar     ax, 4
        mov     word ptr [bp - 2], ax
        cmp     word ptr [bp + 0ch], 0
        jz      br_c1b78
        xor     si, si
loop_c1b60:
        push    si
        push    di
        mov     al, byte ptr [bp + 6]
        push    ax
        push    cs
        call    fn_c1b13
        add     sp, 6
        inc     si
        cmp     si, 10h
        jl      loop_c1b60
        mov     dx, 0ffffh
        jmp     br_c1b8f
br_c1b78:
        push    word ptr [bp + 0ah]
        push    di
        mov     al, byte ptr [bp + 6]
        push    ax
        push    cs
        call    fn_c1b13
        add     sp, 6
        mov     dx, 1
        mov     cl, byte ptr [bp + 0ah]
        shl     dx, cl
br_c1b8f:
        or      di, di
        jz      br_c1bb1
        mov     bx, word ptr [bp - 2]
        shl     bx, 1
        mov     word ptr [bx + TBL_954B], dx
        or      byte ptr [B_955C], 2
loop_c1ba1:
        mov     bx, word ptr [bp - 2]
        shl     bx, 1
        cmp     word ptr [bx + TBL_954B], 0
        jnz     loop_c1ba1
        pop     di
        pop     si
        leave
        retf
br_c1bb1:
        mov     bx, word ptr [bp - 2]
        shl     bx, 1
        mov     word ptr [bx + TBL_9553], dx
        or      byte ptr [B_955C], 1
loop_c1bbf:
        mov     bx, word ptr [bp - 2]
        shl     bx, 1
        cmp     word ptr [bx + TBL_9553], 0
        jnz     loop_c1bbf
        pop     di
        pop     si
        leave
        retf
fn_c1bcf:
        push    bp
        mov     bp, sp
        push    si
        push    di
        mov     di, word ptr [bp + 6]
        mov     si, di
        add     si, word ptr [bp + 8]
        cmp     word ptr [bp + 0ah], 0
        jnz     br_c1c27
        push    si
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        push    ax
        callf   SEG_CB8A:far_cbbd4
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        mov     dx, ax
        or      dx, dx
        if      FW_VERSION >= 311
        jz      br_c1c65
        else
        jnz     L_cb0bb
        jmp     near br_c1c65
L_cb0bb:
        endif
        mov     ax, word ptr [W_D4AD]
        shl     ax, 1
        sub     dx, ax
        or      dx, dx
        jge     br_c1c11
        xor     dx, dx
br_c1c11:
        push    dx
        push    si
        callf   SEG_DA5F:far_da659
        add     sp, 4
        push    di
        push    cs
        call    fn_c15bf
        add     sp, 2
        if      FW_VERSION < 311
        cmp     byte ptr [B_E423], 1
        jnz     br_c1c65
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
        endif
        pop     di
        pop     si
        pop     bp
        retf
br_c1c27:
        push    si
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        push    ax
        callf   SEG_CB8A:far_cbbd4
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 3]
        mov     ah, 0
        and     ax, 0fh
        mov     dx, ax
        or      dx, dx
        jz      br_c1c65
        dec     dx
        or      dx, dx
        jge     br_c1c53
        xor     dx, dx
br_c1c53:
        push    dx
        push    si
        if      FW_VERSION >= 311
        callf   SEG_DA5F:far_da687
        else
        callf   0e304h:L_e30a9
        endif
        add     sp, 4
        if      FW_VERSION < 311
        cmp     byte ptr [B_E423], 1
        jnz     L_cb140
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
L_cb140:
        endif
        push    di
        push    cs
        call    fn_c1680
        add     sp, 2
br_c1c65:
        pop     di
        pop     si
        pop     bp
        retf
fn_c1c69:
        push    bp
        mov     bp, sp
        push    si
        push    di
        mov     di, word ptr [bp + 6]
        mov     si, di
        add     si, word ptr [bp + 8]
        cmp     word ptr [bp + 0ah], 0
        jnz     br_c1cc4
        push    si
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        push    ax
        callf   SEG_CB8A:far_cbbd4
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        mov     dx, ax
        cmp     dx, 64h
        if      FW_VERSION >= 311
        jge     br_c1d05
        else
        jl      L_cb185
        jmp     near br_c1d05
L_cb185:
        endif
        mov     ax, word ptr [W_D4AD]
        shl     ax, 1
        add     dx, ax
        cmp     dx, 64h
        jle     br_c1cae
        mov     dx, 64h
br_c1cae:
        push    dx
        push    si
        callf   SEG_DA5F:far_da659
        add     sp, 4
        push    di
        push    cs
        call    fn_c15bf
        add     sp, 2
        if      FW_VERSION < 311
        cmp     byte ptr [B_E423], 1
        jnz     br_c1d05
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
        endif
        pop     di
        pop     si
        pop     bp
        retf
br_c1cc4:
        push    si
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        push    ax
        callf   SEG_CB8A:far_cbbd4
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 3]
        mov     ah, 0
        and     ax, 0fh
        mov     dx, ax
        cmp     dx, 9
        jge     br_c1d05
        inc     dx
        cmp     dx, 9
        jle     br_c1cf3
        mov     dx, 9
br_c1cf3:
        push    dx
        push    si
        if      FW_VERSION >= 311
        callf   SEG_DA5F:far_da687
        else
        callf   0e304h:L_e30a9
        endif
        add     sp, 4
        if      FW_VERSION < 311
        cmp     byte ptr [B_E423], 1
        jnz     L_cb20f
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
L_cb20f:
        endif
        push    di
        push    cs
        call    fn_c1680
        add     sp, 2
br_c1d05:
        pop     di
        pop     si
        pop     bp
        retf
fn_c1d09:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 0ah]
        cmp     byte ptr [bp + 6], 2bh
        jnz     br_c1d28
        push    ax
        mov     al, byte ptr [B_D4B5]
        cbw
        push    ax
        push    dx
        push    cs
        call    fn_c1c69
        add     sp, 6
        pop     bp
        retf
br_c1d28:
        push    ax
        mov     al, byte ptr [B_D4B5]
        cbw
        push    ax
        push    dx
        push    cs
        call    fn_c1bcf
        add     sp, 6
        pop     bp
        retf
fn_c1d38:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        push    di
        mov     di, word ptr [bp + 8]
        mov     al, byte ptr [B_D4B5]
        mov     ah, 0
        sar     ax, 4
        mov     word ptr [bp - 2], ax
        cmp     word ptr [bp + 0ch], 0
        jz      br_c1d6e
        xor     si, si
loop_c1d56:
        push    si
        push    di
        mov     al, byte ptr [bp + 6]
        push    ax
        push    cs
        call    fn_c1d09
        add     sp, 6
        inc     si
        cmp     si, 10h
        jl      loop_c1d56
        mov     dx, 0ffffh
        jmp     br_c1d85
br_c1d6e:
        push    word ptr [bp + 0ah]
        push    di
        mov     al, byte ptr [bp + 6]
        push    ax
        push    cs
        call    fn_c1d09
        add     sp, 6
        mov     dx, 1
        mov     cl, byte ptr [bp + 0ah]
        shl     dx, cl
br_c1d85:
        or      di, di
        jnz     br_c1da3
        mov     bx, word ptr [bp - 2]
        shl     bx, 1
        mov     word ptr [bx + TBL_9543], dx
        or      byte ptr [B_955C], 4
loop_c1d97:
        mov     bx, word ptr [bp - 2]
        shl     bx, 1
        cmp     word ptr [bx + TBL_9543], 0
        jnz     loop_c1d97
br_c1da3:
        pop     di
        pop     si
        leave
        retf
fn_c1da7:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        push    di
        mov     ax, word ptr [bp + 6]
        mov     dx, 0fh
        imul    dx
        add     ax, 3
        mov     di, ax
        mov     word ptr [bp - 2], ds
        if      FW_VERSION >= 311
        mov     word ptr [bp - 4], 1703h
        else
        mov     word ptr [bp - 4], 1699h
        endif
        xor     si, si
loop_c1dc6:
        mov     al, byte ptr [B_EFDA]
        push    ax
        push    5
        push    0
        push    di
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        callf   SEG_B133:far_b133a
        add     sp, 0ch
        add     word ptr [bp - 4], 1eh
        inc     si
        cmp     si, 3
        jl      loop_c1dc6
        pop     di
        pop     si
        leave
        retf
fn_c1deb:
        push    si
        push    0
        push    0ah
        nop
        push    cs
        call    fn_c1e77
        add     sp, 4
        push    0
        push    0bh
        nop
        push    cs
        call    fn_c1e77
        add     sp, 4
        xor     si, si
loop_c1e06:
        mov     dl, 0
        mov     bl, byte ptr [si + TBL_159B]
        mov     al, bl
        or      al, al
        jz      br_c1e25
        xor     ax, ax
loop_c1e14:
        shl     dl, 1
        test    bl, 1
        jz      br_c1e1d
        inc     dl
br_c1e1d:
        shr     bl, 1
        inc     ax
        cmp     ax, 8
        jl      loop_c1e14
br_c1e25:
        mov     al, dl
        mov     ah, 0
        push    ax
        push    0ch
        nop
        push    cs
        call    fn_c1e77
        add     sp, 4
        inc     si
        cmp     si, 780h
        jl      loop_c1e06
        pop     si
        retf
fn_c1e3d:
        mov     byte ptr [B_96EF], 1
        push    32h
        push    0
        nop
        push    cs
        call    fn_c1e77
        add     sp, 4
        push    7
        push    1
        nop
        push    cs
        call    fn_c1e77
        add     sp, 4
        push    1dh
        push    2
        nop
        push    cs
        call    fn_c1e77
        add     sp, 4
        push    3fh
        push    3
        nop
        push    cs
        call    fn_c1e77
        add     sp, 4
        push    cs
        call    fn_c1deb
        retf
fn_c1e77:
        push    bp
        mov     bp, sp
loop_c1e7a:
        mov     dx, 0e2h
        in      al, dx
        test    al, 80h
        jnz     loop_c1e7a
        mov     al, byte ptr [bp + 6]
        out     dx, al
        mov     dx, 0e0h
        mov     al, byte ptr [bp + 8]
        out     dx, al
        pop     bp
        retf
fn_c1e8f:
        push    bp
        mov     bp, sp
        push    si
        mov     dl, byte ptr [bp + 6]
        xor     si, si
        jmp     br_c1eae
loop_c1e9a:
        cmp     byte ptr [si + TBL_13EF], dl
        jnz     br_c1ead
        mov     bx, si
        shl     bx, 1
        mov     ax, word ptr [bx + TBL_1405]
        mov     dx, ds
        pop     si
        pop     bp
        retf
br_c1ead:
        inc     si
br_c1eae:
        cmp     byte ptr [si + TBL_13EF], 0
        jnz     loop_c1e9a
        mov     ax, word ptr [TBL_1405]
        mov     dx, ds
        pop     si
        pop     bp
        retf
fn_c1ebd:
        push    bp
        mov     bp, sp
        sub     sp, 0eh
        push    si
        push    di
        mov     byte ptr [B_7B8D], 0
        callf   SEG_B1AA:far_b1aac
        cmp     byte ptr [B_901B], 0
        jge     br_c1ee3
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_E15E:far_e15e2
        add     sp, 2
br_c1ee3:
        mov     al, byte ptr [B_D4BF]
        cbw
        mov     bx, 10h
        cwd
        idiv    bx
        mov     di, dx
        xor     ax, ax
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 0ch], ax
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp - 8], 0
        push    ax
        push    ax
        push    dx
        mov     al, byte ptr [B_D4B5]
        cbw
        push    ax
        push    cs
        call    fn_c1556
        add     sp, 8
        jmp     br_c2177
br_c1f11:
        push    0
        callf   SEG_BA0A:far_ba0a7
        add     sp, 2
        mov     word ptr [bp - 6], ax
        cmp     ax, 48h
        jnz     br_c1f26
        jmp     br_c212e
br_c1f26:
        jg      br_c1f60
        cmp     ax, 3ch
        jnz     br_c1f30
        jmp     near br_c1fce
br_c1f30:
        jg      br_c1f4d
        cmp     ax, 21h
        jnz     br_c1f3a
        jmp     near br_c1fb9
br_c1f3a:
        cmp     ax, 2bh
        jnz     br_c1f42
        jmp     br_c211a
br_c1f42:
        cmp     ax, 2dh
        jnz     br_c1f4a
        jmp     br_c211a
br_c1f4a:
        jmp     br_c2158
br_c1f4d:
        cmp     ax, 3eh
        jnz     br_c1f55
        jmp     near br_c1ff8
br_c1f55:
        cmp     ax, 44h
        jnz     br_c1f5d
        jmp     near br_c2023
br_c1f5d:
        jmp     br_c2158
br_c1f60:
        cmp     ax, 64h
        jnz     br_c1f68
        jmp     br_c2105
br_c1f68:
        jg      br_c1f7a
        cmp     ax, 50h
        jnz     br_c1f72
        jmp     br_c20a4
br_c1f72:
        cmp     ax, 5eh
        jz      br_c1fa4
        jmp     br_c2158
br_c1f7a:
        cmp     ax, 68h
        jnz     br_c1f82
        jmp     br_c2146
br_c1f82:
        cmp     ax, 78h
        jz      br_c1f8a
        jmp     br_c2158
br_c1f8a:
        mov     ax, word ptr [bp - 0ah]
        neg     ax
        sbb     ax, ax
        inc     ax
        mov     word ptr [bp - 0ah], ax
        push    di
        push    word ptr [bp - 0ch]
        push    ax
        push    cs
        call    fn_c1326
        add     sp, 6
        jmp     br_c2177
br_c1fa4:
        mov     word ptr [bp - 0ch], 1
        push    di
        push    1
        push    word ptr [bp - 0ah]
        push    cs
        call    fn_c1326
        add     sp, 6
        jmp     br_c2177
br_c1fb9:
        mov     word ptr [bp - 0ch], 0
        push    di
        push    0
        push    word ptr [bp - 0ah]
        push    cs
        call    fn_c1326
        add     sp, 6
        jmp     br_c2177
br_c1fce:
        or      di, di
        jnz     br_c1fd5
        jmp     br_c2177
br_c1fd5:
        cmp     word ptr [bp - 0ah], 0
        jz      br_c1fdf
        dec     di
        jmp     br_c2177
br_c1fdf:
        push    di
        push    cs
        call    fn_c1da7
        add     sp, 2
        dec     di
        mov     ax, di
        push    ax
        push    word ptr [bp - 0ch]
        push    cs
        call    fn_c1805
        add     sp, 4
        jmp     br_c2177
br_c1ff8:
        cmp     di, 0fh
        jl      br_c2000
        jmp     br_c2177
br_c2000:
        cmp     word ptr [bp - 0ah], 0
        jz      br_c200a
        inc     di
        jmp     br_c2177
br_c200a:
        push    di
        push    cs
        call    fn_c1da7
        add     sp, 2
        inc     di
        mov     ax, di
        push    ax
        push    word ptr [bp - 0ch]
        push    cs
        call    fn_c1805
        add     sp, 4
        jmp     br_c2177
br_c2023:
        mov     al, byte ptr [B_D4BF]
        cbw
        mov     si, ax
        mov     al, byte ptr [B_D4B5]
        cbw
        or      ax, ax
        jz      br_c203d
        cmp     ax, 10h
        jz      br_c2045
        cmp     ax, 20h
        jz      br_c2055
        jmp     br_c2065
br_c203d:
        cmp     si, 10h
        jl      br_c206d
        jmp     br_c2177
br_c2045:
        cmp     si, 10h
        jge     br_c204d
        jmp     br_c2177
br_c204d:
        cmp     si, 20h
        jl      br_c206d
        jmp     br_c2177
br_c2055:
        cmp     si, 20h
        jge     br_c205d
        jmp     br_c2177
br_c205d:
        cmp     si, 30h
        jl      br_c206d
        jmp     br_c2177
br_c2065:
        cmp     si, 30h
        jge     br_c206d
        jmp     br_c2177
br_c206d:
        cmp     word ptr [bp - 0ah], 0
        jnz     br_c207b
        push    di
        push    cs
        call    fn_c1da7
        add     sp, 2
br_c207b:
        mov     ax, si
        mov     bx, 10h
        cwd
        idiv    bx
        mov     di, dx
        cmp     word ptr [bp - 0ah], 0
        jz      br_c208e
        jmp     br_c2177
br_c208e:
        push    dx
        push    cs
        call    fn_c1da7
        add     sp, 2
        push    di
        push    word ptr [bp - 0ch]
        push    cs
        call    fn_c1805
        add     sp, 4
        jmp     br_c2177
br_c20a4:
        cmp     byte ptr [B_9482], 3
        jz      br_c20ae
        jmp     br_c2177
br_c20ae:
        mov     word ptr [bp - 0eh], 0
loop_c20b3:
        mov     al, byte ptr [B_D4B5]
        cbw
        mov     si, word ptr [bp - 0eh]
        add     si, ax
        cmp     byte ptr [si + TBL_9483], 0ffh
        jz      br_c20f5
        push    si
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        push    ax
        callf   SEG_CB8A:far_cbbd4
        add     sp, 2
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        mov     al, byte ptr [si + TBL_9483]
        les     bx, dword ptr [bp - 4]
        mov     byte ptr es:[bx + 2], al
        push    word ptr [bp - 0eh]
        push    cs
        call    fn_c15bf
        add     sp, 2
        mov     byte ptr [si + TBL_9483], 0ffh
br_c20f5:
        inc     word ptr [bp - 0eh]
        cmp     word ptr [bp - 0eh], 10h
        jl      loop_c20b3
        mov     byte ptr [B_9482], 0
        jmp     br_c2177
br_c2105:
        push    word ptr [bp - 0ah]
        push    word ptr [bp - 0ch]
        push    di
        mov     al, byte ptr [B_D4B5]
        cbw
        push    ax
        push    cs
        call    fn_c1556
        add     sp, 8
        jmp     br_c2177
br_c211a:
        push    word ptr [bp - 0ah]
        push    di
        push    word ptr [bp - 0ch]
        mov     al, byte ptr [bp - 6]
        push    ax
        push    cs
        call    fn_c1d38
        add     sp, 8
        jmp     br_c2177
br_c212e:
        mov     al, byte ptr [B_D4BB]
        cbw
        or      ax, ax
        jnz     br_c2177
        push    cs
        call    far_c12e7
        callf   SEG_B05A:far_b129e
        mov     byte ptr [B_D4BB], 1
        jmp     br_c2177
br_c2146:
        cmp     byte ptr [B_D4BB], 0
        jz      br_c2177
        push    cs
        call    fn_c1e3d
        mov     byte ptr [B_D4BB], 0
        jmp     br_c2177
br_c2158:
        push    0
        push    word ptr [bp - 6]
        callf   SEG_EBCC:far_ebde1
        add     sp, 4
        mov     word ptr [bp - 6], ax
        cmp     word ptr [bp - 6], 0
        jz      br_c2177
        push    cs
        call    far_c12e7
        mov     word ptr [bp - 8], 1
br_c2177:
        cmp     word ptr [bp - 8], 0
        jnz     br_c2180
        jmp     br_c1f11
br_c2180:
        mov     ax, word ptr [bp - 6]
        pop     di
        pop     si
        leave
        retf
fn_c2187:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    si
        xor     dx, dx
        jmp     br_c26c8
br_c2193:
        callf   SEG_B1AA:far_b1aac
        push    ds
        push    word A_511C
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_D4C0]
        mov     byte ptr [bp - 1], al
        push    18h
        push    62h
        push    23h
        push    2
        push    ss
        lea     ax, [bp - 1]
        push    ax
        push    ds
        push    word STR_519C
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    10h
        push    7
        push    1
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_B702:far_b9045
        add     sp, 8
        mov     al, byte ptr [bp - 1]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 30ah]
        mov     ah, 0
        mov     si, ax
        cmp     ax, 0ffh
        jz      br_c223b
        push    1dh
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     ax, si
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        cmp     byte ptr es:[bx + 4813h], 0
        jz      br_c222f
        push    ds
        push    word A_51A2
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_c223b
br_c222f:
        push    ds
        push    word A_51A7
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_c223b:
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_51AC
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_CB8A:far_cbb70
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx]
        mov     byte ptr [bp - 2], al
        push    8
        push    64h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ds
        push    word A_51D5
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    15h
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_CB8A:far_cbbd4
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 2]
        mov     byte ptr [bp - 4], al
        push    8
        push    64h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ds
        push    word A_51D5
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_CB8A:far_cbb70
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 1]
        mov     byte ptr [bp - 3], al
        push    3
        push    ds
        push    word P_0060+4
        push    ss
        lea     ax, [bp - 3]
        push    ax
        push    ds
        push    word STR_51DD
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    15h
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_CB8A:far_cbbd4
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 3]
        and     al, 0fh
        mov     byte ptr [bp - 5], al
        push    4
        push    ds
        push    word A_4FC2
        push    ss
        lea     ax, [bp - 5]
        push    ax
        push    ds
        push    word STR_51E2
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        mov     ax, si
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        cmp     byte ptr es:[bx + 4813h], 0
        jz      br_c23b1
        push    23h
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 5]
        cbw
        dec     ax
        mov     bx, ax
        cmp     bx, 7
        ja      br_c23b1
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c2700]
tgt_c2379:
        push    ds
        push    word A_51F1
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_c23b1
tgt_c2387:
        push    ds
        push    word A_51F6
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_c23b1
tgt_c2395:
        push    ds
        push    word A_51FB
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_c23b1
tgt_c23a3:
        push    ds
        push    word A_5200
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_c23b1
br_c23b1:
        push    15h
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_CB8A:far_cbbd4
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 3]
        mov     ah, 0
        and     ax, 80h
        sar     ax, 7
        mov     byte ptr [bp - 6], al
        push    3
        push    ds
        push    word P_0020+4
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word STR_5205
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_5216
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_c26a6
br_c2414:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     bx, ax
        cmp     bx, 5
        jbe     br_c2422
        jmp     br_c26a6
br_c2422:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c26f4]
tgt_c2429:
        push    10h
        push    7
        push    1
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_B702:far_b9045
        add     sp, 8
        mov     al, byte ptr [bp - 1]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 30ah]
        mov     ah, 0
        mov     si, ax
        cmp     ax, 0ffh
        jz      br_c2495
        push    1dh
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     ax, si
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        cmp     byte ptr es:[bx + 4813h], 0
        jz      br_c2489
        push    ds
        push    word A_51A2
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_c2495
br_c2489:
        push    ds
        push    word A_51A7
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_c2495:
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_CB8A:far_cbb70
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx]
        mov     byte ptr [bp - 2], al
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_CB8A:far_cbbd4
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 2]
        mov     byte ptr [bp - 4], al
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_CB8A:far_cbb70
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 1]
        mov     byte ptr [bp - 3], al
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_CB8A:far_cbbd4
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 3]
        and     al, 0fh
        mov     byte ptr [bp - 5], al
        push    4
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     ax, si
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        cmp     byte ptr es:[bx + 4813h], 0
        jz      br_c2595
        push    23h
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 5]
        cbw
        dec     ax
        mov     bx, ax
        cmp     bx, 7
        ja      br_c258b
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c26e4]
tgt_c2553:
        push    ds
        push    word A_51F1
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_c2595
tgt_c2561:
        push    ds
        push    word A_51F6
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_c2595
tgt_c256f:
        push    ds
        push    word A_51FB
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_c2595
tgt_c257d:
        push    ds
        push    word A_5200
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_c2595
br_c258b:
        push    4
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_c2595:
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_CB8A:far_cbbd4
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 3]
        mov     ah, 0
        and     ax, 80h
        sar     ax, 7
        mov     byte ptr [bp - 6], al
        push    5
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_c26a6
tgt_c25c2:
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_CB8A:far_cbb70
        add     sp, 2
        mov     bl, byte ptr [bp - 2]
        mov     es, dx
        xchg    bx, ax
        mov     byte ptr es:[bx], al
        jmp     br_c26a6
tgt_c25db:
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_CB8A:far_cbbd4
        add     sp, 2
        mov     bl, byte ptr [bp - 4]
        mov     es, dx
        xchg    bx, ax
        mov     byte ptr es:[bx + 2], al
        jmp     near br_c26a6
tgt_c25f5:
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_CB8A:far_cbb70
        add     sp, 2
        mov     bl, byte ptr [bp - 3]
        mov     es, dx
        xchg    bx, ax
        mov     byte ptr es:[bx + 1], al
        jmp     near br_c26a6
tgt_c260f:
        mov     ax, si
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        cmp     byte ptr es:[bx + 4813h], 0
        jz      tgt_c2686
        push    23h
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 5]
        cbw
        dec     ax
        mov     bx, ax
        cmp     bx, 7
        ja      br_c267c
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c26d4]
tgt_c2644:
        push    ds
        push    word A_51F1
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     tgt_c2686
tgt_c2652:
        push    ds
        push    word A_51F6
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     tgt_c2686
tgt_c2660:
        push    ds
        push    word A_51FB
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     tgt_c2686
tgt_c266e:
        push    ds
        push    word A_5200
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     tgt_c2686
br_c267c:
        push    4
        callf   SEG_B05A:far_b1073
        add     sp, 2
tgt_c2686:
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_CB8A:far_cbbd4
        add     sp, 2
        mov     bl, byte ptr [bp - 6]
        shl     bl, 7
        mov     cl, byte ptr [bp - 5]
        or      cl, bl
        mov     bx, ax
        mov     es, dx
        mov     byte ptr es:[bx + 3], cl
br_c26a6:
        if      FW_VERSION >= 311
        push    word 82h
        else
        push    0ff82h
        endif
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jnz     br_c26ba
        jmp     br_c2414
br_c26ba:
        cmp     ax, 78h
        jz      br_c26c1
        jmp     br_c26c8
br_c26c1:
        nop
        push    cs
        call    fn_c2710
        mov     dx, ax
br_c26c8:
        or      dx, dx
        jnz     br_c26cf
        jmp     br_c2193
br_c26cf:
        mov     ax, dx
        pop     si
        leave
        retf
TBL_c26d4:
        dw      tgt_c2644
        dw      tgt_c2644
        dw      tgt_c2652
        dw      tgt_c2652
        dw      tgt_c2660
        dw      tgt_c2660
        dw      tgt_c266e
        dw      tgt_c266e
TBL_c26e4:
        dw      tgt_c2553
        dw      tgt_c2553
        dw      tgt_c2561
        dw      tgt_c2561
        dw      tgt_c256f
        dw      tgt_c256f
        dw      tgt_c257d
        dw      tgt_c257d
TBL_c26f4:
        dw      tgt_c2429
        dw      tgt_c25c2
        dw      tgt_c25db
        dw      tgt_c25f5
        dw      tgt_c260f
        dw      tgt_c2686
TBL_c2700:
        dw      tgt_c2379
        dw      tgt_c2379
        dw      tgt_c2387
        dw      tgt_c2387
        dw      tgt_c2395
        dw      tgt_c2395
        dw      tgt_c23a3
        dw      tgt_c23a3
fn_c2710:
        push    bp
        mov     bp, sp
        sub     sp, 0ah
        mov     byte ptr [bp - 6], 64h
        mov     byte ptr [bp - 7], 32h
        mov     byte ptr [bp - 8], 64h
        mov     byte ptr [bp - 9], 9
        mov     byte ptr [bp - 0ah], 1
        mov     byte ptr [B_D5DD], 1fh
        push    ds
        push    word STR_5226
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_5241
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_524C
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_5261
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     byte ptr [bp - 3], 0
        mov     byte ptr [bp - 1], 0
        mov     byte ptr [bp - 2], 1
        jmp     br_c29cc
br_c2797:
        callf   SEG_B05A:far_b05a7
        push    0ah
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    19h
        push    ds
        if      FW_VERSION >= 312
        push    word P_5011+9
        elseif  FW_VERSION = 311
        push    word P_4F67_V311+9
        else
        push    word P_49FA_V308+8
        endif
        push    ss
        lea     ax, [bp - 3]
        push    ax
        push    ds
        push    word A_5052
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    14h
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_51A7
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    14h
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 3]
        cbw
        mov     bx, ax
        cmp     bx, 4
        jbe     br_c27f1
        jmp     near br_c2877
br_c27f1:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c29e5]
tgt_c27f8:
        push    8
        push    64h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word A_5052
        callf   SEG_B347:far_b3819
        add     sp, 10h
        jmp     br_c2877
tgt_c2813:
        push    3
        push    ds
        push    word P_0060+4
        push    ss
        lea     ax, [bp - 7]
        push    ax
        push    ds
        push    word A_5052
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        jmp     br_c2877
tgt_c282c:
        push    8
        push    64h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    ds
        push    word A_5052
        callf   SEG_B347:far_b3819
        add     sp, 10h
        jmp     br_c2877
tgt_c2847:
        push    4
        push    ds
        push    word A_4FC2
        push    ss
        lea     ax, [bp - 9]
        push    ax
        push    ds
        push    word A_5052
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        jmp     br_c2877
tgt_c2860:
        push    3
        push    ds
        push    word P_0020+4
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        push    ds
        push    word A_5052
        callf   SEG_B347:far_b362e
        add     sp, 0eh
br_c2877:
        mov     byte ptr [bp - 2], 0
        jmp     br_c288b
loop_c287d:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jz      br_c2887
        jmp     br_c288b
br_c2887:
        mov     byte ptr [bp - 2], 1
br_c288b:
        cmp     byte ptr [bp - 2], 0
        jnz     br_c28a2
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     byte ptr [bp - 1], al
        or      al, al
        jz      loop_c287d
br_c28a2:
        mov     al, byte ptr [bp - 1]
        cbw
        cmp     ax, 78h
        jz      br_c28ae
        jmp     br_c29cc
br_c28ae:
        mov     al, byte ptr [bp - 3]
        cbw
        mov     bx, ax
        cmp     bx, 4
        jbe     br_c28bc
        jmp     br_c29c8
br_c28bc:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c29db]
tgt_c28c3:
        mov     byte ptr [bp - 5], 23h
        jmp     br_c28e2
loop_c28c9:
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        callf   SEG_CB8A:far_cbb70
        add     sp, 2
        mov     bl, byte ptr [bp - 6]
        mov     es, dx
        xchg    bx, ax
        mov     byte ptr es:[bx], al
        inc     byte ptr [bp - 5]
br_c28e2:
        cmp     byte ptr [bp - 5], 62h
        jle     loop_c28c9
        jmp     br_c29c8
tgt_c28eb:
        mov     byte ptr [bp - 5], 23h
        jmp     br_c290b
loop_c28f1:
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        callf   SEG_CB8A:far_cbb70
        add     sp, 2
        mov     bl, byte ptr [bp - 7]
        mov     es, dx
        xchg    bx, ax
        mov     byte ptr es:[bx + 1], al
        inc     byte ptr [bp - 5]
br_c290b:
        cmp     byte ptr [bp - 5], 62h
        jle     loop_c28f1
        jmp     near br_c29c8
tgt_c2914:
        mov     byte ptr [bp - 5], 23h
        jmp     br_c2934
loop_c291a:
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        callf   SEG_CB8A:far_cbbd4
        add     sp, 2
        mov     bl, byte ptr [bp - 8]
        mov     es, dx
        xchg    bx, ax
        mov     byte ptr es:[bx + 2], al
        inc     byte ptr [bp - 5]
br_c2934:
        cmp     byte ptr [bp - 5], 62h
        jle     loop_c291a
        jmp     near br_c29c8
tgt_c293d:
        mov     byte ptr [bp - 5], 23h
        jmp     br_c297a
loop_c2943:
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        callf   SEG_CB8A:far_cbbd4
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 3]
        and     al, 80h
        mov     byte ptr [bp - 4], al
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        callf   SEG_CB8A:far_cbbd4
        add     sp, 2
        mov     bl, byte ptr [bp - 9]
        or      bl, byte ptr [bp - 4]
        mov     es, dx
        xchg    bx, ax
        mov     byte ptr es:[bx + 3], al
        inc     byte ptr [bp - 5]
br_c297a:
        cmp     byte ptr [bp - 5], 62h
        jle     loop_c2943
        jmp     br_c29c8
tgt_c2982:
        mov     byte ptr [bp - 5], 23h
        jmp     br_c29c2
loop_c2988:
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        callf   SEG_CB8A:far_cbbd4
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 3]
        and     al, 0fh
        mov     byte ptr [bp - 4], al
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        callf   SEG_CB8A:far_cbbd4
        add     sp, 2
        mov     bl, byte ptr [bp - 0ah]
        shl     bl, 7
        or      bl, byte ptr [bp - 4]
        mov     es, dx
        xchg    bx, ax
        mov     byte ptr es:[bx + 3], al
        inc     byte ptr [bp - 5]
br_c29c2:
        cmp     byte ptr [bp - 5], 62h
        jle     loop_c2988
br_c29c8:
        mov     byte ptr [bp - 1], 0
br_c29cc:
        cmp     byte ptr [bp - 2], 1
        jnz     br_c29d5
        jmp     br_c2797
br_c29d5:
        mov     al, byte ptr [bp - 1]
        cbw
        leave
        retf
TBL_c29db:
        dw      tgt_c28c3
        dw      tgt_c28eb
        dw      tgt_c2914
        dw      tgt_c293d
        dw      tgt_c2982
TBL_c29e5:
        dw      tgt_c27f8
        dw      tgt_c2813
        dw      tgt_c282c
        dw      tgt_c2847
        dw      tgt_c2860
fn_c29ef:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    ds
        push    word STR_5269
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    ds
        push    word P_0040+8
        push    ds
        push    word B_E422
        push    ds
        push    word STR_527D
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    ds
        push    word P_0040+8
        push    ds
        push    word B_E423
        push    ds
        push    word STR_5289
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    ds
        push    word P_0040+8
        push    ds
        push    word B_E424
        push    ds
        push    word STR_52A1
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_52AA
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    3
        push    ds
        push    word P_0020+4
        push    ds
        push    word B_E425
        push    ds
        push    word STR_52D3
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    17h
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_52E7
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        jmp     br_c2ad8
loop_c2ac0:
        mov     al, byte ptr [B_7B8D]
        cbw
        cmp     ax, 2
        jnz     br_c2ad8
        nop
        push    cs
        call    far_c2c33
        push    dx
        push    ax
        nop
        push    cs
        call    far_c2b07
        add     sp, 4
br_c2ad8:
        push    0
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     byte ptr [bp - 1], al
        or      al, al
        jz      loop_c2ac0
        cbw
        leave
        retf
fn_c2aec:
        mov     bx, 1
        jmp     br_c2b01
loop_c2af1:
        mov     ax, bx
        add     ax, 0a00h
        mov     dx, 60h
        out     dx, ax
        mov     dx, 6ch
        xor     ax, ax
        out     dx, ax
        inc     bx
br_c2b01:
        cmp     bx, 20h
        jl      loop_c2af1
        retf
far_c2b07:
        push    bp
        mov     bp, sp
        sub     sp, 0ch
        push    si
        push    di
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        or      ax, ax
        jnz     br_c2b23
        push    cs
        call    fn_c2aec
        pop     di
        pop     si
        leave
        retf
br_c2b23:
        mov     dx, 60h
        mov     ax, 0a0bh
        out     dx, ax
        mov     dx, 62h
        xor     ax, ax
        out     dx, ax
        mov     dx, 64h
        mov     ax, 1
        out     dx, ax
        mov     si, 1
        xor     di, di
        mov     ax, word ptr [bp + 6]
        add     ax, 8
        mov     word ptr [bp - 6], ax
        mov     ax, word ptr [bp + 6]
        mov     word ptr [bp - 8], ax
br_c2b4b:
        mov     es, word ptr [bp + 8]
        mov     bx, word ptr [bp - 6]
        mov     ax, word ptr es:[bx]
        cwd
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        xor     cx, cx
        mov     bx, 1b9h
        callf   0f800h:far_fa0c8
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        push    0
        push    0ah
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        mov     cx, 0ffffh
        sub     cx, word ptr [bp - 4]
        mov     es, word ptr [bp + 8]
        mov     bx, word ptr [bp - 8]
        mov     al, byte ptr es:[bx + 5]
        mov     ah, 0
        mov     word ptr [bp - 0ah], ax
        mov     bx, 64h
        sub     bx, ax
        shl     bx, 1
        mov     ax, word ptr [bx + TBL_6F4C]
        mov     bx, word ptr [bp - 8]
        mov     dl, byte ptr es:[bx + 2]
        mov     dh, 0
        mov     word ptr [bp - 0ch], dx
        imul    dx
        mov     bx, ax
        shr     bx, 1
        and     bx, 0fffch
        mov     ax, si
        inc     si
        add     ax, 0a00h
        mov     dx, 60h
        out     dx, ax
        mov     dx, 62h
        mov     ax, bx
        out     dx, ax
        mov     dx, 64h
        mov     ax, cx
        out     dx, ax
        mov     bx, word ptr [bp - 0ah]
        shl     bx, 1
        mov     ax, word ptr [bx + TBL_6F4C]
        imul    word ptr [bp - 0ch]
        mov     bx, ax
        shr     bx, 1
        and     bx, 0fffch
        or      bx, 1
        mov     ax, si
        inc     si
        add     ax, 0a00h
        mov     dx, 60h
        out     dx, ax
        mov     dx, 62h
        mov     ax, bx
        out     dx, ax
        mov     dx, 64h
        mov     ax, cx
        out     dx, ax
        mov     bx, word ptr [bp - 8]
        mov     al, byte ptr es:[bx + 14h]
        mov     ah, 0
        mov     dx, 51h
        imul    dx
        shl     ax, 2
        mov     bx, ax
        mov     ax, si
        inc     si
        add     ax, 0a00h
        mov     dx, 60h
        out     dx, ax
        mov     ax, bx
        or      ax, 3
        mov     dx, 62h
        out     dx, ax
        mov     dx, 64h
        mov     ax, cx
        out     dx, ax
        add     word ptr [bp - 6], 2
        inc     word ptr [bp - 8]
        inc     di
        cmp     di, 3
        jge     br_c2c2f
        jmp     br_c2b4b
br_c2c2f:
        pop     di
        pop     si
        leave
        retf
far_c2c33:
        mov     al, byte ptr [B_E424]
        mov     ah, 0
        or      ax, ax
        jz      br_c2c5c
        cmp     ax, 1
        jz      br_c2c48
        cmp     ax, 2
        jz      br_c2c62
        jmp     br_c2c6d
br_c2c48:
        mov     ax, word ptr [W_901D]
        or      ax, word ptr [W_901F]
        jz      br_c2c5c
        mov     dx, word ptr [W_901F]
        mov     ax, word ptr [W_901D]
        add     ax, 12ah
        retf
br_c2c5c:
        mov     dx, ds
        mov     ax, B_E428
        retf
br_c2c62:
        mov     dx, word ptr [W_E40E]
        mov     ax, word ptr [FP_E40C]
        add     ax, 1ah
        retf
br_c2c6d:
        mov     dx, ds
        mov     ax, B_E428
        retf
fn_c2c73:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    cs
        call    far_c2c33
        mov     word ptr [bp - 4], dx
        mov     word ptr [bp - 6], ax
        push    ds
        push    word STR_52F9
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_5309
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     byte ptr [bp - 1], 0
br_c2cab:
        push    0
        mov     al, byte ptr [bp - 1]
        cbw
        add     ax, 2
        push    ax
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    64h
        push    0
        push    3
        mov     al, byte ptr [bp - 1]
        cbw
        mov     dx, word ptr [bp - 6]
        add     dx, ax
        add     dx, 2
        push    word ptr [bp - 4]
        push    dx
        push    ds
        push    word STR_5332
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    3
        push    ds
        push    word P_0060+4
        mov     al, byte ptr [bp - 1]
        cbw
        mov     dx, word ptr [bp - 6]
        add     dx, ax
        add     dx, 5
        push    word ptr [bp - 4]
        push    dx
        push    ds
        push    word A_533D
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    word 5ceh
        push    1
        push    4
        mov     al, byte ptr [bp - 1]
        cbw
        shl     ax, 1
        mov     dx, word ptr [bp - 6]
        add     dx, ax
        add     dx, 8
        push    word ptr [bp - 4]
        push    dx
        push    ds
        push    word A_533D
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    8
        push    64h
        push    0
        push    3
        mov     al, byte ptr [bp - 1]
        cbw
        mov     dx, word ptr [bp - 6]
        add     dx, ax
        add     dx, 14h
        push    word ptr [bp - 4]
        push    dx
        push    ds
        push    word STR_5343
        callf   SEG_B347:far_b3819
        add     sp, 10h
        inc     byte ptr [bp - 1]
        cmp     byte ptr [bp - 1], 3
        jge     br_c2d5a
        jmp     near br_c2cab
br_c2d5a:
        push    5
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word P_5058+3
        elseif  FW_VERSION = 311
        push    word P_5058+3
        else
        push    word P_5058+3
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    5
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word P_505D+3
        elseif  FW_VERSION = 311
        push    word P_505D+3
        else
        push    word P_505D+3
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_534A
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    4
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        les     bx, dword ptr [bp - 6]
        cmp     byte ptr es:[bx], 0
        jz      br_c2dcb
        push    ds
        push    word A_5353
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    word ptr [bp - 4]
        push    word ptr [bp - 6]
        push    cs
        call    far_c2b07
        add     sp, 4
        jmp     br_c2dd7
br_c2dcb:
        push    ds
        push    word A_5357
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_c2dd7:
        mov     dl, 0
        jmp     br_c2e52
loop_c2ddb:
        les     bx, dword ptr [bp - 6]
        cmp     byte ptr es:[bx], 0
        jz      loop_c2def
        push    word ptr [bp - 4]
        push    bx
        push    cs
        call    far_c2b07
        add     sp, 4
loop_c2def:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dl, al
        or      al, al
        jz      loop_c2ddb
        cbw
        cmp     ax, 78h
        jnz     br_c2e52
        push    4
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        les     bx, dword ptr [bp - 6]
        cmp     byte ptr es:[bx], 0
        jz      br_c2e30
        mov     byte ptr es:[bx], 0
        push    ds
        push    word A_5357
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    cs
        call    fn_c2aec
        jmp     br_c2e50
br_c2e30:
        les     bx, dword ptr [bp - 6]
        mov     byte ptr es:[bx], 1
        push    ds
        push    word A_5353
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    word ptr [bp - 4]
        push    word ptr [bp - 6]
        push    cs
        call    far_c2b07
        add     sp, 4
br_c2e50:
        mov     dl, 0
br_c2e52:
        or      dl, dl
        jz      loop_c2def
        mov     al, dl
        cbw
        leave
        retf
        if      FW_VERSION >= 312
        phase   0bh
        elseif  FW_VERSION = 311
        phase   7
        else
        phase   0ch
        endif
far_c2e5b:
        push    bp
        mov     bp, sp
        sub     sp, 10h
        push    si
        push    di
        mov     byte ptr [B_D5DD], 5
        mov     al, byte ptr [B_83B9]
        mov     byte ptr [B_537A], al
        push    ds
        push    word STR_53A9
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        callf   SEG_CB8A:far_cc62d
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_53BA
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0ffffh
        push    0ffffh
        push    0
        callf   SEG_CC84:far_ccbdd
        add     sp, 6
        push    ds
        push    word A_F00B
        nop
        push    cs
        call    far_c458d
        add     sp, 4
        callf   SEG_CC84:far_cca70
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        cmp     word ptr [bp - 2], 0
        jg      br_c2edc
        jl      br_c2ecb
        cmp     word ptr [bp - 4], 4020h
        jnc     br_c2edc
br_c2ecb:
        push    2
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     ax, 4ch
        pop     di
        pop     si
        leave
        retf
br_c2edc:
        push    0
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    ds
        push    word A_F00B
        callf   SEG_CC84:far_cce4b
        add     sp, 0ah
        mov     byte ptr [B_5379], al
        cmp     byte ptr [B_5379], 0
        jge     br_c2f0d
        cbw
        neg     ax
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     ax, 4ch
        pop     di
        pop     si
        leave
        retf
br_c2f0d:
        mov     al, byte ptr [B_5379]
        cbw
        mov     dx, 24h
        imul    dx
        add     ax, 4800h
        mov     word ptr [W_F002], SEG_A28F
        mov     word ptr [W_F000], ax
        les     bx, dword ptr [W_F000]
        mov     ax, word ptr es:[bx + 22h]
        mov     dx, word ptr es:[bx + 20h]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        mov     ax, word ptr es:[bx + 1eh]
        mov     dx, word ptr es:[bx + 1ch]
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp - 0ch], dx
        sub     word ptr [bp - 4], 20h
        sbb     word ptr [bp - 2], 0
        push    0
        push    word 1000h
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        callf   0f800h:far_fa0fe
        mov     dx, ax
        test    dx, 1
        jnz     br_c2f63
        dec     dx
br_c2f63:
        mov     word ptr [W_EFEE], 0
        mov     word ptr [W_EFEC], 1000h
        mov     ax, dx
        cwd
        sub     ax, dx
        sar     ax, 1
        cwd
        push    ax
        push    dx
        xor     dx, dx
        mov     ax, 1000h
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        mov     word ptr [W_EFF2], dx
        mov     word ptr [W_EFF0], ax
        les     bx, dword ptr [W_F000]
        mov     ax, word ptr es:[bx + 22h]
        mov     dx, word ptr es:[bx + 20h]
        mov     word ptr [W_EFFE], ax
        mov     word ptr [W_EFFC], dx
        add     dx, word ptr [W_EFF0]
        adc     ax, word ptr [W_EFF2]
        mov     bx, word ptr [W_EFFE]
        mov     cx, word ptr [W_EFFC]
        add     cx, word ptr [W_EFF0]
        adc     bx, word ptr [W_EFF2]
        and     cx, 0fff0h
        and     bx, 0ffffh
        sub     dx, cx
        sbb     ax, bx
        mov     word ptr [bp - 0eh], ax
        mov     word ptr [bp - 10h], dx
        xor     ax, ax
        mov     dx, 10h
        sub     dx, word ptr [bp - 10h]
        sbb     ax, word ptr [bp - 0eh]
        add     word ptr [W_EFFC], dx
        adc     word ptr [W_EFFE], ax
        mov     ax, word ptr [W_EFFE]
        mov     dx, word ptr [W_EFFC]
        add     dx, word ptr [W_EFF0]
        adc     ax, word ptr [W_EFF2]
        add     dx, word ptr [W_EFEC]
        adc     ax, word ptr [W_EFEE]
        mov     word ptr [W_EFFA], ax
        mov     word ptr [W_EFF8], dx
        add     dx, word ptr [W_EFF0]
        adc     ax, word ptr [W_EFF2]
        mov     bx, word ptr [W_EFFA]
        mov     cx, word ptr [W_EFF8]
        add     cx, word ptr [W_EFF0]
        adc     bx, word ptr [W_EFF2]
        and     cx, 0fff0h
        and     bx, 0ffffh
        sub     dx, cx
        sbb     ax, bx
        mov     word ptr [bp - 0eh], ax
        mov     word ptr [bp - 10h], dx
        xor     ax, ax
        mov     dx, 10h
        sub     dx, word ptr [bp - 10h]
        sbb     ax, word ptr [bp - 0eh]
        add     word ptr [W_EFF8], dx
        adc     word ptr [W_EFFA], ax
        mov     bx, word ptr [W_F000]
        mov     ax, word ptr es:[bx + 22h]
        mov     dx, word ptr es:[bx + 20h]
        mov     word ptr [W_EFF6], ax
        mov     word ptr [W_EFF4], dx
        mov     ax, word ptr [W_EFF2]
        mov     dx, word ptr [W_EFF0]
        shl     dx, 1
        rcl     ax, 1
        mov     bx, word ptr [W_EFF6]
        mov     cx, word ptr [W_EFF4]
        add     cx, dx
        adc     bx, ax
        mov     ax, word ptr [W_EFF2]
        mov     dx, word ptr [W_EFF0]
        shl     dx, 1
        rcl     ax, 1
        mov     si, word ptr [W_EFF6]
        mov     di, word ptr [W_EFF4]
        add     di, dx
        adc     si, ax
        and     di, 0fff0h
        and     si, 0ffffh
        sub     cx, di
        sbb     bx, si
        mov     word ptr [bp - 0eh], bx
        mov     word ptr [bp - 10h], cx
        xor     ax, ax
        mov     dx, 10h
        sub     dx, word ptr [bp - 10h]
        sbb     ax, word ptr [bp - 0eh]
        add     word ptr [W_EFF4], dx
        adc     word ptr [W_EFF6], ax
        cmp     byte ptr [B_83BA], 2
        jge     br_c30a5
        mov     byte ptr [B_537B], 0
        jmp     br_c30aa
br_c30a5:
        mov     byte ptr [B_537B], 1
br_c30aa:
        push    word 4800h
        push    word SEG_A28F
        push    word 0
        callf   SEG_D9CB:far_d9e7b
        add     sp, 6
        push    word ptr [W_EFF2]
        push    word ptr [W_EFF0]
        push    word ptr [W_EFF6]
        push    word ptr [W_EFF4]
        push    word ptr [W_EFFA]
        push    word ptr [W_EFF8]
        push    word ptr [W_EFFE]
        push    word ptr [W_EFFC]
        callf   SEG_D9CB:far_d9ea7
        add     sp, 10h
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    7
        push    ds
        if      FW_VERSION >= 312
        push    word P_5363+9
        elseif  FW_VERSION = 311
        push    word P_52B9_V311+9
        else
        push    word P_4D4B_V308+9
        endif
        push    ds
        push    word B_83B9
        push    ds
        push    word STR_53D5
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0fh
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    ds
        if      FW_VERSION >= 312
        push    word P_5353+9
        elseif  FW_VERSION = 311
        push    word P_52A9_V311+9
        else
        push    word P_4D3B_V308+9
        endif
        push    ds
        push    word B_83BA
        push    ds
        push    word STR_53DC
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    1dh
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    3
        push    ds
        push    word P_0030
        push    ds
        push    word B_83BB
        push    ds
        push    word STR_53E2
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    word 113ah
        push    word ptr [W_EFF2]
        push    word ptr [W_EFF0]
        callf   0f800h:far_fa0fe
        mov     si, ax
        mov     al, byte ptr [B_537B]
        cbw
        or      ax, ax
        jnz     br_c317a
        mov     dx, 2
        mov     ax, si
        imul    dx
        mov     si, ax
br_c317a:
        cmp     si, word ptr [W_83BE]
        jle     br_c3185
        mov     ax, word ptr [W_83BE]
        jmp     br_c3187
br_c3185:
        mov     ax, si
br_c3187:
        mov     word ptr [W_83BE], ax
        push    4
        push    si
        push    1
        push    5
        push    ds
        push    word W_83BE
        push    ds
        push    word STR_53EB
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0fh
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    64h
        push    0
        push    3
        push    ds
        push    word B_83BC
        push    ds
        push    word STR_53F3
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    1dh
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    64h
        push    0
        push    3
        push    ds
        push    word B_83BD
        push    ds
        push    word STR_53FA
        callf   SEG_B347:far_b3819
        add     sp, 10h
        nop
        push    cs
        call    fn_c3ed1
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_5403
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     byte ptr [B_F008], 0ffh
        mov     al, byte ptr [B_83BB]
        cbw
        push    ax
        mov     al, byte ptr [B_83BA]
        cbw
        push    ax
        mov     al, byte ptr [B_83B9]
        cbw
        push    ax
        nop
        push    cs
        call    fn_c4643
        add     sp, 6
        mov     byte ptr [B_537C], 0
        mov     byte ptr [B_CEBF], 1
        inc     byte ptr [B_956A]
        xor     si, si
        jmp     br_c3384
br_c323a:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     bx, ax
        cmp     bx, 4
        jbe     br_c3248
        jmp     tgt_c331e
br_c3248:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c33fe]
tgt_c324f:
        mov     al, byte ptr [B_83BB]
        cbw
        push    ax
        mov     al, byte ptr [B_83BA]
        cbw
        push    ax
        mov     al, byte ptr [B_83B9]
        cbw
        push    ax
        nop
        push    cs
        call    fn_c4643
        add     sp, 6
        or      ax, ax
        jnz     br_c326d
        jmp     near tgt_c331e
br_c326d:
        mov     al, byte ptr [B_83B9]
        mov     byte ptr [B_537A], al
        nop
        push    cs
        call    fn_c4174
        push    5
        callf   SEG_B059:far_b059a
        add     sp, 2
        jmp     near tgt_c331e
tgt_c3285:
        cmp     byte ptr [B_83BA], 2
        jge     br_c3293
        mov     byte ptr [B_537B], 0
        jmp     br_c3298
br_c3293:
        mov     byte ptr [B_537B], 1
br_c3298:
        mov     al, byte ptr [B_83BB]
        cbw
        push    ax
        mov     al, byte ptr [B_83BA]
        cbw
        push    ax
        mov     al, byte ptr [B_83B9]
        cbw
        push    ax
        nop
        push    cs
        call    fn_c4643
        add     sp, 6
        or      ax, ax
        jz      tgt_c331e
        nop
        push    cs
        call    fn_c3ed1
        push    0
        push    word 113ah
        push    word ptr [W_EFF2]
        push    word ptr [W_EFF0]
        callf   0f800h:far_fa0fe
        mov     si, ax
        mov     al, byte ptr [B_537B]
        cbw
        or      ax, ax
        jnz     br_c32dd
        mov     dx, 2
        mov     ax, si
        imul    dx
        mov     si, ax
br_c32dd:
        push    si
        push    0
        push    3
        callf   SEG_B05A:far_b1206
        add     sp, 6
        cmp     word ptr [W_83BE], si
        jle     br_c32f4
        mov     word ptr [W_83BE], si
br_c32f4:
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     tgt_c331e
tgt_c3300:
        mov     al, byte ptr [B_83BB]
        cbw
        push    ax
        mov     al, byte ptr [B_83BA]
        cbw
        push    ax
        mov     al, byte ptr [B_83B9]
        cbw
        push    ax
        nop
        push    cs
        call    fn_c4643
        add     sp, 6
        jmp     tgt_c331e
tgt_c3319:
        nop
        push    cs
        call    fn_c4122
tgt_c331e:
        push    2
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        or      ax, ax
        jnz     br_c3331
        jmp     br_c323a
br_c3331:
        cmp     ax, 78h
        jz      br_c333d
        cmp     ax, 79h
        jz      br_c3376
        jmp     br_c3384
br_c333d:
        xor     si, si
        cmp     byte ptr [B_537C], 0
        jnz     br_c3384
        mov     byte ptr [B_5378], 0
        mov     byte ptr [B_537C], 1
        nop
        push    cs
        call    fn_c4174
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_542C
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        nop
        push    cs
        call    fn_c3f4a
        mov     si, ax
        jmp     br_c3384
br_c3376:
        cmp     byte ptr [B_537C], 0
        jnz     br_c3382
        nop
        push    cs
        call    fn_c4195
br_c3382:
        xor     si, si
br_c3384:
        or      si, si
        jz      tgt_c331e
        mov     byte ptr [B_CEBF], 0
        mov     al, byte ptr [B_83BB]
        cbw
        push    ax
        mov     al, byte ptr [B_83BA]
        cbw
        push    ax
        push    0
        nop
        push    cs
        call    fn_c4643
        add     sp, 6
        callf   SEG_D9CB:far_d9e1a
        cmp     byte ptr [B_537C], 4
        jz      br_c33de
        les     bx, dword ptr [W_F000]
        mov     ax, word ptr [bp - 6]
        mov     dx, word ptr [bp - 8]
        mov     word ptr es:[bx + 22h], ax
        mov     word ptr es:[bx + 20h], dx
        mov     ax, word ptr [bp - 0ah]
        mov     dx, word ptr [bp - 0ch]
        mov     word ptr es:[bx + 1eh], ax
        mov     word ptr es:[bx + 1ch], dx
        if      FW_VERSION >= 311
        push    1
        endif
        push    0
        mov     al, byte ptr [B_5379]
        cbw
        push    ax
        callf   SEG_CC84:far_cd353
        if      FW_VERSION >= 311
        add     sp, 6
        else
        add     sp, 4
        endif
br_c33de:
        callf   SEG_D78B:far_d7903
        dec     byte ptr [B_956A]
        xor     di, di
loop_c33e9:
        push    di
        callf   SEG_CDB9:far_cdc78
        add     sp, 2
        inc     di
        cmp     di, 20h
        jl      loop_c33e9
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
TBL_c33fe:
        dw      tgt_c324f
        dw      tgt_c3285
        dw      tgt_c3300
        dw      tgt_c331e
        dw      tgt_c3319
fn_c3408:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        les     bx, dword ptr [bp + 0ah]
        push    word ptr es:[bx + 1ah]
        push    word ptr es:[bx + 18h]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   0f800h:far_fa0fe
        mov     cx, ax
        mov     bx, 8
        cwd
        idiv    bx
        mov     si, ax
        mov     ax, cx
        cwd
        idiv    bx
        mov     al, 1
        mov     cl, dl
        shl     al, cl
        mov     byte ptr [bp - 1], al
        or      byte ptr [si + TBL_F01A], al
        pop     si
        leave
        retf
fn_c3444:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        les     bx, dword ptr [bp + 0ah]
        push    word ptr es:[bx + 1ah]
        push    word ptr es:[bx + 18h]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   0f800h:far_fa0fe
        mov     cx, ax
        mov     bx, 8
        cwd
        idiv    bx
        mov     si, ax
        mov     ax, cx
        cwd
        idiv    bx
        mov     al, 1
        mov     cl, dl
        shl     al, cl
        mov     byte ptr [bp - 1], al
        mov     al, byte ptr [si + TBL_F01A]
        and     al, byte ptr [bp - 1]
        mov     ah, 0
        pop     si
        leave
        retf
fn_c3485:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        les     bx, dword ptr [bp + 0ah]
        mov     ax, word ptr es:[bx + 6]
        mov     dx, word ptr es:[bx + 4]
        cmp     ax, word ptr [bp + 8]
        jg      br_c34c8
        jnz     br_c34a3
        cmp     dx, word ptr [bp + 6]
        ja      br_c34c8
br_c34a3:
        les     bx, dword ptr [bp + 0ah]
        mov     ax, word ptr es:[bx + 0eh]
        mov     dx, word ptr es:[bx + 0ch]
        mov     cx, word ptr [bp + 8]
        mov     si, word ptr [bp + 6]
        sub     si, word ptr es:[bx + 4]
        sbb     cx, word ptr es:[bx + 6]
        add     dx, si
        adc     ax, cx
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        jmp     br_c3524
br_c34c8:
        les     bx, dword ptr [bp + 0ah]
        mov     ax, word ptr es:[bx + 0ah]
        mov     dx, word ptr es:[bx + 8]
        cmp     ax, word ptr [bp + 8]
        jl      br_c351a
        jg      br_c34df
        cmp     dx, word ptr [bp + 6]
        jbe     br_c351a
br_c34df:
        les     bx, dword ptr [bp + 0ah]
        mov     ax, word ptr es:[bx + 2]
        mov     dx, word ptr es:[bx]
        sub     dx, word ptr es:[bx + 4]
        sbb     ax, word ptr es:[bx + 6]
        mov     cx, word ptr es:[bx + 0eh]
        mov     bx, word ptr es:[bx + 0ch]
        add     bx, dx
        adc     cx, ax
        mov     si, word ptr [bp + 0ah]
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        sub     dx, word ptr es:[si + 0ch]
        sbb     ax, word ptr es:[si + 0eh]
        add     bx, dx
        adc     cx, ax
        mov     word ptr [bp - 2], cx
        mov     word ptr [bp - 4], bx
        jmp     br_c3524
br_c351a:
        mov     word ptr [bp - 2], 0ffffh
        mov     word ptr [bp - 4], 0ffffh
br_c3524:
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        pop     si
        leave
        retf
fn_c352d:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    cs
        call    fn_c3444
        add     sp, 8
        or      ax, ax
        jz      br_c3550
        xor     dx, dx
        xor     ax, ax
        leave
        retf
br_c3550:
        les     bx, dword ptr [bp + 0ah]
        mov     ax, word ptr es:[bx + 1ah]
        mov     dx, word ptr es:[bx + 18h]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        mov     ax, word ptr es:[bx + 6]
        mov     dx, word ptr es:[bx + 4]
        cmp     ax, word ptr [bp + 8]
        jg      br_c3593
        jnz     br_c357b
        cmp     dx, word ptr [bp + 6]
        ja      br_c3593
br_c357b:
        les     bx, dword ptr [bp + 0ah]
        mov     ax, word ptr es:[bx + 2]
        mov     dx, word ptr es:[bx]
        sub     dx, word ptr [bp + 6]
        sbb     ax, word ptr [bp + 8]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        jmp     br_c35cd
br_c3593:
        les     bx, dword ptr [bp + 0ah]
        mov     ax, word ptr es:[bx + 0ah]
        mov     dx, word ptr es:[bx + 8]
        cmp     ax, word ptr [bp + 8]
        jl      br_c35c3
        jg      br_c35aa
        cmp     dx, word ptr [bp + 6]
        jbe     br_c35c3
br_c35aa:
        les     bx, dword ptr [bp + 0ah]
        mov     ax, word ptr es:[bx + 0ah]
        mov     dx, word ptr es:[bx + 8]
        sub     dx, word ptr [bp + 6]
        sbb     ax, word ptr [bp + 8]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        jmp     br_c35cd
br_c35c3:
        mov     word ptr [bp - 6], 0
        mov     word ptr [bp - 8], 0
br_c35cd:
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        cmp     ax, word ptr [bp - 6]
        jl      br_c35eb
        jg      br_c35df
        cmp     dx, word ptr [bp - 8]
        jbe     br_c35eb
br_c35df:
        mov     ax, word ptr [bp - 6]
        mov     dx, word ptr [bp - 8]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
br_c35eb:
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        leave
        retf
fn_c35f3:
        push    bp
        mov     bp, sp
        push    word ptr [bp + 20h]
        push    word ptr [bp + 1eh]
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    cs
        call    fn_c352d
        add     sp, 8
        les     bx, dword ptr [bp + 1ah]
        mov     word ptr es:[bx + 2], dx
        mov     word ptr es:[bx], ax
        or      ax, dx
        jz      br_c3664
        push    1
        push    word ptr es:[bx + 2]
        push    word ptr es:[bx]
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 14h]
        push    word ptr [bp + 12h]
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        push    word ptr [bp + 20h]
        push    word ptr [bp + 1eh]
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    cs
        call    fn_c3485
        add     sp, 8
        les     bx, dword ptr [bp + 16h]
        mov     word ptr es:[bx + 2], dx
        mov     word ptr es:[bx], ax
        push    word ptr [bp + 20h]
        push    word ptr [bp + 1eh]
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    cs
        call    fn_c3408
        add     sp, 8
br_c3664:
        cmp     word ptr [bp + 0ch], 0
        jl      br_c368e
        jnz     br_c3672
        cmp     word ptr [bp + 0ah], 0
        jc      br_c368e
br_c3672:
        push    0
        push    word ptr [bp + 10h]
        push    word ptr [bp + 0eh]
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
br_c368e:
        pop     bp
        retf
fn_c3690:
        push    bp
        mov     bp, sp
        sub     sp, 40h
        push    si
        push    di
        mov     ax, word ptr [bp + 14h]
        mov     dx, word ptr [bp + 12h]
        mov     word ptr [bp - 2ah], ax
        mov     word ptr [bp - 2ch], dx
        mov     ax, word ptr [bp + 0ch]
        mov     dx, word ptr [bp + 0ah]
        mov     word ptr [bp - 2eh], ax
        mov     word ptr [bp - 30h], dx
        mov     ax, word ptr [bp + 18h]
        mov     dx, word ptr [bp + 16h]
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        mov     word ptr [bp - 32h], ax
        mov     word ptr [bp - 34h], dx
        add     dx, word ptr [bp + 0ah]
        adc     ax, word ptr [bp + 0ch]
        mov     word ptr [bp - 3eh], ax
        mov     word ptr [bp - 40h], dx
        mov     ax, word ptr [bp + 10h]
        mov     dx, word ptr [bp + 0eh]
        mov     word ptr [bp - 3ah], ax
        mov     word ptr [bp - 3ch], dx
        mov     ax, word ptr [bp - 3eh]
        mov     dx, word ptr [bp - 40h]
        sub     dx, word ptr [bp + 0eh]
        sbb     ax, word ptr [bp + 10h]
        cmp     ax, word ptr [bp + 14h]
        jl      br_c3702
        jnz     br_c36f8
        cmp     dx, word ptr [bp + 12h]
        jc      br_c3702
br_c36f8:
        mov     dx, word ptr [bp + 10h]
        mov     ax, word ptr [bp + 0eh]
        pop     di
        pop     si
        leave
        retf
br_c3702:
        mov     ax, word ptr [bp - 32h]
        mov     dx, word ptr [bp - 34h]
        add     dx, word ptr [bp - 2ch]
        adc     ax, word ptr [bp - 2ah]
        mov     bx, word ptr [bp - 3eh]
        mov     cx, word ptr [bp - 40h]
        sub     cx, word ptr [bp - 3ch]
        sbb     bx, word ptr [bp - 3ah]
        sub     dx, cx
        sbb     ax, bx
        mov     word ptr [bp - 36h], ax
        mov     word ptr [bp - 38h], dx
        mov     word ptr [bp - 1eh], SEG_A28F
        mov     word ptr [bp - 20h], 0
        mov     ax, 0
        add     ax, 2000h
        mov     word ptr [bp - 22h], SEG_A28F
        mov     word ptr [bp - 24h], ax
        mov     ax, word ptr [bp - 3eh]
        mov     dx, word ptr [bp - 40h]
        sub     dx, word ptr [bp - 3ch]
        sbb     ax, word ptr [bp - 3ah]
        mov     word ptr [bp - 16h], ax
        mov     word ptr [bp - 18h], dx
        mov     ax, word ptr [bp - 36h]
        mov     dx, word ptr [bp - 38h]
        sub     dx, word ptr [bp - 34h]
        sbb     ax, word ptr [bp - 32h]
        mov     word ptr [bp - 1ah], ax
        mov     word ptr [bp - 1ch], dx
        mov     ax, word ptr [bp - 3ah]
        mov     dx, word ptr [bp - 3ch]
        sub     dx, word ptr [bp - 38h]
        sbb     ax, word ptr [bp - 36h]
        cmp     ax, word ptr [bp - 2ah]
        jl      br_c37be
        jnz     br_c3778
        cmp     dx, word ptr [bp - 2ch]
        jc      br_c37be
br_c3778:
        push    word ptr [bp - 16h]
        push    word ptr [bp - 18h]
        push    word ptr [bp - 36h]
        push    word ptr [bp - 38h]
        push    word ptr [bp - 3ah]
        push    word ptr [bp - 3ch]
        callf   SEG_CC84:far_cd68a
        add     sp, 0ch
        push    word ptr [bp - 1ah]
        push    word ptr [bp - 1ch]
        mov     ax, word ptr [bp - 36h]
        mov     dx, word ptr [bp - 38h]
        add     dx, word ptr [bp - 18h]
        adc     ax, word ptr [bp - 16h]
        push    ax
        push    dx
        push    word ptr [bp - 32h]
        push    word ptr [bp - 34h]
        callf   SEG_CC84:far_cd68a
        add     sp, 0ch
        mov     dx, word ptr [bp - 36h]
        mov     ax, word ptr [bp - 38h]
        pop     di
        pop     si
        leave
        retf
br_c37be:
        cmp     word ptr [bp + 1ah], 0
        jz      br_c3832
        push    word ptr [bp - 26h]
        push    word ptr [bp - 28h]
        mov     ax, word ptr [bp - 3eh]
        mov     dx, word ptr [bp - 40h]
        sub     dx, word ptr [bp - 3ch]
        sbb     ax, word ptr [bp - 3ah]
        push    ax
        push    dx
        callf   0f800h:far_fa10d
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        or      ax, dx
        jnz     br_c37ea
        jmp     near br_c389d
br_c37ea:
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        sub     word ptr [bp - 34h], dx
        sbb     word ptr [bp - 32h], ax
        sub     word ptr [bp - 40h], dx
        sbb     word ptr [bp - 3eh], ax
        push    1
        push    ax
        push    dx
        push    word ptr [bp - 3eh]
        push    word ptr [bp - 40h]
        push    word ptr [bp - 1eh]
        push    word ptr [bp - 20h]
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        push    0
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    word ptr [bp - 32h]
        push    word ptr [bp - 34h]
        push    word ptr [bp - 1eh]
        push    word ptr [bp - 20h]
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        jmp     br_c389d
br_c3832:
        push    word ptr [bp - 26h]
        push    word ptr [bp - 28h]
        mov     ax, word ptr [bp - 3ah]
        mov     dx, word ptr [bp - 3ch]
        sub     dx, word ptr [bp - 34h]
        sbb     ax, word ptr [bp - 32h]
        push    ax
        push    dx
        callf   0f800h:far_fa10d
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        or      ax, dx
        jz      br_c389d
        push    1
        push    dx
        push    word ptr [bp - 4]
        push    word ptr [bp - 32h]
        push    word ptr [bp - 34h]
        push    word ptr [bp - 1eh]
        push    word ptr [bp - 20h]
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        push    0
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    word ptr [bp - 3eh]
        push    word ptr [bp - 40h]
        push    word ptr [bp - 1eh]
        push    word ptr [bp - 20h]
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        add     word ptr [bp - 34h], dx
        adc     word ptr [bp - 32h], ax
        add     word ptr [bp - 40h], dx
        adc     word ptr [bp - 3eh], ax
br_c389d:
        push    ds
        pop     es
        mov     di, TBL_F01A
        xor     ax, ax
        mov     ah, al
        mov     cx, 100h
        rep stosw
        push    word ptr [bp - 26h]
        push    word ptr [bp - 28h]
        push    word ptr [bp - 2ah]
        push    word ptr [bp - 2ch]
        callf   0f800h:far_fa0fe
        mov     si, ax
        push    word ptr [bp - 26h]
        push    word ptr [bp - 28h]
        push    word ptr [bp - 2ah]
        push    word ptr [bp - 2ch]
        callf   0f800h:far_fa10d
        or      ax, dx
        jz      br_c38d4
        inc     si
br_c38d4:
        xor     ax, ax
        xor     dx, dx
        mov     word ptr [bp - 0eh], ax
        mov     word ptr [bp - 10h], dx
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        xor     ax, ax
        xor     dx, dx
        mov     word ptr [bp - 12h], ax
        mov     word ptr [bp - 14h], dx
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp - 0ch], dx
        mov     ax, word ptr [bp - 3ah]
        mov     dx, word ptr [bp - 3ch]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        jmp     br_c3a02
br_c3903:
        mov     ax, word ptr [bp - 4]
        or      ax, word ptr [bp - 2]
        jnz     br_c3980
        mov     ax, word ptr [bp - 10h]
        or      ax, word ptr [bp - 0eh]
        jnz     br_c3980
        push    ss
        lea     ax, [bp - 40h]
        push    ax
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        push    cs
        call    fn_c352d
        add     sp, 8
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        or      ax, word ptr [bp - 2]
        jz      br_c3974
        push    1
        push    dx
        push    word ptr [bp - 4]
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        push    word ptr [bp - 1eh]
        push    word ptr [bp - 20h]
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        push    ss
        lea     ax, [bp - 40h]
        push    ax
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        push    cs
        call    fn_c3485
        add     sp, 8
        mov     word ptr [bp - 0ah], dx
        mov     word ptr [bp - 0ch], ax
        push    ss
        lea     ax, [bp - 40h]
        push    ax
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        push    cs
        call    fn_c3408
        add     sp, 8
br_c3974:
        mov     ax, word ptr [bp - 26h]
        mov     dx, word ptr [bp - 28h]
        add     word ptr [bp - 8], dx
        adc     word ptr [bp - 6], ax
br_c3980:
        mov     ax, word ptr [bp - 4]
        or      ax, word ptr [bp - 2]
        jz      br_c39c1
        push    ss
        lea     ax, [bp - 40h]
        push    ax
        push    ss
        lea     ax, [bp - 10h]
        push    ax
        push    ss
        lea     ax, [bp - 14h]
        push    ax
        push    word ptr [bp - 22h]
        push    word ptr [bp - 24h]
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    word ptr [bp - 0ah]
        push    word ptr [bp - 0ch]
        push    word ptr [bp - 1eh]
        push    word ptr [bp - 20h]
        push    cs
        call    fn_c35f3
        add     sp, 1ch
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 0
        dec     si
br_c39c1:
        mov     ax, word ptr [bp - 10h]
        or      ax, word ptr [bp - 0eh]
        jz      br_c3a02
        push    ss
        lea     ax, [bp - 40h]
        push    ax
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        push    word ptr [bp - 1eh]
        push    word ptr [bp - 20h]
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 10h]
        push    word ptr [bp - 12h]
        push    word ptr [bp - 14h]
        push    word ptr [bp - 22h]
        push    word ptr [bp - 24h]
        push    cs
        call    fn_c35f3
        add     sp, 1ch
        mov     word ptr [bp - 0eh], 0
        mov     word ptr [bp - 10h], 0
        dec     si
br_c3a02:
        or      si, si
        jz      br_c3a09
        jmp     br_c3903
br_c3a09:
        mov     dx, word ptr [bp - 32h]
        mov     ax, word ptr [bp - 34h]
        pop     di
        pop     si
        leave
        retf
fn_c3a13:
        push    bp
        mov     bp, sp
        sub     sp, 0ch
        mov     ax, word ptr [W_83BE]
        cwd
        push    ax
        push    dx
        xor     dx, dx
        mov     ax, 113ah
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        mov     word ptr [bp - 0ah], dx
        mov     word ptr [bp - 0ch], ax
        cmp     byte ptr [B_83BA], 2
        jge     br_c3a7a
        push    0
        push    word ptr [W_EFEE]
        push    word ptr [W_EFEC]
        push    dx
        push    ax
        push    word ptr [W_EFEA]
        push    word ptr [W_EFE8]
        mov     ax, word ptr [W_EFF2]
        mov     dx, word ptr [W_EFF0]
        shl     dx, 1
        rcl     ax, 1
        push    ax
        push    dx
        push    word ptr [W_EFF6]
        push    word ptr [W_EFF4]
        push    cs
        call    fn_c3690
        add     sp, 16h
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        les     bx, dword ptr [W_F000]
        mov     byte ptr es:[bx + 13h], 0
        jmp     near br_c3b20
br_c3a7a:
        push    0
        push    word ptr [W_EFEE]
        push    word ptr [W_EFEC]
        push    word ptr [bp - 0ah]
        push    word ptr [bp - 0ch]
        push    word ptr [W_EFEA]
        push    word ptr [W_EFE8]
        push    word ptr [W_EFF2]
        push    word ptr [W_EFF0]
        push    word ptr [W_EFFE]
        push    word ptr [W_EFFC]
        push    cs
        call    fn_c3690
        add     sp, 16h
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        push    1
        push    word ptr [W_EFEE]
        push    word ptr [W_EFEC]
        push    word ptr [bp - 0ah]
        push    word ptr [bp - 0ch]
        mov     ax, word ptr [W_EFEA]
        mov     dx, word ptr [W_EFE8]
        add     dx, word ptr [W_EFF8]
        adc     ax, word ptr [W_EFFA]
        sub     dx, word ptr [W_EFFC]
        sbb     ax, word ptr [W_EFFE]
        push    ax
        push    dx
        push    word ptr [W_EFF2]
        push    word ptr [W_EFF0]
        push    word ptr [W_EFFA]
        push    word ptr [W_EFF8]
        push    cs
        call    fn_c3690
        add     sp, 16h
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        push    word ptr [bp - 0ah]
        push    word ptr [bp - 0ch]
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        add     dx, word ptr [bp - 0ch]
        adc     ax, word ptr [bp - 0ah]
        push    ax
        push    dx
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        callf   SEG_CC84:far_cd68a
        add     sp, 0ch
        les     bx, dword ptr [W_F000]
        mov     byte ptr es:[bx + 13h], 1
br_c3b20:
        les     bx, dword ptr [W_F000]
        mov     ax, word ptr [bp - 0ah]
        mov     dx, word ptr [bp - 0ch]
        mov     word ptr es:[bx + 1ah], ax
        mov     word ptr es:[bx + 18h], dx
        mov     word ptr es:[bx + 1eh], ax
        mov     word ptr es:[bx + 1ch], dx
        push    0
        push    0ah
        mov     al, byte ptr [B_83BD]
        cbw
        cwd
        push    ax
        push    dx
        xor     dx, dx
        mov     ax, 1b9h
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        les     bx, dword ptr [W_F000]
        mov     word ptr es:[bx + 16h], dx
        mov     word ptr es:[bx + 14h], ax
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        mov     word ptr es:[bx + 22h], ax
        mov     word ptr es:[bx + 20h], dx
        leave
        retf
fn_c3b74:
        push    bp
        mov     bp, sp
        sub     sp, 0eh
        push    si
        push    di
        mov     si, word ptr [bp + 6]
        mov     di, word ptr [bp + 8]
        mov     byte ptr [B_537C], 2
        mov     word ptr [W_D4B2], 0
        push    ss
        lea     ax, [bp - 0eh]
        push    ax
        push    ss
        lea     ax, [bp - 0dh]
        push    ax
        callf   SEG_B1AA:far_b1b2b
        add     sp, 8
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_5455
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     al, byte ptr [bp - 0eh]
        cbw
        push    ax
        mov     al, byte ptr [bp - 0dh]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     si, di
        jnc     br_c3bdb
        mov     ax, di
        sub     ax, si
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], ax
        jmp     br_c3bea
br_c3bdb:
        mov     ax, di
        add     ax, 2400h
        sub     ax, si
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], ax
br_c3bea:
        cmp     byte ptr [B_537B], 0
        jz      br_c3c22
        push    0
        push    2
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        callf   0f800h:far_fa0fe
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        mov     ax, word ptr [W_EFFE]
        mov     dx, word ptr [W_EFFC]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        mov     ax, word ptr [W_EFF2]
        mov     dx, word ptr [W_EFF0]
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp - 0ch], dx
        jmp     br_c3c40
br_c3c22:
        mov     ax, word ptr [W_EFF6]
        mov     dx, word ptr [W_EFF4]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        mov     ax, word ptr [W_EFF2]
        mov     dx, word ptr [W_EFF0]
        shl     dx, 1
        rcl     ax, 1
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp - 0ch], dx
br_c3c40:
        push    0
        push    0ah
        mov     al, byte ptr [B_83BD]
        cbw
        cwd
        push    ax
        push    dx
        xor     dx, dx
        mov     ax, 1b9h
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        mov     bx, word ptr [bp + 0ch]
        mov     cx, word ptr [bp + 0ah]
        sub     cx, word ptr [bp - 4]
        sbb     bx, word ptr [bp - 2]
        sub     cx, ax
        sbb     bx, dx
        mov     word ptr [W_EFEA], bx
        mov     word ptr [W_EFE8], cx
        mov     ax, word ptr [W_EFEA]
        mov     dx, word ptr [W_EFE8]
        cmp     ax, word ptr [bp - 6]
        jg      br_c3c97
        jl      br_c3c89
        cmp     dx, word ptr [bp - 8]
        jnc     br_c3c97
br_c3c89:
        mov     ax, word ptr [bp - 0ah]
        mov     dx, word ptr [bp - 0ch]
        add     word ptr [W_EFE8], dx
        adc     word ptr [W_EFEA], ax
br_c3c97:
        pop     di
        pop     si
        leave
        retf
fn_c3c9b:
        push    bp
        mov     bp, sp
        sub     sp, 26h
        push    si
        push    di
        mov     byte ptr [B_CEBF], 0
        callf   SEG_D9CB:far_d9e1a
        mov     byte ptr [B_F008], 0ffh
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ss
        lea     ax, [bp - 1]
        push    ax
        callf   SEG_B1AA:far_b1b2b
        add     sp, 8
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_547E
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    cs
        call    fn_c3a13
        push    ss
        pop     es
        lea     di, [bp - 26h]
        mov     ax, 20h
        mov     ah, al
        mov     cx, 12h
        rep stosw
        mov     byte ptr [bp - 4], 0
        cmp     byte ptr [B_F221], 20h
        jle     br_c3d04
        mov     byte ptr [bp - 5], 21h
        mov     byte ptr [bp - 6], 50h
        jmp     br_c3d13
br_c3d04:
        mov     al, byte ptr [B_F221]
        cbw
        lea     dx, [bp - 26h]
        add     ax, dx
        mov     bx, ax
        mov     byte ptr ss:[bx], 50h
br_c3d13:
        push    6
        cmp     byte ptr [B_83BA], 1
        jnz     br_c3d21
        mov     ax, 5
        jmp     br_c3d24
br_c3d21:
        mov     ax, 4
br_c3d24:
        push    ax
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ss
        lea     ax, [bp - 26h]
        push    ax
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        cmp     byte ptr [B_537B], 0
        jz      br_c3d8d
        push    ss
        pop     es
        lea     di, [bp - 26h]
        mov     ax, 20h
        mov     ah, al
        mov     cx, 12h
        rep stosw
        mov     byte ptr [bp - 4], 0
        cmp     byte ptr [B_F21C], 20h
        jle     br_c3d65
        mov     byte ptr [bp - 5], 21h
        mov     byte ptr [bp - 6], 50h
        jmp     br_c3d74
br_c3d65:
        mov     al, byte ptr [B_F21C]
        cbw
        lea     dx, [bp - 26h]
        add     ax, dx
        mov     bx, ax
        mov     byte ptr ss:[bx], 50h
br_c3d74:
        push    6
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ss
        lea     ax, [bp - 26h]
        push    ax
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_c3d8d:
        callf   SEG_B1AA:far_b1af9
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_54A7
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_54F8
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_CDCC:far_cdcc2
        jmp     near br_c3e54
br_c3dca:
        push    3
        callf   SEG_EBCC:far_ebda4
        add     sp, 2
        mov     si, ax
        cmp     ax, 78h
        jz      br_c3de7
        cmp     ax, 79h
        jz      br_c3e08
        cmp     ax, 7ah
        jz      br_c3e25
        jmp     br_c3e4f
br_c3de7:
        callf   SEG_CB8A:far_cc60f
        or      ax, ax
        jz      br_c3df7
        callf   SEG_CB8A:far_cc62d
        jmp     br_c3e04
br_c3df7:
        mov     al, byte ptr [B_5379]
        cbw
        push    ax
        callf   SEG_CB8A:far_cc583
        add     sp, 2
br_c3e04:
        xor     si, si
        jmp     br_c3e54
br_c3e08:
        callf   SEG_CC84:far_cd0a9
        mov     al, byte ptr [B_5379]
        cbw
        push    ax
        nop
        push    cs
        call    fn_c4439
        add     sp, 2
        mov     si, ax
        mov     byte ptr [B_537C], 4
        pop     di
        pop     si
        leave
        retf
br_c3e25:
        mov     byte ptr [B_537C], 0
        nop
        push    cs
        call    fn_c4174
        cli
        mov     dx, 0c001h
        mov     al, 2
        out     dx, al
        mov     dx, 0c002h
        in      ax, dx
        and     ax, 0fffeh
        mov     word ptr [W_537D], ax
        mov     ax, 2400h
        sub     ax, word ptr [W_537D]
        mov     word ptr [W_537D], ax
        sti
        xor     si, si
        jmp     br_c3e54
br_c3e4f:
        mov     byte ptr [B_537C], 0
br_c3e54:
        cmp     byte ptr [B_537C], 3
        jnz     br_c3e5e
        jmp     near br_c3dca
br_c3e5e:
        or      si, si
        jnz     br_c3ecb
        mov     byte ptr [B_CEBF], 0
        nop
        push    cs
        call    fn_c3ed1
        callf   SEG_CDCC:far_cdcc2
        mov     al, byte ptr [B_83BB]
        cbw
        push    ax
        mov     al, byte ptr [B_83BA]
        cbw
        push    ax
        mov     al, byte ptr [B_83B9]
        cbw
        push    ax
        nop
        push    cs
        call    fn_c4643
        add     sp, 6
        callf   SEG_B1AA:far_b1aff
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_5403
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    3
        callf   SEG_B1AA:far_b1ab2
        add     sp, 2
        mov     al, byte ptr [bp - 2]
        cbw
        push    ax
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        nop
        push    cs
        call    far_c41b2
        mov     byte ptr [B_CEBF], 1
br_c3ecb:
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
fn_c3ed1:
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
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_5521
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_554A
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_5573
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     al, byte ptr [bp - 2]
        cbw
        push    ax
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        nop
        push    cs
        call    fn_c4174
        leave
        retf
fn_c3f4a:
        jmp     br_c3fad
loop_c3f4c:
        cmp     byte ptr [B_D4BE], 50h
        jnz     br_c3f5d
        nop
        push    cs
        call    far_c41b2
        mov     byte ptr [B_D4BE], 0
br_c3f5d:
        callf   SEG_D7B2:far_d7b2c
        or      ax, ax
        jz      br_c3fad
        callf   SEG_D79E:far_d79ee
        cmp     ax, 75h
        jnz     br_c3fad
        mov     al, byte ptr [B_83B9]
        mov     byte ptr [B_537A], al
        mov     al, byte ptr [B_83BB]
        cbw
        push    ax
        mov     al, byte ptr [B_83BA]
        cbw
        push    ax
        mov     al, byte ptr [B_83B9]
        cbw
        push    ax
        nop
        push    cs
        call    fn_c4643
        add     sp, 6
        mov     byte ptr [B_537C], 0
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_5403
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        xor     ax, ax
        retf
br_c3fad:
        cmp     byte ptr [B_537C], 3
        jnz     loop_c3f4c
        push    cs
        call    fn_c3c9b
        retf
fn_c3fb9:
        push    bp
        mov     bp, sp
        sub     sp, 2
        mov     ax, word ptr [bp + 6]
        mov     bx, 3c4h
        cwd
        idiv    bx
        mov     cx, ax
        les     bx, dword ptr [bp + 8]
        mov     al, byte ptr es:[bx + 2]
        cbw
        cmp     ax, cx
        jge     br_c3fda
        mov     byte ptr es:[bx + 2], cl
br_c3fda:
        les     bx, dword ptr [bp + 8]
        cmp     byte ptr es:[bx + 2], 21h
        jle     br_c3fe9
        mov     byte ptr es:[bx + 2], 21h
br_c3fe9:
        cmp     cx, 20h
        jle     br_c3ff1
        mov     cx, 20h
br_c3ff1:
        les     bx, dword ptr [bp + 8]
        mov     al, byte ptr es:[bx + 1]
        cbw
        cmp     ax, cx
        jle     br_c400a
        mov     ax, word ptr es:[bx + 3]
        inc     word ptr es:[bx + 3]
        cmp     ax, 28h
        jl      br_c4017
br_c400a:
        les     bx, dword ptr [bp + 8]
        mov     byte ptr es:[bx + 1], cl
        mov     word ptr es:[bx + 3], 0
br_c4017:
        les     bx, dword ptr [bp + 8]
        mov     al, byte ptr es:[bx + 1]
        cbw
        mov     word ptr [bp - 2], ax
        imul    word ptr es:[bx + 3]
        mov     bx, 28h
        cwd
        idiv    bx
        mov     bx, word ptr [bp - 2]
        sub     bx, ax
        cmp     cx, bx
        jge     br_c4037
        mov     cx, bx
br_c4037:
        les     bx, dword ptr [bp + 8]
        mov     byte ptr es:[bx], cl
        leave
        retf
fn_c403f:
        push    bp
        mov     bp, sp
        sub     sp, 26h
        push    di
        push    ss
        pop     es
        lea     di, [bp - 26h]
        mov     ax, 20h
        mov     ah, al
        mov     cx, 11h
        rep stosw
        mov     byte ptr [bp - 4], 0
        les     bx, dword ptr [bp + 0ah]
        mov     al, byte ptr es:[bx]
        cbw
        push    ss
        pop     es
        lea     di, [bp - 26h]
        push    ax
        mov     ax, 3eh
        mov     ah, al
        pop     cx
        shr     cx, 1
        rep stosw
        adc     cx, cx
        rep stosb
        mov     es, word ptr [bp + 0ch]
        mov     al, byte ptr es:[bx + 1]
        cbw
        lea     dx, [bp - 26h]
        add     ax, dx
        mov     bx, ax
        mov     byte ptr ss:[bx], 3eh
        mov     bx, word ptr [bp + 0ah]
        cmp     byte ptr es:[bx + 1], 0
        jz      br_c40a1
        mov     al, byte ptr es:[bx + 1]
        cbw
        lea     dx, [bp - 27h]
        add     ax, dx
        mov     bx, ax
        mov     byte ptr ss:[bx], 3eh
br_c40a1:
        les     bx, dword ptr [bp + 0ah]
        cmp     byte ptr es:[bx + 2], 20h
        jle     br_c40b5
        mov     byte ptr [bp - 5], 21h
        mov     byte ptr [bp - 6], 50h
        jmp     br_c40c8
br_c40b5:
        les     bx, dword ptr [bp + 0ah]
        mov     al, byte ptr es:[bx + 2]
        cbw
        lea     dx, [bp - 26h]
        add     ax, dx
        mov     bx, ax
        mov     byte ptr ss:[bx], 50h
br_c40c8:
        mov     al, byte ptr [B_83BC]
        cbw
        shl     ax, 5
        mov     bx, 64h
        cwd
        idiv    bx
        lea     dx, [bp - 26h]
        add     ax, dx
        mov     bx, ax
        mov     byte ptr ss:[bx], 54h
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ss
        lea     ax, [bp - 1]
        push    ax
        callf   SEG_B1AA:far_b1b2b
        add     sp, 8
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ss
        lea     ax, [bp - 26h]
        push    ax
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     al, byte ptr [bp - 2]
        cbw
        push    ax
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        pop     di
        leave
        retf
fn_c4122:
        mov     al, byte ptr [B_83BA]
        cbw
        or      ax, ax
        jz      br_c4135
        cmp     ax, 1
        jz      br_c4145
        cmp     ax, 2
        jz      br_c4155
        retf
br_c4135:
        push    ds
        push    word B_F21F
        push    6
        push    4
        push    cs
        call    fn_c403f
        add     sp, 8
        retf
br_c4145:
        push    ds
        push    word B_F21F
        push    6
        push    5
        push    cs
        call    fn_c403f
        add     sp, 8
        retf
br_c4155:
        push    ds
        push    word B_F21F
        push    6
        push    4
        push    cs
        call    fn_c403f
        add     sp, 8
        push    ds
        push    word B_F21A
        push    6
        push    5
        push    cs
        call    fn_c403f
        add     sp, 8
        retf
fn_c4174:
        push    di
        push    ds
        pop     es
        mov     di, B_F21F
        xor     ax, ax
        mov     ah, al
        mov     cx, 2
        rep stosw
        stosb
        mov     di, B_F21A
        mov     ah, al
        mov     cx, 2
        rep stosw
        stosb
        push    cs
        call    fn_c4122
        pop     di
        retf
fn_c4195:
        mov     al, byte ptr [B_F21F]
        mov     byte ptr [B_F220], al
        mov     al, byte ptr [B_F21F]
        mov     byte ptr [B_F221], al
        mov     al, byte ptr [B_F21A]
        mov     byte ptr [B_F21B], al
        mov     al, byte ptr [B_F21A]
        mov     byte ptr [B_F21C], al
        push    cs
        call    fn_c4122
        retf
far_c41b2:
        push    bp
        mov     bp, sp
        sub     sp, 0eh
        push    si
        push    di
        mov     word ptr [bp - 2], SEG_A28F
        mov     word ptr [bp - 4], 0
        cmp     byte ptr [B_537B], 0
        jz      br_c41d0
        mov     ax, 2
        jmp     br_c41d3
br_c41d0:
        mov     ax, 1
br_c41d3:
        mov     word ptr [bp - 0eh], ax
        cmp     byte ptr [B_537A], 0
        jnz     br_c41e0
        jmp     near br_c4272
br_c41e0:
        cmp     byte ptr [B_537A], 1
        jg      br_c41f2
        mov     dx, 84h
        in      al, dx
        test    al, 40h
        jnz     br_c41f2
        jmp     near br_c4272
br_c41f2:
        mov     al, byte ptr [B_537A]
        cbw
        cmp     ax, 1
        jz      br_c4207
        cmp     ax, 19h
        jz      br_c421e
        cmp     ax, 1ch
        jz      br_c4231
        jmp     br_c426a
br_c4207:
        push    0
        mov     al, byte ptr [B_83BA]
        cbw
        push    ax
        push    0
        nop
        push    cs
        call    fn_c4643
        add     sp, 6
        push    cs
        call    fn_c4174
        jmp     br_c426a
br_c421e:
        push    0
        mov     al, byte ptr [B_83BA]
        cbw
        push    ax
        push    1
        nop
        push    cs
        call    fn_c4643
        add     sp, 6
        jmp     br_c426a
br_c4231:
        mov     dx, 84h
        in      al, dx
        test    al, 40h
        jz      br_c4251
        push    0
        mov     al, byte ptr [B_83BA]
        cbw
        push    ax
        push    0
        nop
        push    cs
        call    fn_c4643
        add     sp, 6
        mov     byte ptr [B_537A], 1
        jmp     br_c426a
br_c4251:
        mov     al, byte ptr [B_83BB]
        cbw
        push    ax
        mov     al, byte ptr [B_83BA]
        cbw
        push    ax
        push    1
        nop
        push    cs
        call    fn_c4643
        add     sp, 6
        mov     byte ptr [B_537A], 0
br_c426a:
        inc     byte ptr [B_537A]
        pop     di
        pop     si
        leave
        retf
br_c4272:
        cmp     byte ptr [B_537C], 2
        jnz     br_c4290
        mov     ax, word ptr [W_83BE]
        mov     dx, 0ah
        imul    dx
        cmp     ax, word ptr [W_D4B2]
        jg      br_c4290
        mov     byte ptr [B_537C], 3
        pop     di
        pop     si
        leave
        retf
br_c4290:
        cli
        mov     dx, 0c001h
        mov     al, 2
        out     dx, al
        mov     dx, 0c002h
        in      ax, dx
        and     ax, 0fffeh
        mov     di, ax
        mov     ax, 2400h
        sub     ax, di
        mov     di, ax
        sti
        callf   SEG_D9CB:far_d9e5b
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        mov     word ptr [bp - 0ah], 0
        mov     si, word ptr [W_537D]
        jmp     br_c430e
loop_c42be:
        cmp     si, 2400h
        jc      br_c42c6
        xor     si, si
br_c42c6:
        mov     ax, si
        shl     ax, 1
        les     bx, dword ptr [bp - 4]
        add     bx, ax
        mov     ax, word ptr es:[bx]
        cwd
        xor     ax, dx
        sub     ax, dx
        cmp     ax, word ptr [bp - 0ah]
        jle     br_c430b
        mov     ax, word ptr es:[bx]
        cwd
        xor     ax, dx
        sub     ax, dx
        mov     word ptr [bp - 0ah], ax
        cmp     byte ptr [B_537C], 1
        jnz     br_c430b
        mov     al, byte ptr [B_83BC]
        cbw
        mov     dx, 147h
        imul    dx
        cmp     ax, word ptr [bp - 0ah]
        jg      br_c430b
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        push    di
        push    si
        push    cs
        call    fn_c3b74
        add     sp, 8
br_c430b:
        add     si, word ptr [bp - 0eh]
br_c430e:
        cmp     si, di
        jnz     loop_c42be
        cmp     byte ptr [B_537B], 0
        jz      br_c437f
        mov     word ptr [bp - 0ch], 0
        mov     si, word ptr [W_537D]
        inc     si
        jmp     br_c4376
loop_c4325:
        cmp     si, 2400h
        jc      br_c432e
        mov     si, 1
br_c432e:
        mov     ax, si
        shl     ax, 1
        les     bx, dword ptr [bp - 4]
        add     bx, ax
        mov     ax, word ptr es:[bx]
        cwd
        xor     ax, dx
        sub     ax, dx
        cmp     ax, word ptr [bp - 0ch]
        jle     br_c4373
        mov     ax, word ptr es:[bx]
        cwd
        xor     ax, dx
        sub     ax, dx
        mov     word ptr [bp - 0ch], ax
        cmp     byte ptr [B_537C], 1
        jnz     br_c4373
        mov     al, byte ptr [B_83BC]
        cbw
        mov     dx, 147h
        imul    dx
        cmp     ax, word ptr [bp - 0ch]
        jg      br_c4373
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        push    cx
        push    si
        push    cs
        call    fn_c3b74
        add     sp, 8
br_c4373:
        add     si, word ptr [bp - 0eh]
br_c4376:
        mov     ax, di
        inc     ax
        mov     cx, ax
        cmp     ax, si
        jnz     loop_c4325
br_c437f:
        mov     word ptr [W_537D], di
        mov     al, byte ptr [B_D4BB]
        cbw
        or      ax, ax
        jz      br_c438e
        jmp     near br_c4435
br_c438e:
        push    ds
        push    word B_F21F
        push    word ptr [bp - 0ah]
        push    cs
        call    fn_c3fb9
        add     sp, 6
        mov     si, B_F21F
        push    ds
        pop     es
        mov     di, A_EFDC
        mov     cx, 3
        repe cmpsb
        mov     al, byte ptr [si - 1]
        xor     ah, ah
        mov     cl, byte ptr es:[di - 1]
        xor     ch, ch
        sub     ax, cx
        or      ax, ax
        jz      br_c43e5
        push    ds
        push    word B_F21F
        push    6
        cmp     byte ptr [B_83BA], 1
        jnz     br_c43cc
        mov     ax, 5
        jmp     br_c43cf
br_c43cc:
        mov     ax, 4
br_c43cf:
        push    ax
        push    cs
        call    fn_c403f
        add     sp, 8
        push    ds
        pop     es
        mov     di, A_EFDC
        mov     si, B_F21F
        mov     cx, 2
        rep movsw
        movsb
br_c43e5:
        cmp     byte ptr [B_537B], 0
        jz      br_c4435
        push    ds
        push    word B_F21A
        push    word ptr [bp - 0ch]
        push    cs
        call    fn_c3fb9
        add     sp, 6
        mov     si, B_F21A
        push    ds
        pop     es
        mov     di, A_EFE1
        mov     cx, 3
        repe cmpsb
        mov     al, byte ptr [si - 1]
        xor     ah, ah
        mov     cl, byte ptr es:[di - 1]
        xor     ch, ch
        sub     ax, cx
        or      ax, ax
        jz      br_c4435
        push    ds
        push    word B_F21A
        push    6
        push    5
        push    cs
        call    fn_c403f
        add     sp, 8
        push    ds
        pop     es
        mov     di, A_EFE1
        mov     si, B_F21A
        mov     cx, 2
        rep movsw
        movsb
br_c4435:
        pop     di
        pop     si
        leave
        retf
fn_c4439:
        push    bp
        mov     bp, sp
        sub     sp, 12h
        push    si
        push    di
        mov     byte ptr [B_D5DD], 33h
        push    ss
        pop     es
        lea     di, [bp - 12h]
        push    es
        mov     es, word ptr [W_F002]
        push    di
        mov     di, word ptr [W_F000]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, word ptr [W_F002]
        mov     si, word ptr [W_F000]
        pop     di
        pop     es
        push    ds
        mov     ds, ax
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
br_c4475:
        callf   SEG_B1AA:far_b1aac
        push    ds
        push    word STR_559C
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    10h
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        push    ds
        push    word STR_55AB
        callf   SEG_B347:far_b3471
        add     sp, 0ah
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word P_55BF
        elseif  FW_VERSION = 311
        push    word P_55BF
        else
        push    word P_55BF
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_565E
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
loop_c44da:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_c44da
        cmp     dx, 78h
        jz      br_c44f2
        jmp     near br_c4587
br_c44f2:
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        callf   SEG_CC84:far_cd551
        add     sp, 4
        cmp     ax, 0fffch
        jz      br_c4552
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        callf   SEG_CC84:far_cd551
        add     sp, 4
        cmp     ax, word ptr [bp + 6]
        jz      br_c4552
        push    1
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        push    ss
        pop     es
        lea     di, [bp - 12h]
        push    es
        mov     es, word ptr [W_F002]
        push    di
        mov     di, word ptr [W_F000]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, word ptr [W_F002]
        mov     si, word ptr [W_F000]
        pop     di
        pop     es
        push    ds
        mov     ds, ax
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        jmp     br_c4475
br_c4552:
        push    ss
        pop     es
        lea     di, [bp - 12h]
        mov     ax, word ptr [W_F002]
        mov     si, word ptr [W_F000]
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
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     dx, ax
br_c4587:
        mov     ax, dx
        pop     di
        pop     si
        leave
        retf
far_c458d:
        push    bp
        mov     bp, sp
        push    si
        xor     si, si
loop_c4593:
        cmp     word ptr [W_83C0], 3e7h
        jle     br_c45a1
        mov     word ptr [W_83C0], 0
br_c45a1:
        push    word ptr [W_83C0]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    fn_c45d3
        add     sp, 6
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_CC84:far_cd551
        add     sp, 4
        or      ax, ax
        jl      br_c45d0
        inc     word ptr [W_83C0]
        inc     si
        cmp     si, 80h
        jl      loop_c4593
br_c45d0:
        pop     si
        pop     bp
        retf
fn_c45d3:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        push    di
        if      FW_VERSION >= 312
        les     di, dword ptr [bp + 6]
        mov     si, 5665h
        elseif  FW_VERSION = 311
        les     di, dword ptr [bp + 6]
        mov     si, 55bbh
        else
        push    ds
        pop     es
        mov     di, A_F00B
        mov     si, 504dh
        endif
        mov     cx, 3
        rep movsw
        push    30h
        push    3
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    word ptr [bp + 0ah]
        callf   SEG_D780:far_d7805
        add     sp, 0ah
        push    ss
        pop     es
        lea     di, [bp - 4]
        mov     ax, word ptr [bp + 8]
        mov     si, word ptr [bp + 6]
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
        push    cx
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        dec     di
        pop     cx
        rep movsb
        pop     ds
        les     di, dword ptr [bp + 6]
        if      FW_VERSION >= 312
        mov     si, 5423h
        elseif  FW_VERSION = 311
        mov     si, 5379h
        else
        mov     si, 4e0bh
        endif
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        dec     di
        mov     cx, 9
        rep movsb
        pop     di
        pop     si
        leave
        retf
fn_c4643:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [B_F008]
        cbw
        cmp     ax, word ptr [bp + 6]
        jnz     br_c4661
        mov     al, byte ptr [B_F009]
        cbw
        cmp     ax, word ptr [bp + 8]
        jnz     br_c4661
        mov     al, byte ptr [B_F00A]
        cbw
        cmp     ax, word ptr [bp + 0ah]
        jz      br_c46a7
br_c4661:
        mov     al, byte ptr [bp + 6]
        mov     byte ptr [B_F008], al
        mov     al, byte ptr [bp + 8]
        mov     byte ptr [B_F009], al
        mov     al, byte ptr [bp + 0ah]
        mov     byte ptr [B_F00A], al
        nop
        push    cs
        call    far_c46ab
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_D9CB:far_da102
        add     sp, 4
        push    word ptr [bp + 8]
        callf   SEG_D9CB:far_d9fe6
        add     sp, 2
        cmp     word ptr [bp + 0ah], 0
        jz      br_c46a2
        push    word ptr [bp + 8]
        callf   SEG_D9CB:far_d9cb4
        add     sp, 2
br_c46a2:
        mov     ax, 1
        pop     bp
        retf
br_c46a7:
        xor     ax, ax
        pop     bp
        retf
far_c46ab:
        push    si
        xor     si, si
loop_c46ae:
        push    si
        callf   SEG_CDB9:far_cdc78
        add     sp, 2
        inc     si
        cmp     si, 20h
        jl      loop_c46ae
        pop     si
        retf
        if      FW_VERSION >= 312
        phase   0fh
        elseif  FW_VERSION = 311
        phase   0bh
        else
        phase   0
        endif
far_c46bf:
        push    ds
        push    word STR_58D4
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    64h
        push    0
        push    3
        push    ds
        push    word B_826A
        push    ds
        push    word STR_58DE
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0ch
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    3
        push    ds
        push    word P_0020+4
        push    ds
        push    word B_826B
        push    ds
        push    word STR_58E6
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    19h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    7
        push    ds
        if      FW_VERSION >= 312
        push    word P_566B+1
        elseif  FW_VERSION = 311
        push    word P_55C1_V311+1
        else
        push    word P_5053_V308+1
        endif
        push    ds
        push    word B_8187
        push    ds
        push    word STR_58EF
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    ds
        if      FW_VERSION >= 312
        push    word P_56EB+9
        elseif  FW_VERSION = 311
        push    word P_5641_V311+9
        else
        push    word P_50D3_V308+9
        endif
        push    ds
        push    word B_8186
        push    ds
        push    word STR_58F7
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    19h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0ah
        push    ds
        if      FW_VERSION >= 312
        push    word P_568B+9
        elseif  FW_VERSION = 311
        push    word P_55E1_V311+9
        else
        push    word P_5073_V308+9
        endif
        push    ds
        push    word B_826C
        push    ds
        push    word STR_5901
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_5907
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0dh
        push    ds
        push    word A_56B8
        push    ds
        push    word B_826D
        push    ds
        push    word STR_5923
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0dh
        push    ds
        push    word A_56B8
        push    ds
        push    word B_826E
        push    ds
        push    word STR_592A
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        callf   SEG_E2CE:far_e2d6e
        push    ax
        push    ds
        push    word STR_5932
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
        callf   SEG_B702:far_b90dd
        push    ds
        if      FW_VERSION >= 312
        push    word STR_5945
        elseif  FW_VERSION = 311
        push    word STR_5945
        else
        push    word STR_532D_V308
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        xor     dx, dx
        if      FW_VERSION >= 311
        jmp     near tgt_c4892
        else
        jmp     tgt_c4892
        endif
loop_c47f5:
        mov     al, byte ptr [B_7B8D]
        cbw
        cmp     ax, 4
        jz      br_c4800
        jmp     br_c480e
br_c4800:
        mov     al, byte ptr [B_826C]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_0F77]
        cbw
        mov     word ptr [W_881C], ax
br_c480e:
        push    4
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_c47f5
        mov     bx, dx
        sub     bx, 75h
        cmp     bx, 5
        ja      tgt_c4892
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c489c]
tgt_c482f:
        callf   SEG_E6FE:far_e7069
        cmp     byte ptr [B_9562], 0
        jz      br_c484d
        push    0ffd8h
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     dx, ax
        jmp     tgt_c4892
br_c484d:
        nop
        push    cs
        call    fn_c48a8
        mov     dx, ax
        jmp     tgt_c4892
tgt_c4856:
        callf   SEG_C689:far_c6894
        mov     dx, ax
        jmp     tgt_c4892
tgt_c485f:
        if      FW_VERSION >= 312
        callf   SEG_B000:far_b0002
        push    ds
        push    word STR_5965
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
loop_c4870:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_c4870
        cmp     dx, 78h
        jnz     tgt_c4892
        mov     dx, 4fh
        elseif  FW_VERSION = 311
        callf   SEG_B000:far_b0002
        push    ds
        push    word STR_5965
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
loop_c4870:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_c4870
        cmp     dx, 78h
        jnz     tgt_c4892
        mov     dx, 4fh
        else
        xor     dx, dx
        endif
        jmp     tgt_c4892
tgt_c488a:
        callf   SEG_B4FC:far_b4fc0
        cbw
        mov     dx, ax
tgt_c4892:
        or      dx, dx
        if      FW_VERSION >= 311
        jnz     br_c4899
        jmp     near br_c480e
br_c4899:
        else
        jz      br_c480e
        endif
        mov     ax, dx
        retf
TBL_c489c:
        dw      tgt_c488a
        dw      tgt_c4892
        dw      tgt_c4892
        dw      tgt_c482f
        dw      tgt_c4856
        dw      tgt_c485f
fn_c48a8:
        push    bp
        mov     bp, sp
        sub     sp, 2
        mov     byte ptr [bp - 1], 0
        mov     byte ptr [B_D5DD], 1
        push    ds
        push    word STR_596C
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    1ch
        push    ds
        if      FW_VERSION >= 312
        push    word P_56FB+5
        elseif  FW_VERSION = 311
        push    word P_5651_V311+5
        else
        push    word P_50E3_V308+5
        endif
        push    ss
        lea     ax, [bp - 1]
        push    ax
        push    ds
        push    word STR_598B
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        callf   SEG_B702:far_b9102
loop_c48df:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dl, al
        or      al, al
        jz      loop_c48df
        cmp     dl, 78h
        jnz     br_c494f
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        mov     al, byte ptr [bp - 1]
        cbw
        mov     bx, ax
        cmp     bx, 4
        ja      br_c4933
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c4954]
tgt_c4912:
        callf   SEG_B20F:far_b20fd
        jmp     br_c4933
tgt_c4919:
        callf   SEG_B20F:far_b2121
        jmp     br_c4933
tgt_c4920:
        callf   SEG_B20F:far_b2134
        jmp     br_c4933
tgt_c4927:
        callf   SEG_B20F:far_b2190
        jmp     br_c4933
tgt_c492e:
        callf   SEG_B20F:far_b21f5
br_c4933:
        callf   SEG_BA17:far_ba2a4
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        mov     dl, byte ptr [B_D4C2]
br_c494f:
        mov     al, dl
        cbw
        leave
        retf
TBL_c4954:
        dw      tgt_c4912
        dw      tgt_c4919
        dw      tgt_c4920
        dw      tgt_c4927
        dw      tgt_c492e
        if      FW_VERSION >= 312
        phase   0eh
        elseif  FW_VERSION = 311
        phase   0ah
        else
        phase   4
        endif
far_c495e:
        push    bp
        mov     bp, sp
        sub     sp, 2
        if      FW_VERSION < 311
        callf   SEG_B1AA:far_b1aac
        endif
        mov     byte ptr [B_D5DD], 0
        push    ds
        push    word STR_5A01
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word STR_5A1E
        elseif  FW_VERSION = 311
        push    word STR_5A1E
        else
        push    word STR_53F6_V308
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        if      FW_VERSION >= 311
        push    9
        else
        push    8
        endif
        push    ss
        lea     ax, [bp - 1]
        push    ax
        callf   SEG_EBCC:far_ebcce
        add     sp, 8
        mov     dl, al
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 1]
        mov     byte ptr [B_D5DD], al
        endif
        or      dl, dl
        jz      br_c49be
        jmp     near br_c4a50
br_c49be:
        if      FW_VERSION < 311
        mov     al, byte ptr [bp - 1]
        mov     byte ptr [B_D5DD], al
        endif
        cbw
        dec     ax
        mov     bx, ax
        if      FW_VERSION >= 311
        cmp     bx, 8
        jbe     br_c49ca
        jmp     near br_c4a50
br_c49ca:
        else
        cmp     bx, 7
        ja      br_c4a50
        endif
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c4a55]
tgt_c49d1:
        nop
        push    cs
        call    fn_c4a67
        mov     dl, al
        jmp     br_c4a50
tgt_c49da:
        nop
        push    cs
        call    fn_c5334
        mov     dl, al
        jmp     br_c4a50
tgt_c49e3:
        nop
        push    cs
        call    fn_c5852
        mov     dl, al
        jmp     br_c4a50
tgt_c49ec:
        nop
        push    cs
        call    fn_c5c76
        mov     dl, al
        jmp     br_c4a50
tgt_c49f5:
        callf   SEG_E6FE:far_e7069
        cmp     byte ptr [B_9562], 0
        jz      br_c4a11
        push    0ffd8h
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     dl, byte ptr [B_D5DE]
        jmp     br_c4a50
br_c4a11:
        callf   SEG_C2E5:far_c2e5b
        mov     dl, al
        jmp     br_c4a50
tgt_c4a1a:
        callf   SEG_E6FE:far_e7069
        if      FW_VERSION >= 311
        callf   0fba0h:far_fba0a
        else
        callf   0bfd8h:far_fba0a
        endif
        mov     dl, al
        jmp     br_c4a50
tgt_c4a28:
        if      FW_VERSION >= 311
        callf   SEG_E6FE:far_e7069
        callf   0fba0h:far_fe009
        mov     dl, al
        jmp     br_c4a50
tgt_c4a36:
        callf   SEG_E6FE:far_e7069
        callf   0fba0h:far_fea0d
        else
        callf   0bfd8h:L_c280b
        endif
        mov     dl, al
        jmp     br_c4a50
tgt_c4a44:
        callf   SEG_E6FE:far_e7069
        callf   SEG_F07E:far_f07e8
        mov     dl, al
br_c4a50:
        mov     al, dl
        cbw
        leave
        retf
TBL_c4a55:
        dw      tgt_c49d1
        dw      tgt_c49da
        dw      tgt_c49e3
        dw      tgt_c49ec
        dw      tgt_c49f5
        dw      tgt_c4a1a
        dw      tgt_c4a28
        if      FW_VERSION >= 311
        dw      tgt_c4a36
        endif
        dw      tgt_c4a44
fn_c4a67:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 2aah
        else
        sub     sp, 2a6h
        endif
        push    si
        push    di
        if      FW_VERSION < 311
        mov     byte ptr [B_D5DD], 1
        endif
        mov     word ptr [bp - 2], 0
        mov     al, byte ptr [B_D4C0]
        mov     byte ptr [bp - 6], al
        push    ds
        push    word STR_5AE7
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_5AF6
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_5B06
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    1dh
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_5B1E
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_5B2A
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    1dh
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_5B31
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_5B37
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     word ptr [bp - 4], 1
        jmp     br_c5268
br_c4b24:
        callf   SEG_B05A:far_b05a7
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        mov     dx, word ptr [W_E40E]
        mov     bx, word ptr [FP_E40C]
        add     bx, ax
        add     bx, 0fcf6h
        mov     word ptr [bp - 0eh], dx
        mov     word ptr [bp - 10h], bx
        endif
        push    0fh
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_E421]
        inc     al
        mov     byte ptr [bp - 5], al
        push    8
        push    18h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 5]
        push    ax
        push    ds
        push    word A_59CE
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    ss
        pop     es
        if      FW_VERSION >= 311
        lea     di, [bp - 22h]
        else
        lea     di, [bp - 1eh]
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
        lea     ax, [bp - 22h]
        else
        lea     ax, [bp - 1eh]
        endif
        push    ax
        push    ds
        push    word A_5B3E
        callf   SEG_B347:far_b3471
        add     sp, 0ah
        push    17h
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    18h
        push    62h
        push    23h
        push    2
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word A_59CE
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    19h
        push    2
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        push    ax
        callf   SEG_B702:far_b8ff3
        add     sp, 6
        push    6
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    1
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 2aah]
        else
        lea     ax, [bp - 2a6h]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 0a2h]
        else
        lea     ax, [bp - 9eh]
        endif
        push    ax
        if      FW_VERSION >= 311
        callf   0fba0h:far_fdcfb
        else
        callf   0bfd8h:far_fdcfb
        endif
        add     sp, 0ah
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 0a2h]
        else
        lea     ax, [bp - 9eh]
        endif
        push    ax
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        push    ax
        nop
        push    cs
        call    far_c529a
        add     sp, 6
        mov     byte ptr [bp - 7], al
        push    10h
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 2aah]
        else
        lea     ax, [bp - 2a6h]
        endif
        push    ax
        push    ss
        lea     ax, [bp - 7]
        push    ax
        push    ds
        push    word A_59CE
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    17h
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     byte ptr [bp - 7], 0
        jz      br_c4c84
        mov     al, byte ptr [bp - 7]
        mov     ah, 0
        if      FW_VERSION >= 311
        lea     dx, [bp - 0a3h]
        else
        lea     dx, [bp - 9fh]
        endif
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
        jz      br_c4c84
        push    ds
        push    word A_5B40
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_c4c90
br_c4c84:
        push    ds
        push    word A_5B45
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_c4c90:
        push    22h
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 309h]
        mov     byte ptr [bp - 8], al
        push    6
        push    ds
        if      FW_VERSION >= 312
        push    word P_5997+1
        elseif  FW_VERSION = 311
        push    word P_58ED_V311+1
        else
        push    word P_536F_V308+1
        endif
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    ds
        push    word A_59CE
        callf   SEG_B347:far_b362e
        add     sp, 0eh
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
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 10h]
        mov     al, byte ptr es:[bx + 2]
        mov     byte ptr [bp - 9], al
        mov     al, byte ptr es:[bx + 3]
        mov     byte ptr [bp - 0ah], al
        mov     al, byte ptr es:[bx + 4]
        mov     byte ptr [bp - 0bh], al
        mov     al, byte ptr es:[bx + 5]
        mov     byte ptr [bp - 0ch], al
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        endif
        mov     al, byte ptr [bp - 8]
        mov     ah, 0
        mov     bx, ax
        cmp     bx, 3
        jbe     br_c4d31
        jmp     br_c4f8d
br_c4d31:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c5292]
tgt_c4d38:
        if      FW_VERSION < 311
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        endif
        push    ds
        push    word STR_5B4A
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        shl     ax, 2
        mov     bx, ax
        push    word ptr [bx + 3feh]
        push    word ptr [bx + 3fch]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_c4f8d
tgt_c4d61:
        if      FW_VERSION < 311
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 307h]
        mov     byte ptr [bp - 0ah], al
        endif
        push    8
        push    62h
        push    22h
        push    2
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        push    ds
        push    word A_5B66
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    11h
        push    4
        mov     al, byte ptr [bp - 0ah]
        push    ax
        nop
        push    cs
        call    far_c530b
        add     sp, 6
        push    10h
        push    13h
        push    4
        mov     al, byte ptr [bp - 0ah]
        mov     ah, 0
        push    ax
        callf   SEG_B702:far_b9045
        add     sp, 8
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION < 311
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 305h]
        mov     byte ptr [bp - 0ch], al
        endif
        push    8
        push    62h
        push    22h
        push    2
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        push    ds
        push    word A_5B66
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    11h
        push    5
        mov     al, byte ptr [bp - 0ch]
        push    ax
        nop
        push    cs
        call    far_c530b
        add     sp, 6
        push    10h
        push    13h
        push    5
        mov     al, byte ptr [bp - 0ch]
        mov     ah, 0
        push    ax
        callf   SEG_B702:far_b9045
        add     sp, 8
        jmp     br_c4f8d
tgt_c4dea:
        if      FW_VERSION < 311
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 308h]
        mov     byte ptr [bp - 9], al
        endif
        push    8
        push    7eh
        push    0
        push    3
        push    ss
        lea     ax, [bp - 9]
        push    ax
        push    ds
        push    word A_5B78
        callf   SEG_B347:far_b3819
        add     sp, 10h
        if      FW_VERSION < 311
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 307h]
        mov     byte ptr [bp - 0ah], al
        endif
        push    8
        push    62h
        push    22h
        push    2
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        push    ds
        push    word A_5B81
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    11h
        push    4
        mov     al, byte ptr [bp - 0ah]
        push    ax
        nop
        push    cs
        call    far_c530b
        add     sp, 6
        push    10h
        push    13h
        push    4
        mov     al, byte ptr [bp - 0ah]
        mov     ah, 0
        push    ax
        callf   SEG_B702:far_b9045
        add     sp, 8
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION < 311
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 306h]
        mov     byte ptr [bp - 0bh], al
        endif
        push    8
        push    7fh
        push    1
        push    3
        push    ss
        lea     ax, [bp - 0bh]
        push    ax
        push    ds
        push    word A_5B78
        callf   SEG_B347:far_b3819
        add     sp, 10h
        if      FW_VERSION < 311
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 305h]
        mov     byte ptr [bp - 0ch], al
        endif
        push    8
        push    62h
        push    22h
        push    2
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        push    ds
        push    word A_5B81
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    11h
        push    5
        mov     al, byte ptr [bp - 0ch]
        push    ax
        nop
        push    cs
        call    far_c530b
        add     sp, 6
        push    10h
        push    13h
        push    5
        mov     al, byte ptr [bp - 0ch]
        mov     ah, 0
        push    ax
        callf   SEG_B702:far_b9045
        add     sp, 8
        jmp     br_c4f8d
tgt_c4ea5:
        if      FW_VERSION < 311
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     si, bx
        mov     al, byte ptr es:[bx - 308h]
        mov     byte ptr [bp - 9], al
        endif
        cmp     byte ptr [bp - 9], 63h
        jbe     br_c4eb7
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 10h]
        endif
        mov     al, 63h
        if      FW_VERSION >= 311
        mov     byte ptr es:[bx + 2], al
        else
        mov     byte ptr es:[si - 308h], al
        endif
        mov     byte ptr [bp - 9], al
br_c4eb7:
        push    word SEG_DA7E
        if      FW_VERSION >= 312
        push    word 0c5h
        elseif  FW_VERSION = 311
        push    word 0cbh
        else
        push    word 0cfh
        endif
        push    8
        push    63h
        push    0
        push    4
        push    ss
        lea     ax, [bp - 9]
        push    ax
        push    ds
        push    word A_5B78
        callf   SEG_B347:far_b3723
        add     sp, 14h
        if      FW_VERSION < 311
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 307h]
        mov     byte ptr [bp - 0ah], al
        endif
        push    8
        push    62h
        push    22h
        push    2
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        push    ds
        push    word A_5B88
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    11h
        push    4
        mov     al, byte ptr [bp - 0ah]
        push    ax
        nop
        push    cs
        call    far_c530b
        add     sp, 6
        push    10h
        push    13h
        push    4
        mov     al, byte ptr [bp - 0ah]
        mov     ah, 0
        push    ax
        callf   SEG_B702:far_b9045
        add     sp, 8
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION < 311
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     si, bx
        mov     al, byte ptr es:[bx - 306h]
        mov     byte ptr [bp - 0bh], al
        endif
        cmp     byte ptr [bp - 0bh], 64h
        jbe     br_c4f31
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 10h]
        endif
        mov     al, 64h
        if      FW_VERSION >= 311
        mov     byte ptr es:[bx + 4], al
        else
        mov     byte ptr es:[si - 306h], al
        endif
        mov     byte ptr [bp - 0bh], al
br_c4f31:
        push    word SEG_DA7E
        if      FW_VERSION >= 312
        push    word 0c5h
        elseif  FW_VERSION = 311
        push    word 0cbh
        else
        push    word 0cfh
        endif
        push    8
        push    64h
        push    1
        push    4
        push    ss
        lea     ax, [bp - 0bh]
        push    ax
        push    ds
        push    word A_5B78
        callf   SEG_B347:far_b3723
        add     sp, 14h
        if      FW_VERSION < 311
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 305h]
        mov     byte ptr [bp - 0ch], al
        endif
        push    8
        push    62h
        push    22h
        push    2
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        push    ds
        push    word A_5B88
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    11h
        push    5
        mov     al, byte ptr [bp - 0ch]
        push    ax
        nop
        push    cs
        call    far_c530b
        add     sp, 6
        push    10h
        push    13h
        push    5
        mov     al, byte ptr [bp - 0ch]
        mov     ah, 0
        push    ax
        callf   SEG_B702:far_b9045
        add     sp, 8
br_c4f8d:
        mov     word ptr [bp - 4], 0
        mov     word ptr [bp - 2], 0
        jmp     tgt_c5224
br_c4f9a:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     bx, ax
        cmp     bx, 8
        jbe     br_c4fa8
        jmp     tgt_c5224
br_c4fa8:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c5280]
tgt_c4faf:
        mov     al, byte ptr [bp - 5]
        mov     ah, 0
        dec     ax
        push    ax
        nop
        push    cs
        call    far_c6547
        add     sp, 2
        if      FW_VERSION >= 311
tgt_c4fbe:
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        mov     dx, word ptr [W_E40E]
        mov     bx, word ptr [FP_E40C]
        add     bx, ax
        add     bx, 0fcf6h
        mov     word ptr [bp - 0eh], dx
        mov     word ptr [bp - 10h], bx
        endif
        mov     word ptr [bp - 4], 1
        jmp     tgt_c5224
tgt_c4fe4:
        push    ss
        pop     es
        if      FW_VERSION >= 311
        lea     di, [bp - 22h]
        else
        lea     di, [bp - 1eh]
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
        jmp     tgt_c5224
        if      FW_VERSION < 311
tgt_c4fbe:
        mov     word ptr [bp - 4], 1
        jmp     tgt_c5224
        endif
tgt_c5016:
        cmp     byte ptr [bp - 7], 0
        jnz     br_c5025
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 10h]
        mov     byte ptr es:[bx], 0ffh
        else
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     byte ptr es:[bx - 30ah], 0ffh
        endif
        jmp     br_c503b
br_c5025:
        mov     al, byte ptr [bp - 7]
        mov     ah, 0
        if      FW_VERSION >= 311
        lea     dx, [bp - 0a3h]
        else
        lea     dx, [bp - 9fh]
        endif
        add     ax, dx
        mov     bx, ax
        if      FW_VERSION >= 311
        mov     dl, byte ptr ss:[bx]
        les     bx, dword ptr [bp - 10h]
        mov     byte ptr es:[bx], dl
        else
        mov     cl, byte ptr ss:[bx]
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     byte ptr es:[bx - 30ah], cl
        endif
br_c503b:
        push    17h
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     byte ptr [bp - 7], 0
        jz      br_c5081
        mov     al, byte ptr [bp - 7]
        mov     ah, 0
        if      FW_VERSION >= 311
        lea     dx, [bp - 0a3h]
        else
        lea     dx, [bp - 9fh]
        endif
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
        jz      br_c5081
        push    ds
        push    word A_5B40
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     tgt_c5224
br_c5081:
        push    ds
        push    word A_5B45
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     tgt_c5224
tgt_c5090:
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 10h]
        else
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        endif
        mov     al, byte ptr [bp - 8]
        if      FW_VERSION >= 311
        mov     byte ptr es:[bx + 1], al
        else
        mov     byte ptr es:[bx - 309h], al
        endif
        mov     word ptr [bp - 4], 1
        jmp     tgt_c5224
tgt_c50a2:
        mov     al, byte ptr [bp - 8]
        mov     ah, 0
        mov     bx, ax
        cmp     bx, 3
        jbe     br_c50b1
        jmp     tgt_c5224
br_c50b1:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c5278]
tgt_c50b8:
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 10h]
        else
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        endif
        mov     al, byte ptr [bp - 0ah]
        if      FW_VERSION >= 311
        mov     byte ptr es:[bx + 3], al
        else
        mov     byte ptr es:[bx - 307h], al
        endif
        push    11h
        push    4
        push    ax
        nop
        push    cs
        call    far_c530b
        add     sp, 6
        push    10h
        push    13h
        push    4
        mov     al, byte ptr [bp - 0ah]
        mov     ah, 0
        push    ax
        callf   SEG_B702:far_b9045
        add     sp, 8
        jmp     tgt_c5224
tgt_c50e6:
        cmp     byte ptr [bp - 9], 63h
        jbe     tgt_c5102
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 10h]
        mov     byte ptr es:[bx + 2], 63h
        else
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     byte ptr es:[bx - 308h], 63h
        endif
        mov     byte ptr [bp - 9], 63h
        push    5
        callf   SEG_B05A:far_b1073
        add     sp, 2
tgt_c5102:
        mov     al, byte ptr [bp - 9]
        cmp     al, byte ptr [bp - 0bh]
        jc      br_c5119
        inc     al
        mov     byte ptr [bp - 0bh], al
        push    7
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_c5119:
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 10h]
        else
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        endif
        mov     al, byte ptr [bp - 9]
        if      FW_VERSION >= 311
        mov     byte ptr es:[bx + 2], al
        else
        mov     byte ptr es:[bx - 308h], al
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        mov     bx, word ptr [FP_E40C]
        add     bx, ax
        endif
        mov     al, byte ptr [bp - 0bh]
        if      FW_VERSION >= 311
        mov     byte ptr es:[bx + 4], al
        else
        mov     byte ptr es:[bx - 306h], al
        endif
        jmp     tgt_c5224
fn_c512d:
        jmp     tgt_c5224
tgt_c5130:
        mov     al, byte ptr [bp - 8]
        mov     ah, 0
        cmp     ax, 1
        jz      br_c5147
        cmp     ax, 2
        jz      br_c5175
        cmp     ax, 3
        jz      br_c5175
        jmp     tgt_c5224
br_c5147:
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 10h]
        else
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        endif
        mov     al, byte ptr [bp - 0ch]
        if      FW_VERSION >= 311
        mov     byte ptr es:[bx + 5], al
        else
        mov     byte ptr es:[bx - 305h], al
        endif
        push    11h
        push    5
        push    ax
        nop
        push    cs
        call    far_c530b
        add     sp, 6
        push    10h
        push    13h
        push    5
        mov     al, byte ptr [bp - 0ch]
        mov     ah, 0
        push    ax
        callf   SEG_B702:far_b9045
        add     sp, 8
        if      FW_VERSION >= 311
        jmp     near tgt_c5224
        else
        jmp     tgt_c5224
        endif
br_c5175:
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 10h]
        else
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        endif
        mov     al, byte ptr [bp - 0ah]
        if      FW_VERSION >= 311
        mov     byte ptr es:[bx + 3], al
        else
        mov     byte ptr es:[bx - 307h], al
        endif
        push    11h
        push    4
        push    ax
        nop
        push    cs
        call    far_c530b
        add     sp, 6
        push    10h
        push    13h
        push    4
        mov     al, byte ptr [bp - 0ah]
        mov     ah, 0
        push    ax
        callf   SEG_B702:far_b9045
        add     sp, 8
        jmp     near tgt_c5224
tgt_c51a3:
        mov     al, byte ptr [bp - 8]
        mov     ah, 0
        cmp     ax, 2
        jz      br_c51d0
        cmp     ax, 3
        jz      br_c51b4
        if      FW_VERSION >= 311
        jmp     tgt_c5224
        else
        jmp     near tgt_c5224
        endif
br_c51b4:
        cmp     byte ptr [bp - 0bh], 64h
        jbe     br_c51d0
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 10h]
        mov     byte ptr es:[bx + 4], 64h
        else
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     byte ptr es:[bx - 306h], 64h
        endif
        mov     byte ptr [bp - 0bh], 64h
        push    7
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_c51d0:
        mov     al, byte ptr [bp - 0bh]
        cmp     al, byte ptr [bp - 9]
        ja      br_c51ea
        mov     al, byte ptr [bp - 9]
        inc     al
        mov     byte ptr [bp - 0bh], al
        push    7
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_c51ea:
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 10h]
        else
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        endif
        mov     al, byte ptr [bp - 0bh]
        if      FW_VERSION >= 311
        mov     byte ptr es:[bx + 4], al
        else
        mov     byte ptr es:[bx - 306h], al
        endif
        jmp     tgt_c5224
tgt_c51f6:
        push    11h
        push    5
        mov     al, byte ptr [bp - 0ch]
        push    ax
        nop
        push    cs
        call    far_c530b
        add     sp, 6
        push    10h
        push    13h
        push    5
        mov     al, byte ptr [bp - 0ch]
        mov     ah, 0
        push    ax
        callf   SEG_B702:far_b9045
        add     sp, 8
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 10h]
        else
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        endif
        mov     al, byte ptr [bp - 0ch]
        if      FW_VERSION >= 311
        mov     byte ptr es:[bx + 5], al
        else
        mov     byte ptr es:[bx - 305h], al
        endif
tgt_c5224:
        cmp     word ptr [bp - 4], 0
        jnz     br_c523f
        if      FW_VERSION >= 311
        push    word 81h
        else
        push    0ff81h
        endif
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jnz     br_c523f
        jmp     br_c4f9a
br_c523f:
        mov     ax, word ptr [bp - 2]
        cmp     ax, 50h
        jz      br_c5263
        cmp     ax, 78h
        jz      br_c524e
        jmp     br_c5268
br_c524e:
        mov     al, byte ptr [bp - 6]
        mov     ah, 0
        push    ax
        callf   SEG_CB8A:far_cc4e0
        add     sp, 2
        mov     word ptr [bp - 4], 1
        jmp     br_c5268
br_c5263:
        mov     word ptr [bp - 4], 1
br_c5268:
        cmp     word ptr [bp - 4], 1
        jnz     br_c5271
        jmp     br_c4b24
br_c5271:
        mov     ax, word ptr [bp - 2]
        pop     di
        pop     si
        leave
        retf
TBL_c5278:
        dw      tgt_c5224
        dw      tgt_c50b8
        dw      tgt_c5102
        dw      tgt_c50e6
TBL_c5280:
        dw      tgt_c4faf
        dw      tgt_c4fe4
        dw      tgt_c4fbe
        dw      tgt_c5016
        dw      tgt_c5090
        dw      tgt_c50a2
        dw      tgt_c5130
        dw      tgt_c51a3
        dw      tgt_c51f6
TBL_c5292:
        dw      tgt_c4d38
        dw      tgt_c4d61
        dw      tgt_c4dea
        dw      tgt_c4ea5
far_c529a:
        push    bp
        mov     bp, sp
        push    si
        push    di
        mov     ax, word ptr [bp + 6]
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 30ah]
        mov     ah, 0
        mov     cx, ax
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        cmp     byte ptr es:[bx + 4800h], 0
        jnz     br_c52d0
        xor     ax, ax
        pop     di
        pop     si
        pop     bp
        retf
br_c52d0:
        cmp     cx, 0ffh
        jnz     br_c52da
        xor     cx, cx
        jmp     br_c5305
br_c52da:
        xor     di, di
        mov     dx, di
        mov     si, word ptr [bp + 8]
        add     si, dx
        jmp     br_c5300
loop_c52e5:
        mov     es, word ptr [bp + 0ah]
        mov     al, byte ptr es:[si]
        cbw
        cmp     ax, cx
        jnz     br_c52f5
        mov     cx, dx
        mov     di, 1
br_c52f5:
        inc     si
        inc     dx
        cmp     dx, 80h
        jnz     br_c5300
        mov     di, 1
br_c5300:
        or      di, di
        jz      loop_c52e5
        inc     cx
br_c5305:
        mov     ax, cx
        pop     di
        pop     si
        pop     bp
        retf
far_c530b:
        push    bp
        mov     bp, sp
        cmp     byte ptr [bp + 6], 23h
        jge     br_c5332
        mov     al, byte ptr [bp + 0ah]
        cbw
        push    ax
        mov     al, byte ptr [bp + 8]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_5B8E
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_c5332:
        pop     bp
        retf
fn_c5334:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 14h
        else
        sub     sp, 0eh
        mov     byte ptr [B_D5DD], 2
        endif
        callf   SEG_B1AA:far_b1aac
        if      FW_VERSION >= 311
        push    1
        callf   SEG_D793:far_d796d
        add     sp, 2
        endif
        mov     al, byte ptr [B_E421]
        inc     al
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 2], al
        else
        mov     byte ptr [bp - 1], al
        endif
        push    8
        push    18h
        push    1
        push    2
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 2]
        else
        lea     ax, [bp - 1]
        endif
        push    ax
        push    ds
        push    word STR_5B91
        callf   SEG_B347:far_b3819
        add     sp, 10h
        mov     al, byte ptr [B_D4C0]
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 3], al
        else
        mov     byte ptr [bp - 2], al
        endif
        push    18h
        push    62h
        push    23h
        push    2
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 3]
        else
        lea     ax, [bp - 2]
        endif
        push    ax
        push    ds
        push    word A_5B17
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    1fh
        push    0
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 3]
        else
        mov     al, byte ptr [bp - 2]
        endif
        cbw
        push    ax
        callf   SEG_B702:far_b8ff3
        add     sp, 6
        push    23h
        push    0
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_5BA7
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_5BAD
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 3]
        cbw
        mov     dx, 18h
        imul    dx
        mov     dx, word ptr [W_E40E]
        mov     bx, word ptr [FP_E40C]
        add     bx, ax
        add     bx, 0fcf6h
        mov     word ptr [bp - 12h], dx
        mov     word ptr [bp - 14h], bx
        endif
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 14h]
        mov     al, byte ptr es:[bx + 0bh]
        else
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2ffh]
        mov     byte ptr [bp - 3], al
        push    word SEG_DA7E
        push    word 0cfh
        push    8
        push    64h
        push    0
        push    4
        push    ss
        lea     ax, [bp - 3]
        push    ax
        push    ds
        push    word STR_5BD6
        callf   SEG_B347:far_b3723
        add     sp, 14h
        push    0eh
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2f6h]
        endif
        mov     byte ptr [bp - 4], al
        push    word SEG_DA7E
        if      FW_VERSION >= 312
        push    word 0c5h
        elseif  FW_VERSION = 311
        push    word 0cbh
        else
        push    word 0cfh
        endif
        push    8
        push    64h
        push    0
        push    4
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ds
        if      FW_VERSION >= 312
        push    word A_5BD6
        callf   SEG_B347:far_b3723
        add     sp, 14h
        push    0eh
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        les     bx, dword ptr [bp - 14h]
        mov     al, byte ptr es:[bx + 14h]
        mov     byte ptr [bp - 5], al
        push    word SEG_DA7E
        push    word 0c5h
        push    8
        push    64h
        push    0
        push    4
        push    ss
        lea     ax, [bp - 5]
        push    ax
        push    ds
        push    word A_5BD6
        elseif  FW_VERSION = 311
        push    word A_5BD6
        callf   SEG_B347:far_b3723
        add     sp, 14h
        push    0eh
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        les     bx, dword ptr [bp - 14h]
        mov     al, byte ptr es:[bx + 14h]
        mov     byte ptr [bp - 5], al
        push    word SEG_DA7E
        push    word 0cbh
        push    8
        push    64h
        push    0
        push    4
        push    ss
        lea     ax, [bp - 5]
        push    ax
        push    ds
        push    word A_5BD6
        else
        push    word STR_5BD6
        endif
        callf   SEG_B347:far_b3723
        add     sp, 14h
        push    1bh
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 14h]
        mov     ax, word ptr es:[bx + 9]
        else
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     ax, word ptr es:[bx - 301h]
        endif
        mov     word ptr [bp - 0eh], ax
        push    0
        push    word 0f0h
        push    word 0ff10h
        push    4
        push    ss
        lea     ax, [bp - 0eh]
        push    ax
        push    ds
        push    word STR_5BDE
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 14h]
        mov     al, byte ptr es:[bx + 0ch]
        else
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2feh]
        mov     byte ptr [bp - 5], al
        push    word SEG_DA7E
        push    word 0cfh
        push    8
        push    64h
        push    0
        push    4
        push    ss
        lea     ax, [bp - 5]
        push    ax
        push    ds
        push    word STR_5BE4
        callf   SEG_B347:far_b3723
        add     sp, 14h
        push    0eh
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2f5h]
        endif
        mov     byte ptr [bp - 6], al
        push    word SEG_DA7E
        if      FW_VERSION >= 312
        push    word 0c5h
        elseif  FW_VERSION = 311
        push    word 0cbh
        else
        push    word 0cfh
        endif
        push    8
        push    64h
        push    0
        push    4
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        if      FW_VERSION >= 312
        push    word A_5BE4
        callf   SEG_B347:far_b3723
        add     sp, 14h
        push    0eh
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        les     bx, dword ptr [bp - 14h]
        mov     al, byte ptr es:[bx + 15h]
        mov     byte ptr [bp - 7], al
        push    word SEG_DA7E
        push    word 0c5h
        push    8
        push    64h
        push    0
        push    4
        push    ss
        lea     ax, [bp - 7]
        push    ax
        push    ds
        elseif  FW_VERSION = 311
        push    word A_5BE4
        callf   SEG_B347:far_b3723
        add     sp, 14h
        push    0eh
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        les     bx, dword ptr [bp - 14h]
        mov     al, byte ptr es:[bx + 15h]
        mov     byte ptr [bp - 7], al
        push    word SEG_DA7E
        push    word 0cbh
        push    8
        push    64h
        push    0
        push    4
        push    ss
        lea     ax, [bp - 7]
        push    ax
        push    ds
        endif
        push    word STR_5BEB
        callf   SEG_B347:far_b3723
        add     sp, 14h
        push    1bh
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 14h]
        mov     al, byte ptr es:[bx + 6]
        mov     byte ptr [bp - 8], al
        else
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 304h]
        mov     byte ptr [bp - 7], al
        endif
        push    8
        push    ds
        if      FW_VERSION >= 312
        push    word P_59A7+5
        elseif  FW_VERSION = 311
        push    word P_58FD_V311+5
        else
        push    word P_537F_V308+5
        endif
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 8]
        else
        lea     ax, [bp - 7]
        endif
        push    ax
        push    ds
        push    word STR_5BF3
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 14h]
        mov     al, byte ptr es:[bx + 0dh]
        mov     byte ptr [bp - 9], al
        else
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2fdh]
        mov     byte ptr [bp - 8], al
        endif
        push    5
        push    ds
        if      FW_VERSION >= 312
        push    word P_59B7+5
        elseif  FW_VERSION = 311
        push    word P_590D_V311+5
        else
        push    word P_538F_V308+5
        endif
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 9]
        else
        lea     ax, [bp - 8]
        endif
        push    ax
        push    ds
        push    word STR_5BF9
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0eh
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 14h]
        mov     al, byte ptr es:[bx + 13h]
        mov     byte ptr [bp - 0ah], al
        else
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2f7h]
        mov     byte ptr [bp - 9], al
        endif
        push    8
        push    64h
        push    0
        push    3
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 0ah]
        else
        lea     ax, [bp - 9]
        endif
        push    ax
        push    ds
        push    word STR_5C01
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    1bh
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 14h]
        mov     al, byte ptr es:[bx + 7]
        else
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 303h]
        mov     byte ptr [bp - 0ah], al
        push    8
        push    62h
        push    22h
        push    2
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        push    ds
        push    word A_5C09
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    22h
        push    4
        mov     al, byte ptr [bp - 0ah]
        push    ax
        push    cs
        call    far_c530b
        add     sp, 6
        push    24h
        push    4
        mov     al, byte ptr [bp - 0ah]
        mov     ah, 0
        push    ax
        callf   SEG_B702:far_b8ff3
        add     sp, 6
        push    1bh
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 302h]
        endif
        mov     byte ptr [bp - 0bh], al
        push    8
        push    62h
        push    22h
        push    2
        push    ss
        lea     ax, [bp - 0bh]
        push    ax
        push    ds
        push    word A_5C09
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    22h
        if      FW_VERSION >= 311
        push    4
        else
        push    5
        endif
        mov     al, byte ptr [bp - 0bh]
        push    ax
        push    cs
        call    far_c530b
        add     sp, 6
        push    24h
        if      FW_VERSION >= 311
        push    4
        else
        push    5
        endif
        mov     al, byte ptr [bp - 0bh]
        if      FW_VERSION >= 311
        mov     ah, 0
        push    ax
        callf   SEG_B702:far_b8ff3
        add     sp, 6
        push    1bh
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        les     bx, dword ptr [bp - 14h]
        mov     al, byte ptr es:[bx + 8]
        mov     byte ptr [bp - 0ch], al
        push    8
        push    62h
        push    22h
        push    2
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        push    ds
        push    word A_5C09
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    22h
        push    5
        mov     al, byte ptr [bp - 0ch]
        push    ax
        push    cs
        call    far_c530b
        add     sp, 6
        push    24h
        push    5
        mov     al, byte ptr [bp - 0ch]
        endif
        mov     ah, 0
        push    ax
        callf   SEG_B702:far_b8ff3
        add     sp, 6
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
        push    word A_5B37
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 1], 0
        else
        mov     dl, 0
        endif
        jmp     br_c5824
br_c5645:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     bx, ax
        cmp     bx, 0bh
        jbe     br_c5653
        jmp     loop_c57f6
br_c5653:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c583a]
tgt_c565a:
        push    1fh
        push    0
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 3]
        else
        mov     al, byte ptr [bp - 2]
        endif
        cbw
        push    ax
        callf   SEG_B702:far_b8ff3
        add     sp, 6
tgt_c566b:
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 2]
        else
        mov     al, byte ptr [bp - 1]
        endif
        cbw
        dec     ax
        push    ax
        nop
        push    cs
        call    far_c6547
        add     sp, 2
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 3]
        else
        mov     al, byte ptr [bp - 2]
        endif
        cbw
        mov     dx, 18h
        imul    dx
        if      FW_VERSION >= 311
        mov     dx, word ptr [W_E40E]
        mov     bx, word ptr [FP_E40C]
        else
        les     bx, dword ptr [FP_E40C]
        endif
        add     bx, ax
        if      FW_VERSION >= 311
        add     bx, 0fcf6h
        mov     word ptr [bp - 12h], dx
        mov     word ptr [bp - 14h], bx
        mov     es, word ptr [bp - 12h]
        mov     al, byte ptr es:[bx + 0bh]
        mov     byte ptr [bp - 4], al
        mov     al, byte ptr es:[bx + 14h]
        mov     byte ptr [bp - 5], al
        mov     ax, word ptr es:[bx + 9]
        mov     word ptr [bp - 0eh], ax
        mov     al, byte ptr es:[bx + 0ch]
        mov     byte ptr [bp - 6], al
        mov     al, byte ptr es:[bx + 15h]
        mov     byte ptr [bp - 7], al
        mov     al, byte ptr es:[bx + 6]
        mov     byte ptr [bp - 8], al
        mov     al, byte ptr es:[bx + 0dh]
        mov     byte ptr [bp - 9], al
        mov     al, byte ptr es:[bx + 13h]
        mov     byte ptr [bp - 0ah], al
        mov     al, byte ptr es:[bx + 7]
        mov     byte ptr [bp - 0bh], al
        mov     al, byte ptr es:[bx + 8]
        mov     byte ptr [bp - 0ch], al
        mov     word ptr [bp - 10h], 2
        jmp     br_c56f5
loop_c56e6:
        mov     al, byte ptr [bp - 10h]
        push    ax
        else
        mov     al, byte ptr es:[bx - 2ffh]
        mov     byte ptr [bp - 3], al
        push    2
        endif
        callf   SEG_B05A:far_b1073
        add     sp, 2
        if      FW_VERSION >= 311
        inc     word ptr [bp - 10h]
br_c56f5:
        cmp     word ptr [bp - 10h], 0bh
        jle     loop_c56e6
        else
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2f6h]
        mov     byte ptr [bp - 4], al
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     ax, word ptr es:[bx - 301h]
        mov     word ptr [bp - 0eh], ax
        push    4
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2feh]
        mov     byte ptr [bp - 5], al
        push    5
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2f5h]
        mov     byte ptr [bp - 6], al
        push    6
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 304h]
        mov     byte ptr [bp - 7], al
        push    7
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2fdh]
        mov     byte ptr [bp - 8], al
        push    8
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2f7h]
        mov     byte ptr [bp - 9], al
        push    9
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 303h]
        mov     byte ptr [bp - 0ah], al
        push    0ah
        callf   SEG_B05A:far_b1073
        add     sp, 2
        endif
        push    22h
        push    4
        if      FW_VERSION < 311
        mov     al, byte ptr [bp - 0ah]
        push    ax
        push    cs
        call    far_c530b
        add     sp, 6
        push    24h
        push    4
        mov     al, byte ptr [bp - 0ah]
        mov     ah, 0
        push    ax
        callf   SEG_B702:far_b8ff3
        add     sp, 6
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 302h]
        mov     byte ptr [bp - 0bh], al
        push    0bh
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    22h
        push    5
        endif
        mov     al, byte ptr [bp - 0bh]
        push    ax
        push    cs
        call    far_c530b
        add     sp, 6
        push    24h
        if      FW_VERSION >= 311
        push    4
        else
        push    5
        endif
        mov     al, byte ptr [bp - 0bh]
        mov     ah, 0
        push    ax
        callf   SEG_B702:far_b8ff3
        add     sp, 6
        if      FW_VERSION >= 311
        push    22h
        push    5
        mov     al, byte ptr [bp - 0ch]
        push    ax
        push    cs
        call    far_c530b
        add     sp, 6
        push    24h
        push    5
        mov     al, byte ptr [bp - 0ch]
        mov     ah, 0
        push    ax
        callf   SEG_B702:far_b8ff3
        add     sp, 6
        else
        jmp     loop_c57f6
tgt_c5740:
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr [bp - 3]
        mov     byte ptr es:[bx - 2ffh], al
        jmp     loop_c57f6
tgt_c574d:
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr [bp - 4]
        mov     byte ptr es:[bx - 2f6h], al
        jmp     loop_c57f6
tgt_c575a:
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     ax, word ptr [bp - 0eh]
        mov     word ptr es:[bx - 301h], ax
        jmp     loop_c57f6
tgt_c5767:
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr [bp - 5]
        mov     byte ptr es:[bx - 2feh], al
        jmp     loop_c57f6
tgt_c5774:
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr [bp - 6]
        mov     byte ptr es:[bx - 2f5h], al
        endif
        jmp     near loop_c57f6
        if      FW_VERSION >= 311
tgt_c5740:
        les     bx, dword ptr [bp - 14h]
        mov     al, byte ptr [bp - 4]
        mov     byte ptr es:[bx + 0bh], al
        else
tgt_c5780:
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr [bp - 7]
        mov     byte ptr es:[bx - 304h], al
        endif
        jmp     near loop_c57f6
        if      FW_VERSION >= 311
tgt_c574d:
        les     bx, dword ptr [bp - 14h]
        mov     al, byte ptr [bp - 5]
        mov     byte ptr es:[bx + 14h], al
        else
tgt_c578c:
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr [bp - 8]
        mov     byte ptr es:[bx - 2fdh], al
        endif
        jmp     near loop_c57f6
        if      FW_VERSION >= 311
tgt_c575a:
        les     bx, dword ptr [bp - 14h]
        mov     ax, word ptr [bp - 0eh]
        mov     word ptr es:[bx + 9], ax
        jmp     near loop_c57f6
tgt_c5767:
        les     bx, dword ptr [bp - 14h]
        mov     al, byte ptr [bp - 6]
        mov     byte ptr es:[bx + 0ch], al
        jmp     near loop_c57f6
tgt_c5774:
        les     bx, dword ptr [bp - 14h]
        mov     al, byte ptr [bp - 7]
        mov     byte ptr es:[bx + 15h], al
        jmp     loop_c57f6
tgt_c5780:
        les     bx, dword ptr [bp - 14h]
        mov     al, byte ptr [bp - 8]
        mov     byte ptr es:[bx + 6], al
        jmp     loop_c57f6
tgt_c578c:
        les     bx, dword ptr [bp - 14h]
        else
tgt_c5798:
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        endif
        mov     al, byte ptr [bp - 9]
        if      FW_VERSION >= 311
        mov     byte ptr es:[bx + 0dh], al
        jmp     loop_c57f6
tgt_c5798:
        les     bx, dword ptr [bp - 14h]
        mov     al, byte ptr [bp - 0ah]
        mov     byte ptr es:[bx + 13h], al
        else
        mov     byte ptr es:[bx - 2f7h], al
        endif
        jmp     loop_c57f6
tgt_c57a4:
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 14h]
        mov     al, byte ptr [bp - 0bh]
        mov     byte ptr es:[bx + 7], al
        else
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr [bp - 0ah]
        mov     byte ptr es:[bx - 303h], al
        endif
        push    22h
        push    4
        push    ax
        push    cs
        call    far_c530b
        add     sp, 6
        push    24h
        push    4
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 0bh]
        else
        mov     al, byte ptr [bp - 0ah]
        endif
        mov     ah, 0
        push    ax
        callf   SEG_B702:far_b8ff3
        add     sp, 6
        jmp     loop_c57f6
tgt_c57ce:
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 14h]
        mov     al, byte ptr [bp - 0ch]
        mov     byte ptr es:[bx + 8], al
        else
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr [bp - 0bh]
        mov     byte ptr es:[bx - 302h], al
        endif
        push    22h
        push    5
        push    ax
        push    cs
        call    far_c530b
        add     sp, 6
        push    24h
        push    5
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 0ch]
        else
        mov     al, byte ptr [bp - 0bh]
        endif
        mov     ah, 0
        push    ax
        callf   SEG_B702:far_b8ff3
        add     sp, 6
loop_c57f6:
        if      FW_VERSION >= 311
        push    word 81h
        else
        push    0ff81h
        endif
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 1], al
        else
        mov     dl, al
        endif
        or      al, al
        jnz     br_c580b
        jmp     br_c5645
br_c580b:
        cbw
        cmp     ax, 78h
        jz      br_c5813
        jmp     br_c5824
br_c5813:
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 3]
        else
        mov     al, byte ptr [bp - 2]
        endif
        cbw
        push    ax
        callf   SEG_CB8A:far_cc4e0
        add     sp, 2
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 1], 0
        else
        mov     dl, 0
        endif
br_c5824:
        if      FW_VERSION >= 311
        cmp     byte ptr [bp - 1], 0
        else
        or      dl, dl
        endif
        jz      loop_c57f6
        if      FW_VERSION >= 311
        push    0
        callf   SEG_D793:far_d796d
        add     sp, 2
        mov     al, byte ptr [bp - 1]
        else
        mov     al, dl
        endif
        cbw
        leave
        retf
TBL_c583a:
        dw      tgt_c566b
        dw      tgt_c565a
        dw      tgt_c5740
        dw      tgt_c574d
        dw      tgt_c575a
        dw      tgt_c5767
        dw      tgt_c5774
        dw      tgt_c5780
        dw      tgt_c578c
        dw      tgt_c5798
        dw      tgt_c57a4
        dw      tgt_c57ce
fn_c5852:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 0ah
        else
        sub     sp, 8
        endif
        mov     byte ptr [B_D5DD], 3
        callf   SEG_B1AA:far_b1aac
        if      FW_VERSION >= 311
        push    1
        callf   SEG_D793:far_d796d
        add     sp, 2
        endif
        mov     al, byte ptr [B_E421]
        inc     al
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 2], al
        else
        mov     byte ptr [bp - 1], al
        endif
        push    8
        push    18h
        push    1
        push    2
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 2]
        else
        lea     ax, [bp - 1]
        endif
        push    ax
        push    ds
        push    word STR_5C11
        callf   SEG_B347:far_b3819
        add     sp, 10h
        mov     al, byte ptr [B_D4C0]
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 3], al
        else
        mov     byte ptr [bp - 2], al
        endif
        push    18h
        push    62h
        push    23h
        push    2
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 3]
        else
        lea     ax, [bp - 2]
        endif
        push    ax
        push    ds
        push    word A_5B17
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    1dh
        push    0
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 3]
        else
        mov     al, byte ptr [bp - 2]
        endif
        cbw
        push    ax
        callf   SEG_B702:far_b8ff3
        add     sp, 6
        push    21h
        push    0
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_5C25
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 3]
        else
        mov     al, byte ptr [bp - 2]
        endif
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2fch]
        if      FW_VERSION < 311
        mov     byte ptr [bp - 3], al
        push    8
        push    64h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 3]
        push    ax
        push    ds
        push    word STR_5C2D
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    10h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2f4h]
        endif
        mov     byte ptr [bp - 4], al
        push    8
        push    64h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ds
        if      FW_VERSION >= 312
        push    word STR_5C2D
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    10h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 3]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2f4h]
        mov     byte ptr [bp - 5], al
        push    8
        push    64h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 5]
        push    ax
        push    ds
        elseif  FW_VERSION = 311
        push    word STR_5C2D
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    10h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 3]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2f4h]
        mov     byte ptr [bp - 5], al
        push    8
        push    64h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 5]
        push    ax
        push    ds
        endif
        push    word STR_5C38
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    1eh
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 3]
        else
        mov     al, byte ptr [bp - 2]
        endif
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2fbh]
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 6], al
        else
        mov     byte ptr [bp - 5], al
        endif
        push    8
        push    0fh
        push    0
        push    2
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 6]
        else
        lea     ax, [bp - 5]
        endif
        push    ax
        push    ds
        push    word STR_5C42
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_5C49
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 3]
        else
        mov     al, byte ptr [bp - 2]
        endif
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2fah]
        if      FW_VERSION < 311
        mov     byte ptr [bp - 6], al
        push    word SEG_DA7E
        push    word 0cfh
        push    8
        push    64h
        push    0
        push    4
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word STR_5BD6
        callf   SEG_B347:far_b3723
        add     sp, 14h
        push    10h
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2f9h]
        endif
        mov     byte ptr [bp - 7], al
        push    word SEG_DA7E
        if      FW_VERSION >= 312
        push    word 0c5h
        elseif  FW_VERSION = 311
        push    word 0cbh
        else
        push    word 0cfh
        endif
        push    8
        push    64h
        push    0
        push    4
        push    ss
        lea     ax, [bp - 7]
        push    ax
        push    ds
        if      FW_VERSION >= 312
        push    word A_5BD6
        callf   SEG_B347:far_b3723
        add     sp, 14h
        push    10h
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 3]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2f9h]
        mov     byte ptr [bp - 8], al
        push    word SEG_DA7E
        push    word 0c5h
        push    8
        push    64h
        push    0
        push    4
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    ds
        push    word A_5BE4
        elseif  FW_VERSION = 311
        push    word A_5BD6
        callf   SEG_B347:far_b3723
        add     sp, 14h
        push    10h
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [bp - 3]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2f9h]
        mov     byte ptr [bp - 8], al
        push    word SEG_DA7E
        push    word 0cbh
        push    8
        push    64h
        push    0
        push    4
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    ds
        push    word A_5BE4
        else
        push    word STR_5BE4
        endif
        callf   SEG_B347:far_b3723
        add     sp, 14h
        push    1eh
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 3]
        else
        mov     al, byte ptr [bp - 2]
        endif
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2f8h]
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 9], al
        else
        mov     byte ptr [bp - 8], al
        endif
        push    8
        push    64h
        push    0
        push    3
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 9]
        else
        lea     ax, [bp - 8]
        endif
        push    ax
        push    ds
        push    word STR_5C72
        callf   SEG_B347:far_b3819
        add     sp, 10h
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
        push    word A_5B37
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 1], 0
        else
        mov     dl, 0
        endif
        jmp     br_c5c50
br_c5a91:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     bx, ax
        cmp     bx, 7
        jbe     br_c5a9f
        jmp     loop_c5c22
br_c5a9f:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c5c66]
tgt_c5aa6:
        push    1dh
        push    0
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 3]
        else
        mov     al, byte ptr [bp - 2]
        endif
        cbw
        push    ax
        callf   SEG_B702:far_b8ff3
        add     sp, 6
tgt_c5ab7:
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 2]
        else
        mov     al, byte ptr [bp - 1]
        endif
        cbw
        dec     ax
        push    ax
        nop
        push    cs
        call    far_c6547
        add     sp, 2
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 3]
        else
        mov     al, byte ptr [bp - 2]
        endif
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2fch]
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 4], al
        else
        mov     byte ptr [bp - 3], al
        endif
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 3]
        else
        mov     al, byte ptr [bp - 2]
        endif
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2f4h]
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 5], al
        else
        mov     byte ptr [bp - 4], al
        endif
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 3]
        else
        mov     al, byte ptr [bp - 2]
        endif
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2fbh]
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 6], al
        else
        mov     byte ptr [bp - 5], al
        endif
        push    4
        callf   SEG_B05A:far_b1073
        add     sp, 2
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 3]
        else
        mov     al, byte ptr [bp - 2]
        endif
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2fah]
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 7], al
        else
        mov     byte ptr [bp - 6], al
        endif
        push    5
        callf   SEG_B05A:far_b1073
        add     sp, 2
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 3]
        else
        mov     al, byte ptr [bp - 2]
        endif
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2f9h]
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 8], al
        else
        mov     byte ptr [bp - 7], al
        endif
        push    6
        callf   SEG_B05A:far_b1073
        add     sp, 2
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 3]
        else
        mov     al, byte ptr [bp - 2]
        endif
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2f8h]
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 9], al
        else
        mov     byte ptr [bp - 8], al
        endif
        push    7
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     near loop_c5c22
tgt_c5b8e:
        if      FW_VERSION < 311
        mov     al, byte ptr [bp - 2]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        endif
        mov     al, byte ptr [bp - 3]
        if      FW_VERSION < 311
        mov     byte ptr es:[bx - 2fch], al
        jmp     short loop_c5c22
tgt_c5ba7:
        mov     al, byte ptr [bp - 2]
        endif
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr [bp - 4]
        if      FW_VERSION >= 311
        mov     byte ptr es:[bx - 2fch], al
        jmp     short loop_c5c22
tgt_c5ba7:
        mov     al, byte ptr [bp - 3]
        else
        mov     byte ptr es:[bx - 2f4h], al
        jmp     loop_c5c22
tgt_c5bc0:
        mov     al, byte ptr [bp - 2]
        endif
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr [bp - 5]
        if      FW_VERSION >= 311
        mov     byte ptr es:[bx - 2f4h], al
        else
        mov     byte ptr es:[bx - 2fbh], al
        endif
        jmp     loop_c5c22
        if      FW_VERSION >= 311
tgt_c5bc0:
        mov     al, byte ptr [bp - 3]
        else
tgt_c5bd9:
        mov     al, byte ptr [bp - 2]
        endif
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr [bp - 6]
        if      FW_VERSION >= 311
        mov     byte ptr es:[bx - 2fbh], al
        else
        mov     byte ptr es:[bx - 2fah], al
        endif
        jmp     loop_c5c22
        if      FW_VERSION >= 311
tgt_c5bd9:
        mov     al, byte ptr [bp - 3]
        else
tgt_c5bf2:
        mov     al, byte ptr [bp - 2]
        endif
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr [bp - 7]
        if      FW_VERSION >= 311
        mov     byte ptr es:[bx - 2fah], al
        else
        mov     byte ptr es:[bx - 2f9h], al
        endif
        jmp     loop_c5c22
        if      FW_VERSION >= 311
tgt_c5bf2:
        mov     al, byte ptr [bp - 3]
        else
tgt_c5c0b:
        mov     al, byte ptr [bp - 2]
        endif
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr [bp - 8]
        if      FW_VERSION >= 311
        mov     byte ptr es:[bx - 2f9h], al
        jmp     loop_c5c22
tgt_c5c0b:
        mov     al, byte ptr [bp - 3]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr [bp - 9]
        endif
        mov     byte ptr es:[bx - 2f8h], al
loop_c5c22:
        if      FW_VERSION >= 311
        push    word 81h
        else
        push    0ff81h
        endif
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 1], al
        else
        mov     dl, al
        endif
        or      al, al
        jnz     br_c5c37
        jmp     br_c5a91
br_c5c37:
        cbw
        cmp     ax, 78h
        jz      br_c5c3f
        jmp     br_c5c50
br_c5c3f:
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 3]
        else
        mov     al, byte ptr [bp - 2]
        endif
        cbw
        push    ax
        callf   SEG_CB8A:far_cc4e0
        add     sp, 2
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 1], 0
        else
        mov     dl, 0
        endif
br_c5c50:
        if      FW_VERSION >= 311
        cmp     byte ptr [bp - 1], 0
        else
        or      dl, dl
        endif
        jz      loop_c5c22
        if      FW_VERSION >= 311
        push    0
        callf   SEG_D793:far_d796d
        add     sp, 2
        mov     al, byte ptr [bp - 1]
        else
        mov     al, dl
        endif
        cbw
        leave
        retf
TBL_c5c66:
        dw      tgt_c5ab7
        dw      tgt_c5aa6
        dw      tgt_c5b8e
        dw      tgt_c5ba7
        dw      tgt_c5bc0
        dw      tgt_c5bd9
        dw      tgt_c5bf2
        dw      tgt_c5c0b
fn_c5c76:
        push    bp
        mov     bp, sp
        sub     sp, 2
        if      FW_VERSION < 311
        mov     byte ptr [B_D5DD], 4
        endif
        callf   SEG_B1AA:far_b1aac
        push    ds
        push    word STR_5C7A
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word P_5C93
        elseif  FW_VERSION = 311
        push    word P_5C93
        else
        push    word P_5C93
        endif
        callf   SEG_B1AA:far_b1b05
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
        push    0
        push    4
        push    ss
        lea     ax, [bp - 1]
        push    ax
        callf   SEG_EBCC:far_ebcce
        add     sp, 8
        mov     dl, al
        or      dl, dl
        jnz     br_c5d0e
        mov     al, byte ptr [bp - 1]
        if      FW_VERSION < 311
        mov     byte ptr [B_D5DD], al
        endif
        cbw
        dec     ax
        mov     bx, ax
        cmp     bx, 3
        ja      br_c5d0e
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c5d13]
tgt_c5cec:
        nop
        push    cs
        call    fn_c5d1b
        mov     dl, al
        jmp     br_c5d0e
tgt_c5cf5:
        nop
        push    cs
        call    fn_c60d7
        mov     dl, al
        jmp     br_c5d0e
tgt_c5cfe:
        nop
        push    cs
        call    fn_c6379
        mov     dl, al
        jmp     br_c5d0e
tgt_c5d07:
        nop
        push    cs
        call    fn_c64c5
        mov     dl, al
br_c5d0e:
        mov     al, dl
        cbw
        leave
        retf
TBL_c5d13:
        dw      tgt_c5cec
        dw      tgt_c5cf5
        dw      tgt_c5cfe
        dw      tgt_c5d07
fn_c5d1b:
        push    bp
        mov     bp, sp
        sub     sp, 30h
        push    si
        push    di
        mov     byte ptr [B_D5DD], 29h
        callf   SEG_B1AA:far_b1aac
        push    ds
        push    word STR_5D01
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_D4C0]
        mov     byte ptr [bp - 1], al
        push    18h
        push    62h
        push    23h
        push    2
        push    ss
        lea     ax, [bp - 1]
        push    ax
        push    ds
        push    word STR_5D19
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    10h
        push    11h
        push    1
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_B702:far_b9045
        add     sp, 8
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_E421]
        inc     al
        mov     byte ptr [bp - 2], al
        push    8
        push    18h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ds
        push    word A_5D29
        callf   SEG_B347:far_b3819
        add     sp, 10h
        mov     al, byte ptr [bp - 2]
        cbw
        dec     ax
        push    ax
        callf   SEG_DAC2:far_dac45
        add     sp, 2
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        push    ss
        pop     es
        lea     di, [bp - 1eh]
        push    es
        mov     es, word ptr [bp - 6]
        push    di
        mov     di, word ptr [bp - 8]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, word ptr [bp - 6]
        mov     si, word ptr [bp - 8]
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
        lea     ax, [bp - 1eh]
        push    ax
        push    ds
        push    word A_5B3E
        callf   SEG_B347:far_b3471
        add     sp, 0ah
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_D4C0]
        mov     byte ptr [bp - 3], al
        push    18h
        push    62h
        push    23h
        push    2
        push    ss
        lea     ax, [bp - 3]
        push    ax
        push    ds
        push    word STR_5D39
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    10h
        push    11h
        push    4
        mov     al, byte ptr [bp - 3]
        cbw
        push    ax
        callf   SEG_B702:far_b9045
        add     sp, 8
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_E421]
        inc     al
        mov     byte ptr [bp - 4], al
        push    8
        push    18h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ds
        push    word A_5D29
        callf   SEG_B347:far_b3819
        add     sp, 10h
        mov     al, byte ptr [bp - 4]
        cbw
        dec     ax
        push    ax
        callf   SEG_DAC2:far_dac45
        add     sp, 2
        mov     word ptr [bp - 0ah], dx
        mov     word ptr [bp - 0ch], ax
        push    ss
        pop     es
        lea     di, [bp - 30h]
        push    es
        mov     es, word ptr [bp - 0ah]
        push    di
        mov     di, word ptr [bp - 0ch]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, word ptr [bp - 0ah]
        mov     si, word ptr [bp - 0ch]
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
        lea     ax, [bp - 30h]
        push    ax
        push    ds
        push    word A_5B3E
        callf   SEG_B347:far_b3471
        add     sp, 0ah
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
        push    word A_5D49
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_c6040
br_c5ee1:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     bx, ax
        cmp     bx, 5
        jbe     br_c5eef
        jmp     br_c6040
br_c5eef:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c60cb]
tgt_c5ef6:
        push    10h
        push    11h
        push    1
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_B702:far_b9045
        add     sp, 8
        jmp     br_c6040
tgt_c5f0c:
        push    10h
        push    11h
        push    1
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_B702:far_b9045
        add     sp, 8
        mov     al, byte ptr [bp - 2]
        cbw
        dec     ax
        push    ax
        callf   SEG_DAC2:far_dac45
        add     sp, 2
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        push    ss
        pop     es
        lea     di, [bp - 1eh]
        push    es
        mov     es, word ptr [bp - 6]
        push    di
        mov     di, word ptr [bp - 8]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, word ptr [bp - 6]
        mov     si, word ptr [bp - 8]
        pop     di
        pop     es
        push    ds
        mov     ds, ax
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_c6040
tgt_c5f6c:
        push    ss
        pop     es
        lea     di, [bp - 1eh]
        mov     ax, word ptr [bp - 6]
        mov     si, word ptr [bp - 8]
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
        jmp     near br_c6040
tgt_c5f9d:
        push    10h
        push    11h
        push    4
        mov     al, byte ptr [bp - 3]
        cbw
        push    ax
        callf   SEG_B702:far_b9045
        add     sp, 8
        jmp     near br_c6040
tgt_c5fb3:
        push    10h
        push    11h
        push    4
        mov     al, byte ptr [bp - 3]
        cbw
        push    ax
        callf   SEG_B702:far_b9045
        add     sp, 8
        mov     al, byte ptr [bp - 4]
        cbw
        dec     ax
        push    ax
        callf   SEG_DAC2:far_dac45
        add     sp, 2
        mov     word ptr [bp - 0ah], dx
        mov     word ptr [bp - 0ch], ax
        push    ss
        pop     es
        lea     di, [bp - 30h]
        push    es
        mov     es, word ptr [bp - 0ah]
        push    di
        mov     di, word ptr [bp - 0ch]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, word ptr [bp - 0ah]
        mov     si, word ptr [bp - 0ch]
        pop     di
        pop     es
        push    ds
        mov     ds, ax
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        push    5
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_c6040
tgt_c6012:
        push    ss
        pop     es
        lea     di, [bp - 30h]
        mov     ax, word ptr [bp - 0ah]
        mov     si, word ptr [bp - 0ch]
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
br_c6040:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dl, al
        or      al, al
        jnz     br_c6053
        jmp     br_c5ee1
br_c6053:
        cbw
        cmp     ax, 78h
        jz      br_c605b
        jmp     br_c60c4
br_c605b:
        mov     al, byte ptr [bp - 3]
        cbw
        mov     dx, 18h
        imul    dx
        les     di, dword ptr [bp - 0ch]
        add     di, ax
        add     di, 0fcf6h
        mov     al, byte ptr [bp - 1]
        cbw
        mov     dx, 18h
        imul    dx
        mov     dx, word ptr [bp - 6]
        mov     si, word ptr [bp - 8]
        add     si, ax
        add     si, 0fcf6h
        mov     cx, 0ch
        push    ds
        mov     ds, dx
        rep movsw
        pop     ds
        mov     al, byte ptr [bp - 3]
        cbw
        shl     ax, 2
        mov     di, word ptr [bp - 0ch]
        add     di, ax
        add     di, 5b2h
        mov     al, byte ptr [bp - 1]
        cbw
        shl     ax, 2
        mov     si, word ptr [bp - 8]
        add     si, ax
        add     si, 5b2h
        if      FW_VERSION >= 311
        mov     cx, 2
        else
        mov     cx, 0ch
        endif
        push    ds
        mov     ds, dx
        rep movsw
        pop     ds
        mov     al, byte ptr [bp - 4]
        cbw
        dec     ax
        push    ax
        nop
        push    cs
        call    far_c6547
        add     sp, 2
        mov     dl, 4ch
br_c60c4:
        mov     al, dl
        cbw
        pop     di
        pop     si
        leave
        retf
TBL_c60cb:
        dw      tgt_c5ef6
        dw      tgt_c5f0c
        dw      tgt_c5f6c
        dw      tgt_c5f9d
        dw      tgt_c5fb3
        dw      tgt_c6012
fn_c60d7:
        push    bp
        mov     bp, sp
        sub     sp, 2eh
        push    si
        push    di
        mov     byte ptr [B_D5DD], 2ah
        callf   SEG_B1AA:far_b1aac
        push    ds
        push    word STR_5D51
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_E421]
        inc     al
        mov     byte ptr [bp - 1], al
        push    8
        push    18h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 1]
        push    ax
        push    ds
        push    word STR_5D6B
        callf   SEG_B347:far_b3819
        add     sp, 10h
        mov     al, byte ptr [bp - 1]
        cbw
        dec     ax
        push    ax
        callf   SEG_DAC2:far_dac45
        add     sp, 2
        mov     word ptr [bp - 4], dx
        mov     word ptr [bp - 6], ax
        push    ss
        pop     es
        lea     di, [bp - 1ch]
        push    es
        mov     es, word ptr [bp - 4]
        push    di
        mov     di, word ptr [bp - 6]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, word ptr [bp - 4]
        mov     si, word ptr [bp - 6]
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
        lea     ax, [bp - 1ch]
        push    ax
        push    ds
        push    word A_5B3E
        callf   SEG_B347:far_b3471
        add     sp, 0ah
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_E421]
        inc     al
        mov     byte ptr [bp - 2], al
        push    8
        push    18h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ds
        push    word STR_5D7E
        callf   SEG_B347:far_b3819
        add     sp, 10h
        mov     al, byte ptr [bp - 2]
        cbw
        dec     ax
        push    ax
        callf   SEG_DAC2:far_dac45
        add     sp, 2
        mov     word ptr [bp - 8], dx
        mov     word ptr [bp - 0ah], ax
        push    ss
        pop     es
        lea     di, [bp - 2eh]
        push    es
        mov     es, word ptr [bp - 8]
        push    di
        mov     di, word ptr [bp - 0ah]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, word ptr [bp - 8]
        mov     si, word ptr [bp - 0ah]
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
        lea     ax, [bp - 2eh]
        push    ax
        push    ds
        push    word A_5B3E
        callf   SEG_B347:far_b3471
        add     sp, 0ah
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
        push    word A_5D49
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_c632d
br_c6221:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     bx, ax
        cmp     bx, 3
        jbe     br_c622f
        jmp     br_c632d
br_c622f:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c6371]
tgt_c6236:
        mov     al, byte ptr [bp - 1]
        cbw
        dec     ax
        push    ax
        callf   SEG_DAC2:far_dac45
        add     sp, 2
        mov     word ptr [bp - 4], dx
        mov     word ptr [bp - 6], ax
        push    ss
        pop     es
        lea     di, [bp - 1ch]
        push    es
        mov     es, word ptr [bp - 4]
        push    di
        mov     di, word ptr [bp - 6]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, word ptr [bp - 4]
        mov     si, word ptr [bp - 6]
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
        jmp     near br_c632d
tgt_c6283:
        push    ss
        pop     es
        lea     di, [bp - 1ch]
        mov     ax, word ptr [bp - 4]
        mov     si, word ptr [bp - 6]
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
        jmp     short br_c632d
tgt_c62b3:
        mov     al, byte ptr [bp - 2]
        cbw
        dec     ax
        push    ax
        callf   SEG_DAC2:far_dac45
        add     sp, 2
        mov     word ptr [bp - 8], dx
        mov     word ptr [bp - 0ah], ax
        push    ss
        pop     es
        lea     di, [bp - 2eh]
        push    es
        mov     es, word ptr [bp - 8]
        push    di
        mov     di, word ptr [bp - 0ah]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, word ptr [bp - 8]
        mov     si, word ptr [bp - 0ah]
        pop     di
        pop     es
        push    ds
        mov     ds, ax
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_c632d
tgt_c62ff:
        push    ss
        pop     es
        lea     di, [bp - 2eh]
        mov     ax, word ptr [bp - 8]
        mov     si, word ptr [bp - 0ah]
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
br_c632d:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dl, al
        or      al, al
        jnz     br_c6340
        jmp     br_c6221
br_c6340:
        cbw
        cmp     ax, 78h
        jz      br_c6348
        jmp     br_c636a
br_c6348:
        les     di, dword ptr [bp - 0ah]
        mov     ax, word ptr [bp - 4]
        mov     si, word ptr [bp - 6]
        mov     cx, 3bfh
        push    ds
        mov     ds, ax
        rep movsw
        pop     ds
        mov     al, byte ptr [bp - 2]
        cbw
        dec     ax
        push    ax
        nop
        push    cs
        call    far_c6547
        add     sp, 2
        mov     dl, 4ch
br_c636a:
        mov     al, dl
        cbw
        pop     di
        pop     si
        leave
        retf
TBL_c6371:
        dw      tgt_c6236
        dw      tgt_c6283
        dw      tgt_c62b3
        dw      tgt_c62ff
fn_c6379:
        push    bp
        mov     bp, sp
        sub     sp, 14h
        push    si
        push    di
        mov     byte ptr [B_D5DD], 2bh
        callf   SEG_B1AA:far_b1aac
        push    ds
        if      FW_VERSION >= 312
        push    word STR_5C7A_2+6
        elseif  FW_VERSION = 311
        push    word STR_5C7A_2+6
        else
        push    word STR_5C7A_2+6
        endif
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_E421]
        inc     al
        mov     byte ptr [bp - 1], al
        push    8
        push    18h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 1]
        push    ax
        push    ds
        push    word STR_5D91
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    ss
        pop     es
        lea     di, [bp - 14h]
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
        lea     ax, [bp - 14h]
        push    ax
        push    ds
        push    word A_5B3E
        callf   SEG_B347:far_b3471
        add     sp, 0ah
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
        push    word A_5D49
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_c648a
loop_c6431:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jnz     br_c648a
        mov     al, byte ptr [bp - 1]
        cbw
        dec     ax
        push    ax
        nop
        push    cs
        call    far_c6547
        add     sp, 2
        push    0
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    ss
        pop     es
        lea     di, [bp - 14h]
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
br_c648a:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dl, al
        or      al, al
        jz      loop_c6431
        cbw
        cmp     ax, 78h
        jnz     br_c64be
        mov     al, byte ptr [bp - 1]
        cbw
        dec     ax
        push    ax
        callf   SEG_CB18:far_cb457
        add     sp, 2
        mov     al, byte ptr [bp - 1]
        cbw
        dec     ax
        push    ax
        nop
        push    cs
        call    far_c6547
        add     sp, 2
        mov     dl, 4ch
br_c64be:
        mov     al, dl
        cbw
        pop     di
        pop     si
        leave
        retf
fn_c64c5:
        mov     byte ptr [B_D5DD], 2ch
        callf   SEG_B1AA:far_b1aac
        push    ds
        push    word STR_5DA5
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word STR_5DBD
        elseif  FW_VERSION = 311
        push    word STR_5DBD
        else
        push    word STR_5DBD
        endif
        callf   SEG_B1AA:far_b1b05
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
        push    word A_5D49
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
loop_c651c:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dl, al
        or      al, al
        jz      loop_c651c
        cbw
        cmp     ax, 78h
        jnz     br_c6543
        callf   SEG_CB18:far_cb2af
        push    0
        nop
        push    cs
        call    far_c6547
        add     sp, 2
        mov     dl, 4ch
br_c6543:
        mov     al, dl
        cbw
        retf
far_c6547:
        push    bp
        mov     bp, sp
        cmp     word ptr [bp + 6], 0
        jl      br_c65cb
        cmp     word ptr [bp + 6], 18h
        jge     br_c65cb
        push    word ptr [bp + 6]
        callf   SEG_DAC2:far_dac45
        add     sp, 2
        mov     word ptr [W_E40E], dx
        mov     word ptr [FP_E40C], ax
        mov     al, byte ptr [bp + 6]
        mov     byte ptr [B_E421], al
        callf   SEG_C0EE:far_c2c33
        push    dx
        push    ax
        callf   SEG_C0EE:far_c2b07
        add     sp, 4
        cmp     byte ptr [B_D4AB], 0
        jz      br_c659b
        mov     al, byte ptr [B_9781]
        cbw
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 2f3h]
        mov     byte ptr [B_9780], al
br_c659b:
        les     bx, dword ptr [FP_E40C]
        mov     al, byte ptr es:[bx + 11h]
        mov     byte ptr [B_977F], al
        cbw
        mov     dx, 18h
        imul    dx
        add     bx, ax
        mov     al, byte ptr es:[bx - 2f3h]
        mov     byte ptr [B_977E], al
        if      FW_VERSION >= 311
        push    ax
        mov     al, byte ptr [B_977C]
        push    ax
        callf   SEG_DA7E:far_da7e0
        add     sp, 4
        mov     byte ptr [B_977D], al
        endif
        mov     byte ptr [B_D4BE], 50h
br_c65cb:
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   0dh
        elseif  FW_VERSION = 311
        phase   9
        else
        phase   8
        endif
far_c65cd:
        push    bp
        mov     bp, sp
        sub     sp, 10h
        push    ds
        push    word STR_5E1C
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        cmp     byte ptr [B_901B], 0
        jge     br_c65f3
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_E15E:far_e15e2
        add     sp, 2
br_c65f3:
        push    ds
        push    word B_901B
        callf   SEG_E5A9:far_e5a99
        add     sp, 4
        xor     bx, bx
        mov     ax, word ptr [W_8273]
        mov     dx, word ptr [W_8271]
        cmp     ax, word ptr [W_903F]
        jc      br_c6619
        ja      br_c6616
        cmp     dx, word ptr [W_903D]
        jbe     br_c6619
br_c6616:
        mov     bx, 1
br_c6619:
        mov     ax, word ptr [W_8277]
        mov     dx, word ptr [W_8275]
        cmp     ax, word ptr [W_903F]
        jc      br_c6631
        ja      br_c662e
        cmp     dx, word ptr [W_903D]
        jbe     br_c6631
br_c662e:
        mov     bx, 1
br_c6631:
        mov     ax, word ptr [W_827B]
        mov     dx, word ptr [W_8279]
        cmp     ax, word ptr [W_903F]
        jc      br_c6649
        ja      br_c6646
        cmp     dx, word ptr [W_903D]
        jbe     br_c6649
br_c6646:
        mov     bx, 1
br_c6649:
        mov     ax, word ptr [W_827F]
        mov     dx, word ptr [W_827D]
        cmp     ax, word ptr [W_903F]
        jc      br_c6661
        ja      br_c665e
        cmp     dx, word ptr [W_903D]
        jbe     br_c6661
br_c665e:
        mov     bx, 1
br_c6661:
        or      bx, bx
        jz      br_c6685
        xor     ax, ax
        xor     dx, dx
        mov     word ptr [W_827F], ax
        mov     word ptr [W_827D], dx
        mov     word ptr [W_827B], ax
        mov     word ptr [W_8279], dx
        mov     word ptr [W_8277], ax
        mov     word ptr [W_8275], dx
        mov     word ptr [W_8273], ax
        mov     word ptr [W_8271], dx
br_c6685:
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0eh
        push    ds
        if      FW_VERSION >= 312
        push    word P_5DE8
        elseif  FW_VERSION = 311
        push    word P_5D3E_V311
        else
        push    word P_5798_V308
        endif
        push    ds
        push    word B_8270
        push    ds
        push    word STR_5E27
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    word ptr [W_8273]
        push    word ptr [W_8271]
        push    ds
        push    word B_901B
        callf   SEG_EADF:far_eadf4
        add     sp, 0ch
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    word ptr [W_8277]
        push    word ptr [W_8275]
        push    ds
        push    word B_901B
        callf   SEG_EADF:far_eadf4
        add     sp, 0ch
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ds
        push    word STR_5E2D
        callf   SEG_B347:far_b39a2
        add     sp, 8
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    ds
        push    word A_5E3D
        callf   SEG_B347:far_b39a2
        add     sp, 8
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        push    word ptr [W_827B]
        push    word ptr [W_8279]
        push    ds
        push    word B_901B
        callf   SEG_EADF:far_eadf4
        add     sp, 0ch
        push    ss
        lea     ax, [bp - 10h]
        push    ax
        push    word ptr [W_827F]
        push    word ptr [W_827D]
        push    ds
        push    word B_901B
        callf   SEG_EADF:far_eadf4
        add     sp, 0ch
        push    ds
        push    word STR_5E43
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        callf   SEG_EA92:far_eab36
        add     sp, 6
        push    ds
        push    word A_5E3D
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    ss
        lea     ax, [bp - 10h]
        push    ax
        callf   SEG_EA92:far_eab36
        add     sp, 6
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_5E53
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        nop
        push    cs
        call    fn_c6867
        xor     dx, dx
        jmp     near br_c685c
loop_c6796:
        mov     al, byte ptr [B_7B8D]
        cbw
        cmp     ax, 1
        jz      br_c67a6
        cmp     ax, 2
        jz      br_c67be
        jmp     br_c67d4
br_c67a6:
        push    ds
        push    word W_8271
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    ds
        push    word B_901B
        callf   SEG_EB00:far_eb007
        add     sp, 0ch
        jmp     br_c67d4
br_c67be:
        push    ds
        push    word W_8275
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        push    ds
        push    word B_901B
        callf   SEG_EB00:far_eb007
        add     sp, 0ch
br_c67d4:
        push    2
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_c6796
        cmp     ax, 78h
        jz      br_c67f0
        cmp     ax, 79h
        jz      br_c6812
        jmp     br_c685c
br_c67f0:
        mov     al, byte ptr [B_9560]
        cbw
        neg     ax
        sbb     ax, ax
        inc     ax
        mov     byte ptr [B_9560], al
        cbw
        push    ax
        push    5
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        nop
        push    cs
        call    fn_c6867
        mov     dx, 4dh
        jmp     br_c685c
br_c6812:
        mov     ax, word ptr [W_827B]
        mov     dx, word ptr [W_8279]
        mov     word ptr [W_8273], ax
        mov     word ptr [W_8271], dx
        mov     ax, word ptr [W_827F]
        mov     dx, word ptr [W_827D]
        mov     word ptr [W_8277], ax
        mov     word ptr [W_8275], dx
        mov     ax, word ptr [bp - 0ah]
        mov     dx, word ptr [bp - 0ch]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        mov     ax, word ptr [bp - 0eh]
        mov     dx, word ptr [bp - 10h]
        mov     word ptr [bp - 6], ax
        if      FW_VERSION >= 311
        mov     word ptr [bp - 8], dx
        else
        db      089h, 056h
        phase   280h
        db      0f8h
        endif
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        xor     dx, dx
br_c685c:
        or      dx, dx
        jnz     br_c6863
        jmp     near br_c67d4
br_c6863:
        mov     ax, dx
        leave
        retf
fn_c6867:
        push    6
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     byte ptr [B_9560], 0
        jnz     br_c6887
        push    ds
        push    word STR_5E6A
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        retf
br_c6887:
        push    ds
        push    word STR_5E6E
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        retf
        if      FW_VERSION >= 312
        phase   4
        elseif  FW_VERSION = 311
        phase   0
        else
        phase   0fh
        endif
far_c6894:
        push    bp
        mov     bp, sp
        sub     sp, 2eh
        push    si
        push    di
        push    ds
        push    word A_5EE6
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        callf   SEG_E6FE:far_e7069
        mov     byte ptr [B_D5DD], 2
        mov     al, byte ptr [B_8A9F]
        cbw
        mov     word ptr [bp - 2], ax
        push    0
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ds
        push    word STR_5EFD
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    ss
        lea     ax, [bp - 1ch]
        push    ax
        push    0ffffh
        push    word ptr [bp - 2]
        callf   SEG_E4D1:far_e4d15
        add     sp, 8
        push    10h
        push    ss
        lea     ax, [bp - 1ch]
        push    ax
        push    ds
        push    word A_5F02
        callf   SEG_B347:far_b3471
        add     sp, 0ah
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    1fh
        push    1
        push    2
        push    ds
        push    word B_8287
        push    ds
        push    word STR_5F04
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    2
        push    ds
        push    word P_05C0+4
        push    ds
        push    word B_8288
        push    ds
        if      FW_VERSION >= 312
        push    word P_5F0A
        elseif  FW_VERSION = 311
        push    word P_5F0A
        else
        push    word P_5F0A
        endif
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    18h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    4
        push    ds
        if      FW_VERSION >= 312
        push    word L_5E6A+8
        elseif  FW_VERSION = 311
        push    word L_5DC0_V311+8
        else
        push    word L_581A_V308+8
        endif
        push    ds
        push    word B_826F
        push    ds
        push    word STR_5F0C
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        push    3dh
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_5F19
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_5F69
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_c69b8
loop_c6994:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jnz     br_c69b8
        push    ss
        lea     ax, [bp - 1ch]
        push    ax
        push    0ffffh
        push    word ptr [bp - 2]
        callf   SEG_E4D1:far_e4d15
        add     sp, 8
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_c69b8:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_c6994
        cmp     ax, 78h
        jz      br_c69d0
        jmp     br_c6ada
br_c69d0:
        mov     al, 0
        mov     byte ptr [B_8805], al
        cbw
        push    ax
        push    1
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        push    ds
        push    word B_8C41
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    word ptr [bp - 2]
        callf   SEG_E1E1:far_e1e11
        add     sp, 2
        mov     ax, word ptr [W_8281]
        mov     word ptr [bp - 4], ax
        mov     al, byte ptr [B_8289]
        mov     byte ptr [bp - 9], al
        mov     ax, word ptr [W_8283]
        mov     word ptr [bp - 6], ax
        mov     ax, word ptr [W_8285]
        mov     word ptr [bp - 8], ax
        mov     word ptr [W_8281], 1
        mov     byte ptr [B_8289], 0
        mov     word ptr [W_8283], 1
        push    word ptr [bp - 2]
        callf   SEG_E15E:far_e15e2
        add     sp, 2
        mov     ax, word ptr [bp - 4]
        mov     word ptr [W_8281], ax
        mov     al, byte ptr [bp - 9]
        mov     byte ptr [B_8289], al
        mov     ax, word ptr [bp - 6]
        mov     word ptr [W_8283], ax
        mov     ax, word ptr [bp - 8]
        mov     word ptr [W_8285], ax
        push    ss
        lea     ax, [bp - 2eh]
        push    ax
        push    0ffffh
        push    0
        callf   SEG_E4D1:far_e4d15
        add     sp, 8
        mov     ax, ss
        lea     si, [bp - 1ch]
        push    ss
        pop     es
        lea     di, [bp - 2eh]
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
        jz      br_c6a87
        sbb     ax, ax
        sbb     ax, 0ffffh
br_c6a87:
        or      ax, ax
        jz      br_c6a9f
        push    ss
        lea     ax, [bp - 1ch]
        push    ax
        push    0ffffh
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_E57C:far_e57c8
        add     sp, 8
br_c6a9f:
        mov     si, 1
        xor     dx, dx
loop_c6aa4:
        mov     byte ptr [si + TBL_90C1], 2
        mov     byte ptr [si + TBL_9125], dl
        inc     dl
        inc     si
        cmp     dl, 10h
        jnz     loop_c6aa4
        cmp     byte ptr [B_826F], 0
        jle     br_c6ace
        cmp     byte ptr [B_826F], 10h
        jg      br_c6ace
        mov     al, byte ptr [B_826F]
        cbw
        mov     bx, ax
        mov     byte ptr [bx + TBL_90C1], 6
br_c6ace:
        mov     byte ptr [B_A56E], 0
        nop
        push    cs
        call    far_c6ae0
        mov     dx, ax
br_c6ada:
        mov     ax, dx
        pop     di
        pop     si
        leave
        retf
far_c6ae0:
        push    bp
        mov     bp, sp
        sub     sp, 16h
        push    si
        push    ds
        push    word A_5EE6
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        mov     byte ptr [B_A570], 1
        mov     byte ptr [B_D4C2], 0
        mov     byte ptr [B_D5DD], 3
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        push    ds
        push    word STR_5F73
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        push    0ffffh
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_E4D1:far_e4d15
        add     sp, 8
        push    10h
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        push    ds
        push    word A_5F02
        callf   SEG_B347:far_b3471
        add     sp, 0ah
        mov     al, byte ptr [B_7FCA]
        cbw
        mov     word ptr [bp - 2], ax
        push    ax
        mov     al, byte ptr [B_7FCB]
        cbw
        mov     word ptr [bp - 4], ax
        inc     ax
        mov     dx, ax
        pop     ax
        imul    dx
        mov     si, ax
        push    word ptr [bp - 4]
        push    word ptr [bp - 2]
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
        if      FW_VERSION >= 312
        push    word P_5F04+4
        elseif  FW_VERSION = 311
        push    word P_5F04+4
        else
        push    word P_5F04+4
        endif
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
        push    ds
        push    word W_D659
        push    ds
        if      FW_VERSION >= 312
        push    word P_5EFD+3
        elseif  FW_VERSION = 311
        push    word P_5EFD+3
        else
        push    word P_5EFD+3
        endif
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    4
        push    ds
        push    word P_0050+8
        push    ds
        push    word B_7FCC
        push    ds
        push    word STR_5F7B
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_5F7E
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        push    3dh
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_5F9F
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_BF29:far_bffc9
        push    ds
        push    word STR_5FD8
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        xor     si, si
        jmp     br_c6ce5
br_c6c14:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     bx, ax
        cmp     bx, 3
        ja      loop_c6c9d
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c6d17]
tgt_c6c26:
        push    ss
        lea     ax, [bp - 16h]
        push    ax
        push    0ffffh
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_E57C:far_e57c8
        add     sp, 8
        jmp     loop_c6c9d
tgt_c6c3c:
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
        push    2
        callf   SEG_B05A:far_b1206
        add     sp, 6
        push    0
        callf   SEG_EA92:far_ea926
        add     sp, 2
        jmp     loop_c6c9d
tgt_c6c73:
        callf   SEG_BF29:far_bff70
        jmp     loop_c6c9d
tgt_c6c7a:
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
loop_c6c9d:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        or      ax, ax
        jnz     br_c6cb0
        jmp     near br_c6c14
br_c6cb0:
        cmp     ax, 2fh
        jz      br_c6cd9
        cmp     ax, 57h
        jz      br_c6cc6
        cmp     ax, 78h
        jz      br_c6cc1
        jmp     br_c6ce0
br_c6cc1:
        mov     si, 4dh
        jmp     br_c6ce5
br_c6cc6:
        callf   SEG_DD59:far_dd970
        if      FW_VERSION < 311
        mov     byte ptr [B_CEC6_V308], 0
        endif
        push    0
        callf   SEG_EA92:far_ea926
        add     sp, 2
        xor     si, si
        jmp     br_c6ce5
br_c6cd9:
        mov     byte ptr [B_D4C2], 1
        jmp     br_c6ce5
br_c6ce0:
        mov     byte ptr [B_D4C2], 4dh
br_c6ce5:
        or      si, si
        jz      loop_c6c9d
        callf   SEG_E6FE:far_e6fef
        mov     byte ptr [B_A570], 0
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
        pop     si
        leave
        retf
TBL_c6d17:
        dw      tgt_c6c26
        dw      tgt_c6c3c
        dw      tgt_c6c73
        dw      tgt_c6c7a
        if      FW_VERSION <> 311
        phase   0fh
        else
        phase   0bh
        endif
fn_c6d1f:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 312
        sub     sp, 0ah
        push    di
        mov     ax, word ptr [W_5FF4]
        mov     word ptr [bp - 0ah], ax
        mov     ax, word ptr [W_5FF6]
        mov     word ptr [bp - 8], ax
        mov     ax, word ptr [W_5FF8]
        mov     word ptr [bp - 6], ax
        mov     ax, word ptr [W_5FFA]
        mov     word ptr [bp - 4], ax
        mov     al, byte ptr [B_5FFC]
        mov     byte ptr [bp - 2], al
        mov     ax, word ptr [bp + 8]
        or      ax, word ptr [bp + 0ah]
        jz      br_c6da3
        mov     ax, word ptr [bp + 0ch]
        or      ax, word ptr [bp + 0eh]
        jz      br_c6da3
        push    ss
        pop     es
        lea     di, [bp - 0ah]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        dec     cx
        add     cx, 1dh
        push    cx
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    10h
        push    1
        push    2
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    ds
        push    word A_603D
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    1
        push    ds
        push    word P_5FDF+1
        push    word ptr [bp + 0eh]
        push    word ptr [bp + 0ch]
        push    ds
        push    word A_603D
        callf   SEG_B347:far_b362e
        add     sp, 0eh
br_c6da3:
        push    1dh
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     word ptr [bp + 6], 0
        jz      br_c6dc4
        push    0bh
        push    20h
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        pop     di
        leave
        retf
br_c6dc4:
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    4
        callf   SEG_B05A:far_b1073
        add     sp, 2
        pop     di
        leave
        retf
fn_c6de8:
        push    bp
        mov     bp, sp
        xor     ax, ax
        jmp     br_c6dff
loop_c6def:
        cmp     ax, 7
        jle     br_c6dfb
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], 20h
br_c6dfb:
        inc     ax
        inc     word ptr [bp + 6]
br_c6dff:
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx], 0
        jnz     loop_c6def
        pop     bp
        retf
fn_c6e0a:
        push    bp
        mov     bp, sp
        xor     ax, ax
        jmp     br_c6e28
loop_c6e11:
        cmp     ax, 7
        jle     br_c6e24
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx], 20h
        jz      br_c6e24
        mov     ax, 1
        pop     bp
        retf
br_c6e24:
        inc     ax
        inc     word ptr [bp + 6]
br_c6e28:
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx], 0
        jnz     loop_c6e11
        xor     ax, ax
        pop     bp
        retf
fn_c6e35:
        push    bp
        mov     bp, sp
        sub     sp, 2ah
        push    si
        push    di
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        push    20h
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        push    20h
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        cmp     word ptr [bp + 6], 0
        jnz     br_c6e76
        jmp     br_c6f59
br_c6e76:
        push    word ptr [bp + 10h]
        callf   SEG_EC44:far_ec5ca
        add     sp, 2
        mov     word ptr [bp - 2], ax
        push    ss
        pop     es
        lea     di, [bp - 2ah]
        push    es
        mov     es, word ptr [bp + 0ah]
        push    di
        mov     di, word ptr [bp + 8]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, word ptr [bp + 0ah]
        mov     si, word ptr [bp + 8]
        pop     di
        pop     es
        push    ds
        mov     ds, ax
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        push    ss
        lea     ax, [bp - 2ah]
        push    ax
        push    cs
        call    fn_c6de8
        add     sp, 4
        push    word ptr [bp + 0eh]
        push    word ptr [bp + 0ch]
        push    word ptr [W_6003]
        push    word ptr [W_6001]
        push    ss
        lea     ax, [bp - 2ah]
        push    ax
        nop
        push    cs
        call    far_c812b
        add     sp, 0ch
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    cs
        call    fn_c6e0a
        add     sp, 4
        or      ax, ax
        jz      br_c6f37
        push    0
        cmp     word ptr [bp - 2], 0
        jz      br_c6ef5
        mov     ax, 4
        jmp     br_c6ef8
br_c6ef5:
        mov     ax, 5
br_c6ef8:
        push    ax
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        push    word ptr [bp + 0eh]
        push    word ptr [bp + 0ch]
        callf   SEG_B52D:far_b6beb
        add     sp, 8
        push    ds
        push    word STR_604E
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    29h
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
br_c6f37:
        cmp     word ptr [bp - 2], 0
        jz      br_c6f75
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_6068
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        pop     di
        pop     si
        leave
        retf
br_c6f59:
        push    word ptr [bp + 0eh]
        push    word ptr [bp + 0ch]
        push    word ptr [W_5FFF]
        push    word ptr [W_5FFD]
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        nop
        push    cs
        call    far_c812b
        add     sp, 0ch
br_c6f75:
        pop     di
        pop     si
        leave
        retf
far_c6f79:
        push    bp
        mov     bp, sp
        sub     sp, 2f2h
        elseif  FW_VERSION = 311
        sub     sp, 0ah
        push    di
        mov     ax, word ptr [W_5FF4]
        mov     word ptr [bp - 0ah], ax
        mov     ax, word ptr [W_5FF6]
        mov     word ptr [bp - 8], ax
        mov     ax, word ptr [W_5FF8]
        mov     word ptr [bp - 6], ax
        mov     ax, word ptr [W_5FFA]
        mov     word ptr [bp - 4], ax
        mov     al, byte ptr [B_5FFC]
        mov     byte ptr [bp - 2], al
        mov     ax, word ptr [bp + 8]
        or      ax, word ptr [bp + 0ah]
        jz      br_c6da3
        mov     ax, word ptr [bp + 0ch]
        or      ax, word ptr [bp + 0eh]
        jz      br_c6da3
        push    ss
        pop     es
        lea     di, [bp - 0ah]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        dec     cx
        add     cx, 1dh
        push    cx
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    10h
        push    1
        push    2
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    ds
        push    word A_603D
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    1
        push    ds
        push    word P_5F35_V311+1
        push    word ptr [bp + 0eh]
        push    word ptr [bp + 0ch]
        push    ds
        push    word A_603D
        callf   SEG_B347:far_b362e
        add     sp, 0eh
br_c6da3:
        push    1dh
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     word ptr [bp + 6], 0
        jz      br_c6dc4
        push    0bh
        push    20h
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        pop     di
        leave
        retf
br_c6dc4:
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    4
        callf   SEG_B05A:far_b1073
        add     sp, 2
        pop     di
        leave
        retf
fn_c6de8:
        push    bp
        mov     bp, sp
        xor     ax, ax
        jmp     br_c6dff
loop_c6def:
        cmp     ax, 7
        jle     br_c6dfb
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], 20h
br_c6dfb:
        inc     ax
        inc     word ptr [bp + 6]
br_c6dff:
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx], 0
        jnz     loop_c6def
        pop     bp
        retf
fn_c6e0a:
        push    bp
        mov     bp, sp
        xor     ax, ax
        jmp     br_c6e28
loop_c6e11:
        cmp     ax, 7
        jle     br_c6e24
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx], 20h
        jz      br_c6e24
        mov     ax, 1
        pop     bp
        retf
br_c6e24:
        inc     ax
        inc     word ptr [bp + 6]
br_c6e28:
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx], 0
        jnz     loop_c6e11
        xor     ax, ax
        pop     bp
        retf
fn_c6e35:
        push    bp
        mov     bp, sp
        sub     sp, 2ah
        push    si
        push    di
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        push    20h
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        push    20h
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        cmp     word ptr [bp + 6], 0
        jnz     br_c6e76
        jmp     br_c6f59
br_c6e76:
        push    word ptr [bp + 10h]
        callf   SEG_EC44:far_ec5ca
        add     sp, 2
        mov     word ptr [bp - 2], ax
        push    ss
        pop     es
        lea     di, [bp - 2ah]
        push    es
        mov     es, word ptr [bp + 0ah]
        push    di
        mov     di, word ptr [bp + 8]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, word ptr [bp + 0ah]
        mov     si, word ptr [bp + 8]
        pop     di
        pop     es
        push    ds
        mov     ds, ax
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        push    ss
        lea     ax, [bp - 2ah]
        push    ax
        push    cs
        call    fn_c6de8
        add     sp, 4
        push    word ptr [bp + 0eh]
        push    word ptr [bp + 0ch]
        push    word ptr [W_6003]
        push    word ptr [W_6001]
        push    ss
        lea     ax, [bp - 2ah]
        push    ax
        nop
        push    cs
        call    far_c812b
        add     sp, 0ch
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    cs
        call    fn_c6e0a
        add     sp, 4
        or      ax, ax
        jz      br_c6f37
        push    0
        cmp     word ptr [bp - 2], 0
        jz      br_c6ef5
        mov     ax, 4
        jmp     br_c6ef8
br_c6ef5:
        mov     ax, 5
br_c6ef8:
        push    ax
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        push    word ptr [bp + 0eh]
        push    word ptr [bp + 0ch]
        callf   SEG_B52D:far_b6beb
        add     sp, 8
        push    ds
        push    word STR_604E
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    29h
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
br_c6f37:
        cmp     word ptr [bp - 2], 0
        jz      br_c6f75
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_6068
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        pop     di
        pop     si
        leave
        retf
br_c6f59:
        push    word ptr [bp + 0eh]
        push    word ptr [bp + 0ch]
        push    word ptr [W_5FFF]
        push    word ptr [W_5FFD]
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        nop
        push    cs
        call    far_c812b
        add     sp, 0ch
br_c6f75:
        pop     di
        pop     si
        leave
        retf
far_c6f79:
        push    bp
        mov     bp, sp
        sub     sp, 2f0h
        else
        sub     sp, 2f0h
        endif
        push    si
        push    di
        callf   SEG_B1AA:far_b1aac
        if      FW_VERSION >= 312
        mov     word ptr [bp - 0ch], 10h
        else
        mov     word ptr [bp - 0ah], 10h
        endif
        mov     al, byte ptr [bp + 6]
        mov     byte ptr [B_D5DD], al
        mov     bx, word ptr [bp + 6]
        dec     bx
        cmp     bx, 5
        jbe     br_c6f9e
        jmp     br_c745c
br_c6f9e:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c7e91]
tgt_c6fa5:
        push    ds
        push    word STR_613C
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        if      FW_VERSION < 311
        push    ss
        pop     es
        lea     di, [bp - 12h]
        mov     si, 59a0h
        mov     cx, 2
        rep movsw
        movsb
        endif
        mov     al, byte ptr [B_8A9F]
        cbw
        if      FW_VERSION >= 312
        mov     word ptr [bp - 8], ax
        else
        mov     word ptr [bp - 6], ax
        endif
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 26h]
        else
        lea     ax, [bp - 24h]
        endif
        push    ax
        push    0ffffh
        if      FW_VERSION >= 312
        push    word ptr [bp - 8]
        else
        push    word ptr [bp - 6]
        endif
        callf   SEG_E4D1:far_e4d15
        add     sp, 8
        push    0ah
        push    63h
        push    1
        push    2
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 8]
        else
        lea     ax, [bp - 6]
        endif
        push    ax
        push    ds
        push    word STR_614C
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    10h
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 26h]
        else
        lea     ax, [bp - 24h]
        endif
        push    ax
        push    ds
        push    word A_6151
        callf   SEG_B347:far_b3471
        add     sp, 0ah
        if      FW_VERSION >= 312
        push    word ptr [bp - 8]
        else
        push    word ptr [bp - 6]
        endif
        nop
        push    cs
        call    fn_c8000
        add     sp, 2
        mov     word ptr [bp - 4], ax
        if      FW_VERSION >= 312
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    10h
        push    ds
        push    word L_5FFD+8
        push    ds
        push    word B_6039
        push    ds
        push    word STR_6153
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    ds
        push    word B_603B
        push    ds
        push    word B_603A
        cmp     byte ptr [B_6039], 0
        jnz     br_c703a
        mov     ax, 1
        jmp     br_c703c
br_c703a:
        xor     ax, ax
br_c703c:
        push    ax
        push    cs
        call    fn_c6d1f
        add     sp, 0ah
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        elseif  FW_VERSION = 311
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    10h
        push    ds
        push    word L_5F53_V311+8
        push    ds
        push    word B_6039
        push    ds
        push    word STR_6153
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    ds
        push    word B_603B
        push    ds
        push    word B_603A
        cmp     byte ptr [B_6039], 0
        jnz     br_c703a
        mov     ax, 1
        jmp     br_c703c
br_c703a:
        xor     ax, ax
br_c703c:
        push    ax
        push    cs
        call    fn_c6d1f
        add     sp, 0ah
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        endif
        jmp     br_c745c
tgt_c7051:
        push    ds
        push    word STR_615C
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    ss
        pop     es
        if      FW_VERSION >= 312
        lea     di, [bp - 14h]
        mov     si, 6177h
        elseif  FW_VERSION = 311
        lea     di, [bp - 12h]
        mov     si, 60cdh
        else
        lea     di, [bp - 12h]
        mov     si, 59c7h
        endif
        mov     cx, 2
        rep movsw
        movsb
        cmp     byte ptr [TBL_9419], 0
        jnz     br_c7080
        push    ds
        pop     es
        mov     di, TBL_9419
        mov     si, STR_617C
        mov     cx, 4
        rep movsw
        movsb
br_c7080:
        mov     ax, ss
        if      FW_VERSION >= 312
        lea     si, [bp - 26h]
        else
        lea     si, [bp - 24h]
        endif
        push    ds
        pop     es
        mov     di, TBL_9419
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
        mov     ax, ss
        if      FW_VERSION >= 312
        lea     si, [bp - 3ch]
        else
        lea     si, [bp - 3ah]
        endif
        push    ds
        pop     es
        mov     di, TBL_9419
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
        if      FW_VERSION >= 312
        mov     al, byte ptr [bp - 0ch]
        else
        mov     al, byte ptr [bp - 0ah]
        endif
        push    ax
        push    ds
        push    word TBL_9419
        push    ds
        push    word A_6185
        callf   SEG_B347:far_b3471
        add     sp, 0ah
        nop
        push    cs
        call    fn_c803e
        mov     word ptr [bp - 4], ax
        jmp     br_c745c
tgt_c70f9:
        push    ds
        push    word STR_6190
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    ss
        pop     es
        if      FW_VERSION >= 312
        lea     di, [bp - 14h]
        mov     si, 619dh
        elseif  FW_VERSION = 311
        lea     di, [bp - 12h]
        mov     si, 60f3h
        else
        lea     di, [bp - 12h]
        mov     si, 59edh
        endif
        mov     cx, 2
        rep movsw
        movsb
        push    0
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 2f2h]
        else
        lea     ax, [bp - 2f0h]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 0eeh]
        else
        lea     ax, [bp - 0ech]
        endif
        push    ax
        if      FW_VERSION >= 311
        callf   0fba0h:far_fdcfb
        else
        callf   0bfd8h:far_fdcfb
        endif
        add     sp, 0ah
        if      FW_VERSION >= 312
        mov     word ptr [bp - 6], ax
        mov     byte ptr [bp - 0fh], 0
        else
        mov     byte ptr [bp - 0dh], 0
        endif
        push    10h
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 2f2h]
        else
        lea     ax, [bp - 2f0h]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 0fh]
        else
        lea     ax, [bp - 0dh]
        endif
        push    ax
        push    ds
        push    word STR_61A2
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        if      FW_VERSION >= 312
        cmp     word ptr [bp - 6], 0ffffh
        jz      L_c716b
        push    16h
        push    1
        mov     al, byte ptr [bp - 0fh]
        cbw
        lea     dx, [bp - 0eeh]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        callf   0fba0h:far_fcd4d
        add     sp, 6
L_c716b:
        mov     al, byte ptr [bp - 0fh]
        else
        mov     al, byte ptr [bp - 0dh]
        endif
        cbw
        shl     ax, 2
        if      FW_VERSION >= 312
        lea     dx, [bp - 2f2h]
        else
        lea     dx, [bp - 2f0h]
        endif
        add     ax, dx
        mov     bx, ax
        les     di, dword ptr ss:[bx]
        mov     ax, ss
        if      FW_VERSION >= 312
        lea     si, [bp - 26h]
        else
        lea     si, [bp - 24h]
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
        if      FW_VERSION >= 312
        mov     al, byte ptr [bp - 0fh]
        else
        mov     al, byte ptr [bp - 0dh]
        endif
        cbw
        if      FW_VERSION >= 312
        lea     dx, [bp - 0eeh]
        else
        lea     dx, [bp - 0ech]
        endif
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        nop
        push    cs
        call    far_c7e9d
        add     sp, 2
        mov     word ptr [bp - 4], ax
        jmp     br_c745c
tgt_c71c4:
        push    ds
        push    word STR_61A9
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    ss
        pop     es
        if      FW_VERSION >= 312
        lea     di, [bp - 14h]
        mov     si, 61b8h
        elseif  FW_VERSION = 311
        lea     di, [bp - 12h]
        mov     si, 610eh
        else
        lea     di, [bp - 12h]
        mov     si, 5a08h
        endif
        mov     cx, 2
        rep movsw
        movsb
        mov     al, byte ptr [B_E421]
        mov     ah, 0
        inc     ax
        if      FW_VERSION >= 312
        mov     word ptr [bp - 0ah], ax
        else
        mov     word ptr [bp - 8], ax
        endif
        push    8
        push    18h
        push    1
        push    2
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 0ah]
        else
        lea     ax, [bp - 8]
        endif
        push    ax
        push    ds
        push    word STR_61BD
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    ss
        pop     es
        if      FW_VERSION >= 312
        lea     di, [bp - 26h]
        else
        lea     di, [bp - 24h]
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
        if      FW_VERSION >= 312
        mov     al, byte ptr [bp - 0ch]
        else
        mov     al, byte ptr [bp - 0ah]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 26h]
        else
        lea     ax, [bp - 24h]
        endif
        push    ax
        push    ds
        push    word A_6151
        callf   SEG_B347:far_b3471
        add     sp, 0ah
        if      FW_VERSION >= 312
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    18h
        push    ds
        push    word P_600D+8
        push    ds
        push    word B_8439
        push    ds
        push    word A_61C6
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0bh
        push    ds
        push    word A_602D
        push    ds
        push    word B_843A
        push    ds
        push    word A_61CC
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        cmp     byte ptr [B_8439], 0
        jnz     br_c72a5
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
br_c72a5:
        elseif  FW_VERSION = 311
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    18h
        push    ds
        push    word P_5F63_V311+8
        push    ds
        push    word B_8439
        push    ds
        push    word A_61C6
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0bh
        push    ds
        push    word A_602D
        push    ds
        push    word B_843A
        push    ds
        push    word A_61CC
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        cmp     byte ptr [B_8439], 0
        jnz     br_c72a5
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
br_c72a5:
        endif
        nop
        push    cs
        call    fn_c7f20
        mov     word ptr [bp - 4], ax
        jmp     br_c745c
tgt_c72b0:
        push    ds
        push    word STR_61E9
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    ss
        pop     es
        if      FW_VERSION >= 312
        lea     di, [bp - 14h]
        mov     si, 6206h
        elseif  FW_VERSION = 311
        lea     di, [bp - 12h]
        mov     si, 615ch
        else
        lea     di, [bp - 12h]
        mov     si, 5a33h
        endif
        mov     cx, 2
        rep movsw
        movsb
        cmp     byte ptr [B_E410], 0
        jnz     br_c72df
        push    ds
        pop     es
        mov     di, B_E410
        mov     si, STR_620B
        mov     cx, 4
        rep movsw
        movsb
br_c72df:
        mov     ax, ss
        if      FW_VERSION >= 312
        lea     si, [bp - 26h]
        else
        lea     si, [bp - 24h]
        endif
        push    ds
        pop     es
        mov     di, B_E410
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
        mov     ax, ss
        if      FW_VERSION >= 312
        lea     si, [bp - 3ch]
        else
        lea     si, [bp - 3ah]
        endif
        push    ds
        pop     es
        mov     di, B_E410
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
        if      FW_VERSION >= 312
        mov     al, byte ptr [bp - 0ch]
        else
        mov     al, byte ptr [bp - 0ah]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 26h]
        else
        lea     ax, [bp - 24h]
        endif
        push    ax
        push    ds
        push    word A_6185
        callf   SEG_B347:far_b3471
        add     sp, 0ah
        if      FW_VERSION >= 312
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    1ah
        push    ds
        push    word P_601D+4
        push    ds
        push    word B_8439
        push    ds
        push    word A_61C6
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0bh
        push    ds
        push    word A_602D
        push    ds
        push    word B_843A
        push    ds
        push    word A_61CC
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        cmp     byte ptr [B_8439], 0
        jnz     br_c73af
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
br_c73af:
        elseif  FW_VERSION = 311
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    1ah
        push    ds
        push    word P_5F73_V311+4
        push    ds
        push    word B_8439
        push    ds
        push    word A_61C6
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0bh
        push    ds
        push    word A_602D
        push    ds
        push    word B_843A
        push    ds
        push    word A_61CC
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        cmp     byte ptr [B_8439], 0
        jnz     br_c73af
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
br_c73af:
        endif
        nop
        push    cs
        if      FW_VERSION >= 311
        call    fn_c7fd6
        else
        call    L_d129b
        endif
        mov     word ptr [bp - 4], ax
        jmp     near br_c745c
tgt_c73ba:
        push    ds
        push    word STR_6214
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        push    ss
        pop     es
        if      FW_VERSION >= 312
        lea     di, [bp - 14h]
        mov     si, 6224h
        elseif  FW_VERSION = 311
        lea     di, [bp - 12h]
        mov     si, 617ah
        else
        lea     di, [bp - 12h]
        mov     si, 5a51h
        endif
        mov     cx, 2
        rep movsw
        movsb
        cmp     byte ptr [TBL_9408], 0
        jnz     br_c73e9
        push    ds
        pop     es
        mov     di, TBL_9408
        mov     si, STR_6229
        mov     cx, 4
        rep movsw
        movsb
br_c73e9:
        mov     ax, ss
        if      FW_VERSION >= 312
        lea     si, [bp - 26h]
        else
        lea     si, [bp - 24h]
        endif
        push    ds
        pop     es
        mov     di, TBL_9408
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
        mov     ax, ss
        if      FW_VERSION >= 312
        lea     si, [bp - 3ch]
        else
        lea     si, [bp - 3ah]
        endif
        push    ds
        pop     es
        mov     di, TBL_9408
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
        if      FW_VERSION >= 312
        mov     al, byte ptr [bp - 0ch]
        else
        mov     al, byte ptr [bp - 0ah]
        endif
        push    ax
        push    ds
        push    word TBL_9408
        push    ds
        push    word A_6185
        callf   SEG_B347:far_b3471
        add     sp, 0ah
        mov     word ptr [bp - 4], 2
br_c745c:
        push    1dh
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_6232
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    22h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    5
        push    word ptr [bp - 4]
        callf   SEG_B347:far_b3b12
        add     sp, 6
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_623E
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        nop
        push    cs
        call    far_c80dc
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jge     br_c74c8
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     ax, 46h
        pop     di
        pop     si
        leave
        retf
br_c74c8:
        if      FW_VERSION >= 311
        cmp     word ptr [bp + 6], 1
        else
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     word ptr [bp + 6], 4
        jz      L_d0923
        cmp     word ptr [bp + 6], 5
        endif
        jnz     br_c74f3
        if      FW_VERSION >= 312
        push    word ptr [bp - 8]
        elseif  FW_VERSION = 311
        push    word ptr [bp - 6]
        else
L_d0923:
        cmp     byte ptr [B_7AC3], 0
        jnz     L_d097c
        mov     ax, word ptr [bp - 4]
        cmp     ax, word ptr [bp - 2]
        jle     L_d097c
        push    ds
        push    word STR_5A7B_V308
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    1
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     ax, word ptr [bp - 4]
        sub     ax, word ptr [bp - 2]
        mov     bx, 5a0h
        cwd
        idiv    bx
        inc     ax
        push    ax
        push    ds
        push    word STR_5AA4_V308
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        jmp     br_c74f3
L_d097c:
        push    ds
        push    word STR_5AA8_V308
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_c74f3:
        endif
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 3ch]
        else
        lea     ax, [bp - 3ah]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 26h]
        push    ax
        cmp     byte ptr [B_6039], 0
        jz      br_c74e7
        mov     ax, 1
        jmp     br_c74e9
br_c74e7:
        xor     ax, ax
br_c74e9:
        push    ax
        push    cs
        call    fn_c6e35
        add     sp, 0ch
        jmp     br_c750a
br_c74f3:
        push    ss
        lea     ax, [bp - 3ch]
        push    ax
        push    ss
        lea     ax, [bp - 14h]
        elseif  FW_VERSION = 311
        lea     ax, [bp - 24h]
        push    ax
        cmp     byte ptr [B_6039], 0
        jz      br_c74e7
        mov     ax, 1
        jmp     br_c74e9
br_c74e7:
        xor     ax, ax
br_c74e9:
        push    ax
        push    cs
        call    fn_c6e35
        add     sp, 0ch
        jmp     br_c750a
br_c74f3:
        push    ss
        lea     ax, [bp - 3ah]
        push    ax
        push    ss
        lea     ax, [bp - 12h]
        else
        lea     ax, [bp - 12h]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 26h]
        else
        lea     ax, [bp - 24h]
        endif
        push    ax
        nop
        push    cs
        call    far_c812b
        add     sp, 0ch
br_c750a:
        if      FW_VERSION >= 312
        xor     si, si
        else
        xor     di, di
        endif
        jmp     br_c7e5a
br_c750f:
        push    1dh
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_624E
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    word ptr [bp - 2]
        nop
        push    cs
        call    fn_c81e2
        add     sp, 2
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_6254
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        if      FW_VERSION >= 312
        mov     word ptr [bp - 0eh], 1
        cmp     byte ptr [B_7AD0], 0
        jz      br_c75af
        elseif  FW_VERSION = 311
        mov     word ptr [bp - 0ch], 1
        cmp     byte ptr [B_7AD0], 0
        jz      br_c75af
        else
        mov     word ptr [bp - 0ch], 1
        cmp     byte ptr [B_7AD0], 0
        jnz     L_d09f8
        jmp     br_c7a29
L_d09f8:
        endif
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_625C
        callf   SEG_B1AA:far_b1b05
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
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    1bh
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_6262
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        if      FW_VERSION >= 312
        mov     word ptr [bp - 0eh], 4
br_c75af:
        mov     al, byte ptr [B_D5DD]
        cbw
        push    ax
        mov     al, byte ptr [B_D5DE]
        cbw
        push    ax
        callf   SEG_B05A:far_b085e
        add     sp, 4
        mov     si, ax
        cmp     byte ptr [B_6039], 0
        jz      br_c75cd
        jmp     br_c7a29
br_c75cd:
        or      si, si
        jge     br_c75d4
        jmp     br_c7a29
br_c75d4:
        cmp     byte ptr [si + TBL_83F3], 3
        jge     br_c75de
        jmp     br_c7a29
br_c75de:
        mov     byte ptr [si + TBL_83F3], 0
        elseif  FW_VERSION = 311
        mov     word ptr [bp - 0ch], 4
br_c75af:
        mov     al, byte ptr [B_D5DD]
        cbw
        push    ax
        mov     al, byte ptr [B_D5DE]
        cbw
        push    ax
        callf   SEG_B05A:far_b085e
        add     sp, 4
        mov     si, ax
        cmp     byte ptr [B_6039], 0
        jz      br_c75cd
        jmp     br_c7a29
br_c75cd:
        or      si, si
        jge     br_c75d4
        jmp     br_c7a29
br_c75d4:
        cmp     byte ptr [si + TBL_83F3], 3
        jge     br_c75de
        jmp     br_c7a29
br_c75de:
        mov     byte ptr [si + TBL_83F3], 0
        else
        mov     word ptr [bp - 0ch], 4
        endif
        jmp     br_c7a29
br_c75e6:
        mov     bx, word ptr [bp + 6]
        dec     bx
        cmp     bx, 5
        jbe     br_c75f2
        jmp     br_c7a29
br_c75f2:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c7e85]
tgt_c75f9:
        mov     al, byte ptr [B_7B8D]
        cbw
        if      FW_VERSION >= 312
        mov     bx, ax
        cmp     bx, 4
        jbe     br_c7607
        jmp     br_c7a29
br_c7607:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c7e7b]
tgt_c760e:
        cmp     byte ptr [B_6039], 0
        jnz     br_c7629
        push    0
        push    0
        push    0
        push    0
        push    1
        push    cs
        call    fn_c6d1f
        add     sp, 0ah
        jmp     br_c7a29
br_c7629:
        mov     al, byte ptr [B_7B8D]
        push    ax
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_c7a29
tgt_c7638:
        push    word ptr [bp - 8]
        push    ss
        lea     ax, [bp - 3ch]
        push    ax
        push    ss
        lea     ax, [bp - 26h]
        push    ax
        cmp     byte ptr [B_6039], 0
        jz      br_c7651
        mov     ax, 1
        jmp     br_c7653
br_c7651:
        xor     ax, ax
br_c7653:
        push    ax
        push    cs
        call    fn_c6e35
        add     sp, 0ch
        push    0
        push    0
        push    0
        push    0
        cmp     byte ptr [B_6039], 0
        jnz     br_c766f
        mov     ax, 1
        jmp     br_c7671
br_c766f:
        xor     ax, ax
br_c7671:
        push    ax
        push    cs
        call    fn_c6d1f
        add     sp, 0ah
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        elseif  FW_VERSION = 311
        mov     bx, ax
        cmp     bx, 4
        jbe     br_c7607
        jmp     br_c7a29
br_c7607:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c7e7b]
tgt_c760e:
        cmp     byte ptr [B_6039], 0
        jnz     br_c7629
        push    0
        push    0
        push    0
        push    0
        push    1
        push    cs
        call    fn_c6d1f
        add     sp, 0ah
        jmp     br_c7a29
br_c7629:
        mov     al, byte ptr [B_7B8D]
        push    ax
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_c7a29
tgt_c7638:
        push    word ptr [bp - 6]
        push    ss
        lea     ax, [bp - 3ah]
        push    ax
        push    ss
        lea     ax, [bp - 24h]
        push    ax
        cmp     byte ptr [B_6039], 0
        jz      br_c7651
        mov     ax, 1
        jmp     br_c7653
br_c7651:
        xor     ax, ax
br_c7653:
        push    ax
        push    cs
        call    fn_c6e35
        add     sp, 0ch
        push    0
        push    0
        push    0
        push    0
        cmp     byte ptr [B_6039], 0
        jnz     br_c766f
        mov     ax, 1
        jmp     br_c7671
br_c766f:
        xor     ax, ax
br_c7671:
        push    ax
        push    cs
        call    fn_c6d1f
        add     sp, 0ah
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        else
        or      ax, ax
        jz      tgt_c7698
        cmp     ax, 1
        jz      tgt_c7686
        endif
        jmp     br_c7a29
tgt_c7686:
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 26h]
        else
        lea     ax, [bp - 24h]
        endif
        push    ax
        push    0ffffh
        if      FW_VERSION >= 312
        push    word ptr [bp - 8]
        else
        push    word ptr [bp - 6]
        endif
        callf   SEG_E57C:far_e57c8
        add     sp, 8
tgt_c7698:
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 26h]
        else
        lea     ax, [bp - 24h]
        endif
        push    ax
        push    0ffffh
        if      FW_VERSION >= 312
        push    word ptr [bp - 8]
        else
        push    word ptr [bp - 6]
        endif
        callf   SEG_E4D1:far_e4d15
        add     sp, 8
        if      FW_VERSION >= 312
        push    word ptr [bp - 8]
        elseif  FW_VERSION = 311
        push    word ptr [bp - 6]
        else
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        endif
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 3ch]
        else
        lea     ax, [bp - 3ah]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 26h]
        elseif  FW_VERSION = 311
        lea     ax, [bp - 24h]
        else
        lea     ax, [bp - 12h]
        push    ax
        push    ss
        lea     ax, [bp - 24h]
        endif
        push    ax
        if      FW_VERSION >= 311
        cmp     byte ptr [B_6039], 0
        jz      br_c76c3
        mov     ax, 1
        jmp     br_c76c5
br_c76c3:
        xor     ax, ax
br_c76c5:
        push    ax
        else
        nop
        endif
        push    cs
        if      FW_VERSION >= 311
        call    fn_c6e35
        else
        call    far_c812b
        endif
        add     sp, 0ch
        if      FW_VERSION >= 312
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    word ptr [bp - 8]
        elseif  FW_VERSION = 311
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    word ptr [bp - 6]
        else
        push    word ptr [bp - 6]
        endif
        nop
        push    cs
        call    fn_c8000
        add     sp, 2
        mov     word ptr [bp - 4], ax
        push    22h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    5
        push    word ptr [bp - 4]
        callf   SEG_B347:far_b3b12
        add     sp, 6
        jmp     br_c7a29
        if      FW_VERSION >= 311
fn_c7703:
        jmp     br_c7a29
        endif
tgt_c7706:
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 3ch]
        else
        lea     ax, [bp - 3ah]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 14h]
        else
        lea     ax, [bp - 12h]
        endif
        push    ax
        push    ds
        push    word TBL_9419
        nop
        push    cs
        call    far_c812b
        add     sp, 0ch
        push    22h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    5
        push    word ptr [bp - 4]
        callf   SEG_B347:far_b3b12
        add     sp, 6
        jmp     br_c7a29
        if      FW_VERSION >= 312
L_c773a:
        cmp     word ptr [bp - 6], 0ffffh
        jz      L_c775c
        push    16h
        push    1
        mov     al, byte ptr [bp - 0fh]
        cbw
        lea     dx, [bp - 0eeh]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        callf   0fba0h:far_fcd4d
        add     sp, 6
L_c775c:
        else
tgt_c75e1:
        endif
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 3ch]
        else
        lea     ax, [bp - 3ah]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 14h]
        else
        lea     ax, [bp - 12h]
        endif
        push    ax
        if      FW_VERSION >= 312
        mov     al, byte ptr [bp - 0fh]
        else
        mov     al, byte ptr [bp - 0dh]
        endif
        cbw
        if      FW_VERSION >= 312
        lea     dx, [bp - 0eeh]
        else
        lea     dx, [bp - 0ech]
        endif
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        add     ax, 4800h
        push    word SEG_A28F
        push    ax
        nop
        push    cs
        call    far_c812b
        add     sp, 0ch
        if      FW_VERSION >= 312
        mov     al, byte ptr [bp - 0fh]
        else
        mov     al, byte ptr [bp - 0dh]
        endif
        cbw
        if      FW_VERSION >= 312
        lea     dx, [bp - 0eeh]
        else
        lea     dx, [bp - 0ech]
        endif
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        nop
        push    cs
        call    far_c7e9d
        add     sp, 2
        mov     word ptr [bp - 4], ax
        push    22h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    5
        push    word ptr [bp - 4]
        callf   SEG_B347:far_b3b12
        add     sp, 6
        jmp     br_c7a29
tgt_c77c4:
        mov     al, byte ptr [B_7B8D]
        cbw
        if      FW_VERSION >= 311
        mov     bx, ax
        cmp     bx, 3
        jbe     br_c77d2
        else
        or      ax, ax
        jz      tgt_c7808
        cmp     ax, 1
        jz      tgt_c77d9
        endif
        jmp     br_c7a29
        if      FW_VERSION >= 311
br_c77d2:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c7e73]
        endif
tgt_c77d9:
        push    ss
        pop     es
        if      FW_VERSION >= 312
        lea     di, [bp - 26h]
        else
        lea     di, [bp - 24h]
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
tgt_c7808:
        if      FW_VERSION >= 312
        mov     ax, word ptr [bp - 0ah]
        else
        mov     ax, word ptr [bp - 8]
        endif
        dec     ax
        push    ax
        callf   SEG_C495:far_c6547
        add     sp, 2
        push    ss
        pop     es
        if      FW_VERSION >= 312
        lea     di, [bp - 26h]
        else
        lea     di, [bp - 24h]
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
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 3ch]
        else
        lea     ax, [bp - 3ah]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 14h]
        else
        lea     ax, [bp - 12h]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 26h]
        else
        lea     ax, [bp - 24h]
        endif
        push    ax
        nop
        push    cs
        call    far_c812b
        add     sp, 0ch
        push    22h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        nop
        push    cs
        call    fn_c7f20
        mov     word ptr [bp - 4], ax
        push    0
        push    5
        push    ax
        callf   SEG_B347:far_b3b12
        add     sp, 6
        if      FW_VERSION >= 311
        jmp     br_c7a29
tgt_c7889:
        endif
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION >= 311
        cmp     byte ptr [B_8439], 0
        jz      br_c78b4
        else
        cmp     byte ptr [B_7AC3], 0
        jnz     L_d0c9c
        mov     ax, word ptr [bp - 4]
        cmp     ax, word ptr [bp - 2]
        jle     L_d0c9c
        endif
        push    ds
        push    word A_61CC
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        if      FW_VERSION >= 311
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_c78be
br_c78b4:
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
br_c78be:
        push    22h
        endif
        push    1
        if      FW_VERSION < 311
        push    4
        endif
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION >= 311
        nop
        push    cs
        call    fn_c7f20
        mov     word ptr [bp - 4], ax
        else
        mov     ax, word ptr [bp - 4]
        sub     ax, word ptr [bp - 2]
        mov     bx, 5a0h
        cwd
        idiv    bx
        inc     ax
        push    ax
        push    ds
        push    word STR_5AA4_V308
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
        endif
        push    0
        push    5
        if      FW_VERSION >= 311
        push    ax
        callf   SEG_B347:far_b3b12
        add     sp, 6
        jmp     br_c7a29
tgt_c78e2:
        cmp     byte ptr [B_8439], 0
        jz      br_c78ec
        jmp     br_c7a29
br_c78ec:
        push    0
        push    4
        endif
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        if      FW_VERSION >= 311
        jmp     br_c7a29
fn_c7905:
        jmp     br_c7a29
tgt_c7908:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jz      br_c7920
        cmp     ax, 1
        jz      br_c7981
        cmp     ax, 2
        jnz     br_c791d
        jmp     near br_c79d9
br_c791d:
        jmp     br_c7a29
br_c7920:
        else
        jmp     near br_c7a29
L_d0c9c:
        push    ds
        push    word STR_5AA8_V308
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     near br_c7a29
L_d0cab:
        endif
        push    ss
        pop     es
        if      FW_VERSION >= 312
        lea     di, [bp - 26h]
        else
        lea     di, [bp - 24h]
        endif
        mov     ax, ds
        mov     si, B_E410
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
        if      FW_VERSION >= 312
        lea     ax, [bp - 3ch]
        else
        lea     ax, [bp - 3ah]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 14h]
        else
        lea     ax, [bp - 12h]
        endif
        push    ax
        push    ds
        push    word B_E410
        nop
        push    cs
        call    far_c812b
        add     sp, 0ch
        push    22h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    5
        push    word ptr [bp - 4]
        callf   SEG_B347:far_b3b12
        add     sp, 6
        if      FW_VERSION >= 311
        jmp     near br_c7a29
br_c7981:
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     byte ptr [B_8439], 0
        jz      br_c79ac
        push    ds
        push    word A_61CC
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_c79b6
br_c79ac:
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
br_c79b6:
        push    22h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        nop
        push    cs
        call    fn_c7fd6
        mov     word ptr [bp - 4], ax
        push    0
        push    5
        push    ax
        callf   SEG_B347:far_b3b12
        add     sp, 6
        jmp     br_c7a29
br_c79d9:
        cmp     byte ptr [B_8439], 0
        jnz     br_c7a29
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        endif
        jmp     br_c7a29
tgt_c79f8:
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 3ch]
        else
        lea     ax, [bp - 3ah]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 14h]
        else
        lea     ax, [bp - 12h]
        endif
        push    ax
        push    ds
        push    word TBL_9408
        nop
        push    cs
        call    far_c812b
        add     sp, 0ch
        push    22h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    5
        push    word ptr [bp - 4]
        callf   SEG_B347:far_b3b12
        add     sp, 6
br_c7a29:
        if      FW_VERSION >= 312
        mov     ax, word ptr [bp - 0eh]
        add     ax, 40h
        elseif  FW_VERSION = 311
        mov     ax, word ptr [bp - 0ch]
        add     ax, 40h
        else
        mov     al, byte ptr [bp - 0ch]
        add     al, 40h
        endif
        push    ax
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        if      FW_VERSION >= 312
        mov     si, ax
        else
        mov     di, ax
        endif
        or      ax, ax
        jnz     br_c7a41
        jmp     br_c75e6
br_c7a41:
        cmp     ax, 75h
        jz      br_c7a67
        jg      br_c7a55
        cmp     ax, 44h
        jz      br_c7a8c
        cmp     ax, 4eh
        jz      br_c7a8c
        jmp     br_c7b5b
br_c7a55:
        cmp     ax, 79h
        jz      br_c7a62
        cmp     ax, 7ah
        jz      br_c7a62
        jmp     br_c7b5b
br_c7a62:
        if      FW_VERSION >= 312
        xor     si, si
        else
        xor     di, di
        endif
        jmp     br_c7b5b
br_c7a67:
        callf   SEG_B52D:far_b60ee
        if      FW_VERSION >= 312
        mov     si, ax
        or      si, si
        else
        mov     di, ax
        or      di, di
        endif
        jz      br_c7a75
        jmp     br_c7b5b
br_c7a75:
        mov     al, byte ptr [bp + 6]
        add     al, 30h
        push    ax
        callf   SEG_D79E:far_d7a63
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        if      FW_VERSION >= 312
        mov     si, ax
        else
        mov     di, ax
        endif
        jmp     br_c7b5b
br_c7a8c:
        if      FW_VERSION >= 312
        xor     si, si
        else
        xor     di, di
        endif
        cmp     word ptr [bp + 6], 3
        jz      br_c7a97
        jmp     near br_c7b5b
br_c7a97:
        mov     al, byte ptr [B_D4C0]
        cbw
        mov     cx, ax
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        cmp     byte ptr es:[bx - 30ah], 0ffh
        jnz     br_c7ab3
        jmp     near br_c7b5b
br_c7ab3:
        mov     ax, A_2F7A
        or      ax, ax
        ja      br_c7abd
        jmp     near br_c7b5b
br_c7abd:
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 0eeh]
        else
        lea     ax, [bp - 0ech]
        endif
        push    ax
        push    cx
        callf   SEG_C495:far_c529a
        add     sp, 6
        cmp     ax, 0ffffh
        jnz     br_c7ad4
        jmp     near br_c7b5b
br_c7ad4:
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 0eeh]
        else
        lea     ax, [bp - 0ech]
        endif
        push    ax
        mov     al, byte ptr [B_D4C0]
        cbw
        push    ax
        callf   SEG_C495:far_c529a
        add     sp, 6
        dec     al
        if      FW_VERSION >= 312
        mov     byte ptr [bp - 0fh], al
        else
        mov     byte ptr [bp - 0dh], al
        endif
        push    0
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 3ch]
        else
        lea     ax, [bp - 3ah]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 14h]
        else
        lea     ax, [bp - 12h]
        endif
        push    ax
        if      FW_VERSION >= 312
        mov     al, byte ptr [bp - 0fh]
        else
        mov     al, byte ptr [bp - 0dh]
        endif
        cbw
        if      FW_VERSION >= 312
        lea     dx, [bp - 0eeh]
        else
        lea     dx, [bp - 0ech]
        endif
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        add     ax, 4800h
        push    word SEG_A28F
        push    ax
        nop
        push    cs
        call    far_c812b
        add     sp, 0ch
        if      FW_VERSION >= 312
        mov     al, byte ptr [bp - 0fh]
        else
        mov     al, byte ptr [bp - 0dh]
        endif
        cbw
        if      FW_VERSION >= 312
        lea     dx, [bp - 0eeh]
        else
        lea     dx, [bp - 0ech]
        endif
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        nop
        push    cs
        call    far_c7e9d
        add     sp, 2
        mov     word ptr [bp - 4], ax
        push    22h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    5
        push    word ptr [bp - 4]
        callf   SEG_B347:far_b3b12
        add     sp, 6
br_c7b5b:
        if      FW_VERSION >= 312
        cmp     si, 78h
        else
        cmp     di, 78h
        endif
        jz      br_c7b63
        jmp     br_c7e5a
br_c7b63:
        if      FW_VERSION >= 312
        xor     si, si
        else
        xor     di, di
        endif
        cmp     word ptr [bp + 6], 4
        jnz     br_c7b70
        if      FW_VERSION >= 312
        mov     word ptr [bp - 4], 5
        else
        mov     word ptr [bp - 4], 4
        endif
br_c7b70:
        cmp     word ptr [bp + 6], 5
        jnz     br_c7b7b
        mov     word ptr [bp - 4], 2ah
br_c7b7b:
        cmp     word ptr [bp - 4], 0
        jnz     br_c7b84
        jmp     br_c7e5a
br_c7b84:
        callf   SEG_B1AA:far_b1af9
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 52h]
        else
        lea     ax, [bp - 50h]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 3ch]
        else
        lea     ax, [bp - 3ah]
        endif
        push    ax
        callf   SEG_B52D:far_b6beb
        add     sp, 8
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 52h]
        else
        lea     ax, [bp - 50h]
        endif
        push    ax
        push    ds
        push    word A_6270
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 6eh]
        else
        lea     ax, [bp - 6ch]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 3ch]
        else
        lea     ax, [bp - 3ah]
        endif
        push    ax
        callf   SEG_CAA9:far_cac0f
        add     sp, 8
        if      FW_VERSION >= 312
        mov     word ptr [bp - 6], ax
        else
        mov     si, ax
        endif
        or      ax, ax
        jge     br_c7be8
        jmp     br_c7cc7
br_c7be8:
        nop
        push    cs
        call    far_c80dc
        cwd
        push    ax
        push    dx
        push    0
        push    word 400h
        if      FW_VERSION >= 312
        mov     ax, word ptr [bp - 6bh]
        mov     dx, word ptr [bp - 6dh]
        else
        mov     ax, word ptr [bp - 69h]
        mov     dx, word ptr [bp - 6bh]
        endif
        add     dx, 3ffh
        adc     ax, 0
        push    ax
        push    dx
        callf   0f800h:far_fa0fe
        pop     bx
        pop     cx
        add     cx, ax
        adc     bx, dx
        mov     ax, word ptr [bp - 4]
        cwd
        cmp     bx, dx
        jg      br_c7c30
        jl      br_c7c1d
        cmp     cx, ax
        jnc     br_c7c30
br_c7c1d:
        push    word 0f900h
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_c7c30:
        push    0
        if      FW_VERSION < 311
        push    6
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_5B19_V308
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        endif
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word STR_627F
        elseif  FW_VERSION = 311
        push    word STR_627F
        else
        push    word STR_5B42_V308
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        nop
        push    cs
        call    fn_c820c
        or      ax, ax
        jz      br_c7c59
        callf   SEG_B1AA:far_b1aff
        jmp     br_c7e5a
br_c7c59:
        callf   SEG_B702:far_b90dd
        if      FW_VERSION >= 311
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        endif
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 52h]
        else
        lea     ax, [bp - 50h]
        endif
        push    ax
        push    ds
        push    word A_6270
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 3ch]
        else
        lea     ax, [bp - 3ah]
        endif
        push    ax
        callf   SEG_CAA9:far_cab5c
        add     sp, 4
        if      FW_VERSION >= 312
        mov     word ptr [bp - 6], ax
        else
        mov     si, ax
        endif
        or      ax, ax
        jz      br_c7cb4
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_c7cb4:
        nop
        push    cs
        call    far_c80dc
        mov     word ptr [bp - 2], ax
        push    ax
        nop
        push    cs
        call    fn_c81e2
        add     sp, 2
        jmp     br_c7ce1
br_c7cc7:
        if      FW_VERSION >= 312
        cmp     word ptr [bp - 6], 0fd00h
        else
        cmp     si, 0fd00h
        endif
        jz      br_c7ce1
        if      FW_VERSION >= 312
        push    word ptr [bp - 6]
        else
        push    si
        endif
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_c7ce1:
        mov     ax, word ptr [bp - 4]
        cmp     ax, word ptr [bp - 2]
        jle     br_c7cfc
        push    word 0f900h
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_c7cfc:
        inc     byte ptr [B_956A]
        mov     bx, word ptr [bp + 6]
        dec     bx
        cmp     bx, 5
        jbe     br_c7d0c
        jmp     br_c7e16
br_c7d0c:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c7e67]
tgt_c7d13:
        mov     al, byte ptr [B_8A9F]
        cbw
        if      FW_VERSION >= 312
        cmp     ax, word ptr [bp - 8]
        else
        cmp     ax, word ptr [bp - 6]
        endif
        jnz     br_c7d28
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
br_c7d28:
        if      FW_VERSION >= 312
        cmp     byte ptr [B_6039], 0
        jnz     br_c7d44
        push    word ptr [bp - 8]
        elseif  FW_VERSION = 311
        cmp     byte ptr [B_6039], 0
        jnz     br_c7d44
        push    word ptr [bp - 6]
        else
        push    word ptr [bp - 6]
        endif
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 3ch]
        else
        lea     ax, [bp - 3ah]
        endif
        push    ax
        callf   SEG_E8F6:far_e8f64
        add     sp, 6
        if      FW_VERSION >= 312
        mov     word ptr [bp - 6], ax
        jmp     br_c7d6b
br_c7d44:
        mov     al, byte ptr [B_603B]
        mov     ah, 0
        push    ax
        mov     al, byte ptr [B_603A]
        mov     ah, 0
        dec     ax
        push    ax
        mov     al, byte ptr [B_6039]
        mov     ah, 0
        dec     ax
        push    ax
        push    word ptr [bp - 8]
        push    ss
        lea     ax, [bp - 3ch]
        push    ax
        callf   SEG_EC44:far_ec643
        add     sp, 0ch
        mov     word ptr [bp - 6], ax
        elseif  FW_VERSION = 311
        mov     si, ax
        jmp     br_c7d6b
br_c7d44:
        mov     al, byte ptr [B_603B]
        mov     ah, 0
        push    ax
        mov     al, byte ptr [B_603A]
        mov     ah, 0
        dec     ax
        push    ax
        mov     al, byte ptr [B_6039]
        mov     ah, 0
        dec     ax
        push    ax
        push    word ptr [bp - 6]
        push    ss
        lea     ax, [bp - 3ah]
        push    ax
        callf   SEG_EC44:far_ec643
        add     sp, 0ch
        mov     si, ax
        else
        mov     si, ax
        endif
br_c7d6b:
        mov     al, byte ptr [B_8A9F]
        cbw
        if      FW_VERSION >= 312
        cmp     ax, word ptr [bp - 8]
        jz      br_c7d77
        jmp     near br_c7e16
br_c7d77:
        elseif  FW_VERSION = 311
        cmp     ax, word ptr [bp - 6]
        jz      br_c7d77
        jmp     near br_c7e16
br_c7d77:
        else
        cmp     ax, word ptr [bp - 6]
        jnz     L_d1063
        endif
        push    1
        if      FW_VERSION >= 312
        push    word ptr [bp - 8]
        else
        push    word ptr [bp - 6]
        endif
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        if      FW_VERSION < 311
L_d1063:
        push    0
        push    word ptr [bp - 6]
        callf   0d266h:L_d2667
        add     sp, 4
        endif
        jmp     near br_c7e16
tgt_c7d8b:
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 3ch]
        else
        lea     ax, [bp - 3ah]
        endif
        push    ax
        callf   SEG_E837:far_e8376
        add     sp, 4
        if      FW_VERSION >= 312
        mov     word ptr [bp - 6], ax
        else
        mov     si, ax
        endif
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        if      FW_VERSION < 311
        push    0
        push    0ffffh
        callf   0d266h:L_d2667
        add     sp, 4
        endif
        jmp     br_c7e16
tgt_c7dbc:
        if      FW_VERSION >= 312
        mov     al, byte ptr [bp - 0fh]
        else
        mov     al, byte ptr [bp - 0dh]
        endif
        cbw
        if      FW_VERSION >= 312
        lea     dx, [bp - 0eeh]
        else
        lea     dx, [bp - 0ech]
        endif
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        callf   SEG_E900:far_e9004
        add     sp, 2
        if      FW_VERSION >= 312
        mov     word ptr [bp - 6], ax
        else
        mov     si, ax
        endif
        jmp     br_c7e16
tgt_c7dda:
        if      FW_VERSION >= 312
        push    word ptr [bp - 0ah]
        else
        push    word ptr [bp - 8]
        endif
        callf   SEG_E869:far_e8695
        add     sp, 2
        if      FW_VERSION >= 312
        mov     word ptr [bp - 6], ax
        cmp     word ptr [bp - 6], 0
        else
        mov     si, ax
        or      si, si
        endif
        jle     br_c7e16
        if      FW_VERSION >= 312
        mov     si, word ptr [bp - 6]
        else
        mov     di, si
        endif
        jmp     br_c7e16
tgt_c7df3:
        callf   SEG_E869:far_e8a9f
        if      FW_VERSION >= 312
        mov     word ptr [bp - 6], ax
        cmp     word ptr [bp - 6], 0
        else
        mov     si, ax
        or      si, si
        endif
        jle     br_c7e16
        if      FW_VERSION >= 312
        mov     si, word ptr [bp - 6]
        else
        mov     di, si
        endif
        jmp     br_c7e16
tgt_c7e06:
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 3ch]
        else
        lea     ax, [bp - 3ah]
        endif
        push    ax
        callf   SEG_E85A:far_e85ab
        add     sp, 4
        if      FW_VERSION >= 312
        mov     word ptr [bp - 6], ax
        else
        mov     si, ax
        endif
br_c7e16:
        callf   SEG_D78B:far_d7903
        callf   SEG_D79E:far_d7a79
        dec     byte ptr [B_956A]
        if      FW_VERSION >= 312
        cmp     word ptr [bp - 6], 0
        else
        or      si, si
        endif
        jge     br_c7e3d
        if      FW_VERSION >= 312
        push    word ptr [bp - 6]
        else
        push    si
        endif
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_c7e3d:
        nop
        push    cs
        call    far_c80dc
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jge     br_c7e5a
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_c7e5a:
        if      FW_VERSION >= 312
        or      si, si
        else
        or      di, di
        endif
        jnz     br_c7e61
        jmp     br_c750f
br_c7e61:
        if      FW_VERSION >= 312
        mov     ax, si
        else
        mov     ax, di
        endif
        pop     di
        pop     si
        leave
        retf
TBL_c7e67:
        dw      tgt_c7d13
        dw      tgt_c7d8b
        dw      tgt_c7dbc
        dw      tgt_c7dda
        dw      tgt_c7df3
        dw      tgt_c7e06
        if      FW_VERSION >= 311
TBL_c7e73:
        dw      tgt_c7808
        dw      tgt_c77d9
        dw      tgt_c7889
        dw      tgt_c78e2
TBL_c7e7b:
        dw      tgt_c7698
        dw      tgt_c7686
        dw      tgt_c7638
        dw      tgt_c760e
        dw      tgt_c760e
        endif
TBL_c7e85:
        dw      tgt_c75f9
        dw      tgt_c7706
        if      FW_VERSION >= 312
        dw      L_c773a
        else
        dw      tgt_c75e1
        endif
        dw      tgt_c77c4
        if      FW_VERSION >= 311
        dw      tgt_c7908
        else
        dw      L_d0cab
        endif
        dw      tgt_c79f8
TBL_c7e91:
        dw      tgt_c6fa5
        dw      tgt_c7051
        dw      tgt_c70f9
        dw      tgt_c71c4
        dw      tgt_c72b0
        dw      tgt_c73ba
far_c7e9d:
        push    bp
        mov     bp, sp
        push    si
        mov     ax, word ptr [bp + 6]
        mov     dx, 24h
        imul    dx
        mov     si, ax
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        cmp     byte ptr es:[bx + 4800h], 0
        jnz     br_c7ebf
        xor     ax, ax
        pop     si
        pop     bp
        retf
br_c7ebf:
        mov     ax, SEG_A28F
        mov     es, ax
        cmp     byte ptr es:[si + 4813h], 1
        jnz     br_c7ef7
        push    0
        push    word 400h
        mov     ax, SEG_A28F
        mov     es, ax
        mov     dx, word ptr es:[si + 481eh]
        mov     ax, word ptr es:[si + 481ch]
        mov     cl, 2
        callf   0f800h:far_fa1ac
        add     ax, 3ffh
        adc     dx, 0
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        pop     si
        pop     bp
        retf
br_c7ef7:
        push    0
        push    word 400h
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[si + 481eh]
        mov     dx, word ptr es:[si + 481ch]
        shl     dx, 1
        rcl     ax, 1
        add     dx, 3ffh
        adc     ax, 0
        push    ax
        push    dx
        callf   0f800h:far_fa0fe
        pop     si
        pop     bp
        retf
fn_c7f20:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    si
        push    di
        if      FW_VERSION >= 312
        cmp     byte ptr [B_8439], 0
        jnz     br_c7f36
        mov     ax, 5
        pop     di
        pop     si
        leave
        retf
br_c7f36:
        elseif  FW_VERSION = 311
        cmp     byte ptr [B_8439], 0
        jnz     br_c7f36
        mov     ax, 4
        pop     di
        pop     si
        leave
        retf
br_c7f36:
        endif
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 0
        mov     word ptr [bp - 6], 0
        xor     si, si
loop_c7f47:
        xor     dx, dx
        mov     di, word ptr [FP_E40C]
        add     di, 3eh
        jmp     br_c7fa4
loop_c7f52:
        mov     es, word ptr [W_E40E]
        mov     al, byte ptr es:[di]
        mov     ah, 0
        cmp     ax, word ptr [bp - 6]
        jnz     br_c7fa0
        mov     ax, SEG_A28F
        mov     es, ax
        cmp     byte ptr es:[si + 4813h], 0
        jz      br_c7f85
        mov     ax, SEG_A28F
        mov     es, ax
        mov     dx, word ptr es:[si + 481eh]
        mov     ax, word ptr es:[si + 481ch]
        mov     cl, 2
        callf   0f800h:far_fa1ac
        jmp     br_c7f98
br_c7f85:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     dx, word ptr es:[si + 481eh]
        mov     ax, word ptr es:[si + 481ch]
        shl     ax, 1
        rcl     dx, 1
br_c7f98:
        add     word ptr [bp - 4], ax
        adc     word ptr [bp - 2], dx
        jmp     br_c7fa9
br_c7fa0:
        add     di, 18h
        inc     dx
br_c7fa4:
        cmp     dx, 40h
        jle     loop_c7f52
br_c7fa9:
        add     si, 24h
        inc     word ptr [bp - 6]
        cmp     word ptr [bp - 6], 80h
        jl      loop_c7f47
        push    0
        push    word 400h
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        add     dx, 3ffh
        adc     ax, 0
        push    ax
        push    dx
        callf   0f800h:far_fa0fe
        if      FW_VERSION >= 312
        add     ax, 5
        else
        add     ax, 4
        endif
        pop     di
        pop     si
        leave
        retf
        if      FW_VERSION >= 311
fn_c7fd6:
        cmp     byte ptr [B_8439], 0
        jnz     br_c7fe1
        mov     ax, 2eh
        retf
br_c7fe1:
        else
L_d129b:
        endif
        push    0
        push    word 400h
        callf   SEG_CC84:far_ccab3
        shl     ax, 1
        rcl     dx, 1
        add     ax, 3ffh
        adc     dx, 0
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        add     ax, 2eh
        retf
fn_c8000:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    word ptr [bp + 6]
        callf   SEG_E6CB:far_e6cb9
        add     sp, 2
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        or      ax, dx
        jz      br_c8023
        add     word ptr [bp - 4], 2
        adc     word ptr [bp - 2], 0
br_c8023:
        push    0
        push    word 400h
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        add     dx, 3ffh
        adc     ax, 0
        push    ax
        push    dx
        callf   0f800h:far_fa0fe
        leave
        retf
fn_c803e:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        push    di
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
        push    word ptr [W_8C3B]
        push    word ptr [W_8C39]
        push    word ptr [W_8C33]
        push    word ptr [W_8C31]
        callf   SEG_DA9B:far_daa07
        add     sp, 8
        add     ax, 8
        adc     dx, 0
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        xor     cx, cx
        mov     di, TBL_A7B0
loop_c808e:
        xor     dx, dx
        mov     si, di
loop_c8092:
        cmp     byte ptr [si], 0
        jz      br_c80b5
        or      dx, dx
        jnz     br_c80a3
        add     word ptr [bp - 4], 4
        adc     word ptr [bp - 2], 0
br_c80a3:
        add     word ptr [bp - 4], 2
        adc     word ptr [bp - 2], 0
        add     si, 2
        inc     dx
        cmp     dx, 0fah
        jl      loop_c8092
br_c80b5:
        add     di, 1f4h
        inc     cx
        cmp     cx, 14h
        jl      loop_c808e
        push    0
        push    word 400h
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        add     dx, 3ffh
        adc     ax, 0
        push    ax
        push    dx
        callf   0f800h:far_fa0fe
        pop     di
        pop     si
        leave
        retf
far_c80dc:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ss
        lea     ax, [bp - 4]
        push    ax
        callf   SEG_CAD0:far_cad50
        add     sp, 0ch
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jz      br_c810c
        leave
        retf
br_c810c:
        push    0
        push    word 400h
        mov     ax, word ptr [bp - 4]
        cwd
        push    ax
        mov     ax, word ptr [bp - 8]
        push    dx
        cwd
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        leave
        retf
far_c812b:
        push    bp
        mov     bp, sp
        sub     sp, 1ah
        push    si
        push    di
        mov     word ptr [bp - 2], 10h
        mov     ax, 10h
        add     ax, 4
        mov     word ptr [bp - 4], ax
        xor     si, si
        mov     di, word ptr [bp + 6]
loop_c8146:
        mov     es, word ptr [bp + 8]
        cmp     byte ptr es:[di], 20h
        jz      br_c816f
        cmp     byte ptr es:[di], 0
        jz      br_c816f
        mov     es, word ptr [bp + 8]
        mov     al, byte ptr es:[di]
        cbw
        push    ax
        callf   0f800h:far_fa274
        add     sp, 2
        mov     byte ptr [bp+si - 1ah], al
        inc     di
        inc     si
        cmp     si, word ptr [bp - 2]
        jl      loop_c8146
br_c816f:
        mov     byte ptr [bp+si - 1ah], 0
        mov     ax, ss
        lea     si, [bp - 1ah]
        les     di, dword ptr [bp + 0ah]
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
        push    cx
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        dec     di
        pop     cx
        rep movsb
        pop     ds
        push    ss
        pop     es
        lea     di, [bp - 1ah]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        dec     cx
        mov     si, cx
        cmp     si, word ptr [bp - 4]
        jge     br_c81c2
loop_c81b8:
        mov     byte ptr [bp+si - 1ah], 20h
        inc     si
        cmp     si, word ptr [bp - 4]
        jl      loop_c81b8
br_c81c2:
        lea     ax, [bp - 1ah]
        mov     bx, word ptr [bp - 4]
        add     bx, ax
        mov     byte ptr ss:[bx], 0
        push    word ptr [bp + 10h]
        push    word ptr [bp + 0eh]
        push    ss
        push    ax
        callf   SEG_B52D:far_b6aab
        add     sp, 8
        pop     di
        pop     si
        leave
        retf
fn_c81e2:
        push    bp
        mov     bp, sp
        push    22h
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    5
        push    word ptr [bp + 6]
        callf   SEG_B347:far_b3b12
        add     sp, 6
        push    4bh
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        pop     bp
        retf
fn_c820c:
        mov     dl, 0
        jmp     br_c8217
loop_c8210:
        callf   SEG_D79E:far_d79ee
        mov     dl, al
br_c8217:
        if      FW_VERSION >= 311
        cmp     dl, 7ah
        else
        cmp     dl, 78h
        endif
        jz      br_c8221
        if      FW_VERSION >= 311
        cmp     dl, 75h
        else
        cmp     dl, 79h
        endif
        jnz     loop_c8210
br_c8221:
        if      FW_VERSION >= 311
        cmp     dl, 75h
        else
        cmp     dl, 79h
        endif
        jnz     br_c822a
        mov     ax, 1
        retf
br_c822a:
        xor     ax, ax
        retf
        if      FW_VERSION >= 312
        phase   0dh
        elseif  FW_VERSION = 311
        phase   0ch
        else
        phase   7
        endif
far_c822d:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    si
        mov     word ptr [bp - 2], 1
        mov     word ptr [bp - 4], 2
        callf   SEG_B1AA:far_b1aac
        push    ds
        push    word STR_62A8
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_62BB
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b9102
        callf   SEG_B05A:far_b05a7
        mov     al, byte ptr [B_8A9F]
        mov     byte ptr [bp - 5], al
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
        push    word STR_62E3
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0fh
        push    1
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        callf   SEG_B702:far_b8f3e
        add     sp, 6
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ds
        push    word STR_62F1
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0fh
        push    2
        push    word ptr [bp - 2]
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        callf   SEG_B702:far_b9073
        add     sp, 8
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    63h
        push    1
        push    2
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ds
        push    word STR_62FF
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0fh
        push    3
        push    word ptr [bp - 4]
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        callf   SEG_B702:far_b9073
        add     sp, 8
        xor     dx, dx
        jmp     br_c8423
loop_c8324:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jz      br_c8338
        cmp     ax, 1
        jz      br_c835d
        cmp     ax, 2
        jz      br_c8373
        jmp     br_c8387
br_c8338:
        push    0fh
        push    1
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        callf   SEG_B702:far_b8f3e
        add     sp, 6
        push    0fh
        push    3
        push    word ptr [bp - 4]
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        callf   SEG_B702:far_b9073
        add     sp, 8
br_c835d:
        push    0fh
        push    2
        push    word ptr [bp - 2]
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        callf   SEG_B702:far_b9073
        add     sp, 8
        jmp     br_c8387
br_c8373:
        push    0fh
        push    3
        push    word ptr [bp - 4]
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        callf   SEG_B702:far_b9073
        add     sp, 8
br_c8387:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      loop_c8324
        cmp     dx, 78h
        jz      br_c839f
        jmp     near br_c8423
br_c839f:
        push    0
        mov     al, byte ptr [bp - 5]
        cbw
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        cmp     ax, 0ffffh
        jnz     br_c83bb
        xor     dx, dx
        jmp     br_c8423
br_c83bb:
        mov     bx, word ptr [bp - 2]
        mov     al, byte ptr [bx + TBL_905D]
        cbw
        mov     dx, ax
        mov     ax, word ptr [bp - 2]
        cmp     ax, word ptr [bp - 4]
        jge     br_c83ed
        mov     si, word ptr [bp - 2]
        inc     si
        cmp     si, word ptr [bp - 4]
        jge     br_c83e4
loop_c83d6:
        mov     al, byte ptr [si + TBL_905D]
        mov     byte ptr [si + TBL_905C], al
        inc     si
        cmp     si, word ptr [bp - 4]
        jl      loop_c83d6
br_c83e4:
        mov     bx, word ptr [bp - 4]
        mov     byte ptr [bx + TBL_905C], dl
        jmp     br_c8410
br_c83ed:
        mov     ax, word ptr [bp - 2]
        cmp     ax, word ptr [bp - 4]
        jle     br_c8410
        mov     si, word ptr [bp - 2]
        dec     si
        jmp     br_c8404
loop_c83fb:
        mov     al, byte ptr [si + TBL_905D]
        mov     byte ptr [si + TBL_905E], al
        dec     si
br_c8404:
        cmp     si, word ptr [bp - 4]
        jge     loop_c83fb
        mov     bx, word ptr [bp - 4]
        mov     byte ptr [bx + TBL_905D], dl
br_c8410:
        mov     al, byte ptr [B_8A9A]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_905D]
        mov     byte ptr [B_8A9C], al
        if      FW_VERSION < 311
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
        endif
        mov     al, byte ptr [B_D5DE]
        cbw
        mov     dx, ax
br_c8423:
        or      dx, dx
        jnz     br_c842a
        jmp     near br_c8387
br_c842a:
        mov     ax, dx
        pop     si
        leave
        retf
        if      FW_VERSION >= 312
        phase   0fh
        elseif  FW_VERSION = 311
        phase   0eh
        else
        phase   8
        endif
far_c842f:
        push    bp
        mov     bp, sp
        sub     sp, 5e8h
        push    si
        push    di
        push    ds
        push    word STR_6376
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        lea     ax, [bp - 5e8h]
        mov     word ptr [W_D4A8], ss
        mov     word ptr [W_D4A6], ax
        mov     ax, word ptr [W_9053]
        mov     dx, word ptr [W_9051]
        mov     word ptr [W_F229], ax
        mov     word ptr [W_F227], dx
        cmp     byte ptr [B_901B], 0
        jz      br_c8485
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_E49B:far_e49b0
        add     sp, 2
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        or      ax, ax
        jz      br_c8485
        mov     ax, 4dh
        pop     di
        pop     si
        leave
        retf
br_c8485:
        mov     al, byte ptr [B_7FD3]
        mov     byte ptr [bp - 8], al
        mov     byte ptr [B_7FD3], 0
        mov     word ptr [W_9053], 0
        callf   SEG_DEEA:far_deeab
        push    word ptr [W_F229]
        push    word ptr [W_F227]
        callf   SEG_E561:far_e5612
        add     sp, 4
        cmp     byte ptr [B_7FE8], 0
        jnz     br_c84c6
        mov     al, byte ptr [B_8807]
        cbw
        or      ax, ax
        jnz     br_c84c6
        push    0
        push    7dh
        callf   SEG_E409:far_e4094
        add     sp, 4
br_c84c6:
        mov     al, byte ptr [B_D5DE]
        mov     byte ptr [B_D4C2], al
        mov     byte ptr [B_A5C0], 1
        mov     byte ptr [B_956D], 0
        push    1
        push    7
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        mov     al, byte ptr [B_7FEE]
        cbw
        mov     word ptr [bp - 6], ax
        cmp     byte ptr [B_7FE6], 0
        jz      br_c84f5
        mov     byte ptr [B_7FEE], 0
br_c84f5:
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    3eh
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        callf   SEG_BF29:far_bffc9
        nop
        push    cs
        call    fn_c88e3
        inc     byte ptr [B_956A]
        mov     al, byte ptr [B_8A9C]
        cbw
        push    ax
        callf   SEG_E4A1:far_e4a1d
        add     sp, 2
        mov     byte ptr [B_96EE], al
        nop
        push    cs
        call    fn_c8a20
        dec     byte ptr [B_956A]
        mov     word ptr [W_F225], 1
        mov     byte ptr [bp - 7], 0
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 0
        jmp     br_c888b
br_c8549:
        cmp     word ptr [bp - 2], 78h
        jz      br_c855b
        push    word ptr [W_F225]
        nop
        push    cs
        call    fn_c891b
        add     sp, 2
br_c855b:
        cmp     word ptr [bp - 2], 7ah
        jnz     br_c85a7
        mov     al, byte ptr [bp - 7]
        mov     byte ptr [B_7B8E], al
        jmp     br_c85a7
loop_c8569:
        callf   SEG_C8C5:far_c9197
        if      FW_VERSION < 311
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
        endif
        cmp     byte ptr [B_7B8D], 0
        jnz     br_c85a7
        mov     al, byte ptr [TBL_F779]
        mov     ah, 0
        and     ax, 0f8h
        cmp     ax, 98h
        jnz     br_c85a7
        callf   SEG_B05A:far_b05a7
        push    1
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [W_93F5]
        push    ds
        push    word TBL_F779
        push    word ptr [W_F225]
        callf   SEG_C8C5:far_c8d05
        add     sp, 8
br_c85a7:
        push    74h
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jz      loop_c8569
        mov     al, byte ptr [B_7FE8]
        cbw
        mov     si, ax
        inc     byte ptr [B_956A]
        mov     bx, word ptr [bp - 2]
        cmp     bx, 6dh
        jnz     br_c85cd
        jmp     br_c8887
br_c85cd:
        jg      br_c8604
        cmp     bx, 5bh
        jnz     br_c85d7
        jmp     tgt_c86b2
br_c85d7:
        jg      br_c85f1
        cmp     bx, 21h
        jnz     br_c85e1
        jmp     br_c8863
br_c85e1:
        cmp     bx, 44h
        jz      br_c8616
        cmp     bx, 51h
        jnz     br_c85ee
        jmp     br_c887d
br_c85ee:
        jmp     tgt_c8882
br_c85f1:
        cmp     bx, 5dh
        jnz     br_c85f9
        jmp     near tgt_c86a3
br_c85f9:
        cmp     bx, 5eh
        jnz     br_c8601
        jmp     br_c8870
br_c8601:
        jmp     tgt_c8882
br_c8604:
        sub     bx, 75h
        cmp     bx, 8
        jbe     br_c860f
        jmp     tgt_c8882
br_c860f:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c88d1]
br_c8616:
        callf   SEG_E2CE:far_e2ce3
        mov     word ptr [W_96F8], dx
        mov     word ptr [W_96F6], ax
        or      dx, dx
        jg      br_c8635
        jl      br_c862d
        cmp     ax, 190h
        jnc     br_c8635
br_c862d:
        or      byte ptr [B_9457], 4
        jmp     br_c8887
br_c8635:
        cmp     word ptr [W_93F5], 1
        jz      br_c8641
        nop
        push    cs
        call    fn_c8bea
br_c8641:
        mov     al, byte ptr [B_8A9C]
        mov     byte ptr [B_8A9B], al
        callf   SEG_DB27:far_db274
        callf   SEG_DAD8:far_dad87
        callf   SEG_DE41:far_de41c
        if      FW_VERSION >= 311
        mov     al, byte ptr [B_F77B]
        mov     byte ptr [B_D4C0], al
        endif
        cmp     word ptr [W_93F5], 1
        jnz     br_c866b
        mov     byte ptr [TBL_F779], 0ffh
        jmp     br_c8887
br_c866b:
        mov     al, byte ptr [B_8A9C]
        cbw
        mov     bx, ax
        or      byte ptr [bx + TBL_90C1], 2
        if      FW_VERSION < 311
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
        endif
        mov     al, byte ptr [B_7FE6]
        cbw
        or      ax, ax
        jnz     br_c8681
        jmp     br_c8887
br_c8681:
        callf   SEG_DB21:far_db216
        or      ax, ax
        jz      br_c868d
        jmp     br_c8887
br_c868d:
        cmp     byte ptr [B_D4BD], 0
        jnz     br_c8697
        jmp     br_c8887
br_c8697:
        mov     byte ptr [B_D4BD], 0
        mov     word ptr [bp - 2], 7dh
        xor     si, si
tgt_c86a3:
        cmp     word ptr [W_93F5], 1
        jnz     br_c86ad
        jmp     br_c8887
br_c86ad:
        nop
        push    cs
        call    fn_c8bea
tgt_c86b2:
        cmp     word ptr [W_93F5], 0
        jz      br_c86cb
        push    0
        push    word ptr [W_93F5]
        push    ds
        push    word TBL_F779
        callf   SEG_DBE6:far_dbe67
        add     sp, 8
br_c86cb:
        or      si, si
        jz      br_c8701
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     word ptr [bp - 2], 7bh
        jnz     br_c86ef
        push    ds
        push    word STR_6380
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_c8701
br_c86ef:
        cmp     word ptr [bp - 2], 7dh
        jnz     br_c8701
        push    ds
        push    word STR_63A9
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_c8701:
        callf   SEG_DAF5:far_daf5c
        push    si
        mov     al, byte ptr [bp - 2]
        push    ax
        callf   SEG_E409:far_e4094
        add     sp, 4
        mov     ax, word ptr [W_9053]
        mov     dx, word ptr [W_9051]
        mov     word ptr [W_F229], ax
        mov     word ptr [W_F227], dx
        cmp     word ptr [bp - 2], 44h
        jz      br_c872c
        callf   SEG_DB00:far_db00c
br_c872c:
        nop
        push    cs
        call    fn_c8a20
        mov     word ptr [W_F225], 1
        nop
        push    cs
        call    fn_c88e3
        jmp     br_c8887
tgt_c873f:
        cmp     word ptr [W_93F5], 1
        jnz     br_c8749
        jmp     br_c8887
br_c8749:
        cmp     word ptr [W_9053], 3e7h
        jle     br_c8754
        jmp     br_c8887
br_c8754:
        nop
        push    cs
        call    fn_c8bea
        cmp     byte ptr [B_7FE7], 0
        jz      br_c878b
        cmp     word ptr [W_CEC4], 0
        jnz     br_c876a
        jmp     br_c8887
br_c876a:
        nop
        push    cs
        call    fn_c8bea
        push    ds
        pop     es
        mov     di, TBL_F779
        mov     si, A_CEC6
        mov     cx, word ptr [W_CEC4]
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        mov     ax, word ptr [W_CEC4]
        mov     word ptr [W_93F5], ax
        jmp     br_c87a5
br_c878b:
        nop
        push    cs
        call    fn_c8bea
        push    ds
        push    word TBL_F779
        mov     al, byte ptr [B_7FE5]
        mov     ah, 0
        push    ax
        callf   SEG_C8C5:far_c8c5d
        add     sp, 6
        mov     word ptr [W_93F5], ax
br_c87a5:
        push    word ptr [W_F225]
        callf   SEG_DBE6:far_dc861
        add     sp, 2
        push    word ptr [W_F225]
        nop
        push    cs
        call    fn_c8980
        add     sp, 2
        mov     al, byte ptr [B_8A9C]
        cbw
        mov     bx, ax
        or      byte ptr [bx + TBL_90C1], 2
        if      FW_VERSION < 311
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
        endif
        jmp     near br_c8887
tgt_c87cb:
        cmp     byte ptr [B_7FE7], 0
        jz      br_c87ec
        push    ds
        pop     es
        mov     di, A_CEC6
        mov     si, TBL_F779
        mov     cx, word ptr [W_93F5]
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        mov     ax, word ptr [W_93F5]
        mov     word ptr [W_CEC4], ax
br_c87ec:
        cmp     word ptr [W_93F5], 1
        if      FW_VERSION >= 311
        jnz     br_c87f6
        jmp     near br_c8887
br_c87f6:
        else
        jz      L_d1ae9
        endif
        mov     word ptr [W_93F5], 0
        if      FW_VERSION < 311
L_d1ae9:
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
        endif
        jmp     near br_c8887
tgt_c87ff:
        mov     al, byte ptr [B_7B8D]
        mov     byte ptr [bp - 7], al
        push    word ptr [W_93F5]
        push    ds
        push    word TBL_F779
        callf   SEG_DD9B:far_dd9ba
        add     sp, 6
        callf   SEG_DE41:far_de41c
        jmp     br_c8887
tgt_c881c:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0
        push    word ptr [W_F229]
        push    word ptr [W_F227]
        nop
        push    cs
        call    fn_c8c0a
        add     sp, 6
        dec     byte ptr [B_956A]
        nop
        push    cs
        call    fn_c8a31
        mov     word ptr [bp - 2], ax
        mov     al, byte ptr [bp - 6]
        mov     byte ptr [B_7FEE], al
        mov     al, byte ptr [bp - 8]
        mov     byte ptr [B_7FD3], al
        mov     ax, word ptr [bp - 2]
        pop     di
        pop     si
        leave
        retf
br_c8863:
        cmp     word ptr [W_93F5], 0
        jz      br_c8887
        inc     word ptr [W_F225]
        jmp     br_c8887
br_c8870:
        cmp     word ptr [W_F225], 1
        jle     br_c8887
        dec     word ptr [W_F225]
        jmp     br_c8887
br_c887d:
        mov     word ptr [bp - 2], 4dh
tgt_c8882:
        mov     word ptr [bp - 4], 1
br_c8887:
        dec     byte ptr [B_956A]
br_c888b:
        cmp     word ptr [bp - 4], 0
        jnz     br_c8894
        jmp     br_c8549
br_c8894:
        cmp     word ptr [bp - 2], 53h
        jnz     br_c889f
        mov     ax, 1
        jmp     br_c88a1
br_c889f:
        xor     ax, ax
br_c88a1:
        push    ax
        push    word ptr [W_F229]
        push    word ptr [W_F227]
        nop
        push    cs
        call    fn_c8c0a
        add     sp, 6
        mov     al, byte ptr [bp - 6]
        mov     byte ptr [B_7FEE], al
        push    0
        push    0
        callf   SEG_DA7E:far_da8cb
        add     sp, 4
        mov     al, byte ptr [bp - 8]
        mov     byte ptr [B_7FD3], al
        mov     ax, word ptr [bp - 2]
        pop     di
        pop     si
        leave
        retf
TBL_c88d1:
        dw      tgt_c881c
        dw      tgt_c8882
        dw      tgt_c8882
        dw      tgt_c873f
        dw      tgt_c87cb
        dw      tgt_c87ff
        dw      tgt_c86b2
        dw      tgt_c8882
        dw      tgt_c86a3
fn_c88e3:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_63D2
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        cmp     byte ptr [B_7FE7], 0
        jz      br_c891a
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_63FB
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_c891a:
        retf
fn_c891b:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        mov     si, word ptr [bp + 6]
        cmp     word ptr [W_93F5], 0
        jz      br_c893e
        push    0
        push    word ptr [W_93F5]
        push    ds
        push    word TBL_F779
        callf   SEG_DBE6:far_dbe67
        add     sp, 8
br_c893e:
        push    si
        callf   SEG_DBE6:far_dc861
        add     sp, 2
        push    0
        push    word 640h
        push    ds
        push    word TBL_F779
        callf   SEG_DBE6:far_dc2bf
        add     sp, 8
        mov     word ptr [W_93F5], ax
        push    si
        nop
        push    cs
        call    fn_c8980
        add     sp, 2
        mov     word ptr [bp - 2], ax
        cmp     word ptr [W_93F5], 0
        jz      br_c897a
        push    ds
        push    word TBL_F779
        callf   SEG_DBE6:far_dc03b
        add     sp, 4
br_c897a:
        mov     ax, word ptr [bp - 2]
        pop     si
        leave
        retf
fn_c8980:
        push    bp
        mov     bp, sp
        sub     sp, 0eh
        push    si
        push    di
        mov     di, word ptr [W_93F5]
        mov     si, 2
        mov     ax, word ptr [bp + 6]
        add     ax, 2
        dec     ax
        mov     word ptr [bp - 0eh], ax
        jmp     br_c89e3
loop_c899b:
        push    1
        push    si
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        or      di, di
        jz      br_c89d5
        push    0
        push    0ah
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        callf   SEG_DBE6:far_dc2bf
        add     sp, 8
        mov     di, ax
        callf   SEG_B05A:far_b05a7
        push    di
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        push    word ptr [bp - 0eh]
        callf   SEG_C8C5:far_c8d05
        add     sp, 8
        jmp     br_c89df
br_c89d5:
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
br_c89df:
        inc     word ptr [bp - 0eh]
        inc     si
br_c89e3:
        cmp     si, 5
        jle     loop_c899b
        callf   SEG_B05A:far_b05a7
        push    1
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [W_93F5]
        push    ds
        push    word TBL_F779
        push    word ptr [bp + 6]
        callf   SEG_C8C5:far_c8d05
        add     sp, 8
        mov     word ptr [bp - 2], ax
        push    0
        callf   SEG_EA92:far_ea926
        add     sp, 2
        mov     ax, word ptr [bp - 2]
        pop     di
        pop     si
        leave
        retf
fn_c8a20:
        callf   SEG_DADE:far_dade6
        callf   SEG_DAE3:far_dae36
        mov     word ptr [W_93F5], 0
        retf
fn_c8a31:
        push    bp
        mov     bp, sp
        sub     sp, 4
        mov     al, byte ptr [B_7FE5]
        mov     byte ptr [bp - 3], al
        mov     al, byte ptr [B_7FE9]
        mov     byte ptr [B_F224], al
        mov     al, byte ptr [B_7FEA]
        mov     byte ptr [bp - 4], al
        push    ds
        push    word STR_640E
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        mov     byte ptr [B_D5DD], 1
        push    ds
        push    word STR_6420
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    ss
        lea     ax, [bp - 3]
        push    ax
        callf   SEG_B347:far_b38d8
        add     sp, 4
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    3
        push    ds
        push    word P_0020+4
        push    ds
        push    word B_7FE6
        push    ds
        push    word STR_6431
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0ch
        push    ds
        if      FW_VERSION >= 312
        push    word P_630D+1
        elseif  FW_VERSION = 311
        push    word P_6263_V311+1
        else
        push    word P_5BC7_V308+1
        endif
        push    ds
        push    word B_7FE4
        push    ds
        push    word STR_6455
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0dh
        push    ds
        if      FW_VERSION >= 312
        push    word P_630D+0dh
        elseif  FW_VERSION = 311
        push    word P_6263_V311+0dh
        else
        push    word P_5BC7_V308+0dh
        endif
        push    ds
        push    word B_7FE7
        push    ds
        push    word STR_6471
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0ah
        push    ds
        if      FW_VERSION >= 312
        push    word P_631D+9
        elseif  FW_VERSION = 311
        push    word P_6273_V311+9
        else
        push    word P_5BD7_V308+9
        endif
        push    ds
        push    word B_7FE8
        push    ds
        push    word STR_648B
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    6
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_64A9
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        push    0bh
        push    ds
        push    word P_0010+4
        push    ds
        push    word B_F224
        push    ds
        push    word STR_64C2
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    ss
        lea     ax, [bp - 4]
        push    ax
        callf   SEG_B347:far_b38d8
        add     sp, 4
        mov     al, byte ptr [B_F224]
        cbw
        or      ax, ax
        jz      br_c8b41
        jmp     near br_c8bd4
br_c8b41:
        push    0fh
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        jmp     short br_c8bd4
br_c8b59:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jz      br_c8b6d
        cmp     ax, 5
        jz      br_c8b75
        cmp     ax, 6
        jz      br_c8ba6
        jmp     br_c8bd4
br_c8b6d:
        mov     al, byte ptr [bp - 3]
        mov     byte ptr [B_7FE5], al
        jmp     br_c8bd4
br_c8b75:
        mov     al, byte ptr [B_F224]
        mov     byte ptr [B_7FE9], al
        cbw
        or      ax, ax
        jnz     br_c8b9a
        push    0fh
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_64C8
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_c8bd4
br_c8b9a:
        push    6
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_c8bd4
br_c8ba6:
        mov     al, byte ptr [B_F224]
        cbw
        or      ax, ax
        jnz     br_c8bce
        push    0fh
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_64C8
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     al, byte ptr [B_7FEA]
        mov     byte ptr [bp - 4], al
        jmp     br_c8bd4
br_c8bce:
        mov     al, byte ptr [bp - 4]
        mov     byte ptr [B_7FEA], al
br_c8bd4:
        push    0
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jnz     br_c8be8
        jmp     near br_c8b59
br_c8be8:
        leave
        retf
fn_c8bea:
        cmp     word ptr [W_93F5], 0
        jz      br_c8c09
        push    0
        push    word ptr [W_93F5]
        push    ds
        push    word TBL_F779
        callf   SEG_DBE6:far_dbe67
        add     sp, 8
        mov     word ptr [W_93F5], 0
br_c8c09:
        retf
fn_c8c0a:
        push    bp
        mov     bp, sp
        cmp     word ptr [W_93F5], 0
        jz      br_c8c2c
        push    0
        push    word ptr [W_93F5]
        push    ds
        push    word TBL_F779
        callf   SEG_DBE6:far_dbe67
        add     sp, 8
        mov     word ptr [W_93F5], 0
br_c8c2c:
        cmp     word ptr [bp + 0ah], 0
        jnz     br_c8c37
        callf   SEG_DDA7:far_ddf77
br_c8c37:
        callf   SEG_DAF5:far_daf5c
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_E561:far_e5612
        add     sp, 4
        push    0
        push    7
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        mov     byte ptr [B_A5C0], 0
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   0dh
        elseif  FW_VERSION = 311
        phase   0ch
        else
        phase   9
        endif
far_c8c5d:
        push    bp
        mov     bp, sp
        sub     sp, 4
        mov     byte ptr [bp - 1], 0
        mov     al, byte ptr [bp + 6]
        inc     al
        mov     byte ptr [bp - 2], al
        cmp     word ptr [bp + 6], 89h
        jnz     br_c8c7c
        mov     byte ptr [bp - 2], 0bh
        jmp     br_c8c8c
br_c8c7c:
        cmp     word ptr [bp + 6], 9
        jl      br_c8c8c
        mov     al, byte ptr [bp + 6]
        mov     byte ptr [bp - 1], al
        mov     byte ptr [bp - 2], 0ah
br_c8c8c:
        mov     ax, word ptr [bp + 6]
        mov     bx, 0ch
        xor     dx, dx
        div     bx
        mov     word ptr [bp + 6], dx
        mov     al, byte ptr [bp - 2]
        cbw
        mov     word ptr [bp - 4], ax
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_6561]
        cbw
        push    ax
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        mov     bx, word ptr [bp - 4]
        shl     bx, 2
        push    word ptr [bx + TBL_6533]
        push    word ptr [bx + TBL_6531]
        callf   0f800h:far_fa3be
        add     sp, 0ah
        cmp     word ptr [bp + 6], 0
        jz      br_c8cd0
        cmp     word ptr [bp + 6], 4
        jnz     br_c8cdf
br_c8cd0:
        cmp     byte ptr [B_96EE], 0
        jz      br_c8cdf
        les     bx, dword ptr [bp + 8]
        mov     byte ptr es:[bx + 2], 23h
br_c8cdf:
        les     bx, dword ptr [bp + 8]
        mov     al, byte ptr [B_8A9C]
        mov     byte ptr es:[bx + 1], al
        cmp     byte ptr [bp - 1], 0
        jz      br_c8cf8
        mov     al, byte ptr [bp - 1]
        add     al, 0f7h
        mov     byte ptr es:[bx + 2], al
br_c8cf8:
        mov     al, byte ptr [bp - 2]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_6561]
        cbw
        leave
        retf
far_c8d05:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        push    di
        mov     di, word ptr [bp + 0ch]
        or      di, di
        jnz     br_c8d25
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        mov     ax, 0ch
        pop     di
        pop     si
        leave
        retf
br_c8d25:
        push    ds
        push    word B_F22C
        callf   SEG_DA7E:far_da8cb
        add     sp, 4
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        callf   SEG_DE4C:far_de4c2
        add     sp, 4
        mov     si, ax
        cmp     si, 1
        jle     br_c8d60
        cmp     si, 0dh
        jge     br_c8d60
        mov     bx, si
        shl     bx, 2
        push    word ptr [bx + 58eh]
        push    word ptr [bx + 58ch]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_c8d60:
        mov     bx, si
        dec     bx
        cmp     bx, 0bh
        jbe     br_c8d6b
        jmp     tgt_c90d1
br_c8d6b:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c9156]
tgt_c8d72:
        cmp     byte ptr [B_96EE], 0
        jnz     br_c8d7c
        jmp     near br_c8e3f
br_c8d7c:
        push    8
        push    62h
        push    23h
        push    2
        mov     ax, word ptr [bp + 8]
        add     ax, 2
        push    word ptr [bp + 0ah]
        push    ax
        push    ds
        push    word STR_657D
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ss
        lea     ax, [bp - 3]
        push    ax
        callf   SEG_B1AA:far_b1b2b
        add     sp, 8
        push    8
        mov     al, byte ptr [bp - 4]
        cbw
        push    ax
        mov     al, byte ptr [bp - 3]
        cbw
        push    ax
        les     bx, dword ptr [bp + 8]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        push    ax
        callf   SEG_B702:far_b9045
        add     sp, 8
        push    13h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0ah
        push    7fh
        push    1
        push    3
        mov     ax, word ptr [bp + 8]
        add     ax, 3
        push    word ptr [bp + 0ah]
        push    ax
        push    ds
        push    word A_6580
        callf   SEG_B347:far_b3819
        add     sp, 10h
        les     bx, dword ptr [bp + 8]
        mov     al, byte ptr es:[bx]
        and     al, 3
        mov     byte ptr [B_F22C], al
        push    3
        push    ds
        if      FW_VERSION >= 312
        push    word P_64D8+8
        elseif  FW_VERSION = 311
        push    word P_642E_V311+8
        else
        push    word P_5D92_V308+8
        endif
        push    ds
        push    word B_F22C
        push    ds
        if      FW_VERSION >= 312
        push    word P_6578+0bh
        elseif  FW_VERSION = 311
        push    word P_6578+0bh
        else
        push    word P_6578+0bh
        endif
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        les     bx, dword ptr [bp + 8]
        mov     al, byte ptr es:[bx + 4]
        mov     ah, 0
        mov     word ptr [W_F22E], ax
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
        push    word W_F22E
        push    ds
        if      FW_VERSION >= 312
        push    word P_6578+6
        elseif  FW_VERSION = 311
        push    word P_6578+6
        else
        push    word P_6578+6
        endif
        callf   SEG_B347:far_b3723
        add     sp, 14h
        jmp     br_c8ea3
br_c8e3f:
        push    ds
        push    word A_6585
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     ax, word ptr [bp + 8]
        add     ax, 2
        push    word ptr [bp + 0ah]
        push    ax
        callf   SEG_B347:far_b3843
        add     sp, 4
        push    13h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0ah
        push    7fh
        push    1
        push    3
        mov     ax, word ptr [bp + 8]
        add     ax, 3
        push    word ptr [bp + 0ah]
        push    ax
        push    ds
        push    word A_6580
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0ah
        push    7fh
        push    0
        push    3
        mov     ax, word ptr [bp + 8]
        add     ax, 4
        push    word ptr [bp + 0ah]
        push    ax
        push    ds
        push    word STR_658B
        callf   SEG_B347:far_b3819
        add     sp, 10h
br_c8ea3:
        push    22h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        les     bx, dword ptr [bp + 8]
        push    word ptr es:[bx + 5]
        callf   SEG_DAA8:far_daa82
        add     sp, 2
        mov     word ptr [W_F230], ax
        push    0
        push    word 270fh
        push    1
        push    4
        push    ds
        push    word W_F230
        push    ds
        push    word STR_6590
        callf   SEG_B347:far_b3819
        add     sp, 10h
        jmp     br_c913f
tgt_c8edb:
        push    12h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    ds
        push    word A_6585
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     ax, word ptr [bp + 8]
        add     ax, 2
        push    word ptr [bp + 0ah]
        push    ax
        callf   SEG_B347:far_b3843
        add     sp, 4
        mov     ax, word ptr [bp + 8]
        add     ax, 3
        push    word ptr [bp + 0ah]
        push    ax
        nop
        push    cs
        call    fn_c916e
        add     sp, 4
        jmp     br_c913f
tgt_c8f18:
        push    3ah
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        les     bx, dword ptr [bp + 8]
        mov     al, byte ptr es:[bx + 2]
        add     al, 9
        mov     byte ptr [B_F234], al
        push    ds
        push    word B_F234
        callf   SEG_B347:far_b38d8
        add     sp, 4
        mov     ax, word ptr [bp + 8]
        add     ax, 3
        push    word ptr [bp + 0ah]
        push    ax
        nop
        push    cs
        call    fn_c916e
        add     sp, 4
        jmp     br_c913f
tgt_c8f4f:
        les     bx, dword ptr [bp + 8]
        mov     al, byte ptr es:[bx + 2]
        inc     al
        mov     byte ptr [B_F22D], al
        push    21h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    8
        push    word 80h
        push    1
        push    3
        push    ds
        push    word B_F22D
        push    ds
        push    word A_6593
        callf   SEG_B347:far_b3819
        add     sp, 10h
        jmp     br_c913f
tgt_c8f81:
        mov     ax, word ptr [bp + 8]
        add     ax, 2
        push    word ptr [bp + 0ah]
        push    ax
        nop
        push    cs
        call    fn_c916e
        add     sp, 4
        jmp     br_c913f
tgt_c8f96:
        les     bx, dword ptr [bp + 8]
        push    word ptr es:[bx + 2]
        callf   SEG_DAA8:far_daa82
        add     sp, 2
        add     ax, 0e000h
        mov     word ptr [W_F232], ax
        push    1fh
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0
        push    word 1fffh
        push    word 0e000h
        push    5
        push    ds
        push    word W_F232
        push    ds
        push    word A_6593
        callf   SEG_B347:far_b3819
        add     sp, 10h
        jmp     br_c913f
tgt_c8fd2:
        mov     word ptr [W_F236], 1
        les     bx, dword ptr [bp + 8]
        mov     al, byte ptr es:[bx + 2]
        mov     byte ptr [B_F235], al
        mov     ax, di
        add     ax, 0fffeh
        mov     word ptr [W_F23A], ax
        mov     word ptr [W_F238], ax
        push    0
        push    word 5dch
        push    1
        push    4
        push    ds
        push    word W_F23A
        push    ds
        push    word STR_6598
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    word 5dch
        push    1
        push    4
        push    ds
        push    word W_F236
        push    ds
        push    word STR_659F
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    8
        push    7fh
        push    0
        push    3
        push    ds
        push    word B_F235
        push    ds
        push    word STR_65A6
        callf   SEG_B347:far_b3819
        add     sp, 10h
        jmp     br_c913f
tgt_c903a:
        push    16h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        les     bx, dword ptr [bp + 8]
        and     byte ptr es:[bx + 7], 3fh
        push    3
        push    ds
        push    word P_0270+4
        mov     ax, word ptr [bp + 8]
        add     ax, 7
        push    word ptr [bp + 0ah]
        push    ax
        push    ds
        push    word STR_65AD
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        les     bx, dword ptr [bp + 8]
        cmp     byte ptr es:[bx + 8], 64h
        jbe     br_c9077
        mov     byte ptr es:[bx + 8], 64h
br_c9077:
        push    21h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        cmp     si, 9
        jnz     br_c90a5
        push    3
        push    ds
        push    word P_0060+4
        mov     ax, word ptr [bp + 8]
        add     ax, 8
        push    word ptr [bp + 0ah]
        push    ax
        push    ds
        push    word A_6593
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        jmp     near br_c913f
br_c90a5:
        push    8
        push    64h
        push    0
        push    3
        mov     ax, word ptr [bp + 8]
        add     ax, 8
        push    word ptr [bp + 0ah]
        push    ax
        push    ds
        push    word A_6593
        callf   SEG_B347:far_b3819
        add     sp, 10h
        jmp     short br_c913f
tgt_c90c5:
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        jmp     br_c913f
tgt_c90d1:
        les     bx, dword ptr [bp + 8]
        cmp     byte ptr es:[bx], 0ffh
        jnz     br_c90f6
        push    ds
        push    word STR_65B2
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
br_c90f6:
        push    ds
        push    word STR_65C4
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        cmp     di, 8
        jle     br_c910a
        mov     di, 8
br_c910a:
        mov     word ptr [bp - 2], 0
        jmp     br_c912e
loop_c9111:
        mov     ax, word ptr [bp - 2]
        inc     word ptr [bp - 2]
        les     bx, dword ptr [bp + 8]
        add     bx, ax
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        push    ax
        push    ds
        push    word STR_65D2
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
br_c912e:
        mov     ax, di
        dec     di
        or      ax, ax
        jnz     loop_c9111
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
br_c913f:
        cmp     byte ptr [B_96EE], 0
        jz      br_c9150
        push    3
        callf   SEG_DA7E:far_da970
        add     sp, 2
br_c9150:
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
TBL_c9156:
        dw      tgt_c8d72
        dw      tgt_c8edb
        dw      tgt_c8f18
        dw      tgt_c8f4f
        dw      tgt_c8f81
        dw      tgt_c8f96
        dw      tgt_c8fd2
        dw      tgt_c903a
        dw      tgt_c903a
        dw      tgt_c903a
        dw      tgt_c90d1
        dw      tgt_c90c5
fn_c916e:
        push    bp
        mov     bp, sp
        push    21h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    8
        push    7fh
        push    0
        push    3
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    ds
        push    word A_6593
        callf   SEG_B347:far_b3819
        add     sp, 10h
        pop     bp
        retf
far_c9197:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    di
        push    ds
        push    word TBL_F779
        callf   SEG_DE4C:far_de4c2
        add     sp, 4
        dec     ax
        mov     bx, ax
        cmp     bx, 6
        jbe     br_c91b5
        jmp     tgt_c9350
br_c91b5:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c935d]
tgt_c91bc:
        cmp     byte ptr [B_96EE], 0
        jz      br_c923b
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     bx, ax
        cmp     bx, 4
        jbe     br_c91d1
        jmp     tgt_c9350
br_c91d1:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c9353]
tgt_c91d8:
        push    9
        push    5
        push    1
        mov     al, byte ptr [B_F77B]
        mov     ah, 0
        push    ax
        callf   SEG_B702:far_b9045
        add     sp, 8
        pop     di
        leave
        retf
tgt_c91ef:
        push    3
        callf   SEG_DA7E:far_da970
        add     sp, 2
        mov     al, byte ptr [TBL_F779]
        and     al, 0fch
        or      al, byte ptr [B_F22C]
        mov     byte ptr [TBL_F779], al
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
        pop     di
        leave
        retf
tgt_c9212:
        mov     al, byte ptr [W_F22E]
        mov     byte ptr [B_F77D], al
        pop     di
        leave
        retf
tgt_c921b:
        mov     word ptr [bp - 2], ds
        mov     word ptr [bp - 4], B_F77E
        push    word ptr [W_F230]
        callf   SEG_DAA8:far_daabc
        add     sp, 2
        les     bx, dword ptr [bp - 4]
        mov     word ptr es:[bx], ax
        pop     di
        leave
        retf
tgt_c9238:
        pop     di
        leave
        retf
br_c923b:
        mov     al, byte ptr [B_7B8D]
        cbw
        cmp     ax, 3
        jz      br_c9247
        pop     di
        leave
        retf
br_c9247:
        mov     word ptr [bp - 2], ds
        mov     word ptr [bp - 4], B_F77E
        push    word ptr [W_F230]
        callf   SEG_DAA8:far_daabc
        add     sp, 2
        les     bx, dword ptr [bp - 4]
        mov     word ptr es:[bx], ax
        pop     di
        leave
        retf
tgt_c9264:
        cmp     byte ptr [B_7B8D], 0
        jz      br_c926e
        jmp     tgt_c9350
br_c926e:
        cmp     byte ptr [B_F234], 9
        jnc     br_c927a
        mov     byte ptr [B_F234], 9
br_c927a:
        cmp     byte ptr [B_F234], 88h
        jbe     br_c9286
        mov     byte ptr [B_F234], 88h
br_c9286:
        mov     al, byte ptr [B_F234]
        add     al, 0f7h
        mov     byte ptr [B_F77B], al
        push    0
        callf   SEG_B05A:far_b1073
        add     sp, 2
        pop     di
        leave
        retf
tgt_c929b:
        mov     al, byte ptr [B_F22D]
        add     al, 0ffh
        mov     byte ptr [B_F77B], al
        pop     di
        leave
        retf
tgt_c92a6:
        mov     word ptr [bp - 2], ds
        mov     word ptr [bp - 4], B_F77B
        mov     ax, word ptr [W_F232]
        add     ax, 2000h
        push    ax
        callf   SEG_DAA8:far_daabc
        add     sp, 2
        les     bx, dword ptr [bp - 4]
        mov     word ptr es:[bx], ax
        pop     di
        leave
        retf
tgt_c92c6:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jz      br_c92db
        cmp     ax, 1
        jz      br_c9314
        cmp     ax, 2
        jz      br_c9345
        pop     di
        leave
        retf
br_c92db:
        mov     ax, word ptr [W_F23A]
        cmp     ax, word ptr [W_F238]
        jle     br_c9308
        push    ds
        pop     es
        mov     di, word ptr [W_93F5]
        add     di, TBL_F779
        mov     cx, word ptr [W_F23A]
        sub     cx, word ptr [W_F238]
        xor     ax, ax
        mov     ah, al
        shr     cx, 1
        rep stosw
        adc     cx, cx
        rep stosb
        mov     ax, word ptr [W_F23A]
        mov     word ptr [W_F238], ax
br_c9308:
        mov     ax, word ptr [W_F23A]
        add     ax, 2
        mov     word ptr [W_93F5], ax
        pop     di
        leave
        retf
br_c9314:
        mov     ax, word ptr [W_F236]
        cmp     ax, word ptr [W_F23A]
        jle     br_c932d
        mov     ax, word ptr [W_F23A]
        mov     word ptr [W_F236], ax
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_c932d:
        mov     bx, word ptr [W_F236]
        mov     al, byte ptr [bx + TBL_F77A]
        mov     byte ptr [B_F235], al
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        pop     di
        leave
        retf
br_c9345:
        mov     bx, word ptr [W_F236]
        mov     al, byte ptr [B_F235]
        mov     byte ptr [bx + TBL_F77A], al
tgt_c9350:
        pop     di
        leave
        retf
TBL_c9353:
        dw      tgt_c91d8
        dw      tgt_c9238
        dw      tgt_c91ef
        dw      tgt_c9212
        dw      tgt_c921b
TBL_c935d:
        dw      tgt_c91bc
        dw      tgt_c9350
        dw      tgt_c9264
        dw      tgt_c929b
        dw      tgt_c9350
        dw      tgt_c92a6
        dw      tgt_c92c6
        if      FW_VERSION >= 312
        phase   0bh
        elseif  FW_VERSION = 311
        phase   0ah
        else
        phase   7
L_d2667:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    si
        mov     si, word ptr [bp + 8]
        cmp     word ptr [bp + 6], 0ffffh
        jnz     L_d26d2
        mov     word ptr [bp + 6], 0
        mov     ax, word ptr [W_8C37]
        mov     dx, word ptr [W_8C35]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        jmp     L_d26a6
L_d268b:
        or      si, si
        jz      L_d269a
        les     bx, dword ptr [W_8C35]
        or      byte ptr es:[bx + 1ah], 4
        jmp     L_d26a3
L_d269a:
        les     bx, dword ptr [W_8C35]
        and     byte ptr es:[bx + 1ah], 0fbh
L_d26a3:
        mov     word ptr [bp + 6], dx
L_d26a6:
        mov     al, byte ptr [bp + 6]
        push    ax
        callf   SEG_E517:far_e517b
        add     sp, 2
        mov     dx, ax
        cmp     ax, word ptr [bp + 6]
        jg      L_d268b
        push    si
        nop
        push    cs
        call    L_d281f
        add     sp, 2
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        mov     word ptr [W_8C37], ax
        mov     word ptr [W_8C35], dx
        pop     si
        leave
        retf
L_d26d2:
        cmp     word ptr [bp + 6], 1
        jge     L_d26db
        jmp     near L_d2771
L_d26db:
        cmp     word ptr [bp + 6], 63h
        jle     L_d26e4
        jmp     near L_d2771
L_d26e4:
        cmp     byte ptr [B_901B], 0
        jl      L_d2711
        mov     al, byte ptr [B_8A9F]
        cbw
        cmp     ax, word ptr [bp + 6]
        jnz     L_d2711
        or      si, si
        jz      L_d26ff
        or      byte ptr [B_901C], 4
        jmp     L_d2704
L_d26ff:
        and     byte ptr [B_901C], 0fbh
L_d2704:
        les     bx, dword ptr [W_901D]
        mov     al, byte ptr [B_901C]
        mov     byte ptr es:[bx + 1ah], al
        jmp     L_d2768
L_d2711:
        mov     ax, word ptr [W_8C37]
        mov     dx, word ptr [W_8C35]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        mov     al, byte ptr [bp + 6]
        push    ax
        callf   SEG_E259:far_e259f
        add     sp, 2
        mov     word ptr [bp - 6], ax
        cmp     word ptr [bp - 6], 0ffffh
        jnz     L_d2743
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        mov     word ptr [W_8C37], ax
        mov     word ptr [W_8C35], dx
        pop     si
        leave
        retf
L_d2743:
        or      si, si
        jz      L_d2752
        les     bx, dword ptr [W_8C35]
        or      byte ptr es:[bx + 1ah], 4
        jmp     L_d275b
L_d2752:
        les     bx, dword ptr [W_8C35]
        and     byte ptr es:[bx + 1ah], 0fbh
L_d275b:
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        mov     word ptr [W_8C37], ax
        mov     word ptr [W_8C35], dx
L_d2768:
        push    si
        nop
        push    cs
        call    L_d281f
        add     sp, 2
L_d2771:
        pop     si
        leave
        retf
L_d2774:
        push    bp
        mov     bp, sp
        push    si
        mov     bx, word ptr [bp + 6]
        mov     cx, word ptr [bp + 8]
        cmp     bx, 0ffffh
        jnz     L_d27c6
        xor     dx, dx
        xor     si, si
L_d2787:
        mov     ax, SEG_A28F
        mov     es, ax
        cmp     byte ptr es:[si + 4800h], 0
        jz      L_d27b0
        or      cx, cx
        jz      L_d27a5
        mov     ax, SEG_A28F
        mov     es, ax
        or      byte ptr es:[si + 4813h], 2
        jmp     L_d27b0
L_d27a5:
        mov     ax, SEG_A28F
        mov     es, ax
        and     byte ptr es:[si + 4813h], 0fdh
L_d27b0:
        add     si, 24h
        inc     dx
        cmp     si, 1200h
        jnz     L_d2787
        push    cx
        nop
        push    cs
        call    L_d281f
        add     sp, 2
        pop     si
        pop     bp
        retf
L_d27c6:
        or      bx, bx
        jl      L_d2807
        cmp     bx, 80h
        jg      L_d2807
        or      cx, cx
        jz      L_d27ea
        mov     ax, bx
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        or      byte ptr es:[bx + 4813h], 2
        jmp     L_d27fe
L_d27ea:
        mov     ax, bx
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        and     byte ptr es:[bx + 4813h], 0fdh
L_d27fe:
        push    cx
        nop
        push    cs
        call    L_d281f
        add     sp, 2
L_d2807:
        pop     si
        pop     bp
        retf
L_d280a:
        push    bp
        mov     bp, sp
        mov     dx, word ptr [bp + 6]
        mov     byte ptr [5e92h], dl
        push    dx
        nop
        push    cs
        call    L_d281f
        add     sp, 2
        pop     bp
        retf
L_d281f:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    si
        cmp     word ptr [bp + 6], 0
        jnz     L_d2884
        xor     dx, dx
        mov     si, 4813h
L_d2831:
        mov     ax, SEG_A28F
        mov     es, ax
        test    byte ptr es:[si], 2
        add     si, 24h
        inc     dx
        cmp     si, 5a13h
        jnz     L_d2831
        mov     word ptr [bp - 2], 0
        mov     ax, word ptr [W_8C37]
        mov     dx, word ptr [W_8C35]
        mov     word ptr [bp - 4], ax
        mov     word ptr [bp - 6], dx
        jmp     L_d2864
L_d2858:
        les     bx, dword ptr [W_8C35]
        test    byte ptr es:[bx + 1ah], 4
        mov     word ptr [bp - 2], dx
L_d2864:
        mov     al, byte ptr [bp - 2]
        push    ax
        callf   SEG_E517:far_e517b
        add     sp, 2
        mov     dx, ax
        cmp     ax, word ptr [bp - 2]
        jg      L_d2858
        mov     ax, word ptr [bp - 4]
        mov     dx, word ptr [bp - 6]
        mov     word ptr [W_8C37], ax
        mov     word ptr [W_8C35], dx
L_d2884:
        pop     si
        leave
        retf
        phase   7
        endif
far_c936b:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        push    di
        push    ds
        push    word STR_669C
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        callf   SEG_E6FE:far_e7069
        cmp     byte ptr [B_901B], 0
        jge     br_c9398
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_E15E:far_e15e2
        add     sp, 2
br_c9398:
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
        cmp     byte ptr [B_7FCC], 0
        jz      br_c93b5
        mov     ax, word ptr [W_8A98]
        jmp     br_c93b8
br_c93b5:
        mov     ax, word ptr [W_7FC8]
br_c93b8:
        push    ax
        nop
        push    cs
        call    fn_ca373
        add     sp, 2
        mov     word ptr [bp - 4], ax
        push    4
        mov     bx, si
        shl     bx, 1
        push    word ptr [bx + 252h]
        mov     bx, si
        shl     bx, 1
        push    word ptr [bx + 248h]
        push    5
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ds
        push    word STR_66A2
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    13h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    8
        push    ds
        push    word P_0030+0ch
        push    ds
        push    word B_7FCC
        push    ds
        push    word STR_66A9
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_66B7
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    3
        push    ds
        push    word P_01F0+0ch
        push    ds
        push    word B_7FCA
        push    ds
        push    word STR_66C4
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    13h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0ah
        push    ds
        push    word P_0210+4
        push    ds
        push    word B_7FCB
        push    ds
        push    word A_66CD
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_66D5
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    4
        push    2
        push    1
        push    ds
        push    word B_7FCD
        push    ds
        push    word STR_66DF
        callf   SEG_B347:far_b3819
        add     sp, 10h
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_66EE
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     al, 0
        jmp     br_c961f
br_c94b5:
        mov     byte ptr [B_8802], 0
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     bx, ax
        cmp     bx, 3
        jbe     br_c94c8
        jmp     loop_c95e4
br_c94c8:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c964d]
tgt_c94cf:
        callf   SEG_E707:far_e70e6
        push    word ptr [W_D651]
        nop
        push    cs
        call    fn_ca373
        add     sp, 2
        mov     word ptr [bp - 4], ax
        push    0
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     loop_c95e4
tgt_c94f0:
        push    0
        push    0
        mov     al, byte ptr [B_7FCB]
        cbw
        push    ax
        mov     al, byte ptr [B_7FCA]
        cbw
        push    ax
        push    word ptr [bp - 4]
        callf   SEG_DE78:far_de7ae
        add     sp, 6
        push    ax
        callf   SEG_DE78:far_de88f
        add     sp, 6
        mov     si, ax
        cmp     byte ptr [B_7FCC], 0
        jnz     br_c9521
        mov     word ptr [W_7FC8], si
        jmp     br_c952a
br_c9521:
        mov     word ptr [W_8A98], si
        if      FW_VERSION < 311
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
        endif
        mov     byte ptr [B_8802], 0
br_c952a:
        callf   SEG_E707:far_e70e6
        push    si
        nop
        push    cs
        call    fn_ca373
        add     sp, 2
        mov     word ptr [bp - 4], ax
        push    0
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     near loop_c95e4
tgt_c9548:
        mov     al, byte ptr [B_7FCB]
        cbw
        mov     di, ax
        shl     ax, 2
        mov     bx, ax
        mov     ax, word ptr [bx + 5e6h]
        mov     dx, word ptr [bx + 5e4h]
        mov     word ptr [W_D633], ax
        mov     word ptr [W_D631], dx
        xor     cx, cx
        xor     si, si
        mov     ax, di
        mov     dx, 6
        imul    dx
        mov     dx, ax
loop_c956f:
        mov     bx, dx
        add     bx, si
        mov     ax, word ptr [bx + 5f4h]
        mov     word ptr [si + TBL_D62B], ax
        add     si, 2
        inc     cx
        cmp     si, 6
        jnz     loop_c956f
        cmp     byte ptr [B_7FCC], 0
        jz      br_c9590
        mov     ax, word ptr [W_8A98]
        jmp     br_c9593
br_c9590:
        mov     ax, word ptr [W_7FC8]
br_c9593:
        push    ax
        nop
        push    cs
        call    fn_ca373
        add     sp, 2
        mov     word ptr [bp - 4], ax
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
        push    0
        callf   SEG_B05A:far_b1206
        add     sp, 6
        push    0
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    ds
        push    word A_8A89
        push    ds
        push    word TBL_8A93
        callf   SEG_EB63:far_eb6bd
        add     sp, 8
loop_c95e4:
        push    2
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     byte ptr [bp - 1], al
        or      al, al
        jnz     br_c95f8
        jmp     br_c94b5
br_c95f8:
        cbw
        cmp     ax, 78h
        jz      br_c9605
        cmp     ax, 79h
        jz      br_c9611
        jmp     br_c961d
br_c9605:
        nop
        push    cs
        call    fn_c9682
        mov     byte ptr [bp - 1], al
        mov     al, 1
        jmp     br_c961f
br_c9611:
        nop
        push    cs
        call    fn_c9a5b
        mov     byte ptr [bp - 1], al
        mov     al, 1
        jmp     br_c961f
br_c961d:
        mov     al, 1
br_c961f:
        or      al, al
        jz      loop_c95e4
        cmp     byte ptr [B_7FD1], 2
        jnz     br_c9631
        cmp     byte ptr [B_D60A], 0
        jnz     br_c9645
br_c9631:
        push    ds
        push    word W_D5F3
        push    word ptr [W_9047]
        push    word ptr [W_9045]
        callf   SEG_EB86:far_eb86b
        add     sp, 8
br_c9645:
        mov     al, byte ptr [bp - 1]
        cbw
        pop     di
        pop     si
        leave
        retf
TBL_c964d:
        dw      tgt_c94f0
        dw      tgt_c94cf
        dw      tgt_c9548
        dw      tgt_c9548
fn_c9655:
        push    8
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     byte ptr [B_7FD3], 0
        jnz     br_c9675
        push    ds
        push    word STR_6671
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        retf
br_c9675:
        push    ds
        push    word STR_6705
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        retf
fn_c9682:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        push    di
        callf   SEG_B05A:far_b05a7
        callf   SEG_B1AA:far_b1aac
        push    ds
        push    word STR_6709
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     word ptr [bp - 4], 0
        mov     byte ptr [bp - 1], 0
        jmp     br_c9a32
br_c96ac:
        callf   SEG_B05A:far_b05a7
        mov     al, byte ptr [B_7FD1]
        add     al, 0ah
        mov     byte ptr [B_D5DD], al
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_7FD1]
        mov     byte ptr [bp - 2], al
        push    0fh
        push    ds
        if      FW_VERSION >= 312
        push    word P_65E2+2
        elseif  FW_VERSION = 311
        push    word P_6538_V311+2
        else
        push    word P_5E9C_V308+4
        endif
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ds
        push    word STR_6732
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    16h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    5
        push    ds
        push    word A_6608
        push    ds
        push    word B_7FD0
        push    ds
        if      FW_VERSION >= 312
        push    word STR_6738
        elseif  FW_VERSION = 311
        push    word STR_6738
        else
        push    word STR_5FF4_V308
        endif
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_7FD1]
        cbw
        cmp     ax, 1
        jz      br_c971e
        cmp     ax, 2
        jz      br_c971e
        jmp     short br_c9798
br_c971e:
        push    0ah
        push    63h
        push    0
        push    2
        push    ds
        push    word B_8A97
        push    ds
        push    word STR_6744
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0ah
        push    3bh
        push    0
        push    2
        push    ds
        push    word B_8A96
        push    ds
        push    word A_66A7
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0ah
        push    3bh
        push    0
        push    2
        push    ds
        push    word B_8A95
        push    ds
        push    word A_66A7
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0ah
        push    1dh
        push    0
        push    2
        push    ds
        push    word B_8A94
        push    ds
        push    word A_66A7
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0ah
        push    63h
        push    0
        push    2
        push    ds
        push    word TBL_8A93
        push    ds
        push    word A_674B
        callf   SEG_B347:far_b3819
        add     sp, 10h
        jmp     br_c97b0
br_c9798:
        push    8
        push    14h
        push    0
        push    2
        push    ds
        push    word B_7FCE
        push    ds
        push    word STR_674D
        callf   SEG_B347:far_b3819
        add     sp, 10h
br_c97b0:
        if      FW_VERSION >= 312
        push    16h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    5
        push    ds
        push    word A_6608
        push    ds
        push    word B_8436
        push    ds
        push    word STR_6760
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        elseif  FW_VERSION = 311
        push    16h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    5
        push    ds
        push    word A_6608
        push    ds
        push    word B_8436
        push    ds
        push    word STR_6760
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        endif
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    78h
        push    20h
        callf   SEG_B1AA:far_b1b41
        add     sp, 4
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_7FD1]
        cbw
        mov     bx, ax
        cmp     bx, 4
        jbe     br_c9802
        jmp     near tgt_c989e
br_c9802:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c9a51]
tgt_c9809:
        push    8
        push    2
        push    1
        push    1
        push    ds
        push    word B_7FCF
        push    ds
        push    word STR_676E
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    3
        push    ds
        push    word P_0030
        push    ds
        push    word B_7FD4
        push    ds
        push    word STR_677A
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        jmp     tgt_c989e
tgt_c9845:
        push    0ah
        push    ds
        push    word P_0210+4
        push    ds
        push    word B_7FCB
        push    ds
        push    word A_66CD
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        cmp     byte ptr [B_7FD1], 1
        jnz     tgt_c989e
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    2
        push    1
        push    1
        push    ds
        push    word B_7FCF
        push    ds
        push    word STR_6788
        callf   SEG_B347:far_b3819
        add     sp, 10h
        jmp     tgt_c989e
tgt_c9888:
        push    8
        push    ds
        if      FW_VERSION >= 312
        push    word P_6612+0eh
        elseif  FW_VERSION = 311
        push    word P_6568_V311+0eh
        else
        push    word L_5EDC_V308
        endif
        push    ds
        push    word B_7FD2
        push    ds
        push    word STR_6791
        callf   SEG_B347:far_b362e
        add     sp, 0eh
tgt_c989e:
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_679C
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    14h
        push    6
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_67BD
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    cs
        call    fn_c9655
        cmp     word ptr [bp - 4], 0
        jnz     br_c98d4
        jmp     br_c99eb
br_c98d4:
        mov     byte ptr [B_7B8E], 1
        mov     word ptr [bp - 4], 0
        jmp     br_c99eb
br_c98e1:
        cmp     byte ptr [B_7B8D], 0
        jnz     br_c993c
        mov     word ptr [bp - 4], 1
        mov     byte ptr [B_D5DD], 0ah
        jmp     br_c9905
loop_c98f4:
        mov     al, byte ptr [B_7B8D]
        cbw
        push    ax
        callf   SEG_B05A:far_b130a
        add     sp, 2
        inc     byte ptr [B_D5DD]
br_c9905:
        cmp     byte ptr [B_D5DD], 0fh
        jle     loop_c98f4
        cmp     byte ptr [bp - 2], 2
        jnz     br_c992c
        callf   SEG_D75F:far_d7801
        or      ax, ax
        jnz     br_c992c
        mov     al, byte ptr [bp - 2]
        cmp     al, byte ptr [B_7FD1]
        jle     br_c9929
        inc     byte ptr [bp - 2]
        jmp     br_c992c
br_c9929:
        dec     byte ptr [bp - 2]
br_c992c:
        mov     al, byte ptr [bp - 2]
        cbw
        push    ax
        callf   SEG_EB7C:far_eb7cc
        add     sp, 2
        jmp     near br_c99ff
br_c993c:
        mov     al, byte ptr [B_7FD1]
        cbw
        cmp     ax, 1
        jz      br_c994d
        cmp     ax, 2
        jz      br_c994d
        jmp     near br_c99d4
br_c994d:
        mov     al, byte ptr [B_7B8D]
        cbw
        sub     ax, 2
        mov     bx, ax
        if      FW_VERSION >= 311
        cmp     bx, 6
        else
        cmp     bx, 5
        endif
        jbe     br_c995e
        jmp     near br_c99eb
br_c995e:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c9a43]
tgt_c9965:
        mov     al, byte ptr [B_7FCB]
        cbw
        mov     di, ax
        shl     ax, 2
        mov     bx, ax
        mov     ax, word ptr [bx + 5e6h]
        mov     dx, word ptr [bx + 5e4h]
        mov     word ptr [W_D633], ax
        mov     word ptr [W_D631], dx
        xor     cx, cx
        xor     si, si
        mov     ax, di
        mov     dx, 6
        imul    dx
        mov     dx, ax
loop_c998c:
        mov     bx, dx
        add     bx, si
        mov     ax, word ptr [bx + 5f4h]
        mov     word ptr [si + TBL_D62B], ax
        add     si, 2
        inc     cx
        cmp     si, 6
        jnz     loop_c998c
tgt_c99a1:
        mov     al, byte ptr [B_7FCB]
        cbw
        mov     di, ax
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_662C]
        cmp     al, byte ptr [B_8A94]
        jnc     tgt_c99c0
        mov     byte ptr [B_8A94], al
        if      FW_VERSION >= 311
        push    5
        else
        push    6
        endif
        callf   SEG_B05A:far_b1073
        add     sp, 2
tgt_c99c0:
        push    ds
        push    word A_8A89
        push    ds
        push    word TBL_8A93
        callf   SEG_EB63:far_eb6bd
        add     sp, 8
        jmp     br_c99eb
tgt_c99d2:
        jmp     br_c99eb
br_c99d4:
        mov     al, byte ptr [B_7B8D]
        cbw
        cmp     ax, 2
        jz      br_c99df
        jmp     br_c99eb
br_c99df:
        mov     al, byte ptr [B_7FCE]
        cbw
        mov     dx, 7d0h
        imul    dx
        mov     word ptr [W_D60E], ax
br_c99eb:
        push    3
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     byte ptr [bp - 1], al
        or      al, al
        jnz     br_c99ff
        jmp     br_c98e1
br_c99ff:
        mov     al, byte ptr [bp - 1]
        cbw
        cmp     ax, 78h
        jz      br_c9a14
        cmp     ax, 79h
        jz      br_c9a24
        cmp     ax, 7ah
        jz      br_c9a2a
        jmp     br_c9a32
br_c9a14:
        mov     al, byte ptr [B_7FD3]
        cbw
        neg     ax
        sbb     ax, ax
        inc     ax
        mov     byte ptr [B_7FD3], al
        push    cs
        call    fn_c9655
br_c9a24:
        mov     byte ptr [bp - 1], 0
        jmp     br_c9a32
br_c9a2a:
        nop
        push    cs
        call    fn_ca16c
        mov     byte ptr [bp - 1], al
br_c9a32:
        cmp     byte ptr [bp - 1], 0
        jnz     br_c9a3b
        jmp     br_c96ac
br_c9a3b:
        mov     al, byte ptr [bp - 1]
        cbw
        pop     di
        pop     si
        leave
        retf
TBL_c9a43:
        dw      tgt_c99c0
        dw      tgt_c99c0
        dw      tgt_c99c0
        dw      tgt_c99a1
        dw      tgt_c99c0
        if      FW_VERSION >= 311
        dw      tgt_c99d2
        endif
        dw      tgt_c9965
TBL_c9a51:
        dw      tgt_c9809
        dw      tgt_c9845
        dw      tgt_c9845
        dw      tgt_c989e
        dw      tgt_c9888
fn_c9a5b:
        push    bp
        mov     bp, sp
        sub     sp, 16h
        push    si
        push    di
        callf   SEG_E6FE:far_e7069
        cmp     byte ptr [B_9562], 0
        jz      br_c9a81
        push    0ffd8h
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, byte ptr [B_D5DE]
        cbw
        pop     di
        pop     si
        leave
        retf
br_c9a81:
        push    ds
        push    word STR_67C0
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        mov     byte ptr [B_D5DD], 3
        push    0
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        mov     ax, word ptr [W_F23C]
        or      ax, word ptr [W_F23E]
        jz      br_c9ac4
        mov     ax, word ptr [W_F23E]
        cwd
        push    ax
        mov     ax, word ptr [W_904B]
        push    dx
        cwd
        pop     bx
        cmp     bx, dx
        pop     dx
        jl      br_c9ad0
        jnz     br_c9ac4
        cmp     dx, ax
        jc      br_c9ad0
br_c9ac4:
        mov     word ptr [W_F23E], 1
        mov     word ptr [W_F23C], 100h
br_c9ad0:
        mov     al, byte ptr [B_F240]
        cmp     al, byte ptr [B_8A88]
        jbe     br_c9adf
        mov     al, byte ptr [B_8A88]
        mov     byte ptr [B_F240], al
br_c9adf:
        cmp     byte ptr [B_F240], 0
        jnz     br_c9aeb
        mov     byte ptr [B_F240], 1
br_c9aeb:
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    3
        push    ds
        push    word P_0030
        push    ds
        push    word B_D612
        push    ds
        push    word STR_67DB
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word W_F23C
        push    ds
        push    word STR_67EA
        callf   SEG_B347:far_b39a2
        add     sp, 8
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word STR_6809
        elseif  FW_VERSION = 311
        push    word STR_6809
        else
        push    word STR_6809
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word B_F240
        nop
        push    cs
        call    fn_c9fa6
        add     sp, 0eh
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    63h
        push    1
        push    2
        push    ds
        push    word B_F240
        push    ds
        push    word A_67BD
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    15h
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    word 28fh
        push    1
        push    3
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        if      FW_VERSION >= 312
        push    word P_6632+1
        elseif  FW_VERSION = 311
        push    word P_6588_V311+1
        else
        push    word P_5EEC_V308+3
        endif
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    2
        push    63h
        push    0
        push    2
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    ds
        push    word A_674B
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    ds
        push    word B_901B
        callf   SEG_E5A9:far_e5a99
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_682E
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     word ptr [bp - 2], 0
        jmp     tgt_c9f1e
br_c9be1:
        mov     al, byte ptr [B_7B8D]
        cbw
        dec     ax
        mov     bx, ax
        cmp     bx, 3
        jbe     br_c9bf0
        jmp     br_c9cdb
br_c9bf0:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c9f9e]
tgt_c9bf7:
        push    ss
        lea     ax, [bp - 10h]
        push    ax
        push    word ptr [W_F23E]
        push    word ptr [W_F23C]
        push    ds
        push    word B_901B
        callf   SEG_EB00:far_eb007
        add     sp, 0ch
        mov     ax, word ptr [bp - 0eh]
        mov     dx, word ptr [bp - 10h]
        cmp     ax, word ptr [W_903F]
        jnc     br_c9c1f
        if      FW_VERSION >= 311
        jmp     near br_c9cdb
        else
        jmp     br_c9cdb
        endif
br_c9c1f:
        jnz     br_c9c2a
        cmp     dx, word ptr [W_903D]
        jnc     br_c9c2a
        jmp     near br_c9cdb
br_c9c2a:
        push    ds
        push    word W_F23C
        mov     ax, word ptr [bp - 0eh]
        mov     dx, word ptr [bp - 10h]
        sub     dx, 1
        sbb     ax, 0
        push    ax
        push    dx
        push    ds
        push    word B_901B
        callf   SEG_EADF:far_eadf4
        add     sp, 0ch
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     near br_c9cdb
tgt_c9c55:
        cmp     byte ptr [B_8A88], 0
        jnz     br_c9c6d
        mov     byte ptr [B_8A88], 1
        mov     word ptr [TBL_8832], 0
        mov     word ptr [TBL_8830], 0
br_c9c6d:
        mov     ax, word ptr [bp - 6]
        mov     dx, 64h
        imul    dx
        add     ax, word ptr [bp - 8]
        cwd
        mov     word ptr [bp - 12h], dx
        mov     word ptr [bp - 14h], ax
        push    0
        push    word 2710h
        mov     cl, 0ch
        callf   0f800h:far_fa1ac
        add     ax, 1f4h
        adc     dx, 0
        push    dx
        push    ax
        callf   0f800h:far_fa105
        push    ax
        mov     al, byte ptr [B_F240]
        cbw
        mov     dx, 6
        imul    dx
        mov     bx, ax
        pop     ax
        mov     word ptr [bx + TBL_882E], ax
        push    0
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        push    ds
        push    word B_F240
        nop
        push    cs
        call    fn_c9fa6
        add     sp, 0eh
        if      FW_VERSION < 311
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
        endif
        jmp     br_c9cdb
tgt_c9cc3:
        push    1
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word B_F240
        nop
        push    cs
        call    fn_c9fa6
        add     sp, 0eh
br_c9cdb:
        push    4
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jnz     br_c9cef
        jmp     br_c9be1
br_c9cef:
        mov     bx, word ptr [bp - 2]
        sub     bx, 75h
        cmp     bx, 5
        jbe     br_c9cfd
        jmp     tgt_c9f1e
br_c9cfd:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_c9f92]
tgt_c9d04:
        if      FW_VERSION < 311
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
        endif
        push    ss
        lea     ax, [bp - 10h]
        push    ax
        push    word ptr [W_F23E]
        push    word ptr [W_F23C]
        push    ds
        push    word B_901B
        callf   SEG_EB00:far_eb007
        add     sp, 0ch
        cmp     byte ptr [B_8A88], 0
        jnz     br_c9d3b
        mov     byte ptr [B_8A88], 1
        mov     word ptr [TBL_8832], 0
        mov     word ptr [TBL_8830], 0
        mov     word ptr [TBL_8834], 1000h
br_c9d3b:
        mov     al, byte ptr [B_8A88]
        mov     ah, 0
        mov     word ptr [bp - 16h], ax
        mov     dx, 6
        imul    dx
        mov     di, ax
        mov     dx, word ptr [W_903F]
        mov     bx, word ptr [W_903D]
        mov     si, ax
        mov     word ptr [si + TBL_8832], dx
        mov     word ptr [si + TBL_8830], bx
        mov     word ptr [di + TBL_8834], 0
        xor     cx, cx
        mov     si, TBL_8830
        jmp     near br_c9e0b
br_c9d6a:
        mov     ax, word ptr [si + 2]
        mov     dx, word ptr [si]
        cmp     ax, word ptr [bp - 0eh]
        jnz     br_c9d83
        cmp     dx, word ptr [bp - 10h]
        jnz     br_c9d83
        mov     al, cl
        inc     al
        mov     byte ptr [B_F240], al
        jmp     near br_c9e13
br_c9d83:
        mov     ax, word ptr [si + 2]
        mov     dx, word ptr [si]
        cmp     ax, word ptr [bp - 0eh]
        jc      br_c9e07
        ja      br_c9d94
        cmp     dx, word ptr [bp - 10h]
        jbe     br_c9e07
br_c9d94:
        cmp     byte ptr [B_8A88], 62h
        jc      br_c9d9d
        jmp     br_c9e13
br_c9d9d:
        mov     al, byte ptr [B_8A88]
        inc     al
        mov     byte ptr [B_8A88], al
        mov     ah, 0
        mov     word ptr [bp - 4], ax
        mov     dx, 6
        imul    dx
        mov     dx, ax
        mov     si, ax
        mov     di, dx
        add     di, TBL_882E
        jmp     br_c9dda
loop_c9dbb:
        mov     ax, word ptr [si + TBL_882C]
        mov     dx, word ptr [si + TBL_882A]
        mov     word ptr [si + TBL_8832], ax
        mov     word ptr [si + TBL_8830], dx
        mov     ax, word ptr [di]
        mov     word ptr [si + TBL_8834], ax
        sub     si, 6
        sub     di, 6
        dec     word ptr [bp - 4]
br_c9dda:
        cmp     word ptr [bp - 4], cx
        jg      loop_c9dbb
        mov     ax, cx
        mov     dx, 6
        imul    dx
        mov     di, ax
        mov     dx, word ptr [bp - 0eh]
        mov     bx, word ptr [bp - 10h]
        mov     si, ax
        mov     word ptr [si + TBL_8832], dx
        mov     word ptr [si + TBL_8830], bx
        mov     word ptr [di + TBL_8834], 1000h
        mov     al, cl
        inc     al
        mov     byte ptr [B_F240], al
        jmp     br_c9e13
br_c9e07:
        add     si, 6
        inc     cx
br_c9e0b:
        cmp     word ptr [bp - 16h], cx
        jl      br_c9e13
        jmp     near br_c9d6a
br_c9e13:
        push    1
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word B_F240
        nop
        push    cs
        call    fn_c9fa6
        add     sp, 0eh
        mov     word ptr [bp - 2], 0
        jmp     tgt_c9f1e
tgt_c9e33:
        if      FW_VERSION < 311
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
        endif
        mov     word ptr [bp - 2], 0
        cmp     byte ptr [B_F240], 1
        jnz     br_c9e6d
        cmp     byte ptr [B_8A88], 1
        jnz     br_c9e4c
        dec     byte ptr [B_8A88]
        jmp     br_c9e52
br_c9e4c:
        mov     word ptr [TBL_8834], 1000h
br_c9e52:
        push    1
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word B_F240
        nop
        push    cs
        call    fn_c9fa6
        add     sp, 0eh
        jmp     near tgt_c9f1e
br_c9e6d:
        cmp     byte ptr [B_8A88], 0
        jnz     br_c9e77
        jmp     near tgt_c9f1e
br_c9e77:
        mov     al, byte ptr [B_F240]
        cbw
        mov     cx, ax
        mov     dx, 6
        imul    dx
        mov     di, ax
        mov     si, ax
        mov     ax, TBL_882A
        add     ax, di
        add     ax, 4
        mov     di, ax
        mov     al, byte ptr [B_8A88]
        mov     ah, 0
        mov     word ptr [bp - 16h], ax
        jmp     br_c9eb7
loop_c9e9a:
        mov     ax, word ptr [si + TBL_8832]
        mov     dx, word ptr [si + TBL_8830]
        mov     word ptr [si + TBL_882C], ax
        mov     word ptr [si + TBL_882A], dx
        mov     ax, word ptr [si + TBL_8834]
        mov     word ptr [di], ax
        add     si, 6
        add     di, 6
        inc     cx
br_c9eb7:
        cmp     word ptr [bp - 16h], cx
        jg      loop_c9e9a
        dec     byte ptr [B_8A88]
        push    1
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word B_F240
        nop
        push    cs
        call    fn_c9fa6
        add     sp, 0eh
        jmp     tgt_c9f1e
tgt_c9eda:
        dec     byte ptr [B_F240]
        push    1
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word B_F240
        nop
        push    cs
        call    fn_c9fa6
        add     sp, 0eh
        mov     word ptr [bp - 2], 0
        jmp     tgt_c9f1e
tgt_c9efd:
        inc     byte ptr [B_F240]
        push    1
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word B_F240
        nop
        push    cs
        call    fn_c9fa6
        add     sp, 0eh
        mov     word ptr [bp - 2], 0
tgt_c9f1e:
        cmp     word ptr [bp - 2], 0
        jnz     br_c9f27
        jmp     br_c9cdb
br_c9f27:
        mov     word ptr [TBL_882E], 1000h
        cmp     byte ptr [B_8A88], 0
        jz      br_c9f7b
        xor     cx, cx
        mov     si, TBL_8830
        mov     al, byte ptr [B_8A88]
        mov     ah, 0
        mov     word ptr [bp - 16h], ax
        jmp     br_c9f5c
loop_c9f43:
        mov     ax, word ptr [si + 2]
        mov     dx, word ptr [si]
        cmp     ax, word ptr [W_903B]
        jc      br_c9f58
        ja      br_c9f61
        cmp     dx, word ptr [W_9039]
        jbe     br_c9f58
        jmp     br_c9f61
br_c9f58:
        add     si, 6
        inc     cx
br_c9f5c:
        cmp     word ptr [bp - 16h], cx
        jg      loop_c9f43
br_c9f61:
        or      cx, cx
        jz      br_c9f7b
        mov     ax, cx
        mov     dx, 6
        imul    dx
        mov     dx, TBL_882A
        add     dx, 4
        add     ax, dx
        mov     bx, ax
        mov     ax, word ptr [bx]
        mov     word ptr [TBL_882E], ax
br_c9f7b:
        push    word ptr [W_9047]
        push    word ptr [W_9045]
        callf   SEG_E707:far_e7073
        add     sp, 4
        mov     ax, word ptr [bp - 2]
        pop     di
        pop     si
        leave
        retf
TBL_c9f92:
        dw      tgt_c9efd
        dw      tgt_c9f1e
        dw      tgt_c9f1e
        dw      tgt_c9d04
        dw      tgt_c9e33
        dw      tgt_c9eda
TBL_c9f9e:
        dw      tgt_c9bf7
        dw      tgt_c9cc3
        dw      tgt_c9c55
        dw      tgt_c9c55
fn_c9fa6:
        push    bp
        mov     bp, sp
        sub     sp, 0ch
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        cmp     al, byte ptr [B_8A88]
        jbe     br_c9fbe
        mov     al, byte ptr [B_8A88]
        mov     byte ptr es:[bx], al
br_c9fbe:
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx], 0
        jnz     br_c9fcb
        mov     byte ptr es:[bx], 1
br_c9fcb:
        cmp     byte ptr [B_8A88], 0
        jnz     br_c9fe8
        mov     word ptr [bp - 0ah], 1
        mov     word ptr [bp - 0ch], 100h
        mov     word ptr [bp - 6], 0
        mov     word ptr [bp - 8], 2710h
        jmp     br_ca042
br_c9fe8:
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        mov     dx, 6
        imul    dx
        mov     bx, ax
        push    word ptr [bx + TBL_882C]
        push    word ptr [bx + TBL_882A]
        push    ds
        push    word B_901B
        callf   SEG_EADF:far_eadf4
        add     sp, 0ch
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        mov     dx, 6
        imul    dx
        mov     bx, ax
        mov     bx, word ptr [bx + TBL_882E]
        xor     cx, cx
        xor     dx, dx
        mov     ax, 2710h
        callf   0f800h:far_fa0c8
        add     ax, 800h
        adc     dx, 0
        mov     cl, 0ch
        callf   0f800h:far_fa1cd
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
br_ca042:
        push    9
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        callf   SEG_EA92:far_eab36
        add     sp, 6
        push    1fh
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0
        push    word 2710h
        mov     bx, word ptr [W_D651]
        xor     cx, cx
        mov     dx, word ptr [bp - 6]
        mov     ax, word ptr [bp - 8]
        callf   0f800h:far_fa0c8
        add     ax, 1388h
        adc     dx, 0
        push    dx
        push    ax
        callf   0f800h:far_fa105
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        cmp     word ptr [bp - 2], 0
        jc      br_ca0ab
        ja      br_ca0a1
        cmp     word ptr [bp - 4], 0bb8h
        jbe     br_ca0ab
br_ca0a1:
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 0bb8h
br_ca0ab:
        cmp     word ptr [bp - 2], 0
        ja      br_ca0c4
        jc      br_ca0ba
        cmp     word ptr [bp - 4], 12ch
        jnc     br_ca0c4
br_ca0ba:
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 12ch
br_ca0c4:
        mov     al, byte ptr [B_7FCB]
        cbw
        push    ax
        mov     al, byte ptr [B_7FCA]
        cbw
        push    ax
        push    0
        push    0
        push    word ptr [bp - 4]
        callf   SEG_DE78:far_de7ae
        add     sp, 6
        push    ax
        callf   SEG_DE78:far_de88f
        add     sp, 6
        mov     cx, ax
        mov     al, byte ptr [B_7FCA]
        cbw
        shl     ax, 2
        mov     bx, ax
        push    word ptr [bx + TBL_65DA]
        push    word ptr [bx + TBL_65D8]
        mov     ax, cx
        mov     bx, 0ah
        cwd
        idiv    bx
        push    dx
        mov     ax, cx
        cwd
        idiv    bx
        push    ax
        push    ds
        push    word STR_6856
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ch
        push    0
        push    64h
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        callf   0f800h:far_fa105
        les     bx, dword ptr [bp + 0ah]
        mov     word ptr es:[bx], ax
        mov     ax, word ptr es:[bx]
        cwd
        push    ax
        push    dx
        xor     dx, dx
        mov     ax, 64h
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        mov     dx, word ptr [bp - 8]
        sub     dx, ax
        les     bx, dword ptr [bp + 0eh]
        mov     word ptr es:[bx], dx
        cmp     word ptr [bp + 12h], 0
        jz      br_ca16a
        push    2
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    4
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_ca16a:
        leave
        retf
fn_ca16c:
        push    bp
        mov     bp, sp
        sub     sp, 2
        if      FW_VERSION >= 311
        push    si
        push    di
        endif
        push    0
        callf   SEG_EB7C:far_eb845
        add     sp, 2
        push    ds
        push    word STR_6860
        callf   SEG_B52D:far_b6cd3
        add     sp, 4
        mov     byte ptr [B_D5DD], 2
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0ah
        push    17h
        push    0
        push    2
        push    ds
        if      FW_VERSION >= 312
        push    word P_F245
        elseif  FW_VERSION = 311
        push    word P_F18D_V311
        else
        push    word P_E279_V308
        endif
        push    ds
        push    word STR_686F
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0ah
        push    3bh
        push    0
        push    2
        push    ds
        if      FW_VERSION >= 312
        push    word P_F244
        elseif  FW_VERSION = 311
        push    word P_F18C_V311
        else
        push    word P_E278_V308
        endif
        push    ds
        push    word A_66A7
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0ah
        push    3bh
        push    0
        push    2
        push    ds
        if      FW_VERSION >= 312
        push    word P_F243
        elseif  FW_VERSION = 311
        push    word P_F18B_V311
        else
        push    word P_E277_V308
        endif
        push    ds
        push    word A_66A7
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0ah
        push    1dh
        push    0
        push    2
        push    ds
        if      FW_VERSION >= 312
        push    word P_F242
        elseif  FW_VERSION = 311
        push    word P_F18A_V311
        else
        push    word P_E276_V308
        endif
        push    ds
        push    word A_66A7
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0ah
        push    ds
        push    word P_0210+4
        push    ds
        push    word B_7FCB
        push    ds
        push    word STR_6876
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_6884
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     byte ptr [bp - 2], 0
        if      FW_VERSION >= 311
        jmp     near br_ca2cf
loop_ca229:
        mov     al, byte ptr [B_7B8D]
        cbw
        cmp     ax, 4
        jnz     loop_ca27e
        mov     al, byte ptr [B_7FCB]
        cbw
        mov     di, ax
        shl     ax, 2
        mov     bx, ax
        mov     ax, word ptr [bx + 5e6h]
        mov     dx, word ptr [bx + 5e4h]
        mov     word ptr [W_D633], ax
        mov     word ptr [W_D631], dx
        xor     cx, cx
        xor     si, si
        mov     ax, di
        mov     dx, 6
        imul    dx
        mov     dx, ax
loop_ca259:
        mov     bx, dx
        add     bx, si
        mov     ax, word ptr [bx + 5f4h]
        mov     word ptr [si + TBL_D62B], ax
        add     si, 2
        inc     cx
        cmp     si, 6
        jnz     loop_ca259
        push    ds
        push    word A_8A89
        push    ds
        push    word TBL_8A93
        callf   SEG_EB63:far_eb6bd
        add     sp, 8
loop_ca27e:
        else
        jmp     br_ca2cf
L_d375c:
        endif
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     byte ptr [bp - 1], al
        or      al, al
        if      FW_VERSION >= 311
        jz      loop_ca229
        else
        jz      L_d375c
        endif
        cbw
        cmp     ax, 78h
        jnz     br_ca2cb
        push    ds
        if      FW_VERSION >= 312
        push    word P_F241
        elseif  FW_VERSION = 311
        push    word P_F189_V311
        else
        push    word P_E275_V308
        endif
        nop
        push    cs
        call    fn_ca2e7
        add     sp, 4
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
        jmp     br_ca2cf
br_ca2cb:
        mov     byte ptr [bp - 2], 1
br_ca2cf:
        cmp     byte ptr [bp - 2], 0
        if      FW_VERSION >= 311
        jz      loop_ca27e
        else
        jz      L_d375c
        endif
        push    1
        callf   SEG_EB7C:far_eb845
        add     sp, 2
        mov     al, byte ptr [bp - 1]
        cbw
        if      FW_VERSION >= 311
        pop     di
        pop     si
        endif
        leave
        retf
fn_ca2e7:
        push    bp
        mov     bp, sp
        push    si
        push    di
        callf   SEG_CB8A:far_cc62d
        callf   SEG_B1AA:far_b1af9
        xor     si, si
        mov     di, word ptr [bp + 6]
        inc     di
loop_ca2fc:
        mov     es, word ptr [bp + 8]
        mov     al, byte ptr es:[di]
        mov     byte ptr [si + TBL_D5FF], al
        inc     di
        inc     si
        cmp     si, 4
        jl      loop_ca2fc
        callf   SEG_D75F:far_d777e
        mov     byte ptr [B_D5FD], 1
loop_ca317:
        mov     al, byte ptr [B_D5FE]
        cbw
        or      ax, ax
        jz      loop_ca317
        mov     dx, 0d0h
        in      al, dx
        jmp     br_ca35a
loop_ca325:
        nop
        push    cs
        call    fn_ca39a
        or      ax, ax
        jz      br_ca333
        mov     byte ptr [B_D5FD], 0
br_ca333:
        push    6
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     al, byte ptr [B_D600]
        cbw
        push    ax
        mov     al, byte ptr [B_D601]
        cbw
        push    ax
        mov     al, byte ptr [B_D602]
        cbw
        push    ax
        push    ds
        push    word STR_6895
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ah
br_ca35a:
        cmp     byte ptr [B_D5FE], 0
        jnz     loop_ca325
        callf   SEG_D75F:far_d77b3
        mov     dx, 0d0h
        in      al, dx
        callf   SEG_B1AA:far_b1aff
        pop     di
        pop     si
        pop     bp
        retf
fn_ca373:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [B_7FCB]
        cbw
        push    ax
        mov     al, byte ptr [B_7FCA]
        cbw
        push    ax
        push    0
        push    0
        push    word ptr [bp + 6]
        callf   SEG_DE78:far_de7ae
        add     sp, 6
        push    ax
        callf   SEG_DE78:far_de88f
        add     sp, 6
        pop     bp
        retf
fn_ca39a:
        push    bp
        mov     bp, sp
        sub     sp, 2
        mov     dx, 0d2h
        in      al, dx
        test    al, 2
        jnz     br_ca3c0
        mov     dx, 0d0h
        in      al, dx
        mov     ah, 0
        mov     word ptr [bp - 2], ax
        cmp     word ptr [bp - 2], 40h
        jnz     br_ca3bc
        mov     ax, 1
        jmp     br_ca3be
br_ca3bc:
        xor     ax, ax
br_ca3be:
        leave
        retf
br_ca3c0:
        xor     ax, ax
        leave
        retf
        if      FW_VERSION >= 312
        phase   4
        elseif  FW_VERSION = 311
        phase   3
        else
        phase   0
        endif
far_ca3c4:
        push    bp
        mov     bp, sp
        sub     sp, 4ch
        push    si
        push    di
        push    ds
        push    word STR_691C
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        mov     word ptr [W_9480], 1
        mov     word ptr [W_947E], 100h
        mov     ax, word ptr [W_904B]
        xor     dx, dx
        add     dx, 100h
        adc     ax, 1
        mov     word ptr [W_947C], ax
        mov     word ptr [W_947A], dx
        mov     al, byte ptr [B_8A9A]
        mov     byte ptr [bp - 4], al
        mov     word ptr [bp - 8], 0
        mov     si, 1
        mov     byte ptr [bp - 1], 0
        jmp     br_ca7e7
br_ca40c:
        or      si, si
        jnz     br_ca413
        jmp     br_ca5bc
br_ca413:
        xor     si, si
        callf   SEG_B05A:far_b05a7
        mov     al, byte ptr [bp - 4]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_905D]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_90C1]
        cbw
        and     ax, 4
        mov     di, ax
        mov     word ptr [bp - 8], ax
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    0ah
        push    ds
        if      FW_VERSION >= 312
        push    word P_68A5+3
        elseif  FW_VERSION = 311
        push    word P_67FB_V311+3
        else
        push    word P_6152_V308+2
        endif
        push    ds
        push    word B_7FE3
        push    ds
        push    word STR_6937
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    8
        push    4bh
        push    32h
        push    2
        push    ds
        push    word B_7FE2
        push    ds
        push    word STR_6943
        callf   SEG_B347:far_b3819
        add     sp, 10h
        cmp     byte ptr [B_7FE3], 1
        jz      br_ca494
        cmp     byte ptr [B_7FE3], 3
        jz      br_ca494
        push    19h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_694F
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_ca494:
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        mov     byte ptr [bp - 2], 1
        mov     al, byte ptr [B_7FE1]
        mov     byte ptr [bp - 3], al
        cmp     byte ptr [B_7FE1], 0
        jge     br_ca4ba
        mov     byte ptr [bp - 2], 0
        neg     al
        mov     byte ptr [bp - 3], al
br_ca4ba:
        push    7
        push    ds
        push    word P_0220+8
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ds
        push    word STR_6959
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    8
        push    63h
        push    0
        push    2
        push    ss
        lea     ax, [bp - 3]
        push    ax
        push    ds
        push    word STR_6967
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_697A
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    8
        push    63h
        push    0
        push    2
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ds
        push    word STR_698E
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    8
        push    4
        mov     al, byte ptr [bp - 4]
        cbw
        push    ax
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_B702:far_b9073
        add     sp, 8
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word W_947E
        push    ds
        push    word STR_6995
        callf   SEG_B347:far_b39a2
        add     sp, 8
        push    ds
        push    word W_947A
        push    ds
        if      FW_VERSION >= 312
        push    word P_699C
        elseif  FW_VERSION = 311
        push    word P_699C
        else
        push    word P_699C
        endif
        callf   SEG_B347:far_b39a2
        add     sp, 8
        push    0
        push    6
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     byte ptr [bp - 4], 0
        jnz     br_ca589
        push    ds
        push    word STR_699E
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_ca59a
br_ca589:
        mov     word ptr [bp - 8], di
        push    di
        push    ss
        lea     ax, [bp - 4ch]
        push    ax
        callf   SEG_B920:far_b9f33
        add     sp, 6
br_ca59a:
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_69A8
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_ca5bc:
        mov     word ptr [bp - 6], 0
        jmp     br_ca6ed
br_ca5c4:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     bx, ax
        cmp     bx, 6
        jbe     br_ca5d2
        jmp     br_ca6e7
br_ca5d2:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_ca7f8]
tgt_ca5d9:
        cmp     byte ptr [B_7FE3], 1
        jz      tgt_ca5ec
        cmp     byte ptr [B_7FE3], 3
        jz      tgt_ca5ec
        mov     byte ptr [B_7FE2], 32h
tgt_ca5ec:
        nop
        push    cs
        call    far_ca806
        mov     al, byte ptr [B_8808]
        mov     ah, 0
        sub     ax, word ptr [W_880C]
        cwd
        sub     ax, dx
        mov     dx, ax
        sar     dx, 1
        mov     al, byte ptr [bp - 3]
        cbw
        cmp     ax, dx
        jl      br_ca610
        mov     al, dl
        dec     al
        mov     byte ptr [bp - 3], al
br_ca610:
        cmp     byte ptr [bp - 3], 0
        jge     br_ca61a
        mov     byte ptr [bp - 3], 0
br_ca61a:
        cmp     byte ptr [bp - 2], 0
        jz      br_ca628
        mov     al, byte ptr [bp - 3]
        mov     byte ptr [B_7FE1], al
        jmp     br_ca630
br_ca628:
        mov     al, byte ptr [bp - 3]
        neg     al
        mov     byte ptr [B_7FE1], al
br_ca630:
        cmp     byte ptr [B_7FE3], 1
        jz      br_ca658
        cmp     byte ptr [B_7FE3], 3
        jz      br_ca658
        push    19h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word A_694F
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     br_ca67a
br_ca658:
        push    19h
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        if      FW_VERSION >= 312
        push    word STR_6943_2+4
        elseif  FW_VERSION = 311
        push    word STR_6943_2+4
        else
        push    word STR_6943_2+4
        endif
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_ca67a:
        push    3
        callf   SEG_B05A:far_b1073
        add     sp, 2
        mov     word ptr [bp - 6], 1
        jmp     br_ca6e7
tgt_ca68b:
        mov     al, byte ptr [bp - 4]
        cbw
        mov     dx, ax
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_905D]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_90C1]
        cbw
        and     ax, 4
        mov     di, ax
        mov     word ptr [bp - 8], ax
        push    8
        push    4
        push    dx
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_B702:far_b9073
        add     sp, 8
        mov     si, 1
        jmp     br_ca6e7
tgt_ca6be:
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        push    ds
        push    word W_947A
        push    ds
        push    word W_947E
        callf   SEG_B702:far_b915e
        add     sp, 0ah
        push    5
        callf   SEG_B05A:far_b1073
        add     sp, 2
        push    6
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_ca6e7:
        or      si, si
        jz      br_ca6ed
        jmp     br_ca701
br_ca6ed:
        push    41h
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     byte ptr [bp - 1], al
        or      al, al
        jnz     br_ca701
        jmp     br_ca5c4
br_ca701:
        or      si, si
        jz      br_ca708
        jmp     br_ca7e7
br_ca708:
        cmp     word ptr [bp - 6], 0
        jz      br_ca735
        cmp     byte ptr [B_901B], 0
        jl      br_ca735
        mov     ax, word ptr [W_9053]
        mov     dx, word ptr [W_9051]
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp - 0ch], dx
        mov     word ptr [W_9053], 0
        push    ax
        push    word ptr [W_9051]
        callf   SEG_E561:far_e5612
        add     sp, 4
br_ca735:
        mov     al, byte ptr [bp - 1]
        cbw
        mov     dx, ax
        cmp     ax, 44h
        jz      br_ca74d
        cmp     ax, 4eh
        jz      br_ca74d
        cmp     ax, 78h
        jz      br_ca777
        jmp     near br_ca7e7
br_ca74d:
        cmp     byte ptr [bp - 4], 0
        jnz     br_ca75a
        mov     byte ptr [bp - 1], 0
        jmp     near br_ca7e7
br_ca75a:
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    ss
        lea     ax, [bp - 4ch]
        push    ax
        push    di
        push    7
        push    6
        push    dx
        callf   SEG_B920:far_b9fbd
        add     sp, 10h
        mov     byte ptr [bp - 1], al
        jmp     br_ca7e7
br_ca777:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     byte ptr [B_7FE3], 0
        jnz     br_ca7a9
        push    ds
        push    word STR_69D1
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0ah
        callf   SEG_B059:far_b059a
        add     sp, 2
        mov     byte ptr [bp - 1], 0
        mov     si, 1
        jmp     br_ca7e7
br_ca7a9:
        push    ds
        push    word STR_69F2
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     byte ptr [TBL_905D], 0
        push    word ptr [W_9480]
        push    word ptr [W_947E]
        callf   SEG_E561:far_e5612
        add     sp, 4
        push    ss
        lea     ax, [bp - 4ch]
        push    ax
        mov     al, byte ptr [bp - 4]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_905D]
        cbw
        push    ax
        callf   SEG_E4A4:far_e4a4b
        add     sp, 6
        mov     byte ptr [bp - 1], 4dh
br_ca7e7:
        cmp     byte ptr [bp - 1], 0
        jnz     br_ca7f0
        jmp     br_ca40c
br_ca7f0:
        mov     al, byte ptr [bp - 1]
        cbw
        pop     di
        pop     si
        leave
        retf
TBL_ca7f8:
        dw      tgt_ca5d9
        dw      tgt_ca5d9
        dw      tgt_ca5ec
        dw      tgt_ca5ec
        dw      tgt_ca68b
        dw      tgt_ca6be
        dw      tgt_ca6be
far_ca806:
        mov     al, byte ptr [B_7FE3]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_68C8]
        mov     byte ptr [B_8809], al
        shl     al, 1
        mov     byte ptr [B_8808], al
        mov     al, byte ptr [B_8809]
        mov     ah, 0
        mov     dl, byte ptr [B_7FE2]
        mov     dh, 0
        imul    dx
        add     ax, 19h
        mov     bx, 32h
        cwd
        idiv    bx
        mov     word ptr [W_880C], ax
        retf
        if      FW_VERSION >= 312
        phase   2
        elseif  FW_VERSION = 311
        phase   1
        else
        phase   0eh
        endif
far_ca832:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    ds
        push    word STR_6A1A
        callf   SEG_EC03:far_ec03b
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
        if      FW_VERSION >= 311
        mov     al, byte ptr [B_9783]
        mov     byte ptr [bp - 4], al
        mov     al, byte ptr [B_955F]
        cbw
        mov     word ptr [bp - 2], ax
        cmp     word ptr [bp - 2], 0
        jnz     br_ca884
        cmp     byte ptr [B_9783], 0
        jz      br_ca884
        mov     al, byte ptr [B_8A9A]
        mov     byte ptr [bp - 4], al
br_ca884:
        endif
        push    0
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION < 311
        mov     al, byte ptr [B_9783]
        mov     byte ptr [bp - 4], al
        endif
        push    8
        push    63h
        push    0
        push    2
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ds
        push    word STR_6A24
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    8
        push    1
        mov     al, byte ptr [bp - 4]
        cbw
        push    ax
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_B702:far_b9073
        add     sp, 8
        push    1eh
        push    1
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        if      FW_VERSION < 311
        mov     al, byte ptr [B_955F]
        cbw
        mov     word ptr [bp - 2], ax
        endif
        push    0
        push    63h
        push    0ff9dh
        push    3
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ds
        push    word STR_6A2B
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    5
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_6A33
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_6A52
        callf   SEG_EC03:far_ec03b
        add     sp, 4
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word W_947E
        push    ds
        push    word STR_6A66
        callf   SEG_B347:far_b39a2
        add     sp, 8
        push    ds
        push    word W_947A
        push    ds
        if      FW_VERSION >= 312
        push    word P_6A6D
        elseif  FW_VERSION = 311
        push    word P_6A6D
        else
        push    word P_6A6D
        endif
        callf   SEG_B347:far_b39a2
        add     sp, 8
        callf   SEG_B702:far_b90dd
        push    ds
        push    word STR_6A6F
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        xor     dx, dx
        jmp     br_caa89
br_ca956:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     bx, ax
        cmp     bx, 3
        ja      br_ca9dc
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_caa94]
tgt_ca968:
        mov     al, byte ptr [bp - 4]
        cbw
        mov     bx, ax
        cmp     byte ptr [bx + TBL_905D], 0ffh
        jnz     br_ca981
        push    ds
        push    word B_901B
        callf   SEG_E344:far_e37be
        add     sp, 4
br_ca981:
        push    8
        push    1
        mov     al, byte ptr [bp - 4]
        cbw
        push    ax
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_B702:far_b9073
        add     sp, 8
        mov     al, byte ptr [bp - 4]
        mov     byte ptr [B_9783], al
        jmp     br_ca9dc
tgt_ca99f:
        mov     al, byte ptr [bp - 2]
        mov     byte ptr [B_955F], al
        cbw
        push    ax
        push    2
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        jmp     br_ca9dc
tgt_ca9b3:
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
br_ca9dc:
        push    41h
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jnz     br_ca9ef
        jmp     near br_ca956
br_ca9ef:
        cmp     ax, 44h
        jnz     br_ca9f7
        jmp     near br_caa87
br_ca9f7:
        cmp     ax, 4eh
        jz      br_caa64
        cmp     ax, 78h
        jz      br_caa04
        jmp     near br_caa89
br_caa04:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_6A85
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_E6FE:far_e7069
        mov     al, byte ptr [B_8A9F]
        mov     byte ptr [bp - 3], al
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        mov     al, byte ptr [bp - 3]
        push    ax
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 4]
        else
        mov     al, byte ptr [B_9783]
        endif
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_905D]
        cbw
        push    ax
        mov     al, byte ptr [B_955F]
        cbw
        push    ax
        callf   SEG_E7DB:far_e7db2
        add     sp, 6
        mov     byte ptr [B_955F], 0
        push    0
        push    2
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        mov     dx, 4dh
        jmp     br_caa89
br_caa64:
        mov     al, byte ptr [B_D4C1]
        cbw
        add     ax, 0ffc4h
        mov     word ptr [bp - 2], ax
        mov     byte ptr [B_955F], al
        cbw
        push    ax
        push    2
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
br_caa87:
        xor     dx, dx
br_caa89:
        or      dx, dx
        jnz     br_caa90
        jmp     near br_ca9dc
br_caa90:
        mov     ax, dx
        leave
        retf
TBL_caa94:
        dw      tgt_ca968
        dw      tgt_ca99f
        dw      tgt_ca9b3
        dw      tgt_ca9b3
        if      FW_VERSION >= 312
        phase   0ch
        elseif  FW_VERSION = 311
        phase   0bh
        else
        phase   5
        endif
far_caa9c:
        push    bp
        mov     bp, sp
        push    si
        push    di
        push    ds
        pop     es
        mov     di, A_F275
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
        push    word A_F275
        push    1
        callf   SEG_CAD0:far_cad00
        add     sp, 4
        pop     di
        pop     si
        pop     bp
        retf
far_caade:
        push    bp
        mov     bp, sp
        push    si
        push    di
        push    ds
        pop     es
        mov     di, A_F275
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
        push    word A_F275
        push    2
        callf   SEG_CAD0:far_cad00
        add     sp, 4
        pop     di
        pop     si
        pop     bp
        retf
far_cab20:
        push    bp
        mov     bp, sp
        push    word ptr [bp + 6]
        push    0
        push    3
        callf   SEG_CAD0:far_cad00
        add     sp, 6
        pop     bp
        retf
far_cab34:
        push    bp
        mov     bp, sp
        push    word ptr [bp + 6]
        push    0
        push    0eh
        callf   SEG_CAD0:far_cad00
        add     sp, 6
        pop     bp
        retf
far_cab48:
        push    bp
        mov     bp, sp
        push    word ptr [bp + 6]
        push    0
        push    0fh
        callf   SEG_CAD0:far_cad00
        add     sp, 6
        pop     bp
        retf
far_cab5c:
        push    bp
        mov     bp, sp
        push    si
        push    di
        push    ds
        pop     es
        mov     di, A_F275
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
        push    word A_F275
        push    6
        callf   SEG_CAD0:far_cad00
        add     sp, 4
        pop     di
        pop     si
        pop     bp
        retf
far_cab9e:
        push    bp
        mov     bp, sp
        push    si
        push    di
        push    ds
        pop     es
        mov     di, A_F275
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
        push    ds
        pop     es
        mov     di, A_F261
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
        push    word A_F261
        push    word A_F275
        push    7
        callf   SEG_CAD0:far_cad00
        add     sp, 6
        pop     di
        pop     si
        pop     bp
        retf
far_cac0f:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        push    di
        push    ds
        pop     es
        mov     di, A_F275
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
        push    ds
        pop     es
        mov     di, A_F246
        mov     ax, word ptr [bp + 0ch]
        mov     si, word ptr [bp + 0ah]
        mov     cx, 0dh
        push    ds
        mov     ds, ax
        rep movsw
        movsb
        pop     ds
        push    word A_F246
        push    word A_F275
        push    9
        callf   SEG_CAD0:far_cad00
        add     sp, 6
        mov     word ptr [bp - 2], ax
        les     di, dword ptr [bp + 0ah]
        mov     si, A_F246
        mov     cx, 0dh
        rep movsw
        movsb
        pop     di
        pop     si
        leave
        retf
far_cac7b:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        push    di
        push    ds
        pop     es
        mov     di, A_F275
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
        push    ds
        pop     es
        mov     di, A_F246
        mov     ax, word ptr [bp + 0ch]
        mov     si, word ptr [bp + 0ah]
        mov     cx, 0dh
        push    ds
        mov     ds, ax
        rep movsw
        movsb
        pop     ds
        push    word A_F246
        push    word A_F275
        push    0ah
        callf   SEG_CAD0:far_cad00
        add     sp, 6
        mov     word ptr [bp - 2], ax
        les     di, dword ptr [bp + 0ah]
        mov     si, A_F246
        mov     cx, 0dh
        rep movsw
        movsb
        pop     di
        pop     si
        leave
        retf
far_cace7:
        push    bp
        mov     bp, sp
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    0ch
        callf   SEG_CAD0:far_cad00
        add     sp, 8
        pop     bp
        retf
        if      FW_VERSION >= 312
        db      0ffh
        phase   0
        elseif  FW_VERSION = 311
        phase   0eh
        else
        phase   8
        endif
far_cad00:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp + 6]
        cmp     ax, 0ch
        jnz     br_cad17
        mov     bx, word ptr [bp + 8]
        mov     dx, word ptr [bp + 0ah]
        mov     cx, word ptr [bp + 0ch]
        jmp     br_cad32
        db      090h
br_cad17:
        cmp     ax, 0
        jnz     br_cad29
        callf   SEG_D546:far_d5bc3
        mov     ax, 0
        int     41h
        jmp     br_cad4b
        db      090h
br_cad29:
        mov     dx, word ptr [bp + 8]
        mov     bx, word ptr [bp + 0ah]
        mov     cx, word ptr [bp + 0ch]
br_cad32:
        int     41h
        or      ax, ax
        jnz     br_cad4d
        mov     ax, word ptr [bp + 6]
        cmp     al, 4
        jz      br_cad43
        cmp     al, 5
        jnz     br_cad4b
br_cad43:
        cmp     cx, word ptr [bp + 0ch]
        mov     ax, 0f500h
        jnz     br_cad4d
br_cad4b:
        xor     ax, ax
br_cad4d:
        sti
        pop     bp
        retf
far_cad50:
        push    bp
        mov     bp, sp
        push    ds
        push    di
        mov     ax, 8
        int     41h
        lds     di, dword ptr [bp + 6]
        mov     word ptr [di], dx
        lds     di, dword ptr [bp + 0ah]
        mov     word ptr [di], cx
        lds     di, dword ptr [bp + 0eh]
        mov     word ptr [di], bx
        pop     di
        pop     ds
        pop     bp
        retf
far_cad6d:
        push    bp
        mov     bp, sp
        push    ds
        lds     dx, dword ptr [bp + 6]
        mov     bx, word ptr [bp + 0ah]
        mov     cx, word ptr [bp + 0ch]
        mov     ax, 4
        int     41h
        or      ax, ax
        jnz     br_cad8d
        cmp     cx, word ptr [bp + 0ch]
        mov     ax, 0f500h
        jnz     br_cad8d
        xor     ax, ax
br_cad8d:
        pop     ds
        pop     bp
        retf
far_cad90:
        push    bp
        mov     bp, sp
        push    ds
        lds     dx, dword ptr [bp + 6]
        mov     bx, word ptr [bp + 0ah]
        mov     cx, word ptr [bp + 0ch]
        mov     ax, 5
        int     41h
        or      ax, ax
        jnz     br_cadb0
        cmp     cx, word ptr [bp + 0ch]
        mov     ax, 0f500h
        jnz     br_cadb0
        xor     ax, ax
br_cadb0:
        pop     ds
        pop     bp
        retf
        db      0ffh
        if      FW_VERSION >= 312
        phase   4
        elseif  FW_VERSION = 311
        phase   2
        else
        phase   0ch
        endif
far_cadb4:
        push    bp
        mov     bp, sp
br_cadb7:
        mov     ax, word ptr [bp + 10h]
        or      ax, word ptr [bp + 0eh]
        jnz     br_cadc2
        jmp     br_cae31
        db      090h
br_cadc2:
        mov     cx, 0f000h
        cmp     word ptr [bp + 10h], 0
        jnz     br_cadd3
        cmp     word ptr [bp + 0eh], cx
        jnc     br_cadd3
        mov     cx, word ptr [bp + 0eh]
br_cadd3:
        mov     bl, byte ptr [bp + 0ch]
        mov     ax, word ptr [bp + 0ah]
        mov     dx, word ptr [bp + 8]
        push    ds
        mov     ds, ax
        mov     ax, word ptr [bp + 6]
        int     41h
        pop     ds
        or      ax, ax
        jnz     br_cae31
        or      cx, cx
        jz      br_cae31
        sub     word ptr [bp + 0eh], cx
        sbb     word ptr [bp + 10h], 0
        mov     dx, word ptr [bp + 0ah]
        xor     bx, bx
        shl     dx, 1
        rcl     bx, 1
        shl     dx, 1
        rcl     bx, 1
        shl     dx, 1
        rcl     bx, 1
        shl     dx, 1
        rcl     bx, 1
        add     dx, word ptr [bp + 8]
        adc     bx, 0
        add     dx, cx
        adc     bx, 0
        mov     ax, dx
        and     ax, 0fh
        shr     bx, 1
        rcr     dx, 1
        shr     bx, 1
        rcr     dx, 1
        shr     bx, 1
        rcr     dx, 1
        shr     bx, 1
        rcr     dx, 1
        mov     word ptr [bp + 0ah], dx
        mov     word ptr [bp + 8], ax
        jmp     short br_cadb7
br_cae31:
        pop     bp
        retf
fn_cae33:
        push    bp
        mov     bp, sp
        push    es
        mov     ah, byte ptr [bp + 6]
        mov     al, byte ptr [bp + 12h]
        mov     bx, word ptr [bp + 8]
        mov     es, word ptr [bp + 0ah]
        mov     ch, byte ptr [bp + 0eh]
        mov     cl, byte ptr [bp + 10h]
        mov     dh, byte ptr [bp + 0ch]
        mov     dl, 0
        int     40h
        jc      br_cae57
        xor     ah, ah
        jmp     br_cae59
        db      090h
br_cae57:
        xor     ax, ax
br_cae59:
        pop     es
        pop     bp
        retf
fn_cae5c:
        mov     ah, 8
        int     40h
        retf
        db      0ffh
        if      FW_VERSION >= 312
        phase   2
        elseif  FW_VERSION = 311
        phase   0
        else
        phase   0ah
        endif
far_cae62:
        push    bp
        mov     bp, sp
        push    di
        push    si
        push    es
        mov     es, word ptr [bp + 8]
        mov     bx, word ptr [bp + 6]
        mov     dx, 0
        mov     cx, 1
        mov     ax, 201h
        push    cs
        call    far_caee6
        nop
        cmp     ah, 0
        jnz     br_caedd
        mov     al, byte ptr es:[bx + 18h]
        mov     byte ptr [B_CEC2], al
        shl     al, 1
        mov     cl, al
        mov     ax, word ptr [bp + 0ah]
        div     cl
        cmp     byte ptr [B_CEC3], al
        jbe     br_cae9a
        mov     byte ptr [B_CEC3], al
br_cae9a:
        mov     al, byte ptr [B_CEC3]
        sub     ah, ah
        mov     si, ax
        mov     ch, byte ptr [bp + 0ch]
        mov     cl, 1
        mov     ax, 20h
        mov     dl, byte ptr [B_CEC2]
        mul     dl
        mov     di, ax
        mov     dx, 0
loop_caeb4:
        mov     ah, 2
        mov     al, byte ptr [B_CEC2]
        push    cs
        call    far_caee6
        nop
        cmp     ah, 0
        jnz     br_caedd
        mov     ax, es
        add     ax, di
        mov     es, ax
        inc     dh
        cmp     dh, 2
        jnz     loop_caeb4
        mov     dh, 0
        inc     ch
        dec     si
        jnz     loop_caeb4
        mov     ax, 0
        jmp     br_caee1
        db      090h
br_caedd:
        mov     al, ah
        mov     ah, 0ffh
br_caee1:
        pop     es
        pop     si
        pop     di
        pop     bp
        retf
far_caee6:
        push    di
        push    si
        mov     si, ax
        mov     di, 8
loop_caeed:
        mov     ax, si
        cmp     ah, 3
        jnz     br_caef7
        call    fn_caf18
br_caef7:
        int     40h
        jnc     br_caf0d
        cmp     di, 4
        ja      br_caf09
        push    ax
        mov     ah, 0
        int     40h
        call    fn_caf10
        pop     ax
br_caf09:
        dec     di
        jnz     loop_caeed
        stc
br_caf0d:
        pop     si
        pop     di
        retf
fn_caf10:
        push    cx
        mov     cx, 5000h
loop_caf14:
        loop    loop_caf14
        pop     cx
        ret
fn_caf18:
        push    ax
        push    bx
        push    cx
        push    dx
        xor     cx, cx
loop_caf1e:
        loop    loop_caf1e
        pop     dx
        pop     cx
        pop     bx
        pop     ax
        ret
        db      0ffh
        if      FW_VERSION >= 312
        phase   6
        elseif  FW_VERSION = 311
        phase   4
        else
        phase   0eh
        endif
far_caf26:
        push    bp
        mov     bp, sp
        push    di
        push    si
        push    es
        sub     sp, 200h
        mov     ax, ss
        mov     es, ax
        mov     bx, sp
        mov     dx, 0
        mov     cx, 1
        mov     ax, 201h
        callf   SEG_CAE6:far_caee6
        jc      br_caf9f
        mov     al, byte ptr es:[bx + 18h]
        mov     ah, byte ptr [B_CEC2]
        cmp     ah, al
        mov     ax, 0f400h
        jnz     br_cafa3
        mov     es, word ptr [bp + 8]
        mov     bx, word ptr [bp + 6]
        xor     ax, ax
        mov     al, byte ptr [B_CEC3]
        mov     si, ax
        mov     ch, byte ptr [bp + 0ah]
        mov     cl, 1
        mov     ax, 20h
        mov     dl, byte ptr [B_CEC2]
        mul     dl
        mov     di, ax
        mov     dx, 0
loop_caf75:
        mov     ah, 3
        mov     al, byte ptr [B_CEC2]
        callf   SEG_CAE6:far_caee6
        jc      br_caf9f
        mov     ax, es
        add     ax, di
        mov     es, ax
        inc     dh
        cmp     dh, 2
        jnz     loop_caf75
        mov     dh, 0
        inc     ch
        dec     si
        jnz     loop_caf75
        mov     byte ptr [B_CEC1], ch
        mov     ax, 0
        jmp     br_cafa3
        db      090h
br_caf9f:
        mov     al, ah
        mov     ah, 0ffh
br_cafa3:
        add     sp, 200h
        pop     es
        pop     si
        pop     di
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   0ch
        elseif  FW_VERSION = 311
        phase   0ah
        else
        phase   4
        endif
far_cafac:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 0c8h
        else
        sub     sp, 0c6h
        endif
        push    si
        push    di
        mov     si, word ptr [bp + 0ah]
        if      FW_VERSION >= 311
        mov     word ptr [W_F28A], 0ffffh
        else
        mov     byte ptr [B_E2BF_V308], 0ffh
        endif
        mov     word ptr [W_F28D], 0ffffh
        mov     word ptr [bp - 4], 0
        push    ss
        pop     es
        if      FW_VERSION >= 311
        lea     di, [bp - 0c8h]
        else
        lea     di, [bp - 0c6h]
        endif
        xor     ax, ax
        mov     ah, al
        mov     cx, 40h
        rep stosw
        cmp     word ptr [bp + 6], 1
        jnz     br_cb003
        mov     word ptr [bp - 2], 0
loop_cafe3:
        mov     bx, word ptr [bp - 2]
        mov     al, byte ptr [bx + TBL_E3AC]
        mov     ah, 0
        cmp     ax, word ptr [bp + 8]
        jnz     br_caffa
        push    bx
        callf   SEG_CDE1:far_cde12
        add     sp, 2
br_caffa:
        inc     word ptr [bp - 2]
        cmp     word ptr [bp - 2], 20h
        jc      loop_cafe3
br_cb003:
        cmp     si, 23h
        jl      br_cb02c
        mov     word ptr [bp - 2], 0
loop_cb00d:
        mov     bx, word ptr [bp - 2]
        mov     al, byte ptr [bx + TBL_E3AC]
        mov     ah, 0
        cmp     ax, si
        jnz     br_cb023
        push    bx
        callf   SEG_CDE1:far_cde12
        add     sp, 2
br_cb023:
        inc     word ptr [bp - 2]
        cmp     word ptr [bp - 2], 20h
        jc      loop_cb00d
br_cb02c:
        cmp     word ptr [bp + 0ch], 23h
        jl      br_cb057
        mov     word ptr [bp - 2], 0
loop_cb037:
        mov     bx, word ptr [bp - 2]
        mov     al, byte ptr [bx + TBL_E3AC]
        mov     ah, 0
        cmp     ax, word ptr [bp + 0ch]
        jnz     br_cb04e
        push    bx
        callf   SEG_CDE1:far_cde12
        add     sp, 2
br_cb04e:
        inc     word ptr [bp - 2]
        cmp     word ptr [bp - 2], 20h
        jc      loop_cb037
br_cb057:
        mov     ax, word ptr [W_E3AA]
        mov     word ptr [bp - 2], ax
        if      FW_VERSION >= 311
        xor     cx, cx
        mov     al, byte ptr [bp + 0eh]
        else
        xor     si, si
        mov     al, byte ptr [B_C8D4_V308]
        endif
        cbw
        if      FW_VERSION >= 311
        mov     word ptr [bp - 8], ax
        mov     al, byte ptr [B_CEC0]
        cbw
        mov     di, ax
        else
        mov     cx, ax
        endif
        jmp     near br_cb119
br_cb06f:
        inc     word ptr [bp - 2]
        mov     ax, word ptr [bp - 2]
        if      FW_VERSION >= 311
        cmp     di, ax
        else
        cmp     cx, ax
        endif
        ja      br_cb07e
        mov     word ptr [bp - 2], 0
br_cb07e:
        mov     bx, word ptr [bp - 2]
        add     bx, 20h
        shl     bx, 1
        mov     dx, word ptr [bx + TBL_E223]
        mov     ax, dx
        or      ax, ax
        jnz     br_cb09e
        mov     ax, word ptr [bp - 2]
        inc     ax
        mov     word ptr [W_E3AA], ax
        mov     ax, word ptr [bp - 2]
        pop     di
        pop     si
        leave
        retf
br_cb09e:
        if      FW_VERSION >= 311
        cmp     dx, word ptr [W_F28A]
        jnc     br_cb0b6
        mov     ax, word ptr [bp - 8]
        cmp     ax, word ptr [bp - 2]
        jz      br_cb0b6
        mov     word ptr [W_F28A], dx
        else
        mov     al, byte ptr [B_E2BF_V308]
        mov     ah, 0
        cmp     ax, dx
        jbe     br_cb0b6
        mov     byte ptr [B_E2BF_V308], dl
        endif
        mov     al, byte ptr [bp - 2]
        mov     byte ptr [B_F28C], al
br_cb0b6:
        mov     bx, word ptr [bp - 2]
        mov     al, byte ptr [bx + TBL_E3AC]
        mov     ah, 0
        cmp     ax, word ptr [bp + 8]
        jnz     br_cb0dc
        cmp     dx, word ptr [W_F28D]
        jnc     br_cb0dc
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 8]
        cmp     ax, word ptr [bp - 2]
        jz      br_cb0dc
        endif
        mov     word ptr [W_F28D], dx
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 2]
        mov     byte ptr [B_F28F], al
        else
        mov     ax, word ptr [bp - 2]
        mov     word ptr [W_E2C2_V308], ax
        endif
br_cb0dc:
        mov     bx, word ptr [bp - 2]
        shl     bx, 1
        if      FW_VERSION >= 311
        lea     ax, [bp - 48h]
        else
        lea     ax, [bp - 46h]
        endif
        add     bx, ax
        mov     word ptr ss:[bx], dx
        mov     bx, word ptr [bp - 2]
        mov     al, byte ptr [bx + TBL_E3AC]
        mov     ah, 0
        if      FW_VERSION >= 311
        mov     si, ax
        else
        mov     di, ax
        endif
        mov     bx, ax
        if      FW_VERSION >= 311
        lea     ax, [bp - 0c8h]
        else
        lea     ax, [bp - 0c6h]
        endif
        add     bx, ax
        mov     al, byte ptr ss:[bx]
        inc     al
        if      FW_VERSION >= 311
        mov     byte ptr [bp+si - 0c8h], al
        else
        mov     byte ptr [bp+di - 0c6h], al
        endif
        mov     ah, 0
        cmp     ax, word ptr [bp - 4]
        jle     br_cb118
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp+si - 0c8h]
        else
        mov     al, byte ptr [bp+di - 0c6h]
        endif
        mov     ah, 0
        mov     word ptr [bp - 4], ax
        if      FW_VERSION >= 311
        mov     word ptr [bp - 6], si
        else
        mov     word ptr [bp - 6], di
        endif
br_cb118:
        if      FW_VERSION >= 311
        inc     cx
        else
        inc     si
        endif
br_cb119:
        if      FW_VERSION >= 311
        cmp     di, cx
        else
        cmp     cx, si
        endif
        jle     br_cb120
        jmp     near br_cb06f
br_cb120:
        cmp     word ptr [W_F28D], 0ffffh
        jz      br_cb131
        if      FW_VERSION >= 311
        mov     al, byte ptr [B_F28F]
        mov     ah, 0
        else
        mov     ax, word ptr [W_E2C2_V308]
        endif
        mov     word ptr [bp - 2], ax
        jmp     br_cb181
br_cb131:
        cmp     word ptr [bp - 4], 3
        jl      br_cb179
        mov     word ptr [W_F28D], 0ffffh
        if      FW_VERSION >= 311
        xor     cx, cx
        lea     si, [bp - 48h]
        jmp     br_cb16b
loop_cb144:
        cmp     word ptr ss:[si], 0
        else
        xor     si, si
        lea     di, [bp - 46h]
        jmp     L_d461a
L_d45f5:
        cmp     word ptr ss:[di], 0
        endif
        jz      br_cb167
        if      FW_VERSION >= 311
        mov     bx, cx
        mov     al, byte ptr [bx + TBL_E3AC]
        else
        mov     al, byte ptr [si + TBL_E3AC]
        endif
        mov     ah, 0
        cmp     ax, word ptr [bp - 6]
        jnz     br_cb167
        if      FW_VERSION >= 311
        mov     ax, word ptr ss:[si]
        else
        mov     ax, word ptr ss:[di]
        endif
        cmp     ax, word ptr [W_F28D]
        jnc     br_cb167
        mov     word ptr [W_F28D], ax
        if      FW_VERSION >= 311
        mov     byte ptr [B_F28F], cl
        else
        mov     word ptr [W_E2C2_V308], si
        endif
br_cb167:
        if      FW_VERSION >= 311
        add     si, 2
        inc     cx
br_cb16b:
        cmp     di, cx
        jg      loop_cb144
        mov     al, byte ptr [B_F28F]
        mov     ah, 0
        else
        add     di, 2
        inc     si
L_d461a:
        cmp     cx, si
        jg      L_d45f5
        mov     ax, word ptr [W_E2C2_V308]
        endif
        mov     word ptr [bp - 2], ax
        jmp     br_cb181
br_cb179:
        mov     al, byte ptr [B_F28C]
        mov     ah, 0
        mov     word ptr [bp - 2], ax
br_cb181:
        mov     ax, word ptr [bp - 2]
        inc     ax
        mov     word ptr [W_E3AA], ax
        mov     ax, word ptr [bp - 2]
        pop     di
        pop     si
        leave
        retf
        if      FW_VERSION >= 312
        phase   0fh
        elseif  FW_VERSION = 311
        phase   0dh
        else
        phase   0ch
        endif
far_cb18f:
        push    si
        push    di
        push    ds
        pop     es
        if      FW_VERSION >= 312
        mov     di, 0e3cch
        elseif  FW_VERSION = 311
        mov     di, 0e314h
        else
        mov     di, 0dde1h
        endif
        mov     ax, 0ffffh
        mov     ah, al
        mov     cx, 20h
        rep stosw
        mov     di, TBL_E3AC
        mov     ah, al
        mov     cx, 10h
        rep stosw
        mov     di, TBL_E223
        xor     ax, ax
        mov     ah, al
        mov     cx, 60h
        rep stosw
        stosb
        mov     word ptr [W_E2E3], 0ffffh
        mov     word ptr [W_E221], 0
        mov     word ptr [W_E21F], 0
        mov     word ptr [W_E3AA], 0
        callf   SEG_CDCC:far_cdcc2
        callf   SEG_CC84:far_cc93a
        nop
        push    cs
        call    far_cb23d
        push    word 77eh
        callf   SEG_DAC2:far_dac28
        add     sp, 2
        cmp     ax, 18h
        jge     br_cb201
        callf   SEG_B1AA:far_b1aac
        push    ds
        push    word STR_6A98
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_cb1ff:
        jmp     br_cb1ff
br_cb201:
        nop
        push    cs
        call    far_cb2af
        push    0
        callf   SEG_C495:far_c6547
        add     sp, 2
        xor     si, si
loop_cb212:
        push    si
        callf   SEG_CDB9:far_cdc78
        add     sp, 2
        inc     si
        cmp     si, 20h
        jl      loop_cb212
        callf   SEG_CB56:far_cb6d8
        callf   SEG_B196:far_b1998
        callf   SEG_C0EE:far_c2c33
        push    dx
        push    ax
        callf   SEG_C0EE:far_c2b07
        add     sp, 4
        pop     di
        pop     si
        retf
far_cb23d:
        push    si
        push    di
        mov     ax, SEG_A28F
        mov     di, 4800h
        push    ax
        xor     ax, ax
        pop     es
        mov     ah, al
        mov     cx, 900h
        rep stosw
        push    ds
        pop     es
        mov     di, TBL_D65B
        mov     ah, al
        mov     cx, 5e1h
        rep stosw
        mov     byte ptr [TBL_D65B], 0ffh
        mov     byte ptr [TBL_D65C], 0ffh
        mov     word ptr [TBL_D65F], 1
        mov     word ptr [TBL_D65D], 7d0h
        callf   SEG_CC84:far_cca3a
        mov     word ptr [TBL_D663], dx
        mov     word ptr [TBL_D661], ax
        mov     si, 0ah
loop_cb281:
        mov     byte ptr [si + TBL_D65B], 0
        mov     byte ptr [si + TBL_D65C], 0ffh
        mov     word ptr [si + TBL_D65F], 0ffffh
        mov     word ptr [si + TBL_D65D], 0ffffh
        mov     word ptr [si + TBL_D663], 0ffffh
        mov     word ptr [si + TBL_D661], 0ffffh
        add     si, 0ah
        cmp     si, 0bb8h
        jnz     loop_cb281
        if      FW_VERSION < 311
        push    0
        push    0ffffh
        callf   0d266h:L_d2774
        add     sp, 4
        endif
        pop     di
        pop     si
        retf
far_cb2af:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        mov     byte ptr [B_E421], 0
        mov     byte ptr [B_E422], 2
        mov     byte ptr [B_E423], 2
        mov     byte ptr [B_E424], 2
        mov     byte ptr [B_E425], 0
        mov     byte ptr [B_E426], 0dh
        mov     byte ptr [B_E427], 23h
        mov     byte ptr [bp - 1], 0
loop_cb2dd:
        mov     al, byte ptr [bp - 1]
        mov     ah, 0
        shl     ax, 2
        mov     si, ax
        mov     bx, ax
        mov     byte ptr [bx + TBL_E44C], 64h
        mov     byte ptr [si + TBL_E44D], 32h
        if      FW_VERSION >= 311
        mov     byte ptr [si + TBL_E44E], 0
        else
        mov     byte ptr [si +TBL_DE63_V308], 64h
        endif
        mov     byte ptr [si + TBL_E44F], 9
        inc     byte ptr [bp - 1]
        cmp     byte ptr [bp - 1], 40h
        jc      loop_cb2dd
        mov     byte ptr [B_E428], 0
        mov     byte ptr [bp - 1], 0
loop_cb30f:
        mov     al, byte ptr [bp - 1]
        mov     ah, 0
        mov     si, ax
        mov     bx, ax
        mov     byte ptr [bx + TBL_E42A], 0
        mov     byte ptr [si + TBL_E42D], 32h
        mov     dx, 64h
        imul    dx
        add     ax, 64h
        mov     bx, si
        shl     bx, 1
        mov     word ptr [bx + TBL_E430], ax
        mov     byte ptr [si + TBL_E43C], 0
        inc     byte ptr [bp - 1]
        cmp     byte ptr [bp - 1], 3
        jc      loop_cb30f
        mov     byte ptr [TBL_E42A], 32h
        mov     byte ptr [bp - 1], 0
loop_cb349:
        mov     al, byte ptr [bp - 1]
        mov     ah, 0
        push    ax
        nop
        push    cs
        call    far_cb457
        add     sp, 2
        inc     byte ptr [bp - 1]
        cmp     byte ptr [bp - 1], 18h
        jc      loop_cb349
        pop     si
        leave
        retf
far_cb363:
        push    bp
        mov     bp, sp
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], 0ffh
        mov     byte ptr es:[bx + 1], 0
        mov     byte ptr es:[bx + 2], 2ch
        mov     byte ptr es:[bx + 3], 22h
        mov     byte ptr es:[bx + 4], 58h
        mov     byte ptr es:[bx + 5], 22h
        mov     byte ptr es:[bx + 6], 0
        mov     byte ptr es:[bx + 7], 22h
        mov     byte ptr es:[bx + 8], 22h
        mov     word ptr es:[bx + 9], 0
        mov     byte ptr es:[bx + 0bh], 0
        if      FW_VERSION >= 311
        mov     byte ptr es:[bx + 0ch], 6
        else
        mov     byte ptr es:[bx + 0ch], 0
        endif
        mov     byte ptr es:[bx + 0dh], 0
        mov     byte ptr es:[bx + 0eh], 64h
        mov     byte ptr es:[bx + 0fh], 0
        mov     byte ptr es:[bx + 10h], 0
        mov     byte ptr es:[bx + 11h], 0
        mov     byte ptr es:[bx + 12h], 0
        mov     byte ptr es:[bx + 13h], 64h
        mov     byte ptr es:[bx + 14h], 0
        mov     byte ptr es:[bx + 15h], 0
        mov     byte ptr es:[bx + 16h], 0
        mov     byte ptr es:[bx + 17h], 0
        pop     bp
        retf
far_cb3de:
        push    bp
        mov     bp, sp
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], 64h
        mov     byte ptr es:[bx + 1], 32h
        if      FW_VERSION >= 311
        mov     byte ptr es:[bx + 2], 0
        else
        mov     byte ptr es:[bx + 2], 64h
        endif
        mov     byte ptr es:[bx + 3], 9
        pop     bp
        retf
far_cb3f9:
        push    bp
        mov     bp, sp
        sub     sp, 2
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], 0
        mov     byte ptr [bp - 1], 0
loop_cb40a:
        mov     al, byte ptr [bp - 1]
        mov     ah, 0
        mov     cx, ax
        les     bx, dword ptr [bp + 6]
        add     bx, ax
        mov     byte ptr es:[bx + 2], 0
        mov     bx, word ptr [bp + 6]
        add     bx, cx
        mov     byte ptr es:[bx + 5], 32h
        mov     dx, 64h
        imul    dx
        add     ax, 64h
        mov     dx, cx
        shl     dx, 1
        mov     bx, word ptr [bp + 6]
        add     bx, dx
        mov     word ptr es:[bx + 8], ax
        mov     bx, word ptr [bp + 6]
        add     bx, cx
        mov     byte ptr es:[bx + 14h], 0
        inc     byte ptr [bp - 1]
        cmp     byte ptr [bp - 1], 3
        jc      loop_cb40a
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx + 2], 32h
        leave
        retf
far_cb457:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        push    di
        push    word ptr [bp + 6]
        callf   SEG_DAC2:far_dac45
        add     sp, 2
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        or      ax, dx
        jnz     br_cb477
        jmp     br_cb561
br_cb477:
        les     di, dword ptr [bp - 4]
        mov     si, STR_6AB5
        mov     cx, 5
        rep movsw
        movsb
        push    30h
        push    2
        mov     ax, word ptr [bp - 4]
        add     ax, 8
        push    word ptr [bp - 2]
        push    ax
        mov     ax, word ptr [bp + 6]
        inc     ax
        push    ax
        callf   SEG_D780:far_d7805
        add     sp, 0ah
        les     bx, dword ptr [bp - 4]
        mov     byte ptr es:[bx + 11h], 22h
        mov     byte ptr es:[bx + 12h], 88h
        mov     byte ptr es:[bx + 13h], 78h
        mov     byte ptr es:[bx + 14h], 0ch
        mov     byte ptr es:[bx + 15h], 2dh
        mov     byte ptr es:[bx + 16h], 0
        mov     byte ptr es:[bx + 17h], 14h
        mov     byte ptr es:[bx + 18h], 0ceh
        mov     byte ptr es:[bx + 19h], 32h
        mov     byte ptr es:[bx + 1ah], 0
        xor     si, si
        mov     di, word ptr [bp - 4]
        mov     dx, 64h
        mov     cx, word ptr [bp - 4]
        add     cx, 22h
loop_cb4e1:
        mov     es, word ptr [bp - 2]
        mov     byte ptr es:[di + 1ch], 0
        mov     byte ptr es:[di + 1fh], 32h
        mov     bx, cx
        mov     word ptr es:[bx], dx
        mov     byte ptr es:[di + 2eh], 0
        inc     di
        add     dx, 64h
        add     cx, 2
        inc     si
        cmp     dx, 190h
        jnz     loop_cb4e1
        les     bx, dword ptr [bp - 4]
        mov     byte ptr es:[bx + 1ch], 32h
        xor     si, si
        mov     di, word ptr [bp - 4]
        add     di, 73eh
loop_cb517:
        mov     al, byte ptr [si + TBL_818A]
        mov     es, word ptr [bp - 2]
        mov     byte ptr es:[di], al
        inc     di
        inc     si
        cmp     si, 40h
        jl      loop_cb517
        xor     si, si
        mov     di, word ptr [bp - 4]
        add     di, 3eh
loop_cb530:
        push    word ptr [bp - 2]
        push    di
        push    cs
        call    far_cb363
        add     sp, 4
        add     di, 18h
        inc     si
        cmp     si, 40h
        jl      loop_cb530
        xor     si, si
        mov     di, word ptr [bp - 4]
        add     di, 63eh
loop_cb54d:
        push    word ptr [bp - 2]
        push    di
        push    cs
        call    far_cb3de
        add     sp, 4
        add     di, 4
        inc     si
        cmp     si, 40h
        jl      loop_cb54d
br_cb561:
        pop     di
        pop     si
        leave
        retf
        if      FW_VERSION >= 312
        db      0ffh
        phase   6
        elseif  FW_VERSION = 311
        db      0ffh
        phase   4
        else
        phase   0eh
        endif
far_cb566:
        push    bp
        mov     bp, sp
        sub     sp, 0eh
        mov     ax, word ptr [bp + 12h]
        or      ax, ax
        jnz     br_cb57f
        mov     word ptr [bp - 0ch], 4fh
        mov     byte ptr [bp - 0eh], 49h
        jmp     br_cb588
        db      090h
br_cb57f:
        mov     word ptr [bp - 0ch], 6fh
        mov     byte ptr [bp - 0eh], 45h
br_cb588:
        pusha
        mov     ax, word ptr [bp + 8]
        xor     dx, dx
        mov     cx, 4
loop_cb591:
        shl     ax, 1
        rcl     dx, 1
        loop    loop_cb591
        add     ax, word ptr [bp + 6]
        adc     dx, 0
        mov     word ptr [bp - 4], ax
        mov     word ptr [bp - 2], dx
br_cb5a3:
        mov     cl, 8
        push    cs
        call    far_cb6a2
        nop
        mov     dx, 0c00bh
        in      al, dx
        mov     bx, 0
        mov     ax, bx
        out     60h, ax
        mov     ax, word ptr [bp + 0ah]
        mov     dx, word ptr [bp + 0ch]
        and     dx, 1ffh
        ror     ax, 4
        push    ax
        and     ax, 0f000h
        mov     word ptr [bp - 0ah], ax
        pop     ax
        and     ax, 0fffh
        ror     dx, 4
        or      ah, dh
        mov     word ptr [bp - 8], ax
        xchg    dx, ax
        cbw
        mov     word ptr [bp - 6], ax
        mov     ax, word ptr [bp - 6]
        or      ax, 100h
        out     66h, ax
        mov     ax, word ptr [bp - 8]
        out     64h, ax
        mov     ax, word ptr [bp - 0ah]
        out     62h, ax
        mov     ax, 100h
        out     60h, ax
        mov     ax, 0fh
        out     66h, ax
        mov     ax, 0ffffh
        out     64h, ax
        mov     ax, 1000h
        out     62h, ax
        mov     cx, 0fh
        add     bl, 2
        mov     ax, bx
        out     60h, ax
        mov     ax, 100h
        out     66h, ax
        mov     dx, 0c001h
        mov     al, 3
        out     dx, al
        mov     dx, 0c004h
        mov     ax, word ptr [bp - 4]
        out     dx, ax
        mov     dx, 0c006h
        mov     al, byte ptr [bp - 2]
        or      al, 30h
        out     dx, al
        mov     ax, 0
        cmp     word ptr [bp + 10h], ax
        jnz     br_cb630
        mov     ax, word ptr [bp + 0eh]
br_cb630:
        dec     ax
        mov     dx, 0c002h
        out     dx, ax
        push    ax
        mov     dx, 0c00ah
        mov     al, byte ptr [bp - 0eh]
        out     dx, al
        mov     cl, 0f7h
        push    cs
        call    far_cb6bd
        nop
        mov     ax, word ptr [bp - 0ch]
        out     68h, ax
        pop     ax
        mov     dx, 0
        add     ax, 1
        adc     dx, dx
        add     word ptr [bp + 0ah], ax
        adc     word ptr [bp + 0ch], dx
        add     word ptr [bp - 4], ax
        adc     word ptr [bp - 2], dx
        add     word ptr [bp - 4], ax
        adc     word ptr [bp - 2], dx
        sub     word ptr [bp + 0eh], ax
        sbb     word ptr [bp + 10h], dx
loop_cb66a:
        mov     dx, 0c00bh
        in      al, dx
        test    al, 8
        jz      loop_cb66a
        cmp     word ptr [bp + 12h], 0
        jnz     br_cb68c
        mov     bx, word ptr [bp + 0ah]
        shl     bx, 0ch
loop_cb67e:
        mov     ax, 0
        out     60h, ax
        in      ax, 62h
        and     ax, 0f000h
        cmp     ax, bx
        jnz     loop_cb67e
br_cb68c:
        mov     ax, word ptr [bp + 0eh]
        or      ax, word ptr [bp + 10h]
        jz      br_cb697
        jmp     br_cb5a3
br_cb697:
        mov     ax, 80h
        out     68h, ax
        popa
        add     sp, 0eh
        pop     bp
        retf
far_cb6a2:
        mov     dx, 0c008h
        mov     bx, 0c00fh
        mov     ax, 14h
        mov     ch, 10h
        pushf
        cli
        out     dx, ax
        xchg    bx, dx
        in      al, dx
        or      al, cl
        out     dx, al
        xchg    dx, bx
        mov     al, ch
        out     dx, ax
        popf
        retf
far_cb6bd:
        mov     dx, 0c008h
        mov     bx, 0c00fh
        mov     ax, 14h
        mov     ch, 10h
        pushf
        cli
        out     dx, ax
        xchg    bx, dx
        in      al, dx
        and     al, cl
        out     dx, al
        xchg    dx, bx
        mov     al, ch
        out     dx, ax
        popf
        retf
far_cb6d8:
        mov     bx, 0a00h
        mov     cx, 20h
loop_cb6de:
        mov     ax, bx
        out     60h, ax
        mov     ax, 3
        out     62h, ax
        mov     ax, 0
        out     64h, ax
        inc     bl
        loop    loop_cb6de
        mov     ax, 80h
        out     68h, ax
        retf
fn_cb6f6:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    es
        mov     si, word ptr [bp + 6]
        mov     word ptr [bp - 2], 7530h
        mov     cx, word ptr [bp + 0ch]
        les     di, dword ptr [bp + 8]
        mov     bx, 0
loop_cb70e:
        mov     ax, word ptr [bp - 2]
        imul    si
        add     bx, dx
        mov     ax, bx
        stosw
        imul    si
        sub     word ptr [bp - 2], dx
        loop    loop_cb70e
        pop     es
        add     sp, 2
        pop     bp
        retf
far_cb725:
        push    bp
        mov     bp, sp
        and     byte ptr [bp + 6], 7
        in      al, 0fah
        and     al, 0f8h
        or      al, byte ptr [bp + 6]
        out     0fah, al
        pop     bp
        retf
far_cb737:
        push    bp
        mov     bp, sp
        and     byte ptr [bp + 6], 0fh
        mov     al, byte ptr [bp + 6]
        out     0f8h, al
        mov     al, 0
        out     0fch, al
        or      al, 1
        out     0fch, al
        pop     bp
        retf
far_cb74d:
        in      al, 0fah
        mov     bl, al
        push    0
        push    cs
        call    far_cb737
        pop     ax
        mov     al, 90h
        out     0feh, al
        mov     al, 0eh
        out     0fch, al
        in      al, 0f8h
        and     ax, 0fh
        mov     cx, ax
        mov     al, 80h
        out     0feh, al
        mov     al, bl
        out     0fah, al
        mov     ax, cx
        retf
        if      FW_VERSION >= 312
        phase   2
        elseif  FW_VERSION = 311
        phase   0
        else
        phase   0ah
        endif
far_cb772:
        push    bp
        mov     bp, sp
        sub     sp, 6
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        and     ax, 0f8h
        cmp     ax, 0b0h
        jnz     br_cb78b
        jmp     near br_cb817
br_cb78b:
        jg      br_cb799
        cmp     ax, 80h
        jz      br_cb7ab
        cmp     ax, 90h
        jz      br_cb807
        leave
        retf
br_cb799:
        cmp     ax, 0c0h
        jnz     br_cb7a1
        jmp     near br_cb82f
br_cb7a1:
        cmp     ax, 0f0h
        jnz     br_cb7a9
        jmp     near br_cb843
br_cb7a9:
        leave
        retf
br_cb7ab:
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx + 2], 23h
        jnc     br_cb7b8
        jmp     near br_cb878
br_cb7b8:
        cmp     byte ptr es:[bx + 2], 62h
        jbe     br_cb7c2
        jmp     near br_cb878
br_cb7c2:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        mov     word ptr [bp - 6], ax
        mov     dx, 18h
        imul    dx
        mov     dx, word ptr [W_E40E]
        mov     bx, word ptr [FP_E40C]
        add     bx, ax
        add     bx, 0fcf6h
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], bx
        mov     es, word ptr [bp - 2]
        cmp     byte ptr es:[bx], 0ffh
        jnz     br_cb7f3
        jmp     near br_cb878
br_cb7f3:
        cmp     byte ptr es:[bx + 6], 2
        jnz     br_cb878
        push    word ptr [bp - 6]
        nop
        push    cs
        call    fn_cb87a
        add     sp, 2
        leave
        retf
br_cb807:
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_CB8A:far_cb8a1
        add     sp, 4
        leave
        retf
br_cb817:
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx + 2], 7
        jnz     br_cb878
        mov     al, byte ptr es:[bx + 3]
        mov     byte ptr [B_E54C], al
        mov     byte ptr [B_D4BE], 50h
        leave
        retf
br_cb82f:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        push    ax
        callf   SEG_C495:far_c6547
        add     sp, 2
        leave
        retf
br_cb843:
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx + 2], 47h
        jnz     br_cb878
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx + 5], 45h
        jz      br_cb85e
        cmp     byte ptr es:[bx + 5], 46h
        jnz     br_cb878
br_cb85e:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 8]
        push    ax
        mov     al, byte ptr es:[bx + 6]
        push    ax
        mov     al, byte ptr es:[bx + 7]
        push    ax
        callf   SEG_CC71:far_cc71c
        add     sp, 6
br_cb878:
        leave
        retf
fn_cb87a:
        push    bp
        mov     bp, sp
        push    si
        push    di
        mov     di, word ptr [bp + 6]
        xor     si, si
loop_cb884:
        mov     al, byte ptr [si + TBL_E3AC]
        mov     ah, 0
        cmp     ax, di
        jnz     br_cb897
        push    si
        callf   SEG_CDE1:far_cde12
        add     sp, 2
br_cb897:
        inc     si
        cmp     si, 20h
        jl      loop_cb884
        pop     di
        pop     si
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   1
        elseif  FW_VERSION = 311
        phase   0fh
        else
        phase   9
        endif
far_cb8a1:
        push    bp
        mov     bp, sp
        sub     sp, 16h
        push    si
        push    di
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        mov     word ptr [bp - 12h], ax
        mov     word ptr [bp - 14h], dx
        les     bx, dword ptr [bp - 14h]
        cmp     byte ptr es:[bx + 2], 23h
        jnc     br_cb8c2
        jmp     br_cbb6c
br_cb8c2:
        cmp     byte ptr es:[bx + 2], 62h
        jbe     br_cb8cc
        jmp     br_cbb6c
br_cb8cc:
        les     bx, dword ptr [bp - 14h]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        mov     cx, ax
        mov     si, ax
        mov     dx, 18h
        imul    dx
        mov     dx, word ptr [W_E40E]
        mov     bx, word ptr [FP_E40C]
        add     bx, ax
        add     bx, 0fcf6h
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], bx
        mov     es, word ptr [bp - 2]
        mov     al, byte ptr es:[bx + 0dh]
        mov     ah, 0
        mov     di, ax
        push    cx
        nop
        push    cs
        call    far_cbb70
        add     sp, 2
        mov     word ptr [bp - 0ah], dx
        mov     word ptr [bp - 0ch], ax
        les     bx, dword ptr [bp - 14h]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        push    ax
        nop
        push    cs
        call    far_cbbd4
        add     sp, 2
        mov     word ptr [bp - 0eh], dx
        mov     word ptr [bp - 10h], ax
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx + 1]
        mov     ah, 0
        cmp     ax, 2
        jz      br_cb93d
        cmp     ax, 3
        jnz     br_cb93a
        jmp     near br_cb9cc
br_cb93a:
        jmp     br_cba6e
br_cb93d:
        les     bx, dword ptr [bp - 14h]
        mov     al, byte ptr es:[bx + 3]
        mov     byte ptr [bp - 15h], al
        les     bx, dword ptr [bp - 4]
        cmp     al, byte ptr es:[bx + 4]
        jbe     br_cb982
        cmp     byte ptr es:[bx + 5], 23h
        jnc     br_cb95a
        jmp     br_cbb6c
br_cb95a:
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx + 5]
        mov     ah, 0
        mov     bx, ax
        mov     si, ax
        mov     dx, 18h
        imul    dx
        mov     dx, word ptr [W_E40E]
        mov     bx, word ptr [FP_E40C]
        add     bx, ax
        add     bx, 0fcf6h
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], bx
        jmp     br_cb9be
br_cb982:
        mov     al, byte ptr [bp - 15h]
        les     bx, dword ptr [bp - 4]
        cmp     al, byte ptr es:[bx + 2]
        jbe     br_cb9be
        cmp     byte ptr es:[bx + 3], 23h
        jnc     br_cb998
        jmp     br_cbb6c
br_cb998:
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx + 3]
        mov     ah, 0
        mov     bx, ax
        mov     si, ax
        mov     dx, 18h
        imul    dx
        mov     dx, word ptr [W_E40E]
        mov     bx, word ptr [FP_E40C]
        add     bx, ax
        add     bx, 0fcf6h
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], bx
br_cb9be:
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx + 0dh]
        mov     ah, 0
        mov     di, ax
        jmp     near br_cba6e
br_cb9cc:
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx + 0ch]
        mov     ah, 0
        mov     dx, ax
        les     bx, dword ptr [bp - 14h]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        and     ax, 3
        cmp     ax, 1
        jnz     br_cb9ef
        mov     al, byte ptr es:[bx + 4]
        mov     ah, 0
        mov     dx, ax
br_cb9ef:
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx + 4]
        mov     ah, 0
        cmp     ax, dx
        jge     br_cba2e
        cmp     byte ptr es:[bx + 5], 23h
        jnc     br_cba06
        jmp     br_cbb6c
br_cba06:
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx + 5]
        mov     ah, 0
        mov     bx, ax
        mov     si, ax
        mov     dx, 18h
        imul    dx
        mov     dx, word ptr [W_E40E]
        mov     bx, word ptr [FP_E40C]
        add     bx, ax
        add     bx, 0fcf6h
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], bx
        jmp     br_cba6b
br_cba2e:
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        cmp     ax, dx
        jge     br_cba6b
        cmp     byte ptr es:[bx + 3], 23h
        jnc     br_cba45
        jmp     br_cbb6c
br_cba45:
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx + 3]
        mov     ah, 0
        mov     bx, ax
        mov     si, ax
        mov     dx, 18h
        imul    dx
        mov     dx, word ptr [W_E40E]
        mov     bx, word ptr [FP_E40C]
        add     bx, ax
        add     bx, 0fcf6h
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], bx
br_cba6b:
        mov     di, 1
br_cba6e:
        push    di
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 10h]
        push    word ptr [bp - 0ah]
        push    word ptr [bp - 0ch]
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    si
        nop
        push    cs
        call    fn_cbc38
        add     sp, 14h
        les     bx, dword ptr [bp - 4]
        cmp     byte ptr es:[bx + 1], 1
        jz      br_cba9d
        jmp     br_cbb6c
br_cba9d:
        cmp     byte ptr es:[bx + 3], 23h
        jc      br_cbb03
        mov     al, byte ptr es:[bx + 3]
        mov     ah, 0
        mov     si, ax
        push    ax
        nop
        push    cs
        call    far_cbb70
        add     sp, 2
        mov     word ptr [bp - 0ah], dx
        mov     word ptr [bp - 0ch], ax
        push    si
        nop
        push    cs
        call    far_cbbd4
        add     sp, 2
        mov     word ptr [bp - 0eh], dx
        mov     word ptr [bp - 10h], ax
        mov     ax, si
        mov     dx, 18h
        imul    dx
        mov     dx, word ptr [W_E40E]
        mov     bx, word ptr [FP_E40C]
        add     bx, ax
        add     bx, 0fcf6h
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], bx
        push    di
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 10h]
        push    word ptr [bp - 0ah]
        push    word ptr [bp - 0ch]
        push    dx
        push    bx
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    si
        nop
        push    cs
        call    fn_cbc38
        add     sp, 14h
br_cbb03:
        les     bx, dword ptr [bp - 4]
        cmp     byte ptr es:[bx + 5], 23h
        jc      br_cbb6c
        mov     al, byte ptr es:[bx + 5]
        mov     ah, 0
        mov     si, ax
        push    ax
        nop
        push    cs
        call    far_cbb70
        add     sp, 2
        mov     word ptr [bp - 0ah], dx
        mov     word ptr [bp - 0ch], ax
        push    si
        nop
        push    cs
        call    far_cbbd4
        add     sp, 2
        mov     word ptr [bp - 0eh], dx
        mov     word ptr [bp - 10h], ax
        mov     ax, si
        mov     dx, 18h
        imul    dx
        mov     dx, word ptr [W_E40E]
        mov     bx, word ptr [FP_E40C]
        add     bx, ax
        add     bx, 0fcf6h
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], bx
        push    di
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 10h]
        push    word ptr [bp - 0ah]
        push    word ptr [bp - 0ch]
        push    dx
        push    bx
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    si
        nop
        push    cs
        call    fn_cbc38
        add     sp, 14h
br_cbb6c:
        pop     di
        pop     si
        leave
        retf
far_cbb70:
        push    bp
        mov     bp, sp
        mov     dx, word ptr [bp + 6]
        add     dx, 0ffddh
        or      dx, dx
        jge     br_cbb7f
        xor     dx, dx
br_cbb7f:
        cmp     dx, 40h
        jl      br_cbb87
        mov     dx, 3fh
br_cbb87:
        cmp     byte ptr [B_E422], 2
        jnz     br_cbba3
        mov     ax, dx
        shl     ax, 2
        mov     dx, word ptr [W_E40E]
        push    ax
        mov     ax, word ptr [FP_E40C]
        pop     bx
        add     ax, bx
        add     ax, 63eh
        pop     bp
        retf
br_cbba3:
        cmp     byte ptr [B_E422], 1
        jnz     br_cbbc8
        mov     ax, word ptr [W_901D]
        or      ax, word ptr [W_901F]
        jz      br_cbbc8
        mov     ax, dx
        shl     ax, 2
        mov     dx, word ptr [W_901F]
        push    ax
        mov     ax, word ptr [W_901D]
        pop     bx
        add     ax, bx
        add     ax, 2ah
        pop     bp
        retf
br_cbbc8:
        mov     ax, dx
        shl     ax, 2
        mov     dx, ds
        add     ax, TBL_E44C
        pop     bp
        retf
far_cbbd4:
        push    bp
        mov     bp, sp
        mov     dx, word ptr [bp + 6]
        add     dx, 0ffddh
        or      dx, dx
        jge     br_cbbe3
        xor     dx, dx
br_cbbe3:
        cmp     dx, 40h
        jl      br_cbbeb
        mov     dx, 3fh
br_cbbeb:
        cmp     byte ptr [B_E423], 2
        jnz     br_cbc07
        mov     ax, dx
        shl     ax, 2
        mov     dx, word ptr [W_E40E]
        push    ax
        mov     ax, word ptr [FP_E40C]
        pop     bx
        add     ax, bx
        add     ax, 63eh
        pop     bp
        retf
br_cbc07:
        cmp     byte ptr [B_E423], 1
        jnz     br_cbc2c
        mov     ax, word ptr [W_901D]
        or      ax, word ptr [W_901F]
        jz      br_cbc2c
        mov     ax, dx
        shl     ax, 2
        mov     dx, word ptr [W_901F]
        push    ax
        mov     ax, word ptr [W_901D]
        pop     bx
        add     ax, bx
        add     ax, 2ah
        pop     bp
        retf
br_cbc2c:
        mov     ax, dx
        shl     ax, 2
        mov     dx, ds
        add     ax, TBL_E44C
        pop     bp
        retf
fn_cbc38:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 5ch
        else
        sub     sp, 5ah
        endif
        push    si
        push    di
        les     bx, dword ptr [bp + 0ch]
        mov     al, byte ptr es:[bx]
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 5ch], al
        cmp     byte ptr [bp - 5ch], 0ffh
        else
        mov     byte ptr [bp - 5ah], al
        cmp     byte ptr [bp - 5ah], 0ffh
        endif
        jnz     br_cbc53
        pop     di
        pop     si
        leave
        retf
br_cbc53:
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 5ch]
        else
        mov     al, byte ptr [bp - 5ah]
        endif
        mov     ah, 0
        mov     dx, 24h
        imul    dx
        add     ax, 4800h
        mov     word ptr [bp - 2], SEG_A28F
        mov     word ptr [bp - 4], ax
        les     bx, dword ptr [bp - 4]
        cmp     byte ptr es:[bx], 0
        jnz     br_cbc75
        pop     di
        pop     si
        leave
        retf
br_cbc75:
        mov     al, 0ffh
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 5ah], al
        mov     byte ptr [bp - 5bh], al
        else
        mov     byte ptr [bp - 58h], al
        mov     byte ptr [bp - 59h], al
        endif
        les     bx, dword ptr [bp + 0ch]
        cmp     byte ptr es:[bx + 7], 23h
        jc      br_cbca0
        mov     al, byte ptr es:[bx + 7]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 30ah]
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 5bh], al
        else
        mov     byte ptr [bp - 59h], al
        endif
br_cbca0:
        les     bx, dword ptr [bp + 0ch]
        cmp     byte ptr es:[bx + 8], 23h
        jc      br_cbcc3
        mov     al, byte ptr es:[bx + 8]
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 30ah]
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 5ah], al
        else
        mov     byte ptr [bp - 58h], al
        endif
br_cbcc3:
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx + 12h]
        cbw
        les     bx, dword ptr [bp + 0ch]
        add     ax, word ptr es:[bx + 9]
        mov     word ptr [bp - 6], ax
        mov     al, byte ptr es:[bx + 0bh]
        mov     ah, 0
        mov     word ptr [bp - 8], ax
        mov     al, byte ptr es:[bx + 0ch]
        mov     ah, 0
        mov     word ptr [bp - 0ah], ax
        mov     al, byte ptr es:[bx + 0eh]
        mov     ah, 0
        mov     di, ax
        les     bx, dword ptr [bp + 8]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        and     ax, 3
        mov     bx, ax
        cmp     bx, 3
        ja      br_cbd4a
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_cc3bf]
tgt_cbd08:
        les     bx, dword ptr [bp + 8]
        mov     al, byte ptr es:[bx + 4]
        mov     ah, 0
        shl     ax, 1
        add     ax, 0ff80h
        add     word ptr [bp - 6], ax
        jmp     br_cbd4a
tgt_cbd1b:
        les     bx, dword ptr [bp + 8]
        mov     al, byte ptr es:[bx + 4]
        mov     ah, 0
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp + 18h], 1
        jmp     br_cbd4a
tgt_cbd2e:
        les     bx, dword ptr [bp + 8]
        mov     al, byte ptr es:[bx + 4]
        mov     ah, 0
        mov     word ptr [bp - 8], ax
        jmp     br_cbd4a
tgt_cbd3c:
        les     bx, dword ptr [bp + 8]
        mov     al, byte ptr es:[bx + 4]
        mov     ah, 0
        add     ax, 0ffceh
        add     di, ax
br_cbd4a:
        les     bx, dword ptr [bp + 8]
        mov     al, byte ptr es:[bx + 3]
        mov     ah, 0
        les     bx, dword ptr [bp + 0ch]
        mov     dl, byte ptr es:[bx + 16h]
        mov     dh, 0
        imul    dx
        mov     bx, 7fh
        cwd
        idiv    bx
        add     di, ax
        or      di, di
        jge     br_cbd6c
        xor     di, di
br_cbd6c:
        cmp     di, 64h
        jle     br_cbd74
        mov     di, 64h
br_cbd74:
        mov     bx, di
        shl     bx, 1
        mov     ax, word ptr [bx + TBL_7016]
        if      FW_VERSION >= 311
        mov     word ptr [bp - 3fh], ax
        mov     word ptr [bp - 41h], 0
        else
        mov     word ptr [bp - 3dh], ax
        mov     word ptr [bp - 3fh], 0
        endif
        les     bx, dword ptr [bp + 0ch]
        mov     al, byte ptr es:[bx + 12h]
        mov     ah, 0
        mov     cx, di
        add     cx, ax
        cmp     cx, 64h
        jle     br_cbd99
        mov     cx, 64h
br_cbd99:
        les     bx, dword ptr [bp + 0ch]
        mov     al, byte ptr es:[bx + 0fh]
        mov     ah, 0
        mov     bx, cx
        shl     bx, 1
        mov     dx, word ptr [bx + TBL_7016]
        shl     dx, 1
        and     dx, 7ff0h
        add     dx, ax
        if      FW_VERSION >= 311
        mov     word ptr [bp - 3dh], dx
        else
        mov     word ptr [bp - 3bh], dx
        endif
        mov     ax, cx
        sub     ax, di
        mov     word ptr [bp - 0ch], ax
        or      ax, ax
        jnz     br_cbdc8
        if      FW_VERSION >= 311
        mov     word ptr [bp - 3bh], 0
        else
        mov     word ptr [bp - 39h], 0
        endif
        jmp     br_cbeb5
br_cbdc8:
        push    0
        push    2
        mov     ax, word ptr [bp - 0ch]
        cwd
        push    ax
        push    dx
        xor     dx, dx
        mov     ax, 447h
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        mov     word ptr [bp - 26h], dx
        mov     word ptr [bp - 28h], ax
        les     bx, dword ptr [bp + 0ch]
        mov     al, byte ptr es:[bx + 10h]
        mov     ah, 0
        shl     ax, 1
        mov     bx, ax
        mov     si, word ptr [bx + TBL_6E82]
        or      si, si
        jnz     br_cbe03
        mov     si, 1
br_cbe03:
        push    0
        push    si
        push    word ptr [bp - 26h]
        push    word ptr [bp - 28h]
        callf   0f800h:far_fa0fe
        mov     word ptr [bp - 2ah], dx
        mov     word ptr [bp - 2ch], ax
        cmp     word ptr [bp - 2ah], 0
        jl      br_cbe30
        jg      br_cbe26
        cmp     word ptr [bp - 2ch], 7fffh
        jbe     br_cbe30
br_cbe26:
        mov     word ptr [bp - 2ah], 0
        mov     word ptr [bp - 2ch], 7fffh
br_cbe30:
        mov     ax, word ptr [bp - 2ch]
        if      FW_VERSION >= 311
        mov     word ptr [bp - 3bh], ax
        else
        mov     word ptr [bp - 39h], ax
        endif
        mov     ax, si
        mov     bx, 0ah
        xor     dx, dx
        div     bx
        add     ax, 2
        if      FW_VERSION >= 311
        mov     word ptr [bp - 54h], ax
        else
        mov     word ptr [bp - 52h], ax
        endif
        les     bx, dword ptr [bp + 0ch]
        mov     al, byte ptr es:[bx + 0fh]
        mov     ah, 0
        mov     bx, di
        shl     bx, 1
        mov     dx, word ptr [bx + TBL_7016]
        shl     dx, 1
        and     dx, 7ff0h
        add     dx, ax
        if      FW_VERSION >= 311
        mov     word ptr [bp - 4eh], dx
        else
        mov     word ptr [bp - 4ch], dx
        endif
        mov     bx, word ptr [bp + 0ch]
        mov     al, byte ptr es:[bx + 11h]
        mov     ah, 0
        shl     ax, 1
        mov     bx, ax
        mov     di, word ptr [bx + TBL_6E82]
        or      di, di
        jnz     br_cbe79
        mov     di, 1
br_cbe79:
        push    0
        push    di
        mov     ax, word ptr [bp - 26h]
        mov     dx, word ptr [bp - 28h]
        neg     ax
        neg     dx
        sbb     ax, 0
        push    ax
        push    dx
        callf   0f800h:far_fa0fe
        mov     word ptr [bp - 2ah], dx
        mov     word ptr [bp - 2ch], ax
        cmp     word ptr [bp - 2ah], 0ffffh
        jg      br_cbeaf
        jl      br_cbea5
        cmp     word ptr [bp - 2ch], 8001h
        jnc     br_cbeaf
br_cbea5:
        mov     word ptr [bp - 2ah], 0ffffh
        mov     word ptr [bp - 2ch], 8001h
br_cbeaf:
        mov     ax, word ptr [bp - 2ch]
        if      FW_VERSION >= 311
        mov     word ptr [bp - 50h], ax
        else
        mov     word ptr [bp - 4eh], ax
        endif
br_cbeb5:
        les     bx, dword ptr [bp + 8]
        mov     al, byte ptr es:[bx + 3]
        mov     ah, 0
        push    ax
        mov     ax, 80h
        pop     dx
        sub     ax, dx
        les     bx, dword ptr [bp + 0ch]
        mov     dl, byte ptr es:[bx + 15h]
        mov     dh, 0
        imul    dx
        mov     bx, 7fh
        cwd
        idiv    bx
        shl     ax, 1
        mov     bx, ax
        mov     ax, word ptr [bx + TBL_6E82]
        cwd
        mov     word ptr [bp - 12h], dx
        mov     word ptr [bp - 14h], ax
        push    0
        push    0ah
        mov     cx, word ptr [bp - 12h]
        mov     bx, word ptr [bp - 14h]
        xor     dx, dx
        mov     ax, 1b9h
        callf   0f800h:far_fa0c8
        push    dx
        push    ax
        callf   0f800h:far_fa105
        mov     word ptr [bp - 16h], dx
        mov     word ptr [bp - 18h], ax
        push    0
        push    word 1b9h
        les     bx, dword ptr [bp - 4]
        mov     cx, word ptr es:[bx + 1ah]
        mov     ax, word ptr es:[bx + 18h]
        sub     ax, word ptr es:[bx + 14h]
        sbb     cx, word ptr es:[bx + 16h]
        sub     ax, word ptr [bp - 18h]
        sbb     cx, word ptr [bp - 16h]
        xor     dx, dx
        push    ax
        mov     ax, 0ah
        pop     bx
        callf   0f800h:far_fa0c8
        push    dx
        push    ax
        callf   0f800h:far_fa105
        sub     ax, 1eh
        sbb     dx, 0
        mov     word ptr [bp - 0eh], dx
        mov     word ptr [bp - 10h], ax
        cmp     word ptr [bp - 0eh], 0
        jge     br_cbf4c
        jmp     br_cc3bb
br_cbf4c:
        jg      br_cbf57
        cmp     word ptr [bp - 10h], 0
        ja      br_cbf57
        jmp     br_cc3bb
br_cbf57:
        les     bx, dword ptr [bp - 4]
        mov     ax, word ptr es:[bx + 16h]
        mov     dx, word ptr es:[bx + 14h]
        add     dx, word ptr [bp - 18h]
        adc     ax, word ptr [bp - 16h]
        cmp     ax, word ptr es:[bx + 1ah]
        jc      br_cbf7d
        jbe     br_cbf73
        jmp     br_cc3bb
br_cbf73:
        cmp     dx, word ptr es:[bx + 18h]
        jbe     br_cbf7d
        pop     di
        pop     si
        leave
        retf
br_cbf7d:
        les     bx, dword ptr [bp - 4]
        mov     ax, word ptr es:[bx + 22h]
        mov     dx, word ptr es:[bx + 20h]
        add     dx, word ptr es:[bx + 14h]
        adc     ax, word ptr es:[bx + 16h]
        add     dx, word ptr [bp - 18h]
        adc     ax, word ptr [bp - 16h]
        if      FW_VERSION >= 311
        mov     word ptr [bp - 49h], ax
        mov     word ptr [bp - 4bh], dx
        else
        mov     word ptr [bp - 47h], ax
        mov     word ptr [bp - 49h], dx
        endif
        cmp     word ptr [bp - 6], 0f0h
        jle     br_cbfa8
        mov     word ptr [bp - 6], 0f0h
br_cbfa8:
        cmp     word ptr [bp - 6], 0ff10h
        jge     br_cbfb4
        mov     word ptr [bp - 6], 0ff10h
br_cbfb4:
        mov     bx, word ptr [bp - 6]
        shl     bx, 1
        mov     ax, word ptr [bx + TBL_6CA0]
        if      FW_VERSION >= 311
        mov     word ptr [bp - 47h], ax
        else
        mov     word ptr [bp - 45h], ax
        endif
        les     bx, dword ptr [bp + 8]
        mov     al, byte ptr es:[bx + 3]
        mov     ah, 0
        push    ax
        mov     ax, 7fh
        pop     dx
        sub     ax, dx
        les     bx, dword ptr [bp + 0ch]
        mov     dl, byte ptr es:[bx + 13h]
        mov     dh, 0
        imul    dx
        push    ax
        mov     ax, 319ch
        pop     dx
        sub     ax, dx
        mov     bx, 64h
        cwd
        idiv    bx
        mov     cx, ax
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx + 11h]
        mov     ah, 0
        push    ax
        mov     ax, cx
        pop     dx
        imul    dx
        mov     cx, ax
        or      cx, cx
        jnz     br_cc003
        pop     di
        pop     si
        leave
        retf
br_cc003:
        push    0
        push    word 0c671h
        push    cx
        push    0
        callf   0f800h:far_fa0fe
        if      FW_VERSION >= 311
        mov     word ptr [bp - 45h], ax
        else
        mov     word ptr [bp - 43h], ax
        endif
        mov     bx, word ptr [bp - 8]
        shl     bx, 1
        mov     si, word ptr [bx + TBL_6E82]
        les     bx, dword ptr [bp + 8]
        mov     al, byte ptr es:[bx + 3]
        mov     ah, 0
        push    ax
        mov     ax, 80h
        pop     dx
        sub     ax, dx
        les     bx, dword ptr [bp + 0ch]
        mov     dl, byte ptr es:[bx + 14h]
        mov     dh, 0
        imul    dx
        mov     bx, 7fh
        cwd
        idiv    bx
        shl     ax, 1
        mov     bx, ax
        add     si, word ptr [bx + TBL_6E82]
        mov     bx, word ptr [bp - 0ah]
        shl     bx, 1
        mov     di, word ptr [bx + TBL_6E82]
        cmp     word ptr [bp + 18h], 0
        jnz     br_cc0bb
        mov     ax, word ptr [bp - 0eh]
        mov     dx, word ptr [bp - 10h]
        sub     dx, di
        sbb     ax, 0
        mov     word ptr [bp - 1ah], ax
        mov     word ptr [bp - 1ch], dx
        cmp     word ptr [bp - 1ah], 0
        jg      br_cc080
        jl      br_cc073
        cmp     word ptr [bp - 1ch], 0
        jnc     br_cc080
br_cc073:
        mov     word ptr [bp - 1ah], 0
        mov     word ptr [bp - 1ch], 0
        mov     di, word ptr [bp - 10h]
br_cc080:
        xor     ax, ax
        cmp     ax, word ptr [bp - 1ah]
        jl      br_cc091
        jg      br_cc08e
        cmp     si, word ptr [bp - 1ch]
        jbe     br_cc091
br_cc08e:
        mov     si, word ptr [bp - 1ch]
br_cc091:
        push    0
        push    0ah
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 47h]
        else
        mov     ax, word ptr [bp - 45h]
        endif
        cwd
        push    dx
        push    ax
        mov     dx, word ptr [bp - 1ah]
        mov     ax, word ptr [bp - 1ch]
        mov     cl, 0ch
        callf   0f800h:far_fa1ac
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        if      FW_VERSION >= 311
        mov     word ptr [bp - 56h], ax
        else
        mov     word ptr [bp - 54h], ax
        endif
        jmp     br_cc101
br_cc0bb:
        mov     ax, si
        add     ax, di
        if      FW_VERSION >= 311
        mov     word ptr [bp - 30h], ax
        else
        mov     word ptr [bp - 2eh], ax
        endif
        xor     dx, dx
        cmp     dx, word ptr [bp - 0eh]
        jg      br_cc0db
        jl      br_cc0d0
        cmp     ax, word ptr [bp - 10h]
        jnc     br_cc0db
br_cc0d0:
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 30h]
        else
        mov     ax, word ptr [bp - 2eh]
        endif
        mov     word ptr [bp - 0eh], 0
        mov     word ptr [bp - 10h], ax
br_cc0db:
        push    0
        push    0ah
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 47h]
        else
        mov     ax, word ptr [bp - 45h]
        endif
        cwd
        push    dx
        push    ax
        mov     ax, si
        xor     dx, dx
        mov     cl, 0ch
        callf   0f800h:far_fa1ac
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        if      FW_VERSION >= 311
        mov     word ptr [bp - 56h], ax
        else
        mov     word ptr [bp - 54h], ax
        endif
br_cc101:
        if      FW_VERSION >= 311
        cmp     word ptr [bp - 56h], 1
        else
        cmp     word ptr [bp - 54h], 1
        endif
        ja      br_cc10c
        if      FW_VERSION >= 311
        mov     word ptr [bp - 56h], 2
        else
        mov     word ptr [bp - 54h], 2
        endif
br_cc10c:
        push    0
        push    0ah
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 47h]
        else
        mov     ax, word ptr [bp - 45h]
        endif
        cwd
        push    dx
        push    ax
        mov     dx, word ptr [bp - 0eh]
        mov     ax, word ptr [bp - 10h]
        mov     cl, 0ch
        callf   0f800h:far_fa1ac
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        if      FW_VERSION >= 311
        mov     word ptr [bp - 58h], ax
        cmp     word ptr [bp - 58h], 0
        else
        mov     word ptr [bp - 56h], ax
        cmp     word ptr [bp - 56h], 0
        endif
        jnz     br_cc13f
        if      FW_VERSION >= 311
        mov     word ptr [bp - 58h], 1
        else
        mov     word ptr [bp - 56h], 1
        endif
br_cc13f:
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 45h]
        else
        mov     ax, word ptr [bp - 43h]
        endif
        xor     dx, dx
        shl     ax, 1
        rcl     dx, 1
        mov     word ptr [bp - 22h], dx
        mov     word ptr [bp - 24h], ax
        or      si, si
        jnz     br_cc15a
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 45h]
        mov     word ptr [bp - 43h], ax
        else
        mov     ax, word ptr [bp - 43h]
        mov     word ptr [bp - 41h], ax
        endif
        jmp     br_cc19c
br_cc15a:
        push    0
        push    word 174h
        mov     bx, si
        xor     cx, cx
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 47h]
        else
        mov     ax, word ptr [bp - 45h]
        endif
        cwd
        callf   0f800h:far_fa0c8
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        push    dx
        push    ax
        push    word ptr [bp - 22h]
        push    word ptr [bp - 24h]
        callf   0f800h:far_fa0fe
        if      FW_VERSION >= 311
        mov     word ptr [bp - 43h], ax
        cmp     word ptr [bp - 43h], 0
        else
        mov     word ptr [bp - 41h], ax
        cmp     word ptr [bp - 41h], 0
        endif
        jnz     br_cc18e
        if      FW_VERSION >= 311
        mov     word ptr [bp - 43h], 1
        else
        mov     word ptr [bp - 41h], 1
        endif
br_cc18e:
        if      FW_VERSION < 311
        mov     ax, word ptr [bp - 41h]
        cmp     ax, word ptr [bp - 43h]
        jbe     br_cc19c
        endif
        mov     ax, word ptr [bp - 43h]
        if      FW_VERSION >= 311
        cmp     ax, word ptr [bp - 45h]
        jbe     br_cc19c
        mov     ax, word ptr [bp - 45h]
        mov     word ptr [bp - 43h], ax
        else
        mov     word ptr [bp - 41h], ax
        endif
br_cc19c:
        or      di, di
        jnz     br_cc1a7
        if      FW_VERSION >= 311
        mov     word ptr [bp - 52h], 8001h
        else
        mov     word ptr [bp - 50h], 8001h
        endif
        jmp     br_cc1fe
br_cc1a7:
        push    0
        push    di
        push    0
        push    word 1b9h
        if      FW_VERSION >= 311
        mov     bx, word ptr [bp - 45h]
        else
        mov     bx, word ptr [bp - 43h]
        endif
        xor     cx, cx
        xor     dx, dx
        mov     ax, 50h
        callf   0f800h:far_fa0c8
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        neg     dx
        neg     ax
        sbb     dx, 0
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        if      FW_VERSION >= 311
        mov     word ptr [bp - 52h], ax
        else
        mov     word ptr [bp - 50h], ax
        endif
        push    0
        push    word 1000h
        cwd
        push    ax
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 47h]
        else
        mov     ax, word ptr [bp - 45h]
        endif
        push    dx
        cwd
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        if      FW_VERSION >= 311
        mov     word ptr [bp - 52h], ax
        cmp     word ptr [bp - 52h], 0
        else
        mov     word ptr [bp - 50h], ax
        cmp     word ptr [bp - 50h], 0
        endif
        jnz     br_cc1fe
        if      FW_VERSION >= 311
        mov     word ptr [bp - 52h], 0ffffh
        else
        mov     word ptr [bp - 50h], 0ffffh
        endif
br_cc1fe:
        les     bx, dword ptr [bp + 14h]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        mov     dx, 7fh
        imul    dx
        mov     bx, 64h
        cwd
        idiv    bx
        mov     dl, al
        mov     bx, word ptr [bp + 14h]
        test    byte ptr es:[bx + 3], 80h
        jz      br_cc231
        cbw
        les     bx, dword ptr [bp + 10h]
        mov     dl, byte ptr es:[bx]
        mov     dh, 0
        imul    dx
        mov     bx, 80h
        cwd
        idiv    bx
        mov     dl, al
br_cc231:
        mov     al, dl
        cbw
        push    ax
        mov     al, byte ptr [B_E54C]
        cbw
        if      FW_VERSION >= 311
        mov     word ptr [bp - 34h], ax
        else
        mov     word ptr [bp - 32h], ax
        endif
        mov     dx, ax
        pop     ax
        imul    dx
        mov     bx, 7fh
        cwd
        idiv    bx
        mov     dl, al
        les     bx, dword ptr [bp + 14h]
        mov     al, byte ptr es:[bx + 3]
        and     al, 0fh
        mov     byte ptr [bp - 1dh], al
        cmp     byte ptr [bp - 1dh], 0
        jnz     br_cc25d
        mov     dl, 0
br_cc25d:
        mov     al, byte ptr [bp - 1dh]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_70E0]
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 39h], al
        else
        mov     byte ptr [bp - 37h], al
        endif
        mov     al, dl
        neg     al
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 38h], al
        else
        mov     byte ptr [bp - 36h], al
        endif
        les     bx, dword ptr [bp + 10h]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        if      FW_VERSION >= 311
        imul    word ptr [bp - 34h]
        else
        imul    word ptr [bp - 32h]
        endif
        mov     bx, 7fh
        cwd
        idiv    bx
        mov     dl, al
        mov     bx, word ptr [bp + 10h]
        mov     al, byte ptr es:[bx + 1]
        mov     ah, 0
        mov     word ptr [bp - 20h], ax
        mov     al, dl
        cbw
        if      FW_VERSION >= 311
        mov     word ptr [bp - 32h], ax
        else
        mov     word ptr [bp - 30h], ax
        endif
        mov     bx, word ptr [bp - 20h]
        shl     bx, 1
        imul    word ptr [bx + TBL_6F4C]
        sar     ax, 8
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 37h], al
        mov     ax, word ptr [bp - 32h]
        else
        mov     byte ptr [bp - 35h], al
        mov     ax, word ptr [bp - 30h]
        endif
        mov     bx, 64h
        sub     bx, word ptr [bp - 20h]
        shl     bx, 1
        imul    word ptr [bx + TBL_6F4C]
        sar     ax, 8
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 36h], al
        else
        mov     byte ptr [bp - 34h], al
        endif
        les     bx, dword ptr [bp + 0ch]
        mov     al, byte ptr es:[bx + 6]
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 59h], al
        else
        mov     byte ptr [bp - 57h], al
        endif
        les     bx, dword ptr [bp - 4]
        cmp     byte ptr es:[bx + 13h], 0
        jnz     br_cc2d1
        jmp     near br_cc38e
br_cc2d1:
        cmp     byte ptr [bp - 1dh], 0
        jle     br_cc2f6
        cmp     byte ptr [bp - 1dh], 9
        jge     br_cc2f6
        mov     al, byte ptr [bp - 1dh]
        dec     al
        and     al, 0feh
        inc     al
        mov     byte ptr [bp - 1dh], al
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_70E0]
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 39h], al
        else
        mov     byte ptr [bp - 37h], al
        endif
        inc     byte ptr [bp - 1dh]
br_cc2f6:
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 37h]
        else
        mov     al, byte ptr [bp - 35h]
        endif
        mov     ah, 0
        mov     word ptr [bp - 20h], ax
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 37h], 0
        push    0ffffh
        else
        mov     byte ptr [bp - 35h], 0
        endif
        les     bx, dword ptr [bp + 0ch]
        mov     al, byte ptr es:[bx + 8]
        mov     ah, 0
        push    ax
        mov     al, byte ptr es:[bx + 7]
        mov     ah, 0
        push    ax
        push    word ptr [bp + 6]
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 5ch]
        else
        lea     ax, [bp - 5ah]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 4ch]
        else
        lea     ax, [bp - 4ah]
        endif
        push    ax
        nop
        push    cs
        call    fn_cc3c7
        if      FW_VERSION >= 311
        add     sp, 10h
        mov     al, byte ptr [bp - 4ch]
        mov     byte ptr [bp - 2dh], al
        else
        add     sp, 0eh
        endif
        mov     al, byte ptr [bp - 1dh]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_70E0]
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 39h], al
        else
        mov     byte ptr [bp - 37h], al
        endif
        mov     al, byte ptr [bp - 20h]
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 37h], al
        mov     byte ptr [bp - 36h], 0
        else
        mov     byte ptr [bp - 35h], al
        mov     byte ptr [bp - 34h], 0
        endif
        les     bx, dword ptr [bp - 4]
        mov     ax, word ptr es:[bx + 1eh]
        mov     dx, word ptr es:[bx + 1ch]
        if      FW_VERSION >= 311
        add     word ptr [bp - 4bh], dx
        adc     word ptr [bp - 49h], ax
        cmp     byte ptr [bp - 59h], 1
        else
        add     word ptr [bp - 49h], dx
        adc     word ptr [bp - 47h], ax
        cmp     byte ptr [bp - 57h], 1
        endif
        jnz     br_cc362
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 59h], 0
        else
        mov     byte ptr [bp - 57h], 0
        endif
br_cc362:
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 2dh]
        push    ax
        endif
        les     bx, dword ptr [bp + 0ch]
        mov     al, byte ptr es:[bx + 8]
        mov     ah, 0
        push    ax
        mov     al, byte ptr es:[bx + 7]
        mov     ah, 0
        push    ax
        push    word ptr [bp + 6]
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 5ch]
        else
        lea     ax, [bp - 5ah]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 4ch]
        else
        lea     ax, [bp - 4ah]
        endif
        push    ax
        nop
        push    cs
        call    fn_cc3c7
        if      FW_VERSION >= 311
        add     sp, 10h
        else
        add     sp, 0eh
        endif
        jmp     br_cc3b6
br_cc38e:
        if      FW_VERSION >= 311
        push    0ffffh
        endif
        les     bx, dword ptr [bp + 0ch]
        mov     al, byte ptr es:[bx + 8]
        mov     ah, 0
        push    ax
        mov     al, byte ptr es:[bx + 7]
        mov     ah, 0
        push    ax
        push    word ptr [bp + 6]
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 5ch]
        else
        lea     ax, [bp - 5ah]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 4ch]
        else
        lea     ax, [bp - 4ah]
        endif
        push    ax
        nop
        push    cs
        call    fn_cc3c7
        if      FW_VERSION >= 311
        add     sp, 10h
        else
        add     sp, 0eh
        endif
br_cc3b6:
        callf   SEG_CDB9:far_cdc6d
br_cc3bb:
        pop     di
        pop     si
        leave
        retf
TBL_cc3bf:
        dw      tgt_cbd08
        dw      tgt_cbd1b
        dw      tgt_cbd2e
        dw      tgt_cbd3c
fn_cc3c7:
        push    bp
        mov     bp, sp
        callf   SEG_CDB9:far_cdcb0
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp + 14h]
        push    ax
        endif
        push    word ptr [bp + 12h]
        push    word ptr [bp + 10h]
        push    word ptr [bp + 0eh]
        les     bx, dword ptr [bp + 0ah]
        mov     al, byte ptr es:[bx + 3]
        mov     ah, 0
        push    ax
        callf   SEG_CAFA:far_cafac
        if      FW_VERSION >= 311
        add     sp, 0ah
        else
        add     sp, 8
        endif
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], al
        mov     al, byte ptr es:[bx]
        cbw
        shl     ax, 1
        mov     bx, ax
        mov     word ptr [bx + TBL_E223], 0
        mov     bx, word ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        cbw
        shl     ax, 1
        mov     bx, ax
        mov     word ptr [bx + TBL_E263], 0
        mov     bx, word ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        cbw
        shl     ax, 1
        mov     bx, ax
        mov     word ptr [bx + TBL_E2A3], 0
        mov     bx, word ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        cbw
        mov     dl, byte ptr [bp + 0eh]
        mov     bx, ax
        mov     byte ptr [bx + TBL_E3AC], dl
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_CDB9:far_cdb98
        add     sp, 4
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        cbw
        shl     ax, 1
        les     bx, dword ptr [bp + 0ah]
        mov     dx, word ptr es:[bx + 0ah]
        mov     bx, ax
        mov     word ptr [bx + TBL_E2E6], dx
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        cbw
        shl     ax, 1
        les     bx, dword ptr [bp + 0ah]
        mov     dx, word ptr es:[bx + 0ch]
        mov     bx, ax
        mov     word ptr [bx + TBL_E366], dx
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        cbw
        shl     ax, 1
        les     bx, dword ptr [bp + 0ah]
        mov     dx, word ptr es:[bx + 0eh]
        mov     bx, ax
        mov     word ptr [bx + TBL_E326], dx
        mov     bx, word ptr [bp + 0ah]
        push    word ptr es:[bx + 6]
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        cbw
        push    ax
        callf   SEG_CDDA:far_cddc1
        add     sp, 4
        les     bx, dword ptr [bp + 0ah]
        push    word ptr es:[bx + 4]
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        cbw
        add     ax, 20h
        push    ax
        callf   SEG_CDDA:far_cddc1
        add     sp, 4
        les     bx, dword ptr [bp + 6]
        cmp     word ptr es:[bx + 11h], 0
        jz      br_cc4d9
        les     bx, dword ptr [bp + 0ah]
        push    word ptr es:[bx + 8]
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        cbw
        add     ax, 40h
        push    ax
        callf   SEG_CDDA:far_cddc1
        add     sp, 4
br_cc4d9:
        callf   SEG_CDB9:far_cdcb9
        pop     bp
        retf
far_cc4e0:
        push    bp
        mov     bp, sp
        sub     sp, 6
        mov     byte ptr [bp - 6], 90h
        mov     byte ptr [bp - 5], 0
        mov     al, byte ptr [bp + 6]
        mov     byte ptr [bp - 4], al
        mov     byte ptr [bp - 3], 7fh
        mov     byte ptr [bp - 2], 40h
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    cs
        call    far_cb8a1
        add     sp, 4
        leave
        retf
far_cc50a:
        push    bp
        mov     bp, sp
        sub     sp, 22h
        mov     byte ptr [bp - 0ah], 90h
        mov     byte ptr [bp - 9], 0
        mov     byte ptr [bp - 8], 0
        mov     ax, word ptr [bp + 8]
        mov     dx, 7fh
        imul    dx
        mov     bx, 64h
        cwd
        idiv    bx
        mov     byte ptr [bp - 7], al
        mov     byte ptr [bp - 6], 40h
        push    ss
        lea     ax, [bp - 22h]
        push    ax
        callf   SEG_CB18:far_cb363
        add     sp, 4
        mov     al, byte ptr [bp + 6]
        mov     byte ptr [bp - 22h], al
        push    ss
        lea     ax, [bp - 4]
        push    ax
        callf   SEG_CB18:far_cb3de
        add     sp, 4
        cmp     word ptr [bp + 0ah], 0
        jz      br_cc55b
        mov     byte ptr [bp - 4], 0
br_cc55b:
        mov     al, byte ptr [bp + 0ah]
        mov     byte ptr [bp - 1], al
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 2], 64h
        endif
        push    0
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ss
        push    ax
        push    ss
        lea     ax, [bp - 22h]
        push    ax
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        push    62h
        push    cs
        call    fn_cbc38
        add     sp, 14h
        leave
        retf
far_cc583:
        push    bp
        mov     bp, sp
        sub     sp, 24h
        mov     ax, word ptr [bp + 6]
        mov     dx, 24h
        imul    dx
        mov     word ptr [bp - 0ch], ax
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 4816h]
        mov     dx, word ptr es:[bx + 4814h]
        mov     bx, word ptr [bp - 0ch]
        mov     cx, SEG_A28F
        mov     es, cx
        cmp     ax, word ptr es:[bx + 481ah]
        jl      br_cc5bd
        jnz     br_cc60d
        cmp     dx, word ptr es:[bx + 4818h]
        jnc     br_cc60d
br_cc5bd:
        mov     byte ptr [bp - 0ah], 90h
        mov     byte ptr [bp - 9], 0
        mov     byte ptr [bp - 8], 0
        mov     byte ptr [bp - 7], 7fh
        mov     byte ptr [bp - 6], 40h
        push    ss
        lea     ax, [bp - 24h]
        push    ax
        callf   SEG_CB18:far_cb363
        add     sp, 4
        mov     al, byte ptr [bp + 6]
        mov     byte ptr [bp - 24h], al
        push    ss
        lea     ax, [bp - 4]
        push    ax
        callf   SEG_CB18:far_cb3de
        add     sp, 4
        push    0
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    ss
        push    ax
        push    ss
        lea     ax, [bp - 24h]
        push    ax
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        push    62h
        push    cs
        call    fn_cbc38
        add     sp, 14h
br_cc60d:
        leave
        retf
far_cc60f:
        push    si
        xor     ax, ax
        mov     si, TBL_E263
loop_cc615:
        cmp     word ptr [si], 0
        jz      br_cc61f
        mov     ax, 1
        pop     si
        retf
br_cc61f:
        add     si, 2
        inc     ax
        cmp     si, TBL_E2A3
        jnz     loop_cc615
        xor     ax, ax
        pop     si
        retf
far_cc62d:
        push    si
        xor     si, si
loop_cc630:
        push    si
        callf   SEG_CDE1:far_cde12
        add     sp, 2
        inc     si
        cmp     si, 20h
        jl      loop_cc630
        pop     si
        retf
        if      FW_VERSION >= 312
far_cc641:
        push    bp
        mov     bp, sp
        sub     sp, 0ah
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        les     bx, dword ptr [bp - 8]
        mov     cl, byte ptr es:[bx + 2]
        cmp     cl, 23h
        jc      br_cc664
        cmp     cl, 62h
        jbe     br_cc668
br_cc664:
        mov     al, cl
        leave
        retf
br_cc668:
        mov     al, cl
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        mov     dx, word ptr [W_E40E]
        mov     bx, word ptr [FP_E40C]
        add     bx, ax
        add     bx, 0fcf6h
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], bx
        mov     es, word ptr [bp - 2]
        mov     al, byte ptr es:[bx + 1]
        mov     ah, 0
        cmp     ax, 2
        jz      br_cc69a
        cmp     ax, 3
        jz      br_cc6d3
        jmp     short br_cc718
br_cc69a:
        les     bx, dword ptr [bp - 8]
        mov     al, byte ptr es:[bx + 3]
        mov     byte ptr [bp - 9], al
        les     bx, dword ptr [bp - 4]
        cmp     al, byte ptr es:[bx + 4]
        jbe     br_cc6ba
        cmp     byte ptr es:[bx + 5], 23h
        jc      br_cc718
        mov     cl, byte ptr es:[bx + 5]
        jmp     br_cc718
br_cc6ba:
        mov     al, byte ptr [bp - 9]
        les     bx, dword ptr [bp - 4]
        cmp     al, byte ptr es:[bx + 2]
        jbe     br_cc718
        cmp     byte ptr es:[bx + 3], 23h
        jc      br_cc718
        mov     cl, byte ptr es:[bx + 3]
        jmp     br_cc718
br_cc6d3:
        les     bx, dword ptr [bp - 4]
        mov     dl, byte ptr es:[bx + 0ch]
        les     bx, dword ptr [bp - 8]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        and     ax, 3
        cmp     ax, 1
        jnz     br_cc6ee
        mov     dl, byte ptr es:[bx + 4]
br_cc6ee:
        les     bx, dword ptr [bp - 4]
        cmp     byte ptr es:[bx + 4], dl
        jnc     br_cc704
        cmp     byte ptr es:[bx + 5], 23h
        jc      br_cc718
        mov     cl, byte ptr es:[bx + 5]
        jmp     br_cc718
br_cc704:
        les     bx, dword ptr [bp - 4]
        cmp     byte ptr es:[bx + 2], dl
        jnc     br_cc718
        cmp     byte ptr es:[bx + 3], 23h
        jc      br_cc718
        mov     cl, byte ptr es:[bx + 3]
br_cc718:
        mov     al, cl
        leave
        retf
        phase   0ch
        elseif  FW_VERSION = 311
far_cc641:
        push    bp
        mov     bp, sp
        sub     sp, 0ah
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        les     bx, dword ptr [bp - 8]
        mov     cl, byte ptr es:[bx + 2]
        cmp     cl, 23h
        jc      br_cc664
        cmp     cl, 62h
        jbe     br_cc668
br_cc664:
        mov     al, cl
        leave
        retf
br_cc668:
        mov     al, cl
        mov     ah, 0
        mov     dx, 18h
        imul    dx
        mov     dx, word ptr [W_E40E]
        mov     bx, word ptr [FP_E40C]
        add     bx, ax
        add     bx, 0fcf6h
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], bx
        mov     es, word ptr [bp - 2]
        mov     al, byte ptr es:[bx + 1]
        mov     ah, 0
        cmp     ax, 2
        jz      br_cc69a
        cmp     ax, 3
        jz      br_cc6d3
        jmp     short br_cc718
br_cc69a:
        les     bx, dword ptr [bp - 8]
        mov     al, byte ptr es:[bx + 3]
        mov     byte ptr [bp - 9], al
        les     bx, dword ptr [bp - 4]
        cmp     al, byte ptr es:[bx + 4]
        jbe     br_cc6ba
        cmp     byte ptr es:[bx + 5], 23h
        jc      br_cc718
        mov     cl, byte ptr es:[bx + 5]
        jmp     br_cc718
br_cc6ba:
        mov     al, byte ptr [bp - 9]
        les     bx, dword ptr [bp - 4]
        cmp     al, byte ptr es:[bx + 2]
        jbe     br_cc718
        cmp     byte ptr es:[bx + 3], 23h
        jc      br_cc718
        mov     cl, byte ptr es:[bx + 3]
        jmp     br_cc718
br_cc6d3:
        les     bx, dword ptr [bp - 4]
        mov     dl, byte ptr es:[bx + 0ch]
        les     bx, dword ptr [bp - 8]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        and     ax, 3
        cmp     ax, 1
        jnz     br_cc6ee
        mov     dl, byte ptr es:[bx + 4]
br_cc6ee:
        les     bx, dword ptr [bp - 4]
        cmp     byte ptr es:[bx + 4], dl
        jnc     br_cc704
        cmp     byte ptr es:[bx + 5], 23h
        jc      br_cc718
        mov     cl, byte ptr es:[bx + 5]
        jmp     br_cc718
br_cc704:
        les     bx, dword ptr [bp - 4]
        cmp     byte ptr es:[bx + 2], dl
        jnc     br_cc718
        cmp     byte ptr es:[bx + 3], 23h
        jc      br_cc718
        mov     cl, byte ptr es:[bx + 3]
br_cc718:
        mov     al, cl
        leave
        retf
        phase   0ah
        else
        phase   3
        endif
far_cc71c:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp + 8]
        cbw
        cmp     ax, 1
        jz      br_cc737
        cmp     ax, 2
        jz      br_cc77e
        cmp     ax, 3
        jnz     br_cc735
        jmp     near br_cc7bf
br_cc735:
        pop     bp
        retf
br_cc737:
        mov     al, byte ptr [bp + 0ah]
        cbw
        push    ax
        mov     al, byte ptr [bp + 6]
        cbw
        push    ax
        if      FW_VERSION >= 311
        callf   SEG_DA5F:far_da5fe
        else
        callf   0e304h:L_e3041
        endif
        add     sp, 4
        cmp     byte ptr [B_D5DE], 4ah
        jz      br_cc753
        jmp     near br_cc7fe
br_cc753:
        cmp     byte ptr [B_D5DD], 1
        jz      br_cc75d
        jmp     near br_cc7fe
br_cc75d:
        mov     al, byte ptr [bp + 0ah]
        push    ax
        mov     al, byte ptr [bp + 6]
        push    ax
        push    ds
        push    word TBL_9503
        nop
        push    cs
        call    fn_cc800
        add     sp, 8
        mov     al, byte ptr [bp + 8]
        mov     byte ptr [B_9482], al
        mov     byte ptr [B_D4BE], 50h
        pop     bp
        retf
br_cc77e:
        mov     al, byte ptr [bp + 0ah]
        cbw
        push    ax
        mov     al, byte ptr [bp + 6]
        cbw
        push    ax
        callf   SEG_DA5F:far_da62b
        add     sp, 4
        cmp     byte ptr [B_D5DE], 4ah
        jnz     br_cc7fe
        cmp     byte ptr [B_D5DD], 1
        jnz     br_cc7fe
        mov     al, byte ptr [bp + 0ah]
        push    ax
        mov     al, byte ptr [bp + 6]
        push    ax
        push    ds
        push    word TBL_94C3
        nop
        push    cs
        call    fn_cc800
        add     sp, 8
        mov     al, byte ptr [bp + 8]
        mov     byte ptr [B_9482], al
        mov     byte ptr [B_D4BE], 50h
        pop     bp
        retf
br_cc7bf:
        mov     al, byte ptr [bp + 0ah]
        cbw
        push    ax
        mov     al, byte ptr [bp + 6]
        cbw
        push    ax
        callf   SEG_DA5F:far_da659
        add     sp, 4
        cmp     byte ptr [B_D5DE], 4ah
        jnz     br_cc7fe
        cmp     byte ptr [B_D5DD], 2
        jnz     br_cc7fe
        mov     al, byte ptr [bp + 0ah]
        push    ax
        mov     al, byte ptr [bp + 6]
        push    ax
        push    ds
        push    word TBL_9483
        nop
        push    cs
        call    fn_cc800
        add     sp, 8
        mov     al, byte ptr [bp + 8]
        mov     byte ptr [B_9482], al
        mov     byte ptr [B_D4BE], 50h
br_cc7fe:
        pop     bp
        retf
fn_cc800:
        push    bp
        mov     bp, sp
        push    si
        mov     al, byte ptr [bp + 0ah]
        cbw
        push    ax
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        mov     si, ax
        mov     byte ptr [bp + 0ah], 0
loop_cc817:
        mov     al, byte ptr [bp + 0ah]
        cbw
        push    ax
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        cmp     ax, si
        jnz     br_cc837
        mov     al, byte ptr [bp + 0ah]
        cbw
        les     bx, dword ptr [bp + 6]
        add     bx, ax
        mov     al, byte ptr [bp + 0ch]
        mov     byte ptr es:[bx], al
br_cc837:
        inc     byte ptr [bp + 0ah]
        cmp     byte ptr [bp + 0ah], 40h
        jl      loop_cc817
        pop     si
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   3
        elseif  FW_VERSION = 311
        phase   1
        else
        phase   0ah
        endif
fn_cc843:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    si
        push    di
        mov     word ptr [bp - 2], SEG_A28F
        mov     word ptr [bp - 4], 0
        xor     di, di
        cmp     di, word ptr [bp + 6]
        jge     br_cc8aa
loop_cc85c:
        mov     ax, di
        cwd
        mov     cl, 14h
        callf   0f800h:far_fa1ac
        add     ax, 0
        adc     dx, 1
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        xor     dx, dx
        mov     si, word ptr [bp - 4]
        jmp     br_cc883
loop_cc879:
        mov     es, word ptr [bp - 2]
        mov     word ptr es:[si], dx
        add     si, 2
        inc     dx
br_cc883:
        cmp     dx, 1001h
        jle     loop_cc879
        push    0
        push    0
        push    word 1001h
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        inc     di
        cmp     di, word ptr [bp + 6]
        jl      loop_cc85c
br_cc8aa:
        pop     di
        pop     si
        leave
        retf
fn_cc8ae:
        push    bp
        mov     bp, sp
        sub     sp, 0ah
        push    si
        push    di
        mov     word ptr [bp - 4], SEG_A28F
        mov     word ptr [bp - 6], 0
        mov     word ptr [bp - 2], 0
        mov     ax, word ptr [bp - 2]
        cmp     ax, word ptr [bp + 6]
        jge     br_cc934
loop_cc8cd:
        mov     ax, word ptr [bp - 2]
        cwd
        mov     cl, 14h
        callf   0f800h:far_fa1ac
        add     ax, 0
        adc     dx, 1
        mov     word ptr [bp - 8], dx
        mov     word ptr [bp - 0ah], ax
        les     di, dword ptr [bp - 6]
        xor     ax, ax
        mov     ah, al
        mov     cx, 800h
        rep stosw
        stosb
        push    1
        push    ax
        push    word 1001h
        push    dx
        push    word ptr [bp - 0ah]
        push    word ptr [bp - 4]
        push    word ptr [bp - 6]
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        xor     dx, dx
        mov     si, word ptr [bp - 6]
        jmp     br_cc923
loop_cc910:
        mov     es, word ptr [bp - 4]
        cmp     word ptr es:[si], dx
        jz      br_cc91f
        mov     ax, 1
        pop     di
        pop     si
        leave
        retf
br_cc91f:
        add     si, 2
        inc     dx
br_cc923:
        cmp     dx, 1001h
        jle     loop_cc910
        inc     word ptr [bp - 2]
        mov     ax, word ptr [bp - 2]
        cmp     ax, word ptr [bp + 6]
        jl      loop_cc8cd
br_cc934:
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
far_cc93a:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        push    di
        push    0
        callf   SEG_CB56:far_cb725
        add     sp, 2
        callf   SEG_CB56:far_cb74d
        mov     si, ax
        mov     al, byte ptr [si + TBL_7102]
        cbw
        mov     di, ax
        push    0
        callf   SEG_CB56:far_cb737
        add     sp, 2
        mov     word ptr [bp - 2], 0
        mov     si, 3
        jmp     br_cc9a4
loop_cc96e:
        mov     al, byte ptr [si + TBL_70EA]
        push    ax
        callf   SEG_CB56:far_cb725
        add     sp, 2
        mov     al, byte ptr [si + TBL_70EE]
        cbw
        push    ax
        push    cs
        call    fn_cc843
        add     sp, 2
        mov     al, byte ptr [si + TBL_70EE]
        cbw
        push    ax
        push    cs
        call    fn_cc8ae
        add     sp, 2
        or      ax, ax
        jnz     br_cc9a3
        mov     al, byte ptr [si + TBL_70EE]
        cbw
        mov     word ptr [bp - 2], ax
        jmp     br_cc9a8
br_cc9a3:
        dec     si
br_cc9a4:
        or      si, si
        jg      loop_cc96e
br_cc9a8:
        mov     ax, word ptr [bp - 2]
        cmp     ax, 1
        jz      br_cc9bc
        cmp     ax, 4
        jz      br_cc9d8
        cmp     ax, 10h
        jz      br_cc9f4
        jmp     br_cca0c
br_cc9bc:
        mov     al, byte ptr [di + TBL_70F2]
        push    ax
        callf   SEG_CB56:far_cb725
        add     sp, 2
        mov     al, byte ptr [di + TBL_70FA]
        push    ax
        callf   SEG_CB56:far_cb737
        add     sp, 2
        jmp     br_cca25
br_cc9d8:
        mov     al, byte ptr [di + TBL_70F6]
        push    ax
        callf   SEG_CB56:far_cb725
        add     sp, 2
        mov     al, byte ptr [di + TBL_70FE]
        push    ax
        callf   SEG_CB56:far_cb737
        add     sp, 2
        jmp     br_cca25
br_cc9f4:
        push    7
        callf   SEG_CB56:far_cb725
        add     sp, 2
        push    0
        callf   SEG_CB56:far_cb737
        add     sp, 2
        xor     di, di
        jmp     br_cca25
br_cca0c:
        push    0
        callf   SEG_CB56:far_cb725
        add     sp, 2
        push    8
        callf   SEG_CB56:far_cb737
        add     sp, 2
        mov     word ptr [bp - 2], 0
br_cca25:
        mov     al, byte ptr [di + TBL_70EE]
        cbw
        mov     dx, word ptr [bp - 2]
        add     dx, ax
        mov     word ptr [W_F290], dx
        mov     ax, word ptr [W_F290]
        pop     di
        pop     si
        leave
        retf
far_cca3a:
        if      FW_VERSION >= 311
        push    bp
        mov     bp, sp
        sub     sp, 4
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 0
        cmp     word ptr [W_F290], 0
        jz      br_cca68
        endif
        mov     ax, word ptr [W_F290]
        cwd
        mov     cl, 14h
        callf   0f800h:far_fa1ac
        add     ax, 0f830h
        adc     dx, 0fffeh
        if      FW_VERSION >= 311
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
br_cca68:
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        leave
        endif
        retf
far_cca70:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 0
        xor     cx, cx
        xor     si, si
loop_cca85:
        cmp     byte ptr [si + TBL_D65B], 0ffh
        jnz     br_ccaa0
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        add     dx, word ptr [si + TBL_D661]
        adc     ax, word ptr [si + TBL_D663]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
br_ccaa0:
        add     si, 0ah
        inc     cx
        cmp     si, 0bb8h
        jnz     loop_cca85
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        pop     si
        leave
        retf
far_ccab3:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 0
        xor     cx, cx
        xor     si, si
loop_ccac8:
        cmp     byte ptr [si + TBL_D65B], 1
        jnz     br_ccae3
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        add     dx, word ptr [si + TBL_D661]
        adc     ax, word ptr [si + TBL_D663]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
br_ccae3:
        add     si, 0ah
        inc     cx
        cmp     si, 0bb8h
        jnz     loop_ccac8
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        pop     si
        leave
        retf
fn_ccaf6:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        push    di
        xor     di, di
        mov     si, TBL_D65B
loop_ccb03:
        cmp     byte ptr [si], 0
        jz      br_ccb12
        add     si, 0ah
        inc     di
        if      FW_VERSION >= 312
        cmp     si, 0e213h
        elseif  FW_VERSION = 311
        cmp     si, 0e15bh
        else
        cmp     si, 0dc28h
        endif
        jnz     loop_ccb03
br_ccb12:
        cmp     di, 12ch
        jnz     br_ccb1f
        mov     ax, 0fffeh
        pop     di
        pop     si
        leave
        retf
br_ccb1f:
        xor     cx, cx
        xor     si, si
br_ccb23:
        cmp     byte ptr [si + TBL_D65B], 0ffh
        jz      br_ccb2d
        jmp     near br_ccbc9
br_ccb2d:
        mov     ax, word ptr [si + TBL_D663]
        mov     dx, word ptr [si + TBL_D661]
        cmp     ax, word ptr [bp + 8]
        jnc     br_ccb3d
        jmp     near br_ccbc9
br_ccb3d:
        jnz     br_ccb47
        cmp     dx, word ptr [bp + 6]
        jnc     br_ccb47
        jmp     near br_ccbc9
br_ccb47:
        mov     ax, cx
        mov     dx, 0ah
        imul    dx
        mov     si, ax
        mov     bx, ax
        mov     byte ptr [bx + TBL_D65B], 1
        mov     al, byte ptr [bp + 0ah]
        mov     byte ptr [si + TBL_D65C], al
        mov     ax, word ptr [si + TBL_D663]
        mov     dx, word ptr [si + TBL_D661]
        sub     dx, word ptr [bp + 6]
        sbb     ax, word ptr [bp + 8]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        mov     word ptr [si + TBL_D663], ax
        mov     word ptr [si + TBL_D661], dx
        mov     ax, word ptr [bp - 4]
        or      ax, word ptr [bp - 2]
        jz      br_ccbc3
        mov     ax, di
        mov     dx, 0ah
        imul    dx
        mov     di, ax
        mov     bx, ax
        mov     byte ptr [bx + TBL_D65B], 0ffh
        mov     byte ptr [di + TBL_D65C], 0ffh
        mov     ax, word ptr [si + TBL_D65F]
        mov     dx, word ptr [si + TBL_D65D]
        add     dx, word ptr [si + TBL_D661]
        adc     ax, word ptr [si + TBL_D663]
        mov     word ptr [di + TBL_D65F], ax
        mov     word ptr [di + TBL_D65D], dx
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        mov     word ptr [di + TBL_D663], ax
        mov     word ptr [di + TBL_D661], dx
br_ccbc3:
        mov     ax, cx
        pop     di
        pop     si
        leave
        retf
br_ccbc9:
        add     si, 0ah
        inc     cx
        cmp     si, 0bb8h
        jz      br_ccbd6
        jmp     near br_ccb23
br_ccbd6:
        mov     ax, 0fffeh
        pop     di
        pop     si
        leave
        retf
far_ccbdd:
        push    bp
        mov     bp, sp
        sub     sp, 12h
        push    si
        push    di
        nop
        push    cs
        call    fn_cd909
        mov     word ptr [bp - 0eh], 0
br_ccbef:
        mov     ax, word ptr [bp - 0eh]
        mov     dx, 0ah
        imul    dx
        mov     si, ax
        mov     bx, ax
        cmp     byte ptr [bx + TBL_D65B], 0
        jnz     br_ccc09
        mov     ax, 0fffeh
        pop     di
        pop     si
        leave
        retf
br_ccc09:
        cmp     byte ptr [si + TBL_D65B], 0ffh
        jz      br_ccc13
        jmp     br_cce38
br_ccc13:
        mov     ax, word ptr [bp - 0eh]
        inc     ax
        mov     word ptr [bp - 10h], ax
        mov     dx, 0ah
        imul    dx
        mov     di, ax
        mov     bx, ax
        cmp     byte ptr [bx + TBL_D65B], 0ffh
        jz      br_ccc2d
        jmp     near br_cccf1
br_ccc2d:
        mov     ax, word ptr [si + TBL_D65F]
        mov     dx, word ptr [si + TBL_D65D]
        mov     word ptr [di + TBL_D65F], ax
        mov     word ptr [di + TBL_D65D], dx
        mov     ax, word ptr [si + TBL_D663]
        mov     dx, word ptr [si + TBL_D661]
        add     word ptr [di + TBL_D661], dx
        adc     word ptr [di + TBL_D663], ax
        mov     ax, word ptr [di + TBL_D663]
        mov     dx, word ptr [di + TBL_D661]
        sub     dx, word ptr [bp + 8]
        sbb     ax, word ptr [bp + 0ah]
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp - 0ch], dx
        mov     byte ptr [si + TBL_D65B], 0
        mov     word ptr [si + TBL_D65F], 0ffffh
        mov     word ptr [si + TBL_D65D], 0ffffh
        mov     word ptr [si + TBL_D663], 0
        mov     word ptr [si + TBL_D661], 0
        mov     ax, word ptr [di + TBL_D663]
        mov     dx, word ptr [di + TBL_D661]
        cmp     ax, word ptr [bp + 0ah]
        jnc     br_ccc8e
        jmp     br_cce38
br_ccc8e:
        jnz     br_ccc98
        cmp     dx, word ptr [bp + 8]
        jnc     br_ccc98
        jmp     br_cce38
br_ccc98:
        mov     byte ptr [di + TBL_D65B], 1
        mov     al, byte ptr [bp + 6]
        mov     byte ptr [di + TBL_D65C], al
        mov     ax, word ptr [bp - 0ch]
        or      ax, word ptr [bp - 0ah]
        jz      br_cccea
        mov     ax, word ptr [bp - 0ah]
        mov     dx, word ptr [bp - 0ch]
        sub     word ptr [di + TBL_D661], dx
        sbb     word ptr [di + TBL_D663], ax
        mov     byte ptr [si + TBL_D65B], 0ffh
        mov     byte ptr [si + TBL_D65C], 0ffh
        mov     ax, word ptr [di + TBL_D65F]
        mov     dx, word ptr [di + TBL_D65D]
        add     dx, word ptr [di + TBL_D661]
        adc     ax, word ptr [di + TBL_D663]
        mov     word ptr [si + TBL_D65F], ax
        mov     word ptr [si + TBL_D65D], dx
        mov     ax, word ptr [bp - 0ah]
        mov     dx, word ptr [bp - 0ch]
        mov     word ptr [si + TBL_D663], ax
        mov     word ptr [si + TBL_D661], dx
br_cccea:
        mov     ax, word ptr [bp - 10h]
        pop     di
        pop     si
        leave
        retf
br_cccf1:
        cmp     byte ptr [di + TBL_D65B], 1
        jz      br_cccfb
        jmp     br_cce38
br_cccfb:
        mov     ax, word ptr [si + TBL_D663]
        mov     dx, word ptr [si + TBL_D661]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        mov     ax, word ptr [di + TBL_D663]
        mov     dx, word ptr [di + TBL_D661]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        mov     bx, word ptr [bp - 10h]
        inc     bx
        mov     ax, bx
        mov     dx, 0ah
        imul    dx
        mov     cx, ax
        jmp     br_ccd3f
loop_ccd26:
        mov     bx, cx
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        add     dx, word ptr [bx + TBL_D661]
        adc     ax, word ptr [bx + TBL_D663]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        add     cx, 0ah
br_ccd3f:
        mov     bx, cx
        cmp     byte ptr [bx + TBL_D65B], 1
        jz      loop_ccd26
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    word ptr [si + TBL_D65F]
        push    word ptr [si + TBL_D65D]
        push    word ptr [di + TBL_D65F]
        push    word ptr [di + TBL_D65D]
        nop
        push    cs
        call    far_cd68a
        add     sp, 0ch
        mov     ax, word ptr [bp - 10h]
        mov     dx, 0ah
        imul    dx
        mov     word ptr [bp - 12h], ax
        mov     ax, word ptr [bp - 0eh]
        mov     dx, 0ah
        imul    dx
        mov     di, ax
        jmp     br_ccde1
loop_ccd7d:
        mov     byte ptr [di + TBL_D65B], 1
        mov     bx, word ptr [bp - 12h]
        mov     al, byte ptr [bx + TBL_D65C]
        mov     byte ptr [di + TBL_D65C], al
        mov     cl, al
        mov     ax, word ptr [bx + TBL_D65F]
        mov     dx, word ptr [bx + TBL_D65D]
        sub     dx, word ptr [bp - 8]
        sbb     ax, word ptr [bp - 6]
        mov     word ptr [di + TBL_D65F], ax
        mov     word ptr [di + TBL_D65D], dx
        mov     al, cl
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, word ptr [bp - 6]
        mov     cx, word ptr [bp - 8]
        mov     si, ax
        mov     es, dx
        sub     word ptr es:[si + 4820h], cx
        sbb     word ptr es:[si + 4822h], bx
        mov     bx, word ptr [bp - 12h]
        mov     ax, word ptr [bx + TBL_D663]
        mov     dx, word ptr [bx + TBL_D661]
        mov     word ptr [di + TBL_D663], ax
        mov     word ptr [di + TBL_D661], dx
        add     word ptr [bp - 12h], 0ah
        add     di, 0ah
        inc     word ptr [bp - 0eh]
br_ccde1:
        mov     bx, word ptr [bp - 12h]
        cmp     byte ptr [bx + TBL_D65B], 1
        jz      loop_ccd7d
        mov     ax, word ptr [bp - 0eh]
        mov     dx, 0ah
        imul    dx
        mov     si, ax
        mov     bx, ax
        mov     byte ptr [bx + TBL_D65B], 0ffh
        mov     byte ptr [si + TBL_D65C], 0ffh
        mov     bx, si
        mov     ax, W_D651
        add     ax, 2
        add     bx, ax
        mov     ax, word ptr [bx + 2]
        mov     dx, word ptr [bx]
        mov     bx, si
        mov     cx, W_D651
        add     cx, 6
        add     bx, cx
        add     dx, word ptr [bx]
        adc     ax, word ptr [bx + 2]
        mov     word ptr [si + TBL_D65F], ax
        mov     word ptr [si + TBL_D65D], dx
        mov     ax, word ptr [bp - 6]
        mov     dx, word ptr [bp - 8]
        mov     word ptr [si + TBL_D663], ax
        mov     word ptr [si + TBL_D661], dx
        dec     word ptr [bp - 0eh]
br_cce38:
        inc     word ptr [bp - 0eh]
        cmp     word ptr [bp - 0eh], 12ch
        jge     br_cce45
        jmp     br_ccbef
br_cce45:
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
far_cce4b:
        push    bp
        mov     bp, sp
        sub     sp, 1ch
        push    si
        push    di
        push    ss
        pop     es
        lea     di, [bp - 1ch]
        push    es
        mov     es, word ptr [bp + 8]
        push    di
        mov     di, word ptr [bp + 6]
        mov     dx, 11h
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
        jnc     br_cce81
        add     cx, dx
        xor     dx, dx
br_cce81:
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        mov     cx, dx
        xor     ax, ax
        rep stosb
        pop     ds
        push    10h
        push    ss
        lea     ax, [bp - 1ch]
        push    ax
        nop
        push    cs
        call    far_cdb31
        add     sp, 6
        push    ss
        lea     ax, [bp - 1ch]
        push    ax
        nop
        push    cs
        call    far_cd551
        add     sp, 4
        or      ax, ax
        jl      br_cceb7
        mov     ax, 0ffffh
        pop     di
        pop     si
        leave
        retf
br_cceb7:
        nop
        push    cs
        call    far_cd063
        mov     word ptr [bp - 2], ax
        cmp     ax, 0ffffh
        jnz     br_ccecb
        mov     ax, 0fffdh
        pop     di
        pop     si
        leave
        retf
br_ccecb:
        mov     ax, word ptr [bp + 0ch]
        mov     dx, word ptr [bp + 0ah]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        cmp     word ptr [bp + 0eh], 0
        jz      br_ccee3
        add     word ptr [bp - 8], dx
        adc     word ptr [bp - 6], ax
br_ccee3:
        push    word ptr [bp - 2]
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        push    cs
        call    fn_ccaf6
        add     sp, 6
        mov     word ptr [bp - 4], ax
        or      ax, ax
        jge     br_ccf2b
        push    cs
        call    far_cca70
        cmp     dx, word ptr [bp - 6]
        jl      br_ccf1e
        jnz     br_ccf0a
        cmp     ax, word ptr [bp - 8]
        jc      br_ccf1e
br_ccf0a:
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        mov     al, byte ptr [bp - 2]
        push    ax
        push    cs
        call    far_ccbdd
        add     sp, 6
        mov     word ptr [bp - 4], ax
br_ccf1e:
        cmp     word ptr [bp - 4], 0
        jge     br_ccf2b
        mov     ax, 0fffeh
        pop     di
        pop     si
        leave
        retf
br_ccf2b:
        mov     ax, SEG_A28F
        push    ax
        mov     ax, word ptr [bp - 2]
        mov     dx, 24h
        imul    dx
        add     ax, 4800h
        push    ss
        pop     es
        lea     di, [bp - 1ch]
        mov     dx, 10h
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
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        sub     dx, cx
        jnc     br_ccf65
        add     cx, dx
        xor     dx, dx
br_ccf65:
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        mov     cx, dx
        xor     ax, ax
        rep stosb
        pop     ds
        mov     ax, word ptr [bp - 2]
        mov     dx, 24h
        imul    dx
        mov     si, ax
        mov     dx, SEG_A28F
        push    ax
        mov     ax, word ptr [bp - 4]
        mov     bx, 0ah
        push    dx
        imul    bx
        mov     word ptr [bp - 0ah], ax
        mov     bx, ax
        mov     ax, word ptr [bx + TBL_D65F]
        mov     dx, word ptr [bx + TBL_D65D]
        pop     es
        pop     bx
        mov     word ptr es:[bx + 4822h], ax
        mov     word ptr es:[bx + 4820h], dx
        cmp     word ptr [bp + 0ch], 0
        jg      br_ccfbd
        jl      br_ccfb3
        cmp     word ptr [bp + 0ah], 1b9h
        jnc     br_ccfbd
br_ccfb3:
        mov     word ptr [bp + 0ch], 0
        mov     word ptr [bp + 0ah], 1b9h
br_ccfbd:
        mov     ax, SEG_A28F
        mov     dx, word ptr [bp + 0ch]
        mov     bx, word ptr [bp + 0ah]
        mov     es, ax
        mov     word ptr es:[si + 481eh], dx
        mov     word ptr es:[si + 481ch], bx
        mov     bx, word ptr [bp - 0ah]
        mov     ax, word ptr [bx + TBL_D65F]
        mov     dx, word ptr [bx + TBL_D65D]
        mov     word ptr [W_E3A8], ax
        mov     word ptr [W_E3A6], dx
        mov     ax, SEG_A28F
        mov     dl, byte ptr [bp + 0eh]
        mov     es, ax
        mov     byte ptr es:[si + 4813h], dl
        push    word ptr [bp - 2]
        nop
        push    cs
        call    far_cd003
        add     sp, 2
        mov     ax, word ptr [bp - 2]
        pop     di
        pop     si
        leave
        retf
far_cd003:
        push    bp
        mov     bp, sp
        push    si
        mov     ax, word ptr [bp + 6]
        mov     dx, 24h
        imul    dx
        mov     si, ax
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     byte ptr es:[bx + 4811h], 64h
        mov     ax, SEG_A28F
        mov     es, ax
        mov     byte ptr es:[si + 4812h], 0
        mov     ax, SEG_A28F
        mov     es, ax
        mov     word ptr es:[si + 4816h], 0
        mov     word ptr es:[si + 4814h], 0
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[si + 481eh]
        mov     dx, word ptr es:[si + 481ch]
        add     dx, 0ffffh
        adc     ax, 0ffffh
        mov     bx, SEG_A28F
        mov     es, bx
        mov     word ptr es:[si + 481ah], ax
        mov     word ptr es:[si + 4818h], dx
        pop     si
        pop     bp
        retf
far_cd063:
        push    si
        xor     dx, dx
        mov     si, 4800h
loop_cd069:
        mov     ax, SEG_A28F
        mov     es, ax
        cmp     byte ptr es:[si], 0
        jnz     br_cd078
        mov     ax, dx
        pop     si
        retf
br_cd078:
        add     si, 24h
        inc     dx
        cmp     si, 5a00h
        jnz     loop_cd069
        mov     ax, 0ffffh
        pop     si
        retf
far_cd087:
        push    si
        xor     dx, dx
        xor     cx, cx
        mov     si, 4800h
loop_cd08f:
        mov     ax, SEG_A28F
        mov     es, ax
        cmp     byte ptr es:[si], 0
        jnz     br_cd09b
        inc     dx
br_cd09b:
        add     si, 24h
        inc     cx
        cmp     si, 5a00h
        jnz     loop_cd08f
        mov     ax, dx
        pop     si
        retf
far_cd0a9:
        push    bp
        mov     bp, sp
        sub     sp, 10h
        push    si
        push    di
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 0
        mov     word ptr [bp - 6], 0
        xor     si, si
loop_cd0c2:
        mov     byte ptr [si + TBL_D65B], 0
        mov     byte ptr [si + TBL_D65C], 0ffh
        mov     word ptr [si + TBL_D65F], 0ffffh
        mov     word ptr [si + TBL_D65D], 0ffffh
        mov     word ptr [si + TBL_D663], 0ffffh
        mov     word ptr [si + TBL_D661], 0ffffh
        add     si, 0ah
        inc     word ptr [bp - 6]
        cmp     si, 0bb8h
        jnz     loop_cd0c2
        xor     ax, ax
        mov     word ptr [bp - 8], ax
        mov     word ptr [bp - 6], ax
        cmp     word ptr [bp - 6], 80h
        jl      br_cd102
        jmp     near br_cd1bc
br_cd102:
        mov     dx, 24h
        imul    dx
        mov     word ptr [bp - 0eh], ax
        mov     si, ax
        xor     di, di
        add     ax, 4820h
        mov     word ptr [bp - 0ch], ax
        jmp     near br_cd1b3
br_cd117:
        mov     ax, SEG_A28F
        mov     es, ax
        cmp     byte ptr es:[si + 4800h], 0
        jnz     br_cd127
        jmp     near br_cd1a9
br_cd127:
        mov     byte ptr [di + TBL_D65B], 1
        mov     al, byte ptr [bp - 6]
        mov     byte ptr [di + TBL_D65C], al
        mov     ax, SEG_A28F
        mov     bx, word ptr [bp - 0ch]
        mov     es, ax
        mov     ax, word ptr es:[bx + 2]
        mov     dx, word ptr es:[bx]
        mov     word ptr [di + TBL_D65F], ax
        mov     word ptr [di + TBL_D65D], dx
        mov     ax, SEG_A28F
        mov     es, ax
        mov     al, byte ptr es:[si + 4813h]
        mov     ah, 0
        inc     ax
        cwd
        mov     bx, SEG_A28F
        mov     es, bx
        push    ax
        push    dx
        mov     dx, word ptr es:[si + 481eh]
        mov     ax, word ptr es:[si + 481ch]
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        mov     word ptr [di + TBL_D663], dx
        mov     word ptr [di + TBL_D661], ax
        add     di, 0ah
        inc     word ptr [bp - 8]
        mov     ax, SEG_A28F
        mov     bx, word ptr [bp - 0ch]
        mov     es, ax
        mov     ax, word ptr es:[bx + 2]
        mov     cx, ax
        mov     dx, word ptr es:[bx]
        mov     bx, dx
        cmp     ax, word ptr [bp - 2]
        jl      br_cd1a9
        jnz     br_cd19d
        cmp     dx, word ptr [bp - 4]
        jc      br_cd1a9
br_cd19d:
        mov     word ptr [bp - 2], cx
        mov     word ptr [bp - 4], bx
        mov     ax, word ptr [bp - 6]
        mov     word ptr [bp - 0ah], ax
br_cd1a9:
        add     si, 24h
        add     word ptr [bp - 0ch], 24h
        inc     word ptr [bp - 6]
br_cd1b3:
        cmp     si, 1200h
        jz      br_cd1bc
        jmp     near br_cd117
br_cd1bc:
        cmp     word ptr [bp - 8], 0
        jnz     br_cd1cb
        callf   SEG_CB18:far_cb23d
        pop     di
        pop     si
        leave
        retf
br_cd1cb:
        mov     ax, word ptr [bp - 8]
        mov     dx, 0ah
        imul    dx
        mov     bx, ax
        mov     byte ptr [bx + TBL_D65B], 0ffh
        mov     ax, word ptr [bp - 0ah]
        mov     dx, 24h
        imul    dx
        mov     word ptr [bp - 10h], ax
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 4813h]
        mov     ah, 0
        inc     ax
        cwd
        mov     bx, word ptr [bp - 10h]
        mov     cx, SEG_A28F
        mov     es, cx
        push    ax
        push    dx
        mov     dx, word ptr es:[bx + 481eh]
        mov     ax, word ptr es:[bx + 481ch]
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        push    ax
        mov     ax, word ptr [bp - 0ah]
        mov     bx, 24h
        push    dx
        imul    bx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 4822h]
        mov     dx, word ptr es:[bx + 4820h]
        pop     bx
        pop     cx
        add     dx, cx
        adc     ax, bx
        push    dx
        push    ax
        mov     ax, word ptr [bp - 8]
        mov     dx, 0ah
        imul    dx
        mov     bx, ax
        pop     ax
        mov     word ptr [bx + TBL_D65F], ax
        pop     ax
        mov     word ptr [bx + TBL_D65D], ax
        push    cs
        call    far_cca3a
        add     ax, 7d0h
        adc     dx, 1
        push    ax
        mov     ax, word ptr [bp - 8]
        mov     bx, 0ah
        push    dx
        imul    bx
        mov     cx, ax
        mov     bx, ax
        pop     ax
        pop     dx
        sub     dx, word ptr [bx + TBL_D65D]
        sbb     ax, word ptr [bx + TBL_D65F]
        mov     bx, cx
        mov     word ptr [bx + TBL_D663], ax
        mov     word ptr [bx + TBL_D661], dx
        nop
        push    cs
        call    fn_cd909
        mov     di, word ptr [bp - 8]
        inc     word ptr [bp - 8]
        cmp     word ptr [TBL_D65F], 1
        jnz     br_cd28d
        cmp     word ptr [TBL_D65D], 7d0h
        jz      br_cd2ca
br_cd28d:
        mov     ax, word ptr [bp - 8]
        mov     dx, 0ah
        imul    dx
        mov     cx, ax
        mov     bx, ax
        mov     byte ptr [bx + TBL_D65B], 0ffh
        mov     bx, cx
        mov     word ptr [bx + TBL_D65F], 1
        mov     word ptr [bx + TBL_D65D], 7d0h
        mov     ax, word ptr [TBL_D65F]
        mov     dx, word ptr [TBL_D65D]
        sub     dx, 7d0h
        sbb     ax, 1
        mov     word ptr [bx + TBL_D663], ax
        mov     word ptr [bx + TBL_D661], dx
        inc     word ptr [bp - 8]
        nop
        push    cs
        call    fn_cd909
br_cd2ca:
        mov     word ptr [bp - 6], 0
        xor     cx, cx
        mov     ax, word ptr [bp - 8]
        mov     dx, 0ah
        imul    dx
        mov     si, ax
        cmp     word ptr [bp - 6], di
        jge     br_cd34a
loop_cd2e0:
        mov     bx, cx
        mov     ax, word ptr [bx + TBL_D65F]
        mov     dx, word ptr [bx + TBL_D65D]
        add     dx, word ptr [bx + TBL_D661]
        adc     ax, word ptr [bx + TBL_D663]
        cmp     ax, word ptr [bx + TBL_D669]
        ja      br_cd33f
        jc      br_cd300
        cmp     dx, word ptr [bx + TBL_D667]
        jnc     br_cd33f
br_cd300:
        mov     byte ptr [si + TBL_D65B], 0ffh
        mov     byte ptr [si + TBL_D65C], 0ffh
        mov     bx, cx
        mov     ax, word ptr [bx + TBL_D65F]
        mov     dx, word ptr [bx + TBL_D65D]
        add     dx, word ptr [bx + TBL_D661]
        adc     ax, word ptr [bx + TBL_D663]
        mov     word ptr [si + TBL_D65F], ax
        mov     word ptr [si + TBL_D65D], dx
        mov     ax, word ptr [bx + TBL_D669]
        mov     dx, word ptr [bx + TBL_D667]
        sub     dx, word ptr [si + TBL_D65D]
        sbb     ax, word ptr [si + TBL_D65F]
        mov     word ptr [si + TBL_D663], ax
        mov     word ptr [si + TBL_D661], dx
        add     si, 0ah
br_cd33f:
        add     cx, 0ah
        inc     word ptr [bp - 6]
        cmp     word ptr [bp - 6], di
        jl      loop_cd2e0
br_cd34a:
        nop
        push    cs
        call    fn_cd909
        pop     di
        pop     si
        leave
        retf
far_cd353:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    si
        push    di
        cmp     word ptr [bp + 6], 80h
        jc      br_cd369
        mov     ax, 0fffch
        pop     di
        pop     si
        leave
        retf
br_cd369:
        mov     ax, word ptr [bp + 6]
        mov     dx, 24h
        imul    dx
        mov     word ptr [bp - 6], ax
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        cmp     byte ptr es:[bx + 4800h], 0
        jnz     br_cd38a
        mov     ax, 0fffch
        pop     di
        pop     si
        leave
        retf
br_cd38a:
        mov     bx, word ptr [bp - 6]
        mov     ax, SEG_A28F
        mov     es, ax
        cmp     byte ptr es:[bx + 4813h], 0
        jnz     br_cd3a5
        cmp     word ptr [bp + 8], 0
        jle     br_cd3a5
        mov     word ptr [bp + 8], 0
br_cd3a5:
        mov     word ptr [bp - 2], 0
        xor     si, si
        mov     di, TBL_D661
        mov     word ptr [bp - 4], TBL_D65D
br_cd3b4:
        mov     al, byte ptr [si + TBL_D65C]
        cbw
        cmp     ax, word ptr [bp + 6]
        jz      br_cd3c1
        jmp     br_cd4b6
br_cd3c1:
        mov     ax, word ptr [bp + 8]
        or      ax, ax
        jz      br_cd3d8
        cmp     ax, 1
        jz      br_cd427
        cmp     ax, 2
        jnz     br_cd3d5
        jmp     near br_cd493
br_cd3d5:
        jmp     br_cd4b6
br_cd3d8:
        mov     byte ptr [si + TBL_D65B], 0ffh
        mov     byte ptr [si + TBL_D65C], 0ffh
        push    word ptr [bp - 2]
        mov     ax, word ptr [di + 2]
        mov     dx, word ptr [di]
        mov     bx, word ptr [bp - 4]
        add     dx, word ptr [bx]
        adc     ax, word ptr [bx + 2]
        push    ax
        push    dx
        push    word ptr [bx + 2]
        push    word ptr [bx]
        nop
        push    cs
        call    fn_cd9e4
        add     sp, 0ah
        mov     ax, word ptr [bp + 6]
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     byte ptr es:[bx + 4800h], 0
        if      FW_VERSION >= 311
        cmp     word ptr [bp + 0ah], 1
        jz      br_cd41f
        jmp     near br_cd4b6
br_cd41f:
        endif
        nop
        push    cs
        call    far_cd4d6
        jmp     near br_cd4b6
br_cd427:
        mov     ax, word ptr [bp + 6]
        mov     dx, 24h
        imul    dx
        mov     word ptr [bp - 6], ax
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 4822h]
        mov     dx, word ptr es:[bx + 4820h]
        mov     bx, word ptr [bp - 6]
        mov     cx, SEG_A28F
        mov     es, cx
        add     dx, word ptr es:[bx + 481ch]
        adc     ax, word ptr es:[bx + 481eh]
        mov     cx, SEG_A28F
        mov     es, cx
        mov     word ptr es:[bx + 4822h], ax
        mov     word ptr es:[bx + 4820h], dx
        mov     ax, word ptr [di + 2]
        mov     dx, word ptr [di]
        shr     ax, 1
        rcr     dx, 1
        mov     bx, word ptr [bp - 4]
        add     word ptr [bx], dx
        adc     word ptr [bx + 2], ax
        mov     ax, word ptr [di + 2]
        mov     dx, word ptr [di]
        shr     ax, 1
        rcr     dx, 1
        mov     word ptr [di + 2], ax
        mov     word ptr [di], dx
        mov     bx, word ptr [bp - 6]
        mov     ax, SEG_A28F
        mov     es, ax
        mov     byte ptr es:[bx + 4813h], 0
        jmp     br_cd4b6
br_cd493:
        mov     ax, word ptr [di + 2]
        mov     dx, word ptr [di]
        shr     ax, 1
        rcr     dx, 1
        mov     word ptr [di + 2], ax
        mov     word ptr [di], dx
        mov     ax, word ptr [bp + 6]
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     byte ptr es:[bx + 4813h], 0
br_cd4b6:
        add     si, 0ah
        add     di, 0ah
        add     word ptr [bp - 4], 0ah
        inc     word ptr [bp - 2]
        cmp     si, 0bb8h
        jz      br_cd4cc
        jmp     br_cd3b4
br_cd4cc:
        push    cs
        call    far_cd0a9
        if      FW_VERSION < 311
        push    0
        push    word ptr [bp + 6]
        callf   0d266h:L_d2774
        add     sp, 4
        endif
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
far_cd4d6:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        push    di
        mov     al, byte ptr [B_E421]
        mov     ah, 0
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], 0
loop_cd4eb:
        push    word ptr [bp - 4]
        callf   SEG_C495:far_c6547
        add     sp, 2
        mov     di, 23h
        mov     cx, 348h
loop_cd4fc:
        les     bx, dword ptr [FP_E40C]
        add     bx, cx
        mov     si, bx
        mov     al, byte ptr es:[bx - 30ah]
        mov     ah, 0
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        cmp     byte ptr es:[bx + 4800h], 0
        jnz     br_cd529
        mov     es, word ptr [W_E40E]
        mov     byte ptr es:[si - 30ah], 0ffh
br_cd529:
        add     cx, 18h
        inc     di
        cmp     cx, 930h
        jnz     loop_cd4fc
        inc     word ptr [bp - 4]
        cmp     word ptr [bp - 4], 18h
        jl      loop_cd4eb
        mov     al, byte ptr [bp - 2]
        mov     byte ptr [B_E421], al
        push    word ptr [bp - 2]
        callf   SEG_C495:far_c6547
        add     sp, 2
        pop     di
        pop     si
        leave
        retf
far_cd551:
        push    bp
        mov     bp, sp
        sub     sp, 12h
        push    si
        push    di
        push    ss
        pop     es
        lea     di, [bp - 12h]
        push    es
        mov     es, word ptr [bp + 8]
        push    di
        mov     di, word ptr [bp + 6]
        mov     dx, 11h
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
        jnc     br_cd587
        add     cx, dx
        xor     dx, dx
br_cd587:
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        mov     cx, dx
        xor     ax, ax
        rep stosb
        pop     ds
        push    10h
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        nop
        push    cs
        call    far_cdb31
        add     sp, 6
        xor     di, di
        mov     si, 4800h
loop_cd5aa:
        push    10h
        push    word SEG_A28F
        push    si
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        callf   0f800h:far_fa74e
        add     sp, 0ah
        or      ax, ax
        jnz     br_cd5c7
        mov     ax, di
        pop     di
        pop     si
        leave
        retf
br_cd5c7:
        add     si, 24h
        inc     di
        cmp     si, 5a00h
        jnz     loop_cd5aa
        mov     ax, 0fffch
        pop     di
        pop     si
        leave
        retf
far_cd5d8:
        push    bp
        mov     bp, sp
        push    si
        mov     bx, word ptr [bp + 6]
        cmp     bx, 80h
        jc      br_cd5e8
        jmp     near br_cd687
br_cd5e8:
        mov     ax, bx
        mov     dx, 24h
        imul    dx
        mov     si, ax
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        cmp     byte ptr es:[bx + 4800h], 0
        jnz     br_cd603
        jmp     near br_cd687
br_cd603:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[si + 4816h]
        mov     dx, word ptr es:[si + 4814h]
        mov     bx, SEG_A28F
        mov     es, bx
        cmp     ax, word ptr es:[si + 481eh]
        jl      br_cd645
        jg      br_cd627
        cmp     dx, word ptr es:[si + 481ch]
        jbe     br_cd645
br_cd627:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[si + 481eh]
        mov     dx, word ptr es:[si + 481ch]
        mov     bx, SEG_A28F
        mov     es, bx
        mov     word ptr es:[si + 4816h], ax
        mov     word ptr es:[si + 4814h], dx
br_cd645:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[si + 481ah]
        mov     dx, word ptr es:[si + 4818h]
        mov     bx, SEG_A28F
        mov     es, bx
        cmp     ax, word ptr es:[si + 481eh]
        jl      br_cd687
        jg      br_cd669
        cmp     dx, word ptr es:[si + 481ch]
        jbe     br_cd687
br_cd669:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[si + 481eh]
        mov     dx, word ptr es:[si + 481ch]
        mov     bx, SEG_A28F
        mov     es, bx
        mov     word ptr es:[si + 481ah], ax
        mov     word ptr es:[si + 4818h], dx
br_cd687:
        pop     si
        pop     bp
        retf
far_cd68a:
        push    bp
        mov     bp, sp
        sub     sp, 0ch
        push    si
        mov     si, 2400h
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        cmp     ax, word ptr [bp + 0ch]
        jge     br_cd6a2
        jmp     near br_cd76a
br_cd6a2:
        jg      br_cd6ac
        cmp     dx, word ptr [bp + 0ah]
        ja      br_cd6ac
        jmp     near br_cd76a
br_cd6ac:
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 0
        jmp     near br_cd74c
br_cd6b9:
        mov     ax, si
        cwd
        mov     bx, word ptr [bp - 2]
        mov     cx, word ptr [bp - 4]
        add     cx, ax
        adc     bx, dx
        cmp     bx, word ptr [bp + 10h]
        jg      br_cd6dd
        jnz     br_cd6d2
        cmp     cx, word ptr [bp + 0eh]
        ja      br_cd6dd
br_cd6d2:
        mov     ax, si
        cwd
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        jmp     br_cd6ef
br_cd6dd:
        mov     ax, word ptr [bp + 10h]
        mov     dx, word ptr [bp + 0eh]
        sub     dx, word ptr [bp - 4]
        sbb     ax, word ptr [bp - 2]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
br_cd6ef:
        mov     word ptr [bp - 0ah], SEG_A28F
        mov     word ptr [bp - 0ch], 0
        push    1
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    word SEG_A28F
        push    word 0
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        push    0
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    word ptr [bp - 0ah]
        push    word ptr [bp - 0ch]
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        mov     ax, word ptr [bp - 6]
        mov     dx, word ptr [bp - 8]
        add     word ptr [bp + 6], dx
        adc     word ptr [bp + 8], ax
        add     word ptr [bp + 0ah], dx
        adc     word ptr [bp + 0ch], ax
        mov     ax, si
        cwd
        add     word ptr [bp - 4], ax
        adc     word ptr [bp - 2], dx
br_cd74c:
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        cmp     ax, word ptr [bp + 10h]
        jge     br_cd75a
        jmp     near br_cd6b9
br_cd75a:
        jz      br_cd75f
        jmp     br_cd834
br_cd75f:
        cmp     dx, word ptr [bp + 0eh]
        jnc     br_cd767
        jmp     near br_cd6b9
br_cd767:
        pop     si
        leave
        retf
br_cd76a:
        mov     ax, word ptr [bp + 10h]
        mov     dx, word ptr [bp + 0eh]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        jmp     near br_cd820
br_cd779:
        mov     ax, si
        cwd
        mov     bx, word ptr [bp - 2]
        mov     cx, word ptr [bp - 4]
        sub     cx, ax
        sbb     bx, dx
        or      bx, bx
        jl      br_cd79b
        jnz     br_cd790
        or      cx, cx
        jc      br_cd79b
br_cd790:
        mov     ax, si
        cwd
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        jmp     br_cd7a7
br_cd79b:
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
br_cd7a7:
        mov     word ptr [bp - 0ah], SEG_A28F
        mov     word ptr [bp - 0ch], 0
        push    1
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        add     dx, word ptr [bp + 0eh]
        adc     ax, word ptr [bp + 10h]
        sub     dx, word ptr [bp - 8]
        sbb     ax, word ptr [bp - 6]
        push    ax
        push    dx
        push    word SEG_A28F
        push    word 0
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        push    0
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        mov     ax, word ptr [bp + 0ch]
        mov     dx, word ptr [bp + 0ah]
        add     dx, word ptr [bp + 0eh]
        adc     ax, word ptr [bp + 10h]
        sub     dx, word ptr [bp - 8]
        sbb     ax, word ptr [bp - 6]
        push    ax
        push    dx
        push    word ptr [bp - 0ah]
        push    word ptr [bp - 0ch]
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        mov     ax, word ptr [bp - 6]
        mov     dx, word ptr [bp - 8]
        sub     word ptr [bp + 6], dx
        sbb     word ptr [bp + 8], ax
        sub     word ptr [bp + 0ah], dx
        sbb     word ptr [bp + 0ch], ax
        mov     ax, si
        cwd
        sub     word ptr [bp - 4], ax
        sbb     word ptr [bp - 2], dx
br_cd820:
        cmp     word ptr [bp - 2], 0
        jle     br_cd829
        jmp     near br_cd779
br_cd829:
        jnz     br_cd834
        cmp     word ptr [bp - 4], 0
        jbe     br_cd834
        jmp     near br_cd779
br_cd834:
        pop     si
        leave
        retf
fn_cd837:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        push    di
        mov     cx, word ptr [bp + 6]
        cmp     cx, 80h
        jnc     br_cd85e
        mov     ax, cx
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        cmp     byte ptr es:[bx + 4800h], 0
        jnz     br_cd863
br_cd85e:
        mov     ax, 1
        jmp     br_cd865
br_cd863:
        xor     ax, ax
br_cd865:
        mov     word ptr [bp - 2], ax
        cmp     word ptr [bp - 2], 0
        jz      br_cd87c
        les     di, dword ptr [bp + 8]
        mov     si, STR_7112
        mov     cx, 8
        rep movsw
        movsb
        jmp     br_cd8c9
br_cd87c:
        mov     ax, SEG_A28F
        push    ax
        mov     ax, cx
        mov     dx, 24h
        imul    dx
        add     ax, 4800h
        mov     dx, word ptr [bp + 0ah]
        mov     si, word ptr [bp + 8]
        push    ax
        push    dx
        mov     dx, 11h
        pop     ax
        pop     di
        pop     es
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
        jnc     br_cd8ba
        add     cx, dx
        xor     dx, dx
br_cd8ba:
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        mov     cx, dx
        xor     ax, ax
        rep stosb
        pop     ds
br_cd8c9:
        mov     ax, word ptr [bp - 2]
        pop     di
        pop     si
        leave
        retf
far_cd8d0:
        push    bp
        mov     bp, sp
        mov     bx, word ptr [bp + 6]
        mov     dx, 0ffffh
        cmp     bx, 23h
        jl      br_cd8f9
        cmp     bx, 62h
        jg      br_cd8f9
        mov     ax, bx
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        mov     al, byte ptr es:[bx - 30ah]
        mov     ah, 0
        mov     dx, ax
br_cd8f9:
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    dx
        push    cs
        call    fn_cd837
        add     sp, 6
        pop     bp
        retf
fn_cd909:
        push    bp
        mov     bp, sp
        sub     sp, 0eh
        push    si
        push    di
        mov     word ptr [bp - 2], 1
        jmp     near br_cd9d7
br_cd919:
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 0
        xor     si, si
        mov     cx, TBL_D65D
        mov     di, TBL_D667
br_cd92b:
        mov     bx, cx
        mov     ax, word ptr [bx + 2]
        mov     dx, word ptr [bx]
        cmp     ax, word ptr [di + 2]
        jnc     br_cd93a
        jmp     near br_cd9c2
br_cd93a:
        ja      br_cd943
        cmp     dx, word ptr [di]
        ja      br_cd943
        jmp     near br_cd9c2
br_cd943:
        mov     al, byte ptr [si + TBL_D65B]
        mov     byte ptr [bp - 5], al
        mov     al, byte ptr [si + TBL_D65C]
        mov     byte ptr [bp - 6], al
        mov     bx, cx
        mov     ax, word ptr [bx + 2]
        mov     dx, word ptr [bx]
        mov     word ptr [bp - 8], ax
        mov     word ptr [bp - 0ah], dx
        mov     ax, word ptr [si + TBL_D663]
        mov     dx, word ptr [si + TBL_D661]
        mov     word ptr [bp - 0ch], ax
        mov     word ptr [bp - 0eh], dx
        mov     al, byte ptr [si + TBL_D665]
        mov     byte ptr [si + TBL_D65B], al
        mov     al, byte ptr [si + TBL_D666]
        mov     byte ptr [si + TBL_D65C], al
        mov     ax, word ptr [di + 2]
        mov     dx, word ptr [di]
        mov     word ptr [bx + 2], ax
        mov     word ptr [bx], dx
        mov     ax, word ptr [si + TBL_D66D]
        mov     dx, word ptr [si + TBL_D66B]
        mov     word ptr [si + TBL_D663], ax
        mov     word ptr [si + TBL_D661], dx
        mov     al, byte ptr [bp - 5]
        mov     byte ptr [si + TBL_D665], al
        mov     al, byte ptr [bp - 6]
        mov     byte ptr [si + TBL_D666], al
        mov     ax, word ptr [bp - 8]
        mov     dx, word ptr [bp - 0ah]
        mov     word ptr [di + 2], ax
        mov     word ptr [di], dx
        mov     ax, word ptr [bp - 0ch]
        mov     dx, word ptr [bp - 0eh]
        mov     word ptr [si + TBL_D66D], ax
        mov     word ptr [si + TBL_D66B], dx
        mov     word ptr [bp - 2], 1
br_cd9c2:
        add     si, 0ah
        add     cx, 0ah
        add     di, 0ah
        inc     word ptr [bp - 4]
        cmp     si, 0baeh
        jz      br_cd9d7
        jmp     near br_cd92b
br_cd9d7:
        cmp     word ptr [bp - 2], 0
        jz      br_cd9e0
        jmp     near br_cd919
br_cd9e0:
        pop     di
        pop     si
        leave
        retf
fn_cd9e4:
        push    bp
        mov     bp, sp
        push    si
        push    di
        mov     di, word ptr [bp + 0eh]
        xor     cx, cx
        xor     si, si
        jmp     br_cda4a
loop_cd9f2:
        cmp     byte ptr [si + TBL_D65B], 0ffh
        jnz     br_cda46
        mov     ax, word ptr [si + TBL_D65F]
        mov     dx, word ptr [si + TBL_D65D]
        add     dx, word ptr [si + TBL_D661]
        adc     ax, word ptr [si + TBL_D663]
        cmp     ax, word ptr [bp + 8]
        jnz     br_cda46
        cmp     dx, word ptr [bp + 6]
        jnz     br_cda46
        mov     ax, di
        mov     dx, 0ah
        imul    dx
        mov     bx, ax
        mov     ax, word ptr [bx + TBL_D663]
        mov     dx, word ptr [bx + TBL_D661]
        push    ax
        mov     ax, cx
        mov     bx, 0ah
        push    dx
        imul    bx
        mov     bx, ax
        pop     ax
        add     word ptr [bx + TBL_D661], ax
        pop     ax
        adc     word ptr [bx + TBL_D663], ax
        push    di
        nop
        push    cs
        call    fn_cdab4
        add     sp, 2
        pop     di
        pop     si
        pop     bp
        retf
br_cda46:
        add     si, 0ah
        inc     cx
br_cda4a:
        cmp     cx, di
        jnz     loop_cd9f2
        inc     cx
        mov     ax, cx
        mov     dx, 0ah
        imul    dx
        mov     si, ax
        jmp     br_cdaaa
loop_cda5a:
        cmp     byte ptr [si + TBL_D65B], 0ffh
        jnz     br_cdaa6
        mov     ax, word ptr [si + TBL_D65F]
        mov     dx, word ptr [si + TBL_D65D]
        cmp     ax, word ptr [bp + 0ch]
        jnz     br_cdaa6
        cmp     dx, word ptr [bp + 0ah]
        jnz     br_cdaa6
        mov     ax, cx
        mov     dx, 0ah
        imul    dx
        mov     bx, ax
        mov     ax, word ptr [bx + TBL_D663]
        mov     dx, word ptr [bx + TBL_D661]
        push    ax
        mov     ax, di
        mov     bx, 0ah
        push    dx
        imul    bx
        mov     bx, ax
        pop     ax
        add     word ptr [bx + TBL_D661], ax
        pop     ax
        adc     word ptr [bx + TBL_D663], ax
        push    cx
        nop
        push    cs
        call    fn_cdab4
        add     sp, 2
        pop     di
        pop     si
        pop     bp
        retf
br_cdaa6:
        add     si, 0ah
        inc     cx
br_cdaaa:
        cmp     si, 0bb8h
        jnz     loop_cda5a
        pop     di
        pop     si
        pop     bp
        retf
fn_cdab4:
        push    bp
        mov     bp, sp
        push    si
        mov     cx, word ptr [bp + 6]
        mov     ax, cx
        mov     dx, 0ah
        imul    dx
        mov     si, ax
        jmp     br_cdafa
loop_cdac6:
        mov     al, byte ptr [si + TBL_D665]
        mov     byte ptr [si + TBL_D65B], al
        mov     al, byte ptr [si + TBL_D666]
        mov     byte ptr [si + TBL_D65C], al
        mov     ax, word ptr [si + TBL_D669]
        mov     dx, word ptr [si + TBL_D667]
        mov     word ptr [si + TBL_D65F], ax
        mov     word ptr [si + TBL_D65D], dx
        mov     ax, word ptr [si + TBL_D66D]
        mov     dx, word ptr [si + TBL_D66B]
        mov     word ptr [si + TBL_D663], ax
        mov     word ptr [si + TBL_D661], dx
        add     si, 0ah
        inc     cx
br_cdafa:
        cmp     byte ptr [si + TBL_D665], 0
        jnz     loop_cdac6
        mov     ax, cx
        mov     dx, 0ah
        imul    dx
        mov     si, ax
        mov     bx, ax
        mov     byte ptr [bx + TBL_D65B], 0
        mov     byte ptr [si + TBL_D65C], 0ffh
        mov     word ptr [si + TBL_D65F], 0ffffh
        mov     word ptr [si + TBL_D65D], 0ffffh
        mov     word ptr [si + TBL_D663], 0
        mov     word ptr [si + TBL_D661], 0
        pop     si
        pop     bp
        retf
far_cdb31:
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
        mov     ax, word ptr [bp + 0ah]
        sub     ax, cx
        mov     dx, ax
        or      dx, dx
        jle     br_cdb8f
        mov     di, word ptr [bp + 6]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        xor     ax, ax
        sub     di, cx
        repne scasb
        jz      br_cdb6b
        mov     di, 1
        xor     ax, ax
        mov     es, ax
br_cdb6b:
        dec     di
        mov     ax, es
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], di
        mov     es, word ptr [bp - 2]
        mov     ax, 20h
        mov     cx, dx
        mov     ah, al
        shr     cx, 1
        rep stosw
        adc     cx, cx
        rep stosb
        mov     bx, word ptr [bp - 4]
        add     bx, dx
        mov     byte ptr es:[bx], 0
br_cdb8f:
        mov     dx, word ptr [bp + 8]
        mov     ax, word ptr [bp + 6]
        pop     di
        leave
        retf
        if      FW_VERSION >= 312
        phase   8
        elseif  FW_VERSION = 311
        phase   6
        else
        db      0ffh
        phase   0
        endif
far_cdb98:
        push    bp
        mov     bp, sp
        push    ds
        push    si
        push    di
        lds     di, dword ptr [bp + 6]
        xor     ax, ax
        mov     al, byte ptr [di]
        mov     si, ax
        mov     bx, word ptr [di + 1]
        mov     dx, word ptr [di + 3]
        xor     ax, ax
        mov     ah, bl
        shl     ah, 4
        shr     dl, 1
        rcr     bx, 1
        shr     dl, 1
        rcr     bx, 1
        shr     dl, 1
        rcr     bx, 1
        shr     dl, 1
        rcr     bx, 1
        push    ax
        push    dx
        mov     dx, 60h
        mov     ax, si
        out     dx, ax
        pop     ax
        or      ax, 100h
        mov     dx, 66h
        out     dx, ax
        mov     ax, bx
        mov     dx, 64h
        out     dx, ax
        pop     ax
        mov     dx, 62h
        out     dx, ax
        mov     dx, 60h
        mov     ax, 100h
        add     ax, si
        out     dx, ax
        mov     ax, word ptr [di + 5]
        mov     dx, 62h
        out     dx, ax
        mov     dx, 60h
        mov     ax, 300h
        add     ax, si
        out     dx, ax
        mov     ax, 0
        mov     dx, 62h
        out     dx, ax
        mov     dx, 64h
        out     dx, ax
        mov     dx, 60h
        mov     ax, 400h
        add     ax, si
        out     dx, ax
        mov     ax, word ptr [di + 9]
        mov     dx, 62h
        out     dx, ax
        mov     ax, word ptr [di + 7]
        or      ax, 8000h
        mov     dx, 64h
        out     dx, ax
        mov     dx, 60h
        mov     ax, 500h
        add     ax, si
        out     dx, ax
        mov     ax, word ptr [di + 0bh]
        mov     dx, 62h
        out     dx, ax
        mov     ax, word ptr [di + 0dh]
        mov     dx, 64h
        out     dx, ax
        mov     dx, 60h
        mov     ax, 600h
        add     ax, si
        out     dx, ax
        mov     ax, word ptr [di + 11h]
        mov     dx, 62h
        out     dx, ax
        mov     ax, word ptr [di + 0fh]
        mov     dx, 64h
        out     dx, ax
        mov     dx, 60h
        mov     ax, 700h
        add     ax, si
        out     dx, ax
        mov     al, byte ptr [di + 15h]
        mov     ah, byte ptr [di + 16h]
        mov     dx, 62h
        out     dx, ax
        mov     al, byte ptr [di + 13h]
        mov     ah, byte ptr [di + 14h]
        mov     dx, 64h
        out     dx, ax
        pop     di
        pop     si
        pop     ds
        pop     bp
        retf
far_cdc6d:
        in      ax, 68h
        or      ax, 100h
        and     ax, 0ff7fh
        out     68h, ax
        retf
far_cdc78:
        push    bp
        mov     bp, sp
        mov     dx, 1
        callf   SEG_FB80:far_fb88f
        mov     bx, word ptr [bp + 6]
        mov     cx, 0bh
loop_cdc89:
        mov     dx, 60h
        mov     bh, 0bh
        sub     bh, cl
        mov     ax, bx
        out     dx, ax
        or      bh, bh
        jnz     br_cdc9e
        mov     ax, 100h
        mov     dx, 66h
        out     dx, ax
br_cdc9e:
        sub     ax, ax
        mov     dx, 6ch
        out     dx, ax
        loop    loop_cdc89
        mov     dx, 1
        callf   SEG_FB80:far_fb8cd
        pop     bp
        retf
far_cdcb0:
        mov     dx, 1
        callf   SEG_FB80:far_fb88f
        retf
far_cdcb9:
        mov     dx, 1
        callf   SEG_FB80:far_fb8cd
        retf
        if      FW_VERSION >= 312
        phase   2
        elseif  FW_VERSION = 311
        phase   0
        else
        phase   0ah
        endif
far_cdcc2:
        mov     cx, 20h
loop_cdcc5:
        mov     ax, 100h
        add     ax, cx
        dec     ax
        mov     dx, 60h
        out     dx, ax
        mov     ax, 0
        mov     dx, 62h
        out     dx, ax
        mov     ax, 0ffffh
        mov     dx, 64h
        out     dx, ax
        mov     ax, 0fh
        mov     dx, 66h
        out     dx, ax
        cmp     bx, 1
        jz      br_cdd01
        mov     ax, 0a00h
        add     ax, cx
        dec     ax
        mov     dx, 60h
        out     dx, ax
        mov     ax, 3
        mov     dx, 62h
        out     dx, ax
        mov     ax, 0
        mov     dx, 64h
        out     dx, ax
br_cdd01:
        loop    loop_cdcc5
        retf
far_cdd04:
        mov     bx, 20h
loop_cdd07:
        mov     cx, 8
loop_cdd0a:
        mov     ax, 700h
        add     ax, bx
        dec     ax
        mov     dx, 60h
        out     dx, ax
        mov     ax, 0
        mov     dx, 62h
        out     dx, ax
        mov     ax, cx
        dec     ax
        mov     dx, 8000h
        and     ax, dx
        mov     dx, 64h
        out     dx, ax
        loop    loop_cdd0a
        cmp     bx, 1
        jz      br_cdd4b
        mov     ax, 700h
        add     ax, bx
        dec     ax
        mov     dx, 60h
        out     dx, ax
        mov     ax, 0
        mov     dx, 62h
        out     dx, ax
        mov     ax, 0fh
        mov     dx, 8000h
        and     ax, dx
        mov     dx, 64h
        out     dx, ax
br_cdd4b:
        dec     bx
        cmp     bx, 0
        jnz     loop_cdd07
        retf
        if      FW_VERSION >= 312
        phase   2
        elseif  FW_VERSION = 311
        phase   0
        else
        phase   0ah
        endif
far_cdd52:
        cmp     bx, 40h
        jnc     br_cdd74
        mov     cx, word ptr [bx + TBL_E2E6]
        shr     bx, 1
        mov     dx, 60h
        mov     ax, 400h
        add     ax, bx
        out     dx, ax
        mov     ax, cx
        mov     dx, 62h
        out     dx, ax
        mov     ax, 8000h
        mov     dx, 64h
        out     dx, ax
        retf
br_cdd74:
        cmp     bx, 80h
        jnc     br_cdd87
        sub     bx, 40h
        shr     bx, 1
        push    bx
        callf   SEG_CDE1:far_cde12
        pop     bx
        retf
br_cdd87:
        sub     bx, 80h
        shr     bx, 1
        mov     dx, 60h
        mov     ax, 600h
        add     ax, bx
        out     dx, ax
        shl     bx, 1
        mov     ax, word ptr [bx + TBL_E366]
        mov     dx, 62h
        out     dx, ax
        mov     ax, word ptr [bx + TBL_E326]
        mov     dx, 64h
        out     dx, ax
        retf
        db      0ffh
        if      FW_VERSION >= 312
        phase   0ah
        elseif  FW_VERSION = 311
        phase   8
        else
        phase   2
        endif
far_cddaa:
        cmp     word ptr [W_E21F], 0
        jg      br_cddb2
        retf
br_cddb2:
        dec     word ptr [W_E21F]
        jz      br_cddb9
        retf
br_cddb9:
        mov     dl, 1
        callf   0fb00h:far_fb38c
        retf
far_cddc1:
        push    bp
        mov     bp, sp
        pushf
        mov     bx, word ptr [bp + 6]
        shl     bx, 1
        mov     cx, word ptr [bp + 8]
        cli
        cmp     word ptr [W_E221], 0
        jnz     br_cdde4
        mov     word ptr [W_E221], cx
        mov     word ptr [W_E21F], cx
        mov     word ptr [bx + TBL_E223], cx
        jmp     br_cde0e
        db      090h
br_cdde4:
        cmp     cx, word ptr [W_E21F]
        jl      br_cddf9
        add     cx, word ptr [W_E221]
        sub     cx, word ptr [W_E21F]
        mov     word ptr [bx + TBL_E223], cx
        jmp     br_cde0e
        db      090h
br_cddf9:
        mov     ax, cx
        sub     ax, word ptr [W_E21F]
        add     word ptr [W_E221], ax
        mov     word ptr [W_E21F], cx
        mov     ax, word ptr [W_E221]
        mov     word ptr [bx + TBL_E223], ax
br_cde0e:
        popf
        pop     bp
        retf
        db      0ffh
        if      FW_VERSION >= 312
        phase   2
        elseif  FW_VERSION = 311
        phase   0
        else
        phase   0ah
        endif
far_cde12:
        push    bp
        mov     bp, sp
        mov     dx, 1
        callf   SEG_FB80:far_fb88f
        mov     dx, 60h
        mov     ax, 400h
        add     ax, word ptr [bp + 6]
        out     dx, ax
        mov     ax, 0ff00h
        mov     dx, 62h
        out     dx, ax
        mov     ax, 8000h
        mov     dx, 64h
        out     dx, ax
        mov     dx, 60h
        mov     ax, 300h
        add     ax, word ptr [bp + 6]
        out     dx, ax
        mov     dx, 62h
        sub     ax, ax
        out     dx, ax
        mov     dx, 64h
        in      ax, dx
        and     ax, 3fc0h
        out     dx, ax
        mov     cx, ax
        mov     dx, 62h
        sub     ax, ax
        out     dx, ax
        mov     dx, 64h
        mov     ax, cx
        out     dx, ax
        mov     dx, 60h
        mov     ax, 600h
        add     ax, word ptr [bp + 6]
        out     dx, ax
        mov     ax, 0
        mov     dx, 62h
        out     dx, ax
        mov     ax, 7ff0h
        mov     dx, 64h
        out     dx, ax
        mov     bx, word ptr [bp + 6]
        mov     byte ptr [bx + TBL_E3AC], 0ffh
        shl     bx, 1
        mov     word ptr [bx + TBL_E223], 0
        mov     word ptr [bx + TBL_E263], 0
        mov     word ptr [bx + TBL_E2A3], 0
        mov     dx, 1
        callf   SEG_FB80:far_fb8cd
        pop     bp
        retf
        if      FW_VERSION >= 312
        db      0ffh, 04dh, 000h, 000h, 0b1h, 009h, 04dh, 000h, 001h, 0e6h, 009h, 04dh, 000h, 006h, 032h, 00ah
        db      04dh, 000h, 007h, 0a7h, 00ah, 04dh, 000h, 008h, 0dch, 00ah, 04dh, 000h, 009h, 00eh, 00bh, 04dh
        db      000h, 00ah, 041h, 00bh, 04dh, 000h, 00bh, 0b1h, 00bh, 04dh, 000h, 00ch, 0edh, 00bh, 04dh, 000h
        db      00dh, 01ch, 00ch, 04dh, 000h, 00eh, 06ah, 00ch, 04dh, 000h, 00fh, 0b0h, 00ch, 04dh, 000h, 010h
        db      0eeh, 00ch, 04dh, 000h, 011h, 03fh, 00dh, 04dh, 000h, 012h, 06eh, 00dh, 02fh, 000h, 000h, 0c1h
        db      00dh, 02fh, 000h, 001h, 0c1h, 00dh, 02fh, 000h, 002h, 0c1h, 00dh, 046h, 000h, 000h, 04eh, 00eh
        db      04ah, 000h, 000h, 04eh, 00eh, 04ch, 000h, 000h, 04eh, 00eh, 055h, 000h, 000h, 04eh, 00eh, 073h
        db      000h, 000h, 04eh, 00eh, 046h, 009h, 000h, 04eh, 00eh, 046h, 001h, 000h, 05ah, 00eh, 046h, 001h
        db      001h, 06eh, 00eh, 046h, 001h, 002h, 0a3h, 00eh, 046h, 001h, 003h, 05bh, 00fh, 046h, 001h, 004h
        db      05bh, 00fh, 046h, 002h, 000h, 0a4h, 00fh, 046h, 003h, 000h, 0dbh, 00fh, 046h, 004h, 000h, 012h
        db      010h, 046h, 004h, 001h, 046h, 010h, 046h, 004h, 002h, 07bh, 010h, 046h, 004h, 003h, 0abh, 010h
        db      046h, 005h, 002h, 0abh, 010h, 046h, 005h, 000h, 000h, 011h, 046h, 005h, 001h, 041h, 011h, 046h
        db      006h, 000h, 072h, 011h, 046h, 007h, 000h, 0d2h, 011h, 046h, 047h, 000h, 025h, 012h, 046h, 048h
        db      000h, 04bh, 012h, 046h, 049h, 000h, 075h, 012h, 046h, 064h, 000h, 0a7h, 012h, 046h, 065h, 000h
        db      0ceh, 012h, 046h, 066h, 000h, 0dfh, 012h, 046h, 066h, 001h, 006h, 013h, 046h, 066h, 002h, 022h
        db      013h, 046h, 067h, 000h, 079h, 013h, 046h, 068h, 000h, 091h, 013h, 046h, 069h, 000h, 0a9h, 013h
        db      046h, 06ah, 000h, 0bbh, 013h, 046h, 06bh, 000h, 0e4h, 013h, 046h, 06ch, 000h, 0e4h, 013h, 046h
        db      06ch, 001h, 0e4h, 013h, 046h, 06dh, 000h, 044h, 014h, 046h, 06eh, 000h, 055h, 014h, 046h, 06fh
        db      000h, 071h, 014h, 046h, 070h, 000h, 091h, 014h, 046h, 082h, 000h, 0a1h, 014h, 046h, 082h, 001h
        db      0f1h, 014h, 046h, 082h, 002h, 068h, 015h, 046h, 008h, 000h, 0f7h, 015h, 046h, 05bh, 000h, 07eh
        db      016h, 046h, 05dh, 000h, 0b6h, 016h, 046h, 05eh, 000h, 0d4h, 016h, 046h, 05fh, 000h, 030h, 017h
        db      046h, 060h, 000h, 080h, 017h, 046h, 061h, 000h, 0c8h, 017h, 046h, 062h, 000h, 0ebh, 017h, 046h
        db      062h, 001h, 053h, 018h, 04bh, 000h, 000h, 0d9h, 018h, 04dh, 000h, 003h, 0d9h, 018h, 04fh, 003h
        db      002h, 0d9h, 018h, 04bh, 000h, 001h, 013h, 019h, 04dh, 000h, 004h, 013h, 019h, 04fh, 003h, 003h
        db      013h, 019h, 04bh, 000h, 002h, 065h, 019h, 04dh, 000h, 002h, 065h, 019h, 04fh, 003h, 001h, 065h
        db      019h, 045h, 001h, 006h, 065h, 019h, 04bh, 000h, 003h, 0d8h, 019h, 04bh, 002h, 004h, 0d8h, 019h
        db      04bh, 00bh, 007h, 0d8h, 019h, 04bh, 00ch, 007h, 0d8h, 019h, 04bh, 000h, 004h, 08dh, 01ah, 04bh
        db      00ah, 000h, 032h, 01bh, 04bh, 00bh, 000h, 032h, 01bh, 04bh, 00ch, 000h, 032h, 01bh, 04bh, 00dh
        db      000h, 032h, 01bh, 04bh, 00eh, 000h, 032h, 01bh, 04bh, 00fh, 000h, 032h, 01bh, 04bh, 00bh, 002h
        db      06bh, 01bh, 04bh, 00bh, 003h, 06bh, 01bh, 04bh, 00bh, 004h, 06bh, 01bh, 04bh, 00bh, 005h, 06bh
        db      01bh, 04bh, 00bh, 006h, 06bh, 01bh, 04bh, 00ch, 002h, 06bh, 01bh, 04bh, 00ch, 003h, 06bh, 01bh
        db      04bh, 00ch, 004h, 06bh, 01bh, 04bh, 00ch, 005h, 06bh, 01bh, 04bh, 00ch, 006h, 06bh, 01bh, 04bh
        db      00ah, 002h, 0fah, 01bh, 04bh, 00dh, 002h, 0fah, 01bh, 04bh, 00eh, 002h, 0fah, 01bh, 04bh, 00ah
        db      004h, 031h, 01ch, 04bh, 00bh, 009h, 031h, 01ch, 04bh, 00ah, 005h, 058h, 01ch, 04bh, 00eh, 004h
        db      0b7h, 01ch, 04bh, 00ah, 001h, 0f5h, 01ch, 04bh, 00bh, 001h, 0f5h, 01ch, 04bh, 00ch, 001h, 0f5h
        db      01ch, 04bh, 00dh, 001h, 0f5h, 01ch, 04bh, 00eh, 001h, 0f5h, 01ch, 04bh, 00ah, 003h, 025h, 01dh
        db      04bh, 00bh, 007h, 025h, 01dh, 04bh, 00ch, 007h, 025h, 01dh, 04bh, 00dh, 003h, 025h, 01dh, 04bh
        db      00eh, 003h, 025h, 01dh, 04bh, 002h, 000h, 051h, 01dh, 04bh, 002h, 001h, 051h, 01dh, 04bh, 002h
        db      002h, 051h, 01dh, 04bh, 002h, 003h, 051h, 01dh, 04bh, 003h, 000h, 0b9h, 01dh, 04bh, 003h, 001h
        db      0e4h, 01dh, 04bh, 003h, 002h, 016h, 01eh, 04bh, 003h, 003h, 061h, 01eh, 04bh, 003h, 004h, 061h
        db      01eh, 047h, 000h, 000h, 099h, 01eh, 047h, 000h, 001h, 016h, 01fh, 047h, 000h, 002h, 03dh, 01fh
        db      047h, 000h, 003h, 07fh, 01fh, 047h, 000h, 004h, 0a5h, 01fh, 047h, 000h, 005h, 0a5h, 01fh, 047h
        db      000h, 006h, 0a5h, 01fh, 047h, 000h, 007h, 0a5h, 01fh, 047h, 000h, 008h, 0a5h, 01fh, 047h, 000h
        db      009h, 037h, 020h, 047h, 000h, 00ah, 0bch, 020h, 047h, 000h, 00bh, 0dbh, 020h, 047h, 000h, 00ch
        db      001h, 021h, 047h, 001h, 000h, 040h, 021h, 047h, 001h, 001h, 060h, 021h, 047h, 002h, 000h, 07eh
        db      021h, 047h, 003h, 000h, 088h, 021h, 047h, 004h, 000h, 09ch, 021h, 047h, 004h, 001h, 09ch, 021h
        db      055h, 001h, 000h, 0f0h, 021h, 055h, 00bh, 000h, 058h, 022h, 055h, 00bh, 001h, 058h, 022h, 055h
        db      00bh, 002h, 058h, 022h, 055h, 002h, 000h, 07fh, 022h, 055h, 002h, 001h, 07fh, 022h, 055h, 002h
        db      002h, 07fh, 022h, 055h, 003h, 000h, 0bfh, 022h, 055h, 003h, 001h, 0ddh, 022h, 055h, 003h, 002h
        db      0fah, 022h, 055h, 003h, 003h, 0fah, 022h, 055h, 003h, 004h, 022h, 023h, 055h, 004h, 000h, 040h
        db      023h, 055h, 004h, 001h, 055h, 023h, 055h, 004h, 002h, 065h, 023h, 055h, 005h, 000h, 078h, 023h
        db      055h, 005h, 001h, 0c7h, 023h, 055h, 005h, 002h, 0dbh, 023h, 055h, 005h, 003h, 0f4h, 023h, 055h
        db      005h, 004h, 004h, 024h, 055h, 005h, 005h, 019h, 024h, 055h, 006h, 000h, 03eh, 024h, 055h, 03ch
        db      000h, 03eh, 024h, 055h, 006h, 001h, 091h, 024h, 055h, 03ch, 001h, 091h, 024h, 055h, 006h, 002h
        db      0b5h, 024h, 055h, 03ch, 002h, 0b5h, 024h, 055h, 006h, 003h, 0e0h, 024h, 055h, 03ch, 003h, 0e0h
        db      024h, 055h, 03ch, 004h, 007h, 025h, 055h, 03ch, 005h, 007h, 025h, 055h, 006h, 004h, 033h, 025h
        db      055h, 03ch, 006h, 033h, 025h, 055h, 006h, 005h, 042h, 025h, 055h, 03ch, 007h, 042h, 025h, 055h
        db      006h, 006h, 053h, 025h, 055h, 03ch, 008h, 053h, 025h, 055h, 006h, 007h, 0a7h, 025h, 055h, 03ch
        db      009h, 0a7h, 025h, 055h, 006h, 008h, 0dch, 025h, 055h, 03ch, 00ah, 0dch, 025h, 055h, 007h, 000h
        db      00dh, 026h, 055h, 007h, 001h, 04bh, 026h, 055h, 008h, 000h, 06fh, 026h, 055h, 008h, 001h, 0b7h
        db      026h, 055h, 008h, 002h, 0eah, 026h, 055h, 008h, 003h, 0fah, 026h, 055h, 008h, 004h, 04dh, 027h
        db      055h, 008h, 005h, 068h, 027h, 055h, 008h, 006h, 092h, 027h, 055h, 008h, 007h, 092h, 027h, 055h
        db      009h, 000h, 0beh, 027h, 055h, 05bh, 000h, 0d4h, 027h, 055h, 05bh, 001h, 015h, 028h, 055h, 05bh
        db      002h, 03eh, 028h, 055h, 05bh, 003h, 04ch, 028h, 055h, 05bh, 004h, 096h, 028h, 055h, 05bh, 005h
        db      0b5h, 028h, 055h, 05bh, 006h, 0f0h, 028h, 055h, 05bh, 007h, 018h, 029h, 055h, 05bh, 008h, 018h
        db      029h, 055h, 05ch, 000h, 044h, 029h, 055h, 05ch, 001h, 080h, 029h, 055h, 05ch, 002h, 0a3h, 029h
        db      055h, 05ch, 003h, 0c1h, 029h, 055h, 05ch, 004h, 0fbh, 029h, 055h, 05ch, 005h, 0fbh, 029h, 055h
        db      05dh, 000h, 049h, 02ah, 055h, 05dh, 001h, 096h, 02ah, 055h, 05dh, 002h, 0b7h, 02ah, 055h, 05dh
        db      003h, 0d6h, 02ah, 055h, 05dh, 004h, 00fh, 02bh, 055h, 05dh, 005h, 041h, 02bh, 053h, 000h, 000h
        db      064h, 02bh, 053h, 000h, 001h, 064h, 02bh, 053h, 000h, 002h, 064h, 02bh, 053h, 000h, 003h, 064h
        db      02bh, 053h, 000h, 004h, 064h, 02bh, 053h, 001h, 000h, 0dbh, 02bh, 053h, 001h, 001h, 016h, 02ch
        db      053h, 001h, 002h, 095h, 02ch, 053h, 001h, 003h, 0fdh, 02ch, 053h, 001h, 004h, 069h, 02dh, 053h
        db      001h, 005h, 0f8h, 02dh, 053h, 001h, 006h, 056h, 02eh, 06ch, 000h, 000h, 09ch, 02eh, 06ch, 000h
        db      001h, 09ch, 02eh, 073h, 001h, 000h, 01ch, 02fh, 073h, 001h, 001h, 06dh, 02fh, 073h, 001h, 002h
        db      084h, 02fh, 073h, 002h, 000h, 0cah, 02fh, 073h, 002h, 001h, 0edh, 02fh, 073h, 002h, 002h, 042h
        db      030h, 073h, 002h, 003h, 0c0h, 030h, 073h, 002h, 004h, 015h, 031h, 073h, 003h, 000h, 099h, 031h
        db      073h, 003h, 001h, 0d4h, 031h, 073h, 003h, 002h, 01dh, 032h, 073h, 003h, 003h, 051h, 032h, 073h
        db      003h, 004h, 051h, 032h, 073h, 003h, 005h, 0bah, 032h, 073h, 003h, 006h, 032h, 033h, 073h, 003h
        db      007h, 092h, 033h, 04fh, 000h, 000h, 0c2h, 033h, 04fh, 000h, 001h, 0d9h, 033h, 04fh, 000h, 002h
        db      0feh, 033h, 04fh, 000h, 003h, 034h, 034h, 04fh, 000h, 004h, 07eh, 034h, 04fh, 000h, 005h, 0a1h
        db      034h, 04fh, 000h, 006h, 0a1h, 034h, 04fh, 001h, 000h, 0beh, 034h, 04fh, 002h, 000h, 01dh, 035h
        db      04fh, 002h, 001h, 0b6h, 035h, 04fh, 003h, 000h, 0b6h, 035h, 04fh, 002h, 002h, 0e6h, 035h, 04fh
        db      002h, 003h, 0e6h, 035h, 04fh, 002h, 004h, 0fah, 035h, 041h, 000h, 000h, 043h, 036h, 041h, 000h
        db      001h, 043h, 036h, 041h, 000h, 002h, 043h, 036h, 074h, 000h, 000h, 0e2h, 036h, 074h, 000h, 001h
        db      02dh, 037h, 074h, 000h, 002h, 076h, 037h, 074h, 000h, 003h, 076h, 037h, 042h, 000h, 000h, 0c1h
        db      037h, 042h, 000h, 001h, 0c1h, 037h, 042h, 000h, 002h, 003h, 038h, 045h, 000h, 000h, 011h, 038h
        db      045h, 000h, 001h, 01eh, 038h, 045h, 000h, 002h, 048h, 038h, 045h, 000h, 003h, 068h, 038h, 045h
        db      000h, 004h, 099h, 038h, 045h, 000h, 005h, 0e8h, 038h, 045h, 000h, 006h, 036h, 039h, 045h, 000h
        db      007h, 036h, 039h, 045h, 001h, 000h, 06dh, 039h, 045h, 001h, 001h, 08eh, 039h, 045h, 001h, 002h
        db      0e7h, 039h, 045h, 001h, 003h, 0f7h, 039h, 045h, 001h, 004h, 0f7h, 039h, 045h, 001h, 005h, 007h
        db      03ah, 045h, 001h, 007h, 052h, 03ah, 045h, 001h, 008h, 060h, 03ah, 045h, 001h, 009h, 07ch, 03ah
        db      045h, 001h, 00ah, 08fh, 03ah, 045h, 001h, 00bh, 0b3h, 03ah, 045h, 001h, 00ch, 0dah, 03ah, 045h
        db      001h, 00dh, 0dah, 03ah, 045h, 001h, 00eh, 0fch, 03ah, 045h, 001h, 00fh, 0fch, 03ah, 045h, 002h
        db      000h, 019h, 03bh, 052h, 000h, 000h, 031h, 03bh, 052h, 000h, 001h, 09fh, 03bh, 052h, 000h, 002h
        db      025h, 03ch, 052h, 000h, 003h, 025h, 03ch, 052h, 000h, 004h, 09ch, 03ch, 052h, 000h, 005h, 0c8h
        db      03ch, 052h, 000h, 006h, 0e8h, 03ch, 052h, 000h, 007h, 00ch, 03dh, 052h, 000h, 008h, 00ch, 03dh
        db      04ah, 001h, 000h, 047h, 03dh, 04ah, 002h, 000h, 0a2h, 03dh, 04ah, 003h, 000h, 038h, 03eh, 04ah
        db      003h, 001h, 0b2h, 03eh, 04ah, 003h, 002h, 0c3h, 03eh, 04ah, 003h, 003h, 0e0h, 03eh, 04ah, 003h
        db      004h, 0f9h, 03eh, 04ah, 003h, 005h, 063h, 03fh, 04ah, 01fh, 000h, 0f0h, 03fh, 04ah, 01fh, 001h
        db      0f0h, 03fh, 04ah, 004h, 000h, 044h, 040h, 04ah, 004h, 001h, 044h, 040h, 04ah, 004h, 002h, 044h
        db      040h, 04ah, 004h, 003h, 0a1h, 040h, 04ah, 005h, 000h, 0dbh, 040h, 04ah, 005h, 001h, 0eah, 040h
        db      04ah, 005h, 002h, 0fbh, 040h, 04ah, 005h, 003h, 017h, 041h, 04ah, 005h, 004h, 05eh, 041h, 04ah
        db      005h, 005h, 06dh, 041h, 04ah, 005h, 006h, 07eh, 041h, 04ah, 005h, 007h, 09ah, 041h, 04ah, 005h
        db      008h, 0e1h, 041h, 04ah, 005h, 009h, 0f0h, 041h, 04ah, 005h, 00ah, 001h, 042h, 04ah, 005h, 00bh
        db      01dh, 042h, 04ch, 001h, 000h, 064h, 042h, 04ch, 001h, 001h, 08bh, 042h, 04ch, 001h, 002h, 0b6h
        db      042h, 04ch, 001h, 003h, 006h, 043h, 04ch, 001h, 004h, 01ch, 043h, 04ch, 001h, 005h, 080h, 043h
        db      04ch, 001h, 006h, 0e5h, 043h, 04ch, 001h, 007h, 04eh, 044h, 04ch, 001h, 008h, 095h, 044h, 04ch
        db      002h, 000h, 0dbh, 044h, 04ch, 003h, 000h, 0dbh, 044h, 069h, 000h, 000h, 0dbh, 044h, 04ch, 002h
        db      001h, 0feh, 044h, 04ch, 003h, 001h, 0feh, 044h, 069h, 000h, 001h, 0feh, 044h, 04ch, 002h, 002h
        db      053h, 045h, 04ch, 002h, 003h, 07dh, 045h, 04ch, 002h, 004h, 0ech, 045h, 04ch, 002h, 005h, 035h
        db      046h, 04ch, 002h, 006h, 05eh, 046h, 04ch, 002h, 007h, 0ddh, 046h, 04ch, 002h, 008h, 06ah, 047h
        db      04ch, 002h, 009h, 096h, 047h, 04ch, 002h, 00ah, 0ceh, 047h, 04ch, 002h, 00bh, 0ceh, 047h, 04ch
        db      003h, 002h, 013h, 048h, 04ch, 003h, 003h, 058h, 048h, 04ch, 003h, 004h, 0b3h, 048h, 04ch, 003h
        db      005h, 0e5h, 048h, 04ch, 003h, 006h, 00bh, 049h, 04ch, 003h, 007h, 030h, 049h, 04ch, 004h, 000h
        db      "WIL)", 0
        db      "mIL)"
        elseif  FW_VERSION = 311
        db      0ffh, 04dh, 000h, 000h, 0b4h, 009h, 04dh, 000h, 001h, 00ah, 00ah, 04dh, 000h, 006h, 05ch, 00ah
        db      04dh, 000h, 007h, 0d1h, 00ah, 04dh, 000h, 008h, 008h, 00bh, 04dh, 000h, 009h, 062h, 00bh, 04dh
        db      000h, 00ah, 09eh, 00bh, 04dh, 000h, 00bh, 00fh, 00ch, 04dh, 000h, 00ch, 04bh, 00ch, 04dh, 000h
        db      00dh, 07ch, 00ch, 04dh, 000h, 00eh, 0ceh, 00ch, 04dh, 000h, 00fh, 024h, 00dh, 04dh, 000h, 010h
        db      066h, 00dh, 04dh, 000h, 011h, 0bbh, 00dh, 04dh, 000h, 012h, 010h, 00eh, 02fh, 000h, 000h, 0aeh
        db      00eh, 02fh, 000h, 001h, 0aeh, 00eh, 02fh, 000h, 002h, 0aeh, 00eh, 046h, 000h, 000h, 038h, 00fh
        db      046h, 001h, 000h, 04dh, 00fh, 046h, 001h, 001h, 0b9h, 00fh, 046h, 001h, 002h, 0eeh, 00fh, 046h
        db      001h, 003h, 0abh, 010h, 046h, 001h, 004h, 0abh, 010h, 046h, 002h, 000h, 0f9h, 010h, 046h, 003h
        db      000h, 04fh, 011h, 046h, 004h, 000h, 0aah, 011h, 046h, 004h, 001h, 0fah, 011h, 046h, 004h, 002h
        db      02fh, 012h, 046h, 004h, 003h, 076h, 012h, 046h, 005h, 002h, 076h, 012h, 046h, 005h, 000h, 0c8h
        db      012h, 046h, 005h, 001h, 026h, 013h, 046h, 006h, 000h, 077h, 013h, 046h, 007h, 000h, 0f6h, 013h
        db      046h, 047h, 000h, 051h, 014h, 046h, 048h, 000h, 083h, 014h, 046h, 049h, 000h, 0adh, 014h, 046h
        db      064h, 000h, 0ddh, 014h, 046h, 065h, 000h, 00ah, 015h, 046h, 066h, 000h, 01ah, 015h, 046h, 066h
        db      001h, 078h, 015h, 046h, 066h, 002h, 094h, 015h, 046h, 067h, 000h, 0eah, 015h, 046h, 068h, 000h
        db      00eh, 016h, 046h, 069h, 000h, 032h, 016h, 046h, 06ah, 000h, 050h, 016h, 046h, 06bh, 000h, 079h
        db      016h, 046h, 06ch, 000h, 079h, 016h, 046h, 06ch, 001h, 079h, 016h, 046h, 06dh, 000h, 0e5h, 016h
        db      046h, 06eh, 000h, 007h, 017h, 046h, 06fh, 000h, 030h, 017h, 046h, 070h, 000h, 05ch, 017h, 046h
        db      082h, 000h, 06ch, 017h, 046h, 082h, 001h, 0bch, 017h, 046h, 082h, 002h, 038h, 018h, 046h, 008h
        db      000h, 0c7h, 018h, 046h, 009h, 000h, 04dh, 019h, 046h, 05bh, 000h, 063h, 019h, 046h, 05ch, 000h
        db      0bah, 019h, 046h, 05dh, 000h, 0d1h, 019h, 046h, 05eh, 000h, 0efh, 019h, 046h, 05fh, 000h, 086h
        db      01ah, 046h, 060h, 000h, 0d4h, 01ah, 046h, 061h, 000h, 01ch, 01bh, 046h, 062h, 000h, 03eh, 01bh
        db      046h, 062h, 001h, 09eh, 01bh, 04bh, 000h, 000h, 020h, 01ch, 04dh, 000h, 003h, 020h, 01ch, 04fh
        db      003h, 002h, 020h, 01ch, 04bh, 000h, 001h, 05ah, 01ch, 04dh, 000h, 004h, 05ah, 01ch, 04fh, 003h
        db      003h, 05ah, 01ch, 04bh, 000h, 002h, 0abh, 01ch, 04dh, 000h, 002h, 0abh, 01ch, 04fh, 003h, 001h
        db      0abh, 01ch, 045h, 001h, 006h, 0abh, 01ch, 04bh, 000h, 003h, 022h, 01dh, 04bh, 002h, 004h, 022h
        db      01dh, 04bh, 00bh, 007h, 022h, 01dh, 04bh, 00ch, 007h, 022h, 01dh, 04bh, 000h, 004h, 0e0h, 01dh
        db      04bh, 00ah, 000h, 084h, 01eh, 04bh, 00bh, 000h, 084h, 01eh, 04bh, 00ch, 000h, 084h, 01eh, 04bh
        db      00dh, 000h, 084h, 01eh, 04bh, 00eh, 000h, 084h, 01eh, 04bh, 00fh, 000h, 084h, 01eh, 04bh, 00bh
        db      002h, 0c2h, 01eh, 04bh, 00bh, 003h, 0c2h, 01eh, 04bh, 00bh, 004h, 0c2h, 01eh, 04bh, 00bh, 005h
        db      0c2h, 01eh, 04bh, 00bh, 006h, 0c2h, 01eh, 04bh, 00ch, 002h, 0c2h, 01eh, 04bh, 00ch, 003h, 0c2h
        db      01eh, 04bh, 00ch, 004h, 0c2h, 01eh, 04bh, 00ch, 005h, 0c2h, 01eh, 04bh, 00ch, 006h, 0c2h, 01eh
        db      04bh, 00ah, 002h, 056h, 01fh, 04bh, 00dh, 002h, 056h, 01fh, 04bh, 00eh, 002h, 056h, 01fh, 04bh
        db      00ah, 004h, 091h, 01fh, 04bh, 00bh, 009h, 091h, 01fh, 04bh, 00ah, 005h, 0b8h, 01fh, 04bh, 00eh
        db      004h, 01dh, 020h, 04bh, 00ah, 001h, 05bh, 020h, 04bh, 00bh, 001h, 05bh, 020h, 04bh, 00ch, 001h
        db      05bh, 020h, 04bh, 00dh, 001h, 05bh, 020h, 04bh, 00eh, 001h, 05bh, 020h, 04bh, 00ah, 003h, 08ch
        db      020h, 04bh, 00bh, 007h, 08ch, 020h, 04bh, 00ch, 007h, 08ch, 020h, 04bh, 00dh, 003h, 08ch, 020h
        db      04bh, 00eh, 003h, 08ch, 020h, 04bh, 002h, 000h, 0b9h, 020h, 04bh, 002h, 001h, 0b9h, 020h, 04bh
        db      002h, 002h, 0b9h, 020h, 04bh, 002h, 003h, 0b9h, 020h, 04bh, 003h, 000h, 022h, 021h, 04bh, 003h
        db      001h, 054h, 021h, 04bh, 003h, 002h, 08bh, 021h, 04bh, 003h, 003h, 0d8h, 021h, 04bh, 003h, 004h
        db      0d8h, 021h, 047h, 000h, 000h, 064h, 022h, 047h, 000h, 001h, 0deh, 022h, 047h, 000h, 002h, 005h
        db      023h, 047h, 000h, 003h, 049h, 023h, 047h, 000h, 004h, 070h, 023h, 047h, 000h, 005h, 070h, 023h
        db      047h, 000h, 006h, 070h, 023h, 047h, 000h, 007h, 070h, 023h, 047h, 000h, 008h, 070h, 023h, 047h
        db      000h, 009h, 007h, 024h, 047h, 000h, 00ah, 08eh, 024h, 047h, 000h, 00bh, 0b2h, 024h, 047h, 000h
        db      00ch, 0d8h, 024h, 047h, 001h, 000h, 03fh, 025h, 047h, 001h, 001h, 065h, 025h, 047h, 002h, 000h
        db      084h, 025h, 047h, 003h, 000h, 0afh, 025h, 047h, 004h, 000h, 0d1h, 025h, 047h, 004h, 001h, 0d1h
        db      025h, 055h, 000h, 000h, 020h, 026h, 055h, 001h, 000h, 035h, 026h, 055h, 00bh, 000h, 0a0h, 026h
        db      055h, 00bh, 001h, 0a0h, 026h, 055h, 00bh, 002h, 0a0h, 026h, 055h, 002h, 000h, 0c7h, 026h, 055h
        db      002h, 001h, 0c7h, 026h, 055h, 002h, 002h, 0c7h, 026h, 055h, 003h, 000h, 007h, 027h, 055h, 003h
        db      001h, 027h, 027h, 055h, 003h, 002h, 046h, 027h, 055h, 003h, 003h, 046h, 027h, 055h, 003h, 004h
        db      06ch, 027h, 055h, 004h, 000h, 08ch, 027h, 055h, 004h, 001h, 0a2h, 027h, 055h, 004h, 002h, 0b2h
        db      027h, 055h, 005h, 000h, 0c5h, 027h, 055h, 005h, 001h, 00eh, 028h, 055h, 005h, 002h, 022h, 028h
        db      055h, 005h, 003h, 03bh, 028h, 055h, 005h, 004h, 04bh, 028h, 055h, 005h, 005h, 062h, 028h, 055h
        db      006h, 000h, 089h, 028h, 055h, 03ch, 000h, 089h, 028h, 055h, 006h, 001h, 0deh, 028h, 055h, 03ch
        db      001h, 0deh, 028h, 055h, 006h, 002h, 002h, 029h, 055h, 03ch, 002h, 002h, 029h, 055h, 006h, 003h
        db      02dh, 029h, 055h, 03ch, 003h, 02dh, 029h, 055h, 03ch, 004h, 055h, 029h, 055h, 03ch, 005h, 055h
        db      029h, 055h, 006h, 004h, 081h, 029h, 055h, 03ch, 006h, 081h, 029h, 055h, 006h, 005h, 090h, 029h
        db      055h, 03ch, 007h, 090h, 029h, 055h, 006h, 006h, 0a1h, 029h, 055h, 03ch, 008h, 0a1h, 029h, 055h
        db      006h, 007h, 0f5h, 029h, 055h, 03ch, 009h, 0f5h, 029h, 055h, 006h, 008h, 02bh, 02ah, 055h, 03ch
        db      00ah, 02bh, 02ah, 055h, 007h, 000h, 05ch, 02ah, 055h, 007h, 001h, 0a4h, 02ah, 055h, 008h, 000h
        db      0c8h, 02ah, 055h, 008h, 001h, 011h, 02bh, 055h, 008h, 002h, 044h, 02bh, 055h, 008h, 003h, 055h
        db      02bh, 055h, 008h, 004h, 0a4h, 02bh, 055h, 008h, 005h, 0c0h, 02bh, 055h, 008h, 006h, 0ech, 02bh
        db      055h, 008h, 007h, 0ech, 02bh, 055h, 009h, 000h, 019h, 02ch, 055h, 05bh, 000h, 02eh, 02ch, 055h
        db      05bh, 001h, 06eh, 02ch, 055h, 05bh, 002h, 097h, 02ch, 055h, 05bh, 003h, 0a5h, 02ch, 055h, 05bh
        db      004h, 0e8h, 02ch, 055h, 05bh, 005h, 007h, 02dh, 055h, 05bh, 006h, 042h, 02dh, 055h, 05bh, 007h
        db      069h, 02dh, 055h, 05bh, 008h, 069h, 02dh, 055h, 05ch, 000h, 095h, 02dh, 055h, 05ch, 001h, 0d0h
        db      02dh, 055h, 05ch, 002h, 0f3h, 02dh, 055h, 05ch, 003h, 015h, 02eh, 055h, 05ch, 004h, 053h, 02eh
        db      055h, 05ch, 005h, 053h, 02eh, 055h, 05dh, 000h, 0a3h, 02eh, 055h, 05dh, 001h, 0f8h, 02eh, 055h
        db      05dh, 002h, 019h, 02fh, 055h, 05dh, 003h, 038h, 02fh, 055h, 05dh, 004h, 072h, 02fh, 055h, 05dh
        db      005h, 0a7h, 02fh, 053h, 000h, 000h, 0cch, 02fh, 053h, 000h, 001h, 0cch, 02fh, 053h, 000h, 002h
        db      0cch, 02fh, 053h, 000h, 003h, 0cch, 02fh, 053h, 000h, 004h, 0cch, 02fh, 053h, 001h, 000h, 041h
        db      030h, 053h, 001h, 001h, 084h, 030h, 053h, 001h, 002h, 0f2h, 030h, 053h, 001h, 003h, 05ch, 031h
        db      053h, 001h, 004h, 0cfh, 031h, 053h, 001h, 005h, 063h, 032h, 053h, 001h, 006h, 0bfh, 032h, 06ch
        db      000h, 000h, 004h, 033h, 06ch, 000h, 001h, 004h, 033h, 073h, 000h, 000h, 087h, 033h, 073h, 001h
        db      000h, 09ch, 033h, 073h, 001h, 001h, 0e7h, 033h, 073h, 001h, 002h, 012h, 034h, 073h, 002h, 000h
        db      073h, 034h, 073h, 002h, 001h, 096h, 034h, 073h, 002h, 002h, 0ebh, 034h, 073h, 002h, 003h, 068h
        db      035h, 073h, 002h, 004h, 0b9h, 035h, 073h, 003h, 000h, 035h, 036h, 073h, 003h, 001h, 071h, 036h
        db      073h, 003h, 002h, 0dch, 036h, 073h, 003h, 003h, 010h, 037h, 073h, 003h, 004h, 010h, 037h, 073h
        db      003h, 005h, 079h, 037h, 073h, 003h, 006h, 0f8h, 037h, 073h, 003h, 007h, 056h, 038h, 04fh, 000h
        db      000h, 08ah, 038h, 04fh, 000h, 001h, 0a1h, 038h, 04fh, 000h, 002h, 004h, 039h, 04fh, 000h, 003h
        db      03ah, 039h, 04fh, 000h, 004h, 07eh, 039h, 04fh, 000h, 005h, 0a1h, 039h, 04fh, 000h, 006h, 0a1h
        db      039h, 04fh, 001h, 000h, 0bfh, 039h, 04fh, 002h, 000h, 021h, 03ah, 04fh, 002h, 001h, 0ach, 03ah
        db      04fh, 003h, 000h, 0ach, 03ah, 04fh, 002h, 002h, 0dch, 03ah, 04fh, 002h, 003h, 0dch, 03ah, 04fh
        db      002h, 004h, 0f0h, 03ah, 041h, 000h, 000h, 039h, 03bh, 041h, 000h, 001h, 039h, 03bh, 041h, 000h
        db      002h, 039h, 03bh, 074h, 000h, 000h, 0d9h, 03bh, 074h, 000h, 001h, 004h, 03ch, 074h, 000h, 002h
        db      080h, 03ch, 074h, 000h, 003h, 080h, 03ch, 042h, 000h, 000h, 0cch, 03ch, 042h, 000h, 001h, 0cch
        db      03ch, 042h, 000h, 002h, 043h, 03dh, 045h, 000h, 000h, 051h, 03dh, 045h, 000h, 001h, 05eh, 03dh
        db      045h, 000h, 002h, 088h, 03dh, 045h, 000h, 003h, 0a8h, 03dh, 045h, 000h, 004h, 0d9h, 03dh, 045h
        db      000h, 005h, 032h, 03eh, 045h, 000h, 006h, 080h, 03eh, 045h, 000h, 007h, 080h, 03eh, 045h, 001h
        db      000h, 0b6h, 03eh, 045h, 001h, 001h, 0dbh, 03eh, 045h, 001h, 002h, 034h, 03fh, 045h, 001h, 003h
        db      045h, 03fh, 045h, 001h, 004h, 045h, 03fh, 045h, 001h, 005h, 056h, 03fh, 045h, 001h, 007h, 0a1h
        db      03fh, 045h, 001h, 008h, 0afh, 03fh, 045h, 001h, 009h, 0cbh, 03fh, 045h, 001h, 00ah, 0deh, 03fh
        db      045h, 001h, 00bh, 002h, 040h, 045h, 001h, 00ch, 02bh, 040h, 045h, 001h, 00dh, 02bh, 040h, 045h
        db      001h, 00eh, 04dh, 040h, 045h, 001h, 00fh, 04dh, 040h, 045h, 002h, 000h, 06ah, 040h, 045h, 003h
        db      000h, 082h, 040h, 052h, 000h, 000h, 095h, 040h, 052h, 000h, 001h, 002h, 041h, 052h, 000h, 002h
        db      085h, 041h, 052h, 000h, 003h, 085h, 041h, 052h, 000h, 004h, 0f6h, 041h, 052h, 000h, 005h, 022h
        db      042h, 052h, 000h, 006h, 042h, 042h, 052h, 000h, 007h, 066h, 042h, 052h, 000h, 008h, 066h, 042h
        db      04ah, 000h, 000h, 0a0h, 042h, 04ah, 001h, 000h, 0c0h, 042h, 04ah, 002h, 000h, 01ah, 043h, 04ah
        db      003h, 000h, 0b2h, 043h, 04ah, 003h, 001h, 03bh, 044h, 04ah, 003h, 002h, 052h, 044h, 04ah, 003h
        db      003h, 06fh, 044h, 04ah, 003h, 004h, 08ch, 044h, 04ah, 003h, 005h, 0f6h, 044h, 04ah, 01fh, 000h
        db      081h, 045h, 04ah, 01fh, 001h, 081h, 045h, 04ah, 004h, 000h, 0d3h, 045h, 04ah, 004h, 001h, 0d3h
        db      045h, 04ah, 004h, 002h, 0d3h, 045h, 04ah, 004h, 003h, 02ch, 046h, 04ah, 005h, 000h, 096h, 046h
        db      04ah, 005h, 001h, 0a5h, 046h, 04ah, 005h, 002h, 0b6h, 046h, 04ah, 005h, 003h, 0d2h, 046h, 04ah
        db      005h, 004h, 01eh, 047h, 04ah, 005h, 005h, 02dh, 047h, 04ah, 005h, 006h, 03eh, 047h, 04ah, 005h
        db      007h, 05ah, 047h, 04ah, 005h, 008h, 0a6h, 047h, 04ah, 005h, 009h, 0b5h, 047h, 04ah, 005h, 00ah
        db      0c6h, 047h, 04ah, 005h, 00bh, 0e2h, 047h, 04ch, 000h, 000h, 02eh, 048h, 04ch, 001h, 000h, 043h
        db      048h, 04ch, 001h, 001h, 0aah, 048h, 04ch, 001h, 002h, 0d5h, 048h, 04ch, 001h, 003h, 028h, 049h
        db      04ch, 001h, 004h, 03eh, 049h, 04ch, 001h, 005h, 0a4h, 049h, 04ch, 001h, 006h, 006h, 04ah, 04ch
        db      001h, 007h, 06dh, 04ah, 04ch, 001h, 008h, 0b4h, 04ah, 04ch, 002h, 000h, 0fbh, 04ah, 04ch, 003h
        db      000h, 0fbh, 04ah, 069h, 000h, 000h, 0fbh, 04ah, 04ch, 002h, 001h, 021h, 04bh, 04ch, 003h, 001h
        db      021h, 04bh, 069h, 000h, 001h, 021h, 04bh, 04ch, 002h, 002h, 078h, 04bh, 04ch, 002h, 003h, 0a2h
        db      04bh, 04ch, 002h, 004h, 011h, 04ch, 04ch, 002h, 005h, 060h, 04ch, 04ch, 002h, 006h, 08ah, 04ch
        db      04ch, 002h, 007h, 009h, 04dh, 04ch, 002h, 008h, 096h, 04dh, 04ch, 002h, 009h, 0cch, 04dh, 04ch
        db      002h, 00ah, 032h, 04eh, 04ch, 002h, 00bh, 032h, 04eh, 04ch, 003h, 002h, 0b1h, 04eh, 04ch, 003h
        db      003h, 0f6h, 04eh, 04ch, 003h, 004h, 050h, 04fh, 04ch, 003h, 005h, 082h, 04fh, 04ch, 003h, 006h
        db      0a8h, 04fh, 04ch, 003h, 007h, 0ceh, 04fh, 04ch, 004h, 000h, 0f4h, 04fh, 04ch, 029h, 000h, 009h
        db      050h, 04ch, 029h, 001h, 009h, 050h, 04ch, 029h, 002h, 009h, 050h, 04ch, 029h, 003h, 009h, 050h
        db      04ch, 029h, 004h, 009h, 050h, 04ch, 029h, 005h, 009h, 050h, 04ch, 02ah, 000h
        db      "RPL*"
        else
        db      0ffh, 04dh, 000h, 000h, 0ebh, 008h, 04dh, 000h, 001h, 041h, 009h, 04dh, 000h, 006h, 093h, 009h
        db      04dh, 000h, 007h, 009h, 00ah, 04dh, 000h, 008h, 03eh, 00ah, 04dh, 000h, 009h, 098h, 00ah, 04dh
        db      000h, 00ah, 0d4h, 00ah, 04dh, 000h, 00bh, 045h, 00bh, 04dh, 000h, 00ch, 083h, 00bh, 04dh, 000h
        db      00dh, 0b4h, 00bh, 04dh, 000h, 00eh, 006h, 00ch, 04dh, 000h, 00fh, 05dh, 00ch, 04dh, 000h, 010h
        db      09bh, 00ch, 04dh, 000h, 011h, 0f0h, 00ch, 04dh, 000h, 012h, 045h, 00dh, 02fh, 000h, 000h, 0c1h
        db      00dh, 02fh, 000h, 001h, 0c1h, 00dh, 02fh, 000h, 002h, 0c1h, 00dh, 046h, 000h, 000h, 04bh, 00eh
        db      046h, 001h, 000h, 05fh, 00eh, 046h, 001h, 001h, 0ach, 00eh, 046h, 002h, 000h, 0ddh, 00eh, 046h
        db      003h, 000h, 035h, 00fh, 046h, 004h, 000h, 092h, 00fh, 046h, 004h, 001h, 0e4h, 00fh, 046h, 005h
        db      000h, 015h, 010h, 046h, 006h, 000h, 075h, 010h, 046h, 007h, 000h, 0f5h, 010h, 046h, 047h, 000h
        db      050h, 011h, 046h, 048h, 000h, 081h, 011h, 046h, 049h, 000h, 0abh, 011h, 046h, 064h, 000h, 0dbh
        db      011h, 046h, 065h, 000h, 007h, 012h, 046h, 066h, 000h, 016h, 012h, 046h, 067h, 000h, 073h, 012h
        db      046h, 068h, 000h, 095h, 012h, 046h, 069h, 000h, 0b7h, 012h, 046h, 06ah, 000h, 0d4h, 012h, 046h
        db      06bh, 000h, 0fdh, 012h, 046h, 06ch, 000h, 0fdh, 012h, 046h, 06ch, 001h, 0fdh, 012h, 046h, 06dh
        db      000h, 06eh, 013h, 046h, 06eh, 000h, 08fh, 013h, 046h, 06fh, 000h, 0b6h, 013h, 046h, 070h, 000h
        db      0e1h, 013h, 046h, 008h, 000h, 0f1h, 013h, 046h, 009h, 000h, 079h, 014h, 046h, 05bh, 000h, 08eh
        db      014h, 046h, 05ch, 000h, 0e7h, 014h, 046h, 05dh, 000h, 0feh, 014h, 046h, 05eh, 000h, 01ch, 015h
        db      046h, 05fh, 000h, 0b2h, 015h, 046h, 060h, 000h, 000h, 016h, 046h, 061h, 000h, 048h, 016h, 046h
        db      062h, 000h, 069h, 016h, 04bh, 000h, 000h, 0f4h, 016h, 04dh, 000h, 003h, 0f4h, 016h, 04fh, 003h
        db      002h, 0f4h, 016h, 04bh, 000h, 001h, 02eh, 017h, 04dh, 000h, 004h, 02eh, 017h, 04fh, 003h, 003h
        db      02eh, 017h, 04bh, 000h, 002h, 080h, 017h, 04dh, 000h, 002h, 080h, 017h, 04fh, 003h, 001h, 080h
        db      017h, 045h, 001h, 006h, 080h, 017h, 04bh, 000h, 003h, 0f3h, 017h, 04bh, 002h, 004h, 0f3h, 017h
        db      04bh, 00bh, 007h, 0f3h, 017h, 04bh, 00ch, 007h, 0f3h, 017h, 04bh, 000h, 004h, 0adh, 018h, 04bh
        db      00ah, 000h, 051h, 019h, 04bh, 00bh, 000h, 051h, 019h, 04bh, 00ch, 000h, 051h, 019h, 04bh, 00dh
        db      000h, 051h, 019h, 04bh, 00eh, 000h, 051h, 019h, 04bh, 00fh, 000h, 051h, 019h, 04bh, 00bh, 002h
        db      08bh, 019h, 04bh, 00bh, 003h, 08bh, 019h, 04bh, 00bh, 004h, 08bh, 019h, 04bh, 00bh, 005h, 08bh
        db      019h, 04bh, 00bh, 006h, 08bh, 019h, 04bh, 00ch, 002h, 08bh, 019h, 04bh, 00ch, 003h, 08bh, 019h
        db      04bh, 00ch, 004h, 08bh, 019h, 04bh, 00ch, 005h, 08bh, 019h, 04bh, 00ch, 006h, 08bh, 019h, 04bh
        db      00ah, 002h, 01bh, 01ah, 04bh, 00dh, 002h, 01bh, 01ah, 04bh, 00eh, 002h, 01bh, 01ah, 04bh, 00ah
        db      003h, 052h, 01ah, 04bh, 00bh, 008h, 052h, 01ah, 04bh, 00ah, 004h, 07ah, 01ah, 04bh, 00eh, 003h
        db      0e1h, 01ah, 04bh, 00ah, 001h, 01fh, 01bh, 04bh, 00bh, 001h, 01fh, 01bh, 04bh, 00ch, 001h, 01fh
        db      01bh, 04bh, 00dh, 001h, 01fh, 01bh, 04bh, 00eh, 001h, 01fh, 01bh, 04bh, 002h, 000h, 057h, 01bh
        db      04bh, 002h, 001h, 057h, 01bh, 04bh, 002h, 002h, 057h, 01bh, 04bh, 002h, 003h, 057h, 01bh, 04bh
        db      003h, 000h, 0c0h, 01bh, 04bh, 003h, 001h, 0eah, 01bh, 04bh, 003h, 002h, 01dh, 01ch, 04bh, 003h
        db      003h, 066h, 01ch, 04bh, 003h, 004h, 066h, 01ch, 047h, 000h, 000h, 0f2h, 01ch, 047h, 000h, 001h
        db      06ah, 01dh, 047h, 000h, 002h, 091h, 01dh, 047h, 000h, 003h, 0d2h, 01dh, 047h, 000h, 004h, 0f8h
        db      01dh, 047h, 000h, 005h, 0f8h, 01dh, 047h, 000h, 006h, 0f8h, 01dh, 047h, 000h, 007h, 0f8h, 01dh
        db      047h, 000h, 008h, 0f8h, 01dh, 047h, 000h, 009h, 08bh, 01eh, 047h, 000h, 00ah, 010h, 01fh, 047h
        db      000h, 00bh, 02fh, 01fh, 047h, 000h, 00ch, 055h, 01fh, 047h, 001h, 000h, 0b2h, 01fh, 047h, 001h
        db      001h, 0d3h, 01fh, 047h, 002h, 000h, 0f1h, 01fh, 047h, 003h, 000h, 01bh, 020h, 047h, 004h, 000h
        db      03ch, 020h, 047h, 004h, 001h, 03ch, 020h, 055h, 000h, 000h, 08bh, 020h, 055h, 001h, 000h, 09fh
        db      020h, 055h, 00bh, 000h, 007h, 021h, 055h, 00bh, 001h, 007h, 021h, 055h, 00bh, 002h, 007h, 021h
        db      055h, 002h, 000h, 02eh, 021h, 055h, 002h, 001h, 02eh, 021h, 055h, 002h, 002h, 02eh, 021h, 055h
        db      003h, 000h, 06eh, 021h, 055h, 003h, 001h, 08eh, 021h, 055h, 003h, 002h, 0adh, 021h, 055h, 003h
        db      003h, 0adh, 021h, 055h, 003h, 004h, 0d3h, 021h, 055h, 004h, 000h, 0f2h, 021h, 055h, 004h, 001h
        db      008h, 022h, 055h, 004h, 002h, 018h, 022h, 055h, 005h, 000h, 02bh, 022h, 055h, 005h, 001h, 074h
        db      022h, 055h, 005h, 002h, 088h, 022h, 055h, 005h, 003h, 0a1h, 022h, 055h, 005h, 004h, 0b1h, 022h
        db      055h, 005h, 005h, 0c8h, 022h, 055h, 006h, 000h, 0efh, 022h, 055h, 03ch, 000h, 0efh, 022h, 055h
        db      006h, 001h, 044h, 023h, 055h, 03ch, 001h, 044h, 023h, 055h, 006h, 002h, 068h, 023h, 055h, 03ch
        db      002h, 068h, 023h, 055h, 006h, 003h, 093h, 023h, 055h, 03ch, 003h, 093h, 023h, 055h, 03ch, 004h
        db      0bbh, 023h, 055h, 03ch, 005h, 0bbh, 023h, 055h, 006h, 004h, 0e7h, 023h, 055h, 03ch, 006h, 0e7h
        db      023h, 055h, 006h, 005h, 0f6h, 023h, 055h, 03ch, 007h, 0f6h, 023h, 055h, 006h, 006h, 007h, 024h
        db      055h, 03ch, 008h, 007h, 024h, 055h, 006h, 007h, 05bh, 024h, 055h, 03ch, 009h, 05bh, 024h, 055h
        db      006h, 008h, 091h, 024h, 055h, 03ch, 00ah, 091h, 024h, 055h, 007h, 000h, 0c2h, 024h, 055h, 007h
        db      001h, 003h, 025h, 055h, 008h, 000h, 01fh, 025h, 055h, 008h, 001h, 068h, 025h, 055h, 008h, 002h
        db      098h, 025h, 055h, 008h, 003h, 0a9h, 025h, 055h, 008h, 004h, 0fbh, 025h, 055h, 008h, 005h, 017h
        db      026h, 055h, 008h, 006h, 043h, 026h, 055h, 008h, 007h, 043h, 026h, 055h, 009h, 000h, 070h, 026h
        db      055h, 05bh, 000h, 084h, 026h, 055h, 05bh, 001h, 0c4h, 026h, 055h, 05bh, 002h, 0edh, 026h, 055h
        db      05bh, 003h, 0fbh, 026h, 055h, 05bh, 004h, 042h, 027h, 055h, 05bh, 005h, 061h, 027h, 055h, 05bh
        db      006h, 09ch, 027h, 055h, 05bh, 007h, 0c3h, 027h, 055h, 05bh, 008h, 0c3h, 027h, 055h, 05ch, 000h
        db      0efh, 027h, 055h, 05ch, 001h, 02ah, 028h, 055h, 05ch, 002h, 04dh, 028h, 055h, 05ch, 003h, 06bh
        db      028h, 055h, 05ch, 004h, 0a5h, 028h, 055h, 05ch, 005h, 0a5h, 028h, 055h, 05dh, 000h, 0f1h, 028h
        db      055h, 05dh, 001h, 044h, 029h, 055h, 05dh, 002h, 065h, 029h, 055h, 05dh, 003h, 084h, 029h, 055h
        db      05dh, 004h, 0bdh, 029h, 055h, 05dh, 005h, 0f0h, 029h, 053h, 000h, 000h, 014h, 02ah, 053h, 000h
        db      001h, 014h, 02ah, 053h, 000h, 002h, 014h, 02ah, 053h, 000h, 003h, 014h, 02ah, 053h, 000h, 004h
        db      014h, 02ah, 053h, 001h, 000h, 089h, 02ah, 053h, 001h, 001h, 0c9h, 02ah, 053h, 001h, 002h, 036h
        db      02bh, 053h, 001h, 003h, 09ah, 02bh, 053h, 001h, 004h, 006h, 02ch, 053h, 001h, 005h, 092h, 02ch
        db      053h, 001h, 006h, 0efh, 02ch, 06ch, 000h, 000h, 034h, 02dh, 06ch, 000h, 001h, 034h, 02dh, 073h
        db      000h, 000h, 0b5h, 02dh, 073h, 001h, 000h, 0c9h, 02dh, 073h, 001h, 001h, 01ah, 02eh, 073h, 001h
        db      002h, 045h, 02eh, 073h, 002h, 000h, 0a7h, 02eh, 073h, 002h, 001h, 0cah, 02eh, 073h, 002h, 002h
        db      020h, 02fh, 073h, 002h, 003h, 09dh, 02fh, 073h, 002h, 004h, 0edh, 02fh, 073h, 003h, 000h, 069h
        db      030h, 073h, 003h, 001h, 0a5h, 030h, 073h, 003h, 002h, 00fh, 031h, 073h, 003h, 003h, 043h, 031h
        db      073h, 003h, 004h, 043h, 031h, 073h, 003h, 005h, 0adh, 031h, 073h, 003h, 006h, 026h, 032h, 073h
        db      003h, 007h, 084h, 032h, 04fh, 000h, 000h, 0b8h, 032h, 04fh, 000h, 001h, 0cfh, 032h, 04fh, 000h
        db      002h, 032h, 033h, 04fh, 000h, 003h, 068h, 033h, 04fh, 000h, 004h, 0adh, 033h, 04fh, 000h, 005h
        db      0d0h, 033h, 04fh, 000h, 006h, 0d0h, 033h, 04fh, 001h, 000h, 0efh, 033h, 04fh, 002h, 000h, 04eh
        db      034h, 04fh, 002h, 001h, 0e5h, 034h, 04fh, 003h, 000h, 0e5h, 034h, 04fh, 002h, 002h, 015h, 035h
        db      04fh, 002h, 003h, 015h, 035h, 04fh, 002h, 004h, 029h, 035h, 041h, 000h, 000h, 072h, 035h, 041h
        db      000h, 001h, 072h, 035h, 041h, 000h, 002h, 072h, 035h, 074h, 000h, 000h, 011h, 036h, 074h, 000h
        db      001h, 03ch, 036h, 074h, 000h, 002h, 0b8h, 036h, 074h, 000h, 003h, 0b8h, 036h, 042h, 000h, 000h
        db      004h, 037h, 042h, 000h, 001h, 004h, 037h, 042h, 000h, 002h, 07bh, 037h, 045h, 000h, 000h, 089h
        db      037h, 045h, 000h, 001h, 096h, 037h, 045h, 000h, 002h, 0c0h, 037h, 045h, 000h, 003h, 0e0h, 037h
        db      045h, 000h, 004h, 011h, 038h, 045h, 000h, 005h, 05fh, 038h, 045h, 000h, 006h, 0adh, 038h, 045h
        db      000h, 007h, 0adh, 038h, 045h, 001h, 000h, 0e4h, 038h, 045h, 001h, 001h, 009h, 039h, 045h, 001h
        db      002h, 062h, 039h, 045h, 001h, 003h, 073h, 039h, 045h, 001h, 004h, 073h, 039h, 045h, 001h, 005h
        db      084h, 039h, 045h, 001h, 007h, 0d3h, 039h, 045h, 001h, 008h, 0e1h, 039h, 045h, 001h, 009h, 0fdh
        db      039h, 045h, 001h, 00ah, 010h, 03ah, 045h, 001h, 00bh, 034h, 03ah, 045h, 001h, 00ch, 05bh, 03ah
        db      045h, 001h, 00dh, 05bh, 03ah, 045h, 001h, 00eh, 07dh, 03ah, 045h, 001h, 00fh, 07dh, 03ah, 045h
        db      002h, 000h, 09ah, 03ah, 045h, 003h, 000h, 0b2h, 03ah, 052h, 000h, 000h, 0c6h, 03ah, 052h, 000h
        db      001h, 03ch, 03bh, 052h, 000h, 002h, 0bfh, 03bh, 052h, 000h, 003h, 0bfh, 03bh, 052h, 000h, 004h
        db      02fh, 03ch, 052h, 000h, 005h, 05bh, 03ch, 052h, 000h, 006h, 07bh, 03ch, 052h, 000h, 007h, 09fh
        db      03ch, 052h, 000h, 008h, 09fh, 03ch, 04ah, 000h, 000h, 0dah, 03ch, 04ah, 001h, 000h, 0fah, 03ch
        db      04ah, 002h, 000h, 054h, 03dh, 04ah, 003h, 000h, 0eah, 03dh, 04ah, 003h, 001h, 075h, 03eh, 04ah
        db      003h, 002h, 08ch, 03eh, 04ah, 003h, 003h, 0a9h, 03eh, 04ah, 003h, 004h, 0c2h, 03eh, 04ah, 003h
        db      005h, 02ch, 03fh, 04ah, 01fh, 000h, 0b8h, 03fh, 04ah, 01fh, 001h, 0b8h, 03fh, 04ah, 004h, 000h
        db      00ah, 040h, 04ah, 004h, 001h, 00ah, 040h, 04ah, 004h, 002h, 00ah, 040h, 04ah, 004h, 003h, 068h
        db      040h, 04ah, 005h, 000h, 0d4h, 040h, 04ah, 005h, 001h, 0e3h, 040h, 04ah, 005h, 002h, 0f4h, 040h
        db      04ah, 005h, 003h, 010h, 041h, 04ah, 005h, 004h, 055h, 041h, 04ah, 005h, 005h, 064h, 041h, 04ah
        db      005h, 006h, 075h, 041h, 04ah, 005h, 007h, 091h, 041h, 04ah, 005h, 008h, 0d6h, 041h, 04ah, 005h
        db      009h, 0e5h, 041h, 04ah, 005h, 00ah, 0f6h, 041h, 04ah, 005h, 00bh, 012h, 042h, 04ch, 000h, 000h
        db      057h, 042h, 04ch, 001h, 000h, 06bh, 042h, 04ch, 001h, 001h, 0d0h, 042h, 04ch, 001h, 002h, 0fbh
        db      042h, 04ch, 001h, 003h, 04eh, 043h, 04ch, 001h, 004h, 064h, 043h, 04ch, 001h, 005h, 0c9h, 043h
        db      04ch, 001h, 006h, 02ah, 044h, 04ch, 001h, 007h, 090h, 044h, 04ch, 001h, 008h, 0d6h, 044h, 04ch
        db      002h, 000h, 01ch, 045h, 04ch, 003h, 000h, 01ch, 045h, 069h, 000h, 000h, 01ch, 045h, 04ch, 002h
        db      001h, 040h, 045h, 04ch, 003h, 001h, 040h, 045h, 069h, 000h, 001h, 040h, 045h, 04ch, 002h, 002h
        db      095h, 045h, 04ch, 002h, 003h, 0beh, 045h, 04ch, 002h, 004h, 02bh, 046h, 04ch, 002h, 005h, 07ah
        db      046h, 04ch, 002h, 006h, 0a4h, 046h, 04ch, 002h, 007h, 020h, 047h, 04ch, 002h, 008h, 0afh, 047h
        db      04ch, 002h, 009h, 0ddh, 047h, 04ch, 002h, 00ah, 043h, 048h, 04ch, 002h, 00bh, 043h, 048h, 04ch
        db      003h, 002h, 0c2h, 048h, 04ch, 003h, 003h, 007h, 049h, 04ch, 003h, 004h, 059h, 049h, 04ch, 003h
        db      005h, 08bh, 049h, 04ch, 003h, 006h, 0b0h, 049h, 04ch, 003h, 007h, 0d6h, 049h, 04ch, 004h, 000h
        db      0fch, 049h, 04ch, 029h, 000h, 010h, 04ah, 04ch, 029h, 001h, 010h, 04ah, 04ch, 029h, 002h, 010h
        db      04ah, 04ch, 029h, 003h, 010h, 04ah, 04ch, 029h, 004h, 010h, 04ah, 04ch, 029h, 005h, 010h, 04ah
        db      04ch, 02ah, 000h
        db      "YJL*"
        endif
        db      001h
        if      FW_VERSION >= 312
        db      "mIL)"
        elseif  FW_VERSION = 311
        db      "RPL*"
        else
        db      "YJL*"
        endif
        db      002h
        if      FW_VERSION >= 312
        db      "mIL)"
        elseif  FW_VERSION = 311
        db      "RPL*"
        else
        db      "YJL*"
        endif
        db      003h
        if      FW_VERSION >= 312
        db      "mIL)"
        db      004h
        db      "mIL)"
        db      005h
        db      "mIL*", 0
        db      090h, 049h, 04ch, 02ah, 001h, 090h, 049h, 04ch, 02ah, 002h, 090h, 049h, 04ch, 02ah, 003h, 090h
        db      049h, 04ch, 02bh, 000h, 0a8h, 049h, 04ch, 02bh, 001h, 0c0h, 049h, 04ch, 02ch, 000h, 0fah, 049h
        db      04ch, 005h, 000h, 043h, 04ah, 04ch, 005h, 001h, 06fh, 04ah, 04ch, 005h, 002h, 0ech, 04ah, 04ch
        db      005h, 003h, 017h, 04bh, 04ch, 005h, 004h, 03fh, 04bh, 04ch, 005h, 005h, 0b2h, 04bh, 046h, 05ch
        db      000h, 0f6h, 04bh, 045h, 003h, 000h, 0f6h, 04bh, 04ch, 033h, 000h, 0f6h, 04bh, 04ch, 034h, 000h
        db      012h, 04ch, 04ch, 006h, 000h, 05fh, 04ch, 04ch, 006h, 001h, 086h, 04ch, 04ch, 006h, 002h, 086h
        db      04ch, 04ch, 006h, 003h, 086h, 04ch, 04ch, 006h, 004h, 0c3h, 04ch, 04ch, 006h, 005h, 0c3h, 04ch
        db      04ch, 006h, 006h, 0c3h, 04ch, 04ch, 006h, 007h, 0ebh, 04ch, 04ch, 006h, 008h, 0ebh, 04ch, 04ch
        db      006h, 009h, 0ebh, 04ch, 04ch, 006h, 00ah, 01dh, 04dh, 04ch, 006h, 00bh, 01dh, 04dh, 04ch, 006h
        db      00ch, 01dh, 04dh, 04ch, 006h, 00dh, 046h, 04dh, 04ch, 006h, 00eh, 06ah, 04dh, 04ch, 006h, 00fh
        db      0b5h, 04dh, 04ch, 006h, 010h, 0e8h, 04dh, 04ch, 03dh, 000h, 006h, 04eh, 04ch, 047h, 001h
        db      "uNLH"
        db      001h, 075h, 04eh, 04ch, 007h, 000h, 097h, 04eh, 04ch, 047h, 000h, 097h, 04eh, 04ch, 048h, 000h
        db      097h, 04eh, 04ch, 049h, 000h, 097h, 04eh, 04ch, 04ah, 000h, 0a7h, 04eh, 04ch, 008h, 000h, 0beh
        db      04eh, 04ch, 009h, 000h, 027h, 04fh, 04ch, 05bh, 000h, 027h, 04fh, 04ch, 009h, 001h
        db      "COL["
        db      001h, 043h, 04fh, 04ch, 009h, 002h, 05eh, 04fh, 04ch, 05bh, 002h, 05eh, 04fh, 04ch, 009h, 003h
        db      081h, 04fh, 04ch, 05bh, 003h, 0b6h, 04fh, 04ch, 05bh, 004h, 0d1h, 04fh, 062h, 000h, 000h, 01fh
        db      050h, 062h, 000h, 001h, 080h, 050h, 062h, 000h, 002h, 0d6h, 050h, 062h, 000h, 003h, 00ch, 051h
        db      069h, 000h, 002h, 03ch, 051h, 069h, 000h, 003h, 07fh, 051h, 069h, 000h, 004h, 0a4h, 051h, 066h
        db      000h, 003h, 0cah, 051h, 066h, 000h, 006h, 0f3h, 051h, 066h, 000h, 007h, 05bh, 052h, 066h, 000h
        db      008h, 088h, 052h, 066h, 000h, 00bh, 0b6h, 052h, 066h, 000h, 00ch, 0d7h, 052h, 066h, 000h, 00ah
        db      031h, 053h, 066h, 000h, 018h, 031h, 053h, 066h, 000h, 014h, 09dh, 053h, 066h, 000h, 015h, 0c0h
        db      053h, 066h, 000h, 016h, 0deh, 053h, 066h, 000h, 017h, 067h, 054h, 066h, 000h, 019h, 0a6h, 054h
        db      066h, 000h, 01ah, 019h, 055h, 066h, 000h, 01bh, 06eh, 055h, 066h, 000h, 01ch, 0aeh, 055h, 066h
        db      000h, 01dh, 0f3h, 055h, 066h, 000h, 01eh, 04eh, 056h, 066h, 000h, 01fh, 091h, 056h, 066h, 001h
        db      001h, 0c5h, 056h, 066h, 001h, 003h, 0ech, 056h, 066h, 001h, 009h, 012h, 057h, 066h, 001h, 00ah
        db      032h, 057h, 066h, 001h, 00bh, 066h, 057h, 066h, 001h, 00ch, 0deh, 057h, 066h, 001h, 00dh, 030h
        db      058h, 066h, 001h, 00eh, 049h, 058h, 066h, 001h, 010h, 087h, 058h, 066h, 001h, 011h, 0b8h, 058h
        db      066h, 001h, 012h, 0fbh, 058h, 066h, 001h, 013h, 02dh, 059h, 066h, 001h, 014h, 04ah, 059h, 066h
        db      001h, 015h, 084h, 059h, 066h, 001h, 016h, 09ch, 059h, 066h, 001h, 017h, 0c3h, 059h, 066h, 001h
        db      018h, 0fbh, 059h, 066h, 001h, 019h, 061h, 05ah, 066h, 001h, 01ah, 081h, 05ah, 066h, 001h, 01bh
        db      09bh, 05ah, 066h, 001h, 01ch, 0bch, 05ah, 066h, 002h, 001h, 02bh, 05bh, 066h, 002h, 002h, 072h
        db      05bh, 066h, 002h, 003h, 08bh, 05bh, 066h, 003h, 01eh, 0bfh, 05bh, 066h, 003h, 01fh, 0d0h, 05bh
        db      066h, 003h, 020h, 0e8h, 05bh, 066h, 003h, 021h, 046h, 05ch, 066h, 003h, 024h, 09ch, 05ch, 066h
        db      003h, 025h, 0f0h, 05ch, 066h, 003h, 026h, 019h, 05dh, 066h, 003h, 027h, 096h, 05dh, 066h, 003h
        db      028h, 0cbh, 05dh, 066h, 003h, 02bh, 008h, 05eh, 066h, 003h, 032h, 037h, 05eh, 066h, 003h, 033h
        db      0b7h, 05eh, 066h, 003h, 034h, 025h, 05fh, 066h, 003h
        db      "5B_f"
        db      003h
        db      "7h_f"
        db      003h, 03ah, 0cdh, 05fh, 073h, 03ah, 000h, 0cdh, 05fh, 066h, 003h, 03bh, 020h, 060h, 073h, 03bh
        db      000h, 020h, 060h, 066h, 003h, 03dh, 0a5h, 060h, 066h, 003h, 03eh, 039h, 061h, 000h, 089h, 020h
        db      0dbh, 020h, 082h, 020h, 028h, 031h, 02dh, 039h, 039h, 029h, 02eh, 020h, 01bh, 043h, 020h, 0a2h
        db      03ah, 00ah, 0c7h, 020h, 0c5h, 020h, 083h, 020h, 097h, 020h, 0d0h, 02ch, 020h, 0adh, 020h, 01bh
        db      08dh, 00ah, 01bh, 098h, 020h, 01bh, 03eh, 02ch, 020h, 0adh, 020h, 08bh, 020h, 02bh, 02fh, 02dh
        db      02eh, 00ah, 000h, 089h, 020h, 082h, 020h, 0a1h, 02eh, 020h, 01bh, 043h, 020h, 0c3h, 03ah, 020h
        db      08bh, 020h, 02bh, 02fh, 02dh, 00ah, 028h, 0b0h, 020h, 01bh, 026h, 020h, 084h, 020h, 01bh, 0ddh
        db      020h, 01bh, 09eh, 00ah, 01bh
        db      "/). Type "
        db      0c5h, 020h, 0a1h, 02ch, 020h, 097h, 020h, 0d0h, 02eh, 00ah, 01bh, 098h, 020h, 01bh, 03eh, 020h
        db      01bh, 0c5h
        db      " punctuation."
        elseif  FW_VERSION = 311
        db      "RPL+", 0
        db      08ch, 050h, 04ch, 02bh, 001h, 0a4h, 050h, 04ch, 02ch, 000h, 0deh, 050h, 04ch, 005h, 000h, 021h
        db      051h, 04ch, 005h, 001h, 055h, 051h, 04ch, 005h, 002h, 0c7h, 051h, 04ch, 005h, 003h, 0f7h, 051h
        db      04ch, 005h, 004h, 02bh, 052h, 04ch, 005h, 005h, 09eh, 052h, 04ch, 033h, 000h, 017h, 053h, 04ch
        db      034h, 000h, 032h, 053h, 04ch, 006h, 000h, 07eh, 053h, 04ch, 006h, 001h, 0aah, 053h, 04ch, 006h
        db      002h, 0aah, 053h, 04ch, 006h, 003h, 0aah, 053h, 04ch, 006h, 004h, 0e8h, 053h, 04ch, 006h, 005h
        db      0e8h, 053h, 04ch, 006h, 006h, 0e8h, 053h, 04ch, 006h, 007h, 011h, 054h, 04ch, 006h, 008h, 011h
        db      054h, 04ch, 006h, 009h, 011h, 054h, 04ch, 006h, 00ah, 044h, 054h, 04ch, 006h, 00bh, 044h, 054h
        db      04ch, 006h, 00ch, 044h, 054h, 04ch, 006h, 00dh, 06eh, 054h, 04ch, 006h, 00eh, 092h, 054h, 04ch
        db      006h, 00fh, 004h, 055h, 04ch, 006h, 010h
        db      "rUL=", 0
        db      091h, 055h, 04ch, 007h, 000h, 0fdh, 055h, 04ch, 047h, 000h, 01bh, 056h, 04ch, 047h, 001h
        db      "1VLH"
        db      001h
        db      "1VLH", 0
        db      "SVLI", 0
        db      "cVLJ", 0
        db      074h, 056h, 04ch, 008h, 000h, 097h, 056h, 04ch, 009h, 000h, 001h, 057h, 04ch, 05bh, 000h, 001h
        db      057h, 04ch, 009h, 001h, 01dh, 057h, 04ch, 05bh, 001h, 01dh, 057h, 04ch, 009h, 002h
        db      "8WL["
        db      002h, 038h, 057h, 04ch, 009h, 003h, 05bh, 057h, 04ch, 05bh, 003h, 090h, 057h, 04ch, 05bh, 004h
        db      0abh, 057h, 062h, 000h, 000h, 0f9h, 057h, 062h, 000h, 001h, 05ah, 058h, 062h, 000h, 002h, 0dch
        db      058h, 062h, 000h, 003h, 030h, 059h, 069h, 000h, 002h, 066h, 059h, 069h, 000h, 003h, 0adh, 059h
        db      069h, 000h, 004h, 0d2h, 059h, 066h, 000h, 003h, 0f8h, 059h, 066h, 000h, 006h, 020h, 05ah, 066h
        db      000h, 007h, 08ah, 05ah, 066h, 000h, 008h, 0cch, 05ah, 066h, 000h, 00bh, 0fah, 05ah, 066h, 000h
        db      00ch, 02fh, 05bh, 066h, 000h, 00ah, 08ah, 05bh, 066h, 000h, 018h, 08ah, 05bh, 066h, 000h, 014h
        db      0f6h, 05bh, 066h, 000h, 015h, 01ah, 05ch, 066h, 000h, 016h, 03ah, 05ch, 066h, 000h, 017h, 0c5h
        db      05ch, 066h, 000h, 019h, 01ch, 05dh, 066h, 000h, 01ah, 0bfh, 05dh, 066h, 000h, 01bh, 013h, 05eh
        db      066h, 000h, 01ch, 058h, 05eh, 066h, 000h, 01dh, 0a2h, 05eh, 066h, 000h, 01eh, 0f6h, 05eh, 066h
        db      000h, 01fh, 039h, 05fh, 066h, 001h, 001h, 072h, 05fh, 066h, 001h, 003h, 09ch, 05fh, 066h, 001h
        db      009h, 0cah, 05fh, 066h, 001h, 00ah, 0f1h, 05fh, 066h, 001h, 00bh, 028h, 060h, 066h, 001h, 00ch
        db      0a2h, 060h, 066h, 001h, 00dh, 0f3h, 060h, 066h, 001h, 00eh, 028h, 061h, 066h, 001h, 010h, 063h
        db      061h, 066h, 001h, 011h, 094h, 061h, 066h, 001h, 012h, 0e9h, 061h, 066h, 001h, 013h, 01bh, 062h
        db      066h, 001h, 014h, 042h, 062h, 066h, 001h, 015h, 0a8h, 062h, 066h, 001h, 016h, 0c0h, 062h, 066h
        db      001h, 017h, 0e7h, 062h, 066h, 001h, 018h, 01fh, 063h, 066h, 001h, 019h, 085h, 063h, 066h, 001h
        db      01ah, 0a5h, 063h, 066h, 001h, 01bh, 0bfh, 063h, 066h, 001h, 01ch, 0e0h, 063h, 066h, 002h, 001h
        db      04bh, 064h, 066h, 002h, 002h, 091h, 064h, 066h, 002h, 003h, 0d7h, 064h, 066h, 003h, 01eh, 01dh
        db      065h, 066h, 003h, 01fh, 038h, 065h, 066h, 003h
        db      " cef"
        db      003h, 021h, 0d7h, 065h, 066h, 003h, 025h, 02dh, 066h, 066h, 003h
        db      "&Wff"
        db      003h, 027h, 0d7h, 066h, 066h, 003h, 028h, 00eh, 067h, 066h, 003h
        db      "+Lgf"
        db      003h
        db      "2{gf"
        db      003h, 033h, 0fah, 067h, 066h, 003h
        db      "4dhf"
        db      003h, 035h, 093h, 068h, 066h, 003h, 037h, 0d9h, 068h, 066h, 003h
        db      ":Dis:", 0
        db      044h, 069h, 066h, 003h, 03bh, 096h, 069h, 073h, 03bh, 000h, 096h, 069h, 066h, 003h
        db      "= jf"
        db      003h, 03eh, 0b5h, 06ah, 066h, 003h, 03fh, 03fh, 06bh, 066h, 003h, 040h, 083h, 06bh, 000h, 08bh
        db      020h, 0deh, 020h, 082h, 020h, 083h, 020h, 028h, 031h, 02dh, 039h, 039h, 029h, 02eh, 020h, 01bh
        db      04bh, 00ah, 0a2h, 03ah, 020h, 0ceh, 020h, 0d0h, 020h, 083h, 020h, 09ch, 020h, 0ddh, 02ch, 020h
        db      0aah, 00ah, 01bh, 086h, 020h, 01bh, 059h, 020h, 01bh, 028h, 02ch, 020h, 0aah, 020h, 089h, 020h
        db      02bh, 02fh, 02dh, 02eh, 020h, 01bh, 0e0h, 00ah, 082h, 020h, 01bh, 02bh, 020h, 01bh, 0ceh
        db      " drums, "
        db      086h, 020h, 0a3h, 02ch, 00ah, 0aah
        db      " both."
        db      00ah, 000h, 08bh, 020h, 031h, 036h, 02dh, 01bh, 023h, 020h, 082h, 020h, 0abh, 02eh, 00ah, 01bh
        db      04bh, 020h, 0c7h, 03ah, 020h, 089h, 020h, 02bh, 02fh, 02dh, 020h, 028h, 0b2h, 020h, 01bh, 042h
        db      020h, 084h, 00ah, 01bh, 09ah, 020h, 01bh, 0b8h, 020h, 01bh
        db      "H). Type "
        db      0d0h, 020h, 0abh, 02ch, 00ah, 09ch, 020h, 0ddh, 02eh, 020h, 01bh, 059h, 020h, 01bh, 028h, 020h
        db      01bh, 0eah, 00ah
        db      "punctuation."
        else
        db      "YJL+", 0
        db      093h, 04ah, 04ch, 02bh, 001h, 0abh, 04ah, 04ch, 02ch, 000h, 0e5h, 04ah, 04ch, 005h, 000h, 027h
        db      04bh, 04ch, 005h, 001h, 056h, 04bh, 04ch, 005h, 002h, 0c1h, 04bh, 04ch, 005h, 003h, 0f1h, 04bh
        db      04ch, 005h, 004h, 021h, 04ch, 04ch, 005h, 005h, 094h, 04ch, 04ch, 033h, 000h, 008h, 04dh, 04ch
        db      034h, 000h, 024h, 04dh, 04ch, 006h, 000h, 070h, 04dh, 04ch, 006h, 001h, 09ah, 04dh, 04ch, 006h
        db      002h, 09ah, 04dh, 04ch, 006h, 003h, 09ah, 04dh, 04ch, 006h, 004h, 0d8h, 04dh, 04ch, 006h, 005h
        db      0d8h, 04dh, 04ch, 006h, 006h, 0d8h, 04dh, 04ch, 006h, 007h, 001h, 04eh, 04ch, 006h, 008h, 001h
        db      04eh, 04ch, 006h, 009h, 001h, 04eh, 04ch, 006h, 00ah, 034h, 04eh, 04ch, 006h, 00bh, 034h, 04eh
        db      04ch, 006h, 00ch, 034h, 04eh, 04ch, 006h, 00dh, 05eh, 04eh, 04ch, 006h, 00eh, 082h, 04eh, 04ch
        db      006h, 00fh, 0f3h, 04eh, 04ch, 006h, 010h, 060h, 04fh, 04ch, 03dh, 000h, 07fh, 04fh, 04ch, 007h
        db      000h, 0eah, 04fh, 04ch, 047h, 000h, 008h, 050h, 04ch, 047h, 001h, 01eh, 050h, 04ch, 048h, 001h
        db      01eh, 050h, 04ch, 048h, 000h
        db      "@PLI", 0
        db      "PPLJ", 0
        db      061h, 050h, 04ch, 008h, 000h, 083h, 050h, 062h, 000h, 000h, 0e9h, 050h, 062h, 000h, 001h, 04ah
        db      051h, 062h, 000h, 002h, 0cch, 051h, 062h, 000h, 003h, 01ch, 052h, 069h, 000h, 002h, 04eh, 052h
        db      069h, 000h, 003h, 091h, 052h, 069h, 000h, 004h, 0b6h, 052h, 066h, 000h, 003h, 0dch, 052h, 066h
        db      000h, 006h, 008h, 053h, 066h, 000h, 007h, 072h, 053h, 066h, 000h, 008h, 0b5h, 053h, 066h, 000h
        db      00bh, 0dfh, 053h, 066h, 000h, 00ch, 015h, 054h, 066h, 000h, 00ah, 071h, 054h, 066h, 000h, 018h
        db      071h, 054h, 066h, 000h, 014h, 0b2h, 054h, 066h, 000h, 015h, 0d8h, 054h, 066h, 000h, 016h, 0f7h
        db      054h, 066h, 000h, 017h, 038h, 055h, 066h, 000h, 019h, 08fh, 055h, 066h, 000h, 01ah, 02fh, 056h
        db      066h, 000h, 01bh, 086h, 056h, 066h, 000h, 01ch, 0cfh, 056h, 066h, 001h, 001h, 01bh, 057h, 066h
        db      001h, 003h, 03fh, 057h, 066h, 001h, 009h, 06dh, 057h, 066h, 001h, 00bh, 095h, 057h, 066h, 001h
        db      00ch, 00dh, 058h, 066h, 001h, 00dh, 05eh, 058h, 066h, 001h, 00eh, 094h, 058h, 066h, 001h, 010h
        db      0d2h, 058h, 066h, 001h, 011h, 007h, 059h, 066h, 001h, 012h, 05dh, 059h, 066h, 001h, 013h, 090h
        db      059h, 066h, 001h, 014h, 0b3h, 059h, 066h, 001h, 015h, 019h, 05ah, 066h, 002h, 001h, 031h, 05ah
        db      066h, 002h, 002h, 073h, 05ah, 066h, 002h, 003h, 0bbh, 05ah, 066h, 003h, 01eh, 001h, 05bh, 066h
        db      003h, 01fh, 01dh, 05bh, 066h, 003h
        db      " H[f"
        db      003h, 021h, 0bbh, 05bh, 066h, 003h, 025h, 012h, 05ch, 066h, 003h, 026h, 03bh, 05ch, 066h, 003h
        db      027h, 0c1h, 05ch, 066h, 003h, 028h, 0f8h, 05ch, 066h, 003h, 02bh, 034h, 05dh, 066h, 003h
        db      "2c]f"
        db      003h, 033h, 0e2h, 05dh, 066h, 003h
        db      "4P^f"
        db      003h, 035h, 07ch, 05eh, 066h, 003h, 037h, 0c2h, 05eh, 066h, 003h, 03ah, 02bh, 05fh, 073h, 03ah
        db      000h, 02bh, 05fh, 066h, 003h, 03bh, 07bh, 05fh, 073h, 03bh, 000h, 07bh, 05fh, 066h, 003h, 03ch
        db      002h, 060h, 066h, 003h, 03dh, 037h, 060h, 066h, 003h, 03eh, 0cch, 060h, 000h, 089h, 020h, 0e8h
        db      020h, 082h, 020h, 083h, 020h, 028h, 031h, 02dh, 039h, 039h, 029h, 02eh, 020h, 01bh, 03ch, 00ah
        db      09bh, 03ah, 020h, 0c3h, 020h, 0c4h, 020h, 083h, 020h, 09ah, 020h, 0d4h, 02ch, 020h, 0abh, 00ah
        db      01bh, 081h, 020h, 01bh, 042h, 020h, 01bh, 01ch, 02ch, 020h, 0abh, 020h, 088h, 020h, 02bh, 02fh
        db      02dh, 02eh, 020h, 01bh, 0bch, 00ah, 082h, 020h, 01bh, 036h, 020h, 01bh, 0adh
        db      " drums, "
        db      08eh, 020h, 0a5h, 02ch, 00ah, 0abh
        db      " both."
        db      00ah, 000h, 089h, 020h, 031h, 036h, 02dh, 01bh, 013h, 020h, 082h, 020h, 0adh, 02eh, 00ah, 01bh
        db      03ch, 020h, 0beh, 03ah, 020h, 088h, 020h, 02bh, 02fh, 02dh, 020h, 028h, 0aeh, 020h, 01bh, 032h
        db      020h, 084h, 00ah, 01bh, 0cbh, 020h, 01bh, 09dh, 020h, 01bh
        db      "8). Type "
        db      0c4h, 020h, 0adh, 02ch, 00ah, 09ah, 020h, 0d4h, 02eh, 020h, 01bh, 042h, 020h, 01bh, 01ch, 020h
        db      01bh, 0c8h, 00ah
        db      "punctuation."
        endif
        db      00ah, 000h
        db      "TO BAR: "
        db      082h
        db      " loops "
        if      FW_VERSION >= 312
        db      01bh, 094h, 020h, 084h, 020h, 01bh, 077h, 00ah, 0eeh, 020h, 01bh, 056h, 020h, 01bh, 016h, 02eh
        db      00ah, 01bh, 012h
        db      ": seq stops "
        db      01bh, 056h, 020h, 01bh, 086h
        db      " (Play "
        db      0adh
        elseif  FW_VERSION = 311
        db      01bh, 0adh, 020h, 084h, 020h, 01bh, 060h, 00ah, 01bh, 018h, 020h, 01bh, 04ch, 020h, 0dbh, 02eh
        db      00ah, 01bh
        db      "2: seq stops "
        db      01bh, 04ch, 020h, 01bh, 09bh
        db      " (Play "
        db      0aah
        else
        db      01bh, 08eh, 020h, 084h, 020h, 01bh, 053h, 00ah, 01bh, 01fh, 020h, 01bh, 034h, 020h, 0d1h, 02eh
        db      00ah, 01bh
        db      "%: seq stops "
        db      01bh, 034h, 020h, 01bh
        db      "d (Play "
        db      0abh
        endif
        db      " Overdub"
        db      00ah
        db      "modes) "
        if      FW_VERSION >= 312
        db      0adh
        elseif  FW_VERSION = 311
        db      0aah
        else
        db      0abh
        endif
        db      " adds "
        if      FW_VERSION >= 312
        db      01bh, 00eh, 020h, 0ebh, 020h, 084h, 020h, 01bh, 086h, 020h, 028h, 01bh, 05eh, 00ah, 01bh
        db      "Q) until "
        db      0efh
        elseif  FW_VERSION = 311
        db      0f3h, 020h, 01bh, 004h, 020h, 084h, 020h, 01bh, 09bh, 020h, 028h, 01bh, 077h, 00ah, 01bh
        db      "P) until "
        db      0e0h
        else
        db      01bh, 01ah, 020h, 01bh, 007h, 020h, 084h, 020h, 01bh, 064h, 020h, 028h, 01bh, 062h, 00ah, 01bh
        db      "?) until "
        db      0d7h
        endif
        db      " stops."
        if      FW_VERSION >= 312
        db      00ah, 000h, 01bh, 060h, 020h, 01bh, 0ech
        db      " = TO BAR, "
        db      082h, 020h, 085h, 020h, 01bh, 08ah, 00ah, 01bh, 094h, 020h, 084h, 020h, 087h, 020h, 01bh, 077h
        db      020h, 0b6h, 020h, 0f1h
        elseif  FW_VERSION = 311
        db      00ah, 000h, 01bh
        db      "x Loop = TO BAR, "
        db      082h, 020h, 085h, 020h, 01bh, 0a6h, 00ah, 01bh, 0adh, 020h, 084h, 020h, 088h, 020h, 01bh, 060h
        db      020h, 0c1h, 020h, 0f5h
        else
        db      00ah, 000h, 01bh, 0c1h, 020h, 01bh, 0f5h
        db      " = TO BAR, "
        db      082h, 020h, 085h, 020h, 01bh, 08ah, 00ah, 01bh, 08eh, 020h, 084h, 020h, 086h, 020h, 01bh, 053h
        db      020h, 0bah, 020h, 0dch
        endif
        db      " reaches "
        if      FW_VERSION >= 312
        db      01bh, 087h, 00ah, 01bh, 086h, 02eh, 00ah, 000h, 089h, 020h, 0dbh, 020h, 088h
        db      " (1-99). Other "
        db      0e7h, 00ah, 0aeh, 020h, 087h, 020h, 01bh, 0cfh
        db      " contain "
        db      0a5h, 020h, 01bh, 022h, 00ah, 084h, 020h, 087h, 020h, 088h, 02eh, 00ah, 000h, 089h, 020h, 088h
        db      020h, 0a1h, 02eh, 020h, 01bh, 043h, 020h, 0c3h, 03ah, 020h, 08bh, 020h, 02bh, 02fh, 02dh, 00ah
        db      028h, 0b0h, 020h, 01bh, 026h, 020h, 084h, 020h, 01bh, 09eh, 020h, 01bh, 02fh, 029h, 02eh, 00ah
        db      "Type "
        db      0c5h, 020h, 0a1h, 02ch, 020h, 097h, 020h, 0d0h, 02eh, 00ah, 000h, 086h, 03ah, 020h, 01bh, 044h
        db      020h, 086h, 020h, 0a5h, 020h, 0c0h, 020h, 086h
        elseif  FW_VERSION = 311
        db      01bh, 0c5h, 00ah, 01bh, 09bh, 02eh, 00ah, 000h, 08bh, 020h, 0deh, 020h, 087h, 020h, 083h, 02eh
        db      020h, 0dah, 020h, 0cfh, 020h, 039h, 039h, 00ah, 0bfh, 020h, 0ach, 020h, 01bh, 035h, 020h, 09eh
        db      020h, 081h, 020h, 039h, 039h, 020h, 09dh, 02eh, 00ah, 01bh, 0e0h, 020h, 087h, 020h, 01bh, 02bh
        db      020h, 01bh, 0ceh, 020h, 01bh
        db      "[ drums "
        db      0aah, 00ah, 086h, 020h, 0a3h, 02eh, 020h, 08bh, 020h, 01bh, 022h, 020h, 0e7h, 020h, 0ach, 020h
        db      088h, 00ah, 01bh, 0e5h, 020h, 01bh, 0ceh, 020h, 0a3h, 020h, 01bh, 03dh, 020h, 084h, 020h, 088h
        db      00ah, 087h, 02eh, 00ah, 000h, 08bh, 020h, 031h, 036h, 02dh, 01bh, 023h, 020h, 087h, 020h, 0abh
        db      02eh, 00ah, 01bh, 04bh, 020h, 0c7h, 03ah, 020h, 089h, 020h, 02bh, 02fh, 02dh, 020h, 028h, 0b2h
        db      020h, 01bh, 042h, 020h, 084h, 00ah, 01bh, 09ah, 020h, 01bh, 0b8h, 020h, 01bh
        db      "H). Type "
        db      0d0h, 020h, 0abh, 02ch, 00ah, 09ch, 020h, 0ddh, 02eh, 00ah, 000h, 086h, 03ah, 020h, 01bh, 039h
        db      020h, 086h, 020h, 0a3h, 020h, 0b7h, 020h, 086h
        else
        db      01bh, 0a9h, 00ah, 01bh, 064h, 02eh, 00ah, 000h, 089h, 020h, 0e8h, 020h, 087h, 020h, 083h, 02eh
        db      020h, 0f4h, 020h, 0d6h, 020h, 039h, 039h, 00ah, 0e9h, 020h, 0b0h, 020h, 01bh, 05ah, 020h, 09dh
        db      020h, 081h, 020h, 039h, 039h, 020h, 09ch, 02eh, 00ah, 01bh, 0bch, 020h, 087h, 020h, 01bh, 036h
        db      020h, 01bh, 0adh, 020h, 01bh
        db      "K drums "
        db      0abh, 00ah, 08eh, 020h, 0a5h, 02eh, 020h, 089h, 020h, 01bh, 037h, 020h, 0ddh, 020h, 0b0h, 020h
        db      086h, 00ah, 01bh, 0b3h, 020h, 01bh, 0adh, 020h, 0a5h, 020h, 01bh, 028h, 020h, 084h, 020h, 086h
        db      00ah, 087h, 02eh, 00ah, 000h, 089h, 020h, 031h, 036h, 02dh, 01bh, 013h, 020h, 087h, 020h, 0adh
        db      02eh, 00ah, 01bh, 03ch, 020h, 0beh, 03ah, 020h, 088h, 020h, 02bh, 02fh, 02dh, 020h, 028h, 0aeh
        db      020h, 01bh, 032h, 020h, 084h, 00ah, 01bh, 0cbh, 020h, 01bh, 09dh, 020h, 01bh
        db      "8). Type "
        db      0c4h, 020h, 0adh, 02ch, 00ah, 09ah, 020h, 0d4h, 02eh, 00ah, 000h, 08eh, 03ah, 020h, 01bh, 027h
        db      020h, 08eh, 020h, 0a5h, 020h, 0b4h, 020h, 08eh
        endif
        db      " IN "
        if      FW_VERSION >= 312
        db      091h, 00ah, 0ach
        db      " out "
        db      01bh, 0edh, 020h, 086h
        elseif  FW_VERSION = 311
        db      08eh, 00ah, 0b0h, 020h, 01bh, 0fdh
        db      " thru "
        db      086h
        else
        db      091h, 00ah, 0afh, 020h, 01bh, 0d6h
        db      " thru "
        db      08eh
        endif
        db      " OUT."
        if      FW_VERSION >= 312
        db      00ah, 01bh, 050h, 03ah, 020h, 01bh, 044h, 020h, 0c0h
        elseif  FW_VERSION = 311
        db      00ah, 01bh, 04eh, 03ah, 020h, 01bh, 039h, 020h, 0b7h
        else
        db      00ah, 01bh, 049h, 03ah, 020h, 01bh, 027h, 020h, 0b4h
        endif
        db      " front panel "
        if      FW_VERSION >= 312
        db      01bh, 03ah, 020h, 01bh, 0f5h, 00ah, 028h, 0adh, 020h, 086h
        elseif  FW_VERSION = 311
        db      01bh, 057h, 020h, 01bh, 0ddh, 00ah, 028h, 0aah, 020h, 086h
        else
        db      01bh, 05ch, 020h, 01bh, 0b0h, 00ah, 028h, 0abh, 020h, 08eh
        endif
        db      " IN) "
        if      FW_VERSION >= 312
        db      091h, 020h, 0ach, 020h, 01bh, 021h, 020h, 08ah, 00ah, 01bh, 02dh, 02eh, 020h, 01bh, 050h, 020h
        db      0c1h, 020h, 0e2h, 020h, 01bh, 042h, 020h, 01bh, 09fh, 00ah
        elseif  FW_VERSION = 311
        db      08eh, 020h, 0b0h, 020h, 01bh, 016h, 020h, 08ah, 00ah, 01bh, 049h, 02eh, 020h, 01bh, 04eh, 020h
        db      0bfh, 020h, 0cfh, 020h, 01bh, 05ch, 020h, 01bh, 0d0h, 00ah
        else
        db      091h, 020h, 0afh, 020h, 01bh, 00ah, 020h, 08bh, 00ah, 01bh, 035h, 02eh, 020h, 01bh, 049h, 020h
        db      0e9h, 020h, 0d6h, 020h, 01bh, 03dh, 020h, 01bh, 0fbh, 00ah
        endif
        db      "TRANSPOSE "
        if      FW_VERSION >= 312
        db      01bh, 09ah, 02eh, 00ah, 000h, 01bh, 0b6h, 03ah, 020h, 087h, 020h, 088h, 020h, 085h, 020h, 0ach
        db      02eh, 00ah
        elseif  FW_VERSION = 311
        db      01bh, 01ch, 02eh, 00ah, 000h, 01bh, 0dch, 03ah, 020h, 088h, 020h, 087h, 020h, 085h, 020h, 0b0h
        db      02eh, 00ah
        else
        db      01bh, 003h, 02eh, 00ah, 000h
        db      "YES: "
        db      086h, 020h, 087h, 020h, 085h, 020h, 0afh, 02eh, 00ah
        endif
        db      "NO: "
        if      FW_VERSION >= 312
        db      087h, 020h, 088h, 020h, 099h
        elseif  FW_VERSION = 311
        db      088h, 020h, 087h, 020h, 096h
        else
        db      086h, 020h, 087h, 020h, 0a6h
        endif
        db      " muted."
        if      FW_VERSION >= 312
        db      00ah, 01bh, 097h
        elseif  FW_VERSION = 311
        db      00ah, 01bh, 0b3h
        else
        db      00ah, 01bh, 08bh
        endif
        db      " KEY 1 toggles "
        if      FW_VERSION >= 312
        db      01bh, 064h, 020h, 01bh, 0b6h, 020h, 091h
        elseif  FW_VERSION = 311
        db      01bh, 051h, 020h, 01bh, 0dch, 020h, 08eh
        else
        db      01bh
        db      "F YES "
        db      091h
        endif
        db      " NO."
        db      00ah, 000h
        db      "Active "
        if      FW_VERSION >= 312
        db      088h, 020h, 085h, 020h, 0ach, 020h, 01bh, 0edh, 020h, 087h, 020h, 086h, 00ah, 094h, 02eh, 020h
        db      0a3h, 020h, 022h, 030h, 022h, 020h, 0a4h, 020h, 01bh, 012h, 020h, 028h, 01bh, 088h, 020h, 086h
        db      00ah, 094h, 020h, 0cfh, 029h, 02eh, 00ah, 000h, 0fbh, 020h, 086h
        elseif  FW_VERSION = 311
        db      087h, 020h, 085h, 020h, 0b0h
        db      " thru "
        db      088h, 020h, 086h, 00ah, 09ah, 02eh, 020h, 0a6h, 020h, 022h, 030h, 022h, 020h, 0a5h, 020h, 01bh
        db      032h, 020h, 028h, 01bh, 09fh, 020h, 086h, 00ah, 09ah, 020h, 0c4h, 029h, 02eh, 00ah, 000h, 01bh
        db      001h, 020h, 086h
        else
        db      087h, 020h, 085h, 020h, 0afh
        db      " thru "
        db      086h, 020h, 08eh, 00ah, 0a9h, 02eh, 020h, 0a2h, 020h, 022h, 030h, 022h, 020h, 0a4h, 020h, 01bh
        db      025h, 020h, 028h, 01bh, 097h, 020h, 08eh, 00ah, 0a9h, 020h, 0cdh, 029h, 02eh, 00ah, 000h, 01bh
        db      009h, 020h, 08eh
        endif
        db      " OUT "
        if      FW_VERSION >= 312
        db      01bh, 0c7h, 020h, 028h
        db      "A-D) "
        db      01bh, 0edh, 020h, 0b1h, 00ah, 087h, 020h, 088h, 027h, 073h, 020h, 086h, 020h, 0a5h, 020h, 085h
        db      00ah, 096h, 020h, 01bh, 038h, 02eh, 020h, 01bh, 060h, 020h, 022h, 01bh, 012h, 022h, 020h, 099h
        db      020h, 01bh, 073h, 02ch, 020h, 0e1h, 020h, 0feh, 00ah, 094h, 020h, 09dh, 020h, 028h, 084h, 020h
        db      01bh, 014h, 029h, 020h, 084h, 020h, 031h, 02dh, 031h, 036h, 02eh, 00ah, 000h, 089h, 020h, 038h
        db      02dh, 01bh, 083h, 020h, 0a1h, 020h, 0a4h, 020h, 087h, 020h, 086h, 00ah, 094h
        db      "/port, usually named "
        db      0a4h
        elseif  FW_VERSION = 311
        db      01bh, 0d1h
        db      " (A-D) thru "
        db      0b3h, 00ah, 088h, 020h, 087h, 027h, 073h, 020h, 086h, 020h, 0a3h, 020h, 085h, 020h, 097h, 020h
        db      01bh, 058h, 02eh, 00ah, 01bh, 078h, 020h, 022h, 01bh, 032h, 022h, 020h, 096h, 020h, 01bh, 00dh
        db      02ch, 020h, 0feh, 020h, 01bh, 00fh, 020h, 09ah, 00ah, 0a0h, 020h, 028h, 084h, 020h, 01bh, 034h
        db      029h, 020h, 084h, 020h, 031h, 02dh, 031h, 036h, 02eh, 00ah, 000h, 08bh, 020h, 038h, 02dh, 01bh
        db      023h, 020h, 0abh, 020h, 0a5h, 020h, 088h, 020h, 086h, 00ah, 09ah, 02fh, 0b5h
        db      ", usually named "
        db      0a5h
        else
        db      01bh, 0f2h
        db      " (A-D) thru "
        db      0b3h, 00ah, 086h, 020h, 087h, 027h, 073h, 020h, 08eh, 020h, 0a5h, 020h, 085h, 020h, 098h, 020h
        db      01bh, 089h, 02eh, 00ah, 01bh, 0c1h, 020h, 022h, 01bh, 025h, 022h, 020h, 0a6h, 020h, 01bh, 012h
        db      02ch, 020h, 0f6h, 020h, 01bh, 018h, 020h, 0a9h, 00ah, 0a0h, 020h, 028h, 084h, 020h, 01bh, 031h
        db      029h, 020h, 084h, 020h, 031h, 02dh, 031h, 036h, 02eh, 00ah, 000h, 089h, 020h, 038h, 02dh, 01bh
        db      013h, 020h, 0adh, 020h, 0a4h, 020h, 086h, 020h, 08eh, 00ah, 0a9h, 02fh, 0c7h
        db      ", usually named "
        db      0a4h
        endif
        db      " synth"
        if      FW_VERSION >= 312
        db      00ah, 01bh, 02ch, 020h, 084h, 020h, 0f1h, 02eh, 020h, 08ch, 020h, 099h, 020h, 01bh, 04ah, 020h
        db      0aeh
        elseif  FW_VERSION = 311
        db      00ah, 01bh, 000h, 020h, 084h, 020h, 0f5h
        db      ". Name "
        db      096h, 020h, 0fdh, 020h, 0ach
        else
        db      00ah, 01bh, 06ah, 020h, 084h, 020h, 0dch
        db      ". Name "
        db      0a6h, 020h, 01bh, 09ch, 020h, 0b0h
        endif
        db      " PAR"
        if      FW_VERSION >= 312
        db      00ah, 08fh, 02eh, 00ah, 000h, 089h, 020h, 01bh, 063h, 020h, 086h, 020h, 0b5h, 020h, 094h, 02eh
        db      00ah, 01bh, 057h, 020h, 088h, 020h, 084h, 020h, 0ach
        db      " through a "
        db      01bh, 05fh, 00ah, 086h, 020h, 094h, 020h, 01bh, 00fh, 02eh, 020h, 0a3h, 020h, 031h, 02dh, 031h
        db      036h, 00ah, 0adh, 020h, 022h, 030h, 022h, 020h, 0a4h, 020h, 01bh, 012h, 02eh, 00ah, 000h, 0fbh
        db      020h, 01bh, 063h, 020h, 086h
        elseif  FW_VERSION = 311
        db      00ah, 091h, 02ch, 020h, 01bh, 01eh, 020h, 0ach
        db      " SEQ "
        db      0aah, 020h, 01bh, 040h, 020h, 091h, 02eh, 00ah, 000h, 08bh, 020h, 01bh, 097h, 020h, 086h, 020h
        db      0b5h, 020h, 09ah, 02eh, 00ah, 01bh, 072h, 020h, 087h, 020h, 084h, 020h, 0b0h
        db      " through a second"
        db      00ah, 086h, 020h, 09ah, 020h, 01bh, 029h, 02eh, 020h, 0a6h, 020h, 031h, 02dh, 031h, 036h, 00ah
        db      0aah, 020h, 022h, 030h, 022h, 020h, 0a5h, 020h, 01bh, 032h, 02eh, 00ah, 000h, 01bh, 001h, 020h
        db      01bh, 097h, 020h, 086h
        else
        db      00ah, 093h, 02ch, 020h, 01bh, 039h, 020h, 0b0h
        db      " SEQ "
        db      0abh, 020h, 01bh, 02fh, 020h, 093h, 02eh, 00ah, 000h, 089h, 020h, 01bh, 06fh, 020h, 08eh, 020h
        db      0c7h, 020h, 0a9h, 02eh, 00ah, 01bh, 061h, 020h, 087h, 020h, 084h, 020h, 0afh
        db      " through a "
        db      01bh, 0edh, 00ah, 08eh, 020h, 0a9h, 020h, 01bh, 019h, 02eh, 020h, 0a2h, 020h, 031h, 02dh, 031h
        db      036h, 00ah, 0abh, 020h, 022h, 030h, 022h, 020h, 0a4h, 020h, 01bh, 025h, 02eh, 00ah, 000h, 01bh
        db      009h, 020h, 01bh, 06fh, 020h, 08eh
        endif
        db      " OUT "
        if      FW_VERSION >= 312
        db      01bh, 0c7h, 020h, 028h, 041h, 02dh, 044h, 029h, 00ah, 01bh, 0edh, 020h, 0b1h, 020h, 087h, 020h
        db      088h, 027h, 073h, 020h, 086h, 020h, 0a5h, 020h, 085h, 00ah, 096h, 020h, 01bh, 038h, 02eh, 00ah
        db      01bh, 060h, 020h, 022h, 01bh, 012h, 022h, 020h, 099h, 020h, 01bh, 073h, 02ch, 020h, 0e1h, 020h
        db      0feh, 020h, 094h, 00ah, 09dh, 020h, 028h, 084h, 020h, 01bh, 014h, 029h, 020h, 084h, 020h, 031h
        db      02dh, 031h, 036h, 02eh, 00ah, 000h, 01bh, 0e0h, 020h, 0adh
        elseif  FW_VERSION = 311
        db      01bh, 0d1h, 020h, 028h, 041h, 02dh, 044h, 029h, 00ah
        db      "thru "
        db      0b3h, 020h, 088h, 020h, 087h, 027h, 073h, 020h, 086h, 020h, 0a3h, 020h, 085h, 00ah, 097h, 020h
        db      01bh, 058h, 02eh, 00ah, 01bh, 078h, 020h, 022h, 01bh, 032h, 022h, 020h, 096h, 020h, 01bh, 00dh
        db      02ch, 020h, 0feh, 020h, 01bh, 00fh, 020h, 09ah, 00ah, 0a0h, 020h, 028h, 084h, 020h, 01bh, 034h
        db      029h, 020h, 084h, 020h, 031h, 02dh, 031h, 036h, 02eh, 00ah, 000h, 01bh, 0f9h, 020h, 0aah
        else
        db      01bh, 0f2h, 020h, 028h, 041h, 02dh, 044h, 029h, 00ah
        db      "thru "
        db      0b3h, 020h, 086h, 020h, 087h, 027h, 073h, 020h, 08eh, 020h, 0a5h, 020h, 085h, 00ah, 098h, 020h
        db      01bh, 089h, 02eh, 00ah, 01bh, 0c1h, 020h, 022h, 01bh, 025h, 022h, 020h, 0a6h, 020h, 01bh, 012h
        db      02ch, 020h, 0f6h, 020h, 01bh, 018h, 020h, 0a9h, 00ah, 0a0h, 020h, 028h, 084h, 020h, 01bh, 031h
        db      029h, 020h, 084h, 020h, 031h, 02dh, 031h, 036h, 02eh, 00ah, 000h, 01bh, 0dbh, 020h, 0abh
        endif
        db      " decreases "
        if      FW_VERSION >= 312
        db      01bh, 0cdh, 020h, 09eh, 00ah, 0aah, 020h, 0e6h, 020h, 0c0h, 020h, 087h, 020h, 088h, 02eh, 020h
        db      028h, 031h, 030h, 030h, 025h, 020h, 03dh, 00ah, 01bh, 088h, 020h, 0a2h, 029h, 02eh, 00ah, 000h
        db      08ch, 020h, 086h
        db      " Program "
        db      01bh, 0e6h, 020h, 028h, 031h, 02dh, 031h, 032h, 038h, 020h, 0adh, 020h, 01bh, 012h, 029h, 00ah
        db      085h, 020h, 096h, 020h, 01bh
        db      "8 out "
        db      0a4h, 020h, 087h, 020h, 088h, 020h, 0b6h, 00ah, 081h, 020h, 082h, 020h, 099h, 020h, 08dh
        elseif  FW_VERSION = 311
        db      01bh, 06eh, 020h, 09eh, 00ah, 0aeh, 020h, 0f4h, 020h, 0b7h, 020h, 088h, 020h, 087h, 02eh, 00ah
        db      01bh, 095h, 03ah, 020h, 030h, 02dh, 032h, 030h, 030h, 025h, 020h, 028h, 031h, 030h, 030h, 025h
        db      020h, 03dh, 020h, 01bh, 09fh, 020h, 0a2h, 029h, 02eh, 00ah
        db      "Good "
        db      0a5h
        db      " real-"
        db      0afh
        db      " dynamics "
        db      01bh, 0d6h, 02eh, 00ah, 000h, 08dh, 020h, 087h, 027h, 073h, 020h, 086h
        db      " Program Change Number"
        db      00ah, 028h, 031h, 02dh, 031h, 032h, 038h, 029h, 020h, 085h, 020h, 097h, 020h, 01bh, 058h, 020h
        db      01bh, 0fdh, 020h, 0c1h, 020h, 088h, 00ah, 082h, 020h, 096h, 020h, 08ch
        db      ", but "
        db      0ffh
        db      " over "
        db      081h, 00ah
        db      "leftmost "
        db      09eh, 020h, 081h, 020h, 01bh, 0fah
        db      " CHN "
        db      0a0h, 027h, 073h, 00ah, 0cdh, 020h, 01bh, 0a8h
        else
        db      01bh, 058h, 020h, 09dh, 00ah, 0a8h, 020h, 0ech, 020h, 0b4h, 020h, 086h, 020h, 087h, 02eh, 00ah
        db      01bh, 07ah, 03ah, 020h, 030h, 02dh, 032h, 030h, 030h, 025h, 020h, 028h, 031h, 030h, 030h, 025h
        db      020h, 03dh, 020h, 01bh, 097h, 020h, 09bh, 029h, 02eh, 00ah
        db      "Good "
        db      0a4h
        db      " real-"
        db      0ach
        db      " dynamics "
        db      01bh, 0afh, 02eh, 00ah, 000h, 08dh, 020h, 08eh
        db      " Program "
        db      01bh, 0f7h, 020h, 01bh, 0e9h, 020h, 028h, 031h, 02dh, 031h, 032h, 038h, 029h, 00ah, 085h, 020h
        db      098h, 020h, 01bh, 089h, 020h, 01bh, 0d6h, 020h, 0a4h, 020h, 086h, 020h, 087h, 020h, 0bah, 00ah
        db      086h, 020h, 082h, 020h, 0a6h, 020h, 08ah, 02eh, 00ah, 030h, 020h, 03dh, 020h, 01bh, 097h, 020h
        db      08ch, 020h, 09bh
        endif
        db      ". For "
        if      FW_VERSION >= 312
        db      01bh, 050h, 00ah, 0c1h, 02ch, 020h, 01bh, 069h, 036h, 030h, 020h, 01bh, 03ah, 020h, 01bh, 08bh
        db      020h, 0e2h, 00ah, 08dh, 02eh, 00ah, 000h, 0a3h
        elseif  FW_VERSION = 311
        db      01bh, 04eh, 020h, 0bfh, 02ch, 00ah, 01bh, 064h, 033h, 030h, 030h, 030h, 020h, 01bh, 0aeh, 020h
        db      031h, 02dh, 032h, 034h, 020h, 085h, 020h, 097h, 020h, 08ch, 00ah, 028h, 032h, 035h, 02dh, 031h
        db      032h, 038h, 020h, 0cfh
        db      " mapped "
        db      084h, 020h, 032h, 034h, 029h, 02eh, 00ah, 000h, 0a6h
        else
        db      01bh, 049h, 020h, 0e9h, 02ch, 00ah
        db      "MPC3000 "
        db      08ch, 020h, 031h, 02dh, 032h, 034h, 020h, 085h, 020h, 098h, 020h, 08ah, 00ah, 028h, 01bh, 093h
        db      020h, 032h, 035h, 02dh, 031h, 032h, 038h, 020h, 0d6h
        db      " mapped "
        db      084h, 020h, 032h, 034h, 029h, 02eh, 00ah, 000h, 0a2h
        endif
        db      " up "
        db      084h
        db      " 3 markers ("
        if      FW_VERSION >= 312
        db      01bh, 024h, 02eh, 0e3h, 02eh, 0e4h, 029h, 02ch, 00ah, 091h, 020h, 08bh, 020h, 01bh, 097h
        elseif  FW_VERSION = 311
        db      01bh, 03fh, 02eh, 0f0h, 02eh, 0f1h, 029h, 02ch, 00ah, 08eh, 020h, 089h, 020h, 01bh, 0b3h
        else
        db      01bh, 02eh, 02eh, 0e7h, 02eh, 0e5h, 029h, 02ch, 00ah, 091h, 020h, 088h, 020h, 01bh, 08bh
        endif
        db      " KEY 1, 2, "
        if      FW_VERSION >= 312
        db      0adh, 020h, 033h, 020h, 084h, 020h, 01bh, 0cch, 00ah, 084h, 020h, 0cch, 020h, 09eh
        db      " them. Or "
        db      08bh
        db      " LOCATE "
        db      01bh, 019h, 00ah, 084h, 020h, 01bh, 0cch, 020h, 084h
        db      " marker "
        db      0a7h
        db      " cursor."
        db      00ah, 09fh, 020h, 03ch, 01bh
        db      "b'Now'> "
        db      084h, 020h, 0f0h
        db      " present"
        db      00ah, 093h, 020h, 0d1h
        db      " marker."
        db      00ah, 000h, 08eh, 020h, 081h, 020h, 01bh, 013h, 020h, 01bh, 0aeh, 02eh, 00ah, 000h, 01bh, 06ah
        db      020h, 022h, 053h, 045h, 051h, 022h, 020h, 08fh, 02ch, 020h, 0a7h, 020h, 0cch, 00ah, 082h, 02eh
        db      00ah, 000h
        db      "Selected "
        db      082h, 027h, 073h, 020h, 0a1h, 02eh, 00ah, 01bh, 043h, 020h, 0c3h, 020h, 0f1h, 020h, 0c8h
        db      " saving, "
        db      08bh, 020h, 02bh, 02fh, 02dh, 02ch, 00ah, 0c7h, 020h, 0c5h, 020h, 0a1h, 02ch, 020h, 097h, 020h
        db      0d0h, 02eh, 00ah, 000h
        db      "Save a "
        db      082h, 020h, 0aeh
        db      " native (SEQ) "
        db      0adh, 00ah, 0b2h, 020h, 086h, 020h, 01bh
        db      "< (MID) formats. MID"
        db      00ah, 0f4h
        db      " 0 merges "
        db      0bah
        db      " your "
        db      0c1h, 020h, 0d1h, 020h, 061h, 00ah, 01bh, 036h, 020h, 088h
        db      ".  MID "
        db      0f4h
        db      " 1 maintains"
        db      00ah, 088h
        db      " separation.  Some devices "
        db      0fch, 00ah
        db      "support "
        db      0f4h, 020h, 030h, 02eh, 020h, 020h, 089h, 020h, 01bh, 069h, 033h, 030h, 030h, 030h, 020h, 01bh
        db      074h, 020h, 01bh, 091h, 00ah, 091h, 020h, 0f0h, 020h, 0f4h
        db      " 0 faster "
        db      01bh, 028h, 020h, 0f4h, 020h, 031h, 02eh, 00ah, 000h, 01bh, 05bh, 020h, 081h, 020h, 094h, 020h
        db      091h
        db      " port "
        db      0cfh, 00ah, 084h
        db      " map your "
        db      01bh, 069h, 033h, 030h, 030h, 030h, 020h, 01bh, 03ah, 020h, 0c1h, 020h, 084h, 020h, 0aeh, 00ah
        db      081h, 020h, 0b2h, 020h, 086h, 020h, 01bh, 03ch, 02eh, 020h, 089h, 020h, 01bh, 0d0h, 00ah, 0a4h
        db      020h, 01bh, 0c1h, 020h, 086h, 020h, 099h, 020h, 031h, 030h, 041h, 02eh, 00ah, 000h, 01bh, 06ah
        db      020h, 022h, 01bh, 02eh, 022h, 020h, 08fh, 02ch, 020h, 0a7h, 020h, 0bah, 020h, 039h, 039h, 00ah
        db      09ch, 020h, 091h, 020h, 032h, 030h, 020h, 01bh, 0e1h, 02eh, 020h, 01bh, 043h, 020h, 0c3h, 03ah
        db      00ah, 08bh, 020h, 02bh, 02fh, 02dh, 02ch, 020h, 0c7h, 020h, 0c5h, 020h, 0a1h, 02ch, 020h, 097h
        db      020h, 0d0h, 02eh, 00ah, 000h, 01bh, 06ah, 020h, 022h, 053h, 04eh, 044h, 022h, 020h, 08fh, 02ch
        db      020h, 0a7h, 020h, 0cch, 020h, 08ah, 02eh, 00ah, 08eh, 020h, 08ah, 020h, 0f6h, 020h, 01bh, 041h
        db      020h, 084h, 020h, 01bh, 091h, 020h, 028h, 08bh, 020h, 061h, 00ah, 01bh, 025h, 029h, 020h, 097h
        db      020h, 08bh, 020h, 03ch, 01bh, 084h, 020h, 0f1h, 03eh, 02eh, 00ah, 000h, 01bh, 06ah, 020h, 022h
        db      050h, 047h, 04dh, 022h, 020h, 08fh, 020h, 028h, 0a7h, 020h, 08ah, 00ah, 0e8h, 020h, 091h, 020h
        db      08ah
        db      " design "
        db      0a5h, 029h, 02ch, 00ah, 097h, 020h, 01bh, 027h, 020h, 08ah, 020h, 08fh, 020h, 01bh, 010h, 020h
        db      01bh, 09fh, 020h, 090h, 02eh, 00ah, 000h
        db      "Selected "
        db      090h, 027h, 073h, 020h, 0a1h, 02eh, 00ah, 01bh, 043h, 020h, 0c3h, 020h, 0f1h, 020h, 0c8h
        db      " saving, "
        db      08bh, 020h, 02bh, 02fh, 02dh, 02ch, 00ah, 0c7h, 020h, 0c5h, 020h, 0a1h, 02ch, 020h, 097h, 020h
        db      0d0h, 02eh, 00ah, 000h
        db      "Save "
        db      081h, 020h, 090h, 020h, 08fh
        db      " alone ("
        db      01bh, 088h, 020h, 0bdh, 029h, 00ah, 0adh, 020h, 01bh, 0beh, 020h, 01bh, 091h, 020h, 0bah, 020h
        db      0bdh, 020h, 0f1h, 020h, 01bh, 07ah, 00ah, 028h, 01bh, 00ah, 029h, 02eh, 00ah, 000h, 01bh, 060h
        db      020h, 0cch, 020h, 09eh, 020h, 081h, 020h, 0bdh, 020h, 084h, 020h, 096h, 020h, 01bh, 04ah, 020h
        db      01bh, 0b2h, 00ah, 081h, 020h, 01bh, 093h, 020h, 0a1h
        db      " as a "
        db      08ah, 020h, 0e9h, 020h, 095h, 03ah, 00ah
        db      "NO: "
        db      089h, 020h, 08ah
        db      " isn't "
        db      01bh, 04ah, 02eh, 00ah, 01bh, 0b6h, 03ah, 020h, 089h, 020h, 08ah, 020h, 099h, 020h, 01bh, 04ah
        db      02ch, 020h, 01bh, 065h, 020h, 081h, 00ah, 08ah, 020h, 0e9h, 020h, 095h, 02eh, 00ah, 000h, 01bh
        db      06ah, 020h, 022h, 041h, 050h, 053h, 022h, 020h, 08fh, 020h, 028h, 0a7h, 020h, 0bah, 020h, 038h
        db      00ah, 01bh, 08bh, 029h, 020h, 097h, 020h, 01bh, 027h, 020h, 08ah, 020h, 08fh, 00ah, 01bh, 035h
        db      020h, 0aeh, 020h, 0b4h, 02eh, 020h, 01bh, 043h, 020h, 0c3h, 03ah, 020h, 08bh, 00ah, 02bh, 02fh
        db      02dh, 02ch, 020h, 0c7h, 020h, 0c5h, 020h, 0a1h, 02ch, 020h, 097h, 020h, 0d0h, 02eh, 00ah, 000h
        db      "Save "
        db      081h
        db      " APS "
        db      08fh
        db      " alone ("
        db      01bh, 088h, 020h, 0bdh, 029h, 00ah, 0adh, 020h, 01bh, 0beh, 020h, 01bh, 091h, 020h, 0bah, 020h
        db      0bdh, 020h, 0aeh, 020h, 0b4h, 00ah, 028h, 01bh, 00ah, 029h, 02eh, 00ah, 000h, 01bh, 06ah, 020h
        db      022h, 050h, 041h, 052h, 022h, 020h, 08fh, 02ch, 020h, 0a7h
        db      " those"
        db      00ah, 0fah, 020h, 0edh, 020h, 0e2h
        db      " retained "
        db      0d3h, 020h, 01bh, 0ach, 00ah, 01bh, 0d2h, 020h, 028h, 086h, 020h, 01bh, 047h, 020h, 01bh, 01fh
        db      02ch, 020h, 086h, 00ah, 094h
        db      " names, etc.) "
        db      01bh, 043h, 020h, 0c3h, 03ah, 00ah, 08bh, 020h, 02bh, 02fh, 02dh, 02ch, 020h, 0c7h, 020h, 0c5h
        db      020h, 0a1h, 02ch, 020h, 097h, 020h, 0d0h, 02eh, 00ah, 000h, 01bh, 09dh, 020h, 01bh, 098h, 020h
        db      01bh, 03eh, 020h, 084h, 020h, 09bh, 020h, 08fh, 02ch, 020h, 097h, 00ah, 08bh, 020h, 03ch, 01bh
        db      "b>, <Erase> "
        db      0adh
        elseif  FW_VERSION = 311
        db      0aah, 020h, 033h, 020h, 084h, 020h, 01bh, 0e1h, 00ah, 084h, 020h, 0d1h, 020h, 09eh, 020h, 01bh
        db      0e9h
        db      ". Or "
        db      089h
        db      " LOCATE "
        db      0eeh, 00ah, 084h, 020h, 01bh, 0e1h, 020h, 084h
        db      " marker "
        db      09fh
        db      " cursor."
        db      00ah, 092h, 020h, 03ch, 01bh, 0d9h, 027h
        db      "Now'> "
        db      084h, 020h, 0dfh
        db      " present"
        db      00ah, 099h, 020h, 0d9h
        db      " marker."
        db      00ah, 000h, 092h, 020h, 061h, 020h, 083h, 020h, 01bh, 0a3h, 020h, 084h, 020h, 093h, 020h, 01bh
        db      0ach, 020h, 01bh, 008h, 02eh, 00ah, 000h, 01bh, 080h, 020h, 061h, 020h, 082h, 020h, 091h
        db      " as a "
        db      022h, 053h, 045h, 051h, 022h, 020h, 0aah, 00ah, 022h, 04dh, 049h, 044h, 022h, 020h, 091h, 02ch
        db      020h, 09fh, 020h, 0d1h, 020h, 082h, 02eh, 00ah, 08fh, 020h, 082h, 020h, 083h, 020h, 084h, 020h
        db      01bh, 0a4h, 020h, 08eh, 00ah, 022h
        db      "Save As"
        db      022h, 020h, 0ceh, 02ch, 020h, 09ch, 020h, 089h, 020h, 03ch, 01bh, 061h, 020h, 0f5h, 03eh, 02eh
        db      00ah, 01bh, 00bh, 020h, 01bh, 0b1h, 020h, 08eh, 020h, 0f6h, 020h, 09eh, 020h, 01bh, 0e4h, 020h
        db      094h, 020h, 01bh, 081h, 00ah, 0cfh, 020h, 01bh, 00dh, 020h, 01bh, 04ch, 020h, 0dbh, 02eh, 00ah
        db      000h
        db      "Selected "
        db      082h, 027h, 073h, 020h, 0abh, 02eh, 00ah, 01bh, 04bh, 020h, 0c7h, 020h, 0f5h, 020h, 0d2h
        db      " saving, "
        db      089h, 020h, 02bh, 02fh, 02dh, 02ch, 00ah, 0ceh, 020h, 0d0h, 020h, 0abh, 02ch, 020h, 09ch, 020h
        db      0ddh, 02eh, 00ah, 000h
        db      "Save a "
        db      082h, 020h, 0ach
        db      " native (SEQ) "
        db      0aah, 00ah, 0b6h, 020h, 086h, 020h, 01bh, 00bh
        db      " (MID) formats. MID"
        db      00ah, 01bh, 005h
        db      " 0 merges "
        db      0b9h
        db      " your "
        db      0bfh, 020h, 0d9h, 020h, 061h, 00ah, 01bh, 03eh, 020h, 087h
        db      ".  MID "
        db      01bh, 005h
        db      " 1 maintains"
        db      00ah, 087h
        db      " separation.  Some devices "
        db      0ffh, 00ah
        db      "support "
        db      01bh, 005h, 020h, 030h, 02eh, 020h, 020h, 08bh, 020h, 01bh, 064h, 033h, 030h, 030h, 030h, 020h
        db      01bh, 02bh, 020h, 01bh, 0a4h, 00ah, 08eh, 020h, 0dfh, 020h, 01bh, 005h
        db      " 0 faster "
        db      01bh, 041h, 020h, 01bh, 005h, 020h, 031h, 02eh, 00ah, 000h, 01bh, 073h, 020h, 081h, 020h, 09ah
        db      020h, 08eh
        db      " port "
        db      0c4h, 00ah, 084h
        db      " map your "
        db      01bh, 064h, 033h, 030h, 030h, 030h, 020h, 01bh, 057h, 020h, 0bfh, 020h, 084h, 020h, 0ach, 00ah
        db      081h, 020h, 0b6h, 020h, 086h, 020h, 01bh, 00bh, 02eh, 020h, 08bh
        db      " default"
        db      00ah, 0a5h, 020h, 01bh, 0dfh, 020h, 086h, 020h, 096h, 020h, 031h, 030h, 041h, 02eh, 00ah, 000h
        db      01bh, 080h, 020h, 022h, 01bh, 040h, 022h, 020h, 091h, 02ch, 020h, 09fh, 020h, 0b9h, 020h, 039h
        db      039h, 00ah, 09dh, 020h, 08eh, 020h, 032h, 030h, 020h, 01bh, 0f6h, 02eh, 020h, 01bh, 04bh, 020h
        db      0c7h, 03ah, 00ah, 089h, 020h, 02bh, 02fh, 02dh, 02ch, 020h, 0ceh, 020h, 0d0h, 020h, 0abh, 02ch
        db      020h, 09ch, 020h, 0ddh, 02eh, 00ah, 01bh, 00bh, 020h, 01bh, 0b1h, 020h, 08eh, 020h, 0f6h, 020h
        db      09eh, 020h, 01bh, 0e4h, 020h, 094h, 020h, 01bh, 081h, 00ah, 0cfh, 020h, 01bh, 00dh, 020h, 01bh
        db      04ch, 020h, 0dbh, 02eh, 00ah, 000h, 01bh, 080h, 020h, 022h, 053h, 04eh, 044h, 022h, 020h, 091h
        db      02ch, 020h, 09fh, 020h, 0d1h, 020h, 08ah, 02eh, 00ah, 08fh, 020h, 08ah, 020h, 0ebh, 020h, 01bh
        db      01bh, 020h, 084h, 020h, 01bh, 0a4h, 020h, 028h, 0ebh, 020h, 01bh, 02bh, 00ah, 089h, 020h, 061h
        db      020h, 01bh, 033h, 029h, 020h, 09ch, 020h, 089h, 020h, 03ch, 01bh, 061h, 020h, 0f5h, 03eh, 02eh
        db      020h, 01bh, 00bh, 00ah, 01bh, 0b1h, 020h, 08eh, 020h, 0f6h, 020h, 09eh, 020h, 01bh, 0e4h, 020h
        db      094h, 020h, 01bh, 081h, 020h, 0cfh, 00ah, 01bh, 00dh, 020h, 01bh, 04ch, 020h, 0dbh, 02eh, 00ah
        db      000h, 01bh, 080h, 020h, 022h, 050h, 047h, 04dh, 022h, 020h, 091h, 02ch, 020h, 09fh, 020h, 090h
        db      027h, 073h, 00ah, 08ah, 020h, 0c4h, 02ch, 020h, 08ah, 020h, 01bh, 0fbh, 020h, 0a3h, 02ch, 00ah
        db      08eh, 020h, 01bh, 035h, 020h, 08ah, 020h, 091h, 020h, 0fah, 020h, 01bh, 0d0h, 020h, 090h, 02eh
        db      00ah, 01bh, 00bh, 020h, 01bh, 0b1h, 020h, 08eh, 020h, 0f6h, 020h, 09eh, 020h, 01bh, 0e4h, 020h
        db      094h, 020h, 01bh, 081h, 00ah, 0cfh, 020h, 01bh, 00dh, 020h, 01bh, 04ch, 020h, 0dbh, 02eh, 00ah
        db      000h
        db      "Selected "
        db      090h, 027h, 073h, 020h, 0abh, 02eh, 00ah, 01bh, 04bh, 020h, 0c7h, 020h, 0f5h, 020h, 0d2h
        db      " saving, "
        db      089h, 020h, 02bh, 02fh, 02dh, 02ch, 00ah, 0ceh, 020h, 0d0h, 020h, 0abh, 02ch, 020h, 09ch, 020h
        db      0ddh, 02eh, 00ah, 000h, 01bh, 094h
        db      "+SOUNDS: "
        db      08bh
        db      " PGM "
        db      091h, 020h, 08eh, 020h, 0b9h, 00ah, 0a1h, 020h, 0fah, 020h, 0ach, 020h, 081h, 020h, 090h, 020h
        db      0cfh, 020h, 0fdh, 02eh, 00ah, 01bh, 094h, 020h, 01bh, 0b2h
        db      ": Only "
        db      081h
        db      " PGM "
        db      091h, 020h, 096h, 00ah, 0fdh, 02dh, 02dh, 020h, 01bh, 09fh, 020h, 0a1h, 02eh, 00ah, 000h, 01bh
        db      078h, 020h, 0d1h, 020h, 09eh, 020h, 081h, 020h, 0a1h, 020h, 084h, 020h, 097h, 020h, 0fdh, 020h
        db      01bh, 07bh, 00ah, 081h, 020h, 01bh, 0e8h, 020h, 0abh
        db      " as a "
        db      08ah, 020h, 0eah, 020h, 094h, 03ah, 00ah
        db      "NO: "
        db      08bh, 020h, 08ah
        db      " isn't "
        db      0fdh, 02eh, 00ah, 01bh, 0dch, 03ah, 020h, 08bh, 020h, 08ah, 020h, 096h, 020h, 0fdh, 02ch, 020h
        db      01bh, 045h, 020h, 081h, 00ah, 08ah, 020h, 0eah, 020h, 094h, 02eh, 00ah, 000h, 01bh, 080h, 020h
        db      022h, 041h, 050h, 053h, 022h, 020h, 091h, 02ch, 020h, 09fh, 020h, 0b9h, 020h, 032h, 034h, 00ah
        db      01bh, 0aeh, 020h, 08eh, 020h, 01bh, 035h, 020h, 08ah, 020h, 01bh, 026h, 020h, 0ach, 00ah, 0b1h
        db      02eh, 020h, 01bh, 04bh, 020h, 0c7h, 03ah, 020h, 089h, 020h, 02bh, 02fh, 02dh, 02ch, 020h, 0ceh
        db      020h, 0d0h, 00ah, 0abh, 02ch, 020h, 09ch, 020h, 0ddh, 02eh, 020h, 01bh, 00bh, 020h, 01bh, 0b1h
        db      020h, 08eh, 020h, 0f6h, 00ah, 09eh, 020h, 01bh, 0e4h, 020h, 094h, 020h, 01bh, 081h, 020h, 0cfh
        db      020h, 01bh, 00dh, 020h, 01bh, 04ch, 020h, 0dbh, 02eh, 00ah, 000h
        db      "APG FILE + SOUNDS: "
        db      08bh
        db      " APG "
        db      091h, 020h, 08eh, 020h, 0b9h, 00ah, 0a1h, 020h, 0ach, 020h, 0b1h, 020h, 0cfh, 020h, 0fdh, 02eh
        db      00ah
        db      "APG FILE "
        db      01bh, 0b2h
        db      ": Only "
        db      081h
        db      " APG "
        db      091h, 020h, 096h, 00ah, 0fdh, 02dh, 02dh, 020h, 01bh, 09fh, 020h, 0a1h, 02eh, 00ah, 000h, 01bh
        db      080h, 020h, 022h, 050h, 041h, 052h, 022h, 020h, 091h, 02ch, 020h, 09fh, 020h, 0f8h, 00ah, 09eh
        db      " most "
        db      0a3h, 020h, 0e7h, 020h, 01bh, 01eh, 020h, 0fdh, 020h, 0ach, 020h, 01bh, 022h, 00ah, 01bh, 092h
        db      ", such as "
        db      086h, 020h, 01bh, 04ah, 020h, 01bh, 03bh, 02ch, 020h, 086h, 00ah, 09ah
        db      " names, etc. ("
        db      01bh, 088h, 020h, 0f8h, 020h, 0cfh, 00ah
        db      "retained "
        db      0d8h, 020h, 01bh, 05fh, 020h, 01bh, 0f2h, 02eh, 029h, 020h, 01bh, 04bh, 020h, 0c7h, 03ah, 00ah
        db      089h, 020h, 02bh, 02fh, 02dh, 02ch, 020h, 0ceh, 020h, 0d0h, 020h, 0abh, 02ch, 020h, 09ch, 020h
        db      0ddh, 02eh, 00ah, 000h, 01bh, 070h, 020h, 01bh, 059h, 020h, 01bh, 028h, 020h, 084h, 020h, 093h
        db      020h, 091h, 02ch, 020h, 09ch, 00ah, 089h, 020h, 03ch, 01bh, 0d9h
        db      ">, <Erase> "
        db      0aah
        else
        db      0abh, 020h, 033h, 020h, 084h, 020h, 01bh, 0aeh, 00ah, 084h, 020h, 0d5h, 020h, 09dh, 020h, 01bh
        db      0b9h
        db      ". Or "
        db      088h
        db      " LOCATE "
        db      0e3h, 00ah, 084h, 020h, 01bh, 0aeh, 020h, 084h
        db      " marker "
        db      09eh
        db      " cursor."
        db      00ah, 090h, 020h, 03ch, 01bh, 01eh, 027h
        db      "Now'> "
        db      084h, 020h, 0f5h
        db      " present"
        db      00ah, 099h, 020h, 0e0h
        db      " marker."
        db      00ah, 000h, 090h, 020h, 061h, 020h, 083h, 020h, 01bh, 082h, 020h, 084h, 020h, 092h, 020h, 01bh
        db      0c5h, 020h, 0fdh, 02eh, 00ah, 000h, 01bh, 070h, 020h, 022h, 053h, 045h, 051h, 022h, 020h, 093h
        db      02ch, 020h, 09eh, 020h, 0d5h, 00ah, 082h, 02eh, 020h, 08fh, 020h, 082h, 020h, 083h, 020h, 084h
        db      00ah, 01bh, 0bdh, 02ch, 020h, 09ah, 020h, 088h, 020h, 03ch, 01bh, 085h, 020h, 0dch
        db      ">. File "
        db      01bh, 0cah, 020h, 091h, 00ah, 0eah, 020h, 09dh, 020h, 01bh, 0c3h, 020h, 095h, 020h, 01bh, 079h
        db      020h, 0d6h, 020h, 01bh, 012h, 020h, 01bh, 034h, 00ah, 0d1h, 02eh, 00ah, 000h
        db      "Selected "
        db      082h, 027h, 073h, 020h, 0adh, 02eh, 00ah, 01bh, 03ch, 020h, 0beh, 020h, 0dch, 020h, 0c6h, 020h
        db      01bh, 0ech, 02ch, 020h, 088h, 020h, 02bh, 02fh, 02dh, 02ch, 00ah, 0c3h, 020h, 0c4h, 020h, 0adh
        db      02ch, 020h, 09ah, 020h, 0d4h, 02eh, 00ah, 000h, 01bh, 070h, 020h, 022h, 01bh, 02fh, 022h, 020h
        db      093h, 02ch, 020h, 09eh, 020h, 0b9h, 020h, 039h, 039h, 00ah, 09ch, 020h, 091h, 020h, 032h, 030h
        db      020h, 01bh, 0cfh, 02eh, 020h, 01bh, 03ch, 020h, 0beh, 03ah, 00ah, 088h, 020h, 02bh, 02fh, 02dh
        db      02ch, 020h, 0c3h, 020h, 0c4h, 020h, 0adh, 02ch, 020h, 09ah, 020h, 0d4h, 02eh, 00ah
        db      "File "
        db      01bh, 0cah, 020h, 091h, 020h, 0eah, 020h, 09dh, 020h, 01bh, 0c3h, 020h, 095h, 020h, 01bh, 079h
        db      00ah, 0d6h, 020h, 01bh, 012h, 020h, 01bh, 034h, 020h, 0d1h, 02eh, 00ah, 000h, 01bh, 070h, 020h
        db      022h, 053h, 04eh, 044h, 022h, 020h, 093h, 02ch, 020h, 09eh, 020h, 0d5h, 020h, 08bh, 02eh, 00ah
        db      08fh, 020h, 08bh, 020h, 0f8h, 020h, 01bh, 01dh, 020h, 084h, 020h, 01bh, 0bdh, 020h, 028h, 0f8h
        db      020h, 01bh, 036h, 00ah, 088h, 020h, 061h, 020h, 01bh, 023h, 029h, 020h, 09ah, 020h, 088h, 020h
        db      03ch, 01bh, 085h, 020h, 0dch
        db      ">. File"
        db      00ah, 01bh, 0cah, 020h, 091h, 020h, 0eah, 020h, 09dh, 020h, 01bh, 0c3h, 020h, 095h, 020h, 01bh
        db      079h, 020h, 0d6h, 00ah, 01bh, 012h, 020h, 01bh, 034h, 020h, 0d1h, 02eh, 00ah, 000h, 01bh, 070h
        db      020h, 022h, 050h, 047h, 04dh, 022h, 020h, 093h, 02ch, 020h, 09eh, 020h, 08ch, 027h, 073h, 00ah
        db      08bh, 020h, 0cdh, 02ch, 020h, 08bh, 020h, 01bh, 0e1h, 020h, 0a5h, 02ch, 00ah, 091h, 020h, 01bh
        db      05ah, 020h, 08bh, 020h, 093h, 020h, 0fbh, 020h, 01bh, 0fbh, 020h, 08ch, 02eh, 00ah
        db      "File "
        db      01bh, 0cah, 020h, 091h, 020h, 0eah, 020h, 09dh, 020h, 01bh, 0c3h, 020h, 095h, 020h, 01bh, 079h
        db      00ah, 0d6h, 020h, 01bh, 012h, 020h, 01bh, 034h, 020h, 0d1h, 02eh, 00ah, 000h
        db      "Selected "
        db      08ch, 027h, 073h, 020h, 0adh, 02eh, 00ah, 01bh, 03ch, 020h, 0beh, 020h, 0dch, 020h, 0c6h, 020h
        db      01bh, 0ech, 02ch, 020h, 088h, 020h, 02bh, 02fh, 02dh, 02ch, 00ah, 0c3h, 020h, 0c4h, 020h, 0adh
        db      02ch, 020h, 09ah, 020h, 0d4h, 02eh, 00ah, 000h, 01bh, 070h, 020h, 022h, 041h, 050h, 053h, 022h
        db      020h, 093h, 02ch, 020h, 09eh, 020h, 0b9h, 020h, 032h, 034h, 00ah, 01bh, 093h, 020h, 091h, 020h
        db      01bh, 05ah, 020h, 08bh, 020h, 01bh, 010h, 020h, 0b0h, 00ah, 0c5h, 02eh, 020h, 01bh, 03ch, 020h
        db      0beh, 03ah, 020h, 088h, 020h, 02bh, 02fh, 02dh, 02ch, 020h, 0c3h, 020h, 0c4h, 00ah, 0adh, 02ch
        db      020h, 09ah, 020h, 0d4h
        db      ". File "
        db      01bh, 0cah, 020h, 091h, 020h, 0eah, 00ah, 09dh, 020h, 01bh, 0c3h, 020h, 095h, 020h, 01bh, 079h
        db      020h, 0d6h, 020h, 01bh, 012h, 020h, 01bh, 034h, 020h, 0d1h, 02eh, 00ah, 000h, 01bh, 070h, 020h
        db      022h, 050h, 041h, 052h, 022h, 020h, 093h, 02ch, 020h, 09eh, 020h, 0eeh, 00ah, 09dh
        db      " most "
        db      0a5h, 020h, 0ddh, 020h, 01bh, 039h, 020h, 01bh, 09ch, 020h, 0b0h, 020h, 01bh, 037h, 00ah, 01bh
        db      07fh
        db      ", such as "
        db      08eh, 020h, 01bh, 052h, 020h, 01bh, 02ah, 02ch, 020h, 08eh, 00ah, 0a9h
        db      " names, etc. ("
        db      01bh, 077h, 020h, 0eeh, 020h, 0d6h, 00ah
        db      "retained "
        db      0e1h, 020h, 01bh, 0d7h, 020h, 01bh, 0e0h, 02eh, 029h, 020h, 01bh, 03ch, 020h, 0beh, 03ah, 00ah
        db      088h, 020h, 02bh, 02fh, 02dh, 02ch, 020h, 0c3h, 020h, 0c4h, 020h, 0adh, 02ch, 020h, 09ah, 020h
        db      0d4h, 02eh, 00ah, 000h, 01bh, 05fh, 020h, 01bh, 042h, 020h, 01bh, 01ch, 020h, 084h, 020h, 092h
        db      020h, 093h, 02ch, 020h, 09ah, 00ah, 088h, 020h, 03ch, 01bh, 01eh
        db      ">, <Erase> "
        db      0abh
        endif
        db      " <Rename>."
        db      00ah
        if      FW_VERSION >= 312
        db      "Additional screens guide "
        db      0f6h
        elseif  FW_VERSION = 311
        db      "Additional screens "
        db      085h, 020h, 097h, 020h, 0fch, 00ah, 084h
        db      " guide "
        db      0ebh
        else
        db      "Additional screens "
        db      085h, 020h, 098h, 020h, 0f3h, 00ah, 084h
        db      " guide "
        db      0f8h
        endif
        db      " further."
        if      FW_VERSION >= 312
        db      00ah, 000h, 01bh
        db      "` <Erase "
        db      0f1h, 03eh, 020h, 099h, 020h, 0b7h, 02ch, 020h, 087h, 020h, 08fh, 00ah, 085h, 020h, 096h, 020h
        db      01bh, 00bh, 020h, 0c0h, 020h, 095h, 020h, 01bh, 0b1h, 021h, 00ah, 000h, 01bh, 043h, 020h, 0c3h
        db      03ah, 020h, 08bh, 020h, 02bh, 02fh, 02dh, 02ch, 020h, 0c7h, 020h, 0c5h, 020h, 0a1h, 02ch, 00ah
        db      097h, 020h, 0d0h, 02ch, 020h, 097h, 020h, 08bh
        elseif  FW_VERSION = 311
        db      00ah, 000h, 01bh
        db      "x <Erase "
        db      0f5h, 03eh, 020h, 096h, 020h, 0bch, 02ch, 020h, 088h, 020h, 091h, 00ah, 085h, 020h, 097h, 020h
        db      01bh, 024h, 020h, 0b7h, 020h, 094h, 020h, 01bh, 0c6h, 021h, 00ah, 092h, 020h, 01bh, 007h, 020h
        db      0c2h, 020h, 084h, 020h, 0e8h, 02eh, 00ah, 000h, 01bh, 04bh, 020h, 0c7h, 03ah, 020h, 089h, 020h
        db      02bh, 02fh, 02dh, 02ch, 020h, 0ceh, 020h, 0d0h, 020h, 0abh, 02ch, 00ah, 09ch, 020h, 0ddh, 02ch
        db      020h, 09ch, 020h, 089h
        else
        db      00ah, 000h, 01bh, 0c1h
        db      " <Erase "
        db      0dch, 03eh, 020h, 0a6h, 020h, 0bdh, 02ch, 020h, 086h, 020h, 093h, 00ah, 085h, 020h, 098h, 020h
        db      01bh, 02dh, 020h, 0b4h, 020h, 095h, 020h, 01bh, 0a2h, 021h, 00ah, 090h, 020h, 0feh, 020h, 0b8h
        db      020h, 084h, 020h, 0dbh, 02eh, 00ah, 000h, 01bh, 03ch, 020h, 0beh, 03ah, 020h, 088h, 020h, 02bh
        db      02fh, 02dh, 02ch, 020h, 0c3h, 020h, 0c4h, 020h, 0adh, 02ch, 00ah, 09ah, 020h, 0d4h, 02ch, 020h
        db      09ah, 020h, 088h
        endif
        db      " <Rename "
        if      FW_VERSION >= 312
        db      0f1h, 03eh, 02eh, 00ah, 000h, 01bh, 0d1h, 020h, 01bh, 098h, 020h, 01bh, 03eh, 020h, 084h, 020h
        db      09bh, 020h, 01bh, 054h, 020h, 095h, 00ah, 01bh, 006h, 020h, 028h, 0adh, 020h, 01bh, 004h, 020h
        db      095h, 029h, 020h, 084h, 020h, 096h, 020h, 01bh, 010h, 02ch, 00ah, 097h, 020h, 08bh, 020h, 03ch
        db      08eh, 020h, 0f1h, 03eh, 02eh, 00ah, 000h, 08eh, 020h, 081h, 020h, 082h, 020h, 093h, 020h, 028h
        db      031h, 02dh, 039h, 039h, 029h, 00ah, 084h, 020h, 0f0h, 020h, 087h, 020h, 082h, 020h, 0d1h, 02ch
        db      00ah, 097h, 020h, 08bh, 020h, 03ch, 01bh, 084h, 020h, 0f1h, 03eh, 02eh, 00ah, 000h, 09fh, 020h
        db      031h, 02ch, 020h, 032h, 020h, 0adh, 020h, 01bh, 0ebh, 020h, 01bh, 058h, 02eh, 00ah, 000h, 08eh
        db      020h, 081h, 020h, 090h, 020h, 093h, 020h, 028h, 031h, 02dh, 038h, 029h, 020h, 084h, 00ah, 0f0h
        db      020h, 087h, 020h, 090h, 020h, 0d1h, 02ch, 020h, 097h, 020h, 08bh, 00ah, 03ch, 01bh, 084h, 020h
        db      01bh, 0d5h, 03eh, 02eh, 00ah, 000h, 08ch, 020h, 099h, 020h, 081h, 020h, 0a1h, 020h, 09eh, 020h
        db      081h, 020h, 090h, 020h, 083h, 00ah, 01bh, 073h, 020h, 084h, 020h, 081h, 020h, 01bh, 014h, 02eh
        db      00ah, 000h, 01bh, 060h, 020h, 0cch, 020h, 09eh, 020h, 081h, 020h, 0bdh, 020h, 084h, 020h, 096h
        db      020h, 0dch, 020h, 01bh, 0b2h, 00ah, 081h, 020h, 01bh, 093h, 020h, 0a1h
        db      " as a "
        db      08ah, 020h, 0aeh, 020h, 0b4h, 03ah, 00ah
        db      "NO: "
        db      089h, 020h, 095h, 020h, 08ah
        db      " isn't "
        db      0dch, 02eh, 00ah, 01bh, 0b6h, 03ah, 020h, 089h, 020h, 095h, 020h, 08ah
        db      " replaces "
        db      081h, 020h, 08ah, 00ah, 0aeh, 020h, 0b4h, 02eh, 00ah, 000h, 09fh, 020h, 03ch, 01bh, 084h, 020h
        db      01bh, 0d5h, 03eh, 020h, 084h, 020h, 0f0h, 020h, 087h
        elseif  FW_VERSION = 311
        db      0f5h, 03eh, 02eh, 00ah, 000h, 01bh, 08fh, 020h, 01bh, 059h, 020h, 01bh, 028h, 020h, 084h, 020h
        db      093h, 020h, 01bh, 06bh, 020h, 094h, 00ah, 0fbh, 020h, 028h, 0aah, 020h, 01bh, 020h, 020h, 094h
        db      029h, 020h, 084h, 020h, 097h, 020h, 0fah, 02ch, 00ah, 09ch, 020h, 089h, 020h, 03ch, 08fh, 020h
        db      0f5h, 03eh, 02eh, 00ah, 000h, 08fh, 020h, 081h, 020h, 082h, 020h, 099h, 020h, 028h, 031h, 02dh
        db      039h, 039h, 029h, 00ah, 0ebh, 020h, 01bh, 01bh, 020h, 084h, 020h, 0dfh, 020h, 088h, 020h, 082h
        db      020h, 0d9h, 02ch, 00ah, 09ch, 020h, 089h, 020h, 03ch, 01bh, 061h, 020h, 01bh, 0bfh, 03eh, 02eh
        db      00ah, 000h, 092h, 020h, 031h, 02ch, 020h, 032h, 020h, 0aah, 020h, 01bh, 007h, 020h, 0c2h, 02eh
        db      00ah, 000h, 08fh, 020h, 081h, 020h, 090h, 020h, 099h, 020h, 028h, 031h, 02dh, 032h, 034h, 029h
        db      020h, 0ebh, 00ah, 01bh, 01bh, 020h, 084h, 020h, 0dfh, 020h, 088h, 020h, 090h, 020h, 0d9h, 02ch
        db      020h, 09ch, 00ah, 089h, 020h, 03ch, 01bh, 061h, 020h, 01bh, 0bfh, 03eh, 02eh, 020h, 08bh
        db      " PGM "
        db      091h, 020h, 085h, 00ah, 0dfh, 02ch, 020h, 09ch, 020h, 0b9h, 020h, 0a1h, 020h, 01bh, 056h, 020h
        db      084h, 020h, 0f5h, 020h, 085h, 00ah, 0dfh
        db      ", adding "
        db      084h, 020h, 0bdh, 020h, 0a1h, 020h, 0ach, 00ah, 0b1h, 02eh, 00ah, 000h, 08dh, 020h, 096h, 020h
        db      081h, 020h, 0abh, 020h, 09eh, 020h, 081h, 020h, 090h, 020h, 083h, 00ah, 01bh, 00dh, 020h, 084h
        db      020h, 081h, 020h, 01bh, 034h, 02eh, 00ah, 000h, 01bh, 078h, 020h, 0d1h, 020h, 09eh, 020h, 081h
        db      020h, 0a1h, 020h, 084h, 020h, 097h, 020h, 0e6h, 020h, 01bh, 07bh, 00ah, 081h, 020h, 01bh, 0e8h
        db      020h, 0abh
        db      " as a "
        db      08ah, 020h, 0ach, 020h, 0b1h, 03ah, 00ah
        db      "NO: "
        db      08bh, 020h, 094h, 020h, 08ah
        db      " isn't "
        db      0e6h, 02eh, 00ah, 01bh, 0dch, 03ah, 020h, 08bh, 020h, 094h, 020h, 08ah, 020h, 096h, 020h, 0e6h
        db      02ch, 00ah, 01bh, 045h, 020h, 081h, 020h, 08ah, 020h, 0ach, 020h, 0b1h, 02eh, 00ah, 000h, 092h
        db      020h, 03ch, 01bh, 061h, 020h, 01bh, 0bfh, 03eh, 020h, 084h, 020h, 0dfh, 020h, 088h
        else
        db      0dch, 03eh, 02eh, 00ah, 000h, 01bh, 072h, 020h, 01bh, 042h, 020h, 01bh, 01ch, 020h, 084h, 020h
        db      092h, 020h, 01bh, 040h, 020h, 095h, 00ah, 0f2h, 020h, 028h, 0abh, 020h, 01bh, 016h, 020h, 095h
        db      029h, 020h, 084h, 020h, 098h, 020h, 0fbh, 02ch, 00ah, 09ah, 020h, 088h, 020h, 03ch, 08fh, 020h
        db      0dch, 03eh, 02eh, 00ah, 000h, 08fh, 020h, 081h, 020h, 082h, 020h, 099h, 020h, 028h, 031h, 02dh
        db      039h, 039h, 029h, 00ah, 0f8h, 020h, 01bh, 01dh, 020h, 084h, 020h, 0f5h, 020h, 086h, 020h, 082h
        db      020h, 0e0h, 02ch, 00ah, 09ah, 020h, 088h, 020h, 03ch, 01bh, 01eh, 020h, 0dch, 03eh, 02eh, 00ah
        db      000h, 090h, 020h, 031h, 02ch, 020h, 032h, 020h, 0abh, 020h, 0feh, 020h, 0b8h, 02eh, 00ah, 000h
        db      08fh, 020h, 081h, 020h, 08ch, 020h, 099h, 020h, 028h, 031h, 02dh, 032h, 034h, 029h, 020h, 0f8h
        db      00ah, 01bh, 01dh, 020h, 084h, 020h, 0f5h, 020h, 086h, 020h, 08ch, 020h, 0e0h, 02ch, 020h, 09ah
        db      00ah, 088h, 020h, 03ch, 01bh, 01eh, 020h, 0dch, 03eh, 02eh, 020h, 089h
        db      " PGM "
        db      093h, 020h, 085h, 00ah, 0f5h, 02ch, 020h, 09ah, 020h, 0b9h, 020h, 0b2h, 020h, 01bh, 03eh, 020h
        db      084h, 020h, 0dch, 020h, 085h, 00ah, 0f5h
        db      ", adding "
        db      084h, 020h, 0b6h, 020h, 0b2h, 020h, 0b0h, 00ah, 0c5h, 02eh, 00ah, 000h, 090h, 020h, 03ch, 01bh
        db      01eh, 020h, 0dch, 03eh, 020h, 084h, 020h, 0f5h, 020h, 086h
        endif
        db      " APS "
        if      FW_VERSION >= 312
        db      08fh, 02eh, 00ah, 000h, 09fh, 020h, 03ch, 01bh, 084h, 020h, 01bh, 0d5h, 03eh, 020h, 084h, 020h
        db      0f0h, 020h, 087h
        elseif  FW_VERSION = 311
        db      091h, 02eh, 00ah, 092h, 020h, 01bh, 007h, 020h, 0c2h, 020h, 084h, 020h, 0e8h, 02eh, 00ah, 000h
        db      092h, 020h, 03ch, 01bh, 061h, 020h, 01bh, 0bfh, 03eh, 020h, 084h, 020h, 0dfh, 020h, 088h
        else
        db      093h, 02eh, 00ah, 090h, 020h, 0feh, 020h, 0b8h, 020h, 084h, 020h, 0dbh, 02eh, 00ah, 000h, 090h
        db      020h, 03ch, 01bh, 01eh, 020h, 0dch, 03eh, 020h, 084h, 020h, 0f5h, 020h, 086h
        endif
        db      " PAR "
        if      FW_VERSION >= 312
        db      08fh, 02eh, 00ah, 000h, 09fh, 020h, 022h, 031h, 022h, 020h, 0adh, 020h, 022h, 032h, 022h, 020h
        db      084h, 020h, 0f0h, 02eh, 00ah, 000h, 08eh, 020h, 061h, 020h, 090h, 020h, 084h, 020h, 0f0h, 020h
        db      081h
        elseif  FW_VERSION = 311
        db      091h, 02eh, 00ah, 092h, 020h, 01bh, 007h, 020h, 0c2h, 020h, 084h, 020h, 0e8h, 02eh, 00ah, 000h
        db      092h, 020h, 022h, 031h, 022h, 020h, 0aah, 020h, 022h, 032h, 022h, 020h, 084h, 020h, 0dfh, 02eh
        db      00ah, 092h, 020h, 01bh, 007h, 020h, 0c2h, 020h, 084h, 020h, 0e8h, 02eh, 00ah, 000h, 08fh, 020h
        db      061h, 020h, 090h, 020h, 084h, 020h, 0dfh, 020h, 081h
        else
        db      093h, 02eh, 00ah, 090h, 020h, 0feh, 020h, 0b8h, 020h, 084h, 020h, 0dbh, 02eh, 00ah, 000h, 090h
        db      020h, 022h, 031h, 022h, 020h, 0abh, 020h, 022h, 032h, 022h, 020h, 084h, 020h, 0f5h, 02eh, 00ah
        db      090h, 020h, 0feh, 020h, 0b8h, 020h, 084h, 020h, 0dbh, 02eh, 00ah, 000h, 08fh, 020h, 061h, 020h
        db      08ch, 020h, 084h, 020h, 0f5h, 020h, 081h
        endif
        db      " SET "
        if      FW_VERSION >= 312
        db      08fh, 027h, 073h, 00ah, 0e8h, 020h, 0d1h, 02ch, 020h, 097h, 020h, 08bh
        elseif  FW_VERSION = 311
        db      091h, 027h, 073h, 00ah, 0c9h, 020h, 0d9h, 02ch, 020h, 09ch, 020h, 089h
        else
        db      093h, 027h, 073h, 00ah, 0d0h, 020h, 0e0h, 02ch, 020h, 09ah, 020h, 088h
        endif
        db      " <Proceed>."
        db      00ah, 000h
        db      "Only "
        if      FW_VERSION >= 311
        db      0a2h, 020h, 081h
        else
        db      09bh, 020h, 081h
        endif
        db      " table's "
        if      FW_VERSION >= 312
        db      0fah, 020h, 01bh, 046h, 020h, 0f6h, 00ah, 01bh, 041h, 020h, 0bdh, 020h, 084h, 020h, 096h, 020h
        db      0d6h, 020h, 084h, 020h, 01bh, 022h, 00ah, 086h, 020h, 098h, 020h, 01bh
        db      "? (such as "
        db      01bh, 0c1h, 020h, 086h, 00ah, 01bh, 03fh, 029h, 020h, 0aeh, 020h, 081h, 020h, 090h, 02eh, 020h
        db      089h, 020h, 01bh, 025h, 02dh, 084h, 02dh, 00ah, 08ah, 020h, 0e8h
        elseif  FW_VERSION = 311
        db      0f8h, 020h, 01bh, 053h, 020h, 0ebh, 00ah, 01bh, 01bh, 020h, 0a1h, 020h, 084h, 020h, 097h, 020h
        db      0cdh, 020h, 084h, 020h, 01bh, 03dh, 00ah, 086h, 020h, 09bh, 020h, 0f9h
        db      " (such as "
        db      01bh, 0dfh, 020h, 086h, 00ah, 0f9h, 029h, 020h, 0ach, 020h, 081h, 020h, 090h, 02eh, 020h, 08bh
        db      " old "
        db      01bh, 033h, 02dh, 00ah, 084h, 02dh, 08ah, 020h, 0c9h
        else
        db      0eeh, 020h, 01bh, 059h, 020h, 0f8h, 00ah, 01bh, 01dh, 020h, 0b2h, 020h, 084h, 020h, 098h, 020h
        db      0cch, 020h, 084h, 020h, 01bh, 028h, 00ah, 08eh, 020h, 097h, 020h, 0f1h
        db      " (such as General "
        db      08eh, 00ah, 0f1h, 029h, 020h, 0b0h, 020h, 081h, 020h, 08ch, 02eh, 020h, 089h
        db      " old "
        db      01bh, 023h, 02dh, 00ah, 084h, 02dh, 08bh, 020h, 0d0h
        endif
        db      " won't "
        if      FW_VERSION >= 312
        db      096h, 020h, 0b8h, 02eh, 00ah, 000h, 08eh, 020h, 08ah, 020h, 097h, 020h, 08bh, 020h, 03ch, 01bh
        db      062h, 020h, 0f1h, 03eh, 02eh, 00ah, 000h, 09fh, 020h, 03ch, 01bh, 062h, 020h, 0f1h, 03eh, 020h
        db      084h, 020h, 0f0h, 020h, 087h, 020h, 022h, 01bh, 02eh, 022h, 00ah, 08fh, 020h, 0d1h, 020h, 0b4h
        db      02eh, 00ah, 000h, 09fh, 020h, 03ch, 01bh, 084h, 020h, 0f1h, 03eh, 020h, 084h, 020h, 0f0h, 020h
        db      087h, 020h, 082h, 00ah, 0c0h, 020h, 022h, 01bh, 02eh, 022h, 020h, 08fh, 020h, 0d1h, 020h, 0b4h
        db      02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      097h, 020h, 0cch, 00ah, 0ach, 020h, 01bh
        db      "[ case."
        db      00ah, 000h, 01bh, 08fh, 020h, 01bh, 059h, 020h, 01bh, 028h, 020h, 084h, 020h, 093h, 020h, 08ah
        db      020h, 084h, 020h, 0dfh, 02ch, 00ah, 09ch, 020h, 089h, 020h, 03ch, 01bh, 061h, 020h, 01bh, 0bfh
        db      03eh, 02eh, 00ah, 000h, 092h, 020h, 03ch, 01bh, 061h, 020h, 01bh, 0bfh, 03eh, 020h, 084h, 020h
        db      0dfh, 020h, 088h, 020h, 022h, 01bh, 040h, 022h, 00ah, 091h, 020h, 0d9h, 020h, 0b1h, 02eh, 020h
        db      092h, 020h, 01bh, 007h, 020h, 0c2h, 020h, 084h, 00ah, 0e8h, 02eh, 00ah, 000h, 092h, 020h, 03ch
        db      01bh, 061h, 020h, 0f5h, 03eh, 020h, 084h, 020h, 0dfh, 020h, 088h, 020h, 082h, 00ah, 0b7h, 020h
        db      022h, 01bh, 040h, 022h, 020h, 091h, 020h, 0d9h, 020h, 0b1h, 02eh, 020h, 092h, 020h, 01bh, 007h
        db      00ah, 0c2h, 020h, 084h, 020h, 0e8h, 02eh, 00ah, 000h
        else
        db      098h, 020h, 0c1h, 00ah, 0b0h, 020h, 01bh
        db      "K case."
        db      00ah, 000h, 01bh, 072h, 020h, 01bh, 042h, 020h, 01bh, 01ch, 020h, 084h, 020h, 092h, 020h, 08bh
        db      020h, 084h, 020h, 0f5h, 02ch, 00ah, 09ah, 020h, 088h, 020h, 03ch, 01bh, 01eh, 020h, 0dch, 03eh
        db      02eh, 00ah, 000h, 090h, 020h, 03ch, 01bh, 01eh, 020h, 0dch, 03eh, 020h, 084h, 020h, 0f5h, 020h
        db      086h, 020h, 022h, 01bh, 02fh, 022h, 00ah, 093h, 020h, 0e0h, 020h, 0c5h, 02eh, 020h, 090h, 020h
        db      0feh, 020h, 0b8h, 020h, 084h, 00ah, 0dbh, 02eh, 00ah, 000h, 090h, 020h, 03ch, 01bh, 085h, 020h
        db      0dch, 03eh, 020h, 084h, 020h, 0f5h, 020h, 086h, 020h, 082h, 00ah, 0b4h, 020h, 022h, 01bh, 02fh
        db      022h, 020h, 093h, 020h, 0e0h, 020h, 0c5h, 02eh, 020h, 090h, 020h, 0feh, 00ah, 0b8h, 020h, 084h
        db      020h, 0dbh, 02eh, 00ah, 000h
        endif
        db      "Just "
        if      FW_VERSION >= 312
        db      08bh
        elseif  FW_VERSION = 311
        db      089h
        else
        db      088h
        endif
        db      " <Exit>."
        if      FW_VERSION >= 312
        db      00ah, 000h, 08eh, 020h, 081h, 020h, 082h, 020h, 093h, 020h, 028h, 031h, 02dh, 039h, 039h, 029h
        db      020h, 0f6h, 00ah, 01bh, 041h, 020h, 084h, 020h, 0f0h, 020h, 087h, 020h, 0b2h, 020h, 086h, 020h
        db      01bh, 03ch, 00ah, 0d1h, 02ch, 020h, 09bh, 020h, 081h, 020h, 086h, 020h, 094h, 020h, 084h, 020h
        db      01bh, 061h, 00ah, 01bh
        db      "i3000 Drum "
        db      0c1h, 020h, 0c0h, 02ch, 020h, 097h, 020h, 08bh, 00ah, 03ch, 01bh, 084h, 020h, 01bh, 0d5h, 03eh
        db      02eh, 00ah, 000h, 0b2h, 020h, 086h, 020h, 01bh, 03ch, 020h, 0bfh, 020h, 0d3h, 020h, 081h, 00ah
        db      094h, 020h, 083h, 020h, 0f6h, 020h, 01bh, 0e7h, 020h, 085h, 020h, 096h, 00ah
        db      "mapped "
        db      084h, 020h, 01bh
        db      "i3000 Drum "
        db      0c1h, 02eh, 020h, 089h, 00ah, 01bh, 0d0h, 020h, 0a4h, 020h, 01bh, 0c1h, 020h, 086h, 020h, 099h
        db      020h, 094h, 020h, 031h, 030h, 02eh, 00ah, 01bh, 0c4h
        db      " may "
        db      01bh, 0e7h, 020h, 022h
        db      "None"
        db      022h, 020h, 084h
        db      " leave "
        db      0bah, 00ah, 0c1h, 020h, 0d3h, 020h, 01bh, 0ddh
        db      " original "
        db      086h, 00ah, 0e8h, 02eh, 00ah, 000h, 01bh, 05bh, 020h, 022h, 041h, 073h, 020h, 0aeh, 020h, 08fh
        db      022h, 020h, 084h, 020h, 01bh, 061h, 020h, 0cch, 00ah, 01bh, 069h, 033h, 030h, 030h, 030h, 020h
        db      088h, 020h, 0a4h, 020h, 01bh, 027h, 020h, 088h, 020h, 0aeh, 020h, 081h, 00ah, 0b2h, 020h, 086h
        db      020h, 01bh, 03ch, 02eh, 020h, 01bh, 05bh, 020h, 022h
        db      "One per"
        db      00ah, 086h, 020h, 0b5h, 022h, 020h, 084h, 020h, 01bh, 061h, 020h, 0cch, 020h, 088h, 020h, 0a4h
        db      00ah, 01bh, 027h, 020h, 086h, 020h, 0b5h, 020h, 028h, 01bh, 09fh, 020h, 094h, 020h, 091h
        db      " port)"
        db      00ah
        db      "encountered "
        db      0aeh, 020h, 081h, 020h, 08fh, 020h, 091h, 020h, 084h
        db      " auto-map"
        db      00ah, 01bh, 027h, 020h, 0b3h, 020h, 084h, 020h, 081h, 020h, 01bh, 07fh, 020h, 088h, 02eh, 00ah
        db      000h, 08eh, 020h, 081h
        elseif  FW_VERSION = 311
        db      00ah, 000h, 08fh, 020h, 081h, 020h, 082h, 020h, 099h, 020h, 028h, 031h, 02dh, 039h, 039h, 029h
        db      020h, 0ebh, 00ah, 01bh, 01bh, 020h, 084h, 020h, 0dfh, 020h, 088h, 020h, 0b6h, 020h, 086h, 020h
        db      01bh, 00bh, 00ah, 0d9h, 02ch, 020h, 093h, 020h, 081h, 020h, 086h, 020h, 09ah, 020h, 084h, 020h
        db      01bh, 076h, 00ah, 01bh
        db      "d3000 Drum "
        db      0bfh, 020h, 0b7h, 02ch, 020h, 09ch, 020h, 089h, 00ah, 03ch, 01bh, 061h, 020h, 01bh, 0bfh, 03eh
        db      02eh, 00ah, 000h, 0b6h, 020h, 086h, 020h, 01bh, 00bh, 020h, 0c0h, 020h, 0d8h, 020h, 081h, 00ah
        db      09ah, 020h, 083h, 020h, 0ebh, 020h, 01bh, 0bch, 020h, 085h, 020h, 097h, 00ah
        db      "mapped "
        db      084h, 020h, 01bh
        db      "d3000 Drum "
        db      0bfh, 02eh, 020h, 08bh, 00ah
        db      "default "
        db      0a5h, 020h, 01bh, 0dfh, 020h, 086h, 020h, 096h, 020h, 09ah, 020h, 031h, 030h, 02eh, 00ah, 01bh
        db      0a0h
        db      " may "
        db      01bh, 0bch, 020h, 022h
        db      "None"
        db      022h, 020h, 084h
        db      " leave "
        db      0b9h, 00ah, 0bfh, 020h, 0d8h, 020h, 01bh, 09ah
        db      " original "
        db      086h, 00ah, 0c9h, 02eh, 00ah, 000h, 01bh, 073h, 020h, 022h, 041h, 073h, 020h, 0ach, 020h, 091h
        db      022h, 020h, 084h, 020h, 01bh, 076h, 020h, 0d1h, 00ah, 01bh, 064h, 033h, 030h, 030h, 030h, 020h
        db      087h, 020h, 0a5h, 020h, 01bh, 035h, 020h, 087h, 020h, 0ach, 020h, 081h, 00ah, 0b6h, 020h, 086h
        db      020h, 01bh, 00bh, 02eh, 020h, 01bh, 073h, 020h, 022h
        db      "One per"
        db      00ah, 086h, 020h, 0b5h, 022h, 020h, 084h, 020h, 01bh, 076h, 020h, 0d1h, 020h, 087h, 020h, 0a5h
        db      00ah, 01bh, 035h, 020h, 086h, 020h, 0b5h, 020h, 028h, 01bh, 0d0h, 020h, 09ah, 020h, 08eh
        db      " port)"
        db      00ah
        db      "encountered "
        db      0ach, 020h, 081h, 020h, 091h, 020h, 08eh, 020h, 084h
        db      " auto-map"
        db      00ah, 01bh, 035h, 020h, 0bah, 020h, 084h, 020h, 081h, 020h, 01bh, 08dh, 020h, 087h, 02eh, 00ah
        db      000h, 08fh, 020h, 081h
        else
        db      00ah, 000h, 08fh, 020h, 081h
        endif
        db      " S1000/S3000 "
        if      FW_VERSION >= 312
        db      08ah, 020h, 08fh, 020h, 084h, 020h, 096h, 00ah, 0dch, 02eh, 020h, 01bh
        db      "` mono, "
        db      08bh, 020h, 03ch, 01bh, 062h, 03eh, 02eh, 020h, 01bh, 060h, 00ah, 0d9h
        elseif  FW_VERSION = 311
        db      08ah, 020h, 091h, 020h, 084h, 020h, 097h, 00ah, 0e6h, 02eh, 020h, 01bh
        db      "x mono, "
        db      089h, 020h, 03ch, 01bh, 0d9h, 03eh, 02eh, 020h, 01bh, 078h, 00ah, 0e4h
        else
        db      08bh, 020h, 093h, 020h, 084h, 020h, 098h, 00ah, 01bh, 014h, 02eh, 020h, 01bh, 0c1h
        db      " mono, "
        db      088h, 020h, 03ch, 01bh, 01eh, 03eh, 02eh, 020h, 01bh, 0c1h, 00ah, 0ebh
        endif
        db      " (ending "
        if      FW_VERSION >= 312
        db      0d3h, 020h, 022h, 02dh, 04ch, 022h, 020h, 0adh, 020h, 022h, 02dh, 052h, 022h, 029h, 020h, 08bh
        elseif  FW_VERSION = 311
        db      0d8h, 020h, 022h, 02dh, 04ch, 022h, 020h, 0aah, 020h, 022h, 02dh, 052h, 022h, 029h, 020h, 089h
        else
        db      0e1h, 020h, 022h, 02dh, 04ch, 022h, 020h, 0abh, 020h, 022h, 02dh, 052h, 022h, 029h, 020h, 088h
        endif
        db      00ah
        db      "<Yes,"
        if      FW_VERSION >= 312
        db      0d9h, 03eh, 020h, 084h, 020h, 0f0h
        elseif  FW_VERSION = 311
        db      0e4h, 03eh, 020h, 084h, 020h, 0dfh
        else
        db      0ebh, 03eh, 020h, 084h, 020h, 0f5h
        endif
        db      " both "
        if      FW_VERSION >= 312
        db      01bh, 014h, 020h, 091h, 00ah, 01bh, 016h
        elseif  FW_VERSION = 311
        db      01bh, 034h, 020h, 08eh, 00ah, 0dbh
        else
        db      01bh, 031h, 020h, 091h, 00ah, 0d1h
        endif
        db      " sides, "
        if      FW_VERSION >= 312
        db      0adh
        elseif  FW_VERSION = 311
        db      0aah
        else
        db      0abh
        endif
        db      " <No,mono> "
        if      FW_VERSION >= 312
        db      084h, 020h, 0f0h, 020h, 0fch, 00ah, 081h, 020h, 08dh
        elseif  FW_VERSION = 311
        db      084h, 020h, 0dfh, 020h, 0ffh, 00ah, 081h, 020h, 08ch
        else
        db      084h, 020h, 0f5h, 020h, 01bh, 045h, 00ah, 081h, 020h, 08ah
        endif
        db      " side."
        if      FW_VERSION >= 312
        db      00ah, 000h, 08ch, 020h, 01bh, 015h
        db      " copies "
        db      0cch
        db      " HD "
        db      01bh, 004h, 00ah, 095h, 020h, 084h, 020h, 0a8h
        db      " (overwriting "
        db      081h, 00ah
        db      "previous "
        db      01bh, 04dh, 029h, 02eh, 00ah, 000h, 08ch, 020h, 0cah, 020h, 085h, 020h, 01bh, 0c6h, 020h, 0bah
        elseif  FW_VERSION = 311
        db      00ah, 000h, 092h, 020h, 061h, 020h, 083h, 020h, 01bh, 0a3h, 020h, 084h, 020h, 093h, 020h, 061h
        db      020h, 094h, 00ah, 01bh, 008h, 02eh, 00ah, 000h, 08dh, 020h, 0e9h, 020h, 01bh, 0bah, 020h, 0ebh
        db      020h, 084h, 020h, 01bh, 082h, 020h, 0d1h, 00ah
        db      "HD (1.44 MB) "
        db      01bh, 020h, 020h, 094h, 020h, 084h, 020h, 0a9h, 00ah
        db      "(overwriting "
        db      081h
        db      " previous "
        db      01bh, 063h, 029h, 02eh, 00ah, 042h, 065h, 020h, 01bh, 0d4h, 020h, 0b8h, 020h, 094h, 020h, 01bh
        db      07bh, 020h, 01bh, 0a9h, 00ah, 0c6h, 02eh, 00ah, 000h
        db      "What could "
        db      097h
        db      " simpler?"
        db      00ah, 000h, 08dh, 020h, 0d5h, 020h, 085h, 020h, 01bh, 0d8h, 020h, 0b9h
        else
        db      00ah, 000h, 090h, 020h, 061h, 020h, 083h, 020h, 01bh, 082h, 020h, 084h, 020h, 092h, 020h, 061h
        db      020h, 095h, 00ah, 0fdh, 02eh, 00ah, 000h, 08dh, 020h, 0e2h, 020h, 01bh, 094h, 020h, 0f8h, 020h
        db      084h, 020h, 01bh, 088h, 020h, 0d5h, 00ah
        db      "HD (1.44 MB) "
        db      01bh, 016h, 020h, 095h, 020h, 084h, 020h, 0a7h, 00ah
        db      "(overwriting "
        db      081h
        db      " previous "
        db      01bh, 04fh, 029h, 02eh, 00ah
        db      "Be sure "
        db      0c2h, 020h, 095h, 020h, 01bh, 084h, 020h, 01bh, 07ch, 00ah, 0d9h, 02eh, 00ah, 000h
        db      "What could "
        db      098h
        db      " simpler?"
        db      00ah, 000h, 08dh, 020h, 0cbh, 020h, 085h, 020h, 01bh, 0b2h, 020h, 0b9h
        endif
        db      " old"
        if      FW_VERSION >= 312
        db      00ah, 0a5h, 020h, 0e9h, 020h, 081h, 020h, 095h, 020h, 0d3h, 020h, 0a6h, 020h, 0a5h, 00ah, 000h
        elseif  FW_VERSION = 311
        db      00ah, 0a3h, 020h, 0eah, 020h, 081h, 020h, 094h, 020h, 0d8h, 020h, 0a7h, 020h, 0a3h, 00ah, 000h
        else
        db      00ah, 0a5h, 020h, 0efh, 020h, 081h, 020h, 095h, 020h, 0e1h, 020h, 0a3h, 020h, 0a5h, 00ah, 000h
        endif
        db      "Pressing <Format "
        if      FW_VERSION >= 312
        db      0f1h, 03eh, 020h, 085h, 020h, 0f4h, 020h, 081h, 00ah, 095h
        elseif  FW_VERSION = 311
        db      0f5h, 03eh, 020h, 085h, 020h, 01bh, 005h, 020h, 081h, 00ah, 094h
        else
        db      0dch, 03eh, 020h, 085h, 020h, 01bh, 0a6h, 020h, 081h, 00ah, 095h
        endif
        db      ", ERASING "
        db      01bh
        if      FW_VERSION >= 312
        db      ". CONTENTS PERMANENTLY!"
        elseif  FW_VERSION = 311
        db      "@ CONTENTS PERMANENTLY!"
        else
        db      "/ CONTENTS PERMANENTLY!"
        endif
        db      00ah
        db      "All "
        if      FW_VERSION >= 312
        db      0c5h, 020h, 01bh, 0b4h, 020h, 01bh, 052h, 020h, 096h, 020h, 0c9h, 020h, 0c8h, 00ah
        elseif  FW_VERSION = 311
        db      0d0h, 020h, 01bh, 079h, 020h, 01bh, 06fh, 020h, 097h, 020h, 0c6h, 020h, 0d2h, 00ah
        else
        db      0c4h, 020h, 01bh, 055h, 020h, 01bh, 05eh, 020h, 098h, 020h, 0d9h, 020h, 0c6h, 00ah
        endif
        db      "they "
        if      FW_VERSION >= 312
        db      085h, 020h, 01bh, 09ah, 02eh, 00ah, 000h, 01bh, 060h, 020h, 0fch, 020h, 031h, 020h, 01bh, 054h
        db      020h, 01bh, 04ch, 020h, 099h, 020h, 01bh, 04bh, 00ah
        db      "(recommended), "
        db      09bh
        db      " AUTO. "
        db      01bh, 060h, 020h, 01bh, 00eh, 00ah, 01bh, 028h, 020h, 031h, 020h, 01bh, 04ch, 020h, 099h, 020h
        db      01bh, 04bh, 02ch, 020h, 0dfh, 020h, 081h, 00ah, 01bh, 011h, 020h, 01bh, 0c2h, 020h, 09eh, 020h
        db      081h, 020h, 01bh, 04ch, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      085h, 020h, 01bh, 01ch, 02eh, 020h, 08dh, 020h, 096h
        db      " also a"
        db      00ah
        db      "convenient way "
        db      084h, 020h, 01bh, 0b9h, 020h, 0b9h, 020h, 01bh, 092h, 020h, 0b7h, 00ah
        db      "old "
        db      01bh, 079h, 02eh, 020h, 092h, 020h, 01bh, 007h, 020h, 0c2h, 020h, 084h, 020h, 0e8h, 02eh, 00ah
        db      000h, 01bh, 078h, 020h, 0ffh, 020h, 031h, 020h, 01bh, 06bh, 020h, 01bh, 065h, 020h, 096h, 020h
        db      01bh, 067h, 00ah
        db      "(recommended), "
        db      093h
        db      " AUTO. "
        db      01bh, 078h, 020h, 0f3h, 00ah, 01bh, 041h, 020h, 031h, 020h, 01bh, 065h, 020h, 096h, 020h, 01bh
        db      067h, 02ch, 020h, 0e2h, 020h, 081h, 00ah, 0efh, 020h, 01bh, 0d2h, 020h, 09eh, 020h, 081h, 020h
        db      01bh, 065h, 02eh, 00ah, 000h
        else
        db      085h, 020h, 01bh, 003h, 02eh, 020h, 08dh, 020h, 0a6h
        db      " also a"
        db      00ah
        db      "convenient way "
        db      084h, 020h, 01bh, 09ah, 020h, 0b9h, 020h, 01bh, 07fh, 020h, 0b4h, 00ah
        db      "old "
        db      01bh, 055h, 02eh, 020h, 090h, 020h, 0feh, 020h, 0b8h, 020h, 084h, 020h, 0dbh, 02eh, 00ah, 000h
        db      08fh
        db      " SYQUEST "
        db      0a4h
        db      " any "
        db      01bh, 0a7h, 020h, 0dfh, 020h, 01bh, 07dh, 00ah
        db      "SyQuest removable "
        db      01bh, 040h, 020h, 01bh, 055h, 02eh, 00ah, 08fh
        db      " STANDARD "
        db      0a4h
        db      " anything else."
        db      00ah, 000h
        endif
        db      "A larger "
        db      083h
        db      " creates "
        if      FW_VERSION >= 312
        db      01bh, 0bdh
        elseif  FW_VERSION = 311
        db      01bh, 0e3h
        else
        db      01bh, 0b8h
        endif
        db      " smaller"
        if      FW_VERSION >= 312
        db      00ah, 01bh, 0b7h
        elseif  FW_VERSION = 311
        db      00ah, 01bh, 0e7h
        else
        db      00ah, 01bh, 0ach
        endif
        db      "; a smaller "
        db      083h
        db      " creates a"
        db      00ah
        db      "few larger "
        if      FW_VERSION >= 312
        db      01bh, 0b7h, 02eh, 00ah, 000h, 01bh
        db      "C avoid formatting "
        db      081h, 020h, 095h, 02ch, 020h, 08bh, 00ah, 01bh, 0ebh, 020h, 01bh, 058h, 02eh, 00ah, 000h, 01bh
        db      060h, 020h, 0fch, 020h, 031h, 020h, 01bh, 011h, 020h, 0e5h, 020h, 099h, 020h, 01bh, 04bh, 02ch
        db      00ah, 09bh
        db      " AUTO & "
        db      08bh
        db      " <Make "
        db      0dbh, 03eh, 020h, 084h, 00ah, 01bh, 06bh, 020h, 0f1h, 02eh, 020h, 01bh, 060h, 020h, 01bh, 00eh
        db      020h, 01bh, 028h, 020h, 031h, 020h, 01bh, 011h, 020h, 0e5h, 020h, 099h, 00ah, 01bh, 04bh, 02ch
        db      020h, 0dfh, 020h, 081h, 020h, 01bh, 011h, 020h, 01bh, 0c2h, 020h, 09eh, 020h, 081h, 00ah, 0e5h
        db      020h, 084h, 020h, 01bh, 06bh, 020h, 026h, 020h, 08bh
        db      " <Make "
        db      0dbh, 03eh, 02eh, 00ah, 000h, 089h, 020h, 01bh, 059h, 020h, 09eh, 020h, 0afh, 020h, 081h, 020h
        db      01bh, 011h
        db      " scan"
        db      00ah
        db      "continues "
        db      01bh, 046h, 020h, 01bh, 088h, 020h, 01bh, 011h, 020h, 0e5h, 020h, 099h, 020h, 01bh, 0d9h, 02eh
        db      00ah
        db      "30 seconds "
        db      099h
        elseif  FW_VERSION = 311
        db      01bh, 0e7h, 02eh, 00ah, 000h, 01bh
        db      "K avoid formatting "
        db      081h, 020h, 094h, 02ch, 020h, 089h, 00ah, 01bh, 007h, 020h, 0c2h, 02eh, 00ah, 000h, 01bh, 078h
        db      020h, 0ffh, 020h, 031h, 020h, 0efh, 020h, 0cah, 020h, 096h, 020h, 01bh, 067h, 02ch, 00ah, 093h
        db      " AUTO & "
        db      089h, 020h, 03ch, 01bh, 0cdh, 020h, 0deh, 03eh, 020h, 084h, 00ah, 01bh, 0c4h, 020h, 0f5h, 02eh
        db      020h, 01bh, 078h, 020h, 0f3h, 020h, 01bh, 041h, 020h, 031h, 020h, 0efh, 020h, 0cah, 020h, 096h
        db      00ah, 01bh, 067h, 02ch, 020h, 0e2h, 020h, 081h, 020h, 0efh, 020h, 01bh, 0d2h, 020h, 09eh, 020h
        db      081h, 00ah, 0cah, 020h, 084h, 020h, 01bh, 0c4h, 020h, 026h, 020h, 089h, 020h, 03ch, 01bh, 0cdh
        db      020h, 0deh, 03eh, 02eh, 00ah, 000h, 08bh, 020h, 0f6h, 020h, 09eh, 020h, 0afh, 020h, 081h, 020h
        db      0efh
        db      " scan"
        db      00ah
        db      "continues "
        db      01bh, 053h, 020h, 01bh, 09fh, 020h, 0efh, 020h, 0cah, 020h, 096h, 020h, 01bh, 084h, 02eh, 00ah
        db      "30 seconds "
        db      096h
        else
        db      01bh, 0ach, 02eh, 00ah, 000h, 01bh
        db      "< avoid formatting "
        db      081h, 020h, 095h, 02ch, 020h, 088h, 00ah, 0feh, 020h, 0b8h, 02eh, 00ah, 000h, 089h, 020h, 0eah
        db      020h, 09dh, 020h, 0ach, 020h, 081h, 020h, 022h
        db      "Searching "
        db      0a4h, 00ah
        db      "SCSI "
        db      01bh, 040h, 020h, 095h, 022h
        db      " message appears "
        db      01bh, 034h, 00ah, 01bh, 0d7h, 02dh, 0efh
        db      ". 30 seconds "
        db      0a6h
        endif
        db      " adequate "
        if      FW_VERSION >= 312
        db      0a4h
        db      " most "
        db      01bh, 054h, 00ah, 01bh, 0b4h, 020h, 084h
        elseif  FW_VERSION = 311
        db      0a5h
        db      " most "
        db      01bh, 06bh, 00ah, 01bh, 079h, 020h, 084h
        else
        db      0a4h, 00ah
        db      "most "
        db      01bh, 040h, 020h, 01bh, 055h, 020h, 084h
        endif
        db      " spin up "
        db      084h
        if      FW_VERSION >= 312
        db      " speed "
        db      0e9h, 020h, 01bh, 0ach, 02dh, 075h, 070h, 02ch, 00ah
        elseif  FW_VERSION = 311
        db      " speed "
        db      0eah, 020h, 01bh, 05fh, 02dh, 075h, 070h, 02ch, 00ah
        else
        db      " speed,"
        db      00ah
        endif
        db      "but "
        if      FW_VERSION >= 312
        db      01bh, 0b8h
        db      " may require "
        db      01bh, 00eh, 020h, 0afh, 02eh, 00ah, 000h, 089h, 020h, 0a9h, 020h, 01bh, 040h, 020h, 0c6h, 02eh
        db      020h, 01bh, 0d5h, 020h, 099h, 020h, 01bh, 0a8h, 00ah, 081h, 020h, 082h, 020h, 0adh
        elseif  FW_VERSION = 311
        db      01bh
        db      "m may require "
        db      0f3h, 020h, 0afh, 02eh, 00ah, 000h, 08bh, 020h, 0adh, 020h, 01bh, 054h, 020h, 0c3h, 02eh, 020h
        db      01bh, 0bfh, 020h, 096h, 020h, 01bh, 05bh, 00ah, 081h, 020h, 082h, 020h, 0aah
        else
        db      01bh
        db      "[ may require "
        db      01bh, 01ah, 020h, 0ach, 02eh, 00ah, 000h, 089h, 020h, 0aah, 020h, 01bh, 048h, 020h, 0bbh
        db      ". It "
        db      0a6h, 020h, 01bh, 04bh, 00ah, 081h, 020h, 082h, 020h, 0abh
        endif
        db      " master "
        if      FW_VERSION >= 312
        db      0c6h, 02ch, 020h, 01bh, 07bh, 00ah, 0e9h, 020h, 081h, 020h, 01bh, 070h, 020h, 09eh, 020h, 081h
        db      020h, 01bh, 0a9h, 02fh, 01bh, 048h, 00ah, 09dh, 02eh, 00ah, 000h, 01bh, 048h, 020h, 01bh, 07ah
        db      020h, 0a9h, 020h, 082h, 027h, 073h, 020h, 0c6h, 00ah, 01bh, 070h, 020h, 028h, 0b1h, 020h, 085h
        db      020h, 0a2h, 020h, 0b6h, 00ah, 082h, 020h, 099h, 020h, 01bh, 002h, 029h, 02eh, 00ah, 01bh, 0a9h
        db      020h, 01bh
        db      "z a "
        db      01bh, 036h, 020h, 0c6h, 020h, 01bh, 070h, 020h, 01bh, 056h, 00ah, 0bah, 020h, 01bh, 06eh, 020h
        db      028h, 01bh, 087h, 020h, 0a0h, 020h, 099h, 020h, 01bh, 04ah, 020h, 0aeh, 020h, 081h, 00ah, 01bh
        db      02eh, 020h, 08fh, 029h, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      0c3h, 02ch, 020h, 01bh, 07eh, 00ah, 0eah, 020h, 081h, 020h, 01bh, 07ch, 020h, 09eh, 020h, 081h
        db      020h, 01bh, 0bdh, 02fh, 01bh, 068h, 00ah, 0a0h, 02eh, 00ah, 000h, 01bh, 068h, 020h, 01bh, 0b0h
        db      020h, 0adh, 020h, 082h, 027h, 073h, 020h, 0c3h, 00ah, 01bh, 07ch, 020h, 028h, 0b3h, 020h, 085h
        db      020h, 0a2h, 020h, 0c1h, 00ah, 082h, 020h, 096h, 020h, 01bh, 019h, 029h, 02eh, 00ah, 01bh, 0bdh
        db      020h, 01bh, 0b0h, 020h, 061h, 020h, 01bh, 03eh, 020h, 0c3h, 020h, 01bh, 07ch, 020h, 01bh, 04ch
        db      00ah, 0b9h, 020h, 01bh, 08ah, 020h, 028h, 01bh, 0c5h, 020h, 0a4h, 020h, 096h, 020h, 0fdh, 020h
        db      0ach, 020h, 081h, 00ah, 01bh, 040h, 020h, 091h, 029h, 02eh, 00ah, 000h
        else
        db      0bbh, 02ch, 020h, 01bh, 06eh, 00ah, 0efh, 020h, 081h, 020h, 01bh, 075h, 020h, 09dh, 020h, 081h
        db      020h, 01bh, 0a0h, 02fh, 01bh, 050h, 00ah, 0a0h, 02eh, 00ah, 000h, 01bh, 050h, 020h, 01bh, 07dh
        db      020h, 0aah, 020h, 082h, 027h, 073h, 020h, 0bbh, 00ah, 01bh, 075h, 020h, 028h, 0b3h, 020h, 085h
        db      020h, 09bh, 020h, 0bah, 00ah, 082h, 020h, 0a6h, 020h, 01bh, 00bh, 029h, 02eh, 00ah, 01bh, 0a0h
        db      020h, 01bh, 07dh, 020h, 061h, 020h, 01bh, 044h, 020h, 0bbh, 020h, 01bh, 075h, 020h, 01bh, 034h
        db      00ah, 0b9h, 020h, 01bh, 0dah, 020h, 028h, 01bh, 0a9h, 020h, 0a1h, 020h, 0a6h, 020h, 01bh, 09ch
        db      020h, 0b0h, 020h, 081h, 00ah, 01bh, 02fh, 020h, 093h, 029h, 02eh, 00ah, 000h
        endif
        db      "BPM displays "
        if      FW_VERSION >= 312
        db      0c6h, 020h, 0aeh
        elseif  FW_VERSION = 311
        db      0c3h, 020h, 0ach
        else
        db      0bbh, 020h, 0b0h
        endif
        db      " beats per minute."
        db      00ah
        db      "FPB displays "
        if      FW_VERSION >= 312
        db      0c6h, 020h, 0aeh
        elseif  FW_VERSION = 311
        db      0c3h, 020h, 0ach
        else
        db      0bbh, 020h, 0b0h
        endif
        db      " frames per beat."
        if      FW_VERSION >= 312
        db      00ah, 028h, 01bh, 09dh, 020h, 022h, 01bh, 01eh, 022h, 020h, 09dh, 020h, 0aeh
        elseif  FW_VERSION = 311
        db      00ah, 028h, 01bh, 070h, 020h, 022h, 01bh, 03ah, 022h, 020h, 0a0h, 020h, 0ach
        else
        db      00ah, 028h, 01bh, 05fh, 020h, 022h, 01bh, 02bh, 022h, 020h, 0a0h, 020h, 0b0h
        endif
        db      " Tempo "
        if      FW_VERSION >= 312
        db      0beh, 020h, 084h, 00ah, 09bh, 020h, 083h, 020h, 09eh
        db      " frames per "
        db      01bh, 05fh, 02eh, 029h, 00ah, 000h, 01bh, 01eh
        db      " Per Second rates: 24 (film),"
        elseif  FW_VERSION = 311
        db      0cbh, 020h, 084h, 00ah, 093h, 020h, 083h, 020h, 09eh
        db      " frames per second.)"
        db      00ah, 000h, 01bh
        db      ": Per Second rates: 24 (film),"
        else
        db      0c8h, 020h, 084h, 00ah, 092h, 020h, 083h, 020h, 09dh
        db      " frames per "
        db      01bh, 0edh, 02eh, 029h, 00ah, 000h, 01bh
        db      "+ Per Second rates: 24 (film),"
        endif
        db      00ah
        db      "25 (PAL video), 30 (non drop), "
        if      FW_VERSION <> 311
        db      091h, 00ah
        else
        db      08eh, 00ah
        endif
        db      "29.97 DROP (drop frame, erroneously"
        if      FW_VERSION >= 312
        db      00ah, 01bh, 0f6h, 020h, 022h
        elseif  FW_VERSION = 311
        db      00ah
        db      "called "
        db      022h
        else
        db      00ah, 01bh, 0e3h, 020h, 022h
        endif
        db      "30DROP"
        if      FW_VERSION >= 312
        db      022h, 020h, 0aeh
        db      " old "
        db      01bh, 099h, 029h, 02eh, 020h, 08ch, 00ah, 099h, 020h, 01bh, 010h, 020h, 084h
        elseif  FW_VERSION = 311
        db      022h, 020h, 0ach
        db      " old software). "
        db      08dh, 00ah, 096h, 020h, 0fah, 020h, 084h
        else
        db      022h, 020h, 0b0h
        db      " old software). "
        db      08dh, 00ah, 0a6h, 020h, 0fbh, 020h, 084h
        endif
        db      " calculate FPB display "
        if      FW_VERSION >= 312
        db      091h, 00ah, 01bh
        db      "y generate/read rate."
        elseif  FW_VERSION = 311
        db      08eh, 00ah, 01bh, 087h
        db      " generate/read rate."
        else
        db      091h, 00ah, 01bh, 0a8h
        db      " generate/read rate."
        endif
        db      00ah, 000h
        db      "Playing "
        if      FW_VERSION >= 312
        db      01bh, 08fh, 020h, 031h, 02fh, 034h, 02dh, 0aah, 020h, 0e9h
        elseif  FW_VERSION = 311
        db      01bh, 0abh, 020h, 031h, 02fh, 034h, 02dh, 0aeh, 020h, 0eah
        else
        db      01bh, 091h, 020h, 031h, 02fh, 034h, 02dh, 0a8h, 020h, 0efh
        endif
        db      " TAP"
        db      00ah
        db      "TEMPO button recalculates "
        if      FW_VERSION >= 312
        db      081h, 020h, 0c6h, 020h, 084h, 00ah
        elseif  FW_VERSION = 311
        db      081h, 020h, 0c3h, 020h, 084h, 00ah
        else
        db      081h, 020h, 0bbh, 020h, 084h, 00ah
        endif
        db      "match "
        db      081h
        db      " taps. Averaging a few taps"
        db      00ah
        if      FW_VERSION >= 312
        db      "helps smooth out "
        db      01bh
        db      "= errors. "
        db      08eh, 00ah, 0bbh
        elseif  FW_VERSION = 311
        db      "helps smooth "
        db      01bh, 0fdh, 020h, 01bh
        db      "Z errors. "
        db      08fh, 00ah, 0b4h
        else
        db      "helps smooth "
        db      01bh, 0d6h, 020h, 01bh
        db      "A errors. "
        db      08fh, 00ah, 0b1h
        endif
        db      " how "
        if      FW_VERSION >= 312
        db      01bh, 0bdh
        elseif  FW_VERSION = 311
        db      01bh, 0e3h
        else
        db      01bh, 0b8h
        endif
        db      " taps (2-4) "
        if      FW_VERSION >= 312
        db      0e2h
        elseif  FW_VERSION = 311
        db      0cfh
        else
        db      0d6h
        endif
        db      " averaged"
        db      00ah, 084h
        db      " get "
        if      FW_VERSION >= 312
        db      081h, 020h, 0c5h, 020h, 0c6h, 02eh, 00ah, 000h, 0fbh, 020h, 0c7h, 020h, 09eh, 020h, 01bh, 075h
        db      020h, 084h, 020h, 096h, 020h, 01bh, 04eh, 02eh, 00ah, 09fh, 020h, 01bh, 097h
        elseif  FW_VERSION = 311
        db      081h, 020h, 0d0h, 020h, 0c3h, 02eh, 00ah, 000h, 01bh, 001h, 020h, 0ceh, 020h, 09eh, 020h, 01bh
        db      090h, 020h, 084h, 020h, 097h, 020h, 01bh, 05dh, 02eh, 00ah, 092h, 020h, 01bh, 0b3h
        else
        db      081h, 020h, 0c4h, 020h, 0bbh, 02eh, 00ah, 000h, 01bh, 009h, 020h, 0c3h, 020h, 09dh, 020h, 01bh
        db      07bh, 020h, 084h, 020h, 098h, 020h, 01bh, 086h, 02eh, 00ah, 090h, 020h, 01bh, 08bh
        endif
        db      " KEY 1 "
        db      084h
        db      " ignore "
        if      FW_VERSION >= 312
        db      0adh
        elseif  FW_VERSION = 311
        db      0aah
        else
        db      0abh
        endif
        db      " respond"
        if      FW_VERSION >= 312
        db      00ah, 084h, 020h, 01bh, 075h, 020h, 01bh, 0eeh, 02eh, 00ah, 000h, 089h, 020h, 01bh, 079h, 020h
        db      083h
        elseif  FW_VERSION = 311
        db      00ah, 084h, 020h, 01bh, 090h
        db      " signal."
        db      00ah, 000h, 08bh, 020h, 01bh, 087h, 020h, 083h
        else
        db      00ah, 084h, 020h, 01bh, 07bh, 020h, 01bh, 0f0h, 02eh, 00ah, 000h, 089h, 020h, 01bh, 0a8h, 020h
        db      083h
        endif
        db      " (Hours, "
        if      FW_VERSION >= 312
        db      01bh, 0b9h, 02ch, 00ah, 01bh, 003h, 02ch, 020h, 01bh, 01eh, 02ch, 020h, 031h, 02fh, 031h, 030h
        db      030h, 020h, 01bh, 01eh, 029h, 00ah, 01bh, 01ch, 020h, 084h, 020h, 081h, 020h, 0d5h, 020h, 09eh
        db      020h, 081h, 00ah, 0dbh, 020h, 082h, 020h, 028h, 01bh, 0beh, 020h, 01bh, 0f6h, 020h, 022h
        elseif  FW_VERSION = 311
        db      01bh, 0e2h, 02ch, 00ah, 01bh, 017h, 02ch, 020h, 01bh, 03ah, 02ch, 020h, 031h, 02fh, 031h, 030h
        db      030h, 020h, 01bh, 03ah, 029h, 00ah, 01bh, 02ch, 020h, 084h, 020h, 081h, 020h, 0d7h, 020h, 09eh
        db      020h, 081h, 00ah, 0deh, 020h, 082h
        db      " (also called "
        db      022h
        else
        db      01bh, 0b5h, 02ch, 00ah, 01bh, 001h, 02ch, 020h, 01bh, 02bh, 02ch, 020h, 031h, 02fh, 031h, 030h
        db      030h, 020h, 01bh, 02bh, 029h, 00ah, 01bh, 026h, 020h, 084h, 020h, 081h, 020h, 0d3h, 020h, 09dh
        db      020h, 081h, 00ah, 0e8h, 020h, 082h
        db      " (also "
        db      01bh, 0e3h, 020h, 022h
        endif
        db      "offset"
        if      FW_VERSION >= 312
        db      022h, 029h, 02eh, 00ah, 01bh, 0d5h, 020h, 099h, 020h, 01bh, 010h, 020h, 084h
        elseif  FW_VERSION = 311
        db      022h, 029h, 02eh, 00ah, 01bh, 0bfh, 020h, 096h, 020h, 0fah, 020h, 084h
        else
        db      022h, 029h, 02eh, 00ah, 049h, 074h, 020h, 0a6h, 020h, 0fbh, 020h, 084h
        endif
        db      " place "
        if      FW_VERSION >= 312
        db      081h, 020h, 082h, 020h, 0aeh, 00ah
        elseif  FW_VERSION = 311
        db      081h, 020h, 082h, 020h, 0ach, 00ah
        else
        db      081h, 020h, 082h, 020h, 0b0h, 00ah
        endif
        db      "precise "
        if      FW_VERSION >= 312
        db      01bh, 075h, 020h, 0d3h
        elseif  FW_VERSION = 311
        db      01bh, 090h, 020h, 0d8h
        else
        db      01bh, 07bh, 020h, 0e1h
        endif
        db      " a tape "
        if      FW_VERSION >= 312
        db      088h, 02eh, 020h, 01bh, 0d5h, 020h, 099h, 00ah
        elseif  FW_VERSION = 311
        db      087h, 02eh, 020h, 01bh, 0bfh, 020h, 096h, 00ah
        else
        db      087h
        db      ". It "
        db      0a6h, 00ah
        endif
        db      "stored "
        if      FW_VERSION >= 312
        db      084h, 020h, 095h, 020h, 0aeh, 020h, 081h, 020h, 082h, 020h, 08fh, 02eh, 00ah, 000h, 08ch
        elseif  FW_VERSION = 311
        db      084h, 020h, 094h, 020h, 0ach, 020h, 081h, 020h, 082h, 020h, 091h, 02eh, 00ah, 000h, 08dh
        else
        db      084h, 020h, 095h, 020h, 0b0h, 020h, 081h, 020h, 082h, 020h, 093h, 02eh, 00ah, 000h, 08dh
        endif
        db      " causes "
        if      FW_VERSION >= 312
        db      081h, 020h, 082h, 020h, 084h, 020h, 0ach, 020h, 031h, 02dh, 032h, 030h, 00ah, 01bh, 085h
        elseif  FW_VERSION = 311
        db      081h, 020h, 082h, 020h, 084h, 020h, 0b0h, 020h, 031h, 02dh, 032h, 030h, 00ah, 01bh, 0a1h
        else
        db      081h, 020h, 082h, 020h, 084h, 020h, 0afh, 020h, 031h, 02dh, 032h, 030h, 00ah, 01bh, 083h
        endif
        db      " early relative "
        if      FW_VERSION >= 312
        db      084h, 020h, 081h, 00ah, 01bh, 000h, 020h, 01bh, 075h, 020h, 01bh, 0eeh, 02eh, 00ah, 000h, 0fbh
        db      020h, 0b1h, 020h, 09eh, 020h, 081h
        db      " two "
        db      086h
        elseif  FW_VERSION = 311
        db      084h, 020h, 081h, 00ah, 01bh, 011h, 020h, 01bh, 090h
        db      " signal."
        db      00ah, 000h, 01bh, 001h, 020h, 0b3h, 020h, 09eh, 020h, 081h, 020h, 01bh, 0fah, 020h, 086h
        else
        db      084h, 020h, 081h, 00ah, 01bh, 04dh, 020h, 01bh, 07bh, 020h, 01bh, 0f0h, 02eh, 00ah, 000h, 01bh
        db      009h, 020h, 0b3h, 020h, 09dh, 020h, 081h
        db      " two "
        db      08eh
        endif
        db      " inputs"
        if      FW_VERSION >= 312
        db      00ah, 085h, 020h, 01bh, 06fh, 020h, 01bh
        db      "u signals."
        elseif  FW_VERSION = 311
        db      00ah, 085h, 020h, 01bh, 089h, 020h, 01bh, 090h
        db      " signals."
        else
        db      00ah, 085h, 020h, 01bh, 066h, 020h, 01bh
        db      "{ signals."
        endif
        db      00ah, 000h
        db      "ON: "
        if      FW_VERSION >= 311
        db      086h
        else
        db      08eh
        endif
        db      " Song Position Pointer "
        if      FW_VERSION >= 312
        db      0ffh, 00ah, 0e2h
        elseif  FW_VERSION = 311
        db      01bh, 015h, 00ah, 0cfh
        else
        db      01bh, 002h, 00ah, 0d6h
        endif
        db      " recognized ("
        if      FW_VERSION >= 312
        db      01bh, 000h, 020h, 0e5h, 020h, 01bh, 074h, 00ah, 0a2h, 020h, 01bh
        db      "i3000's "
        db      0d4h, 020h, 01bh, 0eah, 00ah, 082h, 020h, 0adh, 020h, 0bch, 029h, 02eh, 00ah, 01bh, 012h
        db      ": these "
        db      0ffh, 020h, 0e2h, 020h, 01bh, 042h, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      01bh, 011h, 020h, 0cah, 020h, 01bh, 02bh, 00ah, 0a2h, 020h, 01bh
        db      "d3000's "
        db      0e1h
        db      " within"
        db      00ah, 082h, 020h, 0aah, 020h, 0bbh, 029h, 02eh, 00ah, 01bh
        db      "2: these "
        db      01bh, 015h, 020h, 0cfh, 020h, 01bh, 05ch, 02eh, 00ah, 000h
        else
        db      01bh
        db      "M device "
        db      01bh, 036h, 00ah, 09bh
        db      " MPC3000's "
        db      0dah, 020h, 01bh, 0f4h, 00ah, 082h, 020h, 0abh, 020h, 0b5h, 029h, 02eh, 00ah, 01bh
        db      "%: these "
        db      01bh, 002h, 020h, 0d6h, 020h, 01bh, 03dh, 02eh, 00ah, 000h
        endif
        db      "BAR 1: "
        if      FW_VERSION >= 312
        db      082h, 020h, 085h, 020h, 0ach, 020h, 0c0h, 020h, 0d5h, 00ah, 0b6h, 020h, 01bh
        db      "u pulses arrive."
        elseif  FW_VERSION = 311
        db      082h, 020h, 085h, 020h, 0b0h, 020h, 0b7h, 020h, 0d7h, 00ah, 0c1h, 020h, 01bh, 090h
        db      " pulses arrive."
        else
        db      082h, 020h, 085h, 020h, 0afh, 020h, 0b4h, 020h, 0d3h, 00ah, 0bah, 020h, 01bh
        db      "{ pulses arrive."
        endif
        db      00ah
        db      "THIS BAR: "
        if      FW_VERSION >= 312
        db      082h, 020h, 085h, 020h, 0ach, 020h, 0c0h, 00ah, 0a9h, 020h, 01bh, 077h, 02eh, 00ah, 000h, 0fbh
        db      020h, 01bh, 07eh, 020h, 086h
        elseif  FW_VERSION = 311
        db      082h, 020h, 085h, 020h, 0b0h, 020h, 0b7h, 00ah, 0adh, 020h, 01bh, 060h, 02eh, 00ah, 000h, 01bh
        db      001h, 020h, 01bh, 07ah, 020h, 086h
        else
        db      082h, 020h, 085h, 020h, 0afh, 020h, 0b4h, 00ah, 0aah, 020h, 01bh, 053h, 02eh, 00ah, 000h, 01bh
        db      009h, 020h, 01bh, 0b1h, 020h, 08eh
        endif
        db      " clock ("
        if      FW_VERSION >= 312
        db      0d3h
        elseif  FW_VERSION = 311
        db      0d8h
        else
        db      0e1h
        endif
        db      " SPP)"
        if      FW_VERSION >= 312
        db      00ah, 099h, 020h, 01bh, 0d7h, 020h, 091h, 020h, 01bh
        db      "F so, "
        db      0c0h, 020h, 0b1h, 020h, 086h, 00ah, 0b5h, 020h, 01bh, 0c7h, 02eh, 00ah, 000h, 0fbh, 020h, 01bh
        db      07eh, 020h, 086h
        db      " Time Code "
        db      099h, 00ah, 01bh, 0d7h, 020h, 091h, 020h, 01bh
        db      "F so, "
        db      0c0h, 020h, 0b1h, 020h, 086h, 00ah, 0b5h, 020h, 01bh, 0c7h, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      00ah, 096h, 020h, 01bh, 0f0h, 020h, 08eh, 020h, 01bh
        db      "S so, "
        db      0b7h, 020h, 0b3h, 020h, 086h, 00ah, 0b5h, 020h, 01bh, 0d1h, 02eh, 00ah, 000h, 01bh, 001h, 020h
        db      01bh, 07ah, 020h, 086h
        db      " Time Code "
        db      096h, 00ah, 01bh, 0f0h, 020h, 08eh, 020h, 01bh
        db      "S so, "
        db      0b7h, 020h, 0b3h, 020h, 086h, 00ah, 0b5h, 020h, 01bh, 0d1h, 02eh, 00ah, 000h
        else
        db      00ah, 0a6h
        db      " generated "
        db      091h, 020h, 01bh
        db      "Y so, "
        db      0b4h, 020h, 0b3h, 020h, 08eh, 00ah, 0c7h, 020h, 01bh, 0f2h, 02eh, 00ah, 000h
        endif
        db      "Pressing <Start> "
        db      085h
        db      " generate "
        if      FW_VERSION >= 312
        db      01bh, 079h, 02eh, 00ah, 01bh, 0a7h
        db      " four "
        db      0e7h, 020h, 0feh, 020h, 081h, 020h, 01bh, 096h, 00ah, 01bh, 079h, 020h, 0afh
        elseif  FW_VERSION = 311
        db      01bh, 087h, 02eh, 00ah, 01bh, 088h
        db      " four "
        db      0e7h, 020h, 01bh, 00fh, 020h, 081h, 020h, 01bh, 0b4h, 00ah, 01bh, 087h, 020h, 0afh
        else
        db      01bh, 0a8h, 02eh, 00ah, 01bh
        db      "w four "
        db      0ddh, 020h, 01bh, 018h, 020h, 081h, 020h, 01bh, 08dh, 00ah, 01bh, 0a8h, 020h, 0ach
        endif
        db      " (Hours, "
        if      FW_VERSION >= 312
        db      01bh, 0b9h, 02ch, 020h, 01bh, 003h, 02ch, 00ah, 01bh, 01eh, 029h, 02eh, 00ah, 09fh
        elseif  FW_VERSION = 311
        db      01bh, 0e2h, 02ch, 020h, 01bh, 017h, 02ch, 00ah, 01bh, 03ah, 029h, 02eh, 00ah, 092h
        else
        db      01bh, 0b5h, 02ch, 020h, 01bh, 001h, 02ch, 00ah, 01bh, 02bh, 029h, 02eh, 00ah, 090h
        endif
        db      " <Stop> "
        db      084h
        db      " stop generation."
        db      00ah, 000h
        db      "ON: "
        if      FW_VERSION >= 312
        db      0c6h, 020h, 0b0h, 020h, 01bh, 0f1h, 020h, 0e0h, 020h, 085h, 020h, 096h, 00ah, 01bh, 010h, 02eh
        db      00ah, 01bh, 012h, 03ah, 020h, 0c6h, 020h, 0b0h, 020h, 01bh, 0f1h, 020h, 0e0h, 020h, 085h, 020h
        db      096h, 00ah, 01bh, 042h, 02eh, 00ah, 000h, 089h, 020h, 093h, 020h, 028h, 01bh, 024h, 02eh, 0e3h
        db      02eh, 0e4h, 029h, 020h, 09eh, 020h, 081h, 00ah, 0c6h, 020h, 0a2h, 020h, 084h, 020h, 096h, 020h
        db      0fdh, 020h, 0d1h, 020h, 081h, 00ah, 082h, 020h, 0b6h, 020h, 03ch, 01bh, 0ffh
        db      " New> "
        db      099h, 020h, 0b7h, 02eh, 00ah, 000h
        db      "Change "
        db      087h, 020h, 083h, 020h, 084h
        elseif  FW_VERSION = 311
        db      0c3h, 020h, 0b2h
        db      " listed "
        db      0edh, 020h, 085h, 020h, 097h, 00ah, 0fah, 02eh, 00ah, 01bh, 032h, 03ah, 020h, 0c3h, 020h, 0b2h
        db      " listed "
        db      0edh, 020h, 085h, 020h, 097h, 00ah, 01bh, 05ch, 02eh, 00ah, 000h, 08bh, 020h, 099h, 020h, 028h
        db      01bh, 03fh, 02eh, 0f0h, 02eh, 0f1h, 029h, 020h, 09eh, 020h, 081h, 00ah, 0c3h, 020h, 0a2h, 020h
        db      084h, 020h, 097h, 020h, 01bh, 010h, 020h, 0d9h, 020h, 081h, 00ah, 082h, 020h, 0c1h
        db      " <Insert New> "
        db      096h, 020h, 0bch, 02eh, 00ah, 000h
        db      "Change "
        db      088h, 020h, 083h, 020h, 084h
        else
        db      0bbh, 020h, 0aeh, 020h, 01bh, 0fdh, 020h, 0e4h, 020h, 085h, 020h, 098h, 00ah, 0fbh, 02eh, 00ah
        db      01bh, 025h, 03ah, 020h, 0bbh, 020h, 0aeh, 020h, 01bh, 0fdh, 020h, 0e4h, 020h, 085h, 020h, 098h
        db      00ah, 01bh, 03dh, 02eh, 00ah, 000h, 089h, 020h, 099h, 020h, 028h, 01bh, 02eh, 02eh, 0e7h, 02eh
        db      0e5h, 029h, 020h, 09dh, 020h, 081h, 00ah, 0bbh, 020h, 09bh, 020h, 084h, 020h, 098h, 020h, 01bh
        db      006h, 020h, 0e0h, 020h, 081h, 00ah, 082h, 020h, 0bah, 020h, 03ch, 01bh, 0f9h
        db      " New> "
        db      0a6h, 020h, 0bdh, 02eh, 00ah, 000h, 01bh, 0f7h, 020h, 086h, 020h, 083h, 020h, 084h
        endif
        db      " view "
        if      FW_VERSION >= 312
        db      081h, 020h, 0c6h, 00ah, 0b0h, 020h, 0a4h, 020h, 087h, 020h, 082h, 02eh, 020h, 01bh, 0c4h, 020h
        db      01bh, 074h, 020h, 01bh, 0beh, 00ah, 01bh, 06bh, 020h, 081h
        elseif  FW_VERSION = 311
        db      081h, 020h, 0c3h, 00ah, 0b2h, 020h, 0a5h, 020h, 088h, 020h, 082h, 02eh, 020h, 01bh, 0a0h, 020h
        db      01bh
        db      "+ also"
        db      00ah, 01bh, 0c4h, 020h, 081h
        else
        db      081h, 020h, 0bbh, 00ah, 0aeh, 020h, 0a4h, 020h, 086h, 020h, 082h, 02eh, 020h, 01bh, 0aah, 020h
        db      01bh
        db      "6 also"
        db      00ah, 01bh, 0bfh, 020h, 081h
        endif
        db      " <Previous> "
        if      FW_VERSION <> 311
        db      091h
        else
        db      08eh
        endif
        db      " <Next> soft"
        if      FW_VERSION >= 312
        db      00ah, 01bh, 026h, 02eh, 00ah, 000h, 089h, 020h, 01bh, 0c3h, 020h, 09eh
        elseif  FW_VERSION = 311
        db      00ah, 01bh, 042h, 02eh, 00ah, 000h, 08bh, 020h, 01bh, 0dbh, 020h, 09eh
        else
        db      00ah, 01bh, 032h, 02eh, 00ah, 000h, 089h, 020h, 01bh, 0c2h, 020h, 09dh
        endif
        db      " base "
        if      FW_VERSION >= 312
        db      0c6h, 020h, 028h, 01bh, 073h, 020h, 0e9h, 00ah, 022h
        elseif  FW_VERSION = 311
        db      0c3h, 020h, 028h, 01bh, 00dh, 020h, 0eah, 00ah, 022h
        else
        db      0bbh, 020h, 028h, 01bh, 012h, 020h, 0efh, 00ah, 022h
        endif
        db      "Tempo"
        if      FW_VERSION >= 312
        db      022h, 020h, 0beh, 029h, 020h, 0edh, 020h, 085h, 020h, 096h, 020h, 01bh, 010h, 02ch, 00ah, 01bh
        db      096h, 020h, 01bh, 056h, 020h, 081h, 020h, 01bh, 00ch, 020h, 093h, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      022h, 020h, 0cbh, 029h, 020h, 0ech, 020h, 085h, 020h, 097h, 020h, 0fah, 02ch, 00ah, 01bh, 0b4h
        db      020h, 01bh, 04ch, 020h, 081h, 020h, 01bh, 021h, 020h, 099h, 02eh, 00ah
        db      "For example, 200.0 doubles "
        db      081h, 020h, 0c3h, 03bh, 00ah
        db      "50.0 cuts "
        db      0f5h, 020h, 0ach
        db      " half. "
        db      022h
        db      "Tempo"
        db      022h
        db      " column"
        db      00ah, 01bh, 062h, 020h, 081h
        db      " actual rate."
        db      00ah, 000h
        else
        db      022h, 020h, 0c8h, 029h, 020h, 0dfh, 020h, 085h, 020h, 098h, 020h, 0fbh, 02ch, 00ah, 01bh, 08dh
        db      020h, 01bh, 034h, 020h, 081h, 020h, 01bh, 017h, 020h, 099h, 02eh, 00ah
        db      "For example, 200.0 doubles "
        db      081h, 020h, 0bbh, 03bh, 00ah
        db      "50.0 cuts "
        db      0dch, 020h, 0b0h
        db      " half. "
        db      022h
        db      "Tempo"
        db      022h
        db      " column"
        db      00ah, 01bh, 051h, 020h, 081h
        db      " actual rate."
        db      00ah, 000h
        endif
        db      "A SONG "
        if      FW_VERSION >= 312
        db      099h
        elseif  FW_VERSION = 311
        db      096h
        else
        db      0a6h
        endif
        db      " a list "
        if      FW_VERSION >= 312
        db      09eh, 020h, 09ch, 020h, 0e6h, 00ah, 0cch, 020h, 01bh, 0b3h, 020h, 0a8h
        db      ". Each "
        db      01bh, 0f4h, 020h, 0aeh, 020h, 081h, 00ah, 0bch, 020h, 0b9h, 020h, 061h, 020h, 082h, 020h, 083h
        db      020h, 091h, 020h, 081h, 00ah, 083h, 020h, 09eh, 020h, 01bh, 045h, 020h, 0f1h, 020h, 085h, 020h
        db      0ach, 02eh, 00ah, 0d8h, 020h, 0e2h, 020h, 032h, 030h, 020h, 01bh, 0e1h, 02ch, 020h, 01bh, 027h
        db      020h, 0a7h, 020h, 075h, 070h, 00ah, 084h
        db      " 250 steps. "
        db      08ch, 020h, 09dh, 020h, 01bh, 0c5h, 020h, 0b1h, 00ah, 0bch, 020h, 099h, 020h, 01bh, 035h, 020h
        db      0aeh, 020h, 01bh, 06bh, 02eh, 00ah, 000h, 089h, 020h, 031h, 036h, 02dh, 01bh, 083h, 020h, 0bch
        db      020h, 0a1h, 02eh, 00ah, 01bh, 043h, 020h, 0c3h, 03ah, 020h, 08bh, 020h, 02bh, 02fh, 02dh, 02ch
        db      020h, 0c7h, 020h, 0c5h, 020h, 0a1h, 02ch, 00ah, 097h, 020h, 0d0h, 02eh, 00ah, 000h, 01bh, 012h
        db      03ah, 020h, 081h, 020h, 0bch, 020h, 085h
        elseif  FW_VERSION = 311
        db      09eh, 020h, 09dh, 020h, 0f4h, 00ah, 0d1h, 020h, 01bh, 085h, 020h, 0a9h, 02eh, 020h, 01bh, 0e0h
        db      " STEP "
        db      0ach, 020h, 081h, 00ah, 0bbh, 020h, 0beh, 020h, 061h, 020h, 082h, 020h, 083h, 020h, 08eh, 020h
        db      081h, 00ah, 083h, 020h, 09eh, 020h, 01bh, 052h, 020h, 0f5h, 020h, 085h, 020h, 0b0h, 02eh, 00ah
        db      0dah, 020h, 0cfh, 020h, 032h, 030h, 020h, 01bh, 0f6h, 02ch, 020h, 01bh, 035h, 020h, 09fh, 020h
        db      075h, 070h, 00ah, 084h, 020h, 032h, 035h, 030h, 020h, 01bh, 0f8h, 02eh, 020h, 08dh, 020h, 0a0h
        db      020h, 01bh, 0eah, 020h, 0b3h, 00ah, 0bbh, 020h, 096h, 020h, 01bh, 026h, 020h, 0ach, 020h, 01bh
        db      0c4h, 02eh, 00ah, 000h, 08bh, 020h, 031h, 036h, 02dh, 01bh, 023h, 020h, 0bbh, 020h, 0abh, 02eh
        db      00ah, 01bh, 04bh, 020h, 0c7h, 03ah, 020h, 089h, 020h, 02bh, 02fh, 02dh, 02ch, 020h, 0ceh, 020h
        db      0d0h, 020h, 0abh, 02ch, 00ah, 09ch
        phase   2380h
        db      020h, 0ddh, 02eh, 00ah, 000h, 01bh, 032h, 03ah, 020h, 081h, 020h, 0bbh, 020h, 085h
        else
        db      09dh, 020h, 09ch, 020h, 0ech, 00ah, 0d5h, 020h, 01bh, 06bh, 020h, 0a7h, 02eh, 020h, 01bh, 0bch
        db      020h, 01bh, 0e8h, 020h, 0b0h, 020h, 081h, 00ah, 0b5h, 020h, 0cfh, 020h, 061h, 020h, 082h, 020h
        db      083h, 020h, 091h, 020h, 081h, 00ah, 083h, 020h, 09dh, 020h, 01bh, 043h, 020h, 0dch, 020h, 085h
        db      020h, 0afh, 02eh, 00ah, 0f4h, 020h, 0d6h, 020h, 032h, 030h, 020h, 01bh, 0cfh, 02ch, 020h, 01bh
        db      05ah, 020h, 09eh, 020h, 075h, 070h, 00ah, 084h, 020h, 032h, 035h, 030h, 020h, 01bh, 0d1h, 02eh
        db      020h, 08dh, 020h, 0a0h, 020h, 01bh, 0c8h, 020h, 0b3h, 00ah, 0b5h, 020h, 0a6h, 020h, 01bh, 010h
        db      020h, 0b0h, 020h, 01bh, 0bfh, 02eh, 00ah, 000h, 089h, 020h, 031h, 036h, 02dh, 01bh, 013h, 020h
        db      0b5h, 020h, 0adh, 02eh, 00ah, 01bh, 03ch, 020h, 0beh, 03ah, 020h, 088h, 020h, 02bh, 02fh, 02dh
        db      02ch, 020h, 0c3h, 020h, 0c4h, 020h, 0adh, 02ch, 00ah, 09ah, 020h, 0d4h, 02eh, 00ah, 000h, 01bh
        db      025h, 03ah, 020h, 081h, 020h, 0b5h, 020h, 085h
        endif
        db      " stop "
        if      FW_VERSION >= 312
        db      01bh, 056h, 020h, 01bh, 087h, 020h, 01bh, 086h, 02eh, 00ah, 054h, 04fh, 020h, 01bh, 0f4h, 03ah
        db      020h, 081h, 020h, 0bch, 020h, 085h, 020h, 01bh, 08ah, 020h, 01bh, 094h, 020h, 084h, 020h, 081h
        db      00ah, 0f3h, 020h, 01bh, 02bh, 020h, 0aeh, 020h, 081h
        elseif  FW_VERSION = 311
        db      01bh, 04ch, 020h, 01bh, 0c5h, 020h, 01bh, 09bh, 02eh, 00ah
        db      "TO STEP: "
        db      081h, 020h, 0bbh, 020h, 085h, 020h, 01bh, 0a6h, 020h, 01bh, 0adh, 020h, 084h, 020h, 081h, 00ah
        db      01bh, 006h, 020h, 0fch, 020h, 0ach, 020h, 081h
        else
        db      01bh, 034h, 020h, 01bh, 0a9h, 020h, 01bh, 064h, 02eh, 00ah, 054h, 04fh, 020h, 01bh, 0e8h, 03ah
        db      020h, 081h, 020h, 0b5h, 020h, 085h, 020h, 01bh, 08ah, 020h, 01bh, 08eh, 020h, 084h, 020h, 081h
        db      00ah, 0f9h, 020h, 0f3h, 020h, 0b0h, 020h, 081h
        endif
        db      " next "
        if      FW_VERSION >= 312
        db      09dh, 02eh, 00ah, 000h, 089h, 020h, 0bch, 020h, 085h, 020h, 01bh, 08ah, 020h, 01bh, 094h, 020h
        db      084h, 020h, 087h, 020h, 0f3h, 00ah, 0b6h, 020h, 0f1h
        elseif  FW_VERSION = 311
        db      0a0h, 02eh, 00ah, 000h, 08bh, 020h, 0bbh, 020h, 085h, 020h, 01bh, 0a6h, 020h, 01bh, 0adh, 020h
        db      084h, 020h, 088h, 020h, 01bh, 006h, 00ah, 0c1h, 020h, 0f5h
        else
        db      0a0h, 02eh, 00ah, 000h, 089h, 020h, 0b5h, 020h, 085h, 020h, 01bh, 08ah, 020h, 01bh, 08eh, 020h
        db      084h, 020h, 086h, 020h, 0f9h, 00ah, 0bah, 020h, 0dch
        endif
        db      " reaches "
        if      FW_VERSION >= 312
        db      01bh, 087h, 020h, 01bh, 086h, 02eh, 00ah, 000h, 089h, 020h, 01bh, 079h, 020h, 093h
        elseif  FW_VERSION = 311
        db      01bh, 0c5h, 020h, 01bh, 09bh, 02eh, 00ah, 000h, 08bh, 020h, 01bh, 087h, 020h, 099h
        else
        db      01bh, 0a9h, 020h, 01bh, 064h, 02eh, 00ah, 000h, 089h, 020h, 01bh, 0a8h, 020h, 099h
        endif
        db      " (Hours, "
        if      FW_VERSION >= 312
        db      01bh, 0b9h, 02ch, 00ah, 01bh, 003h, 02ch, 020h, 01bh, 01eh, 02ch, 020h, 031h, 02fh, 031h, 030h
        db      030h, 020h, 01bh, 01eh, 029h, 00ah, 01bh, 01ch, 020h, 084h, 020h, 081h, 020h, 0d5h, 020h, 09eh
        db      020h, 081h, 00ah, 0dbh, 020h, 0bch, 020h, 028h, 01bh, 0beh, 020h, 01bh, 0f6h, 020h, 022h
        elseif  FW_VERSION = 311
        db      01bh, 0e2h, 02ch, 00ah, 01bh, 017h, 02ch, 020h, 01bh, 03ah, 02ch, 020h, 031h, 02fh, 031h, 030h
        db      030h, 020h, 01bh, 03ah, 029h, 00ah, 01bh, 02ch, 020h, 084h, 020h, 081h, 020h, 0d7h, 020h, 09eh
        db      020h, 081h, 00ah, 0deh, 020h, 0bbh
        db      " (also called "
        db      022h
        else
        db      01bh, 0b5h, 02ch, 00ah, 01bh, 001h, 02ch, 020h, 01bh, 02bh, 02ch, 020h, 031h, 02fh, 031h, 030h
        db      030h, 020h, 01bh, 02bh, 029h, 00ah, 01bh, 026h, 020h, 084h, 020h, 081h, 020h, 0d3h, 020h, 09dh
        db      020h, 081h, 00ah, 0e8h, 020h, 0b5h
        db      " (also "
        db      01bh, 0e3h, 020h, 022h
        endif
        db      "offset"
        if      FW_VERSION >= 312
        db      022h, 029h, 02eh, 00ah, 01bh, 0d5h, 020h, 099h, 020h, 01bh, 010h, 020h, 084h
        elseif  FW_VERSION = 311
        db      022h, 029h, 02eh, 00ah, 01bh, 0bfh, 020h, 096h, 020h, 0fah, 020h, 084h
        else
        db      022h, 029h, 02eh, 00ah, 049h, 074h, 020h, 0a6h, 020h, 0fbh, 020h, 084h
        endif
        db      " place "
        if      FW_VERSION >= 312
        db      081h, 020h, 0bch, 020h, 0aeh
        elseif  FW_VERSION = 311
        db      081h, 020h, 0bbh, 020h, 0ach
        else
        db      081h, 020h, 0b5h, 020h, 0b0h
        endif
        db      " precise"
        if      FW_VERSION >= 312
        db      00ah, 01bh, 075h, 020h, 0d3h
        elseif  FW_VERSION = 311
        db      00ah, 01bh, 090h, 020h, 0d8h
        else
        db      00ah, 01bh, 07bh, 020h, 0e1h
        endif
        db      " a tape "
        if      FW_VERSION >= 312
        db      088h, 02eh, 020h, 01bh, 0d5h, 020h, 099h
        elseif  FW_VERSION = 311
        db      087h, 02eh, 020h, 01bh, 0bfh, 020h, 096h
        else
        db      087h
        db      ". It "
        db      0a6h
        endif
        db      " stored "
        if      FW_VERSION >= 312
        db      084h, 00ah, 095h, 020h, 0aeh, 020h, 081h, 020h, 022h, 01bh, 02eh, 022h, 020h, 08fh, 02eh, 00ah
        db      000h, 089h, 020h, 0a9h, 020h, 0f3h, 020h, 083h, 020h, 0aeh, 020h, 081h, 020h, 0bch, 02eh, 00ah
        db      01bh, 0d5h, 020h, 01bh, 074h, 020h, 096h, 020h, 01bh, 002h, 020h, 0d3h, 020h, 081h
        elseif  FW_VERSION = 311
        db      084h, 00ah, 094h, 020h, 0ach, 020h, 081h, 020h, 022h, 01bh, 040h, 022h, 020h, 091h, 02eh, 00ah
        db      000h, 08bh, 020h, 0adh, 020h, 01bh, 006h, 020h, 083h, 020h, 0ach, 020h, 081h, 020h, 0bbh, 02eh
        db      00ah, 01bh, 0bfh, 020h, 01bh, 02bh, 020h, 097h, 020h, 01bh, 019h, 020h, 0d8h, 020h, 081h
        else
        db      084h, 00ah, 095h, 020h, 0b0h, 020h, 081h, 020h, 022h, 01bh, 02fh, 022h, 020h, 093h, 02eh, 00ah
        db      000h, 089h, 020h, 0aah, 020h, 0f9h, 020h, 083h, 020h, 0b0h, 020h, 081h, 020h, 0b5h, 02eh, 00ah
        db      049h, 074h, 020h, 01bh, 036h, 020h, 098h, 020h, 01bh, 00bh, 020h, 0e1h, 020h, 081h
        endif
        db      " <Step+1> "
        if      FW_VERSION <> 311
        db      091h, 00ah
        else
        db      08eh, 00ah
        endif
        db      "<Step-1> soft "
        if      FW_VERSION >= 312
        db      01bh, 026h, 02eh, 00ah
        elseif  FW_VERSION = 311
        db      01bh, 042h, 02eh, 00ah
        else
        db      01bh, 032h, 02eh, 00ah
        endif
        db      "<Ins/Del> "
        if      FW_VERSION >= 312
        db      01bh, 0c9h, 020h, 061h, 020h, 0c5h, 020h, 0f3h, 020h, 0adh
        elseif  FW_VERSION = 311
        db      01bh, 0cch, 020h, 061h, 020h, 0d0h, 020h, 01bh, 006h, 020h, 0aah
        else
        db      01bh, 0b6h, 020h, 061h, 020h, 0c4h, 020h, 0f9h, 020h, 0abh
        endif
        db      " deletes"
        if      FW_VERSION >= 312
        db      00ah, 061h, 06eh, 020h, 0c2h, 020h, 0cch, 02eh, 00ah
        elseif  FW_VERSION = 311
        db      00ah, 01bh, 0ach, 020h, 0bdh, 020h, 0d1h, 02eh, 00ah
        else
        db      00ah, 01bh, 0c5h, 020h, 0b6h, 020h, 0d5h, 02eh, 00ah
        endif
        db      "<Conv2Seq> converts a "
        if      FW_VERSION >= 312
        db      0bch, 020h, 0d1h, 020h, 0cch, 00ah
        elseif  FW_VERSION = 311
        db      0bbh, 020h, 0d9h, 020h, 0d1h, 00ah
        else
        db      0b5h, 020h, 0e0h, 020h, 0d5h, 00ah
        endif
        db      "long "
        if      FW_VERSION >= 312
        db      082h, 02eh, 00ah, 000h, 089h, 020h, 082h, 020h, 083h, 020h, 0edh, 020h, 085h, 020h, 0ach, 020h
        db      0b6h, 00ah, 081h, 020h, 0a9h, 020h, 0f3h, 020h, 01bh, 0e9h, 020h, 0aeh, 020h, 081h, 020h, 0bch
        db      02eh, 00ah, 000h, 089h, 020h, 0a1h, 020h, 09eh, 020h, 081h, 020h, 08dh, 020h, 082h, 02eh, 00ah
        db      01bh, 043h, 020h, 0c3h, 03ah, 020h, 08bh, 020h, 02bh, 02fh, 02dh, 02ch, 020h, 0c7h, 020h, 0c5h
        db      020h, 0a1h, 02ch, 00ah, 097h, 020h, 0d0h, 00ah, 000h, 089h, 020h, 083h, 020h, 09eh, 020h, 01bh
        db      06eh, 020h, 087h, 020h, 082h, 020h, 085h, 00ah, 0ach, 020h, 01bh, 0eah, 020h, 081h, 020h, 0a9h
        db      020h, 0f3h
        elseif  FW_VERSION = 311
        db      082h, 02eh, 00ah, 000h, 08bh, 020h, 082h, 020h, 083h, 020h, 0ech, 020h, 085h, 020h, 0b0h, 020h
        db      0c1h, 00ah, 081h, 020h, 0adh, 020h, 01bh, 006h
        db      " occurs "
        db      0ach, 020h, 081h, 020h, 0bbh, 02eh, 00ah, 000h, 08bh, 020h, 0abh, 020h, 09eh, 020h, 081h, 020h
        db      08ch, 020h, 082h, 02eh, 00ah, 01bh, 04bh, 020h, 0c7h, 03ah, 020h, 089h, 020h, 02bh, 02fh, 02dh
        db      02ch, 020h, 0ceh, 020h, 0d0h, 020h, 0abh, 02ch, 00ah, 09ch, 020h, 0ddh, 00ah, 000h, 08bh, 020h
        db      083h, 020h, 09eh, 020h, 01bh, 08ah, 020h, 088h, 020h, 082h, 020h, 085h, 00ah, 0b0h
        db      " within "
        db      081h, 020h, 0adh, 020h, 01bh, 006h
        else
        db      082h, 02eh, 00ah, 000h, 089h, 020h, 082h, 020h, 083h, 020h, 0dfh, 020h, 085h, 020h, 0afh, 020h
        db      0bah, 00ah, 081h, 020h, 0aah, 020h, 0f9h, 020h, 01bh, 0f1h, 020h, 0b0h, 020h, 081h, 020h, 0b5h
        db      02eh, 00ah, 000h, 089h, 020h, 0adh, 020h, 09dh, 020h, 081h, 020h, 08ah, 020h, 082h, 02eh, 00ah
        db      01bh, 03ch, 020h, 0beh, 03ah, 020h, 088h, 020h, 02bh, 02fh, 02dh, 02ch, 020h, 0c3h, 020h, 0c4h
        db      020h, 0adh, 02ch, 00ah, 09ah, 020h, 0d4h, 00ah, 000h, 089h, 020h, 083h, 020h, 09dh, 020h, 01bh
        db      0dah, 020h, 086h, 020h, 082h, 020h, 085h, 00ah, 0afh, 020h, 01bh, 0f4h, 020h, 081h, 020h, 0aah
        db      020h, 0f9h
        endif
        db      ". Entering"
        db      00ah, 022h, 030h, 022h
        db      " makes "
        if      FW_VERSION >= 312
        db      087h, 020h, 0f3h, 020h, 081h, 020h, 01bh, 086h, 020h, 09eh, 020h, 081h, 00ah, 0bch, 02eh, 00ah
        db      000h, 089h, 020h, 0c5h, 020h, 0f3h, 020h, 085h, 020h, 096h, 020h, 0fdh, 020h, 01bh, 056h, 020h
        db      087h, 00ah, 093h, 020h, 0b6h, 020h, 03ch, 01bh, 0ffh, 03eh, 020h, 099h, 020h, 0b7h, 02eh, 00ah
        db      000h, 08ch, 020h, 0f3h, 020h, 083h, 020h, 085h, 020h, 096h, 020h, 01bh, 037h, 020h, 0b6h, 00ah
        db      03ch
        phase   21f0h
        db      "Delete> "
        db      099h, 020h, 0b7h, 02eh, 00ah, 000h, 08eh, 020h, 0bch, 020h, 084h, 020h, 0dah, 02eh, 00ah, 000h
        db      09fh, 020h, 03ch, 01bh, 084h, 020h, 0f1h, 03eh, 020h, 084h, 020h, 0dah, 020h, 0bah, 020h, 01bh
        db      0e1h, 02eh, 00ah, 000h, 08ch
        elseif  FW_VERSION = 311
        db      088h, 020h, 01bh, 006h, 020h, 081h, 020h, 01bh, 09bh, 020h, 09eh, 020h, 081h, 00ah, 0bbh
        db      ": higher-numbered "
        db      01bh, 0f8h, 020h, 085h, 020h, 097h, 00ah
        db      "locked "
        db      01bh, 0fdh, 02eh, 00ah, 000h, 08bh, 020h, 0d0h, 020h, 01bh, 006h, 020h, 085h, 020h, 097h, 020h
        db      01bh, 010h, 020h, 01bh, 04ch, 020h, 088h, 00ah, 099h, 020h, 0c1h
        db      " <Insert> "
        db      096h, 020h, 0bch, 02eh, 00ah, 000h, 08dh, 020h, 01bh, 006h, 020h, 083h, 020h, 085h, 020h, 097h
        db      020h, 01bh, 013h, 020h, 0c1h, 00ah
        db      "<Delete> "
        db      096h, 020h, 0bch, 02eh, 00ah, 000h, 01bh, 08fh, 020h, 081h, 020h, 01bh, 059h, 020h, 01bh, 028h
        db      020h, 084h, 020h, 093h, 020h, 01bh, 0ach, 00ah
        db      "unwanted "
        db      0bbh, 02eh, 020h, 092h, 020h, 01bh, 007h, 020h, 0c2h, 020h, 084h, 00ah, 0e8h, 02eh, 00ah, 000h
        db      092h, 020h, 03ch, 01bh, 061h, 020h, 0f5h, 03eh, 020h, 084h, 020h, 0e5h, 020h, 0b9h, 020h, 01bh
        db      0f6h, 02ch, 020h, 0aah, 00ah, 089h, 020h, 01bh, 007h, 020h, 0c2h, 020h, 084h, 020h, 0e8h, 02eh
        db      00ah, 000h, 08dh
        else
        db      086h, 020h, 0f9h, 020h, 081h, 020h, 01bh, 064h, 020h, 09dh, 020h, 081h, 00ah, 0b5h, 03ah, 020h
        db      01bh, 0e6h
        db      "-numbered "
        db      01bh, 0d1h, 020h, 085h, 020h, 098h, 00ah
        db      "locked "
        db      01bh, 0d6h, 02eh, 00ah, 000h, 089h, 020h, 0c4h, 020h, 0f9h, 020h, 085h, 020h, 098h, 020h, 01bh
        db      006h, 020h, 01bh, 034h, 020h, 086h, 00ah, 099h, 020h, 0bah, 020h, 03ch, 01bh, 0f9h, 03eh, 020h
        db      0a6h, 020h, 0bdh, 02eh, 00ah, 000h, 08dh, 020h, 0f9h, 020h, 083h, 020h, 085h, 020h, 098h, 020h
        db      01bh, 008h, 020h, 0bah, 00ah
        db      "<Delete> "
        db      0a6h, 020h, 0bdh, 02eh, 00ah, 000h, 01bh, 072h, 020h, 081h, 020h, 01bh, 042h, 020h, 01bh, 01ch
        db      020h, 084h, 020h, 092h, 020h, 01bh, 0c5h, 00ah
        db      "unwanted "
        db      0b5h, 02eh, 020h, 090h, 020h, 0feh, 020h, 0b8h, 020h, 084h, 00ah, 0dbh, 02eh, 00ah, 000h, 090h
        db      020h, 03ch, 01bh, 085h, 020h, 0dch, 03eh, 020h, 084h, 020h, 0deh, 020h, 0b9h, 020h, 01bh, 0cfh
        db      02ch, 020h, 0abh, 00ah, 088h, 020h, 0feh, 020h, 0b8h, 020h, 084h, 020h, 0dbh, 02eh, 00ah, 000h
        db      08dh
        endif
