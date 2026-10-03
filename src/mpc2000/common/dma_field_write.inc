; DMA field writer: far pointer to a DSPV block (es:bx), control word
; (ax, OR'd with per-field channel-select, written to DMA_CTRL), 15-bit
; flags word selects struct fields to output via DMA_ADDR_HI/DATA_HI/DATA_LO.
; 418 bytes.  byte-identical in SYS v1.72 (text2 linear 0x1652-0x17F4, file
; 0xF612-0xF7B4), v1.50 (text2 0x1632), XL v1.20 (flash 0x3E5FC-0x3E79E)
; except flags/control swap: SYS [bp+6]/[bp+0Ch], XL [bp+0Ch]/[bp+6].
; parameters: DMA_FIELD_FLAGS_OFS, DMA_FIELD_CTRL_OFS;
; other displacements ([bp+8] struct pointer, [bp+0Ah] segment,
; DSPV field offsets) identical in both, need no parameter.
; ends at 'leave'; includer supplies return.

        include "dspv.inc"

dma_field_write:
        push    bp
        mov     bp, sp
        push    di
; if DFW_GUARD_SEG:DFW_GUARD_OFF defined, runs with interrupts
; disabled, loads registers, popf restores flags, returns past nop.
; includer drops pad byte after its return.
        ifdef   DFW_GUARD_SEG
        jmpf    DFW_GUARD_SEG:DFW_GUARD_OFF
        nop
        else
        mov     di, word ptr [bp+DMA_FIELD_FLAGS_OFS]
        mov     bx, word ptr [bp+8]
        endif
dma_field_write_loaded:
        test    di, 1
        je      L_01670
        mov     ax, word ptr [bp+DMA_FIELD_CTRL_OFS]
        out     DMA_CTRL, ax
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[bx+DSPV_ADDR]
        out     DMA_ADDR_HI, ax

L_01670:
        test    di, 2
        je      L_0168F
        mov     ax, word ptr [bp+DMA_FIELD_CTRL_OFS]
        out     DMA_CTRL, ax
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[bx+DSPV_ADDR]
        out     DMA_ADDR_HI, ax
        mov     ax, word ptr es:[bx+DSPV_G0_HI]
        out     DMA_DATA_HI, ax
        mov     ax, word ptr es:[bx]
        out     DMA_DATA_LO, ax

L_0168F:
        test    di, 4
        je      L_016A6
        mov     ax, word ptr [bp+DMA_FIELD_CTRL_OFS]
        or      ah, 1
        out     DMA_CTRL, ax
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[bx+DSPV_G1_LO]
        out     DMA_DATA_LO, ax

L_016A6:
        test    di, 8
        je      L_016BD
        mov     ax, word ptr [bp+DMA_FIELD_CTRL_OFS]
        or      ah, 4
        out     DMA_CTRL, ax
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[bx+DSPV_G4_LO]
        out     DMA_DATA_LO, ax

L_016BD:
        test    di, 10h
        je      L_016D4
        mov     ax, word ptr [bp+DMA_FIELD_CTRL_OFS]
        or      ah, 4
        out     DMA_CTRL, ax
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[bx+DSPV_G4_HI]
        out     DMA_DATA_HI, ax

L_016D4:
        test    di, 20h
        je      L_016EB
        mov     ax, word ptr [bp+DMA_FIELD_CTRL_OFS]
        or      ah, 6
        out     DMA_CTRL, ax
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[bx+DSPV_G6_LO]
        out     DMA_DATA_LO, ax

L_016EB:
        test    di, 40h
        je      L_01702
        mov     ax, word ptr [bp+DMA_FIELD_CTRL_OFS]
        or      ah, 6
        out     DMA_CTRL, ax
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[bx+DSPV_G6_HI]
        out     DMA_DATA_HI, ax

L_01702:
        test    di, 80h
        je      L_01723
        mov     ax, word ptr [bp+DMA_FIELD_CTRL_OFS]
        or      ah, 5
        out     DMA_CTRL, ax
        mov     es, word ptr [bp+0ah]
        mov     cx, word ptr es:[bx+DSPV_G5_LO]
        mov     dx, word ptr es:[bx+DSPV_G5_HI]
        mov     ax, dx
        out     DMA_DATA_HI, ax
        mov     ax, cx
        out     DMA_DATA_LO, ax

L_01723:
        test    di, 100h
        je      L_01744
        mov     ax, word ptr [bp+DMA_FIELD_CTRL_OFS]
        or      ah, 3
        out     DMA_CTRL, ax
        mov     es, word ptr [bp+0ah]
        mov     cx, word ptr es:[bx+DSPV_G3_LO]
        mov     dx, word ptr es:[bx+DSPV_G3_HI]
        mov     ax, dx
        out     DMA_DATA_HI, ax
        mov     ax, cx
        out     DMA_DATA_LO, ax

L_01744:
        test    di, 200h
        je      L_0175B
        mov     ax, word ptr [bp+DMA_FIELD_CTRL_OFS]
        or      ah, 7
        out     DMA_CTRL, ax
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[bx+DSPV_G7_LO]
        out     DMA_DATA_LO, ax

L_0175B:
        test    di, 400h
        je      L_01772
        mov     ax, word ptr [bp+DMA_FIELD_CTRL_OFS]
        or      ah, 7
        out     DMA_CTRL, ax
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[bx+DSPV_G7_HI]
        out     DMA_DATA_HI, ax

L_01772:
        test    di, 800h
        je      L_0178F
        mov     ax, word ptr [bp+DMA_FIELD_CTRL_OFS]
        or      ah, 2
        out     DMA_CTRL, ax
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[bx+DSPV_G2_HI]
        out     DMA_DATA_HI, ax
        mov     ax, word ptr es:[bx+DSPV_G2_LO]
        out     DMA_DATA_LO, ax

L_0178F:
        test    di, 1000h
        je      L_017B0
        mov     ax, word ptr [bp+DMA_FIELD_CTRL_OFS]
        or      ah, 1
        out     DMA_CTRL, ax
        mov     es, word ptr [bp+0ah]
        mov     cx, word ptr es:[bx+DSPV_G1_HI]
        mov     dx, word ptr es:[bx+DSPV_ADDR2]
        mov     ax, dx
        out     DMA_ADDR_HI, ax
        mov     ax, cx
        out     DMA_DATA_HI, ax

L_017B0:
        test    di, 2000h
        je      L_017D1
        mov     ax, word ptr [bp+DMA_FIELD_CTRL_OFS]
        or      ah, 8
        out     DMA_CTRL, ax
        mov     es, word ptr [bp+0ah]
        mov     cx, word ptr es:[bx+DSPV_G8_LO]
        mov     dx, word ptr es:[bx+DSPV_G8_HI]
        mov     ax, dx
        out     DMA_DATA_HI, ax
        mov     ax, cx
        out     DMA_DATA_LO, ax

L_017D1:
        test    di, 4000h
        je      L_017F2
        mov     ax, word ptr [bp+DMA_FIELD_CTRL_OFS]
        or      ah, 9
        out     DMA_CTRL, ax
        mov     es, word ptr [bp+0ah]
        mov     cx, word ptr es:[bx+DSPV_G9_LO]
        mov     dx, word ptr es:[bx+DSPV_G9_HI]
        mov     ax, dx
        out     DMA_DATA_HI, ax
        mov     ax, cx
        out     DMA_DATA_LO, ax

L_017F2:
        ifdef   DFW_GUARD_SEG
        popf
        endif
        pop     di
        leave
; caller-cleanup convention differs here: SYS pops own 4 words
; (retf 8), XL leaves to caller (bare retf).  includer supplies
; return instruction right after include.
