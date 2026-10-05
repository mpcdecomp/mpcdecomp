; c1 -- MPC2000XL flash: C layer, 36785 bytes.
; v1.20 0x3dfdd-0x46f8e, v1.14 0x3d9dd-0x4698e, v1.12 0x3d7dd-0x4678e.
; v1.11 0x3d6a3-0x46638 (36757 bytes), v1.10 0x3d5a3-0x46538 (36757 bytes).
; C only: the direct descendant of MPC2000.SYS, ENTER prologues end to end.

C1_CSBASE set     C1_SEG*16-SEGBASE

        jne     br_3DFE6
        cmp     ax, cx
        jne     br_3DFE6
        jmp     br_3E084
br_3DFE6:
        mov     word ptr es:[3dch], 0
        mov     word ptr [bp-8], 0
        mov     word ptr [bp-6], es
        mov     es, word ptr [bp-2]
        cmp     byte ptr es:[si+25h], 0
        je      br_3E00C
        cmp     byte ptr [C1_B_0D7D7], 0
        je      br_3E00C
        mov     bx, 1
        jmp     SHORT br_3E00E
        db      90h
br_3E00C:
        xor     bx, bx
br_3E00E:
        mov     ax, word ptr es:[si+0ah]
        mov     dx, word ptr es:[si+C1_TBL_0000C]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        or      bx, bx
        je      br_3E03E
        cmp     byte ptr es:[si+25h], 0
        je      br_3E03E
        push    0
        push    2
        push    word ptr es:[si+10h]
        push    word ptr es:[si+0eh]
        nop
        push    cs
        if      FW_VERSION >= 112
        call    EP_TGT_45BAC_OFF+C1_CSBASE
        elseif  FW_VERSION >= 110
        db      0e8h, 0aeh, 7bh
        else
        db      0e8h, 8eh, 7bh
        endif
        add     word ptr [bp-8], ax
        adc     word ptr [bp-6], dx
br_3E03E:
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        mov     bx, 7c00h
        mov     es, bx
        db      26h, 89h, 06h, 00h, 00h  ; mov word ptr es:[0], ax
        mov     word ptr es:[2], dx
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+2eh]
        mov     dx, word ptr es:[si+30h]
        mov     es, bx
        db      26h, 89h, 06h, 04h, 00h  ; mov word ptr es:[4], ax
        mov     word ptr es:[6], dx
        or      dx, dx
        jg      br_3E084
        jl      br_3E075
        cmp     ax, 0f5h
        ja      br_3E084
br_3E075:
        call    fn_3E088
        mov     bx, 7c00h
        mov     es, bx
        mov     word ptr es:[3dch], 0f5h
br_3E084:
        pop     si
        pop     di
        leave
        retf
        ifdef   GROWTH_PROOF
        db      GROWTH_PROOF dup (90h)
        endif
fn_3E088:
        enter   0ah, 0
        push    di
        push    si
        xor     ax, ax
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], ax
        push    1000h
        mov     bx, 7c00h
        mov     es, bx
        push    word ptr es:[4]
        push    bx
        push    3deh
        push    word ptr es:[2]
        push    word ptr es:[0]
        callf   EP_SMEM_BLOCK_COPY_SEG:EP_SMEM_BLOCK_COPY_OFF
        add     sp, 0ch
        mov     word ptr [bp-0ah], 0
        mov     bx, 7c00h
        mov     es, bx
        cmp     word ptr es:[6], 0
        jge     br_3E0CE
        jmp     NEAR L_3E18C
br_3E0CE:
        jg      br_3E0DB
        cmp     word ptr es:[4], 0
        jne     br_3E0DB
        jmp     NEAR L_3E18C
br_3E0DB:
        mov     ax, 3deh
        mov     di, ax
        mov     word ptr [bp-6], es
loop_3E0E3:
        mov     es, word ptr [bp-6]
        mov     cx, word ptr es:[di]
        cmp     cx, word ptr [bp-4]
        jle     br_3E0F6
        mov     word ptr [bp-4], cx
loop_3E0F1:
        mov     bx, word ptr [bp-2]
        jmp     br_3E0FD
br_3E0F6:
        cmp     word ptr [bp-2], cx
        jle     loop_3E0F1
        mov     bx, cx
br_3E0FD:
        neg     bx
        cmp     bx, 8000h
        jne     br_3E108
        mov     bx, 7fffh
br_3E108:
        mov     ax, word ptr [bp-4]
        mov     cx, 97bh
        cwd
        idiv    cx
        cmp     dx, 4bdh
        jle     br_3E11C
        mov     ax, 1
        jmp     br_3E11E
br_3E11C:
        xor     ax, ax
br_3E11E:
        mov     cx, ax
        mov     ax, word ptr [bp-4]
        mov     dx, 97bh
        mov     si, dx
        cwd
        idiv    si
        add     cx, ax
        mov     word ptr [bp-4], cx
        mov     ax, bx
        mov     cx, si
        cwd
        idiv    cx
        cmp     dx, 4bdh
        jle     br_3E142
        mov     ax, 1
        jmp     br_3E144
br_3E142:
        xor     ax, ax
br_3E144:
        mov     cx, ax
        mov     ax, bx
        cwd
        idiv    si
        add     cx, ax
        mov     ax, word ptr [bp-4]
        mov     es, word ptr [bp-6]
        lea     si, [di-3d6h]
        mov     word ptr es:[si], ax
        mov     es, word ptr [bp-6]
        lea     si, [di-1ech]
        add     di, 2
        mov     word ptr es:[si], cx
        mov     word ptr [bp-2], cx
        inc     word ptr [bp-0ah]
        mov     ax, word ptr [bp-0ah]
        cwd
        mov     si, 7c00h
        mov     es, si
        cmp     dx, word ptr es:[6]
        jge     br_3E180
        jmp     loop_3E0E3
br_3E180:
        jg      L_3E18C
        cmp     ax, word ptr es:[4]
        jae     L_3E18C
        jmp     NEAR loop_3E0E3
L_3E18C:
        pop     si
        pop     di
        leave
        ret
        if      FW_VERSION < 112
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        endif
        pusha
        push    ds
        push    es
        mov     bp, sp
        push    ds
        mov     ax, DS_SEG
        mov     ds, ax
        cld
        mov     sp, bp
        pop     es
        pop     ds
L_3E1A0:
        popa
        iret
        db      02eh, 02eh, 02eh, 000h, "d"
L_3E1A7:
        db      "e"
L_3E1A8:
        db      "te"
L_3E1AA:
        db      "cting memory", 00h, 00h
detect_memory:                          ; IN 0C0h bit 0 -> AX
        in      al, 0c0h
        and     al, 1
xl_detect_memory:
        cmp     al, 1
        sbb     ax, ax
        neg     ax
        retf
        db      00h
smem_write_block:
        enter   4, 0
        push    di
resume_3E1C9:
        push    si
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    far_to_dma_linear
        add     sp, 4
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    ds
        les     di, [bp+6]
        lds     si, [bp-4]
        mov     cx, word ptr [bp+0eh]
        mov     dx, 1000h
        callf   EP_L_3606C_SEG:EP_L_3606C_OFF
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h
smem_block_copy:                        ; sample-memory block move
        enter   4, 0
        push    di
        push    si
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    far_to_dma_linear
        add     sp, 4
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    ds
        les     di, [bp+6]
        lds     si, [bp-4]
        mov     cx, word ptr [bp+0eh]
        mov     dx, word ptr [bp+10h]
        callf   EP_L_36066_SEG:EP_L_36066_OFF
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h
system_init_handler:
        enter   0ah, 0
        push    di
        push    si
        mov     word ptr [bp-4], 0
        mov     word ptr [bp-2], 1
        cmp     word ptr [C2_W_SMEM_SIZE_HI], 1
        jge     br_3E242
        jmp     br_3E322
br_3E242:
        jg      loop_3E24E
        cmp     word ptr [C0_W_SMEM_SIZE], 0
        jne     loop_3E24E
        jmp     br_3E322
loop_3E24E:
        xor     bx, bx
        xor     ax, ax
        mov     dx, 7800h
        mov     di, ax
        mov     es, dx
loop_3E259:
        mov     ax, bx
        add     ax, word ptr [bp-4]
        mov     cx, bx
        sub     dx, dx
        add     cx, word ptr [bp-4]
        adc     dx, word ptr [bp-2]
        xor     ax, dx
        xor     ax, word ptr [bp+6]
        mov     word ptr es:[di], ax
        add     di, 2
        inc     bx
        cmp     bx, 4000h
        jb      loop_3E259
        push    4000h
        push    7800h
        push    0
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    smem_write_block
        add     sp, 0ah
        xor     ax, ax
        mov     cx, 4000h
        xor     bx, bx
        mov     dx, 7800h
        mov     di, bx
        mov     es, dx
        rep stosw
        push    1000h
        push    4000h
        push    dx
        push    ax
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    smem_block_copy
        add     sp, 0ch
        xor     si, si
        xor     ax, ax
        mov     dx, 7800h
        mov     bx, ax
        mov     es, dx
loop_3E2C1:
        mov     ax, si
        add     ax, word ptr [bp-4]
        mov     cx, si
        sub     dx, dx
        add     cx, word ptr [bp-4]
        adc     dx, word ptr [bp-2]
        xor     ax, dx
        xor     ax, word ptr [bp+6]
        cmp     ax, word ptr es:[bx]
        jne     br_3E31C
        add     bx, 2
        inc     si
        cmp     si, 4000h
        jb      loop_3E2C1
        mov     ax, word ptr [bp+0ah]
        or      ax, word ptr [bp+8]
        je      br_3E2F8
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        callf   [bp+8]
        add     sp, 4
br_3E2F8:
        mov     ax, word ptr [C0_W_SMEM_SIZE]
        mov     dx, word ptr [C2_W_SMEM_SIZE_HI]
        add     byte ptr [bp-3], 40h
        adc     word ptr [bp-2], 0
        cmp     word ptr [bp-2], dx
        jge     br_3E30F
        jmp     loop_3E24E
br_3E30F:
        jg      br_3E322
        cmp     word ptr [bp-4], ax
        jae     br_3E319
        jmp     NEAR loop_3E24E
br_3E319:
        jmp     br_3E322
        db      90h
br_3E31C:
        xor     ax, ax
        pop     si
        pop     di
        leave
        retf
br_3E322:
        mov     ax, 1
        pop     si
        pop     di
        leave
        retf
        db      00h
far_3E32A:
        enter   6, 0
        push    di
        push    si
        mov     di, 800h
        cmp     word ptr [bp+0eh], 0
        jg      br_3E343
        jl      L_3DA10
        cmp     word ptr [bp+0ch], di
        jae     br_3E343
L_3DA10:
        mov     di, word ptr [bp+0ch]
br_3E343:
        mov     cx, di
        mov     ax, di
        add     ax, di
        mov     dx, 7f00h
        mov     bx, ax
        mov     es, dx
        mov     word ptr [bp-6], di
        mov     di, word ptr [bp+0ah]
        jmp     br_3E35B
L_3DA28:
        mov     word ptr es:[bx], di
br_3E35B:
        sub     bx, 2
        mov     ax, cx
        dec     cx
        or      ax, ax
        jne     L_3DA28
        mov     ax, word ptr [bp+0eh]
        or      ax, word ptr [bp+0ch]
        je      br_3E3B3
        mov     di, word ptr [bp-6]
loop_3E370:
        mov     ax, di
        cwd
        mov     cx, word ptr [bp+0ch]
        mov     bx, word ptr [bp+0eh]
        cmp     bx, dx
        jl      br_3E385
        jg      br_3E383
        cmp     cx, di
        jbe     br_3E385
br_3E383:
        mov     cx, di
br_3E385:
        mov     si, cx
        push    cx
        push    7f00h
        push    0
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    smem_write_block
        add     sp, 0ah
        mov     ax, si
        cwd
        sub     word ptr [bp+0ch], si
        sbb     word ptr [bp+0eh], dx
        cwd
        add     word ptr [bp+6], ax
        adc     word ptr [bp+8], dx
        mov     ax, word ptr [bp+0eh]
        or      ax, word ptr [bp+0ch]
        jne     loop_3E370
br_3E3B3:
        pop     si
        pop     di
        leave
        retf
        db      00h
far_3E3B8:
        enter   0ah, 0
        push    si
resume_3E3BD:
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        cmp     word ptr [bp+0ch], dx
        jl      br_3E43C
        jg      br_3E3CF
        cmp     word ptr [bp+0ah], ax
        jbe     br_3E43C
br_3E3CF:
        mov     si, 800h
        mov     ax, word ptr [bp+10h]
        or      ax, word ptr [bp+0eh]
        jne     loop_3E3DD
        jmp     br_3E4EA
loop_3E3DD:
        mov     ax, si
        cwd
        cmp     word ptr [bp+10h], dx
        jg      br_3E3EF
        jl      br_3E3EC
        cmp     word ptr [bp+0eh], si
        jae     br_3E3EF
br_3E3EC:
        mov     si, word ptr [bp+0eh]
br_3E3EF:
        push    1000h
        push    si
        push    7f00h
        push    0
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    smem_block_copy
        add     sp, 0ch
        push    si
        push    7f00h
        push    0
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    smem_write_block
        add     sp, 0ah
        mov     ax, si
        cwd
        add     word ptr [bp+0ah], ax
        adc     word ptr [bp+0ch], dx
        add     word ptr [bp+6], ax
        adc     word ptr [bp+8], dx
        sub     word ptr [bp+0eh], si
        sbb     word ptr [bp+10h], dx
        mov     ax, word ptr [bp+10h]
        or      ax, word ptr [bp+0eh]
        jne     loop_3E3DD
        pop     si
        leave
        retf
        db      90h, 90h
br_3E43C:
        cmp     word ptr [bp+0ch], dx
        jle     br_3E444
        jmp     br_3E4EA
br_3E444:
        jl      br_3E44E
        cmp     word ptr [bp+0ah], ax
        jb      br_3E44E
        jmp     br_3E4EA
br_3E44E:
        mov     ax, word ptr [bp+10h]
        or      ax, word ptr [bp+0eh]
        jne     br_3E459
        jmp     br_3E4EA
br_3E459:
        mov     ax, word ptr [bp+0eh]
        mov     dx, word ptr [bp+10h]
        or      dx, dx
        jl      br_3E46D
        jg      br_3E46A
        cmp     ax, 800h
        jbe     br_3E46D
br_3E46A:
        mov     ax, 800h
br_3E46D:
        mov     si, ax
        mov     ax, word ptr [bp+0eh]
        add     word ptr [bp+0ah], ax
        adc     word ptr [bp+0ch], dx
        add     word ptr [bp+6], ax
        adc     word ptr [bp+8], dx
loop_3E47E:
        mov     ax, si
        cwd
        cmp     word ptr [bp+10h], dx
        jg      br_3E490
        jl      L_3DB5D
        cmp     word ptr [bp+0eh], ax
        jae     br_3E490
L_3DB5D:
        mov     si, word ptr [bp+0eh]
br_3E490:
        push    1000h
        push    si
        push    7f00h
        push    0
        mov     ax, si
        cwd
        sub     word ptr [bp+0ah], si
        sbb     word ptr [bp+0ch], dx
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        mov     word ptr [bp-0ah], si
        mov     word ptr [bp-8], dx
        nop
        push    cs
        call    smem_block_copy
        add     sp, 0ch
        push    si
        push    7f00h
        push    0
        mov     ax, word ptr [bp-0ah]
        mov     dx, word ptr [bp-8]
        sub     word ptr [bp+6], ax
        sbb     word ptr [bp+8], dx
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    smem_write_block
        add     sp, 0ah
        mov     ax, word ptr [bp-0ah]
        mov     dx, word ptr [bp-8]
        sub     word ptr [bp+0eh], ax
        sbb     word ptr [bp+10h], dx
        mov     ax, word ptr [bp+10h]
        or      ax, word ptr [bp+0eh]
        jne     loop_3E47E
br_3E4EA:
        pop     si
        leave
        retf
        db      90h
L_3E4EE:
        push    bp
        mov     bp, sp
        mov     dx, ASIC_DMA_ADDR
        mov     ax, word ptr [bp+6]
        out     dx, ax
        mov     ax, word ptr [bp+8]
        mov     dx, ASIC_DMA_ADDR_HI
        out     dx, al
        leave
        retf
        db      00h
L_3E502:
        push    bp
        mov     bp, sp
        mov     cl, byte ptr [bp+6]
        pushf
        cli
        mov     dx, ASIC_DMA_C038
        in      al, dx
        mov     bl, al
        or      al, 4
        out     dx, al
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        or      al, cl
        out     dx, al
        mov     al, bl
        mov     dx, ASIC_DMA_C038
        out     dx, al
        popf
        leave
        retf
        db      00h
L_3E524:
        push    bp
        mov     bp, sp
        mov     cl, byte ptr [bp+6]
        not     cl
        pushf
        cli
        mov     dx, ASIC_DMA_C038
        in      al, dx
        mov     bl, al
        or      al, 4
        out     dx, al
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        and     al, cl
        out     dx, al
        mov     al, bl
        mov     dx, ASIC_DMA_C038
        out     dx, al
        popf
        leave
        retf
        db      00h
memcpy_far_seg:
        enter   6, 0
        push    di
        push    si
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        shr     dx, 1
        rcr     ax, 1
        shr     dx, 1
        rcr     ax, 1
        shr     dx, 1
        rcr     ax, 1
        shr     dx, 1
        rcr     ax, 1
        mov     word ptr [bp-2], dx
        mov     word ptr [bp-4], ax
        mov     ax, word ptr [bp+6]
        shl     ax, 0ch
        mov     word ptr [bp-6], ax
        mov     ax, 0d758h
        push    ds
        mov     di, ax
        lea     si, [bp-6]
        push    ds
        pop     es
        push    ss
        pop     ds
        movsw
        movsw
        movsw
        pop     ds
        mov     dx, ds
        pop     si
        pop     di
        leave
        retf
far_3E58A:
        mov     word ptr [C1_W_08174], ax
        out     8ah, ax
        retf
dma_status_rearm:
        in      ax, 88h
        and     al, 7fh
        or      ah, 1
        out     88h, ax
        retf
far_3E59A:
        xor     bx, bx
loop_3E59C:
        mov     ax, bx
        or      ah, 0ah
        out     80h, ax
        mov     ax, 3
        out     82h, ax
        xor     ax, ax
        out     84h, ax
        add     bx, 2
        cmp     bx, 20h
        jl      loop_3E59C
        mov     bx, 1
loop_3E5B7:
        mov     ax, bx
        or      ah, 0ah
        out     80h, ax
        mov     ax, 3
        out     82h, ax
        mov     ax, 8000h
        out     84h, ax
        add     bx, 2
        cmp     bx, 20h
        jl      loop_3E5B7
        retf
        db      00h
dma_0162d:
        push    si
        xor     si, si
loop_3E5D5:
        push    7fffh
        push    ds
        push    C1_W_00418
        push    si
        nop
        push    cs
        call    dma_field_write
        add     sp, 8
        inc     si
        cmp     si, 20h
        jl      loop_3E5D5
        xor     ax, ax
        out     88h, ax
L_3DCBF:
        in      al, 88h
        test    al, 80h
        jne     L_3DCBF
        nop
        push    cs
        call    far_3E59A
        pop     si
        retf
        if      FW_VERSION >= 114
DMA_FIELD_FLAGS_OFS equ 0ch
DMA_FIELD_CTRL_OFS equ 6
        include "../../../common/dma_field_write.inc"
        else
dma_field_write:
        push    bp
        mov     bp, sp
        push    di
        mov     di, word ptr [bp+0ch]
        mov     bx, word ptr [bp+8]
L_3D6F6:
        test    di, 1
        je      L_3E01A
        mov     ax, word ptr [bp+6]
        out     80h, ax
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[bx+4]
        out     86h, ax
L_3E01A:
        test    di, 2
        je      L_3E039
        mov     ax, word ptr [bp+6]
        out     80h, ax
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[bx+4]
        out     86h, ax
        mov     ax, word ptr es:[bx+2]
        out     84h, ax
        mov     ax, word ptr es:[bx]
        out     82h, ax
L_3E039:
        test    di, 4
        je      L_3E050
        mov     ax, word ptr [bp+6]
        or      ah, 1
        out     80h, ax
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[bx+6]
        out     82h, ax
L_3E050:
        test    di, 8
        je      L_3E067
        mov     ax, word ptr [bp+6]
        or      ah, 4
        out     80h, ax
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[bx+14h]
        out     82h, ax
L_3E067:
        test    di, 10h
        je      L_3E07E
        mov     ax, word ptr [bp+6]
        or      ah, 4
        out     80h, ax
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[bx+16h]
        out     84h, ax
L_3E07E:
        test    di, 20h
        je      L_3E095
        mov     ax, word ptr [bp+6]
        or      ah, 6
        out     80h, ax
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[bx+1ch]
        out     82h, ax
L_3E095:
        test    di, 40h
        je      L_3E0AC
        mov     ax, word ptr [bp+6]
        or      ah, 6
        out     80h, ax
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[bx+1eh]
        out     84h, ax
L_3E0AC:
        test    di, 80h
        je      L_3E0CD
        mov     ax, word ptr [bp+6]
        or      ah, 5
        out     80h, ax
        mov     es, word ptr [bp+0ah]
        mov     cx, word ptr es:[bx+18h]
        mov     dx, word ptr es:[bx+1ah]
        mov     ax, dx
        out     84h, ax
        mov     ax, cx
        out     82h, ax
L_3E0CD:
        test    di, 100h
        je      L_3E0EE
        mov     ax, word ptr [bp+6]
        or      ah, 3
        out     80h, ax
        mov     es, word ptr [bp+0ah]
        mov     cx, word ptr es:[bx+10h]
        mov     dx, word ptr es:[bx+12h]
        mov     ax, dx
        out     84h, ax
        mov     ax, cx
        out     82h, ax
L_3E0EE:
        test    di, 200h
        je      L_3E105
        mov     ax, word ptr [bp+6]
        or      ah, 7
        out     80h, ax
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[bx+20h]
        out     82h, ax
L_3E105:
        test    di, 400h
        je      L_3E11C
        mov     ax, word ptr [bp+6]
        or      ah, 7
        out     80h, ax
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[bx+22h]
        out     84h, ax
L_3E11C:
        test    di, 800h
        je      L_3E139
        mov     ax, word ptr [bp+6]
        or      ah, 2
        out     80h, ax
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[bx+C1_TBL_0000C]
        out     84h, ax
        mov     ax, word ptr es:[bx+0eh]
        out     82h, ax
L_3E139:
        test    di, 1000h
        je      L_3E15A
        mov     ax, word ptr [bp+6]
        or      ah, 1
        out     80h, ax
        mov     es, word ptr [bp+0ah]
        mov     cx, word ptr es:[bx+8]
        mov     dx, word ptr es:[bx+0ah]
        mov     ax, dx
        out     86h, ax
        mov     ax, cx
        out     84h, ax
L_3E15A:
        test    di, 2000h
        je      L_3E17B
        mov     ax, word ptr [bp+6]
        or      ah, 8
        out     80h, ax
        mov     es, word ptr [bp+0ah]
        mov     cx, word ptr es:[bx+24h]
        mov     dx, word ptr es:[bx+26h]
        mov     ax, dx
        out     84h, ax
        mov     ax, cx
        out     82h, ax
L_3E17B:
        test    di, 4000h
        je      L_3E19C
        mov     ax, word ptr [bp+6]
        or      ah, 9
        out     80h, ax
        mov     es, word ptr [bp+0ah]
        mov     cx, word ptr es:[bx+28h]
        mov     dx, word ptr es:[bx+2ah]
        mov     ax, dx
        out     84h, ax
        mov     ax, cx
        out     82h, ax
L_3E19C:
        pop     di
        leave
        endif
        retf
        ifndef  DFW_GUARD_SEG           ; the guard's popf took it
        db      00h
        endif
        push    bp
        mov     bp, sp
        push    1e7eh
        push    ds
        push    C1_W_00418
        push    ax
        nop
        push    cs
        call    dma_field_write
        leave
        retf
        push    bp
        mov     bp, sp
        push    18h
        push    ds
        push    C1_W_00418
        push    ax
        nop
        push    cs
        call    dma_field_write
        leave
        retf
        db      00h
L_3DE94:
        out     80h, ax
        in      ax, 82h
        shr     ax, 0ch
        mov     cx, ax
        in      ax, 84h
        mov     dx, ax
        in      ax, 86h
        mov     bx, ax
        mov     ax, dx
        mov     dx, bx
        add     ax, ax
        adc     dx, bx
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        or      ax, cx
        retf
L_3E7EC:
        nop
        push    cs
        call    far_3E59A
        retf
disp_list_run:
        push    bp
        mov     bp, sp
        push    di
        push    si
        or      si, di
        push    bp
        les     bp, [bp+6]
        push    ds
        int     2eh
        pop     ds
        pop     bp
        pop     si
        pop     di
        leave
        retf
far_3E806:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     bl, 4
        les     si, [bp+6]
        push    ds
        push    bp
        int     2fh
        pop     bp
        pop     ds
        les     di, [bp+0ah]
        mov     word ptr es:[di], bx
        mov     word ptr es:[di+2], dx
        pop     si
        pop     di
        leave
        retf
far_3E824:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     bl, 6
        mov     cx, word ptr [bp+0ah]
        les     di, [bp+6]
        or      si, si
        push    ds
        push    bp
        int     2fh
        pop     bp
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h
far_3E83E:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     bl, 7
        les     si, [bp+6]
        or      di, di
        push    ds
        push    bp
        int     2fh
        pop     bp
        pop     ds
        pop     si
        pop     di
        leave
        retf
far_3E854:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     bl, 9
        les     si, [bp+6]
        mov     cx, word ptr [bp+0ah]
        or      di, di
        push    ds
        push    bp
        int     2fh
        pop     bp
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h
fs_find_file:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     bl, 0eh
        les     si, [bp+6]
        or      di, di
        push    ds
        push    bp
        int     2fh
        pop     bp
        pop     ds
        pop     si
        pop     di
        leave
        retf
far_3E884:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     bl, 14h
        les     si, [bp+6]
        or      di, di
        push    ds
        push    bp
        int     2fh
        pop     bp
        pop     ds
        pop     si
        pop     di
        leave
        retf
far_3E89A:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     bl, 1fh
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        or      si, di
        push    bp
        push    ds
        int     2fh
        pop     ds
        pop     bp
        pop     si
        pop     di
        leave
        retf
        db      00h
handler_set_install:                    ; les bp,[bp+6] / INT 30h; walks {db id, dd far32}
        push    bp
        mov     bp, sp
        push    di
        push    si
        push    bp
        les     bp, [bp+6]
        or      si, di
        push    ds
        int     30h
        pop     ds
        pop     bp
        pop     si
        pop     di
        leave
        retf
far_3E8C8:
        push    bp
        mov     bp, sp
        int     33h
        leave
        retf
        db      00h
far_3E8D0:
        push    bp
        mov     bp, sp
        push    di
        push    si
        or      si, di
        push    bp
        push    ds
        int     34h
        pop     ds
        pop     bp
        pop     si
        pop     di
        leave
        retf
        db      00h
pad_bank_get:
        push    bp
        mov     bp, sp
        int     37h
        sub     ah, ah
        leave
        retf
        db      00h
L_3E8EC:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     al, byte ptr [bp+6]
        or      si, di
        push    ds
        push    bp
        int     3ah
        pop     bp
        pop     ds
        pop     si
        pop     di
        leave
        retf
L_3E900:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp+6]
        and     ax, 3
        int     3fh
        leave
        retf
        db      00h
far_3E90E:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     bl, 0eh
        les     si, [bp+6]
        push    ds
        push    bp
        int     40h
        pop     bp
        pop     ds
        les     bx, [bp+0ah]
        mov     word ptr es:[bx], di
        mov     word ptr es:[bx+2], si
        pop     si
        pop     di
        leave
        retf
L_3E92C:
        push    bp
        mov     bp, sp
        push    si
        les     si, [bp+6]
        mov     al, 2
        int     47h
        pop     si
        leave
        retf
far_3E93A:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     dx, word ptr [bp+0ch]
        mov     ax, word ptr [bp+0ah]
        les     si, [bp+6]
        or      di, di
        push    ds
        push    bp
        int     42h
        pop     bp
        pop     ds
        pop     si
        pop     di
        leave
        retf
L_3E954:
        push    bp
        mov     bp, sp
        push    bp
        int     45h
        pop     bp
        leave
        retf
        db      00h
L_3E95E:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     ah, byte ptr [bp+6]
        mov     al, byte ptr [bp+8]
        mov     cl, byte ptr [bp+0ah]
        or      si, di
        push    ds
        push    bp
        int     48h
        pop     bp
        pop     ds
        pop     si
        pop     di
        leave
        retf
far_3E978:
        push    bp
        mov     bp, sp
        push    di
        push    si
        or      si, di
        push    bp
        push    ds
        int     4bh
        pop     ds
        pop     bp
        pop     si
        pop     di
        leave
        retf
        db      00h
int4D_sample_wrapper:
        push    bp
        mov     bp, sp
        push    si
        push    bp
        push    ds
        int     4dh
        pop     ds
        pop     bp
        mov     ax, si
        mov     dx, es
        pop     si
        leave
        retf
        db      00h
far_3E99C:
        push    bp
        mov     bp, sp
        push    di
        push    si
        or      si, di
        push    bp
        push    ds
        int     5ah
        pop     ds
        pop     bp
        pop     si
        pop     di
        leave
        retf
        db      90h
disp_select_plane:
        enter   2, 0
        mov     al, byte ptr [bp+6]
        inc     al
        mov     byte ptr [bp-2], al
        mov     byte ptr [bp-1], 0
        lea     ax, [bp-2]
        push    ss
        push    ax
        nop
        push    cs
        call    disp_list_run
        leave
        retf
disp_clear_all:
        enter   2, 0
        mov     byte ptr [bp-2], 1
        mov     byte ptr [bp-1], 0
        lea     ax, [bp-2]
        push    ss
        push    ax
        nop
        push    cs
        call    disp_list_run
        leave
        retf
disp_flush_now:
        enter   2, 0
        mov     byte ptr [bp-2], 5
        mov     byte ptr [bp-1], 0
        lea     ax, [bp-2]
        push    ss
        push    ax
        nop
        push    cs
        call    disp_list_run
        leave
        retf
disp_request_flush:
        enter   2, 0
        mov     byte ptr [bp-2], 6
        mov     byte ptr [bp-1], 0
        lea     ax, [bp-2]
        push    ss
        push    ax
        nop
        push    cs
        call    disp_list_run
        leave
        retf
draw_shadow_box:
        enter   0eh, 0
        mov     byte ptr [bp-0eh], 11h
        mov     al, byte ptr [bp+6]
        mov     byte ptr [bp-0dh], al
        mov     cl, byte ptr [bp+8]
        mov     byte ptr [bp-0ch], cl
        mov     dl, byte ptr [bp+0ah]
        mov     byte ptr [bp-0bh], dl
        mov     bl, byte ptr [bp+0ch]
        mov     byte ptr [bp-0ah], bl
        mov     byte ptr [bp-9], 0bh
        inc     al
        mov     byte ptr [bp-8], al
        add     bl, cl
        mov     byte ptr [bp-7], bl
        mov     byte ptr [bp-6], dl
        mov     byte ptr [bp-5], 0eh
        add     dl, byte ptr [bp+6]
        mov     byte ptr [bp-4], dl
        inc     cl
        mov     byte ptr [bp-3], cl
        mov     al, byte ptr [bp+0ch]
        dec     al
        mov     byte ptr [bp-2], al
        mov     byte ptr [bp-1], 0
        lea     ax, [bp-0eh]
        push    ss
        push    ax
        nop
        push    cs
        call    disp_list_run
        leave
        retf
L_3EA6A:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     si, word ptr [bp+6]
        lea     ax, [si+1]
        push    ax
        push    0
        push    0
        mov     di, ax
        callf   EP_DRAW_HLINE_SEG:EP_DRAW_HLINE_OFF
        add     sp, 6
        mov     ax, si
        sub     si, 0f6h
        neg     si
        push    si
        push    0ah
        push    di
        mov     si, ax
        callf   EP_DRAW_HLINE_SEG:EP_DRAW_HLINE_OFF
        add     sp, 6
        push    si
        push    0ah
        push    1
        callf   EP_DRAW_HDOTS_SEG:EP_DRAW_HDOTS_OFF
        add     sp, 6
        push    9
        push    1
        push    di
        callf   EP_DRAW_VLINE_SEG:EP_DRAW_VLINE_OFF
        add     sp, 6
        push    8
        push    2
        lea     ax, [si+2]
        push    ax
        callf   EP_DRAW_VLINE_SEG:EP_DRAW_VLINE_OFF
        add     sp, 6
        push    ds
        push    C1_W_00444
        nop
        push    cs
        call    disp_list_run
        add     sp, 4
        pop     si
        pop     di
        leave
        retf
        push    bp
        mov     bp, sp
        push    1
        push    1
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   EP_DRAW_FILL_RECT_SEG:EP_DRAW_FILL_RECT_OFF
        leave
        retf
draw_bitmap_ptr:
        enter   8, 0
        mov     byte ptr [bp-8], 26h
        mov     al, byte ptr [bp+6]
        mov     byte ptr [bp-7], al
        mov     al, byte ptr [bp+8]
        mov     byte ptr [bp-6], al
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        mov     word ptr [bp-5], ax
        mov     word ptr [bp-3], dx
        mov     byte ptr [bp-1], 0
        lea     ax, [bp-8]
        push    ss
        push    ax
        nop
        push    cs
        call    disp_list_run
        leave
        retf
draw_string_at:
        enter   8, 0
        mov     byte ptr [bp-8], 1eh
        mov     al, byte ptr [bp+6]
        mov     byte ptr [bp-7], al
        mov     al, byte ptr [bp+8]
        mov     byte ptr [bp-6], al
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        mov     word ptr [bp-5], ax
        mov     word ptr [bp-3], dx
        mov     byte ptr [bp-1], 0
        lea     ax, [bp-8]
        push    ss
        push    ax
        nop
        push    cs
        call    disp_list_run
        leave
        retf
draw_unsigned_value:
        enter   0ah, 0
        mov     byte ptr [bp-0ah], 17h
        mov     al, byte ptr [bp+6]
        mov     byte ptr [bp-9], al
        mov     al, byte ptr [bp+8]
        mov     byte ptr [bp-8], al
        mov     al, byte ptr [bp+0eh]
        mov     byte ptr [bp-7], al
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-4], dx
        mov     byte ptr [bp-2], 0
        lea     ax, [bp-0ah]
        push    ss
        push    ax
        nop
        push    cs
        call    disp_list_run
        leave
        retf
draw_signed_value:
        enter   2, 0
        mov     word ptr [bp-2], 20h
        cmp     word ptr [bp+0ch], 0
        jge     br_3EB9C
        neg     word ptr [bp+0ah]
        adc     word ptr [bp+0ch], 0
        neg     word ptr [bp+0ch]
        mov     word ptr [bp-2], 2dh
br_3EB9C:
        push    word ptr [bp-2]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   EP_DRAW_CHAR_AT_SEG:EP_DRAW_CHAR_AT_OFF
        add     sp, 6
        push    word ptr [bp+0eh]
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        mov     ax, word ptr [bp+6]
        add     ax, 6
        push    ax
        nop
        push    cs
        call    draw_unsigned_value
        leave
        retf
        db      00h
draw_fixed_decimal:
        enter   8, 0
        push    di
        push    si
        push    word ptr [bp+10h]
        nop
        push    cs
        call    pow10_lookup
        add     sp, 2
        push    dx
        push    ax
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        callf   EP_LDIV_SEG:EP_LDIV_OFF
        add     sp, 8
        push    ds
        lea     di, [bp-8]
        mov     si, ax
        push    ss
        pop     es
        mov     ds, dx
        movsw
        movsw
        movsw
        movsw
        pop     ds
        push    word ptr [bp+0eh]
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    draw_unsigned_value
        add     sp, 0ah
        push    2eh
        push    word ptr [bp+8]
        mov     ax, word ptr [bp+0eh]
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        add     ax, ax
        add     word ptr [bp+6], ax
        mov     ax, word ptr [bp+6]
        push    ax
        callf   EP_DRAW_CHAR_AT_SEG:EP_DRAW_CHAR_AT_OFF
        add     sp, 6
        mov     ax, word ptr [bp+6]
        add     ax, 6
        mov     word ptr [bp+6], ax
        cmp     word ptr [bp+10h], 1
        jle     br_3EC89
loop_3EC3D:
        dec     word ptr [bp+10h]
        push    word ptr [bp+10h]
        nop
        push    cs
        call    pow10_lookup
        add     sp, 2
        push    dx
        push    ax
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        callf   EP_LDIV_SEG:EP_LDIV_OFF
        add     sp, 8
        push    ds
        lea     di, [bp-8]
        mov     si, ax
        push    ss
        pop     es
        mov     ds, dx
        movsw
        movsw
        movsw
        movsw
        pop     ds
        mov     ax, word ptr [bp-8]
        add     ax, 30h
        push    ax
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   EP_DRAW_CHAR_AT_SEG:EP_DRAW_CHAR_AT_OFF
        add     sp, 6
        add     word ptr [bp+6], 6
        cmp     word ptr [bp+10h], 1
        jg      loop_3EC3D
br_3EC89:
        mov     ax, word ptr [bp-4]
        add     ax, 30h
        push    ax
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   EP_DRAW_CHAR_AT_SEG:EP_DRAW_CHAR_AT_OFF
        add     sp, 6
        pop     si
        pop     di
        leave
        retf
cmd_dispatch_setup:
        enter   6, 0
        mov     byte ptr [bp-6], 16h
        mov     al, byte ptr [bp+6]
        mov     byte ptr [bp-5], al
        mov     al, byte ptr [bp+8]
        mov     byte ptr [bp-4], al
        mov     ax, word ptr [bp+0ah]
        mov     word ptr [bp-3], ax
        mov     byte ptr [bp-1], 0
        lea     ax, [bp-6]
        push    ss
        push    ax
        nop
        push    cs
        call    disp_list_run
        leave
        retf
L_3ECCC:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     di, word ptr [bp+8]
        mov     si, word ptr [bp+6]
        push    word ptr [bp+0ch]
        push    di
        push    si
        nop
        push    cs
        call    cmd_dispatch_setup
        add     sp, 6
        push    word ptr [bp+0ah]
        push    di
        lea     ax, [si+18h]
        push    ax
        nop
        push    cs
        call    cmd_dispatch_setup
        add     sp, 6
        pop     si
        pop     di
        leave
        retf
draw_frame_window:
        enter   28h, 0
        push    di
        push    si
        mov     byte ptr [bp-28h], 22h
        mov     al, byte ptr [bp+6]
        mov     byte ptr [bp-27h], al
        mov     al, byte ptr [bp+8]
        mov     byte ptr [bp-26h], al
        mov     al, byte ptr [bp+0ah]
        mov     byte ptr [bp-25h], al
        mov     al, byte ptr [bp+0ch]
        mov     byte ptr [bp-24h], al
        lea     ax, [bp-23h]
        mov     di, ax
        mov     word ptr [bp-2], ss
        mov     cx, 1ch
        mov     si, word ptr [bp+0eh]
loop_3ED28:
        mov     es, word ptr [bp+10h]
        cmp     byte ptr es:[si], 0
        je      br_3ED41
        mov     al, byte ptr es:[si]
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[di], al
        inc     si
        inc     di
        dec     cx
        or      cx, cx
        jg      loop_3ED28
br_3ED41:
        mov     es, word ptr [bp-2]
        mov     bx, di
        inc     di
        mov     byte ptr es:[bx], 0
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[di], 0
        lea     ax, [bp-28h]
        push    ss
        push    ax
        nop
        push    cs
        call    disp_list_run
        add     sp, 4
        pop     si
        pop     di
        leave
        retf
        db      00h
smem_proc_wrapper:
        push    bp
        mov     bp, sp
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    3ah
        push    0e0h
        push    2
        push    0ch
        nop
        push    cs
        call    draw_frame_window
        leave
        retf
        db      00h
draw_confirm_window:
        push    bp
        mov     bp, sp
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    36h
        push    0c3h
        push    6
        push    30h
        nop
        push    cs
        call    draw_frame_window
        leave
        retf
        db      00h
far_3ED98:
        push    bp
        mov     bp, sp
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    3ah
        push    0d8h
        push    2
        push    10h
        nop
        push    cs
        call    draw_frame_window
        leave
        retf
        db      00h
field_handler_nop:
        enter   2, 0
        mov     byte ptr [bp-2], 19h
        mov     byte ptr [bp-1], 0
        lea     ax, [bp-2]
        push    ss
        push    ax
        nop
        push    cs
        call    disp_list_run
        leave
        retf
field_handler_nop_2:                      ; swallow stub; all of HANDLERS_RDONLY points here
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        pop     ds
        retf
handler_install_one:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp+6]
        mov     byte ptr [C1_B_0045A], al
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        mov     word ptr [C1_W_0045B], ax
        mov     word ptr [C1_W_0045D], dx
        push    ds
        push    C1_B_0045A
        nop
        push    cs
        call    handler_set_install
        leave
        retf
        db      00h
L_3EDF4:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     ax, 1
        pop     ds
        retf
        db      00h
far_3EE00:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+0ah]
        push    3
        nop
        push    cs
        call    disp_select_plane
        add     sp, 2
        push    3ch
        push    0f8h
        push    0
        push    0
        if      FW_VERSION <> 112
        callf   C0_SEG:EP_DRAW_ERASE_RECT_OFF
        else
        callf   C0_SEG:(C0_BASE+L_3780E-C0_SEG*16)
        endif
        add     sp, 8
        push    1
        nop
        push    cs
        call    disp_select_plane
        add     sp, 2
        mov     ax, word ptr [bp+0ch]
        or      ax, si
        jne     br_3EE3E
        mov     ax, (C1_BASE+L_3EDF4-C1_SEG*16)
        mov     dx, C1_SEG
        mov     si, ax
        mov     word ptr [bp+0ch], dx
br_3EE3E:
        push    word ptr [bp+0ch]
        push    si
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    far_3E93A
        add     sp, 8
        pop     si
        leave
        retf
        db      00h
delay_ticks:
        enter   2, 0
        push    di
        push    si
        mov     si, word ptr [bp+6]
        nop
        push    cs
        call    far_3E8C8
        mov     di, ax
loop_3EE64:
        nop
        push    cs
        call    far_3E8C8
        sub     ax, di
        cmp     ax, si
        jb      loop_3EE64
        pop     si
        pop     di
        leave
        retf
        db      00h
timer_loop_io:
        push    bp
        mov     bp, sp
        mov     cx, 7d0h
tgt_3EE7A:
        loop    tgt_3EE7A
        leave
        retf
far_to_dma_linear:                    ; 24-bit sample address -> far ptr
        enter   4, 0
        mov     ax, word ptr [bp+8]
        sub     dx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, word ptr [bp+6]
        adc     dx, 0
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        cmp     dx, 8
        jb      br_3EEB0
        add     word ptr [bp-4], 0
        adc     word ptr [bp-2], 18h
br_3EEB0:
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        leave
        retf
pow10_lookup:                           ; dword POW10_TABLE[[bp+6]]
        push    bp
        mov     bp, sp
        mov     bx, word ptr [bp+6]
        shl     bx, 2
        mov     ax, word ptr [bx+C1_TBL_00464]
        mov     dx, word ptr [bx+C1_TBL_00466]
        leave
        retf
        nop
L_3EECC:
        dw      0
L_3E59E:
        pusha
        push    ds
        push    es
        mov     bp, sp
        push    ds
        mov     ax, DS_SEG
        mov     ds, ax
        cld
        sti
        nop
        push    cs
        call    far_3EEE6
        mov     sp, bp
        pop     es
        pop     ds
        popa
        iret
far_3EEE6:
        push    di
        push    si
        mov     byte ptr [C0_B_0D776], 1
        mov     byte ptr [C2_B_PAD_ASSIGN_MASTER], 0
        push    ds
        push    C0_W_0D778
        nop
        push    cs
        call    far_3F46E
        add     sp, 4
        mov     byte ptr [C2_B_PAD_VELOCITY], 7fh
        mov     byte ptr [C0_B_0D7B8], 0
        mov     byte ptr [C0_B_0D7B9], 0
        mov     byte ptr [C1_B_0D7BA], 1
        mov     byte ptr [C2_B_RECORD_MIX_CHANGES], 0
        mov     byte ptr [C2_B_PAD_DRUM], 0
        mov     byte ptr [C0_B_0D7BF], 0
        mov     byte ptr [C2_B_PAD_NOTE], 3ch
        mov     byte ptr [C2_B_CUR_PAD], 0
        push    0
        nop
        push    cs
        call    far_3F084
        add     sp, 2
        mov     byte ptr [C0_B_0D7C7], 0
        mov     byte ptr [C1_B_0D7BD], 0
        xor     di, di
        mov     byte ptr [C2_B_MIXER_DRUM], 0
        mov     si, 8fe0h
        jmp     br_3EF6A
        db      90h
loop_3EF4C:
        mov     al, 1
        mov     byte ptr [si+181h], al
        mov     byte ptr [si+182h], al
        mov     byte ptr [si+183h], 7fh
        push    ds
        push    si
        nop
        push    cs
        call    far_3F556
        add     sp, 4
        add     si, 184h
        inc     di
br_3EF6A:
        cmp     di, 3
        jle     loop_3EF4C
        push    C1_SEG
        push    (C1_BASE+L_3FA1C-C1_SEG*16)
        nop
        push    cs
        call    EP_NAME_SPLIT_NUMBER_SUFFIX_OFF+C1_CSBASE
        add     sp, 4
        mov     byte ptr [C1_B_0D7C8], 1
        mov     byte ptr [C0_B_0D7C9], 0
        mov     byte ptr [C1_B_0D7CA], 0
        mov     byte ptr [C1_B_0D7CB], 0
        mov     byte ptr [C2_B_0D7CC], 0
        mov     byte ptr [C2_B_REC_MODE], 2
        mov     byte ptr [C2_B_0D7CE], 1
        mov     word ptr [C1_W_0D7D0], 0ffech
        mov     word ptr [C1_W_0D7D2], 64h
        mov     word ptr [C1_W_0D7D4], 64h
        mov     byte ptr [C0_B_0D7D6], 0
        mov     byte ptr [C1_B_0D7D7], 0
        mov     byte ptr [C1_B_0D7DB], 0
        mov     byte ptr [C1_B_0D7D8], 0
        mov     byte ptr [C1_B_0D7DA], 1
        mov     byte ptr [C1_B_0D7D9], 4
        mov     byte ptr [C1_B_0D7DC], 10h
        mov     byte ptr [C0_B_0D7DD], 1
        mov     word ptr [C1_W_0D7DE], 1eh
        mov     byte ptr [C1_B_0D7E0], 1
        pop     si
        pop     di
        retf
pgm_memory_init:
        push    di
        push    si
        nop
        push    cs
        call    far_3EEE6
        nop
        push    cs
        call    far_3F906
        mov     ax, word ptr [C0_W_098DC]
        mov     dx, word ptr [C0_W_098DE]
        mov     word ptr [C0_W_0D7C2], ax
        mov     word ptr [C0_W_0D7C4], dx
        push    ds
        push    PGM_ARRAY_DS
        nop
        push    cs
        call    far_to_dma_linear
        add     sp, 4
        add     ax, 0fh
        adc     dx, 0
        and     al, 0f0h
        shr     dx, 1
        rcr     ax, 1
        rcr     dx, 1
        rcr     ax, 1
        rcr     dx, 1
        rcr     ax, 1
        rcr     dx, 1
        rcr     ax, 1
        rcr     dx, 1
        xchg    dx, ax
        and     ax, 0f000h
        add     ax, 10h
        adc     dx, 0
        mov     word ptr [C2_FP_PGM_ARRAY], ax
        mov     word ptr [C2_W_PGM_ARRAY_SEG], dx
        xor     si, si
        mov     di, si
        jmp     br_3F04E
        db      90h
loop_3F040:
        les     bx, [C2_FP_PGM_ARRAY]
        mov     byte ptr es:[bx+si+2], 0
        add     si, 99eh
        inc     di
br_3F04E:
        cmp     di, 17h
        jle     loop_3F040
        push    0
        nop
        push    cs
        call    pgm_init_default
        add     sp, 2
        xor     si, si
loop_3F05F:
        push    0
        push    si
        nop
        push    cs
        call    drum_program_select
        add     sp, 4
        inc     si
        cmp     si, 3
        jle     loop_3F05F
        sub     ax, ax
        mov     word ptr [C2_W_PARAM_HOOK_SEG], ax
        mov     word ptr [C2_W_PARAM_HOOK_OFF], ax
        push    ax
        nop
        push    cs
        call    pad_route_mode_set
        add     sp, 2
        pop     si
        pop     di
        retf
far_3F084:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp+6]
        cmp     al, 0f3h
        jge     br_3F090
        mov     al, 0f3h
br_3F090:
        mov     byte ptr [bp+6], al
        cmp     al, 2
        jle     br_3F099
        mov     al, 2
br_3F099:
        mov     byte ptr [bp+6], al
        mov     byte ptr [C1_B_0D775], al
        add     al, 0dh
        mov     byte ptr [bp+6], al
        cbw
        nop
        push    cs
        call    far_3E58A
        mov     al, byte ptr [C1_B_0D775]
        leave
        retf
        db      00h
pgm_init_default:
        enter   0ah, 0
        push    di
        push    si
        imul    bx, word ptr [bp+6], 99eh
        mov     es, word ptr [C2_W_PGM_ARRAY_SEG]
        add     bx, word ptr [C2_FP_PGM_ARRAY]
        mov     word ptr [bp-0ah], bx
        mov     word ptr [bp-8], es
        mov     word ptr es:[bx], 1eh
        les     bx, [bp-0ah]
        mov     ax, C1_SEG
        push    ds
        lea     di, [bx+2]
        mov     si, 21ceh
        mov     ds, ax
        mov     cx, 8
        rep movsw
        movsb
        pop     ds
        mov     al, byte ptr [bp+6]
        mov     bx, word ptr [bp-0ah]
        add     al, 41h
        mov     byte ptr es:[bx+9], al
        mov     byte ptr es:[bx+13h], 0
        mov     byte ptr es:[bx+14h], 88h
        mov     byte ptr es:[bx+15h], 78h
        mov     byte ptr es:[bx+16h], 0ch
        mov     byte ptr es:[bx+17h], 2dh
        mov     byte ptr es:[bx+18h], 0
        mov     byte ptr es:[bx+19h], 14h
        mov     byte ptr es:[bx+1ah], 0ceh
        mov     byte ptr es:[bx+1bh], 32h
        mov     al, byte ptr [bp+6]
        mov     byte ptr es:[bx+1ch], al
        mov     byte ptr es:[bx+1dh], 23h
        lea     ax, [bx+1eh]
        mov     word ptr [bp-2], es
        mov     word ptr [bp-6], 40h
        mov     si, ax
        mov     cx, word ptr [bp-6]
loop_3F139:
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si], 0
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+1], 2ch
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+2], 0
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+3], 58h
        xor     al, al
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+4], al
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+5], al
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+6], al
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+7], al
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+8], 0
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+0ah], al
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+0bh], 5
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+C1_TBL_0000C], al
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+0dh], 64h
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+0eh], al
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+0fh], al
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+10h], al
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+11h], al
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+12h], 64h
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+13h], al
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+14h], al
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+15h], al
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+16h], al
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+17h], al
        add     si, 18h
        dec     cx
        je      br_3F1ED
        jmp     loop_3F139
br_3F1ED:
        mov     si, word ptr [bp-0ah]
        xor     ax, ax
        mov     es, word ptr [bp-8]
        mov     cx, 80h
        lea     di, [si+7deh]
        rep stosw
        lea     ax, [si+61eh]
        push    es
        push    ax
        nop
        push    cs
        call    far_3F556
        add     sp, 4
        mov     ax, si
        mov     dx, word ptr [bp-8]
        add     ax, 79eh
        push    dx
        push    ax
        nop
        push    cs
        call    far_3F46E
        add     sp, 4
        mov     ax, si
        mov     dx, word ptr [bp-8]
        add     ax, 8deh
        push    dx
        push    ax
        nop
        push    cs
        if      FW_VERSION >= 114
        call    _memcpy_3
        else
        call    L_3F030
        endif
        add     sp, 4
        mov     ax, si
        mov     dx, word ptr [bp-8]
        add     ax, PGM_FX_REVERBS
        push    dx
        push    ax
        nop
        push    cs
        if      FW_VERSION >= 114
        call    far_memop_str_2
        else
        call    _memcpy_3
        endif
        add     sp, 4
        pop     si
        pop     di
        leave
        retf
pgm_delete_slot:
        enter   2, 0
        push    si
        imul    si, word ptr [bp+6], 99eh
        les     bx, [C2_FP_PGM_ARRAY]
        mov     byte ptr es:[bx+si+2], 0
        mov     byte ptr [bp-2], 0
loop_3F25D:
        mov     al, byte ptr [bp-2]
        sub     ah, ah
        imul    si, ax, 99eh
        les     bx, [C2_FP_PGM_ARRAY]
        cmp     byte ptr es:[bx+si+2], ah
        jne     br_3F279
        inc     byte ptr [bp-2]
        cmp     byte ptr [bp-2], 17h
        jbe     loop_3F25D
br_3F279:
        cmp     byte ptr [bp-2], 18h
        jne     br_3F28D
        mov     byte ptr [bp-2], 0
        push    0
        nop
        push    cs
        call    pgm_init_default
        add     sp, 2
br_3F28D:
        mov     byte ptr [bp-1], 0
loop_3F291:
        mov     al, byte ptr [bp-1]
        sub     ah, ah
        imul    bx, ax, 184h
        mov     al, byte ptr [bx+C0_TBL_09160]
        imul    si, ax, 99eh
        les     bx, [C2_FP_PGM_ARRAY]
        cmp     byte ptr es:[bx+si+2], ah
        jne     br_3F2BC
        mov     al, byte ptr [bp-2]
        push    ax
        mov     al, byte ptr [bp-1]
        push    ax
        nop
        push    cs
        call    drum_program_select
        add     sp, 4
br_3F2BC:
        inc     byte ptr [bp-1]
        cmp     byte ptr [bp-1], 3
        jbe     loop_3F291
        pop     si
        leave
        retf
pgm_delete_all:
        push    si
        mov     bx, 17h
        mov     es, word ptr [C2_W_PGM_ARRAY_SEG]
loop_3F2D0:
        mov     ax, bx
        cbw
        imul    si, ax, 99eh
        add     si, word ptr [C2_FP_PGM_ARRAY]
        mov     byte ptr es:[si+2], 0
        dec     bx
        jns     loop_3F2D0
        push    0
        nop
        push    cs
        call    pgm_init_default
        add     sp, 2
        mov     si, 3
loop_3F2F0:
        push    0
        push    si
        nop
        push    cs
        call    drum_program_select
        add     sp, 4
        dec     si
        jns     loop_3F2F0
        pop     si
        retf
pgm_alloc_slot:
        push    di
        push    si
        xor     di, di
        mov     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        add     ax, 2
        mov     si, ax
        mov     es, dx
loop_3F312:
        cmp     byte ptr es:[si], 0
        je      br_3F324
        add     si, 99eh
        inc     di
        cmp     di, 17h
        jle     loop_3F312
        jmp     br_3F332
br_3F324:
        push    di
        nop
        push    cs
        call    pgm_init_default
        add     sp, 2
        mov     ax, di
        pop     si
        pop     di
        retf
br_3F332:
        push    EP_FS_OPEN_SEG
        push    EP_L_40370_OFF
        callf   EP_DISP_ALERT_WAIT_KEY_SEG:EP_DISP_ALERT_WAIT_KEY_OFF
        add     sp, 4
        mov     ax, 0ffffh
        pop     si
        pop     di
        retf
far_3F346:
        push    bp
        mov     bp, sp
        push    di
        push    si
        imul    bx, word ptr [bp+6], 99eh
        les     si, [C2_FP_PGM_ARRAY]
        imul    ax, word ptr [bp+8], 99eh
        mov     dx, es
        add     ax, si
        push    ds
        lea     di, [bx+si]
        mov     si, ax
        mov     ds, dx
        mov     cx, 4cfh
        rep movsw
        pop     ds
        pop     si
        pop     di
        leave
        retf
far_3F36E:
        push    si
        xor     cx, cx
        mov     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        add     ax, 2
        mov     si, ax
        mov     es, dx
loop_3F37F:
        cmp     byte ptr es:[si], 0
        jne     br_3F392
        add     si, 99eh
        inc     cx
        cmp     cx, 17h
        jle     loop_3F37F
        jmp     br_3F396
        db      90h
br_3F392:
        mov     ax, cx
        pop     si
        retf
br_3F396:
        xor     ax, ax
        pop     si
        retf
far_3F39A:
        enter   4, 0
        push    di
        mov     di, word ptr [bp+6]
        imul    ax, di, 99eh
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        add     ax, 2
        mov     es, dx
        mov     bx, ax
loop_3F3B5:
        add     bx, 99eh
        inc     di
        cmp     di, 17h
        jg      br_3F3CA
        cmp     byte ptr es:[bx], 0
        je      loop_3F3B5
        mov     ax, di
        pop     di
        leave
        retf
br_3F3CA:
        mov     ax, word ptr [bp+6]
        pop     di
        leave
        retf
L_3F3D0:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     bx, word ptr [bp+6]
        imul    si, bx, 99eh
        mov     es, word ptr [C2_W_PGM_ARRAY_SEG]
        add     si, word ptr [C2_FP_PGM_ARRAY]
        cmp     byte ptr es:[si+2], 0
        je      br_3F3F4
        mov     di, bx
        mov     ax, di
        pop     si
        pop     di
        leave
        retf
        db      90h
br_3F3F4:
        mov     di, word ptr [bp+8]
        cmp     di, bx
        jge     L_3EE1A
        jge     br_3F434
loop_3F3FD:
        push    di
        nop
        push    cs
        call    far_3F39A
        add     sp, 2
        mov     si, ax
        cmp     si, di
        je      br_3F434
        mov     di, ax
        cmp     word ptr [bp+6], ax
        jg      loop_3F3FD
        mov     ax, di
        pop     si
        pop     di
        leave
        retf
        db      90h
L_3EE1A:
        cmp     di, bx
        jle     br_3F434
loop_3F41E:
        push    di
        nop
        push    cs
        call    far_3F43A
        add     sp, 2
        mov     si, ax
        cmp     si, di
        je      br_3F434
        mov     di, ax
        cmp     word ptr [bp+6], ax
        jl      loop_3F41E
br_3F434:
        mov     ax, di
        pop     si
        pop     di
        leave
        retf
far_3F43A:
        enter   4, 0
        push    di
        mov     di, word ptr [bp+6]
        imul    ax, di, 99eh
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        add     ax, 2
        mov     es, dx
        mov     bx, ax
loop_3F455:
        sub     bx, 99eh
        dec     di
        js      br_3F468
        cmp     byte ptr es:[bx], 0
        je      loop_3F455
        mov     ax, di
        pop     di
        leave
        retf
        db      90h
br_3F468:
        mov     ax, word ptr [bp+6]
        pop     di
        leave
        retf
far_3F46E:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     si, 494h
        les     di, [bp+6]
        mov     cx, 20h
        rep movsw
        pop     si
        pop     di
        leave
        retf
copy_note_params_body:                  ; far 3E19:12F2; COPY NOTE PARAMETERS body
        enter   8, 0
        push    di
        push    si
        mov     ax, word ptr [bp+6]
        cmp     word ptr [bp+0ah], ax
        jne     br_3F49E
        mov     ax, word ptr [bp+8]
        cmp     word ptr [bp+0ch], ax
        jne     br_3F49E
        xor     ax, ax
        pop     si
        pop     di
        leave
        retf
br_3F49E:
        sub     word ptr [bp+0ch], 23h
        sub     word ptr [bp+8], 23h
        imul    ax, word ptr [bp+8], 18h
        imul    cx, word ptr [bp+6], 99eh
        mov     word ptr [bp-6], cx
        add     ax, cx
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        add     ax, 1eh
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        imul    ax, word ptr [bp+0ch], 18h
        imul    cx, word ptr [bp+0ah], 99eh
        mov     word ptr [bp-8], cx
        add     ax, cx
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        add     ax, 1eh
        push    ds
        mov     si, ax
        mov     ds, dx
        les     di, [bp-4]
        mov     cx, 0ch
        rep movsw
        pop     ds
        mov     ax, word ptr [bp+8]
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        add     ax, ax
        add     ax, word ptr [bp-6]
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        add     ax, 61eh
        mov     word ptr [bp-4], ax
        mov     ax, word ptr [bp+0ch]
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        add     ax, ax
        add     ax, word ptr [bp-8]
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        add     ax, 61eh
        push    ds
        mov     si, ax
        mov     ds, dx
        mov     di, word ptr [bp-4]
        movsw
        movsw
        movsw
        pop     ds
        mov     bx, word ptr [bp-8]
        add     bx, word ptr [C2_FP_PGM_ARRAY]
        add     bx, 7deh
        mov     si, cx
        shl     si, 2
        mov     ax, word ptr es:[bx+si]
        mov     dx, word ptr es:[bx+si+2]
        mov     si, word ptr [bp+8]
        shl     si, 2
        mov     bx, word ptr [C2_FP_PGM_ARRAY]
        add     si, word ptr [bp-6]
        mov     word ptr es:[bx+si+7deh], ax
        mov     word ptr es:[bx+si+7e0h], dx
        mov     ax, 1
        pop     si
        pop     di
        leave
        retf
far_3F556:
        push    bp
        mov     bp, sp
        push    si
        mov     cx, 40h
        mov     si, word ptr [bp+6]
        mov     es, word ptr [bp+8]
loop_3F563:
        mov     byte ptr es:[si], 64h
        mov     byte ptr es:[si+1], 32h
        mov     byte ptr es:[si+2], 64h
        xor     al, al
        mov     byte ptr es:[si+3], al
        mov     byte ptr es:[si+4], al
        mov     byte ptr es:[si+5], al
        add     si, 6
        dec     cx
        jne     loop_3F563
        pop     si
        leave
        retf
pgm_stereo_mix_ptr:
        enter   4, 0
        push    si
        mov     si, word ptr [bp+8]
        cmp     si, 23h
        jge     br_3F59A
        mov     si, 23h
        jmp     br_3F5A2
br_3F59A:
        cmp     si, 62h
        jle     br_3F5A2
        mov     si, 62h
br_3F5A2:
        cmp     byte ptr [C0_B_0D7B8], 0
        jne     br_3F5BE
        mov     ax, word ptr [bp+6]
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        add     ax, 61eh
        jmp     br_3F5C8
        db      90h
br_3F5BE:
        imul    ax, word ptr [bp+6], 184h
        add     ax, 8fe0h
        mov     dx, ds
br_3F5C8:
        mov     word ptr [bp-4], ax
        mov     ax, si
        add     ax, si
        add     ax, si
        add     ax, ax
        add     ax, word ptr [bp-4]
        sub     ax, 0d2h
        pop     si
        leave
        retf
pgm_indiv_fx_mix_ptr:
        enter   4, 0
        push    si
        mov     si, word ptr [bp+8]
        cmp     si, 23h
        jge     br_3F5EE
        mov     si, 23h
        jmp     br_3F5F6
br_3F5EE:
        cmp     si, 62h
        jle     br_3F5F6
        mov     si, 62h
br_3F5F6:
        cmp     byte ptr [C0_B_0D7B9], 0
        jne     br_3F612
        mov     ax, word ptr [bp+6]
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        add     ax, 61eh
        jmp     br_3F61C
        db      90h
br_3F612:
        imul    ax, word ptr [bp+6], 184h
        add     ax, 8fe0h
        mov     dx, ds
br_3F61C:
        mov     word ptr [bp-4], ax
        mov     ax, si
        add     ax, si
        add     ax, si
        add     ax, ax
        add     ax, word ptr [bp-4]
        sub     ax, 0d2h
        pop     si
        leave
        retf
L_3F030:
        if      FW_VERSION >= 114
_memcpy_3:
        endif
        enter   4, 0
        push    di
        push    si
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     word ptr [bp+6], 48h
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     si, 2
        les     di, [bp-4]
        mov     cx, 24h
        rep movsw
        mov     si, 2
        les     di, [bp+6]
        mov     cx, 24h
        rep movsw
        pop     si
        pop     di
        leave
        retf
        if      FW_VERSION >= 114
FAR_MEMOP_STR_LEN equ 4ah
        include "../../../common/far_memop_str.inc"
        else
_memcpy_3:
        enter   0ch, 0
        push    di
        push    si
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     word ptr [bp+6], 0ch
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     si, 4ah
        les     di, [bp-4]
        mov     cx, 6
        rep movsw
        mov     ax, word ptr [bp+6]
        add     word ptr [bp+6], 0ch
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     si, 4ah
        les     di, [bp-8]
        mov     cx, 6
        rep movsw
        mov     ax, word ptr [bp+6]
        add     word ptr [bp+6], 0ch
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        mov     si, 4ah
        les     di, [bp-0ch]
        mov     cx, 6
        rep movsw
        mov     si, 4ah
        les     di, [bp+6]
        mov     cx, 6
        rep movsw
        pop     si
        pop     di
        leave
        endif
        retf
pgm_fx_section_ptr:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+6]
        cmp     si, 2
        jl      br_3F6CE
        xor     si, si
br_3F6CE:
        mov     al, byte ptr [C2_B_MIXER_DRUM]
        cbw
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        imul    cx, si, 48h
        add     ax, cx
        add     ax, 8deh
        pop     si
        leave
        retf
        db      00h
pgm_fx_reverb_ptr:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+6]
        cmp     si, 4
        jl      br_3F6F8
        xor     si, si
br_3F6F8:
        mov     al, byte ptr [C2_B_MIXER_DRUM]
        cbw
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        mov     cx, si
        add     si, si
        add     si, cx
        shl     si, 2
        add     ax, si
        add     ax, PGM_FX_REVERBS
        pop     si
        leave
        retf
        db      00h
pad_route_mode_set:
        enter   4, 0
        push    di
        push    si
        mov     al, byte ptr [bp+6]
        mov     byte ptr [C1_B_095F0], al
        dec     al
        jne     br_3F780
        push    EP_FS_OPEN_SEG
        push    EP_L_42156_OFF
        callf   EP_EVENT_CB_SET_AUX_SEG:EP_EVENT_CB_SET_AUX_OFF
        add     sp, 4
        xor     si, si
        cmp     byte ptr [C2_B_PAD_ASSIGN_MASTER], 0
        je      br_3F74C
        mov     ax, 0d778h
        mov     di, ax
        mov     word ptr [bp-2], ds
        jmp     loop_3F765
        db      90h
br_3F74C:
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        add     ax, 79eh
        mov     di, ax
        mov     word ptr [bp-2], dx
loop_3F765:
        push    word ptr [bp-2]
        push    di
        lea     ax, [si+C1_TBL_00060]
        push    ax
        callf   EP_IVT_SET_VECTOR_SEG:EP_IVT_SET_VECTOR_OFF
        add     sp, 6
        inc     si
        cmp     si, 3
        jle     loop_3F765
        pop     si
        pop     di
        leave
        retf
        db      90h
br_3F780:
        push    EP_MIDI_CHANNEL_MSG_DISPATCH_SEG
        push    EP_MIDI_CHANNEL_MSG_DISPATCH_OFF
        callf   EP_EVENT_CB_SET_AUX_SEG:EP_EVENT_CB_SET_AUX_OFF
        add     sp, 4
        xor     si, si
loop_3F790:
        cmp     byte ptr [C2_B_PAD_ASSIGN_MASTER], 0
        je      br_3F7A2
        mov     ax, 0d778h
        mov     di, ax
        mov     word ptr [bp-2], ds
        jmp     br_3F7B6
        db      90h
br_3F7A2:
        lea     ax, [si+5ch]
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        add     ax, 79eh
        mov     di, ax
        mov     word ptr [bp-2], dx
br_3F7B6:
        push    word ptr [bp-2]
        push    di
        lea     ax, [si+C1_TBL_00060]
        push    ax
        callf   EP_IVT_SET_VECTOR_SEG:EP_IVT_SET_VECTOR_OFF
        add     sp, 6
        inc     si
        cmp     si, 3
        jle     loop_3F790
        pop     si
        pop     di
        leave
        retf
pad_assign_master_set:
        enter   4, 0
        push    si
        xor     si, si
        mov     al, byte ptr [bp+6]
        mov     byte ptr [C2_B_PAD_ASSIGN_MASTER], al
loop_3F7DD:
        cmp     word ptr [bp+6], 0
        je      br_3F7EE
        mov     word ptr [bp-4], 0d778h
        mov     word ptr [bp-2], ds
        jmp     br_3F815
        db      90h
br_3F7EE:
        cmp     byte ptr [C1_B_095F0], 0
        je      L_3F800
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        add     ax, 5ch
        jmp     SHORT br_3F803
        db      90h
L_3F800:
        lea     ax, [si+5ch]
br_3F803:
        push    ax
        callf   EP_IVT_GET_VECTOR_SEG:EP_IVT_GET_VECTOR_OFF
        add     sp, 2
        add     ax, 79eh
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
br_3F815:
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        lea     ax, [si+C1_TBL_00060]
        push    ax
        callf   EP_IVT_SET_VECTOR_SEG:EP_IVT_SET_VECTOR_OFF
        add     sp, 6
        inc     si
        cmp     si, 3
        jle     loop_3F7DD
        mov     al, byte ptr [C2_B_PAD_ASSIGN_MASTER]
        pop     si
        leave
        retf
        db      00h
drum_program_select:
        enter   0ch, 0
        push    di
        push    si
        mov     si, word ptr [bp+8]
        mov     ax, si
        imul    bx, word ptr [bp+6], 184h
        add     bx, 8fe0h
        mov     word ptr [bp-0ch], bx
        mov     byte ptr [bx+180h], al
        imul    ax, si, 99eh
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        cmp     byte ptr [C1_B_0D7BA], 0
        je      br_3F884
        mov     ax, word ptr [bp-0ch]
        mov     dx, word ptr [bp-8]
        mov     bx, word ptr [bp-6]
        add     dx, 61eh
        push    ds
        mov     di, ax
        mov     si, dx
        push    ds
        pop     es
        mov     ds, bx
        mov     cx, 0c0h
        rep movsw
        pop     ds
br_3F884:
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        mov     ax, word ptr [bp+6]
        add     ax, 5ch
        push    ax
        callf   EP_IVT_SET_VECTOR_SEG:EP_IVT_SET_VECTOR_OFF
        add     sp, 6
        cmp     byte ptr [C2_B_PAD_ASSIGN_MASTER], 0
        je      br_3F8AA
        mov     ax, 0d778h
        mov     di, ax
        mov     word ptr [bp-2], ds
        jmp     br_3F8B8
br_3F8AA:
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        add     ax, 79eh
        mov     di, ax
        mov     word ptr [bp-2], dx
br_3F8B8:
        cmp     byte ptr [C1_B_095F0], 0
        jne     L_3F2D4
        push    word ptr [bp-2]
        push    di
        mov     ax, word ptr [bp+6]
        add     ax, 60h
        push    ax
        callf   EP_IVT_SET_VECTOR_SEG:EP_IVT_SET_VECTOR_OFF
        add     sp, 6
        jmp     SHORT br_3F8EC
L_3F2D4:
        xor     si, si
loop_3F8D6:
        push    word ptr [bp-2]
        push    di
        lea     ax, [si+C1_TBL_00060]
        push    ax
        callf   EP_IVT_SET_VECTOR_SEG:EP_IVT_SET_VECTOR_OFF
        add     sp, 6
        inc     si
        cmp     si, 3
        jle     loop_3F8D6
br_3F8EC:
        mov     al, byte ptr [C2_B_MIXER_DRUM]
        cbw
        cmp     word ptr [bp+6], ax
        jne     br_3F901
        push    0
        push    0fh
        callf   EP_FX_DSP_UPDATE_REQUEST_SEG:EP_FX_DSP_UPDATE_REQUEST_OFF
        add     sp, 4
br_3F901:
        pop     si
        pop     di
        leave
        retf
        db      00h
far_3F906:
        enter   4, 0
        mov     ax, C1_TBL_SOUNDS
        mov     bx, ax
        mov     word ptr [bp-2], ds
        mov     word ptr [C1_W_08176], ax
        mov     word ptr [C1_W_08178], ds
        mov     cx, ds
        mov     dx, ds
        cmp     ax, 0d6dch
        jne     loop_3F926
        cmp     cx, dx
        je      br_3F947
loop_3F926:
        mov     ax, bx
        mov     dx, word ptr [bp-2]
        add     ax, 3eh
        mov     es, dx
        mov     word ptr es:[bx], ax
        mov     word ptr es:[bx+2], dx
        mov     bx, ax
        mov     word ptr [bp-2], dx
        mov     cx, ds
        cmp     ax, 0d6dch
        jne     loop_3F926
        cmp     dx, cx
        jne     loop_3F926
br_3F947:
        mov     es, word ptr [bp-2]
        sub     ax, ax
        mov     word ptr es:[bx+2], ax
        mov     word ptr es:[bx], ax
        mov     word ptr [C1_W_098E8], ax
        mov     word ptr [C1_W_098E6], ax
        mov     word ptr [C1_W_098EC], ax
        mov     word ptr [C1_W_098EA], ax
        mov     ax, C1_TBL_SOUNDS_END
        mov     word ptr [C0_W_098DC], ax
        mov     word ptr [C0_W_098DE], ds
        sub     ax, ax
        mov     word ptr [C1_W_098E2], ax
        mov     word ptr [C1_W_098E0], ax
        mov     byte ptr [C1_B_098EE], al
        or      byte ptr [C1_B_098E4], 0ffh
        mov     word ptr [C1_W_0D724], 2280h
        mov     word ptr [C1_W_0D726], 1
        mov     word ptr [C1_W_0D728], 400h
        mov     word ptr [C1_W_0D72A], ax
        mov     word ptr [C1_W_0D71E], 98dch
        mov     word ptr [C1_W_0D720], ds
        mov     word ptr [C1_W_0D71C], ax
        mov     word ptr [C1_TBL_SOUNDS_END], ax
        push    ds
        push    C1_W_0D72C
        nop
        push    cs
        call    far_3FDB0
        add     sp, 4
        push    ds
        push    C1_TBL_SOUNDS_END
        nop
        push    cs
        call    far_3FC50
        leave
        retf
        db      00h
sound_record_alloc:
        enter   4, 0
        push    si
        mov     ax, word ptr [C1_W_08178]
        or      ax, word ptr [C1_W_08176]
        jne     br_3F9C7
        jmp     br_3FA6C
br_3F9C7:
        mov     ax, word ptr [C1_W_08176]
        mov     dx, word ptr [C1_W_08178]
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        mov     word ptr [C1_W_08176], ax
        mov     word ptr [C1_W_08178], dx
        lea     ax, [si+12h]
        push    es
        push    ax
        nop
        push    cs
        call    far_3FDB0
        add     sp, 4
        nop
        push    cs
        call    smem_high_water
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+0ah], ax
        mov     word ptr es:[si+C1_TBL_0000C], dx
        sub     ax, ax
        mov     word ptr es:[si+10h], ax
        mov     word ptr es:[si+0eh], ax
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si], C1_TBL_SOUNDS_END
        mov     word ptr es:[si+2], ds
        mov     es, word ptr [bp-2]
        mov     ax, word ptr [C1_W_0D71E]
        mov     dx, word ptr [C1_W_0D720]
        mov     word ptr es:[si+4], ax
        mov     word ptr es:[si+6], dx
        mov     cx, es
        mov     bx, ax
        mov     es, dx
        mov     word ptr es:[bx], si
        mov     word ptr es:[bx+2], cx
        mov     es, cx
        les     bx, es:[si]
        mov     word ptr es:[bx+4], si
        mov     word ptr es:[bx+6], cx
        mov     es, cx
        les     bx, es:[si+4]
        mov     al, byte ptr es:[bx+8]
        inc     al
        mov     es, cx
        mov     dh, byte ptr es:[si+9]
        mov     ah, dh
        mov     word ptr es:[si+8], ax
        les     bx, [bp+6]
        mov     word ptr es:[bx], si
        mov     word ptr es:[bx+2], cx
        mov     ax, 1
        pop     si
        leave
        retf
br_3FA6C:
        xor     ax, ax
        pop     si
        leave
        retf
        db      00h
sound_list_unlink:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+6]
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     cx, es
        les     bx, es:[si+4]
        mov     word ptr es:[bx], ax
        mov     word ptr es:[bx+2], dx
        mov     es, cx
        mov     ax, word ptr es:[si+4]
        mov     dx, word ptr es:[si+6]
        les     bx, es:[si]
        mov     word ptr es:[bx+4], ax
        mov     word ptr es:[bx+6], dx
        mov     es, cx
        mov     ax, word ptr [C1_W_08176]
        mov     dx, word ptr [C1_W_08178]
        mov     word ptr es:[si], ax
        mov     word ptr es:[si+2], dx
        mov     word ptr [C1_W_08176], si
        mov     word ptr [C1_W_08178], es
        push    0
        push    0
        push    es
        push    si
        nop
        push    cs
        call    pgm_replace_sound_ref
        add     sp, 8
        pop     si
        leave
        retf
smem_high_water:
        enter   0eh, 0
        mov     word ptr [bp-0ch], 2680h
        mov     word ptr [bp-0ah], 1
        mov     ax, word ptr [C0_W_098DC]
        mov     dx, word ptr [C0_W_098DE]
        mov     bx, ax
        mov     word ptr [bp-2], dx
        mov     ax, dx
        mov     cx, ds
        cmp     bx, C1_TBL_SOUNDS_END
        jne     loop_3FAF6
        cmp     ax, cx
        je      br_3FB39
loop_3FAF6:
        mov     es, word ptr [bp-2]
        test    byte ptr es:[bx+0dh], 1
        jne     br_3FB22
        mov     ax, word ptr es:[bx+0ah]
        mov     dx, word ptr es:[bx+C1_TBL_0000C]
        add     ax, word ptr es:[bx+0eh]
        adc     dx, word ptr es:[bx+10h]
        cmp     dx, word ptr [bp-0ah]
        jl      br_3FB22
        jg      br_3FB1C
        cmp     ax, word ptr [bp-0ch]
        jbe     br_3FB22
br_3FB1C:
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
br_3FB22:
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        mov     bx, ax
        mov     word ptr [bp-2], dx
        mov     cx, ds
        cmp     ax, C1_TBL_SOUNDS_END
        jne     loop_3FAF6
        cmp     dx, cx
        jne     loop_3FAF6
br_3FB39:
        mov     ax, word ptr [bp-0ch]
        mov     dx, word ptr [bp-0ah]
        leave
        retf
        db      00h
smem_free_bytes:
        enter   8, 0
        mov     ax, word ptr [C0_W_SMEM_SIZE]
        mov     dx, word ptr [C2_W_SMEM_SIZE_HI]
        sub     ax, 2680h
        sbb     dx, 1
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     ax, word ptr [C0_W_098DC]
        mov     dx, word ptr [C0_W_098DE]
        mov     bx, ax
        mov     word ptr [bp-2], dx
        mov     cx, ds
        cmp     ax, C1_TBL_SOUNDS_END
        jne     loop_3FB70
        cmp     dx, cx
        je      br_3FB9F
loop_3FB70:
        mov     es, word ptr [bp-2]
        test    byte ptr es:[bx+0dh], 1
        jne     br_3FB88
        mov     ax, word ptr es:[bx+0eh]
        mov     dx, word ptr es:[bx+10h]
        sub     word ptr [bp-8], ax
        sbb     word ptr [bp-6], dx
br_3FB88:
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        mov     bx, ax
        mov     word ptr [bp-2], dx
        mov     cx, ds
        cmp     ax, C1_TBL_SOUNDS_END
        jne     loop_3FB70
        cmp     dx, cx
        jne     loop_3FB70
br_3FB9F:
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        leave
        retf
        db      00h
smem_compact:
        enter   8, 0
        push    si
        push    EP_FS_OPEN_SEG
        push    EP_FAR_4029A_OFF
        nop
        push    cs
        call    far_40138
        add     sp, 4
        mov     word ptr [bp-4], 2680h
        mov     word ptr [bp-2], 1
        mov     si, word ptr [C0_W_098DC]
        mov     dx, word ptr [C0_W_098DE]
        mov     word ptr [bp-6], dx
        mov     ax, dx
        mov     cx, ds
        cmp     si, C1_TBL_SOUNDS_END
        jne     loop_3FBDE
        cmp     ax, cx
        je      br_3FC4D
loop_3FBDE:
        mov     es, word ptr [bp-6]
        test    byte ptr es:[si+0dh], 1
        jne     br_3FC4D
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        cmp     word ptr es:[si+0ah], ax
        jne     br_3FBFA
        cmp     word ptr es:[si+C1_TBL_0000C], dx
        je      br_3FC25
br_3FBFA:
        push    word ptr es:[si+10h]
        push    word ptr es:[si+0eh]
        push    word ptr es:[si+C1_TBL_0000C]
        push    word ptr es:[si+0ah]
        push    dx
        push    ax
        nop
        push    cs
        call    far_3E3B8
        add     sp, 0ch
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        mov     es, word ptr [bp-6]
        mov     word ptr es:[si+0ah], ax
        mov     word ptr es:[si+C1_TBL_0000C], dx
br_3FC25:
        mov     es, word ptr [bp-6]
        mov     ax, word ptr es:[si+0eh]
        mov     dx, word ptr es:[si+10h]
        add     word ptr [bp-4], ax
        adc     word ptr [bp-2], dx
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     si, ax
        mov     word ptr [bp-6], dx
        mov     cx, ds
        cmp     ax, C1_TBL_SOUNDS_END
        jne     loop_3FBDE
        cmp     dx, cx
        jne     loop_3FBDE
br_3FC4D:
        pop     si
        leave
        retf
far_3FC50:
        enter   6, 0
        push    di
        push    si
        mov     word ptr [bp-4], 7f00h
        mov     ax, 7fffh
        mov     cx, 32h
        xor     bx, bx
        mov     dx, 7f00h
        mov     di, bx
        mov     es, dx
        rep stosw
        mov     bx, 32h
        cmp     bx, 400h
        jge     br_3FC84
        mov     cx, 400h
        sub     cx, bx
        xor     ax, ax
        add     bx, bx
        xor     si, si
        lea     di, [bx+si]
        rep stosw
br_3FC84:
        push    400h
        push    dx
        push    0
        les     bx, [bp+6]
        push    word ptr es:[bx+C1_TBL_0000C]
        push    word ptr es:[bx+0ah]
        nop
        push    cs
        call    smem_write_block
        add     sp, 0ah
        les     bx, [bp+6]
        mov     word ptr es:[bx+0eh], 400h
        mov     word ptr es:[bx+10h], 0
        mov     ax, (C1_BASE+L_4038E-C1_SEG*16)
        mov     cx, C1_SEG
        mov     di, ax
        mov     word ptr [bp-4], cx
        mov     word ptr [bp-2], 0
        mov     es, cx
        mov     bx, ax
        cmp     byte ptr es:[bx], 0
        je      br_3FCEA
        mov     si, word ptr [bp-2]
        mov     cx, word ptr [bp+6]
loop_3FCCC:
        cmp     si, 10h
        jge     br_3FCEA
        mov     bx, di
        inc     di
        mov     al, byte ptr es:[bx]
        mov     bx, cx
        mov     es, word ptr [bp+8]
        mov     byte ptr es:[bx+si+12h], al
        inc     si
        mov     es, word ptr [bp-4]
        cmp     byte ptr es:[di], 0
        jne     loop_3FCCC
br_3FCEA:
        les     bx, [bp+6]
        mov     word ptr es:[bx+2eh], 400h
        mov     word ptr es:[bx+30h], 0
        pop     si
        pop     di
        leave
        retf
        db      00h
size_para_round_mul:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp+0ah]
        cwd
        push    dx
        push    ax
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     ax, 0fh
        adc     dx, 0
        and     al, 0f0h
        push    dx
        push    ax
        callf   EP_AFLMUL_SEG:EP_AFLMUL_OFF
        leave
        retf
far_3FD1E:
        enter   12h, 0
        push    di
        push    si
loop_3FD24:
        mov     ax, C1_SEG
        push    ds
        lea     di, [bp-12h]
        mov     si, 2204h
        push    ss
        pop     es
        mov     ds, ax
        mov     cx, 8
        rep movsw
        movsb
        pop     ds
        mov     ax, word ptr [C1_W_004D4]
        mov     cx, 64h
        cwd
        idiv    cx
        add     al, 30h
        mov     byte ptr [bp-11h], al
        mov     ax, word ptr [C1_W_004D4]
        cwd
        idiv    cx
        mov     ax, dx
        mov     cx, 0ah
        cwd
        idiv    cx
        add     al, 30h
        mov     byte ptr [bp-10h], al
        mov     ax, word ptr [C1_W_004D4]
        cwd
        idiv    cx
        add     dl, 30h
        mov     byte ptr [bp-0fh], dl
        lea     ax, [bp-12h]
        push    ss
        push    ax
        push    0
        push    0
        nop
        push    cs
        call    far_3FE9E
        add     sp, 8
        or      ax, ax
        jne     loop_3FD24
        lea     di, [bp-12h]
        mov     cx, ss
        mov     es, cx
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
        mov     ax, word ptr [C1_W_004D4]
        inc     ax
        mov     cx, 3e8h
        cwd
        idiv    cx
        mov     word ptr [C1_W_004D4], dx
        pop     si
        pop     di
        leave
        retf
far_3FDB0:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     si, word ptr [bp+6]
        mov     ax, word ptr [bp+8]
        push    ax
        push    si
        mov     di, ax
        nop
        push    cs
        call    far_3FD1E
        add     sp, 4
        mov     es, di
        mov     byte ptr es:[si+11h], 64h
        mov     byte ptr es:[si+12h], 0
        mov     byte ptr es:[si+13h], 0
        sub     ax, ax
        mov     word ptr es:[si+16h], ax
        mov     word ptr es:[si+14h], ax
        mov     word ptr es:[si+1ah], ax
        mov     word ptr es:[si+18h], ax
        mov     word ptr es:[si+1eh], ax
        mov     word ptr es:[si+1ch], ax
        mov     word ptr es:[si+22h], ax
        mov     word ptr es:[si+20h], ax
        mov     byte ptr es:[si+24h], al
        mov     byte ptr es:[si+25h], 4
        mov     word ptr es:[si+26h], 0ac44h
        pop     si
        pop     di
        leave
        retf
        db      00h
sound_list_contains:
        enter   4, 0
        push    si
        mov     ax, word ptr [C0_W_098DC]
        mov     dx, word ptr [C0_W_098DE]
        mov     bx, ax
        mov     word ptr [bp-2], dx
        mov     cx, ds
        cmp     ax, C1_TBL_SOUNDS_END
        jne     br_3FE2A
        cmp     dx, cx
        je      br_3FE5A
br_3FE2A:
        mov     cx, word ptr [bp+6]
loop_3FE2D:
        mov     ax, word ptr [bp-2]
        cmp     bx, cx
        jne     br_3FE39
        cmp     ax, word ptr [bp+8]
        je      br_3FE54
br_3FE39:
        mov     es, ax
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        mov     bx, ax
        mov     word ptr [bp-2], dx
        mov     si, ds
        cmp     ax, C1_TBL_SOUNDS_END
        jne     loop_3FE2D
        cmp     dx, si
        jne     loop_3FE2D
        jmp     br_3FE5A
br_3FE54:
        mov     ax, 1
        pop     si
        leave
        retf
br_3FE5A:
        xor     ax, ax
        pop     si
        leave
        retf
        db      00h
far_3FE60:
        enter   4, 0
        push    si
        xor     cx, cx
        mov     ax, word ptr [C0_W_098DC]
        mov     dx, word ptr [C0_W_098DE]
        mov     bx, ax
        mov     word ptr [bp-2], dx
        mov     si, ds
        cmp     ax, C1_TBL_SOUNDS_END
        jne     loop_3FE7E
        cmp     dx, si
        je      br_3FE99
loop_3FE7E:
        inc     cx
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        mov     bx, ax
        mov     word ptr [bp-2], dx
        mov     si, ds
        cmp     ax, C1_TBL_SOUNDS_END
        jne     loop_3FE7E
        cmp     dx, si
        jne     loop_3FE7E
br_3FE99:
        mov     ax, cx
        pop     si
        leave
        retf
far_3FE9E:
        enter   4, 0
        push    di
        push    si
        mov     ax, word ptr [C0_W_098DC]
        mov     dx, word ptr [C0_W_098DE]
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     cx, ds
        cmp     ax, C1_TBL_SOUNDS_END
        jne     br_3FEBB
        cmp     dx, cx
        je      br_3FF12
br_3FEBB:
        mov     di, word ptr [bp+0ah]
loop_3FEBE:
        push    word ptr [bp+0ch]
        push    di
        mov     ax, si
        mov     dx, word ptr [bp-2]
        add     ax, 12h
        push    dx
        push    ax
        if      FW_VERSION <> 112
        callf   C0_SEG:EP_FSTRICMP_OFF
        else
        callf   C0_SEG:(C0_BASE+__fstricmp-C0_SEG*16)
        endif
        add     sp, 8
        or      ax, ax
        je      br_3FEF4
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     cx, ds
        cmp     ax, C1_TBL_SOUNDS_END
        jne     loop_3FEBE
        cmp     dx, cx
        jne     loop_3FEBE
        jmp     br_3FF12
br_3FEF4:
        mov     bx, word ptr [bp+6]
        mov     ax, word ptr [bp+8]
        or      ax, bx
        je      br_3FF0B
        mov     es, word ptr [bp+8]
        mov     ax, word ptr [bp-2]
        mov     word ptr es:[bx], si
        mov     word ptr es:[bx+2], ax
br_3FF0B:
        mov     ax, 1
        pop     si
        pop     di
        leave
        retf
br_3FF12:
        xor     ax, ax
        pop     si
        pop     di
        leave
        retf
far_3FF18:
        enter   4, 0
        push    di
        push    si
        mov     ax, word ptr [C0_W_098DC]
        mov     dx, word ptr [C0_W_098DE]
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     cx, ds
        cmp     ax, C1_TBL_SOUNDS_END
        jne     br_3FF35
        cmp     dx, cx
        je      br_3FF9E
br_3FF35:
        mov     di, word ptr [bp+0ah]
loop_3FF38:
        mov     ax, word ptr [bp-2]
        cmp     si, di
        jne     br_3FF44
        cmp     ax, word ptr [bp+0ch]
        je      br_3FF64
br_3FF44:
        mov     ax, di
        mov     dx, word ptr [bp+0ch]
        add     ax, 12h
        push    dx
        push    ax
        mov     ax, si
        mov     dx, word ptr [bp-2]
        add     ax, 12h
        push    dx
        push    ax
        if      FW_VERSION <> 112
        callf   C0_SEG:EP_FSTRICMP_OFF
        else
        callf   C0_SEG:(C0_BASE+__fstricmp-C0_SEG*16)
        endif
        add     sp, 8
        or      ax, ax
        je      br_3FF80
br_3FF64:
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     cx, ds
        cmp     ax, C1_TBL_SOUNDS_END
        jne     loop_3FF38
        cmp     dx, cx
        jne     loop_3FF38
        jmp     br_3FF9E
br_3FF80:
        mov     bx, word ptr [bp+6]
        mov     ax, word ptr [bp+8]
        or      ax, bx
        je      br_3FF97
        mov     es, word ptr [bp+8]
        mov     ax, word ptr [bp-2]
        mov     word ptr es:[bx], si
        mov     word ptr es:[bx+2], ax
br_3FF97:
        mov     ax, 1
        pop     si
        pop     di
        leave
        retf
br_3FF9E:
        xor     ax, ax
        pop     si
        pop     di
        leave
        retf
pgm_replace_sound_ref:
        enter   16h, 0
        push    di
        mov     word ptr [bp-0ah], 0
        mov     word ptr [bp-0ch], 18h
loop_3FFB3:
        les     bx, [C2_FP_PGM_ARRAY]
        add     bx, word ptr [bp-0ah]
        cmp     byte ptr es:[bx+2], 0
        je      br_3FFFA
        mov     ax, bx
        add     ax, 7deh
        mov     bx, ax
        mov     word ptr [bp-2], es
        mov     word ptr [bp-8], 40h
        mov     cx, word ptr [bp-8]
        mov     di, word ptr [bp+6]
loop_3FFD6:
        mov     ax, word ptr [bp+8]
        mov     es, word ptr [bp-2]
        cmp     word ptr es:[bx], di
        jne     br_3FFF4
        cmp     word ptr es:[bx+2], ax
        jne     br_3FFF4
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        mov     word ptr es:[bx], ax
        mov     word ptr es:[bx+2], dx
br_3FFF4:
        add     bx, 4
        dec     cx
        jne     loop_3FFD6
br_3FFFA:
        add     word ptr [bp-0ah], 99eh
        dec     word ptr [bp-0ch]
        jne     loop_3FFB3
        pop     di
        leave
        retf
        db      00h
L_40008:
        enter   1ah, 0
        push    si
        mov     ax, word ptr [C0_W_098DC]
        mov     dx, word ptr [C0_W_098DE]
        mov     bx, ax
        mov     word ptr [bp-6], dx
        mov     cx, ds
        cmp     ax, C1_TBL_SOUNDS_END
        jne     loop_40024
        cmp     dx, cx
        je      br_40043
loop_40024:
        mov     es, word ptr [bp-6]
        or      byte ptr es:[bx+9], 1
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        mov     bx, ax
        mov     word ptr [bp-6], dx
        mov     cx, ds
        cmp     ax, C1_TBL_SOUNDS_END
        jne     loop_40024
        cmp     dx, cx
        jne     loop_40024
br_40043:
        xor     si, si
        mov     word ptr [bp-10h], 18h
loop_4004A:
        les     bx, [C2_FP_PGM_ARRAY]
        add     bx, si
        cmp     byte ptr es:[bx+2], 0
        je      br_4008F
        lea     ax, [bx+7deh]
        mov     word ptr [bp-2], es
        mov     word ptr [bp-0ah], 40h
        mov     word ptr [bp-0eh], si
        mov     si, ax
        mov     cx, word ptr [bp-0ah]
loop_4006B:
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     bx, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      br_40086
        mov     es, word ptr [bp-6]
        and     byte ptr es:[bx+9], 0feh
br_40086:
        add     si, 4
        dec     cx
        jne     loop_4006B
        mov     si, word ptr [bp-0eh]
br_4008F:
        add     si, 99eh
        dec     word ptr [bp-10h]
        jne     loop_4004A
        xor     cx, cx
        mov     ax, word ptr [C0_W_098DC]
        mov     dx, word ptr [C0_W_098DE]
        mov     bx, ax
        mov     word ptr [bp-6], dx
        mov     ax, dx
        mov     dx, ds
        cmp     bx, C1_TBL_SOUNDS_END
        jne     loop_400B4
        cmp     ax, dx
        je      br_400D6
loop_400B4:
        mov     es, word ptr [bp-6]
        test    byte ptr es:[bx+9], 1
        je      br_400BF
        inc     cx
br_400BF:
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        mov     bx, ax
        mov     word ptr [bp-6], dx
        mov     si, ds
        cmp     ax, C1_TBL_SOUNDS_END
        jne     loop_400B4
        cmp     dx, si
        jne     loop_400B4
br_400D6:
        mov     ax, cx
        pop     si
        leave
        retf
        db      00h
L_400DC:
        enter   0ah, 0
        push    di
        push    si
        mov     word ptr [bp-2], 0
        mov     ax, word ptr [C0_W_098DC]
        mov     dx, word ptr [C0_W_098DE]
        mov     di, ax
        mov     ax, dx
        mov     cx, ds
        cmp     di, C1_TBL_SOUNDS_END
        jne     loop_400FE
        cmp     ax, cx
        je      br_40131
loop_400FE:
        mov     es, ax
        mov     ax, word ptr es:[di]
        mov     dx, word ptr es:[di+2]
        mov     si, ax
        mov     word ptr [bp-8], dx
        test    byte ptr es:[di+9], 1
        je      br_40120
        push    es
        push    di
        nop
        push    cs
        call    sound_list_unlink
        add     sp, 4
        inc     word ptr [bp-2]
br_40120:
        mov     ax, word ptr [bp-8]
        mov     di, si
        mov     cx, ds
        cmp     si, C1_TBL_SOUNDS_END
        jne     loop_400FE
        cmp     ax, cx
        jne     loop_400FE
br_40131:
        mov     ax, word ptr [bp-2]
        pop     si
        pop     di
        leave
        retf
far_40138:
        enter   8, 0
        push    di
        push    si
        mov     ax, C1_TBL_SOUNDS_END
        mov     cx, ds
        cmp     ax, word ptr [C0_W_098DC]
        jne     br_40152
        cmp     cx, word ptr [C0_W_098DE]
        jne     br_40152
        jmp     br_40233
br_40152:
        les     bx, [C0_W_098DC]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        mov     di, ax
        mov     word ptr [bp-2], dx
        mov     cx, C1_TBL_SOUNDS_END
        mov     bx, ds
        cmp     cx, ax
        jne     loop_40172
        cmp     bx, dx
        jne     loop_40172
        jmp     br_40233
loop_40172:
        mov     es, dx
        mov     ax, word ptr es:[di]
        mov     dx, word ptr es:[di+2]
        les     bx, es:[di+4]
        mov     word ptr es:[bx], ax
        mov     word ptr es:[bx+2], dx
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[di+4]
        mov     dx, word ptr es:[di+6]
        les     bx, es:[di]
        mov     word ptr es:[bx+4], ax
        mov     word ptr es:[bx+6], dx
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[di+4]
        mov     dx, word ptr es:[di+6]
        mov     si, ax
        mov     word ptr [bp-6], dx
        push    dx
        push    ax
        push    es
        push    di
        callf   [bp+6]
        add     sp, 8
        or      ax, ax
        jge     br_401DA
loop_401BA:
        mov     es, word ptr [bp-6]
        mov     ax, word ptr es:[si+4]
        mov     dx, word ptr es:[si+6]
        mov     si, ax
        mov     word ptr [bp-6], dx
        push    dx
        push    ax
        push    word ptr [bp-2]
        push    di
        callf   [bp+6]
        add     sp, 8
        or      ax, ax
        jl      loop_401BA
br_401DA:
        mov     ax, word ptr [bp-6]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[di+4], si
        mov     word ptr es:[di+6], ax
        mov     es, ax
        mov     cx, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[di], cx
        mov     word ptr es:[di+2], dx
        mov     es, ax
        mov     ax, word ptr [bp-2]
        mov     word ptr es:[si], di
        mov     word ptr es:[si+2], ax
        mov     es, ax
        les     bx, es:[di]
        mov     word ptr es:[bx+4], di
        mov     word ptr es:[bx+6], ax
        mov     es, ax
        mov     ax, word ptr es:[di]
        mov     dx, word ptr es:[di+2]
        mov     di, ax
        mov     word ptr [bp-2], dx
        mov     cx, ds
        cmp     ax, C1_TBL_SOUNDS_END
        je      br_4022C
        jmp     loop_40172
br_4022C:
        cmp     dx, cx
        je      br_40233
        jmp     loop_40172
br_40233:
        pop     si
        pop     di
        leave
        retf
        db      00h
sound_cmp_name:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        add     ax, 12h
        push    dx
        push    ax
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     ax, 12h
        push    dx
        push    ax
        if      FW_VERSION <> 112
        callf   C0_SEG:EP_FSTRICMP_OFF
        else
        callf   C0_SEG:(C0_BASE+__fstricmp-C0_SEG*16)
        endif
        leave
        retf
sound_cmp_size:
        enter   4, 0
        push    di
        mov     di, word ptr [bp+6]
        mov     bx, word ptr [bp+0ah]
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[di+0eh]
        mov     dx, word ptr es:[di+10h]
        mov     es, word ptr [bp+0ch]
        sub     ax, word ptr es:[bx+0eh]
        sbb     dx, word ptr es:[bx+10h]
        or      dx, dx
        jl      br_4028A
        jg      br_40283
        or      ax, ax
        je      br_4028A
br_40283:
        mov     ax, 1
        pop     di
        leave
        retf
        db      90h
br_4028A:
        or      dx, dx
        jge     br_40294
        mov     ax, 0ffffh
        pop     di
        leave
        retf
br_40294:
        xor     ax, ax
        pop     di
        leave
        retf
        db      00h
far_4029A:
        enter   4, 0
        push    di
        mov     di, word ptr [bp+6]
        mov     bx, word ptr [bp+0ah]
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[di+0ah]
        mov     dx, word ptr es:[di+C1_TBL_0000C]
        mov     es, word ptr [bp+0ch]
        sub     ax, word ptr es:[bx+0ah]
        sbb     dx, word ptr es:[bx+C1_TBL_0000C]
        or      dx, dx
        jl      br_402CC
        jg      br_402C5
        or      ax, ax
        je      br_402CC
br_402C5:
        mov     ax, 1
        pop     di
        leave
        retf
        db      90h
br_402CC:
        or      dx, dx
        jge     br_402D6
        mov     ax, 0ffffh
        pop     di
        leave
        retf
br_402D6:
        xor     ax, ax
        pop     di
        leave
        retf
        db      00h
L_3F9AC:
        push    bp
        mov     bp, sp
        les     bx, [bp+6]
        sub     ah, ah
        mov     al, byte ptr es:[bx+8]
        les     bx, [bp+0ah]
        sub     ch, ch
        mov     cl, byte ptr es:[bx+8]
        sub     ax, cx
        leave
        retf
        db      00h
sound_list_renumber:
        enter   4, 0
        push    di
        push    si
        push    EP_FS_OPEN_SEG
        push    EP_C1_20A8_OFF
        nop
        push    cs
        call    far_40138
        add     sp, 4
        xor     di, di
        mov     ax, word ptr [C0_W_098DC]
        mov     dx, word ptr [C0_W_098DE]
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     cx, ds
        cmp     ax, C1_TBL_SOUNDS_END
        jne     loop_40323
        cmp     dx, cx
        je      br_40348
loop_40323:
        mov     es, word ptr [bp-2]
        mov     ax, di
        mov     ah, byte ptr es:[si+9]
        mov     word ptr es:[si+8], ax
        inc     di
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     cx, ds
        cmp     ax, C1_TBL_SOUNDS_END
        jne     loop_40323
        cmp     dx, cx
        jne     loop_40323
br_40348:
        pop     si
        pop     di
        leave
        retf
L_3FA1C:
        db      "sound           "
        db      00h, 00h
        db      "NewPgm-_        "
        db      00h, 00h
L_40370:
        db      "Prog. directory full(24 max)"
        db      00h, 00h
L_4038E:
        db      "Click"
        db      00h
        db      "{@@@}_%TEMP&SND%"
        db      00h, 00h
far_403A6:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+6]
        push    word ptr [bp+10h]
        push    word ptr [bp+0eh]
        push    0
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[si+0ah]
        mov     dx, word ptr es:[si+C1_TBL_0000C]
        add     ax, word ptr [bp+0ah]
        adc     dx, word ptr [bp+0ch]
        push    dx
        push    ax
        nop
        push    cs
        call    far_3E32A
        add     sp, 0ah
        mov     es, word ptr [bp+8]
        cmp     byte ptr es:[si+25h], 0
        je      br_4040E
        push    word ptr [bp+10h]
        push    word ptr [bp+0eh]
        push    0
        push    0
        push    2
        push    word ptr es:[si+10h]
        push    word ptr es:[si+0eh]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     es, word ptr [bp+8]
        add     ax, word ptr es:[si+0ah]
        adc     dx, word ptr es:[si+C1_TBL_0000C]
        add     ax, word ptr [bp+0ah]
        adc     dx, word ptr [bp+0ch]
        push    dx
        push    ax
        nop
        push    cs
        call    far_3E32A
        add     sp, 0ah
br_4040E:
        pop     si
        leave
        retf
        db      00h
far_40412:
        enter   0ch, 0
        push    di
        push    si
        mov     di, word ptr [bp+0eh]
        mov     ax, word ptr [bp+12h]
        mov     dx, word ptr [bp+14h]
        mov     es, word ptr [bp+10h]
        cmp     word ptr es:[di+30h], dx
        jg      br_4044C
        jl      br_40432
        cmp     word ptr es:[di+2eh], ax
        ja      br_4044C
br_40432:
        push    word ptr [bp+18h]
        push    word ptr [bp+16h]
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    far_403A6
        jmp     br_4054F
br_4044C:
        mov     ax, word ptr es:[di+0ah]
        mov     dx, word ptr es:[di+C1_TBL_0000C]
        add     ax, word ptr [bp+12h]
        adc     dx, word ptr [bp+14h]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        cmp     byte ptr es:[di+25h], 0
        je      br_40484
        push    0
        push    2
        push    word ptr es:[di+10h]
        push    word ptr es:[di+0eh]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        add     word ptr [bp-4], ax
        adc     word ptr [bp-2], dx
br_40484:
        mov     es, word ptr [bp+10h]
        mov     ax, word ptr [bp+16h]
        mov     dx, word ptr [bp+18h]
        add     ax, word ptr [bp+12h]
        adc     dx, word ptr [bp+14h]
        cmp     dx, word ptr es:[di+30h]
        jl      br_404DA
        jg      br_404A1
        cmp     ax, word ptr es:[di+2eh]
        jbe     br_404DA
br_404A1:
        mov     si, word ptr [bp+6]
        mov     ax, word ptr es:[di+2eh]
        mov     dx, word ptr es:[di+30h]
        sub     ax, word ptr [bp+12h]
        sbb     dx, word ptr [bp+14h]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     cx, word ptr [bp+16h]
        mov     bx, word ptr [bp+18h]
        sub     cx, ax
        sbb     bx, dx
        push    bx
        push    cx
        add     ax, word ptr [bp+0ah]
        adc     dx, word ptr [bp+0ch]
        push    dx
        push    ax
        push    word ptr [bp+8]
        push    si
        nop
        push    cs
        call    far_403A6
        add     sp, 0ch
        jmp     br_404E9
br_404DA:
        mov     ax, word ptr [bp+16h]
        mov     dx, word ptr [bp+18h]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     si, word ptr [bp+6]
br_404E9:
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[si+0ah]
        mov     dx, word ptr es:[si+C1_TBL_0000C]
        add     ax, word ptr [bp+0ah]
        adc     dx, word ptr [bp+0ch]
        push    dx
        push    ax
        nop
        push    cs
        call    far_3E3B8
        add     sp, 0ch
        mov     es, word ptr [bp+8]
        cmp     byte ptr es:[si+25h], 0
        je      br_40552
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    0
        push    2
        push    word ptr es:[si+10h]
        push    word ptr es:[si+0eh]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     es, word ptr [bp+8]
        add     ax, word ptr es:[si+0ah]
        adc     dx, word ptr es:[si+C1_TBL_0000C]
        add     ax, word ptr [bp+0ah]
        adc     dx, word ptr [bp+0ch]
        push    dx
        push    ax
        nop
        push    cs
        call    far_3E3B8
br_4054F:
        add     sp, 0ch
br_40552:
        pop     si
        pop     di
        leave
        retf
far_40556:
        enter   8, 0
        push    di
        push    si
        nop
        push    cs
        call    far_3E978
        or      ax, ax
        je      br_40568
        jmp     br_40646
br_40568:
        push    word ptr [bp+10h]
        push    word ptr [bp+0eh]
        push    ax
        push    ax
        nop
        push    cs
        call    far_3FE9E
        add     sp, 8
        or      ax, ax
        je      br_4057F
        jmp     br_4063E
br_4057F:
        push    10h
        nop
        push    cs
        call    voice_buf_helper_1
        add     sp, 2
        les     bx, [bp+0ah]
        push    word ptr es:[bx+10h]
        push    word ptr es:[bx+0eh]
        lea     ax, [bp-8]
        push    ss
        push    ax
        nop
        push    cs
        call    far_41518
        add     sp, 8
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_405AE
        jmp     br_4062E
br_405AE:
        les     bx, [bp-8]
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        add     ax, 12h
        push    ds
        lea     di, [bx+12h]
        mov     si, ax
        mov     ds, dx
        mov     cx, 14h
        rep movsw
        pop     ds
        mov     bx, word ptr [bp-8]
        mov     cx, es
        add     bx, 12h
        push    ds
        mov     si, bx
        mov     ds, cx
        les     di, [bp+0eh]
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
        mov     ax, word ptr es:[bx+3ah]
        mov     dx, word ptr es:[bx+3ch]
        les     bx, [bp-8]
        mov     word ptr es:[bx+3ah], ax
        mov     word ptr es:[bx+3ch], dx
        les     bx, [bp+0ah]
        push    word ptr es:[bx+10h]
        push    word ptr es:[bx+0eh]
        push    word ptr es:[bx+C1_TBL_0000C]
        push    word ptr es:[bx+0ah]
        les     bx, [bp-8]
        push    word ptr es:[bx+C1_TBL_0000C]
        push    word ptr es:[bx+0ah]
        nop
        push    cs
        call    far_3E3B8
        add     sp, 0ch
br_4062E:
        push    10h
        nop
        push    cs
        call    voice_buf_helper_2
        add     sp, 2
        mov     bx, word ptr [bp-4]
        jmp     br_40651
        db      90h
br_4063E:
        mov     ax, (C1_BASE+L_415A2-C1_SEG*16)
        mov     cx, C1_SEG
        jmp     br_4064C
br_40646:
        mov     ax, (C1_BASE+L_415B4-C1_SEG*16)
        mov     cx, C1_SEG
br_4064C:
        mov     bx, ax
        mov     word ptr [bp-2], cx
br_40651:
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        les     si, [bp+6]
        mov     word ptr es:[si], ax
        mov     word ptr es:[si+2], dx
        mov     ax, bx
        mov     dx, word ptr [bp-2]
        pop     si
        pop     di
        leave
        retf
        enter   0ch, 0
        push    di
        push    si
        nop
        push    cs
        call    far_3E978
        or      ax, ax
        je      br_4067C
        jmp     br_407F4
br_4067C:
        push    10h
        nop
        push    cs
        call    voice_buf_helper_1
        add     sp, 2
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    0
        push    0
        nop
        push    cs
        call    far_3FE9E
        add     sp, 8
        or      ax, ax
        je      br_4069F
        jmp     br_407DC
br_4069F:
        push    word ptr [bp+10h]
        push    word ptr [bp+0eh]
        push    ax
        push    ax
        nop
        push    cs
        call    far_3FE9E
        add     sp, 8
        or      ax, ax
        je      br_406B6
        jmp     br_407DC
br_406B6:
        les     di, [bp+0eh]
        push    ds
        lds     si, [bp+0ah]
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        repe cmpsb
        je      br_406CF
        sbb     ax, ax
        sbb     ax, 0ffffh
br_406CF:
        pop     ds
        or      ax, ax
        jne     br_406D7
        jmp     br_407DC
br_406D7:
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        lea     ax, [bp-8]
        push    ss
        push    ax
        nop
        push    cs
        call    far_40556
        add     sp, 0ch
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_406FD
        jmp     br_407BB
br_406FD:
        push    0
        push    2
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        add     ax, 0eh
        push    dx
        push    ax
        callf   EP_AFFALDIV_SEG:EP_AFFALDIV_OFF
        les     bx, [bp-8]
        mov     byte ptr es:[bx+25h], 0
        lea     ax, [bp-0ch]
        push    ss
        push    ax
        nop
        push    cs
        call    sound_record_alloc
        add     sp, 4
        or      ax, ax
        jne     br_4072D
        jmp     br_407C0
br_4072D:
        les     bx, [bp-0ch]
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        add     ax, 12h
        push    ds
        lea     di, [bx+12h]
        mov     si, ax
        mov     ds, dx
        mov     cx, 14h
        rep movsw
        pop     ds
        mov     bx, word ptr [bp-0ch]
        mov     cx, es
        add     bx, 12h
        push    ds
        mov     si, bx
        mov     ds, cx
        les     di, [bp+0eh]
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
        les     bx, [bp-8]
        mov     ax, word ptr es:[bx+3ah]
        mov     dx, word ptr es:[bx+3ch]
        les     bx, [bp-0ch]
        mov     word ptr es:[bx+3ah], ax
        mov     word ptr es:[bx+3ch], dx
        les     bx, [bp-8]
        mov     ax, word ptr es:[bx+0eh]
        mov     dx, word ptr es:[bx+10h]
        les     bx, [bp-0ch]
        mov     word ptr es:[bx+0eh], ax
        mov     word ptr es:[bx+10h], dx
        les     bx, [bp-8]
        mov     ax, word ptr es:[bx+0ah]
        mov     dx, word ptr es:[bx+C1_TBL_0000C]
        add     ax, word ptr es:[bx+0eh]
        adc     dx, word ptr es:[bx+10h]
        les     bx, [bp-0ch]
        mov     word ptr es:[bx+0ah], ax
        mov     word ptr es:[bx+C1_TBL_0000C], dx
br_407BB:
        mov     si, word ptr [bp-4]
        jmp     br_407E7
br_407C0:
        mov     ax, (C1_BASE+L_415CA-C1_SEG*16)
        mov     cx, C1_SEG
        mov     si, ax
        mov     word ptr [bp-2], cx
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        nop
        push    cs
        call    sound_list_unlink
        add     sp, 4
        jmp     br_407E7
        db      90h
br_407DC:
        mov     ax, (C1_BASE+L_415A2-C1_SEG*16)
        mov     cx, C1_SEG
        mov     si, ax
        mov     word ptr [bp-2], cx
br_407E7:
        push    10h
        nop
        push    cs
        call    voice_buf_helper_2
        add     sp, 2
        jmp     br_407FD
        db      90h
br_407F4:
        mov     si, (C1_BASE+L_415B4-C1_SEG*16)
        mov     cx, C1_SEG
        mov     word ptr [bp-2], cx
br_407FD:
        mov     ax, si
        mov     dx, word ptr [bp-2]
        pop     si
        pop     di
        leave
        retf
L_3FED6:
        enter   0ch, 0
        push    di
        push    si
        nop
        push    cs
        call    far_3E978
        or      ax, ax
        je      br_40818
        jmp     br_40996
br_40818:
        push    10h
        nop
        push    cs
        call    voice_buf_helper_1
        add     sp, 2
        push    word ptr [bp+10h]
        push    word ptr [bp+0eh]
        push    0
        push    0
        nop
        push    cs
        call    far_3FE9E
        add     sp, 8
        or      ax, ax
        je      br_40846
        mov     word ptr [bp-4], (C1_BASE+L_415A2-C1_SEG*16)
        mov     word ptr [bp-2], C1_SEG
        jmp     br_40986
        db      90h
br_40846:
        les     bx, [bp+6]
        mov     ax, word ptr es:[bx+0eh]
        mov     dx, word ptr es:[bx+10h]
        add     ax, ax
        adc     dx, dx
        push    dx
        push    ax
        lea     ax, [bp-8]
        push    ss
        push    ax
        nop
        push    cs
        call    far_41518
        add     sp, 8
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_40871
        jmp     br_40986
br_40871:
        les     bx, [bp-8]
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     ax, 12h
        push    ds
        lea     di, [bx+12h]
        mov     si, ax
        mov     ds, dx
        mov     cx, 14h
        rep movsw
        pop     ds
        mov     bx, word ptr [bp-8]
        mov     byte ptr es:[bx+25h], 1
        mov     bx, word ptr [bp-8]
        mov     cx, word ptr [bp-6]
        add     bx, 12h
        push    ds
        mov     si, bx
        mov     ds, cx
        les     di, [bp+0eh]
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
        les     bx, [bp+6]
        mov     ax, word ptr es:[bx+3ah]
        mov     dx, word ptr es:[bx+3ch]
        les     bx, [bp-8]
        mov     word ptr es:[bx+3ah], ax
        mov     word ptr es:[bx+3ch], dx
        les     bx, [bp+6]
        push    word ptr es:[bx+10h]
        push    word ptr es:[bx+0eh]
        push    word ptr es:[bx+C1_TBL_0000C]
        push    word ptr es:[bx+0ah]
        les     bx, [bp-8]
        push    word ptr es:[bx+C1_TBL_0000C]
        push    word ptr es:[bx+0ah]
        nop
        push    cs
        call    far_3E3B8
        add     sp, 0ch
        mov     si, word ptr [bp+0ah]
        les     bx, [bp+6]
        push    word ptr es:[bx+10h]
        push    word ptr es:[bx+0eh]
        mov     es, word ptr [bp+0ch]
        push    word ptr es:[si+C1_TBL_0000C]
        push    word ptr es:[si+0ah]
        les     bx, [bp-8]
        mov     ax, word ptr es:[bx+0ah]
        mov     dx, word ptr es:[bx+C1_TBL_0000C]
        les     bx, [bp+6]
        add     ax, word ptr es:[bx+0eh]
        adc     dx, word ptr es:[bx+10h]
        push    dx
        push    ax
        nop
        push    cs
        call    far_3E3B8
        add     sp, 0ch
        mov     es, word ptr [bp+0ch]
        mov     ax, word ptr es:[si+2eh]
        mov     dx, word ptr es:[si+30h]
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        les     bx, [bp+6]
        cmp     word ptr es:[bx+10h], dx
        jl      br_40986
        jg      br_40955
        cmp     word ptr es:[bx+0eh], ax
        jbe     br_40986
br_40955:
        mov     ax, word ptr es:[bx+0eh]
        mov     dx, word ptr es:[bx+10h]
        mov     cx, ax
        mov     bx, dx
        sub     ax, word ptr [bp-0ch]
        sbb     dx, word ptr [bp-0ah]
        push    dx
        push    ax
        push    0
        les     di, [bp-8]
        add     cx, word ptr es:[di+0ah]
        adc     bx, word ptr es:[di+C1_TBL_0000C]
        add     cx, word ptr [bp-0ch]
        adc     bx, word ptr [bp-0ah]
        push    bx
        push    cx
        nop
        push    cs
        call    far_3E32A
        add     sp, 0ah
br_40986:
        push    10h
        nop
        push    cs
        call    voice_buf_helper_2
        add     sp, 2
        mov     bx, word ptr [bp-4]
        jmp     br_4099F
        db      90h
br_40996:
        mov     bx, (C1_BASE+L_415B4-C1_SEG*16)
        mov     cx, C1_SEG
        mov     word ptr [bp-2], cx
br_4099F:
        mov     ax, bx
        mov     dx, word ptr [bp-2]
        pop     si
        pop     di
        leave
        retf
L_409A8:
        enter   20h, 0
        push    di
        push    si
        mov     di, word ptr [bp+6]
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[di]
        mov     dx, word ptr es:[di+2]
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     cx, word ptr es:[di+8]
        mov     bx, word ptr es:[di+0ah]
        mov     word ptr [bp-0ch], cx
        mov     word ptr [bp-0ah], bx
        mov     cx, word ptr es:[di+C1_TBL_0000C]
        mov     bx, word ptr es:[di+0eh]
        mov     word ptr [bp-1ch], cx
        mov     word ptr [bp-1ah], bx
        mov     es, dx
        mov     bx, ax
        test    byte ptr es:[bx+0dh], 1
        je      br_409EA
        jmp     br_40B40
br_409EA:
        mov     ax, word ptr es:[si+0ah]
        mov     dx, word ptr es:[si+C1_TBL_0000C]
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        push    0
        push    2
        push    word ptr es:[si+10h]
        push    word ptr es:[si+0eh]
        mov     word ptr [bp-20h], ax
        mov     word ptr [bp-1eh], dx
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     word ptr [bp-14h], ax
        mov     word ptr [bp-12h], dx
        mov     ax, word ptr [bp-1ch]
        mov     dx, word ptr [bp-1ah]
        sub     ax, word ptr [bp-0ch]
        sbb     dx, word ptr [bp-0ah]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        add     ax, 0fh
        adc     dx, 0
        and     al, 0f0h
        mov     word ptr [bp-18h], ax
        mov     word ptr [bp-16h], dx
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        mov     ax, word ptr [bp-20h]
        mov     dx, word ptr [bp-1eh]
        add     ax, word ptr [bp-0ch]
        adc     dx, word ptr [bp-0ah]
        push    dx
        push    ax
        push    word ptr [bp-1eh]
        push    word ptr [bp-20h]
        nop
        push    cs
        call    far_3E3B8
        add     sp, 0ch
        mov     es, word ptr [bp-2]
        cmp     byte ptr es:[si+25h], 0
        je      br_40A91
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        mov     ax, word ptr [bp-14h]
        mov     dx, word ptr [bp-12h]
        add     ax, word ptr [bp-10h]
        adc     dx, word ptr [bp-0eh]
        add     ax, word ptr [bp-0ch]
        adc     dx, word ptr [bp-0ah]
        push    dx
        push    ax
        mov     ax, word ptr [bp-18h]
        mov     dx, word ptr [bp-16h]
        add     ax, word ptr [bp-10h]
        adc     dx, word ptr [bp-0eh]
        push    dx
        push    ax
        nop
        push    cs
        call    far_3E3B8
        add     sp, 0ch
br_40A91:
        mov     ax, word ptr [bp-0ch]
        mov     dx, word ptr [bp-0ah]
        mov     es, word ptr [bp-2]
        sub     word ptr es:[si+26h], ax
        sbb     word ptr es:[si+28h], dx
        cmp     word ptr es:[si+28h], 0
        jge     br_40AB6
        mov     es, word ptr [bp-2]
        sub     ax, ax
        mov     word ptr es:[si+28h], ax
        mov     word ptr es:[si+26h], ax
br_40AB6:
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+2eh], ax
        mov     word ptr es:[si+30h], dx
        mov     word ptr es:[si+2ah], ax
        mov     word ptr es:[si+2ch], dx
        cmp     word ptr es:[si+34h], dx
        jl      br_40B07
        jg      br_40ADD
        cmp     word ptr es:[si+32h], ax
        jbe     br_40B07
br_40ADD:
        push    0
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+2ah]
        mov     dx, word ptr es:[si+2ch]
        mov     word ptr es:[si+32h], ax
        mov     word ptr es:[si+34h], dx
        push    dx
        push    ax
        callf   EP_ADDR_CALC_SEGMENT_SEG:EP_ADDR_CALC_SEGMENT_OFF
        add     sp, 6
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+3ah], ax
        mov     word ptr es:[si+3ch], dx
br_40B07:
        push    word ptr [bp-16h]
        push    word ptr [bp-18h]
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+25h]
        sub     ah, ah
        inc     ax
        cwd
        push    dx
        push    ax
        callf   EP_AFLMUL_SEG:EP_AFLMUL_OFF
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+0eh], ax
        mov     word ptr es:[si+10h], dx
        mov     es, word ptr [bp+8]
        mov     ax, word ptr [bp-2]
        mov     word ptr es:[di+4], si
        mov     word ptr es:[di+6], ax
        xor     ax, ax
        cwd
        pop     si
        pop     di
        leave
        retf
        db      90h
br_40B40:
        mov     ax, (C1_BASE+L_415DC-C1_SEG*16)
        mov     dx, C1_SEG
        pop     si
        pop     di
        leave
        retf
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+6]
        mov     es, word ptr [bp+8]
        test    byte ptr es:[si+0dh], 1
        jne     br_40B90
        push    0
        mov     ax, word ptr es:[si+2ah]
        mov     dx, word ptr es:[si+2ch]
        sub     ax, word ptr es:[si+26h]
        sbb     dx, word ptr es:[si+28h]
        mov     word ptr es:[si+32h], ax
        mov     word ptr es:[si+34h], dx
        push    dx
        push    ax
        callf   EP_ADDR_CALC_SEGMENT_SEG:EP_ADDR_CALC_SEGMENT_OFF
        add     sp, 6
        mov     es, word ptr [bp+8]
        mov     word ptr es:[si+3ah], ax
        mov     word ptr es:[si+3ch], dx
        xor     ax, ax
        cwd
        pop     si
        leave
        retf
br_40B90:
        mov     ax, (C1_BASE+L_415DC-C1_SEG*16)
        mov     dx, C1_SEG
        pop     si
        leave
        retf
        db      00h
far_40B9A:
        enter   14h, 0
        push    di
        push    si
        mov     di, word ptr [bp+6]
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[di]
        mov     dx, word ptr es:[di+2]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     ax, word ptr es:[di+8]
        mov     dx, word ptr es:[di+0ah]
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        mov     cx, word ptr es:[di+C1_TBL_0000C]
        mov     bx, word ptr es:[di+0eh]
        sub     cx, ax
        sbb     bx, dx
        mov     word ptr [bp-4], cx
        mov     word ptr [bp-2], bx
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    0
        push    0
        nop
        push    cs
        call    far_3FE9E
        add     sp, 8
        or      ax, ax
        jne     br_40C48
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        lea     ax, [bp-14h]
        push    ss
        push    ax
        nop
        push    cs
        call    alloc_destination_sample
        add     sp, 10h
        mov     si, ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        jne     br_40C51
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    0
        push    0
        push    word ptr [bp-12h]
        push    word ptr [bp-14h]
        nop
        push    cs
        call    far_40412
        add     sp, 14h
        mov     ax, word ptr [bp-14h]
        mov     dx, word ptr [bp-12h]
        mov     es, word ptr [bp+8]
        mov     word ptr es:[di+4], ax
        mov     word ptr es:[di+6], dx
        jmp     br_40C51
br_40C48:
        mov     si, (C1_BASE+L_415A2-C1_SEG*16)
        mov     cx, C1_SEG
        mov     word ptr [bp-0eh], cx
br_40C51:
        mov     ax, si
        mov     dx, word ptr [bp-0eh]
        pop     si
        pop     di
        leave
        retf
L_40C5A:
        enter   10h, 0
        push    di
        push    si
        mov     di, word ptr [bp+6]
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[di]
        mov     dx, word ptr es:[di+2]
        mov     si, ax
        mov     word ptr [bp-0ah], dx
        mov     cx, word ptr es:[di+8]
        mov     bx, word ptr es:[di+0ah]
        mov     word ptr [bp-8], cx
        mov     word ptr [bp-6], bx
        mov     es, dx
        mov     bx, ax
        test    byte ptr es:[bx+0dh], 1
        je      br_40C8E
        jmp     br_40D66
br_40C8E:
        les     bx, [bp+0ah]
        mov     ax, word ptr es:[bx+2eh]
        mov     dx, word ptr es:[bx+30h]
        mov     es, word ptr [bp-0ah]
        add     ax, word ptr es:[si+2eh]
        adc     dx, word ptr es:[si+30h]
        push    dx
        push    ax
        push    0
        push    0
        push    es
        push    si
        lea     ax, [bp-10h]
        push    ss
        push    ax
        nop
        push    cs
        call    alloc_destination_sample
        add     sp, 10h
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_40CC6
        jmp     br_40D70
br_40CC6:
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    0
        push    0
        push    word ptr [bp-0ah]
        push    si
        push    0
        push    0
        push    word ptr [bp-0eh]
        push    word ptr [bp-10h]
        nop
        push    cs
        call    far_40412
        add     sp, 14h
        les     bx, [bp+0ah]
        push    word ptr es:[bx+30h]
        push    word ptr es:[bx+2eh]
        push    0
        push    0
        push    es
        push    bx
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    word ptr [bp-0eh]
        push    word ptr [bp-10h]
        nop
        push    cs
        call    far_40412
        add     sp, 14h
        mov     es, word ptr [bp-0ah]
        mov     ax, word ptr es:[si+2eh]
        mov     dx, word ptr es:[si+30h]
        sub     ax, word ptr [bp-8]
        sbb     dx, word ptr [bp-6]
        push    dx
        push    ax
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    es
        push    si
        les     bx, [bp+0ah]
        mov     ax, word ptr es:[bx+2eh]
        mov     dx, word ptr es:[bx+30h]
        add     ax, word ptr [bp-8]
        adc     dx, word ptr [bp-6]
        push    dx
        push    ax
        push    word ptr [bp-0eh]
        push    word ptr [bp-10h]
        nop
        push    cs
        call    far_40412
        add     sp, 14h
        push    word ptr [bp-0ah]
        push    si
        nop
        push    cs
        call    sound_list_unlink
        add     sp, 4
        mov     ax, word ptr [bp-10h]
        mov     dx, word ptr [bp-0eh]
        mov     es, word ptr [bp+8]
        mov     word ptr es:[di+4], ax
        mov     word ptr es:[di+6], dx
        jmp     br_40D70
br_40D66:
        mov     word ptr [bp-4], (C1_BASE+L_415DC-C1_SEG*16)
        mov     word ptr [bp-2], C1_SEG
br_40D70:
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        pop     si
        pop     di
        leave
        retf
        enter   30h, 0
        push    di
        push    si
        mov     di, word ptr [bp+6]
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[di]
        mov     dx, word ptr es:[di+2]
        mov     si, ax
        mov     word ptr [bp-1eh], dx
        mov     cx, word ptr es:[di+8]
        mov     bx, word ptr es:[di+0ah]
        mov     word ptr [bp-4], cx
        mov     word ptr [bp-2], bx
        mov     cx, word ptr es:[di+C1_TBL_0000C]
        mov     bx, word ptr es:[di+0eh]
        mov     word ptr [bp-8], cx
        mov     word ptr [bp-6], bx
        mov     es, dx
        mov     bx, ax
        test    byte ptr es:[bx+0dh], 1
        je      br_40DBC
        jmp     br_40FE6
br_40DBC:
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        cmp     word ptr [bp-6], dx
        jge     br_40DCA
        jmp     br_40FD0
br_40DCA:
        jg      br_40DD3
        cmp     cx, ax
        ja      br_40DD3
        jmp     br_40FD0
br_40DD3:
        mov     ax, word ptr es:[si+2eh]
        mov     dx, word ptr es:[si+30h]
        mov     word ptr [bp-18h], ax
        mov     word ptr [bp-16h], dx
        mov     cx, ax
        mov     bx, dx
        sub     ax, word ptr [bp-8]
        sbb     dx, word ptr [bp-6]
        mov     word ptr [bp-24h], ax
        mov     word ptr [bp-22h], dx
        add     ax, word ptr [bp-4]
        adc     dx, word ptr [bp-2]
        mov     word ptr [bp-1ch], ax
        mov     word ptr [bp-1ah], dx
        mov     word ptr [bp-28h], ax
        mov     word ptr [bp-26h], dx
        mov     ax, word ptr es:[si+0ah]
        mov     dx, word ptr es:[si+C1_TBL_0000C]
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        add     cx, 0fh
        adc     bx, 0
        and     cl, 0f0h
        mov     word ptr [bp-14h], cx
        mov     word ptr [bp-12h], bx
        mov     cx, word ptr [bp-28h]
        mov     bx, word ptr [bp-26h]
        add     cx, 0fh
        adc     bx, 0
        and     cl, 0f0h
        mov     word ptr [bp-10h], cx
        mov     word ptr [bp-0eh], bx
        push    word ptr [bp-22h]
        push    word ptr [bp-24h]
        mov     cx, ax
        mov     bx, dx
        add     ax, word ptr [bp-8]
        adc     dx, word ptr [bp-6]
        push    dx
        push    ax
        add     cx, word ptr [bp-4]
        adc     bx, word ptr [bp-2]
        push    bx
        push    cx
        nop
        push    cs
        call    far_3E3B8
        add     sp, 0ch
        mov     es, word ptr [bp-1eh]
        cmp     byte ptr es:[si+25h], 0
        je      br_40EC9
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        mov     ax, word ptr [bp-14h]
        mov     dx, word ptr [bp-12h]
        add     ax, word ptr [bp-0ch]
        adc     dx, word ptr [bp-0ah]
        push    dx
        push    ax
        mov     cx, word ptr [bp-10h]
        mov     bx, word ptr [bp-0eh]
        add     cx, word ptr [bp-0ch]
        adc     bx, word ptr [bp-0ah]
        push    bx
        push    cx
        mov     word ptr [bp-2ch], ax
        mov     word ptr [bp-2ah], dx
        mov     word ptr [bp-30h], cx
        mov     word ptr [bp-2eh], bx
        nop
        push    cs
        call    far_3E3B8
        add     sp, 0ch
        mov     ax, word ptr [bp-18h]
        mov     dx, word ptr [bp-16h]
        sub     ax, word ptr [bp-8]
        sbb     dx, word ptr [bp-6]
        push    dx
        push    ax
        mov     ax, word ptr [bp-2ch]
        mov     dx, word ptr [bp-2ah]
        add     ax, word ptr [bp-8]
        adc     dx, word ptr [bp-6]
        push    dx
        push    ax
        mov     ax, word ptr [bp-30h]
        mov     dx, word ptr [bp-2eh]
        add     ax, word ptr [bp-4]
        adc     dx, word ptr [bp-2]
        push    dx
        push    ax
        nop
        push    cs
        call    far_3E3B8
        add     sp, 0ch
br_40EC9:
        push    word ptr [bp-0eh]
        push    word ptr [bp-10h]
        mov     es, word ptr [bp-1eh]
        mov     al, byte ptr es:[si+25h]
        sub     ah, ah
        inc     ax
        cwd
        push    dx
        push    ax
        callf   EP_AFLMUL_SEG:EP_AFLMUL_OFF
        mov     es, word ptr [bp-1eh]
        mov     word ptr es:[si+0eh], ax
        mov     word ptr es:[si+10h], dx
        mov     ax, word ptr [bp-1ch]
        mov     dx, word ptr [bp-1ah]
        mov     word ptr es:[si+2eh], ax
        mov     word ptr es:[si+30h], dx
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        cmp     word ptr es:[si+2ch], dx
        jl      br_40F28
        jg      br_40F0E
        cmp     word ptr es:[si+2ah], ax
        jbe     br_40F28
br_40F0E:
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        sub     ax, word ptr [bp-8]
        sbb     dx, word ptr [bp-6]
        mov     es, word ptr [bp-1eh]
        add     word ptr es:[si+2ah], ax
        adc     word ptr es:[si+2ch], dx
        jmp     br_40F47
        db      90h
br_40F28:
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        mov     es, word ptr [bp-1eh]
        cmp     word ptr es:[si+2ch], dx
        jl      br_40F47
        jg      br_40F3F
        cmp     word ptr es:[si+2ah], ax
        jbe     br_40F47
br_40F3F:
        mov     word ptr es:[si+2ah], ax
        mov     word ptr es:[si+2ch], dx
br_40F47:
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        mov     es, word ptr [bp-1eh]
        cmp     word ptr es:[si+28h], dx
        jl      br_40F74
        jg      br_40F5E
        cmp     word ptr es:[si+26h], ax
        jbe     br_40F74
br_40F5E:
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        sub     ax, word ptr [bp-8]
        sbb     dx, word ptr [bp-6]
        add     word ptr es:[si+26h], ax
        adc     word ptr es:[si+28h], dx
        jmp     br_40F90
br_40F74:
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        cmp     word ptr es:[si+28h], dx
        jl      br_40F90
        jg      br_40F88
        cmp     word ptr es:[si+26h], ax
        jbe     br_40F90
br_40F88:
        mov     word ptr es:[si+26h], ax
        mov     word ptr es:[si+28h], dx
br_40F90:
        mov     es, word ptr [bp-1eh]
        mov     ax, word ptr es:[si+32h]
        mov     dx, word ptr es:[si+34h]
        cmp     word ptr es:[si+2ch], dx
        jg      br_40FD0
        jl      br_40FA9
        cmp     word ptr es:[si+2ah], ax
        jae     br_40FD0
br_40FA9:
        push    0
        mov     ax, word ptr es:[si+2ah]
        mov     dx, word ptr es:[si+2ch]
        mov     word ptr es:[si+32h], ax
        mov     word ptr es:[si+34h], dx
        push    dx
        push    ax
        callf   EP_ADDR_CALC_SEGMENT_SEG:EP_ADDR_CALC_SEGMENT_OFF
        add     sp, 6
        mov     es, word ptr [bp-1eh]
        mov     word ptr es:[si+3ah], ax
        mov     word ptr es:[si+3ch], dx
br_40FD0:
        mov     es, word ptr [bp+8]
        mov     ax, word ptr [bp-1eh]
        mov     word ptr es:[di+4], si
        mov     word ptr es:[di+6], ax
        xor     ax, ax
        cwd
        pop     si
        pop     di
        leave
        retf
        db      90h
br_40FE6:
        mov     ax, (C1_BASE+L_415DC-C1_SEG*16)
        mov     dx, C1_SEG
        pop     si
        pop     di
        leave
        retf
L_406C0:
        enter   0ch, 0
        push    di
        push    si
        mov     si, word ptr [bp+6]
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     di, ax
        mov     word ptr [bp-0ah], dx
        mov     cx, word ptr es:[si+8]
        mov     bx, word ptr es:[si+0ah]
        mov     word ptr [bp-4], cx
        mov     word ptr [bp-2], bx
        mov     cx, word ptr es:[si+C1_TBL_0000C]
        mov     bx, word ptr es:[si+0eh]
        mov     word ptr [bp-6], bx
        mov     es, dx
        mov     bx, ax
        test    byte ptr es:[bx+0dh], 1
        jne     br_41070
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        cmp     word ptr [bp-6], dx
        jl      br_4105A
        jg      br_4103D
        cmp     cx, ax
        jbe     br_4105A
br_4103D:
        mov     ax, cx
        mov     dx, word ptr [bp-6]
        sub     ax, word ptr [bp-4]
        sbb     dx, word ptr [bp-2]
        push    dx
        push    ax
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    es
        push    di
        nop
        push    cs
        call    far_403A6
        add     sp, 0ch
br_4105A:
        mov     es, word ptr [bp+8]
        mov     ax, word ptr [bp-0ah]
        mov     word ptr es:[si+4], di
        mov     word ptr es:[si+6], ax
        xor     ax, ax
        cwd
        pop     si
        pop     di
        leave
        retf
        db      90h
br_41070:
        mov     ax, (C1_BASE+L_415DC-C1_SEG*16)
        mov     dx, C1_SEG
        pop     si
        pop     di
        leave
        retf
L_4107A:
        enter   1eh, 0
        push    di
        push    si
        mov     bx, word ptr [bp+6]
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        mov     si, ax
        mov     word ptr [bp-12h], dx
        mov     cx, word ptr es:[bx+8]
        mov     di, word ptr es:[bx+0ah]
        mov     word ptr [bp-0ch], cx
        mov     word ptr [bp-0ah], di
        mov     cx, word ptr es:[bx+C1_TBL_0000C]
        mov     di, word ptr es:[bx+0eh]
        mov     word ptr [bp-10h], cx
        mov     word ptr [bp-0eh], di
        mov     es, dx
        mov     di, ax
        test    byte ptr es:[di+0dh], 1
        je      br_410BC
        jmp     br_4127E
br_410BC:
        mov     ax, word ptr [bp-0ch]
        mov     dx, word ptr [bp-0ah]
        cmp     word ptr [bp-0eh], dx
        jge     br_410CA
        jmp     br_41268
br_410CA:
        jg      br_410D3
        cmp     cx, ax
        ja      br_410D3
        jmp     br_41268
br_410D3:
        mov     word ptr [bp-4], 0
        mov     word ptr [bp-2], 7f00h
        mov     word ptr [bp-6], 800h
        mov     cl, byte ptr es:[si+25h]
        sub     ch, ch
        inc     cx
        jne     br_410EE
        jmp     br_41268
br_410EE:
        mov     word ptr [bp-16h], cx
loop_410F1:
        mov     es, word ptr [bp-12h]
        mov     ax, word ptr es:[si+0ah]
        mov     dx, word ptr es:[si+C1_TBL_0000C]
        mov     cx, ax
        mov     bx, dx
        add     ax, word ptr [bp-0ch]
        adc     dx, word ptr [bp-0ah]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        add     cx, word ptr [bp-10h]
        adc     bx, word ptr [bp-0eh]
        mov     word ptr [bp-8], cx
        mov     word ptr [bp-6], bx
        cmp     cx, ax
        jne     loop_41123
        cmp     bx, dx
        jne     loop_41123
        jmp     br_41240
loop_41123:
        mov     ax, cx
        mov     dx, bx
        sub     ax, word ptr [bp-4]
        sbb     dx, word ptr [bp-2]
        cmp     ax, 1
        jne     br_41139
        or      dx, dx
        jne     br_41139
        jmp     br_41240
br_41139:
        mov     ax, cx
        mov     dx, bx
        sub     ax, word ptr [bp-4]
        sbb     dx, word ptr [bp-2]
        or      dx, dx
        jge     br_4114A
        jmp     br_4120A
br_4114A:
        jg      br_41154
        cmp     ax, 800h
        ja      br_41154
        jmp     br_4120A
br_41154:
        push    0f000h
        push    400h
        push    7f00h
        push    0
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        add     ah, 4
        adc     dx, 0
        mov     cx, ax
        mov     bx, dx
        sub     ax, 1
        sbb     dx, 0
        push    dx
        push    ax
        mov     word ptr [bp-1ah], cx
        mov     word ptr [bp-18h], bx
        nop
        push    cs
        call    smem_block_copy
        add     sp, 0ch
        push    0f000h
        push    400h
        push    7f00h
        push    800h
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        sub     ax, 1
        sbb     dx, 0
        push    dx
        push    ax
        nop
        push    cs
        call    smem_block_copy
        add     sp, 0ch
        push    400h
        push    7f00h
        push    800h
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    smem_write_block
        add     sp, 0ah
        push    400h
        push    7f00h
        push    0
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        sub     ax, 400h
        sbb     dx, 0
        push    dx
        push    ax
        mov     word ptr [bp-1eh], ax
        mov     word ptr [bp-1ch], dx
        nop
        push    cs
        call    smem_write_block
        add     sp, 0ah
        mov     ax, word ptr [bp-1ah]
        mov     dx, word ptr [bp-18h]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     cx, word ptr [bp-1eh]
        mov     bx, word ptr [bp-1ch]
        mov     word ptr [bp-8], cx
        mov     word ptr [bp-6], bx
        cmp     cx, ax
        je      br_41201
        jmp     loop_41123
br_41201:
        cmp     bx, dx
        je      br_41208
        jmp     loop_41123
br_41208:
        jmp     br_41240
br_4120A:
        push    0f000h
        mov     ax, cx
        sub     ax, word ptr [bp-4]
        push    ax
        push    7f00h
        push    0
        mov     dx, bx
        sub     cx, 1
        sbb     dx, 0
        push    dx
        push    cx
        mov     di, ax
        nop
        push    cs
        call    smem_block_copy
        add     sp, 0ch
        push    di
        push    7f00h
        push    0
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    smem_write_block
        add     sp, 0ah
br_41240:
        push    0
        push    2
        mov     es, word ptr [bp-12h]
        push    word ptr es:[si+10h]
        push    word ptr es:[si+0eh]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        add     word ptr [bp-0ch], ax
        adc     word ptr [bp-0ah], dx
        add     word ptr [bp-10h], ax
        adc     word ptr [bp-0eh], dx
        dec     word ptr [bp-16h]
        je      br_41268
        jmp     loop_410F1
br_41268:
        les     bx, [bp+6]
        mov     ax, word ptr [bp-12h]
        mov     word ptr es:[bx+4], si
        mov     word ptr es:[bx+6], ax
        xor     ax, ax
        cwd
        pop     si
        pop     di
        leave
        retf
        db      90h
br_4127E:
        mov     ax, (C1_BASE+L_415DC-C1_SEG*16)
        mov     dx, C1_SEG
        pop     si
        pop     di
        leave
        retf
L_40958:
        enter   24h, 0
        push    di
        push    si
        sub     ax, ax
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0eh], ax
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-0ah], ax
        imul    ax, word ptr [bp+10h], 1b9h
        mov     cx, 0ah
        sub     dx, dx
        div     cx
        mov     word ptr [bp-14h], ax
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     ax, 12h
        push    dx
        push    ax
        nop
        push    cs
        call    EP_NAME_SPLIT_NUMBER_SUFFIX_OFF+C1_CSBASE
        add     sp, 4
        cmp     word ptr [bp+12h], 0
        je      br_4133F
        nop
        push    cs
        call    pgm_alloc_slot
        mov     word ptr [bp-4], ax
        or      ax, ax
        jl      br_4133F
        imul    ax, ax, 99eh
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-8], dx
        add     ax, 2
        mov     bx, word ptr [bp+6]
        mov     cx, word ptr [bp+8]
        add     bx, 12h
        mov     si, ax
        push    ds
        mov     di, bx
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
        mov     word ptr [bp-2], ax
        mov     bx, ax
        mov     di, word ptr [bp-0ah]
        mov     es, word ptr [bp-8]
loop_4131C:
        lea     ax, [bx+23h]
        mov     si, di
        add     si, bx
        inc     bx
        mov     byte ptr es:[si+79eh], al
        cmp     bx, 40h
        jl      loop_4131C
        push    word ptr [bp-4]
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    drum_program_select
        add     sp, 4
br_4133F:
        mov     word ptr [bp-2], 0
        cmp     word ptr [bp+0ah], 0
        jg      br_4134D
        jmp     br_41414
br_4134D:
        mov     ax, word ptr [bp-0ah]
        mov     dx, word ptr [bp-8]
        add     ax, 7deh
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-4], dx
        mov     ax, word ptr [bp+0ch]
        mov     dx, word ptr [bp+0eh]
        mov     si, ax
        mov     word ptr [bp-10h], dx
        mov     di, word ptr [bp+6]
loop_4136A:
        mov     ax, word ptr [bp+8]
        mov     word ptr [bp-24h], di
        mov     word ptr [bp-22h], ax
        mov     es, word ptr [bp-10h]
        mov     cx, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     word ptr [bp-1ch], cx
        mov     word ptr [bp-1ah], dx
        mov     cx, word ptr [bp-14h]
        sub     dx, dx
        add     cx, word ptr es:[si+4]
        adc     dx, word ptr es:[si+6]
        mov     word ptr [bp-18h], cx
        mov     word ptr [bp-16h], dx
        mov     es, ax
        cmp     word ptr es:[di+30h], dx
        jg      br_413B6
        jl      br_413A6
        cmp     word ptr es:[di+2eh], cx
        jae     br_413B6
br_413A6:
        mov     es, ax
        mov     ax, word ptr es:[di+2eh]
        mov     dx, word ptr es:[di+30h]
        mov     word ptr [bp-18h], ax
        mov     word ptr [bp-16h], dx
br_413B6:
        push    0
        push    0
        push    ds
        push    C1_W_08FCB
        nop
        push    cs
        call    EP_FAR_484D6_OFF+C1_CSBASE
        add     sp, 8
        push    dx
        push    ax
        lea     ax, [bp-24h]
        push    ss
        push    ax
        nop
        push    cs
        call    far_40B9A
        add     sp, 8
        mov     word ptr [bp-0eh], ax
        mov     word ptr [bp-0ch], dx
        or      dx, ax
        jne     br_41414
        les     bx, [bp-20h]
        mov     byte ptr es:[bx+36h], 0
        mov     ax, word ptr [bp-8]
        or      ax, word ptr [bp-0ah]
        je      br_413FF
        mov     ax, word ptr [bp-20h]
        mov     dx, word ptr [bp-1eh]
        les     bx, [bp-6]
        mov     word ptr es:[bx], ax
        mov     word ptr es:[bx+2], dx
br_413FF:
        add     word ptr [bp-6], 4
        add     si, 4
        mov     ax, word ptr [bp+0ah]
        inc     word ptr [bp-2]
        cmp     word ptr [bp-2], ax
        jge     br_41414
        jmp     loop_4136A
br_41414:
        mov     ax, word ptr [bp-0eh]
        mov     dx, word ptr [bp-0ch]
        pop     si
        pop     di
        leave
        retf
alloc_destination_sample:               ; time stretch destination
        enter   8, 0
        push    di
        push    si
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+25h]
        sub     ah, ah
        inc     ax
        push    ax
        push    word ptr [bp+14h]
        push    word ptr [bp+12h]
        nop
        push    cs
        call    size_para_round_mul
        add     sp, 6
        push    dx
        push    ax
        lea     ax, [bp-8]
        push    ss
        push    ax
        nop
        push    cs
        call    far_41518
        add     sp, 8
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_41466
        jmp     br_4150D
br_41466:
        les     bx, [bp-8]
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        add     ax, 12h
        push    ds
        lea     di, [bx+12h]
        mov     si, ax
        mov     ds, dx
        mov     cx, 14h
        rep movsw
        pop     ds
        mov     ax, word ptr [bp+10h]
        or      ax, word ptr [bp+0eh]
        je      br_414B2
        mov     bx, word ptr [bp-8]
        mov     cx, es
        add     bx, 12h
        push    ds
        mov     si, bx
        mov     ds, cx
        les     di, [bp+0eh]
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
br_414B2:
        les     bx, [bp-8]
        sub     ax, ax
        mov     word ptr es:[bx+28h], ax
        mov     word ptr es:[bx+26h], ax
        mov     ax, word ptr [bp+12h]
        mov     dx, word ptr [bp+14h]
        les     bx, [bp-8]
        mov     word ptr es:[bx+2ah], ax
        mov     word ptr es:[bx+2ch], dx
        les     bx, [bp-8]
        mov     word ptr es:[bx+2eh], ax
        mov     word ptr es:[bx+30h], dx
        les     bx, [bp-8]
        mov     word ptr es:[bx+32h], ax
        mov     word ptr es:[bx+34h], dx
        push    0
        push    dx
        push    ax
        callf   EP_ADDR_CALC_SEGMENT_SEG:EP_ADDR_CALC_SEGMENT_OFF
        add     sp, 6
        les     bx, [bp-8]
        mov     word ptr es:[bx+3ah], ax
        mov     word ptr es:[bx+3ch], dx
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        les     bx, [bp+6]
        mov     word ptr es:[bx], ax
        mov     word ptr es:[bx+2], dx
br_4150D:
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        pop     si
        pop     di
        leave
        retf
        db      00h
far_41518:
        enter   4, 0
        lea     ax, [bp-4]
        push    ss
        push    ax
        nop
        push    cs
        call    sound_record_alloc
        add     sp, 4
        or      ax, ax
        je      br_4159A
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        les     bx, [bp-4]
        mov     word ptr es:[bx+0eh], ax
        mov     word ptr es:[bx+10h], dx
        nop
        push    cs
        call    smem_free_bytes
        or      dx, dx
        jge     br_4155E
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    sound_list_unlink
        add     sp, 4
        mov     ax, (C1_BASE+L_415CA-C1_SEG*16)
        mov     dx, C1_SEG
        leave
        retf
        db      90h
br_4155E:
        les     bx, [bp-4]
        mov     ax, word ptr es:[bx+0ah]
        mov     dx, word ptr es:[bx+C1_TBL_0000C]
        add     ax, word ptr es:[bx+0eh]
        adc     dx, word ptr es:[bx+10h]
        cmp     dx, word ptr [C2_W_SMEM_SIZE_HI]
        jl      br_41584
        jg      br_4157F
        cmp     ax, word ptr [C0_W_SMEM_SIZE]
        jbe     br_41584
br_4157F:
        nop
        push    cs
        call    smem_compact
br_41584:
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        les     bx, [bp+6]
        mov     word ptr es:[bx], ax
        mov     word ptr es:[bx+2], dx
        xor     ax, ax
        cwd
        leave
        retf
        db      90h
br_4159A:
        mov     ax, (C1_BASE+msg_sound_dir_full-C1_SEG*16)
        mov     dx, C1_SEG
        leave
        retf
L_415A2:
        db      "Name already used"
        db      00h
L_415B4:
        db      "Function is disabled"
        db      00h, 00h
L_415CA:
        db      "not enough memory"
        db      00h
L_415DC:
        db      "Can't edit ROM sound"
        db      00h, 00h
msg_sound_dir_full:
        db      "Sound directory full(256max)"
        db      00h, 00h
voice_engine_init:
        push    di
        push    si
        push    0
        push    0
        callf   EP_EVENT_CB_SET_MAIN_SEG:EP_EVENT_CB_SET_MAIN_OFF
        add     sp, 4
        push    0
        push    0
        callf   EP_EVENT_CB_SET_AUX_SEG:EP_EVENT_CB_SET_AUX_OFF
        add     sp, 4
        push    EP_EVENT_CB_DISPATCH_SEG
        push    EP_EVENT_CB_DISPATCH_OFF
        push    35h
        callf   EP_IVT_SET_VECTOR_SEG:EP_IVT_SET_VECTOR_OFF
        add     sp, 6
        push    EP_FS_OPEN_SEG
        push    EP_L_4144E_OFF
        push    4eh
        callf   EP_IVT_SET_VECTOR_SEG:EP_IVT_SET_VECTOR_OFF
        add     sp, 6
        mov     si, VOICE_TABLE+1
        mov     di, 20h
loop_41650:
        mov     byte ptr [si], 0ffh
        add     si, 14h
        dec     di
        jne     loop_41650
        xor     ax, ax
        mov     cx, 80h
        mov     di, 8ec4h
        push    ds
        pop     es
        rep stosw
        mov     cx, 10h
        mov     di, 0d7feh
        rep stosw
        cmp     byte ptr [C2_B_FX_BOARD_PRESENT], al
        je      br_4167D
        or      byte ptr [C1_B_0D7FE], 1
        or      byte ptr [C1_B_0D80E], 1
br_4167D:
        pop     si
        pop     di
        retf
L_41680:
        enter   10h, 0
        push    di
        push    si
        inc     byte ptr [C1_B_004D6]
        xor     ax, ax
        mov     cx, 20h
        mov     di, C1_W_0817A
        push    ds
        pop     es
        rep stosw
        mov     byte ptr [bp-5], al
        mov     byte ptr [bp-4], 0ffh
        mov     byte ptr [bp-1], 20h
loop_416A1:
        inc     byte ptr [C1_B_004D6]
        cmp     byte ptr [C1_B_004D6], 20h
        jl      br_416B1
        mov     byte ptr [C1_B_004D6], 0
br_416B1:
        mov     al, byte ptr [C1_B_004D6]
        cbw
        mov     bx, ax
        mov     word ptr [bp-8], ax
        cmp     byte ptr [bx+C1_B_0D7FE], 0
        jne     br_41709
        add     bx, ax
        mov     ax, word ptr [bx+C0_TBL_VOICE_TIMER]
        mov     word ptr [bx+C1_TBL_081BA], ax
        or      ax, ax
        jne     br_416D2
        jmp     br_417A0
br_416D2:
        mov     al, byte ptr [bp+6]
        cbw
        imul    bx, word ptr [bp-8], 14h
        mov     cl, byte ptr [bx+VOICE_TABLE]
        sub     ch, ch
        cmp     cx, ax
        jne     br_41709
        mov     al, byte ptr [bx+VOICE_TABLE+1]
        sub     al, 23h
        mov     byte ptr [bp-2], al
        cbw
        mov     bx, ax
        inc     byte ptr [bx+C1_TBL_0817A]
        mov     al, byte ptr [bx+C1_TBL_0817A]
        mov     byte ptr [bp-3], al
        cmp     al, byte ptr [bp-5]
        jle     br_41709
        mov     byte ptr [bp-5], al
        mov     al, byte ptr [bp-2]
        mov     byte ptr [bp-4], al
br_41709:
        dec     byte ptr [bp-1]
        jne     loop_416A1
        mov     byte ptr [bp-1], 20h
loop_41712:
        mov     al, byte ptr [C1_B_004D6]
        cbw
        mov     bx, ax
        cmp     byte ptr [bx+C1_B_0D7FE], 0
        je      br_41734
        inc     byte ptr [C1_B_004D6]
        cmp     byte ptr [C1_B_004D6], 20h
        jl      br_4172F
        mov     byte ptr [C1_B_004D6], 0
br_4172F:
        dec     byte ptr [bp-1]
        jne     loop_41712
br_41734:
        mov     si, 0ffffh
        mov     al, byte ptr [C1_B_004D6]
        mov     byte ptr [bp-3], al
        mov     al, byte ptr [bp+8]
        cbw
        mov     bx, ax
        cmp     byte ptr [bx+C1_TBL_08157], 1
        jle     br_417A8
        mov     byte ptr [bp-1], 1fh
loop_4174E:
        mov     al, byte ptr [bp-1]
        cbw
        mov     bx, ax
        mov     word ptr [bp-0ch], ax
        cmp     byte ptr [bx+C1_B_0D7FE], 0
        jne     br_41790
        mov     al, byte ptr [bp+6]
        cbw
        imul    bx, bx, 14h
        sub     ch, ch
        mov     cl, byte ptr [bx+VOICE_TABLE]
        cmp     cx, ax
        jne     br_41790
        mov     al, byte ptr [bp+8]
        cbw
        mov     cl, byte ptr [bx+VOICE_TABLE+1]
        cmp     cx, ax
        jne     br_41790
        mov     bx, word ptr [bp-0ch]
        add     bx, bx
        mov     ax, word ptr [bx+C1_TBL_081BA]
        cmp     ax, si
        jae     br_41790
        mov     si, ax
        mov     al, byte ptr [bp-1]
        mov     byte ptr [bp-3], al
br_41790:
        mov     al, byte ptr [bp-1]
        mov     byte ptr [bp-2], al
        dec     byte ptr [bp-1]
        or      al, al
        jne     loop_4174E
        jmp     br_4183B
br_417A0:
        mov     al, byte ptr [C1_B_004D6]
        pop     si
        pop     di
resume_417A5:
        leave
        retf
        db      90h
br_417A8:
        cmp     byte ptr [bp-5], 3
        jl      br_41808
        add     byte ptr [bp-4], 23h
        mov     byte ptr [bp-1], 1fh
loop_417B6:
        mov     al, byte ptr [bp-1]
        cbw
        mov     bx, ax
        mov     word ptr [bp-0ch], ax
        cmp     byte ptr [bx+C1_B_0D7FE], 0
        jne     br_417F8
        mov     al, byte ptr [bp+6]
        cbw
        imul    bx, bx, 14h
        sub     ch, ch
        mov     cl, byte ptr [bx+VOICE_TABLE]
        cmp     cx, ax
        jne     br_417F8
        mov     al, byte ptr [bp-4]
        cbw
        mov     cl, byte ptr [bx+VOICE_TABLE+1]
        cmp     cx, ax
        jne     br_417F8
        mov     bx, word ptr [bp-0ch]
        add     bx, bx
        mov     ax, word ptr [bx+C1_TBL_081BA]
        cmp     ax, si
        jae     br_417F8
        mov     si, ax
        mov     al, byte ptr [bp-1]
        mov     byte ptr [bp-3], al
br_417F8:
        mov     al, byte ptr [bp-1]
        mov     byte ptr [bp-2], al
        dec     byte ptr [bp-1]
        or      al, al
        jne     loop_417B6
        jmp     br_4183B
        db      90h
br_41808:
        mov     byte ptr [bp-1], 1fh
loop_4180C:
        mov     al, byte ptr [bp-1]
        cbw
        mov     bx, ax
        mov     word ptr [bp-0ch], ax
        cmp     byte ptr [bx+C1_B_0D7FE], 0
        jne     br_4182E
        add     bx, ax
        mov     ax, word ptr [bx+C1_TBL_081BA]
        cmp     ax, si
        jae     br_4182E
        mov     si, ax
        mov     al, byte ptr [bp-1]
        mov     byte ptr [bp-3], al
br_4182E:
        mov     al, byte ptr [bp-1]
        mov     byte ptr [bp-2], al
        dec     byte ptr [bp-1]
        or      al, al
        jne     loop_4180C
br_4183B:
        mov     al, byte ptr [bp-3]
        mov     byte ptr [C1_B_004D6], al
resume_41841:
        pop     si
        pop     di
        leave
        retf
        db      00h
L_41846:
        enter   8, 0
        push    si
        les     bx, [bp+6]
        mov     ax, word ptr es:[bx+18h]
        mov     dx, word ptr es:[bx+1ah]
        mov     cx, ax
        mov     si, dx
        shr     dx, 4
        sar     si, 1
        rcr     cx, 1
        sar     si, 1
        rcr     cx, 1
        sar     si, 1
        rcr     cx, 1
        sar     si, 1
        rcr     cx, 1
        shl     ax, 0ch
        mov     si, ax
        mov     al, byte ptr es:[bx]
        sub     ah, ah
        mov     word ptr [bp-8], ax
        out     80h, ax
        mov     ax, dx
        or      ah, 1
        out     86h, ax
        mov     ax, cx
        out     84h, ax
        mov     ax, si
        out     82h, ax
        mov     ax, word ptr [bp-8]
        or      ah, 1
        out     80h, ax
        mov     ax, word ptr es:[bx+10h]
        out     82h, ax
        cmp     byte ptr es:[bx+7], 0
        jne     br_418A3
        jmp     br_41940
br_418A3:
        mov     ax, word ptr es:[bx+1ch]
        mov     dx, word ptr es:[bx+1eh]
        mov     cx, ax
        mov     si, dx
        shr     dx, 4
        sar     si, 1
        rcr     cx, 1
        sar     si, 1
        rcr     cx, 1
        sar     si, 1
        rcr     cx, 1
        sar     si, 1
        rcr     cx, 1
        mov     ax, cx
        out     84h, ax
        cmp     word ptr es:[bx+24h], 0
        je      br_418F4
        cmp     byte ptr [bp+0ah], 0
        je      br_418DA
        mov     ax, dx
        or      al, 10h
        jmp     br_418DC
        db      90h
br_418DA:
        mov     ax, dx
br_418DC:
        out     86h, ax
        mov     ax, word ptr [bp-8]
        or      ah, 2
        out     80h, ax
        mov     ax, word ptr es:[bx+24h]
        out     84h, ax
        mov     ax, word ptr es:[bx+26h]
        neg     ax
        jmp     br_41956
br_418F4:
        cmp     byte ptr [bp+0ah], 0
        je      br_41902
        mov     ax, dx
        or      ax, 110h
        jmp     br_41907
        db      90h
br_41902:
        mov     ax, dx
        or      ah, 1
br_41907:
        out     86h, ax
        mov     ax, word ptr es:[bx+20h]
        mov     dx, word ptr es:[bx+22h]
        mov     cx, ax
        mov     bx, dx
        shr     dx, 4
        sar     bx, 1
        rcr     cx, 1
        sar     bx, 1
        rcr     cx, 1
        sar     bx, 1
        rcr     cx, 1
        sar     bx, 1
        rcr     cx, 1
        shl     ax, 0ch
        mov     bx, ax
xl_dma_ch0_full_program_shared:
        mov     ax, word ptr [bp-8]
        or      ah, 2
        out     80h, ax
        mov     ax, cx
        out     84h, ax
        mov     ax, dx
        or      ax, bx
        jmp     br_41956
        db      90h
br_41940:
        mov     ax, 0ffffh
        out     84h, ax
        mov     ax, 0fh
        out     86h, ax
        mov     ax, word ptr [bp-8]
        or      ah, 2
        out     80h, ax
        xor     ax, ax
        out     84h, ax
br_41956:
        out     82h, ax
        mov     ax, word ptr [bp-8]
        or      ah, 3
        out     80h, ax
        xor     ax, ax
        out     8ch, ax
        mov     ax, word ptr [bp-8]
        or      ah, 4
        out     80h, ax
        mov     bx, word ptr [bp+6]
        mov     ax, word ptr es:[bx+14h]
        out     82h, ax
        mov     ax, word ptr es:[bx+12h]
        or      ah, 80h
        out     84h, ax
        mov     ax, word ptr [bp-8]
        or      ah, 5
        out     80h, ax
        mov     ax, word ptr es:[bx+28h]
        out     82h, ax
        mov     ax, word ptr es:[bx+2ah]
        out     84h, ax
        mov     ax, word ptr [bp-8]
        or      ah, 6
        out     80h, ax
        mov     ax, word ptr es:[bx+2eh]
        out     82h, ax
        mov     ax, word ptr es:[bx+2ch]
        out     84h, ax
        cmp     byte ptr es:[bx+C1_TBL_0000C], 1
        jl      br_419BE
        cmp     byte ptr es:[bx+C1_TBL_0000C], 8
        jg      br_419BE
        sub     cl, cl
        mov     ch, byte ptr es:[bx+0dh]
        neg     cx
        jmp     br_419C0
br_419BE:
        xor     cx, cx
br_419C0:
        mov     ax, word ptr [bp-8]
        or      ah, 7
        out     80h, ax
        mov     al, byte ptr es:[bx+C1_TBL_0000C]
        cbw
        mov     si, ax
        mov     al, byte ptr [si+C1_TBL_00488]
        cbw
        or      ax, cx
        out     84h, ax
        cmp     byte ptr es:[bx+0eh], 1
        je      br_419E6
        cmp     byte ptr es:[bx+0eh], 2
        jne     br_41A01
br_419E6:
        mov     al, byte ptr es:[bx+0eh]
        cbw
        mov     bx, ax
        cmp     byte ptr [bx+C1_TBL_06475], 0
        jne     br_41A01
        mov     bx, word ptr [bp+6]
        xor     al, al
        mov     byte ptr es:[bx+0bh], al
        mov     byte ptr es:[bx+0ah], al
br_41A01:
        les     bx, [bp+6]
        sub     al, al
        mov     ah, byte ptr es:[bx+0bh]
        mov     cl, byte ptr es:[bx+0ah]
        sub     ch, ch
        or      ax, cx
        out     82h, ax
        cmp     byte ptr es:[bx+0eh], 1
        jl      br_41A34
        cmp     byte ptr es:[bx+0eh], 4
        jg      br_41A34
        mov     ah, byte ptr es:[bx+0eh]
        dec     ah
        sub     al, al
        mov     si, ax
        mov     ah, byte ptr es:[bx+0fh]
        mov     cx, ax
        jmp     br_41A39
br_41A34:
        mov     si, 200h
        xor     cx, cx
br_41A39:
        push    cx
        sub     ah, ah
        mov     al, byte ptr es:[bx]
        or      ax, si
        push    ax
        callf   EP_ASIC_REG1_WRITE_SEG:EP_ASIC_REG1_WRITE_OFF
        add     sp, 4
        pop     si
        leave
        retf
        db      00h
L_4144E:
        pusha
        push    ds
        push    es
        mov     bp, sp
        push    ds
        mov     ax, DS_SEG
        mov     ds, ax
        cld
        cmp     byte ptr [bp+0ch], 0
        jne     isr_41A6A
        push    10h
        nop
        push    cs
        call    voice_buf_helper_2
        jmp     isr_41A71
        db      90h
isr_41A6A:
        push    10h
        nop
        push    cs
        call    voice_buf_helper_1
isr_41A71:
        mov     sp, bp
        pop     es
        pop     ds
        popa
        iret
        db      00h
voice_buf_helper_1:
        push    bp
        mov     bp, sp
        push    si
        cmp     word ptr [bp+6], 10h
        jne     br_41A9A
        xor     si, si
loop_41A84:
        push    si
        nop
        push    cs
        call    voice_release_full
        add     sp, 2
        or      byte ptr [si+C1_B_0D7FE], 2
        add     si, 2
        cmp     si, 20h
        jl      loop_41A84
br_41A9A:
        pop     si
        leave
        retf
        db      00h
voice_buf_helper_2:
        push    bp
        mov     bp, sp
        cmp     word ptr [bp+6], 10h
        jne     br_41AB6
        xor     bx, bx
loop_41AA9:
        and     byte ptr [bx+C1_B_0D7FE], 0fdh
        add     bx, 2
        cmp     bx, 20h
        jl      loop_41AA9
br_41AB6:
        leave
        retf
sample_error_handler:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp+6]
        mov     cx, ax
        mov     bx, 0ah
        sub     ax, word ptr [C1_W_004D8]
        xor     dx, dx
        div     bx
        or      ax, ax
        je      br_41ADB
        sub     cx, dx
        mov     word ptr [C1_W_004D8], cx
        push    ax
        nop
        push    cs
        call    voice_timer_tick
br_41ADB:
        callf   EP_L_37847_SEG:EP_L_37847_OFF
        leave
        retf
voice_timer_tick:
        push    bp
        mov     bp, sp
        push    di
        push    si
        xor     di, di
        mov     si, 8ec4h
loop_41AEC:
        mov     ax, word ptr [si]
        cmp     ax, 0
        je      br_41B07
        cmp     ax, 0ffffh
        je      br_41B07
        sub     ax, word ptr [bp+6]
        ja      br_41B05
        push    di
        nop
        push    cs
        call    voice_timer_expire
        xor     ax, ax
br_41B05:
        mov     word ptr [si], ax
br_41B07:
        add     si, 2
        inc     di
        cmp     di, 80h
        jl      loop_41AEC
        pop     si
        pop     di
        leave
        retf    2
        db      00h
voice_timer_expire:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+6]
        cmp     si, 20h
        jge     br_41B3E
        mov     ax, si
        or      ah, 4
        out     80h, ax
        imul    bx, si, 14h
        mov     ax, word ptr [bx+C1_TBL_09616]
        out     82h, ax
        mov     ax, 8000h
loop_41B37:
        out     84h, ax
        pop     si
        leave
        retf    2
br_41B3E:
        cmp     si, 40h
        jge     br_41B4E
        lea     ax, [si-20h]
        push    ax
        nop
        push    cs
        call    voice_release
        jmp     br_41B75
br_41B4E:
        cmp     si, 60h
        jge     br_41B6C
        sub     si, 40h
        mov     ax, si
        or      ah, 6
        out     80h, ax
        imul    bx, si, 14h
        mov     ax, word ptr [bx+C1_TBL_09618]
        out     82h, ax
        mov     ax, word ptr [bx+C1_TBL_0961A]
        jmp     loop_41B37
br_41B6C:
        lea     ax, [si-60h]
        push    ax
        nop
        push    cs
        call    voice_release_full
br_41B75:
        add     sp, 2
        pop     si
        leave
        retf    2
        db      00h
voice_release_all:
        push    si
        xor     si, si
loop_41B81:
        push    si
        nop
        push    cs
        call    voice_release_full
        add     sp, 2
        inc     si
        cmp     si, 20h
        jb      loop_41B81
        pop     si
        retf
voice_release_full:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+6]
        push    si
        nop
        push    cs
        call    voice_release
        add     sp, 2
        cmp     byte ptr [si+C1_B_0D7FE], 0
        jne     br_41BC2
        mov     bx, si
        mov     word ptr [bx+si+C0_TBL_08F84], 0
        mov     ax, si
        or      ah, 6
        out     80h, ax
        mov     ax, 0bb8h
        out     82h, ax
        mov     ax, 7ff0h
        out     84h, ax
br_41BC2:
        pop     si
        leave
        retf
        db      00h
voice_release:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+6]
resume_41BCD:
        cmp     byte ptr [si+C1_B_0D7FE], 0
        jne     br_41C04
        xor     ax, ax
        mov     bx, si
        add     bx, si
        mov     word ptr [bx+C0_TBL_08F44], ax
        mov     word ptr [bx+C0_TBL_VOICE_TIMER], ax
        mov     word ptr [bx+C0_TBL_VOICE_HOLD], ax
        mov     word ptr [bx+C0_TBL_08F84], 3
        imul    bx, si, 14h
        mov     byte ptr [bx+VOICE_TABLE+1], 0ffh
        mov     ax, si
        or      ah, 4
        out     80h, ax
        mov     ax, 0f448h
        out     82h, ax
        xor     ax, ax
        out     84h, ax
br_41C04:
        pop     si
        leave
        retf
        db      00h
far_41C08:
        enter   4ah, 0
        push    di
        push    si
        mov     di, word ptr [bp+6]
        mov     ax, word ptr [bp+8]
        or      ax, di
        jne     br_41C1B
        jmp     br_41EB7
br_41C1B:
        mov     ax, word ptr [bp+8]
        mov     cx, ds
        cmp     di, C1_TBL_SOUNDS_END
        jne     br_41C2D
        cmp     ax, cx
        jne     br_41C2D
        jmp     br_41EB7
br_41C2D:
        cmp     word ptr [bp+0ah], 0
        jne     br_41C36
        jmp     br_41E9C
br_41C36:
        mov     bx, di
        mov     es, ax
        add     bx, 12h
        mov     si, bx
        mov     word ptr [bp-2], es
        mov     ax, word ptr es:[bx+1ch]
        mov     dx, word ptr es:[bx+1eh]
        cmp     word ptr es:[bx+18h], ax
        jne     br_41C5A
        cmp     word ptr es:[bx+1ah], dx
        jne     br_41C5A
        mov     al, 1
        jmp     br_41C5C
br_41C5A:
        xor     al, al
br_41C5C:
        mov     byte ptr [bp-0bh], al
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+22h]
        or      ax, word ptr es:[si+20h]
        jne     br_41C72
        mov     byte ptr [bp-43h], 0
        jmp     br_41C79
br_41C72:
        mov     al, byte ptr es:[si+24h]
        mov     byte ptr [bp-43h], al
br_41C79:
        push    0
        push    1b9h
        mov     ax, word ptr es:[si+18h]
        mov     dx, word ptr es:[si+1ah]
        sub     ax, word ptr es:[si+14h]
        sbb     dx, word ptr es:[si+16h]
        mov     cx, ax
        mov     bx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, cx
        adc     dx, bx
        add     ax, ax
        adc     dx, dx
        push    dx
        push    ax
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        cmp     byte ptr [bp-43h], 0
        jne     br_41CBD
        sub     word ptr [bp-8], 1eh
        sbb     word ptr [bp-6], 0
br_41CBD:
        cmp     word ptr [bp-6], 0
        jge     br_41CC6
        jmp     br_41EB7
br_41CC6:
        jg      br_41CD1
        cmp     word ptr [bp-8], 0
        jne     br_41CD1
        jmp     br_41EB7
br_41CD1:
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+18h]
        mov     dx, word ptr es:[si+1ah]
        cmp     word ptr es:[si+16h], dx
        jle     br_41CE5
        jmp     br_41EB7
br_41CE5:
        jl      br_41CF0
        cmp     word ptr es:[si+14h], ax
        jbe     br_41CF0
        jmp     br_41EB7
br_41CF0:
        mov     al, 0e6h
        mul     byte ptr es:[si+11h]
        mov     word ptr [bp-0ah], ax
        or      ax, ax
        jne     br_41D00
        jmp     br_41EB7
br_41D00:
        push    0
        push    0c671h
        push    ax
        push    0
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     word ptr [bp-0ah], ax
        cmp     ax, 7fffh
        jbe     br_41D1A
        mov     word ptr [bp-0ah], 7fffh
br_41D1A:
        mov     al, 0ffh
        mov     byte ptr [bp-48h], al
        mov     byte ptr [bp-47h], al
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[di+0ah]
        mov     dx, word ptr es:[di+C1_TBL_0000C]
        mov     es, word ptr [bp-2]
        add     ax, word ptr es:[si+14h]
        adc     dx, word ptr es:[si+16h]
        mov     word ptr [bp-32h], ax
        mov     word ptr [bp-30h], dx
        mov     al, byte ptr es:[si+12h]
        cbw
        mov     bx, ax
        add     bx, ax
        mov     ax, word ptr [bx+TBL_PITCH_RATIO]
        mov     word ptr [bp-3ah], ax
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[di+0ah]
        mov     dx, word ptr es:[di+C1_TBL_0000C]
        mov     es, word ptr [bp-2]
        add     ax, word ptr es:[si+18h]
        adc     dx, word ptr es:[si+1ah]
        mov     word ptr [bp-2eh], ax
        mov     word ptr [bp-2ch], dx
        sub     ax, word ptr es:[si+20h]
        sbb     dx, word ptr es:[si+22h]
        mov     word ptr [bp-2ah], ax
        mov     word ptr [bp-28h], dx
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[di+3ah]
        mov     dx, word ptr es:[di+3ch]
        mov     word ptr [bp-26h], ax
        mov     word ptr [bp-24h], dx
        mov     ax, word ptr [bp-0ah]
        mov     word ptr [bp-38h], ax
        mov     word ptr [bp-36h], ax
        mov     word ptr [bp-22h], 0ffffh
        mov     word ptr [bp-20h], 3fffh
        mov     ax, 7ff0h
        mov     word ptr [bp-1eh], ax
        mov     word ptr [bp-1ah], ax
        xor     ax, ax
        mov     word ptr [bp-1ch], ax
        mov     word ptr [bp-18h], ax
        mov     al, 80h
        mov     byte ptr [bp-40h], al
        mov     byte ptr [bp-3fh], al
        mov     byte ptr [bp-42h], 2
        xor     al, al
        mov     byte ptr [bp-3eh], al
        mov     byte ptr [bp-3ch], al
        mov     byte ptr [bp-41h], al
        push    0
        push    word ptr [bp-3ah]
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        shr     dx, 1
        rcr     ax, 1
        rcr     dx, 1
        rcr     ax, 1
        rcr     dx, 1
        rcr     ax, 1
        rcr     dx, 1
        rcr     ax, 1
        rcr     dx, 1
        xchg    dx, ax
        and     ax, 0f000h
        push    dx
        push    ax
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     word ptr [bp-16h], ax
        mov     word ptr [bp-14h], dx
        xor     ax, ax
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], ax
        mov     word ptr [bp-34h], 0ff00h
        mov     byte ptr [bp-4ah], 15h
        mov     es, word ptr [bp-2]
        cmp     byte ptr es:[si+13h], al
        je      br_41E7E
        mov     byte ptr [bp-40h], al
        mov     al, byte ptr [bp-0bh]
        push    ax
        push    0
        push    0
        lea     ax, [bp-4ah]
        push    ss
        push    ax
        callf   EP_VOICE_START_SEG:EP_VOICE_START_OFF
        add     sp, 0ah
        mov     byte ptr [bp-40h], 80h
        mov     byte ptr [bp-3fh], 0
        push    0
        push    2
        mov     es, word ptr [bp+8]
        push    word ptr es:[di+10h]
        push    word ptr es:[di+0eh]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        add     word ptr [bp-32h], ax
        adc     word ptr [bp-30h], dx
        push    0
        push    2
        mov     es, word ptr [bp+8]
        push    word ptr es:[di+10h]
        push    word ptr es:[di+0eh]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        add     word ptr [bp-2eh], ax
        adc     word ptr [bp-2ch], dx
        push    0
        push    2
        mov     es, word ptr [bp+8]
        push    word ptr es:[di+10h]
        push    word ptr es:[di+0eh]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        add     word ptr [bp-2ah], ax
        adc     word ptr [bp-28h], dx
        mov     byte ptr [bp-4ah], 17h
br_41E7E:
        mov     al, byte ptr [bp-0bh]
        push    ax
        push    0
        push    0
        lea     ax, [bp-4ah]
        push    ss
        push    ax
        callf   EP_VOICE_START_SEG:EP_VOICE_START_OFF
        add     sp, 0ah
        nop
        push    cs
        call    dma_status_rearm
        pop     si
        pop     di
        leave
        retf
br_41E9C:
        cmp     byte ptr [C1_B_097B1], 0
        je      br_41EB7
        push    15h
        nop
        push    cs
        call    voice_release_full
        add     sp, 2
        push    17h
        nop
        push    cs
        call    voice_release_full
        add     sp, 2
br_41EB7:
        pop     si
        pop     di
        leave
        retf
        db      00h
L_41EBC:
        enter   44h, 0
        push    di
        push    si
        mov     si, word ptr [bp+6]
        mov     ax, word ptr [bp+8]
        or      ax, si
        jne     br_41ECF
        jmp     br_4208D
br_41ECF:
        mov     ax, word ptr [bp+8]
        mov     cx, ds
        cmp     si, C1_TBL_SOUNDS_END
        jne     br_41EE1
        cmp     ax, cx
        jne     br_41EE1
        jmp     br_4208D
br_41EE1:
        cmp     word ptr [bp+12h], 0
        jne     br_41EEA
        jmp     br_42088
br_41EEA:
        mov     ax, si
        mov     dx, word ptr [bp+8]
        add     ax, 12h
        mov     di, ax
        mov     word ptr [bp-4], dx
        push    0
        push    1b9h
        mov     ax, word ptr [bp+0eh]
        mov     dx, word ptr [bp+10h]
        mov     cx, ax
        mov     bx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, cx
        adc     dx, bx
        add     ax, ax
        adc     dx, dx
        push    dx
        push    ax
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        sub     ax, 1eh
        sbb     dx, 0
        mov     word ptr [bp+0eh], ax
        mov     word ptr [bp+10h], dx
        or      dx, dx
        jge     br_41F30
        jmp     br_4208D
br_41F30:
        jg      br_41F39
        or      ax, ax
        jne     br_41F39
        jmp     br_4208D
br_41F39:
        mov     al, 0e6h
        mov     es, word ptr [bp-4]
        mul     byte ptr es:[di+11h]
        mov     word ptr [bp-2], ax
        or      ax, ax
        jne     br_41F4C
        jmp     br_4208D
br_41F4C:
        push    0
        push    0c671h
        push    ax
        push    0
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     word ptr [bp-2], ax
        cmp     ax, 7fffh
        jbe     br_41F66
        mov     word ptr [bp-2], 7fffh
br_41F66:
        mov     al, 0ffh
        mov     byte ptr [bp-42h], al
        mov     byte ptr [bp-41h], al
        mov     byte ptr [bp-44h], 15h
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[si+0ah]
        mov     dx, word ptr es:[si+C1_TBL_0000C]
        add     ax, word ptr [bp+0ah]
        adc     dx, word ptr [bp+0ch]
        mov     word ptr [bp-2ch], ax
        mov     word ptr [bp-2ah], dx
        mov     es, word ptr [bp-4]
        mov     al, byte ptr es:[di+12h]
        cbw
        mov     bx, ax
        add     bx, ax
        mov     ax, word ptr [bx+TBL_PITCH_RATIO]
        mov     word ptr [bp-34h], ax
        mov     ax, word ptr [bp-2]
        mov     word ptr [bp-32h], ax
        mov     word ptr [bp-30h], ax
        mov     word ptr [bp-1ch], 0ffffh
        mov     word ptr [bp-1ah], 3fffh
        mov     ax, 7ff0h
        mov     word ptr [bp-18h], ax
        mov     word ptr [bp-14h], ax
        xor     ax, ax
        mov     word ptr [bp-16h], ax
        mov     word ptr [bp-12h], ax
        mov     al, 80h
        mov     byte ptr [bp-3ah], al
        mov     byte ptr [bp-39h], al
        mov     byte ptr [bp-3ch], 2
        xor     al, al
        mov     byte ptr [bp-3dh], al
        mov     byte ptr [bp-38h], al
        mov     byte ptr [bp-36h], al
        mov     byte ptr [bp-3bh], al
        push    0
        push    word ptr [bp-34h]
        mov     ax, word ptr [bp+0eh]
        mov     dx, word ptr [bp+10h]
        shr     dx, 1
        rcr     ax, 1
        rcr     dx, 1
        rcr     ax, 1
        rcr     dx, 1
        rcr     ax, 1
        rcr     dx, 1
        rcr     ax, 1
        rcr     dx, 1
        xchg    dx, ax
        and     ax, 0f000h
        push    dx
        push    ax
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        xor     ax, ax
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-2eh], 0ff00h
        mov     es, word ptr [bp-4]
        cmp     byte ptr es:[di+13h], al
        je      br_4206C
        mov     byte ptr [bp-3ah], al
        push    ax
        push    ax
        push    ax
        lea     ax, [bp-44h]
        push    ss
        push    ax
        callf   EP_VOICE_START_SEG:EP_VOICE_START_OFF
        add     sp, 0ah
        mov     byte ptr [bp-44h], 17h
        mov     byte ptr [bp-3ah], 80h
        mov     byte ptr [bp-39h], 0
        push    0
        push    2
        mov     es, word ptr [bp+8]
        push    word ptr es:[si+10h]
        push    word ptr es:[si+0eh]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        add     word ptr [bp-2ch], ax
        adc     word ptr [bp-2ah], dx
        add     word ptr [bp-28h], ax
        adc     word ptr [bp-26h], dx
        add     word ptr [bp-24h], ax
        adc     word ptr [bp-22h], dx
br_4206C:
        push    0
        push    0
        push    0
        lea     ax, [bp-44h]
        push    ss
        push    ax
        callf   EP_VOICE_START_SEG:EP_VOICE_START_OFF
        add     sp, 0ah
        nop
        push    cs
        call    dma_status_rearm
        pop     si
        pop     di
        leave
        retf
br_42088:
        nop
        push    cs
        call    voice_release_all
br_4208D:
        pop     si
        pop     di
        leave
        retf
        db      00h
midi_note_process:
        enter   3eh, 0
        push    si
        mov     al, byte ptr [bp+8]
        mul     byte ptr [bp+9]
        mov     si, ax
        add     si, ax
        jne     br_420A6
        jmp     br_42152
br_420A6:
        push    0
        push    0c671h
        push    si
        push    0
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     si, ax
        cmp     si, 7fffh
        jbe     br_420BE
        mov     si, 7fffh
br_420BE:
        mov     al, 0ffh
        mov     byte ptr [bp-3ch], al
        mov     byte ptr [bp-3bh], al
        mov     word ptr [bp-2ch], si
        mov     word ptr [bp-2ah], si
        mov     word ptr [bp-26h], 2280h
        mov     word ptr [bp-24h], 1
        mov     word ptr [bp-2eh], 1000h
        mov     word ptr [bp-16h], 0ffffh
        mov     word ptr [bp-14h], 3fffh
        mov     ax, 7ff0h
        mov     word ptr [bp-12h], ax
        mov     word ptr [bp-0eh], ax
        xor     ax, ax
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0ch], ax
        mov     byte ptr [bp-37h], al
        mov     byte ptr [bp-30h], al
        mov     byte ptr [bp-36h], al
        mov     byte ptr [bp-35h], al
        mov     word ptr [bp-0ah], 0ah
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-28h], 0ff00h
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], ax
        cmp     byte ptr [bp+7], al
        jne     br_42124
        mov     byte ptr [bp-32h], al
        mov     al, 80h
        jmp     br_42130
br_42124:
        mov     al, byte ptr [bp+7]
        mov     byte ptr [bp-32h], al
        mov     byte ptr [bp-31h], 7fh
        xor     al, al
br_42130:
        mov     byte ptr [bp-33h], al
        mov     byte ptr [bp-34h], al
        mov     byte ptr [bp-3eh], 0ffh
        push    0
        push    0
        push    0
        lea     ax, [bp-3eh]
        push    ss
        push    ax
        callf   EP_VOICE_START_SEG:EP_VOICE_START_OFF
        add     sp, 0ah
        nop
        push    cs
        call    dma_status_rearm
br_42152:
        pop     si
        leave
        retf
        db      00h
L_42156:
        push    bp
        mov     bp, sp
        cmp     byte ptr [bp+9], 0
        je      br_42165
        cmp     byte ptr [bp+9], 1
        jne     br_42171
br_42165:
        mov     al, byte ptr [bp+6]
        and     al, 0f0h
        or      al, byte ptr [C2_B_PAD_DRUM]
        mov     byte ptr [bp+6], al
br_42171:
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   EP_MIDI_CHANNEL_MSG_DISPATCH_SEG:EP_MIDI_CHANNEL_MSG_DISPATCH_OFF
        leave
        retf
        db      00h
L_42182:
        push    di
        xor     ax, ax
        mov     cx, 480h
        mov     di, C1_W_081FA
        push    ds
        pop     es
        rep stosw
        pop     di
        retf
        db      00h
far_42192:
        if      FW_VERSION >= 114
        if      FW_VERSION >= 120
        db      "1.14c        -74"
        else
        db      "1.14         -72"
        endif
        db      00h, 00h
        else
        if      FW_VERSION >= 112
        db      "1.12         -6"
        db      35h, 00h, 00h
        elseif  FW_VERSION >= 111
        db      "1.11         -6"
        db      33h, 00h, 00h
        elseif  FW_VERSION >= 110
        db      "1.10         -6"
        db      31h, 00h, 00h
        else
        db      "1.07         -5"
        db      34h, 00h, 00h
        endif
        endif
X_421A4:
        push    di
        push    si
        push    EP_FS_OPEN_SEG
        push    EP_L_41C0C_OFF
        push    31h
        callf   EP_IVT_SET_VECTOR_SEG:EP_IVT_SET_VECTOR_OFF
        add     sp, 6
        push    EP_FS_OPEN_SEG
        push    EP_L_41DE4_OFF
        push    3bh
        callf   EP_IVT_SET_VECTOR_SEG:EP_IVT_SET_VECTOR_OFF
        add     sp, 6
        push    EP_FS_OPEN_SEG
        push    EP_L_41DC0_OFF
        push    39h
        callf   EP_IVT_SET_VECTOR_SEG:EP_IVT_SET_VECTOR_OFF
        add     sp, 6
        push    EP_FS_OPEN_SEG
        push    EP_L_41FC2_OFF
        push    47h
        callf   EP_IVT_SET_VECTOR_SEG:EP_IVT_SET_VECTOR_OFF
        add     sp, 6
        mov     ax, C1_TBL_APS_NAME
        mov     dx, C1_SEG
        push    ds
        mov     di, ax
        mov     si, C1_BASE+ALL_PGMS_NAME-C1_SEG*16
        push    ds
        pop     es
        mov     ds, dx
        mov     cx, 8
        rep movsw
        movsb
        pop     ds
        push    ds
        push    ax
        push    64h
        callf   EP_IVT_SET_VECTOR_SEG:EP_IVT_SET_VECTOR_OFF
        add     sp, 6
        pop     si
        pop     di
        retf
L_41C0C:
        pusha
        push    ds
        push    es
        mov     bp, sp
        sub     sp, 0ah
        push    ds
        mov     ax, DS_SEG
        mov     ds, ax
        cld
        sti
        mov     ax, word ptr [bp+0ch]
        mov     cx, word ptr [bp+4]
        mov     word ptr [bp-4], cx
        mov     word ptr [bp-2], ax
        lea     cx, [bp-0ah]
        push    ss
        push    cx
        push    ds
        push    C0_W_098C2
        mov     dx, word ptr [bp+6]
        mov     bx, word ptr [bp]
        push    bx
        push    dx
        nop
        push    cs
        call    filename_split
        add     sp, 0ch
        lea     di, [bp-0ah]
        mov     si, 98c2h
        mov     cx, ss
        mov     es, cx
        push    ds
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        mov     bx, cx
        xchg    di, si
        push    ds
        push    es
        pop     ds
        pop     es
        mov     cx, 0ffffh
        repne scasb
        dec     di
        mov     cx, bx
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        push    C1_SEG
        if      FW_VERSION >= 120
        push    EP_FAR_42202_OFF
        else
        push    EP_L_42B12_OFF
        endif
        lea     ax, [bp-0ah]
        push    ss
        push    ax
        if      FW_VERSION <> 112
        callf   C0_SEG:EP_FSTRICMP_OFF
        else
        callf   C0_SEG:(C0_BASE+__fstricmp-C0_SEG*16)
        endif
        add     sp, 8
        or      ax, ax
        jne     isr_42290
        nop
        push    cs
        call    far_450D4
        jmp     isr_423B9
        db      90h
isr_42290:
        push    EP_FS_OPEN_SEG
        push    EP_L_43118_OFF
        lea     ax, [bp-0ah]
        push    ss
        push    ax
        if      FW_VERSION <> 112
        callf   C0_SEG:EP_FSTRICMP_OFF
        else
        callf   C0_SEG:(C0_BASE+__fstricmp-C0_SEG*16)
        endif
        add     sp, 8
        or      ax, ax
        jne     isr_422B0
        callf   EP_L_395CE_SEG:EP_L_395CE_OFF
        jmp     NEAR isr_423B9
        db      90h
isr_422B0:
        push    EP_FS_OPEN_SEG
        push    EP_L_4311E_OFF
        lea     ax, [bp-0ah]
        push    ss
        push    ax
        if      FW_VERSION <> 112
        callf   C0_SEG:EP_FSTRICMP_OFF
        else
        callf   C0_SEG:(C0_BASE+__fstricmp-C0_SEG*16)
        endif
        add     sp, 8
        or      ax, ax
        jne     isr_422D0
        nop
        push    cs
        call    far_43EFE
        jmp     isr_423B9
        db      90h
isr_422D0:
        push    EP_FS_OPEN_SEG
        push    EP_L_43124_OFF
        lea     ax, [bp-0ah]
        push    ss
        push    ax
        if      FW_VERSION <> 112
        callf   C0_SEG:EP_FSTRICMP_OFF
        else
        callf   C0_SEG:(C0_BASE+__fstricmp-C0_SEG*16)
        endif
        add     sp, 8
        or      ax, ax
        jne     isr_422EA
        jmp     NEAR isr_423B4
isr_422EA:
        push    EP_FS_OPEN_SEG
        push    EP_L_4312A_OFF
        lea     ax, [bp-0ah]
        push    ss
        push    ax
        if      FW_VERSION <> 112
        callf   C0_SEG:EP_FSTRICMP_OFF
        else
        callf   C0_SEG:(C0_BASE+__fstricmp-C0_SEG*16)
        endif
        add     sp, 8
        or      ax, ax
        jne     isr_42304
        jmp     NEAR isr_423B4
isr_42304:
        push    EP_FS_OPEN_SEG
        push    EP_L_43130_OFF
        lea     ax, [bp-0ah]
        push    ss
        push    ax
        if      FW_VERSION <> 112
        callf   C0_SEG:EP_FSTRICMP_OFF
        else
        callf   C0_SEG:(C0_BASE+__fstricmp-C0_SEG*16)
        endif
        add     sp, 8
        or      ax, ax
        jne     isr_42324
        nop
        push    cs
        call    far_4582A
        jmp     isr_423B9
        db      90h
isr_42324:
        push    EP_FS_OPEN_SEG
        push    EP_L_43136_OFF
        lea     ax, [bp-0ah]
        push    ss
        push    ax
        if      FW_VERSION <> 112
        callf   C0_SEG:EP_FSTRICMP_OFF
        else
        callf   C0_SEG:(C0_BASE+__fstricmp-C0_SEG*16)
        endif
        add     sp, 8
        or      ax, ax
        jne     isr_42342
        callf   EP_L_3A904_SEG:EP_L_3A904_OFF
        jmp     SHORT isr_423B9
isr_42342:
        push    EP_FS_OPEN_SEG
        push    EP_L_4313C_OFF
        lea     ax, [bp-0ah]
        push    ss
        push    ax
        if      FW_VERSION <> 112
        callf   C0_SEG:EP_FSTRICMP_OFF
        else
        callf   C0_SEG:(C0_BASE+__fstricmp-C0_SEG*16)
        endif
        add     sp, 8
        or      ax, ax
        jne     isr_42360
        callf   EP_L_3A8FA_SEG:EP_L_3A8FA_OFF
        jmp     SHORT isr_423B9
isr_42360:
        push    EP_FS_OPEN_SEG
        push    EP_L_43142_OFF
        lea     ax, [bp-0ah]
        push    ss
        push    ax
        if      FW_VERSION <> 112
        callf   C0_SEG:EP_FSTRICMP_OFF
        else
        callf   C0_SEG:(C0_BASE+__fstricmp-C0_SEG*16)
        endif
        add     sp, 8
        or      ax, ax
        jne     isr_4237E
        nop
        push    cs
        call    far_46A0E
        jmp     isr_423B9
isr_4237E:
        push    EP_FS_OPEN_SEG
        push    EP_L_43148_OFF
        lea     ax, [bp-0ah]
        push    ss
        push    ax
        if      FW_VERSION <> 112
        callf   C0_SEG:EP_FSTRICMP_OFF
        else
        callf   C0_SEG:(C0_BASE+__fstricmp-C0_SEG*16)
        endif
        add     sp, 8
        or      ax, ax
        jne     isr_423A6
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        callf   EP_L_3AF9E_SEG:EP_L_3AF9E_OFF
isr_423A0:
        add     sp, 4
        jmp     isr_423B9
        db      90h
isr_423A6:
        push    C1_SEG
        if      FW_VERSION >= 120
        push    EP_FAR_4223E_OFF
        else
        push    EP_MSG_DISK_ERRORS_OFF
        endif
        callf   EP_DISP_ALERT_WAIT_KEY_SEG:EP_DISP_ALERT_WAIT_KEY_OFF
        jmp     isr_423A0
        db      90h
isr_423B4:
        callf   EP_L_3B20C_SEG:EP_L_3B20C_OFF
isr_423B9:
        mov     sp, bp
        pop     es
        pop     ds
        popa
        iret
        db      00h
L_41DC0:
        pusha
        push    ds
        push    es
        mov     bp, sp
        sub     sp, 4
        push    ds
        mov     ax, DS_SEG
        mov     ds, ax
        cld
        nop
        push    cs
        call    smem_free_bytes
        add     ax, ax
        adc     dx, dx
        mov     word ptr [bp+0eh], dx
        mov     word ptr [bp+12h], ax
        mov     sp, bp
        pop     es
        pop     ds
        popa
        iret
L_41DE4:
        pusha
        push    ds
        push    es
        mov     bp, sp
        sub     sp, 8
        push    ds
        mov     ax, DS_SEG
        mov     ds, ax
        cld
        sti
        mov     al, byte ptr [bp+12h]
        sub     ah, ah
        cmp     ax, 8
        ja      isr_4247C
        add     ax, ax
        xchg    bx, ax
        jmp     word ptr cs:[bx+TBL_42406-C1_CSBASE]
TBL_42406:
        dw      tgt_42418-C1_CSBASE, tgt_42420-C1_CSBASE, tgt_42428-C1_CSBASE, tgt_42430-C1_CSBASE
        dw      tgt_42430-C1_CSBASE, tgt_42430-C1_CSBASE, tgt_4244C-C1_CSBASE, tgt_4244C-C1_CSBASE
        dw      tgt_4244C-C1_CSBASE
tgt_42418:
        nop
        push    cs
        call    far_44E40
        jmp     isr_4247C
        nop
tgt_42420:
        nop
        push    cs
        call    far_446A4
        jmp     isr_4247C
        nop
tgt_42428:
        nop
        push    cs
        call    far_4668A
        jmp     isr_4247C
        nop
tgt_42430:
        lea     ax, [bp-4]
        push    ss
        push    ax
        mov     al, byte ptr [bp+12h]
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    far_42482
        add     sp, 6
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        jmp     isr_42464
        db      90h
tgt_4244C:
        lea     ax, [bp-4]
        push    ss
        push    ax
        lea     ax, [bp-8]
        push    ss
        push    ax
        mov     al, byte ptr [bp+12h]
        sub     ah, ah
        db      50h, 90h, 0eh
        call    L_42560
        db      89h, 46h, 0ch
isr_42464:
        mov     ax, word ptr [bp-6]
        mov     word ptr [bp], ax
        mov     ax, word ptr [bp-8]
        mov     word ptr [bp+6], ax
        mov     ax, word ptr [bp-2]
        mov     word ptr [bp+0eh], ax
        mov     ax, word ptr [bp-4]
        mov     word ptr [bp+12h], ax
isr_4247C:
        mov     sp, bp
        pop     es
        pop     ds
        popa
        iret
far_42482:
        enter   4, 0
        push    si
        mov     ax, word ptr [bp+6]
        sub     ax, 3
        je      br_42498
        dec     ax
        je      br_424A2
        dec     ax
        je      br_424CE
        jmp     br_424F4
        db      90h
br_42498:
        mov     ax, word ptr [C0_W_098DC]
        mov     dx, word ptr [C0_W_098DE]
        jmp     br_424ED
        db      90h
br_424A2:
        mov     ax, C1_TBL_SOUNDS_END
        mov     cx, ds
        cmp     ax, word ptr [C0_W_098DC]
        jne     br_424B3
        cmp     cx, word ptr [C0_W_098DE]
        je      br_424F4
br_424B3:
        mov     cx, ds
        les     bx, [C0_W_0D7C2]
        cmp     word ptr es:[bx], ax
        jne     br_424C4
        cmp     word ptr es:[bx+SND_DD_00+2], cx
        je      br_424F4
br_424C4:
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+SND_DD_00+2]
        jmp     br_424ED
        db      90h
br_424CE:
        mov     ax, word ptr [C0_W_098DC]
        mov     dx, word ptr [C0_W_098DE]
        cmp     word ptr [C0_W_0D7C2], ax
        jne     br_424E1
        cmp     word ptr [C0_W_0D7C4], dx
        je      br_424F4
br_424E1:
        les     bx, [C0_W_0D7C2]
        mov     ax, word ptr es:[bx+SND_FP_04]
        mov     dx, word ptr es:[bx+SND_FP_04+2]
br_424ED:
        mov     word ptr [C0_W_0D7C2], ax
        mov     word ptr [C0_W_0D7C4], dx
br_424F4:
        mov     ax, C1_TBL_SOUNDS_END
        mov     cx, ds
        cmp     ax, word ptr [C0_W_0D7C2]
        jne     br_4251A
        cmp     cx, word ptr [C0_W_0D7C4]
        jne     br_4251A
        xor     ax, ax
        cwd
        mov     si, ax
        mov     word ptr [bp-2], dx
        les     bx, [bp+8]
        mov     word ptr es:[bx+2], ax
        mov     word ptr es:[bx], ax
        jmp     br_42558
        db      90h
br_4251A:
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        mov     si, ax
        mov     word ptr [bp-2], dx
        les     bx, [C0_W_0D7C2]
        push    word ptr es:[bx+SND_LENGTH+2]
        push    word ptr es:[bx+SND_LENGTH]
        mov     al, byte ptr es:[bx+SND_STEREO]
        sub     ah, ah
        inc     ax
        cwd
        push    dx
        push    ax
        callf   EP_AFLMUL_SEG:EP_AFLMUL_OFF
        add     ax, 15h
        adc     dx, 0
        add     ax, ax
        adc     dx, dx
        les     bx, [bp+8]
        mov     word ptr es:[bx], ax
        mov     word ptr es:[bx+2], dx
br_42558:
        mov     ax, si
        mov     dx, word ptr [bp-2]
        pop     si
        leave
        retf
L_42560:
        push    bp
        mov     bp, sp
        push    di
        mov     ax, word ptr [bp+6]
        sub     ax, 7
        je      br_42576
        dec     ax
        je      br_42582
        nop
        push    cs
        call    far_3F36E
        jmp     br_4258F
br_42576:
        mov     al, byte ptr [C0_B_0D7BF]
        cbw
        push    ax
        nop
        push    cs
        call    far_3F39A
        jmp     br_4258C
br_42582:
        mov     al, byte ptr [C0_B_0D7BF]
        cbw
        push    ax
        nop
        push    cs
        call    far_3F43A
br_4258C:
        add     sp, 2
br_4258F:
        mov     byte ptr [C0_B_0D7BF], al
        cbw
        mov     di, ax
        cbw
        imul    ax, ax, 99eh
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        add     ax, 2
        les     bx, [bp+8]
        mov     word ptr es:[bx], ax
        mov     word ptr es:[bx+2], dx
        les     bx, [bp+0ch]
        mov     word ptr es:[bx], 1172h
        mov     word ptr es:[bx+2], 0
        mov     ax, di
        pop     di
        leave
        retf
L_41FC2:
        pusha
        push    ds
        push    es
        mov     bp, sp
        sub     sp, 4
        push    ds
        mov     ax, DS_SEG
        mov     ds, ax
        cld
        sti
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp]
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     al, byte ptr [bp+12h]
        sub     ah, ah
        or      ax, ax
        je      isr_425F4
        dec     ax
        je      isr_425FC
        dec     ax
        je      isr_42604
        dec     ax
        je      isr_42612
        dec     ax
        je      isr_42620
        jmp     isr_42628
isr_425F4:
        nop
        push    cs
        call    far_4262E
        jmp     isr_42628
        db      90h
isr_425FC:
        nop
        push    cs
        call    far_42684
        jmp     isr_42628
        db      90h
isr_42604:
        push    word ptr [bp-2]
        push    si
        nop
        push    cs
        call    far_4275C
        add     sp, 4
        jmp     SHORT L_42625
isr_42612:
        push    word ptr [bp-2]
        push    si
        nop
        push    cs
        call    far_427A2
        add     sp, 4
        jmp     isr_42628
isr_42620:
        nop
        push    cs
        call    far_427E8
L_42625:
        mov     word ptr [bp+12h], ax
isr_42628:
        mov     sp, bp
        pop     es
        pop     ds
        popa
        iret
far_4262E:
        enter   8, 0
        push    di
        push    si
        mov     ax, word ptr [C0_W_098DC]
        mov     dx, word ptr [C0_W_098DE]
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     cx, ds
        cmp     ax, C1_TBL_SOUNDS_END
        jne     loop_4264B
        cmp     dx, cx
        je      br_4267F
loop_4264B:
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     di, ax
        mov     word ptr [bp-6], dx
        test    byte ptr es:[si+0dh], 1
        je      br_4266B
        push    es
        push    si
        nop
        push    cs
        call    sound_list_unlink
        add     sp, 4
br_4266B:
        mov     ax, word ptr [bp-6]
        mov     si, di
        mov     word ptr [bp-2], ax
        mov     cx, ds
        cmp     di, C1_TBL_SOUNDS_END
        jne     loop_4264B
        cmp     ax, cx
        jne     loop_4264B
br_4267F:
        pop     si
        pop     di
        leave
        retf
        db      00h
far_42684:
        enter   1ah, 0
        push    di
        push    si
        mov     ax, word ptr [C0_W_098DC]
        mov     dx, word ptr [C0_W_098DE]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     cx, ds
        cmp     ax, C1_TBL_SOUNDS_END
        jne     loop_426A5
        cmp     dx, cx
        jne     loop_426A5
        jmp     br_42757
loop_426A5:
        les     bx, [bp-4]
        test    byte ptr es:[bx+0dh], 1
        jne     br_426B2
        jmp     br_42736
br_426B2:
        add     bx, 12h
        push    ds
        mov     di, bx
        lea     si, [bp-1ah]
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
        mov     bx, (C1_BASE+L_42B12-C1_SEG*16)
        mov     ax, C1_SEG
        push    ds
        mov     di, bx
        lea     si, [bp-1ah]
        mov     es, ax
        mov     cx, ss
        mov     ds, cx
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        push    cx
        xchg    di, si
        push    ds
        push    es
        pop     ds
        pop     es
        mov     cx, 0ffffh
        repne scasb
        dec     di
        pop     cx
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        add     ax, 0ah
        push    dx
        push    ax
        lea     ax, [bp-1ah]
        push    ss
        push    ax
        nop
        push    cs
        call    far_3E90E
        add     sp, 8
        or      ax, ax
        je      br_42736
        les     bx, [bp-4]
        add     word ptr es:[bx+0ah], 20h
        adc     word ptr es:[bx+C1_TBL_0000C], 0
br_42736:
        les     bx, [bp-4]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     cx, ds
        cmp     ax, C1_TBL_SOUNDS_END
        je      br_42750
        jmp     loop_426A5
br_42750:
        cmp     dx, cx
        je      br_42757
        jmp     loop_426A5
br_42757:
        pop     si
        pop     di
        leave
        retf
        db      00h
far_4275C:
        enter   16h, 0
        push    10h
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        lea     ax, [bp-16h]
        push    ss
        push    ax
        callf   EP_FSTRNCPY_SEG:EP_FSTRNCPY_OFF
        add     sp, 0ah
        mov     byte ptr [bp-6], 0
        lea     ax, [bp-16h]
        push    ss
        push    ax
        lea     ax, [bp-4]
        push    ss
        push    ax
        nop
        push    cs
        call    far_3FE9E
        add     sp, 8
        or      ax, ax
        je      br_4279E
        les     bx, [bp-4]
        test    byte ptr es:[bx+0dh], 1
        je      br_4279E
        mov     ax, 1
        leave
        retf
br_4279E:
        xor     ax, ax
        leave
        retf
far_427A2:
        enter   16h, 0
        push    10h
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        lea     ax, [bp-16h]
        push    ss
        push    ax
        callf   EP_FSTRNCPY_SEG:EP_FSTRNCPY_OFF
        add     sp, 0ah
        mov     byte ptr [bp-6], 0
        lea     ax, [bp-16h]
        push    ss
        push    ax
        lea     ax, [bp-4]
        push    ss
        push    ax
        nop
        push    cs
        call    far_3FE9E
        add     sp, 8
        or      ax, ax
        je      br_427E6
        les     bx, [bp-4]
        test    byte ptr es:[bx+0dh], 1
        je      br_427E6
        push    es
        push    bx
        nop
        push    cs
        call    sound_list_unlink
br_427E6:
        leave
        retf
far_427E8:
        enter   4, 0
        push    di
        xor     di, di
        mov     ax, word ptr [C0_W_098DC]
        mov     dx, word ptr [C0_W_098DE]
        mov     bx, ax
        mov     word ptr [bp-2], dx
        mov     ax, dx
        mov     cx, ds
        cmp     bx, C1_TBL_SOUNDS_END
        jne     loop_42809
        cmp     ax, cx
        je      br_4282B
loop_42809:
        mov     es, word ptr [bp-2]
        test    byte ptr es:[bx+0dh], 1
        je      br_42814
        inc     di
br_42814:
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        mov     bx, ax
        mov     word ptr [bp-2], dx
        mov     cx, ds
        cmp     ax, C1_TBL_SOUNDS_END
        jne     loop_42809
        cmp     dx, cx
        jne     loop_42809
br_4282B:
        mov     ax, di
        pop     di
        leave
        retf
fs_error_msg:
        push    bp
        mov     bp, sp
        mov     bx, word ptr [bp+6]
        cmp     bx, 0bh
        jb      br_4283E
        mov     bx, 0ah
br_4283E:
        shl     bx, 2
        mov     ax, word ptr [bx+C1_TBL_0073C]
        mov     dx, word ptr [bx+C1_TBL_0073E]
        leave
        retf
        db      00h
fs_open:
        enter   2, 0
        push    si
        sub     ax, ax
        mov     word ptr [C1_W_08B00], ax
        mov     word ptr [C1_W_08AFE], ax
        cmp     word ptr [bp+0ah], ax
        jne     br_42872
        push    ds
        push    C1_W_08AFA
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    far_3E806
        add     sp, 8
        jmp     br_42880
br_42872:
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    far_3E83E
        add     sp, 4
br_42880:
        cmp     ax, 0ffffh
        jne     br_4288E
        callf   EP_DISK_LAST_ERROR_SEG:EP_DISK_LAST_ERROR_OFF
        mov     si, ax
        jmp     SHORT br_42890
br_4288E:
        xor     si, si
br_42890:
        push    si
        nop
        push    cs
        call    fs_error_msg
        add     sp, 2
        pop     si
        leave
        retf
fs_read:
        enter   4, 0
        push    di
        push    si
        sub     ax, ax
        mov     word ptr [bp-2], ax
        mov     word ptr [bp-4], ax
        mov     ax, word ptr [bp+0ch]
        mul     word ptr [bp+0ah]
        mov     si, ax
        push    ax
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    far_3E824
        add     sp, 6
        mov     di, ax
        cmp     di, -1
        je      br_428EA
        cmp     si, ax
        jbe     br_428E4
        mov     ax, (C1_BASE+far_431C8-C1_SEG*16)
        mov     cx, C1_SEG
        mov     si, ax
        mov     word ptr [bp-2], cx
loop_428D7:
        sub     ax, ax
        add     word ptr [C1_W_08AFE], di
        adc     word ptr [C1_W_08B00], ax
        jmp     br_428FD
        db      90h
br_428E4:
        mov     si, word ptr [bp-4]
        jmp     loop_428D7
        db      90h
br_428EA:
        callf   EP_DISK_LAST_ERROR_SEG:EP_DISK_LAST_ERROR_OFF
        push    ax
        nop
        push    cs
        call    fs_error_msg
        add     sp, 2
        mov     si, ax
        mov     word ptr [bp-2], dx
br_428FD:
        mov     ax, si
        mov     dx, word ptr [bp-2]
        pop     si
        pop     di
        leave
        retf
fs_read_resized:
        enter   10h, 0
        push    di
        push    si
        mov     bx, word ptr [bp+0ch]
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        sub     ax, ax
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-0ch], ax
        mov     si, word ptr [bp+10h]
        sub     si, bx
        sbb     ax, ax
        and     si, ax
        add     si, bx
        cmp     si, bx
        jae     br_4293C
        mov     ax, bx
        sub     ax, si
        mov     word ptr [bp-0eh], ax
        jmp     br_42941
        db      90h
br_4293C:
        mov     word ptr [bp-0eh], 0
br_42941:
        mov     di, word ptr [bp+0ah]
        cmp     word ptr [bp+0eh], di
        jne     br_42962
        push    si
        push    di
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        jmp     br_429CF
        db      90h
br_42962:
        mov     cx, word ptr [bp+0eh]
        sub     cx, di
        sbb     ax, ax
        and     cx, ax
        add     cx, di
        cmp     cx, di
        jae     br_4297E
        mov     ax, di
        sub     ax, cx
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-10h], cx
        jmp     br_42986
        db      90h
br_4297E:
        mov     word ptr [bp-10h], cx
        mov     word ptr [bp-8], 0
br_42986:
        or      si, si
        je      br_429CF
        mov     word ptr [bp-6], si
        mov     si, word ptr [bp-4]
        mov     di, word ptr [bp-6]
loop_42993:
        push    1
        push    word ptr [bp-10h]
        push    word ptr [bp-2]
        push    si
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        jne     br_429CF
        push    1
        push    0
        push    word ptr [bp-8]
        nop
        push    cs
        call    fs_seek
        add     sp, 6
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        jne     br_429CF
        mov     ax, word ptr [bp+0eh]
        add     si, ax
        dec     di
        jne     loop_42993
br_429CF:
        mov     ax, word ptr [bp-0ah]
        or      ax, word ptr [bp-0ch]
        je      br_429DC
        mov     si, word ptr [bp-0ch]
        jmp     br_429F4
br_429DC:
        push    1
        mov     ax, word ptr [bp-0eh]
        mul     word ptr [bp+0ah]
        push    0
        push    ax
        nop
        push    cs
        call    fs_seek
        add     sp, 6
        mov     si, ax
        mov     word ptr [bp-0ah], dx
br_429F4:
        mov     ax, si
        mov     dx, word ptr [bp-0ah]
        pop     si
        pop     di
        leave
        retf
        db      00h
fs_write:
        push    bp
        mov     bp, sp
        push    si
        mov     ax, word ptr [bp+0ch]
        mul     word ptr [bp+0ah]
        push    ax
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    far_3E854
        add     sp, 6
        inc     ax
        jne     br_42A24
        callf   EP_DISK_LAST_ERROR_SEG:EP_DISK_LAST_ERROR_OFF
        mov     si, ax
        jmp     br_42A26
        db      90h
br_42A24:
        xor     si, si
br_42A26:
        push    si
        nop
        push    cs
        call    fs_error_msg
        add     sp, 2
        pop     si
        leave
        retf
far_42A32:
        push    bp
        mov     bp, sp
        push    si
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    far_3E884
        add     sp, 4
        inc     ax
        jne     br_42A50
        callf   EP_DISK_LAST_ERROR_SEG:EP_DISK_LAST_ERROR_OFF
        mov     si, ax
        jmp     br_42A52
br_42A50:
        xor     si, si
br_42A52:
        push    si
        nop
        push    cs
        call    fs_error_msg
        add     sp, 2
        pop     si
        leave
        retf
fs_close:
        push    si
        callf   EP_L_37E7C_SEG:EP_L_37E7C_OFF
        inc     ax
        jne     br_42A70
        callf   EP_DISK_LAST_ERROR_SEG:EP_DISK_LAST_ERROR_OFF
        mov     si, ax
        jmp     br_42A72
br_42A70:
        xor     si, si
br_42A72:
        push    si
        nop
        push    cs
        call    fs_error_msg
        add     sp, 2
        pop     si
        retf
        db      00h
fs_seek:
        enter   4, 0
        push    si
        mov     bx, word ptr [bp+0ah]
        xor     ax, ax
        cwd
        mov     si, ax
        mov     word ptr [bp-2], dx
        cmp     bx, 1
        jne     br_42AC4
        cmp     word ptr [bp+8], ax
        jl      br_42AE4
loop_42A98:
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    far_3E89A
        add     sp, 4
        inc     ax
        jne     br_42AB4
        mov     ax, (C1_BASE+L_4321C-C1_SEG*16)
        mov     cx, C1_SEG
        mov     si, ax
        mov     word ptr [bp-2], cx
br_42AB4:
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     word ptr [C1_W_08AFE], ax
        adc     word ptr [C1_W_08B00], dx
        jmp     br_42AED
br_42AC4:
        or      bx, bx
        jne     br_42AE4
        mov     ax, word ptr [C1_W_08AFE]
        mov     dx, word ptr [C1_W_08B00]
        cmp     word ptr [bp+8], dx
        jg      br_42ADB
        jl      br_42AE4
        cmp     word ptr [bp+6], ax
        jb      br_42AE4
br_42ADB:
        sub     word ptr [bp+6], ax
        sbb     word ptr [bp+8], dx
        jmp     loop_42A98
        db      90h
br_42AE4:
        mov     si, (C1_BASE+L_4321C-C1_SEG*16)
        mov     cx, C1_SEG
        mov     word ptr [bp-2], cx
br_42AED:
        mov     ax, si
        mov     dx, word ptr [bp-2]
        pop     si
        leave
        retf
        db      00h
L_42AF6:
        mov     ax, word ptr [C1_W_08AFA]
        mov     dx, word ptr [C1_W_08AFC]
        retf
far_42AFE:
        enter   4, 0
        lea     ax, [bp-4]
        push    ss
        push    ax
        push    C1_SEG
        push    (C1_BASE+L_3EECC-C1_SEG*16)
        nop
        push    cs
        call    far_3E806
        leave
        retf
fs_read_to_smem:
        enter   0eh, 0
        push    di
        push    si
        xor     ax, ax
        cwd
        mov     di, ax
        mov     word ptr [bp-0ch], dx
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     ax, word ptr [bp+0ch]
        or      ax, word ptr [bp+0ah]
        je      br_42B8F
loop_42B36:
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        or      dx, dx
        jl      br_42B4A
        jg      br_42B47
        cmp     ax, 800h
        jbe     br_42B4A
br_42B47:
        mov     ax, 800h
br_42B4A:
        mov     si, ax
        push    ax
        push    2
        push    7f00h
        push    0
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     di, ax
        mov     word ptr [bp-0ch], dx
        or      dx, ax
        jne     br_42B8F
        push    si
        push    7f00h
        push    0
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    smem_write_block
        add     sp, 0ah
        sub     cx, cx
        add     word ptr [bp-4], si
        adc     word ptr [bp-2], cx
        sub     word ptr [bp+0ah], si
        sbb     word ptr [bp+0ch], cx
        mov     ax, word ptr [bp+0ch]
        or      ax, word ptr [bp+0ah]
        jne     loop_42B36
br_42B8F:
        mov     ax, di
        mov     dx, word ptr [bp-0ch]
        pop     si
        pop     di
        leave
        retf
far_42B98:
        enter   16h, 0
        push    di
        push    si
        mov     word ptr [bp-0ah], 0
        mov     word ptr [bp-8], 7f00h
        mov     word ptr [bp-2], 7f80h
        sub     ax, ax
        mov     word ptr [bp-12h], ax
        mov     word ptr [bp-14h], ax
        mov     word ptr [bp-6], 2aah
        push    ax
        push    2
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     word ptr [bp-0eh], ax
        mov     word ptr [bp-0ch], dx
        or      dx, ax
        jne     loop_42BD5
        jmp     br_42CBD
loop_42BD5:
        mov     ax, word ptr [bp-0eh]
        mov     dx, word ptr [bp-0ch]
        or      dx, dx
        jl      br_42BE9
        jg      br_42BE6
        cmp     ax, 2aah
        jbe     br_42BE9
br_42BE6:
        mov     ax, 2aah
br_42BE9:
        mov     di, ax
        push    ax
        push    3
        push    7f80h
        push    0
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     word ptr [bp-14h], ax
        mov     word ptr [bp-12h], dx
        or      dx, ax
        je      br_42C08
        jmp     br_42CBD
br_42C08:
        xor     ax, ax
        mov     dx, 7f80h
        mov     cx, ax
        mov     word ptr [bp-2], dx
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], 7f00h
        or      di, di
        jne     br_42C22
        mov     si, ax
        jmp     br_42C8B
br_42C22:
        mov     word ptr [bp-0ah], di
        mov     si, word ptr [bp-8]
        mov     word ptr [bp-10h], di
        mov     di, cx
loop_42C2D:
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[di+1]
        and     ax, 0fh
        shl     ax, 4
        mov     ch, byte ptr es:[di]
        sub     cl, cl
        or      ax, cx
        push    ax
        callf   EP_TIMING_CALC_RATE_SEG:EP_TIMING_CALC_RATE_OFF
        add     sp, 2
        mov     es, word ptr [bp-6]
        mov     bx, si
        add     si, 2
        mov     word ptr es:[bx], ax
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[di+1]
        shr     al, 4
        sub     ah, ah
        shl     ax, 4
        mov     ch, byte ptr es:[di+2]
        sub     cl, cl
        or      ax, cx
        push    ax
        callf   EP_TIMING_CALC_RATE_SEG:EP_TIMING_CALC_RATE_OFF
        add     sp, 2
        mov     es, word ptr [bp-6]
        mov     bx, si
        add     si, 2
        mov     word ptr es:[bx], ax
        add     di, 3
        dec     word ptr [bp-0ah]
        jne     loop_42C2D
        mov     di, word ptr [bp-10h]
br_42C8B:
        sar     si, 1
        push    si
        push    7f00h
        push    0
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    smem_write_block
        add     sp, 0ah
        mov     ax, si
        cwd
        add     word ptr [bp+6], ax
        adc     word ptr [bp+8], dx
        sub     ax, ax
        sub     word ptr [bp-0eh], di
        sbb     word ptr [bp-0ch], ax
        mov     ax, word ptr [bp-0ch]
        or      ax, word ptr [bp-0eh]
        je      br_42CBD
        jmp     loop_42BD5
br_42CBD:
        mov     ax, word ptr [bp-14h]
        mov     dx, word ptr [bp-12h]
        pop     si
        pop     di
        leave
        retf
        db      00h
far_42CC8:
        enter   16h, 0
        push    di
        push    si
        sub     ax, ax
        mov     word ptr [bp-14h], ax
        mov     word ptr [bp-16h], ax
        push    1
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    size_para_round_mul
        add     sp, 6
        add     ax, word ptr [bp+6]
        adc     dx, word ptr [bp+8]
        mov     word ptr [bp-0eh], ax
        mov     word ptr [bp-0ch], dx
        mov     word ptr [bp-8], 7f00h
        mov     word ptr [bp-2], 7f80h
        mov     word ptr [bp-6], 400h
        shl     word ptr [bp+0ah], 1
        rcl     word ptr [bp+0ch], 1
        mov     ax, word ptr [bp+0ch]
        or      ax, word ptr [bp+0ah]
        jne     loop_42D12
        jmp     br_42E12
loop_42D12:
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        or      dx, dx
        jl      br_42D26
        jg      br_42D23
        cmp     ax, 400h
        jbe     br_42D26
br_42D23:
        mov     ax, 400h
br_42D26:
        mov     si, ax
        push    ax
        push    2
        push    7f00h
        push    0
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     word ptr [bp-16h], ax
        mov     word ptr [bp-14h], dx
        or      dx, ax
        je      br_42D45
        jmp     br_42E12
br_42D45:
        mov     ax, si
        cwd
        sub     word ptr [bp+0ah], ax
        sbb     word ptr [bp+0ch], dx
        mov     cx, 2
        cwd
        idiv    cx
        mov     si, ax
        or      ax, si
        jle     br_42D8F
        xor     ax, ax
        mov     dx, 7f00h
        mov     word ptr [bp-6], dx
        mov     word ptr [bp-2], 7f80h
        mov     bx, ax
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-10h], si
        mov     di, ax
        mov     cx, si
loop_42D73:
        mov     es, word ptr [bp-6]
        mov     si, di
        add     di, 4
        mov     ax, word ptr es:[si]
        mov     es, word ptr [bp-2]
        mov     si, bx
        add     bx, 2
        mov     word ptr es:[si], ax
        dec     cx
        jne     loop_42D73
        mov     si, word ptr [bp-10h]
br_42D8F:
        push    si
        push    7f80h
        push    0
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    smem_write_block
        add     sp, 0ah
        mov     ax, si
        cwd
        add     word ptr [bp+6], ax
        adc     word ptr [bp+8], dx
        or      si, si
        jle     br_42DEA
        mov     ax, 2
        mov     dx, 7f00h
        mov     bx, ax
        mov     word ptr [bp-8], dx
        xor     ax, ax
        mov     dx, 7f80h
        mov     word ptr [bp-2], dx
        mov     word ptr [bp-6], si
        mov     word ptr [bp-10h], si
        mov     si, ax
        mov     cx, word ptr [bp-6]
loop_42DCE:
        mov     es, word ptr [bp-8]
        mov     di, bx
        add     bx, 4
        mov     ax, word ptr es:[di]
        mov     es, word ptr [bp-2]
        mov     di, si
        add     si, 2
        mov     word ptr es:[di], ax
        dec     cx
        jne     loop_42DCE
        mov     si, word ptr [bp-10h]
br_42DEA:
        push    si
        push    7f80h
        push    0
        push    word ptr [bp-0ch]
        push    word ptr [bp-0eh]
        nop
        push    cs
        call    smem_write_block
        add     sp, 0ah
        mov     ax, si
        cwd
        add     word ptr [bp-0eh], ax
        adc     word ptr [bp-0ch], dx
        mov     ax, word ptr [bp+0ch]
        or      ax, word ptr [bp+0ah]
        je      br_42E12
        jmp     loop_42D12
br_42E12:
        mov     ax, word ptr [bp-16h]
        mov     dx, word ptr [bp-14h]
        pop     si
        pop     di
        leave
        retf
far_42E1C:
        enter   0eh, 0
        push    di
        push    si
        xor     ax, ax
        cwd
        mov     di, ax
        mov     word ptr [bp-0ch], dx
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     ax, word ptr [bp+0ch]
        or      ax, word ptr [bp+0ah]
        je      br_42E9A
loop_42E3E:
        push    1000h
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        or      dx, dx
        jl      br_42E55
        jg      br_42E52
        cmp     ax, 800h
        jbe     br_42E55
br_42E52:
        mov     ax, 800h
br_42E55:
        mov     si, ax
        push    ax
        push    7f00h
        push    0
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    smem_block_copy
        add     sp, 0ch
        push    si
        push    2
        push    7f00h
        push    0
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     di, ax
        mov     word ptr [bp-0ch], dx
        or      dx, ax
        jne     br_42E9A
        sub     cx, cx
        add     word ptr [bp-4], si
        adc     word ptr [bp-2], cx
        sub     word ptr [bp+0ah], si
        sbb     word ptr [bp+0ch], cx
        mov     ax, word ptr [bp+0ch]
        or      ax, word ptr [bp+0ah]
        jne     loop_42E3E
br_42E9A:
        mov     ax, di
        mov     dx, word ptr [bp-0ch]
        pop     si
        pop     di
        leave
        retf
        db      00h
L_42EA4:
        enter   12h, 0
        push    di
        push    si
        mov     word ptr [bp-6], 0
        mov     word ptr [bp-2], 200h
        push    1
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    size_para_round_mul
        add     sp, 6
        add     ax, word ptr [bp+6]
        adc     dx, word ptr [bp+8]
        mov     word ptr [bp-0eh], ax
        mov     word ptr [bp-0ch], dx
        xor     ax, ax
        cwd
        mov     di, ax
        mov     word ptr [bp-8], dx
loop_42ED8:
        mov     ax, word ptr [bp+0ch]
        or      ax, word ptr [bp+0ah]
        jne     br_42EE3
        jmp     br_42FA0
br_42EE3:
        push    1000h
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        or      dx, dx
        jl      br_42EFA
        jg      br_42EF7
        cmp     ax, 200h
        jbe     br_42EFA
br_42EF7:
        mov     ax, 200h
br_42EFA:
        mov     si, ax
        push    ax
        push    7f00h
        push    0
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    smem_block_copy
        add     sp, 0ch
        push    1000h
        push    si
        push    7f00h
        push    400h
        push    word ptr [bp-0ch]
        push    word ptr [bp-0eh]
        nop
        push    cs
        call    smem_block_copy
        add     sp, 0ch
        or      si, si
        jle     br_42F6E
        xor     ax, ax
        mov     dx, 7f00h
        mov     bx, ax
        mov     word ptr [bp-6], dx
        mov     ax, 800h
        mov     word ptr [bp-2], dx
        mov     word ptr [bp-0ah], si
        mov     word ptr [bp-10h], si
        mov     si, ax
        mov     cx, word ptr [bp-0ah]
loop_42F47:
        mov     es, word ptr [bp-6]
        mov     ax, word ptr es:[bx]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si], ax
        mov     es, word ptr [bp-6]
        mov     ax, word ptr es:[bx+400h]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+2], ax
        add     bx, 2
        add     si, 4
        dec     cx
        jne     loop_42F47
        mov     si, word ptr [bp-10h]
br_42F6E:
        mov     ax, si
        cwd
        sub     word ptr [bp+0ah], si
        sbb     word ptr [bp+0ch], dx
        add     word ptr [bp+6], ax
        adc     word ptr [bp+8], dx
        add     word ptr [bp-0eh], ax
        adc     word ptr [bp-0ch], dx
        push    si
        push    4
        push    7f00h
        push    800h
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     di, ax
        mov     word ptr [bp-8], dx
        or      dx, ax
        jne     br_42FA0
        jmp     loop_42ED8
br_42FA0:
        mov     ax, di
        mov     dx, word ptr [bp-8]
        pop     si
        pop     di
        leave
        retf
        db      00h
filename_split:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+0ah]
        mov     ax, word ptr [bp+0ch]
        or      ax, si
        je      br_42FD4
        push    10h
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    word ptr [bp+0ch]
        push    si
        callf   EP_FSTRNCPY_SEG:EP_FSTRNCPY_OFF
        add     sp, 0ah
        mov     es, word ptr [bp+0ch]
        mov     byte ptr es:[si+10h], 0
br_42FD4:
        mov     ax, word ptr [bp+10h]
        or      ax, word ptr [bp+0eh]
        je      br_42FFF
        push    4
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     ax, 10h
        push    dx
        push    ax
        push    word ptr [bp+10h]
        push    word ptr [bp+0eh]
        callf   EP_FSTRNCPY_SEG:EP_FSTRNCPY_OFF
        add     sp, 0ah
        les     bx, [bp+0eh]
        mov     byte ptr es:[bx+4], 0
br_42FFF:
        pop     si
        leave
        retf
name_to_filename:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     si, word ptr [bp+0ah]
        mov     di, word ptr [bp+6]
        mov     ax, word ptr [bp+0ch]
        or      ax, si
        je      br_4302B
        push    word ptr [bp+0ch]
        push    si
        push    word ptr [bp+8]
        push    di
        if      FW_VERSION <> 112
        callf   C0_SEG:EP_FSTRICMP_OFF
        else
        callf   C0_SEG:(C0_BASE+__fstricmp-C0_SEG*16)
        endif
        add     sp, 8
        or      ax, ax
        jne     br_4302B
        jmp     br_430D4
br_4302B:
        mov     ax, word ptr [bp+0ch]
        or      ax, si
        je      br_43044
        push    10h
        push    word ptr [bp+0ch]
        push    si
        push    word ptr [bp+8]
        push    di
        callf   EP_FSTRNCPY_SEG:EP_FSTRNCPY_OFF
        add     sp, 0ah
br_43044:
        mov     es, word ptr [bp+8]
        xor     si, si
        mov     byte ptr es:[di+10h], 0
        cmp     byte ptr es:[di], 0
        je      br_43088
loop_43054:
        mov     bx, di
        mov     es, word ptr [bp+8]
        and     byte ptr es:[bx+si], 7fh
        cmp     byte ptr es:[bx+si], 20h
        jge     br_4306C
        mov     es, word ptr [bp+8]
        mov     byte ptr es:[bx+si], 2ah
        jmp     br_4307E
br_4306C:
        mov     es, word ptr [bp+8]
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+C1_TBL_00748]
        mov     bx, di
        mov     byte ptr es:[bx+si], al
br_4307E:
        mov     es, word ptr [bp+8]
        inc     si
        cmp     byte ptr es:[bx+si], 0
        jne     loop_43054
br_43088:
        cmp     si, 10h
        jge     br_430A1
        mov     ax, 2020h
        les     bx, [bp+6]
        mov     cx, 10h
        sub     cx, si
        lea     di, [bx+si]
        shr     cx, 1
        rep stosw
        jae     br_430A1
        stosb
br_430A1:
        mov     si, 0fh
        les     bx, [bp+6]
        cmp     byte ptr es:[bx+0fh], 20h
        jne     br_430B5
loop_430AE:
        dec     si
        cmp     byte ptr es:[bx+si], 20h
        je      loop_430AE
br_430B5:
        or      si, si
        jl      br_430D4
        mov     di, word ptr [bp+6]
loop_430BC:
        mov     bx, di
        mov     es, word ptr [bp+8]
        cmp     byte ptr es:[bx+si], 2ah
        je      L_42ACD
        cmp     byte ptr es:[bx+si], 20h
        jne     br_430D1
L_42ACD:
        mov     byte ptr es:[bx+si], 5fh
br_430D1:
        dec     si
        jns     loop_430BC
br_430D4:
        pop     si
        pop     di
        leave
        retf
disk_progress_msg:
        enter   4, 0
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        cmp     word ptr [bp+0ah], 0
        je      br_430F0
        mov     ax, (C1_BASE+L_4322C-C1_SEG*16)
        mov     dx, C1_SEG
        jmp     SHORT br_430F6
br_430F0:
        mov     ax, (C1_BASE+L_43234-C1_SEG*16)
        mov     dx, C1_SEG
br_430F6:
        push    dx
        push    ax
        callf   EP_DISP_MESSAGE_WINDOW_SEG:EP_DISP_MESSAGE_WINDOW_OFF
        leave
        retf
        db      90h
ALL_PGMS_NAME:
        db      "ALL_PGMS        "
        db      00h, 00h
L_42B12:
        db      ".SND"
        db      00h, 00h
L_43118:
        db      ".PGM"
        db      00h, 00h
L_4311E:
        db      ".APS"
        db      00h, 00h
L_43124:
        db      ".SET"
        db      00h, 00h
L_4312A:
        db      ".ST1"
        db      00h, 00h
L_43130:
        db      ".WAV"
        db      00h, 00h
L_43136:
        db      ".S3 "
        db      00h, 00h
L_4313C:
        db      ".S1 "
        db      00h, 00h
L_43142:
        db      ".EMU"
        db      00h, 00h
L_43148:
        db      ".RLD"
        db      00h, 00h
msg_disk_errors:
        db      "Unknown file type"
        db      00h
L_43160:
        db      "Disk is write protected"
        db      00h
far_43178:
        db      "File directory full"
        db      00h
far_4318C:
        db      "Insufficient disk space"
        db      00h
far_431A4:
        db      "Wrong disk format"
        db      00h
L_431B6:
        db      "disk write error"
        db      00h, 00h
far_431C8:
        db      "Unexpected end-of-file"
        db      00h, 00h
far_431E0:
        db      "No disk"
        db      00h
far_431E8:
        db      "Can't open file"
        db      00h
L_431F8:
        db      "disk read error"
        db      00h
L_43208:
        db      "Unknown disk error"
        db      00h, 00h
L_4321C:
        db      "file seek error"
        db      00h
L_4322C:
        db      "Saving "
        db      00h
L_43234:
        db      "Loading "
        db      00h, 00h
fn_4323E:
        if      FW_VERSION >= 110
        enter   3ch, 0
        else
        enter   3ah, 0
        endif
        push    di
        push    si
        mov     bx, word ptr [bp+8]
        mov     ax, bx
        mov     dx, word ptr [bp+0ah]
        add     ah, 11h
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     word ptr [bp-4], bx
        mov     word ptr [bp-2], dx
        mov     word ptr [bp-0ah], 100h
loop_43260:
        les     bx, [bp-4]
        cmp     byte ptr es:[bx], 0
        jne     br_4326C
        jmp     br_43308
br_4326C:
        push    es
        push    bx
        lea     ax, [bp-10h]
        push    ss
        push    ax
        nop
        push    cs
        call    far_3FE9E
        add     sp, 8
        or      ax, ax
        jne     br_432F8
        callf   EP_FAR_37E82_SEG:EP_FAR_37E82_OFF
        cmp     ax, 2
        je      br_43308
        push    ds
        lea     si, [bp-26h]
        mov     cx, ss
        mov     ds, cx
        les     di, [bp-4]
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
        mov     bx, (C1_BASE+L_42B12-C1_SEG*16)
        mov     ax, C1_SEG
        push    ds
        mov     di, bx
        lea     si, [bp-26h]
        mov     es, ax
        mov     cx, ss
        mov     ds, cx
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        push    cx
        xchg    di, si
        push    ds
        push    es
        pop     ds
        pop     es
        mov     cx, 0ffffh
        repne scasb
        dec     di
        pop     cx
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        lea     ax, [bp-26h]
        push    ss
        push    ax
        lea     ax, [bp-10h]
        push    ss
        push    ax
        nop
        push    cs
        call    far_452D0
        add     sp, 8
        or      dx, ax
        jne     br_43308
br_432F8:
        mov     ax, word ptr [bp-10h]
        mov     dx, word ptr [bp-0eh]
        les     bx, [bp-8]
        mov     word ptr es:[bx], ax
        mov     word ptr es:[bx+2], dx
br_43308:
        add     word ptr [bp-8], 4
        add     word ptr [bp-4], 11h
        dec     word ptr [bp-0ah]
        je      br_43318
        jmp     loop_43260
br_43318:
        xor     ax, ax
        if      FW_VERSION >= 110
        mov     word ptr [bp-1ch], ax
        else
        mov     word ptr [bp-1ah], ax
        endif
        mov     word ptr [bp-0ch], ax
        mov     bx, word ptr [bp+8]
        mov     ax, bx
        mov     dx, word ptr [bp+0ah]
        add     ah, 11h
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     word ptr [bp-8], bx
        mov     word ptr [bp-6], dx
loop_43337:
        les     bx, [bp-8]
        cmp     byte ptr es:[bx], 0
        jne     br_43343
        jmp     br_434E3
br_43343:
        push    ds
        if      FW_VERSION >= 110
        lea     si, [bp-32h]
        else
        lea     si, [bp-30h]
        endif
        mov     cx, ss
        mov     ds, cx
        les     di, [bp-8]
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
        mov     bx, (C1_BASE+L_42B12-C1_SEG*16)
        mov     ax, C1_SEG
        push    ds
        mov     di, bx
        if      FW_VERSION >= 110
        lea     si, [bp-32h]
        else
        lea     si, [bp-30h]
        endif
        mov     es, ax
        mov     cx, ss
        mov     ds, cx
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        push    cx
        xchg    di, si
        push    ds
        push    es
        pop     ds
        pop     es
        mov     cx, 0ffffh
        repne scasb
        dec     di
        pop     cx
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        cmp     byte ptr [C0_B_0D7C9], al
        jne     br_433BA
        les     bx, [bp-4]
        mov     ax, word ptr es:[bx+2]
        or      ax, word ptr es:[bx]
        je      br_433BA
loop_433AE:
        les     bx, [bp-8]
        mov     byte ptr es:[bx], 0
        jmp     br_434E3
        db      90h, 90h
br_433BA:
        if      FW_VERSION >= 110
        lea     ax, [bp-32h]
        else
        lea     ax, [bp-30h]
        endif
        push    ss
        push    ax
        lea     ax, [bp-14h]
        push    ss
        push    ax
        nop
        push    cs
        call    far_4510E
        add     sp, 8
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        mov     ax, C1_SEG
        mov     cx, (C1_BASE+L_3E1A0-C1_SEG*16)
        mov     di, 5058h
        mov     es, ax
        push    ds
        lds     si, [bp-10h]
        xor     ax, ax
        repe cmpsb
        je      br_433EC
        sbb     ax, ax
        sbb     ax, 0ffffh
br_433EC:
        pop     ds
        or      ax, ax
        jne     br_43460
        push    ds
        if      FW_VERSION >= 110
        lea     si, [bp-32h]
        else
        lea     si, [bp-30h]
        endif
        mov     cx, ss
        mov     ds, cx
        les     di, [bp-8]
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
        mov     bx, (C1_BASE+L_43130-C1_SEG*16)
        mov     ax, C1_SEG
        push    ds
        mov     di, bx
        if      FW_VERSION >= 110
        lea     si, [bp-32h]
        else
        lea     si, [bp-30h]
        endif
        mov     es, ax
        mov     cx, ss
        mov     ds, cx
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        push    cx
        xchg    di, si
        push    ds
        push    es
        pop     ds
        pop     es
        mov     cx, 0ffffh
        repne scasb
        dec     di
        pop     cx
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        if      FW_VERSION >= 110
        lea     ax, [bp-32h]
        else
        lea     ax, [bp-30h]
        endif
        push    ss
        push    ax
        lea     ax, [bp-14h]
        push    ss
        push    ax
        nop
        push    cs
        call    fn_45864
        add     sp, 8
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
br_43460:
        mov     ax, dx
        or      ax, word ptr [bp-10h]
        jne     br_434B2
        les     bx, [bp-4]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        if      FW_VERSION >= 110
        mov     word ptr [bp-36h], ax
        mov     word ptr [bp-34h], dx
        else
        mov     word ptr [bp-34h], ax
        mov     word ptr [bp-32h], dx
        endif
        or      dx, ax
        je      br_4349F
        push    word ptr [bp-12h]
        push    word ptr [bp-14h]
        if      FW_VERSION >= 110
        push    word ptr [bp-34h]
        else
        push    word ptr [bp-32h]
        endif
        push    ax
        nop
        push    cs
        call    pgm_replace_sound_ref
        add     sp, 8
        les     bx, [bp-4]
        push    word ptr es:[bx+2]
        push    word ptr es:[bx]
        nop
        push    cs
        call    sound_list_unlink
        add     sp, 4
br_4349F:
        mov     ax, word ptr [bp-14h]
        mov     dx, word ptr [bp-12h]
        les     bx, [bp-4]
        mov     word ptr es:[bx], ax
        mov     word ptr es:[bx+2], dx
        jmp     loop_433AE
br_434B2:
        mov     ax, C1_SEG
        mov     cx, (C1_BASE+L_3E1A0-C1_SEG*16)
        mov     di, 5058h
        mov     es, ax
        push    ds
        lds     si, [bp-10h]
        xor     ax, ax
        repe cmpsb
        je      br_434CC
        sbb     ax, ax
        sbb     ax, 0ffffh
br_434CC:
        pop     ds
        or      ax, ax
        jne     br_434FA
        les     bx, [bp-4]
        mov     ax, word ptr es:[bx+2]
        or      ax, word ptr es:[bx]
        je      L_42EE0
        jmp     NEAR loop_433AE
L_42EE0:
        if      FW_VERSION >= 110
        inc     word ptr [bp-1ch]
        else
        inc     word ptr [bp-1ah]
        endif
br_434E3:
        add     word ptr [bp-4], 4
        add     word ptr [bp-8], 11h
        inc     word ptr [bp-0ch]
        cmp     word ptr [bp-0ch], 0ffh
        jg      L_42EF8
        jmp     loop_43337
L_42EF8:
        jmp     SHORT br_43506
br_434FA:
        push    dx
        push    word ptr [bp-10h]
        callf   EP_DISP_ALERT_WAIT_KEY_SEG:EP_DISP_ALERT_WAIT_KEY_OFF
        add     sp, 4
br_43506:
        cmp     word ptr [bp+6], -1
        je      br_43582
        mov     bx, 8ch
        mov     ax, word ptr [bp+6]
        shl     ax, 7
        add     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        add     ah, 15h
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-8], dx
        imul    ax, word ptr [bp+6], 99eh
        if      FW_VERSION >= 110
        mov     word ptr [bp-38h], ax
        else
        mov     word ptr [bp-36h], ax
        endif
        mov     word ptr [bp-0eh], 40h
        mov     di, word ptr [bp-0ah]
loop_43534:
        if      FW_VERSION >= 110
        mov     ax, word ptr [bp-38h]
        else
        mov     ax, word ptr [bp-36h]
        endif
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-4], dx
        mov     es, word ptr [bp-8]
        mov     ax, word ptr es:[di]
        mov     word ptr [bp-2], ax
        inc     ax
        je      br_43574
        mov     ax, word ptr [bp-2]
        shl     ax, 2
        les     si, [bp+8]
        add     si, 1100h
        add     si, ax
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        les     si, [bp-6]
        mov     word ptr es:[bx+si+752h], ax
        mov     word ptr es:[bx+si+754h], dx
br_43574:
        add     bx, 4
        add     di, 2
        dec     word ptr [bp-0eh]
        jne     loop_43534
        jmp     br_4361E
br_43582:
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        add     ah, 15h
        mov     di, ax
        mov     word ptr [bp-10h], dx
        xor     si, si
        mov     word ptr [bp-14h], 18h
        if      FW_VERSION < 110
        mov     word ptr [bp+6], 18h
        endif
loop_43597:
        les     bx, [C2_FP_PGM_ARRAY]
        add     bx, si
        if      FW_VERSION >= 110
        mov     word ptr [bp-3ch], bx
        mov     word ptr [bp-3ah], es
        else
        mov     word ptr [bp-3ah], bx
        mov     word ptr [bp-38h], es
        endif
        cmp     byte ptr es:[bx+2], 0
        je      br_4360E
        mov     ax, bx
        mov     word ptr [bp-18h], bx
        mov     word ptr [bp-16h], es
        add     ax, 7deh
        mov     cx, ax
        mov     word ptr [bp-2], es
        mov     ax, word ptr [bp-10h]
        mov     word ptr [bp-8], di
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-0ah], 40h
        mov     word ptr [bp-12h], di
        mov     word ptr [bp-0eh], si
        mov     word ptr [bp-4], cx
        mov     si, cx
        mov     bx, di
loop_435D5:
        mov     es, word ptr [bp-6]
        mov     cx, word ptr es:[bx]
        cmp     cx, -1
        je      br_435FD
        shl     cx, 2
        les     di, [bp+8]
        add     di, 1100h
        add     di, cx
        mov     ax, word ptr es:[di]
        mov     dx, word ptr es:[di+2]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si], ax
        mov     word ptr es:[si+2], dx
br_435FD:
        add     si, 4
        add     bx, 2
        dec     word ptr [bp-0ah]
        jne     loop_435D5
        mov     si, word ptr [bp-0eh]
        mov     di, word ptr [bp-12h]
br_4360E:
        add     di, 80h
        add     si, 99eh
        dec     word ptr [bp-14h]
        je      br_4361E
        jmp     loop_43597
br_4361E:
        if      FW_VERSION >= 110
        cmp     word ptr [bp-1ch], 0
        else
        cmp     word ptr [bp-1ah], 0
        endif
        jne     br_4362E
        nop
        push    cs
        call    far_3E99C
        pop     si
        pop     di
        leave
        retf
        if      FW_VERSION >= 110
        db      90h
        endif
br_4362E:
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    far_43BA0
        add     sp, 6
        pop     si
        pop     di
        leave
        retf
        db      00h
L_43644:
        enter   12h, 0
        push    di
        push    si
        imul    ax, word ptr [bp+6], 99eh
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        mov     word ptr [bp-12h], ax
        mov     word ptr [bp-10h], dx
        push    80h
        push    11h
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0ch], dx
        or      dx, ax
        je      br_4367C
        jmp     br_43724
br_4367C:
        push    1
        push    1bh
        mov     ax, word ptr [bp-12h]
        mov     dx, word ptr [bp-10h]
        add     ax, 2
        push    dx
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0ch], dx
        or      dx, ax
        je      br_4369F
        jmp     br_43724
br_4369F:
        xor     si, si
        mov     ax, word ptr [bp+6]
        shl     ax, 7
        add     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        add     ah, 15h
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-8], dx
        mov     ax, word ptr [bp-12h]
        mov     dx, word ptr [bp-10h]
        add     ax, 1eh
        mov     word ptr [bp-4], dx
        mov     word ptr [bp-6], ax
        mov     di, ax
loop_436C7:
        push    1
        push    1
        lea     ax, [bp-1]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     word ptr [bp-0eh], ax
        mov     word ptr [bp-0ch], dx
        or      dx, ax
        jne     br_43721
        push    1
        push    18h
        push    1
        push    18h
        push    word ptr [bp-4]
        push    di
        nop
        push    cs
        call    fs_read_resized
        add     sp, 0ch
        mov     word ptr [bp-0eh], ax
        mov     word ptr [bp-0ch], dx
        or      dx, ax
        jne     br_43721
        cmp     byte ptr [bp-1], 0
        jge     br_4370A
        mov     byte ptr [bp-1], 0ffh
br_4370A:
        mov     al, byte ptr [bp-1]
        cbw
        les     bx, [bp-0ah]
        add     word ptr [bp-0ah], 2
        mov     word ptr es:[bx], ax
        add     di, 18h
        inc     si
        cmp     si, 40h
        jl      loop_436C7
br_43721:
        mov     si, word ptr [bp-0eh]
br_43724:
        mov     ax, word ptr [bp-0ch]
        or      ax, si
        jne     br_4376B
        push    40h
        push    6
        push    40h
        push    4
        mov     ax, word ptr [bp-12h]
        mov     dx, word ptr [bp-10h]
        add     ax, 61eh
        push    dx
        push    ax
        nop
        push    cs
        call    fs_read_resized
        add     sp, 0ch
        mov     si, ax
        mov     word ptr [bp-0ch], dx
        or      dx, ax
        jne     br_4376B
        push    40h
        push    1
        mov     ax, word ptr [bp-12h]
        mov     dx, word ptr [bp-10h]
        add     ax, 79eh
        push    dx
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0ch], dx
br_4376B:
        mov     ax, si
        mov     dx, word ptr [bp-0ch]
        pop     si
        pop     di
        leave
        retf
pgm_file_read:
        enter   1ah, 0
        push    di
        push    si
        xor     ax, ax
        cwd
        mov     si, ax
        mov     word ptr [bp-10h], dx
        imul    ax, word ptr [bp+6], 99eh
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        mov     word ptr [bp-16h], ax
        mov     word ptr [bp-14h], dx
        cmp     word ptr [bp+0ch], si
        je      br_437D1
        push    1
        push    2
        lea     ax, [bp-18h]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-10h], dx
        or      dx, ax
        jne     br_437D1
        push    100h
        push    11h
        push    word ptr [bp-18h]
        push    11h
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        nop
        push    cs
        call    fs_read_resized
        add     sp, 0ch
        mov     si, ax
        mov     word ptr [bp-10h], dx
br_437D1:
        mov     ax, word ptr [bp-10h]
        or      ax, si
        je      br_437DB
        jmp     br_4392F
br_437DB:
        push    1
        push    2
        lea     ax, [bp-1ah]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-10h], dx
        or      dx, ax
        je      br_437F8
        jmp     br_4392F
br_437F8:
        push    1
        push    1ch
        push    1
        mov     ax, word ptr [bp-1ah]
        sub     ax, 2
        push    ax
        mov     ax, word ptr [bp-16h]
        mov     dx, word ptr [bp-14h]
        add     ax, 2
        push    dx
        push    ax
        nop
        push    cs
        call    fs_read_resized
        add     sp, 0ch
        mov     si, ax
        mov     word ptr [bp-10h], dx
        or      dx, ax
        je      br_43824
        jmp     br_4392F
br_43824:
        push    1
        push    2
        lea     ax, [bp-18h]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-10h], dx
        or      dx, ax
        je      br_43841
        jmp     br_4392F
br_43841:
        push    1
        push    2
        lea     ax, [bp-1ah]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-10h], dx
        or      dx, ax
        je      br_4385E
        jmp     br_4392F
br_4385E:
        cmp     word ptr [bp+0eh], 0
        je      br_4386A
        sub     word ptr [bp-1ah], 2
        jmp     br_4386D
br_4386A:
        dec     word ptr [bp-1ah]
br_4386D:
        mov     word ptr [bp-0eh], 0
        cmp     word ptr [bp-18h], 0
        jne     br_4387B
        jmp     br_4392F
br_4387B:
        mov     ax, word ptr [bp-16h]
        mov     dx, word ptr [bp-14h]
        add     ax, 1eh
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     ax, word ptr [bp+6]
        shl     ax, 7
        add     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        add     ah, 15h
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
loop_4389F:
        cmp     word ptr [bp+0eh], 0
        je      br_438C0
        push    1
        push    2
        lea     ax, [bp-2]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-10h], dx
        mov     di, word ptr [bp-2]
        jmp     br_438DC
br_438C0:
        push    1
        push    1
        lea     ax, [bp-1]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-10h], dx
        mov     al, byte ptr [bp-1]
        cbw
        mov     di, ax
br_438DC:
        mov     ax, dx
        or      ax, si
        jne     br_43913
        mov     word ptr [bp-4], di
        or      di, di
        jge     br_438EE
        mov     word ptr [bp-4], 0ffffh
br_438EE:
        mov     ax, word ptr [bp-4]
        les     bx, [bp-0ch]
        mov     word ptr es:[bx], ax
        push    1
        push    18h
        push    1
        push    word ptr [bp-1ah]
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        nop
        push    cs
        call    fs_read_resized
        add     sp, 0ch
        mov     si, ax
        mov     word ptr [bp-10h], dx
br_43913:
        mov     ax, dx
        or      ax, si
        jne     br_4392F
        add     word ptr [bp-8], 18h
        add     word ptr [bp-0ch], 2
        mov     ax, word ptr [bp-18h]
        inc     word ptr [bp-0eh]
        cmp     word ptr [bp-0eh], ax
        jae     br_4392F
        jmp     loop_4389F
br_4392F:
        mov     ax, word ptr [bp-10h]
        or      ax, si
        je      br_43939
        jmp     br_43A77
br_43939:
        push    1
        push    2
        lea     ax, [bp-1ah]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-10h], dx
        or      dx, ax
        je      br_43956
        jmp     br_43A77
br_43956:
        push    40h
        push    6
        push    word ptr [bp-18h]
        push    word ptr [bp-1ah]
        mov     ax, word ptr [bp-16h]
        mov     dx, word ptr [bp-14h]
        add     ax, 61eh
        push    dx
        push    ax
        nop
        push    cs
        call    fs_read_resized
        add     sp, 0ch
        mov     si, ax
        mov     word ptr [bp-10h], dx
        or      dx, ax
        je      br_4397F
        jmp     br_43A77
br_4397F:
        push    1
        push    2
        lea     ax, [bp-18h]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-10h], dx
        or      dx, ax
        je      br_4399C
        jmp     br_43A77
br_4399C:
        push    40h
        push    1
        push    word ptr [bp-18h]
        push    1
        mov     ax, word ptr [bp-16h]
        mov     dx, word ptr [bp-14h]
        add     ax, 79eh
        push    dx
        push    ax
        nop
        push    cs
        call    fs_read_resized
        add     sp, 0ch
        mov     si, ax
        mov     word ptr [bp-10h], dx
        or      dx, ax
        je      br_439C4
        jmp     br_43A77
br_439C4:
        push    1
        push    2
        lea     ax, [bp-18h]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-10h], dx
        or      dx, ax
        je      br_439E1
        jmp     br_43A77
br_439E1:
        push    1
        push    2
        lea     ax, [bp-1ah]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-10h], dx
        or      dx, ax
        jne     br_43A77
        push    2
        push    48h
        push    word ptr [bp-18h]
        push    word ptr [bp-1ah]
        mov     ax, word ptr [bp-16h]
        mov     dx, word ptr [bp-14h]
        add     ax, 8deh
        push    dx
        push    ax
        nop
        push    cs
        call    fs_read_resized
        add     sp, 0ch
        mov     si, ax
        mov     word ptr [bp-10h], dx
        or      dx, ax
        jne     br_43A77
        push    1
        push    2
        lea     ax, [bp-18h]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-10h], dx
        or      dx, ax
        jne     br_43A77
        push    1
        push    2
        lea     ax, [bp-1ah]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-10h], dx
        or      dx, ax
        jne     br_43A77
        push    4
        push    0ch
        push    word ptr [bp-18h]
        push    word ptr [bp-1ah]
        mov     ax, word ptr [bp-16h]
        mov     dx, word ptr [bp-14h]
        add     ax, PGM_FX_REVERBS
        push    dx
        push    ax
        nop
        push    cs
        call    fs_read_resized
        add     sp, 0ch
        mov     si, ax
        mov     word ptr [bp-10h], dx
br_43A77:
        mov     ax, si
        mov     dx, word ptr [bp-10h]
        pop     si
        pop     di
        leave
        retf
L_43A80:
        db      "Disk requires newer OS!", 00h
L_43A98:
        db      "Wrong file format", 00h
load_set_clear:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        cmp     byte ptr [C1_B_08B02], 0
        jne     br_43AC4
        push    1
        callf   EP_L_391F8_SEG:EP_L_391F8_OFF
        add     sp, 2
        pop     ds
        retf
        db      90h
br_43AC4:
        push    1
        callf   EP_L_3B2B8_SEG:EP_L_3B2B8_OFF
        add     sp, 2
        pop     ds
        retf
load_set_cancel:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_3E99C
        pop     ds
        retf
        db      00h
load_set_load:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        cmp     byte ptr [C1_B_08B02], 0
        jne     br_43AF8
        push    0
        callf   EP_L_391F8_SEG:EP_L_391F8_OFF
        add     sp, 2
        pop     ds
        retf
        nop
br_43AF8:
        push    0
        callf   EP_L_3B2B8_SEG:EP_L_3B2B8_OFF
        add     sp, 2
        pop     ds
        retf
load_set_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        cmp     byte ptr [C1_B_08B02], 0
        jne     br_43B1A
        mov     ax, C1_W_059E4
        mov     dx, C1_SEG
        jmp     br_43B20
        db      90h
br_43B1A:
        mov     ax, C1_W_059F4
        mov     dx, C1_SEG
br_43B20:
        push    dx
        push    ax
        nop
        push    cs
        call    far_3ED98
        add     sp, 4
        push    ds
        push    C1_W_007E8
        nop
        push    cs
        call    disp_list_run
        add     sp, 4
        cmp     byte ptr [C0_B_0D7C9], 0
        je      br_43B46
        mov     ax, C1_W_05A00
        mov     dx, C1_SEG
        jmp     br_43B4C
        db      90h
br_43B46:
        mov     ax, C1_W_05A04
        mov     dx, C1_SEG
br_43B4C:
        push    dx
        push    ax
        push    15h
        push    59h
        nop
        push    cs
        call    draw_string_at
        add     sp, 8
        nop
        push    cs
        call    EP_FIELD_ENGINE_REDRAW_OFF+C1_CSBASE
        pop     ds
        retf
        db      00h
L_43B62:
        push    ds
        push    C0_B_0D7C9
        push    ds
        push    C1_W_0086E
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      90h
        db      "Load a Program"
        db      00h, 00h
L_43254:
        db      "Load a SET"
        db      00h, 00h, 59h, 45h, 53h, 00h
        db      "NO(FASTER)"
        db      00h, 00h
far_43BA0:
        enter   4, 0
        push    si
        mov     bx, word ptr [bp+8]
        mov     ax, word ptr [bp+6]
        mov     word ptr [C1_W_08B06], ax
        mov     ax, word ptr [bp+0ah]
        mov     word ptr [C1_W_08B08], bx
        mov     word ptr [C1_W_08B0A], ax
        xor     cx, cx
        mov     si, bx
        mov     word ptr [bp-2], ax
loop_43BBF:
        mov     es, word ptr [bp-2]
        cmp     byte ptr es:[si], 0
        jne     br_43BD4
        add     si, 11h
        inc     cx
        cmp     cx, 0ffh
        jle     loop_43BBF
        jmp     br_43BD8
br_43BD4:
        mov     word ptr [C1_W_08B04], cx
br_43BD8:
        push    ds
        push    C1_W_00898
        nop
        push    cs
        call    handler_set_install
        add     sp, 4
        callf   EP_FAR_37E82_SEG:EP_FAR_37E82_OFF
        or      ax, ax
        jne     br_43BFD
        push    EP_FS_OPEN_SEG
        push    EP_FAR_43C44_OFF
        push    6
        nop
        push    cs
        call    handler_install_one
        add     sp, 6
br_43BFD:
        callf   [C1_FP_00998]
        nop
        push    cs
        call    disp_request_flush
        pop     si
        leave
        retf
        db      00h
cant_find_file_al_skp:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_3E99C
        pop     ds
        retf
        db      00h
cant_find_file_skip:
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        imul    bx, word ptr [C1_W_08B04], 11h
        les     si, [C1_W_08B08]
        mov     byte ptr es:[bx+si], 0
        push    word ptr [C1_W_08B0A]
        push    word ptr [C1_W_08B08]
        push    word ptr [C1_W_08B06]
        nop
        push    cs
        call    fn_4323E
        add     sp, 6
        pop     ds
        pop     si
        retf
        db      00h
far_43C44:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   EP_DISK_MEDIA_READY_CHECK_SEG:EP_DISK_MEDIA_READY_CHECK_OFF
        or      ax, ax
        jne     br_43C64
        push    EP_MSG_CHANGE_DISK_SEG
        push    EP_MSG_CHANGE_DISK_OFF
        callf   EP_DISP_ALERT_WAIT_KEY_SEG:EP_DISP_ALERT_WAIT_KEY_OFF
        add     sp, 4
        pop     ds
        retf
        db      90h
br_43C64:
        push    word ptr [C1_W_08B0A]
        push    word ptr [C1_W_08B08]
        push    word ptr [C1_W_08B06]
        nop
        push    cs
        call    fn_4323E
        add     sp, 6
        pop     ds
        retf
cant_find_file_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    EP_FS_OPEN_SEG
        push    EP_FAR_4343E_OFF
        nop
        push    cs
        call    far_3ED98
        add     sp, 4
        push    ds
        push    C1_W_008B2
        nop
        push    cs
        call    disp_list_run
        add     sp, 4
        imul    ax, word ptr [C1_W_08B04], 11h
        add     ax, word ptr [C1_W_08B08]
        mov     dx, word ptr [C1_W_08B0A]
        push    dx
        push    ax
        push    0dh
        push    79h
        nop
        push    cs
        call    draw_string_at
        add     sp, 8
        callf   EP_FAR_37E82_SEG:EP_FAR_37E82_OFF
        or      ax, ax
        jne     br_43CC4
        push    ds
        push    C1_W_008DA
        jmp     br_43CC8
br_43CC4:
        push    ds
        push    C1_W_0094E
br_43CC8:
        nop
        push    cs
        call    disp_list_run
        add     sp, 4
        nop
        push    cs
        call    EP_FIELD_ENGINE_REDRAW_OFF+C1_CSBASE
        pop     ds
        retf
        db      00h
far_43CD8:
        mov     ax, word ptr [C1_W_08B04]
        mov     word ptr [C0_B_098B8], ax
        push    ds
        push    C0_B_098B8
        push    ds
        push    C1_W_0098A
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
far_43CF0:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     di, word ptr [bp+6]
        imul    bx, di, 11h
        les     si, [C1_W_08B08]
        cmp     byte ptr es:[bx+si], 0
        jne     br_43D46
        cmp     word ptr [C1_W_08B04], di
        jge     br_43D2A
        cmp     di, 0ffh
        jg      br_43D4A
        imul    ax, di, 11h
        add     ax, si
        mov     bx, ax
loop_43D18:
        cmp     byte ptr es:[bx], 0
        jne     br_43D46
        add     bx, 11h
        inc     di
        cmp     di, 0ffh
        jle     loop_43D18
        jmp     br_43D4A
br_43D2A:
        or      di, di
        jle     br_43D4A
        imul    ax, di, 11h
        add     ax, si
        mov     bx, ax
loop_43D35:
        cmp     byte ptr es:[bx], 0
        jne     br_43D46
        sub     bx, 11h
        dec     di
        or      di, di
        jg      loop_43D35
        jmp     br_43D4A
        db      90h
br_43D46:
        mov     word ptr [C1_W_08B04], di
br_43D4A:
        mov     ax, word ptr [C1_W_08B04]
        mov     word ptr [C0_B_098B8], ax
        pop     si
        pop     di
        leave
        retf
msg_change_disk:
        db      "Change disk to continue!!"
        db      00h
far_4343E:
        db      "Can't find file !!"
        db      00h, 00h
L_43D82:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     ax, C1_SEG
        push    ds
        mov     si, 4f70h
        mov     ds, ax
        les     di, [bp+6]
        mov     cx, 8
        rep movsw
        movsb
        pop     ds
        mov     bx, word ptr [bp+6]
        or      byte ptr es:[bx+11h], 1
        and     byte ptr es:[bx+12h], 0feh
        and     byte ptr es:[bx+13h], 0fch
        or      byte ptr es:[bx+14h], 1
        and     byte ptr es:[bx+14h], 0efh
        xor     al, al
        mov     byte ptr es:[bx+15h], al
        mov     byte ptr es:[bx+16h], al
        mov     al, byte ptr [C1_B_0D775]
        mov     byte ptr es:[bx+17h], al
        pop     si
        pop     di
        leave
        retf
        db      00h
far_43DCC:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     di, C1_TBL_APS_NAME
        mov     cx, ds
        mov     es, cx
        push    ds
        lds     si, [bp+6]
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
        les     bx, [bp+6]
        mov     al, byte ptr [C0_B_0D776]
        mov     cx, word ptr es:[bx+11h]
        xor     al, cl
        and     ax, 1
        xor     cx, ax
        mov     ah, byte ptr [C2_B_PAD_ASSIGN_MASTER]
        xor     ah, ch
        and     ax, 100h
        xor     cx, ax
        mov     word ptr es:[bx+11h], cx
        les     bx, [bp+6]
        mov     al, byte ptr [C0_B_0D7B8]
        mov     cx, word ptr es:[bx+13h]
        xor     al, cl
        and     ax, 1
        xor     cx, ax
        mov     al, byte ptr [C0_B_0D7B9]
        add     al, al
        xor     al, cl
        and     ax, 2
        xor     cx, ax
        mov     ah, byte ptr [C1_B_0D7BA]
        xor     ah, ch
        and     ax, 100h
        xor     cx, ax
        mov     al, byte ptr [C2_B_RECORD_MIX_CHANGES]
        cbw
        shl     ax, 0ch
        xor     ah, ch
        and     ax, 1000h
        xor     cx, ax
        mov     word ptr es:[bx+13h], cx
        mov     al, byte ptr [C2_B_MIXER_DRUM]
        les     bx, [bp+6]
        mov     byte ptr es:[bx+15h], al
        mov     al, byte ptr [C1_B_0D7BD]
        les     bx, [bp+6]
        mov     byte ptr es:[bx+16h], al
        mov     al, byte ptr [C1_B_0D775]
        mov     byte ptr es:[bx+17h], al
        pop     si
        pop     di
        leave
        retf
        db      00h
L_43E70:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     si, C1_TBL_APS_NAME
        push    ds
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
        les     bx, [bp+6]
        mov     al, byte ptr es:[bx+11h]
        and     al, 1
        mov     byte ptr [C0_B_0D776], al
        mov     al, byte ptr es:[bx+12h]
        and     ax, 1
        push    ax
        nop
        push    cs
        call    pad_assign_master_set
        add     sp, 2
        les     bx, [bp+6]
        mov     al, byte ptr es:[bx+13h]
        and     al, 1
        mov     byte ptr [C0_B_0D7B8], al
        mov     ax, word ptr es:[bx+13h]
        shr     ax, 1
        and     al, 1
        mov     byte ptr [C0_B_0D7B9], al
        mov     al, byte ptr es:[bx+14h]
        and     al, 1
        mov     byte ptr [C1_B_0D7BA], al
        mov     ax, word ptr es:[bx+13h]
        shr     ax, 0ch
        and     al, 1
        mov     byte ptr [C2_B_RECORD_MIX_CHANGES], al
        mov     al, byte ptr es:[bx+15h]
        mov     byte ptr [C2_B_MIXER_DRUM], al
        mov     al, byte ptr es:[bx+16h]
        mov     byte ptr [C1_B_0D7BD], al
        mov     al, byte ptr es:[bx+17h]
        push    ax
        nop
        push    cs
        call    far_3F084
        add     sp, 2
        pop     si
        pop     di
        leave
        retf
        nop
far_43EFE:
        push    ds
        push    C1_W_009B4
        nop
        push    cs
        call    handler_set_install
        add     sp, 4
        retf
        db      00h
load_aps_cancel:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_3E99C
        pop     ds
        retf
        db      00h
load_aps_load:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   EP_L_395FC_SEG:EP_L_395FC_OFF
        pop     ds
        retf
        db      00h
load_aps_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    C1_SEG
        push    EP_L_4303E_OFF
        nop
        push    cs
        call    far_3ED98
        add     sp, 4
        push    ds
        push    C1_W_009CE
        nop
        push    cs
        call    disp_list_run
        add     sp, 4
        pop     ds
        retf
L_4303E:
        db      "Load APS file"
        db      00h
pgm_save_to_disk:
        enter   8, 0
        xor     ax, ax
        mov     dx, 7c00h
        push    dx
        push    ax
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        mov     al, byte ptr [bp+6]
        push    ax
        nop
        push    cs
        call    far_43FA8
        add     sp, 0ah
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_43F8A
        push    word ptr [bp-2]
        push    ax
        callf   EP_DISP_ALERT_WAIT_KEY_SEG:EP_DISP_ALERT_WAIT_KEY_OFF
        add     sp, 4
        jmp     br_43FA0
br_43F8A:
        cmp     byte ptr [C1_B_0D7C8], 0
        je      br_43FA0
        push    7c00h
        push    0
        nop
        push    cs
        call    far_444F6
        add     sp, 4
        leave
        retf
br_43FA0:
        nop
        push    cs
        call    far_3E99C
        leave
        retf
        db      00h
far_43FA8:
        enter   4, 0
        push    si
        push    1
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        nop
        push    cs
        call    disk_progress_msg
        add     sp, 6
        push    1
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        nop
        push    cs
        call    fs_open
        add     sp, 6
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     br_43FFC
        push    word ptr [bp+0eh]
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        mov     al, byte ptr [bp+6]
        push    ax
        nop
        push    cs
        call    far_4400A
        add     sp, 0ah
        mov     si, ax
        mov     word ptr [bp-2], dx
        if      FW_VERSION >= 112
        or      dx, ax
        jne     br_43FFC
        endif
        callf   EP_DISK_FILE_CLOSE_SEG:EP_DISK_FILE_CLOSE_OFF
br_43FFC:
        nop
        push    cs
        call    field_handler_nop
        mov     ax, si
        mov     dx, word ptr [bp-2]
        pop     si
        leave
        retf
        db      00h
far_4400A:
        enter   3eh, 0
        push    di
        push    si
        mov     al, byte ptr [bp+6]
        cbw
        imul    ax, ax, 99eh
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        mov     word ptr [bp-14h], ax
        mov     word ptr [bp-12h], dx
        mov     byte ptr [bp-1ch], 7
        mov     byte ptr [bp-1bh], 4
        push    ds
        lea     di, [bp-3ch]
        mov     si, ax
        push    ss
        pop     es
        mov     ds, dx
        mov     cx, 0fh
        rep movsw
        pop     ds
        mov     word ptr [bp-3ch], 1eh
        mov     ax, word ptr [bp+0ah]
        or      ax, word ptr [bp+8]
        jne     br_44052
        xor     si, si
        mov     di, 1
        jmp     br_4406C
br_44052:
        push    10h
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        lea     ax, [bp-3ah]
        push    ss
        push    ax
        callf   EP_FSTRNCPY_SEG:EP_FSTRNCPY_OFF
        add     sp, 0ah
        mov     si, 1
        xor     di, di
br_4406C:
        push    1
        push    2
        lea     ax, [bp-1ch]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_4408A
        jmp     br_441D6
br_4408A:
        or      si, si
        jne     br_44091
        jmp     br_441DC
br_44091:
        push    word ptr [bp+0eh]
        push    word ptr [bp+0ch]
        mov     al, byte ptr [bp+6]
        cbw
        push    ax
        nop
        push    cs
        call    far_4434A
        add     sp, 6
        mov     word ptr [bp-1eh], ax
        push    1
        push    2
        lea     ax, [bp-1eh]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        jne     loop_440D9
        push    word ptr [bp-1eh]
        push    11h
        push    word ptr [bp+0eh]
        push    word ptr [bp+0ch]
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0eh], dx
loop_440D9:
        mov     ax, word ptr [bp-0eh]
        or      ax, si
        je      br_440E3
        jmp     br_44341
br_440E3:
        push    1
        push    1eh
        lea     ax, [bp-3ch]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_44100
        jmp     br_44341
br_44100:
        mov     word ptr [bp-18h], 40h
        mov     word ptr [bp-1ah], 19h
        or      di, di
        je      br_44113
        mov     word ptr [bp-1ah], 1ah
br_44113:
        push    1
        push    2
        lea     ax, [bp-18h]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_44130
        jmp     br_441F2
br_44130:
        push    1
        push    2
        lea     ax, [bp-1ah]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_4414D
        jmp     br_441F2
br_4414D:
        mov     word ptr [bp-6], 0
        cmp     word ptr [bp-18h], 0
        jg      br_4415B
        jmp     br_441F2
br_4415B:
        mov     ax, word ptr [bp-14h]
        mov     dx, word ptr [bp-12h]
        add     ax, 1eh
        mov     cx, ax
        mov     word ptr [bp-8], dx
        mov     al, byte ptr [bp+6]
        cbw
        shl     ax, 7
        add     ax, word ptr [bp+0ch]
        mov     dx, word ptr [bp+0eh]
        add     ah, 15h
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        cmp     di, 1
        sbb     ax, ax
        add     ax, 2
        mov     word ptr [bp-3eh], ax
        mov     si, word ptr [bp-6]
        mov     word ptr [bp-0ah], cx
        mov     word ptr [bp-0ch], di
        mov     di, cx
loop_44195:
        les     bx, [bp-4]
        mov     ax, word ptr es:[bx]
        mov     word ptr [bp-16h], ax
        push    1
        push    word ptr [bp-3eh]
        lea     ax, [bp-16h]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        jne     br_441EF
        push    1
        push    18h
        push    word ptr [bp-8]
        push    di
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        jne     br_441EF
        jmp     br_441E2
br_441D6:
        mov     si, ax
        jmp     br_44341
        db      90h
br_441DC:
        mov     si, ax
        jmp     loop_440D9
        db      90h
br_441E2:
        add     di, 18h
        add     word ptr [bp-4], 2
        inc     si
        cmp     word ptr [bp-18h], si
        jg      loop_44195
br_441EF:
        mov     si, word ptr [bp-10h]
br_441F2:
        mov     ax, word ptr [bp-0eh]
        or      ax, si
        je      br_441FC
        jmp     br_44341
br_441FC:
        mov     word ptr [bp-1ah], 6
        push    1
        push    2
        lea     ax, [bp-1ah]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_4421E
        jmp     br_44341
br_4421E:
        push    40h
        push    6
        mov     ax, word ptr [bp-14h]
        mov     dx, word ptr [bp-12h]
        add     ax, 61eh
        push    dx
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_44241
        jmp     br_44341
br_44241:
        mov     word ptr [bp-18h], 40h
        push    1
        push    2
        lea     ax, [bp-18h]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_44263
        jmp     br_44341
br_44263:
        push    40h
        push    1
        mov     ax, word ptr [bp-14h]
        mov     dx, word ptr [bp-12h]
        add     ax, 79eh
        push    dx
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_44286
        jmp     br_44341
br_44286:
        mov     word ptr [bp-18h], 2
        mov     word ptr [bp-1ah], 48h
        push    1
        push    2
        lea     ax, [bp-18h]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_442AD
        jmp     br_44341
br_442AD:
        push    1
        push    2
        lea     ax, [bp-1ah]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        jne     br_44341
        push    2
        push    48h
        mov     ax, word ptr [bp-14h]
        mov     dx, word ptr [bp-12h]
        add     ax, 8deh
        push    dx
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        jne     br_44341
        mov     word ptr [bp-18h], 4
        mov     word ptr [bp-1ah], 0ch
        push    1
        push    2
        lea     ax, [bp-18h]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        jne     br_44341
        push    1
        push    2
        lea     ax, [bp-1ah]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        jne     br_44341
        push    4
        push    0ch
        mov     ax, word ptr [bp-14h]
        mov     dx, word ptr [bp-12h]
        add     ax, PGM_FX_REVERBS
        push    dx
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0eh], dx
br_44341:
        mov     ax, si
        mov     dx, word ptr [bp-0eh]
        pop     si
        pop     di
        leave
        retf
far_4434A:
        enter   1ah, 0
        push    di
        push    si
        mov     cx, word ptr [bp+6]
        or      cx, cx
        jl      br_443B6
        cmp     cx, 17h
        jg      br_443B6
        mov     cx, word ptr [bp+8]
        mov     ax, cx
        mov     dx, word ptr [bp+0ah]
        add     ah, 11h
        mov     word ptr [bp-6], dx
        mov     word ptr [bp-4], cx
        mov     word ptr [bp-2], dx
        mov     word ptr [bp-0ah], 100h
        mov     bx, cx
        mov     word ptr [bp-8], ax
        mov     di, ax
        mov     cx, word ptr [bp-0ah]
loop_4437F:
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[bx], 0
        mov     es, word ptr [bp-6]
        mov     si, di
        add     di, 4
        sub     ax, ax
        mov     word ptr es:[si+2], ax
        mov     word ptr es:[si], ax
        add     bx, 11h
        dec     cx
        jne     loop_4437F
        mov     ax, 0ffffh
        mov     si, word ptr [bp+6]
        shl     si, 7
        les     bx, [bp+8]
        mov     cx, 40h
        lea     di, [bx+si+1500h]
        rep stosw
        xor     di, di
        jmp     br_443BD
br_443B6:
        nop
        push    cs
        call    far_3FE60
        mov     di, ax
br_443BD:
        xor     bx, bx
        mov     word ptr [bp-10h], di
loop_443C2:
        mov     cx, word ptr [bp+6]
        or      cx, cx
        jl      br_443D0
        cmp     cx, 17h
        jg      br_443D0
        mov     bx, cx
br_443D0:
        imul    ax, bx, 99eh
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        add     ax, 7deh
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-8], dx
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        mov     cx, bx
        shl     cx, 7
        add     ax, cx
        add     ah, 15h
        mov     word ptr [bp-0eh], ax
        mov     word ptr [bp-0ch], dx
        mov     word ptr [bp-12h], 40h
        mov     word ptr [bp-16h], bx
loop_44403:
        les     bx, [bp-0eh]
        mov     word ptr es:[bx], 0ffffh
        les     bx, [bp-0ah]
        push    word ptr es:[bx+2]
        push    word ptr es:[bx]
        nop
        push    cs
        call    sound_list_contains
        add     sp, 4
        or      ax, ax
        jne     br_44424
        jmp     br_444C7
br_44424:
        xor     bx, bx
        cmp     word ptr [bp-10h], bx
        jle     br_4445F
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        add     ah, 11h
        mov     di, ax
        mov     word ptr [bp-4], dx
        mov     cx, word ptr [bp-0ah]
loop_4443C:
        mov     es, word ptr [bp-4]
        mov     ax, word ptr es:[di]
        mov     dx, word ptr es:[di+2]
        mov     es, word ptr [bp-8]
        mov     si, cx
        cmp     word ptr es:[si], ax
        jne     br_44456
        cmp     word ptr es:[si+2], dx
        je      br_4445F
br_44456:
        add     di, 4
        inc     bx
        cmp     word ptr [bp-10h], bx
        jg      loop_4443C
br_4445F:
        mov     word ptr [bp-2], bx
        mov     ax, bx
        les     bx, [bp-0eh]
        mov     word ptr es:[bx], ax
        cmp     ax, word ptr [bp-10h]
        jne     br_444C7
        les     bx, [bp-0ah]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        mov     si, word ptr [bp-2]
        shl     si, 2
        les     bx, [bp+8]
        mov     word ptr es:[bx+si+1100h], ax
        mov     word ptr es:[bx+si+1102h], dx
        imul    ax, word ptr [bp-2], 11h
        add     bh, 11h
        mov     di, word ptr es:[bx+si]
        mov     cx, word ptr es:[bx+si+2]
        add     di, 12h
        add     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        push    ds
        mov     si, ax
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
        inc     word ptr [bp-10h]
br_444C7:
        add     word ptr [bp-0ah], 4
        add     word ptr [bp-0eh], 2
        dec     word ptr [bp-12h]
        je      br_444D7
        jmp     loop_44403
br_444D7:
        cmp     word ptr [bp+6], 0
        jl      br_444E3
        cmp     word ptr [bp+6], 17h
        jle     br_444EF
br_444E3:
        mov     bx, word ptr [bp-16h]
        inc     bx
        cmp     bx, 17h
        jg      br_444EF
        jmp     loop_443C2
br_444EF:
        mov     ax, word ptr [bp-10h]
        pop     si
        pop     di
        leave
        retf
far_444F6:
        enter   28h, 0
        push    di
        push    si
        mov     bx, word ptr [bp+6]
        sub     ax, ax
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-12h], ax
        mov     word ptr [bp-0eh], ax
        mov     ax, bx
        mov     dx, word ptr [bp+8]
        add     ah, 11h
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     word ptr [bp-0ch], bx
        mov     word ptr [bp-0ah], dx
loop_4451E:
        les     bx, [bp-0ch]
        cmp     byte ptr es:[bx], 0
        jne     br_4452A
        jmp     br_4462F
br_4452A:
        push    ds
        lea     si, [bp-28h]
        mov     cx, ss
        mov     ds, cx
        les     di, [bp-0ch]
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
        cmp     byte ptr [C1_B_0D7C8], 2
        jne     L_4455E
        mov     ax, (C1_BASE+L_43130-C1_SEG*16)
        mov     dx, C1_SEG
        jmp     SHORT br_44564
L_4455E:
        mov     ax, (C1_BASE+L_42B12-C1_SEG*16)
        mov     dx, C1_SEG
br_44564:
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    ds
        lea     si, [bp-28h]
        mov     cx, ss
        mov     ds, cx
        les     di, [bp-4]
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        mov     bx, cx
        xchg    di, si
        push    ds
        push    es
        pop     ds
        pop     es
        mov     cx, 0ffffh
        repne scasb
        dec     di
        mov     cx, bx
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        lea     ax, [bp-28h]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_find_file
        add     sp, 4
        or      ax, ax
        jne     br_445E6
        cmp     byte ptr [C1_B_0D7CA], 0
        je      br_4462F
        callf   EP_FAR_37E82_SEG:EP_FAR_37E82_OFF
        cmp     ax, 2
        jne     br_445CF
        cmp     byte ptr [C1_B_0D7C8], 1
        jne     br_445CF
        les     bx, [bp-8]
        les     bx, es:[bx]
        test    byte ptr es:[bx+0dh], 1
        jne     br_4462F
br_445CF:
        lea     ax, [bp-28h]
        push    ss
        push    ax
        nop
        push    cs
        call    far_42A32
        add     sp, 4
        mov     word ptr [bp-10h], dx
        or      dx, ax
        je      br_445E6
        jmp     br_44686
br_445E6:
        cmp     byte ptr [C1_B_0D7C8], 2
        jne     br_44604
        lea     ax, [bp-28h]
        push    ss
        push    ax
        les     bx, [bp-8]
        push    word ptr es:[bx+2]
        push    word ptr es:[bx]
        callf   EP_L_3A26E_SEG:EP_L_3A26E_OFF
        jmp     br_44618
        db      90h
br_44604:
        lea     ax, [bp-28h]
        push    ss
        push    ax
        les     bx, [bp-8]
        push    word ptr es:[bx+2]
        push    word ptr es:[bx]
        nop
        push    cs
        call    far_464C0
br_44618:
        add     sp, 8
        mov     word ptr [bp-12h], ax
        mov     word ptr [bp-10h], dx
        mov     ax, dx
        or      ax, word ptr [bp-12h]
        jne     loop_44644
        les     bx, [bp-0ch]
        mov     byte ptr es:[bx], 0
br_4462F:
        add     word ptr [bp-8], 4
        add     word ptr [bp-0ch], 11h
        inc     word ptr [bp-0eh]
        cmp     word ptr [bp-0eh], 0ffh
        jg      loop_44644
        jmp     loop_4451E
loop_44644:
        mov     ax, word ptr [bp-10h]
        or      ax, word ptr [bp-12h]
        je      br_4469A
        mov     ax, C1_SEG
        mov     cx, (C1_BASE+L_3E1A8-C1_SEG*16)
        mov     di, 4ffch
        mov     es, ax
        push    ds
        lds     si, [bp-12h]
        xor     ax, ax
        repe cmpsb
        je      br_44666
        sbb     ax, ax
        sbb     ax, 0ffffh
br_44666:
        pop     ds
        or      ax, ax
        jne     br_4468C
        callf   EP_FAR_37E82_SEG:EP_FAR_37E82_OFF
        or      ax, ax
        jne     br_4468C
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    far_44982
        add     sp, 4
        pop     si
        pop     di
        leave
        retf
br_44686:
        mov     word ptr [bp-12h], ax
        jmp     loop_44644
        db      90h
br_4468C:
        push    word ptr [bp-10h]
        push    word ptr [bp-12h]
        callf   EP_DISP_ALERT_WAIT_KEY_SEG:EP_DISP_ALERT_WAIT_KEY_OFF
        add     sp, 4
br_4469A:
        nop
        push    cs
        call    far_3E99C
        pop     si
        pop     di
        leave
        retf
        nop
far_446A4:
        push    ds
        push    C1_W_00A26
        nop
        push    cs
        call    handler_set_install
        add     sp, 4
        cmp     word ptr [C1_W_SAVE_PGM_CURSOR], 0
        jl      br_446BE
        cmp     word ptr [C1_W_SAVE_PGM_CURSOR], 2
        jb      br_446C4
br_446BE:
        mov     word ptr [C1_W_SAVE_PGM_CURSOR], 0
br_446C4:
        imul    bx, word ptr [C1_W_SAVE_PGM_CURSOR], 2ah
        callf   [bx+C1_TBL_00A90]
        retf
save_a_program_wipe:
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   EP_FAR_37E82_SEG:EP_FAR_37E82_OFF
        or      ax, ax
        jne     br_44749
        mov     al, byte ptr [C0_B_0D7BF]
        cbw
        imul    bx, ax, 99eh
        add     bx, word ptr [C2_FP_PGM_ARRAY]
        mov     cx, word ptr [C2_W_PGM_ARRAY_SEG]
        add     bx, 2
        mov     di, bx
        mov     si, 0d7e8h
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
        mov     bx, (C1_BASE+L_43118-C1_SEG*16)
        mov     ax, C1_SEG
        mov     di, bx
        mov     si, 0d7e8h
        mov     es, ax
        push    ds
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        push    cx
        xchg    di, si
        push    ds
        push    es
        pop     ds
        pop     es
        mov     cx, 0ffffh
        repne scasb
        dec     di
        pop     cx
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        nop
        push    cs
        call    far_469A8
br_44749:
        pop     ds
        pop     si
        pop     di
        retf
        db      00h
save_a_program_cancel:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_3E99C
        pop     ds
        retf
        db      00h
save_a_program_save:
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C0_B_0D7BF]
        cbw
        imul    bx, ax, 99eh
        add     bx, word ptr [C2_FP_PGM_ARRAY]
        mov     cx, word ptr [C2_W_PGM_ARRAY_SEG]
        add     bx, 2
        mov     di, bx
        mov     si, 0d7e8h
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
        mov     bx, (C1_BASE+L_43118-C1_SEG*16)
        mov     ax, C1_SEG
        mov     di, bx
        mov     si, 0d7e8h
        mov     es, ax
        push    ds
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        push    cx
        xchg    di, si
        push    ds
        push    es
        pop     ds
        pop     es
        mov     cx, 0ffffh
        repne scasb
        dec     di
        pop     cx
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        push    ds
        push    C0_W_0D7E8
        nop
        push    cs
        call    fs_find_file
        add     sp, 4
        or      ax, ax
        jne     br_447E2
        nop
        push    cs
        call    far_468EA
        pop     ds
        pop     si
        pop     di
        retf
br_447E2:
        push    ds
        push    C0_W_0D7E8
        mov     al, byte ptr [C0_B_0D7BF]
        push    ax
        nop
        push    cs
        call    pgm_save_to_disk
        add     sp, 6
        pop     ds
        pop     si
        pop     di
        retf
save_a_program_paint:
        enter   1ah, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C0_B_0D7BF]
        cbw
        mov     word ptr [bp-2], ax
        imul    bx, ax, 99eh
        add     bx, word ptr [C2_FP_PGM_ARRAY]
        mov     cx, word ptr [C2_W_PGM_ARRAY_SEG]
        add     bx, 2
        push    ds
        mov     di, bx
        lea     si, [bp-1ah]
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
        mov     bx, (C1_BASE+L_43118-C1_SEG*16)
        mov     ax, C1_SEG
        push    ds
        mov     di, bx
        lea     si, [bp-1ah]
        mov     es, ax
        mov     cx, ss
        mov     ds, cx
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        push    cx
        xchg    di, si
        push    ds
        push    es
        pop     ds
        pop     es
        mov     cx, 0ffffh
        repne scasb
        dec     di
        pop     cx
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        lea     ax, [bp-1ah]
        push    ss
        push    ax
        callf   EP_FSTRUPR_SEG:EP_FSTRUPR_OFF
        add     sp, 4
        push    C1_SEG
        push    (C1_BASE+L_44968-C1_SEG*16)
        nop
        push    cs
        call    far_3ED98
        add     sp, 4
        push    ds
        push    C1_W_00A44
        nop
        push    cs
        call    disp_list_run
        add     sp, 4
        lea     ax, [bp-1ah]
        push    ss
        push    ax
        push    0eh
        push    53h
        nop
        push    cs
        call    draw_string_at
        add     sp, 8
        mov     al, byte ptr [C1_B_0D7C8]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C1_TBL_00A1C]
        push    word ptr [bx+C1_TBL_00A1A]
        push    1ch
        push    65h
        nop
        push    cs
        call    draw_string_at
        add     sp, 8
        cmp     byte ptr [C1_B_0D7CA], 0
        je      br_448D6
        mov     ax, C1_W_05A00
        mov     dx, C1_SEG
        jmp     br_448DC
br_448D6:
        mov     ax, C2_W_067E4
        mov     dx, C1_SEG
br_448DC:
        mov     word ptr [bp-2], dx
        push    dx
        push    ax
        push    26h
        push    0adh
        nop
        push    cs
        call    draw_string_at
        add     sp, 8
        callf   EP_FAR_37E82_SEG:EP_FAR_37E82_OFF
        or      ax, ax
        jne     L_44909
        push    C1_SEG
        if      FW_VERSION >= 120
        push    STR_C1_WIPE
        else
        push    EP_MSG_SOFTKEY_WIPE_OFF
        endif
        push    1
        push    3
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
L_44909:
        nop
        push    cs
        call    EP_FIELD_ENGINE_REDRAW_OFF+C1_CSBASE
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h
save_pgm_field0_thunk:                  ; descriptor DS:0a82h
        mov     word ptr [C1_W_SAVE_PGM_CURSOR], 0
        push    ds
        push    C1_B_0D7C8
        push    ds
        push    C1_W_00A82
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF                   ; = 0x3BDBE ui_field_engine
        add     sp, 8
        retf
        db      00h
save_pgm_field1_thunk:                  ; descriptor DS:0aach
        mov     word ptr [C1_W_SAVE_PGM_CURSOR], 1
        push    ds
        push    C1_B_0D7CA
        push    ds
        push    C1_W_00AAC
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF                   ; = 0x3BDBE ui_field_engine
        add     sp, 8
        retf
        db      90h
L_44010:
        db      "PROGRAM ONLY"
        db      00h, 00h
msg_with_sounds:
        db      "WITH SOUNDS"
        db      00h
msg_with_wav:
        db      "WITH .WAV"
        db      00h
L_44968:
        db      "Save a Program"
        db      00h, 00h, 5eh, 4eh, 4fh, 00h
msg_softkey_wipe:
        db      "WIPE"
        db      00h, 00h
far_44982:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr [C1_W_08B0E], ax
L_44990                         equ     $+2
        if      FW_VERSION = 112
L_44190                         equ     $+2
        endif
        mov     word ptr [C1_W_08B10], dx
        push    ds
        if      FW_VERSION < 112
L_44190                         equ     $+1
        if      FW_VERSION < 111
L_43F60                         equ     $+1
        endif
        endif
        push    C1_W_00AD6
        nop
        push    cs
        call    handler_set_install
        mov     sp, bp
        nop
        push    cs
        call    disp_request_flush
        leave
        retf
disk_full_f3:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   EP_FAR_37E82_SEG:EP_FAR_37E82_OFF
        or      ax, ax
        jne     br_449DF
        callf   EP_DISK_MEDIA_READY_CHECK_SEG:EP_DISK_MEDIA_READY_CHECK_OFF
        or      ax, ax
        jne     br_449CA
        push    C1_SEG
        if      FW_VERSION >= 120
        push    STR_C1_CHANGE_DISK
        else
        push    EP_MSG_CHANGE_DISK_OFF
        endif
        callf   EP_DISP_ALERT_WAIT_KEY_SEG:EP_DISP_ALERT_WAIT_KEY_OFF
        jmp     SHORT L_440A8
        db      90h
br_449CA:
        nop
        push    cs
        call    fs_close
        push    word ptr [C1_W_08B10]
        push    word ptr [C1_W_08B0E]
        nop
        push    cs
        call    far_444F6
L_440A8:
        add     sp, 4
br_449DF:
        pop     ds
        retf
        db      00h
disk_full_save:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   EP_DISK_MEDIA_READY_CHECK_SEG:EP_DISK_MEDIA_READY_CHECK_OFF
        or      ax, ax
        jne     br_44A02
        push    EP_MSG_CHANGE_DISK_SEG
        push    EP_MSG_CHANGE_DISK_OFF
        callf   EP_DISP_ALERT_WAIT_KEY_SEG:EP_DISP_ALERT_WAIT_KEY_OFF
        add     sp, 4
        pop     ds
        retf
        db      90h
br_44A02:
        nop
        push    cs
        call    far_42AFE
        push    word ptr [C1_W_08B10]
        push    word ptr [C1_W_08B0E]
        nop
        push    cs
        call    far_444F6
        add     sp, 4
        pop     ds
        retf
        db      00h
disk_full_cancel:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_3E99C
        pop     ds
        retf
        db      00h
disk_full_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    EP_FS_OPEN_SEG
        push    EP_L_44132_OFF
        nop
        push    cs
        call    draw_confirm_window
        add     sp, 4
        callf   EP_FAR_37E82_SEG:EP_FAR_37E82_OFF
        or      ax, ax
        jne     br_44A57
        push    EP_MSG_SOFTKEY_WIPE_SEG
        push    EP_MSG_SOFTKEY_WIPE_OFF
        push    1
        push    3
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
br_44A57:
        push    ds
        push    C1_W_00AF4
        nop
        push    cs
        call    disp_list_run
        add     sp, 4
        pop     ds
        retf
        db      90h
L_44132:
        if      FW_VERSION >= 112
far_44A69                       equ     $+3
        else
far_44A69                       equ     $+7
        endif
        db      "Disk is full!!"
        db      00h
        db      00h
aps_save_to_disk:
        enter   8, 0
        xor     ax, ax
        mov     dx, 7c00h
        push    dx
        push    ax
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    far_44AC2
        add     sp, 8
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_44AA4
        push    word ptr [bp-2]
        push    ax
        callf   EP_DISP_ALERT_WAIT_KEY_SEG:EP_DISP_ALERT_WAIT_KEY_OFF
        add     sp, 4
        jmp     br_44ABA
br_44AA4:
        cmp     byte ptr [C1_B_0D7C8], 0
        je      br_44ABA
        push    7c00h
        push    0
        nop
        push    cs
        call    far_444F6
        add     sp, 4
        leave
        retf
br_44ABA:
        nop
        push    cs
        call    far_3E99C
        leave
        retf
        db      00h
far_44AC2:
        enter   10h, 0
        push    di
        push    si
        mov     si, word ptr [bp+6]
        mov     byte ptr [bp-0ah], 0ah
        mov     byte ptr [bp-9], 5
        push    1
        mov     ax, word ptr [bp+8]
        push    ax
        push    si
        mov     di, ax
        nop
        push    cs
        call    disk_progress_msg
        add     sp, 6
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    far_44D28
        add     sp, 4
        mov     word ptr [bp-0ch], ax
        xor     ax, ax
        mov     dx, 7f00h
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    dx
        push    ax
        nop
        push    cs
        call    far_43DCC
        add     sp, 4
        push    1
        push    di
        push    si
        nop
        push    cs
        call    fs_open
        add     sp, 6
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      br_44B23
        jmp     br_44C80
br_44B23:
        push    1
        push    2
        lea     ax, [bp-0ah]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jne     br_44B6F
        push    1
        push    2
        lea     ax, [bp-0ch]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jne     br_44B6F
        push    word ptr [bp-0ch]
        push    11h
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-6], dx
br_44B6F:
        mov     ax, word ptr [bp-6]
        or      ax, si
        jne     br_44BAC
        mov     word ptr [bp-0eh], 18h
        push    1
        push    2
        lea     ax, [bp-0eh]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jne     br_44BAC
        push    1
        push    word ptr [bp-0eh]
        push    7f00h
        push    0
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-6], dx
br_44BAC:
        mov     ax, word ptr [bp-6]
        or      ax, si
        jne     br_44BE6
        mov     byte ptr [bp-1], 40h
        push    1
        push    1
        lea     ax, [bp-1]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jne     br_44BE6
        push    40h
        push    1
        push    ds
        push    C0_W_0D778
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-6], dx
br_44BE6:
        mov     ax, word ptr [bp-6]
        or      ax, si
        je      br_44BF0
        jmp     br_44C88
br_44BF0:
        mov     word ptr [bp-0eh], 188h
        push    1
        mov     ax, 4
        mov     word ptr [bp-10h], ax
        push    ax
        lea     ax, [bp-10h]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jne     br_44C88
        if      FW_VERSION >= 112
        xor     si, si
        mov     di, 8fe0h
        else
        xor     di, di
        mov     si, 8fe0h
        endif
loop_44C19:
        mov     word ptr [bp-10h], 40h
        mov     word ptr [bp-0eh], 6
        push    1
        push    4
        lea     ax, [bp-10h]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jne     br_44C86
        push    1
        push    184h
        push    ds
        if      FW_VERSION >= 112
        push    di
        else
        push    si
        endif
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jne     br_44C86
        push    1
        push    4
        if      FW_VERSION >= 112
        lea     ax, [di+180h]
        else
        lea     ax, [si+180h]
        endif
        push    ds
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jne     br_44C86
        if      FW_VERSION >= 112
        add     di, 184h
        inc     si
        cmp     si, 4
        else
        add     si, 184h
        inc     di
        cmp     di, 4
        endif
        jl      loop_44C19
        jmp     br_44C86
        db      90h
br_44C80:
        mov     si, ax
        jmp     br_44D19
        db      90h
br_44C86:
        mov     si, ax
br_44C88:
        mov     ax, word ptr [bp-6]
        or      ax, si
        jne     br_44D0D
        mov     word ptr [bp-2], 0
        mov     di, word ptr [bp+0ah]
loop_44C97:
        imul    bx, word ptr [bp-2], 99eh
        mov     es, word ptr [C2_W_PGM_ARRAY_SEG]
        add     bx, word ptr [C2_FP_PGM_ARRAY]
        cmp     byte ptr es:[bx+2], 0
        je      br_44CE2
        push    1
        push    2
        lea     ax, [bp-2]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jne     br_44CEB
        push    word ptr [bp+0ch]
        push    di
        push    0
        push    0
        mov     al, byte ptr [bp-2]
        push    ax
        nop
        push    cs
        call    far_4400A
        add     sp, 0ah
        mov     si, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jne     br_44CEB
br_44CE2:
        inc     word ptr [bp-2]
        cmp     word ptr [bp-2], 17h
        jle     loop_44C97
br_44CEB:
        mov     ax, word ptr [bp-6]
        or      ax, si
        jne     br_44D0D
        mov     word ptr [bp-4], 0ffffh
        push    1
        push    2
        lea     ax, [bp-4]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-6], dx
br_44D0D:
        if      FW_VERSION >= 112
        mov     ax, word ptr [bp-6]
        or      ax, si
        jne     br_44D19
        endif
        callf   EP_DISK_FILE_CLOSE_SEG:EP_DISK_FILE_CLOSE_OFF
br_44D19:
        nop
        push    cs
        call    field_handler_nop
        mov     ax, si
        mov     dx, word ptr [bp-6]
        pop     si
        pop     di
        leave
        retf
        if      FW_VERSION >= 112
        db      00h
        endif
far_44D28:
        enter   0eh, 0
        push    di
        push    si
        xor     bx, bx
        mov     ax, word ptr [C0_W_098DC]
        mov     dx, word ptr [C0_W_098DE]
        mov     si, ax
        mov     word ptr [bp-0ah], dx
        mov     ax, dx
        mov     cx, ds
        cmp     si, C1_TBL_SOUNDS_END
        jne     br_44D4D
        cmp     ax, cx
        jne     br_44D4D
        jmp     br_44DCE
br_44D4D:
        mov     word ptr [bp-0eh], bx
        mov     word ptr [bp-0ch], si
        mov     bx, word ptr [bp+6]
        mov     ax, bx
        mov     dx, word ptr [bp+8]
        add     ah, 11h
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     word ptr [bp-4], bx
        mov     word ptr [bp-2], dx
loop_44D6A:
        mov     bx, word ptr [bp-0ch]
        mov     cx, word ptr [bp-0ah]
        add     bx, 12h
        mov     dx, cx
        mov     di, bx
        mov     es, cx
        push    ds
        lds     si, [bp-4]
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
        mov     ax, word ptr [bp-0ch]
        les     bx, [bp-8]
        add     word ptr [bp-8], 4
        mov     word ptr es:[bx], ax
        mov     word ptr es:[bx+2], dx
        add     word ptr [bp-4], 11h
        inc     word ptr [bp-0eh]
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        mov     cx, ds
        cmp     ax, C1_TBL_SOUNDS_END
        jne     loop_44D6A
        cmp     dx, cx
        jne     loop_44D6A
        mov     bx, word ptr [bp-0eh]
br_44DCE:
        mov     word ptr [bp-0ch], bx
        cmp     bx, 0ffh
        jg      br_44E29
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     cx, bx
        shl     cx, 2
        add     ax, cx
        add     ah, 11h
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     ax, word ptr [bp+6]
        imul    cx, bx, 11h
        add     ax, cx
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     ax, 100h
        sub     ax, bx
        mov     word ptr [bp-0ah], ax
        mov     bx, word ptr [bp-4]
        mov     di, word ptr [bp-8]
        mov     cx, ax
loop_44E0B:
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[bx], 0
        mov     es, word ptr [bp-6]
        mov     si, di
        add     di, 4
        sub     ax, ax
        mov     word ptr es:[si+2], ax
        mov     word ptr es:[si], ax
        add     bx, 11h
        dec     cx
        jne     loop_44E0B
br_44E29:
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    -1
        nop
        push    cs
        call    far_4434A
        add     sp, 6
        mov     ax, word ptr [bp-0ch]
        pop     si
        pop     di
        leave
        retf
far_44E40:
        push    ds
        push    C1_W_00B7C
        nop
        push    cs
        call    handler_set_install
        add     sp, 4
        cmp     word ptr [C1_W_SAVE_APS_CURSOR], 0
        jl      br_44E5A
        cmp     word ptr [C1_W_SAVE_APS_CURSOR], 3
        jb      br_44E60
br_44E5A:
        mov     word ptr [C1_W_SAVE_APS_CURSOR], 0
br_44E60:
        imul    bx, word ptr [C1_W_SAVE_APS_CURSOR], 2ah
        callf   [bx+C1_TBL_00BE6]
        retf
save_aps_f3:
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   EP_FAR_37E82_SEG:EP_FAR_37E82_OFF
        or      ax, ax
        jne     br_44ED3
        mov     di, C1_TBL_APS_NAME
        mov     si, 0d7e8h
        mov     cx, ds
        mov     es, cx
        push    ds
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
        mov     bx, (C1_BASE+L_4311E-C1_SEG*16)
        mov     ax, C1_SEG
        mov     di, bx
        mov     si, 0d7e8h
        mov     es, ax
        push    ds
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        push    cx
        xchg    di, si
        push    ds
        push    es
        pop     ds
        pop     es
        mov     cx, 0ffffh
        repne scasb
        dec     di
        pop     cx
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        nop
        push    cs
        call    far_469A8
br_44ED3:
        pop     ds
        pop     si
        pop     di
        retf
        db      00h
save_aps_cancel:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_3E99C
        pop     ds
        retf
        db      00h
save_aps_save:
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     di, C1_TBL_APS_NAME
        mov     si, 0d7e8h
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
        mov     bx, (C1_BASE+L_4311E-C1_SEG*16)
        mov     ax, C1_SEG
        mov     di, bx
        mov     si, 0d7e8h
        mov     es, ax
        push    ds
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        push    cx
        xchg    di, si
        push    ds
        push    es
        pop     ds
        pop     es
        mov     cx, 0ffffh
        repne scasb
        dec     di
        pop     cx
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        push    ds
        push    C0_W_0D7E8
        nop
        push    cs
        call    fs_find_file
        add     sp, 4
        or      ax, ax
        jne     br_44F5A
        nop
        push    cs
        call    far_468EA
        pop     ds
        pop     si
        pop     di
        retf
br_44F5A:
        push    ds
        push    C0_W_0D7E8
        nop
        push    cs
        call    aps_save_to_disk
        add     sp, 4
        pop     ds
        pop     si
        pop     di
        retf
save_aps_paint:
        enter   1ah, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    cx
        mov     di, C1_TBL_APS_NAME
        lea     si, [bp-1ah]
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
        mov     bx, (C1_BASE+L_4311E-C1_SEG*16)
        mov     ax, C1_SEG
        push    ds
        mov     di, bx
        lea     si, [bp-1ah]
        mov     es, ax
        mov     cx, ss
        mov     ds, cx
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        push    cx
        xchg    di, si
        push    ds
        push    es
        pop     ds
        pop     es
        mov     cx, 0ffffh
        repne scasb
        dec     di
        pop     cx
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        lea     ax, [bp-1ah]
        push    ss
        push    ax
        callf   EP_FSTRUPR_SEG:EP_FSTRUPR_OFF
        add     sp, 4
        push    C1_SEG
        push    EP_L_450C6_OFF
        nop
        push    cs
        call    far_3ED98
        add     sp, 4
        push    ds
        push    C1_W_00B9A
        nop
        push    cs
        call    disp_list_run
        add     sp, 4
        lea     ax, [bp-1ah]
        push    ss
        push    ax
        push    0eh
        push    53h
        nop
        push    cs
        call    draw_string_at
        add     sp, 8
        mov     al, byte ptr [C1_B_0D7C8]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C1_TBL_00B72]
        push    word ptr [bx+C1_TBL_00B70]
        push    1ch
        push    65h
        nop
        push    cs
        call    draw_string_at
        add     sp, 8
        cmp     byte ptr [C1_B_0D7CA], 0
        je      br_45036
        mov     ax, C1_W_05A00
        mov     dx, C1_SEG
        jmp     br_4503C
        db      90h
br_45036:
        mov     ax, C2_W_067E4
        mov     dx, C1_SEG
br_4503C:
        mov     word ptr [bp-2], dx
        push    dx
        push    ax
        push    26h
        push    0adh
        nop
        push    cs
        call    draw_string_at
        add     sp, 8
        callf   EP_FAR_37E82_SEG:EP_FAR_37E82_OFF
        or      ax, ax
        jne     L_4472D
        push    C1_SEG
        if      FW_VERSION >= 120
        push    STR_C1_WIPE
        else
        push    EP_MSG_SOFTKEY_WIPE_OFF
        endif
        push    1
        push    3
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
L_4472D:
        nop
        push    cs
        call    EP_FIELD_ENGINE_REDRAW_OFF+C1_CSBASE
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h
save_aps_field0_thunk:                  ; descriptor DS:0bd8h
        mov     word ptr [C1_W_SAVE_APS_CURSOR], 0
        push    ds
        push    C1_B_0D7C8
        push    ds
        push    C1_W_00BD8
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF                   ; = 0x3BDBE ui_field_engine
        add     sp, 8
        retf
        db      00h
save_aps_field1_thunk:                  ; descriptor DS:0c02h
        mov     word ptr [C1_W_SAVE_APS_CURSOR], 1
        push    ds
        push    C1_B_0D7CA
        push    ds
        push    C1_W_00C02
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF                   ; = 0x3BDBE ui_field_engine
        add     sp, 8
        retf
        db      00h
save_aps_field2_thunk:                  ; descriptor DS:0c2ch
        mov     word ptr [C1_W_SAVE_APS_CURSOR], 2
        push    ds
        push    C1_TBL_APS_NAME
        push    ds
        push    C1_W_00C2C
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF                   ; = 0x3BDBE ui_field_engine
        add     sp, 8
        retf
        db      90h
L_450BC:
        db      "APS ONLY"
        db      00h, 00h
L_450C6:
        db      "Save APS file"
        db      00h
far_450D4:
        enter   8, 0
        push    ds
        push    C0_W_098C2
        lea     ax, [bp-8]
        push    ss
        push    ax
        nop
        push    cs
        call    far_4510E
        add     sp, 8
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     br_45100
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        nop
        push    cs
        call    far_46126
        add     sp, 4
        leave
        retf
br_45100:
        push    word ptr [bp-2]
        push    ax
        callf   EP_DISP_ALERT_WAIT_KEY_SEG:EP_DISP_ALERT_WAIT_KEY_OFF
        add     sp, 4
        leave
        retf
far_4510E:
        enter   18h, 0
        push    di
        push    si
        push    0
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    disk_progress_msg
        add     sp, 6
        push    0
        push    0
        lea     ax, [bp-18h]
        push    ss
        push    ax
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    filename_split
        add     sp, 0ch
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    sound_record_alloc
        add     sp, 4
        or      ax, ax
        jne     br_45150
        jmp     br_452B6
br_45150:
        callf   EP_FAR_37E82_SEG:EP_FAR_37E82_OFF
        cmp     ax, 2
        jne     br_451CC
        les     bx, [bp+6]
        mov     si, word ptr es:[bx]
        mov     cx, word ptr es:[bx+2]
        add     si, 12h
        mov     dx, cx
        push    ds
        lea     di, [bp-18h]
        mov     cx, ss
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
        les     bx, [bp+6]
        push    word ptr es:[bx+2]
        push    word ptr es:[bx]
        push    ax
        push    ax
        nop
        push    cs
        call    far_3FF18
        add     sp, 8
        cmp     ax, 1
        sbb     ax, ax
        neg     ax
        push    ax
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        les     bx, [bp+6]
        push    word ptr es:[bx+2]
        push    word ptr es:[bx]
        nop
        push    cs
        call    far_454FC
        add     sp, 0ah
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     si, ax
        jmp     br_4529B
br_451CC:
        push    0
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    fs_open
        add     sp, 6
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_451E8
        jmp     br_4529B
br_451E8:
        push    1
        push    2
        lea     ax, [bp-6]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_45205
        jmp     br_4528F
br_45205:
        cmp     byte ptr [bp-6], 1
        jne     br_45286
        cmp     byte ptr [bp-5], 0
        je      br_4524A
        cmp     byte ptr [bp-5], 1
        je      br_4524A
        cmp     byte ptr [bp-5], 2
        je      br_45232
        cmp     byte ptr [bp-5], 4
        je      br_45232
        mov     ax, STR_DISK_NEEDS_NEWER_OS
        mov     cx, C1_SEG
        mov     si, ax
        mov     word ptr [bp-2], cx
        jmp     br_45267
        db      90h, 90h
br_45232:
        mov     al, byte ptr [bp-5]
        sub     ah, ah
        push    ax
        les     bx, [bp+6]
        push    word ptr es:[bx+2]
        push    word ptr es:[bx]
        nop
        push    cs
        call    far_4539C
        jmp     br_4525F
        db      90h
br_4524A:
        mov     al, byte ptr [bp-5]
        sub     ah, ah
        push    ax
        les     bx, [bp+6]
        push    word ptr es:[bx+2]
        push    word ptr es:[bx]
        nop
        push    cs
        call    far_4564A
br_4525F:
        add     sp, 6
        mov     si, ax
        mov     word ptr [bp-2], dx
br_45267:
        lea     ax, [bp-18h]
        push    ss
        push    ax
        les     bx, [bp+6]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        add     ax, 12h
        push    dx
        push    ax
        nop
        push    cs
        call    name_to_filename
        add     sp, 8
        jmp     br_4528F
        db      90h
br_45286:
        if      FW_VERSION >= 112
        mov     si, (C1_BASE+L_43A98-C1_SEG*16)
        else
        mov     ax, C1_W_05908
        endif
        mov     cx, C1_SEG
        if      FW_VERSION < 112
        mov     si, ax
        endif
        mov     word ptr [bp-2], cx
br_4528F:
        if      FW_VERSION >= 112
        mov     ax, word ptr [bp-2]
        or      ax, si
        jne     br_4529B
        endif
        callf   EP_DISK_FILE_CLOSE_SEG:EP_DISK_FILE_CLOSE_OFF
br_4529B:
        mov     ax, word ptr [bp-2]
        or      ax, si
        je      br_452C1
        les     bx, [bp+6]
        push    word ptr es:[bx+2]
        push    word ptr es:[bx]
        nop
        push    cs
        call    sound_list_unlink
        add     sp, 4
        jmp     br_452C1
        if      FW_VERSION < 112
        db      90h
        endif
br_452B6:
        mov     ax, (C1_BASE+msg_sound_dir_full-C1_SEG*16)
        mov     cx, C1_SEG
        mov     si, ax
        mov     word ptr [bp-2], cx
br_452C1:
        nop
        push    cs
        call    field_handler_nop
        mov     ax, si
        mov     dx, word ptr [bp-2]
        pop     si
        pop     di
        leave
        retf
        db      00h
far_452D0:
        enter   16h, 0
        push    di
        push    si
        push    0
        push    0
        lea     ax, [bp-16h]
        push    ss
        push    ax
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    filename_split
        add     sp, 0ch
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    sound_record_alloc
        add     sp, 4
        or      ax, ax
        je      br_45370
        les     bx, [bp+6]
        mov     si, word ptr es:[bx]
        mov     cx, word ptr es:[bx+2]
        add     si, 12h
        mov     dx, cx
        push    ds
        lea     di, [bp-16h]
        mov     cx, ss
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
        les     bx, [bp+6]
        push    word ptr es:[bx+2]
        push    word ptr es:[bx]
        push    ax
        push    ax
        nop
        push    cs
        call    far_3FF18
        add     sp, 8
        cmp     ax, 1
        sbb     ax, ax
        neg     ax
        push    ax
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        les     bx, [bp+6]
        push    word ptr es:[bx+2]
        push    word ptr es:[bx]
        nop
        push    cs
        call    far_454FC
        add     sp, 0ah
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     si, ax
        jmp     br_45379
br_45370:
        mov     si, (C1_BASE+msg_sound_dir_full-C1_SEG*16)
        mov     cx, C1_SEG
        mov     word ptr [bp-2], cx
br_45379:
        mov     ax, word ptr [bp-2]
        or      ax, si
        je      br_45392
        les     bx, [bp+6]
        push    word ptr es:[bx+2]
        push    word ptr es:[bx]
        nop
        push    cs
        call    sound_list_unlink
        add     sp, 4
br_45392:
        mov     ax, si
        mov     dx, word ptr [bp-2]
        pop     si
        pop     di
        leave
        retf
        db      00h
far_4539C:
        enter   8, 0
        push    di
        push    si
        mov     di, word ptr [bp+6]
        mov     ax, di
        mov     dx, word ptr [bp+8]
        add     ax, 12h
        mov     si, ax
        mov     word ptr [bp-2], dx
        cmp     word ptr [bp+0ah], 4
        jne     br_453CE
        push    1
        push    28h
        push    dx
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        jmp     br_453F6
br_453CE:
        push    1
        push    24h
        push    word ptr [bp-2]
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     es, word ptr [bp-2]
        sub     ax, ax
        mov     word ptr es:[si+22h], ax
        mov     word ptr es:[si+20h], ax
        mov     byte ptr es:[si+25h], 1
br_453F6:
        mov     ax, word ptr [bp-6]
        or      ax, word ptr [bp-8]
        jne     L_44B1C
        push    0
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+22h]
        push    word ptr es:[si+20h]
        callf   EP_ADDR_CALC_SEGMENT_SEG:EP_ADDR_CALC_SEGMENT_OFF
        add     sp, 6
        mov     es, word ptr [bp+8]
        mov     word ptr es:[di+3ah], ax
        mov     word ptr es:[di+3ch], dx
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+13h]
        sub     ah, ah
        inc     ax
        push    ax
        push    word ptr es:[si+1eh]
        push    word ptr es:[si+1ch]
        nop
        push    cs
        call    size_para_round_mul
        add     sp, 6
        mov     es, word ptr [bp+8]
        mov     word ptr es:[di+0eh], ax
        mov     word ptr es:[di+10h], dx
        nop
        push    cs
        call    smem_free_bytes
        or      dx, dx
        jge     br_45462
        mov     ax, (C1_BASE+L_415CA-C1_SEG*16)
        mov     cx, C1_SEG
        mov     si, ax
        mov     word ptr [bp-6], cx
        jmp     NEAR br_454F2
        db      90h
L_44B1C:
        mov     si, word ptr [bp-8]
        jmp     br_454F2
br_45462:
        mov     word ptr [bp-4], si
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[di+0ah]
        mov     dx, word ptr es:[di+C1_TBL_0000C]
        add     ax, word ptr es:[di+0eh]
        adc     dx, word ptr es:[di+10h]
        cmp     dx, word ptr [C2_W_SMEM_SIZE_HI]
        jl      br_4548B
        jg      br_45486
        cmp     ax, word ptr [C0_W_SMEM_SIZE]
        jbe     br_4548B
br_45486:
        nop
        push    cs
        call    smem_compact
br_4548B:
        les     bx, [bp-4]
        push    word ptr es:[bx+1eh]
        push    word ptr es:[bx+1ch]
        mov     es, word ptr [bp+8]
        push    word ptr es:[di+C1_TBL_0000C]
        push    word ptr es:[di+0ah]
        nop
        push    cs
        call    fs_read_to_smem
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jne     br_454F2
        les     bx, [bp-4]
        cmp     byte ptr es:[bx+13h], 0
        je      br_454F2
        push    word ptr es:[bx+1eh]
        push    word ptr es:[bx+1ch]
        push    0
        push    2
        mov     es, word ptr [bp+8]
        push    word ptr es:[di+10h]
        push    word ptr es:[di+0eh]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     es, word ptr [bp+8]
        add     ax, word ptr es:[di+0ah]
        adc     dx, word ptr es:[di+C1_TBL_0000C]
        push    dx
        push    ax
        nop
        push    cs
        call    fs_read_to_smem
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-6], dx
br_454F2:
        mov     ax, si
        mov     dx, word ptr [bp-6]
        pop     si
        pop     di
        leave
        retf
        db      00h
far_454FC:
        enter   4ch, 0
        push    di
        push    si
        sub     ax, ax
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-8], ax
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     ax, 12h
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        lea     ax, [bp-0ch]
        push    ss
        push    ax
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    far_3E90E
        add     sp, 8
        or      ax, ax
        je      br_45533
        jmp     br_45636
br_45533:
        push    1000h
        push    20h
        lea     cx, [bp-4ch]
        push    ss
        push    cx
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        nop
        push    cs
        call    smem_block_copy
        add     sp, 0ch
        cmp     byte ptr [bp-4ch], 81h
        je      br_45554
        jmp     br_4562E
br_45554:
        cmp     byte ptr [bp-4bh], 4
        je      br_4555D
        jmp     br_4562E
br_4555D:
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     ax, 12h
        push    ds
        mov     di, ax
        lea     si, [bp-48h]
        mov     es, dx
        push    ss
        pop     ds
        mov     cx, 14h
        rep movsw
        pop     ds
        push    0
        les     bx, [bp-4]
        push    word ptr es:[bx+22h]
        push    word ptr es:[bx+20h]
        callf   EP_ADDR_CALC_SEGMENT_SEG:EP_ADDR_CALC_SEGMENT_OFF
        add     sp, 6
        les     bx, [bp+6]
        mov     word ptr es:[bx+3ah], ax
        mov     word ptr es:[bx+3ch], dx
        mov     ax, word ptr [bp-10h]
        mov     dx, word ptr [bp-0eh]
        mov     word ptr es:[bx+0eh], ax
        mov     word ptr es:[bx+10h], dx
        cmp     word ptr [bp+0eh], 0
        je      br_455C8
        mov     ax, word ptr [bp-0ch]
        mov     dx, word ptr [bp-0ah]
        add     ax, 20h
        adc     dx, 0
        les     bx, [bp+6]
        mov     word ptr es:[bx+0ah], ax
        mov     word ptr es:[bx+C1_TBL_0000C], dx
loop_455C1:
        mov     bx, word ptr [bp-8]
        jmp     br_45641
        db      90h, 90h
br_455C8:
        nop
        push    cs
        call    smem_free_bytes
        or      dx, dx
        jge     br_455DA
        mov     ax, (C1_BASE+L_415CA-C1_SEG*16)
        mov     cx, C1_SEG
        jmp     br_4563C
        db      90h
br_455DA:
        mov     si, word ptr [bp+6]
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[si+0ah]
        mov     dx, word ptr es:[si+C1_TBL_0000C]
        add     ax, word ptr es:[si+0eh]
        adc     dx, word ptr es:[si+10h]
        cmp     dx, word ptr [C2_W_SMEM_SIZE_HI]
        jl      br_45603
        jg      br_455FE
        cmp     ax, word ptr [C0_W_SMEM_SIZE]
        jbe     br_45603
br_455FE:
        nop
        push    cs
        call    smem_compact
br_45603:
        mov     es, word ptr [bp+8]
        push    word ptr es:[si+10h]
        push    word ptr es:[si+0eh]
        mov     ax, word ptr [bp-0ch]
        mov     dx, word ptr [bp-0ah]
        add     ax, 20h
        adc     dx, 0
        push    dx
        push    ax
        push    word ptr es:[si+C1_TBL_0000C]
        push    word ptr es:[si+0ah]
        nop
        push    cs
        call    far_3E3B8
        add     sp, 0ch
        jmp     loop_455C1
br_4562E:
        mov     ax, STR_WRONG_FILE_FORMAT
        mov     cx, C1_SEG
        jmp     br_4563C
br_45636:
        mov     ax, (C1_BASE+far_431E8-C1_SEG*16)
        mov     cx, C1_SEG
br_4563C:
        mov     bx, ax
        mov     word ptr [bp-6], cx
br_45641:
        mov     ax, bx
        mov     dx, word ptr [bp-6]
        pop     si
        pop     di
        leave
        retf
far_4564A:
        enter   2eh, 0
        push    di
        push    si
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     ax, 12h
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    1
        push    1dh
        lea     ax, [bp-2eh]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      br_4567C
        jmp     br_45820
br_4567C:
        cmp     word ptr [bp+0ah], 1
        jne     br_45698
        push    1
        push    8
        lea     ax, [bp-10h]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-6], dx
br_45698:
        mov     ax, word ptr [bp-6]
        or      ax, si
        je      br_456A2
        jmp     br_45820
br_456A2:
        lea     di, [bp-2eh]
        mov     cx, ss
        mov     es, cx
        push    ds
        lds     si, [bp-4]
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
        mov     ax, 28h
        mul     word ptr [bp-19h]
        les     bx, [bp-4]
        mov     word ptr es:[bx+14h], ax
        mov     word ptr es:[bx+16h], dx
        mov     ax, 28h
        mul     word ptr [bp-17h]
        mov     word ptr es:[bx+18h], ax
        mov     word ptr es:[bx+1ah], dx
        mov     byte ptr es:[bx+12h], 0efh
        mov     ax, word ptr [bp-1dh]
        mov     dx, word ptr [bp-1bh]
        mov     word ptr es:[bx+1ch], ax
        mov     word ptr es:[bx+1eh], dx
        mov     ax, word ptr es:[bx+1ch]
        cmp     word ptr es:[bx+16h], dx
        jl      br_4571E
        jg      br_4570B
        cmp     word ptr es:[bx+14h], ax
        jbe     br_4571E
br_4570B:
        les     bx, [bp-4]
        mov     ax, word ptr es:[bx+1ch]
        mov     dx, word ptr es:[bx+1eh]
        mov     word ptr es:[bx+14h], ax
        mov     word ptr es:[bx+16h], dx
br_4571E:
        les     bx, [bp-4]
        mov     ax, word ptr es:[bx+1ch]
        mov     dx, word ptr es:[bx+1eh]
        cmp     word ptr es:[bx+1ah], dx
        jl      br_4573F
        jg      br_45737
        cmp     word ptr es:[bx+18h], ax
        jbe     br_4573F
br_45737:
        mov     word ptr es:[bx+18h], ax
        mov     word ptr es:[bx+1ah], dx
br_4573F:
        cmp     word ptr [bp+0ah], 1
        jne     br_45758
        mov     al, byte ptr [bp-0fh]
        sub     al, 11h
        les     bx, [bp-4]
        mov     byte ptr es:[bx+12h], al
        mov     al, byte ptr [bp-10h]
        mov     byte ptr es:[bx+11h], al
br_45758:
        les     bx, [bp-4]
        sub     ax, ax
        mov     word ptr es:[bx+22h], ax
        mov     word ptr es:[bx+20h], ax
        mov     byte ptr es:[bx+25h], 1
        mov     byte ptr es:[bx+24h], al
        mov     byte ptr es:[bx+13h], al
        push    ax
        push    word ptr es:[bx+22h]
        push    word ptr es:[bx+20h]
        callf   EP_ADDR_CALC_SEGMENT_SEG:EP_ADDR_CALC_SEGMENT_OFF
        add     sp, 6
        les     bx, [bp+6]
        mov     word ptr es:[bx+3ah], ax
        mov     word ptr es:[bx+3ch], dx
        les     bx, [bp-4]
        sub     ah, ah
        mov     al, byte ptr es:[bx+13h]
        inc     ax
        push    ax
        push    word ptr es:[bx+1eh]
        push    word ptr es:[bx+1ch]
        nop
        push    cs
        call    size_para_round_mul
        add     sp, 6
        les     bx, [bp+6]
        mov     word ptr es:[bx+0eh], ax
        mov     word ptr es:[bx+10h], dx
        nop
        push    cs
        call    smem_free_bytes
        or      dx, dx
        jge     br_457CA
        mov     ax, (C1_BASE+L_415CA-C1_SEG*16)
        mov     cx, C1_SEG
        mov     si, ax
        mov     word ptr [bp-6], cx
        jmp     br_45820
br_457CA:
        mov     di, word ptr [bp+6]
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[di+0ah]
        mov     dx, word ptr es:[di+C1_TBL_0000C]
        add     ax, word ptr es:[di+0eh]
        adc     dx, word ptr es:[di+10h]
        cmp     dx, word ptr [C2_W_SMEM_SIZE_HI]
        jl      br_457F3
        jg      br_457EE
        cmp     ax, word ptr [C0_W_SMEM_SIZE]
        jbe     br_457F3
br_457EE:
        nop
        push    cs
        call    smem_compact
br_457F3:
        push    1
        nop
        push    cs
        call    far_4610A
        add     sp, 2
        les     bx, [bp-4]
        push    word ptr es:[bx+1eh]
        push    word ptr es:[bx+1ch]
        mov     es, word ptr [bp+8]
        push    word ptr es:[di+C1_TBL_0000C]
        push    word ptr es:[di+0ah]
        nop
        push    cs
        call    far_42B98
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-6], dx
br_45820:
        mov     ax, si
        mov     dx, word ptr [bp-6]
        pop     si
        pop     di
        leave
        retf
        db      90h
far_4582A:
        enter   8, 0
        push    ds
        push    C0_W_098C2
        lea     ax, [bp-8]
        push    ss
        push    ax
        nop
        push    cs
        call    fn_45864
        add     sp, 8
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     br_45856
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        nop
        push    cs
        call    far_46126
        add     sp, 4
        leave
        retf
br_45856:
        push    word ptr [bp-2]
        push    ax
        callf   EP_DISP_ALERT_WAIT_KEY_SEG:EP_DISP_ALERT_WAIT_KEY_OFF
        add     sp, 4
        leave
        retf
fn_45864:
        enter   9ch, 0
        push    di
        push    si
        mov     si, word ptr [bp+6]
        xor     ax, ax
        mov     cx, 1
        lea     di, [bp-12h]
        push    ss
        pop     es
        rep stosw
        push    ax
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    disk_progress_msg
        add     sp, 6
        push    0
        push    0
        lea     ax, [bp-3ch]
        push    ss
        push    ax
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    filename_split
        add     sp, 0ch
        push    word ptr [bp+8]
        push    si
        nop
        push    cs
        call    sound_record_alloc
        add     sp, 4
        or      ax, ax
        jne     br_458B2
        jmp     br_46046
br_458B2:
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        add     ax, 12h
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        push    0
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    fs_open
        add     sp, 6
        mov     di, ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        je      br_458E1
        jmp     br_45F7F
br_458E1:
        push    1
        push    0ch
        lea     ax, [bp-2ah]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     di, ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        je      br_458FE
        jmp     br_45F73
br_458FE:
        cmp     word ptr [bp-2ah], 4952h
        je      br_45908
        jmp     br_45F68
br_45908:
        cmp     word ptr [bp-28h], 4646h
        je      br_45912
        jmp     br_45F68
br_45912:
        cmp     word ptr [bp-22h], 4157h
        je      br_4591C
        jmp     br_45F68
br_4591C:
        cmp     word ptr [bp-20h], 4556h
        je      br_45926
        jmp     NEAR br_45F68
br_45926:
        mov     si, word ptr [bp-10h]
loop_45929:
        push    1
        push    8
        lea     ax, [bp-1eh]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        je      br_45944
        jmp     br_45F30
br_45944:
        mov     al, byte ptr [bp-1eh]
        cbw
        mov     bx, ax
        test    byte ptr [bx+C2_B_076CB], 57h
        je      br_45986
        mov     ax, word ptr [bp-1eh]
        mov     dx, word ptr [bp-1ch]
        mov     al, ah
        mov     dl, dh
        sub     dh, dh
        cbw
        mov     bx, ax
        test    byte ptr [bx+C2_B_076CB], 57h
        je      br_45986
        mov     al, byte ptr [bp-1ch]
        cbw
        mov     bx, ax
        test    byte ptr [bx+C2_B_076CB], 57h
        je      br_45986
        mov     al, byte ptr [bp-1bh]
        cbw
        mov     bx, ax
        test    byte ptr [bx+C2_B_076CB], 57h
        je      br_45986
        mov     dx, 1
        jmp     br_45988
br_45986:
        xor     dx, dx
br_45988:
        or      dx, dx
        jne     br_4598F
        jmp     br_45F60
br_4598F:
        mov     ax, word ptr [bp-1ah]
        mov     dx, word ptr [bp-18h]
        add     ax, 1
        adc     dx, 0
        and     al, 0feh
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     ax, word ptr [bp-1eh]
        mov     dx, word ptr [bp-1ch]
        cmp     dx, 6174h
        ja      br_459DA
        jb      br_459BC
        cmp     ax, 6164h
        jne     br_459B9
        jmp     br_45BE2
br_459B9:
        jmp     loop_45ACA
br_459BC:
        sub     dx, 2065h
        jne     br_459CA
        sub     ax, 7563h
        je      br_459FE
        jmp     loop_45ACA
br_459CA:
        sub     ax, 6d66h
        sbb     dx, 0fh
        or      ax, dx
        jne     br_459D7
        jmp     br_45AEC
br_459D7:
        jmp     loop_45ACA
br_459DA:
        sub     dx, 6c70h
        jne     br_459EC
        sub     ax, 6d73h
        jne     br_459E8
        jmp     br_45CDC
br_459E8:
        jmp     loop_45ACA
        db      90h
br_459EC:
        sub     ax, 6166h
        sbb     dx, 7f3h
        or      ax, dx
        jne     br_459FA
        jmp     br_45EE4
br_459FA:
        jmp     loop_45ACA
        db      90h
br_459FE:
        push    1
        push    4
        lea     ax, [bp-16h]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     di, ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        je      br_45A1B
        jmp     loop_45ADF
br_45A1B:
        mov     ax, word ptr [bp-16h]
        mov     dx, word ptr [bp-14h]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_45A9C
loop_45A2B:
        push    1
        push    18h
        lea     ax, [bp-78h]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     di, ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        jne     br_45A9C
        test    byte ptr [bp-12h], 8
        je      br_45A8C
        mov     ax, word ptr [bp-78h]
        mov     dx, word ptr [bp-76h]
        or      dx, dx
        jne     br_45A8C
        sub     ax, 1388h
        je      br_45A60
        dec     ax
        je      br_45A74
        jmp     br_45A8C
        db      90h
br_45A60:
        mov     ax, word ptr [bp-74h]
        mov     dx, word ptr [bp-72h]
        mov     es, word ptr [bp-0eh]
        mov     word ptr es:[si+14h], ax
        mov     word ptr es:[si+16h], dx
        jmp     br_45A8C
        db      90h
br_45A74:
        mov     es, word ptr [bp-0eh]
        cmp     byte ptr es:[si+24h], 0
        jne     br_45A8C
        mov     ax, word ptr [bp-74h]
        mov     dx, word ptr [bp-72h]
        mov     word ptr es:[si+18h], ax
        mov     word ptr es:[si+1ah], dx
br_45A8C:
        sub     word ptr [bp-4], 1
        sbb     word ptr [bp-2], 0
        mov     ax, word ptr [bp-2]
        or      ax, word ptr [bp-4]
        jne     loop_45A2B
br_45A9C:
        mov     ax, word ptr [bp-0ah]
        or      ax, di
        jne     loop_45ADF
        push    -1
        push    -18h
        push    word ptr [bp-14h]
        push    word ptr [bp-16h]
        callf   EP_AFLMUL_SEG:EP_AFLMUL_OFF
        sub     ax, 4
loop_45AB5:
        sbb     dx, 0
        add     word ptr [bp-8], ax
        adc     word ptr [bp-6], dx
        cmp     word ptr [bp-6], 0
        jne     loop_45ACA
        cmp     word ptr [bp-8], 0
        je      loop_45ADF
loop_45ACA:
        push    1
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        nop
        push    cs
        call    fs_seek
        add     sp, 6
        mov     di, ax
        mov     word ptr [bp-0ah], dx
loop_45ADF:
        mov     ax, word ptr [bp-0ah]
        or      ax, di
        jne     L_451A9
        jmp     NEAR loop_45929
L_451A9:
        jmp     NEAR br_45F73
br_45AEC:
        test    byte ptr [bp-12h], 1
        je      br_45AF5
        jmp     br_45BD8
br_45AF5:
        or      byte ptr [bp-12h], 1
        cmp     word ptr [bp-6], 0
        jne     br_45B08
        cmp     word ptr [bp-8], 10h
        jae     br_45B08
        jmp     br_45BD8
br_45B08:
        cmp     word ptr [bp-6], 0
        je      br_45B11
        jmp     br_45BD8
br_45B11:
        cmp     word ptr [bp-8], 4000h
        jbe     br_45B1B
        jmp     br_45BD8
br_45B1B:
        push    1
        push    12h
        push    1
        push    word ptr [bp-8]
        lea     ax, [bp-60h]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_read_resized
        add     sp, 0ch
        mov     di, ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        jne     loop_45ADF
        cmp     word ptr [bp-60h], 1
        je      br_45B4E
        mov     ax, C1_W_07F3A
        mov     cx, C1_SEG
loop_45B46:
        mov     di, ax
        mov     word ptr [bp-0ah], cx
        jmp     loop_45ADF
        db      90h
br_45B4E:
        cmp     word ptr [bp-52h], 10h
        je      br_45B5C
        mov     ax, C1_W_07F4C
        mov     cx, C1_SEG
        jmp     SHORT loop_45B46
br_45B5C:
        cmp     word ptr [bp-5eh], 2
        jbe     br_45B6A
        mov     ax, C1_W_07F60
        mov     cx, C1_SEG
        jmp     loop_45B46
br_45B6A:
        cmp     word ptr [bp-5eh], 0
        je      br_45BD8
        push    word ptr [bp-5ah]
        push    word ptr [bp-5ch]
        mov     ax, word ptr [bp-52h]
        shr     ax, 3
        mul     word ptr [bp-5eh]
        push    dx
        push    ax
        callf   EP_AFLMUL_SEG:EP_AFLMUL_OFF
        cmp     ax, word ptr [bp-58h]
        jne     br_45BD8
        cmp     dx, word ptr [bp-56h]
        jne     br_45BD8
        mov     ax, word ptr [bp-52h]
        shr     ax, 3
        mul     word ptr [bp-5eh]
        cmp     ax, word ptr [bp-54h]
        jne     br_45BD8
        lea     ax, [bp-3ch]
        push    ss
        push    ax
        push    word ptr [bp-0eh]
        push    si
        nop
        push    cs
        call    name_to_filename
tgt_45BAC:
        add     sp, 8
        push    word ptr [bp-5ah]
        push    word ptr [bp-5ch]
        nop
        push    cs
        call    midi_out_io
        add     sp, 4
        mov     es, word ptr [bp-0eh]
        mov     byte ptr es:[si+12h], al
        mov     al, byte ptr [bp-5eh]
        dec     al
        mov     byte ptr es:[si+13h], al
        mov     ax, word ptr [bp-5ch]
        mov     word ptr es:[si+26h], ax
        jmp     loop_45ADF
        db      90h
br_45BD8:
        mov     ax, C1_W_07F0C
        mov     cx, C1_SEG
        jmp     loop_45B46
        db      90h
br_45BE2:
        mov     di, word ptr [bp-10h]
        test    byte ptr [bp-12h], 1
        jne     br_45BEE
        jmp     br_45CD2
br_45BEE:
        or      byte ptr [bp-12h], 2
        test    byte ptr [bp-12h], 4
        jne     br_45C13
        push    0
        push    word ptr [bp-54h]
        push    word ptr [bp-18h]
        push    word ptr [bp-1ah]
        callf   C0_SEG:(C0_BASE+__aFuldiv-C0_SEG*16)
        mov     es, word ptr [bp-0eh]
        mov     word ptr es:[di+1ch], ax
        mov     word ptr es:[di+1eh], dx
br_45C13:
        mov     si, word ptr [bp+6]
        push    word ptr [bp-5eh]
        mov     es, word ptr [bp-0eh]
        push    word ptr es:[di+1eh]
        push    word ptr es:[di+1ch]
        nop
        push    cs
        call    size_para_round_mul
        add     sp, 6
        mov     es, word ptr [bp+8]
        les     bx, es:[si]
        mov     word ptr es:[bx+0eh], ax
        mov     word ptr es:[bx+10h], dx
        nop
        push    cs
        call    smem_free_bytes
        or      dx, dx
        jge     br_45C58
        mov     ax, (C1_BASE+L_415CA-C1_SEG*16)
        mov     dx, C1_SEG
loop_45C49:
        mov     word ptr [bp-0ah], dx
        mov     word ptr [bp-0ch], ax
loop_45C4F:
        mov     di, ax
        mov     si, word ptr [bp-10h]
        jmp     loop_45ADF
        db      90h
br_45C58:
        mov     es, word ptr [bp+8]
        les     bx, es:[si]
        mov     ax, word ptr es:[bx+0ah]
        mov     dx, word ptr es:[bx+C1_TBL_0000C]
        add     ax, word ptr es:[bx+0eh]
        adc     dx, word ptr es:[bx+10h]
        cmp     dx, word ptr [C2_W_SMEM_SIZE_HI]
        jl      br_45C81
        jg      br_45C7C
        cmp     ax, word ptr [C0_W_SMEM_SIZE]
        jbe     br_45C81
br_45C7C:
        nop
        push    cs
        call    smem_compact
br_45C81:
        cmp     word ptr [bp-5eh], 1
        jne     br_45CA8
        mov     es, word ptr [bp-0eh]
        push    word ptr es:[di+1eh]
        push    word ptr es:[di+1ch]
        mov     es, word ptr [bp+8]
        les     bx, es:[si]
        push    word ptr es:[bx+C1_TBL_0000C]
        push    word ptr es:[bx+0ah]
        nop
        push    cs
        call    fs_read_to_smem
        jmp     br_45CC6
        db      90h
br_45CA8:
        mov     es, word ptr [bp-0eh]
        push    word ptr es:[di+1eh]
        push    word ptr es:[di+1ch]
        mov     es, word ptr [bp+8]
        les     bx, es:[si]
        push    word ptr es:[bx+C1_TBL_0000C]
        push    word ptr es:[bx+0ah]
        nop
        push    cs
        call    far_42CC8
br_45CC6:
        add     sp, 8
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        jmp     loop_45C4F
br_45CD2:
        mov     ax, C1_W_07F0C
        mov     dx, C1_SEG
        jmp     NEAR loop_45C49
        db      90h
br_45CDC:
        cmp     word ptr [bp-6], 0
        jne     br_45CEB
        cmp     word ptr [bp-8], 24h
        jae     br_45CEB
        jmp     loop_45ACA
br_45CEB:
        push    1
        push    24h
        lea     ax, [bp-9ch]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     di, ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        je      br_45D09
        jmp     loop_45ADF
br_45D09:
        cmp     word ptr [bp-9ch], 47h
        jne     br_45D2C
        cmp     word ptr [bp-9ah], 0
        jne     br_45D2C
        cmp     word ptr [bp-98h], 48h
        jne     br_45D2C
        cmp     word ptr [bp-96h], 0
        jne     br_45D2C
        or      byte ptr [bp-12h], 8
        jmp     br_45D4D
        db      90h
br_45D2C:
        cmp     word ptr [bp-9ch], 47h
        jne     br_45D4D
        cmp     word ptr [bp-9ah], 100h
        jne     br_45D4D
        cmp     word ptr [bp-98h], 5eh
        jne     br_45D4D
        cmp     word ptr [bp-96h], 0
        jne     br_45D4D
        or      byte ptr [bp-12h], 10h
br_45D4D:
        mov     ax, word ptr [bp-7eh]
        or      ax, word ptr [bp-80h]
        je      br_45DC8
        push    1
        push    18h
        lea     ax, [bp-78h]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     di, ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        jne     br_45DC8
        mov     ax, word ptr [bp-6ch]
        mov     dx, word ptr [bp-6ah]
        sub     ax, word ptr [bp-70h]
        sbb     dx, word ptr [bp-6eh]
        mov     es, word ptr [bp-0eh]
        mov     word ptr es:[si+20h], ax
        mov     word ptr es:[si+22h], dx
        mov     ax, word ptr [bp-6ch]
        mov     dx, word ptr [bp-6ah]
        mov     word ptr es:[si+18h], ax
        mov     word ptr es:[si+1ah], dx
        mov     byte ptr es:[si+24h], 1
        push    1
        push    0
        push    18h
        mov     ax, word ptr [bp-80h]
        mov     dx, word ptr [bp-7eh]
        sub     ax, 1
        sbb     dx, 0
        push    dx
        push    ax
        callf   EP_AFLMUL_SEG:EP_AFLMUL_OFF
        push    dx
        push    ax
        nop
        push    cs
        call    fs_seek
        add     sp, 6
        mov     di, ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        je      br_45DC8
        jmp     loop_45ADF
br_45DC8:
        mov     word ptr [bp-0ch], di
        mov     ax, word ptr [bp-7ah]
        or      ax, word ptr [bp-7ch]
        jne     br_45DD6
        jmp     br_45EB8
br_45DD6:
        test    byte ptr [bp-12h], 10h
        jne     br_45DDF
        jmp     br_45EA2
br_45DDF:
        push    1
        push    12h
        push    1
        push    word ptr [bp-7ch]
        lea     ax, [bp-4eh]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_read_resized
        add     sp, 0ch
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        je      br_45E02
        jmp     br_45EB8
br_45E02:
        cmp     byte ptr [bp-4eh], 1
        je      br_45E0B
        jmp     br_45EB8
br_45E0B:
        mov     ax, word ptr [bp-44h]
        mov     dx, word ptr [bp-42h]
        mov     es, word ptr [bp-0eh]
        mov     word ptr es:[si+14h], ax
        mov     word ptr es:[si+16h], dx
        mov     al, byte ptr [bp-4bh]
        cbw
        mov     cx, ax
        shl     ax, 2
        add     ax, cx
        add     ax, ax
        mov     cx, ax
        mov     al, byte ptr [bp-4ah]
        mov     dl, 0ah
        cbw
        idiv    dl
        cbw
        mov     dx, ax
        mov     al, byte ptr es:[si+12h]
        cbw
        add     dx, ax
        add     cx, dx
        mov     di, cx
        cmp     cx, 78h
        jle     br_45E4C
        mov     di, 78h
        jmp     br_45E54
        db      90h
br_45E4C:
        cmp     di, -78h
        jge     br_45E54
        mov     di, 0ff88h
br_45E54:
        mov     ax, di
        mov     es, word ptr [bp-0eh]
        mov     byte ptr es:[si+12h], al
        mov     byte ptr es:[si+24h], 0
        cmp     word ptr [bp-48h], 0
        jne     br_45E7C
        mov     ax, word ptr [bp-40h]
        mov     dx, word ptr [bp-3eh]
        mov     es, word ptr [bp-0eh]
loop_45E71:
        mov     word ptr es:[si+18h], ax
        mov     word ptr es:[si+1ah], dx
        jmp     br_45EB8
        db      90h
br_45E7C:
        cmp     word ptr [bp-48h], 1
        jne     br_45E90
        mov     es, word ptr [bp-0eh]
        mov     ax, word ptr es:[si+1ch]
        mov     dx, word ptr es:[si+1eh]
        jmp     loop_45E71
        db      90h
br_45E90:
        mov     ax, word ptr [bp-7eh]
        or      ax, word ptr [bp-80h]
        je      br_45EB8
        mov     es, word ptr [bp-0eh]
        mov     byte ptr es:[si+24h], 1
        jmp     br_45EB8
br_45EA2:
        push    1
        push    word ptr [bp-7ah]
        push    word ptr [bp-7ch]
        nop
        push    cs
        call    fs_seek
        add     sp, 6
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
br_45EB8:
        mov     ax, word ptr [bp-0ah]
        or      ax, word ptr [bp-0ch]
        jne     L_4559E
        mov     di, word ptr [bp-0ch]
        push    -1
        push    -18h
        push    word ptr [bp-7eh]
        push    word ptr [bp-80h]
        callf   EP_AFLMUL_SEG:EP_AFLMUL_OFF
        sub     ax, word ptr [bp-7ch]
        sbb     dx, word ptr [bp-7ah]
        sub     ax, 24h
        jmp     NEAR loop_45AB5
L_4559E:
        mov     di, word ptr [bp-0ch]
        jmp     loop_45ADF
br_45EE4:
        test    byte ptr [bp-12h], 2
        je      br_45EED
        jmp     loop_45ACA
br_45EED:
        cmp     word ptr [bp-6], 0
        jne     br_45EFC
        cmp     word ptr [bp-8], 4
        jae     br_45EFC
        jmp     loop_45ACA
br_45EFC:
        or      byte ptr [bp-12h], 4
        push    1
        push    4
        push    1
        push    word ptr [bp-8]
        lea     cx, [bp-4]
        push    ss
        push    cx
        nop
        push    cs
        call    fs_read_resized
        add     sp, 0ch
        mov     di, ax
        mov     word ptr [bp-0ah], dx
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        mov     es, word ptr [bp-0eh]
        mov     word ptr es:[si+1ch], ax
        mov     word ptr es:[si+1eh], dx
        jmp     loop_45ADF
        db      90h
br_45F30:
        mov     word ptr [bp-0ch], ax
        mov     ax, C1_SEG
        mov     cx, (C1_BASE+L_3E1A7-C1_SEG*16)
        mov     di, 5038h
        mov     es, ax
        push    ds
        lds     si, [bp-0ch]
        xor     ax, ax
        repe cmpsb
        je      br_45F4D
        sbb     ax, ax
        sbb     ax, 0ffffh
br_45F4D:
        pop     ds
        or      ax, ax
        jne     br_45F5A
        cwd
        mov     di, ax
        mov     word ptr [bp-0ah], dx
        jmp     br_45F73
br_45F5A:
        mov     di, word ptr [bp-0ch]
        jmp     br_45F73
        db      90h
br_45F60:
        mov     ax, C1_W_07F0C
        mov     cx, C1_SEG
        jmp     SHORT br_45F6E
br_45F68:
        mov     ax, STR_WRONG_FILE_FORMAT
        mov     cx, C1_SEG
br_45F6E:
        mov     di, ax
        mov     word ptr [bp-0ah], cx
br_45F73:
        if      FW_VERSION >= 112
        mov     ax, word ptr [bp-0ah]
        or      ax, di
        jne     br_45F7F
        endif
        callf   EP_DISK_FILE_CLOSE_SEG:EP_DISK_FILE_CLOSE_OFF
br_45F7F:
        mov     ax, word ptr [bp-0ah]
        or      ax, di
        je      br_45F89
        jmp     br_46032
br_45F89:
        les     bx, [bp-10h]
        mov     ax, word ptr es:[bx+1ah]
        or      ax, word ptr es:[bx+18h]
        je      br_45FAC
        mov     ax, word ptr es:[bx+1ch]
        mov     dx, word ptr es:[bx+1eh]
        cmp     word ptr es:[bx+1ah], dx
        jl      br_45FBC
        jg      br_45FAC
        cmp     word ptr es:[bx+18h], ax
        jbe     br_45FBC
br_45FAC:
        mov     ax, word ptr es:[bx+1ch]
        mov     dx, word ptr es:[bx+1eh]
        mov     word ptr es:[bx+18h], ax
        mov     word ptr es:[bx+1ah], dx
br_45FBC:
        les     bx, [bp-10h]
        mov     ax, word ptr es:[bx+18h]
        mov     dx, word ptr es:[bx+1ah]
        cmp     word ptr es:[bx+16h], dx
        jl      br_45FDD
        jg      br_45FD5
        cmp     word ptr es:[bx+14h], ax
        jbe     br_45FDD
br_45FD5:
        mov     word ptr es:[bx+14h], ax
        mov     word ptr es:[bx+16h], dx
br_45FDD:
        les     bx, [bp-10h]
        cmp     word ptr es:[bx+22h], 0
        jl      br_45FFD
        mov     ax, word ptr es:[bx+20h]
        mov     dx, word ptr es:[bx+22h]
        cmp     word ptr es:[bx+1ah], dx
        jg      br_4600D
        jl      br_45FFD
        cmp     word ptr es:[bx+18h], ax
        jae     br_4600D
br_45FFD:
        mov     ax, word ptr es:[bx+18h]
        mov     dx, word ptr es:[bx+1ah]
        mov     word ptr es:[bx+20h], ax
        mov     word ptr es:[bx+22h], dx
br_4600D:
        push    0
        les     bx, [bp-10h]
        push    word ptr es:[bx+22h]
        push    word ptr es:[bx+20h]
        callf   EP_ADDR_CALC_SEGMENT_SEG:EP_ADDR_CALC_SEGMENT_OFF
        add     sp, 6
        les     bx, [bp+6]
        les     bx, es:[bx]
        mov     word ptr es:[bx+3ah], ax
        mov     word ptr es:[bx+3ch], dx
        jmp     br_46051
        if      FW_VERSION < 112
        db      90h
        endif
br_46032:
        les     bx, [bp+6]
        push    word ptr es:[bx+2]
        push    word ptr es:[bx]
        nop
        push    cs
        call    sound_list_unlink
        add     sp, 4
        jmp     br_46051
br_46046:
        mov     ax, (C1_BASE+msg_sound_dir_full-C1_SEG*16)
        mov     cx, C1_SEG
        mov     di, ax
        mov     word ptr [bp-0ah], cx
br_46051:
        nop
        push    cs
        call    field_handler_nop
        mov     ax, di
        mov     dx, word ptr [bp-0ah]
        pop     si
        pop     di
        leave
        retf
        db      00h
midi_out_io:
        push    bp
        mov     bp, sp
        cmp     word ptr [bp+8], 1
        jb      br_46076
        ja      br_46072
        cmp     word ptr [bp+6], 5888h
        jb      br_46076
br_46072:
        mov     al, 78h
        leave
        retf
br_46076:
        cmp     word ptr [bp+8], 0
        jne     br_46088
        cmp     word ptr [bp+6], 5622h
        ja      br_46088
        mov     al, 88h
        leave
        retf
        db      90h
br_46088:
        push    0
        push    0ac44h
        push    0
        push    64h
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   EP_AFLMUL_SEG:EP_AFLMUL_OFF
        add     ax, 5622h
        adc     dx, 0
        push    dx
        push    ax
        callf   C0_SEG:(C0_BASE+__aFuldiv-C0_SEG*16)
        mov     bx, ax
        mov     al, byte ptr [bx+C1_TBL_00C24]
        leave
        retf
        db      90h
        db      "Wrong .WAV file format"
        db      00h, 00h
L_460CA:
        db      "not PCM .WAV file"
        db      00h
L_460DC:
        db      "not 16bit .WAV file"
        db      00h
L_460F0:
        db      "Unknown .WAV file"
        db      " format", 000h, 000h
far_4610A:
        mov     word ptr [C0_W_0D762], 7fffh
        sub     ax, ax
        mov     word ptr [C0_W_098DA], ax
        mov     word ptr [C0_W_098D8], ax
        mov     word ptr [C1_W_08EC2], ax
        mov     word ptr [C1_W_08EC0], ax
        mov     word ptr [C0_W_098A4], ax
        mov     word ptr [C0_W_0D7E6], ax
        retf
        db      90h
far_46126:
        push    bp
        mov     bp, sp
        push    si
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr [C0_W_0D7C2], ax
        mov     word ptr [C0_W_0D7C4], dx
        nop
        push    cs
        call    far_3E8D0
        mov     si, ax
        or      si, ax
        jl      br_4614A
        cmp     si, 3
        jg      br_4614A
        mov     byte ptr [C2_B_PAD_DRUM], al
br_4614A:
        push    ds
        push    C1_W_00CEE
        nop
        push    cs
        call    handler_set_install
        add     sp, 4
        callf   [C1_FP_00D62]
        pop     si
        leave
        retf
        db      00h
L_45818:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    7fh
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    far_41C08
        add     sp, 6
        pop     ds
        retf
far_46178:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    0
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    far_41C08
        add     sp, 6
        pop     ds
        retf
load_sound_discard:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_46178
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    sound_list_unlink
        add     sp, 4
        nop
        push    cs
        call    far_3E99C
        pop     ds
        retf
load_sound_keep:
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
        call    far_46178
        mov     cl, byte ptr [C2_B_PAD_NOTE]
        sub     ch, ch
        cmp     cx, 23h
        jl      br_461F0
        cmp     cx, 62h
        jg      br_461F0
        mov     dx, 1
        jmp     br_461F2
br_461F0:
        xor     dx, dx
br_461F2:
        or      dx, dx
        je      br_46215
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        mov     es, word ptr [bp-2]
        mov     bl, byte ptr [C2_B_PAD_NOTE]
        sub     bh, bh
        shl     bx, 2
        add     bx, si
        mov     word ptr es:[bx+752h], ax
        mov     word ptr es:[bx+754h], dx
br_46215:
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        push    0
        push    0
        nop
        push    cs
        call    far_3FF18
        add     sp, 8
        or      ax, ax
        je      br_46236
        nop
        push    cs
        call    far_46340
        pop     ds
        pop     si
        leave
        retf
br_46236:
        nop
        push    cs
        call    far_3E99C
        pop     ds
        pop     si
        leave
        retf
        db      00h
load_sound_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_46178
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    sound_list_unlink
        add     sp, 4
        pop     ds
        retf
        db      00h
load_sound_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    C1_SEG
        push    EP_L_46332_OFF
        nop
        push    cs
        call    far_3ED98
        add     sp, 4
        push    ds
        push    C1_W_00D1C
        nop
        push    cs
        call    disp_list_run
        add     sp, 4
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        push    dx
        push    ax
        push    15h
        push    47h
        nop
        push    cs
        call    draw_string_at
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
        push    27h
        push    83h
        nop
        push    cs
        call    EP_FAR_47CB4_OFF+C1_CSBASE
        add     sp, 0ah
        nop
        push    cs
        call    EP_FIELD_ENGINE_REDRAW_OFF+C1_CSBASE
        pop     ds
        retf
        db      00h
load_sound_pad:
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     cx, ax
        or      cl, cl
        je      br_4631B
        mov     di, word ptr [C2_B_PAD_DRUM]
        and     di, 0ffh
        mov     al, ch
        mov     byte ptr [C2_B_CUR_PAD], ch
        lea     ax, [di+C1_TBL_00060]
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
        jl      br_4630E
        cmp     si, 62h
        jg      br_4630E
        mov     dx, 1
        jmp     br_46310
        db      90h
br_4630E:
        xor     dx, dx
br_46310:
        or      dx, dx
        je      L_46317
        mov     byte ptr [C2_B_PAD_NOTE], al
L_46317:
        callf   [C1_FP_00D62]
br_4631B:
        pop     ds
        pop     si
; field thunk -> ui_field_engine: load a sound window, descriptor DS:0D54h
        pop     di
        retf
        db      00h
far_46320:
        push    ds
        push    C2_B_PAD_NOTE
        push    ds
        push    C1_W_00D54
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF                   ; = 0x3BDBE ui_field_engine
        add     sp, 8
        retf
        db      90h
L_46332:
        db      "Load a Sound"
        db      00h, 00h
far_46340:
        push    ds
        push    C1_W_00D7E
        nop
        push    cs
        call    handler_set_install
        add     sp, 4
        retf
        db      00h
load_sound_exists_replace:
        enter   4, 0
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        lea     ax, [bp-4]
        push    ss
        push    ax
        nop
        push    cs
        call    far_3FF18
        add     sp, 8
        or      ax, ax
        je      br_46395
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    pgm_replace_sound_ref
        add     sp, 8
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    sound_list_unlink
        add     sp, 4
br_46395:
        nop
        push    cs
        call    far_3E99C
        pop     ds
        leave
        retf
        db      00h
load_sound_exists_cancel:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    sound_list_unlink
        add     sp, 4
        nop
        push    cs
        call    far_3E99C
        pop     ds
        retf
        db      00h
load_sound_exists_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    sound_list_unlink
        add     sp, 4
        pop     ds
        retf
load_sound_exists_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    EP_MSG_FILE_EXISTS_SEG
        push    EP_MSG_FILE_EXISTS_OFF
        nop
        push    cs
        call    far_3ED98
        add     sp, 4
        push    ds
        push    C1_W_00DA2
        nop
        push    cs
        call    disp_list_run
        add     sp, 4
        pop     ds
        retf
load_sound_exists_rename:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    C1_SEG
        push    EP_L_46436_OFF
        push    32h
        nop
        push    cs
        call    handler_install_one
        add     sp, 6
        push    0
        push    0
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        push    dx
        push    ax
        nop
        push    cs
        call    far_3EE00
        add     sp, 8
        push    EP_LOAD_SOUND_EXISTS_REFRESH_SEG
        push    EP_LOAD_SOUND_EXISTS_REFRESH_OFF
        push    34h
        nop
        push    cs
        call    handler_install_one
        add     sp, 6
        pop     ds
        retf
L_46436:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        push    0
        push    0
        nop
        push    cs
        call    far_3FF18
        add     sp, 8
        or      ax, ax
        je      br_4645C
        nop
        push    cs
        call    far_46340
        pop     ds
        retf
        db      90h
br_4645C:
        nop
        push    cs
        call    far_3E99C
        pop     ds
        retf
        db      90h
msg_file_exists:
        db      "File Already Ex"
        db      "ists", 000h
far_46478:
        enter   4, 0
        cmp     byte ptr [bp+0eh], 0
        jne     br_46496
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    far_464C0
        jmp     br_464A7
        db      90h
br_46496:
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   EP_L_3A26E_SEG:EP_L_3A26E_OFF
br_464A7:
        add     sp, 8
        mov     word ptr [bp-4], ax
        mov     ax, dx
        or      ax, word ptr [bp-4]
        je      br_464BD
        push    dx
        push    word ptr [bp-4]
        callf   EP_DISP_ALERT_WAIT_KEY_SEG:EP_DISP_ALERT_WAIT_KEY_OFF
br_464BD:
        leave
        retf
        db      00h
far_464C0:
        enter   2eh, 0
        push    di
        push    si
        mov     byte ptr [bp-6], 1
        mov     byte ptr [bp-5], 4
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     ax, 12h
        push    ds
        lea     di, [bp-2eh]
        mov     si, ax
        push    ss
        pop     es
        mov     ds, dx
        mov     cx, 14h
        rep movsw
        pop     ds
        push    10h
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        lea     ax, [bp-2eh]
        push    ss
        push    ax
        callf   EP_FSTRNCPY_SEG:EP_FSTRNCPY_OFF
        add     sp, 0ah
        push    1
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    disk_progress_msg
        add     sp, 6
        push    1
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    fs_open
        add     sp, 6
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_46529
        jmp     br_465C0
br_46529:
        callf   EP_FAR_37E82_SEG:EP_FAR_37E82_OFF
        cmp     ax, 2
        je      br_46536
        jmp     br_465CC
br_46536:
        xor     ax, ax
        mov     cx, 20h
        xor     bx, bx
        mov     dx, 7f00h
        mov     di, bx
        mov     es, dx
        rep stosw
        or      byte ptr [bp-6], 80h
        mov     ax, word ptr [bp-6]
        mov     word ptr es:[bx], ax
        mov     ax, 4
        mov     word ptr es:[2], 38h
        push    ds
        mov     di, ax
        lea     si, [bp-2eh]
        push    ss
        pop     ds
        mov     cx, 14h
        rep movsw
        pop     ds
        les     bx, [bp+6]
        mov     ax, word ptr es:[bx+0eh]
        mov     dx, word ptr es:[bx+10h]
        mov     bx, 7f00h
        mov     es, bx
        db      26h, 89h, 06h, 3ch, 00h
        mov     word ptr es:[3eh], dx
        push    1
        push    40h
        push    bx
        push    0
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     br_465C6
        les     bx, [bp+6]
        push    word ptr es:[bx+10h]
        push    word ptr es:[bx+0eh]
        push    word ptr es:[bx+C1_TBL_0000C]
        push    word ptr es:[bx+0ah]
        nop
        push    cs
        call    far_42E1C
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        jmp     br_4665F
br_465C0:
        mov     si, ax
        jmp     br_4666B
        db      90h
br_465C6:
        mov     si, ax
        jmp     br_4665F
        db      90h
br_465CC:
        push    1
        push    2
        lea     ax, [bp-6]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     br_4665F
        push    1
        push    28h
        lea     ax, [bp-2eh]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_write
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     br_4665F
        mov     di, word ptr [bp+6]
        push    word ptr [bp-10h]
        push    word ptr [bp-12h]
        mov     es, word ptr [bp+8]
        push    word ptr es:[di+C1_TBL_0000C]
        push    word ptr es:[di+0ah]
        nop
        push    cs
        call    far_42E1C
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     br_4665F
        cmp     byte ptr [bp-1bh], 0
        je      br_4665F
        push    word ptr [bp-10h]
        push    word ptr [bp-12h]
        push    0
        push    2
        mov     es, word ptr [bp+8]
        push    word ptr es:[di+10h]
        push    word ptr es:[di+0eh]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     es, word ptr [bp+8]
        add     ax, word ptr es:[di+0ah]
        adc     dx, word ptr es:[di+C1_TBL_0000C]
        push    dx
        push    ax
        nop
        push    cs
        call    far_42E1C
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-2], dx
br_4665F:
        if      FW_VERSION >= 112
        mov     ax, word ptr [bp-2]
        or      ax, si
        jne     br_4666B
        endif
        callf   EP_DISK_FILE_CLOSE_SEG:EP_DISK_FILE_CLOSE_OFF
br_4666B:
        nop
        push    cs
        call    field_handler_nop
        mov     ax, si
        mov     dx, word ptr [bp-2]
        pop     si
        pop     di
        leave
        retf
        if      FW_VERSION >= 112
        nop
        endif
        db      "AKAI MPC2000XL", 00h, 00h
far_4668A:
        mov     ax, C1_TBL_SOUNDS_END
        mov     cx, ds
        cmp     ax, word ptr [C0_W_0D7C2]
        jne     br_4669B
        cmp     cx, word ptr [C0_W_0D7C4]
        je      br_466C4
br_4669B:
        push    ds
        push    C1_W_00DF0
        nop
        push    cs
        call    handler_set_install
        add     sp, 4
        cmp     word ptr [C1_W_SAVE_SND_CURSOR], 0
        jl      save_a_sound_f3
        cmp     word ptr [C1_W_SAVE_SND_CURSOR], 2
        jb      br_466BB
save_a_sound_f3:
        mov     word ptr [C1_W_SAVE_SND_CURSOR], 0
br_466BB:
        imul    bx, word ptr [C1_W_SAVE_SND_CURSOR], 2ah
        callf   [bx+C1_TBL_00E46]
br_466C4:
        retf
        db      00h
save_a_sound_wipe:
        enter   4, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   EP_FAR_37E82_SEG:EP_FAR_37E82_OFF
        or      ax, ax
        jne     br_46752
        mov     bx, word ptr [C0_W_0D7C2]
        mov     cx, word ptr [C0_W_0D7C4]
        add     bx, 12h
        mov     di, bx
        mov     si, 0d7e8h
        mov     es, cx
        push    ds
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
        cmp     byte ptr [C1_B_0D7CB], 0
        je      br_46716
        mov     ax, (C1_BASE+L_43130-C1_SEG*16)
        mov     dx, C1_SEG
        jmp     br_4671C
        db      90h
br_46716:
        mov     ax, (C1_BASE+L_42B12-C1_SEG*16)
        mov     dx, C1_SEG
br_4671C:
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     si, 0d7e8h
        push    ds
        les     di, [bp-4]
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        mov     bx, cx
        xchg    di, si
        push    ds
        push    es
        pop     ds
        pop     es
        mov     cx, 0ffffh
        repne scasb
        dec     di
        mov     cx, bx
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        nop
        push    cs
        call    far_469A8
br_46752:
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h
save_a_sound_cancel:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_3E99C
        pop     ds
        retf
        db      00h
save_a_sound_save:
        enter   4, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     bx, word ptr [C0_W_0D7C2]
        mov     cx, word ptr [C0_W_0D7C4]
        add     bx, 12h
        mov     di, bx
        mov     si, 0d7e8h
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
        cmp     byte ptr [C1_B_0D7CB], al
        je      br_467AE
        mov     ax, (C1_BASE+L_43130-C1_SEG*16)
        mov     dx, C1_SEG
        jmp     br_467B4
        db      90h
br_467AE:
        mov     ax, (C1_BASE+L_42B12-C1_SEG*16)
        mov     dx, C1_SEG
br_467B4:
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     si, 0d7e8h
        push    ds
        les     di, [bp-4]
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        mov     bx, cx
        xchg    di, si
        push    ds
        push    es
        pop     ds
        pop     es
        mov     cx, 0ffffh
        repne scasb
        dec     di
        mov     cx, bx
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        push    ds
        push    C0_W_0D7E8
        nop
        push    cs
        call    fs_find_file
        add     sp, 4
        or      ax, ax
        jne     br_46800
        nop
        push    cs
        call    far_468EA
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      90h
br_46800:
        mov     al, byte ptr [C1_B_0D7CB]
        push    ax
        push    ds
        push    C0_W_0D7E8
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        nop
        push    cs
        call    far_46478
        add     sp, 0ah
        nop
        push    cs
        call    far_3E99C
        pop     ds
        pop     si
        pop     di
        leave
        retf
save_a_sound_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    C1_SEG
        if      FW_VERSION >= 112
        push    EP_L_468D0_OFF
        else
        push    C1_W_08722
        endif
        nop
        push    cs
        call    far_3ED98
        add     sp, 4
        push    ds
        push    C1_W_00E0E
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
        push    47h
        nop
        push    cs
        call    draw_string_at
        add     sp, 8
        cmp     byte ptr [C1_B_0D7CB], 0
        je      br_4686A
        mov     ax, C1_W_0874E
        mov     dx, C1_SEG
        jmp     br_46870
        db      90h
br_4686A:
        mov     ax, C1_W_08752
        mov     dx, C1_SEG
br_46870:
        push    dx
        push    ax
        push    25h
        push    65h
        nop
        push    cs
        call    draw_string_at
        add     sp, 8
        callf   EP_FAR_37E82_SEG:EP_FAR_37E82_OFF
        or      ax, ax
        jne     L_45F4B
        push    C1_SEG
        if      FW_VERSION >= 120
        push    STR_C1_WIPE
        else
        push    EP_MSG_SOFTKEY_WIPE_OFF
        endif
        push    1
        push    3
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
L_45F4B:
        nop
        push    cs
        call    EP_FIELD_ENGINE_REDRAW_OFF+C1_CSBASE
        pop     ds
        retf
save_snd_field0_thunk:                  ; descriptor DS:0e38h
        mov     word ptr [C1_W_SAVE_SND_CURSOR], 0
        push    ds
        push    C0_W_0D7C2
        push    ds
        push    C1_W_00E38
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF                   ; = 0x3BDBE ui_field_engine
        add     sp, 8
        retf
        db      00h
save_snd_field1_thunk:                  ; descriptor DS:0e62h
        mov     word ptr [C1_W_SAVE_SND_CURSOR], 1
        push    ds
        push    C1_B_0D7CB
        push    ds
        push    C1_W_00E62
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF                   ; = 0x3BDBE ui_field_engine
        add     sp, 8
        retf
        db      90h
L_468D0:
        db      "Save a Sound"
        db      00h, 00h
L_468DE:
        db      57h, 41h, 56h, 00h
L_468E2:
        db      "MPC2000"
        db      00h
far_468EA:
        push    ds
        push    C1_W_00E8C
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        retf
        db      00h
file_exists_f4:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_3E99C
        pop     ds
        retf
        db      00h
file_exists_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    EP_MSG_FILE_EXISTS_SEG
        push    EP_MSG_FILE_EXISTS_OFF
        nop
        push    cs
        call    far_3ED98
        add     sp, 4
        push    ds
        push    C1_W_00EAA
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        callf   EP_FAR_37E82_SEG:EP_FAR_37E82_OFF
        cmp     ax, 2
        jne     br_46947
        cmp     byte ptr [C0_B_0D7F9], 53h
        jne     br_46947
        push    ds
        push    C0_W_0D7E8
        nop
        push    cs
        if      FW_VERSION >= 112
        call    EP_L_3E92C_OFF+C1_CSBASE
        else
        call    L_3E92C
        endif
        add     sp, 4
        or      ax, ax
        jne     br_46953
br_46947:
        push    ds
        push    C1_W_00ED8
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
br_46953:
        pop     ds
        retf
        db      00h
file_exists_f5:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     byte ptr [C0_B_0D7F8], 0
        push    EP_DIV_SEG
        push    EP_L_3A7C4_OFF
        push    32h
        nop
        push    cs
        call    handler_install_one
        add     sp, 6
        push    0
        push    0
        push    ds
        push    C0_W_0D7E8
        nop
        push    cs
        call    far_3EE00
        add     sp, 8
        pop     ds
        retf
        db      00h
L_46984:
        db      "File already exists"
        db      00h
msg_internal_error:
        db      "Internal er"
        db      72h, 6fh, 72h, 00h, 00h
far_469A8:
        push    ds
        push    C1_W_00EFA
        nop
        push    cs
        call    EP_HANDLER_SET_INSTALL_OFF+C1_CSBASE
        add     sp, 4
        retf
        db      00h
L_469B6:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    EP_FAR_3E99C_OFF+C1_CSBASE
        pop     ds
        retf
        db      00h
L_469C4:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    EP_FS_OPEN_SEG
        push    EP_L_469F0_OFF
        push    3ah
        push    0b6h
        push    2
        push    24h
        nop
        push    cs
        call    draw_frame_window
        add     sp, 0ch
        push    ds
        push    C1_W_00F14
        nop
        push    cs
        call    EP_DISP_LIST_RUN_OFF+C1_CSBASE
        add     sp, 4
        pop     ds
        retf
        db      00h
L_469F0:
        db      "Wipe Disk"
        db      00h
L_469FA:
        db      "Unknown file format"
        db      00h
far_46A0E:
        enter   8, 0
        push    ds
        push    C0_W_098C2
        lea     ax, [bp-8]
        push    ss
        push    ax
        nop
        push    cs
        call    fn_46A48
        add     sp, 8
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     br_46A3A
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        nop
        push    cs
        call    far_46126
        add     sp, 4
        leave
        retf
br_46A3A:
        push    word ptr [bp-2]
        push    ax
        callf   EP_DISP_ALERT_WAIT_KEY_SEG:EP_DISP_ALERT_WAIT_KEY_OFF
        add     sp, 4
        leave
        retf
fn_46A48:
        enter   60h, 0
        push    di
        push    si
        mov     di, word ptr [bp+0ah]
        push    0
        push    word ptr [bp+0ch]
        push    di
        nop
        push    cs
        call    disk_progress_msg
        add     sp, 6
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    sound_record_alloc
        add     sp, 4
        or      ax, ax
        jne     br_46A74
        jmp     br_46F6A
br_46A74:
        push    10h
        push    word ptr [bp+0ch]
        push    di
        les     bx, [bp+6]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        add     ax, 12h
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    dx
        push    ax
        callf   EP_FSTRNCPY_SEG:EP_FSTRNCPY_OFF
        add     sp, 0ah
        mov     es, word ptr [bp-2]
        sub     ax, ax
        mov     word ptr es:[si+16h], ax
        mov     word ptr es:[si+14h], ax
        push    ax
        push    word ptr [bp+0ch]
        push    di
        nop
        push    cs
        call    fs_open
        add     sp, 6
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      br_46AC0
        mov     di, ax
        jmp     br_46F73
        db      90h
br_46AC0:
        push    1
        push    3bh
        lea     ax, [bp-60h]
        push    ss
        push    ax
        nop
        push    cs
        call    fs_read
        add     sp, 8
        mov     di, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      br_46ADD
        jmp     br_46F5B
br_46ADD:
        mov     al, byte ptr [bp-26h]
        and     al, 1
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+24h], al
        mov     ax, word ptr [bp-2ch]
        mov     word ptr es:[si+26h], ax
        push    word ptr [bp-2ah]
        push    word ptr [bp-2ch]
        nop
        push    cs
        call    midi_out_io
        add     sp, 4
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+12h], al
        mov     ax, word ptr [bp-44h]
        mov     dx, word ptr [bp-42h]
        sub     ax, word ptr [bp-4ch]
        sbb     dx, word ptr [bp-4ah]
        shr     dx, 1
        rcr     ax, 1
        add     ax, 1
        adc     dx, 0
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        mov     ax, word ptr [bp-34h]
        mov     dx, word ptr [bp-32h]
        sub     ax, word ptr [bp-3ch]
        sbb     dx, word ptr [bp-3ah]
        shr     dx, 1
        rcr     ax, 1
        add     ax, 1
        adc     dx, 0
        mov     word ptr [bp-14h], ax
        mov     word ptr [bp-12h], dx
        mov     ax, word ptr [bp-34h]
        mov     dx, word ptr [bp-32h]
        sub     ax, word ptr [bp-4ch]
        sbb     dx, word ptr [bp-4ah]
        shr     dx, 1
        rcr     ax, 1
        add     ax, 1
        adc     dx, 0
        mov     word ptr [bp-18h], ax
        mov     word ptr [bp-16h], dx
        mov     ax, word ptr [bp-40h]
        mov     dx, word ptr [bp-3eh]
        sub     ax, word ptr [bp-48h]
        sbb     dx, word ptr [bp-46h]
        shr     dx, 1
        rcr     ax, 1
        add     ax, 1
        adc     dx, 0
        mov     word ptr [bp-1ch], ax
        mov     word ptr [bp-1ah], dx
        mov     ax, word ptr [bp-30h]
        mov     dx, word ptr [bp-2eh]
        sub     ax, word ptr [bp-38h]
        sbb     dx, word ptr [bp-36h]
        shr     dx, 1
        rcr     ax, 1
        add     ax, 1
        adc     dx, 0
        mov     word ptr [bp-20h], ax
        mov     word ptr [bp-1eh], dx
        mov     ax, word ptr [bp-30h]
        mov     dx, word ptr [bp-2eh]
        sub     ax, word ptr [bp-48h]
        sbb     dx, word ptr [bp-46h]
        shr     dx, 1
        rcr     ax, 1
        add     ax, 1
        adc     dx, 0
        mov     word ptr [bp-24h], ax
        mov     word ptr [bp-22h], dx
        mov     al, byte ptr [bp-26h]
        and     ax, 60h
        sub     ax, 20h
        jne     br_46BBB
        jmp     br_46E14
br_46BBB:
        sub     ax, 20h
        jne     br_46BC3
        jmp     br_46E48
br_46BC3:
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+13h], 1
        mov     ax, word ptr [bp-4ch]
        mov     dx, word ptr [bp-4ah]
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        cmp     dx, word ptr [bp-46h]
        jb      br_46BEF
        ja      br_46BE3
        cmp     ax, word ptr [bp-48h]
        jbe     br_46BEF
br_46BE3:
        mov     ax, word ptr [bp-48h]
        mov     dx, word ptr [bp-46h]
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
br_46BEF:
        push    0
        push    word ptr [bp-0eh]
        push    word ptr [bp-10h]
        nop
        push    cs
        call    fs_seek
        add     sp, 6
        mov     di, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      br_46C0B
        jmp     NEAR br_46F5B
br_46C0B:
        mov     ax, word ptr [bp-0ch]
        mov     dx, word ptr [bp-0ah]
        cmp     word ptr [bp-1ah], dx
        jl      br_46C3E
        jg      br_46C1D
        cmp     word ptr [bp-1ch], ax
        jbe     br_46C3E
br_46C1D:
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+1ch], ax
        mov     word ptr es:[si+1eh], dx
        mov     ax, word ptr [bp-14h]
        mov     dx, word ptr [bp-12h]
        mov     word ptr es:[si+20h], ax
        mov     word ptr es:[si+22h], dx
        mov     ax, word ptr [bp-18h]
        mov     dx, word ptr [bp-16h]
        jmp     br_46C63
br_46C3E:
        mov     ax, word ptr [bp-1ch]
        mov     dx, word ptr [bp-1ah]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+1ch], ax
        mov     word ptr es:[si+1eh], dx
        mov     ax, word ptr [bp-20h]
        mov     dx, word ptr [bp-1eh]
        mov     word ptr es:[si+20h], ax
        mov     word ptr es:[si+22h], dx
        mov     ax, word ptr [bp-24h]
        mov     dx, word ptr [bp-22h]
br_46C63:
        mov     word ptr es:[si+18h], ax
        mov     word ptr es:[si+1ah], dx
        mov     es, word ptr [bp-2]
        cmp     byte ptr es:[si+24h], 0
        jne     br_46C85
        mov     ax, word ptr es:[si+1ch]
        mov     dx, word ptr es:[si+1eh]
        mov     word ptr es:[si+18h], ax
        mov     word ptr es:[si+1ah], dx
br_46C85:
        push    0
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+22h]
        push    word ptr es:[si+20h]
        callf   EP_ADDR_CALC_SEGMENT_SEG:EP_ADDR_CALC_SEGMENT_OFF
        add     sp, 6
        les     bx, [bp+6]
        les     bx, es:[bx]
        mov     word ptr es:[bx+3ah], ax
        mov     word ptr es:[bx+3ch], dx
        push    2
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+1eh]
        push    word ptr es:[si+1ch]
        nop
        push    cs
        call    size_para_round_mul
        add     sp, 6
        les     bx, [bp+6]
        les     bx, es:[bx]
        mov     word ptr es:[bx+0eh], ax
        mov     word ptr es:[bx+10h], dx
        nop
        push    cs
        call    smem_free_bytes
        or      dx, dx
        jge     br_46CE2
loop_46CD4:
        mov     ax, (C1_BASE+L_415CA-C1_SEG*16)
        mov     cx, C1_SEG
        mov     di, ax
        mov     word ptr [bp-6], cx
        jmp     NEAR br_46F5B
br_46CE2:
        mov     word ptr [bp-4], si
        les     bx, [bp+6]
        les     bx, es:[bx]
        mov     ax, word ptr es:[bx+0ah]
        mov     dx, word ptr es:[bx+C1_TBL_0000C]
        add     ax, word ptr es:[bx+0eh]
        adc     dx, word ptr es:[bx+10h]
        cmp     dx, word ptr [C2_W_SMEM_SIZE_HI]
        jl      br_46D0E
        jg      br_46D09
        cmp     ax, word ptr [C0_W_SMEM_SIZE]
        jbe     br_46D0E
br_46D09:
        nop
        push    cs
        call    smem_compact
br_46D0E:
        push    0
        push    2
        les     bx, [bp+6]
        les     bx, es:[bx]
        push    word ptr es:[bx+10h]
        push    word ptr es:[bx+0eh]
        mov     si, bx
        mov     di, es
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     es, di
        add     ax, word ptr es:[si+0ah]
        adc     dx, word ptr es:[si+C1_TBL_0000C]
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        mov     ax, word ptr [bp-48h]
        mov     dx, word ptr [bp-46h]
        cmp     word ptr [bp-4ah], dx
        ja      br_46DB8
        jb      br_46D4B
        cmp     word ptr [bp-4ch], ax
        jae     br_46DB8
br_46D4B:
        les     bx, [bp-4]
        push    word ptr es:[bx+1eh]
        push    word ptr es:[bx+1ch]
        les     bx, [bp+6]
        les     bx, es:[bx]
        push    word ptr es:[bx+C1_TBL_0000C]
        push    word ptr es:[bx+0ah]
        nop
        push    cs
        call    fs_read_to_smem
        add     sp, 8
        mov     di, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      br_46D78
        jmp     br_46F5B
br_46D78:
        push    0
        push    word ptr [bp-46h]
        push    word ptr [bp-48h]
        nop
        push    cs
        call    fs_seek
        add     sp, 6
        mov     di, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      br_46D94
        jmp     br_46F5B
br_46D94:
        les     bx, [bp-4]
        push    word ptr es:[bx+1eh]
        push    word ptr es:[bx+1ch]
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
loop_46DA5:
        nop
        push    cs
        call    fs_read_to_smem
        add     sp, 8
        mov     di, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jmp     br_46F5B
        db      90h
br_46DB8:
        les     bx, [bp-4]
        push    word ptr es:[bx+1eh]
        push    word ptr es:[bx+1ch]
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        nop
        push    cs
        call    fs_read_to_smem
        add     sp, 8
        mov     di, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      br_46DDD
        jmp     br_46F5B
br_46DDD:
        push    0
        push    word ptr [bp-4ah]
        push    word ptr [bp-4ch]
        nop
        push    cs
        call    fs_seek
        add     sp, 6
        mov     di, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      br_46DF9
        jmp     br_46F5B
br_46DF9:
        les     bx, [bp-4]
        push    word ptr es:[bx+1eh]
        push    word ptr es:[bx+1ch]
        les     bx, [bp+6]
        les     bx, es:[bx]
        push    word ptr es:[bx+C1_TBL_0000C]
        push    word ptr es:[bx+0ah]
        jmp     loop_46DA5
br_46E14:
        mov     ax, word ptr [bp-4ch]
        mov     dx, word ptr [bp-4ah]
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        mov     ax, word ptr [bp-0ch]
        mov     dx, word ptr [bp-0ah]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+1ch], ax
        mov     word ptr es:[si+1eh], dx
        mov     ax, word ptr [bp-14h]
        mov     dx, word ptr [bp-12h]
        mov     word ptr es:[si+20h], ax
        mov     word ptr es:[si+22h], dx
        mov     ax, word ptr [bp-18h]
        mov     dx, word ptr [bp-16h]
        jmp     br_46E79
        db      90h
br_46E48:
        mov     ax, word ptr [bp-48h]
        mov     dx, word ptr [bp-46h]
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        mov     ax, word ptr [bp-1ch]
        mov     dx, word ptr [bp-1ah]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+1ch], ax
        mov     word ptr es:[si+1eh], dx
        mov     ax, word ptr [bp-20h]
        mov     dx, word ptr [bp-1eh]
        mov     word ptr es:[si+20h], ax
        mov     word ptr es:[si+22h], dx
        mov     ax, word ptr [bp-24h]
        mov     dx, word ptr [bp-22h]
br_46E79:
        mov     word ptr es:[si+18h], ax
        mov     word ptr es:[si+1ah], dx
        mov     es, word ptr [bp-2]
        cmp     byte ptr es:[si+24h], 0
        jne     br_46E9B
        mov     ax, word ptr es:[si+1ch]
        mov     dx, word ptr es:[si+1eh]
        mov     word ptr es:[si+18h], ax
        mov     word ptr es:[si+1ah], dx
br_46E9B:
        push    0
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+22h]
        push    word ptr es:[si+20h]
        callf   EP_ADDR_CALC_SEGMENT_SEG:EP_ADDR_CALC_SEGMENT_OFF
        add     sp, 6
        les     bx, [bp+6]
        les     bx, es:[bx]
        mov     word ptr es:[bx+3ah], ax
        mov     word ptr es:[bx+3ch], dx
        push    0
        push    word ptr [bp-0eh]
        push    word ptr [bp-10h]
        nop
        push    cs
        call    fs_seek
        add     sp, 6
        mov     di, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      br_46EDA
        jmp     NEAR br_46F5B
br_46EDA:
        push    1
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+1eh]
        push    word ptr es:[si+1ch]
        nop
        push    cs
        call    size_para_round_mul
        add     sp, 6
        les     bx, [bp+6]
        les     bx, es:[bx]
        mov     word ptr es:[bx+0eh], ax
        mov     word ptr es:[bx+10h], dx
        nop
        push    cs
        call    smem_free_bytes
        or      dx, dx
        jge     br_46F09
        jmp     loop_46CD4
        GROW_PAD c1_grown, C1_END, SEG_C2 ; growth in c1 and c2's head keeps C2_SEG on a paragraph
br_46F09:
        mov     word ptr [bp-4], si
        les     bx, [bp+6]
        les     bx, es:[bx]
        mov     ax, word ptr es:[bx+0ah]
        mov     dx, word ptr es:[bx+C1_TBL_0000C]
        add     ax, word ptr es:[bx+0eh]
        adc     dx, word ptr es:[bx+10h]
        cmp     dx, word ptr [C2_W_SMEM_SIZE_HI]
        jl      br_46F35
        jg      br_46F30
        cmp     ax, word ptr [C0_W_SMEM_SIZE]
        jbe     br_46F35
br_46F30:
        nop
        push    cs
        call    smem_compact
br_46F35:
        les     bx, [bp-4]
        push    word ptr es:[bx+1eh]
        push    word ptr es:[bx+1ch]
        les     bx, [bp+6]
        les     bx, es:[bx]
        push    word ptr es:[bx+C1_TBL_0000C]
        push    word ptr es:[bx+0ah]
        nop
        push    cs
        call    fs_read_to_smem
        add     sp, 8
        mov     di, ax
        mov     word ptr [bp-6], dx
br_46F5B:
        if      FW_VERSION >= 112
        mov     ax, word ptr [bp-6]
        or      ax, di
        jne     br_46F73
        endif
        callf   EP_DISK_FILE_CLOSE_SEG:EP_DISK_FILE_CLOSE_OFF
        jmp     SHORT br_46F73
        if      FW_VERSION >= 112
        db      90h
        endif
br_46F6A:
        mov     di, (C1_BASE+msg_sound_dir_full-C1_SEG*16)
        mov     cx, C1_SEG
        mov     word ptr [bp-6], cx
br_46F73:
        mov     ax, word ptr [bp-6]
        or      ax, di
        je      br_46F8C
        les     bx, [bp+6]
        push    word ptr es:[bx+2]
        push    word ptr es:[bx]
        nop
        push    cs
        call    sound_list_unlink
        add     sp, 4
br_46F8C:
        nop
        push    cs
C1_END:
