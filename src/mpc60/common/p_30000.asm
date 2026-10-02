; one source v1.12/v2.12/v2.14; v2.14 page 30000h.
; FW_VERSION: conditional. RUN_ macro: per-version multi-page code.

        pop     di
        pop     si
        pop     bp
        retf
        if      FW_VERSION < 212
        phase   0ch
        elseif  FW_VERSION = 212
        phase   0dh
        else
        phase   0eh
        endif
far_f002e:
        push    bp
        mov     bp, sp
        push    si
        push    di
        if      FW_VERSION >= 212
        mov     si, word ptr [W_8D7C]
        mov     di, word ptr [W_8D7E]
        else
        mov     si, word ptr [W_900A_V112]
        mov     di, word ptr [W_900C_V112]
        endif
        push    bp
        mov     bx, si
        mov     ax, di
        cwd
        mov     bp, dx
        mov     cx, 2
loop_f0046:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_f0046
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 4
loop_f0057:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_f0057
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 4
loop_f0068:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_f0068
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 4
loop_f0079:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_f0079
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 2
loop_f008a:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_f008a
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 3
loop_f009b:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_f009b
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        pop     bp
        mov     cx, 4
loop_f00ad:
        sar     dx, 1
        rcr     ax, 1
        loop    loop_f00ad
        mov     di, word ptr [bp + 6]
        if      FW_VERSION >= 212
        mov     cx, 8
        else
        mov     cx, word ptr [W_900E_V112]
        endif
loop_f00b9:
        sar     di, 1
        rcr     si, 1
        loop    loop_f00b9
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
loop_f00dc:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_f00dc
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 3
loop_f00ed:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_f00ed
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 3
loop_f00fe:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_f00fe
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 5
loop_f010f:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_f010f
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 3
loop_f0120:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_f0120
        pop     bp
        mov     cx, 4
loop_f012c:
        sar     dx, 1
        rcr     ax, 1
        loop    loop_f012c
        push    ax
        push    dx
        if      FW_VERSION >= 212
        mov     si, word ptr [W_8D7C]
        mov     di, word ptr [W_8D7E]
        else
        mov     si, word ptr [W_900A_V112]
        mov     di, word ptr [W_900C_V112]
        endif
        push    bp
        mov     bx, si
        mov     ax, di
        cwd
        mov     bp, dx
        mov     cx, 2
loop_f0147:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_f0147
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 3
loop_f0158:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_f0158
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 4
loop_f0169:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_f0169
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
loop_f0186:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_f0186
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 2
loop_f0197:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    loop_f0197
        add     bx, si
        adc     ax, di
        adc     dx, bp
        pop     bp
        mov     cx, 4
loop_f01a9:
        sar     dx, 1
        rcr     ax, 1
        loop    loop_f01a9
        pop     di
        pop     si
        add     ax, si
        adc     dx, di
        pop     di
        pop     si
        if      FW_VERSION < 212
        mov     word ptr [W_900A_V112], si
        mov     word ptr [W_900C_V112], di
        mov     cx, word ptr [W_9010_V112]
        else
        mov     word ptr [W_8D7C], si
        mov     word ptr [W_8D7E], di
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
        js      br_f01eb
        mov     cx, dx
        and     cx, 0ff00h
        jz      br_f01fd
        mov     ax, 7fffh
        jmp     br_f0221
        db      090h
br_f01eb:
        mov     cx, dx
        and     cx, 0ff00h
        cmp     cx, 0ff00h
        jz      br_f01fd
        mov     ax, 0ffffh
        jmp     br_f0221
        db      090h
br_f01fd:
        mov     cx, 7
        endif
loop_f0200:
        shl     ax, 1
        rcl     dx, 1
        loop    loop_f0200
        if      FW_VERSION >= 212
        mov     cx, word ptr [W_8D82]
        idiv    cx
        cmp     ax, word ptr [W_8D84]
        jle     br_f0218
        mov     word ptr [W_8D84], ax
        else
        mov     ax, dx
        cmp     ax, word ptr [W_982E]
        jle     br_f0218
        mov     word ptr [W_982E], ax
        endif
        jmp     br_f0221
        db      090h
br_f0218:
        if      FW_VERSION >= 212
        cmp     ax, word ptr [W_8D86]
        jge     br_f0221
        mov     word ptr [W_8D86], ax
        else
        cmp     ax, word ptr [W_9014_V112]
        jge     br_f0221
        mov     word ptr [W_9014_V112], ax
        endif
br_f0221:
        pop     di
        pop     si
        pop     bp
        retf
        if      FW_VERSION < 212
        phase   3
        elseif  FW_VERSION = 212
        phase   4
        else
        phase   5
        endif
        if      FW_VERSION >= 212
far_f0225:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp + 8]
        cbw
        jmp     br_f030d
br_f022f:
        mov     al, byte ptr [bp + 0ah]
        cbw
        push    ax
        mov     al, byte ptr [bp + 6]
        cbw
        push    ax
        callf   SEG_DDEF:far_ddef2
        add     sp, 4
        cmp     byte ptr [B_53DB], 4ah
        jnz     br_f0260
        mov     al, byte ptr [bp + 6]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bp + 0ah]
        mov     byte ptr [bx + TBL_8CEC], al
        mov     al, byte ptr [bp + 8]
        mov     byte ptr [B_8D4C], al
        mov     byte ptr [B_54FA], 50h
br_f0260:
        jmp     near br_f032a
br_f0263:
        mov     al, byte ptr [bp + 0ah]
        cbw
        push    ax
        mov     al, byte ptr [bp + 6]
        cbw
        push    ax
        callf   SEG_DDEF:far_ddf1b
        add     sp, 4
        cmp     byte ptr [B_53DB], 4ah
        jnz     br_f0294
        mov     al, byte ptr [bp + 6]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bp + 0ah]
        mov     byte ptr [bx + TBL_8D0C], al
        mov     al, byte ptr [bp + 8]
        mov     byte ptr [B_8D4C], al
        mov     byte ptr [B_54FA], 50h
br_f0294:
        jmp     near br_f032a
br_f0297:
        mov     al, byte ptr [bp + 0ah]
        cbw
        push    ax
        mov     al, byte ptr [bp + 6]
        cbw
        push    ax
        callf   SEG_DDEF:far_ddf44
        add     sp, 4
        cmp     byte ptr [B_53DB], 4ch
        jnz     br_f02cf
        cmp     byte ptr [B_53DC], 4
        jnz     br_f02cf
        mov     al, byte ptr [bp + 6]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bp + 0ah]
        mov     byte ptr [bx + TBL_8D2C], al
        mov     al, byte ptr [bp + 8]
        mov     byte ptr [B_8D4C], al
        mov     byte ptr [B_54FA], 50h
br_f02cf:
        jmp     br_f032a
loop_f02d1:
        mov     al, byte ptr [bp + 0ah]
        cbw
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        shl     ax, 1
        add     ax, 2000h
        push    ax
        mov     al, byte ptr [bp + 6]
        cbw
        push    ax
        callf   SEG_DDEF:far_ddf6d
        add     sp, 4
        cmp     byte ptr [B_53DB], 4ch
        jnz     br_f030b
        cmp     byte ptr [B_53DC], 3
        jnz     br_f030b
        mov     al, byte ptr [bp + 8]
        mov     byte ptr [B_8D4C], al
        mov     byte ptr [B_54FA], 50h
br_f030b:
        jmp     br_f032a
br_f030d:
        cmp     ax, 1
        jnz     br_f0315
        jmp     br_f022f
br_f0315:
        cmp     ax, 2
        jnz     br_f031d
        jmp     near br_f0263
br_f031d:
        cmp     ax, 3
        jnz     br_f0325
        jmp     near br_f0297
br_f0325:
        cmp     ax, 4
        jz      loop_f02d1
br_f032a:
        mov     sp, bp
        pop     bp
        retf
        endif
        if      FW_VERSION = 212
        phase   0dh
        endif
        if      FW_VERSION >= 214
        phase   0eh
        endif
        if      FW_VERSION >= 212
        RUN_FAR_F032E
        mov     byte ptr [B_A067], al
        retf
        endif
        if      FW_VERSION = 212
        phase   5
        endif
        if      FW_VERSION >= 214
        phase   6
        endif
        if      FW_VERSION >= 212
        RUN_FAR_F0376
        endif
        if      FW_VERSION = 212
        phase   5
        endif
        if      FW_VERSION >= 214
        phase   6
        endif
        if      FW_VERSION >= 212
far_f0496:
        RUN_FAR_F04CE
        jmp     br_f04ef
        endif
        if      FW_VERSION = 212
        phase   2
        endif
        if      FW_VERSION >= 214
        phase   3
        endif
        if      FW_VERSION >= 212
        RUN_FAR_F0553
        callf   SEG_F069:far_f0694
        add     sp, 4
        mov     al, byte ptr [bp - 4]
        mov     byte ptr [B_8B4F], al
br_f0691:
        jmp     br_f05b6
        endif
        if      FW_VERSION = 212
        phase   3
        endif
        if      FW_VERSION >= 214
        phase   4
        endif
        if      FW_VERSION >= 212
        RUN_FAR_F0694
        endif
        if      FW_VERSION = 212
        phase   3
        endif
        if      FW_VERSION >= 214
        phase   4
        endif
        if      FW_VERSION >= 212
        RUN_FAR_F07D4
        mov     ax, B_94A6
        push    ax
        callf   SEG_D6A8:far_d6a82
        add     sp, 6
br_f08e3:
        mov     ax, B_981C
        push    ax
        callf   SEG_D55E:far_d55e8
        add     sp, 2
        mov     dx, word ptr [bp - 0ah]
        mov     ax, word ptr [bp - 0ch]
        jmp     br_f081f
far_f08f8:
        push    bp
        mov     bp, sp
        add     sp, 0fff6h
        mov     ax, B_981C
        push    ax
        callf   SEG_D55E:far_d55e8
        add     sp, 2
        callf   SEG_ED36:far_ed6eb
        mov     word ptr [bp - 4], dx
        mov     word ptr [bp - 6], ax
        mov     ax, 1
        push    ax
        push    word ptr [bp + 6]
        mov     ax, B_94A6
        push    ax
        callf   SEG_D6A8:far_d6a82
        add     sp, 6
        test    ax, ax
        jz      br_f0936
        mov     dx, 0
        mov     ax, 0
br_f0932:
        mov     sp, bp
        pop     bp
        retf
br_f0936:
        push    word ptr [W_8D50]
        push    word ptr [W_8D4E]
        mov     ax, B_94A6
        push    ax
        callf   SEG_EAF3:far_eaf33
        add     sp, 6
        inc     byte ptr [B_8CCB]
        mov     word ptr [bp - 8], 0
        mov     word ptr [bp - 0ah], 0
loop_f0958:
        cmp     word ptr [bp - 4], 0
        jl      br_f0966
        jnz     br_f0968
        cmp     word ptr [bp - 6], 0
        ja      br_f0968
br_f0966:
        jmp     br_f09d5
br_f0968:
        mov     ax, 640h
        push    ax
        mov     ax, TBL_8E65
        push    ax
        mov     ax, 1
        push    ax
        callf SEG_0300:far_03012
        add     sp, 6
        mov     word ptr [bp - 2], ax
        mov     al, byte ptr [TBL_8E65]
        sub     ah, ah
        and     ax, 0f8h
        jmp     br_f09b8
loop_f0989:
        push    word ptr [TBL_8E66]
        callf   SEG_DA91:far_da912
        add     sp, 2
        cwd
        sub     word ptr [bp - 6], ax
        sbb     word ptr [bp - 4], dx
        jmp     br_f09c9
loop_f099e:
        jmp     br_f09c9
loop_f09a0:
        mov     word ptr [bp - 4], 0
        mov     word ptr [bp - 6], 0
        jmp     br_f09c9
br_f09ac:
        mov     al, byte ptr [TBL_8E66]
        sub     ah, ah
        cmp     ax, word ptr [bp + 10h]
        jnz     loop_f0958
        jmp     br_f09c9
br_f09b8:
        cmp     ax, 88h
        jz      loop_f0989
        cmp     ax, 0a8h
        jz      loop_f099e
        cmp     ax, 0f8h
        jz      loop_f09a0
        jmp     br_f09ac
br_f09c9:
        mov     ax, word ptr [bp - 2]
        cwd
        add     word ptr [bp - 0ah], ax
        adc     word ptr [bp - 8], dx
        jmp     short loop_f0958
br_f09d5:
        dec     byte ptr [B_8CCB]
        mov     dx, word ptr [bp - 8]
        mov     ax, word ptr [bp - 0ah]
        jmp     near br_f0932
        endif
        if      FW_VERSION = 212
        phase   1
        endif
        if      FW_VERSION >= 214
        phase   2
        endif
        if      FW_VERSION >= 212
far_f09e2:
        push    bp
        mov     bp, sp
        add     sp, 0fff2h
        mov     dx, word ptr [bp + 0ah]
        mov     ax, word ptr [bp + 8]
        mov     word ptr [bp - 0ch], dx
        mov     word ptr [bp - 0eh], ax
        mov     bx, word ptr [bp + 6]
        cmp     byte ptr [bx], 0
        jge     br_f0a10
        mov     ax, word ptr [W_8CD1]
        inc     ax
        cmp     ax, word ptr [bp - 0ch]
        jnz     br_f0a09
        xor     ax, ax
        jmp     br_f0a0c
br_f0a09:
        mov     ax, 1
br_f0a0c:
        mov     sp, bp
        pop     bp
        retf
br_f0a10:
        mov     ax, word ptr [bx + 30h]
        add     ax, word ptr [W_8CD1]
        inc     ax
        cwd
        xchg    dx, ax
        sub     ax, ax
        add     ax, 100h
        adc     dx, 0
        mov     word ptr [bp - 8], dx
        mov     word ptr [bp - 0ah], ax
        mov     bx, word ptr [bp + 0ah]
        mov     cx, word ptr [bp + 8]
        cmp     bx, dx
        jl      br_f0a38
        jnz     br_f0a3a
        cmp     cx, ax
        ja      br_f0a3a
br_f0a38:
        jmp     br_f0a3f
br_f0a3a:
        mov     ax, 1
        jmp     br_f0a0c
br_f0a3f:
        push    word ptr [bp + 6]
        callf   SEG_D724:far_d7241
        add     sp, 2
        mov     word ptr [bp - 2], 1
        mov     word ptr [bp - 4], 0
        cmp     word ptr [bp + 6], B_94A6
        jnz     br_f0a69
        cmp     byte ptr [B_A06E], 0
        jz      br_f0a69
        endif
        if      FW_VERSION = 212
        mov     word ptr [bp - 6], 9c79h
        endif
        if      FW_VERSION >= 214
        mov     word ptr [bp - 6], 0a085h
        endif
        if      FW_VERSION >= 212
        jmp     br_f0a72
br_f0a69:
        mov     ax, word ptr [bp + 6]
        add     ax, 23ah
        mov     word ptr [bp - 6], ax
br_f0a72:
        mov     ax, word ptr [bp - 0ch]
        mov     bx, word ptr [bp - 6]
        cmp     ax, word ptr [bx]
        jc      br_f0a82
        add     word ptr [bp - 6], 4
        jmp     br_f0a72
br_f0a82:
        add     word ptr [bp - 6], 0fffch
        mov     bx, word ptr [bp - 6]
        mov     al, byte ptr [bx + 2]
        cbw
        mov     word ptr [bp - 2], ax
        mov     al, byte ptr [bx + 3]
        cbw
        mov     cx, ax
        mov     ax, 180h
        cwd
        idiv    cx
        mov     word ptr [bp - 4], ax
        cmp     byte ptr [bp - 0dh], 1
        jge     br_f0aab
        mov     ax, 1
        jmp     near br_f0a0c
br_f0aab:
        mov     al, byte ptr [bp - 0dh]
        cbw
        cmp     ax, word ptr [bp - 2]
        jle     br_f0aba
        mov     ax, 1
        jmp     near br_f0a0c
br_f0aba:
        mov     al, byte ptr [bp - 0eh]
        cbw
        cmp     ax, word ptr [bp - 4]
        jl      br_f0ac9
        mov     ax, 1
        jmp     near br_f0a0c
br_f0ac9:
        xor     ax, ax
        jmp     near br_f0a0c
        endif
        if      FW_VERSION = 212
        phase   0dh
        endif
        if      FW_VERSION >= 214
        phase   0eh
        endif
        if      FW_VERSION >= 212
        RUN_FAR_F0ACE
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 10h]
        push    word ptr [bp - 0ah]
        push    word ptr [bp - 0ch]
        callf   SEG_DA99:far_da993
        add     sp, 0ah
        mov     ax, B_94A6
        push    ax
        callf   SEG_D62E:far_d6444
        add     sp, 2
        RUN_AFTER_LOOP_F0B7F
        endif
        if      FW_VERSION = 212
        phase   3
        endif
        if      FW_VERSION >= 214
        phase   4
        endif
        if      FW_VERSION >= 212
        RUN_FAR_F0C14
        endif
        if      FW_VERSION = 212
        phase   3
        endif
        if      FW_VERSION >= 214
        phase   4
        endif
        if      FW_VERSION >= 212
        RUN_FAR_F0EE4
        endif
        if      FW_VERSION = 212
        phase   0ch
        endif
        if      FW_VERSION >= 214
        phase   0dh
        endif
        if      FW_VERSION >= 212
far_f0fcd:
        push    bp
        mov     bp, sp
        add     sp, 0fffch
        cmp     word ptr [bp + 8], 1
        jge     br_f0fde
        mov     word ptr [bp + 8], 1
br_f0fde:
        mov     ax, word ptr [bp + 8]
        mov     word ptr [bp - 2], ax
        cmp     byte ptr [B_A06E], 0
        jnz     br_f0fee
        jmp     near br_f109e
br_f0fee:
        cmp     word ptr [bp + 6], B_94A6
        jz      br_f0ff8
        jmp     near br_f109e
br_f0ff8:
        callf   SEG_D724:far_d751b
        mov     ax, word ptr [bp + 8]
        cmp     ax, word ptr [W_A06F]
        jle     br_f1012
        mov     ax, word ptr [W_A06F]
        inc     ax
        mov     word ptr [bp + 8], ax
        mov     word ptr [bp - 2], 0
br_f1012:
        push    word ptr [bp - 2]
        callf   SEG_D6EE:far_d6fbc
        add     sp, 2
        mov     byte ptr [B_A06D], al
        push    word ptr [bp - 2]
        callf   SEG_D6EE:far_d6f9e
        add     sp, 2
        mov     byte ptr [B_A06B], al
        RUN_AFTER_L_E5397
        mov     al, byte ptr [B_A06B]
        sub     ah, ah
        shl     ax, 1
        add     bx, ax
        mov     al, byte ptr [bx + TBL_5516]
        sub     ah, ah
        mov     word ptr [bp - 4], ax
        push    ax
        mov     al, byte ptr [B_9D34]
        cbw
        mov     cx, ax
        pop     ax
        cmp     cx, ax
        jnz     br_f1071
        push    ax
        callf   SEG_E82A:far_e82a4
        add     sp, 2
        jmp     br_f1086
br_f1071:
        push    word ptr [bp - 4]
        callf   SEG_E82A:far_e82a4
        add     sp, 2
        or      byte ptr [B_8CDB], 40h
        or      byte ptr [B_8CDA], 80h
br_f1086:
        push    word ptr [bp - 2]
        xor     ax, ax
        push    ax
        callf   SEG_D6EE:far_d6f51
        add     sp, 4
        mov     word ptr [W_94BA], dx
        mov     word ptr [W_94B8], ax
        jmp     near br_f1138
br_f109e:
        mov     bx, word ptr [bp + 6]
        cmp     byte ptr [bx], 0
        jge     br_f10ad
        mov     ax, 1
br_f10a9:
        mov     sp, bp
        pop     bp
        retf
br_f10ad:
        cmp     word ptr [bx + 30h], 0
        jnz     br_f10b8
        mov     ax, 1
        jmp     br_f10a9
br_f10b8:
        cmp     word ptr [bp + 8], 1
        jnz     br_f110a
        cmp     byte ptr [bx], 0
        jz      br_f10d1
        mov     ax, word ptr [bx + 0eh]
        mov     dx, word ptr [bx + 10h]
        mov     word ptr [bx + 14h], dx
        mov     word ptr [bx + 12h], ax
        jmp     br_f1108
br_f10d1:
        push    word ptr [bp + 6]
        callf   SEG_E78D:far_e78de
        add     sp, 2
        test    ax, ax
        jnz     br_f1108
        mov     bx, word ptr [bp + 6]
        push    word ptr [bx + 10h]
        push    word ptr [bx + 0eh]
        mov     ax, 1
        push    ax
        mov     al, byte ptr [bx + 1]
        cbw
        push    ax
        callf   SEG_D6EE:far_d6ee4
        add     sp, 8
        push    word ptr [bp - 2]
        push    word ptr [bp + 6]
        callf   SEG_EA6F:far_ea6fb
        add     sp, 4
br_f1108:
        jmp     br_f1138
br_f110a:
        push    word ptr [bp + 6]
        callf   SEG_D724:far_d7241
        add     sp, 2
        mov     bx, word ptr [bp + 6]
        mov     ax, word ptr [bp + 8]
        cmp     ax, word ptr [bx + 30h]
        jle     br_f112c
        mov     ax, word ptr [bx + 30h]
        inc     ax
        mov     word ptr [bp + 8], ax
        mov     word ptr [bp - 2], 0
br_f112c:
        push    word ptr [bp - 2]
        push    bx
        callf   SEG_EA6F:far_ea6fb
        add     sp, 4
br_f1138:
        mov     ax, word ptr [bp + 8]
        jmp     near br_f10a9
        endif
        if      FW_VERSION = 212
        phase   0dh
        endif
        if      FW_VERSION >= 214
        phase   0eh
        endif
        if      FW_VERSION >= 212
        RUN_FAR_F113E
        endif
        if      FW_VERSION = 212
        phase   0bh
        endif
        if      FW_VERSION >= 214
        phase   0ch
        endif
        if      FW_VERSION >= 212
        RUN_FAR_F11DC
        endif
        if      FW_VERSION = 212
        phase   1
        endif
        if      FW_VERSION >= 214
        phase   2
        endif
        if      FW_VERSION >= 212
        RUN_FAR_F12E2
        endif
        if      FW_VERSION = 212
        phase   0ah
        endif
        if      FW_VERSION >= 214
        phase   0bh
        endif
        if      FW_VERSION >= 212
        RUN_FAR_F140B
        mov     ax, word ptr [bp - 4]
        RUN_BR_F143F
        mov     word ptr [bp - 0eh], ax
        mov     bx, word ptr [bp - 0ah]
        mov     al, byte ptr [bx + TBL_98C2]
        cbw
        and     ax, 4
        mov     word ptr [bp - 10h], ax
        cmp     ax, word ptr [bp - 0eh]
        jz      br_f163f
        mov     si, word ptr [bp - 0ch]
        mov     al, byte ptr [bp+si - 76h]
        mov     byte ptr [B_54FE], al
        mov     ax, word ptr [bp - 2]
        mov     byte ptr [B_54FF], al
        mov     ax, si
        mov     byte ptr [B_5500], al
        mov     ax, B_981C
        push    ax
        callf   SEG_D55E:far_d55e8
        add     sp, 2
        mov     ax, B_94A6
        push    ax
        callf   SEG_D55E:far_d55e8
        add     sp, 2
        RUN_BR_F163F
        endif
        if      FW_VERSION = 212
        phase   0ah
        endif
        if      FW_VERSION >= 214
        phase   0bh
        endif
        if      FW_VERSION >= 212
far_f166b:
        push    bp
        mov     bp, sp
        add     sp, 0fff3h
        mov     al, byte ptr [B_9D34]
        cbw
        cmp     ax, word ptr [bp + 6]
        RUN_BR_F1689
        jz      br_f16a1
        jmp     br_f1689
br_f16a1:
        mov     dx, word ptr [W_9B9C]
        mov     ax, word ptr [W_9B9A]
        RUN_BR_F16C7
        endif
        if      FW_VERSION = 212
        phase   0dh
        endif
        if      FW_VERSION >= 214
        phase   0eh
        endif
        if      FW_VERSION >= 212
        RUN_FAR_F170E
        endif
        if      FW_VERSION = 212
        phase   9
        endif
        if      FW_VERSION >= 214
        phase   0ah
        endif
        if      FW_VERSION >= 212
        RUN_FAR_F173A
        endif
        if      FW_VERSION = 212
        phase   0ah
        endif
        if      FW_VERSION >= 214
        phase   0bh
        endif
        if      FW_VERSION >= 212
        RUN_FAR_F175B
        mov     ax, word ptr [bx + TBL_AE91]
        mov     dx, word ptr [bx + TBL_AE93]
        mov     word ptr [W_AE6A], dx
        mov     word ptr [W_AE68], ax
        push    word ptr [bp - 2]
        callf   SEG_F175:far_f18e1
        add     sp, 2
        cmp     word ptr [bp + 0ah], 0
        jg      br_f18c0
        jnz     br_f18c2
        cmp     word ptr [bp + 8], 4b0h
        jbe     br_f18c2
br_f18c0:
        jmp     br_f18db
br_f18c2:
        RUN_BR_F18DB
        RUN_L_E378A
        mov     word ptr [bx + TBL_A686], 0
        RUN_AFTER_L_E3824
        mov     word ptr [bx + TBL_A688], 0
        RUN_AFTER_BR_EDC91
        mov     byte ptr [bx + TBL_A682], 64h
        RUN_AFTER_L_E3917
        mov     byte ptr [bx + TBL_A683], 64h
        RUN_FAR_F1AC7
        endif
        if      FW_VERSION = 212
        phase   0
        endif
        if      FW_VERSION >= 214
        phase   1
        endif
        if      FW_VERSION >= 212
        RUN_FAR_F1B01
        push    word ptr [bp - 4]
        callf   SEG_F175:far_f18e1
        add     sp, 2
        mov     ax, word ptr [bp - 4]
        jmp     br_f1b1b
        endif
        if      FW_VERSION = 212
        phase   1
        endif
        if      FW_VERSION >= 214
        phase   2
        endif

RUN_FAR_F1C62 macro   {GLOBALSYMBOLS}

far_f1c62:
        push    bp
        mov     bp, sp
        add     sp, 0fffeh
        mov     word ptr [bp - 2], 0
br_f1c6d:
        mov     ax, word ptr [bp - 2]
        cmp     ax, word ptr [bp + 0eh]
        jz      br_f1ce8
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        cmp     byte ptr [bx + TBL_AE8F], 0ffh
        jnz     br_f1ce3
        if      FW_VERSION >= 212
        mov     ax, word ptr [bx + TBL_AE91]
        else
        mov     ax, word ptr [bx +TBL_AEF6_V112]
        endif
        mov     dx, word ptr [bx + TBL_AE93]
        add     ax, word ptr [bx + TBL_AE95]
        adc     dx, word ptr [bx + TBL_AE97]
        cmp     dx, word ptr [bp + 8]
        jnz     br_f1ca0
        cmp     ax, word ptr [bp + 6]
br_f1ca0:
        jnz     br_f1ce3
        mov     ax, word ptr [bp + 0eh]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     ax, word ptr [bx + TBL_AE95]
        mov     dx, word ptr [bx + TBL_AE97]
        push    dx
        push    ax
        mov     ax, word ptr [bp - 2]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        pop     ax
        pop     dx
        add     word ptr [bx + TBL_AE95], ax
        adc     word ptr [bx + TBL_AE97], dx
        push    word ptr [bp + 0eh]
        callf   SEG_F1C6:far_f1d50
        add     sp, 2
br_f1cdf:
        mov     sp, bp
        pop     bp
        retf
br_f1ce3:
        inc     word ptr [bp - 2]
        jmp     short br_f1c6d
br_f1ce8:
        inc     word ptr [bp - 2]
br_f1ceb:
        cmp     word ptr [bp - 2], 50h
        jz      br_f1d4e
        mov     ax, word ptr [bp - 2]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        cmp     byte ptr [bx + TBL_AE8F], 0ffh
        jnz     br_f1d49
        if      FW_VERSION >= 212
        mov     ax, word ptr [bx + TBL_AE91]
        else
        mov     ax, word ptr [bx +TBL_AEF6_V112]
        endif
        mov     dx, word ptr [bx + TBL_AE93]
        cmp     dx, word ptr [bp + 0ch]
        jnz     br_f1d17
        cmp     ax, word ptr [bp + 0ah]
br_f1d17:
        jnz     br_f1d49
        mov     ax, word ptr [bx + TBL_AE95]
        mov     dx, word ptr [bx + TBL_AE97]
        push    dx
        push    ax
        mov     ax, word ptr [bp + 0eh]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        pop     ax
        pop     dx
        add     word ptr [bx + TBL_AE95], ax
        adc     word ptr [bx + TBL_AE97], dx
        push    word ptr [bp - 2]
        callf   SEG_F1C6:far_f1d50
        add     sp, 2
        jmp     br_f1cdf
br_f1d49:
        inc     word ptr [bp - 2]
        jmp     br_f1ceb
br_f1d4e:
        jmp     br_f1cdf
far_f1d50:
        push    bp
        mov     bp, sp
br_f1d53:
        mov     ax, word ptr [bp + 6]
        inc     ax
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        cmp     byte ptr [bx + TBL_AE8F], 0
        jnz     br_f1d6d
        jmp     near br_f1e1b
br_f1d6d:
        mov     al, byte ptr [bx + TBL_AE8F]
        push    ax
        mov     ax, word ptr [bp + 6]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        pop     ax
        mov     byte ptr [bx + TBL_AE8F], al
        mov     ax, word ptr [bp + 6]
        inc     ax
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_AE90]
        push    ax
        mov     ax, word ptr [bp + 6]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        pop     ax
        mov     byte ptr [bx + TBL_AE90], al
        mov     ax, word ptr [bp + 6]
        inc     ax
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        if      FW_VERSION >= 212
        mov     ax, word ptr [bx + TBL_AE91]
        else
        mov     ax, word ptr [bx +TBL_AEF6_V112]
        endif
        mov     dx, word ptr [bx + TBL_AE93]
        push    dx
        push    ax
        mov     ax, word ptr [bp + 6]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        pop     ax
        pop     dx
        mov     word ptr [bx + TBL_AE93], dx
        if      FW_VERSION >= 212
        mov     word ptr [bx + TBL_AE91], ax
        else
        mov     word ptr [bx +TBL_AEF6_V112], ax
        endif
        mov     ax, word ptr [bp + 6]
        inc     ax
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     ax, word ptr [bx + TBL_AE95]
        mov     dx, word ptr [bx + TBL_AE97]
        push    dx
        push    ax
        mov     ax, word ptr [bp + 6]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        pop     ax
        pop     dx
        mov     word ptr [bx + TBL_AE97], dx
        mov     word ptr [bx + TBL_AE95], ax
        inc     word ptr [bp + 6]
        jmp     near br_f1d53
br_f1e1b:
        mov     ax, word ptr [bp + 6]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     byte ptr [bx + TBL_AE8F], 0
        mov     ax, word ptr [bp + 6]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     byte ptr [bx + TBL_AE90], 0ffh
        mov     ax, word ptr [bp + 6]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     word ptr [bx + TBL_AE93], 0ffffh
        if      FW_VERSION >= 212
        mov     word ptr [bx + TBL_AE91], 0ffffh
        else
        mov     word ptr [bx +TBL_AEF6_V112], 0ffffh
        endif
        mov     ax, word ptr [bp + 6]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     word ptr [bx + TBL_AE97], 0
        mov     word ptr [bx + TBL_AE95], 0
        mov     sp, bp
        pop     bp
        retf
        endm
        if      FW_VERSION >= 212
        RUN_FAR_F1C62
        endif
        if      FW_VERSION = 212
        phase   0ch
        endif
        if      FW_VERSION >= 214
        phase   0dh
        endif
        if      FW_VERSION >= 212
far_f1e7d:
        push    bp
        mov     bp, sp
        add     sp, 0fff6h
        push    di
        push    si
        cmp     byte ptr [B_7E12], 0
        jz      br_f1ea7
        cmp     word ptr [W_8E63], 1
        jz      br_f1ea1
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_CB99:far_cbc80
        RUN_BR_F1EA1
        mov     ax, B_94A6
        push    ax
        callf   SEG_05A0:far_05a01
        add     sp, 6
br_f212a:
        jmp     br_f1ea1
        endif
        if      FW_VERSION = 212

        phase   0ch
        endif
        if      FW_VERSION >= 214

        phase   0dh
        endif
far_f212d:
        push    bp
        mov     bp, sp
        add     sp, 0fff3h
        push    word ptr [bp + 6]
        if      FW_VERSION >= 212
        callf   SEG_D602:far_d602b
        else
        callf   0d7c0h:far_d602b
        endif
        add     sp, 2
        mov     word ptr [bp - 7], ax
        test    ax, ax
        jz      br_f2149
br_f2145:
        mov     sp, bp
        pop     bp
        retf
br_f2149:
        mov     dx, word ptr [W_9B9C]
        mov     ax, word ptr [W_9B9A]
        add     ax, 0cah
        adc     dx, 0
        mov     word ptr [bp - 0bh], dx
        mov     word ptr [bp - 0dh], ax
        add     ax, 0ffffh
        adc     dx, 0ffffh
        push    dx
        push    ax
        if      FW_VERSION >= 212
        callf   SEG_F257:far_f2582
        else
        callf   0e960h:far_f2582
        endif
        add     sp, 4
        mov     word ptr [bp - 9], ax
br_f216f:
        mov     ax, word ptr [bp - 9]
        dec     word ptr [bp - 9]
        test    ax, ax
        jz      br_f21b0
        mov     ax, 5
        push    ax
        callf   SEG_DA9B:far_daa7a
        push    ax
        lea     ax, [bp - 5]
        push    ax
        push    word ptr [bp - 0bh]
        push    word ptr [bp - 0dh]
        if      FW_VERSION >= 212
        callf   SEG_DA99:far_da993
        add     sp, 0ah
        add     word ptr [bp - 0dh], 18h
        else
        callf   0de8dh:L_de8d2
        add     sp, 0ah
        add     word ptr [bp - 0dh], 15h
        endif
        adc     word ptr [bp - 0bh], 0
        mov     al, byte ptr [bp - 5]
        sub     ah, ah
        cmp     ax, word ptr [bp + 8]
        jnz     br_f21ae
        mov     al, byte ptr [bp - 4]
        sub     ah, ah
        jmp     br_f2145
br_f21ae:
        jmp     br_f216f
br_f21b0:
        mov     ax, 0fffbh
        jmp     br_f2145
        if      FW_VERSION >= 214
        phase   5
        elseif  FW_VERSION = 212
        phase   4
        else
        phase   0bh
L_e8f7b:
        push    bp
        mov     bp, sp
        mov     bx, word ptr [bp + 8]
        mov     word ptr [bx], 0ffffh
        sub     al, al
        mov     cx, 2
        mov     dx, 1
        jmp     L_e8f96
        db      090h
L_e8f90:
        inc     al
        shl     dx, 1
        jc      L_e8fa0
L_e8f96:
        test    word ptr [bp + 6], dx
        jz      L_e8f90
        mov     byte ptr [bx], al
        inc     bx
        loop    L_e8f90
L_e8fa0:
        pop     bp
        retf
        phase   2
        endif
far_f21b5:
        push    bp
        mov     bp, sp
        mov     bx, word ptr [bp + 6]
        mov     al, byte ptr [bx]
        and     al, 0f8h
        cmp     al, 90h
        jnz     br_f21d7
        mov     cl, byte ptr [bx + 2]
        and     cl, 1fh
        if      FW_VERSION >= 212

        mov     byte ptr [B_54F9], cl
        else
        mov     byte ptr [B_617D_V112], cl
        endif
        mov     bx, A_4BF0
        mov     cl, 44h
        if      FW_VERSION >= 212
        callf   SEG_EF1E:far_ef1e0
        else
        callf   SEG_EF1E:far_ef210
        endif
br_f21d7:
        pop     bp
        retf
        if      FW_VERSION < 212
        phase   6
        RUN_FAR_EF434
        phase   0fh
        endif

RUN_FAR_05E2B macro   {GLOBALSYMBOLS}
far_05e2b:
        push    bp
        mov     bp, sp
        push    word ptr [W_94BC]
        push    word ptr [W_94BE]
        mov     bx, word ptr [bp + 6]
        if      FW_VERSION >= 212
        shl     bx, 2
        else
        shl     bx, 1
        endif
        mov     ax, word ptr [bx + TBL_816C]
        mov     word ptr [W_94BC], ax
        mov     ax, word ptr [bx + TBL_816E]
        mov     word ptr [W_94BE], ax
        mov     al, byte ptr [bp + 8]
        callf   SEG_05C6:far_05c64
        mov     dx, word ptr [bp + 0ah]
        or      dx, dx
        jnz     br_05e5a
        inc     dx
br_05e5a:
        mov     al, dl
        and     al, 7fh
        callf   SEG_05C6:far_05c64
        shl     dx, 1
        mov     al, dh
        and     al, 7fh
        callf   SEG_05C6:far_05c64
        pop     word ptr [W_94BE]
        pop     word ptr [W_94BC]
        pop     bp
        retf
        endm
        if      FW_VERSION < 212
        RUN_FAR_05E2B
        phase   0bh
        elseif  FW_VERSION = 212

        phase   8
        else

        phase   9
        endif
far_f21d9:
        push    bp
        mov     bp, sp
        add     sp, 0fff8h
        mov     word ptr [bp - 8], 0
loop_f21e4:
        mov     ax, word ptr [bp - 8]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        cmp     byte ptr [bx + TBL_AE8F], 0
        jz      br_f2203
        inc     word ptr [bp - 8]
        cmp     word ptr [bp - 8], 50h
        jl      loop_f21e4
br_f2203:
        cmp     word ptr [bp - 8], 50h
        jnz     br_f2210
        mov     ax, 0fffeh
br_f220c:
        mov     sp, bp
        pop     bp
        retf
br_f2210:
        mov     word ptr [bp - 6], 0
br_f2215:
        mov     ax, word ptr [bp - 6]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        cmp     byte ptr [bx + TBL_AE8F], 0ffh
        jz      br_f222e
        jmp     br_f2327
br_f222e:
        mov     dx, word ptr [bp + 8]
        mov     ax, word ptr [bp + 6]
        cmp     dx, word ptr [bx + TBL_AE97]
        ja      br_f2242
        jnz     br_f2245
        cmp     ax, word ptr [bx + TBL_AE95]
        jbe     br_f2245
br_f2242:
        jmp     br_f2327
br_f2245:
        mov     byte ptr [bx + TBL_AE8F], 1
        mov     ax, word ptr [bp + 0ah]
        push    ax
        mov     ax, word ptr [bp - 6]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        pop     ax
        mov     byte ptr [bx + TBL_AE90], al
        mov     ax, word ptr [bp - 6]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     ax, word ptr [bx + TBL_AE95]
        mov     dx, word ptr [bx + TBL_AE97]
        sub     ax, word ptr [bp + 6]
        sbb     dx, word ptr [bp + 8]
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        mov     dx, word ptr [bp + 8]
        mov     ax, word ptr [bp + 6]
        mov     word ptr [bx + TBL_AE97], dx
        mov     word ptr [bx + TBL_AE95], ax
        cmp     word ptr [bp - 2], 0
        jnz     br_f229d
        cmp     word ptr [bp - 4], 0
br_f229d:
        jnz     br_f22a2
        jmp     near br_f2321
br_f22a2:
        mov     ax, word ptr [bp - 8]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     byte ptr [bx + TBL_AE8F], 0ffh
        mov     ax, word ptr [bp - 8]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     byte ptr [bx + TBL_AE90], 0ffh
        mov     ax, word ptr [bp - 6]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        if      FW_VERSION >= 212
        mov     ax, word ptr [bx + TBL_AE91]
        else
        mov     ax, word ptr [bx +TBL_AEF6_V112]
        endif
        mov     dx, word ptr [bx + TBL_AE93]
        add     ax, word ptr [bx + TBL_AE95]
        adc     dx, word ptr [bx + TBL_AE97]
        push    dx
        push    ax
        mov     ax, word ptr [bp - 8]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        pop     ax
        pop     dx
        mov     word ptr [bx + TBL_AE93], dx
        if      FW_VERSION >= 212
        mov     word ptr [bx + TBL_AE91], ax
        else
        mov     word ptr [bx +TBL_AEF6_V112], ax
        endif
        mov     ax, word ptr [bp - 8]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        mov     word ptr [bx + TBL_AE97], dx
        mov     word ptr [bx + TBL_AE95], ax
br_f2321:
        mov     ax, word ptr [bp - 6]
        jmp     br_f220c
br_f2327:
        inc     word ptr [bp - 6]
        cmp     word ptr [bp - 6], 50h
        jge     br_f2333
        jmp     br_f2215
br_f2333:
        mov     ax, 0fffeh
        jmp     br_f220c
        if      FW_VERSION < 212
        phase   0bh
        RUN_FAR_F1C62
        phase   6
        elseif  FW_VERSION = 212
        phase   8
        else
        phase   9
        endif
far_f2339:
        push    bp
        mov     bp, sp
        add     sp, 0fffeh
        push    di
        push    si
        mov     si, word ptr [bp + 6]
br_f2344:
        cmp     byte ptr [si], 20h
        jz      br_f234e
        cmp     byte ptr [si], 9
        jnz     br_f2351
br_f234e:
        inc     si
        jmp     br_f2344
br_f2351:
        mov     word ptr [bp - 2], 0
        cmp     byte ptr [si], 2dh
        jnz     br_f2363
        mov     word ptr [bp - 2], 1
        inc     si
        jmp     br_f2369
br_f2363:
        cmp     byte ptr [si], 2bh
        jnz     br_f2369
        inc     si
br_f2369:
        xor     di, di
br_f236b:
        mov     al, byte ptr [si]
        cbw
        mov     bx, ax
        test    byte ptr [bx + TBL_4B15], 4
        jz      br_f2393
        mov     bx, si
        inc     si
        mov     al, byte ptr [bx]
        cbw
        mov     cx, ax
        mov     ax, di
        push    cx
        mov     cx, 0ah
        mul     cx
        pop     cx
        add     cx, ax
        mov     ax, cx
        add     ax, 0ffd0h
        mov     di, ax
        jmp     br_f236b
br_f2393:
        mov     ax, di
        cmp     word ptr [bp - 2], 0
        jz      br_f239d
        neg     ax
br_f239d:
        pop     si
        pop     di
        mov     sp, bp
        pop     bp
        retf
        if      FW_VERSION < 212
        phase   0
        elseif  FW_VERSION = 212
        phase   2
        else
        phase   3
        endif
far_f23a3:
        push    bp
        mov     bp, sp
        add     sp, 0fffch
        push    di
        push    si
        mov     si, word ptr [bp + 6]
br_f23ae:
        cmp     byte ptr [si], 20h
        jz      br_f23b8
        cmp     byte ptr [si], 9
        jnz     br_f23bb
br_f23b8:
        inc     si
        jmp     br_f23ae
br_f23bb:
        xor     di, di
        cmp     byte ptr [si], 2dh
        jnz     br_f23c8
        mov     di, 1
        inc     si
        jmp     br_f23ce
br_f23c8:
        cmp     byte ptr [si], 2bh
        jnz     br_f23ce
        inc     si
br_f23ce:
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 0
br_f23d8:
        mov     al, byte ptr [si]
        cbw
        mov     bx, ax
        test    byte ptr [bx + TBL_4B15], 4
        jz      br_f241d
        mov     bx, si
        inc     si
        mov     al, byte ptr [bx]
        cbw
        cwd
        mov     bx, dx
        mov     cx, ax
        push    bx
        push    cx
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        push    ax
        xchg    dx, ax
        mov     bx, 0ah
        mul     bx
        mov     cx, ax
        pop     ax
        mul     bx
        add     dx, cx
        pop     cx
        pop     bx
        add     cx, ax
        adc     bx, dx
        mov     dx, bx
        mov     ax, cx
        add     ax, 0ffd0h
        adc     dx, 0ffffh
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        jmp     br_f23d8
br_f241d:
        test    di, di
        jz      br_f2430
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        neg     dx
        neg     ax
        sbb     dx, 0
        jmp     br_f2436
br_f2430:
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
br_f2436:
        pop     si
        pop     di
        mov     sp, bp
        pop     bp
        retf
        if      FW_VERSION < 212
        phase   9
        elseif  FW_VERSION = 212
        phase   0bh
        else
        phase   0ch
        endif
far_f243c:
        push    bp
        mov     bp, sp
        add     sp, 0ffbah
        push    di
        push    si
        lea     ax, [bp - 44h]
        mov     word ptr [bp - 46h], ax
        mov     ax, word ptr [bp + 8]
        dec     ax
        mul     word ptr [bp + 0ah]
        add     ax, word ptr [bp + 6]
        mov     word ptr [bp - 4], ax
br_f2457:
        mov     ax, word ptr [bp - 4]
        sub     ax, word ptr [bp + 6]
        sub     dx, dx
        div     word ptr [bp + 0ah]
        shr     ax, 1
        mul     word ptr [bp + 0ah]
        add     ax, word ptr [bp + 6]
        mov     word ptr [bp - 2], ax
        mov     si, word ptr [bp + 6]
        mov     di, word ptr [bp - 4]
loop_f2473:
        push    word ptr [bp - 2]
        push    si
        callf   dword ptr [bp + 0ch]
        add     sp, 4
        cmp     ax, 0
        jge     br_f2487
        add     si, word ptr [bp + 0ah]
        jmp     loop_f2473
br_f2487:
        push    di
        push    word ptr [bp - 2]
        callf   dword ptr [bp + 0ch]
        add     sp, 4
        cmp     ax, 0
        jge     br_f249b
        sub     di, word ptr [bp + 0ah]
        jmp     br_f2487
br_f249b:
        cmp     si, di
        jnc     br_f24be
        push    word ptr [bp + 0ah]
        push    di
        push    si
        callf   SEG_F2B5:far_f2b56
        add     sp, 6
        cmp     si, word ptr [bp - 2]
        jnz     br_f24b6
        mov     word ptr [bp - 2], di
        jmp     br_f24be
br_f24b6:
        cmp     di, word ptr [bp - 2]
        jnz     br_f24be
        mov     word ptr [bp - 2], si
br_f24be:
        cmp     si, di
        ja      br_f24c8
        add     si, word ptr [bp + 0ah]
        sub     di, word ptr [bp + 0ah]
br_f24c8:
        cmp     si, di
        jbe     loop_f2473
        mov     ax, di
        sub     ax, word ptr [bp + 6]
        mov     cx, word ptr [bp - 4]
        sub     cx, si
        cmp     ax, cx
        jge     br_f24f6
        cmp     si, word ptr [bp - 4]
        jnc     br_f24f1
        mov     bx, word ptr [bp - 46h]
        mov     word ptr [bx], si
        mov     bx, word ptr [bp - 46h]
        mov     ax, word ptr [bp - 4]
        mov     word ptr [bx + 2], ax
        add     word ptr [bp - 46h], 4
br_f24f1:
        mov     word ptr [bp - 4], di
        jmp     br_f250f
br_f24f6:
        mov     ax, word ptr [bp + 6]
        cmp     ax, di
        jnc     br_f250c
        mov     bx, word ptr [bp - 46h]
        mov     word ptr [bx], ax
        mov     bx, word ptr [bp - 46h]
        mov     word ptr [bx + 2], di
        add     word ptr [bp - 46h], 4
br_f250c:
        mov     word ptr [bp + 6], si
br_f250f:
        mov     ax, word ptr [bp + 6]
        cmp     ax, word ptr [bp - 4]
        jnc     br_f251a
        jmp     near br_f2457
br_f251a:
        mov     ax, word ptr [bp - 46h]
        lea     cx, [bp - 44h]
        cmp     ax, cx
        jbe     br_f2539
        add     word ptr [bp - 46h], 0fffch
        mov     bx, word ptr [bp - 46h]
        mov     ax, word ptr [bx]
        mov     word ptr [bp + 6], ax
        mov     ax, word ptr [bx + 2]
        mov     word ptr [bp - 4], ax
        jmp     br_f2457
br_f2539:
        pop     si
        pop     di
        mov     sp, bp
        pop     bp
        retf
fn_f253f:
        pop     bx
        push    di
        push    es
        mov     di, cs
        mov     es, di
        mov     di, bx
        mov     bx, cx
        shl     bx, 1
        cld
        repne scasw
        mov     cx, word ptr es:[bx+di - 4]
        pop     es
        pop     di
        jmp     cx
        if      FW_VERSION < 212
        phase   4
        elseif  FW_VERSION = 212
        phase   6
        else
        phase   7
        endif
far_f2557:
        push    bp
        mov     bp, sp
        cld
        push    si
        mov     si, word ptr [bp + 6]
        mov     bl, byte ptr [bp + 8]
loop_f2562:
        lodsb
        test    al, al
        jz      br_f2571
        cmp     al, bl
        jnz     loop_f2562
        mov     ax, si
        dec     ax
        pop     si
        pop     bp
        retf
br_f2571:
        sub     ax, ax
        pop     si
        pop     bp
        retf
        if      FW_VERSION < 212
        phase   3
        elseif  FW_VERSION = 212
        phase   5
        else
        phase   6
        endif
far_f2576:
        push    bp
        mov     bp, sp
        push    ds
        lds     bx, dword ptr [bp + 6]
        mov     ax, word ptr [bx]
        pop     ds
        pop     bp
        retf
far_f2582:
        push    bp
        mov     bp, sp
        push    ds
        lds     bx, dword ptr [bp + 6]
        mov     al, byte ptr [bx]
        and     ax, 0ffh
        pop     ds
        pop     bp
        retf
far_f2591:
        push    bp
        mov     bp, sp
        push    ds
        mov     ax, word ptr [bp + 0ah]
        lds     bx, dword ptr [bp + 6]
        mov     word ptr [bx], ax
        pop     ds
        pop     bp
        retf
        if      FW_VERSION < 212
L_e962d:
        else
far_f25a0:
        endif
        push    bp
        mov     bp, sp
        push    ds
        mov     al, byte ptr [bp + 0ah]
        lds     bx, dword ptr [bp + 6]
        mov     byte ptr [bx], al
        pop     ds
        pop     bp
        retf
        if      FW_VERSION < 212
        phase   0ch
        elseif  FW_VERSION = 212
        phase   0eh
        else
        phase   0fh
        endif
far_f25af:
        push    bp
        mov     bp, sp
        mov     dx, word ptr [bp + 6]
        in      al, dx
        and     ax, 0ffh
        pop     bp
        retf
far_f25bb:
        push    bp
        mov     bp, sp
        mov     dx, word ptr [bp + 6]
        in      ax, dx
        pop     bp
        retf
far_f25c4:
        push    bp
        mov     bp, sp
        mov     dx, word ptr [bp + 6]
        mov     al, byte ptr [bp + 8]
        out     dx, al
        pop     bp
        retf
far_f25d0:
        push    bp
        mov     bp, sp
        mov     dx, word ptr [bp + 6]
        mov     ax, word ptr [bp + 8]
        out     dx, ax
        pop     bp
        retf
        if      FW_VERSION < 212
        phase   9
        elseif  FW_VERSION = 212
        phase   0bh
        else
        phase   0ch
        endif
far_f25dc:
        push    bp
        mov     bp, sp
        pushf
        cld
        push    di
        mov     di, ds
        mov     es, di
        mov     di, word ptr [bp + 6]
        mov     cx, word ptr [bp + 8]
        mov     al, byte ptr [bp + 0ah]
        mov     ah, al
        mov     dx, cx
        shr     cx, 1
        jz      br_f25f9
        rep stosw
br_f25f9:
        test    dl, 1
        jz      br_f25ff
        stosb
br_f25ff:
        pop     di
        popf
        pop     bp
        retf
        if      FW_VERSION < 212
        phase   0
        elseif  FW_VERSION = 212
        phase   2
        else
        phase   3
        endif
far_f2603:
        push    bp
        mov     bp, sp
        mov     dx, 7fffh
        jmp     br_f2611
        db      055h, 08bh, 0ech, 08bh, 056h, 00ah
br_f2611:
        cld
        push    si
        push    di
        mov     di, ds
        mov     es, di
        mov     di, word ptr [bp + 6]
        sub     ax, ax
        mov     cx, 7fffh
        repne scasb
        dec     di
        mov     si, word ptr [bp + 8]
        mov     cx, dx
loop_f2628:
        lodsb
        stosb
        test    al, al
        loopnz  loop_f2628
        jz      br_f2633
        sub     al, al
        stosb
br_f2633:
        pop     di
        pop     si
        mov     ax, word ptr [bp + 6]
        pop     bp
        retf
        if      FW_VERSION < 212
        phase   7
        elseif  FW_VERSION = 212
        phase   9
        else
        phase   0ah
        endif
far_f263a:
        push    bp
        mov     bp, sp
        cld
        push    si
        push    di
        mov     di, ds
        mov     es, di
        mov     di, word ptr [bp + 6]
        mov     si, word ptr [bp + 8]
loop_f264a:
        lodsb
        stosb
        test    al, al
        jnz     loop_f264a
        pop     di
        pop     si
        mov     ax, word ptr [bp + 6]
        pop     bp
        retf
        if      FW_VERSION < 212
        phase   4
        elseif  FW_VERSION = 212
        phase   6
        else
        phase   7
        endif
far_f2657:
        push    bp
        mov     bp, sp
        cld
        push    si
        push    di
        mov     cx, word ptr [bp + 0ah]
        mov     di, ds
        mov     es, di
        mov     di, word ptr [bp + 6]
        mov     si, word ptr [bp + 8]
        jcxz    br_f2678
loop_f266c:
        lodsb
        test    al, al
        jz      br_f2676
        stosb
        loop    loop_f266c
        jmp     br_f2678
br_f2676:
        rep stosb
br_f2678:
        pop     di
        pop     si
        mov     ax, word ptr [bp + 6]
        pop     bp
        retf
        if      FW_VERSION < 212
        phase   0ch
        elseif  FW_VERSION = 212
        phase   0eh
        else
        phase   0fh
        endif
far_f267f:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp + 6]
        sub     ah, ah
        cmp     al, 61h
        jl      br_f2691
        cmp     al, 7ah
        jg      br_f2691
        sub     al, 20h
br_f2691:
        pop     bp
        retf
far_f2693:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp + 6]
        sub     ah, ah
        cmp     al, 41h
        jl      br_f26a5
        cmp     al, 5ah
        jg      br_f26a5
        add     al, 20h
br_f26a5:
        pop     bp
        retf
        if      FW_VERSION < 212
        phase   4
        elseif  FW_VERSION = 212
        phase   6
        else
        phase   7
        endif
far_f26a7:
        push    di
        sub     di, di
        test    dx, dx
        jns     br_f26b6
        neg     dx
        neg     ax
        sbb     dx, 0
        inc     di
br_f26b6:
        test    bx, bx
        jns     br_f26c5
        neg     bx
        neg     cx
        sbb     bx, 0
        xor.w   di, 1
br_f26c5:
        call    fn_f2705
br_f26c8:
        test    di, di
        jz      br_f26d3
        neg     dx
        neg     ax
        sbb     dx, 0
br_f26d3:
        pop     di
        retf
far_f26d5:
        push    di
        mov     di, 0
        test    dx, dx
        jns     br_f26e5
        neg     dx
        neg     ax
        sbb     dx, 0
        inc     di
br_f26e5:
        test    bx, bx
        jns     br_f26f0
        neg     bx
        neg     cx
        sbb     bx, 0
br_f26f0:
        call    fn_f2705
        mov     ax, cx
        mov     dx, bx
        jmp     br_f26c8
far_f26f9:
        call    fn_f2705
        mov     ax, cx
        mov     dx, bx
        retf
far_f2701:
        call    fn_f2705
        retf
fn_f2705:
        test    bx, bx
        jnz     br_f2727
        cmp     cx, dx
        ja      br_f2720
        push    ax
        mov     ax, dx
        sub     dx, dx
        div     cx
        mov     bx, ax
        pop     ax
        div     cx
        mov     cx, dx
        mov     dx, bx
        sub     bx, bx
        ret
br_f2720:
        div     cx
        mov     cx, dx
        mov     dx, bx
        ret
br_f2727:
        push    bp
        push    di
        push    si
        mov     si, cx
        mov     di, bx
        sub     bx, bx
        sub     bp, bp
        mov     cx, 20h
loop_f2735:
        shl     ax, 1
        rcl     dx, 1
        rcl     bp, 1
        rcl     bx, 1
        sub     bp, si
        sbb     bx, di
        js      br_f2757
loop_f2743:
        inc     ax
        loop    loop_f2735
        jmp     near br_f275d
loop_f2749:
        shl     ax, 1
        rcl     dx, 1
        rcl     bp, 1
        rcl     bx, 1
        add     bp, si
        adc     bx, di
        jns     loop_f2743
br_f2757:
        loop    loop_f2749
        add     bp, si
        adc     bx, di
br_f275d:
        mov     cx, bp
        pop     si
        pop     di
        pop     bp
        ret
        if      FW_VERSION < 212
        phase   0
        elseif  FW_VERSION = 212
        phase   2
        else
        phase   3
        endif
far_f2763:
        push    bp
        mov     bp, sp
        mov     cx, 7fffh
        jmp     br_f2771
far_f276b:
        push    bp
        mov     bp, sp
        mov     cx, word ptr [bp + 0ah]
br_f2771:
        cld
        push    si
        push    di
        mov     si, word ptr [bp + 6]
        mov     di, ds
        mov     es, di
        mov     di, word ptr [bp + 8]
loop_f277e:
        lodsb
        scasb
        jnz     br_f278c
        test    al, al
        loopnz  loop_f277e
        sub     ax, ax
br_f2788:
        pop     di
        pop     si
        pop     bp
        retf
br_f278c:
        mov     ax, 0
        jc      br_f2794
        inc     ax
        jmp     br_f2788
br_f2794:
        dec     ax
        jmp     br_f2788
        if      FW_VERSION < 212
        phase   4
        elseif  FW_VERSION = 212
        phase   6
        else
        phase   7
        endif
far_f2797:
        push    bp
        mov     bp, sp
        cld
        push    di
        mov     di, ds
        mov     es, di
        mov     di, word ptr [bp + 6]
        mov     bx, di
        sub     ax, ax
        mov     cx, 7fffh
        repne scasb
        mov     ax, di
        sub     ax, bx
        dec     ax
        pop     di
        pop     bp
        retf
        if      FW_VERSION < 212
        phase   1
        elseif  FW_VERSION = 212
        phase   3
        else
        phase   4
        endif
far_f27b4:
        push    bp
        mov     bp, sp
        pushf
        cld
        push    si
        push    di
        mov     di, ds
        mov     es, di
        mov     si, word ptr [bp + 6]
        mov     di, word ptr [bp + 8]
        mov     cx, word ptr [bp + 0ah]
        mov     ax, es
        mov     dx, ds
        cmp     ax, dx
        jnz     br_f27e7
        cmp     di, si
        jz      br_f27f3
        jc      br_f27e7
        std
        add     di, cx
        add     si, cx
        dec     di
        dec     si
        test    cl, 1
        jz      br_f27e3
        movsb
br_f27e3:
        dec     di
        dec     si
        jmp     br_f27ed
br_f27e7:
        test    cl, 1
        jz      br_f27ed
        movsb
br_f27ed:
        shr     cx, 1
        jz      br_f27f3
        rep movsw
br_f27f3:
        cld
        pop     di
        pop     si
        popf
        pop     bp
        retf
        if      FW_VERSION < 212
        phase   6
        elseif  FW_VERSION = 212
        phase   8
        else
        phase   9
        endif
far_f27f9:
        push    bp
        mov     bp, sp
        add     sp, 0fffch
        push    si
        mov     si, word ptr [bp + 0ah]
        mov     ax, word ptr [bp + 0ch]
        cmp     ax, 4
        jnz     br_f281b
        mov     bx, word ptr [bp + 6]
        mov     ax, word ptr [bx]
        mov     dx, word ptr [bx + 2]
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        jmp     br_f283e
br_f281b:
        mov     ax, word ptr [bp + 8]
        cmp     ax, 0
        jle     br_f2832
        mov     bx, word ptr [bp + 6]
        mov     ax, word ptr [bx]
        sub     dx, dx
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        jmp     br_f283e
br_f2832:
        mov     bx, word ptr [bp + 6]
        mov     ax, word ptr [bx]
        cwd
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
br_f283e:
        mov     word ptr [bp + 0ch], 0
        mov     ax, word ptr [bp + 8]
        cmp     ax, 0
        jge     loop_f286d
        neg     word ptr [bp + 8]
        cmp     word ptr [bp - 2], 0
        jg      br_f285c
        jnz     br_f285e
        cmp     word ptr [bp - 4], 0
        jc      br_f285e
br_f285c:
        jmp     loop_f286d
br_f285e:
        neg     word ptr [bp - 2]
        neg     word ptr [bp - 4]
        sbb     word ptr [bp - 2], 0
        mov     word ptr [bp + 0ch], 1
loop_f286d:
        mov     ax, word ptr [bp + 8]
        cwd
        mov     bx, dx
        mov     cx, ax
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        callf   SEG_F26A:far_f26f9
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_4B96]
        dec     si
        mov     byte ptr [si], al
        mov     ax, word ptr [bp + 8]
        cwd
        mov     bx, dx
        mov     cx, ax
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        callf   SEG_F26A:far_f2701
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        or      dx, ax
        jnz     loop_f286d
        cmp     word ptr [bp + 0ch], 0
        jz      br_f28b0
        dec     si
        mov     byte ptr [si], 2dh
br_f28b0:
        mov     ax, si
        pop     si
        mov     sp, bp
        pop     bp
        retf
far_f28b7:
        push    bp
        mov     bp, sp
        add     sp, 0ff26h
        push    di
        push    si
        mov     si, word ptr [bp + 0ah]
        mov     word ptr [bp - 4], 0
        mov     ax, word ptr [bp + 0ch]
        mov     word ptr [bp - 2], ax
br_f28ce:
        mov     bx, si
        inc     si
        mov     al, byte ptr [bx]
        cbw
        mov     di, ax
        test    di, di
        jnz     br_f28dd
        jmp     br_f2b50
br_f28dd:
        cmp     di, 25h
        jz      br_f28e5
        jmp     br_f2b3a
br_f28e5:
        mov     byte ptr [bp - 0cch], 0
        mov     word ptr [bp - 6], 1
        mov     word ptr [bp - 8], 20h
        mov     word ptr [bp - 0ah], 2710h
        mov     bx, si
        inc     si
        mov     al, byte ptr [bx]
        cbw
        mov     di, ax
        mov     ax, di
        cmp     ax, 2dh
        jnz     br_f2915
        mov     word ptr [bp - 6], 0
        mov     bx, si
        inc     si
        mov     al, byte ptr [bx]
        cbw
        mov     di, ax
br_f2915:
        cmp     di, 30h
        jnz     br_f2927
        mov     word ptr [bp - 8], 30h
        mov     bx, si
        inc     si
        mov     al, byte ptr [bx]
        cbw
        mov     di, ax
br_f2927:
        if      FW_VERSION < 212
        cmp     di, 2ah
        else
        cmp     di, W_002A
        endif
        jnz     br_f2942
        mov     bx, word ptr [bp - 2]
        add     word ptr [bp - 2], 2
        mov     ax, word ptr [bx]
        mov     word ptr [bp - 0ch], ax
        mov     di, si
        inc     si
        mov     al, byte ptr [di]
        cbw
        mov     di, ax
        jmp     br_f2968
br_f2942:
        mov     word ptr [bp - 0ch], 0
br_f2947:
        test    byte ptr [di + TBL_4B15], 4
        jz      br_f2968
        mov     ax, word ptr [bp - 0ch]
        mov     cx, 0ah
        imul    cx
        add     ax, di
        add     ax, 0ffd0h
        mov     word ptr [bp - 0ch], ax
        mov     bx, si
        inc     si
        mov     al, byte ptr [bx]
        cbw
        mov     di, ax
        jmp     br_f2947
br_f2968:
        cmp     di, 2eh
        jnz     br_f29b8
        mov     bx, si
        inc     si
        mov     al, byte ptr [bx]
        cbw
        mov     di, ax
        mov     ax, di
        if      FW_VERSION < 212
        cmp     ax, 2ah
        else
        cmp     ax, W_002A
        endif
        jnz     br_f2992
        mov     bx, word ptr [bp - 2]
        add     word ptr [bp - 2], 2
        mov     ax, word ptr [bx]
        mov     word ptr [bp - 0ah], ax
        mov     di, si
        inc     si
        mov     al, byte ptr [di]
        cbw
        mov     di, ax
        jmp     br_f29b8
br_f2992:
        mov     word ptr [bp - 0ah], 0
br_f2997:
        test    byte ptr [di + TBL_4B15], 4
        jz      br_f29b8
        mov     ax, word ptr [bp - 0ah]
        mov     cx, 0ah
        imul    cx
        add     ax, di
        add     ax, 0ffd0h
        mov     word ptr [bp - 0ah], ax
        mov     bx, si
        inc     si
        mov     al, byte ptr [bx]
        cbw
        mov     di, ax
        jmp     br_f2997
br_f29b8:
        mov     word ptr [bp - 0eh], 2
        cmp     di, 6ch
        jnz     br_f29d1
        mov     bx, si
        inc     si
        mov     al, byte ptr [bx]
        cbw
        mov     di, ax
        mov     word ptr [bp - 0eh], 4
        jmp     br_f29de
br_f29d1:
        cmp     di, 68h
        jnz     br_f29de
        mov     bx, si
        inc     si
        mov     al, byte ptr [bx]
        cbw
        mov     di, ax
br_f29de:
        mov     ax, di
        jmp     br_f2a4b
loop_f29e2:
        mov     word ptr [bp - 10h], 8
        jmp     br_f29fc
loop_f29e9:
        mov     word ptr [bp - 10h], 0ah
        jmp     br_f29fc
loop_f29f0:
        mov     word ptr [bp - 10h], 10h
        jmp     br_f29fc
loop_f29f7:
        mov     word ptr [bp - 10h], 0fff6h
br_f29fc:
        push    word ptr [bp - 0eh]
        lea     ax, [bp - 0cch]
        push    ax
        push    word ptr [bp - 10h]
        push    word ptr [bp - 2]
        callf   SEG_F27F:far_f27f9
        add     sp, 8
        mov     word ptr [bp - 12h], ax
        mov     ax, word ptr [bp - 0eh]
        add     word ptr [bp - 2], ax
        jmp     br_f2a6b
loop_f2a1d:
        mov     bx, word ptr [bp - 2]
        add     word ptr [bp - 2], 2
        mov     ax, word ptr [bx]
        mov     word ptr [bp - 12h], ax
        push    ax
        callf   SEG_F279:far_f2797
        pop     cx
        mov     word ptr [bp - 0eh], ax
        jmp     br_f2a75
loop_f2a35:
        mov     bx, word ptr [bp - 2]
        add     word ptr [bp - 2], 2
        mov     di, word ptr [bx]
br_f2a3e:
        mov     ax, di
        lea     bx, [bp - 0cdh]
        mov     word ptr [bp - 12h], bx
        mov     byte ptr [bx], al
        jmp     br_f2a6b
br_f2a4b:
        cmp     ax, 63h
        jz      loop_f2a35
        cmp     ax, 64h
        jz      loop_f29f7
        cmp     ax, 6fh
        jz      loop_f29e2
        cmp     ax, 73h
        jz      loop_f2a1d
        cmp     ax, 75h
        jz      loop_f29e9
        cmp     ax, 78h
        jz      loop_f29f0
        jmp     br_f2a3e
br_f2a6b:
        lea     ax, [bp - 0cch]
        sub     ax, word ptr [bp - 12h]
        mov     word ptr [bp - 0eh], ax
br_f2a75:
        mov     ax, word ptr [bp - 0eh]
        cmp     ax, word ptr [bp - 0ah]
        jle     br_f2a83
        mov     ax, word ptr [bp - 0ah]
        mov     word ptr [bp - 0eh], ax
br_f2a83:
        cmp     word ptr [bp - 6], 0
        jz      br_f2adb
        mov     bx, word ptr [bp - 12h]
        cmp     byte ptr [bx], 2dh
        jz      br_f2a96
        cmp     byte ptr [bx], 2bh
        jnz     br_f2aba
br_f2a96:
        mov     ax, word ptr [bp - 8]
        cmp     ax, 30h
        jnz     br_f2aba
        dec     word ptr [bp - 0ch]
        inc     word ptr [bp - 12h]
        mov     al, byte ptr [bx]
        cbw
        push    ax
        callf   dword ptr [bp + 6]
        pop     cx
        cmp     ax, 0ffffh
        jnz     br_f2aba
        mov     ax, 0ffffh
br_f2ab4:
        pop     si
        pop     di
        mov     sp, bp
        pop     bp
        retf
br_f2aba:
        mov     ax, word ptr [bp - 0ch]
        dec     word ptr [bp - 0ch]
        cmp     ax, word ptr [bp - 0eh]
        jle     br_f2adb
        push    word ptr [bp - 8]
        callf   dword ptr [bp + 6]
        pop     cx
        cmp     ax, 0ffffh
        jnz     br_f2ad6
        mov     ax, 0ffffh
        jmp     br_f2ab4
br_f2ad6:
        inc     word ptr [bp - 4]
        jmp     br_f2aba
br_f2adb:
        mov     word ptr [bp - 10h], 0
br_f2ae0:
        mov     bx, word ptr [bp - 12h]
        cmp     byte ptr [bx], 0
        jz      br_f2b0a
        mov     ax, word ptr [bp - 10h]
        cmp     ax, word ptr [bp - 0ah]
        jge     br_f2b0a
        inc     word ptr [bp - 12h]
        mov     al, byte ptr [bx]
        cbw
        push    ax
        callf   dword ptr [bp + 6]
        pop     cx
        cmp     ax, 0ffffh
        jnz     br_f2b05
        mov     ax, 0ffffh
        jmp     br_f2ab4
br_f2b05:
        inc     word ptr [bp - 10h]
        jmp     br_f2ae0
br_f2b0a:
        mov     ax, word ptr [bp - 10h]
        add     word ptr [bp - 4], ax
        cmp     word ptr [bp - 6], 0
        jnz     br_f2b38
br_f2b16:
        mov     ax, word ptr [bp - 0ch]
        dec     word ptr [bp - 0ch]
        cmp     ax, word ptr [bp - 0eh]
        jle     br_f2b38
        mov     ax, 20h
        push    ax
        callf   dword ptr [bp + 6]
        pop     cx
        cmp     ax, 0ffffh
        jnz     br_f2b33
        mov     ax, 0ffffh
        jmp     short br_f2ab4
br_f2b33:
        inc     word ptr [bp - 4]
        jmp     br_f2b16
br_f2b38:
        jmp     br_f2b4d
br_f2b3a:
        push    di
        callf   dword ptr [bp + 6]
        pop     cx
        cmp     ax, 0ffffh
        jnz     br_f2b4a
        mov     ax, 0ffffh
        jmp     near br_f2ab4
br_f2b4a:
        inc     word ptr [bp - 4]
br_f2b4d:
        jmp     br_f28ce
br_f2b50:
        mov     ax, word ptr [bp - 4]
        jmp     near br_f2ab4
        if      FW_VERSION < 212
        phase   3
        elseif  FW_VERSION = 212
        phase   5
        else
        phase   6
        endif
far_f2b56:
        push    bp
        mov     bp, sp
        push    si
        push    di
        mov     di, ds
        mov     es, di
        mov     si, word ptr [bp + 6]
        mov     di, word ptr [bp + 8]
        mov     cx, word ptr [bp + 0ah]
        jcxz    br_f2b77
        cmp     di, si
        jz      br_f2b77
loop_f2b6e:
        mov     al, byte ptr es:[di]
        xchg    byte ptr [si], al
        stosb
        inc     si
        loop    loop_f2b6e
br_f2b77:
        pop     di
        pop     si
        pop     bp
        retf
        if      FW_VERSION < 212
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
; startup copies 6930h bytes from here to RAM 3000h (header words 2/4/6);
; code runs in RAM, phased to RAM segments.
        phase   0
        endif

RUN_FAR_044EB macro   {GLOBALSYMBOLS}
far_044eb:
        push    bp
        mov     bp, sp
        push    si
        push    di
        if      FW_VERSION >= 212
        mov     si, word ptr [bp + 6]
        mov     bx, word ptr [si + 1]
        push    bx
        endif
        cmp     word ptr [bp + 8], 0
        jnz     br_04500
        if      FW_VERSION >= 212
        jmp     near br_0458e
br_04500:
        sub     bh, bh
        shl     bl, 1
        jc      br_04523
        shr     bl, 1
        test    byte ptr [bx + TBL_954C], 4
        jnz     br_04523
        else
        jmp     br_04554
        db      090h
br_04500:
        mov     si, word ptr [bp + 6]
        mov     bl, byte ptr [si + 1]
        sub     bh, bh
        shl     bx, 1
        add     bx, word ptr [bp + 0ah]
        mov     di, word ptr [bx]
        mov     ax, di
        cmp     byte ptr [B_501C], 0ffh
        jz      L_03032
        cmp     al, byte ptr [B_501C]
        jz      br_04523
        cmp     ah, byte ptr [B_501C]
        jz      br_04523
L_03032:
        endif
        mov     bl, byte ptr [B_8CD9]
        sub     bh, bh
        if      FW_VERSION >= 212
        mov     al, byte ptr [bx + TBL_94E8]
        else
        mov     al, byte ptr [bx +TBL_5066_V112]
        endif
        push    ax
        push    si
        if      FW_VERSION >= 212
        callf   SEG_05C2:far_05c29
        else
        callf   4efh:L_04ef2
        endif
        add     sp, 4
br_04523:
        mov     al, byte ptr [si]
        and     al, 0f8h
        cmp     al, 98h
        jnz     br_04537
        if      FW_VERSION >= 212
        push    si
        callf SEG_04DE:far_04ded
        add     sp, 2
        jmp     br_0458e
        else
        push    di
        push    si
        callf   4a3h:far_04ded
        add     sp, 4
        jmp     br_04554
        endif
        db      090h
br_04537:
        cmp     al, 0f8h
        if      FW_VERSION >= 212
        jnz     br_0453e
        jmp     br_0458e
        db      090h
br_0453e:
        cmp     al, 0f0h
        jnz     br_04582
        cmp     byte ptr [si + 2], 47h
        jnz     br_04582
        cmp     byte ptr [si + 5], 45h
        jz      br_04554
        cmp     byte ptr [si + 5], 46h
        jnz     br_04582
br_04554:
        mov     al, byte ptr [si + 6]
        cmp     al, 1
        jz      br_0455f
        cmp     al, 2
        jnz     br_04569
br_0455f:
        cmp     byte ptr [B_52AD], 0
        jz      br_0458e
        jmp     br_04582
        db      090h
br_04569:
        cmp     al, 3
        jnz     br_04577
        cmp     byte ptr [B_52AE], 0
        jz      br_0458e
        jmp     br_04582
        db      090h
br_04577:
        cmp     al, 4
        jnz     br_04582
        cmp     byte ptr [B_5216], 0
        jz      br_0458e
br_04582:
        else
        jz      br_04554
        push    di
        endif
        push    word ptr [bp + 8]
        push    si
        if      FW_VERSION >= 212
        callf   SEG_05AA:far_05aaf
        add     sp, 4
br_0458e:
        pop     bx
        mov     word ptr [si + 1], bx
        else
        callf   SEG_05AA:far_05acc
        add     sp, 6
br_04554:
        endif
        pop     di
        pop     si
        pop     bp
        retf
        endm
        if      FW_VERSION < 212
        RUN_FAR_044EB
        phase   0
far_04596:
        endif

RUN_BR_0459C macro   {GLOBALSYMBOLS}
        push    es
        push    si
        push    di
br_0459c:
        if      FW_VERSION >= 212
        mov     di, word ptr [bp + 6]
        cmp     byte ptr [di], 0
        jl      br_045aa
        cmp     word ptr [di + 3ah], 0
        jz      br_045ad
br_045aa:
        else
        cmp     word ptr [W_94E0], 0
        jz      br_045ad
        endif
        jmp     br_04a84
br_045ad:
        if      FW_VERSION >= 212
        mov     dx, word ptr [di + 14h]
        mov     ax, word ptr [di + 12h]
        else
        mov     dx, word ptr [W_A466_V112]
        mov     ax, word ptr [W_A464_V112]
        endif
        mov word ptr [W_0ACC], dx
        mov word ptr [W_0ACA], ax
        if      FW_VERSION >= 212
        push    word 44ch
        push    word TBL_8E65
        push    word ptr [di + 2eh]
        else
        push    word 1400h
        push    word 903fh
        push    1
        endif
        callf SEG_0300:far_03012
        add     sp, 6
        mov     si, ax
        sub     ah, ah
        if      FW_VERSION >= 212
        mov     al, byte ptr [TBL_8E65]
        else
        mov     al, byte ptr [B_903F_V112]
        endif
        and     ax, 0f8h
        mov word ptr [W_0ACE], ax
        jmp     br_048b7
br_045db:
        mov     ax, word ptr [TBL_8E66]
        shl     al, 1
        shr     ax, 1
        if      FW_VERSION >= 212
        mov     word ptr [di + 3ah], ax
        les     bx, dword ptr [di + 12h]
        else
        mov     word ptr [W_94E0], ax
        les     bx, dword ptr [W_A464_V112]
        endif
        mov     al, byte ptr es:[bx]
        and     al, 0f8h
        cmp     al, 88h
        jnz     br_0460c
        if      FW_VERSION >= 212
        push    word 44ch
        push    word TBL_8E65
        push    word ptr [di + 2eh]
        else
        push    word 1400h
        push    word 903fh
        push    1
        endif
        callf SEG_0300:far_03012
        add     sp, 6
        mov     ax, word ptr [TBL_8E66]
        shl     al, 1
        shr     ax, 1
        if      FW_VERSION >= 212
        add     word ptr [di + 3ah], ax
        else
        add     word ptr [W_94E0], ax
        endif
br_0460c:
        jmp     br_0459c
br_0460e:
        sub     ah, ah
        if      FW_VERSION >= 212
        mov     al, byte ptr [B_8E69]
        push    ax
        mov     al, byte ptr [B_8E68]
        push    ax
        push    di
        callf   SEG_ED32:far_ed328
        add     sp, 6
        push    si
        mov     ax, TBL_8E65
        push    ax
        push    di
        callf   SEG_05A0:far_05a01
        add     sp, 6
        else
        mov     al, byte ptr [B_9043_V112]
        push    ax
        mov     al, byte ptr [B_9042_V112]
        push    ax
        callf   0de80h:L_de80e
        add     sp, 4
        push    si
        mov     ax, 903fh
        push    ax
        callf   SEG_EA6F:far_ed328
        add     sp, 4
        endif
        jmp     near br_0459c
br_04632:
        if      FW_VERSION >= 212
        test    byte ptr [di + 1], 80h
        jz      br_0463b
        jmp     br_0488c
br_0463b:
        cmp     byte ptr [B_7E12], 0
        else
        cmp     byte ptr [B_88DA_V112], 0
        endif
        jz      br_04652
        mov dx, word ptr [W_0ACC]
        mov ax, word ptr [W_0ACA]
        if      FW_VERSION >= 212
        mov     word ptr [di + 14h], dx
        mov     word ptr [di + 12h], ax
        else
        mov     word ptr [W_A466_V112], dx
        mov     word ptr [W_A464_V112], ax
        endif
        jmp     br_04a84
br_04652:
        if      FW_VERSION >= 212
        cmp     byte ptr [B_9D35], 0
        jle     br_046c8
        cmp     byte ptr [di], 2
        jnz     br_04679
        mov     dx, word ptr [di + 10h]
        mov     ax, word ptr [di + 0eh]
        mov     word ptr [di + 14h], dx
        mov     word ptr [di + 12h], ax
        mov     dx, word ptr [di + 18h]
        mov     ax, word ptr [di + 16h]
        mov     word ptr [di + 10h], dx
        mov     word ptr [di + 0eh], ax
        mov     byte ptr [di], 0
br_04679:
        mov     word ptr [di + 38h], 1
        cmp     byte ptr [B_8CC9], 0
        jz      br_0468f
        or      byte ptr [B_8CDA], 40h
        callf   3efh:far_03ef3
br_0468f:
        mov     al, byte ptr [B_9D35]
        else
        cmp     byte ptr [B_4CBF_V112], 0
        jle     br_046c8
        cmp     byte ptr [B_52B5_V112], 2
        jnz     br_04679
        mov     dx, word ptr [W_A462_V112]
        mov     ax, word ptr [W_A460_V112]
        mov     word ptr [W_A466_V112], dx
        mov     word ptr [W_A464_V112], ax
        mov     dx, word ptr [W_94BE]
        mov     ax, word ptr [W_94BC]
        mov     word ptr [W_A462_V112], dx
        mov     word ptr [W_A460_V112], ax
        mov     byte ptr [B_52B5_V112], 0
br_04679:
        mov     word ptr [W_52CE_V112], 1
        mov     al, byte ptr [B_4CBF_V112]
        endif
        sub     ah, ah
        push    ax
        if      FW_VERSION >= 212
        callf   SEG_E82A:far_e82a4
        add     sp, 2
        or      byte ptr [B_8CDB], 40h
        or      byte ptr [B_8CDA], 80h
        callf   3efh:far_03ef3
        cmp     byte ptr [B_981C], 1
        jnz     br_046c0
        push    1
        push    word B_981C
        callf   SEG_E8CD:far_e8cd3
        add     sp, 4
br_046c0:
        mov     byte ptr [B_9D35], 0ffh
        jmp     br_0459c
br_046c8:
        cmp     byte ptr [B_A06E], 0
        jnz     br_046d2
        jmp     br_047a2
        else
        callf   0e295h:far_e82a4
        add     sp, 2
        callf   424h:L_04245
        mov     byte ptr [B_4CBF_V112], 0ffh
        jmp     br_04a84
br_046c8:
        cmp     byte ptr [B_5759_V112], 0
        jnz     br_046d2
        jmp     near br_047a2
        endif
br_046d2:
        sub     ah, ah
        mov     al, byte ptr [B_A06A]
        dec     ax
        mov     di, ax
        if      FW_VERSION >= 212
        cmp     byte ptr [B_A06D], 0
        else
        cmp     byte ptr [B_5758_V112], 0
        endif
        jnz     br_046f7
        mov dx, word ptr [W_0ACC]
        mov ax, word ptr [W_0ACA]
        if      FW_VERSION >= 212
        mov     word ptr [W_94BA], dx
        mov     word ptr [W_94B8], ax
        else
        mov     word ptr [W_A466_V112], dx
        mov     word ptr [W_A464_V112], ax
        endif
        callf   SEG_0459:far_04a89
        jmp     br_04a84
br_046f7:
        if      FW_VERSION >= 212
        dec     byte ptr [B_A06D]
        else
        dec     byte ptr [B_5758_V112]
        endif
        jz      br_04700
        jmp     near br_04790
br_04700:
        mov     ax, di
        mov     dx, ax
        mov     cl, 5
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        shl     ax, 1
        mov     bx, ax
        if      FW_VERSION >= 212
        inc     byte ptr [B_A06B]
        sub     ah, ah
        mov     al, byte ptr [B_A06B]
        else
        inc     byte ptr [B_5756_V112]
        sub     ah, ah
        mov     al, byte ptr [B_5756_V112]
        endif
        shl     ax, 1
        push    bx
        add     bx, ax
        if      FW_VERSION >= 212
        mov     al, byte ptr [bx + TBL_5517]
        pop     bx
        mov     byte ptr [B_A06D], al
        cmp     byte ptr [B_A06D], 0
        jnz     br_04771
        cmp     byte ptr [di + TBL_7C26], 0
        jz      br_0475b
        mov     al, byte ptr [di + TBL_7C3A]
        dec     al
        mov     byte ptr [B_A06B], al
        else
        mov     al, byte ptr [bx +TBL_6197_V112]
        pop     bx
        mov     byte ptr [B_5758_V112], al
        cmp     byte ptr [B_5758_V112], 0
        jnz     br_04771
        cmp     byte ptr [di +TBL_88A6_V112], 0
        jz      br_0475b
        mov     al, byte ptr [di +TBL_88BA_V112]
        dec     al
        mov     byte ptr [B_5756_V112], al
        endif
        sub     ah, ah
        shl     ax, 1
        push    bx
        add     bx, ax
        if      FW_VERSION >= 212
        mov     al, byte ptr [bx + TBL_5517]
        pop     bx
        mov     byte ptr [B_A06D], al
        mov     ax, word ptr [W_7E08]
        mov     word ptr [W_94DE], ax
        else
        mov     al, byte ptr [bx +TBL_6197_V112]
        pop     bx
        mov     byte ptr [B_5758_V112], al
        mov     ax, word ptr [W_7E08]
        mov     word ptr [W_52CE_V112], ax
        endif
        jmp     br_04771
        db      090h
br_0475b:
        mov dx, word ptr [W_0ACC]
        mov ax, word ptr [W_0ACA]
        if      FW_VERSION >= 212
        mov     word ptr [W_94BA], dx
        mov     word ptr [W_94B8], ax
        else
        mov     word ptr [W_A466_V112], dx
        mov     word ptr [W_A464_V112], ax
        endif
        callf   SEG_0459:far_04a89
        jmp     br_04a84
br_04771:
        if      FW_VERSION >= 212
        mov     al, byte ptr [B_A06B]
        else
        mov     al, byte ptr [B_5756_V112]
        endif
        sub     ah, ah
        shl     ax, 1
        add     bx, ax
        if      FW_VERSION >= 212
        mov     al, byte ptr [bx + TBL_5516]
        else
        mov     al, byte ptr [bx +TBL_6196_V112]
        endif
        sub     ah, ah
        push    ax
        if      FW_VERSION >= 212
        callf   SEG_E82A:far_e82a4
        else
        callf   0e295h:far_e82a4
        endif
        add     sp, 2
        test    ax, ax
        jz      br_04790
        jmp     near br_04700
br_04790:
        if      FW_VERSION >= 212
        or      byte ptr [B_8CDB], 40h
        or      byte ptr [B_8CDA], 80h
        callf   3efh:far_03ef3
        else
        callf   424h:L_04245
        endif
        jmp     br_0459c
br_047a2:
        if      FW_VERSION >= 212
        test    byte ptr [di + 1], 1
        else
        test    byte ptr [B_94A7], 1
        endif
        jz      br_04823
        sub     al, al
        mov     byte ptr [B_7E6B], al
        mov     byte ptr [B_7E6A], al
        if      FW_VERSION >= 212
        cmp     word ptr [di + 30h], 1
        jz      br_047bc
        cmp     word ptr [di + 32h], 1
        jz      br_047c6
br_047bc:
        callf   SEG_04D5:far_04d5e
        mov     byte ptr [TBL_8E65], 0ffh
br_047c6:
        push    si
        mov     ax, TBL_8E65
        push    ax
        push    di
        callf   SEG_05A0:far_05a01
        add     sp, 6
        cmp     word ptr [di + 32h], 1
        jnz     br_047ee
        mov     word ptr [di + 38h], 1
        else
        cmp     word ptr [W_94D8], 1
        jz      L_03259
        callf   SEG_04D5:far_04d5e
        mov     byte ptr [B_903F_V112], 0ffh
L_03259:
        push    si
        mov     ax, 903fh
        push    ax
        callf   SEG_EA6F:far_ed328
        add     sp, 4
        cmp     word ptr [W_94D8], 1
        jnz     br_e1c97
        mov     word ptr [W_52CE_V112], 1
        endif
        cmp     byte ptr [B_7E11], 8
        jnz     br_047eb
        mov     byte ptr [B_7E11], 0ah
br_047eb:
        jmp     br_0459c
        if      FW_VERSION >= 212
br_047ee:
        cmp     byte ptr [di], 0
        jnz     br_04802
        mov     byte ptr [di], 2
        mov     dx, word ptr [di + 14h]
        mov     ax, word ptr [di + 12h]
        mov     word ptr [di + 10h], dx
        mov     word ptr [di + 0eh], ax
br_04802:
        mov     dx, word ptr [di + 1ch]
        mov     ax, word ptr [di + 1ah]
        mov     word ptr [di + 14h], dx
        mov     word ptr [di + 12h], ax
        mov     ax, word ptr [di + 32h]
        mov     word ptr [di + 38h], ax
        else
br_e1c97:
        cmp     byte ptr [B_52B5_V112], 0
        jnz     br_04802
        mov     byte ptr [B_52B5_V112], 2
        mov     dx, word ptr [W_A466_V112]
        mov     ax, word ptr [W_A464_V112]
        mov     word ptr [W_A462_V112], dx
        mov     word ptr [W_A460_V112], ax
br_04802:
        mov     dx, word ptr [W_94C2]
        mov     ax, word ptr [W_94C0]
        mov     word ptr [W_A466_V112], dx
        mov     word ptr [W_A464_V112], ax
        mov     ax, word ptr [W_94D8]
        mov     word ptr [W_52CE_V112], ax
        endif
        cmp     byte ptr [B_7E11], 8
        jc      br_04820
        mov     byte ptr [B_7E11], 6
br_04820:
        jmp     br_0459c
br_04823:
        callf   SEG_04D5:far_04d5e
        if      FW_VERSION >= 212
        mov     byte ptr [TBL_8E65], 0ffh
        else
        mov     byte ptr [B_903F_V112], 0ffh
        endif
        mov dx, word ptr [W_0ACC]
        mov ax, word ptr [W_0ACA]
        if      FW_VERSION >= 212
        mov     word ptr [di + 14h], dx
        mov     word ptr [di + 12h], ax
        cmp     byte ptr [di], 0
        else
        mov     word ptr [W_A466_V112], dx
        mov     word ptr [W_A464_V112], ax
        cmp     byte ptr [B_52B5_V112], 0
        endif
        jnz     br_04884
        cmp     byte ptr [B_7E11], 8
        jnz     br_04884
        if      FW_VERSION >= 212
        cmp     word ptr [di + 38h], 3e7h
        jg      br_04884
        mov     ax, word ptr [di + 38h]
        mov     word ptr [di + 30h], ax
        mov     si, TBL_8E65
        else
        cmp     word ptr [W_52CE_V112], 3e7h
        jg      br_04884
        mov     ax, word ptr [W_52CE_V112]
        mov     word ptr [W_94D6], ax
        mov     si, 903fh
        endif
        mov     byte ptr [si], 0a8h
        shl     ax, 1
        shr     al, 1
        mov     byte ptr [si + 1], al
        mov     byte ptr [si + 2], ah
        if      FW_VERSION >= 212
        mov     al, byte ptr [di + 3ch]
        mov     byte ptr [si + 3], al
        mov     al, byte ptr [di + 3dh]
        else
        mov     al, byte ptr [B_94E2]
        mov     byte ptr [si + 3], al
        mov     al, byte ptr [B_94E3]
        endif
        mov     byte ptr [si + 4], al
        push    5
        push    si
        if      FW_VERSION >= 212
        push    di
        callf   SEG_05A0:far_05a01
        add     sp, 6
        mov     ax, word ptr [di + 3eh]
        mov     word ptr [di + 3ah], ax
        else
        callf   SEG_EA6F:far_ed328
        add     sp, 4
        mov     ax, word ptr [W_94E4]
        mov     word ptr [W_94E0], ax
        endif
        jmp     br_04a84
br_04884:
        callf   SEG_0459:far_04a89
        if      FW_VERSION >= 212
        jmp     br_04a84
br_0488c:
        test    byte ptr [di + 1], 1
        jz      br_048a7
        mov     dx, word ptr [di + 1ch]
        mov     ax, word ptr [di + 1ah]
        mov     word ptr [di + 14h], dx
        mov     word ptr [di + 12h], ax
        mov     ax, word ptr [di + 32h]
        mov     word ptr [di + 38h], ax
        jmp     br_0459c
br_048a7:
        mov dx, word ptr [W_0ACC]
        mov ax, word ptr [W_0ACA]
        mov     word ptr [di + 14h], dx
        mov     word ptr [di + 12h], ax
        endif
        jmp     br_04a84
br_048b7:
        cmp     ax, 88h
        jnz     br_048bf
        jmp     br_045db
br_048bf:
        cmp     ax, 0a8h
        jnz     br_048c7
        jmp     br_0460e
br_048c7:
        cmp     ax, 0f8h
        jnz     br_048cf
        jmp     br_04632
br_048cf:
        if      FW_VERSION >= 212
        test    byte ptr [di + 1], 80h
        jz      br_048d8
        jmp     br_04a50
br_048d8:
        endif
        cmp     byte ptr [B_7E11], 8
        jnz     br_048f7
        if      FW_VERSION >= 212
        cmp     byte ptr [B_7E63], 0
        jnz     br_048f4
        endif
        mov     al, byte ptr [TBL_8E66]
        cmp     al, byte ptr [B_9D37]
        jnz     br_048f7
        if      FW_VERSION >= 212
        mov     byte ptr [B_5507], 1
br_048f4:
        else
        mov     byte ptr [B_618B_V112], 1
        endif
        jmp     br_0459c
br_048f7:
        mov word ptr [W_0AD0], 1
        cmp     byte ptr [B_7E11], 0ah
        jz      br_04907
        jmp     br_04a28
br_04907:
        mov     al, byte ptr [TBL_8E66]
        cmp     al, byte ptr [B_9D37]
        jz      br_04913
        jmp     br_04a28
br_04913:
        mov ax, word ptr [W_0ACE]
        sub     ah, ah
        jmp     br_04a09
br_0491b:
        cmp     byte ptr [B_7E0D], 0
        jz      br_0495b
        cmp     byte ptr [B_8C07], 0
        jz      br_04945
        if      FW_VERSION >= 212
        mov     al, byte ptr [B_8E67]
        else
        mov     al, byte ptr [B_9041_V112]
        endif
        sub     ah, ah
        mov     bx, ax
        if      FW_VERSION >= 212
        and     bx, 1fh
        else
        and.w   bx, 1fh
        endif
        cmp     byte ptr [bx + TBL_8C09], 0
        jz      br_04942
        if      FW_VERSION >= 212
        mov     byte ptr [B_5507], 1
        else
        mov     byte ptr [B_618B_V112], 1
        endif
        jmp     br_0459c
br_04942:
        jmp     br_0495b
        db      090h
br_04945:
        if      FW_VERSION >= 212
        mov     al, byte ptr [B_8E67]
        else
        mov     al, byte ptr [B_9041_V112]
        endif
        sub     ah, ah
        mov     bx, ax
        cmp     byte ptr [bx + TBL_8C49], 0
        jz      br_0495b
        if      FW_VERSION >= 212
        mov     byte ptr [B_5507], 1
        else
        mov     byte ptr [B_618B_V112], 1
        endif
        jmp     br_0459c
br_0495b:
        cmp     byte ptr [B_550D], 0
        jz      br_0497b
        cmp     byte ptr [B_8C07], 0
        jz      br_0497b
        if      FW_VERSION >= 212
        cmp     byte ptr [B_8E67], 0
        jnz     br_0497b
        mov     byte ptr [B_5507], 1
        mov     al, byte ptr [B_8B4F]
        mov     byte ptr [B_8E69], al
br_0497b:
        cmp     byte ptr [B_A067], 0
        jz      br_049a4
        callf   SEG_05BB:far_05bb5
        else
        cmp     byte ptr [B_9041_V112], 0
        jnz     br_0497b
        mov     byte ptr [B_618B_V112], 1
        mov     al, byte ptr [B_8B4F]
        mov     byte ptr [B_9043_V112], al
br_0497b:
        cmp     byte ptr [B_5B07_V112], 0
        jz      br_049a4
        callf   0e2cbh:L_e2cb3
        endif
        mov word ptr [W_0AD0], 0
        jmp     near br_04a28
br_04990:
        if      FW_VERSION >= 212
        cmp     byte ptr [B_7E65], 2
        jl      br_049a4
        else
        cmp     byte ptr [B_7E65], 0
        jz      br_049a4
        endif
        jmp     br_0459c
br_0499a:
        cmp     byte ptr [B_7E66], 0
        jz      br_049a4
        jmp     br_0459c
br_049a4:
        jmp     near br_04a28
br_049a7:
        if      FW_VERSION >= 212
        mov     al, byte ptr [B_8E67]
        else
        mov     al, byte ptr [B_9041_V112]
        endif
        sub     ah, ah
        jmp     br_049f9
        db      090h
tgt_049af:
        cmp     byte ptr [B_7E67], 0
        jz      tgt_04a06
        jmp     br_0459c
tgt_049b9:
        cmp     byte ptr [B_7E68], 0
        jz      tgt_04a06
        jmp     br_0459c
tgt_049c3:
        cmp     byte ptr [B_7E69], 0
        jz      tgt_04a06
        jmp     br_0459c
tgt_049cd:
        cmp     byte ptr [B_7E6A], 0
        jz      tgt_04a06
        jmp     br_0459c
tgt_049d7:
        cmp     byte ptr [B_7E6B], 0
        jz      tgt_04a06
        jmp     br_0459c
TBL_049e1:
        dw      tgt_04a06
        dw      tgt_049af
        dw      tgt_049b9
        dw      tgt_04a06
        dw      tgt_049c3
        dw      tgt_04a06
        dw      tgt_04a06
        dw      tgt_049cd
        dw      tgt_04a06
        dw      tgt_04a06
        dw      tgt_04a06
        dw      tgt_049d7
br_049f9:
        cmp     ax, 0ch
        jnc     tgt_04a06
        xchg    bx, ax
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_049e1]
tgt_04a06:
        jmp     br_04a28
        db      090h
br_04a09:
        cmp     ax, 98h
        jnz     br_04a11
        jmp     br_0491b
br_04a11:
        cmp     ax, 0b0h
        jnz     br_04a18
        jmp     br_049a7
br_04a18:
        cmp     ax, 0d0h
        jnz     br_04a20
        jmp     near br_04990
br_04a20:
        cmp     ax, 0e0h
        jnz     br_04a28
        jmp     near br_0499a
br_04a28:
        cmp word ptr [W_0AD0], 0
        jz      br_04a3d
        push    si
        if      FW_VERSION >= 212
        mov     ax, TBL_8E65
        push    ax
        push    di
        callf   SEG_05A0:far_05a01
        add     sp, 6
        else
        mov     ax, 903fh
        push    ax
        callf   SEG_EA6F:far_ed328
        add     sp, 4
        endif
br_04a3d:
        cmp     byte ptr [B_4C32], 0
        jz      br_04a5a
        mov     al, byte ptr [TBL_8E66]
        cmp     al, byte ptr [B_9D37]
        jz      br_04a5a
        jmp     br_0459c
        if      FW_VERSION >= 212
br_04a50:
        cmp     byte ptr [B_4C32], 0
        jz      br_04a5a
        jmp     br_0459c
        endif
br_04a5a:
        mov     al, byte ptr [TBL_8E66]
        sub     ah, ah
        mov     bx, ax
        if      FW_VERSION >= 212
        test    byte ptr [bx+di + 0a6h], 1
        else
        test    byte ptr [bx +TBL_50CA_V112], 1
        endif
        jz      br_04a6b
        jmp     br_0459c
br_04a6b:
        if      FW_VERSION >= 212
        mov     al, byte ptr [di + 1]
        and     al, 80h
        or      byte ptr [TBL_8E66], al
        push    si
        mov     ax, TBL_8E65
        else
        mov     ax, 512eh
        push    ax
        push    si
        mov     ax, 903fh
        endif
        push    ax
        callf   SEG_044E:far_044eb
        if      FW_VERSION >= 212
        add     sp, 4
        else
        add     sp, 6
        endif
        jmp     br_0459c
br_04a84:
        pop     di
        pop     si
        pop     es
        if      FW_VERSION >= 212
        pop     bp
        endif
        retf
far_04a89:
        if      FW_VERSION >= 212
        push    bp
        endif
        push    si
        push    di
        if      FW_VERSION >= 212
        callf   SEG_F049:far_f0496
        else
        callf   SEG_F049:L_e2649
        mov     si, 4
        endif
        mov     di, 0
loop_04a94:
        if      FW_VERSION >= 212
        sub     sp, 2
        mov     bp, sp
        push    4
        else
        push    word ptr [W_88DD_V112]
        push    si
        endif
        mov     ax, di
        shl     ax, 1
        shl     ax, 1
        if      FW_VERSION >= 212
        add     ax, 0ad2h
        push    ax
        sub     si, si
loop_04aa7:
        cmp     byte ptr [si + TBL_7E15], 0
        jz      br_04aba
        mov     ax, si
        mov     ah, 0ffh
        mov     word ptr [bp], ax
        callf   SEG_05A3:far_05a35
br_04aba:
        inc     si
        cmp     si, 40h
        jl      loop_04aa7
        else
        add     ax, 8
        push    ax
        callf   0e2afh:L_e2afe
        endif
        add     sp, 6
        inc     di
        if      FW_VERSION >= 212
        cmp     di, 3
        jl      loop_04a94
        mov     bx, es
        mov     ax, ds
        mov     es, ax
        mov     di, TBL_7E15
        mov     cx, 40h
        cld
        sub     ax, ax
        rep stosb
        mov     es, bx
        mov     byte ptr [B_9D35], 0
        else
        cmp     di, 2
        jl      loop_04a94
        mov     byte ptr [B_4CBF_V112], 0
        mov     word ptr [W_88DD_V112], 0
        endif
        callf   SEG_EEFD:far_eefd9
        pop     di
        pop     si
        endm
        if      FW_VERSION < 212
        RUN_BR_0459C
        retf
        phase   0ah
far_05248:
        endif

RUN_BR_05253 macro   {GLOBALSYMBOLS}
        cmp     byte ptr [B_8D78], 0
        jz      br_05253
        jmp     near br_05301
br_05253:
        if      FW_VERSION >= 212
        push    bp
        sub     sp, 0ah
        mov     bp, sp
br_05259:
        push    0ah
        push    bp
        push    8
        callf SEG_0300:far_03012
        add     sp, 6
        or      ax, ax
        jz      br_05275
        push    bp
        callf   SEG_DFBE:far_dfbe6
        add     sp, 2
        jmp     br_05259
br_05275:
        add     sp, 0ah
        pop     bp
        mov     ax, SEG_15E8
        mov     es, ax
        endif
        pushf
        cli
        if      FW_VERSION >= 212
        test    word ptr es:[1330h], 0ffffh
        else
        test    word ptr [W_476F_V112], 0ffffh
        endif
        jz      br_0529e
        mov     al, byte ptr [TBL_4C18]
        test    al, 1
        jnz     br_0529e
        or      byte ptr [B_8B51], 1
        or      al, 1
        mov     dx, 102h
        mov     byte ptr [TBL_4C18], al
        out     dx, al
br_0529e:
        if      FW_VERSION >= 212
        test    word ptr es:[1932h], 0ffffh
        else
        test    word ptr [W_48A8_V112], 0ffffh
        endif
        jz      br_052bc
        mov     al, byte ptr [B_4C19]
        test    al, 1
        jnz     br_052bc
        or      byte ptr [B_8B51], 2
        or      al, 1
        mov     dx, 112h
        mov     byte ptr [B_4C19], al
        out     dx, al
br_052bc:
        if      FW_VERSION >= 212
        test    word ptr es:[1f34h], 0ffffh
        else
        test    word ptr [W_49E1_V112], 0ffffh
        endif
        jz      br_052da
        mov     al, byte ptr [B_4C1A]
        test    al, 1
        jnz     br_052da
        or      byte ptr [B_8B51], 4
        or      al, 1
        mov     dx, 122h
        mov     byte ptr [B_4C1A], al
        out     dx, al
br_052da:
        if      FW_VERSION >= 212
        test    word ptr es:[2536h], 0ffffh
        else
        test    word ptr [W_4B1A_V112], 0ffffh
        endif
        jz      br_05300
        mov     dx, 132h
        in      al, dx
        test    al, 80h
        jz      br_05300
        or      byte ptr [B_8B51], 8
        mov     al, byte ptr [B_4C1B]
        test    al, 1
        jnz     br_05300
        or      al, 1
        mov     dx, 132h
        mov     byte ptr [B_4C1B], al
        out     dx, al
br_05300:
        popf
br_05301:
        endm
        if      FW_VERSION < 212
        RUN_BR_05253
        retf
        phase   4
        endif

RUN_FAR_03CF2 macro   {GLOBALSYMBOLS}
far_03cf2:
        push    bp
        mov     bp, sp
        push    es
        push    si
        push    di
        mov     cx, word ptr [bp + 6]
        if      FW_VERSION >= 212
        cmp     cx, W_0022
        else
        cmp     cx, 22h
        endif
        jc      br_03d03
        jmp     br_03eb9
br_03d03:
        xor     di, di
        jcxz    br_03d0c
loop_03d07:
        add     di, 3bh
        loop    loop_03d07
br_03d0c:
        cmp     byte ptr [di + TBL_A656], 0
        jnz     br_03d16
        jmp     br_03eb9
br_03d16:
        if      FW_VERSION >= 212
        mov     ax, word ptr [bp + 8]
        mov     bx, word ptr [bp + 0ah]
        callf   SEG_0585:far_05858
        push    bx
        push    ax
        push    dx
        push    cx
        endif
        mov     dx, 1
        callf   SEG_C021:far_c0295
        mov     ax, word ptr [bp + 6]
        if      FW_VERSION >= 212
        push    ax
        endif
        mov     cx, 3
        xor     si, si
        if      FW_VERSION < 212
        push    ax
        endif
loop_03d36:
        cmp     al, byte ptr [si + TBL_AE2C]
        jz      br_03d45
        inc     si
        loop    loop_03d36
        mov     si, 0ffffh
        jmp     br_03d93
        db      090h
br_03d45:
        cmp     si, 0
        jnz     br_03d93
        if      FW_VERSION >= 212
        push    si
        push    bx
        xor     ax, ax
loop_03d4e:
        cmp     word ptr [si + TBL_B1D9], 0
        jz      br_03d89
        mov     bx, si
        shr     bx, 1
        mov     al, byte ptr [bx + TBL_AE4F]
        cmp     al, 0ffh
        jz      br_03d89
        cmp     al, byte ptr [B_AE2D]
        jz      br_03d6d
        cmp     al, byte ptr [TBL_AE2E]
        jnz     br_03d89
br_03d6d:
        mov     cx, 0fae1h
        mov     ax, cx
        out     0, ax
        mov     ax, 60h
        add     ax, bx
        out     2, ax
        mov     cx, 0ffffh
        mov     ax, cx
        out     0, ax
        mov     ax, 50h
        add     ax, bx
        out     2, ax
br_03d89:
        add     si, 2
        cmp     si, 20h
        jnz     loop_03d4e
        pop     bx
        pop     si
br_03d93:
        callf   SEG_EF47:far_ef474
        else
        mov     al, byte ptr [B_AEB6_V112]
        cmp     al, 0
        jge     br_03d6d
        mov     al, byte ptr [B_AEB5_V112]
        cmp     al, 0
        jl      br_03d93
        mov     byte ptr [B_AEB5_V112], 0ffh
        jmp     br_03d89
        db      090h
br_03d6d:
        mov     byte ptr [B_AEB6_V112], 0ffh
        jmp     br_03d89
        db      090h
br_03d93:
        callf   0e343h:far_ef474
br_03d89:
        endif
        add     sp, 2
        and     ax, 0fh
        mov     bx, ax
        shl     bx, 1
        mov     word ptr [bx + TBL_B1B9], 0
        if      FW_VERSION >= 212
        mov     word ptr [bx + TBL_B1D9], 0
        else
        mov     word ptr [bx +TBL_B23E_V112], 0
        cmp     si, 0ffffh
        jz      L_03632
        mov     byte ptr [si +TBL_AEB4_V112], al
        jmp     L_0364b
L_03631:
        db      090h
L_03632:
        cmp     byte ptr [B_AEB6_V112], al
        jnz     L_03640
        mov     byte ptr [B_AEB6_V112], 0ffh
        jmp     L_0364b
        db      090h
L_03640:
        cmp     byte ptr [B_AEB5_V112], al
        jnz     L_0364b
        mov     byte ptr [B_AEB5_V112], 0ffh
L_0364b:
        endif
        mov     si, ax
        mov     ax, word ptr [bp + 6]
        if      FW_VERSION >= 212
        mov     byte ptr [si + TBL_AE4F], al
        else
        mov     byte ptr [si +TBL_AEB8_V112], al
        endif
        cmp     word ptr [bp + 8], 80h
        jc      br_03dc6
        if      FW_VERSION < 212
        mov     word ptr [bp + 8], 7fh
        endif
        mov     dx, 0b4b4h
        mov     bl, 0ffh
        jmp     br_03dce
        db      090h
br_03dc6:
        mov     dx, word ptr [di + TBL_A68D]
        mov     bl, byte ptr [di + TBL_A68F]
br_03dce:
        mov     ax, word ptr [di + TBL_A684]
        shl     si, 1
        if      FW_VERSION >= 212
        mov     word ptr [si + TBL_AE6C], ax
        shr     si, 1
        else
        mov     word ptr [si +TBL_AED1_V112], ax
        shr     si, 1
L_0367c:
        endif
        xor     ax, ax
        out     0, ax
        mov     ax, 20h
        add     ax, si
        out     2, ax
        if      FW_VERSION < 212
        or      ax, 100h
        out     2, ax
        in      ax, 0
        cmp     ax, 0
        jnz     L_0367c
        endif
        push    dx
        push    bx
        mov     dx, word ptr [di + TBL_A676]
        mov     bx, word ptr [di + TBL_A674]
        mov     dh, dl
        mov     dl, bh
        mov     bh, bl
        sub     bl, bl
        shl     bx, 1
        rcl     dx, 1
        shl     bx, 1
        rcl     dx, 1
        shl     bx, 1
        rcl     dx, 1
        shl     bx, 1
        rcl     dx, 1
        if      FW_VERSION < 212
L_036b5:
        endif
        mov     ax, bx
        out     0, ax
        mov     ax, 0
        or      ax, si
        out     2, ax
        if      FW_VERSION < 212
        or      ax, 100h
        out     2, ax
        in      ax, 0
        cmp     ax, bx
        jnz     L_036b5
        endif
loop_03e12:
        mov     ax, dx
        out     0, ax
        mov     ax, 10h
        or      ax, si
        pushf
        cli
        out     2, ax
        out     2, ax
        or      ax, 100h
        out     2, ax
        out     2, ax
        popf
        in      ax, 0
        cmp     ax, dx
        jnz     loop_03e12
        pop     bx
        pop     dx
        mov     ah, bl
        mov     al, byte ptr [di + TBL_A690]
        mov     cl, byte ptr [di + TBL_A68A]
        and     al, 80h
        or      al, cl
        mov     bx, ax
        if      FW_VERSION < 212
L_036fa:
        endif
        mov     ax, bx
        out     0, ax
        mov     ax, 30h
        add     ax, si
        out     2, ax
        endm
        if      FW_VERSION < 212
        RUN_FAR_03CF2
        or      ax, 100h
        out     2, ax
        in      ax, 0
        cmp     ax, bx
        jnz     L_036fa
        mov     bx, word ptr [di +TBL_A6E8_V112]
L_03714:
        mov     ax, bx
        out     0, ax
        mov     ax, 60h
        add     ax, si
        out     2, ax
        or      ax, 100h
        out     2, ax
        in      ax, 0
        cmp     ax, bx
        jnz     L_03714
L_0372a:
        mov     ax, dx
        out     0, ax
        mov     ax, 70h
        add     ax, si
        out     2, ax
        or      ax, 100h
        out     2, ax
        in      ax, 0
        cmp     ax, dx
        jnz     L_0372a
        mov     bx, word ptr [bp + 8]
        mov     cl, 9
        shl     bx, cl
L_03747:
        endif

RUN_L_0375F macro   {GLOBALSYMBOLS}
        mov     ax, bx
        out     0, ax
        mov     ax, 40h
        add     ax, si
        out     2, ax
        if      FW_VERSION >= 212
        pop     bx
        mov     cl, 9
        shl     bx, cl
        not     bx
        else
        or      ax, 100h
        out     2, ax
        in      ax, 0
        cmp     ax, bx
        jnz     L_03747
        not     bx
L_0375f:
        endif
        mov     ax, bx
        out     0, ax
        mov     ax, 50h
        add     ax, si
        out     2, ax
        if      FW_VERSION >= 212
        mov     bx, word ptr [di + TBL_A680]
        else
        or      ax, 100h
        out     2, ax
        in      ax, 0
        cmp     ax, bx
        jnz     L_0375f
        mov     bx, word ptr [di +TBL_A6E6_V112]
L_03779:
        endif
        mov     ax, bx
        out     0, ax
        mov     ax, 20h
        add     ax, si
        out     2, ax
        if      FW_VERSION < 212
        or      ax, 100h
        out     2, ax
        in      ax, 0
        cmp     ax, bx
        jnz     L_03779
        endif
        mov     bx, si
        shl     bx, 1
        if      FW_VERSION >= 212
        pop     cx
        else
        mov     cx, word ptr [di + TBL_A686]
        endif
        cmp     cx, 2
        jnc     br_03e9e
        mov     cx, 2
br_03e9e:
        callf   SEG_EFB8:far_efbaf
        add     bx, 20h
        if      FW_VERSION >= 212
        pop     cx
        else
        mov     cx, word ptr [di + TBL_A688]
        endif
        callf   SEG_EFB8:far_efbaf
        mov     dx, 1
        callf   SEG_C021:far_c02d3
        mov     ax, si
        jmp     br_03ebc
        db      090h
br_03eb9:
        mov     ax, 0ffffh
br_03ebc:
        pop     di
        pop     si
        pop     es
        pop     bp
        retf
        endm
        if      FW_VERSION < 212
        RUN_L_0375F
        elseif  FW_VERSION = 212

        db      000h, 000h, 000h, 000h, 000h, 000h
        else

        db      000h, 000h, 000h, 000h, 000h
        endif
        if      FW_VERSION >= 212
; startup copies 7af0h bytes from here to RAM 3000h (header words 2/4/6);
; code runs in RAM, phased to RAM segments.
        phase   0
TBL_03000:
        dw      tgt_031a3
        dw      tgt_0302c
        dw      tgt_031a3
        dw      tgt_03026
        dw      tgt_030cb
        dw      tgt_03105
        dw      tgt_03129
        dw      tgt_03120
        dw      tgt_0310b
        endif

RUN_FAR_03012 macro   {GLOBALSYMBOLS}

far_03012:
        push    bp
        mov     bp, sp
        mov     bx, word ptr [bp + 6]
        if      FW_VERSION >= 212
        cmp     bx, 9
        jc      br_0301f
        pop     bp
        retf
br_0301f:
        shl     bx, 1
        jmp     word ptr cs:[word bx]
tgt_03026:
        mov     bx, B_981C
        jmp     br_03038
        db      090h
tgt_0302c:
        mov     bx, B_94A6
        cmp     byte ptr [bx], 0
        jge     br_03038
        sub     ax, ax
        pop     bp
        retf
br_03038:
        else
        and.w   bx, 7
        shl     bx, 1
        jmp     word ptr cs:[word bx + TBL_03000]
L_05144:
        endif
        push    si
        push    di
        if      FW_VERSION >= 212
        push    word ptr [bx + 14h]
        push    word ptr [bx + 12h]
        mov     di, word ptr [bp + 8]
        sub     cx, cx
        les     si, dword ptr [bx + 12h]
        else
        push    word ptr [W_A466_V112]
        push    word ptr [W_A464_V112]
        mov     di, word ptr [bp + 8]
        mov     bx, word ptr [bp + 0ah]
        sub     cx, cx
        les     si, dword ptr [W_A464_V112]
        endif
        call    fn_031a5
loop_0304b:
        if      FW_VERSION >= 212
        mov     word ptr [bx + 12h], si
        mov     word ptr [bx + 14h], dx
        else
        mov     word ptr [W_A464_V112], si
        mov     word ptr [W_A466_V112], dx
        endif
        mov     byte ptr [di], al
        inc     di
        inc     cx
        call    fn_031a5
        test    al, 80h
        jnz     br_03061
        if      FW_VERSION >= 212
        cmp     cx, word ptr [bp + 0ah]
        else
        cmp     cx, bx
        endif
        jc      loop_0304b
br_03061:
        mov     si, cx
        if      FW_VERSION >= 212
        cmp     byte ptr [bx], 0
        else
        cmp     byte ptr [B_52B5_V112], 0
        endif
        jnz     br_03074
        add     word ptr [W_8BD5], cx
        adc     word ptr [W_8BD7], 0
        if      FW_VERSION >= 212
        jmp     br_030c2
        db      090h
br_03074:
        test    byte ptr [bx + 1], 80h
        jnz     br_03081
        cmp     byte ptr [B_A06E], 0
        jnz     br_030c2
br_03081:
        mov     di, word ptr [bp + 8]
        mov     al, byte ptr [di]
        else
br_03074:
        cmp     byte ptr [B_52B5_V112], 1
        jnz     br_030c2
        cmp     byte ptr [B_5759_V112], 0
        jnz     br_030c2
        mov     bx, word ptr [bp + 8]
        mov     al, byte ptr [bx]
        endif
        and     al, 0f8h
        cmp     al, 0a8h
        jnz     br_030b0
        if      FW_VERSION >= 212
        mov     ax, word ptr [di + 1]
        else
        mov     ax, word ptr [bx + 1]
        endif
        shl     al, 1
        shr     ax, 1
        push    ax
        if      FW_VERSION >= 212
        push    word ptr [bx + 1]
        callf   SEG_D6EE:far_d6ee4
        add     sp, 2
        pop     ax
        cmp     ax, word ptr [bx + 32h]
        else
        callf   0da1eh:far_d6ee4
        pop     ax
        cmp     ax, word ptr [W_94D8]
        endif
        pop     ax
        pop     dx
        jnz     br_030c5
        if      FW_VERSION >= 212
        mov     word ptr [bx + 1ch], dx
        mov     word ptr [bx + 1ah], ax
        else
        mov     word ptr [W_94C2], dx
        mov     word ptr [W_94C0], ax
        endif
        jmp     br_030c5
        db      090h
br_030b0:
        cmp     al, 0f8h
        jnz     br_030c2
        xor     ax, ax
        push    ax
        if      FW_VERSION >= 212
        push    word ptr [bx + 1]
        callf   SEG_D6EE:far_d6ee4
        add     sp, 4
        else
        callf   0da1eh:far_d6ee4
        add     sp, 2
        endif
br_030c2:
        add     sp, 4
br_030c5:
        mov     ax, si
        endm
        if      FW_VERSION >= 212
        RUN_FAR_03012
        pop     di
        pop     si
        endif

RUN_TGT_030CB macro   {GLOBALSYMBOLS}

        pop     bp
        retf

tgt_030cb:
        if      FW_VERSION >= 212
        push    es
        else
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_05C6:L_053d0
        add     sp, 6
        pop     bp
        retf
L_051ea:
        endif
        push    si
        push    di
        if      FW_VERSION >= 212
        mov     ax, SEG_15E8
        mov     es, ax
        mov     si, 0
        else
        mov     si, 4090h
        endif

        mov     di, word ptr [bp + 8]
        sub     cx, cx
        cli
        call    fn_031c8
        jnz     br_030fd
loop_030e1:
        if      FW_VERSION >= 212
        mov     word ptr es:[si + 2], dx
        mov     word ptr es:[si + 6], bx
        else
        mov     word ptr [si + 2], dx
        mov     word ptr [si + 6], bx
        endif
        sti
        mov     byte ptr [di], al
        inc     di
        inc     cx
        cli
        call    fn_031c8
        jnz     br_030fd
        test    al, 80h
        jnz     br_030fd
        cmp     cx, word ptr [bp + 0ah]
        jc      loop_030e1
br_030fd:
        sti
        mov     ax, cx
        pop     di
        pop     si
        if      FW_VERSION >= 212
        pop     es
        endif
        pop     bp
        retf
        if      FW_VERSION >= 212
tgt_03105:
        mov     si, 6ach
        jmp     br_0310e
        db      090h
tgt_0310b:
        mov     si, 2b36h
br_0310e:
        push    es
        else
L_0521b:
        mov     si, 4298h
        endif
        push    si
        push    di
        if      FW_VERSION >= 212
        mov     ax, SEG_15E8
        mov     es, ax
        mov     cx, word ptr [bp + 0ah]
        mov     dx, word ptr es:[si + 2]
        else
        mov     cx, word ptr [bp + 0ah]
        mov     dx, word ptr [si + 2]
        endif
        jmp     br_03150
        db      090h
        if      FW_VERSION >= 212
tgt_03120:
        else
L_05229:
        endif
        mov     si, A_0D31
        mov     bx, 1
        jmp     br_0312f
        db      090h
        if      FW_VERSION >= 212
tgt_03129:
        else
L_05232:
        endif
        mov     si, A_0734
        mov     bx, 0
br_0312f:
        if      FW_VERSION >= 212
        push    es
        endif
        push    si
        push    di
        if      FW_VERSION >= 212
        mov     ax, SEG_15E8
        mov     es, ax
        cmp     byte ptr [bx + TBL_8B4D], 0
        mov     cx, word ptr [bp + 0ah]
        mov     dx, word ptr es:[si + 2]
        else
        cmp     byte ptr [bx +W_8E71_V112], 0
        mov     cx, word ptr [bp + 0ah]
        mov     dx, word ptr [si + 2]
        endif
        jnz     br_0314c
        cmp     dx, cx
        jnc     br_03150
        jmp     br_0319b
        db      090h
br_0314c:
        if      FW_VERSION >= 212
        dec     byte ptr [bx + TBL_8B4D]
        else
        dec     byte ptr [bx +W_8E71_V112]
        endif
br_03150:
        or      dx, dx
        jz      br_0319b
        mov     di, word ptr [bp + 8]
        if      FW_VERSION >= 212
        mov     bx, word ptr es:[si + 6]
        else
        mov     bx, word ptr [si + 6]
        endif
        or      bx, bx
        jnz     br_03162
        if      FW_VERSION >= 212
        mov     bx, word ptr es:[si]
        else
        mov     bx, word ptr [si]
        endif
br_03162:
        dec     bx
        if      FW_VERSION >= 212
        mov     al, byte ptr es:[bx+si + 8]
        else
        mov     al, byte ptr [bx+si + 8]
        endif
loop_03167:
        mov     byte ptr [di], al
        inc     di
        if      FW_VERSION >= 212
        mov     word ptr es:[si + 6], bx
        dec     cx
        dec     word ptr es:[si + 2]
        else
        mov     word ptr [si + 6], bx
        dec     cx
        dec     word ptr [si + 2]
        endif
        dec     dx
        jz      br_0319b
        or      bx, bx
        jnz     br_0317d
        if      FW_VERSION >= 212
        mov     bx, word ptr es:[si]
        else
        mov     bx, word ptr [si]
        endif
br_0317d:
        dec     bx
        if      FW_VERSION >= 212
        mov     al, byte ptr es:[bx+si + 8]
        else
        mov     al, byte ptr [bx+si + 8]
        endif
        or      al, al
        js      br_0318a
        or      cx, cx
        jnz     loop_03167
br_0318a:
        cmp     al, 0f9h
        jnz     br_0319b
        if      FW_VERSION >= 212
        mov     word ptr es:[si + 6], bx
        dec     word ptr es:[si + 2]
        else
        mov     word ptr [si + 6], bx
        dec     word ptr [si + 2]
        endif
        xor     ax, ax
        jmp     br_031a0
        db      090h
br_0319b:
        mov     ax, word ptr [bp + 0ah]
        sub     ax, cx
br_031a0:
        pop     di
        pop     si
        if      FW_VERSION >= 212
        pop     es
tgt_031a3:
        else
br_05856:
        endif
        pop     bp
        retf
fn_031a5:
        mov     al, byte ptr es:[si]
        mov     dx, es
        inc     si
        jnz     br_031b3
        add     dx, 1000h
        mov     es, dx
br_031b3:
        if      FW_VERSION >= 212
        cmp     dx, word ptr [bx + 8]
        else
        cmp     dx, word ptr [W_A45A_V112]
        endif
        jc      br_031c7
        jnz     br_031bf
        if      FW_VERSION >= 212
        cmp     si, word ptr [bx + 6]
        else
        cmp     si, word ptr [W_A458_V112]
        endif
        jc      br_031c7
br_031bf:
        if      FW_VERSION >= 212
        mov     dx, word ptr [bx + 0ch]
        mov     es, dx
        mov     si, word ptr [bx + 0ah]
        else
        mov     dx, word ptr [W_A45E_V112]
        mov     es, dx
        mov     si, word ptr [W_A45C_V112]
        endif
br_031c7:
        ret
fn_031c8:
        if      FW_VERSION >= 212
        mov     dx, word ptr es:[si + 2]
        else
        mov     dx, word ptr [si + 2]
        endif
        or      dx, dx
        jz      br_031e4
        if      FW_VERSION >= 212
        mov     bx, word ptr es:[si + 6]
        else
        mov     bx, word ptr [si + 6]
        endif
        or      bx, bx
        jnz     br_031db
        if      FW_VERSION >= 212
        mov     bx, word ptr es:[si]
        else
        mov     bx, word ptr [si]
        endif
br_031db:
        dec     bx
        if      FW_VERSION >= 212
        mov     al, byte ptr es:[bx+si + 8]
        else
        mov     al, byte ptr [bx+si + 8]
        endif
        dec     dx
        xor     ah, ah
        ret
br_031e4:
        mov     ax, 0ffffh
        or      ax, ax
        ret
        if      FW_VERSION >= 212
far_031ea:
        else
        phase   2
L_052e2:
        endif
        push    bp
        mov     bp, sp
        push    si
        push    di
        endm
        if      FW_VERSION >= 212
        RUN_TGT_030CB
        mov     bx, word ptr [bp + 6]
        push    word ptr [bx + 14h]
        push    word ptr [bx + 12h]
        mov     di, word ptr [bp + 8]
        sub     cx, cx
        les     si, dword ptr [bx + 12h]
        call    fn_031a5
loop_03203:
        mov     word ptr [bx + 12h], si
        mov     word ptr [bx + 14h], dx
        mov     byte ptr [di], al
        inc     di
        inc     cx
        call    fn_031a5
        test    al, 80h
        jnz     br_03219
        cmp     cx, word ptr [bp + 0ah]
        jc      loop_03203
br_03219:
        pop     word ptr [bx + 12h]
        pop     word ptr [bx + 14h]
        mov     ax, cx
        pop     di
        pop     si
        pop     bp
        retf
        endif
fn_03225:
        callf   SEG_D894:far_d8a8b
        sti
        test    byte ptr [TBL_4C18], 1
        jz      br_03242
        mov     dx, 102h
        in      al, dx
        and     al, 1
        jz      br_03242
        mov     si, 0
        mov     ch, 1
        call    fn_032b9
br_03242:
        test    byte ptr [B_4C19], 1
        jz      br_03259
        mov     dx, 112h
        in      al, dx
        and     al, 1
        jz      br_03259
        mov     si, 2
        mov     ch, 2
        call    fn_032b9
br_03259:
        test    byte ptr [B_4C1A], 1
        jz      br_03270
        mov     dx, 122h
        in      al, dx
        and     al, 1
        jz      br_03270
        mov     si, 4
        mov     ch, 4
        call    fn_032b9
br_03270:
        test    byte ptr [B_4C1B], 1
        jz      br_0328b
        mov     dx, 132h
        in      al, dx
        test    al, 1
        jz      br_0328b
        test    al, 80h
        jz      br_0328b
        mov     si, 6
        mov     ch, 8
        call    fn_032b9
br_0328b:
        callf   SEG_EE16:far_ee177
        or      ax, ax
        jnz     br_0329b
        if      FW_VERSION < 212
        mov     dl, 1
        else
        mov     dl, 2
        endif
        callf   SEG_D894:far_d8deb
br_0329b:
        cli
        mov     ax, 0eh
        mov     dx, 0ff22h
        out     dx, ax
        callf   SEG_D894:far_d8aca
        iret
        if      FW_VERSION < 212
        db      06dh, 047h, 0a6h, 048h, 0dfh, 049h, 018h
        db      "KQLaLqL"
        db      081h, 04ch
fn_032b9:
        mov     bx, word ptr cs:[si + L_03631]
        elseif  FW_VERSION = 212
        db      02eh, 013h, 030h, 019h, 032h, 01fh
        db      "4%0H@HPH`H"
        else
        db      02eh, 013h, 030h, 019h, 032h, 01fh, 034h, 025h, 0b0h, 04bh, 0c0h, 04bh, 0d0h, 04bh, 0e0h, 04bh
        endif
        if      FW_VERSION >= 212
fn_032b9:
        mov     ax, DGROUP
        mov     es, ax
        mov     bx, word ptr cs:[si + 91h]
        endif
        callf   SEG_D894:far_d9069
        jns     br_032e1
        test    byte ptr [B_8B51], ch
        jz      br_032ee
        if      FW_VERSION >= 212
        mov     ax, SEG_15E8
        mov     es, ax
        endif
        mov     bx, word ptr cs:[si + 89h]
        callf   SEG_D894:far_d9069
        js      br_032e8
br_032e1:
        mov     al, cl
        sub     dx, 2
        out     dx, al
        ret
br_032e8:
        not     ch
        and     byte ptr [B_8B51], ch
br_032ee:
        shr     si, 1
        cli
        mov     al, byte ptr [si + TBL_4C18]
        and     al, 0feh
        mov     byte ptr [si + TBL_4C18], al
        out     dx, al
        sti
        ret
        if      FW_VERSION < 212
        phase   4
        else
        phase   0eh
        endif
far_032fe:
        callf   SEG_D894:far_d8a8b
        if      FW_VERSION < 212
        mov     ax, 58ah
        else
        mov     ax, DGROUP
        endif
        mov     ds, ax
        mov     es, ax
        inc     word ptr [W_536D]
        test    word ptr [W_536D], 1
        jz      br_03319
        jmp     br_039fe
br_03319:
        cmp     byte ptr [B_53AB], 0
        jnz     br_03323
        jmp     near br_033a4
br_03323:
        mov     bl, byte ptr [B_4E7A]
        cmp     bl, 6
        jz      br_0333b
        cmp     bl, 5
        jz      br_0333b
        cmp     byte ptr [B_53AC], 0
        jz      br_0333b
        jmp     br_033a4
        db      090h
br_0333b:
        mov     dx, 0ff58h
loop_0333e:
        mov     bx, word ptr [W_538F]
        mov     cx, word ptr [W_5391]
        in      ax, dx
        cmp     ax, 3
        jle     loop_0333e
        cmp     bx, word ptr [W_538F]
        jnz     loop_0333e
        add     bx, ax
        adc     cx, 0
        mov     word ptr [W_5379], bx
        mov     word ptr [W_537B], cx
        cmp     byte ptr [B_8CCA], 0
        jz      br_0336d
        dec     byte ptr [B_8CCA]
        jmp     br_033a4
        db      090h
br_0336d:
        sub     bx, word ptr [W_5375]
        sbb     cx, word ptr [W_5377]
        cmp     byte ptr [B_4E7A], 7
        jnz     br_03384
        cmp     cx, 4ch
        jnc     br_03389
        jmp     br_033a4
        db      090h
br_03384:
        cmp     cx, 4
        jc      br_033a4
br_03389:
        cmp     byte ptr [B_53AB], 0eh
        mov     byte ptr [B_53AB], 0
        jz      br_0339f
        callf   SEG_D3B2:far_d3c3d
        mov     byte ptr [B_54FA], 50h
br_0339f:
        mov     byte ptr [B_53C9], 0
br_033a4:
        add     word ptr [W_A04D], 1
        cmp     byte ptr [B_539B], 6
        jge     br_033e9
        cmp     byte ptr [B_53AB], 10h
        jnz     br_033e1
        cmp     byte ptr [B_53AC], 0
        jnz     br_033cd
        mov     byte ptr [B_53AC], 4
        add     word ptr [W_537D], 1
        adc     word ptr [W_537F], 0
br_033cd:
        test    word ptr [W_536D], 7fh
        jnz     br_033da
        mov     byte ptr [B_54FA], 50h
br_033da:
        dec     byte ptr [B_53AC]
        jmp     br_03571
br_033e1:
        mov     byte ptr [B_53AC], 0
        jmp     br_03571
br_033e9:
        add     word ptr [W_94CC], 1
        adc     word ptr [W_94CE], 0
        add     word ptr [W_94D0], 1
        adc     word ptr [W_94D2], 0
        if      FW_VERSION >= 212
        cmp     byte ptr [B_4E73], 0
        jz      br_03441
        endif
        mov     bx, word ptr [W_53BD]
        mov     cx, word ptr [W_53BF]
        mov     ax, word ptr [W_5361]
        shl     ax, 1
        add     bx, ax
        adc     cx, 0
        cmp     cx, word ptr [W_5387]
        jc      br_03436
        ja      br_03424
        cmp     bx, word ptr [W_5385]
        jc      br_03436
br_03424:
        add     word ptr [W_53C1], 1
        adc     word ptr [W_53C3], 0
        sub     bx, word ptr [W_5385]
        sbb     cx, word ptr [W_5387]
br_03436:
        mov     word ptr [W_53BD], bx
        mov     word ptr [W_53BF], cx
        if      FW_VERSION >= 212
        jmp     br_0348e
        db      090h
br_03441:
        mov     ax, word ptr [W_53BB]
        mov     bx, word ptr [W_53BD]
        mov     cx, word ptr [W_53BF]
        add     ax, word ptr [W_5369]
        adc     bx, word ptr [W_536B]
        adc     cx, 0
        cmp     cx, word ptr [W_538D]
        jc      br_03483
        ja      br_0346d
        cmp     bx, word ptr [W_538B]
        jc      br_03483
        ja      br_0346d
        cmp     ax, word ptr [TBL_5389]
        jc      br_03483
br_0346d:
        add     word ptr [W_53C1], 1
        adc     word ptr [W_53C3], 0
        sub     ax, word ptr [TBL_5389]
        sbb     bx, word ptr [W_538B]
        sbb     cx, word ptr [W_538D]
br_03483:
        mov     word ptr [W_53BB], ax
        mov     word ptr [W_53BD], bx
        mov     word ptr [W_53BF], cx
br_0348e:
        endif
        cmp     byte ptr [B_53AC], 0
        jnz     br_034ac
        mov     bl, byte ptr [B_4E7A]
        sub     bh, bh
        mov     al, byte ptr [bx + TBL_102B]
        mov     byte ptr [B_53AC], al
        add     word ptr [W_537D], 1
        adc     word ptr [W_537F], 0
br_034ac:
        dec     byte ptr [B_53AC]
        sub     word ptr [W_9F93], 1
        jz      br_034bf
        sbb     word ptr [W_9F95], 0
        jmp     near br_03571
br_034bf:
        cmp     word ptr [W_9F95], 0
        jz      br_034c9
        jmp     near br_03571
br_034c9:
        mov     bx, word ptr [W_9FA1]
        cmp     byte ptr [B_4C2E], 0
        jnz     br_034d7
        jmp     short br_03553
        db      090h
br_034d7:
        cmp     byte ptr [B_53AB], 0
        jz      br_034ef
        cmp     byte ptr [B_4E7A], 6
        jz      br_034ef
        cmp     byte ptr [B_4E7A], 5
        jz      br_034ef
        jmp     br_03553
        db      090h
br_034ef:
        mov     ax, word ptr [bx + 4]
        or      ax, ax
        jnz     br_0354b
        if      FW_VERSION < 212
        cmp     byte ptr [B_5759_V112], 0
        else
        cmp     byte ptr [B_A06E], 0
        endif
        jnz     br_03521
        test    byte ptr [B_94A7], 1
        jnz     br_03507
        jmp     br_03571
        db      090h
br_03507:
        mov     ax, word ptr [W_9D38]
        mov     word ptr [W_53A7], ax
        callf   SEG_E85C:far_e8607
        push    word ptr [W_94C6]
        push    word ptr [W_94C4]
        mov     bx, word ptr [W_9FA3]
        jmp     br_0355b
        db      090h
br_03521:
        mov     bl, byte ptr [B_A06A]
        sub     bh, bh
        if      FW_VERSION < 212
        test    byte ptr [bx +TBL_88A5_V112], 1
        else
        test    byte ptr [bx + TBL_7C25], 1
        endif
        jnz     br_03531
        jmp     br_03571
        db      090h
br_03531:
        mov     ax, word ptr [W_A07D]
        mov     word ptr [W_53A7], ax
        callf   SEG_E85C:far_e8607
        push    word ptr [W_A077]
        push    word ptr [W_A075]
        mov     bx, word ptr [W_9FA3]
        jmp     br_0355b
        db      090h
br_0354b:
        mov     word ptr [W_53A7], ax
        callf   SEG_E85C:far_e8607
br_03553:
        push    word ptr [bx + 2]
        push    word ptr [bx]
        add     bx, 6
br_0355b:
        mov     word ptr [W_9FA1], bx
        mov     ax, word ptr [bx]
        mov     dx, word ptr [bx + 2]
        pop     bx
        sub     ax, bx
        pop     bx
        sbb     dx, bx
        mov     word ptr [W_9F93], ax
        mov     word ptr [W_9F95], dx
br_03571:
        mov     ax, word ptr [W_5363]
        mov     dx, 0ff52h
        out     dx, ax
        sti
        mov     al, byte ptr [B_7E0F]
        and     al, 3fh
        mov     bl, byte ptr [B_539B]
        cmp     bl, 0
        jnz     br_0359e
        cmp     al, bl
        jnz     br_0358e
        jmp     br_036aa
br_0358e:
        if      FW_VERSION < 212
        mov     cx, word ptr [W_5207_V112]
        mov     word ptr [W_7E59], cx
        mov     cx, word ptr [W_5209_V112]
        else
        mov     cx, word ptr [W_94C8]
        mov     word ptr [W_7E59], cx
        mov     cx, word ptr [W_94CA]
        endif
        mov     word ptr [W_7E5B], cx
br_0359e:
        if      FW_VERSION < 212
        cmp     byte ptr [B_5759_V112], 0
        else
        cmp     byte ptr [B_A06E], 0
        endif
        jz      br_035de
        mov     cx, word ptr [W_94D0]
        cmp     cx, word ptr [W_A071]
        jnz     br_035db
        mov     cx, word ptr [W_94D2]
        cmp     cx, word ptr [W_A073]
        jnz     br_035db
        push    bx
        mov     bl, byte ptr [B_A06A]
        xor     bh, bh
        if      FW_VERSION < 212
        test    byte ptr [bx +TBL_88A5_V112], 1
        else
        test    byte ptr [bx + TBL_7C25], 1
        endif
        pop     bx
        jnz     br_035cb
        jmp     br_036a2
br_035cb:
        mov     cx, word ptr [W_A075]
        mov     word ptr [W_94D0], cx
        mov     cx, word ptr [W_A077]
        mov     word ptr [W_94D2], cx
br_035db:
        jmp     near br_03697
br_035de:
        mov     cx, word ptr [W_94D0]
        cmp     cx, word ptr [W_7E59]
        jnz     br_03621
        mov     cx, word ptr [W_94D2]
        cmp     cx, word ptr [W_7E5B]
        jnz     br_03621
        if      FW_VERSION < 212
        cmp     byte ptr [B_4CBF_V112], 0
        jz      br_03624
        else
        cmp     byte ptr [B_9D35], 0
        jle     br_03624
        endif
        mov     cx, word ptr [W_7E55]
        mov     word ptr [W_7E59], cx
        mov     cx, word ptr [W_7E57]
        mov     word ptr [W_7E5B], cx
        mov     word ptr [W_94D0], 0
        mov     word ptr [W_94D2], 0
        mov     word ptr [W_94CC], 0
        mov     word ptr [W_94CE], 0
br_03621:
        jmp     br_03697
        db      090h
br_03624:
        test    byte ptr [B_94A7], 1
        jz      br_0366e
        mov     cx, word ptr [W_94C4]
        mov     word ptr [W_94D0], cx
        mov     cx, word ptr [W_94C6]
        mov     word ptr [W_94D2], cx
        cmp     word ptr [W_94D8], 1
        jnz     br_03658
        cmp     al, 8
        jnz     br_03697
        mov     byte ptr [B_7E10], 10h
        mov     al, 0ah
        mov     byte ptr [B_7E0F], al
        callf   SEG_D3B2:far_d3e47
        jmp     br_03697
        db      090h
br_03658:
        cmp     al, 8
        jc      br_03697
        mov     byte ptr [B_7E10], 1
        mov     al, 6
        mov     byte ptr [B_7E0F], al
        callf   SEG_D3B2:far_d3e47
        jmp     br_03697
        db      090h
br_0366e:
        cmp     al, 8
        jnz     br_036a2
        cmp     word ptr [W_94D6], 3e7h
        jnc     br_036a2
        mov     cx, word ptr [W_94E4]
        if      FW_VERSION < 212
        add     word ptr [W_5207_V112], cx
        adc     word ptr [W_5209_V112], 0
        mov     cx, word ptr [W_5207_V112]
        mov     word ptr [W_7E59], cx
        mov     cx, word ptr [W_5209_V112]
        else
        add     word ptr [W_94C8], cx
        adc     word ptr [W_94CA], 0
        mov     cx, word ptr [W_94C8]
        mov     word ptr [W_7E59], cx
        mov     cx, word ptr [W_94CA]
        endif
        mov     word ptr [W_7E5B], cx
br_03697:
        cmp     al, 0
        jz      br_036a7
        cmp     byte ptr [B_8D78], 0
        jz      br_036aa
br_036a2:
        callf   SEG_D3B2:far_d3c3d
br_036a7:
        jmp     br_039ad
br_036aa:
        sub     bh, bh
        jmp     word ptr cs:[bx + TBL_036b1]
TBL_036b1:
        dw      tgt_03700
        dw      tgt_036bd
        dw      tgt_036e5
        dw      tgt_03828
        dw      tgt_038d4
        dw      tgt_03942
tgt_036bd:
        callf   SEG_EE16:far_ee161
        or      ax, ax
        jz      br_036ce
        if      FW_VERSION < 212
        callf   0dc95h:far_d8765
        else
        callf   SEG_D871:far_d8765
        endif
        jmp     br_036d8
        db      090h
br_036ce:
        cmp     byte ptr [B_7E0B], 0
        jz      br_036e2
        jmp     br_039d3
br_036d8:
        mov     byte ptr [B_7E0B], 0
        mov     dx, word ptr [W_0FBD]
        out     dx, al
br_036e2:
        jmp     br_0371b
        db      090h
tgt_036e5:
        cmp     al, 0
        ja      br_036f7
        mov     byte ptr [B_539B], 0
        mov     word ptr [W_A04F], 0
        jmp     br_039d3
br_036f7:
        dec     word ptr [W_A04F]
        jz      br_03764
        jmp     br_039d3
tgt_03700:
        cmp     al, 0
        jnz     br_03707
        jmp     br_039d3
br_03707:
        cmp     byte ptr [B_7E0B], 0
        jz      br_0371b
        if      FW_VERSION < 212
        callf   0dc95h:far_d8765
        else
        callf   SEG_D871:far_d8765
        endif
        mov     byte ptr [B_539B], 2
        jmp     br_039d3
br_0371b:
        cmp     byte ptr [B_8CD5], 0
        jz      br_03748
        cmp     al, 8
        jz      br_0372a
        cmp     al, 0ah
        jnz     br_03748
br_0372a:
        mov     bx, word ptr [W_94D0]
        cmp     bx, word ptr [W_5164]
        jnz     br_0373e
        mov     bx, word ptr [W_94D2]
        cmp     bx, word ptr [W_5166]
        jz      br_03748
br_0373e:
        mov     byte ptr [B_7E14], al
        mov     dl, 5
        callf   SEG_D894:far_d8cd0
br_03748:
        cmp     byte ptr [B_7E0A], 0
        jz      br_03764
        callf   SEG_EEFD:far_eefd9
        mov     byte ptr [B_539B], 4
        mov     bx, word ptr [W_94E4]
        mov     word ptr [W_A04F], bx
        jmp     br_039d3
br_03764:
        cmp     byte ptr [B_7E14], 0
        jz      br_03770
        mov     al, 6
        jmp     br_037b9
        db      090h
br_03770:
        mov     bx, word ptr [W_94D0]
        if      FW_VERSION < 212
        cmp     byte ptr [B_5759_V112], 0
        else
        cmp     byte ptr [B_A06E], 0
        endif
        jz      br_0378e
        cmp     bx, word ptr [W_A071]
        jnz     br_037a1
        mov     bx, word ptr [W_94D2]
        cmp     bx, word ptr [W_A073]
        jnz     br_037a1
        jmp     br_036a2
br_0378e:
        cmp     bx, word ptr [W_7E59]
        jnz     br_037a1
        mov     bx, word ptr [W_94D2]
        cmp     bx, word ptr [W_7E5B]
        jnz     br_037a1
        jmp     br_036a2
br_037a1:
        cmp     al, 8
        jz      br_037a9
        cmp     al, 0ah
        jnz     br_037b9
br_037a9:
        mov     bx, word ptr [W_94D0]
        mov     word ptr [W_516C], bx
        mov     bx, word ptr [W_94D2]
        mov     word ptr [W_516E], bx
br_037b9:
        mov     byte ptr [B_539B], al
        mov     ax, word ptr [W_94CC]
        mov     dx, word ptr [W_94CE]
        cmp     byte ptr [B_4E7A], 7
        jnz     br_037e2
        mov     bx, 60h
        div     bx
        mov     word ptr [W_537D], ax
        mov     word ptr [W_537F], dx
        add     word ptr [W_5381], ax
        adc     word ptr [W_5383], 0
        jmp     br_037ff
        db      090h
br_037e2:
        shr     dx, 1
        rcr     ax, 1
        shr     dx, 1
        rcr     ax, 1
        mov     word ptr [W_537D], ax
        mov     word ptr [W_537F], dx
        cmp     byte ptr [B_53AF], 0
        jz      br_037ff
        mov     word ptr [W_5381], ax
        mov     word ptr [W_5383], dx
br_037ff:
        mov     byte ptr [B_53AF], 0
        mov     ax, word ptr [W_94CC]
        shl     ax, 1
        mov     word ptr [W_536D], ax
        mov     byte ptr [B_53CA], 0
        mov     bl, byte ptr [B_4E7A]
        sub     bh, bh
        mov     al, byte ptr [bx + TBL_102B]
        dec     al
        mov     byte ptr [B_53AC], al
        mov     byte ptr [B_7E5E], 1
        jmp     br_039d3
tgt_03828:
        cmp     byte ptr [B_8CD5], 0
        jz      br_03882
        if      FW_VERSION < 212
        cmp     byte ptr [B_52B5_V112], 0
        else
        cmp     byte ptr [B_94A6], 0
        endif
        jnz     br_03882
        cmp     byte ptr [B_7E14], 0
        jz      br_03882
        mov     bx, word ptr [W_94D0]
        mov     dx, word ptr [W_94D2]
        add     bx, 1
        adc     dx, 0
        cmp     bx, word ptr [W_7E59]
        jnz     br_0385b
        cmp     dx, word ptr [W_7E5B]
        jnz     br_0385b
        sub     bx, bx
        sub     dx, dx
br_0385b:
        cmp     bx, word ptr [W_5164]
        jnz     br_03886
        cmp     dx, word ptr [W_5166]
        jnz     br_03886
        mov     byte ptr [B_7E14], 0
        mov     dx, word ptr [W_0FB1]
        cmp     al, 8
        jnz     br_03878
        mov     dx, word ptr [W_0FB5]
br_03878:
        mov     byte ptr [B_539B], al
        add     dx, 10h
        out     dx, al
        jmp     br_038be
        db      090h
br_03882:
        cmp     al, 6
        jnz     br_03889
br_03886:
        jmp     br_039d3
br_03889:
        cmp     al, 0
        jnz     br_03890
        jmp     br_039ad
br_03890:
        cmp     al, 8
        jnz     br_038a7
        cmp     byte ptr [B_8CD5], 0
        jz      br_038be
        mov     byte ptr [B_7E14], al
        mov     dl, 5
        callf   SEG_D894:far_d8cd0
        mov     al, 6
br_038a7:
        cmp     al, 0ah
        jnz     br_038ce
        cmp     byte ptr [B_8CD5], 0
        jz      br_038be
        mov     byte ptr [B_7E14], al
        mov     dl, 5
        callf   SEG_D894:far_d8cd0
        mov     al, 6
br_038be:
        mov     bx, word ptr [W_94D0]
        mov     word ptr [W_516C], bx
        mov     bx, word ptr [W_94D2]
        mov     word ptr [W_516E], bx
br_038ce:
        mov     byte ptr [B_539B], al
        jmp     br_039d3
tgt_038d4:
        cmp     byte ptr [B_8CD5], 0
        jz      br_0391a
        mov     bx, word ptr [W_94D0]
        mov     dx, word ptr [W_94D2]
        add     bx, 1
        adc     dx, 0
        cmp     bx, word ptr [W_7E59]
        jnz     br_038f9
        cmp     dx, word ptr [W_7E5B]
        jnz     br_038f9
        sub     bx, bx
        sub     dx, dx
br_038f9:
        cmp     bx, word ptr [W_5168]
        jnz     br_0391a
        cmp     dx, word ptr [W_516A]
        jnz     br_0391a
        mov     al, 6
        mov     byte ptr [B_539B], al
        mov     byte ptr [B_7E0F], al
        mov     byte ptr [B_7E10], 1
        mov     dx, word ptr [W_0FB5]
        out     dx, al
        jmp     br_03928
        db      090h
br_0391a:
        cmp     al, 8
        jnz     br_03921
        jmp     near br_039d3
br_03921:
        cmp     al, 0
        jnz     br_03928
        jmp     near br_039ad
br_03928:
        cmp     al, 6
        jnz     br_0393c
        mov     bx, word ptr [W_94D0]
        mov     word ptr [W_5170], bx
        mov     bx, word ptr [W_94D2]
        mov     word ptr [W_5172], bx
br_0393c:
        mov     byte ptr [B_539B], al
        jmp     near br_039d3
tgt_03942:
        cmp     al, 0ah
        jnz     br_0398c
        cmp     byte ptr [B_8CD5], 0
        jz      br_039aa
        mov     bx, word ptr [W_94D0]
        mov     dx, word ptr [W_94D2]
        add     bx, 1
        adc     dx, 0
        cmp     bx, word ptr [W_7E59]
        jnz     br_0396b
        cmp     dx, word ptr [W_7E5B]
        jnz     br_0396b
        sub     bx, bx
        sub     dx, dx
br_0396b:
        cmp     bx, word ptr [W_5168]
        jnz     br_039aa
        cmp     dx, word ptr [W_516A]
        jnz     br_039aa
        mov     al, 6
        mov     byte ptr [B_539B], al
        mov     byte ptr [B_7E0F], al
        mov     byte ptr [B_7E10], 1
        mov     dx, word ptr [W_0FB1]
        out     dx, al
        jmp     br_039a7
        db      090h
br_0398c:
        cmp     al, 0
        jnz     br_03993
        jmp     br_039ad
        db      090h
br_03993:
        cmp     al, 6
        jnz     br_039a7
        mov     bx, word ptr [W_94D0]
        mov     word ptr [W_5170], bx
        mov     bx, word ptr [W_94D2]
        mov     word ptr [W_5172], bx
br_039a7:
        mov     byte ptr [B_539B], al
br_039aa:
        jmp     br_039d3
        db      090h
br_039ad:
        cmp     byte ptr [B_539B], 8
        jl      br_039c4
        mov     bx, word ptr [W_94D0]
        mov     word ptr [W_5170], bx
        mov     bx, word ptr [W_94D2]
        mov     word ptr [W_5172], bx
br_039c4:
        mov     byte ptr [B_7E0F], 0
        mov     byte ptr [B_539B], 0
        mov     byte ptr [B_7E14], 0
br_039d3:
        mov     ax, word ptr [W_94D0]
        mov     word ptr [W_539F], ax
        mov     ax, word ptr [W_94D2]
        mov     word ptr [W_53A1], ax
        mov     dl, 2
        callf   SEG_D894:far_d8deb
        mov     bx, B_539B
        xor     cx, cx
        if      FW_VERSION < 212
        callf   SEG_D894:far_d8cee+1a0h
        else
        callf   SEG_D894:far_d8cee
        endif
        jz      br_039fe
        cmp     byte ptr [B_539B], 0
        jz      br_039fe
        or      byte ptr [B_8D78], 1
br_039fe:
        cli
        mov     al, byte ptr [B_4C1A]
        or      al, 20h
        cmp     byte ptr [B_539B], 6
        jc      br_03a20
        mov     cx, 1
        test    byte ptr [B_4E79], 1
        jnz     br_03a18
        mov     cx, 4
br_03a18:
        test    word ptr [W_536D], cx
        jnz     br_03a20
        and     al, 0dfh
br_03a20:
        mov     dx, 122h
        out     dx, al
        mov     byte ptr [B_4C1A], al
        test    word ptr [W_536D], 7
        jnz     br_03a51
        cmp     byte ptr [B_53CA], 0
        jnz     br_03a51
        cmp     byte ptr [B_53CB], 0
        jle     br_03a44
        dec     byte ptr [B_53CB]
        jmp     br_03a51
        db      090h
br_03a44:
        mov     cl, 0f8h
        mov     bl, byte ptr [B_4E78]
        xor     bh, bh
        callf SEG_0519:far_05204
br_03a51:
        mov     dx, 0ff22h
        mov     ax, 8
        out     dx, ax
        callf   SEG_D894:far_d8aca
        iret
        if      FW_VERSION < 212
        phase   0dh
        else
        phase   0eh
        endif
fn_03a5e:
        callf   SEG_D894:far_d8a8b
        if      FW_VERSION < 212
        mov     ax, 58ah
        else
        mov     ax, DGROUP
        endif
        mov     ds, ax
        test    byte ptr [B_8CCC], 0ffh
        jz      br_03a72
        jmp     br_03c49
br_03a72:
        mov     bl, byte ptr [B_4E7A]
        sub     bh, bh
        shl     bx, 1
        if      FW_VERSION < 212
        jmp     word ptr cs:[word bx + 2eh]
L_03fbe:
        add     al, byte ptr [bp+si]
        add     byte ptr ds:[B_01ED+7], bh
        add     al, byte ptr [bp+si]
        add     al, byte ptr [bp+si]
        add     bh, byte ptr [B_35A9+9]
        add.d0  ah, al
        push    ds
        push    es
        pusha
        mov     word ptr [W_5371], bx
        mov     word ptr [W_5373], es
        mov     dx, 0ff58h
L_03fdd:
        mov     bx, word ptr [W_538F]
        mov     cx, word ptr [W_5391]
        in      ax, dx
        cmp     ax, 3
        jle     L_03fdd
        cmp     bx, word ptr [W_538F]
        jnz     L_03fdd
        add     bx, ax
        adc     cx, 0
        mov     word ptr [W_5375], bx
        mov     word ptr [W_5377], cx
        mov     bl, byte ptr [B_53AB]
        xor     bh, bh
        endif
        jmp     word ptr cs:[word bx + TBL_03a7f]
TBL_03a7f:
        if      FW_VERSION < 212
        dw      tgt_03ae0
        dw      fn_03b40
        dw      fn_03bc1
        dw      tgt_03bcf
        dw      br_03c65
        dw      br_03c65
        dw      tgt_03bf4
        dw      br_03c65
        dw      br_03c65
        dw      br_03c65
        dw      br_03c65
tgt_03ae0:
        cmp     byte ptr [B_52B5_V112], 0
        else
        db      021h, 002h, 03fh, 000h, 03fh, 000h, 021h, 002h, 021h, 002h, 021h, 002h, 03fh, 000h, 03fh, 000h
        endif
        if      FW_VERSION = 212
        db      0c4h, 01eh, 0f5h, 04fh, 089h, 01eh, 0f1h, 04fh, 08ch, 006h, 0f3h, 04fh, 0bah, 058h, 0ffh, 08bh
        db      01eh, 00fh, 050h, 08bh, 00eh, 011h, 050h, 0edh, 03dh, 003h, 000h, 07eh, 0f2h, 03bh, 01eh, 00fh
        db      050h, 075h, 0ech, 003h, 0d8h, 083h, 0d1h, 000h, 089h, 01eh, 0f5h, 04fh, 089h, 00eh, 0f7h, 04fh
        db      08ah, 01eh, 02bh, 050h, 032h, 0ffh, 02eh, 0ffh, 0a7h, 07ah, 000h, 090h, 000h, 0f0h, 000h, 071h
        endif
        if      FW_VERSION >= 214
        db      0c4h, 01eh, 075h, 053h, 089h, 01eh, 071h, 053h, 08ch, 006h, 073h, 053h, 0bah, 058h, 0ffh, 08bh
        db      01eh, 08fh, 053h, 08bh, 00eh, 091h, 053h, 0edh, 03dh, 003h, 000h, 07eh, 0f2h, 03bh, 01eh, 08fh
        db      053h, 075h, 0ech, 003h, 0d8h, 083h, 0d1h, 000h, 089h, 01eh, 075h, 053h, 089h, 00eh, 077h, 053h
        db      08ah, 01eh, 0abh, 053h, 032h, 0ffh, 02eh, 0ffh, 0a7h, 07ah, 000h, 090h, 000h, 0f0h, 000h, 071h
        endif
        if      FW_VERSION >= 212
        db      001h, 07fh, 001h, 015h, 002h, 015h, 002h, 0a4h, 001h, 015h, 002h, 015h, 002h, 015h, 002h, 015h
        db      002h
        phase   7f0h
tgt_03ae0:
        cmp     byte ptr [B_94A6], 0
        endif
        jge     br_03aef
        mov     byte ptr [B_53AB], 0eh
        jmp     br_03c65
br_03aef:
        test    byte ptr [B_7E10], 15h
        jz      br_03afe
        mov     byte ptr [B_53AB], 0eh
        jmp     br_03c65
br_03afe:
        sub     ax, ax
        mov     word ptr [W_5381], ax
        mov     word ptr [W_5383], ax
        mov     word ptr [W_53AD], ax
        mov     byte ptr [B_7E0A], al
        mov     dx, word ptr [W_0FAB]
        out     dx, al
        mov     byte ptr [B_7E0B], al
        mov     dx, word ptr [W_0FBD]
        out     dx, al
        cmp     byte ptr [B_4E7A], 6
        jnz     br_03b2d
        if      FW_VERSION < 212
        mov     dx, 180h
        in      al, dx
        test    al, 40h
        jz      L_0406c
        mov     byte ptr [B_4C1F], 3
L_0406c:
        endif
        mov     byte ptr [B_7E5F], 0fh
        mov     byte ptr [B_53AB], 2
        jmp     br_03c65
br_03b2d:
        mov     word ptr [W_53AD], 1
        mov     byte ptr [B_53AB], 0ah
        callf   SEG_D3B2:far_d3c4b
        jmp     br_03c65
fn_03b40:
        dec     byte ptr [B_7E5F]
        jle     br_03b49
        jmp     br_03c65
br_03b49:
        mov     ax, word ptr [W_5375]
        mov     dx, word ptr [W_5377]
        sub     ax, word ptr [W_5371]
        sbb     dx, word ptr [W_5373]
        jnz     br_03b67
        cmp     ax, 0c350h
        ja      br_03b67
        mov     byte ptr [B_53AB], 0eh
        jmp     br_03c65
br_03b67:
        call    fn_03c86
        jnc     br_03b8f
        mov     byte ptr [B_53AB], 4
        if      FW_VERSION < 212
        mov     word ptr [W_5381], 1
        callf   SEG_D3B2:far_d3c4b
        jmp     near br_03c65
br_03b8f:
        mov     si, 602eh
        else
        mov     ax, word ptr [W_9F9D]
        mov     word ptr [W_5381], ax
        mov     ax, word ptr [W_9F9F]
        mov     word ptr [W_5383], ax
        add     word ptr [W_5381], 1
        adc     word ptr [W_5383], 0
        callf   SEG_D3B2:far_d3c4b
        jmp     br_03c65
br_03b8f:
        mov     si, A_53B2
        endif
        callf   SEG_D43A:far_d43b3
        add     ax, 1
        adc     dx, 0
        if      FW_VERSION < 212
        sub     ax, word ptr [W_51FA_V112]
        sbb     dx, word ptr [W_51FC_V112]
        endif
        mov     word ptr [W_5381], ax
        mov     word ptr [W_5383], dx
        mov     word ptr [W_53AD], 1
        mov     byte ptr [B_53AB], 0ah
        mov     byte ptr [B_8CCA], 0c8h
        mov     cl, 40h
        mov     bx, A_4BF0
        if      FW_VERSION < 212
        callf   SEG_EF1E:far_ef210
        else
        callf   SEG_EF1E:far_ef1e0
        endif
        jmp     near br_03c65
fn_03bc1:
        call    fn_03c86
        jc      br_03be4
        mov     word ptr [W_53AD], 1
        if      FW_VERSION < 212
        jmp     br_03c65
        db      090h
        else
        jmp     near br_03c65
        endif
tgt_03bcf:
        call    fn_03c86
        jc      br_03be4
        mov     word ptr [W_53AD], 1
        mov     byte ptr [B_53AB], 8
        callf   SEG_D3B2:far_d3c52
br_03be4:
        test    word ptr [W_538F], 36h
        jnz     br_03bf1
        mov     byte ptr [B_54FA], 50h
br_03bf1:
        jmp     br_03c65
        db      090h
tgt_03bf4:
        cmp     byte ptr [B_4E7A], 6
        if      FW_VERSION < 212
        jnz     L_04162
        else
        jnz     br_03c1e
        endif
        mov     ax, word ptr [W_5375]
        mov     dx, word ptr [W_5377]
        sub     ax, word ptr [W_5371]
        sbb     dx, word ptr [W_5373]
        if      FW_VERSION < 212
        jnz     L_04162
        cmp     ax, 0c350h
        ja      L_04162
        else
        jnz     br_03c1e
        cmp     ax, 0c350h
        ja      br_03c1e
        endif
        mov     byte ptr [B_53AB], 0eh
        callf   SEG_D3B2:far_d3c3d
        jmp     br_03c65
        db      090h
        if      FW_VERSION < 212
L_04162:
        else
br_03c1e:
        sub     cx, cx
        mov     bl, byte ptr [B_4C1F]
        sub     bh, bh
        shl     bx, 2
br_03c29:
        sub     ax, word ptr [bx + TBL_1033]
        sbb     dx, word ptr [bx + TBL_1035]
        jle     br_03c36
        inc     cx
        jmp     br_03c29
br_03c36:
        jcxz    br_03c41
        add     word ptr [W_5381], cx
        adc     word ptr [W_5383], 0
br_03c41:
        endif
        callf   SEG_04AE:far_04aea
        jmp     br_03c65
        db      090h
        if      FW_VERSION >= 212
        phase   1f9h
        endif
br_03c49:
        sti
        mov     dl, 3
        callf   SEG_D894:far_d8cd0
        if      FW_VERSION < 212
        jz      br_03c65
        else
        jz      br_03c65-760h
        endif
        or      byte ptr [B_8D78], 2
        mov     dx, 0ff28h
        in      ax, dx
        or      ax, 80h
        out     dx, ax
        mov     byte ptr [B_54FA], 50h
        if      FW_VERSION >= 212
        phase   975h
        endif
br_03c65:
        mov     ax, word ptr [W_53AD]
        add     word ptr [W_5381], ax
        adc     word ptr [W_5383], 0
        mov     dx, 180h
        in      al, dx
        mov     dx, 180h
        out     dx, al
        mov     ax, 0fh
        mov     dx, 0ff22h
        out     dx, ax
        callf   SEG_D894:far_d8aca
        iret
fn_03c86:
        mov     dx, 180h
        in      al, dx
        mov     dx, 300fh
        mov     ah, al
        and     ax, dx
        shr     ah, 4
        aad
        mov     byte ptr [B_53B3], al
        mov     dx, 182h
        in      al, dx
        mov     dx, 700fh
        mov     ah, al
        and     ax, dx
        shr     ah, 4
        aad
        mov     byte ptr [B_53B4], al
        mov     dx, 184h
        in      al, dx
        mov     dx, 700fh
        mov     ah, al
        and     ax, dx
        shr     ah, 4
        aad
        mov     byte ptr [B_53B5], al
        mov     dx, 186h
        in      al, dx
        mov     dx, 700fh
        mov     ah, al
        and     ax, dx
        shr     ah, 4
        aad
        mov     byte ptr [B_53B6], al
        if      FW_VERSION < 212
        RUN_BR_E82A3
        phase   3
        else
        cmp     al, byte ptr [B_9FAB]
        jnz     br_03cf1
        mov     al, byte ptr [B_53B5]
        cmp     al, byte ptr [B_9FAA]
        jnz     br_03cf1
        mov     al, byte ptr [B_53B4]
        cmp     al, byte ptr [B_9FA9]
        jnz     br_03cf1
        mov     al, byte ptr [B_53B3]
        cmp     al, byte ptr [B_9FA8]
br_03cf1:
        ret
        phase   2
        RUN_FAR_03CF2
        mov     ax, dx
        out     0, ax
        mov     ax, 70h
        add     ax, si
        out     2, ax
        pop     bx
        mov     ax, bx
        out     0, ax
        mov     ax, 60h
        add     ax, si
        out     2, ax
        sub     bx, bx
        RUN_L_0375F
        phase   1
        endif
far_03ec1:
        push    bp
        mov     bp, sp
        cmp     word ptr [W_A059], 0
        jz      br_03ef1
        mov     ax, word ptr [W_A059]
        shl     ax, 1
        shr     al, 1
        sub     sp, 6
        mov     bx, sp
        mov     byte ptr [bx], 88h
        mov     word ptr [bx + 1], ax
        mov     word ptr [W_A059], 0
        push    3
        push    bx
        push    word ptr [bp + 6]
        callf   SEG_05BE:far_05bef
        add     sp, 0ch
br_03ef1:
        pop     bp
        retf
        if      FW_VERSION < 212
        phase   5
L_04245:
        else
        phase   3
far_03ef3:
        endif
        push    si
        push    di
        mov     di, word ptr [B_8CDA]
        and     di, 0ffh
        jnz     br_03f02
        jmp     br_0445c
br_03f02:
        mov     byte ptr [B_8CDA], 0
        test    di, 1
        jnz     br_03f10
        if      FW_VERSION < 212
        jmp     near br_04000
        else
        jmp     br_04000
        endif
br_03f10:
        mov     ax, word ptr [W_8CDC]
        mov     dx, word ptr [W_8CDE]
        mov     word ptr [W_0AAE], ax
        mov     word ptr [W_0AB0], dx
        mov     word ptr [W_8CDC], 0
        mov     word ptr [W_8CDE], 0
        mov     byte ptr [B_0ABC], 1
        mov     word ptr [W_0AB2], 1
        mov     word ptr [W_0AB4], 0
        mov     si, 0
        if      FW_VERSION < 212
L_04290:
        else
br_03f3e:
        endif
        mov     ax, word ptr [W_0AAE]
        mov     dx, word ptr [W_0AB0]
        test    word ptr [W_0AB4], dx
        jnz     br_03f4f
        test    word ptr [W_0AB2], ax
br_03f4f:
        if      FW_VERSION < 212
        jz      br_03fe2
        else
        jnz     br_03f54
        jmp     near br_03fe2
br_03f54:
        endif
        mov     ax, si
        mov     byte ptr [B_0ABD], al
        cmp     byte ptr [B_52AD], 0
        jz      br_03f67
        if      FW_VERSION < 212
        mov     al, byte ptr [si +TBL_5212_V112]
        else
        mov     al, byte ptr [si + TBL_9FAC]
        endif
        jmp     br_03f6b
        db      090h
br_03f67:
        mov     al, byte ptr [si + TBL_5176]
br_03f6b:
        mov     byte ptr [B_0ABE], al
        if      FW_VERSION < 212
        mov     ax, word ptr [B_501C]
        endif
        mov     cx, 9
        mov     bx, A_0AB6
        call    fn_044b1
        if      FW_VERSION >= 212
        cmp     byte ptr [B_52AD], 0
        jz      br_03fe2
        cmp     byte ptr [B_7E11], 8
        jc      br_03fe2
        cmp     byte ptr [B_52AF], 0
        jz      br_03fe2
        cmp     byte ptr [B_8C07], 0
        jz      br_03fe2
        test    byte ptr [B_4E88], 1
        jz      br_03fe2
        mov     al, byte ptr [B_0ABE]
        test    al, al
        jz      br_03fb5
        cmp     al, 7fh
        jz      br_03fb5
        mov     cl, byte ptr [B_8BE0]
        sub     cl, al
        jns     br_03faf
        neg     cl
br_03faf:
        cmp     cl, byte ptr [B_4F11]
        jl      br_03fe2
br_03fb5:
        mov     byte ptr [B_8BE0], al
        mov     al, byte ptr [B_9D37]
        mov     byte ptr [B_0AB6+1], al
        mov     cx, 9
        mov     ax, A_0AB6
        mov     bx, B_94A6
        push    cx
        push    ax
        push    bx
        callf   SEG_05A0:far_05a01
        add     sp, 6
        mov     byte ptr [B_0AB6+1], 0
        mov     bl, byte ptr [B_9D37]
        sub     bh, bh
        or      byte ptr [bx + TBL_954C], 2
        endif
br_03fe2:
        mov     dx, word ptr [W_0AB4]
        mov     ax, word ptr [W_0AB2]
        shl     ax, 1
        rcl     dx, 1
        mov     word ptr [W_0AB4], dx
        mov     word ptr [W_0AB2], ax
        inc     si
        cmp     si, 20h
        if      FW_VERSION < 212
        jl      L_04290
        else
        jl      br_03ffd
        jmp     br_04000
        db      090h
br_03ffd:
        jmp     near br_03f3e
        endif
br_04000:
        test    di, 2
        jnz     br_04009
        if      FW_VERSION < 212
        jmp     near br_040f9
        else
        jmp     br_040f9
        endif
br_04009:
        mov     ax, word ptr [W_8CE0]
        mov     dx, word ptr [W_8CE2]
        mov     word ptr [W_0AAE], ax
        mov     word ptr [W_0AB0], dx
        mov     word ptr [W_8CE0], 0
        mov     word ptr [W_8CE2], 0
        mov     byte ptr [B_0ABC], 2
        if      FW_VERSION < 212
        mov     word ptr [W_0AB2], 1
        mov     word ptr [W_0AB4], 0
        mov     si, 0
L_04318:
        mov     ax, word ptr [W_0AAE]
        mov     dx, word ptr [W_0AB0]
        test    word ptr [W_0AB4], dx
        else
        mov     word ptr [W_0AB2], 1
        mov     word ptr [W_0AB4], 0
        mov     si, 0
br_04037:
        mov     ax, word ptr [W_0AAE]
        mov     dx, word ptr [W_0AB0]
        test    word ptr [W_0AB4], dx
        endif
        jnz     br_0404d
        test    word ptr [W_0AB2], ax
        if      FW_VERSION < 212
br_0404d:
        jz      br_040db
        mov     ax, si
        mov     byte ptr [B_0ABD], al
        else
        jnz     br_0404d
        jmp     near br_040db
br_0404d:
        mov     ax, si
        mov     byte ptr [B_0ABD], al
        endif
        cmp     byte ptr [B_52AD], 0
        jz      br_04060
        if      FW_VERSION < 212
        mov     al, byte ptr [si +TBL_5232_V112]
        else
        mov     al, byte ptr [si + TBL_9FCC]
        endif
        jmp     br_04064
        db      090h
br_04060:
        mov     al, byte ptr [si + TBL_5196]
br_04064:
        mov     byte ptr [B_0ABE], al
        if      FW_VERSION < 212
        mov     ax, word ptr [B_501C]
        mov     cx, 9
        mov     bx, A_0AB6
        call    fn_044b1
        else
        mov     cx, 9
        mov     bx, A_0AB6
        call    fn_044b1
        cmp     byte ptr [B_52AD], 0
        jz      br_040db
        cmp     byte ptr [B_7E11], 8
        jc      br_040db
        cmp     byte ptr [B_52AF], 0
        jz      br_040db
        cmp     byte ptr [B_8C07], 0
        jz      br_040db
        test    byte ptr [B_4E89], 1
        jz      br_040db
        mov     al, byte ptr [B_0ABE]
        test    al, al
        jz      br_040ae
        cmp     al, 7fh
        jz      br_040ae
        mov     cl, byte ptr [B_8BE1]
        sub     cl, al
        jns     br_040a8
        neg     cl
br_040a8:
        cmp     cl, byte ptr [B_4F12]
        jl      br_040db
br_040ae:
        mov     byte ptr [B_8BE1], al
        mov     al, byte ptr [B_9D37]
        mov     byte ptr [B_0AB6+1], al
        mov     cx, 9
        mov     ax, A_0AB6
        mov     bx, B_94A6
        push    cx
        push    ax
        push    bx
        callf   SEG_05A0:far_05a01
        add     sp, 6
        mov     byte ptr [B_0AB6+1], 0
        mov     bl, byte ptr [B_9D37]
        sub     bh, bh
        or      byte ptr [bx + TBL_954C], 2
        endif
br_040db:

RUN_AFTER_BR_040DB macro   {GLOBALSYMBOLS}
        mov     ax, word ptr [W_0AB2]
        mov     dx, word ptr [W_0AB4]
        shl     ax, 1
        rcl     dx, 1
        mov     word ptr [W_0AB2], ax
        mov     word ptr [W_0AB4], dx
        inc     si
        cmp     si, 20h
        endm
        if      FW_VERSION < 212
        RUN_AFTER_BR_040DB
        jl      L_04318
        else

        mov     ax, word ptr [W_0AB2]
        mov     dx, word ptr [W_0AB4]
        shl     ax, 1
        rcl     dx, 1
        mov     word ptr [W_0AB2], ax
        mov     word ptr [W_0AB4], dx
        inc     si
        cmp     si, 20h
        jl      br_040f6
        jmp     br_040f9
        db      090h
br_040f6:
        jmp     near br_04037
        endif
br_040f9:
        test    di, 4
        jnz     br_04102
        if      FW_VERSION < 212
        jmp     near br_041ef
        else
        jmp     br_041ef
        endif
br_04102:
        mov     ax, word ptr [W_8CE4]
        mov     dx, word ptr [W_8CE6]
        mov     word ptr [W_0AAE], ax
        mov     word ptr [W_0AB0], dx
        mov     word ptr [W_8CE4], 0
        mov     word ptr [W_8CE6], 0
        mov     byte ptr [B_0ABC], 3
        mov     word ptr [W_0AB2], 1
        mov     word ptr [W_0AB4], 0
        mov     si, 0
br_04130:
        mov     ax, word ptr [W_0AAE]
        mov     dx, word ptr [W_0AB0]
        test    word ptr [W_0AB4], dx
        jnz     br_04141
        test    word ptr [W_0AB2], ax
br_04141:
        if      FW_VERSION < 212
        jz      br_041d4
        mov     ax, si
        mov     byte ptr [B_0ABD], al
        else
        jnz     br_04146
        jmp     near br_041d4
br_04146:
        mov     ax, si
        mov     byte ptr [B_0ABD], al
        endif
        cmp     byte ptr [B_52AE], 0
        jz      br_04159
        if      FW_VERSION < 212
        mov     al, byte ptr [si +TBL_5252_V112]
        else
        mov     al, byte ptr [si + TBL_9FEC]
        endif
        jmp     br_0415d
        db      090h
br_04159:
        mov     al, byte ptr [si + TBL_51B6]
br_0415d:
        mov     byte ptr [B_0ABE], al
        if      FW_VERSION < 212
        mov     ax, word ptr [B_501C]
        mov     cx, 9
        mov     bx, A_0AB6
        call    fn_044b1
        else
        mov     cx, 9
        mov     bx, A_0AB6
        call    fn_044b1
        cmp     byte ptr [B_52AE], 0
        jz      br_041d4
        cmp     byte ptr [B_7E11], 8
        jc      br_041d4
        cmp     byte ptr [B_52B0], 0
        jz      br_041d4
        cmp     byte ptr [B_8C07], 0
        jz      br_041d4
        test    byte ptr [B_4E8A], 1
        jz      br_041d4
        mov     al, byte ptr [B_0ABE]
        test    al, al
        jz      br_041a7
        cmp     al, 7fh
        jz      br_041a7
        mov     cl, byte ptr [B_8BE2]
        sub     cl, al
        jns     br_041a1
        neg     cl
br_041a1:
        cmp     cl, byte ptr [B_4F13]
        jl      br_041d4
br_041a7:
        mov     byte ptr [B_8BE2], al
        mov     al, byte ptr [B_9D37]
        mov     byte ptr [B_0AB6+1], al
        mov     cx, 9
        mov     ax, A_0AB6
        mov     bx, B_94A6
        push    cx
        push    ax
        push    bx
        callf   SEG_05A0:far_05a01
        add     sp, 6
        mov     byte ptr [B_0AB6+1], 0
        mov     bl, byte ptr [B_9D37]
        sub     bh, bh
        or      byte ptr [bx + TBL_954C], 2
        endif
br_041d4:
        if      FW_VERSION < 212
        mov     ax, word ptr [W_0AB2]
        mov     dx, word ptr [W_0AB4]
        shl     ax, 1
        rcl     dx, 1
        mov     word ptr [W_0AB2], ax
        mov     word ptr [W_0AB4], dx
        inc     si
        cmp     si, 20h
        jl      br_04130
        else
        RUN_AFTER_BR_040DB
        jge     br_041ef
        jmp     near br_04130
        endif
br_041ef:
        test    di, 8
        jnz     br_041f8
        jmp     near br_0427c
br_041f8:
        mov     ax, word ptr [W_8CE8]
        mov     dx, word ptr [W_8CEA]
        mov     word ptr [W_0AAE], ax
        mov     word ptr [W_0AB0], dx
        mov     word ptr [W_8CE8], 0
        mov     word ptr [W_8CEA], 0
        mov     byte ptr [B_0ABC], 4
        mov     word ptr [W_0AB2], 1
        mov     word ptr [W_0AB4], 0
        mov     si, 0
loop_04226:
        mov     ax, word ptr [W_0AAE]
        mov     dx, word ptr [W_0AB0]
        test    word ptr [W_0AB4], dx
        jnz     br_04237
        test    word ptr [W_0AB2], ax
br_04237:
        jz      br_04264
        mov     ax, si
        mov     byte ptr [B_0ABD], al
        mov     bx, si
        shl     bx, 1
        cmp     byte ptr [B_5216], 0
        jz      br_04250
        if      FW_VERSION < 212
        mov     ax, word ptr [bx +TBL_5272_V112]
        else
        mov     ax, word ptr [bx + TBL_A00C]
        endif
        jmp     br_04254
        db      090h
br_04250:
        mov     ax, word ptr [bx + TBL_51D6]
br_04254:
        shl     ax, 1
        shr     al, 1
        mov     word ptr [B_0ABE], ax
        if      FW_VERSION < 212
        mov     ax, word ptr [B_501C]
        endif
        mov     cx, 0ah
        mov     bx, A_0AB6
        call    fn_044b1
br_04264:
        mov     dx, word ptr [W_0AB4]
        mov     ax, word ptr [W_0AB2]
        shl     ax, 1
        rcl     dx, 1
        mov     word ptr [W_0AB4], dx
        mov     word ptr [W_0AB2], ax
        inc     si
        cmp     si, 20h
        jl      loop_04226
br_0427c:
        test    di, 10h
        jz      br_042a4
        if      FW_VERSION < 212
        mov     cx, 10h
loop_04285:
        else
        mov     cx, 40h
loop_04285:
        push    cx
        endif
        mov     al, cl
        dec     al
        mov     ah, 0ffh
        if      FW_VERSION < 212
        push    cx
        endif
        push    ax
        push    4
        if      FW_VERSION < 212
        push    word 0acdh
        callf   52eh:L_052e2
        else
        push    word 0ac1h
        callf   SEG_05A3:far_05a35
        endif
        add     sp, 6
        pop     cx
        if      FW_VERSION >= 212
        mov     bx, cx
        mov     byte ptr [bx + TBL_7E15], 0
        endif
        loop    loop_04285
br_042a4:
        test    di, 20h
        jz      br_042d3
        sub     sp, 4
        mov     bx, sp
        mov     byte ptr [bx], 0f2h
        mov     ax, word ptr [W_5509]
        shl     ax, 1
        shr     al, 1
        and     ah, 7fh
        mov     word ptr [bx + 1], ax
        push    word ptr [B_4E78]
        push    3
        push    bx
        callf SEG_0519:far_051d6
        add     sp, 0ah
        mov     byte ptr [B_8BDD], 0
br_042d3:
        test    di, 40h
        jz      br_042f0
        if      FW_VERSION < 212
        mov     bl, byte ptr [B_9D36]
        sub     bh, bh
        shl     bx, 1
        mov     dx, word ptr [bx +TBL_512E_V112]
        endif
        mov     si, TBL_8C49
        mov     bx, 7fh
        call    fn_04470
        mov     si, TBL_8C09
        mov     bx, 1fh
        call    fn_04470
        if      FW_VERSION < 212
        mov     byte ptr [B_8FC9_V112], 0
        else
        mov     byte ptr [B_8CC9], 0
        endif
br_042f0:
        test    di, 80h
        jnz     br_042f9
        jmp     br_0445c
br_042f9:
        xor     si, si
        sub     ch, ch
        mov     cl, byte ptr [B_8CDB]
        mov     di, cx
        mov     byte ptr [B_8CDB], 0
        if      FW_VERSION >= 212
        push    es
        test    di, 40h
        jnz     br_04312
        jmp     br_0436a
        db      090h
br_04312:
        mov     ax, word ptr [W_94AA]
        mov     es, ax
        mov     bx, word ptr [W_94A8]
        or      ax, bx
        jz      br_0436a
        add     bx, 0cah
        mov     cl, byte ptr es:[bx - 1]
        sub     ch, ch
        jcxz    br_0436a
loop_0432b:
        cmp     byte ptr es:[bx], 0ffh
        jz      br_04365
        mov     al, byte ptr es:[bx + 16h]
        cmp     al, 0
        jz      br_04365
        dec     al
        mov     byte ptr [B_0AC5], 0c0h
        mov     byte ptr [B_0AC7], al
        mov     al, byte ptr es:[bx]
        mov     byte ptr [B_0AC6], al
        sub     ah, ah
        mov     si, ax
        test    byte ptr [si + TBL_954C], 1
        jnz     br_04365
        push    bx
        push    cx
        push    3
        push    word B_0AC5
        callf   SEG_05AA:far_05aaf
        add     sp, 4
        pop     cx
        pop     bx
br_04365:
        add     bx, 18h
        loop    loop_0432b
br_0436a:
        pop     es
        endif
        mov     ah, 0ffh
        mov     al, byte ptr [B_8D8B]
        mov     si, ax
        test    di, 1
        jnz     br_0437b
        jmp     br_0439c
        db      090h
br_0437b:
        mov     byte ptr [B_0AC5], 0b0h
        mov     byte ptr [B_0AC6], 0
        mov     byte ptr [B_0AC7], 7ch
        mov     byte ptr [B_0AC8], 0
        if      FW_VERSION < 212
        push    si
        endif
        push    4
        push    word B_0AC5
        if      FW_VERSION < 212
        callf   SEG_05AA:far_05acc
        add     sp, 6
        else
        callf   SEG_05AA:far_05aaf
        add     sp, 4
        endif
br_0439c:
        test    di, 2
        jnz     br_043a5
        jmp     br_043c6
        db      090h
br_043a5:
        mov     byte ptr [B_0AC5], 0b0h
        mov     byte ptr [B_0AC6], 0
        mov     byte ptr [B_0AC7], 7dh
        mov     byte ptr [B_0AC8], 0
        if      FW_VERSION < 212
        push    si
        endif
        push    4
        push    word B_0AC5
        if      FW_VERSION < 212
        callf   SEG_05AA:far_05acc
        add     sp, 6
        else
        callf   SEG_05AA:far_05aaf
        add     sp, 4
        endif
br_043c6:
        test    di, 4
        jnz     br_043cf
        jmp     br_043f0
        db      090h
br_043cf:
        mov     byte ptr [B_0AC5], 0b0h
        mov     byte ptr [B_0AC6], 0
        mov     byte ptr [B_0AC7], 7eh
        mov     byte ptr [B_0AC8], 0
        if      FW_VERSION < 212
        push    si
        endif
        push    4
        push    word B_0AC5
        if      FW_VERSION < 212
        callf   SEG_05AA:far_05acc
        add     sp, 6
        else
        callf   SEG_05AA:far_05aaf
        add     sp, 4
        endif
br_043f0:
        test    di, 8
        jnz     br_043f9
        if      FW_VERSION < 212
        jmp     L_045c5
        else
        jmp     br_0441a
        endif
        db      090h
br_043f9:
        mov     byte ptr [B_0AC5], 0b0h
        mov     byte ptr [B_0AC6], 0
        mov     byte ptr [B_0AC7], 7fh
        mov     byte ptr [B_0AC8], 0
        if      FW_VERSION < 212
        push    si
        endif
        push    4
        push    word B_0AC5
        if      FW_VERSION < 212
        callf   SEG_05AA:far_05acc
        add     sp, 6
L_045c5:
        test    di, 10h
        jnz     L_045ce
        jmp     L_045ec
        db      090h
L_045ce:
        mov     al, byte ptr [B_9019_V112]
        mov     byte ptr [B_0AC5], 0c0h
        mov     byte ptr [B_0AC6], 0
        mov     byte ptr [B_0AC7], al
        push    si
        push    3
        push    word B_0AC5
        callf   SEG_05AA:far_05acc
        add     sp, 6
L_045ec:
        test    di, 20h
        jnz     br_04423
        jmp     br_0445c
        else
        callf   SEG_05AA:far_05aaf
        add     sp, 4
br_0441a:
        test    di, 10h
        jnz     br_04423
        jmp     br_04441
        endif
        db      090h
br_04423:
        if      FW_VERSION < 212
        mov     byte ptr [B_0AC5], 0f6h
        push    si
        else
        mov     byte ptr [B_0AC5], 0c0h
        mov     al, byte ptr [B_9D37]
        mov     byte ptr [B_0AC6], al
        mov     al, byte ptr [B_8D8C]
        mov     byte ptr [B_0AC7], al
        push    3
        push    word B_0AC5
        callf   SEG_05AA:far_05aaf
        add     sp, 4
br_04441:
        test    di, 20h
        jnz     br_0444a
        jmp     br_0445c
        db      090h
br_0444a:
        mov     byte ptr [B_0AC5], 0f6h
        endif
        push    1
        push    word B_0AC5
        if      FW_VERSION < 212
        callf   SEG_05AA:far_05acc
        add     sp, 6
        else
        callf   SEG_05AA:far_05aaf
        add     sp, 4
        endif
br_0445c:
        callf SEG_0524:far_05248
        pop     di
        pop     si
        retf
fn_04464:
        push    si
        if      FW_VERSION < 212
        push    di
        mov     bl, byte ptr [B_9D36]
        sub     bh, bh
        shl     bx, 1
        mov     dx, word ptr [bx +TBL_512E_V112]
        endif
        mov     si, TBL_8C49
        mov     bx, 7fh
        call    fn_04470
        if      FW_VERSION < 212
        pop     di
        endif
        pop     si
        retf
fn_04470:
        push    bp
loop_04471:
        cmp     byte ptr [bx+si], 0
        jz      br_044a7
        sub     sp, 4
        mov     bp, sp
        mov     byte ptr [bp], 80h
        if      FW_VERSION < 212
        mov     byte ptr [bp + 1], 0
        else
        mov     al, byte ptr [B_9D37]
        mov     byte ptr [bp + 1], al
        endif
        mov     byte ptr [bp + 2], bl
        mov     byte ptr [bp + 3], 40h
        push    bx
        if      FW_VERSION < 212
        push    dx
        else
        callf   SEG_05AA:far_05b80
        push    ax
        endif
        push    4
        push    bp
        if      FW_VERSION < 212
        callf   52eh:L_052e2
        add     sp, 4
        pop     dx
        else
        callf   SEG_05A3:far_05a35
        add     sp, 6
        endif
        pop     bx
        add     sp, 4
        if      FW_VERSION < 212
        push    ax
        endif
        mov     al, byte ptr [B_7E61]
        mov     byte ptr [bx+si], al
        if      FW_VERSION < 212
        pop     ax
        endif
br_044a7:
        dec     bx
        jge     loop_04471
        mov     byte ptr [B_7E61], 0
        pop     bp
        ret
fn_044b1:
        cmp     byte ptr [B_501B], 2
        jnz     br_044e1
        if      FW_VERSION < 212
        push    ax
        else
        cmp     byte ptr [B_8C07], 0
        jz      br_044c5
        mov     al, byte ptr [B_9D37]
        jmp     br_044d1
        db      090h
br_044c5:
        mov     al, byte ptr [B_501D]
        cmp     al, 0ffh
        jz      br_044e1
        mov     byte ptr [TBL_95B0], al
        sub     al, al
br_044d1:
        mov     byte ptr [bx + 1], al
        endif
        push    cx
        push    bx
        if      FW_VERSION < 212
        callf   SEG_05AA:far_05acc
        add     sp, 6
        else
        callf   SEG_05AA:far_05aaf
        add     sp, 4
        endif
        jmp     br_044ea
        db      090h
br_044e1:
        push    bx
        callf   SEG_DFBE:far_dfbe6
        add     sp, 2
br_044ea:
        ret
        if      FW_VERSION < 212
        phase   6

far_ed328:
        endif

RUN_BR_05A1A macro   {GLOBALSYMBOLS}
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 212
        mov     bx, word ptr [bp + 6]
        cmp     byte ptr [bx], 0
        jnz     br_05a33
        push    di
        mov     di, 1
        cmp     byte ptr [B_A064], 0
        else
        push    di
        cmp     byte ptr [B_52B5_V112], 0
        jnz     br_05a33
        mov     di, 1
        cmp     byte ptr [B_52E1_V112], 0
        endif
        jz      br_05a1a
        mov     di, 4
br_05a1a:
        push    di
        callf SEG_03EC:far_03ec1
        add     sp, 2
        if      FW_VERSION >= 212
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        else
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        endif
        push    di
        callf   SEG_05BE:far_05bef
        add     sp, 6
        if      FW_VERSION >= 212
        pop     di
br_05a33:
        else
br_05a33:
        pop     di
        endif
        pop     bp
        retf
        endm
        if      FW_VERSION < 212
        RUN_BR_05A1A
        phase   9
        endif

RUN_FAR_05ACC macro   {GLOBALSYMBOLS}
far_05acc:
        push    bp
        mov     bp, sp
        push    si
        push    di
        mov     di, word ptr [bp + 6]
        if      FW_VERSION >= 212
        push    word ptr [di]
        push    word ptr [di + 2]
        endif
        mov     al, byte ptr [di + 2]
        sub     ah, ah
        mov     si, ax
        if      FW_VERSION >= 212
        mov     bl, byte ptr [di + 1]
        and     byte ptr [di + 1], 7fh
        test    bl, 80h
        jnz     br_05af6
        and     bx, 7fh
        mov     dl, byte ptr [bx + TBL_9678]
        jmp     br_05afd
        db      090h
br_05af6:
        and     bx, 7fh
        mov     dl, byte ptr [bx + TBL_99EE]
br_05afd:
        cmp     byte ptr [di], 90h
        ja      br_05b1d
        mov     al, byte ptr [di + 3]
        mul     dl
        add     ax, 32h
        cmp     ax, 3200h
        jc      br_05b16
        mov     byte ptr [di + 3], 7fh
        jmp     br_05b1d
        db      090h
br_05b16:
        mov     dl, 64h
        div     dl
        mov     byte ptr [di + 3], al
br_05b1d:
        test    word ptr [bp + 0ah], 40h
        jz      br_05b68
        else
        mov     ax, word ptr [bp + 0ah]
        cmp     byte ptr [B_501C], 0ffh
        jz      br_05b68
        cmp     al, byte ptr [B_501C]
        jz      L_046de
        cmp     ah, byte ptr [B_501C]
        jnz     br_05b68
L_046de:
        endif
        cmp     byte ptr [B_550D], 0
        jz      br_05b3f
        cmp     byte ptr [di], 0b0h
        jnz     br_05b3f
        sub     ah, ah
        if      FW_VERSION >= 212
        mov     al, byte ptr [B_52B4]
        else
        mov     al, byte ptr [B_5D9B_V112]
        endif
        cmp     ax, si
        jnz     br_05b3f
        mov     al, byte ptr [B_8B4F]
        mov     byte ptr [di + 3], al
br_05b3f:
        if      FW_VERSION >= 212
        push    word ptr [bp + 8]
        push    di
        push    8
        callf SEG_0530:far_05303
        add     sp, 6
        else
        push    di
        callf   SEG_DFBE:far_dfbe6
        add     sp, 2
        endif
        cmp     byte ptr [B_501B], 0
        jz      br_05b77
        cmp     byte ptr [di], 0a0h
        ja      br_05b68
        cmp     si, 20h
        jl      br_05b61
        jmp     br_05b77
        db      090h
br_05b61:
        if      FW_VERSION >= 212
        mov     al, byte ptr [si + TBL_509E]
        else
        mov     al, byte ptr [si +TBL_5CD2_V112]
        endif
        mov     byte ptr [di + 2], al
br_05b68:
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    di
        if      FW_VERSION >= 212
        callf   SEG_05A3:far_05a35
        add     sp, 6
br_05b77:
        pop     word ptr [di + 2]
        pop     word ptr [di]
        else
        callf   52eh:L_052e2
        add     sp, 6
        mov     ax, si
        mov     byte ptr [di + 2], al
br_05b77:
        endif
        pop     di
        pop     si
        pop     bp
        retf
        endm
        if      FW_VERSION < 212
        RUN_FAR_05ACC

        phase   5
        else

        phase   0bh
        RUN_FAR_044EB
        phase   6
far_04596:
        push    bp
        mov     bp, sp
        RUN_BR_0459C
        pop     bp
        retf
        phase   0ah
        endif
far_04aea:
        cmp     byte ptr [B_4E7A], 6
        jz      br_04af8
        cmp     byte ptr [B_4E7A], 5
        jnz     br_04afb
br_04af8:
        jmp     br_04bf0
br_04afb:
        mov     ax, word ptr [W_5381]
        mov     dx, word ptr [W_5383]
        sub     ax, word ptr [W_537D]
        sbb     dx, word ptr [W_537F]
        rcl     dx, 1
        pushf
        rcr     dx, 1
        or      dx, dx
        jnz     br_04b1c
        cmp     ax, 1
        ja      br_04b1c
        popf
        jmp     br_04b4f
        db      090h
br_04b1c:
        popf
        pushf
        jnc     br_04b2d
        not     ax
        not     dx
        add     ax, 1
        adc     dx, 0
        jmp     br_04b33
        db      090h
br_04b2d:
        sub     ax, 1
        sbb     dx, 0
br_04b33:
        mov     bx, 10h
        or      dx, dx
        jnz     br_04b44
        test    ax, 0fff0h
        jnz     br_04b44
        and     ax, 0fh
        mov     bx, ax
br_04b44:
        dec     bx
        shl     bx, 1
        mov     bx, word ptr cs:[bx + TBL_04d1e]
        jmp     br_04c81
br_04b4f:
        rcr     al, 1
        cmc
        pushf
        jc      br_04b74
        mov     ax, word ptr [W_5379]
        mov     dx, word ptr [W_537B]
        sub     ax, word ptr [W_5371]
        sbb     dx, word ptr [W_5373]
        add     ax, word ptr [W_53A9]
        adc     dx, 0
        jns     br_04b99
        sub     ax, ax
        sub     dx, dx
        jmp     br_04b99
        db      090h
br_04b74:
        mov     ax, word ptr [W_5375]
        mov     dx, word ptr [W_5377]
        sub     ax, word ptr [W_5379]
        sbb     dx, word ptr [W_537B]
        sub     ax, word ptr [W_53A9]
        sbb     dx, 0
        jns     br_04b99
        not     ax
        not     dx
        add     ax, 1
        adc     dx, 0
        popf
        cmc
        pushf
br_04b99:
        mov     di, word ptr [W_5375]
        mov     si, word ptr [W_5377]
        sub     di, word ptr [W_5371]
        sbb     si, word ptr [W_5373]
        mov     word ptr [W_5393], ax
        mov     word ptr [W_5395], dx
        mov     word ptr [W_5397], di
        mov     word ptr [W_5399], si
        call    fn_04d17
        jnc     br_04bd2
        mov     cx, 10h
loop_04bc0:
        or      si, si
        jz      br_04bce
        shr     dx, 1
        rcr     ax, 1
        shr     si, 1
        rcr     di, 1
        loop    loop_04bc0
br_04bce:
        or      di, di
        jnz     br_04bd8
br_04bd2:
        mov     ax, 0ffffh
        jmp     br_04bde
        db      090h
br_04bd8:
        mov     dx, ax
        xor     ax, ax
        div     di
br_04bde:
        mov     cl, 4
        shr     ah, cl
        mov     bl, ah
        xor     bh, bh
        shl     bx, 1
        mov     bx, word ptr cs:[bx + TBL_04d3e]
        jmp     near br_04c81
br_04bf0:
        mov     ax, word ptr [W_5375]
        mov     dx, word ptr [W_5377]
        sub     ax, word ptr [W_5379]
        sbb     dx, word ptr [W_537B]
        add     ax, word ptr [W_53BD]
        adc     dx, word ptr [W_53BF]
        mov     di, word ptr [W_5385]
        mov     si, word ptr [W_5387]
        mov     cx, word ptr [W_53C1]
        mov     bx, word ptr [W_53C3]
br_04c17:
        call    fn_04d17
        jc      br_04c28
        sub     ax, di
        sbb     dx, si
        add     cx, 1
        adc     bx, 0
        jmp     br_04c17
br_04c28:
        mov     di, ax
        mov     si, dx
        mov     ax, word ptr [W_5381]
        mov     dx, word ptr [W_5383]
        sub     ax, cx
        sbb     dx, bx
        rcl     dx, 1
        pushf
        rcr     dx, 1
        or      dx, dx
        jnz     br_04c45
        cmp     ax, 1
        jbe     br_04c48
br_04c45:
        jmp     br_04b1c
br_04c48:
        popf
        rcr     al, 1
        cmc
        pushf
        jc      br_04c64
        mov     ax, word ptr [W_5385]
        mov     dx, word ptr [W_5387]
        sub     ax, di
        sbb     dx, si
        add     ax, word ptr [W_53A9]
        adc     dx, 0
        jmp     br_04c7e
        db      090h
br_04c64:
        mov     ax, di
        mov     dx, si
        sub     ax, word ptr [W_53A9]
        sbb     dx, 0
        jns     br_04c7e
        not     ax
        not     dx
        add     ax, 1
        adc     dx, 0
        popf
        cmc
        pushf
br_04c7e:
        jmp     br_04b99
br_04c81:
        cmp     byte ptr [B_4E7A], 6
        jz      br_04c8f
        cmp     byte ptr [B_4E7A], 5
        jnz     br_04c95
br_04c8f:
        mov     ax, word ptr [W_5361]
        jmp     br_04ccb
        db      090h
br_04c95:
        mov     ax, word ptr [W_5375]
        mov     dx, word ptr [W_5377]
        sub     ax, word ptr [W_5371]
        sbb     dx, word ptr [W_5373]
        mov     cl, byte ptr [B_4E7A]
        xor     ch, ch
        mov     si, cx
        shl     si, 1
        mov     cx, word ptr cs:[si + TBL_04d07]
        div     cx
        cmp     ax, 7a12h
        jbe     br_04cc0
        mov     ax, 7a12h
        jmp     br_04cc8
        db      090h
br_04cc0:
        cmp     ax, 8b8h
        jnc     br_04cc8
        mov     ax, 8b8h
br_04cc8:
        mov     word ptr [W_5361], ax
br_04ccb:
        mov     di, ax
        xor     si, si
        mul     bx
        mov     al, ah
        mov     ah, dl
        mov     dl, dh
        xor     dh, dh
        popf
        jnc     br_04cef
        add     di, ax
        adc     si, dx
        xor     dx, dx
        mov     ax, 7a12h
        call    fn_04d17
        ja      br_04d02
        mov     di, ax
        jmp     br_04d02
        db      090h
br_04cef:
        sub     di, ax
        sbb     si, dx
        mov     dx, 0
        mov     ax, 8b8h
        js      br_04d00
        call    fn_04d17
        jc      br_04d02
br_04d00:
        mov     di, ax
br_04d02:
        mov     word ptr [W_5363], di
        retf
TBL_04d07:
        db      001h, 000h, 008h, 000h, 002h, 000h, 008h, 000h, 008h, 000h, 001h, 000h, 001h, 000h, 0c0h, 000h
fn_04d17:
        cmp     dx, si
        jnz     br_04d1d
        cmp     ax, di
br_04d1d:
        ret
TBL_04d1e:
        db      000h, 001h, 040h, 001h, 080h, 001h, 0c0h, 001h, 000h, 002h, 040h, 002h, 080h, 002h, 0c0h, 002h
        db      000h, 003h, 040h, 003h, 080h, 003h, 0c0h, 003h, 000h, 004h, 040h, 004h, 080h, 004h, 0c0h, 004h
TBL_04d3e:
        db      002h, 000h, 004h, 000h, 006h, 000h, 008h, 000h, 00ah, 000h, 00ch, 000h, 00eh, 000h, 010h, 000h
        db      020h, 000h, 040h, 000h, 060h, 000h, 080h, 000h, 0a0h, 000h, 0c0h, 000h, 0e0h, 000h, 000h, 001h
        if      FW_VERSION < 212
        phase   9
        else
        phase   0eh
        endif
far_04d5e:
        push    di
        if      FW_VERSION < 212
        cmp     byte ptr [B_52B5_V112], 0
        jnz     br_04de1
        test    byte ptr [B_52E1_V112], 1
        else
        mov     al, byte ptr [B_94A6]
        or      al, byte ptr [B_7E63]
        jnz     br_04de1
        test    byte ptr [B_A064], 1
        endif
        jnz     br_04d7e
        cmp     byte ptr [B_7E5E], 0
        jz      br_04d7b
        callf   SEG_F049:far_f04ce
br_04d7b:
        jmp     br_04de1
        db      090h
br_04d7e:
        mov     di, word ptr [W_A059]
        if      FW_VERSION < 212
        mov     ax, word ptr [W_52D6_V112]
        else
        mov     ax, word ptr [W_A05B]
        endif
        mov     word ptr [W_A059], ax
        callf   SEG_04FA:far_04fa0
br_04d8d:
        push    word 1400h
        if      FW_VERSION < 212
        push    word 903fh
        else
        push    word TBL_8E65
        endif
        push    4
        callf SEG_0300:far_03012
        add     sp, 6
        or      ax, ax
        jz      br_04ddd
        push    ax
        if      FW_VERSION < 212
        cmp     byte ptr [B_903F_V112], 88h
        else
        cmp     byte ptr [TBL_8E65], 88h
        endif
        jnz     br_04dc4
        mov     ax, word ptr [TBL_8E66]
        shl     al, 1
        shr     ax, 1
        add     ax, word ptr [W_A059]
        mov     word ptr [W_A059], 0
        shl     ax, 1
        shr     al, 1
        mov     word ptr [TBL_8E66], ax
        jmp     br_04dce
        db      090h
br_04dc4:
        push    1
        callf SEG_03EC:far_03ec1
        add     sp, 2
br_04dce:
        if      FW_VERSION < 212
        push    word 903fh
        else
        push    word TBL_8E65
        endif
        push    1
        callf SEG_0530:far_05303
        add     sp, 6
        jmp     br_04d8d
br_04ddd:
        add     word ptr [W_A059], di
br_04de1:
        mov     byte ptr [B_7E5E], 0
        if      FW_VERSION < 212
        mov     byte ptr [B_52E1_V112], 0
        else
        mov     byte ptr [B_A064], 0
        endif
        pop     di
        retf
        if      FW_VERSION < 212
        phase   6
far_04ded:
        push    bp
        mov     bp, sp
        push    es
        push    si
        push    di
        mov     di, word ptr [bp + 6]
        mov     ax, 1580h
        mov     es, ax
        mov     ax, word ptr [bp + 8]
        cmp     al, 0ffh
        jnz     L_04a4e
        jmp     L_04b54
L_04a4e:
        mov     ah, al
        sub     al, al
        shr     ax, 1
        mov     si, ax
        mov     al, byte ptr [di + 2]
        mov     byte ptr [TBL_0AE2_V112+4], al
        sub     ah, ah
        add     si, ax
        mov     dx, word ptr [bp + 8]
        or      dx, 0ff00h
        mov     bx, si
        cmp     word ptr es:[bx+si + 3010h], 0ffffh
        jz      L_04a95
        mov     byte ptr [L_0AD2_V112+4], 80h
        mov     byte ptr [B_869F], 0
        mov     byte ptr [L_0AD2_V112+6], al
        mov     al, byte ptr es:[si + 2810h]
        mov     byte ptr [L_0AD2_V112+7], al
        push    dx
        push    4
        push    word 0ad6h
        callf   SEG_05AA:far_05acc
        add     sp, 4
        pop     dx
L_04a95:
        cmp     byte ptr [TBL_0AE2_V112+4], 0
        jnz     br_04ec0
        mov     byte ptr [L_0AD2_V112+8], 0b0h
        mov     byte ptr [L_0AD2_V112+9], 0
        mov     al, byte ptr [B_5D9B_V112]
        mov     byte ptr [B_86A0], al
        mov     al, byte ptr [di + 4]
        mov     byte ptr [B_86A1], al
        push    dx
        push    4
        push    word 0adah
        callf   SEG_05AA:far_05acc
        add     sp, 4
        pop     dx
br_04ec0:
        mov     byte ptr [di], 90h
        push    dx
        push    4
        push    di
        callf   SEG_05AA:far_05acc
        add     sp, 6
        mov     byte ptr [di], 98h
        mov     al, byte ptr [di + 4]
        mov     byte ptr es:[si + 2810h], al
        xor     al, al
        mov     ah, byte ptr [di + 6]
        shr     ax, 1
        or      al, byte ptr [di + 5]
        mov     word ptr [TBL_0AE2_V112+2], ax
        add     ax, word ptr [TBL_0AE2_V112]
        shl     si, 1
        mov     word ptr es:[si + 3010h], ax
        mov     bx, word ptr [bp + 8]
        sub     bh, bh
        shl     bx, 1
        cmp     word ptr [W_856C], 0ffffh
        jnz     L_04b0f
        mov     word ptr [W_856C], ax
        mov     word ptr [W_856E], ax
        mov     word ptr es:[bx + 2710h], ax
        jmp     L_04b42
        db      090h
L_04b0f:
        cmp     ax, word ptr [W_856E]
        jc      L_04b2c
        cmp     word ptr es:[bx + 2710h], 0ffffh
        jz      L_04b24
        cmp     ax, word ptr es:[bx + 2710h]
        jnc     L_04b42
L_04b24:
        mov     word ptr es:[bx + 2710h], ax
        jmp     L_04b42
        db      090h
L_04b2c:
        push    ax
        mov     ax, word ptr [W_856C]
        sub     ax, word ptr [TBL_0AE2_V112+2]
        sub     word ptr [W_856C], ax
        sub     word ptr [W_856E], ax
        pop     ax
        mov     word ptr es:[bx + 2710h], ax
L_04b42:
        mov     ax, word ptr [bp + 8]
        cmp     ah, 0ffh
        jz      L_04b54
        mov     al, ah
        mov     ah, 0ffh
        mov     word ptr [bp + 8], ax
        jmp     L_04a4e
L_04b54:
        pop     di
        pop     si
        pop     es
        else
        phase   0dh
far_04ded:
        push    bp
        mov     bp, sp
        push    di
        cmp     word ptr [W_856C], 0
        jg      br_04e04
        mov     word ptr [W_8570], 1
        mov     bx, 0
        jmp     br_04e29
        db      090h
br_04e04:
        mov     bx, word ptr [W_8570]
        mov     di, TBL_8572
        mov     cx, bx
        sub     ax, ax
loop_04e0f:
        cmp     word ptr [di], ax
        jz      br_04e27
        add     di, 2
        loop    loop_04e0f
        cmp     bx, 32h
        jc      br_04e20
        jmp     near br_04ed1
br_04e20:
        inc     word ptr [W_8570]
        jmp     br_04e29
        db      090h
br_04e27:
        sub     bx, cx
br_04e29:
        mov     di, word ptr [bp + 6]
        mov     al, byte ptr [di + 1]
        callf   SEG_05AA:far_05b80
        mov     byte ptr [bx + TBL_863A], al
        mov     byte ptr [bx + TBL_866C], ah
        mov     al, byte ptr [di + 2]
        mov     byte ptr [bx + TBL_85D6], al
        mov     al, byte ptr [di + 4]
        mov     byte ptr [bx + TBL_8608], al
        shl     bx, 1
        mov     cl, byte ptr [di + 5]
        shl     cl, 1
        mov     ch, byte ptr [di + 6]
        shr     cx, 1
        cmp     word ptr [W_856C], 0
        jnz     br_04e6c
        mov     word ptr [W_856C], cx
        mov     word ptr [W_856E], cx
        mov     word ptr [bx + TBL_8572], cx
        jmp     br_04e96
        db      090h
br_04e6c:
        cmp     cx, word ptr [W_856E]
        jl      br_04e81
        add     cx, word ptr [W_856C]
        sub     cx, word ptr [W_856E]
        mov     word ptr [bx + TBL_8572], cx
        jmp     br_04e96
        db      090h
br_04e81:
        mov     ax, cx
        sub     ax, word ptr [W_856E]
        add     word ptr [W_856C], ax
        mov     word ptr [W_856E], cx
        mov     ax, word ptr [W_856C]
        mov     word ptr [bx + TBL_8572], ax
br_04e96:
        cmp     byte ptr [di + 2], 0
        jnz     br_04ec0
        mov     byte ptr [B_869E], 0b0h
        mov     al, byte ptr [di + 1]
        mov     byte ptr [B_869F], al
        mov     al, byte ptr [B_52B4]
        mov     byte ptr [B_86A0], al
        mov     al, byte ptr [di + 4]
        mov     byte ptr [B_86A1], al
        push    4
        push    word B_869E
        callf   SEG_05AA:far_05aaf
        add     sp, 4
br_04ec0:
        mov     byte ptr [di], 90h
        push    5
        push    di
        callf   SEG_05AA:far_05aaf
        add     sp, 4
        mov     byte ptr [di], 98h
br_04ed1:
        pop     di
        endif
        pop     bp
        retf
far_04ed4:
        push    es
        push    di
        cld
        if      FW_VERSION < 212
        mov     ax, 1580h
        mov     es, ax
        mov     ax, 0ffffh
        mov     di, 2810h
        mov     cx, 800h
        rep stosb
        mov     di, 3010h
        mov     cx, 1000h
        else
        mov     ax, ds
        mov     es, ax
        mov     ax, 0
        mov     di, TBL_8572
        mov     cx, 32h
        endif
        rep stosw
        mov     word ptr [W_856C], ax
        mov     word ptr [W_856E], ax
        if      FW_VERSION < 212
        mov     word ptr [TBL_0AE2_V112], 0
        mov     cx, 80h
        mov     di, 2710h
        rep stosw
        else
        mov     word ptr [W_8570], 1
        endif
        pop     di
        pop     es
        retf
far_04ef5:
        if      FW_VERSION < 212
        cmp     word ptr [W_856C], 0ffffh
        jz      L_04bdf
        dec     word ptr [W_856C]
        jnz     L_04bdf
        push    es
        push    si
        push    di
        mov     ax, 1580h
        mov     es, ax
        sub     si, si
        mov     cx, 10h
        mov     dx, 0ffffh
L_04ba8:
        cmp     word ptr es:[si + 2710h], 0ffffh
        jz      L_04bcf
        mov     ax, word ptr [W_856E]
        sub     word ptr es:[si + 2710h], ax
        call    L_04bea
        cmp     word ptr es:[si + 2710h], 0ffffh
        jz      L_04bcf
        cmp     word ptr es:[si + 2710h], dx
        jnc     L_04bcf
        mov     dx, word ptr es:[si + 2710h]
L_04bcf:
        add     si, 2
        loop    L_04ba8
        mov     word ptr [W_856C], dx
        mov     word ptr [W_856E], dx
        pop     di
        pop     si
        pop     es
L_04bdf:
        mov     ax, word ptr [W_856E]
        sub     ax, word ptr [W_856C]
        mov     word ptr [TBL_0AE2_V112], ax
        retf
L_04bea:
        push    cx
        push    dx
        push    si
        mov     dx, 10h
        sub     dx, cx
        mov     di, dx
        or      di, 0ff00h
        xchg    dl, dh
        mov     si, dx
        mov     cx, 80h
        mov     dx, 0ffffh
L_04c02:
        cmp     word ptr es:[si + 3010h], 0ffffh
        jz      L_04c52
        sub     word ptr es:[si + 3010h], ax
        jnz     L_04c46
        dec     word ptr es:[si + 3010h]
        pusha
        mov     byte ptr [L_0AD2_V112+4], 80h
        mov     byte ptr [B_869F], 0
        mov     byte ptr [L_0AD2_V112+6], 80h
        sub     byte ptr [L_0AD2_V112+6], cl
        shr     si, 1
        mov     al, byte ptr es:[si + 2810h]
        mov     byte ptr [L_0AD2_V112+7], al
        push    di
        push    4
        push    word 0ad6h
        else
        cmp     word ptr [W_856E], 0
        jg      br_04efd
        retf
br_04efd:
        dec     word ptr [W_856E]
        jz      br_04f04
        retf
br_04f04:
        push    si
        mov     dx, word ptr [W_856C]
        mov     cx, word ptr [W_8570]
        mov     si, 0ffffh
        mov     bx, 0fffeh
loop_04f13:
        add     bx, 2
        mov     ax, word ptr [bx + TBL_8572]
        test    ax, ax
        jz      br_04f38
        sub     ax, dx
        jg      br_04f2e
        mov     word ptr [bx + TBL_8572], 0
        call    fn_04f4b
        jmp     br_04f38
        db      090h
br_04f2e:
        mov     word ptr [bx + TBL_8572], ax
        cmp     ax, si
        jnc     br_04f38
        mov     si, ax
br_04f38:
        loop    loop_04f13
        cmp     si, 0ffffh
        jnz     br_04f41
        sub     si, si
br_04f41:
        mov     word ptr [W_856E], si
        mov     word ptr [W_856C], si
        pop     si
        retf
fn_04f4b:
        pusha
        shr     bx, 1
        mov     byte ptr [B_869E], 80h
        mov     byte ptr [B_869F], 0
        mov     al, byte ptr [bx + TBL_85D6]
        mov     byte ptr [B_86A0], al
        mov     al, byte ptr [bx + TBL_8608]
        mov     byte ptr [B_86A1], al
        mov     al, byte ptr [bx + TBL_863A]
        mov     ah, byte ptr [bx + TBL_866C]
        push    ax
        push    4
        push    word B_869E
        endif
        callf   SEG_05AA:far_05acc
        add     sp, 6
        popa
        if      FW_VERSION < 212
        jmp     L_04c52
        db      090h
L_04c46:
        cmp     word ptr es:[si + 3010h], dx
        jnc     L_04c52
        mov     dx, word ptr es:[si + 3010h]
L_04c52:
        add     si, 2
        loop    L_04c02
        pop     si
        mov     word ptr es:[si + 2710h], dx
        pop     dx
        pop     cx
        endif
        ret
far_04f7e:
        if      FW_VERSION < 212
        push    es
        push    si
        push    di
        mov     ax, 1580h
        mov     es, ax
        mov     ax, word ptr [W_856C]
        cmp     ax, 0ffffh
        jz      L_04cda
        mov     word ptr [W_856C], 0ffffh
        mov     word ptr [W_856E], 0ffffh
        mov     word ptr [TBL_0AE2_V112], 0
        mov     cx, 10h
        sub     bx, bx
L_04c87:
        push    cx
        mov     cx, 80h
        sub     si, si
L_04c8d:
        mov     ax, 0ffffh
        cmp     word ptr es:[bx+si + 3010h], ax
        jz      L_04cce
        mov     word ptr es:[bx+si + 3010h], ax
        pusha
        mov     dl, bh
        mov     dh, 0ffh
        shr     si, 1
        shr     bx, 1
        xchg    byte ptr es:[bx+si + 2810h], al
        mov     byte ptr [L_0AD2_V112+4], 80h
        mov     byte ptr [B_869F], 0
        mov     ah, 80h
        sub     ah, cl
        mov     byte ptr [L_0AD2_V112+6], ah
        mov     byte ptr [L_0AD2_V112+7], al
        push    dx
        push    4
        push    word 0ad6h
        callf   SEG_05AA:far_05acc
        add     sp, 6
        popa
L_04cce:
        add     si, 2
        loop    L_04c8d
        pop     cx
        add     bx, 100h
        loop    L_04c87
L_04cda:
        sub     si, si
        mov     cx, 10h
L_04cdf:
        mov     word ptr es:[si + 2710h], 0ffffh
        add     si, 2
        loop    L_04cdf
        pop     di
        pop     si
        pop     es
        retf
        phase   0fh
        else
        cmp     word ptr [W_856C], 0
        jz      br_04f9f
        mov     cx, word ptr [W_8570]
        sub     bx, bx
loop_04f8b:
        cmp     word ptr [bx + TBL_8572], 0
        jz      br_04f95
        call    fn_04f4b
br_04f95:
        add     bx, 2
        loop    loop_04f8b
        callf SEG_04DE:far_04ed4
br_04f9f:
        retf
        phase   0
        endif
far_04fa0:
        push    es
        push    di
        push    si
        if      FW_VERSION < 212
        cmp     byte ptr [B_52B5_V112], 0
        else
        cmp     byte ptr [B_7E63], 0
        jnz     br_04fde
        cmp     byte ptr [B_94A6], 0
        endif
        jnz     br_04fde
        cmp     byte ptr [B_A063], 0
        jz      br_04fde
        mov     byte ptr [B_A063], 0
        mov     ax, ds
        mov     es, ax
        std
        cmp     byte ptr [B_8C07], 0
        jnz     br_04fd2
        if      FW_VERSION < 212
        mov     di, 896fh
        elseif  FW_VERSION = 212
        mov     di, 7b6bh
        else
        mov     di, 7eebh
        endif
        mov     cx, 80h
        jmp     br_04fd8
        db      090h
br_04fd2:
        if      FW_VERSION < 212
        mov     di, 890fh
        elseif  FW_VERSION = 212
        mov     di, 7b0bh
        else
        mov     di, 7e8bh
        endif
        mov     cx, 20h
br_04fd8:
        mov     al, 0ffh
        repe scasb
        jnz     br_04fe2
br_04fde:
        pop     si
        pop     di
        pop     es
        retf
br_04fe2:
        mov     bx, cx
        if      FW_VERSION < 212
        cmp     byte ptr [bx +TBL_88F0_V112], 0feh
        else
        cmp     byte ptr [bx + TBL_7E6C], 0feh
        endif
        jnz     br_04fee
        jmp     near br_050b1
br_04fee:
        if      FW_VERSION >= 212
        cmp     byte ptr [bx + TBL_7E6C], 0fdh
        jnz     br_04ffd
        mov     byte ptr [bx + TBL_7E6C], 0ffh
        jmp     br_050fe
br_04ffd:
        endif
        if      FW_VERSION = 212
        mov     byte ptr [bx +TBL_7FEC_V212], 0ffh
        endif
        if      FW_VERSION >= 214
        mov     byte ptr [bx +TBL_836C], 0ffh
        endif
        cmp     word ptr [W_A059], 0
        jz      br_05033
        sub     word ptr [W_8BD5], 3
        sbb     word ptr [W_8BD7], 0
        mov     al, 88h
        callf   SEG_05C6:far_05c64
        mov     ax, word ptr [W_A059]
        shl     ax, 1
        shr     al, 1
        callf   SEG_05C6:far_05c64
        mov     al, ah
        callf   SEG_05C6:far_05c64
        mov     word ptr [W_A059], 0
br_05033:
        sub     word ptr [W_8BD5], 7
        sbb     word ptr [W_8BD7], 0
        mov     al, 98h
        callf   SEG_05C6:far_05c64
        mov     al, byte ptr [B_9D37]
        cbw
        mov     si, ax
        if      FW_VERSION < 212
        or      byte ptr [si +TBL_50CA_V112], 2
        else
        or      byte ptr [si + TBL_954C], 2
        endif
        callf   SEG_05C6:far_05c64
        mov     al, bl
        callf   SEG_05C6:far_05c64
        if      FW_VERSION < 212
        mov     al, byte ptr [bx +TBL_88F0_V112]
        callf   SEG_05C6:far_05c64
        mov     al, byte ptr [bx +TBL_8A70_V112]
        else
        mov     al, byte ptr [bx + TBL_7E6C]
        callf   SEG_05C6:far_05c64
        mov     al, byte ptr [bx + TBL_7FEC]
        endif
        cmp     al, 0ffh
        jz      br_05083
        callf   SEG_05C6:far_05c64
        if      FW_VERSION < 212
        mov     byte ptr [bx +TBL_88F0_V112], 0ffh
        mov     byte ptr [bx +TBL_8A70_V112], 0ffh
        else
        mov     byte ptr [bx + TBL_7E6C], 0ffh
        mov     byte ptr [bx + TBL_7FEC], 0ffh
        endif
        shl     bx, 1
        call    fn_0517d
        jmp     near br_04fd8
br_05083:
        if      FW_VERSION < 212
        mov     byte ptr [bx +TBL_88F0_V112], 0feh
        shl     bx, 1
        else
        mov     byte ptr [bx + TBL_7E6C], 0feh
        shl     bx, 2
        endif
        mov     ax, word ptr [W_94BC]
        mov     word ptr [bx + TBL_816C], ax
        mov     ax, word ptr [W_94BE]
        mov     word ptr [bx + TBL_816E], ax
        mov     al, 40h
        callf   SEG_05C6:far_05c64
        mov     al, 17h
        callf   SEG_05C6:far_05c64
        mov     al, 0
        callf   SEG_05C6:far_05c64
        if      FW_VERSION < 212
        jmp     near br_04fd8
br_050b1:
        mov     dl, byte ptr [bx +TBL_8A70_V112]
        else
        jmp     br_04fd8
br_050b1:
        mov     dl, byte ptr [bx + TBL_7FEC]
        endif
        cmp     dl, 0ffh
        jnz     br_050bd
        if      FW_VERSION < 212
        jmp     br_04fd8
br_050bd:
        mov     byte ptr [bx +TBL_88F0_V112], 0ffh
        mov     byte ptr [bx +TBL_8A70_V112], 0ffh
        else
        jmp     br_050f2
        db      090h
br_050bd:
        mov     byte ptr [bx + TBL_7E6C], 0ffh
        mov     byte ptr [bx + TBL_7FEC], 0ffh
        endif
        push    word ptr [W_94BC]
        push    word ptr [W_94BE]
        if      FW_VERSION < 212
        shl     bx, 1
        else
        shl     bx, 2
        endif
        mov     ax, word ptr [bx + TBL_816C]
        mov     word ptr [W_94BC], ax
        mov     ax, word ptr [bx + TBL_816E]
        mov     word ptr [W_94BE], ax
        mov     al, dl
        callf   SEG_05C6:far_05c64
        call    fn_0517d
        pop     word ptr [W_94BE]
        pop     word ptr [W_94BC]
        if      FW_VERSION >= 212
br_050f2:
        mov     bx, cx
        endif
        if      FW_VERSION = 212
        cmp     byte ptr [bx +TBL_7FEC_V212], 0ffh
        endif
        if      FW_VERSION >= 214
        cmp     byte ptr [bx +TBL_836C], 0ffh
        endif
        if      FW_VERSION >= 212
        jnz     br_050fe
        jmp     br_04fd8
br_050fe:
        cmp     word ptr [W_A059], 0
        jz      br_0512f
        sub     word ptr [W_8BD5], 3
        sbb     word ptr [W_8BD7], 0
        mov     al, 88h
        callf   SEG_05C6:far_05c64
        mov     ax, word ptr [W_A059]
        shl     ax, 1
        shr     al, 1
        callf   SEG_05C6:far_05c64
        mov     al, ah
        callf   SEG_05C6:far_05c64
        mov     word ptr [W_A059], 0
br_0512f:
        sub     word ptr [W_8BD5], 7
        sbb     word ptr [W_8BD7], 0
        mov     al, 98h
        callf   SEG_05C6:far_05c64
        mov     al, byte ptr [B_9D37]
        callf   SEG_05C6:far_05c64
        mov     al, bl
        callf   SEG_05C6:far_05c64
        endif
        if      FW_VERSION = 212
        mov     al, byte ptr [bx +TBL_7FEC_V212]
        endif
        if      FW_VERSION >= 214
        mov     al, byte ptr [bx +TBL_836C]
        endif
        if      FW_VERSION >= 212
        callf   SEG_05C6:far_05c64
        mov     al, byte ptr [bx + TBL_83EC]
        callf   SEG_05C6:far_05c64
        endif
        if      FW_VERSION = 212
        mov     byte ptr [bx +TBL_7FEC_V212], 0ffh
        endif
        if      FW_VERSION >= 214
        mov     byte ptr [bx +TBL_836C], 0ffh
        endif
        if      FW_VERSION >= 212
        shl     bx, 1
        mov     al, byte ptr [bx + TBL_846C]
        callf   SEG_05C6:far_05c64
        mov     al, byte ptr [bx + TBL_846D]
        callf   SEG_05C6:far_05c64
        endif
        jmp     br_04fd8
fn_0517d:
        mov     dx, word ptr [bx + TBL_806C]
        if      FW_VERSION < 212
        sub     dx, word ptr [bx +TBL_8970_V112]
        else
        sub     dx, word ptr [bx + TBL_7EEC]
        endif
        jnz     br_05188
        inc     dx
br_05188:
        mov     al, dl
        and     al, 7fh
        callf   SEG_05C6:far_05c64
        shl     dx, 1
        mov     al, dh
        and     al, 7fh
        callf   SEG_05C6:far_05c64
        ret
TBL_0519d:
        if      FW_VERSION < 212
        db      06dh, 047h, 0a6h, 048h, 0dfh, 049h, 018h, 04bh
TBL_051a5:
        db      "QLaLqL"
        db      081h, 04ch
        else
        db      02eh, 013h, 030h, 019h, 032h, 01fh, 034h, 025h
TBL_051a5:
        endif
        if      FW_VERSION = 212
        db      "0H@HPH`H"
        endif
        if      FW_VERSION >= 214
        db      0b0h, 04bh, 0c0h, 04bh, 0d0h, 04bh, 0e0h, 04bh
        endif
TBL_051ad:
        db      002h, 001h, 012h, 001h, 022h, 001h, 032h, 001h
fn_051b5:
        push    bp
        mov     bp, sp
        cmp     byte ptr [B_8D78], 0
        jnz     br_051d4
        mov     bx, word ptr [bp + 8]
        dec     bx
        js      br_051d4
        shl     bx, 1
        if      FW_VERSION < 212
        mov     bx, word ptr cs:[word bx + 7]
        else
        mov     bx, word ptr cs:[word bx + 0dh]
        endif
        mov     cl, byte ptr [bp + 6]
        callf   SEG_EF1E:far_ef210
br_051d4:
        pop     bp
        retf
        if      FW_VERSION < 212
        phase   40h
        else
        phase   46h
        endif
far_051d6:
        push    bp
        mov     bp, sp
        cmp     byte ptr [B_8D78], 0
        jnz     br_05202
        mov     bl, byte ptr [bp + 0ah]
        dec     bl
        js      br_05202
        sub     bh, bh
        shl     bx, 1
        if      FW_VERSION < 212
        mov     bx, word ptr cs:[word bx + TBL_0519d-160h]
        else
        mov     bx, word ptr cs:[word bx + TBL_0519d-1f0h]
        endif
        push    si
        mov     si, word ptr [bp + 6]
loop_051f4:
        mov     cl, byte ptr [si]
        inc     si
        callf   SEG_EF1E:far_ef210
        dec     word ptr [bp + 8]
        jnz     loop_051f4
        pop     si
br_05202:
        pop     bp
        retf
far_05204:
        cmp     byte ptr [B_8D78], 0
        jnz     br_05234
        sub     bh, bh
        dec     bx
        js      br_05234
        push    bx
        shl     bx, 1
        if      FW_VERSION < 212
        mov     bx, word ptr cs:[word bx + TBL_051a5-160h]
        callf   SEG_EF1E:far_ef210
        else
        mov     bx, word ptr cs:[word bx + TBL_051a5-1f0h]
        callf   SEG_EF1E:far_ef1e0
        endif
        pop     bx
        mov     al, byte ptr [bx + TBL_4C18]
        test    al, 1
        jnz     br_05234
        or      al, 1
        mov     byte ptr [bx + TBL_4C18], al
        shl     bx, 1
        if      FW_VERSION < 212
        mov     dx, word ptr cs:[word bx + TBL_051ad-160h]
        else
        mov     dx, word ptr cs:[word bx + TBL_051ad-1f0h]
        endif
        out     dx, al
br_05234:
        retf
fn_05235:
        push    bp
        mov     bp, sp
        mov     bl, byte ptr [bp + 8]
        mov     cl, byte ptr [bp + 6]
        pushf
        cli

        callf SEG_0519:far_05204
        popf
        pop     bp
        retf
        if      FW_VERSION < 212
        phase   2
L_04ef2:
        endif

RUN_BR_05C43 macro   {GLOBALSYMBOLS}
        push    bp
        mov     bp, sp
        mov     bx, word ptr [bp + 6]
        mov     al, byte ptr [bx]
        and     al, 0f8h
        cmp     al, 98h
        jz      br_05c43
        cmp     al, 90h
        jz      br_05c43
        cmp     al, 80h
        jz      br_05c43
        cmp     al, 0a0h
        jnz     br_05c62
br_05c43:
        mov     al, byte ptr [bp + 8]
        or      al, al
        jz      br_05c4f
        cmp     al, byte ptr [bx + 1]
        jnz     br_05c62
br_05c4f:
        mov     al, byte ptr [B_8CD8]
        add     byte ptr [bx + 2], al
        jns     br_05c62
        or      al, al
        mov     al, 0
        js      br_05c5f
        mov     al, 7fh
br_05c5f:
        mov     byte ptr [bx + 2], al
br_05c62:
        pop     bp
        retf
        endm
        if      FW_VERSION < 212
        RUN_BR_05C43
        phase   0dh
        endif

RUN_FAR_0579F macro   {GLOBALSYMBOLS}
far_0579f:
        push    bp
        mov     bp, sp
        push    si
        push    di
        mov     bx, word ptr [bp + 6]
        mov     di, word ptr [bx + 2]
        if      FW_VERSION >= 212
        and     di, 1fh
        mov     si, 2
        mov     al, byte ptr [di + TBL_5244]
        cmp     al, 0
        jz      br_057df
        mov     al, byte ptr [di + TBL_5264]
        mov     dl, byte ptr [bx + 3]
        cmp     dl, al
        jle     br_057de
        xor     ax, ax
        mov     al, byte ptr [di + TBL_5224]
        cmp     al, 0
        jz      br_057de
        dec     al
        cmp     di, 0
        jnz     br_057dc
        mov     cl, 40h
        mov     di, ax
        dec     si
        jmp     br_057e5
        db      090h
br_057dc:
        mov     di, ax
br_057de:
        dec     si
br_057df:
        mov     bx, word ptr [bp + 6]
        mov     cl, byte ptr [bx + 4]
br_057e5:
        else
        and.w   di, 1fh
        mov     si, 2
L_04f3f:
        mov     bx, word ptr [bp + 6]
        endif
        mov     dl, byte ptr [bx + 3]
        xor     dh, dh
        cmp     di, 0
        jnz     br_05806
        if      FW_VERSION >= 212
        mov     cl, 40h
        endif
        mov     bx, 0
br_057f4:
        if      FW_VERSION >= 212
        mov     al, byte ptr [bx + TBL_52B1]
        cmp     al, byte ptr [B_AE8C]
        else
        mov     al, byte ptr [bx +B_5C79_V112]
        cmp     al, byte ptr [B_AEF1_V112]
        endif
        jnc     br_0580b
        cmp     bx, 2
        jz      br_0580b
        inc     bx
        jmp     br_057f4
br_05806:
        mov     bx, di
        add     bx, 2
br_0580b:
        if      FW_VERSION >= 212
        sub     ch, ch
        sub     cx, 40h
        shl     cx, 1
        push    cx
        endif
        push    dx
        mov     al, byte ptr [bx + TBL_AE2C]
        cbw
        push    ax
        callf SEG_03CF:far_03cf2
        if      FW_VERSION >= 212
        add     sp, 6
        cmp     ax, 0ffffh
        jz      br_0583b
        else
        add     sp, 4
        endif
        dec     si
        jz      br_0583b
        if      FW_VERSION >= 212
        mov     al, byte ptr [di + TBL_5224]
        else
        mov     al, byte ptr [di +TBL_5C59_V112]
        endif
        dec     al
        mov     di, ax
        js      br_0583b
        if      FW_VERSION >= 212
        mov     cl, 40h
        mov     bx, word ptr [bp + 6]
        jmp     br_057e5
        else
        jmp     L_04f3f
        endif
br_0583b:
        pop     di
        pop     si
        pop     bp
        retf
far_0583f:
        push    bp
        mov     bp, sp
        if      FW_VERSION < 212
        push    si
        endif
        xor     ax, ax
        mov     bx, word ptr [bp + 6]
        mov     al, byte ptr [bx + 2]
        endm
        if      FW_VERSION < 212
        RUN_FAR_0579F
        cmp     al, byte ptr [B_5D9B_V112]
        jnz     L_04fb8
        mov     al, byte ptr [bx + 3]
        mov     byte ptr [B_AEF1_V112], al
        mov     si, 0
L_04fa3:
        mov     al, byte ptr [si + TBL_AE2C]
        cmp     al, 22h
        ja      L_04fb2
        push    ax
        callf   0e36ch:L_e3917
        pop     ax
L_04fb2:
        inc     si
        cmp     si, 3
        jnz     L_04fa3
L_04fb8:
        pop     si
        pop     bp
        retf
        phase   0bh
        else

        phase   8
far_05248:
        push    es
        RUN_BR_05253
        pop     es
        retf
        phase   3
        endif
far_05303:
        push    bp
        mov     bp, sp
        if      FW_VERSION < 212
        mov     ax, word ptr [bp + 0ah]
        cmp     byte ptr [B_52B5_V112], 0
        jz      L_04fcb
        jmp     L_050d2
L_04fcb:
        endif
        push    es
        push    si
        push    di
        if      FW_VERSION < 212
        mov     si, word ptr [bp + 8]
        else
        mov     ax, word ptr [bp + 0ah]
        mov     si, word ptr [bp + 8]
        cmp     byte ptr [bp + 6], 8
        jz      br_05331
        cmp     byte ptr [B_94A6], 0
        jnz     br_05328
        endif
        cmp     byte ptr [bp + 6], 1
        jz      br_05370
        cmp     byte ptr [bp + 6], 4
        jz      br_0532b
        if      FW_VERSION >= 212
br_05328:
        endif
        jmp     br_05436
br_0532b:
        if      FW_VERSION < 212
        mov     cx, word ptr [bp + 0ah]
        mov     di, 4090h
        mov     dx, word ptr [di]
        mov     bx, word ptr [di + 2]
        else
        mov     di, 0
        jmp     br_05334
        db      090h
br_05331:
        mov     di, 2b36h
br_05334:
        mov     ax, SEG_15E8
        mov     es, ax
        mov     cx, word ptr [bp + 0ah]
        mov     dx, word ptr es:[di]
        mov     bx, word ptr es:[di + 2]
        endif
        add     bx, cx
        cmp     bx, dx
        jbe     br_0534e
        sub     ax, ax
        jmp     br_05436
br_0534e:
        if      FW_VERSION >= 212
        mov     word ptr es:[di + 2], bx
        mov     bx, word ptr es:[di + 4]
        else
        mov     word ptr [di + 2], bx
        mov     bx, word ptr [di + 4]
        endif
loop_05356:
        mov     al, byte ptr [si]
        inc     si
        or      bx, bx
        jnz     br_0535f
        mov     bx, dx
br_0535f:
        dec     bx
        if      FW_VERSION < 212
        mov     byte ptr [bx+di + 8], al
        loop    loop_05356
        mov     word ptr [di + 4], bx
        else
        mov     byte ptr es:[bx+di + 8], al
        loop    loop_05356
        mov     word ptr es:[di + 4], bx
        endif
        mov     ax, word ptr [bp + 0ah]
        jmp     near br_05436
br_05370:
        mov     al, byte ptr [si]
        and     al, 0f8h
        cmp     al, 0a8h
        jnz     br_053af
        mov     ax, word ptr [si + 1]
        shl     al, 1
        shr     ax, 1
        push    word ptr [W_94BE]
        push    word ptr [W_94BC]
        push    ax
        if      FW_VERSION >= 212
        push    word ptr [B_94A7]
        callf   SEG_D6EE:far_d6ee4
        add     sp, 2
        else
        callf   0da1eh:far_d6ee4
        endif
        pop     ax
        cmp     ax, word ptr [W_94D8]
        jnz     br_053a9
        mov     dx, word ptr [W_94BE]
        mov     ax, word ptr [W_94BC]
        mov     word ptr [W_94C2], dx
        mov     word ptr [W_94C0], ax
br_053a9:
        add     sp, 4
        jmp     br_053ca
        db      090h
br_053af:
        cmp     al, 0f8h
        jnz     br_053ca
        push    word ptr [W_94BE]
        push    word ptr [W_94BC]
        sub     ax, ax
        push    ax
        if      FW_VERSION < 212
        callf   0da1eh:far_d6ee4
        add     sp, 6
        else
        push    word ptr [B_94A7]
        callf   SEG_D6EE:far_d6ee4
        add     sp, 8
        endif
br_053ca:
        mov     cx, word ptr [bp + 0ah]
        les     di, dword ptr [W_94BC]
loop_053d1:
        mov     bl, byte ptr [si]
        inc     si
        mov     byte ptr es:[di], bl
        mov     dx, es
        inc     di
        jnz     br_053e2
        add     dx, 1000h
        mov     es, dx
br_053e2:
        if      FW_VERSION >= 212
        cmp     dx, word ptr [W_94AE]
        else
        cmp     dx, word ptr [W_A45A_V112]
        endif
        jc      br_053fa
        jnz     br_053f0
        if      FW_VERSION < 212
        cmp     di, word ptr [W_A458_V112]
        else
        cmp     di, word ptr [W_94AC]
        endif
        jc      br_053fa
br_053f0:
        if      FW_VERSION >= 212
        mov     dx, word ptr [W_94B2]
        mov     es, dx
        mov     di, word ptr [W_94B0]
br_053fa:
        cmp     di, word ptr [W_94B8]
        jnz     br_05410
        cmp     dx, word ptr [W_94BA]
        else
        mov     dx, word ptr [W_A45E_V112]
        mov     es, dx
        mov     di, word ptr [W_A45C_V112]
br_053fa:
        cmp     di, word ptr [W_A464_V112]
        jnz     br_05410
        cmp     dx, word ptr [W_A466_V112]
        endif
        jnz     br_05410
        or      byte ptr [B_8D78], 4
        sub     ax, ax
        jmp     br_05436
        db      090h
br_05410:
        loop    loop_053d1
        mov     si, word ptr [bp + 8]
        cmp     byte ptr [si], 0ffh
        jnz     br_05422
        if      FW_VERSION < 212
        mov     word ptr [W_A460_V112], di
        mov     word ptr [W_A462_V112], dx
        else
        mov     word ptr [W_94B4], di
        mov     word ptr [W_94B6], dx
        endif
br_05422:
        mov     word ptr [W_94BC], di
        mov     word ptr [W_94BE], dx
        mov     ax, word ptr [bp + 0ah]
        sub     word ptr [W_8BD5], ax
        sbb     word ptr [W_8BD7], 0
br_05436:
        pop     di
        pop     si
        pop     es
        if      FW_VERSION < 212
L_050d2:
        endif
        pop     bp
        retf
        if      FW_VERSION < 212
L_050d4:
        push    es
        push    ax
        push    di
        push    dx
        les     di, dword ptr [W_94BC]
        mov     byte ptr es:[di], al
        mov     dx, es
        inc     di
        jnz     L_050ea
        add     dx, 1000h
        mov     es, dx
L_050ea:
        cmp     dx, word ptr [W_A45A_V112]
        jc      L_05102
        jnz     L_050f8
        cmp     di, word ptr [W_A458_V112]
        jc      L_05102
L_050f8:
        mov     dx, word ptr [W_A45E_V112]
        mov     es, dx
        mov     di, word ptr [W_A45C_V112]
L_05102:
        cmp     di, word ptr [W_A464_V112]
        jnz     L_05116
        cmp     dx, word ptr [W_A466_V112]
        jnz     L_05116
        or      byte ptr [B_8D78], 4
        jmp     L_0511e
        db      090h
L_05116:
        mov     word ptr [W_94BC], di
        mov     word ptr [W_94BE], dx
L_0511e:
        pop     dx
        pop     di
        pop     ax
        pop     es
        retf
        phase   3
TBL_03000:
        dw      br_05856
        dw      L_05144
        dw      br_05856
        dw      tgt_030cb
        dw      L_051ea
        dw      L_0521b
        dw      L_05232
        dw      L_05229
        RUN_FAR_03012
        pop     si
        pop     di
        RUN_TGT_030CB
        mov     si, word ptr [bp + 6]
        push    word ptr [si + 1]
br_05a44:
        mov     bx, word ptr [bp + 0ah]
        and.w   bx, 0fh
        mov     ax, 1
        mov     cl, bl
        shl     ax, cl
        or      word ptr [W_88DD_V112], ax
        mov     al, byte ptr [si]
        and     al, 0f0h
        cmp     al, 0f0h
        jz      L_0530a
        jmp     L_0532a
        db      090h
L_0530a:
        push    bx
        mov     bx, word ptr [bp + 8]
        mov     byte ptr [bx+si], 0f7h
        mov     byte ptr [si + 1], 0f0h
        pop     bx
        cmp     byte ptr [si + 2], 47h
        jnz     br_05a92
        mov     byte ptr [si + 3], bl
br_05a92:
        mov     al, byte ptr [bx +TBL_5CF2_V112]
        push    ax
        push    word ptr [bp + 8]
        jmp     L_05339
        db      090h
L_0532a:
        or      al, bl
        mov     byte ptr [si + 1], al
        mov     al, byte ptr [bx +TBL_5CF2_V112]
        push    ax
        mov     ax, word ptr [bp + 8]
        dec     ax
        push    ax
L_05339:
        mov     ax, si
        inc     ax
        push    ax
        callf   4e4h:far_051d6
        add     sp, 6
        mov     ax, word ptr [bp + 0ah]
        cmp     ah, 0ffh
        jz      br_05aa7
        mov     al, ah
        mov     ah, 0ffh
        mov     word ptr [bp + 0ah], ax
        else
        phase   0bh
        endif
        if      FW_VERSION >= 214
L_0543b_v214:
        push    bp
        mov     bp, sp
        push    si
        push    di
        push    es
        mov     cx, word ptr [bp + 6]
        mov     si, word ptr [bp + 8]
        push    ds
        pop     es
        mov     bx, word ptr [bp + 0ah]
        callf   543h:L_05456
        pop     es
        pop     di
        pop     si
        pop     bp
        retf
L_05456:
        cld
        sub     ax, ax
        mov     dx, 228h
        out     dx, al
        mov     dx, 224h
        out     dx, al
        mov     dx, 226h
        out     dx, al
        mov     dx, 228h
        in      al, dx
        test    al, 42h
        jz      L_0547a_v214
        mov     di, 5
        cmp     al, 0ffh
        jz      L_05477
        mov     di, 8
L_05477:
        jmp     near L_05518
L_0547a_v214:
        mov     dx, 220h
        mov     al, cl
        out     dx, al
        mov     dx, 222h
        mov     al, 1
        out     dx, al
        mov     al, 5
        out     dx, al
        mov     di, 0
        mov     dx, 228h
        mov     cx, 9c4h
L_05492:
        in      al, dx
        test    al, 40h
        jnz     L_054ae
        call    L_0576d
        loop    L_05492
        mov     dx, 222h
        mov     al, 4
        out     dx, al
        call    L_0576d
        call    L_0576d
        mov     dx, 228h
        in      al, dx
        test    al, 40h
L_054ae:
        mov     dx, 222h
        mov     al, 0
        out     dx, al
        jnz     L_054bc
        mov     di, 3
        jmp     L_05518
        db      090h
L_054bc:
        mov     dx, 228h
        in      al, dx
        test    al, 40h
        jnz     L_054c7_v214
        jmp     L_05518
        db      090h
L_054c7_v214:
        test    al, 20h
        jnz     L_054cd
        jmp     L_054bc
L_054cd:
        in      al, dx
        and     al, 1ch
        cmp     al, 0
        jnz     L_054e3
        cmp     byte ptr [si], 0ah
        jnz     L_054de
        call    L_055be
        jmp     L_054bc
L_054de:
        call    L_05641_v214
        jmp     L_054bc
L_054e3:
        cmp     al, 4
        jnz     L_054f6
        cmp     byte ptr [si], 8
        jnz     L_054f1_v214
        call    L_0567e
        jmp     L_054bc
L_054f1_v214:
        call    L_05736_v214
        jmp     L_054bc
L_054f6:
        cmp     al, 8
        jnz     br_05501
        push    si
        call    L_0551b
        pop     si
        jmp     L_054bc
br_05501:
        cmp     al, 0ch
        jnz     br_0550a
        call    L_05557
        jmp     L_054bc
br_0550a:
        cmp     al, 1ch
        jnz     L_05513
        call    L_05594
        jmp     L_054bc
L_05513:
        mov     di, 5
        jmp     L_054bc
L_05518:
        mov     ax, di
        retf
L_0551b:
        mov     dx, 226h
        mov     al, 2
        out     dx, al
        mov     dx, 222h
        mov     al, 1
        out     dx, al
        mov     dx, 228h
L_0552a:
        in      al, dx
        test    al, 20h
        jz      L_0552a
        in      al, dx
        and     al, 1ch
        cmp     al, 8
        jz      L_05537
        ret
L_05537:
        mov     dx, 220h
        mov     al, byte ptr [si]
        inc     si
        out     dx, al
        mov     dx, 222h
        mov     al, 11h
        out     dx, al
        mov     dx, 228h
L_05547:
        in      al, dx
        test    al, 20h
        jnz     L_05547
        mov     dx, 222h
        mov     al, 1
        out     dx, al
        mov     dx, 228h
        jmp     L_0552a
L_05557:
        mov     dx, 226h
        mov     al, 3
        out     dx, al
        mov     dx, 228h
        mov     di, 0
L_05563:
        in      al, dx
        test    al, 20h
        jz      L_05563
        in      al, dx
        and     al, 1ch
        cmp     al, 0ch
        jz      L_05573
        and     di, 0eh
        ret
L_05573:
        mov     dx, 220h
        in      al, dx
        sub     ah, ah
        mov     di, ax
        mov     dx, 222h
        mov     al, 10h
        out     dx, al
        mov     dx, 228h
L_05584:
        in      al, dx
        test    al, 20h
        jnz     L_05584
        mov     dx, 222h
        mov     al, 0
        out     dx, al
        mov     dx, 228h
        jmp     L_05563
L_05594:
        mov     dx, 226h
        mov     al, 7
        out     dx, al
        mov     dx, 228h
L_0559d:
        in      al, dx
        test    al, 20h
        jz      L_0559d
        mov     dx, 220h
        in      al, dx
        mov     dx, 222h
        mov     al, 10h
        out     dx, al
        mov     dx, 228h
L_055af:
        in      al, dx
        test    al, 20h
        jnz     L_055af
        mov     dx, 222h
        mov     al, 0
        out     dx, al
        mov     dx, 228h
        ret
L_055be:
        push    ds
        push    si
        mov     si, bx
        mov     ax, es
        mov     ds, ax
        mov     dx, 226h
        mov     al, 0
        out     dx, al
        mov     dx, 22eh
        in      al, dx
        mov     dx, 222h
        mov     al, 1
        out     dx, al
        mov     dx, 228h
L_055d9:
        in      al, dx
        test    al, 20h
        jz      L_055d9
        mov     dx, 224h
        mov     al, 2
        out     dx, al
        mov     dx, 22ah
        out     dx, al
        mov     dx, 230h
        mov     cx, 10h
L_055ee:
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        lodsb
        out     dx, al
        loop    L_055ee
        mov     dx, 224h
        mov     al, 0
        out     dx, al
        mov     dx, 222h
        mov     al, 0
        out     dx, al
        mov     bx, si
        pop     si
        pop     ds
        ret
L_05641_v214:
        mov     dx, 226h
        mov     al, 0
        out     dx, al
        mov     dx, 222h
        mov     al, 1
        out     dx, al
        mov     dx, 228h
L_05650:
        in      al, dx
        test    al, 20h
        jz      L_05650
        in      al, dx
        and     al, 1ch
        cmp     al, 0
        jz      L_0565d
        ret
L_0565d:
        mov     dx, 220h
        mov     al, byte ptr es:[bx]
        inc     bx
        out     dx, al
        mov     dx, 222h
        mov     al, 11h
        out     dx, al
        mov     dx, 228h
L_0566e:
        in      al, dx
        test    al, 20h
        jnz     L_0566e
        mov     dx, 222h
        mov     al, 1
        out     dx, al
        mov     dx, 228h
        jmp     L_05650
L_0567e:
        push    di
        mov     di, bx
        mov     dx, 226h
        mov     al, 1
        out     dx, al
        mov     dx, 22eh
        in      al, dx
        mov     dx, 228h
L_0568e:
        in      al, dx
        test    al, 20h
        jz      L_0568e
L_05693:
        mov     dx, 224h
        mov     al, 2
        out     dx, al
        mov     dx, 22eh
        out     dx, al
        mov     dx, 230h
        mov     cx, 0ah
L_056a3:
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        in      al, dx
        stosb
        loop    L_056a3
        in      al, dx
        stosb
        mov     dx, 22ah
L_05710:
        in      al, dx
        test    al, 40h
        jz      L_05710
        mov     dx, 224h
        mov     al, 0
        out     dx, al
        mov     dx, 22ch
        in      al, dx
        stosb
        mov     dx, 228h
L_05723:
        in      al, dx
        test    al, 20h
        jz      L_05723
        in      al, dx
        and     al, 1ch
        cmp     al, 4
        jnz     L_05732
        jmp     near L_05693
L_05732:
        mov     bx, di
        pop     di
        ret
L_05736_v214:
        mov     dx, 226h
        mov     al, 1
        out     dx, al
        mov     dx, 228h
L_0573f:
        in      al, dx
        test    al, 20h
        jz      L_0573f
        in      al, dx
        and     al, 1ch
        cmp     al, 4
        jz      L_0574c
        ret
L_0574c:
        mov     dx, 220h
        in      al, dx
        mov     byte ptr es:[bx], al
        inc     bx
        mov     dx, 222h
        mov     al, 10h
        out     dx, al
        mov     dx, 228h
L_0575d:
        in      al, dx
        test    al, 20h
        jnz     L_0575d
        mov     dx, 222h
        mov     al, 0
        out     dx, al
        mov     dx, 228h
        jmp     L_0573f
L_0576d:
        push    cx
        mov     cx, 3fh
L_05771:
        loop    L_05771
        pop     cx
        ret
L_05775_v214:
        mov     dx, 200h
        in      al, dx
        mov     bl, al
        mov     al, 0ffh
        out     dx, al
        mov     dx, 228h
        in      al, dx
        cmp     al, 0ffh
        mov     dx, 200h
        mov     al, bl
        out     dx, al
        mov     ax, 1
        jz      L_0579e
        mov     dx, 222h
        mov     al, 80h
        out     dx, al
        call    L_0576d
        mov     al, 0
        out     dx, al
        mov     ax, 0
L_0579e:
        retf
        phase   0fh
        endif
        if      FW_VERSION >= 212
        RUN_FAR_0579F
        cmp     al, byte ptr [B_52B4]
        jnz     br_05856
        mov     al, byte ptr [bx + 3]
        mov     byte ptr [B_AE8C], al
br_05856:
        pop     bp
        retf
        endif
        if      FW_VERSION = 212
        phase   4
        endif
        if      FW_VERSION >= 214
        phase   8
        endif
        if      FW_VERSION >= 212
far_05858:
        push    bp
        mov     bp, sp
        add     sp, 0ffeeh
        push    di
        add     di, TBL_A656
        mov     word ptr [bp - 2], ax
        cmp     ax, 0
        jge     br_0586e
        mov     ax, 7fh
br_0586e:
        mul     byte ptr [di + 2ch]
        mov     cl, 64h
        div     cl
        sub     ah, ah
        cmp     ax, 80h
        jc      br_0587f
        mov     ax, 7fh
br_0587f:
        mov     word ptr [bp - 4], ax
        neg     ax
        add     ax, 7fh
        push    ax
        mul     word ptr [di + 32h]
        mov     cx, 7eh
        div     cx
        add     ax, word ptr [di + 22h]
        mov     word ptr [bp - 6], ax
        mov     cx, 28h
        mul     cx
        add     ax, word ptr [di + 12h]
        adc     dx, word ptr [di + 14h]
        mov     word ptr [di + 1eh], ax
        mov     word ptr [di + 20h], dx
        pop     ax
        mul     word ptr [di + 30h]
        mov     cx, 7eh
        div     cx
        add     ax, word ptr [di + 26h]
        cmp     ax, 0
        jg      br_058bb
        mov     ax, 1
br_058bb:
        mov     word ptr [bp - 8], ax
        add     bx, word ptr [di + 1ah]
        add     bx, word ptr [di + 1ch]
        add     bx, 78h
        cmp     bx, 0b4h
        jle     br_058d3
        mov     bx, 0b4h
        jmp     br_058db
        db      090h
br_058d3:
        cmp     bx, 0
        jge     br_058db
        mov     bx, 0
br_058db:
        shl     bx, 1
        mov     bx, word ptr [bx + TBL_1095]
        mov     word ptr [di + 2ah], bx
        mov     ax, word ptr [bp - 4]
        sub     ax, 7fh
        imul    byte ptr [di + 2dh]
        add     ax, 319ch
        mov     cl, 64h
        div     cl
        sub     ah, ah
        mov     word ptr [bp - 4], ax
        mov     ax, 3333h
        mul     bx
        mov     al, ah
        mov     ah, dl
        mov     dl, dh
        shr     dx, 1
        rcr     ax, 1
        shr     dx, 1
        rcr     ax, 1
        shr     dx, 1
        rcr     ax, 1
        shr     dx, 1
        rcr     ax, 1
        mul     word ptr [bp - 4]
        shl     ax, 1
        rcl     dx, 1
        mov     al, ah
        mov     ah, dl
        mov     word ptr [bp - 10h], ax
        sub     dx, dx
        div     word ptr [bp - 8]
        mov     word ptr [bp - 12h], ax
        cmp     word ptr [bp - 2], 0
        jl      br_05976
        test    byte ptr [di + 3ah], 1
        jz      br_05976
        mov     bx, word ptr [di + 24h]
        sub     bx, word ptr [bp - 6]
        sub     bx, word ptr [bp - 8]
        sub     bx, 0ah
        jns     br_05946
        sub     bx, bx
br_05946:
        mov     ax, word ptr [W_AE8D]
        sub     ax, 64h
        mov     cl, byte ptr [B_AE8C]
        sub     ch, ch
        mul     cx
        mov     cx, 7fh
        div     cx
        add     ax, 64h
        cmp     ax, bx
        jge     br_05962
        mov     bx, ax
br_05962:
        mov     word ptr [bp - 0ah], bx
        mov     ax, word ptr [bp - 8]
        add     ax, 0ah
        mov     word ptr [bp - 0eh], ax
        add     ax, bx
        mov     word ptr [bp - 0ch], ax
        jmp     br_0598b
        db      090h
br_05976:
        mov     ax, word ptr [di + 28h]
        mov     word ptr [bp - 0ah], ax
        mov     ax, word ptr [di + 24h]
        sub     ax, word ptr [bp - 6]
        mov     word ptr [bp - 0ch], ax
        sub     ax, word ptr [di + 28h]
        mov     word ptr [bp - 0eh], ax
br_0598b:
        cmp     word ptr [bp - 0ah], 0
        jnz     br_05997
        mov     ax, 8001h
        jmp     br_059a2
        db      090h
br_05997:
        mov     ax, word ptr [bp - 10h]
        sub     dx, dx
        div     word ptr [bp - 0ah]
        inc     ax
        neg     ax
br_059a2:
        mov     word ptr [di + 2eh], ax
        mov     dx, word ptr [bp - 0ch]
        sub     ax, ax
        shr     dx, 1
        rcr     ax, 1
        shr     dx, 1
        rcr     ax, 1
        shr     dx, 1
        rcr     ax, 1
        shr     dx, 1
        rcr     ax, 1
        div     word ptr [di + 2ah]
        sub     dx, dx
        mov     cx, 0ah
        div     cx
        jnz     br_059c9
        mov     ax, 1
br_059c9:
        mov     bx, ax
        mov     dx, word ptr [bp - 0eh]
        sub     ax, ax
        shr     dx, 1
        rcr     ax, 1
        shr     dx, 1
        rcr     ax, 1
        shr     dx, 1
        rcr     ax, 1
        shr     dx, 1
        rcr     ax, 1
        div     word ptr [di + 2ah]
        sub     dx, dx
        mov     cx, 0ah
        div     cx
        jnz     br_059ef
        mov     ax, 1
br_059ef:
        cmp     bx, ax
        jg      br_059f6
        mov     bx, ax
        inc     bx
br_059f6:
        mov     cx, word ptr [bp - 12h]
        mov     dx, word ptr [bp - 4]
        pop     di
        mov     sp, bp
        pop     bp
        retf
        endif
        if      FW_VERSION = 212
        phase   0dh
        endif
        if      FW_VERSION >= 214
        phase   1
        endif
        if      FW_VERSION >= 212
far_05a01:
        RUN_BR_05A1A
        endif
        if      FW_VERSION = 212
        phase   1
        endif
        if      FW_VERSION >= 214
        phase   5
        endif
        if      FW_VERSION >= 212
far_05a35:
        push    bp
        mov     bp, sp
        push    si
        push    di
        mov     si, word ptr [bp + 6]
        mov     al, byte ptr [si + 1]
        push    ax
        mov     ax, word ptr [bp + 0ah]
br_05a44:
        cmp     al, 0ffh
        jz      br_05aa7
        mov     bl, al
        and     bx, 3fh
        mov     byte ptr [bx + TBL_7E15], 1
        mov     al, ah
        mov     ah, 0ffh
        push    ax
        mov     bh, bl
        and     bl, 0fh
        shr     bh, 4
        inc     bh
        mov     cx, word ptr [bp + 8]
        mov     al, byte ptr [si]
        and     al, 0f8h
        cmp     al, 0f0h
        jnz     br_05a83
        add     si, cx
        mov     byte ptr [si], 0f7h
        sub     si, cx
        mov     byte ptr [si + 1], 0f0h
        cmp     byte ptr [si + 2], 47h
        jnz     br_05a92
        mov     byte ptr [si + 3], bl
        jmp     br_05a92
        db      090h
br_05a83:
        mov     al, byte ptr [si]
        and     al, 0f0h
        cmp     al, 90h
        jnz     br_05a8c
        dec     cx
br_05a8c:
        add     al, bl
        mov     byte ptr [si + 1], al
        dec     cx
br_05a92:
        mov     al, bh
        sub     ah, ah
        push    ax
        push    cx
        mov     ax, si
        inc     ax
        push    ax
        callf   SEG_05CC:far_05ce2
        add     sp, 6
        pop     ax
        endif
        jmp     br_05a44
br_05aa7:
        pop     ax
        mov     byte ptr [si + 1], al
        pop     di
        pop     si
        pop     bp
        retf
        if      FW_VERSION < 212
        phase   0eh
        elseif  FW_VERSION = 212
        phase   0bh
        else
        phase   0fh
        endif
        if      FW_VERSION >= 212
far_05aaf:
        push    bp
        mov     bp, sp
        mov     bx, word ptr [bp + 6]
        mov     al, byte ptr [bx + 1]
        callf   SEG_05AA:far_05b80
        push    ax
        push    word ptr [bp + 8]
        push    bx
        callf   SEG_05AA:far_05acc
        add     sp, 6
        pop     bp
        retf
        RUN_FAR_05ACC
far_05b80:
        push    bx
        mov     bl, al
        test    bl, 80h
        jnz     br_05b9a
        and     bx, 7fh
        mov     al, byte ptr [bx + TBL_95B0]
        mov     ah, byte ptr [bx + TBL_9614]
        mov     bl, byte ptr [bx + TBL_954C]
        jmp     br_05ba9
        db      090h
br_05b9a:
        and     bx, 7fh
        mov     al, byte ptr [bx + TBL_9926]
        mov     ah, byte ptr [bx + TBL_998A]
        mov     bl, byte ptr [bx + TBL_98C2]
br_05ba9:
        and     bl, 4
        shl     bl, 4
        mov     bh, bl
        or      ax, bx
        pop     bx
        retf
        endif
        if      FW_VERSION = 212
        phase   1
        endif
        if      FW_VERSION >= 214
        phase   5
        endif
        if      FW_VERSION >= 212
far_05bb5:
        cmp     byte ptr [B_7E63], 0
        jnz     br_05bee
        cmp     byte ptr [B_94A6], 0
        jnz     br_05bee
        mov     bl, byte ptr [B_8E67]
        sub     bh, bh
        mov     byte ptr [B_A063], 1
        mov     ax, word ptr [B_8E68]
        cmp     byte ptr [bx + TBL_7E6C], 0ffh
        jnz     br_05bdd
        mov     byte ptr [bx + TBL_7E6C], 0fdh
br_05bdd:
        endif
        if      FW_VERSION = 212
        mov     byte ptr [bx +TBL_7FEC_V212], al
        endif
        if      FW_VERSION >= 214
        mov     byte ptr [bx +TBL_836C], al
        endif
        if      FW_VERSION >= 212
        mov     byte ptr [bx + TBL_83EC], ah
        shl     bx, 1
        mov     ax, word ptr [B_8E6A]
        mov     word ptr [bx + TBL_846C], ax
br_05bee:
        retf
        endif
        if      FW_VERSION = 212
        phase   0bh
        endif
        if      FW_VERSION >= 214
        phase   0fh
        endif
far_05bef:
        push    bp
        mov     bp, sp
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf SEG_0530:far_05303
        add     sp, 6
        test    ax, ax
        jnz     br_05c27
        cmp     word ptr [bp + 6], 4
        jnz     br_05c27
        callf   SEG_04D5:far_04d5e
        if      FW_VERSION < 212
        mov     byte ptr [B_52E1_V112], 2
        else
        mov     byte ptr [B_A064], 2
        endif
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    1
        callf SEG_0530:far_05303
        add     sp, 6
br_05c27:
        pop     bp
        retf
        if      FW_VERSION < 212
        phase   8
L_05398:
        dw      L_05410
        dw      L_0543b_v112
        dw      L_05410
        dw      L_055e3
        dw      L_056b3
        dw      L_056b3
        dw      L_056b3
        dw      L_056b3
        dw      L_056b3
        dw      L_056b3
        dw      L_056b3
        dw      L_056b3
        dw      L_056b3
far_05c29:
        push    bp
        mov     bp, sp
        push    es
        push    si
        push    di
        mov     si, word ptr [bp + 8]
        mov     di, word ptr [bp + 6]
        shl     di, 1
        mov     bx, word ptr [bp + 0ah]
        mov     cx, word ptr [bp + 0ch]
        call    word ptr cs:[word di + L_05398]
        pop     di
        pop     si
        pop     es
        pop     bp
        retf
L_053d0:
        push    bp
        mov     bp, sp
        push    es
        push    si
        push    di
        xor     cx, cx
L_053d8:
        mov     si, 4
        mov     di, word ptr [bp + 6]
        shl     di, 1
        call    word ptr cs:[word di + 8]
        cmp     ax, 0ffffh
        jz      L_05409
        mov     bx, word ptr [bp + 8]
        mov     byte ptr [bx], al
        inc     word ptr [bp + 8]
        inc     cx
        mov     si, 1
        mov     di, word ptr [bp + 6]
        shl     di, 1
        call    word ptr cs:[word di + L_05398]
        test    al, 80h
        jnz     L_05409
        cmp     cx, word ptr [bp + 0ah]
        jc      L_053d8
L_05409:
        mov     ax, cx
        pop     di
        pop     si
        pop     es
        pop     bp
        retf
L_05410:
        shl     si, 1
        add     si, L_05419
        jmp     word ptr cs:[si]
L_05419:
        dw      L_05437
        dw      L_05434
        dw      L_05431
        dw      L_05437
        dw      L_05434
        dw      L_05438
        dw      L_05438
        dw      L_05438
        dw      L_05431
        dw      L_05437
        dw      L_05438
        dw      L_05438
L_05431:
        mov     dx, 0ffffh
L_05434:
        mov     ax, 0ffffh
L_05437:
        ret
L_05438:
        xor     ax, ax
        ret
L_0543b_v112:
        shl     si, 1
        add     si, L_05444
        jmp     word ptr cs:[si]
L_05444:
        dw      L_0545c
        dw      L_0547b
        dw      L_05485
        dw      L_0548d
        dw      L_05496
        dw      L_054a6
        dw      L_054b2
        dw      L_054c7_v112
        dw      L_054f1_v112
        dw      L_054f9
        dw      L_05502
        dw      L_05512
L_0545c:
        mov     ax, word ptr [W_A464_V112]
        cmp     ax, word ptr [W_A460_V112]
        jnz     L_0547a_v112
        mov     ax, word ptr [W_A466_V112]
        cmp     ax, word ptr [W_A462_V112]
        jnz     L_0547a_v112
        mov     ax, word ptr [W_94BC]
        mov     word ptr [W_A460_V112], ax
        mov     ax, word ptr [W_94BE]
        mov     word ptr [W_A462_V112], ax
L_0547a_v112:
        ret
L_0547b:
        les     bx, dword ptr [W_A464_V112]
        mov     al, byte ptr es:[bx]
        xor     ah, ah
        ret
L_05485:
        mov     ax, word ptr [W_A464_V112]
        mov     dx, word ptr [W_A466_V112]
        ret
L_0548d:
        mov     word ptr [W_A464_V112], cx
        mov     word ptr [W_A466_V112], bx
        ret
L_05496:
        les     si, dword ptr [W_A464_V112]
        call    L_0552f
        mov     word ptr [W_A464_V112], si
        mov     word ptr [W_A466_V112], dx
        ret
L_054a6:
        call    L_054b2
        mov     word ptr [W_A464_V112], si
        mov     word ptr [W_A466_V112], dx
        ret
L_054b2:
        mov     di, cx
        les     si, dword ptr [W_A464_V112]
L_054b8:
        call    L_0552f
        jnz     L_054c2
        mov     byte ptr [bx], al
        inc     bx
        loop    L_054b8
L_054c2:
        mov     ax, di
        sub     ax, cx
        ret
L_054c7_v112:
        mov     bx, word ptr [W_A466_V112]
        cmp     bx, word ptr [W_94BE]
        mov     ax, word ptr [W_A464_V112]
        jnz     L_054da
        cmp     ax, word ptr [W_94BC]
        jz      L_054ea
L_054da:
        call    TBL_05cc2
        cmp     ax, 40h
        jnc     L_054ee
        or      ax, ax
        jz      L_054ea
        mov     ax, 0fffeh
        ret
L_054ea:
        mov     ax, 0ffffh
        ret
L_054ee:
        xor     ax, ax
        ret
L_054f1_v112:
        mov     ax, word ptr [W_94BC]
        mov     dx, word ptr [W_94BE]
        ret
L_054f9:
        mov     word ptr [W_94BC], cx
        mov     word ptr [W_94BE], bx
        ret
L_05502:
        elseif  FW_VERSION = 212
        phase   5
        else
        phase   9
        endif
        if      FW_VERSION >= 212
far_05c29:
        RUN_BR_05C43
        endif
        if      FW_VERSION = 212
        phase   0
        endif
        if      FW_VERSION >= 214
        phase   4
        endif
        if      FW_VERSION >= 212
far_05c64:
        push    es
        push    ax
        push    di
        push    dx
        push    bx
        mov     bl, al
        endif
        les     di, dword ptr [W_94BC]
        call    fn_05c80
        mov     word ptr [W_94BC], di
        mov     word ptr [W_94BE], dx
        if      FW_VERSION < 212
        ret
L_05512:
        push    cx
        mov     si, bx
        les     di, dword ptr [W_94BC]
L_05519:
        mov     bl, byte ptr [si]
        inc     si
        call    fn_05c80
        jnz     L_05523
        loop    L_05519
L_05523:
        pop     ax
        sub     ax, cx
        mov     word ptr [W_94BC], di
        mov     word ptr [W_94BE], dx
        ret
L_0552f:
        mov     al, byte ptr es:[si]
        mov     dx, es
        inc     si
        jnz     L_0553d
        add     dx, 1000h
        mov     es, dx
L_0553d:
        cmp     dx, word ptr [W_A45A_V112]
        jc      L_05555
        jnz     L_0554b
        cmp     si, word ptr [W_A458_V112]
        jc      L_05555
L_0554b:
        mov     dx, word ptr [W_A45E_V112]
        mov     es, dx
        mov     si, word ptr [W_A45C_V112]
L_05555:
        xor     ah, ah
        ret
        else
        pop     bx
        pop     dx
        pop     di
        pop     ax
        pop     es
        retf
        endif
fn_05c80:
        push    es
        push    di
        mov     byte ptr es:[di], bl
        mov     dx, es
        inc     di
        jnz     br_05c90
        add     dx, 1000h
        mov     es, dx
br_05c90:
        if      FW_VERSION < 212
        cmp     dx, word ptr [W_A45A_V112]
        else
        cmp     dx, word ptr [W_94AE]
        endif
        jc      br_05ca8
        jnz     br_05c9e
        if      FW_VERSION < 212
        cmp     di, word ptr [W_A458_V112]
        else
        cmp     di, word ptr [W_94AC]
        endif
        jc      br_05ca8
br_05c9e:
        if      FW_VERSION < 212
        mov     dx, word ptr [W_A45E_V112]
        mov     es, dx
        mov     di, word ptr [W_A45C_V112]
br_05ca8:
        cmp     di, word ptr [W_A464_V112]
        jnz     br_05cbc
        cmp     dx, word ptr [W_A466_V112]
        else
        mov     dx, word ptr [W_94B2]
        mov     es, dx
        mov     di, word ptr [W_94B0]
br_05ca8:
        cmp     di, word ptr [W_94B8]
        jnz     br_05cbc
        cmp     dx, word ptr [W_94BA]
        endif
        jnz     br_05cbc
        pop     di
        pop     es
        mov     dx, es
        xor     ax, ax
        dec     ax
        ret
br_05cbc:
        add     sp, 4
        xor     ax, ax
        ret
TBL_05cc2:
        if      FW_VERSION < 212
        mov     cl, 4
        mov     si, word ptr [W_A464_V112]
        shr     si, cl
        add     si, word ptr [W_A466_V112]
        mov     di, word ptr [W_94BC]
        shr     di, cl
        add     di, word ptr [W_A466_V112]
        cmp     si, di
        ja      L_055ce
        mov     ax, word ptr [W_A458_V112]
        shr     ax, cl
        add     ax, word ptr [W_A45A_V112]
        sub     ax, di
        mov     dx, word ptr [W_A45C_V112]
        shr     dx, cl
        add     dx, word ptr [W_A45E_V112]
        sub     si, dx
        add     ax, si
        ret
L_055ce:
        sub     si, di
        mov     ax, si
        ret
far_05c64:
        push    es
        push    ax
        push    di
        push    dx
        push    bx
        mov     bl, al
        call    L_05502
        pop     bx
        pop     dx
        pop     di
        pop     ax
        pop     es
        retf
L_055e3:
        shl     si, 1
        add     si, L_055ec
        jmp     word ptr cs:[si]
L_055ec:
        dw      L_05604
        dw      L_05611
        dw      L_0561b
        dw      L_05623
        dw      L_0562c
        dw      L_0563c
        dw      L_05641_v112
        dw      L_05652
        dw      L_05652
        dw      L_05655
        dw      L_05652
        dw      L_05656
L_05604:
        mov     ax, word ptr [W_A474_V112]
        mov     word ptr [W_A478_V112], ax
        mov     ax, word ptr [W_A476_V112]
        mov     word ptr [W_A47A_V112], ax
        ret
L_05611:
        les     bx, dword ptr [W_A478_V112]
        mov     al, byte ptr es:[bx]
        xor     ah, ah
        ret
L_0561b:
        mov     ax, word ptr [W_A478_V112]
        mov     dx, word ptr [W_A47A_V112]
        ret
L_05623:
        mov     word ptr [W_A478_V112], cx
        mov     word ptr [W_A47A_V112], bx
        ret
L_0562c:
        les     si, dword ptr [W_A478_V112]
        call    L_0565a
L_05633:
        mov     word ptr [W_A478_V112], si
        mov     word ptr [W_A47A_V112], dx
        ret
L_0563c:
        call    L_05641_v112
        jmp     L_05633
L_05641_v112:
        mov     di, cx
        les     si, dword ptr [W_A478_V112]
L_05647:
        call    L_0565a
        mov     byte ptr [bx], al
        inc     bx
        loop    L_05647
        mov     ax, di
        ret
L_05652:
        mov     ax, 0ffffh
L_05655:
        ret
L_05656:
        mov     ax, 0
        ret
L_0565a:
        mov     al, byte ptr es:[si]
        mov     dx, es
        inc     si
        jnz     L_05668
        add     dx, 1000h
        mov     es, dx
L_05668:
        cmp     dx, word ptr [W_A46E_V112]
        jc      L_05680
        jnz     L_05676
        cmp     si, word ptr [W_A46C_V112]
        jc      L_05680
L_05676:
        mov     dx, word ptr [W_A472_V112]
        mov     es, dx
        mov     si, word ptr [W_A470_V112]
L_05680:
        cmp     si, word ptr [W_A474_V112]
        jnz     L_05696
        cmp     dx, word ptr [W_A476_V112]
        jnz     L_05696
        mov     dx, word ptr [W_A47E_V112]
        mov     es, dx
        mov     si, word ptr [W_A47C_V112]
L_05696:
        xor     ah, ah
        ret
L_05699:
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 090h, 040h, 098h, 042h, 0cch, 043h, 000h
        db      "E4FmG"
        db      0a6h, 048h, 0dfh, 049h, 018h, 04bh
L_056b3:
        mov     di, word ptr cs:[di + L_05699]
        shl     si, 1
        add     si, L_056c1
        jmp     word ptr cs:[si]
L_056c1:
        dw      L_056d9
        dw      L_056e8
        dw      L_056f5
        dw      L_056fe
        dw      L_056ff
        dw      L_05715
        dw      L_05736_v112
        dw      L_05755
        dw      L_05774
        dw      L_05775_v112
        dw      L_05776
        dw      L_0577f
L_056d9:
        pushf
        cli
        xor     ax, ax
        mov     word ptr [di + 2], ax
        mov     word ptr [di + 4], ax
        mov     word ptr [di + 6], ax
        popf
        ret
L_056e8:
        pushf
        cli
        mov     dx, word ptr [di + 2]
        mov     bx, word ptr [di + 6]
        call    L_05797
        popf
        ret
L_056f5:
        call    L_056e8
        lea     ax, [bx+di + 8]
        mov     dx, ds
        ret
L_056fe:
        ret
L_056ff:
        pushf
        cli
        mov     dx, word ptr [di + 2]
        mov     bx, word ptr [di + 6]
        call    L_05797
        jnz     L_05713
        dec     dx
        mov     word ptr [di + 2], dx
        mov     word ptr [di + 6], bx
L_05713:
        popf
        ret
L_05715:
        push    cx
        mov     si, bx
        mov     dx, word ptr [di + 2]
        mov     bx, word ptr [di + 6]
L_0571e:
        pushf
        cli
        call    L_05797
        jnz     L_05750
        mov     byte ptr [si], al
        inc     si
        dec     dx
        mov     word ptr [di + 2], dx
        mov     word ptr [di + 6], bx
        popf
        loop    L_0571e
        pop     ax
        sub     ax, cx
        ret
L_05736_v112:
        push    cx
        mov     si, bx
        mov     dx, word ptr [di + 2]
        mov     bx, word ptr [di + 6]
loop_05db7:
        pushf
        cli
        call    L_05797
        jnz     L_05750
        mov     byte ptr [si], al
        inc     si
        dec     dx
        popf
        loop    loop_05db7
        jmp     br_05df4
        db      090h
L_05750:
        popf
br_05df4:
        pop     ax
        sub     ax, cx
        ret
L_05755:
        mov     dx, word ptr [di]
        and     dx, 3fffh
        mov     bx, word ptr [di + 2]
        cmp     bx, dx
        jnc     L_0576c
        sub     dx, 10h
        cmp     bx, dx
        jnc     L_05770
        xor     ax, ax
        ret
L_0576c:
        mov     ax, 0ffffh
        ret
L_05770:
        mov     ax, 0fffeh
        ret
L_05774:
        ret
L_05775_v112:
        ret
L_05776:
        mov     al, bl
        pushf
        cli
        call    L_057b2
        popf
        ret
L_0577f:
        mov     si, bx
        push    cx
L_05782:
        mov     al, byte ptr [si]
        inc     si
        pushf
        cli
        call    L_057b2
        jnz     L_05792
        popf
        loop    L_05782
        jmp     L_05793
        db      090h
L_05792:
        popf
L_05793:
        pop     ax
        sub     ax, cx
        ret
L_05797:
        or      dx, dx
        jz      L_057ac
        or      bx, bx
        jnz     L_057a5
        mov     bx, word ptr [di]
        and     bx, 3fffh
L_057a5:
        dec     bx
        mov     al, byte ptr [bx+di + 8]
        xor     ah, ah
        ret
L_057ac:
        mov     ax, 0ffffh
        or      ax, ax
        ret
L_057b2:
        mov     dx, word ptr [di]
        and     dx, 3fffh
        cmp     word ptr [di + 2], dx
        jnc     L_057d3
        mov     bx, word ptr [di + 4]
        or      bx, bx
        jnz     L_057c6
        mov     bx, dx
L_057c6:
        dec     bx
        mov     byte ptr [bx+di + 8], al
        inc     word ptr [di + 2]
        mov     word ptr [di + 4], bx
        xor     ax, ax
        ret
L_057d3:
        mov     ax, 0ffffh
        or      ax, ax
        ret
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 0b2h, 005h, 0bdh, 0dch, 038h, 0dah, 08ah, 005h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 006h, 000h, 054h, 0e2h, 0c8h, 0dbh, 08ah
        db      005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 011h, 0e2h, 078h
        db      0e0h, 08ah, 005h, 000h, 000h, 05ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 004h, 000h, 03dh
        db      0e2h, 0fch, 0e3h, 08ah, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 008h
        db      000h, 089h, 0e1h, 054h, 0e6h, 08ah, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 00ch, 000h, 03fh, 0e2h, 0ach, 0e8h, 08ah, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 008h, 000h, 04ah, 0e2h, 004h, 0ebh, 08ah, 005h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 00dh, 000h, 034h, 0c0h, 054h, 0ffh, 08ah, 005h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 004h, 000h, 020h, 0c0h, 004h
        db      000h, 006h, 0c0h, 0ffh, 0ffh, 0ffh, 0ffh, 078h, 000h, 00ah, 000h, 0c0h, 0d4h, 08ah, 005h, 0b0h
        db      000h, 07eh, 005h, 0ffh, 0ffh, 0ffh, 0ffh, 0cbh, 090h, 001h, 000h, 008h, 000h, 000h, 000h, 000h
DGROUP0 equ     $+7
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0e0h
B_0009_V112 equ     $-DGROUP0
        db      000h, 000h, 040h, 0b0h, 000h, 07bh, 000h, 0dch, 000h, 000h, 000h, 000h, 000h, 0fbh, 003h, 0fbh
        db      003h
L_002C_V112 equ     $-DGROUP0+12h
L_002D_V112 equ     $-DGROUP0+13h
L_0030_V112 equ     $-DGROUP0+16h
L_0036_V112 equ     $-DGROUP0+1ch
        db      27h dup (000h)
        else
        db      001h, 000h, 002h, 000h, 004h, 000h, 008h, 000h, 010h, 000h, 020h, 000h, 040h, 000h, 080h, 000h
        db      000h, 001h, 000h, 002h, 000h, 004h, 000h, 008h, 000h, 010h, 000h, 020h, 000h, 040h, 000h, 080h
        endif
        if      FW_VERSION = 212
        phase   2eh
        endif
        if      FW_VERSION >= 214
        phase   22h
        endif
        if      FW_VERSION >= 212
far_05ce2:
        push    bp
        mov     bp, sp
        push    si
        mov     dx, word ptr [bp + 0ah]
        dec     dx
        jns     br_05cef
        jmp     br_05e28
br_05cef:
        mov     si, word ptr [bp + 6]
        mov     al, byte ptr [si]
        mov     ah, al
        and     ah, 0f0h
        cmp     ah, 90h
        jz      br_05d01
        jmp     near br_05d9e
br_05d01:
        mov     cl, byte ptr [si + 1]
        sub     ch, ch
        shl     cx, 1
        xchg    dl, dh
        add     cx, dx
        mov     bx, ax
        and     bx, 0fh
        shl     bx, 1
        endif
        if      FW_VERSION = 212
        mov     dx, word ptr cs:[word bx + TBL_05cc2-50h]
        endif
        if      FW_VERSION >= 214
        mov     dx, word ptr cs:[word bx + TBL_05cc2-60h]
        endif
        if      FW_VERSION >= 212
        mov     bx, cx
        test    word ptr [bx + TBL_86A2], dx
        jnz     br_05d27
        or      word ptr [bx + TBL_86A2], dx
        jmp     br_05e17
br_05d27:
        mov     dx, word ptr [bp + 0ah]
        dec     dx
        shl     dx, 4
        mov     ax, word ptr [si]
        and     ax, 0ff0fh
        or      ax, dx
        mov     cx, word ptr [W_8AA2]
        sub     bx, bx
loop_05d3b:
        cmp     word ptr [bx + TBL_8AA4], ax
        jz      br_05d84
        add     bx, 2
        loop    loop_05d3b
        mov     cx, word ptr [W_8AA2]
        sub     bx, bx
loop_05d4c:
        cmp     word ptr [bx + TBL_8AA4], 0ffffh
        jz      br_05d91
        add     bx, 2
        loop    loop_05d4c
        mov     cx, word ptr [bp + 0ah]
        mov     al, byte ptr [si]
        and     al, 0fh
        or      al, 80h
        mov     ah, byte ptr [si + 1]
        push    bp
        sub     sp, 4
        mov     bp, sp
        mov     byte ptr [bp], al
        mov     byte ptr [bp + 1], ah
        mov     byte ptr [bp + 2], 40h
        push    cx
        push    3
        push    bp
        callf SEG_0519:far_051d6
        add     sp, 0ah
        pop     bp
        jmp     near br_05e17
br_05d84:
        inc     byte ptr [bx + TBL_8AB8]
        jnz     br_05d8e
        dec     byte ptr [bx + TBL_8AB8]
br_05d8e:
        jmp     near br_05e17
br_05d91:
        mov     word ptr [bx + TBL_8AB8], 2
        mov     word ptr [bx + TBL_8AA4], ax
        jmp     short br_05e17
        db      090h
br_05d9e:
        cmp     ah, 80h
        jnz     br_05e17
        mov     dx, word ptr [bp + 0ah]
        dec     dx
        shl     dx, 4
        mov     ax, word ptr [si]
        and     ax, 0ff0fh
        or      ax, dx
        mov     cx, word ptr [W_8AA2]
        sub     bx, bx
loop_05db7:
        cmp     word ptr [bx + TBL_8AA4], ax
        jz      br_05dc5
        add     bx, 2
        loop    loop_05db7
        jmp     br_05df4
        db      090h
br_05dc5:
        inc     byte ptr [bx + TBL_8AB9]
        mov     ax, word ptr [bx + TBL_8AB8]
        cmp     ah, al
        jc      br_05e28
        mov     word ptr [bx + TBL_8AA4], 0ffffh
        mov     cl, ah
        sub     ch, ch
        push    cx
br_05ddc:
        pop     cx
        dec     cx
        jcxz    br_05df4
        push    cx
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf SEG_0519:far_051d6
        add     sp, 6
        jmp     br_05ddc
br_05df4:
        mov     cl, byte ptr [si + 1]
        sub     ch, ch
        shl     cx, 1
        mov     dx, word ptr [bp + 0ah]
        dec     dx
        xchg    dl, dh
        add     cx, dx
        mov     bl, byte ptr [si]
        and     bx, 0fh
        shl     bx, 1
        endif
        if      FW_VERSION = 212
        mov     dx, word ptr cs:[word bx + TBL_05cc2-50h]
        endif
        if      FW_VERSION >= 214
        mov     dx, word ptr cs:[word bx + TBL_05cc2-60h]
        endif
        if      FW_VERSION >= 212
        mov     bx, cx
        not     dx
        and     word ptr [bx + TBL_86A2], dx
br_05e17:
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf SEG_0519:far_051d6
        add     sp, 6
br_05e28:
        pop     si
        pop     bp
        retf
        endif
        if      FW_VERSION = 212
        phase   7
        endif
        if      FW_VERSION >= 214
        phase   0bh
        endif
        if      FW_VERSION >= 212
        RUN_FAR_05E2B
        endif
        if      FW_VERSION = 212
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c2h, 005h, 044h, 0d7h
        db      018h, 0d4h, 0beh, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ch, 000h
        db      0aah, 0ddh, 0a8h, 0d5h, 0beh, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      004h, 000h, 05ch, 0ddh, 02ch, 0d9h, 0beh, 005h, 000h, 000h, 05ah, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 009h, 000h, 092h, 0ddh, 04ch, 0dch, 0beh, 005h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 002h, 000h, 0cch, 0dch, 040h, 0deh, 0beh, 005h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 002h, 000h, 096h, 0ddh, 034h, 0e0h, 0beh, 005h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00eh, 000h, 0a0h, 0ddh, 028h, 0e2h, 0beh, 005h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00dh, 000h, 035h, 0c0h, 028h, 0fbh
        db      0beh, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh
        db      004h, 000h, 021h, 0c0h, 004h, 000h, 006h, 0c0h, 0ffh, 0ffh, 0ffh, 0ffh, 078h, 000h, 00ah, 000h
        db      068h, 0cfh, 0beh, 005h, 0b0h, 000h, 0b2h, 005h, 0ffh, 0ffh, 0ffh, 0ffh, 0cbh, 090h, 001h, 000h
DGROUP0 equ     $+0ch
        db      008h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0dch, 000h, 000h, 000h
        db      000h, 000h, 000h, 07ah, 004h, 07ah, 004h
        endif
        if      FW_VERSION >= 214
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0b4h, 005h, 094h, 0d8h, 028h, 0d8h, 0f4h, 005h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ch, 000h, 0fdh, 0deh, 0b8h, 0d9h
        db      0f4h, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 004h, 000h, 0afh, 0deh
        db      03ch, 0ddh, 0f4h, 005h, 000h, 000h, 05ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 009h, 000h
        db      0e5h, 0deh, 05ch, 0e0h, 0f4h, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      007h, 000h, 01dh, 0deh, 050h, 0e2h, 0f4h, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 002h, 000h, 0e9h, 0deh, 044h, 0e4h, 0f4h, 005h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 00eh, 000h, 0f3h, 0deh, 038h, 0e6h, 0f4h, 005h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00dh, 000h, 035h, 0c0h, 038h, 0ffh, 0f4h, 005h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 004h, 000h, 021h, 0c0h
        db      004h, 000h, 006h, 0c0h, 0ffh, 0ffh, 0ffh, 0ffh, 078h, 000h, 00ah, 000h, 078h, 0d3h, 0f4h, 005h
        db      0b0h, 000h, 0e8h, 005h, 0ffh, 0ffh, 0ffh, 0ffh, 0cbh, 090h, 001h, 000h, 008h, 000h, 000h, 000h
DGROUP0 equ     $+8
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0e1h, 000h, 000h, 000h, 000h, 000h, 000h, 07fh
        db      004h, 07fh, 004h
        endif
        if      FW_VERSION >= 212
L_0020  equ     $-DGROUP0+15h
L_0021  equ     $-DGROUP0+16h
L_0024  equ     $-DGROUP0+19h
L_002A  equ     $-DGROUP0+1fh
        db      2ah dup (000h)
        endif
        db      00eh, 011h, 011h, 013h, 015h, 019h, 011h, 011h, 00eh, 004h, 00ch, 004h, 004h, 004h, 004h, 004h
        db      004h, 00eh, 00eh, 011h, 011h, 001h, 002h, 004h, 008h, 010h, 01fh, 01fh, 011h, 001h, 002h, 004h
        db      002h, 001h, 011h, 00eh, 002h, 006h, 00ah, 012h, 01fh, 002h, 002h, 002h, 002h, 01fh, 010h, 010h
        db      010h, 01eh, 001h, 001h, 011h, 00eh, 006h, 008h, 010h, 010h, 01eh, 011h, 011h, 011h, 00eh, 01fh
        db      001h, 001h, 002h, 004h, 008h, 008h, 008h, 008h, 00eh, 011h, 011h, 011h, 00eh, 011h, 011h, 011h
        db      00eh, 00eh, 011h, 011h, 011h, 00fh, 001h, 001h, 002h, 00ch, 00eh, 011h, 011h, 011h, 01fh, 011h
        db      011h, 011h, 011h, 01eh, 011h, 011h, 011h, 01eh, 011h, 011h, 011h, 01eh, 00eh, 011h, 010h, 010h
        db      010h, 010h, 010h, 011h, 00eh, 01ch, 012h, 011h, 011h, 011h, 011h, 011h, 012h, 01ch, 01fh, 010h
        db      010h, 010h, 01eh, 010h, 010h, 010h, 01fh, 011h, 011h, 011h, 011h, 01fh, 011h, 011h, 011h, 011h
        db      00eh, 004h, 004h, 004h, 004h, 004h, 004h, 004h, 00eh, 011h, 01bh, 015h, 015h, 011h, 011h, 011h
        db      011h, 011h, 011h, 019h, 019h, 015h, 013h, 013h, 011h, 011h, 011h, 00eh, 011h, 011h, 011h, 011h
        db      011h, 011h, 011h, 00eh, 01eh, 011h, 011h, 011h, 01eh, 010h, 010h, 010h, 010h, 01eh, 011h, 011h
        db      011h, 01eh, 014h, 012h, 011h, 011h, 00fh, 010h, 010h, 010h, 00eh, 001h, 001h, 001h, 01eh, 01fh
        db      004h, 004h, 004h, 004h, 004h, 004h, 004h, 004h, 000h, 000h, 000h, 00eh, 011h, 010h, 010h, 011h
        db      00eh, 000h, 000h, 000h, 00eh, 011h, 01fh, 010h, 010h, 00eh, 010h, 010h, 010h, 010h, 016h, 019h
        db      011h, 011h, 011h, 000h, 004h, 000h, 00ch, 004h, 004h, 004h, 004h, 00eh, 000h, 000h, 000h, 00eh
        db      011h, 011h, 011h, 011h, 00eh, 000h, 000h, 000h, 016h, 019h, 010h, 010h, 010h, 010h, 000h, 000h
        db      011h, 011h, 00ah, 004h, 00ah, 011h, 011h, 000h, 000h, 000h, 01fh, 000h, 01fh, 000h, 000h, 000h
        db      01fh, 00eh, 004h, 004h, 00eh, 01fh
TBL_015B equ     $-DGROUP0
        db      " 0123456789ABCDEHIMNOPRSTcehiorx=", 0
        if      FW_VERSION < 212
L_0189_V112 equ     $-DGROUP0
        db      038h, 000h, 041h, 000h, 04ah, 000h, 053h, 000h, 05ch, 000h, 065h, 000h, 06eh, 000h, 077h, 000h
        db      080h, 000h, 089h, 000h, 092h, 000h, 09bh, 000h, 0a4h, 000h, 0adh, 000h, 0b6h, 000h, 0bfh, 000h
        db      0c8h, 000h, 0d1h, 000h, 0dah, 000h, 0e3h, 000h, 0ech, 000h, 0f5h, 000h, 0feh, 000h, 007h, 001h
        db      010h, 001h, 019h, 001h, 022h, 001h, 02bh, 001h, 034h, 001h, 03dh, 001h, 046h, 001h, 04fh, 001h
L_01C9_V112 equ     $-DGROUP0
        db      058h, 001h, 061h, 001h, 064h, 001h, 0edh, 001h, 003h, 002h, 019h, 002h, 02fh, 002h, 045h, 002h
        db      05bh, 002h, 071h, 002h, 087h, 002h, 09dh, 002h, 0b3h, 002h, 0c9h, 002h, 0dfh, 002h, 0f5h, 002h
        db      00bh, 003h, 021h, 003h, 0f8h, 000h, 004h, 001h, 002h, 002h, 001h, 004h, 001h, 004h, 021h, 004h
        else
L_017D  equ     $-DGROUP0
        db      02ch, 000h, 035h, 000h, 03eh, 000h, 047h, 000h, 050h, 000h, 059h, 000h, 062h, 000h, 06bh, 000h
        db      074h, 000h, 07dh, 000h, 086h, 000h, 08fh, 000h, 098h, 000h, 0a1h, 000h, 0aah, 000h, 0b3h, 000h
        db      0bch, 000h, 0c5h, 000h, 0ceh, 000h, 0d7h, 000h, 0e0h, 000h, 0e9h, 000h, 0f2h, 000h, 0fbh, 000h
        db      004h, 001h, 00dh, 001h, 016h, 001h, 01fh, 001h, 028h, 001h, 031h, 001h, 03ah, 001h, 043h, 001h
L_01BD  equ     $-DGROUP0
        db      04ch, 001h, 055h, 001h, 058h, 001h, 0e1h, 001h, 0f7h, 001h, 00dh, 002h, 023h, 002h, 039h, 002h
        db      04fh, 002h, 065h, 002h, 07bh, 002h, 091h, 002h, 0a7h, 002h, 0bdh, 002h, 0d3h, 002h, 0e9h, 002h
        db      0ffh, 002h, 015h, 003h, 0f8h, 000h, 004h, 001h, 002h, 002h, 001h, 004h, 001h, 004h, 021h, 004h
        endif
B_01ED  equ     $-DGROUP0
        db      021h, 004h, 041h, 004h, 042h, 002h, 084h, 001h, 0f8h, 000h, 0f8h, 000h, 004h, 001h, 002h, 002h
        db      001h, 004h, 001h, 004h, 021h, 004h, 041h, 004h, 081h, 004h, 002h, 003h, 004h, 001h, 0f8h, 000h
        db      0f8h, 000h, 004h, 001h, 002h, 002h, 001h, 004h, 001h, 004h, 061h, 004h, 081h, 005h, 001h, 006h
        db      002h, 002h, 004h, 001h, 0f8h, 000h, 0f8h, 000h, 004h, 001h, 002h, 002h, 001h, 004h, 001h, 004h
        db      0e1h, 007h, 001h, 004h, 001h, 004h, 002h, 002h, 004h, 001h, 0f8h, 000h, 0f8h, 000h, 004h, 001h
        db      002h, 002h, 001h, 006h, 081h, 005h, 061h, 004h, 001h, 004h, 001h, 004h, 002h, 002h, 004h, 001h
        db      0f8h, 000h, 0f8h, 000h, 004h, 001h, 002h, 003h, 081h, 004h, 041h, 004h, 021h, 004h, 001h, 004h
        db      001h, 004h, 002h, 002h, 004h, 001h, 0f8h, 000h, 0f8h, 000h, 084h, 001h, 042h, 002h, 041h, 004h
        db      021h, 004h, 021h, 004h, 001h, 004h, 001h, 004h, 002h, 002h, 004h, 001h, 0f8h, 000h, 0f8h, 000h
        db      024h, 001h, 022h, 002h, 021h, 004h, 021h, 004h, 021h, 004h, 001h, 004h, 001h, 004h, 002h, 002h
        db      004h, 001h, 0f8h, 000h, 0f8h, 000h, 00ch, 001h, 012h, 002h, 011h, 004h, 021h, 004h, 021h, 004h
        db      001h, 004h, 001h, 004h, 002h, 002h, 004h, 001h, 0f8h, 000h, 0f8h, 000h, 004h, 001h, 006h, 002h
        db      009h, 004h, 011h, 004h, 021h, 004h, 001h, 004h, 001h, 004h, 002h, 002h, 004h, 001h, 0f8h, 000h
        db      0f8h, 000h, 004h, 001h, 002h, 002h, 003h, 004h, 00dh, 004h, 031h, 004h, 001h, 004h, 001h, 004h
        db      002h, 002h, 004h, 001h, 0f8h, 000h, 0f8h, 000h, 004h, 001h, 002h, 002h, 001h, 004h, 001h, 004h
        db      03fh, 004h, 001h, 004h, 001h, 004h, 002h, 002h, 004h, 001h, 0f8h, 000h, 0f8h, 000h, 004h, 001h
        db      002h, 002h, 001h, 004h, 001h, 004h, 031h, 004h, 00dh, 004h, 003h, 004h, 002h, 002h, 004h, 001h
        db      0f8h, 000h, 0f8h, 000h, 004h, 001h, 002h, 002h, 001h, 004h, 001h, 004h, 021h, 004h, 011h, 004h
        db      009h, 004h, 006h, 002h, 004h, 001h, 0f8h, 000h, 0f8h, 000h, 004h, 001h, 002h, 002h, 001h, 004h
        db      001h, 004h, 021h, 004h, 021h, 004h, 011h, 004h, 012h, 002h, 00ch, 001h, 0f8h
L_064C  equ     $-DGROUP0+322h
L_0636  equ     $-DGROUP0+30ch
L_065C  equ     $-DGROUP0+332h
L_0646  equ     $-DGROUP0+31ch
L_0A7F  equ     $-DGROUP0+755h
L_0A69  equ     $-DGROUP0+73fh
L_0643  equ     $-DGROUP0+319h
L_062D  equ     $-DGROUP0+303h
L_0645  equ     $-DGROUP0+31bh
L_062F  equ     $-DGROUP0+305h
L_064A  equ     $-DGROUP0+320h
L_0634  equ     $-DGROUP0+30ah
L_0656  equ     $-DGROUP0+32ch
L_0640  equ     $-DGROUP0+316h
L_065D  equ     $-DGROUP0+333h
L_0647  equ     $-DGROUP0+31dh
W_0AAB  equ     $-DGROUP0+781h
W_0AAE  equ     $-DGROUP0+784h
W_0AB0  equ     $-DGROUP0+786h
W_0AB2  equ     $-DGROUP0+788h
W_0AB4  equ     $-DGROUP0+78ah
        db      78ch dup (000h)
B_0ABC  equ     $-DGROUP0+6
B_0ABD  equ     $-DGROUP0+7
B_0ABE  equ     $-DGROUP0+8
B_0AC5  equ     $-DGROUP0+0fh
B_0AB6  equ     $-DGROUP0
        db      0f0h, 000h, 047h, 000h, 044h, 045h, 000h, 000h, 000h, 000h, 000h, 0b0h, 000h, 07bh, 000h, 000h
        if      FW_VERSION < 212
L_0AD2_V112 equ     $-DGROUP0
B_869F  equ     $-DGROUP0+5
B_86A0  equ     $-DGROUP0+0ah
B_86A1  equ     $-DGROUP0+0bh
W_856C  equ     $-DGROUP0+0ch
W_856E  equ     $-DGROUP0+0eh
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
TBL_0AE2_V112 equ     $-DGROUP0
        db      000h, 000h, 000h, 000h, 000h, 000h, 060h, 009h, 0c4h, 009h, 0b8h, 00bh, 0b5h, 00bh, 040h, 038h
        db      098h
TBL_0AF3_V112 equ     $-DGROUP0
        db      ":PF>F", 0
TBL_0AF9_V112 equ     $-DGROUP0
        db      02fh, 00dh, 000h, 0a0h, 0bbh, 00dh, 000h, 0c0h, 07ah, 010h, 000h, 088h, 076h, 010h, 000h, 00eh
        db      00bh, 012h, 00bh, 000h, 000h, 04eh, 04fh, 020h, 000h, 059h, 045h, 053h, 000h, 01ch, 00bh, 020h
        db      00bh, 000h, 000h, 04fh, 046h, 046h, 000h, 04fh, 04eh, 020h, 000h, 02ah, 00bh, 033h, 00bh, 000h
        db      000h
        else
L_0AC6  equ     $-DGROUP0
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0e0h, 000h, 000h, 040h
        db      0b0h, 000h, 07bh, 000h, 0b0h, 000h, 040h, 000h, 0e6h, 00ah, 0f2h, 00ah, 0feh, 00ah, 000h, 000h
        db      "ALL EVENTS ", 0
        db      "ALL EXCEPT ", 0
        db      "ONLY ERASE ", 0
        db      012h, 00bh, 01eh, 00bh, 02ah, 00bh, 000h, 000h
        db      "ALL EVENTS ", 0
        db      "ALL EXCEPT ", 0
        db      "ONLY VIEW  ", 0
        db      03ch, 00bh, 040h, 00bh, 000h, 000h, 04eh, 04fh, 020h, 000h, 059h, 045h, 053h, 000h, 04ah, 00bh
        db      04eh, 00bh, 000h, 000h, 04fh, 046h, 046h, 000h, 04fh, 04eh, 020h, 000h, 058h, 00bh, 061h, 00bh
        db      000h, 000h
        endif
        db      "MASTER  ", 0
        db      "SEQUENCE", 0
        if      FW_VERSION < 212
        db      042h, 00bh, 046h, 00bh, 000h, 000h, 042h, 050h, 04dh, 000h, 046h, 050h, 042h, 000h, 054h, 00bh
        db      05bh, 00bh, 062h, 00bh, 069h, 00bh, 000h, 000h, 032h, 034h, 020h, 020h, 020h, 020h, 000h, 032h
        else
TBL_0B6A equ     $-DGROUP0
        db      070h, 00bh, 074h, 00bh, 000h, 000h, 042h, 050h, 04dh, 000h, 046h, 050h, 042h, 000h, 082h, 00bh
        db      089h, 00bh, 090h, 00bh, 097h, 00bh, 000h, 000h, 032h, 034h, 020h, 020h, 020h, 020h, 000h, 032h
        endif
        db      035h, 020h, 020h, 020h, 020h, 000h, 033h, 030h, 020h, 020h, 020h, 020h, 000h
        db      "30DROP", 0
TBL_0B9E equ     $-DGROUP0
TBL_0BA8 equ     $-DGROUP0+0ah
        db      02ch, 001h, 030h, 000h, 032h, 000h, 03ch, 000h, 03ch, 000h, 0b8h, 00bh, 0e0h, 001h, 0f4h, 001h
        if      FW_VERSION < 212
L_0B80_V112 equ     $-DGROUP0
        db      058h, 002h, 058h, 002h, 0c6h, 00bh, 0cbh, 00bh, 0d0h, 00bh, 0d5h, 00bh, 0dah, 00bh, 0dfh, 00bh
        db      0e4h, 00bh, 0e9h, 00bh, 0eeh, 00bh, 0f3h, 00bh, 0f8h, 00bh, 0fdh, 00bh, 002h, 00ch, 007h, 00ch
        db      00ch, 00ch, 011h, 00ch, 016h, 00ch, 01bh, 00ch, 020h, 00ch, 025h, 00ch, 02ah, 00ch, 02fh, 00ch
        db      034h, 00ch, 039h, 00ch, 03eh, 00ch, 043h, 00ch, 048h, 00ch, 04dh, 00ch, 052h, 00ch, 057h, 00ch
        db      05ch, 00ch, 061h, 00ch, 000h, 000h
        else
        db      058h, 002h, 058h, 002h, 0bch, 00bh, 0beh, 00bh, 0c0h, 00bh, 0c2h, 00bh, 000h, 000h, 041h, 000h
L_0BBE  equ     $-DGROUP0
        db      042h, 000h, 043h, 000h, 044h, 000h, 006h, 00ch, 00bh, 00ch, 010h, 00ch, 015h, 00ch, 01ah, 00ch
        db      01fh, 00ch, 024h, 00ch, 029h, 00ch, 02eh, 00ch, 033h, 00ch, 038h, 00ch, 03dh, 00ch, 042h, 00ch
        db      047h, 00ch, 04ch, 00ch, 051h, 00ch, 056h, 00ch, 05bh, 00ch, 060h, 00ch, 065h, 00ch, 06ah, 00ch
        db      06fh, 00ch, 074h, 00ch, 079h, 00ch, 07eh, 00ch, 083h, 00ch, 088h, 00ch, 08dh, 00ch, 092h, 00ch
        db      097h, 00ch, 09ch, 00ch, 0a1h, 00ch, 000h, 000h
        endif
        db      "HIHT", 0
        db      "SNR1", 0
        db      "SNR2", 0
        db      "BASS", 0
        db      "TOM1", 0
        db      "TOM2", 0
        db      "TOM3", 0
        db      "TOM4", 0
        db      "RID1", 0
        db      "RID2", 0
        db      "CRS1", 0
        db      "CRS2", 0
        db      "PRC1", 0
        db      "PRC2", 0
        db      "PRC3", 0
        db      "PRC4", 0
        db      "DR01", 0
        db      "DR02", 0
        db      "DR03", 0
        db      "DR04", 0
        db      "DR05", 0
        db      "DR06", 0
        db      "DR07", 0
        db      "DR08", 0
        db      "DR09", 0
        db      "DR10", 0
        db      "DR11", 0
        db      "DR12", 0
        db      "DR13", 0
        db      "DR14", 0
        db      "DR15", 0
        db      "DR16", 0
        if      FW_VERSION < 212
TBL_0C66_V112 equ     $-DGROUP0
        db      0aah, 00ch
        db      42h dup (000h)
        db      "NONE", 0
L_0CAF_V112 equ     $-DGROUP0
        db      0f5h, 00ch, 0ffh, 00ch, 009h, 00dh, 013h, 00dh, 01dh, 00dh, 027h, 00dh, 031h, 00dh, 03bh, 00dh
        db      045h, 00dh, 04fh, 00dh, 059h, 00dh, 063h, 00dh, 06dh, 00dh, 077h, 00dh, 081h, 00dh, 08bh, 00dh
        db      095h, 00dh, 09fh, 00dh, 0a9h, 00dh, 0b3h, 00dh, 0bdh, 00dh, 0c7h, 00dh, 0d1h, 00dh, 0dbh, 00dh
        db      0e5h, 00dh, 0efh, 00dh, 0f9h, 00dh, 003h, 00eh, 00dh, 00eh, 017h, 00eh, 021h, 00eh, 02bh, 00eh
        db      035h, 00eh, 03fh, 00eh, 000h, 000h
        else
TBL_0CA6 equ     $-DGROUP0
        db      0ech, 00ch
W_0CE8  equ     $-DGROUP0+40h
W_0CEA  equ     $-DGROUP0+42h
        db      44h dup (000h)
        db      "NONE", 0
L_0CF1  equ     $-DGROUP0
        db      037h, 00dh, 041h, 00dh, 04bh, 00dh, 055h, 00dh, 05fh, 00dh, 069h, 00dh, 073h, 00dh, 07dh, 00dh
        db      087h, 00dh, 091h, 00dh, 09bh, 00dh, 0a5h, 00dh, 0afh, 00dh, 0b9h, 00dh, 0c3h, 00dh, 0cdh, 00dh
        db      0d7h, 00dh, 0e1h, 00dh, 0ebh, 00dh, 0f5h, 00dh, 0ffh, 00dh, 009h, 00eh, 013h, 00eh, 01dh, 00eh
        db      027h, 00eh, 031h, 00eh, 03bh, 00eh, 045h, 00eh, 04fh, 00eh, 059h, 00eh, 063h, 00eh, 06dh, 00eh
        db      077h, 00eh, 081h, 00eh, 000h, 000h
        endif
        db      "HIHT-CLSD", 0
        db      "HIHT-MEDM", 0
        db      "HIHT-OPEN", 0
        db      "SNR1     ", 0
        db      "SNR2     ", 0
        db      "BASS     ", 0
        db      "TOM1     ", 0
        db      "TOM2     ", 0
        db      "TOM3     ", 0
        db      "TOM4     ", 0
        db      "RID1     ", 0
        db      "RID2     ", 0
        db      "CRS1     ", 0
        db      "CRS2     ", 0
        db      "PRC1     ", 0
        db      "PRC2     ", 0
        db      "PRC3     ", 0
        db      "PRC4     ", 0
        db      "DR01     ", 0
        db      "DR02     ", 0
        db      "DR03     ", 0
        db      "DR04     ", 0
        db      "DR05     ", 0
        db      "DR06     ", 0
        db      "DR07     ", 0
        db      "DR08     ", 0
        db      "DR09     ", 0
        db      "DR10     ", 0
        db      "DR11     ", 0
        db      "DR12     ", 0
        db      "DR13     ", 0
        db      "DR14     ", 0
        db      "DR15     ", 0
        db      "DR16     ", 0
        if      FW_VERSION < 212
        db      05dh, 00eh, 067h, 00eh, 071h, 00eh, 07bh, 00eh, 085h, 00eh, 08fh, 00eh, 099h, 00eh, 0a3h, 00eh
        db      0adh, 00eh, 000h, 000h
        else
        db      09fh, 00eh, 0a9h, 00eh, 0b3h, 00eh, 0bdh, 00eh, 0c7h, 00eh, 0d1h, 00eh, 0dbh, 00eh, 0e5h, 00eh
        db      0efh, 00eh, 000h, 000h
        endif
        db      "PRGM CHNG", 0
        db      "BEND     ", 0
        db      "CHAN PRES", 0
        db      "POLY PRES", 0
        db      "SYS EXCL ", 0
        db      "MIXER VOL", 0
        db      "MIXER PAN", 0
        db      "ECHO VOL ", 0
        db      "DRUM TUNE", 0
        if      FW_VERSION < 212
TBL_0EB7_V112 equ     $-DGROUP0
        db      0d1h, 00eh, 0d2h, 00eh, 0d7h, 00eh, 0e5h, 00eh, 0f0h, 00eh, 0ffh, 00eh, 00ch, 00fh, 017h, 00fh
        db      01dh, 00fh, 028h, 00fh, 030h, 00fh, 03ch, 00fh, 000h, 000h, 000h
        else
TBL_0EF9 equ     $-DGROUP0
        db      013h, 00fh, 014h, 00fh, 019h, 00fh, 027h, 00fh, 02eh, 00fh, 03dh, 00fh, 04ah, 00fh, 055h, 00fh
        db      05bh, 00fh, 066h, 00fh, 06eh, 00fh, 07ah, 00fh, 000h, 000h, 000h
        endif
        db      "Note", 0
        db      "Poly Pressure", 0
        if      FW_VERSION < 212
        db      "Controller", 0
        else
        db      "Contrl", 0
        endif
        db      "Program Change", 0
        db      "Channel Pres", 0
        db      "Pitch Bend", 0
        db      "SysEx", 0
        db      "Mix Volume", 0
        db      "Mix Pan", 0
        db      "Echo Volume", 0
        db      "Tune", 0
        if      FW_VERSION < 212
        db      04bh, 00fh, 04eh, 00fh, 051h, 00fh, 054h, 00fh, 000h, 000h, 030h, 034h, 000h, 030h, 038h, 000h
L_0F51_V112 equ     $-DGROUP0
        db      031h, 036h, 000h, 033h, 032h, 000h, 0e6h, 001h, 0e2h, 001h, 0e8h, 001h, 0c6h, 001h, 0cch, 001h
L_0F61_V112 equ     $-DGROUP0
        db      0c0h, 001h, 0ceh, 001h, 0cah, 001h, 0ech, 001h, 0eah, 001h, 0eeh, 001h, 0c2h, 001h, 0e4h, 001h
L_0F71_V112 equ     $-DGROUP0
        db      0c4h, 001h, 0c8h, 001h, 0e0h, 001h, 04dh, 000h, 04dh, 001h, 047h, 000h, 02fh, 000h, 046h, 001h
        db      04bh, 000h, 04bh, 001h, 04bh, 002h, 04bh, 003h, 04ah, 000h, 04ch, 001h, 04ch, 015h, 04ch, 003h
        db      04ch, 004h, 04ch, 005h, 04ch, 006h, 04ch, 007h, 04ch, 008h, 04ch, 009h, 055h, 001h, 055h, 002h
        db      055h, 003h, 055h, 004h, 055h, 005h, 055h, 006h, 055h, 007h, 055h, 008h, 053h, 001h, 049h, 000h
        db      04fh, 000h, 042h, 000h, 073h, 001h, 073h, 002h, 041h, 000h, 074h, 000h, 045h, 000h, 045h, 002h
L_0FC1_V112 equ     $-DGROUP0
        db      045h, 003h, 052h, 000h, 000h, 000h, 060h, 040h, 030h, 020h, 018h, 010h, 00ch, 008h, 001h, 004h
TBL_0FD1_V112 equ     $-DGROUP0
        db      001h, 004h, 004h, 001h, 001h, 060h, 0e7h, 096h, 001h, 000h, 0a0h, 086h, 001h, 000h, 085h, 045h
        db      001h, 000h, 0d9h, 045h, 001h, 000h
        else
        db      089h, 00fh, 08ch, 00fh, 08fh, 00fh, 092h, 00fh, 000h, 000h, 020h, 034h, 000h, 020h, 038h, 000h
        db      031h, 036h, 000h, 033h, 032h, 000h, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh
L_0F9F  equ     $-DGROUP0
        db      03fh, 000h, 0e6h, 001h, 0e2h, 001h, 0e8h, 001h, 0c6h, 001h, 0cch, 001h, 0c0h, 001h, 0ceh, 001h
L_0FAF  equ     $-DGROUP0
        db      0cah, 001h, 0ech, 001h, 0eah, 001h, 0eeh, 001h, 0c2h, 001h, 0e4h, 001h, 0c4h, 001h, 0c8h, 001h
L_0FBF  equ     $-DGROUP0
        db      0e0h, 001h, 02fh, 000h, 041h, 000h, 042h, 000h, 045h, 000h, 045h, 002h, 045h, 003h, 046h, 001h
        endif
        if      FW_VERSION = 212
        db      047h, 000h, 049h, 000h, 04ah, 000h, 04bh, 000h, 04bh, 00ah, 04bh, 001h, 04bh, 002h, 04bh, 003h
        db      04ch, 001h, 04ch, 00bh, 04ch, 002h, 04ch, 014h, 04ch, 003h, 04ch, 004h, 04ch, 005h, 04ch, 006h
        db      04ch, 042h, 04ch, 007h, 04ch, 008h, 04dh, 000h, 04dh, 001h, 04fh, 000h, 052h, 000h, 053h, 000h
        db      053h, 001h, 073h, 001h, 073h, 002h, 073h, 003h, 074h, 000h, 055h, 002h, 055h, 003h, 055h, 004h
L_100F_V212 equ     $-DGROUP0
        db      055h, 005h, 055h, 006h, 055h, 007h, 055h, 008h, 055h, 009h, 000h, 000h, 060h, 040h, 030h, 020h
L_101F_V212 equ     $-DGROUP0
        db      018h, 010h, 00ch, 008h, 001h, 004h, 001h, 004h, 004h, 001h, 001h, 060h, 0e7h, 096h, 001h, 000h
L_102F_V212 equ     $-DGROUP0
        db      0a0h, 086h, 001h, 000h, 085h, 045h, 001h, 000h, 0d9h, 045h, 001h, 000h, 0abh, 0aah, 0e6h, 096h
L_103F_V212 equ     $-DGROUP0
        db      001h, 000h, 000h, 000h, 0a0h, 086h, 001h, 000h, 055h, 055h, 085h, 045h, 001h, 000h, 005h, 0c0h
        db      0d8h, 045h, 001h, 000h
        endif
        if      FW_VERSION >= 214
        db      046h, 002h, 046h, 003h, 046h, 004h, 046h, 005h, 047h, 000h, 049h, 000h, 04ah, 000h, 04bh, 000h
        db      04bh, 00ah, 04bh, 001h, 04bh, 002h, 04bh, 003h, 04ch, 001h, 04ch, 00bh, 04ch, 002h, 04ch, 014h
        db      04ch, 003h, 04ch, 004h, 04ch, 005h, 04ch, 006h, 04ch, 042h, 04ch, 007h, 04ch, 008h, 04dh, 000h
        db      04dh, 001h, 04fh, 000h, 052h, 000h, 053h, 000h, 053h, 001h, 073h, 001h, 073h, 002h, 073h, 003h
        db      074h, 000h, 055h, 002h, 055h, 003h, 055h, 004h, 055h, 005h, 055h, 006h, 055h, 007h, 055h, 008h
L_101F  equ     $-DGROUP0
        db      055h, 009h, 000h, 000h, 060h, 040h, 030h, 020h, 018h, 010h, 00ch, 008h, 001h, 004h, 001h, 004h
L_102F  equ     $-DGROUP0
        db      004h, 001h, 001h, 060h, 0e7h, 096h, 001h, 000h, 0a0h, 086h, 001h, 000h, 085h, 045h, 001h, 000h
L_103F  equ     $-DGROUP0
        db      0d9h, 045h, 001h, 000h, 0abh, 0aah, 0e6h, 096h, 001h, 000h, 000h, 000h, 0a0h, 086h, 001h, 000h
        db      055h, 055h, 085h, 045h, 001h, 000h, 005h, 0c0h, 0d8h, 045h, 001h, 000h
        endif
TBL_105B equ     $-DGROUP0
        db      "xyzuFKJLGUSlsOkA^tBC![{/}]ER", 0
TBL_1078 equ     $-DGROUP0
        db      "ABCDEFGHIJKLMNOPQRSTUVWXYZ &", 0
        if      FW_VERSION < 212
        db      "Akai MPC60", 0
        db      "Copyright 1987, 1988", 0
        db      "AKAI ELECTRIC CO., LTD", 0
        db      "Version 1.12", 0
        else
TBL_1095 equ     $-DGROUP0
        db      000h, 008h, 00ch, 008h, 018h, 008h, 024h, 008h, 030h, 008h, 03ch, 008h, 048h, 008h, 055h, 008h
        db      061h, 008h, 06dh, 008h, 07ah, 008h, 086h, 008h, 093h, 008h, 0a0h, 008h, 0ach, 008h, 0b9h, 008h
        db      0c6h, 008h, 0d3h, 008h, 0e0h, 008h, 0eeh, 008h, 0fbh, 008h, 008h, 009h, 016h, 009h, 023h, 009h
        db      031h, 009h, 03eh, 009h, 04ch, 009h, 05ah, 009h, 068h, 009h, 075h, 009h, 083h, 009h, 092h, 009h
        db      0a0h, 009h, 0aeh, 009h, 0bch, 009h, 0cbh, 009h, 0d9h, 009h, 0e8h, 009h, 0f7h, 009h, 005h, 00ah
        db      014h, 00ah, 023h, 00ah, 032h, 00ah, 041h, 00ah, 051h, 00ah, 060h, 00ah, 06fh, 00ah, 07fh, 00ah
        db      08eh, 00ah, 09eh, 00ah, 0aeh, 00ah, 0beh, 00ah, 0ceh, 00ah, 0deh, 00ah, 0eeh, 00ah, 0feh, 00ah
        db      00eh, 00bh, 01fh, 00bh, 02fh, 00bh, 040h, 00bh, 050h, 00bh, 061h, 00bh, 072h, 00bh, 083h, 00bh
        db      094h, 00bh, 0a5h, 00bh, 0b6h, 00bh, 0c8h, 00bh, 0d9h, 00bh, 0ebh, 00bh, 0fdh, 00bh, 00eh, 00ch
        db      020h, 00ch, 032h, 00ch, 044h, 00ch, 056h, 00ch, 069h, 00ch, 07bh, 00ch, 08eh, 00ch, 0a0h, 00ch
        db      0b3h, 00ch, 0c6h, 00ch, 0d9h, 00ch, 0ech, 00ch, 0ffh, 00ch, 012h, 00dh, 026h, 00dh, 039h, 00dh
        db      04dh, 00dh, 060h, 00dh, 074h, 00dh, 088h, 00dh, 09ch, 00dh, 0b1h, 00dh, 0c5h, 00dh, 0d9h, 00dh
        db      0eeh, 00dh, 002h, 00eh, 017h, 00eh, 02ch, 00eh, 041h, 00eh, 056h, 00eh, 06ch, 00eh, 081h, 00eh
        db      096h, 00eh, 0ach, 00eh, 0c2h, 00eh, 0d8h, 00eh, 0eeh, 00eh, 004h, 00fh, 01ah, 00fh, 031h, 00fh
        db      047h, 00fh, 05eh, 00fh, 074h, 00fh, 08bh, 00fh, 0a2h, 00fh, 0bah, 00fh, 0d1h, 00fh, 0e8h, 00fh
        db      000h, 010h, 018h, 010h, 030h, 010h, 048h, 010h, 060h, 010h, 078h, 010h, 090h, 010h, 0a9h, 010h
        db      0c2h, 010h, 0dbh, 010h, 0f4h, 010h, 00dh, 011h, 026h, 011h, 03fh, 011h, 059h, 011h, 073h, 011h
        db      08dh, 011h, 0a7h, 011h, 0c1h, 011h, 0dbh, 011h, 0f6h, 011h, 010h, 012h, 02bh, 012h, 046h, 012h
        db      061h, 012h, 07ch, 012h, 098h, 012h, 0b3h, 012h, 0cfh, 012h, 0ebh, 012h, 007h, 013h, 023h, 013h
        db      040h, 013h, 05ch, 013h, 079h, 013h, 096h, 013h, 0b3h, 013h, 0d0h, 013h, 0edh, 013h, 00bh, 014h
        db      029h, 014h, 047h, 014h, 065h, 014h, 083h, 014h, 0a1h, 014h, 0c0h, 014h, 0dfh, 014h, 0feh, 014h
        db      01dh, 015h, 03ch, 015h, 05ch, 015h, 07bh, 015h, 09bh, 015h, 0bbh, 015h, 0dbh, 015h, 0fch, 015h
        endif
        if      FW_VERSION = 212
        db      01ch, 016h, 03dh, 016h, 05eh, 016h, 07fh, 016h, 0a1h, 016h, 030h, 036h, 02fh, 030h, 036h, 02fh
        db      039h, 031h, 000h
        endif
        if      FW_VERSION >= 214
TBL_11F5 equ     $-DGROUP0
        db      01ch, 016h, 03dh, 016h, 05eh, 016h, 07fh, 016h, 0a1h, 016h, 037h, 012h, 048h, 012h, 059h, 012h
        db      06ah, 012h, 07bh, 012h, 08ch, 012h, 09dh, 012h, 0aeh, 012h, 0bfh, 012h, 0d0h, 012h, 0e1h, 012h
        db      0f2h, 012h, 003h, 013h, 014h, 013h, 025h, 013h, 036h, 013h, 047h, 013h, 058h, 013h, 069h, 013h
        db      07ah, 013h, 08bh, 013h, 09ch, 013h, 0adh, 013h, 0beh, 013h, 0cfh, 013h, 0e0h, 013h, 0f1h, 013h
        db      000h, 000h
        db      "FLOPPY DISK     ", 0
        db      "HARD DISK PART A", 0
        db      "HARD DISK PART B", 0
        db      "HARD DISK PART C", 0
        db      "HARD DISK PART D", 0
        db      "HARD DISK PART E", 0
        db      "HARD DISK PART F", 0
        db      "HARD DISK PART G", 0
        db      "HARD DISK PART H", 0
        db      "HARD DISK PART I", 0
        db      "HARD DISK PART J", 0
        db      "HARD DISK PART K", 0
        db      "HARD DISK PART L", 0
        db      "HARD DISK PART M", 0
        db      "HARD DISK PART N", 0
        db      "HARD DISK PART O", 0
        db      "HARD DISK PART P", 0
        db      "HARD DISK PART Q", 0
        db      "HARD DISK PART R", 0
        db      "HARD DISK PART S", 0
        db      "HARD DISK PART T", 0
        db      "HARD DISK PART U", 0
        db      "HARD DISK PART V", 0
        db      "HARD DISK PART W", 0
        db      "HARD DISK PART X", 0
        db      "HARD DISK PART Y", 0
        db      "HARD DISK PART Z", 0
        db      031h, 031h, 02fh, 031h, 030h, 02fh, 039h, 031h, 000h
        endif
        if      FW_VERSION >= 212
STR_140B equ     $-DGROUP0
        db      "Akai MPC60", 0
STR_1416 equ     $-DGROUP0
        db      "Copyright 1987-1991", 0
STR_142A equ     $-DGROUP0
        db      "AKAI ELECTRIC CO., LTD", 0
        endif
        if      FW_VERSION = 212
        db      "Version 2.12", 0
        endif
        if      FW_VERSION < 214
        db      "Loading files ...", 0
        else
        db      "Version 2.14", 0
        db      "Waiting for drive to be ready ...", 0
        db      "Loading files ...                ", 0
        db      "SYSTEM  SET", 0
        endif
        db      03fh, 03fh, 03fh, 03fh, 03fh, 03fh
        db      "??SET", 0
STR_14AA equ     $-DGROUP0
        db      "SYSTEM  ALL", 0
STR_14B6 equ     $-DGROUP0
        db      "SYSTEM  ", 0
        if      FW_VERSION < 212
        db      " function"
        db      00ah
        db      "is not yet implemented"
        db      00ah, 000h, 00ah
        db      "(press any key to continue)", 0
        db      000h, 0deh, 010h, 0e2h, 010h, 000h, 000h, 042h, 050h, 04dh, 000h, 046h, 050h, 042h, 000h
L_10E6_V112 equ     $-DGROUP0
        db      "Sqnc:", 0
        db      02dh, 000h
        db      "  Tmpo:", 0
        db      020h, 000h, 02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 020h
        db      054h, 072h, 061h, 063h, 06bh, 020h, 044h, 061h, 074h, 061h, 020h, 02dh, 02dh, 02dh, 02dh, 02dh
        db      02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 000h
        db      "Trak:", 0
        db      02dh, 000h
        db      "  On/Off:", 0
        db      "Midi:", 0
        db      02dh, 000h
        db      "     2ndMidi:", 0
        db      02dh, 000h
        db      "<TrkOnOff><Solo=   ", 0
        db      "><TmpoSel><SortTrks>", 0
L_1174_V112 equ     $-DGROUP0
        db      "(Hold drums or keys to erase)", 0
L_1192_V112 equ     $-DGROUP0
        db      "(Hold notes to repeat)", 0
        db      "Bar:001.01.00           Time=00:00:00:00", 0
L_11D2_V112 equ     $-DGROUP0
        db      04fh, 046h, 046h, 000h, 04fh, 04eh, 020h, 000h
        db      "(off)   ", 0
L_11E3_V112 equ     $-DGROUP0
        db      "Drums   ", 0
L_11EC_V112 equ     $-DGROUP0
        db      03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 020h, 028h, 04eh, 065h, 078h, 074h
        db      020h, 053h, 065h, 071h, 075h, 065h, 06eh, 063h, 065h, 03ah, 025h, 032h, 064h, 029h, 020h, 03dh
        db      03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 000h
L_1216_V112 equ     $-DGROUP0
        db      "Play/Record (Record Ready)", 0
L_1231_V112 equ     $-DGROUP0
        db      "Play/Record", 0
L_123D_V112 equ     $-DGROUP0
        db      000h, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 020h
        db      045h, 063h, 068h, 06fh, 020h, 04dh, 069h, 078h, 065h, 072h, 020h, 03dh, 03dh, 03dh, 03dh, 03dh
TBL_125D_V112 equ     $-DGROUP0
        db      03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 000h, 000h, 06eh, 012h, 072h, 012h, 000h
        db      000h, 042h, 050h, 04dh, 000h, 046h, 050h, 042h, 000h, 088h, 012h, 09fh, 012h, 0b6h, 012h, 0cdh
        db      012h, 0e4h, 012h, 0fbh, 012h, 012h, 013h, 029h, 013h, 000h, 000h
        db      "OFF                   ", 0
        db      "FSK24                 ", 0
        db      "PULSE96               ", 0
        db      "MIDI CLOCK            ", 0
        db      "MIDI CLOCK W/SONG PNTR", 0
        db      "MIDI TIME CODE        ", 0
        db      "SMPTE                 ", 0
        db      "1/4 NOTE CLICKS       ", 0
        db      046h, 013h, 04eh, 013h, 000h, 000h
        db      "FSK24  ", 0
        db      "PULSE96", 0
        db      062h, 013h, 068h, 013h, 06eh, 013h, 074h, 013h, 07ah, 013h, 000h, 000h
        db      "OFF  ", 0
        db      "MIDI1", 0
        db      "MIDI2", 0
        db      "MIDI3", 0
        db      "MIDI4", 0
        db      086h, 013h, 092h, 013h, 000h, 000h
        db      "BAR 1      ", 0
        db      "CURRENT BAR", 0
        endif

RUN_AFTER_BR_05E28 macro   {GLOBALSYMBOLS}
L_321F  equ     $-DGROUP0
STR_321F equ     $-DGROUP0
        db      "Tempo", 0
STR_3225 equ     $-DGROUP0
        db      "Tempo Source Select:", 0
STR_323A equ     $-DGROUP0
        db      "Sequence:", 0
STR_3244 equ     $-DGROUP0
        db      "        Master:", 0
STR_3254 equ     $-DGROUP0
        db      "Display Mode", 0
STR_3261 equ     $-DGROUP0
        db      "BPM/FPB:", 0
        if      FW_VERSION >= 212
STR_326A equ     $-DGROUP0
        db      "           Frames/sec:", 0
STR_3281 equ     $-DGROUP0
        db      "Other", 0
STR_3287 equ     $-DGROUP0
        db      "Tap averaging:", 0
        else
        db      "           Frames/Sec:", 0
        db      "Other", 0
        db      "Tap Averaging:", 0
        endif
STR_3296 equ     $-DGROUP0
        db      "<SyncScreen><TempoChanges>", 0
STR_32B1 equ     $-DGROUP0
        db      "Sync Input Settings", 0
STR_32C5 equ     $-DGROUP0
        db      "Mode:", 0
        if      FW_VERSION >= 212
STR_32CB equ     $-DGROUP0
        db      "Shift sync early(ms):", 0
STR_32E1 equ     $-DGROUP0
        db      "Midi in:", 0
STR_32EA equ     $-DGROUP0
        db      "Sequence starts at SMPTE#:", 0
        db      03ah, 000h, 03ah, 000h, 03ah, 000h, 02eh, 000h
STR_330D equ     $-DGROUP0
        db      "SMPTE accuracy:", 0
STR_331D equ     $-DGROUP0
        db      "Midi in:", 0
STR_3326 equ     $-DGROUP0
        db      "Shift sync early(ms):", 0
        else
        db      "Sequence Starts at SMPTE# ", 0
        db      03ah, 000h, 03ah, 000h, 03ah, 000h
        db      "Shift sync early (msec):", 0
        db      "     Midi In:", 0
        endif
STR_333C equ     $-DGROUP0
        db      "1/4 click sync starts at:", 0
STR_3356 equ     $-DGROUP0
        db      "Sync Output Settings", 0
STR_336B equ     $-DGROUP0
        db      "Mode:", 0
        if      FW_VERSION >= 212
STR_3371 equ     $-DGROUP0
        db      "Midi clock:", 0
        else
        db      "         Midi Clock:", 0
        endif
STR_337D equ     $-DGROUP0
        db      "<GenSMPTE>", 0
STR_3388 equ     $-DGROUP0
        db      "Mid Sequence Tempo Changes", 0
        if      FW_VERSION >= 212
STR_33A3 equ     $-DGROUP0
        db      "Tempo changes:", 0
        else
        db      "Tempo Changes:", 0
        endif
STR_33B2 equ     $-DGROUP0
        db      "Location for inserted change: ", 0
STR_33D1 equ     $-DGROUP0
        db      "Change#: Bar#:       %Change:  Tempo:", 0
        db      020h, 020h, 000h, 000h, 02eh, 000h
STR_33FD equ     $-DGROUP0
        db      "<Insert New> <Delete> <Previous> <Next>", 0
STR_3425 equ     $-DGROUP0
        db      025h
        db      "3d.%d %s", 0
STR_342F equ     $-DGROUP0
        db      "Generate SMPTE", 0
STR_343E equ     $-DGROUP0
        db      "Start=", 0
        db      03ah, 000h, 03ah, 000h, 03ah, 000h
        endm
        if      FW_VERSION < 212
        RUN_AFTER_BR_05E28
        db      "    Frames/Sec:", 0
        db      "<Start>   <Stop>", 0
        db      025h, 030h, 032h, 064h, 03ah, 025h, 030h, 032h, 064h, 03ah, 025h, 030h, 032h, 064h, 03ah, 02dh
W_15DB_V112 equ     $-DGROUP0
        db      02dh, 000h, 000h, 0e0h, 015h
        db      "(no files)", 0
        db      000h, 000h, 000h, 000h, 000h
        db      "Save / Load", 0
        db      "1)Save Sequence    2)Save All Seqs/Songs", 0
        db      "3)Save Drum Sound  4)Save All Sounds", 0
        db      "5)Load/View/Erase/Rename Files", 0
        db      "6)Erase/Format Disk", 0
        db      "Load/View Files", 0
        db      03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 000h
        db      "Load/View Files", 0
        db      "Select file, then press <Load it>:", 0
        db      "File: ", 0
        db      "Size: ", 0
        endif
        if      FW_VERSION >= 214

TBL_14BF equ     $-DGROUP0
        db      000h, 0d0h, 014h, 0d4h, 014h, 0d8h, 014h, 0dch, 014h, 0e0h, 014h, 0e4h, 014h, 0e8h, 014h, 000h
        db      000h, 053h, 045h, 054h, 000h, 053h, 04eh, 044h, 000h, 053h, 045h, 051h, 000h, 041h, 04ch, 04ch
        db      000h, 050h, 041h, 052h, 000h, 053h, 054h, 031h, 000h, 053h, 054h, 032h, 000h
        endif
        if      FW_VERSION >= 212
        db      "(no files)", 0
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
STR_1503 equ     $-DGROUP0
        db      "Disk", 0
STR_1508 equ     $-DGROUP0
        db      "1)Save a sequence  2)Save all seqs/songs", 0
STR_1531 equ     $-DGROUP0
        db      "3)Save a sound     4)Save all sounds", 0
STR_1556 equ     $-DGROUP0
        db      "5)Save parameters  6)Load/erase/rename", 0
        endif
        if      FW_VERSION = 212
        db      "7)Format disk      8)Copy a disk", 0
L_1328_V212 equ     $-DGROUP0
        db      "Load/Erase/Rename Files", 0
        db      "Select file, then press <Load it>:", 0
        db      "File: ", 0
        endif
        if      FW_VERSION < 214
        db      "Sequence memory available (bytes):%4dK", 0
        db      00ah
        db      "Sound memory available    (bytes):%4dK", 0
        db      "<Load it> <Erase it> <Rename it>", 0
        db      053h, 045h, 054h, 000h, 053h, 04eh, 044h, 000h, 053h, 045h, 051h, 000h, 041h, 04ch, 04ch, 000h
        endif
        if      FW_VERSION < 212
        db      053h, 054h, 031h, 000h, 053h, 054h, 032h, 000h
        db      "Load an All Sounds File (.ST1)", 0
        db      "This will erase all sounds currently in"
        db      00ah
        db      "memory!", 0
        db      "<Load file>", 0
        db      "loading file ... ", 0
        db      "Load an All Sounds File (.SET)", 0
        db      "This will erase all sounds currently in"
        db      00ah
        db      "memory!", 0
        db      "<Load file>", 0
        db      "loading file ... ", 0
        db      "Load a Sound File (.SND)", 0
        db      "Drum to load into: ", 0
        elseif  FW_VERSION = 212
        db      050h, 041h, 052h, 000h, 053h, 054h, 031h, 000h, 053h, 054h, 032h, 000h
        db      "Size: %3dK", 0
        else
        db      "7)Format a floppy  8)Copy a floppy", 0
        db      "9)Other functions", 0
        db      "Other Disk Functions", 0
        db      "1)Turn off 'Disk' light", 0
        db      "2)Format hard disk", 0
        db      "Format Hard Disk", 0
        db      025h, 033h, 064h, 000h, 000h, 025h, 030h, 032h, 064h, 000h, 025h, 030h, 032h, 064h, 000h
        db      "(This will take up to 10 minutes.)", 0
        db      "Formatting hard disk...", 0
L_164D  equ     $-DGROUP0
        db      "Load/Erase/Rename Files", 0
        db      "Select file, then press <Load>:", 0
        db      000h
        db      "Disk:%s", 0
        db      "Free Memory", 0
        db      "Sequence mem:%3dKB", 0
        db      "      Sound mem:%4dKB", 0
        db      "<Load>  <Erase>  <Rename>", 0
        db      "  <Select disk>", 0
        db      "Size:%5uKB", 0
        endif
        if      FW_VERSION >= 212
STR_16F8 equ     $-DGROUP0
        db      "Load a Sound File (.SND)", 0
        db      "Select the drum to load the selected"
        db      00ah
        db      "sound into: ", 0
        endif
STR_1743 equ     $-DGROUP0
        db      "<Load file>", 0
STR_174F equ     $-DGROUP0
        db      "loading...   ", 0
STR_175D equ     $-DGROUP0
        db      "Load a Sequence File (.SEQ)", 0
STR_1779 equ     $-DGROUP0
        db      "Sequence number to load into: ", 0
STR_1798 equ     $-DGROUP0
        db      "<Load file>", 0
STR_17A4 equ     $-DGROUP0
        db      "loading...     ", 0
STR_17B4 equ     $-DGROUP0
        db      "Load All Seqs and Songs (.ALL)", 0
        db      "This will erase all sequences and songs"
        db      00ah
        db      "currently in memory!", 0
STR_1810 equ     $-DGROUP0
        db      "<Load file>", 0
STR_181C equ     $-DGROUP0
        db      "loading file ... ", 0
        if      FW_VERSION >= 212
STR_182E equ     $-DGROUP0
        db      "Load a Parameter File (.PAR)", 0
        db      "This will replace all existing system"
        db      00ah, 000h
        db      "parameters! (These are the parameters"
        db      00ah, 000h
        db      "which are normally retained while power"
        db      00ah, 000h
STR_18C2 equ     $-DGROUP0
        db      "is off.)", 0
STR_18CB equ     $-DGROUP0
        db      "<Load file>", 0
STR_18D7 equ     $-DGROUP0
        db      "loading...     ", 0
        endif
STR_18E7 equ     $-DGROUP0
        db      "Erase a File", 0
STR_18F4 equ     $-DGROUP0
        db      "Erase the file: ", 0
        db      020h, 03fh, 000h
STR_1908 equ     $-DGROUP0
        db      "<Erase it>", 0
STR_1913 equ     $-DGROUP0
        db      "Erasing file ...", 0
STR_1924 equ     $-DGROUP0
        db      "Rename a File", 0
STR_1932 equ     $-DGROUP0
        db      "Rename the file: ", 0
STR_1944 equ     $-DGROUP0
        db      "to the new name: ", 0
STR_1956 equ     $-DGROUP0
        db      "<Rename it>", 0
STR_1962 equ     $-DGROUP0
        db      "Renaming file ...", 0
        if      FW_VERSION < 214
        db      "Format Disk", 0
        db      "(This will erase the entire disk!)", 0
        else
        db      "Select Disk", 0
        db      "Select disk, then press <Select it> to"
        db      00ah, 000h
        db      "return to previous screen.", 0
        db      "Disk:", 0
        db      "<Select it>", 0
        db      "Format a Floppy Disk", 0
        db      "This will erase the entire disk!", 0
        endif
STR_1A0B equ     $-DGROUP0
        db      "<Format it>", 0
STR_1A17 equ     $-DGROUP0
        db      "Formatting...", 0
        if      FW_VERSION < 212
        db      02ch, 01ah
        db      "(no files)", 0
        db      "Save Sequence", 0
        db      ".SEQ", 0
        db      "Select sequence to save:"
        db      00ah, 000h, 02dh, 000h
        db      "(The first 8 letters of the sequence"
        db      00ah
        db      " name will be used as the file name.)", 0
        endif

RUN_AFTER_BR_05E28_2 macro   {GLOBALSYMBOLS}
STR_2E85 equ     $-DGROUP0
        db      "Save All Sequences & Songs", 0
STR_2EA0 equ     $-DGROUP0
        db      ".ALL", 0
STR_2EA5 equ     $-DGROUP0
L_2EA5  equ     $-DGROUP0
        db      "ALL_SEQS", 0
L_2EAE  equ     $-DGROUP0
        db      "Name 'ALL' file to save:"
        db      00ah, 000h
        if      FW_VERSION >= 212
STR_2EC8 equ     $-DGROUP0
        db      "Save a Sound", 0
        else
        db      "Save Sound", 0
        endif
STR_2ED5 equ     $-DGROUP0
        db      ".SND", 0
STR_2EDA equ     $-DGROUP0
        db      "Select sound to save:     Drum:", 0
STR_2EFA equ     $-DGROUP0
        db      "Name:", 0
        if      FW_VERSION < 212
        db      "(The first 8 letters of the sound name"
        db      00ah
        db      " will be used as the file name.)", 0
        endif
STR_2F00 equ     $-DGROUP0
        db      "Save All Sounds", 0
STR_2F10 equ     $-DGROUP0
        db      ".SET", 0
STR_2F15 equ     $-DGROUP0
        db      "ALL_SNDS", 0
        db      "Name 'SET' file to save:"
        db      00ah, 000h
        endm
        if      FW_VERSION < 212
        RUN_AFTER_BR_05E28_2
        db      "Size:    K", 0
        db      "Disk space available (bytes):", 0
        db      "<save it to disk>", 0
        db      "saving file ...  ", 0
        db      "FILE ALREADY EXISTS.  OVERWRITE IT?", 0
        db      "<yes>  <no>      ", 0
        db      "saving file ...  ", 0
        db      "<Save 1st part>", 0
        db      "<Save 2nd part>", 0
        db      000h
        db      "Sort Tracks", 0
        db      "(Tracks between those displayed above", 0
        db      "will be renumbered.)", 0
        db      "<Execute>", 0
        db      " Place track:", 0
        db      02dh, 000h
        db      "before track:", 0
        db      02dh, 000h, 000h, 0e4h, 01ch, 0efh, 01ch, 0fah, 01ch, 005h, 01dh, 010h, 01dh, 01bh, 01dh, 026h
        db      01dh, 031h, 01dh, 000h, 000h
        elseif  FW_VERSION = 212

        db      "Copy a Disk", 0
L_16D2_V212 equ     $-DGROUP0
        db      "THIS WILL ERASE ALL SEQUENCES IN MEMORY!", 0
        db      "Are you sure you want to copy a disk ?", 0
L_1722_V212 equ     $-DGROUP0
        db      "<Yes, proceed>", 0
        db      "Copy a Disk", 0
        else

        db      "Copy a Floppy Disk", 0
L_1A38  equ     $-DGROUP0
        db      "THIS WILL ERASE ALL SEQUENCES IN MEMORY!", 0
        db      "Are you sure you want to copy a disk?", 0
L_1A87  equ     $-DGROUP0
        db      "<Yes, proceed>", 0
        db      "Copy a Floppy Disk", 0
        endif
        if      FW_VERSION >= 212
STR_1AA9 equ     $-DGROUP0
        db      "Insert disk to be copied FROM, then", 0
STR_1ACD equ     $-DGROUP0
        db      "press <Proceed>", 0
STR_1ADD equ     $-DGROUP0
        db      "<Proceed>", 0
STR_1AE7 equ     $-DGROUP0
        db      "Copying source disk. Please wait...", 0
STR_1B0B equ     $-DGROUP0
        db      "Insert disk to copy TO, then         ", 0
STR_1B31 equ     $-DGROUP0
        db      "<Proceed>", 0
STR_1B3B equ     $-DGROUP0
        db      "Writing destination disk. Please wait...", 0
        endif
        if      FW_VERSION = 212
        db      0feh, 017h, 002h, 018h, 000h, 000h, 04fh, 046h, 046h, 000h
        endif
        if      FW_VERSION >= 214
        db      025h, 032h, 064h, 000h, 06eh, 01bh, 072h, 01bh, 000h, 000h, 04fh, 046h, 046h, 000h
        endif
        if      FW_VERSION >= 212
        db      "TO BAR", 0
L_1B79  equ     $-DGROUP0
        db      "Sqnc:", 0
        db      02dh, 000h
STR_1B81 equ     $-DGROUP0
        db      " Tmpo:", 0
        db      020h, 000h
STR_1B8A equ     $-DGROUP0
        db      "Tsig:  /     Bars:       Loop:", 0
        db      000h
STR_1BAA equ     $-DGROUP0
        db      "Track Data", 0
STR_1BB5 equ     $-DGROUP0
        db      "Trak:", 0
        db      02dh, 000h
STR_1BBD equ     $-DGROUP0
        db      " Ch:", 0
        db      000h, 02dh, 000h
STR_1BC5 equ     $-DGROUP0
        db      "Vol%:", 0
STR_1BCB equ     $-DGROUP0
        db      "     Prog:", 0
STR_1BD6 equ     $-DGROUP0
        db      "    Ch:", 0
        db      000h, 02dh, 000h
STR_1BE1 equ     $-DGROUP0
        db      "<Trak=   ><Solo=   ><Tmpo=   ><SortTrks>", 0
L_1C0A  equ     $-DGROUP0
        db      "(Hold drums or keys to erase)", 0
L_1C28  equ     $-DGROUP0
        db      "(Hold notes to repeat)", 0
STR_1C3F equ     $-DGROUP0
        db      03dh, 03dh, 03dh, 03dh, 03dh
        db      " Now:001.01.00 (00:00:00.00) ======", 0
STR_1C68 equ     $-DGROUP0
STR_1C6C equ     $-DGROUP0+4
L_1C68  equ     $-DGROUP0
        db      04fh, 046h, 046h, 000h, 04fh, 04eh, 020h, 000h, 04fh, 046h, 046h, 000h, 04fh, 04eh, 020h, 000h
STR_1C78 equ     $-DGROUP0
STR_1C7C equ     $-DGROUP0+4
STR_1C80 equ     $-DGROUP0+8
        db      04dh, 041h, 053h, 000h, 053h, 045h, 051h, 000h, 020h, 020h, 020h, 000h
STR_1C84 equ     $-DGROUP0
        db      "(off)   ", 0
L_1C8D  equ     $-DGROUP0
        db      "Drums   ", 0
L_1C96  equ     $-DGROUP0
        db      03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 020h, 028h, 04eh, 065h, 078h, 074h
        db      020h, 053h, 065h, 071h, 075h, 065h, 06eh, 063h, 065h, 03ah, 025h, 032h, 064h, 029h, 020h, 03dh
        db      03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 000h
L_1CC0  equ     $-DGROUP0
        db      "Play/Record (Record Ready)", 0
L_1CDB  equ     $-DGROUP0
        db      "Play/Record", 0
        db      000h
        db      " function"
        db      00ah
        db      "is not yet implemented"
        db      00ah, 000h, 00ah
        db      "(press any key to continue)", 0
        endif
        if      FW_VERSION = 212
        db      000h, 0beh, 019h, 0c5h, 019h, 000h, 000h
        endif
        if      FW_VERSION >= 214
        db      000h, 02eh, 01dh, 035h, 01dh, 000h, 000h
        endif
        if      FW_VERSION >= 212
        db      "NORMAL", 0
        db      "FIXED ", 0
        endif
        if      FW_VERSION = 212
        db      0d4h, 019h, 0d9h, 019h, 0e4h, 019h, 000h, 000h
        endif
        if      FW_VERSION >= 214
        db      044h, 01dh, 049h, 01dh, 054h, 01dh, 000h, 000h
        endif
        if      FW_VERSION >= 212
        db      "NONE", 0
        db      "DRUM NOTES", 0
        db      "NOTES/MIX/TUNE", 0
STR_1D63 equ     $-DGROUP0
        db      "Midi", 0
STR_1D68 equ     $-DGROUP0
        db      "1)Midi input filter, soft thru, other", 0
STR_1D8E equ     $-DGROUP0
        db      "2)External drum triggering, drums chan", 0
STR_1DB5 equ     $-DGROUP0
        db      "3)Akai ME-35T audio/midi interface", 0
STR_1DD8 equ     $-DGROUP0
        db      "4)Turn All Notes Off", 0
STR_1DED equ     $-DGROUP0
        db      "Midi Input Filter", 0
STR_1DFF equ     $-DGROUP0
        db      "Event:", 0
STR_1E06 equ     $-DGROUP0
        db      "Pass event?:", 0
        db      000h
STR_1E14 equ     $-DGROUP0
        db      "Velocity mode:", 0
        db      "Fixed velocity:", 0
STR_1E33 equ     $-DGROUP0
        db      "Other Midi", 0
STR_1E3E equ     $-DGROUP0
        db      "Midi soft thru:", 0
STR_1E4E equ     $-DGROUP0
        db      "Default chan:", 0
        db      000h
STR_1E5D equ     $-DGROUP0
        db      "Special sustain pedal processing:", 0
STR_1E7F equ     $-DGROUP0
        db      "<All notes off>", 0
STR_1E8F equ     $-DGROUP0
        db      "Minimum change:", 0
STR_1E9F equ     $-DGROUP0
        db      "Assign Incoming Notes to Drums", 0
STR_1EBE equ     $-DGROUP0
        db      "Incoming notes play drums:", 0
STR_1ED9 equ     $-DGROUP0
        db      "Note:", 0
        db      028h, 000h, 029h, 000h
STR_1EE3 equ     $-DGROUP0
        db      "Plays:", 0
STR_1EEA equ     $-DGROUP0
        db      "Assign Outgoing Drums to Notes", 0
STR_1F09 equ     $-DGROUP0
        db      "Midi drum data sent out:", 0
STR_1F22 equ     $-DGROUP0
        db      "Drum:", 0
STR_1F28 equ     $-DGROUP0
        db      "Plays note:", 0
        db      028h, 000h, 029h, 000h
STR_1F38 equ     $-DGROUP0
        db      "Other", 0
STR_1F3E equ     $-DGROUP0
        db      "Midi drums chan:", 0
STR_1F4F equ     $-DGROUP0
        db      "ME-35T Trigger Interface", 0
STR_1F68 equ     $-DGROUP0
        db      "Midi in:", 0
STR_1F71 equ     $-DGROUP0
        db      "  Out:", 0
STR_1F78 equ     $-DGROUP0
        db      "Unit:", 0
STR_1F7E equ     $-DGROUP0
        db      "   Unit ch:", 0
STR_1F8A equ     $-DGROUP0
        db      "Settings for Input:", 0
        db      000h
STR_1F9F equ     $-DGROUP0
        db      "Note:", 0
STR_1FA5 equ     $-DGROUP0
        db      "Sensitivity:", 0
STR_1FB2 equ     $-DGROUP0
        db      "Trigger:", 0
STR_1FBB equ     $-DGROUP0
        db      "Capture time:", 0
STR_1FC9 equ     $-DGROUP0
        db      "Recovery time:", 0
STR_1FD8 equ     $-DGROUP0
        db      "'On' time:", 0
STR_1FE3 equ     $-DGROUP0
        db      "Velocity curve:", 0
STR_1FF3 equ     $-DGROUP0
        db      "Midi channel:", 0
STR_2001 equ     $-DGROUP0
        db      "<Read from> <Send to>", 0
STR_2017 equ     $-DGROUP0
        db      "Attention", 0
        db      "The ME-35T is not turned on (connected)"
        db      00ah, 000h
        db      "or an attempt to access a non-connected"
        db      00ah, 000h
        db      "port has been detected"
        db      00ah, 000h
STR_208B equ     $-DGROUP0
        db      "<Cancel>", 0
STR_2094 equ     $-DGROUP0
L_2094  equ     $-DGROUP0
        db      028h, 025h, 073h, 029h, 000h, 000h, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh
        db      03dh, 03dh, 03dh, 03dh, 020h, 045h, 063h, 068h, 06fh, 020h, 04dh, 069h, 078h, 065h, 072h, 020h
        db      03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 000h, 000h
        endif
        if      FW_VERSION = 212
        db      066h, 01dh, 071h, 01dh, 07ch, 01dh, 087h, 01dh, 092h, 01dh, 09dh, 01dh, 0a8h, 01dh, 0b3h, 01dh
        endif
        if      FW_VERSION >= 214
        db      0d6h, 020h, 0e1h, 020h, 0ech, 020h, 0f7h, 020h, 002h, 021h, 00dh, 021h, 018h, 021h, 023h, 021h
        endif
        if      FW_VERSION >= 212
        db      000h, 000h
        endif
        db      "1/4 NOTE  ", 0
        db      "1/4 TRPLT ", 0
        db      "1/8 NOTE  ", 0
        db      "1/8 TRPLT ", 0
        db      "1/16 NOTE ", 0
        db      "1/16 TRPLT", 0
        db      "1/32 NOTE ", 0
        db      "1/32 TRPLT", 0
        if      FW_VERSION < 212
        db      054h, 01dh, 062h, 01dh, 070h, 01dh, 07eh, 01dh, 08ch, 01dh, 09ah, 01dh, 0a8h, 01dh, 0b6h, 01dh
        db      0c4h, 01dh, 0d2h, 01dh, 0e0h, 01dh, 000h, 000h
        elseif  FW_VERSION = 212
        db      0d6h, 01dh, 0e4h, 01dh, 0f2h, 01dh, 000h, 01eh, 00eh, 01eh, 01ch, 01eh, 02ah, 01eh, 038h, 01eh
        db      046h, 01eh, 054h, 01eh, 062h, 01eh, 000h, 000h
        else
        db      046h, 021h, 054h, 021h, 062h, 021h, 070h, 021h, 07eh, 021h, 08ch, 021h, 09ah, 021h, 0a8h, 021h
        db      0b6h, 021h, 0c4h, 021h, 0d2h, 021h, 000h, 000h
        endif
L_2146  equ     $-DGROUP0
        db      "PLAY/STOP    ", 0
        db      "PLAY-STRT/STP", 0
        db      "ERASE        ", 0
        db      "TIMING CORECT", 0
        db      027h, 02bh, 027h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 000h, 027h, 02dh
        db      027h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 000h
        db      "RECORD IN/OUT", 0
        db      "OVRDUB IN/OUT", 0
        db      027h, 03ch, 027h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 000h, 027h, 03eh
        db      027h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 000h
        db      "TAP TEMPO    ", 0
        if      FW_VERSION < 212
        db      0f4h, 01dh, 0f8h, 01dh, 000h, 000h, 04dh, 049h, 043h, 000h
        db      "LINE", 0
        db      "Other", 0
        db      "Metronome Vol:", 0
        db      "    Rate:", 0
L_1E1C_V112 equ     $-DGROUP0
        db      "Foot1:", 0
L_1E23_V112 equ     $-DGROUP0
        db      " Foot2:", 0
L_1E2B_V112 equ     $-DGROUP0
        db      "Free sequence memory: %d%%", 0
        db      "<Reset to defaults>", 0
L_1E5A_V112 equ     $-DGROUP0
        db      "Reset to Defaults", 0
L_1E6C_V112 equ     $-DGROUP0
        db      "<Reset to defaults>", 0
L_1E80_V112 equ     $-DGROUP0
        db      "Debug Functions", 0
        db      "Date of this version: 06/09/88", 0
L_1EAF_V112 equ     $-DGROUP0
        db      "Voices Off Insurance:", 0
L_1EC5_V112 equ     $-DGROUP0
        db      "Help Codes:", 0
L_1ED1_V112 equ     $-DGROUP0
        db      "<sync>    <sounds>", 0
        elseif  FW_VERSION = 212
        db      076h, 01eh, 07ah, 01eh, 000h, 000h, 04dh, 049h, 043h, 000h
        else
        db      0e6h, 021h, 0eah, 021h, 000h, 000h, 04dh, 049h, 043h, 000h
        endif
        if      FW_VERSION >= 212
        db      "LINE", 0
STR_21EF equ     $-DGROUP0
        db      "Metronome", 0
STR_21F9 equ     $-DGROUP0
        db      "Volume:", 0
STR_2201 equ     $-DGROUP0
        db      "   Rate:", 0
STR_220A equ     $-DGROUP0
        db      "  In play:", 0
STR_2215 equ     $-DGROUP0
        db      "Foot switches", 0
L_2223  equ     $-DGROUP0
        db      "Foot1:", 0
L_222A  equ     $-DGROUP0
        db      " Foot2:", 0
STR_2232 equ     $-DGROUP0
        db      "Other", 0
L_2238  equ     $-DGROUP0
        db      "Free sequence memory: %d%%", 0
STR_2253 equ     $-DGROUP0
        db      "<Defaults><Record 16 Chs>", 0
L_226D  equ     $-DGROUP0
        db      "Reset to Defaults", 0
L_227F  equ     $-DGROUP0
        db      "<Reset to defaults>", 0
        db      000h
L_2294  equ     $-DGROUP0
        db      "Debug Functions", 0
STR_22A4 equ     $-DGROUP0
        db      "Date of this version: ", 0
L_22BB  equ     $-DGROUP0
        db      "Voices Off Insurance:", 0
L_22D1  equ     $-DGROUP0
        db      "Help Codes:", 0
STR_22DD equ     $-DGROUP0
        db      "Max HiHat Decay:", 0
L_22EE  equ     $-DGROUP0
        db      "<sync>    <sounds>", 0
        endif

RUN_AFTER_BR_05E28_3 macro   {GLOBALSYMBOLS}

STR_2301 equ     $-DGROUP0
        db      "Sync Parameters", 0
STR_2311 equ     $-DGROUP0
        db      "<exit>", 0
STR_2318 equ     $-DGROUP0
        db      "Btempo:%5u  Tempo:%5u  Htempo:%5u", 0
        db      00ah
        db      "Exttick:%10lu  Exttime:%10lu", 0
        db      00ah
        db      "Inttick:%10lu  Inttime:%10lu", 0
        db      00ah
        db      "Pherr:  %10ld  Syncper:%10lu", 0
        db      00ah
        db      "Frmnum: %10lu  Frmfrc: %10lu", 0
        db      00ah
        db      "Syncin:%d  Insync:%2d Esmpte: ", 0
STR_23D2 equ     $-DGROUP0
        db      "Mtccnt:%3d", 0
        endm
        if      FW_VERSION >= 212
        RUN_AFTER_BR_05E28_3
        endif
STR_23DD equ     $-DGROUP0
        db      "Sound Data", 0
STR_23E8 equ     $-DGROUP0
        db      "1) Sound Directory", 0
        db      00ah
        db      "2) Sound Mem Allocation Map", 0
        db      00ah
        if      FW_VERSION < 212
        db      "3) Clear Sound Memory", 0
        db      00ah
        db      "4) View Sound Memory", 0
        db      "Clearing Sound Memory ... ", 0
        else
        db      "3) View Sound Memory", 0
        endif
STR_242E equ     $-DGROUP0
        db      "Sound ", 0
STR_2435 equ     $-DGROUP0
        db      ": %-16s  Drum %2d", 0
        db      00ah
        if      FW_VERSION < 212
        db      "strt:%6ld  pitch:%5d  r/w:%9ld", 0
        db      00ah
        db      "abgn:%6ld  attak:%5d  lnk:%9d", 0
        else
        db      "strt:%6ld  pitch:%5d", 0
        db      00ah
        db      "abgn:%6ld  ampl: %5d  lnk:%9d", 0
        endif
        db      00ah
L_247D  equ     $-DGROUP0
        db      "len:%7ld  decay:%6d achan:%7d", 0
        db      00ah
        if      FW_VERSION < 212
        db      "tbgn:%6d  tdcay:%5d  type:%4d=%02xh", 0
        db      00ah
        db      "tend:%6d  tdur:%6d  echo:%4d=%02xh", 0
        else
        db      "tbgn:%6d  vatk:%6d  type:%4d=%02xh", 0
        db      00ah
        db      "tend:%6d  vbgn:%6d  echo:%4d=%02xh", 0
        endif
        db      00ah
        db      "tatk:%6d  vol:%7d  rpan:%4d=%02xh", 0
        db      00ah
        db      "tdcy:%6d  pan:%7d  lpan:%4d=%02xh", 0
STR_2529 equ     $-DGROUP0
        db      "Sound Mem Allocation", 0
STR_253E equ     $-DGROUP0
        db      "Index:", 0
STR_2545 equ     $-DGROUP0
        db      "stat: %2d        snd:%2d", 0
STR_255E equ     $-DGROUP0
        db      "start:%7ld   len:%7ld", 0
STR_2574 equ     $-DGROUP0
        db      "START ADDRESS", 0
        db      "address = %ld [%05lxh]"
STR_259A equ     $-DGROUP0+2
        db      00ah, 000h, 025h, 030h, 034h, 078h, 020h, 000h
STR_25A0 equ     $-DGROUP0
        db      "%s = %ld: ", 0
        if      FW_VERSION < 212
        RUN_AFTER_BR_05E28_3
        db      000h, 0d2h, 021h, 0e1h, 021h, 000h, 000h
        db      "STOP AT END   ", 0
        db      "LOOP TO 'BAR#'", 0
        db      "Edit Sequence", 0
        db      "1)Time Sig / # of Bars / Ending Status"
        db      00ah, 000h
        db      "2)Create New Time Sig/Number of Bars"
        db      00ah, 000h
        db      "3)Insert Blank Bars 4)Delete Bars"
        db      00ah, 000h
        db      "5)Copy All Tracks   6)Copy/Merge a Track", 0
        db      "7)Copy a Sequence   8)Convert song"
        db      00ah, 000h
        db      "9)Shorten / Lengthen a Bar"
        db      00ah, 000h
        db      "Ending Status (Stop or Loop)", 0
        db      "Status:", 0
        db      "       Bar#:", 0
        db      "Time Signature / # of Bars", 0
        else
        db      00ah
        db      "Basebpm=%u Btempo=%u Tempo=%u", 0
        db      00ah
        db      "Tmpofact=%u Cscan=%d", 0
        db      00ah
        db      "Ctccnt=%u Clptmpo=%u Clptock=%ld", 0
        db      00ah
        db      "Ctct[0].tick=%lu Ctct[0].tmpo=%u", 0
        db      00ah
        db      "Ctct[1].tick=%lu Ctct[1].tmpo=%u", 0
        db      00ah
        db      "Ctct[2].tick=%lu Ctct[2].tmpo=%u", 0
        db      00ah
        db      "Ctct[3].tick=%lu Ctct[3].tmpo=%u", 0
        endif
        if      FW_VERSION = 212
        db      020h, 023h, 02bh, 023h, 000h, 000h
        endif
        if      FW_VERSION >= 214
        db      090h, 026h, 09bh, 026h, 000h, 000h
        endif
        if      FW_VERSION >= 212
        db      "16 VOLUMES", 0
        db      "16 TUNINGS", 0
TBL_26A6 equ     $-DGROUP0
        db      00ch, 00dh, 00eh, 00fh, 008h, 009h, 00ah, 00bh, 004h, 005h, 006h, 007h, 000h, 001h, 002h, 003h
STR_26B6 equ     $-DGROUP0
        db      "Sounds", 0
        db      "1)Sample new sound  2)Edit a sound"
        db      00ah, 000h
        db      "3)Tune drums        4)Echo mixer"
        db      00ah, 000h
        db      "5)Assign mix outs   6)Midi sample dump"
        db      00ah, 000h
STR_272B equ     $-DGROUP0
        db      "7)Audio trigger     8)Mixer/hihat/other", 0
        endif

RUN_AFTER_BR_05E28_4 macro   {GLOBALSYMBOLS}

STR_2753 equ     $-DGROUP0
        db      "Assignable Mix Outputs", 0
        db      03ah, 000h
STR_276C equ     $-DGROUP0
        db      "(0=No output assignment)", 0
STR_2785 equ     $-DGROUP0
        db      "Mixer Modes", 0
STR_2791 equ     $-DGROUP0
        db      "Stereo Mix:", 0
        if      FW_VERSION >= 212
        db      000h
STR_279E equ     $-DGROUP0
        db      "Echo   Mix:", 0
        db      000h
        else
        db      "Echo Mix:", 0
        endif
STR_27AB equ     $-DGROUP0
        db      "HiHat Decay Switch Thresholds", 0
STR_27C9 equ     $-DGROUP0
        db      "Closed/Medium:", 0
STR_27D8 equ     $-DGROUP0
        db      "     Medium/Open:", 0
        if      FW_VERSION >= 212
STR_27EA equ     $-DGROUP0
        db      "Other", 0
STR_27F0 equ     $-DGROUP0
        db      "Controller number for hihat decay:", 0
STR_2813 equ     $-DGROUP0
        db      "Function of '16 levels':", 0
STR_282C equ     $-DGROUP0
        db      "Rcrd live chngs:", 0
        else
        db      "Controller number for HiHat Decay:", 0
        db      "Midi Sample Dump", 0
        db      "Drum:", 0
        db      "     Name:", 0
        db      "Midi Out Port:", 0
        db      "    Midi In Port:", 0
        db      "Format:", 0
        db      "Free Mem(Smpls):%4dK", 0
        db      "Dump Request to External Sampler", 0
        db      "Sample#:", 0
        db      "Channel#(127=All):", 0
        db      "<Send>  <Receive>", 0
        db      "(This will erase the above sound!)", 0
        db      "<Receive>", 0
        db      "(Erasing the above sound ...)", 0
        db      "(Ready to receive Midi sample dump ...)", 0
        db      "<Cancel>", 0
        db      "<Cancel>", 0
        endif
STR_283D equ     $-DGROUP0
        db      "Audio Trigger (Use Sync Input)", 0
STR_285C equ     $-DGROUP0
        db      "Plays Drum:", 0
        db      "(Triggering is only active while this"
        db      00ah
        db      "screen is displayed.)", 0
        endm
        if      FW_VERSION >= 212
        RUN_AFTER_BR_05E28_4
L_28A4  equ     $-DGROUP0
        db      "Sample New Sound", 0
L_28B5  equ     $-DGROUP0
        db      "Drum:", 0
L_28BB  equ     $-DGROUP0
        db      "    Name:", 0
STR_28C5 equ     $-DGROUP0
        db      "(All sequence memory, and the existing", 0
STR_28EC equ     $-DGROUP0
        db      "drum sound for the drum to be sampled", 0
STR_2912 equ     $-DGROUP0
        db      "into, will be erased! Are you sure you", 0
STR_2939 equ     $-DGROUP0
        db      "want to proceed?)", 0
        endif

RUN_AFTER_BR_05E28_5 macro   {GLOBALSYMBOLS}

STR_294B equ     $-DGROUP0
        db      "<Proceed>", 0
STR_2955 equ     $-DGROUP0
        db      "Sample New Sound", 0
STR_2966 equ     $-DGROUP0
        db      "Drum:", 0
STR_296C equ     $-DGROUP0
        db      "   Name:", 0
STR_2975 equ     $-DGROUP0
        db      "Length(sec):", 0
STR_2982 equ     $-DGROUP0
        db      " Pre-Record (msec):  ", 0
STR_2998 equ     $-DGROUP0
        db      "Hear Input: ", 0
STR_29A5 equ     $-DGROUP0
        db      "  Fadeout Time(msec):", 0
STR_29BB equ     $-DGROUP0
        db      "Record Level:", 0
STR_29C9 equ     $-DGROUP0
        db      "  Threshold%(T):", 0
STR_29DA equ     $-DGROUP0
        db      "Meter:", 0
        endm
        if      FW_VERSION >= 212
        RUN_AFTER_BR_05E28_5
STR_29E1 equ     $-DGROUP0
        db      "(Record lite=ON when threshold exceeded)", 0
L_2A0A  equ     $-DGROUP0
        db      "<Cancel>", 0
L_2A13  equ     $-DGROUP0
        db      "(Loading sound into Sound Generator)    ", 0
L_2A3C  equ     $-DGROUP0
        db      "<Playback> <Ready...>", 0
STR_2A52 equ     $-DGROUP0
        db      "sound", 0
STR_2A58 equ     $-DGROUP0
        db      020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 000h, 000h
STR_2A62 equ     $-DGROUP0
        db      "Edit a Sound (page 1)", 0
L_2A78  equ     $-DGROUP0
        db      "Drum:", 0
L_2A7E  equ     $-DGROUP0
        db      "     Name:", 0
STR_2A89 equ     $-DGROUP0
        db      "Double Play", 0
STR_2A95 equ     $-DGROUP0
        db      "Also plays:", 0
STR_2AA1 equ     $-DGROUP0
        db      "    Velsw:", 0
STR_2AAC equ     $-DGROUP0
        db      " If over:", 0
STR_2AB6 equ     $-DGROUP0
        db      "Data", 0
STR_2ABB equ     $-DGROUP0
        db      "Volume%:", 0
STR_2AC4 equ     $-DGROUP0
        db      "        Tuning:", 0
STR_2AD4 equ     $-DGROUP0
        db      "Start (msec):", 0
STR_2AE2 equ     $-DGROUP0
        db      "  End(msec):", 0
STR_2AEF equ     $-DGROUP0
        db      "<Cutoff ends><Reverse> <Delete> <Page 2>", 0
STR_2B18 equ     $-DGROUP0
        db      "Edit a Sound (page 2)", 0
STR_2B2E equ     $-DGROUP0
        db      "Drum:", 0
STR_2B34 equ     $-DGROUP0
        db      "     Name:", 0
STR_2B3F equ     $-DGROUP0
        db      "Envelope", 0
STR_2B48 equ     $-DGROUP0
        db      "Attack(msec):", 0
STR_2B56 equ     $-DGROUP0
        db      "  Fadeout(msec):", 0
STR_2B67 equ     $-DGROUP0
        db      "Velocity", 0
        db      "Vel>start(ms):", 0
STR_2B7F equ     $-DGROUP0
        db      "  Vel>attack(ms):", 0
STR_2B91 equ     $-DGROUP0
        db      "Vel>vol(0-100):", 0
STR_2BA1 equ     $-DGROUP0
        db      "<Cutoff ends><Reverse> <Delete> <Page 1>", 0
STR_2BCA equ     $-DGROUP0
        db      "Cutoff Ends", 0
STR_2BD6 equ     $-DGROUP0
        db      "Reverse a Sound", 0
STR_2BE6 equ     $-DGROUP0
        db      "Drum:", 0
        db      025h, 073h, 000h
STR_2BEF equ     $-DGROUP0
        db      "   Name:", 0
        db      025h, 073h, 000h
STR_2BFB equ     $-DGROUP0
        db      "Delete a Sound", 0
STR_2C0A equ     $-DGROUP0
        db      "Drum:", 0
        db      025h, 073h, 000h
STR_2C13 equ     $-DGROUP0
        db      "   Name:", 0
        db      025h, 073h, 000h
STR_2C1F equ     $-DGROUP0
L_2C1F  equ     $-DGROUP0
        db      "Reversing the sound. Please wait ...", 0
        endif
        if      FW_VERSION = 212
        db      0dah, 028h, 0e3h, 028h, 000h, 000h
        endif
        if      FW_VERSION >= 214
        db      04ah, 02ch, 053h, 02ch, 000h, 000h
        endif
        if      FW_VERSION >= 212
        db      "STANDARD", 0
        db      053h, 039h, 030h, 030h, 000h
STR_2C58 equ     $-DGROUP0
        db      "Midi sample dump (Receive)", 0
STR_2C73 equ     $-DGROUP0
        db      "Midi input:", 0
STR_2C7F equ     $-DGROUP0
        db      "       Midi output:", 0
STR_2C93 equ     $-DGROUP0
        db      "Format:", 0
STR_2C9B equ     $-DGROUP0
        db      "Free Mem(Smpls):%4dK", 0
STR_2CB0 equ     $-DGROUP0
        db      "Drum:", 0
STR_2CB6 equ     $-DGROUP0
        db      "Name:", 0
STR_2CBC equ     $-DGROUP0
        db      "(Press <Receive> or start ext sampler)", 0
STR_2CE3 equ     $-DGROUP0
        db      "Select sound for <Receive>", 0
STR_2CFE equ     $-DGROUP0
        db      "Request Chan:", 0
STR_2D0C equ     $-DGROUP0
        db      "    Request sound:", 0
STR_2D1F equ     $-DGROUP0
        db      "<Receive> <Send/Recv>", 0
STR_2D35 equ     $-DGROUP0
        db      025h, 032h, 064h, 000h
STR_2D39 equ     $-DGROUP0
        db      "Erasing the above sound ...", 0
STR_2D55 equ     $-DGROUP0
        db      "(Ready to receive Midi sample dump ...)", 0
STR_2D7D equ     $-DGROUP0
        db      "<Cancel>", 0
STR_2D86 equ     $-DGROUP0
        db      "Midi sample dump (Send)", 0
STR_2D9E equ     $-DGROUP0
        db      "Midi input:", 0
STR_2DAA equ     $-DGROUP0
        db      "       Midi output:", 0
STR_2DBE equ     $-DGROUP0
        db      "Format:", 0
STR_2DC6 equ     $-DGROUP0
        db      "    Send channel:", 0
STR_2DD8 equ     $-DGROUP0
        db      "Start external sampler or press <send>", 0
STR_2DFF equ     $-DGROUP0
        db      "Select sound for <Send>", 0
STR_2E17 equ     $-DGROUP0
        db      "Drum:", 0
STR_2E1F equ     $-DGROUP0+2
        db      028h, 000h, 025h, 032h, 064h, 000h, 029h, 000h
STR_2E25 equ     $-DGROUP0
        db      " Name:", 0
STR_2E2C equ     $-DGROUP0
        db      "<Send>    <Send/Recv>", 0
STR_2E42 equ     $-DGROUP0
STR_2E46 equ     $-DGROUP0+4
        db      025h, 032h, 064h, 000h, 025h, 032h, 064h, 000h
STR_2E4A equ     $-DGROUP0
        db      "<Cancel>", 0
        db      000h
STR_2E54 equ     $-DGROUP0
        db      "Save a Sequence", 0
STR_2E64 equ     $-DGROUP0
        db      ".SEQ", 0
        db      "Select sequence to save:"
        db      00ah, 000h, 02dh, 000h
        RUN_AFTER_BR_05E28_2
STR_2F38 equ     $-DGROUP0
        db      "Save Parameters", 0
STR_2F48 equ     $-DGROUP0
        db      ".PAR", 0
STR_2F4D equ     $-DGROUP0
        db      "PARAMS  ", 0
        db      "Name 'PAR' file to save:"
        db      00ah, 000h
        endif
        if      FW_VERSION = 212
        db      "Size:    K", 0
        db      "Disk space available (bytes):", 0
L_2C29_V212 equ     $-DGROUP0
        db      "<save it to disk>", 0
        endif
        if      FW_VERSION >= 214
        db      "Size:     KB", 0
        db      "Free:", 0
L_2F83  equ     $-DGROUP0
        db      "<save it to disk>", 0
        db      "Disk:", 0
        db      "<Select disk>", 0
        endif
        if      FW_VERSION >= 212
STR_2FA9 equ     $-DGROUP0
        db      "saving file ...  ", 0
STR_2FBB equ     $-DGROUP0
        db      "FILE ALREADY EXISTS.  OVERWRITE IT?     ", 0
STR_2FE4 equ     $-DGROUP0
        db      "<yes>      <no>  ", 0
STR_2FF6 equ     $-DGROUP0
        db      "saving file ...  ", 0
STR_3008 equ     $-DGROUP0
        db      "<Save 1st part>", 0
STR_3018 equ     $-DGROUP0
        db      "<Save 2nd part>", 0
        endif
        if      FW_VERSION = 212
        db      0b8h, 020h, 00dh, 006h, 098h, 000h, 03ch, 040h, 040h, 060h, 000h, 0c0h, 000h, 000h, 0e0h, 000h
        db      000h, 040h, 0d0h, 000h, 040h, 0a0h, 000h, 03ch, 040h, 0f0h, 000h, 000h, 0f0h, 000h, 047h, 000h
        db      044h, 045h, 001h, 000h, 040h, 0f0h, 000h, 047h, 000h, 044h, 045h, 002h, 000h, 040h, 0f0h, 000h
L_2CEA_V212 equ     $-DGROUP0
        db      047h, 000h, 044h, 045h, 003h, 000h, 040h, 0b0h, 000h, 000h, 000h, 0bah, 02ch, 0beh, 02ch, 0c5h
        db      02ch, 0c8h, 02ch, 0cch, 02ch, 0cfh, 02ch, 0d3h, 02ch, 0d6h, 02ch, 0dfh, 02ch, 0e8h, 02ch, 0f1h
L_2D0A_V212 equ     $-DGROUP0
        db      02ch, 004h, 007h, 003h, 004h, 003h, 004h, 003h, 009h, 009h, 009h, 004h
        endif
        if      FW_VERSION >= 214
        db      04bh, 042h, 000h, 000h, 0b8h, 020h, 00dh, 006h, 098h, 000h, 03ch, 040h, 040h, 060h, 000h, 0c0h
        db      000h, 000h, 0e0h, 000h, 000h, 040h, 0d0h, 000h, 040h, 0a0h, 000h, 03ch, 040h, 0f0h, 000h, 000h
        db      0f0h, 000h, 047h, 000h, 044h, 045h, 001h, 000h, 040h, 0f0h, 000h, 047h, 000h, 044h, 045h, 002h
        db      000h, 040h, 0f0h, 000h, 047h, 000h, 044h, 045h, 003h, 000h, 040h, 0b0h, 000h, 000h, 000h
L_3067  equ     $-DGROUP0
        db      ",00070:0>0A0E0H0Q0Z0c0"
L_307D  equ     $-DGROUP0
        db      004h, 007h, 003h, 004h, 003h, 004h, 003h, 009h, 009h, 009h, 004h
        endif

RUN_AFTER_BR_05E28_6 macro   {GLOBALSYMBOLS}

STR_3088 equ     $-DGROUP0
        db      "%02d-(no more events at this location)", 0
STR_30AF equ     $-DGROUP0
        db      025h, 030h, 032h, 064h, 02dh, 000h, 020h, 000h
STR_30B7 equ     $-DGROUP0
        db      " Vel:", 0
STR_30BD equ     $-DGROUP0
        db      " Dcy:", 0
        if      FW_VERSION >= 212
STR_30C3 equ     $-DGROUP0
        db      " Tun:", 0
        endif
STR_30C9 equ     $-DGROUP0
        db      " Vel:", 0
        db      02fh, 000h
STR_30D1 equ     $-DGROUP0
        db      "Dur:", 0
STR_30D6 equ     $-DGROUP0
        db      " Note:", 0
        db      000h
        if      FW_VERSION < 212
        db      " Number:", 0
        db      "        Sign:", 0
        endif
STR_30DE equ     $-DGROUP0
        db      "Val:", 0
STR_30E3 equ     $-DGROUP0
        db      "  Size:", 0
        if      FW_VERSION >= 212
STR_30EB equ     $-DGROUP0
        db      " Byte:", 0
STR_30F2 equ     $-DGROUP0
        db      " Val:", 0
        else
        db      "  Byte:", 0
        db      "  Val:", 0
        endif
STR_30F8 equ     $-DGROUP0
        db      "Drum:", 0
STR_30FE equ     $-DGROUP0
        db      " Drum:", 0
        if      FW_VERSION < 212
        db      "  Sign:", 0
        endif
STR_3105 equ     $-DGROUP0
        db      "Val:", 0
STR_310A equ     $-DGROUP0
        db      "(end of sequence)", 0
STR_311C equ     $-DGROUP0
        db      "Unknown>", 0
STR_3125 equ     $-DGROUP0
        db      020h, 025h, 030h, 032h, 078h, 000h
STR_312B equ     $-DGROUP0
        db      "Val: ", 0
        endm
        if      FW_VERSION >= 212
        RUN_AFTER_BR_05E28_6
        endif
        if      FW_VERSION = 212
L_2DBF_V212 equ     $-DGROUP0
        db      000h, 0c6h, 02dh, 0cah, 02dh, 000h, 000h, 042h, 050h, 04dh, 000h, 046h, 050h, 042h, 000h, 0e0h
        db      02dh, 0e4h, 02dh, 0eah, 02dh, 0f2h, 02dh, 0fdh, 02dh, 014h, 02eh, 023h, 02eh, 029h, 02eh, 000h
        db      000h, 04fh, 046h, 046h, 000h
        endif
        if      FW_VERSION >= 214
L_3131  equ     $-DGROUP0
        db      000h, 038h, 031h, 03ch, 031h, 000h, 000h, 042h, 050h, 04dh, 000h, 046h, 050h, 042h, 000h
        db      "R1V1"
        db      05ch
        db      "1d1o1"
        db      086h, 031h, 095h, 031h, 09bh, 031h, 000h, 000h, 04fh, 046h, 046h, 000h
        endif
        if      FW_VERSION >= 212
        db      "FSK24", 0
        db      "PULSE96", 0
        db      "MIDI CLOCK", 0
        db      "MIDI CLOCK W/SONG PNTR", 0
        db      "MIDI TIME CODE", 0
        db      "SMPTE", 0
        db      "1/4 NOTE CLICKS", 0
        endif
        if      FW_VERSION = 212
        db      03fh, 02eh, 047h, 02eh, 000h, 000h
        endif
        if      FW_VERSION >= 214
        db      0b1h, 031h, 0b9h, 031h, 000h, 000h
        endif
        if      FW_VERSION >= 212
        db      "FSK24  ", 0
        db      "PULSE96", 0
        endif
        if      FW_VERSION = 212
        db      05bh, 02eh, 05fh, 02eh, 064h, 02eh, 069h, 02eh, 06eh, 02eh, 000h, 000h, 04fh, 046h, 046h, 000h
        endif
        if      FW_VERSION >= 214
        db      0cdh, 031h, 0d1h, 031h, 0d6h, 031h, 0dbh, 031h, 0e0h, 031h, 000h, 000h, 04fh, 046h, 046h, 000h
        endif
        if      FW_VERSION >= 212
        db      "OUT1", 0
        db      "OUT2", 0
        db      "OUT3", 0
        db      "OUT4", 0
        endif
        if      FW_VERSION = 212
        db      079h, 02eh, 085h, 02eh, 000h, 000h
        endif
        if      FW_VERSION >= 214
        db      0ebh, 031h, 0f7h, 031h, 000h, 000h
        endif
        if      FW_VERSION >= 212
        db      "BAR 1      ", 0
        db      "CURRENT BAR", 0
        endif
        if      FW_VERSION = 212
        db      097h, 02eh, 09dh, 02eh, 000h, 000h
        endif
        if      FW_VERSION >= 214
        db      009h, 032h, 00fh, 032h, 000h, 000h
        endif
        if      FW_VERSION >= 212
        db      "EXACT", 0
        db      "BEFORE V2.0", 0
TBL_321B equ     $-DGROUP0
L_321B  equ     $-DGROUP0
        db      017h, 018h, 01dh, 01dh
        RUN_AFTER_BR_05E28
STR_344B equ     $-DGROUP0
        db      "    Frames/sec:", 0
STR_345B equ     $-DGROUP0
        db      "<Start>   <Stop>", 0
STR_346C equ     $-DGROUP0
        db      025h, 030h, 032h, 064h, 03ah, 025h, 030h, 032h, 064h, 03ah, 025h, 030h, 032h, 064h, 03ah, 02dh
L_347C  equ     $-DGROUP0
        db      02dh, 000h, 00ch, 00dh, 00eh, 00fh, 008h, 009h, 00ah, 00bh, 004h, 005h, 006h, 007h, 000h, 001h
        db      002h, 003h
STR_348E equ     $-DGROUP0
        db      "Tune Drums", 0
STR_3499 equ     $-DGROUP0
        db      03ch
        db      "All=0>", 0
        db      000h
L_34A2  equ     $-DGROUP0
        db      "Mode:", 0
TBL_34AA equ     $-DGROUP0+2
        db      03ah, 000h, 003h, 002h, 002h, 001h, 004h, 004h, 005h, 005h, 006h, 006h, 007h, 007h, 008h, 008h
        db      008h, 008h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h
TBL_34CA equ     $-DGROUP0
        db      "*&'$0/-)68134579<=>?@ABCDEFGHIJK"
TBL_34EA equ     $-DGROUP0
        db      07fh, 073h, 073h, 07fh
TBL_350A equ     $-DGROUP0+1ch
        db      "ZZZZLLZZZZZZffffffffffffffff%@@@", 0
        db      025h, 05bh, 07fh, 000h, 025h, 05bh, 07fh, 000h, 025h, 05bh, 07fh, 040h, 040h, 040h, 040h, 040h
TBL_352A equ     $-DGROUP0+0bh
        db      040h, 040h, 040h, 040h, 040h, 040h, 040h, 040h, 040h, 040h, 040h, 026h, 07fh, 07fh
        db      "&ffff33&&3333MMMMMMMMMMMMMMMM"
TBL_354A equ     $-DGROUP0
        db      004h, 003h, 002h, 003h, 002h, 008h, 001h, 008h, 001h, 007h, 021h, 006h, 005h, 00bh, 005h, 00ch
        db      00dh, 00eh, 009h, 00fh, 00ah, 010h, 000h, 000h, 011h, 012h, 013h, 014h, 015h, 016h, 017h, 018h
        db      019h, 01ah, 01bh, 01ch, 01dh, 01eh, 01fh
        db      " SYNTH", 0
L_3578  equ     $-DGROUP0
        db      035h, 00ch, 07dh, 000h, 071h, 002h, 02ah, 04ah, 040h, 002h, 018h, 000h, 090h, 000h, 012h, 011h
L_3588  equ     $-DGROUP0
STR_358A equ     $-DGROUP0+2
        db      000h, 000h, 025h, 032h, 064h, 000h
        endif

RUN_AFTER_BR_05E28_7 macro   {GLOBALSYMBOLS}

STR_358E equ     $-DGROUP0
        db      "<Cancel>", 0
        db      000h
STR_3598 equ     $-DGROUP0
        db      "(unused)        ", 0
STR_35A9 equ     $-DGROUP0
B_35A9  equ     $-DGROUP0
        db      "(unused)        ", 0
STR_35BA equ     $-DGROUP0
STR_35BE equ     $-DGROUP0+4
        db      054h, 052h, 04bh, 000h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 000h
STR_35CA equ     $-DGROUP0
STR_35CE equ     $-DGROUP0+4
        db      053h, 045h, 051h, 000h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 000h
STR_35DA equ     $-DGROUP0
        db      "Analyzing sequence, please wait ... ", 0
        db      000h
        if      FW_VERSION >= 214
        db      "MPC-60  ", 0
        db      000h
        endif
        if      FW_VERSION < 212
        db      "Recovering sequence, please wait ... ", 0
L_3E74_V112 equ     $-DGROUP0
        db      000h, 000h
        endif
STR_360A equ     $-DGROUP0
        db      "Help", 0
STR_360F equ     $-DGROUP0
        db      "%c %d %d", 0
        if      FW_VERSION >= 214
L_3618  equ     $-DGROUP0
        db      "06366696<6?6B6E6H6K6N6Q6C.", 0
        db      043h, 023h, 000h, 044h, 02eh, 000h, 044h, 023h, 000h, 045h, 02eh, 000h, 046h, 02eh, 000h, 046h
        db      023h, 000h, 047h, 02eh, 000h, 047h, 023h, 000h, 041h, 02eh, 000h, 041h, 023h, 000h, 042h, 02eh
        db      000h
        endif
        if      FW_VERSION = 212
L_329C_V212 equ     $-DGROUP0
        db      0b4h, 032h, 0b7h, 032h, 0bah, 032h, 0bdh, 032h, 0c0h, 032h, 0c3h, 032h, 0c6h, 032h, 0c9h, 032h
        db      0cch, 032h, 0cfh, 032h, 0d2h, 032h, 0d5h, 032h, 043h, 02eh, 000h, 043h, 023h, 000h, 044h, 02eh
        db      000h, 044h, 023h, 000h, 045h, 02eh, 000h, 046h, 02eh, 000h, 046h, 023h, 000h, 047h, 02eh, 000h
        db      047h, 023h, 000h, 041h, 02eh, 000h, 041h, 023h, 000h, 042h, 02eh, 000h
        endif
        if      FW_VERSION >= 212
STR_3654 equ     $-DGROUP0
        db      "Select option: ", 0
        else
        db      "Select Option: ", 0
        db      03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 000h, 03fh, 03fh, 03fh, 03fh
        db      03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 000h
        endif
STR_3664 equ     $-DGROUP0
        db      "Attention!", 0
STR_366F equ     $-DGROUP0
        db      "<Cancel>", 0
STR_3678 equ     $-DGROUP0
        db      "[Error code: %04x]", 0
        if      FW_VERSION >= 212
        db      000h
STR_368C equ     $-DGROUP0
        db      "Extern Sync", 0
STR_3698 equ     $-DGROUP0
        db      "%2d/%2d   Bars:%3d", 0
        else
TBL_3ED3_V112 equ     $-DGROUP0
        db      000h, 073h, 0cbh, 050h, 0c3h, 0c2h, 0a2h, 0ech, 0a2h
        db      "(Ext Sync) ", 0
        endif
STR_36AB equ     $-DGROUP0
        db      "(Ext)", 0
STR_36B1 equ     $-DGROUP0
        db      025h
        db      "3d.%d", 0
        db      02dh, 02dh, 000h
STR_36BB equ     $-DGROUP0
        db      "%02d:%02d:%02d:%02d", 0
STR_36CF equ     $-DGROUP0
        db      025h, 030h, 032h, 064h, 03ah, 025h, 030h, 032h, 064h, 03ah, 025h, 030h, 032h, 064h, 03ah, 02dh
        endm
        if      FW_VERSION >= 212
        RUN_AFTER_BR_05E28_7
        db      02dh, 000h
STR_36E1 equ     $-DGROUP0
        db      "(Ext)", 0
STR_36E7 equ     $-DGROUP0
        db      025h
        db      "3d.%d", 0
        endif

RUN_AFTER_BR_05E28_8 macro   {GLOBALSYMBOLS}

STR_36EE equ     $-DGROUP0
        db      "(unused)        ", 0
        db      000h
STR_3700 equ     $-DGROUP0
        db      "(Receiving midi sample dump...)", 0
STR_3720 equ     $-DGROUP0
        db      "(Converting to special data format...)", 0
        db      000h
STR_3748 equ     $-DGROUP0
        db      "(Converting to linear data format...)", 0
STR_376E equ     $-DGROUP0
        db      "(Sending sample data over midi ...)", 0
        if      FW_VERSION >= 212
B_3794  equ     $-DGROUP0+2
B_3795  equ     $-DGROUP0+3
B_3796  equ     $-DGROUP0+4
B_379A  equ     $-DGROUP0+8
        db      0f0h, 07eh, 000h, 000h, 000h, 0f7h, 0f0h, 07eh, 000h, 0f7h
        endif
STR_379C equ     $-DGROUP0
        db      "(Receiving midi sample dump...)", 0
STR_37BC equ     $-DGROUP0
        db      "(Converting to special data format...)", 0
        db      000h
STR_37E4 equ     $-DGROUP0
        db      "(Converting to linear data format...)", 0
STR_380A equ     $-DGROUP0
        db      "(Sending sample data over midi ...)", 0
        endm
        if      FW_VERSION >= 212
        RUN_AFTER_BR_05E28_8
STR_382E equ     $-DGROUP0
        db      "2nd Sequence", 0
STR_383B equ     $-DGROUP0
        db      "On/Off:", 0
STR_3843 equ     $-DGROUP0
        db      "  Sequence:", 0
        db      02dh, 000h
STR_3851 equ     $-DGROUP0
        db      "(This sequence will play simultaneously", 0
        db      00ah
        db      " with the active sequence or song.)", 0
STR_389E equ     $-DGROUP0
        db      "Sort Tracks", 0
STR_38AA equ     $-DGROUP0
        db      "(Tracks between those displayed above", 0
STR_38D0 equ     $-DGROUP0
        db      "will be renumbered.)", 0
STR_38E5 equ     $-DGROUP0
        db      "<Execute>", 0
STR_38EF equ     $-DGROUP0
        db      " Place track:", 0
        db      02dh, 000h
STR_38FF equ     $-DGROUP0
        db      "before track:", 0
        endif
        if      FW_VERSION = 212
        db      02dh, 000h, 000h, 09ah, 035h, 0a3h, 035h, 000h, 000h
        endif
        if      FW_VERSION >= 214
        db      02dh, 000h, 000h, 016h, 039h, 01fh, 039h, 000h, 000h
        endif
        if      FW_VERSION >= 212
        db      "VELOCITY", 0
        db      "DURATION", 0
        endif
        if      FW_VERSION = 212
        db      0b6h, 035h, 0cah, 035h, 0e5h, 035h, 000h, 036h, 000h, 000h
        endif
        if      FW_VERSION >= 214
        db      "29F9a9|9", 0
        db      000h
        endif
        if      FW_VERSION >= 212
        db      "ADD 'VALUE' TO EACH", 0
        db      "SUBTRACT 'VALUE' FROM EACH", 0
        db      "MULTIPLY EACH BY 'VALUE' %", 0
        db      "REPLACE EACH WITH 'VALUE'", 0
STR_3996 equ     $-DGROUP0
        db      "Edit Sequence", 0
        db      "1)View time sign    2)Create sequence"
        db      00ah, 000h
        db      "3)Insert blank bars 4)Delete bars"
        db      00ah, 000h
STR_39EE equ     $-DGROUP0
        db      "5)Copy all tracks   6)Copy/merge a track", 0
        db      "7)Copy a sequence   8)Convert song"
        db      00ah, 000h
STR_3A3B equ     $-DGROUP0
        db      "9)Change bar length 0)Change veloc/dur", 0
STR_3A62 equ     $-DGROUP0
        db      "View Time Signature", 0
        endif
STR_3A76 equ     $-DGROUP0
        db      "<NextPage><PreviousPage>", 0
STR_3A8F equ     $-DGROUP0
        db      "Empty sequence", 0
STR_3A9E equ     $-DGROUP0
        db      "Bar%3d -%3d:%2d/%2d", 0
STR_3AB2 equ     $-DGROUP0
        db      "Bar%3d -%3d:%2d/%2d", 0
        if      FW_VERSION < 212
        db      "Create New Time Sig/Number of Bars", 0
        db      "Number of bars:", 0
        db      "Time sig: ", 0
        db      02fh, 000h
        db      "End:", 0
        db      "Loop bar#:", 0
        db      "(This will erase existing sequence!)", 0
        db      "<Execute>", 0
        elseif  FW_VERSION = 212
        db      "T7V7X7Z7", 0
        db      000h, 041h, 000h, 042h, 000h, 043h, 000h, 044h, 000h
        db      "b7f7", 0
        db      000h, 04fh, 046h, 046h, 000h
        else
        db      0d0h, 03ah, 0d2h, 03ah, 0d4h, 03ah, 0d6h, 03ah, 000h, 000h, 041h, 000h, 042h, 000h, 043h, 000h
        db      044h, 000h, 0deh, 03ah, 0e2h, 03ah, 000h, 000h, 04fh, 046h, 046h, 000h
        endif
        if      FW_VERSION >= 212
        db      "TO BAR", 0
STR_3AE9 equ     $-DGROUP0
        db      "Create New Sequence", 0
STR_3AFD equ     $-DGROUP0
        db      "Time sig:", 0
        db      02fh, 000h
STR_3B09 equ     $-DGROUP0
        db      "       Number of bars:", 0
STR_3B20 equ     $-DGROUP0
        db      "Loop:", 0
STR_3B27 equ     $-DGROUP0+1
        db      000h, 020h, 020h, 020h, 000h
STR_3B2B equ     $-DGROUP0
        db      "       Tempo:", 0
        db      020h, 000h
STR_3B3B equ     $-DGROUP0
        db      "Midi channel for track ", 0
STR_3B53 equ     $-DGROUP0
        db      " (0=Unused):", 0
        db      000h
STR_3B61 equ     $-DGROUP0
        db      "<Execute>", 0
STR_3B6B equ     $-DGROUP0
        db      020h, 020h, 020h, 000h
        endif
STR_3B6F equ     $-DGROUP0
        db      "Creating new format ...", 0
STR_3B87 equ     $-DGROUP0
        db      "Insert Blank Bars", 0
STR_3B99 equ     $-DGROUP0
        db      "Number of bars:", 0
STR_3BA9 equ     $-DGROUP0
        db      "      Time sig: ", 0
        db      02fh, 000h
STR_3BBC equ     $-DGROUP0
        db      "Insert before bar:", 0
STR_3BCF equ     $-DGROUP0
        db      "<Execute>", 0
STR_3BD9 equ     $-DGROUP0
        db      "Inserting bars ...", 0
STR_3BEC equ     $-DGROUP0
        db      "Delete Bars", 0
STR_3BF8 equ     $-DGROUP0
        db      "From bar:", 0
STR_3C02 equ     $-DGROUP0
        db      "To bar:", 0
        if      FW_VERSION < 212
        db      "(Note: Deletion of bars may affect loop-to-bar status.)", 0
        endif
STR_3C0A equ     $-DGROUP0
        db      "<Execute>", 0
STR_3C14 equ     $-DGROUP0
        db      "Deleting sequence ...", 0
STR_3C2A equ     $-DGROUP0
        db      "Deleting bars ...", 0
STR_3C3C equ     $-DGROUP0
        db      "Copy all tracks from", 0
STR_3C51 equ     $-DGROUP0
        db      "Sequence: ", 0
STR_3C5C equ     $-DGROUP0
        db      "From bar:", 0
STR_3C66 equ     $-DGROUP0
        db      "To bar:", 0
STR_3C6E equ     $-DGROUP0
        db      "Copy all tracks to", 0
STR_3C81 equ     $-DGROUP0
        db      "Sequence: ", 0
STR_3C8C equ     $-DGROUP0
        db      "Copies:  ", 0
STR_3C96 equ     $-DGROUP0
        db      "Insert before bar:", 0
STR_3CA9 equ     $-DGROUP0
        db      "<Execute>", 0
STR_3CB3 equ     $-DGROUP0
        db      "Copying bars ...", 0
STR_3CC4 equ     $-DGROUP0
        db      025h, 030h, 032h, 064h, 000h
STR_3CC9 equ     $-DGROUP0
        db      "%02d and %02d", 0
STR_3CD7 equ     $-DGROUP0
        db      "<Abort>", 0
        if      FW_VERSION < 212
        db      0a2h, 025h, 0aah, 025h, 000h, 000h
        elseif  FW_VERSION = 212
        db      "i9q9", 0
        db      000h
        else
        db      0e5h, 03ch, 0edh, 03ch, 000h, 000h
        endif
        db      "REPLACE", 0
        db      "MERGE  ", 0
STR_3CF5 equ     $-DGROUP0
        db      "Copy/merge a track from", 0
STR_3D0D equ     $-DGROUP0
        db      "Sequence: ", 0
STR_3D18 equ     $-DGROUP0
        db      "Track:", 0
        if      FW_VERSION < 212
        db      "From bar:", 0
        db      "To bar:", 0
        else
STR_3D1F equ     $-DGROUP0
        db      "From:", 0
STR_3D25 equ     $-DGROUP0
        db      054h, 06fh, 03ah, 000h
        endif
STR_3D29 equ     $-DGROUP0
        db      "Copy/merge a track to", 0
STR_3D3F equ     $-DGROUP0
        db      "Sequence: ", 0
STR_3D4A equ     $-DGROUP0
        db      "Track:", 0
        if      FW_VERSION < 212
        db      "Copies:  ", 0
        db      "1st bar:", 0
        else
STR_3D51 equ     $-DGROUP0
        db      "Copies:", 0
STR_3D59 equ     $-DGROUP0
        db      "Start copy at:", 0
        endif
STR_3D68 equ     $-DGROUP0
        db      "Mode:", 0
STR_3D6E equ     $-DGROUP0
        db      "<Execute>", 0
STR_3D78 equ     $-DGROUP0
        db      "Copying track ...", 0
STR_3D8A equ     $-DGROUP0
        db      "Copy One Sequence To Another", 0
STR_3DA7 equ     $-DGROUP0
        db      "Copy contents of sequence:", 0
STR_3DC2 equ     $-DGROUP0
        db      "into sequence:", 0
STR_3DD1 equ     $-DGROUP0
        db      "(The existing contents of the des-", 0
STR_3DF4 equ     $-DGROUP0
        db      "tination sequence will be erased!)", 0
STR_3E17 equ     $-DGROUP0
        db      "<Execute>", 0
STR_3E21 equ     $-DGROUP0
        db      "Copying sequence ...", 0
STR_3E36 equ     $-DGROUP0
        db      "Convert Song to Sequence", 0
STR_3E4F equ     $-DGROUP0
        db      "Convert song:", 0
STR_3E5D equ     $-DGROUP0
        db      "Into sequence:", 0
        if      FW_VERSION < 212
        db      "(the existing contents of the", 0
        else
STR_3E6C equ     $-DGROUP0
        db      "(The existing contents of the", 0
        endif
STR_3E8A equ     $-DGROUP0
        db      "destination sequence will be erased!)", 0
STR_3EB0 equ     $-DGROUP0
        db      "<Execute>", 0
STR_3EBA equ     $-DGROUP0
        db      "Converting song ...", 0
STR_3ECE equ     $-DGROUP0
        db      025h, 030h, 032h, 064h, 000h
STR_3ED3 equ     $-DGROUP0
        db      "%02d and %02d", 0
STR_3EE1 equ     $-DGROUP0
        db      "<Abort>", 0
TBL_3EE9 equ     $-DGROUP0
TBL_3EE9_2 equ     $-DGROUP0
        db      004h, 000h, 008h, 000h, 010h, 000h, 020h, 000h
        if      FW_VERSION < 212
        db      "Shorten / Lengthen a Bar", 0
        else
STR_3EF1 equ     $-DGROUP0
        db      "Change Bar Length", 0
        endif
STR_3F03 equ     $-DGROUP0
        db      "Change the time signature of bar:", 0
STR_3F25 equ     $-DGROUP0
        db      "from       to ", 0
        db      02fh, 000h
STR_3F36 equ     $-DGROUP0
        db      "(If the new time sig is shorter, the end", 0
STR_3F5F equ     $-DGROUP0
        db      "of the bar is truncated; if longer,", 0
STR_3F83 equ     $-DGROUP0
        db      "blank space is added to the end.)", 0
        if      FW_VERSION < 212
        db      "%02d/%02d", 0
        db      "<Execute>", 0
        db      "%02d/%02d", 0
        db      "Changing bar ...", 0
        db      "Step Edit", 0
        db      "<Insert> <Delete> <PlayEvent> <Options>", 0
        db      "Step Edit Options", 0
        db      "Event to be inserted: ", 0
        db      00ah
        db      "Auto step increment on key release:", 0
        db      "-----Select Events To Be Displayed------", 0
        db      "Event Type:", 0
        db      "  Display?:", 0
        db      "Controller#:", 0
        db      "            Display?:", 0
        db      086h, 029h, 088h, 029h, 000h, 000h, 02dh, 000h, 02bh, 000h, 0b8h, 020h, 00dh, 006h, 098h, 000h
        db      03ch, 040h, 040h, 060h, 000h, 0a0h, 000h, 03ch, 040h, 0b0h, 000h, 001h, 000h, 0c0h, 000h, 000h
        db      0d0h, 000h, 040h, 0e0h, 000h, 000h, 040h, 0f0h, 000h, 000h, 0f0h, 000h, 047h, 000h, 044h, 045h
        db      001h, 000h, 040h, 0f0h, 000h, 047h, 000h, 044h, 045h, 002h, 000h, 040h, 0f0h, 000h, 047h, 000h
TBL_29C0_V112 equ     $-DGROUP0
        db      044h, 045h, 003h, 000h, 040h, 0f0h, 000h, 047h, 000h, 044h, 045h, 004h, 000h, 000h, 040h, 08ah
        db      029h, 08eh, 029h, 095h, 029h, 099h, 029h, 09dh, 029h, 0a0h, 029h, 0a3h, 029h, 0a7h, 029h, 0aah
TBL_29E0_V112 equ     $-DGROUP0
        db      029h, 0b3h, 029h, 0bch, 029h, 0c5h, 029h, 004h, 007h, 004h, 004h, 003h, 003h, 004h, 003h, 009h
        db      009h, 009h, 00ah
        RUN_AFTER_BR_05E28_6
        db      000h
        else
STR_3FA5 equ     $-DGROUP0
        db      "<Execute>", 0
STR_3FAF equ     $-DGROUP0
        db      "Changing bar ...", 0
STR_3FC0 equ     $-DGROUP0
        db      025h
        db      "2d/%2d", 0
STR_3FC8 equ     $-DGROUP0
        db      "Change Velocity/Duration", 0
STR_3FE1 equ     $-DGROUP0
        db      "Track:", 0
STR_3FE8 equ     $-DGROUP0
        db      "   From:", 0
STR_3FF1 equ     $-DGROUP0
        db      054h, 06fh, 03ah, 000h
STR_3FF5 equ     $-DGROUP0
        db      "Change:", 0
STR_3FFD equ     $-DGROUP0
        db      "Value:", 0
STR_4004 equ     $-DGROUP0
        db      "Action:", 0
STR_400C equ     $-DGROUP0
        db      "<Execute>", 0
STR_4016 equ     $-DGROUP0
        db      "Changing Notes ...  ", 0
        endif
        if      FW_VERSION = 212
        db      000h, 0b6h, 03ch, 0c3h, 03ch, 000h, 000h
        endif
        if      FW_VERSION >= 214
        db      000h, 032h, 040h, 03fh, 040h, 000h, 000h
        endif
        if      FW_VERSION >= 212
        db      "SAME AS STEP", 0
        db      "AS PLAYED", 0
STR_4049 equ     $-DGROUP0
        db      "Step Edit", 0
STR_4053 equ     $-DGROUP0
        db      "<Insert> <Delete> <PlayEvent> <Options>", 0
STR_407B equ     $-DGROUP0
        db      "Step Edit Options", 0
STR_408D equ     $-DGROUP0
        db      "Event to insert: ", 0
STR_409F equ     $-DGROUP0
        db      "Auto step increment on key release:", 0
STR_40C3 equ     $-DGROUP0
        db      "Duration of recorded notes:", 0
STR_40DF equ     $-DGROUP0
        db      "Step Edit Display Filter", 0
STR_40F8 equ     $-DGROUP0
        db      "View:", 0
STR_40FE equ     $-DGROUP0
        db      020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h
STR_4116 equ     $-DGROUP0+8
        db      020h, 020h, 020h, 020h, 020h, 020h, 020h, 000h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h
        db      020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 000h
        endif
STR_412E equ     $-DGROUP0
        db      "Edit Loop", 0
STR_4138 equ     $-DGROUP0
        db      "# of Bars:", 0
STR_4143 equ     $-DGROUP0
        db      "       1st Bar:", 0
STR_4153 equ     $-DGROUP0
        db      "<Turn It Off><Turn Off-Ignore Changes>", 0
STR_417A equ     $-DGROUP0
        db      "Saving loop data ...", 0
STR_418F equ     $-DGROUP0
        db      "Restoring original sequence ...", 0
STR_41AF equ     $-DGROUP0
        db      "<Turn Loop On>", 0
STR_41BE equ     $-DGROUP0
        db      "Analyzing sequence, please wait ...", 0
        if      FW_VERSION < 212
        db      072h, 02bh, 077h, 02bh, 000h, 000h
        db      "STOP", 0
        db      "LOOP", 0
        elseif  FW_VERSION = 212
        db      06ch, 03eh, 070h, 03eh, 000h, 000h, 04fh, 046h, 046h, 000h
        else
        db      0e8h, 041h, 0ech, 041h, 000h, 000h, 04fh, 046h, 046h, 000h
        endif
        if      FW_VERSION >= 212
        db      "TO STEP", 0
TBL_41F4 equ     $-DGROUP0
        db      017h, 018h, 01dh, 01dh
        endif
STR_41F8 equ     $-DGROUP0
        db      "Song Mode", 0
STR_4202 equ     $-DGROUP0
        db      "Song:", 0
        if      FW_VERSION < 212
        db      "    End:", 0
        db      "     Loop step:", 0
        db      "--------- Contents of Step:", 0
        db      020h, 02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 000h
        db      "Sequence:", 0
        db      "Reps(0=end): ", 0
        db      "Name:", 0
        db      "Size (Bars):", 0
        db      "<InsertB4>  <Delete>  <Step-1>  <Step+1>", 0
        db      025h, 033h, 064h, 000h
        db      "(end of song)", 0
        db      "Erase Track (All or Part)", 0
        db      "Track:", 0
        db      "From bar:", 0
        db      "To bar:", 0
        db      "------- Press Drums To Be Erased -------", 0
        db      "<Erase It><All Bars><All Drums><Options>", 0
        db      02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 020h, 04eh, 06fh, 074h, 065h
        db      073h, 020h, 054h, 06fh, 020h, 045h, 072h, 061h, 073h, 065h, 020h, 02dh, 02dh, 02dh, 02dh, 02dh
        db      02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 02dh, 000h
        else
        db      02dh, 000h
STR_420A equ     $-DGROUP0
        db      "Loop:", 0
STR_4211 equ     $-DGROUP0+1
        db      000h, 020h, 020h, 020h, 000h
STR_4215 equ     $-DGROUP0
        db      "Song starts at SMPTE#:", 0
        db      03ah, 000h, 03ah, 000h, 03ah, 000h, 02eh, 000h
STR_4234 equ     $-DGROUP0
        db      "========= Contents of Step:", 0
STR_4250 equ     $-DGROUP0
        db      020h, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 03dh, 000h
STR_425B equ     $-DGROUP0
        db      "Sqnc:", 0
        db      02dh, 000h
STR_4263 equ     $-DGROUP0
        db      "Reps(0=end): ", 0
STR_4271 equ     $-DGROUP0
        db      "<InsertB4>  <Delete>  <Step-1>  <Step+1>", 0
STR_429A equ     $-DGROUP0
        db      020h, 020h, 020h, 000h
STR_429E equ     $-DGROUP0
        db      "Bars:", 0
STR_42A4 equ     $-DGROUP0
        db      025h, 033h, 064h, 000h
STR_42A8 equ     $-DGROUP0
        db      "Tempo:", 0
STR_42AF equ     $-DGROUP0
        db      "(end of song)", 0
        db      000h
STR_42BE equ     $-DGROUP0
        db      "Erase", 0
STR_42C4 equ     $-DGROUP0
        db      "Track(0=All):", 0
STR_42D2 equ     $-DGROUP0
        db      "From:", 0
STR_42D8 equ     $-DGROUP0
        db      054h, 06fh, 03ah, 000h
STR_42DC equ     $-DGROUP0
        db      "Erase filter", 0
STR_42E9 equ     $-DGROUP0
        db      "Erase:", 0
STR_42F0 equ     $-DGROUP0
        db      "    (All notes/drums will be erased)    ", 0
STR_4319 equ     $-DGROUP0
        db      "<Erase It><All Bars>", 0
STR_432E equ     $-DGROUP0
        db      "Press Drums To Be Erased", 0
STR_4347 equ     $-DGROUP0
        db      "<Erase It><All Bars><All Drums>", 0
        endif
STR_4367 equ     $-DGROUP0
        db      "Lowest: ", 0
STR_4370 equ     $-DGROUP0
        db      "Highest: ", 0
        if      FW_VERSION < 212
        db      "(Press 2 keys on Midi keyboard", 0
        db      "to set lowest & highest fields)", 0
        db      "<Erase It><All Bars><No Notes><Options>", 0
        db      "Erase Options", 0
        db      "1)Select Which Events Get Erased"
        db      00ah, 000h
        db      "2)Erase All Tracks"
        db      00ah, 000h
        db      "Select Which Events Get Erased", 0
        db      "Event Type:", 0
        db      "    Erase?:", 0
        db      "Controller#:", 0
        db      "              Erase?:", 0
        db      "Erase All Tracks", 0
        db      "From bar:", 0
        db      "To bar:", 0
        db      "  (All events will be erased. Tempo"
        db      00ah, 000h
        db      "  changes are retained.)", 0
        db      "<Execute>", 0
        db      "Erasing ...", 0
        db      000h, 076h, 02eh, 07eh, 02eh, 000h, 000h
        else
STR_437A equ     $-DGROUP0
        db      "    (Press 2 keys to set note range)    ", 0
STR_43A3 equ     $-DGROUP0
        db      "<Erase It><All Bars><All Notes>", 0
STR_43C3 equ     $-DGROUP0
        db      "Erasing ...", 0
        endif
        if      FW_VERSION = 212
        db      000h, 05ah, 040h, 062h, 040h, 000h, 000h
        endif
        if      FW_VERSION >= 214
        db      000h, 0d6h, 043h, 0deh, 043h, 000h, 000h
        endif
        db      "EARLIER", 0
        db      "LATER  ", 0
        if      FW_VERSION < 212
        db      096h, 02eh, 0a1h, 02eh, 0ach, 02eh, 0b7h, 02eh, 0c2h, 02eh, 0cdh, 02eh, 0d8h, 02eh, 000h, 000h
        elseif  FW_VERSION = 212
        db      07ah, 040h, 085h, 040h, 090h, 040h, 09bh, 040h, 0a6h, 040h, 0b1h, 040h, 0bch, 040h, 000h, 000h
        else
        db      0f6h, 043h, 001h, 044h, 00ch, 044h, 017h, 044h, 022h
        db      "D-D8D", 0
        db      000h
        endif
        db      "OFF(1/384)", 0
        db      "1/8 NOTE  ", 0
        db      "1/8 TRPLT ", 0
        db      "1/16 NOTE ", 0
        db      "1/16 TRPLT", 0
        db      "1/32 NOTE ", 0
        db      "1/32 TRPLT", 0
TBL_4443 equ     $-DGROUP0
TBL_4443_2 equ     $-DGROUP0
        db      001h, 030h, 020h, 018h, 010h, 00ch, 008h
STR_444A equ     $-DGROUP0
        db      "Timing Correct / Step Size", 0
        if      FW_VERSION < 212
        db      "Note Value:", 0
        db      "    Shuffle(%):", 0
        db      "Shift Timing:", 0
        db      "     Shift Amount:", 0
        db      "Move Existing Notes", 0
        db      "From Bar:", 0
        db      " To Bar:", 0
        db      "  Track(0=All):", 0
        db      "<Move Existing>", 0
        db      "Moving notes ...", 0
        db      "Auto Punch", 0
        db      "On/Off:", 0
        db      "Auto Punch: In=", 0
        db      " Out=", 0
        db      "Last Punch: In=", 0
        else
STR_4465 equ     $-DGROUP0
        db      "Note value:", 0
STR_4471 equ     $-DGROUP0
        db      "    Shuffle(%):", 0
STR_4481 equ     $-DGROUP0
        db      "Shift timing:", 0
STR_448F equ     $-DGROUP0
        db      "     Shift amount:", 0
STR_44A2 equ     $-DGROUP0
        db      "Move Existing Notes", 0
STR_44B6 equ     $-DGROUP0
        db      "Track(0=All):", 0
STR_44C4 equ     $-DGROUP0
        db      "From:", 0
STR_44CA equ     $-DGROUP0
        db      054h, 06fh, 03ah, 000h
STR_44CE equ     $-DGROUP0
        db      "<Move Existing>", 0
STR_44DE equ     $-DGROUP0
        db      "Moving notes... (this may take a while)", 0
STR_4506 equ     $-DGROUP0
        db      "Auto Punch", 0
STR_4511 equ     $-DGROUP0
        db      "On/off:", 0
STR_4519 equ     $-DGROUP0
        db      "Auto punch: In=", 0
STR_4529 equ     $-DGROUP0
        db      " Out=", 0
STR_452F equ     $-DGROUP0
        db      "Last punch: In=", 0
        endif
STR_453F equ     $-DGROUP0
        db      " Out=", 0
STR_4545 equ     $-DGROUP0
        db      "<Use 'Last'>", 0
STR_4552 equ     $-DGROUP0
        db      "Locate", 0
STR_4559 equ     $-DGROUP0
        db      "Press Softkeys to go to markers:", 0
STR_457A equ     $-DGROUP0
        db      "Marker A: ", 0
STR_4585 equ     $-DGROUP0
        db      "Marker B: ", 0
STR_4590 equ     $-DGROUP0
        db      "Marker C: ", 0
STR_459B equ     $-DGROUP0
        db      03ch, 047h, 06fh, 074h, 06fh, 027h, 041h, 027h, 03eh, 03ch
        db      "Goto'B'><Goto'C'><Load'Bar'>", 0
        if      FW_VERSION < 212
        db      05ch, 030h, 063h, 030h, 000h, 000h
        db      "NORMAL", 0
        db      "FIXED ", 0
        db      "r0w0"
        db      082h, 030h, 000h, 000h
        db      "NONE", 0
        db      "DRUM NOTES", 0
        db      "NOTES/MIX/TUNE", 0
        db      "Midi", 0
        db      "1)Assign Midi Channels to Outputs,", 0
        db      "  Note#s To Drums, Drums To Note#s", 0
        db      "2)Midi Input Filter, Midi Drums Channel,", 0
        db      "  Midi Soft Thru", 0
        db      "3)Turn All Notes Off", 0
        db      "Assign Midi Channels To Outputs", 0
        db      030h, 031h, 03ah, 020h, 020h, 030h, 032h, 03ah, 020h, 020h, 030h, 033h, 03ah, 020h, 020h, 030h
        db      034h, 03ah, 020h, 020h, 030h, 035h, 03ah, 020h, 020h, 030h, 036h, 03ah, 020h, 020h, 030h, 037h
        db      03ah, 020h, 020h, 030h, 038h, 03ah, 000h, 030h, 039h, 03ah, 020h, 020h, 031h, 030h, 03ah, 020h
        db      020h, 031h, 031h, 03ah, 020h, 020h, 031h, 032h, 03ah, 020h, 020h, 031h, 033h, 03ah, 020h, 020h
        db      031h, 034h, 03ah, 020h, 020h, 031h, 035h, 03ah, 020h, 020h, 031h, 036h, 03ah, 000h, 000h
        db      "Assign Incoming Note#s To Drums", 0
        db      "Incoming notes play drums:", 0
        db      "Incoming Note#:", 0
        db      "    Plays:", 0
        db      "Assign Outgoing Drums To Note#s", 0
        db      "Outgoing Drum:", 0
        db      "    Plays Note#:", 0
        db      "Midi Input Filter", 0
        db      "Event:", 0
        db      "  Pass?:", 0
        db      "  Min Chng:", 0
        db      "Controller#:", 0
        db      "  Pass?:", 0
        db      "  Min Chng:", 0
        db      "Velocity Mode:", 0
        db      "  Fixed Velocity:", 0
        db      "Other Midi", 0
        db      "Midi Drums Chan:", 0
        db      "   Midi Soft Thru:", 0
        db      "Default Midi Chan for New Tracks:", 0
        db      "Midi drum data sent out:", 0
        db      000h, 012h, 033h, 017h, 033h, 000h, 000h
        db      "UP  ", 0
        db      "DOWN", 0
        db      "Transpose", 0
        db      "Direction:", 0
        db      "     Amount(1/2 Tones):", 0
        db      "Track(0=All):", 0
        db      "(Play synth key to set direction/amount)", 0
        db      "Transpose Existing Notes", 0
        db      "From Bar:", 0
        db      "       To Bar:", 0
        db      "<Transpose Permanent>", 0
        db      "Transposing ...  ", 0
TBL_33DA_V112 equ     $-DGROUP0
        db      0ech, 001h, 0eah, 001h, 0eeh, 001h, 0cah, 001h, 0c8h, 001h, 0cch, 001h, 0ceh, 001h, 0c6h, 001h
        db      0e4h, 001h, 0e2h, 001h, 0e6h, 001h, 0c0h, 001h, 0e8h, 001h, 0c2h, 001h, 0c4h, 001h, 0e0h, 001h
TBL_33FA_V112 equ     $-DGROUP0
        db      003h, 002h, 002h, 001h, 004h, 004h, 005h, 005h, 006h, 006h, 007h, 007h, 008h, 008h, 008h, 008h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
TBL_341A_V112 equ     $-DGROUP0
        db      "*&'$0/-)68134579<=>?@ABCDEFGHIJK"
TBL_343A_V112 equ     $-DGROUP0
        db      07fh, 073h, 073h, 07fh
TBL_343E_V112 equ     $-DGROUP0
        db      "ZZZZLLZZZZZZffffffffffffffff%@@@", 0
        db      025h, 05bh, 07fh, 000h, 025h, 05bh, 07fh, 000h, 025h, 05bh, 07fh, 040h, 040h, 040h, 040h, 040h
TBL_346F_V112 equ     $-DGROUP0
        db      040h, 040h, 040h, 040h, 040h, 040h, 040h, 040h, 040h, 040h, 040h, 026h, 07fh, 07fh
        db      "&ffff33&&3333MMMMMMMMMMMMMMMM"
TBL_349A_V112 equ     $-DGROUP0
        db      004h, 003h, 002h, 003h, 002h, 008h, 001h, 008h, 001h, 007h, 001h, 006h, 005h, 00bh, 005h, 00ch
        db      00dh, 00eh, 009h, 00fh, 00ah, 010h, 000h, 000h, 011h, 012h, 013h, 014h, 015h, 016h, 017h, 018h
        db      019h, 01ah, 01bh, 01ch, 01dh, 01eh, 01fh
        db      " SYNTH", 0
        db      0ceh, 034h, 0d7h, 034h, 000h, 000h
        db      "STANDARD", 0
        db      053h, 039h, 030h, 030h, 000h, 0fch, 034h, 0ffh, 034h, 002h, 035h, 005h, 035h, 008h, 035h, 00bh
        db      035h, 00eh, 035h, 011h, 035h, 014h, 035h, 017h, 035h, 01ah, 035h, 01dh, 035h, 020h, 035h, 023h
        db      035h, 026h, 035h, 000h, 000h, 037h, 04ch, 000h, 036h, 04ch, 000h, 035h, 04ch, 000h, 034h, 04ch
        db      000h, 033h, 04ch, 000h, 032h, 04ch, 000h, 031h, 04ch, 000h, 043h, 020h, 000h, 031h, 052h, 000h
        db      032h, 052h, 000h, 033h, 052h, 000h, 034h, 052h, 000h, 035h, 052h, 000h, 036h, 052h, 000h, 037h
L_3527_V112 equ     $-DGROUP0
        db      052h, 000h, 00ch, 00dh, 00eh, 00fh, 008h, 009h, 00ah, 00bh, 004h, 005h, 006h, 007h, 000h, 001h
        db      002h, 003h
        db      "Sounds", 0
        db      "1)View Current Sounds, Double Play Mode"
        db      00ah, 000h
        db      "2)Sample New Sound    3)Edit a Sound"
        db      00ah, 000h
        db      "4)Tune Drums          5)Echo Mixer"
        db      00ah, 000h
        db      "6)Assign 8 Mix Outs   7)Midi Sample Dump", 0
        db      "8)Mix Modes, HiHat Decay Thresholds"
        db      00ah, 000h
        db      "9)Audio Trigger", 0
        db      "View/Rename/Delete Drum Sounds", 0
        db      "Drum:", 0
        db      "    Name:", 0
        db      "Size(sec):", 0
        db      "Free(sec):", 0
        db      "Double Play Mode", 0
        db      "Drum:", 0
        db      "            Also Plays:", 0
        db      "<DeleteSound>", 0
L_3693_V112 equ     $-DGROUP0
        db      "Sample New Sound", 0
L_36A4_V112 equ     $-DGROUP0
        db      "Drum:", 0
L_36AA_V112 equ     $-DGROUP0
        db      "    Name:", 0
        db      "All sequence memory, and the existing", 0
        db      "drum sound for the drum to be sampled", 0
        db      "into, will be erased! Are you sure you", 0
        db      "want to proceed?", 0
        RUN_AFTER_BR_05E28_5
        db      "(Record light=ON when threhold exceeded)", 0
L_37F7_V112 equ     $-DGROUP0
        db      "<Cancel>", 0
L_3800_V112 equ     $-DGROUP0
        db      "(Loading sound into Sound Generator)    ", 0
L_3829_V112 equ     $-DGROUP0
        db      "<Playback> <Ready...>", 0
        db      "Edit a Sound", 0
L_384C_V112 equ     $-DGROUP0
        db      "Drum:", 0
L_3852_V112 equ     $-DGROUP0
        db      "     Name:", 0
        db      "Start(msec):", 0
        db      "   End(msec):", 0
        db      "Fade (msec):", 0
        db      "<Playback> <CutoffEnds>", 0
        db      "sound", 0
        db      020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 000h
        db      "Tune Drums", 0
        db      03ch, 020h, 02bh
        db      " / - >  <All=0>", 0
        db      000h
L_38CB_V112 equ     $-DGROUP0
        db      "Mode:", 0
        db      03ah, 000h, 02bh, 000h, 02dh, 000h
        RUN_AFTER_BR_05E28_4
L_3B28_V112 equ     $-DGROUP0
        db      035h, 00ch, 07dh, 000h, 071h, 002h, 02ah, 04ah, 040h, 002h, 018h, 000h, 090h, 000h, 012h, 011h
TBL_3B38_V112 equ     $-DGROUP0
        db      006h, 008h, 00ch, 008h, 018h, 008h, 024h, 008h, 030h, 008h, 03ch, 008h, 048h, 008h, 055h, 008h
        db      061h, 008h, 06dh, 008h, 07ah, 008h, 086h, 008h
        phase   4060h
        db      093h, 008h, 0a0h, 008h, 0ach, 008h, 0b9h, 008h, 0c6h, 008h, 0d3h, 008h, 0e0h, 008h, 0eeh, 008h
        db      0fbh, 008h, 008h, 009h, 016h, 009h, 023h, 009h, 031h, 009h, 03eh, 009h, 04ch, 009h, 05ah, 009h
        db      068h, 009h, 075h, 009h, 083h, 009h, 092h, 009h, 0a0h, 009h, 0aeh, 009h, 0bch, 009h, 0cbh, 009h
        db      0d9h, 009h, 0e8h, 009h, 0f7h, 009h, 005h, 00ah, 014h, 00ah, 023h, 00ah, 032h, 00ah, 041h, 00ah
        db      051h, 00ah, 060h, 00ah, 06fh, 00ah, 07fh, 00ah, 08eh, 00ah, 09eh, 00ah, 0aeh, 00ah, 0beh, 00ah
        db      0ceh, 00ah, 0deh, 00ah, 0eeh, 00ah, 0feh, 00ah, 00eh, 00bh, 01fh, 00bh, 02fh, 00bh, 040h, 00bh
        db      050h, 00bh, 061h, 00bh, 072h, 00bh, 083h, 00bh, 094h, 00bh, 0a5h, 00bh, 0b6h, 00bh, 0c8h, 00bh
        db      0d9h, 00bh, 0ebh, 00bh, 0fdh, 00bh, 00eh, 00ch, 020h, 00ch, 032h, 00ch, 044h, 00ch, 056h, 00ch
        db      069h, 00ch, 07bh, 00ch, 08eh, 00ch, 0a0h, 00ch, 0b3h, 00ch, 0c6h, 00ch, 0d9h, 00ch, 0ech, 00ch
        db      0ffh, 00ch, 012h, 00dh, 026h, 00dh, 039h, 00dh, 04dh, 00dh, 060h, 00dh, 074h, 00dh, 088h, 00dh
        db      09ch, 00dh, 0b1h, 00dh, 0c5h, 00dh, 0d9h, 00dh, 0eeh, 00dh, 002h, 00eh, 017h, 00eh, 02ch, 00eh
        db      041h, 00eh, 056h, 00eh, 06ch, 00eh, 081h, 00eh, 096h, 00eh, 0ach, 00eh, 0c2h, 00eh, 0d8h, 00eh
        db      0eeh, 00eh, 004h, 00fh, 01ah, 00fh, 031h, 00fh, 047h, 00fh, 05eh, 00fh, 074h, 00fh, 08bh, 00fh
        db      0a2h, 00fh, 0bah, 00fh, 0d1h, 00fh, 0e8h, 00fh, 000h, 010h, 018h, 010h, 030h, 010h, 048h, 010h
        db      060h, 010h, 078h, 010h, 090h, 010h, 0a9h, 010h, 0c2h, 010h, 0dbh, 010h, 0f4h, 010h, 00dh, 011h
        db      026h, 011h, 03fh, 011h, 059h, 011h, 073h, 011h, 08dh, 011h, 0a7h, 011h, 0c1h, 011h, 0dbh, 011h
        db      0f6h, 011h, 010h, 012h, 02bh, 012h, 046h, 012h, 061h, 012h, 07ch, 012h, 098h, 012h, 0b3h, 012h
        db      0cfh, 012h, 0ebh, 012h, 007h, 013h, 023h, 013h, 040h, 013h, 05ch, 013h, 079h, 013h, 096h, 013h
        db      0b3h, 013h, 0d0h, 013h, 0edh, 013h, 00bh, 014h, 029h, 014h, 047h, 014h, 065h, 014h, 083h, 014h
        db      0a1h, 014h, 0c0h, 014h, 0dfh, 014h, 0feh, 014h, 01dh, 015h, 03ch, 015h, 05ch, 015h, 07bh, 015h
        db      09bh, 015h, 0bbh, 015h, 0dbh, 015h, 0fch, 015h, 01ch, 016h, 03dh, 016h, 05eh, 016h, 07fh, 016h
        db      0a1h, 016h
        RUN_AFTER_BR_05E28_8
        db      025h, 032h, 064h, 000h
        RUN_AFTER_BR_05E28_7
TBL_5516 equ     $-DGROUP0+2
        db      02dh, 000h, 000h, 003h, 006h, 009h, 00ch, 00fh, 012h, 015h, 018h, 01bh, 01fh, 022h
        else
STR_45C2 equ     $-DGROUP0
        db      "Transpose", 0
STR_45CC equ     $-DGROUP0
        db      "Track(0=All):", 0
STR_45DA equ     $-DGROUP0
        db      "Amount:", 0
STR_45E2 equ     $-DGROUP0
        db      "(Play synth key to set amount)", 0
STR_4601 equ     $-DGROUP0
        db      "Transpose Permanent", 0
STR_4615 equ     $-DGROUP0
        db      "From:", 0
STR_461B equ     $-DGROUP0
        db      054h, 06fh, 03ah, 000h
STR_461F equ     $-DGROUP0
        db      "<Transpose permanent>", 0
STR_4635 equ     $-DGROUP0
        db      "Transposing ...  ", 0
TBL_4648 equ     $-DGROUP0+1
        db      000h, 0ech, 001h, 0eah, 001h, 0eeh, 001h, 0cah, 001h, 0c8h, 001h, 0cch, 001h, 0ceh, 001h, 0c6h
        db      001h, 0e4h, 001h, 0e2h, 001h, 0e6h, 001h, 0c0h, 001h, 0e8h, 001h, 0c2h, 001h, 0c4h, 001h, 0e0h
        db      001h
STR_4668 equ     $-DGROUP0
        db      "Record All 16 Channels", 0
STR_467F equ     $-DGROUP0
        db      "Sqnc:", 0
        db      02dh, 000h
STR_4687 equ     $-DGROUP0
        db      "Time sig: ", 0
        db      02fh, 000h
STR_4694 equ     $-DGROUP0
        db      "Enter data, then press <Proceed>.", 0
        db      "WARNING: THE EXISTING SEQUENCE CONTENTS"
        db      00ah, 000h
STR_46DF equ     $-DGROUP0
        db      "WILL BE ERASED! Timing correct is forced", 0
STR_4708 equ     $-DGROUP0
        db      "to 'OFF (1/384)' during record.", 0
STR_4728 equ     $-DGROUP0
        db      "<Proceed>", 0
STR_4732 equ     $-DGROUP0
        db      "Record All 16 Channels", 0
STR_4749 equ     $-DGROUP0
        db      "Sqnc:%2d", 0
        db      02dh, 000h
STR_4754 equ     $-DGROUP0
        db      " Tmpo:", 0
        db      020h, 000h
STR_475D equ     $-DGROUP0
        db      "Tsig:  /     Bars:       Loop:OFF", 0
        db      " (Hold RECORD & play ext sequencer."
        db      00ah, 000h
        db      "  The channels will record into tracks"
        db      00ah, 000h
STR_47CC equ     $-DGROUP0
        db      "  1 through 16, with ", 0
STR_47E2 equ     $-DGROUP0
        db      "no drums track.", 0
STR_47F2 equ     $-DGROUP0
        db      "drums on %d.)", 0
STR_4800 equ     $-DGROUP0
        db      "Load an All Sounds File (.SET)", 0
        db      "This will erase all sounds currently in"
        db      00ah
        db      "memory!", 0
STR_484F equ     $-DGROUP0
        db      "<Load file>", 0
STR_485B equ     $-DGROUP0
        db      "loading file ...", 0
STR_486C equ     $-DGROUP0
        db      "Load an All Sounds File (.ST1)", 0
        db      "This will erase all sounds currently in"
        db      00ah
        db      "memory!", 0
STR_48BB equ     $-DGROUP0
        db      "<Load file>", 0
STR_48C7 equ     $-DGROUP0
        db      "loading file ... ", 0
STR_48D9 equ     $-DGROUP0
        db      "Load SET File", 0
STR_48E7 equ     $-DGROUP0
        db      "1)Load entire file. (This will erase all", 0
STR_4910 equ     $-DGROUP0
        db      "  sounds currently in memory!)", 0
STR_492F equ     $-DGROUP0
        db      "2)Load one sound from the SET file.", 0
STR_4953 equ     $-DGROUP0
        db      "Reading file.  Please wait ...", 0
STR_4972 equ     $-DGROUP0
        db      "Load One Sound from SET File", 0
STR_498F equ     $-DGROUP0
        db      "Select drum to load from file: ", 0
STR_49AF equ     $-DGROUP0
        db      "Select drum to load into: ", 0
STR_49CA equ     $-DGROUP0
        db      "Sound memory available (bytes):", 0
STR_49EA equ     $-DGROUP0
        db      "%4dK", 0
STR_49EF equ     $-DGROUP0
        db      "<Load it> ", 0
STR_49FA equ     $-DGROUP0
        db      "loading...", 0
STR_4A05 equ     $-DGROUP0
        db      "(unused)        ", 0
STR_4A16 equ     $-DGROUP0
        db      "Sound:%s   Size:%4dK", 0
        db      000h
STR_4A2C equ     $-DGROUP0
        db      "Recovering sequence, please wait ... ", 0
        db      "(unused)        ", 0
B_4A67  equ     $-DGROUP0+4
B_4A68  equ     $-DGROUP0+5
STR_4A63 equ     $-DGROUP0
        db      "SONG            ", 0
L_4A74  equ     $-DGROUP0
TBL_4A74 equ     $-DGROUP0
        db      098h, 0c0h, 0e0h, 0d0h, 0a0h, 0f0h, 0f0h, 0f0h, 0f0h, 000h, 000h, 000h, 000h, 000h, 03ch, 020h
        db      020h, 02dh, 040h, 021h, 023h, 024h, 025h, 026h, 028h, 029h, 07bh, 07dh, 027h, 05fh, 03eh, 000h
TBL_4A94 equ     $-DGROUP0
        db      000h, 003h, 006h, 009h, 00ch, 00fh, 012h, 015h, 018h, 01bh, 01fh, 022h
        endif
        db      "%(+.158>ADGJMPSVY"
        db      05ch
        db      "_adgjmpsvx{~"
        db      081h, 083h, 086h, 089h, 08ch, 08eh, 091h, 093h, 096h, 098h, 09bh, 09dh, 0a0h, 0a2h, 0a4h, 0a7h
        db      0a9h, 0ach, 0aeh, 0b0h, 0b3h, 0b5h, 0b7h, 0b9h, 0bbh, 0bdh, 0bfh, 0c2h, 0c4h, 0c6h, 0c8h, 0cah
        db      0cbh, 0cdh, 0cfh, 0d1h, 0d3h, 0d4h, 0d6h, 0d8h, 0dah, 0dbh, 0ddh, 0deh, 0e0h, 0e1h, 0e3h, 0e4h
        db      0e5h, 0e7h, 0e8h, 0eah, 0ebh, 0ech, 0edh, 0eeh, 0efh, 0f0h, 0f1h, 0f2h, 0f3h, 0f4h, 0f5h, 0f6h
        db      0f7h, 0f7h, 0f8h, 0f9h, 0f9h, 0fah, 0fbh, 0fbh, 0fch, 0fch, 0fdh, 0fdh, 0fdh, 0feh, 0feh, 0feh
        if      FW_VERSION < 212
B_3F98_V112 equ     $-DGROUP0
        db      0feh, 0feh, 0feh, 0feh, 0ffh, 0ffh, 0f0h, 07eh, 000h, 000h, 000h, 0f7h, 0f0h, 07eh, 000h, 0f7h
L_3FA8_V112 equ     $-DGROUP0
        db      000h, 000h, 000h, 000h, 03ch, 020h, 020h, 02dh, 040h, 021h, 023h, 024h, 025h, 026h, 028h, 029h
TBL_3FB8_V112 equ     $-DGROUP0
        db      07bh, 07dh, 027h, 05fh, 03eh, 000h, 0d6h, 03fh, 0d9h, 03fh, 0dch, 03fh, 0dfh, 03fh, 0e2h, 03fh
        db      0e5h, 03fh, 0e8h, 03fh, 0ebh, 03fh, 0eeh, 03fh, 0f1h, 03fh, 0f4h, 03fh, 0f7h, 03fh, 043h, 02eh
        db      000h, 043h, 023h, 000h, 044h, 02eh, 000h, 044h, 023h, 000h, 045h, 02eh, 000h, 046h, 02eh, 000h
        db      046h, 023h, 000h, 047h, 02eh, 000h, 047h, 023h, 000h, 041h, 02eh, 000h, 041h, 023h, 000h, 042h
L_3FF8_V112 equ     $-DGROUP0
        db      02eh, 000h, 000h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 030h, 030h, 030h, 030h
        db      030h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h
        db      020h, 020h, 020h, 090h, 040h, 040h, 040h, 040h, 040h, 040h, 040h, 040h, 040h, 040h, 040h, 040h
        db      040h, 040h, 040h, 00ch, 00ch, 00ch, 00ch, 00ch, 00ch, 00ch, 00ch, 00ch, 00ch, 040h, 040h, 040h
        db      040h, 040h, 040h, 040h, 009h, 009h, 009h, 009h, 009h, 009h, 001h, 001h, 001h, 001h, 001h, 001h
        db      001h, 001h, 001h, 001h, 001h, 001h, 001h, 001h, 001h, 001h, 001h, 001h, 001h, 001h, 040h, 040h
        db      040h, 040h, 040h, 040h, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 002h, 002h, 002h, 002h, 002h, 002h
        db      002h, 002h, 002h, 002h, 002h, 002h, 002h, 002h, 002h, 002h, 002h, 002h, 002h, 002h, 040h, 040h
        db      040h, 040h, 020h, 000h
L_407C_V112 equ     $-DGROUP0
        db      "0123456789abcdef", 0
        db      000h, 000h, 000h
; end of block copied to RAM.
        phase   0
        db      7f2ah dup (000h)
        db      5b96h dup (0ffh)
        else
L_4B0E  equ     $-DGROUP0
        db      0feh, 0feh, 0feh, 0feh, 0ffh, 0ffh, 000h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h
        db      030h, 030h, 030h, 030h, 030h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h
        db      020h, 020h, 020h, 020h, 020h, 020h, 020h, 090h, 040h, 040h, 040h, 040h, 040h, 040h, 040h, 040h
        db      040h, 040h, 040h, 040h, 040h, 040h, 040h, 00ch, 00ch, 00ch, 00ch, 00ch, 00ch, 00ch, 00ch, 00ch
        db      00ch, 040h, 040h, 040h, 040h, 040h, 040h, 040h, 009h, 009h, 009h, 009h, 009h, 009h, 001h, 001h
        db      001h, 001h, 001h, 001h, 001h, 001h, 001h, 001h, 001h, 001h, 001h, 001h, 001h, 001h, 001h, 001h
        db      001h, 001h, 040h, 040h, 040h, 040h, 040h, 040h, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 002h, 002h
        db      002h, 002h, 002h, 002h, 002h, 002h, 002h, 002h, 002h, 002h, 002h, 002h, 002h, 002h, 002h, 002h
        db      002h, 002h, 040h, 040h, 040h, 040h, 020h, 000h
L_4B96  equ     $-DGROUP0
        db      "0123456789abcdef", 0
        endif
        if      FW_VERSION = 212
        db      000h, 000h, 000h, 000h, 000h
        endif
        if      FW_VERSION >= 214
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        endif
        if      FW_VERSION >= 212
; end of block copied to RAM.
        phase   0
        db      0b8h, 000h, 0e0h, 02bh, 006h, 000h, 005h, 089h, 0c1h, 0b8h, 003h, 000h, 01bh, 006h, 002h, 005h
        db      089h, 0c3h, 0cch
; here to FE000h: ROM repeats from offset 13h; stale copy, nothing
; accesses, kept as bytes.
        db      008h, 000h, 02eh, 0f6h, 016h, 008h, 000h, 02eh, 038h, 006h, 008h, 000h, 02eh, 0a2h, 008h, 000h
        db      075h, 022h, 02eh, 0a1h, 002h, 000h, 08eh, 0c0h, 0bfh, 000h, 000h, 02eh, 08bh, 00eh, 006h, 000h
        db      02eh, 02bh, 00eh, 004h, 000h, 0d1h, 0e1h, 0d1h, 0e1h, 0d1h, 0e1h, 0d1h, 0e1h, 0e3h, 005h, 0beh
        endif
        if      FW_VERSION = 212
        db      000h, 000h, 0f3h, 0a5h, 0bbh, 041h, 00ah, 0bah, 020h, 01eh, 02bh, 0c0h, 03bh, 0dah, 073h, 00ch
        db      08eh, 0c3h, 02bh, 0ffh, 0b9h, 010h, 000h, 0f3h, 0abh, 043h, 0ebh, 0f0h, 0eah, 00eh, 000h, 044h
        db      0d7h, 01eh, 006h, 0b8h, 071h, 015h, 08eh, 0c0h, 0b8h, 0beh, 005h, 08eh, 0d8h, 0b0h, 001h, 0b9h
        db      0a4h, 006h, 0bbh, 000h, 000h, 09ah, 06dh, 006h, 044h, 0d7h, 0b9h, 080h, 000h, 0bbh, 0ach, 006h
        db      09ah, 06dh, 006h, 044h, 0d7h, 0b9h, 0f5h, 005h, 0bbh, 034h, 007h, 09ah, 06dh, 006h, 044h, 0d7h
        db      0bbh, 031h, 00dh, 09ah, 06dh, 006h, 044h, 0d7h, 0b9h, 0fah, 005h, 0bbh, 02eh, 013h, 09ah, 06dh
        db      006h, 044h, 0d7h, 0bbh, 030h, 019h, 09ah, 06dh, 006h, 044h, 0d7h, 0bbh, 032h, 01fh, 09ah, 06dh
        db      006h, 044h, 0d7h, 0bbh, 034h, 025h, 09ah, 06dh, 006h, 044h, 0d7h, 0b9h, 000h, 001h, 0bbh, 036h
        db      02bh, 09ah, 06dh, 006h, 044h, 0d7h, 0b8h, 0beh, 005h, 08eh, 0c0h, 0b0h, 001h, 0b9h, 008h, 000h
        db      0bbh, 030h, 048h, 09ah, 06dh, 006h, 044h, 0d7h, 0bbh, 040h, 048h, 09ah, 06dh, 006h, 044h, 0d7h
        db      0bbh, 050h, 048h, 09ah, 06dh, 006h, 044h, 0d7h, 0bbh, 060h, 048h, 09ah, 06dh, 006h, 044h, 0d7h
        db      0b9h, 008h, 000h, 0bbh, 070h, 048h, 09ah, 06dh, 006h, 044h, 0d7h, 0bbh, 080h, 048h, 09ah, 06dh
        db      006h, 044h, 0d7h, 033h, 0c0h, 08eh, 0c0h, 026h, 0a1h, 008h, 001h, 0a3h, 090h, 048h, 026h, 0a1h
        db      00ah, 001h, 0a3h, 092h, 048h, 0b8h, 067h, 0dch, 08eh, 0c0h, 0bbh, 000h, 000h, 0b2h, 042h, 09ah
        db      04dh, 003h, 044h, 0d7h, 0bah, 002h, 001h, 0b0h, 026h, 0a2h, 098h, 048h, 0e8h, 085h, 000h, 0bah
        db      012h, 001h, 0b0h, 036h, 0a2h, 099h, 048h, 0e8h, 07ah, 000h, 0bah, 022h, 001h, 0b0h, 036h, 0a2h
        db      09ah, 048h, 0e8h, 06fh, 000h, 0bah, 032h, 001h, 0ech, 0a8h, 080h, 074h, 00bh, 0bah, 032h, 001h
        db      0b0h, 036h, 0a2h, 09bh, 048h, 0e8h, 05ch, 000h, 0b8h, 0deh, 0dbh, 08eh, 0c0h, 0bbh, 069h, 000h
        db      0b2h, 00dh, 09ah, 04dh, 003h, 044h, 0d7h, 0b8h, 022h, 003h, 08eh, 0c0h, 0bbh, 005h, 000h, 0b2h
        db      00eh, 09ah, 04dh, 003h, 044h, 0d7h, 0bah, 080h, 001h, 0eeh, 0b8h, 0a5h, 003h, 08eh, 0c0h, 0bbh
        db      00eh, 000h, 0b2h, 00fh, 09ah, 04dh, 003h, 044h, 0d7h, 0b8h, 07ch, 0dch, 08eh, 0c0h, 0bbh, 00ah
        db      000h, 0b2h, 002h, 09ah, 04dh, 003h, 044h, 0d7h, 0bah, 080h, 001h, 0eeh, 0bah, 03eh, 0ffh, 0b8h
        db      009h, 000h, 0efh, 0b2h, 007h, 09ah, 09eh, 003h, 044h, 0d7h, 0b2h, 006h, 09ah, 09eh, 003h, 044h
        db      0d7h, 007h, 01fh, 0cbh, 050h, 033h, 0c0h, 0eeh, 0f6h, 0e0h, 0eeh, 0f6h, 0e0h, 0eeh, 0f6h, 0e0h
        endif
        if      FW_VERSION >= 214
        db      000h, 000h, 0f3h, 0a5h, 0bbh, 0afh, 00ah, 0bah, 097h, 01eh, 02bh, 0c0h, 03bh, 0dah, 073h, 00ch
        db      08eh, 0c3h, 02bh, 0ffh, 0b9h, 010h, 000h, 0f3h, 0abh, 043h, 0ebh, 0f0h, 0eah, 000h, 000h, 094h
        db      0d8h, 01eh, 006h, 0b8h, 0e8h, 015h, 08eh, 0c0h, 0b8h, 0f4h, 005h, 08eh, 0d8h, 0b0h, 001h, 0b9h
        db      0a4h, 006h, 0bbh, 000h, 000h, 09ah, 05fh, 006h, 094h, 0d8h, 0b9h, 080h, 000h, 0bbh, 0ach, 006h
        db      09ah, 05fh, 006h, 094h, 0d8h, 0b9h, 0f5h, 005h, 0bbh, 034h, 007h, 09ah, 05fh, 006h, 094h, 0d8h
        db      0bbh, 031h, 00dh, 09ah, 05fh, 006h, 094h, 0d8h, 0b9h, 0fah, 005h, 0bbh, 02eh, 013h, 09ah, 05fh
        db      006h, 094h, 0d8h, 0bbh, 030h, 019h, 09ah, 05fh, 006h, 094h, 0d8h, 0bbh, 032h, 01fh, 09ah, 05fh
        db      006h, 094h, 0d8h, 0bbh, 034h, 025h, 09ah, 05fh, 006h, 094h, 0d8h, 0b9h, 000h, 001h, 0bbh, 036h
        db      02bh, 09ah, 05fh, 006h, 094h, 0d8h, 0b8h, 0f4h, 005h, 08eh, 0c0h, 0b0h, 001h, 0b9h, 008h, 000h
        db      0bbh, 0b0h, 04bh, 09ah, 05fh, 006h, 094h, 0d8h, 0bbh, 0c0h, 04bh, 09ah, 05fh, 006h, 094h, 0d8h
        db      0bbh, 0d0h, 04bh, 09ah, 05fh, 006h, 094h, 0d8h, 0bbh, 0e0h, 04bh, 09ah, 05fh, 006h, 094h, 0d8h
        db      0b9h, 008h, 000h, 0bbh, 0f0h, 04bh, 09ah, 05fh, 006h, 094h, 0d8h, 0bbh, 000h, 04ch, 09ah, 05fh
        db      006h, 094h, 0d8h, 033h, 0c0h, 08eh, 0c0h, 026h, 0a1h, 008h, 001h, 0a3h, 010h, 04ch, 026h, 0a1h
        db      00ah, 001h, 0a3h, 012h, 04ch, 0b8h, 0b8h, 0ddh, 08eh, 0c0h, 0bbh, 005h, 000h, 0b2h, 042h, 09ah
        db      03fh, 003h, 094h, 0d8h, 0bah, 002h, 001h, 0b0h, 026h, 0a2h, 018h, 04ch, 0e8h, 085h, 000h, 0bah
        db      012h, 001h, 0b0h, 036h, 0a2h, 019h, 04ch, 0e8h, 07ah, 000h, 0bah, 022h, 001h, 0b0h, 036h, 0a2h
        db      01ah, 04ch, 0e8h, 06fh, 000h, 0bah, 032h, 001h, 0ech, 0a8h, 080h, 074h, 00bh, 0bah, 032h, 001h
        db      0b0h, 036h, 0a2h, 01bh, 04ch, 0e8h, 05ch, 000h, 0b8h, 02fh, 0ddh, 08eh, 0c0h, 0bbh, 06eh, 000h
        db      0b2h, 00dh, 09ah, 03fh, 003h, 094h, 0d8h, 0b8h, 022h, 003h, 08eh, 0c0h, 0bbh, 005h, 000h, 0b2h
        db      00eh, 09ah, 03fh, 003h, 094h, 0d8h, 0bah, 080h, 001h, 0eeh, 0b8h, 0a5h, 003h, 08eh, 0c0h, 0bbh
        db      00eh, 000h, 0b2h, 00fh, 09ah, 03fh, 003h, 094h, 0d8h, 0b8h, 0cdh, 0ddh, 08eh, 0c0h, 0bbh, 00fh
        db      000h, 0b2h, 002h, 09ah, 03fh, 003h, 094h, 0d8h, 0bah, 080h, 001h, 0eeh, 0bah, 03eh, 0ffh, 0b8h
        db      009h, 000h, 0efh, 0b2h, 007h, 09ah, 090h, 003h, 094h, 0d8h, 0b2h, 006h, 09ah, 090h, 003h, 094h
        db      0d8h, 007h, 01fh, 0cbh, 050h, 033h, 0c0h, 0eeh, 0f6h, 0e0h, 0eeh, 0f6h, 0e0h, 0eeh, 0f6h, 0e0h
        endif
        if      FW_VERSION >= 212
        db      0b0h, 040h, 0eeh, 0f6h, 0e0h, 0b0h, 04eh, 0eeh, 0f6h, 0e0h, 058h, 0eeh, 0c3h, 0bah, 03ah, 0ffh
        db      0b8h, 012h, 000h, 0efh, 0bah, 03ch, 0ffh, 0b8h, 014h, 000h, 0efh, 0cbh, 006h, 0bah, 032h, 0ffh
        endif
        if      FW_VERSION = 212
        db      0b8h, 008h, 000h, 0efh, 0b8h, 02fh, 003h, 08eh, 0c0h, 0bbh, 00eh, 000h, 0b2h, 008h, 09ah, 04dh
        db      003h, 044h, 0d7h, 0bah, 052h, 0ffh, 0b8h, 06eh, 019h, 0efh, 0bah, 050h, 0ffh, 033h, 0c0h, 0efh
        endif
        if      FW_VERSION >= 214
        db      0b8h, 008h, 000h, 0efh, 0b8h, 02fh, 003h, 08eh, 0c0h, 0bbh, 00eh, 000h, 0b2h, 008h, 09ah, 03fh
        db      003h, 094h, 0d8h, 0bah, 052h, 0ffh, 0b8h, 06eh, 019h, 0efh, 0bah, 050h, 0ffh, 033h, 0c0h, 0efh
        endif
        if      FW_VERSION >= 212
        db      0bah, 056h, 0ffh, 0b8h, 001h, 0e0h, 0efh, 0bah, 032h, 0ffh, 0b8h, 003h, 000h, 0efh, 007h, 0cbh
        db      0cfh, 0ebh, 030h, 010h
        db      "COPYRIGHT (C) 1983 KADAK PRODUCTS LTD."
        endif
        if      FW_VERSION = 212
        db      090h, 0b2h, 000h, 0b2h, 005h, 034h, 0bbh, 0beh, 005h, 02eh, 0c5h, 03eh, 032h, 000h, 02eh, 0c4h
        endif
        if      FW_VERSION >= 214
        db      090h, 0b2h, 000h, 0e8h, 005h, 042h, 0bfh, 0f4h, 005h, 02eh, 0c5h, 03eh, 032h, 000h, 02eh, 0c4h
        endif
        if      FW_VERSION >= 212
        db      036h, 02eh, 000h, 026h, 08bh, 014h, 089h, 015h
        db      "FFGG"
        db      08bh, 0dah, 003h, 0dbh, 003h, 0dah, 003h, 0dbh, 003h, 0dfh, 042h, 04ah, 074h, 005h, 0e8h, 003h
        db      000h, 0ebh, 0f8h, 0cbh, 006h, 0b8h, 0ffh, 0ffh, 089h, 005h, 089h, 045h, 002h, 089h, 05dh, 004h
        endif
        if      FW_VERSION = 212
        db      026h, 08bh, 00ch, 08ch, 0d8h, 08eh, 0c0h, 0b0h, 002h, 09ah, 06dh, 006h, 044h, 0d7h, 083h, 0c7h
        db      006h, 046h, 046h, 003h, 0c9h, 083h, 0c3h, 008h, 003h, 0d9h, 007h, 0c3h, 0e8h, 071h, 000h, 075h
        db      033h, 09ah, 05fh, 005h, 044h, 0d7h, 09ch, 0fah, 0ffh, 005h, 075h, 005h, 088h, 045h, 002h, 0ebh
        db      01eh, 03ah, 045h, 002h, 074h, 017h, 08bh, 0c8h, 09ah, 0cbh, 006h, 044h, 0d7h, 078h, 007h, 09ah
        db      074h, 004h, 044h, 0d7h, 0ebh, 009h, 0ffh, 00dh, 0b8h, 0f5h, 0ffh, 0ebh, 004h, 0ffh, 00dh, 033h
        db      0c0h, 09dh, 00bh, 0c0h, 05fh, 05bh, 059h, 007h, 01fh, 0cbh, 0e8h, 033h, 000h, 075h, 0f5h, 09ah
        db      05fh, 005h, 044h, 0d7h, 03ah, 045h, 002h, 074h, 005h, 0b8h, 0f4h, 0ffh, 0ebh, 0e4h, 09ch, 0fah
        db      0c6h, 045h, 002h, 0ffh, 0ffh, 00dh, 078h, 0d7h, 09ah, 0fah, 006h, 044h, 0d7h, 052h, 08bh, 0d1h
        db      088h, 055h, 002h, 09ah, 0b9h, 004h, 044h, 0d7h, 05ah, 09ah, 090h, 003h, 044h, 0d7h, 0ebh, 0bfh
        endif
        if      FW_VERSION >= 214
        db      026h, 08bh, 00ch, 08ch, 0d8h, 08eh, 0c0h, 0b0h, 002h, 09ah, 05fh, 006h, 094h, 0d8h, 083h, 0c7h
        db      006h, 046h, 046h, 003h, 0c9h, 083h, 0c3h, 008h, 003h, 0d9h, 007h, 0c3h, 0e8h, 071h, 000h, 075h
        db      033h, 09ah, 051h, 005h, 094h, 0d8h, 09ch, 0fah, 0ffh, 005h, 075h, 005h, 088h, 045h, 002h, 0ebh
        db      01eh, 03ah, 045h, 002h, 074h, 017h, 08bh, 0c8h, 09ah, 0bdh, 006h, 094h, 0d8h, 078h, 007h, 09ah
        db      066h, 004h, 094h, 0d8h, 0ebh, 009h, 0ffh, 00dh, 0b8h, 0f5h, 0ffh, 0ebh, 004h, 0ffh, 00dh, 033h
        db      0c0h, 09dh, 00bh, 0c0h, 05fh, 05bh, 059h, 007h, 01fh, 0cbh, 0e8h, 033h, 000h, 075h, 0f5h, 09ah
        db      051h, 005h, 094h, 0d8h, 03ah, 045h, 002h, 074h, 005h, 0b8h, 0f4h, 0ffh, 0ebh, 0e4h, 09ch, 0fah
        db      0c6h, 045h, 002h, 0ffh, 0ffh, 00dh, 078h, 0d7h, 09ah, 0ech, 006h, 094h, 0d8h, 052h, 08bh, 0d1h
        db      088h, 055h, 002h, 09ah, 0abh, 004h, 094h, 0d8h, 05ah, 09ah, 082h, 003h, 094h, 0d8h, 0ebh, 0bfh
        endif
        if      FW_VERSION >= 212
        db      058h, 01eh, 006h
        db      "QSWP."
        db      0c5h, 03eh, 032h, 000h, 08bh, 0c2h, 048h, 03bh, 005h, 073h, 016h, 08bh, 0d8h, 003h, 0c0h, 003h
        db      0c3h, 003h, 0c0h, 040h, 040h, 003h, 0f8h, 08bh, 05dh, 004h, 08ch, 0d8h, 08eh, 0c0h, 033h, 0c0h
        endif
        if      FW_VERSION = 212
        db      0c3h, 0b8h, 0f6h, 0ffh, 00bh, 0c0h, 0c3h, 033h, 0d2h, 0b8h, 020h, 01eh, 0b9h, 004h, 000h, 0d1h
        db      0e0h, 0d1h, 0d2h, 0e2h, 0fah, 0c1h, 0cah, 004h, 0a3h, 08ah, 097h, 089h, 016h, 08ch, 097h, 0c7h
        db      006h, 086h, 097h, 0feh, 0ffh, 0c7h, 006h, 088h, 097h, 000h, 070h, 0cbh, 055h, 08bh, 0ech, 083h
        db      0c4h, 0edh, 09ah, 003h, 000h, 0eeh, 0d3h, 09ah, 002h, 000h, 0a4h, 0e4h, 0c6h, 006h, 059h, 050h
        db      001h, 09ah, 009h, 000h, 031h, 0d7h, 0b8h, 001h, 000h, 050h, 050h, 0b8h, 09ah, 090h, 050h, 09ah
        db      00bh, 000h, 0deh, 0d5h, 083h, 0c4h, 006h, 09ah, 070h, 001h, 006h, 0c0h, 09ah, 07fh, 001h, 006h
        db      0c0h, 0b8h, 000h, 012h, 050h, 09ah, 00eh, 000h, 023h, 0d9h, 059h, 0b8h, 00ah, 000h, 050h, 0b8h
        db      002h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 00bh, 012h, 050h, 09ah
        db      05bh, 000h, 031h, 0d7h, 059h, 0b8h, 009h, 000h, 050h, 0b8h, 003h, 000h, 050h, 09ah, 026h, 000h
        db      031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 01fh, 012h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 059h, 0b8h
        db      00eh, 000h, 050h, 0b8h, 004h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h
        db      036h, 012h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 059h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h
        db      09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 043h, 012h, 050h, 09ah, 05bh, 000h, 0d0h
        db      088h, 003h, 000h, 006h, 05ah, 050h, 001h, 0bah, 000h, 000h, 0b8h, 000h, 000h, 052h, 050h, 0b8h
        db      063h, 000h, 050h, 0b8h, 00ch, 000h, 050h, 09ah, 005h, 000h, 0efh, 0d6h, 083h, 0c4h, 008h, 03dh
        db      000h, 0f7h, 075h, 005h, 0c6h, 006h, 05ah, 050h, 000h, 09ah, 00dh, 000h, 0f4h, 0d6h, 085h, 0c0h
        db      074h, 06eh, 0feh, 006h, 04bh, 089h, 08dh, 046h, 0edh, 050h, 0b8h, 055h, 012h, 050h, 0b8h, 009h
        db      000h, 050h, 09ah, 005h, 000h, 0efh, 0d6h, 083h, 0c4h, 006h, 085h, 0c0h, 075h, 029h, 08dh, 046h
        db      0f4h, 050h, 09ah, 00eh, 000h, 074h, 0d9h, 059h, 085h, 0c0h, 074h, 007h, 09ah, 00ch, 000h, 03ch
        db      0deh, 0ebh, 014h, 0b8h, 008h, 000h, 050h, 08dh, 046h, 0f4h, 050h, 0b8h, 00dh, 08ah, 050h, 09ah
        db      006h, 000h, 0f9h, 0f0h, 083h, 0c4h, 006h, 0b8h, 061h, 012h, 050h, 09ah, 00ah, 000h, 033h, 0dbh
        db      059h, 085h, 0c0h, 074h, 007h, 09ah, 003h, 000h, 0eeh, 0d3h, 0ebh, 010h, 0b8h, 06dh, 012h, 050h
        db      0b8h, 01eh, 08ah, 050h, 09ah, 009h, 000h, 0f7h, 0f0h, 083h, 0c4h, 004h, 0feh, 00eh, 04bh, 089h
        db      09ah, 074h, 000h, 0f4h, 0d6h, 09ah, 00bh, 000h, 0e2h, 0c2h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh
        db      0ech, 083h, 0c4h, 0feh, 0b8h, 08dh, 012h, 050h, 09ah, 00eh, 000h, 023h, 0d9h, 083h, 0c4h, 002h
        db      033h, 0c0h, 050h, 0b8h, 001h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h
        db      092h, 012h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 002h
        db      000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 0bbh, 012h, 050h, 09ah, 05bh
        db      000h, 031h, 0d7h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 003h, 000h, 050h, 09ah, 026h, 000h
        db      031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 0e0h, 012h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h
        db      002h, 033h, 0c0h, 050h, 0b8h, 004h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h
        db      0b8h, 007h, 013h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h
        db      007h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 033h, 0c0h, 050h, 0b8h, 009h
        db      000h, 050h, 08dh, 046h, 0feh, 050h, 09ah, 001h, 000h, 004h, 0d9h, 083h, 0c4h, 006h, 088h, 046h
        db      0ffh, 080h, 07eh, 0ffh, 000h, 074h, 003h, 0e9h, 08bh, 000h, 08ah, 046h, 0feh, 0a2h, 05ch, 050h
        db      098h, 0ebh, 075h, 08ah, 046h, 0feh, 098h, 050h, 09ah, 000h, 000h, 039h, 0c8h, 083h, 0c4h, 002h
        db      088h, 046h, 0ffh, 0ebh, 070h, 09ah, 04eh, 001h, 04ah, 0c0h, 088h, 046h, 0ffh, 0ebh, 066h, 09ah
        db      005h, 00eh, 04ah, 0c0h, 088h, 046h, 0ffh, 0ebh, 05ch, 09ah, 004h, 00fh, 04ah, 0c0h, 088h, 046h
        db      0ffh, 0ebh, 052h, 033h, 0c0h, 050h, 0b8h, 0ffh, 0ffh, 050h, 09ah, 00ah, 000h, 0bch, 0d3h, 083h
        db      0c4h, 004h, 033h, 0c0h, 050h, 0b8h, 0ffh, 0ffh, 050h, 09ah, 0a8h, 001h, 0bch, 0d3h, 083h, 0c4h
        db      004h, 033h, 0c0h, 050h, 09ah, 050h, 002h, 0bch, 0d3h, 083h, 0c4h, 002h, 0a0h, 05bh, 050h, 088h
        db      046h, 0ffh, 0ebh, 021h, 046h, 001h, 0c4h, 000h, 0c4h, 000h, 0c4h, 000h, 0c4h, 000h, 0c4h, 000h
        db      0d6h, 000h, 0e0h, 000h, 0eah, 000h, 0f4h, 000h, 03dh, 00ah, 000h, 073h, 008h, 093h, 0d1h, 0e3h
        db      02eh, 0ffh, 0a7h, 025h, 001h, 08ah, 046h, 0ffh, 098h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech
        db      081h, 0c4h, 09eh, 0f4h, 056h, 0b8h, 028h, 013h, 050h, 09ah, 010h, 014h, 04ah, 0c0h, 083h, 0c4h
        db      002h, 0b8h, 008h, 000h, 080h, 03eh, 05ah, 050h, 000h, 074h, 003h, 0b8h, 010h, 000h, 089h, 046h
        db      0f2h, 0c7h, 046h, 0f8h, 009h, 000h, 033h, 0c0h, 0c7h, 046h, 0fah, 000h, 000h, 089h, 046h, 0f6h
        db      050h, 09ah, 005h, 000h, 0efh, 0d6h, 083h, 0c4h, 002h, 0c7h, 046h, 0f4h, 000h, 000h, 0c7h, 046h
        db      0eah, 000h, 000h, 0b8h, 03fh, 000h, 050h, 0b8h, 014h, 000h, 050h, 08dh, 046h, 0d6h, 050h, 09ah
        db      00bh, 000h, 0f1h, 0f0h, 083h, 0c4h, 006h, 08bh, 076h, 0f2h, 0c6h, 042h, 0d9h, 000h, 0c7h, 086h
        db      0deh, 0feh, 000h, 000h, 0c7h, 046h, 0c0h, 000h, 000h, 0c7h, 046h, 0fch, 000h, 000h, 08dh, 086h
        db      09eh, 0f4h, 050h, 08dh, 046h, 0d6h, 050h, 0ffh, 076h, 0f8h, 09ah, 005h, 000h, 0efh, 0d6h, 083h
        db      0c4h, 006h, 089h, 046h, 0fah, 033h, 0c9h, 03bh, 0c1h, 07dh, 04fh, 081h, 07eh, 0fah, 000h, 0fdh
        db      074h, 012h, 050h, 09ah, 00eh, 000h, 001h, 0ddh, 083h, 0c4h, 002h, 0a0h, 05bh, 050h, 098h, 05eh
        db      08bh, 0e5h, 05dh, 0cbh, 08bh, 046h, 0fch, 08bh, 0d0h, 0d1h, 0e0h, 003h, 0c2h, 0b1h, 003h, 0d3h
        db      0e0h, 02bh, 0c2h, 08bh, 0f0h, 0c7h, 082h, 0ceh, 0f4h, 000h, 000h, 08bh, 076h, 0fch, 0d1h, 0e6h
        db      0c7h, 082h, 0e0h, 0feh, 000h, 000h, 083h, 07eh, 0fch, 000h, 075h, 00ch, 0c7h, 086h, 0e0h, 0feh
        db      076h, 012h, 0c7h, 086h, 0e2h, 0feh, 000h, 000h, 0ebh, 075h, 08bh, 046h, 0fch, 08bh, 0d0h, 0d1h
        db      0e0h, 003h, 0c2h, 0b1h, 003h, 0d3h, 0e0h, 02bh, 0c2h, 08dh, 08eh, 0b9h, 0f4h, 003h, 0c1h, 08bh
        db      076h, 0fch, 0d1h, 0e6h, 089h, 082h, 0e0h, 0feh, 050h, 08dh, 086h, 0a5h, 0f4h, 050h, 09ah, 052h
        db      013h, 04ah, 0c0h, 083h, 0c4h, 004h, 08bh, 096h, 0a1h, 0f4h, 08bh, 086h, 09fh, 0f4h, 005h, 0ffh
        db      003h, 083h, 0d2h, 000h, 0bbh, 000h, 000h, 0b9h, 000h, 004h, 09ah, 006h, 000h, 0feh, 0f0h, 050h
        db      08bh, 046h, 0fch, 08bh, 0d0h, 0d1h, 0e0h, 003h, 0c2h, 0b1h, 003h, 0d3h, 0e0h, 02bh, 0c2h, 08bh
        db      0f0h, 058h, 089h, 082h, 0ceh, 0f4h, 0c7h, 046h, 0f4h, 003h, 000h, 0ffh, 046h, 0eah, 0c7h, 046h
        db      0f8h, 00ah, 000h, 0ffh, 046h, 0fch, 083h, 07eh, 0fch, 070h, 07dh, 003h, 0e9h, 01fh, 0ffh, 083h
        db      07eh, 0eah, 001h, 07eh, 03ch, 0ffh, 076h, 0eah, 08dh, 086h, 0e0h, 0feh, 050h, 09ah, 045h, 014h
        db      04ah, 0c0h, 083h, 0c4h, 004h, 0bah, 04ah, 0c0h, 0b8h, 02ch, 014h, 052h, 050h, 0b8h, 002h, 000h
        db      050h, 0ffh, 076h, 0eah, 08dh, 086h, 0e0h, 0feh, 050h, 09ah, 00bh, 000h, 0d7h, 0f0h, 083h, 0c4h
        db      00ah, 0ffh, 076h, 0eah, 08dh, 086h, 0e0h, 0feh, 050h, 09ah, 003h, 015h, 04ah, 0c0h, 083h, 0c4h
        db      004h, 0c7h, 046h, 0feh, 0ffh, 0ffh, 083h, 07eh, 0feh, 000h, 07eh, 003h, 0e9h, 092h, 003h, 0b8h
        db      028h, 013h, 050h, 09ah, 010h, 014h, 04ah, 0c0h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 001h
        db      000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 040h, 013h, 050h, 09ah, 05bh
        db      000h, 031h, 0d7h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 026h, 000h
        db      031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 014h, 000h, 050h, 08dh, 086h, 0e0h, 0feh, 050h, 08dh, 046h
        db      0f6h, 050h, 0b8h, 063h, 013h, 050h, 09ah, 0cbh, 000h, 0bbh, 0d7h, 083h, 0c4h, 008h, 08bh, 076h
        db      0f6h, 0d1h, 0e6h, 08bh, 09ah, 0e0h, 0feh, 0ffh, 077h, 015h, 09ah, 088h, 006h, 04ah, 0c0h, 083h
        db      0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 003h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h
        db      004h, 0b8h, 028h, 000h, 050h, 0b8h, 02dh, 000h, 050h, 09ah, 093h, 000h, 031h, 0d7h, 083h, 0c4h
        db      004h, 033h, 0c0h, 050h, 0b8h, 004h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h
        db      09ah, 00fh, 000h, 057h, 0d5h, 0bbh, 000h, 000h, 0b9h, 000h, 004h, 09ah, 006h, 000h, 0feh, 0f0h
        db      089h, 046h, 0eeh, 050h, 0b8h, 06ah, 013h, 050h, 09ah, 005h, 000h, 03fh, 0d7h, 083h, 0c4h, 004h
        db      09ah, 00ch, 000h, 0b2h, 0ddh, 050h, 092h, 0bbh, 00ch, 000h, 0f7h, 0e3h, 08bh, 0c8h, 058h, 0f7h
        db      0e3h, 003h, 0d1h, 0b9h, 003h, 000h, 0e3h, 006h, 0d1h, 0fah, 0d1h, 0d8h, 0e2h, 0fah, 0bbh, 000h
        db      000h, 0b9h, 000h, 004h, 09ah, 006h, 000h, 0feh, 0f0h, 089h, 046h, 0ech, 050h, 0b8h, 091h, 013h
        db      050h, 09ah, 005h, 000h, 03fh, 0d7h, 083h, 0c4h, 004h, 033h, 0c0h, 050h, 0b8h, 006h, 000h, 050h
        db      09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 028h, 000h, 050h, 0b8h, 03dh, 000h, 050h
        db      09ah, 093h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah
        db      026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 0b9h, 013h, 050h, 09ah, 05bh, 000h, 031h, 0d7h
        db      083h, 0c4h, 002h, 09ah, 097h, 000h, 012h, 0d7h, 0ffh, 076h, 0f4h, 09ah, 028h, 000h, 030h, 0d8h
        db      083h, 0c4h, 002h, 089h, 046h, 0feh, 085h, 0c0h, 075h, 016h, 08bh, 076h, 0f6h, 0d1h, 0e6h, 08bh
        db      09ah, 0e0h, 0feh, 0ffh, 077h, 015h, 09ah, 088h, 006h, 04ah, 0c0h, 083h, 0c4h, 002h, 0ebh, 0d8h
        db      08dh, 046h, 0c2h, 050h, 08bh, 076h, 0f6h, 0d1h, 0e6h, 0ffh, 0b2h, 0e0h, 0feh, 09ah, 035h, 012h
        db      04ah, 0c0h, 083h, 0c4h, 004h, 0b8h, 008h, 000h, 080h, 07eh, 0cdh, 000h, 074h, 003h, 0b8h, 010h
        db      000h, 089h, 046h, 0f2h, 08bh, 046h, 0feh, 0e9h, 002h, 002h, 09ah, 04fh, 000h, 031h, 0d7h, 0b8h
        db      0dah, 013h, 050h, 08bh, 046h, 0f2h, 08dh, 04eh, 0c2h, 003h, 0c1h, 050h, 09ah, 002h, 000h, 00ah
        db      0f1h, 083h, 0c4h, 004h, 085h, 0c0h, 075h, 02bh, 080h, 03eh, 05ah, 050h, 000h, 074h, 015h, 0b8h
        db      002h, 000h, 050h, 08dh, 046h, 0c2h, 050h, 09ah, 039h, 003h, 025h, 0e5h, 083h, 0c4h, 004h, 089h
        db      046h, 0feh, 0ebh, 00fh, 08dh, 046h, 0c2h, 050h, 09ah, 00ch, 000h, 025h, 0e5h, 083h, 0c4h, 002h
        db      089h, 046h, 0feh, 0b8h, 0deh, 013h, 050h, 08bh, 046h, 0f2h, 08dh, 04eh, 0c2h, 003h, 0c1h, 050h
        db      09ah, 002h, 000h, 00ah, 0f1h, 083h, 0c4h, 004h, 085h, 0c0h, 075h, 00fh, 08dh, 046h, 0c2h, 050h
        db      09ah, 0aeh, 006h, 04ah, 0c0h, 083h, 0c4h, 002h, 089h, 046h, 0feh, 0b8h, 0e2h, 013h, 050h, 08bh
        db      046h, 0f2h, 08dh, 04eh, 0c2h, 003h, 0c1h, 050h, 09ah, 002h, 000h, 00ah, 0f1h, 083h, 0c4h, 004h
        db      085h, 0c0h, 075h, 00fh, 08dh, 046h, 0c2h, 050h, 09ah, 0d3h, 007h, 04ah, 0c0h, 083h, 0c4h, 002h
        db      089h, 046h, 0feh, 0b8h, 0e6h, 013h, 050h, 08bh, 046h, 0f2h, 08dh, 04eh, 0c2h, 003h, 0c1h, 050h
        db      09ah, 002h, 000h, 00ah, 0f1h, 083h, 0c4h, 004h, 085h, 0c0h, 075h, 019h, 08dh, 046h, 0c2h, 050h
        db      09ah, 0efh, 008h, 04ah, 0c0h, 083h, 0c4h, 002h, 089h, 046h, 0feh, 080h, 00eh, 05bh, 089h, 040h
        db      080h, 00eh, 05ah, 089h, 080h, 0b8h, 0eah, 013h, 050h, 08bh, 046h, 0f2h, 08dh, 04eh, 0c2h, 003h
        db      0c1h, 050h, 09ah, 002h, 000h, 00ah, 0f1h, 083h, 0c4h, 004h, 085h, 0c0h, 075h, 035h, 033h, 0c0h
        db      050h, 08dh, 046h, 0c2h, 050h, 09ah, 0afh, 015h, 04ah, 0c0h, 083h, 0c4h, 004h, 089h, 046h, 0f0h
        db      085h, 0c0h, 074h, 010h, 050h, 09ah, 00eh, 000h, 001h, 0ddh, 083h, 0c4h, 002h, 0a0h, 05bh, 050h
        db      098h, 0e9h, 07bh, 0fch, 08dh, 046h, 0c2h, 050h, 09ah, 013h, 00ah, 04ah, 0c0h, 083h, 0c4h, 002h
        db      089h, 046h, 0feh, 0b8h, 0eeh, 013h, 050h, 08bh, 046h, 0f2h, 08dh, 04eh, 0c2h, 003h, 0c1h, 050h
        db      09ah, 002h, 000h, 00ah, 0f1h, 083h, 0c4h, 004h, 085h, 0c0h, 075h, 04ch, 0f6h, 006h, 042h, 0aah
        db      001h, 075h, 018h, 0b8h, 0d7h, 0ffh, 050h, 09ah, 00eh, 000h, 001h, 0ddh, 083h, 0c4h, 002h, 09ah
        db      055h, 000h, 031h, 0d7h, 0c7h, 046h, 0feh, 000h, 000h, 0ebh, 02bh, 080h, 03eh, 05ah, 050h, 000h
        db      074h, 015h, 0b8h, 005h, 000h, 050h, 08dh, 046h, 0c2h, 050h, 09ah, 039h, 003h, 025h, 0e5h, 083h
        db      0c4h, 004h, 089h, 046h, 0feh, 0ebh, 00fh, 08dh, 046h, 0c2h, 050h, 09ah, 04eh, 001h, 025h, 0e5h
        db      083h, 0c4h, 002h, 089h, 046h, 0feh, 0ebh, 02ch, 0b8h, 0f2h, 013h, 050h, 08bh, 046h, 0f2h, 08dh
        db      04eh, 0c2h, 003h, 0c1h, 050h, 09ah, 002h, 000h, 00ah, 0f1h, 083h, 0c4h, 004h, 085h, 0c0h, 075h
        db      013h, 0b8h, 0d9h, 0ffh, 050h, 09ah, 00eh, 000h, 001h, 0ddh, 083h, 0c4h, 002h, 0a0h, 05bh, 050h
        db      098h, 089h, 046h, 0feh, 083h, 07eh, 0feh, 078h, 075h, 016h, 0b8h, 0e2h, 0ffh, 050h, 09ah, 00eh
        db      000h, 001h, 0ddh, 083h, 0c4h, 002h, 09ah, 055h, 000h, 031h, 0d7h, 0c7h, 046h, 0feh, 000h, 000h
        db      0ebh, 04ch, 08dh, 046h, 0c2h, 050h, 09ah, 039h, 00bh, 04ah, 0c0h, 083h, 0c4h, 002h, 089h, 046h
        db      0feh, 0b8h, 036h, 000h, 050h, 09ah, 081h, 000h, 012h, 0d7h, 083h, 0c4h, 002h, 0ebh, 02fh, 08dh
        db      046h, 0c2h, 050h, 09ah, 033h, 00ch, 04ah, 0c0h, 083h, 0c4h, 002h, 089h, 046h, 0feh, 0b8h, 036h
        db      000h, 050h, 09ah, 081h, 000h, 012h, 0d7h, 083h, 0c4h, 002h, 0ebh, 012h, 03dh, 078h, 000h, 075h
        db      003h, 0e9h, 0f6h, 0fdh, 03dh, 079h, 000h, 074h, 0b9h, 03dh, 07ah, 000h, 074h, 0d1h, 0e9h, 065h
        db      0fch, 08bh, 046h, 0feh, 0e9h, 068h, 0fbh, 055h, 08bh, 0ech, 0b8h, 01dh, 000h, 050h, 0b8h, 002h
        db      000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0ffh, 076h, 006h, 0b8h, 0f6h, 013h
        db      050h, 09ah, 005h, 000h, 03fh, 0d7h, 083h, 0c4h, 004h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech
        db      083h, 0c4h, 0fch, 0b8h, 001h, 014h, 050h, 09ah, 010h, 014h, 04ah, 0c0h, 083h, 0c4h, 002h, 0c6h
        db      006h, 05ch, 050h, 032h, 033h, 0c0h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h
        db      083h, 0c4h, 004h, 0b8h, 009h, 000h, 050h, 0b8h, 0f1h, 00ch, 050h, 0b8h, 098h, 04eh, 050h, 0b8h
        db      01ah, 014h, 050h, 09ah, 0cbh, 000h, 0bbh, 0d7h, 083h, 0c4h, 008h, 033h, 0c0h, 050h, 0b8h, 006h
        db      000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 028h, 000h, 050h, 0b8h, 03dh
        db      000h, 050h, 09ah, 093h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 033h, 0c0h, 050h, 0b8h, 007h, 000h
        db      050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 04ch, 014h, 050h, 09ah, 05bh, 000h
        db      031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 001h, 000h, 050h, 09ah, 028h, 000h, 030h, 0d8h, 083h, 0c4h
        db      002h, 089h, 046h, 0feh, 085h, 0c0h, 075h, 002h, 0ebh, 0ebh, 083h, 07eh, 0feh, 078h, 074h, 003h
        db      0e9h, 08ah, 000h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h
        db      0c4h, 004h, 0b8h, 058h, 014h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 001h
        db      000h, 050h, 0ffh, 076h, 006h, 09ah, 0afh, 015h, 04ah, 0c0h, 083h, 0c4h, 004h, 089h, 046h, 0fch
        db      085h, 0c0h, 074h, 011h, 050h, 09ah, 00eh, 000h, 001h, 0ddh, 083h, 0c4h, 002h, 0a0h, 05bh, 050h
        db      098h, 08bh, 0e5h, 05dh, 0cbh, 0feh, 006h, 04bh, 089h, 0a0h, 098h, 04eh, 098h, 050h, 0ffh, 076h
        db      006h, 09ah, 046h, 003h, 074h, 0d9h, 083h, 0c4h, 004h, 089h, 046h, 0fch, 085h, 0c0h, 074h, 01fh
        db      0a0h, 098h, 04eh, 098h, 08bh, 0d8h, 08ah, 087h, 020h, 0aah, 098h, 050h, 09ah, 008h, 000h, 033h
        db      0deh, 083h, 0c4h, 002h, 0ffh, 076h, 0fch, 09ah, 00eh, 000h, 001h, 0ddh, 083h, 0c4h, 002h, 09ah
        db      054h, 000h, 022h, 0d7h, 0feh, 00eh, 04bh, 089h, 0c7h, 046h, 0feh, 000h, 000h, 08bh, 046h, 0feh
        db      0ebh, 0afh, 055h, 08bh, 0ech, 083h, 0c4h, 0fbh, 0b8h, 066h, 014h, 050h, 09ah, 010h, 014h, 04ah
        db      0c0h, 083h, 0c4h, 002h, 0c6h, 006h, 05ch, 050h, 035h, 033h, 0c0h, 050h, 0b8h, 002h, 000h, 050h
        db      09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 09ah, 000h, 000h, 0b4h, 0d6h, 088h, 046h, 0fbh
        db      0b8h, 00ah, 000h, 050h, 0b8h, 063h, 000h, 050h, 0b8h, 001h, 000h, 050h, 0b8h, 002h, 000h, 050h
        db      08dh, 046h, 0fbh, 050h, 0b8h, 082h, 014h, 050h, 09ah, 0cah, 002h, 0bbh, 0d7h, 083h, 0c4h, 00ch
        db      033h, 0c0h, 050h, 0b8h, 006h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h
        db      028h, 000h, 050h, 0b8h, 03dh, 000h, 050h, 09ah, 093h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 033h
        db      0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 0a1h
        db      014h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 001h, 000h, 050h, 09ah, 028h
        db      000h, 030h, 0d8h, 083h, 0c4h, 002h, 089h, 046h, 0feh, 085h, 0c0h, 075h, 002h, 0ebh, 0ebh, 083h
        db      07eh, 0feh
        db      "xut3"
        db      0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 0adh
        db      014h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 002h, 000h, 050h, 0ffh, 076h
        db      006h, 09ah, 0afh, 015h, 04ah, 0c0h, 083h, 0c4h, 004h, 089h, 046h, 0fch, 085h, 0c0h, 074h, 011h
        db      050h, 09ah, 00eh, 000h, 001h, 0ddh, 083h, 0c4h, 002h, 0a0h, 05bh, 050h, 098h, 08bh, 0e5h, 05dh
        db      0cbh, 0feh, 006h, 04bh, 089h, 08ah, 046h, 0fbh, 098h, 050h, 0ffh, 076h, 006h, 09ah, 007h, 000h
        db      0f5h, 0dah, 083h, 0c4h, 004h, 089h, 046h, 0fch, 085h, 0c0h, 074h, 009h, 050h, 09ah, 00eh, 000h
        db      001h, 0ddh, 083h, 0c4h, 002h, 09ah, 054h, 000h, 022h, 0d7h, 0feh, 00eh, 04bh, 089h, 0c7h, 046h
        db      0feh, 000h, 000h, 08bh, 046h, 0feh, 0ebh, 0c5h, 055h, 08bh, 0ech, 083h, 0c4h, 0fah, 0c6h, 006h
        db      05ch, 050h, 036h, 0b8h, 0bdh, 014h, 050h, 09ah, 010h, 014h, 04ah, 0c0h, 083h, 0c4h, 002h, 033h
        db      0c0h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 0dch
        db      014h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 006h, 000h
        db      050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 028h, 000h, 050h, 0b8h, 03dh, 000h
        db      050h, 09ah, 093h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h
        db      09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 019h, 015h, 050h, 09ah, 05bh, 000h, 031h
        db      0d7h, 083h, 0c4h, 002h, 0b8h, 001h, 000h, 050h, 09ah, 028h, 000h, 030h, 0d8h, 083h, 0c4h, 002h
        db      089h, 046h, 0feh, 083h, 07eh, 0feh, 078h, 074h, 003h, 0e9h, 09bh, 000h, 033h, 0c0h, 050h, 0b8h
        db      007h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 025h, 015h, 050h, 09ah
        db      05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 002h, 000h, 050h, 0ffh, 076h, 006h, 09ah, 0afh
        db      015h, 04ah, 0c0h, 083h, 0c4h, 004h, 089h, 046h, 0fch, 085h, 0c0h, 074h, 011h, 050h, 09ah, 00eh
        db      000h, 001h, 0ddh, 083h, 0c4h, 002h, 0a0h, 05bh, 050h, 098h, 08bh, 0e5h, 05dh, 0cbh, 0feh, 006h
        db      04bh, 089h, 0ffh, 076h, 006h, 09ah, 00ah, 000h, 033h, 0dbh, 083h, 0c4h, 002h, 089h, 046h, 0fch
        db      085h, 0c0h, 074h, 00bh, 050h, 09ah, 00eh, 000h, 001h, 0ddh, 083h, 0c4h, 002h, 0ebh, 02ah, 08bh
        db      05eh, 006h, 080h, 07fh, 00bh, 000h, 074h, 005h, 0b8h, 010h, 000h, 0ebh, 003h, 0b8h, 008h, 000h
        db      089h, 046h, 0fah, 050h, 053h, 0b8h, 01eh, 08ah, 050h, 09ah, 006h, 000h, 0f9h, 0f0h, 083h, 0c4h
        db      006h, 08bh, 05eh, 0fah, 0c6h, 087h, 01eh, 08ah, 000h, 09ah, 054h, 000h, 022h, 0d7h, 0feh, 00eh
        db      04bh, 089h, 0c7h, 046h, 0feh, 000h, 000h, 08bh, 046h, 0feh, 0ebh, 09eh, 055h, 08bh, 0ech, 083h
        db      0c4h, 0fah, 0b8h, 037h, 015h, 050h, 09ah, 010h, 014h, 04ah, 0c0h, 083h, 0c4h, 002h, 0c6h, 006h
        db      05ch, 050h, 039h, 033h, 0c0h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h
        db      0c4h, 004h, 0b8h, 054h, 015h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 07bh
        db      015h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 0a2h, 015h, 050h, 09ah, 05bh
        db      000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 0cbh, 015h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h
        db      0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 006h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h
        db      004h, 0b8h, 028h, 000h, 050h, 0b8h, 03dh, 000h, 050h, 09ah, 093h, 000h, 031h, 0d7h, 083h, 0c4h
        db      004h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h
        db      0b8h, 0d4h, 015h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 001h, 000h, 050h
        db      09ah, 028h, 000h, 030h, 0d8h, 083h, 0c4h, 002h, 089h, 046h, 0feh, 085h, 0c0h, 075h, 002h, 0ebh
        endif
        if      FW_VERSION >= 214
        db      0c3h, 0b8h, 0f6h, 0ffh, 00bh, 0c0h, 0c3h, 033h, 0d2h, 0b8h, 097h, 01eh, 0b9h, 004h, 000h, 0d1h
        db      0e0h, 0d1h, 0d2h, 0e2h, 0fah, 0c1h, 0cah, 004h, 0a3h, 096h, 09bh, 089h, 016h, 098h, 09bh, 0c7h
        db      006h, 092h, 09bh, 0feh, 0ffh, 0c7h, 006h, 094h, 09bh, 000h, 070h, 0cbh, 055h, 08bh, 0ech, 083h
        db      0c4h, 0ebh, 09ah, 00eh, 000h, 0b6h, 0d4h, 09ah, 006h, 000h, 0fah, 0e5h, 0c6h, 006h, 0d9h, 053h
        db      001h, 09ah, 00ah, 000h, 080h, 0d8h, 0b8h, 001h, 000h, 050h, 050h, 0b8h, 0a6h, 094h, 050h, 09ah
        db      002h, 000h, 0a8h, 0d6h, 083h, 0c4h, 006h, 09ah, 070h, 001h, 006h, 0c0h, 09ah, 07fh, 001h, 006h
        db      0c0h, 0b8h, 00bh, 014h, 050h, 09ah, 000h, 000h, 073h, 0dah, 059h, 0b8h, 00ah, 000h, 050h, 0b8h
        db      002h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 016h, 014h, 050h, 09ah
        db      05ch, 000h, 080h, 0d8h, 059h, 0b8h, 009h, 000h, 050h, 0b8h, 003h, 000h, 050h, 09ah, 027h, 000h
        db      080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 02ah, 014h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 059h, 0b8h
        db      00eh, 000h, 050h, 0b8h, 004h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h
        db      041h, 014h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 059h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h
        db      09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 04eh, 014h, 050h, 09ah, 05ch, 000h, 070h
        db      0a6h, 003h, 000h, 006h, 0dah, 053h, 001h, 0bah, 000h, 000h, 0b8h, 000h, 000h, 052h, 050h, 0b8h
        db      063h, 000h, 050h, 0b8h, 00ch, 000h, 050h, 09ah, 00ch, 000h, 0b8h, 0d7h, 083h, 0c4h, 008h, 03dh
        db      000h, 0f7h, 075h, 005h, 0c6h, 006h, 0dah, 053h, 000h, 09ah, 004h, 000h, 0beh, 0d7h, 085h, 0c0h
        db      075h, 003h, 0e9h, 0ach, 000h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 027h, 000h, 080h
        db      0d8h, 083h, 0c4h, 004h, 0b8h, 070h, 014h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 059h, 0feh, 006h
        db      0cbh, 08ch, 080h, 03eh, 002h, 08eh, 000h, 075h, 019h, 08dh, 046h, 0edh, 050h, 0b8h, 092h, 014h
        db      050h, 0b8h, 009h, 000h, 050h, 09ah, 00ch, 000h, 0b8h, 0d7h, 083h, 0c4h, 006h, 089h, 046h, 0ebh
        db      0ebh, 017h, 08dh, 046h, 0edh, 050h, 0b8h, 09eh, 014h, 050h, 0b8h, 009h, 000h, 050h, 09ah, 00ch
        db      000h, 0b8h, 0d7h, 083h, 0c4h, 006h, 089h, 046h, 0ebh, 083h, 07eh, 0ebh, 000h, 075h, 029h, 08dh
        db      046h, 0f4h, 050h, 09ah, 000h, 000h, 0c4h, 0dah, 059h, 085h, 0c0h, 074h, 007h, 09ah, 00ch, 000h
        db      08fh, 0dfh, 0ebh, 014h, 0b8h, 008h, 000h, 050h, 08dh, 046h, 0f4h, 050h, 0b8h, 01fh, 08eh, 050h
        db      09ah, 007h, 000h, 065h, 0f2h, 083h, 0c4h, 006h, 0b8h, 0aah, 014h, 050h, 09ah, 00fh, 000h, 084h
        db      0dch, 059h, 085h, 0c0h, 074h, 007h, 09ah, 00eh, 000h, 0b6h, 0d4h, 0ebh, 010h, 0b8h, 0b6h, 014h
        db      050h, 0b8h, 030h, 08eh, 050h, 09ah, 00ah, 000h, 063h, 0f2h, 083h, 0c4h, 004h, 0feh, 00eh, 0cbh
        db      08ch, 09ah, 0dah, 000h, 0beh, 0d7h, 09ah, 008h, 000h, 05fh, 0c3h, 08bh, 0e5h, 05dh, 0cbh, 055h
        db      08bh, 0ech, 083h, 0c4h, 0dbh, 0b8h, 003h, 015h, 050h, 09ah, 000h, 000h, 073h, 0dah, 083h, 0c4h
        db      002h, 033h, 0c0h, 050h, 0b8h, 001h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h
        db      0b8h, 008h, 015h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h
        db      002h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 031h, 015h, 050h, 09ah
        db      05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 003h, 000h, 050h, 09ah, 027h
        db      000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 056h, 015h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h
        db      0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 004h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h
        db      004h, 0b8h, 07dh, 015h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 080h, 03eh, 002h
        db      08eh, 001h, 074h, 01bh, 033h, 0c0h, 050h, 0b8h, 005h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h
        db      083h, 0c4h, 004h, 0b8h, 0a0h, 015h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 033h
        db      0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 033h, 0c0h
        db      050h, 0b8h, 009h, 000h, 050h, 08dh, 046h, 0ffh, 050h, 09ah, 003h, 000h, 053h, 0dah, 083h, 0c4h
        db      006h, 089h, 046h, 0fdh, 083h, 07eh, 0fdh, 000h, 074h, 003h, 0e9h, 067h, 006h, 08ah, 046h, 0ffh
        db      0a2h, 0dch, 053h, 098h, 0e9h, 050h, 006h, 08ah, 046h, 0ffh, 098h, 050h, 09ah, 00dh, 000h, 0b5h
        db      0c8h, 083h, 0c4h, 002h, 089h, 046h, 0fdh, 0e9h, 04ah, 006h, 0c7h, 006h, 016h, 0b2h, 000h, 000h
        db      083h, 07eh, 0fdh, 000h, 074h, 003h, 0e9h, 04bh, 001h, 08ah, 046h, 0ffh, 0a2h, 0dch, 053h, 08dh
        db      046h, 0dbh, 050h, 09ah, 03bh, 007h, 04fh, 0c0h, 083h, 0c4h, 002h, 089h, 046h, 0fdh, 0e9h, 0f9h
        db      000h, 080h, 03eh, 0dah, 053h, 000h, 074h, 015h, 0b8h, 002h, 000h, 050h, 08dh, 046h, 0dbh, 050h
        db      09ah, 031h, 003h, 07eh, 0e6h, 083h, 0c4h, 004h, 089h, 046h, 0fdh, 0ebh, 00fh, 08dh, 046h, 0dbh
        db      050h, 09ah, 004h, 000h, 07eh, 0e6h, 083h, 0c4h, 002h, 089h, 046h, 0fdh, 0e9h, 002h, 001h, 08dh
        db      046h, 0dbh, 050h, 09ah, 0e4h, 00bh, 04fh, 0c0h, 083h, 0c4h, 002h, 089h, 046h, 0fdh, 0e9h, 0f0h
        db      000h, 08dh, 046h, 0dbh, 050h, 09ah, 009h, 00dh, 04fh, 0c0h, 083h, 0c4h, 002h, 089h, 046h, 0fdh
        db      0e9h, 0deh, 000h, 08dh, 046h, 0dbh, 050h, 09ah, 025h, 00eh, 04fh, 0c0h, 083h, 0c4h, 002h, 089h
        db      046h, 0fdh, 080h, 00eh, 0dbh, 08ch, 040h, 080h, 00eh, 0dah, 08ch, 080h, 0e9h, 0c2h, 000h, 033h
        db      0c0h, 050h, 08dh, 046h, 0dbh, 050h, 09ah, 0fdh, 01bh, 04fh, 0c0h, 083h, 0c4h, 004h, 089h, 046h
        db      0fbh, 085h, 0c0h, 074h, 011h, 050h, 09ah, 003h, 000h, 053h, 0deh, 083h, 0c4h, 002h, 0a0h, 0dbh
        db      053h, 098h, 08bh, 0e5h, 05dh, 0cbh, 08dh, 046h, 0dbh, 050h, 09ah, 049h, 00fh, 04fh, 0c0h, 083h
        db      0c4h, 002h, 089h, 046h, 0fdh, 0e9h, 089h, 000h, 080h, 03eh, 0dah, 053h, 000h, 074h, 015h, 0b8h
        db      005h, 000h, 050h, 08dh, 046h, 0dbh, 050h, 09ah, 031h, 003h, 07eh, 0e6h, 083h, 0c4h, 004h, 089h
        db      046h, 0fdh, 0ebh, 00fh, 08dh, 046h, 0dbh, 050h, 09ah, 046h, 001h, 07eh, 0e6h, 083h, 0c4h, 002h
        db      089h, 046h, 0fdh, 0ebh, 05ch, 0b8h, 0d9h, 0ffh, 050h, 09ah, 003h, 000h, 053h, 0deh, 083h, 0c4h
        db      002h, 0a0h, 0dbh, 053h, 098h, 089h, 046h, 0fdh, 0ebh, 047h, 09ah, 03bh, 013h, 04fh, 0c0h, 089h
        db      046h, 0fdh, 0c7h, 006h, 016h, 0b2h, 000h, 000h, 0ebh, 037h, 03dh, 0f9h, 0ffh, 074h, 0d6h, 03dh
        db      0fah, 0ffh, 074h, 0a4h, 03dh, 0fbh, 0ffh, 075h, 003h, 0e9h, 063h, 0ffh, 03dh, 0fch, 0ffh, 075h
        db      003h, 0e9h, 03fh, 0ffh, 03dh, 0fdh, 0ffh, 075h, 003h, 0e9h, 025h, 0ffh, 03dh, 0feh, 0ffh, 075h
        db      003h, 0e9h, 00bh, 0ffh, 03dh, 0ffh, 0ffh, 075h, 003h, 0e9h, 0d5h, 0feh, 03dh, 075h, 000h, 074h
        db      0b9h, 0e9h, 0ach, 0feh, 0e9h, 0edh, 004h, 09ah, 019h, 014h, 04fh, 0c0h, 089h, 046h, 0fdh, 0e9h
        db      0e2h, 004h, 09ah, 023h, 015h, 04fh, 0c0h, 089h, 046h, 0fdh, 0e9h, 0d7h, 004h, 080h, 03eh, 002h
        db      08eh, 001h, 075h, 003h, 0e9h, 07ah, 004h, 09ah, 00ah, 000h, 080h, 0d8h, 0b8h, 0b2h, 015h, 050h
        db      09ah, 000h, 000h, 073h, 0dah, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 001h, 000h, 050h, 09ah
        db      027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 0c7h, 015h, 050h, 09ah, 05ch, 000h, 080h, 0d8h
        db      083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h
        db      0c4h, 004h, 0b8h, 0dfh, 015h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 033h, 0c0h
        db      050h, 0b8h, 007h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 033h, 0c0h, 050h
        db      0b8h, 002h, 000h, 050h, 08dh, 046h, 0ffh, 050h, 09ah, 003h, 000h, 053h, 0dah, 083h, 0c4h, 006h
        db      089h, 046h, 0fdh, 083h, 07eh, 0fdh, 000h, 074h, 003h, 0e9h, 003h, 004h, 08ah, 046h, 0ffh, 098h
        db      0e9h, 0ech, 003h, 033h, 0c0h, 050h, 0b8h, 0ffh, 0ffh, 050h, 09ah, 005h, 000h, 085h, 0d4h, 083h
        db      0c4h, 004h, 033h, 0c0h, 050h, 0b8h, 0ffh, 0ffh, 050h, 09ah, 0a3h, 001h, 085h, 0d4h, 083h, 0c4h
        db      004h, 033h, 0c0h, 050h, 09ah, 04bh, 002h, 085h, 0d4h, 083h, 0c4h, 002h, 0a0h, 0dbh, 053h, 098h
        db      089h, 046h, 0fdh, 0e9h, 0c9h, 003h, 0b8h, 0f2h, 015h, 050h, 09ah, 05eh, 01ah, 04fh, 0c0h, 083h
        db      0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 001h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h
        db      004h, 0b8h, 038h, 000h, 050h, 0b8h, 003h, 000h, 050h, 0b8h, 066h, 000h, 050h, 09ah, 083h, 074h
        db      03fh, 0cch, 083h, 0c4h, 006h, 0b8h, 0ddh, 053h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h
        db      002h, 033h, 0c0h, 050h, 0b8h, 006h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h
        db      0b8h, 028h, 000h, 050h, 0b8h, 03dh, 000h, 050h, 09ah, 094h, 000h, 080h, 0d8h, 083h, 0c4h, 004h
        db      0c6h, 006h, 0dch, 053h, 05bh, 0b8h, 001h, 000h, 050h, 09ah, 02ah, 000h, 07fh, 0d9h, 083h, 0c4h
        db      002h, 089h, 046h, 0fdh, 0b9h, 078h, 000h, 03bh, 0c1h, 074h, 003h, 0e9h, 03fh, 003h, 033h, 0c0h
        db      050h, 0b8h, 001h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 0c8h, 000h
        db      050h, 0b8h, 020h, 000h, 050h, 09ah, 094h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 033h, 0c0h, 050h
        db      0a0h, 0fch, 08dh, 098h, 050h, 09ah, 03ch, 002h, 0e3h, 0d7h, 083h, 0c4h, 004h, 089h, 056h, 0f1h
        db      089h, 046h, 0efh, 083h, 0fah, 000h, 07fh, 007h, 075h, 007h, 03dh, 000h, 000h, 076h, 002h, 0ebh
        db      042h, 09ah, 07fh, 003h, 0e3h, 0d7h, 0a2h, 002h, 08eh, 033h, 0c0h, 050h, 0a0h, 0fch, 08dh, 098h
        db      050h, 09ah, 03ch, 002h, 0e3h, 0d7h, 083h, 0c4h, 004h, 089h, 056h, 0f1h, 089h, 046h, 0efh, 083h
        db      0fah, 000h, 07fh, 007h, 075h, 007h, 03dh, 000h, 000h, 076h, 002h, 0ebh, 016h, 0b8h, 0c4h, 0ffh
        db      050h, 09ah, 003h, 000h, 053h, 0deh, 083h, 0c4h, 002h, 0a0h, 0dbh, 053h, 098h, 089h, 046h, 0fdh
        db      0e9h, 0cch, 002h, 08bh, 056h, 0f1h, 08bh, 046h, 0efh, 050h, 092h, 0bbh, 040h, 000h, 0f7h, 0e3h
        db      08bh, 0c8h, 058h, 0f7h, 0e3h, 003h, 0d1h, 0bbh, 000h, 000h, 0b9h, 07dh, 000h, 09ah, 007h, 000h
        db      06ah, 0f2h, 005h, 0f4h, 001h, 083h, 0d2h, 000h, 0bbh, 000h, 000h, 0b9h, 0e8h, 003h, 09ah, 007h
        db      000h, 06ah, 0f2h, 089h, 046h, 0f7h, 033h, 0c0h, 050h, 0b8h, 001h, 000h, 050h, 09ah, 027h, 000h
        db      080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 039h, 000h, 050h, 0b8h, 003h, 000h, 050h, 0b8h, 066h, 000h
        db      050h, 09ah, 083h, 074h, 03fh, 0cch, 083h, 0c4h, 006h, 0b8h, 0ddh, 053h, 050h, 09ah, 05ch, 000h
        db      080h, 0d8h, 083h, 0c4h, 002h, 0b8h, 00bh, 000h, 050h, 0b8h, 003h, 000h, 050h, 09ah, 027h, 000h
        db      080h, 0d8h, 083h, 0c4h, 004h, 0ffh, 076h, 0f7h, 0b8h, 003h, 016h, 050h, 09ah, 006h, 000h, 08eh
        db      0d8h, 083h, 0c4h, 004h, 0c7h, 046h, 0f9h, 001h, 000h, 08dh, 046h, 0f5h, 050h, 08dh, 046h, 0f9h
        db      050h, 0ffh, 076h, 0f1h, 0ffh, 076h, 0efh, 09ah, 083h, 01ch, 04fh, 0c0h, 083h, 0c4h, 008h, 089h
        db      046h, 0f3h, 0b8h, 01bh, 000h, 050h, 0b8h, 001h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h
        db      0c4h, 004h, 0b8h, 002h, 000h, 050h, 0b8h, 01ah, 000h, 050h, 0b8h, 001h, 000h, 050h, 0b8h, 002h
        db      000h, 050h, 08dh, 046h, 0f9h, 050h, 0b8h, 007h, 016h, 050h, 09ah, 0cch, 002h, 00ah, 0d9h, 083h
        db      0c4h, 00ch, 0b8h, 01bh, 000h, 050h, 0b8h, 001h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h
        db      0c4h, 004h, 08bh, 046h, 0f9h, 003h, 046h, 0f5h, 050h, 0b8h, 008h, 016h, 050h, 09ah, 006h, 000h
        db      08eh, 0d8h, 083h, 0c4h, 004h, 0b8h, 001h, 000h, 050h, 09ah, 02ah, 000h, 07fh, 0d9h, 083h, 0c4h
        db      002h, 089h, 046h, 0fdh, 085h, 0c0h, 075h, 049h, 08dh, 046h, 0f5h, 050h, 08dh, 046h, 0f9h, 050h
        db      0ffh, 076h, 0f1h, 0ffh, 076h, 0efh, 09ah, 083h, 01ch, 04fh, 0c0h, 083h, 0c4h, 008h, 089h, 046h
        db      0f3h, 033h, 0c0h, 050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h, 002h, 0b8h, 01bh, 000h, 050h
        db      0b8h, 001h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 08bh, 046h, 0f9h, 003h
        db      046h, 0f5h, 050h, 0b8h, 00dh, 016h, 050h, 09ah, 006h, 000h, 08eh, 0d8h, 083h, 0c4h, 004h, 0ebh
        db      0a4h, 083h, 07eh, 0fdh, 078h, 074h, 003h, 0e9h, 063h, 001h, 033h, 0c0h, 050h, 0b8h, 001h, 000h
        db      050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 0c8h, 000h, 050h, 0b8h, 020h, 000h
        db      050h, 09ah, 094h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 033h, 0c0h, 050h, 0b8h, 001h, 000h, 050h
        db      09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 03ah, 000h, 050h, 0b8h, 003h, 000h, 050h
        db      0b8h, 066h, 000h, 050h, 09ah, 083h, 074h, 03fh, 0cch, 083h, 0c4h, 006h, 0b8h, 0ddh, 053h, 050h
        db      09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 0b8h, 001h, 000h, 050h, 09ah, 02ah, 000h, 07fh
        db      0d9h, 083h, 0c4h, 002h, 089h, 046h, 0fdh, 0b9h, 078h, 000h, 03bh, 0c1h, 074h, 003h, 0e9h, 0fch
        db      000h, 033h, 0c0h, 050h, 0b8h, 001h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h
        db      0b8h, 0c8h, 000h, 050h, 0b8h, 020h, 000h, 050h, 09ah, 094h, 000h, 080h, 0d8h, 083h, 0c4h, 004h
        db      033h, 0c0h, 050h, 0b8h, 001h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h
        db      03bh, 000h, 050h, 0b8h, 003h, 000h, 050h, 0b8h, 066h, 000h, 050h, 09ah, 083h, 074h, 03fh, 0cch
        db      083h, 0c4h, 006h, 0b8h, 0ddh, 053h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 0b8h
        db      001h, 000h, 050h, 09ah, 02ah, 000h, 07fh, 0d9h, 083h, 0c4h, 002h, 089h, 046h, 0fdh, 0b9h, 078h
        db      000h, 03bh, 0c1h, 074h, 003h, 0e9h, 095h, 000h, 033h, 0c0h, 050h, 0b8h, 001h, 000h, 050h, 09ah
        db      027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 0c8h, 000h, 050h, 0b8h, 020h, 000h, 050h, 09ah
        db      094h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 033h, 0c0h, 050h, 0b8h, 003h, 000h, 050h, 09ah, 027h
        db      000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 012h, 016h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h
        db      0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h
        db      004h, 0b8h, 035h, 016h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 0ffh, 076h, 0f3h
        db      0b8h, 003h, 000h, 050h, 09ah, 000h, 000h, 036h, 0d8h, 083h, 0c4h, 004h, 089h, 046h, 0fbh, 083h
        db      07eh, 0fbh, 000h, 075h, 008h, 09ah, 07fh, 003h, 0e3h, 0d7h, 089h, 046h, 0fbh, 083h, 07eh, 0fbh
        db      000h, 074h, 00eh, 0b8h, 0c4h, 0ffh, 050h, 09ah, 003h, 000h, 053h, 0deh, 083h, 0c4h, 002h, 0ebh
        db      005h, 0c6h, 006h, 002h, 08eh, 000h, 0a0h, 0dbh, 053h, 098h, 089h, 046h, 0fdh, 0ebh, 010h, 03dh
        db      001h, 000h, 075h, 003h, 0e9h, 00ch, 0fch, 03dh, 002h, 000h, 075h, 003h, 0e9h, 037h, 0fch, 0ebh
        db      030h, 033h, 0c0h, 050h, 0b8h, 0ffh, 0ffh, 050h, 09ah, 005h, 000h, 085h, 0d4h, 083h, 0c4h, 004h
        db      033h, 0c0h, 050h, 0b8h, 0ffh, 0ffh, 050h, 09ah, 0a3h, 001h, 085h, 0d4h, 083h, 0c4h, 004h, 033h
        db      0c0h, 050h, 09ah, 04bh, 002h, 085h, 0d4h, 083h, 0c4h, 002h, 0a0h, 0dbh, 053h, 098h, 089h, 046h
        db      0fdh, 0ebh, 021h, 035h, 007h, 0d8h, 000h, 0d8h, 000h, 0d8h, 000h, 0d8h, 000h, 0d8h, 000h, 0ebh
        db      000h, 048h, 002h, 053h, 002h, 05eh, 002h, 03dh, 00ah, 000h, 073h, 008h, 093h, 0d1h, 0e3h, 02eh
        db      0ffh, 0a7h, 014h, 007h, 08bh, 046h, 0fdh, 0e9h, 068h, 0fah, 055h, 08bh, 0ech, 081h, 0c4h, 0c6h
        db      0e9h, 056h, 0b8h, 04dh, 016h, 050h, 09ah, 05eh, 01ah, 04fh, 0c0h, 083h, 0c4h, 002h, 0b8h, 008h
        db      000h, 080h, 03eh, 0dah, 053h, 000h, 074h, 003h, 0b8h, 010h, 000h, 089h, 046h, 0f4h, 0c7h, 046h
        db      0f8h, 009h, 000h, 0c7h, 046h, 0fah, 000h, 000h, 033h, 0c0h, 050h, 09ah, 00ch, 000h, 0b8h, 0d7h
        db      083h, 0c4h, 002h, 0c7h, 046h, 0f6h, 000h, 000h, 0c7h, 046h, 0eeh, 000h, 000h, 0b8h, 03fh, 000h
        db      050h, 0b8h, 014h, 000h, 050h, 08dh, 046h, 0dah, 050h, 09ah, 00ch, 000h, 05dh, 0f2h, 083h, 0c4h
        db      006h, 08bh, 076h, 0f4h, 0c6h, 042h, 0ddh, 000h, 0c7h, 086h, 016h, 0feh, 000h, 000h, 0c7h, 046h
        db      0d8h, 000h, 000h, 0c7h, 046h, 0fch, 000h, 000h, 08dh, 086h, 0c6h, 0e9h, 050h, 08dh, 046h, 0dah
        db      050h, 0ffh, 076h, 0f8h, 09ah, 00ch, 000h, 0b8h, 0d7h, 083h, 0c4h, 006h, 089h, 046h, 0fah, 033h
        db      0c9h, 03bh, 0c1h, 07dh, 04fh, 081h, 07eh, 0fah, 000h, 0fdh, 074h, 012h, 050h, 09ah, 003h, 000h
        db      053h, 0deh, 083h, 0c4h, 002h, 0a0h, 0dbh, 053h, 098h, 05eh, 08bh, 0e5h, 05dh, 0cbh, 08bh, 046h
        db      0fch, 08bh, 0d0h, 0d1h, 0e0h, 003h, 0c2h, 0b1h, 003h, 0d3h, 0e0h, 02bh, 0c2h, 08bh, 0f0h, 0c7h
        db      082h, 0f6h, 0e9h, 000h, 000h, 08bh, 076h, 0fch, 0d1h, 0e6h, 0c7h, 082h, 018h, 0feh, 000h, 000h
        db      083h, 07eh, 0fch, 000h, 075h, 00ch, 0c7h, 086h, 018h, 0feh, 0ech, 014h, 0c7h, 086h, 01ah, 0feh
        db      000h, 000h, 0ebh, 076h, 08bh, 046h, 0fch, 08bh, 0d0h, 0d1h, 0e0h, 003h, 0c2h, 0b1h, 003h, 0d3h
        db      0e0h, 02bh, 0c2h, 08dh, 08eh, 0e1h, 0e9h, 003h, 0c1h, 08bh, 076h, 0fch, 0d1h, 0e6h, 089h, 082h
        db      018h, 0feh, 050h, 08dh, 086h, 0cdh, 0e9h, 050h, 09ah, 07ch, 019h, 04fh, 0c0h, 083h, 0c4h, 004h
        db      08bh, 096h, 0c9h, 0e9h, 08bh, 086h, 0c7h, 0e9h, 005h, 0ffh, 003h, 083h, 0d2h, 000h, 0bbh, 000h
        db      000h, 0b9h, 000h, 004h, 09ah, 007h, 000h, 06ah, 0f2h, 050h, 08bh, 046h, 0fch, 08bh, 0d0h, 0d1h
        db      0e0h, 003h, 0c2h, 0b1h, 003h, 0d3h, 0e0h, 02bh, 0c2h, 08bh, 0f0h, 058h, 089h, 082h, 0f6h, 0e9h
        db      0c7h, 046h, 0f6h, 001h, 000h, 0ffh, 046h, 0eeh, 0c7h, 046h, 0f8h, 00ah, 000h, 0ffh, 046h, 0fch
        db      081h, 07eh, 0fch, 0e0h, 000h, 07dh, 003h, 0e9h, 01eh, 0ffh, 083h, 07eh, 0eeh, 001h, 07eh, 03ch
        db      0ffh, 076h, 0eeh, 08dh, 086h, 018h, 0feh, 050h, 09ah, 093h, 01ah, 04fh, 0c0h, 083h, 0c4h, 004h
        db      0bah, 04fh, 0c0h, 0b8h, 07ah, 01ah, 052h, 050h, 0b8h, 002h, 000h, 050h, 0ffh, 076h, 0eeh, 08dh
        db      086h, 018h, 0feh, 050h, 09ah, 00ch, 000h, 043h, 0f2h, 083h, 0c4h, 00ah, 0ffh, 076h, 0eeh, 08dh
        db      086h, 018h, 0feh, 050h, 09ah, 051h, 01bh, 04fh, 0c0h, 083h, 0c4h, 004h, 0c7h, 046h, 0feh, 0ffh
        db      0ffh, 083h, 07eh, 0feh, 000h, 07eh, 003h, 0e9h, 0ddh, 002h, 0b8h, 04dh, 016h, 050h, 09ah, 05eh
        db      01ah, 04fh, 0c0h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 001h, 000h, 050h, 09ah, 027h, 000h
        db      080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 065h, 016h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h
        db      002h, 033h, 0c0h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h
        db      0b8h, 014h, 000h, 050h, 08dh, 086h, 018h, 0feh, 050h, 0b8h, 016h, 0b2h, 050h, 0b8h, 085h, 016h
        db      050h, 09ah, 0cdh, 000h, 00ah, 0d9h, 083h, 0c4h, 008h, 08bh, 036h, 016h, 0b2h, 0d1h, 0e6h, 08bh
        db      09ah, 018h, 0feh, 0ffh, 077h, 015h, 09ah, 0beh, 00bh, 04fh, 0c0h, 083h, 0c4h, 002h, 080h, 03eh
        db      0f9h, 08dh, 000h, 074h, 027h, 033h, 0c0h, 050h, 0b8h, 003h, 000h, 050h, 09ah, 027h, 000h, 080h
        db      0d8h, 083h, 0c4h, 004h, 0a0h, 003h, 08eh, 098h, 08bh, 0d8h, 0d1h, 0e3h, 0ffh, 0b7h, 0ffh, 011h
        db      0b8h, 086h, 016h, 050h, 09ah, 006h, 000h, 08eh, 0d8h, 083h, 0c4h, 004h, 033h, 0c0h, 050h, 0b8h
        db      004h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 08eh, 016h, 050h, 09ah
        db      000h, 000h, 073h, 0dah, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 005h, 000h, 050h, 09ah, 027h
        db      000h, 080h, 0d8h, 083h, 0c4h, 004h, 09ah, 006h, 000h, 021h, 0d6h, 0bbh, 000h, 000h, 0b9h, 000h
        db      004h, 09ah, 007h, 000h, 06ah, 0f2h, 089h, 046h, 0f2h, 050h, 0b8h, 09ah, 016h, 050h, 09ah, 006h
        db      000h, 08eh, 0d8h, 083h, 0c4h, 004h, 09ah, 00ch, 000h, 005h, 0dfh, 050h, 092h, 0bbh, 00ch, 000h
        db      0f7h, 0e3h, 08bh, 0c8h, 058h, 0f7h, 0e3h, 003h, 0d1h, 0b9h, 003h, 000h, 0e3h, 006h, 0d1h, 0fah
        db      0d1h, 0d8h, 0e2h, 0fah, 0bbh, 000h, 000h, 0b9h, 000h, 004h, 09ah, 007h, 000h, 06ah, 0f2h, 089h
        db      046h, 0f0h, 050h, 0b8h, 0adh, 016h, 050h, 09ah, 006h, 000h, 08eh, 0d8h, 083h, 0c4h, 004h, 033h
        db      0c0h, 050h, 0b8h, 006h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 028h
        db      000h, 050h, 0b8h, 03dh, 000h, 050h, 09ah, 094h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 033h, 0c0h
        db      050h, 0b8h, 007h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 0c3h, 016h
        db      050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 080h, 03eh, 0f9h, 08dh, 000h, 074h, 00ch
        db      0b8h, 0ddh, 016h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 09ah, 098h, 000h, 061h
        db      0d8h, 083h, 07eh, 0feh, 000h, 07fh, 067h, 0b8h, 004h, 000h, 050h, 09ah, 02ah, 000h, 07fh, 0d9h
        db      083h, 0c4h, 002h, 089h, 046h, 0feh, 085h, 0c0h, 075h, 017h, 08bh, 036h, 016h, 0b2h, 0d1h, 0e6h
        db      08bh, 09ah, 018h, 0feh, 0ffh, 077h, 015h, 09ah, 0beh, 00bh, 04fh, 0c0h, 083h, 0c4h, 002h, 0ebh
        db      0d6h, 083h, 07eh, 0feh, 075h, 075h, 014h, 080h, 03eh, 0f9h, 08dh, 000h, 074h, 006h, 08bh, 046h
        db      0feh, 0e9h, 055h, 0fdh, 0c7h, 046h, 0feh, 000h, 000h, 0ebh, 0b6h, 083h, 07eh, 0f6h, 000h, 075h
        db      01bh, 08bh, 046h, 0feh, 0ebh, 007h, 0c7h, 046h, 0feh, 000h, 000h, 0ebh, 00fh, 03dh, 078h, 000h
        db      074h, 0f4h, 03dh, 079h, 000h, 074h, 0efh, 03dh, 07ah, 000h, 074h, 0eah, 0ebh, 093h, 0ffh, 076h
        db      006h, 08bh, 036h, 016h, 0b2h, 0d1h, 0e6h, 0ffh, 0b2h, 018h, 0feh, 09ah, 05fh, 018h, 04fh, 0c0h
        db      083h, 0c4h, 004h, 08bh, 05eh, 006h, 080h, 07fh, 00bh, 000h, 074h, 005h, 0b8h, 010h, 000h, 0ebh
        db      003h, 0b8h, 008h, 000h, 089h, 046h, 0f4h, 08bh, 046h, 0feh, 0e9h, 0c5h, 000h, 09ah, 050h, 000h
        db      080h, 0d8h, 0c7h, 046h, 0feh, 000h, 000h, 0c7h, 046h, 0fch, 000h, 000h, 0ebh, 02ah, 08bh, 05eh
        db      0fch, 0d1h, 0e3h, 0ffh, 0b7h, 0c0h, 014h, 08bh, 046h, 006h, 003h, 046h, 0f4h, 050h, 09ah, 003h
        db      000h, 076h, 0f2h, 083h, 0c4h, 004h, 085h, 0c0h, 075h, 00bh, 08bh, 046h, 0fch, 040h, 0f7h, 0d8h
        db      089h, 046h, 0feh, 0ebh, 00fh, 0ffh, 046h, 0fch, 08bh, 05eh, 0fch, 0d1h, 0e3h, 083h, 0bfh, 0c0h
        db      014h, 000h, 075h, 0cah, 083h, 07eh, 0feh, 0fah, 075h, 01fh, 0f6h, 006h, 04eh, 0aeh, 001h, 075h
        db      018h, 0b8h, 0d7h, 0ffh, 050h, 09ah, 003h, 000h, 053h, 0deh, 083h, 0c4h, 002h, 09ah, 056h, 000h
        db      080h, 0d8h, 0c7h, 046h, 0feh, 000h, 000h, 0ebh, 06bh, 083h, 07eh, 0feh, 000h, 075h, 013h, 0b8h
        db      0e2h, 0ffh, 050h, 09ah, 003h, 000h, 053h, 0deh, 083h, 0c4h, 002h, 09ah, 056h, 000h, 080h, 0d8h
        db      0ebh, 006h, 08bh, 046h, 0feh, 0e9h, 071h, 0fch, 0ebh, 04ah, 0ffh, 076h, 006h, 09ah, 06fh, 010h
        db      04fh, 0c0h, 083h, 0c4h, 002h, 089h, 046h, 0feh, 0b8h, 036h, 000h, 050h, 09ah, 082h, 000h, 061h
        db      0d8h, 083h, 0c4h, 002h, 0ebh, 02eh, 0ffh, 076h, 006h, 09ah, 069h, 011h, 04fh, 0c0h, 083h, 0c4h
        db      002h, 089h, 046h, 0feh, 0b8h, 036h, 000h, 050h, 09ah, 082h, 000h, 061h, 0d8h, 083h, 0c4h, 002h
        db      0ebh, 012h, 03dh, 078h, 000h, 075h, 003h, 0e9h, 033h, 0ffh, 03dh, 079h, 000h, 074h, 0bbh, 03dh
        db      07ah, 000h, 074h, 0d2h, 0e9h, 01ah, 0fdh, 08bh, 046h, 0feh, 0e9h, 01ch, 0fch, 055h, 08bh, 0ech
        db      0b8h, 01ch, 000h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h
        db      0ffh, 076h, 006h, 0b8h, 0edh, 016h, 050h, 09ah, 006h, 000h, 08eh, 0d8h, 083h, 0c4h, 004h, 08bh
        db      0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0fch, 0b8h, 0f8h, 016h, 050h, 09ah, 05eh, 01ah
        db      04fh, 0c0h, 083h, 0c4h, 002h, 0c6h, 006h, 0dch, 053h, 032h, 033h, 0c0h, 050h, 0b8h, 002h, 000h
        db      050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 009h, 000h, 050h, 0b8h, 0f1h, 00ch
        db      050h, 0b8h, 018h, 052h, 050h, 0b8h, 011h, 017h, 050h, 09ah, 0cdh, 000h, 00ah, 0d9h, 083h, 0c4h
        db      008h, 033h, 0c0h, 050h, 0b8h, 006h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h
        db      0b8h, 028h, 000h, 050h, 0b8h, 03dh, 000h, 050h, 09ah, 094h, 000h, 080h, 0d8h, 083h, 0c4h, 004h
        db      033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h
        db      043h, 017h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 0b8h, 001h, 000h, 050h, 09ah
        db      02ah, 000h, 07fh, 0d9h, 083h, 0c4h, 002h, 089h, 046h, 0feh, 085h, 0c0h, 075h, 002h, 0ebh, 0ebh
        db      083h, 07eh, 0feh, 078h, 074h, 003h, 0e9h, 08ah, 000h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h
        db      09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 04fh, 017h, 050h, 09ah, 05ch, 000h, 080h
        db      0d8h, 083h, 0c4h, 002h, 0b8h, 001h, 000h, 050h, 0ffh, 076h, 006h, 09ah, 0fdh, 01bh, 04fh, 0c0h
        db      083h, 0c4h, 004h, 089h, 046h, 0fch, 085h, 0c0h, 074h, 011h, 050h, 09ah, 003h, 000h, 053h, 0deh
        db      083h, 0c4h, 002h, 0a0h, 0dbh, 053h, 098h, 08bh, 0e5h, 05dh, 0cbh, 0feh, 006h, 0cbh, 08ch, 0a0h
        db      018h, 052h, 098h, 050h, 0ffh, 076h, 006h, 09ah, 05bh, 003h, 0c4h, 0dah, 083h, 0c4h, 004h, 089h
        db      046h, 0fch, 085h, 0c0h, 074h, 01fh, 0a0h, 018h, 052h, 098h, 08bh, 0d8h, 08ah, 087h, 02ch, 0aeh
        db      098h, 050h, 09ah, 008h, 000h, 086h, 0dfh, 083h, 0c4h, 002h, 0ffh, 076h, 0fch, 09ah, 003h, 000h
        db      053h, 0deh, 083h, 0c4h, 002h, 09ah, 055h, 000h, 071h, 0d8h, 0feh, 00eh, 0cbh, 08ch, 0c7h, 046h
        db      0feh, 000h, 000h, 08bh, 046h, 0feh, 0ebh, 0afh, 055h, 08bh, 0ech, 083h, 0c4h, 0fbh, 0b8h, 05dh
        db      017h, 050h, 09ah, 05eh, 01ah, 04fh, 0c0h, 083h, 0c4h, 002h, 0c6h, 006h, 0dch, 053h, 035h, 033h
        db      0c0h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 09ah, 007h
        db      000h, 07dh, 0d7h, 088h, 046h, 0fbh, 0b8h, 00ah, 000h, 050h, 0b8h, 063h, 000h, 050h, 0b8h, 001h
        db      000h, 050h, 0b8h, 002h, 000h, 050h, 08dh, 046h, 0fbh, 050h, 0b8h, 079h, 017h, 050h, 09ah, 0cch
        db      002h, 00ah, 0d9h, 083h, 0c4h, 00ch, 033h, 0c0h, 050h, 0b8h, 006h, 000h, 050h, 09ah, 027h, 000h
        db      080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 028h, 000h, 050h, 0b8h, 03dh, 000h, 050h, 09ah, 094h, 000h
        db      080h, 0d8h, 083h, 0c4h, 004h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 027h, 000h, 080h
        db      0d8h, 083h, 0c4h, 004h, 0b8h, 098h, 017h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h
        db      0b8h, 001h, 000h, 050h, 09ah, 02ah, 000h, 07fh, 0d9h, 083h, 0c4h, 002h, 089h, 046h, 0feh, 085h
        db      0c0h, 075h, 002h, 0ebh, 0ebh, 083h, 07eh, 0feh
        db      "xut3"
        db      0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 0a4h
        db      017h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 0b8h, 002h, 000h, 050h, 0ffh, 076h
        db      006h, 09ah, 0fdh, 01bh, 04fh, 0c0h, 083h, 0c4h, 004h, 089h, 046h, 0fch, 085h, 0c0h, 074h, 011h
        db      050h, 09ah, 003h, 000h, 053h, 0deh, 083h, 0c4h, 002h, 0a0h, 0dbh, 053h, 098h, 08bh, 0e5h, 05dh
        db      0cbh, 0feh, 006h, 0cbh, 08ch, 08ah, 046h, 0fbh, 098h, 050h, 0ffh, 076h, 006h, 09ah, 00ch, 000h
        db      046h, 0dch, 083h, 0c4h, 004h, 089h, 046h, 0fch, 085h, 0c0h, 074h, 009h, 050h, 09ah, 003h, 000h
        db      053h, 0deh, 083h, 0c4h, 002h, 09ah, 055h, 000h, 071h, 0d8h, 0feh, 00eh, 0cbh, 08ch, 0c7h, 046h
        db      0feh, 000h, 000h, 08bh, 046h, 0feh, 0ebh, 0c5h, 055h, 08bh, 0ech, 083h, 0c4h, 0fah, 0c6h, 006h
        db      0dch, 053h, 036h, 0b8h, 0b4h, 017h, 050h, 09ah, 05eh, 01ah, 04fh, 0c0h, 083h, 0c4h, 002h, 033h
        db      0c0h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 0d3h
        db      017h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 006h, 000h
        db      050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 028h, 000h, 050h, 0b8h, 03dh, 000h
        db      050h, 09ah, 094h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h
        db      09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 010h, 018h, 050h, 09ah, 05ch, 000h, 080h
        db      0d8h, 083h, 0c4h, 002h, 0b8h, 001h, 000h, 050h, 09ah, 02ah, 000h, 07fh, 0d9h, 083h, 0c4h, 002h
        db      089h, 046h, 0feh, 083h, 07eh, 0feh, 078h, 074h, 003h, 0e9h, 09bh, 000h, 033h, 0c0h, 050h, 0b8h
        db      007h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 01ch, 018h, 050h, 09ah
        db      05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 0b8h, 002h, 000h, 050h, 0ffh, 076h, 006h, 09ah, 0fdh
        db      01bh, 04fh, 0c0h, 083h, 0c4h, 004h, 089h, 046h, 0fch, 085h, 0c0h, 074h, 011h, 050h, 09ah, 003h
        db      000h, 053h, 0deh, 083h, 0c4h, 002h, 0a0h, 0dbh, 053h, 098h, 08bh, 0e5h, 05dh, 0cbh, 0feh, 006h
        db      0cbh, 08ch, 0ffh, 076h, 006h, 09ah, 00fh, 000h, 084h, 0dch, 083h, 0c4h, 002h, 089h, 046h, 0fch
        db      085h, 0c0h, 074h, 00bh, 050h, 09ah, 003h, 000h, 053h, 0deh, 083h, 0c4h, 002h, 0ebh, 02ah, 08bh
        db      05eh, 006h, 080h, 07fh, 00bh, 000h, 074h, 005h, 0b8h, 010h, 000h, 0ebh, 003h, 0b8h, 008h, 000h
        db      089h, 046h, 0fah, 050h, 053h, 0b8h, 030h, 08eh, 050h, 09ah, 007h, 000h, 065h, 0f2h, 083h, 0c4h
        db      006h, 08bh, 05eh, 0fah, 0c6h, 087h, 030h, 08eh, 000h, 09ah, 055h, 000h, 071h, 0d8h, 0feh, 00eh
        db      0cbh, 08ch, 0c7h, 046h, 0feh, 000h, 000h, 08bh, 046h, 0feh, 0ebh, 09eh, 055h, 08bh, 0ech, 083h
        db      0c4h, 0fah, 0b8h, 02eh, 018h, 050h, 09ah, 05eh, 01ah, 04fh, 0c0h, 083h, 0c4h, 002h, 0c6h, 006h
        db      0dch, 053h, 039h, 033h, 0c0h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h
        db      0c4h, 004h, 0b8h, 04bh, 018h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 0b8h, 072h
        db      018h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 0b8h, 099h, 018h, 050h, 09ah, 05ch
        db      000h, 080h, 0d8h, 083h, 0c4h, 002h, 0b8h, 0c2h, 018h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h
        db      0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 006h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h
        db      004h, 0b8h, 028h, 000h, 050h, 0b8h, 03dh, 000h, 050h, 09ah, 094h, 000h, 080h, 0d8h, 083h, 0c4h
        db      004h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h
        db      0b8h, 0cbh, 018h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 0b8h, 001h, 000h, 050h
        db      09ah, 02ah, 000h, 07fh, 0d9h, 083h, 0c4h, 002h, 089h, 046h, 0feh, 085h, 0c0h, 075h, 002h, 0ebh
        endif
        if      FW_VERSION >= 212
        db      0ebh, 083h, 07eh, 0feh
        db      "xut3"
        endif
        if      FW_VERSION = 212
        db      0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 0e0h
        db      015h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0feh, 006h, 04bh, 089h, 0ffh, 076h
        db      006h, 09ah, 00bh, 000h, 063h, 0d9h, 083h, 0c4h, 002h, 089h, 046h, 0fch, 085h, 0c0h, 074h, 00bh
        db      050h, 09ah, 00eh, 000h, 001h, 0ddh, 083h, 0c4h, 002h, 0ebh, 02ah, 08bh, 05eh, 006h, 080h, 07fh
        db      00bh, 000h, 074h, 005h, 0b8h, 010h, 000h, 0ebh, 003h, 0b8h, 008h, 000h, 089h, 046h, 0fah, 050h
        db      053h, 0b8h, 02fh, 08ah, 050h, 09ah, 006h, 000h, 0f9h, 0f0h, 083h, 0c4h, 006h, 08bh, 05eh, 0fah
        db      0c6h, 087h, 02fh, 08ah, 000h, 09ah, 054h, 000h, 022h, 0d7h, 0feh, 00eh, 04bh, 089h, 0c7h, 046h
        db      0feh, 000h, 000h, 08bh, 046h, 0feh, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0e8h
        db      0b8h, 0f0h, 015h, 050h, 09ah, 010h, 014h, 04ah, 0c0h, 083h, 0c4h, 002h, 0c6h, 006h, 05ch, 050h
        db      037h, 033h, 0c0h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h
        db      0b8h, 0fdh, 015h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 08dh, 046h, 0e8h, 050h
        db      0ffh, 076h, 006h, 09ah, 052h, 013h, 04ah, 0c0h, 083h, 0c4h, 004h, 08dh, 046h, 0e8h, 050h, 09ah
        db      05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 00eh, 016h, 050h, 09ah, 05bh, 000h, 031h, 0d7h
        db      083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 006h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h
        db      0c4h, 004h, 0b8h, 028h, 000h, 050h, 0b8h, 03dh, 000h, 050h, 09ah, 093h, 000h, 031h, 0d7h, 083h
        db      0c4h, 004h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h
        db      004h, 0b8h, 011h, 016h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 001h, 000h
        db      050h, 09ah, 028h, 000h, 030h, 0d8h, 083h, 0c4h, 002h, 089h, 046h, 0feh, 085h, 0c0h, 075h, 002h
        endif
        if      FW_VERSION >= 214
        db      0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 0d7h
        db      018h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 0feh, 006h, 0cbh, 08ch, 0ffh, 076h
        db      006h, 09ah, 00dh, 000h, 0b2h, 0dah, 083h, 0c4h, 002h, 089h, 046h, 0fch, 085h, 0c0h, 074h, 00bh
        db      050h, 09ah, 003h, 000h, 053h, 0deh, 083h, 0c4h, 002h, 0ebh, 02ah, 08bh, 05eh, 006h, 080h, 07fh
        db      00bh, 000h, 074h, 005h, 0b8h, 010h, 000h, 0ebh, 003h, 0b8h, 008h, 000h, 089h, 046h, 0fah, 050h
        db      053h, 0b8h, 041h, 08eh, 050h, 09ah, 007h, 000h, 065h, 0f2h, 083h, 0c4h, 006h, 08bh, 05eh, 0fah
        db      0c6h, 087h, 041h, 08eh, 000h, 09ah, 055h, 000h, 071h, 0d8h, 0feh, 00eh, 0cbh, 08ch, 0c7h, 046h
        db      0feh, 000h, 000h, 08bh, 046h, 0feh, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0e8h
        db      0b8h, 0e7h, 018h, 050h, 09ah, 05eh, 01ah, 04fh, 0c0h, 083h, 0c4h, 002h, 0c6h, 006h, 0dch, 053h
        db      037h, 033h, 0c0h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h
        db      0b8h, 0f4h, 018h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 08dh, 046h, 0e8h, 050h
        db      0ffh, 076h, 006h, 09ah, 07ch, 019h, 04fh, 0c0h, 083h, 0c4h, 004h, 08dh, 046h, 0e8h, 050h, 09ah
        db      05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 0b8h, 005h, 019h, 050h, 09ah, 05ch, 000h, 080h, 0d8h
        db      083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 006h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h
        db      0c4h, 004h, 0b8h, 028h, 000h, 050h, 0b8h, 03dh, 000h, 050h, 09ah, 094h, 000h, 080h, 0d8h, 083h
        db      0c4h, 004h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h
        db      004h, 0b8h, 008h, 019h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 0b8h, 001h, 000h
        db      050h, 09ah, 02ah, 000h, 07fh, 0d9h, 083h, 0c4h, 002h, 089h, 046h, 0feh, 085h, 0c0h, 075h, 002h
        endif
        if      FW_VERSION >= 212
        db      0ebh, 0ebh, 083h, 07eh, 0feh
        db      "xuE3"
        endif
        if      FW_VERSION = 212
        db      0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 01ch
        db      016h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 09ah, 005h, 000h
        db      0efh, 0d6h, 083h, 0c4h, 002h, 0ffh, 076h, 006h, 0b8h, 006h, 000h, 050h, 09ah, 005h, 000h, 0efh
        db      0d6h, 083h, 0c4h, 004h, 050h, 09ah, 00eh, 000h, 001h, 0ddh, 083h, 0c4h, 002h, 0a0h, 05bh, 050h
        db      098h, 089h, 046h, 0feh, 08bh, 046h, 0feh, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h
        db      0ceh, 057h, 056h, 0b8h, 02dh, 016h, 050h, 09ah, 010h, 014h, 04ah, 0c0h, 083h, 0c4h, 002h, 0c6h
        db      006h, 05ch, 050h, 038h, 033h, 0c0h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h
        db      083h, 0c4h, 004h, 0b8h, 03bh, 016h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 08dh
        db      046h, 0ceh, 050h, 0ffh, 076h, 006h, 09ah, 052h, 013h, 04ah, 0c0h, 083h, 0c4h, 004h, 08dh, 046h
        db      0ceh, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0ffh, 076h, 006h, 08dh, 046h, 0e4h
        db      050h, 09ah, 009h, 000h, 0f7h, 0f0h, 083h, 0c4h, 004h, 08bh, 05eh, 006h, 080h, 07fh, 00bh, 000h
        db      074h, 005h, 0b8h, 010h, 000h, 0ebh, 003h, 0b8h, 008h, 000h, 089h, 046h, 0f8h, 08bh, 0f0h, 0c6h
        db      042h, 0e4h, 000h, 033h, 0c0h, 050h, 0b8h, 004h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h
        db      0c4h, 004h, 0b8h, 008h, 000h, 080h, 03eh, 05ah, 050h, 000h, 074h, 003h, 0b8h, 010h, 000h, 050h
        db      08dh, 046h, 0e4h, 050h, 0b8h, 04dh, 016h, 050h, 09ah, 004h, 000h, 0bbh, 0d7h, 083h, 0c4h, 006h
        db      033h, 0c0h, 050h, 0b8h, 006h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h
        db      028h, 000h, 050h, 0b8h, 03dh, 000h, 050h, 09ah, 093h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 033h
        db      0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 05fh
        db      016h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 001h, 000h, 050h, 09ah, 028h
        db      000h, 030h, 0d8h, 083h, 0c4h, 002h, 089h, 046h, 0feh, 085h, 0c0h, 075h, 038h, 0c7h, 046h, 0fch
        db      000h, 000h, 0ebh, 003h, 0ffh, 046h, 0fch, 08bh, 076h, 0fch, 08ah, 042h, 0e4h, 098h, 050h, 09ah
        db      00eh, 000h, 0fbh, 0f0h, 083h, 0c4h, 002h, 08bh, 076h, 0fch, 088h, 042h, 0e4h, 084h, 0c0h, 075h
        db      0e3h, 08bh, 076h, 0fch, 0c6h, 042h, 0e4h, 000h, 033h, 0c0h, 050h, 09ah, 05dh, 009h, 030h, 0d8h
        db      083h, 0c4h, 002h, 0ebh, 0b5h, 083h, 07eh, 0feh, 078h, 074h, 003h, 0e9h, 096h, 000h, 033h, 0c0h
        db      050h, 0b8h, 007h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 06bh, 016h
        db      050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 08dh, 046h, 0e4h, 050h, 09ah, 006h, 000h
        db      00dh, 0f1h, 083h, 0c4h, 002h, 0b9h, 008h, 000h, 03bh, 0c1h, 07eh, 005h, 0b8h, 010h, 000h, 0ebh
        db      003h, 0b8h, 008h, 000h, 089h, 046h, 0fah, 050h, 08dh, 046h, 0e4h, 050h, 09ah, 0cbh, 008h, 030h
        db      0d8h, 083h, 0c4h, 004h, 0c7h, 046h, 0fch, 000h, 000h, 08bh, 076h, 006h, 003h, 076h, 0fch, 08bh
        db      05eh, 0f8h, 08ah, 000h, 08bh, 07eh, 0fch, 003h, 07eh, 0fah, 088h, 043h, 0e4h, 0ffh, 046h, 0fch
        db      083h, 07eh, 0fch, 004h, 07ch, 0e3h, 033h, 0c0h, 050h, 09ah, 005h, 000h, 0efh, 0d6h, 083h, 0c4h
        db      002h, 08dh, 046h, 0e4h, 050h, 0ffh, 076h, 006h, 0b8h, 007h, 000h, 050h, 09ah, 005h, 000h, 0efh
        db      0d6h, 083h, 0c4h, 006h, 050h, 09ah, 00eh, 000h, 001h, 0ddh, 083h, 0c4h, 002h, 0a0h, 05bh, 050h
        db      098h, 089h, 046h, 0feh, 08bh, 046h, 0feh, 05eh, 05fh, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech
        db      083h, 0c4h, 0fch, 0b8h, 07dh, 016h, 050h, 09ah, 010h, 014h, 04ah, 0c0h, 083h, 0c4h, 002h, 033h
        db      0c0h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 089h
        db      016h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 006h, 000h
        db      050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 028h, 000h, 050h, 0b8h, 03dh, 000h
        db      050h, 09ah, 093h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h
        db      09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 0ach, 016h, 050h, 09ah, 05bh, 000h, 031h
        db      0d7h, 083h, 0c4h, 002h, 0b8h, 001h, 000h, 050h, 09ah, 028h, 000h, 030h, 0d8h, 083h, 0c4h, 002h
        db      089h, 046h, 0feh, 083h, 07eh, 0feh, 078h, 074h, 003h, 0e9h, 079h, 000h, 033h, 0c0h, 050h, 0b8h
        db      007h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 0b8h, 016h, 050h, 09ah
        db      05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 09ah, 005h, 000h, 0efh, 0d6h, 083h
        db      0c4h, 002h, 0b8h, 005h, 000h, 050h, 033h, 0c0h, 050h, 0b8h, 00bh, 000h, 050h, 09ah, 005h, 000h
        db      0efh, 0d6h, 083h, 0c4h, 006h, 089h, 046h, 0fch, 085h, 0c0h, 074h, 032h, 081h, 07eh, 0fch, 002h
        db      0ffh, 074h, 00eh, 081h, 07eh, 0fch, 004h, 0ffh, 074h, 007h, 081h, 07eh, 0fch, 010h, 0ffh, 075h
        db      012h, 050h, 0b8h, 01ah, 000h, 050h, 033h, 0c0h, 050h, 09ah, 03dh, 001h, 001h, 0ddh, 083h, 0c4h
        db      006h, 0ebh, 00bh, 0ffh, 076h, 0fch, 09ah, 00eh, 000h, 001h, 0ddh, 083h, 0c4h, 002h, 0a0h, 05bh
        db      050h, 098h, 089h, 046h, 0feh, 08bh, 046h, 0feh, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h
        db      0c4h, 0d3h, 0c7h, 046h, 0feh, 000h, 000h, 083h, 07eh, 0feh, 000h, 074h, 003h, 0e9h, 016h, 003h
        db      0b8h, 0c6h, 016h, 050h, 09ah, 010h, 014h, 04ah, 0c0h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h
        db      001h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 0d2h, 016h, 050h, 09ah
        db      05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 026h
        db      000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 0fbh, 016h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h
        db      0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 006h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h
        db      004h, 0b8h, 028h, 000h, 050h, 0b8h, 03dh, 000h, 050h, 09ah, 093h, 000h, 031h, 0d7h, 083h, 0c4h
        db      004h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h
        db      0b8h, 022h, 017h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 001h, 000h, 050h
        db      09ah, 028h, 000h, 030h, 0d8h, 083h, 0c4h, 002h, 089h, 046h, 0feh, 083h, 07eh, 0feh, 078h, 074h
        db      003h, 0e9h, 07fh, 002h, 0ffh, 036h, 08ch, 097h, 0ffh, 036h, 08ah, 097h, 0ffh, 036h, 088h, 097h
        db      0ffh, 036h, 086h, 097h, 09ah, 050h, 000h, 04ch, 0d9h, 083h, 0c4h, 008h, 089h, 056h, 0f0h, 089h
        db      046h, 0eeh, 0bbh, 000h, 000h, 0b9h, 000h, 002h, 09ah, 006h, 000h, 0feh, 0f0h, 089h, 046h, 0fah
        db      033h, 0c0h, 0c7h, 046h, 0f6h, 000h, 000h, 0a2h, 094h, 051h, 0ffh, 036h, 08ch, 097h, 0ffh, 036h
        db      08ah, 097h, 09ah, 0a2h, 000h, 04ch, 0d9h, 083h, 0c4h, 004h, 089h, 056h, 0f4h, 089h, 046h, 0f2h
        db      0b8h, 050h, 000h, 0c7h, 046h, 0f8h, 050h, 000h, 0a2h, 092h, 051h, 083h, 07eh, 0f8h, 000h, 075h
        db      003h, 0e9h, 01ah, 002h, 0b8h, 031h, 017h, 050h, 09ah, 010h, 014h, 04ah, 0c0h, 083h, 0c4h, 002h
        db      033h, 0c0h, 050h, 0b8h, 001h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h
        db      03dh, 017h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 002h
        db      000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 061h, 017h, 050h, 09ah, 05bh
        db      000h, 031h, 0d7h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 026h, 000h
        db      031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 071h, 017h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h
        db      002h, 0c6h, 006h, 05ch, 050h, 051h, 09ah, 008h, 000h, 022h, 0d7h, 0b8h, 001h, 000h, 050h, 09ah
        db      028h, 000h, 030h, 0d8h, 083h, 0c4h, 002h, 089h, 046h, 0feh, 083h, 07eh, 0feh, 078h, 074h, 003h
        db      0e9h, 09bh, 001h, 0c7h, 046h, 0feh, 000h, 000h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah
        db      026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 07bh, 017h, 050h, 09ah, 05bh, 000h, 031h, 0d7h
        db      083h, 0c4h, 002h, 033h, 0c0h, 050h, 09ah, 005h, 000h, 0efh, 0d6h, 083h, 0c4h, 002h, 08dh, 046h
        db      0d3h, 050h, 0b8h, 095h, 00fh, 050h, 0b8h, 009h, 000h, 050h, 09ah, 005h, 000h, 0efh, 0d6h, 083h
        db      0c4h, 006h, 089h, 046h, 0fch, 08bh, 046h, 0fch, 025h, 000h, 0ffh, 0b9h, 000h, 0ffh, 03bh, 0c1h
        db      075h, 00eh, 0ffh, 076h, 0fch, 09ah, 00eh, 000h, 001h, 0ddh, 083h, 0c4h, 002h, 0e9h, 03eh, 001h
        db      0ffh, 076h, 0f6h, 0ffh, 076h, 0fah, 0ffh, 076h, 0f4h, 0ffh, 076h, 0f2h, 09ah, 00bh, 000h, 0fch
        db      0d6h, 083h, 0c4h, 008h, 089h, 046h, 0fch, 085h, 0c0h, 074h, 00ch, 050h, 09ah, 00eh, 000h, 001h
        db      0ddh, 083h, 0c4h, 002h, 0e9h, 017h, 001h, 033h, 0c0h, 050h, 0b8h, 001h, 000h, 050h, 09ah, 026h
        db      000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 09fh, 017h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h
        db      0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h
        db      004h, 0b8h, 028h, 000h, 050h, 09ah, 001h, 000h, 03ch, 0d7h, 083h, 0c4h, 002h, 033h, 0c0h, 050h
        db      0b8h, 007h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 0c5h, 017h, 050h
        db      09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0c6h, 006h, 05ch, 050h, 052h, 09ah, 008h, 000h
        db      022h, 0d7h, 0b8h, 001h, 000h, 050h, 09ah, 028h, 000h, 030h, 0d8h, 083h, 0c4h, 002h, 089h, 046h
        db      0feh, 083h, 07eh, 0feh, 078h, 074h, 003h, 0e9h, 0a4h, 000h, 0c7h, 046h, 0feh, 000h, 000h, 033h
        db      0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 0cfh
        db      017h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 09ah, 005h, 000h
        db      0efh, 0d6h, 083h, 0c4h, 002h, 08dh, 046h, 0d3h, 050h, 0b8h, 095h, 00fh, 050h, 0b8h, 009h, 000h
        db      050h, 09ah, 005h, 000h, 0efh, 0d6h, 083h, 0c4h, 006h, 089h, 046h, 0fch, 08bh, 046h, 0fch, 025h
        db      000h, 0ffh, 0b9h, 000h, 0ffh, 03bh, 0c1h, 075h, 00dh, 0ffh, 076h, 0fch, 09ah, 00eh, 000h, 001h
        db      0ddh, 083h, 0c4h, 002h, 0ebh, 048h, 0ffh, 076h, 0f6h, 0ffh, 076h, 0f4h, 0ffh, 076h, 0f2h, 09ah
        db      007h, 000h, 00ah, 0d7h, 083h, 0c4h, 006h, 089h, 046h, 0fch, 085h, 0c0h, 074h, 00bh, 050h, 09ah
        db      00eh, 000h, 001h, 0ddh, 083h, 0c4h, 002h, 0ebh, 025h, 0a0h, 094h, 051h, 02ah, 0e4h, 089h, 046h
        db      0f6h, 0a0h, 092h, 051h, 02ah, 0e4h, 029h, 046h, 0f8h, 0a0h, 092h, 051h, 02ah, 0e4h, 08bh, 04eh
        db      0f8h, 03bh, 0c8h, 073h, 006h, 08bh, 046h, 0f8h, 0a2h, 092h, 051h, 0e9h, 0ddh, 0fdh, 09ah, 003h
        db      000h, 0eeh, 0d3h, 0e9h, 0e1h, 0fch, 08bh, 046h, 0feh, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech
        db      083h, 0c4h, 0f8h, 057h, 056h, 0b8h, 02eh, 000h, 050h, 0ffh, 076h, 006h, 09ah, 006h, 000h, 0e9h
        db      0f0h, 083h, 0c4h, 004h, 089h, 046h, 0fch, 085h, 0c0h, 074h, 008h, 02bh, 046h, 006h, 089h, 046h
        db      0fah, 0ebh, 00eh, 0ffh, 076h, 006h, 09ah, 006h, 000h, 00dh, 0f1h, 083h, 0c4h, 002h, 089h, 046h
        db      0fah, 0b8h, 008h, 000h, 083h, 07eh, 0fah, 008h, 07eh, 003h, 0b8h, 010h, 000h, 089h, 046h, 0f8h
        db      0c6h, 046h, 0feh, 000h, 0c6h, 046h, 0ffh, 000h, 0ebh, 04fh, 08ah, 046h, 0feh, 098h, 08bh, 0f0h
        db      08bh, 05eh, 006h, 080h, 038h, 000h, 074h, 00bh, 08ah, 046h, 0feh, 098h, 08bh, 0f8h, 080h, 039h
        db      02eh, 075h, 00eh, 08ah, 046h, 0ffh, 098h, 08bh, 0f8h, 08bh, 05eh, 008h, 0c6h, 001h, 020h, 0ebh
        db      025h, 08ah, 046h, 0feh, 0feh, 046h, 0feh, 098h, 08bh, 0f0h, 08bh, 05eh, 006h, 08ah, 000h, 098h
        db      050h, 09ah, 00eh, 000h, 0fbh, 0f0h, 083h, 0c4h, 002h, 050h, 08ah, 046h, 0ffh, 098h, 08bh, 0f0h
        db      08bh, 05eh, 008h, 058h, 088h, 000h, 0feh, 046h, 0ffh, 08ah, 046h, 0ffh, 098h, 03bh, 046h, 0f8h
        db      07ch, 0a8h, 08ah, 046h, 0feh, 098h, 08bh, 0f0h, 08bh, 05eh, 006h, 080h, 038h, 02eh, 075h, 003h
        db      0feh, 046h, 0feh, 08bh, 046h, 0f8h, 088h, 046h, 0ffh, 0ebh, 041h, 08ah, 046h, 0feh, 098h, 08bh
        db      0f0h, 08bh, 05eh, 006h, 080h, 038h, 000h, 074h, 024h, 08ah, 046h, 0feh, 0feh, 046h, 0feh, 098h
        db      08bh, 0f8h, 08ah, 001h, 098h, 050h, 09ah, 00eh, 000h, 0fbh, 0f0h, 083h, 0c4h, 002h, 050h, 08ah
        db      046h, 0ffh, 098h, 08bh, 0f0h, 08bh, 05eh, 008h, 058h, 088h, 000h, 0ebh, 00ch, 08ah, 046h, 0ffh
        db      098h, 08bh, 0f0h, 08bh, 05eh, 008h, 0c6h, 000h, 020h, 0feh, 046h, 0ffh, 08ah, 046h, 0ffh, 098h
        db      08bh, 04eh, 0f8h, 083h, 0c1h, 003h, 03bh, 0c1h, 07ch, 0b1h, 08bh, 05eh, 008h, 003h, 05eh, 0f8h
        db      0c6h, 047h, 003h, 000h, 05eh, 05fh, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0fch
        db      057h, 056h, 08bh, 05eh, 006h, 080h, 07fh, 00bh, 000h, 074h, 005h, 0b8h, 010h, 000h, 0ebh, 003h
        db      0b8h, 008h, 000h, 089h, 046h, 0fch, 0c6h, 046h, 0feh, 000h, 088h, 046h, 0ffh, 08ah, 046h, 0ffh
        db      0feh, 04eh, 0ffh, 084h, 0c0h, 074h, 03ch, 08ah, 046h, 0ffh, 098h, 08bh, 0f0h, 08bh, 05eh, 006h
        db      080h, 038h, 020h, 074h, 02ch, 08ah, 046h, 0ffh, 0feh, 0c0h, 088h, 046h, 0feh, 08ah, 046h, 0ffh
        db      098h, 08bh, 0f0h, 08bh, 05eh, 006h, 08ah, 000h, 050h, 08ah, 046h, 0ffh, 098h, 08bh, 0f8h, 08bh
        db      05eh, 008h, 058h, 088h, 001h, 08ah, 046h, 0ffh, 0feh, 04eh, 0ffh, 084h, 0c0h, 075h, 0deh, 0ebh
        db      002h, 0ebh, 0bah, 08ah, 046h, 0feh, 0feh, 046h, 0feh, 098h, 08bh, 0f0h, 08bh, 05eh, 008h, 0c6h
        db      000h, 02eh, 08bh, 046h, 0fch, 088h, 046h, 0ffh, 0ebh, 01eh, 08ah, 046h, 0ffh, 098h, 08bh, 0f0h
        db      08bh, 05eh, 006h, 08ah, 000h, 050h, 08ah, 046h, 0feh, 0feh, 046h, 0feh, 098h, 08bh, 0f8h, 08bh
        db      05eh, 008h, 058h, 088h, 001h, 0feh, 046h, 0ffh, 08ah, 046h, 0ffh, 098h, 08bh, 04eh, 0fch, 083h
        db      0c1h, 003h, 03bh, 0c1h, 07ch, 0d4h, 08ah, 046h, 0feh, 098h, 08bh, 0f0h, 08bh, 05eh, 008h, 0c6h
        db      000h, 000h, 05eh, 05fh, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 09ah, 003h, 000h, 030h, 0d8h
        db      09ah, 009h, 000h, 031h, 0d7h, 0ffh, 076h, 006h, 09ah, 00eh, 000h, 023h, 0d9h, 083h, 0c4h, 002h
        db      08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 08bh, 05eh, 008h, 0ffh, 037h, 08bh, 05eh, 006h, 0ffh
        db      037h, 09ah, 002h, 000h, 00ah, 0f1h, 083h, 0c4h, 004h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech
        db      083h, 0c4h, 0d0h, 057h, 056h, 0c7h, 046h, 0d0h, 000h, 000h, 0e9h, 09dh, 000h, 08bh, 076h, 0d0h
        db      0d1h, 0e6h, 08bh, 05eh, 006h, 0ffh, 030h, 08dh, 046h, 0ebh, 050h, 09ah, 009h, 000h, 0f7h, 0f0h
        db      083h, 0c4h, 004h, 0c7h, 046h, 0d4h, 000h, 000h, 08bh, 076h, 0d4h, 080h, 07ah, 0ebh, 000h, 074h
        db      009h, 0ffh, 046h, 0d4h, 083h, 07eh, 0d4h, 015h, 07ch, 0eeh, 083h, 06eh, 0d4h, 003h, 08bh, 076h
        db      0d4h, 0ffh, 046h, 0d4h, 08ah, 042h, 0ebh, 088h, 046h, 0d6h, 08bh, 07eh, 0d4h, 0ffh, 046h, 0d4h
        db      08ah, 043h, 0ebh, 088h, 046h, 0d7h, 08bh, 076h, 0d4h, 08ah, 042h, 0ebh, 088h, 046h, 0d8h, 0c6h
        db      046h, 0d9h, 02eh, 0c7h, 046h, 0d4h, 000h, 000h, 0c7h, 046h, 0d2h, 004h, 000h, 08bh, 076h, 0d4h
        db      080h, 07ah, 0ebh, 02eh, 074h, 014h, 08bh, 07eh, 0d4h, 0ffh, 046h, 0d4h, 08ah, 043h, 0ebh, 08bh
        db      076h, 0d2h, 0ffh, 046h, 0d2h, 088h, 042h, 0d6h, 0ebh, 0e3h, 08bh, 076h, 0d2h, 0c6h, 042h, 0d6h
        db      000h, 08dh, 046h, 0d6h, 050h, 08bh, 076h, 0d0h, 0d1h, 0e6h, 08bh, 05eh, 006h, 0ffh, 030h, 09ah
        db      009h, 000h, 0f7h, 0f0h, 083h, 0c4h, 004h, 0ffh, 046h, 0d0h, 08bh, 046h, 0d0h, 03bh, 046h, 008h
        db      07dh, 003h, 0e9h, 058h, 0ffh, 05eh, 05fh, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h
        db      0d0h, 057h, 056h, 0c7h, 046h, 0d0h, 000h, 000h, 0e9h, 08bh, 000h, 08bh, 076h, 0d0h, 0d1h, 0e6h
        db      08bh, 05eh, 006h, 0ffh, 030h, 08dh, 046h, 0ebh, 050h, 09ah, 009h, 000h, 0f7h, 0f0h, 083h, 0c4h
        db      004h, 0c7h, 046h, 0d4h, 004h, 000h, 0c7h, 046h, 0d2h, 000h, 000h, 08bh, 076h, 0d4h, 080h, 07ah
        db      0ebh, 000h, 074h, 014h, 08bh, 07eh, 0d4h, 0ffh, 046h, 0d4h, 08ah, 043h, 0ebh, 08bh, 076h, 0d2h
        db      0ffh, 046h, 0d2h, 088h, 042h, 0d6h, 0ebh, 0e3h, 08bh, 076h, 0d2h, 0ffh, 046h, 0d2h, 0c6h, 042h
        db      0d6h, 02eh, 08bh, 076h, 0d2h, 0ffh, 046h, 0d2h, 08ah, 046h, 0ebh, 088h, 042h, 0d6h, 08bh, 076h
        db      0d2h, 0ffh, 046h, 0d2h, 08ah, 046h, 0ech, 088h, 042h, 0d6h, 08bh, 076h, 0d2h, 0ffh, 046h, 0d2h
        db      08ah, 046h, 0edh, 088h, 042h, 0d6h, 08bh, 076h, 0d2h, 0c6h, 042h, 0d6h, 000h, 08dh, 046h, 0d6h
        db      050h, 08bh, 076h, 0d0h, 0d1h, 0e6h, 08bh, 05eh, 006h, 0ffh, 030h, 09ah, 009h, 000h, 0f7h, 0f0h
        db      083h, 0c4h, 004h, 0ffh, 046h, 0d0h, 08bh, 046h, 0d0h, 03bh, 046h, 008h, 07dh, 003h, 0e9h, 06ah
        db      0ffh, 05eh, 05fh, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0f8h, 033h, 0c0h, 050h
        db      09ah, 005h, 000h, 0efh, 0d6h, 083h, 0c4h, 002h, 0ffh, 076h, 006h, 0b8h, 002h, 000h, 050h, 09ah
        db      005h, 000h, 0efh, 0d6h, 083h, 0c4h, 004h, 089h, 046h, 0feh, 033h, 0c9h, 03bh, 0c1h, 07dh, 004h
        db      08bh, 0e5h, 05dh, 0cbh, 0b8h, 002h, 000h, 050h, 0ffh, 076h, 0feh, 0b8h, 053h, 08ah, 050h, 0b8h
        db      004h, 000h, 050h, 09ah, 005h, 000h, 0efh, 0d6h, 083h, 0c4h, 008h, 089h, 046h, 0fch, 085h, 0c0h
        db      074h, 002h, 0ebh, 0dch, 0a0h, 054h, 08ah, 02ah, 0e4h, 089h, 046h, 0fah, 03bh, 046h, 008h, 07fh
        db      007h, 0c7h, 046h, 0fch, 000h, 000h, 0ebh, 005h, 0c7h, 046h, 0fch, 0f7h, 0ffh, 0ffh, 076h, 0feh
        db      033h, 0c0h, 050h, 0b8h, 003h, 000h, 050h, 09ah, 005h, 000h, 0efh, 0d6h, 083h, 0c4h, 006h, 089h
        db      046h, 0f8h, 085h, 0c0h, 074h, 002h, 0ebh, 0a8h, 08bh, 046h, 0fch, 0ebh, 0a3h, 055h, 08bh, 0ech
        db      083h, 0c4h, 0e2h, 09ah, 076h, 012h, 0adh, 0c1h, 089h, 046h, 0f4h, 09ah, 021h, 012h, 0adh, 0c1h
        db      0a0h, 05bh, 050h, 0a2h, 077h, 051h, 033h, 0c0h, 050h, 0b8h, 063h, 000h, 050h, 0b8h, 001h, 000h
        db      050h, 0b8h, 002h, 000h, 050h, 08dh, 046h, 0f4h, 050h, 0b8h, 009h, 018h, 050h, 09ah, 0cah, 002h
        db      0bbh, 0d7h, 083h, 0c4h, 00ch, 0b8h, 010h, 000h, 050h, 0b8h, 00ah, 0aeh, 050h, 0b8h, 00fh, 018h
        db      050h, 09ah, 004h, 000h, 0bbh, 0d7h, 083h, 0c4h, 006h, 0a0h, 09fh, 048h, 098h, 040h, 050h, 0a0h
        db      09eh, 048h, 098h, 08bh, 0c8h, 058h, 0f7h, 0e9h, 089h, 046h, 0fah, 0a0h, 09fh, 048h, 098h, 050h
        db      0a0h, 09eh, 048h, 098h, 050h, 0ffh, 036h, 0e1h, 04fh, 09ah, 03ah, 001h, 0c8h, 0d2h, 083h, 0c4h
        db      006h, 0a3h, 0dfh, 04fh, 0b8h, 004h, 000h, 050h, 08bh, 05eh, 0fah, 0d1h, 0e3h, 0ffh, 0b7h, 0a8h
        db      00bh, 0ffh, 0b7h, 09eh, 00bh, 0b8h, 005h, 000h, 050h, 0b8h, 0dfh, 04fh, 050h, 0b8h, 011h, 018h
        db      050h, 09ah, 0cah, 002h, 0bbh, 0d7h, 083h, 0c4h, 00ch, 0b8h, 003h, 000h, 050h, 0b8h, 06ah, 00bh
        db      050h, 0b8h, 09eh, 048h, 050h, 0b8h, 018h, 018h, 050h, 09ah, 0cbh, 000h, 0bbh, 0d7h, 083h, 0c4h
        db      008h, 033h, 0c0h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h
        db      0b8h, 005h, 000h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 05ch, 006h, 0bbh, 0d7h, 083h, 0c4h, 004h
        db      0a0h, 09bh, 090h, 024h, 001h, 0a2h, 02dh, 0aeh, 0a1h, 0cch, 090h, 0a3h, 02eh, 0aeh, 0b8h, 006h
        db      000h, 050h, 0b8h, 0f8h, 017h, 050h, 0b8h, 02dh, 0aeh, 050h, 0b8h, 01ah, 018h, 050h, 09ah, 0cbh
        db      000h, 0bbh, 0d7h, 083h, 0c4h, 008h, 033h, 0c0h, 050h, 0b8h, 0e7h, 003h, 050h, 0b8h, 001h, 000h
        db      050h, 0b8h, 003h, 000h, 050h, 0b8h, 02eh, 0aeh, 050h, 0b8h, 039h, 018h, 050h, 09ah, 0cah, 002h
        db      0bbh, 0d7h, 083h, 0c4h, 00ch, 033h, 0c0h, 050h, 0b8h, 003h, 000h, 050h, 09ah, 026h, 000h, 031h
        db      0d7h, 083h, 0c4h, 004h, 0b8h, 03ah, 018h, 050h, 09ah, 00eh, 000h, 023h, 0d9h, 083h, 0c4h, 002h
        db      033h, 0c0h, 050h, 0b8h, 004h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0a0h
        db      040h, 09ch, 088h, 046h, 0e2h, 0b8h, 008h, 000h, 050h, 0b8h, 063h, 000h, 050h, 0b8h, 001h, 000h
        db      050h, 0b8h, 002h, 000h, 050h, 08dh, 046h, 0e2h, 050h, 0b8h, 045h, 018h, 050h, 09ah, 0cah, 002h
        db      0bbh, 0d7h, 083h, 0c4h, 00ch, 0b8h, 010h, 000h, 050h, 0b8h, 040h, 08ah, 050h, 0b8h, 04bh, 018h
        db      050h, 09ah, 004h, 000h, 0bbh, 0d7h, 083h, 0c4h, 006h, 0b8h, 008h, 000h, 050h, 0b8h, 010h, 000h
        db      050h, 0b8h, 001h, 000h, 050h, 0b8h, 002h, 000h, 050h, 0b8h, 030h, 0aeh, 050h, 0b8h, 04dh, 018h
        db      050h, 09ah, 0cah, 002h, 0bbh, 0d7h, 083h, 0c4h, 00ch, 0b8h, 001h, 000h, 050h, 0b8h, 0b2h, 00bh
        db      050h, 0b8h, 032h, 0aeh, 050h, 0b8h, 052h, 018h, 050h, 09ah, 0cbh, 000h, 0bbh, 0d7h, 083h, 0c4h
        db      008h, 0b8h, 01bh, 0aeh, 050h, 0a0h, 030h, 0aeh, 098h, 050h, 0a0h, 032h, 0aeh, 098h, 050h, 09ah
        db      067h, 011h, 0adh, 0c1h, 083h, 0c4h, 006h, 0b8h, 008h, 000h, 050h, 0b8h, 01bh, 0aeh, 050h, 0b8h
        db      053h, 018h, 050h, 09ah, 004h, 000h, 0bbh, 0d7h, 083h, 0c4h, 006h, 033h, 0c0h, 050h, 0b8h, 005h
        db      000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 033h, 0c0h, 050h, 0b8h, 0c8h, 000h
        db      050h, 0b8h, 001h, 000h, 050h, 0b8h, 003h, 000h, 050h, 0b8h, 038h, 0aeh, 050h, 0b8h, 055h, 018h
        db      050h, 09ah, 0cah, 002h, 0bbh, 0d7h, 083h, 0c4h, 00ch, 033h, 0c0h, 050h, 0b8h, 080h, 000h, 050h
        db      033h, 0c0h, 050h, 0b8h, 003h, 000h, 050h, 0b8h, 03ah, 0aeh, 050h, 0b8h, 05bh, 018h, 050h, 09ah
        db      0cah, 002h, 0bbh, 0d7h, 083h, 0c4h, 00ch, 0b8h, 008h, 000h, 050h, 0b8h, 010h, 000h, 050h, 033h
        db      0c0h, 050h, 0b8h, 002h, 000h, 050h, 0b8h, 031h, 0aeh, 050h, 0b8h, 066h, 018h, 050h, 09ah, 0cah
        db      002h, 0bbh, 0d7h, 083h, 0c4h, 00ch, 0b8h, 001h, 000h, 050h, 0b8h, 0b2h, 00bh, 050h, 0b8h, 033h
        db      0aeh, 050h, 0b8h, 06eh, 018h, 050h, 09ah, 0cbh, 000h, 0bbh, 0d7h, 083h, 0c4h, 008h, 0b8h, 024h
        db      0aeh, 050h, 0a0h, 031h, 0aeh, 098h, 050h, 0a0h, 033h, 0aeh, 098h, 050h, 09ah, 067h, 011h, 0adh
        db      0c1h, 083h, 0c4h, 006h, 0b8h, 008h, 000h, 050h, 0b8h, 024h, 0aeh, 050h, 0b8h, 06fh, 018h, 050h
        db      09ah, 004h, 000h, 0bbh, 0d7h, 083h, 0c4h, 006h, 09ah, 019h, 00eh, 0adh, 0c1h, 0b8h, 071h, 018h
        db      050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 09ah, 06bh, 010h, 0adh, 0c1h, 09ah, 0a5h
        db      010h, 0adh, 0c1h, 09ah, 0ddh, 010h, 0adh, 0c1h, 09ah, 015h, 011h, 0adh, 0c1h, 09ah, 097h, 000h
        db      012h, 0d7h, 0a0h, 09ah, 090h, 098h, 089h, 046h, 0f6h, 0c7h, 046h, 0fch, 000h, 000h, 083h, 07eh
        db      0fch, 000h, 074h, 003h, 0e9h, 0e3h, 00ah, 0a0h, 09ah, 090h, 098h, 03bh, 046h, 0f6h, 074h, 01fh
        db      080h, 03eh, 091h, 07ah, 000h, 075h, 018h, 0b8h, 010h, 094h, 050h, 09ah, 001h, 000h, 095h, 0d4h
        db      083h, 0c4h, 002h, 09ah, 006h, 000h, 000h, 0d4h, 0a0h, 09ah, 090h, 098h, 089h, 046h, 0f6h, 0b8h
        db      004h, 000h, 050h, 09ah, 028h, 000h, 030h, 0d8h, 083h, 0c4h, 002h, 089h, 046h, 0feh, 085h, 0c0h
        db      074h, 003h, 0e9h, 0deh, 007h, 0a0h, 011h, 0a2h, 098h, 0e9h, 0c7h, 007h, 080h, 03eh, 053h, 089h
        db      000h, 074h, 02bh, 09ah, 04fh, 000h, 031h, 0d7h, 0b8h, 0d8h, 0ffh, 050h, 09ah, 00eh, 000h, 001h
        db      0ddh, 083h, 0c4h, 002h, 09ah, 055h, 000h, 031h, 0d7h, 0a0h, 054h, 089h, 098h, 089h, 046h, 0f4h
        db      033h, 0c0h, 050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 0e9h, 0a2h, 007h, 080h, 03eh
        db      090h, 07ah, 000h, 075h, 003h, 0e9h, 075h, 000h, 0a0h, 028h, 099h, 098h, 03bh, 046h, 0f4h, 075h
        db      007h, 0c6h, 006h, 029h, 099h, 000h, 0ebh, 046h, 080h, 03eh, 09ah, 090h, 001h, 075h, 03fh, 0ffh
        db      076h, 0f4h, 09ah, 004h, 000h, 039h, 0d5h, 083h, 0c4h, 002h, 085h, 0c0h, 075h, 030h, 0c6h, 006h
        db      029h, 099h, 000h, 0b8h, 004h, 000h, 050h, 09ah, 0c8h, 000h, 04ch, 0d9h, 050h, 0b8h, 0d5h, 07ah
        db      050h, 08bh, 016h, 090h, 097h, 0a1h, 08eh, 097h, 005h, 01ch, 000h, 083h, 0d2h, 000h, 052h, 050h
        db      09ah, 001h, 000h, 04ah, 0d9h, 083h, 0c4h, 00ah, 08bh, 046h, 0f4h, 0a2h, 029h, 099h, 0a0h, 028h
        db      099h, 098h, 089h, 046h, 0f4h, 033h, 0c0h, 050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h
        db      09ah, 021h, 012h, 0adh, 0c1h, 0c6h, 006h, 087h, 051h, 000h, 0e9h, 023h, 007h, 080h, 03eh, 049h
        db      089h, 000h, 074h, 009h, 09ah, 004h, 000h, 08dh, 0d5h, 0feh, 00eh, 04bh, 089h, 0c6h, 006h, 029h
        db      099h, 000h, 0b8h, 001h, 000h, 050h, 0ffh, 076h, 0f4h, 0b8h, 09ah, 090h, 050h, 09ah, 00bh, 000h
        db      0deh, 0d5h, 083h, 0c4h, 006h, 09ah, 006h, 000h, 000h, 0d4h, 0a0h, 040h, 09ch, 088h, 046h, 0e2h
        db      08dh, 046h, 0f4h, 050h, 09ah, 0c4h, 012h, 0adh, 0c1h, 083h, 0c4h, 002h, 09ah, 00bh, 000h, 0c0h
        db      0d6h, 080h, 00eh, 05bh, 089h, 040h, 080h, 00eh, 05ah, 089h, 080h, 0e9h, 0d2h, 006h, 080h, 03eh
        db      09ah, 090h, 000h, 07dh, 052h, 08dh, 046h, 0e3h, 050h, 0b8h, 0ffh, 0ffh, 050h, 033h, 0c0h, 050h
        db      09ah, 001h, 000h, 09dh, 0d5h, 083h, 0c4h, 006h, 08dh, 046h, 0e3h, 050h, 0b8h, 00ah, 0aeh, 050h
        db      09ah, 002h, 000h, 00ah, 0f1h, 083h, 0c4h, 004h, 085h, 0c0h, 074h, 02bh, 0ffh, 076h, 0f4h, 09ah
        db      006h, 000h, 0f3h, 0d4h, 083h, 0c4h, 002h, 08ah, 046h, 0e2h, 0a2h, 040h, 09ch, 098h, 08bh, 0d8h
        db      08ah, 087h, 0dch, 090h, 0a2h, 02ah, 099h, 033h, 0c0h, 050h, 09ah, 008h, 000h, 022h, 0ddh, 083h
        db      0c4h, 002h, 09ah, 00bh, 000h, 0c0h, 0d6h, 0b8h, 00ah, 0aeh, 050h, 0b8h, 0ffh, 0ffh, 050h, 0a0h
        db      028h, 099h, 098h, 050h, 09ah, 005h, 000h, 037h, 0d6h, 083h, 0c4h, 006h, 0b8h, 001h, 000h, 050h
        db      0a0h, 028h, 099h, 098h, 050h, 09ah, 00ah, 000h, 0bch, 0d3h, 083h, 0c4h, 004h, 0e9h, 050h, 006h
        db      080h, 03eh, 09ah, 090h, 000h, 07dh, 03ch, 0ffh, 076h, 0f4h, 09ah, 006h, 000h, 0f3h, 0d4h, 083h
        db      0c4h, 002h, 085h, 0c0h, 075h, 02dh, 0a0h, 028h, 099h, 098h, 050h, 0b8h, 00ah, 0aeh, 050h, 09ah
        db      081h, 001h, 09dh, 0d5h, 083h, 0c4h, 004h, 08ah, 046h, 0e2h, 0a2h, 040h, 09ch, 098h, 08bh, 0d8h
        db      08ah, 087h, 0dch, 090h, 0a2h, 02ah, 099h, 0b8h, 001h, 000h, 050h, 09ah, 05dh, 009h, 030h, 0d8h
        db      083h, 0c4h, 002h, 09ah, 0b9h, 00dh, 0adh, 0c1h, 0e9h, 005h, 006h, 0a0h, 09fh, 048h, 098h, 040h
        db      050h, 0a0h, 09eh, 048h, 098h, 08bh, 0c8h, 058h, 0f7h, 0e9h, 089h, 046h, 0fah, 0d1h, 0e0h, 08bh
        db      0d8h, 0ffh, 0b7h, 0a8h, 00bh, 0ffh, 0b7h, 09eh, 00bh, 0b8h, 002h, 000h, 050h, 09ah, 0beh, 00ah
        db      030h, 0d8h, 083h, 0c4h, 006h, 033h, 0c0h, 050h, 09ah, 008h, 000h, 022h, 0ddh, 083h, 0c4h, 002h
        db      0e9h, 0cdh, 005h, 080h, 03eh, 090h, 07ah, 000h, 074h, 008h, 09ah, 015h, 011h, 0adh, 0c1h, 0e9h
        db      0beh, 005h, 080h, 03eh, 09ah, 090h, 0ffh, 075h, 04bh, 0a0h, 028h, 099h, 098h, 050h, 09ah, 006h
        db      000h, 0f3h, 0d4h, 083h, 0c4h, 002h, 08ah, 046h, 0e2h, 0a2h, 040h, 09ch, 098h, 08bh, 0d8h, 08ah
        db      087h, 0dch, 090h, 0a2h, 02ah, 099h, 0a1h, 0cch, 090h, 0a3h, 02eh, 0aeh, 0a0h, 028h, 099h, 098h
        db      050h, 0b8h, 00ah, 0aeh, 050h, 09ah, 081h, 001h, 09dh, 0d5h, 083h, 0c4h, 004h, 0b8h, 001h, 000h
        db      050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 09ah, 008h, 000h, 022h
        db      0ddh, 083h, 0c4h, 002h, 0a0h, 09bh, 090h, 098h, 08bh, 0c8h, 081h, 0e1h, 0feh, 0ffh, 0a0h, 02dh
        db      0aeh, 098h, 00bh, 0c8h, 08bh, 0c1h, 0a2h, 09bh, 090h, 0b8h, 001h, 000h, 050h, 0a0h, 028h, 099h
        db      098h, 050h, 09ah, 00ah, 000h, 0bch, 0d3h, 083h, 0c4h, 004h, 09ah, 015h, 011h, 0adh, 0c1h, 0e9h
        db      03eh, 005h, 080h, 03eh, 090h, 07ah, 000h, 075h, 007h, 080h, 03eh, 02dh, 0aeh, 000h, 075h, 008h
        db      09ah, 015h, 011h, 0adh, 0c1h, 0e9h, 028h, 005h, 080h, 03eh, 09ah, 090h, 0ffh, 075h, 045h, 0a0h
        db      028h, 099h, 098h, 050h, 09ah, 006h, 000h, 0f3h, 0d4h, 083h, 0c4h, 002h, 08ah, 046h, 0e2h, 0a2h
        db      040h, 09ch, 098h, 08bh, 0d8h, 08ah, 087h, 0dch, 090h, 0a2h, 02ah, 099h, 0a0h, 028h, 099h, 098h
        db      050h, 0b8h, 00ah, 0aeh, 050h, 09ah, 081h, 001h, 09dh, 0d5h, 083h, 0c4h, 004h, 0b8h, 001h, 000h
        db      050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 09ah, 008h, 000h, 022h
        db      0ddh, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0a0h, 028h, 099h, 098h, 050h, 0b8h, 09ah, 090h, 050h
        db      09ah, 00bh, 000h, 0deh, 0d5h, 083h, 0c4h, 006h, 0a1h, 02eh, 0aeh, 03bh, 006h, 0cah, 090h, 07eh
        db      00bh, 0a1h, 0cah, 090h, 0a3h, 02eh, 0aeh, 09ah, 015h, 011h, 0adh, 0c1h, 0a1h, 02eh, 0aeh, 0a3h
        db      0cch, 090h, 0f6h, 006h, 09bh, 090h, 002h
        db      "t,P3"
        db      0c0h, 050h, 09ah, 07ah, 000h, 024h, 0d6h, 083h, 0c4h, 004h, 089h, 016h, 0b6h, 090h, 0a3h, 0b4h
        db      090h, 0ffh, 036h, 0cch, 090h, 0b8h, 09ah, 090h, 050h, 09ah, 00bh, 000h, 0e4h, 0d6h, 083h, 0c4h
        db      004h, 089h, 016h, 0bah, 090h, 0a3h, 0b8h, 090h, 0ebh, 00ch, 0b8h, 09ah, 090h, 050h, 09ah, 00ah
        db      000h, 05ah, 0d6h, 083h, 0c4h, 002h, 0c7h, 006h, 02ch, 099h, 000h, 010h, 080h, 03eh, 086h, 09bh
        db      000h, 074h, 055h, 0c7h, 046h, 0f8h, 000h, 000h, 0ebh, 027h, 08bh, 046h, 0f8h, 08bh, 0d0h, 0d1h
        db      0e0h, 003h, 0c2h, 0d1h, 0e0h, 08bh, 0d8h, 08bh, 016h, 0bah, 090h, 0a1h, 0b8h, 090h, 03bh, 097h
        db      030h, 099h, 072h, 008h, 075h, 008h, 03bh, 087h, 02eh, 099h, 073h, 002h, 0ebh, 00fh, 0ffh, 046h
        db      0f8h, 0a0h, 086h, 09bh, 02ah, 0e4h, 08bh, 04eh, 0f8h, 03bh, 0c8h, 072h, 0cdh, 083h, 07eh, 0f8h
        db      000h, 074h, 015h, 08bh, 046h, 0f8h, 048h, 08bh, 0d0h, 0d1h, 0e0h, 003h, 0c2h, 0d1h, 0e0h, 08bh
        db      0d8h, 08bh, 087h, 032h, 099h, 0a3h, 02ch, 099h, 0b8h, 03bh, 050h, 050h, 0ffh, 036h, 0c6h, 090h
        db      0ffh, 036h, 0c4h, 090h, 09ah, 004h, 000h, 07fh, 0d3h, 083h, 0c4h, 006h, 0b8h, 001h, 000h, 050h
        db      0a0h, 028h, 099h, 098h, 050h, 09ah, 00ah, 000h, 0bch, 0d3h, 083h, 0c4h, 004h, 0e9h, 0e5h, 003h
        db      080h, 03eh, 049h, 089h, 000h, 074h, 009h, 09ah, 004h, 000h, 08dh, 0d5h, 0feh, 00eh, 04bh, 089h
        db      08ah, 046h, 0e2h, 0a2h, 040h, 09ch, 098h, 08bh, 0d8h, 080h, 0bfh, 0dch, 090h, 0ffh, 075h, 00ch
        db      0b8h, 09ah, 090h, 050h, 09ah, 001h, 000h, 065h, 0d5h, 083h, 0c4h, 002h, 0a0h, 040h, 09ch, 098h
        db      08bh, 0d8h, 08ah, 087h, 0dch, 090h, 0a2h, 02ah, 099h, 0b8h, 040h, 08ah, 050h, 0a0h, 02ah, 099h
        db      098h, 050h, 0a0h, 028h, 099h, 098h, 050h, 09ah, 001h, 000h, 09dh, 0d5h, 083h, 0c4h, 006h, 0b8h
        db      008h, 000h, 050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 09ah, 06bh, 010h, 0adh, 0c1h
        db      09ah, 0d0h, 00eh, 0adh, 0c1h, 0b8h, 00ch, 000h, 050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h
        db      002h, 0b8h, 00dh, 000h, 050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 09ah, 055h, 00eh
        db      0adh, 0c1h, 09ah, 0bch, 000h, 00dh, 0d6h, 0e9h, 05bh, 003h, 080h, 03eh, 090h, 07ah, 000h, 074h
        db      03bh, 0b8h, 040h, 08ah, 050h, 0a0h, 02ah, 099h, 098h, 050h, 0a0h, 028h, 099h, 098h, 050h, 09ah
        db      005h, 000h, 037h, 0d6h, 083h, 0c4h, 006h, 0b8h, 040h, 08ah, 050h, 0a0h, 02ah, 099h, 098h, 050h
        db      0a0h, 028h, 099h, 098h, 050h, 09ah, 001h, 000h, 09dh, 0d5h, 083h, 0c4h, 006h, 0b8h, 008h, 000h
        db      050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 0e9h, 019h, 003h, 0b8h, 040h, 08ah, 050h
        db      0a0h, 02ah, 099h, 098h, 050h, 0a0h, 028h, 099h, 098h, 050h, 09ah, 00fh, 000h, 0b9h, 0d5h, 083h
        db      0c4h, 006h, 0b8h, 00ah, 0aeh, 050h, 0b8h, 0ffh, 0ffh, 050h, 0a0h, 028h, 099h, 098h, 050h, 09ah
        db      001h, 000h, 09dh, 0d5h, 083h, 0c4h, 006h, 0b8h, 001h, 000h, 050h, 09ah, 05dh, 009h, 030h, 0d8h
        db      083h, 0c4h, 002h, 033h, 0c0h, 050h, 09ah, 008h, 000h, 022h, 0ddh, 083h, 0c4h, 002h, 09ah, 021h
        db      012h, 0adh, 0c1h, 0e9h, 0cfh, 002h, 080h, 03eh, 09ah, 090h, 000h, 07dh, 047h, 0ffh, 076h, 0f4h
        db      09ah, 006h, 000h, 0f3h, 0d4h, 083h, 0c4h, 002h, 085h, 0c0h, 075h, 038h, 0a0h, 028h, 099h, 098h
        db      050h, 0b8h, 00ah, 0aeh, 050h, 09ah, 081h, 001h, 09dh, 0d5h, 083h, 0c4h, 004h, 08ah, 046h, 0e2h
        db      0a2h, 040h, 09ch, 098h, 08bh, 0d8h, 08ah, 087h, 0dch, 090h, 0a2h, 02ah, 099h, 0b8h, 001h, 000h
        db      050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 09ah, 008h, 000h, 022h
        db      0ddh, 083h, 0c4h, 002h, 0a0h, 02ah, 099h, 098h, 08bh, 0d8h, 0f6h, 087h, 040h, 091h, 002h, 075h
        db      045h, 080h, 03eh, 090h, 07ah, 000h, 075h, 03eh, 0a0h, 02ah, 099h, 098h, 08bh, 0d8h, 080h, 08fh
        db      040h, 091h, 002h, 0a0h, 040h, 09ch, 098h, 050h, 0b8h, 040h, 08ah, 050h, 09ah, 033h, 001h, 09dh
        db      0d5h, 083h, 0c4h, 004h, 0b8h, 040h, 08ah, 050h, 0a0h, 02ah, 099h, 098h, 050h, 0a0h, 028h, 099h
        db      098h, 050h, 09ah, 00fh, 000h, 0b9h, 0d5h, 083h, 0c4h, 006h, 0b8h, 008h, 000h, 050h, 09ah, 05dh
        db      009h, 030h, 0d8h, 083h, 0c4h, 002h, 0a0h, 040h, 09ch, 098h, 08bh, 0d8h, 080h, 0bfh, 0dch, 090h
        db      0ffh, 075h, 00ch, 0b8h, 09ah, 090h, 050h, 09ah, 001h, 000h, 065h, 0d5h, 083h, 0c4h, 002h, 0a1h
        db      038h, 0aeh, 050h, 0a0h, 02ah, 099h, 098h, 08bh, 0d8h, 058h, 088h, 087h, 06ch, 092h, 080h, 03eh
        db      011h, 0a2h, 00dh, 075h, 056h, 0ffh, 036h, 03ah, 0aeh, 0a0h, 02ah, 099h, 098h, 050h, 09ah, 005h
        db      000h, 00dh, 0d6h, 083h, 0c4h, 004h, 0b8h, 0ffh, 0ffh, 050h, 0a0h, 02ah, 099h, 098h, 050h, 09ah
        db      005h, 000h, 00dh, 0d6h, 083h, 0c4h, 004h, 0a3h, 03ah, 0aeh, 0b8h, 00dh, 000h, 050h, 09ah, 05dh
        db      009h, 030h, 0d8h, 083h, 0c4h, 002h, 083h, 03eh, 03ah, 0aeh, 000h, 074h, 01eh, 0a0h, 02ah, 099h
        db      098h, 08bh, 0d8h, 0f6h, 087h, 040h, 091h, 001h, 075h, 011h, 0a1h, 03ah, 0aeh, 048h, 0a2h, 00ch
        db      08ah, 080h, 00eh, 05bh, 089h, 010h, 080h, 00eh, 05ah, 089h, 080h, 0b8h, 001h, 000h, 050h, 0a0h
        db      028h, 099h, 098h, 050h, 09ah, 00ah, 000h, 0bch, 0d3h, 083h, 0c4h, 004h, 0e9h, 096h, 001h, 080h
        db      03eh, 090h, 07ah, 000h, 074h, 003h, 0e9h, 0c8h, 000h, 080h, 03eh, 053h, 089h, 000h, 075h, 05ah
        db      033h, 0c0h, 050h, 0ffh, 076h, 0f4h, 0b8h, 09ah, 090h, 050h, 09ah, 00bh, 000h, 0deh, 0d5h, 083h
        db      0c4h, 006h, 0b9h, 0ffh, 0ffh, 03bh, 0c1h, 075h, 035h, 0ffh, 076h, 0f4h, 09ah, 006h, 000h, 0f3h
        db      0d4h, 083h, 0c4h, 002h, 085h, 0c0h, 075h, 026h, 08ah, 046h, 0e2h, 0a2h, 040h, 09ch, 098h, 08bh
        db      0d8h, 08ah, 087h, 0dch, 090h, 0a2h, 02ah, 099h, 0a0h, 028h, 099h, 098h, 050h, 0b8h, 00ah, 0aeh
        db      050h, 09ah, 081h, 001h, 09dh, 0d5h, 083h, 0c4h, 004h, 09ah, 00bh, 000h, 0c0h, 0d6h, 0b8h, 001h
        db      000h, 050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 0a0h, 02ah, 099h, 098h, 08bh, 0d8h
        db      0f6h, 087h, 040h, 091h, 002h, 075h, 03eh, 0a0h, 02ah, 099h, 098h, 08bh, 0d8h, 080h, 08fh, 040h
        db      091h, 002h, 0a0h, 040h, 09ch, 098h, 050h, 0b8h, 040h, 08ah, 050h, 09ah, 033h, 001h, 09dh, 0d5h
        db      083h, 0c4h, 004h, 0b8h, 040h, 08ah, 050h, 0a0h, 02ah, 099h, 098h, 050h, 0a0h, 028h, 099h, 098h
        db      050h, 09ah, 00fh, 000h, 0b9h, 0d5h, 083h, 0c4h, 006h, 0b8h, 008h, 000h, 050h, 09ah, 05dh, 009h
        db      030h, 0d8h, 083h, 0c4h, 002h, 09ah, 021h, 012h, 0adh, 0c1h, 09ah, 07dh, 00fh, 0adh, 0c1h, 09ah
        db      055h, 00eh, 0adh, 0c1h, 033h, 0c0h, 050h, 09ah, 008h, 000h, 022h, 0ddh, 083h, 0c4h, 002h, 0ebh
        db      048h, 0a0h, 034h, 0aeh, 0a2h, 030h, 0aeh, 0a0h, 035h, 0aeh, 0a2h, 031h, 0aeh, 0a0h, 036h, 0aeh
        db      0a2h, 032h, 0aeh, 0a0h, 037h, 0aeh, 0a2h, 033h, 0aeh, 0b8h, 009h, 000h, 050h, 09ah, 05dh, 009h
        db      030h, 0d8h, 083h, 0c4h, 002h, 0b8h, 00ah, 000h, 050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h
        db      002h, 0b8h, 00eh, 000h, 050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 0b8h, 00fh, 000h
        db      050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 0b8h, 001h, 000h, 050h, 0a0h, 028h, 099h
        db      098h, 050h, 09ah, 00ah, 000h, 0bch, 0d3h, 083h, 0c4h, 004h, 0ebh, 069h, 0b8h, 01bh, 0aeh, 050h
        db      0a0h, 030h, 0aeh, 098h, 050h, 0a0h, 032h, 0aeh, 098h, 050h, 09ah, 0d3h, 011h, 0adh, 0c1h, 083h
        db      0c4h, 006h, 09ah, 055h, 00eh, 0adh, 0c1h, 0ebh, 04ch, 0b8h, 024h, 0aeh, 050h, 0a0h, 031h, 0aeh
        db      098h, 050h, 0a0h, 033h, 0aeh, 098h, 050h, 09ah, 0d3h, 011h, 0adh, 0c1h, 083h, 0c4h, 006h, 09ah
        db      055h, 00eh, 0adh, 0c1h, 0ebh, 02fh, 014h, 003h, 016h, 004h, 098h, 004h, 0e3h, 004h, 0e8h, 00ah
        db      01bh, 005h, 0aah, 005h, 003h, 007h, 08dh, 007h, 052h, 009h, 052h, 009h, 07fh, 00ah, 019h, 008h
        db      019h, 008h, 052h, 009h, 052h, 009h, 09ch, 00ah, 03dh, 011h, 000h, 073h, 008h, 093h, 0d1h, 0e3h
        db      02eh, 0ffh, 0a7h, 0b9h, 00ah, 0e9h, 00ch, 0f8h, 08bh, 046h, 0feh, 0e9h, 0a7h, 002h, 09ah, 00ah
        db      010h, 0adh, 0c1h, 085h, 0c0h, 074h, 004h, 033h, 0c0h, 0ebh, 003h, 0b8h, 001h, 000h, 050h, 09ah
        db      025h, 010h, 0adh, 0c1h, 083h, 0c4h, 002h, 09ah, 06bh, 010h, 0adh, 0c1h, 09ah, 0bch, 000h, 00dh
        db      0d6h, 0b8h, 001h, 000h, 050h, 0a0h, 028h, 099h, 098h, 050h, 09ah, 00ah, 000h, 0bch, 0d3h, 083h
        db      0c4h, 004h, 0e9h, 087h, 002h, 033h, 0c0h, 080h, 03eh, 0b2h, 048h, 000h, 075h, 003h, 0b8h, 001h
        db      000h, 0a2h, 0b2h, 048h, 09ah, 0a5h, 010h, 0adh, 0c1h, 0e9h, 070h, 002h, 033h, 0c0h, 080h, 03eh
        db      0a0h, 048h, 000h, 075h, 003h, 0b8h, 001h, 000h, 0a2h, 0a0h, 048h, 09ah, 0ddh, 010h, 0adh, 0c1h
        db      09ah, 086h, 000h, 0cfh, 0d6h, 0b8h, 03bh, 050h, 050h, 0ffh, 036h, 0c6h, 090h, 0ffh, 036h, 0c4h
        db      090h, 09ah, 004h, 000h, 07fh, 0d3h, 083h, 0c4h, 006h, 033h, 0c0h, 050h, 09ah, 008h, 000h, 022h
        db      0ddh, 083h, 0c4h, 002h, 0e9h, 035h, 002h, 0c6h, 006h, 05ch, 050h, 001h, 09ah, 04ch, 000h, 0cah
        db      0d6h, 09ah, 008h, 000h, 023h, 0e0h, 089h, 046h, 0feh, 0c7h, 046h, 0fch, 001h, 000h, 0e9h, 01bh
        db      002h, 080h, 03eh, 053h, 089h, 000h, 074h, 003h, 0e9h, 011h, 002h, 080h, 03eh, 090h, 07ah, 000h
        db      074h, 003h, 0e9h, 007h, 002h, 0a0h, 088h, 051h, 098h, 089h, 046h, 0f4h, 083h, 07eh, 0f4h, 001h
        db      07dh, 005h, 0c7h, 046h, 0f4h, 001h, 000h, 083h, 07eh, 0f4h, 063h, 07eh, 005h, 0c7h, 046h, 0f4h
        db      063h, 000h, 0b8h, 001h, 000h, 050h, 0ffh, 076h, 0f4h, 0b8h, 09ah, 090h, 050h, 09ah, 00bh, 000h
        db      0deh, 0d5h, 083h, 0c4h, 006h, 09ah, 00bh, 000h, 0c0h, 0d6h, 0c6h, 006h, 098h, 090h, 000h, 080h
        db      03eh, 098h, 090h, 000h, 074h, 024h, 0a0h, 098h, 090h, 098h, 089h, 046h, 0f4h, 0b8h, 001h, 000h
        db      050h, 0ffh, 076h, 0f4h, 0b8h, 09ah, 090h, 050h, 09ah, 00bh, 000h, 0deh, 0d5h, 083h, 0c4h, 006h
        db      09ah, 00bh, 000h, 0c0h, 0d6h, 0c6h, 006h, 098h, 090h, 000h, 0c6h, 006h, 029h, 099h, 000h, 0a0h
        db      040h, 09ch, 088h, 046h, 0e2h, 08dh, 046h, 0f4h, 050h, 09ah, 0c4h, 012h, 0adh, 0c1h, 083h, 0c4h
        db      002h, 0e9h, 088h, 001h, 0e9h, 085h, 001h, 080h, 03eh, 053h, 089h, 000h, 074h, 003h, 0e9h, 0a7h
        db      000h, 033h, 0c0h, 050h, 0ffh, 076h, 0f4h, 0b8h, 09ah, 090h, 050h, 09ah, 00bh, 000h, 0deh, 0d5h
        db      083h, 0c4h, 006h, 0b9h, 0ffh, 0ffh, 03bh, 0c1h, 075h, 06fh, 0ffh, 076h, 0f4h, 09ah, 006h, 000h
        db      0f3h, 0d4h, 083h, 0c4h, 002h, 085h, 0c0h, 075h, 060h, 08ah, 046h, 0e2h, 0a2h, 040h, 09ch, 098h
        db      08bh, 0d8h, 08ah, 087h, 0dch, 090h, 0a2h, 02ah, 099h, 0a0h, 040h, 09ch, 098h, 050h, 0b8h, 040h
        db      08ah, 050h, 09ah, 033h, 001h, 09dh, 0d5h, 083h, 0c4h, 004h, 0a0h, 028h, 099h, 098h, 050h, 0b8h
        db      00ah, 0aeh, 050h, 09ah, 081h, 001h, 09dh, 0d5h, 083h, 0c4h, 004h, 0b8h, 040h, 08ah, 050h, 0a0h
        db      02ah, 099h, 098h, 050h, 0a0h, 028h, 099h, 098h, 050h, 09ah, 00fh, 000h, 0b9h, 0d5h, 083h, 0c4h
        db      006h, 0b8h, 008h, 000h, 050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 0b8h, 001h, 000h
        db      050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 080h, 03eh, 091h, 07ah, 000h, 075h, 018h
        db      0b8h, 010h, 094h, 050h, 09ah, 001h, 000h, 095h, 0d4h, 083h, 0c4h, 002h, 09ah, 006h, 000h, 000h
        db      0d4h, 0a0h, 09ah, 090h, 098h, 089h, 046h, 0f6h, 09ah, 015h, 011h, 0adh, 0c1h, 09ah, 09bh, 003h
        db      0e9h, 0d2h, 0c6h, 006h, 087h, 051h, 000h, 09ah, 021h, 012h, 0adh, 0c1h, 033h, 0c0h, 050h, 09ah
        db      008h, 000h, 022h, 0ddh, 083h, 0c4h, 002h, 0e9h, 0b2h, 000h, 0f6h, 006h, 090h, 07ah, 014h, 074h
        db      018h, 033h, 0c0h, 050h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 09ah, 018h
        db      050h, 09ah, 00eh, 000h, 023h, 0d9h, 083h, 0c4h, 002h, 080h, 03eh, 090h, 07ah, 000h, 075h, 005h
        db      0c7h, 046h, 0fch, 001h, 000h, 0e9h, 084h, 000h, 0f6h, 006h, 090h, 07ah, 015h, 074h, 018h, 033h
        db      0c0h, 050h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 0b8h, 018h, 050h, 09ah
        db      00eh, 000h, 023h, 0d9h, 083h, 0c4h, 002h, 080h, 03eh, 090h, 07ah, 000h, 075h, 005h, 0c7h, 046h
        db      0fch, 001h, 000h, 0ebh, 057h, 09ah, 021h, 012h, 0adh, 0c1h, 0ebh, 050h, 0c7h, 046h, 0fch, 001h
        db      000h, 0ebh, 049h, 045h, 000h, 04dh, 000h, 050h, 000h, 052h, 000h, 057h, 000h, 065h, 000h, 06dh
        db      000h, 072h, 000h, 075h, 000h, 078h, 000h, 079h, 000h, 07ah, 000h, 0fdh, 00ch, 027h, 00ch, 0e2h
        db      00bh, 02bh, 00dh, 02ah, 00ch, 058h, 00dh, 094h, 00bh, 058h, 00dh, 07ah, 00bh, 0f1h, 00ah, 028h
        db      00bh, 03fh, 00bh, 05fh, 00dh, 006h, 08ch, 0c9h, 08eh, 0c1h, 057h, 0bfh, 066h, 00dh, 0b9h, 00dh
        db      000h, 0fch, 0f2h, 0afh, 026h, 08bh, 04dh, 016h, 05fh, 007h, 0ffh, 0e1h, 0e9h, 014h, 0f5h, 08bh
        db      046h, 0feh, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 080h, 03eh, 02bh, 050h, 000h, 074h, 01bh
        db      0a0h, 09fh, 048h, 098h, 050h, 0a0h, 09eh, 048h, 098h, 050h, 0ffh, 036h, 0e1h, 04fh, 09ah, 03ah
        db      001h, 0c8h, 0d2h, 083h, 0c4h, 006h, 0a3h, 0dfh, 04fh, 0ebh, 011h, 0a0h, 09eh, 048h, 098h, 050h
        db      0ffh, 036h, 0dfh, 04fh, 09ah, 0b5h, 000h, 0cfh, 0d6h, 083h, 0c4h, 004h, 080h, 03eh, 090h, 07ah
        db      000h, 075h, 01fh, 0b8h, 03bh, 050h, 050h, 0ffh, 036h, 0c6h, 090h, 0ffh, 036h, 0c4h, 090h, 09ah
        db      004h, 000h, 07fh, 0d3h, 083h, 0c4h, 006h, 033h, 0c0h, 050h, 09ah, 008h, 000h, 022h, 0ddh, 083h
        db      0c4h, 002h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 033h, 0c0h, 050h, 0b8h, 006h, 000h, 050h
        db      09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 0cfh, 018h, 050h, 09ah, 05bh, 000h, 031h
        db      0d7h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 09ah, 008h, 000h, 022h, 0ddh, 083h, 0c4h, 002h, 033h
        db      0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 08bh, 0e5h
        db      05dh, 0cbh, 055h, 08bh, 0ech, 0b8h, 009h, 000h, 050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h
        db      002h, 0b8h, 00ah, 000h, 050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 0b8h, 01bh, 0aeh
        db      050h, 0a0h, 030h, 0aeh, 098h, 050h, 0a0h, 032h, 0aeh, 098h, 050h, 09ah, 067h, 011h, 0adh, 0c1h
        db      083h, 0c4h, 006h, 0b8h, 00bh, 000h, 050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 0b8h
        db      00eh, 000h, 050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 0b8h, 00fh, 000h, 050h, 09ah
        db      05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 0b8h, 024h, 0aeh, 050h, 0a0h, 031h, 0aeh, 098h, 050h
        db      0a0h, 033h, 0aeh, 098h, 050h, 09ah, 067h, 011h, 0adh, 0c1h, 083h, 0c4h, 006h, 0b8h, 010h, 000h
        db      050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech
        db      083h, 0c4h, 0ffh, 0a0h, 02ah, 099h, 098h, 08bh, 0d8h, 08ah, 087h, 0a4h, 091h, 088h, 046h, 0ffh
        db      098h, 025h, 00fh, 000h, 040h, 0a2h, 030h, 0aeh, 08ah, 046h, 0ffh, 0b1h, 004h, 098h, 0d3h, 0f8h
        db      0a2h, 032h, 0aeh, 0a0h, 02ah, 099h, 098h, 08bh, 0d8h, 08ah, 087h, 008h, 092h, 088h, 046h, 0ffh
        db      03ch, 0ffh, 074h, 013h, 098h, 025h, 00fh, 000h, 040h, 0a2h, 031h, 0aeh, 08ah, 046h, 0ffh, 098h
        db      0d3h, 0f8h, 0a2h, 033h, 0aeh, 0ebh, 00ah, 0b0h, 000h, 0c6h, 006h, 033h, 0aeh, 000h, 0a2h, 031h
        db      0aeh, 0b8h, 004h, 000h, 050h, 0a0h, 02ah, 099h, 098h, 050h, 09ah, 000h, 000h, 096h, 0d5h, 083h
        db      0c4h, 002h, 050h, 09ah, 03ch, 010h, 0adh, 0c1h, 083h, 0c4h, 004h, 0a0h, 030h, 0aeh, 0a2h, 034h
        db      0aeh, 0a0h, 031h, 0aeh, 0a2h, 035h, 0aeh, 0a0h, 032h, 0aeh, 0a2h, 036h, 0aeh, 0a0h, 033h, 0aeh
        db      0a2h, 037h, 0aeh, 0a0h, 02ah, 099h, 098h, 08bh, 0d8h, 08ah, 087h, 06ch, 092h, 02ah, 0e4h, 0a3h
        db      038h, 0aeh, 0b8h, 0ffh, 0ffh, 050h, 0a0h, 02ah, 099h, 098h, 050h, 09ah, 005h, 000h, 00dh, 0d6h
        db      083h, 0c4h, 004h, 0a3h, 03ah, 0aeh, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 09ah, 004h, 000h
        db      08dh, 0d5h, 0a1h, 038h, 0aeh, 050h, 0a0h, 02ah, 099h, 098h, 08bh, 0d8h, 058h, 088h, 087h, 06ch
        db      092h, 0a0h, 030h, 0aeh, 098h, 050h, 0a0h, 032h, 0aeh, 098h, 050h, 09ah, 03dh, 013h, 0adh, 0c1h
        db      083h, 0c4h, 004h, 050h, 0a0h, 02ah, 099h, 098h, 08bh, 0d8h, 058h, 088h, 087h, 0a4h, 091h, 0a0h
        db      031h, 0aeh, 098h, 050h, 0a0h, 033h, 0aeh, 098h, 050h, 09ah, 03dh, 013h, 0adh, 0c1h, 083h, 0c4h
        db      004h, 050h, 0a0h, 02ah, 099h, 098h, 08bh, 0d8h, 058h, 088h, 087h, 008h, 092h, 0a0h, 030h, 0aeh
        db      0a2h, 034h, 0aeh, 0a0h, 031h, 0aeh, 0a2h, 035h, 0aeh, 0a0h, 032h, 0aeh, 0a2h, 036h, 0aeh, 0a0h
        db      033h, 0aeh, 0a2h, 037h, 0aeh, 0b8h, 004h, 000h, 050h, 0a0h, 02ah, 099h, 098h, 050h, 09ah, 000h
        db      000h, 096h, 0d5h, 083h, 0c4h, 002h, 050h, 09ah, 03ch, 010h, 0adh, 0c1h, 083h, 0c4h, 004h, 0feh
        db      00eh, 04bh, 089h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 0a0h, 02ah, 099h, 098h, 08bh, 0d8h
        db      0f6h, 087h, 040h, 091h, 001h, 074h, 006h, 033h, 0c0h, 08bh, 0e5h, 05dh, 0cbh, 0b8h, 001h, 000h
        db      0ebh, 0f7h, 055h, 08bh, 0ech, 0b8h, 001h, 000h, 050h, 02bh, 046h, 006h, 050h, 09ah, 03ch, 010h
        db      0adh, 0c1h, 083h, 0c4h, 004h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 07eh, 006h, 000h
        db      074h, 011h, 08ah, 046h, 008h, 050h, 0a0h, 02ah, 099h, 098h, 08bh, 0d8h, 058h, 008h, 087h, 040h
        db      091h, 0ebh, 011h, 08ah, 046h, 008h, 0f6h, 0d0h, 050h, 0a0h, 02ah, 099h, 098h, 08bh, 0d8h, 058h
        db      020h, 087h, 040h, 091h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 0b8h, 006h, 000h, 050h, 0b8h
        db      007h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 09ah, 00ah, 010h, 0adh, 0c1h
        db      085h, 0c0h, 075h, 00eh, 0b8h, 0f8h, 018h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h
        db      0ebh, 00ch, 0b8h, 0fch, 018h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 08bh, 0e5h
        db      05dh, 0cbh, 055h, 08bh, 0ech, 0b8h, 010h, 000h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 026h, 000h
        db      031h, 0d7h, 083h, 0c4h, 004h, 080h, 03eh, 0b2h, 048h, 000h, 075h, 00eh, 0b8h, 000h, 019h, 050h
        db      09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0ebh, 00ch, 0b8h, 004h, 019h, 050h, 09ah, 05bh
        db      000h, 031h, 0d7h, 083h, 0c4h, 002h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 0b8h, 01ah, 000h
        db      050h, 0b8h, 007h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 080h, 03eh, 0a0h
        db      048h, 000h, 075h, 00eh, 0b8h, 008h, 019h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h
        db      0ebh, 00ch, 0b8h, 00ch, 019h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 08bh, 0e5h
        db      05dh, 0cbh, 055h, 08bh, 0ech, 0a0h, 09bh, 090h, 024h, 001h, 0a2h, 02dh, 0aeh, 0a1h, 0cch, 090h
        db      0a3h, 02eh, 0aeh, 0b8h, 005h, 000h, 050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 080h
        db      03eh, 02dh, 0aeh, 000h, 075h, 01eh, 0b8h, 024h, 000h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 026h
        db      000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 010h, 019h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h
        db      0c4h, 002h, 0ebh, 00ch, 0b8h, 006h, 000h, 050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h
        db      08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0feh, 0ffh, 076h, 008h, 0ffh, 076h, 006h
        db      09ah, 03dh, 013h, 0adh, 0c1h, 083h, 0c4h, 004h, 089h, 046h, 0feh, 083h, 07eh, 0feh, 0ffh, 075h
        db      013h, 0b8h, 014h, 019h, 050h, 0ffh, 076h, 00ah, 09ah, 009h, 000h, 0f7h, 0f0h, 083h, 0c4h, 004h
        db      08bh, 0e5h, 05dh, 0cbh, 0a0h, 09ch, 04ch, 098h, 08bh, 04eh, 0feh, 081h, 0e1h, 00fh, 000h, 03bh
        db      0c1h, 075h, 011h, 0b8h, 01dh, 019h, 050h, 0ffh, 076h, 00ah, 09ah, 009h, 000h, 0f7h, 0f0h, 083h
        db      0c4h, 004h, 0ebh, 0dch, 08bh, 046h, 0feh, 08bh, 0d0h, 0b1h, 003h, 0d3h, 0e0h, 003h, 0c2h, 005h
        db      0b3h, 048h, 050h, 0ffh, 076h, 00ah, 09ah, 009h, 000h, 0f7h, 0f0h, 083h, 0c4h, 004h, 0ebh, 0c0h
        db      055h, 08bh, 0ech, 083h, 0c4h, 0feh, 0ffh, 076h, 008h, 0ffh, 076h, 006h, 09ah, 03dh, 013h, 0adh
        db      0c1h, 083h, 0c4h, 004h, 089h, 046h, 0feh, 083h, 07eh, 0feh, 0ffh, 075h, 004h, 08bh, 0e5h, 05dh
        db      0cbh, 0a0h, 09ch, 04ch, 098h, 08bh, 04eh, 0feh, 081h, 0e1h, 00fh, 000h, 03bh, 0c1h, 075h, 002h
        db      0ebh, 0ebh, 0ffh, 076h, 00ah, 08bh, 046h, 0feh, 08bh, 0d0h, 0b1h, 003h, 0d3h, 0e0h, 003h, 0c2h
        db      005h, 0b3h, 048h, 050h, 09ah, 009h, 000h, 0f7h, 0f0h, 083h, 0c4h, 004h, 0ebh, 0cfh, 055h, 08bh
        db      0ech, 033h, 0c0h, 050h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 080h, 03eh, 029h
        db      099h, 000h, 07eh, 013h, 0a0h, 029h, 099h, 098h, 050h, 0b8h, 026h, 019h, 050h, 09ah, 005h, 000h
        db      03fh, 0d7h, 083h, 0c4h, 004h, 0ebh, 028h, 080h, 03eh, 09ah, 090h, 000h, 074h, 007h, 080h, 03eh
        db      09ah, 090h, 002h, 075h, 00eh, 0b8h, 050h, 019h, 050h, 09ah, 00eh, 000h, 023h, 0d9h, 083h, 0c4h
        db      002h, 0ebh, 00ch, 0b8h, 06bh, 019h, 050h, 09ah, 00eh, 000h, 023h, 0d9h, 083h, 0c4h, 002h, 08bh
        db      0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0feh, 0b8h, 00ah, 0aeh, 050h, 0b8h, 0ffh, 0ffh
        db      050h, 0a0h, 028h, 099h, 098h, 050h, 09ah, 001h, 000h, 09dh, 0d5h, 083h, 0c4h, 006h, 0b8h, 040h
        db      08ah, 050h, 0a0h, 02ah, 099h, 098h, 050h, 0a0h, 028h, 099h, 098h, 050h, 09ah, 001h, 000h, 09dh
        db      0d5h, 083h, 0c4h, 006h, 09ah, 0d0h, 00eh, 0adh, 0c1h, 080h, 03eh, 053h, 089h, 000h, 074h, 006h
        db      0a0h, 054h, 089h, 098h, 0ebh, 004h, 0a0h, 028h, 099h, 098h, 089h, 046h, 0feh, 08bh, 0e5h, 05dh
        db      0cbh, 055h, 08bh, 0ech, 09ah, 076h, 012h, 0adh, 0c1h, 08bh, 05eh, 006h, 089h, 007h, 033h, 0c0h
        db      050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 0b8h, 001h, 000h, 050h, 09ah, 05dh, 009h
        db      030h, 0d8h, 083h, 0c4h, 002h, 0b8h, 007h, 000h, 050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h
        db      002h, 0b8h, 008h, 000h, 050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 0b8h, 00ch, 000h
        db      050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 0b8h, 00dh, 000h, 050h, 09ah, 05dh, 009h
        db      030h, 0d8h, 083h, 0c4h, 002h, 09ah, 015h, 011h, 0adh, 0c1h, 09ah, 06bh, 010h, 0adh, 0c1h, 09ah
        db      055h, 00eh, 0adh, 0c1h, 0a0h, 090h, 07ah, 098h, 050h, 09ah, 008h, 000h, 022h, 0ddh, 083h, 0c4h
        db      002h, 09ah, 021h, 012h, 0adh, 0c1h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 07eh, 008h
        endif
        if      FW_VERSION >= 214
        db      0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 013h
        db      019h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 09ah, 00ch, 000h
        db      0b8h, 0d7h, 083h, 0c4h, 002h, 0ffh, 076h, 006h, 0b8h, 006h, 000h, 050h, 09ah, 00ch, 000h, 0b8h
        db      0d7h, 083h, 0c4h, 004h, 050h, 09ah, 003h, 000h, 053h, 0deh, 083h, 0c4h, 002h, 0a0h, 0dbh, 053h
        db      098h, 089h, 046h, 0feh, 08bh, 046h, 0feh, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h
        db      0ceh, 057h, 056h, 0b8h, 024h, 019h, 050h, 09ah, 05eh, 01ah, 04fh, 0c0h, 083h, 0c4h, 002h, 0c6h
        db      006h, 0dch, 053h, 038h, 033h, 0c0h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h
        db      083h, 0c4h, 004h, 0b8h, 032h, 019h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 08dh
        db      046h, 0ceh, 050h, 0ffh, 076h, 006h, 09ah, 07ch, 019h, 04fh, 0c0h, 083h, 0c4h, 004h, 08dh, 046h
        db      0ceh, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 0ffh, 076h, 006h, 08dh, 046h, 0e4h
        db      050h, 09ah, 00ah, 000h, 063h, 0f2h, 083h, 0c4h, 004h, 08bh, 05eh, 006h, 080h, 07fh, 00bh, 000h
        db      074h, 005h, 0b8h, 010h, 000h, 0ebh, 003h, 0b8h, 008h, 000h, 089h, 046h, 0f8h, 08bh, 0f0h, 0c6h
        db      042h, 0e4h, 000h, 033h, 0c0h, 050h, 0b8h, 004h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h
        db      0c4h, 004h, 0b8h, 008h, 000h, 080h, 03eh, 0dah, 053h, 000h, 074h, 003h, 0b8h, 010h, 000h, 050h
        db      08dh, 046h, 0e4h, 050h, 0b8h, 044h, 019h, 050h, 09ah, 006h, 000h, 00ah, 0d9h, 083h, 0c4h, 006h
        db      033h, 0c0h, 050h, 0b8h, 006h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h
        db      028h, 000h, 050h, 0b8h, 03dh, 000h, 050h, 09ah, 094h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 033h
        db      0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 056h
        db      019h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 0b8h, 001h, 000h, 050h, 09ah, 02ah
        db      000h, 07fh, 0d9h, 083h, 0c4h, 002h, 089h, 046h, 0feh, 085h, 0c0h, 075h, 038h, 0c7h, 046h, 0fch
        db      000h, 000h, 0ebh, 003h, 0ffh, 046h, 0fch, 08bh, 076h, 0fch, 08ah, 042h, 0e4h, 098h, 050h, 09ah
        db      00fh, 000h, 067h, 0f2h, 083h, 0c4h, 002h, 08bh, 076h, 0fch, 088h, 042h, 0e4h, 084h, 0c0h, 075h
        db      0e3h, 08bh, 076h, 0fch, 0c6h, 042h, 0e4h, 000h, 033h, 0c0h, 050h, 09ah, 05fh, 009h, 07fh, 0d9h
        db      083h, 0c4h, 002h, 0ebh, 0b5h, 083h, 07eh, 0feh, 078h, 074h, 003h, 0e9h, 096h, 000h, 033h, 0c0h
        db      050h, 0b8h, 007h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 062h, 019h
        db      050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 08dh, 046h, 0e4h, 050h, 09ah, 007h, 000h
        db      079h, 0f2h, 083h, 0c4h, 002h, 0b9h, 008h, 000h, 03bh, 0c1h, 07eh, 005h, 0b8h, 010h, 000h, 0ebh
        db      003h, 0b8h, 008h, 000h, 089h, 046h, 0fah, 050h, 08dh, 046h, 0e4h, 050h, 09ah, 0cdh, 008h, 07fh
        db      0d9h, 083h, 0c4h, 004h, 0c7h, 046h, 0fch, 000h, 000h, 08bh, 076h, 006h, 003h, 076h, 0fch, 08bh
        db      05eh, 0f8h, 08ah, 000h, 08bh, 07eh, 0fch, 003h, 07eh, 0fah, 088h, 043h, 0e4h, 0ffh, 046h, 0fch
        db      083h, 07eh, 0fch, 004h, 07ch, 0e3h, 033h, 0c0h, 050h, 09ah, 00ch, 000h, 0b8h, 0d7h, 083h, 0c4h
        db      002h, 08dh, 046h, 0e4h, 050h, 0ffh, 076h, 006h, 0b8h, 007h, 000h, 050h, 09ah, 00ch, 000h, 0b8h
        db      0d7h, 083h, 0c4h, 006h, 050h, 09ah, 003h, 000h, 053h, 0deh, 083h, 0c4h, 002h, 0a0h, 0dbh, 053h
        db      098h, 089h, 046h, 0feh, 08bh, 046h, 0feh, 05eh, 05fh, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech
        db      083h, 0c4h, 0fch, 0b8h, 074h, 019h, 050h, 09ah, 05eh, 01ah, 04fh, 0c0h, 083h, 0c4h, 002h, 0c6h
        db      006h, 0dch, 053h, 03ch, 033h, 0c0h, 050h, 0b8h, 001h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h
        db      083h, 0c4h, 004h, 0b8h, 080h, 019h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 0b8h
        db      0a8h, 019h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 004h
        db      000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 010h, 000h, 050h, 0b8h, 0ffh
        db      011h, 050h, 0b8h, 003h, 08eh, 050h, 0b8h, 0c3h, 019h, 050h, 09ah, 0cdh, 000h, 00ah, 0d9h, 083h
        db      0c4h, 008h, 033h, 0c0h, 050h, 0b8h, 006h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h
        db      004h, 0b8h, 028h, 000h, 050h, 0b8h, 03dh, 000h, 050h, 09ah, 094h, 000h, 080h, 0d8h, 083h, 0c4h
        db      004h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h
        db      0b8h, 0c9h, 019h, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 0b8h, 001h, 000h, 050h
        db      09ah, 02ah, 000h, 07fh, 0d9h, 083h, 0c4h, 002h, 089h, 046h, 0feh, 085h, 0c0h, 075h, 01ah, 0a0h
        db      003h, 08eh, 098h, 050h, 09ah, 0c3h, 004h, 0e3h, 0d7h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 09ah
        db      05fh, 009h, 07fh, 0d9h, 083h, 0c4h, 002h, 0ebh, 0d3h, 083h, 07eh, 0feh, 078h, 075h, 005h, 0c7h
        db      046h, 0feh, 000h, 000h, 08bh, 046h, 0feh, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h
        db      0fch, 0b8h, 0d5h, 019h, 050h, 09ah, 05eh, 01ah, 04fh, 0c0h, 083h, 0c4h, 002h, 033h, 0c0h, 050h
        db      0b8h, 002h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 0eah, 019h, 050h
        db      09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 006h, 000h, 050h, 09ah
        db      027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 028h, 000h, 050h, 0b8h, 03dh, 000h, 050h, 09ah
        db      094h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 027h
        db      000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 00bh, 01ah, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h
        db      0c4h, 002h, 0b8h, 001h, 000h, 050h, 09ah, 02ah, 000h, 07fh, 0d9h, 083h, 0c4h, 002h, 089h, 046h
        db      0feh, 083h, 07eh, 0feh, 078h, 074h, 003h, 0e9h, 084h, 000h, 033h, 0c0h, 050h, 0b8h, 007h, 000h
        db      050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 017h, 01ah, 050h, 09ah, 05ch, 000h
        db      080h, 0d8h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 09ah, 0c3h, 004h, 0e3h, 0d7h, 083h, 0c4h, 002h
        db      033h, 0c0h, 050h, 09ah, 00ch, 000h, 0b8h, 0d7h, 083h, 0c4h, 002h, 0b8h, 005h, 000h, 050h, 033h
        db      0c0h, 050h, 0b8h, 00bh, 000h, 050h, 09ah, 00ch, 000h, 0b8h, 0d7h, 083h, 0c4h, 006h, 089h, 046h
        db      0fch, 085h, 0c0h, 074h, 032h, 081h, 07eh, 0fch, 002h, 0ffh, 074h, 00eh, 081h, 07eh, 0fch, 004h
        db      0ffh, 074h, 007h, 081h, 07eh, 0fch, 010h, 0ffh, 075h, 012h, 050h, 0b8h, 01ah, 000h, 050h, 033h
        db      0c0h, 050h, 09ah, 04dh, 001h, 053h, 0deh, 083h, 0c4h, 006h, 0ebh, 00bh, 0ffh, 076h, 0fch, 09ah
        db      003h, 000h, 053h, 0deh, 083h, 0c4h, 002h, 0a0h, 0dbh, 053h, 098h, 089h, 046h, 0feh, 08bh, 046h
        db      0feh, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0d3h, 0c7h, 046h, 0feh, 000h, 000h
        db      083h, 07eh, 0feh, 000h, 074h, 003h, 0e9h, 021h, 003h, 0b8h, 025h, 01ah, 050h, 09ah, 05eh, 01ah
        db      04fh, 0c0h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 001h, 000h, 050h, 09ah, 027h, 000h, 080h
        db      0d8h, 083h, 0c4h, 004h, 0b8h, 038h, 01ah, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h
        db      033h, 0c0h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h
        db      061h, 01ah, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 006h
        db      000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 028h, 000h, 050h, 0b8h, 03dh
        db      000h, 050h, 09ah, 094h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 033h, 0c0h, 050h, 0b8h, 007h, 000h
        db      050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 087h, 01ah, 050h, 09ah, 05ch, 000h
        db      080h, 0d8h, 083h, 0c4h, 002h, 0b8h, 001h, 000h, 050h, 09ah, 02ah, 000h, 07fh, 0d9h, 083h, 0c4h
        db      002h, 089h, 046h, 0feh, 083h, 07eh, 0feh, 078h, 074h, 003h, 0e9h, 08ah, 002h, 033h, 0c0h, 050h
        db      09ah, 0c3h, 004h, 0e3h, 0d7h, 083h, 0c4h, 002h, 0ffh, 036h, 098h, 09bh, 0ffh, 036h, 096h, 09bh
        db      0ffh, 036h, 094h, 09bh, 0ffh, 036h, 092h, 09bh, 09ah, 052h, 000h, 09bh, 0dah, 083h, 0c4h, 008h
        db      089h, 056h, 0f0h, 089h, 046h, 0eeh, 0bbh, 000h, 000h, 0b9h, 000h, 002h, 09ah, 007h, 000h, 06ah
        db      0f2h, 089h, 046h, 0fah, 033h, 0c0h, 0c7h, 046h, 0f6h, 000h, 000h, 0a2h, 014h, 055h, 0ffh, 036h
        db      098h, 09bh, 0ffh, 036h, 096h, 09bh, 09ah, 0a4h, 000h, 09bh, 0dah, 083h, 0c4h, 004h, 089h, 056h
        db      0f4h, 089h, 046h, 0f2h, 0b8h, 050h, 000h, 0c7h, 046h, 0f8h, 050h, 000h, 0a2h, 012h, 055h, 083h
        db      07eh, 0f8h, 000h, 075h, 003h, 0e9h, 01ah, 002h, 0b8h, 096h, 01ah, 050h, 09ah, 05eh, 01ah, 04fh
        db      0c0h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 001h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h
        db      083h, 0c4h, 004h, 0b8h, 0a9h, 01ah, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 033h
        db      0c0h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 0cdh
        db      01ah, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 007h, 000h
        db      050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 0ddh, 01ah, 050h, 09ah, 05ch, 000h
        db      080h, 0d8h, 083h, 0c4h, 002h, 0c6h, 006h, 0dch, 053h, 051h, 09ah, 009h, 000h, 071h, 0d8h, 0b8h
        db      001h, 000h, 050h, 09ah, 02ah, 000h, 07fh, 0d9h, 083h, 0c4h, 002h, 089h, 046h, 0feh, 083h, 07eh
        db      0feh, 078h, 074h, 003h, 0e9h, 09bh, 001h, 0c7h, 046h, 0feh, 000h, 000h, 033h, 0c0h, 050h, 0b8h
        db      007h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 0e7h, 01ah, 050h, 09ah
        db      05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 09ah, 00ch, 000h, 0b8h, 0d7h, 083h
        db      0c4h, 002h, 08dh, 046h, 0d3h, 050h, 0b8h, 095h, 00fh, 050h, 0b8h, 009h, 000h, 050h, 09ah, 00ch
        db      000h, 0b8h, 0d7h, 083h, 0c4h, 006h, 089h, 046h, 0fch, 08bh, 046h, 0fch, 025h, 000h, 0ffh, 0b9h
        db      000h, 0ffh, 03bh, 0c1h, 075h, 00eh, 0ffh, 076h, 0fch, 09ah, 003h, 000h, 053h, 0deh, 083h, 0c4h
        db      002h, 0e9h, 03eh, 001h, 0ffh, 076h, 0f6h, 0ffh, 076h, 0fah, 0ffh, 076h, 0f4h, 0ffh, 076h, 0f2h
        db      09ah, 001h, 000h, 0cdh, 0d7h, 083h, 0c4h, 008h, 089h, 046h, 0fch, 085h, 0c0h, 074h, 00ch, 050h
        db      09ah, 003h, 000h, 053h, 0deh, 083h, 0c4h, 002h, 0e9h, 017h, 001h, 033h, 0c0h, 050h, 0b8h, 001h
        db      000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 00bh, 01bh, 050h, 09ah, 05ch
        db      000h, 080h, 0d8h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 027h, 000h
        db      080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 028h, 000h, 050h, 09ah, 002h, 000h, 08bh, 0d8h, 083h, 0c4h
        db      002h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h
        db      0b8h, 031h, 01bh, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 0c6h, 006h, 0dch, 053h
        db      052h, 09ah, 009h, 000h, 071h, 0d8h, 0b8h, 001h, 000h, 050h, 09ah, 02ah, 000h, 07fh, 0d9h, 083h
        db      0c4h, 002h, 089h, 046h, 0feh, 083h, 07eh, 0feh, 078h, 074h, 003h, 0e9h, 0a4h, 000h, 0c7h, 046h
        db      0feh, 000h, 000h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h
        db      0c4h, 004h, 0b8h, 03bh, 01bh, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 033h, 0c0h
        db      050h, 09ah, 00ch, 000h, 0b8h, 0d7h, 083h, 0c4h, 002h, 08dh, 046h, 0d3h, 050h, 0b8h, 095h, 00fh
        db      050h, 0b8h, 009h, 000h, 050h, 09ah, 00ch, 000h, 0b8h, 0d7h, 083h, 0c4h, 006h, 089h, 046h, 0fch
        db      08bh, 046h, 0fch, 025h, 000h, 0ffh, 0b9h, 000h, 0ffh, 03bh, 0c1h, 075h, 00dh, 0ffh, 076h, 0fch
        db      09ah, 003h, 000h, 053h, 0deh, 083h, 0c4h, 002h, 0ebh, 048h, 0ffh, 076h, 0f6h, 0ffh, 076h, 0f4h
        db      0ffh, 076h, 0f2h, 09ah, 00dh, 000h, 0dah, 0d7h, 083h, 0c4h, 006h, 089h, 046h, 0fch, 085h, 0c0h
        db      074h, 00bh, 050h, 09ah, 003h, 000h, 053h, 0deh, 083h, 0c4h, 002h, 0ebh, 025h, 0a0h, 014h, 055h
        db      02ah, 0e4h, 089h, 046h, 0f6h, 0a0h, 012h, 055h, 02ah, 0e4h, 029h, 046h, 0f8h, 0a0h, 012h, 055h
        db      02ah, 0e4h, 08bh, 04eh, 0f8h, 03bh, 0c8h, 073h, 006h, 08bh, 046h, 0f8h, 0a2h, 012h, 055h, 0e9h
        db      0ddh, 0fdh, 09ah, 00eh, 000h, 0b6h, 0d4h, 0e9h, 0d6h, 0fch, 08bh, 046h, 0feh, 08bh, 0e5h, 05dh
        db      0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0f8h, 057h, 056h, 0b8h, 02eh, 000h, 050h, 0ffh, 076h, 006h
        db      09ah, 007h, 000h, 055h, 0f2h, 083h, 0c4h, 004h, 089h, 046h, 0fch, 085h, 0c0h, 074h, 008h, 02bh
        db      046h, 006h, 089h, 046h, 0fah, 0ebh, 00eh, 0ffh, 076h, 006h, 09ah, 007h, 000h, 079h, 0f2h, 083h
        db      0c4h, 002h, 089h, 046h, 0fah, 0b8h, 008h, 000h, 083h, 07eh, 0fah, 008h, 07eh, 003h, 0b8h, 010h
        db      000h, 089h, 046h, 0f8h, 0c6h, 046h, 0feh, 000h, 0c6h, 046h, 0ffh, 000h, 0ebh, 04fh, 08ah, 046h
        db      0feh, 098h, 08bh, 0f0h, 08bh, 05eh, 006h, 080h, 038h, 000h, 074h, 00bh, 08ah, 046h, 0feh, 098h
        db      08bh, 0f8h, 080h, 039h, 02eh, 075h, 00eh, 08ah, 046h, 0ffh, 098h, 08bh, 0f8h, 08bh, 05eh, 008h
        db      0c6h, 001h, 020h, 0ebh, 025h, 08ah, 046h, 0feh, 0feh, 046h, 0feh, 098h, 08bh, 0f0h, 08bh, 05eh
        db      006h, 08ah, 000h, 098h, 050h, 09ah, 00fh, 000h, 067h, 0f2h, 083h, 0c4h, 002h, 050h, 08ah, 046h
        db      0ffh, 098h, 08bh, 0f0h, 08bh, 05eh, 008h, 058h, 088h, 000h, 0feh, 046h, 0ffh, 08ah, 046h, 0ffh
        db      098h, 03bh, 046h, 0f8h, 07ch, 0a8h, 08ah, 046h, 0feh, 098h, 08bh, 0f0h, 08bh, 05eh, 006h, 080h
        db      038h, 02eh, 075h, 003h, 0feh, 046h, 0feh, 08bh, 046h, 0f8h, 088h, 046h, 0ffh, 0ebh, 041h, 08ah
        db      046h, 0feh, 098h, 08bh, 0f0h, 08bh, 05eh, 006h, 080h, 038h, 000h, 074h, 024h, 08ah, 046h, 0feh
        db      0feh, 046h, 0feh, 098h, 08bh, 0f8h, 08ah, 001h, 098h, 050h, 09ah, 00fh, 000h, 067h, 0f2h, 083h
        db      0c4h, 002h, 050h, 08ah, 046h, 0ffh, 098h, 08bh, 0f0h, 08bh, 05eh, 008h, 058h, 088h, 000h, 0ebh
        db      00ch, 08ah, 046h, 0ffh, 098h, 08bh, 0f0h, 08bh, 05eh, 008h, 0c6h, 000h, 020h, 0feh, 046h, 0ffh
        db      08ah, 046h, 0ffh, 098h, 08bh, 04eh, 0f8h, 083h, 0c1h, 003h, 03bh, 0c1h, 07ch, 0b1h, 08bh, 05eh
        db      008h, 003h, 05eh, 0f8h, 0c6h, 047h, 003h, 000h, 05eh, 05fh, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh
        db      0ech, 083h, 0c4h, 0e4h, 057h, 056h, 033h, 0c0h, 050h, 0b8h, 014h, 000h, 050h, 08dh, 046h, 0e4h
        db      050h, 09ah, 00ch, 000h, 05dh, 0f2h, 083h, 0c4h, 006h, 0c7h, 046h, 0feh, 000h, 000h, 08bh, 076h
        db      006h, 08bh, 05eh, 0feh, 080h, 038h, 000h, 074h, 028h, 080h, 038h, 020h, 072h, 005h, 080h, 038h
        db      07fh, 076h, 008h, 08bh, 0fbh, 0c6h, 043h, 0e4h, 02ah, 0ebh, 00dh, 08bh, 076h, 006h, 08bh, 05eh
        db      0feh, 08ah, 000h, 08bh, 0fbh, 088h, 043h, 0e4h, 0ffh, 046h, 0feh, 083h, 07eh, 0feh, 013h, 07ch
        db      0cdh, 0b8h, 008h, 000h, 080h, 07eh, 0efh, 000h, 074h, 003h, 0b8h, 010h, 000h, 089h, 046h, 0f8h
        db      0c7h, 046h, 0fch, 000h, 000h, 089h, 046h, 0feh, 08bh, 046h, 0feh, 0ffh, 04eh, 0feh, 085h, 0c0h
        db      074h, 02ah, 08bh, 076h, 0feh, 080h, 07ah, 0e4h, 020h, 074h, 01fh, 046h, 08bh, 0c6h, 089h, 046h
        db      0fch, 08bh, 076h, 0feh, 08ah, 042h, 0e4h, 08bh, 07eh, 008h, 08bh, 0deh, 088h, 001h, 08bh, 046h
        db      0feh, 0ffh, 04eh, 0feh, 085h, 0c0h, 075h, 0e9h, 0ebh, 002h, 0ebh, 0cch, 08bh, 076h, 0fch, 0ffh
        db      046h, 0fch, 08bh, 05eh, 008h, 0c6h, 000h, 02eh, 08bh, 046h, 0f8h, 089h, 046h, 0feh, 0ebh, 014h
        db      08bh, 076h, 0feh, 08ah, 042h, 0e4h, 08bh, 07eh, 0fch, 0ffh, 046h, 0fch, 08bh, 05eh, 008h, 088h
        db      001h, 0ffh, 046h, 0feh, 08bh, 046h, 0f8h, 005h, 003h, 000h, 08bh, 04eh, 0feh, 03bh, 0c8h, 07ch
        db      0dfh, 08bh, 076h, 008h, 08bh, 05eh, 0fch, 0c6h, 000h, 000h, 05eh, 05fh, 08bh, 0e5h, 05dh, 0cbh
        db      055h, 08bh, 0ech, 09ah, 005h, 000h, 07fh, 0d9h, 09ah, 00ah, 000h, 080h, 0d8h, 0ffh, 076h, 006h
        db      09ah, 000h, 000h, 073h, 0dah, 083h, 0c4h, 002h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 08bh
        db      05eh, 008h, 0ffh, 037h, 08bh, 05eh, 006h, 0ffh, 037h, 09ah, 003h, 000h, 076h, 0f2h, 083h, 0c4h
        db      004h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0d0h, 057h, 056h, 0c7h, 046h, 0d0h
        db      000h, 000h, 0e9h, 09dh, 000h, 08bh, 076h, 0d0h, 0d1h, 0e6h, 08bh, 05eh, 006h, 0ffh, 030h, 08dh
        db      046h, 0ebh, 050h, 09ah, 00ah, 000h, 063h, 0f2h, 083h, 0c4h, 004h, 0c7h, 046h, 0d4h, 000h, 000h
        db      08bh, 076h, 0d4h, 080h, 07ah, 0ebh, 000h, 074h, 009h, 0ffh, 046h, 0d4h, 083h, 07eh, 0d4h, 015h
        db      07ch, 0eeh, 083h, 06eh, 0d4h, 003h, 08bh, 076h, 0d4h, 0ffh, 046h, 0d4h, 08ah, 042h, 0ebh, 088h
        db      046h, 0d6h, 08bh, 07eh, 0d4h, 0ffh, 046h, 0d4h, 08ah, 043h, 0ebh, 088h, 046h, 0d7h, 08bh, 076h
        db      0d4h, 08ah, 042h, 0ebh, 088h, 046h, 0d8h, 0c6h, 046h, 0d9h, 02eh, 0c7h, 046h, 0d4h, 000h, 000h
        db      0c7h, 046h, 0d2h, 004h, 000h, 08bh, 076h, 0d4h, 080h, 07ah, 0ebh, 02eh, 074h, 014h, 08bh, 07eh
        db      0d4h, 0ffh, 046h, 0d4h, 08ah, 043h, 0ebh, 08bh, 076h, 0d2h, 0ffh, 046h, 0d2h, 088h, 042h, 0d6h
        db      0ebh, 0e3h, 08bh, 076h, 0d2h, 0c6h, 042h, 0d6h, 000h, 08dh, 046h, 0d6h, 050h, 08bh, 076h, 0d0h
        db      0d1h, 0e6h, 08bh, 05eh, 006h, 0ffh, 030h, 09ah, 00ah, 000h, 063h, 0f2h, 083h, 0c4h, 004h, 0ffh
        db      046h, 0d0h, 08bh, 046h, 0d0h, 03bh, 046h, 008h, 07dh, 003h, 0e9h, 058h, 0ffh, 05eh, 05fh, 08bh
        db      0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0d0h, 057h, 056h, 0c7h, 046h, 0d0h, 000h, 000h
        db      0e9h, 08bh, 000h, 08bh, 076h, 0d0h, 0d1h, 0e6h, 08bh, 05eh, 006h, 0ffh, 030h, 08dh, 046h, 0ebh
        db      050h, 09ah, 00ah, 000h, 063h, 0f2h, 083h, 0c4h, 004h, 0c7h, 046h, 0d4h, 004h, 000h, 0c7h, 046h
        db      0d2h, 000h, 000h, 08bh, 076h, 0d4h, 080h, 07ah, 0ebh, 000h, 074h, 014h, 08bh, 07eh, 0d4h, 0ffh
        db      046h, 0d4h, 08ah, 043h, 0ebh, 08bh, 076h, 0d2h, 0ffh, 046h, 0d2h, 088h, 042h, 0d6h, 0ebh, 0e3h
        db      08bh, 076h, 0d2h, 0ffh, 046h, 0d2h, 0c6h, 042h, 0d6h, 02eh, 08bh, 076h, 0d2h, 0ffh, 046h, 0d2h
        db      08ah, 046h, 0ebh, 088h, 042h, 0d6h, 08bh, 076h, 0d2h, 0ffh, 046h, 0d2h, 08ah, 046h, 0ech, 088h
        db      042h, 0d6h, 08bh, 076h, 0d2h, 0ffh, 046h, 0d2h, 08ah, 046h, 0edh, 088h, 042h, 0d6h, 08bh, 076h
        db      0d2h, 0c6h, 042h, 0d6h, 000h, 08dh, 046h, 0d6h, 050h, 08bh, 076h, 0d0h, 0d1h, 0e6h, 08bh, 05eh
        db      006h, 0ffh, 030h, 09ah, 00ah, 000h, 063h, 0f2h, 083h, 0c4h, 004h, 0ffh, 046h, 0d0h, 08bh, 046h
        db      0d0h, 03bh, 046h, 008h, 07dh, 003h, 0e9h, 06ah, 0ffh, 05eh, 05fh, 08bh, 0e5h, 05dh, 0cbh, 055h
        db      08bh, 0ech, 083h, 0c4h, 0f8h, 033h, 0c0h, 050h, 09ah, 00ch, 000h, 0b8h, 0d7h, 083h, 0c4h, 002h
        db      0ffh, 076h, 006h, 0b8h, 002h, 000h, 050h, 09ah, 00ch, 000h, 0b8h, 0d7h, 083h, 0c4h, 004h, 089h
        db      046h, 0feh, 033h, 0c9h, 03bh, 0c1h, 07dh, 004h, 08bh, 0e5h, 05dh, 0cbh, 0b8h, 002h, 000h, 050h
        db      0ffh, 076h, 0feh, 0b8h, 065h, 08eh, 050h, 0b8h, 004h, 000h, 050h, 09ah, 00ch, 000h, 0b8h, 0d7h
        db      083h, 0c4h, 008h, 089h, 046h, 0fch, 085h, 0c0h, 074h, 002h, 0ebh, 0dch, 0a0h, 066h, 08eh, 02ah
        db      0e4h, 089h, 046h, 0fah, 03bh, 046h, 008h, 07fh, 007h, 0c7h, 046h, 0fch, 000h, 000h, 0ebh, 005h
        db      0c7h, 046h, 0fch, 0f7h, 0ffh, 0ffh, 076h, 0feh, 033h, 0c0h, 050h, 0b8h, 003h, 000h, 050h, 09ah
        db      00ch, 000h, 0b8h, 0d7h, 083h, 0c4h, 006h, 089h, 046h, 0f8h, 085h, 0c0h, 074h, 002h, 0ebh, 0a8h
        db      08bh, 046h, 0fch, 0ebh, 0a3h, 055h, 08bh, 0ech, 083h, 0c4h, 0f8h, 08bh, 056h, 008h, 08bh, 046h
        db      006h, 0bbh, 000h, 000h, 0b9h, 000h, 010h, 09ah, 007h, 000h, 06ah, 0f2h, 089h, 046h, 0fah, 08bh
        db      05eh, 00ah, 08bh, 00fh, 03bh, 0c8h, 07eh, 002h, 089h, 007h, 08bh, 05eh, 00ah, 08bh, 007h, 099h
        db      08bh, 0dah, 08bh, 0c8h, 08bh, 056h, 008h, 08bh, 046h, 006h, 09ah, 007h, 000h, 06ah, 0f2h, 089h
        db      056h, 0feh, 089h, 046h, 0fch, 083h, 0fah, 000h, 07ch, 007h, 075h, 007h, 03dh, 095h, 0eah, 077h
        db      002h, 0ebh, 00ah, 0c7h, 046h, 0feh, 000h, 000h, 0c7h, 046h, 0fch, 095h, 0eah, 08bh, 056h, 008h
        db      08bh, 046h, 006h, 08bh, 05eh, 0feh, 08bh, 04eh, 0fch, 09ah, 007h, 000h, 06ah, 0f2h, 08bh, 05eh
        db      00ah, 089h, 007h, 08bh, 05eh, 00ch, 0c7h, 007h, 000h, 000h, 08bh, 05eh, 00ah, 08bh, 007h, 099h
        db      050h, 052h, 0f7h, 066h, 0feh, 08bh, 0c8h, 058h, 0f7h, 066h, 0fch, 003h, 0c8h, 058h, 0f7h, 066h
        db      0fch, 003h, 0d1h, 08bh, 05eh, 008h, 08bh, 04eh, 006h, 02bh, 0c8h, 01bh, 0dah, 08bh, 0d3h, 08bh
        db      0c1h, 083h, 0fah, 000h, 07ch, 007h, 075h, 007h, 03dh, 000h, 010h, 077h, 002h, 0ebh, 007h, 08bh
        db      05eh, 00ch, 0c7h, 007h, 001h, 000h, 08bh, 05eh, 00ah, 083h, 03fh, 01ah, 07ch, 004h, 0c7h, 007h
        db      01ah, 000h, 0b8h, 021h, 000h, 050h, 0b8h, 001h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h
        db      0c4h, 004h, 08bh, 05eh, 00ah, 08bh, 007h, 08bh, 05eh, 00ch, 003h, 007h, 005h, 040h, 000h, 050h
        db      09ah, 037h, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 0b8h, 018h, 000h, 050h, 0b8h, 002h, 000h, 050h
        db      09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 08bh, 056h, 0feh, 08bh, 046h, 0fch, 0bbh, 000h
        db      000h, 0b9h, 002h, 000h, 09ah, 007h, 000h, 06ah, 0f2h, 005h, 0f4h, 001h, 083h, 0d2h, 000h, 0bbh
        db      000h, 000h, 0b9h, 0e8h, 003h, 09ah, 007h, 000h, 06ah, 0f2h, 089h, 046h, 0f8h, 050h, 0b8h, 064h
        db      01bh, 050h, 09ah, 006h, 000h, 08eh, 0d8h, 083h, 0c4h, 004h, 08bh, 056h, 0feh, 08bh, 046h, 0fch
        db      08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0e2h, 09ah, 073h, 012h, 02ah, 0c2h, 089h
        db      046h, 0f4h, 09ah, 01eh, 012h, 02ah, 0c2h, 0a0h, 0dbh, 053h, 0a2h, 0f7h, 054h, 033h, 0c0h, 050h
        db      0b8h, 063h, 000h, 050h, 0b8h, 001h, 000h, 050h, 0b8h, 002h, 000h, 050h, 08dh, 046h, 0f4h, 050h
        db      0b8h, 079h, 01bh, 050h, 09ah, 0cch, 002h, 00ah, 0d9h, 083h, 0c4h, 00ch, 0b8h, 010h, 000h, 050h
        db      0b8h, 018h, 0b2h, 050h, 0b8h, 07fh, 01bh, 050h, 09ah, 006h, 000h, 00ah, 0d9h, 083h, 0c4h, 006h
        db      0a0h, 01fh, 04ch, 098h, 040h, 050h, 0a0h, 01eh, 04ch, 098h, 08bh, 0c8h, 058h, 0f7h, 0e9h, 089h
        db      046h, 0fah, 0a0h, 01fh, 04ch, 098h, 050h, 0a0h, 01eh, 04ch, 098h, 050h, 0ffh, 036h, 061h, 053h
        db      09ah, 035h, 001h, 091h, 0d3h, 083h, 0c4h, 006h, 0a3h, 05fh, 053h, 0b8h, 004h, 000h, 050h, 08bh
        db      05eh, 0fah, 0d1h, 0e3h, 0ffh, 0b7h, 0a8h, 00bh, 0ffh, 0b7h, 09eh, 00bh, 0b8h, 005h, 000h, 050h
        db      0b8h, 05fh, 053h, 050h, 0b8h, 081h, 01bh, 050h, 09ah, 0cch, 002h, 00ah, 0d9h, 083h, 0c4h, 00ch
        db      0b8h, 003h, 000h, 050h, 0b8h, 06ah, 00bh, 050h, 0b8h, 01eh, 04ch, 050h, 0b8h, 088h, 01bh, 050h
        db      09ah, 0cdh, 000h, 00ah, 0d9h, 083h, 0c4h, 008h, 033h, 0c0h, 050h, 0b8h, 002h, 000h, 050h, 09ah
        db      027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 005h, 000h, 050h, 0b8h, 002h, 000h, 050h, 09ah
        db      05eh, 006h, 00ah, 0d9h, 083h, 0c4h, 004h, 0a0h, 0a7h, 094h, 024h, 001h, 0a2h, 03bh, 0b2h, 0a1h
        db      0d8h, 094h, 0a3h, 03ch, 0b2h, 0b8h, 006h, 000h, 050h, 0b8h, 068h, 01bh, 050h, 0b8h, 03bh, 0b2h
        db      050h, 0b8h, 08ah, 01bh, 050h, 09ah, 0cdh, 000h, 00ah, 0d9h, 083h, 0c4h, 008h, 033h, 0c0h, 050h
        db      0b8h, 0e7h, 003h, 050h, 0b8h, 001h, 000h, 050h, 0b8h, 003h, 000h, 050h, 0b8h, 03ch, 0b2h, 050h
        db      0b8h, 0a9h, 01bh, 050h, 09ah, 0cch, 002h, 00ah, 0d9h, 083h, 0c4h, 00ch, 033h, 0c0h, 050h, 0b8h
        db      003h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 0aah, 01bh, 050h, 09ah
        db      000h, 000h, 073h, 0dah, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 004h, 000h, 050h, 09ah, 027h
        db      000h, 080h, 0d8h, 083h, 0c4h, 004h, 0a0h, 04ch, 0a0h, 088h, 046h, 0e2h, 0b8h, 008h, 000h, 050h
        db      0b8h, 063h, 000h, 050h, 0b8h, 001h, 000h, 050h, 0b8h, 002h, 000h, 050h, 08dh, 046h, 0e2h, 050h
        db      0b8h, 0b5h, 01bh, 050h, 09ah, 0cch, 002h, 00ah, 0d9h, 083h, 0c4h, 00ch, 0b8h, 010h, 000h, 050h
        db      0b8h, 052h, 08eh, 050h, 0b8h, 0bbh, 01bh, 050h, 09ah, 006h, 000h, 00ah, 0d9h, 083h, 0c4h, 006h
        db      0b8h, 008h, 000h, 050h, 0b8h, 010h, 000h, 050h, 0b8h, 001h, 000h, 050h, 0b8h, 002h, 000h, 050h
        db      0b8h, 03eh, 0b2h, 050h, 0b8h, 0bdh, 01bh, 050h, 09ah, 0cch, 002h, 00ah, 0d9h, 083h, 0c4h, 00ch
        db      0b8h, 001h, 000h, 050h, 0b8h, 0b2h, 00bh, 050h, 0b8h, 040h, 0b2h, 050h, 0b8h, 0c2h, 01bh, 050h
        db      09ah, 0cdh, 000h, 00ah, 0d9h, 083h, 0c4h, 008h, 0b8h, 029h, 0b2h, 050h, 0a0h, 03eh, 0b2h, 098h
        db      050h, 0a0h, 040h, 0b2h, 098h, 050h, 09ah, 064h, 011h, 02ah, 0c2h, 083h, 0c4h, 006h, 0b8h, 008h
        db      000h, 050h, 0b8h, 029h, 0b2h, 050h, 0b8h, 0c3h, 01bh, 050h, 09ah, 006h, 000h, 00ah, 0d9h, 083h
        db      0c4h, 006h, 033h, 0c0h, 050h, 0b8h, 005h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h
        db      004h, 033h, 0c0h, 050h, 0b8h, 0c8h, 000h, 050h, 0b8h, 001h, 000h, 050h, 0b8h, 003h, 000h, 050h
        db      0b8h, 046h, 0b2h, 050h, 0b8h, 0c5h, 01bh, 050h, 09ah, 0cch, 002h, 00ah, 0d9h, 083h, 0c4h, 00ch
        db      033h, 0c0h, 050h, 0b8h, 080h, 000h, 050h, 033h, 0c0h, 050h, 0b8h, 003h, 000h, 050h, 0b8h, 048h
        db      0b2h, 050h, 0b8h, 0cbh, 01bh, 050h, 09ah, 0cch, 002h, 00ah, 0d9h, 083h, 0c4h, 00ch, 0b8h, 008h
        db      000h, 050h, 0b8h, 010h, 000h, 050h, 033h, 0c0h, 050h, 0b8h, 002h, 000h, 050h, 0b8h, 03fh, 0b2h
        db      050h, 0b8h, 0d6h, 01bh, 050h, 09ah, 0cch, 002h, 00ah, 0d9h, 083h, 0c4h, 00ch, 0b8h, 001h, 000h
        db      050h, 0b8h, 0b2h, 00bh, 050h, 0b8h, 041h, 0b2h, 050h, 0b8h, 0deh, 01bh, 050h, 09ah, 0cdh, 000h
        db      00ah, 0d9h, 083h, 0c4h, 008h, 0b8h, 032h, 0b2h, 050h, 0a0h, 03fh, 0b2h, 098h, 050h, 0a0h, 041h
        db      0b2h, 098h, 050h, 09ah, 064h, 011h, 02ah, 0c2h, 083h, 0c4h, 006h, 0b8h, 008h, 000h, 050h, 0b8h
        db      032h, 0b2h, 050h, 0b8h, 0dfh, 01bh, 050h, 09ah, 006h, 000h, 00ah, 0d9h, 083h, 0c4h, 006h, 09ah
        db      016h, 00eh, 02ah, 0c2h, 0b8h, 0e1h, 01bh, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h
        db      09ah, 068h, 010h, 02ah, 0c2h, 09ah, 0a2h, 010h, 02ah, 0c2h, 09ah, 0dah, 010h, 02ah, 0c2h, 09ah
        db      012h, 011h, 02ah, 0c2h, 09ah, 098h, 000h, 061h, 0d8h, 0a0h, 0a6h, 094h, 098h, 089h, 046h, 0f6h
        db      0c7h, 046h, 0fch, 000h, 000h, 083h, 07eh, 0fch, 000h, 074h, 003h, 0e9h, 0e3h, 00ah, 0a0h, 0a6h
        db      094h, 098h, 03bh, 046h, 0f6h, 074h, 01fh, 080h, 03eh, 011h, 07eh, 000h, 075h, 018h, 0b8h, 01ch
        db      098h, 050h, 09ah, 008h, 000h, 05eh, 0d5h, 083h, 0c4h, 002h, 09ah, 001h, 000h, 0c9h, 0d4h, 0a0h
        db      0a6h, 094h, 098h, 089h, 046h, 0f6h, 0b8h, 004h, 000h, 050h, 09ah, 02ah, 000h, 07fh, 0d9h, 083h
        db      0c4h, 002h, 089h, 046h, 0feh, 085h, 0c0h, 074h, 003h, 0e9h, 0deh, 007h, 0a0h, 01dh, 0a6h, 098h
        db      0e9h, 0c7h, 007h, 080h, 03eh, 0d3h, 08ch, 000h, 074h, 02bh, 09ah, 050h, 000h, 080h, 0d8h, 0b8h
        db      0d8h, 0ffh, 050h, 09ah, 003h, 000h, 053h, 0deh, 083h, 0c4h, 002h, 09ah, 056h, 000h, 080h, 0d8h
        db      0a0h, 0d4h, 08ch, 098h, 089h, 046h, 0f4h, 033h, 0c0h, 050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h
        db      0c4h, 002h, 0e9h, 0a2h, 007h, 080h, 03eh, 010h, 07eh, 000h, 075h, 003h, 0e9h, 075h, 000h, 0a0h
        db      034h, 09dh, 098h, 03bh, 046h, 0f4h, 075h, 007h, 0c6h, 006h, 035h, 09dh, 000h, 0ebh, 046h, 080h
        db      03eh, 0a6h, 094h, 001h, 075h, 03fh, 0ffh, 076h, 0f4h, 09ah, 00bh, 000h, 002h, 0d6h, 083h, 0c4h
        db      002h, 085h, 0c0h, 075h, 030h, 0c6h, 006h, 035h, 09dh, 000h, 0b8h, 004h, 000h, 050h, 09ah, 0cah
        db      000h, 09bh, 0dah, 050h, 0b8h, 055h, 07eh, 050h, 08bh, 016h, 09ch, 09bh, 0a1h, 09ah, 09bh, 005h
        db      01ch, 000h, 083h, 0d2h, 000h, 052h, 050h, 09ah, 003h, 000h, 099h, 0dah, 083h, 0c4h, 00ah, 08bh
        db      046h, 0f4h, 0a2h, 035h, 09dh, 0a0h, 034h, 09dh, 098h, 089h, 046h, 0f4h, 033h, 0c0h, 050h, 09ah
        db      05fh, 009h, 07fh, 0d9h, 083h, 0c4h, 002h, 09ah, 01eh, 012h, 02ah, 0c2h, 0c6h, 006h, 007h, 055h
        db      000h, 0e9h, 023h, 007h, 080h, 03eh, 0c9h, 08ch, 000h, 074h, 009h, 09ah, 00bh, 000h, 056h, 0d6h
        db      0feh, 00eh, 0cbh, 08ch, 0c6h, 006h, 035h, 09dh, 000h, 0b8h, 001h, 000h, 050h, 0ffh, 076h, 0f4h
        db      0b8h, 0a6h, 094h, 050h, 09ah, 002h, 000h, 0a8h, 0d6h, 083h, 0c4h, 006h, 09ah, 001h, 000h, 0c9h
        db      0d4h, 0a0h, 04ch, 0a0h, 088h, 046h, 0e2h, 08dh, 046h, 0f4h, 050h, 09ah, 0c1h, 012h, 02ah, 0c2h
        db      083h, 0c4h, 002h, 09ah, 002h, 000h, 08ah, 0d7h, 080h, 00eh, 0dbh, 08ch, 040h, 080h, 00eh, 0dah
        db      08ch, 080h, 0e9h, 0d2h, 006h, 080h, 03eh, 0a6h, 094h, 000h, 07dh, 052h, 08dh, 046h, 0e3h, 050h
        db      0b8h, 0ffh, 0ffh, 050h, 033h, 0c0h, 050h, 09ah, 008h, 000h, 066h, 0d6h, 083h, 0c4h, 006h, 08dh
        db      046h, 0e3h, 050h, 0b8h, 018h, 0b2h, 050h, 09ah, 003h, 000h, 076h, 0f2h, 083h, 0c4h, 004h, 085h
        db      0c0h, 074h, 02bh, 0ffh, 076h, 0f4h, 09ah, 00dh, 000h, 0bch, 0d5h, 083h, 0c4h, 002h, 08ah, 046h
        db      0e2h, 0a2h, 04ch, 0a0h, 098h, 08bh, 0d8h, 08ah, 087h, 0e8h, 094h, 0a2h, 036h, 09dh, 033h, 0c0h
        db      050h, 09ah, 008h, 000h, 075h, 0deh, 083h, 0c4h, 002h, 09ah, 002h, 000h, 08ah, 0d7h, 0b8h, 018h
        db      0b2h, 050h, 0b8h, 0ffh, 0ffh, 050h, 0a0h, 034h, 09dh, 098h, 050h, 09ah, 00ch, 000h, 000h, 0d7h
        db      083h, 0c4h, 006h, 0b8h, 001h, 000h, 050h, 0a0h, 034h, 09dh, 098h, 050h, 09ah, 005h, 000h, 085h
        db      0d4h, 083h, 0c4h, 004h, 0e9h, 050h, 006h, 080h, 03eh, 0a6h, 094h, 000h, 07dh, 03ch, 0ffh, 076h
        db      0f4h, 09ah, 00dh, 000h, 0bch, 0d5h, 083h, 0c4h, 002h, 085h, 0c0h, 075h, 02dh, 0a0h, 034h, 09dh
        db      098h, 050h, 0b8h, 018h, 0b2h, 050h, 09ah, 088h, 001h, 066h, 0d6h, 083h, 0c4h, 004h, 08ah, 046h
        db      0e2h, 0a2h, 04ch, 0a0h, 098h, 08bh, 0d8h, 08ah, 087h, 0e8h, 094h, 0a2h, 036h, 09dh, 0b8h, 001h
        db      000h, 050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h, 002h, 09ah, 0b6h, 00dh, 02ah, 0c2h, 0e9h
        db      005h, 006h, 0a0h, 01fh, 04ch, 098h, 040h, 050h, 0a0h, 01eh, 04ch, 098h, 08bh, 0c8h, 058h, 0f7h
        db      0e9h, 089h, 046h, 0fah, 0d1h, 0e0h, 08bh, 0d8h, 0ffh, 0b7h, 0a8h, 00bh, 0ffh, 0b7h, 09eh, 00bh
        db      0b8h, 002h, 000h, 050h, 09ah, 0c0h, 00ah, 07fh, 0d9h, 083h, 0c4h, 006h, 033h, 0c0h, 050h, 09ah
        db      008h, 000h, 075h, 0deh, 083h, 0c4h, 002h, 0e9h, 0cdh, 005h, 080h, 03eh, 010h, 07eh, 000h, 074h
        db      008h, 09ah, 012h, 011h, 02ah, 0c2h, 0e9h, 0beh, 005h, 080h, 03eh, 0a6h, 094h, 0ffh, 075h, 04bh
        db      0a0h, 034h, 09dh, 098h, 050h, 09ah, 00dh, 000h, 0bch, 0d5h, 083h, 0c4h, 002h, 08ah, 046h, 0e2h
        db      0a2h, 04ch, 0a0h, 098h, 08bh, 0d8h, 08ah, 087h, 0e8h, 094h, 0a2h, 036h, 09dh, 0a1h, 0d8h, 094h
        db      0a3h, 03ch, 0b2h, 0a0h, 034h, 09dh, 098h, 050h, 0b8h, 018h, 0b2h, 050h, 09ah, 088h, 001h, 066h
        db      0d6h, 083h, 0c4h, 004h, 0b8h, 001h, 000h, 050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h, 002h
        db      033h, 0c0h, 050h, 09ah, 008h, 000h, 075h, 0deh, 083h, 0c4h, 002h, 0a0h, 0a7h, 094h, 098h, 08bh
        db      0c8h, 081h, 0e1h, 0feh, 0ffh, 0a0h, 03bh, 0b2h, 098h, 00bh, 0c8h, 08bh, 0c1h, 0a2h, 0a7h, 094h
        db      0b8h, 001h, 000h, 050h, 0a0h, 034h, 09dh, 098h, 050h, 09ah, 005h, 000h, 085h, 0d4h, 083h, 0c4h
        db      004h, 09ah, 012h, 011h, 02ah, 0c2h, 0e9h, 03eh, 005h, 080h, 03eh, 010h, 07eh, 000h, 075h, 007h
        db      080h, 03eh, 03bh, 0b2h, 000h, 075h, 008h, 09ah, 012h, 011h, 02ah, 0c2h, 0e9h, 028h, 005h, 080h
        db      03eh, 0a6h, 094h, 0ffh, 075h, 045h, 0a0h, 034h, 09dh, 098h, 050h, 09ah, 00dh, 000h, 0bch, 0d5h
        db      083h, 0c4h, 002h, 08ah, 046h, 0e2h, 0a2h, 04ch, 0a0h, 098h, 08bh, 0d8h, 08ah, 087h, 0e8h, 094h
        db      0a2h, 036h, 09dh, 0a0h, 034h, 09dh, 098h, 050h, 0b8h, 018h, 0b2h, 050h, 09ah, 088h, 001h, 066h
        db      0d6h, 083h, 0c4h, 004h, 0b8h, 001h, 000h, 050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h, 002h
        db      033h, 0c0h, 050h, 09ah, 008h, 000h, 075h, 0deh, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0a0h, 034h
        db      09dh, 098h, 050h, 0b8h, 0a6h, 094h, 050h, 09ah, 002h, 000h, 0a8h, 0d6h, 083h, 0c4h, 006h, 0a1h
        db      03ch, 0b2h, 03bh, 006h, 0d6h, 094h, 07eh, 00bh, 0a1h, 0d6h, 094h, 0a3h, 03ch, 0b2h, 09ah, 012h
        db      011h, 02ah, 0c2h, 0a1h, 03ch, 0b2h, 0a3h, 0d8h, 094h, 0f6h, 006h, 0a7h, 094h, 002h
        db      "t,P3"
        db      0c0h, 050h, 09ah, 071h, 000h, 0eeh, 0d6h, 083h, 0c4h, 004h, 089h, 016h, 0c2h, 094h, 0a3h, 0c0h
        db      094h, 0ffh, 036h, 0d8h, 094h, 0b8h, 0a6h, 094h, 050h, 09ah, 002h, 000h, 0aeh, 0d7h, 083h, 0c4h
        db      004h, 089h, 016h, 0c6h, 094h, 0a3h, 0c4h, 094h, 0ebh, 00ch, 0b8h, 0a6h, 094h, 050h, 09ah, 001h
        db      000h, 024h, 0d7h, 083h, 0c4h, 002h, 0c7h, 006h, 038h, 09dh, 000h, 010h, 080h, 03eh, 092h, 09fh
        db      000h, 074h, 055h, 0c7h, 046h, 0f8h, 000h, 000h, 0ebh, 027h, 08bh, 046h, 0f8h, 08bh, 0d0h, 0d1h
        db      0e0h, 003h, 0c2h, 0d1h, 0e0h, 08bh, 0d8h, 08bh, 016h, 0c6h, 094h, 0a1h, 0c4h, 094h, 03bh, 097h
        db      03ch, 09dh, 072h, 008h, 075h, 008h, 03bh, 087h, 03ah, 09dh, 073h, 002h, 0ebh, 00fh, 0ffh, 046h
        db      0f8h, 0a0h, 092h, 09fh, 02ah, 0e4h, 08bh, 04eh, 0f8h, 03bh, 0c8h, 072h, 0cdh, 083h, 07eh, 0f8h
        db      000h, 074h, 015h, 08bh, 046h, 0f8h, 048h, 08bh, 0d0h, 0d1h, 0e0h, 003h, 0c2h, 0d1h, 0e0h, 08bh
        db      0d8h, 08bh, 087h, 03eh, 09dh, 0a3h, 038h, 09dh, 0b8h, 0bbh, 053h, 050h, 0ffh, 036h, 0d2h, 094h
        db      0ffh, 036h, 0d0h, 094h, 09ah, 00fh, 000h, 047h, 0d4h, 083h, 0c4h, 006h, 0b8h, 001h, 000h, 050h
        db      0a0h, 034h, 09dh, 098h, 050h, 09ah, 005h, 000h, 085h, 0d4h, 083h, 0c4h, 004h, 0e9h, 0e5h, 003h
        db      080h, 03eh, 0c9h, 08ch, 000h, 074h, 009h, 09ah, 00bh, 000h, 056h, 0d6h, 0feh, 00eh, 0cbh, 08ch
        db      08ah, 046h, 0e2h, 0a2h, 04ch, 0a0h, 098h, 08bh, 0d8h, 080h, 0bfh, 0e8h, 094h, 0ffh, 075h, 00ch
        db      0b8h, 0a6h, 094h, 050h, 09ah, 008h, 000h, 02eh, 0d6h, 083h, 0c4h, 002h, 0a0h, 04ch, 0a0h, 098h
        db      08bh, 0d8h, 08ah, 087h, 0e8h, 094h, 0a2h, 036h, 09dh, 0b8h, 052h, 08eh, 050h, 0a0h, 036h, 09dh
        db      098h, 050h, 0a0h, 034h, 09dh, 098h, 050h, 09ah, 008h, 000h, 066h, 0d6h, 083h, 0c4h, 006h, 0b8h
        db      008h, 000h, 050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h, 002h, 09ah, 068h, 010h, 02ah, 0c2h
        db      09ah, 0cdh, 00eh, 02ah, 0c2h, 0b8h, 00ch, 000h, 050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h
        db      002h, 0b8h, 00dh, 000h, 050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h, 002h, 09ah, 052h, 00eh
        db      02ah, 0c2h, 09ah, 0c3h, 000h, 0d6h, 0d6h, 0e9h, 05bh, 003h, 080h, 03eh, 010h, 07eh, 000h, 074h
        db      03bh, 0b8h, 052h, 08eh, 050h, 0a0h, 036h, 09dh, 098h, 050h, 0a0h, 034h, 09dh, 098h, 050h, 09ah
        db      00ch, 000h, 000h, 0d7h, 083h, 0c4h, 006h, 0b8h, 052h, 08eh, 050h, 0a0h, 036h, 09dh, 098h, 050h
        db      0a0h, 034h, 09dh, 098h, 050h, 09ah, 008h, 000h, 066h, 0d6h, 083h, 0c4h, 006h, 0b8h, 008h, 000h
        db      050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h, 002h, 0e9h, 019h, 003h, 0b8h, 052h, 08eh, 050h
        db      0a0h, 036h, 09dh, 098h, 050h, 0a0h, 034h, 09dh, 098h, 050h, 09ah, 006h, 000h, 083h, 0d6h, 083h
        db      0c4h, 006h, 0b8h, 018h, 0b2h, 050h, 0b8h, 0ffh, 0ffh, 050h, 0a0h, 034h, 09dh, 098h, 050h, 09ah
        db      008h, 000h, 066h, 0d6h, 083h, 0c4h, 006h, 0b8h, 001h, 000h, 050h, 09ah, 05fh, 009h, 07fh, 0d9h
        db      083h, 0c4h, 002h, 033h, 0c0h, 050h, 09ah, 008h, 000h, 075h, 0deh, 083h, 0c4h, 002h, 09ah, 01eh
        db      012h, 02ah, 0c2h, 0e9h, 0cfh, 002h, 080h, 03eh, 0a6h, 094h, 000h, 07dh, 047h, 0ffh, 076h, 0f4h
        db      09ah, 00dh, 000h, 0bch, 0d5h, 083h, 0c4h, 002h, 085h, 0c0h, 075h, 038h, 0a0h, 034h, 09dh, 098h
        db      050h, 0b8h, 018h, 0b2h, 050h, 09ah, 088h, 001h, 066h, 0d6h, 083h, 0c4h, 004h, 08ah, 046h, 0e2h
        db      0a2h, 04ch, 0a0h, 098h, 08bh, 0d8h, 08ah, 087h, 0e8h, 094h, 0a2h, 036h, 09dh, 0b8h, 001h, 000h
        db      050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 09ah, 008h, 000h, 075h
        db      0deh, 083h, 0c4h, 002h, 0a0h, 036h, 09dh, 098h, 08bh, 0d8h, 0f6h, 087h, 04ch, 095h, 002h, 075h
        db      045h, 080h, 03eh, 010h, 07eh, 000h, 075h, 03eh, 0a0h, 036h, 09dh, 098h, 08bh, 0d8h, 080h, 08fh
        db      04ch, 095h, 002h, 0a0h, 04ch, 0a0h, 098h, 050h, 0b8h, 052h, 08eh, 050h, 09ah, 03ah, 001h, 066h
        db      0d6h, 083h, 0c4h, 004h, 0b8h, 052h, 08eh, 050h, 0a0h, 036h, 09dh, 098h, 050h, 0a0h, 034h, 09dh
        db      098h, 050h, 09ah, 006h, 000h, 083h, 0d6h, 083h, 0c4h, 006h, 0b8h, 008h, 000h, 050h, 09ah, 05fh
        db      009h, 07fh, 0d9h, 083h, 0c4h, 002h, 0a0h, 04ch, 0a0h, 098h, 08bh, 0d8h, 080h, 0bfh, 0e8h, 094h
        db      0ffh, 075h, 00ch, 0b8h, 0a6h, 094h, 050h, 09ah, 008h, 000h, 02eh, 0d6h, 083h, 0c4h, 002h, 0a1h
        db      046h, 0b2h, 050h, 0a0h, 036h, 09dh, 098h, 08bh, 0d8h, 058h, 088h, 087h, 078h, 096h, 080h, 03eh
        db      01dh, 0a6h, 00dh, 075h, 056h, 0ffh, 036h, 048h, 0b2h, 0a0h, 036h, 09dh, 098h, 050h, 09ah, 00ch
        db      000h, 0d6h, 0d6h, 083h, 0c4h, 004h, 0b8h, 0ffh, 0ffh, 050h, 0a0h, 036h, 09dh, 098h, 050h, 09ah
        db      00ch, 000h, 0d6h, 0d6h, 083h, 0c4h, 004h, 0a3h, 048h, 0b2h, 0b8h, 00dh, 000h, 050h, 09ah, 05fh
        db      009h, 07fh, 0d9h, 083h, 0c4h, 002h, 083h, 03eh, 048h, 0b2h, 000h, 074h, 01eh, 0a0h, 036h, 09dh
        db      098h, 08bh, 0d8h, 0f6h, 087h, 04ch, 095h, 001h, 075h, 011h, 0a1h, 048h, 0b2h, 048h, 0a2h, 08ch
        db      08dh, 080h, 00eh, 0dbh, 08ch, 010h, 080h, 00eh, 0dah, 08ch, 080h, 0b8h, 001h, 000h, 050h, 0a0h
        db      034h, 09dh, 098h, 050h, 09ah, 005h, 000h, 085h, 0d4h, 083h, 0c4h, 004h, 0e9h, 096h, 001h, 080h
        db      03eh, 010h, 07eh, 000h, 074h, 003h, 0e9h, 0c8h, 000h, 080h, 03eh, 0d3h, 08ch, 000h, 075h, 05ah
        db      033h, 0c0h, 050h, 0ffh, 076h, 0f4h, 0b8h, 0a6h, 094h, 050h, 09ah, 002h, 000h, 0a8h, 0d6h, 083h
        db      0c4h, 006h, 0b9h, 0ffh, 0ffh, 03bh, 0c1h, 075h, 035h, 0ffh, 076h, 0f4h, 09ah, 00dh, 000h, 0bch
        db      0d5h, 083h, 0c4h, 002h, 085h, 0c0h, 075h, 026h, 08ah, 046h, 0e2h, 0a2h, 04ch, 0a0h, 098h, 08bh
        db      0d8h, 08ah, 087h, 0e8h, 094h, 0a2h, 036h, 09dh, 0a0h, 034h, 09dh, 098h, 050h, 0b8h, 018h, 0b2h
        db      050h, 09ah, 088h, 001h, 066h, 0d6h, 083h, 0c4h, 004h, 09ah, 002h, 000h, 08ah, 0d7h, 0b8h, 001h
        db      000h, 050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h, 002h, 0a0h, 036h, 09dh, 098h, 08bh, 0d8h
        db      0f6h, 087h, 04ch, 095h, 002h, 075h, 03eh, 0a0h, 036h, 09dh, 098h, 08bh, 0d8h, 080h, 08fh, 04ch
        db      095h, 002h, 0a0h, 04ch, 0a0h, 098h, 050h, 0b8h, 052h, 08eh, 050h, 09ah, 03ah, 001h, 066h, 0d6h
        db      083h, 0c4h, 004h, 0b8h, 052h, 08eh, 050h, 0a0h, 036h, 09dh, 098h, 050h, 0a0h, 034h, 09dh, 098h
        db      050h, 09ah, 006h, 000h, 083h, 0d6h, 083h, 0c4h, 006h, 0b8h, 008h, 000h, 050h, 09ah, 05fh, 009h
        db      07fh, 0d9h, 083h, 0c4h, 002h, 09ah, 01eh, 012h, 02ah, 0c2h, 09ah, 07ah, 00fh, 02ah, 0c2h, 09ah
        db      052h, 00eh, 02ah, 0c2h, 033h, 0c0h, 050h, 09ah, 008h, 000h, 075h, 0deh, 083h, 0c4h, 002h, 0ebh
        db      048h, 0a0h, 042h, 0b2h, 0a2h, 03eh, 0b2h, 0a0h, 043h, 0b2h, 0a2h, 03fh, 0b2h, 0a0h, 044h, 0b2h
        db      0a2h, 040h, 0b2h, 0a0h, 045h, 0b2h, 0a2h, 041h, 0b2h, 0b8h, 009h, 000h, 050h, 09ah, 05fh, 009h
        db      07fh, 0d9h, 083h, 0c4h, 002h, 0b8h, 00ah, 000h, 050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h
        db      002h, 0b8h, 00eh, 000h, 050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h, 002h, 0b8h, 00fh, 000h
        db      050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h, 002h, 0b8h, 001h, 000h, 050h, 0a0h, 034h, 09dh
        db      098h, 050h, 09ah, 005h, 000h, 085h, 0d4h, 083h, 0c4h, 004h, 0ebh, 069h, 0b8h, 029h, 0b2h, 050h
        db      0a0h, 03eh, 0b2h, 098h, 050h, 0a0h, 040h, 0b2h, 098h, 050h, 09ah, 0d0h, 011h, 02ah, 0c2h, 083h
        db      0c4h, 006h, 09ah, 052h, 00eh, 02ah, 0c2h, 0ebh, 04ch, 0b8h, 032h, 0b2h, 050h, 0a0h, 03fh, 0b2h
        db      098h, 050h, 0a0h, 041h, 0b2h, 098h, 050h, 09ah, 0d0h, 011h, 02ah, 0c2h, 083h, 0c4h, 006h, 09ah
        db      052h, 00eh, 02ah, 0c2h, 0ebh, 02fh, 011h, 003h, 013h, 004h, 095h, 004h, 0e0h, 004h, 0e5h, 00ah
        db      018h, 005h, 0a7h, 005h, 000h, 007h, 08ah, 007h, 04fh, 009h, 04fh, 009h, 07ch, 00ah, 016h, 008h
        db      016h, 008h, 04fh, 009h, 04fh, 009h, 099h, 00ah, 03dh, 011h, 000h, 073h, 008h, 093h, 0d1h, 0e3h
        db      02eh, 0ffh, 0a7h, 0b6h, 00ah, 0e9h, 00ch, 0f8h, 08bh, 046h, 0feh, 0e9h, 0a7h, 002h, 09ah, 007h
        db      010h, 02ah, 0c2h, 085h, 0c0h, 074h, 004h, 033h, 0c0h, 0ebh, 003h, 0b8h, 001h, 000h, 050h, 09ah
        db      022h, 010h, 02ah, 0c2h, 083h, 0c4h, 002h, 09ah, 068h, 010h, 02ah, 0c2h, 09ah, 0c3h, 000h, 0d6h
        db      0d6h, 0b8h, 001h, 000h, 050h, 0a0h, 034h, 09dh, 098h, 050h, 09ah, 005h, 000h, 085h, 0d4h, 083h
        db      0c4h, 004h, 0e9h, 087h, 002h, 033h, 0c0h, 080h, 03eh, 032h, 04ch, 000h, 075h, 003h, 0b8h, 001h
        db      000h, 0a2h, 032h, 04ch, 09ah, 0a2h, 010h, 02ah, 0c2h, 0e9h, 070h, 002h, 033h, 0c0h, 080h, 03eh
        db      020h, 04ch, 000h, 075h, 003h, 0b8h, 001h, 000h, 0a2h, 020h, 04ch, 09ah, 0dah, 010h, 02ah, 0c2h
        db      09ah, 07dh, 000h, 099h, 0d7h, 0b8h, 0bbh, 053h, 050h, 0ffh, 036h, 0d2h, 094h, 0ffh, 036h, 0d0h
        db      094h, 09ah, 00fh, 000h, 047h, 0d4h, 083h, 0c4h, 006h, 033h, 0c0h, 050h, 09ah, 008h, 000h, 075h
        db      0deh, 083h, 0c4h, 002h, 0e9h, 035h, 002h, 0c6h, 006h, 0dch, 053h, 001h, 09ah, 053h, 000h, 093h
        db      0d7h, 09ah, 008h, 000h, 076h, 0e1h, 089h, 046h, 0feh, 0c7h, 046h, 0fch, 001h, 000h, 0e9h, 01bh
        db      002h, 080h, 03eh, 0d3h, 08ch, 000h, 074h, 003h, 0e9h, 011h, 002h, 080h, 03eh, 010h, 07eh, 000h
        db      074h, 003h, 0e9h, 007h, 002h, 0a0h, 008h, 055h, 098h, 089h, 046h, 0f4h, 083h, 07eh, 0f4h, 001h
        db      07dh, 005h, 0c7h, 046h, 0f4h, 001h, 000h, 083h, 07eh, 0f4h, 063h, 07eh, 005h, 0c7h, 046h, 0f4h
        db      063h, 000h, 0b8h, 001h, 000h, 050h, 0ffh, 076h, 0f4h, 0b8h, 0a6h, 094h, 050h, 09ah, 002h, 000h
        db      0a8h, 0d6h, 083h, 0c4h, 006h, 09ah, 002h, 000h, 08ah, 0d7h, 0c6h, 006h, 01ah, 08eh, 000h, 080h
        db      03eh, 01ah, 08eh, 000h, 074h, 024h, 0a0h, 01ah, 08eh, 098h, 089h, 046h, 0f4h, 0b8h, 001h, 000h
        db      050h, 0ffh, 076h, 0f4h, 0b8h, 0a6h, 094h, 050h, 09ah, 002h, 000h, 0a8h, 0d6h, 083h, 0c4h, 006h
        db      09ah, 002h, 000h, 08ah, 0d7h, 0c6h, 006h, 01ah, 08eh, 000h, 0c6h, 006h, 035h, 09dh, 000h, 0a0h
        db      04ch, 0a0h, 088h, 046h, 0e2h, 08dh, 046h, 0f4h, 050h, 09ah, 0c1h, 012h, 02ah, 0c2h, 083h, 0c4h
        db      002h, 0e9h, 088h, 001h, 0e9h, 085h, 001h, 080h, 03eh, 0d3h, 08ch, 000h, 074h, 003h, 0e9h, 0a7h
        db      000h, 033h, 0c0h, 050h, 0ffh, 076h, 0f4h, 0b8h, 0a6h, 094h, 050h, 09ah, 002h, 000h, 0a8h, 0d6h
        db      083h, 0c4h, 006h, 0b9h, 0ffh, 0ffh, 03bh, 0c1h, 075h, 06fh, 0ffh, 076h, 0f4h, 09ah, 00dh, 000h
        db      0bch, 0d5h, 083h, 0c4h, 002h, 085h, 0c0h, 075h, 060h, 08ah, 046h, 0e2h, 0a2h, 04ch, 0a0h, 098h
        db      08bh, 0d8h, 08ah, 087h, 0e8h, 094h, 0a2h, 036h, 09dh, 0a0h, 04ch, 0a0h, 098h, 050h, 0b8h, 052h
        db      08eh, 050h, 09ah, 03ah, 001h, 066h, 0d6h, 083h, 0c4h, 004h, 0a0h, 034h, 09dh, 098h, 050h, 0b8h
        db      018h, 0b2h, 050h, 09ah, 088h, 001h, 066h, 0d6h, 083h, 0c4h, 004h, 0b8h, 052h, 08eh, 050h, 0a0h
        db      036h, 09dh, 098h, 050h, 0a0h, 034h, 09dh, 098h, 050h, 09ah, 006h, 000h, 083h, 0d6h, 083h, 0c4h
        db      006h, 0b8h, 008h, 000h, 050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h, 002h, 0b8h, 001h, 000h
        db      050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h, 002h, 080h, 03eh, 011h, 07eh, 000h, 075h, 018h
        db      0b8h, 01ch, 098h, 050h, 09ah, 008h, 000h, 05eh, 0d5h, 083h, 0c4h, 002h, 09ah, 001h, 000h, 0c9h
        db      0d4h, 0a0h, 0a6h, 094h, 098h, 089h, 046h, 0f6h, 09ah, 012h, 011h, 02ah, 0c2h, 09ah, 096h, 003h
        db      0b2h, 0d3h, 0c6h, 006h, 007h, 055h, 000h, 09ah, 01eh, 012h, 02ah, 0c2h, 033h, 0c0h, 050h, 09ah
        db      008h, 000h, 075h, 0deh, 083h, 0c4h, 002h, 0e9h, 0b2h, 000h, 0f6h, 006h, 010h, 07eh, 014h, 074h
        db      018h, 033h, 0c0h, 050h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 00ah, 01ch
        db      050h, 09ah, 000h, 000h, 073h, 0dah, 083h, 0c4h, 002h, 080h, 03eh, 010h, 07eh, 000h, 075h, 005h
        db      0c7h, 046h, 0fch, 001h, 000h, 0e9h, 084h, 000h, 0f6h, 006h, 010h, 07eh, 015h, 074h, 018h, 033h
        db      0c0h, 050h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 028h, 01ch, 050h, 09ah
        db      000h, 000h, 073h, 0dah, 083h, 0c4h, 002h, 080h, 03eh, 010h, 07eh, 000h, 075h, 005h, 0c7h, 046h
        db      0fch, 001h, 000h, 0ebh, 057h, 09ah, 01eh, 012h, 02ah, 0c2h, 0ebh, 050h, 0c7h, 046h, 0fch, 001h
        db      000h, 0ebh, 049h, 045h, 000h, 04dh, 000h, 050h, 000h, 052h, 000h, 057h, 000h, 065h, 000h, 06dh
        db      000h, 072h, 000h, 075h, 000h, 078h, 000h, 079h, 000h, 07ah, 000h, 0fah, 00ch, 024h, 00ch, 0dfh
        db      00bh, 028h, 00dh, 027h, 00ch, 055h, 00dh, 091h, 00bh, 055h, 00dh, 077h, 00bh, 0eeh, 00ah, 025h
        db      00bh, 03ch, 00bh, 05ch, 00dh, 006h, 08ch, 0c9h, 08eh, 0c1h, 057h, 0bfh, 063h, 00dh, 0b9h, 00dh
        db      000h, 0fch, 0f2h, 0afh, 026h, 08bh, 04dh, 016h, 05fh, 007h, 0ffh, 0e1h, 0e9h, 014h, 0f5h, 08bh
        db      046h, 0feh, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 080h, 03eh, 0abh, 053h, 000h, 074h, 01bh
        db      0a0h, 01fh, 04ch, 098h, 050h, 0a0h, 01eh, 04ch, 098h, 050h, 0ffh, 036h, 061h, 053h, 09ah, 035h
        db      001h, 091h, 0d3h, 083h, 0c4h, 006h, 0a3h, 05fh, 053h, 0ebh, 011h, 0a0h, 01eh, 04ch, 098h, 050h
        db      0ffh, 036h, 05fh, 053h, 09ah, 0ach, 000h, 099h, 0d7h, 083h, 0c4h, 004h, 080h, 03eh, 010h, 07eh
        db      000h, 075h, 01fh, 0b8h, 0bbh, 053h, 050h, 0ffh, 036h, 0d2h, 094h, 0ffh, 036h, 0d0h, 094h, 09ah
        db      00fh, 000h, 047h, 0d4h, 083h, 0c4h, 006h, 033h, 0c0h, 050h, 09ah, 008h, 000h, 075h, 0deh, 083h
        db      0c4h, 002h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 033h, 0c0h, 050h, 0b8h, 006h, 000h, 050h
        db      09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 03fh, 01ch, 050h, 09ah, 05ch, 000h, 080h
        db      0d8h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 09ah, 008h, 000h, 075h, 0deh, 083h, 0c4h, 002h, 033h
        db      0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 08bh, 0e5h
        db      05dh, 0cbh, 055h, 08bh, 0ech, 0b8h, 009h, 000h, 050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h
        db      002h, 0b8h, 00ah, 000h, 050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h, 002h, 0b8h, 029h, 0b2h
        db      050h, 0a0h, 03eh, 0b2h, 098h, 050h, 0a0h, 040h, 0b2h, 098h, 050h, 09ah, 064h, 011h, 02ah, 0c2h
        db      083h, 0c4h, 006h, 0b8h, 00bh, 000h, 050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h, 002h, 0b8h
        db      00eh, 000h, 050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h, 002h, 0b8h, 00fh, 000h, 050h, 09ah
        db      05fh, 009h, 07fh, 0d9h, 083h, 0c4h, 002h, 0b8h, 032h, 0b2h, 050h, 0a0h, 03fh, 0b2h, 098h, 050h
        db      0a0h, 041h, 0b2h, 098h, 050h, 09ah, 064h, 011h, 02ah, 0c2h, 083h, 0c4h, 006h, 0b8h, 010h, 000h
        db      050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h, 002h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech
        db      083h, 0c4h, 0ffh, 0a0h, 036h, 09dh, 098h, 08bh, 0d8h, 08ah, 087h, 0b0h, 095h, 088h, 046h, 0ffh
        db      098h, 025h, 00fh, 000h, 040h, 0a2h, 03eh, 0b2h, 08ah, 046h, 0ffh, 0b1h, 004h, 098h, 0d3h, 0f8h
        db      0a2h, 040h, 0b2h, 0a0h, 036h, 09dh, 098h, 08bh, 0d8h, 08ah, 087h, 014h, 096h, 088h, 046h, 0ffh
        db      03ch, 0ffh, 074h, 013h, 098h, 025h, 00fh, 000h, 040h, 0a2h, 03fh, 0b2h, 08ah, 046h, 0ffh, 098h
        db      0d3h, 0f8h, 0a2h, 041h, 0b2h, 0ebh, 00ah, 0b0h, 000h, 0c6h, 006h, 041h, 0b2h, 000h, 0a2h, 03fh
        db      0b2h, 0b8h, 004h, 000h, 050h, 0a0h, 036h, 09dh, 098h, 050h, 09ah, 007h, 000h, 05fh, 0d6h, 083h
        db      0c4h, 002h, 050h, 09ah, 039h, 010h, 02ah, 0c2h, 083h, 0c4h, 004h, 0a0h, 03eh, 0b2h, 0a2h, 042h
        db      0b2h, 0a0h, 03fh, 0b2h, 0a2h, 043h, 0b2h, 0a0h, 040h, 0b2h, 0a2h, 044h, 0b2h, 0a0h, 041h, 0b2h
        db      0a2h, 045h, 0b2h, 0a0h, 036h, 09dh, 098h, 08bh, 0d8h, 08ah, 087h, 078h, 096h, 02ah, 0e4h, 0a3h
        db      046h, 0b2h, 0b8h, 0ffh, 0ffh, 050h, 0a0h, 036h, 09dh, 098h, 050h, 09ah, 00ch, 000h, 0d6h, 0d6h
        db      083h, 0c4h, 004h, 0a3h, 048h, 0b2h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 09ah, 00bh, 000h
        db      056h, 0d6h, 0a1h, 046h, 0b2h, 050h, 0a0h, 036h, 09dh, 098h, 08bh, 0d8h, 058h, 088h, 087h, 078h
        db      096h, 0a0h, 03eh, 0b2h, 098h, 050h, 0a0h, 040h, 0b2h, 098h, 050h, 09ah, 03ah, 013h, 02ah, 0c2h
        db      083h, 0c4h, 004h, 050h, 0a0h, 036h, 09dh, 098h, 08bh, 0d8h, 058h, 088h, 087h, 0b0h, 095h, 0a0h
        db      03fh, 0b2h, 098h, 050h, 0a0h, 041h, 0b2h, 098h, 050h, 09ah, 03ah, 013h, 02ah, 0c2h, 083h, 0c4h
        db      004h, 050h, 0a0h, 036h, 09dh, 098h, 08bh, 0d8h, 058h, 088h, 087h, 014h, 096h, 0a0h, 03eh, 0b2h
        db      0a2h, 042h, 0b2h, 0a0h, 03fh, 0b2h, 0a2h, 043h, 0b2h, 0a0h, 040h, 0b2h, 0a2h, 044h, 0b2h, 0a0h
        db      041h, 0b2h, 0a2h, 045h, 0b2h, 0b8h, 004h, 000h, 050h, 0a0h, 036h, 09dh, 098h, 050h, 09ah, 007h
        db      000h, 05fh, 0d6h, 083h, 0c4h, 002h, 050h, 09ah, 039h, 010h, 02ah, 0c2h, 083h, 0c4h, 004h, 0feh
        db      00eh, 0cbh, 08ch, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 0a0h, 036h, 09dh, 098h, 08bh, 0d8h
        db      0f6h, 087h, 04ch, 095h, 001h, 074h, 006h, 033h, 0c0h, 08bh, 0e5h, 05dh, 0cbh, 0b8h, 001h, 000h
        db      0ebh, 0f7h, 055h, 08bh, 0ech, 0b8h, 001h, 000h, 050h, 02bh, 046h, 006h, 050h, 09ah, 039h, 010h
        db      02ah, 0c2h, 083h, 0c4h, 004h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 07eh, 006h, 000h
        db      074h, 011h, 08ah, 046h, 008h, 050h, 0a0h, 036h, 09dh, 098h, 08bh, 0d8h, 058h, 008h, 087h, 04ch
        db      095h, 0ebh, 011h, 08ah, 046h, 008h, 0f6h, 0d0h, 050h, 0a0h, 036h, 09dh, 098h, 08bh, 0d8h, 058h
        db      020h, 087h, 04ch, 095h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 0b8h, 006h, 000h, 050h, 0b8h
        db      007h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 09ah, 007h, 010h, 02ah, 0c2h
        db      085h, 0c0h, 075h, 00eh, 0b8h, 068h, 01ch, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h
        db      0ebh, 00ch, 0b8h, 06ch, 01ch, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 08bh, 0e5h
        db      05dh, 0cbh, 055h, 08bh, 0ech, 0b8h, 010h, 000h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 027h, 000h
        db      080h, 0d8h, 083h, 0c4h, 004h, 080h, 03eh, 032h, 04ch, 000h, 075h, 00eh, 0b8h, 070h, 01ch, 050h
        db      09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 0ebh, 00ch, 0b8h, 074h, 01ch, 050h, 09ah, 05ch
        db      000h, 080h, 0d8h, 083h, 0c4h, 002h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 0b8h, 01ah, 000h
        db      050h, 0b8h, 007h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 080h, 03eh, 020h
        db      04ch, 000h, 075h, 00eh, 0b8h, 078h, 01ch, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h
        db      0ebh, 00ch, 0b8h, 07ch, 01ch, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 08bh, 0e5h
        db      05dh, 0cbh, 055h, 08bh, 0ech, 0a0h, 0a7h, 094h, 024h, 001h, 0a2h, 03bh, 0b2h, 0a1h, 0d8h, 094h
        db      0a3h, 03ch, 0b2h, 0b8h, 005h, 000h, 050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h, 002h, 080h
        db      03eh, 03bh, 0b2h, 000h, 075h, 01eh, 0b8h, 024h, 000h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 027h
        db      000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 080h, 01ch, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h
        db      0c4h, 002h, 0ebh, 00ch, 0b8h, 006h, 000h, 050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h, 002h
        db      08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0feh, 0ffh, 076h, 008h, 0ffh, 076h, 006h
        db      09ah, 03ah, 013h, 02ah, 0c2h, 083h, 0c4h, 004h, 089h, 046h, 0feh, 083h, 07eh, 0feh, 0ffh, 075h
        db      013h, 0b8h, 084h, 01ch, 050h, 0ffh, 076h, 00ah, 09ah, 00ah, 000h, 063h, 0f2h, 083h, 0c4h, 004h
        db      08bh, 0e5h, 05dh, 0cbh, 0a0h, 01ch, 050h, 098h, 08bh, 04eh, 0feh, 081h, 0e1h, 00fh, 000h, 03bh
        db      0c1h, 075h, 011h, 0b8h, 08dh, 01ch, 050h, 0ffh, 076h, 00ah, 09ah, 00ah, 000h, 063h, 0f2h, 083h
        db      0c4h, 004h, 0ebh, 0dch, 08bh, 046h, 0feh, 08bh, 0d0h, 0b1h, 003h, 0d3h, 0e0h, 003h, 0c2h, 005h
        db      033h, 04ch, 050h, 0ffh, 076h, 00ah, 09ah, 00ah, 000h, 063h, 0f2h, 083h, 0c4h, 004h, 0ebh, 0c0h
        db      055h, 08bh, 0ech, 083h, 0c4h, 0feh, 0ffh, 076h, 008h, 0ffh, 076h, 006h, 09ah, 03ah, 013h, 02ah
        db      0c2h, 083h, 0c4h, 004h, 089h, 046h, 0feh, 083h, 07eh, 0feh, 0ffh, 075h, 004h, 08bh, 0e5h, 05dh
        db      0cbh, 0a0h, 01ch, 050h, 098h, 08bh, 04eh, 0feh, 081h, 0e1h, 00fh, 000h, 03bh, 0c1h, 075h, 002h
        db      0ebh, 0ebh, 0ffh, 076h, 00ah, 08bh, 046h, 0feh, 08bh, 0d0h, 0b1h, 003h, 0d3h, 0e0h, 003h, 0c2h
        db      005h, 033h, 04ch, 050h, 09ah, 00ah, 000h, 063h, 0f2h, 083h, 0c4h, 004h, 0ebh, 0cfh, 055h, 08bh
        db      0ech, 033h, 0c0h, 050h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 080h, 03eh, 035h
        db      09dh, 000h, 07eh, 013h, 0a0h, 035h, 09dh, 098h, 050h, 0b8h, 096h, 01ch, 050h, 09ah, 006h, 000h
        db      08eh, 0d8h, 083h, 0c4h, 004h, 0ebh, 028h, 080h, 03eh, 0a6h, 094h, 000h, 074h, 007h, 080h, 03eh
        db      0a6h, 094h, 002h, 075h, 00eh, 0b8h, 0c0h, 01ch, 050h, 09ah, 000h, 000h, 073h, 0dah, 083h, 0c4h
        db      002h, 0ebh, 00ch, 0b8h, 0dbh, 01ch, 050h, 09ah, 000h, 000h, 073h, 0dah, 083h, 0c4h, 002h, 08bh
        db      0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0feh, 0b8h, 018h, 0b2h, 050h, 0b8h, 0ffh, 0ffh
        db      050h, 0a0h, 034h, 09dh, 098h, 050h, 09ah, 008h, 000h, 066h, 0d6h, 083h, 0c4h, 006h, 0b8h, 052h
        db      08eh, 050h, 0a0h, 036h, 09dh, 098h, 050h, 0a0h, 034h, 09dh, 098h, 050h, 09ah, 008h, 000h, 066h
        db      0d6h, 083h, 0c4h, 006h, 09ah, 0cdh, 00eh, 02ah, 0c2h, 080h, 03eh, 0d3h, 08ch, 000h, 074h, 006h
        db      0a0h, 0d4h, 08ch, 098h, 0ebh, 004h, 0a0h, 034h, 09dh, 098h, 089h, 046h, 0feh, 08bh, 0e5h, 05dh
        db      0cbh, 055h, 08bh, 0ech, 09ah, 073h, 012h, 02ah, 0c2h, 08bh, 05eh, 006h, 089h, 007h, 033h, 0c0h
        db      050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h, 002h, 0b8h, 001h, 000h, 050h, 09ah, 05fh, 009h
        db      07fh, 0d9h, 083h, 0c4h, 002h, 0b8h, 007h, 000h, 050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h
        db      002h, 0b8h, 008h, 000h, 050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h, 002h, 0b8h, 00ch, 000h
        db      050h, 09ah, 05fh, 009h, 07fh, 0d9h, 083h, 0c4h, 002h, 0b8h, 00dh, 000h, 050h, 09ah, 05fh, 009h
        db      07fh, 0d9h, 083h, 0c4h, 002h, 09ah, 012h, 011h, 02ah, 0c2h, 09ah, 068h, 010h, 02ah, 0c2h, 09ah
        db      052h, 00eh, 02ah, 0c2h, 0a0h, 010h, 07eh, 098h, 050h, 09ah, 008h, 000h, 075h, 0deh, 083h, 0c4h
        db      002h, 09ah, 01eh, 012h, 02ah, 0c2h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 07eh, 008h
        endif
        if      FW_VERSION >= 212
        db      000h, 074h, 010h, 08bh, 046h, 006h, 0b9h, 004h, 000h, 0d3h, 0e0h, 003h, 046h, 008h, 048h, 08bh
        db      0e5h, 05dh, 0cbh, 0b8h, 0ffh, 0ffh, 0ebh, 0f7h, 055h, 08bh, 0ech, 083h, 0c4h, 0f9h, 0c7h, 046h
        db      0fch, 04dh, 000h, 0c7h, 046h, 0feh, 000h, 000h, 083h, 07eh, 0feh, 000h, 074h, 003h, 0e9h, 0e7h
        endif
        if      FW_VERSION = 212
        db      001h, 09ah, 003h, 000h, 030h, 0d8h, 09ah, 009h, 000h, 031h, 0d7h, 0c6h, 006h, 05ch, 050h, 000h
        db      080h, 03eh, 053h, 089h, 000h, 074h, 038h, 08bh, 046h, 0fch, 0ebh, 01bh, 0b8h, 0d8h, 0ffh, 050h
        db      09ah, 00eh, 000h, 001h, 0ddh, 083h, 0c4h, 002h, 09ah, 009h, 000h, 031h, 0d7h, 0ebh, 01eh, 08bh
        db      046h, 0fch, 0a2h, 05bh, 050h, 0ebh, 016h, 03dh, 042h, 000h, 074h, 0e0h, 03dh, 046h, 000h, 074h
        db      0dbh, 03dh, 047h, 000h, 074h, 0d6h, 03dh, 055h, 000h, 074h, 0d1h, 0ebh, 0e2h, 0ebh, 006h, 08bh
        db      046h, 0fch, 0a2h, 05bh, 050h, 0a0h, 05bh, 050h, 098h, 0e9h, 072h, 001h, 080h, 03eh, 062h, 09ch
        db      000h, 074h, 005h, 09ah, 04ch, 000h, 0cah, 0d6h, 09ah, 005h, 000h, 0adh, 0c1h, 089h, 046h, 0fch
        db      0e9h, 072h, 001h, 080h, 03eh, 062h, 09ch, 000h, 075h, 005h, 09ah, 002h, 000h, 0cah, 0d6h, 09ah
        db      005h, 000h, 093h, 0e2h, 089h, 046h, 0fch, 0e9h, 05bh, 001h, 09ah, 002h, 000h, 0cah, 0d6h, 09ah
        db      004h, 000h, 060h, 0e4h, 089h, 046h, 0fch, 0e9h, 04bh, 001h, 09ah, 073h, 002h, 0dbh, 0e4h, 089h
        db      046h, 0fch, 0e9h, 040h, 001h, 09ah, 04ch, 000h, 0cah, 0d6h, 09ah, 00fh, 000h, 04ah, 0c0h, 089h
        db      046h, 0fch, 0e9h, 030h, 001h, 09ah, 00fh, 000h, 072h, 0c9h, 089h, 046h, 0fch, 0e9h, 025h, 001h
        db      09ah, 000h, 000h, 021h, 0c4h, 089h, 046h, 0fch, 0e9h, 01ah, 001h, 09ah, 00ah, 000h, 0e6h, 0c5h
        db      089h, 046h, 0fch, 0e9h, 00fh, 001h, 09ah, 04ch, 000h, 0cah, 0d6h, 09ah, 005h, 000h, 04eh, 0e0h
        db      089h, 046h, 0fch, 0e9h, 0ffh, 000h, 09ah, 04ch, 000h, 0cah, 0d6h, 09ah, 00ch, 000h, 0fbh, 0e1h
        db      089h, 046h, 0fch, 0e9h, 0efh, 000h, 09ah, 04ch, 000h, 0cah, 0d6h, 09ah, 00ah, 000h, 070h, 0e2h
        db      089h, 046h, 0fch, 0e9h, 0dfh, 000h, 09ah, 005h, 000h, 02dh, 0c5h, 089h, 046h, 0fch, 0e9h, 0d4h
        db      000h, 09ah, 002h, 000h, 0cah, 0d6h, 09ah, 00bh, 000h, 010h, 0e0h, 089h, 046h, 0fch, 0e9h, 0c4h
        db      000h, 09ah, 006h, 000h, 006h, 0c3h, 089h, 046h, 0fch, 0e9h, 0b9h, 000h, 09ah, 04ch, 000h, 0cah
        db      0d6h, 09ah, 005h, 000h, 031h, 0e4h, 089h, 046h, 0fch, 0e9h, 0a9h, 000h, 09ah, 008h, 000h, 078h
        db      0e4h, 089h, 046h, 0fch, 0e9h, 09eh, 000h, 09ah, 008h, 000h, 08eh, 0e3h, 089h, 046h, 0fch, 0e9h
        db      093h, 000h, 09ah, 001h, 000h, 002h, 0e4h, 089h, 046h, 0fch, 0e9h, 088h, 000h, 0c7h, 046h, 0feh
        db      001h, 000h, 0e9h, 080h, 000h, 08bh, 046h, 0fch, 088h, 046h, 0f9h, 0c6h, 046h, 0fah, 000h, 08dh
        db      046h, 0f9h, 050h, 09ah, 00fh, 002h, 0e2h, 0c2h, 083h, 0c4h, 002h, 089h, 046h, 0fch, 0ebh, 065h
        endif
        if      FW_VERSION >= 214
        db      001h, 09ah, 005h, 000h, 07fh, 0d9h, 09ah, 00ah, 000h, 080h, 0d8h, 0c6h, 006h, 0dch, 053h, 000h
        db      080h, 03eh, 0d3h, 08ch, 000h, 074h, 038h, 08bh, 046h, 0fch, 0ebh, 01bh, 0b8h, 0d8h, 0ffh, 050h
        db      09ah, 003h, 000h, 053h, 0deh, 083h, 0c4h, 002h, 09ah, 00ah, 000h, 080h, 0d8h, 0ebh, 01eh, 08bh
        db      046h, 0fch, 0a2h, 0dbh, 053h, 0ebh, 016h, 03dh, 042h, 000h, 074h, 0e0h, 03dh, 046h, 000h, 074h
        db      0dbh, 03dh, 047h, 000h, 074h, 0d6h, 03dh, 055h, 000h, 074h, 0d1h, 0ebh, 0e2h, 0ebh, 006h, 08bh
        db      046h, 0fch, 0a2h, 0dbh, 053h, 0a0h, 0dbh, 053h, 098h, 0e9h, 072h, 001h, 080h, 03eh, 06eh, 0a0h
        db      000h, 074h, 005h, 09ah, 053h, 000h, 093h, 0d7h, 09ah, 002h, 000h, 02ah, 0c2h, 089h, 046h, 0fch
        db      0e9h, 072h, 001h, 080h, 03eh, 06eh, 0a0h, 000h, 075h, 005h, 09ah, 009h, 000h, 093h, 0d7h, 09ah
        db      005h, 000h, 0e6h, 0e3h, 089h, 046h, 0fch, 0e9h, 05bh, 001h, 09ah, 009h, 000h, 093h, 0d7h, 09ah
        db      008h, 000h, 0b6h, 0e5h, 089h, 046h, 0fch, 0e9h, 04bh, 001h, 09ah, 07bh, 002h, 033h, 0e6h, 089h
        db      046h, 0fch, 0e9h, 040h, 001h, 09ah, 053h, 000h, 093h, 0d7h, 09ah, 000h, 000h, 04fh, 0c0h, 089h
        db      046h, 0fch, 0e9h, 030h, 001h, 09ah, 002h, 000h, 0fbh, 0c9h, 089h, 046h, 0fch, 0e9h, 025h, 001h
        db      09ah, 00dh, 000h, 09dh, 0c4h, 089h, 046h, 0fch, 0e9h, 01ah, 001h, 09ah, 007h, 000h, 063h, 0c6h
        db      089h, 046h, 0fch, 0e9h, 00fh, 001h, 09ah, 053h, 000h, 093h, 0d7h, 09ah, 005h, 000h, 0a1h, 0e1h
        db      089h, 046h, 0fch, 0e9h, 0ffh, 000h, 09ah, 053h, 000h, 093h, 0d7h, 09ah, 00ch, 000h, 04eh, 0e3h
        db      089h, 046h, 0fch, 0e9h, 0efh, 000h, 09ah, 053h, 000h, 093h, 0d7h, 09ah, 00ah, 000h, 0c3h, 0e3h
        db      089h, 046h, 0fch, 0e9h, 0dfh, 000h, 09ah, 002h, 000h, 0aah, 0c5h, 089h, 046h, 0fch, 0e9h, 0d4h
        db      000h, 09ah, 009h, 000h, 093h, 0d7h, 09ah, 00bh, 000h, 063h, 0e1h, 089h, 046h, 0fch, 0e9h, 0c4h
        db      000h, 09ah, 003h, 000h, 083h, 0c3h, 089h, 046h, 0fch, 0e9h, 0b9h, 000h, 09ah, 053h, 000h, 093h
        db      0d7h, 09ah, 009h, 000h, 087h, 0e5h, 089h, 046h, 0fch, 0e9h, 0a9h, 000h, 09ah, 00ch, 000h, 0ceh
        db      0e5h, 089h, 046h, 0fch, 0e9h, 09eh, 000h, 09ah, 008h, 000h, 0e1h, 0e4h, 089h, 046h, 0fch, 0e9h
        db      093h, 000h, 09ah, 001h, 000h, 055h, 0e5h, 089h, 046h, 0fch, 0e9h, 088h, 000h, 0c7h, 046h, 0feh
        db      001h, 000h, 0e9h, 080h, 000h, 08bh, 046h, 0fch, 088h, 046h, 0f9h, 0c6h, 046h, 0fah, 000h, 08dh
        db      046h, 0f9h, 050h, 09ah, 00ch, 002h, 05fh, 0c3h, 083h, 0c4h, 002h, 089h, 046h, 0fch, 0ebh, 065h
        endif
        if      FW_VERSION >= 212
        db      001h, 000h, 020h, 000h, 02fh, 000h, 041h, 000h, 042h, 000h, 045h, 000h, 046h, 000h, 047h, 000h
        db      04ah, 000h, 04bh, 000h, 04ch, 000h, 04dh, 000h, 04fh, 000h, 052h, 000h, 053h, 000h, 055h, 000h
        endif
        if      FW_VERSION = 212
        db      06ch, 000h, 073h, 000h, 074h, 000h, 0bdh, 000h, 080h, 001h, 0adh, 000h, 04fh, 001h, 034h, 001h
        db      06ah, 001h, 0c8h, 000h, 096h, 000h, 0e3h, 000h, 0d8h, 000h, 0eeh, 000h, 07fh, 000h, 029h, 001h
        db      075h, 001h, 009h, 001h, 0f9h, 000h, 019h, 001h, 044h, 001h, 05fh, 001h, 088h, 001h, 006h, 08ch
        db      0c9h, 08eh, 0c1h, 057h, 0bfh, 0a3h, 001h, 0b9h, 014h, 000h, 0fch, 0f2h, 0afh, 026h, 08bh, 04dh
        db      024h, 05fh, 007h, 0ffh, 0e1h, 0e9h, 010h, 0feh, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 09ah
        db      009h, 000h, 031h, 0d7h, 0ffh, 076h, 006h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h
        db      078h, 019h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 09ah, 019h, 050h, 09ah
        db      05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 09ah, 00dh, 000h, 012h, 0d7h, 0b8h, 04dh, 000h, 08bh
        db      0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0feh, 0b8h, 0f3h, 019h, 050h, 09ah, 00eh, 000h
        db      023h, 0d9h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 001h, 000h, 050h, 09ah, 026h, 000h, 031h
        db      0d7h, 083h, 0c4h, 004h, 0b8h, 0f8h, 019h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h
        db      033h, 0c0h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h
        db      01eh, 01ah, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 003h
        db      000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 045h, 01ah, 050h, 09ah, 05bh
        db      000h, 031h, 0d7h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 004h, 000h, 050h, 09ah, 026h, 000h
        db      031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 068h, 01ah, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h
        db      002h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h
        db      033h, 0c0h, 050h, 0b8h, 004h, 000h, 050h, 08dh, 046h, 0feh, 050h, 09ah, 001h, 000h, 004h, 0d9h
        db      083h, 0c4h, 006h, 088h, 046h, 0ffh, 080h, 07eh, 0ffh, 000h, 075h, 048h, 08ah, 046h, 0feh, 0a2h
        db      05ch, 050h, 098h, 0ebh, 02bh, 09ah, 0ffh, 000h, 006h, 0c3h, 088h, 046h, 0ffh, 0ebh, 035h, 09ah
        db      060h, 004h, 006h, 0c3h, 088h, 046h, 0ffh, 0ebh, 02bh, 09ah, 007h, 009h, 006h, 0c3h, 088h, 046h
        db      0ffh, 0ebh, 021h, 080h, 00eh, 05ah, 089h, 010h, 0a0h, 077h, 051h, 088h, 046h, 0ffh, 0ebh, 014h
        endif
        if      FW_VERSION >= 214
        db      06ch, 000h, 073h, 000h, 074h, 000h, 0bah, 000h, 07dh, 001h, 0aah, 000h, 04ch, 001h, 031h, 001h
        db      067h, 001h, 0c5h, 000h, 093h, 000h, 0e0h, 000h, 0d5h, 000h, 0ebh, 000h, 07ch, 000h, 026h, 001h
        db      072h, 001h, 006h, 001h, 0f6h, 000h, 016h, 001h, 041h, 001h, 05ch, 001h, 085h, 001h, 006h, 08ch
        db      0c9h, 08eh, 0c1h, 057h, 0bfh, 0a0h, 001h, 0b9h, 014h, 000h, 0fch, 0f2h, 0afh, 026h, 08bh, 04dh
        db      024h, 05fh, 007h, 0ffh, 0e1h, 0e9h, 010h, 0feh, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 09ah
        db      00ah, 000h, 080h, 0d8h, 0ffh, 076h, 006h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 0b8h
        db      0e8h, 01ch, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 0b8h, 00ah, 01dh, 050h, 09ah
        db      05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 09ah, 00eh, 000h, 061h, 0d8h, 0b8h, 04dh, 000h, 08bh
        db      0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0feh, 0b8h, 063h, 01dh, 050h, 09ah, 000h, 000h
        db      073h, 0dah, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 001h, 000h, 050h, 09ah, 027h, 000h, 080h
        db      0d8h, 083h, 0c4h, 004h, 0b8h, 068h, 01dh, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h
        db      033h, 0c0h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h
        db      08eh, 01dh, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 003h
        db      000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 0b5h, 01dh, 050h, 09ah, 05ch
        db      000h, 080h, 0d8h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 004h, 000h, 050h, 09ah, 027h, 000h
        db      080h, 0d8h, 083h, 0c4h, 004h, 0b8h, 0d8h, 01dh, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h
        db      002h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h
        db      033h, 0c0h, 050h, 0b8h, 004h, 000h, 050h, 08dh, 046h, 0feh, 050h, 09ah, 003h, 000h, 053h, 0dah
        db      083h, 0c4h, 006h, 088h, 046h, 0ffh, 080h, 07eh, 0ffh, 000h, 075h, 048h, 08ah, 046h, 0feh, 0a2h
        db      0dch, 053h, 098h, 0ebh, 02bh, 09ah, 0fch, 000h, 083h, 0c3h, 088h, 046h, 0ffh, 0ebh, 035h, 09ah
        db      05dh, 004h, 083h, 0c3h, 088h, 046h, 0ffh, 0ebh, 02bh, 09ah, 004h, 009h, 083h, 0c3h, 088h, 046h
        db      0ffh, 0ebh, 021h, 080h, 00eh, 0dah, 08ch, 010h, 0a0h, 0f7h, 054h, 088h, 046h, 0ffh, 0ebh, 014h
        endif
        if      FW_VERSION >= 212
        db      03dh, 001h, 000h, 074h, 0d0h, 03dh, 002h, 000h, 074h, 0d5h, 03dh, 003h, 000h, 074h, 0dah, 03dh
        db      004h, 000h, 074h, 0dfh, 08ah, 046h, 0ffh, 098h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h
        endif
        if      FW_VERSION = 212
        db      0c4h, 0f7h, 0b8h, 07dh, 01ah, 050h, 09ah, 010h, 014h, 04ah, 0c0h, 083h, 0c4h, 002h, 09ah, 04ch
        db      000h, 0cah, 0d6h, 033h, 0c0h, 050h, 0b8h, 001h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h
        db      0c4h, 004h, 0b8h, 08fh, 01ah, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 03ch
        db      0aeh, 050h, 09ah, 0c9h, 004h, 0bbh, 0d7h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 002h, 000h
        db      050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0a0h, 03ch, 0aeh, 02ah, 0e4h, 08bh, 0d8h
        db      08ah, 087h, 002h, 04bh, 088h, 046h, 0f9h, 0a0h, 03ch, 0aeh, 02ah, 0e4h, 08bh, 0d8h, 08ah, 087h
        db      08bh, 04bh, 088h, 046h, 0f8h, 0b8h, 003h, 000h, 050h, 0b8h, 036h, 00bh, 050h, 08dh, 046h, 0f9h
        db      050h, 0b8h, 096h, 01ah, 050h, 09ah, 0cbh, 000h, 0bbh, 0d7h, 083h, 0c4h, 008h, 0b8h, 024h, 000h
        db      050h, 09ah, 001h, 000h, 03ch, 0d7h, 083h, 0c4h, 002h, 0b8h, 008h, 000h, 050h, 0b8h, 07fh, 000h
        db      050h, 033h, 0c0h, 050h, 0b8h, 003h, 000h, 050h, 08dh, 046h, 0f8h, 050h, 0b8h, 0a3h, 01ah, 050h
        db      09ah, 0cah, 002h, 0bbh, 0d7h, 083h, 0c4h, 00ch, 033h, 0c0h, 050h, 0b8h, 003h, 000h, 050h, 09ah
        db      026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 006h, 000h, 050h, 0b8h, 0b8h, 019h, 050h, 0b8h
        db      094h, 04ch, 050h, 0b8h, 0a4h, 01ah, 050h, 09ah, 0cbh, 000h, 0bbh, 0d7h, 083h, 0c4h, 008h, 0b8h
        db      015h, 000h, 050h, 09ah, 001h, 000h, 03ch, 0d7h, 083h, 0c4h, 002h, 0b8h, 008h, 000h, 050h, 0b8h
        db      07fh, 000h, 050h, 0b8h, 001h, 000h, 050h, 0b8h, 003h, 000h, 050h, 0b8h, 095h, 04ch, 050h, 0b8h
        db      0b3h, 01ah, 050h, 09ah, 0cah, 002h, 0bbh, 0d7h, 083h, 0c4h, 00ch, 033h, 0c0h, 050h, 0b8h, 004h
        db      000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 0c3h, 01ah, 050h, 09ah, 00eh
        db      000h, 023h, 0d9h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 005h, 000h, 050h, 09ah, 026h, 000h
        db      031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 003h, 000h, 050h, 0b8h, 044h, 00bh, 050h, 0b8h, 096h, 04ch
        db      050h, 0b8h, 0ceh, 01ah, 050h, 09ah, 0cbh, 000h, 0bbh, 0d7h, 083h, 0c4h, 008h, 0b8h, 015h, 000h
        db      050h, 09ah, 001h, 000h, 03ch, 0d7h, 083h, 0c4h, 002h, 0a0h, 098h, 04ch, 098h, 025h, 00fh, 000h
        db      040h, 089h, 046h, 0fah, 033h, 0c0h, 050h, 0b8h, 010h, 000h, 050h, 0b8h, 001h, 000h, 050h, 0b8h
        db      002h, 000h, 050h, 08dh, 046h, 0fah, 050h, 0b8h, 0deh, 01ah, 050h, 09ah, 0cah, 002h, 0bbh, 0d7h
        db      083h, 0c4h, 00ch, 0a0h, 098h, 04ch, 0b1h, 004h, 098h, 0d3h, 0f8h, 088h, 046h, 0f7h, 0b8h, 001h
        db      000h, 050h, 0b8h, 0b2h, 00bh, 050h, 08dh, 046h, 0f7h, 050h, 0b8h, 0ech, 01ah, 050h, 09ah, 0cbh
        db      000h, 0bbh, 0d7h, 083h, 0c4h, 008h, 033h, 0c0h, 050h, 0b8h, 006h, 000h, 050h, 09ah, 026h, 000h
        db      031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 003h, 000h, 050h, 0b8h, 044h, 00bh, 050h, 0b8h, 099h, 04ch
        db      050h, 0b8h, 0edh, 01ah, 050h, 09ah, 0cbh, 000h, 0bbh, 0d7h, 083h, 0c4h, 008h, 033h, 0c0h, 050h
        db      0b8h, 007h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 00fh, 01bh, 050h
        db      09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 08ah, 046h, 0f8h, 098h, 050h, 0a0h, 03ch, 0aeh
        db      02ah, 0e4h, 050h, 09ah, 0fdh, 003h, 006h, 0c3h, 083h, 0c4h, 004h, 0c7h, 046h, 0fch, 000h, 000h
        db      0c7h, 046h, 0feh, 000h, 000h, 083h, 07eh, 0feh, 000h, 074h, 003h, 0e9h, 0d9h, 000h, 0b8h, 001h
        db      000h, 050h, 09ah, 028h, 000h, 030h, 0d8h, 083h, 0c4h, 002h, 089h, 046h, 0feh, 085h, 0c0h, 074h
        db      003h, 0e9h, 0aah, 000h, 0a0h, 011h, 0a2h, 098h, 0e9h, 093h, 000h, 0a0h, 03ch, 0aeh, 02ah, 0e4h
        db      08bh, 0d8h, 08ah, 087h, 002h, 04bh, 088h, 046h, 0f9h, 0b8h, 001h, 000h, 050h, 09ah, 05dh, 009h
        db      030h, 0d8h, 083h, 0c4h, 002h, 0a0h, 03ch, 0aeh, 02ah, 0e4h, 08bh, 0d8h, 08ah, 087h, 08bh, 04bh
        db      088h, 046h, 0f8h, 098h, 050h, 0a0h, 03ch, 0aeh, 02ah, 0e4h, 050h, 09ah, 0fdh, 003h, 006h, 0c3h
        db      083h, 0c4h, 004h, 0ebh, 066h, 0a0h, 03ch, 0aeh, 02ah, 0e4h, 08bh, 0d8h, 08ah, 046h, 0f9h, 088h
        db      087h, 002h, 04bh, 0ebh, 056h, 08ah, 046h, 0f8h, 098h, 050h, 0a0h, 03ch, 0aeh, 02ah, 0e4h, 050h
        db      09ah, 0fdh, 003h, 006h, 0c3h, 083h, 0c4h, 004h, 050h, 0a0h, 03ch, 0aeh, 02ah, 0e4h, 08bh, 0d8h
        db      058h, 088h, 087h, 08bh, 04bh, 0ebh, 034h, 08ah, 046h, 0f7h, 098h, 050h, 0ffh, 076h, 0fah, 09ah
        db      07fh, 011h, 006h, 0c3h, 083h, 0c4h, 004h, 0c7h, 046h, 0fch, 001h, 000h, 0ebh, 01dh, 01eh, 003h
        db      058h, 003h, 068h, 003h, 0beh, 003h, 0beh, 003h, 0beh, 003h, 08ah, 003h, 08ah, 003h, 03dh, 008h
        db      000h, 073h, 008h, 093h, 0d1h, 0e3h, 02eh, 0ffh, 0a7h, 0a1h, 003h, 0e9h, 040h, 0ffh, 08bh, 046h
        db      0feh, 0ebh, 00ch, 080h, 00eh, 05ah, 089h, 010h, 0c7h, 046h, 0feh, 000h, 000h, 0ebh, 005h, 03dh
        db      078h, 000h, 074h, 0efh, 0e9h, 01eh, 0ffh, 083h, 07eh, 0fch, 000h, 074h, 016h, 09ah, 00fh, 000h
        db      04bh, 0d6h, 0b8h, 09ah, 090h, 050h, 09ah, 001h, 000h, 095h, 0d4h, 083h, 0c4h, 002h, 09ah, 03eh
        db      000h, 04bh, 0d6h, 08bh, 046h, 0feh, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 0b8h, 015h, 000h
        db      050h, 0b8h, 002h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 083h, 07eh, 006h
        db      000h, 074h, 018h, 083h, 07eh, 006h, 001h, 074h, 012h, 083h, 07eh, 006h, 004h, 074h, 00ch, 083h
        db      07eh, 006h, 005h, 074h, 006h, 083h, 07eh, 006h, 029h, 07ch, 013h, 0c7h, 046h, 008h, 000h, 000h
        db      0b8h, 028h, 000h, 050h, 09ah, 001h, 000h, 03ch, 0d7h, 083h, 0c4h, 002h, 0ebh, 018h, 0b8h, 01fh
        db      01bh, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 002h, 000h, 050h, 09ah, 05dh
        db      009h, 030h, 0d8h, 083h, 0c4h, 002h, 08bh, 046h, 008h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech
        db      083h, 0c4h, 0f8h, 0b8h, 02fh, 01bh, 050h, 09ah, 010h, 014h, 04ah, 0c0h, 083h, 0c4h, 002h, 09ah
        db      04ch, 000h, 0cah, 0d6h, 033h, 0c0h, 050h, 0b8h, 001h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h
        db      083h, 0c4h, 004h, 0b8h, 003h, 000h, 050h, 0b8h, 044h, 00bh, 050h, 0b8h, 09ah, 04ch, 050h, 0b8h
        db      04eh, 01bh, 050h, 09ah, 0cbh, 000h, 0bbh, 0d7h, 083h, 0c4h, 008h, 033h, 0c0h, 050h, 0b8h, 002h
        db      000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 008h, 000h, 050h, 0b8h, 07fh
        db      000h, 050h, 033h, 0c0h, 050h, 0b8h, 003h, 000h, 050h, 0b8h, 03dh, 0aeh, 050h, 0b8h, 069h, 01bh
        db      050h, 09ah, 0cah, 002h, 0bbh, 0d7h, 083h, 0c4h, 00ch, 0b8h, 06fh, 01bh, 050h, 09ah, 05bh, 000h
        db      031h, 0d7h, 083h, 0c4h, 002h, 0a0h, 03dh, 0aeh, 098h, 050h, 09ah, 0dbh, 000h, 0efh, 0d8h, 083h
        db      0c4h, 002h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 071h, 01bh, 050h, 09ah
        db      05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 013h, 000h, 050h, 09ah, 001h, 000h, 03ch, 0d7h
        db      083h, 0c4h, 002h, 0a0h, 03dh, 0aeh, 098h, 08bh, 0d8h, 08ah, 087h, 09eh, 04ch, 088h, 046h, 0f9h
        db      0b8h, 009h, 000h, 050h, 0b8h, 0a6h, 00ch, 050h, 08dh, 046h, 0f9h, 050h, 0b8h, 073h, 01bh, 050h
        db      09ah, 0cbh, 000h, 0bbh, 0d7h, 083h, 0c4h, 008h, 033h, 0c0h, 050h, 0b8h, 003h, 000h, 050h, 09ah
        db      026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 07ah, 01bh, 050h, 09ah, 00eh, 000h, 023h, 0d9h
        db      083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 004h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h
        db      0c4h, 004h, 0b8h, 00eh, 000h, 050h, 0b8h, 0cch, 019h, 050h, 0b8h, 09bh, 04ch, 050h, 0b8h, 099h
        db      01bh, 050h, 09ah, 0cbh, 000h, 0bbh, 0d7h, 083h, 0c4h, 008h, 033h, 0c0h, 050h, 0b8h, 005h, 000h
        db      050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 004h, 000h, 050h, 0b8h, 0c4h, 00bh
        db      050h, 0b8h, 03eh, 0aeh, 050h, 0b8h, 0b2h, 01bh, 050h, 09ah, 0cbh, 000h, 0bbh, 0d7h, 083h, 0c4h
        db      008h, 0b8h, 013h, 000h, 050h, 09ah, 001h, 000h, 03ch, 0d7h, 083h, 0c4h, 002h, 0a0h, 03eh, 0aeh
        db      098h, 08bh, 0d8h, 08ah, 087h, 01eh, 04dh, 088h, 046h, 0f8h, 0b8h, 008h, 000h, 050h, 0b8h, 07fh
        db      000h, 050h, 033h, 0c0h, 050h, 0b8h, 003h, 000h, 050h, 08dh, 046h, 0f8h, 050h, 0b8h, 0b8h, 01bh
        db      050h, 09ah, 0cah, 002h, 0bbh, 0d7h, 083h, 0c4h, 00ch, 0b8h, 0c4h, 01bh, 050h, 09ah, 05bh, 000h
        db      031h, 0d7h, 083h, 0c4h, 002h, 08ah, 046h, 0f8h, 098h, 050h, 09ah, 0dbh, 000h, 0efh, 0d8h, 083h
        db      0c4h, 002h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 0c6h, 01bh, 050h, 09ah
        db      05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 006h, 000h, 050h, 09ah, 026h
        db      000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 0c8h, 01bh, 050h, 09ah, 00eh, 000h, 023h, 0d9h, 083h
        db      0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h
        db      004h, 0a0h, 09ch, 04ch, 098h, 040h, 089h, 046h, 0fch, 033h, 0c0h, 050h, 0b8h, 010h, 000h, 050h
        db      0b8h, 001h, 000h, 050h, 0b8h, 002h, 000h, 050h, 08dh, 046h, 0fch, 050h, 0b8h, 0ceh, 01bh, 050h
        db      09ah, 0cah, 002h, 0bbh, 0d7h, 083h, 0c4h, 00ch, 0c7h, 046h, 0feh, 000h, 000h, 083h, 07eh, 0feh
        db      000h, 074h, 003h, 0e9h, 0a7h, 002h, 0b8h, 040h, 000h, 050h, 09ah, 028h, 000h, 030h, 0d8h, 083h
        db      0c4h, 002h, 089h, 046h, 0feh, 085h, 0c0h, 074h, 003h, 0e9h, 0bdh, 001h, 0a0h, 011h, 0a2h, 098h
        db      0e9h, 0a6h, 001h, 0a0h, 03dh, 0aeh, 098h, 08bh, 0d8h, 08ah, 087h, 09eh, 04ch, 088h, 046h, 0f9h
        db      0b8h, 009h, 000h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h
        db      0a0h, 03dh, 0aeh, 098h, 050h, 09ah, 0dbh, 000h, 0efh, 0d8h, 083h, 0c4h, 002h, 050h, 09ah, 05bh
        db      000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 002h, 000h, 050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h
        db      0c4h, 002h, 0e9h, 071h, 001h, 09ah, 004h, 000h, 08dh, 0d5h, 0a0h, 03dh, 0aeh, 098h, 08bh, 0d8h
        db      08ah, 046h, 0f9h, 088h, 087h, 09eh, 04ch, 0b8h, 009h, 000h, 050h, 0b8h, 002h, 000h, 050h, 09ah
        db      026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0a0h, 03dh, 0aeh, 098h, 050h, 09ah, 0dbh, 000h, 0efh
        db      0d8h, 083h, 0c4h, 002h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 002h, 000h
        db      050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 0feh, 00eh, 04bh, 089h, 0e9h, 026h, 001h
        db      0a0h, 03eh, 0aeh, 098h, 08bh, 0d8h, 08ah, 087h, 01eh, 04dh, 088h, 046h, 0f8h, 0b8h, 022h, 000h
        db      050h, 0b8h, 005h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 08ah, 046h, 0f8h
        db      098h, 050h, 09ah, 0dbh, 000h, 0efh, 0d8h, 083h, 0c4h, 002h, 050h, 09ah, 05bh, 000h, 031h, 0d7h
        db      083h, 0c4h, 002h, 0b8h, 004h, 000h, 050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 0b8h
        db      005h, 000h, 050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 0e9h, 0d8h, 000h, 09ah, 004h
        db      000h, 08dh, 0d5h, 0a0h, 03eh, 0aeh, 098h, 08bh, 0d8h, 08ah, 046h, 0f8h, 088h, 087h, 01eh, 04dh
        db      0b8h, 022h, 000h, 050h, 0b8h, 005h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h
        db      08ah, 046h, 0f8h, 098h, 050h, 09ah, 0dbh, 000h, 0efh, 0d8h, 083h, 0c4h, 002h, 050h, 09ah, 05bh
        db      000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 004h, 000h, 050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h
        db      0c4h, 002h, 0b8h, 005h, 000h, 050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 0feh, 00eh
        db      04bh, 089h, 0e9h, 081h, 000h, 09ah, 004h, 000h, 08dh, 0d5h, 08bh, 046h, 0fch, 048h, 0a2h, 09ch
        db      04ch, 0a0h, 098h, 04ch, 098h, 0b9h, 004h, 000h, 0d3h, 0f8h, 050h, 0a0h, 098h, 04ch, 098h, 025h
        db      00fh, 000h, 040h, 050h, 09ah, 07fh, 011h, 006h, 0c3h, 083h, 0c4h, 004h, 0c7h, 046h, 0fah, 000h
        db      000h, 0ffh, 076h, 0fah, 09ah, 000h, 000h, 096h, 0d5h, 083h, 0c4h, 002h, 085h, 0c0h, 074h, 00fh
        db      08bh, 05eh, 0fah, 080h, 08fh, 040h, 091h, 004h, 080h, 08fh, 0b6h, 094h, 004h, 0ebh, 00dh, 08bh
        db      05eh, 0fah, 080h, 0a7h, 040h, 091h, 0fbh, 080h, 0a7h, 0b6h, 094h, 0fbh, 0ffh, 046h, 0fah, 083h
        db      07eh, 0fah, 064h, 07ch, 0cch, 0feh, 00eh, 04bh, 089h, 0ebh, 01bh, 029h, 008h, 076h, 006h, 0b8h
        db      006h, 029h, 008h, 003h, 007h, 051h, 007h, 0a8h, 007h, 03dh, 007h, 000h, 073h, 008h, 093h, 0d1h
        db      0e3h, 02eh, 0ffh, 0a7h, 00eh, 008h, 0e9h, 02dh, 0feh, 08bh, 046h, 0feh, 0e9h, 0beh, 000h, 080h
        db      03eh, 011h, 0a2h, 001h, 074h, 007h, 080h, 03eh, 011h, 0a2h, 002h, 075h, 04eh, 0a0h, 078h, 051h
        db      0a2h, 03dh, 0aeh, 098h, 08bh, 0d8h, 08ah, 087h, 09eh, 04ch, 088h, 046h, 0f9h, 0b8h, 009h, 000h
        db      050h, 0b8h, 002h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0a0h, 03dh, 0aeh
        db      098h, 050h, 09ah, 0dbh, 000h, 0efh, 0d8h, 083h, 0c4h, 002h, 050h, 09ah, 05bh, 000h, 031h, 0d7h
        db      083h, 0c4h, 002h, 0b8h, 001h, 000h, 050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 0b8h
        db      002h, 000h, 050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 080h, 03eh, 011h, 0a2h, 005h
        db      074h, 007h, 080h, 03eh, 011h, 0a2h, 004h, 075h, 04dh, 09ah, 004h, 000h, 08dh, 0d5h, 0a0h, 078h
        db      051h, 088h, 046h, 0f8h, 050h, 0a0h, 03eh, 0aeh, 098h, 08bh, 0d8h, 058h, 088h, 087h, 01eh, 04dh
        db      0b8h, 022h, 000h, 050h, 0b8h, 005h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h
        db      08ah, 046h, 0f8h, 098h, 050h, 09ah, 0dbh, 000h, 0efh, 0d8h, 083h, 0c4h, 002h, 050h, 09ah, 05bh
        db      000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 005h, 000h, 050h, 09ah, 05dh, 009h, 030h, 0d8h, 083h
        db      0c4h, 002h, 0feh, 00eh, 04bh, 089h, 0c7h, 046h, 0feh, 000h, 000h, 0ebh, 00dh, 03dh, 044h, 000h
        db      074h, 0f4h, 03dh, 04eh, 000h, 075h, 003h, 0e9h, 035h, 0ffh, 0e9h, 050h, 0fdh, 08bh, 046h, 0feh
        db      08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0f2h, 09ah, 04ch, 000h, 0cah, 0d6h, 09ah
        db      003h, 000h, 030h, 0d8h, 09ah, 009h, 000h, 031h, 0d7h, 033h, 0c0h, 050h, 050h, 09ah, 026h, 000h
        db      031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 0dfh, 01bh, 050h, 09ah, 00eh, 000h, 023h, 0d9h, 083h, 0c4h
        db      002h, 0b0h, 001h, 0c6h, 046h, 0feh, 001h, 088h, 046h, 0ffh, 08ah, 046h, 0feh, 098h, 048h, 089h
        db      046h, 0f4h, 050h, 09ah, 064h, 010h, 006h, 0c3h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 001h
        db      000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 008h, 000h, 050h, 0b8h, 002h
        db      000h, 050h, 0b8h, 001h, 000h, 050h, 050h, 0b8h, 024h, 04fh, 050h, 0b8h, 0f8h, 01bh, 050h, 09ah
        db      0cah, 002h, 0bbh, 0d7h, 083h, 0c4h, 00ch, 0b8h, 008h, 000h, 050h, 0b8h, 004h, 000h, 050h, 0b8h
        db      001h, 000h, 050h, 050h, 0b8h, 025h, 04fh, 050h, 0b8h, 001h, 01ch, 050h, 09ah, 0cah, 002h, 0bbh
        db      0d7h, 083h, 0c4h, 00ch, 0b8h, 015h, 000h, 050h, 09ah, 001h, 000h, 03ch, 0d7h, 083h, 0c4h, 002h
        db      0b8h, 008h, 000h, 050h, 0b8h, 002h, 000h, 050h, 0b8h, 001h, 000h, 050h, 050h, 08dh, 046h, 0ffh
        db      050h, 0b8h, 008h, 01ch, 050h, 09ah, 0cah, 002h, 0bbh, 0d7h, 083h, 0c4h, 00ch, 0b8h, 008h, 000h
        db      050h, 0b8h, 010h, 000h, 050h, 0b8h, 001h, 000h, 050h, 0b8h, 002h, 000h, 050h, 0b8h, 03fh, 0aeh
        db      050h, 0b8h, 00eh, 01ch, 050h, 09ah, 0cah, 002h, 0bbh, 0d7h, 083h, 0c4h, 00ch, 033h, 0c0h, 050h
        db      0b8h, 002h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 01ah, 01ch, 050h
        db      09ah, 00eh, 000h, 023h, 0d9h, 083h, 0c4h, 002h, 0b8h, 01dh, 000h, 050h, 0b8h, 002h, 000h, 050h
        db      09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 008h, 000h, 050h, 050h, 0b8h, 001h, 000h
        db      050h, 050h, 08dh, 046h, 0feh, 050h, 0b8h, 02eh, 01ch, 050h, 09ah, 0cah, 002h, 0bbh, 0d7h, 083h
        db      0c4h, 00ch, 0b8h, 020h, 000h, 050h, 09ah, 036h, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 033h, 0c0h
        db      050h, 0b8h, 003h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 008h, 000h
        db      050h, 0b8h, 07fh, 000h, 050h, 033h, 0c0h, 050h, 0b8h, 003h, 000h, 050h, 0b8h, 041h, 0aeh, 050h
        db      0b8h, 02fh, 01ch, 050h, 09ah, 0cah, 002h, 0bbh, 0d7h, 083h, 0c4h, 00ch, 0a0h, 041h, 0aeh, 098h
        db      050h, 09ah, 040h, 011h, 006h, 0c3h, 083h, 0c4h, 002h, 0b8h, 015h, 000h, 050h, 09ah, 001h, 000h
        db      03ch, 0d7h, 083h, 0c4h, 002h, 0b8h, 008h, 000h, 050h, 0b8h, 063h, 000h, 050h, 033h, 0c0h, 050h
        db      0b8h, 003h, 000h, 050h, 0b8h, 042h, 0aeh, 050h, 0b8h, 035h, 01ch, 050h, 09ah, 0cah, 002h, 0bbh
        db      0d7h, 083h, 0c4h, 00ch, 033h, 0c0h, 050h, 0b8h, 004h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h
        db      083h, 0c4h, 004h, 0b8h, 008h, 000h, 050h, 0b8h, 063h, 000h, 050h, 033h, 0c0h, 050h, 0b8h, 003h
        db      000h, 050h, 0b8h, 043h, 0aeh, 050h, 0b8h, 042h, 01ch, 050h, 09ah, 0cah, 002h, 0bbh, 0d7h, 083h
        db      0c4h, 00ch, 0b8h, 015h, 000h, 050h, 09ah, 001h, 000h, 03ch, 0d7h, 083h, 0c4h, 002h, 0b8h, 008h
        db      000h, 050h, 0b8h, 014h, 000h, 050h, 033h, 0c0h, 050h, 0b8h, 002h, 000h, 050h, 0b8h, 045h, 0aeh
        db      050h, 0b8h, 04bh, 01ch, 050h, 09ah, 0cah, 002h, 0bbh, 0d7h, 083h, 0c4h, 00ch, 033h, 0c0h, 050h
        db      0b8h, 005h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 008h, 000h, 050h
        db      0b8h, 014h, 000h, 050h, 033h, 0c0h, 050h, 0b8h, 002h, 000h, 050h, 0b8h, 046h, 0aeh, 050h, 0b8h
        db      059h, 01ch, 050h, 09ah, 0cah, 002h, 0bbh, 0d7h, 083h, 0c4h, 00ch, 0b8h, 015h, 000h, 050h, 09ah
        db      001h, 000h, 03ch, 0d7h, 083h, 0c4h, 002h, 0b8h, 008h, 000h, 050h, 0b8h, 063h, 000h, 050h, 033h
        db      0c0h, 050h, 0b8h, 002h, 000h, 050h, 0b8h, 047h, 0aeh, 050h, 0b8h, 068h, 01ch, 050h, 09ah, 0cah
        db      002h, 0bbh, 0d7h, 083h, 0c4h, 00ch, 033h, 0c0h, 050h, 0b8h, 006h, 000h, 050h, 09ah, 026h, 000h
        db      031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 008h, 000h, 050h, 050h, 0b8h, 001h, 000h, 050h, 050h, 0b8h
        db      044h, 0aeh, 050h, 0b8h, 073h, 01ch, 050h, 09ah, 0cah, 002h, 0bbh, 0d7h, 083h, 0c4h, 00ch, 0b8h
        db      015h, 000h, 050h, 09ah, 001h, 000h, 03ch, 0d7h, 083h, 0c4h, 002h, 0b8h, 008h, 000h, 050h, 0b8h
        db      010h, 000h, 050h, 0b8h, 001h, 000h, 050h, 0b8h, 002h, 000h, 050h, 0b8h, 040h, 0aeh, 050h, 0b8h
        db      083h, 01ch, 050h, 09ah, 0cah, 002h, 0bbh, 0d7h, 083h, 0c4h, 00ch, 033h, 0c0h, 050h, 0b8h, 007h
        db      000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 091h, 01ch, 050h, 09ah, 05bh
        db      000h, 031h, 0d7h, 083h, 0c4h, 002h, 0c7h, 046h, 0fch, 000h, 000h, 083h, 07eh, 0fch, 000h, 074h
        db      003h, 0e9h, 096h, 004h, 0b8h, 002h, 000h, 050h, 09ah, 028h, 000h, 030h, 0d8h, 083h, 0c4h, 002h
        db      089h, 046h, 0fah, 085h, 0c0h, 074h, 003h, 0e9h, 0a1h, 001h, 0a0h, 011h, 0a2h, 098h, 0e9h, 08ah
        db      001h, 0e9h, 094h, 001h, 0a0h, 03fh, 0aeh, 0feh, 0c8h, 050h, 08bh, 046h, 0f4h, 08bh, 0d0h, 0d1h
        db      0e0h, 0d1h, 0e0h, 003h, 0c2h, 0d1h, 0e0h, 08bh, 0d8h, 058h, 088h, 087h, 03eh, 04dh, 0e9h, 077h
        db      001h, 08ah, 046h, 0ffh, 098h, 08bh, 0d8h, 04bh, 0d1h, 0e3h, 0d1h, 0e3h, 0d1h, 0e3h, 08ah, 046h
        db      0feh, 098h, 003h, 0d8h, 08bh, 0c3h, 048h, 089h, 046h, 0f4h, 08ah, 046h, 0feh, 0feh, 0c8h, 050h
        db      08bh, 046h, 0f4h, 08bh, 0d0h, 0d1h, 0e0h, 0d1h, 0e0h, 003h, 0c2h, 0d1h, 0e0h, 08bh, 0d8h, 058h
        db      088h, 087h, 03fh, 04dh, 0ffh, 076h, 0f4h, 09ah, 064h, 010h, 006h, 0c3h, 083h, 0c4h, 002h, 0c7h
        db      046h, 0f6h, 000h, 000h, 0ffh, 076h, 0f6h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h, 002h, 0ffh
        db      046h, 0f6h, 083h, 07eh, 0f6h, 00dh, 07ch, 0ech, 0b8h, 009h, 000h, 050h, 0b8h, 003h, 000h, 050h
        db      09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0a0h, 041h, 0aeh, 098h, 050h, 09ah, 040h, 011h
        db      006h, 0c3h, 083h, 0c4h, 002h, 0e9h, 000h, 001h, 0a0h, 041h, 0aeh, 098h, 050h, 09ah, 040h, 011h
        db      006h, 0c3h, 083h, 0c4h, 002h, 08bh, 046h, 0f4h, 08bh, 0d0h, 0d1h, 0e0h, 0d1h, 0e0h, 003h, 0c2h
        db      0d1h, 0e0h, 08bh, 0d8h, 0a0h, 041h, 0aeh, 088h, 087h, 041h, 04dh, 0e9h, 0dah, 000h, 08bh, 046h
        db      0f4h, 08bh, 0d0h, 0d1h, 0e0h, 0d1h, 0e0h, 003h, 0c2h, 0d1h, 0e0h, 08bh, 0d8h, 0a0h, 042h, 0aeh
        db      088h, 087h, 042h, 04dh, 0e9h, 0c1h, 000h, 08bh, 046h, 0f4h, 08bh, 0d0h, 0d1h, 0e0h, 0d1h, 0e0h
        db      003h, 0c2h, 0d1h, 0e0h, 08bh, 0d8h, 0a0h, 043h, 0aeh, 088h, 087h, 043h, 04dh, 0e9h, 0a8h, 000h
        db      08bh, 046h, 0f4h, 08bh, 0d0h, 0d1h, 0e0h, 0d1h, 0e0h, 003h, 0c2h, 0d1h, 0e0h, 08bh, 0d8h, 0a0h
        db      045h, 0aeh, 088h, 087h, 045h, 04dh, 0e9h, 08fh, 000h, 08bh, 046h, 0f4h, 08bh, 0d0h, 0d1h, 0e0h
        db      0d1h, 0e0h, 003h, 0c2h, 0d1h, 0e0h, 08bh, 0d8h, 0a0h, 046h, 0aeh, 088h, 087h, 046h, 04dh, 0ebh
        db      077h, 08bh, 046h, 0f4h, 08bh, 0d0h, 0d1h, 0e0h, 0d1h, 0e0h, 003h, 0c2h, 0d1h, 0e0h, 08bh, 0d8h
        db      0a0h, 047h, 0aeh, 088h, 087h, 047h, 04dh, 0ebh, 05fh, 0a0h, 044h, 0aeh, 0feh, 0c8h, 050h, 08bh
        db      046h, 0f4h, 08bh, 0d0h, 0d1h, 0e0h, 0d1h, 0e0h, 003h, 0c2h, 0d1h, 0e0h, 08bh, 0d8h, 058h, 088h
        db      087h, 044h, 04dh, 0ebh, 043h, 0a0h, 040h, 0aeh, 0feh, 0c8h, 050h, 08bh, 046h, 0f4h, 08bh, 0d0h
        db      0d1h, 0e0h, 0d1h, 0e0h, 003h, 0c2h, 0d1h, 0e0h, 08bh, 0d8h, 058h, 088h, 087h, 040h, 04dh, 0ebh
        db      027h, 0e4h, 00bh, 0e4h, 00bh, 004h, 00ch, 0e7h, 00bh, 004h, 00ch, 07bh, 00ch, 0a1h, 00ch, 0bah
        db      00ch, 0d3h, 00ch, 0ech, 00ch, 004h, 00dh, 01ch, 00dh, 038h, 00dh, 03dh, 00dh, 000h, 073h, 008h
        db      093h, 0d1h, 0e3h, 02eh, 0ffh, 0a7h, 054h, 00dh, 0e9h, 049h, 0feh, 08bh, 046h, 0fah, 0e9h, 0c4h
        db      002h, 0feh, 006h, 04bh, 089h, 0c6h, 006h, 053h, 08ah, 0f0h, 0c6h, 006h, 054h, 08ah, 047h, 08bh
        db      046h, 0f4h, 08bh, 0d0h, 0d1h, 0e0h, 0d1h, 0e0h, 003h, 0c2h, 0d1h, 0e0h, 08bh, 0d8h, 08ah, 087h
        db      03eh, 04dh, 0a2h, 055h, 08ah, 0c6h, 006h, 056h, 08ah, 006h, 0c6h, 006h, 057h, 08ah, 049h, 08ah
        db      087h, 03fh, 04dh, 0a2h, 058h, 08ah, 0c6h, 006h, 059h, 08ah, 0f7h, 0a0h, 025h, 04fh, 098h, 050h
        db      0b8h, 007h, 000h, 050h, 0b8h, 053h, 08ah, 050h, 09ah, 0e4h, 000h, 03eh, 0dfh, 083h, 0c4h, 006h
        db      0b8h, 0c8h, 000h, 050h, 09ah, 004h, 000h, 006h, 0e0h, 083h, 0c4h, 002h, 089h, 046h, 0f2h, 083h
        db      07eh, 0f2h, 0feh, 075h, 075h, 09ah, 04fh, 000h, 031h, 0d7h, 09ah, 009h, 000h, 031h, 0d7h, 0b8h
        db      0a7h, 01ch, 050h, 09ah, 00eh, 000h, 023h, 0d9h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 001h
        db      000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 0b1h, 01ch, 050h, 09ah, 005h
        db      000h, 03fh, 0d7h, 083h, 0c4h, 002h, 0b8h, 0dah, 01ch, 050h, 09ah, 005h, 000h, 03fh, 0d7h, 083h
        db      0c4h, 002h, 0b8h, 003h, 01dh, 050h, 09ah, 005h, 000h, 03fh, 0d7h, 083h, 0c4h, 002h, 033h, 0c0h
        db      050h, 0b8h, 007h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 01bh, 01dh
        db      050h, 09ah, 005h, 000h, 03fh, 0d7h, 083h, 0c4h, 002h, 09ah, 0e3h, 001h, 001h, 0ddh, 09ah, 055h
        db      000h, 031h, 0d7h, 0feh, 00eh, 04bh, 089h, 0e9h, 0fdh, 001h, 08bh, 046h, 0f4h, 08bh, 0d0h, 0d1h
        db      0e0h, 0d1h, 0e0h, 003h, 0c2h, 0d1h, 0e0h, 08bh, 0d8h, 0a0h, 055h, 08ah, 088h, 087h, 03eh, 04dh
        db      08bh, 046h, 0f4h, 08bh, 0d0h, 0d1h, 0e0h, 0d1h, 0e0h, 003h, 0c2h, 0d1h, 0e0h, 08bh, 0d8h, 0a0h
        db      059h, 08ah, 088h, 087h, 040h, 04dh, 08bh, 046h, 0f4h, 08bh, 0d0h, 0d1h, 0e0h, 0d1h, 0e0h, 003h
        db      0c2h, 0d1h, 0e0h, 08bh, 0d8h, 0a0h, 05ah, 08ah, 088h, 087h, 041h, 04dh, 08bh, 046h, 0f4h, 08bh
        db      0d0h, 0d1h, 0e0h, 0d1h, 0e0h, 003h, 0c2h, 0d1h, 0e0h, 08bh, 0d8h, 0a0h, 05bh, 08ah, 088h, 087h
        db      042h, 04dh, 08bh, 046h, 0f4h, 08bh, 0d0h, 0d1h, 0e0h, 0d1h, 0e0h, 003h, 0c2h, 0d1h, 0e0h, 08bh
        db      0d8h, 0a0h, 05ch, 08ah, 088h, 087h, 043h, 04dh, 08bh, 046h, 0f4h, 08bh, 0d0h, 0d1h, 0e0h, 0d1h
        db      0e0h, 003h, 0c2h, 0d1h, 0e0h, 08bh, 0d8h, 0a0h, 05dh, 08ah, 088h, 087h, 044h, 04dh, 0a0h, 05eh
        db      08ah, 098h, 0d1h, 0e8h, 0d1h, 0e8h, 050h, 08bh, 046h, 0f4h, 08bh, 0d0h, 0d1h, 0e0h, 0d1h, 0e0h
        db      003h, 0c2h, 0d1h, 0e0h, 08bh, 0d8h, 058h, 088h, 087h, 045h, 04dh, 0a0h, 05fh, 08ah, 098h, 0d1h
        db      0e8h, 0d1h, 0e8h, 050h, 08bh, 046h, 0f4h, 08bh, 0d0h, 0d1h, 0e0h, 0d1h, 0e0h, 003h, 0c2h, 0d1h
        db      0e0h, 08bh, 0d8h, 058h, 088h, 087h, 046h, 04dh, 0ffh, 036h, 060h, 08ah, 09ah, 000h, 000h, 042h
        db      0d9h, 083h, 0c4h, 002h, 0b9h, 028h, 000h, 099h, 0f7h, 0f9h, 089h, 046h, 0f8h, 0a3h, 060h, 08ah
        db      08bh, 046h, 0f4h, 08bh, 0d0h, 0d1h, 0e0h, 0d1h, 0e0h, 003h, 0c2h, 0d1h, 0e0h, 08bh, 0d8h, 0a0h
        db      060h, 08ah, 088h, 087h, 047h, 04dh, 0ffh, 076h, 0f4h, 09ah, 064h, 010h, 006h, 0c3h, 083h, 0c4h
        db      002h, 0c7h, 046h, 0f6h, 000h, 000h, 0ffh, 076h, 0f6h, 09ah, 05dh, 009h, 030h, 0d8h, 083h, 0c4h
        db      002h, 0ffh, 046h, 0f6h, 083h, 07eh, 0f6h, 00dh, 07ch, 0ech, 0b8h, 009h, 000h, 050h, 0b8h, 003h
        db      000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0a0h, 041h, 0aeh, 098h, 050h, 09ah
        db      040h, 011h, 006h, 0c3h, 083h, 0c4h, 002h, 0feh, 00eh, 04bh, 089h, 0e9h, 0c9h, 000h, 0feh, 006h
        db      04bh, 089h, 0c6h, 006h, 053h, 08ah, 0f0h, 0c6h, 006h, 054h, 08ah, 047h, 08bh, 046h, 0f4h, 08bh
        db      0d0h, 0d1h, 0e0h, 0d1h, 0e0h, 003h, 0c2h, 0d1h, 0e0h, 08bh, 0d8h, 08ah, 087h, 03eh, 04dh, 0a2h
        db      055h, 08ah, 0c6h, 006h, 056h, 08ah, 003h, 0c6h, 006h, 057h, 08ah, 049h, 08ah, 087h, 03fh, 04dh
        db      0a2h, 058h, 08ah, 08ah, 087h, 040h, 04dh, 0a2h, 059h, 08ah, 08ah, 087h, 041h, 04dh, 0a2h, 05ah
        db      08ah, 08ah, 087h, 042h, 04dh, 0a2h, 05bh, 08ah, 08ah, 087h, 043h, 04dh, 0a2h, 05ch, 08ah, 08ah
        db      087h, 044h, 04dh, 0a2h, 05dh, 08ah, 08ah, 087h, 045h, 04dh, 098h, 0d1h, 0e0h, 0d1h, 0e0h, 0a2h
        db      05eh, 08ah, 08ah, 087h, 046h, 04dh, 098h, 0d1h, 0e0h, 0d1h, 0e0h, 0a2h, 05fh, 08ah, 08ah, 087h
        db      047h, 04dh, 098h, 08bh, 0d0h, 0d1h, 0e0h, 0d1h, 0e0h, 003h, 0c2h, 0b1h, 003h, 0d3h, 0e0h, 089h
        db      046h, 0f8h, 050h, 09ah, 037h, 000h, 042h, 0d9h, 083h, 0c4h, 002h, 0a3h, 060h, 08ah, 0c6h, 006h
        db      062h, 08ah, 0f7h, 0a0h, 025h, 04fh, 098h, 050h, 0b8h, 010h, 000h, 050h, 0b8h, 053h, 08ah, 050h
        db      09ah, 0e4h, 000h, 03eh, 0dfh, 083h, 0c4h, 006h, 0feh, 00eh, 04bh, 089h, 0ebh, 019h, 0c7h, 046h
        db      0fch, 001h, 000h, 0ebh, 012h, 03dh, 078h, 000h, 075h, 003h, 0e9h, 034h, 0fdh, 03dh, 079h, 000h
        db      075h, 003h, 0e9h, 039h, 0ffh, 0ebh, 0e7h, 0e9h, 061h, 0fbh, 08bh, 046h, 0fah, 08bh, 0e5h, 05dh
        db      0cbh, 055h, 08bh, 0ech, 08ah, 046h, 006h, 098h, 08bh, 0d0h, 0d1h, 0e0h, 0d1h, 0e0h, 003h, 0c2h
        db      0d1h, 0e0h, 08bh, 0d8h, 08ah, 087h, 03eh, 04dh, 0feh, 0c0h, 0a2h, 03fh, 0aeh, 08ah, 046h, 006h
        db      098h, 08bh, 0d0h, 0d1h, 0e0h, 0d1h, 0e0h, 003h, 0c2h, 0d1h, 0e0h, 08bh, 0d8h, 08ah, 087h, 040h
        db      04dh, 0feh, 0c0h, 0a2h, 040h, 0aeh, 08ah, 046h, 006h, 098h, 08bh, 0d0h, 0d1h, 0e0h, 0d1h, 0e0h
        db      003h, 0c2h, 0d1h, 0e0h, 08bh, 0d8h, 08ah, 087h, 041h, 04dh, 0a2h, 041h, 0aeh, 08ah, 046h, 006h
        db      098h, 08bh, 0d0h, 0d1h, 0e0h, 0d1h, 0e0h, 003h, 0c2h, 0d1h, 0e0h, 08bh, 0d8h, 08ah, 087h, 042h
        db      04dh, 0a2h, 042h, 0aeh, 08ah, 046h, 006h, 098h, 08bh, 0d0h, 0d1h, 0e0h, 0d1h, 0e0h, 003h, 0c2h
        db      0d1h, 0e0h, 08bh, 0d8h, 08ah, 087h, 043h, 04dh, 0a2h, 043h, 0aeh, 08ah, 046h, 006h, 098h, 08bh
        db      0d0h, 0d1h, 0e0h, 0d1h, 0e0h, 003h, 0c2h, 0d1h, 0e0h, 08bh, 0d8h, 08ah, 087h, 044h, 04dh, 0feh
        db      0c0h, 0a2h, 044h, 0aeh, 08ah, 046h, 006h, 098h, 08bh, 0d0h, 0d1h, 0e0h, 0d1h, 0e0h, 003h, 0c2h
        db      0d1h, 0e0h, 08bh, 0d8h, 08ah, 087h, 045h, 04dh, 0a2h, 045h, 0aeh, 08ah, 046h, 006h, 098h, 08bh
        db      0d0h, 0d1h, 0e0h, 0d1h, 0e0h, 003h, 0c2h, 0d1h, 0e0h, 08bh, 0d8h, 08ah, 087h, 046h, 04dh, 0a2h
        db      046h, 0aeh, 08ah, 046h, 006h, 098h, 08bh, 0d0h, 0d1h, 0e0h, 0d1h, 0e0h, 003h, 0c2h, 0d1h, 0e0h
        db      08bh, 0d8h, 08ah, 087h, 047h, 04dh, 0a2h, 047h, 0aeh, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech
        db      0b8h, 008h, 000h, 050h, 0b8h, 003h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h
        db      08bh, 05eh, 006h, 08ah, 087h, 09eh, 04ch, 098h, 08bh, 0d8h, 0d1h, 0e3h, 0ffh, 0b7h, 0a6h, 00ch
        db      0b8h, 024h, 01dh, 050h, 09ah, 005h, 000h, 03fh, 0d7h, 083h, 0c4h, 004h, 0b8h, 013h, 000h, 050h
        db      09ah, 001h, 000h, 03ch, 0d7h, 083h, 0c4h, 002h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 0ffh
        db      076h, 006h, 0ffh, 076h, 008h, 09ah, 03dh, 013h, 0adh, 0c1h, 083h, 0c4h, 004h, 0a2h, 098h, 04ch
        db      0c6h, 006h, 097h, 04ch, 000h, 098h, 08bh, 0c8h, 081h, 0e1h, 00fh, 000h, 0a0h, 09ch, 04ch, 098h
        db      03bh, 0c8h, 075h, 005h, 080h, 00eh, 097h, 04ch, 004h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech
        db      083h, 0c4h, 0eeh, 0c6h, 006h, 011h, 0a2h, 000h, 09ah, 009h, 000h, 031h, 0d7h, 033h, 0c0h, 050h
        db      09ah, 00fh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 080h, 03eh, 09ah, 090h, 000h, 07dh, 00dh, 0a0h
        db      028h, 099h, 098h, 050h, 09ah, 006h, 000h, 0f3h, 0d4h, 083h, 0c4h, 002h, 033h, 0c0h, 0c7h, 046h
        db      0fah, 000h, 000h, 089h, 046h, 0f2h, 089h, 046h, 0f4h, 089h, 046h, 0f8h, 0ffh, 076h, 0f4h, 0ffh
        db      076h, 0f2h, 050h, 0a0h, 083h, 051h, 098h, 050h, 09ah, 001h, 009h, 021h, 0c4h, 083h, 0c4h, 008h
        db      083h, 07eh, 0fah, 000h, 074h, 003h, 0e9h, 0f2h, 002h, 033h, 0c0h, 050h, 09ah, 008h, 000h, 07eh
        db      0e3h, 083h, 0c4h, 002h, 089h, 046h, 0fch, 0e9h, 0c7h, 002h, 033h, 0c0h, 083h, 07eh, 0f4h, 000h
        db      075h, 003h, 0b8h, 001h, 000h, 089h, 046h, 0f4h, 0ffh, 076h, 0f8h, 0ffh, 076h, 0f2h, 050h, 09ah
        db      06ah, 006h, 021h, 0c4h, 083h, 0c4h, 006h, 0e9h, 0beh, 002h, 0c7h, 046h, 0f2h, 001h, 000h, 0ffh
        db      076h, 0f8h, 0ffh, 076h, 0f2h, 0ffh, 076h, 0f4h, 09ah, 06ah, 006h, 021h, 0c4h, 083h, 0c4h, 006h
        db      0e9h, 0a5h, 002h, 0c7h, 046h, 0f2h, 000h, 000h, 0ffh, 076h, 0f8h, 0ffh, 076h, 0f2h, 0ffh, 076h
        db      0f4h, 09ah, 06ah, 006h, 021h, 0c4h, 083h, 0c4h, 006h, 0e9h, 08ch, 002h, 083h, 07eh, 0f8h, 000h
        db      074h, 027h, 083h, 07eh, 0f4h, 000h, 074h, 005h, 0ffh, 04eh, 0f8h, 0ebh, 01ch, 0ffh, 076h, 0f8h
        db      09ah, 012h, 00dh, 021h, 0c4h, 083h, 0c4h, 002h, 0ffh, 04eh, 0f8h, 0ffh, 076h, 0f8h, 0ffh, 076h
        db      0f2h, 09ah, 067h, 007h, 021h, 0c4h, 083h, 0c4h, 004h, 0e9h, 05ch, 002h, 083h, 07eh, 0f8h, 00fh
        db      07dh, 027h, 083h, 07eh, 0f4h, 000h, 074h, 005h, 0ffh, 046h, 0f8h, 0ebh, 01ch, 0ffh, 076h, 0f8h
        db      09ah, 012h, 00dh, 021h, 0c4h, 083h, 0c4h, 002h, 0ffh, 046h, 0f8h, 0ffh, 076h, 0f8h, 0ffh, 076h
        db      0f2h, 09ah, 067h, 007h, 021h, 0c4h, 083h, 0c4h, 004h, 0e9h, 02ch, 002h, 0a0h, 079h, 051h, 098h
        db      089h, 046h, 0f6h, 080h, 03eh, 083h, 051h, 000h, 074h, 00bh, 083h, 07eh, 0f6h, 010h, 07dh, 003h
        db      0e9h, 01dh, 0ffh, 0ebh, 009h, 083h, 07eh, 0f6h, 010h, 07ch, 003h, 0e9h, 012h, 0ffh, 083h, 07eh
        db      0f4h, 000h, 075h, 00bh, 0ffh, 076h, 0f8h, 09ah, 012h, 00dh, 021h, 0c4h, 083h, 0c4h, 002h, 08bh
        db      046h, 0f6h, 089h, 046h, 0f8h, 0b9h, 010h, 000h, 08bh, 046h, 0f8h, 099h, 0f7h, 0f9h, 089h, 056h
        db      0f8h, 083h, 07eh, 0f4h, 000h, 075h, 017h, 052h, 09ah, 012h, 00dh, 021h, 0c4h, 083h, 0c4h, 002h
        db      0ffh, 076h, 0f8h, 0ffh, 076h, 0f2h, 09ah, 067h, 007h, 021h, 0c4h, 083h, 0c4h, 004h, 0e9h, 0c7h
        db      001h, 0a0h, 0cch, 089h, 098h, 0e9h, 07ch, 000h, 0c7h, 046h, 0f0h, 000h, 000h, 0a0h, 083h, 051h
        db      098h, 003h, 046h, 0f0h, 089h, 046h, 0eeh, 08bh, 0d8h, 080h, 0bfh, 06ch, 089h, 0ffh, 074h, 01eh
        db      08ah, 087h, 06ch, 089h, 098h, 050h, 0a0h, 083h, 051h, 098h, 050h, 0ffh, 076h, 0f0h, 09ah, 0c5h
        db      006h, 021h, 0c4h, 083h, 0c4h, 006h, 08bh, 05eh, 0eeh, 0c6h, 087h, 06ch, 089h, 0ffh, 0ffh, 046h
        db      0f0h, 083h, 07eh, 0f0h, 010h, 07ch, 0c6h, 0ebh, 048h, 0c7h, 046h, 0f0h, 000h, 000h, 0a0h, 083h
        db      051h, 098h, 003h, 046h, 0f0h, 089h, 046h, 0eeh, 08bh, 0d8h, 080h, 0bfh, 08ch, 089h, 0ffh, 074h
        db      018h, 0a0h, 083h, 051h, 098h, 050h, 0ffh, 076h, 0f0h, 09ah, 0b1h, 009h, 021h, 0c4h, 083h, 0c4h
        db      004h, 08bh, 05eh, 0eeh, 0c6h, 087h, 08ch, 089h, 0ffh, 0ffh, 046h, 0f0h, 083h, 07eh, 0f0h, 010h
        db      07ch, 0cch, 0ebh, 00dh, 03dh, 001h, 000h, 075h, 003h, 0e9h, 07ch, 0ffh, 03dh, 002h, 000h, 074h
        db      0b8h, 0c6h, 006h, 0cch, 089h, 000h, 0e9h, 02fh, 001h, 0ffh, 076h, 0f4h, 0ffh, 076h, 0f2h, 0ffh
        db      076h, 0f8h, 0a0h, 083h, 051h, 098h, 050h, 09ah, 001h, 009h, 021h, 0c4h, 083h, 0c4h, 008h, 0e9h
        db      016h, 001h, 083h, 07eh, 0f4h, 000h, 074h, 023h, 0c7h, 046h, 0feh, 000h, 000h, 0ffh, 076h, 0f2h
        db      0a0h, 083h, 051h, 098h, 050h, 0ffh, 076h, 0feh, 09ah, 0f3h, 00eh, 021h, 0c4h, 083h, 0c4h, 006h
        db      0ffh, 046h, 0feh, 083h, 07eh, 0feh, 010h, 07ch, 0e4h, 0ebh, 013h, 0ffh, 076h, 0f2h, 0a0h, 083h
        db      051h, 098h, 050h, 0ffh, 076h, 0f8h, 09ah, 0f3h, 00eh, 021h, 0c4h, 083h, 0c4h, 006h, 0e9h, 0d7h
        db      000h, 083h, 07eh, 0f4h, 000h, 074h, 023h, 0c7h, 046h, 0feh, 000h, 000h, 0ffh, 076h, 0f2h, 0a0h
        db      083h, 051h, 098h, 050h, 0ffh, 076h, 0feh, 09ah, 043h, 00bh, 021h, 0c4h, 083h, 0c4h, 006h, 0ffh
        db      046h, 0feh, 083h, 07eh, 0feh, 010h, 07ch, 0e4h, 0ebh, 013h, 0ffh, 076h, 0f2h, 0a0h, 083h, 051h
        db      098h, 050h, 0ffh, 076h, 0f8h, 09ah, 043h, 00bh, 021h, 0c4h, 083h, 0c4h, 006h, 0e9h, 098h, 000h
        db      080h, 03eh, 07dh, 051h, 000h, 075h, 00fh, 09ah, 09eh, 00eh, 021h, 0c4h, 09ah, 0efh, 00ah, 030h
        db      0d8h, 0c6h, 006h, 07dh, 051h, 001h, 0e9h, 07fh, 000h, 080h, 03eh, 07dh, 051h, 000h, 074h, 00ah
        db      09ah, 0e1h, 00dh, 021h, 0c4h, 0c6h, 006h, 07dh, 051h, 000h, 0ebh, 06ch, 033h, 0c0h, 050h, 0ffh
        db      076h, 0fch, 09ah, 025h, 001h, 004h, 0d9h, 083h, 0c4h, 004h, 089h, 046h, 0fch, 083h, 07eh, 0fch
        db      000h, 074h, 00ah, 09ah, 09eh, 00eh, 021h, 0c4h, 0c7h, 046h, 0fah, 001h, 000h, 0ebh, 049h, 021h
        db      000h, 02bh, 000h, 02dh, 000h, 03ch, 000h, 03eh, 000h, 044h, 000h, 048h, 000h, 050h, 000h, 05eh
        db      000h, 064h, 000h, 068h, 000h, 078h, 000h, 0a6h, 000h, 035h, 002h, 074h, 002h, 0bfh, 000h, 0efh
        db      000h, 01fh, 001h, 0b3h, 002h, 084h, 001h, 08dh, 000h, 01ch, 002h, 0cch, 002h, 06dh, 000h, 0dfh
        db      002h, 006h, 08ch, 0c9h, 08eh, 0c1h, 057h, 0bfh, 002h, 003h, 0b9h, 00dh, 000h, 0fch, 0f2h, 0afh
        db      026h, 08bh, 04dh, 016h, 05fh, 007h, 0ffh, 0e1h, 0e9h, 005h, 0fdh, 09ah, 003h, 000h, 056h, 0d6h
        db      08bh, 046h, 0fch, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0eeh, 0c6h, 006h, 011h
        db      0a2h, 000h, 09ah, 009h, 000h, 031h, 0d7h, 033h, 0c0h, 050h, 09ah, 00fh, 000h, 031h, 0d7h, 083h
        db      0c4h, 002h, 080h, 03eh, 09ah, 090h, 000h, 07dh, 00dh, 0a0h, 028h, 099h, 098h, 050h, 09ah, 006h
        db      000h, 0f3h, 0d4h, 083h, 0c4h, 002h, 033h, 0c0h, 0c7h, 046h, 0f6h, 000h, 000h, 089h, 046h, 0f0h
        db      089h, 046h, 0f2h, 089h, 046h, 0f4h, 0ffh, 076h, 0f2h, 0ffh, 076h, 0f0h, 050h, 0a0h, 083h, 051h
        db      098h, 050h, 09ah, 055h, 008h, 021h, 0c4h, 083h, 0c4h, 008h, 083h, 07eh, 0f6h, 000h, 074h, 003h
        db      0e9h, 062h, 002h, 033h, 0c0h, 050h, 09ah, 008h, 000h, 07eh, 0e3h, 083h, 0c4h, 002h, 089h, 046h
        db      0f8h, 0e9h, 037h, 002h, 033h, 0c0h, 083h, 07eh, 0f2h, 000h, 075h, 003h, 0b8h, 001h, 000h, 089h
        db      046h, 0f2h, 0ffh, 076h, 0f4h, 0ffh, 076h, 0f0h, 050h, 09ah, 06ah, 006h, 021h, 0c4h, 083h, 0c4h
        db      006h, 0e9h, 02eh, 002h, 083h, 07eh, 0f4h, 000h, 074h, 027h, 083h, 07eh, 0f2h, 000h, 074h, 005h
        db      0ffh, 04eh, 0f4h, 0ebh, 01ch, 0ffh, 076h, 0f4h, 09ah, 012h, 00dh, 021h, 0c4h, 083h, 0c4h, 002h
        db      0ffh, 04eh, 0f4h, 0ffh, 076h, 0f4h, 0ffh, 076h, 0f0h, 09ah, 067h, 007h, 021h, 0c4h, 083h, 0c4h
        db      004h, 0e9h, 0feh, 001h, 083h, 07eh, 0f4h, 00fh, 07dh, 027h, 083h, 07eh, 0f2h, 000h, 074h, 005h
        db      0ffh, 046h, 0f4h, 0ebh, 01ch, 0ffh, 076h, 0f4h, 09ah, 012h, 00dh, 021h, 0c4h, 083h, 0c4h, 002h
        db      0ffh, 046h, 0f4h, 0ffh, 076h, 0f4h, 0ffh, 076h, 0f0h, 09ah, 067h, 007h, 021h, 0c4h, 083h, 0c4h
        db      004h, 0e9h, 0ceh, 001h, 0a0h, 079h, 051h, 098h, 089h, 046h, 0eeh, 080h, 03eh, 083h, 051h, 000h
        db      074h, 00bh, 083h, 07eh, 0eeh, 010h, 07dh, 003h, 0e9h, 04fh, 0ffh, 0ebh, 009h, 083h, 07eh, 0eeh
        db      010h, 07ch, 003h, 0e9h, 044h, 0ffh, 083h, 07eh, 0f2h, 000h, 075h, 00bh, 0ffh, 076h, 0f4h, 09ah
        db      012h, 00dh, 021h, 0c4h, 083h, 0c4h, 002h, 08bh, 046h, 0eeh, 089h, 046h, 0f4h, 0b9h, 010h, 000h
        db      08bh, 046h, 0f4h, 099h, 0f7h, 0f9h, 089h, 056h, 0f4h, 083h, 07eh, 0f2h, 000h, 075h, 017h, 052h
        db      09ah, 012h, 00dh, 021h, 0c4h, 083h, 0c4h, 002h, 0ffh, 076h, 0f4h, 0ffh, 076h, 0f0h, 09ah, 067h
        db      007h, 021h, 0c4h, 083h, 0c4h, 004h, 0e9h, 069h, 001h, 080h, 03eh, 0cch, 089h, 003h, 075h, 03fh
        db      0c7h, 046h, 0fch, 000h, 000h, 0a0h, 083h, 051h, 098h, 003h, 046h, 0fch, 089h, 046h, 0fah, 08bh
        db      0d8h, 080h, 0bfh, 0ach, 089h, 0ffh, 074h, 01eh, 08ah, 087h, 0ach, 089h, 098h, 050h, 0a0h, 083h
        db      051h, 098h, 050h, 0ffh, 076h, 0fch, 09ah, 0c5h, 006h, 021h, 0c4h, 083h, 0c4h, 006h, 08bh, 05eh
        db      0fah, 0c6h, 087h, 0ach, 089h, 0ffh, 0ffh, 046h, 0fch, 083h, 07eh, 0fch, 010h, 07ch, 0c6h, 0c6h
        db      006h, 0cch, 089h, 000h, 0e9h, 01bh, 001h, 0ffh, 076h, 0f2h, 0ffh, 076h, 0f0h, 0ffh, 076h, 0f4h
        db      0a0h, 083h, 051h, 098h, 050h, 09ah, 055h, 008h, 021h, 0c4h, 083h, 0c4h, 008h, 0e9h, 002h, 001h
        db      083h, 07eh, 0f2h, 000h, 074h, 020h, 0c7h, 046h, 0feh, 000h, 000h, 0a0h, 083h, 051h, 098h, 050h
        db      0ffh, 076h, 0feh, 09ah, 026h, 010h, 021h, 0c4h, 083h, 0c4h, 004h, 0ffh, 046h, 0feh, 083h, 07eh
        db      0feh, 010h, 07ch, 0e7h, 0ebh, 010h, 0a0h, 083h, 051h, 098h, 050h, 0ffh, 076h, 0f4h, 09ah, 026h
        db      010h, 021h, 0c4h, 083h, 0c4h, 004h, 0e9h, 0c9h, 000h, 083h, 07eh, 0f2h, 000h, 074h, 020h, 0c7h
        db      046h, 0feh, 000h, 000h, 0a0h, 083h, 051h, 098h, 050h, 0ffh, 076h, 0feh, 09ah, 076h, 00ch, 021h
        db      0c4h, 083h, 0c4h, 004h, 0ffh, 046h, 0feh, 083h, 07eh, 0feh, 010h, 07ch, 0e7h, 0ebh, 010h, 0a0h
        db      083h, 051h, 098h, 050h, 0ffh, 076h, 0f4h, 09ah, 076h, 00ch, 021h, 0c4h, 083h, 0c4h, 004h, 0e9h
        db      090h, 000h, 080h, 03eh, 07dh, 051h, 000h, 075h, 00fh, 09ah, 09eh, 00eh, 021h, 0c4h, 09ah, 0efh
        db      00ah, 030h, 0d8h, 0c6h, 006h, 07dh, 051h, 001h, 0e9h, 077h, 000h, 080h, 03eh, 07dh, 051h, 000h
        db      074h, 00ah, 09ah, 0e1h, 00dh, 021h, 0c4h, 0c6h, 006h, 07dh, 051h, 000h, 0ebh, 064h, 033h, 0c0h
        db      050h, 0ffh, 076h, 0f8h, 09ah, 025h, 001h, 004h, 0d9h, 083h, 0c4h, 004h, 089h, 046h, 0f8h, 083h
        db      07eh, 0f8h, 000h, 074h, 00ah, 09ah, 09eh, 00eh, 021h, 0c4h, 0c7h, 046h, 0f6h, 001h, 000h, 0ebh
        db      041h, 02bh, 000h, 02dh, 000h, 03ch, 000h, 03eh, 000h, 044h, 000h, 048h, 000h, 050h, 000h, 064h
        db      000h, 068h, 000h, 078h, 000h, 013h, 005h, 04ch, 005h, 0e7h, 003h, 017h, 004h, 047h, 004h, 085h
        db      005h, 0ach, 004h, 0fah, 004h, 09eh, 005h, 0c7h, 003h, 0b1h, 005h, 006h, 08ch, 0c9h, 08eh, 0c1h
        db      057h, 0bfh, 0d4h, 005h, 0b9h, 00bh, 000h, 0fch, 0f2h, 0afh, 026h, 08bh, 04dh, 012h, 05fh, 007h
        db      0ffh, 0e1h, 0e9h, 095h, 0fdh, 09ah, 003h, 000h, 056h, 0d6h, 08bh, 046h, 0f8h, 08bh, 0e5h, 05dh
        db      0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0feh, 033h, 0c0h, 050h, 0b8h, 00ah, 000h, 050h, 09ah, 031h
        db      00eh, 021h, 0c4h, 083h, 0c4h, 004h, 033h, 0c0h, 050h, 0b8h, 00bh, 000h, 050h, 09ah, 031h, 00eh
        db      021h, 0c4h, 083h, 0c4h, 004h, 0c7h, 046h, 0feh, 000h, 000h, 033h, 0c0h, 050h, 0b8h, 00ch, 000h
        db      050h, 09ah, 031h, 00eh, 021h, 0c4h, 083h, 0c4h, 004h, 0ffh, 046h, 0feh, 081h, 07eh, 0feh, 080h
        db      007h, 07ch, 0e7h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0feh, 083h, 07eh, 006h
        db      000h, 074h, 01eh, 0c7h, 046h, 0feh, 000h, 000h, 0ffh, 076h, 0feh, 0ffh, 076h, 008h, 09ah, 067h
        db      007h, 021h, 0c4h, 083h, 0c4h, 004h, 0ffh, 046h, 0feh, 083h, 07eh, 0feh, 010h, 07ch, 0e9h, 0ebh
        db      01fh, 0c7h, 046h, 0feh, 000h, 000h, 08bh, 046h, 0feh, 03bh, 046h, 00ah, 074h, 009h, 050h, 09ah
        db      012h, 00dh, 021h, 0c4h, 083h, 0c4h, 002h, 0ffh, 046h, 0feh, 083h, 07eh, 0feh, 010h, 07ch, 0e6h
        db      0ffh, 076h, 00ah, 0ffh, 076h, 008h, 09ah, 067h, 007h, 021h, 0c4h, 083h, 0c4h, 004h, 08bh, 0e5h
        db      05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0f6h, 08bh, 046h, 006h, 08bh, 0d0h, 0b1h, 004h, 0d3h
        db      0e0h, 02bh, 0c2h, 005h, 007h, 000h, 089h, 046h, 0feh, 0c7h, 046h, 0f6h, 00bh, 005h, 08bh, 046h
        db      00ah, 08bh, 0d0h, 0d1h, 0e0h, 003h, 0c2h, 005h, 004h, 000h, 0b9h, 008h, 000h, 099h, 0f7h, 0f9h
        db      089h, 046h, 0f8h, 0c7h, 046h, 0fah, 000h, 000h, 0ebh, 020h, 0ffh, 036h, 048h, 0aeh, 0b8h, 003h
        db      000h, 050h, 033h, 0c0h, 050h, 0ffh, 076h, 0feh, 0ffh, 076h, 0f6h, 09ah, 00fh, 000h, 0f0h, 0dch
        db      083h, 0c4h, 00ah, 083h, 046h, 0f6h, 01eh, 0ffh, 046h, 0fah, 0b8h, 030h, 000h, 02bh, 046h, 0f8h
        db      08bh, 04eh, 0fah, 03bh, 0c8h, 07ch, 0d3h, 0c7h, 046h, 0fah, 000h, 000h, 0ebh, 02ah, 0ffh, 036h
        db      048h, 0aeh, 0b8h, 003h, 000h, 050h, 0b8h, 007h, 000h, 050h, 0ffh, 076h, 0feh, 0ffh, 076h, 0f6h
        db      09ah, 00fh, 000h, 0f0h, 0dch, 083h, 0c4h, 00ah, 089h, 046h, 0fch, 083h, 07eh, 0fch, 000h, 074h
        db      00fh, 083h, 046h, 0f6h, 01eh, 0ffh, 046h, 0fah, 08bh, 046h, 0fah, 03bh, 046h, 0f8h, 07ch, 0ceh
        db      08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0f8h, 08bh, 05eh, 006h, 0d1h, 0e3h, 08bh
        db      087h, 0bfh, 001h, 089h, 046h, 0f8h, 08bh, 046h, 008h, 08bh, 0d0h, 0b1h, 004h, 0d3h, 0e0h, 02bh
        db      0c2h, 005h, 003h, 000h, 089h, 046h, 0feh, 0c7h, 046h, 0fah, 093h, 004h, 0c7h, 046h, 0fch, 000h
        db      000h, 0ffh, 036h, 048h, 0aeh, 0b8h, 005h, 000h, 050h, 08bh, 05eh, 0f8h, 0ffh, 046h, 0f8h, 08ah
        db      007h, 098h, 050h, 0ffh, 076h, 0feh, 0ffh, 076h, 0fah, 09ah, 00fh, 000h, 0f0h, 0dch, 083h, 0c4h
        db      00ah, 083h, 046h, 0fah, 01eh, 0ffh, 046h, 0fch, 083h, 07eh, 0fch, 003h, 07ch, 0d3h, 08bh, 0e5h
        db      05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0f2h, 0c7h, 046h, 0feh, 000h, 000h, 0c7h, 046h, 0f8h
        db      000h, 000h, 0ebh, 074h, 0c7h, 046h, 0f2h, 00bh, 005h, 08bh, 05eh, 0feh, 003h, 05eh, 006h, 0d1h
        db      0e3h, 08bh, 087h, 0c4h, 00bh, 089h, 046h, 0f4h, 0c7h, 046h, 0fch, 000h, 000h, 08bh, 05eh, 0f4h
        db      0ffh, 046h, 0f4h, 08ah, 007h, 098h, 050h, 09ah, 069h, 00eh, 021h, 0c4h, 083h, 0c4h, 002h, 089h
        db      046h, 0f6h, 0c7h, 046h, 0fah, 000h, 000h, 0ffh, 036h, 048h, 0aeh, 0b8h, 005h, 000h, 050h, 08bh
        db      05eh, 0f6h, 0ffh, 046h, 0f6h, 08ah, 007h, 098h, 050h, 0ffh, 076h, 0f8h, 0ffh, 076h, 0f2h, 09ah
        db      00fh, 000h, 0f0h, 0dch, 083h, 0c4h, 00ah, 083h, 046h, 0f2h, 01eh, 0ffh, 046h, 0fah, 083h, 07eh
        db      0fah, 009h, 07ch, 0d3h, 083h, 046h, 0f2h, 078h, 0ffh, 046h, 0fch, 083h, 07eh, 0fch, 004h, 07ch
        db      0ach, 0ffh, 046h, 0feh, 083h, 046h, 0f8h, 00fh, 083h, 07eh, 0feh, 010h, 07ch, 086h, 08bh, 0e5h
        db      05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0fah, 0ffh, 006h, 048h, 0aeh, 0c7h, 046h, 0feh, 000h
        db      000h, 08bh, 05eh, 0feh, 0c6h, 087h, 02bh, 003h, 000h, 0ffh, 046h, 0feh, 081h, 07eh, 0feh, 080h
        db      007h, 07ch, 0eeh, 0ffh, 076h, 006h, 09ah, 0c5h, 007h, 021h, 0c4h, 083h, 0c4h, 002h, 0b8h, 010h
        db      000h, 050h, 09ah, 0d5h, 00ah, 021h, 0c4h, 083h, 0c4h, 002h, 0c7h, 046h, 0fah, 02bh, 003h, 0b8h
        db      02ah, 01dh, 050h, 033h, 0c0h, 050h, 0ffh, 076h, 0fah, 09ah, 05dh, 00ah, 021h, 0c4h, 083h, 0c4h
        db      006h, 0ffh, 076h, 008h, 0ffh, 076h, 00ah, 0ffh, 076h, 00ch, 09ah, 06ah, 006h, 021h, 0c4h, 083h
        db      0c4h, 006h, 0ffh, 00eh, 048h, 0aeh, 09ah, 0e1h, 00dh, 021h, 0c4h, 0c7h, 046h, 0feh, 000h, 000h
        db      080h, 03eh, 02eh, 04fh, 000h, 075h, 00dh, 08bh, 05eh, 006h, 003h, 05eh, 0feh, 08ah, 087h, 036h
        db      04eh, 098h, 0ebh, 00bh, 08bh, 05eh, 006h, 003h, 05eh, 0feh, 08ah, 087h, 0e0h, 09bh, 098h, 089h
        db      046h, 0fch, 050h, 0ffh, 076h, 006h, 0ffh, 076h, 0feh, 09ah, 0c5h, 006h, 021h, 0c4h, 083h, 0c4h
        db      006h, 0ffh, 046h, 0feh, 083h, 07eh, 0feh, 010h, 07ch, 0c6h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh
        db      0ech, 083h, 0c4h, 0fch, 0ffh, 006h, 048h, 0aeh, 0c7h, 046h, 0feh, 000h, 000h, 08bh, 05eh, 0feh
        db      0c6h, 087h, 02bh, 003h, 000h, 0ffh, 046h, 0feh, 081h, 07eh, 0feh, 080h, 007h, 07ch, 0eeh, 033h
        db      0c0h, 050h, 09ah, 0d5h, 00ah, 021h, 0c4h, 083h, 0c4h, 002h, 0ffh, 076h, 006h, 09ah, 0c5h, 007h
        db      021h, 0c4h, 083h, 0c4h, 002h, 0c7h, 046h, 0feh, 000h, 000h, 0ffh, 076h, 006h, 0ffh, 076h, 0feh
        db      09ah, 0b1h, 009h, 021h, 0c4h, 083h, 0c4h, 004h, 0ffh, 046h, 0feh, 083h, 07eh, 0feh, 010h, 07ch
        db      0e9h, 0ffh, 076h, 008h, 0ffh, 076h, 00ah, 0ffh, 076h, 00ch, 09ah, 06ah, 006h, 021h, 0c4h, 083h
        db      0c4h, 006h, 0ffh, 00eh, 048h, 0aeh, 09ah, 0e1h, 00dh, 021h, 0c4h, 0c7h, 046h, 0feh, 000h, 000h
        db      080h, 03eh, 02dh, 04fh, 000h, 075h, 00dh, 08bh, 05eh, 006h, 003h, 05eh, 0feh, 08ah, 087h, 0f6h
        db      04dh, 098h, 0ebh, 00bh, 08bh, 05eh, 006h, 003h, 05eh, 0feh, 08ah, 087h, 0a0h, 09bh, 098h, 089h
        db      046h, 0fch, 050h, 0ffh, 076h, 006h, 0ffh, 076h, 0feh, 09ah, 0c5h, 006h, 021h, 0c4h, 083h, 0c4h
        db      006h, 0ffh, 046h, 0feh, 083h, 07eh, 0feh, 010h, 07ch, 0c6h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh
        db      0ech, 083h, 0c4h, 0f6h, 080h, 03eh, 02dh, 04fh, 000h, 075h, 00dh, 08bh, 05eh, 008h, 003h, 05eh
        db      006h, 08ah, 087h, 016h, 04eh, 098h, 0ebh, 00bh, 08bh, 05eh, 008h, 003h, 05eh, 006h, 08ah, 087h
        db      0c0h, 09bh, 098h, 089h, 046h, 0feh, 0c7h, 046h, 0f8h, 02bh, 003h, 08bh, 046h, 006h, 08bh, 0d0h
        db      0b1h, 004h, 0d3h, 0e0h, 02bh, 0c2h, 089h, 046h, 0fch, 08bh, 046h, 0feh, 005h, 003h, 000h, 0b9h
        db      009h, 000h, 099h, 0f7h, 0f9h, 08bh, 0d8h, 0d1h, 0e3h, 08bh, 087h, 0c3h, 001h, 089h, 046h, 0f6h
        db      0c7h, 046h, 0fah, 000h, 000h, 0ffh, 036h, 048h, 0aeh, 0b8h, 008h, 000h, 050h, 08bh, 05eh, 0f6h
        db      0ffh, 046h, 0f6h, 08ah, 007h, 098h, 050h, 08bh, 046h, 0fch, 005h, 003h, 000h, 050h, 0ffh, 076h
        db      0f8h, 09ah, 00fh, 000h, 0f0h, 0dch, 083h, 0c4h, 00ah, 0ffh, 036h, 048h, 0aeh, 0b8h, 003h, 000h
        db      050h, 08bh, 05eh, 0f6h, 0ffh, 046h, 0f6h, 08ah, 007h, 098h, 050h, 0ffh, 076h, 0fch, 0ffh, 076h
        db      0f8h, 09ah, 00fh, 000h, 0f0h, 0dch, 083h, 0c4h, 00ah, 083h, 046h, 0f8h, 01eh, 0ffh, 046h, 0fah
        db      083h, 07eh, 0fah, 00bh, 07ch, 0afh, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0f6h
        db      056h, 08bh, 046h, 008h, 089h, 046h, 0fah, 0c7h, 046h, 0feh, 000h, 000h, 0ebh, 054h, 08bh, 046h
        db      006h, 089h, 046h, 0f6h, 08bh, 076h, 00ah, 08bh, 05eh, 0feh, 08ah, 000h, 098h, 050h, 09ah, 069h
        db      00eh, 021h, 0c4h, 083h, 0c4h, 002h, 089h, 046h, 0f8h, 0c7h, 046h, 0fch, 000h, 000h, 0ffh, 036h
        db      048h, 0aeh, 0b8h, 005h, 000h, 050h, 08bh, 05eh, 0f8h, 0ffh, 046h, 0f8h, 08ah, 007h, 098h, 050h
        db      0ffh, 076h, 0fah, 0ffh, 076h, 0f6h, 09ah, 00fh, 000h, 0f0h, 0dch, 083h, 0c4h, 00ah, 083h, 046h
        db      0f6h, 01eh, 0ffh, 046h, 0fch, 083h, 07eh, 0fch, 009h, 07ch, 0d3h, 083h, 046h, 0fah, 006h, 0ffh
        db      046h, 0feh, 08bh, 076h, 00ah, 08bh, 05eh, 0feh, 080h, 038h, 000h, 075h, 0a1h, 05eh, 08bh, 0e5h
        db      05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0f8h, 056h, 08bh, 046h, 006h, 08bh, 0d0h, 0b1h, 004h
        db      0d3h, 0e0h, 02bh, 0c2h, 0d1h, 0e0h, 005h, 02bh, 003h, 089h, 046h, 0f8h, 08bh, 046h, 006h, 089h
        db      046h, 0fch, 0ebh, 041h, 0c7h, 046h, 0fah, 000h, 000h, 0c7h, 046h, 0feh, 00ch, 000h, 0ebh, 028h
        db      08bh, 046h, 0feh, 0b9h, 008h, 000h, 099h, 0f7h, 0f9h, 0b9h, 007h, 000h, 02bh, 0cah, 0b8h, 001h
        db      000h, 0d3h, 0e0h, 08bh, 076h, 0feh, 0d1h, 0feh, 0d1h, 0feh, 0d1h, 0feh, 08bh, 05eh, 0f8h, 008h
        db      000h, 0ffh, 046h, 0fah, 083h, 046h, 0feh, 00fh, 083h, 07eh, 0fah, 00fh, 07ch, 0d2h, 083h, 046h
        db      0f8h, 01eh, 0ffh, 046h, 0fch, 083h, 07eh, 0fch, 040h, 07ch, 0b9h, 05eh, 08bh, 0e5h, 05dh, 0cbh
        db      055h, 08bh, 0ech, 083h, 0c4h, 0fah, 08bh, 046h, 006h, 003h, 046h, 008h, 089h, 046h, 0feh, 083h
        db      07eh, 00ah, 000h, 074h, 003h, 0e9h, 08ch, 000h, 080h, 03eh, 02dh, 04fh, 000h, 074h, 009h, 08bh
        db      0d8h, 08ah, 087h, 0a0h, 09bh, 098h, 0ebh, 008h, 08bh, 05eh, 0feh, 08ah, 087h, 0f6h, 04dh, 098h
        db      089h, 046h, 0fch, 083h, 07eh, 0fch, 000h, 074h, 068h, 0a1h, 08bh, 051h, 0d1h, 0e0h, 029h, 046h
        db      0fch, 083h, 07eh, 0fch, 000h, 07dh, 005h, 0c7h, 046h, 0fch, 000h, 000h, 0ffh, 076h, 0fch, 0ffh
        db      076h, 0feh, 09ah, 00dh, 000h, 09dh, 0dch, 083h, 0c4h, 004h, 080h, 03eh, 02dh, 04fh, 000h, 074h
        db      011h, 0b8h, 001h, 000h, 050h, 0a0h, 028h, 099h, 098h, 050h, 09ah, 00ah, 000h, 0bch, 0d3h, 083h
        db      0c4h, 004h, 0bah, 000h, 000h, 0b8h, 001h, 000h, 08bh, 04eh, 0feh, 0e3h, 006h, 0d1h, 0e0h, 0d1h
        db      0d2h, 0e2h, 0fah, 009h, 006h, 05ch, 089h, 009h, 016h, 05eh, 089h, 080h, 00eh, 05ah, 089h, 001h
        db      0ffh, 076h, 0fch, 0ffh, 076h, 008h, 0ffh, 076h, 006h, 09ah, 0c5h, 006h, 021h, 0c4h, 083h, 0c4h
        db      006h, 0e9h, 08bh, 000h, 080h, 03eh, 02dh, 04fh, 000h, 074h, 00ah, 08bh, 05eh, 0feh, 08ah, 087h
        db      0c0h, 09bh, 098h, 0ebh, 008h, 08bh, 05eh, 0feh, 08ah, 087h, 016h, 04eh, 098h, 089h, 046h, 0fah
        db      083h, 07eh, 0fah, 000h, 074h, 069h, 0a1h, 08bh, 051h, 08bh, 0d0h, 0d1h, 0e0h, 003h, 0c2h, 029h
        db      046h, 0fah, 083h, 07eh, 0fah, 000h, 07dh, 005h, 0c7h, 046h, 0fah, 000h, 000h, 0ffh, 076h, 0fah
        db      0ffh, 076h, 0feh, 09ah, 036h, 000h, 09dh, 0dch, 083h, 0c4h, 004h, 080h, 03eh, 02dh, 04fh, 000h
        db      074h, 011h, 0b8h, 001h, 000h, 050h, 0a0h, 028h, 099h, 098h, 050h, 09ah, 00ah, 000h, 0bch, 0d3h
        db      083h, 0c4h, 004h, 0bah, 000h, 000h, 0b8h, 001h, 000h, 08bh, 04eh, 0feh, 0e3h, 006h, 0d1h, 0e0h
        db      0d1h, 0d2h, 0e2h, 0fah, 009h, 006h, 060h, 089h, 009h, 016h, 062h, 089h, 080h, 00eh, 05ah, 089h
        db      002h, 0ffh, 076h, 008h, 0ffh, 076h, 006h, 09ah, 0b1h, 009h, 021h, 0c4h, 083h, 0c4h, 004h, 08bh
        db      0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0fch, 08bh, 046h, 006h, 003h, 046h, 008h, 089h
        db      046h, 0feh, 080h, 03eh, 02eh, 04fh, 000h, 075h, 009h, 08bh, 0d8h, 08ah, 087h, 036h, 04eh, 098h
        db      0ebh, 008h, 08bh, 05eh, 0feh, 08ah, 087h, 0e0h, 09bh, 098h, 089h, 046h, 0fch, 083h, 07eh, 0fch
        db      000h, 074h, 068h, 0a1h, 08bh, 051h, 0d1h, 0e0h, 029h, 046h, 0fch, 083h, 07eh, 0fch, 000h, 07dh
        db      005h, 0c7h, 046h, 0fch, 000h, 000h, 0ffh, 076h, 0fch, 0ffh, 076h, 0feh, 09ah, 05fh, 000h, 09dh
        db      0dch, 083h, 0c4h, 004h, 080h, 03eh, 02dh, 04fh, 000h, 074h, 011h, 0b8h, 001h, 000h, 050h, 0a0h
        db      028h, 099h, 098h, 050h, 09ah, 00ah, 000h, 0bch, 0d3h, 083h, 0c4h, 004h, 0bah, 000h, 000h, 0b8h
        db      001h, 000h, 08bh, 04eh, 0feh, 0e3h, 006h, 0d1h, 0e0h, 0d1h, 0d2h, 0e2h, 0fah, 009h, 006h, 064h
        db      089h, 009h, 016h, 066h, 089h, 080h, 00eh, 05ah, 089h, 004h, 0ffh, 076h, 0fch, 0ffh, 076h, 008h
        db      0ffh, 076h, 006h, 09ah, 0c5h, 006h, 021h, 0c4h, 083h, 0c4h, 006h, 08bh, 0e5h, 05dh, 0cbh, 055h
        db      08bh, 0ech, 083h, 0c4h, 0fah, 08bh, 046h, 006h, 08bh, 0d0h, 0b1h, 004h, 0d3h, 0e0h, 02bh, 0c2h
        db      005h, 003h, 000h, 089h, 046h, 0feh, 0c7h, 046h, 0fah, 093h, 004h, 0c7h, 046h, 0fch, 000h, 000h
        db      0ffh, 036h, 048h, 0aeh, 0b8h, 005h, 000h, 050h, 033h, 0c0h, 050h, 0ffh, 076h, 0feh, 0ffh, 076h
        db      0fah, 09ah, 00fh, 000h, 0f0h, 0dch, 083h, 0c4h, 00ah, 083h, 046h, 0fah, 01eh, 0ffh, 046h, 0fch
        db      083h, 07eh, 0fch, 003h, 07ch, 0dah, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0fah
        db      033h, 0c0h, 050h, 0b8h, 00ah, 000h, 050h, 09ah, 031h, 00eh, 021h, 0c4h, 083h, 0c4h, 004h, 033h
        db      0c0h, 050h, 0b8h, 00bh, 000h, 050h, 09ah, 031h, 00eh, 021h, 0c4h, 083h, 0c4h, 004h, 0c7h, 046h
        db      0feh, 000h, 000h, 0c6h, 046h, 0fah, 000h, 08bh, 05eh, 0feh, 08ah, 087h, 02bh, 003h, 088h, 046h
        db      0fbh, 084h, 0c0h, 074h, 029h, 0c7h, 046h, 0fch, 000h, 000h, 08ah, 046h, 0fah, 098h, 0d1h, 0e0h
        db      088h, 046h, 0fah, 0f6h, 046h, 0fbh, 001h, 074h, 003h, 0feh, 046h, 0fah, 08ah, 046h, 0fbh, 098h
        db      0d1h, 0e8h, 088h, 046h, 0fbh, 0ffh, 046h, 0fch, 083h, 07eh, 0fch, 008h, 07ch, 0dch, 08ah, 046h
        db      0fah, 02ah, 0e4h, 050h, 0b8h, 00ch, 000h, 050h, 09ah, 031h, 00eh, 021h, 0c4h, 083h, 0c4h, 004h
        db      0ffh, 046h, 0feh, 081h, 07eh, 0feh, 080h, 007h, 07ch, 0a9h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh
        db      0ech, 0c6h, 006h, 05eh, 088h, 001h, 0b8h, 032h, 000h, 050h, 033h, 0c0h, 050h, 09ah, 031h, 00eh
        db      021h, 0c4h, 083h, 0c4h, 004h, 0b8h, 007h, 000h, 050h, 0b8h, 001h, 000h, 050h, 09ah, 031h, 00eh
        db      021h, 0c4h, 083h, 0c4h, 004h, 0b8h, 01dh, 000h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 031h, 00eh
        db      021h, 0c4h, 083h, 0c4h, 004h, 0b8h, 03fh, 000h, 050h, 0b8h, 003h, 000h, 050h, 09ah, 031h, 00eh
        db      021h, 0c4h, 083h, 0c4h, 004h, 09ah, 05dh, 00dh, 021h, 0c4h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh
        db      0ech, 0b8h, 0b0h, 000h, 050h, 09ah, 00eh, 000h, 0eeh, 0f0h, 083h, 0c4h, 002h, 0a9h, 080h, 000h
        db      074h, 002h, 0ebh, 0edh, 0ffh, 076h, 006h, 0b8h, 0b4h, 000h, 050h, 09ah, 023h, 000h, 0eeh, 0f0h
        db      083h, 0c4h, 004h, 0ffh, 076h, 008h, 0b8h, 0b6h, 000h, 050h, 09ah, 023h, 000h, 0eeh, 0f0h, 083h
        db      0c4h, 004h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0feh, 0c7h, 046h, 0feh, 000h
        db      000h, 0ebh, 019h, 08bh, 05eh, 0feh, 08ah, 087h, 05bh, 001h, 03ah, 046h, 006h, 075h, 00ah, 0d1h
        db      0e3h, 08bh, 087h, 07dh, 001h, 08bh, 0e5h, 05dh, 0cbh, 0ffh, 046h, 0feh, 08bh, 05eh, 0feh, 080h
        db      0bfh, 05bh, 001h, 000h, 075h, 0ddh, 0a1h, 07dh, 001h, 0ebh, 0eah, 055h, 08bh, 0ech, 09ah, 024h
        db      006h, 021h, 0c4h, 0b8h, 03ch, 000h, 050h, 033h, 0c0h, 050h, 09ah, 031h, 00eh, 021h, 0c4h, 083h
        db      0c4h, 004h, 0b8h, 075h, 000h, 050h, 0b8h, 001h, 000h, 050h, 09ah, 031h, 00eh, 021h, 0c4h, 083h
        db      0c4h, 004h, 0b8h, 027h, 000h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 031h, 00eh, 021h, 0c4h, 083h
        db      0c4h, 004h, 0b8h, 03fh, 000h, 050h, 0b8h, 003h, 000h, 050h, 09ah, 031h, 00eh, 021h, 0c4h, 083h
        db      0c4h, 004h, 09ah, 009h, 000h, 031h, 0d7h, 0c6h, 006h, 05eh, 088h, 000h, 08bh, 0e5h, 05dh, 0cbh
        db      055h, 08bh, 0ech, 083h, 0c4h, 0fah, 08bh, 046h, 006h, 003h, 046h, 008h, 089h, 046h, 0feh, 083h
        db      07eh, 00ah, 000h, 074h, 003h, 0e9h, 08ch, 000h, 080h, 03eh, 02dh, 04fh, 000h, 074h, 009h, 08bh
        db      0d8h, 08ah, 087h, 0a0h, 09bh, 098h, 0ebh, 008h, 08bh, 05eh, 0feh, 08ah, 087h, 0f6h, 04dh, 098h
        db      089h, 046h, 0fch, 083h, 07eh, 0fch, 07fh, 07dh, 068h, 0a1h, 08bh, 051h, 0d1h, 0e0h, 001h, 046h
        db      0fch, 083h, 07eh, 0fch, 07fh, 07eh, 005h, 0c7h, 046h, 0fch, 07fh, 000h, 0ffh, 076h, 0fch, 0ffh
        db      076h, 0feh, 09ah, 00dh, 000h, 09dh, 0dch, 083h, 0c4h, 004h, 080h, 03eh, 02dh, 04fh, 000h, 074h
        db      011h, 0b8h, 001h, 000h, 050h, 0a0h, 028h, 099h, 098h, 050h, 09ah, 00ah, 000h, 0bch, 0d3h, 083h
        db      0c4h, 004h, 0bah, 000h, 000h, 0b8h, 001h, 000h, 08bh, 04eh, 0feh, 0e3h, 006h, 0d1h, 0e0h, 0d1h
        db      0d2h, 0e2h, 0fah, 009h, 006h, 05ch, 089h, 009h, 016h, 05eh, 089h, 080h, 00eh, 05ah, 089h, 001h
        db      0ffh, 076h, 0fch, 0ffh, 076h, 008h, 0ffh, 076h, 006h, 09ah, 0c5h, 006h, 021h, 0c4h, 083h, 0c4h
        db      006h, 0e9h, 08bh, 000h, 080h, 03eh, 02dh, 04fh, 000h, 074h, 00ah, 08bh, 05eh, 0feh, 08ah, 087h
        db      0c0h, 09bh, 098h, 0ebh, 008h, 08bh, 05eh, 0feh, 08ah, 087h, 016h, 04eh, 098h, 089h, 046h, 0fah
        db      083h, 07eh, 0fah, 07fh, 07dh, 069h, 0a1h, 08bh, 051h, 08bh, 0d0h, 0d1h, 0e0h, 003h, 0c2h, 001h
        db      046h, 0fah, 083h, 07eh, 0fah, 07fh, 07ch, 005h, 0c7h, 046h, 0fah, 07fh, 000h, 0ffh, 076h, 0fah
        db      0ffh, 076h, 0feh, 09ah, 036h, 000h, 09dh, 0dch, 083h, 0c4h, 004h, 080h, 03eh, 02dh, 04fh, 000h
        db      074h, 011h, 0b8h, 001h, 000h, 050h, 0a0h, 028h, 099h, 098h, 050h, 09ah, 00ah, 000h, 0bch, 0d3h
        db      083h, 0c4h, 004h, 0bah, 000h, 000h, 0b8h, 001h, 000h, 08bh, 04eh, 0feh, 0e3h, 006h, 0d1h, 0e0h
        db      0d1h, 0d2h, 0e2h, 0fah, 009h, 006h, 060h, 089h, 009h, 016h, 062h, 089h, 080h, 00eh, 05ah, 089h
        db      002h, 0ffh, 076h, 008h, 0ffh, 076h, 006h, 09ah, 0b1h, 009h, 021h, 0c4h, 083h, 0c4h, 004h, 08bh
        db      0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0fch, 08bh, 046h, 006h, 003h, 046h, 008h, 089h
        db      046h, 0feh, 080h, 03eh, 02eh, 04fh, 000h, 075h, 009h, 08bh, 0d8h, 08ah, 087h, 036h, 04eh, 098h
        db      0ebh, 00bh, 08bh, 05eh, 006h, 003h, 05eh, 008h, 08ah, 087h, 0e0h, 09bh, 098h, 089h, 046h, 0fch
        db      083h, 07eh, 0fch, 07fh, 07dh, 068h, 0a1h, 08bh, 051h, 0d1h, 0e0h, 001h, 046h, 0fch, 083h, 07eh
        db      0fch, 07fh, 07ch, 005h, 0c7h, 046h, 0fch, 07fh, 000h, 0ffh, 076h, 0fch, 0ffh, 076h, 0feh, 09ah
        db      05fh, 000h, 09dh, 0dch, 083h, 0c4h, 004h, 080h, 03eh, 02dh, 04fh, 000h, 074h, 011h, 0b8h, 001h
        db      000h, 050h, 0a0h, 028h, 099h, 098h, 050h, 09ah, 00ah, 000h, 0bch, 0d3h, 083h, 0c4h, 004h, 0bah
        db      000h, 000h, 0b8h, 001h, 000h, 08bh, 04eh, 0feh, 0e3h, 006h, 0d1h, 0e0h, 0d1h, 0d2h, 0e2h, 0fah
        db      009h, 006h, 064h, 089h, 009h, 016h, 066h, 089h, 080h, 00eh, 05ah, 089h, 004h, 0ffh, 076h, 0fch
        db      0ffh, 076h, 008h, 0ffh, 076h, 006h, 09ah, 0c5h, 006h, 021h, 0c4h, 083h, 0c4h, 006h, 08bh, 0e5h
        db      05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0feh, 0b8h, 07fh, 01eh, 050h, 09ah, 00eh, 000h, 023h
        db      0d9h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 001h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h
        db      083h, 0c4h, 004h, 0b8h, 008h, 000h, 050h, 0b8h, 00eh, 000h, 050h, 033h, 0c0h, 050h, 0b8h, 002h
        db      000h, 050h, 0b8h, 0deh, 04dh, 050h, 0b8h, 089h, 01eh, 050h, 09ah, 0cah, 002h, 0bbh, 0d7h, 083h
        db      0c4h, 00ch, 0b8h, 00ah, 000h, 050h, 0b8h, 054h, 01dh, 050h, 0b8h, 0e0h, 04dh, 050h, 0b8h, 091h
        db      01eh, 050h, 09ah, 0cbh, 000h, 0bbh, 0d7h, 083h, 0c4h, 008h, 0b8h, 003h, 000h, 050h, 0b8h, 036h
        db      00bh, 050h, 0b8h, 0dfh, 04dh, 050h, 0b8h, 09ah, 01eh, 050h, 09ah, 0cbh, 000h, 0bbh, 0d7h, 083h
        db      0c4h, 008h, 033h, 0c0h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h
        db      004h, 0b8h, 0a5h, 01eh, 050h, 09ah, 00eh, 000h, 023h, 0d9h, 083h, 0c4h, 002h, 033h, 0c0h, 050h
        db      0b8h, 003h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 00dh, 000h, 050h
        db      0b8h, 0beh, 01dh, 050h, 0b8h, 0e1h, 04dh, 050h, 0b8h, 0b3h, 01eh, 050h, 09ah, 0cbh, 000h, 0bbh
        db      0d7h, 083h, 0c4h, 008h, 0b8h, 00dh, 000h, 050h, 0b8h, 0beh, 01dh, 050h, 0b8h, 0e2h, 04dh, 050h
        db      0b8h, 0bah, 01eh, 050h, 09ah, 0cbh, 000h, 0bbh, 0d7h, 083h, 0c4h, 008h, 033h, 0c0h, 050h, 0b8h
        db      004h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 0c2h, 01eh, 050h, 09ah
        db      00eh, 000h, 023h, 0d9h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 005h, 000h, 050h, 09ah, 026h
        db      000h, 031h, 0d7h, 083h, 0c4h, 004h, 09ah, 0a2h, 000h, 057h, 0d5h, 050h, 0b8h, 0c8h, 01eh, 050h
        db      09ah, 005h, 000h, 03fh, 0d7h, 083h, 0c4h, 004h, 033h, 0c0h, 050h, 0b8h, 006h, 000h, 050h, 09ah
        db      026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 026h
        db      000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 0e3h, 01eh, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h
        db      0c4h, 002h, 0c7h, 046h, 0feh, 000h, 000h, 083h, 07eh, 0feh, 000h, 074h, 003h, 0e9h, 092h, 000h
        db      0b8h, 004h, 000h, 050h, 09ah, 028h, 000h, 030h, 0d8h, 083h, 0c4h, 002h, 089h, 046h, 0feh, 085h
        db      0c0h, 075h, 01dh, 0a0h, 011h, 0a2h, 098h, 0ebh, 010h, 0a0h, 0e0h, 04dh, 098h, 08bh, 0d8h, 08ah
        db      087h, 01bh, 010h, 098h, 0a3h, 045h, 09ch, 0ebh, 005h, 03dh, 001h, 000h, 074h, 0ebh, 0ebh, 0d0h
        db      08bh, 046h, 0feh, 0ebh, 046h, 09ah, 04ch, 000h, 0cah, 0d6h, 080h, 03eh, 053h, 089h, 000h, 074h
        db      015h, 0b8h, 0d8h, 0ffh, 050h, 09ah, 00eh, 000h, 001h, 0ddh, 083h, 0c4h, 002h, 0a0h, 05bh, 050h
        db      098h, 089h, 046h, 0feh, 0ebh, 039h, 09ah, 0dch, 001h, 02dh, 0c5h, 089h, 046h, 0feh, 0ebh, 02fh
        db      09ah, 000h, 000h, 0dbh, 0e4h, 089h, 046h, 0feh, 0ebh, 025h, 0c7h, 046h, 0feh, 000h, 000h, 0ebh
        db      01eh, 09ah, 00fh, 000h, 052h, 0c5h, 089h, 046h, 0feh, 0ebh, 014h, 03dh, 075h, 000h, 074h, 0f1h
        db      03dh, 078h, 000h, 074h, 0b0h, 03dh, 079h, 000h, 074h, 0d6h, 03dh, 07ah, 000h, 074h, 0dbh, 0e9h
        db      065h, 0ffh, 08bh, 046h, 0feh, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0ffh, 0b8h
        db      0fdh, 01eh, 050h, 09ah, 010h, 014h, 04ah, 0c0h, 083h, 0c4h, 002h, 0b8h, 001h, 000h, 050h, 0b0h
        db      001h, 0c6h, 006h, 05ch, 050h, 001h, 098h, 050h, 0b8h, 04fh, 000h, 050h, 09ah, 078h, 070h, 0b7h
        db      0cbh, 083h, 0c4h, 006h, 0b8h, 05dh, 050h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h
        db      033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h
        db      00fh, 01fh, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 001h, 000h, 050h, 09ah
        db      028h, 000h, 030h, 0d8h, 083h, 0c4h, 002h, 088h, 046h, 0ffh, 084h, 0c0h, 075h, 002h, 0ebh, 0ebh
        db      03ch, 078h, 075h, 010h, 09ah, 004h, 000h, 0cfh, 0cah, 09ah, 01dh, 002h, 0a4h, 0e4h, 0a0h, 077h
        db      051h, 088h, 046h, 0ffh, 08ah, 046h, 0ffh, 098h, 08bh, 0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h
        db      0c4h, 0fdh, 0b8h, 024h, 01fh, 050h, 09ah, 010h, 014h, 04ah, 0c0h, 083h, 0c4h, 002h, 0c6h, 006h
        db      05ch, 050h, 002h, 033h, 0c0h, 050h, 0b8h, 002h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h
        db      0c4h, 004h, 0b8h, 034h, 01fh, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 0f7h
        db      011h, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 003h, 000h
        db      050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 003h, 000h, 050h, 0b8h, 036h, 00bh
        db      050h, 0b8h, 0dch, 04fh, 050h, 0b8h, 04bh, 01fh, 050h, 09ah, 0cbh, 000h, 0bbh, 0d7h, 083h, 0c4h
        db      008h, 033h, 0c0h, 050h, 0b8h, 004h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h
        db      0b8h, 003h, 000h, 050h, 0b8h, 044h, 00bh, 050h, 0b8h, 081h, 051h, 050h, 0b8h, 061h, 01fh, 050h
        db      09ah, 0cbh, 000h, 0bbh, 0d7h, 083h, 0c4h, 008h, 033h, 0c0h, 050h, 0b8h, 005h, 000h, 050h, 09ah
        db      026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 033h, 0c0h, 050h, 0b8h, 00fh, 027h, 050h, 0b8h, 00ah
        db      000h, 050h, 0b8h, 004h, 000h, 050h, 0b8h, 081h, 0aah, 050h, 0b8h, 06dh, 01fh, 050h, 09ah, 0cah
        db      002h, 0bbh, 0d7h, 083h, 0c4h, 00ch, 033h, 0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 026h, 000h
        db      031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 07eh, 01fh, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h
        db      002h, 0c7h, 046h, 0fdh, 002h, 000h, 0ffh, 076h, 0fdh, 09ah, 028h, 000h, 030h, 0d8h, 083h, 0c4h
        db      002h, 088h, 046h, 0ffh, 084h, 0c0h, 075h, 002h, 0ebh, 0ech, 098h, 0ebh, 014h, 09ah, 026h, 001h
        db      052h, 0c5h, 088h, 046h, 0ffh, 0ebh, 014h, 09ah, 05eh, 002h, 052h, 0c5h, 088h, 046h, 0ffh, 0ebh
        db      00ah, 03dh, 078h, 000h, 074h, 0e7h, 03dh, 079h, 000h, 074h, 0ech, 08ah, 046h, 0ffh, 098h, 08bh
        db      0e5h, 05dh, 0cbh, 055h, 08bh, 0ech, 083h, 0c4h, 0feh, 09ah, 003h, 000h, 030h, 0d8h, 09ah, 009h
        db      000h, 031h, 0d7h, 0b8h, 091h, 01fh, 050h, 09ah, 00eh, 000h, 023h, 0d9h, 083h, 0c4h, 002h, 033h
        db      0c0h, 050h, 0b8h, 007h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0b8h, 0a1h
        db      01fh, 050h, 09ah, 05bh, 000h, 031h, 0d7h, 083h, 0c4h, 002h, 0b8h, 001h, 000h, 085h, 0c0h, 074h
        db      017h, 09ah, 07dh, 001h, 052h, 0c5h, 09ah, 0d4h, 007h, 052h, 0c5h, 089h, 046h, 0feh, 085h, 0c0h
        db      074h, 004h, 08bh, 0e5h, 05dh, 0cbh, 0ebh, 0e2h, 0ebh, 0f8h, 055h, 08bh, 0ech, 033h, 0c0h, 050h
        db      0b8h, 001h, 000h, 050h, 09ah, 026h, 000h, 031h, 0d7h, 083h, 0c4h, 004h, 0ffh, 036h, 0e3h, 04fh
        db      0ffh, 036h, 0e1h, 04fh, 0ffh, 036h, 0e5h, 04fh, 0b8h, 0a8h, 01fh, 050h, 09ah, 005h, 000h, 03fh
        db      0d7h, 083h, 0c4h, 008h, 0ffh, 036h, 0f7h, 04fh, 0ffh, 036h, 0f5h, 04fh, 0ffh, 036h, 003h, 050h
        db      0ffh, 036h, 001h, 050h, 0b8h, 0cah, 01fh, 050h, 09ah, 005h, 000h, 03fh, 0d7h, 083h, 0c4h, 00ah
        db      0ffh, 036h, 0fbh, 04fh, 0ffh, 036h, 0f9h, 04fh, 0ffh, 036h, 0ffh, 04fh, 0ffh, 036h, 0fdh, 04fh
        db      0b8h, 0e8h, 01fh, 050h, 09ah, 005h, 000h, 03fh, 0d7h, 083h, 0c4h, 00ah, 0ffh, 036h, 019h, 050h
        db      0ffh, 036h, 017h, 050h, 0ffh, 036h, 015h, 050h, 0ffh, 036h, 013h, 050h, 0b8h, 006h, 020h, 050h
        db      09ah, 005h, 000h, 03fh, 0d7h, 083h, 0c4h, 00ah, 0ffh, 036h, 03fh, 050h, 0ffh, 036h, 03dh, 050h
        db      0ffh, 036h, 043h, 050h, 0ffh, 036h, 041h, 050h, 0b8h, 024h, 020h, 050h, 09ah
        endif
        if      FW_VERSION >= 214
        db      0c4h, 0f7h, 0b8h, 0edh, 01dh, 050h, 09ah, 05eh, 01ah, 04fh, 0c0h, 083h, 0c4h, 002h, 09ah, 053h
        db      000h, 093h, 0d7h, 033h, 0c0h, 050h, 0b8h, 001h, 000h, 050h, 09ah, 027h, 000h, 080h, 0d8h, 083h
        db      0c4h, 004h, 0b8h, 0ffh, 01dh, 050h, 09ah, 05ch, 000h, 080h, 0d8h, 083h, 0c4h, 002h, 0b8h, 04ah
        db      0b2h, 050h, 09ah, 0cbh, 004h, 00ah, 0d9h, 083h, 0c4h, 002h, 033h, 0c0h, 050h, 0b8h, 002h, 000h
        db      050h, 09ah, 027h, 000h, 080h, 0d8h, 083h, 0c4h, 004h, 0a0h, 04ah, 0b2h, 02ah, 0e4h, 08bh, 0d8h
        db      08ah, 087h, 082h, 04eh, 088h, 046h, 0f9h, 0a0h, 04ah, 0b2h, 02ah, 0e4h, 08bh, 0d8h, 08ah, 087h
        endif
        phase   0
isr_fe000:
        sti
        push    ds
        push    es
        push    bx
        push    cx
        push    dx
        push    si
        push    di
        mov     bx, dx
        mov     dx, es
        mov     ax, ds
        mov     es, ax
        mov     ax, 0
        mov     ds, ax
        xor     ax, ax
        mov     word ptr [420h], ax
        mov     word ptr [422h], dx
        mov     ax, 42ah
        mov     word ptr [426h], ax
        mov     ax, ds
        mov     word ptr [428h], ax
        if      FW_VERSION < 212
        mov     cx, 0bh
        else
        mov     cx, 14h
        endif
        mov     di, 42ah
loop_fe02f:
        mov     al, byte ptr es:[bx]
        if      FW_VERSION >= 212
        or      al, al
        jz      br_fe03c
        endif
        mov     byte ptr [di], al
        inc     bx
        inc     di
        loop    loop_fe02f
        if      FW_VERSION >= 212
br_fe03c:
        endif
        mov     byte ptr [di], 0
        mov     dx, word ptr [426h]
        mov     ax, 2
        int     41h
        or      ah, ah
        jz      br_fe04f
        jmp     br_fe1cc
br_fe04f:
        mov     word ptr [424h], ax
        mov     bx, ax
        mov     ax, 4
        mov     cx, 1ch
        mov     dx, 404h
        int     41h
        or      ah, ah
        jz      br_fe066
        jmp     br_fe1cc
br_fe066:
        cmp     cx, 1ch
        jz      br_fe072
        mov     ah, 1
        xor     al, al
        jmp     br_fe1cc
br_fe072:
        cmp     word ptr [404h], 5a4dh
        jz      br_fe081
        mov     ah, 2
        xor     al, al
        jmp     br_fe1cc
br_fe081:
        mov     ax, word ptr [40ch]
        mov     cl, 4
        shl     ax, cl
        sub     ax, 1ch
        mov     cx, ax
        push    cx
        mov     bx, word ptr [424h]
        push    ds
        lds     dx, dword ptr [420h]
        mov     ax, 4
        int     41h
        pop     ds
        or      ah, ah
        jz      br_fe0a5
        pop     cx
        jmp     br_fe1cc
br_fe0a5:
        pop     ax
        cmp     cx, ax
        jz      br_fe0b1
        mov     ah, 3
        xor     al, al
        jmp     br_fe1cc
br_fe0b1:
        mov     ax, word ptr [408h]
        xor     dx, dx
        cmp     word ptr [406h], 0
        jz      br_fe0be
        dec     ax
br_fe0be:
        mov     bx, 200h
        mul     bx
        add     ax, word ptr [406h]
        adc     dx, 0
        mov     bx, word ptr [40ch]
        mov     cl, 4
        shl     bx, cl
        sub     ax, bx
        sbb     dx, 0
        mov     si, dx
        mov     di, ax
        mov     bx, word ptr [424h]
        push    ds
        lds     dx, dword ptr [420h]
loop_fe0e4:
        mov     cx, 4000h
        or      si, si
        jnz     br_fe0f1
        cmp     di, cx
        ja      br_fe0f1
        mov     cx, di
br_fe0f1:
        push    cx
        mov     ax, 4
        int     41h
        or      ah, ah
        jz      br_fe100
        pop     cx
        pop     ds
        jmp     br_fe1cc
br_fe100:
        pop     ax
        cmp     ax, cx
        jz      br_fe10d
        pop     ds
        mov     ah, 4
        xor     al, al
        jmp     near br_fe1cc
br_fe10d:
        mov     ax, ds
        add     ax, 400h
        mov     ds, ax
        sub     di, cx
        sbb     si, 0
        mov     ax, si
        or      ax, di
        jnz     loop_fe0e4
        pop     ds
        mov     bx, word ptr [424h]
        mov     ax, 3
        int     41h
        or      ah, ah
        jz      br_fe130
        jmp     near br_fe1cc
br_fe130:
        mov     cx, word ptr [40ah]
        jcxz    br_fe1a3
        push    ds
        lds     dx, dword ptr [426h]
        mov     ax, 2
        int     41h
        pop     ds
        or      ah, ah
        jz      br_fe148
        jmp     near br_fe1cc
br_fe148:
        mov     word ptr [424h], ax
        mov     cx, word ptr [41ch]
        mov     dx, W_0443
        mov     ax, 4
        mov     bx, word ptr [424h]
        int     41h
        or      ah, ah
        jz      br_fe162
        jmp     br_fe1cc
        db      090h
br_fe162:
        mov     cx, word ptr [40ah]
loop_fe166:
        push    cx
        mov     bx, word ptr [424h]
        mov     cx, 4
        mov     dx, W_0443
        mov     ax, 4
        int     41h
        or      ah, ah
        jz      br_fe17e
        pop     cx
        jmp     br_fe1cc
        db      090h
br_fe17e:
        mov     bx, word ptr [W_0443]
        mov     dx, word ptr [W_0445]
        mov     ax, word ptr [422h]
        add     dx, ax
        mov     es, dx
        add     word ptr es:[bx], ax
        pop     cx
        loop    loop_fe166
        mov     bx, word ptr [424h]
        mov     ax, 3
        int     41h
        or      ah, ah
        jz      br_fe1a3
        jmp     br_fe1cc
        db      090h
br_fe1a3:
        pop     di
        pop     si
        pop     dx
        pop     cx
        pop     bx
        pop     es
        mov     di, word ptr [414h]
        mov     si, word ptr [412h]
        mov     ax, si
        or      ax, di
        jz      br_fe1bb
        add     si, word ptr [422h]
br_fe1bb:
        mov     ax, word ptr [41ah]
        add     ax, word ptr [422h]
        mov     es, ax
        mov     bx, word ptr [418h]
        pop     ds
        xor     ax, ax
        iret
br_fe1cc:
        pop     di
        pop     si
        pop     dx
        pop     cx
        pop     bx
        pop     es
        pop     ds
        iret
TBL_fe1d4:
        if      FW_VERSION < 212
        db      076h, 012h, 0a1h, 014h, 0cch, 016h, 0f7h, 018h
TBL_fe1dc:
        db      0e4h, 001h, 0f5h, 001h, 006h, 002h, 017h, 002h, 028h, 002h, 039h, 002h, 000h, 002h, 001h, 001h
        else
        db      080h, 020h, 0d3h, 022h, 026h, 025h, 079h, 027h
TBL_fe1dc:
        db      0e8h, 001h, 0f9h, 001h, 00ah, 002h, 01bh, 002h, 02ch, 002h, 03dh, 002h, 000h, 002h, 001h, 001h
        endif
        db      000h, 002h, 040h, 000h, 040h, 001h, 0feh, 001h, 000h, 008h, 000h, 001h, 000h, 000h, 002h, 002h
        db      001h, 000h, 002h, 070h, 000h, 000h, 003h, 0ffh, 002h, 000h, 008h, 000h, 002h, 000h, 000h, 002h
        db      001h, 001h, 000h, 002h, 040h, 000h, 068h, 001h, 0fch, 001h, 000h, 009h, 000h, 001h, 000h, 000h
        db      002h, 002h, 001h, 000h, 002h, 070h, 000h, 0d0h, 002h, 0fdh, 002h, 000h, 009h, 000h, 002h, 000h
        db      000h, 002h, 002h, 001h, 000h, 002h, 070h, 000h, 0a0h, 005h, 0f9h, 003h, 000h, 009h, 000h, 002h
        db      000h, 000h, 002h, 002h, 001h, 000h, 002h, 070h, 000h, 040h, 006h, 0f9h, 003h, 000h, 00ah, 000h
        db      002h, 000h
TBL_fe24e:
        if      FW_VERSION < 212
        db      056h, 002h, 061h, 002h, 06ch, 002h, 077h, 002h, 082h, 002h, 08dh, 002h, 0dfh, 002h, 0f0h, 002h
        else
        db      05ah, 002h, 065h, 002h, 070h, 002h, 07bh, 002h, 086h, 002h, 091h, 002h, 0dfh, 002h, 0f0h, 002h
        endif
        db      008h, 02ah, 0ffh, 050h, 0f6h, 00fh, 008h, 0dfh, 002h, 0f0h, 002h, 008h, 02ah, 0ffh, 050h, 0f6h
        db      00fh, 008h, 0dfh, 002h, 0f0h, 002h, 009h, 01bh, 0ffh, 02ah, 0f6h, 00fh, 008h, 0dfh, 002h, 0f0h
        db      002h, 009h, 01bh, 0ffh, 02ah, 0f6h, 00fh, 008h, 0dfh, 002h, 0f0h, 002h, 009h, 01bh, 0ffh, 02ah
        db      0f6h, 00fh, 008h, 0dfh, 002h, 0f0h, 002h, 00ah, 00eh, 0ffh, 01dh, 0f6h, 00fh, 008h, 0dfh, 002h
        db      0f0h, 002h, 00ah, 00eh, 0ffh, 01dh, 0f6h, 00fh, 008h
isr_fe2a7:
        sti
        cld
        push    ds
        push    es
        push    si
        mov     si, ds
        mov     es, si
        mov     si, 0
        mov     ds, si
        mov     si, ax
        if      FW_VERSION < 212
        cmp.w   si, 0ch
        else
        cmp.w   si, 0dh
        endif
        jc      br_fe2c4
        mov     ah, 0f7h
        xor     al, al
        jmp     br_fe2e4
        db      090h
br_fe2c4:
        or      si, si
        jz      br_fe2db
        if      FW_VERSION < 212
        cmp.w   si, 0bh
        else
        cmp     si, 0bh
        endif
        jz      br_fe2db
        mov     ah, 0
        call    fn_fed73
        jnc     br_fe2db
        mov     al, ah
        mov     ah, 0ffh
        jmp     br_fe2e4
        db      090h
br_fe2db:
        shl     si, 1
        add     si, TBL_fe2ea
        call    word ptr cs:[si]
br_fe2e4:
        pop     si
        pop     es
        pop     ds
        retf    2
TBL_fe2ea:
        if      FW_VERSION >= 212
        dw      tgt_fe304
        endif
        dw      tgt_fe318
        dw      tgt_fe397
        dw      tgt_fe3fa
        dw      tgt_fe49c
        dw      tgt_fe696
        dw      tgt_fe9c8
        dw      tgt_fe9e6
        dw      tgt_fea17
        dw      tgt_fea33
        dw      tgt_feaeb
        dw      tgt_feaf0
        dw      tgt_fe89a
        if      FW_VERSION < 212
tgt_fe318:
        else
tgt_fe304:
        endif
        push    cx
        mov     byte ptr [B_065A], 0ffh
        mov     cx, 4
        mov     al, 1
loop_fe30f:
        call    fn_fed3b
        inc     al
        loop    loop_fe30f
        pop     cx
        ret
        if      FW_VERSION < 212
tgt_fe397:
        else
tgt_fe318:
        endif
        call    fn_fed1c
        cmp     al, 0ffh
        jz      br_fe392
        call    fn_fecc1
        call    fn_fee4b
        jc      br_fe387
        call    fn_fecc1
        push    bx
        push    cx
        lea     bx, [si + 0bh]
        if      FW_VERSION < 212
        mov     cx, 15h
        else
        mov     byte ptr [bx], 0
        lea     bx, [si + 14h]
        mov     cx, 0ch
        endif
loop_fe338:
        mov     byte ptr [bx], 0
        inc     bx
        loop    loop_fe338
        pop     cx
        pop     bx
        call    fn_fee23
        jc      br_fe387
        cmp     ah, 0ffh
        jz      br_fe37e
        if      FW_VERSION < 212
        mov     byte ptr [si + 24h], 0ffh
        mov     word ptr [si + 1ah], 0
        else
        mov     byte ptr [si + 47h], 0ffh
        mov     byte ptr [si + 48h], 0
        mov     word ptr [si + 1ah], 0
        mov     word ptr [si + 40h], 0
        mov     byte ptr [si + 42h], 0
        mov     word ptr [si + 43h], 0
        mov     byte ptr [si + 45h], 0
        mov     word ptr [si + 51h], 0
        mov     word ptr [si + 49h], 0
        mov     word ptr [si + 4bh], 0
        endif
        call    fn_fed58
        jmp     br_fe396
        db      090h
br_fe37e:
        mov     ah, 0fah
        if      FW_VERSION < 212
        mov     byte ptr [si + 23h], 0
        else
        mov     byte ptr [si + 46h], 0
        endif
        jmp     br_fe394
        db      090h
br_fe387:
        mov     al, ah
        mov     ah, 0ffh
        if      FW_VERSION < 212
        mov     byte ptr [si + 23h], 0
        else
        mov     byte ptr [si + 46h], 0
        endif
        jmp     br_fe396
        db      090h
br_fe392:
        mov     ah, 0feh
br_fe394:
        xor     al, al
br_fe396:
        ret
        if      FW_VERSION < 212
tgt_fe3fa:
        else
tgt_fe397:
        endif
        call    fn_fed1c
        cmp     al, 0ffh
        jz      br_fe3f5
        call    fn_fecc1
        call    fn_fedfa
        jc      br_fe3ea
        cmp     ah, 0ffh
        jz      br_fe3e1
        if      FW_VERSION < 212
        mov     byte ptr [si + 24h], 0ffh
        call    fn_fed58
        else
        mov     byte ptr [si + 47h], 0ffh
        mov     byte ptr [si + 48h], 0
        mov     ax, word ptr [si + 1ah]
        mov     word ptr [si + 40h], ax
        mov     word ptr [si + 51h], 0
        mov     byte ptr [si + 42h], 0
        mov     word ptr [si + 43h], 0
        mov     byte ptr [si + 45h], 0
        mov     byte ptr [si + 42h], 0
        mov     word ptr [si + 49h], 0
        mov     word ptr [si + 4bh], 0
        call    fn_fed58
        xor     ah, ah
        endif
        jmp     br_fe3f9
        db      090h
br_fe3e1:
        mov     ah, 0fdh
        if      FW_VERSION < 212
        mov     byte ptr [si + 23h], 0
        else
        mov     byte ptr [si + 46h], 0
        endif
        jmp     br_fe3f7
        db      090h
br_fe3ea:
        mov     al, ah
        mov     ah, 0ffh
        if      FW_VERSION < 212
        mov     byte ptr [si + 23h], 0
        else
        mov     byte ptr [si + 46h], 0
        endif
        jmp     br_fe3f9
        db      090h
br_fe3f5:
        mov     ah, 0feh
br_fe3f7:
        xor     al, al
br_fe3f9:
        ret
        if      FW_VERSION < 212
tgt_fe49c:
        else
tgt_fe3fa:
        endif
        push    bx
        or      bl, bl
        jz      br_fe40f
        cmp     bl, 4
        ja      br_fe40f
        mov     al, bl
        call    fn_fed49
        if      FW_VERSION < 212
        test    byte ptr [si + 23h], 0ffh
        jz      br_fe40f
        cmp     byte ptr [si + 24h], 57h
        jnz     br_fe47d
        cmp     word ptr [si + 29h], 0
        jz      L_fe3e3
        push    cx
        mov     cx, word ptr [W_0647]
        sub     cx, word ptr [si + 29h]
        lea     bx, [si + 2bh]
        add     bx, word ptr [si + 29h]
br_fe44a:
        mov     byte ptr [bx], 0
        inc     bx
        loop    br_fe44a
        pop     cx
        else
        test    byte ptr [si + 46h], 0ffh
        jnz     br_fe412
br_fe40f:
        jmp     near br_fe496
br_fe412:
        cmp     byte ptr [si + 47h], 1
        jnz     br_fe461
        endif
        push    ds
        pop     es
        if      FW_VERSION < 212
        lea     bx, [si + 2bh]
        call    fn_ff01a
        else
        cmp     word ptr [si + 43h], 0
        jz      br_fe432
        push    word ptr [si + 40h]
        push    word ptr [si + 42h]
        mov     ax, word ptr [si + 43h]
        mov     word ptr [si + 40h], ax
        mov     al, byte ptr [si + 45h]
        mov     byte ptr [si + 42h], al
br_fe432:
        lea     bx, [si + 53h]
        mov     ax, 1
        call    fn_ff01a
        mov     al, ah
        lahf
        cmp     word ptr [si + 43h], 0
        jz      br_fe44a
        pop     word ptr [si + 42h]
        pop     word ptr [si + 40h]
br_fe44a:
        sahf
        mov     ah, al
        endif
        jc      br_fe48a
        cmp     ah, 0ffh
        jz      br_fe485
        if      FW_VERSION < 212
L_fe3e3:
        mov     byte ptr [si + 23h], 0
        else
        mov     byte ptr [si + 47h], 0ffh
        mov     word ptr [si + 43h], 0
        mov     byte ptr [si + 45h], 0
br_fe461:
        mov     byte ptr [si + 46h], 0
        cmp     byte ptr [si + 48h], 0ffh
        jnz     br_fe47d
        mov     byte ptr [si + 48h], 0
        endif
        call    fn_fef0a
        jc      br_fe48a
        or      ah, ah
        jz      br_fe47d
        mov     ah, 0fdh
        jmp     br_fe498
        db      090h
br_fe47d:
        if      FW_VERSION < 212
        mov     byte ptr [si + 23h], 0
        endif
        mov     byte ptr [B_065A], 0ffh
        jmp     br_fe491
        db      090h
br_fe485:
        mov     ah, 0f9h
        jmp     br_fe498
        db      090h
br_fe48a:
        mov     al, ah
        mov     ah, 0ffh
        jmp     br_fe49a
        db      090h
br_fe491:
        xor     ah, ah
        jmp     br_fe498
        db      090h
        if      FW_VERSION < 212
br_fe40f:
        else
br_fe496:
        endif
        mov     ah, 0fch
br_fe498:
        xor     al, al
br_fe49a:
        pop     bx
        ret
        if      FW_VERSION < 212
tgt_fe696:
        else
tgt_fe49c:
        endif
        or      bl, bl
        jz      br_fe4b0
        cmp     bl, 4
        ja      br_fe4b0
        mov     al, bl
        call    fn_fed49
        if      FW_VERSION < 212
        test    byte ptr [si + 23h], 0ffh
        else
        test    byte ptr [si + 46h], 0ffh
        endif
        jnz     br_fe4b3
br_fe4b0:
        jmp     br_fe653
br_fe4b3:
        if      FW_VERSION < 212
        mov     al, byte ptr [si + 24h]
        cmp     al, 57h
        jnz     L_fe439
        jmp     br_fe647
L_fe439:
        cmp     al, 0ffh
        jnz     br_fe520
        endif
        cmp     word ptr [si + 1ah], 0
        jnz     br_fe4bc
        jmp     br_fe640
br_fe4bc:
        if      FW_VERSION < 212
        mov     byte ptr [si + 24h], 52h
        mov     ax, word ptr [si + 1ah]
        mov     word ptr [si + 20h], ax
        mov     byte ptr [si + 22h], 0
        mov     ax, word ptr [W_0647]
        mov     word ptr [si + 29h], ax
        else
        cmp     byte ptr [si + 47h], 0ffh
        jnz     br_fe4c7
        mov     word ptr [si + 51h], 0
br_fe4c7:
        cmp     byte ptr [si + 47h], 1
        jnz     br_fe520
        push    es
        push    bx
        push    ds
        pop     es
        cmp     word ptr [si + 43h], 0
        jz      br_fe4e9
        push    word ptr [si + 40h]
        push    word ptr [si + 42h]
        mov     ax, word ptr [si + 43h]
        mov     word ptr [si + 40h], ax
        mov     al, byte ptr [si + 45h]
        mov     byte ptr [si + 42h], al
br_fe4e9:
        lea     bx, [si + 53h]
        mov     ax, 1
        call    fn_ff01a
        mov     al, ah
        lahf
        cmp     word ptr [si + 43h], 0
        jz      br_fe501
        pop     word ptr [si + 42h]
        pop     word ptr [si + 40h]
br_fe501:
        sahf
        mov     ah, al
        pop     bx
        pop     es
        jnc     br_fe50b
        jmp     br_fe647
br_fe50b:
        cmp     ah, 0ffh
        jnz     br_fe513
        jmp     br_fe64e
br_fe513:
        mov     byte ptr [si + 47h], 0
        mov     word ptr [si + 43h], 0
        mov     byte ptr [si + 45h], 0
        endif
br_fe520:
        push    bx
        push    di
        if      FW_VERSION < 212
        mov     word ptr [si + 25h], cx
        mov     word ptr [si + 27h], 0
        else
        mov     word ptr [si + 4dh], cx
        mov     word ptr [si + 4fh], 0
        endif
        mov     di, dx
        mov     ax, word ptr [W_0647]
        if      FW_VERSION < 212
        sub     ax, word ptr [si + 29h]
        else
        cmp     byte ptr [si + 47h], 0ffh
        jz      br_fe541
        sub     ax, word ptr [si + 51h]
        endif
        jz      br_fe541
        cmp     ax, cx
        ja      br_fe546
        if      FW_VERSION >= 212
        jmp     br_fe544
        db      090h
br_fe541:
        jmp     near br_fe5c5
br_fe544:
        endif
        mov     cx, ax
br_fe546:
        call    fn_fe65a
        push    si
        if      FW_VERSION < 212
        lea     ax, [si + 2bh]
        add     ax, word ptr [si + 29h]
        add     word ptr [si + 29h], cx
        else
        lea     ax, [si + 53h]
        add     ax, word ptr [si + 51h]
        add     word ptr [si + 51h], cx
        endif
        mov     si, ax
        cld
        rep movsb
        pop     si
        if      FW_VERSION < 212
        jmp     br_fe541
        else
        mov     ax, word ptr [W_0647]
        cmp     ax, word ptr [si + 51h]
        jnc     br_fe5c5
        mov     byte ptr [si + 47h], 0ffh
        jmp     br_fe5c5
        endif
        db      090h
loop_fe568:
        if      FW_VERSION < 212
        cmp     word ptr [si + 1eh], 0
        jnz     br_fe589
        mov     ax, word ptr [si + 1ch]
        else
        mov     byte ptr [si + 47h], 0ffh
        push    dx
        mov     dx, word ptr [si + 1eh]
        mov     ax, word ptr [si + 1ch]
        sub     ax, word ptr [si + 49h]
        sbb     dx, word ptr [si + 4bh]
        or      dx, dx
        pop     dx
        jnz     br_fe589
        endif
        cmp     ax, word ptr [W_0647]
        jc      br_fe5d2
        if      FW_VERSION < 212
br_fe589:
        mov     ax, word ptr [si + 25h]
        cmp     word ptr [si + 1eh], 0
        jnz     br_fe58c
        cmp     ax, word ptr [si + 1ch]
        jc      br_fe58c
        mov     ax, word ptr [si + 1ch]
        else
        cmp     ax, word ptr [si + 4dh]
        jc      br_fe58c
br_fe589:
        mov     ax, word ptr [si + 4dh]
        endif
br_fe58c:
        push    dx
        xor     dx, dx
        div     word ptr [W_0647]
        mov     bx, di
        call    fn_fef2d
        pushf
        push    ax
        xor     ah, ah
        mul     word ptr [W_0647]
        mov     cx, ax
        call    fn_fe65a
        add     di, cx
        pop     ax
        popf
        pop     dx
        jc      br_fe627
        cmp     ah, 0ffh
        if      FW_VERSION < 212
        jnz     br_fe541
        mov     ax, word ptr [si + 1ch]
        or      ax, word ptr [si + 1eh]
        jz      br_fe622
        else
        jnz     br_fe5c5
        mov     ax, word ptr [si + 1eh]
        cmp     ax, word ptr [si + 4bh]
        jnz     br_fe5c1
        mov     ax, word ptr [si + 1ch]
        cmp     ax, word ptr [si + 49h]
        jz      br_fe622
br_fe5c1:
        endif
        mov     ah, 0f6h
        jz      br_fe633
        if      FW_VERSION < 212
br_fe541:
        mov     ax, word ptr [si + 25h]
        else
br_fe5c5:
        mov     ax, word ptr [si + 4dh]
        endif
        or      ax, ax
        jz      br_fe622
        cmp     ax, word ptr [W_0647]
        jnc     loop_fe568
br_fe5d2:
        if      FW_VERSION < 212
        mov     ax, word ptr [si + 1ch]
        or      ax, word ptr [si + 1eh]
        jz      br_fe622
        push    es
        else
        mov     ax, word ptr [si + 1eh]
        cmp     ax, word ptr [si + 4bh]
        jnz     br_fe5e9
        mov     ax, word ptr [si + 1ch]
        cmp     ax, word ptr [si + 49h]
        jnz     br_fe5e9
        mov     byte ptr [si + 47h], 0ffh
        jmp     br_fe622
        db      090h
br_fe5e9:
        push    es
        mov     ax, word ptr [si + 40h]
        mov     word ptr [si + 43h], ax
        mov     al, byte ptr [si + 42h]
        mov     byte ptr [si + 45h], al
        endif
        mov     ax, ds
        mov     es, ax
        if      FW_VERSION < 212
        lea     bx, [si + 2bh]
        else
        lea     bx, [si + 53h]
        endif
        mov     ax, 1
        call    fn_fef2d
        pop     es
        jc      br_fe627
        cmp     ah, 0ffh
        mov     ah, 0f6h
        jz      br_fe633
        if      FW_VERSION < 212
        mov     cx, word ptr [si + 25h]
        call    fn_fe65a
        mov     word ptr [si + 29h], cx
        push    si
        lea     si, [si + 2bh]
        else
        mov     cx, word ptr [si + 4dh]
        call    fn_fe65a
        mov     word ptr [si + 51h], cx
        push    si
        lea     si, [si + 53h]
        endif
        cld
        rep movsb
        pop     si
        if      FW_VERSION >= 212
        mov     byte ptr [si + 47h], 0
        endif
br_fe622:
        xor     ah, ah
        jmp     br_fe633
        db      090h
br_fe627:
        mov     al, ah
        mov     ah, 0ffh
        push    ax
        mov     ax, word ptr [W_0647]
        if      FW_VERSION < 212
        mov     word ptr [si + 29h], ax
        else
        mov     word ptr [si + 51h], ax
        endif
        pop     ax
br_fe633:
        if      FW_VERSION < 212
        mov     cx, word ptr [si + 27h]
        else
        mov     cx, word ptr [si + 4fh]
        endif
        pop     di
        pop     bx
        cmp     ah, 0ffh
        jz      br_fe659
        jmp     br_fe657
        db      090h
br_fe640:
        xor     cx, cx
        mov     ax, cx
        jmp     br_fe659
        db      090h
br_fe647:
        if      FW_VERSION < 212
        mov     ah, 0fbh
        xor     cx, cx
        else
        mov     al, ah
        mov     ah, 0ffh
        jmp     br_fe659
        db      090h
br_fe64e:
        mov     ah, 0f9h
        endif
        jmp     br_fe657
        db      090h
br_fe653:
        mov     ah, 0fch
        xor     cx, cx
br_fe657:
        xor     al, al
br_fe659:
        ret
fn_fe65a:
        if      FW_VERSION < 212
        sub     word ptr [si + 1ch], cx
        sbb     word ptr [si + 1eh], 0
        jc      br_fe67b
        pushf
        sub     word ptr [si + 25h], cx
        popf
        jnz     br_fe690
        cmp     word ptr [si + 1ch], 0
        else
        push    ax
        push    dx
        add     word ptr [si + 49h], cx
        adc     word ptr [si + 4bh], 0
        mov     ax, word ptr [si + 1ch]
        mov     dx, word ptr [si + 1eh]
        sub     ax, word ptr [si + 49h]
        sbb     dx, word ptr [si + 4bh]
        jc      br_fe67b
        sub     word ptr [si + 4dh], cx
        or      ax, dx
        endif
        jnz     br_fe690
        jmp     br_fe68b
        db      090h
br_fe67b:
        if      FW_VERSION < 212
        neg     word ptr [si + 1ch]
        sub     cx, word ptr [si + 1ch]
        mov     word ptr [si + 1ch], 0
        mov     word ptr [si + 1eh], 0
br_fe68b:
        mov     word ptr [si + 25h], 0
br_fe690:
        add     word ptr [si + 27h], cx
        ret
tgt_fe9c8:
        else
        neg     ax
        sub     cx, ax
        mov     ax, word ptr [si + 1ch]
        mov     word ptr [si + 49h], ax
        mov     ax, word ptr [si + 1eh]
        mov     word ptr [si + 4bh], ax
br_fe68b:
        mov     word ptr [si + 4dh], 0
br_fe690:
        add     word ptr [si + 4fh], cx
        pop     dx
        pop     ax
        ret
tgt_fe696:
        endif
        or      bl, bl
        jz      br_fe6aa
        cmp     bl, 4
        ja      br_fe6aa
        mov     al, bl
        call    fn_fed49
        if      FW_VERSION < 212
        test    byte ptr [si + 23h], 0ffh
        else

        test    byte ptr [si + 46h], 0ffh
        endif
        jnz     br_fe6ad
br_fe6aa:
        if      FW_VERSION < 212
        jmp     L_fe76d
br_fe6ad:
        mov     al, byte ptr [si + 24h]
        cmp     al, 52h
        jnz     L_fe59f
        jmp     L_fe766
L_fe59f:
        cmp     al, 0ffh
        jz      L_fe5a6
        jmp     near br_fe6d9
L_fe5a6:
        mov     byte ptr [si + 24h], 57h
        mov     ax, word ptr [si + 1ah]
        or      ax, ax
        jnz     L_fe5b4
        jmp     near L_fe634
L_fe5b4:
        push    bx
        push    cx
        push    dx
        endif

RUN_BR_FE93A macro   {GLOBALSYMBOLS}
        mov     ax, word ptr [W_0647]
        mov     dl, byte ptr [B_0649]
        xor     dh, dh
        mul     dx
        if      FW_VERSION >= 212
        xchg    cx, ax
        mov     dx, bx
        div     cx
        else
        mov     cx, ax
        mov     ax, word ptr [si + 1ch]
        mov     dx, word ptr [si + 1eh]
        div     cx
        inc     ax
        endif
        push    dx
        mov     cx, ax
        mov     dx, word ptr [si + 1ah]
        if      FW_VERSION >= 212
br_fe93a:
        cmp     dx, 1
        jbe     br_fe953
        mov     ax, dx
        and     ax, 0ff8h
        cmp     ax, 0ff8h
        jz      br_fe953
        jcxz    br_fe95a
        call    fn_ff3c1
        mov     dx, bx
        dec     cx
        jmp     br_fe93a
br_fe953:
        else
L_fe5d3:
        call    fn_ff3c1
        cmp     bx, 1
        jbe     L_fe5e9
        mov     dx, bx
        and     bx, 0ff8h
        cmp     bx, 0ff8h
        jz      L_fe5e9
        loop    L_fe5d3
L_fe5e9:
        dec     cx
        jz      br_fe95a
        endif
        pop     dx
        pop     dx
        pop     cx
        pop     bx
        if      FW_VERSION >= 212
        jmp     br_fe9a7
        db      090h
        else
        mov     ah, 0f6h
        jmp     L_fe771
        endif
br_fe95a:
        mov     bx, dx
        pop     dx
        mov     ax, dx
        xor     dx, dx
        mov     cx, word ptr [W_0647]
        div     cx
        mov     cx, ax
        if      FW_VERSION >= 212
        mov     byte ptr [si + 47h], 0ffh
        mov     word ptr [si + 40h], bx
        mov     byte ptr [si + 42h], cl
        mov     word ptr [si + 43h], bx
        mov     byte ptr [si + 45h], cl
        or      dx, dx
        jz      br_fe998
        push    dx
        lea     bx, [si + 53h]
        else
        push    bx
        push    cx
        push    dx
        mov     word ptr [si + 20h], bx
        mov     byte ptr [si + 22h], cl
        lea     bx, [si + 2bh]
        endif
        push    es
        push    ds
        pop     es
        mov     ax, 1
        call    fn_fef2d
        pop     es
        pop     dx
        endm
        if      FW_VERSION < 212
        RUN_BR_FE93A
        pop     cx
        pop     bx
        mov     word ptr [si + 20h], bx
        mov     byte ptr [si + 22h], cl
        mov     word ptr [si + 29h], dx
        pop     dx
        pop     cx
        pop     bx
        jnc     br_fe6d9
        mov     al, ah
        mov     ah, 0ffh
        xor     cx, cx
        jmp     br_fe87a
L_fe634:
        else

        jmp     br_fe874
br_fe6ad:
        cmp     word ptr [si + 1ah], 0
        jnz     br_fe6d9
        endif
        push    bx
        call    fn_ff398
        or      ah, ah
        jz      br_fe6bf
        pop     bx
        jmp     br_fe86d
br_fe6bf:
        mov     word ptr [si + 1ah], bx
        if      FW_VERSION < 212
        mov     word ptr [si + 20h], bx
        pop     bx
        mov     byte ptr [si + 22h], 0
        mov     word ptr [si + 29h], 0
        else
        mov     word ptr [si + 40h], bx
        pop     bx
        mov     byte ptr [si + 42h], 0
        mov     word ptr [si + 51h], 0
        endif
        mov     word ptr [si + 1ch], 0
        mov     word ptr [si + 1eh], 0
br_fe6d9:
        push    bx
        push    dx
        if      FW_VERSION < 212
        mov     word ptr [si + 25h], cx
        mov     word ptr [si + 27h], 0
        cmp     word ptr [si + 29h], 0
        jnz     br_fe6f2
        jmp     near br_fe7dc
        else
        mov     word ptr [si + 4dh], cx
        mov     word ptr [si + 4fh], 0
        cmp     byte ptr [si + 47h], 0ffh
        jz      br_fe6ef
        cmp     word ptr [si + 51h], 0
        jnz     br_fe6f2
br_fe6ef:
        jmp     br_fe7dc
        endif
br_fe6f2:
        mov     ax, word ptr [W_0647]
        if      FW_VERSION < 212
        sub     ax, word ptr [si + 29h]
        else
        sub     ax, word ptr [si + 51h]
        endif
        cmp     ax, cx
        ja      br_fe6fe
        mov     cx, ax
br_fe6fe:
        if      FW_VERSION < 212
        sub     word ptr [si + 25h], cx
        add     word ptr [si + 27h], cx
        add     word ptr [si + 1ch], cx
        adc     word ptr [si + 1eh], 0
        lea     ax, [si + 2bh]
        add     ax, word ptr [si + 29h]
        add     word ptr [si + 29h], cx
        else
        sub     word ptr [si + 4dh], cx
        add     word ptr [si + 4fh], cx
        add     word ptr [si + 49h], cx
        adc     word ptr [si + 4bh], 0
        lea     ax, [si + 53h]
        add     ax, word ptr [si + 51h]
        add     word ptr [si + 51h], cx
        endif
        push    si
        push    di
        mov     si, ds
        push    es
        pop     ds
        mov     es, si
        mov     si, dx
        mov     di, ax
        cld
        rep movsb
        mov     dx, si
        mov     si, es
        push    ds
        pop     es
        mov     ds, si
        pop     di
        pop     si
        if      FW_VERSION < 212
        mov     ax, word ptr [si + 29h]
        cmp     ax, word ptr [W_0647]
        jc      br_fe7dc
        else
        mov     byte ptr [si + 47h], 1
        call    fn_fe87b
        mov     ax, word ptr [si + 51h]
        cmp     ax, word ptr [W_0647]
        jnc     br_fe740
        jmp     near br_fe7dc
br_fe740:
        endif
        push    es
        push    ds
        pop     es
        if      FW_VERSION < 212
        mov     word ptr [si + 29h], 0
        lea     bx, [si + 2bh]
        else
        cmp     word ptr [si + 43h], 0
        jz      br_fe75b
        push    word ptr [si + 40h]
        push    word ptr [si + 42h]
        mov     ax, word ptr [si + 43h]
        mov     word ptr [si + 40h], ax
        mov     al, byte ptr [si + 45h]
        mov     byte ptr [si + 42h], al
br_fe75b:
        lea     bx, [si + 53h]
        endif
        mov     ax, 1
        call    fn_ff01a
        if      FW_VERSION >= 212
        mov     al, ah
        lahf
        cmp     word ptr [si + 43h], 0
        jz      br_fe773
        pop     word ptr [si + 42h]
        pop     word ptr [si + 40h]
br_fe773:
        sahf
        mov     ah, al
        endif
        pop     es
        jnc     br_fe77c
        if      FW_VERSION < 212
        jmp     near br_fe853
        else
        jmp     br_fe853
        endif
br_fe77c:
        cmp     ah, 0ffh
        mov     ah, 0
        if      FW_VERSION < 212
        jnz     br_fe7d5
        jmp     near br_fe860
br_fe7d5:
        else
        jnz     br_fe786
        jmp     br_fe860
br_fe786:
        mov     byte ptr [si + 47h], 0ffh
        mov     word ptr [si + 51h], 0
        mov     word ptr [si + 43h], 0
        mov     byte ptr [si + 45h], 0
        endif
        jmp     br_fe7dc
        db      090h
loop_fe79b:
        push    dx
        if      FW_VERSION < 212
        mov     ax, word ptr [si + 25h]
        else
        mov     ax, word ptr [si + 4dh]
        endif
        xor     dx, dx
        div     word ptr [W_0647]
        pop     dx
        mov     bx, dx
        call    fn_ff01a
        pushf
        push    ax
        push    dx
        xor     ah, ah
        mul     word ptr [W_0647]
        if      FW_VERSION < 212
        add     word ptr [si + 27h], ax
        sub     word ptr [si + 25h], ax
        add     word ptr [si + 1ch], ax
        adc     word ptr [si + 1eh], 0
        else
        add     word ptr [si + 4fh], ax
        sub     word ptr [si + 4dh], ax
        add     word ptr [si + 49h], ax
        adc     word ptr [si + 4bh], 0
        endif
        pop     dx
        add     dx, ax
        pop     ax
        popf
        if      FW_VERSION < 212
        jc      br_fe853
        else
        jnc     br_fe7cb
        jmp     near br_fe853
br_fe7cb:
        endif
        cmp     ah, 0ffh
        mov     ah, 0
        if      FW_VERSION < 212
        jz      br_fe860
br_fe7dc:
        mov     ax, word ptr [si + 25h]
        else
        jnz     br_fe7d5
        jmp     near br_fe860
br_fe7d5:
        mov     byte ptr [si + 47h], 0ffh
        call    fn_fe87b
br_fe7dc:
        mov     ax, word ptr [si + 4dh]
        endif
        or      ax, ax
        jz      br_fe84e
        cmp     ax, word ptr [W_0647]
        jnc     loop_fe79b
        if      FW_VERSION < 212
        xor     cx, cx
        xchg    word ptr [si + 25h], cx
        mov     word ptr [si + 29h], cx
        add     word ptr [si + 27h], cx
        add     word ptr [si + 1ch], cx
        adc     word ptr [si + 1eh], 0
        lea     ax, [si + 2bh]
        else
        mov     ax, word ptr [si + 49h]
        cmp     ax, word ptr [si + 1ch]
        jnz     br_fe7f9
        mov     ax, word ptr [si + 4bh]
        cmp     ax, word ptr [si + 1eh]
        jz      br_fe819
br_fe7f9:
        push    es
        push    bx
        mov     ax, word ptr [si + 40h]
        mov     word ptr [si + 43h], ax
        mov     al, byte ptr [si + 42h]
        mov     byte ptr [si + 45h], al
        push    ds
        pop     es
        lea     bx, [si + 53h]
        mov     ax, 1
        call    fn_fef2d
        pop     bx
        pop     es
        jnc     br_fe819
        jmp     br_fe853
        db      090h
br_fe819:
        xor     cx, cx
        xchg    word ptr [si + 4dh], cx
        mov     word ptr [si + 51h], cx
        add     word ptr [si + 4fh], cx
        add     word ptr [si + 49h], cx
        adc     word ptr [si + 4bh], 0
        lea     ax, [si + 53h]
        endif
        push    si
        push    di
        mov     si, ds
        push    es
        pop     ds
        mov     es, si
        mov     si, dx
        mov     di, ax
        cld
        rep movsb
        mov     dx, si
        mov     si, es
        push    ds
        pop     es
        mov     ds, si
        pop     di
        pop     si
        if      FW_VERSION >= 212
        mov     byte ptr [si + 47h], 1
        call    fn_fe87b
        endif
br_fe84e:
        xor     ah, ah
        jmp     br_fe860
        db      090h
br_fe853:
        mov     al, ah
        if      FW_VERSION < 212
        mov     word ptr [si + 29h], 0
        else
        mov     word ptr [si + 51h], 0
        mov     byte ptr [si + 47h], 0ffh
        endif
        mov     ah, 0ffh
br_fe860:
        if      FW_VERSION < 212
        mov     cx, word ptr [si + 27h]
        else
        mov     cx, word ptr [si + 4fh]
        endif
        pop     dx
        pop     bx
        cmp     ah, 0ffh
        jz      br_fe87a
        if      FW_VERSION < 212
        jmp     L_fe771
        else
        jmp     br_fe878
        endif
        db      090h
br_fe86d:
        xor     cx, cx
        mov     ax, cx
        jmp     br_fe87a
        db      090h
        if      FW_VERSION < 212
L_fe766:
        mov     ah, 0fbh
        xor     cx, cx
        jmp     L_fe771
        db      090h
L_fe76d:
        mov     ah, 0fch
        xor     cx, cx
L_fe771:
        xor     al, al
br_fe87a:
        ret
tgt_fe9e6:
        mov     si, 1b22h
        else
br_fe874:
        mov     ah, 0fch
        xor     cx, cx
br_fe878:
        xor     al, al
br_fe87a:
        ret
fn_fe87b:
        push    ax
        push    dx
        mov     ax, word ptr [si + 49h]
        mov     dx, word ptr [si + 4bh]
        cmp     dx, word ptr [si + 1eh]
        jnz     br_fe88b
        cmp     ax, word ptr [si + 1ch]
br_fe88b:
        jbe     br_fe897
        mov     word ptr [si + 1ch], ax
        mov     word ptr [si + 1eh], dx
        mov     byte ptr [si + 48h], 0ffh
br_fe897:
        pop     dx
        pop     ax
        ret
tgt_fe89a:
        push    bx
        or      bl, bl
        jz      br_fe8af
        cmp     bl, 4
        ja      br_fe8af
        mov     al, bl
        call    fn_fed49
        test    byte ptr [si + 46h], 0ffh
        jnz     br_fe8b2
br_fe8af:
        jmp     br_fe9c2
br_fe8b2:
        cmp     cx, word ptr [si + 1eh]
        jnz     br_fe8ba
        cmp     dx, word ptr [si + 1ch]
br_fe8ba:
        jbe     br_fe8bf
        jmp     br_fe9ac
br_fe8bf:
        jnz     br_fe8c4
        jmp     br_fe9bd
br_fe8c4:
        cmp     byte ptr [si + 47h], 1
        jnz     br_fe91d
        push    es
        push    bx
        push    ds
        pop     es
        cmp     word ptr [si + 43h], 0
        jz      br_fe8e6
        push    word ptr [si + 40h]
        push    word ptr [si + 42h]
        mov     ax, word ptr [si + 43h]
        mov     word ptr [si + 40h], ax
        mov     al, byte ptr [si + 45h]
        mov     byte ptr [si + 42h], al
br_fe8e6:
        lea     bx, [si + 53h]
        mov     ax, 1
        call    fn_ff01a
        mov     al, ah
        lahf
        cmp     word ptr [si + 43h], 0
        jz      br_fe8fe
        pop     word ptr [si + 42h]
        pop     word ptr [si + 40h]
br_fe8fe:
        sahf
        mov     ah, al
        pop     bx
        pop     es
        jnc     br_fe908
        jmp     near br_fe9b6
br_fe908:
        cmp     ah, 0ffh
        jnz     br_fe910
        jmp     near br_fe9b1
br_fe910:
        mov     byte ptr [si + 47h], 0ffh
        mov     word ptr [si + 43h], 0
        mov     byte ptr [si + 45h], 0
br_fe91d:
        push    bx
        push    cx
        push    dx
        mov     bx, cx
        mov     cx, dx
        RUN_BR_FE93A
        jnc     br_fe994
        pop     dx
        pop     cx
        pop     bx
        jmp     br_fe9b6
        db      090h
br_fe994:
        mov     byte ptr [si + 47h], 0
br_fe998:
        mov     word ptr [si + 51h], dx
        pop     dx
        pop     cx
        pop     bx
        mov     word ptr [si + 49h], dx
        mov     word ptr [si + 4bh], cx
        jmp     br_fe9bd
        db      090h
br_fe9a7:
        mov     ah, 0f6h
        jmp     br_fe9c4
        db      090h
br_fe9ac:
        mov     ah, 0fbh
        jmp     br_fe9c4
        db      090h
br_fe9b1:
        mov     ah, 0f9h
        jmp     br_fe9c4
        db      090h
br_fe9b6:
        mov     al, ah
        mov     ah, 0ffh
        jmp     br_fe9c6
        db      090h
br_fe9bd:
        xor     ah, ah
        jmp     br_fe9c4
        db      090h
br_fe9c2:
        mov     ah, 0fch
br_fe9c4:
        xor     al, al
br_fe9c6:
        pop     bx
        ret
tgt_fe9c8:
        mov     si, 29cch
        endif
        call    fn_fecc1
        call    fn_fee4b
        jc      br_fe9dc
        or      ah, ah
        jz      br_fe9e3
        mov     ah, 0fdh
        jmp     br_fe9e3
        db      090h
br_fe9dc:
        mov     al, ah
        mov     ah, 0ffh
        jmp     br_fe9e5
        db      090h
br_fe9e3:
        xor     al, al
br_fe9e5:
        ret
        if      FW_VERSION < 212
tgt_fea17:
        mov     si, 1b22h
        else
tgt_fe9e6:
        mov     si, 29cch
        endif
        push    si
        call    fn_fecc1
        push    dx
        mov     dx, bx
        if      FW_VERSION < 212
        add     si, 10h
        else
        add     si, 20h
        endif
        call    fn_fecc1
        pop     dx
        pop     si
        call    fn_feea4
        jc      br_fea0d
        or      ah, ah
        jz      br_fea14
        cmp     ah, 0feh
        mov     ah, 0f8h
        jz      br_fea14
        mov     ah, 0fdh
        jmp     br_fea14
        db      090h
br_fea0d:
        mov     al, ah
        mov     ah, 0ffh
        jmp     br_fea16
        db      090h
br_fea14:
        xor     al, al
br_fea16:
        ret
        if      FW_VERSION < 212
tgt_fea33:
        else
tgt_fea17:
        endif
        mov     ax, word ptr [W_0647]
        mov     bl, byte ptr [B_0649]
        xor     bh, bh
        mul     bx
        mov     bx, ax
        push    bx
        call    fn_ff375
        mov     dx, bx
        call    fn_ff349
        mov     cx, bx
        pop     bx
        xor     ax, ax
        ret
        if      FW_VERSION < 212
tgt_feaeb:
        else
tgt_fea33:
        endif
        mov     ah, 0
br_fea35:
        push    bx
        if      FW_VERSION < 212
        mov     si, 1b22h
        else
        mov     si, 29cch
        endif
        call    fn_fecc1
        or      ah, ah
        jnz     br_fea48
        mov     al, 0
        call    fn_ff11c
        jmp     br_fea4b
        db      090h
br_fea48:
        call    fn_ff19d
br_fea4b:
        if      FW_VERSION < 212
        jc      br_feae5
        cmp     ah, 0ffh
        jz      br_feade
        else
        jnc     br_fea50
        jmp     near br_feae5
br_fea50:
        cmp     ah, 0ffh
        jnz     br_fea58
        jmp     near br_feade
br_fea58:
        endif
        mov     si, bx
        pop     bx
        push    bx
        push    cx
        push    dx
        push    di
        mov     al, byte ptr [si + 0bh]
        mov     byte ptr es:[bx], al
        inc     bx
        mov     ax, word ptr [si + 1ch]
        mov     word ptr es:[bx], ax
        add     bx, 2
        mov     ax, word ptr [si + 1eh]
        mov     word ptr es:[bx], ax
        add     bx, 2
        push    bx
        call    fn_ff349
        mov     cx, bx
        mov     dx, word ptr [si + 1ah]
        mov     ax, 1
loop_fea84:
        call    fn_ff3c1
        cmp     bx, 1
        jbe     br_fea9b
        mov     dx, bx
        and     bx, 0ff8h
        cmp     bx, 0ff8h
        jz      br_fea9b
        inc     ax
        loop    loop_fea84
br_fea9b:
        pop     bx
        mov     word ptr es:[bx], ax
        add     bx, 2
        if      FW_VERSION < 212
        mov     cx, 0bh
        lea     di, [si]
        else
        mov     cx, 8
        lea     di, [si]
loop_feaa7:
        mov     al, byte ptr [di]
        mov     byte ptr es:[bx], al
        inc     bx
        inc     di
        loop    loop_feaa7
        push    di
        lea     di, [si + 0ch]
        cmp     byte ptr [di], 0
        jz      br_feac5
        mov     cx, 8
loop_feabc:
        mov     al, byte ptr [di]
        mov     byte ptr es:[bx], al
        inc     bx
        inc     di
        loop    loop_feabc
br_feac5:
        pop     di
        mov     cx, 3
        endif
loop_feac9:
        mov     al, byte ptr [di]
        mov     byte ptr es:[bx], al
        inc     bx
        inc     di
        loop    loop_feac9
        mov     byte ptr es:[bx], 0
        pop     di
        pop     dx
        pop     cx
        xor     ax, ax
        jmp     br_feae9
        db      090h
br_feade:
        mov     ah, 0fdh
        xor     al, al
        jmp     br_feae9
        db      090h
br_feae5:
        mov     al, ah
        mov     ah, 0ffh
br_feae9:
        pop     bx
        ret
        if      FW_VERSION < 212
tgt_feaf0:
        else
tgt_feaeb:
        endif
        mov     ah, 0ffh
        jmp     near br_fea35
        if      FW_VERSION < 212
tgt_fe89a:
        else
tgt_feaf0:
        endif
        push    bx
        push    cx
        push    dx
        push    si
        push    di
        push    es
        cmp     bx, 6
        jbe     br_feafe
        jmp     br_fec41
br_feafe:
        mov     byte ptr [B_065A], 0ffh
        add     bx, bx
        mov     ax, word ptr cs:[bx + TBL_fe24e]
        mov     word ptr [W_0658], ax
        mov     bx, word ptr cs:[bx + TBL_fe1dc]
        mov     cx, 11h
        mov     si, W_0647
loop_feb18:
        mov     al, byte ptr cs:[bx]
        mov     byte ptr [si], al
        inc     bx
        inc     si
        loop    loop_feb18
        mov     al, 0
        mov     byte ptr [B_065B], al
        mov     ax, word ptr [W_0652]
        mul     word ptr [W_0647]
        mov     cx, ax
        push    ds
        pop     es
        mov     di, TBL_0A80
        mov     al, 0
        cld
        rep stosb
        mov     al, byte ptr [B_0651]
        mov     byte ptr [TBL_0A80], al
        mov     word ptr [W_0A81], 0ffffh
        mov     si, 0
br_feb48:
        mov     bx, si
        call    fn_ff46a
        push    ds
        pop     es
        mov     bx, A_085F
        mov     dl, byte ptr [B_065B]
        mov     ah, 5
        mov     al, 1
        call    fn_fec53
        call    fn_ff490
        jnc     br_feb65
loop_feb62:
        jmp     br_fec48
br_feb65:
        mov     ax, word ptr [W_0654]
        mov     ah, 4
        call    fn_ff490
        jnc     br_feb8b
        mov     bx, 2
        call    fn_ff418
        cmp     si, bx
        jc      loop_feb62
        cmp     ah, 2
        jz      br_feb88
        cmp     ah, 4
        jz      br_feb88
        cmp     ah, 10h
        jnz     loop_feb62
br_feb88:
        call    fn_fec9a
br_feb8b:
        add     si, word ptr [W_0654]
        cmp     si, word ptr [W_064F]
        jnc     br_feb97
        jmp     br_feb48
br_feb97:
        mov     cx, word ptr [W_0647]
        push    ds
        pop     es
        mov     di, A_085F
        mov     al, 0
        cld
        rep stosb
        mov     di, A_085F
        mov     al, 0ebh
        stosb
        mov     al, 34h
        stosb
        mov     al, 90h
        stosb
        mov     si, W_0647
        mov     di, A_086A
        mov     cx, 11h
        cld
        rep movsb
        mov     ah, 3
        mov     al, 1
        mov     ch, 0
        mov     cl, 1
        push    ds
        pop     es
        mov     bx, A_085F
        mov     dh, 0
        mov     dl, byte ptr [B_065B]
        call    fn_ff490
        jnc     br_febd8
        jmp     br_fec48
        db      090h
br_febd8:
        call    fn_ff302
        jnc     br_febe0
        jmp     br_fec48
        db      090h
br_febe0:
        mov     ax, word ptr [W_064D]
        mov     cl, 5
        shl     ax, cl
        xor     dx, dx
        div     word ptr [W_0647]
        mov     cx, ax
        or      dx, dx
        jz      br_febf4
        inc     cx
br_febf4:
        push    cx
        mov     ax, word ptr [W_0647]
        xor     dx, dx
        mov     cx, 20h
        div     cx
        mov     cx, ax
        push    ds
        pop     es
        mov     di, A_085F
loop_fec06:
        push    cx
        mov     al, 0
        cld
        stosb
        mov     cx, 1fh
        mov     al, 0f6h
        rep stosb
        pop     cx
        loop    loop_fec06
        pop     cx
        mov     ah, 0
        call    fn_ff2a9
        mov     si, bx
loop_fec1d:
        push    cx
        mov     bx, si
        call    fn_ff46a
        push    ds
        pop     es
        mov     bx, A_085F
        mov     dl, byte ptr [B_065B]
        mov     ah, 3
        mov     al, 1
        call    fn_ff490
        pop     cx
        jnc     br_fec39
        jmp     br_fec48
        db      090h
br_fec39:
        inc     si
        loop    loop_fec1d
        xor     ax, ax
        jmp     br_fec4c
        db      090h
br_fec41:
        mov     ah, 0f5h
        xor     al, al
        jmp     br_fec4c
        db      090h
br_fec48:
        mov     al, ah
        mov     ah, 0ffh
br_fec4c:
        pop     es
        pop     di
        pop     si
        pop     dx
        pop     cx
        pop     bx
        ret
fn_fec53:
        push    ax
        push    bx
        if      FW_VERSION >= 212
        push    cx
        push    dx
        endif
        mov     al, 1
loop_fec59:
        mov     byte ptr es:[bx], ch
        inc     bx
        mov     byte ptr es:[bx], dh
        inc     bx
        if      FW_VERSION < 212
        mov     byte ptr es:[bx], al
        else
        mov     cl, al
        mov     ah, dh
        and     ah, 1
        mov     dl, 0
        add     ah, dl
        sub     cl, ah
        ja      br_fec74
        add     cl, byte ptr [W_0654]
br_fec74:
        mov     byte ptr es:[bx], cl
        endif
        inc     bx
        push    ax
        mov     ax, word ptr [W_0647]
        shl     ax, 1
        xor     al, al
br_fec80:
        shr     ah, 1
        jz      br_fec88
        inc     al
        jmp     br_fec80
br_fec88:
        mov     byte ptr es:[bx], al
        pop     ax
        inc     bx
        inc     al
        cmp     al, byte ptr [W_0654]
        jbe     loop_fec59
        if      FW_VERSION >= 212
        pop     dx
        pop     cx
        endif
        pop     bx
        pop     ax
        ret
fn_fec9a:
        push    ax
        push    bx
        push    cx
        push    dx
        mov     bx, si
        call    fn_ff43d
        mov     dx, bx
        mov     bx, si
        add     bx, word ptr [W_0654]
        dec     bx
        call    fn_ff43d
        mov     cx, bx
        mov     bx, 0ff7h
loop_fecb4:
        call    fn_ff3de
        inc     dx
        cmp     dx, cx
        jbe     loop_fecb4
        pop     dx
        pop     cx
        pop     bx
        pop     ax
        ret
fn_fecc1:
        push    ax
        push    bx
        push    cx
        push    si
        if      FW_VERSION < 212
        mov     bx, dx
        mov     cx, 0bh
        else
        push    di
        mov     bx, dx
        mov     cx, 8
        endif
loop_feccb:
        mov     al, byte ptr es:[bx]
        mov     byte ptr [si], al
        inc     bx
        inc     si
        loop    loop_feccb
        if      FW_VERSION >= 212
        push    si
        add     si, 4
        cmp     byte ptr es:[bx + 3], 0
        jz      br_fecff
        mov     di, bx
        mov     al, 20h
        mov     cx, 8
        cld
        repe scasb
        jnz     br_fecf0
        mov     bx, di
        jmp     br_fecff
        db      090h
br_fecf0:
        mov     cx, 8
loop_fecf3:
        mov     al, byte ptr es:[bx]
        mov     byte ptr [si], al
        inc     bx
        inc     si
        loop    loop_fecf3
        jmp     br_fed09
        db      090h
br_fecff:
        mov     cx, 8
        xor     al, al
loop_fed04:
        mov     byte ptr [si], al
        inc     si
        loop    loop_fed04
br_fed09:
        pop     si
        mov     cx, 3
loop_fed0d:
        mov     al, byte ptr es:[bx]
        mov     byte ptr [si], al
        inc     bx
        inc     si
        loop    loop_fed0d
        pop     di
        endif
        pop     si
        pop     cx
        pop     bx
        pop     ax
        ret
fn_fed1c:
        push    cx
        mov     cx, 4
        mov     ax, 1
loop_fed23:
        call    fn_fed49
        if      FW_VERSION < 212
        test    byte ptr [si + 23h], 0ffh
        else
        test    byte ptr [si + 46h], 0ffh
        endif
        jz      br_fed35
        inc     al
        loop    loop_fed23
        mov     al, 0ffh
        xor     si, si
        ret
br_fed35:
        if      FW_VERSION < 212
        mov     byte ptr [si + 23h], 0ffh
        else
        mov     byte ptr [si + 46h], 0ffh
        endif
        pop     cx
        ret
fn_fed3b:
        cmp     al, 4
        ja      br_fed48
        push    si
        call    fn_fed49
        if      FW_VERSION < 212
        mov     byte ptr [si + 23h], 0
        else
        mov     byte ptr [si + 46h], 0
        endif
        pop     si
br_fed48:
        ret
fn_fed49:
        push    ax
        xor     ah, ah
        dec     ax
        shl     ax, 1
        mov     si, ax
        mov     si, word ptr cs:[si + TBL_fe1d4]
        pop     ax
        ret
fn_fed58:
        push    bx
        push    cx
        mov     al, 1
        if      FW_VERSION < 212
        mov     bx, 1d0h
        else
        mov     bx, 1d4h
        endif
        mov     cx, 4
loop_fed62:
        cmp     si, word ptr cs:[bx]
        jz      br_fed70
        add     bx, 2
        inc     al
        loop    loop_fed62
        mov     al, 0ffh
br_fed70:
        pop     cx
        pop     bx
        ret
fn_fed73:
        push    bx
        push    cx
        push    si
        mov     ch, ah
        cmp     ch, byte ptr [B_065A]
        jnz     br_fed81
        jmp     br_fedf6
        db      090h
br_fed81:
        cmp     byte ptr [B_065A], 0ffh
        jz      br_fed8d
        call    fn_ff302
        jc      br_fedf6
br_fed8d:
        push    dx
        push    es
        mov     ax, A_029C
        mov     word ptr [W_0658], ax
        mov     byte ptr [B_065B], ch
        mov     dl, ch
        mov     ah, 0
        int     40h
        call    fn_ff4c6
        mov     byte ptr [B_065A], 0ffh
        mov     bx, A_085F
        push    ds
        pop     es
        mov     dh, 0
        mov     ch, 0
        mov     cl, 1
        mov     ah, 2
        mov     al, 1
        call    fn_ff490
        pop     es
        pop     dx
        jc      br_fedf6
        mov     bx, W_0647
        mov     cx, 11h
        mov     si, A_086A
loop_fedc6:
        mov     al, byte ptr [si]
        mov     byte ptr [bx], al
        inc     si
        inc     bx
        loop    loop_fedc6
        if      FW_VERSION < 212
        mov     si, 24ah
        else
        mov     si, 24eh
        endif
        mov     cx, 6
loop_fedd4:
        mov     bx, word ptr cs:[si]
        mov     ax, word ptr [W_0654]
        cmp     al, byte ptr cs:[bx + 4]
        jz      br_fede5
        add     si, 2
        loop    loop_fedd4
br_fede5:
        mov     word ptr [W_0658], bx
        call    fn_ff2c7
        jc      br_fedf6
        mov     ch, byte ptr [B_065B]
        mov     byte ptr [B_065A], ch
br_fedf6:
        pop     si
        pop     cx
        pop     bx
        ret
fn_fedfa:
        push    bx
        push    cx
        mov     al, 0
        call    fn_ff11c
        jnc     br_fee06
        pop     cx
        pop     bx
        ret
br_fee06:
        cmp     ah, 0ffh
        jnz     br_fee11
        pop     cx
        pop     bx
        mov     ah, 0ffh
        clc
        ret
br_fee11:
        push    si
        mov     cx, 20h
loop_fee15:
        mov     al, byte ptr [bx]
        mov     byte ptr [si], al
        inc     bx
        inc     si
        loop    loop_fee15
        pop     si
        pop     cx
        pop     bx
        xor     ah, ah
        ret
fn_fee23:
        push    bx
        push    si
        mov     al, 0ffh
        call    fn_ff11c
        jnc     br_fee2f
        pop     si
        pop     bx
        ret
br_fee2f:
        cmp     ah, 0ffh
        jnz     br_fee3a
        pop     si
        pop     bx
        mov     ah, 0ffh
        clc
        ret
br_fee3a:
        pop     si
        push    si
        mov     bx, ax
        call    fn_ff25b
        jnc     br_fee46
        pop     si
        pop     bx
        ret
br_fee46:
        pop     si
        pop     bx
        xor     ah, ah
        ret
fn_fee4b:
        push    bx
        mov     al, 0
        call    fn_ff11c
        jnc     br_fee55
        pop     bx
        ret
br_fee55:
        cmp     ah, 0ffh
        jnz     br_fee5f
        pop     bx
        mov     ah, 0ffh
        clc
        ret
br_fee5f:
        push    cx
        push    si
        mov     cx, 20h
loop_fee64:
        mov     al, byte ptr [bx]
        mov     byte ptr [si], al
        inc     bx
        inc     si
        loop    loop_fee64
        pop     si
        pop     cx
        mov     byte ptr [si], 0e5h
        call    fn_ff25b
        jnc     br_fee78
        pop     bx
        ret
br_fee78:
        push    dx
        mov     dx, word ptr [si + 1ah]
br_fee7c:
        or      dx, dx
        jz      br_fee9e
        call    fn_ff3c1
        push    bx
        mov     bx, 0
        call    fn_ff3de
        pop     bx
        cmp     bx, 1
        jbe     br_fee9e
        mov     dx, bx
        and     bx, 0ff8h
        cmp     bx, 0ff8h
        jz      br_fee9e
        jmp     br_fee7c
br_fee9e:
        pop     dx
        pop     bx
        call    fn_ff302
        ret
fn_feea4:
        push    bx
        push    si
        if      FW_VERSION < 212
        add     si, 10h
        else
        add     si, 20h
        endif
        mov     al, 0
        call    fn_ff11c
        pop     si
        jnc     br_feeb3
        pop     bx
        ret
br_feeb3:
        cmp     ah, 0ffh
        jz      br_feebd
        pop     bx
        mov     ah, 0feh
        clc
        ret
br_feebd:
        mov     al, 0
        call    fn_ff11c
        jnc     br_feec6
        pop     bx
        ret
br_feec6:
        cmp     ah, 0ffh
        jnz     br_feed0
        pop     bx
        mov     ah, 0ffh
        clc
        ret
br_feed0:
        push    cx
        push    si
        if      FW_VERSION >= 212
        push    di
        mov     di, si
        endif
        mov     cx, 0bh
loop_feed8:
        if      FW_VERSION < 212
        mov     al, byte ptr [si + 10h]
        else
        mov     al, byte ptr [si + 20h]
        endif
        mov     byte ptr [si], al
        inc     si
        loop    loop_feed8
        if      FW_VERSION < 212
        mov     cx, 15h
        add     bx, 0bh
        else
        inc     si
        mov     cx, 8
loop_feee4:
        mov     al, byte ptr [si + 20h]
        mov     byte ptr [si], al
        inc     si
        loop    loop_feee4
        add     bx, 0bh
        mov     al, byte ptr [bx]
        mov     byte ptr [di + 0bh], al
        add     bx, 9
        mov     cx, 0ch
        endif
loop_feefa:
        mov     al, byte ptr [bx]
        mov     byte ptr [si], al
        inc     bx
        inc     si
        loop    loop_feefa
        if      FW_VERSION >= 212
        pop     di
        endif
        pop     si
        pop     cx
        call    fn_ff25b
        pop     bx
        ret
fn_fef0a:
        push    bx
        push    cx
        mov     al, 0
        call    fn_ff11c
        jnc     br_fef16
        pop     cx
        pop     bx
        ret
br_fef16:
        cmp     ah, 0ffh
        jnz     br_fef21
        pop     cx
        pop     bx
        mov     ah, 0ffh
        clc
        ret
br_fef21:
        call    fn_ff25b
        pop     cx
        pop     bx
        jnc     br_fef29
        ret
br_fef29:
        call    fn_ff302
        ret
fn_fef2d:
        push    bx
        push    cx
        push    dx
        push    si
        push    di
        push    es
        push    bp
        sub     sp, 32h
        mov     bp, sp
        mov     byte ptr [bp], al
        mov     word ptr [bp + 2], 0
        mov     byte ptr [bp + 1], 0
        mov     word ptr [bp + 4], bx
        mov     word ptr [bp + 6], es
        mov     word ptr [bp + 8], 0
loop_fef50:
        if      FW_VERSION < 212
        mov     ah, byte ptr [si + 22h]
        else
        mov     ah, byte ptr [si + 42h]
        endif
        cmp     ah, byte ptr [B_0649]
        jc      br_fef7d
        if      FW_VERSION < 212
        mov     byte ptr [si + 22h], 0
        mov     dx, word ptr [si + 20h]
        call    fn_ff3c1
        mov     word ptr [si + 20h], bx
        else
        mov     byte ptr [si + 42h], 0
        mov     dx, word ptr [si + 40h]
        call    fn_ff3c1
        mov     word ptr [si + 40h], bx
        endif
        cmp     bx, 1
        jbe     br_fef75
        and     bx, 0ff8h
        cmp     bx, 0ff8h
        jnz     br_fef7d
br_fef75:
        mov     word ptr [bp + 8], 0ffffh
        jmp     br_fefc7
        db      090h
br_fef7d:
        if      FW_VERSION < 212
        mov     bx, word ptr [si + 20h]
        call    fn_ff418
        mov     al, byte ptr [si + 22h]
        else
        mov     bx, word ptr [si + 40h]
        call    fn_ff418
        mov     al, byte ptr [si + 42h]
        endif
        mov     ah, 0
        add     bx, ax
        if      FW_VERSION < 212
        inc     byte ptr [si + 22h]
        else
        inc     byte ptr [si + 42h]
        endif
        mov     di, word ptr [bp + 2]
        or      di, di
        jz      br_fefba
        mov     ax, word ptr [W_0654]
        cmp     di, ax
        jnc     br_fefb4
        push    bx
        push    di
        dec     bx
        dec     di
        add     di, di
        cmp     bx, word ptr [bp+di + 0ah]
        pop     di
        pop     bx
        jnz     br_fefb4
        push    bx
        call    fn_ff46a
        pop     bx
        xor     ch, ch
        cmp     cx, 1
        jnz     br_fefba
br_fefb4:
        mov     word ptr [bp + 8], bx
        jmp     br_fefc7
        db      090h
br_fefba:
        add     di, di
        mov     word ptr [bp+di + 0ah], bx
        inc     word ptr [bp + 2]
        dec     byte ptr [bp]
        jnz     loop_fef50
br_fefc7:
        mov     ax, word ptr [bp + 2]
        mov     ah, 2
        mov     bx, word ptr [bp + 0ah]
        call    fn_ff46a
        les     bx, dword ptr [bp + 4]
        mov     dl, byte ptr [B_065B]
        call    fn_ff490
        jc      br_ff008
        xor     cx, cx
        xchg    word ptr [bp + 2], cx
        add     byte ptr [bp + 1], cl
        mov     ax, word ptr [W_0647]
        mul     cx
        add     word ptr [bp + 4], ax
        mov     ax, word ptr [bp + 8]
        cmp     ax, 0ffffh
        jz      br_ff005
        or      ax, ax
        jz      br_ff007
        mov     bx, ax
        xor     di, di
        mov     word ptr [bp + 8], 0
        jmp     br_fefba
br_ff005:
        mov     ah, 0ffh
br_ff007:
        clc
br_ff008:
        mov     al, byte ptr [bp + 1]
        pushf
        pop     bp
        add     sp, 32h
        push    bp
        popf
        pop     bp
        pop     es
        pop     di
        pop     si
        pop     dx
        pop     cx
        pop     bx
        ret
fn_ff01a:
        push    bx
        push    cx
        push    dx
        push    si
        push    di
        push    es
        push    bp
        sub     sp, 32h
        mov     bp, sp
        mov     byte ptr [bp], al
        mov     word ptr [bp + 2], 0
        mov     byte ptr [bp + 1], 0
        mov     word ptr [bp + 4], bx
        mov     word ptr [bp + 6], es
        mov     word ptr [bp + 8], 0
br_ff03d:
        if      FW_VERSION < 212
        mov     ah, byte ptr [si + 22h]
        else
        mov     ah, byte ptr [si + 42h]
        endif
        cmp     ah, byte ptr [B_0649]
        jc      br_ff07c
        if      FW_VERSION < 212
        mov     byte ptr [si + 22h], 0
        else
        mov     byte ptr [si + 42h], 0
        mov     dx, word ptr [si + 40h]
        call    fn_ff3c1
        cmp     bx, 1
        jbe     br_ff05f
        and     bx, 0ff8h
        cmp     bx, 0ff8h
        jnz     br_ff079
br_ff05f:
        endif
        call    fn_ff398
        or      ah, ah
        jz      br_ff06e
        mov     word ptr [bp + 8], 0ffffh
        jmp     br_ff0c9
        db      090h
br_ff06e:
        mov     dx, bx
        if      FW_VERSION < 212
        xchg    word ptr [si + 20h], dx
        call    fn_ff3de
br_ff07c:
        mov     bx, word ptr [si + 20h]
        call    fn_ff418
        mov     al, byte ptr [si + 22h]
        else
        xchg    word ptr [si + 40h], dx
        call    fn_ff3de
        jmp     br_ff07c
        db      090h
br_ff079:
        mov     word ptr [si + 40h], bx
br_ff07c:
        mov     bx, word ptr [si + 40h]
        call    fn_ff418
        mov     al, byte ptr [si + 42h]
        endif
        mov     ah, 0
        add     bx, ax
        if      FW_VERSION < 212
        inc     byte ptr [si + 22h]
        else
        inc     byte ptr [si + 42h]
        endif
        mov     di, word ptr [bp + 2]
        or      di, di
        jz      br_ff0b9
        mov     ax, word ptr [W_0654]
        cmp     di, ax
        jnc     br_ff0b3
        push    bx
        push    di
        dec     bx
        dec     di
        add     di, di
        cmp     bx, word ptr [bp+di + 0ah]
        pop     di
        pop     bx
        jnz     br_ff0b3
        push    bx
        call    fn_ff46a
        pop     bx
        xor     ch, ch
        cmp     cx, 1
        jnz     br_ff0b9
br_ff0b3:
        mov     word ptr [bp + 8], bx
        jmp     br_ff0c9
        db      090h
br_ff0b9:
        add     di, di
        mov     word ptr [bp+di + 0ah], bx
        inc     word ptr [bp + 2]
        dec     byte ptr [bp]
        if      FW_VERSION < 212
        jnz     br_ff03d
        else
        jz      br_ff0c9
        jmp     near br_ff03d
        endif
br_ff0c9:
        mov     ax, word ptr [bp + 2]
        mov     ah, 3
        mov     bx, word ptr [bp + 0ah]
        call    fn_ff46a
        les     bx, dword ptr [bp + 4]
        mov     dl, byte ptr [B_065B]
        call    fn_ff490
        jc      br_ff10a
        xor     cx, cx
        xchg    word ptr [bp + 2], cx
        add     byte ptr [bp + 1], cl
        mov     ax, word ptr [W_0647]
        mul     cx
        add     word ptr [bp + 4], ax
        mov     ax, word ptr [bp + 8]
        cmp     ax, 0ffffh
        jz      br_ff107
        or      ax, ax
        jz      br_ff109
        mov     bx, ax
        xor     di, di
        mov     word ptr [bp + 8], 0
        jmp     br_ff0b9
br_ff107:
        mov     ah, 0ffh
br_ff109:
        clc
br_ff10a:
        mov     al, byte ptr [bp + 1]
        pushf
        pop     bp
        add     sp, 32h
        push    bp
        popf
        pop     bp
        pop     es
        pop     di
        pop     si
        pop     dx
        pop     cx
        pop     bx
        ret
fn_ff11c:
        push    cx
        mov     byte ptr [B_0A7F], al
        mov     cx, word ptr [W_064D]
        xor     al, al
loop_ff126:
        push    si
        push    cx
        call    fn_ff1af
        pop     cx
        pop     si
        jnc     br_ff131
        pop     cx
        ret
br_ff131:
        push    ax
        push    bx
        push    cx
        push    si
        push    di
        if      FW_VERSION < 212
        mov     di, 0e5bh
        else
        mov     di, 118ah
        endif
        cmp     byte ptr [B_0A7F], 0
        jz      br_ff143
        if      FW_VERSION < 212
        mov     di, 0e53h
        else
        mov     di, 1182h
        endif
br_ff143:
        cmp     byte ptr [bx], 0
        jz      br_ff14d
        cmp     byte ptr [bx], 0e5h
        jnz     br_ff14f
br_ff14d:
        jmp     di
br_ff14f:
        if      FW_VERSION < 212
        mov     cx, 0bh
        else
        cmp     byte ptr [B_0A7F], 0ffh
        jnz     br_ff15e
        pop     di
        pop     si
        pop     cx
        pop     bx
        pop     ax
        jmp     br_ff194
        db      090h
br_ff15e:
        mov     cx, 0bh
loop_ff161:
        mov     al, byte ptr [si]
        cmp     al, 3fh
        jz      br_ff16b
        cmp     al, byte ptr [bx]
        jnz     br_ff18a
br_ff16b:
        inc     si
        inc     bx
        loop    loop_ff161
        inc     si
        inc     bx
        mov     cx, 8
        endif
loop_ff174:
        mov     al, byte ptr [si]
        cmp     al, 3fh
        jz      br_ff17e
        cmp     al, byte ptr [bx]
        jnz     br_ff18a
br_ff17e:
        inc     si
        inc     bx
        loop    loop_ff174
tgt_ff182:
        pop     di
        pop     si
        pop     cx
        pop     bx
        pop     ax
        pop     cx
        clc
        ret
br_ff18a:
        if      FW_VERSION < 212
        cmp     byte ptr [bx], 0
        endif
        pop     di
        pop     si
        pop     cx
        pop     bx
        pop     ax
        if      FW_VERSION < 212
        jz      br_ff198
        else
        cmp     byte ptr [bx], 0
        jz      br_ff198
br_ff194:
        endif
        mov     al, 0ffh
        loop    loop_ff126
br_ff198:
        pop     cx
        mov     ah, 0ffh
        clc
        ret
fn_ff19d:
        push    cx
        mov     cx, word ptr [W_064D]
        dec     cx
        mov     al, byte ptr [B_065C]
        xor     ah, ah
        sub     cx, ax
        mov     al, 0ffh
        if      FW_VERSION < 212
        jmp     loop_ff126
        else
        jmp     near loop_ff126
        endif
fn_ff1af:
        or      al, al
        jnz     br_ff1c3
        mov     ax, 0ffh
        mov     byte ptr [B_065C], al
        push    bx
        call    fn_ff2a9
        dec     bx
        mov     word ptr [W_065D], bx
        pop     bx
br_ff1c3:
        inc     byte ptr [B_065C]
        test    byte ptr [B_065C], 0fh
        jnz     br_ff1f8
        push    bx
        push    cx
        push    dx
        push    si
        push    di
        push    es
        inc     word ptr [W_065D]
        mov     bx, word ptr [W_065D]
        call    fn_ff46a
        mov     dl, byte ptr [B_065B]
        push    ds
        pop     es
        mov     bx, A_065F
        mov     ah, 2
        mov     al, 1
        call    fn_ff490
        pop     es
        pop     di
        pop     si
        pop     dx
        pop     cx
        pop     bx
        jnc     br_ff1f8
        ret
br_ff1f8:
        mov     ah, byte ptr [B_065C]
        mov     bl, ah
        if      FW_VERSION < 212
        and.w   bx, 0fh
        else
        and     bx, 0fh
        endif
        shl     bx, 1
        shl     bx, 1
        shl     bx, 1
        shl     bx, 1
        shl     bx, 1
        add     bx, A_065F
        clc
        ret
fn_ff211:
        push    bx
        push    cx
        push    dx
        push    di
        push    es
        push    si
        push    ax
        call    fn_ff2a9
        call    fn_ff46a
        mov     dl, byte ptr [B_065B]
        push    ds
        pop     es
        mov     bx, A_085F
        mov     ah, 2
        mov     al, 1
        call    fn_ff490
        jnc     br_ff237
        add     sp, 2
        stc
        jmp     br_ff254
        db      090h
br_ff237:
        pop     ax
        mov     bl, ah
        pop     si
        push    si
        if      FW_VERSION < 212
        and.w   bx, 0fh
        else
        and     bx, 0fh
        endif
        mov     cl, 5
        shl     bx, cl
        add     bx, A_085F
        mov     cx, 20h
loop_ff24a:
        mov     al, byte ptr [bx]
        mov     byte ptr [si], al
        inc     bx
        inc     si
        loop    loop_ff24a
        xor     ah, ah
br_ff254:
        pop     si
        pop     es
        pop     di
        pop     dx
        pop     cx
        pop     bx
        ret
fn_ff25b:
        push    bx
        push    cx
        push    dx
        push    di
        push    es
        push    ax
        push    si
        if      FW_VERSION < 212
        mov     si, 0a55h
        else
        mov     si, 0a5fh
        endif
        call    fn_ff211
        pop     si
        jnc     br_ff272
        add     sp, 2
        stc
        if      FW_VERSION < 212
        jmp     short br_ff2a3
        else
        jmp     br_ff2a3
        endif
        db      090h
br_ff272:
        pop     ax
        mov     bl, ah
        if      FW_VERSION < 212
        and.w   bx, 0fh
        else
        and     bx, 0fh
        endif
        mov     cl, 5
        shl     bx, cl
        add     bx, A_085F
        mov     cx, 20h
        push    si
loop_ff284:
        mov     al, byte ptr [si]
        mov     byte ptr [bx], al
        inc     si
        inc     bx
        loop    loop_ff284
        pop     si
        if      FW_VERSION < 212
        jmp     L_fef83
        db      090h
        db      20h dup (000h)
L_fef83:
        push    ds
        push    es
        push    si
        push    di
        push    cx
        mov     cx, ds
        mov     es, cx
        mov     cx, cs
        mov     ds, cx
        mov     si, 0f63h
        mov     di, 0a35h
        mov     cx, 20h
        repe cmpsb
        pop     cx
        pop     di
        pop     si
        pop     es
        pop     ds
        jnz     L_fefa8
        mov     ah, 30h
        stc
        jmp     br_ff2a3
        db      090h
L_fefa8:
        endif
        call    fn_ff2a9
        call    fn_ff46a
        mov     dl, byte ptr [B_065B]
        push    ds
        pop     es
        mov     bx, A_085F
        mov     ah, 3
        mov     al, 1
        call    fn_ff490
br_ff2a3:
        pop     es
        pop     di
        pop     dx
        pop     cx
        pop     bx
        ret
fn_ff2a9:
        push    ax
        push    cx
        push    dx
        mov     bl, ah
        mov     cl, 4
        shr     bl, cl
        xor     bh, bh
        mov     al, byte ptr [B_064C]
        xor     ah, ah
        mul     word ptr [W_0652]
        add     ax, word ptr [W_064A]
        add     bx, ax
        pop     dx
        pop     cx
        pop     ax
        ret
fn_ff2c7:
        push    bx
        push    cx
        push    dx
        push    si
        push    di
        push    es
        mov     bx, word ptr [W_064A]
        mov     si, TBL_0A80
        mov     cx, word ptr [W_0652]
loop_ff2d8:
        push    bx
        push    cx
        push    si
        call    fn_ff46a
        mov     dl, byte ptr [B_065B]
        push    ds
        pop     es
        mov     bx, si
        mov     ah, 2
        mov     al, 1
        call    fn_ff490
        pop     si
        pop     cx
        pop     bx
        jc      br_ff2fb
        add     si, word ptr [W_0647]
        inc     bx
        loop    loop_ff2d8
        xor     ah, ah
br_ff2fb:
        pop     es
        pop     di
        pop     si
        pop     dx
        pop     cx
        pop     bx
        ret
fn_ff302:
        push    bx
        push    cx
        push    dx
        push    si
        push    di
        push    es
        mov     cl, byte ptr [B_064C]
        xor     ch, ch
        mov     bx, word ptr [W_064A]
loop_ff312:
        push    cx
        mov     si, TBL_0A80
        mov     cx, word ptr [W_0652]
loop_ff31a:
        push    bx
        push    cx
        push    si
        call    fn_ff46a
        mov     dl, byte ptr [B_065B]
        push    ds
        pop     es
        mov     bx, si
        mov     ah, 3
        mov     al, 1
        call    fn_ff490
        pop     si
        pop     cx
        pop     bx
        jc      br_ff341
        inc     bx
        add     si, word ptr [W_0647]
        loop    loop_ff31a
        pop     cx
        loop    loop_ff312
        jmp     br_ff342
        db      090h
br_ff341:
        pop     cx
br_ff342:
        pop     es
        pop     di
        pop     si
        pop     dx
        pop     cx
        pop     bx
        ret
fn_ff349:
        push    ax
        push    cx
        push    dx
        mov     dx, word ptr [W_064F]
        mov     ah, 0
        call    fn_ff2a9
        mov     ax, word ptr [W_064D]
        add     ax, 0fh
        mov     cl, 4
        shr     ax, cl
        add     ax, bx
        sub     dx, ax
        mov     ax, dx
        xor     dx, dx
        mov     bl, byte ptr [B_0649]
        xor     bh, bh
        div     bx
        mov     bx, ax
        pop     dx
        pop     cx
        pop     ax
        ret
fn_ff375:
        push    cx
        push    dx
        call    fn_ff349
        mov     dx, 2
        mov     cx, bx
        mov     bx, 0
        push    bx
loop_ff383:
        push    cx
        push    dx
        call    fn_ff3c1
        pop     dx
        pop     cx
        or      bx, bx
        jnz     br_ff391
        pop     bx
        inc     bx
        push    bx
br_ff391:
        inc     dx
        loop    loop_ff383
        pop     bx
        pop     dx
        pop     cx
        ret
fn_ff398:
        push    cx
        push    dx
        call    fn_ff349
        mov     cx, bx
        mov     dx, 2
loop_ff3a2:
        call    fn_ff3c1
        or      bx, bx
        jz      br_ff3b2
        inc     dx
        loop    loop_ff3a2
        pop     dx
        pop     cx
        mov     ah, 0ffh
        clc
        ret
br_ff3b2:
        mov     bx, dx
        push    bx
        mov     bx, 0fffh
        call    fn_ff3de
        pop     bx
        pop     dx
        pop     cx
        xor     ah, ah
        ret
fn_ff3c1:
        mov     bx, dx
        clc
        rcr     bx, 1
        pushf
        add     bx, dx
        mov     bx, word ptr [bx + TBL_0A80]
        popf
        jc      br_ff3d5
        and     bx, 0fffh
        ret
br_ff3d5:
        shr     bx, 1
        shr     bx, 1
        shr     bx, 1
        shr     bx, 1
        ret
fn_ff3de:
        push    ax
        push    bx
        push    dx
        xchg    bx, dx
        and     dx, 0fffh
        push    dx
        mov     dx, bx
        rcr     bx, 1
        pushf
        add     bx, dx
        mov     ax, word ptr [bx + TBL_0A80]
        popf
        pop     dx
        jc      br_ff403
        and     ax, 0f000h
        or      ax, dx
        mov     word ptr [bx + TBL_0A80], ax
        jmp     br_ff414
        db      090h
br_ff403:
        and     ax, 0fh
        rol     dx, 1
        rol     dx, 1
        rol     dx, 1
        rol     dx, 1
        or      ax, dx
        mov     word ptr [bx + TBL_0A80], ax
br_ff414:
        pop     dx
        pop     bx
        pop     ax
        ret
fn_ff418:
        push    ax
        push    cx
        dec     bx
        dec     bx
        mov     al, byte ptr [B_0649]
        xor     ah, ah
        mul     bx
        mov     bx, ax
        push    bx
        mov     ah, 0
        call    fn_ff2a9
        mov     ax, word ptr [W_064D]
        add     ax, 0fh
        mov     cl, 4
        shr     ax, cl
        add     ax, bx
        pop     bx
        add     bx, ax
        pop     cx
        pop     ax
        ret
fn_ff43d:
        push    cx
        push    dx
        push    bx
        mov     ah, 0
        call    fn_ff2a9
        mov     ax, word ptr [W_064D]
        add     ax, 0fh
        mov     cl, 4
        shr     ax, cl
        add     ax, bx
        pop     bx
        sub     bx, ax
        mov     ax, bx
        xor     dx, dx
        mov     bl, byte ptr [B_0649]
        xor     bh, bh
        div     bx
        add     ax, 2
        mov     bx, ax
        mov     ax, dx
        pop     dx
        pop     cx
        ret
fn_ff46a:
        push    ax
        push    bx
        push    dx
        mov     dx, word ptr [W_0654]
        mov     ax, word ptr [W_0656]
        mul     dx
        mov     cx, ax
        mov     ax, bx
        xor     dx, dx
        div     cx
        mov     ch, al
        mov     ax, dx
        div     byte ptr [W_0654]
        pop     dx
        mov     dh, al
        mov     cl, ah
        inc     cl
        pop     bx
        pop     ax
        ret
fn_ff490:
        push    bp
        push    si
        mov     si, ax
        mov     bp, 5
loop_ff497:
        mov     ax, si
        int     40h
        jnc     br_ff4c3
        cmp     ah, 80h
        jnz     br_ff4b1
        push    ax
        push    dx
        mov     dx, 202h
        in      al, dx
        test    al, 4
        pop     dx
        pop     ax
        jnz     br_ff4b1
        mov     bp, 1
br_ff4b1:
        cmp     bp, 2
        ja      br_ff4bf
        push    ax
        mov     ah, 0
        int     40h
        call    fn_ff4c6
        pop     ax
br_ff4bf:
        dec     bp
        jnz     loop_ff497
        stc
br_ff4c3:
        pop     si
        pop     bp
        ret
fn_ff4c6:
        push    cx
        mov     cx, 5000h
loop_ff4ca:
        loop    loop_ff4ca
        pop     cx
        ret
isr_ff4ce:
        sti
        push    si
        push    di
        push    bp
        push    ds
        push    bx
        push    es
        push    cx
        push    dx
        push    ax
        mov     bp, sp
        mov     di, 0
        mov     ds, di
        cmp     ah, 5
        jbe     br_ff4ec
        mov     byte ptr [B_2C22], 1
        jmp     br_ff4f9
        db      090h
br_ff4ec:
        xchg    al, ah
        cbw
        mov     si, TBL_ff527
        add     si, ax
        add     si, ax
        call    word ptr cs:[si]
br_ff4f9:
        cmp     byte ptr [bp + 1], 0
        jz      br_ff512
        cmp     byte ptr [bp + 1], 1
        jz      br_ff512
        push    ax
        mov     bx, word ptr [W_0658]
        mov     al, byte ptr cs:[bx + 2]
        mov     byte ptr [B_2C21], al
        pop     ax
br_ff512:
        mov     ah, byte ptr [B_2C22]
        or      ah, ah
        jz      br_ff51b
        stc
br_ff51b:
        pop     dx
        pop     dx
        pop     cx
        pop     es
        pop     bx
        pop     ds
        pop     bp
        pop     di
        pop     si
        retf    2
TBL_ff527:
        dw      tgt_ff533
        dw      tgt_ff5a1
        dw      tgt_ff5a5
        dw      tgt_ff65b
        dw      tgt_ff676
        dw      tgt_ff681
tgt_ff533:
        cli
        push    es
        push    si
        xor     ax, ax
        mov     ds, ax
        mov     si, ax
        mov     cx, 400h
        mov     dx, 206h
        mov     al, 1
        out     dx, al
        mov     dx, 0ff22h
        mov     ax, 0ch
        out     dx, ax
        mov     dx, 0ff38h
        mov     ax, 7
        out     dx, ax
        rep lodsw
        mov     dx, 206h
        mov     al, 0
        out     dx, al
        pop     si
        pop     es
        sti
        mov     byte ptr [B_2C22], 0
        mov     byte ptr [B_2C1F], 0
        call    fn_ff84c
        jc      br_ff597
        mov     bl, byte ptr [B_2C23]
        cmp     bl, 0c0h
        jnz     br_ff597
        mov     bx, word ptr [W_0658]
        mov     al, 3
        mov     ah, byte ptr cs:[bx]
        cmp     ah, 0d0h
        jle     br_ff58a
        and     ah, 0fh
        or      ah, 0d0h
br_ff58a:
        mov     bl, byte ptr cs:[bx + 1]
        mov     di, 3
        call    fn_ff8d4
        jmp     br_ff59c
        db      090h
br_ff597:
        or      byte ptr [B_2C22], 20h
br_ff59c:
        pop     bx
        pop     ax
        push    ax
        jmp     bx
tgt_ff5a1:
        mov     al, byte ptr [B_2C22]
        ret
tgt_ff5a5:
        call    fn_ff7b6
        jnc     br_ff5ab
        ret
br_ff5ab:
        mov     al, 52h
br_ff5ad:
        call    fn_ff7cc
        call    fn_ff6ca
        mov     al, 66h
br_ff5b5:
        call    fn_ff6e2
        jnc     br_ff5bd
        jmp     near br_ff655
br_ff5bd:
        mov     al, byte ptr [bp + 5]
        mov     ah, byte ptr [bp + 3]
        mov     bl, byte ptr [bp + 4]
        mov     di, 3
        call    fn_ff8d4
        jc      br_ff5f4
        mov     bx, word ptr [W_0658]
        mov     al, byte ptr cs:[bx + 3]
        mov     ah, byte ptr cs:[bx + 4]
        mov     cl, byte ptr cs:[bx + 5]
        mov     ch, byte ptr cs:[bx + 6]
        mov     bx, cx
        mov     di, 4
br_ff5e7:
        call    fn_ff8d4
        jc      br_ff5f4
        call    fn_ff85f
        jnc     br_ff5f7
        jmp     br_ff655
        db      090h
br_ff5f4:
        jmp     br_ff658
        db      090h
br_ff5f7:
        call    fn_ff884
        jc      br_ff658
        mov     al, byte ptr [B_2C23]
        and     al, 0c0h
        jz      br_ff634
        cmp     al, 40h
        jnz     br_ff62e
        mov     al, byte ptr [B_2C24]
        if      FW_VERSION < 212
        mov     ah, 2
        test    al, 1
        jnz     br_ff630
        endif
        mov     ah, 3
        test    al, 2
        if      FW_VERSION >= 212
        jnz     br_ff630
        mov     ah, 2
        test    al, 1
        endif
        jnz     br_ff630
        mov     ah, 4
        test    al, 4
        jnz     br_ff630
        mov     ah, 8
        test    al, 10h
        jnz     br_ff630
        mov     ah, 10h
        test    al, 20h
        jnz     br_ff630
        mov     ah, 4
        test    al, 80h
        jnz     br_ff630
br_ff62e:
        mov     ah, 20h
br_ff630:
        mov     byte ptr [B_2C22], ah
br_ff634:
        mov     ch, byte ptr [bp + 5]
        mov     cl, byte ptr [bp + 4]
        mov     dl, byte ptr [B_2C26]
        cmp     dl, ch
        mov     dl, byte ptr [B_2C28]
        jz      br_ff650
        mov     bx, word ptr [W_0658]
        mov     dl, byte ptr cs:[bx + 4]
        inc     dl
br_ff650:
        sub     dl, cl
        mov     al, dl
        ret
br_ff655:
        call    fn_ff884
br_ff658:
        xor     al, al
        ret
tgt_ff65b:
        call    fn_ff7b6
        jnc     br_ff661
        ret
br_ff661:
        mov     al, 57h
        call    fn_ff7cc
        call    fn_ff6ca
        mov     al, 45h
        jz      br_ff670
        jmp     near br_ff5b5
br_ff670:
        call    fn_ff90c
        jmp     near br_ff5b5
tgt_ff676:
        call    fn_ff7b6
        jnc     br_ff67c
        ret
br_ff67c:
        mov     al, 56h
        jmp     br_ff5ad
tgt_ff681:
        call    fn_ff7b6
        jnc     br_ff687
        ret
br_ff687:
        mov     al, 57h
        call    fn_ff7cc
        call    fn_ff6ca
        jnz     br_ff694
        call    fn_ff90c
br_ff694:
        mov     dx, 202h
        in      al, dx
        test    al, 4
        jnz     br_ff6a4
        or      byte ptr [B_2C22], 80h
        xor     al, al
        ret
br_ff6a4:
        mov     al, 4dh
        call    fn_ff6e2
        jnc     br_ff6ae
        xor     al, al
        ret
br_ff6ae:
        mov     bx, word ptr [W_0658]
        mov     al, byte ptr cs:[bx + 3]
        mov     ah, byte ptr cs:[bx + 4]
        mov     cl, byte ptr cs:[bx + 7]
        mov     ch, byte ptr cs:[bx + 8]
        mov     bx, cx
        mov     di, 4
        jmp     br_ff5e7
fn_ff6ca:
        mov     cl, byte ptr [bp + 2]
        cli
        mov     al, byte ptr [B_2C21]
        push    ax
        mov     byte ptr [B_2C21], 0ffh
        mov     dx, 206h
        mov     al, 0dh
        out     dx, al
        pop     ax
        or      al, al
        sti
        ret
fn_ff6e2:
        push    ax
        mov     al, 1
        mov     cl, byte ptr [bp + 2]
        rol     al, cl
        test    byte ptr [B_2C1F], al
        jnz     br_ff723
        or      byte ptr [B_2C1F], al
        mov     cx, 3
loop_ff6f7:
        push    cx
        call    fn_ff75d
        pop     cx
        jnc     br_ff704
        loop    loop_ff6f7
        stc
        jmp     br_ff73f
        db      090h
br_ff704:
        mov     dl, 0ah
        call    fn_ff783
        jc      br_ff73f
        call    fn_ff75d
        jc      br_ff73f
        mov     bx, word ptr [W_0658]
        mov     cl, byte ptr cs:[bx + 9]
        or      cl, cl
        jz      br_ff723
        xor     ch, ch
loop_ff71e:
        call    fn_ff92b
        loop    loop_ff71e
br_ff723:
        mov     bl, byte ptr [bp + 5]
        call    fn_ff783
        jc      br_ff73f
        mov     bx, word ptr [W_0658]
        mov     cl, byte ptr cs:[bx + 9]
        or      cl, cl
        jz      br_ff73e
        xor     ch, ch
loop_ff739:
        call    fn_ff92b
        loop    loop_ff739
br_ff73e:
        clc
br_ff73f:
        pop     ax
        jc      br_ff75c
        mov     di, 1
        call    fn_ff8d4
        jc      br_ff75c
        mov     al, byte ptr [bp + 3]
        shl     al, 1
        shl     al, 1
        and     al, 4
        or      al, byte ptr [bp + 2]
        mov     di, 1
        call    fn_ff8d4
br_ff75c:
        ret
fn_ff75d:
        mov     al, 7
        mov     ah, byte ptr [bp + 2]
        mov     di, 2
        call    fn_ff8d4
        jc      br_ff782
        call    fn_ff84c
        jc      br_ff782
        mov     al, byte ptr [B_2C23]
        and     al, 60h
        cmp     al, 60h
        jnz     br_ff781
        or      byte ptr [B_2C22], 40h
        stc
        jmp     br_ff782
        db      090h
br_ff781:
        clc
br_ff782:
        ret
fn_ff783:
        if      FW_VERSION >= 212
        push    dx
        push    cx
        endif
        mov     ah, byte ptr [bp + 2]
        mov     al, byte ptr [bp + 3]
        and     al, 1
        shl     al, 1
        shl     al, 1
        or      ah, al
        mov     al, 0fh
        mov     di, 3
        call    fn_ff8d4
        jc      br_ff7b3
        call    fn_ff84c
        jc      br_ff7b3
        mov     al, byte ptr [B_2C23]
        if      FW_VERSION < 212
        and     al, 60h
        cmp     al, 60h
        jnz     br_ff7b2
        else
        and     al, 0c0h
        jz      br_ff7b2
        endif
        or      byte ptr [B_2C22], 40h
        stc
        jmp     br_ff7b3
        db      090h
br_ff7b2:
        clc
br_ff7b3:
        if      FW_VERSION >= 212
        pop     cx
        pop     dx
        endif
        ret
fn_ff7b6:
        cmp     byte ptr [bp + 2], 3
        ja      br_ff7c3
        mov     byte ptr [B_2C22], 0
        clc
        ret
br_ff7c3:
        xor     al, al
        mov     byte ptr [B_2C22], 1
        stc
        ret
fn_ff7cc:
        push    ax
        mov     dx, 206h
        mov     al, 0eh
        out     dx, al
        mov     dx, 1a0h
        in      ax, dx
        mov     dx, 0ffdah
        mov     ax, 4
        out     dx, ax
        pop     ax
        mov     dx, word ptr [bp + 6]
        mov     cl, 4
        rol     dx, cl
        mov     cl, dl
        if      FW_VERSION < 212
        and.w   cx, 0fh
        and.w   dx, 0fff0h
        else
        and     cx, 0fh
        and     dx, 0fff0h
        endif
        add     dx, word ptr [bp + 8]
        adc     cx, 0
        mov     si, 0
        mov     di, 0a0h
        cmp     al, 57h
        jz      br_ff812
        xchg    cx, si
        xchg    dx, di
        cmp     al, 56h
        jz      br_ff80c
        mov     bx, 0af46h
        jmp     br_ff815
        db      090h
br_ff80c:
        mov     bx, 0ef46h
        jmp     br_ff815
        db      090h
br_ff812:
        mov     bx, 7786h
br_ff815:
        mov     ax, dx
        mov     dx, 0ffd0h
        out     dx, ax
        mov     ax, cx
        mov     dx, 0ffd2h
        out     dx, ax
        mov     ax, di
        mov     dx, 0ffd4h
        out     dx, ax
        mov     ax, si
        mov     dx, 0ffd6h
        out     dx, ax
        push    bx
        mov     bx, word ptr [W_0658]
        mov     al, byte ptr [bp]
        mov     cl, byte ptr cs:[bx + 3]
        add     cl, 7
        shl     ax, cl
        mov     dx, 0ffd8h
        out     dx, ax
        pop     bx
        mov     ax, bx
        mov     dx, 0ffdah
        out     dx, ax
        xor     ax, ax
        ret
fn_ff84c:
        call    fn_ff85f
        jc      br_ff85e
        mov     al, 8
        mov     di, 1
        call    fn_ff8d4
        jc      br_ff85e
        call    fn_ff884
br_ff85e:
        ret
fn_ff85f:
        sti
        mov     al, 9
        xor     cx, cx
loop_ff864:
        test    byte ptr [B_2C1F], 80h
        jnz     br_ff87d
        loop    loop_ff864
        dec     al
        jnz     loop_ff864
        or      byte ptr [B_2C22], 80h
        and     byte ptr [B_2C1F], 7fh
        stc
        ret
br_ff87d:
        and     byte ptr [B_2C1F], 7fh
        clc
        ret
fn_ff884:
        mov     ax, 0
        cld
        mov     es, ax
        mov     di, B_2C23
        mov     bl, 7
        mov     al, 0eh
loop_ff891:
        dec     al
        jnz     loop_ff891
loop_ff895:
        xor     cx, cx
        mov     dx, 80h
loop_ff89a:
        in      al, dx
        test    al, 80h
        jnz     br_ff8a8
        loop    loop_ff89a
        or      byte ptr [B_2C22], 80h
        stc
        ret
br_ff8a8:
        in      al, dx
        test    al, 40h
        jnz     br_ff8b4
        or      byte ptr [B_2C22], 20h
        stc
        ret
br_ff8b4:
        mov     dx, 82h
        in      al, dx
        stosb
        mov     al, 0eh
loop_ff8bb:
        dec     al
        jnz     loop_ff8bb
        mov     dx, 80h
        in      al, dx
        test    al, 10h
        jz      br_ff8d2
        dec     bl
        jnz     loop_ff895
        or      byte ptr [B_2C22], 20h
        stc
        ret
br_ff8d2:
        clc
        ret
fn_ff8d4:
        push    ax
        mov     al, 0eh
loop_ff8d7:
        dec     al
        jnz     loop_ff8d7
        xor     cx, cx
        mov     dx, 80h
loop_ff8e0:
        in      al, dx
        test    al, 80h
        jnz     br_ff8ef
        loop    loop_ff8e0
        or      byte ptr [B_2C22], 80h
        pop     ax
        stc
        ret
br_ff8ef:
        in      al, dx
        test    al, 40h
        jz      br_ff8fc
        or      byte ptr [B_2C22], 20h
        pop     ax
        stc
        ret
br_ff8fc:
        pop     ax
        mov     dx, 82h
        out     dx, al
        mov     al, ah
        mov     ah, bl
        mov     bl, bh
        dec     di
        jnz     fn_ff8d4
        clc
        ret
fn_ff90c:
        push    ax
        push    bx
        push    dx
        mov     bx, word ptr [W_0658]
        mov     al, byte ptr cs:[bx + 0ah]
        xor     ah, ah
        mov     dx, 64h
        mul     dx
        mov     cx, ax
loop_ff920:
        push    cx
        call    fn_ff92b
        pop     cx
        loop    loop_ff920
        pop     dx
        pop     bx
        pop     ax
        ret
fn_ff92b:
        push    ax
        push    bx
        push    cx
        push    dx
        mov     dx, 0ffc8h
        in      ax, dx
        mov     bx, ax
        sub     bx, 3eh
        jnc     br_ff943
        neg     bx
        mov     ax, 8000h
        sub     ax, bx
        mov     bx, ax
br_ff943:
        xor     cx, cx
loop_ff945:
        in      ax, dx
        cmp     ax, bx
        jbe     br_ff94c
        loop    loop_ff945
br_ff94c:
        pop     dx
        pop     cx
        if      FW_VERSION < 212
        pop     bx
        pop     ax
        ret
L_ff66c:
        endif

RUN_FN_FFF86 macro   {GLOBALSYMBOLS}
        pop     si
        push    es
        push    cs
        pop     es
        call    fn_fff86
        pop     es
        push    si
        ret
fn_fff86:
        cld
br_fff87:
        mov     al, byte ptr es:[si]
        inc     si
        cmp     al, 0
        jz      br_fff9c
        push    si
        push    cx
        push    es
        mov     cl, al
        call    fn_fffd1
        pop     es
        pop     cx
        pop     si
        jmp     br_fff87
br_fff9c:
        ret
fn_fff9d:
        mov     cl, 2
        if      FW_VERSION >= 212
        call    fn_fffa3
        ret
fn_fffa3:
        else
        call    L_ff69f
        ret
L_ff693:
        mov     cl, 4
        call    L_ff69f
        ret
L_ff699:
        mov     cl, 1
        call    L_ff69f
        ret
L_ff69f:
        endif
        mov     dl, 4
        sub     dl, cl
        shl     dl, 1
        shl     dl, 1
        push    cx
        mov     cl, dl
        shl     ax, cl
        pop     cx
br_fffb1:
        or      cl, cl
        jz      br_fffd0
        push    cx
        mov     cl, 4
        rol     ax, cl
        push    ax
        and     al, 0fh
        cmp     al, 0ah
        jl      br_fffc3
        add     al, 7
br_fffc3:
        add     al, 30h
        mov     cl, al
        call    fn_fffd1
        pop     ax
        pop     cx
        dec     cl
        jmp     br_fffb1
br_fffd0:
        ret
fn_fffd1:
        push    ax
        push    bx
        mov     bl, cl
        mov     ax, 4
        int     43h
        endm
        if      FW_VERSION < 212
        RUN_FN_FFF86
        endif

        pop     bx
        pop     ax
        ret

isr_ff951:
        sti
        push    bx
        push    cx
        push    dx
        push    si
        push    di
        push    bp
        push    ds
        push    es
        mov     si, ax
        mov     ax, 0
        mov     ds, ax
        mov     es, ax
        cmp.w   si, 8
        jnc     br_ff972
        shl     si, 1
        add     si, TBL_ff97b
        call    word ptr cs:[si]
br_ff972:
        pop     es
        pop     ds
        pop     bp
        pop     di
        pop     si
        pop     dx
        pop     cx
        pop     bx
        iret
TBL_ff97b:
        dw      tgt_ff98b
        dw      fn_ff9c4
        dw      tgt_ff9db
        dw      tgt_ff9eb
        dw      tgt_ff9f9
        dw      tgt_ffaaf
        dw      tgt_ffac2
        dw      tgt_ffae0
tgt_ff98b:
        mov     ax, 3ch
        call    fn_ffb01
        mov     ax, 175h
        call    fn_ffb01
        mov     ax, 227h
        call    fn_ffb01
        mov     ax, 33fh
        call    fn_ffb01
        mov     ax, 407h
        call    fn_ffb01
        mov     ax, 800h
        call    fn_ffb01
        mov     ax, 900h
        call    fn_ffb01
        cld
        mov     cx, 140h
        push    ds
        pop     es
        mov     di, TBL_2C2A
        rep stosb
        call    fn_ff9c4
        ret
fn_ff9c4:
        xor     ax, ax
        call    fn_ffaea
        mov     cx, 140h
loop_ff9cc:
        push    cx
        mov     bl, 20h
        call    fn_ffa73
        pop     cx
        loop    loop_ff9cc
        xor     ax, ax
        call    fn_ffaea
        ret
tgt_ff9db:
        mov     ax, bx
        and     ax, 3
        shl     ax, 1
        shl     ax, 1
        add     ax, 30h
        call    fn_ffb01
        ret
tgt_ff9eb:
        mov     al, bh
        mov     bh, 28h
        mul     bh
        xor     bh, bh
        add     ax, bx
        call    fn_ffaea
        ret
tgt_ff9f9:
        mov     si, TBL_ffa15
br_ff9fc:
        mov     al, byte ptr cs:[si]
        or      al, al
        jz      br_ffa11
        cmp     al, bl
        jz      br_ffa0c
        add     si, 3
        jmp     br_ff9fc
br_ffa0c:
        inc     si
        call    word ptr cs:[si]
        ret
br_ffa11:
        call    fn_ffa73
        ret
TBL_ffa15:
        db      00dh
        dw      tgt_ffa25
        db      00ah
        dw      tgt_ffa32
        db      008h
        dw      tgt_ffa45
        db      07fh
        dw      tgt_ffa51
        db      00ch
        dw      tgt_ffa6f
        db      000h
tgt_ffa25:
        mov     ax, word ptr [W_2EAA]
        mov     cl, 28h
        div     cl
        mul     cl
        call    fn_ffaea
        ret
tgt_ffa32:
        mov     ax, word ptr [W_2EAA]
        mov     cl, 28h
        div     cl
        cmp     al, 7
        jnc     br_ffa3f
        inc     al
br_ffa3f:
        mul     cl
        call    fn_ffaea
        ret
tgt_ffa45:
        mov     ax, word ptr [W_2EAA]
        or      ax, ax
        jz      br_ffa50
        dec     ax
        call    fn_ffaea
br_ffa50:
        ret
tgt_ffa51:
        mov     ax, word ptr [W_2EAA]
        or      ax, ax
        jz      br_ffa6e
        dec     ax
        push    ax
        mov     bx, ax
        mov     byte ptr [bx + TBL_2C2A], 20h
        call    fn_ffaea
        mov     ax, 0c20h
        call    fn_ffb01
        pop     ax
        call    fn_ffaea
br_ffa6e:
        ret
tgt_ffa6f:
        call    fn_ff9c4
        ret
fn_ffa73:
        mov     al, bl
        mov     bx, word ptr [W_2EAA]
        cmp     al, byte ptr [bx + TBL_2C2A]
        jnz     br_ffa87
        mov     byte ptr [B_2EAE], 0
        jmp     br_ffa9e
        db      090h
br_ffa87:
        mov     byte ptr [bx + TBL_2C2A], al
        test    byte ptr [B_2EAE], 0ffh
        jnz     br_ffa99
        push    ax
        mov     ax, bx
        call    fn_ffaea
        pop     ax
br_ffa99:
        mov     ah, 0ch
        call    fn_ffb01
br_ffa9e:
        mov     ax, word ptr [W_2EAA]
        cmp     ax, 13fh
        jz      br_ffaab
        inc     ax
        mov     word ptr [W_2EAA], ax
        ret
br_ffaab:
        call    fn_ffaea
        ret
tgt_ffaaf:
        cld
        mov     si, TBL_2C2A
        if      FW_VERSION < 212
        mov     di, 1e98h
        else
        mov     di, 2d6ah
        endif
        mov     cx, 140h
        rep movsb
        mov     ax, word ptr [W_2EAA]
        mov     word ptr [W_2EAC], ax
        ret
tgt_ffac2:
        xor     ax, ax
        call    fn_ffaea
        cld
        if      FW_VERSION < 212
        mov     si, 1e98h
        else
        mov     si, 2d6ah
        endif
        mov     cx, 140h
loop_fface:
        lodsb
        mov     bl, al
        push    cx
        push    si
        call    fn_ffa73
        pop     si
        pop     cx
        loop    loop_fface
        mov     ax, word ptr [W_2EAC]
        call    fn_ffaea
tgt_ffae0:
        mov     ax, word ptr [W_2EAA]
        mov     cl, 28h
        div     cl
        xchg    ah, al
        ret
fn_ffaea:
        mov     word ptr [W_2EAA], ax
        push    ax
        mov     ah, 0ah
        call    fn_ffb01
        pop     ax
        mov     al, ah
        mov     ah, 0bh
        call    fn_ffb01
        mov     byte ptr [B_2EAE], 0ffh
        ret
fn_ffb01:
        push    ax
loop_ffb02:
        in      al, 0b0h
        and     al, 80h
        jnz     loop_ffb02
        mov     al, ah
        out     0b4h, al
        nop
        nop
        nop
        nop
        nop
        nop
        pop     ax
        out     0b6h, al
        nop
        nop
        nop
        nop
        nop
        nop
        ret
isr_ffb1c:
        sti
        push    bx
        push    cx
        push    dx
        push    si
        push    di
        push    bp
        push    ds
        push    es
        mov     si, ax
        mov     ax, 0
        mov     ds, ax
        mov     es, ax
        cmp.w   si, 4
        jnc     br_ffb3d
        shl     si, 1
        add     si, TBL_ffb46
        call    word ptr cs:[si]
br_ffb3d:
        pop     es
        pop     ds
        pop     bp
        pop     di
        pop     si
        pop     dx
        pop     cx
        pop     bx
        iret
TBL_ffb46:
        dw      tgt_ffb4e
        dw      tgt_ffb74
        dw      tgt_ffb7f
        dw      tgt_ffb8c
tgt_ffb4e:
        mov     dx, 132h
        mov     al, 0
        out     dx, al
        mul     al
        out     dx, al
        mul     al
        out     dx, al
        mul     al
        mov     al, 40h
        out     dx, al
        mul     al
        mov     al, 4eh
        out     dx, al
        mul     al
        mov     al, 35h
        out     dx, al
        mul     al
        mov     dx, 130h
        in      al, dx
        mul     al
        in      al, dx
        mul     al
tgt_ffb74:
        mov     dx, 132h
        in      al, dx
        and     al, 2
        jz      br_ffb7e
        mov     al, 0ffh
br_ffb7e:
        ret
tgt_ffb7f:
        mov     dx, 132h
loop_ffb82:
        in      al, dx
        test    al, 2
        jz      loop_ffb82
        mov     dx, 130h
        in      al, dx
        ret
tgt_ffb8c:
        mov     dx, 132h
loop_ffb8f:
        in      al, dx
        test    al, 1
        jz      loop_ffb8f
        mov     dx, 130h
        mov     al, cl
        out     dx, al
        ret
        if      FW_VERSION < 212
        db      2ddh dup (000h)
        else
        db      65h dup (000h)
        endif
far_ffc00:
        mov     ax, 0
        mov     ds, ax
        mov     es, ax
        mov     ss, ax
        if      FW_VERSION < 212
        mov     sp, 20deh
        else
        mov     sp, 2fdch
        endif
        mov     dx, 0ffa8h
        mov     ax, 82b8h
        out     dx, ax
        mov     dx, 0ffa6h
        mov     ax, 0bdfah
        out     dx, ax
        mov     dx, 0ffa4h
        mov     ax, 3bh
        out     dx, ax
        mov     dx, 0ffa0h
        mov     ax, 0c03dh
        out     dx, ax
        mov     dx, 206h
        mov     al, 82h
        out     dx, al
        mov     dx, 200h
        mov     al, 0ffh
        out     dx, al
        mov     dx, 204h
        mov     al, 9
        out     dx, al
        mov     dx, 1a0h
        in      ax, dx
        if      FW_VERSION < 212
        mov     si, 1e29h
        else
        mov     ax, 1e20h
        endif
        mov     di, 0
        mov     cx, 14h
loop_ffc47:
        if      FW_VERSION < 212
        mov     ax, word ptr cs:[si]
        add     si, 2
        mov     word ptr [di], ax
        add     di, 2
        mov     ax, cs
        mov     word ptr [di], ax
        add     di, 2
        loop    loop_ffc47
        mov     ax, 1dabh
        mov     word ptr [48h], ax
        mov     ax, 1db8h
        mov     word ptr [8], ax
        mov     ax, 1db9h
        mov     word ptr [28h], ax
        mov     ax, 1de9h
        mov     word ptr [2ch], ax
        mov     ax, 1db8h
        mov     word ptr [108h], ax
        mov     ax, cs
        mov     word ptr [10ah], ax
        mov     ax, 1d93h
        mov     word ptr [30h], ax
        mov     ax, cs
        mov     word ptr [W_0026], ax
        else
        mov     word ptr [di], ax
        add     ax, 3
        mov     word ptr [di + 2], cs
        add     di, 4
        loop    loop_ffc47
        mov     ax, 1da2h
        mov     word ptr [48h], ax
        mov     ax, 1dafh
        mov     word ptr [8], ax
        mov     ax, 1db0h
        mov word ptr [W_0028], ax
        mov     ax, 1de0h
        mov     word ptr [2ch], ax
        mov     ax, 1dafh
        mov     word ptr [108h], ax
        mov     word ptr [10ah], cs
        mov     ax, 1d8ah
        mov     word ptr [30h], ax
        mov     word ptr [32h], cs
        endif
        mov     dx, 0ff5eh
        mov     ax, 0e001h
        out     dx, ax
        mov     dx, 0ff5ah
        mov     ax, 61a8h
        out     dx, ax
        mov     dx, 0ff66h
        mov     ax, 0c001h
        out     dx, ax
        mov     dx, 0ff62h
        mov     ax, 28h
        out     dx, ax
        mov     dx, 0ff32h
        mov     ax, 2
        out     dx, ax
        mov     dx, 0ff34h
        mov     ax, 0
        out     dx, ax
        mov     dx, 0ff36h
        mov     ax, 1
        out     dx, ax
        mov     dx, 0ff38h
        mov     ax, 7
        out     dx, ax
        call    fn_ffdbf
        sti
        mov     dx, 1ceh
        mov     cx, 8
loop_ffcc2:
        out     dx, al
        dec     dx
        dec     dx
        loop    loop_ffcc2
        mov     dx, 1eeh
        mov     cx, 8
loop_ffccd:
        out     dx, al
        dec     dx
        dec     dx
        loop    loop_ffccd
        cli
        mov     bx, 108h
        mov     ax, word ptr [bx]
        mov     word ptr [400h], ax
        if      FW_VERSION < 212
        mov     word ptr [bx], 1df9h
        else
        mov     word ptr [bx], 1df0h
        endif
        mov     ax, word ptr [bx + 2]
        mov     word ptr [402h], ax
        mov     word ptr [bx + 2], cs
        sti
        if      FW_VERSION < 212
        mov     ax, 11e9h
        mov     word ptr [100h], ax
        mov     ax, cs
        mov     word ptr [102h], ax
        mov     ax, 2a3h
        mov     word ptr [104h], ax
        mov     ax, cs
        mov     word ptr [106h], ax
        else
        mov     ax, 14ceh
        mov     word ptr [100h], ax
        mov     word ptr [102h], cs
        mov     ax, 2a7h
        mov     word ptr [104h], ax
        mov     word ptr [106h], cs
        endif
        mov     ax, A_029C
        mov     word ptr [W_0658], ax
        mov     ax, 0
        int     41h
        if      FW_VERSION < 212
        mov     ax, 16d9h
        mov     word ptr [10ch], ax
        mov     ax, cs
        mov     word ptr [10eh], ax
        else
        mov     ax, 1951h
        mov     word ptr [10ch], ax
        mov     word ptr [10eh], cs
        endif
        mov     ax, 0
        int     43h
        if      FW_VERSION < 212
        mov     ax, 18a4h
        mov     word ptr [110h], ax
        mov     ax, cs
        mov     word ptr [112h], ax
        else
        mov     ax, 1b1ch
        mov     word ptr [110h], ax
        mov     word ptr [112h], cs
        endif
        mov     ax, 0
        int     44h
        mov     ax, 0
        mov     word ptr [114h], ax
        if      FW_VERSION < 212
        mov     ax, cs
        mov     word ptr [116h], ax
        mov     dx, 1d87h
        else
        mov     word ptr [116h], cs
        mov     dx, 1d7eh
        endif
        push    ds
        push    cs
        pop     ds
        if      FW_VERSION < 212
        mov     ax, 20f0h
        else
        mov     ax, 2feeh
        endif
        shr     ax, 1
        shr     ax, 1
        shr     ax, 1
        shr     ax, 1
        if      FW_VERSION >= 212
        mov     bx, 0
        add     ax, bx
        endif
        mov     es, ax
        int     45h
        pop     ds
        or      ah, ah
        jnz     br_ffd67
        mov     ax, si
        or      ax, di
        jz      br_ffd5b
        cli
        mov     ss, si
        mov     sp, di
        sti
br_ffd5b:
        mov     word ptr [W_0643], bx
        mov     word ptr [W_0645], es
        jmpf    dword ptr [W_0643]
br_ffd67:
        mov     ax, 0c000h
        mov     es, ax
        mov     bx, 0
        mov     bx, word ptr es:[bx]
        mov     word ptr [W_0643], bx
        mov     word ptr [W_0645], es
        jmpf    dword ptr [W_0643]
        db      "SYSTEM  SYS", 0
isr_ffd8a:
        push    ax
        push    dx
        push    ds
        mov     ax, 0
        mov     ds, ax
        or      byte ptr [B_2C1F], 80h
        mov     dx, 0ff22h
        mov     ax, 0ch
        out     dx, ax
        pop     ds
        pop     dx
        pop     ax
        iret
isr_ffda2:
        push    ax
        push    dx
        mov     dx, 0ff22h
        mov     ax, 8
        out     dx, ax
        pop     dx
        pop     ax
        int     42h
        if      FW_VERSION >= 212
isr_ffdaf:
        endif
        iret
isr_ffdb0:
        push    ax
        push    dx
        call    fn_ffdbf
        mov     dx, 0ff22h
        mov     ax, 0ah
        out     dx, ax
        pop     dx
        pop     ax
        iret
fn_ffdbf:
        xor     ax, ax
        mov     dx, 0ffc4h
        out     dx, ax
        mov     dx, 0ffc6h
        out     dx, ax
        mov     dx, 0ffc0h
        out     dx, ax
        mov     dx, 0ffc2h
        out     dx, ax
        mov     dx, 0ffc8h
        mov     ax, 8000h
        out     dx, ax
        mov     dx, 0ffcah
        mov     ax, 0b5b7h
        out     dx, ax
        ret
isr_ffde0:
        push    ax
        push    dx
        mov     dx, 90h
        out     dx, al
        mov     dx, 0ff22h
        mov     ax, 0bh
        out     dx, ax
        pop     dx
        pop     ax
        iret
fn_ffdf0:
        push    ds
        push    ax
        push    bx
        mov     ax, 0
        mov     ds, ax
        call    fn_ffe04
        pushf
        callf   dword ptr [400h]
        pop     bx
        pop     ax
        pop     ds
        iret
fn_ffe04:
        push    dx
        push    ax
        mov     al, byte ptr [B_2C21]
        cmp     al, 0ffh
        jz      br_ffe1d
        or      al, al
        jz      br_ffe1d
        dec     byte ptr [B_2C21]
        jnz     br_ffe1d
        mov     dx, 206h
        mov     al, 0ch
        out     dx, al
br_ffe1d:
        pop     ax
        pop     dx
        ret
        if      FW_VERSION < 212
        db      051h, 01eh, 056h, 01eh, 05bh, 01eh, 060h, 01eh, 065h, 01eh, 06ah, 01eh, 06fh, 01eh, 074h, 01eh
        db      079h, 01eh, 07eh, 01eh, 083h, 01eh, 088h, 01eh, 08dh, 01eh, 092h, 01eh, 097h, 01eh, 09ch, 01eh
        db      0a1h, 01eh, 0a6h, 01eh, 0abh, 01eh, 0b0h, 01eh, 0b0h, 000h, 0ebh, 060h, 090h, 0b0h, 001h, 0ebh
        db      05bh, 090h, 0b0h, 002h, 0ebh, 056h, 090h, 0b0h, 003h, 0ebh, 051h, 090h, 0b0h, 004h, 0ebh, 04ch
        db      090h, 0b0h, 005h, 0ebh, 047h, 090h, 0b0h, 006h, 0ebh, 042h, 090h, 0b0h, 007h, 0ebh, 03dh, 090h
        db      0b0h, 008h, 0ebh, 038h, 090h, 0b0h, 009h, 0ebh, 033h, 090h, 0b0h, 00ah, 0ebh, 02eh, 090h, 0b0h
        db      00bh, 0ebh, 029h, 090h, 0b0h, 00ch, 0ebh, 024h, 090h, 0b0h, 00dh, 0ebh, 01fh, 090h, 0b0h, 00eh
        db      0ebh, 01ah, 090h, 0b0h, 00fh, 0ebh, 015h, 090h, 0b0h, 010h, 0ebh, 010h, 090h, 0b0h, 011h, 0ebh
        db      00bh, 090h, 0b0h, 012h, 0ebh, 006h, 090h, 0b0h, 013h, 0ebh, 001h, 090h, 0fbh, 050h, 0b8h, 001h
        db      000h, 0cdh, 043h, 0e8h, 0adh, 0f7h
        db      "============= System Error =============Sorry, but a software bug of type ", 0
        db      058h, 0e8h, 07fh, 0f7h, 0e8h, 05bh, 0f7h, 068h, 00dh, 00ah
        db      "has caused all memory to be lost.  It"
        db      00dh, 00ah
        db      "would help very much if you would pleasewrite down as much as you can remember"
        db      00dh, 00ah
        db      "of what you did which caused this screento appear, and call or send this infor-"
        db      00dh, 00ah
        db      "mation to your Akai "
        else
fn_ffe20:
        call    fn_ffe5c
        call    fn_ffe5c
        call    fn_ffe5c
        call    fn_ffe5c
        call    fn_ffe5c
        call    fn_ffe5c
        call    fn_ffe5c
        call    fn_ffe5c
        call    fn_ffe5c
        call    fn_ffe5c
        call    fn_ffe5c
        call    fn_ffe5c
        call    fn_ffe5c
        call    fn_ffe5c
        call    fn_ffe5c
        call    fn_ffe5c
        call    fn_ffe5c
        call    fn_ffe5c
        call    fn_ffe5c
        call    fn_ffe5c
fn_ffe5c:
        sti
        mov     ax, 1
        int     43h
        call    fn_fff7c
        db      "============= System Error =============Sorry, but a software bug of type ", 0
        pop     ax
        sub     ax, 1e23h
        mov     bl, 3
        div     bl
        call    fn_fff9d
        call    fn_fff7c
        db      068h, 00dh, 00ah
        db      "caused all memory to be lost.  Please"
        db      00dh, 00ah
        db      "write down as much as you can remember"
        db      00dh, 00ah
        db      "of what happened that caused this screento appear. Call or send this informationto your Akai distributor.", 0
br_fff7a:
        jmp     br_fff7a
fn_fff7c:
        RUN_FN_FFF86
        pop     bx
        pop     ax
        ret
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h
        endif
        phase   0
reset_ffff0:
        mov     bx, 6
        segcs
        jmpf    dword ptr [bx]
        db      000h, 01ch, 000h, 0feh, 030h, 035h, 032h, 036h, 038h, 037h
