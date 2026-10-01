; continues dsp_chan_clear.inc's sample_verify_range after includer's call;
; ax:dx = far ptr to MPC_SAMPLE, +47h = not-yet-verified flag; zero clears
; ASIC_REG 0C6h (1fffh sentinel to ASIC_DATA);
; L_01D08 = standalone entry;
; L_01D18 = +54h,+58h clears, one caller;
; 111 bytes;
; v1.72 text2 0x1CE8-0x1D5D file 0xFCA8-0xFD1D, v1.50 text2 0x1C62,
; v1.20 flash 0x558CA-0x5593F, except DSP_CHAN_ADDR (set by includer)

        add     sp, 2
        mov     es, dx
        mov     bx, ax
        cmp     byte ptr es:[bx+47h], 0
        jne     L_01D08
        mov     al, byte ptr [DSP_CHAN_ADDR]
        sub     ah, ah
        add     ax, 0c6h
        out     ASIC_REG, ax
        mov     ax, 1fffh
        out     ASIC_DATA, ax
        leave
        retf
        db      90h

L_01D08:
        mov     al, byte ptr [DSP_CHAN_ADDR]
        sub     ah, ah
        add     ax, 0c6h
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        leave
        retf

L_01D18:
        mov     al, byte ptr [DSP_CHAN_ADDR]
        sub     ah, ah
        add     ax, 54h
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        mov     al, byte ptr [DSP_CHAN_ADDR]
        add     ax, 58h
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        retf
        db      00h
