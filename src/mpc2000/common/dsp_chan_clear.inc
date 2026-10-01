; per-DSP-channel ASIC register clear: add DSP_CHAN_ADDR byte to 18
; fixed selectors: 0CAh 0CCh 0CEh 0D4h 0D0h 0D2h 54h 58h 0B2h 0B6h 0B4h
; 0B8h 0BAh 0C4h 0BCh 0BEh 0C0h 0C2h.  select via ASIC_REG, write 0
; via ASIC_DATA.  reload channel, push byte as single argument to
; per-target sample-range-check call supplied by includer right after
; this.  SYS calls near (nop/push cs/call), XL with literal far pointer.
; 199 bytes.  byte-identical SYS v1.72 (text2 linear 0x1BFE-0x1CE3,
; file 0xFBBE-0xFCA3), v1.50 (text2 0x1B78), XL v1.20 (flash
; 0x557E0-0x558C5) except channel-index byte address; includer sets
; in DSP_CHAN_ADDR first.

dsp_chan_reg_clear:
        enter   2, 0
        mov     al, byte ptr [DSP_CHAN_ADDR]
        sub     ah, ah
        mov     word ptr [bp-2], ax
        add     ax, 0cah
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0cch
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0ceh
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0d4h
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0d0h
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0d2h
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        mov     ax, word ptr [bp-2]
        add     ax, 54h
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        mov     ax, word ptr [bp-2]
        add     ax, 58h
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0b2h
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0b6h
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0b4h
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0b8h
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0bah
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0c4h
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0bch
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0beh
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0c0h
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        mov     ax, word ptr [bp-2]
        add     ax, 0c2h
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        mov     al, byte ptr [DSP_CHAN_ADDR]
sample_verify_range:
        push    ax
