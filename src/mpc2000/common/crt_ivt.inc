; real-mode IVT accessors, Akai's own: not in LLIBCE.  Get/set a vector by
; number (bp+6), given as a segment:offset pair in dx:ax.  +2 is the
; vector's high (segment) word.
; 54 bytes, no embedded addresses.  Byte-identical in MPC2000.SYS v1.72
; (text1 linear 0x3B4-0x3EA, file 0x2BB4-0x2BEA) and MPC2000XL v1.20
; (flash 0x35F18-0x35F4E) -- both sit directly before a firmware-specific
; init routine reached from the same entry-stub shape (SYS's L_003EA,
; XL's L_35F4E), which is not shared.
; Confirmed by direct byte comparison of both firmware dumps.

ivt_get_vector:
        push    bp
        mov     bp, sp
        mov     bx, word ptr [bp+6]
        shl     bx, 2
        sub     ax, ax
        mov     es, ax
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        pop     bp
        retf

ivt_set_vector:
        push    bp
        mov     bp, sp
        pushf
        cli
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        mov     bx, word ptr [bp+6]
        shl     bx, 2
        sub     cx, cx
        mov     es, cx
        mov     word ptr es:[bx], ax
        mov     word ptr es:[bx+2], dx
        popf
        pop     bp
        retf
        db      00h
