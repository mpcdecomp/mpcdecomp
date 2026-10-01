; three [seg:off] arg pairs (bp+6)/(bp+8) advancing 0Ch each; each
; FAR_MEMOP_STR_LEN bytes copied to buffer, plus fourth from caller's
; bp+6. 92 bytes to 'leave'. SYS v1.72 (text2 0x5B9E-5BFD, file
; 0x13B5E-13BBD) / v1.50 (text2 0x5A32) / XL v1.20 (flash 0x3F660-3F6BF)
; identical except FAR_MEMOP_STR_LEN (DS offset of the FXR default, not a
; count: SYS v1.72 52h, v1.50/XL 4Ah) and return (SYS retf 4, XL retf).

far_memop_str_2:
        enter   0ch, 0
        push    di
        push    si
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     word ptr [bp+6], 0ch
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     si, FAR_MEMOP_STR_LEN
        les     di, [bp-4]
        mov     cx, 6
        rep movsw
        mov     ax, word ptr [bp+6]
        add     word ptr [bp+6], 0ch
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     si, FAR_MEMOP_STR_LEN
        les     di, [bp-8]
        mov     cx, 6
        rep movsw
        mov     ax, word ptr [bp+6]
        add     word ptr [bp+6], 0ch
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        mov     si, FAR_MEMOP_STR_LEN
        les     di, [bp-0ch]
        mov     cx, 6
        rep movsw
        mov     si, FAR_MEMOP_STR_LEN
        les     di, [bp+6]
        mov     cx, 6
        rep movsw
        pop     si
        pop     di
        leave
