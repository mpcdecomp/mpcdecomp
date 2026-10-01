; MS C/C++ 8.00c LLIBCE.LIB's div, longdiv, setjmp, fstricmp and fstrncpy
; modules.  ldiv returns its div_t-style struct as a far pointer to a static
; 4-word buffer, whose DS offset the includer sets in DIVMOD32_STATIC (SYS
; v1.72 0455Eh, XL v1.20 077CCh); its near call to __aFlmul is symbolic.
; 426 bytes.  MPC2000.SYS v1.72 text1 linear 0x20A-0x3B4 (file
; 0x2A0A-0x2BB4), MPC2000XL v1.20 flash 0x35D4A-0x35EF4.

_div:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp+6]
        cwd
        idiv    word ptr [bp+8]
        pop     bp
        retf

_ldiv:
        push    bp
        mov     bp, sp
        push    bx
        push    di
        push    si
        xor     di, di
        mov     ax, word ptr [bp+8]
        or      ax, ax
        jge     L_00238
        or      di, 3
        mov     dx, word ptr [bp+6]
        neg     ax
        neg     dx

L_0022F:
        sbb.r   ax, 0  ; 32-bit negate
        mov     word ptr [bp+8], ax
        mov     word ptr [bp+6], dx

L_00238:
        mov     ax, word ptr [bp+0ch]
        or      ax, ax
        jge     L_00252
        xor     di, 2
        mov     dx, word ptr [bp+0ah]
        neg     ax
        neg     dx

L_00249:
        sbb.r   ax, 0  ; 32-bit negate
        mov     word ptr [bp+0ch], ax
        mov     word ptr [bp+0ah], dx

L_00252:
        or      ax, ax
        jne     L_00271
        mov     cx, word ptr [bp+0ah]
        mov     ax, word ptr [bp+8]
        xor     dx, dx
        div     cx
        mov     bx, ax
        mov     ax, word ptr [bp+6]
        div     cx
        mov     cx, bx
        mov     bx, ax
        mov     ax, dx
        xor     dx, dx
        jmp     L_002BA

L_00271:
        mov     bx, ax
        mov     cx, word ptr [bp+0ah]
        mov     dx, word ptr [bp+8]
        mov     ax, word ptr [bp+6]

L_0027C:
        shr     bx, 1
        rcr     cx, 1
        shr     dx, 1
        rcr     ax, 1
        or      bx, bx
        jne     L_0027C
        div     cx
        mov     si, ax
        xor     dx, dx
        push    dx
        push    ax
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    cs
        call    __aFlmul
        cmp     dx, word ptr [bp+8]
        ja      L_002A6
        jb      L_002AD
        cmp     ax, word ptr [bp+6]
        jbe     L_002AD

L_002A6:
        dec     si
        sub     ax, word ptr [bp+0ah]
        sbb     dx, word ptr [bp+0ch]

L_002AD:
        sub     ax, word ptr [bp+6]
        sbb     dx, word ptr [bp+8]
        xor     di, 1
        xor     cx, cx
        mov     bx, si

L_002BA:
; ? voice_channel_process_fast @0x002bc is mid-instruction
        test    di, 1
        je      L_002C7
        neg     dx
        neg     ax
        sbb     dx, 0

L_002C7:
        test    di, 2
        je      L_002D4
        neg     cx
        neg     bx
        sbb     cx, 0

L_002D4:
        mov     word ptr [DIVMOD32_STATIC+6], dx
        mov     word ptr [DIVMOD32_STATIC+4], ax
        mov     word ptr [DIVMOD32_STATIC+2], cx
        mov     word ptr [DIVMOD32_STATIC], bx
        mov     ax, DIVMOD32_STATIC
        mov     dx, ds
        pop     si
        pop     di
        pop     bx
        mov     sp, bp
        pop     bp
        retf
        db      00h

__setjmp:
        mov     ax, bp
        mov     bp, sp
        mov     dx, ds
        lds     bx, [bp+4]
        mov     word ptr [bx], ax
        mov     word ptr [bx+2], di
        mov     word ptr [bx+4], si
        mov     word ptr [bx+6], sp
        mov     cx, word ptr [bp]
        mov     word ptr [bx+8], cx
        mov     cx, word ptr [bp+2]
        mov     word ptr [bx+0ah], cx
        mov     word ptr [bx+0ch], dx
        mov     ds, dx
        mov     bp, ax
        xor     ax, ax
        retf

_longjmp:
        mov     bp, sp
        mov     ax, word ptr [bp+8]
        or      ax, ax
        jne     L_00324
        inc     ax

L_00324:
        lds     bx, [bp+4]
        mov     di, word ptr [bx+2]
        mov     si, word ptr [bx+4]
        mov     sp, word ptr [bx+6]
        mov     bp, sp
        mov     cx, word ptr [bx+8]
        mov     word ptr [bp], cx
        mov     cx, word ptr [bx+0ah]
        mov     word ptr [bp+2], cx
        mov     bp, word ptr [bx]
        mov     ds, word ptr [bx+0ch]
        retf

__fstricmp:
        push    bp
        mov     bp, sp
        mov     dx, si
        push    ds
        lds     si, [bp+0ah]
        les     bx, [bp+6]
        mov     al, 0ffh

L_00352:
        or      al, al
        je      L_00383
        lodsb
        mov     ah, byte ptr es:[bx]
        inc     bx
        cmp     ah, al
        je      L_00352
        sub     al, 41h
        cmp     al, 1ah
        sbb     cl, cl
        and     cl, 20h
        add     al, cl

L_0036A:
        add     al, 41h
        xchg    ah, al
        sub     al, 41h
        cmp     al, 1ah
        sbb     cl, cl
        and     cl, 20h
        add     al, cl
        add     al, 41h
        cmp     al, ah
        je      L_00352
        sbb     al, al
        sbb     al, 0ffh

L_00383:
        cbw
        pop     ds
        mov     si, dx
        pop     bp
        retf
        db      00h

; copies DS:SI to ES:DI, stops at the source NUL and zero-pads to CX.
; Returns the destination far pointer.
__fstrncpy:
        push    bp
        mov     bp, sp
        push    di

L_0038E:
        push    si
        push    ds
        les     di, [bp+6]
        lds     si, [bp+0ah]
        mov     bx, di
        mov     cx, word ptr [bp+0eh]
        jcxz    L_003A9

L_0039D:
        lodsb
        or      al, al
        je      L_003A5
        stosb
        loop    L_0039D

L_003A5:
        xor     al, al
        rep stosb

L_003A9:
        mov     ax, bx
        mov     dx, es
        pop     ds
        pop     si
        pop     di
        mov     sp, bp
        pop     bp
        retf
