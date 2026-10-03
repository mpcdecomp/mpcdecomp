; MPC2000.SYS text1, v1.50 and v1.72 -- the first code segment, paragraph
; TEXT1_SEG = 0, reset entry at +0x10; ends where TEXT2_SEG begins.  one text
; for both: what differs is under FW_VERSION, set by each version's image.asm.

RUN_DRAW_PAD_FIELD macro x,y,field
        push    x
        push    y
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+field]
        cbw
        cwd
        push    dx
        push    ax
        push    3
        callf   TEXT2_SEG:draw_unsigned_value
        endm


        db      16 dup (0)

sys_start:
        cli
        cld
        nop
        push    cs
        call    X_003EA
        int     32h                       ; Threaded dispatch
        db      00h, 0c3h, 00h

        include "../../../common/crt_int_math.inc"

__aFFalmul:
        push    bp
        mov     bp, sp
        push    ds
        push    bx
        lds     bx, [bp+6]
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bx+2]
        push    word ptr [bx]
        push    cs
        call    __aFlmul
        mov     word ptr [bx], ax
        mov     word ptr [bx+2], dx
        pop     bx
        pop     ds
        pop     bp
        retf    8

        ifdef   GROWTH_PROOF
        db      GROWTH_PROOF dup (90h)
        endif

        include "../../../common/crt_divmod_str.inc"

        include "../../../common/crt_ivt.inc"

X_003EA:
        push    di
        push    ds
        mov     ax, DATA_SEG
        mov     ds, ax
        xor     ax, ax
        mov     cx, BSS_END
        mov     di, B_4EB0
        sub     cx, di
        push    ds
        pop     es
        shr     cx, 1
        rep stosw
        jae     L_00404
        stosb

L_00404:
        callf   TEXT2_SEG:L_0162A
        nop
        push    cs
        call    X_0286A
        xor     ax, ax
        callf   TEXT2_SEG:port_c0_write
        nop
        push    cs
        if      FW_VERSION = 172
        call    L_02720
        else
        call    X_025D8
        endif
        callf   TEXT2_SEG:far_012F0
        callf   TEXT2_SEG:X_020AE
        callf   TEXT2_SEG:X_02C66
        callf   TEXT2_SEG:L_05760
        callf   TEXT2_SEG:far_074EE
        push    0
        callf   TEXT2_SEG:program_select_wrapper
        callf   TEXT2_SEG:port_c0_read
        or      al, 80h
        callf   TEXT2_SEG:port_c0_write
        callf   TEXT2_SEG:far_01D98
        push    0
        callf   TEXT2_SEG:program_select
        callf   TEXT2_SEG:X_01AD4
        callf   TEXT2_SEG:X_00DF6
        push    TEXT2_SEG
        push    sample_error_handler
        nop
        push    cs
        call    callback_set_main
        add     sp, 4

L_0046A:
        push    TEXT2_SEG
        push    sound_event_dispatch
        nop
        push    cs
        call    callback_set_aux
        add     sp, 4
        push    word TEXT1_SEG
        push    L_01F36
        push    35h
        nop
        push    cs
        call    ivt_set_vector
        add     sp, 6
        push    TEXT2_SEG
        push    X_0124E
        push    39h
        nop
        push    cs
        call    ivt_set_vector
        add     sp, 6
        push    TEXT2_SEG
        push    L_05748
        push    41h
        nop
        push    cs
        call    ivt_set_vector
        add     sp, 6
        push    TEXT2_SEG
        push    X_02124
        push    4eh
        nop
        push    cs
        call    ivt_set_vector
        add     sp, 6
        callf   TEXT2_SEG:install_text2_vectors
        xor     ax, ax
        pop     ds
        pop     di
        retf
; code: sample-memory DMA entry stubs; two 6-byte preload
; command word, fall into shared body at 004CEh.
X_004C2                         equ     $+00h
        mov     bh, 45h
        mov     bl, 6fh
        jmp     SHORT X_004CE

L_004C8:
        mov     bh, 49h
        mov     bl, 4fh
        jmp     SHORT X_004CE

X_004CE:
        push    dx
        mov     dx, 0c03fh
        in      al, dx
        or      al, 8
        out     dx, al
        xor     ax, ax
        out     DMA_CTRL, ax
        mov     dx, di
        mov     ax, es
        sar     ax, 1
        rcr     dx, 1
        sar     ax, 1
        rcr     dx, 1
        sar     ax, 1
        rcr     dx, 1
        sar     ax, 1
        rcr     dx, 1
        mov     ah, 1
        out     DMA_ADDR_HI, ax
        mov     ax, dx
        out     DMA_DATA_HI, ax
        mov     ax, di
        shl     ax, 0ch
        out     DMA_DATA_LO, ax
        mov     ax, 100h
        out     DMA_CTRL, ax
        mov     ax, 0fh
        out     DMA_ADDR_HI, ax
        mov     ax, 0ffffh
        out     DMA_DATA_HI, ax
        pop     ax
        out     DMA_DATA_LO, ax
        mov     ax, 200h
        out     DMA_CTRL, ax
        xor     ax, ax
        out     8ch, ax
        mov     dx, 1eh

X_0051B:
        mov     ax, dx
        out     DMA_CTRL, ax
        mov     ax, 100h
        out     DMA_ADDR_HI, ax
        sub     dx, 2
        jne     X_0051B
        mov     ax, 3
        mov     dx, 0c031h
        out     dx, al
        mov     ax, ds
        sub     dx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, si
        adc     dx, 0
        push    dx
        mov     dx, 0c034h
        out     dx, ax
        pop     ax
        mov     dx, 0c036h
        out     dx, al
        mov     ax, cx
        dec     ax
        mov     dx, 0c032h
        out     dx, ax
        mov     al, bh
        mov     dx, 0c03ah
        out     dx, al
        mov     dx, 0c03fh
        in      al, dx
        and     al, 0f7h
        out     dx, al
        mov     al, bl
        xor     ah, ah
        out     DMA_STATUS, ax

X_0056D:
        mov     dx, 0c03bh
        in      al, dx
        test    al, 8
        je      X_0056D
        cmp     bl, 4fh
        jne     X_0058E
        mov     dx, di
        add     dx, cx
        shl     dx, 0ch

X_00581:
        xor     ax, ax
        out     DMA_CTRL, ax
        in      ax, DMA_DATA_LO
        and     ah, 0f0h
        cmp     ah, dh
        jne     X_00581

X_0058E:
        xor     ax, ax
        out     DMA_CTRL, ax
        mov     ah, 1
        out     DMA_ADDR_HI, ax
        xor     ax, ax
        out     DMA_STATUS, ax

L_0059A:
        in      al, DMA_STATUS
        test    al, 80h
        jne     L_0059A
        retf
        db      00h

far_005A2:
        push    si
        push    di
        push    bp
        cmp     byte ptr [G_DSP_CHAN], 1
        ja      br_005B0
        push    cs
        call    far_005B4

br_005B0:
        pop     bp
        pop     di
        pop     si
        retf

far_005B4:
        push    es
        callf   TEXT2_SEG:L_01A0C
        push    cs
        call    X_0187B
        mov     di, bx
        mov     bx, P_46AE
        push    cs
        call    dsp_00625
        test    byte ptr [B_8972], 8
        je      br_005D8
        push    cs
        call    dsp_voice_buf_setup
        push    cs
        call    far_007F5
        jmp     br_00623
br_005D8:
        mov     si, T_DSP_CHAN
        mov     al, byte ptr [G_DSP_CHAN]
        mov     ah, 14h
        mul     ah
        add     si, ax
        mov     al, byte ptr es:[di+16h]
        mov     byte ptr [si+1], al
        cmp     al, 4
        jne     br_005F9
        push    cs

        call    L_00A0E
        push    cs
        call    L_00645
        jmp     br_00623

br_005F9:
        cmp     al, 3
        jne     br_00607
        push    cs
        call    dsp_voice_buf_setup
        push    cs
        call    L_00645
        jmp     br_00623

br_00607:
        push    ax
        push    cs
        call    dsp_voice_buf_setup
        pop     ax
        cmp     al, 0
        jne     br_00617
        push    cs
        call    far_007F5
        jmp     br_00623

br_00617:
        cmp     al, 1
        je      br_0061F
        cmp     al, 2
        jne     br_00623

br_0061F:
        push    cs
        call    dsp_008CD

br_00623:
        pop     es
        retf

dsp_00625:
        sub     dx, dx
        mov     ax, 224h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     dx, 7fffh
        mov     ax, 226h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        retf

L_00645:
        sub     dx, dx
        mov     ax, 92h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 94h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 88h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 8ah
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
callback_trigger:
        sub     cx, cx
        sub     dx, dx
        mov     bp, 8000h
        mov     si, bp
        push    cs
        call    far_0088F
        sub     dx, dx
        mov     ax, 70h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 74h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 72h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 76h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 8ch
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 8eh
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 90h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     dx, 7fffh
        mov     ax, 78h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 7ah
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        cmp     byte ptr es:[di+16h], 3
        jne     dsp_0070C
        jmp     dsp_007A1
dsp_0070C:
        mov     dx, 800h
        mov     ax, 6ch
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 6eh
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        sub     dx, dx
        mov     ax, 64h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, 1
        out     ASIC_DATA, ax
        mov     ax, 80h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 68h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, 1
        out     ASIC_DATA, ax
        mov     dx, 7fffh
        mov     ax, 84h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        sub     dx, dx
        mov     ax, 66h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, 1
        out     ASIC_DATA, ax
        mov     ax, 82h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 6ah
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, 1
        out     ASIC_DATA, ax
        mov     dx, 7fffh
        mov     ax, 86h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        jmp     X_007F4
dsp_007A1:
        mov     dx, 400h
        mov     ax, 6ch
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 6eh
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 210h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 212h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        sub     dx, dx
        mov     ax, 7ch
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 7eh
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
X_007F4:
        retf

far_007F5:
        push    cs
        call    dsp_0083E
        sub     cx, cx
        mov     dx, 7fffh
        mov     bp, 8000h
        sub     si, si
        cmp     byte ptr es:[di+17h], 0
        jne     dsp_00810
        mov     bp, 0
        mov     si, 0
dsp_00810:
        push    cs
        call    far_0088F
        sub     dx, dx
        mov     ax, 8ch
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 8eh
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 90h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        retf
dsp_0083E:
        sub     dx, dx
        mov     ax, 92h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 94h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 88h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 8ah
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 78h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 7ah
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        retf
far_0088F:
        push    cs
        call    dsp_00898
        push    cs
        call    dsp_00898
        retf
dsp_00898:
        mov     ax, 21ch
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, cx
        out     ASIC_DATA, ax
        mov     ax, 21eh
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 220h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, bp
        out     ASIC_DATA, ax
        mov     ax, 222h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, si
        out     ASIC_DATA, ax
        retf
dsp_008CD:
        push    cs
        call    dsp_0083E
        sub     cx, cx
        mov     dx, 7fffh
        mov     bp, 8000h
        sub     si, si
        push    cs
        call    far_0088F
        mov     dx, 7fffh
        mov     ax, 70h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 72h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        sub     dx, dx
        mov     ax, 74h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 76h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        cmp     byte ptr es:[di+16h], 1
        jne     br_00923
        push    cs
        call    dsp_00924

br_00923:
        retf
dsp_00924:
        mov     si, T_DSP_CHAN
        mov     al, byte ptr [G_DSP_CHAN]
        mov     ah, 14h
        mul     ah
        add     si, ax
        mov     ah, byte ptr es:[di+FXS_FIELD_1B]
        mov     al, 0
        mov     dx, 7784h
        mul     dx
        mov     word ptr [si+DSPC_FIELD_0C], dx
        mov     bp, dx
        mov     ah, byte ptr es:[di+FXS_FIELD_1C]
        mov     al, 0
        mov     dx, 7784h
        mul     dx
        mov     word ptr [si+DSPC_FIELD_0E], dx
        mov     dx, bp
        mov     word ptr [si+DSPC_FIELD_0A], dx
        mov     ax, 92h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 94h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        inc     dx
        mov     word ptr [si+8], dx
        mov     word ptr [si+6], 0
        retf
dsp_voice_buf_setup:
        mov     ax, 2000h
        mov     dl, byte ptr [G_DSP_CHAN]
        mov     dh, 0
        mul     dx
        mov     bp, 0
        add     bp, ax
        mov     ax, 5ch
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, bp
        out     ASIC_DATA, ax
        mov     si, 80h
        cmp     byte ptr es:[di+16h], 3
        jne     dsp_009A3
        mov     si, 200h
        jmp     dsp_009A5
dsp_009A3:
        add     bp, si
dsp_009A5:
        mov     ax, 5eh
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, bp
        out     ASIC_DATA, ax
        add     bp, si
        mov     ax, 60h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, bp
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di+30h]
        test    byte ptr [B_8972], 4
        je      dsp_009CE
        mov     al, 4
dsp_009CE:
        cmp     al, 0
        je      dsp_00A00
        cmp     al, 1
        jne     dsp_009D9
        inc     bp
        jmp     dsp_00A00

dsp_009D9:
        cmp     al, 2
        jne     L_009FC
        mov     ax, word ptr es:[di+34h]
        mov     dx, 2c1ah
        mul     dx
        inc     dx
        mov     dh, dl
        mov     dl, ah
        shr     dx, 1
        rcr     al, 1
        shr     dx, 1
        rcr     al, 1
        or      al, al
        je      dsp_009F8
        inc     dx

dsp_009F8:
        add     bp, dx
        jmp     dsp_00A00

L_009FC:
        add     bp, 0f80h

dsp_00A00:
        mov     ax, 62h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, bp
        out     ASIC_DATA, ax
        retf

L_00A0E:
        mov     ax, 2000h
        mov     dl, byte ptr [G_DSP_CHAN]
        mov     dh, 0
        mul     dx
        mov     bp, 0
        add     bp, ax
        mov     ax, 5ch
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, bp
        out     ASIC_DATA, ax
        add     bp, 0ffch
        mov     ax, 5eh
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, bp
        out     ASIC_DATA, ax
        add     bp, 0ffch
        mov     ax, 60h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, bp
        out     ASIC_DATA, ax
        add     bp, 4
        mov     ax, 62h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, bp
        out     ASIC_DATA, ax
        retf
X_00A5E:
        push    si
        push    di
        push    bp
        cmp     byte ptr [G_DSP_CHAN], 1
        ja      br_00A6C
        push    cs
        call    far_00A70

br_00A6C:
        pop     bp
        pop     di
        pop     si
        retf

far_00A70:
        push    es
        push    cs
        call    X_0187B
        mov     di, bx
        mov     al, byte ptr es:[di+5]
        mov     ah, byte ptr [B_87E6]
        not     ah
        and     ah, 1
        or      al, ah
        mov     bl, byte ptr [G_DSP_CHAN]
        mov     bh, 0
        mov     byte ptr [bx+TBL_0612], al
        mov     bx, P_46AE
        push    cs
        call    t1_int46_wrapper
        mov     al, byte ptr es:[di+FXS_MOD_TYPE]
        test    byte ptr [B_8972], 8
        je      br_00AA4
        mov     al, 5

br_00AA4:
        cmp     al, 4
        jne     br_00AAE
        push    cs
        call    dsp_00E08
        jmp     br_00ADC

br_00AAE:
        cmp     al, 3
        jne     br_00AB8
        push    cs
        call    dsp_00E08
        jmp     br_00AD8

br_00AB8:
        cmp     al, 5
        je      br_00AC0
        cmp     al, 0
        jne     br_00AC6

br_00AC0:
        push    cs
        call    dsp_00F4F
        jmp     br_00AD8

br_00AC6:
        cmp     al, 1
        jne     br_00AD0
        push    cs
        call    dsp_01053
        jmp     br_00AD8

br_00AD0:
        cmp     al, 2
        jne     br_00AD8
        push    cs
        call    dsp_0111B

br_00AD8:
        push    cs
        call    dsp_01204

br_00ADC:
        push    cs
        call    dsp_01529
        pop     es
        retf

t1_int46_wrapper:
        test    byte ptr [B_8972], 20h
        je      L_00B46
        mov     ax, 9ah
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, 1d2h
        out     ASIC_DATA, ax
        mov     ax, 98h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, 0
        out     ASIC_DATA, ax
        mov     dx, 7fffh
        mov     ax, 96h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 9ch
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, 0
        out     ASIC_DATA, ax
        mov     dx, 2000h
        mov     ax, 9eh
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        shr     dx, 2
        mov     ax, 0a0h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        jmp     dsp_00BE4
L_00B46:
        mov     ax, word ptr es:[di]
        shl     ax, 3
        mov     dx, 9566h
        mul     dx
        mov     ax, 9ah
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di+2]
        xlat
        mov     dh, al
        mov     dl, 0
        shr     dx, 2

L_00B6A:
        mov     bp, 7fffh
        sub     bp, dx
        mov     ax, 98h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax

L_00B7C:
        mov     ax, 96h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, bp
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di+3]
        xlat
        mov     dh, al
        mov     dl, 0
        shr     dx, 1
        mov     ax, 9ch
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        add     dx, dx
        cmp     dx, 7fffh
        jbe     dsp_00BAD
        shr     dx, 1
        jmp     dsp_00BBC
dsp_00BAD:
        mov     cx, 0ffffh
        sub     cx, dx
        mov     dx, 1fffh
        mov     ax, 0ffffh
        div     cx
        mov     dx, ax
dsp_00BBC:
        mov     ax, 9eh
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di+4]
        xlat
        mov     ah, al
        mov     al, 0
        mul     dx
        shr     dx, 2
        mov     ax, 0a0h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
dsp_00BE4:
        test    byte ptr [B_8972], 10h
        jne     L_00BEE
        jmp     dsp_00C7D

L_00BEE:
        mov     ax, 0a2h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, 91ah
        out     ASIC_DATA, ax
        mov     ax, 0a4h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, 2000h
        out     ASIC_DATA, ax
        mov     ax, 238h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, 498h
        out     ASIC_DATA, ax
        mov     ax, 0a6h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, 3f80h
        out     ASIC_DATA, ax
        mov     ax, 0a8h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, 0
        out     ASIC_DATA, ax
        mov     ax, 23ah
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, 2455h
        out     ASIC_DATA, ax
        mov     ax, 0aah
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, 3f80h
        out     ASIC_DATA, ax
        mov     ax, 0ach
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, 0
        out     ASIC_DATA, ax
        mov     ax, 0aeh
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, 91ah
L_00C6A:
        out     ASIC_DATA, ax
        mov     ax, 0b0h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, 2000h
        out     ASIC_DATA, ax
        jmp     dsp_00D8D

dsp_00C7D:
        mov     al, byte ptr es:[di+6]
        mov     ah, 0
        add     ax, ax
        mov     si, P_4628
        add     si, ax
        mov     dx, word ptr [si]
        mov     ax, 0a2h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di+7]
        push    cs
        call    far_00DDB
        mov     ax, 0a4h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     si, P_4EB2
        mov     al, byte ptr [G_DSP_CHAN]
        mov     ah, 6
        mul     ah
        add     si, ax
        mov     al, byte ptr es:[di+8]
        mov     byte ptr [si+2], al
        mov     al, byte ptr es:[di+FXS_FIELD_10]
        mov     ah, 0
        mov     dx, 1adh
        mul     dx
        mov     byte ptr [si+1], ah
        mov     al, byte ptr es:[di+FXS_FIELD_11]
        mov     ah, 0e6h
        mul     ah
        mov     byte ptr [si+3], ah
        mov     dh, byte ptr es:[di+FXS_FIELD_0A]
        inc     dh
        mov     dl, 0
        mov     ax, 0a6h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di+9]
        push    cs
        call    far_00DDB
        mov     ax, 0a8h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     si, P_4EB2
        mov     al, byte ptr [G_DSP_CHAN]
        add     al, 2
        mov     ah, 6
        mul     ah
        add     si, ax
        mov     al, byte ptr es:[di+FXS_FIELD_0B]
        mov     byte ptr [si+2], al
        mov     al, byte ptr es:[di+FXS_FIELD_12]
        mov     ah, 0
        mov     dx, 1adh
        mul     dx
        mov     byte ptr [si+1], ah
        mov     al, byte ptr es:[di+FXS_FIELD_13]
        mov     ah, 0e6h
        mul     ah
        mov     byte ptr [si+3], ah
        mov     dh, byte ptr es:[di+FXS_FIELD_0D]
        inc     dh
        mov     dl, 0
        mov     ax, 0aah
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di+FXS_FIELD_0C]
        push    cs
        call    far_00DDB
        mov     ax, 0ach
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di+FXS_FIELD_0E]
        mov     ah, 0
        add     ax, ax
        mov     si, P_4628
        add     si, ax
        mov     dx, word ptr [si]
        mov     ax, 0aeh
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di+FXS_FIELD_0F]
        push    cs
        call    far_00DDB
        mov     ax, 0b0h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
dsp_00D8D:
        mov     al, byte ptr es:[di+FXS_FIELD_15]
        xlat
        mov     dx, 8080h
        add     dh, al
        not     al
        add     dl, al
        mov     al, byte ptr es:[di+FXS_FIELD_14]
        xlat
        mov     cl, al
        mov     al, dl
        mul     cl
        mov     bp, ax
        shr     bp, 1
        xchg    dx, bp
        call    ret_stub
        xchg    dx, bp
        mov     ax, 0cah
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, bp
        out     ASIC_DATA, ax
        mov     al, dh
        mul     cl
        mov     bp, ax
        shr     bp, 1
        xchg    dx, bp
        call    ret_stub
        xchg    dx, bp
        mov     ax, 0cch
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, bp
        out     ASIC_DATA, ax
        retf
far_00DDB:
        add     al, 29h
        sub     dx, dx
        cmp     al, 4
        je      br_00E07
        mov     ah, 0
        mov     dl, 6
        div     dl
        mov     dl, ah
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     si, P_4566
        add     si, dx
        mov     dh, byte ptr [si]
        mov     dl, 0
        pop     ds
        mov     cl, 8
        sub     cl, al
        shr     dx, cl
        or      dx, dx
        jns     br_00E07
        not     dx

br_00E07:
        retf
dsp_00E08:
        mov     ax, word ptr es:[di+FXS_FIELD_26]
        add     ax, 3c00h
        push    di
        push    cs
        call    far_00EE9
        pop     di
        sub     ax, 1000h
        push    ax
        mov     ax, word ptr es:[di+FXS_FIELD_28]
        add     ax, 3c00h
        push    di
        push    cs
        call    far_00EE9
        pop     di
        sub     ax, 1000h
        push    ax
        cmp     byte ptr es:[di+FXS_MOD_TYPE], 3
        jne     L_00E34
        jmp     dsp_00ECC

L_00E34:
        pop     dx
        sar     dx, 1
        mov     ax, 8ah
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        pop     dx
        sar     dx, 1
        mov     ax, 88h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, word ptr es:[di+FXS_FIELD_2A]
        mov     dx, 2c1ah
        mul     dx
        mov     dh, dl
        mov     dl, ah
        add     dx, 800h
        mov     ax, 210h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, word ptr es:[di+FXS_FIELD_2C]
        mov     dx, 2c1ah
        mul     dx
        mov     dh, dl
        mov     dl, ah
        add     dx, 800h
        mov     ax, 212h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
L_00E90:
        mov     al, byte ptr es:[di+FXS_FIELD_2E]
        xlat
        mov     ah, al
        mov     al, 0
        mov     dx, 7000h
        mul     dx
        neg     dx
        mov     ax, 7ch
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di+FXS_FIELD_2F]
        xlat
        mov     ah, al
        mov     al, 0
        mov     dx, 7000h
        mul     dx
        neg     dx
        mov     ax, 7eh
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        jmp     L_00EE8
dsp_00ECC:
        pop     dx
        mov     ax, 8ah
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        pop     dx
        mov     ax, 88h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax

L_00EE8:
        retf

far_00EE9:
        push    cs
        call    far_00EF6
        test    ah, 80h
        je      L_00EF5
        mov     ax, 7fffh

L_00EF5:
        retf

far_00EF6:
        push    cx
        push    di
        or      ah, ah
        jns     br_00EFE
        sub     ax, ax

br_00EFE:
        mov     ch, al
        mov     al, ah
        sub     ah, ah
        mov     cl, 0ch
        div     cl
        xchg    ch, al
        mov     cl, al
        and     al, 0f8h
        mov     di, ax
        shr     di, 1
        shr     di, 1
        add     di, P_47AE
        push    ds
        mov     ax, DATA_SEG
        mov     ds, ax
        mov     ax, word ptr [di]
        and     cl, 6
        je      br_00F41
        mov     dx, word ptr [di+2]
        shr     ax, 1
        shr     dx, 1
        cmp     cl, 4
        je      L_00F3F
        test    cl, 4
        je      br_00F37
        xchg    dx, ax

br_00F37:
        mov     di, ax
        shr     ax, 1
        add     ax, di
        shr     dx, 1

L_00F3F:
        add     ax, dx

br_00F41:
        pop     ds
        mov     cl, 8
        sub     cl, ch
        je      br_00F4C
        jb      br_00F4C
        shr     ax, cl

br_00F4C:
        pop     di
        pop     cx
        retf

dsp_00F4F:
        mov     al, byte ptr es:[di+FXS_FIELD_17]
        mov     cl, byte ptr es:[di+FXS_MOD_SPEED]
        mov     ch, 0
        cmp     al, 0
        je      dsp_00F69
        mov     ch, cl
        cmp     al, 1
        je      dsp_00F69
        mov     al, 0d9h
        mul     cl
        mov     ch, ah
dsp_00F69:
        mov     al, cl
        xlat
        mul     al
        mov     dx, 7784h
        mul     dx
        mov     ax, 92h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     al, ch
        xlat
        mul     al
        mov     dx, 7784h
        mul     dx
        neg     dx
        mov     ax, 94h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di+FXS_MOD_DEPTH]
        test    byte ptr [B_8972], 8
        je      L_00FA6
        mov     al, 0

L_00FA6:
        xlat
        mov     dl, al
        mov     dh, 0
        mov     ax, 6ch
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 6eh
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax

L_00FC1:
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 210h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 212h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di+FXS_MOD_FEEDBACK]
        xlat
        test    byte ptr [B_8972], 8
        je      dsp_00FED
        mov     al, 0
dsp_00FED:
        mov     ah, al
        mov     al, 0
        mov     dx, 7fffh
        imul    dx
        mov     ax, 7ch
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 7eh
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     dx, 7fffh
        mov     ax, 70h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 72h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        test    byte ptr [B_8972], 8
        jne     dsp_01036
        jmp     dsp_01038

dsp_01036:
        sub     dx, dx

dsp_01038:
        mov     ax, 74h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 76h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        retf
dsp_01053:
        mov     si, T_DSP_CHAN
        mov     al, byte ptr [G_DSP_CHAN]
        mov     ah, 14h
        mul     ah
        add     si, ax
        mov     al, byte ptr es:[di+FXS_FIELD_1E]
        xlat
        mov     dh, al
        mov     dl, 0
        shr     dx, 1
        mov     word ptr [si+DSPC_FIELD_10], dx
        mov     dl, al
        mov     dh, 0
        shr     dx, 2
        mov     ax, 6ch
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 6eh
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 210h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 212h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ah, byte ptr es:[di+FXS_FIELD_1B]
        mov     al, 0
        mov     dx, 7784h
        mul     dx
        mov     word ptr [si+DSPC_FIELD_0C], dx
        mov     bp, dx
        mov     ah, byte ptr es:[di+FXS_FIELD_1C]
        mov     al, 0
        mov     dx, 7784h
        mul     dx
        mov     word ptr [si+DSPC_FIELD_0E], dx
        mov     dx, bp
        mov     word ptr [si+DSPC_FIELD_0A], dx
        cmp     word ptr [si+8], dx
        jne     dsp_010D3
        inc     word ptr [si+8]
dsp_010D3:
        mov     ah, byte ptr es:[di+FXS_FIELD_1C]
        sub     ah, byte ptr es:[di+FXS_FIELD_1B]
        jns     dsp_010DF
        neg     ah
dsp_010DF:
        mov     al, 0
        sub     dx, dx
        mov     cl, byte ptr es:[di+FXS_FIELD_1D]
        mov     ch, 0
        inc     cx
        div     cx
        mov     dx, 9c40h
        mul     dx
        mov     word ptr [si+4], dx
        mov     ax, 8eh
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, 0
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di+FXS_FIELD_1E]
        xlat
        mov     ah, al
        mov     al, 0
        mov     dx, 4000h
        mul     dx
        mov     word ptr [si+DSPC_FIELD_12], dx
        mov     al, byte ptr es:[di+FXS_FIELD_1F]
        mov     byte ptr [si+2], al
        retf
dsp_0111B:
        mov     al, byte ptr es:[di+FXS_FIELD_24]
        xlat
        mov     dh, al
        mov     dl, 0
        shr     dx, 1
        mov     cl, byte ptr es:[di+FXS_FIELD_25]
        sub     bp, bp
        mov     si, dx
        cmp     cl, 3
        je      dsp_01145
        neg     si
        cmp     cl, 0
        je      dsp_01145
        mov     bp, dx
        sub     si, si
        cmp     cl, 2
        je      dsp_01145
        neg     bp
dsp_01145:
        mov     ax, 8ch
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 90h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, bp
        out     ASIC_DATA, ax
        mov     ax, 8eh
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, si
        out     ASIC_DATA, ax
        mov     ah, byte ptr es:[di+FXS_FIELD_20]
        mov     al, 0
        mov     dx, 7784h
        mul     dx
        mov     ax, 92h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ah, byte ptr es:[di+FXS_FIELD_23]
        mov     al, 0
        mov     dx, 7784h
        mul     dx
        mov     ax, 94h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di+FXS_FIELD_21]
        xlat
        mov     dl, al
        mov     dh, 0
        mov     ax, 6ch
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 6eh
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 210h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 212h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di+FXS_FIELD_22]
        xlat
        mov     ah, al
        mov     al, 0
        mov     dx, 4000h
        mul     dx
        neg     dx
        mov     ax, 7ch
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 7eh
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        retf
dsp_01204:
        mov     al, byte ptr es:[di+FXS_ECHO_TYPE]
        test    byte ptr [B_8972], 4
        je      dsp_01211
        mov     al, 4

dsp_01211:
        cmp     al, 3
        jne     dsp_01218
        jmp     dsp_013C1

dsp_01218:
        cmp     al, 4
        jne     dsp_0121F
        jmp     dsp_01499

dsp_0121F:
        cmp     al, 2
        je      dsp_01235
        mov     ax, word ptr es:[di+FXS_ECHO_DELAY]
        mov     dx, 2c1ah
        mul     dx
        mov     dh, dl
        mov     dl, ah
        inc     dx
        mov     bp, dx
        jmp     dsp_01247
dsp_01235:
        mov     ax, word ptr es:[di+FXS_ECHO_DELAY2]
        mov     dx, 2c1ah
        mul     dx
        mov     dh, dl
        mov     dl, ah
        inc     dx
        mov     bp, dx
        add     dx, dx
dsp_01247:
        mov     ax, 64h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     dx, bp
        mov     ah, byte ptr es:[di+FXS_ECHO_LR_OFS]
        mov     bp, 1
        mov     si, 1
        test    byte ptr [B_8972], 8
        je      dsp_0126B
        mov     bp, dx
        mov     si, dx

dsp_0126B:
        or      ah, ah
        je      dsp_0128F
        pushf
        jns     dsp_01274
        neg     ah

dsp_01274:
        mov     al, 0
        mul     dx
        mov     cx, 6400h
        div     cx
        test    byte ptr [B_8972], 8
        jne     L_01288
        add     bp, ax
        jmp     dsp_0128A

L_01288:
        sub     si, ax

dsp_0128A:
        popf
        jns     dsp_0128F
        xchg    si, bp

dsp_0128F:
        cmp     byte ptr es:[di+FXS_ECHO_TYPE], 1
        jne     dsp_01299
        add     bp, 4
dsp_01299:
        mov     ax, 68h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, bp
        out     ASIC_DATA, ax
        mov     ax, 6ah
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, si
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di+FXS_ECHO_TYPE]
        cmp     al, 1
        je      dsp_01313
        cmp     al, 2
        jne     dsp_012C2
        jmp     dsp_01363
dsp_012C2:
        push    cs
        call    far_0150A
        neg     dx
        mov     ax, 80h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 82h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, 0
        out     ASIC_DATA, ax
        push    cs
        call    far_t1_01519
        mov     ax, 84h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 86h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, 7fffh
        out     ASIC_DATA, ax
        mov     ax, 66h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, 1
        out     ASIC_DATA, ax
        jmp     br_01509
dsp_01313:
        push    cs
        call    far_0150A
        neg     dx
        mov     ax, 80h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 82h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, 7fffh
        out     ASIC_DATA, ax
        push    cs
        call    far_t1_01519
        mov     ax, 84h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 86h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 66h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, 0ffffh
        out     ASIC_DATA, ax
        jmp     br_01509
dsp_01363:
        push    cs
        call    dsp_voice_buf_setup
        push    cs
        call    far_0150A
        add     dx, dx
        call    isqrt16
        mov     dh, cl
        mov     dl, 0
        shr     dx, 1
        mov     ax, 80h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        neg     dx
        mov     ax, 82h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        push    cs
        call    far_t1_01519
        mov     ax, 84h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 86h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 66h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, 0ffffh
        out     ASIC_DATA, ax
        jmp     br_01509
dsp_013C1:
        mov     ax, word ptr es:[di+FXS_FIELD_38]
        mov     dx, 2c1ah
        mul     dx
        mov     dh, dl
        mov     dl, ah
        inc     dx
        mov     ax, 64h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        test    byte ptr [B_8972], 8
        jne     dsp_013E6
        mov     dx, 1
dsp_013E6:
        mov     ax, 68h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di+FXS_FIELD_3A]
        xlat
        mov     ah, al
        mov     al, 0
        mov     dx, 8080h
        mul     dx
        neg     dx
        mov     ax, 80h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di+FXS_FIELD_3B]
        mov     ah, 0
        add     ax, ax
        mov     si, P_4628
        add     si, ax
        mov     dx, word ptr [si]
        mov     ax, 84h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, word ptr es:[di+FXS_FIELD_3C]
        mov     dx, 2c1ah
        mul     dx
        mov     dh, dl
        mov     dl, ah
        inc     dx
        mov     ax, 66h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        test    byte ptr [B_8972], 8
        jne     dsp_01451
        mov     dx, 1
dsp_01451:
        mov     ax, 6ah
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di+FXS_FIELD_3E]
        xlat
        mov     ah, al
        mov     al, 0
        mov     dx, 8080h
        mul     dx
        neg     dx
        mov     ax, 82h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di+FXS_FIELD_3F]
        mov     ah, 0
        add     ax, ax
        mov     si, P_4628
        add     si, ax
        mov     dx, word ptr [si]
        mov     ax, 86h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        jmp     br_01509
dsp_01499:
        mov     dx, 1
        mov     ax, 64h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 66h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 68h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 6ah
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        sub     dx, dx
        mov     ax, 80h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 82h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     dx, 7fffh
        mov     ax, 84h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 86h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
br_01509:
        retf
far_0150A:
        mov     al, byte ptr es:[di+36h]
        xlat
        mov     ah, al
        mov     al, 0
        mov     dx, 8080h
        mul     dx
        retf

far_t1_01519:
        mov     al, byte ptr es:[di+37h]
        mov     ah, 0
        add     ax, ax
        mov     si, P_4628
        add     si, ax
        mov     dx, word ptr [si]
        retf

dsp_01529:
        mov     al, byte ptr es:[di+FXS_FIELD_41]
        xlat
        mov     dx, 8080h
        add     dh, al
        not     al
        add     dl, al
        mov     al, byte ptr es:[di+FXS_FIELD_40]
        xlat
        mov     cl, al
        mov     al, byte ptr [B_8972]
        and     al, 0ch
        cmp     al, 0ch
        jne     L_01549
        sub     cl, cl

L_01549:
        mov     al, dl
        mul     cl
        mov     dl, ah
        mov     al, dh
        mul     cl
        mov     al, dl
        mov     bp, ax
        test    byte ptr [B_8972], 8
        je      dsp_0158E
        cmp     byte ptr es:[di+FXS_ECHO_TYPE], 3
        je      dsp_01570
        mov     al, byte ptr es:[di+FXS_ECHO_FEEDBACK]
        xlat

L_0156A:
        mov     dh, al
        mov     dl, al
        jmp     dsp_0157E

dsp_01570:
        mov     al, byte ptr es:[di+FXS_FIELD_3A]
        xlat
        mov     dl, al
        mov     al, byte ptr es:[di+FXS_FIELD_3E]
        xlat
        mov     dh, al

dsp_0157E:
        mov     ax, bp
        mov     cl, ah
        mul     dl
        mov     dl, ah
        mov     al, cl
        mul     dh
        mov     al, dl
        mov     bp, ax
dsp_0158E:
        mov     al, byte ptr es:[di+FXS_FIELD_42]
        xlat
        shr     al, 1
        mov     cl, 7fh
        add     cl, al
        mov     ch, 7fh
        sub     ch, al
        mov     ax, bp
        mul     cl
        mov     dx, ax
        shr     dx, 1
        shr     dx, 0
        call    ret_stub
        mov     ax, 0ceh
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, bp
        mov     al, ah
        mul     ch
        mov     dx, ax
        shr     dx, 1
        shr     dx, 0
        call    ret_stub
        mov     ax, 0d4h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, bp
        mov     al, ah
        mul     cl
        mov     dx, ax
        shr     dx, 1
        shr     dx, 0
        call    ret_stub
        mov     ax, 0d0h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, bp
        mul     ch
        mov     dx, ax
        shr     dx, 1
        shr     dx, 0
        call    ret_stub
        mov     ax, 0d2h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     dx, 7f7fh
        xor     cx, cx
        mov     al, byte ptr es:[di+FXS_FIELD_14]
        xlat
        shr     al, 1
        mov     ah, al
        mov     al, byte ptr es:[di+FXS_FIELD_46]
        cmp     al, 0
        jne     dsp_01630
        mov     dh, ah
        mov     al, byte ptr es:[di+FXS_FIELD_40]
        xlat
        shr     al, 1
        mov     cl, al
        jmp     dsp_0163F
dsp_01630:
        cmp     al, 1
        jne     dsp_0163F
        mov     dl, ah
        mov     al, byte ptr es:[di+FXS_FIELD_43]
        xlat
        shr     al, 1
        mov     ch, al

; ? no entry point at 0x01606 -- mid-instruction

dsp_0163F:
        mov     al, byte ptr [B_8972]
        test    al, 2
        je      dsp_01648
        sub     ch, ch

dsp_01648:
        and     al, 0ch
        cmp     al, 0ch
        jne     dsp_01650
        sub     cl, cl
dsp_01650:
        mov     al, dl
        shr     al, 0
        mov     bp, 0b2h
        push    cs
        call    dsp_reg_write_hi
        mov     al, dh
        shr     al, 0
        mov     bp, 0b6h
        push    cs
        call    dsp_reg_write_hi
        mov     al, ch
        mov     bp, 0b4h
        push    cs
        call    dsp_reg_write_hi
        mov     al, byte ptr es:[di+FXS_FIELD_41]
        xlat
        mov     ch, al
        mov     dh, 7fh
        sub     dh, ch
        mov     al, cl
        mul     dh
        mov     dx, ax
        test    byte ptr [B_8972], 8
        je      dsp_0169F
        cmp     byte ptr es:[di+FXS_ECHO_TYPE], 3
        je      L_01696
        mov     al, byte ptr es:[di+FXS_ECHO_FEEDBACK]
        jmp     dsp_0169A

L_01696:
        mov     al, byte ptr es:[di+FXS_FIELD_3A]

dsp_0169A:
        xlat
        mul     dh
        mov     dx, ax
dsp_0169F:
        shr     dx, 0
        mov     ax, 0b8h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     dh, 80h
        add     dh, ch
        mov     al, cl
        mul     dh
        mov     dx, ax
        test    byte ptr [B_8972], 8
        je      dsp_016D6
        cmp     byte ptr es:[di+FXS_ECHO_TYPE], 3
        je      dsp_016CD
        mov     al, byte ptr es:[di+FXS_ECHO_FEEDBACK]
        jmp     dsp_016D1

dsp_016CD:
        mov     al, byte ptr es:[di+FXS_FIELD_3E]

dsp_016D1:
        xlat
        mul     dh
        mov     dx, ax
dsp_016D6:
        shr     dx, 0
        mov     ax, 0bah
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di+FXS_FIELD_44]
        mov     ah, byte ptr es:[di+FXS_FIELD_43]
        xlat
        mov     dx, 8080h
        add     dh, al
        not     al
        add     dl, al
        mov     al, ah
        xlat
        mov     cl, al
        mov     al, dl
        mul     cl
        mov     dl, ah
        mov     al, dh
        mul     cl
        mov     dh, ah
        push    dx
        mov     dh, dl
        mov     dl, 0
        shr     dx, 1
        shr     dx, 0
        call    fn_01C45
        call    ret_stub
        mov     ax, 54h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        pop     dx
        mov     dl, 0
        shr     dx, 1
        shr     dx, 0
        call    fn_01C45
        call    ret_stub
        mov     ax, 58h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        sub     dx, dx
        mov     ax, 0c4h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 0bch
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 0beh
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 0c0h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 0c2h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di+FXS_FIELD_47]
        cmp     al, 0
        jne     dsp_017A2
        mov     dx, 7fffh
        shr     dx, 2
        mov     ax, 0c6h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        jmp     br_01867
dsp_017A2:
        push    ax
        mov     ax, 0c6h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, 0
        out     ASIC_DATA, ax
        pop     ax
        mov     dx, 7fffh
        cmp     al, 1
        jne     dsp_017CC
        shr     dx, 2
        mov     ax, 0c4h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        jmp     br_01867
dsp_017CC:
        cmp     al, 2
        jne     dsp_017E3
        shr     dx, 0
        mov     ax, 0bch
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        jmp     br_01867
dsp_017E3:
        cmp     al, 3
        jne     dsp_0185A
        mov     al, byte ptr es:[di+FXS_FIELD_41]
        xlat
        mov     ch, al
        mov     dh, 7fh
        sub     dh, ch
        mov     dl, 0
        test    byte ptr [B_8972], 8
        je      dsp_01811
        cmp     byte ptr es:[di+FXS_ECHO_TYPE], 3

        je      L_01808
        mov     al, byte ptr es:[di+FXS_ECHO_FEEDBACK]
        jmp     dsp_0180C

L_01808:
        mov     al, byte ptr es:[di+FXS_FIELD_3A]

dsp_0180C:
        xlat
        mul     dh
        mov     dx, ax

dsp_01811:
        shr     dx, 1
        shr     dx, 0
        mov     ax, 0beh
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     dh, 80h
        add     dh, ch
        mov     dl, 0
        test    byte ptr [B_8972], 8
        je      dsp_01846
        cmp     byte ptr es:[di+FXS_ECHO_TYPE], 3
        je      L_0183D
        mov     al, byte ptr es:[di+FXS_ECHO_FEEDBACK]
        jmp     dsp_01841

L_0183D:
        mov     al, byte ptr es:[di+FXS_FIELD_3E]

dsp_01841:
        xlat
        mul     dh
        mov     dx, ax

dsp_01846:
        shr     dx, 1
        shr     dx, 0
        mov     ax, 0c0h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        jmp     br_01867

dsp_0185A:
        mov     ax, 0c2h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax

br_01867:
        retf

dsp_reg_write_hi:
        push    dx
        mov     dh, al
        mov     dl, 0
        mov     ax, bp
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        pop     dx
        retf

X_0187B:
        mov     al, byte ptr [G_DSP_CHAN]
        cbw
        push    ax
        callf   TEXT2_SEG:channel_validate
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        retf

X_0188D:
        push    es
        push    si
        push    di
        push    bp
        callf   TEXT2_SEG:timer_system
        push    cs
        call    far_018AC
        mov     di, bx
        mov     bx, P_46AE
        push    cs
        call    dsp_018BE
        push    cs
        call    dsp_018ED
        pop     bp
        pop     di
        pop     si
        pop     es
        retf
far_018AC:
        mov     al, byte ptr [G_DSP_CHAN]
        cbw
        push    ax
        callf   TEXT2_SEG:channel_get_ptr
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        retf
dsp_018BE:
        mov     ax, 1000h
        mov     dl, byte ptr [G_DSP_CHAN]
        mov     dh, 0
        mul     dx
        mov     bp, 4000h
        add     bp, ax
        mov     ax, 0
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, bp
        out     ASIC_DATA, ax
        add     bp, 400h
        mov     ax, 4
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, bp
        out     ASIC_DATA, ax
        retf
dsp_018ED:
        mov     al, 10h
        test    byte ptr [G_DSP_CHAN], 1
        je      dsp_018F9
        shr     al, 3

dsp_018F9:
        test    byte ptr [G_DSP_CHAN], 2
        je      dsp_01902
        shr     al, 1

dsp_01902:
        cmp     byte ptr es:[di], 3
        ja      L_01910
        not     al
        and     byte ptr [ASIC_REG181_SHADOW], al
        jmp     L_01914

L_01910:
        or      byte ptr [ASIC_REG181_SHADOW], al

L_01914:
        mov     dl, byte ptr [ASIC_REG181_SHADOW]
        mov     dh, 0

L_0191A:
        mov     ax, 181h
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di]
        cmp     al, 3
        jbe     dsp_0192D
        jmp     dsp_019FC

dsp_0192D:
        push    bx
        mov     si, P_456C
        mov     ah, 0
        add     ax, ax
        add     si, ax
        push    ds
        mov     ax, DATA_SEG
        mov     ds, ax
        mov     ax, word ptr [si]
        pop     ds
        mov     bp, ax
        or      ah, ah
        jns     dsp_01948
        neg     ah
dsp_01948:
        mov     al, 63h
        sub     al, ah
        xlat
        mov     bh, al
        sub     bl, bl
        mov     ax, bp
        mov     cl, 3eh
        mul     cl
        mov     si, ax
        mov     bp, 4000h
        mov     ax, bx
        mul     bp
        add     bp, dx
        mov     ax, bx
        mul     dx
        add     bp, dx
        push    bp
        mov     ax, bx
        mul     dx
        add     bp, dx
        mov     dx, si
        sub     ax, ax
        div     bp
        shr     ax, 2
        mov     bp, ax
        pop     cx
        mov     dx, si
        sub     ax, ax
        div     cx
        shr     ax, 2
        push    ax
        mov     cx, 4
        mov     si, 0ch
        mov     dx, bp
dsp_0198D:
        mov     ax, si
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, dx
        mul     bx
        add     si, 4
        loop    dsp_0198D
        mov     cx, 3
        pop     dx
dsp_019A6:
        mov     ax, si
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, dx
        mul     bx
        add     si, 4
        loop    dsp_019A6
        pop     bx

        jmp     L_01AE0
        mov     cx, 4
        mov     si, 18h
        mov     dx, bp

X_019C7:
        mov     ax, si
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, dx
        mul     bx
        sub     si, 4
        loop    X_019C7
        mov     cx, 3
        mov     si, 24h
        pop     dx

X_019E3:
        mov     ax, si
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, dx
        mul     bx
        sub     si, 4
        loop    X_019E3
        pop     bx
        jmp     NEAR L_01AE0
dsp_019FC:
        push    bx
        mov     bx, 0bd70h
        mov     al, byte ptr es:[di+9]
        mov     cl, 24h
        mul     cl
        mov     si, ax
        mov     bp, 4000h
        mov     ax, bx
        mul     bp
        add     bp, dx
        mov     ax, bx
        mul     dx
        add     bp, dx
        mov     dx, si
        sub     ax, ax
        div     bp
        shr     ax, 2
        mov     si, ax
        mov     dx, si
        add     dx, dx
        mov     ax, 0ch
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, si
        mov     cx, 97c8h
        mul     cx
        mov     ax, 10h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     bp, dx
        mov     ax, dx
        mov     cx, 97c8h
        mul     cx
        mov     ax, 14h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        add     bp, dx
        mov     dx, si
        mov     cx, 2
        mov     si, 18h
dsp_01A69:
        mov     ax, si
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        add     bp, dx
        add     bp, dx
        add     bp, dx
        mov     ax, dx
        mul     bx
        add     si, 4
        loop    dsp_01A69
        mov     ax, si
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        add     si, 4
        mov     ax, dx
        mov     dx, 3
        mul     dx
        mov     cx, 4
        div     cx
        mov     dx, ax
        neg     dx
        mov     ax, si
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        pop     bx
        mov     al, byte ptr es:[di]
        sub     al, 4
        mov     ah, 10h
        mul     ah
        mov     cx, 8
        mov     si, P_4574
        add     si, ax
        push    es
        mov     ax, DATA_SEG
        mov     es, ax
        mov     bp, 34h
dsp_01ACA:
        mov     ax, bp
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, word ptr es:[si]
        out     ASIC_DATA, ax
        add     si, 2
        add     bp, 4
        loop    dsp_01ACA
        pop     es

L_01AE0:
        retf

far_01AE1:
        push    es
        push    si
        push    di
        push    bp
        push    cs
        call    far_018AC
        mov     di, bx
        mov     bx, P_46AE
        push    cs
        call    dsp_01AF7
        pop     bp
        pop     di
        pop     si
        pop     es
        retf
dsp_01AF7:
        mov     ax, word ptr es:[di+2]
        mov     dx, 2c1ah
        mul     dx
        mov     dh, dl
        mov     dl, ah
        mov     ax, 8
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di+4]
        xlat
        mov     ah, al
        mov     al, 0
        mov     dx, 8080h
        mul     dx
        cmp     byte ptr es:[di], 3
        jbe     dsp_01B27
        sub     dx, dx
dsp_01B27:
        mov     ax, 28h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        cmp     byte ptr [G_DSP_CHAN], 2
        jb      dsp_01B96
        mov     al, byte ptr es:[di+0bh]
        mov     ah, byte ptr es:[di+0ah]
        xlat
        mov     dx, 8080h
        add     dh, al
        not     al
        add     dl, al
        mov     al, ah
        xlat
        mov     cl, al
        mov     al, dl
        mul     cl
        mov     dl, ah
        mov     al, dh
        mul     cl
        mov     dh, ah
        push    dx
        mov     dh, dl
        mov     dl, 0
        shr     dx, 1
        shr     dx, 0
        call    fn_01C45
        call    ret_stub
        mov     ax, 54h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        pop     dx
        mov     dl, 0
        shr     dx, 1
        shr     dx, 0
        call    fn_01C45
        call    ret_stub
        mov     ax, 58h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax

dsp_01B96:
        cmp     byte ptr es:[di], 3
        ja      dsp_01BF3
        mov     al, byte ptr es:[di+5]
        mov     ah, 0
        add     ax, ax
        mov     si, P_4628
        add     si, ax
        mov     dx, word ptr [si]
        mov     ax, 38h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di+6]
        mov     ah, 0
        add     ax, ax
        mov     si, P_4628
        add     si, ax
        mov     dx, word ptr [si]
        mov     ax, 3ch
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     al, byte ptr es:[di+7]
        xlat
        mov     dh, al
        mov     dl, 0
        call    isqrt16
        mov     dh, cl
        mov     dl, 0
        shr     dx, 1
        mov     ax, 34h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
dsp_01BF3:
        mov     al, byte ptr es:[di+8]
        xlat
        cmp     byte ptr es:[di], 3
        ja      dsp_01C04
        shr     al, 1
        add     al, 4dh
        jmp     dsp_01C0A

dsp_01C04:
        mov     ah, 0ceh
        mul     ah
        mov     al, ah

dsp_01C0A:
        mov     ch, al
        mov     cl, 0
        shr     cx, 1
        mov     ax, 2ch
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, cx
        out     ASIC_DATA, ax
        mov     bp, cx
        add     dx, dx
        call    isqrt16
        mov     al, 0c0h
        mul     cl
        add     ax, 4000h
        cmp     byte ptr es:[di], 3
        jbe     dsp_01C34
        mov     ax, 0b333h
dsp_01C34:
        mul     bp
        mov     ax, 30h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        retf
ret_stub:
        ret

fn_01C45:
        test    byte ptr [B_8972], 2
        je      L_01C4E
        sub     dx, dx

L_01C4E:
        ret

isqrt16:
        sub     cl, cl
        mov     ch, 80h

loop_01C53:
        add     cl, ch
        mov     al, cl
        mul     cl
        cmp     ax, dx
        jbe     br_01C5F
        sub     cl, ch

br_01C5F:
        shr     ch, 1
        jne     loop_01C53
        ret

X_01C64:
        push    si

        mov     si, T_DSP_CHAN
        push    cs
        call    far_01C75
        add     si, 14h
        push    cs
        call    far_01C75
        pop     si
        retf

far_01C75:
        push    ax
        push    dx
        cmp     dl, byte ptr [si+2]
        jne     br_01C9F
        mov     dl, dh
        xchg    byte ptr [si+3], dl
        mov     al, dh
        xor     al, dl
        test    al, 40h
        je      br_01C9F
        mov     ax, word ptr [si+0ch]
        test    dh, 40h
        je      br_01C94
        mov     ax, word ptr [si+0eh]

br_01C94:
        mov     word ptr [si+0ah], ax
        cmp     word ptr [si+8], ax
        jne     br_01C9F
        inc     word ptr [si+8]

br_01C9F:
        pop     dx
        pop     ax
        retf

far_01CA2:
        int     33h
        add     ax, ax
        retf

L_01CA7:
        push    si
        push    di
        push    bp
        call    fn_01CB4
        call    fn_01D30
        pop     bp
        pop     di
        pop     si
        retf

fn_01CB4:
        mov     al, byte ptr [B_4EB0]
        inc     al
        and     al, 3
        mov     byte ptr [B_4EB0], al
        mov     ah, 6
        mul     ah
        mov     bx, P_4EB2
        add     bx, ax
        push    cs
        call    far_01CA2
        mov     ah, al
        sub     al, byte ptr [bx]
        cmp     al, 14h
        jae     dsp_01CD4
        ret
dsp_01CD4:
        mov     byte ptr [bx], ah
        add     al, al
        mul     byte ptr [bx+1]
        add     ax, word ptr [bx+4]
        mov     word ptr [bx+4], ax
        shl     ax, 1
        jae     dsp_01CE7
        not     ah

dsp_01CE7:
        sub     ah, 80h
        mov     al, byte ptr [bx+3]
        imul    ah
        add     ah, byte ptr [bx+2]
        jns     dsp_01CF6
        sub     ax, ax

dsp_01CF6:
        cmp     ah, 38h
        jbe     dsp_01CFE
        mov     ax, 3800h

dsp_01CFE:
        mov     bl, ah
        mov     bh, 0
        add     bx, bx
        add     bx, P_45A4
        push    ds
        mov     dx, DATA_SEG
        mov     ds, dx
        mov     ah, al
        mov     al, 0
        mov     cx, ax
        not     ax
        mul     word ptr [bx]
        mov     bp, dx
        mov     ax, cx
        mul     word ptr [bx+2]
        add     dx, bp
        pop     ds
        mov     ax, 238h
        add     al, byte ptr [B_4EB0]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        ret
fn_01D30:
        mov     al, byte ptr [B_4ECA]
        inc     al
        and     al, 1
        mov     byte ptr [B_4ECA], al
        mov     ah, 14h
        mul     ah
        mov     bx, T_DSP_CHAN
        add     bx, ax
        push    cs
        call    far_01CA2
        mov     ah, al
        sub     al, byte ptr [bx]
        cmp     al, 0ah
        jae     dsp_01D50

loop_01D4F:
        ret

dsp_01D50:
        mov     byte ptr [bx], ah
        cmp     byte ptr [bx+1], 1
        jne     loop_01D4F
        mov     bp, word ptr [bx+8]
        mov     cx, word ptr [bx+6]
        cmp     bp, word ptr [bx+0ah]
        je      loop_01D4F
        pushf
        mov     ah, 0
        mul     word ptr [bx+4]
        or      dh, dh
        je      dsp_01D70
        mov     dx, 0ffh
dsp_01D70:
        mov     dh, dl
        mov     dl, ah
        mov     ah, al
        popf
        ja      dsp_01D84
        add     cx, ax
        adc     bp, dx
        cmp     bp, word ptr [bx+0ah]
        jbe     dsp_01D92

        jmp     dsp_01D8F

dsp_01D84:
        sub     cx, ax
        sbb     bp, dx
        jb      dsp_01D8F
        cmp     bp, word ptr [bx+0ah]
        jae     dsp_01D92

dsp_01D8F:
        mov     bp, word ptr [bx+0ah]

dsp_01D92:
        mov     word ptr [bx+8], bp
        mov     word ptr [bx+6], cx
        mov     al, byte ptr [B_4ECA]
        xchg    byte ptr [G_DSP_CHAN], al
        push    ax
        mov     ax, 92h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, bp
        out     ASIC_DATA, ax
        mov     ax, 94h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, bp
        out     ASIC_DATA, ax
        add     cx, cx
        adc     bp, bp
        add     cx, cx
        adc     bp, bp
        mov     cx, 0ffffh
        sub     cx, bp
        mov     ax, word ptr [bx+10h]
        mul     cx
        mov     ax, 8ch
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 90h
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, word ptr [bx+12h]
        mul     cx
        neg     dx
        mov     ax, 7ch
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        mov     ax, 7eh
        add     al, byte ptr [G_DSP_CHAN]
        out     ASIC_REG, ax
        mov     ax, dx
        out     ASIC_DATA, ax
        pop     ax
        mov     byte ptr [G_DSP_CHAN], al
        ret
; code, not data: callback_default_nop @0x01e0c
win_key_nop_stub:
        retf
        iret

; far ptr [bp+6] -> ES:BP, then INT 2Eh.
disp_list_run:
        push    bp
        mov     bp, sp
        push    ds
        push    bp
        push    si
        push    di
        les     bp, [bp+6]
        int     2eh                       ; Far call wrapper
        pop     di

L_01E1B:
        pop     si
        pop     bp
        pop     ds
        leave
; INT 2Fh BL=5: poll pad/button/MIDI status -> AX
int2F_status_poll:
        retf    4

; INT 2Fh BL=5: far ptr [bp+6] -> ES:SI.
int2F_call_fn5:
        push    bp
        mov     bp, sp
        push    bp
        push    si
        push    di
        push    ds
        mov     bl, 5
        int     2fh
        pop     ds
        pop     di
        pop     si
        pop     bp
        leave
        retf
        db      00h
int2F_call_fn6:
        push    bp
        mov     bp, sp
        push    si
        push    di
        push    ds
        push    bp
        mov     bl, 6
        mov     cx, word ptr [bp+0ah]
        les     di, [bp+6]
        int     2fh
        pop     bp
        pop     ds
        pop     di
        pop     si
        leave
        retf
        db      00h
int2F_call_fn4:
        push    bp
        mov     bp, sp
        push    si
        push    di
        push    ds
        push    bp
        mov     bl, 4
        les     si, [bp+6]
; INT 2Fh BL=9: iterate array/buffer, CX = count
int2F_array_iterate:
        int     2fh                       ; Dispatch table call
        pop     bp
        pop     ds
        pop     di
        pop     si
        leave
        retf

; INT 2Fh BL=9: far ptr [bp+6] -> ES:SI, CX=[bp+0Ah] count.
int2F_call_fn9:
        push    bp
        mov     bp, sp
        push    si
        push    di
        push    ds
        push    bp
        mov     bl, 9
        les     si, [bp+6]
; INT 2Fh BL=7
int2F_data_struct_op:
        mov     cx, word ptr [bp+0ah]
        int     2fh                       ; Dispatch table call
        pop     bp
        pop     ds
        pop     di
        pop     si
        pop     bp
        retf
        db      00h

; INT 2Fh BL=7: far ptr [bp+6] -> ES:SI.
int2F_call_fn7:
        push    bp
        mov     bp, sp
        push    si
        push    di
        push    ds
        push    bp
        mov     bl, 7
        les     si, [bp+6]
        int     2fh                       ; Dispatch table call
        pop     bp
        pop     ds
        pop     di

L_01E89:
        pop     si
        pop     bp
        retf

; INT 2Fh BL=10  ?
int2F_dispatch_10:
        push    si
        push    di
        push    ds
        push    bp
        mov     bl, 0ah
        int     2fh                       ; Dispatch table call
; code, not data: int2F_lcd_render @0x01e98
        pop     bp
        pop     ds
        pop     di
        pop     si
        retf
        db      00h

; INT 2Fh BL=0Eh: far ptr [bp+6] -> ES:SI.
int2F_call_fn14:
        push    bp
        mov     bp, sp
        push    si
        push    di
        push    ds
        push    bp
        mov     bl, 0eh
        les     si, [bp+6]
        int     2fh
        pop     bp
        pop     ds
        pop     di
        pop     si
        pop     bp
        retf
int2F_call_fn20:
        push    bp
        mov     bp, sp
        push    si
        push    di
        push    ds
        push    bp
        mov     bl, 14h
        les     si, [bp+6]
        int     2fh                       ; Dispatch table call
        pop     bp
        pop     ds
        pop     di
        pop     si
        pop     bp
        retf

; INT 2Fh BL=21  ?
int2F_dispatch_21:
        push    si
        push    di
        push    ds
        push    bp
        mov     bl, 15h
        int     2fh                       ; Dispatch table call
        pop     bp
        pop     ds
        pop     di
        pop     si
        retf
        db      00h

; INT 2Fh BL=17  ?
int2F_dispatch_17:
        push    si
        push    di
        push    ds
        push    bp
        mov     bl, 11h
        int     2fh                       ; Dispatch table call
        pop     bp
        pop     ds
        pop     di
        pop     si
        retf
        db      00h

; far ptr [bp+6] -> ES:BP, then INT 30h (system call).
win_keys_merge:
        push    bp
        mov     bp, sp
        push    si
        push    di
        push    ds
        push    bp
        les     bp, [bp+6]
        int     30h                       ; System call
        pop     bp
        pop     ds
        pop     di
        pop     si
        leave
        retf    4

; AL=[bp+6], then INT 3Ah (timer).
int3A_wrapper:
        push    bp
        mov     bp, sp
        push    si
        push    di
        push    ds
        push    bp
        mov     al, byte ptr [bp+6]
        int     3ah
        pop     bp
        pop     ds
        pop     di
        pop     si
        pop     bp
        retf

pad_bank_get:
        int     37h
        sub     ah, ah
        retf
        db      00h

int3F_wrapper:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp+6]

L_01F10:
        and.r   ax, 3  ; mask LSBs
        int     3fh                       ; MIDI interrupt
        pop     bp
        retf
        db      00h

int38_wrapper:
        int     33h
        retf
        db      00h

; AX/BX/CX = [bp+0Ah]/[bp+8]/[bp+6], then INT 38h.
int38_wrapper_2:
        push    bp
        mov     bp, sp
        push    bp
        push    di

L_01F21:
        push    si
        push    ds
        mov     ax, word ptr [bp+0ah]
        mov     bx, word ptr [bp+8]
        mov     cx, word ptr [bp+6]
        int     38h                       ; Hardware interrupt
        pop     ds
        pop     si
        pop     di
        pop     bp
        leave
        retf    6
L_01F36:
        sti
        push    DATA_SEG
        pop     ds
        cmp     bl, 0
        jne     X_01F50
        xchg    dh, dl
        push    dx
        push    cx
        xchg    ah, al
        push    ax
        callf   [SOUND_EVENT_HANDLER]
        add     sp, 6
        jmp     SHORT X_01F6E

X_01F50:
        cmp     bl, 1
        jne     X_01F5F
        push    ax
        callf   [FP_MAIN_CALLBACK]
        add     sp, 2
        jmp     SHORT X_01F6E

X_01F5F:
        cmp     bl, 2
        jne     X_01F6E
        push    cx
        push    ax
        callf   TEXT2_SEG:midi_note_process
        add     sp, 4

X_01F6E:
        iret

callback_set_main:
        push    bp
        mov     bp, sp
        mov     bx, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     ax, dx
        or      ax, bx
        jne     br_01F84
        mov     bx, win_key_nop_stub
        mov     dx, TEXT1_SEG
br_01F84:
        pushf
        cli
        mov     word ptr [FP_MAIN_CALLBACK], bx
        mov     word ptr [FP_MAIN_CALLBACK_SEG], dx
        popf
        pop     bp
        retf
callback_set_aux:
        push    bp
        mov     bp, sp
        mov     bx, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     ax, dx
        or      ax, bx
        jne     br_01FA6
        mov     bx, win_key_nop_stub
        mov     dx, TEXT1_SEG
br_01FA6:
        pushf
        cli
        mov     word ptr [SOUND_EVENT_HANDLER], bx
        mov     word ptr [SOUND_EVENT_HANDLER_SEG], dx
        popf
        pop     bp
        retf
        db      00h
addr_calc_segment:
        push    bp
        mov     bp, sp
        add     sp, -4
        push    si
        push    di
        mov     word ptr [bp-2], 0
        mov     word ptr [bp-4], 0
        mov     di, word ptr [bp+0ah]
        mov     bx, word ptr [bp+6]
        mov     ax, word ptr [bp+8]
        mov     cx, 4
tgt_01FD2:
        shr     ax, 1
        rcr     bx, 1
        rcr     di, 1
        loop    tgt_01FD2
        or      ax, ax
        jne     br_02011
        cmp     bx, 3fffh
        ja      br_02011
        jne     br_01FEB
        cmp     di, 1
        ja      br_02011

; 3-word linear address di:bx:ax -> normalized paragraph count.
br_01FEB:
        mov     cx, 7fffh
        mov     si, 0ffffh

L_01FF1:
        mov     dx, bx
        mov     ax, di
        div     cx
        or      ax, ax
        je      br_0200F
        cmp     dx, si
        jae     br_0200B

L_01FFF:
        mov     si, dx
        mov     word ptr [bp-2], cx
        mov     word ptr [bp-4], ax
        or      dx, dx
        je      br_02011

br_0200B:
        cmp     ax, cx
        jae     br_02011

br_0200F:
        loop    L_01FF1

br_02011:
        mov     dx, word ptr [bp-4]
        mov     ax, word ptr [bp-2]
        pop     di
        pop     si
        mov     sp, bp
        pop     bp
        retf
        db      00h
timing_calc_rate:
        push    bp
        mov     bp, sp
        push    si
        push    di
        mov     si, word ptr [W_983C]
        mov     di, word ptr [W_983E]
        push    bp
        mov     bx, si
        mov     ax, di
        cwd
        mov     bp, dx
        mov     cx, 2
tgt_02036:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_02036
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 4
tgt_02047:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_02047
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 4
tgt_02058:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_02058
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 4
tgt_02069:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_02069
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 2
tgt_0207A:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_0207A
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 3
tgt_0208B:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_0208B
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        pop     bp
        mov     cx, 4
tgt_0209D:
        sar     dx, 1
        rcr     ax, 1
        loop    tgt_0209D
        mov     di, word ptr [bp+6]
        mov     cx, 8
T1_br_020A9:
        sar     di, 1
        rcr     si, 1
        loop    T1_br_020A9
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
tgt_020CC:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_020CC
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 3
tgt_020DD:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_020DD
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 3
tgt_020EE:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_020EE
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 5
tgt_020FF:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_020FF
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 3

; derives a rate from the 32-bit timing base in [983Ch]/[983Eh].  ?
tgt_02110:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_02110
        pop     bp
        mov     cx, 4

tgt_0211C:
        sar     dx, 1
        rcr     ax, 1
        loop    tgt_0211C
        push    ax
        push    dx
        mov     si, word ptr [W_983C]
        mov     di, word ptr [W_983E]
        push    bp
        mov     bx, si
        mov     ax, di
        cwd
        mov     bp, dx
        mov     cx, 2
tgt_02137:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_02137
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 3
tgt_02148:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_02148
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 4
tgt_02159:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_02159
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
tgt_02176:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_02176
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 2
tgt_02187:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_02187
        add     bx, si
        adc     ax, di
        adc     dx, bp
        pop     bp
        mov     cx, 4
tgt_02199:
        sar     dx, 1
        rcr     ax, 1
        loop    tgt_02199
        pop     di
        pop     si
        add     ax, si
        adc     dx, di
        pop     di
        pop     si
        mov     word ptr [W_983C], si
        mov     word ptr [W_983E], di
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
        js      br_021E2
        cmp     dh, 0
        jne     br_021DC
        mov     ch, dl
        mov     cl, ah
        cmp     cx, word ptr [W_9D58]

        jb      br_021FB

br_021DC:
        mov     ax, word ptr [W_9D58]
        dec     ax
        jmp     br_0220A

br_021E2:
        cmp     dh, 0ffh
        jne     br_021F3
        mov     ch, dl
        mov     cl, ah
        neg     cx
        cmp     cx, word ptr [W_9D58]
        jb      br_021FB

br_021F3:
        mov     ax, word ptr [W_9D58]
        dec     ax
        neg     ax
        jmp     br_0220A

br_021FB:
        mov     cx, 7

tgt_021FE:
        shl     ax, 1
        rcl     dx, 1
        loop    tgt_021FE
        mov     cx, word ptr [W_9D58]
        idiv    cx

br_0220A:
        cmp     ax, word ptr [P_9F22]
        jle     br_02215
        mov     word ptr [P_9F22], ax
        jmp     br_0221E

br_02215:
        cmp     ax, word ptr [W_8FB8]
        jge     br_0221E
        mov     word ptr [W_8FB8], ax

br_0221E:
        pop     di
        pop     si
        pop     bp
        retf
        if      FW_VERSION = 150
mem_test_init:
        enter   6, 0
        push    di
        push    si
        mov     word ptr [bp-2], 8000h
        in      ax, DMA_STATUS
        test    al, 60h
        je      L_04838
        mov     ax, 80h
        out     DMA_STATUS, ax
L_04838:
        push    8
        callf   TEXT2_SEG:mpc_poll_data
        xor     ax, ax
        mov     dx, 7000h
        mov     si, ax
        mov     word ptr [bp-2], dx
L_04849:
        mov     es, word ptr [bp-2]
        mov     bx, si
        add     si, 2
        mov     word ptr es:[bx], 5555h
        mov     es, word ptr [bp-2]
        mov     bx, si
        add     si, 2
        mov     word ptr es:[bx], 0aaaah
        mov     es, word ptr [bp-2]
        mov     bx, si
        add     si, 2
        mov     word ptr es:[bx], 1248h
        or      si, si
        je      L_04849
        mov     di, word ptr [bp+4]
        push    7000h
        push    0
        push    8000h
        push    di
        call    system_init_handler
        or      ax, ax
        jne     L_04890
L_04887:
        xor     ax, ax
        pop     si
        pop     di
        leave
        ret     2
        db      90h
L_04890:
        xor     ax, ax
        mov     dx, 7000h
        mov     bx, ax
        mov     word ptr [bp-2], dx
L_0489A:
        mov     es, word ptr [bp-2]
        mov     si, bx
        add     bx, 2
        mov     word ptr es:[si], 0aaaah
        mov     es, word ptr [bp-2]
        mov     si, bx
        add     bx, 2
        mov     word ptr es:[si], 1248h
        mov     es, word ptr [bp-2]
        mov     si, bx
        add     bx, 2
        mov     word ptr es:[si], 5555h
        or      bx, bx
        je      L_0489A
        push    7000h
        push    0
        push    8000h
        push    di
        call    system_init_handler
        or      ax, ax
        je      L_04887
        xor     ax, ax
        mov     dx, 7000h
        mov     bx, ax
        mov     word ptr [bp-2], dx
L_048DF:
        mov     es, word ptr [bp-2]
        mov     si, bx
        add     bx, 2
        mov     word ptr es:[si], 1248h
        mov     es, word ptr [bp-2]
        mov     si, bx
        add     bx, 2
        mov     word ptr es:[si], 5555h
        mov     es, word ptr [bp-2]
        mov     si, bx
        add     bx, 2
        mov     word ptr es:[si], 0aaaah
        or      bx, bx
        je      L_048DF
        push    7000h
        push    0
        push    8000h
        push    di
        call    system_init_handler
        cmp     ax, 1
        sbb     ax, ax
        inc     ax
        pop     si
        pop     di
        leave
        ret     2
        endif
system_init_handler:
        enter   0ah, 0
        push    di
        push    si
        if      FW_VERSION = 172
        mov     word ptr [bp-2], 7000h
        mov     word ptr [bp-8], 0
        mov     word ptr [bp-6], 1
        else
        mov     bx, word ptr [bp+6]
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        mov     cx, bx
        add     cx, bx
        add     ax, cx
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     word ptr [bp-4], 0
        mov     word ptr [bp-2], 1
        endif
        cmp     word ptr [SMEM_SIZE_HI], 1
        jge     br_02241
        jmp     L_0231A

br_02241:
        jg      L_0224D
        cmp     word ptr [SMEM_SIZE], 0
        jne     L_0224D
        jmp     L_0231A
L_0224D:
        if      FW_VERSION = 172

        xor     bx, bx
        xor     ax, ax
        mov     dx, 7000h
        mov     di, ax
        mov     es, dx

L_02258:
        endif
        mov     ax, bx
        if      FW_VERSION = 172
        mov     cx, word ptr [bp-8]
        add     ax, cx
        mov     cx, bx
        sub     dx, dx
        add     cx, word ptr [bp-8]
        adc     dx, word ptr [bp-6]
        xor     ax, dx
        xor     ax, word ptr [bp+8]
        mov     word ptr es:[di], ax
        add     di, 2
        inc     bx
        cmp     bx, 4000h
        jb      L_02258
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    7000h
        push    0
        push    4000h
        callf   TEXT2_SEG:flash_write_words
        else
        shr     ax, 1
        mov     word ptr [bp-0ah], ax
L_04964:
        endif
        xor     ax, ax
        if      FW_VERSION = 172
        mov     cx, 4000h
        xor     bx, bx
        mov     dx, 7000h
        else
        mov     cx, word ptr [bp+6]
        mov     bx, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        endif
        mov     di, bx
        mov     es, dx
        if      FW_VERSION = 150
        shr     cx, 1
        endif
        rep stosw
        if      FW_VERSION = 150
        jae     L_0497A
        stosb
L_0497A:
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp-0ah]
        callf   TEXT2_SEG:flash_write_words
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        endif
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        if      FW_VERSION = 172
        push    dx
        push    ax
        push    4000h
        else
        push    word ptr [bp-0ah]
        endif
        callf   TEXT2_SEG:smem_read_words
        if      FW_VERSION = 172
        xor     si, si
        mov     word ptr [bp-2], 7000h
        mov     bx, si

        else
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        mov     cx, word ptr [bp+6]
        mov     di, ax
        mov     es, dx
        push    ds
        lds     si, [bp+8]
        xor     ax, ax
        repe cmpsb
        je      L_022B7
        sbb     ax, ax
        sbb     ax, 0ffffh
        endif
L_022B7:
        if      FW_VERSION = 172
        mov     ax, si
        mov     cx, word ptr [bp-8]
        add     ax, cx
        mov     cx, si
        sub     dx, dx
        add     cx, word ptr [bp-8]
        adc     dx, word ptr [bp-6]
        xor     ax, dx
        xor     ax, word ptr [bp+8]
        mov     es, word ptr [bp-2]
        cmp     ax, word ptr es:[bx]
        else
        pop     ds
        or      ax, ax
        endif
        jne     br_02312
        if      FW_VERSION = 172
        add     bx, 2
        inc     si
        cmp     si, 4000h
        jb      L_022B7
        cmp     word ptr [bp+6], 0
        else
        cmp     word ptr [bp+4], ax
        endif
        je      br_022EE
        if      FW_VERSION = 172
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        call    word ptr [bp+6]

        else
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        call    word ptr [bp+4]
        endif
br_022EE:
        mov     ax, word ptr [SMEM_SIZE]
        mov     dx, word ptr [SMEM_SIZE_HI]
        if      FW_VERSION = 172
        add     byte ptr [bp-7], 40h
        adc     word ptr [bp-6], 0
        cmp     word ptr [bp-6], dx
        else
        mov     cx, word ptr [bp-0ah]
        sub     bx, bx
        add     word ptr [bp-4], cx
        adc     word ptr [bp-2], bx
        cmp     word ptr [bp-2], dx
        endif
        jge     br_02305
        if      FW_VERSION = 172
        jmp     L_0224D

        else
        jmp     L_04964
        endif
br_02305:
        jg      L_0231A
        if      FW_VERSION = 172
        cmp     word ptr [bp-8], ax
        else
        cmp     word ptr [bp-4], ax
        endif
        jae     L_0230F
        if      FW_VERSION = 172
        jmp     L_0224D

        else
        jmp     L_04964
        endif
L_0230F:
        jmp     L_0231A
        db      90h

br_02312:
        xor     ax, ax
        pop     si
        pop     di
        leave
        if      FW_VERSION = 172
        retf    4

        else
        ret     8
        endif
L_0231A:
        mov     ax, 1
        pop     si
        pop     di
        leave
        if      FW_VERSION = 172
        retf    4
        db      00h

mem_test_init:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+4]
        push    55aah
        push    si
        nop
        push    cs
        call    system_init_handler
        or      ax, ax
        jne     L_02340

L_02338:
        xor     ax, ax
        pop     si
        leave
        ret     2
        db      90h

L_02340:
        push    0aa55h
        push    si
        nop
        push    cs
        call    system_init_handler
        or      ax, ax
        je      L_02338
        push    1248h
        push    si
        nop
        push    cs
        call    system_init_handler
        cmp     ax, 1
        sbb     ax, ax
        inc     ax
        pop     si
        leave
        ret     2
        else
        ret     8
        endif
        db      00h

; ? no port I/O: gated on [4EFCh]'s sign, computes a 4-bit value.
mpc_mode_setup:
        push    bp
        mov     bp, sp
        cmp     word ptr [W_4EFC], 0
        jl      L_023CC
        push    7
        push    1ch
        push    ds
        push    STR_TESTING_MEMORY
        callf   TEXT2_SEG:cmd_dispatch_1E
        cmp     word ptr [W_4EFC], 0
        jne     br_023B2
        push    73h
        push    1ch
        mov     ax, word ptr [bp+4]
        mov     dx, word ptr [bp+6]
        add     ax, ax
        adc     dx, dx
        adc     ax, ax
        adc     dx, dx
        adc     ax, ax
        adc     dx, dx
        adc     ax, ax
        adc     dx, dx
        adc     ax, ax
        xchg    dx, ax
        and     dx, 0fh
        push    dx
        push    ax
        push    6
        callf   TEXT2_SEG:draw_unsigned_value
        callf   TEXT2_SEG:cmd_far_stub
        leave
        ret     4

br_023B2:
        push    7fh
        push    1ch
        cmp     word ptr [W_4EFC], 2
        jne     L_023C2
        mov     ax, STR_OKAY
        jmp     br_023C5

L_023C2:
        mov     ax, STR_FAIL

br_023C5:
        push    ds
        push    ax
        callf   TEXT2_SEG:cmd_dispatch_1E

L_023CC:
        leave
        ret     4

system_setup_2:
        enter   2, 0
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_03C8
        nop
        push    cs
        call    disp_list_run
        push    ds
        push    DL_WAVE_MEMORY_TEST
        nop
        push    cs
        call    disp_list_run
        push    7
        push    0ah
        mov     ax, word ptr [SMEM_SIZE_HI]
        shr     ax, 4
        mov     byte ptr [bp-1], al
        sub     ah, ah
        push    0
        push    ax
        push    2
        callf   TEXT2_SEG:draw_unsigned_value
        cmp     byte ptr [bp-1], 1
        jbe     L_02416
        push    31h
        push    0ah
        push    73h
        callf   TEXT2_SEG:cmd_ratio_setup

L_02416:
        push    0
        push    0
        call    mpc_mode_setup
        pop     ds
        leave
        retf

L_02420:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        if      FW_VERSION = 172
        mov     ax, word ptr [SMEM_SIZE_HI]
        or      ax, word ptr [SMEM_SIZE]
        je      L_02448
        endif
        mov     word ptr [W_4EFC], 0
        push    MPC_MODE_SETUP
        call    mem_test_init
        inc     al
        cbw
        mov     word ptr [W_4EFC], ax
        if      FW_VERSION = 172
        callf   TEXT2_SEG:L_005B4
        endif
        pop     ds
        retf
        if      FW_VERSION = 172

L_02448:
        push    ds
        push    STR_05B6
        callf   TEXT2_SEG:string_fill_stosb
        pop     ds
        retf
        db      00h
        endif
smem_pool_insert:
        enter   2, 0
        push    di
        push    si
        mov     bx, word ptr [SMEM_POOL_FREE]
        mov     word ptr [bp-2], bx
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL_NEXT]
        mov     word ptr [SMEM_POOL_FREE], ax
        mov     bx, word ptr [bp-2]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        push    ds
        lea     di, [bx+SMEM_POOL]
        lea     si, [bp+4]
        mov     ax, ds
        mov     es, ax
        mov     ax, ss
        mov     ds, ax
        mov     cx, 5
        rep movsw
        pop     ds
        mov     ax, word ptr [SMEM_POOL_USED]
        mov     word ptr [bx+SMEM_POOL_NEXT], ax
        mov     ax, word ptr [bp-2]
        mov     word ptr [SMEM_POOL_USED], ax
        pop     si
        pop     di
        leave
        ret     0ah
smem_pool_remove:
        enter   2, 0
        push    di
        push    si
        mov     di, word ptr [bp+4]
        cmp     word ptr [SMEM_POOL_USED], di
        jne     br_024CC
        mov     bx, di
        shl     bx, 2
        add     bx, di
        add     bx, bx
        add     bx, SMEM_POOL_NEXT
        mov     word ptr [bp-2], bx
        mov     ax, word ptr [bx]
        mov     word ptr [SMEM_POOL_USED], ax
        jmp     br_02522
br_024CC:
        mov     si, word ptr [SMEM_POOL_USED]
        mov     bx, si
        mov     ax, si
        shl     si, 2
        add     si, ax
        add     si, si
        cmp     word ptr [si+SMEM_POOL_NEXT], di
        je      br_02503
loop_024E1:
        cmp     bx, 82h
        jge     br_0252E
        mov     si, bx
        shl     si, 2
        add     si, bx
        add     si, si
        mov     bx, word ptr [si+SMEM_POOL_NEXT]
        mov     si, bx
        shl     si, 2
        add     si, bx
        add     si, si
        cmp     word ptr [si+SMEM_POOL_NEXT], di
        jne     loop_024E1

br_02503:
        mov     si, di
        shl     si, 2
        add     si, di
        add     si, si
        add     si, SMEM_POOL_NEXT
        mov     word ptr [bp-2], si
        mov     ax, word ptr [si]
        mov     cx, bx
        shl     bx, 2
        add     bx, cx
        add     bx, bx
        mov     word ptr [bx+SMEM_POOL_NEXT], ax

br_02522:
        mov     bx, word ptr [bp-2]
        mov     ax, word ptr [SMEM_POOL_FREE]
        mov     word ptr [bx], ax
        mov     word ptr [SMEM_POOL_FREE], di

br_0252E:
        pop     si
        pop     di
        leave
        ret     2

smem_alloc:
        enter   0ch, 0
        add     word ptr [bp+6], 0fh
        adc     word ptr [bp+8], 0
        callf   TEXT2_SEG:smem_alloc_top
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        and     al, 0f0h
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        add     ax, word ptr [bp-0ch]
        adc     dx, word ptr [bp-0ah]
        cmp     dx, word ptr [SMEM_SIZE_HI]
        jl      br_02574
        jg      loop_0256D
        cmp     ax, word ptr [SMEM_SIZE]
        jbe     br_02574

loop_0256D:
        mov     ax, 0ffffh
        leave
        retf    4

br_02574:
        push    word ptr [bp-4]
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        call    smem_pool_insert
        cmp     ax, 82h
        je      loop_0256D
        leave
        retf    4
        db      00h
midi_status_process:
        enter   0ch, 0
        add     word ptr [bp+6], 0fh
        adc     word ptr [bp+8], 0
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        and     al, 0f0h
        push    word ptr [bp-4]
        push    dx
        push    ax
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        call    smem_pool_insert
        cmp     ax, 82h
        jne     br_025C6
        mov     ax, 0ffffh

br_025C6:
        leave
        retf    8

smem_free:
        push    bp
        mov     bp, sp
        push    word ptr [bp+6]
        call    smem_pool_remove
        leave
        retf    2
        db      00h

X_025D8:
        push    di
        push    si
        xor     ax, ax
        mov     cx, 3
        mov     di, W_9D1E
        push    ds
        pop     es
        rep stosw
        callf   TEXT2_SEG:string_copy_cmd
        xor     ax, ax
        callf   TEXT2_SEG:port_c2_write
        xor     ax, ax
        mov     dx, 1
        push    dx
        push    ax
        mov     ax, 10h
        push    ax
        push    dx
        mov     ax, 1001h
        push    ax
        call    smem_block_init
        or      ax, ax
        je      X_0260F
        mov     word ptr [W_9D1E], 1

X_0260F:
        mov     ax, 7
        callf   TEXT2_SEG:port_c2_write
        push    1
        push    0
        push    10h
        push    10h
        push    1001h
        call    smem_block_init
        or      ax, ax
        je      br_02630
        mov     si, 10h
        jmp     br_026FF
        db      90h

br_02630:
        mov     ax, 5
        callf   TEXT2_SEG:port_c2_write
        push    1
        push    0
        push    10h
        push    0ah
        push    1001h
        call    smem_block_init
        or      ax, ax
        je      br_02654

loop_0264A:
        mov     si, word ptr [W_9D1E]
        add     si, 0ah
        jmp     br_026FF

br_02654:
        mov     ax, 2
        callf   TEXT2_SEG:port_c2_write
        push    1
        push    0
        push    10h
        push    0ah
        push    1001h
        call    smem_block_init
        or      ax, ax
        jne     loop_0264A
        mov     ax, 6
        callf   TEXT2_SEG:port_c2_write
        push    1
        push    0
        push    10h
        push    8
        push    1001h
        call    smem_block_init
        or      ax, ax
        je      br_02692

loop_02688:
        mov     si, word ptr [W_9D1E]
        add     si, 8
        jmp     br_026FF
        db      90h

br_02692:
        mov     ax, 4
        callf   TEXT2_SEG:port_c2_write
        push    1
        push    0
        push    10h
        push    8
        push    1001h
        call    smem_block_init
        or      ax, ax
        jne     loop_02688
        mov     ax, 3
        callf   TEXT2_SEG:port_c2_write
        push    1
        push    0
        push    10h
        push    4
        push    1001h
        call    smem_block_init
        or      ax, ax
        je      br_026D0
        mov     si, word ptr [W_9D1E]
        add     si, 4
        jmp     br_026FF
        db      90h

br_026D0:
        mov     ax, 1
        callf   TEXT2_SEG:port_c2_write
        push    1
        push    0
        push    10h
        push    2
        push    1001h
        call    smem_block_init
        or      ax, ax
        je      br_026F4
        mov     si, word ptr [W_9D1E]
        add     si, 2
        jmp     br_026FF
        db      90h

br_026F4:
        xor     ax, ax
        callf   TEXT2_SEG:port_c2_write
        mov     si, word ptr [W_9D1E]

br_026FF:
        mov     ax, si
        sub     dx, dx
        shl     ax, 4
        mov     word ptr [SMEM_SIZE], dx
        mov     word ptr [SMEM_SIZE_HI], ax
        or      si, si
        je      L_0271B
        push    1
        push    2680h
        nop
        push    cs
        call    smem_alloc

L_0271B:
        mov     ax, si
        pop     si
        pop     di
        if      FW_VERSION = 172
        ret

L_02720:
        call    X_025D8
        call    X_025D8
        endif
        retf
        if      FW_VERSION = 172
        db      00h
        endif
smem_block_init:
        enter   16h, 0
        push    di
        push    si
        mov     bx, word ptr [bp+4]
        mov     ax, bx
        add     ax, bx
        mov     dx, 7000h
        mov     word ptr [bp-12h], ax
        mov     word ptr [bp-10h], dx
        xor     si, si
        mov     word ptr [bp-8], bx
        mov     ax, word ptr [bp+6]
        mov     word ptr [bp-0ah], ax
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     dx, word ptr [bp+8]
        sub     cx, cx
        mov     word ptr [bp-16h], cx
        mov     word ptr [bp-14h], dx
        mov     di, bx
tgt_02762:
        push    7000h
        push    0
        push    si
        push    di
        call    buffer_init
        mov     si, ax
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    7000h
        push    0
        push    di
        callf   TEXT2_SEG:flash_write_words
        mov     ax, word ptr [bp-16h]
        mov     dx, word ptr [bp-14h]
        add     word ptr [bp-4], ax
        adc     word ptr [bp-2], dx
        dec     word ptr [bp-0ah]
        jne     tgt_02762
        mov     word ptr [bp-6], 0
        mov     ax, word ptr [bp+4]
        mov     word ptr [bp-8], ax
        mov     ax, word ptr [bp+6]
        mov     word ptr [bp-0ah], ax
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
loop_027AD:
        push    7000h
        push    0
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        call    buffer_init
        mov     word ptr [bp-6], ax
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    word ptr [bp-10h]
        push    word ptr [bp-12h]
        push    word ptr [bp-8]
        callf   TEXT2_SEG:smem_read_words
        xor     ax, ax
        mov     dx, 7000h
        mov     bx, word ptr [bp-12h]
        mov     si, word ptr [bp-10h]
        mov     cx, word ptr [bp-8]
        add     cx, cx
        push    ds
        push    si
        mov     di, bx
        mov     si, ax
        pop     es
        mov     ds, dx
        repe cmpsb
        je      tgt_027F4
        sbb     ax, ax
        sbb     ax, 0ffffh
tgt_027F4:
        pop     ds
        or      ax, ax
        jne     br_0280E
        mov     ax, word ptr [bp+8]
        mov     dx, ax
        sub     cx, cx
        add     word ptr [bp-4], cx
        adc     word ptr [bp-2], dx
        dec     word ptr [bp-0ah]
        jne     loop_027AD
        jmp     br_02816
        db      90h
; ? no entry point at 0x027cc -- mid-instruction

br_0280E:
        xor     ax, ax
        pop     si
        pop     di
        leave
        ret     0ah

br_02816:
        mov     ax, 1
        pop     si
        pop     di
        leave
        ret     0ah
        db      00h

buffer_init:
        enter   4, 0
        push    di
        push    si
        mov     word ptr [bp-4], 1
        mov     cx, word ptr [bp+4]
        mov     bx, word ptr [bp+6]

loop_02831:
        mov     word ptr [bp-2], 0
        mov     di, word ptr [bp+8]

loop_02839:
        or      cx, cx
        je      L_02856
        mov     es, word ptr [bp+0ah]
        mov     si, di
        add     di, 2
        mov     word ptr es:[si], bx
        add     bx, word ptr [bp-4]
        dec     cx
        inc     word ptr [bp-2]
        cmp     word ptr [bp-2], 80h
        jl      loop_02839

L_02856:
        mov     word ptr [bp+8], di
        not     bx
        inc     word ptr [bp-4]
        or      cx, cx
        jne     loop_02831
        mov     ax, bx
        pop     si
        pop     di
        leave
        ret     8

X_0286A:
        call    dsp_0292A
        mov     byte ptr [B_87E6], al
        or      al, al
        jne     dsp_02877
        jmp     br_0291E
dsp_02877:
        mov     byte ptr [B_8CDF], 2
        mov     ax, 180h
        out     ASIC_REG, ax
        mov     ax, 2
        out     ASIC_DATA, ax
        mov     ax, 181h
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        mov     cx, ax
        mov     byte ptr [ASIC_REG181_SHADOW], cl
        mov     ax, 182h
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        xor     bx, bx
dsp_028A0:
        mov     ax, bx
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        inc     bx
        cmp     bx, 120h
        jb      dsp_028A0
        mov     bx, 200h
dsp_028B2:
        mov     ax, bx
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        inc     bx
        cmp     bx, 280h
        jb      dsp_028B2
        mov     ax, 0c8h
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        mov     ax, 0c9h
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        mov     ax, 26eh
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        mov     ax, 0f6h
        out     ASIC_REG, ax
        mov     ax, 4000h
        out     ASIC_DATA, ax
        mov     ax, 0f2h
        out     ASIC_REG, ax
        mov     ax, 7fffh
        out     ASIC_DATA, ax
        mov     ax, 0f0h
        out     ASIC_REG, ax
        mov     ax, 64h
        out     ASIC_DATA, ax
        mov     ax, 27eh
        out     ASIC_REG, ax
        mov     ax, 100h
        out     ASIC_DATA, ax
        mov     ax, 264h
        out     ASIC_REG, ax
        mov     ax, 100h
        out     ASIC_DATA, ax
        push    TEXT2_SEG
        push    L_01A70
        push    49h
        nop
        push    cs
        call    ivt_set_vector
        add     sp, 6

br_0291E:
        callf   TEXT2_SEG:L_01872
        mov     al, byte ptr [B_87E6]
        sub     ah, ah
        retf
        db      00h

dsp_0292A:
        mov     cx, 100h
        xor     bx, bx

dsp_0292F:
        mov     ax, cx
        out     ASIC_REG, ax
        mov     ax, bx
        out     ASIC_DATA, ax
        add     bx, 3333h
        inc     cx
        cmp     cx, 120h
        jb      dsp_0292F
        mov     cx, 100h
        xor     bx, bx
dsp_02947:
        mov     ax, cx
        out     ASIC_REG, ax
        in      ax, ASIC_DATA
        cmp     ax, bx
        jne     br_0295E
        add     bx, 3333h
        inc     cx
        cmp     cx, 120h
        jb      dsp_02947

        jmp     br_02962

br_0295E:
        xor     ax, ax
        ret
        db      90h

br_02962:
        mov     ax, 1
        ret
smem_read_byte:
        push    bp
        mov     bp, sp
        mov     dh, 0ffh
        in      al, dx
        mov     ah, al
        mov     dl, 0feh
        in      al, dx
        and     al, 1
        mov     cl, al
        mov     al, 0f9h
        sar     al, cl
        and     ah, al
        shr     ch, cl
        or      ah, ch
        mov     dl, 0fch
        in      al, dx
        mov     dh, al
        mov     dl, ah
        leave
        ret
smem_byte_wrapper:
        push    bp
        mov     bp, sp
        call    smem_read_byte
        mov     al, bl
        out     dx, al
        leave
        ret
        db      00h
smem_read_word:
        push    bp
        mov     bp, sp
        call    smem_read_byte
        in      al, dx
        sub     ah, ah
        leave
        ret
        db      00h
smem_word_wrapper:
        push    bp
        mov     bp, sp
        mov     dl, 0f8h
        mov     ch, 2
        call    smem_read_word
        leave
        retf
v53_read_timer:
        push    bp
        mov     bp, sp
        mov     dx, 0fffch
        in      al, dx
        mov     ah, al
        mov     dx, 0fffbh
        in      al, dx
        and     al, 0f0h
        leave
        ret
        db      00h
smem_poll_ready:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     di, word ptr [bp+8]
        call    v53_read_timer
        mov     si, ax
        mov     ax, di
        sub     dx, dx
        add     ax, di
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, word ptr [bp+6]
        adc     dx, 0
        mov     bx, dx
        lea     dx, [si+4]
        out     dx, ax
        mov     ax, bx
        lea     dx, [si+6]
        out     dx, al
        pop     si
        pop     di
        leave
        retf    4
        db      00h
; indexes the 1Dh-stride pad record under PGM_CURRENT and triggers up to
; three notes through note_voice_prepare.  No port I/O.
pad_note_trigger:
        enter   0ah, 0
        push    di
        push    si
        mov     si, word ptr [bp+6]
        mov     es, word ptr [bp+8]
        mov     al, byte ptr es:[si+1]
        sub     ah, ah
        mov     word ptr [bp-8], ax
        imul    ax, ax, PGM_PAD_STRIDE
        add     ax, word ptr [PGM_CURRENT]
        mov     dx, word ptr [PGM_CURRENT+2]
        sub     ax, PGM_PAD_BIAS
        mov     di, ax
        mov     word ptr [bp-4], dx
        mov     es, dx
        mov     bx, ax
; V53 on-chip ports: 0FFFCh -> AH, 0FFFBh -> AL, masked 0F0h.


        cmp     byte ptr es:[bx+PGM_PAD_MODE], 2
        jne     br_02A9E
        mov     al, byte ptr es:[di+PGM_PAD_SW2]
        cbw
        mov     es, word ptr [bp+8]
        mov     cl, byte ptr es:[si+2]
        sub     ch, ch
        cmp     cx, ax
        jle     br_02A56
        mov     es, dx
        mov     al, byte ptr es:[di+PGM_PAD_ALT2]
        sub     ah, ah
        mov     word ptr [bp-8], ax
        sub     ax, 23h
        cmp     ax, 3fh
        jbe     br_02A82
        pop     si
        pop     di
        leave
        retf    4
br_02A56:
        mov     es, word ptr [bp-4]
        mov     al, byte ptr es:[di+PGM_PAD_SW1]
        cbw
        les     bx, [bp+6]
        sub     ch, ch
        mov     cl, byte ptr es:[bx+2]
        cmp     cx, ax
        jle     br_02A82
        mov     es, word ptr [bp-4]
        mov     al, byte ptr es:[di+PGM_PAD_ALT1]
        sub     ah, ah
        mov     word ptr [bp-8], ax
        sub     ax, 23h
        cmp     ax, 3fh
        jbe     br_02A82
        jmp     br_02BFC

br_02A82:
        imul    bx, word ptr [bp-8], PGM_PAD_STRIDE
        mov     es, word ptr [PGM_CURRENT+2]
        add     bx, word ptr [PGM_CURRENT]
        sub     bx, PGM_PAD_BIAS
        mov     di, bx
        mov     word ptr [bp-4], es
        mov     al, byte ptr es:[bx+PGM_PAD_DCY_MODE]
        jmp     br_02B1E

br_02A9E:
        cmp     byte ptr es:[di+PGM_PAD_MODE], 3
        jne     L_02B1A
        mov     es, word ptr [bp+8]
        cmp     byte ptr es:[si+4], 1
        jne     br_02AB8
        mov     cl, byte ptr es:[si+5]
        sub     ch, ch
        jmp     br_02AC2
        db      90h

br_02AB8:
        mov     es, word ptr [bp-4]
        mov     al, byte ptr es:[di+PGM_PAD_DECAY]
        cbw
        mov     cx, ax
br_02AC2:
        mov     es, word ptr [bp-4]
        mov     al, byte ptr es:[di+PGM_PAD_SW2]
        cbw
        cmp     ax, cx
        jge     tgt_02AE6
        mov     al, byte ptr es:[di+PGM_PAD_ALT2]
        sub     ah, ah
        mov     word ptr [bp-8], ax
        sub     ax, 23h
        cmp     ax, 3fh
        jbe     br_02B03
        pop     si
        pop     di
        leave
        retf    4
        db      90h
tgt_02AE6:
        mov     al, byte ptr es:[di+PGM_PAD_SW1]
        cbw
        cmp     ax, cx
        jge     br_02B03
        mov     al, byte ptr es:[di+PGM_PAD_ALT1]
        sub     ah, ah
        mov     word ptr [bp-8], ax
        sub     ax, 23h
        cmp     ax, 3fh
        jbe     br_02B03
        jmp     br_02BFC
br_02B03:
        imul    ax, word ptr [bp-8], PGM_PAD_STRIDE
        add     ax, word ptr [PGM_CURRENT]
        sub     ax, PGM_PAD_BIAS
        mov     di, ax
        mov     word ptr [bp-4], dx
        mov     word ptr [bp-2], 1
        jmp     br_02B22

L_02B1A:
        mov     al, byte ptr es:[di+PGM_PAD_DCY_MODE]

br_02B1E:
        cbw
        mov     word ptr [bp-2], ax

br_02B22:
        push    word ptr [bp-8]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    word ptr [bp-4]
        push    di
        les     bx, [bp+6]
        sub     ah, ah
        mov     al, byte ptr es:[bx+1]
        push    ax
        mov     si, ax
        callf   TEXT2_SEG:note_clamp_flag
        push    dx
        push    ax
        push    si
        callf   TEXT2_SEG:note_range_clamp
        push    dx
        push    ax
        push    word ptr [bp-2]
        call    note_voice_prepare
        mov     bx, word ptr [bp-8]
        mov     ax, bx
        add     bx, bx
        add     bx, ax
        mov     word ptr [bp-0ah], bx
        inc     byte ptr [bx+NOTE_HELD]
        mov     es, word ptr [bp-4]
        cmp     byte ptr es:[di+PGM_PAD_MODE], 1
        je      br_02B6D
        jmp     br_02BFC
br_02B6D:
        mov     al, byte ptr es:[di+PGM_PAD_ALT1]
        sub     ah, ah
        mov     si, ax
        lea     ax, [si-23h]
        cmp     ax, 3fh
        ja      br_02BAA
        push    si
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        imul    ax, si, PGM_PAD_STRIDE
        add     ax, word ptr [PGM_CURRENT]
        mov     dx, word ptr [PGM_CURRENT+2]
        sub     ax, PGM_PAD_BIAS
        push    dx
        push    ax
        push    si
        callf   TEXT2_SEG:note_clamp_flag
        push    dx
        push    ax
        push    si
        callf   TEXT2_SEG:note_range_clamp
        push    dx
        push    ax
        push    word ptr [bp-2]
        call    note_voice_prepare

br_02BAA:
        mov     bx, word ptr [bp-0ah]
        mov     ax, si
        mov     byte ptr [bx+NOTE_HELD_ALT1], al
        mov     es, word ptr [bp-4]
        mov     al, byte ptr es:[di+PGM_PAD_ALT2]
        sub     ah, ah
        mov     si, ax
        lea     ax, [si-23h]
        cmp     ax, 3fh
        ja      br_02BF3
        push    si
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        imul    ax, si, PGM_PAD_STRIDE
        add     ax, word ptr [PGM_CURRENT]
        mov     dx, word ptr [PGM_CURRENT+2]
        sub     ax, PGM_PAD_BIAS
        push    dx
        push    ax
        push    si
        callf   TEXT2_SEG:note_clamp_flag
        push    dx
        push    ax
        push    si
        callf   TEXT2_SEG:note_range_clamp
        push    dx
        push    ax
        push    word ptr [bp-2]
        call    note_voice_prepare

br_02BF3:
        mov     bx, word ptr [bp-0ah]
        mov     ax, si
        mov     byte ptr [bx+NOTE_HELD_ALT2], al

br_02BFC:
        pop     si
        pop     di
        leave
        retf    4

note_voice_prepare:
        enter   48h, 0
        push    di
        push    si
        mov     si, word ptr [bp+0eh]
        mov     es, word ptr [bp+10h]
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+PGM_PAD_SND_SEG]
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-4], dx
        or      dx, ax
        jne     br_02C22
        jmp     br_02E32
br_02C22:
        mov     di, word ptr [bp+12h]
        mov     es, word ptr [bp+14h]
        mov     al, byte ptr es:[di+2]
        mov     byte ptr [bp-47h], al
        mov     al, byte ptr es:[di+5]
        mov     byte ptr [bp-46h], al
        mov     al, byte ptr es:[di+4]
        mov     byte ptr [bp-45h], al
        lea     cx, [bp-48h]
        push    ss
        push    cx
        push    word ptr [bp-4]
        push    word ptr [bp-6]
        call    mpc_ctrl_init
        mov     es, word ptr [bp+10h]
        mov     al, byte ptr es:[si+PGM_PAD_VOICE]
        mov     byte ptr [bp-43h], al
        lea     ax, [bp-48h]
        push    ss
        push    ax
        les     bx, [bp-6]

        mov     al, byte ptr es:[bx+SND_TUNE]
        cbw
        push    ax
        mov     es, word ptr [bp+10h]
        push    word ptr es:[si+PGM_PAD_TUNE]
        mov     al, byte ptr es:[si+PGM_PAD_V_PITCH]
        cbw
        push    ax
        call    voice_pitch_ratio
        lea     ax, [bp-48h]
        push    ss
        push    ax
        push    word ptr [bp-4]
        push    word ptr [bp-6]
        mov     es, word ptr [bp+10h]
        mov     al, byte ptr es:[si+PGM_PAD_V_START]
        push    ax
        call    mpc_status_read
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        or      dx, dx
        jge     br_02C96
        jmp     br_02E32

br_02C96:
        jg      br_02C9F
        or      ax, ax
        jne     br_02C9F
        jmp     br_02E32

br_02C9F:
        lea     ax, [bp-48h]
        push    ss
        push    ax
        push    word ptr [bp+10h]
        push    si
        call    audio_mixing_handler
        lea     ax, [bp-48h]
        push    ss
        push    ax
        les     bx, [bp-6]
        sub     ah, ah
        mov     al, byte ptr es:[bx+SND_LEVEL]
        push    ax
        mov     es, word ptr [bp+10h]
        mov     al, byte ptr es:[si+PGM_PAD_V_LEVEL]
        cbw
        push    ax
        call    mpc_status_wait
        or      ax, ax
        jne     br_02CCD
        jmp     br_02E32

br_02CCD:
        mov     es, word ptr [bp+14h]
        cmp     byte ptr es:[di+4], 2
        jne     br_02CE0
        mov     al, byte ptr es:[di+5]
        sub     ah, ah
        jmp     X_02CE8
        db      90h

br_02CE0:
        mov     es, word ptr [bp+10h]
        mov     al, byte ptr es:[si+PGM_PAD_ATTACK]
        cbw

X_02CE8:
        mov     word ptr [bp-2], ax
        mov     es, word ptr [bp+10h]
        mov     al, byte ptr es:[si+PGM_PAD_V_ATTACK]
        cbw
        if      FW_VERSION = 172
L_02CF4                         equ     $+1
        endif
        mov     cx, ax
        mov     ax, 80h
        mov     es, word ptr [bp+14h]
        mov     dl, byte ptr es:[di+2]
        sub     dh, dh
        sub     ax, dx
        imul    cx
        mov     cx, 7fh
        cwd
        idiv    cx
        mov     bx, ax
        add     bx, ax
        mov     ax, word ptr [bx+TBL_09DA]
        mov     bx, word ptr [bp-2]
        add     bx, bx
        add     ax, word ptr [bx+TBL_09DA]
        mov     word ptr [bp-8], ax
        cmp     byte ptr es:[di+4], 1
        jne     br_02D36
        mov     cl, byte ptr es:[di+5]
        mov     byte ptr [bp-42h], 1
        mov     word ptr [bp-2], cx
        mov     di, cx
        jmp     br_02D46
        db      90h
br_02D36:
        mov     es, word ptr [bp+10h]
        mov     al, byte ptr es:[si+PGM_PAD_DECAY]
        cbw
        mov     di, ax
        mov     al, byte ptr [bp+4]
        mov     byte ptr [bp-42h], al
br_02D46:
        lea     cx, [bp-48h]
        push    ss
        push    cx
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        push    word ptr [bp-8]
        mov     bx, di
        mov     di, word ptr [bx+di+TBL_09DA]
        push    di
        call    system_setup
        lea     ax, [bp-48h]
        push    ss
        push    ax
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        call    midi_parse_channel
        les     bx, [bp-6]
        cmp     byte ptr es:[bx+SND_STEREO], 0
        jne     br_02D7F
        jmp     br_02E0D

br_02D7F:
        mov     al, byte ptr [bp-3fh]
        mov     byte ptr [bp-1], al
        or      al, al
        jle     br_02D9E
        cmp     al, 9
        jge     br_02D9E
        dec     al
        and     al, 0feh
        inc     al
        mov     byte ptr [bp-1], al
        mov     byte ptr [bp-3fh], al
        inc     al
        mov     byte ptr [bp-1], al
br_02D9E:
        mov     al, byte ptr [bp-41h]
        mov     byte ptr [bp-2], al
        mov     byte ptr [bp-41h], 0
        mov     byte ptr [bp-48h], 0ffh
        lea     ax, [bp-48h]
        push    ss
        push    ax
        push    word ptr [bp+16h]
        mov     es, word ptr [bp+10h]
        mov     al, byte ptr es:[si+PGM_PAD_MUTE1]
        sub     ah, ah
        push    ax
        mov     al, byte ptr es:[si+PGM_PAD_MUTE2]
        push    ax
        callf   TEXT2_SEG:voice_start
        mov     al, byte ptr [bp-1]
        mov     byte ptr [bp-3fh], al
        mov     al, byte ptr [bp-2]
        mov     byte ptr [bp-41h], al
        mov     byte ptr [bp-40h], 0
        les     bx, [bp-6]

        mov     ax, word ptr es:[bx+SND_LENGTH]
        mov     dx, word ptr es:[bx+SND_LENGTH_HI]
        add     ax, 0fh
        adc     dx, 0
        and     al, 0f0h
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-8], dx
        add     word ptr [bp-32h], ax
        adc     word ptr [bp-30h], dx
        add     word ptr [bp-2eh], ax
        adc     word ptr [bp-2ch], dx
        add     word ptr [bp-2ah], ax
        adc     word ptr [bp-28h], dx
        cmp     byte ptr [bp-43h], 1
        jne     br_02E0D
        mov     byte ptr [bp-43h], 0
br_02E0D:
        mov     byte ptr [bp-48h], 0ffh
        lea     ax, [bp-48h]
        push    ss
        push    ax
        push    word ptr [bp+16h]
        mov     es, word ptr [bp+10h]
        mov     al, byte ptr es:[si+PGM_PAD_MUTE1]
        sub     ah, ah
        push    ax
        mov     al, byte ptr es:[si+PGM_PAD_MUTE2]
        push    ax
        callf   TEXT2_SEG:voice_start
        callf   TEXT2_SEG:dma_status_rearm


br_02E32:
        pop     si
        pop     di
        leave
        ret     14h
; ? no port I/O: indexes the per-voice sample-state array, stride 10.
mpc_ctrl_init:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     di, word ptr [bp+8]
        mov     si, word ptr [bp+4]
        mov     es, word ptr [bp+6]
        mov     bx, word ptr es:[si+SND_POOL_IDX]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL]
        mov     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        add     ax, word ptr es:[si+SND_END]
        adc     dx, word ptr es:[si+SND_END_HI]
        mov     es, word ptr [bp+0ah]
        mov     word ptr es:[di+1ah], ax
        mov     word ptr es:[di+1ch], dx
        mov     ax, word ptr es:[di+1ah]
        mov     es, word ptr [bp+6]
        sub     ax, word ptr es:[si+SND_LOOP]
        sbb     dx, word ptr es:[si+SND_LOOP_HI]
        mov     es, word ptr [bp+0ah]
        mov     word ptr es:[di+1eh], ax
        mov     word ptr es:[di+20h], dx
        mov     es, word ptr [bp+6]
        mov     ax, word ptr es:[si+SND_FIELD_32]
        mov     dx, word ptr es:[si+SND_FIELD_32_HI]
        mov     es, word ptr [bp+0ah]
        mov     word ptr es:[di+22h], ax
        mov     word ptr es:[di+24h], dx
        mov     es, word ptr [bp+6]
        mov     ax, word ptr es:[si+SND_LOOP_HI]
        or      ax, word ptr es:[si+SND_LOOP]
        jne     br_02EBA
        mov     es, word ptr [bp+0ah]
        mov     byte ptr es:[di+4], 0
        pop     si
        pop     di
        leave
        ret     8
        db      90h
br_02EBA:
        mov     al, byte ptr es:[si+24h]
        mov     es, word ptr [bp+0ah]
        mov     byte ptr es:[di+4], al
        pop     si
        pop     di
        leave
        ret     8
        db      00h
voice_pitch_ratio:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     di, word ptr [bp+0ah]
        mov     es, word ptr [bp+0ch]
        mov     al, byte ptr es:[di+1]
        cbw
        imul    word ptr [bp+4]
        mov     cx, 7fh
        cwd
        idiv    cx
        mov     si, ax
        add     si, word ptr [bp+6]
        add     si, word ptr [bp+8]
        cmp     byte ptr es:[di+3], ch
        jne     br_02EFF
        mov     al, byte ptr es:[di+2]
        cbw
        sub     ax, 40h
        add     ax, ax
        add     si, ax
; ? no port I/O: scales a struct byte by a caller param.
br_02EFF:
        TL_HOOK_VOICE_RATIO
; ?
audio_mixing_handler:
        enter   0ah, 0
        push    di
        push    si
        mov     di, word ptr [bp+8]
        les     bx, [bp+4]
        mov     al, byte ptr es:[bx+MPC_STATE_flag_12]
        mov     cx, ax
        mov     al, byte ptr es:[bx+MPC_STATE_pos_hi]
        mov     es, word ptr [bp+0ah]
        imul    byte ptr es:[di+1]
        mov     dx, 7fh
        mov     bx, dx
        cwd
        idiv    bx
        mov     si, ax
        mov     al, cl
        cbw
        add     si, ax
        cmp     byte ptr es:[di+3], 3
        jne     br_02F5F
        mov     al, byte ptr es:[di+2]
        cbw
        sub     ax, 32h
        add     si, ax
br_02F5F:
        or      si, si
        jge     br_02F65
        xor     si, si

br_02F65:
        cmp     si, 64h
        jle     br_02F6D
        mov     si, 64h

br_02F6D:
        les     bx, [bp+4]
        mov     al, byte ptr es:[bx+MPC_STATE_time_hi]
        cbw
        add     ax, si
        mov     word ptr [bp-2], ax
        cmp     ax, 64h
        jle     br_02F84
        mov     word ptr [bp-2], 64h

br_02F84:
        mov     bx, si
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr [bx+si+TBL_0B6E]
        mov     word ptr es:[di+26h], 0
        mov     word ptr es:[di+28h], ax
        les     bx, [bp+4]
        mov     al, byte ptr es:[bx+MPC_STATE_flag_13]
        cbw
        mov     bx, word ptr [bp-2]
        add     bx, bx
        mov     cx, word ptr [bx+TBL_0B6E]
        and     cx, 3ff8h
        add     cx, cx
        add     cx, ax
        mov     es, word ptr [bp+0ah]
        mov     word ptr es:[di+2ah], cx
        les     bx, [bp+4]
        mov     al, byte ptr es:[bx+MPC_STATE_flag_13]
        cbw
        mov     bx, si
        mov     cx, word ptr [bx+si+TBL_0B6E]
        and     cx, 3ff8h
        add     cx, cx
        add     cx, ax
        mov     es, word ptr [bp+0ah]
        mov     word ptr es:[di+2eh], cx
        mov     ax, word ptr [bp-2]
        sub     ax, si
        mov     word ptr [bp-4], ax
        or      ax, ax
        jne     br_02FEE
        mov     es, word ptr [bp+0ah]
        mov     word ptr es:[di+3ah], ax
        mov     word ptr es:[di+2ch], ax
        jmp     br_030A2
br_02FEE:
        push    0
        push    2
        mov     ax, 447h
        imul    word ptr [bp-4]
        push    dx
        push    ax
        nop
        push    cs
        call    __aFldiv
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-8], dx
        mov     si, word ptr [bp+4]
        mov     es, word ptr [bp+6]
        mov     al, byte ptr es:[si+14h]
        cbw
        mov     bx, ax
        add     bx, ax
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr [bx+TBL_09DA]
        mov     word ptr es:[di+3ah], ax
        or      ax, ax
        jne     br_0302C
        mov     es, word ptr [bp+0ah]
        mov     word ptr es:[di+3ah], 1
br_0302C:
        mov     es, word ptr [bp+0ah]
        push    0
        push    word ptr es:[di+3ah]
        push    word ptr [bp-8]
        push    word ptr [bp-0ah]
        nop
        push    cs
        call    __aFldiv
        mov     word ptr [bp-4], ax
        or      dx, dx
        jl      L_03053
        jg      L_0304E
        cmp     ax, 7fffh
        jbe     L_03053

L_0304E:
        mov     word ptr [bp-4], 7fffh

L_03053:
        mov     ax, word ptr [bp-4]
        mov     es, word ptr [bp+0ah]
        mov     word ptr es:[di+2ch], ax
        mov     es, word ptr [bp+6]

; port write sequence, 0x78-0x94
ctrl_port_sequence:
        mov     al, byte ptr es:[si+15h]
        cbw
        mov     bx, ax
        add     bx, ax

L_03069:
        mov     ax, word ptr [bx+TBL_09DA]
        or      ax, ax
        je      L_03076
        mov     si, ax
        jmp     br_03079
        db      90h

L_03076:
        mov     si, 1

br_03079:
        push    0
        push    si
        push    word ptr [bp-8]
        push    word ptr [bp-0ah]
        nop
        push    cs
        call    __aFldiv
        mov     word ptr [bp-4], ax
        or      dx, dx
        jl      br_0309A
        jg      L_03095
        cmp     ax, 7fffh
        jbe     br_0309A

L_03095:
        mov     word ptr [bp-4], 7fffh

br_0309A:
        mov     ax, word ptr [bp-4]
        neg     ax
        mov     es, word ptr [bp+0ah]

br_030A2:
        mov     word ptr es:[di+30h], ax
        pop     si
        pop     di
        leave
        ret     8
mpc_status_read:
        enter   4, 0
        push    di
        push    si
        mov     di, word ptr [bp+6]
        mov     si, word ptr [bp+0ah]
        push    0
        push    0ah
        mov     cl, byte ptr [bp+4]
        sub     ch, ch
        mov     es, word ptr [bp+0ch]
        mov     al, byte ptr es:[si+1]
        cbw
        sub     ax, 80h
        neg     ax
        imul    cx
        mov     cx, 7fh
        cwd
        idiv    cx
        mov     bx, ax
        add     bx, ax
        mov     ax, 1b9h
        imul    word ptr [bx+TBL_09DA]
        push    dx
        push    ax
        nop
        push    cs
        call    __aFuldiv
        mov     es, word ptr [bp+8]
        add     ax, word ptr es:[di+SND_START]
        adc     dx, word ptr es:[di+SND_START_HI]
        mov     es, word ptr [bp+0ch]
        mov     word ptr es:[si+16h], ax
        mov     word ptr es:[si+18h], dx
        push    0
        push    1b9h
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[di+SND_END]
        mov     dx, word ptr es:[di+SND_END_HI]
        mov     es, word ptr [bp+0ch]
        sub     ax, word ptr es:[si+16h]
        sbb     dx, word ptr es:[si+18h]
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
        nop
        push    cs
        call    __aFldiv
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     es, word ptr [bp+0ch]
        cmp     byte ptr es:[si+4], 0
        jne     br_0314C
        sub     word ptr [bp-4], 1eh
        sbb     word ptr [bp-2], 0
br_0314C:
        mov     es, word ptr [bp+8]
        mov     bx, word ptr es:[di+SND_POOL_IDX]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL]
        mov     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        mov     es, word ptr [bp+0ch]
        add     word ptr es:[si+16h], ax
        adc     word ptr es:[si+18h], dx
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        pop     si
        pop     di
        leave
        ret     0ah
        db      00h
mpc_status_wait:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     si, word ptr [bp+8]
        push    0
        push    0c671h
        mov     es, word ptr [bp+0ah]
        mov     al, byte ptr es:[si+1]
        cbw
        sub     ax, 7fh
        imul    word ptr [bp+4]
        add     ax, 319ch
        mov     cx, 64h
        cwd
        idiv    cx
        imul    word ptr [bp+6]
        push    ax
        push    0
        mov     di, es
        nop
        push    cs
        call    __aFldiv
        mov     es, di
        mov     word ptr es:[si+10h], ax
        pop     si
        pop     di
        leave
        ret     8
        db      00h
system_setup:
        enter   4, 0
        push    di
        push    si
        mov     si, word ptr [bp+0ch]
        mov     es, word ptr [bp+0eh]
        mov     di, word ptr es:[si+10h]
        push    0
        push    word ptr es:[si+0eh]
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
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
        nop
        push    cs
        call    __aFuldiv
        mov     es, word ptr [bp+0eh]
        mov     word ptr es:[si+32h], ax
        mov     word ptr es:[si+34h], dx
        mov     ax, di
        cwd
        push    dx
        push    di
        push    0
        push    word ptr es:[si+0eh]
        nop
        push    cs
        call    __aFlmul
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        cmp     word ptr [bp+6], 0
        jne     br_t1_03224
        mov     es, word ptr [bp+0eh]
        mov     word ptr es:[si+12h], di
        jmp     br_0325C
        db      90h

br_t1_03224:
        push    dx
        push    ax
        mov     ax, 57dbh
        mul     word ptr [bp+6]
        push    dx
        push    ax
        callf   TEXT2_SEG:string_scan_status
        mov     es, word ptr [bp+0eh]
        mov     word ptr es:[si+12h], ax
        or      ax, ax
        jne     br_03247
        mov     es, word ptr [bp+0eh]
        mov     word ptr es:[si+12h], 1

br_03247:
        mov     es, word ptr [bp+0eh]
        mov     ax, word ptr es:[si+12h]
        cmp     word ptr es:[si+10h], ax
        jge     br_0325C
        mov     ax, word ptr es:[si+10h]
        mov     word ptr es:[si+12h], ax

br_0325C:
        cmp     word ptr [bp+4], 0
        jne     br_0326E
        mov     es, word ptr [bp+0eh]
        mov     word ptr es:[si+14h], 7fffh
        jmp     br_03295
        db      90h

br_0326E:
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        mov     ax, 57dbh
        mul     word ptr [bp+4]
        push    dx
        push    ax
        callf   TEXT2_SEG:string_scan_status
        mov     es, word ptr [bp+0eh]
        mov     word ptr es:[si+14h], ax
        or      ax, ax
        jne     br_03295
        mov     es, word ptr [bp+0eh]
        mov     word ptr es:[si+14h], 1
br_03295:
        push    0
        push    0bh
        mov     es, word ptr [bp+0eh]
        mov     ax, word ptr es:[si+12h]
        cwd
        push    dx
        push    ax
        mov     ax, word ptr es:[si+10h]
        cwd
        add     ax, ax
        adc     dx, dx
        push    dx
        push    ax
        nop
        push    cs
        call    __aFldiv
        push    dx
        push    ax
        nop
        push    cs
        call    __aFldiv
        mov     es, word ptr [bp+0eh]
        mov     word ptr es:[si+36h], ax
        push    0
        push    0bh
        mov     ax, word ptr es:[si+14h]
        cwd
        push    dx
        push    ax
        mov     ax, word ptr es:[si+10h]
        cwd
        add     ax, ax
        adc     dx, dx
        push    dx
        push    ax
        nop
        push    cs
        call    __aFldiv
        push    dx
        push    ax
        nop
        push    cs
        call    __aFldiv
        mov     es, word ptr [bp+0eh]
        mov     word ptr es:[si+38h], ax
        cmp     byte ptr es:[si+4], 0
        jne     br_03367
        mov     es, word ptr [bp+0eh]
        mov     ax, word ptr es:[si+38h]
        sub     dx, dx
        cmp     dx, word ptr es:[si+34h]
        jb      br_0332C
        ja      br_03308
        cmp     ax, word ptr es:[si+32h]
        jbe     br_0332C
br_03308:
        mov     ax, word ptr es:[si+32h]
        mov     word ptr es:[si+38h], ax
        mov     word ptr es:[si+36h], dx
        mov     ax, word ptr es:[si+10h]
        mov     word ptr es:[si+12h], ax
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        mov     ax, 57dbh
        mul     word ptr es:[si+38h]
        jmp     br_03359
        db      90h
br_0332C:
        mov     ax, word ptr es:[si+36h]
        add     ax, word ptr es:[si+38h]
        cmp     dx, word ptr es:[si+34h]
        jb      br_03367
        ja      br_03342
        cmp     ax, word ptr es:[si+32h]
        jbe     br_03367
br_03342:
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        mov     ax, word ptr es:[si+32h]
        sub     ax, word ptr es:[si+38h]
        mov     word ptr es:[si+36h], ax
        mov     cx, 57dbh
        mul     cx

br_03359:
        push    dx
        push    ax
        callf   TEXT2_SEG:string_scan_status
        mov     es, word ptr [bp+0eh]
        mov     word ptr es:[si+14h], ax

br_03367:
        mov     es, word ptr [bp+0eh]
        neg     word ptr es:[si+14h]
        pop     si
        pop     di
        leave
        ret     0ch
midi_parse_channel:
        enter   4, 0
        push    di
        push    si
        mov     di, word ptr [bp+4]
        mov     es, word ptr [bp+6]
        mov     al, byte ptr es:[di+3]
        and     ax, 80h
        mov     word ptr [bp-2], ax
        mov     cx, 64h
        mov     dx, ax
        mov     al, 7fh
        imul    byte ptr es:[di+2]
        mov     bx, dx
        cwd
        idiv    cx
        mov     si, ax
        or      bx, bx
        je      br_033B4
        les     bx, [bp+8]
        mov     al, byte ptr es:[bx]
        cbw
        imul    si
        cwd
        and     dx, 7fh
        add     ax, dx
        sar     ax, 7
        mov     si, ax
br_033B4:
        mov     al, byte ptr [MIDI_VOLUME_VAL]
        cbw
        imul    si
        mov     cx, 7fh
        cwd
        idiv    cx
        les     bx, [bp+0ch]
        mov     byte ptr es:[bx+0ah], al
        mov     es, word ptr [bp+6]
        mov     al, byte ptr es:[di+3]
        and     al, 0fh
        les     bx, [bp+0ch]
        mov     byte ptr es:[bx+9], al
        les     bx, [bp+8]
        mov     al, byte ptr es:[bx]
        imul    byte ptr [MIDI_VOLUME_VAL]
        cwd
        idiv    cx
        mov     si, ax
        mov     al, byte ptr es:[bx+1]
        cbw
        mov     word ptr [bp-4], ax
        mov     bx, ax
        add     bx, ax
        mov     ax, word ptr [bx+TBL_0AA4]
        mov     bx, si
        mul     bx
        mov     al, ah
        les     bx, [bp+0ch]
        mov     byte ptr es:[bx+7], ah
        mov     bx, P_0B6C
        mov     ax, word ptr [bp-4]
        add     ax, ax
        sub     bx, ax
        mov     ax, word ptr [bx]
        mul     si
        les     bx, [bp+0ch]
        mov     byte ptr es:[bx+8], ah
        mov     es, word ptr [bp+6]
        mov     al, byte ptr es:[di+4]
        cbw
        imul    ax, ax, 7fh
        mov     dx, 64h
        mov     bx, dx
        cwd
        idiv    bx
        mov     si, ax
        cmp     word ptr [bp-2], 0
        je      br_03446
        les     bx, [bp+8]
        mov     al, byte ptr es:[bx]
        cbw
        imul    si
        cwd
        and     dx, cx
        add     ax, dx
        sar     ax, 7
        mov     si, ax
br_03446:
        mov     al, byte ptr [MIDI_VOLUME_VAL]
        cbw
        imul    si
        cwd
        idiv    cx
        les     bx, [bp+0ch]
        mov     byte ptr es:[bx+0ch], al
        mov     es, word ptr [bp+6]
        mov     al, byte ptr es:[di+5]
        les     bx, [bp+0ch]
        mov     byte ptr es:[bx+0bh], al
        pop     si
        pop     di
        leave
        ret     0ch
mpc_query_status:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     si, word ptr [bp+8]
        xor     ax, ax
        mov     cx, 13h
        mov     di, WIN_FIELD_CHANGE_FN
        push    ds
        pop     es
        rep stosw
        mov     al, byte ptr [bp+0ch]
        mov     byte ptr [WIN_FIELD_DIGITS], al
        mov     al, byte ptr [bp+10h]
        mov     byte ptr [EDIT_CURSOR_X], al
        mov     byte ptr [WIN_FIELD_X], al
        mov     cl, byte ptr [bp+0eh]
        mov     byte ptr [EDIT_CURSOR_Y], cl
        mov     byte ptr [EDIT_FIELD_Y], cl
        mov     byte ptr [WIN_FIELD_BOX_W], 6
        mov     byte ptr [EDIT_CURSOR_H], 8
        mov     byte ptr [WIN_FIELD_BOX_R], al
        mov     al, cl
        add     al, byte ptr [EDIT_CURSOR_H]
        mov     byte ptr [WIN_FIELD_BOX_B], al
        mov     ax, word ptr [bp+0ah]
        or      ax, si
        jne     br_034C4
        mov     word ptr [WIN_FIELD_DRAW_FN], field_draw_default
        mov     word ptr [WIN_FIELD_DRAW_FN_SEG], TEXT2_SEG
        jmp     br_034CE
        db      90h

br_034C4:
        mov     ax, word ptr [bp+0ah]
        mov     word ptr [WIN_FIELD_DRAW_FN], si
        mov     word ptr [WIN_FIELD_DRAW_FN_SEG], ax

br_034CE:
        mov     ax, word ptr [bp+6]
        or      ax, word ptr [bp+4]
        jne     L_034E8
        mov     word ptr [WIN_FIELD_CHANGE_FN], win_key_nop_stub
        mov     word ptr [WIN_FIELD_CHANGE_FN_SEG], TEXT1_SEG
        pop     si
        pop     di
        leave
        ret     0eh

L_034E8:
        mov     ax, word ptr [bp+4]
        mov     dx, word ptr [bp+6]
        mov     word ptr [WIN_FIELD_CHANGE_FN], ax
        mov     word ptr [WIN_FIELD_CHANGE_FN_SEG], dx
        pop     si
        pop     di
        leave
        ret     0eh
        db      00h

field_register:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp+10h]
        push    ax
        mov     cl, byte ptr [bp+0eh]
        push    cx
        mov     dl, byte ptr [bp+12h]
        push    dx
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        call    mpc_query_status
        mov     ax, word ptr [bp+18h]
        mov     dx, word ptr [bp+1ah]
        mov     word ptr [NUM_ENTRY_VALUE], ax
        mov     word ptr [NUM_ENTRY_VALUE_HI], dx
        mov     word ptr [NUM_ENTRY_MIN], ax
        mov     word ptr [NUM_ENTRY_MIN_HI], dx
        mov     ax, word ptr [bp+14h]
        mov     dx, word ptr [bp+16h]
        mov     word ptr [NUM_ENTRY_MAX], ax
        mov     word ptr [NUM_ENTRY_MAX_HI], dx
        mov     al, byte ptr [bp+12h]
        mov     cl, al
        add     al, al
        add     al, cl
        add     al, al
        mov     byte ptr [WIN_FIELD_BOX_W], al
        add     al, byte ptr [bp+10h]
        sub     al, 6
        mov     byte ptr [WIN_FIELD_BOX_R], al
        mov     al, byte ptr [bp+0eh]
        add     al, 8
        mov     byte ptr [WIN_FIELD_BOX_B], al
        cmp     word ptr [NUM_ENTRY_MIN_HI], 0
        jge     X_0356A
        add     byte ptr [WIN_FIELD_BOX_W], 6
        add     byte ptr [WIN_FIELD_BOX_R], 6

X_0356A:
        mov     byte ptr [WIN_FIELD_MODE], 4
        mov     ax, word ptr [bp+1ch]
        if      FW_VERSION = 172
T1_L_03573                      equ     $+1
        endif
        mov     dx, word ptr [bp+1eh]
        mov     word ptr [WIN_FIELD_VAR], ax
        mov     word ptr [WIN_FIELD_VAR+2], dx
        push    ds
        push    TBL_WINKEYS_00CBA
        nop
        push    cs
        call    win_keys_merge
        cmp     byte ptr [bp+12h], 1
        jne     br_03590
        callf   TEXT2_SEG:far_02DC8

br_03590:
        leave
        retf    1ah

; calls mpc_query_status, sets WIN_FIELD_VAR; installs
; shared handlers, then caller's; latches redraw far ptr,
; exits.
far_call_wrapper_1:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp+8]
        push    ax
        mov     al, byte ptr [bp+6]
        push    ax
        push    10h
        push    TEXT2_SEG
        push    X_03432
        push    0
        push    0
        call    mpc_query_status
        push    10h
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        mov     word ptr [WIN_FIELD_VAR], ax
        mov     word ptr [WIN_FIELD_VAR+2], dx
        push    dx
        push    ax
        push    ds
        push    BUF_NAME_EDIT
        nop
        push    cs
        call    __fstrncpy
        add     sp, 0ah
        xor     al, al
        mov     byte ptr [B_8CDA], al
        mov     byte ptr [NAME_EDIT_CASE], al
        mov     byte ptr [NAME_EDIT_LAST_PAD], 0ffh
        mov     word ptr [NAME_EDIT_CHANGE_FN], win_key_nop_stub
        if      FW_VERSION = 172
midi_loop_stub                  equ     $+2
        endif
        mov     word ptr [NAME_EDIT_CHANGE_FN+2], TEXT1_SEG
        push    ds
        push    P_0CE2
        nop
        push    cs
        call    win_keys_merge
        leave
        retf    8
        db      00h

far_035F2:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp+0ch]
        push    ax
        mov     al, byte ptr [bp+0ah]
        push    ax
        push    1
        push    0
        push    0
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        call    mpc_query_status
        mov     ax, word ptr [bp+10h]
        mov     dx, word ptr [bp+12h]
        mov     word ptr [WIN_FIELD_VAR], ax
        mov     word ptr [WIN_FIELD_VAR+2], dx
        mov     al, byte ptr [bp+0eh]
        mov     byte ptr [B_8CAB], al
        mov     byte ptr [WIN_FIELD_BOX_W], 60h
        callf   TEXT2_SEG:win_keys_merge_disable
        push    ds
        push    TBL_WINKEYS_00D64
        nop
        push    cs
        call    win_keys_merge
        leave
        retf    0eh

mixer_arm_field:
        mov     al, byte ptr [MIXSRC_CURSOR]
        cbw
        or      ax, ax
        je      br_03682
        dec     ax
        je      br_0364E
        dec     ax
        je      br_0365A
        dec     ax
        je      br_03672
        mov     byte ptr [MIXSRC_CURSOR], 0
        jmp     br_03682

br_0364E:
        push    ds
        push    MIX_INDIV_SOURCE
        push    1
        push    4bh
        push    20h
        jmp     L_0368C

br_0365A:
        push    15h
        push    TEXT2_SEG
        push    L_03C56
        callf   TEXT2_SEG:install_handler
        push    0b7h
        push    0eh
        callf   TEXT2_SEG:read_io_chain
        ret

br_03672:
        push    ds
        push    RECORD_MIX_CHANGES
        push    1
        push    0b1h
        push    27h
        push    4
        jmp     X_0368E
        db      90h

br_03682:
        push    ds
        push    MIX_STEREO_SOURCE
        push    1
        push    4bh
        push    16h

L_0368C:
        push    8

X_0368E:
        push    0
        push    0
        callf   TEXT2_SEG:voice_trigger_full
        ret

L_03698:
        push    ds
        mov     cx, DATA_SEG
; advances sequencer mode counter, broadcasts change;
; channel_validate, then ui_screen_enter with handler set
; from channel record +1Ch.
midi_seq_mode_advance:
        mov     ds, cx
        cmp     byte ptr [MIXSRC_CURSOR], 0
        jle     X_036A9
        dec     byte ptr [MIXSRC_CURSOR]

X_036A9:
        call    mixer_arm_field
        pop     ds
        retf

; MIXER's fields are two columns of two: one step down a column, two across.
X_036AE:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [MIXSRC_CURSOR], 3
        jge     X_036BF
        inc     byte ptr [MIXSRC_CURSOR]

X_036BF:
        call    mixer_arm_field
        pop     ds
        retf

X_036C4:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [MIXSRC_CURSOR], 1
        jle     X_036D6
        sub     byte ptr [MIXSRC_CURSOR], 2

X_036D6:
        call    mixer_arm_field
        pop     ds
        retf
        db      00h

X_036DC:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [MIXSRC_CURSOR], 2
        jge     X_036EE
        add     byte ptr [MIXSRC_CURSOR], 2

X_036EE:
        call    mixer_arm_field
        pop     ds
        retf
        db      00h

mixer_setup:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        sub     ax, ax
        mov     word ptr [FP_POLL_HOOK_SEG], ax
        mov     word ptr [FP_POLL_HOOK], ax
        mov     byte ptr [PAD_INPUT_MODE], 2
        push    cx
        push    TBL_WINKEYS_01264
        nop
        push    cs
        call    win_keys_merge
        call    mixer_arm_field
        pop     ds
        retf
        db      90h

X_03716:
        push    ds
        push    TBL_WINKEYS_01436
        nop
        push    cs
        call    win_keys_merge
        call    fn_03724
        retf
        db      00h

fn_03724:
        push    si
        mov     ax, word ptr [FXEDIT_CURSOR]
        or      ax, ax
        je      X_0378E
        dec     ax
        je      br_03740
        dec     ax
        je      br_03748
        dec     ax
        je      br_03750
        dec     ax
        je      L_03756
        mov     word ptr [FXEDIT_CURSOR], 0
        jmp     X_0378E

br_03740:
        callf   TEXT2_SEG:X_04428
        pop     si
        ret
        db      90h

br_03748:
        callf   TEXT2_SEG:X_0455A
        pop     si
        ret
        db      90h

br_03750:
        mov     si, 7
        jmp     L_03759
        db      90h

L_03756:
        mov     si, 8

L_03759:
        push    ds
        push    G_EDIT_FIELD_VAL
        push    0
        push    0
        push    1
        add     si, si
        mov     al, byte ptr [si+TBL_1360]
        push    ax

L_0376A:
        mov     al, byte ptr [si+TBL_1361]
        push    ax
        push    0
        push    0
        push    0
        push    0
        callf   TEXT2_SEG:status_read_6A_3
        callf   TEXT2_SEG:win_keys_merge_disable
        mov     byte ptr [WIN_FIELD_BOX_W], 1fh
        mov     byte ptr [EDIT_CURSOR_H], 26h
        pop     si
        ret
        db      90h

X_0378E:
        callf   TEXT2_SEG:L_043EE
        pop     si
        ret
        db      00h

X_03796:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     word ptr [FXEDIT_CURSOR], 2
        jl      X_037B3
        jne     T1_L_037AA
        xor     ax, ax
        jmp     br_037AD
        db      90h

T1_L_037AA:
        mov     ax, 1

br_037AD:
        mov     word ptr [FXEDIT_CURSOR], ax
        call    fn_03724

X_037B3:
        pop     ds
        retf
        db      00h

X_037B6:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     word ptr [FXEDIT_CURSOR], 1
        jg      X_037D0
        sbb     ax, ax
        and     al, 0feh
        add     ax, 4
        mov     word ptr [FXEDIT_CURSOR], ax
        call    fn_03724

X_037D0:
        pop     ds
        retf

X_037D2:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     word ptr [FXEDIT_CURSOR], 0
        jle     X_037E6
        dec     word ptr [FXEDIT_CURSOR]
        call    fn_03724

X_037E6:
        pop     ds
        retf

X_037E8:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     word ptr [FXEDIT_CURSOR], 4
        jge     br_037FC
        inc     word ptr [FXEDIT_CURSOR]
        call    fn_03724

br_037FC:
        pop     ds
        retf

; the key table's PAINT handler is TBL_14B8's, by the channel's effect type.
X_037FE:
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        callf   TEXT2_SEG:channel_validate
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+FXS_FIELD_46]
        cbw
        mov     bx, ax
        shl     bx, 2
        mov     ax, word ptr [bx+TBL_14B8]
        mov     dx, word ptr [bx+TBL_14B8+2]
        mov     word ptr [P_148A+1], ax
        mov     word ptr [P_148A+3], dx
        push    ds
        push    P_148A
        nop
        push    cs
        call    win_keys_merge
        call    fn_03836
        retf
        db      00h

fn_03836:
        mov     ax, word ptr [FXEDIT_CURSOR]
        or      ax, ax
        je      X_03890
        dec     ax
        je      X_03852
        dec     ax
        jl      br_0384A
        jo      br_0384A
        sub     ax, 5
        jle     br_03858

br_0384A:
        mov     word ptr [FXEDIT_CURSOR], 0
        jmp     X_03890

X_03852:
        callf   TEXT2_SEG:X_04428
        ret

br_03858:
        push    ds
        push    G_EDIT_FIELD_VAL
        push    0
        push    0
        push    1
        mov     bx, word ptr [FXEDIT_CURSOR]
        inc     bx
        add     bx, bx
        mov     al, byte ptr [bx+TBL_1360]
        push    ax
        mov     al, byte ptr [bx+TBL_1361]
        push    ax
        push    0
        push    0
        push    0
        push    0
        callf   TEXT2_SEG:status_read_6A_3
        callf   TEXT2_SEG:win_keys_merge_disable
        mov     byte ptr [WIN_FIELD_BOX_W], 1fh
        mov     byte ptr [EDIT_CURSOR_H], 26h
        ret

X_03890:
        callf   TEXT2_SEG:L_043EE
        ret

X_03896:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     word ptr [FXEDIT_CURSOR], 2
        jl      X_038B7
        cmp     word ptr [FXEDIT_CURSOR], 5
        jge     L_038AE
        xor     ax, ax
        jmp     br_038B1

L_038AE:
        mov     ax, 1

br_038B1:
        mov     word ptr [FXEDIT_CURSOR], ax
        call    fn_03836

X_038B7:
        pop     ds
        retf
        db      00h

X_038BA:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     word ptr [FXEDIT_CURSOR], 1
        jg      X_038D4
        sbb     ax, ax
        and     al, 0fbh
        add     ax, 7
        mov     word ptr [FXEDIT_CURSOR], ax
        call    fn_03836

X_038D4:
        pop     ds
        retf

X_038D6:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     word ptr [FXEDIT_CURSOR], 0
        jle     X_038EA
        dec     word ptr [FXEDIT_CURSOR]
        call    fn_03836

X_038EA:
        pop     ds
        retf

X_038EC:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     word ptr [FXEDIT_CURSOR], 7
        jge     br_03900
        inc     word ptr [FXEDIT_CURSOR]
        call    fn_03836

br_03900:
        pop     ds
        retf

fn_03902:
        test    byte ptr [B_4FE2], 80h
        je      br_03916
        test    byte ptr [B_4FE2], 1
        je      br_03916
        mov     cx, P_158A
        jmp     br_03919
        db      90h

br_03916:
        mov     cx, STR_SOLO
br_03919:
        push    2
        push    1
        push    ds
        push    cx
        callf   TEXT2_SEG:string_copy_scan
        test    byte ptr [B_4FE2], 80h
        je      br_03938
        test    byte ptr [B_4FE2], 2
        je      br_03938
; 0x038fa mid-instruction (no entry point); disp_list_run
; read via L_03902, renders 8 display fields.

        mov     cx, P_1590
        jmp     br_0393B
        db      90h

br_03938:
        mov     cx, STR_BYPASS

br_0393B:
        push    3
        push    1
        push    ds
        push    cx
        callf   TEXT2_SEG:string_copy_scan
        push    4
        push    2
        push    ds
        push    STR_SK_CLOSE_MIXER
        callf   TEXT2_SEG:string_copy_scan
        push    5
        push    1
        push    ds
        push    STR_SK_MIXER
        callf   TEXT2_SEG:string_copy_scan
        ret
        db      00h
; installs the shared handler set, then the caller's set, and latches the
; redraw far pointer and the exit pair.

ui_screen_enter:
        push    bp
        mov     bp, sp
        push    ds
        push    P_15A6
        nop
        push    cs
        call    win_keys_merge
        push    word ptr [bp+0eh]
        push    word ptr [bp+0ch]
        nop
        push    cs
        call    win_keys_merge
        mov     ax, word ptr [bp+4]
        mov     dx, word ptr [bp+6]
        mov     word ptr [FP_UI_RETURN_SCREEN], ax
        mov     word ptr [FP_UI_RETURN_SCREEN_SEG], dx
        or      dx, ax
        je      L_03997
        push    6
        push    TEXT2_SEG
        push    X_04CC2
        callf   TEXT2_SEG:install_handler

L_03997:
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        mov     word ptr [FP_POLL_HOOK], ax

L_039A0:
        mov     word ptr [FP_POLL_HOOK_SEG], dx
        leave
        ret     0ch

X_039A8:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    TBL_WINKEYS_015CA
        push    TEXT2_SEG
        push    L_04CEE
        push    word TEXT1_SEG
        push    X_039A8
        call    ui_screen_enter
        call    fx_dist_arm_field
        pop     ds
        retf

L_039C6:
        push    di

L_039C7:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_FX_DISTORTION
        nop
        push    cs
        call    disp_list_run
        call    fn_03902
        push    4fh
        push    19h
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        callf   TEXT2_SEG:channel_validate
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+3]
        sub     ah, ah
        push    0
        push    ax
        push    2
        mov     si, bx
        mov     di, dx
        callf   TEXT2_SEG:draw_unsigned_value
        push    4fh
        push    24h
        mov     es, di
        mov     al, byte ptr es:[si+4]
        sub     ah, ah
        push    0
        push    ax
        push    2
        callf   TEXT2_SEG:draw_unsigned_value
        push    0afh
        push    19h
        mov     es, di
        push    0
        push    word ptr es:[si]
        push    4
        callf   TEXT2_SEG:draw_unsigned_value
        push    0afh
        push    24h
        mov     es, di
        mov     al, byte ptr es:[si+2]
        sub     ah, ah
        push    0
        push    ax
        push    2
        callf   TEXT2_SEG:draw_unsigned_value
        callf   TEXT2_SEG:field_redraw
        pop     ds
        pop     si
        pop     di
        retf

fx_dist_arm_field:
        push    si
        cmp     byte ptr [G_FLAG_1589], 0
        je      br_03A57
        jmp     X_03AE8

br_03A57:
        inc     byte ptr [G_FLAG_1589]
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        callf   TEXT2_SEG:channel_validate
        add     sp, 2
        mov     si, ax
        mov     al, byte ptr [FX_DIST_CURSOR]
        sub     ah, ah
        or      ax, ax
        je      br_03AC6
        dec     ax
        je      br_03A84
        dec     ax
        je      L_03A94
        dec     ax
        je      br_03AB4
        mov     byte ptr [FX_DIST_CURSOR], 0
        jmp     br_03AC6
        db      90h
br_03A84:
        lea     ax, [si+4]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    4fh
        jmp     br_03AC2
        db      90h

L_03A94:
        push    dx
        push    si
        push    0
        push    1388h
        push    4
        push    0afh

L_03AA0:
        push    19h
        push    0
        push    0
        push    TEXT2_SEG
        push    fx_redraw
        callf   TEXT2_SEG:status_read_6A
        jmp     L_03AE4
        db      90h

br_03AB4:
        lea     ax, [si+2]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    0afh

br_03AC2:
        push    24h
        jmp     br_03AD5

br_03AC6:
        lea     ax, [si+3]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    4fh
        push    19h
br_03AD5:
        push    0
        push    0
        push    TEXT2_SEG
        push    fx_redraw
        callf   TEXT2_SEG:status_read_6A_3

L_03AE4:
        dec     byte ptr [G_FLAG_1589]

X_03AE8:
        pop     si
        ret

; FX DISTORTION's fields are a 2x2 grid: bit 0 the column, bit 1 the row.
X_03AEA:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        test    byte ptr [FX_DIST_CURSOR], 1
        je      X_03AFE
        dec     byte ptr [FX_DIST_CURSOR]
        call    fx_dist_arm_field

X_03AFE:
        pop     ds
        retf

X_03B00:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        test    byte ptr [FX_DIST_CURSOR], 1
        jne     X_03B14
        inc     byte ptr [FX_DIST_CURSOR]
        call    fx_dist_arm_field

X_03B14:
        pop     ds
        retf

X_03B16:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [FX_DIST_CURSOR], 2
        jb      X_03B2B
        sub     byte ptr [FX_DIST_CURSOR], 2
        call    fx_dist_arm_field

X_03B2B:
        pop     ds
        retf
        db      00h

X_03B2E:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [FX_DIST_CURSOR], 1
        ja      X_03B43
        add     byte ptr [FX_DIST_CURSOR], 2
        call    fx_dist_arm_field

X_03B43:
        pop     ds
        retf
        db      00h

; enters the 4-BAND FILTER screen.
X_03B46:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    TBL_WINKEYS_4BAND_FILTER
        push    TEXT2_SEG
        push    L_04D1A

        push    word TEXT1_SEG
        push    X_03B46
        call    ui_screen_enter
        call    midi_note_handler
        pop     ds
        retf

filter4_paint:
        push    di

L_03B65:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_4BAND_FILTER
        nop
        push    cs
        call    disp_list_run
        call    fn_03902
        push    31h
        push    0bh
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        callf   TEXT2_SEG:channel_validate
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+FXS_FIELD_0E]
        push    ax
        mov     si, bx
        mov     di, dx
        callf   TEXT2_SEG:cmd_dispatch_caller2
        push    31h
        push    15h
        mov     es, di
        mov     al, byte ptr es:[si+0bh]
        push    ax
        callf   TEXT2_SEG:cmd_dispatch_caller2
        push    31h
        push    1fh
        mov     es, di
        mov     al, byte ptr es:[si+8]
        push    ax
        callf   TEXT2_SEG:cmd_dispatch_caller2
        push    31h
        push    29h
        mov     es, di
        mov     al, byte ptr es:[si+6]
        push    ax
        callf   TEXT2_SEG:cmd_dispatch_caller2
        push    55h
        push    0bh
        mov     es, di
        mov     al, byte ptr es:[si+0fh]
        push    ax
        callf   TEXT2_SEG:cmd_dispatch_handler_2
        push    55h
        push    15h
        mov     es, di
        mov     al, byte ptr es:[si+0ch]
        push    ax
        callf   TEXT2_SEG:cmd_dispatch_handler_2
        push    55h
        push    1fh
        mov     es, di
        mov     al, byte ptr es:[si+9]
        push    ax
        callf   TEXT2_SEG:cmd_dispatch_handler_2
        push    55h
        push    29h
        mov     es, di
        mov     al, byte ptr es:[si+7]
        push    ax
        callf   TEXT2_SEG:cmd_dispatch_handler_2
        push    7fh
        push    15h
        mov     es, di
        mov     al, byte ptr es:[si+0dh]
        sub     ah, ah
        push    0
        push    ax
        push    2
        callf   TEXT2_SEG:draw_unsigned_value
        push    7fh
        push    1fh
        mov     es, di
        mov     al, byte ptr es:[si+0ah]
        sub     ah, ah
        push    0
        push    ax
        push    2
        callf   TEXT2_SEG:draw_unsigned_value
        push    9dh
        push    15h
        mov     es, di
        mov     al, byte ptr es:[si+12h]
        sub     ah, ah
        push    ax
        push    2
        callf   TEXT2_SEG:ratio_calc_divide
        push    9dh
        push    1fh
        mov     es, di
        mov     al, byte ptr es:[si+10h]
        sub     ah, ah
        push    ax
        push    2
        callf   TEXT2_SEG:ratio_calc_divide
        push    0d3h
        push    15h
        mov     es, di
        mov     al, byte ptr es:[si+13h]
        sub     ah, ah
        push    0
        push    ax
        push    2
        callf   TEXT2_SEG:draw_unsigned_value
        push    0d3h
        push    1fh
        mov     es, di
        mov     al, byte ptr es:[si+11h]
        sub     ah, ah
        push    0
        push    ax
        push    2
        callf   TEXT2_SEG:draw_unsigned_value
        callf   TEXT2_SEG:field_redraw
        pop     ds
        pop     si
        pop     di
        retf

midi_note_handler:
        enter   4, 0
        push    si
        cmp     byte ptr [G_FLAG_1589], 0
        je      br_03CA7
        jmp     L_03E2E
br_03CA7:
        inc     byte ptr [G_FLAG_1589]
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        callf   TEXT2_SEG:channel_validate
        add     sp, 2
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     al, byte ptr [FILTER4_CURSOR]
        sub     ah, ah
        cmp     ax, 0dh

        ja      br_03CEC
        add     ax, ax
        xchg    bx, ax
        jmp     word ptr cs:[bx+P_3CD0]
        db      90h

P_3CD0:
        dw      X_03E00, X_03CF4, X_03D16, X_03D28
        dw      X_03D3A, X_03D5C, X_03D74, X_03D84
        dw      L_03D96, X_03DA8, X_03DBA, L_03DCC
        dw      X_03DDC, X_03DEE

br_03CEC:
        mov     byte ptr [FILTER4_CURSOR], 0
        jmp     X_03E00

X_03CF4:
        lea     ax, [si+0fh]
        push    dx
        push    ax
        push    -25h
        push    0ch
        push    2
        push    55h
        push    0bh

X_03D03:
        push    0
        push    0
        push    TEXT2_SEG
        push    fx_redraw
        callf   TEXT2_SEG:field_register_s8
        jmp     NEAR L_03E2A
        db      90h

X_03D16:
        lea     ax, [si+0bh]
        push    dx
        push    ax
        push    0ch
        push    38h
        push    2
        push    31h
        push    15h
        jmp     NEAR X_03E11

X_03D28:
        lea     ax, [si+0ch]
        push    dx
        push    ax
        push    -25h
        push    0ch
        push    2
        push    55h
        push    15h
        jmp     SHORT X_03D03
        db      90h

X_03D3A:
        lea     ax, [si+0dh]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    7fh

L_03D47:
        push    15h

L_03D49:
        push    0
        push    0

L_03D4D:
        push    TEXT2_SEG
        push    fx_redraw
        callf   TEXT2_SEG:status_read_6A_3
        jmp     NEAR L_03E2A
        db      90h

X_03D5C:
        lea     ax, [si+12h]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    9dh
        push    15h

L_03D6C:
        push    TEXT2_SEG
        push    L_03808
        jmp     SHORT L_03D4D

X_03D74:
        lea     ax, [si+13h]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    0d3h
        jmp     SHORT L_03D47

X_03D84:
        lea     ax, [si+8]
        push    dx
        push    ax
        push    0ch
        push    38h
        push    2
        push    31h
        push    1fh
        jmp     SHORT X_03E11
        db      90h

L_03D96:
        lea     ax, [si+9]
        push    dx
        push    ax
        push    -25h
        push    0ch
        push    2
        push    55h
        push    1fh
        jmp     NEAR X_03D03

X_03DA8:
        lea     ax, [si+0ah]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    7fh

L_03DB5:
        push    1fh
        jmp     SHORT L_03D49
        db      90h

X_03DBA:
        lea     ax, [si+10h]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    9dh
        push    1fh
        jmp     SHORT L_03D6C

L_03DCC:
        lea     ax, [si+11h]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    0d3h
        jmp     SHORT L_03DB5

X_03DDC:
        lea     ax, [si+6]
        push    dx
        push    ax
        push    4
        push    22h
        push    2
        push    31h
        push    29h
        jmp     SHORT X_03E11
        db      90h

X_03DEE:
        lea     ax, [si+7]
        push    dx
        push    ax
        push    -25h
        push    0ch
        push    2
        push    55h
        push    29h
        jmp     NEAR X_03D03

X_03E00:
        lea     ax, [si+FXS_FIELD_0E]
        push    word ptr [bp-2]
        push    ax
        push    22h
        push    40h
        push    2
        push    31h
        push    0bh
X_03E11:
        push    0
        push    0
        push    TEXT2_SEG
        push    fx_redraw
        callf   TEXT2_SEG:status_read_6A_3
        callf   TEXT2_SEG:win_keys_merge_disable
        mov     byte ptr [WIN_FIELD_BOX_W], 12h

L_03E2A:
        dec     byte ptr [G_FLAG_1589]

L_03E2E:
        pop     si
        leave
        ret
        db      00h

filter4_up:
L_03EB8:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [FILTER4_CURSOR]
        sub     ah, ah
        or      ax, ax
        jl      br_03E53
        jo      br_03E53
        dec     ax
        jle     L_03E6A
        dec     ax
        jl      br_03E53
        dec     ax
        jle     br_03E5A
        dec     ax
        jl      br_03E53
        dec     ax
        dec     ax
        jle     T1_L_03E62

br_03E53:
        sub     byte ptr [FILTER4_CURSOR], 5
        jmp     br_03E67

br_03E5A:
        sub     byte ptr [FILTER4_CURSOR], 2
        jmp     br_03E67
        db      90h

T1_L_03E62:
        mov     byte ptr [FILTER4_CURSOR], 1

br_03E67:
        call    midi_note_handler

L_03E6A:
        pop     ds
        retf

filter4_down:
L_03EF2:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [FILTER4_CURSOR]
        sub     ah, ah
        or      ax, ax
        jl      br_03E8F
        jo      br_03E8F
        dec     ax
        jle     br_03E96

L_03E80:
        sub     ax, 8
        jl      br_03E8F
        dec     ax
        dec     ax
        jle     L_03E9E
        dec     ax
        jl      br_03E8F
        dec     ax
        jle     X_03EA6

br_03E8F:
        add     byte ptr [FILTER4_CURSOR], 5
        jmp     br_03EA3

br_03E96:
        add     byte ptr [FILTER4_CURSOR], 2
        jmp     br_03EA3
        db      90h

L_03E9E:
        mov     byte ptr [FILTER4_CURSOR], 0dh

br_03EA3:
        call    midi_note_handler

X_03EA6:
        pop     ds
        retf

filter4_left:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [FILTER4_CURSOR]
        sub     ah, ah
        cmp     ax, 0ch
        je      X_03ECD
        ja      br_03EC6
        or      al, al
        je      X_03ECD
        sub     al, 2
        je      X_03ECD
        sub     al, 5
        je      X_03ECD

br_03EC6:
        dec     byte ptr [FILTER4_CURSOR]
        call    midi_note_handler

X_03ECD:
        pop     ds
        retf
        db      00h

filter4_right:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [FILTER4_CURSOR]
        sub     ah, ah
        cmp     ax, 0dh
        je      L_03EFC
        ja      br_03EEE
        dec     al
        je      br_03EF4
        sub     al, 5
        je      br_03F04
        sub     al, 5
        je      br_03F04

br_03EEE:
        inc     byte ptr [FILTER4_CURSOR]
        jmp     br_03F01

br_03EF4:
        mov     byte ptr [FILTER4_CURSOR], 4
        jmp     br_03F01
        db      90h

L_03EFC:
        mov     byte ptr [FILTER4_CURSOR], 9

br_03F01:
        call    midi_note_handler

br_03F04:
        pop     ds
        retf

ctrl_change_table_dispatch:
        push    bp
        mov     bp, sp
        push    ds
        push    DL_FX_MODULATION
        nop
        push    cs
        call    disp_list_run
        call    fn_03902
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    disp_list_run
        push    31h
        push    0bh
        mov     al, byte ptr [G_FX_EFFECT_SEL]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+FX_MOD_TYPE_LABELS+2]
        push    word ptr [bx+FX_MOD_TYPE_LABELS]
        callf   TEXT2_SEG:cmd_dispatch_1E
        leave
        retf    4

X_03F3E:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    TBL_WINKEYS_FX_CHORUS
        push    TEXT2_SEG
        push    fx_type_load_select
        push    word TEXT1_SEG
        push    X_03F3E
        call    ui_screen_enter
        call    fx_mod_arm_field
        pop     ds
        retf

fx_mod_arm_field:
        push    si
        cmp     byte ptr [G_FLAG_1589], 0
        je      br_03F67
        jmp     X_03FF9

br_03F67:
        inc     byte ptr [G_FLAG_1589]
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        callf   TEXT2_SEG:channel_validate
        add     sp, 2
        mov     si, ax
        mov     al, byte ptr [G_UI_MODE]
        sub     ah, ah
        or      ax, ax
        je      X_03FF0
        dec     ax
        je      br_03F94
        dec     ax
        je      br_03FB8
        dec     ax
        je      br_03FCE
        mov     byte ptr [G_UI_MODE], 0
        jmp     X_03FF0
        db      90h

br_03F94:
        lea     ax, [si+FXS_MOD_SPEED]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    0bbh
        push    15h
        push    TEXT2_SEG
        push    L_03808

loop_03FAA:
        push    TEXT2_SEG
        push    fx_redraw
        callf   TEXT2_SEG:status_read_6A_3
        jmp     br_03FF5
        db      90h

br_03FB8:
        lea     ax, [si+FXS_MOD_DEPTH]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    0bbh
        push    1fh
        push    0
        push    0
        jmp     loop_03FAA
br_03FCE:
        lea     ax, [si+FXS_MOD_FEEDBACK]
        push    dx
        push    ax
        push    -32h
        push    32h
        push    2
        push    0bbh
        push    29h
        push    0
        push    0
        push    TEXT2_SEG
        push    fx_redraw
        callf   TEXT2_SEG:field_register_s8
        jmp     br_03FF5
        db      90h

X_03FF0:
        callf   TEXT2_SEG:X_04E24

br_03FF5:
        dec     byte ptr [G_FLAG_1589]

X_03FF9:
        pop     si
        ret
        db      00h

fx_chorus_up:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_UI_MODE], 0
        je      X_04010
        dec     byte ptr [G_UI_MODE]
        call    fx_mod_arm_field

X_04010:
        pop     ds
        retf

fx_chorus_down:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_UI_MODE], 3
        jae     X_04026
        inc     byte ptr [G_UI_MODE]
        call    fx_mod_arm_field

X_04026:
        pop     ds
        retf

fx_chorus_left:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_UI_MODE], 0
        je      X_0403D
        mov     byte ptr [G_UI_MODE], 0
        call    fx_mod_arm_field

X_0403D:
        pop     ds
        retf
        db      00h

fx_chorus_right:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_UI_MODE], 0
        jne     X_04055
        mov     byte ptr [G_UI_MODE], 1
        call    fx_mod_arm_field

X_04055:
        pop     ds
        retf
        db      00h

; FX ROTARY: its keys, fx_type_load_select as the poll hook, itself to come
; back to.
X_04058:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_17DC
        push    TEXT2_SEG
        push    fx_type_load_select

        push    word TEXT1_SEG
        push    X_04058
        call    ui_screen_enter
        call    fx_rotary_arm_field
        pop     ds
        retf

fx_rotary_arm_field:
        push    si
        cmp     byte ptr [G_FLAG_1589], 0
        je      br_04081
        jmp     X_04131

br_04081:
        inc     byte ptr [G_FLAG_1589]
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        callf   TEXT2_SEG:channel_validate
        add     sp, 2
        mov     si, ax
        mov     al, byte ptr [G_UI_MODE]
        sub     ah, ah
        cmp     ax, 5
        ja      br_040B2
        add     ax, ax
        xchg    bx, ax
        jmp     word ptr cs:[bx+P_40A6]

P_40A6:
        dw      X_04128, X_040BA, X_040DC, X_040F2
        dw      X_04104, X_04116

br_040B2:
        mov     byte ptr [G_UI_MODE], 0
        jmp     X_04128
        db      90h

X_040BA:
        lea     ax, [si+1bh]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    43h
        push    19h

L_040C9:
        push    TEXT2_SEG
        push    L_03808

L_040CF:
        push    TEXT2_SEG
        push    fx_redraw
        callf   TEXT2_SEG:status_read_6A_3
        jmp     SHORT L_0412D

X_040DC:
        lea     ax, [si+1eh]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    43h
        push    24h

L_040EB:
        push    0
        push    0
        jmp     SHORT L_040CF
        db      90h

X_040F2:
        lea     ax, [si+1fh]
        push    dx
        push    ax
        push    0
        push    7fh
        push    3
        push    0c7h
        push    15h
        jmp     SHORT L_040EB

X_04104:
        lea     ax, [si+1dh]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    0c7h
        push    1fh
        jmp     SHORT L_040C9

X_04116:
        lea     ax, [si+1ch]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    0c7h
        push    29h
        jmp     SHORT L_040C9

X_04128:
        callf   TEXT2_SEG:X_04E24

L_0412D:
        dec     byte ptr [G_FLAG_1589]

X_04131:
        pop     si
        ret
        db      00h

fx_rotary_up:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_UI_MODE]
        sub     ah, ah
        or      ax, ax
        je      X_04156
        sub     ax, 3
        je      L_0414E
        dec     byte ptr [G_UI_MODE]
        jmp     L_04153

L_0414E:
        mov     byte ptr [G_UI_MODE], 0

L_04153:
        call    fx_rotary_arm_field

X_04156:
        pop     ds
        retf

fx_rotary_down:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_UI_MODE]
        sub     ah, ah
        dec     ax
        dec     ax
        je      L_04173
        sub     ax, 3
        je      L_04173
        inc     byte ptr [G_UI_MODE]
        call    fx_rotary_arm_field

L_04173:
        pop     ds
        retf
        db      00h

fx_rotary_left:
L_041FC:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_UI_MODE]
        sub     ah, ah
        sub     ax, 3
        je      br_04190
        dec     ax
        jl      L_041A0
        jo      L_041A0
        dec     ax
        jle     L_04198
        pop     ds
        retf

br_04190:
        mov     byte ptr [G_UI_MODE], 1
        jmp     L_0419D
        db      90h

L_04198:
        mov     byte ptr [G_UI_MODE], 2

L_0419D:
        call    fx_rotary_arm_field

L_041A0:
        pop     ds
        retf

fx_rotary_right:
L_04228:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_UI_MODE]
        sub     ah, ah
        or      ax, ax
        je      br_041BC
        dec     ax
        jl      X_041CC
        jo      X_041CC
        dec     ax
        jle     L_041C4
        pop     ds
        retf
        db      90h

br_041BC:
        mov     byte ptr [G_UI_MODE], 3
        jmp     L_041C9
        db      90h

L_041C4:
        add     byte ptr [G_UI_MODE], 2

L_041C9:
        call    fx_rotary_arm_field

X_041CC:
        pop     ds
        retf

X_041CE:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    TBL_WINKEYS_0185C
        push    TEXT2_SEG
        push    fx_type_load_select
        push    word TEXT1_SEG
        push    X_041CE
        call    ui_screen_enter
        call    fx_autopan_arm_field
        pop     ds
        retf

fx_autopan_arm_field:
        push    si
        cmp     byte ptr [G_FLAG_1589], 0
        je      br_041F7
        jmp     X_042C1

br_041F7:
        inc     byte ptr [G_FLAG_1589]
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        callf   TEXT2_SEG:channel_validate
        add     sp, 2
        mov     si, ax
        mov     al, byte ptr [G_UI_MODE]
        sub     ah, ah
        cmp     ax, 6
        ja      br_0422A
        add     ax, ax
        xchg    bx, ax
        jmp     word ptr cs:[bx+P_421C]

P_421C:
        dw      X_042B8, X_04232, X_04254, X_0426A
        dw      X_0427C, X_0428C, X_0429C

br_0422A:
        mov     byte ptr [G_UI_MODE], 0
        jmp     X_042B8

X_04232:
        lea     ax, [si+20h]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    6dh
L_0423F:
        push    15h
        push    TEXT2_SEG
        push    L_03808

L_04247:
        push    TEXT2_SEG
        push    fx_redraw
        callf   TEXT2_SEG:status_read_6A_3
        jmp     SHORT L_042BD

X_04254:
        lea     ax, [si+21h]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    6dh

L_04261:
        push    1fh

L_04263:
        push    0
        push    0
        jmp     SHORT L_04247
        db      90h

X_0426A:
        lea     ax, [si+22h]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    6dh
        push    29h
        jmp     SHORT L_04263
        db      90h

X_0427C:
        lea     ax, [si+23h]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    0c1h
        jmp     SHORT L_0423F

X_0428C:
        lea     ax, [si+24h]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    0c1h
        jmp     SHORT L_04261

X_0429C:
        lea     ax, [si+25h]
        push    dx
        push    ax
        push    3
        push    0c1h
        push    29h
        push    5
        push    TEXT2_SEG
        push    fx_redraw
        callf   TEXT2_SEG:voice_trigger_full
        jmp     SHORT L_042BD
        db      90h

X_042B8:
        callf   TEXT2_SEG:X_04E24

L_042BD:
        dec     byte ptr [G_FLAG_1589]

X_042C1:
        pop     si
        ret
        db      00h

X_042C4:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_UI_MODE]
        sub     ah, ah
        or      ax, ax
        je      X_042E6
        sub     ax, 4
        je      L_042DE
        dec     byte ptr [G_UI_MODE]
        jmp     L_042E3

L_042DE:
        mov     byte ptr [G_UI_MODE], 0

L_042E3:
        call    fx_autopan_arm_field

X_042E6:
        pop     ds
        retf

X_042E8:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_UI_MODE]
        sub     ah, ah
        sub     ax, 3
        je      X_04304
        sub     ax, 3
        je      X_04304
        inc     byte ptr [G_UI_MODE]
        call    fx_autopan_arm_field

X_04304:
        pop     ds
        retf

X_04306:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_UI_MODE]
        sub     ah, ah
        sub     ax, 4
        jl      L_04324
        jo      L_04324
        dec     ax
        dec     ax
        jg      L_04324
        sub     byte ptr [G_UI_MODE], 3
        call    fx_autopan_arm_field

L_04324:
        pop     ds
        retf

L_04326:
L_043AC:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_UI_MODE]
        sub     ah, ah
        or      ax, ax
        je      br_04340
        dec     ax
        jl      X_04350
        jo      X_04350
        dec     ax
        dec     ax
        jle     L_04348
        pop     ds
        retf

br_04340:
        mov     byte ptr [G_UI_MODE], 4
        jmp     L_0434D
        db      90h

L_04348:
        add     byte ptr [G_UI_MODE], 3

L_0434D:
        call    fx_autopan_arm_field

X_04350:
        pop     ds
        retf

X_04352:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    TBL_WINKEYS_FX_PITCH_SHIFT
        push    TEXT2_SEG
        push    fx_type_load_select
        push    word TEXT1_SEG
        push    X_04352
        call    ui_screen_enter
        call    fx_pitch_arm_field
        pop     ds
        retf

fx_pitch_arm_field:
        push    si
        cmp     byte ptr [G_FLAG_1589], 0
        je      br_0437B
        jmp     X_04455

br_0437B:
        inc     byte ptr [G_FLAG_1589]
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        callf   TEXT2_SEG:channel_validate
        add     sp, 2
        mov     si, ax
        cmp     byte ptr [G_FX_EFFECT_SEL], 6
        je      br_043A1
        cmp     byte ptr [G_UI_MODE], 2
        jbe     br_043A1
        mov     byte ptr [G_UI_MODE], 0

br_043A1:
        mov     al, byte ptr [G_UI_MODE]
        sub     ah, ah
        cmp     ax, 6
        ja      br_043C2
        add     ax, ax
        xchg    bx, ax
        jmp     word ptr cs:[bx+P_43B4]
        db      90h

P_43B4:
        dw      L_0444C, X_043CA, L_043DC, X_043E6
        dw      X_04408, L_0441A_1, X_0443C

br_043C2:
        mov     byte ptr [G_UI_MODE], 0
        jmp     L_0444C

X_043CA:
        lea     ax, [si+26h]
        push    dx
        push    ax
        push    91h

L_043D2:
        push    15h
        callf   TEXT2_SEG:cmd_exec_multi
        jmp     SHORT L_04451
        db      90h

L_043DC:
        lea     ax, [si+28h]
        push    dx
        push    ax
        push    0bbh
        jmp     SHORT L_043D2

X_043E6:
        lea     ax, [si+2ah]
        push    dx
        push    ax
        push    0
        push    113h
        push    3
        push    97h

X_043F5:
        push    1fh
        push    0
        push    0
        push    TEXT2_SEG
        push    fx_redraw
        callf   TEXT2_SEG:status_read_6A
        jmp     SHORT L_04451

X_04408:
        lea     ax, [si+2ch]
        push    dx
        push    ax
        push    0
        push    113h
        push    3
        push    0c1h
        jmp     SHORT X_043F5
        db      90h

L_0441A_1:
        lea     ax, [si+2eh]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    9dh

L_04428_1:
        push    29h
        push    0
        push    0
        push    TEXT2_SEG
        push    fx_redraw
        callf   TEXT2_SEG:status_read_6A_3
        jmp     SHORT L_04451
        db      90h

X_0443C:
        lea     ax, [si+2fh]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    0c7h
        jmp     SHORT L_04428_1

L_0444C:
        callf   TEXT2_SEG:X_04E24

L_04451:
        dec     byte ptr [G_FLAG_1589]

X_04455:
        pop     si
        ret
        db      00h

fx_pitch_shift_up:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_UI_MODE]
        sub     ah, ah
        or      ax, ax
        je      X_0447A
        dec     ax
        je      L_04472
        sub     byte ptr [G_UI_MODE], 2
        jmp     L_04477
        db      90h

L_04472:
        mov     byte ptr [G_UI_MODE], 0

L_04477:
        call    fx_pitch_arm_field

X_0447A:
        pop     ds
        retf

fx_pitch_shift_down:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_UI_MODE], 0
        jne     T1_br_04490
        mov     byte ptr [G_UI_MODE], 1
        jmp     L_044A3

T1_br_04490:
        cmp     byte ptr [G_FX_EFFECT_SEL], 6
        jne     X_044A6
        cmp     byte ptr [G_UI_MODE], 5
        jae     X_044A6
        add     byte ptr [G_UI_MODE], 2

L_044A3:
        call    fx_pitch_arm_field

X_044A6:
        pop     ds
        retf

fx_pitch_shift_left:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_UI_MODE]
        sub     ah, ah
        or      ax, ax
        je      L_044D0
        dec     ax
        je      br_044C8
        dec     ax
        dec     ax
        je      br_044C8
        dec     ax
        dec     ax
        je      br_044C8
        dec     byte ptr [G_UI_MODE]
        jmp     L_044CD

br_044C8:
        mov     byte ptr [G_UI_MODE], 0

L_044CD:
        call    fx_pitch_arm_field

L_044D0:
        pop     ds
        retf

fx_pitch_shift_right:
L_04558:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_UI_MODE]
        sub     ah, ah
        dec     ax
        dec     ax
        je      br_044F0
        dec     ax
        dec     ax
        je      br_044F0
        dec     ax
        dec     ax
        je      br_044F0
        inc     byte ptr [G_UI_MODE]
        call    fx_pitch_arm_field

br_044F0:
        pop     ds
        retf

; channel_validate, ui_screen_enter with handlers 5, 15h
; (from channel record +1Ch); redraw edits channel bytes
; 0..63h/-32h..32h.
ui_screen_enter_chan:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        callf   TEXT2_SEG:channel_validate
        mov     sp, bp
        mov     es, dx
        mov     bx, ax
        cmp     byte ptr es:[bx+FXS_ECHO_TYPE], 3
        je      br_04526
        push    ds
        push    TBL_WINKEYS_01968
        push    TEXT2_SEG
        push    L_051EE
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        call    ui_screen_enter
        call    fx_echo_arm_field
        leave
        retf    4

br_04526:
        push    ds
        push    TBL_WINKEYS_01990
        push    TEXT2_SEG
        push    L_051EE
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        call    ui_screen_enter
        call    fx_echo_st_arm_field
        leave
        retf    4

midi_dispatch_table:
        push    bp
        mov     bp, sp
        push    ds
        push    DL_FX_DELAY_ECHO
        nop
        push    cs
        call    disp_list_run
        call    fn_03902
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    disp_list_run
        push    31h
        push    0bh
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        callf   TEXT2_SEG:channel_validate
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+FXS_ECHO_TYPE]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+FX_OUT_MODE_LABELS+2]
        push    word ptr [bx+FX_OUT_MODE_LABELS]
        callf   TEXT2_SEG:cmd_dispatch_1E
        leave
        retf    4

fx_echo_arm_field:
        push    si
        cmp     byte ptr [G_FLAG_1589], 0
        je      br_04595
        jmp     X_0467D

br_04595:
        inc     byte ptr [G_FLAG_1589]
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        callf   TEXT2_SEG:channel_validate
        add     sp, 2
        mov     si, ax
        mov     al, byte ptr [G_UI_FLAG]
        sub     ah, ah
        or      ax, ax
        jne     br_045B4
        jmp     L_04674
br_045B4:
        dec     ax
        je      br_045CC
        dec     ax
        je      br_045EE
        dec     ax
        je      br_04626
        dec     ax
        jne     br_045C3
        jmp     br_04652

br_045C3:
        mov     byte ptr [G_UI_FLAG], 0
        jmp     L_04674
        db      90h

br_045CC:
        lea     ax, [si+FXS_ECHO_FEEDBACK]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    0c1h
        push    0bh
        push    0
        push    0
        push    TEXT2_SEG
        push    fx_redraw
        callf   TEXT2_SEG:status_read_6A_3
        jmp     br_04679
br_045EE:
        mov     es, dx
        cmp     byte ptr es:[si+FXS_ECHO_TYPE], 2
        jne     br_0461A
        lea     ax, [si+FXS_ECHO_DELAY2]
        push    dx
        push    ax
        push    0
        push    14fh

loop_04601:
        push    3
        push    0c1h
        push    15h
        push    0
        push    0
        push    TEXT2_SEG
        push    fx_redraw
        callf   TEXT2_SEG:status_read_6A
        jmp     br_04679
        db      90h

br_0461A:
        lea     ax, [si+FXS_ECHO_DELAY]
        push    dx
        push    ax
        push    0
        push    29eh
        jmp     loop_04601

br_04626:
        lea     ax, [si+FXS_ECHO_HFDAMP]
        push    dx
        push    ax
        push    14h
        push    42h
        push    2
        push    0c1h
        push    1fh
        push    0
        push    0
        push    TEXT2_SEG
        push    fx_redraw
        callf   TEXT2_SEG:status_read_6A_3
        callf   TEXT2_SEG:win_keys_merge_disable
        mov     byte ptr [WIN_FIELD_BOX_W], 12h
        jmp     br_04679
        db      90h
br_04652:
        lea     ax, [si+FXS_ECHO_LR_OFS]
        push    dx
        push    ax
        push    -32h
        push    32h
        push    2
        push    0c1h
        push    29h
        push    0
        push    0
        push    TEXT2_SEG
        push    fx_redraw
        callf   TEXT2_SEG:field_register_s8
        jmp     br_04679
        db      90h

L_04674:
        callf   TEXT2_SEG:L_0522C

br_04679:
        dec     byte ptr [G_FLAG_1589]

X_0467D:
        pop     si
        ret
        db      00h

X_04680:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_UI_FLAG], 1
        jbe     X_04694
        dec     byte ptr [G_UI_FLAG]
        call    fx_echo_arm_field

X_04694:
        pop     ds
        retf

X_04696:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_UI_FLAG], 0
        jne     br_046AA
        mov     byte ptr [G_UI_FLAG], 2
        jmp     L_046B5

br_046AA:
        cmp     byte ptr [G_UI_FLAG], 4
        jae     X_046B8
        inc     byte ptr [G_UI_FLAG]

L_046B5:
        call    fx_echo_arm_field

X_046B8:
        pop     ds
        retf

X_046BA:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_UI_FLAG], 0
        je      X_046CF
        mov     byte ptr [G_UI_FLAG], 0
        call    fx_echo_arm_field

X_046CF:
        pop     ds
        retf
        db      00h

X_046D2:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_UI_FLAG], 0
        jne     br_046E7
        mov     byte ptr [G_UI_FLAG], 1
        call    fx_echo_arm_field

br_046E7:
        pop     ds
        retf
        db      00h

fx_echo_st_arm_field:
        push    si
        cmp     byte ptr [G_FLAG_1589], 0
        je      br_046F5
        jmp     X_047DB
br_046F5:
        inc     byte ptr [G_FLAG_1589]
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        callf   TEXT2_SEG:channel_validate
        add     sp, 2
        mov     si, ax
        mov     al, byte ptr [G_UI_FLAG]
        sub     ah, ah
        cmp     ax, 6

        ja      br_04728
        add     ax, ax
        xchg    bx, ax
        jmp     word ptr cs:[bx+P_471A]

P_471A:
        dw      L_047D2, X_04730, X_04752, X_04774
        dw      X_047A0, X_047B0, X_047C2

br_04728:
        mov     byte ptr [G_UI_FLAG], 0
        jmp     L_047D2

X_04730:
        lea     ax, [si+3ah]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    9dh

X_0473E:
        push    15h
        push    0
        push    0
        push    TEXT2_SEG
        push    fx_redraw
        callf   TEXT2_SEG:status_read_6A_3
        jmp     NEAR L_047D7

X_04752:
        lea     ax, [si+38h]
        push    dx
        push    ax
        push    0
        push    14fh
        push    3
        push    97h

X_04761:
        push    1fh
        push    0
        push    0
        push    TEXT2_SEG
        push    fx_redraw
        callf   TEXT2_SEG:status_read_6A
        jmp     SHORT L_047D7

X_04774:
        lea     ax, [si+3bh]
        push    dx
        push    ax
        push    14h
        push    42h
        push    2
        push    97h

X_04782:
        push    29h
        push    0
        push    0
        push    TEXT2_SEG
        push    fx_redraw
        callf   TEXT2_SEG:status_read_6A_3
        callf   TEXT2_SEG:win_keys_merge_disable
        mov     byte ptr [WIN_FIELD_BOX_W], 12h
        jmp     SHORT L_047D7
        db      90h

X_047A0:
        lea     ax, [si+3eh]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    0c7h
        jmp     SHORT X_0473E

X_047B0:
        lea     ax, [si+3ch]
        push    dx
        push    ax
        push    0
        push    14fh
        push    3
        push    0c1h
        jmp     SHORT X_04761
        db      90h

X_047C2:
        lea     ax, [si+3fh]
        push    dx
        push    ax
        push    14h
        push    42h
        push    2
        push    0c1h
        jmp     SHORT X_04782

L_047D2:
        callf   TEXT2_SEG:L_0522C

L_047D7:
        dec     byte ptr [G_FLAG_1589]

X_047DB:
        pop     si
        ret
        db      00h

X_047DE:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_UI_FLAG]
        sub     ah, ah
        or      ax, ax
        je      X_04800
        sub     ax, 4
        je      L_047F8
        dec     byte ptr [G_UI_FLAG]
        jmp     L_047FD

L_047F8:
        mov     byte ptr [G_UI_FLAG], 0

L_047FD:
        call    fx_echo_st_arm_field

X_04800:
        pop     ds
        retf

X_04802:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_UI_FLAG]
        sub     ah, ah
        sub     ax, 3
        je      X_0481E
        sub     ax, 3
        je      X_0481E
        inc     byte ptr [G_UI_FLAG]
        call    fx_echo_st_arm_field

X_0481E:
        pop     ds
        retf

X_04820:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_UI_FLAG]
        sub     ah, ah
        or      ax, ax
        je      X_0484A
        sub     ax, 4
        jl      br_0483A
        jo      br_0483A
        dec     ax
        dec     ax
        jle     L_04842

br_0483A:
        mov     byte ptr [G_UI_FLAG], 0
        jmp     L_04847
        db      90h

L_04842:
        sub     byte ptr [G_UI_FLAG], 3

L_04847:
        call    fx_echo_st_arm_field

X_0484A:
        pop     ds
        retf

X_0484C:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_UI_FLAG]
        sub     ah, ah
        or      ax, ax
        je      X_04866
        dec     ax
        jl      X_04874
        jo      X_04874
        dec     ax
        dec     ax
        jle     L_0486C
        pop     ds
        retf

X_04866:
        inc     byte ptr [G_UI_FLAG]
        jmp     L_04871

L_0486C:
        add     byte ptr [G_UI_FLAG], 3

L_04871:
        call    fx_echo_st_arm_field

X_04874:
        pop     ds
        retf

X_04876:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    TBL_WINKEYS_01AC2
        push    TEXT2_SEG
        push    L_0538E
        push    word TEXT1_SEG
        push    X_04876
        call    ui_screen_enter
        call    fx_reverb_arm_field
        pop     ds
        retf

; disp_list_run then L_03902 to read; renders 8 fixed display fields.
int2E_read_caller:
        enter   4, 0
        push    di

L_04899:
        push    si
        if      FW_VERSION = 172

L_0489A:
        endif
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_FX_REVERB
        nop
        push    cs
        call    disp_list_run
        call    fn_03902
        push    31h
        push    0bh
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        callf   TEXT2_SEG:channel_get_ptr
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, ax
        mov     word ptr [bp-2], es
        mov     al, byte ptr es:[bx]
        cbw
        mov     di, ax
        shl     di, 2
        push    word ptr [di+FX_REVERB_LABELS+2]
        push    word ptr [di+FX_REVERB_LABELS]
        callf   TEXT2_SEG:cmd_dispatch_1E
        push    61h
        push    15h
        mov     es, word ptr [bp-2]
        push    0
        push    word ptr es:[si+2]
        push    2
        callf   TEXT2_SEG:draw_unsigned_value
        push    61h
        push    29h
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+8]
        sub     ah, ah
        push    0
        push    ax
        push    2
        callf   TEXT2_SEG:draw_unsigned_value
        mov     es, word ptr [bp-2]
        cmp     byte ptr es:[si], 3
        jg      br_0498C
        push    61h
        push    1fh
        mov     al, byte ptr es:[si+7]
        sub     ah, ah
        push    0
        push    ax
        push    2
        callf   TEXT2_SEG:draw_unsigned_value
        push    0a9h
        push    15h
        push    ds
        push    STR_FX_NEAR
        callf   TEXT2_SEG:cmd_dispatch_1E
        push    85h
        push    1fh
        push    ds
        push    STR_FX_LF_DAMPING
        callf   TEXT2_SEG:cmd_dispatch_1E
        push    85h
        push    29h
        push    ds
        push    STR_FX_HF_DAMPING
        callf   TEXT2_SEG:cmd_dispatch_1E
        push    0c7h
        push    15h
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+4]
        sub     ah, ah
        push    0
        push    ax
        push    2
        callf   TEXT2_SEG:draw_unsigned_value
        push    0c7h
        push    1fh
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+5]
        push    ax
        callf   TEXT2_SEG:cmd_dispatch_caller2
        push    0c7h
        push    29h
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+6]
        push    ax
        callf   TEXT2_SEG:cmd_dispatch_caller2
        jmp     br_049A0
br_0498C:
        push    61h
        push    1fh
        mov     al, byte ptr es:[si+9]
        sub     ah, ah
        push    0
        push    ax
        push    2
        callf   TEXT2_SEG:draw_unsigned_value

br_049A0:
        callf   TEXT2_SEG:field_redraw
        pop     ds
        pop     si
        pop     di
        leave
        retf

fx_reverb_arm_field:
        push    si
        cmp     byte ptr [G_FLAG_1589], 0
        je      br_049B5
        jmp     X_04AE5

br_049B5:
        inc     byte ptr [G_FLAG_1589]
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        callf   TEXT2_SEG:channel_get_ptr
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, ax
        cmp     byte ptr es:[bx], 4
        jl      br_049DE
        cmp     byte ptr [G_UI_SUBMODE], 4
        jb      br_049DE
        mov     byte ptr [G_UI_SUBMODE], 0
br_049DE:
        mov     al, byte ptr [G_UI_SUBMODE]
        sub     ah, ah
        cmp     ax, 6
        ja      br_049FE
        add     ax, ax
        xchg    bx, ax
        jmp     word ptr cs:[bx+P_49F0]

P_49F0:
        dw      br_04ACC, X_04A06, X_04A28, X_04A5E
        dw      X_04A74, X_04A8A, X_04AB6

br_049FE:
        mov     byte ptr [G_UI_SUBMODE], 0
        jmp     br_04ACC

X_04A06:
        lea     ax, [si+2]
        push    dx
        push    ax
        push    0
        push    5ah
        push    2
        push    61h
        push    15h
        push    0
        push    0
        push    TEXT2_SEG

        push    far_04B42
        callf   TEXT2_SEG:status_read_6A
        jmp     NEAR L_04AE1
        db      90h

X_04A28:
        cmp     byte ptr es:[si], 3
        jle     X_04A38
        mov     ax, si
        mov     dx, es
        add     ax, 9
        jmp     SHORT X_04A3F
        db      90h

X_04A38:
        mov     ax, si
        mov     dx, es
        add     ax, 7

X_04A3F:
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    61h
        push    1fh

X_04A4B:
        push    0
        push    0
        push    TEXT2_SEG
        push    far_04B42
        callf   TEXT2_SEG:status_read_6A_3
        jmp     NEAR L_04AE1
        db      90h

X_04A5E:
        mov     ax, si
        mov     dx, es
        add     ax, 8
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    61h
        push    29h
        jmp     SHORT X_04A4B
        db      90h

X_04A74:
        mov     ax, si
        mov     dx, es
        add     ax, 4
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    0c7h
        push    15h
        jmp     SHORT X_04A4B

X_04A8A:
        lea     ax, [si+5]
        push    dx
        push    ax
        push    0
        push    28h
        push    2
        push    0c7h
        push    1fh

X_04A9A:
        push    0
        push    0
        push    TEXT2_SEG
        push    far_04B42
        callf   TEXT2_SEG:status_read_6A_3
        callf   TEXT2_SEG:win_keys_merge_disable
        mov     byte ptr [WIN_FIELD_BOX_W], 12h
        jmp     SHORT L_04AE1
        db      90h

X_04AB6:
        mov     ax, si
        mov     dx, es
        add     ax, 6
        push    dx
        push    ax
        push    28h
        push    42h
        push    2
        push    0c7h
        push    29h
        jmp     SHORT X_04A9A

br_04ACC:
        push    dx
        push    si
        push    6
        push    31h
        push    0bh
        push    0bh
        push    TEXT2_SEG
        push    far_04B42
        callf   TEXT2_SEG:voice_trigger_full

L_04AE1:
        dec     byte ptr [G_FLAG_1589]

X_04AE5:
        pop     si
        ret
        db      00h

X_04AE8:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_UI_SUBMODE]
        sub     ah, ah
        or      ax, ax
        je      X_04B0A
        sub     ax, 4
        je      L_04B02
        dec     byte ptr [G_UI_SUBMODE]
        jmp     L_04B07

L_04B02:
        mov     byte ptr [G_UI_SUBMODE], 0

L_04B07:
        call    fx_reverb_arm_field

X_04B0A:
        pop     ds
        retf

X_04B0C:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_UI_SUBMODE], 3
        je      X_04B27
        cmp     byte ptr [G_UI_SUBMODE], 6
        je      X_04B27
        inc     byte ptr [G_UI_SUBMODE]
        call    fx_reverb_arm_field

X_04B27:
        pop     ds
        retf
        db      00h

L_04B2A:
        push    ds
        mov     cx, DATA_SEG

L_04B2E:
        mov     ds, cx
        cmp     byte ptr [G_UI_SUBMODE], 4
        jb      L_04B3F
        sub     byte ptr [G_UI_SUBMODE], 3
        call    fx_reverb_arm_field

L_04B3F:
        pop     ds
        retf
        db      00h

L_04B42:
L_04BC8:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_UI_SUBMODE], 4
        jae     br_04B7C
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        callf   TEXT2_SEG:channel_get_ptr
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        cmp     byte ptr es:[bx], 4
        jge     br_04B7C
        cmp     byte ptr [G_UI_SUBMODE], 0
        jne     L_04B74
        mov     byte ptr [G_UI_SUBMODE], 4
        jmp     L_04B79

L_04B74:
        add     byte ptr [G_UI_SUBMODE], 3

L_04B79:
        call    fx_reverb_arm_field

br_04B7C:
        pop     ds
        retf

audio_dispatch_table:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+6]
        push    ds
        push    TBL_WINKEYS_FX_MIXER
        push    TEXT2_SEG
        push    L_053BA
        push    0
        push    0
        call    ui_screen_enter
        mov     ax, word ptr [bp+8]
        or      ax, si
        je      br_04BB3
        push    5
        push    word ptr [bp+8]
        push    si
        callf   TEXT2_SEG:install_handler
        push    15h
        push    word ptr [bp+8]
        push    si
        callf   TEXT2_SEG:install_handler

br_04BB3:
        call    midi_status_read
        pop     si
        leave
        retf    4
        db      00h

midi_status_read:
        enter   4, 0
        push    si
        cmp     byte ptr [G_FLAG_1589], 0
        je      br_04BCB
        jmp     X_04CF0

br_04BCB:
        inc     byte ptr [G_FLAG_1589]
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        callf   TEXT2_SEG:channel_validate
        add     sp, 2
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     al, byte ptr [FX_MIXER_CURSOR]
        sub     ah, ah
        if      FW_VERSION = 172
        cmp     ax, 9
        else
        cmp     ax, 8
        endif
        ja      L_04C08
        add     ax, ax
        xchg    bx, ax
        jmp     word ptr cs:[bx+P_4BF4]
        db      90h

P_4BF4:
        dw      L_04CD2, L_04C10
        if      FW_VERSION = 172
        dw      L_04C20
        endif
        dw      L_04C36, L_04C58, L_04C6A, L_04C7C
        dw      L_04C9E, L_04CB0_1, L_04CC2_1

L_04C08:
        mov     byte ptr [FX_MIXER_CURSOR], 0
        jmp     L_04CD2

L_04C10:
        lea     ax, [si+46h]
        push    dx
        push    ax
        push    2
        push    19h
        if      FW_VERSION = 172
        push    1fh
        else
        push    24h
        endif
        push    0dh
        jmp     NEAR L_04CE1

L_04C20:
        if      FW_VERSION = 172
        push    ds
        push    B_9D8C
        push    4
        push    3dh
        push    29h
        push    7
        push    TEXT2_SEG
        push    L_04B2E_1
        jmp     NEAR L_04CE7
        db      90h

        endif
L_04C36:
        lea     ax, [si+14h]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    0a9h
        push    15h

X_04C46:
        push    0
        push    0
        push    TEXT2_SEG
        push    fx_redraw
        callf   TEXT2_SEG:status_read_6A_3
        jmp     NEAR L_04CEC

L_04C58:
        lea     ax, [si+40h]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    0a9h

L_04C66:
        push    1fh
        jmp     SHORT X_04C46

L_04C6A:
        lea     ax, [si+43h]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    0a9h
        push    29h
        jmp     SHORT X_04C46

L_04C7C:
        lea     ax, [si+15h]
        push    dx
        push    ax
        push    -32h
        push    32h
        push    2
        push    0bbh
        push    15h

X_04C8C:
        push    0
        push    0
        push    TEXT2_SEG
        push    fx_redraw
        callf   TEXT2_SEG:field_register_s8
        jmp     SHORT L_04CEC
        db      90h

L_04C9E:
        lea     ax, [si+41h]
        push    dx
        push    ax
        push    -32h
        push    32h
        push    2
        push    0bbh
        push    1fh
        jmp     SHORT X_04C8C

L_04CB0_1:
        lea     ax, [si+44h]
        push    dx
        push    ax
        push    -32h
        push    32h
        push    2
        push    0bbh
        push    29h
        jmp     SHORT X_04C8C

L_04CC2_1:
        lea     ax, [si+42h]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    0d3h
        jmp     SHORT L_04C66

L_04CD2:
        lea     ax, [si+5]
        push    word ptr [bp-2]
        push    ax
        push    1
        push    55h
        if      FW_VERSION = 172
        push    0bh
        else
        push    0eh
        endif
        push    4

L_04CE1:
        push    TEXT2_SEG
        push    fx_redraw

L_04CE7:
        callf   TEXT2_SEG:voice_trigger_full

L_04CEC:
        dec     byte ptr [G_FLAG_1589]

X_04CF0:
        pop     si
        leave
        ret
        db      00h

fx_mixer_up:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [FX_MIXER_CURSOR]
        sub     ah, ah
        if      FW_VERSION = 172
        cmp     ax, 9
        else
        cmp     ax, 8
        endif
        je      L_04D18
        ja      X_04D12
        or      al, al
        je      X_04D20
        if      FW_VERSION = 172
        sub     al, 3
        else
        sub     al, 2
        endif
        je      X_04D20
        sub     al, 3
        je      X_04D20

X_04D12:
        dec     byte ptr [FX_MIXER_CURSOR]
        jmp     L_04D1D

L_04D18:
        if      FW_VERSION = 172
        mov     byte ptr [FX_MIXER_CURSOR], 6
        else
        mov     byte ptr [FX_MIXER_CURSOR], 5
        endif

L_04D1D:
        call    midi_status_read

X_04D20:
        pop     ds
        retf

fx_mixer_down:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [FX_MIXER_CURSOR]
        sub     ah, ah
        dec     ax
        if      FW_VERSION = 172
        dec     ax
        endif
        je      L_04D4C
        sub     ax, 3
        je      L_04D4C
        sub     ax, 3
        je      L_04D4C
        dec     ax
        je      L_04D44
        inc     byte ptr [FX_MIXER_CURSOR]
        jmp     L_04D49
        if      FW_VERSION = 150
        db      90h
        endif

L_04D44:
        if      FW_VERSION = 172
        mov     byte ptr [FX_MIXER_CURSOR], 8
        else
        mov     byte ptr [FX_MIXER_CURSOR], 7
        endif

L_04D49:
        call    midi_status_read

L_04D4C:
        pop     ds
; validate block, return current track @[8CE0h]; misnomer:
; timer poll?

mem_block_validate:
        retf

fx_mixer_left:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [FX_MIXER_CURSOR]
        sub     ah, ah
        if      FW_VERSION = 172
        or      ax, ax
        else
        cmp     ax, 8
        je      L_04D70
        ja      br_04D68
        or      al, al
        endif
        jl      br_04D68
        if      FW_VERSION = 172
        jo      br_04D68
        dec     ax
        dec     ax
        else
        dec     al
        endif
        jle     L_04D78
        if      FW_VERSION = 172
        sub     ax, 7
        else
        dec     al
        endif
        je      L_04D70

br_04D68:
        sub     byte ptr [FX_MIXER_CURSOR], 3
        jmp     L_04D75
        db      90h

L_04D70:
        sub     byte ptr [FX_MIXER_CURSOR], 2

L_04D75:
        call    midi_status_read

L_04D78:
        pop     ds
        retf

fx_mixer_right:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [FX_MIXER_CURSOR]
        sub     ah, ah
        if      FW_VERSION = 172
        sub     ax, 6
        jl      L_04D93
        jo      L_04D93
        dec     ax
        dec     ax
        jle     L_04D9A
        dec     ax
        else
        cmp     ax, 8
        endif
        je      br_04DA2
        if      FW_VERSION = 150
        ja      L_04D93
        or      al, al
        je      L_07412
        sub     al, 5
        jl      L_04D93
        sub     al, 2
        jle     L_04D9A
        endif

L_04D93:
        add     byte ptr [FX_MIXER_CURSOR], 3
        jmp     L_04D9F
        if      FW_VERSION = 150
        db      90h

L_07412:
        add     byte ptr [FX_MIXER_CURSOR], 2
        jmp     L_04D9F
        db      90h
        endif

L_04D9A:
        if      FW_VERSION = 172
        mov     byte ptr [FX_MIXER_CURSOR], 9
        else
        mov     byte ptr [FX_MIXER_CURSOR], 8
        endif

L_04D9F:
        call    midi_status_read

br_04DA2:
        pop     ds
        retf

; ? ui_screen_enter, then handler ids 5 and 15h; its redraw edits two
; channel bytes over 0..63h and -32h..32h.
ui_screen_enter_edit:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+6]
        push    ds
        push    TBL_WINKEYS_FX_MIXER_LR
        push    TEXT2_SEG
        push    L_054E4
        push    0
        push    0
        call    ui_screen_enter
        mov     ax, word ptr [bp+8]
        or      ax, si
        je      br_04DD9
        push    5
        push    word ptr [bp+8]
        push    si
        callf   TEXT2_SEG:install_handler
        push    15h
        push    word ptr [bp+8]
        push    si
        callf   TEXT2_SEG:install_handler

br_04DD9:
        call    fx_mixer_arm_field
        pop     si
        leave
        retf    4
        db      00h

fx_mixer_arm_field:
        push    si
        cmp     byte ptr [G_FLAG_1589], 0
        jne     X_04E55
        inc     byte ptr [G_FLAG_1589]
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        callf   TEXT2_SEG:channel_get_ptr
        add     sp, 2
        mov     si, ax
        mov     al, byte ptr [FX_MIXER_CURSOR]
        sub     ah, ah
        or      ax, ax
        je      br_04E32
        dec     ax
        je      br_04E10
        mov     byte ptr [FX_MIXER_CURSOR], 0
        jmp     br_04E32
br_04E10:
        lea     ax, [si+FXR_FIELD_0B]
        push    dx
        push    ax
        push    -32h
        push    32h
        push    2
        push    0bbh
        push    1fh
        push    0
        push    0
        push    TEXT2_SEG
        push    far_04B42
        callf   TEXT2_SEG:field_register_s8
        jmp     L_04E51
        db      90h
br_04E32:
        lea     ax, [si+FXR_FIELD_0A]
        push    dx
        push    ax
        push    0
        push    63h
        push    2
        push    0a9h
        push    1fh
        push    0
        push    0
        push    TEXT2_SEG
        push    far_04B42
        callf   TEXT2_SEG:status_read_6A_3

L_04E51:
        dec     byte ptr [G_FLAG_1589]

X_04E55:
        pop     si
        ret
        db      00h

fx_mixer_lr_left:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [FX_MIXER_CURSOR], 0
        je      X_04E6D
        mov     byte ptr [FX_MIXER_CURSOR], 0
        call    fx_mixer_arm_field

X_04E6D:
        pop     ds
        retf
        db      00h

fx_mixer_lr_right:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [FX_MIXER_CURSOR], 0
        jne     X_04E85
        mov     byte ptr [FX_MIXER_CURSOR], 1
        call    fx_mixer_arm_field

X_04E85:
        pop     ds
        retf
        db      00h

L_04E88:
        push    ds

L_04E89:
        mov     cx, DATA_SEG
        mov     ds, cx
        sub     ax, ax
        mov     word ptr [FP_POLL_HOOK_SEG], ax
        mov     word ptr [FP_POLL_HOOK], ax
        push    cx
        push    P_1CF0
        nop
        push    cs
        call    win_keys_merge
        mov     byte ptr [COPY_FX_CURSOR], 0
        mov     al, byte ptr [PGM_SLOT]
        mov     byte ptr [G_COPY_DST_PGM], al
        mov     byte ptr [G_COPY_SRC_PGM], al
        mov     al, byte ptr [G_STATE_9D8B]
        mov     byte ptr [G_COPY_DST_NOTE], al
        mov     byte ptr [G_COPY_SRC_NOTE], al
        call    fx_copy_arm_field
        pop     ds
        retf
        db      00h
fx_copy_arm_field:
        mov     al, byte ptr [COPY_FX_CURSOR]
        sub     ah, ah
        or      ax, ax
        je      br_04ED0
        dec     ax
        je      br_04EEA
        dec     ax
        je      br_04EF6
        dec     ax
        je      br_04F02
        ret
        db      90h

br_04ED0:
        push    ds
        push    G_COPY_SRC_PGM
        push    1
        push    55h
        push    0bh

loop_04EDA:
        push    0
        push    0
        push    TEXT2_SEG
        push    copy_fx_close
        callf   TEXT2_SEG:seq_write_data
        ret

br_04EEA:
        push    ds
        push    G_COPY_SRC_NOTE
        push    3
        push    55h
        push    14h
        jmp     X_04F0C

br_04EF6:
        push    ds
        push    G_COPY_DST_PGM
        push    1
        push    55h
        push    20h
        jmp     loop_04EDA

br_04F02:
        push    ds
        push    G_COPY_DST_NOTE
        push    3
        push    55h
        push    29h

X_04F0C:
        push    0ah
        push    0
        push    0
        callf   TEXT2_SEG:voice_trigger_full
        ret

copy_fx_up:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [COPY_FX_CURSOR], 0
        je      X_04F29
        dec     byte ptr [COPY_FX_CURSOR]

X_04F29:
        call    fx_copy_arm_field
        pop     ds
        retf

copy_fx_down:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [COPY_FX_CURSOR], 3
        jae     br_04F3F
        inc     byte ptr [COPY_FX_CURSOR]

br_04F3F:
        call    fx_copy_arm_field
        pop     ds
        retf

; ?
track_calc_offset:
        push    bp
        mov     bp, sp
        imul    ax, word ptr [bp+4], PGM_PAD_STRIDE
        add     ax, word ptr [PGM_CURRENT]
        mov     dx, word ptr [PGM_CURRENT+2]
        sub     ax, PGM_PAD_BIAS
        leave
        ret     2

X_04F5A:
        push    ds
        push    PGM_SLOT
        push    1
        push    1ah
        push    2
        push    TEXT2_SEG
        push    L_05D1E
        push    word TEXT1_SEG
        push    L_06570
        callf   TEXT2_SEG:seq_write_data
        ret

X_04F76:
        push    word TEXT1_SEG
        push    X_05776
        callf   TEXT2_SEG:install_handler_15
        push    ds
        push    G_PAD_INDEX
        push    3fh
        push    20h
        push    0ch
        push    4
        push    TEXT2_SEG
        push    loop_seq_handler
        callf   TEXT2_SEG:voice_trigger_full
        ret
        db      00h

X_04F9A:
        push    word TEXT1_SEG
        push    X_05776
        callf   TEXT2_SEG:install_handler_15
        mov     al, byte ptr [G_PAD_INDEX]
        sub     ah, ah
        add     ax, word ptr [PTR_TRACK_DATA]
        mov     dx, word ptr [PTR_TRACK_DATA+2]
        push    dx
        push    ax
        push    22h
        push    62h
        push    2
        push    56h
        push    0ch
        push    0
        push    0
        push    TEXT2_SEG
        push    smem_loop_proc
        callf   TEXT2_SEG:status_read_6A_3
        ret

X_04FCE:
        push    TEXT2_SEG
        push    L_05E02
        callf   TEXT2_SEG:install_handler_15
        push    ds
        push    B_9D77
        push    1
        push    0c2h
        push    0ch
        push    8
        push    TEXT2_SEG
        push    L_05D1E
        callf   TEXT2_SEG:voice_trigger_full
        ret

X_04FF2:
        push    TEXT2_SEG
        push    L_05E34
        callf   TEXT2_SEG:install_handler_15
        push    ds
        push    G_PAD_NOTE_BASE
        push    26h
        push    16h
        push    0
        callf   TEXT2_SEG:timer_value_read_1
        mov     byte ptr [WIN_FIELD_BOX_W], 0ch
        ret

L_05012:
        push    TEXT2_SEG
        push    L_05E34
        callf   TEXT2_SEG:install_handler_15
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset
        push    dx
        push    ax
        push    1
        push    50h
        push    16h
        push    0
        push    0
        nop
        push    cs
        call    far_035F2
        ret
timer_poll_wait_1:
        enter   4, 0
        push    si
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset
        mov     es, dx
        mov     bx, ax
        mov     si, ax
        mov     word ptr [bp-2], es

; ? misnomer: timer poll? mode dispatcher? looks up
; current track @[8CE0h].
        cmp     byte ptr es:[bx+PGM_PAD_MODE], 3
        jne     X_05071
        cmp     byte ptr es:[si+PGM_PAD_SW1], 63h
        jle     br_05062
        mov     byte ptr es:[si+PGM_PAD_SW1], 63h

br_05062:
        mov     es, word ptr [bp-2]
        cmp     byte ptr es:[si+PGM_PAD_SW2], 64h
        jle     X_05071
        mov     byte ptr es:[si+PGM_PAD_SW2], 64h

X_05071:
        pop     si
        leave
        retf

L_05074:
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset
        add     ax, 5
        push    dx
        push    ax
        push    3
        push    26h
        push    27h
        push    7
        push    word TEXT1_SEG
        push    timer_poll_wait_1
        callf   TEXT2_SEG:voice_trigger_full
        ret
pad_sw2_clamp:
        push    si
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset
        mov     si, ax
        mov     es, dx
        mov     al, byte ptr es:[si+PGM_PAD_SW2]
        cmp     byte ptr es:[si+PGM_PAD_SW1], al
        jl      X_050B8
        mov     al, byte ptr es:[si+PGM_PAD_SW1]
        inc     al
        mov     byte ptr es:[si+PGM_PAD_SW2], al

X_050B8:
        pop     si
        retf

L_050BA_1:
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset
        add     ax, 6
        push    dx
        push    ax
        push    0
        push    7eh
        push    3
        push    92h
        push    1eh
        push    0
        push    0
        push    word TEXT1_SEG
        push    pad_sw2_clamp
        callf   TEXT2_SEG:status_read_6A_3
        ret
        db      00h

X_050E4:
        push    si
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset
        mov     si, ax
        lea     ax, [si+PGM_PAD_SW2]
        push    dx
        push    ax
        mov     es, dx
        mov     al, byte ptr es:[si+PGM_PAD_SW1]
        inc     al
        push    ax
        push    7fh
        push    3
        push    92h
        push    27h
        push    0
        push    0
        push    0
        push    0
        callf   TEXT2_SEG:status_read_6A_3
        pop     si
        ret

X_05116:
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset
        add     ax, 6
        push    dx
        push    ax
        push    0
        push    63h
        push    3
        push    92h
        push    1eh
        push    0
        push    0
        push    word TEXT1_SEG
        push    pad_sw2_clamp
        callf   TEXT2_SEG:status_read_6A_3
        ret
        db      00h

X_05140:
        push    si
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset
        mov     si, ax
        lea     ax, [si+PGM_PAD_SW2]
        push    dx
        push    ax
        mov     es, dx
        mov     al, byte ptr es:[si+PGM_PAD_SW1]
        inc     al
        push    ax
        push    64h
        push    3
        push    92h
        push    27h
        push    0
        push    0
        push    0
        push    0
        callf   TEXT2_SEG:status_read_6A_3
        pop     si
        ret

X_05172:
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset
        add     ax, 7
        push    dx
        push    ax
        push    0c8h
        push    1eh
        push    1
        callf   TEXT2_SEG:timer_value_read_1
        ret
        db      00h
L_0518E:
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset
        add     ax, 9
        push    dx
        push    ax
        push    0c8h
        push    27h
        push    1
        callf   TEXT2_SEG:timer_value_read_1
        ret
        db      00h

assign_view_arm_field:
        push    si
        cmp     byte ptr [G_ASSIGN_VIEW_FIELD], 0ch
        jle     L_051B7
        mov     byte ptr [G_ASSIGN_VIEW_FIELD], 0

L_051B7:
        push    0
        push    0
        callf   TEXT2_SEG:install_handler_15
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+PGM_PAD_MODE]
        cbw
        mov     si, ax
        add     si, ax
        add     si, ax
        shl     si, 2
        add     si, ax
        mov     al, byte ptr [G_ASSIGN_VIEW_FIELD]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+si+TBL_ASSIGN_VIEW_FIELD_FIX]
        mov     byte ptr [G_ASSIGN_VIEW_FIELD], al
        cbw

L_051EB:
        mov     bx, ax
        add     bx, ax
        call    word ptr [bx+TBL_ASSIGN_VIEW_ARM]
        pop     si
        ret
        db      00h

        if      FW_VERSION = 172
assign_view_key_up:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah

L_05202:
        push    ax
        call    track_calc_offset
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+PGM_PAD_MODE]
        cbw

L_0520F:
        mov     si, ax
        add     si, ax
        add     si, ax

L_05215:
        shl     si, 2
        add     si, ax
        mov     al, byte ptr [G_ASSIGN_VIEW_FIELD]
        cbw

L_0521E:
        mov     bx, ax

L_05220:
        mov     al, byte ptr [bx+si+TBL_ASSIGN_VIEW_FIELD_FIX+52]
        mov     byte ptr [G_ASSIGN_VIEW_FIELD], al
        call    assign_view_arm_field

L_0522A:
        pop     ds
        pop     si
        retf
        db      00h

assign_view_key_down:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_PAD_NOTE_BASE]

L_05238:
        sub     ah, ah

L_0523A:
        push    ax
        call    track_calc_offset
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+PGM_PAD_MODE]

L_05246:
        cbw
        mov     si, ax
        add     si, ax
        add     si, ax
        shl     si, 2
        add     si, ax
        mov     al, byte ptr [G_ASSIGN_VIEW_FIELD]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+si+TBL_ASSIGN_VIEW_FIELD_FIX+104]
        mov     byte ptr [G_ASSIGN_VIEW_FIELD], al
        call    assign_view_arm_field
        pop     ds
        pop     si
        retf
        db      00h

        endif
        if      FW_VERSION = 172
assign_view_key_left:
        else
assign_view_key_up:
        endif
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+PGM_PAD_MODE]
        cbw
        mov     si, ax
        add     si, ax
        add     si, ax
        shl     si, 2
        add     si, ax
        mov     al, byte ptr [G_ASSIGN_VIEW_FIELD]
        cbw
        mov     bx, ax
        if      FW_VERSION = 172
        mov     al, byte ptr [bx+si+TBL_ASSIGN_VIEW_FIELD_FIX+156]
        else
        mov     al, byte ptr [bx+si+TBL_ASSIGN_VIEW_FIELD_FIX+52]
        endif
        mov     byte ptr [G_ASSIGN_VIEW_FIELD], al
        call    assign_view_arm_field
        pop     ds
        pop     si
        retf
        db      00h

        if      FW_VERSION = 172
assign_view_key_right:
        else
assign_view_key_down:
        endif
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+PGM_PAD_MODE]
        cbw
        if      FW_VERSION = 150
        mov     si, ax
        add     si, ax
        add     si, ax
        shl     si, 2
        add     si, ax
        mov     al, byte ptr [G_ASSIGN_VIEW_FIELD]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+si+TBL_ASSIGN_VIEW_FIELD_FIX+104]
        mov     byte ptr [G_ASSIGN_VIEW_FIELD], al
        call    assign_view_arm_field
        pop     ds
        pop     si
        retf
        db      00h

assign_view_key_left:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+5]
        cbw
        mov     si, ax
        add     si, ax
        add     si, ax
        shl     si, 2
        add     si, ax
        mov     al, byte ptr [G_ASSIGN_VIEW_FIELD]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+si+TBL_ASSIGN_VIEW_FIELD_FIX+156]
        mov     byte ptr [G_ASSIGN_VIEW_FIELD], al
        call    assign_view_arm_field
        pop     ds
        pop     si
        retf
        db      00h

assign_view_key_right:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+5]
        cbw
        endif
        mov     si, ax
        add     si, ax
        add     si, ax
        shl     si, 2
        add     si, ax
        mov     al, byte ptr [G_ASSIGN_VIEW_FIELD]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+si+TBL_ASSIGN_VIEW_FIELD_FIX+208]
        mov     byte ptr [G_ASSIGN_VIEW_FIELD], al
        call    assign_view_arm_field
        pop     ds
        pop     si
        retf
        db      00h

L_052D6:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     si, ax
        or      al, al
        je      br_052FA
        nop
        push    cs
        call    pad_bank_get
        shl     al, 4
        mov     cx, si
        add     al, ch
        mov     byte ptr [G_PAD_INDEX], al
        callf   TEXT2_SEG:loop_seq_handler
        call    assign_view_arm_field

br_052FA:
        pop     ds
        pop     si
        retf
        db      00h

track_read_caller:
        enter   4, 0
        push    di

pgm_assign_draw:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    ds
        push    DL_PGM_ASSIGN
        nop
        push    cs
        call    disp_list_run
        push    17h
        callf   TEXT2_SEG:ui_row_request
        mov     al, byte ptr [PGM_SLOT]
        cbw
        push    ax
        push    1ah
        push    2
        callf   TEXT2_SEG:sequence_get_info
        mov     al, byte ptr [G_PAD_INDEX]
        push    ax
        push    20h
        push    0ch
        callf   TEXT2_SEG:cmd_dispatch_wrapper
        mov     bl, byte ptr [G_PAD_INDEX]
        sub     bh, bh
        les     di, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+di]
        push    ax
        push    56h
        push    0ch
        callf   TEXT2_SEG:timer_value_read_2
        push    0c2h
        push    0ch
        mov     al, byte ptr [B_9D77]
        cbw
        shl     ax, 3
        add     ax, TBL_PGM_MASTER_LABELS
        push    ds
        push    ax
        callf   TEXT2_SEG:cmd_dispatch_1E
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        push    ax
        push    26h
        push    16h
        callf   TEXT2_SEG:timer_value_read_2
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+PGM_PAD_SND_SEG]
        push    word ptr es:[si]
        push    50h
        push    16h
        callf   TEXT2_SEG:timer_value_read_4
        push    26h
        push    27h
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+PGM_PAD_MODE]
        cbw
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        add     ax, ax
        add     ax, cx
        add     ax, TBL_PAD_MODE_LABELS
        push    ds
        push    ax
        callf   TEXT2_SEG:cmd_dispatch_1E
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+PGM_PAD_MODE]
        cbw
        dec     ax
        je      br_053CC
        dec     ax
        jge     br_053C1
        jmp     br_05454

br_053C1:
        jno     br_053C6
        jmp     br_05454

br_053C6:
        dec     ax
        jle     br_053E8
        jmp     br_05454

br_053CC:
        push    62h
        push    1eh
        push    ds
        push    STR_ALSO_PLAY_NOTE
        callf   TEXT2_SEG:cmd_dispatch_1E
        push    62h
        push    27h
        push    ds
        push    STR_ALSO_PLAY_NOTE
        callf   TEXT2_SEG:cmd_dispatch_1E
        jmp     br_05430

br_053E8:
        push    62h
        push    1eh
        push    ds
        push    STR_IF_OVER_USE
        callf   TEXT2_SEG:cmd_dispatch_1E
        push    62h
        push    27h
        push    ds
        push    STR_IF_OVER_USE
        callf   TEXT2_SEG:cmd_dispatch_1E
        RUN_DRAW_PAD_FIELD    92h,1eh,PGM_PAD_SW1
        RUN_DRAW_PAD_FIELD    92h,27h,PGM_PAD_SW2
br_05430:
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+PGM_PAD_ALT1]
        push    ax
        push    0c8h
        push    1eh
        callf   TEXT2_SEG:timer_value_read_3
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+PGM_PAD_ALT2]
        push    ax
        push    0c8h
        push    27h
        callf   TEXT2_SEG:timer_value_read_3

br_05454:
        callf   TEXT2_SEG:field_redraw
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+PGM_PAD_SND_SEG]
        or      ax, word ptr es:[si]
        je      L_05473
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+PGM_PAD_SND_SEG]
        mov     word ptr [SND_CURRENT], ax
        mov     word ptr [SND_CURRENT+2], dx

L_05473:
        pop     ds
        pop     si
        pop     di
        leave
        retf

pgm_assign_enter:
L_054F8:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     byte ptr [G_NOTE_CAPTURE], 0
        mov     byte ptr [PAD_INPUT_MODE], 1
        or      byte ptr [B_9D1C], 1
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        sub     ax, 23h
        cmp     ax, 3fh
        jbe     br_054A0
        mov     byte ptr [G_PAD_NOTE_BASE], 23h
br_054A0:
        mov     byte ptr [G_VELOCITY_IN], 7fh
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        callf   TEXT2_SEG:timer_io_setup
        mov     si, ax
        or      si, ax
        jge     br_054BE
        mov     byte ptr [G_PAD_INDEX], 0
        jmp     br_054C3
        db      90h

br_054BE:
        mov     ax, si
        mov     byte ptr [G_PAD_INDEX], al

br_054C3:
        mov     byte ptr [G_PGM_RETURN_PARAMS], 0
        callf   TEXT2_SEG:note_release_latched
        push    ds
        push    TBL_WINKEYS_PGM_ASSIGN
        nop
        push    cs
        call    win_keys_merge
        call    assign_view_arm_field
        pop     ds
        pop     si
        retf

L_054DC:
        push    di
        push    si
        mov     al, byte ptr [G_PAD_INDEX]
        and     ax, 0fh
        mov     cx, 4
        mov     bx, ax
        cwd
        idiv    cx
        mov     di, dx
        mov     ax, bx
        cwd
        and     dx, 3
        add     ax, dx
        sar     ax, 2
        mov     si, ax
        mov     al, byte ptr [G_PAD_INDEX]
        sub     ah, ah
        add     ax, word ptr [PTR_TRACK_DATA]
        mov     dx, word ptr [PTR_TRACK_DATA+2]
        push    dx
        push    ax
        push    5bh
        push    0ah
        push    1
        callf   TEXT2_SEG:timer_value_read_1
        mov     ax, di
        mov     cl, 36h
        imul    cl
        add     al, 13h
        mov     byte ptr [EDIT_CURSOR_X], al
        mov     ax, si
        shl     al, 3
        sub     al, 2bh
        neg     al
        mov     byte ptr [EDIT_CURSOR_Y], al
        mov     byte ptr [WIN_FIELD_BOX_W], 30h
        pop     si
        pop     di
        ret

L_05534:
L_055B4:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_PAD_INDEX]
        and     ax, 33h
        mov     cl, byte ptr [G_PAD_INDEX]
        and     cx, 0ch
        cmp     cx, 0ch
        jge     L_05558
        add     cl, al
        add     cl, 4
        mov     byte ptr [G_PAD_INDEX], cl
        call    L_054DC

L_05558:
        pop     ds
        retf

L_0555A:
L_055DA:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_PAD_INDEX]
        and     ax, 33h
        mov     cl, byte ptr [G_PAD_INDEX]
        and     cx, 0ch
        cmp     cx, 3
        jle     X_0557E
        add     cl, al
        sub     cl, 4
        mov     byte ptr [G_PAD_INDEX], cl
        call    L_054DC

X_0557E:
        pop     ds
        retf

X_05580:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_PAD_INDEX]
        and     ax, 3ch
        mov     cl, byte ptr [G_PAD_INDEX]
        and     cx, 3
        jle     L_055A0
        add     cl, al
        dec     cl
        mov     byte ptr [G_PAD_INDEX], cl
        call    L_054DC

L_055A0:
        pop     ds
        retf

L_055A2:
L_05622:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_PAD_INDEX]
        and     ax, 3ch
        mov     cl, byte ptr [G_PAD_INDEX]
        and     cx, 3
        cmp     cx, 3
        jge     br_055C5
        add     cl, al
        inc     cl
        mov     byte ptr [G_PAD_INDEX], cl
        call    L_054DC

br_055C5:
        pop     ds
        retf
        db      00h
; calls helper L_01F04 (INT 37h); PTR_TRACK_DATA lookup
; (10h-stride); note 23h..62h -> G_PAD_NOTE_BASE; no port
; I/O.
timer_poll_wait_2:
        enter   4, 0
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    pad_bank_get
        mov     byte ptr [bp-1], al
        inc     byte ptr [bp-1]
        mov     al, byte ptr [bp-1]
        and     al, 3
        mov     cx, ax
        sub     ah, ah
        push    ax
        mov     word ptr [bp-4], cx
        nop
        push    cs
        call    int3F_wrapper
        add     sp, 2
        mov     al, byte ptr [bp-4]
        shl     al, 4
        mov     cl, byte ptr [G_PAD_INDEX]
        and     cl, 0fh
        add     al, cl
        mov     byte ptr [G_PAD_INDEX], al
        call    L_054DC
        pop     ds
        leave
        retf

L_0560A:
L_0568A:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     si, ax
        or      al, al
        je      br_0563C
        nop
        push    cs
        call    pad_bank_get
        cbw
        mov     cl, byte ptr [G_PAD_INDEX]
        shr     cl, 4
        sub     ch, ch
        cmp     ax, cx
        jne     br_0563C
        nop
        push    cs
        call    pad_bank_get
        shl     al, 4
        mov     cx, si
        add     al, ch
        mov     byte ptr [G_PAD_INDEX], al
        call    L_054DC

br_0563C:
        pop     ds
        pop     si
        retf
        db      00h

track_calc_multi_1:
        enter   22h, 0
        push    di

L_05645:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_PAD_INDEX]
        shr     al, 4
        sub     ah, ah
        mov     di, ax
        mov     al, byte ptr [G_PAD_INDEX]
        and     ax, 0fh
        mov     si, ax
        push    cx
        push    DL_ASSIGNMENT_VIEW
        nop
        push    cs
        call    disp_list_run
        push    31h
        push    0ah
        lea     ax, [di+41h]
        push    ax
        callf   TEXT2_SEG:cmd_ratio_setup
        mov     bx, si
        add     bx, word ptr [PTR_TRACK_DATA]
        mov     es, word ptr [PTR_TRACK_DATA+2]
        shl     di, 4
        mov     al, byte ptr es:[bx+di]
        mov     byte ptr [bp-0dh], al
        push    ax
        push    5bh
        push    0ah
        callf   TEXT2_SEG:timer_value_read_2
        cmp     byte ptr [bp-0dh], 23h
        jae     br_056A6
        push    67h
        push    0ah
        push    ds
        push    P_2033
        callf   TEXT2_SEG:cmd_dispatch_1E
        jmp     br_056C3

br_056A6:
        mov     al, byte ptr [bp-0dh]
        sub     ah, ah
        push    ax
        call    track_calc_offset
        mov     es, dx
        mov     bx, ax
        push    word ptr es:[bx+PGM_PAD_SND_SEG]
        push    word ptr es:[bx]
        push    6dh
        push    0ah
        callf   TEXT2_SEG:timer_value_read_4

br_056C3:
        xor     bx, bx
        mov     word ptr [bp-10h], 13h
        mov     word ptr [bp-14h], di

loop_056CD:
        mov     word ptr [bp-6], 2bh
        mov     ax, word ptr [bp-14h]
        add     ax, bx
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-0ch], 4
        mov     word ptr [bp-12h], bx
loop_056E2:
        les     bx, [PTR_TRACK_DATA]
        mov     si, word ptr [bp-8]
        mov     al, byte ptr es:[bx+si]
        mov     byte ptr [bp-0dh], al
        sub     ah, ah
        push    ax
        mov     si, ax
        call    track_calc_offset
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        lea     ax, [si-23h]
        cmp     ax, 3fh
        ja      br_0574E
        les     bx, [bp-4]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+PGM_PAD_SND_SEG]
        mov     word ptr [bp-22h], ax
        mov     word ptr [bp-20h], dx
        or      dx, ax
        je      br_05732
        push    8
        push    word ptr [bp-20h]
        push    ax
        lea     ax, [bp-1eh]
        push    ss
        push    ax
        nop
        push    cs
        call    __fstrncpy
        add     sp, 0ah
        mov     byte ptr [bp-16h], 0
        jmp     br_0573E

br_05732:
        lea     di, [bp-1eh]
        mov     si, P_2035
        mov     ax, ss
        mov     es, ax
        movsw
        movsb

br_0573E:
        push    word ptr [bp-10h]
        push    word ptr [bp-6]
        lea     ax, [bp-1eh]
        push    ss
        push    ax
        callf   TEXT2_SEG:cmd_dispatch_1E

br_0574E:
        sub     word ptr [bp-6], 8
        add     word ptr [bp-8], 4
        dec     word ptr [bp-0ch]
        jne     loop_056E2
        add     word ptr [bp-10h], 36h
        mov     bx, word ptr [bp-12h]
        inc     bx
        cmp     bx, 4
        jge     X_0576B
        jmp     loop_056CD

X_0576B:
        callf   TEXT2_SEG:field_redraw
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h

X_05776:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        callf   TEXT2_SEG:note_release_latched
        push    ds
        push    TBL_WINKEYS_02038
        nop
        push    cs
        call    win_keys_merge
        nop
        push    cs
        call    pad_bank_get
        cbw
        mov     cl, byte ptr [G_PAD_INDEX]
        shr     cl, 4
        sub     ch, ch
        cmp     ax, cx
        je      br_057AE
        mov     al, byte ptr [G_PAD_INDEX]
        shr     al, 4
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    int3F_wrapper
        add     sp, 2

br_057AE:
        call    L_054DC
        pop     ds
        retf
        db      00h

; misnomer: LCD field renderer. looks up current track.
track_calc_offset2:
        push    bp
        mov     bp, sp
        imul    ax, word ptr [bp+4], PGM_PAD_STRIDE
        add     ax, word ptr [PGM_CURRENT]
        mov     dx, word ptr [PGM_CURRENT+2]
        sub     ax, PGM_PAD_BIAS
        leave
        ret     2
timer_dma_sync:
        enter   8, 0
        push    di
        push    si
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset2
        mov     di, ax
        mov     word ptr [bp-6], dx
        mov     al, byte ptr [PARAMS_CURSOR]
        cbw
        cmp     ax, 8
        ja      X_05802
        add     ax, ax
        xchg    bx, ax
        jmp     word ptr cs:[bx+X_057F0]
        db      90h

X_057F0:
        dw      X_0592C, X_0580A, L_05834_1, X_05852
        dw      X_0586E, X_05890, X_058B0, X_058D0
        dw      X_058FC

X_05802:
        mov     byte ptr [PARAMS_CURSOR], 0
        jmp     X_0592C

X_0580A:
; ? misnomer: a mode dispatcher, not DMA sync.  Looks up the current track.
        mov     si, L_05D2A
        mov     dx, TEXT1_SEG
        mov     word ptr [bp-2], dx
        lea     ax, [di+0fh]
        push    word ptr [bp-6]
        push    ax
        push    0
        push    64h
        push    3
        push    2ch
        push    16h

X_05824:
        push    0
        push    0
        push    0
        push    0
        callf   TEXT2_SEG:status_read_6A_3
        jmp     NEAR X_0591E

L_05834_1:
        mov     ax, L_05D2A
        mov     dx, TEXT1_SEG
        mov     si, ax
        mov     word ptr [bp-2], dx
        lea     ax, [di+10h]
        push    word ptr [bp-6]
        push    ax
        push    0
        push    64h
        push    3
        push    2ch
        push    1fh
        jmp     SHORT X_05824

X_05852:
        mov     si, L_05D2A
        mov     dx, TEXT1_SEG
        mov     word ptr [bp-2], dx
        lea     ax, [di+11h]
        push    word ptr [bp-6]
        push    ax
        push    1
        push    2ch
        push    28h
        push    6
        jmp     NEAR X_05915
        db      90h

X_0586E:
        mov     ax, T1_L_06702
        mov     dx, TEXT1_SEG
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    ds
        push    G_PAD_NOTE_BASE
        push    4ah
        push    2
        push    0
        callf   TEXT2_SEG:timer_value_read_1
        mov     byte ptr [WIN_FIELD_BOX_W], 0a6h
        jmp     NEAR X_0591E

X_05890:
        mov     ax, L_05FC0
        mov     dx, TEXT1_SEG
        mov     si, ax
        mov     word ptr [bp-2], dx
        lea     ax, [di+12h]
        push    word ptr [bp-6]
        push    ax
        push    0
        push    64h
        push    3
        push    0a4h
        push    19h
        jmp     NEAR X_05824

X_058B0:
        mov     ax, L_05FC0
        mov     dx, TEXT1_SEG
        mov     si, ax
        mov     word ptr [bp-2], dx
        lea     ax, [di+13h]
        push    word ptr [bp-6]
        push    ax
        push    0
        push    0fh
        push    2
        push    0aah
        push    24h
        jmp     NEAR X_05824

X_058D0:
        mov     si, L_0620E
        mov     dx, TEXT1_SEG
        mov     word ptr [bp-2], dx
        lea     ax, [di+0dh]
        push    word ptr [bp-6]
        push    ax
        push    word -TUNE_MAX
        push    word TUNE_MAX
        push    3
        push    0dch
        push    0ch
        push    0
        push    0
        push    0
        push    0
        callf   TEXT2_SEG:status_read_6A_2
        jmp     SHORT X_0591E

X_058FC:
        mov     si, L_063DE
        mov     dx, TEXT1_SEG
        mov     word ptr [bp-2], dx
        lea     ax, [di+0ah]
        push    word ptr [bp-6]
        push    ax
        push    2
        push    0beh
        push    28h
        push    9

X_05915:
        push    0
        push    0
        callf   TEXT2_SEG:voice_trigger_full

X_0591E:
        push    word ptr [bp-2]
        push    si
        callf   TEXT2_SEG:install_handler_15
        pop     si
        pop     di
        leave
        ret
        db      90h

X_0592C:
        push    ds
        push    PGM_SLOT
        push    1
        push    1ah
        push    2
        push    TEXT2_SEG
        push    L_05EEE
        push    word TEXT1_SEG
        push    L_06570
        callf   TEXT2_SEG:seq_write_data
        mov     byte ptr [WIN_FIELD_BOX_W], 0ch
        pop     si
        pop     di
        leave
        ret

X_05950:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [PARAMS_CURSOR]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+P_2124]
        mov     byte ptr [PARAMS_CURSOR], al
        call    timer_dma_sync
        pop     ds
        retf

L_05968:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [PARAMS_CURSOR]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+TBL_PARAMS_NAV_DOWN]
        mov     byte ptr [PARAMS_CURSOR], al
        call    timer_dma_sync
        pop     ds
        retf

L_05980:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [PARAMS_CURSOR]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+TBL_PARAMS_NAV_LEFT]
        mov     byte ptr [PARAMS_CURSOR], al
        call    timer_dma_sync
        pop     ds
        retf

L_05998:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [PARAMS_CURSOR]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+TBL_PARAMS_NAV_RIGHT]
        mov     byte ptr [PARAMS_CURSOR], al
        call    timer_dma_sync
        pop     ds
        retf

; ? 10h-stride PTR_TRACK_DATA lookup; a note in 23h..62h goes to
; G_PAD_NOTE_BASE.  no port I/O.
pad_note_select:
        enter   2, 0
        push    di

L_059B5:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     si, ax
        or      al, al
        je      br_059F1
        nop
        push    cs
        call    pad_bank_get
        cbw
        mov     bx, ax
        shl     bx, 4
        mov     ax, si
        mov     al, ah
        sub     ah, ah
        add     bx, ax
        les     di, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+di]
        mov     byte ptr [bp-1], al
        cbw
        sub     ax, 23h
        cmp     ax, 3fh
        ja      br_059F1
        mov     al, byte ptr [bp-1]
        mov     byte ptr [G_PAD_NOTE_BASE], al
        call    timer_dma_sync
br_059F1:
        pop     ds
        pop     si
        pop     di
        leave
        retf
; ? misnomer: an LCD field renderer.  Looks up the current track.
timer_poll_wait_3:
        enter   8, 0

pgm_params_draw:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset2
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    ds
        push    DL_PGM_PARAMS
        nop
        push    cs
        call    disp_list_run
        push    27h
        callf   TEXT2_SEG:ui_row_request
        push    1ah
        push    2
        mov     al, byte ptr [PGM_SLOT]
        cbw
        inc     ax
        cwd
        push    dx
        push    ax
        push    2
        callf   TEXT2_SEG:draw_unsigned_value
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        push    ax
        push    4ah
        push    2
        callf   TEXT2_SEG:timer_value_read_3
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+PGM_PAD_SND_SEG]
        push    word ptr es:[si]
        push    74h
        push    2
        callf   TEXT2_SEG:timer_value_read_4
        RUN_DRAW_PAD_FIELD    2ch,16h,PGM_PAD_ATTACK
        RUN_DRAW_PAD_FIELD    2ch,1fh,PGM_PAD_DECAY
        push    2ch
        push    28h
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+PGM_PAD_DCY_MODE]
        cbw
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        add     ax, ax
        add     ax, TBL_DECAY_MODE_LABELS
        push    ds
        push    ax
        callf   TEXT2_SEG:cmd_dispatch_1E
        RUN_DRAW_PAD_FIELD    0a4h,19h,PGM_PAD_FLT_FREQ
        push    0aah
        push    24h
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+PGM_PAD_FLT_RES]
        cbw
        cwd
        push    dx
        push    ax
        push    2
        callf   TEXT2_SEG:draw_unsigned_value
        push    0dch
        push    0ch
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+PGM_PAD_TUNE]
        cwd
        push    dx
        push    ax
        push    3
        callf   TEXT2_SEG:draw_signed_value
        push    0beh
        push    28h
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+PGM_PAD_VOICE]
        cbw
        mov     cx, ax
        shl     ax, 3
        add     ax, cx
        add     ax, TBL_VOICE_OVERLAP_LABELS
        push    ds
        push    ax
        callf   TEXT2_SEG:cmd_dispatch_1E
        push    4bh
        push    0fh
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+PGM_PAD_ATTACK]
        cbw
        push    ax
        mov     al, byte ptr es:[si+PGM_PAD_DECAY]
        cbw
        push    ax
        mov     al, byte ptr es:[si+PGM_PAD_DCY_MODE]
        cbw
        push    ax
        callf   TEXT2_SEG:seq_transfer_io
        callf   TEXT2_SEG:field_redraw
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+PGM_PAD_SND_SEG]
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      X_05B3C
        mov     dx, word ptr [bp-6]
        mov     word ptr [SND_CURRENT], ax
        mov     word ptr [SND_CURRENT+2], dx

X_05B3C:
        pop     ds
        pop     si
        leave
        retf

pgm_params_enter:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, 1
        mov     byte ptr [G_NOTE_CAPTURE], al
        mov     byte ptr [PAD_INPUT_MODE], al
        mov     byte ptr [G_PGM_RETURN_PARAMS], al
        callf   TEXT2_SEG:note_release_latched
        push    ds
        push    P_2208
        nop
        push    cs
        call    win_keys_merge
        call    timer_dma_sync
        pop     ds
        retf
velo_mod_arm_field:
        push    si
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset2
        mov     si, ax
        mov     al, byte ptr [VELO_MOD_CURSOR]
        cbw
        or      ax, ax
        je      br_05B8C
        dec     ax
        je      br_05BD8
        dec     ax
        je      br_05BA2
        dec     ax
        je      br_05BB4
        dec     ax
        je      br_05BC6
        mov     byte ptr [VELO_MOD_CURSOR], 1
        jmp     br_05BD8
        db      90h
br_05B8C:
        push    ds
        push    G_PAD_NOTE_BASE
        push    37h
        push    0bh
        push    0
        callf   TEXT2_SEG:timer_value_read_1
        mov     byte ptr [WIN_FIELD_BOX_W], 0a2h
        pop     si
        ret
br_05BA2:
        lea     ax, [si+19h]
        push    dx
        push    ax
        push    0
        push    64h
        push    3
        push    67h
        push    21h
        jmp     X_05BE7
        db      90h
br_05BB4:
        lea     ax, [si+17h]
        push    dx
        push    ax
        push    0
        push    64h
        push    3
        push    67h
        push    2bh
        jmp     X_05BE7
        db      90h

br_05BC6:
        push    ds
        push    G_VELOCITY_MAX
        push    1
        push    7fh
        push    3
        push    0c7h
        push    28h
        jmp     X_05BE7
        db      90h

br_05BD8:
        lea     ax, [si+18h]
        push    dx
        push    ax
        push    0
        push    64h
        push    3
        push    67h
        push    17h
X_05BE7:
        push    0
        push    0
        push    0
        push    0
        callf   TEXT2_SEG:status_read_6A_3
        pop     si
        ret

X_05BF6:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [VELO_MOD_CURSOR], 0
        jle     X_05C07
        dec     byte ptr [VELO_MOD_CURSOR]

X_05C07:
        call    velo_mod_arm_field
        pop     ds
        retf

X_05C0C:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [VELO_MOD_CURSOR], 4
        jge     br_05C1D
        inc     byte ptr [VELO_MOD_CURSOR]

br_05C1D:
        call    velo_mod_arm_field
        pop     ds
        retf

; ? pad_note_select family (note/pad-trigger); misnomer
; timer poll? looks up current track, dispatches.
timer_status_handler:
        enter   2, 0
        push    di

L_05C27:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     si, ax
        or      al, al
        je      br_05C68
        nop
        push    cs
        call    pad_bank_get
        cbw
        mov     bx, ax
        shl     bx, 4
        mov     ax, si
        mov     al, ah
        sub     ah, ah
        add     bx, ax
        les     di, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+di]
        mov     byte ptr [bp-1], al
        cbw
        sub     ax, 23h
        cmp     ax, 3fh
        ja      br_05C68
        mov     al, byte ptr [bp-1]
        mov     byte ptr [G_PAD_NOTE_BASE], al
        mov     ax, si
        mov     byte ptr [G_VELOCITY_MAX], al
        call    velo_mod_arm_field
br_05C68:
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h

; ? misnomer: LCD field renderer for a track-parameter screen.
timer_status_check_1:
        enter   8, 0

L_05C72:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset2
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    ds
        push    DL_VELOCITY_MODULATION
        nop
        push    cs
        call    disp_list_run
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        push    ax
        push    37h
        push    0bh
        callf   TEXT2_SEG:timer_value_read_3
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+PGM_PAD_SND_SEG]
        push    word ptr es:[si]
        push    61h
        push    0bh
        callf   TEXT2_SEG:timer_value_read_4
        RUN_DRAW_PAD_FIELD    67h,17h,PGM_PAD_V_ATTACK
        RUN_DRAW_PAD_FIELD    67h,21h,PGM_PAD_V_START
        push    67h
        push    2bh
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+PGM_PAD_V_LEVEL]
        cbw
        cwd
        push    dx
        push    ax
; writes [8CA0h] and [8CA2h]
state_write_handler:
        push    3
        callf   TEXT2_SEG:draw_unsigned_value
        push    0c7h
        push    28h
        mov     al, byte ptr [G_VELOCITY_MAX]
        sub     ah, ah
        push    0
        push    ax
        push    3
        callf   TEXT2_SEG:draw_unsigned_value
        callf   TEXT2_SEG:field_redraw
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      L_05D26
        mov     dx, word ptr [bp-6]
        mov     word ptr [SND_CURRENT], ax
        mov     word ptr [SND_CURRENT+2], dx

L_05D26:
        pop     ds
        pop     si
        leave
        retf

L_05D2A:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        callf   TEXT2_SEG:note_release_latched
        push    ds
        push    P_22C6
        nop
        push    cs
        call    win_keys_merge
        cmp     byte ptr [G_VELOCITY_MAX], 7fh
        jbe     br_05D4A
        mov     byte ptr [G_VELOCITY_MAX], 7fh

br_05D4A:
        call    velo_mod_arm_field
        pop     ds
        retf
        db      00h
; scsi_command_dispatcher @0x060b0 mid-instruction (no
; entry point); misnomer timer poll? looks up current
; track.
timer_poll_wait_4:
        enter   4, 0
        push    si
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset2
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     al, byte ptr [VELO_FILTER_CURSOR]
        cbw
        cmp     ax, 5
        ja      br_05D80
        add     ax, ax
        xchg    bx, ax
        jmp     word ptr cs:[bx+L_05D74]

L_05D74:
        dw      X_05D88, X_05DE8, X_05DA0, X_05DB2
        dw      L_05DC4_1, L_05DD6_1

br_05D80:
        mov     byte ptr [VELO_FILTER_CURSOR], 1
        jmp     X_05DE8
        db      90h

X_05D88:
        push    ds
        push    G_PAD_NOTE_BASE
        push    37h
        push    0bh
        push    0
        callf   TEXT2_SEG:timer_value_read_1
        mov     byte ptr [WIN_FIELD_BOX_W], 0a2h
        pop     si
        leave
        ret
        db      90h

X_05DA0:
        lea     ax, [si+15h]
        push    dx
        push    ax
        push    0
        push    64h
        push    3
        push    3dh
        push    21h
        jmp     SHORT X_05DF9
        db      90h

X_05DB2:
        lea     ax, [si+16h]
        push    dx
        push    ax
        push    0
        push    64h
        push    3
        push    3dh
        push    2bh
        jmp     SHORT X_05DF9
        db      90h

L_05DC4_1:
        lea     ax, [si+1ah]
        push    dx
        push    ax
        push    0
        push    64h
        push    3
        push    0d3h
        push    1ch
        jmp     SHORT X_05DF9

L_05DD6_1:
        push    ds
        push    G_VELOCITY_MAX
        push    1
        push    7fh
        push    3
        push    0d3h
        push    28h
        jmp     SHORT X_05DF9
        db      90h

X_05DE8:
        lea     ax, [si+PGM_PAD_FENV_ATTACK]
        push    word ptr [bp-2]
        push    ax
        push    0
        push    64h
        push    3
        push    3dh
        push    17h
X_05DF9:
        push    0
        push    0
        push    0
        push    0
        callf   TEXT2_SEG:status_read_6A_3
        pop     si
        leave
        ret
        db      00h

X_05E0A:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [VELO_FILTER_CURSOR], 4
        jne     br_05E1E
        mov     byte ptr [VELO_FILTER_CURSOR], 0
        jmp     X_05E29

br_05E1E:
        cmp     byte ptr [VELO_FILTER_CURSOR], 0
        jle     X_05E29
        dec     byte ptr [VELO_FILTER_CURSOR]

X_05E29:
        call    timer_poll_wait_4
        pop     ds
        retf

X_05E2E:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [VELO_FILTER_CURSOR], 5
        jge     X_05E3F
        inc     byte ptr [VELO_FILTER_CURSOR]

X_05E3F:
        call    timer_poll_wait_4
        pop     ds
        retf

X_05E44:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [VELO_FILTER_CURSOR], 3
        jle     X_05E56
        sub     byte ptr [VELO_FILTER_CURSOR], 2

X_05E56:
        call    timer_poll_wait_4
        pop     ds
        retf
        db      00h

X_05E5C:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [VELO_FILTER_CURSOR]
        cbw
        dec     ax
        jl      br_05E81
        jo      br_05E81
        dec     ax
        jle     br_05E74
        dec     ax
        je      L_05E7C
        jmp     br_05E81
        db      90h

br_05E74:
        mov     byte ptr [VELO_FILTER_CURSOR], 4
        jmp     br_05E81
        db      90h

L_05E7C:
        mov     byte ptr [VELO_FILTER_CURSOR], 5

br_05E81:
        call    timer_poll_wait_4
        pop     ds
        retf

; ? as pad_note_select, also sets G_VELOCITY_MAX.
pad_note_select_2:
        enter   2, 0
        push    di

L_05E8B:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     si, ax
        or      al, al
        je      br_05ECC
        nop
        push    cs
        call    pad_bank_get
        cbw
        mov     bx, ax
        shl     bx, 4
        mov     ax, si
        mov     al, ah
        sub     ah, ah
        add     bx, ax
        les     di, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+di]
        mov     byte ptr [bp-1], al
        cbw
        sub     ax, 23h
        cmp     ax, 3fh
        ja      br_05ECC
        mov     al, byte ptr [bp-1]
        mov     byte ptr [G_PAD_NOTE_BASE], al
        mov     ax, si
        mov     byte ptr [G_VELOCITY_MAX], al
        call    timer_poll_wait_4
br_05ECC:
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h

; ? as timer_status_check_1, different fields.
timer_status_check_2:
        enter   8, 0

L_05ED6:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset2
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    ds
        push    DL_VELO_ENV_FILTER
        nop
        push    cs
        call    disp_list_run
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        push    ax
        push    37h
        push    0bh
        callf   TEXT2_SEG:timer_value_read_3
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+PGM_PAD_SND_SEG]
        push    word ptr es:[si]
        push    61h
        push    0bh
        callf   TEXT2_SEG:timer_value_read_4
        RUN_DRAW_PAD_FIELD    3dh,17h,PGM_PAD_FENV_ATTACK
        RUN_DRAW_PAD_FIELD    3dh,21h,PGM_PAD_FENV_DECAY
        RUN_DRAW_PAD_FIELD    3dh,2bh,PGM_PAD_FENV_AMOUNT
        RUN_DRAW_PAD_FIELD    0d3h,1ch,PGM_PAD_V_FREQ
        push    0d3h
        push    28h
        mov     al, byte ptr [G_VELOCITY_MAX]
        sub     ah, ah
        push    0
        push    ax
        push    3
        callf   TEXT2_SEG:draw_unsigned_value
        push    5bh
        push    15h
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+PGM_PAD_FENV_ATTACK]
        cbw
        push    ax
        mov     al, byte ptr es:[si+PGM_PAD_FENV_DECAY]
        cbw
        push    ax
        push    1
        callf   TEXT2_SEG:seq_transfer_io
        callf   TEXT2_SEG:field_redraw
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+PGM_PAD_SND_SEG]
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      L_05FBB
        mov     dx, word ptr [bp-6]
        mov     word ptr [SND_CURRENT], ax
        mov     word ptr [SND_CURRENT+2], dx

L_05FBB:
        pop     ds
        pop     si
        leave
        retf
        db      00h

L_05FC0:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        callf   TEXT2_SEG:note_release_latched
        push    ds
        push    P_2380
        nop
        push    cs
        call    win_keys_merge
        cmp     byte ptr [G_VELOCITY_MAX], 7fh
        jbe     br_05FE0
        mov     byte ptr [G_VELOCITY_MAX], 7fh

br_05FE0:
        call    timer_poll_wait_4
        pop     ds
        retf
        db      00h

velo_pitch_arm_field:
        push    si
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset2
        mov     si, ax
        mov     al, byte ptr [VELO_PITCH_CURSOR]
        cbw
        or      ax, ax
        je      br_0600A
        dec     ax
        je      X_0605E
        dec     ax
        je      br_06020
        dec     ax
        je      br_06040
        mov     byte ptr [VELO_PITCH_CURSOR], 1
        jmp     X_0605E

br_0600A:
        push    ds
        push    G_PAD_NOTE_BASE
        push    37h
        push    0bh
        push    0
        callf   TEXT2_SEG:timer_value_read_1
        mov     byte ptr [WIN_FIELD_BOX_W], 0a2h
        pop     si
        ret

br_06020:
        lea     ax, [si+1ch]
        push    dx
        push    ax
        push    -78h
        push    78h
        push    3
        push    0cdh
        push    1ch
        push    0
        push    0
        push    0
        push    0
        callf   TEXT2_SEG:field_register_s8
        pop     si
        ret
        db      90h

br_06040:
        push    ds
        push    G_VELOCITY_MAX
        push    1
        push    7fh
        push    3
        push    0cdh
        push    28h
        push    0
        push    0
        push    0
        push    0
        callf   TEXT2_SEG:status_read_6A_3
        pop     si
        ret

X_0605E:
        lea     ax, [si+0dh]
        push    dx
        push    ax
        push    word -TUNE_MAX
        push    word TUNE_MAX
        push    3
        push    61h
        push    1ch
        push    0
        push    0
        push    0
        push    0
        callf   TEXT2_SEG:status_read_6A_2
        pop     si
        ret

T1_L_0607E:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [VELO_PITCH_CURSOR]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+P_23C2]
        mov     byte ptr [VELO_PITCH_CURSOR], al
        call    velo_pitch_arm_field
        pop     ds
        retf

L_06096:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [VELO_PITCH_CURSOR]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+P_23C2+4]
        mov     byte ptr [VELO_PITCH_CURSOR], al
        call    velo_pitch_arm_field
        pop     ds
        retf

L_060AE:
        push    ds
; ? scsi_command_dispatcher @0x060b0 is mid-instruction
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [VELO_PITCH_CURSOR]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+P_23C2+8]
        mov     byte ptr [VELO_PITCH_CURSOR], al
        call    velo_pitch_arm_field
        pop     ds
        retf

L_060C6:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [VELO_PITCH_CURSOR]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+P_23CE]
        mov     byte ptr [VELO_PITCH_CURSOR], al
        call    velo_pitch_arm_field
        pop     ds
        retf

; ? as pad_note_select_2, a different notify call.
pad_note_select_3:
        enter   2, 0
        push    di

L_060E3:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     si, ax
        or      al, al
        je      br_06124
        nop
        push    cs
        call    pad_bank_get
        cbw
        mov     bx, ax
        shl     bx, 4
        mov     ax, si
        mov     al, ah
        sub     ah, ah
        add     bx, ax
        les     di, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+di]
        mov     byte ptr [bp-1], al
        cbw
        sub     ax, 23h
        cmp     ax, 3fh
        ja      br_06124
        mov     al, byte ptr [bp-1]
        mov     byte ptr [G_PAD_NOTE_BASE], al
        mov     ax, si
        mov     byte ptr [G_VELOCITY_MAX], al
        call    velo_pitch_arm_field
br_06124:
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h

; ? as timer_status_check_1, different fields.
timer_status_check_3:
        enter   4, 0
        push    di

L_0612F:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset2
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    ds
        push    DL_VELO_PITCH
        nop
        push    cs
        call    disp_list_run
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        push    ax
        push    37h
        push    0bh
        callf   TEXT2_SEG:timer_value_read_3
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+PGM_PAD_SND_SEG]
        push    word ptr es:[si]
        push    61h
        push    0bh
        callf   TEXT2_SEG:timer_value_read_4
        push    61h
        push    1ch
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+PGM_PAD_TUNE]
        cwd
        push    dx
        push    ax
        push    3
        callf   TEXT2_SEG:draw_signed_value
        push    0cdh
        push    1ch
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+PGM_PAD_V_PITCH]
        cbw
        cwd
        push    dx
        push    ax
        push    3
        callf   TEXT2_SEG:draw_signed_value
        push    0cdh
        push    28h
        mov     al, byte ptr [G_VELOCITY_MAX]
        sub     ah, ah
        push    0
        push    ax
        push    3
        callf   TEXT2_SEG:draw_unsigned_value
        mov     es, word ptr [bp-2]
        les     bx, es:[si]
        mov     al, byte ptr es:[bx+MPC_STATE_flag_12]
        cbw
        mov     es, word ptr [bp-2]
        add     ax, word ptr es:[si+PGM_PAD_TUNE]
        mov     di, ax
        cmp     ax, 0f0h
        jle     br_061C9
        mov     di, 0f0h

br_061C9:
        cmp     di, 0ff10h
        jge     br_061D2
        mov     di, 0ff10h

br_061D2:
        push    61h
        push    28h
        push    word ptr es:[si+PGM_PAD_SND_SEG]
        push    word ptr es:[si]
        push    di
        callf   TEXT2_SEG:sample_calc_offset
        push    ax
        callf   TEXT2_SEG:timer_value_read_5
        callf   TEXT2_SEG:field_redraw
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+PGM_PAD_SND_SEG]
        or      ax, word ptr es:[si]
        je      L_06208
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+PGM_PAD_SND_SEG]
        mov     word ptr [SND_CURRENT], ax
        mov     word ptr [SND_CURRENT+2], dx

L_06208:
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h

L_0620E:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        callf   TEXT2_SEG:note_release_latched
        push    ds
        push    P_243E
        nop
        push    cs
        call    win_keys_merge
        cmp     byte ptr [G_VELOCITY_MAX], 7fh
        jbe     br_0622E
        mov     byte ptr [G_VELOCITY_MAX], 7fh

br_0622E:
        call    velo_pitch_arm_field
        pop     ds
        retf
        db      00h

mute_assign_row_dispatch:
        push    si
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset2
        mov     si, ax
        MG_HOOK_ROW_DISPATCH

br_06256:
        push    ds
        push    G_PAD_NOTE_BASE
        push    37h
        push    0bh
        push    0
        jmp     X_06279

br_06262:
        lea     ax, [si+PGM_PAD_MUTE2]
        push    dx
        push    ax
        push    37h
        push    27h
        jmp     L_06277
        db      90h

L_0626E:
        lea     ax, [si+PGM_PAD_MUTE1]
        push    dx
; iterative port writes, sequencer/DMA config
io_port_write_loop:
        push    ax
        push    37h
        push    1eh

L_06277:
        push    1

X_06279:
        callf   TEXT2_SEG:timer_value_read_1
        mov     byte ptr [WIN_FIELD_BOX_W], 0a2h
        pop     si
        ret
        db      00h

X_06286:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_MUTE_ASSIGN_FIELD], 0
        jle     X_06297
        dec     byte ptr [G_MUTE_ASSIGN_FIELD]

X_06297:
        call    mute_assign_row_dispatch
        pop     ds
        retf

L_0629C:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        MG_HOOK_FIELD_CLAMP
        jge     br_062AD
        inc     byte ptr [G_MUTE_ASSIGN_FIELD]
br_062AD:
        call    mute_assign_row_dispatch
        pop     ds
        retf

; ? as pad_note_select, a different notify call.
pad_note_select_4:
        enter   2, 0
        push    di

L_062B7:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     si, ax
        or      al, al
        je      br_062F3
        nop
        push    cs
        call    pad_bank_get
        cbw
        mov     bx, ax
        shl     bx, 4
        mov     ax, si
        mov     al, ah
        sub     ah, ah
        add     bx, ax
        les     di, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+di]
        mov     byte ptr [bp-1], al
        cbw
        sub     ax, 23h
        cmp     ax, 3fh
        ja      br_062F3
        mov     al, byte ptr [bp-1]
; ? state_update_handler @0x062ef is mid-instruction
        mov     byte ptr [G_PAD_NOTE_BASE], al
        call    mute_assign_row_dispatch

br_062F3:
        pop     ds
        pop     si
        pop     di
        leave
        retf

track_calc_multi_2:
        enter   8, 0

L_062FC:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        call    track_calc_offset2
        mov     si, ax
        mov     word ptr [bp-6], dx
        push    ds
        push    DL_MUTE_ASSIGN
        nop
        push    cs
        call    disp_list_run
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        push    ax
        push    37h
        push    0bh
        callf   TEXT2_SEG:timer_value_read_3
        mov     es, word ptr [bp-6]
        push    word ptr es:[si+PGM_PAD_SND_SEG]
        push    word ptr es:[si]
        push    61h
        push    0bh
        callf   TEXT2_SEG:timer_value_read_4
        mov     es, word ptr [bp-6]
        mov     al, byte ptr es:[si+PGM_PAD_MUTE1]
        push    ax
; far-called from the EXE
disk_sector_read:
        push    37h
        push    1eh
        callf   TEXT2_SEG:timer_value_read_3
        mov     es, word ptr [bp-6]
        cmp     byte ptr es:[si+0bh], 23h
        jae     br_0635A
        xor     ax, ax
        cwd
        jmp     br_0636F
br_0635A:
        mov     al, byte ptr es:[si+0bh]
        sub     ah, ah
        push    ax
        call    track_calc_offset2
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx]

        mov     dx, word ptr es:[bx+PGM_PAD_SND_SEG]

br_0636F:
        push    dx
        push    ax
        push    61h
        push    1eh
        callf   TEXT2_SEG:timer_value_read_4
        mov     es, word ptr [bp-6]
        mov     al, byte ptr es:[si+0ch]
        push    ax
        push    37h
        push    27h
        callf   TEXT2_SEG:timer_value_read_3
        mov     es, word ptr [bp-6]
        cmp     byte ptr es:[si+0ch], 23h
        jae     br_0639A
        xor     ax, ax
        cwd
        jmp     br_063AF
br_0639A:
        mov     al, byte ptr es:[si+0ch]
        sub     ah, ah
        push    ax
        call    track_calc_offset2
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx]

        mov     dx, word ptr es:[bx+PGM_PAD_SND_SEG]

br_063AF:
        push    dx
        push    ax
        push    61h
        push    27h
        callf   TEXT2_SEG:timer_value_read_4
        MG_HOOK_REPAINT_FLUSH
        mov     es, word ptr [bp-6]
        mov     ax, word ptr es:[si+2]
        or      ax, word ptr es:[si]
        je      L_063D9
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     word ptr [SND_CURRENT], ax
        mov     word ptr [SND_CURRENT+2], dx

L_063D9:
        pop     ds
        pop     si
        leave
        retf
        db      00h

L_063DE:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        callf   TEXT2_SEG:note_release_latched
; far-called from the EXE
disk_sector_write:
        push    ds
        push    TBL_WINKEYS_MUTE_ASSIGN
        nop
        push    cs
        call    win_keys_merge
        call    mute_assign_row_dispatch
        pop     ds
        retf
        db      90h

program_arm_field:
        mov     al, byte ptr [P_2522]
        cbw
        or      ax, ax
        je      br_06448
        dec     ax
        je      br_06410
        dec     ax
        je      L_0641C
        dec     ax
        je      br_0642A
        mov     byte ptr [P_2522], 0
        jmp     br_06448

br_06410:
        push    ds
        push    PGM_CHANGE_RX
        push    1
        push    62h
        push    19h
        jmp     L_06452

L_0641C:
        push    ds
        push    MIDI_LOCAL_MODE
; classify the INT 40h error code, set the error state
disk_error_classify:
        push    1
        push    62h
        push    23h
        push    4
        jmp     X_06454

br_0642A:
        push    ds
        push    MIDI_VOLUME_VAL
        push    0
        push    7fh
        push    3
        push    0e0h
        push    0fh
        push    0
        push    0
        push    0
        push    0
        callf   TEXT2_SEG:status_read_6A_3
        ret
        db      90h

br_06448:
        push    ds
        push    MIDI_VOLUME_RX
        push    1
        push    62h
        push    0fh

L_06452:
        push    8

X_06454:
        push    0
        push    0
        callf   TEXT2_SEG:voice_trigger_full
        ret

pgm_midi_up:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [P_2522], 3
        je      X_06479
        cmp     byte ptr [P_2522], 0
        je      X_06479
        dec     byte ptr [P_2522]
        call    program_arm_field

X_06479:
        pop     ds
        retf
        db      00h

pgm_midi_down:
        push    ds
        mov     cx, DATA_SEG
; recalibrate after a seek error
disk_recalibrate:
        mov     ds, cx
        cmp     byte ptr [P_2522], 3
        jne     br_06490
        mov     byte ptr [P_2522], 1
        jmp     L_0649B

br_06490:
        cmp     byte ptr [P_2522], 2
        jge     X_0649E
        inc     byte ptr [P_2522]

L_0649B:
        call    program_arm_field

X_0649E:
        pop     ds
        retf

pgm_midi_left:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [P_2522], 3
        jne     X_064B5
        mov     byte ptr [P_2522], 0
        call    program_arm_field

X_064B5:
        pop     ds
        retf
        db      00h

t1_copy_pgm_cancel:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [P_2522], 3
        je      X_064CD
        mov     byte ptr [P_2522], 3
        call    program_arm_field

X_064CD:
        pop     ds
        retf
        db      00h

purge_midi:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        callf   TEXT2_SEG:note_release_latched
        mov     byte ptr [PAD_INPUT_MODE], 2
        push    ds
        push    TBL_WINKEYS_PGM_MIDI
        nop
        push    cs
        call    win_keys_merge
        mov     al, byte ptr [MIDI_VOLUME_VAL]
        mov     byte ptr [B_4FE4], al
        call    program_arm_field
        pop     ds
        retf

L_064F4:
        cmp     byte ptr [PROGRAM_CURSOR], 0
        je      L_0652A
        mov     ax, word ptr [PGM_CURRENT]
        mov     dx, word ptr [PGM_CURRENT+2]
        add     ax, 1ch
        push    dx
; hardware status flag
io_flag_set_handler:
        push    ax
        push    0
        push    7fh
        push    3
        push    0a9h
; FDC SEEK: move the head to a track
fdc_seek_handler:
        push    25h
        push    0
        push    0
        push    0
        push    0
        callf   TEXT2_SEG:timer_dma_ch2
        callf   TEXT2_SEG:far_02DD2
        callf   TEXT2_SEG:X_02D4A
        ret

L_0652A:
        mov     ax, word ptr [PGM_CURRENT]
        mov     dx, word ptr [PGM_CURRENT+2]
        add     ax, 2
        push    dx
        push    ax
        push    73h
        push    13h
        nop
        push    cs
        call    far_call_wrapper_1
        ret

X_06540:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [PROGRAM_CURSOR], 0
        je      X_06555
        mov     byte ptr [PROGRAM_CURSOR], 0
; ? midi_buffer_copy @0x06554 is mid-instruction
        call    L_064F4

X_06555:
        pop     ds
        retf
        db      00h

program_down:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
; ? fdc_format_verify @0x06560 is mid-instruction
        cmp     byte ptr [PROGRAM_CURSOR], 0
        jne     L_0656D
        mov     byte ptr [PROGRAM_CURSOR], 1
        call    L_064F4

L_0656D:
        pop     ds
        retf
        db      00h

L_06570:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        callf   TEXT2_SEG:note_release_latched
        push    ds
        push    P_2768
        nop
        push    cs
        call    win_keys_merge
        call    L_064F4
        push    0
        callf   TEXT2_SEG:int44_wrapper
        pop     ds
        retf

copy_program_arm_field:
        cmp     byte ptr [COPY_PGM_CURSOR], 0
        jne     X_065A6
        push    ds
        push    TBL_SOUND_NAMES
        push    7fh
        push    13h
        nop
        push    cs
; ? midi_status_sync @0x065a2 is mid-instruction
        call    far_call_wrapper_1
        ret
        db      90h

X_065A6:
        push    ds
        push    COPY_PGM_TO
        push    0
        push    7fh
        push    3
        push    0c1h
        push    25h
        push    0
        push    0
        push    0
        push    0
        callf   TEXT2_SEG:timer_dma_ch2
        callf   TEXT2_SEG:far_02DD2
        callf   TEXT2_SEG:X_02D4A
        ret
        db      00h

X_065CE:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [COPY_PGM_CURSOR], 0
        je      X_065E3
        mov     byte ptr [COPY_PGM_CURSOR], 0
        call    copy_program_arm_field

X_065E3:
        pop     ds
        retf
        db      00h

L_065E6:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [COPY_PGM_CURSOR], 0
        jne     X_065FB
        mov     byte ptr [COPY_PGM_CURSOR], 1
; validate a MIDI frame, checksum
midi_frame_validate:
        call    copy_program_arm_field

X_065FB:
        pop     ds
        retf
        db      00h

program_new:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        callf   TEXT2_SEG:int4B_wrapper
        or      ax, ax
        je      br_06618
        push    ds
        push    STR_CANT_CREATE_PLAYING
        callf   TEXT2_SEG:string_fill_stosb
        pop     ds
        retf

br_06618:
        push    ds
        push    TBL_SOUND_NAMES
        callf   TEXT2_SEG:far_059BC
        push    ax
        callf   TEXT2_SEG:_memcpy_2
        push    ds
        push    TBL_WINKEYS_0292E
        nop
        push    cs
        call    win_keys_merge
        call    copy_program_arm_field
        pop     ds
        retf
        db      00h

X_06636:
        push    ds
        push    G_COPY_DST_PGM
        push    0
        push    61h
        push    28h
        push    0
        push    0
        push    0
        push    0
        callf   TEXT2_SEG:seq_write_data
        ret

t1_program_copy:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        callf   TEXT2_SEG:int4B_wrapper
        or      ax, ax
        je      br_06668
        push    ds
        push    STR_CANT_COPY_PLAYING
        callf   TEXT2_SEG:string_fill_stosb
        pop     ds
        retf

br_06668:
        push    ds
        push    TBL_WINKEYS_COPY_PGM
        nop
        push    cs
        call    win_keys_merge
        mov     al, byte ptr [PGM_SLOT]
        mov     byte ptr [G_COPY_DST_PGM], al
        mov     byte ptr [G_COPY_SRC_PGM], al
        call    X_06636
        pop     ds
        retf
        db      00h

fn_06680:
        mov     al, byte ptr [G_COPY_NOTE_CURSOR]
        cbw
        or      ax, ax
        je      br_06698
        dec     ax
        je      br_066B0
        dec     ax
        je      br_066BA
        dec     ax
        je      br_066C6
        mov     byte ptr [G_COPY_NOTE_CURSOR], 3
        jmp     br_066C6

br_06698:
        push    ds
        push    G_COPY_SRC_PGM
        push    1
        push    55h
        push    0bh

loop_066A2:
        push    0
        push    0
        push    0
        push    0
        callf   TEXT2_SEG:seq_write_data
        ret

br_066B0:
        push    ds
        push    G_COPY_SRC_NOTE
        push    55h
        push    14h
        jmp     X_066CE

br_066BA:
        push    ds
        push    G_COPY_DST_PGM
        push    1
        push    55h
        push    20h
        jmp     loop_066A2

br_066C6:
        push    ds
        push    G_COPY_DST_NOTE
        push    55h
        push    29h

X_066CE:
        push    0
        callf   TEXT2_SEG:timer_value_read_1
        ret

X_066D6:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_COPY_NOTE_CURSOR], 0
        jle     X_066E7
        dec     byte ptr [G_COPY_NOTE_CURSOR]

X_066E7:
        call    fn_06680
        pop     ds
        retf

X_066EC:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_COPY_NOTE_CURSOR], 3
        jge     L_066FD
        inc     byte ptr [G_COPY_NOTE_CURSOR]

L_066FD:
        call    fn_06680
        pop     ds
        retf

T1_L_06702:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        callf   TEXT2_SEG:note_release_latched
        push    ds
        push    TBL_COPY_NOTE_PARAMS_KEYS
        nop
        push    cs
        call    win_keys_merge
        mov     al, byte ptr [PGM_SLOT]
        mov     byte ptr [G_COPY_SRC_PGM], al
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        mov     byte ptr [G_COPY_SRC_NOTE], al
        mov     ax, word ptr [G_COPY_SRC_PGM]
        mov     word ptr [G_COPY_DST_PGM], ax
        call    fn_06680
        pop     ds
        retf
        db      90h
io_near_stub:
        enter   2, 0
        mov     al, byte ptr [G_SAMPLE_MODE]
        mov     byte ptr [bp-1], al
        cmp     al, byte ptr [G_SAMPLE_MODE_PREV]
        jne     br_06742
        xor     ax, ax
        leave
        ret
br_06742:
        mov     al, byte ptr [bp-1]
        cbw
        or      ax, ax
        je      br_06772
        dec     ax
        je      midi_port_read2
        dec     ax
        je      br_06766
        dec     ax
        je      br_0676C
        mov     word ptr [G_ERRNO], ERR_INTERNAL

        callf   TEXT2_SEG:err_msg_report
        jmp     br_06772

midi_port_read2:
        call    X_0769E
        jmp     br_06775
        db      90h

br_06766:
        call    fn_076E2
        jmp     br_06775
        db      90h

br_0676C:
        call    lcd_block_copy
        jmp     br_06775
        db      90h

br_06772:
        call    fn_0761C

br_06775:
        mov     al, byte ptr [bp-1]
        mov     byte ptr [G_SAMPLE_MODE_PREV], al
        callf   TEXT2_SEG:cmd_far_stub2
        mov     ax, 1
        leave
        ret
        db      00h

fn_06786:
        push    di
        call    fn_06EF2
        xor     ax, ax
        mov     cx, 400h
        mov     di, BUF_XFER
        push    ds
        pop     es
        rep stosw
        call    dma_06F0C
        or      ax, ax
        je      br_067A3
        call    smem_audio_init
        call    dac_out_program

br_067A3:
        pop     di
        ret
        db      00h

far_067A6:
        mov     byte ptr [SAMPLE_INPUT], 0
        call    fn_06786
        xor     al, al
        mov     byte ptr [G_SAMPLE_MODE], al
        mov     byte ptr [REC_CURSOR], al
        mov     word ptr [G_ERRNO], ERR_NO_DIGITAL_CARRIER
        callf   TEXT2_SEG:err_msg_report
        retf

fn_067C2:
        cmp     byte ptr [SAMPLE_INPUT], 0
        je      br_067FC
        callf   TEXT2_SEG:L_00106
        or      ax, ax
        je      br_067FC
        cmp     byte ptr [G_SAMPLE_MODE], 0
        je      br_067E7
        cmp     byte ptr [G_SAMPLE_MODE], 2
        je      br_067E7
        cmp     byte ptr [G_SAMPLE_MODE], 1
        jne     br_067FC
br_067E7:
        push    0
        push    0
        nop
        push    cs
        call    callback_set_main
        add     sp, 4
        nop
        push    cs
        call    far_067A6
        mov     ax, 1
        ret

br_067FC:
        xor     ax, ax
        ret
        db      00h

; ? no port I/O: sign-adjusted divide-by-4 of a param.
io_ctrl_setup:
        push    bp
        mov     bp, sp
        mov     bx, word ptr [bp+4]
        cmp     bx, -23h
        jg      br_0681E

L_0680B:
        mov     ax, bx
        cwd
        and     dx, 3
        add     ax, dx
        sar     ax, 2
        add     ax, 0fh

L_06819:
        leave
        ret     2
        db      90h

br_0681E:
        cmp     bx, -11h
        jg      br_06832
        mov     ax, bx
        cwd
        sub     ax, dx
        sar     ax, 1
        add     ax, 19h
        leave
        ret     2
        db      90h

br_06832:
        lea     ax, [bx+21h]
        leave
        ret     2
        db      00h

fn_0683A:
        push    si
        callf   TEXT2_SEG:X_00E76
        or      dx, dx
        jl      br_06866
        push    dx
        push    ax
        callf   TEXT2_SEG:samples_to_tenths
        mov     si, ax
        cmp     byte ptr [G_REC_MODE], 2
        jne     br_0685C
        mov     cx, 2
        cwd
        idiv    cx
        mov     si, ax

br_0685C:
        dec     si
        jns     br_06861
        xor     si, si

br_06861:
        mov     ax, si
        pop     si
        ret
        db      90h

br_06866:
        xor     ax, ax
        pop     si
        ret

fn_0686A:
        xor     ax, ax
        mov     word ptr [G_METER_R_PEAK], ax
        mov     word ptr [G_METER_L_PEAK], ax
        mov     word ptr [G_METER_R_LEVEL], ax
        mov     word ptr [G_METER_L_LEVEL], ax
        ret
        db      00h
io_write_caller:
        enter   4, 0
        push    si
        mov     byte ptr [bp-4], 28h
        mov     byte ptr [bp-3], 1eh
        mov     byte ptr [bp-2], 0cch
        mov     byte ptr [bp-1], 10h
        push    0
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        callf   TEXT2_SEG:string_copy_setup
        cmp     byte ptr [SAMPLE_THRESHOLD], 0c0h
; builds the 4-byte record 28h/1Eh/0CCh/10h, then far-calls TEXT2 03EEh.
        jle     L_068E3
        mov     al, byte ptr [SAMPLE_THRESHOLD]
        cbw
        push    ax
        call    io_ctrl_setup
        mov     si, ax
        cmp     byte ptr [G_REC_MODE], 1
        je      br_068C7
        add     ax, ax
        add     ax, si
        add     ax, ax
        add     ax, 28h
        push    ax
        push    1eh
        push    9
        callf   TEXT2_SEG:cmd_ratio_setup

br_068C7:
        cmp     byte ptr [G_REC_MODE], 0
        je      L_068E3
        mov     ax, si
        add     si, si
        add     si, ax
        add     si, si
        add     si, 28h
        push    si
        push    27h
        push    9
        callf   TEXT2_SEG:cmd_ratio_setup

L_068E3:
        push    1
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        callf   TEXT2_SEG:string_copy_setup
        cmp     byte ptr [G_REC_MODE], 1
        je      br_0690F
        mov     ax, word ptr [G_METER_L_PEAK]
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        add     ax, ax
        add     ax, 28h
        push    ax

L_06906:
        push    1eh
        push    0bh
        callf   TEXT2_SEG:cmd_ratio_setup

br_0690F:
        cmp     byte ptr [G_REC_MODE], 0
        je      br_0692E
        mov     ax, word ptr [G_METER_R_PEAK]
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        add     ax, ax
        add     ax, 28h
        push    ax
        push    27h
        push    0bh
        callf   TEXT2_SEG:cmd_ratio_setup
br_0692E:
        push    2
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        callf   TEXT2_SEG:string_copy_setup
        cmp     byte ptr [G_REC_MODE], 1
        je      br_06961
        mov     bx, word ptr [G_METER_L_LEVEL]
        mov     byte ptr [bx+BUF_REC_METER_BAR], 0
        push    28h
        push    1eh
        push    ds
        push    BUF_REC_METER_BAR
        callf   TEXT2_SEG:cmd_dispatch_1E
        mov     bx, word ptr [G_METER_L_LEVEL]
        mov     byte ptr [bx+BUF_REC_METER_BAR], 0ah
br_06961:
        cmp     byte ptr [G_REC_MODE], 0
        je      br_06987
        mov     bx, word ptr [G_METER_R_LEVEL]
        mov     byte ptr [bx+BUF_REC_METER_BAR], 0
        push    28h
        push    27h
        push    ds
        push    BUF_REC_METER_BAR
        callf   TEXT2_SEG:cmd_dispatch_1E
        mov     bx, word ptr [G_METER_R_LEVEL]
        mov     byte ptr [bx+BUF_REC_METER_BAR], 0ah

br_06987:
        pop     si
        leave
        ret

; ? no port 0x18 access: envelope/level smoothing.
ctrl_port_18_write:
        push    bp
        mov     bp, sp
        push    si
        mov     cx, word ptr [bp+4]
        mov     si, cx
        sub     si, word ptr [W_2E2C]
        cmp     si, 32h
        jae     br_0699F
        jmp     br_06A5C

br_0699F:
        mov     word ptr [W_2E2C], cx
        callf   TEXT2_SEG:cmd_far_stub2
        cmp     si, 200h
        jbe     br_069B1
        mov     si, 200h

br_069B1:
        mov     ax, 200h
        sub     ax, si
        mov     cx, ax
        mul     word ptr [G_METER_L_LEVEL]
        shr     ax, 9
        mov     word ptr [G_METER_L_LEVEL], ax
        mov     ax, cx
        mul     word ptr [G_METER_R_LEVEL]
        shr     ax, 9
        mov     word ptr [G_METER_R_LEVEL], ax
        cmp     byte ptr [G_REC_MODE], 2
        jne     L_069FC
        mov     ax, word ptr [REC_PEAK_L]
        callf   TEXT2_SEG:X_03B24
        push    ax
        call    io_ctrl_setup
        mov     si, ax
        cmp     word ptr [G_METER_L_PEAK], ax
        jge     br_069EC
        mov     word ptr [G_METER_L_PEAK], ax

br_069EC:
        inc     si
        cmp     si, word ptr [G_METER_L_LEVEL]
        jle     br_069F7
        mov     word ptr [G_METER_L_LEVEL], si

br_069F7:
        mov     ax, word ptr [REC_PEAK_R]
        jmp     L_06A32

L_069FC:
        cmp     byte ptr [G_REC_MODE], 0
        jne     br_06A28

L_06A03:
        mov     ax, word ptr [REC_PEAK_MONO]
        callf   TEXT2_SEG:X_03B24

L_06A0B:
        push    ax

L_06A0C:
        call    io_ctrl_setup
        mov     si, ax
        cmp     word ptr [G_METER_L_PEAK], ax

L_06A15:
        jge     L_06A1A
        mov     word ptr [G_METER_L_PEAK], ax

L_06A1A:
        inc     si
        cmp     si, word ptr [G_METER_L_LEVEL]

L_06A1F:
        jle     br_06A51
        mov     word ptr [G_METER_L_LEVEL], si
        jmp     br_06A51
        db      90h

br_06A28:
        cmp     byte ptr [G_REC_MODE], 1
        jne     br_06A51
        mov     ax, word ptr [REC_PEAK_MONO]

L_06A32:
        callf   TEXT2_SEG:X_03B24
        push    ax
        call    io_ctrl_setup
        mov     si, ax

L_06A3D:
        cmp     word ptr [G_METER_R_PEAK], ax
        jge     br_06A46

L_06A43:
        mov     word ptr [G_METER_R_PEAK], ax

br_06A46:
        inc     si
        cmp     si, word ptr [G_METER_R_LEVEL]
        jle     br_06A51
        mov     word ptr [G_METER_R_LEVEL], si

br_06A51:
        xor     ax, ax
        mov     word ptr [REC_PEAK_R], ax
        mov     word ptr [REC_PEAK_L], ax
        mov     word ptr [REC_PEAK_MONO], ax

br_06A5C:
        pop     si
        leave
        ret     2
        db      00h

X_06A62:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     byte ptr [P_0610], 0
        callf   TEXT2_SEG:dma_018ee
        callf   TEXT2_SEG:L_018D0
        push    0
        callf   TEXT2_SEG:int44_wrapper
        push    0
        push    0
        nop
        push    cs
        call    callback_set_main
        add     sp, 4
        xor     al, al
        mov     byte ptr [G_SAMPLE_MODE], al
        mov     byte ptr [G_SAMPLE_MODE_PREV], al
        mov     byte ptr [P_9D40], al
        callf   TEXT2_SEG:L_00116
        or      ax, ax
        jne     X_06AA3
        mov     byte ptr [SAMPLE_INPUT], 0

X_06AA3:
        callf   TEXT2_SEG:voice_release_all
        callf   TEXT2_SEG:L_00026
        call    fn_0761C
        pop     ds
        retf
smem_audio_init:
        enter   2ch, 0
        push    di
        xor     ax, ax
        mov     cx, 16h
        lea     di, [bp-2ch]
        push    ss
        pop     es
        rep stosw
        mov     word ptr [bp-28h], 100h
        mov     word ptr [bp-26h], 1000h
        mov     word ptr [bp-1eh], 1140h
        mov     word ptr [bp-20h], 0f000h
        mov     word ptr [bp-2ah], 1000h
        mov     word ptr [bp-24h], 1114h
        mov     word ptr [bp-22h], 10h
        push    ax
        lea     ax, [bp-2ch]
        push    ss
        push    ax
        push    1e06h
        callf   TEXT2_SEG:dma_field_write
        cmp     byte ptr [G_REC_MODE], 2
        jne     dma_06B19
        mov     word ptr [bp-2ah], 1114h
        mov     word ptr [bp-24h], 1228h
        mov     word ptr [bp-22h], 10h
        push    10h
        lea     ax, [bp-2ch]
        push    ss
        push    ax
        push    1e06h
        callf   TEXT2_SEG:dma_field_write

dma_06B19:
        mov     ax, 3
        mov     dx, 0c031h
        out     dx, al
        push    ds
        push    BUF_XFER
        nop
        push    cs
        call    smem_poll_ready
        mov     ax, 3ffh
        mov     dx, 0c032h
        out     dx, ax
        mov     ax, 59h
        mov     dx, 0c03ah
        out     dx, al
        push    8
        callf   TEXT2_SEG:mpc_poll_data2
        cmp     byte ptr [G_REC_MODE], 2
        jne     L_06B4A
        mov     ax, 58h
        jmp     L_06B4D

L_06B4A:
        mov     ax, 40h

L_06B4D:
        out     DMA_STATUS, ax

dma_06B4F:
        in      al, DMA_STATUS
        test    al, 80h
        jne     dma_06B4F
        pop     di
        leave
        ret

smem_write_sample:
        enter   10h, 0
        push    di
        push    si
        callf   TEXT2_SEG:smem_alloc_top
        mov     word ptr [REC_BUF_ADDR], ax
        mov     word ptr [REC_BUF_ADDR_HI], dx
        mov     al, byte ptr [SAMPLE_PREREC]
        sub     ah, ah
        imul    ax, ax, 1b9h
        mov     cx, 0ah
        sub     dx, dx
        div     cx
        mov     word ptr [REC_PREREC_LEN], ax
        sub     dx, dx
        mov     cx, ax
        mov     ax, 113ah
        mov     bx, dx
        mul     word ptr [SAMPLE_TIME]
        add     cx, ax
        adc     bx, dx
        mov     word ptr [REC_LENGTH], cx
        mov     word ptr [REC_LENGTH_HI], bx
        callf   TEXT2_SEG:X_00E76
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        cmp     byte ptr [G_REC_MODE], 2
        jne     br_06BAE
        sar     word ptr [bp-2], 1
        rcr     word ptr [bp-4], 1
br_06BAE:
        mov     ax, word ptr [REC_LENGTH]
        mov     dx, word ptr [REC_LENGTH_HI]
        cmp     word ptr [bp-2], dx
        jg      br_06BCE
        jl      br_06BC1
        cmp     word ptr [bp-4], ax
        jae     br_06BCE

br_06BC1:
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        mov     word ptr [REC_LENGTH], ax
        mov     word ptr [REC_LENGTH_HI], dx

br_06BCE:
        mov     ax, word ptr [REC_BUF_ADDR]
        mov     dx, word ptr [REC_BUF_ADDR_HI]
        and     byte ptr [REC_LENGTH], 0f0h
        add     ax, word ptr [REC_LENGTH]
        adc     dx, word ptr [REC_LENGTH_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        xor     ax, ax
        mov     cx, 16h
        mov     di, W_503E
        push    ds
        pop     es
        rep stosw
        mov     di, W_4FE6
        mov     si, P_2DDC
        mov     cx, 16h
        rep movsw
        mov     ax, word ptr [REC_PREREC_LEN]
        sub     dx, dx
        add     ax, word ptr [REC_BUF_ADDR]
        adc     dx, word ptr [REC_BUF_ADDR_HI]
        push    dx
        push    ax
        lea     ax, [bp-10h]
        push    ax
        callf   TEXT2_SEG:memcpy_far_seg
        push    ds
        lea     di, [bp-0ah]
        mov     si, ax
        push    ss
        pop     es
        push    ss
        pop     ds
        movsw
        movsw
        movsw
        pop     ds
        mov     ax, word ptr [bp-0ah]
        mov     word ptr [W_503E], ax
        mov     word ptr [W_4FE6], ax
        mov     ax, word ptr [bp-8]
        mov     word ptr [W_5040], ax
        mov     word ptr [W_4FE8], ax
        mov     ax, word ptr [bp-6]
        or      ah, 1
        mov     word ptr [W_5042], ax
        mov     word ptr [W_4FEA], ax
        mov     word ptr [W_5044], 1000h
        push    0
        push    10h
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    __aFldiv
        mov     word ptr [W_5046], ax
        mov     word ptr [W_5048], dx
        mov     word ptr [W_4FEE], ax
        mov     word ptr [W_4FF0], dx
        cmp     byte ptr [G_REC_MODE], 2
        je      dma_06C78
        mov     word ptr [W_5006], 8080h
        pop     si
        pop     di
        leave
        ret
        db      90h
dma_06C78:
        mov     word ptr [W_5006], 8000h
        xor     ax, ax
        mov     cx, 16h
        mov     di, W_506A
        push    ds
        pop     es
        rep stosw
        mov     di, W_5012
        mov     si, P_2DDC
        mov     cx, 16h
        rep movsw
        mov     ax, word ptr [REC_PREREC_LEN]
        sub     dx, dx
        add     ax, word ptr [bp-4]
        adc     dx, word ptr [bp-2]
        push    dx
        push    ax
        lea     ax, [bp-10h]
        push    ax
        callf   TEXT2_SEG:memcpy_far_seg
        push    ds
        lea     di, [bp-0ah]
        mov     si, ax
        push    ss
        pop     es
        push    ss
        pop     ds
        movsw
        movsw
        movsw
        pop     ds
        mov     ax, word ptr [bp-0ah]
        mov     word ptr [W_506A], ax
        mov     word ptr [W_5012], ax
        mov     ax, word ptr [bp-8]
        mov     word ptr [W_506C], ax
        mov     word ptr [W_5014], ax
        mov     ax, word ptr [bp-6]
        or      ah, 1
        mov     word ptr [W_506E], ax
        mov     word ptr [W_5016], ax
        mov     word ptr [W_5070], 1000h
        mov     ax, 0ffffh
        mov     dx, 1fh
        mov     word ptr [W_5072], ax
        mov     word ptr [W_5074], dx
        mov     word ptr [W_501A], ax
        mov     word ptr [W_501C], dx
        mov     word ptr [W_5032], 80h
        pop     si
        pop     di
        leave
        ret
        db      00h
dma_06CFC:
        callf   TEXT2_SEG:mpc_poll_status
        xor     ax, ax
        out     DMA_CTRL, ax
        in      ax, DMA_DATA_LO
        shr     ax, 0ch
        mov     cx, ax
        in      ax, DMA_DATA_HI
        shl     ax, 4
        or      cx, ax
        mov     word ptr [REC_DMA_POS], cx
        push    0
        push    ds
        push    W_503E
        push    1e06h
        callf   TEXT2_SEG:dma_field_write
        cmp     byte ptr [G_REC_MODE], 2
        jne     dma_06D3A
        push    10h
        push    ds
        push    W_506A
        push    1e06h
        callf   TEXT2_SEG:dma_field_write
dma_06D3A:
        mov     dx, 0c03fh
        in      al, dx
        and     ax, 0f7h
        out     dx, al
        in      al, DMA_STATUS
        mov     ah, 1
        out     DMA_STATUS, ax

dma_06D48:
        in      al, DMA_STATUS
        test    al, 80h
        jne     dma_06D48
        ret
        db      00h

; ? programs register sets 15h, 17h and 1..8 via lcd_write_cmd from
; 2Ch-byte template and per-channel routing table, then dma_status_rearm.
dac_out_program:
        enter   2ch, 0
        push    di
        push    si
        cmp     byte ptr [SAMPLE_MONITOR], 0
        jne     dma_06D60
        jmp     br_06E95

dma_06D60:
        lea     di, [bp-2ch]
        mov     si, P_2DDC
        mov     ax, ss
        mov     es, ax
        mov     cx, 16h
        rep movsw
        mov     word ptr [bp-2ah], 1000h
        mov     word ptr [bp-24h], 1114h
        mov     word ptr [bp-22h], 10h
        cmp     byte ptr [G_REC_MODE], 2
        je      dma_06D88
        jmp     dma_06E3A
dma_06D88:
        mov     word ptr [bp-0ah], 0
        mov     word ptr [bp-0ch], 8000h
        push    15h
        lea     ax, [bp-2ch]
        push    ss
        push    ax
        push    1ffeh
        callf   TEXT2_SEG:dma_field_write
        cmp     byte ptr [P_03C7], 0
        je      dma_06DD7
        mov     word ptr [bp-0ah], 4000h
        mov     si, 1
dma_06DB0:
        mov     word ptr [bp-0ch], 0
        and     byte ptr [bp-0ah], 0f0h
        mov     al, byte ptr [si+TBL_0C38]
        cbw
        or      word ptr [bp-0ah], ax
        push    si
        lea     ax, [bp-2ch]
        push    ss
        push    ax
        push    1ffeh
        callf   TEXT2_SEG:dma_field_write
        add     si, 2
        cmp     si, 7
        jle     dma_06DB0
dma_06DD7:
        mov     word ptr [bp-2ah], 1114h
        mov     word ptr [bp-24h], 1228h
        mov     word ptr [bp-22h], 10h
        mov     word ptr [bp-0ah], 0
        mov     word ptr [bp-0ch], 80h
        push    17h
        lea     ax, [bp-2ch]
        push    ss
        push    ax
        push    1ffeh
        callf   TEXT2_SEG:dma_field_write
        cmp     byte ptr [P_03C7], 0
        jne     dma_06E09
        jmp     smem_dma_clear_go

dma_06E09:
        mov     word ptr [bp-0ch], 0
        mov     word ptr [bp-0ah], 4000h
        mov     si, 2

dma_06E16:
        and     byte ptr [bp-0ah], 0f0h
        mov     al, byte ptr [si+TBL_0C38]
        cbw
        or      word ptr [bp-0ah], ax
        push    si
        lea     ax, [bp-2ch]
        push    ss
        push    ax
        push    1ffeh
        callf   TEXT2_SEG:dma_field_write
        add     si, 2
        cmp     si, 8
        jle     dma_06E16
        jmp     smem_dma_clear_go
dma_06E3A:
        mov     word ptr [bp-0ah], 0
        mov     word ptr [bp-0ch], 8080h
        push    15h
        lea     ax, [bp-2ch]
        push    ss
        push    ax
        push    1ffeh
        callf   TEXT2_SEG:dma_field_write
        cmp     byte ptr [P_03C7], 0
        je      smem_dma_clear_go
        mov     word ptr [bp-0ch], 0
        mov     word ptr [bp-0ah], 4000h
        xor     si, si
dma_06E66:
        and     byte ptr [bp-0ah], 0f0h
        mov     al, byte ptr [si+TBL_0C39]
        cbw
        or      word ptr [bp-0ah], ax
        lea     ax, [si+1]
        push    ax
        lea     cx, [bp-2ch]
        push    ss
        push    cx
        push    1ffeh
        callf   TEXT2_SEG:dma_field_write
        lea     ax, [si+1]
        mov     si, ax
        cmp     si, 8
        jl      dma_06E66

smem_dma_clear_go:
        in      al, DMA_STATUS
        and     al, 7fh
        mov     ah, 1
        out     DMA_STATUS, ax

br_06E95:
        pop     si
        pop     di
        leave
        ret
        db      00h

dma_06E9A:
        cmp     byte ptr [SAMPLE_MONITOR], 0
        je      X_06ECC
        push    15h
        push    ds
        push    W_4FE6
        push    1ffeh
        callf   TEXT2_SEG:dma_field_write
        cmp     byte ptr [G_REC_MODE], 2
        jne     dma_06EC4
        push    17h
        push    ds
        push    W_5012
        push    1ffeh
        callf   TEXT2_SEG:dma_field_write

dma_06EC4:
        in      al, DMA_STATUS
        and     al, 7fh
        mov     ah, 1
        out     DMA_STATUS, ax

X_06ECC:
        ret
        db      00h

fn_06ECE:
        push    si
        mov     ax, 15h
        callf   TEXT2_SEG:X_01806
        mov     ax, 17h
        callf   TEXT2_SEG:X_01806
        mov     si, 1

loop_06EE2:
        mov     ax, si
        callf   TEXT2_SEG:X_01806
        inc     si
        cmp     si, 8
        jle     loop_06EE2
        pop     si
        ret
        db      00h

fn_06EF2:
        call    fn_06ECE
        mov     ax, 32h
        callf   TEXT2_SEG:delay_ticks
        cmp     byte ptr [P_9D40], 0
        je      br_06F0A
        call    dma_06FEC
        call    fn_06FB2

br_06F0A:
        ret
        db      00h

dma_06F0C:
        push    di
        push    si
        mov     al, byte ptr [G_REC_MODE]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+TBL_2E30]
        cbw
        mov     di, ax
        in      ax, DMA_STATUS
        test    al, 60h
        je      br_06F26
        mov     ax, 80h
        out     DMA_STATUS, ax
br_06F26:
        push    0ch
        callf   TEXT2_SEG:mpc_poll_data
        mov     ax, 2
        mov     dx, 0c031h
        out     dx, al
        push    ds
        push    BUF_XFER
        nop
        push    cs
        call    smem_poll_ready
        mov     ax, 3ffh
        mov     dx, 0c032h
        out     dx, ax
        mov     ax, 55h
        mov     dx, 0c03ah
        out     dx, al
        cmp     byte ptr [SAMPLE_INPUT], ah
        je      br_06F84
        callf   TEXT2_SEG:port_c0_read
        mov     si, ax
        and     si, 0ffa7h
        or      si, 24h
        mov     ax, si
        callf   TEXT2_SEG:port_c0_write
        callf   TEXT2_SEG:timer_loop_io
        or      di, si
        mov     si, di
        mov     ax, 14h
        callf   TEXT2_SEG:delay_ticks
        callf   TEXT2_SEG:L_00106
        or      ax, ax
        je      br_06F9B
        xor     ax, ax
        jmp     br_06FAC
        db      90h

br_06F84:
        callf   TEXT2_SEG:far_000DE
        callf   TEXT2_SEG:port_c0_read
        and     al, 0e3h
        mov     si, ax
        callf   TEXT2_SEG:port_c0_write
        or      di, si
        mov     si, di

br_06F9B:
        push    4
        callf   TEXT2_SEG:mpc_poll_data2
        mov     ax, si
        callf   TEXT2_SEG:port_c0_write
        mov     ax, 1

br_06FAC:
        mov     byte ptr [P_9D40], al
        pop     si
        pop     di
        ret

fn_06FB2:
        push    si
        cmp     byte ptr [P_9D40], 0
        je      br_06FD1
        mov     ax, 2
        mov     dx, 0c031h
        out     dx, al
        mov     dx, 0c03ah
        in      al, dx
        and     ax, 0e3h
        out     dx, al

loop_06FC9:
        mov     dx, 0c03bh
        in      al, dx
        test    al, 4
        je      loop_06FC9

br_06FD1:
        mov     byte ptr [P_9D40], 0
        callf   TEXT2_SEG:port_c0_read
        mov     si, ax
        and     si, 0ffe3h
        mov     ax, si
        or      al, 20h
        callf   TEXT2_SEG:port_c0_write
        pop     si
        ret
        db      00h

dma_06FEC:
        mov     dx, 0c03fh
        in      al, dx
        test    al, 8
        jne     L_07007
        callf   TEXT2_SEG:mpc_poll_status
        xor     ax, ax
        callf   TEXT2_SEG:X_0184A
        mov     word ptr [W_9D3C], ax
        mov     word ptr [W_9D3E], dx

L_07007:
        in      ax, DMA_STATUS
        test    al, 60h

L_0700B:
        je      br_0702E
        mov     ax, 3
        mov     dx, 0c031h
        out     dx, al
        mov     dx, 0c03ah
        in      al, dx
        and     ax, 0e3h
        out     dx, al
dma_0701C:
        mov     dx, 0c03bh
        in      al, dx
        test    al, 8
        je      dma_0701C
        xor     ax, ax
        out     DMA_STATUS, ax

dma_07028:
        in      al, DMA_STATUS
        test    al, 80h
        jne     dma_07028

br_0702E:
        ret
        db      00h

fn_07030:
        call    smem_write_sample
        call    dac_out_program
        mov     word ptr [REC_TRIG_PEAK], 0

        push    word TEXT1_SEG
        push    L_07300
        nop
        push    cs
        call    callback_set_main
        add     sp, 4
        ret
        db      00h

fn_0704C:
        push    0
        push    0
        nop
        push    cs
        call    callback_set_main
        add     sp, 4
        call    fn_06ECE
        mov     byte ptr [G_SAMPLE_MODE], 2
        call    dma_06CFC
        call    dma_06E9A
        push    word TEXT1_SEG
        push    tgt_07326
        nop
        push    cs
        call    callback_set_main
        add     sp, 4
        ret
        db      00h
; reads voice register group 0 back via DMA_DATA_HI/DMA_ADDR_HI; 1 once
; position within 0A5h of stored target.
dma_pos_reached:
        enter   4, 0
        push    di
        xor     ax, ax
        out     DMA_CTRL, ax
        in      ax, DMA_DATA_HI
        mov     di, ax
        mov     ax, word ptr [W_5046]
        mov     dx, word ptr [W_5048]
        and     dx, 0fh
        mov     word ptr [bp-4], ax
        in      ax, DMA_ADDR_HI
        mov     bx, ax
        cmp     dx, ax
        ja      br_070B0
        mov     ax, word ptr [bp-4]
        sub     ax, di
        sbb     dx, bx
        or      dx, dx
        jg      br_070B0
        jl      br_070AA
        cmp     ax, 0a5h
        ja      br_070B0
br_070AA:
        mov     ax, 1
        pop     di
        leave
        ret

br_070B0:
        xor     ax, ax
        pop     di
        leave
        ret
        db      00h

fn_070B6:
        push    0
        push    0
        nop
        push    cs
        call    callback_set_main
        add     sp, 4
        call    fn_06EF2
        mov     byte ptr [G_SAMPLE_MODE], 0
        ret
        db      00h
fn_070CC:
        push    0
        push    0
        nop
        push    cs
        call    callback_set_main
        add     sp, 4
        call    fn_06EF2
        mov     byte ptr [G_SAMPLE_MODE], 3
        ret
        db      00h

lcd_update_handler_70E2:
        push    word ptr [PTR_DL_PROCESSING_SEG]
        push    word ptr [PTR_DL_PROCESSING]
        nop
        push    cs
        call    disp_list_run
        call    lcd_update_handler
        call    lcd_compute_coords
        push    ds
        push    P_2E33
        nop
        push    cs
        call    disp_list_run
        ret
        db      00h

; main LCD update dispatch
lcd_update_handler:
        enter   14h, 0
        push    di
        push    si
        cmp     word ptr [REC_PREREC_LEN], 0
        jne     br_07110
        jmp     lcd_compute_coords_71FB

br_07110:
        mov     di, word ptr [REC_DMA_POS]
        mov     ax, word ptr [REC_LENGTH]
        mov     dx, word ptr [REC_LENGTH_HI]
        add     ax, word ptr [REC_BUF_ADDR]
        adc     dx, word ptr [REC_BUF_ADDR_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     si, word ptr [REC_PREREC_LEN]
        cmp     di, si
        jb      L_07178
        mov     ax, di
        sub     dx, dx
        sub     bx, bx
        sub     ax, si
        sbb     dx, bx
        add     ax, bx
        adc     dx, 1
        push    dx
        push    ax
        push    word ptr [REC_BUF_ADDR_HI]
        push    word ptr [REC_BUF_ADDR]
        push    bx
        push    si
        callf   TEXT2_SEG:smem_copy_buffered
        cmp     byte ptr [G_REC_MODE], 2
        je      br_0715B
        jmp     lcd_compute_coords_71FB
br_0715B:
        mov     ax, di
        sub     dx, dx
        sub     bx, bx
        sub     ax, si
        sbb     dx, bx
        add     ax, 1140h
        adc     dx, 1
        push    dx
        push    ax
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    bx
        push    si

        jmp     L_071F6
        db      90h

L_07178:
        sub     si, di
        mov     ax, 1140h
        mov     dx, 1
        sub     bx, bx
        sub     ax, si
        sbb     dx, bx
        push    dx
        push    ax
        push    word ptr [REC_BUF_ADDR_HI]
        push    word ptr [REC_BUF_ADDR]
        push    bx
        push    si
        mov     word ptr [bp-0ch], si
        mov     word ptr [bp-0ah], bx
        callf   TEXT2_SEG:smem_copy_buffered
        push    1
        push    0
        mov     ax, word ptr [REC_BUF_ADDR]
        mov     dx, word ptr [REC_BUF_ADDR_HI]
        add     ax, word ptr [bp-0ch]
; ? event_dispatch_table_base @0x071ad is mid-instruction
        adc     dx, word ptr [bp-0ah]
        push    dx
        push    ax
        push    0
        push    di
; ? event_queue_process @0x071b5 is mid-instruction
        callf   TEXT2_SEG:smem_copy_buffered
; ? event_mode_main @0x071b9 is mid-instruction
        cmp     byte ptr [G_REC_MODE], 2
event_mode_edit:
        jne     lcd_compute_coords_71FB
; ? event_mode_mixer @0x071c1 is mid-instruction
        mov     ax, 2280h
        mov     dx, 1
event_mode_disk:
        sub     bx, bx
        sub     ax, si
event_mode_song:
        sbb     dx, bx
        push    dx
        push    ax
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    bx
        push    si
        mov     word ptr [bp-14h], si
        mov     word ptr [bp-12h], bx
        callf   TEXT2_SEG:smem_copy_buffered
        push    1
        push    1140h
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        add     ax, word ptr [bp-14h]
        adc     dx, word ptr [bp-12h]
        push    dx
        push    ax
        push    0
        push    di

L_071F6:
        callf   TEXT2_SEG:smem_copy_buffered

lcd_compute_coords_71FB:
        pop     si
        pop     di
        leave
        ret
        db      00h
; coordinates from the state at [9D32h]
lcd_compute_coords:
        enter   0ch, 0
        mov     ax, word ptr [REC_LENGTH]
        mov     dx, word ptr [REC_LENGTH_HI]
        add     ax, word ptr [REC_BUF_ADDR]
        adc     dx, word ptr [REC_BUF_ADDR_HI]
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        mov     cx, word ptr [W_9D3C]
        mov     bx, word ptr [W_9D3E]
        add     cx, 0fh
        adc     bx, 0
        and     cl, 0f0h
        mov     word ptr [bp-4], cx
        mov     word ptr [bp-2], bx
        sub     cx, word ptr [REC_BUF_ADDR]
        sbb     bx, word ptr [REC_BUF_ADDR_HI]
        cmp     dx, word ptr [bp-2]
        jl      lcd_clear_display_7266
        jg      br_07244
        cmp     ax, word ptr [bp-4]
        jbe     lcd_clear_display_7266
br_07244:
        mov     word ptr [REC_LENGTH], cx
        mov     word ptr [REC_LENGTH_HI], bx
        cmp     byte ptr [G_REC_MODE], 2
        jne     lcd_clear_display_7266
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    bx
        push    cx
        callf   TEXT2_SEG:input_handler

lcd_clear_display_7266:
        leave
        ret

lcd_clear_display:
        enter   8, 0
        push    di
        push    si
        mov     ax, word ptr [REC_LENGTH]
        mov     dx, word ptr [REC_LENGTH_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        cmp     byte ptr [G_REC_MODE], 2
        jne     br_07288
        shl     word ptr [bp-4], 1
        rcl     word ptr [bp-2], 1
br_07288:
        mov     si, word ptr [bp+4]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    smem_alloc
        mov     di, ax
        mov     ax, word ptr [bp+6]
        push    ax
        push    si
        mov     word ptr [bp-8], si
        mov     word ptr [bp-6], ax
        callf   TEXT2_SEG:sample_desc_init
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        callf   TEXT2_SEG:timer_fdc_sync
        les     bx, [bp-8]

        mov     word ptr es:[bx+MPC_STATE_cache_lo], di
        cmp     byte ptr [G_REC_MODE], 2
        jne     L_072C6
        mov     al, 1
        jmp     br_072C8
        db      90h

L_072C6:
        xor     al, al

br_072C8:
        les     bx, [bp-8]
        mov     byte ptr es:[bx+MPC_STATE_flag_13], al
        mov     ax, word ptr [REC_PREREC_LEN]
        mov     word ptr es:[bx+MPC_STATE_time_lo], ax
        mov     word ptr es:[bx+MPC_STATE_time_hi], 0
        mov     ax, word ptr [REC_LENGTH]
        mov     dx, word ptr [REC_LENGTH_HI]
        mov     word ptr es:[bx+MPC_STATE_pos_lo], ax
        mov     word ptr es:[bx+MPC_STATE_pos_hi], dx
        mov     ax, word ptr [REC_LENGTH]
        mov     dx, word ptr [REC_LENGTH_HI]
        mov     word ptr es:[bx+MPC_STATE_range_lo], ax
        mov     word ptr es:[bx+MPC_STATE_range_hi], dx
        pop     si
        pop     di
        leave
        ret     4
L_07300:
        cmp     byte ptr [G_SAMPLE_MODE], 1
        jne     L_07324_1
        mov     ax, word ptr [REC_TRIG_PEAK]
        callf   TEXT2_SEG:X_03B24
        mov     cx, ax
        mov     al, byte ptr [SAMPLE_THRESHOLD]
        cbw
        cmp     cx, ax
        jl      L_0731E
        call    fn_0704C
        retf
        db      90h

L_0731E:
        mov     word ptr [REC_TRIG_PEAK], 0

L_07324_1:
        retf
        db      00h

tgt_07326:
        call    dma_pos_reached
        or      ax, ax
        je      X_07330
        call    fn_070CC

X_07330:
        retf
        db      00h

X_07332:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        call    fn_0686A
        pop     ds
        retf
        db      00h

L_0733E:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     word ptr [SAMPLE_TIME], 0
        je      br_07372
        cmp     byte ptr [P_9D40], 0
        je      br_0736A
        mov     byte ptr [G_SAMPLE_MODE], 1
        call    io_near_stub
        cmp     byte ptr [SAMPLE_THRESHOLD], 0c1h
        jge     L_07383
        call    fn_07030
        call    fn_0704C
        pop     ds
        retf
        db      90h
br_0736A:
        nop
        push    cs
        call    far_067A6
        jmp     L_07380
        db      90h

br_07372:
        push    ds
        push    STR_TIME_TOO_SHORT
        callf   TEXT2_SEG:string_fill_stosb
        mov     byte ptr [REC_CURSOR], 4

L_07380:
        call    rec_arm_field

L_07383:
        pop     ds
        retf
        db      00h


L_07386:
        callf   TEXT2_SEG:L_00116
        or      ax, ax
        jne     br_07394
        mov     byte ptr [SAMPLE_INPUT], 0

br_07394:
        call    fn_06786
        retf

L_07398:
        call    fn_0683A
        cmp     word ptr [SAMPLE_TIME], ax
        jbe     L_073A4
        mov     word ptr [SAMPLE_TIME], ax

L_073A4:
        call    fn_06786
        retf

L_073A8:
        call    fn_06ECE
        call    dac_out_program
        retf
        db      00h

rec_arm_field:
        mov     al, byte ptr [REC_CURSOR]
        cbw
        cmp     ax, 5
        ja      X_073CE
        add     ax, ax
        xchg    bx, ax
        jmp     word ptr cs:[bx+P_73C2]
        db      90h

P_73C2:
        dw      X_0746C, X_073D6, X_073F0, X_07408
        dw      X_07428, L_0744C

X_073CE:
        mov     byte ptr [REC_CURSOR], 0
        jmp     X_0746C

X_073D6:
        push    ds
        push    G_REC_MODE
        push    2
        mov     al, byte ptr [REC_MODE_X]
        push    ax
        mov     al, byte ptr [REC_MODE_Y]
        push    ax
        push    7
        push    word TEXT1_SEG
        push    L_07398
        jmp     NEAR L_07482
        db      90h

X_073F0:
        push    ds
        push    SAMPLE_MONITOR
        push    1
        mov     al, byte ptr [B_2E3A]
        push    ax
        mov     al, byte ptr [B_2E3B]
        push    ax
        push    4
        push    word TEXT1_SEG
        push    L_073A8
        jmp     SHORT L_07482

X_07408:
        push    ds
        push    SAMPLE_THRESHOLD
        push    -40h
        push    0
        push    2
        mov     al, byte ptr [REC_THRESH_X]
        push    ax
        mov     al, byte ptr [REC_THRESH_Y]
        push    ax
        push    0
        push    0
        push    0
        push    0
        callf   TEXT2_SEG:field_register_s8
        ret

X_07428:
        push    ds
        push    SAMPLE_TIME
        push    0
        call    fn_0683A
        push    ax
        push    4
        mov     al, byte ptr [REC_TIME_X]
        push    ax
        mov     al, byte ptr [REC_TIME_Y]
        push    ax
        push    TEXT2_SEG
        push    L_03808
        push    0
        push    0
        callf   TEXT2_SEG:status_read_6A
        ret
L_0744C:
        push    ds
        push    SAMPLE_PREREC
        push    0
        push    64h
        push    3
        mov     al, byte ptr [B_2E40]
        push    ax
        mov     al, byte ptr [B_2E41]
        push    ax
        push    0

L_07460:
        push    0
        push    0
        push    0
        callf   TEXT2_SEG:status_read_6A_3
        ret

X_0746C:
        push    ds
        push    SAMPLE_INPUT
        push    1
        mov     al, byte ptr [REC_INPUT_X]
        push    ax
        mov     al, byte ptr [REC_INPUT_Y]
        push    ax
        push    8
        push    word TEXT1_SEG
        push    L_07386

L_07482:
        callf   TEXT2_SEG:voice_trigger_full
        ret

; RECORD's fields are two rows of three.
X_07488:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [REC_CURSOR], 3
        jl      X_0749D
        sub     byte ptr [REC_CURSOR], 3
        call    rec_arm_field

X_0749D:
        pop     ds
        retf
        db      00h

X_074A0:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [REC_CURSOR], 3
        jge     X_074B5
        add     byte ptr [REC_CURSOR], 3
        call    rec_arm_field

X_074B5:
        pop     ds
        retf
        db      00h

X_074B8:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [REC_CURSOR], 0
        jle     X_074CC
        dec     byte ptr [REC_CURSOR]
        call    rec_arm_field

X_074CC:
        pop     ds
        retf

X_074CE:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [REC_CURSOR], 5
        jge     lcd_port_handler_74E2
        inc     byte ptr [REC_CURSOR]
        call    rec_arm_field

lcd_port_handler_74E2:
        pop     ds
        retf
lcd_port_handler:
        push    bp
        mov     bp, sp
        push    ax
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [P_9D40], 0
        je      br_07502
        call    fn_067C2
        or      ax, ax
        je      L_07515
        call    rec_arm_field
        pop     ds
        leave
        retf


br_07502:
        cmp     byte ptr [SAMPLE_INPUT], 0
        je      L_07515
        callf   TEXT2_SEG:L_00106
        or      ax, ax
        jne     L_07515
        call    fn_06786

L_07515:
        callf   TEXT2_SEG:mpc_rate_caller
        push    word ptr [bp-2]
        call    ctrl_port_18_write
        pop     ds
        leave
        retf
        db      00h

L_07524:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        call    fn_06EF2
        push    1
        callf   TEXT2_SEG:int44_wrapper
        push    TEXT2_SEG
        push    sample_error_handler
        nop
        push    cs
        call    callback_set_main
        add     sp, 4
        mov     byte ptr [P_0610], 1
        callf   TEXT2_SEG:dma_018ee
        pop     ds
        retf

L_0754E:
L_075CE:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    0
        callf   TEXT2_SEG:cmd_exec_0E_wrapper
        mov     al, byte ptr [REC_INPUT_X]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [REC_INPUT_Y]
        push    ax
        mov     al, byte ptr [SAMPLE_INPUT]
        cbw
        shl     ax, 3
        add     ax, TBL_REC_INPUT_LABELS
        push    ds
        push    ax
        callf   TEXT2_SEG:cmd_dispatch_1E
        mov     al, byte ptr [REC_MODE_X]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [REC_MODE_Y]
        push    ax
        mov     al, byte ptr [G_REC_MODE]
        cbw
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        add     ax, ax
        add     ax, cx
        add     ax, TBL_REC_MODE_LABELS
        push    ds
        push    ax
        callf   TEXT2_SEG:cmd_dispatch_1E
        mov     al, byte ptr [B_2E3A]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [B_2E3B]
        push    ax
        mov     al, byte ptr [SAMPLE_MONITOR]
        cbw
        shl     ax, 2
        add     ax, TBL_OFF_ON_LABELS
        push    ds
        push    ax
        callf   TEXT2_SEG:cmd_dispatch_1E
        cmp     byte ptr [SAMPLE_THRESHOLD], 0c1h
        jge     br_075D0
        mov     al, byte ptr [REC_THRESH_X]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [REC_THRESH_Y]
        push    ax
        push    ds
        push    TBL_OFF_ON_LABELS
        callf   TEXT2_SEG:cmd_dispatch_1E
        jmp     br_075E8
        db      90h
br_075D0:
        mov     al, byte ptr [REC_THRESH_X]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [REC_THRESH_Y]
        push    ax
        mov     al, byte ptr [SAMPLE_THRESHOLD]
        cbw
        cwd
        push    dx
        push    ax
        push    2
        callf   TEXT2_SEG:draw_signed_value
br_075E8:
        mov     al, byte ptr [REC_TIME_X]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [REC_TIME_Y]
        push    ax
        push    word ptr [SAMPLE_TIME]
        callf   TEXT2_SEG:timer_value_read_5
        mov     al, byte ptr [B_2E40]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [B_2E41]
        push    ax
        mov     al, byte ptr [SAMPLE_PREREC]
        push    0
        push    ax
        push    3
        callf   TEXT2_SEG:draw_unsigned_value
        callf   TEXT2_SEG:field_redraw
        call    io_write_caller
        pop     ds
        retf

fn_0761C:
        push    ds
        push    P_2E84
        nop
        push    cs
        call    disp_list_run
        push    0
        push    13h
        push    0f7h
        push    1eh
        callf   TEXT2_SEG:cmd_build_dispatch
        call    fn_0683A
        cmp     word ptr [SAMPLE_TIME], ax
        jbe     L_0763F
        mov     word ptr [SAMPLE_TIME], ax
L_0763F:
        push    0
        push    0
        nop
        push    cs
        call    callback_set_main
        add     sp, 4
        push    ds
        push    TBL_WINKEYS_02E42
        nop
        push    cs
        call    win_keys_merge
        call    fn_0686A
        call    rec_arm_field
        call    fn_06786
        ret

X_0765E:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        call    fn_0704C
        pop     ds
        retf
        db      00h

; calls io_near_stub then the near helper L_067C2.
ctrl_stub_init:
        enter   2, 0
        push    ax
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        call    io_near_stub
        or      ax, ax
        jne     X_0768E
        call    fn_067C2
        or      ax, ax
        jne     X_0768E
        callf   TEXT2_SEG:mpc_rate_caller
        push    word ptr [bp-4]
        call    ctrl_port_18_write

X_0768E:
        pop     ds
        leave
        retf
        db      00h

X_07692:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        call    io_write_caller
        pop     ds
        retf
        db      00h

X_0769E:
        callf   TEXT2_SEG:string_copy_movsb
        push    ds
        push    DL_WAITING_FOR_INPUT
        nop
        push    cs
        call    disp_list_run
        callf   TEXT2_SEG:X_00610
        push    ds
        push    TBL_WINKEYS_02F14
        nop
        push    cs
        call    win_keys_merge
        call    fn_07030
        ret

X_076BE:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_SAMPLE_MODE], 2
        jne     X_076CE
        call    fn_070B6

X_076CE:
        pop     ds
        retf

X_076D0:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_SAMPLE_MODE], 2
        jne     br_076E0
        call    fn_070CC

br_076E0:
        pop     ds
        retf

fn_076E2:
        callf   TEXT2_SEG:X_00610
        push    ds
        push    TBL_WINKEYS_02F62
        nop
        push    cs
        call    win_keys_merge
        callf   TEXT2_SEG:string_copy_movsb
        push    ds
        push    DL_RECORDING
        nop
        push    cs
        call    disp_list_run
        ret
        db      00h

lcd_block_copy_7700:
        push    0
        callf   TEXT2_SEG:int44_wrapper
        mov     byte ptr [PAD_INPUT_MODE], 2
        push    0
        push    0
        nop
        push    cs
        call    callback_set_main
        add     sp, 4
        mov     byte ptr [G_SAMPLE_MODE], 0
        call    io_near_stub
        retf
        db      00h
lcd_block_copy:
        enter   36h, 0
        push    di
        push    si
        call    lcd_update_handler_70E2
        lea     ax, [bp-36h]
        push    ss
        push    ax
        call    lcd_clear_display
        push    TEXT2_SEG
; block copy into LCD framebuffer; 54-byte frame, largest here
        push    sample_error_handler
        nop
        push    cs
        call    callback_set_main
        add     sp, 4
        callf   TEXT2_SEG:X_00610
        push    word TEXT1_SEG
        push    LCD_BLOCK_COPY_7700
        sub     sp, 36h
        push    ds
        lea     si, [bp-36h]
        mov     di, sp
        add     di, 2
        push    ss
        pop     es
        push    ss
        pop     ds
        mov     cx, 1bh
        rep movsw
        pop     ds
        nop
        push    cs
        call    ui_enter_sound_dialog
        add     sp, 3ah
        pop     si
        pop     di
        leave
        ret

X_0776E:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        call    fn_0761C
        pop     ds
        retf
        db      00h

; disp_list_run to read, then near helper L_0683A with 9Dh/0Ch.
math_calc_handler:
        enter   4, 0

L_0777E:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_SOUND_MEMORY
        nop
        push    cs
        call    disp_list_run
        push    9dh
        push    0ch
        call    fn_0683A
        push    ax
        callf   TEXT2_SEG:timer_value_read_5
        push    43h
        push    28h
        push    8
        push    0
        push    word ptr [SMEM_SIZE_HI]
        push    word ptr [SMEM_SIZE]
        nop
        push    cs
        call    __aFldiv
        push    dx
        push    ax
        push    2
        callf   TEXT2_SEG:draw_unsigned_value
        mov     ax, word ptr [SMEM_SIZE]
        mov     dx, word ptr [SMEM_SIZE_HI]
        sub     ax, 2280h
        sbb     dx, 1
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    dx
        push    ax
        push    0
        push    0c8h
        callf   TEXT2_SEG:X_00E76
        mov     cx, word ptr [bp-4]
        mov     bx, word ptr [bp-2]
        sub     cx, ax
        sbb     bx, dx
        push    bx
        push    cx
        nop
        push    cs
        call    __aFlmul
        push    dx
        push    ax
        nop
        push    cs
        call    __aFldiv
        mov     si, ax
        or      si, ax
        je      br_0781D
        mov     byte ptr [B_3029], al
        mov     byte ptr [B_3021], al
        mov     byte ptr [B_3019], al
        mov     byte ptr [B_3011], al
        mov     bx, si
        lea     ax, [bx-1]
        mov     byte ptr [B_302D], al
        mov     byte ptr [B_3025], al
        mov     byte ptr [B_301D], al
        mov     byte ptr [B_3015], al
        push    ds
        push    P_300E
        nop
        push    cs
        call    disp_list_run
br_0781D:
        cmp     si, 0c8h
        jge     br_07841
        lea     ax, [si+17h]
        push    ax
        push    1ah
        push    8
        callf   TEXT2_SEG:cmd_dispatch_0E
        lea     ax, [si+17h]
        push    ax
        push    1ah
        mov     ax, 0c8h
        sub     ax, si
        push    ax
        callf   TEXT2_SEG:cmd_track_setup

br_07841:
        pop     ds
        pop     si
        leave
        retf
        db      00h

trim_start_fine_arm_field:
        mov     ax, word ptr [SND_CURRENT+2]
        or      ax, word ptr [SND_CURRENT]
        jne     br_0785B
        mov     al, byte ptr [TRIM_CURSOR]
        cbw
        dec     ax
        je      br_0785B
        mov     byte ptr [TRIM_CURSOR], 0
br_0785B:
        mov     al, byte ptr [TRIM_CURSOR]
        cbw
        or      ax, ax
        je      X_078A2
        dec     ax
        je      X_07876
        dec     ax
        je      br_0787C
        dec     ax
        je      br_0788C
        dec     ax
        je      X_0789C
        mov     byte ptr [TRIM_CURSOR], 0
        jmp     X_078A2

X_07876:
        callf   TEXT2_SEG:L_090D4
        ret

br_0787C:
        push    1ah
        push    0ch

        push    word TEXT1_SEG
        push    L_079CA
        callf   TEXT2_SEG:sample_active_check_1
        ret

br_0788C:
        push    7ah
        push    0ch
        push    word TEXT1_SEG
        push    L_07A58
        callf   TEXT2_SEG:sample_active_check_2
        ret

X_0789C:
        callf   TEXT2_SEG:X_090F4
        ret

X_078A2:
        callf   TEXT2_SEG:X_090B2
        ret

X_078A8:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [TRIM_CURSOR]
        cbw
        dec     ax
        dec     ax
        jl      X_078D0
        jo      X_078D0
        dec     ax
        jle     br_078C0
        dec     ax
        je      L_078C8
        pop     ds
        retf

br_078C0:
        mov     byte ptr [TRIM_CURSOR], 0
        jmp     L_078CD
        db      90h

L_078C8:
        mov     byte ptr [TRIM_CURSOR], 1

L_078CD:
        call    trim_start_fine_arm_field

X_078D0:
        pop     ds
        retf

X_078D2:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [TRIM_CURSOR]
        cbw
        or      ax, ax
        je      br_078E6
        dec     ax
        je      L_078EE
        pop     ds
        retf
        db      90h

br_078E6:
        mov     byte ptr [TRIM_CURSOR], 2
        jmp     X_078F3
        db      90h

L_078EE:
        mov     byte ptr [TRIM_CURSOR], 4

X_078F3:
        call    trim_start_fine_arm_field
        pop     ds
        retf

X_078F8:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [TRIM_CURSOR], 4
        jge     X_0790C
        inc     byte ptr [TRIM_CURSOR]
        call    trim_start_fine_arm_field

X_0790C:
        pop     ds
        retf

X_0790E:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [TRIM_CURSOR], 0
        jle     X_07922
        dec     byte ptr [TRIM_CURSOR]
        call    trim_start_fine_arm_field

X_07922:
        pop     ds
        retf

trim_screen_enter:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        callf   TEXT2_SEG:far_08010
        push    ds
        push    DL_TRIM
        nop
        push    cs
        call    disp_list_run
        push    ds
        push    TBL_WINKEYS_TRIM
        nop
        push    cs
        call    win_keys_merge
        mov     byte ptr [G_SND_EDIT_PAGE], 0
        callf   TEXT2_SEG:zone_range_clamp
        call    trim_start_fine_arm_field
        pop     ds
        retf

start_fine_arm_field:
        mov     al, byte ptr [START_FINE_CURSOR]
        cbw
        or      ax, ax
        je      X_0798E
        dec     ax
        je      br_07966
        dec     ax
        je      br_0797E
        mov     byte ptr [START_FINE_CURSOR], 0
        jmp     X_0798E
        db      90h

br_07966:
        push    ds
        push    TRIM_LEN_FIX
        push    1
        push    0cdh
        push    1fh
        push    5
        push    0
        push    0
        callf   TEXT2_SEG:voice_trigger_full
        ret
        db      90h
br_0797E:
        push    0b5h
        push    28h
        push    0
        push    0
        callf   TEXT2_SEG:voice_trigger_caller
        ret
        db      90h
X_0798E:
        push    0b5h
        push    0ch
        push    0
        push    0
        callf   TEXT2_SEG:sample_active_check_1
        ret
        db      00h

X_0799E:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [START_FINE_CURSOR], 0
        jle     X_079AF
        dec     byte ptr [START_FINE_CURSOR]

X_079AF:
        call    start_fine_arm_field
        pop     ds
        retf

X_079B4:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [START_FINE_CURSOR], 2
        jge     L_079C5
        inc     byte ptr [START_FINE_CURSOR]

L_079C5:
        call    start_fine_arm_field
        pop     ds
        retf

L_079CA:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_34A6
        nop
        push    cs
        call    win_keys_merge
        call    start_fine_arm_field
        pop     ds
        retf

end_fine_arm_field:
        mov     al, byte ptr [END_FINE_CURSOR]
        cbw
        or      ax, ax
        je      X_07A1C
        dec     ax
        je      br_079F4
        dec     ax
        je      br_07A0C
        mov     byte ptr [END_FINE_CURSOR], 0
        jmp     X_07A1C
        db      90h

br_079F4:
        push    ds
        push    TRIM_LEN_FIX
        push    1
        push    0cdh
        push    1fh
        push    5
        push    0
        push    0
        callf   TEXT2_SEG:voice_trigger_full
        ret
        db      90h
br_07A0C:
        push    0b5h
        push    28h
        push    0
        push    0
        callf   TEXT2_SEG:voice_trigger_caller
        ret
        db      90h
X_07A1C:
        push    0b5h
        push    0ch
        push    0
        push    0
        callf   TEXT2_SEG:sample_active_check_2
        ret
        db      00h

X_07A2C:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [END_FINE_CURSOR], 0
        jle     X_07A3D
        dec     byte ptr [END_FINE_CURSOR]

X_07A3D:
        call    end_fine_arm_field
        pop     ds
        retf

X_07A42:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [END_FINE_CURSOR], 2
        jge     L_07A53
        inc     byte ptr [END_FINE_CURSOR]

L_07A53:
        call    end_fine_arm_field
        pop     ds
        retf

L_07A58:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_354A
        nop
        push    cs
        call    win_keys_merge
        call    end_fine_arm_field
        pop     ds
        retf

string_byte_scan:
        enter   6, 0
        push    si
        mov     ax, word ptr [SND_CURRENT+2]
        or      ax, word ptr [SND_CURRENT]
        jne     br_07A86
        mov     al, byte ptr [LOOP_CURSOR]
        cbw
        dec     ax
        je      br_07A86
        mov     byte ptr [LOOP_CURSOR], 0

br_07A86:
        mov     al, byte ptr [LOOP_CURSOR]
        cbw
        or      ax, ax
        jne     br_07A91
        jmp     X_07B2E

br_07A91:
        dec     ax
        je      br_t1_07AA6
        dec     ax
        je      br_07AAE
        dec     ax
        je      br_07AC0
        dec     ax
        je      br_07AD2
        mov     byte ptr [LOOP_CURSOR], 0
        jmp     X_07B2E
        db      90h

br_t1_07AA6:
        callf   TEXT2_SEG:L_090D4
        pop     si
        leave
        ret

br_07AAE:
        push    14h
        push    0ch
        push    word TEXT1_SEG
        push    L_07C5E
        callf   TEXT2_SEG:ui_edit_position
        pop     si
        leave
        ret

br_07AC0:
        push    7ah
        push    0ch
        push    word TEXT1_SEG
        push    L_07C5E
        callf   TEXT2_SEG:sample_active_check_3
        pop     si
        leave
        ret

br_07AD2:
        push    0
        push    0
        callf   TEXT2_SEG:install_handler_15
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        callf   TEXT2_SEG:sample_check_active
        or      ax, ax
        je      br_07AFE
        xor     al, al
        mov     bx, G_EDIT_FIELD_VAL
        mov     si, bx
        mov     word ptr [bp-4], ds
        mov     byte ptr [bx], al
        mov     byte ptr [bp-1], al
        jmp     br_07B11
        db      90h

br_07AFE:
        mov     ax, word ptr [SND_CURRENT]
        mov     dx, word ptr [SND_CURRENT+2]
        add     ax, 24h
        mov     si, ax
        mov     word ptr [bp-4], dx
        mov     byte ptr [bp-1], 1

br_07B11:
        push    word ptr [bp-4]
        push    si
        mov     al, byte ptr [bp-1]
        push    ax
        push    0dah
        push    0ch
        push    4
        push    TEXT2_SEG
        push    L_09900
        callf   TEXT2_SEG:voice_trigger_full
        pop     si
        leave
        ret
X_07B2E:
        callf   TEXT2_SEG:X_090B2
        pop     si
        leave
        ret

X_07B36:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [LOOP_CURSOR]
        cbw
        dec     ax
        dec     ax
        jl      X_07B5E
        jo      X_07B5E
        dec     ax
        jle     br_07B4E
        dec     ax
        je      L_07B56
        pop     ds
        retf

br_07B4E:
        mov     byte ptr [LOOP_CURSOR], 0
        jmp     L_07B5B
        db      90h

L_07B56:
        mov     byte ptr [LOOP_CURSOR], 1

L_07B5B:
        call    string_byte_scan

X_07B5E:
        pop     ds
        retf

X_07B60:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [LOOP_CURSOR]
        cbw
        or      ax, ax
        je      T1_loop_07B74
        dec     ax
        je      L_07B7C
        pop     ds
        retf
        db      90h

T1_loop_07B74:
        mov     byte ptr [LOOP_CURSOR], 2
        jmp     X_07B81
        db      90h

L_07B7C:
        mov     byte ptr [LOOP_CURSOR], 4

X_07B81:
        call    string_byte_scan
        pop     ds
        retf

X_07B86:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [LOOP_CURSOR], 0
        jle     X_07B9A
        dec     byte ptr [LOOP_CURSOR]
        call    string_byte_scan

X_07B9A:
        pop     ds
        retf

X_07B9C:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [LOOP_CURSOR], 4
        jge     X_07BB0
        inc     byte ptr [LOOP_CURSOR]
        call    string_byte_scan

X_07BB0:
        pop     ds
        retf

fit_to_length_cancel:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        callf   TEXT2_SEG:far_08010
        push    ds
        push    P_364E
        nop
        push    cs
        call    disp_list_run
        push    ds
        push    P_3680
        nop
        push    cs
        call    win_keys_merge
        mov     byte ptr [G_SND_EDIT_PAGE], 1
        callf   TEXT2_SEG:zone_range_clamp
        call    string_byte_scan
        pop     ds
        retf

L_07BDE:
        mov     al, byte ptr [LOOP_FINE_CURSOR]
        cbw
        dec     ax
        je      br_07BFA
        dec     ax
        je      br_07C0A

L_07BE8:
        dec     ax
        je      X_07C22
        push    0b5h
        push    0ch
        push    0
        push    0
        callf   TEXT2_SEG:ui_edit_position
        ret

br_07BFA:
        push    0b5h
        push    15h
        push    0
        push    0
        callf   TEXT2_SEG:sample_active_check_3
        ret
        db      90h

br_07C0A:
        push    ds
        push    LOOP_LEN_FIX
        push    1
        push    0cdh
        push    1fh
        push    5
        push    0
        push    0
        callf   TEXT2_SEG:voice_trigger_full
        ret
        db      90h

X_07C22:
        push    0b5h
        push    28h
        push    0
        push    0
        callf   TEXT2_SEG:voice_trigger_caller
        ret
        db      00h

L_07C32:
        push    ds

L_07C33:
        mov     cx, DATA_SEG
        mov     ds, cx

L_07C38:
        cmp     byte ptr [LOOP_FINE_CURSOR], 0
        jle     X_07C43
        dec     byte ptr [LOOP_FINE_CURSOR]

X_07C43:
        call    L_07BDE
        pop     ds
        retf

X_07C48:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [LOOP_FINE_CURSOR], 3
        jge     L_07C59
        inc     byte ptr [LOOP_FINE_CURSOR]

L_07C59:
        call    L_07BDE
        pop     ds
        retf

L_07C5E:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_3732

L_07C68:
        nop
        push    cs
        call    win_keys_merge
        mov     byte ptr [LOOP_FINE_CURSOR], 0
        call    L_07BDE
        pop     ds
        retf
        db      00h

zone_start_fine_arm_field:
        mov     ax, word ptr [SND_CURRENT+2]
        or      ax, word ptr [SND_CURRENT]
        jne     br_07C92
        mov     al, byte ptr [ZONE_START_FINE_CURSOR]
        cbw
        dec     ax
        je      br_07C92
        sub     ax, 3
        je      br_07C92
        mov     byte ptr [ZONE_START_FINE_CURSOR], 0
br_07C92:
        mov     al, byte ptr [ZONE_START_FINE_CURSOR]
        cbw
        or      ax, ax
        je      L_07CAC
        dec     ax
        je      X_07CB2
        dec     ax
        je      T1_br_07CB8
        dec     ax
        je      br_07CC8
        dec     ax
        je      X_07CD8
        mov     byte ptr [ZONE_START_FINE_CURSOR], 0
        ret

L_07CAC:
        callf   TEXT2_SEG:X_090B2
        ret

X_07CB2:
        callf   TEXT2_SEG:L_090D4
        ret

T1_br_07CB8:
        push    1ah
        push    0ch

        push    word TEXT1_SEG
        push    L_07DF4
        callf   TEXT2_SEG:ui_edit_zone_start
        ret

br_07CC8:
        push    7ah
        push    0ch
        push    word TEXT1_SEG
        push    L_07E7C
        callf   TEXT2_SEG:ui_edit_zone_end
        ret

X_07CD8:
        ZS_HOOK_SLOT_ZONE

zone_start_fine_up:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [ZONE_START_FINE_CURSOR]
        cbw
        dec     ax
        dec     ax
        jl      L_07D06
        jo      L_07D06
        dec     ax
        jle     br_t1_07CF6
        dec     ax
        je      L_07CFE
        pop     ds
        retf

br_t1_07CF6:
        mov     byte ptr [ZONE_START_FINE_CURSOR], 0
        jmp     L_07D03
        db      90h

L_07CFE:
        mov     byte ptr [ZONE_START_FINE_CURSOR], 1

L_07D03:
        call    zone_start_fine_arm_field

L_07D06:
        pop     ds
        retf

zone_start_fine_down:
L_07D88:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [ZONE_START_FINE_CURSOR]
        cbw
        or      ax, ax
        je      br_07D1C
        dec     ax
        je      L_07D24
        pop     ds
        retf
        db      90h

br_07D1C:
        mov     byte ptr [ZONE_START_FINE_CURSOR], 2
        jmp     X_07D29
        db      90h

L_07D24:
        mov     byte ptr [ZONE_START_FINE_CURSOR], 4

X_07D29:
        call    zone_start_fine_arm_field
        pop     ds
        retf

zone_start_fine_right:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [ZONE_START_FINE_CURSOR], 4
        jge     X_07D42
        inc     byte ptr [ZONE_START_FINE_CURSOR]
        call    zone_start_fine_arm_field

X_07D42:
        pop     ds
        retf

zone_start_fine_left:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [ZONE_START_FINE_CURSOR], 0
        jle     X_07D58
        dec     byte ptr [ZONE_START_FINE_CURSOR]
        call    zone_start_fine_arm_field

X_07D58:
        pop     ds
        retf

zone_screen_enter:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        callf   TEXT2_SEG:far_08010
        push    ds
        push    P_389C
        nop
        push    cs
        call    disp_list_run
        push    ds
        push    P_38CE
        nop
        push    cs
        call    win_keys_merge
        mov     byte ptr [G_SND_EDIT_PAGE], 2
        callf   TEXT2_SEG:zone_range_clamp
        call    zone_start_fine_arm_field
        pop     ds
        retf

zone_end_fine_arm_field:
        mov     al, byte ptr [G_PLAY_MODE]
        cbw
        dec     ax
        je      br_07DA0
        dec     ax
        je      X_07DB8
        push    0b5h
        push    0ch
        push    0
        push    0
        callf   TEXT2_SEG:ui_edit_zone_start
        ret
        db      90h

br_07DA0:
        push    ds
        push    ZONE_LEN_FIX
        push    1
        push    0cdh
        push    1fh
        push    5
        push    0
        push    0
        callf   TEXT2_SEG:voice_trigger_full
        ret
        db      90h

X_07DB8:
        push    0b5h
        push    28h
        push    0
        push    0
        callf   TEXT2_SEG:voice_trigger_caller
        ret
        db      00h

X_07DC8:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_PLAY_MODE], 0
        jle     X_07DD9
        dec     byte ptr [G_PLAY_MODE]

X_07DD9:
        call    zone_end_fine_arm_field
        pop     ds
        retf

X_07DDE:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_PLAY_MODE], 2
        jge     L_07DEF
        inc     byte ptr [G_PLAY_MODE]

L_07DEF:
        call    zone_end_fine_arm_field
        pop     ds
        retf

L_07DF4:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    TBL_WINKEYS_ZONE_END_FINE
        nop
        push    cs
        call    win_keys_merge
        mov     byte ptr [G_PLAY_MODE], 0
        call    zone_end_fine_arm_field
        pop     ds
        retf
        db      00h

zone_edit_arm_field:
        mov     al, byte ptr [G_PLAY_MODE]
        cbw
        dec     ax
        je      br_07E28
        dec     ax
        je      X_07E40
        push    0b5h
        push    0ch
        push    0
        push    0
        callf   TEXT2_SEG:ui_edit_zone_end
        ret
        db      90h

br_07E28:
        push    ds
        push    ZONE_LEN_FIX
        push    1
        push    0cdh
        push    1fh
        push    5
        push    0
        push    0
        callf   TEXT2_SEG:voice_trigger_full
        ret
        db      90h

X_07E40:
        push    0b5h
        push    28h
        push    0
        push    0
        callf   TEXT2_SEG:voice_trigger_caller
        ret
        db      00h

X_07E50:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_PLAY_MODE], 0
        jle     X_07E61
        dec     byte ptr [G_PLAY_MODE]

X_07E61:
        call    zone_edit_arm_field
        pop     ds
        retf

X_07E66:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_PLAY_MODE], 2
        jge     L_07E77
        inc     byte ptr [G_PLAY_MODE]

L_07E77:
        call    zone_edit_arm_field
        pop     ds
        retf

L_07E7C:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_3A30
        nop
        push    cs
        call    win_keys_merge
        mov     byte ptr [G_PLAY_MODE], 0
        call    zone_edit_arm_field
        pop     ds
        retf
        db      00h
zone_action_new_sample:
        enter   3ah, 0
        push    di
        push    si
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        sub     ax, word ptr [bp+0ch]
        sbb     dx, word ptr [bp+0eh]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        lea     cx, [bp-3ah]
        push    ss
        push    cx
        callf   TEXT2_SEG:sample_desc_init
        sub     ax, ax
        mov     word ptr [bp-24h], ax
        mov     word ptr [bp-26h], ax
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        mov     word ptr [bp-1eh], ax
        mov     word ptr [bp-1ch], dx
        mov     word ptr [bp-22h], ax
        mov     word ptr [bp-20h], dx
        push    0
        push    word ptr [bp-18h]
        push    word ptr [bp-1ah]
        nop
        push    cs
        call    addr_calc_segment
        add     sp, 6
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        les     bx, [bp+10h]

; ZONE->NEW SAMPLE: new SAMPLE_POOL_DIR slot, copy [G_ZONE_START,G_ZONE_END).
        mov     al, byte ptr es:[bx+SND_STEREO]
        mov     byte ptr [bp-27h], al
        push    ds
        lea     si, [bp-3ah]
        mov     cx, ss
        mov     ds, cx
        les     di, [bp+4]
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
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        push    1
        callf   TEXT2_SEG:sample_access_caller
        or      ax, ax
        jne     br_07F30

loop_07F28:
        xor     ax, ax
        pop     si
        pop     di
        leave
        ret     10h

br_07F30:
        lea     ax, [bp-0ah]
        push    ss
        push    ax
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        mov     al, byte ptr [bp-27h]
        cbw
        push    ax
        callf   TEXT2_SEG:mem_io_handler
        or      ax, ax
        je      loop_07F28
        sub     sp, 36h
        push    ds
        lea     si, [bp-3ah]
        mov     di, sp
        add     di, 2
        push    ss
        pop     es
        push    ss
        pop     ds
        mov     cx, 1bh
        rep movsw
        pop     ds
        callf   TEXT2_SEG:sample_pool_add
        les     bx, [bp+10h]
        mov     si, word ptr es:[bx+SND_POOL_IDX]
        mov     ax, si
        shl     si, 2
        add     si, ax
        add     si, si
        mov     ax, word ptr [si+SMEM_POOL]
        mov     dx, word ptr [si+SMEM_POOL_BASE_HI]
        add     word ptr [bp+0ch], ax
        adc     word ptr [bp+0eh], dx
        push    word ptr [bp+0eh]
        push    word ptr [bp+0ch]
        mov     si, word ptr [bp-0ah]
        mov     ax, si
        shl     si, 2
        add     si, ax
        add     si, si
        push    word ptr [si+SMEM_POOL_BASE_HI]
        push    word ptr [si+SMEM_POOL]
        push    word ptr [bp-1ch]
        push    word ptr [bp-1eh]
        callf   TEXT2_SEG:smem_copy_buffered
        les     bx, [bp+10h]
        cmp     byte ptr es:[bx+SND_STEREO], 0
        je      L_07FFC
        mov     ax, word ptr es:[bx+SND_LENGTH]
        mov     dx, word ptr es:[bx+SND_LENGTH_HI]
        add     ax, 0fh
        adc     dx, 0
        and     al, 0f0h
        add     word ptr [bp+0ch], ax
        adc     word ptr [bp+0eh], dx
        push    word ptr [bp+0eh]
        push    word ptr [bp+0ch]
        mov     ax, word ptr [bp-1eh]
        mov     dx, word ptr [bp-1ch]
        add     ax, 0fh
        adc     dx, 0
        and     al, 0f0h
        mov     bx, word ptr [bp-0ah]
        mov     cx, bx
        shl     bx, 2
        add     bx, cx
        add     bx, bx
        add     ax, word ptr [bx+SMEM_POOL]
        adc     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        push    dx
        push    ax
        push    word ptr [bp-1ch]
        push    word ptr [bp-1eh]
        callf   TEXT2_SEG:smem_copy_buffered

L_07FFC:
        mov     ax, 1
        pop     si

L_08000:
        pop     di
        leave
        ret     10h
        db      00h

; INSERT Sound->ZONE START: splice another sample's audio in at G_ZONE_START.
zone_action_insert_start:
        enter   40h, 0
        push    di
        push    si
; ? zone_action_slice_impl @0x0800e is mid-instruction
        mov     ax, word ptr [bp+0ch]
        mov     dx, word ptr [bp+0eh]
        push    ds
        lea     di, [bp-3ah]
        mov     si, ax
        push    ss
        pop     es
        mov     ds, dx
        mov     cx, 1bh
        rep movsw
        pop     ds
        lea     cx, [bp-0ah]
        push    ss

L_08026:
        push    cx
        les     bx, [bp+4]
        mov     cx, word ptr es:[bx+SND_LENGTH]
        mov     si, word ptr es:[bx+SND_LENGTH_HI]
        mov     bx, ax
        mov     es, dx
        add     cx, word ptr es:[bx+SND_LENGTH]
        adc     si, word ptr es:[bx+SND_LENGTH_HI]
        push    si
        push    cx
        mov     al, byte ptr es:[bx+SND_STEREO]
        cbw
        push    ax
        callf   TEXT2_SEG:mem_io_handler
        or      ax, ax
        jne     br_08052
        jmp     br_08347

br_08052:
        mov     si, word ptr [bp+4]
        les     bx, [bp+0ch]
        mov     di, word ptr es:[bx+SND_POOL_IDX]
        mov     ax, di
        shl     di, 2
        add     di, ax
        add     di, di
        push    word ptr [di+SMEM_POOL_BASE_HI]
        push    word ptr [di+SMEM_POOL]
        mov     di, word ptr [bp-0ah]
        mov     ax, di
        shl     di, 2
        add     di, ax
        add     di, di
        push    word ptr [di+SMEM_POOL_BASE_HI]
        push    word ptr [di+SMEM_POOL]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        callf   TEXT2_SEG:smem_copy_buffered
        mov     es, word ptr [bp+6]
        mov     bx, word ptr es:[si+SND_POOL_IDX]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        push    word ptr [bx+SMEM_POOL_BASE_HI]
        push    word ptr [bx+SMEM_POOL]
        mov     bx, word ptr [bp-0ah]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL]
        mov     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        add     ax, word ptr [bp+8]
        adc     dx, word ptr [bp+0ah]
        push    dx
        push    ax
        push    word ptr es:[si+SND_LENGTH_HI]
        push    word ptr es:[si+SND_LENGTH]
        callf   TEXT2_SEG:smem_copy_buffered
        les     bx, [bp+0ch]
        mov     di, word ptr es:[bx+SND_POOL_IDX]
        mov     ax, di
        shl     di, 2
        add     di, ax
        add     di, di
        mov     ax, word ptr [di+SMEM_POOL]
        mov     dx, word ptr [di+SMEM_POOL_BASE_HI]
        add     ax, word ptr [bp+8]
        adc     dx, word ptr [bp+0ah]
        push    dx
        push    ax
        mov     di, word ptr [bp-0ah]
        mov     ax, di
        shl     di, 2
        add     di, ax
        add     di, di
        mov     ax, word ptr [di+SMEM_POOL]
        mov     dx, word ptr [di+SMEM_POOL_BASE_HI]
        mov     es, word ptr [bp+6]
        add     ax, word ptr es:[si+SND_LENGTH]
        adc     dx, word ptr es:[si+SND_LENGTH_HI]
        add     ax, word ptr [bp+8]
        adc     dx, word ptr [bp+0ah]
        push    dx
        push    ax
        mov     es, word ptr [bp+0eh]
        mov     ax, word ptr es:[bx+SND_LENGTH]
        mov     dx, word ptr es:[bx+SND_LENGTH_HI]
        sub     ax, word ptr [bp+8]
        sbb     dx, word ptr [bp+0ah]
        push    dx
        push    ax
; ? zone_action_slice_case @0x0812a is mid-instruction
        callf   TEXT2_SEG:smem_copy_buffered
        les     bx, [bp+0ch]
; ? ext_dispatch_tail @0x08130 is mid-instruction
        cmp     byte ptr es:[bx+SND_STEREO], 0
        jne     br_08139
        jmp     br_082C6

br_08139:
        push    0
        push    2
        mov     bx, word ptr [bp-0ah]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        push    word ptr [bx+SMEM_POOL_LEN_HI]
        push    word ptr [bx+SMEM_POOL_LEN]
        mov     di, bx
        nop
        push    cs
        call    __aFldiv
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    0
        push    2
        les     bx, [bp+0ch]
        mov     bx, word ptr es:[bx+SND_POOL_IDX]
        mov     cx, bx
        shl     bx, 2
        add     bx, cx
        add     bx, bx
        push    word ptr [bx+SMEM_POOL_LEN_HI]
        push    word ptr [bx+SMEM_POOL_LEN]
        mov     word ptr [bp-3eh], ax
        mov     word ptr [bp-3ch], dx
        mov     word ptr [bp-40h], bx
        nop
        push    cs
        call    __aFldiv
        mov     bx, word ptr [bp-40h]
        add     ax, word ptr [bx+SMEM_POOL]
        adc     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        push    dx
        push    ax
        mov     ax, word ptr [bp-3eh]
        mov     dx, word ptr [bp-3ch]
        add     ax, word ptr [di+SMEM_POOL]
        adc     dx, word ptr [di+SMEM_POOL_BASE_HI]
        push    dx
        push    ax
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        callf   TEXT2_SEG:smem_copy_buffered
        mov     es, word ptr [bp+6]
        cmp     byte ptr es:[si+SND_STEREO], 0
        je      tgt_0820C
        push    0
        push    2
        mov     bx, word ptr es:[si+SND_POOL_IDX]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        push    word ptr [bx+SMEM_POOL_LEN_HI]
        push    word ptr [bx+SMEM_POOL_LEN]
        mov     di, bx
        nop
        push    cs
        call    __aFldiv
        add     ax, word ptr [di+SMEM_POOL]
        adc     dx, word ptr [di+SMEM_POOL_BASE_HI]
        push    dx
        push    ax
        mov     bx, word ptr [bp-0ah]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL]
        mov     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        add     ax, word ptr [bp-4]
        adc     dx, word ptr [bp-2]
        add     ax, word ptr [bp+8]
        adc     dx, word ptr [bp+0ah]
        push    dx
        push    ax
        mov     es, word ptr [bp+6]
        jmp     tgt_08243
        db      90h
tgt_0820C:
        mov     bx, word ptr es:[si+SND_POOL_IDX]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        push    word ptr [bx+SMEM_POOL_BASE_HI]
        push    word ptr [bx+SMEM_POOL]
        mov     bx, word ptr [bp-0ah]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL]
        mov     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        add     ax, word ptr [bp-4]
        adc     dx, word ptr [bp-2]
        add     ax, word ptr [bp+8]
        adc     dx, word ptr [bp+0ah]
        push    dx
        push    ax

tgt_08243:
        push    word ptr es:[si+SND_LENGTH_HI]
        push    word ptr es:[si+SND_LENGTH]
        callf   TEXT2_SEG:smem_copy_buffered
        push    0
        push    2
        les     bx, [bp+0ch]
        mov     di, word ptr es:[bx+SND_POOL_IDX]
        mov     ax, di
        shl     di, 2
        add     di, ax
        add     di, di
        push    word ptr [di+SMEM_POOL_LEN_HI]
        push    word ptr [di+SMEM_POOL_LEN]
        nop
        push    cs
        call    __aFldiv
        add     ax, word ptr [di+SMEM_POOL]
        adc     dx, word ptr [di+SMEM_POOL_BASE_HI]
        add     ax, word ptr [bp+8]
        adc     dx, word ptr [bp+0ah]
        push    dx
        push    ax
        mov     bx, word ptr [bp-0ah]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL]
        mov     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        mov     es, word ptr [bp+6]
        add     ax, word ptr es:[si+SND_LENGTH]
        adc     dx, word ptr es:[si+SND_LENGTH_HI]
        add     ax, word ptr [bp-4]
        adc     dx, word ptr [bp-2]
        add     ax, word ptr [bp+8]
        adc     dx, word ptr [bp+0ah]
        push    dx
        push    ax
        les     bx, [bp+0ch]
        mov     ax, word ptr es:[bx+SND_LENGTH]
        mov     dx, word ptr es:[bx+SND_LENGTH_HI]
        sub     ax, word ptr [bp+8]
        sbb     dx, word ptr [bp+0ah]
        push    dx
        push    ax
        callf   TEXT2_SEG:smem_copy_buffered

br_082C6:
        les     bx, [bp+0ch]
        push    word ptr es:[bx+SND_POOL_IDX]
        nop
        push    cs
        call    smem_free
        les     bx, [bp+0ch]
        mov     ax, word ptr es:[bx+SND_LENGTH]
        mov     dx, word ptr es:[bx+SND_LENGTH_HI]
        mov     es, word ptr [bp+6]
        add     ax, word ptr es:[si+SND_LENGTH]
        adc     dx, word ptr es:[si+SND_LENGTH_HI]
        mov     word ptr [bp-1eh], ax
        mov     word ptr [bp-1ch], dx
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        cmp     word ptr [bp-24h], dx
        jl      br_0830E
        jg      br_08300
        cmp     word ptr [bp-26h], ax
        jbe     br_0830E

br_08300:
        mov     ax, word ptr es:[si+SND_LENGTH]
        mov     dx, word ptr es:[si+SND_LENGTH_HI]
        add     word ptr [bp-26h], ax
        adc     word ptr [bp-24h], dx

br_0830E:
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        cmp     word ptr [bp-20h], dx
        jl      br_0832E
        jg      br_08320
        cmp     word ptr [bp-22h], ax
        jbe     br_0832E

br_08320:
        mov     ax, word ptr es:[si+SND_LENGTH]
        mov     dx, word ptr es:[si+SND_LENGTH_HI]
        add     word ptr [bp-22h], ax
        adc     word ptr [bp-20h], dx

br_0832E:
        push    ds
        lea     si, [bp-3ah]
        mov     ax, ss
        mov     ds, ax
        les     di, [bp+0ch]
        mov     cx, 1bh
        rep movsw
        pop     ds
        callf   TEXT2_SEG:smem_compact
        mov     ax, 1

br_08347:
        pop     si
        pop     di
        leave
        ret     0ch
        db      00h

main_handler_1:
; SILENCE ZONE: per channel memset(pool+stride+G_ZONE_START, 0, zone_len).
zone_action_silence:
        enter   0eh, 0
        push    di
        push    si
        mov     si, word ptr [bp+0ch]
        mov     es, word ptr [bp+0eh]
        mov     al, byte ptr es:[si+SND_STEREO]
        cbw
        mov     word ptr [bp-0ah], ax
        xor     ax, ax
        mov     bx, BUF_XFER
        mov     cx, 400h
        push    es
        mov     di, bx
        push    ds
        pop     es
        rep stosw
        pop     es
        mov     bx, word ptr es:[si+SND_POOL_IDX]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL]
        mov     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        add     ax, word ptr [bp+8]
        adc     dx, word ptr [bp+0ah]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     ax, word ptr [bp+4]
        mov     dx, word ptr [bp+6]
        sub     ax, word ptr [bp+8]
        sbb     dx, word ptr [bp+0ah]
        mov     word ptr [bp-0eh], ax
        mov     word ptr [bp-0ch], dx
tgt_083A5:
        mov     ax, word ptr [bp-0eh]
        mov     dx, word ptr [bp-0ch]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_083F7

loop_083B5:
        cmp     word ptr [bp-2], 0
        jl      br_083CA
        jg      br_083C4
        cmp     word ptr [bp-4], 400h
        jbe     br_083CA

br_083C4:
        mov     si, 400h
        jmp     br_083CD
        db      90h

br_083CA:
        mov     si, word ptr [bp-4]

br_083CD:
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    ds
        push    BUF_XFER
        push    si
        callf   TEXT2_SEG:flash_write_words
        mov     ax, si
        cwd
        add     word ptr [bp-8], ax
        adc     word ptr [bp-6], dx
        sub     word ptr [bp-4], si
        sbb     word ptr [bp-2], dx
        mov     ax, word ptr [bp-2]
        or      ax, word ptr [bp-4]
        jne     loop_083B5
        mov     si, word ptr [bp+0ch]
br_083F7:
        mov     es, word ptr [bp+0eh]
        mov     ax, word ptr es:[si+SND_LENGTH]
        mov     dx, word ptr es:[si+SND_LENGTH_HI]
        add     ax, 0fh
        adc     dx, 0
        and     al, 0f0h
        mov     bx, word ptr es:[si+SND_POOL_IDX]
        mov     cx, bx
        shl     bx, 2
        add     bx, cx
        add     bx, bx
        add     ax, word ptr [bx+SMEM_POOL]
        adc     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        add     ax, word ptr [bp+8]
        adc     dx, word ptr [bp+0ah]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     ax, word ptr [bp-0ah]
        dec     word ptr [bp-0ah]
        or      ax, ax
        je      tgt_08438
        jmp     tgt_083A5
tgt_08438:
        mov     ax, 1
        pop     si
        pop     di
        leave
        ret     0ch
        db      00h

; DELETE ZONE: shift the tail down over [G_ZONE_START,G_ZONE_END), per channel.
zone_action_delete:
        enter   24h, 0
        push    di
        push    si
; ? zone_udiv32 @0x0844a is mid-instruction
        mov     si, word ptr [bp+0ch]
        mov     es, word ptr [bp+0eh]
        mov     ax, word ptr es:[si+SND_LENGTH]
        mov     dx, word ptr es:[si+SND_LENGTH_HI]
        mov     word ptr [bp-10h], ax
; ? zas_byte_to_ascii @0x0845b is mid-instruction
        mov     word ptr [bp-0eh], dx
        mov     cx, ax
        mov     bx, dx
        sub     ax, word ptr [bp+4]
        sbb     dx, word ptr [bp+6]
        mov     word ptr [bp-18h], ax
        mov     word ptr [bp-16h], dx
        add     ax, word ptr [bp+8]
        adc     dx, word ptr [bp+0ah]
; fills ZONE_TABLE.zone_boundary[0..zone_count] with equally-spaced points.
t1_zone_recompute_boundaries:
        mov     word ptr [bp-14h], ax
        mov     word ptr [bp-12h], dx
        mov     di, word ptr es:[si+SND_POOL_IDX]
        mov     word ptr [bp-1ch], ax
        mov     word ptr [bp-1ah], dx
        mov     ax, di
        shl     di, 2
        add     di, ax
        add     di, di
        mov     ax, word ptr [di+SMEM_POOL]
        mov     dx, word ptr [di+SMEM_POOL_BASE_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        add     cx, 0fh
        adc     bx, 0
        and     cl, 0f0h
        mov     word ptr [bp-0ch], cx
        mov     word ptr [bp-0ah], bx
        mov     cx, word ptr [bp-1ch]
        mov     bx, word ptr [bp-1ah]
        add     cx, 0fh
        adc     bx, 0
        and     cl, 0f0h
        mov     word ptr [bp-8], cx
        mov     word ptr [bp-6], bx
        mov     cx, ax
        mov     bx, dx
        add     ax, word ptr [bp+4]
        adc     dx, word ptr [bp+6]
        push    dx
        push    ax
        add     cx, word ptr [bp+8]
        adc     bx, word ptr [bp+0ah]
        push    bx
        push    cx
        push    word ptr [bp-16h]
        push    word ptr [bp-18h]
        callf   TEXT2_SEG:input_handler
        mov     es, word ptr [bp+0eh]
        cmp     byte ptr es:[si+SND_STEREO], 0
        je      tgt_08548
        mov     ax, word ptr [bp-0ch]
        mov     dx, word ptr [bp-0ah]
        add     ax, word ptr [bp-4]
        adc     dx, word ptr [bp-2]
        push    dx
        push    ax
        mov     cx, word ptr [bp-8]
        mov     bx, word ptr [bp-6]
        add     cx, word ptr [bp-4]
        adc     bx, word ptr [bp-2]
        push    bx
        push    cx
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        mov     word ptr [bp-20h], cx
        mov     word ptr [bp-1eh], bx
        mov     word ptr [bp-24h], ax
        mov     word ptr [bp-22h], dx
        callf   TEXT2_SEG:input_handler
        mov     ax, word ptr [bp-24h]
        mov     dx, word ptr [bp-22h]
        add     ax, word ptr [bp+4]
        adc     dx, word ptr [bp+6]
        push    dx
        push    ax
        mov     ax, word ptr [bp-20h]
        mov     dx, word ptr [bp-1eh]
        add     ax, word ptr [bp+8]
        adc     dx, word ptr [bp+0ah]
        push    dx
        push    ax
        mov     ax, word ptr [bp-10h]
        mov     dx, word ptr [bp-0eh]
        sub     ax, word ptr [bp+4]
        sbb     dx, word ptr [bp+6]
        push    dx
        push    ax
        callf   TEXT2_SEG:input_handler
tgt_08548:
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        mov     es, word ptr [bp+0eh]
        mov     al, byte ptr es:[si+SND_STEREO]
        cbw
        inc     ax
        cwd
        push    dx
        push    ax
        nop
        push    cs
        call    __aFlmul
        mov     es, word ptr [bp+0eh]
        mov     bx, word ptr es:[si+SND_POOL_IDX]
        mov     cx, bx
        shl     bx, 2
        add     bx, cx
        add     bx, bx
        mov     word ptr [bx+SMEM_POOL_LEN], ax
        mov     word ptr [bx+SMEM_POOL_LEN_HI], dx
        mov     ax, word ptr [bp-14h]
        mov     dx, word ptr [bp-12h]
        mov     word ptr es:[si+SND_LENGTH], ax
        mov     word ptr es:[si+SND_LENGTH_HI], dx
        mov     ax, word ptr [bp+4]
        mov     dx, word ptr [bp+6]
        cmp     word ptr es:[si+SND_END_HI], dx
        jl      br_085B2
        jg      br_08599
        cmp     word ptr es:[si+SND_END], ax
        jbe     br_085B2
br_08599:
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        sub     ax, word ptr [bp+4]
        sbb     dx, word ptr [bp+6]
        mov     es, word ptr [bp+0eh]
        add     word ptr es:[si+SND_END], ax
        adc     word ptr es:[si+SND_END_HI], dx
        jmp     br_085D1
br_085B2:
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        mov     es, word ptr [bp+0eh]
        cmp     word ptr es:[si+SND_END_HI], dx
        jl      br_085D1
        jg      br_085C9
        cmp     word ptr es:[si+SND_END], ax
        jbe     br_085D1

br_085C9:
        mov     word ptr es:[si+SND_END], ax
        mov     word ptr es:[si+SND_END_HI], dx

br_085D1:
        mov     ax, word ptr [bp+4]
        mov     dx, word ptr [bp+6]
        mov     es, word ptr [bp+0eh]
        cmp     word ptr es:[si+SND_START_HI], dx
        jl      br_085FE
        jg      br_085E8
        cmp     word ptr es:[si+SND_START], ax
        jbe     br_085FE
br_085E8:
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        sub     ax, word ptr [bp+4]
        sbb     dx, word ptr [bp+6]
        add     word ptr es:[si+SND_START], ax
        adc     word ptr es:[si+SND_START_HI], dx
        jmp     br_0861A
br_085FE:
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        cmp     word ptr es:[si+SND_START_HI], dx
        jl      br_0861A
        jg      br_08612
        cmp     word ptr es:[si+SND_START], ax
        jbe     br_0861A

br_08612:
        mov     word ptr es:[si+SND_START], ax
        mov     word ptr es:[si+SND_START_HI], dx

br_0861A:
        mov     es, word ptr [bp+0eh]
        mov     ax, word ptr es:[si+SND_LOOP]
        mov     dx, word ptr es:[si+SND_LOOP_HI]
        cmp     word ptr es:[si+SND_END_HI], dx
        jg      br_0865A
        jl      br_08633
        cmp     word ptr es:[si+SND_END], ax
        jae     br_0865A
br_08633:
        push    0
        mov     ax, word ptr es:[si+SND_END]
        mov     dx, word ptr es:[si+SND_END_HI]
        mov     word ptr es:[si+SND_LOOP], ax
        mov     word ptr es:[si+SND_LOOP_HI], dx
        push    dx
        push    ax
        nop
        push    cs
        call    addr_calc_segment
        add     sp, 6
        mov     es, word ptr [bp+0eh]
        mov     word ptr es:[si+SND_FIELD_32], ax
        mov     word ptr es:[si+SND_FIELD_32_HI], dx
br_0865A:
        callf   TEXT2_SEG:smem_compact
        mov     ax, 1
        pop     si
        pop     di
        leave
        ret     0ch

; REVERSE ZONE: in-place reversal of [G_ZONE_START,G_ZONE_END) per channel.
zone_action_reverse:
        enter   14h, 0
        push    di
        push    si
; ? zone_load_current_zone @0x08670 is mid-instruction
        mov     si, word ptr [bp+0ch]
        mov     es, word ptr [bp+0eh]
        mov     al, byte ptr es:[si+SND_STEREO]
        cbw
        mov     di, ax
        inc     di
        jne     loop_08681
        jmp     L_087EF

loop_08681:
        mov     bx, word ptr es:[si+SND_POOL_IDX]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL]
        mov     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        mov     cx, ax
        mov     bx, dx
        add     ax, word ptr [bp+8]
        adc     dx, word ptr [bp+0ah]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        add     cx, word ptr [bp+4]
        adc     bx, word ptr [bp+6]
        mov     word ptr [bp-8], cx
        mov     word ptr [bp-6], bx
        cmp     cx, ax
        jne     loop_086BD
        cmp     bx, dx
        jne     loop_086BD
        jmp     br_087CA
loop_086BD:
        mov     ax, cx
        mov     dx, bx
        sub     ax, word ptr [bp-4]
        sbb     dx, word ptr [bp-2]
        cmp     ax, 1
        jne     br_086D3
        or      dx, dx
        jne     br_086D3
        jmp     br_087CA
br_086D3:
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        sub     ax, word ptr [bp-4]
        sbb     dx, word ptr [bp-2]
        or      dx, dx
        jge     br_086E6
        jmp     br_08794
; ? zone_store_current_zone @0x0869e is mid-instruction

br_086E6:
        jg      br_086F0
        cmp     ax, 400h
        ja      br_086F0
        jmp     br_08794

br_086F0:
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        add     ah, 2
        adc     dx, 0
        mov     cx, ax
        mov     bx, dx
        sub     ax, 1
        sbb     dx, 0
        push    dx
        push    ax
        push    ds
        push    BUF_XFER
        push    200h
        push    0f000h
        mov     word ptr [bp-0eh], cx
        mov     word ptr [bp-0ch], bx
        callf   TEXT2_SEG:smem_dma_copy
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        sub     ax, 1
        sbb     dx, 0
        push    dx
        push    ax
        push    ds
        push    P_A324
        push    200h
        push    0f000h
        callf   TEXT2_SEG:smem_dma_copy
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    ds
        push    P_A324
        push    200h
        callf   TEXT2_SEG:flash_write_words
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        sub     ax, 200h
        sbb     dx, 0
        push    dx
        push    ax
        push    ds
        push    BUF_XFER
        push    200h
        mov     word ptr [bp-12h], ax
        mov     word ptr [bp-10h], dx
        callf   TEXT2_SEG:flash_write_words
        mov     ax, word ptr [bp-0eh]
        mov     dx, word ptr [bp-0ch]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     cx, word ptr [bp-12h]
        mov     bx, word ptr [bp-10h]
        mov     word ptr [bp-8], cx
        mov     word ptr [bp-6], bx
        cmp     cx, ax
        je      br_0878B
        jmp     loop_086BD

br_0878B:
        cmp     bx, dx
        je      br_08792
        jmp     loop_086BD

br_08792:
        jmp     br_087CA

br_08794:
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        sub     ax, 1
        sbb     dx, 0
        push    dx
        push    ax
        push    ds
        push    BUF_XFER
        mov     ax, word ptr [bp-8]
        sub     ax, word ptr [bp-4]
        push    ax
        push    0f000h
        mov     word ptr [bp-14h], ax
        callf   TEXT2_SEG:smem_dma_copy
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    ds
        push    BUF_XFER
        push    word ptr [bp-14h]
        callf   TEXT2_SEG:flash_write_words
br_087CA:
        mov     es, word ptr [bp+0eh]
        mov     ax, word ptr es:[si+SND_LENGTH]
        mov     dx, word ptr es:[si+SND_LENGTH_HI]
        add     ax, 0fh
        adc     dx, 0
        and     al, 0f0h
        add     word ptr [bp+8], ax
        adc     word ptr [bp+0ah], dx
        add     word ptr [bp+4], ax
        adc     word ptr [bp+6], dx
        dec     di
        je      L_087EF
        jmp     loop_08681

L_087EF:
        mov     ax, 1
        pop     si
        pop     di
        leave
        ret     0ch

L_087F8:
; DO IT dispatcher; only 6-byte tail 882Dh-8832h is patched.
L_087F8_DO_IT_dispatcher_note:
zone_edit_do_it:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     si, 1
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        callf   TEXT2_SEG:voice_release_all_if
        push    word ptr [PTR_DL_PROCESSING_SEG]
        push    word ptr [PTR_DL_PROCESSING]
        nop
        push    cs
        call    disp_list_run
        mov     al, byte ptr [ZONE_EDIT_ACTION]
        cbw
        or      ax, ax
        je      br_08836
        dec     ax
        je      br_08858
        dec     ax
        je      br_08876
        dec     ax
        je      br_0889A
        dec     ax
        ZS_HOOK_EXT_DISPATCH

L_08833:
        jmp     br_088D5

br_08836:
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        push    word ptr [G_ZONE_START_HI]
        push    word ptr [G_ZONE_START]
        push    word ptr [ZONE_END_HI]
        push    word ptr [G_ZONE_END]
        push    ds
        push    TBL_SOUND_NAMES
        call    zone_action_new_sample
        jmp     br_088D3
        db      90h

br_08858:
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        push    word ptr [G_ZONE_START_HI]
        push    word ptr [G_ZONE_START]
        push    word ptr [FP_SND_SECONDARY_SEG]
        push    word ptr [FP_SND_SECONDARY]
        call    zone_action_insert_start
        jmp     br_088D3
        db      90h

br_08876:
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        push    word ptr [G_ZONE_START_HI]
        push    word ptr [G_ZONE_START]
        push    word ptr [ZONE_END_HI]
        push    word ptr [G_ZONE_END]
        call    zone_action_delete
        mov     si, ax
        callf   TEXT2_SEG:zone_range_clamp
        jmp     br_088D5

br_0889A:
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        push    word ptr [G_ZONE_START_HI]
        push    word ptr [G_ZONE_START]
        push    word ptr [ZONE_END_HI]
        push    word ptr [G_ZONE_END]
        call    main_handler_1
        jmp     br_088D3
        db      90h

br_088B8:
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        push    word ptr [G_ZONE_START_HI]
        push    word ptr [G_ZONE_START]
        push    word ptr [ZONE_END_HI]
        push    word ptr [G_ZONE_END]
        call    zone_action_reverse

br_088D3:
        mov     si, ax

br_088D5:
        or      si, si
        jne     br_088DE
        callf   TEXT2_SEG:err_msg_report

br_088DE:
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        callf   TEXT2_SEG:voice_buffer_init
        push    ds
        push    P_3AE4
        nop
        push    cs
        call    disp_list_run
        callf   TEXT2_SEG:zone_edit_cancel
        pop     ds
        pop     si
        retf

trim_arm_field:
        mov     ax, word ptr [SND_CURRENT+2]
        or      ax, word ptr [SND_CURRENT]
        jne     br_08911
        mov     al, byte ptr [G_TRACK_MODE]
        cbw
        dec     ax
        je      br_08911
        mov     byte ptr [G_TRACK_MODE], 0

br_08911:
        mov     al, byte ptr [G_TRACK_MODE]
        cbw
        or      ax, ax
        jne     br_0891C
        jmp     br_089EE

br_0891C:
        dec     ax
        jne     br_08922
        jmp     L_089F6

br_08922:
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        callf   TEXT2_SEG:sample_check_active
        or      ax, ax
        je      br_089AA
        mov     al, byte ptr [G_TRACK_MODE]
        cbw
        dec     ax
        dec     ax
        je      br_08962
        dec     ax
        je      br_0898C
        push    ds
        push    G_EDIT_FIELD_VAL
        mov     al, 88h
        mov     byte ptr [G_EDIT_FIELD_VAL], al
        push    -78h
        push    -78h
tgt_0894B:
        push    3
        push    2bh
        push    23h
        push    0
        push    0
        push    0
        push    0
        callf   TEXT2_SEG:field_register_s8
        jmp     br_089FB
        db      90h
br_08962:
        mov     ax, word ptr [SND_CURRENT]
        mov     dx, word ptr [SND_CURRENT+2]
        add     ax, 11h
        push    dx
        push    ax
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx]
        push    ax
        push    ax

loop_08977:
        push    3
        push    31h
        push    13h

loop_0897D:
        push    0
        push    0
        push    0
        push    0
        callf   TEXT2_SEG:status_read_6A_3
        jmp     br_089FB

br_0898C:
        mov     ax, word ptr [SND_CURRENT]
        mov     dx, word ptr [SND_CURRENT+2]
        add     ax, 25h
        push    dx
        push    ax
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx]
        push    ax
        push    ax
loop_089A1:
        push    2
        push    0d3h
        push    11h
        jmp     loop_0897D
br_089AA:
        mov     al, byte ptr [G_TRACK_MODE]
        cbw
        dec     ax
        dec     ax
        je      tgt_089C8
        dec     ax
        je      tgt_089DC
        mov     ax, word ptr [SND_CURRENT]
        mov     dx, word ptr [SND_CURRENT+2]
        add     ax, 12h
        push    dx
        push    ax
        push    -78h
        push    78h
        jmp     tgt_0894B
        db      90h
tgt_089C8:
        mov     ax, word ptr [SND_CURRENT]
        mov     dx, word ptr [SND_CURRENT+2]
        add     ax, 11h
        push    dx
        push    ax
        push    0
        push    0c8h
        jmp     loop_08977
        db      90h
tgt_089DC:
        mov     ax, word ptr [SND_CURRENT]
        mov     dx, word ptr [SND_CURRENT+2]
        add     ax, 25h
        push    dx
        push    ax
        push    1
        push    20h
        jmp     loop_089A1

br_089EE:
        callf   TEXT2_SEG:X_090B2
        jmp     br_089FB
        db      90h

L_089F6:
        callf   TEXT2_SEG:L_090D4

br_089FB:
        cmp     byte ptr [G_TRACK_MODE], 1
        jle     L_08A0B
        push    0
        push    0
        callf   TEXT2_SEG:install_handler_15

L_08A0B:
        ret

X_08A0C:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_TRACK_MODE], 1
        jle     X_08A21
        sub     byte ptr [G_TRACK_MODE], 2
        call    trim_arm_field

X_08A21:
        pop     ds
        retf
        db      00h

X_08A24:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_TRACK_MODE], 3
        jge     X_08A39
        add     byte ptr [G_TRACK_MODE], 2
        call    trim_arm_field

X_08A39:
        pop     ds
        retf
        db      00h

X_08A3C:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_TRACK_MODE], 0
        jle     X_08A50
        dec     byte ptr [G_TRACK_MODE]
        call    trim_arm_field

X_08A50:
        pop     ds
        retf

X_08A52:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_TRACK_MODE], 4
        jge     X_08A66
        inc     byte ptr [G_TRACK_MODE]
        call    trim_arm_field

X_08A66:
        pop     ds
        retf

snd_params_screen_enter:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_3B84
        nop
        push    cs
        call    win_keys_merge
        mov     byte ptr [G_SND_EDIT_PAGE], 3
        callf   TEXT2_SEG:zone_range_clamp
        call    trim_arm_field
        pop     ds
        retf

X_08A86:
        mov     word ptr [G_ERRNO], ERR_FILE_DAMAGED
        push    190h
        push    ds
        push    B_8A0E
        nop
        push    cs
        call    int2F_call_fn6
        add     sp, 6
        cmp     ax, 190h
        jne     X_08ADA
        call    main_handler_2
        or      ax, ax
        je      X_08ADA
        push    880h
        push    ds
        push    TBL_SOUND_NAMES
        nop
        push    cs
        call    int2F_call_fn6
        add     sp, 6
        cmp     ax, 880h
        jne     X_08ADA
        nop
        push    cs
        call    int2F_dispatch_10
        push    ds
        push    B_8A0E
        callf   TEXT2_SEG:lcd_cmd_wrapper
        mov     al, byte ptr [PGM_SLOT]
        cbw
        push    ax
        callf   TEXT2_SEG:program_select
        callf   TEXT2_SEG:sample_proc_wrapper
        retf
        db      90h

X_08ADA:
        nop
        push    cs
        call    int2F_dispatch_10
        callf   TEXT2_SEG:err_msg_report
        xor     ax, ax
        retf
        db      00h

; list scan: far-calls TEXT2 05972h to initialize, then loops on counter.
main_handler_2:
        enter   2, 0
        push    di
        push    si
        callf   TEXT2_SEG:X_05972
        xor     di, di
        mov     word ptr [bp-2], di
        cmp     byte ptr [B_8A0E], 0
        jle     br_08B70

loop_08AFF:
        nop
        push    cs
        call    int2F_call_fn5
        mov     si, ax
        cmp     si, -1
        je      br_08B5C
        cmp     si, 18h
        jle     br_08B13
        mov     si, 17h

br_08B13:
        push    79bh
        push    ds
        push    P_64DA
        nop
        push    cs
        call    int2F_call_fn6
        add     sp, 6
        cmp     ax, 79bh
        jne     br_08B5C
        push    si
        callf   TEXT2_SEG:program_select_wrapper
        or      ax, ax
        je      br_08B68
        mov     bx, si
        shl     bx, 2
        push    word ptr [bx+PGM_TABLE+2]
        push    word ptr [bx+PGM_TABLE]
        push    ds
        push    P_64DA
        callf   TEXT2_SEG:lcd_region_copy
        or      si, si
        jne     br_08B50
        mov     word ptr [bp-2], 1
br_08B50:
        mov     al, byte ptr [B_8A0E]
        cbw
        inc     di
        cmp     ax, di
        jg      loop_08AFF
        jmp     br_08B70
        db      90h

br_08B5C:
        mov     word ptr [G_ERRNO], ERR_FILE_DAMAGED

loop_08B62:
        xor     ax, ax
        pop     si
        pop     di
        leave
        ret

br_08B68:
        mov     word ptr [G_ERRNO], ERR_NO_MEMORY
        jmp     loop_08B62

br_08B70:
        cmp     word ptr [bp-2], 0
        jne     br_08B7D
        push    0
        callf   TEXT2_SEG:smem_dma_init

br_08B7D:
        mov     ax, 1
        pop     si
        pop     di
        leave
        ret

X_08B84:
        mov     word ptr [G_ERRNO], ERR_FILE_DAMAGED
        push    141h
        push    ds
        push    B_8A0E
        nop
        push    cs
        call    int2F_call_fn6
        add     sp, 6
        cmp     ax, 141h
        jne     X_08BDC
        call    tgt_08BEA
        or      ax, ax
        je      X_08BDC
        push    880h
        push    ds
        push    TBL_SOUND_NAMES
        nop
        push    cs
        call    int2F_call_fn6
        add     sp, 6
        cmp     ax, 880h
        jne     X_08BDC
        nop
        push    cs
        call    int2F_dispatch_10
        push    ds
        push    B_9D5A
        push    ds
        push    B_8A0E
        callf   TEXT2_SEG:lcd_line_clear
        mov     al, byte ptr [PGM_SLOT]
        cbw
        push    ax
        callf   TEXT2_SEG:program_select
        callf   TEXT2_SEG:sample_proc_wrapper
        retf
        db      90h

X_08BDC:
        nop
        push    cs
        call    int2F_dispatch_10
        callf   TEXT2_SEG:err_msg_report
        xor     ax, ax
        retf
        db      00h

tgt_08BEA:
        push    di
        push    si
        xor     di, di
        cmp     byte ptr [B_8A0E], 0
        jle     br_08C46
        mov     si, PGM_TABLE

loop_08BF8:
        push    77eh
        push    ds
        push    P_64DA
        nop
        push    cs
        call    int2F_call_fn6
        add     sp, 6
        cmp     ax, 77eh
        jne     L_08C32
        push    di
        callf   TEXT2_SEG:program_select_wrapper
        or      ax, ax
        je      br_08C3E
        push    word ptr [si+2]
        push    word ptr [si]
        push    ds
        push    P_64DA
        callf   TEXT2_SEG:lcd_buffer_copy
        add     si, 4
        mov     al, byte ptr [B_8A0E]
        cbw
        inc     di
        cmp     ax, di
        jg      loop_08BF8
        jmp     br_08C46

L_08C32:
        mov     word ptr [G_ERRNO], ERR_FILE_DAMAGED

loop_08C38:
        xor     ax, ax
        pop     si
        pop     di
        ret
        db      90h

br_08C3E:
        mov     word ptr [G_ERRNO], ERR_NO_MEMORY
        jmp     loop_08C38

br_08C46:
        mov     ax, 1
        pop     si
        pop     di
        ret

fn_08C4C:
        push    si
        push    word ptr [FP_LOADED_SND_SEG]
        push    word ptr [FP_LOADED_SND]
        callf   TEXT2_SEG:sample_data_load_2
        mov     word ptr [W_509C], ax
        mov     word ptr [W_509E], dx
        mov     ax, dx
        or      ax, word ptr [W_509C]
        je      br_08C6E
        call    X_08D48
        pop     si
        ret
br_08C6E:
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        sub     ax, 23h
        cmp     ax, 3fh
        ja      br_08C99
        mov     ax, word ptr [FP_LOADED_SND]
        mov     dx, word ptr [FP_LOADED_SND_SEG]
        mov     cl, byte ptr [G_PAD_NOTE_BASE]
        sub     ch, ch
        imul    si, cx, PGM_PAD_STRIDE
        les     bx, [PGM_CURRENT]
        mov     word ptr es:[bx+si+PGM_PAD_NOTE0], ax
        mov     word ptr es:[bx+si+PGM_PAD_NOTE0+PGM_PAD_SND_SEG], dx
br_08C99:
        sub     ax, ax
        mov     word ptr [FP_LOADED_SND_SEG], ax
        mov     word ptr [FP_LOADED_SND], ax
        push    5
        callf   TEXT2_SEG:int43_wrapper
        pop     si
        ret

fn_08CAA:
        mov     ax, word ptr [FP_LOADED_SND_SEG]
        or      ax, word ptr [FP_LOADED_SND]
        je      L_08CCD
        push    word ptr [FP_LOADED_SND_SEG]
        push    word ptr [FP_LOADED_SND]
        callf   TEXT2_SEG:sample_validate_ptr
        push    word ptr [FP_LOADED_SND_SEG]
        push    word ptr [FP_LOADED_SND]
        callf   TEXT2_SEG:voice_release_all_if

L_08CCD:
        ret

file_exists_rename:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        call    fn_08C4C
        pop     ds
        retf
        db      00h

file_exists_refresh:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx

L_08CE0:
        call    fn_08CAA
        pop     ds
        retf
        db      00h

X_08CE6:
        push    ds
        push    TBL_WINKEYS_RENAME_FILE
        nop
        push    cs
        call    win_keys_merge
        push    word ptr [FP_LOADED_SND_SEG]
        push    word ptr [FP_LOADED_SND]
        push    71h
        push    13h
        nop
        push    cs
        call    far_call_wrapper_1
        ret
        db      00h
X_08D02:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        call    X_08CE6
        pop     ds
        retf
        db      00h

L_08D0E:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    word ptr [W_509E]
        push    word ptr [W_509C]
        push    word ptr [FP_LOADED_SND_SEG]
        push    word ptr [FP_LOADED_SND]
        callf   TEXT2_SEG:rep_memcpy_handler
        push    word ptr [W_509E]
        push    word ptr [W_509C]
        callf   TEXT2_SEG:sample_validate_ptr
        call    fn_08C4C
        pop     ds
        retf
        db      00h

X_08D3C:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        call    fn_08CAA
        pop     ds
        retf
        db      00h

X_08D48:
        push    ds
        push    P_3D9E
        nop
        push    cs
        call    win_keys_merge
        callf   TEXT2_SEG:far_02DD2
        push    ds
        push    DL_FILE_EXISTS
        nop
        push    cs
        call    disp_list_run
        ret

L_08D60:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    word ptr [FP_LOADED_SND_SEG]
        push    word ptr [FP_LOADED_SND]
        callf   TEXT2_SEG:voice_release_all_if
        mov     byte ptr [PAD_INPUT_MODE], 2
        call    fn_08C4C
        pop     ds
        retf
        db      00h

L_08D7E:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    word ptr [FP_LOADED_SND_SEG]
        push    word ptr [FP_LOADED_SND]
        callf   TEXT2_SEG:voice_release_all_if
        mov     byte ptr [PAD_INPUT_MODE], 2
        call    fn_08CAA
        pop     ds
        retf
        db      00h

; ? pads name to 16 chars at 2Eh, then sample_ptr_access or
; sample_access_caller.
sample_name_lookup:
        enter   1ch, 0
        push    di

L_08DA1:
        push    si
        push    ds
        lea     si, [bp-1ch]
        mov     cx, ss
        mov     ds, cx
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
        mov     word ptr [bp-2], ax
        cmp     byte ptr [bp-1ch], al
        je      br_08E24
        mov     si, ax
loop_08DD1:
        cmp     byte ptr [bp+si-1ch], 2eh
        je      loop_08DE3
        cmp     si, 10h
        jge     loop_08DE3
        inc     si
        cmp     byte ptr [bp+si-1ch], 0
        jne     loop_08DD1
loop_08DE3:
        cmp     si, 10h
        jge     br_08E02
        mov     ax, 2020h
        lea     bx, [bp+si-1ch]
        mov     cx, 10h
        sub     cx, si
        mov     dx, cx
        mov     di, bx
        push    ss
        pop     es
        shr     cx, 1
        rep stosw

        jae     br_08E00
        stosb

br_08E00:
        add     si, dx

br_08E02:
        mov     byte ptr [bp+si-1ch], 0
        callf   TEXT2_SEG:int2F_bcd_wrapper
        cmp     ax, 2
        jne     br_08E2A
        lea     ax, [bp-1ch]
        push    ss
        push    ax
        callf   TEXT2_SEG:sample_ptr_access
        mov     word ptr [bp-4], dx
        or      dx, ax
        je      br_08E2A
        jmp     br_08ED7

br_08E24:
        mov     si, word ptr [bp-2]
        jmp     loop_08DE3
        db      90h

br_08E2A:
        lea     ax, [bp-1ch]
        push    ss
        push    ax
        push    0
        callf   TEXT2_SEG:sample_access_caller
        or      ax, ax
        jne     br_08E42
        cwd
        pop     si
        pop     di
        leave
        retf    4
        db      90h

br_08E42:
        mov     word ptr [bp-2], si
        push    ds
        mov     di, STR_EXT_SND_4
        lea     si, [bp-1ch]
        mov     cx, ds
        mov     es, cx
        mov     cx, ss
        mov     ds, cx
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
        callf   TEXT2_SEG:int2F_bcd_wrapper
        cmp     ax, 2
        jne     br_08E94
        lea     ax, [bp-1ch]
        push    ss
        push    ax
        callf   TEXT2_SEG:memcpy_far_handler
        mov     si, ax
        mov     word ptr [bp-4], dx
        jmp     br_08EB9
        db      90h
br_08E94:
        xor     ax, ax
        cwd
        mov     si, ax
        mov     word ptr [bp-4], dx
        lea     ax, [bp-1ch]
        push    ss
        push    ax
        push    1
        callf   TEXT2_SEG:mem_block_process
        or      ax, ax
        je      br_08EB9
        call    midi_active_sense
        mov     si, ax
        mov     word ptr [bp-4], dx
        nop
        push    cs
        call    int2F_dispatch_10

br_08EB9:
        mov     ax, word ptr [bp-4]
        or      ax, si
        je      L_08ED5
        mov     di, word ptr [bp-2]
        mov     byte ptr [bp+di-1ch], 0
        push    word ptr [bp-4]
        push    si
        lea     ax, [bp-1ch]
        push    ss
        push    ax
        callf   TEXT2_SEG:bcd_convert

L_08ED5:
        mov     ax, si

br_08ED7:
        mov     dx, word ptr [bp-4]
        pop     si
        pop     di
        leave
        retf    4

midi_active_sense:
        enter   2, 0
        push    2
        lea     ax, [bp-2]
        push    ss
        push    ax
        nop
        push    cs
        call    int2F_call_fn6
        add     sp, 6
        cmp     ax, 2
        jne     br_08F40
        cmp     byte ptr [bp-2], 1
        jne     br_08F40
        mov     al, byte ptr [bp-1]
        sub     ah, ah
        or      ax, ax
        jl      br_08F15
        jo      br_08F15
        dec     ax
        jle     br_08F1E
        dec     ax
        je      br_08F2C
        dec     ax
        je      br_08F38
        dec     ax
        je      br_08F2C

br_08F15:
        mov     word ptr [G_ERRNO], ERR_NEWER_OS
        jmp     br_08F46
        db      90h

br_08F1E:
        mov     al, byte ptr [bp-1]
        sub     ah, ah
        push    ax
        callf   TEXT2_SEG:sample_create
        leave
        ret
        db      90h
br_08F2C:
        mov     al, byte ptr [bp-1]
        sub     ah, ah
        push    ax
        call    sample_block_copy
        leave
        ret
        db      90h

br_08F38:
        mov     word ptr [G_ERRNO], ERR_UNKNOWN_FILE_TYPE
        jmp     br_08F46

br_08F40:
        mov     word ptr [G_ERRNO], ERR_FILE_DAMAGED

br_08F46:
        xor     ax, ax
        cwd
        leave
        ret
        db      00h
sample_block_copy:
        enter   5eh, 0
        push    di
        push    si
        mov     bx, word ptr [bp+4]
        cmp     bx, 2
        jne     br_08F80
        push    24h
        lea     ax, [bp-24h]
        push    ss
        push    ax
        nop
        push    cs
        call    int2F_call_fn6
        add     sp, 6
        cmp     ax, 24h
        jne     br_08F99
        lea     ax, [bp-5eh]
        push    ss
        push    ax
        lea     ax, [bp-24h]
L_0B5F6:
        push    ss
        push    ax
        callf   TEXT2_SEG:sample_data_copy
        jmp     br_08FB1
        db      90h

br_08F80:
        cmp     bx, 4
        jne     br_08FEE
        push    28h
        lea     ax, [bp-28h]
        push    ss
        push    ax
        nop
        push    cs
        call    int2F_call_fn6
        add     sp, 6
        cmp     ax, 28h
        je      br_08FA2

br_08F99:
        mov     word ptr [G_ERRNO], ERR_FILE_DAMAGED
        jmp     lcd_screen_helper_8FF4
        db      90h

br_08FA2:
        lea     ax, [bp-5eh]
        push    ss
        push    ax
        lea     ax, [bp-28h]
        push    ss
        push    ax
        callf   TEXT2_SEG:_memcpy_5
br_08FB1:
        push    word ptr [bp-40h]
        push    word ptr [bp-42h]
        mov     al, byte ptr [bp-4bh]
        cbw
        push    ax
        callf   TEXT2_SEG:midi_calc_timing
        mov     word ptr [bp-2], ax
        inc     ax
        je      lcd_screen_helper_8FF4
        mov     ax, word ptr [bp-2]
        mov     word ptr [bp-2eh], ax
        sub     sp, 36h
        push    ds
        lea     si, [bp-5eh]
        mov     di, sp
        add     di, 2
        push    ss
        pop     es
        push    ss
        pop     ds
        mov     cx, 1bh
        rep movsw
        pop     ds
        callf   TEXT2_SEG:sample_pool_add
        pop     si
        pop     di
        leave
        ret     2

br_08FEE:
        mov     word ptr [G_ERRNO], ERR_INTERNAL

lcd_screen_helper_8FF4:
        xor     ax, ax
        cwd
        pop     si
        pop     di
        leave
        ret     2
        db      00h
lcd_screen_helper:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     di, word ptr [bp+8]
        mov     cx, word ptr [bp+4]
        xor     si, si
        mov     ax, word ptr [bp+6]

loop_0900E:
        mov     bx, cx
        mov     es, word ptr [bp+6]
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+TBL_FILENAME_CHARSET]
        mov     bx, di
        mov     es, word ptr [bp+0ah]
        mov     byte ptr es:[bx+si], al
        inc     si
        cmp     si, 0ch
        jl      loop_0900E
        mov     bx, 0bh

loop_0902E:
        mov     si, di
        mov     es, word ptr [bp+0ah]
        cmp     byte ptr es:[bx+si], 20h
        jne     br_0903C
        dec     bx
        jns     loop_0902E

br_0903C:
        or      bx, bx
        jl      br_09054

loop_09040:
        mov     si, di
        mov     es, word ptr [bp+0ah]
        cmp     byte ptr es:[bx+si], 20h
        jne     br_09051
        add     si, bx
        mov     byte ptr es:[si], 5fh

br_09051:
        dec     bx
        jns     loop_09040

br_09054:
        mov     si, word ptr [bp+8]
        mov     ax, 2020h
        mov     es, word ptr [bp+0ah]
        mov     cx, 2
        lea     di, [si+0ch]
        rep stosw
        mov     byte ptr es:[si+10h], 0
        mov     ax, si
        mov     dx, es
        pop     si

lcd_area_setup_906F:
        pop     di
        leave
        ret     8

lcd_area_setup:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     di, word ptr [bp+4]
        mov     si, word ptr [bp+6]
        push    di
        push    word ptr [bp+8]
        push    si
        nop
        push    cs
        call    int2F_call_fn6
        add     sp, 6
        cmp     ax, di
        jne     lcd_ratio_calc_90A2
        mov     es, word ptr [bp+8]
        cmp     byte ptr es:[si], 3
        jne     lcd_ratio_calc_90A2
        mov     ax, 1
        pop     si
        pop     di
        leave
        ret     6
lcd_ratio_calc_90A2:
        mov     word ptr [G_ERRNO], ERR_FILE_DAMAGED
        xor     ax, ax
        pop     si
        pop     di
        leave
        ret     6
lcd_ratio_calc:
        enter   2, 0
        push    di
        mov     bx, word ptr [bp+4]
        mov     ax, bx
        cwd
        sub     dh, dh
        add     ax, dx
        sar     ax, 8
        mov     di, ax
        mov     ax, bx
        mov     cx, 100h
        cwd
        idiv    cx
        cmp     di, 0ch
        jle     tgt_090DA
        mov     ax, 78h
        pop     di
        leave
        ret     2
        db      90h
tgt_090DA:
        cmp     di, -0ch
        jge     br_090E8
        mov     ax, 0ff88h
        pop     di
        leave
        ret     2
        db      90h
br_090E8:
        mov     bx, dx
        mov     ax, 64h
        imul    bx
        mov     bx, ax
        or      ax, ax
        jle     br_090FC
        add     bx, 80h
        jmp     br_09100
        db      90h

br_090FC:
        sub     bx, 80h

br_09100:
        mov     ax, bx
        cwd
        idiv    cx
        mov     bx, ax
        or      ax, bx
        jle     br_09110
        add     bx, 5
        jmp     lcd_clear_screen_9113

br_09110:
        sub     bx, 5

lcd_clear_screen_9113:
        mov     ax, bx
        mov     cx, 0ah
        cwd
        idiv    cx
        mov     dx, di
        shl     di, 2
        add     di, dx
        add     di, di
        add     ax, di
        pop     di
        leave
        ret     2
        db      00h
lcd_clear_screen:
        enter   2, 0
        push    di
        push    si
        mov     di, word ptr [bp+4]
        mov     si, word ptr [bp+8]
        push    word ptr [bp+0ah]
        push    si
        callf   TEXT2_SEG:sample_desc_init
        push    word ptr [bp+0ah]
        push    si
        mov     ax, di
        mov     dx, word ptr [bp+6]
        add     ax, 3
        push    dx
        push    ax
        call    lcd_screen_helper
        mov     es, word ptr [bp+6]
        test    byte ptr es:[di+0fh], 80h
        je      br_09164
        mov     ax, word ptr es:[di+8ah]
        jmp     br_09171
        db      90h

; ?
br_09164:
        cmp     byte ptr es:[di+1], 1
        sbb     ax, ax
        and     ax, 0a9deh
        add     ax, 0ac44h

br_09171:
        mov     es, word ptr [bp+0ah]
        mov     word ptr es:[si+26h], ax
        mov     es, word ptr [bp+6]
        cmp     byte ptr es:[di+1], 1
        sbb     ax, ax
        and     al, 88h
        mov     word ptr [bp-2], ax
        push    word ptr es:[di+14h]
        call    lcd_ratio_calc
        add     word ptr [bp-2], ax
        cmp     word ptr [bp-2], 0ff10h
        jge     br_0919E
        mov     cx, 0ff10h
        jmp     br_091AA
        db      90h
br_0919E:
        mov     cx, word ptr [bp-2]
        cmp     cx, 0f0h
        jle     br_091AA
        mov     cx, 0f0h
br_091AA:
        mov     es, word ptr [bp+0ah]
        mov     byte ptr es:[si+12h], cl
        mov     es, word ptr [bp+6]
        mov     ax, word ptr es:[di+1ah]
        mov     dx, word ptr es:[di+1ch]
        mov     es, word ptr [bp+0ah]
        mov     word ptr es:[si+1ch], ax
        mov     word ptr es:[si+1eh], dx
        mov     es, word ptr [bp+6]
        mov     ax, word ptr es:[di+1eh]
        mov     dx, word ptr es:[di+20h]
        mov     es, word ptr [bp+0ah]
        mov     word ptr es:[si+14h], ax
        mov     word ptr es:[si+16h], dx
        mov     es, word ptr [bp+6]
        mov     ax, word ptr es:[di+22h]
        mov     dx, word ptr es:[di+24h]
        mov     es, word ptr [bp+0ah]
        mov     word ptr es:[si+18h], ax
        mov     word ptr es:[si+1ah], dx
        mov     es, word ptr [bp+6]
        mov     ax, word ptr es:[di+2ch]
        mov     dx, word ptr es:[di+2eh]
        mov     es, word ptr [bp+0ah]
        mov     word ptr es:[si+20h], ax
        mov     word ptr es:[si+22h], dx
        mov     es, word ptr [bp+6]
        cmp     word ptr es:[di+30h], 270fh
        jne     br_09218
        mov     al, 1
        jmp     br_0921A

br_09218:
        xor     al, al

br_0921A:
        mov     es, word ptr [bp+0ah]
        mov     byte ptr es:[si+24h], al
        or      al, al
        je      br_0923D
        mov     es, word ptr [bp+6]
        mov     ax, word ptr es:[di+26h]
        mov     dx, word ptr es:[di+28h]
        if      FW_VERSION = 172
        and     al, 0f0h
        else
        and     al, 0c0h
        endif
        mov     es, word ptr [bp+0ah]
        mov     word ptr es:[si+18h], ax
        mov     word ptr es:[si+1ah], dx

br_0923D:
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[si+20h]
        mov     dx, word ptr es:[si+22h]
        cmp     word ptr es:[si+1ah], dx
        jg      lcd_clear_area_9266
        jl      br_09256
        cmp     word ptr es:[si+18h], ax
        jae     lcd_clear_area_9266

br_09256:
        mov     ax, word ptr es:[si+18h]
        mov     dx, word ptr es:[si+1ah]
        mov     word ptr es:[si+20h], ax
        mov     word ptr es:[si+22h], dx

lcd_clear_area_9266:
        push    0
        mov     es, word ptr [bp+0ah]
        push    word ptr es:[si+22h]
        push    word ptr es:[si+20h]
        nop
        push    cs
        call    addr_calc_segment
        add     sp, 6
        mov     es, word ptr [bp+0ah]
        mov     word ptr es:[si+32h], ax
        mov     word ptr es:[si+34h], dx
        mov     ax, si
        mov     dx, es
        pop     si
        pop     di
        leave
        ret     8

lcd_clear_area:
        enter   3eh, 0
        push    di
        push    si
        mov     si, word ptr [bp+8]
        xor     di, di
        mov     word ptr [bp-4], BUF_XFER
        mov     word ptr [bp-2], ds
        mov     es, word ptr [bp+0ah]
        cmp     byte ptr es:[si+0ah], 2dh
        jne     br_092ED
        cmp     byte ptr es:[si+0bh], 4ch
        je      br_092BB
        cmp     byte ptr es:[si+0bh], 52h
        jne     br_092ED
br_092BB:
        mov     al, byte ptr es:[si+0bh]
        mov     byte ptr [bp-1], al
        mov     di, 1
        cmp     al, 4ch
        jne     br_092CE
        mov     al, 52h
        jmp     br_092D0
        db      90h

br_092CE:
        mov     al, 4ch

br_092D0:
        mov     byte ptr es:[si+0bh], al
        push    es
        push    si
        nop
        push    cs
        call    int2F_call_fn14
        add     sp, 4
        inc     ax
        jne     br_092E3
        xor     di, di

br_092E3:
        mov     al, byte ptr [bp-1]
        mov     es, word ptr [bp+0ah]
        mov     byte ptr es:[si+0bh], al

br_092ED:
        or      di, di
        jne     br_092F4
        jmp     br_094E6

br_092F4:
        mov     es, word ptr [bp+0ah]
        mov     byte ptr es:[si+0bh], 4ch
        push    es
        push    si
        push    1
        callf   TEXT2_SEG:mem_block_process
        or      ax, ax
        jne     br_0930C
        jmp     lcd_clear_wrapper_953D

br_0930C:
        push    ds
        push    BUF_XFER
        push    word ptr [bp+6]
        call    lcd_area_setup
        or      ax, ax
        jne     br_0931D
        jmp     br_09538

br_0931D:
        mov     bx, BUF_XFER
        mov     al, 0ah
        mov     byte ptr [bx+0eh], al
        mov     byte ptr [bx+0dh], al
        lea     ax, [bp-3eh]
        push    ss
        push    ax
        push    ds
        push    bx
        call    lcd_clear_screen
        push    dx
        push    ax
        push    word ptr [bp+4]
        callf   TEXT2_SEG:sample_access_caller
        or      ax, ax
        jne     br_09343
        jmp     br_09538
br_09343:
        lea     ax, [bp-0eh]
        push    ss
        push    ax
        push    word ptr [bp-20h]
        push    word ptr [bp-22h]
        mov     al, 1
        mov     byte ptr [bp-2bh], al
        cbw
        push    ax
        callf   TEXT2_SEG:mem_io_handler
        or      ax, ax

        jne     br_09361
        jmp     br_09538

br_09361:
        push    word ptr [bp-0eh]
        nop
        push    cs
        call    smem_free
        mov     bx, word ptr [bp-0eh]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL]
        mov     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        push    dx
        push    ax
        push    word ptr [bp-20h]
        push    word ptr [bp-22h]
        callf   TEXT2_SEG:far_memop_caller
        cmp     ax, word ptr [bp-22h]
        jne     br_0939A
        cmp     dx, word ptr [bp-20h]
        je      br_093A4

br_0939A:
        mov     word ptr [G_ERRNO], ERR_FILE_DAMAGED
        jmp     br_09538
        db      90h

br_093A4:
        mov     si, word ptr [bp+8]
        nop
        push    cs
        call    int2F_dispatch_10
        mov     es, word ptr [bp+0ah]
        mov     byte ptr es:[si+0bh], 52h
        push    es
        push    si
        push    1
        callf   TEXT2_SEG:mem_block_process
        or      ax, ax
        jne     br_093C4
        jmp     lcd_clear_wrapper_953D

br_093C4:
        push    ds
        push    BUF_XFER
        push    word ptr [bp+6]
        call    lcd_area_setup
        or      ax, ax
        jne     L_093D5
        jmp     br_09538

L_093D5:
        mov     ax, word ptr [P_9F3E]
        mov     dx, word ptr [P_9F40]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    0
        push    2
        mov     bx, word ptr [bp-0eh]

L_093E9:
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        push    word ptr [bx+SMEM_POOL_LEN_HI]
        push    word ptr [bx+SMEM_POOL_LEN]
        nop
        push    cs
        call    __aFldiv
        add     ax, word ptr [bp-8]
        adc     dx, word ptr [bp-6]
        push    dx
        push    ax
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        callf   TEXT2_SEG:far_memop_caller
        cmp     ax, 0ffffh
        jne     br_0941E
        cmp     dx, ax
        jne     br_0941E
        jmp     br_09538
br_0941E:
        mov     ax, word ptr [bp-22h]
        mov     dx, word ptr [bp-20h]
        cmp     word ptr [bp-2], dx
        jg      br_09470
        jl      br_09430
        cmp     word ptr [bp-4], ax
        jae     br_09470
br_09430:
        push    0
        push    2
        mov     bx, word ptr [bp-0eh]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        push    word ptr [bx+SMEM_POOL_LEN_HI]
        push    word ptr [bx+SMEM_POOL_LEN]
        nop
        push    cs
        call    __aFldiv
        add     ax, word ptr [bp-4]
        adc     dx, word ptr [bp-2]
        add     ax, word ptr [bp-8]
        adc     dx, word ptr [bp-6]
        push    dx
        push    ax
        push    0
        mov     ax, word ptr [bp-22h]
        mov     dx, word ptr [bp-20h]
        sub     ax, word ptr [bp-4]
        sbb     dx, word ptr [bp-2]
        push    dx
        push    ax
        callf   TEXT2_SEG:smem_fill
br_09470:
        mov     bx, word ptr [bp-0eh]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        push    word ptr [bx+SMEM_POOL_LEN_HI]
        push    word ptr [bx+SMEM_POOL_LEN]
        nop
        push    cs
        call    smem_alloc
        mov     word ptr [bp-0eh], ax
        cmp     ax, 0ffffh
        je      tgt_094D6
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        mov     bx, word ptr [bp-0eh]
        mov     cx, bx
        shl     bx, 2
        add     bx, cx
        add     bx, bx
        cmp     word ptr [bx+SMEM_POOL], ax
        jne     tgt_094D6
        cmp     word ptr [bx+SMEM_POOL_BASE_HI], dx
        jne     tgt_094D6
loop_094AF:
        nop
        push    cs
        call    int2F_dispatch_10
        sub     sp, 36h
        push    ds
        lea     si, [bp-3eh]
        mov     di, sp
        add     di, 2
        push    ss
        pop     es
        push    ss
        pop     ds
        mov     cx, 1bh
        rep movsw
        pop     ds
        callf   TEXT2_SEG:sample_pool_add
        pop     si
        pop     di
        leave
        ret     8
        db      90h

tgt_094D6:
        mov     word ptr [G_ERRNO], ERR_INTERNAL
        push    word ptr [bp-0eh]
        nop
        push    cs
        call    smem_free
        jmp     br_09538

br_094E6:
        push    word ptr [bp+0ah]
        push    si
        push    1
        callf   TEXT2_SEG:mem_block_process
        or      ax, ax
        je      lcd_clear_wrapper_953D
        push    ds
        push    BUF_XFER
        push    word ptr [bp+6]
        call    lcd_area_setup
        or      ax, ax
        je      br_09538
        lea     ax, [bp-3eh]
        push    ss
        push    ax
        push    ds
        push    BUF_XFER
        call    lcd_clear_screen
        push    dx
        push    ax
        push    word ptr [bp+4]
        callf   TEXT2_SEG:sample_access_caller
        or      ax, ax
        je      br_09538
        push    word ptr [bp-20h]
        push    word ptr [bp-22h]
        mov     al, byte ptr [bp-2bh]
        cbw
        push    ax
        callf   TEXT2_SEG:midi_calc_timing
        mov     word ptr [bp-0eh], ax
        cmp     ax, 0ffffh
        je      br_09538
        jmp     loop_094AF

br_09538:
        nop
        push    cs
        call    int2F_dispatch_10

lcd_clear_wrapper_953D:
        xor     ax, ax
        cwd
        pop     si
        pop     di
        leave
        ret     8

; ?
lcd_clear_wrapper:
        enter   4, 0
        nop
        push    cs
        call    int2F_dispatch_10
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        push    0
        call    lcd_clear_area
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     X_09570
        callf   TEXT2_SEG:err_msg_report
        xor     ax, ax
        leave
        ret     6
        db      90h

X_09570:
        push    word ptr [bp-2]
        push    ax
        callf   TEXT2_SEG:ui_enter_pad_assign
        mov     ax, 1
        leave
        ret     6

lcd_area_wrapper_1:
        push    bp
        mov     bp, sp
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    96h
        call    lcd_clear_wrapper
        leave
        retf
        db      00h

lcd_area_wrapper_2:
        push    bp
        mov     bp, sp
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    0c0h
        call    lcd_clear_wrapper
        leave
        retf
        db      90h
main_handler_3:
        enter   0ch, 0
        push    di
        push    si
        mov     word ptr [bp-6], ds
        shl     word ptr [bp+4], 1
        rcl     word ptr [bp+6], 1
        mov     ax, word ptr [bp+6]
        or      ax, word ptr [bp+4]
        jne     loop_095BE
        jmp     br_09672

; doubles and clamps a 32-bit param to <= 0x200, then int2F_call_fn6.
loop_095BE:
        cmp     word ptr [bp+6], 0
        jl      br_095D2
        jg      br_095CD
        cmp     word ptr [bp+4], 200h
        jbe     br_095D2

br_095CD:
        mov     si, 200h
        jmp     br_095D5

br_095D2:
        mov     si, word ptr [bp+4]

br_095D5:
        mov     ax, si
        add     ax, si
        push    ax
        push    ds
        push    BUF_XFER
        mov     di, ax
        nop
        push    cs
        call    int2F_call_fn6
        add     sp, 6
        cmp     ax, di
        jne     br_09662
        mov     ax, si
        cwd
        sub     word ptr [bp+4], si
        sbb     word ptr [bp+6], dx
        mov     cx, 2
        cwd
        idiv    cx
        mov     si, ax
        or      ax, si
        jle     br_09626
        xor     cx, cx
        mov     bx, BUF_XFER
        mov     word ptr [bp-6], ax
        mov     si, cx
        mov     cx, ax

loop_0960D:
        mov     ax, word ptr [bx]
        mov     word ptr [si+P_9842], ax
        mov     ax, word ptr [bx+2]
        mov     word ptr [si+TBL_SOUND_NAMES], ax
        add     si, 2
        add     bx, 4
        dec     cx
        jne     loop_0960D
        mov     si, word ptr [bp-6]

br_09626:
        push    word ptr [bp+0eh]
        push    word ptr [bp+0ch]
        push    ds
        push    P_9842
        push    si
        callf   TEXT2_SEG:flash_write_words
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    ds
        push    TBL_SOUND_NAMES
        push    si
        callf   TEXT2_SEG:flash_write_words
        mov     ax, si
        cwd
        add     word ptr [bp+0ch], ax
        adc     word ptr [bp+0eh], dx
        add     word ptr [bp+8], ax
        adc     word ptr [bp+0ah], dx
        mov     ax, word ptr [bp+6]
        or      ax, word ptr [bp+4]
        je      br_09660
        jmp     loop_095BE

br_09660:
        jmp     br_09672

br_09662:
        mov     word ptr [G_ERRNO], ERR_DISK_READ
        mov     ax, 0ffffh
        pop     si
        pop     di
        leave
        ret     0ch
        db      90h

br_09672:
        xor     ax, ax
        pop     si
        pop     di
        leave
        ret     0ch

status_read_multi:
        enter   1ch, 0
        push    si
        sub     ax, ax
        mov     word ptr [bp-2], ax
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-0ah], 0ffffh
        push    ds
        push    P_8F62
        nop
        push    cs
        call    __setjmp
        add     sp, 4
        mov     word ptr [bp-2], ax
        or      ax, ax
        jne     br_0971E
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    ax
        callf   TEXT2_SEG:sample_access_caller
        or      ax, ax
        jne     br_096BF
        push    word ptr [G_ERRNO]
        push    ds
        push    P_8F62
        nop
        push    cs
        call    _longjmp
        add     sp, 6
br_096BF:
        lea     ax, [bp-1ch]
        push    ss
        push    ax
        call    pad_velocity_handler
        lea     ax, [bp-1ch]
        push    ss
        push    ax
        push    6174h                     ; "data", the WAV chunk to find
        push    6164h
        call    status_poll_handler
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        push    dx
        push    ax
        call    mode_handler
        mov     word ptr [bp-0ah], ax
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        lea     ax, [bp-1ch]
        push    ss
        push    ax
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        call    voice_play_request
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     si, ax
        mov     ax, word ptr [bp-0ah]
        mov     es, dx
        mov     word ptr es:[si+SND_POOL_IDX], ax
        nop
        push    cs
        call    int2F_dispatch_10
        push    word ptr [bp-2]
        push    si
        callf   TEXT2_SEG:ui_enter_pad_assign
        mov     ax, 1
        pop     si
        leave
        retf
        db      90h, 90h

br_0971E:
        nop
        push    cs
        call    int2F_dispatch_10
        mov     ax, word ptr [bp-2]
        mov     word ptr [G_ERRNO], ax
        callf   TEXT2_SEG:err_msg_report
        xor     ax, ax
        pop     si
        leave
        retf
        db      00h

; ?
status_poll_delay:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+4]
        push    si
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    int2F_call_fn6
        add     sp, 6
        cmp     ax, si
        je      br_0975C
        if      FW_VERSION = 172
        push    4
        else
        push    2
        endif
        push    ds
        push    P_8F62
        nop
        push    cs
        call    _longjmp
        add     sp, 6

br_0975C:
        pop     si
        leave
        ret     6
        db      00h

; poll with timeout around int2F_call_fn5, decrementing 32-bit counter.
int2F_fn5_caller:
        push    bp
        mov     bp, sp

L_09765:
        mov     ax, word ptr [bp+4]

tgt_09768:
        mov     dx, word ptr [bp+6]
        sub     word ptr [bp+4], 1
        sbb     word ptr [bp+6], 0
        or      dx, ax
        je      br_09790
        nop
        push    cs
        call    int2F_call_fn5
        or      ax, ax
        jge     L_09765
        push    4
        push    ds
        push    P_8F62
        nop
        push    cs
        call    _longjmp
        mov     sp, bp
        jmp     L_09765
        db      90h

br_09790:
        leave
        ret     4
        if      FW_VERSION = 172

int2F_fn14_setup:
        push    bp
        mov     bp, sp
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        callf   TEXT2_SEG:bcd_display_calc
        or      ax, ax
        jne     L_097B6
        push    word ptr [G_ERRNO]
        push    ds
        push    P_8F62
        nop
        push    cs
        call    _longjmp

L_097B6:
        leave
        ret     6
        endif

status_poll_handler:
        enter   8, 0

; stage 1: port configuration
lcd_init_stage_1:
        lea     ax, [bp-8]
        push    ss
        push    ax
        push    8
        call    status_poll_delay
        mov     ax, word ptr [bp+4]
        mov     dx, word ptr [bp+6]
        cmp     word ptr [bp-8], ax
        jne     L_097D8
        cmp     word ptr [bp-6], dx
        je      L_097E4

L_097D8:
        push    word ptr [bp-2]
        push    word ptr [bp-4]
; stage 2: controller setup
lcd_init_stage_2:
        call    int2F_fn5_caller
; ? lcd_port_init @0x097e2 is mid-instruction
        jmp     lcd_init_stage_1
        db      90h

L_097E4:
; ? envelope_attack_handler @0x097e6 is mid-instruction
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
; far-called from the EXE
envelope_decay_handler:
        leave
        ret     4

; far-called from the EXE
pad_velocity_handler:
        enter   4, 0
        push    4646h
        push    4952h
        call    status_poll_handler
        lea     ax, [bp-4]
        push    ss
        push    ax
        push    4
        call    status_poll_delay
; ? lcd_init @0x09806 is mid-instruction
        cmp     word ptr [bp-4], 4157h
; far-called from the EXE

lcd_char_write:
        jne     L_09813
; ? lcd_string_write @0x0980e is mid-instruction
        cmp     word ptr [bp-2], 4556h
        je      br_09821

L_09813:
        push    4
        push    ds
; far-called from the EXE

lcd_cursor_set:
        push    P_8F62
        nop
        push    cs
        call    _longjmp
        add     sp, 6

br_09821:
; ? lcd_clear_region @0x09822 is mid-instruction
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        push    2074h
        push    6d66h
        call    status_poll_handler
        push    dx
        push    ax
        call    envelope_process_1
        leave
        ret     4
        db      00h
envelope_process_1:
        enter   2, 0
        push    di
        push    si
        mov     si, word ptr [bp+8]
        xor     ax, ax
        mov     cx, 9
        mov     dx, word ptr [bp+0ah]
        mov     di, si
        mov     es, dx
        rep stosw
        mov     word ptr [bp-2], 12h
        mov     di, word ptr [bp-2]
        cmp     word ptr [bp+6], ax
        jne     br_09867
        cmp     word ptr [bp+4], 12h
        jae     br_09867
        mov     di, word ptr [bp+4]
br_09867:
        push    dx
        push    si
        push    di
        call    status_poll_delay
        mov     es, word ptr [bp+0ah]
        cmp     word ptr es:[si], 1
        jne     br_09892
        cmp     word ptr es:[si+2], 0
        je      br_09892
        cmp     word ptr es:[si+2], 2
        ja      br_09892
        cmp     word ptr es:[si+0eh], 10h
        ja      br_09892
        cmp     word ptr es:[si+0eh], 9
        jae     L_098A0

br_09892:
        push    12h
        push    ds
        push    P_8F62
        nop
        push    cs
        call    _longjmp
        add     sp, 6

L_098A0:
        mov     es, word ptr [bp+0ah]
        push    word ptr es:[si+6]
        push    word ptr es:[si+4]
        mov     ax, word ptr es:[si+0eh]
        shr     ax, 3
        mul     word ptr es:[si+2]
        push    dx
        push    ax
        nop
        push    cs
        call    __aFlmul
        mov     es, word ptr [bp+0ah]
        cmp     ax, word ptr es:[si+8]
        jne     br_098DD
        cmp     dx, word ptr es:[si+0ah]

scsi_command_setup:
        jne     br_098DD
        mov     ax, word ptr es:[si+0eh]
; ? scsi_request_builder @0x098d2 is mid-instruction
        shr     ax, 3
        mul     word ptr es:[si+2]
        cmp     ax, word ptr es:[si+0ch]
        je      br_098EB

br_098DD:
        push    4
        push    ds
        push    P_8F62
        nop
        push    cs
        call    _longjmp
        add     sp, 6

br_098EB:
        mov     ax, word ptr [bp+4]
        mov     dx, word ptr [bp+6]
        sub     ax, di
        sbb     dx, 0
        push    dx
        push    ax
        call    int2F_fn5_caller
        pop     si
        pop     di
        leave
        ret     8
        db      00h

; ? calls near helper then TEXT2 01278h, shared with track_event_handler.
mode_handler:
        enter   0eh, 0
        push    si
        mov     si, word ptr [bp+8]
        mov     es, word ptr [bp+0ah]
        push    0
; ? scsi_status_query @0x09910 is mid-instruction
        push    word ptr es:[si+0ch]
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        nop
        push    cs
        call    __aFuldiv
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        lea     ax, [bp-0eh]
        push    ss
        push    ax
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[si+2]
        dec     ax
        push    ax
        callf   TEXT2_SEG:mem_io_handler
        or      ax, ax
        jne     br_09951
        push    word ptr [G_ERRNO]
        push    ds
        push    P_8F62
        nop
        push    cs
        call    _longjmp
        add     sp, 6
br_09951:
        mov     bx, word ptr [bp-0eh]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL]
        mov     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     ax, word ptr [bx+SMEM_POOL_LEN]
        mov     dx, word ptr [bx+SMEM_POOL_LEN_HI]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        push    word ptr [bp-0eh]
        nop
        push    cs
        call    smem_free
        mov     es, word ptr [bp+0ah]
        cmp     word ptr es:[si+2], 1
        jne     L_099A6
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        callf   TEXT2_SEG:far_memop_caller
        cmp     ax, word ptr [bp-0ch]
        jne     br_099D0
        cmp     dx, word ptr [bp-0ah]
        jmp     L_099CE

L_099A6:
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    0
        push    2
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        nop
        if      FW_VERSION = 150

int2F_fn14_caller:
        endif
        push    cs
        call    __aFldiv
        add     ax, word ptr [bp-4]
        adc     dx, word ptr [bp-2]
        push    dx
        push    ax
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        call    main_handler_3
        or      ax, ax

L_099CE:
        je      br_099E0

br_099D0:
        push    word ptr [G_ERRNO]
        push    ds
        push    P_8F62
        nop
        push    cs
        call    _longjmp
        add     sp, 6

br_099E0:
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        nop
        push    cs
        call    smem_alloc
        mov     word ptr [bp-0eh], ax
        cmp     ax, 0ffffh
        je      br_09A11
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        mov     bx, word ptr [bp-0eh]
        mov     cx, bx
        shl     bx, 2
        add     bx, cx
        add     bx, bx
        cmp     word ptr [bx+SMEM_POOL], ax
        jne     br_09A11
        cmp     word ptr [bx+SMEM_POOL_BASE_HI], dx
        je      br_09A2D
br_09A11:
        cmp     word ptr [bp-0eh], -1
        je      br_09A1F
        push    word ptr [bp-0eh]
        nop
        push    cs
        call    smem_free

br_09A1F:
        push    5
        push    ds
        push    P_8F62
        nop
        push    cs
        call    _longjmp
        add     sp, 6

br_09A2D:
        mov     ax, word ptr [bp-0eh]
        pop     si
        leave
        ret     8
        db      00h
; ? fills 36h descriptor from 0Ch-byte request and midi_out_io, then
; sample_pool_add.
voice_play_request:
        enter   36h, 0
        push    di
        push    si
        lea     ax, [bp-36h]
        push    ss
        push    ax
        callf   TEXT2_SEG:sample_desc_init
        push    ds
        lea     si, [bp-36h]
        mov     cx, ss
        mov     ds, cx
        les     di, [bp+0ch]
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
        les     bx, [bp+8]

        mov     al, byte ptr es:[bx+2]
        dec     al
        mov     byte ptr [bp-23h], al
        push    0
        push    word ptr es:[bx+0ch]
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        nop
        push    cs
        call    __aFuldiv
        mov     word ptr [bp-1ah], ax
        mov     word ptr [bp-18h], dx
        mov     word ptr [bp-1eh], ax
        mov     word ptr [bp-1ch], dx
        les     bx, [bp+8]
        mov     ax, word ptr es:[bx+4]
        mov     word ptr [bp-10h], ax
        push    word ptr es:[bx+6]
        push    word ptr es:[bx+4]
        callf   TEXT2_SEG:midi_out_io
        mov     byte ptr [bp-24h], al
        sub     sp, 36h
        push    ds
        lea     si, [bp-36h]
        mov     di, sp
        add     di, 2
        push    ss
        pop     es
        push    ss
        pop     ds
        mov     cx, 1bh
        rep movsw
        pop     ds
        callf   TEXT2_SEG:sample_pool_add
        pop     si
        pop     di
        leave
        ret     0ch
        if      FW_VERSION = 172
        db      00h

int2F_fn14_caller:
        enter   32h, 0
        push    si
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    int2F_call_fn14
        add     sp, 4
        or      ax, ax
        jne     L_09AF0
        mov     word ptr [G_ERRNO], ERR_FILE_EXISTS
        jmp     lcd_fill_buffer_9C11

L_09AF0:
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    0
        callf   TEXT2_SEG:mem_block_process
        or      ax, ax
        jne     L_09B04
        jmp     lcd_fill_buffer_9C11

L_09B04:
        push    ds
        push    P_8F62
        nop
        push    cs
        call    __setjmp
        add     sp, 4
        mov     word ptr [G_ERRNO], ax
        or      ax, ax
        je      L_09B1A
        jmp     L_09C0C

L_09B1A:
        mov     word ptr [bp-14h], 6d66h
        mov     word ptr [bp-12h], 2074h
        mov     word ptr [bp-10h], 12h
        mov     word ptr [bp-0eh], ax
        mov     word ptr [bp-2eh], 1
        mov     word ptr [bp-20h], 10h
        mov     word ptr [bp-1eh], ax
        mov     si, word ptr [bp+0ah]
        mov     es, word ptr [bp+0ch]
        cmp     byte ptr es:[si+SND_STEREO], 1
        sbb     ax, ax
        add     ax, 2
        mov     word ptr [bp-2ch], ax
        mov     ax, word ptr es:[si+SND_RATE]
        mov     word ptr [bp-2ah], ax
        mov     word ptr [bp-28h], 0
        mov     ax, word ptr [bp-2ch]
        and     ah, 0fh
        add     ax, ax
        mov     word ptr [bp-22h], ax
        push    word ptr [bp-28h]
        push    word ptr [bp-2ah]
        sub     dx, dx
        push    dx
        push    ax
        mov     word ptr [bp-32h], ax
        mov     word ptr [bp-30h], dx
        nop
        push    cs
        call    __aFlmul
        mov     word ptr [bp-26h], ax
        mov     word ptr [bp-24h], dx
        mov     word ptr [bp-0ch], 6164h  ; "data"
        mov     word ptr [bp-0ah], 6174h
        mov     es, word ptr [bp+0ch]
        push    word ptr es:[si+SND_LENGTH_HI]
        push    word ptr es:[si+SND_LENGTH]
        push    word ptr [bp-30h]
        push    word ptr [bp-32h]
        nop
        push    cs
        call    __aFlmul
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     word ptr [bp-1ch], 4952h
        mov     word ptr [bp-1ah], 4646h
        add     ax, 26h
        adc     dx, 0
        mov     word ptr [bp-18h], ax
        mov     word ptr [bp-16h], dx
        mov     word ptr [bp-4], 4157h
        mov     word ptr [bp-2], 4556h
        lea     ax, [bp-1ch]
        push    ss
        push    ax
        push    8
        call    int2F_fn14_setup
        lea     ax, [bp-4]
        push    ss
        push    ax
        push    4
        call    int2F_fn14_setup
        lea     ax, [bp-14h]
        push    ss
        push    ax
        push    8
        call    int2F_fn14_setup
        lea     ax, [bp-2eh]
        push    ss
        push    ax
        push    12h
        call    int2F_fn14_setup
        lea     ax, [bp-0ch]
        push    ss
        push    ax
        push    8
        call    int2F_fn14_setup
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        call    lcd_fill_buffer
        nop
        push    cs
        call    int2F_dispatch_10
        mov     ax, 1
        pop     si
        leave
        retf    8

L_09C0C:
        nop
        push    cs
        call    int2F_dispatch_10

lcd_fill_buffer_9C11:
        xor     ax, ax
        pop     si
        leave
        retf    8

lcd_fill_buffer:
        enter   14h, 0
        push    di
        push    si
        mov     si, word ptr [bp+4]
        mov     es, word ptr [bp+6]
        mov     ax, word ptr es:[si+SND_LENGTH]
        mov     dx, word ptr es:[si+SND_LENGTH_HI]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
; ? audio_envelope_handler @0x09c33 is mid-instruction
        mov     bx, word ptr es:[si+SND_POOL_IDX]
        mov     cx, bx
        shl     bx, 2
        add     bx, cx
        add     bx, bx
        mov     cx, word ptr [bx+SMEM_POOL]
        mov     di, word ptr [bx+SMEM_POOL_BASE_HI]
        mov     word ptr [bp-10h], cx
        mov     word ptr [bp-0eh], di
        add     ax, 0fh
        adc     dx, 0
        and     al, 0f0h
        add     cx, ax
        adc     di, dx
        mov     word ptr [bp-0ch], cx
        mov     word ptr [bp-0ah], di
        cmp     byte ptr es:[si+SND_STEREO], 0
        jne     L_09C69
        jmp     L_09D70

L_09C69:
        mov     ax, BUF_XFER
        mov     bx, ax
        mov     word ptr [bp-12h], ds
        mov     cx, TBL_SOUND_NAMES
        mov     word ptr [bp-4], cx
        xor     ax, ax
        mov     cx, 400h
        mov     di, bx
        push    ds
        pop     es
        rep stosw
        mov     cx, 440h
        mov     si, word ptr [bp-4]
        mov     di, si
        rep stosw
        cmp     word ptr [bp-6], ax
        jge     L_09C94
        jmp     L_09D95

L_09C94:
        jg      L_09C9E
        cmp     word ptr [bp-8], ax
        jne     L_09C9E
        jmp     L_09D95

L_09C9E:
        cmp     word ptr [bp-6], ax
        jl      L_09CB2
        jg      L_09CAC
        cmp     word ptr [bp-8], 200h
        jbe     L_09CB2

L_09CAC:
        mov     si, 200h
        jmp     L_09CB5
        db      90h

L_09CB2:
        mov     si, word ptr [bp-8]

L_09CB5:
        push    word ptr [bp-0eh]
        push    word ptr [bp-10h]
        push    ds
        push    TBL_SOUND_NAMES
        push    si
        callf   TEXT2_SEG:smem_read_words
        or      si, si
        je      L_09CEA
        mov     bx, TBL_SOUND_NAMES
        mov     cx, BUF_XFER
        mov     word ptr [bp-4], si
        mov     word ptr [bp-12h], si
        mov     si, cx
        mov     cx, word ptr [bp-4]

L_09CDA:
        mov     ax, word ptr [bx]
        mov     word ptr [si], ax
        add     bx, 2
        add     si, 4
        dec     cx
        jne     L_09CDA
        mov     si, word ptr [bp-12h]

L_09CEA:
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        push    ds
        push    TBL_SOUND_NAMES
        push    si
        callf   TEXT2_SEG:smem_read_words
        or      si, si
        je      L_09D20
        mov     bx, TBL_SOUND_NAMES
        mov     cx, BUF_XFER
        mov     word ptr [bp-4], si
        mov     word ptr [bp-12h], si
        mov     si, cx
        mov     cx, word ptr [bp-4]

L_09D0F:
        mov     ax, word ptr [bx]
        mov     word ptr [si+2], ax
        add     bx, 2
        add     si, 4
        dec     cx
        jne     L_09D0F
        mov     si, word ptr [bp-12h]

L_09D20:
        push    ds
        push    BUF_XFER
        mov     ax, si
        shl     ax, 2
        push    ax
        callf   TEXT2_SEG:bcd_display_calc
        or      ax, ax
        jne     L_09D43
        push    word ptr [G_ERRNO]
        push    ds

L_09D38:
        push    P_8F62
        nop
        push    cs
        call    _longjmp
        add     sp, 6

L_09D43:
        sub     ax, ax
        add     word ptr [bp-10h], si
        adc     word ptr [bp-0eh], ax
        add     word ptr [bp-0ch], si
        adc     word ptr [bp-0ah], ax
        sub     word ptr [bp-8], si
        sbb     word ptr [bp-6], ax
        cmp     word ptr [bp-6], ax
        jle     L_09D5F
        jmp     L_09C9E

L_09D5F:
        jl      L_09D95
        cmp     word ptr [bp-8], ax
        je      L_09D69
        jmp     L_09C9E

L_09D69:
        pop     si
        pop     di
        leave
        ret     4
        db      90h

L_09D70:
        push    word ptr [bp-0eh]
        push    word ptr [bp-10h]
        push    word ptr [bp-6]
        push    word ptr [bp-8]

L_09D7C:
        callf   TEXT2_SEG:bcd_time_format
        or      ax, ax
        jne     L_09D95
        push    word ptr [G_ERRNO]
        push    ds
        push    P_8F62
        nop
        push    cs
        call    _longjmp
        add     sp, 6

L_09D95:
        pop     si
        pop     di
        leave
        ret     4
        endif
        db      90h
midi_realtime_start:
        enter   0ch, 0
        push    si
        mov     si, word ptr [bp+6]
        mov     es, word ptr [bp+8]
        mov     al, byte ptr es:[si+0ch]
        mov     byte ptr [bp-5], al
        cmp     byte ptr es:[si+10h], 1
        sbb     al, al
        neg     al
        mov     byte ptr [bp-6], al
        mov     al, byte ptr es:[si+0eh]
        mov     byte ptr [bp-7], al
        mov     ax, word ptr es:[si+6]
        mov     cx, word ptr es:[si]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], cx
        mov     word ptr [G_ERRNO], ERR_INTERNAL
        mov     al, byte ptr [bp-5]
        cbw
        mov     bx, ax
        shl     bx, 2
        mov     ax, word ptr [bx+PGM_TABLE]
        mov     dx, word ptr [bx+PGM_TABLE+2]
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        mov     es, dx
        mov     bx, ax
        cmp     word ptr es:[bx], 2
        jbe     br_09E34
        push    cx
        push    word ptr [bp-4]
        nop
        push    cs
        call    int2F_call_fn14
        add     sp, 4
        or      ax, ax
        je      br_09E34
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        callf   TEXT2_SEG:ctrl_port_caller
        or      ax, ax
        je      br_09E34
        cmp     byte ptr [bp-6], 0
        je      br_09E39
        push    ds
        push    P_8D44
        mov     al, byte ptr [bp-7]
        cbw
        push    ax
        push    0
        call    event_handler
        pop     si
        leave
        retf    4
        db      90h

br_09E34:
        callf   TEXT2_SEG:err_msg_report

br_09E39:
        xor     ax, ax
        pop     si
        leave
        retf    4
midi_realtime_continue:
        enter   6, 0
        push    si
        mov     si, word ptr [bp+6]
        mov     es, word ptr [bp+8]
        cmp     byte ptr es:[si+10h], 1
        sbb     al, al
        neg     al
        mov     byte ptr [bp-5], al
        mov     al, byte ptr es:[si+0eh]
        mov     byte ptr [bp-6], al
        mov     ax, word ptr es:[si+6]
        mov     cx, word ptr es:[si]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], cx
        mov     word ptr [G_ERRNO], ERR_INTERNAL
        push    cx
        push    ax
        nop
        push    cs
        call    int2F_call_fn14
        add     sp, 4
        or      ax, ax
        je      L_09EA8
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        callf   TEXT2_SEG:smem_access_handler_3
        or      ax, ax
        je      L_09EA8
        cmp     byte ptr [bp-5], 0
        je      br_09EAD
        push    ds
        push    P_8D44
        mov     al, byte ptr [bp-6]
        cbw
        push    ax
        push    0
        call    event_handler
        pop     si
        leave
        retf    4
        db      90h

L_09EA8:
        callf   TEXT2_SEG:err_msg_report

br_09EAD:
        xor     ax, ax
        pop     si
        leave
        retf    4

; far-calls TEXT2 066Ah, then iterates 0..0x80 array of far pointers.
event_handler:
        enter   22h, 0
        push    di
        push    si
        callf   TEXT2_SEG:int2F_bcd_wrapper
        mov     word ptr [bp-8], ax
        mov     di, word ptr [bp+4]
        cmp     di, 80h
        jl      br_09ECE
        jmp     br_09FD8
br_09ECE:
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        mov     cx, di
        shl     cx, 2
        add     ax, cx
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     word ptr [bp-6], di

loop_09EE4:
        les     bx, [bp-4]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        mov     word ptr [bp-22h], ax
        mov     word ptr [bp-20h], dx
        or      dx, ax
        jne     br_09EFB
        jmp     br_09FD8
br_09EFB:
        push    ds
        lea     si, [bp-1eh]
        mov     cx, ss
        mov     ds, cx
        les     di, [bp-22h]
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
        push    ds
        mov     di, STR_EXT_SND_5
        lea     si, [bp-1eh]
        mov     cx, ds
        mov     es, cx
        mov     cx, ss
        mov     ds, cx
        mov     cx, 0ffffh
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
        lea     ax, [bp-1eh]
        push    ss
        push    ax
        nop
        push    cs
        call    int2F_call_fn14
        add     sp, 4
        or      ax, ax
        jne     br_09F7A
        cmp     word ptr [bp+6], ax
        je      br_09FB2
        cmp     word ptr [bp-8], 2
        je      br_09F7A
        lea     ax, [bp-1eh]
        push    ss
        push    ax
        nop
        push    cs
        call    int2F_call_fn20
        add     sp, 4

br_09F7A:
        cmp     word ptr [bp-8], 2
        jne     br_09F9A
        les     bx, [bp-4]
        push    word ptr es:[bx+2]
        push    word ptr es:[bx]
        lea     ax, [bp-1eh]
        push    ss
        push    ax
        callf   TEXT2_SEG:ctrl_io_setup
        or      ax, ax
        jne     br_09FB2
        jmp     br_09FCF

br_09F9A:
        les     bx, [bp-4]
        push    word ptr es:[bx+2]
        push    word ptr es:[bx]
        lea     ax, [bp-1eh]
        push    ss
        push    ax
        callf   TEXT2_SEG:far_memop_handler_2
        or      ax, ax
        je      br_09FC6

br_09FB2:
        add     word ptr [bp-4], 4
        inc     word ptr [bp-6]
        cmp     word ptr [bp-6], 80h
        jge     br_09FC3
        jmp     loop_09EE4

br_09FC3:
        jmp     br_09FD8
        db      90h

br_09FC6:
        push    word ptr [bp+6]
        push    word ptr [bp-6]
        call    ctrl_port_78_write

br_09FCF:
        mov     ax, 1
        pop     si
        pop     di
        leave
        ret     8

br_09FD8:
        xor     ax, ax
        pop     si
        pop     di
        leave
        ret     8

X_09FE0:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    int2F_dispatch_17
        or      ax, ax
        jne     tgt_09FFA
        push    ds
        push    STR_CHANGE_DISK_2
        callf   TEXT2_SEG:string_fill_stosb
        pop     ds
        retf

tgt_09FFA:
        push    ds
        push    DL_SAVING
        nop
        push    cs
        call    disp_list_run
        nop
        push    cs
        call    int2F_dispatch_21
        push    ds
        push    P_8D44
        mov     ax, word ptr [W_5BB0]
        shl     ax, 0fh
        sar     ax, 0fh
        push    ax
        push    word ptr [W_5BAE]
        call    event_handler
        or      ax, ax
        jne     X_0A028
        push    5
        callf   TEXT2_SEG:int43_wrapper

X_0A028:
        pop     ds
        retf

X_0A02A:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    int2F_dispatch_17
        or      ax, ax
        jne     br_0A044
        push    ds
        push    STR_CHANGE_DISK_2
        callf   TEXT2_SEG:string_fill_stosb
        pop     ds
        retf

br_0A044:
        push    ds
        push    DL_SAVING
        nop
        push    cs
        call    disp_list_run
        push    ds
        push    P_417E
        nop
        push    cs
        call    int2F_call_fn4
        add     sp, 4
        push    ds
        push    P_8D44
        mov     ax, word ptr [W_5BB0]
        shl     ax, 0fh
        sar     ax, 0fh
        push    ax
        push    word ptr [W_5BAE]
        call    event_handler
        or      ax, ax
        jne     br_0A079
        push    5
        callf   TEXT2_SEG:int43_wrapper

br_0A079:
        pop     ds
        retf
        db      00h

; ? no port 0x78 access: toggles bit 0 of [5BB0h] from an XOR.
ctrl_port_78_write:
        push    bp
        mov     bp, sp
        push    ds
        push    P_419E
        nop
        push    cs
        call    disp_list_run
        push    ds
        push    TBL_WINKEYS_04180
        nop
        push    cs
        call    win_keys_merge
        mov     al, byte ptr [bp+6]
        xor     al, byte ptr [W_5BB0]
        and     ax, 1
        xor     word ptr [W_5BB0], ax
        mov     ax, word ptr [bp+4]
        mov     word ptr [W_5BAE], ax
        leave
        ret     4
        db      90h

seq_common_handler:
        enter   0ch, 0
        push    si
        xor     ax, ax
        cwd
        mov     si, ax
        mov     word ptr [bp-6], dx
        sub     cx, cx
        mov     word ptr [bp-2], cx
        mov     word ptr [bp-4], cx
        cmp     word ptr [PTR_SEQ_LIST_HEAD], ax
        jne     br_0A0CB
        cmp     word ptr [PTR_SEQ_LIST_HEAD+2], ax
        je      br_0A103
br_0A0CB:
        mov     ax, word ptr [PTR_SEQ_LIST_HEAD]
        mov     dx, word ptr [PTR_SEQ_LIST_HEAD+2]
        mov     si, ax
        mov     word ptr [bp-6], dx
        mov     es, dx
        mov     bx, ax
        push    word ptr es:[bx+MPC_STATE_range_hi]
        push    word ptr es:[bx+MPC_STATE_range_lo]
        cmp     byte ptr es:[bx+MPC_STATE_flag_13], 1
        sbb     ax, ax
        and     al, 0feh
        add     ax, 4
        cwd
        push    dx
        push    ax
        nop
        push    cs
        call    __aFlmul
        add     ax, 28h
        adc     dx, 0
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
br_0A103:
        mov     cx, word ptr [bp-6]
        mov     word ptr [bp-0ch], si
        les     bx, [bp+4]
        mov     word ptr es:[bx], cx
        mov     ax, word ptr [bp-0ch]
        mov     word ptr es:[bx+6], ax
        mov     ax, word ptr [bp-2]
        mov     word ptr es:[bx+0eh], ax
        mov     ax, word ptr [bp-4]
        mov     word ptr es:[bx+MPC_STATE_flag_12], ax
        pop     si
        leave
        ret     4
        db      00h

; ?
seq_init_navigation:
        push    bp
        mov     bp, sp
        callf   TEXT2_SEG:X_07C12
        callf   TEXT2_SEG:far_078E4
        mov     word ptr [PTR_SEQ_LIST_HEAD], ax
        mov     word ptr [PTR_SEQ_LIST_HEAD+2], dx
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        call    seq_common_handler
        leave
        retf    4
        db      00h

seq_next_track:
        enter   4, 0
        les     bx, [PTR_SEQ_LIST_HEAD]
        les     bx, es:[bx+SND_PREV]
        mov     ax, word ptr es:[bx+SND_PREV_SEG]
        or      ax, word ptr es:[bx+SND_PREV]
        je      X_0A16A
        mov     word ptr [PTR_SEQ_LIST_HEAD], bx
        mov     word ptr [PTR_SEQ_LIST_HEAD+2], es

X_0A16A:
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        call    seq_common_handler
        leave
        retf    4
        db      00h

seq_prev_track:
        enter   4, 0
        les     bx, [PTR_SEQ_LIST_HEAD]
        les     bx, es:[bx+SND_NEXT]
        mov     ax, word ptr es:[bx+SND_NEXT_SEG]
        or      ax, word ptr es:[bx+SND_NEXT]
        je      br_0A196
        mov     word ptr [PTR_SEQ_LIST_HEAD], bx
        mov     word ptr [PTR_SEQ_LIST_HEAD+2], es

br_0A196:
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        call    seq_common_handler
        leave
        retf    4
        db      00h

; far-calls TEXT2 0B1FEh; on failure records error string reference.
seq_event_handler:
        enter   6, 0
        push    si
        sub     ax, ax
        mov     word ptr [bp-2], ax
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-6], 0ffffh
        push    ds
        push    P_9D8E
        nop
        push    cs
        call    __setjmp
        add     sp, 4
        mov     word ptr [bp-2], ax
        or      ax, ax
        jne     br_0A230
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    ax
        callf   TEXT2_SEG:sample_access_caller
        or      ax, ax
        jne     br_0A1E9
        push    word ptr [G_ERRNO]
        push    ds
        push    P_9D8E
        nop
        push    cs
        call    _longjmp
        add     sp, 6
br_0A1E9:
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        call    track_event_handler
        mov     word ptr [bp-6], ax
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    word ptr [bp+14h]
        push    word ptr [bp+12h]
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        call    lcd_clear_line
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     si, ax
        mov     ax, word ptr [bp-6]
        mov     es, dx
        mov     word ptr es:[si+SND_POOL_IDX], ax
        nop
        push    cs
        call    int2F_dispatch_10
        push    word ptr [bp-2]
        push    si
        callf   TEXT2_SEG:ui_enter_pad_assign
        mov     ax, 1
        pop     si
        leave
        retf
        db      90h

br_0A230:
        nop
        push    cs
        call    int2F_dispatch_10
        mov     ax, word ptr [bp-2]
        mov     word ptr [G_ERRNO], ax
        callf   TEXT2_SEG:err_msg_report
        xor     ax, ax
        pop     si
        leave
        retf
        db      00h

; far-calls TEXT2 01278h (shared with mode_handler) for 32-bit result.
track_event_handler:
        enter   0eh, 0
        lea     ax, [bp-0eh]
        push    ss
        push    ax
        push    0
        push    2
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        nop
        push    cs
        call    __aFldiv
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        push    dx
        push    ax
        push    0
        callf   TEXT2_SEG:mem_io_handler
        or      ax, ax
        jne     br_0A281
        push    word ptr [G_ERRNO]
        push    ds
        push    P_9D8E
        nop
        push    cs
        call    _longjmp
        add     sp, 6
br_0A281:
        mov     bx, word ptr [bp-0eh]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL]
        mov     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     ax, word ptr [bx+SMEM_POOL_LEN]
        mov     dx, word ptr [bx+SMEM_POOL_LEN_HI]
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        push    word ptr [bp-0eh]
        nop
        push    cs
        call    smem_free
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        callf   TEXT2_SEG:far_memop_caller
        cmp     ax, word ptr [bp-8]
        jne     br_0A2CC
        cmp     dx, word ptr [bp-6]
        je      T1_br_0A2DC
br_0A2CC:
        push    word ptr [G_ERRNO]
        push    ds
        push    P_9D8E
        nop
        push    cs
        call    _longjmp
        add     sp, 6

T1_br_0A2DC:
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        nop
        push    cs
        call    smem_alloc
        mov     word ptr [bp-0eh], ax
        cmp     ax, 0ffffh
        je      br_0A30D
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        mov     bx, word ptr [bp-0eh]
        mov     cx, bx
        shl     bx, 2
        add     bx, cx
        add     bx, bx
        cmp     word ptr [bx+SMEM_POOL], ax
        jne     br_0A30D
        cmp     word ptr [bx+SMEM_POOL_BASE_HI], dx
        je      lcd_clear_line_A326

br_0A30D:
        cmp     word ptr [bp-0eh], -1
        je      br_0A31B
        push    word ptr [bp-0eh]
        nop
        push    cs
        call    smem_free

br_0A31B:
        push    5
        push    ds
        push    P_9D8E
        nop
        push    cs
        call    _longjmp

lcd_clear_line_A326:
        mov     ax, word ptr [bp-0eh]
        leave
        ret     4
        db      00h
; makes a sound from a sample file's header at [bp+8]: start +11h, end
; +1Bh:+19h plus 1, loop length that end less +15h, loop on when the byte
; at +24h is below 2, rate 48000/44100/24000/22050 and its tune by the
; index at +2Ch.
lcd_clear_line:
        enter   46h, 0
        push    di
        push    si
        mov     word ptr [bp-0ch], 0bb80h
        mov     word ptr [bp-0ah], 0ac44h
        mov     word ptr [bp-8], 5dc0h
        mov     word ptr [bp-6], 5622h
        mov     byte ptr [bp-4], 0fh
        mov     byte ptr [bp-3], 0
        mov     byte ptr [bp-2], 95h
        mov     byte ptr [bp-1], 88h
        lea     ax, [bp-42h]
        push    ss
        push    ax
        callf   TEXT2_SEG:sample_desc_init
        push    ds
        lea     si, [bp-42h]
        mov     cx, ss
        mov     ds, cx
        les     di, [bp+0ch]
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
        les     bx, [bp+8]
        mov     ax, word ptr es:[bx+11h]
        mov     word ptr [bp-2eh], ax
        mov     word ptr [bp-2ch], 0
        push    0
        push    2
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        nop
        push    cs
        call    __aFldiv
        mov     word ptr [bp-26h], ax
        mov     word ptr [bp-24h], dx
        les     bx, [bp+8]
        sub     ah, ah
        mov     al, byte ptr es:[bx+1bh]
        mov     dx, ax
        mov     cx, word ptr es:[bx+19h]
        add     cx, 1
        adc     dx, 0
        mov     word ptr [bp-2ah], cx
        mov     word ptr [bp-28h], dx
        cmp     byte ptr es:[bx+24h], 2
        jb      br_0A3D2
        xor     al, al
        jmp     br_0A3D4
        db      90h

br_0A3D2:
        mov     al, 1

br_0A3D4:
        mov     byte ptr [bp-1eh], al
        push    0
        mov     ax, cx
        sub     ax, word ptr es:[bx+15h]
        sbb     dx, 0
        mov     word ptr [bp-22h], ax
        mov     word ptr [bp-20h], dx
        push    dx
        push    ax
        nop
        push    cs
        call    addr_calc_segment
        add     sp, 6
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        les     bx, [bp+8]
        add     bx, 2ch
        mov     word ptr [bp-46h], bx
        mov     word ptr [bp-44h], es
        cmp     byte ptr es:[bx], 3
        ja      tgt_0A426
        sub     ah, ah
        mov     al, byte ptr es:[bx]
        mov     si, ax
        add     si, ax
        mov     ax, word ptr [bp+si-0ch]
        mov     word ptr [bp-1ch], ax
        mov     al, byte ptr es:[bx]
        sub     ah, ah
        mov     si, ax
        mov     al, byte ptr [bp+si-4]
        mov     byte ptr [bp-30h], al
tgt_0A426:
        sub     sp, 36h
        push    ds
        lea     si, [bp-42h]
        mov     di, sp
        add     di, 2
        push    ss
        pop     es
        push    ss
        pop     ds
        mov     cx, 1bh
        rep movsw
        pop     ds
        callf   TEXT2_SEG:sample_pool_add
        pop     si
        pop     di
        leave
        ret     0ch
        db      90h
smem_access_handler_1:
        enter   42h, 0
        push    si
        sub     ax, ax
        mov     word ptr [bp-2], ax
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-6], 0ffffh
        push    ds
        push    P_9D42
        nop
        push    cs
        call    __setjmp
        add     sp, 4
        mov     word ptr [bp-2], ax
        or      ax, ax
        jne     br_0A4D4
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    ax
        callf   TEXT2_SEG:sample_access_caller
        or      ax, ax
        jne     br_0A48D
        push    word ptr [G_ERRNO]
        push    ds
        push    P_9D42
        nop
        push    cs
        call    _longjmp
        add     sp, 6
br_0A48D:
        lea     ax, [bp-42h]
        push    ss
        push    ax
        call    status_poll_handler2
        lea     ax, [bp-42h]
        push    ss
        push    ax
        call    smem_access_setup
        mov     word ptr [bp-6], ax
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        lea     ax, [bp-42h]
        push    ss
        push    ax
        call    voice_play_range
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     si, ax
        mov     ax, word ptr [bp-6]
        mov     es, dx
        mov     word ptr es:[si+SND_POOL_IDX], ax
        nop
        push    cs
        call    int2F_dispatch_10
        push    word ptr [bp-2]
        push    si
        callf   TEXT2_SEG:ui_enter_pad_assign
        mov     ax, 1
        pop     si
        leave
        retf
        db      90h

br_0A4D4:
        nop
        push    cs
        call    int2F_dispatch_10
        mov     ax, word ptr [bp-2]
        mov     word ptr [G_ERRNO], ax
        callf   TEXT2_SEG:err_msg_report
        xor     ax, ax
        pop     si
        leave
        retf
        db      00h

; ?
status_poll_delay2:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+4]
        push    si
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    int2F_call_fn6
        add     sp, 6
        cmp     ax, si
        je      br_0A512
        push    2
        push    ds
        push    P_9D42
        nop
        push    cs
        call    _longjmp
        add     sp, 6

br_0A512:
        pop     si
        leave
        ret     6
        db      00h

status_smem_read:
        push    bp
        mov     bp, sp
loop_0A51B:
        mov     ax, word ptr [bp+4]
        mov     dx, word ptr [bp+6]
        sub     word ptr [bp+4], 1
        sbb     word ptr [bp+6], 0
        or      dx, ax
        je      br_0A546
        nop
        push    cs
        call    int2F_call_fn5
        or      ax, ax
        jge     loop_0A51B
        push    4
        push    ds
        push    P_9D42
        nop
        push    cs
        call    _longjmp
        mov     sp, bp
        jmp     loop_0A51B
        db      90h

br_0A546:
        leave
        ret     4
status_poll_handler2:
        enter   4, 0
        push    si
        mov     si, word ptr [bp+4]
        push    word ptr [bp+6]
        push    si
        push    SIZEOF_SMEM_REQ
        call    status_poll_delay2
        mov     es, word ptr [bp+6]
        mov     al, byte ptr es:[si+SMEM_REQ_FLAGS]
        and     ax, 60h
        sub     ax, 20h
        je      br_0A588
        sub     ax, 20h
        je      br_0A592
        mov     ax, word ptr es:[si+SMEM_REQ_A_START]
        mov     dx, word ptr es:[si+SMEM_REQ_A_START_HI]
        cmp     dx, word ptr es:[si+SMEM_REQ_B_START_HI]
        jb      br_0A59D
        ja      br_0A592
        cmp     ax, word ptr es:[si+SMEM_REQ_B_START]
        jbe     br_0A59D
        jmp     br_0A592
        db      90h
br_0A588:
        mov     ax, word ptr es:[si+SMEM_REQ_A_START]
        mov     dx, word ptr es:[si+SMEM_REQ_A_START_HI]
        jmp     br_0A59D

br_0A592:
        mov     es, word ptr [bp+6]
        mov     ax, word ptr es:[si+SMEM_REQ_B_START]
        mov     dx, word ptr es:[si+SMEM_REQ_B_START_HI]

br_0A59D:
        sub     ax, SIZEOF_SMEM_REQ
        sbb     dx, 0
        push    dx
        push    ax
        call    status_smem_read
        pop     si
        leave
        ret     4
        db      00h
smem_access_setup:
        enter   16h, 0
        push    di
        push    si
        mov     si, word ptr [bp+4]
        mov     es, word ptr [bp+6]
        mov     al, byte ptr es:[si+SMEM_REQ_FLAGS]
        and     ax, 60h
        sub     ax, 20h
        jne     br_0A5C9
        jmp     br_0A73E

br_0A5C9:
        sub     ax, 20h
        jne     br_0A5D1
        jmp     br_0A750

br_0A5D1:
        mov     ax, word ptr es:[si+SMEM_REQ_A_END]
        mov     dx, word ptr es:[si+SMEM_REQ_A_END_HI]
        sub     ax, word ptr es:[si+SMEM_REQ_A_START]
        sbb     dx, word ptr es:[si+SMEM_REQ_A_START_HI]
        shr     dx, 1
        rcr     ax, 1
        add     ax, 1
        adc     dx, 0
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        mov     cx, word ptr es:[si+SMEM_REQ_B_END]
        mov     bx, word ptr es:[si+SMEM_REQ_B_END_HI]
        sub     cx, word ptr es:[si+SMEM_REQ_B_START]
        sbb     bx, word ptr es:[si+SMEM_REQ_B_START_HI]
        shr     bx, 1
        rcr     cx, 1
        add     cx, 1
        adc     bx, 0
        mov     word ptr [bp-14h], cx
        mov     word ptr [bp-12h], bx
        lea     di, [bp-16h]
        push    ss
        push    di
        cmp     dx, bx
        jb      br_0A624
        ja      br_0A620
        cmp     ax, cx
        jbe     br_0A624

br_0A620:
        mov     dx, bx
        mov     ax, cx

br_0A624:
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    dx
        push    ax
        push    1
        callf   TEXT2_SEG:mem_io_handler
        or      ax, ax
        jne     br_0A647
        push    word ptr [G_ERRNO]
        push    ds
        push    P_9D42
        nop
        push    cs
        call    _longjmp
        add     sp, 6
br_0A647:
        mov     bx, word ptr [bp-16h]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL]
        mov     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     ax, word ptr [bx+SMEM_POOL_LEN]
        mov     dx, word ptr [bx+SMEM_POOL_LEN_HI]
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        push    word ptr [bp-16h]
        nop
        push    cs
        call    smem_free
        mov     es, word ptr [bp+6]
        mov     ax, word ptr es:[si+SMEM_REQ_B_START]
        mov     dx, word ptr es:[si+SMEM_REQ_B_START_HI]
        cmp     word ptr es:[si+SMEM_REQ_A_START_HI], dx
        ja      br_0A6EA
        jb      br_0A690
        cmp     word ptr es:[si+SMEM_REQ_A_START], ax
        jae     br_0A6EA
br_0A690:
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        callf   TEXT2_SEG:far_memop_caller
        cmp     ax, word ptr [bp-4]
        jne     br_0A6AB
        cmp     dx, word ptr [bp-2]
        je      br_0A6BB

br_0A6AB:
        push    word ptr [G_ERRNO]
        push    ds
        push    P_9D42
        nop
        push    cs
        call    _longjmp
        add     sp, 6

br_0A6BB:
        mov     ax, word ptr [bp-10h]
        mov     dx, word ptr [bp-0eh]
        sub     ax, word ptr [bp-4]
        sbb     dx, word ptr [bp-2]
        add     ax, ax
        adc     dx, dx
        push    dx
        push    ax
        call    status_smem_read
        push    0
        push    2
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        nop
        push    cs
        call    __aFldiv
        add     ax, word ptr [bp-8]
        adc     dx, word ptr [bp-6]
        push    dx
        push    ax
        jmp     br_0A7CC

br_0A6EA:
        push    0
        push    2
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        nop
        push    cs
        call    __aFldiv
        add     ax, word ptr [bp-8]
        adc     dx, word ptr [bp-6]
        push    dx
        push    ax
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        callf   TEXT2_SEG:far_memop_caller
        cmp     ax, word ptr [bp-4]
        jne     br_0A716
        cmp     dx, word ptr [bp-2]
        je      br_0A726

br_0A716:
        push    word ptr [G_ERRNO]
        push    ds
        push    P_9D42
        nop
        push    cs
        call    _longjmp
        add     sp, 6

br_0A726:
        mov     ax, word ptr [bp-14h]
        mov     dx, word ptr [bp-12h]
        sub     ax, word ptr [bp-4]
        sbb     dx, word ptr [bp-2]
        add     ax, ax
        adc     dx, dx
        push    dx
        push    ax
        call    status_smem_read
        jmp     br_0A7C6

br_0A73E:
        mov     ax, word ptr es:[si+SMEM_REQ_A_END]
        mov     dx, word ptr es:[si+SMEM_REQ_A_END_HI]
        sub     ax, word ptr es:[si+SMEM_REQ_A_START]
        sbb     dx, word ptr es:[si+SMEM_REQ_A_START_HI]
        jmp     br_0A760

br_0A750:
        mov     ax, word ptr es:[si+SMEM_REQ_B_END]
        mov     dx, word ptr es:[si+SMEM_REQ_B_END_HI]
        sub     ax, word ptr es:[si+SMEM_REQ_B_START]
        sbb     dx, word ptr es:[si+SMEM_REQ_B_START_HI]

br_0A760:
        shr     dx, 1
        rcr     ax, 1
        add     ax, 1
        adc     dx, 0
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        lea     ax, [bp-16h]
        push    ss
        push    ax
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    0
        callf   TEXT2_SEG:mem_io_handler
        or      ax, ax
        jne     br_0A796
        push    word ptr [G_ERRNO]
        push    ds
        push    P_9D42
        nop
        push    cs
        call    _longjmp
        add     sp, 6
br_0A796:
        mov     bx, word ptr [bp-16h]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL]
        mov     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     ax, word ptr [bx+SMEM_POOL_LEN]
        mov     dx, word ptr [bx+SMEM_POOL_LEN_HI]
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        push    word ptr [bp-16h]
        nop
        push    cs
        call    smem_free

br_0A7C6:
        push    word ptr [bp-6]
        push    word ptr [bp-8]

br_0A7CC:
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        callf   TEXT2_SEG:far_memop_caller
        cmp     ax, word ptr [bp-4]
        jne     T1_br_0A7E1
        cmp     dx, word ptr [bp-2]
        je      br_0A7F1
T1_br_0A7E1:
        push    word ptr [G_ERRNO]
        push    ds
        push    P_9D42
        nop
        push    cs
        call    _longjmp
        add     sp, 6

br_0A7F1:
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        nop
        push    cs
        call    smem_alloc
        mov     word ptr [bp-16h], ax
        cmp     ax, 0ffffh
        je      br_0A822
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        mov     bx, word ptr [bp-16h]
        mov     cx, bx
        shl     bx, 2
        add     bx, cx
        add     bx, bx
        cmp     word ptr [bx+SMEM_POOL], ax
        jne     br_0A822
        cmp     word ptr [bx+SMEM_POOL_BASE_HI], dx
        je      br_0A83E
br_0A822:
        cmp     word ptr [bp-16h], -1
        je      br_0A830
        push    word ptr [bp-16h]
        nop
        push    cs
        call    smem_free

br_0A830:
        push    5
        push    ds
        push    P_9D42
        nop
        push    cs
        call    _longjmp
        add     sp, 6

br_0A83E:
        mov     ax, word ptr [bp-16h]
        pop     si
        pop     di
        leave
        ret     4
        db      00h
; fills a sound from the SMEM_REQ header's channel A or B positions and
; midi_out_io, then sample_pool_add.
voice_play_range:
        enter   36h, 0
        push    di
        push    si
        lea     ax, [bp-36h]
        push    ss
        push    ax
        callf   TEXT2_SEG:sample_desc_init
        push    ds
        lea     si, [bp-36h]
        mov     cx, ss
        mov     ds, cx
        les     di, [bp+8]
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
        mov     word ptr [bp-20h], ax
        mov     word ptr [bp-22h], ax
        les     bx, [bp+4]
        mov     al, byte ptr es:[bx+SMEM_REQ_FLAGS]
        and     al, 1
        mov     byte ptr [bp-12h], al
        mov     al, byte ptr es:[bx+SMEM_REQ_FLAGS]
        and     ax, 60h
        sub     ax, 20h
        je      br_0A8D1
        sub     ax, 20h
        jne     br_0A8A3
        jmp     br_0A930
br_0A8A3:
        mov     byte ptr [bp-23h], 1

        mov     ax, word ptr es:[bx+SMEM_REQ_B_END]
        mov     dx, word ptr es:[bx+SMEM_REQ_B_END_HI]
        sub     ax, word ptr es:[bx+SMEM_REQ_B_START]
        sbb     dx, word ptr es:[bx+SMEM_REQ_B_START_HI]
        mov     cx, word ptr es:[bx+SMEM_REQ_A_END]
        mov     si, word ptr es:[bx+SMEM_REQ_A_END_HI]
        sub     cx, word ptr es:[bx+SMEM_REQ_A_START]
        sbb     si, word ptr es:[bx+SMEM_REQ_A_START_HI]
        cmp     si, dx
        ja      br_0A930
        jb      br_0A8D1
        cmp     cx, ax
        jae     br_0A930

br_0A8D1:
        mov     ax, word ptr es:[bx+SMEM_REQ_A_END]
        mov     dx, word ptr es:[bx+SMEM_REQ_A_END_HI]
        sub     ax, word ptr es:[bx+SMEM_REQ_A_START]
        sbb     dx, word ptr es:[bx+SMEM_REQ_A_START_HI]
        shr     dx, 1
        rcr     ax, 1
        add     ax, 1
        adc     dx, 0
        mov     word ptr [bp-1ah], ax
        mov     word ptr [bp-18h], dx
        mov     word ptr [bp-1eh], ax
        mov     word ptr [bp-1ch], dx
        mov     ax, word ptr es:[bx+SMEM_REQ_A_LOOP_END]
        mov     dx, word ptr es:[bx+SMEM_REQ_A_LOOP_END_HI]
        sub     ax, word ptr es:[bx+SMEM_REQ_A_LOOP]
        sbb     dx, word ptr es:[bx+SMEM_REQ_A_LOOP_HI]
        shr     dx, 1
        rcr     ax, 1
        add     ax, 1
        adc     dx, 0
        mov     word ptr [bp-16h], ax
        mov     word ptr [bp-14h], dx
        cmp     byte ptr [bp-12h], 0
        je      br_0A99C
        mov     ax, word ptr es:[bx+SMEM_REQ_A_LOOP_END]
        mov     dx, word ptr es:[bx+SMEM_REQ_A_LOOP_END_HI]
        sub     ax, word ptr es:[bx+SMEM_REQ_A_START]
        sbb     dx, word ptr es:[bx+SMEM_REQ_A_START_HI]
        jmp     br_0A98C
        db      90h

br_0A930:
        mov     ax, word ptr es:[bx+SMEM_REQ_B_END]
        mov     dx, word ptr es:[bx+SMEM_REQ_B_END_HI]
        sub     ax, word ptr es:[bx+SMEM_REQ_B_START]
        sbb     dx, word ptr es:[bx+SMEM_REQ_B_START_HI]
        shr     dx, 1
        rcr     ax, 1
        add     ax, 1
        adc     dx, 0
        mov     word ptr [bp-1ah], ax
        mov     word ptr [bp-18h], dx
        mov     word ptr [bp-1eh], ax
        mov     word ptr [bp-1ch], dx
        mov     ax, word ptr es:[bx+SMEM_REQ_B_LOOP_END]
        mov     dx, word ptr es:[bx+SMEM_REQ_B_LOOP_END_HI]
        sub     ax, word ptr es:[bx+SMEM_REQ_B_LOOP]
        sbb     dx, word ptr es:[bx+SMEM_REQ_B_LOOP_HI]
        shr     dx, 1
        rcr     ax, 1
        add     ax, 1
        adc     dx, 0
        mov     word ptr [bp-16h], ax
        mov     word ptr [bp-14h], dx
        cmp     byte ptr [bp-12h], 0
        je      br_0A99C
        mov     ax, word ptr es:[bx+SMEM_REQ_B_LOOP_END]
        mov     dx, word ptr es:[bx+SMEM_REQ_B_LOOP_END_HI]
        sub     ax, word ptr es:[bx+SMEM_REQ_B_START]
        sbb     dx, word ptr es:[bx+SMEM_REQ_B_START_HI]

br_0A98C:
        shr     dx, 1
        rcr     ax, 1
        add     ax, 1
        adc     dx, 0
        mov     word ptr [bp-1eh], ax
        mov     word ptr [bp-1ch], dx

br_0A99C:
        push    0
        push    word ptr [bp-14h]
        push    word ptr [bp-16h]
        nop
        push    cs
        call    addr_calc_segment
        add     sp, 6
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        les     bx, [bp+4]
        mov     ax, word ptr es:[bx+SMEM_REQ_RATE]
        mov     word ptr [bp-10h], ax
        push    word ptr es:[bx+SMEM_REQ_RATE_HI]
        push    word ptr es:[bx+SMEM_REQ_RATE]
        callf   TEXT2_SEG:midi_out_io
        mov     byte ptr [bp-24h], al
        sub     sp, 36h
        push    ds
        lea     si, [bp-36h]
        mov     di, sp
        add     di, 2
        push    ss
        pop     es
        push    ss
        pop     ds
        mov     cx, 1bh
        rep movsw
        pop     ds
        callf   TEXT2_SEG:sample_pool_add
        pop     si
        pop     di
        leave
        ret     8
        db      90h
int4A_sysex_wrapper:
        push    bp
        mov     bp, sp
        push    si
        mov     ah, byte ptr [SDS_TX_PORT]
        les     si, [bp+6]
        mov     cx, word ptr [bp+4]
        jcxz    br_0AA06

; far buffer ptr [bp+6] -> ES:SI, CX=[bp+4] byte count, then INT 4Ah.
tgt_0A9FE:
        mov     al, byte ptr es:[si]
        int     4ah                       ; MIDI sysex
        inc     si
        loop    tgt_0A9FE

br_0AA06:
        pop     si
        leave
        ret     6
        db      00h

fn_0AA0C:
        push    di
        xor     ax, ax
        mov     cx, 81h
        mov     di, P_8B9E
        push    ds
        pop     es
        rep stosw
        mov     cx, 41h
        mov     di, BUF_SYSEX_RX
        rep stosw
        push    4eh
        nop
        push    cs
        call    ivt_get_vector
        add     sp, 2
        mov     word ptr [G_OLD_INT4E_OFF], ax
        mov     word ptr [G_OLD_INT4E_SEG], dx
        push    TEXT2_SEG
        push    L_0D0C8
        push    4eh
        nop
        push    cs
        call    ivt_set_vector
        add     sp, 6
        pop     di
        ret

fn_0AA44:
        push    word ptr [G_OLD_INT4E_SEG]
        push    word ptr [G_OLD_INT4E_OFF]
        push    4eh
        nop
        push    cs
        call    ivt_set_vector
        add     sp, 6
        ret
        db      00h

midi_sysex_handler:
        enter   2, 0
        mov     al, byte ptr [G_MIDI_IN_RING_RD]
        cmp     byte ptr [G_MIDI_IN_RING_WR], al
        jne     loop_t1_0AA68
        jmp     br_0AAEA

loop_t1_0AA68:
        mov     bl, byte ptr [G_MIDI_IN_RING_RD]
        sub     bh, bh
        mov     al, byte ptr [bx+P_8B9E]
        mov     byte ptr [bp-1], al
        inc     byte ptr [G_MIDI_IN_RING_RD]
        test    byte ptr [bp-1], 80h
        je      br_0AA96
        cmp     al, 0f0h
        jne     br_0AAC8
        mov     byte ptr [G_SYSEX_RX_ACTIVE], 1
        mov     byte ptr [G_SYSEX_RX_LEN], bh
        mov     byte ptr [BUF_SYSEX_RX], al
        inc     byte ptr [G_SYSEX_RX_LEN]
        jmp     br_0AABD
        db      90h

br_0AA96:
        cmp     byte ptr [G_SYSEX_RX_ACTIVE], 0
        je      br_0AABD
        mov     al, byte ptr [bp-1]
        mov     bl, byte ptr [G_SYSEX_RX_LEN]
        sub     bh, bh
        mov     byte ptr [bx+BUF_SYSEX_RX], al
        inc     byte ptr [G_SYSEX_RX_LEN]
        cmp     byte ptr [G_SYSEX_RX_LEN], 80h
        jb      br_0AABD
        xor     al, al
        mov     byte ptr [G_SYSEX_RX_ACTIVE], al
        mov     byte ptr [G_SYSEX_RX_LEN], al

br_0AABD:
        mov     al, byte ptr [G_MIDI_IN_RING_RD]
        cmp     byte ptr [G_MIDI_IN_RING_WR], al
        jne     loop_t1_0AA68
        jmp     br_0AAEA

br_0AAC8:
        cmp     byte ptr [G_SYSEX_RX_ACTIVE], 0
        je      br_0AAEA
        mov     byte ptr [G_SYSEX_RX_ACTIVE], 0
        mov     bl, byte ptr [G_SYSEX_RX_LEN]
        sub     bh, bh
        mov     byte ptr [bx+BUF_SYSEX_RX], 0f7h
        inc     byte ptr [G_SYSEX_RX_LEN]
        mov     al, byte ptr [G_SYSEX_RX_LEN]
        sub     ah, ah
        leave
        ret

br_0AAEA:
        xor     ax, ax
        leave
        ret
seq_io_control:
        enter   1eh, 0
        push    si
        mov     si, word ptr [bp+4]
        mov     byte ptr [bp-1eh], 0f0h
        mov     byte ptr [bp-1dh], 7eh
        mov     byte ptr [bp-1bh], 1
        mov     al, byte ptr [SDS_EXCL_CH]
        mov     byte ptr [bp-1ch], al
        mov     al, byte ptr [SDS_SAMPLE_NUM]
        and     al, 7fh
        mov     byte ptr [bp-1ah], al
        mov     ax, word ptr [SDS_SAMPLE_NUM]
        add     ax, ax
        mov     byte ptr [bp-19h], ah
        mov     byte ptr [bp-18h], 10h
        mov     es, word ptr [bp+6]
        push    0
        push    word ptr es:[si+26h]
        push    3b9ah
        push    0ca00h
        nop
        push    cs
        call    __aFldiv
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        and     al, 7fh
        mov     byte ptr [bp-17h], al
        mov     ax, word ptr [bp-4]
        add     ax, ax
        mov     al, ah
        and     al, 7fh
        mov     byte ptr [bp-16h], al
        mov     ax, word ptr [bp-4]
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        and     dl, 7fh
        mov     byte ptr [bp-15h], dl
        mov     es, word ptr [bp+6]
        mov     al, byte ptr es:[si+1ch]
        and     al, 7fh
        mov     byte ptr [bp-14h], al
        mov     ax, word ptr es:[si+1ch]
        add     ax, ax
        mov     al, ah
        and     al, 7fh
        mov     byte ptr [bp-13h], al
        mov     ax, word ptr es:[si+1ch]
        mov     dx, word ptr es:[si+1eh]
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        and     dl, 7fh
        mov     byte ptr [bp-12h], dl
        mov     ax, word ptr es:[si+18h]
        mov     dx, word ptr es:[si+1ah]
        sub     ax, word ptr es:[si+20h]
        sbb     dx, word ptr es:[si+22h]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        and     al, 7fh
        mov     byte ptr [bp-11h], al
        mov     ax, word ptr [bp-8]
        add     ax, ax
        mov     al, ah
        and     al, 7fh
        mov     byte ptr [bp-10h], al
        mov     ax, word ptr [bp-8]
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        and     dl, 7fh
        mov     byte ptr [bp-0fh], dl
        mov     al, byte ptr es:[si+18h]
        and     al, 7fh
        mov     byte ptr [bp-0eh], al
        mov     ax, word ptr es:[si+18h]
        add     ax, ax
        mov     al, ah
        and     al, 7fh
        mov     byte ptr [bp-0dh], al
        mov     ax, word ptr es:[si+18h]
        mov     dx, word ptr es:[si+1ah]
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        and     dl, 7fh
        mov     byte ptr [bp-0ch], dl
        cmp     byte ptr es:[si+24h], 1
        sbb     al, al
        and     al, 7fh
        mov     byte ptr [bp-0bh], al
        mov     byte ptr [bp-0ah], 0f7h
        lea     ax, [bp-1eh]
        push    ss
        push    ax
        push    15h
        call    int4A_sysex_wrapper
        pop     si
        leave
        ret     4
string_scan_sysex:
        enter   8, 0
        mov     cx, word ptr [bp+4]
        mov     byte ptr [bp-8], 0f0h
        mov     byte ptr [bp-7], 7eh
        mov     byte ptr [bp-5], 3
        mov     al, byte ptr [bp+6]
        mov     byte ptr [bp-6], al
        mov     ax, cx
        and     cl, 7fh
        mov     byte ptr [bp-4], cl
        add     ax, ax
        mov     al, ah
        mov     byte ptr [bp-3], ah
        mov     byte ptr [bp-2], 0f7h
        lea     ax, [bp-8]
        push    ss
        push    ax
        push    7
        call    int4A_sysex_wrapper
        leave
        ret     4
audio_event_handler:
        enter   4, 0
        push    di
        push    si
        mov     byte ptr [BUF_SDS_PACKET], 0f0h
        mov     byte ptr [B_50B9], 7eh
        mov     al, byte ptr [SDS_EXCL_CH]
        mov     byte ptr [B_50BA], al
        mov     byte ptr [B_50BB], 2
        mov     cl, byte ptr [SDS_TX_PACKET]
        and     cl, 7fh
        mov     byte ptr [SDS_PKT_NUM], cl
        xor     cl, al
        xor     cl, 7ch
        mov     byte ptr [bp-3], cl
        mov     si, P_50BD
        les     di, [bp+4]
        mov     word ptr [bp-2], 28h
loop_0AC7D:
        mov     cx, word ptr es:[di]
        add     ch, 80h
        mov     ax, cx
        mov     al, ah
        shr     al, 1
        mov     byte ptr [si], al
        xor     byte ptr [bp-3], al
        mov     ax, cx
        shr     cx, 2
        and     cl, 7fh
        mov     byte ptr [si+1], cl
        and     al, 3
        shl     al, 5
        mov     byte ptr [si+2], al
        xor     al, cl
        xor     byte ptr [bp-3], al
        add     si, 3
        add     di, 2
        dec     word ptr [bp-2]
        jne     loop_0AC7D
        mov     al, byte ptr [bp-3]
        mov     byte ptr [SDS_PKT_CHECKSUM], al
        mov     byte ptr [B_5136], 0f7h
        push    ds
        push    BUF_SDS_PACKET
        push    7fh
        call    int4A_sysex_wrapper
        pop     si
        pop     di
        leave
        ret     4
        db      00h
int4A_proc_caller:
        enter   6, 0
        mov     byte ptr [bp-6], 0f0h
        mov     byte ptr [bp-5], 7eh
        mov     al, byte ptr [SDS_EXCL_CH]
        mov     byte ptr [bp-4], al
        mov     al, byte ptr [bp+4]
        mov     byte ptr [bp-3], al
        mov     al, byte ptr [SDS_RX_PACKET]
        and     al, 7fh
        mov     byte ptr [bp-2], al
        mov     byte ptr [bp-1], 0f7h
        lea     ax, [bp-6]
        push    ss
        push    ax
        push    6
        call    int4A_sysex_wrapper
        leave
        ret     2
L_0ACFE:
        pusha
        push    ds
        push    es
        mov     bp, sp
        push    ds
        mov     ax, DATA_SEG
        mov     ds, ax
        cld
        sti
        xor     ax, ax
        mov     cx, 2dh
        mov     di, SDS_RX_PORT
        push    ds
        pop     es
        rep stosw
        mov     ax, word ptr [bp+0ch]
        mov     cx, word ptr [bp+12h]
        mov     word ptr [W_5138], cx
        mov     word ptr [W_513A], ax
        mov     ax, word ptr [bp+0eh]
        mov     cx, word ptr [bp+10h]
        mov     word ptr [W_513C], cx
        mov     word ptr [W_513E], ax
        call    fn_0AD3A
        mov     sp, bp
        pop     es
        pop     ds
        popa
        iret

fn_0AD3A:
        callf   TEXT2_SEG:X_07C12
        push    word ptr [PTR_LCD_STATE+2]
        push    word ptr [PTR_LCD_STATE]
        callf   TEXT2_SEG:sample_ptr_helper
        or      ax, ax
        jne     br_0AD5C
        callf   TEXT2_SEG:far_078E4
        mov     word ptr [PTR_LCD_STATE], ax
        mov     word ptr [PTR_LCD_STATE+2], dx

br_0AD5C:
        push    ds
        push    TBL_WINKEYS_0423A
        nop
        push    cs
        call    win_keys_merge
        call    midi_txrx_arm_field
        push    0
        callf   TEXT2_SEG:int44_wrapper
        call    fn_0AA0C
        ret
        db      00h

far_0AD74:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        test    byte ptr [SDS_STATE], 2
        je      br_0AD88
        and     byte ptr [SDS_STATE], 0fdh
        jmp     br_0AD94
br_0AD88:
        test    byte ptr [SDS_STATE], 4
        je      br_0AD99
        and     byte ptr [SDS_STATE], 0fbh

br_0AD94:
        push    7dh
        call    int4A_proc_caller

br_0AD99:
        call    fn_0AA44
        push    1
        callf   TEXT2_SEG:int44_wrapper
        pop     ds
        retf
        db      00h

midi_txrx_arm_field:
        test    byte ptr [SDS_STATE], 7
        je      br_0ADB0
        jmp     L_0AE57

br_0ADB0:
        mov     al, byte ptr [G_ASSIGN_VIEW_FIELD]
        cbw
        cmp     ax, 5
        ja      br_0ADCE
        add     ax, ax
        xchg    bx, ax
        jmp     word ptr cs:[bx+X_0ADC2]

        db      90h

X_0ADC2:
        dw      X_0AE3C, X_0ADD6, X_0ADF4, X_0AE04
        dw      X_0AE1A, X_0AE2A

br_0ADCE:
        mov     byte ptr [G_ASSIGN_VIEW_FIELD], 0
        jmp     X_0AE3C
        db      90h

X_0ADD6:
        push    ds
        push    SDS_REQUEST_NUM
        push    0
        push    0ffh
        push    3
        push    4bh

X_0ADE3:
        push    25h
        push    0
        push    0
        push    0
        push    0
        callf   TEXT2_SEG:status_read_6A_3
        ret
        db      90h

X_0ADF4:
        push    ds
        push    SDS_TX_PORT
        push    0
        push    1
        push    1
        push    0e6h
        jmp     SHORT L_0AE48
        db      90h

X_0AE04:
        push    ds
        push    PTR_LCD_STATE
        push    0
        push    80h
        push    17h
        push    0
        push    0
        nop
        push    cs
        call    far_035F2
        ret
        db      90h

X_0AE1A:
        push    ds
        push    SDS_EXCL_CH
        push    0
        push    7fh
        push    3
        push    0ceh
        jmp     SHORT X_0ADE3
        db      90h

X_0AE2A:
        push    ds
        push    SDS_STEREO_SIDE
        push    0
        push    1
        push    1
        push    0e6h
        push    17h
        jmp     SHORT X_0AE4A
        db      90h

X_0AE3C:
        push    ds
        push    SDS_RX_PORT
        push    0
        push    1
        push    1
        push    69h

L_0AE48:
        push    2

X_0AE4A:
        push    0
        push    0
        push    0
        push    0
        callf   TEXT2_SEG:timer_dma_ch2

L_0AE57:
        ret

X_0AE58:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_ASSIGN_VIEW_FIELD]
        cbw
        cmp     ax, 5
        ja      X_0AE87
        add     ax, ax
        xchg    bx, ax
        jmp     word ptr cs:[bx+X_0AE70]
        db      90h

X_0AE70:
        dw      X_0AE8A, X_0AE7C, X_0AE8A, X_0AE7C
        dw      X_0AE7C, L_0AE82

X_0AE7C:
        dec     byte ptr [G_ASSIGN_VIEW_FIELD]
        jmp     SHORT X_0AE87

L_0AE82:
        mov     byte ptr [G_ASSIGN_VIEW_FIELD], 2

X_0AE87:
        call    midi_txrx_arm_field

X_0AE8A:
        pop     ds
        retf

L_0AE8C:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_ASSIGN_VIEW_FIELD]
        cbw
        or      ax, ax
        je      br_0AEAA
        dec     ax
        dec     ax
        jl      X_0AEB8
        jo      X_0AEB8
        dec     ax
        jle     br_0AEAA
        dec     ax
        dec     ax
        je      L_0AEB0
        pop     ds
        retf
        db      90h

br_0AEAA:
        inc     byte ptr [G_ASSIGN_VIEW_FIELD]
        jmp     L_0AEB5

L_0AEB0:
        mov     byte ptr [G_ASSIGN_VIEW_FIELD], 4

L_0AEB5:
        call    midi_txrx_arm_field

X_0AEB8:
        pop     ds
        retf

tgt_0AEBA:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_ASSIGN_VIEW_FIELD]
        cbw
        dec     ax
        dec     ax
        jl      L_0AEEE
        jo      L_0AEEE
        dec     ax
        jle     br_0AED6
        dec     ax
        je      br_0AEDE
        dec     ax
        je      L_0AEE6
        pop     ds
        retf
        db      90h

br_0AED6:
        sub     byte ptr [G_ASSIGN_VIEW_FIELD], 2
        jmp     br_0AEEB
        db      90h

br_0AEDE:
        mov     byte ptr [G_ASSIGN_VIEW_FIELD], 1
        jmp     br_0AEEB
        db      90h

L_0AEE6:
        mov     byte ptr [G_ASSIGN_VIEW_FIELD], 4

br_0AEEB:
        call    midi_txrx_arm_field

L_0AEEE:
        pop     ds
        retf

X_0AEF0:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_ASSIGN_VIEW_FIELD]
        cbw
        or      ax, ax
        jl      X_0AF2E
        jo      X_0AF2E
        dec     ax
        jle     br_0AF0A
        dec     ax
        dec     ax
        je      br_0AF12
        pop     ds
        retf
        db      90h

br_0AF0A:
        add     byte ptr [G_ASSIGN_VIEW_FIELD], 2
        jmp     L_0AF2B
        db      90h

br_0AF12:
        mov     ax, word ptr [PTR_LCD_STATE+2]
        or      ax, word ptr [PTR_LCD_STATE]
        je      X_0AF2E
        les     bx, [PTR_LCD_STATE]
        cmp     byte ptr es:[bx+SND_STEREO], 0
        je      X_0AF2E
        mov     byte ptr [G_ASSIGN_VIEW_FIELD], 5

L_0AF2B:
        call    midi_txrx_arm_field

X_0AF2E:
        pop     ds
        retf

X_0AF30:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        test    byte ptr [SDS_STATE], 7
        jne     X_0AF4A
        mov     al, byte ptr [SDS_EXCL_CH]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [SDS_REQUEST_NUM]
        push    ax
        call    string_scan_sysex

X_0AF4A:
        pop     ds
        retf

X_0AF4C:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        test    byte ptr [SDS_STATE], 2
        je      br_0AF68
        and     byte ptr [SDS_STATE], 0fdh

loop_0AF5E:
        push    7dh
        call    int4A_proc_caller
        call    midi_txrx_arm_field
        pop     ds
        retf

br_0AF68:
        test    byte ptr [SDS_STATE], 4
        je      lcd_draw_data_AF80
        and     byte ptr [SDS_STATE], 0fbh
        push    word ptr [SDS_RX_SND_SLOT]
        nop
        push    cs
        call    smem_free
        jmp     loop_0AF5E
        db      90h

lcd_draw_data_AF80:
        or      byte ptr [SDS_STATE], 1
        pop     ds
        retf
        db      00h

lcd_draw_data:
        enter   2, 0
        push    ax
        push    di

L_0AF8E:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        call    midi_sysex_handler
        mov     si, ax
        or      si, ax
        je      br_0AFA8
        push    ds
        push    BUF_SYSEX_RX
        push    si
        nop
        push    cs
        call    sysex_sub_dispatch

br_0AFA8:
        test    byte ptr [SDS_STATE], 1
        jne     br_0AFB2
        jmp     br_0B06D

br_0AFB2:
        callf   TEXT2_SEG:field_edit_disable
        and     byte ptr [SDS_STATE], 0feh
        mov     ax, word ptr [PTR_LCD_STATE+2]
        or      ax, word ptr [PTR_LCD_STATE]
        jne     br_0AFC8
        jmp     br_0B06D

br_0AFC8:
        les     bx, [PTR_LCD_STATE]
        cmp     word ptr es:[bx+SND_LENGTH_HI], 1fh
        jle     br_0AFD6
        jmp     br_0B06D

br_0AFD6:
        mov     si, word ptr es:[bx+SND_POOL_IDX]
        mov     ax, si
        shl     si, 2
        add     si, ax
        add     si, si
        mov     ax, word ptr [si+SMEM_POOL]
        mov     dx, word ptr [si+SMEM_POOL_BASE_HI]
        mov     word ptr [SDS_TX_ADDR], ax
        mov     word ptr [SDS_TX_ADDR_HI], dx
        cmp     byte ptr es:[bx+SND_STEREO], 0
        je      br_0B026
        cmp     byte ptr [SDS_STEREO_SIDE], 0
        je      br_0B026
        push    0
        push    2
        mov     bx, word ptr es:[bx+SND_POOL_IDX]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        push    word ptr [bx+SMEM_POOL_LEN_HI]
        push    word ptr [bx+SMEM_POOL_LEN]
        nop
        push    cs
        call    __aFldiv
        add     word ptr [SDS_TX_ADDR], ax
        adc     word ptr [SDS_TX_ADDR_HI], dx

br_0B026:
        push    0
        push    28h
        les     bx, [PTR_LCD_STATE]
        mov     ax, word ptr es:[bx+SND_LENGTH]
        mov     dx, word ptr es:[bx+SND_LENGTH_HI]
        add     ax, 27h
        adc     dx, 0
        push    dx
        push    ax
        nop
        push    cs
        call    __aFldiv
        mov     word ptr [SDS_PACKET_COUNT], ax
        push    word ptr [PTR_LCD_STATE+2]
        push    word ptr [PTR_LCD_STATE]
        call    seq_io_control
        mov     word ptr [SDS_TX_PACKET], 0
        or      byte ptr [SDS_STATE], 2
        mov     ax, word ptr [bp-4]
        mov     word ptr [SDS_TX_TIME], ax
        mov     word ptr [SDS_TX_TIMEOUT], 7d0h
        callf   TEXT2_SEG:cmd_far_stub2

br_0B06D:
        test    byte ptr [SDS_STATE], 2
        jne     br_0B077
        jmp     br_0B11B

br_0B077:
        mov     ax, word ptr [bp-4]
        sub     ax, word ptr [SDS_TX_TIME]
        cmp     ax, word ptr [SDS_TX_TIMEOUT]
        ja      br_0B087
        jmp     br_0B11B

br_0B087:
        mov     ax, word ptr [SDS_PACKET_COUNT]
        cmp     word ptr [SDS_TX_PACKET], ax
        jae     br_0B10E
        push    word ptr [SDS_TX_ADDR_HI]
        push    word ptr [SDS_TX_ADDR]
        push    ds
        push    BUF_XFER
        push    28h
        callf   TEXT2_SEG:smem_read_words
        mov     ax, word ptr [SDS_TX_PACKET]
        sub     ax, word ptr [SDS_PACKET_COUNT]
        cmp     ax, 0ffffh
        jne     br_0B0E7
        push    0
        push    28h
        les     bx, [PTR_LCD_STATE]
        push    word ptr es:[bx+SND_LENGTH_HI]
        push    word ptr es:[bx+SND_LENGTH]
        nop
        push    cs
        call    __aFlrem
        mov     word ptr [bp-2], ax
        or      ax, ax
        je      br_0B0E7
        xor     ax, ax
        mov     bx, word ptr [bp-2]
        add     bx, bx
        mov     cx, 28h
        sub     cx, word ptr [bp-2]
        add     cx, cx
        lea     di, [bx+BUF_XFER]
        push    ds
        pop     es
        shr     cx, 1
        rep stosw
        jae     br_0B0E7
        stosb

br_0B0E7:
        push    ds
        push    BUF_XFER
        call    audio_event_handler
        add     word ptr [SDS_TX_ADDR], 28h
        adc     word ptr [SDS_TX_ADDR_HI], 0
        inc     word ptr [SDS_TX_PACKET]
        mov     ax, word ptr [bp-4]
        mov     word ptr [SDS_TX_TIME], ax
        mov     word ptr [SDS_TX_TIMEOUT], 28h
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      90h

br_0B10E:
        and     byte ptr [SDS_STATE], 0fdh
        callf   TEXT2_SEG:cmd_far_stub2
        call    midi_txrx_arm_field

br_0B11B:
        pop     ds
        pop     si
        pop     di
        leave
        retf

; MIDI SysEx sub-message dispatcher: manufacturer 7Eh, device id byte,
; sub-command es:[si+3].
sysex_sub_dispatch:
        enter   0ch, 0
        push    di
        push    si
        mov     si, word ptr [bp+8]
        mov     es, word ptr [bp+0ah]
        cmp     byte ptr es:[si+1], 7eh
        je      br_0B136
        jmp     lcd_clear_buffer_B38D

br_0B136:
        mov     al, byte ptr [SDS_EXCL_CH]
        cmp     byte ptr es:[si+2], al
        je      br_0B149
        cmp     byte ptr es:[si+2], 7fh
        je      br_0B149
        jmp     lcd_clear_buffer_B38D

br_0B149:
        mov     al, byte ptr es:[si+3]
        sub     ah, ah
        cmp     ax, 7fh
        jne     br_0B157
        jmp     br_0B366

br_0B157:
        jbe     br_0B15C
        jmp     lcd_clear_buffer_B38D

br_0B15C:
        cmp     al, 3
        jne     br_0B163
        jmp     br_0B2AE

br_0B163:
        jg      br_0B170
        dec     al
        je      br_0B18C
        dec     al
        je      br_0B1E4
        jmp     lcd_clear_buffer_B38D

br_0B170:
        sub     al, 7ch
        jne     br_0B177
        jmp     br_0B2E0

br_0B177:
        dec     al
        jne     br_0B17E
        jmp     br_0B2F6

br_0B17E:
        dec     al
        jne     br_0B185
        jmp     br_0B32E

br_0B185:
        pop     si
        pop     di
        leave
        retf    6
        db      90h

br_0B18C:
        cmp     word ptr [bp+6], 15h
        je      br_0B195
        jmp     lcd_clear_buffer_B38D

br_0B195:
        test    byte ptr [SDS_STATE], 2
        je      br_0B19F
        jmp     lcd_clear_buffer_B38D

br_0B19F:
        cmp     byte ptr es:[si+6], 8
        jae     br_0B1A9
        jmp     lcd_clear_buffer_B38D

br_0B1A9:
        cmp     byte ptr es:[si+6], 15h
        jbe     br_0B1B3
        jmp     lcd_clear_buffer_B38D

br_0B1B3:
        mov     word ptr [SDS_RX_PACKET], 0
        push    es
        push    si
        call    lcd_clear_buffer
        or      ax, ax
        je      br_0B1D4
        callf   TEXT2_SEG:field_edit_disable
        push    7fh
        call    int4A_proc_caller
        or      byte ptr [SDS_STATE], 4
        jmp     loop_0B1D9
        db      90h

br_0B1D4:
        push    7dh
        call    int4A_proc_caller

loop_0B1D9:
        callf   TEXT2_SEG:cmd_far_stub2
        pop     si
        pop     di
        leave
        retf    6

br_0B1E4:
        cmp     word ptr [bp+6], 7fh
        je      br_0B1ED
        jmp     lcd_clear_buffer_B38D

br_0B1ED:
        test    byte ptr [SDS_STATE], 4
        jne     br_0B1F7
        jmp     lcd_clear_buffer_B38D

br_0B1F7:
        cmp     word ptr [SDS_PKT_WORDS], 0
        je      br_0B26C
        mov     ax, si
        mov     dx, es
        add     ax, 6
        mov     cx, ax
        mov     word ptr [bp-8], es
        mov     si, ax
        mov     word ptr [bp-2], es
        mov     di, BUF_XFER
        mov     ax, word ptr [SDS_PKT_WORDS]
        mov     word ptr [bp-0ch], ax
loop_0B218:
        cmp     word ptr [SDS_PKT_WORDS], 28h
        jne     br_0B23E
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+1]
        shr     al, 5
        sub     ah, ah
        lea     bx, [si-1]
        sub     dh, dh
        mov     dl, byte ptr es:[bx]
        shl     dx, 9
        or      ax, dx
        mov     dl, byte ptr es:[si]
        jmp     br_0B251
        db      90h
br_0B23E:
        mov     es, word ptr [bp-8]
        mov     bx, cx
        dec     bx
        sub     ah, ah
        mov     al, byte ptr es:[bx]
        mov     bx, cx
        shl     ax, 9
        mov     dl, byte ptr es:[bx]
br_0B251:
        sub     dh, dh
        shl     dx, 2
        or      ax, dx
        mov     word ptr [di], ax
        add     byte ptr [di+1], 80h
        add     cx, 2
        add     si, 3
        add     di, 2
        dec     word ptr [bp-0ch]
        jne     loop_0B218

br_0B26C:
        push    word ptr [SDS_RX_ADDR_HI]
        push    word ptr [SDS_RX_ADDR]
        push    ds
        push    BUF_XFER
        push    word ptr [SDS_PKT_WORDS]
        callf   TEXT2_SEG:flash_write_words
        mov     ax, word ptr [SDS_PKT_WORDS]
        sub     dx, dx
        add     word ptr [SDS_RX_ADDR], ax
        adc     word ptr [SDS_RX_ADDR_HI], dx
        push    7fh
        call    int4A_proc_caller
        mov     ax, word ptr [SDS_PACKET_COUNT]
        inc     word ptr [SDS_RX_PACKET]
        cmp     word ptr [SDS_RX_PACKET], ax
        jae     br_0B2A3
        jmp     lcd_clear_buffer_B38D

br_0B2A3:
        and     byte ptr [SDS_STATE], 0fbh
        call    fn_0B53E
        jmp     loop_0B1D9

br_0B2AE:
        cmp     word ptr [bp+6], 7
        je      br_0B2B7
        jmp     lcd_clear_buffer_B38D

br_0B2B7:
        test    byte ptr [SDS_STATE], 5
        je      br_0B2C1
        jmp     lcd_clear_buffer_B38D

br_0B2C1:
        mov     al, byte ptr es:[si+5]
        sub     ah, ah
        shl     ax, 7
        mov     cl, byte ptr es:[si+4]
        sub     ch, ch
        or      ax, cx
        mov     word ptr [SDS_SAMPLE_NUM], ax
        or      byte ptr [SDS_STATE], 1
        pop     si
        pop     di
        leave
        retf    6
br_0B2E0:
        cmp     word ptr [bp+6], 6
        je      br_0B2E9
        jmp     lcd_clear_buffer_B38D

br_0B2E9:
        mov     word ptr [SDS_TX_TIMEOUT], 0ffffh
        pop     si
        pop     di
        leave
        retf    6
        db      90h

br_0B2F6:
        cmp     word ptr [bp+6], 6
        je      br_0B2FF
        jmp     lcd_clear_buffer_B38D

br_0B2FF:
        test    byte ptr [SDS_STATE], 2
        je      br_0B30B
        and     byte ptr [SDS_STATE], 0fdh

br_0B30B:
        test    byte ptr [SDS_STATE], 4
        je      br_0B320
        and     byte ptr [SDS_STATE], 0fbh
        push    word ptr [SDS_RX_SND_SLOT]
        nop
        push    cs
        call    smem_free

br_0B320:
        callf   TEXT2_SEG:cmd_far_stub2
        call    midi_txrx_arm_field
        pop     si
        pop     di
        leave
        retf    6
br_0B32E:
        cmp     word ptr [bp+6], 6
        jne     lcd_clear_buffer_B38D
        test    byte ptr [SDS_STATE], 2
        je      lcd_clear_buffer_B38D
        cmp     byte ptr es:[si+4], 7fh
        jne     br_0B348
        mov     ax, 1
        jmp     br_0B34A
        db      90h

br_0B348:
        xor     ax, ax

br_0B34A:
        mov     cx, word ptr [SDS_TX_PACKET]
        dec     cx
        test    cx, ax
        je      lcd_clear_buffer_B38D
        sub     word ptr [SDS_TX_ADDR], 28h
        sbb     word ptr [SDS_TX_ADDR_HI], 0
        mov     ax, word ptr [SDS_TX_PACKET]
        dec     ax
        mov     word ptr [SDS_TX_PACKET], ax
        jmp     br_0B387
br_0B366:
        cmp     word ptr [bp+6], 6
        jne     lcd_clear_buffer_B38D
        test    byte ptr [SDS_STATE], 2
        je      lcd_clear_buffer_B38D
        cmp     word ptr [SDS_TX_PACKET], 0
        je      br_0B387
        mov     al, byte ptr [SDS_TX_PACKET]
        dec     al
        and     al, 7fh
        cmp     byte ptr es:[si+4], al
        jne     lcd_clear_buffer_B38D

br_0B387:
        mov     word ptr [SDS_TX_TIMEOUT], 0

lcd_clear_buffer_B38D:
        pop     si
        pop     di
        leave
        retf    6
        db      00h

lcd_clear_buffer:
        enter   8, 0
        push    si
        mov     si, word ptr [bp+4]
        push    ds
        push    P_8CF2
        callf   TEXT2_SEG:sample_desc_init
        mov     es, word ptr [bp+6]
        mov     al, byte ptr es:[si+9]
        sub     ah, ah
        sub     dx, dx
        shr     dx, 1
        rcr     ax, 1
        rcr     dx, 1
        rcr     ax, 1
        rcr     dx, 1
        xchg    dx, ax
        and     ax, 0c000h
        mov     cl, byte ptr es:[si+8]
        sub     ch, ch
        shl     cx, 7
        mov     bl, byte ptr es:[si+7]
        sub     bh, bh
        or      cx, bx
        sub     bx, bx
        or      ax, cx
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     al, byte ptr es:[si+0fh]
        sub     ah, ah
        sub     dx, dx
        shr     dx, 1
        rcr     ax, 1
        rcr     dx, 1
        rcr     ax, 1
        rcr     dx, 1
        xchg    dx, ax
        and     ax, 0c000h
        mov     cl, byte ptr es:[si+0eh]
        sub     ch, ch
        shl     cx, 7
        mov     bl, byte ptr es:[si+0dh]
        or      cx, bx
        sub     bx, bx
        or      ax, cx
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        sub     ax, ax
        mov     word ptr [W_8D08], ax
        mov     word ptr [W_8D06], ax
        mov     al, byte ptr es:[si+12h]
        sub     dx, dx
        shr     dx, 1
        rcr     ax, 1
        rcr     dx, 1
        rcr     ax, 1
        rcr     dx, 1
        xchg    dx, ax
        and     ax, 0c000h
        mov     cl, byte ptr es:[si+11h]
        sub     ch, ch
        shl     cx, 7
        mov     bl, byte ptr es:[si+10h]
        or      cx, bx
        sub     bx, bx
        or      ax, cx
        mov     word ptr [SDS_LOOP_END], ax
        mov     word ptr [SDS_LOOP_END_HI], dx
        mov     al, byte ptr es:[si+0ch]
        sub     ah, ah
        sub     dx, dx
        shr     dx, 1
        rcr     ax, 1
        rcr     dx, 1
        rcr     ax, 1
        rcr     dx, 1
        xchg    dx, ax
        and     ax, 0c000h
        mov     cl, byte ptr es:[si+0bh]
        sub     ch, ch
        shl     cx, 7
        mov     bl, byte ptr es:[si+0ah]
        or      cx, bx
        sub     bx, bx
        or      ax, cx
        mov     word ptr [SDS_SAMPLE_LEN], ax
        mov     word ptr [SDS_SAMPLE_LEN_HI], dx
        cmp     byte ptr es:[si+13h], 7fh
        jne     br_0B47A
        xor     al, al
        jmp     br_0B47C
        db      90h

br_0B47A:
        mov     al, 1

br_0B47C:
        mov     byte ptr [SDS_LOOP_ON], al
        mov     ax, word ptr [SDS_LOOP_END]
        mov     dx, word ptr [SDS_LOOP_END_HI]
        sub     ax, word ptr [bp-8]
        sbb     dx, word ptr [bp-6]
        mov     word ptr [SDS_LOOP_LEN], ax
        mov     word ptr [SDS_LOOP_LEN_HI], dx
        or      dx, dx
        jge     br_0B49F
        sub     ax, ax
        mov     word ptr [SDS_LOOP_LEN_HI], ax
        mov     word ptr [SDS_LOOP_LEN], ax
br_0B49F:
        cmp     byte ptr [SDS_LOOP_ON], 0
        je      br_0B4B4
        mov     ax, word ptr [SDS_SAMPLE_LEN]
        mov     dx, word ptr [SDS_SAMPLE_LEN_HI]
        mov     word ptr [SDS_LOOP_END], ax
        mov     word ptr [SDS_LOOP_END_HI], dx

br_0B4B4:
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    3b9ah
        push    0ca00h
        nop
        push    cs
        call    __aFuldiv
        mov     word ptr [SDS_SAMPLE_RATE], ax
        mov     es, word ptr [bp+6]
        cmp     byte ptr es:[si+6], 0fh
        jb      br_0B4D8
        mov     ax, 28h
        jmp     br_0B4DB
        db      90h

br_0B4D8:
        mov     ax, 3ch
br_0B4DB:
        mov     word ptr [SDS_PKT_WORDS], ax
        sub     dx, dx
        push    dx
        push    ax
        add     ax, word ptr [SDS_SAMPLE_LEN]
        adc     dx, word ptr [SDS_SAMPLE_LEN_HI]
        sub     ax, 1
        sbb     dx, 0
        push    dx
        push    ax
        nop
        push    cs
        call    __aFldiv
        mov     word ptr [SDS_PACKET_COUNT], ax
        push    ds
        push    SDS_RX_SND_SLOT
        push    word ptr [SDS_SAMPLE_LEN_HI]
        push    word ptr [SDS_SAMPLE_LEN]
        push    0
        callf   TEXT2_SEG:mem_io_handler
        or      ax, ax
        je      br_0B536
        mov     bx, word ptr [SDS_RX_SND_SLOT]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL]
        mov     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        mov     word ptr [SDS_RX_ADDR], ax
        mov     word ptr [SDS_RX_ADDR_HI], dx
        mov     ax, 1
        pop     si
        leave
        ret     4
        db      90h
br_0B536:
        xor     ax, ax
        pop     si
        leave
        ret     4
        db      00h

fn_0B53E:
        push    di
        push    si
        if      FW_VERSION = 172
        cmp     byte ptr [B_8CED], 0
        je      L_0B5A0
        endif
        nop
        push    cs
        call    far_0AD74
        push    0
        push    word ptr [SDS_LOOP_LEN_HI]
        push    word ptr [SDS_LOOP_LEN]
        nop
        push    cs
        call    addr_calc_segment
        add     sp, 6
        mov     word ptr [W_8D24], ax
        mov     word ptr [W_8D26], dx
        push    ds
        push    P_8CF2
        callf   TEXT2_SEG:timer_fdc_sync
        callf   TEXT2_SEG:X_00610
        push    34h
        push    TEXT2_SEG
        push    L_0D272
        callf   TEXT2_SEG:install_handler
        push    word TEXT1_SEG
        push    L_0B5DC
        sub     sp, 36h
        mov     si, P_8CF2
        mov     di, sp
        push    ss
        pop     es
        mov     cx, 1bh
        rep movsw
        nop
        push    cs
        call    ui_enter_sound_dialog
        add     sp, 3ah
        pop     si
        pop     di
        ret
        if      FW_VERSION = 172

L_0B5A0:
        push    0
        push    word ptr [SDS_LOOP_LEN_HI]
        push    word ptr [SDS_LOOP_LEN]
        nop
        push    cs
        call    addr_calc_segment
        add     sp, 6
        mov     word ptr [W_8D24], ax
        mov     word ptr [W_8D26], dx
        push    ds
        push    P_8CF2
        callf   TEXT2_SEG:timer_fdc_sync
        sub     sp, 36h
        mov     si, P_8CF2
        mov     di, sp
        push    ss
        pop     es
        mov     cx, 1bh
        rep movsw
        callf   TEXT2_SEG:sample_pool_add
        call    midi_txrx_arm_field
        pop     si
        pop     di
        ret
        else
        db      00h
        endif
L_0B5DC:
        mov     byte ptr [PAD_INPUT_MODE], 2
        call    fn_0AD3A
        retf
        db      00h
        if      FW_VERSION = 172

receive_mode_close:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     byte ptr [PAD_INPUT_MODE], 2
        call    fn_0AD3A
        pop     ds
        retf
        endif
; copies caller's 36h sample descriptor and exit far pointer to statics,
; installs handler set, then ui_sound_dialog_draw.

ui_enter_sound_dialog:
        push    bp
        mov     bp, sp
        push    di

T1_L_0B5FA:
        push    si
        push    ds
        mov     di, P_5140
        lea     si, [bp+6]
        mov     ax, ds
        mov     es, ax
        mov     ax, ss
        mov     ds, ax
        mov     cx, 1bh
        rep movsw
        pop     ds
        mov     ax, word ptr [bp+3ch]
        mov     dx, word ptr [bp+3eh]
        mov     word ptr [FP_SOUND_DLG_CALLBACK], ax
        mov     word ptr [FP_SOUND_DLG_CALLBACK_SEG], dx
        push    ds
        push    P_43C2
        nop
        push    cs
        call    win_keys_merge
        mov     al, byte ptr [G_NOTE_IN]
        mov     byte ptr [G_PAD_NOTE_BASE], al
        mov     byte ptr [G_NOTE_CAPTURE], 1
        mov     byte ptr [PAD_INPUT_MODE], 1
        mov     al, byte ptr [G_KEEP_RETRY_FOCUS]
        push    ax
        call    ui_sound_dialog_draw
        pop     si
        pop     di
        leave
        retf
        db      00h
fn_0B642:
        mov     ax, word ptr [FP_SOUND_DLG_CALLBACK_SEG]
        or      ax, word ptr [FP_SOUND_DLG_CALLBACK]
        je      L_0B64F
        callf   [FP_SOUND_DLG_CALLBACK]

L_0B64F:
        ret

tgt_0B650:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        callf   TEXT2_SEG:voice_release_all
        push    word ptr [P_5170]
        nop
        push    cs
        call    smem_free
        call    fn_0B642
        pop     ds
        retf
        db      00h

smem_data_read_handler:
        enter   4, 0
        push    di


L_0B66F:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        callf   TEXT2_SEG:voice_release_all
        push    ds
        push    P_5140
        callf   TEXT2_SEG:sample_data_load_2
        or      dx, ax
        je      br_0B69E
        mov     word ptr [G_ERRNO], ERR_NAME_IN_USE
        callf   TEXT2_SEG:err_msg_report
        push    0
        call    ui_sound_dialog_draw
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      90h

br_0B69E:
        sub     sp, 36h
        mov     si, P_5140
        mov     di, sp
        push    ss
        pop     es
        mov     cx, 1bh
        rep movsw
        callf   TEXT2_SEG:sample_pool_add
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     br_0B6CA
        mov     word ptr [G_ERRNO], ERR_SOUND_DIR_FULL
        callf   TEXT2_SEG:err_msg_report
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      90h
br_0B6CA:
        mov     si, ax
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        sub     ax, 23h
        cmp     ax, 3fh
        ja      br_0B6F2
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        imul    di, ax, PGM_PAD_STRIDE
        les     bx, [PGM_CURRENT]
        mov     ax, word ptr [bp-2]
        mov     word ptr es:[bx+di+PGM_PAD_NOTE0], si
        mov     word ptr es:[bx+di+PGM_PAD_NOTE0+PGM_PAD_SND_SEG], ax
br_0B6F2:
        mov     ax, word ptr [bp-2]
        mov     word ptr [SND_CURRENT], si
        mov     word ptr [SND_CURRENT+2], ax
        call    fn_0B642
        pop     ds
        pop     si
        pop     di
        leave
        retf
; stores AL as dialog focus; redraws: sample descriptor at (85h,13h)
; for 0, last pad note at (85h,25h) for 1.
ui_sound_dialog_draw:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp+4]
        mov     byte ptr [G_KEEP_RETRY_FOCUS], al
        sub     ah, ah
        or      ax, ax
        je      br_0B748
        dec     ax
        je      br_0B71E
        mov     byte ptr [G_KEEP_RETRY_FOCUS], 0
        jmp     br_0B748
        db      90h
br_0B71E:
        push    ds

        push    G_NOTE_IN
        push    85h
        push    25h
        push    1
        callf   TEXT2_SEG:timer_value_read_1
        callf   TEXT2_SEG:far_02DD2
        callf   TEXT2_SEG:X_02D4A
        push    1
        callf   TEXT2_SEG:int44_wrapper
        mov     byte ptr [PAD_INPUT_MODE], 1
        leave
        ret     2

br_0B748:
        push    ds
        push    P_5140
        push    85h
        push    13h
        nop
        push    cs
        call    far_call_wrapper_1
        push    0
        callf   TEXT2_SEG:int44_wrapper
        mov     byte ptr [PAD_INPUT_MODE], 0
        leave
        ret     2

keep_or_retry_up:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_KEEP_RETRY_FOCUS], 0
        je      L_0B778
        push    0
        call    ui_sound_dialog_draw

L_0B778:
        pop     ds
        retf

keep_or_retry_down:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_KEEP_RETRY_FOCUS], 0
        jne     X_0B78C
        push    1
        call    ui_sound_dialog_draw

X_0B78C:
        pop     ds
        retf

keep_or_retry_key_33:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_KEEP_RETRY_FOCUS], 0
        je      br_0B7B3
        mov     al, byte ptr [G_NOTE_IN]
        cmp     al, byte ptr [G_PAD_NOTE_BASE]
        je      br_0B7B3
        mov     byte ptr [G_PAD_NOTE_BASE], al
        mov     al, byte ptr [G_KEEP_RETRY_FOCUS]
        push    ax
        call    ui_sound_dialog_draw
        callf   TEXT2_SEG:cmd_far_stub2

br_0B7B3:
        pop     ds
        retf
        PARA_END
T1_END:
