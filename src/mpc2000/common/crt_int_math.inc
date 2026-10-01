; MS C/C++ 8.00c LLIBCE.LIB's uldiv, lmul, ldiv and lrem modules: 32-bit
; unsigned divide, multiply, signed divide and signed remainder, far calls
; that pop their arguments.  460 bytes, no embedded addresses -- every
; branch and call target is local to this block, so it needs no per-target
; equ.  MPC2000.SYS v1.72 text1 linear 0x1C-0x1E8 (file 0x281C-0x29E8),
; MPC2000XL v1.20 flash 0x35B1A-0x35CE6.

__aFuldiv:
        push    bp
        mov     bp, sp
        push    bx
        push    si
        mov     ax, word ptr [bp+0ch]
        or      ax, ax
        jne     L_0003D
        mov     cx, word ptr [bp+0ah]
        mov     ax, word ptr [bp+8]
        xor     dx, dx

L_00030:
        div     cx
        mov     bx, ax
        mov     ax, word ptr [bp+6]
        div     cx
        mov     dx, bx
        jmp     L_00075

L_0003D:
        mov     cx, ax
        mov     bx, word ptr [bp+0ah]
        mov     dx, word ptr [bp+8]
        mov     ax, word ptr [bp+6]

L_00048:
        shr     cx, 1
        rcr     bx, 1
        shr     dx, 1
        rcr     ax, 1
        or      cx, cx
        jne     L_00048
        div     bx
        mov     si, ax
        mul     word ptr [bp+0ch]
        xchg    cx, ax
        mov     ax, word ptr [bp+0ah]
        mul     si
        add     dx, cx
        jb      L_00071
        cmp     dx, word ptr [bp+8]

L_00068:
        ja      L_00071

L_0006A:
        jb      L_00072
        cmp     ax, word ptr [bp+6]
        jbe     L_00072

L_00071:
        dec     si

L_00072:
        xor     dx, dx
        xchg    si, ax

L_00075:
        pop     si
        pop     bx
        pop     bp
        retf    8
        db      00h

__aFlmul:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp+8]

L_00082:
        mov     cx, word ptr [bp+0ch]

L_00085:
        or      cx, ax
        mov     cx, word ptr [bp+0ah]
        jne     L_00095
        mov     ax, word ptr [bp+6]
        mul     cx

L_00091:
        pop     bp
        retf    8

L_00095:
        push    bx

L_00096:
        mul     cx
        mov     bx, ax
        mov     ax, word ptr [bp+6]

        mul     word ptr [bp+0ch]
        add     bx, ax

L_000A2:
        mov     ax, word ptr [bp+6]
        mul     cx
        add     dx, bx
        pop     bx
        pop     bp
        retf    8

__aFldiv:
        push    bp
        mov     bp, sp
        push    di
        push    si
        push    bx
        xor     di, di
        mov     ax, word ptr [bp+8]
        or      ax, ax

L_000BB:
        jge     L_000CE
        inc     di
        mov     dx, word ptr [bp+6]

L_000C1:
        neg     ax
        neg     dx

L_000C5:
        sbb.r   ax, 0  ; 32-bit negate
        mov     word ptr [bp+8], ax

L_000CB:
        mov     word ptr [bp+6], dx

L_000CE:
        mov     ax, word ptr [bp+0ch]
        or      ax, ax
        jge     L_000E6
        inc     di
        mov     dx, word ptr [bp+0ah]
        neg     ax
        neg     dx

L_000DD:
        sbb.r   ax, 0  ; 32-bit negate
        mov     word ptr [bp+0ch], ax
        mov     word ptr [bp+0ah], dx

L_000E6:
        or      ax, ax
        jne     L_000FF
        mov     cx, word ptr [bp+0ah]
        mov     ax, word ptr [bp+8]
        xor     dx, dx
        div     cx
        mov     bx, ax
        mov     ax, word ptr [bp+6]
        div     cx
        mov     dx, bx
        jmp     L_00137

L_000FF:
        mov     bx, ax
        mov     cx, word ptr [bp+0ah]
        mov     dx, word ptr [bp+8]
        mov     ax, word ptr [bp+6]

L_0010A:
        shr     bx, 1

L_0010C:
        rcr     cx, 1
        shr     dx, 1
        rcr     ax, 1
        or      bx, bx
        jne     L_0010A
        div     cx
        mov     si, ax
        mul     word ptr [bp+0ch]
        xchg    cx, ax
        mov     ax, word ptr [bp+0ah]
        mul     si
        add     dx, cx
        jb      L_00133
        cmp     dx, word ptr [bp+8]
        ja      L_00133
        jb      L_00134
        cmp     ax, word ptr [bp+6]
        jbe     L_00134

L_00133:
        dec     si

L_00134:
        xor     dx, dx
        xchg    si, ax

L_00137:
        dec     di
        jne     L_00141
        neg     dx
        neg     ax
        sbb     dx, 0

L_00141:
        pop     bx
        pop     si
        pop     di
        pop     bp
        retf    8

__aFlrem:
        push    bp
        mov     bp, sp
        push    bx
        push    di
        xor     di, di
        mov     ax, word ptr [bp+8]
        or      ax, ax
        jge     L_00167
        inc     di
        mov     dx, word ptr [bp+6]
        neg     ax
        neg     dx

L_0015E:
; ? sample_setup_entry @0x0015f is mid-instruction
        sbb.r   ax, 0  ; 32-bit negate
        mov     word ptr [bp+8], ax
        mov     word ptr [bp+6], dx

L_00167:
        mov     ax, word ptr [bp+0ch]

L_0016A:
        or      ax, ax
        jge     L_0017E
        mov     dx, word ptr [bp+0ah]
        neg     ax
        neg     dx

L_00175:
        sbb.r   ax, 0  ; 32-bit negate
        mov     word ptr [bp+0ch], ax
        mov     word ptr [bp+0ah], dx

L_0017E:
        or      ax, ax
        jne     L_0019A
        mov     cx, word ptr [bp+0ah]
        mov     ax, word ptr [bp+8]
        xor     dx, dx
        div     cx
        mov     ax, word ptr [bp+6]
        div     cx
        mov     ax, dx
        xor     dx, dx
        dec     di
        jns     L_001DB
        jmp     L_001E2

L_0019A:
        mov     bx, ax
        mov     cx, word ptr [bp+0ah]
        mov     dx, word ptr [bp+8]
        mov     ax, word ptr [bp+6]

L_001A5:
        shr     bx, 1
        rcr     cx, 1
        shr     dx, 1
        rcr     ax, 1
        or      bx, bx
        jne     L_001A5
        div     cx
        mov     cx, ax
        mul     word ptr [bp+0ch]
        xchg    cx, ax
        mul     word ptr [bp+0ah]
        add     dx, cx
        jb      L_001CC
        cmp     dx, word ptr [bp+8]
        ja      L_001CC
        jb      L_001D2
        cmp     ax, word ptr [bp+6]
        jbe     L_001D2

L_001CC:
        sub     ax, word ptr [bp+0ah]
        sbb     dx, word ptr [bp+0ch]

L_001D2:
        sub     ax, word ptr [bp+6]
        sbb     dx, word ptr [bp+8]
        dec     di
        jns     L_001E2

L_001DB:
        neg     dx
        neg     ax
        sbb     dx, 0

L_001E2:
        pop     di
        pop     bx
        pop     bp
        retf    8
