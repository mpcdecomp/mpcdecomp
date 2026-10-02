; ROM 70000h v3.12 image; v3.08/v3.11/v3.12 shared; FW_VERSION for differences

fn_f800a:
        cli
        push    ds
        push    es
        push    si
        push    di
        mov     dx, 0c033h
        mov     al, 34h
        out     dx, al
        mov     dx, 0c033h
        mov     al, 74h
        out     dx, al
        mov     dx, 0c033h
        mov     al, 0b4h
        out     dx, al
        mov     dx, 0fff0h
        mov     al, 12h
        out     dx, al
        mov     dx, 0c000h
        mov     al, 1
        out     dx, al
        mov     dx, 0c000h
        mov     al, 0
        out     dx, al
        mov     dx, 0c010h
        mov     al, 13h
        out     dx, al
        mov     dx, 0c011h
        mov     al, 8
        out     dx, al
        mov     dx, 0c011h
        mov     al, 1
        out     dx, al
        mov     dx, 0c011h
        mov     al, 0ffh
        out     dx, al
        mov     ax, 40h
        mov     ds, ax
        mov     es, ax
        mov     di, 0
        sub     ax, ax
        mov     cx, 68b0h
        cld
        rep stosb
        mov     byte ptr [16h], 0ffh
        mov     byte ptr [15h], 1
        mov     byte ptr [1bh], 0ffh
        mov     ax, 0
        mov     ds, ax
        mov     es, ax
        if      FW_VERSION >= 311
        mov     ax, 1953h
        else
        mov     ax, 1941h
        endif
        mov     di, 0
        mov     cx, 20h
loop_f807c:
        cmp     cx, 18h
        jl      br_f808c
        cmp     word ptr [di], 0
        jnz     br_f8096
        cmp     word ptr [di + 2], 0
        jnz     br_f8096
br_f808c:
        cmp     di, 40h
        jz      br_f8096
        mov     word ptr [di], ax
        mov     word ptr [di + 2], cs
br_f8096:
        add     ax, 3
        add     di, 4
        loop    loop_f807c
        mov     ax, A_1952
        mov     cx, 0e0h
loop_f80a4:
        mov     word ptr [di], ax
        mov     word ptr [di + 2], cs
        add     di, 4
        loop    loop_f80a4
        if      FW_VERSION >= 311
        mov     ax, 1946h
        else
        mov     ax, 1934h
        endif
        mov     word ptr [20h], ax
        mov     word ptr [22h], cs
        mov     ax, A_1952
        mov     word ptr [3ch], ax
        mov     word ptr [3eh], cs
        if      FW_VERSION >= 311
        mov     ax, 364h
        else
        mov     ax, 35eh
        endif
        mov     word ptr [104h], ax
        mov     word ptr [106h], cs
        mov     ax, A_1952
        mov     word ptr [108h], ax
        mov     word ptr [10ah], cs
        if      FW_VERSION >= 311
        mov     ax, 16aah
        else
        mov     ax, 1697h
        endif
        mov     word ptr [10ch], ax
        mov     word ptr [10eh], cs
        if      FW_VERSION >= 311
        mov     ax, 143h
        else
        mov     ax, 13dh
        endif
        mov     word ptr [114h], ax
        mov     word ptr [116h], cs
        if      FW_VERSION >= 311
        mov     ax, 18d6h
        else
        mov     ax, 18c3h
        endif
        mov     word ptr [118h], ax
        mov     word ptr [11ah], cs
        mov     dx, 0c011h
        mov     al, 0feh
        out     dx, al
        sti
        mov     dx, 0c030h
        mov     al, 20h
        out     dx, al
        mov     dx, 0c030h
        mov     al, 4eh
        out     dx, al
        mov     dx, 0c032h
        mov     al, 0
        out     dx, al
        mov     dx, 0c032h
        mov     al, 0
        out     dx, al
        mov     ax, 0
        int     43h
        sub     ax, ax
loop_f811a:
        int     46h
        inc     al
        cmp     al, 10h
        jnz     loop_f811a
        call    fn_f9875
        if      FW_VERSION >= 311
        db      "MPC-3000 BIOS 03/23/96"
        else
        db      "MPC-3000 BIOS 06/14/95"
        endif
        db      00dh, 00ah, 000h
        pop     di
        pop     si
        pop     es
        pop     ds
        retf
isr_f8143:
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
        mov     ax, 40h
        mov     ds, ax
        xor     ax, ax
        mov     word ptr [6408h], ax
        mov     word ptr [640ah], dx
        mov     ax, 6412h
        mov     word ptr [640eh], ax
        mov     ax, ds
        mov     word ptr [6410h], ax
        mov     cx, 14h
        mov     di, 6412h
loop_f8172:
        mov     al, byte ptr es:[bx]
        or      al, al
        jz      br_f817f
        mov     byte ptr [di], al
        inc     bx
        inc     di
        loop    loop_f8172
br_f817f:
        mov     byte ptr [di], 0
        mov     dx, word ptr [640eh]
        mov     ax, 2
        int     41h
        or      ah, ah
        jz      br_f8192
        jmp     br_f830f
br_f8192:
        mov     word ptr [640ch], ax
        mov     bx, ax
        mov     ax, 4
        mov     cx, 1ch
        mov     dx, 63ech
        int     41h
        or      ah, ah
        jz      br_f81a9
        jmp     br_f830f
br_f81a9:
        cmp     cx, 1ch
        jz      br_f81b5
        mov     ah, 1
        xor     al, al
        jmp     br_f830f
br_f81b5:
        cmp     word ptr [63ech], 5a4dh
        jz      br_f81c4
        mov     ah, 2
        xor     al, al
        jmp     br_f830f
br_f81c4:
        mov     ax, word ptr [63f4h]
        mov     cl, 4
        shl     ax, cl
        sub     ax, 1ch
        mov     cx, ax
        push    cx
        mov     bx, word ptr [640ch]
        push    ds
        lds     dx, dword ptr [6408h]
        mov     ax, 4
        int     41h
        pop     ds
        or      ah, ah
        jz      br_f81e8
        pop     cx
        jmp     br_f830f
br_f81e8:
        pop     ax
        cmp     cx, ax
        jz      br_f81f4
        mov     ah, 3
        xor     al, al
        jmp     br_f830f
br_f81f4:
        mov     ax, word ptr [63f0h]
        xor     dx, dx
        cmp     word ptr [63eeh], 0
        jz      br_f8201
        dec     ax
br_f8201:
        mov     bx, 200h
        mul     bx
        add     ax, word ptr [63eeh]
        adc     dx, 0
        mov     bx, word ptr [63f4h]
        mov     cl, 4
        shl     bx, cl
        sub     ax, bx
        sbb     dx, 0
        mov     si, dx
        mov     di, ax
        mov     bx, word ptr [640ch]
        push    ds
        lds     dx, dword ptr [6408h]
loop_f8227:
        mov     cx, 4000h
        or      si, si
        jnz     br_f8234
        cmp     di, cx
        ja      br_f8234
        mov     cx, di
br_f8234:
        push    cx
        mov     ax, 4
        int     41h
        or      ah, ah
        jz      br_f8243
        pop     cx
        pop     ds
        jmp     br_f830f
br_f8243:
        pop     ax
        cmp     ax, cx
        jz      br_f8250
        pop     ds
        mov     ah, 4
        xor     al, al
        jmp     near br_f830f
br_f8250:
        mov     ax, ds
        add     ax, 400h
        mov     ds, ax
        sub     di, cx
        sbb     si, 0
        mov     ax, si
        or      ax, di
        jnz     loop_f8227
        pop     ds
        mov     bx, word ptr [640ch]
        mov     ax, 3
        int     41h
        or      ah, ah
        jz      br_f8273
        jmp     near br_f830f
br_f8273:
        mov     cx, word ptr [63f2h]
        jcxz    br_f82e6
        push    ds
        lds     dx, dword ptr [640eh]
        mov     ax, 2
        int     41h
        pop     ds
        or      ah, ah
        jz      br_f828b
        jmp     near br_f830f
br_f828b:
        mov     word ptr [640ch], ax
        mov     cx, word ptr [6404h]
        mov     dx, 642bh
        mov     ax, 4
        mov     bx, word ptr [640ch]
        int     41h
        or      ah, ah
        jz      br_f82a5
        jmp     br_f830f
        db      090h
br_f82a5:
        mov     cx, word ptr [63f2h]
loop_f82a9:
        push    cx
        mov     bx, word ptr [640ch]
        mov     cx, 4
        mov     dx, 642bh
        mov     ax, 4
        int     41h
        or      ah, ah
        jz      br_f82c1
        pop     cx
        jmp     br_f830f
        db      090h
br_f82c1:
        mov     bx, word ptr [642bh]
        mov     dx, word ptr [642dh]
        mov     ax, word ptr [640ah]
        add     dx, ax
        mov     es, dx
        add     word ptr es:[bx], ax
        pop     cx
        loop    loop_f82a9
        mov     bx, word ptr [640ch]
        mov     ax, 3
        int     41h
        or      ah, ah
        jz      br_f82e6
        jmp     br_f830f
        db      090h
br_f82e6:
        pop     di
        pop     si
        pop     dx
        pop     cx
        pop     bx
        pop     es
        mov     di, word ptr [63fch]
        mov     si, word ptr [63fah]
        mov     ax, si
        or      ax, di
        jz      br_f82fe
        add     si, word ptr [640ah]
br_f82fe:
        mov     ax, word ptr [6402h]
        add     ax, word ptr [640ah]
        mov     es, ax
        mov     bx, word ptr [6400h]
        pop     ds
        xor     ax, ax
        iret
br_f830f:
        pop     di
        pop     si
        pop     dx
        pop     cx
        pop     bx
        pop     es
        pop     ds
        iret
TBL_f8317:
        db      04dh, 058h, 0a0h, 05ah, 0f3h, 05ch, 046h, 05fh
TBL_f831f:
        if      FW_VERSION >= 311
        db      025h, 003h, 03ah, 003h, 04fh, 003h, 000h, 002h, 002h, 001h, 000h, 002h, 070h, 000h, 0a0h, 005h
        else
        db      01fh, 003h, 034h, 003h, 049h, 003h, 000h, 002h, 002h, 001h, 000h, 002h, 070h, 000h, 0a0h, 005h
        endif
        db      0f9h, 003h, 000h, 009h, 000h, 002h, 000h, 000h, 000h, 000h, 000h, 000h, 002h, 002h, 001h, 000h
        db      002h, 070h, 000h, 040h, 006h, 0f9h, 003h, 000h, 00ah, 000h, 002h, 000h, 000h, 000h, 000h, 000h
        db      000h, 002h, 001h, 001h, 000h, 002h, 0e0h, 000h, 040h, 00bh, 0f0h, 009h, 000h, 012h, 000h, 002h
        db      000h, 000h, 000h, 000h, 000h
isr_f8364:
        sti
        cld
        push    ds
        push    es
        push    si
        mov     si, ds
        mov     es, si
        mov     si, 40h
        mov     ds, si
        mov     si, ax
        cmp     si, 10h
        nop
        jc      br_f8381
        mov     ah, 0f7h
        xor     al, al
        jmp     br_f83d2
        db      090h
br_f8381:
        or      si, si
        jz      br_f83c9
        cmp     si, 0bh
        jz      br_f83c9
        cmp     si, 0dh
        jz      br_f83c9
        cmp     si, 0fh
        if      FW_VERSION >= 311
        jz      br_f83c9
        cmp     si, 0
        endif
        jz      br_f83c9
        mov     ah, byte ptr [1ah]
        cmp     ah, byte ptr [1bh]
        mov     byte ptr [1bh], ah
        jnz     br_f83b6
        push    dx
        mov     dl, 0
        mov     ah, 6
        int     40h
        pop     dx
        jnc     br_f83c9
        cmp     ah, 6
        jnz     br_f83bd
br_f83b6:
        mov     ah, 0
        call    fn_f8ee3
        jnc     br_f83c9
br_f83bd:
        mov     al, ah
        mov     ah, 0ffh
        mov     byte ptr [1bh], 0ffh
        jmp     br_f83d2
        db      090h
br_f83c9:
        shl     si, 1
        add     si, TBL_f83d8
        call    word ptr cs:[si]
br_f83d2:
        pop     si
        pop     es
        pop     ds
        retf    2
TBL_f83d8:
        dw      tgt_f83f8
        dw      tgt_f8423
        dw      tgt_f84a2
        dw      tgt_f8505
        dw      tgt_f85a7
        dw      tgt_f87a1
        dw      tgt_f89a5
        dw      tgt_f89c3
        dw      tgt_f89f4
        dw      tgt_f8a10
        dw      tgt_f8ac8
        dw      tgt_f8acd
        dw      tgt_f8cd1
        dw      tgt_f8e1f
        dw      tgt_f8dff
        dw      tgt_f8e0b
tgt_f83f8:
        push    cx
        cmp     byte ptr [17h], 0
        jnz     br_f8410
        mov     dl, byte ptr [18h]
        mov     al, byte ptr [15h]
        mov     ah, 0
        int     40h
        mov     byte ptr [17h], 1
br_f8410:
        mov     byte ptr [16h], 0ffh
        mov     cx, 4
        mov     al, 1
loop_f841a:
        call    fn_f8eab
        inc     al
        loop    loop_f841a
        pop     cx
        ret
tgt_f8423:
        call    fn_f8e8a
        cmp     al, 0ffh
        jz      br_f849d
        call    fn_f8e2f
        call    fn_f904e
        jc      br_f8492
        call    fn_f8e2f
        push    bx
        push    cx
        lea     bx, [si + 0bh]
        mov     byte ptr [bx], 0
        lea     bx, [si + 14h]
        mov     cx, 0ch
loop_f8443:
        mov     byte ptr [bx], 0
        inc     bx
        loop    loop_f8443
        pop     cx
        pop     bx
        call    fn_f9028
        jc      br_f8492
        cmp     ah, 0ffh
        jz      br_f8489
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
        call    fn_f8ec8
        jmp     br_f84a1
        db      090h
br_f8489:
        mov     ah, 0fah
        mov     byte ptr [si + 46h], 0
        jmp     br_f849f
        db      090h
br_f8492:
        mov     al, ah
        mov     ah, 0ffh
        mov     byte ptr [si + 46h], 0
        jmp     br_f84a1
        db      090h
br_f849d:
        mov     ah, 0feh
br_f849f:
        xor     al, al
br_f84a1:
        ret
tgt_f84a2:
        call    fn_f8e8a
        cmp     al, 0ffh
        jz      br_f8500
        call    fn_f8e2f
        call    fn_f8fff
        jc      br_f84f5
        cmp     ah, 0ffh
        jz      br_f84ec
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
        call    fn_f8ec8
        xor     ah, ah
        jmp     br_f8504
        db      090h
br_f84ec:
        mov     ah, 0fdh
        mov     byte ptr [si + 46h], 0
        jmp     br_f8502
        db      090h
br_f84f5:
        mov     al, ah
        mov     ah, 0ffh
        mov     byte ptr [si + 46h], 0
        jmp     br_f8504
        db      090h
br_f8500:
        mov     ah, 0feh
br_f8502:
        xor     al, al
br_f8504:
        ret
tgt_f8505:
        push    bx
        or      bl, bl
        jz      br_f851a
        cmp     bl, 4
        ja      br_f851a
        mov     al, bl
        call    fn_f8eb9
        test    byte ptr [si + 46h], 0ffh
        jnz     br_f851d
br_f851a:
        jmp     near br_f85a1
br_f851d:
        cmp     byte ptr [si + 47h], 1
        jnz     br_f856c
        push    ds
        pop     es
        cmp     word ptr [si + 43h], 0
        jz      br_f853d
        push    word ptr [si + 40h]
        push    word ptr [si + 42h]
        mov     ax, word ptr [si + 43h]
        mov     word ptr [si + 40h], ax
        mov     al, byte ptr [si + 45h]
        mov     byte ptr [si + 42h], al
br_f853d:
        lea     bx, [si + 53h]
        mov     ax, 1
        call    fn_f9221
        mov     al, ah
        lahf
        cmp     word ptr [si + 43h], 0
        jz      br_f8555
        pop     word ptr [si + 42h]
        pop     word ptr [si + 40h]
br_f8555:
        sahf
        mov     ah, al
        jc      br_f8595
        cmp     ah, 0ffh
        jz      br_f8590
        mov     byte ptr [si + 47h], 0ffh
        mov     word ptr [si + 43h], 0
        mov     byte ptr [si + 45h], 0
br_f856c:
        mov     byte ptr [si + 46h], 0
        cmp     byte ptr [si + 48h], 0ffh
        jnz     br_f8588
        mov     byte ptr [si + 48h], 0
        call    fn_f9111
        jc      br_f8595
        or      ah, ah
        jz      br_f8588
        mov     ah, 0fdh
        jmp     br_f85a3
        db      090h
br_f8588:
        mov     byte ptr [16h], 0ffh
        jmp     br_f859c
        db      090h
br_f8590:
        mov     ah, 0f9h
        jmp     br_f85a3
        db      090h
br_f8595:
        mov     al, ah
        mov     ah, 0ffh
        jmp     br_f85a5
        db      090h
br_f859c:
        xor     ah, ah
        jmp     br_f85a3
        db      090h
br_f85a1:
        mov     ah, 0fch
br_f85a3:
        xor     al, al
br_f85a5:
        pop     bx
        ret
tgt_f85a7:
        or      bl, bl
        jz      br_f85bb
        cmp     bl, 4
        ja      br_f85bb
        mov     al, bl
        call    fn_f8eb9
        test    byte ptr [si + 46h], 0ffh
        jnz     br_f85be
br_f85bb:
        jmp     br_f875e
br_f85be:
        cmp     word ptr [si + 1ah], 0
        jnz     br_f85c7
        jmp     br_f874b
br_f85c7:
        cmp     byte ptr [si + 47h], 0ffh
        jnz     br_f85d2
        mov     word ptr [si + 51h], 0
br_f85d2:
        cmp     byte ptr [si + 47h], 1
        jnz     br_f862b
        push    es
        push    bx
        push    ds
        pop     es
        cmp     word ptr [si + 43h], 0
        jz      br_f85f4
        push    word ptr [si + 40h]
        push    word ptr [si + 42h]
        mov     ax, word ptr [si + 43h]
        mov     word ptr [si + 40h], ax
        mov     al, byte ptr [si + 45h]
        mov     byte ptr [si + 42h], al
br_f85f4:
        lea     bx, [si + 53h]
        mov     ax, 1
        call    fn_f9221
        mov     al, ah
        lahf
        cmp     word ptr [si + 43h], 0
        jz      br_f860c
        pop     word ptr [si + 42h]
        pop     word ptr [si + 40h]
br_f860c:
        sahf
        mov     ah, al
        pop     bx
        pop     es
        jnc     br_f8616
        jmp     br_f8752
br_f8616:
        cmp     ah, 0ffh
        jnz     br_f861e
        jmp     br_f8759
br_f861e:
        mov     byte ptr [si + 47h], 0
        mov     word ptr [si + 43h], 0
        mov     byte ptr [si + 45h], 0
br_f862b:
        push    bx
        push    di
        mov     word ptr [si + 4dh], cx
        mov     word ptr [si + 4fh], 0
        mov     di, dx
        mov     ax, word ptr [0]
        cmp     byte ptr [si + 47h], 0ffh
        jz      br_f864c
        sub     ax, word ptr [si + 51h]
        jz      br_f864c
        cmp     ax, cx
        ja      br_f8651
        jmp     br_f864f
        db      090h
br_f864c:
        jmp     near br_f86d0
br_f864f:
        mov     cx, ax
br_f8651:
        call    fn_f8765
        push    si
        lea     ax, [si + 53h]
        add     ax, word ptr [si + 51h]
        add     word ptr [si + 51h], cx
        mov     si, ax
        cld
        rep movsb
        pop     si
        mov     ax, word ptr [0]
        cmp     ax, word ptr [si + 51h]
        jnc     br_f86d0
        mov     byte ptr [si + 47h], 0ffh
        jmp     br_f86d0
        db      090h
loop_f8673:
        mov     byte ptr [si + 47h], 0ffh
        push    dx
        mov     dx, word ptr [si + 1eh]
        mov     ax, word ptr [si + 1ch]
        sub     ax, word ptr [si + 49h]
        sbb     dx, word ptr [si + 4bh]
        or      dx, dx
        pop     dx
        jnz     br_f8694
        cmp     ax, word ptr [0]
        jc      br_f86dd
        cmp     ax, word ptr [si + 4dh]
        jc      br_f8697
br_f8694:
        mov     ax, word ptr [si + 4dh]
br_f8697:
        push    dx
        xor     dx, dx
        div     word ptr [0]
        mov     bx, di
        call    fn_f9134
        pushf
        push    ax
        xor     ah, ah
        mul     word ptr [0]
        mov     cx, ax
        call    fn_f8765
        add     di, cx
        pop     ax
        popf
        pop     dx
        jc      br_f8732
        cmp     ah, 0ffh
        jnz     br_f86d0
        mov     ax, word ptr [si + 1eh]
        cmp     ax, word ptr [si + 4bh]
        jnz     br_f86cc
        mov     ax, word ptr [si + 1ch]
        cmp     ax, word ptr [si + 49h]
        jz      br_f872d
br_f86cc:
        mov     ah, 0f6h
        jz      br_f873e
br_f86d0:
        mov     ax, word ptr [si + 4dh]
        or      ax, ax
        jz      br_f872d
        cmp     ax, word ptr [0]
        jnc     loop_f8673
br_f86dd:
        mov     ax, word ptr [si + 1eh]
        cmp     ax, word ptr [si + 4bh]
        jnz     br_f86f4
        mov     ax, word ptr [si + 1ch]
        cmp     ax, word ptr [si + 49h]
        jnz     br_f86f4
        mov     byte ptr [si + 47h], 0ffh
        jmp     br_f872d
        db      090h
br_f86f4:
        push    es
        mov     ax, word ptr [si + 40h]
        mov     word ptr [si + 43h], ax
        mov     al, byte ptr [si + 42h]
        mov     byte ptr [si + 45h], al
        mov     ax, ds
        mov     es, ax
        lea     bx, [si + 53h]
        mov     ax, 1
        call    fn_f9134
        pop     es
        jc      br_f8732
        cmp     ah, 0ffh
        mov     ah, 0f6h
        jz      br_f873e
        mov     cx, word ptr [si + 4dh]
        call    fn_f8765
        mov     word ptr [si + 51h], cx
        push    si
        lea     si, [si + 53h]
        cld
        rep movsb
        pop     si
        mov     byte ptr [si + 47h], 0
br_f872d:
        xor     ah, ah
        jmp     br_f873e
        db      090h
br_f8732:
        mov     al, ah
        mov     ah, 0ffh
        push    ax
        mov     ax, word ptr [0]
        mov     word ptr [si + 51h], ax
        pop     ax
br_f873e:
        mov     cx, word ptr [si + 4fh]
        pop     di
        pop     bx
        cmp     ah, 0ffh
        jz      br_f8764
        jmp     br_f8762
        db      090h
br_f874b:
        xor     cx, cx
        mov     ax, cx
        jmp     br_f8764
        db      090h
br_f8752:
        mov     al, ah
        mov     ah, 0ffh
        jmp     br_f8764
        db      090h
br_f8759:
        mov     ah, 0f9h
        jmp     br_f8762
        db      090h
br_f875e:
        mov     ah, 0fch
        xor     cx, cx
br_f8762:
        xor     al, al
br_f8764:
        ret
fn_f8765:
        push    ax
        push    dx
        add     word ptr [si + 49h], cx
        adc     word ptr [si + 4bh], 0
        mov     ax, word ptr [si + 1ch]
        mov     dx, word ptr [si + 1eh]
        sub     ax, word ptr [si + 49h]
        sbb     dx, word ptr [si + 4bh]
        jc      br_f8786
        sub     word ptr [si + 4dh], cx
        or      ax, dx
        jnz     br_f879b
        jmp     br_f8796
        db      090h
br_f8786:
        neg     ax
        sub     cx, ax
        mov     ax, word ptr [si + 1ch]
        mov     word ptr [si + 49h], ax
        mov     ax, word ptr [si + 1eh]
        mov     word ptr [si + 4bh], ax
br_f8796:
        mov     word ptr [si + 4dh], 0
br_f879b:
        add     word ptr [si + 4fh], cx
        pop     dx
        pop     ax
        ret
tgt_f87a1:
        or      bl, bl
        jz      br_f87b5
        cmp     bl, 4
        ja      br_f87b5
        mov     al, bl
        call    fn_f8eb9
        test    byte ptr [si + 46h], 0ffh
        jnz     br_f87b8
br_f87b5:
        jmp     br_f897f
br_f87b8:
        cmp     word ptr [si + 1ah], 0
        jnz     br_f87e4
        push    bx
        call    fn_f95a6
        or      ah, ah
        jz      br_f87ca
        pop     bx
        jmp     br_f8978
br_f87ca:
        mov     word ptr [si + 1ah], bx
        mov     word ptr [si + 40h], bx
        pop     bx
        mov     byte ptr [si + 42h], 0
        mov     word ptr [si + 51h], 0
        mov     word ptr [si + 1ch], 0
        mov     word ptr [si + 1eh], 0
br_f87e4:
        push    bx
        push    dx
        mov     word ptr [si + 4dh], cx
        mov     word ptr [si + 4fh], 0
        cmp     byte ptr [si + 47h], 0ffh
        jz      br_f87fa
        cmp     word ptr [si + 51h], 0
        jnz     br_f87fd
br_f87fa:
        jmp     br_f88e7
br_f87fd:
        mov     ax, word ptr [0]
        sub     ax, word ptr [si + 51h]
        cmp     ax, cx
        ja      br_f8809
        mov     cx, ax
br_f8809:
        sub     word ptr [si + 4dh], cx
        add     word ptr [si + 4fh], cx
        add     word ptr [si + 49h], cx
        adc     word ptr [si + 4bh], 0
        lea     ax, [si + 53h]
        add     ax, word ptr [si + 51h]
        add     word ptr [si + 51h], cx
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
        mov     byte ptr [si + 47h], 1
        call    fn_f8986
        mov     ax, word ptr [si + 51h]
        cmp     ax, word ptr [0]
        jnc     br_f884b
        jmp     near br_f88e7
br_f884b:
        push    es
        push    ds
        pop     es
        cmp     word ptr [si + 43h], 0
        jz      br_f8866
        push    word ptr [si + 40h]
        push    word ptr [si + 42h]
        mov     ax, word ptr [si + 43h]
        mov     word ptr [si + 40h], ax
        mov     al, byte ptr [si + 45h]
        mov     byte ptr [si + 42h], al
br_f8866:
        lea     bx, [si + 53h]
        mov     ax, 1
        call    fn_f9221
        mov     al, ah
        lahf
        cmp     word ptr [si + 43h], 0
        jz      br_f887e
        pop     word ptr [si + 42h]
        pop     word ptr [si + 40h]
br_f887e:
        sahf
        mov     ah, al
        pop     es
        jnc     br_f8887
        jmp     br_f895e
br_f8887:
        cmp     ah, 0ffh
        mov     ah, 0
        jnz     br_f8891
        jmp     br_f896b
br_f8891:
        mov     byte ptr [si + 47h], 0ffh
        mov     word ptr [si + 51h], 0
        mov     word ptr [si + 43h], 0
        mov     byte ptr [si + 45h], 0
        jmp     br_f88e7
        db      090h
loop_f88a6:
        push    dx
        mov     ax, word ptr [si + 4dh]
        xor     dx, dx
        div     word ptr [0]
        pop     dx
        mov     bx, dx
        call    fn_f9221
        pushf
        push    ax
        push    dx
        xor     ah, ah
        mul     word ptr [0]
        add     word ptr [si + 4fh], ax
        sub     word ptr [si + 4dh], ax
        add     word ptr [si + 49h], ax
        adc     word ptr [si + 4bh], 0
        pop     dx
        add     dx, ax
        pop     ax
        popf
        jnc     br_f88d6
        jmp     near br_f895e
br_f88d6:
        cmp     ah, 0ffh
        mov     ah, 0
        jnz     br_f88e0
        jmp     near br_f896b
br_f88e0:
        mov     byte ptr [si + 47h], 0ffh
        call    fn_f8986
br_f88e7:
        mov     ax, word ptr [si + 4dh]
        or      ax, ax
        jz      br_f8959
        cmp     ax, word ptr [0]
        jnc     loop_f88a6
        mov     ax, word ptr [si + 49h]
        cmp     ax, word ptr [si + 1ch]
        jnz     br_f8904
        mov     ax, word ptr [si + 4bh]
        cmp     ax, word ptr [si + 1eh]
        jz      br_f8924
br_f8904:
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
        call    fn_f9134
        pop     bx
        pop     es
        jnc     br_f8924
        jmp     br_f895e
        db      090h
br_f8924:
        xor     cx, cx
        xchg    word ptr [si + 4dh], cx
        mov     word ptr [si + 51h], cx
        add     word ptr [si + 4fh], cx
        add     word ptr [si + 49h], cx
        adc     word ptr [si + 4bh], 0
        lea     ax, [si + 53h]
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
        mov     byte ptr [si + 47h], 1
        call    fn_f8986
br_f8959:
        xor     ah, ah
        jmp     br_f896b
        db      090h
br_f895e:
        mov     al, ah
        mov     word ptr [si + 51h], 0
        mov     byte ptr [si + 47h], 0ffh
        mov     ah, 0ffh
br_f896b:
        mov     cx, word ptr [si + 4fh]
        pop     dx
        pop     bx
        cmp     ah, 0ffh
        jz      br_f8985
        jmp     br_f8983
        db      090h
br_f8978:
        xor     cx, cx
        mov     ax, cx
        jmp     br_f8985
        db      090h
br_f897f:
        mov     ah, 0fch
        xor     cx, cx
br_f8983:
        xor     al, al
br_f8985:
        ret
fn_f8986:
        push    ax
        push    dx
        mov     ax, word ptr [si + 49h]
        mov     dx, word ptr [si + 4bh]
        cmp     dx, word ptr [si + 1eh]
        jnz     br_f8996
        cmp     ax, word ptr [si + 1ch]
br_f8996:
        jbe     br_f89a2
        mov     word ptr [si + 1ch], ax
        mov     word ptr [si + 1eh], dx
        mov     byte ptr [si + 48h], 0ffh
br_f89a2:
        pop     dx
        pop     ax
        ret
tgt_f89a5:
        mov     si, 6199h
        call    fn_f8e2f
        call    fn_f904e
        jc      br_f89b9
        or      ah, ah
        jz      br_f89c0
        mov     ah, 0fdh
        jmp     br_f89c0
        db      090h
br_f89b9:
        mov     al, ah
        mov     ah, 0ffh
        jmp     br_f89c2
        db      090h
br_f89c0:
        xor     al, al
br_f89c2:
        ret
tgt_f89c3:
        mov     si, 6199h
        push    si
        call    fn_f8e2f
        push    dx
        mov     dx, bx
        add     si, 20h
        call    fn_f8e2f
        pop     dx
        pop     si
        call    fn_f90a9
        jc      br_f89ea
        or      ah, ah
        jz      br_f89f1
        cmp     ah, 0feh
        mov     ah, 0f8h
        jz      br_f89f1
        mov     ah, 0fdh
        jmp     br_f89f1
        db      090h
br_f89ea:
        mov     al, ah
        mov     ah, 0ffh
        jmp     br_f89f3
        db      090h
br_f89f1:
        xor     al, al
br_f89f3:
        ret
tgt_f89f4:
        mov     ax, word ptr [0]
        mov     bl, byte ptr [2]
        xor     bh, bh
        mul     bx
        mov     bx, ax
        push    bx
        call    fn_f9583
        mov     dx, bx
        call    fn_f955f
        mov     cx, bx
        pop     bx
        xor     ax, ax
        ret
tgt_f8a10:
        mov     ah, 0
br_f8a12:
        push    bx
        mov     si, 6199h
        call    fn_f8e2f
        or      ah, ah
        jnz     br_f8a25
        mov     al, 0
        call    fn_f9325
        jmp     br_f8a28
        db      090h
br_f8a25:
        call    fn_f93aa
br_f8a28:
        jnc     br_f8a2d
        jmp     near br_f8ac2
br_f8a2d:
        cmp     ah, 0ffh
        jnz     br_f8a35
        jmp     near br_f8abb
br_f8a35:
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
        call    fn_f955f
        mov     cx, bx
        mov     dx, word ptr [si + 1ah]
        mov     ax, 1
loop_f8a61:
        call    fn_f95cf
        cmp     bx, 1
        jbe     br_f8a78
        mov     dx, bx
        and     bx, 0ff8h
        cmp     bx, 0ff8h
        jz      br_f8a78
        inc     ax
        loop    loop_f8a61
br_f8a78:
        pop     bx
        mov     word ptr es:[bx], ax
        add     bx, 2
        mov     cx, 8
        lea     di, [si]
loop_f8a84:
        mov     al, byte ptr [di]
        mov     byte ptr es:[bx], al
        inc     bx
        inc     di
        loop    loop_f8a84
        push    di
        lea     di, [si + 0ch]
        cmp     byte ptr [di], 0
        jz      br_f8aa2
        mov     cx, 8
loop_f8a99:
        mov     al, byte ptr [di]
        mov     byte ptr es:[bx], al
        inc     bx
        inc     di
        loop    loop_f8a99
br_f8aa2:
        pop     di
        mov     cx, 3
loop_f8aa6:
        mov     al, byte ptr [di]
        mov     byte ptr es:[bx], al
        inc     bx
        inc     di
        loop    loop_f8aa6
        mov     byte ptr es:[bx], 0
        pop     di
        pop     dx
        pop     cx
        xor     ax, ax
        jmp     br_f8ac6
        db      090h
br_f8abb:
        mov     ah, 0fdh
        xor     al, al
        jmp     br_f8ac6
        db      090h
br_f8ac2:
        mov     al, ah
        mov     ah, 0ffh
br_f8ac6:
        pop     bx
        ret
tgt_f8ac8:
        mov     ah, 0ffh
        jmp     near br_f8a12
tgt_f8acd:
        push    bx
        push    cx
        push    dx
        push    si
        push    di
        push    es
        cmp     bx, 3
        jc      br_f8ae8
        mov     dl, 0
        mov     ah, 6
        int     40h
        cmp     al, 0
        mov     bx, 1
        jz      br_f8ae8
        mov     bx, 2
br_f8ae8:
        mov     byte ptr [15h], bl
        mov     byte ptr [19h], 0
        mov     byte ptr [1bh], 0ffh
        mov     byte ptr [16h], 0ffh
        mov     word ptr [22h], 0ffffh
        mov     word ptr [20h], 0fffeh
        add     bx, bx
        mov     bx, word ptr cs:[bx + TBL_f831f]
        mov     cx, 15h
        mov     si, 0
loop_f8b14:
        mov     al, byte ptr cs:[bx]
        mov     byte ptr [si], al
        inc     bx
        inc     si
        loop    loop_f8b14
        mov     dl, 0
        mov     ah, 0
        int     40h
        mov     dl, 0
        mov     byte ptr [18h], dl
        mov     al, byte ptr [15h]
        mov     ah, 7
        int     40h
        jc      loop_f8b74
        mov     ax, word ptr [0bh]
        mul     word ptr [0]
        mov     cx, ax
        push    ds
        pop     es
        mov     di, 424dh
        mov     al, 0
        cld
        rep stosb
        mov     al, byte ptr [0ah]
        mov     byte ptr [B_424D], al
        mov     word ptr [W_424E], 0ffffh
        mov     si, 0
        mov     word ptr [1eh], 1
br_f8b5a:
        mov     bx, si
        call    fn_f9654
        push    ds
        pop     es
        mov     bx, 2ch
        mov     dl, byte ptr [18h]
        mov     ah, 5
        mov     al, 1
        call    fn_f8c57
        call    fn_f967a
        jnc     br_f8b77
loop_f8b74:
        jmp     br_f8c4c
br_f8b77:
        mov     ax, word ptr [0dh]
        mov     ah, 4
        call    fn_f967a
        jnc     br_f8b9d
        mov     bx, 2
        call    fn_f9626
        cmp     si, bx
        jc      loop_f8b74
        cmp     ah, 2
        jz      br_f8b9a
        cmp     ah, 4
        jz      br_f8b9a
        cmp     ah, 10h
        jnz     loop_f8b74
br_f8b9a:
        call    fn_f8caa
br_f8b9d:
        add     si, word ptr [0dh]
        cmp     si, word ptr [8]
        jnc     br_f8ba9
        jmp     br_f8b5a
br_f8ba9:
        mov     cx, word ptr [0]
        push    ds
        pop     es
        mov     di, 2ch
        mov     al, 0
        cld
        rep stosb
        mov     di, 2ch
        mov     al, 0ebh
        stosb
        mov     al, 34h
        stosb
        mov     al, 90h
        stosb
        mov     si, 0
        mov     di, 37h
        mov     cx, 15h
        cld
        rep movsb
        if      FW_VERSION >= 311
        mov     di, 22ah
        mov     al, 55h
        stosb
        mov     al, 0aah
        stosb
        endif
        mov     ah, 3
        mov     al, 1
        mov     ch, 0
        mov     cl, 1
        push    ds
        pop     es
        mov     bx, 2ch
        mov     dh, 0
        mov     dl, byte ptr [18h]
        call    fn_f967a
        jnc     br_f8bf3
        jmp     br_f8c4c
        db      090h
br_f8bf3:
        call    fn_f8fb4
        call    fn_f950a
        jnc     br_f8bfe
        jmp     br_f8c4c
        db      090h
br_f8bfe:
        mov     cx, word ptr [24h]
        push    cx
        mov     ax, word ptr [0]
        xor     dx, dx
        mov     cx, 20h
        div     cx
        mov     cx, ax
        push    ds
        pop     es
        mov     di, 2ch
loop_f8c14:
        push    cx
        mov     al, 0
        cld
        stosb
        mov     cx, 1fh
        if      FW_VERSION >= 311
        mov     al, 0
        else
        mov     al, 0f6h
        endif
        rep stosb
        pop     cx
        loop    loop_f8c14
        pop     cx
        mov     si, word ptr [26h]
loop_f8c28:
        push    cx
        mov     bx, si
        call    fn_f9654
        push    ds
        pop     es
        mov     bx, 2ch
        mov     dl, byte ptr [18h]
        mov     ah, 3
        mov     al, 1
        call    fn_f967a
        pop     cx
        jnc     br_f8c44
        jmp     br_f8c4c
        db      090h
br_f8c44:
        inc     si
        loop    loop_f8c28
        xor     ax, ax
        jmp     br_f8c50
        db      090h
br_f8c4c:
        mov     al, ah
        mov     ah, 0ffh
br_f8c50:
        pop     es
        pop     di
        pop     si
        pop     dx
        pop     cx
        pop     bx
        ret
fn_f8c57:
        push    ax
        push    bx
        push    cx
        push    dx
        mov     al, 1
        mov     dl, ch
        mov     cx, word ptr [1eh]
        if      FW_VERSION < 311
        cmp     dl, 0
        jnz     loop_f8c63
        mov     cx, 2
        endif
loop_f8c63:
        mov     byte ptr es:[bx], dl
        inc     bx
        mov     byte ptr es:[bx], dh
        inc     bx
        mov     byte ptr es:[bx], cl
        inc     bx
        inc     cx
        if      FW_VERSION < 311
        cmp     dl, 0
        jnz     L_f8c6a
        inc     cx
L_f8c6a:
        endif
        cmp     cx, word ptr [0dh]
        jbe     br_f8c79
        mov     cx, 1
br_f8c79:
        push    ax
        mov     ax, word ptr [0]
        shl     ax, 1
        xor     al, al
br_f8c81:
        shr     ah, 1
        jz      br_f8c89
        inc     al
        jmp     br_f8c81
br_f8c89:
        mov     byte ptr es:[bx], al
        inc     bx
        pop     ax
        inc     al
        cmp     al, byte ptr [0dh]
        jbe     loop_f8c63
        mov     ax, word ptr [1eh]
        sub     ax, 3
        jg      br_f8ca2
        add     ax, word ptr [0dh]
br_f8ca2:
        mov     word ptr [1eh], ax
        pop     dx
        pop     cx
        pop     bx
        pop     ax
        ret
fn_f8caa:
        push    ax
        push    bx
        push    cx
        push    dx
        mov     bx, si
        call    fn_f9638
        mov     dx, bx
        mov     bx, si
        add     bx, word ptr [0dh]
        dec     bx
        call    fn_f9638
        mov     cx, bx
        mov     bx, 0ff7h
loop_f8cc4:
        call    fn_f95ec
        inc     dx
        cmp     dx, cx
        jbe     loop_f8cc4
        pop     dx
        pop     cx
        pop     bx
        pop     ax
        ret
tgt_f8cd1:
        push    bx
        or      bl, bl
        jz      br_f8ce6
        cmp     bl, 4
        ja      br_f8ce6
        mov     al, bl
        call    fn_f8eb9
        test    byte ptr [si + 46h], 0ffh
        jnz     br_f8ce9
br_f8ce6:
        jmp     br_f8df9
br_f8ce9:
        cmp     cx, word ptr [si + 1eh]
        jnz     br_f8cf1
        cmp     dx, word ptr [si + 1ch]
br_f8cf1:
        jbe     br_f8cf6
        jmp     br_f8de3
br_f8cf6:
        jnz     br_f8cfb
        jmp     br_f8df4
br_f8cfb:
        cmp     byte ptr [si + 47h], 1
        jnz     br_f8d54
        push    es
        push    bx
        push    ds
        pop     es
        cmp     word ptr [si + 43h], 0
        jz      br_f8d1d
        push    word ptr [si + 40h]
        push    word ptr [si + 42h]
        mov     ax, word ptr [si + 43h]
        mov     word ptr [si + 40h], ax
        mov     al, byte ptr [si + 45h]
        mov     byte ptr [si + 42h], al
br_f8d1d:
        lea     bx, [si + 53h]
        mov     ax, 1
        call    fn_f9221
        mov     al, ah
        lahf
        cmp     word ptr [si + 43h], 0
        jz      br_f8d35
        pop     word ptr [si + 42h]
        pop     word ptr [si + 40h]
br_f8d35:
        sahf
        mov     ah, al
        pop     bx
        pop     es
        jnc     br_f8d3f
        jmp     near br_f8ded
br_f8d3f:
        cmp     ah, 0ffh
        jnz     br_f8d47
        jmp     near br_f8de8
br_f8d47:
        mov     byte ptr [si + 47h], 0ffh
        mov     word ptr [si + 43h], 0
        mov     byte ptr [si + 45h], 0
br_f8d54:
        push    bx
        push    cx
        push    dx
        mov     bx, cx
        mov     cx, dx
        mov     ax, word ptr [0]
        mov     dl, byte ptr [2]
        xor     dh, dh
        mul     dx
        xchg    cx, ax
        mov     dx, bx
        div     cx
        push    dx
        mov     cx, ax
        mov     dx, word ptr [si + 1ah]
br_f8d71:
        cmp     dx, 1
        jbe     br_f8d8a
        mov     ax, dx
        and     ax, 0ff8h
        cmp     ax, 0ff8h
        jz      br_f8d8a
        jcxz    br_f8d91
        call    fn_f95cf
        mov     dx, bx
        dec     cx
        jmp     br_f8d71
br_f8d8a:
        pop     dx
        pop     dx
        pop     cx
        pop     bx
        jmp     br_f8dde
        db      090h
br_f8d91:
        mov     bx, dx
        pop     dx
        mov     ax, dx
        xor     dx, dx
        mov     cx, word ptr [0]
        div     cx
        mov     cx, ax
        mov     byte ptr [si + 47h], 0ffh
        mov     word ptr [si + 40h], bx
        mov     byte ptr [si + 42h], cl
        mov     word ptr [si + 43h], bx
        mov     byte ptr [si + 45h], cl
        or      dx, dx
        jz      br_f8dcf
        push    dx
        lea     bx, [si + 53h]
        push    es
        push    ds
        pop     es
        mov     ax, 1
        call    fn_f9134
        pop     es
        pop     dx
        jnc     br_f8dcb
        pop     dx
        pop     cx
        pop     bx
        jmp     br_f8ded
        db      090h
br_f8dcb:
        mov     byte ptr [si + 47h], 0
br_f8dcf:
        mov     word ptr [si + 51h], dx
        pop     dx
        pop     cx
        pop     bx
        mov     word ptr [si + 49h], dx
        mov     word ptr [si + 4bh], cx
        jmp     br_f8df4
        db      090h
br_f8dde:
        mov     ah, 0f6h
        jmp     br_f8dfb
        db      090h
br_f8de3:
        mov     ah, 0fbh
        jmp     br_f8dfb
        db      090h
br_f8de8:
        mov     ah, 0f9h
        jmp     br_f8dfb
        db      090h
br_f8ded:
        mov     al, ah
        mov     ah, 0ffh
        jmp     br_f8dfd
        db      090h
br_f8df4:
        xor     ah, ah
        jmp     br_f8dfb
        db      090h
br_f8df9:
        mov     ah, 0fch
br_f8dfb:
        xor     al, al
br_f8dfd:
        pop     bx
        ret
tgt_f8dff:
        mov     byte ptr [19h], bl
        or      bx, bx
        jnz     br_f8e0a
        call    fn_f950a
br_f8e0a:
        ret
tgt_f8e0b:
        if      FW_VERSION >= 311
        cmp     bl, 0ffh
        jnz     br_f8e17
        mov     byte ptr [1bh], bl
        jmp     br_f8e1b
        db      090h
br_f8e17:
        endif
        mov     byte ptr [1ah], bl
br_f8e1b:
        xor     ax, ax
        clc
        ret
tgt_f8e1f:
        mov     ah, 6
        int     40h
        jc      br_f8e2b
        mov     ax, 0
        jmp     br_f8e2e
        db      090h
br_f8e2b:
        mov     ax, 1
br_f8e2e:
        ret
fn_f8e2f:
        push    ax
        push    bx
        push    cx
        push    si
        push    di
        mov     bx, dx
        mov     cx, 8
loop_f8e39:
        mov     al, byte ptr es:[bx]
        mov     byte ptr [si], al
        inc     bx
        inc     si
        loop    loop_f8e39
        push    si
        add     si, 4
        cmp     byte ptr es:[bx + 3], 0
        jz      br_f8e6d
        mov     di, bx
        mov     al, 20h
        mov     cx, 8
        cld
        repe scasb
        jnz     br_f8e5e
        mov     bx, di
        jmp     br_f8e6d
        db      090h
br_f8e5e:
        mov     cx, 8
loop_f8e61:
        mov     al, byte ptr es:[bx]
        mov     byte ptr [si], al
        inc     bx
        inc     si
        loop    loop_f8e61
        jmp     br_f8e77
        db      090h
br_f8e6d:
        mov     cx, 8
        xor     al, al
loop_f8e72:
        mov     byte ptr [si], al
        inc     si
        loop    loop_f8e72
br_f8e77:
        pop     si
        mov     cx, 3
loop_f8e7b:
        mov     al, byte ptr es:[bx]
        mov     byte ptr [si], al
        inc     bx
        inc     si
        loop    loop_f8e7b
        pop     di
        pop     si
        pop     cx
        pop     bx
        pop     ax
        ret
fn_f8e8a:
        push    cx
        mov     cx, 4
        mov     ax, 1
loop_f8e91:
        call    fn_f8eb9
        test    byte ptr [si + 46h], 0ffh
        jz      br_f8ea5
        inc     al
        loop    loop_f8e91
        mov     al, 0ffh
        xor     si, si
        jmp     br_f8ea9
        db      090h
br_f8ea5:
        mov     byte ptr [si + 46h], 0ffh
br_f8ea9:
        pop     cx
        ret
fn_f8eab:
        cmp     al, 4
        ja      br_f8eb8
        push    si
        call    fn_f8eb9
        mov     byte ptr [si + 46h], 0
        pop     si
br_f8eb8:
        ret
fn_f8eb9:
        push    ax
        xor     ah, ah
        dec     ax
        shl     ax, 1
        mov     si, ax
        mov     si, word ptr cs:[si + TBL_f8317]
        pop     ax
        ret
fn_f8ec8:
        push    bx
        push    cx
        mov     al, 1
        if      FW_VERSION >= 311
        mov     bx, 317h
        else
        mov     bx, 311h
        endif
        mov     cx, 4
loop_f8ed2:
        cmp     si, word ptr cs:[bx]
        jz      br_f8ee0
        add     bx, 2
        inc     al
        loop    loop_f8ed2
        mov     al, 0ffh
br_f8ee0:
        pop     cx
        pop     bx
        ret
fn_f8ee3:
        push    es
        push    bx
        push    cx
        push    dx
        push    si
        mov     ch, ah
        cmp     ch, byte ptr [16h]
        jnz     br_f8ef3
        jmp     near br_f8fae
br_f8ef3:
        cmp     byte ptr [16h], 0ffh
        jz      br_f8f07
        mov     byte ptr [16h], 0ffh
        call    fn_f950a
        jnc     br_f8f07
        jmp     br_f8f70
        db      090h
br_f8f07:
        mov     byte ptr [18h], ch
        mov     dl, cl
        mov     ah, 0
        int     40h
        mov     al, byte ptr [15h]
        call    fn_f8fe3
        jnc     br_f8f38
        cmp     ah, 80h
        jz      br_f8f70
        mov     byte ptr [15h], 3
br_f8f23:
        dec     byte ptr [15h]
        mov     al, byte ptr [15h]
        call    fn_f8fe3
        jnc     br_f8f38
        cmp     byte ptr [15h], 0
        jz      br_f8f70
        jmp     br_f8f23
br_f8f38:
        mov     bx, 0
        mov     cx, 15h
        mov     si, 37h
loop_f8f41:
        mov     al, byte ptr [si]
        mov     byte ptr [bx], al
        inc     si
        inc     bx
        loop    loop_f8f41
        if      FW_VERSION >= 311
        cmp     word ptr [0fh], 20h
        else
        cmp     word ptr [0fh], 10h
        endif
        ja      br_f8f6e
        cmp     word ptr [0fh], 0
        jz      br_f8f6e
        mov     ax, word ptr [0dh]
        or      ax, ax
        jz      br_f8f6e
        cmp     ax, 14h
        ja      br_f8f6e
        if      FW_VERSION >= 311
        mov     si, 31fh
        else
        mov     si, 319h
        endif
        mov     cx, 3
        mov     dl, 0
        jmp     loop_f8f74
        db      090h
br_f8f6e:
        mov     ah, 4
br_f8f70:
        stc
        jmp     br_f8fae
        db      090h
loop_f8f74:
        mov     bx, word ptr cs:[si]
        cmp     ax, word ptr cs:[bx + 0dh]
        jz      br_f8f87
        add     si, 2
        inc     dl
        loop    loop_f8f74
        jmp     br_f8f95
        db      090h
br_f8f87:
        cmp     byte ptr [15h], dl
        jz      br_f8f95
        mov     al, dl
        mov     ah, 7
        int     40h
        jc      br_f8fae
br_f8f95:
        mov     byte ptr [15h], dl
        call    fn_f8fb4
        call    fn_f94b4
        jc      br_f8fae
        mov     byte ptr [17h], 1
        mov     ch, byte ptr [18h]
        mov     byte ptr [16h], ch
br_f8fae:
        pop     si
        pop     dx
        pop     cx
        pop     bx
        pop     es
        ret
fn_f8fb4:
        push    ax
        mov     ax, word ptr [6]
        add     ax, 0fh
        shr     ax, 4
        cmp     ax, 20h
        jle     br_f8fc7
        pop     bx
        pop     bx
        jmp     br_f8f6e
br_f8fc7:
        mov     word ptr [24h], ax
        mov     al, byte ptr [5]
        xor     ah, ah
        mul     word ptr [0bh]
        add     ax, word ptr [3]
        mov     word ptr [26h], ax
        add     ax, word ptr [24h]
        mov     word ptr [28h], ax
        pop     ax
        ret
fn_f8fe3:
        mov     dl, byte ptr [18h]
        mov     ah, 7
        int     40h
        jc      br_f8ffe
        mov     ah, 2
        push    ds
        pop     es
        mov     bx, 2ch
        mov     dh, 0
        mov     ch, 0
        mov     cl, 1
        mov     al, 1
        int     40h
br_f8ffe:
        ret
fn_f8fff:
        push    bx
        push    cx
        mov     al, 0
        call    fn_f9325
        jnc     br_f900b
        pop     cx
        pop     bx
        ret
br_f900b:
        cmp     ah, 0ffh
        jnz     br_f9016
        pop     cx
        pop     bx
        mov     ah, 0ffh
        clc
        ret
br_f9016:
        push    si
        mov     cx, 20h
loop_f901a:
        mov     al, byte ptr [bx]
        mov     byte ptr [si], al
        inc     bx
        inc     si
        loop    loop_f901a
        pop     si
        pop     cx
        pop     bx
        xor     ah, ah
        ret
fn_f9028:
        push    bx
        push    si
        mov     al, 0ffh
        call    fn_f9325
        jnc     br_f9034
        pop     si
        pop     bx
        ret
br_f9034:
        cmp     ah, 0ffh
        jnz     br_f903d
        pop     si
        pop     bx
        clc
        ret
br_f903d:
        pop     si
        push    si
        mov     bx, ax
        call    fn_f948b
        jnc     br_f9049
        pop     si
        pop     bx
        ret
br_f9049:
        pop     si
        pop     bx
        xor     ah, ah
        ret
fn_f904e:
        push    bx
        mov     al, 0
        call    fn_f9325
        jnc     br_f9058
        pop     bx
        ret
br_f9058:
        cmp     ah, 0ffh
        jnz     br_f9062
        pop     bx
        mov     ah, 0ffh
        clc
        ret
br_f9062:
        push    cx
        push    si
        push    ax
        mov     cx, 20h
loop_f9068:
        mov     al, byte ptr [bx]
        mov     byte ptr [si], al
        inc     bx
        inc     si
        loop    loop_f9068
        pop     ax
        pop     si
        pop     cx
        mov     byte ptr [si], 0e5h
        call    fn_f948b
        jnc     br_f907d
        pop     bx
        ret
br_f907d:
        push    dx
        mov     dx, word ptr [si + 1ah]
br_f9081:
        or      dx, dx
        jz      br_f90a3
        call    fn_f95cf
        push    bx
        mov     bx, 0
        call    fn_f95ec
        pop     bx
        cmp     bx, 1
        jbe     br_f90a3
        mov     dx, bx
        and     bx, 0ff8h
        cmp     bx, 0ff8h
        jz      br_f90a3
        jmp     br_f9081
br_f90a3:
        pop     dx
        pop     bx
        call    fn_f950a
        ret
fn_f90a9:
        push    bx
        push    si
        add     si, 20h
        mov     al, 0
        call    fn_f9325
        pop     si
        jnc     br_f90b8
        pop     bx
        ret
br_f90b8:
        cmp     ah, 0ffh
        jz      br_f90c2
        pop     bx
        mov     ah, 0feh
        clc
        ret
br_f90c2:
        mov     al, 0
        call    fn_f9325
        jnc     br_f90cb
        pop     bx
        ret
br_f90cb:
        cmp     ah, 0ffh
        jnz     br_f90d5
        pop     bx
        mov     ah, 0ffh
        clc
        ret
br_f90d5:
        push    cx
        push    si
        push    di
        mov     di, si
        mov     cx, 0bh
        push    ax
loop_f90de:
        mov     al, byte ptr [si + 20h]
        mov     byte ptr [si], al
        inc     si
        loop    loop_f90de
        inc     si
        mov     cx, 8
loop_f90ea:
        mov     al, byte ptr [si + 20h]
        mov     byte ptr [si], al
        inc     si
        loop    loop_f90ea
        add     bx, 0bh
        mov     al, byte ptr [bx]
        mov     byte ptr [di + 0bh], al
        add     bx, 9
        mov     cx, 0ch
loop_f9100:
        mov     al, byte ptr [bx]
        mov     byte ptr [si], al
        inc     bx
        inc     si
        loop    loop_f9100
        pop     ax
        pop     di
        pop     si
        pop     cx
        call    fn_f948b
        pop     bx
        ret
fn_f9111:
        push    bx
        push    cx
        mov     al, 0
        call    fn_f9325
        jnc     br_f911d
        pop     cx
        pop     bx
        ret
br_f911d:
        cmp     ah, 0ffh
        jnz     br_f9128
        pop     cx
        pop     bx
        mov     ah, 0ffh
        clc
        ret
br_f9128:
        call    fn_f948b
        pop     cx
        pop     bx
        jnc     br_f9130
        ret
br_f9130:
        call    fn_f950a
        ret
fn_f9134:
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
loop_f9157:
        mov     ah, byte ptr [si + 42h]
        cmp     ah, byte ptr [2]
        jc      br_f9184
        mov     byte ptr [si + 42h], 0
        mov     dx, word ptr [si + 40h]
        call    fn_f95cf
        mov     word ptr [si + 40h], bx
        cmp     bx, 1
        jbe     br_f917c
        and     bx, 0ff8h
        cmp     bx, 0ff8h
        jnz     br_f9184
br_f917c:
        mov     word ptr [bp + 8], 0ffffh
        jmp     br_f91ce
        db      090h
br_f9184:
        mov     bx, word ptr [si + 40h]
        call    fn_f9626
        mov     al, byte ptr [si + 42h]
        mov     ah, 0
        add     bx, ax
        inc     byte ptr [si + 42h]
        mov     di, word ptr [bp + 2]
        or      di, di
        jz      br_f91c1
        mov     ax, word ptr [0dh]
        cmp     di, ax
        jnc     br_f91bb
        push    bx
        push    di
        dec     bx
        dec     di
        add     di, di
        cmp     bx, word ptr [bp+di + 0ah]
        pop     di
        pop     bx
        jnz     br_f91bb
        push    bx
        call    fn_f9654
        pop     bx
        xor     ch, ch
        cmp     cx, 1
        jnz     br_f91c1
br_f91bb:
        mov     word ptr [bp + 8], bx
        jmp     br_f91ce
        db      090h
br_f91c1:
        add     di, di
        mov     word ptr [bp+di + 0ah], bx
        inc     word ptr [bp + 2]
        dec     byte ptr [bp]
        jnz     loop_f9157
br_f91ce:
        mov     ax, word ptr [bp + 2]
        mov     ah, 2
        mov     bx, word ptr [bp + 0ah]
        call    fn_f9654
        les     bx, dword ptr [bp + 4]
        mov     dl, byte ptr [18h]
        call    fn_f967a
        jc      br_f920f
        xor     cx, cx
        xchg    word ptr [bp + 2], cx
        add     byte ptr [bp + 1], cl
        mov     ax, word ptr [0]
        mul     cx
        add     word ptr [bp + 4], ax
        mov     ax, word ptr [bp + 8]
        cmp     ax, 0ffffh
        jz      br_f920c
        or      ax, ax
        jz      br_f920e
        mov     bx, ax
        xor     di, di
        mov     word ptr [bp + 8], 0
        jmp     br_f91c1
br_f920c:
        mov     ah, 0ffh
br_f920e:
        clc
br_f920f:
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
fn_f9221:
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
br_f9244:
        mov     ah, byte ptr [si + 42h]
        cmp     ah, byte ptr [2]
        jc      br_f9285
        mov     byte ptr [si + 42h], 0
        mov     dx, word ptr [si + 40h]
        call    fn_f95cf
        cmp     bx, 1
        jbe     br_f9268
        if      FW_VERSION >= 311
        mov     dx, bx
        and     dx, 0ff8h
        cmp     dx, 0ff8h
        else
        and     bx, 0ff8h
        cmp     bx, 0ff8h
        endif
        jnz     br_f9282
br_f9268:
        call    fn_f95a6
        or      ah, ah
        jz      br_f9277
        mov     word ptr [bp + 8], 0ffffh
        jmp     br_f92d2
        db      090h
br_f9277:
        mov     dx, bx
        xchg    word ptr [si + 40h], dx
        call    fn_f95ec
        jmp     br_f9285
        db      090h
br_f9282:
        mov     word ptr [si + 40h], bx
br_f9285:
        mov     bx, word ptr [si + 40h]
        call    fn_f9626
        mov     al, byte ptr [si + 42h]
        mov     ah, 0
        add     bx, ax
        inc     byte ptr [si + 42h]
        mov     di, word ptr [bp + 2]
        or      di, di
        jz      br_f92c2
        mov     ax, word ptr [0dh]
        cmp     di, ax
        jnc     br_f92bc
        push    bx
        push    di
        dec     bx
        dec     di
        add     di, di
        cmp     bx, word ptr [bp+di + 0ah]
        pop     di
        pop     bx
        jnz     br_f92bc
        push    bx
        call    fn_f9654
        pop     bx
        xor     ch, ch
        cmp     cx, 1
        jnz     br_f92c2
br_f92bc:
        mov     word ptr [bp + 8], bx
        jmp     br_f92d2
        db      090h
br_f92c2:
        add     di, di
        mov     word ptr [bp+di + 0ah], bx
        inc     word ptr [bp + 2]
        dec     byte ptr [bp]
        jz      br_f92d2
        jmp     near br_f9244
br_f92d2:
        mov     ax, word ptr [bp + 2]
        mov     ah, 3
        mov     bx, word ptr [bp + 0ah]
        call    fn_f9654
        les     bx, dword ptr [bp + 4]
        mov     dl, byte ptr [18h]
        call    fn_f967a
        jc      br_f9313
        xor     cx, cx
        xchg    word ptr [bp + 2], cx
        add     byte ptr [bp + 1], cl
        mov     ax, word ptr [0]
        mul     cx
        add     word ptr [bp + 4], ax
        mov     ax, word ptr [bp + 8]
        cmp     ax, 0ffffh
        jz      br_f9310
        or      ax, ax
        jz      br_f9312
        mov     bx, ax
        xor     di, di
        mov     word ptr [bp + 8], 0
        jmp     br_f92c2
br_f9310:
        mov     ah, 0ffh
br_f9312:
        clc
br_f9313:
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
fn_f9325:
        push    cx
        mov     byte ptr [24ch], al
        mov     cx, word ptr [6]
        stc
loop_f932e:
        push    si
        push    cx
        call    fn_f944e
        pop     cx
        pop     si
        jnc     br_f9339
        pop     cx
        ret
br_f9339:
        push    ax
        push    bx
        push    cx
        push    si
        push    di
        if      FW_VERSION >= 311
        mov     di, 1398h
        else
        mov     di, 137eh
        endif
        cmp     byte ptr [24ch], 0
        jz      br_f934b
        if      FW_VERSION >= 311
        mov     di, 1390h
        else
        mov     di, 1376h
        endif
br_f934b:
        cmp     byte ptr [bx], 0
        jz      br_f9355
        cmp     byte ptr [bx], 0e5h
        jnz     br_f9357
br_f9355:
        jmp     di
br_f9357:
        cmp     byte ptr [24ch], 0ffh
        jnz     br_f9366
        pop     di
        pop     si
        pop     cx
        pop     bx
        pop     ax
        jmp     br_f93a2
        db      090h
br_f9366:
        if      FW_VERSION >= 311
        test    byte ptr [bx + 0bh], 1eh
        jnz     br_f9398
        endif
        mov     cx, 0bh
loop_f936f:
        mov     al, byte ptr [si]
        cmp     al, 3fh
        jz      br_f9379
        cmp     al, byte ptr [bx]
        jnz     br_f9398
br_f9379:
        inc     si
        inc     bx
        loop    loop_f936f
        inc     si
        inc     bx
        mov     cx, 8
loop_f9382:
        mov     al, byte ptr [si]
        cmp     al, 3fh
        jz      br_f938c
        cmp     al, byte ptr [bx]
        jnz     br_f9398
br_f938c:
        inc     si
        inc     bx
        loop    loop_f9382
tgt_f9390:
        pop     di
        pop     si
        pop     cx
        pop     bx
        pop     ax
        pop     cx
        clc
        ret
br_f9398:
        pop     di
        pop     si
        pop     cx
        pop     bx
        pop     ax
        cmp     byte ptr [bx], 0
        jz      loop_f93a5
br_f93a2:
        clc
        loop    loop_f932e
loop_f93a5:
        pop     cx
        mov     ah, 0ffh
        clc
        ret
fn_f93aa:
        push    cx
        mov     cx, word ptr [6]
        dec     cx
        mov     ax, word ptr [1ch]
        cmp     ax, cx
        jz      loop_f93a5
        sub     cx, ax
        clc
        jmp     near loop_f932e
fn_f93bd:
        cmp     byte ptr [19h], 0
        jz      br_f93c8
        clc
        xor     ax, ax
        ret
br_f93c8:
        mov     ah, 3
        jmp     br_f93da
        db      090h
fn_f93cd:
        mov     ah, 2
        cmp     byte ptr [19h], 0
        jz      br_f93da
        clc
        xor     ax, ax
        ret
br_f93da:
        mov     al, 1
        push    bx
        push    cx
        push    dx
        push    si
        push    di
        push    es
        push    ax
        mov     bx, word ptr [26h]
        dec     bx
        mov     word ptr [20h], bx
        mov     dl, byte ptr [18h]
        push    ds
        pop     es
        mov     bx, 24dh
        mov     di, word ptr [24h]
loop_f93f9:
        push    bx
        mov     bx, word ptr [20h]
        inc     bx
        mov     word ptr [20h], bx
        call    fn_f9654
        pop     bx
        pop     ax
        push    ax
        call    fn_f967a
        jc      br_f9415
        add     bx, 200h
        dec     di
        jnz     loop_f93f9
br_f9415:
        pop     es
        pop     es
        pop     di
        pop     si
        pop     dx
        pop     cx
        pop     bx
        ret
fn_f941d:
        pushf
        push    ax
        mov     dx, word ptr [24h]
        shl     dx, 4
        mov     bx, 24dh
loop_f9429:
        mov     di, 0ch
        if      FW_VERSION >= 311
        mov     cx, 0ah
        else
        mov     cx, 8
        endif
loop_f942f:
        if      FW_VERSION < 311
        cmp     byte ptr [bx+di], 0
        jz      L_f9424
        endif
        cmp     byte ptr [bx+di], 20h
        if      FW_VERSION >= 311
        jc      loop_f943f
        else
        jc      L_f942a
        endif
        cmp     byte ptr [bx+di], 7fh
        if      FW_VERSION >= 311
        jnc     loop_f943f
        else
        jnc     L_f942a
L_f9424:
        endif
        inc     di
        loop    loop_f942f
        jmp     br_f9445
        db      090h
        if      FW_VERSION < 311
L_f942a:
        mov     di, 0ch
        mov     cx, 0ah
        endif
loop_f943f:
        mov     byte ptr [bx+di], 0
        inc     di
        loop    loop_f943f
br_f9445:
        add     bx, 20h
        dec     dx
        jnz     loop_f9429
        pop     ax
        popf
        ret
fn_f944e:
        push    cx
        jnc     br_f9457
        mov     ax, 0ffffh
        mov     word ptr [1ch], ax
br_f9457:
        inc     word ptr [1ch]
        mov     ax, word ptr [1ch]
        mov     bx, ax
        mov     cl, 5
        shl     bx, cl
        add     bx, 24dh
        clc
        pop     cx
        ret
fn_f946b:
        push    cx
        push    di
        push    es
        push    si
        mov     si, ax
        mov     cl, 5
        shl     si, cl
        add     si, 24dh
        push    ds
        pop     es
        mov     cx, 20h
        pop     di
        push    di
        cld
        rep movsb
        xor     ah, ah
        clc
        pop     si
        pop     es
        pop     di
        pop     cx
        ret
fn_f948b:
        push    cx
        push    di
        push    es
        push    si
        mov     di, ax
        mov     cl, 5
        shl     di, cl
        add     di, 24dh
        push    ds
        pop     es
        mov     cx, 20h
        cld
        rep movsb
        call    fn_f93bd
        if      FW_VERSION >= 311
        jnc     br_f94ad
        dec     byte ptr [1ah]
        jmp     br_f94af
        db      090h
br_f94ad:
        else
        jc      br_f94af
        endif
        xor     ah, ah
br_f94af:
        pop     si
        pop     es
        pop     di
        pop     cx
        ret
fn_f94b4:
        cmp     byte ptr [19h], 0
        jz      br_f94bf
        clc
        xor     ax, ax
        ret
br_f94bf:
        push    bx
        push    cx
        push    dx
        push    si
        push    di
        push    es
        mov     word ptr [22h], 0ffffh
        mov     word ptr [20h], 0fffeh
        mov     bx, word ptr [3]
        mov     si, 424dh
        mov     cx, word ptr [0bh]
loop_f94dc:
        push    bx
        push    cx
        push    si
        call    fn_f9654
        mov     dl, byte ptr [18h]
        push    ds
        pop     es
        mov     bx, si
        mov     ah, 2
        mov     al, 1
        call    fn_f967a
        pop     si
        pop     cx
        pop     bx
        jc      br_f9503
        add     si, word ptr [0]
        inc     bx
        loop    loop_f94dc
        call    fn_f93cd
        call    fn_f941d
br_f9503:
        pop     es
        pop     di
        pop     si
        pop     dx
        pop     cx
        pop     bx
        ret
fn_f950a:
        cmp     byte ptr [19h], 0
        jz      br_f9515
        clc
        xor     ax, ax
        ret
br_f9515:
        push    bx
        push    cx
        push    dx
        push    si
        push    di
        push    es
        mov     cl, byte ptr [5]
        xor     ch, ch
        mov     bx, word ptr [3]
loop_f9525:
        push    cx
        mov     si, 424dh
        mov     cx, word ptr [0bh]
loop_f952d:
        push    bx
        push    cx
        push    si
        call    fn_f9654
        mov     dl, byte ptr [18h]
        push    ds
        pop     es
        mov     bx, si
        mov     ah, 3
        mov     al, 1
        call    fn_f967a
        pop     si
        pop     cx
        pop     bx
        jc      br_f9557
        inc     bx
        add     si, word ptr [0]
        loop    loop_f952d
        pop     cx
        loop    loop_f9525
        call    fn_f93bd
        jmp     br_f9558
        db      090h
br_f9557:
        pop     cx
br_f9558:
        pop     es
        pop     di
        pop     si
        pop     dx
        pop     cx
        pop     bx
        ret
fn_f955f:
        push    ax
        push    cx
        push    dx
        mov     dx, word ptr [8]
        mov     bx, word ptr [26h]
        mov     ax, word ptr [24h]
        add     ax, bx
        sub     dx, ax
        mov     ax, dx
        xor     dx, dx
        mov     bl, byte ptr [2]
        xor     bh, bh
        div     bx
        mov     bx, ax
        pop     dx
        pop     cx
        pop     ax
        ret
fn_f9583:
        push    cx
        push    dx
        call    fn_f955f
        mov     dx, 2
        mov     cx, bx
        mov     bx, 0
        push    bx
loop_f9591:
        push    cx
        push    dx
        call    fn_f95cf
        pop     dx
        pop     cx
        or      bx, bx
        jnz     br_f959f
        pop     bx
        inc     bx
        push    bx
br_f959f:
        inc     dx
        loop    loop_f9591
        pop     bx
        pop     dx
        pop     cx
        ret
fn_f95a6:
        push    cx
        push    dx
        call    fn_f955f
        mov     cx, bx
        mov     dx, 2
loop_f95b0:
        call    fn_f95cf
        or      bx, bx
        jz      br_f95c0
        inc     dx
        loop    loop_f95b0
        pop     dx
        pop     cx
        mov     ah, 0ffh
        clc
        ret
br_f95c0:
        mov     bx, dx
        push    bx
        mov     bx, 0fffh
        call    fn_f95ec
        pop     bx
        pop     dx
        pop     cx
        xor     ah, ah
        ret
fn_f95cf:
        mov     bx, dx
        clc
        rcr     bx, 1
        pushf
        add     bx, dx
        mov     bx, word ptr [bx +B_424D]
        popf
        jc      br_f95e3
        and     bx, 0fffh
        ret
br_f95e3:
        shr     bx, 1
        shr     bx, 1
        shr     bx, 1
        shr     bx, 1
        ret
fn_f95ec:
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
        mov     ax, word ptr [bx +B_424D]
        popf
        pop     dx
        jc      br_f9611
        and     ax, 0f000h
        or      ax, dx
        mov     word ptr [bx +B_424D], ax
        jmp     br_f9622
        db      090h
br_f9611:
        and     ax, 0fh
        rol     dx, 1
        rol     dx, 1
        rol     dx, 1
        rol     dx, 1
        or      ax, dx
        mov     word ptr [bx +B_424D], ax
br_f9622:
        pop     dx
        pop     bx
        pop     ax
        ret
fn_f9626:
        push    ax
        if      FW_VERSION < 311
        push    cx
        endif
        dec     bx
        dec     bx
        mov     al, byte ptr [2]
        xor     ah, ah
        mul     bx
        mov     bx, ax
        if      FW_VERSION >= 311
        add     bx, word ptr [28h]
        else
        push    bx
        mov     ax, word ptr [28h]
        pop     bx
        add     bx, ax
        pop     cx
        endif
        pop     ax
        ret
fn_f9638:
        push    cx
        push    dx
        if      FW_VERSION >= 311
        sub     bx, word ptr [28h]
        else
        push    bx
        mov     ax, word ptr [28h]
        pop     bx
        sub     bx, ax
        endif
        mov     ax, bx
        xor     dx, dx
        mov     bl, byte ptr [2]
        xor     bh, bh
        div     bx
        add     ax, 2
        mov     bx, ax
        mov     ax, dx
        pop     dx
        pop     cx
        ret
fn_f9654:
        push    ax
        push    bx
        push    dx
        mov     dx, word ptr [0dh]
        mov     ax, word ptr [0fh]
        mul     dx
        mov     cx, ax
        mov     ax, bx
        xor     dx, dx
        div     cx
        mov     ch, al
        mov     ax, dx
        div     byte ptr [0dh]
        pop     dx
        mov     dh, al
        mov     cl, ah
        inc     cl
        pop     bx
        pop     ax
        ret
fn_f967a:
        push    bp
        push    si
        mov     si, ax
        mov     bp, 4
loop_f9681:
        mov     ax, si
        int     40h
        jnc     br_f96a7
        if      FW_VERSION >= 311
        cmp     ah, 3
        jz      br_f9691
        endif
        cmp     ah, 80h
        jnz     br_f9694
br_f9691:
        mov     bp, 1
br_f9694:
        cmp     bp, 2
        ja      br_f96a3
        push    ax
        mov     ah, 0
        mov     dl, byte ptr [18h]
        int     40h
        pop     ax
br_f96a3:
        dec     bp
        jnz     loop_f9681
        stc
br_f96a7:
        pop     si
        pop     bp
        ret
isr_f96aa:
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
        mov     ax, 40h
        mov     ds, ax
        mov     es, ax
        cmp     si, 8
        nop
        jnc     br_f96cb
        shl     si, 1
        add     si, TBL_f96d4
        call    word ptr cs:[si]
br_f96cb:
        pop     es
        pop     ds
        pop     bp
        pop     di
        pop     si
        pop     dx
        pop     cx
        pop     bx
        iret
TBL_f96d4:
        dw      tgt_f96e4
        dw      fn_f971d
        dw      tgt_f9734
        dw      tgt_f9744
        dw      tgt_f9752
        dw      tgt_f9808
        dw      tgt_f981b
        dw      tgt_f9839
tgt_f96e4:
        mov     ax, 3ch
        call    fn_f985a
        mov     ax, 175h
        call    fn_f985a
        mov     ax, 227h
        call    fn_f985a
        mov     ax, 33fh
        call    fn_f985a
        mov     ax, 407h
        call    fn_f985a
        mov     ax, 800h
        call    fn_f985a
        mov     ax, 900h
        call    fn_f985a
        cld
        mov     cx, 140h
        push    ds
        pop     es
        mov     di, 662bh
        rep stosb
        call    fn_f971d
        ret
fn_f971d:
        xor     ax, ax
        call    fn_f9843
        mov     cx, 140h
loop_f9725:
        push    cx
        mov     bl, 20h
        call    fn_f97cc
        pop     cx
        loop    loop_f9725
        xor     ax, ax
        call    fn_f9843
        ret
tgt_f9734:
        mov     ax, bx
        and     ax, 3
        shl     ax, 1
        shl     ax, 1
        add     ax, 30h
        call    fn_f985a
        ret
tgt_f9744:
        mov     al, bh
        mov     bh, 28h
        mul     bh
        xor     bh, bh
        add     ax, bx
        call    fn_f9843
        ret
tgt_f9752:
        mov     si, TBL_f976e
br_f9755:
        mov     al, byte ptr cs:[si]
        or      al, al
        jz      br_f976a
        cmp     al, bl
        jz      br_f9765
        add     si, 3
        jmp     br_f9755
br_f9765:
        inc     si
        call    word ptr cs:[si]
        ret
br_f976a:
        call    fn_f97cc
        ret
TBL_f976e:
        db      00dh
        dw      tgt_f977e
        db      00ah
        dw      tgt_f978b
        db      008h
        dw      tgt_f979e
        db      07fh
        dw      tgt_f97aa
        db      00ch
        dw      tgt_f97c8
        db      000h
tgt_f977e:
        mov     ax, word ptr [W_68AB]
        mov     cl, 28h
        div     cl
        mul     cl
        call    fn_f9843
        ret
tgt_f978b:
        mov     ax, word ptr [W_68AB]
        mov     cl, 28h
        div     cl
        cmp     al, 7
        jnc     br_f9798
        inc     al
br_f9798:
        mul     cl
        call    fn_f9843
        ret
tgt_f979e:
        mov     ax, word ptr [W_68AB]
        or      ax, ax
        jz      br_f97a9
        dec     ax
        call    fn_f9843
br_f97a9:
        ret
tgt_f97aa:
        mov     ax, word ptr [W_68AB]
        or      ax, ax
        jz      br_f97c7
        dec     ax
        push    ax
        mov     bx, ax
        mov     byte ptr [bx +TBL_662B], 20h
        call    fn_f9843
        mov     ax, 0c20h
        call    fn_f985a
        pop     ax
        call    fn_f9843
br_f97c7:
        ret
tgt_f97c8:
        call    fn_f971d
        ret
fn_f97cc:
        mov     al, bl
        mov     bx, word ptr [W_68AB]
        cmp     al, byte ptr [bx +TBL_662B]
        jnz     br_f97e0
        mov     byte ptr [B_68AF], 0
        jmp     br_f97f7
        db      090h
br_f97e0:
        mov     byte ptr [bx +TBL_662B], al
        test    byte ptr [B_68AF], 0ffh
        jnz     br_f97f2
        push    ax
        mov     ax, bx
        call    fn_f9843
        pop     ax
br_f97f2:
        mov     ah, 0ch
        call    fn_f985a
br_f97f7:
        mov     ax, word ptr [W_68AB]
        cmp     ax, 13fh
        jz      br_f9804
        inc     ax
        mov     word ptr [W_68AB], ax
        ret
br_f9804:
        call    fn_f9843
        ret
tgt_f9808:
        cld
        mov     si, 662bh
        mov     di, 676bh
        mov     cx, 140h
        rep movsb
        mov     ax, word ptr [W_68AB]
        mov     word ptr [W_68AD], ax
        ret
tgt_f981b:
        xor     ax, ax
        call    fn_f9843
        cld
        mov     si, 676bh
        mov     cx, 140h
loop_f9827:
        lodsb
        mov     bl, al
        push    cx
        push    si
        call    fn_f97cc
        pop     si
        pop     cx
        loop    loop_f9827
        mov     ax, word ptr [W_68AD]
        call    fn_f9843
tgt_f9839:
        mov     ax, word ptr [W_68AB]
        mov     cl, 28h
        div     cl
        xchg    ah, al
        ret
fn_f9843:
        mov     word ptr [W_68AB], ax
        push    ax
        mov     ah, 0ah
        call    fn_f985a
        pop     ax
        mov     al, ah
        mov     ah, 0bh
        call    fn_f985a
        mov     byte ptr [B_68AF], 0ffh
        ret
fn_f985a:
        push    ax
loop_f985b:
        in      al, 0e2h
        and     al, 80h
        jnz     loop_f985b
        mov     al, ah
        out     0e2h, al
        nop
        nop
        nop
        nop
        nop
        nop
        pop     ax
        out     0e0h, al
        nop
        nop
        nop
        nop
        nop
        nop
        ret
fn_f9875:
        pop     si
        push    es
        push    cs
        pop     es
        call    fn_f987f
        pop     es
        push    si
        ret
fn_f987f:
        cld
br_f9880:
        mov     al, byte ptr es:[si]
        inc     si
        cmp     al, 0
        jz      br_f9895
        push    si
        push    cx
        push    es
        mov     cl, al
        call    fn_f98ca
        pop     es
        pop     cx
        pop     si
        jmp     br_f9880
br_f9895:
        ret
fn_f9896:
        mov     cl, 2
        call    fn_f989c
        ret
fn_f989c:
        mov     dl, 4
        sub     dl, cl
        shl     dl, 1
        shl     dl, 1
        push    cx
        mov     cl, dl
        shl     ax, cl
        pop     cx
br_f98aa:
        or      cl, cl
        jz      br_f98c9
        push    cx
        mov     cl, 4
        rol     ax, cl
        push    ax
        and     al, 0fh
        cmp     al, 0ah
        jl      br_f98bc
        add     al, 7
br_f98bc:
        add     al, 30h
        mov     cl, al
        call    fn_f98ca
        pop     ax
        pop     cx
        dec     cl
        jmp     br_f98aa
br_f98c9:
        ret
fn_f98ca:
        push    ax
        push    bx
        mov     bl, cl
        mov     ax, 4
        int     43h
        pop     bx
        pop     ax
        ret
        db      051h, 08bh, 0c8h, 0e8h, 002h, 000h, 059h, 0cfh, 080h, 0f9h, 010h, 073h, 022h
        db      "SRV3"
        if      FW_VERSION >= 311
        db      0dbh, 08ah, 0d9h, 0c0h, 0e3h, 002h, 032h, 0f6h, 02eh, 08ah, 097h, 007h, 019h, 00ah, 0edh, 075h
        db      003h, 083h, 0c3h, 002h, 08dh, 0b7h, 006h, 019h, 0fch, 02eh, 06eh, 05eh, 05ah, 05bh, 0c3h, 000h
        db      000h, 008h, 000h, 001h, 000h, 009h, 000h, 002h, 000h, 00ah, 000h, 003h, 000h, 00bh, 000h, 004h
        db      000h, 00ch, 000h, 005h, 000h, 00dh, 000h, 006h, 000h, 00eh, 000h, 007h, 000h, 00fh, 000h, 000h
        db      020h, 008h, 000h, 001h, 020h, 009h, 000h, 002h, 020h, 00ah, 000h, 003h, 020h, 00bh, 000h, 004h
        db      020h, 00ch, 000h, 005h, 020h, 00dh, 000h, 006h, 020h, 00eh, 000h, 007h, 020h, 00fh, 000h
        else
        db      0dbh, 08ah, 0d9h, 0c0h, 0e3h, 002h, 032h, 0f6h, 02eh, 08ah, 097h, 0f5h, 018h, 00ah, 0edh, 075h
        db      003h, 083h, 0c3h, 002h, 08dh, 0b7h, 0f4h, 018h, 0fch, 02eh, 06eh, 05eh, 05ah, 05bh, 0c3h, 090h
        db      000h, 000h, 008h, 000h, 001h, 000h, 009h, 000h, 002h, 000h, 00ah, 000h, 003h, 000h, 00bh, 000h
        db      004h, 000h, 00ch, 000h, 005h, 000h, 00dh, 000h, 006h, 000h, 00eh, 000h, 007h, 000h, 00fh, 000h
        db      000h, 020h, 008h, 000h, 001h, 020h, 009h, 000h, 002h, 020h, 00ah, 000h, 003h, 020h, 00bh, 000h
        db      004h, 020h, 00ch, 000h, 005h, 020h, 00dh, 000h, 006h, 020h, 00eh, 000h, 007h, 020h, 00fh, 000h
        endif
isr_f9946:
        push    ax
        push    dx
        int     42h
        mov     dx, 0c010h
        mov     al, 60h
        out     dx, al
        pop     dx
        pop     ax
        iret
fn_f9953:
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
        call    fn_f99b3
fn_f99b3:
        mov     dx, 0c011h
        mov     al, 0ffh
        out     dx, al
        mov     ax, 1
        int     43h
        call    fn_f9875
        db      "============= System Error =============Sorry, but a software bug of type ", 0
        pop     ax
        if      FW_VERSION >= 311
        sub     ax, 1956h
        else
        sub     ax, 1944h
        endif
        mov     bl, 3
        div     bl
        call    fn_f9896
        call    fn_f9875
        db      068h, 00dh, 00ah
        db      "caused all memory to be lost."
        db      009h
        db      "Please"
        db      00dh, 00ah
        db      "write down as much as you can remember"
        db      00dh, 00ah
        db      "of what happened that caused this screento appear. Call or send this informationto your Akai distributor.", 0
br_f9ad5:
        jmp     br_f9ad5
        db      000h
fn_f9ad8:
        push    ds
        mov     ax, 0
        mov     ds, ax
        pushf
        cli
        if      FW_VERSION >= 311
        mov     ax, 204bh
        else
        mov     ax, 2039h
        endif
        mov     word ptr [2ch], ax
        mov     word ptr [2eh], cs
        if      FW_VERSION >= 311
        mov     ax, 1b3ah
        else
        mov     ax, 1b28h
        endif
        mov     word ptr [100h], ax
        mov     word ptr [102h], cs
        if      FW_VERSION >= 311
        mov     ax, 2062h
        else
        mov     ax, 2050h
        endif
        mov     word ptr [108h], ax
        mov     word ptr [10ah], cs
        in      al, 0a2h
        and     al, 0feh
        out     0a2h, al
        mov     dx, 0c011h
        in      al, dx
        and     al, 0f7h
        out     dx, al
        popf
        mov     ax, 6ddh
        mov     ds, ax
        if      FW_VERSION >= 311
        mov     ax, 20ach
        else
        mov     ax, 209ah
        endif
        mov     word ptr [2], ax
        sub     ax, ax
        mov     byte ptr [4], al
        mov     byte ptr [5], al
        mov     byte ptr [6], al
        mov     byte ptr [7], al
        mov     byte ptr [9], al
        pop     ds
        retf
TBL_f9b2a:
        dw      tgt_f9b86
        dw      tgt_f9bb5
        dw      tgt_f9bb9
        dw      tgt_f9c9c
        dw      tgt_f9cb1
        dw      tgt_f9cbc
        dw      tgt_f9cef
        dw      tgt_f9d0c
isr_f9b3a:
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
        mov     di, 6ddh
        mov     ds, di
        mov     es, di
        cmp     ah, 7
        jbe     br_f9b5a
        mov     byte ptr [7], 1
        jmp     br_f9b6c
        db      090h
br_f9b5a:
        mov     byte ptr [6], 1
        xchg    al, ah
        cbw
        mov     si, TBL_f9b2a
        add     si, ax
        add     si, ax
        call    word ptr cs:[si]
br_f9b6c:
        mov     ah, byte ptr [7]
        or      ah, ah
        jz      br_f9b75
        stc
br_f9b75:
        mov     byte ptr [6], 0
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
tgt_f9b86:
        sub     al, al
        mov     byte ptr [9], al
        mov     byte ptr [5], al
        mov     byte ptr [7], al
        mov     byte ptr [4], al
        mov     al, 36h
        out     0e8h, al
        mov     word ptr [0], 64h
loop_f9b9e:
        test    word ptr [0], 8000h
        jz      br_f9bae
        mov     ax, 20h
        mov     byte ptr [7], al
        stc
        ret
br_f9bae:
        in      al, 0e8h
        test    al, 10h
        jnz     loop_f9b9e
        ret
tgt_f9bb5:
        mov     al, byte ptr [7]
        ret
tgt_f9bb9:
        call    fn_f9e85
        jnc     br_f9bbf
        ret
br_f9bbf:
        mov     al, 52h
br_f9bc1:
        call    fn_f9e9b
        call    fn_f9d30
        jc      br_f9c12
        mov     al, 66h
br_f9bcb:
        call    fn_f9ddb
        jnc     br_f9bd8
        call    fn_f9ddb
        jnc     br_f9bd8
        jmp     near br_f9c96
br_f9bd8:
        mov     al, byte ptr [bp + 5]
        mov     ah, byte ptr [bp + 3]
        mov     bl, byte ptr [bp + 4]
        mov     di, 3
        call    fn_f9fb3
        jc      br_f9c12
        mov     bx, word ptr [2]
        mov     al, byte ptr cs:[bx + 3]
        mov     ah, byte ptr cs:[bx + 4]
        mov     cl, byte ptr cs:[bx + 5]
        mov     ch, byte ptr cs:[bx + 6]
        mov     bx, cx
br_f9bff:
        mov     cx, 1f4h
        mov     di, 4
        call    fn_f9fb6
        jc      br_f9c12
        call    fn_f9f42
        jnc     br_f9c15
        jmp     near br_f9c96
br_f9c12:
        jmp     near loop_f9c99
br_f9c15:
        call    fn_f9f5a
        jc      loop_f9c99
        mov     al, byte ptr [0ah]
        and     al, 0c0h
        jz      br_f9c67
        cmp     al, 40h
        jnz     br_f9c61
        test    byte ptr [0ah], 10h
        jnz     br_f9c61
        mov     ah, 80h
        test    byte ptr [0ah], 8
        jnz     br_f9c63
        mov     al, byte ptr [0bh]
        mov     ah, 3
        test    al, 2
        jnz     br_f9c63
        mov     ah, 2
        test    al, 1
        jnz     br_f9c63
        mov     ah, 4
        test    al, 4
        jnz     br_f9c63
        mov     ah, 8
        test    al, 10h
        jnz     br_f9c63
        mov     ah, 10h
        test    al, 20h
        jnz     br_f9c63
        mov     ah, 4
        test    al, 80h
        jnz     br_f9c63
        xor     ax, ax
        jmp     br_f9c67
        db      090h
br_f9c61:
        mov     ah, 20h
br_f9c63:
        mov     byte ptr [7], ah
br_f9c67:
        mov     ch, byte ptr [bp + 5]
        mov     cl, byte ptr [bp + 4]
        mov     dl, byte ptr [0dh]
        cmp     dl, ch
        mov     dl, byte ptr [0fh]
        jz      br_f9c83
        mov     bx, word ptr [2]
        mov     dl, byte ptr cs:[bx + 4]
        inc     dl
br_f9c83:
        sub     dl, cl
        mov     al, dl
        test    byte ptr [8], 1
        jnz     br_f9c95
        push    ax
        mov     bl, 1
        call    fn_f9e4f
        pop     ax
br_f9c95:
        ret
br_f9c96:
        call    fn_f9f5a
loop_f9c99:
        mov     al, 0
        ret
tgt_f9c9c:
        call    fn_f9e85
        jnc     br_f9ca2
        ret
br_f9ca2:
        mov     al, 57h
        call    fn_f9e9b
        call    fn_f9d30
        jc      loop_f9c99
        mov     al, 45h
        jmp     br_f9bcb
tgt_f9cb1:
        call    fn_f9e85
        jnc     br_f9cb7
        ret
br_f9cb7:
        mov     al, 56h
        jmp     br_f9bc1
tgt_f9cbc:
        call    fn_f9e85
        jnc     br_f9cc2
        ret
br_f9cc2:
        mov     al, 57h
        call    fn_f9e9b
        call    fn_f9d30
        jc      br_f9cd3
        mov     al, 4dh
        call    fn_f9ddb
        jnc     br_f9cd6
br_f9cd3:
        xor     al, al
        ret
br_f9cd6:
        mov     bx, word ptr [2]
        mov     al, byte ptr cs:[bx + 3]
        mov     ah, byte ptr cs:[bx + 4]
        mov     cl, byte ptr cs:[bx + 7]
        mov     ch, byte ptr cs:[bx + 8]
        mov     bx, cx
        jmp     br_f9bff
tgt_f9cef:
        call    fn_f9e85
        jc      br_f9d0b
        call    fn_f9f2c
        mov     al, byte ptr [8]
        shr     al, 2
        and     al, 1
        test    byte ptr [8], 1
        jnz     br_f9d0b
        mov     byte ptr [7], 6
br_f9d0b:
        ret
tgt_f9d0c:
        mov     byte ptr [4], 0
        mov     byte ptr [7], 1
        mov     bl, byte ptr [bp]
        cmp     bl, 3
        jnc     br_f9d2f
        mov     byte ptr [7], 0
        sub     bh, bh
        shl     bx, 1
        mov     ax, word ptr cs:[bx + TBL_fa098]
        mov     word ptr [2], ax
br_f9d2f:
        ret
fn_f9d30:
        mov     si, word ptr [2]
        mov     di, 3
        mov     al, 3
        mov     ah, byte ptr cs:[si]
        mov     bl, byte ptr cs:[si + 1]
        call    fn_f9fb3
        jc      br_f9d76
        mov     al, byte ptr cs:[si + 0bh]
        call    fn_f9fe6
        mov     al, byte ptr cs:[si + 0ch]
        call    fn_f9fe6
        mov     al, byte ptr cs:[si + 0dh]
        call    fn_f9fe6
        mov     al, 0d3h
        call    fn_f9fe6
        cmp     byte ptr [5], 0
        jnz     br_f9d80
        mov     al, 1eh
        sub     ch, ch
        mov     cl, byte ptr cs:[si + 0ah]
        call    fn_f9fe9
        mov     byte ptr [5], 1
br_f9d76:
        jc      loop_f9db4
loop_f9d78:
        test    word ptr [0], 8000h
        jz      loop_f9d78
br_f9d80:
        mov     al, byte ptr cs:[si + 2]
        mov     byte ptr [5], al
        call    fn_f9f2c
        jc      loop_f9db4
        test    al, 20h
        jnz     br_f9d98
        mov     byte ptr [7], 80h
        jmp     br_f9db3
        db      090h
br_f9d98:
        mov     al, 1
        mov     cl, byte ptr [bp + 2]
        rol     al, cl
        test    byte ptr [4], al
        jnz     loop_f9db4
        or      byte ptr [4], al
        call    fn_f9db5
        jnc     loop_f9db4
        mov     byte ptr [4], 0
br_f9db3:
        stc
loop_f9db4:
        ret
fn_f9db5:
        mov     di, 2
        mov     al, 7
        mov     ah, byte ptr [bp + 2]
        mov     cx, 64h
        call    fn_f9fb6
        jc      br_f9dda
        call    fn_f9f19
        jc      br_f9dda
        test    byte ptr [0ah], 20h
        jnz     loop_f9db4
        mov     byte ptr [7], 40h
        stc
        jmp     br_f9dda
        db      090h
br_f9dda:
        ret
fn_f9ddb:
        push    ax
        mov     al, 1
        mov     cl, byte ptr [bp + 2]
        rol     al, cl
        test    byte ptr [4], al
        jnz     br_f9e15
        or      byte ptr [4], al
        call    fn_f9db5
        jnc     br_f9df6
        stc
        jmp     br_f9e31
        db      090h
br_f9df6:
        mov     dl, 0ah
        call    fn_f9e4f
        jc      br_f9e31
        call    fn_f9db5
        jc      br_f9e31
        mov     bx, word ptr [2]
        mov     cl, byte ptr cs:[bx + 9]
        or      cl, cl
        jz      br_f9e15
        xor     ch, ch
loop_f9e10:
        call    fn_fa042
        loop    loop_f9e10
br_f9e15:
        mov     bl, byte ptr [bp + 5]
        call    fn_f9e4f
        jc      br_f9e31
        mov     bx, word ptr [2]
        mov     cl, byte ptr cs:[bx + 9]
        or      cl, cl
        jz      br_f9e30
        xor     ch, ch
loop_f9e2b:
        call    fn_fa042
        loop    loop_f9e2b
br_f9e30:
        clc
br_f9e31:
        pop     ax
        jc      br_f9e4e
        mov     di, 1
        call    fn_f9fb3
        jc      br_f9e4e
        mov     al, byte ptr [bp + 3]
        shl     al, 1
        shl     al, 1
        and     al, 4
        or      al, byte ptr [bp + 2]
        mov     di, 1
        call    fn_f9fb3
br_f9e4e:
        ret
fn_f9e4f:
        push    dx
        push    cx
        mov     ah, byte ptr [bp + 2]
        mov     al, byte ptr [bp + 3]
        and     al, 1
        shl     al, 1
        shl     al, 1
        or      ah, al
        mov     al, 0fh
        mov     di, 3
        mov     cx, 64h
        call    fn_f9fb6
        jc      br_f9e82
        call    fn_f9f19
        jc      br_f9e82
        mov     al, byte ptr [0ah]
        and     al, 0c0h
        jz      br_f9e81
        mov     byte ptr [7], 40h
        stc
        jmp     br_f9e82
        db      090h
br_f9e81:
        clc
br_f9e82:
        pop     cx
        pop     dx
        ret
fn_f9e85:
        cmp     byte ptr [bp + 2], 3
        ja      br_f9e92
        mov     byte ptr [7], 0
        clc
        ret
br_f9e92:
        xor     al, al
        mov     byte ptr [7], 1
        stc
        ret
fn_f9e9b:
        push    ax
        mov     dx, 0c00fh
        mov     ax, 0fh
        out     dx, al
        mov     dx, 0c001h
        mov     ax, 1
        out     dx, al
        mov     dx, 0c008h
        mov     ax, 14h
        out     dx, ax
        pop     ax
        mov     dx, word ptr [bp + 6]
        mov     cl, 4
        rol     dx, cl
        mov     cl, dl
        and     cx, 0fh
        and     dx, 0fff0h
        add     dx, word ptr [bp + 8]
        adc     cx, 0
        cmp     al, 57h
        jz      br_f9eda
        cmp     al, 56h
        jz      br_f9ed4
        mov     bl, 44h
        jmp     br_f9edc
        db      090h
br_f9ed4:
        mov     bx, 0
        jmp     br_f9edc
        db      090h
br_f9eda:
        mov     bl, 48h
br_f9edc:
        push    bx
        mov     ax, dx
        mov     dx, 0c004h
        out     dx, ax
        mov     dx, 0c006h
        mov     ax, cx
        or      ax, 30h
        out     dx, al
        mov     bx, word ptr [2]
        mov     al, byte ptr [bp]
        mov     cl, byte ptr cs:[bx + 3]
        add     cl, 7
        shl     ax, cl
        mov     dx, 0c002h
        dec     ax
        out     dx, ax
        pop     bx
        mov     ax, bx
        mov     dx, 0c00ah
        out     dx, al
        mov     dx, 0c008h
        mov     ax, 10h
        out     dx, ax
        mov     al, 0dh
        mov     dx, 0c00fh
        out     dx, al
        xor     ax, ax
        clc
        ret
fn_f9f19:
        call    fn_f9f42
        jc      br_f9f2b
        mov     di, 1
        mov     al, 8
        call    fn_f9fb3
        jc      br_f9f2b
        call    fn_f9f5a
br_f9f2b:
        ret
fn_f9f2c:
        mov     di, 2
        mov     al, 4
        mov     ah, byte ptr [bp + 2]
        call    fn_f9fb3
        jc      br_f9f41
        call    fn_f9f5a
        jc      br_f9f41
        mov     al, byte ptr [0ah]
br_f9f41:
        ret
fn_f9f42:
        test    word ptr [0], 8000h
        jz      br_f9f52
        mov     ax, 80h
        mov     byte ptr [7], al
        stc
        ret
br_f9f52:
        shr     byte ptr [9], 1
        jnc     fn_f9f42
        clc
        ret
fn_f9f5a:
        mov     cx, 14h
        mov     word ptr [0], cx
        mov     ax, 6ddh
        cld
        mov     es, ax
        mov     di, 0ah
        mov     bl, 7
        mov     al, 8ch
loop_f9f6e:
        dec     al
        jnz     loop_f9f6e
loop_f9f72:
        test    word ptr [0], 8000h
        jz      br_f9f82
        mov     ax, 20h
        mov     byte ptr [7], al
        stc
        ret
br_f9f82:
        in      ax, 0e8h
        test    al, 80h
        jz      loop_f9f72
        test    al, 40h
        jnz     br_f9f93
        mov     byte ptr [7], 20h
        stc
        ret
br_f9f93:
        mov     byte ptr [8], ah
        in      al, 0eah
        stosb
        mov     al, 8ch
loop_f9f9c:
        dec     al
        jnz     loop_f9f9c
        in      al, 0e8h
        test    al, 10h
        jz      br_f9fb1
        dec     bl
        jnz     loop_f9f72
        mov     byte ptr [7], 20h
        stc
        ret
br_f9fb1:
        clc
        ret
fn_f9fb3:
        mov     cx, 14h
fn_f9fb6:
        mov     word ptr [0], cx
        mov     byte ptr [9], 0
loop_f9fbf:
        test    word ptr [0], 8000h
        jz      br_f9fcf
        mov     ax, 20h
        mov     byte ptr [7], al
        stc
        ret
br_f9fcf:
        push    ax
        in      al, 0e8h
        and     al, 0c0h
        cmp     al, 80h
        pop     ax
        jnz     loop_f9fbf
        out     0eah, al
        mov     al, ah
        mov     ah, bl
        mov     bl, bh
        dec     di
        jnz     loop_f9fbf
        clc
        ret
fn_f9fe6:
        mov     cx, 14h
fn_f9fe9:
        mov     word ptr [0], cx
        mov     cx, 64h
loop_f9ff0:
        loop    loop_f9ff0
        out     0e8h, al
        mov     cx, 64h
loop_f9ff7:
        loop    loop_f9ff7
loop_f9ff9:
        test    word ptr [0], 8000h
        jz      br_fa009
        mov     ax, 20h
        mov     byte ptr [7], al
        stc
        ret
br_fa009:
        in      al, 0e8h
        and     al, 0c0h
        cmp     al, 0c0h
        jnz     loop_f9ff9
        in      al, 0eah
        clc
        ret
fn_fa015:
        push    ax
        push    bx
        push    dx
        mov     dx, 0c033h
        mov     ax, 80h
        mov     dx, 0c032h
        in      al, dx
        mov     bl, al
        in      al, dx
        mov     bh, al
loop_fa027:
        mov     dx, 0c033h
        mov     al, 80h
        out     dx, al
        mov     dx, 0c032h
        in      al, dx
        mov     ah, al
        in      al, dx
        xchg    al, ah
        sub     ax, bx
        neg     ax
        cmp     ax, cx
        jc      loop_fa027
        pop     dx
        pop     bx
        pop     ax
        ret
fn_fa042:
        push    cx
        mov     cx, 2ch
        call    fn_fa015
        pop     cx
        ret
isr_fa04b:
        push    ax
        push    dx
        push    ds
        mov     ax, 6ddh
        mov     ds, ax
        mov     byte ptr [9], 1
        pop     ds
        mov     dx, 0c010h
        mov     al, 63h
        out     dx, al
        pop     dx
        pop     ax
        iret
isr_fa062:
        push    ax
        push    ds
        mov     ax, 6ddh
        mov     ds, ax
        dec     word ptr [0]
        cmp     byte ptr [6], 0
        jnz     br_fa095
        cmp     byte ptr [5], 0
        jz      br_fa095
        in      al, 0e8h
        or      al, al
        jz      br_fa095
        dec     byte ptr [5]
        jnz     br_fa095
        mov     al, 0eh
        out     0e8h, al
loop_fa08b:
        in      al, 0e8h
        and     al, 0c0h
        cmp     al, 0c0h
        jnz     loop_fa08b
        in      al, 0eah
br_fa095:
        pop     ds
        pop     ax
        iret
TBL_fa098:
        if      FW_VERSION >= 311
        db      09eh, 020h, 0ach, 020h, 0bah, 020h, 0efh, 002h, 0f0h, 002h, 009h, 01bh, 0ffh, 02ah, 0f6h, 00fh
        else
        db      08ch, 020h, 09ah, 020h, 0a8h, 020h, 0efh, 002h, 0f0h, 002h, 009h, 01bh, 0ffh, 02ah, 0f6h, 00fh
        endif
        db      03ch, 088h, 01bh, 04fh, 0efh, 002h, 0f0h, 002h, 00ah, 00eh, 0ffh, 01dh, 0f6h, 00fh, 03ch, 088h
        db      01bh, 04fh, 0cfh, 002h, 0f0h, 002h, 012h, 01bh, 0ffh, 06ch, 0f6h, 00fh, 03ch, 098h, 05bh, 04fh
far_fa0c8:
        push    si
        xchg    si, ax
        xchg    dx, ax
        test    ax, ax
        jz      br_fa0d1
        mul     bx
br_fa0d1:
        jcxz    br_fa0d8
        xchg    cx, ax
        mul     si
        add     ax, cx
br_fa0d8:
        xchg    si, ax
        mul     bx
        add     dx, si
        pop     si
        retf
far_fa0df:
        push    bp
        mov     bp, sp
        push    si
        push    di
        push    ds
        lds     si, dword ptr [bp + 6]
        les     di, dword ptr [bp + 0ah]
        cld
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        pop     di
        pop     si
        pop     bp
        retf    8
fn_fa0fb:
        pop     cx
        push    cs
        push    cx
far_fa0fe:
        xor     cx, cx
        jmp     br_fa118
        db      059h, 00eh, 051h
far_fa105:
        mov     cx, 1
        jmp     br_fa118
        db      059h, 00eh, 051h
far_fa10d:
        mov     cx, 2
        jmp     br_fa118
        db      059h, 00eh, 051h
far_fa115:
        mov     cx, 3
br_fa118:
        push    bp
        push    si
        push    di
        mov     bp, sp
        mov     di, cx
        mov     ax, word ptr [bp + 0ah]
        mov     dx, word ptr [bp + 0ch]
        mov     bx, word ptr [bp + 0eh]
        mov     cx, word ptr [bp + 10h]
        or      cx, cx
        jnz     br_fa137
        or      dx, dx
        jz      br_fa19c
        or      bx, bx
        jz      br_fa19c
br_fa137:
        test    di, 1
        jnz     br_fa159
        or      dx, dx
        jns     br_fa14b
        neg     dx
        neg     ax
        sbb     dx, 0
        or      di, 0ch
br_fa14b:
        or      cx, cx
        jns     br_fa159
        neg     cx
        neg     bx
        sbb     cx, 0
        xor     di, 4
br_fa159:
        mov     bp, cx
        mov     cx, 20h
        push    di
        xor     di, di
        xor     si, si
loop_fa163:
        shl     ax, 1
        rcl     dx, 1
        rcl     si, 1
        rcl     di, 1
        cmp     di, bp
        jc      br_fa17a
        ja      br_fa175
        cmp     si, bx
        jc      br_fa17a
br_fa175:
        sub     si, bx
        sbb     di, bp
        inc     ax
br_fa17a:
        loop    loop_fa163
        pop     bx
        test    bx, 2
        jz      br_fa189
        mov     ax, si
        mov     dx, di
        shr     bx, 1
br_fa189:
        test    bx, 4
        jz      br_fa196
        neg     dx
        neg     ax
        sbb     dx, 0
br_fa196:
        pop     di
        pop     si
        pop     bp
        retf    8
br_fa19c:
        div     bx
        test    di, 2
        jz      br_fa1a5
        xchg    dx, ax
br_fa1a5:
        xor     dx, dx
        jmp     br_fa196
        db      05bh, 00eh, 053h
far_fa1ac:
        cmp     cl, 10h
        jnc     br_fa1c1
        mov     bx, ax
        shl     ax, cl
        shl     dx, cl
        neg     cl
        add     cl, 10h
        shr     bx, cl
        or      dx, bx
        retf
br_fa1c1:
        sub     cl, 10h
        xchg    dx, ax
        xor     ax, ax
        shl     dx, cl
        retf
        db      05bh, 00eh, 053h
far_fa1cd:
        cmp     cl, 10h
        jnc     br_fa1e2
        mov     bx, dx
        shr     ax, cl
        sar     dx, cl
        neg     cl
        add     cl, 10h
        shl     bx, cl
        or      ax, bx
        retf
br_fa1e2:
        sub     cl, 10h
        xchg    dx, ax
        cwd
        sar     ax, cl
        retf
        db      05bh, 00eh, 053h
        if      FW_VERSION >= 311
far_fa1ed:
        else
L_fa1db:
        endif
        cmp     cl, 10h
        jnc     br_fa202
        mov     bx, dx
        shr     ax, cl
        shr     dx, cl
        neg     cl
        add     cl, 10h
        shl     bx, cl
        or      ax, bx
        retf
br_fa202:
        sub     cl, 10h
        xchg    dx, ax
        xor     dx, dx
        shr     ax, cl
        retf
fn_fa20b:
        push    cx
        mov     ch, al
        mov     cl, 4
        shr     ax, cl
        add     dx, ax
        mov     al, ch
        mov     ah, bl
        shr     bx, cl
        pop     cx
        add     cx, bx
        mov     bl, ah
        and     ax, 0fh
        and     bx, 0fh
        cmp     dx, cx
        jnz     br_fa22b
        cmp     ax, bx
br_fa22b:
        ret
fn_fa22c:
        push    bp
        mov     bp, sp
        push    si
        push    di
        push    ds
        lds     si, dword ptr [bp + 4]
        les     di, dword ptr [bp + 8]
        cld
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        pop     di
        pop     si
        pop     bp
        ret     8
far_fa248:
        push    bp
        mov     bp, sp
        mov     dx, word ptr [bp + 6]
        cmp     dx, 0ffffh
        jnz     br_fa258
        mov     ax, 0ffffh
        jmp     br_fa272
br_fa258:
        mov     al, dl
        mov     ah, 0
        mov     bx, ax
        test    byte ptr [bx + TBL_79A5], 4
        jz      br_fa26e
        mov     al, dl
        mov     ah, 0
        add     ax, 20h
        jmp     br_fa272
br_fa26e:
        mov     al, dl
        mov     ah, 0
br_fa272:
        pop     bp
        retf
far_fa274:
        push    bp
        mov     bp, sp
        mov     dx, word ptr [bp + 6]
        cmp     dx, 0ffffh
        jnz     br_fa284
        mov     ax, 0ffffh
        jmp     br_fa29e
br_fa284:
        mov     al, dl
        mov     ah, 0
        mov     bx, ax
        test    byte ptr [bx + TBL_79A5], 8
        jz      br_fa29a
        mov     al, dl
        mov     ah, 0
        add     ax, 0ffe0h
        jmp     br_fa29e
br_fa29a:
        mov     al, dl
        mov     ah, 0
br_fa29e:
        pop     bp
        retf
far_fa2a0:
        push    bp
        mov     bp, sp
        push    si
        push    di
        push    es
        push    bp
        les     si, dword ptr [bp + 6]
        cld
        sub     ax, ax
        cwd
        mov     cx, 0ah
        mov     bh, 0
        mov     di, TBL_79A5
loop_fa2b6:
        mov     bl, byte ptr es:[si]
        inc     si
        test    byte ptr [bx+di], 1
        jnz     loop_fa2b6
        mov     bp, 0
        cmp     bl, 2bh
        jz      loop_fa2cd
        cmp     bl, 2dh
        jnz     br_fa2d1
        inc     bp
loop_fa2cd:
        mov     bl, byte ptr es:[si]
        inc     si
br_fa2d1:
        cmp     bl, 39h
        ja      br_fa305
        sub     bl, 30h
        jc      br_fa305
        mul     cx
        add     ax, bx
        adc     dl, dh
        jz      loop_fa2cd
        jmp     br_fa2f7
loop_fa2e5:
        mov     di, dx
        mov     cx, 0ah
        mul     cx
        xchg    di, ax
        xchg    dx, cx
        mul     dx
        xchg    dx, ax
        xchg    di, ax
        add     ax, bx
        adc     dx, cx
br_fa2f7:
        mov     bl, byte ptr es:[si]
        inc     si
        cmp     bl, 39h
        ja      br_fa305
        sub     bl, 30h
        jnc     loop_fa2e5
br_fa305:
        dec     bp
        jl      br_fa30f
        neg     dx
        neg     ax
        sbb     dx, 0
br_fa30f:
        pop     bp
        pop     es
        pop     di
        pop     si
        pop     bp
        retf
fn_fa315:
        push    bp
        mov     bp, sp
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    cs
        call    far_fa2a0
        pop     cx
        pop     cx
        pop     bp
        retf
far_fa326:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    si
        push    di
        push    bp
        xor     cx, cx
        mov     ax, word ptr [bp + 0ah]
        mov     dx, word ptr [bp + 0ch]
        mov     bx, word ptr [bp + 0eh]
        mov     bp, word ptr [bp + 10h]
        xor     si, si
        or      dx, dx
        jns     br_fa34b
        neg     dx
        neg     ax
        sbb     dx, si
        inc     cl
br_fa34b:
        or      bp, bp
        jns     br_fa358
        neg     bp
        neg     bx
        sbb     bp, si
        xor     cl, 1
br_fa358:
        push    cx
        mov     di, bp
        or      di, dx
        jnz     br_fa365
        div     bx
        xchg    si, dx
        jmp     br_fa383
br_fa365:
        mov     cx, 20h
        mov     di, si
loop_fa36a:
        shl     ax, 1
        rcl     dx, 1
        rcl     si, 1
        rcl     di, 1
        cmp     di, bp
        jc      br_fa381
        ja      br_fa37c
        cmp     si, bx
        jc      br_fa381
br_fa37c:
        sub     si, bx
        sbb     di, bp
        inc     ax
br_fa381:
        loop    loop_fa36a
br_fa383:
        pop     cx
        jcxz    br_fa394
        neg     di
        neg     si
        sbb     di, 0
        neg     dx
        neg     ax
        sbb     dx, 0
br_fa394:
        pop     bp
        mov     word ptr [bp - 8], ax
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 4], si
        mov     word ptr [bp - 2], di
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        lea     ax, [bp - 8]
        push    ss
        push    ax
        mov     cx, 8
        call    fn_fa22c
        mov     dx, word ptr [bp + 8]
        mov     ax, word ptr [bp + 6]
        pop     di
        pop     si
        mov     sp, bp
        pop     bp
        retf
far_fa3be:
        push    bp
        mov     bp, sp
        push    si
        push    di
        push    ds
        mov     cx, word ptr [bp + 0ch]
        mov     bx, word ptr [bp + 0ah]
        mov     dx, word ptr [bp + 8]
        mov     ax, word ptr [bp + 6]
        call    fn_fa20b
        jnc     br_fa3db
        std
        mov     ax, 1
        jmp     br_fa3de
br_fa3db:
        cld
        xor     ax, ax
br_fa3de:
        lds     si, dword ptr [bp + 6]
        les     di, dword ptr [bp + 0ah]
        mov     cx, word ptr [bp + 0eh]
        or      ax, ax
        jz      br_fa3f1
        add     si, cx
        dec     si
        add     di, cx
        dec     di
br_fa3f1:
        test    di, 1
        jz      br_fa3fb
        jcxz    br_fa40a
        movsb
        dec     cx
br_fa3fb:
        sub     si, ax
        sub     di, ax
        shr     cx, 1
        rep movsw
        jnc     br_fa40a
        add     si, ax
        add     di, ax
        movsb
br_fa40a:
        cld
        pop     ds
        pop     di
        pop     si
        pop     bp
        retf
far_fa410:
        push    bp
        mov     bp, sp
        push    word ptr [bp + 0eh]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    cs
        call    far_fa3be
        add     sp, 0ah
        mov     dx, word ptr [bp + 8]
        mov     ax, word ptr [bp + 6]
        pop     bp
        retf
fn_fa431:
        push    bp
        mov     bp, sp
        push    si
        push    di
        push    ds
        cld
        mov     cx, word ptr [W_FDBC]
        les     di, dword ptr [bp + 4]
        lds     si, dword ptr [bp + 8]
        shr     cx, 1
        jnc     loop_fa44f
        mov     al, byte ptr es:[di]
        movsb
        mov     byte ptr [si - 1], al
        jz      br_fa458
loop_fa44f:
        mov     ax, word ptr es:[di]
        movsw
        mov     word ptr [si - 2], ax
        loop    loop_fa44f
br_fa458:
        pop     ds
        pop     di
        pop     si
        pop     bp
        ret     8
fn_fa45f:
        push    bp
        mov     bp, sp
        sub     sp, 14h
        push    si
        push    di
        mov     si, word ptr [bp + 4]
br_fa46a:
        cmp     si, 2
        ja      br_fa4af
        cmp     si, 2
        jz      br_fa477
        jmp     br_fa6dd
br_fa477:
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        add     dx, word ptr [W_FDBC]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        push    ax
        push    dx
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   dword ptr [FP_FDBE]
        add     sp, 8
        or      ax, ax
        jg      br_fa49d
        jmp     br_fa6dd
br_fa49d:
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
br_fa4a9:
        call    fn_fa431
        jmp     br_fa6dd
br_fa4af:
        mov     ax, si
        dec     ax
        imul    word ptr [W_FDBC]
        mov     dx, word ptr [bp + 8]
        mov     bx, word ptr [bp + 6]
        add     bx, ax
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], bx
        mov     ax, si
        shr     ax, 1
        imul    word ptr [W_FDBC]
        mov     dx, word ptr [bp + 8]
        mov     bx, word ptr [bp + 6]
        add     bx, ax
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], bx
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        push    dx
        push    bx
        callf   dword ptr [FP_FDBE]
        add     sp, 8
        or      ax, ax
        jle     br_fa4fc
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        call    fn_fa431
br_fa4fc:
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        callf   dword ptr [FP_FDBE]
        add     sp, 8
        or      ax, ax
        jle     br_fa521
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        jmp     br_fa544
br_fa521:
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   dword ptr [FP_FDBE]
        add     sp, 8
        or      ax, ax
        jle     br_fa547
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
br_fa544:
        call    fn_fa431
br_fa547:
        cmp     si, 3
        jnz     br_fa55b
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        jmp     near br_fa4a9
br_fa55b:
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        add     dx, word ptr [W_FDBC]
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp - 0ch], dx
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        jmp     loop_fa59a
loop_fa573:
        or      di, di
        jnz     br_fa58c
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    word ptr [bp - 0ah]
        push    word ptr [bp - 0ch]
        call    fn_fa431
        mov     ax, word ptr [W_FDBC]
        add     word ptr [bp - 0ch], ax
br_fa58c:
        mov     ax, word ptr [bp - 4]
        cmp     ax, word ptr [bp - 8]
        jnc     br_fa60a
        mov     ax, word ptr [W_FDBC]
        add     word ptr [bp - 4], ax
loop_fa59a:
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        callf   dword ptr [FP_FDBE]
        add     sp, 8
        mov     di, ax
        or      ax, ax
        jle     loop_fa573
        mov     ax, word ptr [bp - 4]
        cmp     ax, word ptr [bp - 8]
        jnc     br_fa602
loop_fa5bb:
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   dword ptr [FP_FDBE]
        add     sp, 8
        mov     di, ax
        or      ax, ax
        jge     br_fa5dc
        mov     ax, word ptr [W_FDBC]
        sub     word ptr [bp - 8], ax
        jmp     br_fa5fa
br_fa5dc:
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        call    fn_fa431
        or      di, di
        jz      br_fa602
        mov     ax, word ptr [W_FDBC]
        add     word ptr [bp - 4], ax
        sub     word ptr [bp - 8], ax
        jmp     br_fa602
br_fa5fa:
        mov     ax, word ptr [bp - 4]
        cmp     ax, word ptr [bp - 8]
        jc      loop_fa5bb
br_fa602:
        mov     ax, word ptr [bp - 4]
        cmp     ax, word ptr [bp - 8]
        jc      loop_fa59a
br_fa60a:
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        callf   dword ptr [FP_FDBE]
        add     sp, 8
        or      ax, ax
        jg      br_fa631
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        add     dx, word ptr [W_FDBC]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
br_fa631:
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        sub     dx, word ptr [W_FDBC]
        mov     word ptr [bp - 12h], ax
        mov     word ptr [bp - 14h], dx
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        mov     word ptr [bp - 0eh], ax
        mov     word ptr [bp - 10h], dx
        jmp     br_fa667
loop_fa64f:
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 10h]
        push    word ptr [bp - 12h]
        push    word ptr [bp - 14h]
        call    fn_fa431
        mov     ax, word ptr [W_FDBC]
        add     word ptr [bp - 10h], ax
        sub     word ptr [bp - 14h], ax
br_fa667:
        mov     ax, word ptr [bp - 10h]
        cmp     ax, word ptr [bp - 0ch]
        jnc     br_fa677
        mov     ax, word ptr [bp - 14h]
        cmp     ax, word ptr [bp - 0ch]
        jnc     loop_fa64f
br_fa677:
        xor     ax, ax
        push    ax
        push    word ptr [W_FDBC]
        mov     ax, word ptr [bp - 4]
        xor     dx, dx
        sub     ax, word ptr [bp - 0ch]
        sbb     dx, 0
        push    dx
        push    ax
        call    fn_fa0fb
        mov     di, ax
        xor     ax, ax
        push    ax
        push    word ptr [W_FDBC]
        mov     ax, si
        imul    word ptr [W_FDBC]
        mov     dx, word ptr [bp + 6]
        add     dx, ax
        xor     ax, ax
        sub     dx, word ptr [bp - 4]
        sbb     ax, 0
        push    ax
        push    dx
        call    fn_fa0fb
        mov     si, ax
        cmp     si, di
        jnc     br_fa6c4
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    ax
        call    fn_fa45f
        mov     si, di
        jmp     br_fa46a
br_fa6c4:
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    di
        call    fn_fa45f
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        mov     word ptr [bp + 8], ax
        mov     word ptr [bp + 6], dx
        jmp     br_fa46a
br_fa6dd:
        pop     di
        pop     si
        mov     sp, bp
        pop     bp
        ret     6
far_fa6e5:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp + 0ch]
        mov     word ptr [W_FDBC], ax
        or      ax, ax
        jz      br_fa70b
        mov     ax, word ptr [bp + 10h]
        mov     dx, word ptr [bp + 0eh]
        mov     word ptr [W_FDC0], ax
        mov     word ptr [FP_FDBE], dx
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    word ptr [bp + 0ah]
        call    fn_fa45f
br_fa70b:
        pop     bp
        retf
far_fa70d:
        push    bp
        mov     bp, sp
        push    si
        push    di
        mov     dx, ds
        cld
        lds     si, dword ptr [bp + 6]
        les     di, dword ptr [bp + 0ah]
        xor     ax, ax
        mov     bx, ax
        mov     cx, 617ah
loop_fa722:
        lodsb
        mov     bl, byte ptr es:[di]
        or      al, al
        jz      br_fa746
        scasb
        jz      loop_fa722
        cmp     al, ch
        jc      br_fa737
        cmp     al, cl
        ja      br_fa737
        sub     al, 20h
br_fa737:
        cmp     bl, ch
        jc      br_fa742
        cmp     bl, cl
        ja      br_fa742
        sub     bl, 20h
br_fa742:
        cmp     al, bl
        jz      loop_fa722
br_fa746:
        sub     ax, bx
        mov     ds, dx
        pop     di
        pop     si
        pop     bp
        retf
far_fa74e:
        push    bp
        mov     bp, sp
        push    si
        push    di
        push    ds
        cld
        lds     si, dword ptr [bp + 6]
        les     di, dword ptr [bp + 0ah]
        mov     cx, word ptr [bp + 0eh]
        xor     ax, ax
        mov     bx, ax
        mov     dx, 617ah
loop_fa765:
        jcxz    br_fa78b
        lodsb
        mov     bl, byte ptr es:[di]
        or      al, al
        jz      br_fa78b
        scasb
        loopz   loop_fa765
        cmp     al, dh
        jc      br_fa77c
        cmp     al, dl
        ja      br_fa77c
        sub     al, 20h
br_fa77c:
        cmp     bl, dh
        jc      br_fa787
        cmp     bl, dl
        ja      br_fa787
        sub     bl, 20h
br_fa787:
        cmp     al, bl
        jz      loop_fa765
br_fa78b:
        sub     ax, bx
        pop     ds
        pop     di
        pop     si
        pop     bp
        retf
        if      FW_VERSION >= 311
        db      46eh dup (0ffh)
        else
        db      480h dup (0ffh)
        endif
        phase   0
far_fac00:
        cli
        cld
        mov     dx, 3
        mov     cx, 0
loop_fac08:
        loop    loop_fac08
        dec     dx
        jnz     loop_fac08
        mov     cx, 40h
        if      FW_VERSION >= 311
        mov     si, 256h
        else
        mov     si, 1b0h
        endif
        mov     dx, 0ff00h
loop_fac16:
        segcs
        outsw
        inc     dx
        inc     dx
        loop    loop_fac16
        brkxa   11h
far_fac1f:
        if      FW_VERSION >= 311
        mov     si, 2d6h
        else
        mov     si, 230h
        endif
br_fac22:
        segcs
        lodsw
        cmp     ax, 1234h
        jz      br_fac30
        mov     dx, ax
        segcs
        lodsw
        out     dx, al
        jmp     br_fac22
br_fac30:
        if      FW_VERSION >= 311
        mov     si, 364h
        else
        mov     si, 2beh
        endif
br_fac33:
        segcs
        lodsw
        mov     dx, ax
        cmp     ax, 1234h
        jz      br_fac40
        segcs
        outsw
        jmp     br_fac33
br_fac40:
        sub     ax, ax
        mov     es, ax
        mov     bx, 8
loop_fac47:
        mov     di, 0
        mov     ax, 0
        mov     cx, 8000h
        rep stosw
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
        dec     bx
        jnz     loop_fac47
        mov     ax, 0
        mov     ds, ax
        if      FW_VERSION >= 311
        mov     ax, 1a4h
        else
        mov     ax, 0feh
        endif
        mov     bx, 40h
        mov     word ptr [bx], ax
        mov     word ptr [bx + 2], cs
        mov     ax, SEG_8FED
        mov     ss, ax
        mov     sp, 100h
        mov     ax, 8010h
        mov     es, ax
        mov     ax, SEG_A000
        mov     ds, ax
        mov     si, 0
        mov     di, 0
        mov     cx, B_7AA6
        sub     cx, di
        shr     cx, 1
        if      FW_VERSION >= 311
        jcxz    br_fac8f
        else
        jcxz    L_fac8f
        endif
        rep movsw
        if      FW_VERSION >= 311
br_fac8f:
        mov     ax, 0
        mov     ds, ax
        mov     ax, 0a2h
        mov     bx, 48h
        mov     word ptr [bx], ax
        mov     word ptr [bx + 2], cs
        retxa   12h
far_faca2:
        mov     cx, 40h
        mov     si, 0b4h
        mov     dx, 0ff00h
loop_facab:
        segcs
        outsw
        inc     dx
        inc     dx
        loop    loop_facab
        brkxa   14h
        db      0c0h, 000h, 0c1h, 000h, 0c2h, 000h, 0c3h, 000h, 0c4h, 000h, 0c5h, 000h, 0c6h, 000h, 0c7h, 000h
        db      0c8h, 000h, 0c9h, 000h, 0cah, 000h, 0cbh, 000h, 0cch, 000h, 0cdh, 000h, 0ceh, 000h, 0cfh, 000h
        db      0d0h, 000h, 0d1h, 000h, 0d2h, 000h, 0d3h, 000h, 0d4h, 000h, 0d5h, 000h, 0d6h, 000h, 0d7h, 000h
        db      0d8h, 000h, 0d9h, 000h, 0dah, 000h, 0dbh, 000h, 0dch, 000h, 0ddh, 000h, 0deh, 000h, 0dfh, 000h
        db      0e0h, 000h, 0e1h, 000h, 0e2h, 000h, 0e3h, 000h, 0e4h, 000h, 0e5h, 000h, 0e6h, 000h, 0e7h, 000h
        db      0e8h, 000h, 0e9h, 000h, 0eah, 000h, 0ebh, 000h, 02ch, 000h, 02dh, 000h, 02eh, 000h, 02fh, 000h
        db      030h, 000h, 031h, 000h, 032h, 000h, 033h, 000h, 034h, 000h, 035h, 000h, 036h, 000h, 037h, 000h
        db      038h, 000h, 039h, 000h, 03ah, 000h, 03bh, 000h, 03ch, 000h, 040h, 001h, 03eh, 000h, 03fh, 000h
far_fad34:
        else
L_fac8f:
        endif
        mov     ax, 8010h
        mov     ds, ax
        mov     es, ax
        xor     ax, ax
        mov     di, B_7AA6
        if      FW_VERSION >= 312
        mov     cx, 0fdc4h
        elseif  FW_VERSION = 311
        mov     cx, 0fd0ah
        else
        mov     cx, 0f33eh
        endif
        sub     cx, di
        shr     cx, 1
        jcxz    br_fad4b
        rep stosw
br_fad4b:
        mov     si, 4
        mov     di, 16h
        mov     ax, SEG_F199
        mov     es, ax
        mov     ax, di
        sub     ax, si
        sub     dx, dx
        mov     cx, 6
        idiv    cx
        mov     cx, ax
        jcxz    br_fad9b
        sub     ah, ah
br_fad67:
        mov     bx, si
br_fad69:
        cmp     bx, di
        jnc     br_fad97
        cmp     byte ptr es:[bx + 1], ah
        jnz     br_fad92
        push    es
        push    ax
        push    bx
        push    cx
        push    si
        push    di
        cmp     byte ptr es:[bx], 0
        jz      br_fad85
        seges
        callf   dword ptr [bx + 2]
        jmp     br_fad89
br_fad85:
        call    word ptr es:[bx + 2]
br_fad89:
        pop     di
        pop     si
        pop     cx
        pop     bx
        pop     ax
        pop     es
        dec     cx
        jz      br_fad9b
br_fad92:
        add     bx, 6
        jmp     br_fad69
br_fad97:
        inc     ah
        jmp     br_fad67
br_fad9b:
        sti
        xor     bp, bp
        jmpf    SEG_B000:far_b0074
        if      FW_VERSION >= 311
        db      0cfh, 01eh
        else
        db      01eh
        endif
        db      "VPSQR"
br_fadaa:
        mov     ax, 0
        mov     ds, ax
        if      FW_VERSION >= 311
        mov     ax, 1bdh
        else
        mov     ax, 117h
        endif
        mov     bx, 48h
        mov     word ptr [bx], ax
        mov     word ptr [bx + 2], cs
        retxa   12h
far_fadbd:
        mov     cx, 40h
        if      FW_VERSION >= 311
        mov     si, 1cfh
        else
        mov     si, 129h
        endif
        mov     dx, 0ff00h
loop_fadc6:
        segcs
        outsw
        inc     dx
        inc     dx
        loop    loop_fadc6
        brkxa   12h
        db      0c0h, 000h, 0c1h, 000h, 0c2h, 000h, 0c3h, 000h, 0c4h, 000h, 0c5h, 000h, 0c6h, 000h, 0c7h, 000h
        db      0c8h, 000h, 0c9h, 000h, 0cah, 000h, 0cbh, 000h, 0cch, 000h, 0cdh, 000h, 0ceh, 000h, 0cfh, 000h
        db      0d0h, 000h, 0d1h, 000h, 0d2h, 000h, 0d3h, 000h, 0d4h, 000h, 0d5h, 000h, 0d6h, 000h, 0d7h, 000h
        db      0d8h, 000h, 0d9h, 000h, 0dah, 000h, 0dbh, 000h, 0dch, 000h, 0ddh, 000h, 0deh, 000h, 0dfh, 000h
        db      0e0h, 000h, 0e1h, 000h, 0e2h, 000h, 0e3h, 000h, 0e4h, 000h, 0e5h, 000h, 0e6h, 000h, 0e7h, 000h
        db      0e8h, 000h, 0e9h, 000h, 0eah, 000h, 0ebh, 000h, 0ech, 000h, 0edh, 000h, 0eeh, 000h, 0efh, 000h
        db      0f0h, 000h, 0f1h, 000h, 0f2h, 000h, 0f3h, 000h, 0f4h, 000h, 0f5h, 000h, 0f6h, 000h, 0f7h, 000h
        db      0f8h, 000h, 0f9h, 000h, 0fah, 000h, 0fbh, 000h, 0fch, 000h, 040h, 001h, 03eh, 000h, 03fh, 000h
far_fae4f:
        pop     dx
        pop     cx
        pop     bx
        pop     ax
        pop     si
        pop     ds
        iret
        db      0c0h, 000h, 0c1h, 000h, 0c2h, 000h, 0c3h, 000h, 0c4h, 000h, 0c5h, 000h, 0c6h, 000h, 0c7h, 000h
        db      0c8h, 000h, 0c9h, 000h, 0cah, 000h, 0cbh, 000h, 0cch, 000h, 0cdh, 000h, 0ceh, 000h, 0cfh, 000h
        db      0d0h, 000h, 0d1h, 000h, 0d2h, 000h, 0d3h, 000h, 0d4h, 000h, 0d5h, 000h, 0d6h, 000h, 0d7h, 000h
        db      0d8h, 000h, 0d9h, 000h, 0dah, 000h, 0dbh, 000h, 0dch, 000h, 0ddh, 000h, 0deh, 000h, 0dfh, 000h
        db      0e0h, 000h, 0e1h, 000h, 0e2h, 000h, 0e3h, 000h, 0e4h, 000h, 0e5h, 000h, 0e6h, 000h, 0e7h, 000h
        if      FW_VERSION >= 311
        db      028h, 000h, 029h, 000h, 02ah, 000h, 02bh, 000h, 02ch, 000h, 02dh, 000h, 02eh, 000h, 02fh, 000h
        else
        db      0e8h, 000h, 0e9h, 000h, 0eah, 000h, 0ebh, 000h, 02ch, 000h, 02dh, 000h, 02eh, 000h, 02fh, 000h
        endif
        db      030h, 000h, 031h, 000h, 032h, 000h, 033h, 000h, 034h, 000h, 035h, 000h, 036h, 000h, 037h, 000h
        db      038h, 000h, 039h, 000h, 03ah, 000h, 03bh, 000h, 03ch, 000h, 040h, 001h, 03eh, 000h, 03fh, 000h
        db      0feh, 0ffh, 011h, 000h, 0fch, 0ffh, 0c0h, 000h, 0fbh, 0ffh, 000h, 000h, 0fah, 0ffh, 010h, 000h
        db      0f8h, 0ffh, 020h, 000h, 0f9h, 0ffh, 030h, 000h, 0fdh, 0ffh, 00fh, 000h, 0eah, 0ffh, 007h, 000h
        db      0edh, 0ffh, 000h, 000h, 0f3h, 0ffh, 000h, 000h, 0ech, 0ffh, 002h, 000h, 0ebh, 0ffh, 011h, 000h
        db      0f4h, 0ffh, 011h, 000h, 0f5h, 0ffh, 031h, 000h, 0f6h, 0ffh, 031h, 000h, 0f2h, 0ffh, 090h, 000h
        db      0f1h, 0ffh, 000h, 000h, 010h, 0c0h, 013h, 000h, 011h, 0c0h, 008h, 000h, 011h, 0c0h, 001h, 000h
        db      011h, 0c0h, 0ffh, 000h, 0f0h, 0ffh, 012h, 000h, 033h, 0c0h, 034h, 000h, 033h, 0c0h, 074h, 000h
        db      033h, 0c0h, 0b4h, 000h, 000h, 0c0h, 001h, 000h, 000h, 0c0h, 000h, 000h, 022h, 0c0h, 04eh, 000h
        db      0e9h, 0ffh, 009h, 000h, 023h, 0c0h, 003h, 000h, 021h, 0c0h, 015h, 000h, 086h, 000h, 088h, 000h
        db      082h, 000h, 083h, 000h, 084h, 000h, 00ch, 000h, 0feh, 000h, 080h, 000h, 034h, 012h, 008h, 0c0h
        db      010h, 000h, 034h, 012h
        if      FW_VERSION >= 312
        db      98h dup (0ffh)
        elseif  FW_VERSION = 311
        db      96h dup (0ffh)
        else
        db      146h dup (0ffh)
        endif
        db      0ebh, 040h, 010h
        db      "COPYRIGHT (C) 1983 KADAK PRODUCTS LTD."
        db      090h
FP_fb02c:
        if      FW_VERSION >= 312
        db      008h, 000h, 075h, 0fbh, 09ch, 000h, 075h, 0fbh
        elseif  FW_VERSION = 311
        db      006h, 000h, 075h, 0fbh, 09ah, 000h, 075h, 0fbh
        else
        db      000h, 000h, 076h, 0fbh, 094h, 000h, 076h, 0fbh
        endif
FP_fb034_v312:
        if      FW_VERSION >= 312
        db      0b0h, 000h, 075h, 0fbh
        elseif  FW_VERSION = 311
        db      0aeh, 000h, 075h, 0fbh
        else
        db      0a8h, 000h, 076h, 0fbh
        endif
FP_fb038:
        if      FW_VERSION >= 312
        db      024h, 000h, 031h, 0a8h
        elseif  FW_VERSION = 311
        db      024h, 000h, 025h, 0a8h
        else
        db      0c2h, 0e7h, 010h, 080h
        endif
FP_fb03c_v312:
        if      FW_VERSION >= 312
        db      0ach, 000h, 075h, 0fbh
        elseif  FW_VERSION = 311
        db      0aah, 000h, 075h, 0fbh
        else
        db      0a4h, 000h, 076h, 0fbh
        endif
FP_fb040_v312:
        if      FW_VERSION >= 312
        db      078h, 005h, 010h, 091h, 0fah, 02eh, 0c5h, 01eh, 03ch, 000h, 0c5h, 027h, 08ch, 0d8h, 08eh, 0d0h
        db      033h, 0ffh, 08eh, 0dfh, 0c7h, 005h, 0eeh, 002h, 08ch, 04dh, 002h, 0c7h, 045h, 010h, 0e5h, 002h
        db      08ch, 04dh, 012h, 02eh, 0c5h, 03eh, 038h, 000h, 02eh, 0c4h, 02eh, 02ch, 000h, 0bbh, 040h, 000h
        elseif  FW_VERSION = 311
        db      078h, 005h, 004h, 091h, 0fah, 02eh, 0c5h, 01eh, 03ah, 000h, 0c5h, 027h, 08ch, 0d8h, 08eh, 0d0h
        db      033h, 0ffh, 08eh, 0dfh, 0c7h, 005h, 0ech, 002h, 08ch, 04dh, 002h, 0c7h, 045h, 010h, 0e3h, 002h
        db      08ch, 04dh, 012h, 02eh, 0c5h, 03eh, 036h, 000h, 02eh, 0c4h, 02eh, 02ah, 000h, 0bbh, 040h, 000h
        else
        db      0e0h, 005h, 06dh, 090h, 0fah, 02eh, 0c5h, 01eh, 044h, 000h, 0c5h, 027h, 08ch, 0d8h, 08eh, 0d0h
        db      033h, 0ffh, 08eh, 0dfh, 0c7h, 005h, 0f6h, 002h, 08ch, 04dh, 002h, 0c7h, 045h, 010h, 0edh, 002h
        db      08ch, 04dh, 012h, 02eh, 0c5h, 03eh, 040h, 000h, 02eh, 0c4h, 02eh, 034h, 000h, 0bbh, 040h, 000h
        endif
        db      003h, 0dfh, 089h, 01dh, 033h, 0c0h, 089h, 045h, 00ch, 089h, 045h, 00eh, 089h, 045h, 010h, 026h
        if      FW_VERSION >= 312
        db      08bh, 016h, 0aah, 000h, 089h, 055h, 014h, 055h, 033h, 0d2h, 026h, 08bh, 04eh, 000h, 026h, 023h
        elseif  FW_VERSION = 311
        db      08bh, 016h, 0a8h, 000h, 089h, 055h, 014h, 055h, 033h, 0d2h, 026h, 08bh, 04eh, 000h, 026h, 023h
        else
        db      08bh, 016h, 0a2h, 000h, 089h, 055h, 014h, 055h, 033h, 0d2h, 026h, 08bh, 04eh, 000h, 026h, 023h
        endif
        db      04eh, 002h, 041h, 074h, 00fh, 042h, 0b9h, 020h, 000h, 089h, 007h, 043h, 043h, 0e2h, 0fah, 083h
        db      0c5h, 012h, 0ebh, 0e6h, 089h, 05dh, 002h, 088h, 055h, 00eh, 083h, 0c3h, 004h, 089h, 05dh, 004h
        if      FW_VERSION >= 312
        db      05dh, 006h, 026h, 08bh, 00eh, 0a8h, 000h, 01eh, 007h, 0e8h, 082h, 000h, 083h, 0e9h, 010h, 083h
        elseif  FW_VERSION = 311
        db      05dh, 006h, 026h, 08bh, 00eh, 0a6h, 000h, 01eh, 007h, 0e8h, 082h, 000h, 083h, 0e9h, 010h, 083h
        else
        db      05dh, 006h, 026h, 08bh, 00eh, 0a0h, 000h, 01eh, 007h, 0e8h, 082h, 000h, 083h, 0e9h, 010h, 083h
        endif
        db      0c1h, 010h, 00eh, 0e8h, 0e9h, 005h, 090h, 079h, 0f6h, 007h, 08bh, 035h, 08bh, 0d9h, 08ah, 055h
        db      00eh, 00ah, 0d2h, 074h, 03bh, 026h, 08bh, 046h, 008h, 089h, 044h, 002h, 083h, 0c5h, 00ah, 032h
        db      0e4h, 0b6h, 004h, 026h, 08bh, 04eh, 000h, 00bh, 0c9h, 074h, 00eh, 006h, 01eh, 007h, 089h, 05ch
        db      010h, 0e8h, 04ah, 000h, 08bh, 0d9h, 007h, 0feh, 0c4h
        db      "FFEE"
        db      0feh, 0ceh, 075h, 0e2h, 083h, 0c6h, 038h, 00ah, 0e4h, 074h, 004h, 080h, 04ch, 0c2h, 002h, 0feh
        if      FW_VERSION >= 312
        db      0cah, 075h, 0c5h, 0c7h, 004h, 000h, 080h, 0e8h, 03eh, 004h, 02eh, 0c4h, 036h, 030h, 000h, 026h
        elseif  FW_VERSION = 311
        db      0cah, 075h, 0c5h, 0c7h, 004h, 000h, 080h, 0e8h, 03eh, 004h, 02eh, 0c4h, 036h, 02eh, 000h, 026h
        else
        db      0cah, 075h, 0c5h, 0c7h, 004h, 000h, 080h, 0e8h, 03eh, 004h, 02eh, 0c4h, 036h, 038h, 000h, 026h
        endif
        db      08bh, 00ch, 026h, 023h, 04ch, 002h, 041h, 074h, 00eh, 006h, 056h, 00eh, 0e8h, 0e0h, 004h, 090h
        if      FW_VERSION >= 312
        db      05eh, 007h, 083h, 0c6h, 004h, 0ebh, 0e8h, 02eh, 0c5h, 03eh, 038h, 000h, 0e8h, 0a4h, 000h, 0ebh
        elseif  FW_VERSION = 311
        db      05eh, 007h, 083h, 0c6h, 004h, 0ebh, 0e8h, 02eh, 0c5h, 03eh, 036h, 000h, 0e8h, 0a4h, 000h, 0ebh
        else
        db      05eh, 007h, 083h, 0c6h, 004h, 0ebh, 0e8h, 02eh, 0c5h, 03eh, 040h, 000h, 0e8h, 0a4h, 000h, 0ebh
        endif
        db      0f6h, 0b0h, 002h, 00eh, 0e8h, 00dh, 005h, 090h, 003h, 0c9h, 083h, 0c1h, 008h, 003h, 0cbh, 0c3h
        if      FW_VERSION >= 312
        phase   14dh
        elseif  FW_VERSION = 311
        phase   14bh
        else
        phase   155h
        endif
far_fb14d:
        push    ax
        push    cx
        push    dx
        push    bx
        push    si
        push    di
        push    bp
        mov     bp, sp
        mov     bx, ds
        xchg    word ptr [bp + 0eh], bx
        mov     ax, es
        xchg    word ptr [bp + 10h], ax
        mov     es, ax
        lds     di, dword ptr cs:[FP_fb038-400h]
        dec     byte ptr [di + 10h]
        js      br_fb17f
        mov     word ptr [di + 16h], sp
        mov     word ptr [di + 18h], ss
        lds     bp, dword ptr cs:[FP_fb03c_v312-400h]
        lds     sp, dword ptr ds:[bp]
        mov     ax, ds
        mov     ss, ax
br_fb17f:
        mov     bp, sp
        push    es
        push    bx
        mov     ax, ss
        mov     ds, ax
        mov     es, ax
        retf
far_fb18a:
        lds     di, dword ptr cs:[FP_fb038-400h]
        cli
        inc     byte ptr [di + 10h]
        jle     br_fb1af
        pop     bx
        pop     es
        mov     sp, word ptr [di + 16h]
        mov     ss, word ptr [di + 18h]
        push    es
        push    bx
        mov     al, byte ptr [di + 0ch]
        cmp     al, byte ptr [di + 11h]
        jbe     br_fb1af
        mov     ax, 2
        push    cs
        call    fn_fb1c5
        nop
br_fb1af:
        pop     bx
        pop     ax
        mov     bp, sp
        xchg    word ptr [bp + 0eh], bx
        mov     ds, bx
        xchg    word ptr [bp + 10h], ax
        mov     es, ax
        pop     bp
        pop     di
        pop     si
        pop     bx
        pop     dx
        pop     cx
        pop     ax
        retf
fn_fb1c5:
        lds     di, dword ptr cs:[FP_fb038-400h]
        mov     si, word ptr [di + 0ah]
        cli
        mov     dx, word ptr [si]
        and     dx, 8001h
        or      ax, dx
        mov     word ptr [si], ax
        js      br_fb1e0
        mov     word ptr [si + 4], sp
        mov     word ptr [si + 6], ss
br_fb1e0:
        cli
        les     sp, dword ptr cs:[FP_fb040_v312-400h]
        mov     ax, es
        mov     ss, ax
        mov     dl, byte ptr [di + 11h]
        mov     byte ptr [di + 10h], 1
        mov     bx, word ptr [di + 2]
        mov     word ptr [di + 0ah], bx
        mov     byte ptr [di + 0ch], dl
        sti
        call    fn_fb52d
        js      br_fb22f
br_fb200:
        cli
        mov     ax, word ptr [si]
        test    ax, 0ch
        jnz     br_fb222
        test    ax, 8003h
        jz      br_fb222
        js      br_fb22f
        mov     word ptr [di + 0ah], si
        mov     word ptr [si], 4000h
        test    ax, 2
        jz      br_fb236
        mov     sp, word ptr [si + 4]
        mov     ss, word ptr [si + 6]
        retf
br_fb222:
        inc     dx
        mov     byte ptr [di + 0ch], dl
        mov     byte ptr [di + 11h], dl
        sti
        add     si, 40h
        jmp     br_fb200
br_fb22f:
        sti
br_fb230:
        nop
        nop
        nop
        nop
        jmp     br_fb230
br_fb236:
        mov     al, 12h
        mul     dl
        les     bx, dword ptr cs:[FP_fb02c-400h]
        add     bx, ax
        mov     sp, word ptr es:[bx + 4]
        mov     ss, word ptr es:[bx + 6]
        les     bx, dword ptr es:[bx]
        dec     word ptr [si + 8]
        sub     sp, 0ch
        mov     bp, sp
        push    cs
        call    fn_fb27a
        nop
        sti
        push    cs
        call    fn_fb4d2
        nop
        lds     di, dword ptr cs:[FP_fb038-400h]
        mov     si, word ptr [di + 0ah]
        mov     dl, byte ptr [di + 0ch]
        cli
        mov     ax, word ptr [si + 8]
        or      ax, ax
        jz      br_fb275
        mov     ax, 1
br_fb275:
        mov     word ptr [si], ax
        jmp     near br_fb1e0
fn_fb27a:
        xor     ax, ax
        mov     word ptr [si + 0ah], ax
        mov     word ptr [si + 0ch], ax
        mov     word ptr [si + 18h], ax
        mov     word ptr [si + 1ah], ax
        mov     word ptr [si + 1ch], ax
        mov     word ptr [si + 1eh], ax
        mov     byte ptr [si + 0eh], 7fh
        push    es
        push    bx
        push    bp
        test    word ptr [si + 2], 2
        jz      br_fb2dc
        push    si
        mov     ax, ds
        mov     es, ax
        mov     dx, 4
loop_fb2a4:
        mov     bx, word ptr [si + 10h]
        inc     si
        inc     si
        or      bx, bx
        jz      br_fb2b4
        push    cs
        call    far_fb6de
        nop
        jns     br_fb2ba
br_fb2b4:
        dec     dx
        jnz     loop_fb2a4
        pop     si
        jmp     br_fb2dc
br_fb2ba:
        mov     bx, cx
        pop     si
        mov     ax, word ptr [bx]
        mov     byte ptr [si + 0eh], al
        mov     dx, 6
        add     bx, 4
loop_fb2c8:
        mov     ax, word ptr [bx]
        mov     word ptr [bp], ax
        inc     bx
        inc     bx
        inc     bp
        inc     bp
        dec     dx
        jnz     loop_fb2c8
        mov     bx, word ptr [di + 4]
        push    cs
        call    far_fb6af
        nop
br_fb2dc:
        sti
        pop     bp
        mov     ax, ss
        mov     ds, ax
        mov     es, ax
        retf
fn_fb2e5:
        sub     sp, 4
        push    ax
        mov     ax, 4
        jmp     br_fb2f4
        db      083h, 0ech, 004h, 050h, 033h, 0c0h
br_fb2f4:
        push    ds
        push    di
        lds     di, dword ptr cs:[FP_fb038-400h]
        test    byte ptr [di + 10h], 0ffh
        jg      br_fb308
loop_fb301:
        pop     di
        pop     ds
        pop     ax
        add     sp, 4
        iret
br_fb308:
        mov     di, word ptr [di + 0ah]
        lea     di, [di + 18h]
        add     di, ax
        mov     ax, word ptr [di]
        mov     ds, word ptr [di + 2]
        mov     di, ax
        mov     ax, ds
        or      ax, di
        jz      loop_fb301
fn_fb31d:
        push    bp
        mov     bp, sp
        mov     word ptr [bp + 8], di
        mov     word ptr [bp + 0ah], ds
        mov     ax, word ptr [bp + 10h]
        mov     di, word ptr [bp + 0ch]
        mov     ds, word ptr [bp + 0eh]
        mov     word ptr [bp + 0ch], ax
        mov     word ptr [bp + 0eh], di
        mov     word ptr [bp + 10h], ds
        pop     bp
        pop     di
        pop     ds
        pop     ax
        iret
far_fb33d:
        push    ds
        push    dx
        push    di
        pushf
        xor     dh, dh
        or      dx, dx
        jz      br_fb370
        cmp     dx, 4
        jz      br_fb370
        add     dx, dx
        add     dx, dx
        xor     di, di
        mov     ds, di
        mov     di, dx
        mov     dx, es
        or      dx, bx
        cli
        jz      br_fb367
br_fb35d:
        mov     word ptr [di], bx
        mov     word ptr [di + 2], es
br_fb362:
        popf
        pop     di
        pop     dx
        pop     ds
        retf
br_fb367:
        if      FW_VERSION >= 312
        mov     word ptr [di], 307h
        elseif  FW_VERSION = 311
        mov     word ptr [di], 305h
        else
        mov     word ptr [di], 30fh
        endif
        mov     word ptr [di + 2], cs
        jmp     br_fb362
br_fb370:
        lds     di, dword ptr cs:[FP_fb038-400h]
        mov     di, word ptr [di + 0ah]
        lea     di, [di + 18h]
        add     di, dx
        cli
        jmp     br_fb35d
far_fb380:
        pushf
        cli
        push    cs
        call    far_fb14d
        push    cs
        call    far_fb18a
        popf
        retf
far_fb38c:
        push    ds
        push    si
        push    di
        call    fn_fb52d
        js      br_fb3a5
        pushf
        cli
        inc     word ptr [si + 8]
        or      word ptr [si], 1
        cmp     dl, byte ptr [di + 11h]
        jnc     br_fb3a4
        mov     byte ptr [di + 11h], dl
br_fb3a4:
        popf
br_fb3a5:
        pop     di
        pop     si
        pop     ds
        retf
far_fb3a9:
        push    ds
        push    es
        push    bx
        push    cx
        push    dx
        push    si
        push    di
        push    bp
        call    fn_fb52d
        js      br_fb3db
        mov     ax, cx
        and     ax, 3
        add     ax, ax
        mov     bp, si
        add     si, ax
        mov     ax, word ptr [si + 10h]
        mov     si, bp
        or      ax, ax
        jz      br_fb433
        mov     dx, ax
        mov     ax, ds
        mov     es, ax
        mov     bx, word ptr [di + 4]
        push    cs
        call    far_fb6de
        nop
        mov     ax, 0fffeh
br_fb3db:
        js      br_fb436
        mov     bp, sp
        mov     bx, cx
        mov     al, byte ptr [bp + 9]
        and     al, 80h
        or      al, byte ptr [di + 0ch]
        test    byte ptr [di + 10h], 0ffh
        jg      br_fb3f1
        mov     al, 7fh
br_fb3f1:
        mov     byte ptr [bx], al
        les     bp, dword ptr [bp + 0ah]
        mov     cx, 6
        add     bx, 4
loop_fb3fc:
        mov     ax, word ptr es:[bp]
        mov     word ptr [bx], ax
        inc     bx
        inc     bx
        inc     bp
        inc     bp
        loop    loop_fb3fc
        sub     bx, 10h
        mov     al, byte ptr [bx]
        mov     cx, bx
        mov     bx, dx
        mov     bp, sp
        mov     dl, byte ptr [bp + 6]
        mov     dh, al
        mov     ax, ds
        mov     es, ax
        pushf
        cli
        push    cs
        call    far_fb6af
        nop
        jns     br_fb441
        mov     bx, word ptr [di + 4]
        push    cs
        call    far_fb6af
        nop
        popf
        mov     ax, 0fffch
        jmp     br_fb436
br_fb433:
        mov     ax, 0fffdh
br_fb436:
        or      ax, ax
br_fb438:
        pop     bp
        pop     di
        pop     si
        pop     dx
        pop     cx
        pop     bx
        pop     es
        pop     ds
        retf
br_fb441:
        inc     word ptr [si + 8]
        or      word ptr [si], 1
        cmp     dl, byte ptr [di + 11h]
        jnc     br_fb44f
        mov     byte ptr [di + 11h], dl
br_fb44f:
        or      dx, dx
        jns     br_fb45a
        mov     ax, 8
        push    cs
        call    fn_fb1c5
br_fb45a:
        popf
        xor     ax, ax
        jmp     br_fb438
far_fb45f:
        push    es
        push    ds
        push    ax
        push    cx
        push    dx
        push    bx
        push    si
        push    di
        push    bp
        mov     ax, 4
        push    cs
        call    fn_fb1c5
        sti
        pop     bp
        pop     di
        pop     si
        pop     bx
        pop     dx
        pop     cx
        pop     ax
        pop     ds
        pop     es
        retf
far_fb47a:
        push    ds
        push    si
        push    di
        lds     di, dword ptr cs:[FP_fb038-400h]
        mov     si, word ptr [di + 0ah]
        xor     ax, ax
        cli
        mov     word ptr [si + 0ah], cx
        mov     word ptr [si + 0ch], ax
        push    cs
        call    far_fb45f
        mov     ax, word ptr [si + 0ch]
        or      ax, ax
        jz      br_fb49e
        mov     ax, 0fffbh
        or      ax, ax
br_fb49e:
        pop     di
        pop     si
        pop     ds
        retf
far_fb4a2:
        push    ds
        push    si
        push    di
        call    fn_fb52d
        js      br_fb4ce
        mov     ax, 0fffah
        pushf
        cli
        test    word ptr [si], 4
        jz      br_fb4cb
        mov     word ptr [si], 2
        cmp     dl, byte ptr [di + 11h]
        jnc     br_fb4c1
        mov     byte ptr [di + 11h], dl
br_fb4c1:
        mov     word ptr [si + 0ch], 4
        xor     ax, ax
        mov     word ptr [si + 0ah], ax
br_fb4cb:
        popf
        or      ax, ax
br_fb4ce:
        pop     di
        pop     si
        pop     ds
        retf
fn_fb4d2:
        push    ds
        push    dx
        push    si
        push    di
        lds     di, dword ptr cs:[FP_fb038-400h]
        mov     si, word ptr [di + 0ah]
        pushf
        cli
        mov     ax, 0fff8h
        mov     dl, byte ptr [si + 0eh]
        cmp     dl, 7fh
        jz      br_fb513
        inc     ax
        test    dl, 80h
        jns     br_fb513
        and     dl, 7fh
        mov     byte ptr [si + 0eh], dl
        call    fn_fb52d
        js      br_fb513
        mov     ax, 0fff9h
        test    word ptr [si], 8
        jz      br_fb513
        mov     word ptr [si], 2
        cmp     dl, byte ptr [di + 11h]
        jnc     br_fb511
        mov     byte ptr [di + 11h], dl
br_fb511:
        xor     ax, ax
br_fb513:
        popf
        or      ax, ax
        pop     di
        pop     si
        pop     dx
        pop     ds
        retf
fn_fb51b:
        push    ds
        push    si
        push    di
        call    fn_fb52d
        js      br_fb529
        mov     bx, ds
        mov     es, bx
        mov     bx, si
br_fb529:
        pop     di
        pop     si
        pop     ds
        retf
fn_fb52d:
        lds     di, dword ptr cs:[FP_fb038-400h]
        mov     ax, 0ffffh
        cmp     dl, byte ptr [di + 0eh]
        jnc     br_fb545
        mov     ax, 40h
        mul     dl
        add     ax, word ptr [di]
        mov     si, ax
        xor     ax, ax
br_fb545:
        or      ax, ax
        ret
far_fb548:
        push    ds
        push    di
        lds     di, dword ptr cs:[FP_fb038-400h]
        mov     ax, word ptr [di + 0ch]
        pop     di
        pop     ds
        retf
fn_fb555:
        mov     word ptr [di + 6], bx
        les     si, dword ptr cs:[FP_fb034_v312-400h]
        xor     ax, ax
br_fb55f:
        mov     cx, word ptr es:[si]
        and     cx, word ptr es:[si + 2]
        inc     cx
        jz      br_fb575
        mov     word ptr [bx], 0
        inc     ax
        inc     bx
        inc     bx
        add     si, 4
        jmp     br_fb55f
br_fb575:
        mov     word ptr [di + 8], ax
        call    fn_fb5a1
        ret
far_fb57c:
        push    ds
        push    di
        lds     di, dword ptr cs:[FP_fb038-400h]
        dec     word ptr [di + 12h]
        pop     di
        pop     ds
        jnz     br_fb595
        push    cs
        call    far_fb14d
        call    fn_fb596
        push    cs
        call    far_fb18a
br_fb595:
        retf
fn_fb596:
        xor     dx, dx
        push    cs
        call    far_fb38c
        lds     di, dword ptr cs:[FP_fb038-400h]
fn_fb5a1:
        mov     ax, word ptr [di + 14h]
        mov     word ptr [di + 12h], ax
        ret
L_fb5a8:
        lds     di, dword ptr cs:[FP_fb038-400h]
        call    fn_fb5df
        mov     bx, word ptr [di + 6]
        les     si, dword ptr cs:[FP_fb034_v312-400h]
        mov     cx, word ptr [di + 8]
        or      cx, cx
        jz      br_fb5de
loop_fb5bf:
        call    fn_fb601
        sti
        jnc     br_fb5d7
        jnz     br_fb5d7
        push    es
        push    ds
        push    cx
        push    bx
        push    si
        push    cs
        call    fn_fb60c
        nop
        sti
        pop     si
        pop     bx
        pop     cx
        pop     ds
        pop     es
br_fb5d7:
        inc     bx
        inc     bx
        add     si, 4
        loop    loop_fb5bf
br_fb5de:
        retf
fn_fb5df:
        mov     si, word ptr [di]
br_fb5e1:
        cli
        mov     ax, word ptr [si]
        and     ax, 8004h
        js      br_fb5ff
        jz      br_fb5f9
        lea     bx, [si + 0ah]
        call    fn_fb601
        jnc     br_fb5f9
        jnz     br_fb5f9
        mov     word ptr [si], 2
br_fb5f9:
        sti
        add     si, 40h
        jmp     br_fb5e1
br_fb5ff:
        sti
        ret
fn_fb601:
        cli
        mov     ax, word ptr [bx]
        or      ax, ax
        jz      br_fb60b
        dec     word ptr [bx]
        stc
br_fb60b:
        ret
fn_fb60c:
        lds     ax, dword ptr es:[si]
        mov     bp, sp
        push    ds
        push    ax
        mov     ax, ss
        mov     ds, ax
        mov     es, ax
        retf
far_fb61a:
        push    ds
        push    bx
        lds     bx, dword ptr cs:[FP_fb038-400h]
        mov     bx, word ptr [bx + 6]
        add     bx, dx
        mov     word ptr [bx], 0
        pop     bx
        pop     ds
        retf
far_fb62d:
        push    ds
        push    bx
        lds     bx, dword ptr cs:[FP_fb038-400h]
        mov     bx, word ptr [bx + 6]
        add     bx, dx
        mov     word ptr [bx], cx
        pop     bx
        pop     ds
        retf
far_fb63e:
        push    ds
        push    bx
        lds     bx, dword ptr cs:[FP_fb038-400h]
        mov     bx, word ptr [bx + 6]
        add     bx, dx
        mov     ax, word ptr [bx]
        or      ax, ax
        pop     bx
        pop     ds
        retf
far_fb651:
        push    ax
        pushf
        dec     ax
        and     ax, 3
        ror     ax, 1
        ror     ax, 1
        or      ax, cx
        cli
        mov     word ptr es:[bx], ax
        xor     ax, ax
        mov     word ptr es:[bx + 2], ax
        mov     word ptr es:[bx + 4], ax
        mov     word ptr es:[bx + 6], ax
        popf
        pop     ax
        retf
far_fb672:
        call    fn_fb739
        cmp     dx, bp
        jnc     loop_fb6d1
        inc     dx
        mov     word ptr [bx + 2], dx
        cmp     dx, bp
        jc      br_fb683
        inc     ah
br_fb683:
        mov     si, word ptr [bx + 4]
        or      si, si
        jnz     br_fb68c
        mov     si, bp
br_fb68c:
        dec     si
        mov     word ptr [bx + 4], si
br_fb690:
        dec     al
        jz      br_fb6a8
        js      br_fb6a3
        add     si, si
        add     si, si
        pop     dx
        mov     word ptr [bx+si + 0ah], dx
        mov     word ptr [bx+si + 8], cx
        jmp     br_fb6d4
br_fb6a3:
        mov     byte ptr [bx+si + 8], cl
        jmp     br_fb6d3
br_fb6a8:
        add     si, si
        mov     word ptr [bx+si + 8], cx
        jmp     br_fb6d3
far_fb6af:
        call    fn_fb739
        cmp     dx, bp
        jnc     loop_fb6d1
        inc     dx
        mov     word ptr [bx + 2], dx
        cmp     dx, bp
        jc      br_fb6c0
        inc     ah
br_fb6c0:
        mov     si, word ptr [bx + 6]
        mov     dx, si
        inc     dx
        cmp     dx, bp
        jc      br_fb6cc
        xor     dx, dx
br_fb6cc:
        mov     word ptr [bx + 6], dx
        jmp     br_fb690
loop_fb6d1:
        dec     ah
br_fb6d3:
        pop     dx
br_fb6d4:
        popf
        pop     bp
        pop     si
        pop     ds
        mov     al, ah
        cbw
        or      ax, ax
        retf
far_fb6de:
        call    fn_fb739
        or      dx, dx
        jz      loop_fb6d1
        dec     dx
        mov     word ptr [bx + 2], dx
        jnz     br_fb6ed
        inc     ah
br_fb6ed:
        mov     si, word ptr [bx + 4]
        mov     dx, si
        inc     dx
        cmp     dx, bp
        jc      br_fb6f9
        xor     dx, dx
br_fb6f9:
        mov     word ptr [bx + 4], dx
br_fb6fc:
        dec     al
        jz      br_fb714
        js      br_fb70f
        add     si, si
        add     si, si
        pop     dx
        mov     dx, word ptr [bx+si + 0ah]
        mov     cx, word ptr [bx+si + 8]
        jmp     br_fb6d4
br_fb70f:
        mov     cl, byte ptr [bx+si + 8]
        jmp     br_fb6d3
br_fb714:
        add     si, si
        mov     cx, word ptr [bx+si + 8]
        jmp     br_fb6d3
far_fb71b:
        call    fn_fb739
        or      dx, dx
        jz      loop_fb6d1
        dec     dx
        mov     word ptr [bx + 2], dx
        jnz     br_fb72a
        inc     ah
br_fb72a:
        mov     si, word ptr [bx + 6]
        or      si, si
        jnz     br_fb733
        mov     si, bp
br_fb733:
        dec     si
        mov     word ptr [bx + 6], si
        jmp     br_fb6fc
fn_fb739:
        pop     ax
        push    ds
        push    si
        push    bp
        pushf
        push    dx
        push    ax
        mov     ax, es
        mov     ds, ax
        mov     ax, word ptr [bx]
        mov     bp, ax
        and     bp, 3fffh
        rol     ax, 1
        rol     ax, 1
        and     ax, 3
        cli
        mov     dx, word ptr [bx + 2]
        ret
        if      FW_VERSION >= 312
        db      0a8h, 005h, 000h, 0fbh, 0f0h, 003h, 067h, 091h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 00eh, 000h, 04bh, 0b2h, 020h, 003h, 0a6h, 091h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 00bh, 000h, 009h, 0ech, 008h, 007h, 0d8h, 091h, 000h, 000h, 05ah, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 001h, 000h, 0d9h, 0eah, 048h, 006h, 048h, 092h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 006h, 000h, 0a9h, 0deh, 0f0h, 003h, 0ach, 092h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ch, 000h, 044h, 0b1h, 0e8h, 003h
        db      0ebh, 092h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 07bh, 0dah
        db      0f0h, 003h, 029h, 093h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 074h, 000h
        db      000h, 0b0h, 080h, 03eh, 068h, 093h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      0ffh, 0ffh, 0ffh, 0ffh, 00eh, 000h, 080h, 0fbh, 004h, 000h, 035h, 0b0h, 0ffh, 0ffh, 0ffh, 0ffh
        db      078h, 000h, 00ah, 000h, 030h, 011h, 0fdh, 08fh, 0b8h, 000h, 075h, 0fbh, 0ffh, 0ffh, 0ffh, 0ffh
        elseif  FW_VERSION = 311
        db      0a6h, 005h, 000h, 0fbh, 0f0h, 003h, 05bh, 091h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 00eh, 000h, 04bh, 0b2h, 020h, 003h, 09ah, 091h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 00dh, 000h, 033h, 0ech, 008h, 007h, 0cch, 091h, 000h, 000h, 05ah, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 003h, 0ebh, 048h, 006h, 03ch, 092h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ch, 000h, 0e1h, 0deh, 0f0h, 003h, 0a0h, 092h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ch, 000h, 044h, 0b1h, 0e8h, 003h
        db      0dfh, 092h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 009h, 000h, 0b3h, 0dah
        db      0f0h, 003h, 01dh, 093h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 074h, 000h
        db      000h, 0b0h, 080h, 03eh, 05ch, 093h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      0ffh, 0ffh, 0ffh, 0ffh, 00ch, 000h, 080h, 0fbh, 004h, 000h, 035h, 0b0h, 0ffh, 0ffh, 0ffh, 0ffh
        db      078h, 000h, 00ah, 000h, 030h, 011h, 0f1h, 08fh, 0b6h, 000h, 075h, 0fbh, 0ffh, 0ffh, 0ffh, 0ffh
        else
        db      0b0h, 005h, 000h, 0fbh, 04ch, 004h, 0cbh, 090h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 00ah, 000h, 037h, 0b9h, 090h, 003h, 00fh, 091h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 06bh, 0f3h, 06ch, 007h, 048h, 091h, 000h, 000h, 05ah, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 03bh, 0f2h, 0b0h, 006h, 0beh, 091h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ch, 000h, 00eh, 0e7h, 04ch, 004h, 029h, 092h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 02eh, 0b8h, 058h, 004h
        db      06dh, 092h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00dh, 000h, 01ch, 0e3h
        db      054h, 004h, 0b2h, 092h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      0edh, 0b6h, 0e8h, 03eh, 0f7h, 092h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      0ffh, 0ffh, 0ffh, 0ffh, 006h, 000h, 081h, 0fbh, 00ch, 000h, 022h, 0b7h, 0ffh, 0ffh, 0ffh, 0ffh
        db      078h, 000h, 00ah, 000h, 094h, 011h, 054h, 08fh, 0b0h, 000h, 076h, 0fbh, 0ffh, 0ffh, 0ffh, 0ffh
        endif
        db      0cbh, 090h, 001h, 000h, 008h, 000h, 0ebh, 030h, 010h
        db      "COPYRIGHT (C) 1983 KADAK PRODUCTS LTD."
        if      FW_VERSION >= 312
        db      090h, 0bah, 000h, 075h, 0fbh
        elseif  FW_VERSION = 311
        db      090h, 0b8h, 000h, 075h, 0fbh
        else
        db      090h, 0b2h, 000h, 076h, 0fbh
        endif
FP_fb83c:
        if      FW_VERSION >= 312
        db      004h, 000h, 031h, 0a8h, 02eh, 0c5h, 03eh, 03ch, 000h, 02eh, 0c4h, 036h, 038h, 000h, 026h, 08bh
        elseif  FW_VERSION = 311
        db      004h, 000h, 025h, 0a8h, 02eh, 0c5h, 03eh, 03ah, 000h, 02eh, 0c4h, 036h, 036h, 000h, 026h, 08bh
        else
        db      0a2h, 0e7h, 010h, 080h, 02eh, 0c5h, 03eh, 034h, 000h, 02eh, 0c4h, 036h, 030h, 000h, 026h, 08bh
        endif
        db      014h, 089h, 015h
        db      "FFGG"
        db      08bh, 0dah, 003h, 0dbh, 003h, 0dah, 003h, 0dbh, 003h, 0dfh, 042h, 04ah, 074h, 005h, 0e8h, 003h
        db      000h, 0ebh, 0f8h, 0cbh, 006h, 0b8h, 0ffh, 0ffh, 089h, 005h, 089h, 045h, 002h, 089h, 05dh, 004h
        if      FW_VERSION >= 312
        db      026h, 08bh, 00ch, 08ch, 0d8h, 08eh, 0c0h, 0b0h, 002h, 09ah, 051h, 006h, 000h, 0fbh, 083h, 0c7h
        elseif  FW_VERSION = 311
        db      026h, 08bh, 00ch, 08ch, 0d8h, 08eh, 0c0h, 0b0h, 002h, 09ah, 04fh, 006h, 000h, 0fbh, 083h, 0c7h
        else
        db      026h, 08bh, 00ch, 08ch, 0d8h, 08eh, 0c0h, 0b0h, 002h, 09ah, 059h, 006h, 000h, 0fbh, 083h, 0c7h
        endif
        db      006h, 046h, 046h, 003h, 0c9h, 083h, 0c3h, 008h, 003h, 0d9h, 007h, 0c3h
        if      FW_VERSION >= 312
        phase   8fh
        elseif  FW_VERSION = 311
        phase   8dh
        else
        phase   87h
        endif
far_fb88f:
        call    fn_fb903
        jnz     loop_fb8c7
        callf   0fb00h:far_fb548
        pushf
        cli
        inc     word ptr [di]
        jnz     br_fb8a4
        mov     byte ptr [di + 2], al
        jmp     loop_fb8c2
br_fb8a4:
        cmp     al, byte ptr [di + 2]
        jz      br_fb8c0
        mov     cx, ax
        callf   0fb00h:far_fb6af
        js      br_fb8b9
        callf   0fb00h:far_fb45f
        jmp     loop_fb8c2
br_fb8b9:
        dec     word ptr [di]
        mov     ax, 0fff5h
        jmp     br_fb8c4
br_fb8c0:
        dec     word ptr [di]
loop_fb8c2:
        xor     ax, ax
br_fb8c4:
        popf
br_fb8c5:
        or      ax, ax
loop_fb8c7:
        pop     di
        pop     bx
        pop     cx
        pop     es
        pop     ds
        retf
far_fb8cd:
        call    fn_fb903
        jnz     loop_fb8c7
        callf   0fb00h:far_fb548
        cmp     al, byte ptr [di + 2]
        jz      br_fb8e1
        mov     ax, 0fff4h
        jmp     br_fb8c5
br_fb8e1:
        pushf
        cli
        mov     byte ptr [di + 2], 0ffh
        dec     word ptr [di]
        js      loop_fb8c2
        callf   0fb00h:far_fb6de
        push    dx
        mov     dx, cx
        mov     byte ptr [di + 2], dl
        callf   0fb00h:far_fb4a2
        pop     dx
        callf   0fb00h:far_fb380
        jmp     loop_fb8c2
fn_fb903:
        pop     ax
        push    ds
        push    es
        push    cx
        push    bx
        push    di
        push    ax
        if      FW_VERSION >= 311
        lds     di, dword ptr cs:[FP_fb83c-800h]
        else
        lds     di, dword ptr cs:[FP_fb83c-810h]
        endif
        mov     ax, dx
        dec     ax
        cmp     ax, word ptr [di]
        jnc     br_fb92c
        mov     bx, ax
        add     ax, ax
        add     ax, bx
        add     ax, ax
        inc     ax
        inc     ax
        add     di, ax
        mov     bx, word ptr [di + 4]
        mov     ax, ds
        mov     es, ax
        xor     ax, ax
        ret
br_fb92c:
        mov     ax, 0fff6h
        or      ax, ax
        ret
        if      FW_VERSION >= 312
        phase   2
        elseif  FW_VERSION = 311
        phase   0
        else
        phase   0ah
        endif
far_fb932:
        mov     ax, 7fffh
        sub     ax, 6dfh
        cmp     ax, 1
        jnz     br_fb946
        mov     ax, 200h
        if      FW_VERSION >= 312
        mov     bx, 7000h
        else
        mov     bx, 6fffh
        endif
        jmp     br_fb94c
        db      090h
br_fb946:
        mov     ax, 6dfh
        mov     bx, 7fffh
br_fb94c:
        xor     dx, dx
        mov     cx, 4
loop_fb951:
        shl     ax, 1
        rcl     dx, 1
        loop    loop_fb951
        ror     dx, 4
        mov     word ptr [W_8C39], ax
        mov     word ptr [W_8C3B], dx
        sub     dx, dx
        mov     ax, bx
        mov     cx, 4
loop_fb968:
        shl     ax, 1
        rcl     dx, 1
        loop    loop_fb968
        add     ax, 0eh
        adc     dx, 0
        ror     dx, 4
        mov     word ptr [W_8C3D], ax
        mov     word ptr [W_8C3F], dx
        retf
isr_fb97f:
        push    ax
        push    dx
        int     42h
        mov     dx, 0c010h
        mov     al, 60h
        out     dx, al
        pop     dx
        pop     ax
        iret
far_fb98c:
        push    bp
        mov     bp, sp
        push    es
        sub     ax, ax
        mov     ax, 7fffh
        sub     ax, 6dfh
        cmp     ax, 1
        jz      br_fb9f3
        cli
        mov     dx, 0c011h
        mov     al, 0f6h
        out     dx, al
        mov     ax, 0fb93h
        mov     es, ax
        if      FW_VERSION >= 312
        mov     bx, 4fh
        elseif  FW_VERSION = 311
        mov     bx, 4dh
        else
        mov     bx, 57h
        endif
        mov     dl, 8
        callf   0fb00h:far_fb33d
        lds     dx, dword ptr [bp + 6]
        cli
        mov     ax, 40h
        mov     ss, ax
        mov     sp, 69c4h
        sti
        int     10h
        mov     ax, SEG_6900
        mov     es, ax
        int     45h
        or      ah, ah
        jnz     br_fb9ef
        cli
        mov     ax, si
        or      ax, di
        jz      br_fb9d8
        mov     ss, si
        mov     sp, di
br_fb9d8:
        mov     dx, 0c011h
        mov     al, 0ffh
        out     dx, al
        mov     ax, 40h
        mov     ds, ax
        mov     word ptr [68c0h], bx
        mov     word ptr [68c2h], es
        jmpf    dword ptr [68c0h]
br_fb9ef:
        int     11h
        jmp     br_fb9ef
br_fb9f3:
        pop     es
        pop     bp
        retf
        if      FW_VERSION >= 312
        db      058h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        db      0ffh, 0ffh, 0ffh, 0ffh
        phase   0ah
far_fba0a:
        push    bp
        mov     bp, sp
        sub     sp, 2c0h
        push    si
        push    di
        push    1
        callf   SEG_D793:far_d796d
        add     sp, 2
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
        lea     ax, [bp - 2c0h]
        push    ax
        push    ss
        lea     ax, [bp - 0bch]
        push    ax
        nop
        push    cs
        call    far_fdcfb
        add     sp, 0ah
        mov     di, ax
        mov     al, byte ptr [W_E21D]
        mov     byte ptr [bp - 2], al
        cmp     word ptr [W_E21D], di
        jl      br_fba78
        mov     byte ptr [bp - 2], 0
br_fba78:
        push    10h
        push    ss
        lea     ax, [bp - 2c0h]
        push    ax
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ds
        push    word STR_3490
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     si, ax
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        add     ax, 4800h
        mov     word ptr [bp - 3ah], SEG_A28F
        mov     word ptr [bp - 3ch], ax
        cmp     di, 0ffffh
        jz      br_fbac8
        push    1fh
        push    0
        mov     al, byte ptr ss:[si]
        push    ax
        nop
        push    cs
        call    far_fcd4d
        add     sp, 6
br_fbac8:
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
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 16h]
        mov     dx, word ptr es:[bx + 14h]
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        cmp     di, 0ffffh
        jnz     br_fbb0c
        mov     word ptr [bp - 26h], 0
        mov     word ptr [bp - 28h], 0
br_fbb0c:
        push    word ptr [bp - 26h]
        push    word ptr [bp - 28h]
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        push    2
        push    word 3e7h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 14h]
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
        lea     ax, [bp - 16h]
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
        lea     ax, [bp - 18h]
        push    ax
        push    ds
        push    word P_34CD
        callf   SEG_B347:far_b3819
        add     sp, 10h
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 1eh]
        mov     dx, word ptr es:[bx + 1ch]
        mov     word ptr [bp - 2eh], ax
        mov     word ptr [bp - 30h], dx
        mov     ax, word ptr [W_E582]
        mov     dx, word ptr [W_E580]
        cmp     ax, word ptr [bp - 2eh]
        jl      br_fbb9d
        jg      br_fbb90
        cmp     dx, word ptr [bp - 30h]
        jbe     br_fbb9d
br_fbb90:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [W_E582], ax
        mov     word ptr [W_E580], dx
br_fbb9d:
        cmp     word ptr [W_E582], 0
        jg      br_fbbb9
        jl      br_fbbad
        cmp     word ptr [W_E580], 0
        jnc     br_fbbb9
br_fbbad:
        mov     word ptr [W_E582], 0
        mov     word ptr [W_E580], 0
br_fbbb9:
        push    15h
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [W_E582]
        push    word ptr [W_E580]
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        push    2
        push    word 3e7h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 8]
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
        lea     ax, [bp - 0ah]
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
        lea     ax, [bp - 0ch]
        push    ax
        push    ds
        push    word P_34CD
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 1ah]
        mov     dx, word ptr es:[bx + 18h]
        mov     word ptr [bp - 2ah], ax
        mov     word ptr [bp - 2ch], dx
        cmp     di, 0ffffh
        jnz     br_fbc53
        mov     word ptr [bp - 2ah], 0
        mov     word ptr [bp - 2ch], 0
br_fbc53:
        push    word ptr [bp - 2ah]
        push    word ptr [bp - 2ch]
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        push    2
        push    word 3e7h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 1ah]
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
        lea     ax, [bp - 1ch]
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
        lea     ax, [bp - 1eh]
        push    ax
        push    ds
        push    word P_34CD
        callf   SEG_B347:far_b3819
        add     sp, 10h
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        cmp     ax, word ptr [bp - 2eh]
        jl      br_fbcd3
        jg      br_fbcc6
        cmp     dx, word ptr [bp - 30h]
        jbe     br_fbcd3
br_fbcc6:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [W_E57E], ax
        mov     word ptr [W_E57C], dx
br_fbcd3:
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        cmp     ax, word ptr [W_E582]
        jg      br_fbcf6
        jl      br_fbce8
        cmp     dx, word ptr [W_E580]
        jnc     br_fbcf6
br_fbce8:
        mov     ax, word ptr [W_E582]
        mov     dx, word ptr [W_E580]
        mov     word ptr [W_E57E], ax
        mov     word ptr [W_E57C], dx
br_fbcf6:
        cmp     word ptr [W_E57E], 0
        jg      br_fbd12
        jl      br_fbd06
        cmp     word ptr [W_E57C], 0
        jnc     br_fbd12
br_fbd06:
        mov     word ptr [W_E57E], 0
        mov     word ptr [W_E57C], 0
br_fbd12:
        push    15h
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [W_E57E]
        push    word ptr [W_E57C]
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        push    2
        push    word 3e7h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 0eh]
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
        lea     ax, [bp - 10h]
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
        lea     ax, [bp - 12h]
        push    ax
        push    ds
        push    word P_34CD
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     di, 0ffffh
        jnz     br_fbd9b
        mov     word ptr [bp - 2eh], 0
        mov     word ptr [bp - 30h], 0
br_fbd9b:
        push    word ptr [bp - 2eh]
        push    word ptr [bp - 30h]
        push    ss
        lea     ax, [bp - 24h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        push    word ptr [bp - 24h]
        push    word ptr [bp - 22h]
        push    word ptr [bp - 20h]
        push    ds
        push    word STR_34ED
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ah
        push    15h
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     byte ptr [B_E57B], 7
        jl      br_fbddb
        mov     byte ptr [B_E57B], 1
br_fbddb:
        push    0ch
        push    ds
        push    word P_3344
        push    ds
        push    word B_E57B
        push    ds
        push    word STR_3505
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        les     bx, dword ptr [bp - 3ch]
        mov     al, byte ptr es:[bx + 11h]
        mov     byte ptr [bp - 3], al
        cmp     di, 0ffffh
        jnz     br_fbe10
        mov     byte ptr [bp - 3], 64h
br_fbe10:
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
        les     bx, dword ptr [bp - 3ch]
        mov     al, byte ptr es:[bx + 12h]
        cbw
        mov     word ptr [bp - 6], ax
        cmp     di, 0ffffh
        jnz     br_fbe4b
        mov     word ptr [bp - 6], 0
br_fbe4b:
        push    0
        push    78h
        push    0ff88h
        push    4
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word STR_3513
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    15h
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     byte ptr [B_E57A], 8
        jl      br_fbe7c
        mov     byte ptr [B_E57A], 0
br_fbe7c:
        push    10h
        push    ds
        push    word P_3364
        push    ds
        push    word B_E57A
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
        jmp     br_fcc07
br_fbec9:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     bx, ax
        cmp     bx, 0fh
        jbe     br_fbed7
        jmp     tgt_fc231
br_fbed7:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_fcc60]
tgt_fbede:
        cmp     di, 0ffffh
        jnz     br_fbee6
        jmp     tgt_fc231
br_fbee6:
        mov     al, byte ptr [bp - 2]
        cbw
        mov     si, ax
        mov     word ptr [W_E21D], ax
        mov     bx, si
        lea     ax, [bp - 0bch]
        add     bx, ax
        mov     si, bx
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        add     ax, 4800h
        mov     word ptr [bp - 3ah], SEG_A28F
        mov     word ptr [bp - 3ch], ax
        push    1fh
        push    0
        mov     al, byte ptr ss:[si]
        push    ax
        nop
        push    cs
        call    far_fcd4d
        add     sp, 6
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 16h]
        mov     dx, word ptr es:[bx + 14h]
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 1ah]
        mov     dx, word ptr es:[bx + 18h]
        mov     word ptr [bp - 2ah], ax
        mov     word ptr [bp - 2ch], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 1eh]
        mov     dx, word ptr es:[bx + 1ch]
        mov     word ptr [bp - 2eh], ax
        mov     word ptr [bp - 30h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 24h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 24h]
        push    word ptr [bp - 22h]
        push    word ptr [bp - 20h]
        push    ds
        push    word STR_34ED
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ah
        les     bx, dword ptr [bp - 3ch]
        mov     al, byte ptr es:[bx + 11h]
        mov     byte ptr [bp - 3], al
        mov     al, byte ptr es:[bx + 12h]
        cbw
        mov     word ptr [bp - 6], ax
        mov     ax, word ptr [W_E582]
        mov     dx, word ptr [W_E580]
        cmp     ax, word ptr [bp - 2eh]
        jl      br_fbfdf
        jg      br_fbfc3
        cmp     dx, word ptr [bp - 30h]
        jbe     br_fbfdf
br_fbfc3:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [W_E582], ax
        mov     word ptr [W_E580], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fbfdf:
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        cmp     ax, word ptr [bp - 2eh]
        jl      br_fc00e
        jg      br_fbff2
        cmp     dx, word ptr [bp - 30h]
        jbe     br_fc00e
br_fbff2:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [W_E57E], ax
        mov     word ptr [W_E57C], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fc00e:
        nop
        push    cs
        call    fn_fcd29
        jmp     tgt_fc231
tgt_fc016:
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        nop
        push    cs
        call    fn_fdb22
        add     sp, 4
        mov     word ptr [bp - 26h], dx
        mov     word ptr [bp - 28h], ax
        mov     ax, word ptr [bp - 26h]
        mov     dx, word ptr [bp - 28h]
        cmp     ax, word ptr [bp - 2eh]
        jl      br_fc056
        jg      br_fc03b
        cmp     dx, word ptr [bp - 30h]
        jbe     br_fc056
br_fc03b:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fc056:
        mov     ax, word ptr [bp - 26h]
        mov     dx, word ptr [bp - 28h]
        cmp     ax, word ptr [bp - 2ah]
        jl      br_fc083
        jg      br_fc068
        cmp     dx, word ptr [bp - 2ch]
        jbe     br_fc083
br_fc068:
        mov     ax, word ptr [bp - 26h]
        mov     dx, word ptr [bp - 28h]
        mov     word ptr [bp - 2ah], ax
        mov     word ptr [bp - 2ch], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fc083:
        nop
        push    cs
        call    fn_fcd29
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr [bp - 26h]
        mov     dx, word ptr [bp - 28h]
        mov     word ptr es:[bx + 16h], ax
        mov     word ptr es:[bx + 14h], dx
        jmp     tgt_fc231
tgt_fc09c:
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        nop
        push    cs
        call    fn_fdb22
        add     sp, 4
        mov     word ptr [W_E582], dx
        mov     word ptr [W_E580], ax
        mov     ax, word ptr [W_E582]
        mov     dx, word ptr [W_E580]
        cmp     ax, word ptr [bp - 2eh]
        jl      br_fc0df
        jg      br_fc0c3
        cmp     dx, word ptr [bp - 30h]
        jbe     br_fc0df
br_fc0c3:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [W_E582], ax
        mov     word ptr [W_E580], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fc0df:
        mov     ax, word ptr [W_E582]
        mov     dx, word ptr [W_E580]
        cmp     ax, word ptr [W_E57E]
        jl      br_fc111
        jg      br_fc0f4
        cmp     dx, word ptr [W_E57C]
        jbe     br_fc111
br_fc0f4:
        mov     ax, word ptr [W_E582]
        mov     dx, word ptr [W_E580]
        mov     word ptr [W_E57E], ax
        mov     word ptr [W_E57C], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fc111:
        nop
        push    cs
        call    fn_fcd29
        jmp     tgt_fc231
tgt_fc119:
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        nop
        push    cs
        call    fn_fdb22
        add     sp, 4
        mov     word ptr [bp - 2ah], dx
        mov     word ptr [bp - 2ch], ax
        mov     ax, word ptr [bp - 2ah]
        mov     dx, word ptr [bp - 2ch]
        cmp     ax, word ptr [bp - 2eh]
        jl      br_fc159
        jg      br_fc13e
        cmp     dx, word ptr [bp - 30h]
        jbe     br_fc159
br_fc13e:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [bp - 2ah], ax
        mov     word ptr [bp - 2ch], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fc159:
        mov     ax, word ptr [bp - 2ah]
        mov     dx, word ptr [bp - 2ch]
        cmp     ax, word ptr [bp - 26h]
        jg      br_fc186
        jl      br_fc16b
        cmp     dx, word ptr [bp - 28h]
        jnc     br_fc186
br_fc16b:
        mov     ax, word ptr [bp - 2ah]
        mov     dx, word ptr [bp - 2ch]
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fc186:
        nop
        push    cs
        call    fn_fcd29
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr [bp - 2ah]
        mov     dx, word ptr [bp - 2ch]
        mov     word ptr es:[bx + 1ah], ax
        mov     word ptr es:[bx + 18h], dx
        jmp     near tgt_fc231
tgt_fc19f:
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        nop
        push    cs
        call    fn_fdb22
        add     sp, 4
        mov     word ptr [W_E57E], dx
        mov     word ptr [W_E57C], ax
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        cmp     ax, word ptr [bp - 2eh]
        jl      br_fc1e2
        jg      br_fc1c6
        cmp     dx, word ptr [bp - 30h]
        jbe     br_fc1e2
br_fc1c6:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [W_E57E], ax
        mov     word ptr [W_E57C], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fc1e2:
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        cmp     ax, word ptr [W_E582]
        jg      br_fc214
        jl      br_fc1f7
        cmp     dx, word ptr [W_E580]
        jnc     br_fc214
br_fc1f7:
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        mov     word ptr [W_E582], ax
        mov     word ptr [W_E580], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fc214:
        nop
        push    cs
        call    fn_fcd29
        jmp     tgt_fc231
tgt_fc21b:
        les     bx, dword ptr [bp - 3ch]
        mov     al, byte ptr [bp - 3]
        mov     byte ptr es:[bx + 11h], al
        jmp     tgt_fc231
tgt_fc227:
        les     bx, dword ptr [bp - 3ch]
        mov     al, byte ptr [bp - 6]
        mov     byte ptr es:[bx + 12h], al
tgt_fc231:
        push    44h
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     byte ptr [bp - 1], al
        or      al, al
        jnz     br_fc245
        jmp     br_fbec9
br_fc245:
        cbw
        cmp     ax, 78h
        jz      br_fc278
        jg      br_fc268
        cmp     ax, 44h
        jnz     br_fc255
        jmp     br_fcaae
br_fc255:
        cmp     ax, 4eh
        jnz     br_fc25d
        jmp     br_fcaae
br_fc25d:
        cmp     ax, 75h
        jnz     br_fc265
        jmp     br_fc4f6
br_fc265:
        jmp     br_fcc07
br_fc268:
        cmp     ax, 79h
        jz      br_fc2b1
        cmp     ax, 7ah
        jnz     br_fc275
        jmp     near br_fc31e
br_fc275:
        jmp     br_fcc07
br_fc278:
        mov     byte ptr [bp - 1], 0
        cmp     di, 0ffffh
        jnz     br_fc284
        jmp     br_fcc07
br_fc284:
        callf   SEG_CB8A:far_cc60f
        or      ax, ax
        jz      br_fc295
        callf   SEG_CB8A:far_cc62d
        jmp     br_fcc07
br_fc295:
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        callf   SEG_CB8A:far_cc583
        add     sp, 2
        jmp     br_fcc07
br_fc2b1:
        mov     byte ptr [bp - 1], 0
        cmp     di, 0ffffh
        jnz     br_fc2bd
        jmp     br_fcc07
br_fc2bd:
        push    ss
        lea     ax, [bp - 28h]
        push    ax
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    fn_fde02
        add     sp, 6
        mov     byte ptr [bp - 1], al
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, word ptr [bp - 26h]
        mov     cx, word ptr [bp - 28h]
        mov     es, dx
        xchg    bx, ax
        mov     word ptr es:[bx + 4816h], ax
        mov     word ptr es:[bx + 4814h], cx
        cmp     byte ptr [bp - 1], 4ch
        jz      br_fc311
        jmp     br_fcc07
br_fc311:
        push    36h
        callf   SEG_D79E:far_d7a63
        add     sp, 2
        jmp     br_fcc07
br_fc31e:
        mov     byte ptr [bp - 1], 0
        cmp     di, 0ffffh
        jnz     br_fc32a
        jmp     br_fcc07
br_fc32a:
        mov     ax, word ptr [bp - 26h]
        mov     dx, word ptr [bp - 28h]
        mov     word ptr [bp - 32h], ax
        mov     word ptr [bp - 34h], dx
        mov     ax, word ptr [bp - 2ah]
        mov     dx, word ptr [bp - 2ch]
        mov     word ptr [bp - 36h], ax
        mov     word ptr [bp - 38h], dx
        mov     al, byte ptr [B_E57B]
        cbw
        mov     bx, ax
        cmp     bx, 6
        jbe     br_fc350
        jmp     br_fc4d4
br_fc350:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_fcc52]
tgt_fc357:
        les     bx, dword ptr [bp - 3ch]
        mov     word ptr es:[bx + 16h], 0
        mov     word ptr es:[bx + 14h], 0
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr es:[bx + 1ah], ax
        mov     word ptr es:[bx + 18h], dx
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        nop
        push    cs
        call    fn_fcc80
        add     sp, 2
        jmp     br_fc4d4
tgt_fc390:
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr [W_E582]
        mov     dx, word ptr [W_E580]
        mov     word ptr es:[bx + 16h], ax
        mov     word ptr es:[bx + 14h], dx
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        mov     word ptr es:[bx + 1ah], ax
        mov     word ptr es:[bx + 18h], dx
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        nop
        push    cs
        call    fn_fcc80
        add     sp, 2
        jmp     br_fc4d4
tgt_fc3cd:
        push    ds
        push    word STR_356C
        callf   SEG_CC84:far_cd551
        add     sp, 4
        mov     dl, al
        or      al, al
        jge     br_fc3e2
        jmp     br_fc4d4
br_fc3e2:
        cbw
        push    ax
        nop
        push    cs
        call    fn_fcc80
        add     sp, 2
        jmp     br_fc4d4
tgt_fc3ef:
        les     bx, dword ptr [bp - 3ch]
        mov     word ptr es:[bx + 16h], 0
        mov     word ptr es:[bx + 14h], 0
        mov     ax, word ptr [W_E582]
        mov     dx, word ptr [W_E580]
        mov     word ptr es:[bx + 1ah], ax
        mov     word ptr es:[bx + 18h], dx
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        nop
        push    cs
        call    fn_fcc80
        add     sp, 2
        jmp     near br_fc4d4
tgt_fc429:
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        mov     word ptr es:[bx + 16h], ax
        mov     word ptr es:[bx + 14h], dx
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr es:[bx + 1ah], ax
        mov     word ptr es:[bx + 18h], dx
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        nop
        push    cs
        call    fn_fcc80
        add     sp, 2
        jmp     br_fc4d4
tgt_fc464:
        les     bx, dword ptr [bp - 3ch]
        mov     word ptr es:[bx + 16h], 0
        mov     word ptr es:[bx + 14h], 0
        mov     ax, word ptr [bp - 26h]
        mov     dx, word ptr [bp - 28h]
        mov     word ptr es:[bx + 1ah], ax
        mov     word ptr es:[bx + 18h], dx
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        nop
        push    cs
        call    fn_fcc80
        add     sp, 2
        jmp     br_fc4d4
tgt_fc49c:
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr [bp - 2ah]
        mov     dx, word ptr [bp - 2ch]
        mov     word ptr es:[bx + 16h], ax
        mov     word ptr es:[bx + 14h], dx
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr es:[bx + 1ah], ax
        mov     word ptr es:[bx + 18h], dx
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        nop
        push    cs
        call    fn_fcc80
        add     sp, 2
br_fc4d4:
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr [bp - 32h]
        mov     dx, word ptr [bp - 34h]
        mov     word ptr es:[bx + 16h], ax
        mov     word ptr es:[bx + 14h], dx
        mov     ax, word ptr [bp - 36h]
        mov     dx, word ptr [bp - 38h]
        mov     word ptr es:[bx + 1ah], ax
        mov     word ptr es:[bx + 18h], dx
        jmp     br_fcc07
br_fc4f6:
        mov     byte ptr [bp - 1], 0
        cmp     di, 0ffffh
        jnz     br_fc502
        jmp     br_fcc07
br_fc502:
        mov     al, byte ptr [B_E57A]
        cbw
        mov     bx, ax
        cmp     bx, 7
        jbe     br_fc510
        jmp     br_fcc07
br_fc510:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_fcc42]
tgt_fc517:
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        cmp     ax, word ptr [W_E582]
        jg      br_fc532
        jz      br_fc529
        jmp     br_fcc07
br_fc529:
        cmp     dx, word ptr [W_E580]
        ja      br_fc532
        jmp     br_fcc07
br_fc532:
        push    word ptr [W_E57E]
        push    word ptr [W_E57C]
        push    word ptr [W_E582]
        push    word ptr [W_E580]
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    fn_fcd96
        add     sp, 0ah
        mov     si, ax
        or      si, si
        jl      br_fc563
        jmp     br_fcc07
br_fc563:
        callf   SEG_B1AA:far_b1af9
        mov     ax, si
        mov     dx, 0ffffh
        imul    dx
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        callf   SEG_B1AA:far_b1aff
        jmp     br_fcc07
tgt_fc580:
        push    word ptr [W_E582]
        push    word ptr [W_E580]
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    fn_fcf15
        add     sp, 6
        mov     si, ax
        or      si, si
        jge     br_fc5c0
        callf   SEG_B1AA:far_b1af9
        mov     ax, si
        mov     dx, 0ffffh
        imul    dx
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        callf   SEG_B1AA:far_b1aff
br_fc5c0:
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 16h]
        mov     dx, word ptr es:[bx + 14h]
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 1ah]
        mov     dx, word ptr es:[bx + 18h]
        mov     word ptr [bp - 2ah], ax
        mov     word ptr [bp - 2ch], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        nop
        push    cs
        call    fn_fcd29
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 1eh]
        mov     dx, word ptr es:[bx + 1ch]
        mov     word ptr [bp - 2eh], ax
        mov     word ptr [bp - 30h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 24h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 24h]
        push    word ptr [bp - 22h]
        push    word ptr [bp - 20h]
        push    ds
        push    word STR_34ED
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ah
        jmp     br_fcc07
tgt_fc649:
        push    word ptr [W_E57E]
        push    word ptr [W_E57C]
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    fn_fcf15
        add     sp, 6
        mov     si, ax
        or      si, si
        jge     br_fc689
        callf   SEG_B1AA:far_b1af9
        mov     ax, si
        mov     dx, 0ffffh
        imul    dx
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        callf   SEG_B1AA:far_b1aff
br_fc689:
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 16h]
        mov     dx, word ptr es:[bx + 14h]
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 1ah]
        mov     dx, word ptr es:[bx + 18h]
        mov     word ptr [bp - 2ah], ax
        mov     word ptr [bp - 2ch], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        nop
        push    cs
        call    fn_fcd29
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 1eh]
        mov     dx, word ptr es:[bx + 1ch]
        mov     word ptr [bp - 2eh], ax
        mov     word ptr [bp - 30h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 24h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 24h]
        push    word ptr [bp - 22h]
        push    word ptr [bp - 20h]
        push    ds
        push    word STR_34ED
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ah
        jmp     br_fcc07
tgt_fc712:
        push    word ptr [W_E57E]
        push    word ptr [W_E57C]
        push    word ptr [W_E582]
        push    word ptr [W_E580]
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    fn_fd7ef
        add     sp, 0ah
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 16h]
        mov     dx, word ptr es:[bx + 14h]
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 1ah]
        mov     dx, word ptr es:[bx + 18h]
        mov     word ptr [bp - 2ah], ax
        mov     word ptr [bp - 2ch], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        nop
        push    cs
        call    fn_fcd29
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 1eh]
        mov     dx, word ptr es:[bx + 1ch]
        mov     word ptr [bp - 2eh], ax
        mov     word ptr [bp - 30h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 24h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 24h]
        push    word ptr [bp - 22h]
        push    word ptr [bp - 20h]
        push    ds
        push    word STR_34ED
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ah
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        cmp     ax, word ptr [bp - 2eh]
        jge     br_fc7cf
        jmp     br_fcc07
br_fc7cf:
        jg      br_fc7d9
        cmp     dx, word ptr [bp - 30h]
        ja      br_fc7d9
        jmp     br_fcc07
br_fc7d9:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [W_E57E], ax
        mov     word ptr [W_E57C], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        nop
        push    cs
        call    fn_fcd29
        jmp     br_fcc07
tgt_fc7fd:
        push    word ptr [bp - 26h]
        push    word ptr [bp - 28h]
        push    0
        push    0
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    fn_fd7ef
        add     sp, 0ah
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
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
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
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
        mov     word ptr [bp - 2ah], ax
        mov     word ptr [bp - 2ch], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
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
        mov     word ptr [bp - 2eh], ax
        mov     word ptr [bp - 30h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 24h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 24h]
        push    word ptr [bp - 22h]
        push    word ptr [bp - 20h]
        push    ds
        push    word STR_34ED
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ah
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        cmp     ax, word ptr [bp - 2eh]
        jl      br_fc920
        jg      br_fc904
        cmp     dx, word ptr [bp - 30h]
        jbe     br_fc920
br_fc904:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [W_E57E], ax
        mov     word ptr [W_E57C], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fc920:
        nop
        push    cs
        call    fn_fcd29
        jmp     br_fcc07
tgt_fc928:
        push    word ptr [bp - 2eh]
        push    word ptr [bp - 30h]
        push    word ptr [bp - 2ah]
        push    word ptr [bp - 2ch]
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    fn_fd7ef
        add     sp, 0ah
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
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
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
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
        mov     word ptr [bp - 2ah], ax
        mov     word ptr [bp - 2ch], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
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
        mov     word ptr [bp - 2eh], ax
        mov     word ptr [bp - 30h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 24h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 24h]
        push    word ptr [bp - 22h]
        push    word ptr [bp - 20h]
        push    ds
        push    word STR_34ED
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ah
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        cmp     ax, word ptr [bp - 2eh]
        jl      br_fca4d
        jg      br_fca31
        cmp     dx, word ptr [bp - 30h]
        jbe     br_fca4d
br_fca31:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [W_E57E], ax
        mov     word ptr [W_E57C], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fca4d:
        nop
        push    cs
        call    fn_fcd29
        jmp     br_fcc07
tgt_fca55:
        push    word ptr [W_E57E]
        push    word ptr [W_E57C]
        push    word ptr [W_E582]
        push    word ptr [W_E580]
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    fn_fd677
        add     sp, 0ah
        jmp     br_fcc07
tgt_fca80:
        push    word ptr [W_E57E]
        push    word ptr [W_E57C]
        push    word ptr [W_E582]
        push    word ptr [W_E580]
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    fn_fd3b7
        add     sp, 0ah
        jmp     br_fcc07
fn_fcaab:
        jmp     br_fcc07
br_fcaae:
        mov     byte ptr [bp - 1], 0
        cmp     di, 0ffffh
        jnz     br_fcaba
        jmp     br_fcc07
br_fcaba:
        push    ss
        lea     ax, [bp - 0bch]
        push    ax
        mov     al, byte ptr [B_D4C0]
        cbw
        push    ax
        callf   SEG_C495:far_c529a
        add     sp, 6
        mov     byte ptr [bp - 2], al
        or      al, al
        jnz     br_fcad7
        jmp     br_fcc07
br_fcad7:
        dec     byte ptr [bp - 2]
        mov     al, byte ptr [bp - 2]
        cbw
        mov     si, ax
        mov     word ptr [W_E21D], ax
        mov     bx, si
        lea     ax, [bp - 0bch]
        add     bx, ax
        mov     si, bx
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        add     ax, 4800h
        mov     word ptr [bp - 3ah], SEG_A28F
        mov     word ptr [bp - 3ch], ax
        push    1fh
        push    0
        mov     al, byte ptr ss:[si]
        push    ax
        nop
        push    cs
        call    far_fcd4d
        add     sp, 6
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 16h]
        mov     dx, word ptr es:[bx + 14h]
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 1ah]
        mov     dx, word ptr es:[bx + 18h]
        mov     word ptr [bp - 2ah], ax
        mov     word ptr [bp - 2ch], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 1eh]
        mov     dx, word ptr es:[bx + 1ch]
        mov     word ptr [bp - 2eh], ax
        mov     word ptr [bp - 30h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 24h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 24h]
        push    word ptr [bp - 22h]
        push    word ptr [bp - 20h]
        push    ds
        push    word STR_34ED
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ah
        les     bx, dword ptr [bp - 3ch]
        mov     al, byte ptr es:[bx + 11h]
        mov     byte ptr [bp - 3], al
        mov     al, byte ptr es:[bx + 12h]
        cbw
        mov     word ptr [bp - 6], ax
        mov     ax, word ptr [W_E582]
        mov     dx, word ptr [W_E580]
        cmp     ax, word ptr [bp - 2eh]
        jl      br_fcbd3
        jg      br_fcbb7
        cmp     dx, word ptr [bp - 30h]
        jbe     br_fcbd3
br_fcbb7:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [W_E582], ax
        mov     word ptr [W_E580], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fcbd3:
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        cmp     ax, word ptr [bp - 2eh]
        jl      br_fcc02
        jg      br_fcbe6
        cmp     dx, word ptr [bp - 30h]
        jbe     br_fcc02
br_fcbe6:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [W_E57E], ax
        mov     word ptr [W_E57C], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fcc02:
        nop
        push    cs
        call    fn_fcd29
br_fcc07:
        cmp     byte ptr [bp - 1], 0
        jnz     br_fcc10
        jmp     tgt_fc231
br_fcc10:
        push    ds
        push    word STR_356C
        callf   SEG_CC84:far_cd551
        add     sp, 4
        mov     dl, al
        or      al, al
        jl      br_fcc30
        push    1
        push    0
        cbw
        push    ax
        callf   SEG_CC84:far_cd353
        add     sp, 6
br_fcc30:
        push    0
        callf   SEG_D793:far_d796d
        add     sp, 2
        mov     al, byte ptr [bp - 1]
        cbw
        pop     di
        pop     si
        leave
        retf
TBL_fcc42:
        dw      tgt_fc517
        dw      tgt_fc580
        dw      tgt_fc649
        dw      tgt_fc712
        dw      tgt_fc7fd
        dw      tgt_fc928
        dw      tgt_fca55
        dw      tgt_fca80
TBL_fcc52:
        dw      tgt_fc357
        dw      tgt_fc390
        dw      tgt_fc3cd
        dw      tgt_fc3ef
        dw      tgt_fc429
        dw      tgt_fc464
        dw      tgt_fc49c
TBL_fcc60:
        dw      tgt_fbede
        dw      tgt_fc016
        dw      tgt_fc016
        dw      tgt_fc016
        dw      tgt_fc09c
        dw      tgt_fc09c
        dw      tgt_fc09c
        dw      tgt_fc119
        dw      tgt_fc119
        dw      tgt_fc119
        dw      tgt_fc19f
        dw      tgt_fc19f
        dw      tgt_fc19f
        dw      tgt_fc231
        dw      tgt_fc21b
        dw      tgt_fc227
fn_fcc80:
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
        jg      br_fcce1
        jnz     br_fcccd
        cmp     dx, word ptr es:[si + 481ch]
        ja      br_fcce1
br_fcccd:
        mov     ax, SEG_A28F
        mov     es, ax
        add     word ptr es:[si + 4818h], 557h
        adc     word ptr es:[si + 481ah], 0
        jmp     br_fccff
br_fcce1:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[si + 481eh]
        mov     dx, word ptr es:[si + 481ch]
        mov     bx, SEG_A28F
        mov     es, bx
        mov     word ptr es:[si + 481ah], ax
        mov     word ptr es:[si + 4818h], dx
br_fccff:
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
fn_fcd29:
        push    bp
        mov     bp, sp
        sub     sp, 2
        mov     word ptr [bp - 2], 0
        jmp     br_fcd45
loop_fcd36:
        mov     al, byte ptr [bp - 2]
        push    ax
        callf   SEG_B05A:far_b1073
        add     sp, 2
        inc     word ptr [bp - 2]
br_fcd45:
        cmp     word ptr [bp - 2], 10h
        jle     loop_fcd36
        leave
        retf
far_fcd4d:
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
        jnz     br_fcd88
        push    ds
        push    word STR_3579
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        pop     bp
        retf
br_fcd88:
        push    ds
        push    word STR_3579+5
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        pop     bp
        retf
fn_fcd96:
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
        jl      br_fcdbe
        push    1
        push    0
        cbw
        push    ax
        callf   SEG_CC84:far_cd353
        add     sp, 6
br_fcdbe:
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
        jge     br_fce07
        cbw
        pop     si
        leave
        retf
br_fce07:
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
        jnz     br_fcef8
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
br_fcef8:
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
fn_fcf15:
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
        jnz     br_fcf38
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_fcf38:
        mov     al, byte ptr [bp + 6]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        cmp     byte ptr es:[bx + 4813h], 0
        jz      br_fcf6f
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
        jmp     br_fcf88
br_fcf6f:
        mov     ax, word ptr [bp - 14h]
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     dx, word ptr es:[bx + 481eh]
        mov     ax, word ptr es:[bx + 481ch]
br_fcf88:
        push    ax
        push    dx
        callf   SEG_CC84:far_cca70
        pop     bx
        cmp     bx, dx
        pop     dx
        jl      br_fcfa2
        jg      br_fcf9b
        cmp     dx, ax
        jbe     br_fcfa2
br_fcf9b:
        mov     ax, 0fffeh
        pop     di
        pop     si
        leave
        retf
br_fcfa2:
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
        jnz     br_fd0c2
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
        jmp     br_fd109
br_fd0c2:
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
br_fd109:
        mov     word ptr [bp - 12h], 0
        xor     si, si
        mov     al, byte ptr [bp + 6]
        cbw
        mov     dx, 24h
        imul    dx
        mov     di, ax
loop_fd11b:
        mov     ax, SEG_A28F
        mov     es, ax
        cmp     byte ptr es:[si + 4800h], 0
        jz      br_fd173
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 4822h]
        mov     dx, word ptr es:[di + 4820h]
        mov     bx, SEG_A28F
        mov     es, bx
        cmp     ax, word ptr es:[si + 4822h]
        jg      br_fd173
        jl      br_fd14c
        cmp     dx, word ptr es:[si + 4820h]
        jnc     br_fd173
br_fd14c:
        cmp     word ptr [bp - 18h], 0
        jz      br_fd15e
        mov     dx, word ptr [bp - 0eh]
        mov     ax, word ptr [bp - 10h]
        shl     ax, 1
        rcl     dx, 1
        jmp     br_fd164
br_fd15e:
        mov     dx, word ptr [bp - 0eh]
        mov     ax, word ptr [bp - 10h]
br_fd164:
        mov     bx, SEG_A28F
        mov     es, bx
        add     word ptr es:[si + 4820h], ax
        adc     word ptr es:[si + 4822h], dx
br_fd173:
        add     si, 24h
        inc     word ptr [bp - 12h]
        cmp     si, 1200h
        jnz     loop_fd11b
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
        jz      br_fd1ae
        jmp     near br_fd238
br_fd1ae:
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
br_fd238:
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
        jl      br_fd2d2
        jg      br_fd2bd
        cmp     dx, word ptr [bp + 8]
        jbe     br_fd2d2
br_fd2bd:
        mov     ax, SEG_A28F
        mov     dx, word ptr [bp - 0eh]
        mov     bx, word ptr [bp - 10h]
        mov     es, ax
        add     word ptr es:[di + 4814h], bx
        adc     word ptr es:[di + 4816h], dx
br_fd2d2:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 481ah]
        mov     dx, word ptr es:[di + 4818h]
        cmp     ax, word ptr [bp + 0ah]
        jl      br_fd302
        jg      br_fd2ed
        cmp     dx, word ptr [bp + 8]
        jbe     br_fd302
br_fd2ed:
        mov     ax, SEG_A28F
        mov     dx, word ptr [bp - 0eh]
        mov     bx, word ptr [bp - 10h]
        mov     es, ax
        add     word ptr es:[di + 4818h], bx
        adc     word ptr es:[di + 481ah], dx
br_fd302:
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
        jnz     br_fd358
        cmp     word ptr [bp - 18h], 1
        jnz     br_fd358
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
br_fd358:
        cmp     word ptr [bp - 16h], 1
        jnz     br_fd394
        cmp     word ptr [bp - 18h], 1
        jnz     br_fd394
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
br_fd394:
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
fn_fd3b7:
        push    bp
        mov     bp, sp
        sub     sp, 24h
        push    si
        push    di
        mov     ax, word ptr [bp + 0ah]
        mov     dx, word ptr [bp + 8]
        cmp     ax, word ptr [bp + 0eh]
        jl      br_fd3d7
        jz      br_fd3cf
        jmp     br_fd5d7
br_fd3cf:
        cmp     dx, word ptr [bp + 0ch]
        jc      br_fd3d7
        jmp     br_fd5d7
br_fd3d7:
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
        jmp     br_fd59e
br_fd43c:
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
        jmp     br_fd57d
br_fd499:
        mov     ax, word ptr [bp - 16h]
        mov     dx, word ptr [bp - 18h]
        cmp     ax, word ptr [bp - 12h]
        jg      br_fd4b9
        jl      br_fd4ab
        cmp     dx, word ptr [bp - 14h]
        jnc     br_fd4b9
br_fd4ab:
        mov     ax, word ptr [bp - 16h]
        mov     dx, word ptr [bp - 18h]
        mov     word ptr [bp - 0eh], ax
        mov     word ptr [bp - 10h], dx
        jmp     br_fd4c5
br_fd4b9:
        mov     ax, word ptr [bp - 12h]
        mov     dx, word ptr [bp - 14h]
        mov     word ptr [bp - 0eh], ax
        mov     word ptr [bp - 10h], dx
br_fd4c5:
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
        call    fn_fd5db
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
        call    fn_fd5db
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
br_fd57d:
        cmp     word ptr [bp - 16h], 0
        jle     br_fd586
        jmp     br_fd499
br_fd586:
        jnz     br_fd591
        cmp     word ptr [bp - 18h], 0
        jbe     br_fd591
        jmp     br_fd499
br_fd591:
        mov     ax, word ptr [bp - 0ah]
        mov     dx, word ptr [bp - 0ch]
        add     word ptr [bp - 24h], dx
        adc     word ptr [bp - 22h], ax
        inc     si
br_fd59e:
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
        jle     br_fd5bf
        jmp     br_fd43c
br_fd5bf:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3546
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_fd5d7:
        pop     di
        pop     si
        leave
        retf
fn_fd5db:
        push    bp
        mov     bp, sp
        sub     sp, 0eh
        cmp     word ptr [bp + 8], 0
        jl      br_fd5f6
        jle     br_fd5ec
        jmp     near br_fd675
br_fd5ec:
        cmp     word ptr [bp + 6], 1200h
        jbe     br_fd5f6
        jmp     near br_fd675
br_fd5f6:
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
        jmp     br_fd65a
loop_fd632:
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
br_fd65a:
        push    0
        push    2
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   0f800h:far_fa0fe
        cmp     dx, word ptr [bp - 0ah]
        jg      loop_fd632
        jnz     br_fd675
        cmp     ax, word ptr [bp - 0ch]
        ja      loop_fd632
br_fd675:
        leave
        retf
fn_fd677:
        push    bp
        mov     bp, sp
        sub     sp, 18h
        push    si
        push    di
        mov     ax, word ptr [bp + 0ah]
        mov     dx, word ptr [bp + 8]
        cmp     ax, word ptr [bp + 0eh]
        jl      br_fd697
        jz      br_fd68f
        jmp     br_fd7eb
br_fd68f:
        cmp     dx, word ptr [bp + 0ch]
        jc      br_fd697
        jmp     br_fd7eb
br_fd697:
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
        jmp     br_fd7b4
br_fd6e3:
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
        jmp     short br_fd77f
br_fd703:
        mov     ax, word ptr [bp - 0eh]
        mov     dx, word ptr [bp - 10h]
        cmp     ax, word ptr [bp - 0ah]
        jg      br_fd723
        jl      br_fd715
        cmp     dx, word ptr [bp - 0ch]
        jnc     br_fd723
br_fd715:
        mov     ax, word ptr [bp - 0eh]
        mov     dx, word ptr [bp - 10h]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        jmp     br_fd72f
br_fd723:
        mov     ax, word ptr [bp - 0ah]
        mov     dx, word ptr [bp - 0ch]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
br_fd72f:
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
br_fd77f:
        cmp     word ptr [bp - 0eh], 0
        jle     br_fd788
        jmp     near br_fd703
br_fd788:
        jnz     br_fd793
        cmp     word ptr [bp - 10h], 0
        jbe     br_fd793
        jmp     near br_fd703
br_fd793:
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
br_fd7b4:
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
        jle     br_fd7d3
        jmp     br_fd6e3
br_fd7d3:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3546
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_fd7eb:
        pop     di
        pop     si
        leave
        retf
fn_fd7ef:
        push    bp
        mov     bp, sp
        sub     sp, 0ch
        push    si
        push    di
        mov     ax, word ptr [bp + 0ah]
        mov     dx, word ptr [bp + 8]
        cmp     ax, word ptr [bp + 0eh]
        jl      br_fd80f
        jz      br_fd807
        jmp     br_fdb1e
br_fd807:
        cmp     dx, word ptr [bp + 0ch]
        jc      br_fd80f
        jmp     br_fdb1e
br_fd80f:
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
        jnz     br_fd844
        jmp     br_fd972
br_fd844:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 481eh]
        mov     si, ax
        mov     dx, word ptr es:[di + 481ch]
        mov     word ptr [bp - 2], dx
        cmp     ax, word ptr [bp + 0eh]
        jnz     br_fd8a5
        cmp     dx, word ptr [bp + 0ch]
        jnz     br_fd8a5
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
        jmp     br_fd9ce
br_fd8a5:
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
        jmp     br_fd9ce
br_fd972:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 481eh]
        mov     si, ax
        mov     dx, word ptr es:[di + 481ch]
        mov     word ptr [bp - 2], dx
        cmp     ax, word ptr [bp + 0eh]
        jnz     br_fd990
        cmp     dx, word ptr [bp + 0ch]
        jz      br_fd9ce
br_fd990:
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
br_fd9ce:
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
        jge     br_fda13
        jmp     near br_fdaa3
br_fda13:
        jnz     br_fda1d
        cmp     dx, word ptr [bp + 0ch]
        jnc     br_fda1d
        jmp     near br_fdaa3
br_fda1d:
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
        jge     br_fda55
        jmp     near br_fdb01
br_fda55:
        jnz     br_fda5f
        cmp     dx, word ptr [bp + 8]
        jnc     br_fda5f
        jmp     near br_fdb01
br_fda5f:
        mov     ax, word ptr [bp - 0ah]
        mov     dx, word ptr [bp - 0ch]
        cmp     ax, word ptr [bp + 0eh]
        jl      br_fda8e
        jg      br_fda71
        cmp     dx, word ptr [bp + 0ch]
        jbe     br_fda8e
br_fda71:
        mov     ax, SEG_A28F
        mov     dx, word ptr [bp + 0eh]
        mov     bx, word ptr [bp + 0ch]
        sub     bx, word ptr [bp + 8]
        sbb     dx, word ptr [bp + 0ah]
        mov     es, ax
        sub     word ptr es:[di + 4814h], bx
        sbb     word ptr es:[di + 4816h], dx
        jmp     br_fdb01
br_fda8e:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     word ptr es:[di + 4816h], 0
        mov     word ptr es:[di + 4814h], 0
        jmp     br_fdb01
br_fdaa3:
        mov     ax, word ptr [bp - 6]
        mov     dx, word ptr [bp - 8]
        cmp     ax, word ptr [bp + 0ah]
        jl      br_fdb01
        jg      br_fdab5
        cmp     dx, word ptr [bp + 8]
        jbe     br_fdb01
br_fdab5:
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
        jl      br_fdb01
        jnz     br_fdaee
        cmp     dx, word ptr [bp + 8]
        jc      br_fdb01
br_fdaee:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     word ptr es:[di + 4816h], 0
        mov     word ptr es:[di + 4814h], 0
br_fdb01:
        callf   SEG_CC84:far_cd0a9
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3546
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_fdb1e:
        pop     di
        pop     si
        leave
        retf
fn_fdb22:
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
fn_fdb76:
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
        jz      br_fdbaa
        jmp     near br_fdc39
br_fdbaa:
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
br_fdc39:
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
far_fdcc8:
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
loop_fdd09:
        mov     al, cl
        mov     ah, 0
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        cmp     byte ptr es:[bx + 4800h], 0
        jz      br_fdd31
        mov     al, byte ptr [bp - 1]
        mov     ah, 0
        les     bx, dword ptr [bp + 6]
        add     bx, ax
        mov     byte ptr es:[bx], cl
        inc     byte ptr [bp - 1]
br_fdd31:
        inc     cl
        cmp     cl, 80h
        jc      loop_fdd09
        cmp     byte ptr [bp - 1], 0
        jnz     br_fdd5d
        les     bx, dword ptr [bp + 0ah]
        mov     word ptr es:[bx + 2], ds
        mov     word ptr es:[bx], 3388h
        mov     word ptr es:[bx + 6], 0
        mov     word ptr es:[bx + 4], 0
        mov     ax, 0ffffh
        pop     di
        pop     si
        leave
        retf
br_fdd5d:
        push    word 0fba0h
        push    word 22c8h
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
        jnz     br_fdd98
        les     bx, dword ptr [bp + 0ah]
        mov     ax, word ptr [339bh]
        mov     dx, word ptr [3399h]
        mov     word ptr es:[bx + 2], ax
        mov     word ptr es:[bx], dx
        mov     byte ptr [bp - 2], 1
br_fdd98:
        mov     cl, 0
        cmp     cl, byte ptr [bp - 1]
        jnc     br_fdddb
        mov     al, byte ptr [bp - 2]
        mov     ah, 0
        mov     di, ax
        jmp     br_fddd6
loop_fdda8:
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
br_fddd6:
        cmp     cl, byte ptr [bp - 1]
        jc      loop_fdda8
br_fdddb:
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
fn_fde02:
        push    bp
        mov     bp, sp
        sub     sp, 8
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
        push    8
        push    64h
        push    0
        push    3
        push    ds
        push    word B_83BC
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
loop_fde74:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dl, al
        or      al, al
        jz      loop_fde74
        cmp     dl, 78h
        jz      br_fde8e
        cbw
        pop     di
        pop     si
        leave
        retf
br_fde8e:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_36CC
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     al, byte ptr [B_83BC]
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
        jg      br_fdeed
        jl      br_fded6
        cmp     word ptr es:[bx + 481ch], 2400h
        jnc     br_fdeed
br_fded6:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 481eh]
        mov     dx, word ptr es:[di + 481ch]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        jmp     br_fdef7
br_fdeed:
        mov     word ptr [bp - 6], 0
        mov     word ptr [bp - 8], 2400h
br_fdef7:
        mov     word ptr [bp - 2], SEG_A28F
        mov     word ptr [bp - 4], 0
        push    1
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        mov     ax, SEG_A28F
        mov     es, ax
        push    word ptr es:[di + 4822h]
        push    word ptr es:[di + 4820h]
        push    word SEG_A28F
        push    word 0
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        xor     cx, cx
        jmp     br_fdf3e
loop_fdf2a:
        les     bx, dword ptr [bp - 4]
        mov     ax, word ptr es:[bx]
        cwd
        xor     ax, dx
        sub     ax, dx
        cmp     ax, si
        jge     br_fdf4d
        add     word ptr [bp - 4], 2
        inc     cx
br_fdf3e:
        mov     ax, cx
        cwd
        cmp     dx, word ptr [bp - 6]
        jl      loop_fdf2a
        jnz     br_fdf4d
        cmp     ax, word ptr [bp - 8]
        jc      loop_fdf2a
br_fdf4d:
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
        jnz     br_fdf7b
        mov     ax, 4ch
        pop     di
        pop     si
        leave
        retf
br_fdf7b:
        mov     word ptr [bp - 2], SEG_A28F
        mov     word ptr [bp - 4], 0
        push    1
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
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
        jmp     br_fdfd3
loop_fdfbf:
        les     bx, dword ptr [bp - 4]
        mov     ax, word ptr es:[bx]
        cwd
        xor     ax, dx
        sub     ax, dx
        cmp     ax, si
        jge     br_fdfe2
        add     word ptr [bp - 4], 2
        inc     cx
br_fdfd3:
        mov     ax, cx
        cwd
        cmp     dx, word ptr [bp - 6]
        jl      loop_fdfbf
        jnz     br_fdfe2
        cmp     ax, word ptr [bp - 8]
        jc      loop_fdfbf
br_fdfe2:
        mov     ax, cx
        cwd
        les     bx, dword ptr [bp + 8]
        cmp     dx, word ptr es:[bx + 2]
        jg      br_fe002
        jl      br_fdff5
        cmp     ax, word ptr es:[bx]
        jnc     br_fe002
br_fdff5:
        mov     ax, cx
        cwd
        les     bx, dword ptr [bp + 8]
        mov     word ptr es:[bx + 2], dx
        mov     word ptr es:[bx], ax
br_fe002:
        mov     ax, 4ch
        pop     di
        pop     si
        leave
        retf
far_fe009:
        push    bp
        mov     bp, sp
        sub     sp, 288h
        push    si
        push    1
        callf   SEG_D793:far_d796d
        add     sp, 2
        mov     byte ptr [B_D5DD], 7
        mov     byte ptr [bp - 2], 0
        mov     byte ptr [bp - 1], 0
        jmp     br_fe22c
br_fe02b:
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
        jnz     br_fe068
        mov     byte ptr [bp - 2], 0
br_fe068:
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
        jz      br_fe0a1
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
        call    far_fcd4d
        add     sp, 6
br_fe0a1:
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
        jnz     br_fe0f5
        mov     byte ptr [bp - 3], 0
        jmp     br_fe0f5
loop_fe0cd:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jnz     br_fe0f5
        cmp     si, 0ffffh
        jz      br_fe0f5
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
        call    far_fcd4d
        add     sp, 6
br_fe0f5:
        mov     al, byte ptr [bp - 3]
        cbw
        add     ax, 40h
        push    ax
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     byte ptr [bp - 1], al
        or      al, al
        jz      loop_fe0cd
        cbw
        cmp     ax, 78h
        jz      br_fe139
        jg      br_fe12c
        cmp     ax, 44h
        jnz     br_fe11c
        jmp     near br_fe1b4
br_fe11c:
        cmp     ax, 4eh
        jnz     br_fe124
        jmp     near br_fe1b4
br_fe124:
        cmp     ax, 75h
        jz      br_fe17d
        jmp     br_fe22c
br_fe12c:
        cmp     ax, 79h
        jz      br_fe159
        cmp     ax, 7ah
        jz      br_fe16b
        jmp     br_fe22c
br_fe139:
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
        jmp     br_fe22c
br_fe159:
        mov     al, byte ptr [bp - 2]
        push    ax
        nop
        push    cs
        call    fn_fe246
        add     sp, 2
        mov     byte ptr [bp - 1], al
        jmp     near br_fe22c
br_fe16b:
        mov     al, byte ptr [bp - 2]
        push    ax
        nop
        push    cs
        call    fn_fe443
        add     sp, 2
        mov     byte ptr [bp - 1], al
        jmp     near br_fe22c
br_fe17d:
        nop
        push    cs
        call    fn_fe97a
        mov     si, ax
        mov     al, byte ptr [bp - 2]
        push    ax
        nop
        push    cs
        call    fn_fe73e
        add     sp, 2
        mov     byte ptr [bp - 1], al
        mov     ax, A_2F7A
        or      ax, ax
        ja      br_fe19d
        jmp     near br_fe22c
br_fe19d:
        cmp     byte ptr [bp - 2], 0
        jg      br_fe1a6
        jmp     near br_fe22c
br_fe1a6:
        nop
        push    cs
        call    fn_fe97a
        cmp     ax, si
        jz      br_fe22c
        dec     byte ptr [bp - 2]
        jmp     short br_fe22c
br_fe1b4:
        mov     byte ptr [bp - 1], 0
        cmp     si, 0ffffh
        jz      br_fe22c
        mov     al, byte ptr [B_D4C0]
        cbw
        mov     cx, ax
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        cmp     byte ptr es:[bx - 30ah], 0ffh
        jz      br_fe22c
        push    ss
        lea     ax, [bp - 84h]
        push    ax
        push    cx
        callf   SEG_C495:far_c529a
        add     sp, 6
        cmp     ax, 0ffffh
        jz      br_fe22c
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
        jz      br_fe22c
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
        call    far_fcd4d
        add     sp, 6
br_fe22c:
        cmp     byte ptr [bp - 1], 0
        jnz     br_fe235
        jmp     br_fe02b
br_fe235:
        push    0
        callf   SEG_D793:far_d796d
        add     sp, 2
        mov     al, byte ptr [bp - 1]
        cbw
        pop     si
        leave
        retf
fn_fe246:
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
        jz      br_fe2c3
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
        call    far_fcd4d
        add     sp, 6
br_fe2c3:
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
        jmp     br_fe3a8
loop_fe33b:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jnz     br_fe3a8
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
        jz      br_fe3a8
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
        call    far_fcd4d
        add     sp, 6
br_fe3a8:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dl, al
        or      al, al
        jz      loop_fe33b
        cbw
        cmp     ax, 78h
        jnz     br_fe43c
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
        jz      br_fe3f5
        callf   SEG_B1AA:far_b1af9
        push    1
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        callf   SEG_B1AA:far_b1aff
        jmp     br_fe43a
br_fe3f5:
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
br_fe43a:
        mov     dl, 0
br_fe43c:
        mov     al, dl
        cbw
        pop     di
        pop     si
        leave
        retf
fn_fe443:
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
        jz      br_fe4c0
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
        call    far_fcd4d
        add     sp, 6
br_fe4c0:
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
        jmp     br_fe5a5
loop_fe538:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jnz     br_fe5a5
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
        jz      br_fe5a5
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
        call    far_fcd4d
        add     sp, 6
br_fe5a5:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jz      loop_fe538
        cmp     ax, 78h
        jz      br_fe5be
        jmp     br_fe737
br_fe5be:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3769
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
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
        jge     br_fe651
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
br_fe651:
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
        jnz     br_fe6f5
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[si + 481eh]
        mov     dx, word ptr es:[si + 481ch]
        mov     word ptr [bp - 8], ax
        mov     word ptr [bp - 0ah], dx
        jmp     br_fe70e
br_fe6f5:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[si + 481eh]
        mov     dx, word ptr es:[si + 481ch]
        shl     dx, 1
        rcl     ax, 1
        mov     word ptr [bp - 8], ax
        mov     word ptr [bp - 0ah], dx
br_fe70e:
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
br_fe737:
        mov     ax, word ptr [bp - 2]
        pop     di
        pop     si
        leave
        retf
fn_fe73e:
        push    bp
        mov     bp, sp
        sub     sp, 296h
        push    si
        push    di
        mov     si, 339dh
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
        push    word A_37C8
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        cmp     si, 0ffffh
        jz      br_fe847
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
        call    far_fcd4d
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
        jnz     br_fe83d
        push    ds
        push    word A_37C8
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_fe847
br_fe83d:
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
br_fe847:
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_37CE
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     near br_fe928
br_fe867:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jz      br_fe877
        cmp     ax, 1
        jz      br_fe8ee
        jmp     near br_fe928
br_fe877:
        cmp     si, 0ffffh
        jnz     br_fe87f
        jmp     near br_fe928
br_fe87f:
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
        call    far_fcd4d
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
        jnz     br_fe8e2
        push    ds
        push    word A_37C8
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_fe928
br_fe8e2:
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        jmp     br_fe928
br_fe8ee:
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
        jnz     br_fe928
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
br_fe928:
        push    2
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dl, al
        or      al, al
        jnz     br_fe93b
        jmp     br_fe867
br_fe93b:
        cbw
        cmp     ax, 78h
        jz      br_fe948
        cmp     ax, 79h
        jz      br_fe96c
        jmp     br_fe973
br_fe948:
        push    1
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
        add     sp, 6
        mov     dl, 0
        jmp     br_fe973
br_fe96c:
        nop
        push    cs
        call    fn_fe99c
        mov     dl, al
br_fe973:
        mov     al, dl
        cbw
        pop     di
        pop     si
        leave
        retf
fn_fe97a:
        push    si
        xor     dx, dx
        xor     cx, cx
        mov     si, 4800h
loop_fe982:
        mov     ax, SEG_A28F
        mov     es, ax
        cmp     byte ptr es:[si], 0
        jz      br_fe98e
        inc     dx
br_fe98e:
        add     si, 24h
        inc     cx
        cmp     si, 5a00h
        jnz     loop_fe982
        mov     ax, dx
        pop     si
        retf
fn_fe99c:
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
loop_fe9e7:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dl, al
        or      al, al
        jz      loop_fe9e7
        cbw
        cmp     ax, 78h
        jnz     br_fea09
        callf   SEG_CB18:far_cb23d
        callf   SEG_CC84:far_cd4d6
        mov     dl, 0
br_fea09:
        mov     al, dl
        cbw
        retf
far_fea0d:
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
        jmp     br_feadc
loop_fea9f:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jnz     loop_feacb
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
loop_feacb:
        push    word 80h
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        or      ax, ax
        jz      loop_fea9f
br_feadc:
        or      si, si
        jz      loop_feacb
        push    word ptr [bp - 2]
        callf   SEG_EB7C:far_eb7cc
        add     sp, 2
        mov     byte ptr [B_9569], 0
        mov     ax, si
        pop     si
        leave
        retf
        db      83dh dup (0ffh)
        phase   2
far_ff332:
        push    bp
        mov     bp, sp
        sub     sp, 2eh
        push    si
        push    di
        mov     di, word ptr [bp + 6]
        xor     si, si
        cmp     byte ptr [B_946A], 0
        jz      br_ff364
        mov     al, byte ptr [B_946A]
        cbw
        push    ax
        mov     al, byte ptr [B_946B]
        cbw
        push    ax
        callf   SEG_E726:far_e726e
        add     sp, 4
        mov     si, ax
        or      si, si
        jge     br_ff364
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_ff364:
        mov     al, byte ptr [B_9469]
        push    ax
        callf   SEG_E259:far_e259f
        add     sp, 2
        or      ax, ax
        jz      br_ff37b
        mov     ax, 0fff4h
        pop     di
        pop     si
        leave
        retf
br_ff37b:
        callf   SEG_E598:far_e598e
        test    di, 2
        jz      br_ff38b
        mov     ax, 1
        jmp     br_ff38d
br_ff38b:
        xor     ax, ax
br_ff38d:
        mov     word ptr [bp - 0eh], ax
        mov     ax, word ptr [bp + 0ah]
        mov     dx, word ptr [bp + 8]
        mov     word ptr [bp - 10h], ax
        mov     word ptr [bp - 12h], dx
        mov     word ptr [bp - 0ch], 1
        mov     al, byte ptr [B_946B]
        cmp     al, byte ptr [B_9469]
        jz      br_ff3ad
        jmp     br_ff4a6
br_ff3ad:
        push    word ptr [W_9474]
        push    word ptr [W_9472]
        cbw
        push    ax
        nop
        push    cs
        call    fn_ff5b0
        add     sp, 6
        mov     si, ax
        or      ax, ax
        jz      br_ff3f2
        push    ds
        push    word B_8C41
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    0
        callf   SEG_E1E1:far_e1e11
        add     sp, 2
        callf   SEG_E598:far_e59bd
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
br_ff3f2:
        mov     al, byte ptr [B_946B]
        cbw
        mov     word ptr [bp - 2eh], ax
        mov     word ptr [bp - 2ch], 0
        mov     word ptr [bp - 2ah], 0
        mov     ax, word ptr [W_9480]
        mov     dx, word ptr [W_947E]
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        mov     al, byte ptr [B_946A]
        cbw
        mov     word ptr [bp - 8], ax
        mov     word ptr [bp - 24h], ax
        mov     word ptr [bp - 20h], 1
        mov     word ptr [bp - 22h], 100h
        mov     word ptr [bp - 1eh], ax
        mov     word ptr [bp - 1ch], 1
        mov     ax, word ptr [W_9474]
        mov     dx, word ptr [W_9472]
        mov     word ptr [bp - 18h], ax
        mov     word ptr [bp - 1ah], dx
        mov     ax, word ptr [W_903F]
        mov     dx, word ptr [W_903D]
        mov     word ptr [bp - 14h], ax
        mov     word ptr [bp - 16h], dx
        mov     ax, word ptr [W_904B]
        mov     word ptr [bp - 2], ax
        push    ss
        lea     ax, [bp - 2eh]
        push    ax
        nop
        push    cs
        call    fn_ff8d7
        add     sp, 4
        mov     si, ax
        or      ax, ax
        jz      br_ff480
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    0
        callf   SEG_E1E1:far_e1e11
        add     sp, 2
        callf   SEG_E598:far_e59bd
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
br_ff480:
        mov     word ptr [bp - 2eh], 0
        mov     word ptr [bp - 26h], 1
        mov     word ptr [bp - 28h], 100h
        push    word ptr [bp - 2]
        push    1
        push    0
        callf   SEG_DFC0:far_dfc02
        add     sp, 6
        mov     word ptr [bp - 4], dx
        mov     word ptr [bp - 6], ax
        jmp     br_ff4cf
br_ff4a6:
        mov     al, byte ptr [B_946B]
        cbw
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp - 2eh], ax
        mov     ax, word ptr [W_9480]
        mov     dx, word ptr [W_947E]
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        push    si
        push    word ptr [bp - 0ah]
        callf   SEG_DFC0:far_dfd13
        add     sp, 4
        mov     word ptr [bp - 4], dx
        mov     word ptr [bp - 6], ax
br_ff4cf:
        mov     ax, di
        and     ax, 1
        mov     word ptr [bp - 2ah], ax
        mov     al, byte ptr [B_9469]
        cbw
        mov     word ptr [bp - 2ch], ax
        mov     al, byte ptr [B_946A]
        cbw
        mov     word ptr [bp - 24h], ax
        mov     ax, word ptr [W_9478]
        mov     dx, word ptr [W_9476]
        mov     word ptr [bp - 20h], ax
        mov     word ptr [bp - 22h], dx
        mov     al, byte ptr [B_9468]
        cbw
        mov     word ptr [bp - 1eh], ax
        mov     ax, word ptr [W_9466]
        mov     word ptr [bp - 1ch], ax
        mov     ax, word ptr [W_9474]
        mov     dx, word ptr [W_9472]
        mov     word ptr [bp - 18h], ax
        mov     word ptr [bp - 1ah], dx
        mov     ax, word ptr [W_9441]
        mov     dx, word ptr [W_943F]
        mov     word ptr [bp - 14h], ax
        mov     word ptr [bp - 16h], dx
        mov     ax, word ptr [W_9466]
        cwd
        push    ax
        push    dx
        mov     dx, word ptr [bp - 4]
        mov     ax, word ptr [bp - 6]
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        add     ax, 5dch
        adc     dx, 0
        push    ax
        push    dx
        callf   SEG_E2CE:far_e2ce3
        pop     bx
        cmp     bx, dx
        pop     dx
        jl      br_ff567
        jg      br_ff545
        cmp     dx, ax
        jbe     br_ff567
br_ff545:
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    0
        callf   SEG_E1E1:far_e1e11
        add     sp, 2
        callf   SEG_E598:far_e59bd
        mov     ax, 0fffdh
        pop     di
        pop     si
        leave
        retf
br_ff567:
        push    ss
        lea     ax, [bp - 2eh]
        push    ax
        nop
        push    cs
        call    fn_ff8d7
        add     sp, 4
        mov     si, ax
        or      ax, ax
        jz      br_ff59b
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    0
        callf   SEG_E1E1:far_e1e11
        add     sp, 2
        callf   SEG_E598:far_e59bd
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
br_ff59b:
        push    0
        callf   SEG_E1E1:far_e1e11
        add     sp, 2
        callf   SEG_E598:far_e5a21
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
fn_ff5b0:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        push    di
        push    ds
        push    word B_8C41
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    0
        push    word ptr [bp + 6]
        callf   SEG_E12D:far_e12dc
        add     sp, 4
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jz      br_ff5e8
        pop     di
        pop     si
        leave
        retf
br_ff5e8:
        push    4
        push    4
        push    ds
        push    word B_901B
        callf   SEG_E723:far_e723d
        add     sp, 8
        push    0
        push    word 180h
        mov     ax, word ptr [bp + 0ah]
        mov     dx, word ptr [bp + 8]
        add     dx, 17fh
        adc     ax, 0
        push    ax
        push    dx
        callf   0f800h:far_fa0fe
        mov     di, ax
        shl     ax, 3
        add     ax, 5dch
        cwd
        push    ax
        push    dx
        callf   SEG_E2CE:far_e2ce3
        pop     bx
        cmp     bx, dx
        pop     dx
        jl      br_ff634
        jg      br_ff62d
        cmp     dx, ax
        jbe     br_ff634
br_ff62d:
        mov     ax, 0fffdh
        pop     di
        pop     si
        leave
        retf
br_ff634:
        xor     ax, ax
        mov     word ptr [W_9055], ax
        mov     word ptr [W_8814], ax
        mov     byte ptr [B_901B], al
        mov     word ptr [W_904B], di
        mov     word ptr [W_903F], 0
        mov     word ptr [W_903D], 0
        mov     si, 1
        jmp     br_ff67c
loop_ff654:
        push    si
        push    1
        callf   SEG_DB24:far_db240
        add     sp, 4
        mov     ax, word ptr [W_9059]
        cwd
        add     word ptr [W_903D], ax
        adc     word ptr [W_903F], dx
        mov     ax, word ptr [W_9059]
        mov     word ptr [W_8814], ax
        push    1
        callf   SEG_DAD5:far_dad54
        add     sp, 2
        inc     si
br_ff67c:
        cmp     si, di
        jle     loop_ff654
        mov     byte ptr [bp - 3], 0ffh
        push    1
        push    ss
        lea     ax, [bp - 3]
        push    ax
        push    1
        callf   SEG_D9B6:far_d9b6e
        add     sp, 8
        mov     ax, word ptr [W_9033]
        mov     dx, word ptr [W_9031]
        mov     word ptr [W_902B], ax
        mov     word ptr [W_9029], dx
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
fn_ff6a9:
        push    bp
        mov     bp, sp
        sub     sp, 5f4h
        push    si
        push    di
        les     bx, dword ptr [bp + 6]
        push    word ptr es:[bx + 0ah]
        push    word ptr es:[bx]
        callf   SEG_E726:far_e726e
        add     sp, 4
        mov     di, ax
        or      ax, ax
        jge     br_ff6d0
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_ff6d0:
        push    ds
        push    word B_8C41
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    0
        les     bx, dword ptr [bp + 6]
        push    word ptr es:[bx + 2]
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        les     bx, dword ptr [bp + 6]
        push    word ptr es:[bx + 0eh]
        push    word ptr es:[bx + 0ch]
        push    ds
        push    word B_901B
        callf   SEG_E3D1:far_e3d12
        add     sp, 8
        push    1
        les     bx, dword ptr [bp + 6]
        push    word ptr es:[bx]
        push    ds
        push    word B_8C41
        callf   SEG_E51B:far_e51be
        add     sp, 8
        les     bx, dword ptr [bp + 6]
        push    word ptr es:[bx + 8]
        push    word ptr es:[bx + 6]
        push    ds
        push    word B_8C41
        callf   SEG_E3D1:far_e3d12
        add     sp, 8
        les     bx, dword ptr [bp + 6]
        mov     bx, word ptr es:[bx + 10h]
        mov     al, byte ptr [bx + TBL_905D]
        cbw
        mov     word ptr [bp - 2], ax
        mov     bx, word ptr [bp - 2]
        test    byte ptr [bx + TBL_90C1], 2
        jnz     br_ff764
        mov     al, byte ptr [di + TBL_8CE7]
        mov     byte ptr [bx + TBL_90C1], al
        mov     al, byte ptr [di + TBL_8D4B]
        mov     byte ptr [bx + TBL_9125], al
        mov     al, byte ptr [di + TBL_8DAF]
        mov     byte ptr [bx + TBL_9189], al
br_ff764:
        inc     byte ptr [B_956A]
        mov     ax, word ptr [W_8C55]
        mov     dx, word ptr [W_8C53]
        mov     word ptr [bp - 12h], ax
        mov     word ptr [bp - 14h], dx
        mov     ax, word ptr [W_8C7B]
        mov     word ptr [bp - 6], ax
        les     bx, dword ptr [bp + 6]
        mov     ax, word ptr es:[bx + 12h]
        mov     word ptr [bp - 4], ax
        lea     ax, [bp - 5f4h]
        mov     word ptr [W_D4A8], ss
        mov     word ptr [W_D4A6], ax
        mov     al, byte ptr [B_8A9C]
        cbw
        mov     word ptr [bp - 8], ax
        mov     ax, word ptr es:[bx + 1ah]
        mov     dx, word ptr es:[bx + 18h]
        mov     word ptr [bp - 0eh], ax
        mov     word ptr [bp - 10h], dx
        jmp     br_ff883
br_ff7a8:
        mov     ax, word ptr [bp - 12h]
        mov     dx, word ptr [bp - 14h]
        mov     word ptr [W_8C55], ax
        mov     word ptr [W_8C53], dx
        mov     ax, word ptr [bp - 6]
        mov     word ptr [W_8C7B], ax
        les     bx, dword ptr [bp + 6]
        mov     ax, word ptr es:[bx + 16h]
        mov     dx, word ptr es:[bx + 14h]
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp - 0ch], dx
        cmp     ax, word ptr [bp - 0eh]
        jl      br_ff7e4
        jg      br_ff7d8
        cmp     dx, word ptr [bp - 10h]
        jbe     br_ff7e4
br_ff7d8:
        mov     ax, word ptr [bp - 0eh]
        mov     dx, word ptr [bp - 10h]
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp - 0ch], dx
br_ff7e4:
        mov     ax, word ptr [bp - 0ah]
        mov     dx, word ptr [bp - 0ch]
        sub     word ptr [bp - 10h], dx
        sbb     word ptr [bp - 0eh], ax
        callf   SEG_DBE6:far_dc29e
        jmp     br_ff86e
br_ff7f7:
        xor     si, si
        cmp     word ptr [W_9055], 0
        jnz     br_ff81f
        mov     al, byte ptr [bp - 2]
        mov     byte ptr [B_8A9C], al
        callf   SEG_DAE3:far_dae36
        les     bx, dword ptr [bp + 6]
        cmp     word ptr es:[bx + 4], 0
        jnz     br_ff81c
        callf   SEG_DBE6:far_dc29e
        jmp     br_ff81f
br_ff81c:
        mov     si, 1
br_ff81f:
        cmp     word ptr [W_8C7B], 0
        jnz     br_ff838
        push    di
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    fn_ff94f
        add     sp, 6
        mov     si, 1
br_ff838:
        or      si, si
        jz      br_ff862
        callf   SEG_E2CE:far_e2ce3
        or      dx, dx
        jg      br_ff857
        jl      br_ff84c
        cmp     ax, 5dch
        jnc     br_ff857
br_ff84c:
        dec     byte ptr [B_956A]
        mov     ax, 0fffdh
        pop     di
        pop     si
        leave
        retf
br_ff857:
        mov     al, byte ptr [bp - 2]
        mov     byte ptr [B_8A9C], al
        callf   SEG_DAF5:far_daf5c
br_ff862:
        inc     word ptr [W_8814]
        dec     word ptr [W_9055]
        dec     word ptr [W_8C7B]
br_ff86e:
        mov     ax, word ptr [bp - 0ch]
        mov     dx, word ptr [bp - 0ah]
        sub     word ptr [bp - 0ch], 1
        sbb     word ptr [bp - 0ah], 0
        or      ax, dx
        jz      br_ff883
        jmp     near br_ff7f7
br_ff883:
        mov     ax, word ptr [bp - 4]
        dec     word ptr [bp - 4]
        or      ax, ax
        jz      br_ff898
        mov     ax, word ptr [bp - 10h]
        or      ax, word ptr [bp - 0eh]
        jz      br_ff898
        jmp     br_ff7a8
br_ff898:
        mov     al, byte ptr [bp - 8]
        mov     byte ptr [B_8A9C], al
        mov     ax, word ptr [W_9055]
        add     word ptr [W_8814], ax
        push    1
        callf   SEG_DAD5:far_dad54
        add     sp, 2
        mov     word ptr [W_9055], 0
        dec     byte ptr [B_956A]
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    ds
        push    word B_8C41
        callf   SEG_E003:far_e0031
        add     sp, 4
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
fn_ff8d7:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        les     bx, dword ptr [bp + 6]
        cmp     word ptr es:[bx + 0ah], 0
        jz      br_ff8fd
        mov     word ptr es:[bx + 22h], 1
        push    word ptr [bp + 8]
        push    bx
        push    cs
        call    fn_ff6a9
        add     sp, 4
        mov     dx, ax
        jmp     br_ff94a
br_ff8fd:
        les     bx, dword ptr [bp + 6]
        mov     ax, word ptr es:[bx + 10h]
        mov     word ptr [bp - 2], ax
        mov     word ptr es:[bx + 22h], 0
        mov     si, 1
        jmp     br_ff92f
loop_ff912:
        les     bx, dword ptr [bp + 6]
        mov     word ptr es:[bx + 0ah], si
        mov     word ptr es:[bx + 10h], si
        push    word ptr [bp + 8]
        push    bx
        push    cs
        call    fn_ff6a9
        add     sp, 4
        mov     dx, ax
        or      ax, ax
        jnz     br_ff934
        inc     si
br_ff92f:
        cmp     si, 63h
        jle     loop_ff912
br_ff934:
        les     bx, dword ptr [bp + 6]
        mov     word ptr es:[bx + 22h], 1
        mov     word ptr es:[bx + 0ah], 0
        mov     ax, word ptr [bp - 2]
        mov     word ptr es:[bx + 10h], ax
br_ff94a:
        mov     ax, dx
        pop     si
        leave
        retf
fn_ff94f:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    si
        push    di
        mov     si, word ptr [bp + 0ah]
        mov     al, byte ptr [si + TBL_8CE7]
        cbw
        and     ax, 4
        mov     word ptr [bp - 6], ax
        jmp     near br_ffa10
br_ff968:
        mov     ax, word ptr [W_8C55]
        mov     dx, word ptr [W_8C53]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        push    word 640h
        push    ds
        push    word TBL_F779
        push    3
        callf   SEG_D97B:far_d97ca
        add     sp, 8
        mov     di, ax
        mov     al, byte ptr [TBL_F779]
        mov     ah, 0
        and     ax, 0f8h
        mov     dx, ax
        cmp     ax, 88h
        jz      br_ff9a3
        cmp     ax, 0a8h
        jz      br_ffa10
        cmp     ax, 0f8h
        jz      br_ff9b4
        jmp     br_ff9c5
br_ff9a3:
        push    ds
        push    word TBL_F77A
        callf   SEG_DAA8:far_daa8e
        add     sp, 4
        mov     word ptr [W_8C7B], ax
        jmp     br_ffa10
br_ff9b4:
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        mov     word ptr [W_8C55], ax
        mov     word ptr [W_8C53], dx
        pop     di
        pop     si
        leave
        retf
br_ff9c5:
        mov     al, byte ptr [TBL_F77A]
        mov     ah, 0
        cmp     ax, si
        jnz     br_ffa10
        cmp     dx, 98h
        jnz     br_ff9f7
        les     bx, dword ptr [bp + 6]
        cmp     word ptr es:[bx + 22h], 0
        jz      br_ffa01
        push    word ptr [bp - 6]
        push    word ptr es:[bx + 1eh]
        push    word ptr es:[bx + 1ch]
        nop
        push    cs
        call    far_ffb5f
        add     sp, 6
        or      ax, ax
        jnz     br_ffa01
        jmp     br_ffa10
br_ff9f7:
        les     bx, dword ptr [bp + 6]
        cmp     word ptr es:[bx + 20h], 0
        jnz     br_ffa10
br_ffa01:
        push    1
        push    di
        push    ds
        push    word TBL_F779
        callf   SEG_DBE6:far_dbe67
        add     sp, 8
br_ffa10:
        cmp     word ptr [W_8C7B], 0
        jnz     br_ffa1a
        jmp     near br_ff968
br_ffa1a:
        pop     di
        pop     si
        leave
        retf
far_ffa1e:
        push    bp
        mov     bp, sp
        sub     sp, 0ch
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    1
        mov     al, byte ptr [B_946B]
        cbw
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        push    word ptr [W_9480]
        push    word ptr [W_947E]
        push    ds
        push    word B_901B
        callf   SEG_DFDF:far_dfdf5
        add     sp, 8
        or      ax, ax
        jz      br_ffa60
        mov     ax, 0ffech
        leave
        retf
br_ffa60:
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    word ptr [W_9480]
        push    word ptr [W_947E]
        push    ds
        push    word B_901B
        callf   SEG_EB00:far_eb007
        add     sp, 0ch
        push    word ptr [W_947C]
        push    word ptr [W_947A]
        push    ds
        push    word B_901B
        callf   SEG_DFDF:far_dfdf5
        add     sp, 8
        or      ax, ax
        jz      br_ffa96
        mov     ax, 0ffech
        leave
        retf
br_ffa96:
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        push    word ptr [W_947C]
        push    word ptr [W_947A]
        push    ds
        push    word B_901B
        callf   SEG_EB00:far_eb007
        add     sp, 0ch
        mov     ax, word ptr [bp - 0ah]
        mov     dx, word ptr [bp - 0ch]
        sub     dx, word ptr [bp - 8]
        sbb     ax, word ptr [bp - 6]
        mov     word ptr [W_9474], ax
        mov     word ptr [W_9472], dx
        mov     al, byte ptr [B_946B]
        cmp     al, byte ptr [B_9469]
        jz      br_ffade
        push    1
        mov     al, byte ptr [B_9469]
        cbw
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
br_ffade:
        push    word ptr [W_9478]
        push    word ptr [W_9476]
        push    ds
        push    word B_901B
        callf   SEG_DFDF:far_dfdf5
        add     sp, 8
        or      ax, ax
        jz      br_ffafb
        mov     ax, 0ffech
        leave
        retf
br_ffafb:
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    word ptr [W_9478]
        push    word ptr [W_9476]
        push    ds
        push    word B_901B
        callf   SEG_EB00:far_eb007
        add     sp, 0ch
        mov     ax, word ptr [W_903F]
        mov     dx, word ptr [W_903D]
        sub     dx, word ptr [bp - 4]
        sbb     ax, word ptr [bp - 2]
        mov     word ptr [W_9441], ax
        mov     word ptr [W_943F], dx
        mov     ax, word ptr [W_9466]
        cwd
        push    ax
        push    dx
        mov     dx, word ptr [W_9474]
        mov     ax, word ptr [W_9472]
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        cmp     dx, word ptr [W_9441]
        jl      br_ffb4f
        jg      br_ffb4a
        cmp     ax, word ptr [W_943F]
        jbe     br_ffb4f
br_ffb4a:
        mov     ax, 0fffdh
        leave
        retf
br_ffb4f:
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        xor     ax, ax
        leave
        retf
far_ffb5f:
        push    bp
        mov     bp, sp
        cmp     word ptr [bp + 0ah], 0
        jz      br_ffb92
        cmp     byte ptr [B_F77B], 23h
        jc      br_ffb8e
        cmp     byte ptr [B_F77B], 62h
        ja      br_ffb8e
        mov     al, byte ptr [B_F77B]
        mov     ah, 0
        mov     es, word ptr [bp + 8]
        add     ax, word ptr [bp + 6]
        mov     bx, ax
        cmp     byte ptr es:[bx - 23h], 0
        jnz     br_ffbac
        xor     ax, ax
        pop     bp
        retf
br_ffb8e:
        xor     ax, ax
        pop     bp
        retf
br_ffb92:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        cmp     al, byte ptr [B_F77B]
        ja      br_ffba8
        mov     al, byte ptr es:[bx + 1]
        cmp     al, byte ptr [B_F77B]
        jnc     br_ffbac
br_ffba8:
        xor     ax, ax
        pop     bp
        retf
br_ffbac:
        mov     ax, 1
        pop     bp
        retf
far_ffbb1:
        push    bp
        mov     bp, sp
        sub     sp, 38h
        push    si
        push    di
        mov     si, word ptr [bp + 0ah]
        cmp     byte ptr [B_901B], 0
        jge     br_ffbc9
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_ffbc9:
        or      si, si
        jg      br_ffbd3
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_ffbd3:
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
        push    ds
        push    word B_901B
        callf   SEG_E5A9:far_e5a99
        add     sp, 4
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        push    word ptr [W_9480]
        push    word ptr [W_947E]
        push    ds
        push    word B_901B
        callf   SEG_EB00:far_eb007
        add     sp, 0ch
        push    ss
        lea     ax, [bp - 10h]
        push    ax
        push    word ptr [W_947C]
        push    word ptr [W_947A]
        push    ds
        push    word B_901B
        callf   SEG_EB00:far_eb007
        add     sp, 0ch
        cmp     word ptr [bp + 8], 0
        jz      br_ffc39
        jmp     near br_ffcc0
br_ffc39:
        mov     ax, si
        cwd
        cmp     dx, word ptr [bp - 0ah]
        jg      br_ffc8a
        jnz     br_ffc48
        cmp     ax, word ptr [bp - 0ch]
        ja      br_ffc8a
br_ffc48:
        mov     ax, word ptr [W_9480]
        mov     dx, word ptr [W_947E]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        push    ss
        lea     ax, [bp - 8]
        push    ax
        mov     ax, si
        cwd
        mov     bx, word ptr [bp - 0ah]
        mov     cx, word ptr [bp - 0ch]
        sub     cx, ax
        sbb     bx, dx
        push    bx
        push    cx
        push    ds
        push    word B_901B
        callf   SEG_EADF:far_eadf4
        add     sp, 0ch
        mov     ax, word ptr [bp - 0eh]
        mov     dx, word ptr [bp - 10h]
        sub     dx, word ptr [bp - 0ch]
        sbb     ax, word ptr [bp - 0ah]
        mov     word ptr [bp - 12h], ax
        mov     word ptr [bp - 14h], dx
        jmp     br_ffd64
br_ffc8a:
        push    ss
        lea     ax, [bp - 4]
        push    ax
        mov     ax, si
        cwd
        push    dx
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_EADF:far_eadf4
        add     sp, 0ch
        mov     word ptr [bp - 6], 1
        mov     word ptr [bp - 8], 100h
        mov     ax, si
        cwd
        mov     bx, word ptr [bp - 0eh]
        mov     cx, word ptr [bp - 10h]
        sub     cx, ax
        sbb     bx, dx
        mov     word ptr [bp - 12h], bx
        mov     word ptr [bp - 14h], cx
        jmp     near br_ffd64
br_ffcc0:
        mov     ax, si
        cwd
        mov     bx, word ptr [W_903F]
        mov     cx, word ptr [W_903D]
        sub     cx, ax
        sbb     bx, dx
        cmp     bx, word ptr [bp - 0eh]
        jc      br_ffd1c
        jnz     br_ffcdb
        cmp     cx, word ptr [bp - 10h]
        jc      br_ffd1c
br_ffcdb:
        mov     ax, word ptr [W_9480]
        mov     dx, word ptr [W_947E]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        push    ss
        lea     ax, [bp - 8]
        push    ax
        mov     ax, si
        cwd
        mov     bx, word ptr [bp - 0ah]
        mov     cx, word ptr [bp - 0ch]
        add     cx, ax
        adc     bx, dx
        push    bx
        push    cx
        push    ds
        push    word B_901B
        callf   SEG_EADF:far_eadf4
        add     sp, 0ch
        mov     ax, word ptr [bp - 0eh]
        mov     dx, word ptr [bp - 10h]
        sub     dx, word ptr [bp - 0ch]
        sbb     ax, word ptr [bp - 0ah]
        mov     word ptr [bp - 12h], ax
        mov     word ptr [bp - 14h], dx
        jmp     br_ffd64
br_ffd1c:
        mov     ax, word ptr [W_9480]
        mov     dx, word ptr [W_947E]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        push    ss
        lea     ax, [bp - 8]
        push    ax
        mov     ax, si
        cwd
        mov     bx, word ptr [bp - 0ah]
        mov     cx, word ptr [bp - 0ch]
        add     cx, ax
        adc     bx, dx
        push    bx
        push    cx
        push    ds
        push    word B_901B
        callf   SEG_EADF:far_eadf4
        add     sp, 0ch
        mov     ax, si
        cwd
        mov     bx, word ptr [W_903F]
        mov     cx, word ptr [W_903D]
        sub     cx, word ptr [bp - 0ch]
        sbb     bx, word ptr [bp - 0ah]
        sub     cx, ax
        sbb     bx, dx
        mov     word ptr [bp - 12h], bx
        mov     word ptr [bp - 14h], cx
br_ffd64:
        mov     al, byte ptr [B_8A9F]
        cbw
        mov     di, ax
        callf   SEG_E598:far_e598e
        push    word ptr [bp - 12h]
        push    word ptr [bp - 14h]
        push    di
        push    cs
        call    fn_ff5b0
        add     sp, 6
        mov     si, ax
        or      ax, ax
        jz      br_ffdb0
        push    ds
        push    word B_8C41
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    0
        callf   SEG_E1E1:far_e1e11
        add     sp, 2
        callf   SEG_E598:far_e59bd
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
br_ffdb0:
        mov     word ptr [bp - 34h], 0
        mov     word ptr [bp - 18h], 0
        mov     ax, word ptr [bp + 0eh]
        mov     dx, word ptr [bp + 0ch]
        mov     word ptr [bp - 1ah], ax
        mov     word ptr [bp - 1ch], dx
        mov     word ptr [bp - 38h], di
        mov     word ptr [bp - 36h], 0
        mov     ax, word ptr [bp + 6]
        mov     word ptr [bp - 2eh], ax
        mov     word ptr [bp - 28h], ax
        mov     word ptr [bp - 26h], 1
        mov     ax, word ptr [W_903F]
        mov     dx, word ptr [W_903D]
        mov     word ptr [bp - 1eh], ax
        mov     word ptr [bp - 20h], dx
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        mov     word ptr [bp - 30h], ax
        mov     word ptr [bp - 32h], dx
        mov     word ptr [bp - 2ah], 1
        mov     word ptr [bp - 2ch], 100h
        mov     ax, word ptr [bp - 12h]
        mov     dx, word ptr [bp - 14h]
        mov     word ptr [bp - 22h], ax
        mov     word ptr [bp - 24h], dx
        push    ss
        lea     ax, [bp - 38h]
        push    ax
        push    cs
        call    fn_ff6a9
        add     sp, 4
        mov     si, ax
        or      ax, ax
        jz      br_ffe3e
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    0
        callf   SEG_E1E1:far_e1e11
        add     sp, 2
        callf   SEG_E598:far_e59bd
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
br_ffe3e:
        push    1
        push    di
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        push    0
        push    0
        push    word ptr [bp + 0eh]
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 6]
        callf   SEG_E734:far_e7341
        add     sp, 0ah
        mov     word ptr [bp - 38h], 0
        mov     word ptr [bp - 34h], 1
        mov     word ptr [bp - 36h], di
        mov     word ptr [bp - 30h], 1
        mov     word ptr [bp - 32h], 100h
        mov     ax, word ptr [bp - 6]
        mov     dx, word ptr [bp - 8]
        mov     word ptr [bp - 2ah], ax
        mov     word ptr [bp - 2ch], dx
        push    ss
        lea     ax, [bp - 38h]
        push    ax
        push    cs
        call    fn_ff6a9
        add     sp, 4
        mov     si, ax
        or      ax, ax
        jz      br_ffeb8
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    0
        callf   SEG_E1E1:far_e1e11
        add     sp, 2
        callf   SEG_E598:far_e59bd
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
br_ffeb8:
        push    0
        callf   SEG_E1E1:far_e1e11
        add     sp, 2
        callf   SEG_E598:far_e5a21
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
        db      33h dup (0ffh)
        elseif  FW_VERSION = 311
        db      058h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        db      0ffh
        phase   5
far_fba0a:
        push    bp
        mov     bp, sp
        sub     sp, 2c0h
        push    si
        push    di
        push    1
        callf   SEG_D793:far_d796d
        add     sp, 2
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
        lea     ax, [bp - 2c0h]
        push    ax
        push    ss
        lea     ax, [bp - 0bch]
        push    ax
        nop
        push    cs
        call    far_fdcfb
        add     sp, 0ah
        mov     di, ax
        mov     al, byte ptr [W_E21D]
        mov     byte ptr [bp - 2], al
        cmp     word ptr [W_E21D], di
        jl      br_fba78
        mov     byte ptr [bp - 2], 0
br_fba78:
        push    10h
        push    ss
        lea     ax, [bp - 2c0h]
        push    ax
        push    ss
        lea     ax, [bp - 2]
        push    ax
        push    ds
        push    word STR_3490
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     si, ax
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        add     ax, 4800h
        mov     word ptr [bp - 3ah], SEG_A28F
        mov     word ptr [bp - 3ch], ax
        cmp     di, 0ffffh
        jz      br_fbac8
        push    1fh
        push    0
        mov     al, byte ptr ss:[si]
        push    ax
        nop
        push    cs
        call    far_fcd4d
        add     sp, 6
br_fbac8:
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
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 16h]
        mov     dx, word ptr es:[bx + 14h]
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        cmp     di, 0ffffh
        jnz     br_fbb0c
        mov     word ptr [bp - 26h], 0
        mov     word ptr [bp - 28h], 0
br_fbb0c:
        push    word ptr [bp - 26h]
        push    word ptr [bp - 28h]
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        push    2
        push    word 3e7h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 14h]
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
        lea     ax, [bp - 16h]
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
        lea     ax, [bp - 18h]
        push    ax
        push    ds
        push    word P_34CD
        callf   SEG_B347:far_b3819
        add     sp, 10h
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 1eh]
        mov     dx, word ptr es:[bx + 1ch]
        mov     word ptr [bp - 2eh], ax
        mov     word ptr [bp - 30h], dx
        mov     ax, word ptr [W_E582]
        mov     dx, word ptr [W_E580]
        cmp     ax, word ptr [bp - 2eh]
        jl      br_fbb9d
        jg      br_fbb90
        cmp     dx, word ptr [bp - 30h]
        jbe     br_fbb9d
br_fbb90:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [W_E582], ax
        mov     word ptr [W_E580], dx
br_fbb9d:
        cmp     word ptr [W_E582], 0
        jg      br_fbbb9
        jl      br_fbbad
        cmp     word ptr [W_E580], 0
        jnc     br_fbbb9
br_fbbad:
        mov     word ptr [W_E582], 0
        mov     word ptr [W_E580], 0
br_fbbb9:
        push    15h
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [W_E582]
        push    word ptr [W_E580]
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        push    2
        push    word 3e7h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 8]
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
        lea     ax, [bp - 0ah]
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
        lea     ax, [bp - 0ch]
        push    ax
        push    ds
        push    word P_34CD
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 1ah]
        mov     dx, word ptr es:[bx + 18h]
        mov     word ptr [bp - 2ah], ax
        mov     word ptr [bp - 2ch], dx
        cmp     di, 0ffffh
        jnz     br_fbc53
        mov     word ptr [bp - 2ah], 0
        mov     word ptr [bp - 2ch], 0
br_fbc53:
        push    word ptr [bp - 2ah]
        push    word ptr [bp - 2ch]
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        push    2
        push    word 3e7h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 1ah]
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
        lea     ax, [bp - 1ch]
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
        lea     ax, [bp - 1eh]
        push    ax
        push    ds
        push    word P_34CD
        callf   SEG_B347:far_b3819
        add     sp, 10h
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        cmp     ax, word ptr [bp - 2eh]
        jl      br_fbcd3
        jg      br_fbcc6
        cmp     dx, word ptr [bp - 30h]
        jbe     br_fbcd3
br_fbcc6:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [W_E57E], ax
        mov     word ptr [W_E57C], dx
br_fbcd3:
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        cmp     ax, word ptr [W_E582]
        jg      br_fbcf6
        jl      br_fbce8
        cmp     dx, word ptr [W_E580]
        jnc     br_fbcf6
br_fbce8:
        mov     ax, word ptr [W_E582]
        mov     dx, word ptr [W_E580]
        mov     word ptr [W_E57E], ax
        mov     word ptr [W_E57C], dx
br_fbcf6:
        cmp     word ptr [W_E57E], 0
        jg      br_fbd12
        jl      br_fbd06
        cmp     word ptr [W_E57C], 0
        jnc     br_fbd12
br_fbd06:
        mov     word ptr [W_E57E], 0
        mov     word ptr [W_E57C], 0
br_fbd12:
        push    15h
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [W_E57E]
        push    word ptr [W_E57C]
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        push    2
        push    word 3e7h
        push    0
        push    3
        push    ss
        lea     ax, [bp - 0eh]
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
        lea     ax, [bp - 10h]
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
        lea     ax, [bp - 12h]
        push    ax
        push    ds
        push    word P_34CD
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     di, 0ffffh
        jnz     br_fbd9b
        mov     word ptr [bp - 2eh], 0
        mov     word ptr [bp - 30h], 0
br_fbd9b:
        push    word ptr [bp - 2eh]
        push    word ptr [bp - 30h]
        push    ss
        lea     ax, [bp - 24h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        push    word ptr [bp - 24h]
        push    word ptr [bp - 22h]
        push    word ptr [bp - 20h]
        push    ds
        push    word STR_34ED
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ah
        push    15h
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     byte ptr [B_E57B], 7
        jl      br_fbddb
        mov     byte ptr [B_E57B], 1
br_fbddb:
        push    0ch
        push    ds
        push    word P_3344
        push    ds
        push    word B_E57B
        push    ds
        push    word STR_3505
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        push    0
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        les     bx, dword ptr [bp - 3ch]
        mov     al, byte ptr es:[bx + 11h]
        mov     byte ptr [bp - 3], al
        cmp     di, 0ffffh
        jnz     br_fbe10
        mov     byte ptr [bp - 3], 64h
br_fbe10:
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
        les     bx, dword ptr [bp - 3ch]
        mov     al, byte ptr es:[bx + 12h]
        cbw
        mov     word ptr [bp - 6], ax
        cmp     di, 0ffffh
        jnz     br_fbe4b
        mov     word ptr [bp - 6], 0
br_fbe4b:
        push    0
        push    78h
        push    0ff88h
        push    4
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word STR_3513
        callf   SEG_B347:far_b3819
        add     sp, 10h
        push    15h
        push    5
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     byte ptr [B_E57A], 8
        jl      br_fbe7c
        mov     byte ptr [B_E57A], 0
br_fbe7c:
        push    10h
        push    ds
        push    word P_3364
        push    ds
        push    word B_E57A
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
        jmp     br_fcc07
br_fbec9:
        mov     al, byte ptr [B_7B8D]
        cbw
        mov     bx, ax
        cmp     bx, 0fh
        jbe     br_fbed7
        jmp     tgt_fc231
br_fbed7:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_fcc60]
tgt_fbede:
        cmp     di, 0ffffh
        jnz     br_fbee6
        jmp     tgt_fc231
br_fbee6:
        mov     al, byte ptr [bp - 2]
        cbw
        mov     si, ax
        mov     word ptr [W_E21D], ax
        mov     bx, si
        lea     ax, [bp - 0bch]
        add     bx, ax
        mov     si, bx
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        add     ax, 4800h
        mov     word ptr [bp - 3ah], SEG_A28F
        mov     word ptr [bp - 3ch], ax
        push    1fh
        push    0
        mov     al, byte ptr ss:[si]
        push    ax
        nop
        push    cs
        call    far_fcd4d
        add     sp, 6
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 16h]
        mov     dx, word ptr es:[bx + 14h]
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 1ah]
        mov     dx, word ptr es:[bx + 18h]
        mov     word ptr [bp - 2ah], ax
        mov     word ptr [bp - 2ch], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 1eh]
        mov     dx, word ptr es:[bx + 1ch]
        mov     word ptr [bp - 2eh], ax
        mov     word ptr [bp - 30h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 24h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 24h]
        push    word ptr [bp - 22h]
        push    word ptr [bp - 20h]
        push    ds
        push    word STR_34ED
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ah
        les     bx, dword ptr [bp - 3ch]
        mov     al, byte ptr es:[bx + 11h]
        mov     byte ptr [bp - 3], al
        mov     al, byte ptr es:[bx + 12h]
        cbw
        mov     word ptr [bp - 6], ax
        mov     ax, word ptr [W_E582]
        mov     dx, word ptr [W_E580]
        cmp     ax, word ptr [bp - 2eh]
        jl      br_fbfdf
        jg      br_fbfc3
        cmp     dx, word ptr [bp - 30h]
        jbe     br_fbfdf
br_fbfc3:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [W_E582], ax
        mov     word ptr [W_E580], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fbfdf:
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        cmp     ax, word ptr [bp - 2eh]
        jl      br_fc00e
        jg      br_fbff2
        cmp     dx, word ptr [bp - 30h]
        jbe     br_fc00e
br_fbff2:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [W_E57E], ax
        mov     word ptr [W_E57C], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fc00e:
        nop
        push    cs
        call    fn_fcd29
        jmp     tgt_fc231
tgt_fc016:
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        nop
        push    cs
        call    fn_fdb22
        add     sp, 4
        mov     word ptr [bp - 26h], dx
        mov     word ptr [bp - 28h], ax
        mov     ax, word ptr [bp - 26h]
        mov     dx, word ptr [bp - 28h]
        cmp     ax, word ptr [bp - 2eh]
        jl      br_fc056
        jg      br_fc03b
        cmp     dx, word ptr [bp - 30h]
        jbe     br_fc056
br_fc03b:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fc056:
        mov     ax, word ptr [bp - 26h]
        mov     dx, word ptr [bp - 28h]
        cmp     ax, word ptr [bp - 2ah]
        jl      br_fc083
        jg      br_fc068
        cmp     dx, word ptr [bp - 2ch]
        jbe     br_fc083
br_fc068:
        mov     ax, word ptr [bp - 26h]
        mov     dx, word ptr [bp - 28h]
        mov     word ptr [bp - 2ah], ax
        mov     word ptr [bp - 2ch], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fc083:
        nop
        push    cs
        call    fn_fcd29
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr [bp - 26h]
        mov     dx, word ptr [bp - 28h]
        mov     word ptr es:[bx + 16h], ax
        mov     word ptr es:[bx + 14h], dx
        jmp     tgt_fc231
tgt_fc09c:
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        nop
        push    cs
        call    fn_fdb22
        add     sp, 4
        mov     word ptr [W_E582], dx
        mov     word ptr [W_E580], ax
        mov     ax, word ptr [W_E582]
        mov     dx, word ptr [W_E580]
        cmp     ax, word ptr [bp - 2eh]
        jl      br_fc0df
        jg      br_fc0c3
        cmp     dx, word ptr [bp - 30h]
        jbe     br_fc0df
br_fc0c3:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [W_E582], ax
        mov     word ptr [W_E580], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fc0df:
        mov     ax, word ptr [W_E582]
        mov     dx, word ptr [W_E580]
        cmp     ax, word ptr [W_E57E]
        jl      br_fc111
        jg      br_fc0f4
        cmp     dx, word ptr [W_E57C]
        jbe     br_fc111
br_fc0f4:
        mov     ax, word ptr [W_E582]
        mov     dx, word ptr [W_E580]
        mov     word ptr [W_E57E], ax
        mov     word ptr [W_E57C], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fc111:
        nop
        push    cs
        call    fn_fcd29
        jmp     tgt_fc231
tgt_fc119:
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        nop
        push    cs
        call    fn_fdb22
        add     sp, 4
        mov     word ptr [bp - 2ah], dx
        mov     word ptr [bp - 2ch], ax
        mov     ax, word ptr [bp - 2ah]
        mov     dx, word ptr [bp - 2ch]
        cmp     ax, word ptr [bp - 2eh]
        jl      br_fc159
        jg      br_fc13e
        cmp     dx, word ptr [bp - 30h]
        jbe     br_fc159
br_fc13e:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [bp - 2ah], ax
        mov     word ptr [bp - 2ch], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fc159:
        mov     ax, word ptr [bp - 2ah]
        mov     dx, word ptr [bp - 2ch]
        cmp     ax, word ptr [bp - 26h]
        jg      br_fc186
        jl      br_fc16b
        cmp     dx, word ptr [bp - 28h]
        jnc     br_fc186
br_fc16b:
        mov     ax, word ptr [bp - 2ah]
        mov     dx, word ptr [bp - 2ch]
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fc186:
        nop
        push    cs
        call    fn_fcd29
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr [bp - 2ah]
        mov     dx, word ptr [bp - 2ch]
        mov     word ptr es:[bx + 1ah], ax
        mov     word ptr es:[bx + 18h], dx
        jmp     near tgt_fc231
tgt_fc19f:
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        nop
        push    cs
        call    fn_fdb22
        add     sp, 4
        mov     word ptr [W_E57E], dx
        mov     word ptr [W_E57C], ax
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        cmp     ax, word ptr [bp - 2eh]
        jl      br_fc1e2
        jg      br_fc1c6
        cmp     dx, word ptr [bp - 30h]
        jbe     br_fc1e2
br_fc1c6:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [W_E57E], ax
        mov     word ptr [W_E57C], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fc1e2:
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        cmp     ax, word ptr [W_E582]
        jg      br_fc214
        jl      br_fc1f7
        cmp     dx, word ptr [W_E580]
        jnc     br_fc214
br_fc1f7:
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        mov     word ptr [W_E582], ax
        mov     word ptr [W_E580], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fc214:
        nop
        push    cs
        call    fn_fcd29
        jmp     tgt_fc231
tgt_fc21b:
        les     bx, dword ptr [bp - 3ch]
        mov     al, byte ptr [bp - 3]
        mov     byte ptr es:[bx + 11h], al
        jmp     tgt_fc231
tgt_fc227:
        les     bx, dword ptr [bp - 3ch]
        mov     al, byte ptr [bp - 6]
        mov     byte ptr es:[bx + 12h], al
tgt_fc231:
        push    44h
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     byte ptr [bp - 1], al
        or      al, al
        jnz     br_fc245
        jmp     br_fbec9
br_fc245:
        cbw
        cmp     ax, 78h
        jz      br_fc278
        jg      br_fc268
        cmp     ax, 44h
        jnz     br_fc255
        jmp     br_fcaae
br_fc255:
        cmp     ax, 4eh
        jnz     br_fc25d
        jmp     br_fcaae
br_fc25d:
        cmp     ax, 75h
        jnz     br_fc265
        jmp     br_fc4f6
br_fc265:
        jmp     br_fcc07
br_fc268:
        cmp     ax, 79h
        jz      br_fc2b1
        cmp     ax, 7ah
        jnz     br_fc275
        jmp     near br_fc31e
br_fc275:
        jmp     br_fcc07
br_fc278:
        mov     byte ptr [bp - 1], 0
        cmp     di, 0ffffh
        jnz     br_fc284
        jmp     br_fcc07
br_fc284:
        callf   SEG_CB8A:far_cc60f
        or      ax, ax
        jz      br_fc295
        callf   SEG_CB8A:far_cc62d
        jmp     br_fcc07
br_fc295:
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        callf   SEG_CB8A:far_cc583
        add     sp, 2
        jmp     br_fcc07
br_fc2b1:
        mov     byte ptr [bp - 1], 0
        cmp     di, 0ffffh
        jnz     br_fc2bd
        jmp     br_fcc07
br_fc2bd:
        push    ss
        lea     ax, [bp - 28h]
        push    ax
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    fn_fde02
        add     sp, 6
        mov     byte ptr [bp - 1], al
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, word ptr [bp - 26h]
        mov     cx, word ptr [bp - 28h]
        mov     es, dx
        xchg    bx, ax
        mov     word ptr es:[bx + 4816h], ax
        mov     word ptr es:[bx + 4814h], cx
        cmp     byte ptr [bp - 1], 4ch
        jz      br_fc311
        jmp     br_fcc07
br_fc311:
        push    36h
        callf   SEG_D79E:far_d7a63
        add     sp, 2
        jmp     br_fcc07
br_fc31e:
        mov     byte ptr [bp - 1], 0
        cmp     di, 0ffffh
        jnz     br_fc32a
        jmp     br_fcc07
br_fc32a:
        mov     ax, word ptr [bp - 26h]
        mov     dx, word ptr [bp - 28h]
        mov     word ptr [bp - 32h], ax
        mov     word ptr [bp - 34h], dx
        mov     ax, word ptr [bp - 2ah]
        mov     dx, word ptr [bp - 2ch]
        mov     word ptr [bp - 36h], ax
        mov     word ptr [bp - 38h], dx
        mov     al, byte ptr [B_E57B]
        cbw
        mov     bx, ax
        cmp     bx, 6
        jbe     br_fc350
        jmp     br_fc4d4
br_fc350:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_fcc52]
tgt_fc357:
        les     bx, dword ptr [bp - 3ch]
        mov     word ptr es:[bx + 16h], 0
        mov     word ptr es:[bx + 14h], 0
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr es:[bx + 1ah], ax
        mov     word ptr es:[bx + 18h], dx
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        nop
        push    cs
        call    fn_fcc80
        add     sp, 2
        jmp     br_fc4d4
tgt_fc390:
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr [W_E582]
        mov     dx, word ptr [W_E580]
        mov     word ptr es:[bx + 16h], ax
        mov     word ptr es:[bx + 14h], dx
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        mov     word ptr es:[bx + 1ah], ax
        mov     word ptr es:[bx + 18h], dx
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        nop
        push    cs
        call    fn_fcc80
        add     sp, 2
        jmp     br_fc4d4
tgt_fc3cd:
        push    ds
        push    word STR_356C
        callf   SEG_CC84:far_cd551
        add     sp, 4
        mov     dl, al
        or      al, al
        jge     br_fc3e2
        jmp     br_fc4d4
br_fc3e2:
        cbw
        push    ax
        nop
        push    cs
        call    fn_fcc80
        add     sp, 2
        jmp     br_fc4d4
tgt_fc3ef:
        les     bx, dword ptr [bp - 3ch]
        mov     word ptr es:[bx + 16h], 0
        mov     word ptr es:[bx + 14h], 0
        mov     ax, word ptr [W_E582]
        mov     dx, word ptr [W_E580]
        mov     word ptr es:[bx + 1ah], ax
        mov     word ptr es:[bx + 18h], dx
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        nop
        push    cs
        call    fn_fcc80
        add     sp, 2
        jmp     near br_fc4d4
tgt_fc429:
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        mov     word ptr es:[bx + 16h], ax
        mov     word ptr es:[bx + 14h], dx
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr es:[bx + 1ah], ax
        mov     word ptr es:[bx + 18h], dx
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        nop
        push    cs
        call    fn_fcc80
        add     sp, 2
        jmp     br_fc4d4
tgt_fc464:
        les     bx, dword ptr [bp - 3ch]
        mov     word ptr es:[bx + 16h], 0
        mov     word ptr es:[bx + 14h], 0
        mov     ax, word ptr [bp - 26h]
        mov     dx, word ptr [bp - 28h]
        mov     word ptr es:[bx + 1ah], ax
        mov     word ptr es:[bx + 18h], dx
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        nop
        push    cs
        call    fn_fcc80
        add     sp, 2
        jmp     br_fc4d4
tgt_fc49c:
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr [bp - 2ah]
        mov     dx, word ptr [bp - 2ch]
        mov     word ptr es:[bx + 16h], ax
        mov     word ptr es:[bx + 14h], dx
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr es:[bx + 1ah], ax
        mov     word ptr es:[bx + 18h], dx
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        cbw
        push    ax
        nop
        push    cs
        call    fn_fcc80
        add     sp, 2
br_fc4d4:
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr [bp - 32h]
        mov     dx, word ptr [bp - 34h]
        mov     word ptr es:[bx + 16h], ax
        mov     word ptr es:[bx + 14h], dx
        mov     ax, word ptr [bp - 36h]
        mov     dx, word ptr [bp - 38h]
        mov     word ptr es:[bx + 1ah], ax
        mov     word ptr es:[bx + 18h], dx
        jmp     br_fcc07
br_fc4f6:
        mov     byte ptr [bp - 1], 0
        cmp     di, 0ffffh
        jnz     br_fc502
        jmp     br_fcc07
br_fc502:
        mov     al, byte ptr [B_E57A]
        cbw
        mov     bx, ax
        cmp     bx, 7
        jbe     br_fc510
        jmp     br_fcc07
br_fc510:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_fcc42]
tgt_fc517:
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        cmp     ax, word ptr [W_E582]
        jg      br_fc532
        jz      br_fc529
        jmp     br_fcc07
br_fc529:
        cmp     dx, word ptr [W_E580]
        ja      br_fc532
        jmp     br_fcc07
br_fc532:
        push    word ptr [W_E57E]
        push    word ptr [W_E57C]
        push    word ptr [W_E582]
        push    word ptr [W_E580]
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    fn_fcd96
        add     sp, 0ah
        mov     si, ax
        or      si, si
        jl      br_fc563
        jmp     br_fcc07
br_fc563:
        callf   SEG_B1AA:far_b1af9
        mov     ax, si
        mov     dx, 0ffffh
        imul    dx
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        callf   SEG_B1AA:far_b1aff
        jmp     br_fcc07
tgt_fc580:
        push    word ptr [W_E582]
        push    word ptr [W_E580]
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    fn_fcf15
        add     sp, 6
        mov     si, ax
        or      si, si
        jge     br_fc5c0
        callf   SEG_B1AA:far_b1af9
        mov     ax, si
        mov     dx, 0ffffh
        imul    dx
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        callf   SEG_B1AA:far_b1aff
br_fc5c0:
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 16h]
        mov     dx, word ptr es:[bx + 14h]
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 1ah]
        mov     dx, word ptr es:[bx + 18h]
        mov     word ptr [bp - 2ah], ax
        mov     word ptr [bp - 2ch], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        nop
        push    cs
        call    fn_fcd29
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 1eh]
        mov     dx, word ptr es:[bx + 1ch]
        mov     word ptr [bp - 2eh], ax
        mov     word ptr [bp - 30h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 24h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 24h]
        push    word ptr [bp - 22h]
        push    word ptr [bp - 20h]
        push    ds
        push    word STR_34ED
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ah
        jmp     br_fcc07
tgt_fc649:
        push    word ptr [W_E57E]
        push    word ptr [W_E57C]
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    fn_fcf15
        add     sp, 6
        mov     si, ax
        or      si, si
        jge     br_fc689
        callf   SEG_B1AA:far_b1af9
        mov     ax, si
        mov     dx, 0ffffh
        imul    dx
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        callf   SEG_B1AA:far_b1aff
br_fc689:
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 16h]
        mov     dx, word ptr es:[bx + 14h]
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 1ah]
        mov     dx, word ptr es:[bx + 18h]
        mov     word ptr [bp - 2ah], ax
        mov     word ptr [bp - 2ch], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        nop
        push    cs
        call    fn_fcd29
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 1eh]
        mov     dx, word ptr es:[bx + 1ch]
        mov     word ptr [bp - 2eh], ax
        mov     word ptr [bp - 30h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 24h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 24h]
        push    word ptr [bp - 22h]
        push    word ptr [bp - 20h]
        push    ds
        push    word STR_34ED
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ah
        jmp     br_fcc07
tgt_fc712:
        push    word ptr [W_E57E]
        push    word ptr [W_E57C]
        push    word ptr [W_E582]
        push    word ptr [W_E580]
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    fn_fd7ef
        add     sp, 0ah
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 16h]
        mov     dx, word ptr es:[bx + 14h]
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 1ah]
        mov     dx, word ptr es:[bx + 18h]
        mov     word ptr [bp - 2ah], ax
        mov     word ptr [bp - 2ch], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        nop
        push    cs
        call    fn_fcd29
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 1eh]
        mov     dx, word ptr es:[bx + 1ch]
        mov     word ptr [bp - 2eh], ax
        mov     word ptr [bp - 30h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 24h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 24h]
        push    word ptr [bp - 22h]
        push    word ptr [bp - 20h]
        push    ds
        push    word STR_34ED
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ah
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        cmp     ax, word ptr [bp - 2eh]
        jge     br_fc7cf
        jmp     br_fcc07
br_fc7cf:
        jg      br_fc7d9
        cmp     dx, word ptr [bp - 30h]
        ja      br_fc7d9
        jmp     br_fcc07
br_fc7d9:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [W_E57E], ax
        mov     word ptr [W_E57C], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        nop
        push    cs
        call    fn_fcd29
        jmp     br_fcc07
tgt_fc7fd:
        push    word ptr [bp - 26h]
        push    word ptr [bp - 28h]
        push    0
        push    0
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    fn_fd7ef
        add     sp, 0ah
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
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
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
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
        mov     word ptr [bp - 2ah], ax
        mov     word ptr [bp - 2ch], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
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
        mov     word ptr [bp - 2eh], ax
        mov     word ptr [bp - 30h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 24h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 24h]
        push    word ptr [bp - 22h]
        push    word ptr [bp - 20h]
        push    ds
        push    word STR_34ED
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ah
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        cmp     ax, word ptr [bp - 2eh]
        jl      br_fc920
        jg      br_fc904
        cmp     dx, word ptr [bp - 30h]
        jbe     br_fc920
br_fc904:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [W_E57E], ax
        mov     word ptr [W_E57C], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fc920:
        nop
        push    cs
        call    fn_fcd29
        jmp     br_fcc07
tgt_fc928:
        push    word ptr [bp - 2eh]
        push    word ptr [bp - 30h]
        push    word ptr [bp - 2ah]
        push    word ptr [bp - 2ch]
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    fn_fd7ef
        add     sp, 0ah
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
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
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
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
        mov     word ptr [bp - 2ah], ax
        mov     word ptr [bp - 2ch], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
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
        mov     word ptr [bp - 2eh], ax
        mov     word ptr [bp - 30h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 24h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 24h]
        push    word ptr [bp - 22h]
        push    word ptr [bp - 20h]
        push    ds
        push    word STR_34ED
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ah
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        cmp     ax, word ptr [bp - 2eh]
        jl      br_fca4d
        jg      br_fca31
        cmp     dx, word ptr [bp - 30h]
        jbe     br_fca4d
br_fca31:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [W_E57E], ax
        mov     word ptr [W_E57C], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fca4d:
        nop
        push    cs
        call    fn_fcd29
        jmp     br_fcc07
tgt_fca55:
        push    word ptr [W_E57E]
        push    word ptr [W_E57C]
        push    word ptr [W_E582]
        push    word ptr [W_E580]
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    fn_fd677
        add     sp, 0ah
        jmp     br_fcc07
tgt_fca80:
        push    word ptr [W_E57E]
        push    word ptr [W_E57C]
        push    word ptr [W_E582]
        push    word ptr [W_E580]
        mov     al, byte ptr [bp - 2]
        cbw
        lea     dx, [bp - 0bch]
        add     ax, dx
        mov     bx, ax
        mov     al, byte ptr ss:[bx]
        push    ax
        nop
        push    cs
        call    fn_fd3b7
        add     sp, 0ah
        jmp     br_fcc07
fn_fcaab:
        jmp     br_fcc07
br_fcaae:
        mov     byte ptr [bp - 1], 0
        cmp     di, 0ffffh
        jnz     br_fcaba
        jmp     br_fcc07
br_fcaba:
        push    ss
        lea     ax, [bp - 0bch]
        push    ax
        mov     al, byte ptr [B_D4C0]
        cbw
        push    ax
        callf   SEG_C495:far_c529a
        add     sp, 6
        mov     byte ptr [bp - 2], al
        or      al, al
        jnz     br_fcad7
        jmp     br_fcc07
br_fcad7:
        dec     byte ptr [bp - 2]
        mov     al, byte ptr [bp - 2]
        cbw
        mov     si, ax
        mov     word ptr [W_E21D], ax
        mov     bx, si
        lea     ax, [bp - 0bch]
        add     bx, ax
        mov     si, bx
        mov     al, byte ptr ss:[bx]
        cbw
        mov     dx, 24h
        imul    dx
        add     ax, 4800h
        mov     word ptr [bp - 3ah], SEG_A28F
        mov     word ptr [bp - 3ch], ax
        push    1fh
        push    0
        mov     al, byte ptr ss:[si]
        push    ax
        nop
        push    cs
        call    far_fcd4d
        add     sp, 6
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 16h]
        mov     dx, word ptr es:[bx + 14h]
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 1ah]
        mov     dx, word ptr es:[bx + 18h]
        mov     word ptr [bp - 2ah], ax
        mov     word ptr [bp - 2ch], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 1eh]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        les     bx, dword ptr [bp - 3ch]
        mov     ax, word ptr es:[bx + 1eh]
        mov     dx, word ptr es:[bx + 1ch]
        mov     word ptr [bp - 2eh], ax
        mov     word ptr [bp - 30h], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 24h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
        push    0
        push    4
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 24h]
        push    word ptr [bp - 22h]
        push    word ptr [bp - 20h]
        push    ds
        push    word STR_34ED
        callf   SEG_B1B5:far_b1d48
        add     sp, 0ah
        les     bx, dword ptr [bp - 3ch]
        mov     al, byte ptr es:[bx + 11h]
        mov     byte ptr [bp - 3], al
        mov     al, byte ptr es:[bx + 12h]
        cbw
        mov     word ptr [bp - 6], ax
        mov     ax, word ptr [W_E582]
        mov     dx, word ptr [W_E580]
        cmp     ax, word ptr [bp - 2eh]
        jl      br_fcbd3
        jg      br_fcbb7
        cmp     dx, word ptr [bp - 30h]
        jbe     br_fcbd3
br_fcbb7:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [W_E582], ax
        mov     word ptr [W_E580], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fcbd3:
        mov     ax, word ptr [W_E57E]
        mov     dx, word ptr [W_E57C]
        cmp     ax, word ptr [bp - 2eh]
        jl      br_fcc02
        jg      br_fcbe6
        cmp     dx, word ptr [bp - 30h]
        jbe     br_fcc02
br_fcbe6:
        mov     ax, word ptr [bp - 2eh]
        mov     dx, word ptr [bp - 30h]
        mov     word ptr [W_E57E], ax
        mov     word ptr [W_E57C], dx
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 12h]
        push    ax
        nop
        push    cs
        call    fn_fdb76
        add     sp, 8
br_fcc02:
        nop
        push    cs
        call    fn_fcd29
br_fcc07:
        cmp     byte ptr [bp - 1], 0
        jnz     br_fcc10
        jmp     tgt_fc231
br_fcc10:
        push    ds
        push    word STR_356C
        callf   SEG_CC84:far_cd551
        add     sp, 4
        mov     dl, al
        or      al, al
        jl      br_fcc30
        push    1
        push    0
        cbw
        push    ax
        callf   SEG_CC84:far_cd353
        add     sp, 6
br_fcc30:
        push    0
        callf   SEG_D793:far_d796d
        add     sp, 2
        mov     al, byte ptr [bp - 1]
        cbw
        pop     di
        pop     si
        leave
        retf
TBL_fcc42:
        dw      tgt_fc517
        dw      tgt_fc580
        dw      tgt_fc649
        dw      tgt_fc712
        dw      tgt_fc7fd
        dw      tgt_fc928
        dw      tgt_fca55
        dw      tgt_fca80
TBL_fcc52:
        dw      tgt_fc357
        dw      tgt_fc390
        dw      tgt_fc3cd
        dw      tgt_fc3ef
        dw      tgt_fc429
        dw      tgt_fc464
        dw      tgt_fc49c
TBL_fcc60:
        dw      tgt_fbede
        dw      tgt_fc016
        dw      tgt_fc016
        dw      tgt_fc016
        dw      tgt_fc09c
        dw      tgt_fc09c
        dw      tgt_fc09c
        dw      tgt_fc119
        dw      tgt_fc119
        dw      tgt_fc119
        dw      tgt_fc19f
        dw      tgt_fc19f
        dw      tgt_fc19f
        dw      tgt_fc231
        dw      tgt_fc21b
        dw      tgt_fc227
fn_fcc80:
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
        jg      br_fcce1
        jnz     br_fcccd
        cmp     dx, word ptr es:[si + 481ch]
        ja      br_fcce1
br_fcccd:
        mov     ax, SEG_A28F
        mov     es, ax
        add     word ptr es:[si + 4818h], 557h
        adc     word ptr es:[si + 481ah], 0
        jmp     br_fccff
br_fcce1:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[si + 481eh]
        mov     dx, word ptr es:[si + 481ch]
        mov     bx, SEG_A28F
        mov     es, bx
        mov     word ptr es:[si + 481ah], ax
        mov     word ptr es:[si + 4818h], dx
br_fccff:
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
fn_fcd29:
        push    bp
        mov     bp, sp
        sub     sp, 2
        mov     word ptr [bp - 2], 0
        jmp     br_fcd45
loop_fcd36:
        mov     al, byte ptr [bp - 2]
        push    ax
        callf   SEG_B05A:far_b1073
        add     sp, 2
        inc     word ptr [bp - 2]
br_fcd45:
        cmp     word ptr [bp - 2], 10h
        jle     loop_fcd36
        leave
        retf
far_fcd4d:
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
        jnz     br_fcd88
        push    ds
        push    word STR_3579
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        pop     bp
        retf
br_fcd88:
        push    ds
        push    word STR_3579+5
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        pop     bp
        retf
fn_fcd96:
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
        jl      br_fcdbe
        push    1
        push    0
        cbw
        push    ax
        callf   SEG_CC84:far_cd353
        add     sp, 6
br_fcdbe:
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
        jge     br_fce07
        cbw
        pop     si
        leave
        retf
br_fce07:
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
        jnz     br_fcef8
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
br_fcef8:
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
fn_fcf15:
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
        jnz     br_fcf38
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_fcf38:
        mov     al, byte ptr [bp + 6]
        cbw
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        cmp     byte ptr es:[bx + 4813h], 0
        jz      br_fcf6f
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
        jmp     br_fcf88
br_fcf6f:
        mov     ax, word ptr [bp - 14h]
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     dx, word ptr es:[bx + 481eh]
        mov     ax, word ptr es:[bx + 481ch]
br_fcf88:
        push    ax
        push    dx
        callf   SEG_CC84:far_cca70
        pop     bx
        cmp     bx, dx
        pop     dx
        jl      br_fcfa2
        jg      br_fcf9b
        cmp     dx, ax
        jbe     br_fcfa2
br_fcf9b:
        mov     ax, 0fffeh
        pop     di
        pop     si
        leave
        retf
br_fcfa2:
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
        jnz     br_fd0c2
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
        jmp     br_fd109
br_fd0c2:
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
br_fd109:
        mov     word ptr [bp - 12h], 0
        xor     si, si
        mov     al, byte ptr [bp + 6]
        cbw
        mov     dx, 24h
        imul    dx
        mov     di, ax
loop_fd11b:
        mov     ax, SEG_A28F
        mov     es, ax
        cmp     byte ptr es:[si + 4800h], 0
        jz      br_fd173
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 4822h]
        mov     dx, word ptr es:[di + 4820h]
        mov     bx, SEG_A28F
        mov     es, bx
        cmp     ax, word ptr es:[si + 4822h]
        jg      br_fd173
        jl      br_fd14c
        cmp     dx, word ptr es:[si + 4820h]
        jnc     br_fd173
br_fd14c:
        cmp     word ptr [bp - 18h], 0
        jz      br_fd15e
        mov     dx, word ptr [bp - 0eh]
        mov     ax, word ptr [bp - 10h]
        shl     ax, 1
        rcl     dx, 1
        jmp     br_fd164
br_fd15e:
        mov     dx, word ptr [bp - 0eh]
        mov     ax, word ptr [bp - 10h]
br_fd164:
        mov     bx, SEG_A28F
        mov     es, bx
        add     word ptr es:[si + 4820h], ax
        adc     word ptr es:[si + 4822h], dx
br_fd173:
        add     si, 24h
        inc     word ptr [bp - 12h]
        cmp     si, 1200h
        jnz     loop_fd11b
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
        jz      br_fd1ae
        jmp     near br_fd238
br_fd1ae:
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
br_fd238:
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
        jl      br_fd2d2
        jg      br_fd2bd
        cmp     dx, word ptr [bp + 8]
        jbe     br_fd2d2
br_fd2bd:
        mov     ax, SEG_A28F
        mov     dx, word ptr [bp - 0eh]
        mov     bx, word ptr [bp - 10h]
        mov     es, ax
        add     word ptr es:[di + 4814h], bx
        adc     word ptr es:[di + 4816h], dx
br_fd2d2:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 481ah]
        mov     dx, word ptr es:[di + 4818h]
        cmp     ax, word ptr [bp + 0ah]
        jl      br_fd302
        jg      br_fd2ed
        cmp     dx, word ptr [bp + 8]
        jbe     br_fd302
br_fd2ed:
        mov     ax, SEG_A28F
        mov     dx, word ptr [bp - 0eh]
        mov     bx, word ptr [bp - 10h]
        mov     es, ax
        add     word ptr es:[di + 4818h], bx
        adc     word ptr es:[di + 481ah], dx
br_fd302:
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
        jnz     br_fd358
        cmp     word ptr [bp - 18h], 1
        jnz     br_fd358
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
br_fd358:
        cmp     word ptr [bp - 16h], 1
        jnz     br_fd394
        cmp     word ptr [bp - 18h], 1
        jnz     br_fd394
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
br_fd394:
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
fn_fd3b7:
        push    bp
        mov     bp, sp
        sub     sp, 24h
        push    si
        push    di
        mov     ax, word ptr [bp + 0ah]
        mov     dx, word ptr [bp + 8]
        cmp     ax, word ptr [bp + 0eh]
        jl      br_fd3d7
        jz      br_fd3cf
        jmp     br_fd5d7
br_fd3cf:
        cmp     dx, word ptr [bp + 0ch]
        jc      br_fd3d7
        jmp     br_fd5d7
br_fd3d7:
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
        jmp     br_fd59e
br_fd43c:
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
        jmp     br_fd57d
br_fd499:
        mov     ax, word ptr [bp - 16h]
        mov     dx, word ptr [bp - 18h]
        cmp     ax, word ptr [bp - 12h]
        jg      br_fd4b9
        jl      br_fd4ab
        cmp     dx, word ptr [bp - 14h]
        jnc     br_fd4b9
br_fd4ab:
        mov     ax, word ptr [bp - 16h]
        mov     dx, word ptr [bp - 18h]
        mov     word ptr [bp - 0eh], ax
        mov     word ptr [bp - 10h], dx
        jmp     br_fd4c5
br_fd4b9:
        mov     ax, word ptr [bp - 12h]
        mov     dx, word ptr [bp - 14h]
        mov     word ptr [bp - 0eh], ax
        mov     word ptr [bp - 10h], dx
br_fd4c5:
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
        call    fn_fd5db
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
        call    fn_fd5db
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
br_fd57d:
        cmp     word ptr [bp - 16h], 0
        jle     br_fd586
        jmp     br_fd499
br_fd586:
        jnz     br_fd591
        cmp     word ptr [bp - 18h], 0
        jbe     br_fd591
        jmp     br_fd499
br_fd591:
        mov     ax, word ptr [bp - 0ah]
        mov     dx, word ptr [bp - 0ch]
        add     word ptr [bp - 24h], dx
        adc     word ptr [bp - 22h], ax
        inc     si
br_fd59e:
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
        jle     br_fd5bf
        jmp     br_fd43c
br_fd5bf:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3546
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_fd5d7:
        pop     di
        pop     si
        leave
        retf
fn_fd5db:
        push    bp
        mov     bp, sp
        sub     sp, 0eh
        cmp     word ptr [bp + 8], 0
        jl      br_fd5f6
        jle     br_fd5ec
        jmp     near br_fd675
br_fd5ec:
        cmp     word ptr [bp + 6], 1200h
        jbe     br_fd5f6
        jmp     near br_fd675
br_fd5f6:
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
        jmp     br_fd65a
loop_fd632:
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
br_fd65a:
        push    0
        push    2
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   0f800h:far_fa0fe
        cmp     dx, word ptr [bp - 0ah]
        jg      loop_fd632
        jnz     br_fd675
        cmp     ax, word ptr [bp - 0ch]
        ja      loop_fd632
br_fd675:
        leave
        retf
fn_fd677:
        push    bp
        mov     bp, sp
        sub     sp, 18h
        push    si
        push    di
        mov     ax, word ptr [bp + 0ah]
        mov     dx, word ptr [bp + 8]
        cmp     ax, word ptr [bp + 0eh]
        jl      br_fd697
        jz      br_fd68f
        jmp     br_fd7eb
br_fd68f:
        cmp     dx, word ptr [bp + 0ch]
        jc      br_fd697
        jmp     br_fd7eb
br_fd697:
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
        jmp     br_fd7b4
br_fd6e3:
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
        jmp     short br_fd77f
br_fd703:
        mov     ax, word ptr [bp - 0eh]
        mov     dx, word ptr [bp - 10h]
        cmp     ax, word ptr [bp - 0ah]
        jg      br_fd723
        jl      br_fd715
        cmp     dx, word ptr [bp - 0ch]
        jnc     br_fd723
br_fd715:
        mov     ax, word ptr [bp - 0eh]
        mov     dx, word ptr [bp - 10h]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        jmp     br_fd72f
br_fd723:
        mov     ax, word ptr [bp - 0ah]
        mov     dx, word ptr [bp - 0ch]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
br_fd72f:
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
br_fd77f:
        cmp     word ptr [bp - 0eh], 0
        jle     br_fd788
        jmp     near br_fd703
br_fd788:
        jnz     br_fd793
        cmp     word ptr [bp - 10h], 0
        jbe     br_fd793
        jmp     near br_fd703
br_fd793:
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
br_fd7b4:
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
        jle     br_fd7d3
        jmp     br_fd6e3
br_fd7d3:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3546
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_fd7eb:
        pop     di
        pop     si
        leave
        retf
fn_fd7ef:
        push    bp
        mov     bp, sp
        sub     sp, 0ch
        push    si
        push    di
        mov     ax, word ptr [bp + 0ah]
        mov     dx, word ptr [bp + 8]
        cmp     ax, word ptr [bp + 0eh]
        jl      br_fd80f
        jz      br_fd807
        jmp     br_fdb1e
br_fd807:
        cmp     dx, word ptr [bp + 0ch]
        jc      br_fd80f
        jmp     br_fdb1e
br_fd80f:
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
        jnz     br_fd844
        jmp     br_fd972
br_fd844:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 481eh]
        mov     si, ax
        mov     dx, word ptr es:[di + 481ch]
        mov     word ptr [bp - 2], dx
        cmp     ax, word ptr [bp + 0eh]
        jnz     br_fd8a5
        cmp     dx, word ptr [bp + 0ch]
        jnz     br_fd8a5
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
        jmp     br_fd9ce
br_fd8a5:
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
        jmp     br_fd9ce
br_fd972:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 481eh]
        mov     si, ax
        mov     dx, word ptr es:[di + 481ch]
        mov     word ptr [bp - 2], dx
        cmp     ax, word ptr [bp + 0eh]
        jnz     br_fd990
        cmp     dx, word ptr [bp + 0ch]
        jz      br_fd9ce
br_fd990:
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
br_fd9ce:
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
        jge     br_fda13
        jmp     near br_fdaa3
br_fda13:
        jnz     br_fda1d
        cmp     dx, word ptr [bp + 0ch]
        jnc     br_fda1d
        jmp     near br_fdaa3
br_fda1d:
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
        jge     br_fda55
        jmp     near br_fdb01
br_fda55:
        jnz     br_fda5f
        cmp     dx, word ptr [bp + 8]
        jnc     br_fda5f
        jmp     near br_fdb01
br_fda5f:
        mov     ax, word ptr [bp - 0ah]
        mov     dx, word ptr [bp - 0ch]
        cmp     ax, word ptr [bp + 0eh]
        jl      br_fda8e
        jg      br_fda71
        cmp     dx, word ptr [bp + 0ch]
        jbe     br_fda8e
br_fda71:
        mov     ax, SEG_A28F
        mov     dx, word ptr [bp + 0eh]
        mov     bx, word ptr [bp + 0ch]
        sub     bx, word ptr [bp + 8]
        sbb     dx, word ptr [bp + 0ah]
        mov     es, ax
        sub     word ptr es:[di + 4814h], bx
        sbb     word ptr es:[di + 4816h], dx
        jmp     br_fdb01
br_fda8e:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     word ptr es:[di + 4816h], 0
        mov     word ptr es:[di + 4814h], 0
        jmp     br_fdb01
br_fdaa3:
        mov     ax, word ptr [bp - 6]
        mov     dx, word ptr [bp - 8]
        cmp     ax, word ptr [bp + 0ah]
        jl      br_fdb01
        jg      br_fdab5
        cmp     dx, word ptr [bp + 8]
        jbe     br_fdb01
br_fdab5:
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
        jl      br_fdb01
        jnz     br_fdaee
        cmp     dx, word ptr [bp + 8]
        jc      br_fdb01
br_fdaee:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     word ptr es:[di + 4816h], 0
        mov     word ptr es:[di + 4814h], 0
br_fdb01:
        callf   SEG_CC84:far_cd0a9
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_3546
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_fdb1e:
        pop     di
        pop     si
        leave
        retf
fn_fdb22:
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
fn_fdb76:
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
        jz      br_fdbaa
        jmp     near br_fdc39
br_fdbaa:
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
br_fdc39:
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
far_fdcc8:
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
loop_fdd09:
        mov     al, cl
        mov     ah, 0
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        cmp     byte ptr es:[bx + 4800h], 0
        jz      br_fdd31
        mov     al, byte ptr [bp - 1]
        mov     ah, 0
        les     bx, dword ptr [bp + 6]
        add     bx, ax
        mov     byte ptr es:[bx], cl
        inc     byte ptr [bp - 1]
br_fdd31:
        inc     cl
        cmp     cl, 80h
        jc      loop_fdd09
        cmp     byte ptr [bp - 1], 0
        jnz     br_fdd5d
        les     bx, dword ptr [bp + 0ah]
        mov     word ptr es:[bx + 2], ds
        mov     word ptr es:[bx], 3388h
        mov     word ptr es:[bx + 6], 0
        mov     word ptr es:[bx + 4], 0
        mov     ax, 0ffffh
        pop     di
        pop     si
        leave
        retf
br_fdd5d:
        push    word 0fba0h
        push    word 22c3h
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
        jnz     br_fdd98
        les     bx, dword ptr [bp + 0ah]
        mov     ax, word ptr [339bh]
        mov     dx, word ptr [3399h]
        mov     word ptr es:[bx + 2], ax
        mov     word ptr es:[bx], dx
        mov     byte ptr [bp - 2], 1
br_fdd98:
        mov     cl, 0
        cmp     cl, byte ptr [bp - 1]
        jnc     br_fdddb
        mov     al, byte ptr [bp - 2]
        mov     ah, 0
        mov     di, ax
        jmp     br_fddd6
loop_fdda8:
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
br_fddd6:
        cmp     cl, byte ptr [bp - 1]
        jc      loop_fdda8
br_fdddb:
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
fn_fde02:
        push    bp
        mov     bp, sp
        sub     sp, 8
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
        push    8
        push    64h
        push    0
        push    3
        push    ds
        push    word B_83BC
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
loop_fde74:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dl, al
        or      al, al
        jz      loop_fde74
        cmp     dl, 78h
        jz      br_fde8e
        cbw
        pop     di
        pop     si
        leave
        retf
br_fde8e:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_36CC
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        mov     al, byte ptr [B_83BC]
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
        jg      br_fdeed
        jl      br_fded6
        cmp     word ptr es:[bx + 481ch], 2400h
        jnc     br_fdeed
br_fded6:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[di + 481eh]
        mov     dx, word ptr es:[di + 481ch]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        jmp     br_fdef7
br_fdeed:
        mov     word ptr [bp - 6], 0
        mov     word ptr [bp - 8], 2400h
br_fdef7:
        mov     word ptr [bp - 2], SEG_A28F
        mov     word ptr [bp - 4], 0
        push    1
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        mov     ax, SEG_A28F
        mov     es, ax
        push    word ptr es:[di + 4822h]
        push    word ptr es:[di + 4820h]
        push    word SEG_A28F
        push    word 0
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        xor     cx, cx
        jmp     br_fdf3e
loop_fdf2a:
        les     bx, dword ptr [bp - 4]
        mov     ax, word ptr es:[bx]
        cwd
        xor     ax, dx
        sub     ax, dx
        cmp     ax, si
        jge     br_fdf4d
        add     word ptr [bp - 4], 2
        inc     cx
br_fdf3e:
        mov     ax, cx
        cwd
        cmp     dx, word ptr [bp - 6]
        jl      loop_fdf2a
        jnz     br_fdf4d
        cmp     ax, word ptr [bp - 8]
        jc      loop_fdf2a
br_fdf4d:
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
        jnz     br_fdf7b
        mov     ax, 4ch
        pop     di
        pop     si
        leave
        retf
br_fdf7b:
        mov     word ptr [bp - 2], SEG_A28F
        mov     word ptr [bp - 4], 0
        push    1
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
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
        jmp     br_fdfd3
loop_fdfbf:
        les     bx, dword ptr [bp - 4]
        mov     ax, word ptr es:[bx]
        cwd
        xor     ax, dx
        sub     ax, dx
        cmp     ax, si
        jge     br_fdfe2
        add     word ptr [bp - 4], 2
        inc     cx
br_fdfd3:
        mov     ax, cx
        cwd
        cmp     dx, word ptr [bp - 6]
        jl      loop_fdfbf
        jnz     br_fdfe2
        cmp     ax, word ptr [bp - 8]
        jc      loop_fdfbf
br_fdfe2:
        mov     ax, cx
        cwd
        les     bx, dword ptr [bp + 8]
        cmp     dx, word ptr es:[bx + 2]
        jg      br_fe002
        jl      br_fdff5
        cmp     ax, word ptr es:[bx]
        jnc     br_fe002
br_fdff5:
        mov     ax, cx
        cwd
        les     bx, dword ptr [bp + 8]
        mov     word ptr es:[bx + 2], dx
        mov     word ptr es:[bx], ax
br_fe002:
        mov     ax, 4ch
        pop     di
        pop     si
        leave
        retf
far_fe009:
        push    bp
        mov     bp, sp
        sub     sp, 288h
        push    si
        push    1
        callf   SEG_D793:far_d796d
        add     sp, 2
        mov     byte ptr [B_D5DD], 7
        mov     byte ptr [bp - 2], 0
        mov     byte ptr [bp - 1], 0
        jmp     br_fe22c
br_fe02b:
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
        jnz     br_fe068
        mov     byte ptr [bp - 2], 0
br_fe068:
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
        jz      br_fe0a1
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
        call    far_fcd4d
        add     sp, 6
br_fe0a1:
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
        jnz     br_fe0f5
        mov     byte ptr [bp - 3], 0
        jmp     br_fe0f5
loop_fe0cd:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jnz     br_fe0f5
        cmp     si, 0ffffh
        jz      br_fe0f5
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
        call    far_fcd4d
        add     sp, 6
br_fe0f5:
        mov     al, byte ptr [bp - 3]
        cbw
        add     ax, 40h
        push    ax
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     byte ptr [bp - 1], al
        or      al, al
        jz      loop_fe0cd
        cbw
        cmp     ax, 78h
        jz      br_fe139
        jg      br_fe12c
        cmp     ax, 44h
        jnz     br_fe11c
        jmp     near br_fe1b4
br_fe11c:
        cmp     ax, 4eh
        jnz     br_fe124
        jmp     near br_fe1b4
br_fe124:
        cmp     ax, 75h
        jz      br_fe17d
        jmp     br_fe22c
br_fe12c:
        cmp     ax, 79h
        jz      br_fe159
        cmp     ax, 7ah
        jz      br_fe16b
        jmp     br_fe22c
br_fe139:
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
        jmp     br_fe22c
br_fe159:
        mov     al, byte ptr [bp - 2]
        push    ax
        nop
        push    cs
        call    fn_fe246
        add     sp, 2
        mov     byte ptr [bp - 1], al
        jmp     near br_fe22c
br_fe16b:
        mov     al, byte ptr [bp - 2]
        push    ax
        nop
        push    cs
        call    fn_fe443
        add     sp, 2
        mov     byte ptr [bp - 1], al
        jmp     near br_fe22c
br_fe17d:
        nop
        push    cs
        call    fn_fe97a
        mov     si, ax
        mov     al, byte ptr [bp - 2]
        push    ax
        nop
        push    cs
        call    fn_fe73e
        add     sp, 2
        mov     byte ptr [bp - 1], al
        mov     ax, A_2F7A
        or      ax, ax
        ja      br_fe19d
        jmp     near br_fe22c
br_fe19d:
        cmp     byte ptr [bp - 2], 0
        jg      br_fe1a6
        jmp     near br_fe22c
br_fe1a6:
        nop
        push    cs
        call    fn_fe97a
        cmp     ax, si
        jz      br_fe22c
        dec     byte ptr [bp - 2]
        jmp     short br_fe22c
br_fe1b4:
        mov     byte ptr [bp - 1], 0
        cmp     si, 0ffffh
        jz      br_fe22c
        mov     al, byte ptr [B_D4C0]
        cbw
        mov     cx, ax
        mov     dx, 18h
        imul    dx
        les     bx, dword ptr [FP_E40C]
        add     bx, ax
        cmp     byte ptr es:[bx - 30ah], 0ffh
        jz      br_fe22c
        push    ss
        lea     ax, [bp - 84h]
        push    ax
        push    cx
        callf   SEG_C495:far_c529a
        add     sp, 6
        cmp     ax, 0ffffh
        jz      br_fe22c
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
        jz      br_fe22c
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
        call    far_fcd4d
        add     sp, 6
br_fe22c:
        cmp     byte ptr [bp - 1], 0
        jnz     br_fe235
        jmp     br_fe02b
br_fe235:
        push    0
        callf   SEG_D793:far_d796d
        add     sp, 2
        mov     al, byte ptr [bp - 1]
        cbw
        pop     si
        leave
        retf
fn_fe246:
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
        jz      br_fe2c3
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
        call    far_fcd4d
        add     sp, 6
br_fe2c3:
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
        jmp     br_fe3a8
loop_fe33b:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jnz     br_fe3a8
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
        jz      br_fe3a8
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
        call    far_fcd4d
        add     sp, 6
br_fe3a8:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dl, al
        or      al, al
        jz      loop_fe33b
        cbw
        cmp     ax, 78h
        jnz     br_fe43c
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
        jz      br_fe3f5
        callf   SEG_B1AA:far_b1af9
        push    1
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        callf   SEG_B1AA:far_b1aff
        jmp     br_fe43a
br_fe3f5:
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
br_fe43a:
        mov     dl, 0
br_fe43c:
        mov     al, dl
        cbw
        pop     di
        pop     si
        leave
        retf
fn_fe443:
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
        jz      br_fe4c0
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
        call    far_fcd4d
        add     sp, 6
br_fe4c0:
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
        jmp     br_fe5a5
loop_fe538:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jnz     br_fe5a5
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
        jz      br_fe5a5
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
        call    far_fcd4d
        add     sp, 6
br_fe5a5:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jz      loop_fe538
        cmp     ax, 78h
        jz      br_fe5be
        jmp     br_fe737
br_fe5be:
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
        jge     br_fe651
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
br_fe651:
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
        jnz     br_fe6f5
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[si + 481eh]
        mov     dx, word ptr es:[si + 481ch]
        mov     word ptr [bp - 8], ax
        mov     word ptr [bp - 0ah], dx
        jmp     br_fe70e
br_fe6f5:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     ax, word ptr es:[si + 481eh]
        mov     dx, word ptr es:[si + 481ch]
        shl     dx, 1
        rcl     ax, 1
        mov     word ptr [bp - 8], ax
        mov     word ptr [bp - 0ah], dx
br_fe70e:
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
br_fe737:
        mov     ax, word ptr [bp - 2]
        pop     di
        pop     si
        leave
        retf
fn_fe73e:
        push    bp
        mov     bp, sp
        sub     sp, 296h
        push    si
        push    di
        mov     si, 339dh
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
        push    word A_37C8
        callf   SEG_B347:far_b362e
        add     sp, 0eh
        cmp     si, 0ffffh
        jz      br_fe847
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
        call    far_fcd4d
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
        jnz     br_fe83d
        push    ds
        push    word A_37C8
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_fe847
br_fe83d:
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
br_fe847:
        callf   SEG_B702:far_b90dd
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_37CE
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        jmp     near br_fe928
br_fe867:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jz      br_fe877
        cmp     ax, 1
        jz      br_fe8ee
        jmp     near br_fe928
br_fe877:
        cmp     si, 0ffffh
        jnz     br_fe87f
        jmp     near br_fe928
br_fe87f:
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
        call    far_fcd4d
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
        jnz     br_fe8e2
        push    ds
        push    word A_37C8
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        push    1
        callf   SEG_B05A:far_b1073
        add     sp, 2
        jmp     br_fe928
br_fe8e2:
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        jmp     br_fe928
br_fe8ee:
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
        jnz     br_fe928
        push    0
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
br_fe928:
        push    2
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dl, al
        or      al, al
        jnz     br_fe93b
        jmp     br_fe867
br_fe93b:
        cbw
        cmp     ax, 78h
        jz      br_fe948
        cmp     ax, 79h
        jz      br_fe96c
        jmp     br_fe973
br_fe948:
        push    1
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
        add     sp, 6
        mov     dl, 0
        jmp     br_fe973
br_fe96c:
        nop
        push    cs
        call    fn_fe99c
        mov     dl, al
br_fe973:
        mov     al, dl
        cbw
        pop     di
        pop     si
        leave
        retf
fn_fe97a:
        push    si
        xor     dx, dx
        xor     cx, cx
        mov     si, 4800h
loop_fe982:
        mov     ax, SEG_A28F
        mov     es, ax
        cmp     byte ptr es:[si], 0
        jz      br_fe98e
        inc     dx
br_fe98e:
        add     si, 24h
        inc     cx
        cmp     si, 5a00h
        jnz     loop_fe982
        mov     ax, dx
        pop     si
        retf
fn_fe99c:
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
loop_fe9e7:
        push    1
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     dl, al
        or      al, al
        jz      loop_fe9e7
        cbw
        cmp     ax, 78h
        jnz     br_fea09
        callf   SEG_CB18:far_cb23d
        callf   SEG_CC84:far_cd4d6
        mov     dl, 0
br_fea09:
        mov     al, dl
        cbw
        retf
far_fea0d:
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
        jmp     br_feadc
loop_fea9f:
        mov     al, byte ptr [B_7B8D]
        cbw
        or      ax, ax
        jnz     loop_feacb
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
loop_feacb:
        push    word 80h
        callf   SEG_B05A:far_b08f7
        add     sp, 2
        mov     si, ax
        or      ax, ax
        jz      loop_fea9f
br_feadc:
        or      si, si
        jz      loop_feacb
        push    word ptr [bp - 2]
        callf   SEG_EB7C:far_eb7cc
        add     sp, 2
        mov     byte ptr [B_9569], 0
        mov     ax, si
        pop     si
        leave
        retf
        db      86eh dup (0ffh)
        phase   0ch
far_ff332:
        push    bp
        mov     bp, sp
        sub     sp, 2eh
        push    si
        push    di
        mov     di, word ptr [bp + 6]
        xor     si, si
        cmp     byte ptr [B_946A], 0
        jz      br_ff364
        mov     al, byte ptr [B_946A]
        cbw
        push    ax
        mov     al, byte ptr [B_946B]
        cbw
        push    ax
        callf   SEG_E726:far_e726e
        add     sp, 4
        mov     si, ax
        or      si, si
        jge     br_ff364
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_ff364:
        mov     al, byte ptr [B_9469]
        push    ax
        callf   SEG_E259:far_e259f
        add     sp, 2
        or      ax, ax
        jz      br_ff37b
        mov     ax, 0fff4h
        pop     di
        pop     si
        leave
        retf
br_ff37b:
        callf   SEG_E598:far_e598e
        test    di, 2
        jz      br_ff38b
        mov     ax, 1
        jmp     br_ff38d
br_ff38b:
        xor     ax, ax
br_ff38d:
        mov     word ptr [bp - 0eh], ax
        mov     ax, word ptr [bp + 0ah]
        mov     dx, word ptr [bp + 8]
        mov     word ptr [bp - 10h], ax
        mov     word ptr [bp - 12h], dx
        mov     word ptr [bp - 0ch], 1
        mov     al, byte ptr [B_946B]
        cmp     al, byte ptr [B_9469]
        jz      br_ff3ad
        jmp     br_ff4a6
br_ff3ad:
        push    word ptr [W_9474]
        push    word ptr [W_9472]
        cbw
        push    ax
        nop
        push    cs
        call    fn_ff5b0
        add     sp, 6
        mov     si, ax
        or      ax, ax
        jz      br_ff3f2
        push    ds
        push    word B_8C41
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    0
        callf   SEG_E1E1:far_e1e11
        add     sp, 2
        callf   SEG_E598:far_e59bd
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
br_ff3f2:
        mov     al, byte ptr [B_946B]
        cbw
        mov     word ptr [bp - 2eh], ax
        mov     word ptr [bp - 2ch], 0
        mov     word ptr [bp - 2ah], 0
        mov     ax, word ptr [W_9480]
        mov     dx, word ptr [W_947E]
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        mov     al, byte ptr [B_946A]
        cbw
        mov     word ptr [bp - 8], ax
        mov     word ptr [bp - 24h], ax
        mov     word ptr [bp - 20h], 1
        mov     word ptr [bp - 22h], 100h
        mov     word ptr [bp - 1eh], ax
        mov     word ptr [bp - 1ch], 1
        mov     ax, word ptr [W_9474]
        mov     dx, word ptr [W_9472]
        mov     word ptr [bp - 18h], ax
        mov     word ptr [bp - 1ah], dx
        mov     ax, word ptr [W_903F]
        mov     dx, word ptr [W_903D]
        mov     word ptr [bp - 14h], ax
        mov     word ptr [bp - 16h], dx
        mov     ax, word ptr [W_904B]
        mov     word ptr [bp - 2], ax
        push    ss
        lea     ax, [bp - 2eh]
        push    ax
        nop
        push    cs
        call    fn_ff8d7
        add     sp, 4
        mov     si, ax
        or      ax, ax
        jz      br_ff480
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    0
        callf   SEG_E1E1:far_e1e11
        add     sp, 2
        callf   SEG_E598:far_e59bd
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
br_ff480:
        mov     word ptr [bp - 2eh], 0
        mov     word ptr [bp - 26h], 1
        mov     word ptr [bp - 28h], 100h
        push    word ptr [bp - 2]
        push    1
        push    0
        callf   SEG_DFC0:far_dfc02
        add     sp, 6
        mov     word ptr [bp - 4], dx
        mov     word ptr [bp - 6], ax
        jmp     br_ff4cf
br_ff4a6:
        mov     al, byte ptr [B_946B]
        cbw
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp - 2eh], ax
        mov     ax, word ptr [W_9480]
        mov     dx, word ptr [W_947E]
        mov     word ptr [bp - 26h], ax
        mov     word ptr [bp - 28h], dx
        push    si
        push    word ptr [bp - 0ah]
        callf   SEG_DFC0:far_dfd13
        add     sp, 4
        mov     word ptr [bp - 4], dx
        mov     word ptr [bp - 6], ax
br_ff4cf:
        mov     ax, di
        and     ax, 1
        mov     word ptr [bp - 2ah], ax
        mov     al, byte ptr [B_9469]
        cbw
        mov     word ptr [bp - 2ch], ax
        mov     al, byte ptr [B_946A]
        cbw
        mov     word ptr [bp - 24h], ax
        mov     ax, word ptr [W_9478]
        mov     dx, word ptr [W_9476]
        mov     word ptr [bp - 20h], ax
        mov     word ptr [bp - 22h], dx
        mov     al, byte ptr [B_9468]
        cbw
        mov     word ptr [bp - 1eh], ax
        mov     ax, word ptr [W_9466]
        mov     word ptr [bp - 1ch], ax
        mov     ax, word ptr [W_9474]
        mov     dx, word ptr [W_9472]
        mov     word ptr [bp - 18h], ax
        mov     word ptr [bp - 1ah], dx
        mov     ax, word ptr [W_9441]
        mov     dx, word ptr [W_943F]
        mov     word ptr [bp - 14h], ax
        mov     word ptr [bp - 16h], dx
        mov     ax, word ptr [W_9466]
        cwd
        push    ax
        push    dx
        mov     dx, word ptr [bp - 4]
        mov     ax, word ptr [bp - 6]
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        add     ax, 5dch
        adc     dx, 0
        push    ax
        push    dx
        callf   SEG_E2CE:far_e2ce3
        pop     bx
        cmp     bx, dx
        pop     dx
        jl      br_ff567
        jg      br_ff545
        cmp     dx, ax
        jbe     br_ff567
br_ff545:
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    0
        callf   SEG_E1E1:far_e1e11
        add     sp, 2
        callf   SEG_E598:far_e59bd
        mov     ax, 0fffdh
        pop     di
        pop     si
        leave
        retf
br_ff567:
        push    ss
        lea     ax, [bp - 2eh]
        push    ax
        nop
        push    cs
        call    fn_ff8d7
        add     sp, 4
        mov     si, ax
        or      ax, ax
        jz      br_ff59b
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    0
        callf   SEG_E1E1:far_e1e11
        add     sp, 2
        callf   SEG_E598:far_e59bd
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
br_ff59b:
        push    0
        callf   SEG_E1E1:far_e1e11
        add     sp, 2
        callf   SEG_E598:far_e5a21
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
fn_ff5b0:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        push    di
        push    ds
        push    word B_8C41
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    0
        push    word ptr [bp + 6]
        callf   SEG_E12D:far_e12dc
        add     sp, 4
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jz      br_ff5e8
        pop     di
        pop     si
        leave
        retf
br_ff5e8:
        push    4
        push    4
        push    ds
        push    word B_901B
        callf   SEG_E723:far_e723d
        add     sp, 8
        push    0
        push    word 180h
        mov     ax, word ptr [bp + 0ah]
        mov     dx, word ptr [bp + 8]
        add     dx, 17fh
        adc     ax, 0
        push    ax
        push    dx
        callf   0f800h:far_fa0fe
        mov     di, ax
        shl     ax, 3
        add     ax, 5dch
        cwd
        push    ax
        push    dx
        callf   SEG_E2CE:far_e2ce3
        pop     bx
        cmp     bx, dx
        pop     dx
        jl      br_ff634
        jg      br_ff62d
        cmp     dx, ax
        jbe     br_ff634
br_ff62d:
        mov     ax, 0fffdh
        pop     di
        pop     si
        leave
        retf
br_ff634:
        xor     ax, ax
        mov     word ptr [W_9055], ax
        mov     word ptr [W_8814], ax
        mov     byte ptr [B_901B], al
        mov     word ptr [W_904B], di
        mov     word ptr [W_903F], 0
        mov     word ptr [W_903D], 0
        mov     si, 1
        jmp     br_ff67c
loop_ff654:
        push    si
        push    1
        callf   SEG_DB24:far_db240
        add     sp, 4
        mov     ax, word ptr [W_9059]
        cwd
        add     word ptr [W_903D], ax
        adc     word ptr [W_903F], dx
        mov     ax, word ptr [W_9059]
        mov     word ptr [W_8814], ax
        push    1
        callf   SEG_DAD5:far_dad54
        add     sp, 2
        inc     si
br_ff67c:
        cmp     si, di
        jle     loop_ff654
        mov     byte ptr [bp - 3], 0ffh
        push    1
        push    ss
        lea     ax, [bp - 3]
        push    ax
        push    1
        callf   SEG_D9B6:far_d9b6e
        add     sp, 8
        mov     ax, word ptr [W_9033]
        mov     dx, word ptr [W_9031]
        mov     word ptr [W_902B], ax
        mov     word ptr [W_9029], dx
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
fn_ff6a9:
        push    bp
        mov     bp, sp
        sub     sp, 5f4h
        push    si
        push    di
        les     bx, dword ptr [bp + 6]
        push    word ptr es:[bx + 0ah]
        push    word ptr es:[bx]
        callf   SEG_E726:far_e726e
        add     sp, 4
        mov     di, ax
        or      ax, ax
        jge     br_ff6d0
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_ff6d0:
        push    ds
        push    word B_8C41
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    0
        les     bx, dword ptr [bp + 6]
        push    word ptr es:[bx + 2]
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        les     bx, dword ptr [bp + 6]
        push    word ptr es:[bx + 0eh]
        push    word ptr es:[bx + 0ch]
        push    ds
        push    word B_901B
        callf   SEG_E3D1:far_e3d12
        add     sp, 8
        push    1
        les     bx, dword ptr [bp + 6]
        push    word ptr es:[bx]
        push    ds
        push    word B_8C41
        callf   SEG_E51B:far_e51be
        add     sp, 8
        les     bx, dword ptr [bp + 6]
        push    word ptr es:[bx + 8]
        push    word ptr es:[bx + 6]
        push    ds
        push    word B_8C41
        callf   SEG_E3D1:far_e3d12
        add     sp, 8
        les     bx, dword ptr [bp + 6]
        mov     bx, word ptr es:[bx + 10h]
        mov     al, byte ptr [bx + TBL_905D]
        cbw
        mov     word ptr [bp - 2], ax
        mov     bx, word ptr [bp - 2]
        test    byte ptr [bx + TBL_90C1], 2
        jnz     br_ff764
        mov     al, byte ptr [di + TBL_8CE7]
        mov     byte ptr [bx + TBL_90C1], al
        mov     al, byte ptr [di + TBL_8D4B]
        mov     byte ptr [bx + TBL_9125], al
        mov     al, byte ptr [di + TBL_8DAF]
        mov     byte ptr [bx + TBL_9189], al
br_ff764:
        inc     byte ptr [B_956A]
        mov     ax, word ptr [W_8C55]
        mov     dx, word ptr [W_8C53]
        mov     word ptr [bp - 12h], ax
        mov     word ptr [bp - 14h], dx
        mov     ax, word ptr [W_8C7B]
        mov     word ptr [bp - 6], ax
        les     bx, dword ptr [bp + 6]
        mov     ax, word ptr es:[bx + 12h]
        mov     word ptr [bp - 4], ax
        lea     ax, [bp - 5f4h]
        mov     word ptr [W_D4A8], ss
        mov     word ptr [W_D4A6], ax
        mov     al, byte ptr [B_8A9C]
        cbw
        mov     word ptr [bp - 8], ax
        mov     ax, word ptr es:[bx + 1ah]
        mov     dx, word ptr es:[bx + 18h]
        mov     word ptr [bp - 0eh], ax
        mov     word ptr [bp - 10h], dx
        jmp     br_ff883
br_ff7a8:
        mov     ax, word ptr [bp - 12h]
        mov     dx, word ptr [bp - 14h]
        mov     word ptr [W_8C55], ax
        mov     word ptr [W_8C53], dx
        mov     ax, word ptr [bp - 6]
        mov     word ptr [W_8C7B], ax
        les     bx, dword ptr [bp + 6]
        mov     ax, word ptr es:[bx + 16h]
        mov     dx, word ptr es:[bx + 14h]
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp - 0ch], dx
        cmp     ax, word ptr [bp - 0eh]
        jl      br_ff7e4
        jg      br_ff7d8
        cmp     dx, word ptr [bp - 10h]
        jbe     br_ff7e4
br_ff7d8:
        mov     ax, word ptr [bp - 0eh]
        mov     dx, word ptr [bp - 10h]
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp - 0ch], dx
br_ff7e4:
        mov     ax, word ptr [bp - 0ah]
        mov     dx, word ptr [bp - 0ch]
        sub     word ptr [bp - 10h], dx
        sbb     word ptr [bp - 0eh], ax
        callf   SEG_DBE6:far_dc29e
        jmp     br_ff86e
br_ff7f7:
        xor     si, si
        cmp     word ptr [W_9055], 0
        jnz     br_ff81f
        mov     al, byte ptr [bp - 2]
        mov     byte ptr [B_8A9C], al
        callf   SEG_DAE3:far_dae36
        les     bx, dword ptr [bp + 6]
        cmp     word ptr es:[bx + 4], 0
        jnz     br_ff81c
        callf   SEG_DBE6:far_dc29e
        jmp     br_ff81f
br_ff81c:
        mov     si, 1
br_ff81f:
        cmp     word ptr [W_8C7B], 0
        jnz     br_ff838
        push    di
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    fn_ff94f
        add     sp, 6
        mov     si, 1
br_ff838:
        or      si, si
        jz      br_ff862
        callf   SEG_E2CE:far_e2ce3
        or      dx, dx
        jg      br_ff857
        jl      br_ff84c
        cmp     ax, 5dch
        jnc     br_ff857
br_ff84c:
        dec     byte ptr [B_956A]
        mov     ax, 0fffdh
        pop     di
        pop     si
        leave
        retf
br_ff857:
        mov     al, byte ptr [bp - 2]
        mov     byte ptr [B_8A9C], al
        callf   SEG_DAF5:far_daf5c
br_ff862:
        inc     word ptr [W_8814]
        dec     word ptr [W_9055]
        dec     word ptr [W_8C7B]
br_ff86e:
        mov     ax, word ptr [bp - 0ch]
        mov     dx, word ptr [bp - 0ah]
        sub     word ptr [bp - 0ch], 1
        sbb     word ptr [bp - 0ah], 0
        or      ax, dx
        jz      br_ff883
        jmp     near br_ff7f7
br_ff883:
        mov     ax, word ptr [bp - 4]
        dec     word ptr [bp - 4]
        or      ax, ax
        jz      br_ff898
        mov     ax, word ptr [bp - 10h]
        or      ax, word ptr [bp - 0eh]
        jz      br_ff898
        jmp     br_ff7a8
br_ff898:
        mov     al, byte ptr [bp - 8]
        mov     byte ptr [B_8A9C], al
        mov     ax, word ptr [W_9055]
        add     word ptr [W_8814], ax
        push    1
        callf   SEG_DAD5:far_dad54
        add     sp, 2
        mov     word ptr [W_9055], 0
        dec     byte ptr [B_956A]
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    ds
        push    word B_8C41
        callf   SEG_E003:far_e0031
        add     sp, 4
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
fn_ff8d7:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        les     bx, dword ptr [bp + 6]
        cmp     word ptr es:[bx + 0ah], 0
        jz      br_ff8fd
        mov     word ptr es:[bx + 22h], 1
        push    word ptr [bp + 8]
        push    bx
        push    cs
        call    fn_ff6a9
        add     sp, 4
        mov     dx, ax
        jmp     br_ff94a
br_ff8fd:
        les     bx, dword ptr [bp + 6]
        mov     ax, word ptr es:[bx + 10h]
        mov     word ptr [bp - 2], ax
        mov     word ptr es:[bx + 22h], 0
        mov     si, 1
        jmp     br_ff92f
loop_ff912:
        les     bx, dword ptr [bp + 6]
        mov     word ptr es:[bx + 0ah], si
        mov     word ptr es:[bx + 10h], si
        push    word ptr [bp + 8]
        push    bx
        push    cs
        call    fn_ff6a9
        add     sp, 4
        mov     dx, ax
        or      ax, ax
        jnz     br_ff934
        inc     si
br_ff92f:
        cmp     si, 63h
        jle     loop_ff912
br_ff934:
        les     bx, dword ptr [bp + 6]
        mov     word ptr es:[bx + 22h], 1
        mov     word ptr es:[bx + 0ah], 0
        mov     ax, word ptr [bp - 2]
        mov     word ptr es:[bx + 10h], ax
br_ff94a:
        mov     ax, dx
        pop     si
        leave
        retf
fn_ff94f:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    si
        push    di
        mov     si, word ptr [bp + 0ah]
        mov     al, byte ptr [si + TBL_8CE7]
        cbw
        and     ax, 4
        mov     word ptr [bp - 6], ax
        jmp     near br_ffa10
br_ff968:
        mov     ax, word ptr [W_8C55]
        mov     dx, word ptr [W_8C53]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        push    word 640h
        push    ds
        push    word TBL_F779
        push    3
        callf   SEG_D97B:far_d97ca
        add     sp, 8
        mov     di, ax
        mov     al, byte ptr [TBL_F779]
        mov     ah, 0
        and     ax, 0f8h
        mov     dx, ax
        cmp     ax, 88h
        jz      br_ff9a3
        cmp     ax, 0a8h
        jz      br_ffa10
        cmp     ax, 0f8h
        jz      br_ff9b4
        jmp     br_ff9c5
br_ff9a3:
        push    ds
        push    word TBL_F77A
        callf   SEG_DAA8:far_daa8e
        add     sp, 4
        mov     word ptr [W_8C7B], ax
        jmp     br_ffa10
br_ff9b4:
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        mov     word ptr [W_8C55], ax
        mov     word ptr [W_8C53], dx
        pop     di
        pop     si
        leave
        retf
br_ff9c5:
        mov     al, byte ptr [TBL_F77A]
        mov     ah, 0
        cmp     ax, si
        jnz     br_ffa10
        cmp     dx, 98h
        jnz     br_ff9f7
        les     bx, dword ptr [bp + 6]
        cmp     word ptr es:[bx + 22h], 0
        jz      br_ffa01
        push    word ptr [bp - 6]
        push    word ptr es:[bx + 1eh]
        push    word ptr es:[bx + 1ch]
        nop
        push    cs
        call    far_ffb5f
        add     sp, 6
        or      ax, ax
        jnz     br_ffa01
        jmp     br_ffa10
br_ff9f7:
        les     bx, dword ptr [bp + 6]
        cmp     word ptr es:[bx + 20h], 0
        jnz     br_ffa10
br_ffa01:
        push    1
        push    di
        push    ds
        push    word TBL_F779
        callf   SEG_DBE6:far_dbe67
        add     sp, 8
br_ffa10:
        cmp     word ptr [W_8C7B], 0
        jnz     br_ffa1a
        jmp     near br_ff968
br_ffa1a:
        pop     di
        pop     si
        leave
        retf
far_ffa1e:
        push    bp
        mov     bp, sp
        sub     sp, 0ch
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    1
        mov     al, byte ptr [B_946B]
        cbw
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        push    word ptr [W_9480]
        push    word ptr [W_947E]
        push    ds
        push    word B_901B
        callf   SEG_DFDF:far_dfdf5
        add     sp, 8
        or      ax, ax
        jz      br_ffa60
        mov     ax, 0ffech
        leave
        retf
br_ffa60:
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    word ptr [W_9480]
        push    word ptr [W_947E]
        push    ds
        push    word B_901B
        callf   SEG_EB00:far_eb007
        add     sp, 0ch
        push    word ptr [W_947C]
        push    word ptr [W_947A]
        push    ds
        push    word B_901B
        callf   SEG_DFDF:far_dfdf5
        add     sp, 8
        or      ax, ax
        jz      br_ffa96
        mov     ax, 0ffech
        leave
        retf
br_ffa96:
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        push    word ptr [W_947C]
        push    word ptr [W_947A]
        push    ds
        push    word B_901B
        callf   SEG_EB00:far_eb007
        add     sp, 0ch
        mov     ax, word ptr [bp - 0ah]
        mov     dx, word ptr [bp - 0ch]
        sub     dx, word ptr [bp - 8]
        sbb     ax, word ptr [bp - 6]
        mov     word ptr [W_9474], ax
        mov     word ptr [W_9472], dx
        mov     al, byte ptr [B_946B]
        cmp     al, byte ptr [B_9469]
        jz      br_ffade
        push    1
        mov     al, byte ptr [B_9469]
        cbw
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
br_ffade:
        push    word ptr [W_9478]
        push    word ptr [W_9476]
        push    ds
        push    word B_901B
        callf   SEG_DFDF:far_dfdf5
        add     sp, 8
        or      ax, ax
        jz      br_ffafb
        mov     ax, 0ffech
        leave
        retf
br_ffafb:
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    word ptr [W_9478]
        push    word ptr [W_9476]
        push    ds
        push    word B_901B
        callf   SEG_EB00:far_eb007
        add     sp, 0ch
        mov     ax, word ptr [W_903F]
        mov     dx, word ptr [W_903D]
        sub     dx, word ptr [bp - 4]
        sbb     ax, word ptr [bp - 2]
        mov     word ptr [W_9441], ax
        mov     word ptr [W_943F], dx
        mov     ax, word ptr [W_9466]
        cwd
        push    ax
        push    dx
        mov     dx, word ptr [W_9474]
        mov     ax, word ptr [W_9472]
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        cmp     dx, word ptr [W_9441]
        jl      br_ffb4f
        jg      br_ffb4a
        cmp     ax, word ptr [W_943F]
        jbe     br_ffb4f
br_ffb4a:
        mov     ax, 0fffdh
        leave
        retf
br_ffb4f:
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        xor     ax, ax
        leave
        retf
far_ffb5f:
        push    bp
        mov     bp, sp
        cmp     word ptr [bp + 0ah], 0
        jz      br_ffb92
        cmp     byte ptr [B_F77B], 23h
        jc      br_ffb8e
        cmp     byte ptr [B_F77B], 62h
        ja      br_ffb8e
        mov     al, byte ptr [B_F77B]
        mov     ah, 0
        mov     es, word ptr [bp + 8]
        add     ax, word ptr [bp + 6]
        mov     bx, ax
        cmp     byte ptr es:[bx - 23h], 0
        jnz     br_ffbac
        xor     ax, ax
        pop     bp
        retf
br_ffb8e:
        xor     ax, ax
        pop     bp
        retf
br_ffb92:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        cmp     al, byte ptr [B_F77B]
        ja      br_ffba8
        mov     al, byte ptr es:[bx + 1]
        cmp     al, byte ptr [B_F77B]
        jnc     br_ffbac
br_ffba8:
        xor     ax, ax
        pop     bp
        retf
br_ffbac:
        mov     ax, 1
        pop     bp
        retf
far_ffbb1:
        push    bp
        mov     bp, sp
        sub     sp, 38h
        push    si
        push    di
        mov     si, word ptr [bp + 0ah]
        cmp     byte ptr [B_901B], 0
        jge     br_ffbc9
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_ffbc9:
        or      si, si
        jg      br_ffbd3
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_ffbd3:
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
        push    ds
        push    word B_901B
        callf   SEG_E5A9:far_e5a99
        add     sp, 4
        push    ss
        lea     ax, [bp - 0ch]
        push    ax
        push    word ptr [W_9480]
        push    word ptr [W_947E]
        push    ds
        push    word B_901B
        callf   SEG_EB00:far_eb007
        add     sp, 0ch
        push    ss
        lea     ax, [bp - 10h]
        push    ax
        push    word ptr [W_947C]
        push    word ptr [W_947A]
        push    ds
        push    word B_901B
        callf   SEG_EB00:far_eb007
        add     sp, 0ch
        cmp     word ptr [bp + 8], 0
        jz      br_ffc39
        jmp     near br_ffcc0
br_ffc39:
        mov     ax, si
        cwd
        cmp     dx, word ptr [bp - 0ah]
        jg      br_ffc8a
        jnz     br_ffc48
        cmp     ax, word ptr [bp - 0ch]
        ja      br_ffc8a
br_ffc48:
        mov     ax, word ptr [W_9480]
        mov     dx, word ptr [W_947E]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        push    ss
        lea     ax, [bp - 8]
        push    ax
        mov     ax, si
        cwd
        mov     bx, word ptr [bp - 0ah]
        mov     cx, word ptr [bp - 0ch]
        sub     cx, ax
        sbb     bx, dx
        push    bx
        push    cx
        push    ds
        push    word B_901B
        callf   SEG_EADF:far_eadf4
        add     sp, 0ch
        mov     ax, word ptr [bp - 0eh]
        mov     dx, word ptr [bp - 10h]
        sub     dx, word ptr [bp - 0ch]
        sbb     ax, word ptr [bp - 0ah]
        mov     word ptr [bp - 12h], ax
        mov     word ptr [bp - 14h], dx
        jmp     br_ffd64
br_ffc8a:
        push    ss
        lea     ax, [bp - 4]
        push    ax
        mov     ax, si
        cwd
        push    dx
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_EADF:far_eadf4
        add     sp, 0ch
        mov     word ptr [bp - 6], 1
        mov     word ptr [bp - 8], 100h
        mov     ax, si
        cwd
        mov     bx, word ptr [bp - 0eh]
        mov     cx, word ptr [bp - 10h]
        sub     cx, ax
        sbb     bx, dx
        mov     word ptr [bp - 12h], bx
        mov     word ptr [bp - 14h], cx
        jmp     near br_ffd64
br_ffcc0:
        mov     ax, si
        cwd
        mov     bx, word ptr [W_903F]
        mov     cx, word ptr [W_903D]
        sub     cx, ax
        sbb     bx, dx
        cmp     bx, word ptr [bp - 0eh]
        jc      br_ffd1c
        jnz     br_ffcdb
        cmp     cx, word ptr [bp - 10h]
        jc      br_ffd1c
br_ffcdb:
        mov     ax, word ptr [W_9480]
        mov     dx, word ptr [W_947E]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        push    ss
        lea     ax, [bp - 8]
        push    ax
        mov     ax, si
        cwd
        mov     bx, word ptr [bp - 0ah]
        mov     cx, word ptr [bp - 0ch]
        add     cx, ax
        adc     bx, dx
        push    bx
        push    cx
        push    ds
        push    word B_901B
        callf   SEG_EADF:far_eadf4
        add     sp, 0ch
        mov     ax, word ptr [bp - 0eh]
        mov     dx, word ptr [bp - 10h]
        sub     dx, word ptr [bp - 0ch]
        sbb     ax, word ptr [bp - 0ah]
        mov     word ptr [bp - 12h], ax
        mov     word ptr [bp - 14h], dx
        jmp     br_ffd64
br_ffd1c:
        mov     ax, word ptr [W_9480]
        mov     dx, word ptr [W_947E]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        push    ss
        lea     ax, [bp - 8]
        push    ax
        mov     ax, si
        cwd
        mov     bx, word ptr [bp - 0ah]
        mov     cx, word ptr [bp - 0ch]
        add     cx, ax
        adc     bx, dx
        push    bx
        push    cx
        push    ds
        push    word B_901B
        callf   SEG_EADF:far_eadf4
        add     sp, 0ch
        mov     ax, si
        cwd
        mov     bx, word ptr [W_903F]
        mov     cx, word ptr [W_903D]
        sub     cx, word ptr [bp - 0ch]
        sbb     bx, word ptr [bp - 0ah]
        sub     cx, ax
        sbb     bx, dx
        mov     word ptr [bp - 12h], bx
        mov     word ptr [bp - 14h], cx
br_ffd64:
        mov     al, byte ptr [B_8A9F]
        cbw
        mov     di, ax
        callf   SEG_E598:far_e598e
        push    word ptr [bp - 12h]
        push    word ptr [bp - 14h]
        push    di
        push    cs
        call    fn_ff5b0
        add     sp, 6
        mov     si, ax
        or      ax, ax
        jz      br_ffdb0
        push    ds
        push    word B_8C41
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    0
        callf   SEG_E1E1:far_e1e11
        add     sp, 2
        callf   SEG_E598:far_e59bd
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
br_ffdb0:
        mov     word ptr [bp - 34h], 0
        mov     word ptr [bp - 18h], 0
        mov     ax, word ptr [bp + 0eh]
        mov     dx, word ptr [bp + 0ch]
        mov     word ptr [bp - 1ah], ax
        mov     word ptr [bp - 1ch], dx
        mov     word ptr [bp - 38h], di
        mov     word ptr [bp - 36h], 0
        mov     ax, word ptr [bp + 6]
        mov     word ptr [bp - 2eh], ax
        mov     word ptr [bp - 28h], ax
        mov     word ptr [bp - 26h], 1
        mov     ax, word ptr [W_903F]
        mov     dx, word ptr [W_903D]
        mov     word ptr [bp - 1eh], ax
        mov     word ptr [bp - 20h], dx
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        mov     word ptr [bp - 30h], ax
        mov     word ptr [bp - 32h], dx
        mov     word ptr [bp - 2ah], 1
        mov     word ptr [bp - 2ch], 100h
        mov     ax, word ptr [bp - 12h]
        mov     dx, word ptr [bp - 14h]
        mov     word ptr [bp - 22h], ax
        mov     word ptr [bp - 24h], dx
        push    ss
        lea     ax, [bp - 38h]
        push    ax
        push    cs
        call    fn_ff6a9
        add     sp, 4
        mov     si, ax
        or      ax, ax
        jz      br_ffe3e
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    0
        callf   SEG_E1E1:far_e1e11
        add     sp, 2
        callf   SEG_E598:far_e59bd
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
br_ffe3e:
        push    1
        push    di
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        push    0
        push    0
        push    word ptr [bp + 0eh]
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 6]
        callf   SEG_E734:far_e7341
        add     sp, 0ah
        mov     word ptr [bp - 38h], 0
        mov     word ptr [bp - 34h], 1
        mov     word ptr [bp - 36h], di
        mov     word ptr [bp - 30h], 1
        mov     word ptr [bp - 32h], 100h
        mov     ax, word ptr [bp - 6]
        mov     dx, word ptr [bp - 8]
        mov     word ptr [bp - 2ah], ax
        mov     word ptr [bp - 2ch], dx
        push    ss
        lea     ax, [bp - 38h]
        push    ax
        push    cs
        call    fn_ff6a9
        add     sp, 4
        mov     si, ax
        or      ax, ax
        jz      br_ffeb8
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    0
        callf   SEG_E1E1:far_e1e11
        add     sp, 2
        callf   SEG_E598:far_e59bd
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
br_ffeb8:
        push    0
        callf   SEG_E1E1:far_e1e11
        add     sp, 2
        callf   SEG_E598:far_e5a21
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
        db      29h dup (0ffh)
        else
        db      058h
        db      4501h dup (0ffh)
        endif
        phase   0
far_fff00:
        mov     dx, 0ffeah
        mov     ax, 7
        out     dx, al
        mov     dx, 0fff3h
        mov     ax, 0
        out     dx, al
        mov     dx, 0ffedh
        mov     ax, 0
        out     dx, al
        mov     dx, 0ffech
        mov     ax, 2
        out     dx, al
        mov     dx, 0ffebh
        mov     ax, 11h
        out     dx, al
        mov     dx, 0fff4h
        mov     ax, 11h
        out     dx, al
        mov     dx, 0fff5h
        mov     ax, 31h
        out     dx, al
        mov     dx, 0fff6h
        mov     ax, 31h
        out     dx, al
        mov     dx, 0fff2h
        mov     ax, 90h
        out     dx, al
        jmpf    0fac0h:far_fac00
        db      0ach dup (0ffh)
        phase   0
reset_ffff0:
        jmpf    0fff0h:far_fff00
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
