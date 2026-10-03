; consts -- MPC2000XL flash: C tail, constants, 65536 bytes.
; v1.20 0x55cd6-0x65cd6: C-layer tail to 0x58000, then the UI/DSP constant
; tables (strings and tables, no code), then erased flash from 0x6112a.
; v1.14 0x556d6-0x656d6: C tail to 0x57a00, erased from 0x60b2a.
; v1.12 0x554d6-0x654d6: C tail to 0x57800, erased from 0x6092a.
; v1.11 0x552e6-0x652e6 (65536 bytes), v1.10 0x551e6-0x651e6 (65536 bytes).

ts_execute:                             ; TIME STRETCH entry ?  [bp+6] far = param block
        enter   3ch, 0
        push    di
        push    si
        mov     si, word ptr [bp+6]
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     di, ax
        mov     word ptr [bp-12h], dx
        mov     ax, word ptr es:[si+8]
        mov     dx, word ptr es:[si+0ah]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     ax, word ptr es:[si+0ch]
        mov     dx, word ptr es:[si+0eh]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        les     bx, [bp+0eh]
        mov     ax, word ptr es:[bx+2]
        mov     word ptr [bp-0ah], ax
        mov     al, byte ptr es:[bx]
        mov     byte ptr [bp-0bh], al
        mov     al, byte ptr es:[bx+4]
        mov     byte ptr [bp-0ch], al
        push    0
        push    2710h
        push    0
        push    word ptr [bp-0ah]
        mov     ax, word ptr [bp-8]
        sub     ax, word ptr [bp-4]
        sbb     dx, word ptr [bp-2]
        push    dx
        push    ax
        nop
        push    cs
        call    muldiv32
        add     sp, 0ch
        push    dx
        push    ax
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp-12h]
        push    di
        lea     ax, [bp-18h]
        push    ss
        push    ax
        callf   EP_ALLOC_DESTINATION_SAMPLE_SEG:EP_ALLOC_DESTINATION_SAMPLE_OFF
        add     sp, 10h
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        jne     br_55DAF
        mov     al, byte ptr [bp-0ch]
        push    ax
        mov     al, byte ptr [bp-0bh]
        push    ax
        lea     ax, [bp-3ch]
        push    ss
        push    ax
        nop
        push    cs
        call    ts_build_params
        add     sp, 8
        lea     ax, [bp-3ch]
        push    ss
        push    ax
        push    0
        push    word ptr [bp-0ah]
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    word ptr [bp-12h]
        push    di
        push    word ptr [bp-16h]
        push    word ptr [bp-18h]
        nop
        push    cs
        call    ts_engine_main
        add     sp, 18h
        mov     ax, word ptr [bp-18h]
        mov     dx, word ptr [bp-16h]
        mov     es, word ptr [bp+8]
        mov     word ptr es:[si+4], ax
        mov     word ptr es:[si+6], dx
br_55DAF:
        mov     ax, word ptr [bp-10h]
        mov     dx, word ptr [bp-0eh]
        pop     si
        pop     di
        leave
        retf
        db      00h
        ifdef   GROWTH_PROOF
        db      GROWTH_PROOF dup (90h)
        endif
ts_engine_main:
        enter   26h, 0
        push    di
        push    si
        sub     ax, ax
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-1ah], ax
        mov     word ptr [bp-1ch], ax
        mov     ax, word ptr [bp+0eh]
        mov     dx, word ptr [bp+10h]
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        sub     ax, ax
        mov     word ptr [bp-12h], ax
        mov     word ptr [bp-14h], ax
        mov     word ptr [bp-2], ax
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-1eh], ax
        mov     word ptr [bp-20h], ax
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-0ch], ax
        push    word ptr [bp+18h]
        push    word ptr [bp+16h]
        nop
        push    cs
        call    ts_ratio_to_step
        add     sp, 4
        mov     word ptr [bp-18h], ax
        mov     word ptr [bp-16h], dx
        cmp     word ptr [bp+18h], 0
        jne     br_55E15
        cmp     word ptr [bp+16h], 2710h
        jb      br_55E1A
br_55E15:
        mov     di, 1
        jmp     br_55E1C
br_55E1A:
        xor     di, di
br_55E1C:
        or      di, di
        je      br_55E41
        les     bx, [bp+1ah]
        mov     ax, word ptr es:[bx+0ch]
        mov     dx, word ptr es:[bx+0eh]
        mov     cx, ax
        mov     bx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, cx
        adc     dx, bx
        shr     dx, 1
        rcr     ax, 1
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
br_55E41:
        les     bx, [bp+6]
        cmp     word ptr es:[bx+30h], 0
        jge     br_55E4E
        jmp     NEAR br_56011
br_55E4E:
        jg      br_55E5A
        cmp     word ptr es:[bx+2eh], 0
        jne     br_55E5A
        jmp     NEAR br_56011
br_55E5A:
        mov     word ptr [bp-22h], di
        mov     di, word ptr [bp+0ah]
loop_55E60:
        mov     bx, 2
loop_55E63:
        mov     ax, word ptr [bp-18h]
        mov     dx, word ptr [bp-16h]
        add     word ptr [bp-0ch], ax
        adc     word ptr [bp-0ah], dx
        test    word ptr [bp-0ah], 0ff80h
        je      br_55E82
        and     word ptr [bp-0ah], 7fh
        add     word ptr [bp-8], 1
        adc     word ptr [bp-6], 0
br_55E82:
        dec     bx
        jne     loop_55E63
        cmp     word ptr [bp-22h], 0
        jne     br_55E8E
        jmp     NEAR br_55F90
br_55E8E:
        mov     si, word ptr [bp+1ah]
        mov     es, word ptr [bp+1ch]
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        sub     ax, word ptr [bp-1ch]
        sbb     dx, word ptr [bp-1ah]
        cmp     dx, word ptr es:[si+0eh]
        ja      loop_55EB4
        jb      loop_55EAE
        cmp     ax, word ptr es:[si+0ch]
        ja      loop_55EB4
loop_55EAE:
        mov     cx, 1
        jmp     br_55EB6
        db      90h
loop_55EB4:
        xor     cx, cx
br_55EB6:
        or      cx, cx
        jne     br_55EBD
        jmp     NEAR br_55FEC
br_55EBD:
        mov     ax, word ptr [bp-2]
        or      ax, word ptr [bp-4]
        je      br_55F08
        push    word ptr es:[si+6]
        push    word ptr es:[si+4]
        push    word ptr [bp-1eh]
        push    word ptr [bp-20h]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    word ptr [bp+0ch]
        push    di
        push    word ptr [bp-12h]
        push    word ptr [bp-14h]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    ts_engine_block
        add     sp, 18h
        mov     es, word ptr [bp+1ch]
        mov     ax, word ptr es:[si+4]
        mov     dx, word ptr es:[si+6]
        add     word ptr [bp-10h], ax
        adc     word ptr [bp-0eh], dx
        add     word ptr [bp-14h], ax
        adc     word ptr [bp-12h], dx
br_55F08:
        mov     ax, word ptr [bp-1ch]
        mov     dx, word ptr [bp-1ah]
        sub     ax, word ptr [bp-14h]
        sbb     dx, word ptr [bp-12h]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    dx
        push    ax
        push    word ptr [bp-0eh]
        push    word ptr [bp-10h]
        push    word ptr [bp+0ch]
        push    di
        push    word ptr [bp-12h]
        push    word ptr [bp-14h]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        mov     word ptr [bp-26h], ax
        mov     word ptr [bp-24h], dx
        callf   EP_FAR_40412_SEG:EP_FAR_40412_OFF
        add     sp, 14h
        mov     ax, word ptr [bp-26h]
        mov     dx, word ptr [bp-24h]
        add     word ptr [bp-14h], ax
        adc     word ptr [bp-12h], dx
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        add     word ptr [bp-10h], ax
        adc     word ptr [bp-0eh], dx
        mov     ax, word ptr [bp-10h]
        mov     dx, word ptr [bp-0eh]
        mov     word ptr [bp-20h], ax
        mov     word ptr [bp-1eh], dx
        cmp     word ptr [bp-22h], 0
        je      br_55FBC
        push    word ptr [bp+1ch]
        push    si
        push    dx
        push    ax
        push    word ptr [bp+0ch]
        push    di
        nop
        push    cs
        call    ts_engine_helper_a
        add     sp, 0ch
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        sub     word ptr [bp-10h], ax
        sbb     word ptr [bp-0eh], dx
        add     word ptr [bp-8], ax
        adc     word ptr [bp-6], dx
        jmp     br_55FE0
br_55F90:
        mov     si, word ptr [bp+1ah]
        mov     es, word ptr [bp+1ch]
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        sub     ax, word ptr [bp-1ch]
        sbb     dx, word ptr [bp-1ah]
        cmp     dx, word ptr es:[si+0eh]
        jae     br_55FAB
        jmp     loop_55EB4
br_55FAB:
        jbe     br_55FB0
        jmp     loop_55EAE
br_55FB0:
        cmp     ax, word ptr es:[si+0ch]
        jae     br_55FB9
        jmp     loop_55EB4
br_55FB9:
        jmp     loop_55EAE
br_55FBC:
        push    word ptr [bp+1ch]
        push    si
        push    dx
        push    ax
        push    word ptr [bp+0ch]
        push    di
        nop
        push    cs
        call    ts_engine_helper_b
        add     sp, 0ch
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        add     word ptr [bp-10h], ax
        adc     word ptr [bp-0eh], dx
        sub     word ptr [bp-8], ax
        sbb     word ptr [bp-6], dx
br_55FE0:
        mov     ax, word ptr [bp-10h]
        mov     dx, word ptr [bp-0eh]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
br_55FEC:
        add     word ptr [bp-1ch], 1
        adc     word ptr [bp-1ah], 0
        mov     ax, word ptr [bp-1ch]
        mov     dx, word ptr [bp-1ah]
        les     bx, [bp+6]
        cmp     word ptr es:[bx+30h], dx
        jle     br_56006
        jmp     loop_55E60
br_56006:
        jl      br_56011
        cmp     word ptr es:[bx+2eh], ax
        jbe     br_56011
        jmp     loop_55E60
br_56011:
        mov     ax, word ptr [bp-1ch]
        mov     dx, word ptr [bp-1ah]
        cmp     word ptr [bp-14h], ax
        jne     br_56024
        cmp     word ptr [bp-12h], dx
        jne     br_56024
        jmp     NEAR br_560AD
br_56024:
        sub     ax, word ptr [bp-14h]
        sbb     dx, word ptr [bp-12h]
        les     bx, [bp+1ah]
        cmp     dx, word ptr es:[bx+6]
        jl      br_56043
        jg      br_5603B
        cmp     ax, word ptr es:[bx+4]
        jbe     br_56043
br_5603B:
        mov     dx, word ptr es:[bx+6]
        mov     ax, word ptr es:[bx+4]
br_56043:
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        push    dx
        push    ax
        push    word ptr [bp-1eh]
        push    word ptr [bp-20h]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp-12h]
        push    word ptr [bp-14h]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    ts_engine_block
        add     sp, 18h
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        add     word ptr [bp-14h], ax
        adc     word ptr [bp-12h], dx
        mov     cx, word ptr [bp-1ch]
        mov     bx, word ptr [bp-1ah]
        sub     cx, word ptr [bp-14h]
        sbb     bx, word ptr [bp-12h]
        push    bx
        push    cx
        add     ax, word ptr [bp-10h]
        adc     dx, word ptr [bp-0eh]
        push    dx
        push    ax
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp-12h]
        push    word ptr [bp-14h]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   EP_FAR_40412_SEG:EP_FAR_40412_OFF
        add     sp, 14h
br_560AD:
        pop     si
        pop     di
        leave
        retf
        db      00h
ts_engine_block:
        enter   42h, 0
        push    di
        push    si
        mov     si, word ptr [bp+6]
        mov     word ptr [bp-6], 1000h
        push    word ptr [bp+1ch]
        push    word ptr [bp+1ah]
        push    8000h
        push    0
        if      FW_VERSION >= 112
        callf   C0_SEG:(C0_BASE+__aFuldiv-C0_SEG*16)
        elseif  FW_VERSION >= 111
        callf   C0_SEG:(C0_BASE+L_3521A-C0_SEG*16)
        elseif  FW_VERSION >= 110
        callf   C0_SEG:(C0_BASE+L_3511A-C0_SEG*16)
        else
        callf   C0_SEG:(C0_BASE+L_34C1A-C0_SEG*16)
        endif
        mov     word ptr [bp-2eh], ax
        mov     word ptr [bp-2ch], dx
        mov     es, word ptr [bp+8]
        mov     al, byte ptr es:[si+25h]
        sub     ah, ah
        inc     ax
        mov     word ptr [bp-32h], ax
        les     bx, [bp+0eh]
        mov     ax, word ptr es:[bx+0ah]
        mov     dx, word ptr es:[bx+0ch]
        mov     word ptr [bp-26h], ax
        mov     word ptr [bp-24h], dx
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[si+0ah]
        mov     dx, word ptr es:[si+0ch]
        mov     word ptr [bp-2ah], ax
        mov     word ptr [bp-28h], dx
        mov     di, bx
loop_56107:
        mov     si, 1000h
        mov     ax, word ptr [bp+1ah]
        mov     dx, word ptr [bp+1ch]
        mov     word ptr [bp-0eh], ax
        mov     word ptr [bp-0ch], dx
        mov     cx, word ptr [bp+12h]
        mov     bx, word ptr [bp+14h]
        mov     word ptr [bp-12h], cx
        mov     word ptr [bp-10h], bx
        mov     cx, word ptr [bp+16h]
        mov     bx, word ptr [bp+18h]
        mov     word ptr [bp-16h], cx
        mov     word ptr [bp-14h], bx
        mov     cx, word ptr [bp+0ah]
        mov     bx, word ptr [bp+0ch]
        mov     word ptr [bp-1ah], cx
        mov     word ptr [bp-18h], bx
        sub     cx, cx
        mov     word ptr [bp-1ch], cx
        mov     word ptr [bp-1eh], cx
        mov     word ptr [bp-22h], cx
        mov     word ptr [bp-20h], 8000h
        or      dx, dx
        jge     br_56151
        jmp     NEAR br_5632D
br_56151:
        jg      loop_5615A
        or      ax, ax
        jne     loop_5615A
        jmp     NEAR br_5632D
loop_5615A:
        mov     ax, si
        cwd
        cmp     word ptr [bp-0ch], dx
        jg      br_5616C
        jl      br_56169
        cmp     word ptr [bp-0eh], si
        jae     br_5616C
br_56169:
        mov     si, word ptr [bp-0eh]
br_5616C:
        push    1000h
        mov     ax, si
        cwd
        mov     word ptr [bp-42h], si
        mov     word ptr [bp-40h], dx
        mov     es, word ptr [bp+10h]
        mov     cx, word ptr es:[di+2eh]
        mov     bx, word ptr es:[di+30h]
        sub     cx, word ptr [bp-16h]
        sbb     bx, word ptr [bp-14h]
        cmp     bx, dx
        jl      br_56197
        jg      br_56193
        cmp     cx, si
        jbe     br_56197
br_56193:
        mov     bx, dx
        mov     cx, ax
br_56197:
        or      bx, bx
        jg      br_5619F
        jge     br_5619F
        xor     cx, cx
br_5619F:
        mov     word ptr [bp-36h], cx
        push    cx
        push    7c00h
        push    0
        mov     ax, word ptr [bp-16h]
        mov     dx, word ptr [bp-14h]
        add     ax, word ptr [bp-26h]
        adc     dx, word ptr [bp-24h]
        push    dx
        push    ax
        callf   EP_SMEM_BLOCK_COPY_SEG:EP_SMEM_BLOCK_COPY_OFF
        add     sp, 0ch
        push    1000h
        mov     es, word ptr [bp+10h]
        mov     ax, word ptr es:[di+2eh]
        mov     dx, word ptr es:[di+30h]
        sub     ax, word ptr [bp-12h]
        sbb     dx, word ptr [bp-10h]
        cmp     dx, word ptr [bp-40h]
        jl      br_561E4
        jg      br_561DE
        cmp     ax, word ptr [bp-42h]
        jbe     br_561E4
br_561DE:
        mov     dx, word ptr [bp-40h]
        mov     ax, word ptr [bp-42h]
br_561E4:
        or      dx, dx
        jg      br_561EC
        jge     br_561EC
        xor     ax, ax
br_561EC:
        mov     word ptr [bp-34h], ax
        push    ax
        push    7c00h
        push    2000h
        mov     ax, word ptr [bp-12h]
        mov     dx, word ptr [bp-10h]
        add     ax, word ptr [bp-26h]
        adc     dx, word ptr [bp-24h]
        push    dx
        push    ax
        callf   EP_SMEM_BLOCK_COPY_SEG:EP_SMEM_BLOCK_COPY_OFF
        add     sp, 0ch
        mov     word ptr [bp-6], 0
        or      si, si
        jg      br_56218
        jmp     NEAR br_562DF
br_56218:
        mov     word ptr [bp-30h], si
        xor     ax, ax
        mov     dx, 7c00h
        mov     es, dx
        mov     si, ax
        mov     di, word ptr [bp-6]
loop_56227:
        push    0
        push    8000h
        push    0
        push    word ptr [bp-20h]
        cmp     word ptr [bp-36h], di
        jg      L_55C3A
        xor     ax, ax
        jmp     SHORT br_5623D
L_55C3A:
        mov     ax, word ptr es:[si]
br_5623D:
        cwd
        push    dx
        push    ax
        callf   EP_AFLMUL_SEG:EP_AFLMUL_OFF
        push    dx
        push    ax
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     word ptr [bp-3eh], ax
        mov     word ptr [bp-3ch], dx
        push    0
        push    8000h
        push    0
        push    word ptr [bp-1ch]
        cmp     word ptr [bp-34h], di
        jg      L_55C66
        xor     ax, ax
        jmp     SHORT br_5626B
        db      90h
L_55C66:
        mov     ax, word ptr es:[si+2000h]
br_5626B:
        cwd
        push    dx
        push    ax
        callf   EP_AFLMUL_SEG:EP_AFLMUL_OFF
        push    dx
        push    ax
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        add     word ptr [bp-3eh], ax
        adc     word ptr [bp-3ch], dx
        cmp     word ptr [bp-3ch], 0
        jl      br_5629C
        jg      br_5628F
        cmp     word ptr [bp-3eh], 8063h
        jbe     br_5629C
br_5628F:
        mov     word ptr [bp-3eh], 8063h
        mov     word ptr [bp-3ch], 0
        jmp     br_562B5
        db      90h
br_5629C:
        cmp     word ptr [bp-3ch], -1
        jg      br_562B5
        jl      br_562AB
        cmp     word ptr [bp-3eh], 8001h
        jae     br_562B5
br_562AB:
        mov     word ptr [bp-3eh], 8000h
        mov     word ptr [bp-3ch], 0ffffh
br_562B5:
        mov     ax, word ptr [bp-3eh]
        mov     word ptr es:[si], ax
        add     si, 2
        mov     ax, word ptr [bp-2eh]
        mov     dx, word ptr [bp-2ch]
        add     word ptr [bp-1eh], ax
        adc     word ptr [bp-1ch], dx
        sub     word ptr [bp-22h], ax
        sbb     word ptr [bp-20h], dx
        inc     di
        cmp     word ptr [bp-30h], di
        jle     br_562D9
        jmp     loop_56227
br_562D9:
        mov     si, word ptr [bp-30h]
        mov     di, word ptr [bp+0eh]
br_562DF:
        push    si
        push    7c00h
        push    0
        mov     ax, word ptr [bp-1ah]
        mov     dx, word ptr [bp-18h]
        add     ax, word ptr [bp-2ah]
        adc     dx, word ptr [bp-28h]
        push    dx
        push    ax
        callf   EP_SMEM_WRITE_BLOCK_SEG:EP_SMEM_WRITE_BLOCK_OFF
        add     sp, 0ah
        mov     ax, word ptr [bp-42h]
        mov     dx, word ptr [bp-40h]
        add     word ptr [bp-1ah], ax
        adc     word ptr [bp-18h], dx
        add     word ptr [bp-12h], ax
        adc     word ptr [bp-10h], dx
        add     word ptr [bp-16h], ax
        adc     word ptr [bp-14h], dx
        sub     word ptr [bp-0eh], ax
        sbb     word ptr [bp-0ch], dx
        cmp     word ptr [bp-0ch], 0
        jle     br_56322
        jmp     loop_5615A
br_56322:
        jl      br_5632D
        cmp     word ptr [bp-0eh], 0
        je      br_5632D
        jmp     loop_5615A
br_5632D:
        dec     word ptr [bp-32h]
        je      br_5637A
        mov     es, word ptr [bp+10h]
        cmp     byte ptr es:[di+25h], 0
        je      br_56353
        push    0
        push    2
        push    word ptr es:[di+10h]
        push    word ptr es:[di+0eh]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        add     word ptr [bp-26h], ax
        adc     word ptr [bp-24h], dx
br_56353:
        les     bx, [bp+6]
        cmp     byte ptr es:[bx+25h], 0
        jne     br_56360
        jmp     loop_56107
br_56360:
        push    0
        push    2
        push    word ptr es:[bx+10h]
        push    word ptr es:[bx+0eh]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        add     word ptr [bp-2ah], ax
        adc     word ptr [bp-28h], dx
        jmp     loop_56107
br_5637A:
        pop     si
        pop     di
        leave
        retf
ts_engine_helper_a:
        enter   28h, 0
        push    di
        push    si
        mov     si, word ptr [bp+0eh]
        mov     es, word ptr [bp+10h]
        mov     ax, word ptr es:[si+0ch]
        add     ax, ax
        mov     dx, 7c00h
        mov     di, ax
        mov     word ptr [bp-1ah], dx
        mov     word ptr [bp-18h], 0
        mov     word ptr [bp-16h], 8000h
        mov     ax, word ptr es:[si+1ch]
        mov     dx, word ptr es:[si+1eh]
        mov     word ptr [bp-14h], ax
        mov     word ptr [bp-12h], dx
        mov     cx, word ptr es:[si+14h]
        mov     bx, word ptr es:[si+16h]
        mov     word ptr [bp-4], cx
        mov     word ptr [bp-2], bx
        mov     word ptr [bp-24h], ax
        mov     word ptr [bp-22h], dx
        mov     ax, word ptr es:[si+18h]
        mov     dx, word ptr es:[si+1ah]
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        push    word ptr [bp-22h]
        push    word ptr [bp-24h]
        push    bx
        push    cx
        mov     word ptr [bp-28h], si
        mov     word ptr [bp-26h], es
        callf   EP_AFLMUL_SEG:EP_AFLMUL_OFF
        les     bx, [bp-28h]
        add     ax, word ptr es:[bx+0ch]
        adc     dx, word ptr es:[bx+0eh]
        push    dx
        push    ax
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        sub     ax, word ptr es:[bx+0ch]
        sbb     dx, word ptr es:[bx+0eh]
        push    dx
        push    ax
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        xor     ax, ax
        mov     dx, 7c00h
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        mov     word ptr [bp-20h], ax
        push    dx
        push    ax
        nop
        push    cs
        call    ts_engine_commit
        add     sp, 10h
        mov     si, word ptr [bp-10h]
loop_56423:
        mov     ax, word ptr [bp-0ch]
        mov     dx, word ptr [bp-0ah]
        sub     word ptr [bp-0ch], 1
        sbb     word ptr [bp-0ah], 0
        or      dx, ax
        je      br_56470
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    word ptr [bp-12h]
        push    word ptr [bp-14h]
        push    word ptr [bp-0eh]
        push    si
        push    word ptr [bp-1ah]
        push    di
        nop
        push    cs
        call    ts_engine_helper_c
        add     sp, 10h
        cmp     dx, word ptr [bp-16h]
        jl      br_56466
        jg      br_5645D
        cmp     ax, word ptr [bp-18h]
        jbe     br_56466
br_5645D:
        mov     word ptr [bp-18h], ax
        mov     word ptr [bp-16h], dx
        mov     word ptr [bp-20h], si
br_56466:
        mov     ax, word ptr [bp-4]
        add     ax, ax
        add     si, ax
        jmp     loop_56423
        db      90h
br_56470:
        mov     ax, di
        sub     ax, word ptr [bp-20h]
        sar     ax, 1
        cwd
        pop     si
        pop     di
        leave
        retf
ts_engine_helper_b:
        enter   24h, 0
        push    di
        push    si
        mov     di, word ptr [bp+0eh]
        mov     es, word ptr [bp+10h]
        mov     ax, word ptr es:[di+10h]
        add     ax, ax
        mov     dx, 7c00h
        mov     si, ax
        mov     word ptr [bp-1ah], dx
        mov     word ptr [bp-18h], ax
        mov     word ptr [bp-10h], 0
        mov     word ptr [bp-0eh], 8000h
        mov     ax, word ptr es:[di+1ch]
        mov     dx, word ptr es:[di+1eh]
        mov     word ptr [bp-14h], ax
        mov     word ptr [bp-12h], dx
        mov     cx, word ptr es:[di+14h]
        mov     bx, word ptr es:[di+16h]
        mov     word ptr [bp-4], cx
        mov     word ptr [bp-2], bx
        mov     word ptr [bp-20h], ax
        mov     word ptr [bp-1eh], dx
        mov     ax, word ptr es:[di+18h]
        mov     dx, word ptr es:[di+1ah]
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        push    word ptr [bp-1eh]
        push    word ptr [bp-20h]
        push    bx
        push    cx
        mov     word ptr [bp-24h], di
        mov     word ptr [bp-22h], es
        callf   EP_AFLMUL_SEG:EP_AFLMUL_OFF
        les     bx, [bp-24h]
        add     ax, word ptr es:[bx+0ch]
        adc     dx, word ptr es:[bx+0eh]
        push    dx
        push    ax
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        xor     ax, ax
        mov     dx, 7c00h
        push    dx
        push    ax
        nop
        push    cs
        call    ts_engine_commit
        add     sp, 10h
        mov     di, word ptr [bp-18h]
loop_56511:
        mov     ax, word ptr [bp-0ch]
        mov     dx, word ptr [bp-0ah]
        sub     word ptr [bp-0ch], 1
        sbb     word ptr [bp-0ah], 0
        or      dx, ax
        je      br_5655E
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    word ptr [bp-12h]
        push    word ptr [bp-14h]
        push    word ptr [bp-1ah]
        push    si
        push    7c00h
        push    0
        nop
        push    cs
        call    ts_engine_helper_c
        add     sp, 10h
        cmp     dx, word ptr [bp-0eh]
        jl      br_56554
        jg      br_5654C
        cmp     ax, word ptr [bp-10h]
        jbe     br_56554
br_5654C:
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        mov     di, si
br_56554:
        mov     ax, word ptr [bp-4]
        add     ax, ax
        add     si, ax
        jmp     loop_56511
        db      90h
br_5655E:
        mov     ax, di
        sar     ax, 1
        cwd
        pop     si
        pop     di
        leave
        retf
        db      00h
ts_engine_commit:
        enter   2, 0
        push    di
        push    si
        cmp     word ptr [bp+14h], 0
        jle     br_56577
        jmp     NEAR br_56670
br_56577:
        jl      br_56583
        cmp     word ptr [bp+12h], 1000h
        jbe     br_56583
        jmp     NEAR br_56670
br_56583:
        mov     si, word ptr [bp+0ah]
        xor     ax, ax
        mov     cx, 2000h
        mov     bx, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     di, bx
        mov     es, dx
        rep stosw
        mov     es, word ptr [bp+0ch]
        mov     ax, word ptr es:[si+2eh]
        mov     dx, word ptr es:[si+30h]
        sub     ax, word ptr [bp+0eh]
        sbb     dx, word ptr [bp+10h]
        cmp     dx, word ptr [bp+14h]
        jl      br_565BA
        jg      br_565B4
        cmp     ax, word ptr [bp+12h]
        jbe     br_565BA
br_565B4:
        mov     dx, word ptr [bp+14h]
        mov     ax, word ptr [bp+12h]
br_565BA:
        or      dx, dx
        jg      br_565C2
        jge     br_565C2
        xor     ax, ax
br_565C2:
        mov     word ptr [bp-2], ax
        push    1000h
        push    ax
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        mov     ax, word ptr es:[si+0ah]
        mov     dx, word ptr es:[si+0ch]
        add     ax, word ptr [bp+0eh]
        adc     dx, word ptr [bp+10h]
        push    dx
        push    ax
        callf   EP_SMEM_BLOCK_COPY_SEG:EP_SMEM_BLOCK_COPY_OFF
        add     sp, 0ch
        mov     es, word ptr [bp+0ch]
        cmp     byte ptr es:[si+25h], 0
        jne     br_565F4
        jmp     NEAR br_5667E
br_565F4:
        push    1000h
        push    word ptr [bp-2]
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     ah, 20h
        push    dx
        push    ax
        push    0
        push    2
        push    word ptr es:[si+10h]
        push    word ptr es:[si+0eh]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     es, word ptr [bp+0ch]
        add     ax, word ptr es:[si+0ah]
        adc     dx, word ptr es:[si+0ch]
        add     ax, word ptr [bp+0eh]
        adc     dx, word ptr [bp+10h]
        push    dx
        push    ax
        callf   EP_SMEM_BLOCK_COPY_SEG:EP_SMEM_BLOCK_COPY_OFF
        add     sp, 0ch
        mov     ax, word ptr [bp-2]
        add     ax, ax
        add     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     si, ax
        mov     es, dx
        mov     di, word ptr [bp-2]
loop_56643:
        mov     cx, di
        sub     si, 2
        dec     di
        or      cx, cx
        je      br_5667E
        push    0
        push    2
        mov     ax, word ptr es:[si]
        cwd
        mov     cx, ax
        mov     ax, word ptr es:[si+2000h]
        mov     bx, dx
        cwd
        add     ax, cx
        adc     dx, bx
        push    dx
        push    ax
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     word ptr es:[si], ax
        jmp     loop_56643
        db      90h
br_56670:
        push    C1_SEG
        if      FW_VERSION >= 114
        push    (C1_BASE+L_46398-C1_SEG*16)
        elseif  FW_VERSION >= 112
        push    EP_L_46398_OFF
        else
        push    EP_MSG_INTERNAL_ERROR_OFF
        endif
        callf   EP_DISP_ALERT_WAIT_KEY_SEG:EP_DISP_ALERT_WAIT_KEY_OFF
        add     sp, 4
br_5667E:
        pop     si
        pop     di
        leave
        retf
ts_build_params:
        enter   1ch, 0
        push    di
        push    si
        push    0
        push    32h
        mov     al, byte ptr [bp+0ch]
        cbw
        cwd
        push    dx
        push    ax
        mov     bl, byte ptr [bp+0ah]
        sub     bh, bh
        shl     bx, 4
        if      FW_VERSION >= 110
        add     bx, 6788h
        else
        add     bx, 6782h
        endif
        mov     si, bx
        mov     word ptr [bp-2], ds
        push    0
        push    word ptr [bx+0ah]
        mov     word ptr [bp-14h], ax
        mov     word ptr [bp-12h], dx
        mov     di, bx
        callf   EP_AFLMUL_SEG:EP_AFLMUL_OFF
        push    dx
        push    ax
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        add     ax, word ptr [di+8]
        adc     dx, 0
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        push    0
        push    32h
        push    word ptr [bp-12h]
        push    word ptr [bp-14h]
        push    0
        push    word ptr [di+6]
        callf   EP_AFLMUL_SEG:EP_AFLMUL_OFF
        push    dx
        push    ax
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        add     ax, word ptr [di+4]
        adc     dx, 0
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        push    0
        push    32h
        push    word ptr [bp-12h]
        push    word ptr [bp-14h]
        push    0
        push    word ptr [di+2]
        callf   EP_AFLMUL_SEG:EP_AFLMUL_OFF
        push    dx
        push    ax
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        add     ax, word ptr [di]
        adc     dx, 0
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        or      dx, dx
        jne     br_56724
        cmp     ax, 1
        jae     br_56724
        mov     word ptr [bp-8], 1
br_56724:
        or      dx, dx
        jne     br_5672F
        cmp     word ptr [bp-8], 9c4h
        jbe     br_56739
br_5672F:
        mov     word ptr [bp-8], 9c4h
        mov     word ptr [bp-6], 0
br_56739:
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        mov     es, word ptr [bp-2]
        add     ax, word ptr es:[si+0ch]
        adc     dx, 0
        cmp     dx, word ptr [bp-0ah]
        jb      br_5675B
        ja      br_56755
        cmp     ax, word ptr [bp-0ch]
        jbe     br_5675B
br_56755:
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
br_5675B:
        cmp     word ptr [bp-0ah], 0
        jne     br_56768
        cmp     word ptr [bp-0ch], 0bb8h
        jbe     br_56772
br_56768:
        mov     word ptr [bp-0ch], 0bb8h
        mov     word ptr [bp-0ah], 0
br_56772:
        cmp     word ptr [bp-0eh], 0
        jne     br_56788
        cmp     word ptr [bp-10h], 1
        jae     br_56788
        mov     word ptr [bp-10h], 1
        mov     word ptr [bp-0eh], 0
br_56788:
        mov     ax, word ptr [bp-10h]
        mov     dx, word ptr [bp-0eh]
        cmp     word ptr [bp-6], dx
        ja      br_567A6
        jb      br_5679A
        cmp     word ptr [bp-8], ax
        jae     br_567A6
br_5679A:
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
br_567A6:
        mov     di, word ptr [bp+6]
        mov     ax, word ptr [bp-0ch]
        mov     dx, word ptr [bp-0ah]
        add     ax, 10h
        adc     dx, 0
        mov     es, word ptr [bp+8]
        mov     word ptr es:[di], ax
        mov     word ptr es:[di+2], dx
        mov     ax, word ptr [bp-10h]
        mov     dx, word ptr [bp-0eh]
        mov     word ptr es:[di+4], ax
        mov     word ptr es:[di+6], dx
        push    dx
        push    ax
        push    8000h
        push    0
        mov     word ptr [bp-1ch], di
        mov     word ptr [bp-1ah], es
        if      FW_VERSION >= 112
        callf   C0_SEG:(C0_BASE+__aFuldiv-C0_SEG*16)
        elseif  FW_VERSION >= 111
        callf   C0_SEG:(C0_BASE+L_3521A-C0_SEG*16)
        elseif  FW_VERSION >= 110
        callf   C0_SEG:(C0_BASE+L_3511A-C0_SEG*16)
        else
        callf   C0_SEG:(C0_BASE+L_34C1A-C0_SEG*16)
        endif
        les     bx, [bp-1ch]
        mov     word ptr es:[bx+8], ax
        mov     word ptr es:[bx+0ah], dx
        mov     ax, word ptr [bp-0ch]
        mov     dx, word ptr [bp-0ah]
        mov     word ptr es:[bx+0ch], ax
        mov     word ptr es:[bx+0eh], dx
        mov     cx, word ptr [bp-8]
        mov     di, word ptr [bp-6]
        mov     word ptr es:[bx+10h], cx
        mov     word ptr es:[bx+12h], di
        mov     es, word ptr [bp-2]
        mov     bx, word ptr es:[si+0ch]
        les     di, [bp-1ch]
        mov     word ptr es:[di+14h], bx
        mov     word ptr es:[di+16h], 0
        mov     es, word ptr [bp-2]
        push    0
        push    word ptr es:[si+0ch]
        sub     ax, word ptr [bp-8]
        sbb     dx, word ptr [bp-6]
        push    dx
        push    ax
        if      FW_VERSION >= 112
        callf   C0_SEG:(C0_BASE+__aFuldiv-C0_SEG*16)
        elseif  FW_VERSION >= 111
        callf   C0_SEG:(C0_BASE+L_3521A-C0_SEG*16)
        elseif  FW_VERSION >= 110
        callf   C0_SEG:(C0_BASE+L_3511A-C0_SEG*16)
        else
        callf   C0_SEG:(C0_BASE+L_34C1A-C0_SEG*16)
        endif
        les     bx, [bp-1ch]
        mov     word ptr es:[bx+18h], ax
        mov     word ptr es:[bx+1ah], dx
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+0eh]
        sub     dx, dx
        div     word ptr es:[si+0ch]
        sub     dx, dx
        les     bx, [bp-1ch]
        mov     word ptr es:[bx+1ch], ax
        mov     word ptr es:[bx+1eh], dx
        push    dx
        push    ax
        push    7fh
        push    -1
        if      FW_VERSION >= 112
        callf   C0_SEG:(C0_BASE+__aFuldiv-C0_SEG*16)
        elseif  FW_VERSION >= 111
        callf   C0_SEG:(C0_BASE+L_3521A-C0_SEG*16)
        elseif  FW_VERSION >= 110
        callf   C0_SEG:(C0_BASE+L_3511A-C0_SEG*16)
        else
        callf   C0_SEG:(C0_BASE+L_34C1A-C0_SEG*16)
        endif
        les     bx, [bp-1ch]
        mov     word ptr es:[bx+20h], ax
        mov     word ptr es:[bx+22h], dx
        pop     si
        pop     di
        leave
        retf
        db      00h
ts_ratio_to_step:                       ; stretch ratio -> per-block source step
        push    bp
        mov     bp, sp
        push    0
        push    2710h
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    0
        push    2710h
        push    0
        push    2710h
        nop
        push    cs
        call    muldiv32
        add     sp, 0ch
        push    dx
        push    ax
        push    40h
        push    0
        nop
        push    cs
        db      0e8h, 2dh, 06h
        leave
        retf
        db      00h
ts_engine_helper_c:
        enter   14h, 0
        push    di
        push    si
        sub     ax, ax
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-8], ax
        push    word ptr [bp+14h]
        push    word ptr [bp+12h]
        lea     ax, [bp+0eh]
        push    ss
        push    ax
        callf   EP_AFFALMUL_SEG:EP_AFFALMUL_OFF
        or      dx, dx
        jne     br_568CA
        or      ax, ax
        je      L_56931
br_568CA:
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     di, ax
        mov     word ptr [bp-0eh], dx
        mov     ax, word ptr [bp+12h]
        add     ax, ax
        mov     word ptr [bp-4], ax
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        mov     si, ax
        mov     word ptr [bp-12h], dx
loop_568E8:
        mov     es, word ptr [bp-12h]
        mov     ax, word ptr es:[si]
        mov     es, word ptr [bp-0eh]
        imul    word ptr es:[di]
        mov     al, ah
        mov     ah, dl
        mov     dl, dh
        add     dh, dh
        sbb     dh, dh
        sar     dx, 1
        rcr     ax, 1
        sar     dx, 1
        rcr     ax, 1
        add     word ptr [bp-0ch], ax
        adc     word ptr [bp-0ah], dx
        mov     ax, word ptr [bp-4]
        add     di, ax
        add     si, ax
        mov     ax, word ptr [bp+0eh]
        mov     dx, word ptr [bp+10h]
        mov     cx, word ptr [bp+12h]
        mov     bx, word ptr [bp+14h]
        add     word ptr [bp-8], cx
        adc     word ptr [bp-6], bx
        cmp     word ptr [bp-6], dx
        jb      loop_568E8
        ja      L_56931
        cmp     word ptr [bp-8], ax
        jb      loop_568E8
        if      FW_VERSION < 120
ts_preset_names:
        endif
L_56931:
        mov     ax, word ptr [bp-0ch]
        mov     dx, word ptr [bp-0ah]
        pop     si
        pop     di
        leave
        retf
        db      90h
str_ts_preset_fem_vox_a:
        if      FW_VERSION >= 120
ts_preset_names:                        ; fixed-width preset names, "FEM VOX" first
        endif
        db      "FEM VOX      A", 000h
        db      00h
str_ts_preset_fem_vox_b:
        db      "FEM VOX      B"
        db      00h, 00h
str_ts_preset_fem_vox_c:
        db      "FEM VOX      C"
        db      00h, 00h
str_ts_preset_male_vox_a:
        db      "MALE VOX     A"
        db      00h, 00h
str_ts_preset_male_vox_b:
        db      "MALE VOX     B"
        db      00h, 00h
str_ts_preset_male_vox_c:
        db      "MALE VOX     C"
        db      00h, 00h
str_ts_preset_low_male_vox_a:
        db      "LOW MALE VOX A"
        db      00h, 00h
str_ts_preset_low_male_vox_b:
        db      "LOW MALE VOX B"
        db      00h, 00h
str_ts_preset_low_male_vox_c:
        db      "LOW MALE VOX C"
        db      00h, 00h
str_ts_preset_vocal_a:
        db      "VOCAL        A"
        db      00h, 00h
str_ts_preset_vocal_b:
        db      "VOCAL        B"
        db      00h, 00h
str_ts_preset_vocal_c:
        db      "VOCAL        C"
        db      00h, 00h
str_ts_preset_hfreq_rhythm_a:
        db      "HFREQ RHYTHM A"
        db      00h, 00h
str_ts_preset_hfreq_rhythm_b:
        db      "HFREQ RHYTHM B"
        db      00h, 00h
str_ts_preset_hfreq_rhythm_c:
        db      "HFREQ RHYTHM C"
        db      00h, 00h
str_ts_preset_mfreq_rhythm_a:
        db      "MFREQ RHYTHM A"
        db      00h, 00h
str_ts_preset_mfreq_rhythm_b:
        db      "MFREQ RHYTHM B"
        db      00h, 00h
str_ts_preset_mfreq_rhythm_c:
        db      "MFREQ RHYTHM C"
        db      00h, 00h
str_ts_preset_lfreq_rhythm_a:
        db      "LFREQ RHYTHM A"
        db      00h, 00h
str_ts_preset_lfreq_rhythm_b:
        db      "LFREQ RHYTHM B"
        db      00h, 00h
str_ts_preset_lfreq_rhythm_c:
        db      "LFREQ RHYTHM C"
        db      00h, 00h
str_ts_preset_percussion_a:
        db      "PERCUSSION   A"
        db      00h, 00h
str_ts_preset_percussion_b:
        db      "PERCUSSION   B"
        db      00h, 00h
str_ts_preset_percussion_c:
        db      "PERCUSSION   C"
        db      00h, 00h
str_ts_preset_lfreq_perc_a:
        db      "LFREQ PERC.  A"
        db      00h, 00h
str_ts_preset_lfreq_perc_b:
        db      "LFREQ PERC.  B"
        db      00h, 00h
str_ts_preset_lfreq_perc_c:
        db      "LFREQ PERC.  C"
        db      00h, 00h
str_ts_preset_staccato_a:
        db      "STACCATO     A"
        db      00h, 00h
str_ts_preset_staccato_b:
        db      "STACCATO     B"
        db      00h, 00h
str_ts_preset_staccato_c:
        db      "STACCATO     C"
        db      00h, 00h
str_ts_preset_lfreq_slow_a:
        db      "LFREQ SLOW   A"
        db      00h, 00h
str_ts_preset_lfreq_slow_b:
        db      "LFREQ SLOW   B"
        db      00h, 00h
str_ts_preset_lfreq_slow_c:
        db      "LFREQ SLOW   C"
        db      00h, 00h
str_ts_preset_music_1_a:
        db      "MUSIC 1      A"
        db      00h, 00h
str_ts_preset_music_1_b:
        db      "MUSIC 1      B"
        db      00h, 00h
str_ts_preset_music_1_c:
        db      "MUSIC 1      C"
        db      00h, 00h
str_ts_preset_music_2_a:
        db      "MUSIC 2      A"
        db      00h, 00h
str_ts_preset_music_2_b:
        db      "MUSIC 2      B"
        db      00h, 00h
str_ts_preset_music_2_c:
        db      "MUSIC 2      C"
        db      00h, 00h
str_ts_preset_music_3_a:
        db      "MUSIC 3      A"
        db      00h, 00h
str_ts_preset_music_3_b:
        db      "MUSIC 3      B"
        db      00h, 00h
str_ts_preset_music_3_c:
        db      "MUSIC 3      C"
        db      00h, 00h
str_ts_preset_soft_perc_a:
        db      "SOFT PERC.   A"
        db      00h, 00h
str_ts_preset_soft_perc_b:
        db      "SOFT PERC.   B"
        db      00h, 00h
str_ts_preset_soft_perc_c:
        db      "SOFT PERC.   C"
        db      00h, 00h
str_ts_preset_hfreq_orch_a:
        db      "HFREQ ORCH.  A"
        db      00h, 00h
str_ts_preset_hfreq_orch_b:
        db      "HFREQ ORCH.  B"
        db      00h, 00h
str_ts_preset_hfreq_orch_c:
        db      "HFREQ ORCH.  C"
        db      00h, 00h
str_ts_preset_lfreq_orch_a:
        db      "LFREQ ORCH.  A"
        db      00h, 00h
str_ts_preset_lfreq_orch_b:
        db      "LFREQ ORCH.  B"
        db      00h, 00h
str_ts_preset_lfreq_orch_c:
        db      "LFREQ ORCH.  C"
        db      00h, 00h
str_ts_preset_slow_orch_a:
        db      "SLOW ORCH.   A"
        db      00h, 00h
str_ts_preset_slow_orch_b:
        db      " SLOW ORCH.  B"
        db      00h, 00h
far_5668C:
        db      "SLOW ORCH.   C"
        db      00h
        db      00h
far_56C9C:
        enter   8, 0
        push    di
        push    si
        mov     cx, word ptr [bp+0ch]
        mov     ax, word ptr [bp+8]
        mul     cx
        mov     si, ax
        mov     di, dx
        mov     ax, word ptr [bp+6]
        mul     cx
        mov     bx, ax
        add     si, dx
        adc     di, 0
        jo      tgt_56CE0
        mov     cx, word ptr [bp+0ah]
        mov     ax, word ptr [bp+8]
        mul     cx
        add     bx, ax
        adc     si, dx
        adc     di, 0
        jo      tgt_56CE0
        mov     ax, word ptr [bp+6]
        mul     cx
        add     bx, dx
        adc     si, 0
        adc     di, 0
        jo      tgt_56CE0
        jmp     NEAR tgt_56CE9
        nop
tgt_56CE0:
        mov     ax, 0ffffh
        mov     bx, ax
        mov     si, ax
        mov     di, ax
tgt_56CE9:
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], bx
        mov     word ptr [bp-4], si
        mov     word ptr [bp-2], di
        mov     ax, 0d758h
        push    ds
        mov     di, ax
        lea     si, [bp-8]
        push    ds
        pop     es
        push    ss
        pop     ds
        movsw
        movsw
        movsw
        movsw
        pop     ds
        mov     dx, ds
        pop     si
        pop     di
        leave
        retf
        db      00h
far_56D0E:
        enter   8, 0
        push    di
        push    si
        mov     al, byte ptr [bp+9]
        mov     bl, byte ptr [bp+0dh]
        mov     cl, al
        xor     cl, bl
        pushf
        or      al, al
        jns     br_56D31
        not     word ptr [bp+8]
        not     word ptr [bp+6]
        add     word ptr [bp+6], 1
        adc     word ptr [bp+8], 0
br_56D31:
        or      bl, bl
        jns     br_56D43
        not     word ptr [bp+0ch]
        not     word ptr [bp+0ah]
        add     word ptr [bp+0ah], 1
        adc     word ptr [bp+0ch], 0
br_56D43:
        mov     cx, word ptr [bp+0ch]
        mov     ax, word ptr [bp+8]
        mul     cx
        mov     si, ax
        mov     di, dx
        mov     ax, word ptr [bp+6]
        mul     cx
        mov     bx, ax
        add     si, dx
        adc     di, 0
        jo      br_56D80
        mov     cx, word ptr [bp+0ah]
        mov     ax, word ptr [bp+8]
        mul     cx
        add     bx, ax
        adc     si, dx
        adc     di, 0
        jo      br_56D80
        mov     ax, word ptr [bp+6]
        mul     cx
        add     bx, dx
        adc     si, 0
        adc     di, 0
        jo      br_56D80
        jmp     NEAR tgt_56D8A
br_56D80:
        mov     ax, 0ffffh
        mov     bx, ax
        mov     si, ax
        mov     di, 7fffh
tgt_56D8A:
        popf
        jns     br_56DA1
        not     ax
        not     bx
        not     si
        not     di
        add     ax, 1
        adc     bx, 0
        adc     si, 0
        adc     di, 0
br_56DA1:
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], bx
        mov     word ptr [bp-4], si
        mov     word ptr [bp-2], di
        mov     ax, 0d758h
        push    ds
        mov     di, ax
        lea     si, [bp-8]
        push    ds
        pop     es
        push    ss
        pop     ds
        movsw
        movsw
        movsw
        movsw
        pop     ds
        mov     dx, ds
        pop     si
        pop     di
        leave
        retf
        db      00h
far_56DC6:
        enter   4, 0
        push    di
        push    si
        xor     ax, ax
        mov     dx, ax
        mov     bx, word ptr [bp+8]
        mov     si, word ptr [bp+0ah]
        mov     di, word ptr [bp+0ch]
        mov     cx, 21h
        jmp     NEAR tgt_56DED
        nop
tgt_56DE0:
        shl     word ptr [bp+6], 1
        rcl     bx, 1
        rcl     si, 1
        rcl     di, 1
        shl     ax, 1
        rcl     dx, 1
tgt_56DED:
        push    si
        push    di
        sub     si, word ptr [bp+0eh]
        sbb     di, word ptr [bp+10h]
        jae     br_56DFC
        pop     di
        pop     si
        jmp     NEAR tgt_56E05
br_56DFC:
        add     sp, 4
        add     ax, 1
        adc     dx, 0
tgt_56E05:
        loop    tgt_56DE0
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        pop     si
        pop     di
        leave
        retf
        db      00h
far_56E18:
        enter   4, 0
        push    di
        push    si
        mov     bx, word ptr [bp+8]
        mov     si, word ptr [bp+0ah]
        mov     di, word ptr [bp+0ch]
        mov     ax, word ptr [bp+6]
        or      ax, bx
        jne     br_56E3C
        mov     ax, si
        or      ax, di
        jne     br_56E3C
        sub     ax, ax
        mov     dx, ax
        jmp     NEAR br_56EB8
        nop
br_56E3C:
        mov     ax, word ptr [bp+0eh]
        mov     dx, word ptr [bp+10h]
        mov     cx, di
        xor     cx, dx
        pushf
        or      dx, dx
        jns     br_56E5B
        not     ax
        not     dx
        add     ax, 1
        adc     dx, 0
        mov     word ptr [bp+0eh], ax
        mov     word ptr [bp+10h], dx
br_56E5B:
        or      di, di
        jns     br_56E79
        mov     ax, word ptr [bp+6]
        not     ax
        not     bx
        not     si
        not     di
        add     ax, 1
        adc     bx, 0
        adc     si, 0
        adc     di, 0
        mov     word ptr [bp+6], ax
br_56E79:
        xor     ax, ax
        mov     dx, ax
        mov     cx, 21h
        jmp     NEAR tgt_56E91
        nop
tgt_56E84:
        shl     word ptr [bp+6], 1
        rcl     bx, 1
        rcl     si, 1
        rcl     di, 1
        shl     ax, 1
        rcl     dx, 1
tgt_56E91:
        push    si
        push    di
        sub     si, word ptr [bp+0eh]
        sbb     di, word ptr [bp+10h]
        jae     br_56EA0
        pop     di
        pop     si
        jmp     NEAR tgt_56EA9
br_56EA0:
        add     sp, 4
        add     ax, 1
        adc     dx, 0
tgt_56EA9:
        loop    tgt_56E84
        popf
        jns     br_56EB8
        not     ax
        not     dx
        add     ax, 1
        adc     dx, 0
br_56EB8:
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        pop     si
        pop     di
        leave
        retf
muldiv32:                               ; 32-bit multiply-then-divide
        enter   8, 0
        push    di
        push    si
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    far_56C9C
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
        mov     ax, word ptr [bp+0eh]
        mov     dx, word ptr [bp+10h]
        cmp     word ptr [bp-2], dx
        jb      br_56F0C
        ja      br_56F03
        cmp     word ptr [bp-4], ax
        jb      br_56F0C
br_56F03:
        mov     ax, 0ffffh
        cwd
        pop     si
        pop     di
        leave
        retf
        db      90h
br_56F0C:
        push    dx
        push    ax
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        nop
        push    cs
        call    far_56DC6
        add     sp, 0ch
        pop     si
        pop     di
        leave
        retf
far_56F26:
        enter   8, 0
        push    di
        push    si
        mov     ax, word ptr [bp+8]
        or      ax, word ptr [bp+6]
        je      br_56F62
        mov     ax, word ptr [bp+0ch]
        or      ax, word ptr [bp+0ah]
        je      br_56F62
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    far_56D0E
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
        jmp     br_56F70
        db      90h
br_56F62:
        sub     ax, ax
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-2], ax
        mov     word ptr [bp-4], ax
br_56F70:
        mov     ax, word ptr [bp+0eh]
        mov     dx, word ptr [bp+10h]
        or      dx, dx
        jge     br_56F81
        neg     ax
        adc     dx, 0
        neg     dx
br_56F81:
        mov     cx, ax
        mov     bx, dx
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        or      dx, dx
        jge     br_56F96
        neg     ax
        adc     dx, 0
        neg     dx
br_56F96:
        cmp     dx, bx
        jl      br_56FDC
        jg      br_56FA0
        cmp     ax, cx
        jb      br_56FDC
br_56FA0:
        cmp     word ptr [bp-2], 0
        jge     br_56FB4
        cmp     word ptr [bp+10h], 0
        jg      br_56FC8
        jl      br_56FB4
        cmp     word ptr [bp+0eh], 0
        jne     br_56FC8
br_56FB4:
        cmp     word ptr [bp-2], 0
        jl      br_56FD2
        jg      br_56FC2
        cmp     word ptr [bp-4], 0
        je      br_56FD2
br_56FC2:
        cmp     word ptr [bp+10h], 0
        jge     br_56FD2
br_56FC8:
        mov     ax, 1
        mov     dx, 8000h
        pop     si
        pop     di
        leave
        retf
br_56FD2:
        mov     ax, 0ffffh
        mov     dx, 7fffh
        pop     si
        pop     di
        leave
        retf
br_56FDC:
        push    word ptr [bp+10h]
        push    word ptr [bp+0eh]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        nop
        push    cs
        call    far_56E18
        add     sp, 0ch
        pop     si
        pop     di
        leave
        retf
L_56FFA:
        les     bx, [C2_W_098A6]
        mov     al, byte ptr es:[bx+24h]
        cbw
        push    ax
        mov     al, byte ptr es:[bx+37h]
        sub     ah, ah
        push    ax
        mov     ax, word ptr [C2_W_098B2]
        mov     dx, word ptr [C2_W_098B4]
        sub     ax, word ptr [C2_W_098AE]
        sbb     dx, word ptr [C2_W_098B0]
        push    dx
        push    ax
        callf   EP_FAR_486D8_SEG:EP_FAR_486D8_OFF
        add     sp, 8
        mov     word ptr [K0_W_08E54], ax
        push    0
        push    word ptr [C2_W_02602]
        push    0
        push    2710h
        cwd
        push    dx
        push    ax
        nop
        push    cs
        call    muldiv32
        add     sp, 0ch
        mov     word ptr [K0_W_08E56], ax
        push    ds
        push    K0_W_06AE8
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF                    ; = 0x3E8B4 handler_set_install
        add     sp, 4
        cmp     word ptr [BPM_MATCH_CURSOR], 0
        jl      L_5666A
        cmp     word ptr [BPM_MATCH_CURSOR], 3
        jb      br_57060
L_5666A:
        mov     word ptr [K0_W_08E52], 0
br_57060:
        imul    bx, word ptr [K0_W_08E52], 2ah
        callf   [bx+K0_W_06B10]
        retf
L_5706A:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   EP_FAR_4CD4C_SEG:EP_FAR_4CD4C_OFF
        pop     ds
        retf
        db      00h
L_57078:
        enter   8, 0
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        xor     ax, ax
        cwd
        mov     si, ax
        mov     word ptr [bp-6], dx
        push    C1_SEG
        push    word 12h
        push    EP_L_4BD9A_SEG
        push    EP_L_4BD9A_OFF
        callf   EP_DISP_MESSAGE_WINDOW_SEG:EP_DISP_MESSAGE_WINDOW_OFF
        add     sp, 8
        mov     ax, word ptr [K0_W_08E56]
        cwd
        push    dx
        push    ax
        push    si
        push    2710h
        mov     ax, word ptr [K0_W_08E54]
        cwd
        push    dx
        push    ax
        nop
        push    cs
        call    muldiv32
        add     sp, 0ch
        or      dx, dx
        jne     br_570C0
        cmp     ax, 1388h
        jb      br_570EF
br_570C0:
        cmp     dx, si
        jne     br_570EF
        cmp     ax, 4e20h
        ja      br_570EF
        mov     word ptr [C2_W_02602], ax
        push    ds
        push    C2_W_02600
        push    ds
        push    C1_W_08FCB
        push    ds
        push    C2_W_098A6
        nop
        push    cs
        call    ts_execute
        add     sp, 0ch
        mov     si, ax
        mov     word ptr [bp-6], dx
        callf   EP_SOUND_WAVE_OVERVIEW_BUILD_SEG:EP_SOUND_WAVE_OVERVIEW_BUILD_OFF
        callf   EP_FAR_4D678_SEG:EP_FAR_4D678_OFF
br_570EF:
        callf   EP_FIELD_HANDLER_NOP_SEG:EP_FIELD_HANDLER_NOP_OFF
        mov     ax, word ptr [bp-6]
        or      ax, si
        je      br_5710C
        push    word ptr [bp-6]
        push    si
        callf   EP_DISP_ALERT_WAIT_KEY_SEG:EP_DISP_ALERT_WAIT_KEY_OFF
        add     sp, 4
        pop     ds
        pop     si
        leave
        retf
        db      90h
br_5710C:
        mov     ax, word ptr [C2_W_098AA]
        mov     dx, word ptr [C2_W_098AC]
        mov     word ptr [C0_W_0D7C2], ax
        mov     word ptr [C0_W_0D7C4], dx
        callf   EP_FAR_4D21C_SEG:EP_FAR_4D21C_OFF
        pop     ds
        pop     si
        leave
        retf
        db      00h
L_57124:
        enter   4, 0
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     ax, word ptr [K0_W_08E56]
        cwd
        push    dx
        push    ax
        push    0
        push    2710h
        mov     ax, word ptr [K0_W_08E54]
        cwd
        push    dx
        push    ax
        nop
        push    cs
        call    muldiv32
        add     sp, 0ch
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    EP_STR_BPM_MATCH_TITLE_SEG
        push    EP_STR_BPM_MATCH_TITLE_OFF
        callf   EP_DRAW_CONFIRM_WINDOW_SEG:EP_DRAW_CONFIRM_WINDOW_OFF
        add     sp, 4
        push    EP_STR_BPM_MATCH_BEAT_SEG
        push    EP_STR_BPM_MATCH_BEAT_OFF
        push    11h
        push    5bh
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        push    2
        les     bx, [C2_W_098A6]
        sub     ah, ah
        mov     al, byte ptr es:[bx+37h]
        push    0
        push    ax
        push    11h
        push    0a9h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    EP_STR_BPM_MATCH_SOURCE_TEMPO_SEG
        push    EP_STR_BPM_MATCH_SOURCE_TEMPO_OFF
        push    1bh
        push    5bh
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        cmp     word ptr [K0_W_08E54], 0
        jle     br_571C1
        cmp     word ptr [K0_W_08E54], 2710h
        jge     br_571C1
        push    1
        push    3
        mov     ax, word ptr [K0_W_08E54]
        cwd
        push    dx
        push    ax
        push    1bh
        push    0a9h
        callf   EP_DRAW_FIXED_DECIMAL_SEG:EP_DRAW_FIXED_DECIMAL_OFF
        add     sp, 0ch
br_571C1:
        push    EP_STR_BPM_MATCH_NEW_TEMPO_SEG
        push    EP_STR_BPM_MATCH_NEW_TEMPO_OFF
        push    25h
        push    5bh
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        cmp     word ptr [K0_W_08E56], 0
        jle     br_571F9
        cmp     word ptr [K0_W_08E56], 2710h
        jge     br_571F9
        push    1
        push    3
        mov     ax, word ptr [K0_W_08E56]
        cwd
        push    dx
        push    ax
        push    25h
        push    0a9h
        callf   EP_DRAW_FIXED_DECIMAL_SEG:EP_DRAW_FIXED_DECIMAL_OFF
        add     sp, 0ch
br_571F9:
        push    C1_SEG
        if      FW_VERSION >= 111
        push    EP_FAR_4CC8C_OFF
        else
        push    EP_FAR_4C32E_OFF
        endif
        push    2
        push    4
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
        cmp     word ptr [bp-2], 0
        jne     br_57218
        cmp     word ptr [bp-4], 1388h
        jb      L_57237
br_57218:
        cmp     word ptr [bp-2], 0
        jne     L_57237
        cmp     word ptr [bp-4], 4e20h
        ja      L_57237
        push    EP_FAR_47ABE_SEG
        push    EP_FAR_47ABE_OFF
        push    1
        push    5
        callf   EP_DRAW_SOFTKEY_LABEL_SEG:EP_DRAW_SOFTKEY_LABEL_OFF
        add     sp, 8
L_57237:
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        leave
        retf
        db      00h
bpm_match_field0_thunk:                 ; descriptor DS:6b02h
        mov     word ptr [K0_W_08E52], 0
        mov     ax, word ptr [C2_W_098A6]
        mov     dx, word ptr [C2_W_098A8]
        add     ax, 37h
        push    dx
        push    ax
        push    ds
        push    K0_W_06B02
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
        db      00h
L_57260:
        enter   4, 0
        mov     ax, word ptr [K0_W_08E56]
        cwd
        push    dx
        push    ax
        push    0
        push    2710h
        mov     ax, word ptr [K0_W_08E54]
        cwd
        push    dx
        push    ax
        nop
        push    cs
        call    muldiv32
        add     sp, 0ch
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        les     bx, [C2_W_098A6]
        mov     al, byte ptr es:[bx+24h]
        cbw
        push    ax
        mov     al, byte ptr es:[bx+37h]
        sub     ah, ah
        push    ax
        mov     ax, word ptr [C2_W_098B2]
        mov     dx, word ptr [C2_W_098B4]
        sub     ax, word ptr [C2_W_098AE]
        sbb     dx, word ptr [C2_W_098B0]
        push    dx
        push    ax
        callf   EP_FAR_486D8_SEG:EP_FAR_486D8_OFF
        add     sp, 8
        mov     word ptr [K0_W_08E54], ax
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    0
        push    2710h
        cwd
        push    dx
        push    ax
        nop
        push    cs
        call    muldiv32
        mov     word ptr [K0_W_08E56], ax
        leave
        retf
bpm_match_field1_thunk:                 ; descriptor DS:6b2ch
        mov     word ptr [BPM_MATCH_CURSOR], 1
        push    ds
        push    BPM_MATCH_VALUE1
        push    ds
        push    K0_W_06B2C
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF                   ; = 0x3BDBE ui_field_engine
        add     sp, 8
        retf
        db      00h
bpm_match_field2_thunk:                 ; descriptor DS:6b56h
        mov     word ptr [BPM_MATCH_CURSOR], 2
        push    ds
        push    BPM_MATCH_VALUE2
        push    ds
        push    K0_W_06B56
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF                   ; = 0x3BDBE ui_field_engine
        add     sp, 8
        retf
        db      90h
str_bpm_match_title:
        db      "B.P.M. Match"
        db      00h, 00h
str_bpm_match_beat:
        db      "        Beat:"
        db      00h
str_bpm_match_source_tempo:
        db      "Source tempo:---.-"
        db      00h, 00h
str_bpm_match_new_tempo:
        db      "   New tempo:--"
        db      2dh, 2eh, 2dh, 00h, 00h
far_5733C:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     si, word ptr [bp+6]
        xor     ax, ax
        mov     cx, 0bh
        mov     dx, word ptr [bp+8]
        mov     di, si
        mov     es, dx
        rep stosw
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        mov     word ptr es:[si+2], ax
        mov     word ptr es:[si+4], dx
        mov     al, byte ptr [bp+0eh]
        mov     byte ptr es:[si+1], al
        mov     word ptr es:[si+12h], 4c0h
        callf   EP_PGM_ALLOC_SLOT_SEG:EP_PGM_ALLOC_SLOT_OFF
        mov     es, word ptr [bp+8]
        mov     byte ptr es:[si], al
        cmp     al, 0ffh
        jne     br_57382
        xor     ax, ax
        pop     si
        pop     di
        leave
        retf
br_57382:
        mov     es, word ptr [bp+8]
        mov     al, byte ptr es:[si]
        cbw
        mov     di, ax
        imul    ax, di, 99eh
        add     ax, word ptr [C0_W_0989A]
        mov     dx, word ptr [C0_W_0989C]
        add     ax, 1eh
        mov     word ptr es:[si+0ah], ax
        mov     word ptr es:[si+0ch], dx
        and     byte ptr es:[si+0ah], 0feh
        les     bx, [bp+0ah]
        cmp     byte ptr es:[bx+25h], 0
        je      br_573CE
        mov     es, word ptr [bp+8]
        shr     word ptr es:[si+12h], 1
        mov     ax, word ptr es:[si+12h]
        add     ax, ax
        add     ax, word ptr es:[si+0ah]
        mov     dx, word ptr es:[si+0ch]
        mov     word ptr es:[si+0eh], ax
        mov     word ptr es:[si+10h], dx
br_573CE:
        mov     es, word ptr [bp+8]
        cmp     byte ptr es:[si+1], 1
        jne     br_573E0
        mov     ax, word ptr es:[si+12h]
        mov     word ptr es:[si+14h], ax
br_573E0:
        mov     ax, 1
        pop     si
        pop     di
        leave
        retf
        db      00h
far_573E8:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     si, word ptr [bp+6]
        mov     es, word ptr [bp+8]
        cmp     byte ptr es:[si+1], 2
        jne     br_57404
        push    es
        push    si
        nop
        push    cs
        call    far_5751C
        add     sp, 4
br_57404:
        mov     es, word ptr [bp+8]
        mov     al, byte ptr es:[si]
        cbw
        push    ax
        callf   EP_PGM_DELETE_SLOT_SEG:EP_PGM_DELETE_SLOT_OFF
        add     sp, 2
        xor     ax, ax
        mov     cx, 0bh
        mov     dx, word ptr [bp+8]
        mov     di, si
        mov     es, dx
        rep stosw
        pop     si
        pop     di
        leave
        retf
far_57426:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     si, word ptr [bp+6]
        mov     es, word ptr [bp+8]
        cmp     byte ptr es:[si+1], 2
        jne     br_574A2
        mov     bx, word ptr [bp+0ah]
        mov     es, word ptr [bp+0ch]
        mov     ax, word ptr es:[bx]
        mov     es, word ptr [bp+8]
        mov     di, word ptr es:[si+14h]
        add     di, di
        mov     dx, word ptr es:[si+0ah]
        mov     cx, word ptr es:[si+0ch]
        add     di, dx
        mov     es, cx
        mov     word ptr es:[di], ax
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[si+10h]
        or      ax, word ptr es:[si+0eh]
        je      br_57485
        mov     es, word ptr [bp+0ch]
        mov     ax, word ptr es:[bx+2]
        mov     es, word ptr [bp+8]
        mov     di, word ptr es:[si+14h]
        add     di, di
        mov     cx, word ptr es:[si+0eh]
        mov     dx, word ptr es:[si+10h]
        add     di, cx
        mov     es, dx
        mov     word ptr es:[di], ax
br_57485:
        mov     es, word ptr [bp+8]
        inc     word ptr es:[si+14h]
        mov     ax, word ptr es:[si+14h]
        cmp     word ptr es:[si+12h], ax
        ja      br_574A2
        push    word ptr [bp+8]
        push    si
        nop
        push    cs
        call    far_5751C
        add     sp, 4
br_574A2:
        pop     si
        pop     di
        leave
        retf
far_574A6:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     si, word ptr [bp+6]
        mov     es, word ptr [bp+8]
        cmp     byte ptr es:[si+1], 1
        jne     br_57518
        mov     ax, word ptr es:[si+14h]
        cmp     word ptr es:[si+12h], ax
        ja      br_574CC
        push    es
        push    si
        nop
        push    cs
        call    far_575DE
        add     sp, 4
br_574CC:
        mov     es, word ptr [bp+8]
        les     di, es:[si+0ah]
        mov     ax, es
        mov     es, word ptr [bp+8]
        mov     bx, word ptr es:[si+14h]
        add     bx, bx
        mov     es, ax
        mov     ax, word ptr es:[bx+di]
        les     bx, [bp+0ah]
        mov     word ptr es:[bx], ax
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[si+10h]
        or      ax, word ptr es:[si+0eh]
        je      br_57511
        les     di, es:[si+0eh]
        mov     ax, es
        mov     es, word ptr [bp+8]
        mov     bx, word ptr es:[si+14h]
        add     bx, bx
        mov     es, ax
        mov     ax, word ptr es:[bx+di]
        les     bx, [bp+0ah]
        mov     word ptr es:[bx+2], ax
br_57511:
        mov     es, word ptr [bp+8]
        inc     word ptr es:[si+14h]
br_57518:
        pop     si
        pop     di
        leave
        retf
far_5751C:
        enter   8, 0
        push    di
        push    si
        mov     si, word ptr [bp+6]
        mov     es, word ptr [bp+8]
        cmp     byte ptr es:[si+1], 2
        je      br_57532
        jmp     NEAR br_575DA
br_57532:
        push    word ptr es:[si+14h]
        push    word ptr es:[si+0ch]
        push    word ptr es:[si+0ah]
        les     bx, es:[si+2]
        mov     ax, word ptr es:[bx+0ah]
        mov     dx, word ptr es:[bx+0ch]
        mov     es, word ptr [bp+8]
        add     ax, word ptr es:[si+6]
        adc     dx, word ptr es:[si+8]
        push    dx
        push    ax
        callf   EP_SMEM_WRITE_BLOCK_SEG:EP_SMEM_WRITE_BLOCK_OFF
        add     sp, 0ah
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[si+10h]
        or      ax, word ptr es:[si+0eh]
        je      br_575C5
        les     bx, es:[si+2]
        mov     di, bx
        mov     ax, word ptr es:[bx+0ah]
        mov     dx, word ptr es:[bx+0ch]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        cmp     byte ptr es:[bx+25h], 0
        je      br_5759E
        push    0
        push    2
        push    word ptr es:[di+10h]
        push    word ptr es:[di+0eh]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        add     word ptr [bp-4], ax
        adc     word ptr [bp-2], dx
br_5759E:
        mov     es, word ptr [bp+8]
        push    word ptr es:[si+14h]
        push    word ptr es:[si+10h]
        push    word ptr es:[si+0eh]
        mov     ax, word ptr es:[si+6]
        mov     dx, word ptr es:[si+8]
        add     ax, word ptr [bp-4]
        adc     dx, word ptr [bp-2]
        push    dx
        push    ax
        callf   EP_SMEM_WRITE_BLOCK_SEG:EP_SMEM_WRITE_BLOCK_OFF
        add     sp, 0ah
br_575C5:
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[si+14h]
        sub     dx, dx
        add     word ptr es:[si+6], ax
        adc     word ptr es:[si+8], dx
        mov     word ptr es:[si+14h], dx
br_575DA:
        pop     si
        pop     di
        leave
        retf
far_575DE:
        enter   8, 0
        push    di
        push    si
        mov     si, word ptr [bp+6]
        mov     es, word ptr [bp+8]
        cmp     byte ptr es:[si+1], 1
        je      br_575F4
        jmp     NEAR br_576BD
br_575F4:
        les     bx, es:[si+2]
        mov     ax, word ptr es:[bx+0ah]
        mov     dx, word ptr es:[bx+0ch]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    1000h
        mov     es, word ptr [bp+8]
        push    word ptr es:[si+12h]
        push    word ptr es:[si+0ch]
        push    word ptr es:[si+0ah]
        mov     ax, word ptr es:[si+6]
        mov     dx, word ptr es:[si+8]
        add     ax, word ptr [bp-4]
        adc     dx, word ptr [bp-2]
        push    dx
        push    ax
        callf   EP_SMEM_BLOCK_COPY_SEG:EP_SMEM_BLOCK_COPY_OFF
        add     sp, 0ch
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[si+10h]
        or      ax, word ptr es:[si+0eh]
        je      br_576A8
        les     bx, es:[si+2]
        mov     di, bx
        mov     word ptr [bp-2], es
        mov     ax, word ptr es:[bx+0ah]
        mov     dx, word ptr es:[bx+0ch]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        cmp     byte ptr es:[bx+25h], 0
        je      br_57672
        push    0
        push    2
        push    word ptr es:[di+10h]
        push    word ptr es:[di+0eh]
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        add     word ptr [bp-8], ax
        adc     word ptr [bp-6], dx
br_57672:
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    1000h
        mov     es, word ptr [bp+8]
        push    word ptr es:[si+12h]
        push    word ptr es:[si+10h]
        push    word ptr es:[si+0eh]
        mov     ax, word ptr es:[si+6]
        mov     dx, word ptr es:[si+8]
        add     ax, word ptr [bp-4]
        adc     dx, word ptr [bp-2]
        push    dx
        push    ax
        callf   EP_SMEM_BLOCK_COPY_SEG:EP_SMEM_BLOCK_COPY_OFF
        add     sp, 0ch
br_576A8:
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[si+12h]
        sub     dx, dx
        add     word ptr es:[si+6], ax
        adc     word ptr es:[si+8], dx
        mov     word ptr es:[si+14h], dx
br_576BD:
        pop     si
        pop     di
        leave
        retf
        db      00h
far_576C2:
        retf
        db      00h
far_576C4:
        enter   0ah, 0
        push    di
        push    si
        mov     di, word ptr [bp+6]
        mov     si, word ptr [bp+0ah]
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[di+2ah]
        mov     dx, word ptr es:[di+2ch]
        sub     ax, word ptr es:[di+32h]
        sbb     dx, word ptr es:[di+34h]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    0
        push    word ptr es:[di+38h]
        mov     ax, word ptr [bp+0eh]
        sub     dx, dx
        push    dx
        push    ax
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-8], dx
        nop
        push    cs
        call    muldiv32
        add     sp, 0ch
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     es, word ptr [bp+8]
        push    0
        push    word ptr es:[di+38h]
        push    word ptr [bp-8]
        push    word ptr [bp-0ah]
        push    word ptr es:[di+2ch]
        push    word ptr es:[di+2ah]
        nop
        push    cs
        call    muldiv32
        add     sp, 0ch
        mov     es, word ptr [bp+0ch]
        mov     word ptr es:[si+2ah], ax
        mov     word ptr es:[si+2ch], dx
        mov     ax, word ptr es:[si+2eh]
        mov     dx, word ptr es:[si+30h]
        cmp     word ptr es:[si+2ch], dx
        jl      br_57763
        jg      br_57750
        cmp     word ptr es:[si+2ah], ax
        jbe     br_57763
br_57750:
        mov     es, word ptr [bp+0ch]
        mov     ax, word ptr es:[si+2eh]
        mov     dx, word ptr es:[si+30h]
        mov     word ptr es:[si+2ah], ax
        mov     word ptr es:[si+2ch], dx
br_57763:
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        mov     es, word ptr [bp+0ch]
        cmp     word ptr es:[si+2ch], dx
        jg      br_57788
        jl      br_5777A
        cmp     word ptr es:[si+2ah], ax
        jae     br_57788
br_5777A:
        mov     ax, word ptr es:[si+2ah]
        mov     dx, word ptr es:[si+2ch]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
br_57788:
        push    0
        mov     ax, word ptr es:[si+2ah]
        mov     dx, word ptr es:[si+2ch]
        sub     ax, word ptr [bp-4]
        sbb     dx, word ptr [bp-2]
        mov     word ptr es:[si+32h], ax
        mov     word ptr es:[si+34h], dx
        push    dx
        push    ax
        callf   EP_ADDR_CALC_SEGMENT_SEG:EP_ADDR_CALC_SEGMENT_OFF
        add     sp, 6
        mov     es, word ptr [bp+0ch]
        mov     word ptr es:[si+3ah], ax
        mov     word ptr es:[si+3ch], dx
        mov     ax, word ptr [bp+0eh]
        mov     word ptr es:[si+38h], ax
        mov     es, word ptr [bp+8]
        mov     al, byte ptr es:[di+24h]
        cbw
        mov     word ptr [bp-6], ax
        push    0
        push    word ptr [bp+0eh]
        callf   EP_FAR_46060_SEG:EP_FAR_46060_OFF
        add     sp, 4
        cbw
        add     ax, word ptr [bp-6]
        cmp     ax, 0ff10h
        jge     br_577E0
        mov     ax, 0ff10h
br_577E0:
        cmp     ax, 0f0h
        jle     br_577E8
        mov     ax, 0f0h
br_577E8:
        mov     es, word ptr [bp+0ch]
        mov     byte ptr es:[si+24h], al
        pop     si
        pop     di
        leave
        retf
        db      00h
L_577F4:
        enter   10h, 0
        push    si
        callf   EP_FAR_3E978_SEG:EP_FAR_3E978_OFF
        or      ax, ax
        je      br_57805
        jmp     NEAR br_578E6
br_57805:
        push    10h
        callf   EP_VOICE_BUF_HELPER_1_SEG:EP_VOICE_BUF_HELPER_1_OFF
        add     sp, 2
        mov     word ptr [bp-10h], 0
        mov     word ptr [bp-0eh], 7c00h
        les     bx, [bp+0ah]
        mov     ax, word ptr es:[bx+2eh]
        mov     dx, word ptr es:[bx+30h]
        mov     word ptr [bp-4], ax
        mov     ax, word ptr es:[bx+38h]
        mov     word ptr [bp-6], 0
        push    word ptr [bp-6]
        push    ax
        les     bx, [bp+12h]
        push    0
        push    word ptr es:[bx]
        push    dx
        push    word ptr [bp-4]
        nop
        push    cs
        call    muldiv32
        add     sp, 0ch
        push    dx
        push    ax
        push    word ptr [bp+10h]
        push    word ptr [bp+0eh]
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   EP_ALLOC_DESTINATION_SAMPLE_SEG:EP_ALLOC_DESTINATION_SAMPLE_OFF
        add     sp, 10h
        mov     si, ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        jne     br_578CC
        push    word ptr [bp+14h]
        push    word ptr [bp+12h]
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        les     bx, [bp+6]
        push    word ptr es:[bx+2]
        push    word ptr es:[bx]
        push    word ptr [bp-0eh]
        push    word ptr [bp-10h]
        nop
        push    cs
        call    far_578F8
        add     sp, 10h
        mov     si, ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        jne     br_578BA
        les     bx, [bp+12h]
        push    word ptr es:[bx]
        les     bx, [bp+6]
        push    word ptr es:[bx+2]
        push    word ptr es:[bx]
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    far_576C4
        add     sp, 0ah
        jmp     br_578CC
br_578BA:
        les     bx, [bp+6]
        push    word ptr es:[bx+2]
        push    word ptr es:[bx]
        callf   EP_SOUND_LIST_UNLINK_SEG:EP_SOUND_LIST_UNLINK_OFF
        add     sp, 4
br_578CC:
        push    word ptr [bp-0eh]
        push    word ptr [bp-10h]
        nop
        push    cs
        call    far_576C2
        add     sp, 4
        push    10h
        callf   EP_FAR_41A9E_SEG:EP_FAR_41A9E_OFF
        add     sp, 2
        jmp     br_578EF
br_578E6:
        mov     si, (C1_BASE+L_415B4-C1_SEG*16)
        mov     cx, C1_SEG
        mov     word ptr [bp-0ah], cx
br_578EF:
        mov     ax, si
        mov     dx, word ptr [bp-0ah]
        pop     si
        leave
        retf
        db      00h
far_578F8:
        enter   0dch, 0
        push    di
        push    si
        mov     si, word ptr [bp+12h]
        sub     ax, ax
        mov     word ptr [bp-28h], ax
        mov     word ptr [bp-2ah], ax
        les     bx, [bp+0eh]
        mov     ax, word ptr es:[bx+38h]
        mov     word ptr [bp-1ch], ax
        mov     word ptr [bp-1ah], 0
        mov     es, word ptr [bp+14h]
        mov     al, byte ptr es:[si+2]
        sub     ah, ah
        or      ax, ax
        je      br_57930
        dec     ax
        dec     ax
        je      br_57938
        mov     word ptr [bp-20h], 7
        jmp     br_5793D
br_57930:
        mov     word ptr [bp-20h], 3
        jmp     br_5793D
        db      90h
br_57938:
        mov     word ptr [bp-20h], 0fh
br_5793D:
        mov     word ptr [bp-1eh], 0
        mov     es, word ptr [bp+14h]
        mov     al, byte ptr es:[si+3]
        sub     ah, ah
        dec     ax
        je      br_57958
        dec     ax
        je      L_57360
        mov     word ptr [bp-26h], 0ffffh
        jmp     SHORT br_57965
br_57958:
        mov     word ptr [bp-26h], 0fff0h
        jmp     SHORT br_57965
        db      90h
L_57360:
        mov     word ptr [bp-26h], 0ff00h
br_57965:
        xor     ax, ax
        mov     cx, 2000h
        mov     bx, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     di, bx
        mov     es, dx
        rep stosw
        push    dx
        push    bx
        push    word ptr [bp-1eh]
        push    word ptr [bp-20h]
        mov     es, word ptr [bp+14h]
        push    ax
        push    word ptr es:[si]
        push    word ptr [bp-1ah]
        push    word ptr [bp-1ch]
        nop
        push    cs
        call    far_57B9E
        add     sp, 10h
        push    1
        push    word ptr [bp+10h]
        push    word ptr [bp+0eh]
        lea     ax, [bp-46h]
        push    ss
        push    ax
        nop
        push    cs
        call    far_5733C
        add     sp, 0ah
        or      ax, ax
        jne     br_579AF
        jmp     NEAR br_57B8C
br_579AF:
        push    2
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        lea     ax, [bp-5ch]
        push    ss
        push    ax
        nop
        push    cs
        call    far_5733C
        add     sp, 0ah
        or      ax, ax
        jne     br_579CB
        jmp     NEAR br_57B74
br_579CB:
        les     bx, [bp+0ah]
        mov     ax, word ptr es:[bx+2eh]
        mov     dx, word ptr es:[bx+30h]
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        les     bx, [bp+0eh]
        cmp     byte ptr es:[bx+25h], 1
        sbb     al, al
        and     al, 0ffh
        add     al, 2
        mov     byte ptr [bp-3], al
        sub     ax, ax
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-8], ax
        mov     ax, word ptr [bp-20h]
        mov     dx, word ptr [bp-1eh]
        add     ax, ax
        adc     dx, dx
        add     ax, 1
        adc     dx, 0
        mov     word ptr [bp-14h], ax
        mov     word ptr [bp-12h], dx
        xor     ax, ax
        mov     cx, 40h
        lea     di, [bp-0dch]
        push    ss
        pop     es
        rep stosw
        mov     es, word ptr [bp+14h]
        push    ax
        push    word ptr es:[si]
        push    100h
        push    ax
        push    word ptr [bp-1ah]
        push    word ptr [bp-1ch]
        nop
        push    cs
        call    muldiv32
        add     sp, 0ch
        mov     word ptr [bp-18h], ax
        mov     word ptr [bp-16h], dx
        sub     ax, ax
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-22h], ax
        mov     word ptr [bp-24h], ax
        cmp     word ptr [bp-0eh], ax
        jne     br_57A52
        cmp     word ptr [bp-10h], ax
        jne     br_57A52
        jmp     NEAR br_57B62
br_57A52:
        mov     ax, word ptr [bp-10h]
        mov     dx, word ptr [bp-0eh]
        mov     word ptr [bp-1ch], ax
        mov     word ptr [bp-1ah], dx
        mov     word ptr [bp-2ch], ax
        mov     word ptr [bp-20h], dx
        neg     word ptr [bp-2ch]
        neg     word ptr [bp-2ch]
        adc     word ptr [bp-20h], -1
loop_57A6E:
        xor     bx, bx
        mov     ax, word ptr [bp-18h]
        mov     dx, word ptr [bp-16h]
        add     word ptr [bp-8], ax
        adc     word ptr [bp-6], dx
        test    word ptr [bp-6], 0ff00h
        je      br_57A8F
        mov     al, byte ptr [bp-5]
        sub     ah, ah
        sub     dx, dx
        mov     bx, ax
        and     byte ptr [bp-5], dl
br_57A8F:
        or      bx, bx
        je      br_57AEB
        mov     word ptr [bp-2], bx
loop_57A96:
        lea     ax, [bp-30h]
        push    ss
        push    ax
        lea     ax, [bp-46h]
        push    ss
        push    ax
        nop
        push    cs
        call    far_574A6
        add     sp, 8
        xor     di, di
        cmp     byte ptr [bp-3], 0
        je      br_57AD6
        lea     si, [bp-30h]
loop_57AB3:
        mov     ax, word ptr ss:[si]
        mov     bx, di
        shl     bx, 5
        add     bx, word ptr [bp-0ch]
        add     bx, bx
        lea     cx, [bp-0dch]
        add     bx, cx
        add     si, 2
        mov     word ptr ss:[bx], ax
        mov     al, byte ptr [bp-3]
        sub     ah, ah
        inc     di
        cmp     ax, di
        jg      loop_57AB3
br_57AD6:
        mov     al, byte ptr [bp-0ch]
        dec     al
        and     ax, 1fh
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], 0
        dec     word ptr [bp-2]
        jne     loop_57A96
br_57AEB:
        mov     word ptr [bp-1eh], 0
L_56B20:
        cmp     byte ptr [bp-3], 0
        je      br_57B40
        lea     si, [bp-0dch]
        lea     di, [bp-30h]
        mov     al, byte ptr [bp-3]
        sub     ah, ah
        mov     word ptr [bp-2], ax
loop_57B05:
        mov     ax, word ptr [bp-14h]
        mov     dx, word ptr [bp-12h]
        sub     ax, 2
        sbb     dx, 0
        push    dx
        push    ax
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        push    ss
        push    si
        nop
        push    cs
        call    far_57DFA
        add     sp, 14h
        and     ax, word ptr [bp-26h]
        mov     word ptr ss:[di], ax
        add     si, 40h
        add     di, 2
        dec     word ptr [bp-2]
        jne     loop_57B05
br_57B40:
        lea     ax, [bp-30h]
        push    ss
        push    ax
        lea     ax, [bp-5ch]
        push    ss
        push    ax
        nop
        push    cs
        call    far_57426
        add     sp, 8
        dec     word ptr [bp-2ch]
        je      br_57B5A
        jmp     loop_57A6E
br_57B5A:
        dec     word ptr [bp-20h]
        js      br_57B62
        jmp     loop_57A6E
br_57B62:
        lea     ax, [bp-5ch]
        push    ss
        push    ax
        nop
        push    cs
        call    far_573E8
        add     sp, 4
        mov     si, word ptr [bp-2ah]
        jmp     br_57B7D
br_57B74:
        mov     si, (CONSTS_BASE+L_57F14-C2_SEG*16)
        mov     cx, C2_SEG
        mov     word ptr [bp-28h], cx
br_57B7D:
        lea     ax, [bp-46h]
        push    ss
        push    ax
        nop
        push    cs
        call    far_573E8
        add     sp, 4
        jmp     br_57B95
br_57B8C:
        mov     si, (CONSTS_BASE+L_57F14-C2_SEG*16)
        mov     cx, C2_SEG
        mov     word ptr [bp-28h], cx
br_57B95:
        mov     ax, si
        mov     dx, word ptr [bp-28h]
        pop     si
        pop     di
        leave
        retf
far_57B9E:
        enter   44h, 0
        push    di
        push    si
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        cmp     dx, word ptr [bp+8]
        jb      br_57BBC
        ja      L_571C6
        cmp     ax, word ptr [bp+6]
        jbe     br_57BBC
L_571C6:
        mov     dx, word ptr [bp+8]
        mov     ax, word ptr [bp+6]
br_57BBC:
        mov     word ptr [bp-24h], ax
        mov     word ptr [bp-22h], dx
        mov     ax, word ptr [bp+0eh]
        mov     dx, word ptr [bp+10h]
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        mov     word ptr [bp-14h], ax
        mov     word ptr [bp-12h], dx
        mov     cx, word ptr [bp+6]
        mov     bx, word ptr [bp+8]
        add     cx, cx
        adc     bx, bx
        add     cx, cx
        adc     bx, bx
        add     cx, cx
        adc     bx, bx
        add     cx, cx
        adc     bx, bx
        add     cx, cx
        adc     bx, bx
        add     cx, cx
        adc     bx, bx
        add     cx, cx
        adc     bx, bx
        mov     word ptr [bp-30h], cx
        mov     word ptr [bp-2eh], bx
        sub     cx, cx
        mov     word ptr [bp-16h], cx
        mov     word ptr [bp-18h], cx
        shl     ax, 2
        add     ax, word ptr [bp+12h]
        mov     dx, word ptr [bp+14h]
        mov     di, ax
        mov     word ptr [bp-36h], dx
        mov     si, ax
        mov     word ptr [bp-3ah], dx
        sub     ax, ax
        mov     word ptr [bp-1ah], ax
        mov     word ptr [bp-1ch], ax
        mov     ax, word ptr [bp-24h]
        mov     dx, word ptr [bp-22h]
        mov     word ptr [bp-34h], ax
        mov     word ptr [bp-32h], dx
loop_57C41:
        push    word ptr [bp-2eh]
        push    word ptr [bp-30h]
        push    100h
        push    0
        push    word ptr [bp-1ah]
        push    word ptr [bp-1ch]
        nop
        push    cs
        call    muldiv32
        add     sp, 0ch
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        shr     dx, 1
        mov     bx, dx
        sub     bh, bh
        shl     bx, 2
        mov     ax, word ptr [bx+K0_W_06B80]
        mov     dx, word ptr [bx+K0_W_06B82]
        mov     word ptr [bp-28h], ax
        mov     word ptr [bp-26h], dx
        mov     word ptr [bp-40h], ax
        mov     word ptr [bp-3eh], dx
        mov     ax, word ptr [bx+K0_W_06B84]
        mov     dx, word ptr [bx+K0_W_06B86]
        sub     ax, word ptr [bp-40h]
        sbb     dx, word ptr [bp-3eh]
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        push    2
        push    0
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        and     dx, 1
        push    dx
        push    ax
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        nop
        push    cs
        call    far_56F26
        add     sp, 0ch
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    word ptr [bp-22h]
        push    word ptr [bp-24h]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    51h
        push    7cc2h
        add     ax, word ptr [bp-28h]
        adc     dx, word ptr [bp-26h]
        push    dx
        push    ax
        nop
        push    cs
        call    far_56F26
        add     sp, 0ch
        push    dx
        push    ax
        nop
        push    cs
        call    far_56F26
        add     sp, 0ch
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        push    word ptr [bp-12h]
        push    word ptr [bp-14h]
        push    100h
        push    0
        mov     ax, word ptr [bp-18h]
        mov     dx, word ptr [bp-16h]
        add     ax, word ptr [bp-14h]
        adc     dx, word ptr [bp-12h]
        push    dx
        push    ax
        nop
        push    cs
        call    muldiv32
        add     sp, 0ch
        add     ax, 0
        adc     dx, 80h
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        shr     dx, 1
        mov     bx, dx
        sub     bh, bh
        shl     bx, 2
        mov     ax, word ptr [bx+K0_W_06B80]
        mov     dx, word ptr [bx+K0_W_06B82]
        mov     word ptr [bp-2ch], ax
        mov     word ptr [bp-2ah], dx
        mov     word ptr [bp-44h], ax
        mov     word ptr [bp-42h], dx
        mov     ax, word ptr [bx+K0_W_06B84]
        mov     dx, word ptr [bx+K0_W_06B86]
        sub     ax, word ptr [bp-44h]
        sbb     dx, word ptr [bp-42h]
        mov     word ptr [bp-20h], ax
        mov     word ptr [bp-1eh], dx
        push    7fffh
        push    -1
        push    7fffh
        push    -1
        push    2
        push    0
        mov     ax, word ptr [bp-10h]
        mov     dx, word ptr [bp-0eh]
        and     dx, 1
        push    dx
        push    ax
        push    word ptr [bp-1eh]
        push    word ptr [bp-20h]
        nop
        push    cs
        call    far_56F26
        add     sp, 0ch
        mov     word ptr [bp-20h], ax
        mov     word ptr [bp-1eh], dx
        add     ax, word ptr [bp-2ch]
        adc     dx, word ptr [bp-2ah]
        push    dx
        push    ax
        push    3ae1h
        push    47aeh
        nop
        push    cs
        call    far_56F26
        add     sp, 0ch
        mov     cx, 0b851h
        mov     bx, 451eh
        sub     cx, ax
        sbb     bx, dx
        push    bx
        push    cx
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        nop
        push    cs
        call    far_56F26
        add     sp, 0ch
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     es, word ptr [bp-3ah]
        mov     word ptr es:[si], ax
        mov     word ptr es:[si+2], dx
        mov     es, word ptr [bp-36h]
        mov     bx, di
        sub     di, 4
        mov     word ptr es:[bx], ax
        mov     word ptr es:[bx+2], dx
        add     si, 4
        mov     ax, word ptr [bp-34h]
        mov     dx, word ptr [bp-32h]
        add     word ptr [bp-1ch], ax
        adc     word ptr [bp-1ah], dx
        mov     ax, word ptr [bp-14h]
        mov     dx, word ptr [bp-12h]
        add     word ptr [bp-18h], 1
        adc     word ptr [bp-16h], 0
        cmp     word ptr [bp-16h], dx
        jae     br_57DEB
        jmp     loop_57C41
br_57DEB:
        ja      br_57DF5
        cmp     word ptr [bp-18h], ax
        ja      br_57DF5
        jmp     loop_57C41
br_57DF5:
        pop     si
        pop     di
        leave
        retf
        db      00h
far_57DFA:
        enter   22h, 0
        push    di
        push    si
        sub     ax, ax
        mov     word ptr [bp-20h], ax
        mov     word ptr [bp-22h], ax
        mov     ax, word ptr [bp+14h]
        and     ax, 0feh
        shr     ax, 1
        add     ax, 80h
        mov     word ptr [bp-0ch], ax
        mov     ax, word ptr [bp+12h]
        mov     dx, word ptr [bp+14h]
        and     dx, 1
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        sub     ax, ax
        cmp     word ptr [bp+18h], ax
        jne     br_57E34
        cmp     word ptr [bp+16h], ax
        jne     br_57E34
        jmp     NEAR br_57ED4
br_57E34:
        mov     ax, word ptr [bp-0ch]
        shl     ax, 2
        add     ax, word ptr [bp+0eh]
        mov     dx, word ptr [bp+10h]
        mov     si, ax
        mov     word ptr [bp-1ch], dx
        mov     ax, word ptr [bp+16h]
        mov     dx, word ptr [bp+18h]
        mov     di, ax
        mov     word ptr [bp-12h], dx
        neg     di
        neg     di
        adc     word ptr [bp-12h], -1
loop_57E58:
        mov     es, word ptr [bp-1ch]
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    2
        push    0
        push    word ptr [bp-0eh]
        push    word ptr [bp-10h]
        mov     cx, word ptr es:[si+4]
        mov     bx, word ptr es:[si+6]
        sub     cx, ax
        sbb     bx, dx
        push    bx
        push    cx
        nop
        push    cs
        call    far_56F26
        add     sp, 0ch
        add     word ptr [bp-4], ax
        adc     word ptr [bp-2], dx
        push    7fffh
        push    -1
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        mov     bx, word ptr [bp+0ah]
        add     bx, bx
        add     bx, word ptr [bp+6]
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[bx]
        cwd
        push    dx
        push    ax
        nop
        push    cs
        call    far_56F26
        add     sp, 0ch
        add     word ptr [bp-22h], ax
        adc     word ptr [bp-20h], dx
        mov     al, byte ptr [bp+0ah]
        inc     al
        and     ax, 1fh
        mov     word ptr [bp+0ah], ax
        mov     word ptr [bp+0ch], 0
        add     si, 200h
        dec     di
        jne     loop_57E58
        dec     word ptr [bp-12h]
        jns     loop_57E58
br_57ED4:
        cmp     word ptr [bp-20h], -1
        jg      br_57EF0
        jl      br_57EE3
        cmp     word ptr [bp-22h], 8000h
        jae     br_57EF0
br_57EE3:
        mov     word ptr [bp-22h], 8000h
        mov     word ptr [bp-20h], 0ffffh
        jmp     br_57F09
        db      90h
br_57EF0:
        cmp     word ptr [bp-20h], 0
        jl      br_57F09
        jg      br_57EFF
        cmp     word ptr [bp-22h], 7fffh
        jbe     br_57F09
br_57EFF:
        mov     word ptr [bp-22h], 7fffh
        mov     word ptr [bp-20h], 0
br_57F09:
        mov     ax, word ptr [bp-22h]
        mov     dx, word ptr [bp-20h]
        pop     si
        pop     di
        leave
        retf
        db      90h
L_57F14:
        db      "Not enough program memory!"
        db      00h, 00h
wave_region_highlight:
        enter   4, 0
        push    di
        push    si
        les     bx, [C0_W_0D7C2]
        mov     ax, word ptr es:[bx+SND_LENGTH]
        mov     dx, word ptr es:[bx+SND_LENGTH+2]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     ax, es
        or      ax, bx
        jne     br_57F51
        jmp     NEAR br_57FDE
br_57F51:
        mov     ax, dx
        or      ax, word ptr [bp-4]
        jne     br_57F5B
        jmp     NEAR br_57FDE
br_57F5B:
        or      dx, dx
        jg      br_57F70
        jl      br_57F68
        cmp     word ptr [bp-4], 0f5h
        ja      br_57F70
br_57F68:
        mov     di, word ptr [bp+6]
        mov     si, word ptr [bp+0ah]
        jmp     br_57FAC
br_57F70:
        push    dx
        push    word ptr [bp-4]
        push    0
        push    0f5h
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   EP_AFLMUL_SEG:EP_AFLMUL_OFF
        push    dx
        push    ax
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     di, ax
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    0
        push    0f5h
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        callf   EP_AFLMUL_SEG:EP_AFLMUL_OFF
        push    dx
        push    ax
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     si, ax
br_57FAC:
        mov     cx, si
        sub     cx, di
        je      L_579B6
        mov     si, cx
        jmp     SHORT br_57FB9
L_579B6:
        mov     si, 1
br_57FB9:
        push    3
        callf   EP_DISP_SELECT_PLANE_SEG:EP_DISP_SELECT_PLANE_OFF
        add     sp, 2
        push    1bh
        push    si
        push    15h
        lea     ax, [di+1]
        push    ax
        callf   EP_DRAW_FILL_RECT_SEG:EP_DRAW_FILL_RECT_OFF
        add     sp, 8
        push    1
        callf   EP_DISP_SELECT_PLANE_SEG:EP_DISP_SELECT_PLANE_OFF
        add     sp, 2
br_57FDE:
        pop     si
        pop     di
        leave
        retf
wave_overview_draw:
        enter   4, 0
        push    di
        push    si
        xor     di, di
        mov     si, 8
        mov     dx, 7c00h
        mov     word ptr [bp-2], dx
loop_57FF3:
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+1eah]
        add     ax, word ptr es:[si]
        push    ax
        mov     ax, 22h
        sub     ax, word ptr es:[si]
        push    ax
        lea     ax, [di+1]
        push    ax
        callf   EP_DRAW_VLINE_SEG:EP_DRAW_VLINE_OFF
        add     sp, 6
        add     si, 2
        lea     ax, [di+1]
        mov     di, ax
        cmp     di, 0f5h
        jl      loop_57FF3
        pop     si
        pop     di
        leave
        retf
wave_overview_build_step:
        push    si
        mov     bx, 7c00h
        mov     es, bx
        cmp     word ptr es:[3dch], 0f5h
        jl      br_58036
        jmp     NEAR L_57CAF
br_58036:
        cmp     word ptr es:[3dch], 0
        je      br_58041
        jmp     NEAR br_5811C
br_58041:
        sub     ax, ax
        mov     word ptr [K0_W_08E5C], ax
        mov     word ptr [K0_W_08E5A], ax
        mov     word ptr [K0_W_08E5E], ax
        mov     word ptr [K0_W_08E60], ax
        push    ax
        push    0f5h
        db      26h, 8bh, 06h, 04h, 00h
        mov     dx, word ptr es:[6]
        mov     dh, dl
        mov     dl, ah
        mov     ah, al
        sub     al, al
        push    dx
        push    ax
        callf   EP_AFLDIV_SEG:EP_AFLDIV_OFF
        mov     word ptr [K0_W_08E62], ax
        mov     word ptr [K0_W_08E64], dx
        sub     ax, ax
        mov     word ptr [K0_W_08E68], ax
        mov     word ptr [K0_W_08E66], ax
        push    1000h
        push    1000h
        push    7c00h
        push    3deh
        mov     bx, 7c00h
        mov     es, bx
        push    word ptr es:[2]
        push    word ptr es:[0]
        callf   EP_SMEM_BLOCK_COPY_SEG:EP_SMEM_BLOCK_COPY_OFF
        add     sp, 0ch
        mov     bx, 7c00h
        mov     es, bx
        xor     bx, bx
        add     byte ptr es:[1], 10h
        adc     word ptr es:[2], bx
        mov     word ptr [K0_W_08E58], bx
loop_580B4:
        mov     bx, 7c00h
        mov     es, bx
        db      26h, 8bh, 06h, 04h, 00h
        mov     dx, word ptr es:[6]
        cmp     word ptr [K0_W_08E5C], dx
        jle     br_580CC
        jmp     NEAR br_5821E
br_580CC:
        jl      br_580D7
        cmp     word ptr [K0_W_08E5A], ax
        jb      br_580D7
        jmp     NEAR br_5821E
br_580D7:
        cmp     word ptr [K0_W_08E58], 1000h
        jl      br_5811C
        push    1000h
        push    1000h
        push    es
        push    3deh
        push    word ptr es:[2]
        push    word ptr es:[0]
        callf   EP_SMEM_BLOCK_COPY_SEG:EP_SMEM_BLOCK_COPY_OFF
        add     sp, 0ch
        mov     bx, 7c00h
        mov     es, bx
        xor     bx, bx
        add     byte ptr es:[1], 10h
        adc     word ptr es:[2], bx
        mov     word ptr [K0_W_08E58], bx
        cmp     word ptr es:[3dch], 0
        je      br_5811C
        jmp     NEAR L_57CAF
br_5811C:
        mov     bx, word ptr [K0_W_08E58]
        add     bx, bx
        mov     ax, 3deh
        mov     dx, 7c00h
        add     bx, ax
        mov     es, dx
        mov     bx, word ptr es:[bx]
        inc     word ptr [K0_W_08E58]
        add     byte ptr [K0_B_08E67], 1
        adc     word ptr [K0_W_08E68], 0
        add     word ptr [K0_W_08E5A], 1
        adc     word ptr [K0_W_08E5C], 0
        cmp     word ptr [K0_W_08E60], bx
        jle     br_58154
        mov     word ptr [K0_W_08E60], bx
        jmp     br_5815E
        db      90h
br_58154:
        cmp     word ptr [K0_W_08E5E], bx
        jge     br_5815E
        mov     word ptr [K0_W_08E5E], bx
br_5815E:
        mov     ax, word ptr [K0_W_08E62]
        mov     dx, word ptr [K0_W_08E64]
        cmp     word ptr [K0_W_08E68], dx
        jge     br_5816E
        jmp     loop_580B4
br_5816E:
        jg      br_58179
        cmp     word ptr [K0_W_08E66], ax
        jae     br_58179
        jmp     loop_580B4
br_58179:
        mov     ax, word ptr [K0_W_08E5E]
        mov     cx, 97bh
        cwd
        idiv    cx
        cmp     dx, 4bdh
        jle     br_5818E
        mov     ax, 1
        jmp     br_58190
        db      90h
br_5818E:
        xor     ax, ax
br_58190:
        mov     cx, ax
        mov     ax, word ptr [K0_W_08E5E]
        mov     dx, 97bh
        mov     bx, dx
        cwd
        idiv    bx
        add     cx, ax
        mov     word ptr [K0_W_08E5E], cx
        mov     ax, word ptr [K0_W_08E60]
        neg     ax
        mov     word ptr [K0_W_08E60], ax
        or      ax, ax
        jge     br_581B5
        mov     word ptr [K0_W_08E60], 7fffh
br_581B5:
        mov     ax, word ptr [K0_W_08E60]
        mov     cx, bx
        cwd
        idiv    cx
        cmp     dx, 4bdh
        jle     br_581C8
        mov     ax, 1
        jmp     br_581CA
br_581C8:
        xor     ax, ax
br_581CA:
        mov     cx, ax
        mov     ax, word ptr [K0_W_08E60]
        cwd
        idiv    bx
        add     cx, ax
        mov     word ptr [K0_W_08E60], cx
        mov     bx, 7c00h
        mov     es, bx
        mov     bx, word ptr es:[3dch]
        add     bx, bx
        mov     si, 1f2h
        mov     word ptr es:[bx+si], cx
        mov     ax, word ptr [K0_W_08E5E]
        mov     bx, word ptr es:[3dch]
        add     bx, bx
        mov     si, 8
        mov     word ptr es:[bx+si], ax
        inc     word ptr es:[3dch]
        mov     ax, word ptr [K0_W_08E62]
        mov     dx, word ptr [K0_W_08E64]
        sub     word ptr [K0_W_08E66], ax
        sbb     word ptr [K0_W_08E68], dx
        xor     ax, ax
        mov     word ptr [K0_W_08E5E], ax
        mov     word ptr [K0_W_08E60], ax
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
        jmp     NEAR loop_580B4
br_5821E:
        cmp     word ptr es:[3dch], 0f5h
        jl      br_5822A
        jmp     NEAR L_57CAA
br_5822A:
        mov     ax, word ptr [K0_W_08E5E]
        mov     cx, 97bh
        cwd
        idiv    cx
        cmp     dx, 4bdh
        jle     br_5823E
        mov     ax, 1
        jmp     br_58240
br_5823E:
        xor     ax, ax
br_58240:
        mov     cx, ax
        mov     ax, word ptr [K0_W_08E5E]
        mov     dx, 97bh
        mov     bx, dx
        cwd
        idiv    bx
        add     cx, ax
        mov     word ptr [K0_W_08E5E], cx
        mov     ax, word ptr [K0_W_08E60]
        neg     ax
        mov     word ptr [K0_W_08E60], ax
        or      ax, ax
        jge     br_58265
        mov     word ptr [K0_W_08E60], 7fffh
br_58265:
        mov     ax, word ptr [K0_W_08E60]
        mov     cx, bx
        cwd
        idiv    cx
        cmp     dx, 4bdh
        jle     L_57C78
        mov     ax, 1
        jmp     SHORT br_5827A
L_57C78:
        xor     ax, ax
br_5827A:
        mov     cx, ax
        mov     ax, word ptr [K0_W_08E60]
        cwd
        idiv    bx
        add     cx, ax
        mov     word ptr [K0_W_08E60], cx
        mov     bx, word ptr es:[3dch]
        add     bx, bx
        mov     si, 1f2h
        mov     word ptr es:[bx+si], cx
        mov     ax, word ptr [K0_W_08E5E]
        mov     bx, word ptr es:[3dch]
        add     bx, bx
        mov     si, 8
        mov     word ptr es:[bx+si], ax
        inc     word ptr es:[3dch]
L_57CAA:
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
L_57CAF:
        pop     si
DS_ORIGIN:
        retf
        db      90h, 0d0h, 07h, 00h, 00h, 63h, 01h, 14h, 08h, 1dh, 0fch, 32h, 33h, 02h, 32h, 3ch
        db      08h, 05h, 0ah, 14h, 14h, 32h, 00h, 00h, 02h, 0fh, 19h, 00h, 05h, 41h, 14h, 1eh
        db      01h, 05h, 00h, 00h, 05h, 63h, 00h, 0f4h, 0ffh, 0ch, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 02h, 00h, 4fh, 01h, 4fh, 01h, 00h, 42h, 4fh, 01h, 00h, 42h, 4fh, 01h, 00h
        db      42h, 32h, 00h, 63h, 28h, 00h, 3ch, 00h, 00h, 00h, 00h, 32h, 00h, 23h, 00h, 3eh ; B2.c(.<....2.#.>
        db      33h, 5ah, 32h, 14h, 00h, 00h, 04h, 06h, 04h, 0ch, 04h, 12h, 04h, 18h, 04h
d_c1_tbl_00060:
        db      1eh
        db      04h, 24h, 04h, 2ah, 04h, 30h, 04h, 37h, 04h, 3dh, 04h, 43h, 04h, 49h, 04h, 50h ; .$.*.0.7.=.C.I.P
        db      04h, 56h, 04h, 5dh, 04h, 63h, 04h, 6ah, 04h, 70h, 04h, 77h, 04h, 7dh, 04h, 84h
        db      04h, 8bh, 04h, 91h, 04h, 98h, 04h, 9fh, 04h, 0a6h, 04h, 0adh, 04h, 0b4h, 04h, 0bbh
        db      04h, 0c2h, 04h, 0c9h, 04h, 0d0h, 04h, 0d7h, 04h, 0deh, 04h, 0e5h, 04h, 0edh, 04h, 0f4h
        db      04h, 0fbh, 04h, 03h, 05h, 0ah, 05h, 12h, 05h, 19h, 05h, 21h, 05h, 28h, 05h, 30h
        db      05h, 38h, 05h, 3fh, 05h, 47h, 05h, 4fh, 05h, 57h, 05h, 5fh, 05h, 67h, 05h, 6fh ; .8.?.G.O.W._.g.o
        db      05h, 77h, 05h, 7fh, 05h, 87h, 05h, 8fh, 05h, 98h, 05h, 0a0h, 05h, 0a8h, 05h, 0b1h
        db      05h, 0b9h, 05h, 0c1h, 05h, 0cah, 05h, 0d3h, 05h, 0dbh, 05h, 0e4h, 05h, 0edh, 05h, 0f5h
        db      05h, 0feh, 05h, 07h, 06h, 10h, 06h, 19h, 06h, 22h, 06h, 2bh, 06h, 34h, 06h, 3eh
        db      06h, 47h, 06h, 50h, 06h, 59h, 06h, 63h, 06h, 6ch, 06h, 76h, 06h, 7fh, 06h, 89h
        db      06h, 93h, 06h, 9dh, 06h, 0a6h, 06h, 0b0h, 06h, 0bah, 06h, 0c4h, 06h, 0ceh, 06h, 0d8h
        db      06h, 0e2h, 06h, 0edh, 06h, 0f7h, 06h, 01h, 07h, 0ch, 07h, 16h, 07h, 21h, 07h, 2bh
        db      07h, 36h, 07h, 40h, 07h, 4bh, 07h, 56h, 07h, 61h, 07h, 6ch, 07h, 77h, 07h, 82h
        db      07h, 8dh, 07h, 98h, 07h, 0a4h, 07h, 0afh, 07h, 0bah, 07h, 0c6h, 07h, 0d1h, 07h, 0ddh
        db      07h, 0e8h, 07h, 0f4h, 07h, 00h, 08h, 0ch, 08h, 18h, 08h, 24h, 08h, 30h, 08h, 3ch
        db      08h, 48h, 08h, 55h, 08h, 61h, 08h, 6dh, 08h, 7ah, 08h, 86h, 08h, 93h, 08h, 0a0h
        db      08h, 0ach, 08h, 0b9h, 08h, 0c6h, 08h, 0d3h, 08h, 0e0h, 08h, 0eeh, 08h, 0fbh, 08h, 08h
        db      09h, 16h, 09h, 23h, 09h, 31h, 09h, 3eh, 09h, 4ch, 09h, 5ah, 09h, 68h, 09h, 75h
        db      09h, 83h, 09h, 92h, 09h, 0a0h, 09h, 0aeh, 09h, 0bch, 09h, 0cbh, 09h, 0d9h, 09h, 0e8h
        db      09h, 0f7h, 09h, 05h, 0ah, 14h, 0ah, 23h, 0ah, 32h, 0ah, 41h, 0ah, 51h, 0ah, 60h
        db      0ah, 6fh, 0ah, 7fh, 0ah, 8eh, 0ah, 9eh, 0ah, 0aeh, 0ah, 0beh, 0ah, 0ceh, 0ah, 0deh
        db      0ah, 0eeh, 0ah, 0feh, 0ah, 0eh, 0bh, 1fh, 0bh, 2fh, 0bh, 40h, 0bh, 50h, 0bh, 61h
        db      0bh, 72h, 0bh, 83h, 0bh, 94h, 0bh, 0a5h, 0bh, 0b6h, 0bh, 0c8h, 0bh, 0d9h, 0bh, 0ebh
        db      0bh, 0fdh, 0bh, 0eh, 0ch, 20h, 0ch, 32h, 0ch, 44h, 0ch, 56h, 0ch, 69h, 0ch, 7bh
        db      0ch, 8eh, 0ch, 0a0h, 0ch, 0b3h, 0ch, 0c6h, 0ch, 0d9h, 0ch, 0ech, 0ch, 0ffh, 0ch, 12h
        db      0dh, 26h, 0dh, 39h, 0dh, 4dh, 0dh, 60h, 0dh, 74h, 0dh, 88h, 0dh, 9ch, 0dh, 0b1h
        db      0dh, 0c5h, 0dh, 0d9h, 0dh, 0eeh, 0dh, 02h, 0eh, 17h, 0eh, 2ch, 0eh, 41h, 0eh, 56h
        db      0eh, 6ch, 0eh, 81h, 0eh, 96h, 0eh, 0ach, 0eh, 0c2h, 0eh, 0d8h, 0eh, 0eeh, 0eh, 04h
        db      0fh, 1ah, 0fh, 31h, 0fh, 47h, 0fh, 5eh, 0fh, 74h, 0fh, 8bh, 0fh, 0a2h, 0fh, 0bah
        db      0fh, 0d1h, 0fh, 0e8h, 0fh
d_c0_tbl_00236:
        db      00h, 10h, 18h, 10h, 30h, 10h, 48h, 10h, 60h, 10h, 78h
        db      10h, 90h, 10h, 0a9h, 10h, 0c2h, 10h, 0dbh, 10h, 0f4h, 10h, 0dh, 11h, 26h, 11h, 3fh
        db      11h, 59h, 11h, 73h, 11h, 8dh, 11h, 0a7h, 11h, 0c1h, 11h, 0dbh, 11h, 0f6h, 11h, 10h
        db      12h, 2bh, 12h, 46h, 12h, 61h, 12h, 7ch, 12h, 98h, 12h, 0b3h, 12h, 0cfh, 12h, 0ebh
        db      12h, 07h, 13h, 23h, 13h, 40h, 13h, 5ch, 13h, 79h, 13h, 96h, 13h, 0b3h, 13h, 0d0h
        db      13h, 0edh, 13h, 0bh, 14h, 29h, 14h, 47h, 14h, 65h, 14h, 83h, 14h, 0a1h, 14h, 0c0h
        db      14h, 0dfh, 14h, 0feh, 14h, 1dh, 15h, 3ch, 15h, 5ch, 15h, 7bh, 15h, 9bh, 15h, 0bbh
        db      15h, 0dbh, 15h, 0fch, 15h, 1ch, 16h, 3dh, 16h, 5eh, 16h, 7fh, 16h, 0a1h, 16h, 0c2h
        db      16h, 0e4h, 16h, 06h, 17h, 28h, 17h, 4ah, 17h, 6dh, 17h, 90h, 17h, 0b3h, 17h, 0d6h
        db      17h, 0f9h, 17h, 1dh, 18h, 40h, 18h, 64h, 18h, 89h, 18h, 0adh, 18h, 0d1h, 18h, 0f6h
        db      18h, 1bh, 19h, 41h, 19h, 66h, 19h, 8ch, 19h, 0b2h, 19h, 0d8h, 19h, 0feh, 19h, 25h
        db      1ah, 4bh, 1ah, 72h, 1ah, 9ah, 1ah, 0c1h, 1ah, 0e9h, 1ah, 11h, 1bh, 39h, 1bh, 61h
        db      1bh, 8ah, 1bh, 0b2h, 1bh, 0dch, 1bh, 05h, 1ch, 2eh, 1ch, 58h, 1ch, 82h, 1ch, 0adh
        db      1ch, 0d7h, 1ch, 02h, 1dh, 2dh, 1dh, 58h, 1dh, 84h, 1dh, 0afh, 1dh, 0dbh, 1dh, 08h
        db      1eh, 34h, 1eh, 61h, 1eh, 8eh, 1eh, 0bbh, 1eh, 0e9h, 1eh, 17h, 1fh, 45h, 1fh, 73h
        db      1fh, 0a2h, 1fh, 0d1h, 1fh, 00h, 20h, 2fh, 20h, 5fh, 20h, 8fh, 20h, 0bfh, 20h, 0f0h
        db      20h, 21h, 21h, 52h, 21h, 83h, 21h, 0b5h, 21h, 0e7h, 21h, 19h, 22h, 4ch, 22h, 7fh
        db      22h, 0b2h, 22h, 0e5h, 22h, 19h, 23h, 4dh, 23h, 82h, 23h, 0b6h, 23h, 0ebh, 23h, 20h
        db      24h, 56h, 24h, 8ch, 24h, 0c2h, 24h, 0f9h, 24h, 2fh, 25h, 67h, 25h, 9eh, 25h, 0d6h
        db      25h, 0eh, 26h, 46h, 26h, 7fh, 26h, 0b8h, 26h, 0f2h, 26h, 2bh, 27h, 66h, 27h, 0a0h
        db      27h, 0dbh, 27h, 16h, 28h, 51h, 28h, 8dh, 28h, 0c9h, 28h, 06h, 29h, 43h, 29h, 80h
        db      29h, 0bdh, 29h, 0fbh
        db      ")9*x*"
        db      0b7h, 2ah, 0f6h
        db      "*6+v+"
        db      0b7h, 2bh, 0f7h
        db      "+9,z,"
        db      0bch, 2ch, 0ffh, 2ch, 41h, 2dh, 84h, 2dh, 0c8h, 2dh, 0ch, 2eh, 50h, 2eh, 95h, 2eh
        db      0dah, 2eh, 1fh, 2fh, 65h, 2fh, 0abh, 2fh, 0f2h, 2fh, 39h, 30h, 81h, 30h, 0c9h, 30h
        db      11h, 31h, 5ah, 31h, 0a3h, 31h, 0edh, 31h, 37h, 32h, 81h, 32h, 0cch, 32h, 17h, 33h
        db      63h, 33h, 0afh, 33h, 0fch, 33h, 49h, 34h, 97h, 34h, 0e5h, 34h, 33h, 35h, 82h, 35h
        db      0d1h
        db      "5!6q6"
        db      0c2h, 36h, 13h, 37h, 65h, 37h, 0b7h, 37h, 0ah, 38h, 5dh, 38h, 0b0h, 38h, 04h, 39h
        db      59h, 39h, 0aeh, 39h, 04h, 3ah, 5ah, 3ah, 0b0h, 3ah, 07h, 3bh, 5fh, 3bh, 0b7h, 3bh
        db      0fh, 3ch, 68h, 3ch, 0c2h, 3ch, 1ch, 3dh, 77h, 3dh, 0d2h, 3dh, 2eh, 3eh, 8ah, 3eh
        db      0e7h
        db      3eh, 44h, 3fh, 0a2h, 3fh, 00h, 40h
d_c1_w_00418:
        db      00h, 00h, 00h, 00h, 00h, 01h, 00h, 10h, 00h
        db      10h, 00h, 00h, 00h, 0c0h, 00h, 40h, 00h, 00h, 00h, 00h, 24h, 0fah, 00h, 00h, 00h
        db      00h, 00h, 00h, 24h, 0fah, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h
d_c1_w_00444:
        db      0bh, 00h, 30h, 0f7h, 0bh, 01h, 31h, 0f7h, 0eh, 00h, 01h, 2fh, 0eh
        db      0f6h, 0bh, 25h, 0eh, 0f7h, 0ch, 25h, 00h, 00h
d_c1_b_0045a:
        db      00h
d_c1_w_0045b:
        db      00h, 00h
d_c1_w_0045d:
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h
pow10_dwords:                           ; dd[9] 1..10^8 = DS:POW10_TABLE
        db      01h, 00h
d_c1_tbl_00466:
        db      00h, 00h, 0ah, 00h, 00h, 00h, 64h, 00h, 00h, 00h, 0e8h
        db      03h, 00h, 00h, 10h, 27h, 00h, 00h, 0a0h, 86h, 01h, 00h, 40h, 42h, 0fh, 00h, 80h
        db      96h, 98h, 00h, 00h
d_c2_tbl_00485:
        db      0e1h
d_c2_tbl_00486:
        db      0f5h, 05h
d_c1_tbl_00488:
        db      00h
d_c2_tbl_00489:
        db      07h, 06h, 03h, 02h, 05h, 04h, 01h, 00h
        db      00h, 00h, 00h
        db      "%$*R(&.,0/-+17356EQPABLM8>?@IJG'49:;<=CDFHKNO#)2STUVWXYZ[\\]^_"
        db      60h, 61h, 62h
d_c1_w_004d4:
        db      00h, 00h
d_c1_b_004d6:
        db      00h, 00h
d_c1_w_004d8:
        db      00h, 00h
d_c0_tbl_004da:
        db      00h, 00h, 01h, 00h, 02h, 00h, 05h
        db      00h, 08h, 00h, 0dh, 00h, 12h, 00h, 19h, 00h, 20h, 00h, 29h, 00h, 32h, 00h, 3dh
        db      00h, 48h, 00h, 55h, 00h, 62h, 00h, 71h, 00h, 80h, 00h, 91h, 00h, 0a2h, 00h, 0b5h
        db      00h, 0c8h, 00h, 0ddh, 00h, 0f2h, 00h, 09h, 01h, 20h, 01h, 39h, 01h, 52h, 01h, 6dh
        db      01h, 88h, 01h, 0a5h, 01h, 0c2h, 01h, 0e1h, 01h, 00h, 02h, 21h, 02h, 42h, 02h, 65h
        db      02h, 88h, 02h, 0adh, 02h, 0d2h, 02h, 0f9h, 02h, 20h, 03h, 49h, 03h, 72h, 03h, 9dh
        db      03h, 0c8h, 03h, 0f5h, 03h, 22h, 04h, 51h, 04h, 80h, 04h, 0b1h, 04h, 0e2h, 04h, 15h
        db      05h, 48h, 05h, 7dh, 05h, 0b2h, 05h, 0e9h, 05h, 20h, 06h, 59h, 06h, 92h, 06h, 0cdh
        db      06h, 08h, 07h, 45h, 07h, 82h, 07h, 0c1h, 07h, 00h, 08h, 41h, 08h, 82h, 08h, 0c5h
        db      08h, 08h, 09h, 4dh, 09h, 92h, 09h, 0d9h, 09h, 20h, 0ah, 69h, 0ah, 0b2h, 0ah, 0fdh
        db      0ah, 48h, 0bh, 95h, 0bh, 0e2h, 0bh, 31h, 0ch, 80h, 0ch, 0d1h, 0ch, 22h, 0dh, 75h
        db      0dh, 0c8h, 0dh, 1dh, 0eh, 72h, 0eh, 0c9h, 0eh, 20h, 0fh, 79h, 0fh, 0d2h, 0fh, 2dh
        db      10h, 88h, 10h, 0e5h, 10h, 42h, 11h, 0a1h, 11h, 00h, 12h, 61h, 12h, 0c2h, 12h, 25h
        db      13h, 88h, 13h
d_c0_tbl_005a4:
        db      00h, 00h, 0ah, 00h, 15h, 00h, 1fh, 00h, 29h, 00h, 33h, 00h, 3dh
        db      00h, 48h, 00h, 52h, 00h, 5ch, 00h, 66h, 00h, 70h, 00h, 7ah, 00h, 84h, 00h, 8eh
        db      00h, 98h, 00h, 0a2h, 00h, 0ach, 00h, 0b6h, 00h, 0c0h, 00h, 0cah, 00h, 0d3h, 00h, 0ddh
        db      00h, 0e7h, 00h, 0f0h, 00h, 0fah, 00h, 03h, 01h, 0dh, 01h, 16h, 01h, 1fh, 01h, 28h
        db      01h, 31h, 01h, 3ah, 01h, 43h, 01h, 4ch, 01h, 55h, 01h, 5eh, 01h, 66h, 01h, 6fh ; .1.:.C.L.U.^.f.o
        db      01h, 77h, 01h, 80h, 01h, 88h, 01h, 90h, 01h, 98h, 01h, 0a0h, 01h, 0a8h, 01h, 0b0h
        db      01h, 0b7h, 01h, 0bfh, 01h, 0c6h, 01h, 0ceh, 01h, 0d5h, 01h, 0dch, 01h, 0e3h, 01h, 0eah
        db      01h, 0f0h, 01h, 0f7h, 01h, 0fdh, 01h, 04h, 02h, 0ah, 02h, 10h, 02h, 16h, 02h, 1ch
        db      02h, 22h, 02h, 27h, 02h, 2dh, 02h, 32h, 02h, 37h, 02h, 3ch, 02h, 41h, 02h, 46h ; .".'.-.2.7.<.A.F
        db      02h, 4ah, 02h, 4fh, 02h, 53h, 02h, 57h, 02h, 5bh, 02h, 5fh, 02h, 63h, 02h, 66h ; .J.O.S.W.[._.c.f
        db      02h, 6ah, 02h, 6dh, 02h, 70h, 02h, 73h, 02h, 76h, 02h, 78h, 02h, 7bh, 02h, 7dh ; .j.m.p.s.v.x.{.}
        db      02h, 7fh, 02h, 81h, 02h, 83h, 02h, 85h, 02h, 86h, 02h, 88h, 02h, 89h, 02h, 8ah
        db      02h, 8bh, 02h, 8ch, 02h, 8ch, 02h, 8ch, 02h, 8dh, 02h, 8dh, 02h
d_c0_tbl_0066e:
        db      0a4h, 00h, 0ach
        db      00h, 0b4h, 00h, 0bch, 00h, 0c5h, 00h, 0ceh, 00h, 0d8h, 00h, 0e2h, 00h, 0edh, 00h, 0f8h
        db      00h, 04h, 01h, 10h, 01h, 1dh, 01h, 2ah, 01h, 38h, 01h, 47h, 01h, 56h, 01h, 66h
        db      01h, 77h, 01h, 89h, 01h, 9ch, 01h, 0afh, 01h, 0c3h, 01h, 0d8h, 01h, 0efh, 01h, 06h
        db      02h, 1eh, 02h, 38h, 02h, 53h, 02h, 6fh, 02h, 8ch, 02h, 0abh, 02h, 0cbh, 02h, 0edh
        db      02h, 10h, 03h, 35h, 03h, 5ch, 03h, 84h, 03h, 0afh, 03h, 0dbh, 03h, 0ah, 04h, 3ah
        db      04h, 6dh, 04h, 0a3h, 04h, 0dbh, 04h, 15h, 05h, 53h, 05h, 93h, 05h, 0d6h, 05h, 1dh
        db      06h, 66h, 06h, 0b4h, 06h, 04h, 07h, 59h, 07h, 0b2h, 07h, 0eh, 08h, 70h, 08h, 0d5h
        db      08h, 40h, 09h, 0b0h, 09h, 25h, 0ah, 9fh, 0ah, 1fh, 0bh, 0a5h, 0bh, 32h, 0ch, 0c5h
        db      0ch, 5fh, 0dh, 00h, 0eh, 0a9h, 0eh, 5ah, 0fh, 13h, 10h, 0d5h, 10h, 0a0h, 11h, 75h
        db      12h, 54h, 13h, 3dh, 14h, 31h, 15h, 31h, 16h, 3ch, 17h, 55h, 18h, 7ah, 19h, 0aeh
        db      1ah, 0efh, 1bh
d_c0_w_00714:
        db      40h, 1dh
d_c0_b_00716:
        db      0a1h, 1eh, 13h, 20h, 96h, 21h, 2bh, 23h, 0d3h, 24h, 90h
        db      "&a(H*F,\\."
        db      8ch, 30h, 0d5h, 32h, 3bh, 35h, 0bdh
        db      37h, 5dh, 3ah, 1eh, 3dh, 0ffh, 3fh
d_c0_w_00738:
        dw      EP_FAR_42192_OFF
d_c0_w_0073a:
        dw      EP_FAR_42192_SEG
d_c1_tbl_0073c:
        db      00h, 00h
d_c1_tbl_0073e:
        db      00h, 00h
        dw      (C1_BASE+L_43160-C1_SEG*16), C1_SEG
        dw      EP_FAR_43178_OFF, EP_FAR_43178_SEG
d_c1_tbl_00748:
        dw      EP_FAR_4318C_OFF, EP_FAR_4318C_SEG
        dw      EP_FAR_431A4_OFF, EP_FAR_431A4_SEG
        dw      (C1_BASE+L_431B6-C1_SEG*16), C1_SEG
        dw      EP_FAR_431C8_OFF, EP_FAR_431C8_SEG
        dw      EP_FAR_431E0_OFF, EP_FAR_431E0_SEG
        dw      EP_FAR_431E8_OFF, EP_FAR_431E8_SEG
        dw      (C1_BASE+L_431F8-C1_SEG*16), C1_SEG
        dw      (C1_BASE+L_43208-C1_SEG*16), C1_SEG
        db      " !*#$%&'()***-**0123456789******@ABCDEFGHIJKLMNOPQRSTUVWXYZ****_*abcdefghijklmnopqrstuvwx"
        db      79h, 7ah, 7bh, 2ah, 7dh, 2ah, 2ah, 00h, 00h
TBL_WINKEYS_LOAD_SET:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F3, EP_LOAD_SET_CLEAR_SEG, EP_LOAD_SET_CLEAR_OFF
        WIN_KEY   WIN_K_F4, EP_LOAD_SET_CANCEL_SEG, EP_LOAD_SET_CANCEL_OFF
        WIN_KEY   WIN_K_F5, EP_LOAD_SET_LOAD_SEG, EP_LOAD_SET_LOAD_OFF
        WIN_KEY   WIN_K_PAINT, EP_LOAD_SET_PAINT_SEG, EP_LOAD_SET_PAINT_OFF
        WIN_KEY_END
d_c1_w_007e8:
        WIN_SOFTKEY 3, 1, "CLEAR"
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "LOAD"
        WIN_LABEL 23h, 0ch, "Replace same sound in memory"
        WIN_LABEL 53h, 15h, ":"
        WIN_LABEL 23h, 1eh, "[CLEAR] erases existing P & S"
        WIN_LABEL 23h, 27h, "[^LOAD^] adds to existing P & S"
        WIN_END
        db      00h
d_c1_w_0086e:
        db      59h, 15h, 3ch
        db      01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h
d_c0_fp_0087c:
        dw      EP_L_43B62_OFF, EP_L_43B62_SEG
        db      00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h
TBL_WINKEYS_CANT_FIND_FILE:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F2, EP_CANT_FIND_FILE_AL_SKP_SEG, EP_CANT_FIND_FILE_AL_SKP_OFF
        WIN_KEY   WIN_K_F3, EP_CANT_FIND_FILE_SKIP_SEG, EP_CANT_FIND_FILE_SKIP_OFF
        WIN_KEY   WIN_K_PAINT, EP_CANT_FIND_FILE_PAINT_SEG, EP_CANT_FIND_FILE_PAINT_OFF
        WIN_KEY_END
        db      00h
d_c1_w_008b2:
        db      1ah, 02h, 01h
        db      "AL SKP"
        db      00h, 1ah, 03h, 01h
        db      "SKIP"
        db      00h, 07h, 19h, 0dh
        db      "Can't find file:"
        db      00h, 00h, 00h
d_c1_w_008da:
        db      1ah, 05h, 01h
        db      "LOAD"
        db      00h, 07h, 19h, 16h
        db      "Insert disk with this file and"
        db      00h, 07h, 19h, 1fh
        db      "press LOAD. To skip, press SKIP"
        db      00h, 07h, 19h
        db      "((this file) or AL SKP(all files)."
        db      00h, 00h, 00h
d_c1_w_0094e:
        db      07h, 19h, 1fh
        db      "To skip, press SKIP(this file)"
        db      00h, 07h, 19h
        db      "(or AL SKP(all files)."
        db      00h, 00h
d_c1_w_0098a:
        db      79h, 0dh, 60h, 03h, 01h, 40h, 00h
        db      00h, 00h, 00h, 0ffh, 00h, 00h, 00h
d_c1_fp_00998:
        dw      EP_FAR_43CD8_OFF, EP_FAR_43CD8_SEG
        db      00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_FAR_43CF0_OFF, EP_FAR_43CF0_SEG
        db      00h
        db      00h, 00h, 00h
TBL_WINKEYS_LOAD_APS:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F4, EP_LOAD_APS_CANCEL_SEG, EP_LOAD_APS_CANCEL_OFF
        WIN_KEY   WIN_K_F5, EP_LOAD_APS_LOAD_SEG, EP_LOAD_APS_LOAD_OFF
        WIN_KEY   WIN_K_PAINT, EP_LOAD_APS_PAINT_SEG, EP_LOAD_APS_PAINT_OFF
        WIN_KEY_END
        db      00h
d_c1_w_009ce:
        db      07h, 23h, 15h
        db      "This will replace all existing"
        db      00h, 07h, 23h, 1eh
        db      "programs and sounds"
        db      00h, 1ah, 04h, 02h
        db      "CANCEL"
        db      00h
        db      1ah, 05h, 01h
        db      "LOAD"
        db      00h, 00h
d_c1_tbl_00a1a:
        dw      (C1_BASE+L_44010-C1_SEG*16)
d_c1_tbl_00a1c:
        dw      C1_SEG
        dw      EP_MSG_WITH_SOUNDS_OFF, EP_MSG_WITH_SOUNDS_SEG
        dw      EP_MSG_WITH_WAV_OFF, EP_MSG_WITH_WAV_SEG
TBL_WINKEYS_SAVE_A_PROGRAM:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F3, EP_SAVE_A_PROGRAM_WIPE_SEG, EP_SAVE_A_PROGRAM_WIPE_OFF
        WIN_KEY   WIN_K_F4, EP_SAVE_A_PROGRAM_CANCEL_SEG, EP_SAVE_A_PROGRAM_CANCEL_OFF
        WIN_KEY   WIN_K_F5, EP_SAVE_A_PROGRAM_SAVE_SEG, EP_SAVE_A_PROGRAM_SAVE_OFF
        WIN_KEY   WIN_K_PAINT, EP_SAVE_A_PROGRAM_PAINT_SEG, EP_SAVE_A_PROGRAM_PAINT_OFF
        WIN_KEY_END
d_c1_w_00a44:
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "SAVE"
        WIN_LABEL 35h, 0eh, "File="
        WIN_LABEL 47h, 1ch, "Save:"
        WIN_LABEL 35h, 26h, "Replace same sounds:"
        WIN_END
        db      00h
d_c1_w_00a82:
        db      65h, 1ch, 48h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 02h, 00h, 00h, 00h
d_c1_tbl_00a90:
        dw      EP_SAVE_PGM_FIELD0_THUNK_OFF, EP_SAVE_PGM_FIELD0_THUNK_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_SAVE_PGM_FIELD1_THUNK_OFF, EP_SAVE_PGM_FIELD1_THUNK_SEG
        db      00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
TBL_FIELDS_0A82:                        ; 2 x FIELD_SIZE, DS:0A82h = SAVE_PGM_FIELDS; the part of the array this .asm emits itself
        db      0adh, 26h, 12h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_SAVE_PGM_FIELD1_THUNK_OFF, EP_SAVE_PGM_FIELD1_THUNK_SEG ; THUNK  PREV  NEXT
        dw      EP_SAVE_PGM_FIELD0_THUNK_OFF, EP_SAVE_PGM_FIELD0_THUNK_SEG
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
TBL_WINKEYS_DISK_FULL:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F3, EP_DISK_FULL_F3_SEG, EP_DISK_FULL_F3_OFF
        WIN_KEY   WIN_K_F4, EP_DISK_FULL_CANCEL_SEG, EP_DISK_FULL_CANCEL_OFF
        if      FW_VERSION >= 120
        WIN_KEY   WIN_K_F5, C1_SEG, EP_X_449E2_OFF
        else
        WIN_KEY   WIN_K_F5, C1_SEG, EP_DISK_FULL_SAVE_OFF
        endif
        WIN_KEY   WIN_K_PAINT, EP_DISK_FULL_PAINT_SEG, EP_DISK_FULL_PAINT_OFF
        WIN_KEY_END
d_c1_w_00af4:
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "SAVE"
        WIN_BITMAP 37h, 13h, 00h
        WIN_LABEL 4fh, 0fh, "There is not enogh space"
        WIN_LABEL 4fh, 18h, "on this disk!!"
        WIN_LABEL 4fh, 21h, "Please insert a different"
        WIN_LABEL 4fh, 2ah, "disk, then press SAVE."
        WIN_END
d_c1_tbl_00b70:
        dw      (C1_BASE+L_450BC-C1_SEG*16)
d_c1_tbl_00b72:
        dw      C1_SEG
        dw      EP_MSG_WITH_SOUNDS_OFF, EP_MSG_WITH_SOUNDS_SEG
        dw      EP_MSG_WITH_WAV_OFF, EP_MSG_WITH_WAV_SEG
TBL_WINKEYS_SAVE_APS:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F3, EP_SAVE_APS_F3_SEG, EP_SAVE_APS_F3_OFF
        WIN_KEY   WIN_K_F4, EP_SAVE_APS_CANCEL_SEG, EP_SAVE_APS_CANCEL_OFF
        WIN_KEY   WIN_K_F5, EP_SAVE_APS_SAVE_SEG, EP_SAVE_APS_SAVE_OFF
        WIN_KEY   WIN_K_PAINT, EP_SAVE_APS_PAINT_SEG, EP_SAVE_APS_PAINT_OFF
        WIN_KEY_END
d_c1_w_00b9a:
        db      1ah, 04h, 02h, 43h, 41h, 4eh, 43h
        db      45h, 4ch, 00h
        WIN_SOFTKEY 5, 1, "SAVE"
        WIN_LABEL 35h, 0eh, "File:"
        WIN_LABEL 47h, 1ch, "Save:"
        WIN_LABEL 35h, 26h, "Replace same sounds:"
        WIN_END
        db      00h
d_c1_w_00bd8:
        db      65h, 1ch, 42h, 01h, 01h, 40h, 00h, 00h, 00h
        db      00h, 02h, 00h, 00h, 00h
d_c1_tbl_00be6:
        dw      EP_SAVE_APS_FIELD0_THUNK_OFF, EP_SAVE_APS_FIELD0_THUNK_SEG
        dw      EP_SAVE_APS_FIELD2_THUNK_OFF, EP_SAVE_APS_FIELD2_THUNK_SEG
        dw      EP_SAVE_APS_FIELD1_THUNK_OFF, EP_SAVE_APS_FIELD1_THUNK_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h
TBL_FIELDS_0BD8:                        ; 3 x FIELD_SIZE, DS:0BD8h = SAVE_APS_FIELDS; the part of the array this .asm emits itself
        db      0adh, 26h, 12h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_SAVE_APS_FIELD1_THUNK_OFF, EP_SAVE_APS_FIELD1_THUNK_SEG, EP_SAVE_APS_FIELD0_THUNK_OFF, EP_SAVE_APS_FIELD0_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c1_tbl_00c24:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h; +1Ah..+21h  NOTIFY  ENTER
d_c1_w_00c2c:
        db      53h, 0eh, 60h, 01h, 00h, 41h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        dw      EP_SAVE_APS_FIELD2_THUNK_OFF, EP_SAVE_APS_FIELD2_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_SAVE_APS_FIELD0_THUNK_OFF, EP_SAVE_APS_FIELD0_THUNK_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        db      88h, 8bh, 8fh, 92h, 95h, 99h, 9ch, 9fh, 0a2h, 0a5h, 0a8h
        db      0aah, 0adh, 0b0h, 0b3h, 0b5h, 0b8h, 0bbh, 0bdh, 0c0h, 0c2h, 0c5h, 0c7h, 0cah, 0cch, 0ceh, 0d0h
        db      0d3h, 0d5h, 0d7h, 0d9h, 0dch, 0deh, 0e0h, 0e2h, 0e4h, 0e6h, 0e8h, 0eah, 0ech, 0eeh, 0f0h, 0f2h
        db      0f3h, 0f5h, 0f7h, 0f9h, 0fbh, 0fdh, 0feh, 00h, 02h, 03h, 05h, 07h, 08h, 0ah, 0ch, 0dh
        db      0fh, 11h, 12h, 14h, 15h, 17h, 18h, 1ah, 1bh, 1dh, 1eh, 20h, 21h, 22h, 24h, 25h
        db      "'()+,-/01345789:;=>?@BCDEFGHJKLMNOPQRTUVWXYZ[\\]^_`abcdefghijkklmnopqrstuuvwx"
        db      00h
d_c1_w_00cee:
        db      01h, 00h, 00h
        db      00h, 00h, 04h
        dw      EP_L_45818_OFF, EP_L_45818_SEG
        db      84h
        dw      EP_FAR_46178_OFF, EP_FAR_46178_SEG
TBL_WINKEYS_LOAD_SOUND:
        WIN_KEY   WIN_K_F4, EP_LOAD_SOUND_DISCARD_SEG, EP_LOAD_SOUND_DISCARD_OFF
        WIN_KEY   WIN_K_F5, EP_LOAD_SOUND_KEEP_SEG, EP_LOAD_SOUND_KEEP_OFF
        WIN_KEY   WIN_K_PAD, EP_LOAD_SOUND_PAD_SEG, EP_LOAD_SOUND_PAD_OFF
        WIN_KEY   WIN_K_PAINT, EP_LOAD_SOUND_PAINT_SEG, EP_LOAD_SOUND_PAINT_OFF
        WIN_KEY   WIN_K_REFRESH, EP_LOAD_SOUND_REFRESH_SEG, EP_LOAD_SOUND_REFRESH_OFF
        WIN_KEY_END
        db      00h
d_c1_w_00d1c:
        db      1ah, 03h, 01h, 50h, 4ch
        db      41h, 59h, 00h, 1ah, 04h, 02h
        db      "DSCARD"
        db      00h, 1ah, 05h, 01h
        db      "KEEP"
        db      00h, 07h, 29h, 15h
        db      "File:"
        db      00h, 07h
        db      ")'Assign to note:"
        db      00h, 00h, 00h
d_c1_w_00d54:
        db      83h, 27h, 24h, 02h, 01h, 00h, 22h, 00h, 00h, 00h, 62h, 00h, 00h
        db      00h
d_c1_fp_00d62:
        dw      EP_FAR_46320_OFF, EP_FAR_46320_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
TBL_WINKEYS_LOAD_SOUND_EXISTS:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F3, EP_LOAD_SOUND_EXISTS_REPLACE_SEG, EP_LOAD_SOUND_EXISTS_REPLACE_OFF
        WIN_KEY   WIN_K_F4, EP_LOAD_SOUND_EXISTS_CANCEL_SEG, EP_LOAD_SOUND_EXISTS_CANCEL_OFF
        WIN_KEY   WIN_K_F5, EP_LOAD_SOUND_EXISTS_RENAME_SEG, EP_LOAD_SOUND_EXISTS_RENAME_OFF
        WIN_KEY   WIN_K_PAINT, EP_LOAD_SOUND_EXISTS_PAINT_SEG, EP_LOAD_SOUND_EXISTS_PAINT_OFF
        WIN_KEY   WIN_K_REFRESH, EP_LOAD_SOUND_EXISTS_REFRESH_SEG, EP_LOAD_SOUND_EXISTS_REFRESH_OFF
        WIN_KEY_END
        db      00h
d_c1_w_00da2:
        db      25h, 1dh, 13h, 00h, 07h, 4dh, 13h
        db      "File name exists!"
        db      00h, 07h, 4dh, 1ch
        db      "Replace or rename?"
        db      00h, 1ah, 03h, 01h
        db      "REPLAC"
        db      00h, 1ah, 04h, 02h
        db      "CANCEL"
        db      00h, 1ah, 05h, 01h
        db      "RENAME"
        db      00h, 00h
TBL_WINKEYS_SAVE_A_SOUND:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F3, EP_SAVE_A_SOUND_WIPE_SEG, EP_SAVE_A_SOUND_WIPE_OFF
        WIN_KEY   WIN_K_F4, EP_SAVE_A_SOUND_CANCEL_SEG, EP_SAVE_A_SOUND_CANCEL_OFF
        WIN_KEY   WIN_K_F5, EP_SAVE_A_SOUND_SAVE_SEG, EP_SAVE_A_SOUND_SAVE_OFF
        WIN_KEY   WIN_K_PAINT, EP_SAVE_A_SOUND_PAINT_SEG, EP_SAVE_A_SOUND_PAINT_OFF
        WIN_KEY_END
d_c1_w_00e0e:
        db      1ah, 04h, 02h
        db      43h, 41h, 4eh, 43h, 45h, 4ch, 00h
        WIN_SOFTKEY 5, 1, "SAVE"
        WIN_LABEL 29h, 13h, "File:"
        WIN_LABEL 29h, 25h, "File type:"
        WIN_END
d_c1_w_00e38:
        db      47h, 13h, 78h, 01h, 00h, 42h, 01h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h
d_c1_tbl_00e46:
        dw      EP_SAVE_SND_FIELD0_THUNK_OFF, EP_SAVE_SND_FIELD0_THUNK_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_SAVE_SND_FIELD1_THUNK_OFF, EP_SAVE_SND_FIELD1_THUNK_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h
d_c1_w_00e62:
        db      65h, 25h, 2ah, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h
        dw      EP_SAVE_SND_FIELD1_THUNK_OFF, EP_SAVE_SND_FIELD1_THUNK_SEG
        dw      EP_SAVE_SND_FIELD0_THUNK_OFF, EP_SAVE_SND_FIELD0_THUNK_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
TBL_WINKEYS_FILE_EXISTS:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F3, EP_FILE_EXISTS_F3_SEG, EP_FILE_EXISTS_F3_OFF
        WIN_KEY   WIN_K_F4, EP_FILE_EXISTS_F4_SEG, EP_FILE_EXISTS_F4_OFF
        WIN_KEY   WIN_K_F5, EP_FILE_EXISTS_F5_SEG, EP_FILE_EXISTS_F5_OFF
        WIN_KEY   WIN_K_PAINT, EP_FILE_EXISTS_PAINT_SEG, EP_FILE_EXISTS_PAINT_OFF
        WIN_KEY_END
d_c1_w_00eaa:
        db      1ah, 04h, 02h, 43h, 41h, 4eh, 43h
        db      45h, 4ch, 00h
        WIN_SOFTKEY 5, 1, "RENAME"
        WIN_BITMAP 1dh, 13h, 00h
        WIN_LABEL 4dh, 13h, "File name exists!"
        WIN_END
d_c1_w_00ed8:
        WIN_SOFTKEY 3, 1, "REPLAC"
        WIN_LABEL 4dh, 1ch, "Replace or rename?"
        WIN_END
        db      00h
d_c1_w_00efa:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F4, EP_L_469B6_SEG, EP_L_469B6_OFF
        WIN_KEY   WIN_K_F5, EP_X_3A862_SEG, EP_X_3A862_OFF
        WIN_KEY   WIN_K_PAINT, EP_L_469C4_SEG, EP_L_469C4_OFF
        WIN_KEY_END
        db      00h
d_c1_w_00f14:
        db      1ah, 04h, 02h, 43h, 41h, 4eh, 43h, 45h, 4ch, 00h, 1ah, 05h, 01h
        db      "WIPE"
        db      00h, 25h, 35h, 13h, 00h
d_c0_w_00f2a:
        db      07h, 4dh
d_c0_b_00f2c:
        db      13h
d_c0_b_00f2d:
        db      "This will erase disk"
        db      00h, 07h, 4dh, 1ch
        db      "contents !!"
        db      00h, 00h
d_c0_tbl_00f52:
        db      "0123456789 ABCDEFGHIJKLMNOPQRSTUVWXYZ#&-!"
        db      00h
TBL_WINKEYS_5825C:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F3, EP_X_46FB8_SEG, EP_X_46FB8_OFF
        WIN_KEY   WIN_K_F4, EP_L_46FC6_SEG, EP_L_46FC6_OFF
        WIN_KEY   WIN_K_F5, EP_L_46FD4_SEG, EP_L_46FD4_OFF
        WIN_KEY   WIN_K_PAINT, EP_L_460B0_SEG, EP_L_460B0_OFF
        WIN_KEY_END
d_c2_w_00f9a:
        db      1ah, 03h, 01h, 53h, 4fh, 55h, 4eh
        db      44h, 00h
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "SET"
        WIN_LABEL 23h, 0eh, "[SET]   load a SET file"
        WIN_LABEL 23h, 1ch, "[SOUND] load one sound from"
        WIN_LABEL 53h, 25h, "the SET file"
        WIN_END
        if      FW_VERSION >= 110
        if      FW_VERSION >= 112
        db      00h
d_c2_tbl_01000:
        dw      (C2_BASE+L_4713C-C1_SEG*16)
d_c2_tbl_01002:
        dw      C1_SEG
        else
        db      00h
d_c2_tbl_01000:
        db      86h
        if      FW_VERSION >= 111
        db      8fh
d_c2_tbl_01002:
        db      86h, 3dh
        else
        db      8fh
d_c2_tbl_01002:
        db      76h, 3dh
        endif
        endif
        dw      EP_FAR_4714C_OFF, EP_FAR_4714C_SEG
        if      FW_VERSION >= 111
        dw      EP_FAR_4715C_OFF, C1_SEG
        dw      EP_FAR_4716C_OFF, C1_SEG
        if      FW_VERSION >= 112
        dw      (C2_BASE+L_4717C-C1_SEG*16), C1_SEG
        else
        db      0c6h
        db      8fh, 86h, 3dh
        endif
        dw      EP_FAR_4718C_OFF, C1_SEG
        if      FW_VERSION >= 112
        dw      EP_L_4719C_OFF, C1_SEG
        dw      EP_FAR_471AC_OFF, C1_SEG
        dw      (C2_BASE+L_471BC-C1_SEG*16), C1_SEG, EP_L_471CC_OFF, C1_SEG, EP_L_471DC_OFF, C1_SEG, EP_L_471EC_OFF, C1_SEG
        else
        db      0e6h, 8fh, 86h, 3dh, 0f6h, 8fh, 86h, 3dh, 06h
        db      90h, 86h, 3dh
        dw      EP_L_471CC_OFF, C1_SEG
        endif
        else
        db      0a6h, 8fh, 76h, 3dh, 0b6h, 8fh, 76h, 3dh, 0c6h
        db      8fh, 76h, 3dh
        dw      EP_FAR_4718C_OFF, C1_SEG
        db      0e6h, 8fh, 76h, 3dh, 0f6h, 8fh, 76h, 3dh, 06h
        db      90h, 76h, 3dh
        dw      EP_L_471CC_OFF, C1_SEG
        endif
        dw      (C2_BASE+L_471FC-C1_SEG*16), C1_SEG
        dw      EP_FAR_4720C_OFF, C1_SEG
        dw      EP_FAR_4721C_OFF, C1_SEG
        dw      EP_FAR_4722C_OFF, C1_SEG
        dw      (C2_BASE+L_4723C-C1_SEG*16), C1_SEG
        dw      EP_FAR_4724C_OFF, C1_SEG
        dw      EP_FAR_4725C_OFF, EP_FAR_4725C_SEG
        if      FW_VERSION < 112
        dw      EP_L_468F6_OFF, C1_SEG
        db      0a6h
        if      FW_VERSION >= 111
        db      90h, 86h, 3dh
        else
        db      90h, 76h, 3dh
        endif
        endif
        dw      EP_FAR_4726C_OFF, EP_FAR_4726C_SEG
        if      FW_VERSION >= 112
        elseif  FW_VERSION >= 111
        db      0c6h, 90h, 86h, 3dh, 0d6h, 90h, 86h, 3dh
        else
        db      0c6h, 90h, 76h, 3dh, 0d6h, 90h, 76h, 3dh
        endif
        dw      (C2_BASE+L_4727C-C1_SEG*16), C1_SEG
        else
        db      00h
d_c2_tbl_01000:
        db      8ah
        db      8fh
d_c2_tbl_01002:
        db      28h, 3dh, 9ah, 8fh, 28h, 3dh, 0aah, 8fh, 28h, 3dh, 0bah, 8fh, 28h, 3dh, 0cah
        db      8fh, 28h, 3dh, 0dah, 8fh
        db      28h, 3dh, 0eah, 8fh, 28h, 3dh, 0fah, 8fh, 28h, 3dh, 0ah
        db      90h, 28h, 3dh, 1ah, 90h, 28h, 3dh, 2ah
        db      90h, 28h, 3dh
        dw      EP_FAR_4714C_OFF, EP_FAR_4714C_SEG
        db      4ah, 90h, 28h, 3dh, 5ah, 90h, 28h, 3dh
        dw      (C2_BASE+L_462EA-C1_SEG*16), C1_SEG
        dw      EP_L_468D6_OFF, C1_SEG
        dw      EP_FAR_4725C_OFF, EP_FAR_4725C_SEG
        dw      EP_L_468F6_OFF, C1_SEG
        db      0aah
        db      90h, 28h, 3dh
        dw      EP_FAR_4726C_OFF, EP_FAR_4726C_SEG
        db      0cah, 90h, 28h, 3dh, 0dah, 90h, 28h, 3dh, 0eah
        db      90h, 28h, 3dh
        endif
        if      FW_VERSION >= 112
        dw      EP_FAR_4728C_OFF, C1_SEG
        else
        dw      EP_L_46956_OFF, C1_SEG
        endif
        dw      EP_FAR_4729C_OFF, EP_FAR_4729C_SEG
        if      FW_VERSION >= 110
        dw      EP_FAR_472AC_OFF, EP_FAR_472AC_SEG
        dw      (C2_BASE+L_472BC-C1_SEG*16), C1_SEG
        dw      EP_L_472CC_OFF, C1_SEG
        dw      EP_L_472DC_OFF, EP_L_472DC_SEG
        if      FW_VERSION >= 112
        dw      EP_L_472EC_OFF, C1_SEG
        dw      (C2_BASE+L_472FC-C1_SEG*16), C1_SEG
        dw      EP_L_46D0C_OFF, C1_SEG
        else
        dw      EP_FAR_469B6_OFF, C1_SEG
        endif
        if      FW_VERSION >= 111
        dw      EP_L_46D1C_OFF, C1_SEG
        dw      EP_L_46D2C_OFF, C1_SEG
        if      FW_VERSION >= 112
        dw      (C2_BASE+L_4733C-C1_SEG*16), C1_SEG
        else
        db      86h, 91h, 86h, 3dh
        endif
        else
        db      66h
        db      91h, 76h, 3dh, 76h, 91h, 76h, 3dh, 86h, 91h, 76h, 3dh
        endif
        else
        db      1ah, 91h, 28h, 3dh, 2ah
        db      91h, 28h, 3dh
        dw      EP_L_46996_OFF, C1_SEG
        dw      EP_L_472DC_OFF, EP_L_472DC_SEG
        db      5ah, 91h, 28h, 3dh, 6ah
        db      91h, 28h, 3dh, 7ah, 91h, 28h, 3dh, 8ah, 91h, 28h, 3dh
        endif
        dw      EP_L_46D4C_OFF, EP_L_46D4C_SEG
TBL_WINKEYS_CONVERSION_TABLE:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F4, EP_CONVERSION_TABLE_CANCEL_SEG, EP_CONVERSION_TABLE_CANCEL_OFF
        WIN_KEY   WIN_K_F5, EP_CONVERSION_TABLE_LOAD_SEG, EP_CONVERSION_TABLE_LOAD_OFF
        WIN_KEY   WIN_K_PAINT, EP_CONVERSION_TABLE_PAINT_SEG, EP_CONVERSION_TABLE_PAINT_OFF
        WIN_KEY_END
        db      00h
d_c2_w_010a2:
        db      1ah, 04h, 02h
        db      "CANCEL"
        db      00h, 1ah, 05h, 01h
        db      "LOAD"
        db      00h, 07h, 43h, 0fh
        db      "MPC60 pad:"
        db      00h, 25h, 25h, 19h, 02h, 0ch, 37h, 1dh, 0aeh, 07h
        db      "C%Becomes note:"
        db      00h, 00h
d_c2_w_010dc:
        db      7fh, 0fh, 5ah, 02h, 01h
        db      40h, 00h, 00h, 00h, 00h, 21h, 00h, 00h, 00h
d_c2_tbl_010ea:
        dw      EP_CONV_TABLE_FOCUS_FIELD0_OFF, EP_CONV_TABLE_FOCUS_FIELD0_SEG
        db      00h, 00h, 00h
        db      00h
        dw      EP_CONV_TABLE_FOCUS_FIELD1_OFF, EP_CONV_TABLE_FOCUS_FIELD1_SEG
        if      FW_VERSION < 120
        if      FW_VERSION >= 114
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 58h, 8fh, 0b9h
        db      3dh, 00h, 00h, 00h, 00h
        else
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_L_468E8_OFF, EP_L_468E8_SEG
        db      00h, 00h, 00h, 00h
        endif
TBL_FIELDS_10DC:
        db      91h, 25h, 24h, 02h, 01h, 00h, 23h, 00h, 00h, 00h, 62h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_CONV_TABLE_FOCUS_FIELD1_OFF, EP_CONV_TABLE_FOCUS_FIELD1_SEG, EP_CONV_TABLE_FOCUS_FIELD0_OFF, EP_CONV_TABLE_FOCUS_FIELD0_SEG
        db      00h, 00h, 00h, 00h
        endif
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        if      FW_VERSION >= 114
        dw      EP_L_468E8_OFF, EP_L_468E8_SEG
        elseif  FW_VERSION >= 112
        dw      EP_FAR_46B1C_OFF, EP_L_468E8_SEG
        else
        dw      EP_FAR_467C6_OFF, C1_SEG
        endif
        db      00h, 00h, 00h, 00h
        if      FW_VERSION >= 120
TBL_FIELDS_10DC:                        ; 2 x FIELD_SIZE; the part of the array this .asm emits itself
        db      91h, 25h, 24h, 02h, 01h, 00h, 23h, 00h, 00h, 00h, 62h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_CONV_TABLE_FOCUS_FIELD1_OFF, EP_CONV_TABLE_FOCUS_FIELD1_SEG
        dw      EP_CONV_TABLE_FOCUS_FIELD0_OFF, C1_SEG
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_FAR_467C6_OFF, C1_SEG
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        endif
TBL_WINKEYS_LOAD_MPC60_SOUND:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F4, EP_LOAD_MPC60_SOUND_CANCEL_SEG, EP_LOAD_MPC60_SOUND_CANCEL_OFF
        WIN_KEY   WIN_K_F5, EP_LOAD_MPC60_SOUND_DO_IT_SEG, EP_LOAD_MPC60_SOUND_DO_IT_OFF
        WIN_KEY   WIN_K_PAINT, EP_LOAD_MPC60_SOUND_PAINT_SEG, EP_LOAD_MPC60_SOUND_PAINT_OFF
        WIN_KEY_END
        db      00h
d_c2_w_0114a:
        db      1ah, 04h, 02h, 43h, 41h, 4eh, 43h
        db      45h, 4ch, 00h, 07h, 3fh, 14h
        db      "MPC60 pad:"
        db      00h, 07h
        db      "]$File:"
        db      00h, 00h
d_c2_w_0116c:
        db      7dh, 14h, 5ah, 01h, 01h
        db      40h, 00h, 00h, 00h, 00h, 21h, 00h, 00h, 00h
d_c2_fp_0117a:
        dw      EP_L_47AA0_OFF, EP_L_47AA0_SEG
        db      00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h
TBL_WINKEYS_CHANGE_DISK:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_REFRESH, EP_CHANGE_DISK_REFRESH_SEG, EP_CHANGE_DISK_REFRESH_OFF
        WIN_KEY   WIN_K_PAINT, EP_CHANGE_DISK_PAINT_SEG, EP_CHANGE_DISK_PAINT_OFF
        WIN_KEY   WIN_K_F4, EP_CHANGE_DISK_F4_SEG, EP_CHANGE_DISK_F4_OFF
        WIN_KEY   WIN_K_F5, EP_CHANGE_DISK_F5_SEG, EP_CHANGE_DISK_F5_OFF
        WIN_KEY_END
d_c2_w_011b4:
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_LABEL 6eh, 14h, "Insert next disk"
        WIN_LABEL 6eh, 20h, "and press DO IT."
        WIN_END
TBL_WINKEYS_594A0:
        WIN_KEY   4eh, EP_L_4DCEC_SEG, EP_L_4DCEC_OFF
        WIN_KEY   4fh, EP_X_4DD18_SEG, EP_X_4DD18_OFF
        WIN_KEY   4ch, EP_FAR_48782_SEG, EP_FAR_48782_OFF
        WIN_KEY   4dh, EP_X_49EBA_SEG, EP_X_49EBA_OFF
        WIN_KEY_END
        db      00h
handler_ids_post:                       ; HANDLERS_POST: 18/19/16/17 -> 0x480F2/118/13E/164
        WIN_KEY   WIN_K_UP, EP_FIELD_NAV_UP_SEG, EP_FIELD_NAV_UP_OFF
        WIN_KEY   WIN_K_DOWN, EP_FIELD_NAV_DOWN_SEG, EP_FIELD_NAV_DOWN_OFF
        WIN_KEY   WIN_K_LEFT, EP_FIELD_NAV_LEFT_SEG, EP_FIELD_NAV_LEFT_OFF
        WIN_KEY   WIN_K_RIGHT, EP_FIELD_NAV_RIGHT_SEG, EP_FIELD_NAV_RIGHT_OFF
        WIN_KEY_END
        db      00h
handler_ids_numeric:                    ; HANDLERS_NUMERIC: 2B/2C wheel 35 digit 12/13 commit
        WIN_KEY   2bh, EP_FIELD_WHEEL_UP_SEG, EP_FIELD_WHEEL_UP_OFF
        WIN_KEY   2ch, EP_FIELD_WHEEL_DOWN_SEG, EP_FIELD_WHEEL_DOWN_OFF
        WIN_KEY   57h, EP_FIELD_DIGIT_CURSOR_DEC_SEG, EP_FIELD_DIGIT_CURSOR_DEC_OFF
        WIN_KEY   56h, EP_FIELD_DIGIT_CURSOR_INC_SEG, EP_FIELD_DIGIT_CURSOR_INC_OFF
        WIN_KEY   35h, EP_FIELD_DIGIT_ACCUMULATE_SEG, EP_FIELD_DIGIT_ACCUMULATE_OFF
        WIN_KEY   12h, EP_FIELD_DIGIT_COMMIT_SEG, EP_FIELD_DIGIT_COMMIT_OFF
        WIN_KEY   13h, EP_FIELD_DIGIT_ENTRY_RESET_SEG, EP_FIELD_DIGIT_ENTRY_RESET_OFF
        WIN_KEY_END
        if      FW_VERSION < 112
TBL_WINKEYS_FIELD_READONLY:
        endif
handler_ids_rdonly:                     ; HANDLERS_RDONLY: seven ids -> field_handler_nop_2
        if      FW_VERSION >= 112
TBL_WINKEYS_FIELD_READONLY:
        endif
        WIN_KEY   2bh, EP_FIELD_HANDLER_NOP_2_SEG, EP_FIELD_HANDLER_NOP_2_OFF
        WIN_KEY   2ch, EP_FIELD_HANDLER_NOP_2_SEG, EP_FIELD_HANDLER_NOP_2_OFF
        WIN_KEY   57h, EP_FIELD_HANDLER_NOP_2_SEG, EP_FIELD_HANDLER_NOP_2_OFF
        WIN_KEY   56h, EP_FIELD_HANDLER_NOP_2_SEG, EP_FIELD_HANDLER_NOP_2_OFF
        WIN_KEY   35h, EP_FIELD_HANDLER_NOP_2_SEG, EP_FIELD_HANDLER_NOP_2_OFF
        WIN_KEY   12h, EP_FIELD_HANDLER_NOP_2_SEG, EP_FIELD_HANDLER_NOP_2_OFF
        WIN_KEY   13h, EP_FIELD_HANDLER_NOP_2_SEG, EP_FIELD_HANDLER_NOP_2_OFF
        WIN_KEY_END
TBL_WINKEYS_59524:
        WIN_KEY   WIN_K_UP, EP_FIELD_NAV_UP_SEG, EP_FIELD_NAV_UP_OFF
        WIN_KEY   WIN_K_DOWN, EP_FIELD_NAV_DOWN_SEG, EP_FIELD_NAV_DOWN_OFF
        WIN_KEY   2bh, EP_L_47A80_SEG, EP_L_47A80_OFF
        WIN_KEY   2ch, EP_L_47A80_SEG, EP_L_47A80_OFF
        WIN_KEY   35h, EP_L_47A80_SEG, EP_L_47A80_OFF
        WIN_KEY   WIN_K_PAD, EP_L_47A80_SEG, EP_L_47A80_OFF
        WIN_KEY   WIN_K_RIGHT, EP_L_47A80_SEG, EP_L_47A80_OFF
        WIN_KEY   WIN_K_LEFT, EP_L_47A80_SEG, EP_L_47A80_OFF
        WIN_KEY_END
        db      00h
d_c2_tbl_012a2:
        db      0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah
        db      0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah
        db      0ah, 0ah, 0ah, 0ah, 00h
d_c2_tbl_012c6:
        dw      EP_FAR_4947C_OFF
d_c2_tbl_012c8:
        dw      EP_FAR_4947C_SEG
        dw      EP_FAR_49A84_OFF, EP_FAR_49A84_SEG
        dw      EP_FAR_49A8C_OFF, EP_FAR_49A8C_SEG
d_c2_tbl_012d2:
        dw      (C2_BASE+L_4782A-C1_SEG*16)
d_c2_tbl_012d4:
        dw      C1_SEG
        dw      EP_FAR_49A94_OFF, EP_FAR_49A94_SEG
        dw      EP_FAR_49A98_OFF, EP_FAR_49A98_SEG
        dw      EP_L_49A9C_OFF, EP_L_49A9C_SEG
        dw      EP_L_49AA0_OFF, EP_L_49AA0_SEG
        dw      EP_FAR_49AA4_OFF, EP_FAR_49AA4_SEG
TBL_WINKEYS_SAMPLE_RECORD:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F1, EP_SAMPLE_RECORD_RESET_PEAK_SEG, EP_SAMPLE_RECORD_RESET_PEAK_OFF
        WIN_KEY   WIN_K_F6, EP_SAMPLE_RECORD_RECORD_SEG, EP_SAMPLE_RECORD_RECORD_OFF
        WIN_KEY   WIN_K_PAINT, EP_SAMPLE_RECORD_PAINT_SEG, EP_SAMPLE_RECORD_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_SAMPLE_RECORD_OPEN_SEG, EP_SAMPLE_RECORD_OPEN_OFF
        WIN_KEY   33h, EP_SAMPLE_RECORD_KEY_33_SEG, EP_SAMPLE_RECORD_KEY_33_OFF
        WIN_KEY   WIN_K_REFRESH, EP_SAMPLE_RECORD_REFRESH_SEG, EP_SAMPLE_RECORD_REFRESH_OFF
        WIN_KEY_END
TBL_WINKEYS_SAMPLE_RECORD_WAIT:
        WIN_CLEAR
        WIN_END
        db      00h, 00h, 00h
        WIN_KEY   WIN_K_F5, EP_SAMPLE_RECORD_CANCEL_SEG, EP_SAMPLE_RECORD_CANCEL_OFF
        WIN_KEY   WIN_K_F6, EP_SAMPLE_RECORD_START_SEG, EP_SAMPLE_RECORD_START_OFF
        WIN_KEY   WIN_K_PAINT, EP_SAMPLE_RECORD_PAINT_SEG, EP_SAMPLE_RECORD_PAINT_OFF
        WIN_KEY   33h, EP_SAMPLE_RECORD_KEY_33_SEG, EP_SAMPLE_RECORD_KEY_33_OFF
        WIN_KEY   WIN_K_REFRESH, EP_SAMPLE_RECORD_REFRESH_SEG, EP_SAMPLE_RECORD_REFRESH_OFF
        WIN_KEY_END
        db      00h
TBL_WINKEYS_SAMPLE_RECORDING:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F5, EP_SAMPLE_RECORD_CANCEL_SEG, EP_SAMPLE_RECORD_CANCEL_OFF
        WIN_KEY   WIN_K_F6, EP_SAMPLE_RECORD_STOP_SEG, EP_SAMPLE_RECORD_STOP_OFF
        WIN_KEY   WIN_K_PAINT, EP_SAMPLE_RECORD_PAINT_SEG, EP_SAMPLE_RECORD_PAINT_OFF
        WIN_KEY   33h, EP_SAMPLE_RECORD_KEY_33_SEG, EP_SAMPLE_RECORD_KEY_33_OFF
        WIN_KEY   WIN_K_REFRESH, EP_SAMPLE_RECORD_REFRESH_SEG, EP_SAMPLE_RECORD_REFRESH_OFF
        WIN_KEY_END
        db      00h, 01h, 07h, 01h, 01h, 49h, 6eh, 70h
        db      75h, 74h, 3ah, 00h, 07h, 5bh, 01h
        db      "Mode:"
        db      00h, 07h, 0a9h, 01h
        db      "Monitor:"
        db      00h, 07h, 01h, 0ah
        db      "Threshold:"
        db      00h, 07h, 5bh, 0ah
        db      "Time:"
        db      00h, 07h, 97h, 0ah, 73h, 00h, 07h, 0a9h, 0ah
        db      "Pre-rec:___ms"
        db      00h, 00h
d_c2_w_013a8:
        db      11h, 02h, 33h, 49h, 09h, 07h, 09h
        db      "4RESET PEAK"
        db      00h, 00h
d_c2_w_013bc:
        db      07h, 01h
        db      "4Waiting for input signal..."
        db      00h, 1ah, 05h, 01h
        db      "CANCEL"
        db      00h, 1ah, 06h, 01h
        db      "START"
        db      00h, 00h, 00h
d_c2_w_013f0:
        db      07h, 01h
        db      "4Recording..."
        db      00h, 1ah, 05h, 01h
        db      "CANCEL"
        db      00h, 1ah, 06h, 01h
        db      "STOP"
        db      00h, 00h, 00h
d_c2_w_01414:
        db      07h, 55h, 15h
        db      "LEVEL METER"
        db      00h, 07h, 04h, 1eh
        db      "LEFT :"
        db      00h, 07h, 04h
        db      "'RIGHT:"
        db      00h, 00h
d_c2_w_01438:
        db      25h, 01h, 2ah, 01h, 01h, 40h, 00h, 00h, 00h
        db      00h
d_c2_w_01442:
        db      01h, 00h
d_c2_w_01444:
        db      00h, 00h
d_c2_tbl_01446:
        dw      EP_SAMPLE_RECORD_FOCUS_FIELD0_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD0_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_SAMPLE_RECORD_FOCUS_FIELD3_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD3_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_SAMPLE_RECORD_FOCUS_FIELD1_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD1_SEG
        dw      EP_FAR_48E40_OFF, EP_FAR_48E40_SEG
        db      00h, 00h, 00h
        db      00h
TBL_FIELDS_1438:                        ; 6 x FIELD_SIZE; the part of the array this .asm emits itself
        db      79h, 01h, 24h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 02h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_SAMPLE_RECORD_FOCUS_FIELD1_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD1_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_SAMPLE_RECORD_FOCUS_FIELD4_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD4_SEG
        dw      (C2_BASE+SAMPLE_RECORD_FOCUS_FIELD0-C1_SEG*16), C1_SEG, (C2_BASE+SAMPLE_RECORD_FOCUS_FIELD2-C1_SEG*16), C1_SEG, (C2_BASE+L_48E9C-C1_SEG*16), C1_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
d_c2_w_0148c:
        db      0d9h, 01h, 12h, 01h, 01h, 40h, 00h, 00h, 00h, 00h
d_c2_w_01496:
        db      05h, 00h
d_c2_w_01498:
        db      00h, 00h; [2] x,y,class,digits  STORE  MIN  MAX
        dw      EP_SAMPLE_RECORD_FOCUS_FIELD2_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD2_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_SAMPLE_RECORD_FOCUS_FIELD5_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD5_SEG
        if      FW_VERSION >= 110
        if      FW_VERSION >= 111
        dw      EP_SAMPLE_RECORD_FOCUS_FIELD1_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD1_SEG, EP_SAMPLE_RECORD_FOCUS_FIELD3_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD3_SEG, EP_L_48EFC_OFF, C1_SEG ; +1Ah..+21h  NOTIFY  ENTER
        else
        dw      EP_SAMPLE_RECORD_FOCUS_FIELD1_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD1_SEG
        db      5eh, 0adh, 76h, 3dh
        db      3eh
        db      0adh
        db      76h, 3dh
        endif
        db      00h, 00h, 00h, 00h
        else
        dw      EP_SAMPLE_RECORD_FOCUS_FIELD1_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD1_SEG
        db      62h, 0adh, 28h, 3dh, 42h, 0adh, 28h, 3dh, 00h, 00h, 00h, 00h
        endif
d_c2_w_014b6:
        db      3dh, 0ah, 12h, 02h, 02h, 80h, 0c0h, 0ffh, 0ffh, 0ffh, 00h, 00h, 00h, 00h ; [3] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 111
        dw      EP_SAMPLE_RECORD_FOCUS_FIELD3_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD3_SEG, EP_SAMPLE_RECORD_FOCUS_FIELD0_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD0_SEG ; THUNK  PREV  NEXT
        else
        if      FW_VERSION >= 110
        db      5eh, 0adh, 76h, 3dh
        else
        db      62h, 0adh, 28h, 3dh
        endif
        dw      EP_SAMPLE_RECORD_FOCUS_FIELD0_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD0_SEG
        endif
        db      00h, 00h, 00h, 00h
        dw      EP_SAMPLE_RECORD_FOCUS_FIELD2_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD2_SEG, EP_SAMPLE_RECORD_FOCUS_FIELD4_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD4_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_014e0:
        db      79h, 0ah, 1eh, 04h, 12h, 00h, 00h, 00h, 00h, 00h
d_c2_w_014ea:
        db      0fh, 27h
d_c2_w_014ec:
        db      00h, 00h; [4] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_SAMPLE_RECORD_FOCUS_FIELD4_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD4_SEG, EP_SAMPLE_RECORD_FOCUS_FIELD1_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD1_SEG, EP_SAMPLE_RECORD_FOCUS_FIELD0_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD0_SEG ; THUNK  PREV  NEXT
        dw      EP_SAMPLE_RECORD_FOCUS_FIELD3_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD3_SEG, EP_SAMPLE_RECORD_FOCUS_FIELD5_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD5_SEG ; +1Ah..+21h  NOTIFY  ENTER
        else
        dw      EP_SAMPLE_RECORD_FOCUS_FIELD4_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD4_SEG
        dw      EP_SAMPLE_RECORD_FOCUS_FIELD1_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD1_SEG
        if      FW_VERSION >= 111
        db      64h, 0ach, 86h, 3dh
        else
        dw      EP_SAMPLE_RECORD_FOCUS_FIELD0_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD0_SEG
        endif
        dw      EP_SAMPLE_RECORD_FOCUS_FIELD3_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD3_SEG
        dw      EP_SAMPLE_RECORD_FOCUS_FIELD5_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD5_SEG
        endif
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_0150a:
        db      0d9h, 0ah, 12h, 03h, 02h, 00h, 00h
        db      00h, 00h, 00h, 64h, 00h, 00h, 00h
        dw      EP_SAMPLE_RECORD_FOCUS_FIELD5_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD5_SEG
        dw      EP_SAMPLE_RECORD_FOCUS_FIELD2_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD2_SEG
        db      00h
        db      00h, 00h, 00h
        dw      EP_SAMPLE_RECORD_FOCUS_FIELD4_OFF, EP_SAMPLE_RECORD_FOCUS_FIELD4_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h
d_c2_tbl_01534:
        db      0d0h, 0d6h, 0dch, 0dfh, 0e2h, 0e4h, 0e5h, 0e7h, 0e8h, 0e9h, 0eah, 0ebh, 0ebh
        db      0ech, 0edh, 0edh, 0eeh, 0eeh, 0efh, 0efh, 0f0h, 0f0h, 0f1h, 0f1h, 0f1h, 0f2h, 0f2h, 0f2h, 0f3h
        db      0f3h, 0f3h, 0f4h, 0f4h, 0f4h, 0f4h, 0f5h, 0f5h, 0f5h, 0f5h, 0f6h, 0f6h, 0f6h, 0f6h, 0f7h, 0f7h
        db      0f7h, 0f7h, 0f7h, 0f7h, 0f8h, 0f8h, 0f8h, 0f8h, 0f8h, 0f9h, 0f9h, 0f9h, 0f9h, 0f9h, 0f9h, 0f9h
        db      0fah, 0fah, 0fah, 0fah, 0fah, 0fah, 0fah, 0fbh, 0fbh, 0fbh, 0fbh, 0fbh, 0fbh, 0fbh, 0fbh, 0fbh
        db      0fch, 0fch, 0fch, 0fch, 0fch, 0fch, 0fch, 0fch, 0fch, 0fdh, 0fdh, 0fdh, 0fdh, 0fdh, 0fdh, 0fdh
        db      0fdh, 0fdh, 0fdh, 0feh, 0feh, 0feh, 0feh, 0feh, 0feh, 0feh, 0feh, 0feh, 0feh, 0feh, 0feh, 0ffh
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 10h, 00h, 01h, 00h, 10h, 14h, 11h, 10h, 00h, 00h
        db      0f0h, 40h, 11h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 10h, 00h, 01h, 00h, 10h, 0ffh, 0ffh, 1fh, 00h, 00h, 0f0h, 40h, 11h, 00h
        db      00h, 00h, 00h, 0e1h, 02h, 1ah, 74h, 0ffh, 0ffh, 0ffh, 3fh, 47h, 01h, 0f0h, 7fh, 80h
        db      80h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_0160c:
        db      00h, 00h
TBL_WINKEYS_SOUND_MEMORY:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_PAINT, EP_SOUND_MEMORY_PAINT_SEG, EP_SOUND_MEMORY_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_SOUND_MEMORY_CLOSE_SEG, EP_SOUND_MEMORY_CLOSE_OFF
        WIN_KEY   WIN_K_F4, EP_SOUND_MEMORY_CLOSE_SEG, EP_SOUND_MEMORY_CLOSE_OFF
        WIN_KEY_END
        db      00h
d_c2_w_01628:
        db      1ah, 04h, 02h, 43h, 4ch, 4fh, 53h, 45h, 00h
        db      07h, 31h, 0ch
        db      "Free memory(time):"
        db      00h, 07h, 0bbh, 0ch, 73h, 65h, 63h, 00h, 07h
        db      "O(Megabytes instal"
        db      6ch, 65h, 64h, 00h, 11h, 17h, 19h, 0c8h, 0ah, 0bh, 16h, 17h, 0cah, 0bh, 16h, 24h
        db      0cah, 0eh, 15h, 18h, 0ch, 0eh, 0e0h, 18h, 0dh, 0bh, 17h, 25h, 0cah, 0eh, 0e1h, 19h
        db      0ch, 00h, 00h
d_c2_w_01684:
        db      0ch, 17h, 1ah
d_c2_b_01687:
        db      0c8h, 0ch, 18h, 1bh
d_c2_b_0168b:
        db      0c7h, 0ch, 17h, 1ch
d_c2_b_0168f:
        db      0c8h, 0ch
        db      18h, 1dh
d_c2_b_01693:
        db      0c7h, 0ch, 17h, 1eh
d_c2_b_01697:
        db      0c8h, 0ch, 18h, 1fh
d_c2_b_0169b:
        db      0c7h, 0ch, 17h, 20h
d_c2_b_0169f:
        db      0c8h, 0ch
        db      18h, 21h
d_c2_b_016a3:
        db      0c7h, 00h, 00h
d_c2_w_016a6:
        db      01h, 00h, 00h, 00h, 00h, 03h
        dw      EP_FAR_49C88_OFF, EP_FAR_49C88_SEG
        db      05h
        dw      EP_L_493B2_OFF, EP_L_493B2_SEG
        db      85h
        dw      EP_FAR_49D2A_OFF, EP_FAR_49D2A_SEG
TBL_WINKEYS_KEEP_OR_RETRY:
        WIN_KEY   WIN_K_F5, EP_KEEP_OR_RETRY_F5_SEG, EP_KEEP_OR_RETRY_F5_OFF
        WIN_KEY   WIN_K_PAINT, EP_KEEP_OR_RETRY_PAINT_SEG, EP_KEEP_OR_RETRY_PAINT_OFF
        WIN_KEY   WIN_K_REFRESH, EP_KEEP_OR_RETRY_REFRESH_SEG, EP_KEEP_OR_RETRY_REFRESH_OFF
        WIN_KEY_END
d_c2_w_016ce:
        db      1ah, 02h, 01h
        db      52h, 45h, 54h, 52h, 59h, 00h
        WIN_SOFTKEY 4, 1, "PLAY"
        WIN_SOFTKEY 5, 1, "KEEP"
        WIN_LABEL 13h, 13h, "Name for new sound:"
        WIN_LABEL 2bh, 25h, "Assign to note:"
        WIN_END
d_c2_w_01712:
        db      85h, 13h, 60h, 01h, 00h, 41h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_tbl_01720:
        dw      EP_L_49E60_OFF, EP_L_49E60_SEG
        db      00h, 00h, 00h, 00h
        dw      (C2_BASE+L_49E84-C1_SEG*16), C1_SEG
        db      00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h
        dw      EP_NAME_FIELD_ENTER_OFF, EP_NAME_FIELD_ENTER_SEG
        db      00h, 00h, 00h, 00h
TBL_FIELDS_1712:                        ; 2 x FIELD_SIZE; the part of the array this .asm emits itself
        db      85h, 25h, 24h, 02h, 01h, 00h, 22h, 00h, 00h, 00h, 62h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      (C2_BASE+L_49E84-C1_SEG*16), C1_SEG, (C2_BASE+L_49E60-C1_SEG*16), C1_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        db      01h, 00h, 00h, 00h, 00h, 02h
        dw      EP_L_4A56A_OFF, EP_L_4A56A_SEG
        db      42h
        dw      EP_FAR_4A006_OFF, EP_FAR_4A006_SEG
        db      03h
        dw      EP_LOOP_SCREEN_DRAW_OFF, EP_LOOP_SCREEN_DRAW_SEG
        db      04h
        dw      EP_FAR_4D36C_OFF, EP_FAR_4D36C_SEG
        db      05h
        dw      (C2_BASE+far_4BD70-C1_SEG*16), C1_SEG
        db      32h
        dw      EP_FAR_49822_OFF, EP_FAR_49822_SEG
        db      00h, 00h, 00h, 00h, 00h, 06h
        dw      EP_FAR_49F86_OFF, EP_FAR_49F86_SEG
        db      07h
        if      FW_VERSION >= 112
        dw      EP_FAR_3C214_OFF, C0_SEG
        else
        dw      EP_C0_66DA_OFF, C0_SEG
        endif
        db      87h
        dw      EP_L_3B8F2_OFF, EP_L_3B8F2_SEG
TBL_WINKEYS_TRIM:
        WIN_KEY   33h, EP_TRIM_SCREEN_KEY_33_SEG, EP_TRIM_SCREEN_KEY_33_OFF
        WIN_KEY   WIN_K_OPEN, EP_TRIM_SCREEN_OPEN_SEG, EP_TRIM_SCREEN_OPEN_OFF
        WIN_KEY   WIN_K_PAD, EP_SOUND_PAD_PLAY_SEG, EP_SOUND_PAD_PLAY_OFF
        WIN_KEY   WIN_K_REFRESH, EP_TRIM_SCREEN_REFRESH_SEG, EP_TRIM_SCREEN_REFRESH_OFF
        WIN_KEY_END
        WIN_CLEAR
        WIN_SOFTKEY 1, 0, "TRIM"
        WIN_SOFTKEY 2, 2, "LOOP"
        WIN_SOFTKEY 3, 2, "ZONE"
        WIN_SOFTKEY 4, 2, "PARAMS"
        WIN_LABEL 9dh, 01h, "PLAY X:"
        WIN_RULE  0bh, 01h, 14h, 0f6h
        WIN_LABEL 08h, 0ch, "St:"
        WIN_LABEL 62h, 0ch, "End:"
        WIN_LABEL 0b6h, 0ch, "View:"
        WIN_END
        db      00h
d_c2_w_01802:
        db      1ah, 02h, 78h, 01h, 00h, 42h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_tbl_01810:
        dw      EP_TRIM_FOCUS_SOUND_OFF, EP_TRIM_FOCUS_SOUND_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_TRIM_FOCUS_START_OFF, EP_TRIM_FOCUS_START_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_TRIM_FOCUS_PLAY_X_OFF, EP_TRIM_FOCUS_PLAY_X_SEG
        dw      (C2_BASE+far_4A176-C1_SEG*16), C1_SEG
d_c2_tbl_01828:
        if      FW_VERSION >= 112
        dw      EP_FAR_4A182_OFF
d_c2_tbl_0182a:
        dw      C1_SEG
        else
        dw      EP_FAR_49824_OFF
d_c2_tbl_0182a:
        dw      C1_SEG
        endif
TBL_FIELDS_182C:                        ; 4 x FIELD_SIZE
        db      0c7h, 01h, 30h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 04h, 00h, 00h, 00h ; [0] x,y,class,digits  STORE  MIN  MAX
        dw      EP_TRIM_FOCUS_PLAY_X_OFF, EP_TRIM_FOCUS_PLAY_X_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_TRIM_FOCUS_VIEW_OFF, EP_TRIM_FOCUS_VIEW_SEG
        dw      EP_TRIM_FOCUS_SOUND_OFF, EP_TRIM_FOCUS_SOUND_SEG, EP_TRIM_FOCUS_START_OFF, EP_TRIM_FOCUS_START_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_01856:
        db      1ah, 0ch, 30h, 08h, 04h, 10h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      (C2_BASE+TRIM_FOCUS_START-C1_SEG*16), C1_SEG, (C2_BASE+TRIM_FOCUS_SOUND-C1_SEG*16), C1_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_TRIM_FOCUS_PLAY_X_OFF, EP_TRIM_FOCUS_PLAY_X_SEG, EP_TRIM_FOCUS_END_OFF, EP_TRIM_FOCUS_END_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_L_4AF92_OFF, EP_L_4AF92_SEG
d_c2_w_01880:
        db      7ah, 0ch, 30h, 08h, 04h, 10h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        dw      EP_TRIM_FOCUS_END_OFF, EP_TRIM_FOCUS_END_SEG, EP_TRIM_FOCUS_SOUND_OFF, EP_TRIM_FOCUS_SOUND_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_TRIM_FOCUS_START_OFF, EP_TRIM_FOCUS_START_SEG, EP_TRIM_FOCUS_VIEW_OFF, EP_TRIM_FOCUS_VIEW_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_L_4B3B2_OFF, EP_L_4B3B2_SEG
d_c2_w_018aa:
        db      0d4h, 0ch, 1eh, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h ; [3] x,y,class,digits  STORE  MIN  MAX
        dw      EP_TRIM_FOCUS_VIEW_OFF, EP_TRIM_FOCUS_VIEW_SEG, EP_TRIM_FOCUS_PLAY_X_OFF, EP_TRIM_FOCUS_PLAY_X_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_TRIM_FOCUS_END_OFF, EP_TRIM_FOCUS_END_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_L_4A1EA_OFF, EP_L_4A1EA_SEG
        db      00h, 00h, 00h, 00h
d_c2_w_018d4:
        db      00h, 00h
d_c2_tbl_018d6:
        dw      (C1_BASE+sound_cmp_name-C1_SEG*16)
d_c2_tbl_018d8:
        dw      C1_SEG
        dw      EP_SOUND_CMP_SIZE_OFF, EP_SOUND_CMP_SIZE_SEG
        dw      EP_FAR_4029A_OFF, EP_FAR_4029A_SEG
        if      FW_VERSION >= 112
        db      "NAME"
        else
        db      4eh, 41h, 4dh, 45h
        endif
        db      00h, 00h, 00h
        db      "SIZE"
        db      00h, 00h, 00h, 4dh
        if      FW_VERSION >= 110
        if      FW_VERSION >= 112
        db      "EMORY"
        db      00h, 00h
        if      FW_VERSION >= 114
d_c2_tbl_018f8:
        dw      (C2_BASE+far_4A030-C1_SEG*16)
d_c2_tbl_018fa:
        dw      C1_SEG
        dw      (C2_BASE+L_4AF6E-C1_SEG*16), C1_SEG
        else
d_c2_tbl_018f8:
        dw      (C2_BASE+L_4A76A-C1_SEG*16)
d_c2_tbl_018fa:
        dw      C1_SEG, (C2_BASE+L_4A76E-C1_SEG*16), C1_SEG
        endif
        else
        db      45h, 4dh, 4fh, 52h, 59h, 00h, 00h
d_c2_tbl_018f8:
        dw      (C2_BASE+L_4A76A-C1_SEG*16)
d_c2_tbl_018fa:
        dw      C1_SEG
        if      FW_VERSION >= 111
        db      0b0h, 0cdh, 86h, 3dh
        else
        db      0b0h, 0cdh, 76h, 3dh
        endif
        endif
        dw      (C2_BASE+L_4AF74-C1_SEG*16), C1_SEG
        else
        db      45h, 4dh, 4fh, 52h, 59h, 00h, 00h
d_c2_tbl_018f8:
        dw      (C2_BASE+L_4A76A-C1_SEG*16)
d_c2_tbl_018fa:
        dw      C1_SEG
        db      0b4h, 0cdh, 28h, 3dh, 0bah
        db      0cdh, 28h, 3dh
        endif
        dw      EP_FAR_4AF7E_OFF, EP_FAR_4AF7E_SEG
        if      FW_VERSION >= 110
        dw      EP_FAR_4AF88_OFF, EP_FAR_4AF88_SEG
d_c2_w_0190c:
        db      01h, 00h, 00h, 00h, 00h
        else
        db      0ceh, 0cdh, 28h, 3dh
d_c2_w_0190c:
        db      01h, 00h, 00h, 00h, 00h
        endif
        db      03h
        dw      EP_FAR_4AFFC_OFF, EP_FAR_4AFFC_SEG
        db      04h
        dw      EP_L_4AFD2_OFF, EP_L_4AFD2_SEG
        db      05h
        dw      EP_START_FINE_OPEN_OFF, EP_START_FINE_OPEN_SEG
        db      06h
        if      FW_VERSION >= 112
        dw      EP_FAR_3C214_OFF, C0_SEG
        else
        dw      EP_C0_66DA_OFF, C0_SEG
        endif
        db      86h
        dw      EP_L_3B8F2_OFF, EP_L_3B8F2_SEG
TBL_WINKEYS_START_FINE:
        WIN_KEY   WIN_K_PAD, EP_SOUND_PAD_PLAY_SEG, EP_SOUND_PAD_PLAY_OFF
        WIN_KEY   WIN_K_PAINT, EP_START_FINE_PAINT_SEG, EP_START_FINE_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_START_FINE_OPEN_SEG, EP_START_FINE_OPEN_OFF
        WIN_KEY   WIN_K_REFRESH, EP_START_FINE_REFRESH_SEG, EP_START_FINE_REFRESH_OFF
        WIN_KEY_END
        db      00h
d_c2_w_01944:
        db      1ah, 02h, 01h, 5ah, 4fh, 4fh, 4dh, 2dh, 00h, 1ah, 03h, 01h, 5ah
        db      "OOM+"
        db      00h, 1ah, 04h, 02h
        db      "CLOSE"
        db      00h, 1ah, 05h, 01h
        db      "PLAY X"
        db      00h, 07h, 91h, 0ch
        db      "Start:"
        db      00h, 07h, 91h, 15h
        db      "Lngth="
        db      00h, 07h, 8bh, 1fh
        db      "Smpl Lngth:"
        db      00h, 07h, 8bh, 28h, 50h, 4ch
        db      41h, 59h, 20h, 58h, 3ah, 00h, 00h
d_c2_w_01998:
        db      0b5h, 0ch, 30h, 08h, 04h, 10h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h
d_c2_tbl_019a6:
        dw      EP_L_4B110_OFF, EP_L_4B110_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_L_4B13C_OFF, EP_L_4B13C_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_L_4B124_OFF, EP_L_4B124_SEG
        db      00h, 00h, 00h
        db      00h
TBL_FIELDS_1998:                        ; 3 x FIELD_SIZE; the part of the array this .asm emits itself
        db      0cdh, 1fh, 18h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_L_4B13C_OFF, EP_L_4B13C_SEG, EP_L_4B110_OFF, EP_L_4B110_SEG, EP_L_4B154_OFF, EP_L_4B154_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
d_c2_w_019ec:
        db      0b5h, 28h, 30h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 04h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        dw      EP_L_4B154_OFF, EP_L_4B154_SEG, EP_L_4B13C_OFF, EP_L_4B13C_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
d_c2_w_01a16:
        db      01h, 00h, 00h, 00h, 00h, 03h
        dw      EP_L_4AABE_OFF, EP_L_4AABE_SEG
        db      04h
        dw      EP_FAR_4B3F2_OFF, EP_FAR_4B3F2_SEG
        db      05h
        dw      EP_END_FINE_OPEN_OFF, EP_END_FINE_OPEN_SEG
        db      06h
        if      FW_VERSION >= 112
        dw      EP_FAR_3C214_OFF, C0_SEG
        else
        dw      EP_C0_66DA_OFF, C0_SEG
        endif
        db      86h
        dw      EP_L_3B8F2_OFF, EP_L_3B8F2_SEG
TBL_WINKEYS_END_FINE:
        WIN_KEY   WIN_K_PAD, EP_SOUND_PAD_PLAY_SEG, EP_SOUND_PAD_PLAY_OFF
        WIN_KEY   WIN_K_PAINT, EP_END_FINE_PAINT_SEG, EP_END_FINE_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_END_FINE_OPEN_SEG, EP_END_FINE_OPEN_OFF
        WIN_KEY   WIN_K_REFRESH, EP_END_FINE_REFRESH_SEG, EP_END_FINE_REFRESH_OFF
        WIN_KEY_END
        db      00h
d_c2_w_01a4e:
        db      1ah, 02h, 01h
        db      "ZOOM-"
        db      00h, 1ah, 03h, 01h
        db      "ZOOM+"
        db      00h, 1ah, 04h, 02h
        db      "CLOSE"
        db      00h, 1ah, 05h, 01h
        db      "PLAY X"
        db      00h, 07h, 9dh, 0ch
        db      "End:"
        db      00h, 07h, 91h, 15h
        db      "Lngth="
        db      00h, 07h, 8bh, 1fh
        db      "Smpl Lngth:"
        db      00h, 07h, 8bh
        db      "(PLAY X:"
        db      00h, 00h
d_c2_w_01aa0:
        db      0b5h
        db      0ch, 30h, 08h, 04h, 10h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_tbl_01aae:
        dw      EP_L_4B530_OFF, EP_L_4B530_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_L_4B55C_OFF, EP_L_4B55C_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h
        dw      EP_L_4B544_OFF, EP_L_4B544_SEG
        db      00h, 00h, 00h, 00h
TBL_FIELDS_1AA0:                        ; 3 x FIELD_SIZE; the part of the array this .asm emits itself
        db      0cdh, 1fh, 18h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_L_4B55C_OFF, EP_L_4B55C_SEG, EP_L_4B530_OFF, EP_L_4B530_SEG, EP_L_4B574_OFF, EP_L_4B574_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
d_c2_w_01af4:
        db      0b5h, 28h, 30h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 04h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        dw      EP_L_4B574_OFF, EP_L_4B574_SEG, EP_L_4B55C_OFF, EP_L_4B55C_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
d_c2_w_01b1e:
        db      01h, 00h, 00h
        db      00h, 00h, 03h
        dw      EP_FAR_4B62A_OFF, EP_FAR_4B62A_SEG
        db      04h
        dw      EP_FAR_4B5F6_OFF, EP_FAR_4B5F6_SEG
        db      05h
        dw      EP_LOOP_FINE_CLOSE_OFF, EP_LOOP_FINE_CLOSE_SEG
        db      06h
        if      FW_VERSION >= 112
        dw      EP_FAR_3C214_OFF, C0_SEG
        else
        dw      EP_C0_66DA_OFF, C0_SEG
        endif
        db      86h
        dw      EP_L_3B8F2_OFF, EP_L_3B8F2_SEG
TBL_WINKEYS_LOOP_FINE:
        WIN_KEY   WIN_K_PAD, EP_SOUND_PAD_PLAY_SEG, EP_SOUND_PAD_PLAY_OFF
        WIN_KEY   WIN_K_PAINT, EP_LOOP_FINE_PAINT_SEG, EP_LOOP_FINE_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_LOOP_FINE_CLOSE_SEG, EP_LOOP_FINE_CLOSE_OFF
        WIN_KEY   WIN_K_REFRESH, EP_LOOP_FINE_REFRESH_SEG, EP_LOOP_FINE_REFRESH_OFF
        WIN_KEY_END
        db      00h
d_c2_w_01b56:
        db      1ah, 02h, 01h, 5ah, 4fh, 4fh, 4dh, 2dh, 00h, 1ah, 03h
        db      01h
        db      "ZOOM+"
        db      00h, 1ah, 04h, 02h
        db      "CLOSE"
        db      00h, 1ah, 05h, 01h
        db      "PLAY X"
        db      00h, 07h, 0a3h, 0ch, 54h, 6fh, 3ah, 00h, 07h, 91h, 15h
        db      "Lngth:"
        db      00h, 07h, 8bh, 1fh
        db      "Loop Lngth:"
        db      00h, 07h, 8bh
        db      "(PLA"
        db      59h, 20h, 58h, 3ah, 00h, 00h, 00h
d_c2_w_01ba8:
        db      0b5h, 0ch, 30h, 08h, 04h, 10h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h
d_c2_tbl_01bb6:
        dw      EP_L_4B752_OFF, EP_L_4B752_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_L_4B788_OFF, EP_L_4B788_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_FAR_4B766_OFF, EP_FAR_4B766_SEG
        db      00h, 00h, 00h
        db      00h
TBL_FIELDS_1BA8:                        ; 4 x FIELD_SIZE; the part of the array this .asm emits itself
        db      0b5h, 15h, 30h, 08h, 04h, 10h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_L_4B788_OFF, EP_L_4B788_SEG, EP_L_4B752_OFF, EP_L_4B752_SEG, EP_L_4B7BE_OFF, EP_L_4B7BE_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_L_4B79C_OFF, EP_L_4B79C_SEG
        db      00h, 00h, 00h, 00h
d_c2_w_01bfc:
        db      0cdh, 1fh, 18h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        dw      EP_L_4B7BE_OFF, EP_L_4B7BE_SEG, EP_L_4B788_OFF, EP_L_4B788_SEG, EP_L_4B7D6_OFF, EP_L_4B7D6_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
d_c2_w_01c26:
        db      0b5h, 28h, 30h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 04h, 00h, 00h, 00h ; [3] x,y,class,digits  STORE  MIN  MAX
        dw      EP_L_4B7D6_OFF, EP_L_4B7D6_SEG, EP_L_4B7BE_OFF, EP_L_4B7BE_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
d_c2_w_01c50:
        db      01h
        db      00h, 00h, 00h, 00h, 03h
        dw      EP_FAR_4B866_OFF, EP_FAR_4B866_SEG
        db      04h
        dw      EP_FAR_4B83C_OFF, EP_FAR_4B83C_SEG
        db      05h
        dw      EP_LOOP_END_FINE_OPEN_OFF, EP_LOOP_END_FINE_OPEN_SEG
        db      06h
        if      FW_VERSION >= 112
        dw      EP_FAR_3C214_OFF, C0_SEG
        else
        dw      EP_C0_66DA_OFF, C0_SEG
        endif
        db      86h
        dw      EP_L_3B8F2_OFF, EP_L_3B8F2_SEG
TBL_WINKEYS_LOOP_END_FINE:
        WIN_KEY   WIN_K_PAD, EP_SOUND_PAD_PLAY_SEG, EP_SOUND_PAD_PLAY_OFF
        WIN_KEY   WIN_K_PAINT, EP_LOOP_END_FINE_PAINT_SEG, EP_LOOP_END_FINE_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_LOOP_END_FINE_OPEN_SEG, EP_LOOP_END_FINE_OPEN_OFF
        WIN_KEY   WIN_K_REFRESH, EP_LOOP_END_FINE_REFRESH_SEG, EP_LOOP_END_FINE_REFRESH_OFF
        WIN_KEY_END
        db      00h
d_c2_w_01c88:
        db      1ah, 02h, 01h, 5ah, 4fh, 4fh, 4dh, 2dh, 00h
        db      1ah, 03h, 01h
        db      "ZOOM+"
        db      00h, 1ah, 04h, 02h
        db      "CLOSE"
        db      00h, 1ah, 05h, 01h
        db      "PLAY X"
        db      00h, 07h, 9dh, 0ch
        db      "End:"
        db      00h, 07h, 91h, 15h
        db      "Lngth:"
        db      00h, 07h, 8bh, 1fh
        db      "Loop Lngth:"
        db      00h, 07h, 8bh
        db      "(PLAY X:"
        db      00h, 00h
d_c2_w_01cda:
        db      0b5h, 0ch, 30h, 08h, 04h, 10h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_tbl_01ce8:
        dw      EP_L_4B970_OFF, EP_L_4B970_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_L_4B99C_OFF, EP_L_4B99C_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_FAR_4B984_OFF, EP_FAR_4B984_SEG
        db      00h
        db      00h, 00h, 00h
TBL_FIELDS_1CDA:                        ; 4 x FIELD_SIZE; the part of the array this .asm emits itself
        db      0b5h, 15h, 30h, 08h, 04h, 10h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 111
        dw      EP_L_4B99C_OFF, EP_L_4B99C_SEG, EP_L_4B970_OFF, EP_L_4B970_SEG, EP_L_4B9C8_OFF, EP_L_4B9C8_SEG ; THUNK  PREV  NEXT
        else
        if      FW_VERSION >= 110
        db      0deh, 0d7h, 76h, 3dh
        else
        db      0e2h, 0d7h, 28h, 3dh
        endif
        dw      EP_L_4B970_OFF, EP_L_4B970_SEG
        dw      EP_L_4B9C8_OFF, EP_L_4B9C8_SEG
        endif
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_L_4B9B0_OFF, EP_L_4B9B0_SEG
        db      00h, 00h, 00h, 00h
d_c2_w_01d2e:
        db      0cdh, 1fh, 18h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_L_4B9C8_OFF, EP_L_4B9C8_SEG, EP_L_4B99C_OFF, EP_L_4B99C_SEG, EP_L_4B9E0_OFF, EP_L_4B9E0_SEG ; THUNK  PREV  NEXT
        else
        dw      EP_L_4B9C8_OFF, EP_L_4B9C8_SEG
        dw      EP_L_4B99C_OFF, EP_L_4B99C_SEG
        dw      (C2_BASE+L_4B9E0-C1_SEG*16), C1_SEG
        endif
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
d_c2_w_01d58:
        db      0b5h, 28h, 30h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 04h, 00h, 00h, 00h ; [3] x,y,class,digits  STORE  MIN  MAX
        dw      EP_L_4B9E0_OFF, EP_L_4B9E0_SEG, EP_L_4B9C8_OFF, EP_L_4B9C8_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        db      01h, 00h, 00h, 00h, 00h, 02h
        dw      EP_TRIM_SCREEN_DRAW_OFF, EP_TRIM_SCREEN_DRAW_SEG
        db      03h
        dw      EP_L_4A56A_OFF, EP_L_4A56A_SEG
        if      FW_VERSION >= 110
        db      43h
        dw      EP_FAR_4BAA8_OFF, EP_FAR_4BAA8_SEG
        db      04h
        else
        db      43h, 0eeh, 0d8h, 28h, 3dh, 04h
        endif
        dw      EP_FAR_4D36C_OFF, EP_FAR_4D36C_SEG
        db      05h
        dw      EP_FAR_4BD70_OFF, EP_FAR_4BD70_SEG
        db      32h
        dw      EP_FAR_4BAF8_OFF, EP_FAR_4BAF8_SEG
        db      00h, 00h, 00h, 00h, 00h, 06h
        dw      EP_FAR_4BA54_OFF, EP_FAR_4BA54_SEG
        db      07h
        if      FW_VERSION >= 112
        dw      EP_FAR_3C214_OFF, C0_SEG
        else
        dw      EP_C0_66DA_OFF, C0_SEG
        endif
        db      87h
        dw      EP_L_3B8F2_OFF, EP_L_3B8F2_SEG
TBL_WINKEYS_LOOP:
        WIN_KEY   WIN_K_PAD, EP_SOUND_PAD_PLAY_SEG, EP_SOUND_PAD_PLAY_OFF
        WIN_KEY   33h, EP_LOOP_SCREEN_KEY_33_SEG, EP_LOOP_SCREEN_KEY_33_OFF
        WIN_KEY   WIN_K_OPEN, EP_LOOP_SCREEN_OPEN_SEG, EP_LOOP_SCREEN_OPEN_OFF
        WIN_KEY   WIN_K_REFRESH, EP_LOOP_SCREEN_REFRESH_SEG, EP_LOOP_SCREEN_REFRESH_OFF
        WIN_KEY_END
d_c2_w_01dd2:
        WIN_CLEAR
        WIN_SOFTKEY 1, 2, "TRIM"
        WIN_SOFTKEY 2, 0, "LOOP"
        WIN_SOFTKEY 3, 2, "ZONE"
        WIN_SOFTKEY 4, 2, "PARAMS"
        WIN_LABEL 9dh, 01h, "PLAY X:"
        WIN_RULE  0bh, 01h, 14h, 0f6h
        WIN_LABEL 08h, 0ch, "To:"
        WIN_LABEL 0b6h, 0ch, "Loop:"
        WIN_END
        db      00h
d_c2_w_01e16:
        db      1ah, 02h, 78h, 01h, 00h, 42h, 01h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h
d_c2_tbl_01e24:
        dw      EP_LOOP_FOCUS_SOUND_OFF, EP_LOOP_FOCUS_SOUND_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_LOOP_FOCUS_TO_OFF, EP_LOOP_FOCUS_TO_SEG
        db      00h
        db      00h, 00h, 00h
        dw      EP_LOOP_FOCUS_PLAY_X_OFF, EP_LOOP_FOCUS_PLAY_X_SEG
        dw      EP_FAR_4BC9E_OFF, EP_FAR_4BC9E_SEG
d_c2_tbl_01e3c:
        dw      EP_FAR_4BCAA_OFF
d_c2_tbl_01e3e:
        dw      EP_FAR_4BCAA_SEG
TBL_FIELDS_1E40:                        ; 5 x FIELD_SIZE
        db      0c7h, 01h, 30h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 04h, 00h, 00h, 00h ; [0] x,y,class,digits  STORE  MIN  MAX
        dw      EP_LOOP_FOCUS_PLAY_X_OFF, EP_LOOP_FOCUS_PLAY_X_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_LOOP_FOCUS_LOOP_ON_OFF, EP_LOOP_FOCUS_LOOP_ON_SEG
        dw      EP_LOOP_FOCUS_SOUND_OFF, EP_LOOP_FOCUS_SOUND_SEG, EP_LOOP_FOCUS_TO_OFF, EP_LOOP_FOCUS_TO_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_01e6a:
        db      1ah, 0ch, 30h, 08h, 04h, 10h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_LOOP_FOCUS_TO_OFF, EP_LOOP_FOCUS_TO_SEG, EP_LOOP_FOCUS_SOUND_OFF, EP_LOOP_FOCUS_SOUND_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_LOOP_FOCUS_PLAY_X_OFF, EP_LOOP_FOCUS_PLAY_X_SEG, EP_LOOP_FOCUS_LOCK_OFF, EP_LOOP_FOCUS_LOCK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_L_4AF96_OFF, EP_L_4AF96_SEG
d_c2_w_01e94:
        db      56h, 0ch, 1eh, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        dw      EP_LOOP_FOCUS_LOCK_OFF, EP_LOOP_FOCUS_LOCK_SEG, EP_LOOP_FOCUS_SOUND_OFF, EP_LOOP_FOCUS_SOUND_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_LOOP_FOCUS_TO_OFF, EP_LOOP_FOCUS_TO_SEG, EP_LOOP_FOCUS_LENGTH_OFF, EP_LOOP_FOCUS_LENGTH_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        if      FW_VERSION >= 110
        dw      EP_L_4B7FC_OFF, C1_SEG
        else
        dw      EP_FAR_4A8C2_OFF, C1_SEG
        endif
d_c2_w_01ebe:
        db      7ah, 0ch, 30h, 08h, 04h, 10h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [3] x,y,class,digits  STORE  MIN  MAX
        dw      EP_LOOP_FOCUS_LENGTH_OFF, EP_LOOP_FOCUS_LENGTH_SEG, EP_LOOP_FOCUS_SOUND_OFF, EP_LOOP_FOCUS_SOUND_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_LOOP_FOCUS_LOCK_OFF, EP_LOOP_FOCUS_LOCK_SEG, EP_LOOP_FOCUS_LOOP_ON_OFF, EP_LOOP_FOCUS_LOOP_ON_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        if      FW_VERSION >= 110
        dw      EP_L_4B7FC_OFF, C1_SEG
        else
        dw      EP_FAR_4A8C2_OFF, C1_SEG
        endif
d_c2_w_01ee8:
        db      0d4h, 0ch, 12h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h ; [4] x,y,class,digits  STORE  MIN  MAX
        dw      EP_LOOP_FOCUS_LOOP_ON_OFF, EP_LOOP_FOCUS_LOOP_ON_SEG, EP_LOOP_FOCUS_PLAY_X_OFF, EP_LOOP_FOCUS_PLAY_X_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_LOOP_FOCUS_LENGTH_OFF, EP_LOOP_FOCUS_LENGTH_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      01h, 00h, 00h, 00h, 00h, 02h
        dw      EP_TRIM_SCREEN_DRAW_OFF, EP_TRIM_SCREEN_DRAW_SEG
        db      03h
        dw      EP_LOOP_SCREEN_DRAW_OFF, EP_LOOP_SCREEN_DRAW_SEG
        db      04h
        dw      EP_FAR_4D36C_OFF, EP_FAR_4D36C_SEG
        db      05h
        dw      EP_L_4A56A_OFF, EP_L_4A56A_SEG
        if      FW_VERSION >= 111
        db      45h
        dw      (C2_BASE+L_4BDCC-C1_SEG*16), C1_SEG
        db      32h
        else
        if      FW_VERSION >= 110
        db      45h, 0eh
        else
        db      45h, 12h
        endif
        db      0dch
        if      FW_VERSION >= 110
        db      76h, 3dh, 32h
        else
        db      28h, 3dh, 32h
        endif
        endif
        dw      EP_L_4BE0E_OFF, EP_L_4BE0E_SEG
        db      00h, 00h, 00h, 00h, 00h, 07h
        if      FW_VERSION >= 112
        dw      EP_FAR_3C214_OFF, C0_SEG
        else
        dw      EP_L_3B8DA_OFF, C0_SEG
        endif
        db      87h
        dw      EP_L_3B8F2_OFF, EP_L_3B8F2_SEG
TBL_WINKEYS_SND_PARAMS:
        WIN_KEY   WIN_K_PAD, EP_SOUND_PAD_PLAY_SEG, EP_SOUND_PAD_PLAY_OFF
        WIN_KEY   WIN_K_OPEN, EP_SND_PARAMS_OPEN_SEG, EP_SND_PARAMS_OPEN_OFF
        WIN_KEY   WIN_K_REFRESH, EP_SND_PARAMS_REFRESH_SEG, EP_SND_PARAMS_REFRESH_OFF
        WIN_KEY_END
        WIN_CLEAR
        WIN_SOFTKEY 1, 2, "TRIM"
        WIN_SOFTKEY 2, 2, "LOOP"
        WIN_SOFTKEY 3, 2, "ZONE"
        WIN_SOFTKEY 4, 0, "PARAMS"
        WIN_LABEL 9dh, 01h, "PLAY X:"
        WIN_LABEL 0dh, 13h, "Level:"
        WIN_LABEL 0dh, 23h, "Tune:"
        WIN_RULE  0eh, 4fh, 0ch, 22h
        WIN_LABEL 55h, 11h, "BEAT"
        WIN_LABEL 55h, 1ah, "LOOP"
        WIN_LABEL 55h, 23h, "FUNCTION"
        WIN_LABEL 0b5h, 11h, "Beat:"
        WIN_END
        db      00h
d_c2_w_01fc4:
        db      1ah, 02h, 78h, 01h, 00h, 42h, 01h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h
d_c2_tbl_01fd2:
        dw      EP_SND_PARAMS_FOCUS_SOUND_OFF, EP_SND_PARAMS_FOCUS_SOUND_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_SND_PARAMS_FOCUS_LEVEL_OFF, EP_SND_PARAMS_FOCUS_LEVEL_SEG
        db      00h, 00h, 00h
        db      00h
        dw      EP_SND_PARAMS_FOCUS_PLAY_X_OFF, EP_SND_PARAMS_FOCUS_PLAY_X_SEG
        dw      EP_L_4BFDE_OFF, EP_L_4BFDE_SEG
d_c2_tbl_01fea:
        dw      EP_FAR_4BFEA_OFF
d_c2_tbl_01fec:
        dw      EP_FAR_4BFEA_SEG
TBL_FIELDS_1FEE:                        ; 4 x FIELD_SIZE
        db      0c7h, 01h, 30h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 04h, 00h, 00h, 00h ; [0] x,y,class,digits  STORE  MIN  MAX
        dw      EP_SND_PARAMS_FOCUS_PLAY_X_OFF, EP_SND_PARAMS_FOCUS_PLAY_X_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_SND_PARAMS_FOCUS_BEAT_OFF, EP_SND_PARAMS_FOCUS_BEAT_SEG
        dw      EP_SND_PARAMS_FOCUS_SOUND_OFF, EP_SND_PARAMS_FOCUS_SOUND_SEG, EP_SND_PARAMS_FOCUS_LEVEL_OFF, EP_SND_PARAMS_FOCUS_LEVEL_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_02018:
        db      31h, 13h, 12h, 03h, 01h, 00h, 00h, 00h, 00h, 00h, 0c8h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_SND_PARAMS_FOCUS_LEVEL_OFF, EP_SND_PARAMS_FOCUS_LEVEL_SEG, EP_SND_PARAMS_FOCUS_SOUND_OFF, EP_SND_PARAMS_FOCUS_SOUND_SEG, EP_SND_PARAMS_FOCUS_TUNE_OFF, EP_SND_PARAMS_FOCUS_TUNE_SEG ; THUNK  PREV  NEXT
        dw      EP_SND_PARAMS_FOCUS_PLAY_X_OFF, EP_SND_PARAMS_FOCUS_PLAY_X_SEG, EP_SND_PARAMS_FOCUS_BEAT_OFF, EP_SND_PARAMS_FOCUS_BEAT_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_02042:
        db      2bh, 23h, 18h, 03h, 01h, 80h, 88h, 0ffh, 0ffh, 0ffh, 78h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        dw      EP_SND_PARAMS_FOCUS_TUNE_OFF, EP_SND_PARAMS_FOCUS_TUNE_SEG, EP_SND_PARAMS_FOCUS_LEVEL_OFF, EP_SND_PARAMS_FOCUS_LEVEL_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_SND_PARAMS_FOCUS_BEAT_OFF, EP_SND_PARAMS_FOCUS_BEAT_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_0206c:
        db      0d3h, 11h, 0ch, 02h, 01h, 00h, 01h, 00h, 00h, 00h, 20h, 00h, 00h, 00h ; [3] x,y,class,digits  STORE  MIN  MAX
        dw      EP_SND_PARAMS_FOCUS_BEAT_OFF, EP_SND_PARAMS_FOCUS_BEAT_SEG, EP_SND_PARAMS_FOCUS_PLAY_X_OFF, EP_SND_PARAMS_FOCUS_PLAY_X_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_SND_PARAMS_FOCUS_LEVEL_OFF, EP_SND_PARAMS_FOCUS_LEVEL_SEG, EP_SND_PARAMS_FOCUS_TUNE_OFF, EP_SND_PARAMS_FOCUS_TUNE_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_02096:
        db      01h, 00h, 00h, 00h, 00h, 03h
        dw      (C2_BASE+L_4B848-C1_SEG*16), C1_SEG
TBL_WINKEYS_SOUND_SPEC:
        WIN_KEY   WIN_K_F3, EP_SOUND_SPEC_F3_SEG, EP_SOUND_SPEC_F3_OFF
        WIN_KEY   WIN_K_F4, EP_SOUND_SPEC_OPEN_SEG, EP_SOUND_SPEC_OPEN_OFF
        WIN_KEY   WIN_K_F5, EP_SOUND_SPEC_F5_SEG, EP_SOUND_SPEC_F5_OFF
        WIN_KEY   WIN_K_PAINT, EP_SOUND_SPEC_PAINT_SEG, EP_SOUND_SPEC_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_SOUND_SPEC_OPEN_SEG, EP_SOUND_SPEC_OPEN_OFF
        WIN_KEY_END
d_c0_w_020be:
        db      1ah, 02h, 01h
        db      44h, 45h, 4ch, 45h, 54h, 45h, 00h
        WIN_SOFTKEY 3, 1, "CONVRT"
        WIN_SOFTKEY 4, 2, "CLOSE"
        WIN_SOFTKEY 5, 1, "COPY"
        WIN_RULE  0ch, 12h, 19h, 0d5h
        WIN_LABEL 19h, 1eh, "<Sound spec.>"
        WIN_LABEL 25h, 27h, "Type:"
        WIN_LABEL 8bh, 1eh, "Rate:"
        WIN_LABEL 0cdh, 1eh, "Hz"
        WIN_LABEL 8bh, 27h, "Size:"
        WIN_END
d_c2_w_0211a:
        db      67h, 0dh, 60h, 01h, 00h, 41h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_fp_02128:
        dw      EP_L_4B7CE_OFF, EP_L_4B7CE_SEG
        db      00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_FAR_4C146_OFF, EP_FAR_4C146_SEG
        db      00h
        db      00h, 00h, 00h
TBL_WINKEYS_DELETE_SOUND:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F3, EP_DELETE_SOUND_ALL_SEG, EP_DELETE_SOUND_ALL_OFF
        WIN_KEY   WIN_K_F4, EP_DELETE_SOUND_CANCEL_SEG, EP_DELETE_SOUND_CANCEL_OFF
        WIN_KEY   WIN_K_F5, EP_DELETE_SOUND_DO_IT_SEG, EP_DELETE_SOUND_DO_IT_OFF
        WIN_KEY   WIN_K_PAINT, EP_DELETE_SOUND_PAINT_SEG, EP_DELETE_SOUND_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_DELETE_SOUND_CANCEL_SEG, EP_DELETE_SOUND_CANCEL_OFF
        WIN_KEY_END
        db      00h
d_c2_w_02168:
        db      1ah, 03h, 01h, 41h, 4ch, 4ch, 00h, 1ah, 04h
        db      02h
        db      "CANCEL"
        db      00h, 1ah, 05h, 01h
        db      "DO IT"
        db      00h, 25h, 0d9h, 1ch, 01h, 07h, 37h, 1eh
        db      "Pressing DO IT will erase"
        db      00h, 07h
        db      "7'this sound "
        db      21h, 21h, 00h, 00h, 00h
d_c2_w_021b6:
        db      61h, 11h, 60h, 01h, 00h, 42h, 01h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h
d_c2_fp_021c4:
        dw      EP_FAR_4C2D0_OFF, EP_FAR_4C2D0_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h
        db      00h, 00h, 00h, 00h, 05h
        dw      EP_DELETE_ALL_SOUNDS_OPEN_OFF, EP_DELETE_ALL_SOUNDS_OPEN_SEG
        db      06h
        if      FW_VERSION >= 112
        dw      (C2_BASE+FAR_4C312-C1_SEG*16), C1_SEG
        else
        dw      C2_W_0E154
        dw      C1_SEG
        endif
TBL_WINKEYS_DELETE_ALL_SOUNDS:
        WIN_KEY   WIN_K_PAINT, EP_DELETE_ALL_SOUNDS_PAINT_SEG, EP_DELETE_ALL_SOUNDS_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_DELETE_ALL_SOUNDS_OPEN_SEG, EP_DELETE_ALL_SOUNDS_OPEN_OFF
        WIN_KEY_END
d_c2_w_021fe:
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_BITMAP 0d9h, 1ch, 01h
        WIN_BITMAP 3ah, 13h, 00h
        WIN_LABEL 50h, 13h, "Pressing DO IT will erase"
        WIN_LABEL 50h, 1ch, "ALL sounds!!"
        WIN_END
        db      00h
TBL_WINKEYS_COPY_SOUND:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_PAINT, EP_COPY_SOUND_PAINT_SEG, EP_COPY_SOUND_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_COPY_SOUND_CANCEL_SEG, EP_COPY_SOUND_CANCEL_OFF
        WIN_KEY   WIN_K_F4, EP_COPY_SOUND_CANCEL_SEG, EP_COPY_SOUND_CANCEL_OFF
        WIN_KEY   WIN_K_F5, EP_COPY_SOUND_DO_IT_SEG, EP_COPY_SOUND_DO_IT_OFF
        WIN_KEY_END
d_c2_w_02266:
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_BITMAP 85h, 19h, 02h
        WIN_LABEL 97h, 1ch, "COPY"
        WIN_LABEL 3dh, 28h, "New Name:"
        WIN_END
        db      00h
d_c2_w_02294:
        db      73h, 10h, 60h, 01h, 00h, 42h, 01h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h
d_c2_tbl_022a2:
        dw      EP_FAR_4C514_OFF, EP_FAR_4C514_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_L_4BBE8_OFF, EP_L_4BBE8_SEG
        db      00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h
        dw      EP_L_4BBCE_OFF, EP_L_4BBCE_SEG
        db      00h, 00h, 00h, 00h
d_c2_w_022be:
        db      73h, 28h, 60h
        db      01h, 00h, 41h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_L_4BBE8_OFF, EP_L_4BBE8_SEG
        dw      EP_FAR_4C514_OFF, EP_FAR_4C514_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_NAME_FIELD_ENTER_OFF, EP_NAME_FIELD_ENTER_SEG
        db      00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h, 00h, 05h
        dw      EP_L_4C59E_OFF, EP_L_4C59E_SEG
        db      06h
        dw      EP_FAR_4C5AC_OFF, EP_FAR_4C5AC_SEG
        db      32h
        dw      EP_FAR_4C5DA_OFF, EP_FAR_4C5DA_SEG
        db      15h
        dw      EP_L_4C59E_OFF, EP_L_4C59E_SEG
        db      000h, 000h, 000h, 000h, 000h
d_c2_w_02306:
        db      01ah, 004h, 002h, "CANCEL", 000h, 01ah
        db      05h, 01h
        db      "NEXT"
        db      00h, 07h, 4fh, 1ch
        db      "Conver"
        db      74h, 3ah, 00h, 00h, 00h
d_c2_w_02326:
        db      7fh, 1ch, 54h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h
        db      00h, 00h, 00h
d_c2_fp_02334:
        dw      EP_L_4C63A_OFF, EP_L_4C63A_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
TBL_WINKEYS_MONO_TO_STEREO:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F4, EP_MONO_TO_STEREO_OPEN_SEG, EP_MONO_TO_STEREO_OPEN_OFF
        WIN_KEY   WIN_K_F5, EP_MONO_TO_STEREO_F5_SEG, EP_MONO_TO_STEREO_F5_OFF
        WIN_KEY   WIN_K_PAINT, EP_MONO_TO_STEREO_PAINT_SEG, EP_MONO_TO_STEREO_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_MONO_TO_STEREO_OPEN_SEG, EP_MONO_TO_STEREO_OPEN_OFF
        WIN_KEY_END
d_c2_w_0236e:
        db      1ah, 04h, 02h
        db      43h, 41h, 4eh, 43h, 45h, 4ch, 00h
        WIN_RULE  0ch, 35h, 19h, 0b9h
        WIN_LABEL 55h, 0fh, "L source:"
        WIN_LABEL 55h, 1eh, "R source:"
        WIN_LABEL 43h, 28h, "New ST name:"
        WIN_END
        db      00h
d_c2_w_023a8:
        db      8bh, 0fh, 60h, 01h, 00h, 42h, 01h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h
d_c2_fp_023b6:
        dw      EP_L_4BEA8_OFF, EP_L_4BEA8_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_L_4C81E_OFF, EP_L_4C81E_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h
d_c2_w_023d2:
        db      8bh, 1eh, 60h, 01h, 00h, 42h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_L_4C81E_OFF, EP_L_4C81E_SEG
        dw      EP_L_4BEA8_OFF, EP_L_4BEA8_SEG
        dw      EP_L_4BED8_OFF, EP_L_4BED8_SEG
        db      00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_023fc:
        db      8bh, 28h, 60h, 01h, 00h
        db      41h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_L_4BED8_OFF, EP_L_4BED8_SEG
        dw      EP_L_4C81E_OFF, EP_L_4C81E_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_NAME_FIELD_ENTER_OFF, EP_NAME_FIELD_ENTER_SEG
        db      00h, 00h, 00h, 00h
TBL_WINKEYS_STEREO_TO_MONO:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F4, EP_STEREO_TO_MONO_CANCEL_SEG, EP_STEREO_TO_MONO_CANCEL_OFF
        WIN_KEY   WIN_K_F5, EP_STEREO_TO_MONO_DO_IT_SEG, EP_STEREO_TO_MONO_DO_IT_OFF
        WIN_KEY   WIN_K_PAINT, EP_STEREO_TO_MONO_PAINT_SEG, EP_STEREO_TO_MONO_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_STEREO_TO_MONO_CANCEL_SEG, EP_STEREO_TO_MONO_CANCEL_OFF
        WIN_KEY_END
d_c2_w_02444:
        WIN_LABEL 37h, 0fh, "Stereo source:"
        WIN_LABEL 49h, 1eh, "New L name:"
        WIN_LABEL 49h, 28h, "New R name:"
        WIN_RULE  0ch, 35h, 19h, 0b9h
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_END
        db      00h
d_c2_w_02484:
        db      8bh, 0fh, 60h, 01h, 00h, 42h, 01h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h
d_c2_fp_02492:
        dw      EP_ST_TO_MONO_FOCUS_SOURCE_OFF, EP_ST_TO_MONO_FOCUS_SOURCE_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_ST_TO_MONO_FOCUS_L_NAME_OFF, EP_ST_TO_MONO_FOCUS_L_NAME_SEG
        db      00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
TBL_FIELDS_24AE:                        ; 2 x FIELD_SIZE
        db      8bh, 1eh, 60h, 01h, 00h, 41h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [0] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 114
        dw      EP_ST_TO_MONO_FOCUS_L_NAME_OFF, EP_ST_TO_MONO_FOCUS_L_NAME_SEG ; THUNK  PREV  NEXT
        dw      EP_ST_TO_MONO_FOCUS_SOURCE_OFF, EP_ST_TO_MONO_FOCUS_SOURCE_SEG
        dw      EP_FAR_4BACC_OFF, C1_SEG
        else
        dw      EP_ST_TO_MONO_FOCUS_L_NAME_OFF, EP_ST_TO_MONO_FOCUS_L_NAME_SEG, EP_ST_TO_MONO_FOCUS_SOURCE_OFF, EP_ST_TO_MONO_FOCUS_SOURCE_SEG, EP_ST_TO_MONO_FOCUS_R_NAME_OFF, EP_ST_TO_MONO_FOCUS_R_NAME_SEG
        endif
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_NAME_FIELD_ENTER_OFF, EP_NAME_FIELD_ENTER_SEG
        db      00h, 00h, 00h, 00h
d_c2_w_024d8:
        db      8bh, 28h, 60h, 01h, 00h, 41h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_ST_TO_MONO_FOCUS_R_NAME_OFF, EP_ST_TO_MONO_FOCUS_R_NAME_SEG, EP_ST_TO_MONO_FOCUS_L_NAME_OFF, EP_ST_TO_MONO_FOCUS_L_NAME_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_NAME_FIELD_ENTER_OFF, EP_NAME_FIELD_ENTER_SEG
        db      00h, 00h, 00h, 00h
d_c2_w_02502:
        db      44h, 0ach
d_c2_b_02504:
        db      00h
d_c2_w_02505:
        db      00h, 4ch, 4fh, 57h, 00h, 00h, 4dh, 45h, 44h, 00h, 00h, 48h
        db      49h, 47h, 48h, 00h, 00h
TBL_WINKEYS_RESAMPLE:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F4, EP_RESAMPLE_CANCEL_SEG, EP_RESAMPLE_CANCEL_OFF
        WIN_KEY   WIN_K_F5, EP_RESAMPLE_DO_IT_SEG, EP_RESAMPLE_DO_IT_OFF
        WIN_KEY   WIN_K_PAINT, EP_RESAMPLE_PAINT_SEG, EP_RESAMPLE_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_RESAMPLE_CANCEL_SEG, EP_RESAMPLE_CANCEL_OFF
        WIN_KEY_END
TBL_FIELDS_2534:                        ; 4 x FIELD_SIZE
        db      6dh, 0fh, 1eh, 05h, 02h, 00h, 0a0h, 0fh, 00h, 00h, 0e8h, 0fdh, 00h, 00h ; [0] x,y,class,digits  STORE  MIN  MAX
d_c2_fp_02542:
        dw      EP_RESAMPLE_FOCUS_NEW_FS_OFF, EP_RESAMPLE_FOCUS_NEW_FS_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_RESAMPLE_FOCUS_QUALITY_OFF, EP_RESAMPLE_FOCUS_QUALITY_SEG
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_RESAMPLE_FOCUS_NEW_BIT_OFF, EP_RESAMPLE_FOCUS_NEW_BIT_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_0255e:
        db      6dh, 1ah, 1eh, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 02h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_RESAMPLE_FOCUS_QUALITY_OFF, EP_RESAMPLE_FOCUS_QUALITY_SEG, EP_RESAMPLE_FOCUS_NEW_FS_OFF, EP_RESAMPLE_FOCUS_NEW_FS_SEG, EP_RESAMPLE_FOCUS_NEW_NAME_OFF, EP_RESAMPLE_FOCUS_NEW_NAME_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_RESAMPLE_FOCUS_NEW_BIT_OFF, EP_RESAMPLE_FOCUS_NEW_BIT_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_02588:
        db      6dh, 25h, 60h, 01h, 00h, 41h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        dw      EP_RESAMPLE_FOCUS_NEW_NAME_OFF, EP_RESAMPLE_FOCUS_NEW_NAME_SEG, EP_RESAMPLE_FOCUS_QUALITY_OFF, EP_RESAMPLE_FOCUS_QUALITY_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_RESAMPLE_FOCUS_NEW_BIT_OFF, EP_RESAMPLE_FOCUS_NEW_BIT_SEG, EP_NAME_FIELD_ENTER_OFF, EP_NAME_FIELD_ENTER_SEG
        db      00h, 00h, 00h, 00h
d_c2_w_025b2:
        db      0d3h, 0fh, 18h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 02h, 00h, 00h, 00h ; [3] x,y,class,digits  STORE  MIN  MAX
        dw      EP_RESAMPLE_FOCUS_NEW_BIT_OFF, EP_RESAMPLE_FOCUS_NEW_BIT_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_RESAMPLE_FOCUS_NEW_FS_OFF, EP_RESAMPLE_FOCUS_NEW_FS_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_tbl_025dc:
        dw      EP_L_4C8C4_OFF
d_c2_tbl_025de:
        dw      EP_L_4C8C4_SEG
        if      FW_VERSION >= 110
        if      FW_VERSION >= 112
        dw      (C2_BASE+L_4D22A_120-C1_SEG*16), C1_SEG
        else
        db      6ch
        if      FW_VERSION >= 111
        db      0f0h, 86h, 3dh
        else
        db      0f0h, 76h, 3dh
        endif
        endif
        else
        db      70h
        db      0f0h, 28h, 3dh
        endif
        dw      EP_FAR_4D23E_OFF, EP_FAR_4D23E_SEG
        dw      EP_L_4D252_OFF, EP_L_4D252_SEG
        if      FW_VERSION >= 111
        dw      EP_FAR_4D270_OFF, C1_SEG
        if      FW_VERSION >= 112
        dw      (C2_BASE+L_4D280-C1_SEG*16), C1_SEG
        if      FW_VERSION >= 114
        dw      EP_L_4D290_OFF, C1_SEG
        dw      (C2_BASE+L_4D2A0-C1_SEG*16), C1_SEG
        else
        dw      EP_L_4CA90_OFF, C1_SEG
        dw      (C2_BASE+L_4CAA0-C1_SEG*16), C1_SEG
        endif
        else
        db      0c2h, 0f0h, 86h, 3dh
        dw      EP_L_4D290_OFF, C1_SEG
        dw      (C2_BASE+L_4CAA0-C1_SEG*16), C1_SEG
        endif
        dw      EP_FAR_4D2AE_OFF, EP_FAR_4D2AE_SEG
        else
        if      FW_VERSION >= 110
        db      0b2h, 0f0h, 76h, 3dh
        db      0c2h, 0f0h, 76h, 3dh, 0d2h, 0f0h
        db      76h, 3dh
        else
        db      0b6h, 0f0h
        db      28h, 3dh, 0c6h
        db      0f0h
        db      28h, 3dh
        dw      EP_L_4D290_OFF, C1_SEG
        endif
        dw      (C2_BASE+L_4CAA0-C1_SEG*16), C1_SEG
        if      FW_VERSION >= 110
        dw      EP_FAR_4D2AE_OFF, EP_FAR_4D2AE_SEG
        else
        db      0f4h, 0f0h, 28h, 3dh
        endif
        endif
ts_params:
        db      00h
        db      00h
d_c2_w_02602:
        db      10h, 27h
d_c2_b_02604:
        db      00h, 00h
TBL_WINKEYS_EDIT_SOUND:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F2, EP_EDIT_SOUND_F2_SEG, EP_EDIT_SOUND_F2_OFF
        WIN_KEY   WIN_K_F4, EP_EDIT_SOUND_CANCEL_SEG, EP_EDIT_SOUND_CANCEL_OFF
        if      FW_VERSION >= 112
        WIN_KEY   WIN_K_F5, C1_SEG, EP_X_4CD86_OFF
        else
        WIN_KEY   WIN_K_F5, C1_SEG, EP_EDIT_SOUND_DO_IT_OFF
        endif
        WIN_KEY   WIN_K_PAINT, EP_EDIT_SOUND_PAINT_SEG, EP_EDIT_SOUND_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_EDIT_SOUND_CANCEL_SEG, EP_EDIT_SOUND_CANCEL_OFF
        WIN_KEY_END
        db      00h
d_c2_w_0262a:
        db      07h, 37h, 14h, 53h, 65h, 63h, 74h
        db      69h, 6fh, 6eh, 00h, 0bh, 2fh, 19h, 05h, 0bh, 30h, 1ah, 03h, 0bh, 31h, 1bh, 01h
        db      0bh, 73h, 19h, 05h, 0bh, 74h, 1ah, 03h, 0bh, 75h, 1bh, 01h, 12h, 1fh, 1ch, 0fh
        db      06h, 11h, 31h, 1ch, 45h, 06h, 12h, 79h, 1ch, 0fh, 06h, 0fh, 25h, 23h, 04h, 0fh
        db      81h, 23h, 04h, 0ch, 9dh, 1fh, 36h, 0fh, 9dh, 1fh, 0ah, 0ch, 25h, 27h, 78h, 25h
        db      0d3h, 1ch, 01h, 07h
        db      "+*DO IT will discard."
        db      00h, 00h
ts_screen_field_array:                  ; DS:TS_SCREEN_FIELDS, 8 x FIELD_SIZE, cur 08D56h
        db      31h, 0bh, 0a8h, 01h, 01h                                        ; 1....
        db      40h, 00h, 00h, 00h, 00h
d_c2_w_02696:
        db      08h, 00h
d_c2_w_02698:
        db      00h, 00h
d_c2_fp_0269a:
        dw      EP_L_4D108_OFF, EP_L_4D108_SEG
        db      00h, 00h, 00h
        db      00h
        dw      EP_L_4D140_OFF, EP_L_4D140_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h
d_c2_w_026b6:
        db      55h, 15h, 78h, 01h, 00h, 42h, 01h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h
        dw      EP_FAR_4D166_OFF, EP_FAR_4D166_SEG
        dw      EP_L_4D108_OFF, EP_L_4D108_SEG
        db      00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_026e0:
        db      49h
        if      FW_VERSION >= 112
        if      FW_VERSION >= 114
        db      15h, 60h, 01h, 00h, 41h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_FAR_4D17E_OFF, C1_SEG
        else
        db      15h, 60h, 01h, 00h, 41h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0eeh, 0efh, 99h
        db      3dh
        endif
        dw      (C2_BASE+L_4D108-C1_SEG*16), C1_SEG
        else
        db      15h, 60h, 01h, 00h, 41h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_FAR_4D17E_OFF, C1_SEG
        dw      EP_L_4D108_OFF, EP_L_4D108_SEG
        endif
        dw      EP_L_4C838_OFF, EP_L_4C838_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h
        dw      EP_NAME_FIELD_ENTER_OFF, EP_NAME_FIELD_ENTER_SEG
        db      00h, 00h, 00h, 00h
d_c2_w_0270a:
        db      91h, 18h, 0ch, 02h, 01h, 00h, 00h
        db      00h, 00h, 00h, 63h, 00h, 00h, 00h
        dw      EP_FAR_4D1A4_OFF, EP_FAR_4D1A4_SEG
        dw      EP_L_4D108_OFF, EP_L_4D108_SEG
        dw      EP_L_4C85E_OFF, EP_L_4C85E_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h
d_c2_w_02734:
        db      91h, 23h, 12h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h
        db      00h
        dw      EP_L_4C85E_OFF, EP_L_4C85E_SEG
        dw      EP_FAR_4D1A4_OFF, EP_FAR_4D1A4_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
ts_field_desc_ratio:                    ; = DS:TS_FIELD_RATIO, entry 5 of 8
        db      49h, 1fh, 24h
        db      05h, 22h, 00h, 88h, 13h, 00h, 00h, 20h, 4eh, 00h, 00h
        dw      EP_FAR_4D1D4_OFF, EP_FAR_4D1D4_SEG
        dw      (C2_BASE+far_4D17E-C1_SEG*16), C1_SEG
        dw      EP_L_4D1EC_OFF, EP_L_4D1EC_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h
ts_field_desc_preset:                   ; x=049h y=29h
        db      49h, 29h, 54h, 01h, 01h, 00h, 00h, 00h, 00h
        db      00h, 35h, 00h, 00h, 00h
        dw      EP_L_4D1EC_OFF, EP_L_4D1EC_SEG
        dw      EP_FAR_4D1D4_OFF, EP_FAR_4D1D4_SEG
        db      00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h
        dw      EP_L_4D204_OFF, EP_L_4D204_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h
ts_field_desc_adjust:                   ; x=0D3h y=29h, FIELD_STORE 8001h, MIN -50 MAX +50
        db      0d3h, 29h, 12h, 02h, 01h, 80h, 0ceh, 0ffh, 0ffh, 0ffh, 32h, 00h, 00h, 00h
        dw      EP_L_4D204_OFF, EP_L_4D204_SEG
        dw      EP_FAR_4D1D4_OFF, EP_FAR_4D1D4_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_L_4D1EC_OFF, EP_L_4D1EC_SEG
        db      00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h, 00h
        db      02h
        dw      EP_TRIM_SCREEN_DRAW_OFF, EP_TRIM_SCREEN_DRAW_SEG
        db      03h
        dw      EP_LOOP_SCREEN_DRAW_OFF, EP_LOOP_SCREEN_DRAW_SEG
        db      04h
        dw      EP_L_4A56A_OFF, EP_L_4A56A_SEG
        db      44h
        dw      EP_L_4D40C_OFF, EP_L_4D40C_SEG
        db      05h
        dw      EP_FAR_4BD70_OFF, EP_FAR_4BD70_SEG
        db      32h
        dw      EP_FAR_4D45C_OFF, EP_FAR_4D45C_SEG
        db      00h, 00h
        db      00h, 00h, 00h, 06h
        dw      EP_FAR_4D3BA_OFF, EP_FAR_4D3BA_SEG
        db      07h
        if      FW_VERSION >= 112
        dw      EP_FAR_3C214_OFF, C0_SEG
        else
        dw      EP_L_3B8DA_OFF, C0_SEG
        endif
        db      87h
        dw      EP_L_3B8F2_OFF, EP_L_3B8F2_SEG
TBL_WINKEYS_ZONE:
        WIN_KEY   WIN_K_PAD, EP_SOUND_PAD_PLAY_SEG, EP_SOUND_PAD_PLAY_OFF
        WIN_KEY   33h, EP_ZONE_SCREEN_KEY_33_SEG, EP_ZONE_SCREEN_KEY_33_OFF
        WIN_KEY   WIN_K_OPEN, EP_ZONE_SCREEN_OPEN_SEG, EP_ZONE_SCREEN_OPEN_OFF
        WIN_KEY   WIN_K_REFRESH, EP_ZONE_SCREEN_REFRESH_SEG, EP_ZONE_SCREEN_REFRESH_OFF
        WIN_KEY_END
        WIN_CLEAR
        db      1ah, 01h, 02h, 54h
        db      52h, 49h, 4dh, 00h
        WIN_SOFTKEY 2, 2, "LOOP"
        WIN_SOFTKEY 3, 0, "ZONE"
        WIN_SOFTKEY 4, 2, "PARAMS"
        WIN_LABEL 9dh, 01h, "PLAY X:"
        WIN_RULE  0bh, 01h, 14h, 0f6h
        WIN_LABEL 08h, 0ch, "St:"
        WIN_LABEL 62h, 0ch, "End:"
        WIN_LABEL 0b6h, 0ch, "Zone:"
        WIN_END
        db      00h
d_c2_w_02878:
        db      1ah, 02h, 78h, 01h, 00h, 42h, 01h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h
d_c2_tbl_02886:
        dw      EP_ZONE_FOCUS_SOUND_OFF, EP_ZONE_FOCUS_SOUND_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_L_4D5D0_OFF, EP_L_4D5D0_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_ZONE_FOCUS_PLAY_X_OFF, EP_ZONE_FOCUS_PLAY_X_SEG
        dw      EP_L_4D59C_OFF, EP_L_4D59C_SEG
d_c2_tbl_0289e:
        dw      EP_L_4D5A8_OFF
d_c2_tbl_028a0:
        dw      EP_L_4D5A8_SEG
TBL_FIELDS_28A2:                        ; 4 x FIELD_SIZE
        db      0c7h, 01h, 30h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 04h, 00h, 00h, 00h ; [0] x,y,class,digits  STORE  MIN  MAX
        dw      EP_ZONE_FOCUS_PLAY_X_OFF, EP_ZONE_FOCUS_PLAY_X_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_L_4D654_OFF, EP_L_4D654_SEG
        dw      EP_ZONE_FOCUS_SOUND_OFF, EP_ZONE_FOCUS_SOUND_SEG, EP_L_4D5D0_OFF, EP_L_4D5D0_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_028cc:
        db      1ah, 0ch, 30h, 08h, 04h, 10h
d_c2_w_028d2:
        db      00h, 00h
d_c2_w_028d4:
        db      00h, 00h
d_c2_w_028d6:
        db      00h, 00h
d_c2_w_028d8:
        db      00h, 00h; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_L_4D5D0_OFF, EP_L_4D5D0_SEG, EP_ZONE_FOCUS_SOUND_OFF, EP_ZONE_FOCUS_SOUND_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        if      FW_VERSION >= 110
        dw      EP_ZONE_FOCUS_PLAY_X_OFF, EP_ZONE_FOCUS_PLAY_X_SEG, EP_L_4D612_OFF, EP_L_4D612_SEG ; +1Ah..+21h  NOTIFY  ENTER
        else
        db      0feh, 0f3h
        db      28h
        db      3dh
        dw      (C2_BASE+L_4D612-C1_SEG*16), C1_SEG
        endif
        db      00h, 00h, 00h, 00h
        dw      EP_L_4D71E_OFF, EP_L_4D71E_SEG
d_c2_w_028f6:
        db      7ah, 0ch, 30h, 08h, 04h, 10h
d_c2_w_028fc:
        db      00h, 00h
d_c2_w_028fe:
        db      00h, 00h
d_c2_w_02900:
        db      00h, 00h
d_c2_w_02902:
        db      00h, 00h; [2] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 110
        dw      EP_L_4D612_OFF, EP_L_4D612_SEG, EP_ZONE_FOCUS_SOUND_OFF, EP_ZONE_FOCUS_SOUND_SEG ; THUNK  PREV  NEXT
        else
        db      58h, 0f4h, 28h, 3dh
        dw      EP_ZONE_FOCUS_SOUND_OFF, EP_ZONE_FOCUS_SOUND_SEG
        endif
        db      00h, 00h, 00h, 00h
        if      FW_VERSION >= 112
        dw      EP_L_4D5D0_OFF, EP_L_4D5D0_SEG, EP_L_4D654_OFF, EP_L_4D654_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        else
        dw      EP_L_4D5D0_OFF, EP_L_4D5D0_SEG
        if      FW_VERSION >= 111
        db      96h, 0f4h, 86h, 3dh, 00h, 00h, 00h, 00h
        elseif  FW_VERSION >= 110
        db      96h, 0f4h, 76h, 3dh, 00h, 00h, 00h, 00h
        else
        db      9ah, 0f4h, 28h, 3dh, 00h, 00h, 00h, 00h
        endif
        endif
        if      FW_VERSION >= 114
        dw      EP_L_4D916_OFF, C1_SEG
        else
        dw      EP_L_4D116_OFF, C1_SEG
        endif
d_c2_w_02920:
        db      0d4h, 0ch, 0ch, 02h, 01h, 00h, 01h, 00h, 00h, 00h
d_c2_w_0292a:
        db      01h, 00h
d_c2_w_0292c:
        db      00h, 00h; [3] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 110
        dw      EP_L_4D654_OFF, EP_L_4D654_SEG, EP_ZONE_FOCUS_PLAY_X_OFF, EP_ZONE_FOCUS_PLAY_X_SEG ; THUNK  PREV  NEXT
        else
        db      9ah, 0f4h
        db      28h
        db      3dh, 0feh, 0f3h, 28h, 3dh
        endif
        db      00h, 00h, 00h, 00h
        dw      EP_L_4D612_OFF, EP_L_4D612_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_FAR_4DB0C_OFF, EP_FAR_4DB0C_SEG
d_c2_w_0294a:
        db      01h, 00h, 00h, 00h, 00h, 03h
        if      FW_VERSION >= 112
        dw      (C2_BASE+L_4D79E-C1_SEG*16), C1_SEG
        db      04h
        else
        if      FW_VERSION >= 111
        db      0e0h, 0f5h, 86h, 3dh, 04h
        elseif  FW_VERSION >= 110
        db      0e0h, 0f5h, 76h, 3dh, 04h
        else
        db      0e4h, 0f5h, 28h, 3dh, 04h
        endif
        endif
        dw      EP_FAR_4D16A_OFF, EP_FAR_4D16A_SEG
        db      05h
        dw      EP_ZONE_START_FINE_OPEN_OFF, EP_ZONE_START_FINE_OPEN_SEG
        db      06h
        if      FW_VERSION >= 112
        dw      EP_FAR_3C214_OFF, C0_SEG
        else
        dw      EP_C0_66DA_OFF, C0_SEG
        endif
        db      86h
        dw      EP_L_3B8F2_OFF, EP_L_3B8F2_SEG
TBL_WINKEYS_ZONE_START_FINE:
        WIN_KEY   WIN_K_PAD, EP_SOUND_PAD_PLAY_SEG, EP_SOUND_PAD_PLAY_OFF
        WIN_KEY   WIN_K_PAINT, EP_ZONE_START_FINE_PAINT_SEG, EP_ZONE_START_FINE_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_ZONE_START_FINE_OPEN_SEG, EP_ZONE_START_FINE_OPEN_OFF
        WIN_KEY   WIN_K_REFRESH, EP_ZONE_START_FINE_REFRESH_SEG, EP_ZONE_START_FINE_REFRESH_OFF
        WIN_KEY_END
        db      00h
d_c2_w_02982:
        db      1ah, 02h, 01h
        db      "ZOOM-"
        db      00h, 1ah, 03h, 01h
        db      "ZOOM+"
        db      00h, 1ah, 04h, 02h
        db      "CLOSE"
        db      00h, 1ah, 05h, 01h
        db      "PLAY X"
        db      00h, 07h, 91h, 0ch
        db      "Start:"
        db      00h, 07h, 91h, 15h
        db      "Lngth="
        db      00h, 07h, 8bh
        db      "(PLA"
        db      59h, 20h, 58h, 3ah, 00h, 00h, 00h
d_c2_w_029c8:
        db      0b5h, 0ch, 30h, 08h, 04h, 10h
d_c2_w_029ce:
        db      00h, 00h
d_c2_w_029d0:
        db      00h
        db      00h
d_c2_w_029d2:
        db      00h, 00h
d_c2_w_029d4:
        db      00h, 00h
d_c2_tbl_029d6:
        dw      EP_L_4D28A_OFF, EP_L_4D28A_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_L_4D8EE_OFF, EP_L_4D8EE_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_L_4D8CC_OFF, EP_L_4D8CC_SEG
        db      00h, 00h, 00h
        db      00h
TBL_FIELDS_29C8:                        ; 2 x FIELD_SIZE; the part of the array this .asm emits itself
        db      0b5h, 28h, 30h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 04h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_L_4D8EE_OFF, EP_L_4D8EE_SEG, EP_L_4D28A_OFF, EP_L_4D28A_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        db      01h, 00h, 00h, 00h, 00h
        db      03h
        dw      EP_FAR_4D996_OFF, EP_FAR_4D996_SEG
        db      04h
        dw      EP_FAR_4D962_OFF, EP_FAR_4D962_SEG
        db      05h
        dw      EP_ZONE_END_FINE_OPEN_OFF, EP_ZONE_END_FINE_OPEN_SEG
        db      06h
        if      FW_VERSION >= 112
        dw      EP_FAR_3C214_OFF, C0_SEG
        else
        dw      EP_C0_66DA_OFF, C0_SEG
        endif
        db      86h
        dw      EP_L_3B8F2_OFF, EP_L_3B8F2_SEG
TBL_WINKEYS_ZONE_END_FINE:
        WIN_KEY   WIN_K_PAD, EP_SOUND_PAD_PLAY_SEG, EP_SOUND_PAD_PLAY_OFF
        WIN_KEY   WIN_K_PAINT, EP_ZONE_END_FINE_PAINT_SEG, EP_ZONE_END_FINE_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_ZONE_END_FINE_OPEN_SEG, EP_ZONE_END_FINE_OPEN_OFF
        WIN_KEY   WIN_K_REFRESH, EP_ZONE_END_FINE_REFRESH_SEG, EP_ZONE_END_FINE_REFRESH_OFF
        WIN_KEY_END
        db      00h
d_c2_w_02a54:
        db      1ah, 02h, 01h, 5ah, 4fh, 4fh, 4dh, 2dh, 00h, 1ah, 03h, 01h, 5ah
        db      "OOM+"
        db      00h, 1ah, 04h, 02h
        db      "CLOSE"
        db      00h, 1ah, 05h, 01h
        db      "PLAY X"
        db      00h, 07h, 9dh, 0ch
        db      "End:"
        db      00h, 07h, 91h, 15h
        db      "Lngth="
        db      00h, 07h, 8bh
        db      "(PLA"
        db      59h, 20h, 58h, 3ah, 00h, 00h, 00h
d_c2_w_02a98:
        db      0b5h, 0ch, 30h, 08h, 04h, 10h
d_c2_w_02a9e:
        db      00h, 00h
d_c2_w_02aa0:
        db      00h
        db      00h
d_c2_w_02aa2:
        db      00h, 00h
d_c2_w_02aa4:
        db      00h, 00h
d_c2_tbl_02aa6:
        dw      EP_L_4DA82_OFF, EP_L_4DA82_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_L_4DAE6_OFF, EP_L_4DAE6_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_L_4DAC4_OFF, EP_L_4DAC4_SEG
        db      00h, 00h, 00h
        db      00h
TBL_FIELDS_2A98:                        ; 2 x FIELD_SIZE; the part of the array this .asm emits itself
        db      0b5h, 28h, 30h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 04h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_L_4DAE6_OFF, EP_L_4DAE6_SEG, EP_L_4DA82_OFF, EP_L_4DA82_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
TBL_WINKEYS_ZONE_COUNT:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F4, EP_ZONE_COUNT_CLOSE_SEG, EP_ZONE_COUNT_CLOSE_OFF
        WIN_KEY   WIN_K_F5, EP_ZONE_COUNT_DO_IT_SEG, EP_ZONE_COUNT_DO_IT_OFF
        WIN_KEY   WIN_K_PAINT, EP_ZONE_COUNT_PAINT_SEG, EP_ZONE_COUNT_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_ZONE_COUNT_CLOSE_SEG, EP_ZONE_COUNT_CLOSE_OFF
        WIN_KEY_END
d_c2_w_02b0a:
        db      1ah, 04h, 02h, 43h, 4ch, 4fh, 53h
        db      45h, 00h
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_RULE  0ch, 12h, 19h, 0d5h
        WIN_LABEL 3dh, 0dh, "Number of zones:"
        WIN_LABEL 31h, 1eh, "Pressing DO IT will reset"
        WIN_LABEL 31h, 27h, "St/End values."
        WIN_END
d_c2_w_02b64:
        db      9dh, 0dh, 0ch, 02h, 01h, 00h, 01h, 00h, 00h, 00h, 10h, 00h, 00h
        db      00h
d_c2_fp_02b72:
        dw      EP_L_4D22A_OFF, EP_L_4D22A_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
TBL_WINKEYS_MIXER_SELECT_PGM:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F1, EP_MIXER_SELECT_PGM_DRUM_1_SEG, EP_MIXER_SELECT_PGM_DRUM_1_OFF
        WIN_KEY   WIN_K_F2, EP_MIXER_SELECT_PGM_DRUM_2_SEG, EP_MIXER_SELECT_PGM_DRUM_2_OFF
        WIN_KEY   WIN_K_F3, EP_MIXER_SELECT_PGM_DRUM_3_SEG, EP_MIXER_SELECT_PGM_DRUM_3_OFF
        WIN_KEY   WIN_K_F4, EP_MIXER_SELECT_PGM_DRUM_4_SEG, EP_MIXER_SELECT_PGM_DRUM_4_OFF
        WIN_KEY   WIN_K_F5, EP_MIXER_SELECT_PGM_SETUP_SEG, EP_MIXER_SELECT_PGM_SETUP_OFF
        WIN_KEY   WIN_K_F6, EP_MIXER_SELECT_PGM_FXEDIT_SEG, EP_MIXER_SELECT_PGM_FXEDIT_OFF
        WIN_KEY   WIN_K_PAINT, EP_MIXER_SELECT_PGM_PAINT_SEG, EP_MIXER_SELECT_PGM_PAINT_OFF
        WIN_KEY_END
        db      00h, 01h, 00h, 00h, 00h, 00h
        db      02h
        if      FW_VERSION >= 110
        dw      EP_FAR_4E092_OFF, EP_FAR_4E092_SEG
        if      FW_VERSION >= 111
        db      03h
        dw      EP_FAR_4E0AE_OFF, C1_SEG
        db      04h
        else
        db      03h, 0f0h, 0feh, 76h, 3dh, 04h
        endif
        dw      EP_FAR_4E0C0_OFF, EP_FAR_4E0C0_SEG
        if      FW_VERSION >= 111
        db      05h
        dw      EP_FAR_4E0D2_OFF, C1_SEG
        db      06h
        else
        db      05h, 14h, 0ffh
        db      76h, 3dh, 06h
        endif
        else
        db      0d8h, 0feh, 28h, 3dh, 03h, 0f4h, 0feh, 28h, 3dh, 04h
        dw      EP_FAR_4E0C0_OFF, EP_FAR_4E0C0_SEG
        db      05h, 18h, 0ffh
        db      28h, 3dh, 06h
        endif
        dw      EP_FAR_4E0E4_OFF, EP_FAR_4E0E4_SEG
        db      07h
        dw      (C2_BASE+L_4E5E8-C2_SEG*16), C2_SEG
        db      87h
        dw      EP_PAD_AUDITION_NOTE_OFF_OFF, EP_PAD_AUDITION_NOTE_OFF_SEG
TBL_WINKEYS_PGM_ASSIGN:
        WIN_KEY   WIN_K_PAD, EP_PGM_ASSIGN_PAD_SEG, EP_PGM_ASSIGN_PAD_OFF
        WIN_KEY   WIN_K_PAINT, EP_PGM_ASSIGN_PAINT_SEG, EP_PGM_ASSIGN_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_PGM_ASSIGN_OPEN_WINDOW_SEG, EP_PGM_ASSIGN_OPEN_WINDOW_OFF
        WIN_KEY   WIN_K_REFRESH, EP_PGM_ASSIGN_REFRESH_SEG, EP_PGM_ASSIGN_REFRESH_OFF
        WIN_KEY_END
        db      00h
d_c2_tbl_02bfe:
        dw      EP_L_4E668_OFF
d_c2_tbl_02c00:
        dw      EP_L_4E668_SEG
        dw      (C2_BASE+L_4DD10-C2_SEG*16), C2_SEG
        dw      EP_L_4DD18_OFF, EP_L_4DD18_SEG
        dw      EP_L_4DD20_OFF, EP_L_4DD20_SEG
d_c2_w_02c0e:
        db      01h, 1ah, 01h
        db      00h
        db      "ASSIGN"
        db      00h, 1ah, 02h, 02h
        db      "PARAMS"
        db      00h, 1ah, 03h, 02h
        db      "DRUM"
        db      00h, 1ah, 04h, 02h
        db      "PURGE"
        db      00h, 1ah, 05h, 01h
        db      "AUTO"
        db      00h, 1ah, 06h, 01h
        db      "PLAY"
        db      00h, 07h, 03h, 02h
        db      "Pgm:__-"
        db      00h, 0ch, 01h, 14h, 0f6h, 07h, 09h, 0ch
        db      "Pad:___=Note:"
        db      00h, 07h, 82h, 0ch
        db      "Pad assign:"
        db      00h, 07h, 09h, 16h
        db      "Note:__=Snd:"
        db      00h, 07h, 09h
        db      "(Mode:"
        db      00h, 00h, 00h
d_c2_w_02c8e:
        db      1bh, 02h, 72h
        db      02h, 01h, 20h, 00h, 00h, 00h, 00h, 17h, 00h, 00h, 00h
d_c2_tbl_02c9c:
        if      FW_VERSION >= 112
        dw      0000h, C2_SEG
        else
        dw      (C2_BASE+L_4D7F6-C1_SEG*16), C1_SEG
        endif
        db      00h
        db      00h, 00h, 00h
        dw      EP_PGM_ASSIGN_FOCUS_PGM_OFF, EP_PGM_ASSIGN_FOCUS_PGM_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_PGM_ASSIGN_FOCUS_PGM_OFF, EP_PGM_ASSIGN_FOCUS_PGM_SEG
        dw      (C2_BASE+L_4845E-C1_SEG*16), C1_SEG
d_c2_tbl_02cb4:
        dw      EP_FAR_4E182_OFF
d_c2_tbl_02cb6:
        dw      EP_FAR_4E182_SEG
TBL_FIELDS_2C8E:                        ; 11 x FIELD_SIZE, DS:2C8Eh = PGM_ASSIGN_FIELDS + DS:2D8Ah = MAIN_PGM_FIELDS; the part this .asm emits
        db      21h, 0ch, 12h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 3fh, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_PGM_ASSIGN_FOCUS_PGM_OFF, EP_PGM_ASSIGN_FOCUS_PGM_SEG, 0000h, C2_SEG, EP_PGM_ASSIGN_FOCUS_NOTE_OFF, EP_PGM_ASSIGN_FOCUS_NOTE_SEG ; THUNK  PREV  NEXT
        dw      0000h, C2_SEG, EP_PGM_ASSIGN_FOCUS_PAD_OFF, EP_PGM_ASSIGN_FOCUS_PAD_SEG, EP_FAR_4E1B8_OFF, C2_SEG, EP_L_4F6E2_OFF, EP_L_4F6E2_SEG ; +1Ah..+21h  NOTIFY  ENTER
        else
        dw      (C2_BASE+PGM_ASSIGN_FOCUS_PGM-C2_SEG*16), C2_SEG, (C2_BASE+L_4D7F6-C1_SEG*16), C1_SEG
        dw      (C2_BASE+pgm_assign_focus_note-C2_SEG*16), C2_SEG, (C2_BASE+L_4D7F6-C1_SEG*16), C1_SEG
        dw      EP_PGM_ASSIGN_FOCUS_PAD_OFF, EP_PGM_ASSIGN_FOCUS_PAD_SEG
        dw      (C2_BASE+far_4E1B8-C2_SEG*16), C2_SEG
        dw      EP_L_4F6E2_OFF, EP_L_4F6E2_SEG
        endif
        db      57h, 0ch, 0ch, 02h, 01h, 00h, 22h, 00h, 00h, 00h, 62h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_PGM_ASSIGN_FOCUS_PAD_OFF, EP_PGM_ASSIGN_FOCUS_PAD_SEG, 0000h, C2_SEG, EP_PGM_ASSIGN_FOCUS_SOUND_OFF, EP_PGM_ASSIGN_FOCUS_SOUND_SEG ; THUNK  PREV  NEXT
        dw      EP_PGM_ASSIGN_FOCUS_PGM_OFF, EP_PGM_ASSIGN_FOCUS_PGM_SEG, EP_PGM_ASSIGN_FOCUS_PAD_ASSIGN_OFF, EP_PGM_ASSIGN_FOCUS_PAD_ASSIGN_SEG, EP_L_4E234_OFF, EP_L_4E234_SEG, EP_L_4F6E2_OFF, EP_L_4F6E2_SEG ; +1Ah..+21h  NOTIFY  ENTER
        else
        dw      (C2_BASE+pgm_assign_focus_pad-C2_SEG*16), C2_SEG, (C2_BASE+L_4D7F6-C1_SEG*16), C1_SEG, EP_L_4D98A_OFF, C2_SEG
        dw      0000h, C2_SEG
        dw      EP_PGM_ASSIGN_FOCUS_PAD_ASSIGN_OFF, EP_PGM_ASSIGN_FOCUS_PAD_ASSIGN_SEG
        dw      EP_L_4E234_OFF, EP_L_4E234_SEG
        dw      EP_L_4F6E2_OFF, EP_L_4F6E2_SEG
        endif
        db      0c3h, 0ch, 2ah, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h ; [3] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_PGM_ASSIGN_FOCUS_PAD_ASSIGN_OFF, EP_PGM_ASSIGN_FOCUS_PAD_ASSIGN_SEG, 0000h, C2_SEG ; THUNK  PREV  NEXT
        else
        dw      EP_PGM_ASSIGN_FOCUS_PAD_ASSIGN_OFF, EP_PGM_ASSIGN_FOCUS_PAD_ASSIGN_SEG, (C2_BASE+L_4D7F6-C1_SEG*16), C1_SEG
        endif
        db      00h, 00h, 00h, 00h
        dw      (C2_BASE+PGM_ASSIGN_FOCUS_PAD-C2_SEG*16), C2_SEG, (C2_BASE+PGM_ASSIGN_FOCUS_NOTE-C2_SEG*16), C2_SEG, (C2_BASE+L_4E2B2-C2_SEG*16), C2_SEG, (C2_BASE+L_4F610-C2_SEG*16), C2_SEG ; +1Ah..+21h  NOTIFY  ENTER
d_c2_w_02d36:
        db      27h, 16h, 0ch, 02h, 01h, 00h, 23h, 00h, 00h, 00h, 62h, 00h, 00h, 00h ; [4] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_PGM_ASSIGN_FOCUS_NOTE_OFF, EP_PGM_ASSIGN_FOCUS_NOTE_SEG, EP_PGM_ASSIGN_FOCUS_PGM_OFF, EP_PGM_ASSIGN_FOCUS_PGM_SEG, EP_PGM_ASSIGN_FOCUS_6_OFF, EP_PGM_ASSIGN_FOCUS_6_SEG ; THUNK  PREV  NEXT
        else
        dw      EP_PGM_ASSIGN_FOCUS_NOTE_OFF, EP_PGM_ASSIGN_FOCUS_NOTE_SEG
        dw      (C2_BASE+PGM_ASSIGN_FOCUS_PGM-C2_SEG*16), C2_SEG
        dw      EP_PGM_ASSIGN_FOCUS_6_OFF, EP_PGM_ASSIGN_FOCUS_6_SEG
        endif
        dw      EP_PGM_ASSIGN_FOCUS_PAD_ASSIGN_OFF, EP_PGM_ASSIGN_FOCUS_PAD_ASSIGN_SEG, EP_PGM_ASSIGN_FOCUS_SOUND_OFF, EP_PGM_ASSIGN_FOCUS_SOUND_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_L_4E2DA_OFF, EP_L_4E2DA_SEG
d_c2_w_02d60:
        db      51h, 16h, 60h, 01h, 00h, 42h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [5] x,y,class,digits  STORE  MIN  MAX
        dw      EP_PGM_ASSIGN_FOCUS_SOUND_OFF, EP_PGM_ASSIGN_FOCUS_SOUND_SEG, EP_PGM_ASSIGN_FOCUS_PAD_OFF, EP_PGM_ASSIGN_FOCUS_PAD_SEG ; THUNK  PREV  NEXT
d_c2_w_02d76:
        db      00h, 00h
d_c2_w_02d78:
        db      00h, 00h
        dw      EP_PGM_ASSIGN_FOCUS_NOTE_OFF, EP_PGM_ASSIGN_FOCUS_NOTE_SEG, EP_PGM_ASSIGN_FOCUS_6_OFF, EP_PGM_ASSIGN_FOCUS_6_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_L_4DD6E_OFF, EP_L_4DD6E_SEG
        db      27h, 28h, 24h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 03h, 00h, 00h, 00h ; [6] x,y,class,digits  STORE  MIN  MAX
        dw      EP_PGM_ASSIGN_FOCUS_6_OFF, EP_PGM_ASSIGN_FOCUS_6_SEG, EP_PGM_ASSIGN_FOCUS_NOTE_OFF, EP_PGM_ASSIGN_FOCUS_NOTE_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_PGM_ASSIGN_FOCUS_SOUND_OFF, EP_PGM_ASSIGN_FOCUS_SOUND_SEG, EP_L_4E3EC_OFF, EP_L_4E3EC_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_02db4:
        db      91h, 1fh, 12h, 03h, 01h, 00h, 00h, 00h, 00h, 00h, 7eh, 00h, 00h, 00h ; [7] x,y,class,digits  STORE  MIN  MAX
        dw      EP_PGM_ASSIGN_MODE_FIELD_OFF, EP_PGM_ASSIGN_MODE_FIELD_SEG, EP_PGM_ASSIGN_FOCUS_SOUND_OFF, EP_PGM_ASSIGN_FOCUS_SOUND_SEG, EP_PGM_ASSIGN_FOCUS_THRESHOLD2_OFF, EP_PGM_ASSIGN_FOCUS_THRESHOLD2_SEG ; THUNK  PREV  NEXT
        dw      EP_PGM_ASSIGN_FOCUS_6_OFF, EP_PGM_ASSIGN_FOCUS_6_SEG, EP_PGM_ASSIGN_FOCUS_ALT_NOTE1_OFF, EP_PGM_ASSIGN_FOCUS_ALT_NOTE1_SEG, EP_L_4E47A_OFF, EP_L_4E47A_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
d_c2_w_02dde:
        db      91h, 28h, 12h, 03h, 01h, 00h
d_c2_w_02de4:
        db      01h, 00h
d_c2_w_02de6:
        db      00h, 00h, 7fh, 00h, 00h, 00h; [8] x,y,class,digits  STORE  MIN  MAX
        dw      EP_PGM_ASSIGN_FOCUS_THRESHOLD2_OFF, EP_PGM_ASSIGN_FOCUS_THRESHOLD2_SEG, EP_PGM_ASSIGN_MODE_FIELD_OFF, EP_PGM_ASSIGN_MODE_FIELD_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_PGM_ASSIGN_FOCUS_6_OFF, EP_PGM_ASSIGN_FOCUS_6_SEG, EP_PGM_ASSIGN_FOCUS_ALT_NOTE2_OFF, EP_PGM_ASSIGN_FOCUS_ALT_NOTE2_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_02e08:
        db      0c7h, 1fh, 24h, 02h, 01h, 00h, 22h, 00h, 00h, 00h, 62h, 00h, 00h, 00h ; [9] x,y,class,digits  STORE  MIN  MAX
        dw      EP_PGM_ASSIGN_FOCUS_ALT_NOTE1_OFF, EP_PGM_ASSIGN_FOCUS_ALT_NOTE1_SEG, EP_PGM_ASSIGN_FOCUS_PAD_ASSIGN_OFF, EP_PGM_ASSIGN_FOCUS_PAD_ASSIGN_SEG, EP_PGM_ASSIGN_FOCUS_ALT_NOTE2_OFF, EP_PGM_ASSIGN_FOCUS_ALT_NOTE2_SEG ; THUNK  PREV  NEXT
d_c2_w_02e22:
        db      00h, 00h
d_c2_w_02e24:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h; +1Ah..+21h  NOTIFY  ENTER
d_c2_w_02e32:
        db      0c7h, 28h, 24h, 02h, 01h, 00h, 22h, 00h, 00h, 00h, 62h, 00h, 00h, 00h ; [10] x,y,class,digits  STORE  MIN  MAX
        dw      (C2_BASE+PGM_ASSIGN_FOCUS_ALT_NOTE2-C2_SEG*16), C2_SEG, (C2_BASE+PGM_ASSIGN_FOCUS_ALT_NOTE1-C2_SEG*16), C2_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
d_c2_w_02e4c:
        db      00h, 00h
d_c2_w_02e4e:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h; +1Ah..+21h  NOTIFY  ENTER
d_c2_b_02e5c:
        db      00h, 00h, 01h, 00h, 00h
        db      00h, 00h, 02h
        dw      EP_L_4E338_OFF, EP_L_4E338_SEG
        db      03h
        dw      EP_L_4E34A_OFF, EP_L_4E34A_SEG
        db      04h
        dw      EP_L_4E966_OFF, EP_L_4E966_SEG
        db      05h
        dw      (C2_BASE+L_4E018-C2_SEG*16), C2_SEG
        db      06h
        dw      EP_TGT_4E98A_OFF, EP_TGT_4E98A_SEG
        db      07h
        dw      (C2_BASE+L_4E5E8-C2_SEG*16), C2_SEG
        db      87h
        dw      EP_PAD_AUDITION_NOTE_OFF_OFF, EP_PAD_AUDITION_NOTE_OFF_SEG
        if      FW_VERSION >= 110
        db      37h
        dw      EP_FAR_4E706_OFF, EP_FAR_4E706_SEG
        db      32h
        else
        db      37h, 66h, 05h, 26h, 4dh, 32h
        endif
        dw      EP_FAR_4E766_OFF, EP_FAR_4E766_SEG
        db      15h
        dw      EP_FAR_4E9A6_OFF, EP_FAR_4E9A6_SEG
        db      34h
        dw      EP_AUDITION_STOP_OFF, EP_AUDITION_STOP_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h
d_c2_tbl_02ea0:
        if      FW_VERSION >= 111
        dw      (C2_BASE+L_4EBF8-C2_SEG*16)
d_c2_tbl_02ea2:
        dw      C2_SEG
        if      FW_VERSION >= 114
        dw      EP_L_4C168_OFF, C1_SEG
        else
        dw      EP_L_4B968_OFF, C1_SEG
        endif
        dw      EP_FAR_4EBFE_OFF, C2_SEG
        else
        dw      (C2_BASE+far_4EBC8-C2_SEG*16)
d_c2_tbl_02ea2:
        dw      C2_SEG
        dw      EP_FAR_4B80A_OFF, C1_SEG
        if      FW_VERSION >= 110
        dw      EP_L_4E29E_OFF, C2_SEG
        else
        db      5eh, 0ah, 26h, 4dh
        endif
        endif
d_c2_w_02eac:
        WIN_CLEAR
        db      1ah, 01h, 02h, 41h
        db      53h, 53h, 49h, 47h, 4eh, 00h
        WIN_SOFTKEY 2, 0, "PARAMS"
        WIN_SOFTKEY 3, 2, "DRUM"
        WIN_SOFTKEY 4, 2, "PURGE"
        WIN_SOFTKEY 5, 1, "AUTO"
        WIN_SOFTKEY 6, 1, "PLAY"
        WIN_LABEL 03h, 02h, "Pgm:__ Note:"
        WIN_LABEL 03h, 0ch, "<Envelope>"
        WIN_LABEL 03h, 16h, "Attack:"
        WIN_LABEL 09h, 1fh, "Decay:"
        WIN_LABEL 03h, 28h, "Dcy md:"
        WIN_RULE  0fh, 81h, 0ah, 28h
        WIN_LABEL 86h, 0eh, "<Filter>"
        WIN_LABEL 86h, 19h, "Freq:"
        WIN_LABEL 86h, 24h, "Reson:"
        WIN_RULE  0fh, 0bah, 0ah, 28h
        WIN_LABEL 0beh, 0ch, "Tune:"
        WIN_RULE  0ch, 0bah, 14h, 3ch
        WIN_LABEL 0beh, 16h, "Voice"
        WIN_LABEL 0beh, 1fh, "Overlap:"
        WIN_END
d_c2_w_02f6a:
        WIN_PIXEL1 02h, 0ch
        WIN_RESET_PEN
        WIN_CLEAR
        WIN_SOFTKEYS_REDRAW
        WIN_END
        db      00h, 00h, 00h, 17h, 00h, 00h, 00h
d_c2_tbl_02f78:
        dw      EP_FAR_4E9FA_OFF, EP_FAR_4E9FA_SEG
        db      00h, 00h, 00h, 00h
        dw      (C2_BASE+far_4E102-C2_SEG*16), C2_SEG
        db      00h, 00h, 00h, 00h
        if      FW_VERSION >= 110
        dw      EP_L_4EA3A_OFF, C2_SEG
        else
        dw      EP_FAR_4DAFA_OFF, C2_SEG
        endif
        dw      EP_L_4845E_OFF, EP_L_4845E_SEG
d_c2_tbl_02f90:
        dw      (C2_BASE+L_4EA1C-C2_SEG*16)
d_c2_tbl_02f92:
        dw      C2_SEG
d_c2_w_02f94:
        db      4bh, 02h, 0a2h, 02h, 01h, 00h, 23h, 00h, 00h, 00h, 62h, 00h, 00h
        db      00h
        if      FW_VERSION >= 110
        dw      EP_L_4EA3A_OFF, C2_SEG
        else
        dw      EP_FAR_4DAFA_OFF, C2_SEG
        endif
        db      00h, 00h, 00h, 00h
        dw      EP_L_4EB10_OFF, EP_L_4EB10_SEG
        dw      EP_FAR_4E9FA_OFF, EP_FAR_4E9FA_SEG
        dw      (C2_BASE+far_4E102-C2_SEG*16), C2_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_FAR_4E0F2_OFF, EP_FAR_4E0F2_SEG
        db      2dh, 16h, 12h
        db      03h, 01h, 00h, 00h, 00h, 00h, 00h, 64h, 00h, 00h, 00h
        if      FW_VERSION >= 112
        if      FW_VERSION >= 114
        dw      EP_L_4EA62_OFF, C2_SEG
        else
        dw      EP_C2_0902_OFF, C2_SEG
        endif
        dw      EP_FAR_4E9FA_OFF, EP_FAR_4E9FA_SEG
        dw      (C2_BASE+L_4EA9C-C2_SEG*16), C2_SEG
        dw      EP_L_4EA3A_OFF, C2_SEG
        else
        if      FW_VERSION >= 110
        dw      EP_FAR_4E102_OFF, C2_SEG, EP_L_4E09A_OFF, C2_SEG, EP_L_4EAD6_OFF, C2_SEG
        dw      EP_FAR_4E0DA_OFF, C2_SEG
        else
        dw      EP_FAR_4E102_OFF, C2_SEG, EP_FAR_4E9FA_OFF, EP_FAR_4E9FA_SEG, EP_L_4EA9C_OFF, EP_L_4EA9C_SEG
        dw      EP_FAR_4DAFA_OFF, C2_SEG
        endif
        endif
        dw      EP_L_4EB10_OFF, EP_L_4EB10_SEG
        db      00h
        db      00h, 00h, 00h
        if      FW_VERSION >= 111
        dw      EP_L_4FD16_OFF, C2_SEG
        elseif  FW_VERSION >= 110
        dw      EP_L_4F2B6_OFF, C2_SEG
        else
        dw      EP_L_4EDD6_OFF, C2_SEG
        endif
        db      2dh, 1fh, 12h, 03h, 01h, 00h, 00h, 00h, 00h
        db      00h, 64h, 00h, 00h, 00h
        if      FW_VERSION >= 112
        dw      (C2_BASE+L_4EA9C-C2_SEG*16), C2_SEG
        if      FW_VERSION >= 114
        dw      EP_L_4EA62_OFF, C2_SEG
        else
        dw      EP_C2_0902_OFF, C2_SEG
        endif
        dw      EP_L_4EAD6_OFF, C2_SEG
        else
        dw      EP_L_4EA9C_OFF, EP_L_4EA9C_SEG
        dw      EP_FAR_4E102_OFF, C2_SEG
        if      FW_VERSION >= 111
        db      36h
        db      09h, 84h, 4dh
        else
        dw      (C2_BASE+FAR_4E176-C2_SEG*16), C2_SEG
        endif
        endif
        dw      EP_FAR_4EB84_OFF, EP_FAR_4EB84_SEG
        dw      EP_FAR_4E1EA_OFF, EP_FAR_4E1EA_SEG
        db      00h, 00h, 00h, 00h
        if      FW_VERSION >= 111
        dw      EP_L_4FD16_OFF, C2_SEG
        elseif  FW_VERSION >= 110
        dw      EP_L_4F2B6_OFF, C2_SEG
        else
        dw      EP_L_4EDD6_OFF, C2_SEG
        endif
        db      2dh, 28h, 1eh, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h
        if      FW_VERSION >= 112
        dw      EP_C2_0976_OFF, C2_SEG
        else
        dw      (C2_BASE+FAR_4E176-C2_SEG*16), C2_SEG
        endif
        dw      EP_L_4EA9C_OFF, EP_L_4EA9C_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_L_4EBBE_OFF, EP_L_4EBBE_SEG
        dw      EP_FAR_4E1EA_OFF, EP_FAR_4E1EA_SEG
        db      00h, 00h, 00h, 00h
        if      FW_VERSION >= 111
        dw      EP_L_4FD16_OFF, C2_SEG
        elseif  FW_VERSION >= 110
        dw      EP_L_4F2B6_OFF, C2_SEG
        else
        dw      EP_L_4EDD6_OFF, C2_SEG
        endif
        db      0a4h, 19h, 12h, 03h, 01h
        db      00h, 00h, 00h, 00h, 00h, 64h, 00h, 00h, 00h
        if      FW_VERSION >= 112
        dw      EP_L_4EB10_OFF, EP_L_4EB10_SEG
        dw      EP_L_4EA3A_OFF, C2_SEG
        dw      EP_FAR_4E1EA_OFF, EP_FAR_4E1EA_SEG
        if      FW_VERSION >= 114
        dw      EP_L_4EA62_OFF, C2_SEG
        else
        dw      EP_C2_0902_OFF, C2_SEG
        endif
        else
        dw      (C2_BASE+L_4EB10-C2_SEG*16), C2_SEG
        if      FW_VERSION >= 110
        dw      EP_FAR_4E0DA_OFF, C2_SEG
        else
        dw      EP_FAR_4DAFA_OFF, C2_SEG
        endif
        dw      (C2_BASE+far_4E1EA-C2_SEG*16), C2_SEG, EP_FAR_4E102_OFF, C2_SEG
        endif
        dw      EP_FAR_4EB84_OFF, EP_FAR_4EB84_SEG
        db      00h, 00h, 00h
        db      00h
        dw      EP_VELO_MOD_ENTER_OFF, EP_VELO_MOD_ENTER_SEG
        db      0aah, 24h, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 0fh
        db      00h, 00h, 00h
        dw      EP_FAR_4E1EA_OFF, EP_FAR_4E1EA_SEG
        dw      EP_L_4EB10_OFF, EP_L_4EB10_SEG
        db      00h, 00h, 00h, 00h
        if      FW_VERSION >= 112
        dw      (C2_BASE+L_4EA9C-C2_SEG*16), C2_SEG
        dw      EP_L_4EBBE_OFF, EP_L_4EBBE_SEG
        elseif  FW_VERSION >= 110
        dw      EP_L_4EAD6_OFF, C2_SEG
        dw      (C2_BASE+L_4E25E-C2_SEG*16), C2_SEG
        else
        dw      EP_L_4EA9C_OFF, EP_L_4EA9C_SEG
        dw      EP_L_4EBBE_OFF, EP_L_4EBBE_SEG
        endif
        db      00h, 00h, 00h, 00h
        dw      EP_VELO_MOD_ENTER_OFF, EP_VELO_MOD_ENTER_SEG
        db      0dch, 0ch, 18h, 03h, 02h, 80h
        TUNE_RANGE
        if      FW_VERSION >= 112
        dw      (C2_BASE+far_4EB84-C2_SEG*16), C2_SEG
        dw      EP_L_4EA3A_OFF, C2_SEG
        dw      EP_L_4EBBE_OFF, EP_L_4EBBE_SEG
        dw      EP_L_4EB10_OFF, EP_L_4EB10_SEG
        else
        if      FW_VERSION >= 110
        dw      EP_FAR_4EB84_OFF, EP_FAR_4EB84_SEG, EP_FAR_4E0DA_OFF, C2_SEG
        else
        dw      EP_FAR_4EB84_OFF, EP_FAR_4EB84_SEG, EP_FAR_4DAFA_OFF, C2_SEG
        endif
        dw      (C2_BASE+L_4E25E-C2_SEG*16), C2_SEG
        dw      (C2_BASE+L_4EB10-C2_SEG*16), C2_SEG
        endif
        dw      EP_L_4EA9C_OFF, EP_L_4EA9C_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_VELO_PITCH_ENTER_OFF, EP_VELO_PITCH_ENTER_SEG
voice_overlap_desc:                     ; PARAMS field 8; MIN 0 MAX 2, POLY/MONO/NOTE OFF
        db      0beh, 28h, 30h, 01h, 01h, 40h, 00h
        db      00h, 00h, 00h, 02h, 00h, 00h, 00h
        dw      EP_L_4EBBE_OFF, EP_L_4EBBE_SEG
        dw      EP_FAR_4EB84_OFF, EP_FAR_4EB84_SEG
        db      00h
        db      00h, 00h, 00h
        dw      EP_FAR_4E1EA_OFF, EP_FAR_4E1EA_SEG
        if      FW_VERSION >= 112
        dw      EP_C2_0976_OFF, C2_SEG
        else
        dw      (C2_BASE+FAR_4E176-C2_SEG*16), C2_SEG
        endif
        db      00h, 00h, 00h, 00h
        dw      (C2_BASE+L_50674-C2_SEG*16), C2_SEG
TBL_WINKEYS_PGM_MIDI:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F1, EP_PGM_MIDI_F1_SEG, EP_PGM_MIDI_F1_OFF
        WIN_KEY   WIN_K_F2, EP_PGM_MIDI_F2_SEG, EP_PGM_MIDI_F2_OFF
        WIN_KEY   WIN_K_F3, EP_PGM_MIDI_F3_SEG, EP_PGM_MIDI_F3_OFF
        WIN_KEY   WIN_K_F4, EP_PGM_MIDI_F4_SEG, EP_PGM_MIDI_F4_OFF
        WIN_KEY   WIN_K_PAINT, EP_PGM_MIDI_PAINT_SEG, EP_PGM_MIDI_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_PGM_MIDI_OPEN_SEG, EP_PGM_MIDI_OPEN_OFF
        WIN_KEY   WIN_K_REFRESH, EP_PGM_MIDI_REFRESH_SEG, EP_PGM_MIDI_REFRESH_OFF
        WIN_KEY_END
        db      00h
d_c2_w_03112:
        WIN_CLEAR
        WIN_SOFTKEY 1, 2, "ASSIGN"
        WIN_SOFTKEY 2, 2, "PARAMS"
        WIN_SOFTKEY 3, 0, "DRUM"
        WIN_SOFTKEY 4, 2, "PURGE"
        WIN_LABEL 03h, 02h, "Drum:"
        WIN_LABEL 59h, 02h, "Pad to internal sound:"
        WIN_LABEL 09h, 0eh, "Pgm:__-"
        WIN_LABEL 03h, 19h, "Program Change:"
        WIN_LABEL 15h, 24h, "MIDI volume:"
        WIN_LABEL 93h, 24h, "Current val.:"
        WIN_END
        db      00h
d_c2_w_0319c:
        db      21h, 02h, 06h, 01h, 01h
        db      20h, 00h, 00h, 00h, 00h, 03h, 00h, 00h, 00h
d_c2_tbl_031aa:
        dw      EP_PGM_MIDI_FOCUS_PGM_OFF, EP_PGM_MIDI_FOCUS_PGM_SEG
        db      00h, 00h, 00h
        db      00h
        dw      EP_FAR_4EE6A_OFF, EP_FAR_4EE6A_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_FAR_4EE52_OFF, EP_FAR_4EE52_SEG
        dw      EP_L_4EE46_OFF, EP_L_4EE46_SEG
d_c2_tbl_031c2:
        db      00h, 00h
d_c2_tbl_031c4:
        db      00h, 00h
TBL_FIELDS_319C:                        ; 6 x FIELD_SIZE; the part of the array this .asm emits itself
        db      0ddh, 02h, 12h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FAR_4EE52_OFF, EP_FAR_4EE52_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_PGM_MIDI_FOCUS_FIELD5_OFF, EP_PGM_MIDI_FOCUS_FIELD5_SEG
        dw      (C2_BASE+PGM_MIDI_FOCUS_PGM-C2_SEG*16), C2_SEG, (C2_BASE+FAR_4EE6A-C2_SEG*16), C2_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_031f0:
        db      21h, 0eh, 72h, 02h, 01h, 20h, 00h, 00h, 00h, 00h, 17h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_FAR_4EE6A_OFF, EP_FAR_4EE6A_SEG, EP_PGM_MIDI_FOCUS_PGM_OFF, EP_PGM_MIDI_FOCUS_PGM_SEG, EP_PGM_MIDI_FOCUS_FIELD3_OFF, EP_PGM_MIDI_FOCUS_FIELD3_SEG ; THUNK  PREV  NEXT
        dw      EP_FAR_4EE52_OFF, EP_FAR_4EE52_SEG, EP_PGM_MIDI_FOCUS_FIELD3_OFF, EP_PGM_MIDI_FOCUS_FIELD3_SEG, EP_L_4845E_OFF, EP_L_4845E_SEG, EP_L_4EE8C_OFF, C2_SEG ; +1Ah..+21h  NOTIFY  ENTER
        else
        dw      EP_FAR_4EE6A_OFF, EP_FAR_4EE6A_SEG, EP_PGM_MIDI_FOCUS_PGM_OFF, EP_PGM_MIDI_FOCUS_PGM_SEG
        dw      EP_PGM_MIDI_FOCUS_FIELD3_OFF, EP_PGM_MIDI_FOCUS_FIELD3_SEG, EP_FAR_4EE52_OFF, EP_FAR_4EE52_SEG
        dw      (C2_BASE+pgm_midi_focus_field3-C2_SEG*16), C2_SEG
        dw      (C2_BASE+L_4845E-C1_SEG*16), C1_SEG
        dw      (C2_BASE+L_4EE8C-C2_SEG*16), C2_SEG
        endif
d_c2_w_0321a:
        db      5dh, 19h, 2ah, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h ; [3] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_PGM_MIDI_FOCUS_FIELD3_OFF, EP_PGM_MIDI_FOCUS_FIELD3_SEG, EP_FAR_4EE6A_OFF, EP_FAR_4EE6A_SEG, EP_PGM_MIDI_FOCUS_FIELD4_OFF, EP_PGM_MIDI_FOCUS_FIELD4_SEG ; THUNK  PREV  NEXT
        dw      EP_FAR_4EE6A_OFF, EP_FAR_4EE6A_SEG, EP_PGM_MIDI_FOCUS_FIELD4_OFF, EP_PGM_MIDI_FOCUS_FIELD4_SEG ; +1Ah..+21h  NOTIFY  ENTER
        else
        dw      (C2_BASE+pgm_midi_focus_field3-C2_SEG*16), C2_SEG, EP_FAR_4EE6A_OFF, EP_FAR_4EE6A_SEG
        dw      (C2_BASE+pgm_midi_focus_field4-C2_SEG*16), C2_SEG, EP_FAR_4EE6A_OFF, EP_FAR_4EE6A_SEG
        dw      EP_PGM_MIDI_FOCUS_FIELD4_OFF, EP_PGM_MIDI_FOCUS_FIELD4_SEG
        endif
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_03244:
        db      5dh, 24h, 2ah, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h ; [4] x,y,class,digits  STORE  MIN  MAX
        dw      EP_PGM_MIDI_FOCUS_FIELD4_OFF, EP_PGM_MIDI_FOCUS_FIELD4_SEG, EP_PGM_MIDI_FOCUS_FIELD3_OFF, EP_PGM_MIDI_FOCUS_FIELD3_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_PGM_MIDI_FOCUS_FIELD3_OFF, EP_PGM_MIDI_FOCUS_FIELD3_SEG, EP_PGM_MIDI_FOCUS_FIELD5_OFF, EP_PGM_MIDI_FOCUS_FIELD5_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_0326e:
        db      0e1h, 24h, 12h, 03h, 01h, 00h, 00h, 00h, 00h, 00h, 7fh, 00h, 00h, 00h ; [5] x,y,class,digits  STORE  MIN  MAX
        dw      EP_PGM_MIDI_FOCUS_FIELD5_OFF, EP_PGM_MIDI_FOCUS_FIELD5_SEG, EP_FAR_4EE52_OFF, EP_FAR_4EE52_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_PGM_MIDI_FOCUS_FIELD4_OFF, EP_PGM_MIDI_FOCUS_FIELD4_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      01h, 00h, 00h, 00h, 00h, 02h
        dw      EP_PGM_ASSIGN_SCREEN_DRAW_OFF, EP_PGM_ASSIGN_SCREEN_DRAW_SEG
        db      03h
        dw      EP_PGM_PARAMS_ENTER_OFF, EP_PGM_PARAMS_ENTER_SEG
        db      04h
        dw      EP_FAR_4EC12_OFF, EP_FAR_4EC12_SEG
TBL_WINKEYS_PURGE:
        WIN_KEY   WIN_K_F4, EP_PURGE_F4_SEG, EP_PURGE_F4_OFF
        WIN_KEY   WIN_K_PAINT, EP_PURGE_PAINT_SEG, EP_PURGE_PAINT_OFF
        WIN_KEY_END
        db      00h
        WIN_CLEAR
        db      1ah, 01h, 02h, 41h
        db      53h, 53h, 49h, 47h, 4eh, 00h
        WIN_SOFTKEY 2, 2, "PARAMS"
        WIN_SOFTKEY 3, 2, "DRUM"
        WIN_SOFTKEY 4, 0, "PURGE"
        WIN_BITMAP 19h, 0bh, 00h
        WIN_LABEL 3fh, 08h, "Pressing DO IT will erase"
        WIN_LABEL 3fh, 11h, "all sounds not used in"
        WIN_LABEL 3fh, 1ah, "any programs in memory."
        WIN_LABEL 30h, 25h, "sounds not used in any programs."
        WIN_END
        db      00h
d_c2_w_0335e:
        db      01h, 00h, 00h
        db      00h, 00h, 03h
        dw      EP_L_4F180_OFF, EP_L_4F180_SEG
TBL_WINKEYS_PROGRAM:
        WIN_KEY   WIN_K_F3, EP_PROGRAM_NEW_SEG, EP_PROGRAM_NEW_OFF
        WIN_KEY   WIN_K_F4, EP_PROGRAM_CLOSE_SEG, EP_PROGRAM_CLOSE_OFF
        WIN_KEY   WIN_K_F5, EP_PROGRAM_COPY_SEG, EP_PROGRAM_COPY_OFF
        WIN_KEY   WIN_K_PAINT, EP_PROGRAM_PAINT_SEG, EP_PROGRAM_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_PROGRAM_CLOSE_SEG, EP_PROGRAM_CLOSE_OFF
        WIN_KEY_END
d_c2_w_03386:
        WIN_LABEL 25h, 13h, "Program name:"
        WIN_LABEL 31h, 25h, "MIDI program change:"
        WIN_SOFTKEY 2, 1, "DELETE"
        WIN_SOFTKEY 3, 1, "NEW"
        WIN_SOFTKEY 4, 2, "CLOSE"
        WIN_SOFTKEY 5, 1, "COPY"
        WIN_END
d_c2_w_033d2:
        db      73h, 13h, 60h, 02h, 00h, 41h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_tbl_033e0:
        dw      EP_L_4F118_OFF, EP_L_4F118_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_L_4F140_OFF, EP_L_4F140_SEG
        db      00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
TBL_FIELDS_33D2:                        ; 2 x FIELD_SIZE; the part of the array this .asm emits itself
        db      0a9h, 25h, 12h, 03h, 01h, 20h, 00h, 00h, 00h, 00h, 7fh, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_L_4F140_OFF, EP_L_4F140_SEG, EP_L_4F118_OFF, EP_L_4F118_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        db      01h, 00h, 00h, 00h, 00h, 04h
        dw      EP_FAR_4F282_OFF, EP_FAR_4F282_SEG
        db      05h
        dw      EP_DELETE_PGM_OPEN_OFF, EP_DELETE_PGM_OPEN_SEG
        db      06h
        dw      EP_FAR_4F1AC_OFF, EP_FAR_4F1AC_SEG
TBL_WINKEYS_DELETE_PGM:
        WIN_KEY   WIN_K_PAINT, EP_DELETE_PGM_PAINT_SEG, EP_DELETE_PGM_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_DELETE_PGM_OPEN_SEG, EP_DELETE_PGM_OPEN_OFF
        WIN_KEY_END
        db      00h
d_c2_w_0344a:
        WIN_BITMAP 0d9h, 1ch, 01h
        db      07h, 49h, 11h
        db      50h, 67h, 6dh, 3ah, 5fh, 5fh, 2dh, 00h
        WIN_LABEL 37h, 1eh, "Pressing DO IT will erase"
        WIN_LABEL 37h, 27h, "this program!!"
        WIN_SOFTKEY 3, 1, "ALLpgm"
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_END
d_c2_w_034a6:
        db      61h, 11h, 72h, 02h, 01h, 20h, 00h, 00h, 00h, 00h, 17h
        db      00h, 00h, 00h
d_c2_fp_034b4:
        dw      EP_FAR_4F260_OFF, EP_FAR_4F260_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_FAR_48484_OFF, EP_FAR_48484_SEG
        db      00h, 00h, 00h, 00h, 01h
        db      00h, 00h, 00h, 00h, 05h
        dw      EP_FAR_4F296_OFF, EP_FAR_4F296_SEG
        db      06h
        dw      EP_FAR_4F2A4_OFF, EP_FAR_4F2A4_SEG
        db      32h
        if      FW_VERSION >= 112
        dw      (C2_BASE+L_4F2CA-C2_SEG*16), C2_SEG
        else
        dw      (C2_BASE+L_4E96A-C2_SEG*16), C2_SEG
        endif
        db      15h
        dw      EP_FAR_4F296_OFF, EP_FAR_4F296_SEG
        db      00h, 00h, 00h, 00h, 00h
        WIN_BITMAP 0d9h, 1ch, 01h
        WIN_BITMAP 3ah, 13h, 00h
        WIN_LABEL 50h, 13h, "Pressing DO IT will erase"
        WIN_LABEL 50h, 1ch, "ALL programs!!"
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_END
        db      00h
TBL_WINKEYS_NEW_PGM:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F4, EP_NEW_PGM_CANCEL_SEG, EP_NEW_PGM_CANCEL_OFF
        WIN_KEY   WIN_K_F5, EP_NEW_PGM_DO_IT_SEG, EP_NEW_PGM_DO_IT_OFF
        WIN_KEY   WIN_K_PAINT, EP_NEW_PGM_PAINT_SEG, EP_NEW_PGM_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_NEW_PGM_CANCEL_SEG, EP_NEW_PGM_CANCEL_OFF
        WIN_KEY_END
d_c2_w_03558:
        db      07h, 49h, 13h
        db      4eh, 65h, 77h, 20h, 6eh, 61h, 6dh, 65h, 3ah, 00h
        WIN_LABEL 49h, 25h, "MIDI program change:"
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_END
        db      00h
d_c2_w_03592:
        db      7fh, 13h, 60h, 02h, 00h, 41h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_tbl_035a0:
        dw      EP_DELETE_PGM_FIELD0_THUNK_OFF, EP_DELETE_PGM_FIELD0_THUNK_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_DELETE_PGM_FIELD1_THUNK_OFF, EP_DELETE_PGM_FIELD1_THUNK_SEG
        db      00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
TBL_FIELDS_3592:                        ; 2 x FIELD_SIZE; the part of the array this .asm emits itself
        db      0c1h, 25h, 12h, 03h, 01h, 20h, 00h, 00h, 00h, 00h, 7fh, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      (C2_BASE+DELETE_PGM_FIELD1_THUNK-C2_SEG*16), C2_SEG, (C2_BASE+DELETE_PGM_FIELD0_THUNK-C2_SEG*16), C2_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        db      01h, 00h, 00h, 00h, 00h, 05h
        dw      EP_COPY_PGM_CANCEL_OFF, EP_COPY_PGM_CANCEL_SEG
        db      06h
        dw      EP_FAR_4F4D0_OFF, EP_FAR_4F4D0_SEG
TBL_WINKEYS_COPY_PGM:
        WIN_KEY   WIN_K_PAINT, EP_COPY_PGM_PAINT_SEG, EP_COPY_PGM_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_COPY_PGM_CANCEL_SEG, EP_COPY_PGM_CANCEL_OFF
        WIN_KEY_END
d_c2_w_03604:
        WIN_LABEL 49h, 10h, "Pgm:__-"
        WIN_BITMAP 85h, 19h, 02h
        WIN_LABEL 97h, 1ch, "COPY"
        WIN_LABEL 49h, 28h, "Pgm:__-"
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_END
        db      00h
d_c2_w_03632:
        db      61h, 10h, 72h, 02h, 01h, 20h, 00h, 00h, 00h, 00h, 17h, 00h, 00h, 00h
        dw      EP_L_4F5D0_OFF, EP_L_4F5D0_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_L_4F5E2_OFF, EP_L_4F5E2_SEG
        db      00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h
        dw      EP_FAR_48484_OFF, EP_FAR_48484_SEG
        db      00h, 00h, 00h, 00h
TBL_FIELDS_3632:                        ; 2 x FIELD_SIZE; the part of the array this .asm emits itself
        db      61h, 28h, 72h, 02h, 01h, 20h, 00h, 00h, 00h, 00h, 17h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
d_c2_fp_0366a:
        dw      EP_L_4F5E2_OFF, EP_L_4F5E2_SEG, EP_L_4F5D0_OFF, EP_L_4F5D0_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
TBL_WINKEYS_INIT_PAD_ASSIGN:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F4, EP_INIT_PAD_ASSIGN_OPEN_SEG, EP_INIT_PAD_ASSIGN_OPEN_OFF
        WIN_KEY   WIN_K_F5, EP_INIT_PAD_ASSIGN_F5_SEG, EP_INIT_PAD_ASSIGN_F5_OFF
        WIN_KEY   WIN_K_PAINT, EP_INIT_PAD_ASSIGN_PAINT_SEG, EP_INIT_PAD_ASSIGN_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_INIT_PAD_ASSIGN_OPEN_SEG, EP_INIT_PAD_ASSIGN_OPEN_OFF
        WIN_KEY_END
d_c2_w_036a4:
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_LABEL 25h, 17h, "Initialize pad assign:"
        WIN_END
d_c2_w_036d2:
        db      0a9h, 17h, 2ah, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h
d_c2_fp_036e0:
        dw      (C2_BASE+L_4F6A4-C2_SEG*16), C2_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h
        dw      EP_FAR_4F6BC_OFF, EP_FAR_4F6BC_SEG
        db      00h, 00h, 00h, 00h
d_c2_w_036fc:
        db      01h, 00h, 00h, 00h, 00h
        db      05h
        dw      EP_ASSIGN_VIEW_CLOSE_OFF, EP_ASSIGN_VIEW_CLOSE_SEG
        db      3ch
        dw      EP_L_3C4BE_OFF, EP_L_3C4BE_SEG
        db      3dh
        dw      EP_L_3C4CE_OFF, EP_L_3C4CE_SEG
        db      3eh
        dw      EP_FAR_3C4DE_OFF, EP_FAR_3C4DE_SEG
        db      3fh
        dw      EP_FAR_3C4EE_OFF, EP_FAR_3C4EE_SEG
        db      37h
        dw      EP_FAR_4F70A_OFF, EP_FAR_4F70A_SEG
TBL_WINKEYS_ASSIGN_VIEW:
        WIN_KEY   WIN_K_PAINT, EP_ASSIGN_VIEW_PAINT_SEG, EP_ASSIGN_VIEW_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_ASSIGN_VIEW_CLOSE_SEG, EP_ASSIGN_VIEW_CLOSE_OFF
        WIN_KEY   WIN_K_REFRESH, EP_ASSIGN_VIEW_REFRESH_SEG, EP_ASSIGN_VIEW_REFRESH_OFF
        WIN_KEY_END
        db      00h
d_c2_w_03734:
        WIN_LABEL 13h, 0ah, "Bank:"
        WIN_LABEL 3dh, 0ah, "Note:__="
        WIN_SOFTKEY 4, 2, "CLOSE"
        WIN_END
        db      00h
d_c2_w_03754:
        db      5bh, 0ah, 0ch, 02h, 01h, 00h, 22h, 00h, 00h, 00h, 62h, 00h, 00h
        db      00h
d_c0_fp_03762:
        dw      EP_FAR_4F98C_OFF, EP_FAR_4F98C_SEG
        if      FW_VERSION >= 112
        dw      EP_FAR_4F9B4_OFF, C2_SEG
        dw      EP_FAR_4F9D8_OFF, EP_FAR_4F9D8_SEG
        dw      EP_L_4F9FC_OFF, EP_L_4F9FC_SEG
        dw      (C2_BASE+far_4F0BE-C2_SEG*16), C2_SEG
        else
        dw      (C2_BASE+far_4F9B4-C2_SEG*16), C2_SEG, EP_FAR_4F9D8_OFF, EP_FAR_4F9D8_SEG, EP_L_4F9FC_OFF, EP_L_4F9FC_SEG
        dw      EP_FAR_4F0BE_OFF, C2_SEG
        endif
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
TBL_WINKEYS_COPY_NOTE:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F4, EP_COPY_NOTE_CLOSE_SEG, EP_COPY_NOTE_CLOSE_OFF
        WIN_KEY   WIN_K_F5, EP_COPY_NOTE_F5_SEG, EP_COPY_NOTE_F5_OFF
        WIN_KEY   WIN_K_PAINT, EP_COPY_NOTE_PAINT_SEG, EP_COPY_NOTE_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_COPY_NOTE_CLOSE_SEG, EP_COPY_NOTE_CLOSE_OFF
        WIN_KEY_END
        db      07h, 19h, 10h, 43h, 4fh
        db      50h, 59h, 00h
        WIN_BITMAP 1fh, 19h, 02h
        WIN_LABEL 37h, 0bh, "Prog:__-"
        WIN_LABEL 37h, 14h, "Note:__/___-"
        WIN_RULE  0ch, 37h, 1dh, 0b0h
        WIN_LABEL 37h, 20h, "Prog:__-"
        WIN_LABEL 37h, 29h, "Note:__/___-"
        WIN_SOFTKEY 4, 2, "CLOSE"
        WIN_END
d_c2_w_037ee:
        db      55h, 0bh, 72h
        db      02h, 01h, 20h, 00h, 00h, 00h, 00h, 17h, 00h, 00h, 00h
d_c2_tbl_037fc:
        dw      EP_COPY_NOTE_FIELD0_THUNK_OFF, EP_COPY_NOTE_FIELD0_THUNK_SEG
        db      00h
        db      00h, 00h, 00h
        dw      EP_COPY_NOTE_FIELD1_THUNK_OFF, EP_COPY_NOTE_FIELD1_THUNK_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      (C2_BASE+L_4845E-C1_SEG*16), C1_SEG
        db      00h, 00h, 00h, 00h
TBL_FIELDS_37EE:                        ; 4 x FIELD_SIZE; the part of the array this .asm emits itself
        db      55h, 14h, 8ah, 02h, 01h, 00h, 23h, 00h, 00h, 00h, 62h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_COPY_NOTE_FIELD1_THUNK_OFF, EP_COPY_NOTE_FIELD1_THUNK_SEG, EP_COPY_NOTE_FIELD0_THUNK_OFF, EP_COPY_NOTE_FIELD0_THUNK_SEG, EP_COPY_NOTE_FIELD2_THUNK_OFF, EP_COPY_NOTE_FIELD2_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
d_c2_w_03842:
        db      55h, 20h, 72h, 02h, 01h, 20h, 00h, 00h, 00h, 00h, 17h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        dw      EP_COPY_NOTE_FIELD2_THUNK_OFF, EP_COPY_NOTE_FIELD2_THUNK_SEG, EP_COPY_NOTE_FIELD1_THUNK_OFF, EP_COPY_NOTE_FIELD1_THUNK_SEG, EP_FAR_4FCE8_OFF, EP_FAR_4FCE8_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_L_4845E_OFF, EP_L_4845E_SEG
        db      00h, 00h, 00h, 00h
d_c2_w_0386c:
        db      55h, 29h, 8ah, 02h, 01h, 00h, 23h, 00h, 00h, 00h, 62h, 00h, 00h, 00h ; [3] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FAR_4FCE8_OFF, EP_FAR_4FCE8_SEG, EP_COPY_NOTE_FIELD2_THUNK_OFF, EP_COPY_NOTE_FIELD2_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
d_c2_w_03896:
        db      01h, 00h, 00h, 00h, 00h, 05h
        dw      EP_VELOCITY_MOD_OPEN_OFF, EP_VELOCITY_MOD_OPEN_SEG
        db      06h
        dw      EP_L_4E5E8_OFF, EP_L_4E5E8_SEG
        db      86h
        dw      EP_PAD_AUDITION_NOTE_OFF_OFF, EP_PAD_AUDITION_NOTE_OFF_SEG
        if      FW_VERSION >= 112
TBL_WINKEYS_VELOCITY_MOD:
        endif
        WIN_KEY   WIN_K_PAD, EP_VELOCITY_MOD_PAD_SEG, EP_VELOCITY_MOD_PAD_OFF
        WIN_KEY   WIN_K_PAINT, EP_VELOCITY_MOD_PAINT_SEG, EP_VELOCITY_MOD_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_VELOCITY_MOD_OPEN_SEG, EP_VELOCITY_MOD_OPEN_OFF
        if      FW_VERSION >= 112
        WIN_KEY   WIN_K_REFRESH, C2_SEG, EP_VELOCITY_MOD_REFRESH_OFF
        else
        db      34h
        dw      (C2_BASE+far_4F572-C2_SEG*16), C2_SEG
        endif
        WIN_KEY_END
        db      00h
d_c2_w_038c4:
        db      07h, 19h, 0bh, 4eh, 6fh, 74h, 65h, 3ah, 00h, 0ch, 13h, 13h, 0d6h
        db      07h, 1fh, 17h
        db      "Velo"
        db      0ch
        db      "Attack:"
        db      00h, 07h, 1fh
        db      "!Velo^"
        db      0ch
        db      "^Start:"
        db      00h, 07h, 1fh
        db      "+Velo^"
        db      0ch
        db      "^Level:"
        db      00h, 07h, 0a9h
        db      "(Velo:"
        db      00h, 1ah, 04h, 02h
        db      "CLOSE"
        db      00h, 1ah, 05h, 01h
        db      "PLAY"
        db      00h, 00h
d_c2_w_0391e:
        db      37h, 0bh, 0a2h
        db      02h, 01h, 00h, 23h, 00h, 00h, 00h, 62h, 00h, 00h, 00h
d_c2_tbl_0392c:
        dw      EP_VELOCITY_MOD_FIELD0_THUNK_OFF, EP_VELOCITY_MOD_FIELD0_THUNK_SEG
        db      00h
        db      00h, 00h, 00h
        dw      EP_VELOCITY_MOD_FIELD1_THUNK_OFF, EP_VELOCITY_MOD_FIELD1_THUNK_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h
TBL_FIELDS_391E:                        ; 5 x FIELD_SIZE; the part of the array this .asm emits itself
        db      67h, 17h, 12h, 03h, 01h, 00h, 00h, 00h, 00h, 00h, 64h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_VELOCITY_MOD_FIELD1_THUNK_OFF, EP_VELOCITY_MOD_FIELD1_THUNK_SEG, EP_VELOCITY_MOD_FIELD0_THUNK_OFF, EP_VELOCITY_MOD_FIELD0_THUNK_SEG, EP_VELOCITY_MOD_FIELD2_THUNK_OFF, EP_VELOCITY_MOD_FIELD2_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
d_c2_w_03972:
        db      67h, 21h, 12h, 03h, 01h, 00h, 00h, 00h, 00h, 00h, 64h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        dw      EP_VELOCITY_MOD_FIELD2_THUNK_OFF, EP_VELOCITY_MOD_FIELD2_THUNK_SEG, EP_VELOCITY_MOD_FIELD1_THUNK_OFF, EP_VELOCITY_MOD_FIELD1_THUNK_SEG, EP_VELOCITY_MOD_FIELD3_THUNK_OFF, EP_VELOCITY_MOD_FIELD3_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
d_c2_w_0399c:
        db      67h, 2bh, 12h, 03h, 01h, 00h, 00h, 00h, 00h, 00h, 64h, 00h, 00h, 00h ; [3] x,y,class,digits  STORE  MIN  MAX
        dw      (C2_BASE+VELOCITY_MOD_FIELD3_THUNK-C2_SEG*16), C2_SEG, (C2_BASE+VELOCITY_MOD_FIELD2_THUNK-C2_SEG*16), C2_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_VELOCITY_MOD_FIELD4_THUNK_OFF, EP_VELOCITY_MOD_FIELD4_THUNK_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_039c6:
        db      0c7h, 28h, 12h, 03h, 01h, 00h, 01h, 00h, 00h, 00h, 7fh, 00h, 00h, 00h ; [4] x,y,class,digits  STORE  MIN  MAX
        dw      EP_VELOCITY_MOD_FIELD4_THUNK_OFF, EP_VELOCITY_MOD_FIELD4_THUNK_SEG, EP_VELOCITY_MOD_FIELD0_THUNK_OFF, EP_VELOCITY_MOD_FIELD0_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_VELOCITY_MOD_FIELD3_THUNK_OFF, EP_VELOCITY_MOD_FIELD3_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_039f0:
        db      01h
        db      00h, 00h, 00h, 00h, 05h
        dw      (C2_BASE+VELO_ENV_FILTER_OPEN-C2_SEG*16), C2_SEG
        db      06h
        dw      EP_L_4E5E8_OFF, EP_L_4E5E8_SEG
        db      86h
        dw      EP_PAD_AUDITION_NOTE_OFF_OFF, EP_PAD_AUDITION_NOTE_OFF_SEG
        if      FW_VERSION >= 112
TBL_WINKEYS_VELO_ENV_FILTER:
        else
TBL_WINKEYS_VELOCITY_MOD:
        endif
        WIN_KEY   WIN_K_PAD, EP_VELO_ENV_FILTER_PAD_SEG, EP_VELO_ENV_FILTER_PAD_OFF
        WIN_KEY   WIN_K_PAINT, EP_VELO_ENV_FILTER_PAINT_SEG, EP_VELO_ENV_FILTER_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, C2_SEG, (C2_BASE+VELO_ENV_FILTER_OPEN-C2_SEG*16)
        WIN_KEY   WIN_K_REFRESH, EP_VELO_ENV_FILTER_REFRESH_SEG, EP_VELO_ENV_FILTER_REFRESH_OFF
        WIN_KEY_END
        db      00h
d_c2_w_03a1e:
        db      07h, 19h, 0bh
        db      "Note:"
        db      00h, 0ch, 13h, 13h, 0d6h, 07h, 13h, 17h
        db      "Attack:"
        db      00h, 07h, 19h
        db      "!Decay:"
        db      00h, 07h, 13h
        db      "+Amount:"
        db      00h, 0fh, 93h, 13h, 20h, 07h, 97h, 1ch
        db      "Velo"
        db      0ch
        db      "Freq:"
        db      00h, 07h, 0b5h
        db      "(Velo:"
        db      00h, 1ah, 04h, 02h
        db      "CLOSE"
        db      00h, 1ah, 05h
        db      001h, "PLAY", 000h, 000h
d_c2_w_03a78:
        db      037h, 00bh, 0a2h, 002h, 001h, 000h, 023h, 000h, 000h
        db      00h, 62h, 00h, 00h, 00h
d_c2_tbl_03a86:
        dw      EP_VELO_ENV_FILTER_FIELD0_THUNK_OFF, EP_VELO_ENV_FILTER_FIELD0_THUNK_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_VELO_ENV_FILTER_FIELD1_THUNK_OFF, EP_VELO_ENV_FILTER_FIELD1_THUNK_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h
TBL_FIELDS_3A78:                        ; 6 x FIELD_SIZE, DS:3A78h = FILTER_FIELDS; the part of the array this .asm emits itself
        db      3dh, 17h, 12h, 03h, 01h, 00h, 00h, 00h, 00h, 00h, 64h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_VELO_ENV_FILTER_FIELD1_THUNK_OFF, EP_VELO_ENV_FILTER_FIELD1_THUNK_SEG, EP_VELO_ENV_FILTER_FIELD0_THUNK_OFF, EP_VELO_ENV_FILTER_FIELD0_THUNK_SEG, EP_VELO_ENV_FILTER_FIELD2_THUNK_OFF, EP_VELO_ENV_FILTER_FIELD2_THUNK_SEG ; THUNK  PREV  NEXT
        else
        dw      EP_VELO_ENV_FILTER_FIELD1_THUNK_OFF, EP_VELO_ENV_FILTER_FIELD1_THUNK_SEG
        dw      EP_VELO_ENV_FILTER_FIELD0_THUNK_OFF, EP_VELO_ENV_FILTER_FIELD0_THUNK_SEG
        if      FW_VERSION >= 111
        db      0cch, 20h, 84h, 4dh
        else
        dw      EP_VELO_ENV_FILTER_FIELD2_THUNK_OFF, EP_VELO_ENV_FILTER_FIELD2_THUNK_SEG
        endif
        endif
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_VELO_ENV_FILTER_FIELD4_THUNK_OFF, EP_VELO_ENV_FILTER_FIELD4_THUNK_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_03acc:
        db      3dh, 21h, 12h, 03h, 01h, 00h, 00h, 00h, 00h, 00h, 64h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        dw      EP_VELO_ENV_FILTER_FIELD2_THUNK_OFF, EP_VELO_ENV_FILTER_FIELD2_THUNK_SEG, EP_VELO_ENV_FILTER_FIELD1_THUNK_OFF, EP_VELO_ENV_FILTER_FIELD1_THUNK_SEG, EP_VELO_ENV_FILTER_FIELD3_THUNK_OFF, EP_VELO_ENV_FILTER_FIELD3_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_VELO_ENV_FILTER_FIELD4_THUNK_OFF, EP_VELO_ENV_FILTER_FIELD4_THUNK_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_03af6:
        db      3dh, 2bh, 12h, 03h, 01h, 00h, 00h, 00h, 00h, 00h, 64h, 00h, 00h, 00h ; [3] x,y,class,digits  STORE  MIN  MAX
        dw      EP_VELO_ENV_FILTER_FIELD3_THUNK_OFF, EP_VELO_ENV_FILTER_FIELD3_THUNK_SEG, EP_VELO_ENV_FILTER_FIELD2_THUNK_OFF, EP_VELO_ENV_FILTER_FIELD2_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_VELO_ENV_FILTER_FIELD5_THUNK_OFF, EP_VELO_ENV_FILTER_FIELD5_THUNK_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_03b20:
        db      0d3h, 1ch, 12h, 03h, 01h, 00h, 00h, 00h, 00h, 00h, 64h, 00h, 00h, 00h ; [4] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 110
        dw      EP_VELO_ENV_FILTER_FIELD4_THUNK_OFF, EP_VELO_ENV_FILTER_FIELD4_THUNK_SEG, EP_VELO_ENV_FILTER_FIELD0_THUNK_OFF, EP_VELO_ENV_FILTER_FIELD0_THUNK_SEG, EP_VELO_ENV_FILTER_FIELD5_THUNK_OFF, EP_VELO_ENV_FILTER_FIELD5_THUNK_SEG ; THUNK  PREV  NEXT
        else
        dw      EP_VELO_ENV_FILTER_FIELD4_THUNK_OFF, EP_VELO_ENV_FILTER_FIELD4_THUNK_SEG
        db      78h, 20h, 26h, 4dh
        dw      EP_VELO_ENV_FILTER_FIELD5_THUNK_OFF, EP_VELO_ENV_FILTER_FIELD5_THUNK_SEG
        endif
        dw      EP_VELO_ENV_FILTER_FIELD1_THUNK_OFF, EP_VELO_ENV_FILTER_FIELD1_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_03b4a:
        db      0d3h, 28h, 12h, 03h, 01h, 00h, 01h, 00h, 00h, 00h, 7fh, 00h, 00h, 00h ; [5] x,y,class,digits  STORE  MIN  MAX
        dw      EP_VELO_ENV_FILTER_FIELD5_THUNK_OFF, EP_VELO_ENV_FILTER_FIELD5_THUNK_SEG, EP_VELO_ENV_FILTER_FIELD4_THUNK_OFF, EP_VELO_ENV_FILTER_FIELD4_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_VELO_ENV_FILTER_FIELD3_THUNK_OFF, EP_VELO_ENV_FILTER_FIELD3_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_03b74:
        db      01h, 00h, 00h, 00h, 00h, 05h
        dw      (C2_BASE+VELO_PITCH_CLOSE-C2_SEG*16), C2_SEG
        db      06h
        dw      EP_L_4E5E8_OFF, EP_L_4E5E8_SEG
        db      86h
        dw      EP_PAD_AUDITION_NOTE_OFF_OFF, EP_PAD_AUDITION_NOTE_OFF_SEG
        if      FW_VERSION >= 112
TBL_WINKEYS_VELO_PITCH:
        else
TBL_WINKEYS_VELO_ENV_FILTER:
        endif
        WIN_KEY   WIN_K_PAD, EP_VELO_PITCH_PAD_SEG, EP_VELO_PITCH_PAD_OFF
        WIN_KEY   WIN_K_PAINT, EP_VELO_PITCH_PAINT_SEG, EP_VELO_PITCH_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, C2_SEG, (C2_BASE+VELO_PITCH_CLOSE-C2_SEG*16)
        WIN_KEY   WIN_K_REFRESH, EP_VELO_PITCH_REFRESH_SEG, EP_VELO_PITCH_REFRESH_OFF
        WIN_KEY_END
        db      000h
d_c2_w_03ba2:
        db      007h, 019h, 00bh, "Note:", 000h, 00ch, 013h, 013h, 0d6h, 007h, 043h
        db      1ch
        db      "Tune:"
        db      00h, 0fh, 87h, 13h, 20h, 07h, 8bh, 1ch
        db      "Velo"
        db      0ch
        db      "Pitch:"
        db      00h, 07h, 0afh
        db      "(Velo:"
        db      00h, 1ah, 04h, 02h
        db      "CLOSE"
        db      00h, 1ah, 05h, 01h, 50h
        db      4ch, 41h, 59h, 00h, 00h
d_c2_w_03be6:
        db      37h, 0bh, 0a2h, 02h, 01h, 00h, 23h, 00h, 00h, 00h, 62h
        db      00h, 00h, 00h
d_c2_tbl_03bf4:
        if      FW_VERSION >= 112
        dw      EP_VELO_PITCH_FIELD0_THUNK_OFF, C2_SEG
        else
        dw      EP_FAR_4FC4C_OFF, C2_SEG
        endif
        db      00h, 00h, 00h, 00h
        if      FW_VERSION <> 110
        dw      EP_VELO_PITCH_FIELD1_THUNK_OFF, EP_VELO_PITCH_FIELD1_THUNK_SEG
        else
        dw      (C2_BASE+velo_pitch_field1_thunk-C2_SEG*16), C2_SEG
        endif
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_03c10:
        db      61h, 1ch, 18h, 03h, 02h, 80h
        TUNE_RANGE
        if      FW_VERSION <> 110
        dw      EP_VELO_PITCH_FIELD1_THUNK_OFF, EP_VELO_PITCH_FIELD1_THUNK_SEG
        else
        db      24h
        db      24h
        db      74h, 4dh
        endif
        if      FW_VERSION >= 112
        dw      EP_VELO_PITCH_FIELD0_THUNK_OFF, C2_SEG
        else
        dw      EP_FAR_4FC4C_OFF, C2_SEG
        endif
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        if      FW_VERSION >= 112
        dw      EP_VELO_PITCH_FIELD2_THUNK_OFF, C2_SEG
        else
        dw      EP_FAR_4FCA0_OFF, C2_SEG
        endif
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_03c3a:
        db      0cdh, 1ch, 18h, 03h, 01h, 80h, 88h
        db      0ffh, 0ffh, 0ffh, 78h, 00h, 00h, 00h
        if      FW_VERSION >= 112
        dw      EP_VELO_PITCH_FIELD2_THUNK_OFF, C2_SEG
        dw      EP_VELO_PITCH_FIELD0_THUNK_OFF, C2_SEG
        else
        dw      EP_FAR_4FCA0_OFF, C2_SEG, EP_FAR_4FC4C_OFF, C2_SEG
        endif
        dw      EP_VELO_PITCH_FIELD3_THUNK_OFF, EP_VELO_PITCH_FIELD3_THUNK_SEG
        if      FW_VERSION <> 110
        dw      EP_VELO_PITCH_FIELD1_THUNK_OFF, EP_VELO_PITCH_FIELD1_THUNK_SEG
        else
        dw      (C2_BASE+velo_pitch_field1_thunk-C2_SEG*16), C2_SEG
        endif
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h
d_c2_w_03c64:
        db      0cdh, 28h, 12h, 03h, 01h, 00h, 01h, 00h, 00h, 00h, 7fh, 00h, 00h
        db      00h
        if      FW_VERSION >= 112
        dw      EP_VELO_PITCH_FIELD3_THUNK_OFF, EP_VELO_PITCH_FIELD3_THUNK_SEG
        dw      EP_VELO_PITCH_FIELD2_THUNK_OFF, C2_SEG
        else
        dw      EP_VELO_PITCH_FIELD3_THUNK_OFF, EP_VELO_PITCH_FIELD3_THUNK_SEG, EP_FAR_4FCA0_OFF, C2_SEG
        endif
        db      00h, 00h, 00h, 00h
        if      FW_VERSION <> 110
        dw      EP_VELO_PITCH_FIELD1_THUNK_OFF, EP_VELO_PITCH_FIELD1_THUNK_SEG
        else
        dw      (C2_BASE+velo_pitch_field1_thunk-C2_SEG*16), C2_SEG
        endif
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_03c8e:
        db      01h, 00h, 00h
        db      00h, 00h
mute_window_blob:                       ; handler table {db id, dd far32}, draw list, fields
        db      05h
        dw      EP_MUTE_ASSIGN_OPEN_OFF, EP_MUTE_ASSIGN_OPEN_SEG
        db      06h
        dw      EP_L_4E5E8_OFF, EP_L_4E5E8_SEG
        db      86h
        dw      EP_PAD_AUDITION_NOTE_OFF_OFF, EP_PAD_AUDITION_NOTE_OFF_SEG
TBL_WINKEYS_MUTE_ASSIGN:
        if      FW_VERSION < 112
TBL_WINKEYS_VELO_PITCH:
        endif
        WIN_KEY   WIN_K_PAD, EP_MUTE_ASSIGN_PAD_SEG, EP_MUTE_ASSIGN_PAD_OFF
        WIN_KEY   WIN_K_PAINT, EP_PARAMS_VOICE_WINDOW_DRAW_SEG, EP_PARAMS_VOICE_WINDOW_DRAW_OFF
        WIN_KEY   WIN_K_OPEN, EP_MUTE_ASSIGN_OPEN_SEG, EP_MUTE_ASSIGN_OPEN_OFF
        WIN_KEY   WIN_K_REFRESH, EP_MUTE_ASSIGN_REFRESH_SEG, EP_MUTE_ASSIGN_REFRESH_OFF
        WIN_KEY_END
        db      00h
d_c2_w_03cbc:
        MG_DRAWLIST
mute_field_array:                       ; MUTE ASSIGN, 3 x FIELD_SIZE, = DS:MUTE_FIELDS
        db      37h, 0bh, 0a2h, 02h, 01h, 00h, 23h, 00h, 00h, 00h, 62h, 00h, 00h, 00h ; [0] x,y,class,digits  STORE  MIN  MAX
        dw      EP_MUTE_ASSIGN_FIELD0_THUNK_OFF, EP_MUTE_ASSIGN_FIELD0_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_MUTE_ASSIGN_FIELD1_THUNK_OFF, EP_MUTE_ASSIGN_FIELD1_THUNK_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        db      37h, 1eh, 0a2h, 02h, 01h, 00h, 22h, 00h, 00h, 00h, 62h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_MUTE_ASSIGN_FIELD1_THUNK_OFF, EP_MUTE_ASSIGN_FIELD1_THUNK_SEG ; THUNK  PREV  NEXT
        dw      EP_MUTE_ASSIGN_FIELD0_THUNK_OFF, EP_MUTE_ASSIGN_FIELD0_THUNK_SEG
        dw      EP_MUTE_ASSIGN_FIELD2_THUNK_OFF, EP_MUTE_ASSIGN_FIELD2_THUNK_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        db      37h, 27h, 0a2h, 02h, 01h, 00h, 22h, 00h, 00h, 00h, 62h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        dw      EP_MUTE_ASSIGN_FIELD2_THUNK_OFF, EP_MUTE_ASSIGN_FIELD2_THUNK_SEG, EP_MUTE_ASSIGN_FIELD1_THUNK_OFF, EP_MUTE_ASSIGN_FIELD1_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
TBL_WINKEYS_AUTO_CHROMATIC:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F4, EP_AUTO_CHROMATIC_CANCEL_SEG, EP_AUTO_CHROMATIC_CANCEL_OFF
        WIN_KEY   WIN_K_F5, EP_AUTO_CHROMATIC_DO_IT_SEG, EP_AUTO_CHROMATIC_DO_IT_OFF
        WIN_KEY   WIN_K_PAD, EP_AUTO_CHROMATIC_PAD_SEG, EP_AUTO_CHROMATIC_PAD_OFF
        WIN_KEY   WIN_K_PAINT, EP_AUTO_CHROMATIC_PAINT_SEG, EP_AUTO_CHROMATIC_PAINT_OFF
        WIN_KEY_END
d_c2_w_03d94:
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_END
d_c2_w_03da8:
        db      3fh, 0bh, 24h, 02h, 01h, 00h, 23h, 00h, 00h
        db      00h, 62h, 00h, 00h, 00h
d_c2_tbl_03db6:
        dw      EP_AUTO_CHROMATIC_FIELD0_THUNK_OFF, EP_AUTO_CHROMATIC_FIELD0_THUNK_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_AUTO_CHROMATIC_FIELD2_THUNK_OFF, EP_AUTO_CHROMATIC_FIELD2_THUNK_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_AUTO_CHROMATIC_FIELD1_THUNK_OFF, EP_AUTO_CHROMATIC_FIELD1_THUNK_SEG
        dw      EP_L_50CFC_OFF, EP_L_50CFC_SEG
        db      00h, 00h, 00h
        db      00h
d_c2_w_03dd2:
        db      69h, 0bh, 78h, 01h, 00h, 42h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_AUTO_CHROMATIC_FIELD1_THUNK_OFF, EP_AUTO_CHROMATIC_FIELD1_THUNK_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_AUTO_CHROMATIC_FIELD2_THUNK_OFF, EP_AUTO_CHROMATIC_FIELD2_THUNK_SEG
        dw      EP_AUTO_CHROMATIC_FIELD0_THUNK_OFF, EP_AUTO_CHROMATIC_FIELD0_THUNK_SEG
        db      00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_03dfc:
        db      69h, 15h, 24h, 02h, 01h
        db      00h, 23h, 00h, 00h, 00h, 62h, 00h, 00h, 00h
        dw      EP_AUTO_CHROMATIC_FIELD2_THUNK_OFF, EP_AUTO_CHROMATIC_FIELD2_THUNK_SEG
        dw      EP_AUTO_CHROMATIC_FIELD1_THUNK_OFF, EP_AUTO_CHROMATIC_FIELD1_THUNK_SEG
        dw      EP_AUTO_CHROMATIC_FIELD3_THUNK_OFF, EP_AUTO_CHROMATIC_FIELD3_THUNK_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_03e26:
        db      69h, 1fh, 18h, 03h, 02h, 80h
        TUNE_RANGE
        dw      EP_AUTO_CHROMATIC_FIELD3_THUNK_OFF, EP_AUTO_CHROMATIC_FIELD3_THUNK_SEG
        dw      EP_AUTO_CHROMATIC_FIELD2_THUNK_OFF, EP_AUTO_CHROMATIC_FIELD2_THUNK_SEG
        dw      EP_AUTO_CHROMATIC_FIELD4_THUNK_OFF, EP_AUTO_CHROMATIC_FIELD4_THUNK_SEG
        db      00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_03e50:
        db      69h
        db      29h, 60h, 01h, 00h, 41h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_AUTO_CHROMATIC_FIELD4_THUNK_OFF, EP_AUTO_CHROMATIC_FIELD4_THUNK_SEG
        dw      EP_AUTO_CHROMATIC_FIELD3_THUNK_OFF, EP_AUTO_CHROMATIC_FIELD3_THUNK_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c0_tbl_03e7a:
        if      FW_VERSION >= 120
        dw      EP_L_5FC44_OFF
d_c0_tbl_03e7c:
        dw      DS_SEG
        dw      EP_FAR_5F5EC_OFF, DS_SEG, EP_FAR_5F5F7_OFF, DS_SEG, EP_FAR_5F602_OFF, DS_SEG, EP_FAR_5F60D_OFF, DS_SEG
        dw      EP_FAR_5F618_OFF, DS_SEG, EP_FAR_5F623_OFF, DS_SEG, EP_FAR_5F62E_OFF, DS_SEG
        elseif  FW_VERSION >= 112
        dw      EP_FAR_5F644_OFF
d_c0_tbl_03e7c:
        dw      DS_SEG
        dw      EP_FAR_5F5EC_OFF, DS_SEG, EP_FAR_5F5F7_OFF, DS_SEG, EP_FAR_5F602_OFF, DS_SEG, EP_FAR_5F60D_OFF, DS_SEG, EP_FAR_5F618_OFF, DS_SEG, EP_FAR_5F623_OFF, DS_SEG, EP_FAR_5F62E_OFF, DS_SEG
        else
        dw      EP_L_5FC44_OFF
d_c0_tbl_03e7c:
        dw      DS_SEG
        if      FW_VERSION >= 110
        if      FW_VERSION >= 111
        db      3ch, 79h, 8ch
        else
        db      3ch, 79h, 7ch
        endif
        db      57h
        else
        dw      EP_FAR_5F5EC_OFF, DS_SEG
        endif
        dw      EP_FAR_5F5F7_OFF, DS_SEG
        if      FW_VERSION >= 111
        db      52h, 79h, 8ch, 57h, 5dh, 79h, 8ch, 57h, 68h, 79h, 8ch, 57h, 73h, 79h, 8ch, 57h, 7eh, 79h, 8ch, 57h
        elseif  FW_VERSION >= 110
        db      52h, 79h, 7ch, 57h, 5dh, 79h, 7ch, 57h, 68h, 79h, 7ch, 57h, 73h, 79h, 7ch, 57h, 7eh, 79h, 7ch, 57h
        else
        db      4ch, 79h, 2eh, 57h, 57h, 79h, 2eh, 57h, 62h, 79h, 2eh, 57h, 6dh, 79h, 2eh, 57h, 78h, 79h, 2eh, 57h
        endif
        endif
        dw      EP_FAR_5FC39_OFF, EP_FAR_5FC39_SEG
        if      FW_VERSION >= 112
        dw      EP_FAR_5F644_OFF, DS_SEG
        dw      EP_FAR_5F644_OFF, DS_SEG
        elseif  FW_VERSION >= 111
        db      94h, 79h, 8ch, 57h, 94h, 79h, 8ch, 57h, 0aah, 79h, 8ch, 57h
        elseif  FW_VERSION >= 110
        db      94h, 79h, 7ch, 57h, 94h, 79h, 7ch, 57h, 0aah, 79h, 7ch, 57h
        else
        dw      EP_L_5FC44_OFF, DS_SEG
        dw      EP_L_5FC44_OFF, DS_SEG
        endif
        dw      EP_FAR_5FC5A_OFF, EP_FAR_5FC5A_SEG
        if      FW_VERSION = 111
        db      0c2h, 79h, 8ch, 57h
        elseif  FW_VERSION <> 110
        dw      EP_FAR_5FC5A_OFF, EP_FAR_5FC5A_SEG
        else
        db      0c2h, 79h, 7ch, 57h
        endif
        dw      EP_FAR_5FC72_OFF, EP_FAR_5FC72_SEG
        if      FW_VERSION = 111
        db      0dah, 79h, 8ch, 57h
        elseif  FW_VERSION <> 110
        dw      EP_FAR_5FC72_OFF, EP_FAR_5FC72_SEG
        else
        db      0dah, 79h, 7ch, 57h
        endif
        dw      EP_FAR_5FC8A_OFF, EP_FAR_5FC8A_SEG
        if      FW_VERSION >= 112
        dw      EP_FAR_5FC8A_OFF, EP_FAR_5FC8A_SEG
        dw      EP_FAR_5FCA2_OFF, DS_SEG
        dw      EP_FAR_5FCA2_OFF, DS_SEG
        dw      EP_FAR_5F644_OFF, DS_SEG
        db      2dh, 2dh
        elseif  FW_VERSION >= 111
        db      0f2h, 79h, 8ch, 57h, 0f2h, 79h, 8ch, 57h, 94h
        db      79h, 8ch, 57h, 2dh, 2dh
        elseif  FW_VERSION >= 110
        db      0f2h, 79h, 7ch, 57h, 0f2h, 79h, 7ch, 57h, 94h
        db      79h, 7ch, 57h, 2dh, 2dh
        else
        dw      EP_FAR_5FC8A_OFF, EP_FAR_5FC8A_SEG
        dw      EP_FAR_5FCA2_OFF, DS_SEG
        dw      EP_FAR_5FCA2_OFF, DS_SEG
        dw      EP_L_5FC44_OFF, DS_SEG
        db      2dh, 2dh
        endif
        db      00h, 4dh, 31h, 00h, 4dh
        db      32h, 00h, 52h, 31h, 00h, 52h, 32h, 00h, 00h
d_c0_w_03eda:
        db      00h, 00h
d_c2_b_03edc:
        db      00h, 00h
d_c0_tbl_03ede:
        if      FW_VERSION >= 112
        dw      EP_L_51062_OFF
d_c0_tbl_03ee0:
        dw      EP_L_51062_SEG
d_c0_tbl_03ee2:
        dw      EP_L_510E6_OFF
d_c0_tbl_03ee4:
        dw      C2_SEG, EP_L_5117C_OFF, EP_L_5117C_SEG, EP_L_51208_OFF, C2_SEG, EP_L_512A6_OFF, EP_L_512A6_SEG, EP_L_5132E_OFF, C2_SEG, EP_L_513C0_OFF, C2_SEG, EP_L_5142E_OFF, C2_SEG
        dw      EP_L_514AE_OFF, C2_SEG, EP_L_51536_OFF, EP_L_51536_SEG, EP_L_515C8_OFF, C2_SEG, EP_L_51624_OFF, C2_SEG
d_c2_w_03f0e:
        db      01h, 00h, 00h
        else
        dw      EP_L_51062_OFF
d_c0_tbl_03ee0:
        dw      EP_L_51062_SEG
d_c0_tbl_03ee2:
        db      46h
        if      FW_VERSION >= 111
        db      2fh
d_c0_tbl_03ee4:
        db      84h
        elseif  FW_VERSION >= 110
        db      2fh
d_c0_tbl_03ee4:
        db      74h
        else
        db      2fh
d_c0_tbl_03ee4:
        db      26h
        endif
        db      4dh
        dw      EP_L_5117C_OFF, EP_L_5117C_SEG
        db      68h, 30h
        if      FW_VERSION >= 111
        db      84h, 4dh
        elseif  FW_VERSION >= 110
        db      74h, 4dh
        else
        db      26h, 4dh
        endif
        dw      EP_L_512A6_OFF, EP_L_512A6_SEG
        if      FW_VERSION >= 111
        db      8eh, 31h, 84h, 4dh, 20h, 32h, 84h, 4dh, 8eh, 32h, 84h, 4dh, 0eh, 33h, 84h
        elseif  FW_VERSION >= 110
        db      8eh, 31h, 74h, 4dh, 20h, 32h, 74h, 4dh, 8eh, 32h, 74h, 4dh, 0eh, 33h, 74h
        else
        db      8eh, 31h, 26h, 4dh, 20h, 32h, 26h, 4dh, 8eh, 32h, 26h, 4dh, 0eh, 33h, 26h
        endif
        db      4dh
        dw      EP_L_51536_OFF, EP_L_51536_SEG
        if      FW_VERSION >= 111
        db      28h, 34h, 84h, 4dh, 84h, 34h, 84h, 4dh
d_c2_w_03f0e:
        db      01h, 00h, 00h
        elseif  FW_VERSION >= 110
        db      28h, 34h, 74h, 4dh, 84h, 34h, 74h, 4dh
d_c2_w_03f0e:
        db      01h, 00h, 00h
        else
        db      28h, 34h, 26h, 4dh, 84h, 34h, 26h, 4dh
d_c2_w_03f0e:
        db      01h, 00h, 00h
        endif
        endif
        db      00h, 00h, 02h
        dw      EP_L_51050_OFF, EP_L_51050_SEG
        if      FW_VERSION >= 110
        if      FW_VERSION >= 111
        db      03h
        dw      EP_L_51294_OFF, C2_SEG
        db      04h
        else
        db      03h, 0f4h, 30h, 74h, 4dh, 04h
        endif
        dw      EP_L_5149C_OFF, EP_L_5149C_SEG
        if      FW_VERSION >= 112
        db      05h
        dw      (C2_BASE+L_50FF2-C2_SEG*16), C2_SEG
        db      06h
        elseif  FW_VERSION >= 111
        db      05h, 52h, 2eh, 84h, 4dh, 06h
        else
        db      05h, 52h, 2eh, 74h, 4dh, 06h
        endif
        dw      EP_FAR_51004_OFF, EP_FAR_51004_SEG
        if      FW_VERSION >= 111
        db      07h
        dw      EP_FAR_3C5A0_OFF, C0_SEG
        else
        db      07h, 66h, 6ah, 10h, 35h
        endif
        db      18h
        else
        db      03h, 0f4h, 30h, 26h, 4dh, 04h
        dw      EP_L_5149C_OFF, EP_L_5149C_SEG
        db      05h, 52h
        db      2eh, 26h, 4dh, 06h
        dw      EP_FAR_51004_OFF, EP_FAR_51004_SEG
        db      07h, 86h, 6ah, 0c0h, 34h, 18h
        endif
        dw      EP_FAR_50F82_OFF, EP_FAR_50F82_SEG
        db      19h
        dw      EP_FAR_50F90_OFF, EP_FAR_50F90_SEG
        db      16h
        dw      EP_FAR_3C562_OFF, EP_FAR_3C562_SEG
        if      FW_VERSION >= 110
        db      17h
        dw      EP_FAR_3C524_OFF, EP_FAR_3C524_SEG
        if      FW_VERSION >= 111
        db      32h
        dw      EP_FAR_3C704_OFF, C0_SEG
        db      15h
        dw      EP_FAR_50FD6_OFF, EP_FAR_50FD6_SEG
        if      FW_VERSION >= 112
        db      37h
        dw      (C0_BASE+L_3C5C8-C0_SEG*16), C0_SEG
        if      FW_VERSION >= 120
        db      3ch, 16h, 6bh, 0b0h
        elseif  FW_VERSION >= 114
        db      3ch, 16h, 6bh, 50h
        else
        db      3ch, 16h, 6bh, 30h
        endif
        db      "5=&k"
        if      FW_VERSION >= 120
        db      0b0h
        elseif  FW_VERSION >= 114
        db      50h
        else
        db      30h
        endif
        db      "5>6k"
        if      FW_VERSION >= 120
        db      0b0h
        elseif  FW_VERSION >= 114
        db      50h
        else
        db      30h
        endif
        db      "5?"
        dw      (C0_BASE+L_3C646-C0_SEG*16), C0_SEG
        db      13h
        else
        db      37h, 8eh, 6ah, 20h, 35h, 3ch, 0dch, 6ah, 20h, 35h, 3dh, 0ech
        db      6ah, 20h, 35h, 3eh, 0fch, 6ah, 20h, 35h, 3fh, 0ch, 6bh, 20h, 35h, 13h
        endif
        dw      EP_L_50F9E_OFF, C2_SEG
        db      93h
        else
        db      32h, 0cah, 6bh, 10h, 35h, 15h
        dw      EP_FAR_50FD6_OFF, EP_FAR_50FD6_SEG
        db      37h, 8eh, 6ah, 10h, 35h, 3ch, 0dch, 6ah, 10h, 35h, 3dh, 0ech
        db      6ah, 10h, 35h, 3eh, 0fch, 6ah, 10h, 35h, 3fh, 0ch, 6bh, 10h, 35h, 13h, 0feh, 2dh
        db      74h, 4dh, 93h
        endif
        else
        db      17h, 0ah, 6ah, 0c0h, 34h, 32h, 0eah, 6bh
        db      0c0h, 34h, 15h
        dw      EP_FAR_50FD6_OFF, EP_FAR_50FD6_SEG
        db      37h, 0aeh, 6ah, 0c0h
        db      34h
        db      3ch
        db      0fch, 6ah, 0c0h, 34h, 3dh, 0ch, 6bh, 0c0h, 34h, 3eh, 1ch, 6bh, 0c0h, 34h, 3fh, 2ch
        db      6bh, 0c0h, 34h, 13h, 0feh, 2dh, 26h, 4dh, 93h
        endif
        dw      EP_L_50FAC_OFF, EP_L_50FAC_SEG
TBL_WINKEYS_5C222:
        WIN_KEY   2bh, EP_L_3C678_SEG, EP_L_3C678_OFF
        WIN_KEY   2ch, EP_X_3C6A2_SEG, EP_X_3C6A2_OFF
        WIN_KEY   WIN_K_REFRESH, EP_FAR_51016_SEG, EP_FAR_51016_OFF
        WIN_KEY_END
TBL_WINKEYS_MIXER_SETUP:
        WIN_CLEAR
        WIN_END
        db      00h, 00h, 00h
        WIN_KEY   WIN_K_F1, EP_MIXER_SETUP_F1_SEG, EP_MIXER_SETUP_F1_OFF
        WIN_KEY   WIN_K_F2, EP_MIXER_SETUP_F2_SEG, EP_MIXER_SETUP_F2_OFF
        WIN_KEY   WIN_K_F3, EP_MIXER_SETUP_F3_SEG, EP_MIXER_SETUP_F3_OFF
        WIN_KEY   WIN_K_F4, EP_MIXER_SETUP_F4_SEG, EP_MIXER_SETUP_F4_OFF
        WIN_KEY   46h, EP_MIXER_SETUP_KEY_46_SEG, EP_MIXER_SETUP_KEY_46_OFF
        WIN_KEY   WIN_K_F6, EP_MIXER_SETUP_F6_SEG, EP_MIXER_SETUP_F6_OFF
        WIN_KEY   WIN_K_PAINT, EP_MIXER_SETUP_PAINT_SEG, EP_MIXER_SETUP_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_MIXER_SETUP_OPEN_SEG, EP_MIXER_SETUP_OPEN_OFF
        WIN_KEY_END
        WIN_CLEAR
        db      1ah, 05h, 00h, 53h, 45h, 54h, 55h, 50h
        db      00h
        WIN_SOFTKEY 6, 2, "FXedit"
        WIN_LABEL 03h, 02h, "Mixer setup"
        WIN_RULE  0ch, 02h, 0ah, 0a1h
        WIN_LABEL 09h, 0dh, "Stereo mix source:"
        WIN_LABEL 15h, 16h, "INDIV/FX source:"
        WIN_LABEL 0fh, 1fh, "Copy pgm mix to drum:"
        WIN_LABEL 1bh, 28h, "Record mix changes:"
        WIN_LABEL 0a8h, 02h, "Master Level"
        WIN_RULE  0ch, 0a7h, 0bh, 50h
        WIN_LABEL 0a9h, 1ch, "FX drum"
        WIN_RULE  0ch, 0a7h, 24h, 50h
        WIN_LABEL 0bbh, 27h, "Drum:"
        WIN_END
d_c2_w_04066:
        db      75h, 0dh, 2ah, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h
        db      00h, 00h, 00h
d_c2_tbl_04074:
        dw      EP_MIXER_SETUP_FIELD0_THUNK_OFF, EP_MIXER_SETUP_FIELD0_THUNK_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_MIXER_SETUP_FIELD1_THUNK_OFF, EP_MIXER_SETUP_FIELD1_THUNK_SEG
        db      00h
        db      00h, 00h, 00h
        dw      EP_MIXER_SETUP_FIELD4_THUNK_OFF, EP_MIXER_SETUP_FIELD4_THUNK_SEG
        db      00h, 00h, 00h, 00h
d_c2_tbl_0408c:
        db      00h, 00h
d_c2_tbl_0408e:
        db      00h, 00h
TBL_FIELDS_4066:                        ; 6 x FIELD_SIZE; the part of the array this .asm emits itself
        db      75h, 16h, 2ah, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_MIXER_SETUP_FIELD1_THUNK_OFF, EP_MIXER_SETUP_FIELD1_THUNK_SEG, EP_MIXER_SETUP_FIELD0_THUNK_OFF, EP_MIXER_SETUP_FIELD0_THUNK_SEG, EP_MIXER_SETUP_FIELD2_THUNK_OFF, EP_MIXER_SETUP_FIELD2_THUNK_SEG ; THUNK  PREV  NEXT
        dw      EP_MIXER_SETUP_FIELD4_THUNK_OFF, EP_MIXER_SETUP_FIELD4_THUNK_SEG, EP_MIXER_SETUP_FIELD2_THUNK_OFF, EP_MIXER_SETUP_FIELD2_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        else
        dw      EP_MIXER_SETUP_FIELD1_THUNK_OFF, EP_MIXER_SETUP_FIELD1_THUNK_SEG, EP_MIXER_SETUP_FIELD0_THUNK_OFF, EP_MIXER_SETUP_FIELD0_THUNK_SEG
        dw      (C2_BASE+mixer_setup_field2_thunk-C2_SEG*16), C2_SEG, EP_MIXER_SETUP_FIELD4_THUNK_OFF, EP_MIXER_SETUP_FIELD4_THUNK_SEG
        dw      EP_C2_3710_OFF, C2_SEG
        endif
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_040ba:
        db      8dh, 1fh, 12h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_MIXER_SETUP_FIELD2_THUNK_OFF, EP_MIXER_SETUP_FIELD2_THUNK_SEG, EP_MIXER_SETUP_FIELD1_THUNK_OFF, EP_MIXER_SETUP_FIELD1_THUNK_SEG, EP_MIXER_SETUP_FIELD3_THUNK_OFF, EP_MIXER_SETUP_FIELD3_THUNK_SEG ; THUNK  PREV  NEXT
        dw      EP_MIXER_SETUP_FIELD1_THUNK_OFF, EP_MIXER_SETUP_FIELD1_THUNK_SEG, EP_MIXER_SETUP_FIELD3_THUNK_OFF, EP_MIXER_SETUP_FIELD3_THUNK_SEG, EP_L_518CE_OFF, C2_SEG ; +1Ah..+21h  NOTIFY  ENTER
        else
        dw      (C2_BASE+mixer_setup_field2_thunk-C2_SEG*16), C2_SEG, EP_MIXER_SETUP_FIELD1_THUNK_OFF, EP_MIXER_SETUP_FIELD1_THUNK_SEG
        dw      (C2_BASE+mixer_setup_field3_thunk-C2_SEG*16), C2_SEG, EP_MIXER_SETUP_FIELD1_THUNK_OFF, EP_MIXER_SETUP_FIELD1_THUNK_SEG
        dw      EP_MIXER_SETUP_FIELD3_THUNK_OFF, EP_MIXER_SETUP_FIELD3_THUNK_SEG
        dw      EP_FAR_5098E_OFF, C2_SEG
        endif
        db      00h, 00h, 00h, 00h
d_c2_w_040e4:
        db      8dh, 28h, 12h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h ; [3] x,y,class,digits  STORE  MIN  MAX
        dw      EP_MIXER_SETUP_FIELD3_THUNK_OFF, EP_MIXER_SETUP_FIELD3_THUNK_SEG, EP_MIXER_SETUP_FIELD2_THUNK_OFF, EP_MIXER_SETUP_FIELD2_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_MIXER_SETUP_FIELD2_THUNK_OFF, EP_MIXER_SETUP_FIELD2_THUNK_SEG, EP_MIXER_SETUP_FIELD5_THUNK_OFF, EP_MIXER_SETUP_FIELD5_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_0410e:
        db      0c1h, 0eh, 1eh, 01h, 01h, 0c0h, 0f3h, 0ffh, 0ffh, 0ffh, 02h, 00h, 00h, 00h ; [4] x,y,class,digits  STORE  MIN  MAX
        dw      EP_MIXER_SETUP_FIELD4_THUNK_OFF, EP_MIXER_SETUP_FIELD4_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        if      FW_VERSION >= 112
        dw      EP_MIXER_SETUP_FIELD5_THUNK_OFF, EP_MIXER_SETUP_FIELD5_THUNK_SEG
        dw      EP_MIXER_SETUP_FIELD0_THUNK_OFF, EP_MIXER_SETUP_FIELD0_THUNK_SEG, EP_MIXER_SETUP_FIELD1_THUNK_OFF, EP_MIXER_SETUP_FIELD1_THUNK_SEG, EP_L_51910_OFF, EP_L_51910_SEG ; +1Ah..+21h  NOTIFY  ENTER
        else
        dw      (C2_BASE+mixer_setup_field5_thunk-C2_SEG*16), C2_SEG, EP_MIXER_SETUP_FIELD0_THUNK_OFF, EP_MIXER_SETUP_FIELD0_THUNK_SEG, EP_MIXER_SETUP_FIELD1_THUNK_OFF, EP_MIXER_SETUP_FIELD1_THUNK_SEG
        dw      EP_L_51910_OFF, EP_L_51910_SEG
        endif
        db      00h, 00h, 00h, 00h
d_c2_w_04138:
        db      0d9h, 27h, 06h, 01h, 01h, 20h, 00h, 00h, 00h, 00h, 03h, 00h, 00h, 00h ; [5] x,y,class,digits  STORE  MIN  MAX
        dw      EP_MIXER_SETUP_FIELD5_THUNK_OFF, EP_MIXER_SETUP_FIELD5_THUNK_SEG, EP_MIXER_SETUP_FIELD4_THUNK_OFF, EP_MIXER_SETUP_FIELD4_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_MIXER_SETUP_FIELD3_THUNK_OFF, EP_MIXER_SETUP_FIELD3_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_L_5193C_OFF, EP_L_5193C_SEG
        db      00h, 00h, 00h, 00h
d_c2_tbl_04162:
        dw      EP_FAR_514DC_OFF
d_c2_tbl_04164:
        dw      EP_FAR_514DC_SEG
        dw      EP_FAR_514E0_OFF, EP_FAR_514E0_SEG
        dw      EP_FAR_514E4_OFF, EP_FAR_514E4_SEG
        if      FW_VERSION >= 112
        dw      EP_FAR_51E48_OFF, EP_FAR_51E48_SEG, EP_FAR_51E4C_OFF, C2_SEG, EP_FAR_51E50_OFF, C2_SEG, EP_FAR_51E54_OFF, C2_SEG, EP_FAR_51E58_OFF, C2_SEG
        else
        dw      EP_FAR_51E48_OFF, EP_FAR_51E48_SEG
        if      FW_VERSION >= 111
        db      0ach, 3ch, 84h, 4dh, 0b0h, 3ch, 84h, 4dh, 0b4h, 3ch, 84h, 4dh, 0b8h, 3ch, 84h
        elseif  FW_VERSION >= 110
        db      0ach, 3ch, 74h, 4dh, 0b0h, 3ch, 74h, 4dh, 0b4h, 3ch, 74h, 4dh, 0b8h, 3ch, 74h
        else
        db      0ach, 3ch, 26h, 4dh, 0b0h, 3ch, 26h, 4dh, 0b4h, 3ch, 26h, 4dh, 0b8h, 3ch, 26h
        endif
        db      4dh
        endif
        dw      EP_FAR_514FC_OFF, EP_FAR_514FC_SEG
        dw      EP_FAR_514DC_OFF, EP_FAR_514DC_SEG
        dw      EP_FAR_514DC_OFF, EP_FAR_514DC_SEG
        dw      EP_FAR_49A98_OFF, EP_FAR_49A98_SEG
        dw      EP_FAR_49A98_OFF, EP_FAR_49A98_SEG
        dw      EP_L_49A9C_OFF, EP_L_49A9C_SEG
        dw      EP_L_49A9C_OFF, EP_L_49A9C_SEG
        dw      EP_L_49AA0_OFF, EP_L_49AA0_SEG
        dw      EP_L_49AA0_OFF, EP_L_49AA0_SEG
        dw      EP_FAR_49AA4_OFF, EP_FAR_49AA4_SEG
        dw      EP_FAR_49AA4_OFF, EP_FAR_49AA4_SEG
        dw      EP_FAR_514DC_OFF, EP_FAR_514DC_SEG
d_c2_w_041b2:
        db      01h, 00h, 00h, 00h, 00h, 05h
        dw      EP_L_51BFE_OFF, EP_L_51BFE_SEG
        db      32h
        dw      EP_FAR_519EE_OFF, EP_FAR_519EE_SEG
        db      37h ; 7>:.N..:.N4.:.N.
        if      FW_VERSION >= 112
        dw      EP_L_51B9E_OFF, C2_SEG
        db      15h
        dw      EP_L_51BFE_OFF, EP_L_51BFE_SEG
        db      34h
        dw      EP_L_51C10_OFF, EP_L_51C10_SEG
        db      00h
        db      00h, 00h, 00h, 00h
        else
        dw      EP_FAR_5123E_OFF, C2_SEG
TBL_WINKEYS_5BA86:
        WIN_KEY   WIN_K_OPEN, EP_L_51BFE_SEG, EP_L_51BFE_OFF
        WIN_KEY   WIN_K_REFRESH, EP_L_51C10_SEG, EP_L_51C10_OFF
        WIN_KEY_END
        endif
        db      00h
d_c2_w_041d6:
        WIN_SOFTKEY 4, 2, "CLOSE"
        WIN_LABEL 19h, 0bh, "Note:"
        WIN_LABEL 25h, 16h, "STEREO"
        WIN_LABEL 25h, 20h, "Vol:"
        WIN_LABEL 25h, 29h, "Pan:"
        WIN_RULE  0ch, 13h, 13h, 0d6h
        WIN_RULE  0fh, 55h, 13h, 24h
        WIN_LABEL 5bh, 20h, "Vol:"
        WIN_LABEL 5bh, 29h, "Out:"
        WIN_LABEL 73h, 16h, "INDIV"
        WIN_LABEL 9dh, 16h, "FX"
        WIN_LABEL 0bbh, 16h, "Follow"
        WIN_LABEL 0bbh, 1fh, "stereo:"
        WIN_END
        db      00h
d_c2_w_04240:
        db      37h
        db      0bh, 0a2h, 02h, 01h, 00h, 23h, 00h, 00h, 00h, 62h, 00h, 00h, 00h
d_c2_tbl_0424e:
        dw      EP_MIXER_CHAN_FIELD0_THUNK_OFF, EP_MIXER_CHAN_FIELD0_THUNK_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_MIXER_CHAN_FIELD1_THUNK_OFF, EP_MIXER_CHAN_FIELD1_THUNK_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
TBL_FIELDS_4240:                        ; 8 x FIELD_SIZE; the part of the array this .asm emits itself
        db      3dh, 20h, 12h, 03h, 01h, 00h, 00h, 00h, 00h, 00h, 64h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_MIXER_CHAN_FIELD1_THUNK_OFF, EP_MIXER_CHAN_FIELD1_THUNK_SEG, EP_MIXER_CHAN_FIELD0_THUNK_OFF, EP_MIXER_CHAN_FIELD0_THUNK_SEG, EP_MIXER_CHAN_FIELD2_THUNK_OFF, EP_MIXER_CHAN_FIELD2_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_MIXER_CHAN_FIELD3_THUNK_OFF, EP_MIXER_CHAN_FIELD3_THUNK_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_04294:
        db      3dh, 29h, 12h, 02h, 01h, 80h, 0ceh, 0ffh, 0ffh, 0ffh, 32h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        dw      (C2_BASE+MIXER_CHAN_FIELD2_THUNK-C2_SEG*16), C2_SEG, (C2_BASE+MIXER_CHAN_FIELD1_THUNK-C2_SEG*16), C2_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_MIXER_CHAN_FIELD4_THUNK_OFF, EP_MIXER_CHAN_FIELD4_THUNK_SEG, EP_L_51CB6_OFF, EP_L_51CB6_SEG
        db      00h, 00h, 00h, 00h
        db      79h, 20h, 12h, 03h, 01h, 00h, 00h, 00h, 00h, 00h, 64h, 00h, 00h, 00h ; [3] x,y,class,digits  STORE  MIN  MAX
        dw      EP_MIXER_CHAN_FIELD3_THUNK_OFF, EP_MIXER_CHAN_FIELD3_THUNK_SEG, EP_MIXER_CHAN_FIELD0_THUNK_OFF, EP_MIXER_CHAN_FIELD0_THUNK_SEG, EP_MIXER_CHAN_FIELD4_THUNK_OFF, EP_MIXER_CHAN_FIELD4_THUNK_SEG ; THUNK  PREV  NEXT
        dw      EP_MIXER_CHAN_FIELD1_THUNK_OFF, EP_MIXER_CHAN_FIELD1_THUNK_SEG, EP_MIXER_CHAN_FIELD5_THUNK_OFF, EP_MIXER_CHAN_FIELD5_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_042e8:
        db      79h, 29h, 12h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 08h, 00h, 00h, 00h ; [4] x,y,class,digits  STORE  MIN  MAX
        dw      EP_MIXER_CHAN_FIELD4_THUNK_OFF, EP_MIXER_CHAN_FIELD4_THUNK_SEG, EP_MIXER_CHAN_FIELD3_THUNK_OFF, EP_MIXER_CHAN_FIELD3_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_MIXER_CHAN_FIELD2_THUNK_OFF, EP_MIXER_CHAN_FIELD2_THUNK_SEG, EP_MIXER_CHAN_FIELD6_THUNK_OFF, EP_MIXER_CHAN_FIELD6_THUNK_SEG, EP_L_51D3E_OFF, EP_L_51D3E_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        db      9ah, 20h, 12h, 03h, 01h, 00h, 00h, 00h, 00h, 00h, 64h, 00h, 00h, 00h ; [5] x,y,class,digits  STORE  MIN  MAX
        dw      EP_MIXER_CHAN_FIELD5_THUNK_OFF, EP_MIXER_CHAN_FIELD5_THUNK_SEG, EP_MIXER_CHAN_FIELD0_THUNK_OFF, EP_MIXER_CHAN_FIELD0_THUNK_SEG, EP_MIXER_CHAN_FIELD6_THUNK_OFF, EP_MIXER_CHAN_FIELD6_THUNK_SEG ; THUNK  PREV  NEXT
        dw      EP_MIXER_CHAN_FIELD3_THUNK_OFF, EP_MIXER_CHAN_FIELD3_THUNK_SEG, EP_MIXER_CHAN_FIELD7_THUNK_OFF, EP_MIXER_CHAN_FIELD7_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      9dh, 29h, 0ch, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 04h, 00h, 00h, 00h ; [6] x,y,class,digits  STORE  MIN  MAX
        dw      EP_MIXER_CHAN_FIELD6_THUNK_OFF, EP_MIXER_CHAN_FIELD6_THUNK_SEG, EP_MIXER_CHAN_FIELD5_THUNK_OFF, EP_MIXER_CHAN_FIELD5_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_MIXER_CHAN_FIELD4_THUNK_OFF, EP_MIXER_CHAN_FIELD4_THUNK_SEG, EP_MIXER_CHAN_FIELD7_THUNK_OFF, EP_MIXER_CHAN_FIELD7_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_04366:
        db      0c7h, 29h, 12h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h ; [7] x,y,class,digits  STORE  MIN  MAX
        dw      EP_MIXER_CHAN_FIELD7_THUNK_OFF, EP_MIXER_CHAN_FIELD7_THUNK_SEG, EP_MIXER_CHAN_FIELD0_THUNK_OFF, EP_MIXER_CHAN_FIELD0_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_MIXER_CHAN_FIELD6_THUNK_OFF, EP_MIXER_CHAN_FIELD6_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_L_51E04_OFF, EP_L_51E04_SEG
        db      00h, 00h, 00h, 00h
TBL_WINKEYS_FX_NOT_INSTALLED:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F1, EP_FX_NOT_INSTALLED_F1_SEG, EP_FX_NOT_INSTALLED_F1_OFF
        WIN_KEY   WIN_K_F2, EP_FX_NOT_INSTALLED_F2_SEG, EP_FX_NOT_INSTALLED_F2_OFF
        WIN_KEY   WIN_K_F3, EP_FX_NOT_INSTALLED_F3_SEG, EP_FX_NOT_INSTALLED_F3_OFF
        WIN_KEY   WIN_K_F4, EP_FX_NOT_INSTALLED_F4_SEG, EP_FX_NOT_INSTALLED_F4_OFF
        WIN_KEY   WIN_K_F5, EP_FX_NOT_INSTALLED_F5_SEG, EP_FX_NOT_INSTALLED_F5_OFF
        WIN_KEY   WIN_K_PAINT, EP_FX_NOT_INSTALLED_PAINT_SEG, EP_FX_NOT_INSTALLED_PAINT_OFF
        WIN_KEY_END
        WIN_CLEAR
        WIN_SOFTKEY 5, 2, "SETUP"
        WIN_SOFTKEY 6, 0, "FXedit"
        WIN_LABEL 13h, 0ah, "Effect board is"
        WIN_LABEL 19h, 13h, "not installed."
        WIN_END
d_c0_tbl_043f2:
        dw      EP_L_51A3C_OFF
d_c0_tbl_043f4:
        dw      EP_L_51A3C_SEG
        if      FW_VERSION >= 112
        dw      EP_FAR_523A6_OFF, C2_SEG
        dw      EP_L_51A50_OFF, EP_L_51A50_SEG
        dw      EP_L_51A5A_OFF, EP_L_51A5A_SEG
        else
        dw      (C2_BASE+far_523A6-C2_SEG*16), C2_SEG, EP_L_51A50_OFF, EP_L_51A50_SEG, EP_L_51A5A_OFF, EP_L_51A5A_SEG
        endif
        dw      EP_FAR_523C4_OFF, EP_FAR_523C4_SEG
        if      FW_VERSION >= 111
        dw      EP_FAR_523C8_OFF, C2_SEG
        dw      EP_FAR_523CC_OFF, C2_SEG
        dw      EP_FAR_523DA_OFF, C2_SEG
        dw      EP_FAR_523E8_OFF, C2_SEG
        dw      EP_FAR_523F4_OFF, C2_SEG
        dw      EP_FAR_523F8_OFF, C2_SEG
        dw      EP_FAR_523FC_OFF, C2_SEG
        elseif  FW_VERSION >= 110
        dw      EP_FAR_51A68_OFF, C2_SEG
        dw      EP_FAR_51A6C_OFF, C2_SEG
        dw      EP_FAR_51A7A_OFF, C2_SEG
        dw      EP_FAR_51A88_OFF, C2_SEG
        dw      EP_FAR_51A94_OFF, C2_SEG
        dw      EP_FAR_51A98_OFF, C2_SEG
        dw      EP_FAR_51A9C_OFF, C2_SEG
        else
        dw      EP_FAR_51488_OFF, C2_SEG
        dw      EP_FAR_5148C_OFF, C2_SEG
        dw      EP_FAR_5149A_OFF, C2_SEG
        dw      EP_FAR_514A8_OFF, C2_SEG
        dw      EP_FAR_514B4_OFF, C2_SEG
        dw      EP_FAR_514B8_OFF, C2_SEG
        dw      EP_FAR_514BC_OFF, C2_SEG
        endif
        dw      EP_FAR_5240A_OFF, EP_FAR_5240A_SEG
        dw      EP_FAR_52418_OFF, EP_FAR_52418_SEG
TBL_WINKEYS_MIXER:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F1, EP_MIXER_F1_SEG, EP_MIXER_F1_OFF
        WIN_KEY   WIN_K_F2, EP_MIXER_DRUM_2_SEG, EP_MIXER_DRUM_2_OFF
        WIN_KEY   WIN_K_F3, EP_MIXER_DRUM_3_SEG, EP_MIXER_DRUM_3_OFF
        WIN_KEY   WIN_K_F4, EP_MIXER_DRUM_4_SEG, EP_MIXER_DRUM_4_OFF
        WIN_KEY   WIN_K_F5, EP_MIXER_F5_SEG, EP_MIXER_F5_OFF
        WIN_KEY   WIN_K_PAINT, EP_MIXER_PAINT_SEG, EP_MIXER_PAINT_OFF
        WIN_KEY   WIN_K_F6, EP_MIXER_F6_SEG, EP_MIXER_F6_OFF
        WIN_KEY   WIN_K_OPEN, EP_MIXER_OPEN_SEG, EP_MIXER_OPEN_OFF
        if      FW_VERSION >= 110
        WIN_KEY   WIN_K_REFRESH, C2_SEG, EP_MIXER_REFRESH_OFF
        endif
        WIN_KEY_END
        if      FW_VERSION >= 110
        db      00h
        endif
        WIN_CLEAR
        WIN_LABEL 02h, 02h, "Drum:"
        WIN_LABEL 6eh, 02h, "Pgm:__-"
        WIN_LABEL 02h, 0ch, "Edit:"
        WIN_RULE  0eh, 0ech, 1ch, 03h
        WIN_RULE  0eh, 0eeh, 1ch, 03h
        WIN_RULE  0eh, 0f0h, 1ch, 03h
        WIN_SOFTKEY 5, 2, "SETUP"
        WIN_SOFTKEY 6, 1, "ON/OFF"
        WIN_END
        WIN_OP4   12h, 6ch, 11h, 7ch, 03h
        WIN_OP4   12h, 6ch, 14h, 03h, 08h
        WIN_OP4   12h, 0e5h, 14h, 03h, 08h
        WIN_END
        db      20h
        db      10h, 08h, 04h, 02h, 01h, 20h, 10h, 02h
d_c0_b_044b9:
        db      08h, 04h, 01h, 19h, 19h, 19h, 19h, 19h
        db      19h, 19h, 19h, 0eh, 0eh, 19h, 19h
d_c2_w_044c8:
        db      86h
d_c0_b_044c9:
        db      02h
d_c0_b_044ca:
        db      72h, 02h, 01h, 20h, 00h, 00h, 00h
        db      00h, 17h, 00h, 00h, 00h
d_c2_tbl_mixer_field_thunk:
        dw      EP_MIXER_FIELD0_THUNK_OFF, EP_MIXER_FIELD0_THUNK_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_MIXER_FIELD8_THUNK_OFF, EP_MIXER_FIELD8_THUNK_SEG
        dw      EP_MIXER_FIELD9_THUNK_OFF, EP_MIXER_FIELD9_THUNK_SEG
        dw      EP_MIXER_FIELD1_THUNK_OFF, EP_MIXER_FIELD1_THUNK_SEG
        dw      EP_FAR_48472_OFF, EP_FAR_48472_SEG
d_c2_tbl_mixer_field_enter:
        dw      EP_L_520EE_OFF, EP_L_520EE_SEG
TBL_FIELDS_44C8:                        ; 10 x FIELD_SIZE; the part of the array this .asm emits itself
        db      20h, 0ch, 36h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 03h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_MIXER_FIELD1_THUNK_OFF, EP_MIXER_FIELD1_THUNK_SEG, EP_MIXER_FIELD9_THUNK_OFF, EP_MIXER_FIELD9_THUNK_SEG, EP_FAR_52136_OFF, EP_FAR_52136_SEG ; THUNK  PREV  NEXT
        dw      EP_MIXER_FIELD0_THUNK_OFF, EP_MIXER_FIELD0_THUNK_SEG, EP_FAR_52136_OFF, EP_FAR_52136_SEG, EP_L_52126_OFF, EP_L_52126_SEG, EP_L_52450_OFF, EP_L_52450_SEG ; +1Ah..+21h  NOTIFY  ENTER
        else
        dw      (C2_BASE+mixer_field1_thunk-C2_SEG*16), C2_SEG, EP_MIXER_FIELD9_THUNK_OFF, EP_MIXER_FIELD9_THUNK_SEG, EP_FAR_52136_OFF, EP_FAR_52136_SEG, EP_MIXER_FIELD0_THUNK_OFF, EP_MIXER_FIELD0_THUNK_SEG
        dw      (C2_BASE+far_52136-C2_SEG*16), C2_SEG, EP_L_52126_OFF, EP_L_52126_SEG
        dw      EP_L_52450_OFF, EP_L_52450_SEG
        endif
        db      28h, 1ah, 4eh, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 04h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FAR_52136_OFF, EP_FAR_52136_SEG, EP_MIXER_FIELD1_THUNK_OFF, EP_MIXER_FIELD1_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_MIXER_FIELD1_THUNK_OFF, EP_MIXER_FIELD1_THUNK_SEG, EP_L_522A6_OFF, EP_L_522A6_SEG, EP_L_52178_OFF, EP_L_52178_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
d_c2_w_04546:
        db      2ch, 18h, 1ah, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h ; [3] x,y,class,digits  STORE  MIN  MAX
        dw      (C2_BASE+MIXER_FIELD3_THUNK-C2_SEG*16), C2_SEG, (C2_BASE+MIXER_FIELD1_THUNK-C2_SEG*16), C2_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_MIXER_FIELD1_THUNK_OFF, EP_MIXER_FIELD1_THUNK_SEG, EP_MIXER_FIELD4_THUNK_OFF, EP_MIXER_FIELD4_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_DIST_RINGMOD_ENTER_OFF, EP_FX_DIST_RINGMOD_ENTER_SEG
d_c2_w_04570:
        db      4fh, 18h, 1ah, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h ; [4] x,y,class,digits  STORE  MIN  MAX
        dw      EP_MIXER_FIELD4_THUNK_OFF, EP_MIXER_FIELD4_THUNK_SEG, EP_MIXER_FIELD1_THUNK_OFF, EP_MIXER_FIELD1_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_MIXER_FIELD3_THUNK_OFF, EP_MIXER_FIELD3_THUNK_SEG, EP_L_521C0_OFF, EP_L_521C0_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FAR_52C04_OFF, EP_FAR_52C04_SEG
        db      72h, 18h, 1ah, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h ; [5] x,y,class,digits  STORE  MIN  MAX
        dw      EP_L_521C0_OFF, EP_L_521C0_SEG, EP_MIXER_FIELD1_THUNK_OFF, EP_MIXER_FIELD1_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_MIXER_FIELD4_THUNK_OFF, EP_MIXER_FIELD4_THUNK_SEG, EP_L_5222A_OFF, EP_L_5222A_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      95h, 18h, 1ah, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h ; [6] x,y,class,digits  STORE  MIN  MAX
        dw      EP_L_5222A_OFF, EP_L_5222A_SEG, EP_MIXER_FIELD0_THUNK_OFF, EP_MIXER_FIELD0_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_L_521C0_OFF, EP_L_521C0_SEG, EP_L_522A6_OFF, EP_L_522A6_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      0b8h, 18h, 1ah, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h ; [7] x,y,class,digits  STORE  MIN  MAX
        dw      EP_L_522A6_OFF, EP_L_522A6_SEG, EP_MIXER_FIELD0_THUNK_OFF, EP_MIXER_FIELD0_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_L_5222A_OFF, EP_L_5222A_SEG, EP_MIXER_FIELD8_THUNK_OFF, EP_MIXER_FIELD8_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
d_c2_w_04614:
        db      00h, 00h
d_c2_w_04616:
        db      00h, 00h
d_c2_w_04618:
        db      0dbh, 18h, 1ah, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h ; [8] x,y,class,digits  STORE  MIN  MAX
        dw      EP_MIXER_FIELD8_THUNK_OFF, EP_MIXER_FIELD8_THUNK_SEG, EP_MIXER_FIELD0_THUNK_OFF, EP_MIXER_FIELD0_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_L_522A6_OFF, EP_L_522A6_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_L_52340_OFF, EP_L_52340_SEG
d_c2_w_04642:
        db      20h, 02h, 06h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 03h, 00h, 00h, 00h ; [9] x,y,class,digits  STORE  MIN  MAX
        dw      EP_MIXER_FIELD9_THUNK_OFF, EP_MIXER_FIELD9_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_MIXER_FIELD1_THUNK_OFF, EP_MIXER_FIELD1_THUNK_SEG
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_MIXER_FIELD0_THUNK_OFF, EP_MIXER_FIELD0_THUNK_SEG, EP_MIXER_DRUM_FIELD_NOTIFY_OFF, EP_MIXER_DRUM_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
TBL_WINKEYS_COPY_FX:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_PAINT, EP_COPY_FX_PAINT_SEG, EP_COPY_FX_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_COPY_FX_OPEN_SEG, EP_COPY_FX_OPEN_OFF
        WIN_KEY   WIN_K_F4, EP_COPY_FX_OPEN_SEG, EP_COPY_FX_OPEN_OFF
        WIN_KEY   WIN_K_F5, EP_COPY_FX_F5_SEG, EP_COPY_FX_F5_OFF
        WIN_KEY_END
d_c2_w_0468a:
        db      1ah, 04h, 02h, 43h, 4ch, 4fh, 53h
        db      45h, 00h
        WIN_LABEL 19h, 10h, "COPY"
        WIN_BITMAP 1fh, 19h, 02h
        WIN_LABEL 3dh, 0bh, "Pgm:__-"
        WIN_LABEL 3dh, 14h, "Set:"
        WIN_RULE  0ch, 37h, 1dh, 0b0h
        WIN_LABEL 3dh, 20h, "Pgm:__-"
        WIN_LABEL 3dh, 29h, "Set:"
        WIN_END
d_c2_w_046ca:
        db      55h, 0bh, 72h, 02h, 01h, 20h, 00h
        db      00h, 00h, 00h, 17h, 00h, 00h, 00h
d_c2_w_046d8:
        dw      EP_COPY_FX_FIELD0_THUNK_OFF, EP_COPY_FX_FIELD0_THUNK_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_COPY_FX_FIELD1_THUNK_OFF, EP_COPY_FX_FIELD1_THUNK_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_L_4845E_OFF, EP_L_4845E_SEG
        db      00h
        db      00h, 00h, 00h
TBL_FIELDS_46CA:                        ; 4 x FIELD_SIZE; the part of the array this .asm emits itself
        db      55h, 14h, 36h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 03h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_COPY_FX_FIELD1_THUNK_OFF, EP_COPY_FX_FIELD1_THUNK_SEG, EP_COPY_FX_FIELD0_THUNK_OFF, EP_COPY_FX_FIELD0_THUNK_SEG, EP_COPY_FX_FIELD2_THUNK_OFF, EP_COPY_FX_FIELD2_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
d_c2_w_0471e:
        db      55h, 20h, 72h, 02h, 01h, 20h, 00h, 00h, 00h, 00h, 17h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        dw      EP_COPY_FX_FIELD2_THUNK_OFF, EP_COPY_FX_FIELD2_THUNK_SEG, EP_COPY_FX_FIELD1_THUNK_OFF, EP_COPY_FX_FIELD1_THUNK_SEG, EP_COPY_FX_FIELD3_THUNK_OFF, EP_COPY_FX_FIELD3_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_L_4845E_OFF, EP_L_4845E_SEG
        db      00h, 00h, 00h, 00h
d_c2_w_04748:
        db      55h, 29h, 36h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 03h, 00h, 00h, 00h ; [3] x,y,class,digits  STORE  MIN  MAX
        dw      EP_COPY_FX_FIELD3_THUNK_OFF, EP_COPY_FX_FIELD3_THUNK_SEG, EP_COPY_FX_FIELD2_THUNK_OFF, EP_COPY_FX_FIELD2_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
TBL_WINKEYS_FX_DIST_RINGMOD:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F2, EP_FX_DIST_RINGMOD_F2_SEG, EP_FX_DIST_RINGMOD_F2_OFF
        WIN_KEY   WIN_K_F3, EP_FX_DIST_RINGMOD_F3_SEG, EP_FX_DIST_RINGMOD_F3_OFF
        WIN_KEY   WIN_K_F4, EP_FX_DIST_RINGMOD_OPEN_SEG, EP_FX_DIST_RINGMOD_OPEN_OFF
        WIN_KEY   WIN_K_F5, EP_FX_DIST_RINGMOD_F5_SEG, EP_FX_DIST_RINGMOD_F5_OFF
        WIN_KEY   WIN_K_PAINT, EP_FX_DIST_RINGMOD_PAINT_SEG, EP_FX_DIST_RINGMOD_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_FX_DIST_RINGMOD_OPEN_SEG, EP_FX_DIST_RINGMOD_OPEN_OFF
        WIN_KEY   WIN_K_REFRESH, EP_FX_EDIT_REFRESH_SEG, EP_FX_EDIT_REFRESH_OFF
        WIN_KEY   33h, EP_FX_EDIT_KEY_33_SEG, EP_FX_EDIT_KEY_33_OFF
        WIN_KEY_END
        WIN_RULE  0fh, 79h, 0eh, 1eh
        WIN_LABEL 25h, 0eh, "<DISTORTION>"
        WIN_LABEL 31h, 19h, "Gain:"
        WIN_LABEL 2bh, 24h, "Level:"
        WIN_LABEL 8bh, 0eh, "<RINGMOD>"
        WIN_LABEL 91h, 19h, "Freq:____Hz"
        WIN_LABEL 8bh, 24h, "Depth:__%"
        WIN_END
        db      00h, 4fh, 19h, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 63h
        db      00h, 00h, 00h
d_c2_w_04804:
        dw      EP_FX_DIST_RINGMOD_FIELD0_THUNK_OFF, EP_FX_DIST_RINGMOD_FIELD0_THUNK_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_FX_DIST_RINGMOD_FIELD1_THUNK_OFF, EP_FX_DIST_RINGMOD_FIELD1_THUNK_SEG
        db      00h
        db      00h, 00h, 00h
        dw      EP_FX_DIST_RINGMOD_FIELD2_THUNK_OFF, EP_FX_DIST_RINGMOD_FIELD2_THUNK_SEG
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
TBL_FIELDS_47F6:                        ; 4 x FIELD_SIZE; the part of the array this .asm emits itself
        db      4fh, 24h, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_DIST_RINGMOD_FIELD1_THUNK_OFF, EP_FX_DIST_RINGMOD_FIELD1_THUNK_SEG, EP_FX_DIST_RINGMOD_FIELD0_THUNK_OFF, EP_FX_DIST_RINGMOD_FIELD0_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_FX_DIST_RINGMOD_FIELD3_THUNK_OFF, EP_FX_DIST_RINGMOD_FIELD3_THUNK_SEG, EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      0afh, 19h, 18h, 04h, 02h, 00h, 00h, 00h, 00h, 00h, 88h, 13h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_DIST_RINGMOD_FIELD2_THUNK_OFF, EP_FX_DIST_RINGMOD_FIELD2_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_FX_DIST_RINGMOD_FIELD3_THUNK_OFF, EP_FX_DIST_RINGMOD_FIELD3_THUNK_SEG
        dw      EP_FX_DIST_RINGMOD_FIELD0_THUNK_OFF, EP_FX_DIST_RINGMOD_FIELD0_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      0afh, 24h, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [3] x,y,class,digits  STORE  MIN  MAX
        dw      (C2_BASE+FX_DIST_RINGMOD_FIELD3_THUNK-C2_SEG*16), C2_SEG, (C2_BASE+FX_DIST_RINGMOD_FIELD2_THUNK-C2_SEG*16), C2_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_FX_DIST_RINGMOD_FIELD1_THUNK_OFF, EP_FX_DIST_RINGMOD_FIELD1_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
d_c2_w_0489e:
        db      00h, 00h
TBL_WINKEYS_4BAND_FILTER:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F2, EP_FILTER4_F2_SEG, EP_FILTER4_F2_OFF
        WIN_KEY   WIN_K_F3, EP_FILTER4_F3_SEG, EP_FILTER4_F3_OFF
        WIN_KEY   WIN_K_F4, EP_FILTER4_OPEN_SEG, EP_FILTER4_OPEN_OFF
        WIN_KEY   WIN_K_F5, EP_FILTER4_F5_SEG, EP_FILTER4_F5_OFF
        WIN_KEY   WIN_K_PAINT, EP_FILTER4_PAINT_SEG, EP_FILTER4_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_FILTER4_OPEN_SEG, EP_FILTER4_OPEN_OFF
        WIN_KEY   WIN_K_REFRESH, EP_FX_EDIT_REFRESH_SEG, EP_FX_EDIT_REFRESH_OFF
        WIN_KEY   33h, EP_FX_EDIT_KEY_33_SEG, EP_FX_EDIT_KEY_33_OFF
        WIN_KEY_END
        WIN_RULE  0ch, 13h, 13h, 0d2h
        WIN_RULE  0ch, 13h, 1dh, 0d2h
        WIN_RULE  0ch, 13h, 27h, 0d2h
        WIN_RULE  0fh, 91h, 13h, 15h
        WIN_LABEL 13h, 0bh, "HIGH:___Hz"
        WIN_LABEL 13h, 15h, "MID1:___Hz"
        WIN_LABEL 13h, 1fh, "MID2:___Hz"
        WIN_LABEL 19h, 29h, "LOW:___Hz"
        WIN_LABEL 82h, 0bh, "Q ^ <F-MOD> depth"
        WIN_LABEL 0afh, 15h, "Hz"
        WIN_LABEL 0afh, 1fh, "Hz"
        WIN_END
        db      00h, 31h, 0bh, 12h, 02h, 01h
        db      40h, 22h, 00h, 00h, 00h, 40h, 00h, 00h, 00h
d_c2_tbl_filter4_field_thunk:
        dw      EP_FILTER4_FIELD0_THUNK_OFF, EP_FILTER4_FIELD0_THUNK_SEG
        db      00h, 00h, 00h
        db      00h
        dw      EP_FILTER4_FIELD2_THUNK_OFF, EP_FILTER4_FIELD2_THUNK_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_FILTER4_FIELD1_THUNK_OFF, EP_FILTER4_FIELD1_THUNK_SEG
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
TBL_FIELDS_493C:                        ; 14 x FIELD_SIZE; the part of the array this .asm emits itself
        db      55h, 0bh, 12h, 02h, 01h, 80h, 0dbh, 0ffh, 0ffh, 0ffh, 0ch, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FILTER4_FIELD1_THUNK_OFF, EP_FILTER4_FIELD1_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_FILTER4_FIELD3_THUNK_OFF, EP_FILTER4_FIELD3_THUNK_SEG
        dw      EP_FILTER4_FIELD0_THUNK_OFF, EP_FILTER4_FIELD0_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      31h, 15h, 12h, 02h, 01h, 40h, 0ch, 00h, 00h, 00h, 38h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_FILTER4_FIELD2_THUNK_OFF, EP_FILTER4_FIELD2_THUNK_SEG, EP_FILTER4_FIELD0_THUNK_OFF, EP_FILTER4_FIELD0_THUNK_SEG, EP_FILTER4_FIELD7_THUNK_OFF, EP_FILTER4_FIELD7_THUNK_SEG ; THUNK  PREV  NEXT
        else
        dw      (C2_BASE+filter4_field2_thunk-C2_SEG*16), C2_SEG, EP_FILTER4_FIELD0_THUNK_OFF, EP_FILTER4_FIELD0_THUNK_SEG
        dw      EP_FILTER4_FIELD7_THUNK_OFF, EP_FILTER4_FIELD7_THUNK_SEG
        endif
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_FILTER4_FIELD3_THUNK_OFF, EP_FILTER4_FIELD3_THUNK_SEG, EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      55h, 15h, 12h, 02h, 01h, 80h, 0dbh, 0ffh, 0ffh, 0ffh, 0ch, 00h, 00h, 00h ; [3] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_FILTER4_FIELD3_THUNK_OFF, EP_FILTER4_FIELD3_THUNK_SEG, EP_FILTER4_FIELD1_THUNK_OFF, EP_FILTER4_FIELD1_THUNK_SEG, EP_FILTER4_FIELD8_THUNK_OFF, EP_FILTER4_FIELD8_THUNK_SEG ; THUNK  PREV  NEXT
        dw      EP_FILTER4_FIELD2_THUNK_OFF, EP_FILTER4_FIELD2_THUNK_SEG, EP_FILTER4_FIELD4_THUNK_OFF, EP_FILTER4_FIELD4_THUNK_SEG, EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG ; +1Ah..+21h  NOTIFY  ENTER
        else
        dw      (C2_BASE+filter4_field3_thunk-C2_SEG*16), C2_SEG, EP_FILTER4_FIELD1_THUNK_EARLY_OFF, C2_SEG
        dw      EP_FILTER4_FIELD8_THUNK_OFF, EP_FILTER4_FIELD8_THUNK_SEG
        dw      EP_FILTER4_FIELD2_THUNK_OFF, EP_FILTER4_FIELD2_THUNK_SEG
        dw      EP_FILTER4_FIELD4_THUNK_OFF, EP_FILTER4_FIELD4_THUNK_SEG
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        endif
        db      00h, 00h, 00h, 00h
        db      7fh, 15h, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [4] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FILTER4_FIELD4_THUNK_OFF, EP_FILTER4_FIELD4_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_FILTER4_FIELD9_THUNK_OFF, EP_FILTER4_FIELD9_THUNK_SEG
        if      FW_VERSION >= 112
        dw      EP_FILTER4_FIELD3_THUNK_OFF, EP_FILTER4_FIELD3_THUNK_SEG, EP_FILTER4_FIELD5_THUNK_OFF, EP_FILTER4_FIELD5_THUNK_SEG, EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG ; +1Ah..+21h  NOTIFY  ENTER
        else
        dw      (C2_BASE+filter4_field3_thunk-C2_SEG*16), C2_SEG, EP_FILTER4_FIELD5_THUNK_OFF, EP_FILTER4_FIELD5_THUNK_SEG
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        endif
        db      00h, 00h, 00h, 00h
        db      9dh, 15h, 12h, 02h, 11h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [5] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FILTER4_FIELD5_THUNK_OFF, EP_FILTER4_FIELD5_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_FILTER4_FIELD10_THUNK_OFF, EP_FILTER4_FIELD10_THUNK_SEG
        if      FW_VERSION >= 112
        dw      EP_FILTER4_FIELD4_THUNK_OFF, EP_FILTER4_FIELD4_THUNK_SEG, EP_FILTER4_FIELD6_THUNK_OFF, C2_SEG, EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG ; +1Ah..+21h  NOTIFY  ENTER
        else
        dw      EP_FILTER4_FIELD4_THUNK_OFF, EP_FILTER4_FIELD4_THUNK_SEG, EP_FAR_52048_OFF, C2_SEG
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        endif
        db      00h, 00h, 00h, 00h
        db      0d3h, 15h, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [6] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_FILTER4_FIELD6_THUNK_OFF, C2_SEG ; THUNK  PREV  NEXT
        else
        dw      EP_FAR_52048_OFF, C2_SEG
        endif
        db      00h, 00h, 00h, 00h
        dw      EP_FILTER4_FIELD11_THUNK_OFF, EP_FILTER4_FIELD11_THUNK_SEG
        dw      EP_FILTER4_FIELD5_THUNK_OFF, EP_FILTER4_FIELD5_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      31h, 1fh, 12h, 02h, 01h, 40h, 0ch, 00h, 00h, 00h, 38h, 00h, 00h, 00h ; [7] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_FILTER4_FIELD7_THUNK_OFF, EP_FILTER4_FIELD7_THUNK_SEG, EP_FILTER4_FIELD2_THUNK_OFF, EP_FILTER4_FIELD2_THUNK_SEG, EP_FILTER4_FIELD12_THUNK_OFF, EP_FILTER4_FIELD12_THUNK_SEG ; THUNK  PREV  NEXT
        else
        dw      (C2_BASE+filter4_field7_thunk-C2_SEG*16), C2_SEG, EP_FILTER4_FIELD2_THUNK_EARLY_OFF, C2_SEG
        dw      EP_FILTER4_FIELD12_THUNK_OFF, EP_FILTER4_FIELD12_THUNK_SEG
        endif
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_FILTER4_FIELD8_THUNK_OFF, EP_FILTER4_FIELD8_THUNK_SEG, EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      55h, 1fh, 12h, 02h, 01h, 80h, 0dbh, 0ffh, 0ffh, 0ffh, 0ch, 00h, 00h, 00h ; [8] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_FILTER4_FIELD8_THUNK_OFF, EP_FILTER4_FIELD8_THUNK_SEG, EP_FILTER4_FIELD3_THUNK_OFF, EP_FILTER4_FIELD3_THUNK_SEG, EP_FILTER4_FIELD13_THUNK_OFF, EP_FILTER4_FIELD13_THUNK_SEG ; THUNK  PREV  NEXT
        dw      EP_FILTER4_FIELD7_THUNK_OFF, EP_FILTER4_FIELD7_THUNK_SEG, EP_FILTER4_FIELD9_THUNK_OFF, EP_FILTER4_FIELD9_THUNK_SEG, EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG ; +1Ah..+21h  NOTIFY  ENTER
        else
        dw      (C2_BASE+filter4_field8_thunk-C2_SEG*16), C2_SEG, EP_FILTER4_FIELD3_THUNK_OFF, EP_FILTER4_FIELD3_THUNK_SEG, EP_FILTER4_FIELD13_THUNK_OFF, EP_FILTER4_FIELD13_THUNK_SEG
        dw      EP_FILTER4_FIELD7_THUNK_OFF, EP_FILTER4_FIELD7_THUNK_SEG
        dw      EP_FILTER4_FIELD9_THUNK_OFF, EP_FILTER4_FIELD9_THUNK_SEG
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        endif
        db      00h, 00h, 00h, 00h
        db      7fh, 1fh, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [9] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FILTER4_FIELD9_THUNK_OFF, EP_FILTER4_FIELD9_THUNK_SEG, EP_FILTER4_FIELD4_THUNK_OFF, EP_FILTER4_FIELD4_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_FILTER4_FIELD8_THUNK_OFF, EP_FILTER4_FIELD8_THUNK_SEG, EP_FILTER4_FIELD10_THUNK_OFF, EP_FILTER4_FIELD10_THUNK_SEG, EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        db      9dh, 1fh, 12h, 02h, 11h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [10] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FILTER4_FIELD10_THUNK_OFF, EP_FILTER4_FIELD10_THUNK_SEG, EP_FILTER4_FIELD5_THUNK_OFF, EP_FILTER4_FIELD5_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        if      FW_VERSION >= 111
        dw      EP_FILTER4_FIELD9_THUNK_OFF, EP_FILTER4_FIELD9_THUNK_SEG, EP_FILTER4_FIELD11_THUNK_OFF, EP_FILTER4_FIELD11_THUNK_SEG, EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG ; +1Ah..+21h  NOTIFY  ENTER
        else
        dw      EP_FILTER4_FIELD9_THUNK_OFF, EP_FILTER4_FIELD9_THUNK_SEG
        dw      (C2_BASE+filter4_field11_thunk-C2_SEG*16), C2_SEG
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        endif
        db      00h, 00h, 00h, 00h
        db      0d3h, 1fh, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [11] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_FILTER4_FIELD11_THUNK_OFF, EP_FILTER4_FIELD11_THUNK_SEG, EP_FILTER4_FIELD6_THUNK_OFF, C2_SEG ; THUNK  PREV  NEXT
        else
        dw      (C2_BASE+filter4_field11_thunk-C2_SEG*16), C2_SEG, EP_FAR_52048_OFF, C2_SEG
        endif
        db      00h, 00h, 00h, 00h
        dw      EP_FILTER4_FIELD10_THUNK_OFF, EP_FILTER4_FIELD10_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      31h, 29h, 12h, 02h, 01h, 40h, 04h, 00h, 00h, 00h, 22h, 00h, 00h, 00h ; [12] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 111
        dw      EP_FILTER4_FIELD12_THUNK_OFF, EP_FILTER4_FIELD12_THUNK_SEG, EP_FILTER4_FIELD7_THUNK_OFF, EP_FILTER4_FIELD7_THUNK_SEG ; THUNK  PREV  NEXT
        else
        dw      (C2_BASE+filter4_field12_thunk-C2_SEG*16), C2_SEG
        dw      (C2_BASE+filter4_field7_thunk-C2_SEG*16), C2_SEG
        endif
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_FILTER4_FIELD13_THUNK_OFF, EP_FILTER4_FIELD13_THUNK_SEG, EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      55h, 29h, 12h, 02h, 01h, 80h, 0dbh, 0ffh, 0ffh, 0ffh, 0ch, 00h, 00h, 00h ; [13] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FILTER4_FIELD13_THUNK_OFF, EP_FILTER4_FIELD13_THUNK_SEG, EP_FILTER4_FIELD8_THUNK_OFF, EP_FILTER4_FIELD8_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_FILTER4_FIELD12_THUNK_OFF, EP_FILTER4_FIELD12_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
d_c2_b_04b88:
        if      FW_VERSION >= 112
        db      "1"
d_c2_b_04b89:
        db      "011131416182022252832364045505663708090"
        else
        db      31h
d_c2_b_04b89:
        db      30h, 31h, 31h, 31h, 33h, 31h, 34h, 31h, 36h, 31h, 38h, 32h, 30h, 32h, 32h, 32h, 35h, 32h, 38h, 33h, 32h, 33h, 36h, 34h, 30h, 34h, 35h, 35h, 30h, 35h, 36h, 36h, 33h, 37h, 30h, 38h, 30h, 39h, 30h
        endif
d_c0_tbl_04bb0:
        dw      (C2_BASE+far_5256E-C2_SEG*16)
d_c0_tbl_04bb2:
        dw      C2_SEG
        dw      EP_FAR_534BA_OFF, EP_FAR_534BA_SEG
        dw      EP_FAR_534C2_OFF, EP_FAR_534C2_SEG
        dw      EP_FAR_534CA_OFF, EP_FAR_534CA_SEG
        dw      (C2_BASE+L_534DA-C2_SEG*16), C2_SEG
        dw      EP_FAR_534E8_OFF, EP_FAR_534E8_SEG
        dw      EP_FAR_534F4_OFF, EP_FAR_534F4_SEG
TBL_WINKEYS_FX_CHORUS:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F2, EP_FX_CHORUS_F2_SEG, EP_FX_CHORUS_F2_OFF
        WIN_KEY   WIN_K_F3, EP_FX_CHORUS_F3_SEG, EP_FX_CHORUS_F3_OFF
        WIN_KEY   WIN_K_F4, EP_FX_CHORUS_OPEN_SEG, EP_FX_CHORUS_OPEN_OFF
        WIN_KEY   WIN_K_F5, EP_FX_CHORUS_F5_SEG, EP_FX_CHORUS_F5_OFF
        WIN_KEY   WIN_K_PAINT, EP_FX_CHORUS_PAINT_SEG, EP_FX_CHORUS_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_FX_CHORUS_OPEN_SEG, EP_FX_CHORUS_OPEN_OFF
        WIN_KEY   WIN_K_REFRESH, EP_FX_EDIT_REFRESH_SEG, EP_FX_EDIT_REFRESH_OFF
        WIN_KEY   33h, EP_FX_EDIT_KEY_33_SEG, EP_FX_EDIT_KEY_33_OFF
        WIN_KEY_END
d_c2_w_04bfe:
        db      07h, 13h, 0bh
        db      54h, 79h, 70h, 65h, 3ah, 00h
        WIN_LABEL 97h, 15h, "Speed:___Hz"
        WIN_LABEL 97h, 1fh, "Depth:"
        WIN_LABEL 85h, 29h, "Feedback:"
        WIN_END
d_c2_w_04c2e:
        db      31h, 0bh, 60h
        db      01h, 01h, 40h, 00h, 00h, 00h, 00h, 06h, 00h, 00h, 00h
d_c2_w_04c3c:
        dw      EP_FX_CHORUS_FIELD0_THUNK_OFF, EP_FX_CHORUS_FIELD0_THUNK_SEG
        db      00h
        db      00h, 00h, 00h
        dw      EP_FX_CHORUS_FIELD1_THUNK_OFF, EP_FX_CHORUS_FIELD1_THUNK_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_FX_CHORUS_FIELD1_THUNK_OFF, EP_FX_CHORUS_FIELD1_THUNK_SEG
        dw      (C2_BASE+L_5346E-C2_SEG*16), C2_SEG
        db      00h, 00h, 00h, 00h
TBL_FIELDS_4C2E:                        ; 4 x FIELD_SIZE; the part of the array this .asm emits itself
        db      0bbh, 15h, 12h, 02h, 11h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_CHORUS_FIELD1_THUNK_OFF, EP_FX_CHORUS_FIELD1_THUNK_SEG, EP_FX_CHORUS_FIELD0_THUNK_OFF, EP_FX_CHORUS_FIELD0_THUNK_SEG, EP_FX_CHORUS_FIELD2_THUNK_OFF, EP_FX_CHORUS_FIELD2_THUNK_SEG ; THUNK  PREV  NEXT
        dw      EP_FX_CHORUS_FIELD0_THUNK_OFF, EP_FX_CHORUS_FIELD0_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      0bbh, 1fh, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_CHORUS_FIELD2_THUNK_OFF, EP_FX_CHORUS_FIELD2_THUNK_SEG, EP_FX_CHORUS_FIELD1_THUNK_OFF, EP_FX_CHORUS_FIELD1_THUNK_SEG, EP_FX_CHORUS_FIELD3_THUNK_OFF, EP_FX_CHORUS_FIELD3_THUNK_SEG ; THUNK  PREV  NEXT
        dw      EP_FX_CHORUS_FIELD0_THUNK_OFF, EP_FX_CHORUS_FIELD0_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      0bbh, 29h, 12h, 02h, 01h, 80h, 0ceh, 0ffh, 0ffh, 0ffh, 32h, 00h, 00h, 00h ; [3] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_CHORUS_FIELD3_THUNK_OFF, EP_FX_CHORUS_FIELD3_THUNK_SEG, EP_FX_CHORUS_FIELD2_THUNK_OFF, EP_FX_CHORUS_FIELD2_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_FX_CHORUS_FIELD0_THUNK_OFF, EP_FX_CHORUS_FIELD0_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
TBL_WINKEYS_FX_ROTARY:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F2, EP_FX_ROTARY_F2_SEG, EP_FX_ROTARY_F2_OFF
        WIN_KEY   WIN_K_F3, EP_FX_ROTARY_F3_SEG, EP_FX_ROTARY_F3_OFF
        WIN_KEY   WIN_K_F4, EP_FX_ROTARY_OPEN_SEG, EP_FX_ROTARY_OPEN_OFF
        WIN_KEY   WIN_K_F5, EP_FX_ROTARY_F5_SEG, EP_FX_ROTARY_F5_OFF
        WIN_KEY   WIN_K_PAINT, EP_FX_ROTARY_PAINT_SEG, EP_FX_ROTARY_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_FX_ROTARY_OPEN_SEG, EP_FX_ROTARY_OPEN_OFF
        WIN_KEY   WIN_K_REFRESH, EP_FX_EDIT_REFRESH_SEG, EP_FX_EDIT_REFRESH_OFF
        WIN_KEY   33h, EP_FX_EDIT_KEY_33_SEG, EP_FX_EDIT_KEY_33_OFF
        WIN_KEY_END
        WIN_LABEL 13h, 0bh, "Type:"
        WIN_LABEL 19h, 19h, "Speed1:___Hz"
        WIN_LABEL 1fh, 24h, "Depth:"
        WIN_RULE  0fh, 67h, 15h, 1ch
        WIN_LABEL 6dh, 15h, "MIDI control #:"
        WIN_LABEL 79h, 1fh, "Acceleration:___s"
        WIN_LABEL 9dh, 29h, "Speed2:___Hz"
        WIN_END
d_c2_w_04d68:
        db      31h, 0bh, 60h, 01h, 01h, 40h, 00h, 00h, 00h
        db      00h, 06h, 00h, 00h, 00h
d_c2_w_04d76:
        dw      EP_FX_ROTARY_FIELD0_THUNK_OFF, EP_FX_ROTARY_FIELD0_THUNK_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_FX_ROTARY_FIELD1_THUNK_OFF, EP_FX_ROTARY_FIELD1_THUNK_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_FX_ROTARY_FIELD3_THUNK_OFF, EP_FX_ROTARY_FIELD3_THUNK_SEG
        dw      EP_FAR_53784_OFF, EP_FAR_53784_SEG
        db      00h, 00h, 00h
        db      00h
TBL_FIELDS_4D68:                        ; 6 x FIELD_SIZE; the part of the array this .asm emits itself
        db      43h, 19h, 12h, 02h, 11h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_ROTARY_FIELD1_THUNK_OFF, EP_FX_ROTARY_FIELD1_THUNK_SEG, EP_FX_ROTARY_FIELD0_THUNK_OFF, EP_FX_ROTARY_FIELD0_THUNK_SEG, EP_FX_ROTARY_FIELD2_THUNK_OFF, EP_FX_ROTARY_FIELD2_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_FX_ROTARY_FIELD3_THUNK_OFF, EP_FX_ROTARY_FIELD3_THUNK_SEG, EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      43h, 24h, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_ROTARY_FIELD2_THUNK_OFF, EP_FX_ROTARY_FIELD2_THUNK_SEG, EP_FX_ROTARY_FIELD1_THUNK_OFF, EP_FX_ROTARY_FIELD1_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_FX_ROTARY_FIELD4_THUNK_OFF, EP_FX_ROTARY_FIELD4_THUNK_SEG, EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      0c7h, 15h, 12h, 03h, 01h, 00h, 00h, 00h, 00h, 00h, 7fh, 00h, 00h, 00h ; [3] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_FX_ROTARY_FIELD3_THUNK_OFF, EP_FX_ROTARY_FIELD3_THUNK_SEG, EP_FX_ROTARY_FIELD0_THUNK_OFF, EP_FX_ROTARY_FIELD0_THUNK_SEG, EP_FX_ROTARY_FIELD4_THUNK_OFF, EP_FX_ROTARY_FIELD4_THUNK_SEG ; THUNK  PREV  NEXT
        dw      EP_FX_ROTARY_FIELD1_THUNK_OFF, EP_FX_ROTARY_FIELD1_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        else
        dw      EP_FX_ROTARY_FIELD3_THUNK_OFF, EP_FX_ROTARY_FIELD3_THUNK_SEG
        dw      EP_FX_ROTARY_FIELD0_THUNK_OFF, EP_FX_ROTARY_FIELD0_THUNK_SEG
        dw      (C2_BASE+fx_rotary_field4_thunk-C2_SEG*16), C2_SEG, EP_FX_ROTARY_FIELD1_THUNK_OFF, EP_FX_ROTARY_FIELD1_THUNK_SEG
        endif
        db      00h, 00h, 00h, 00h
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      0c7h, 1fh, 12h, 02h, 11h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [4] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_ROTARY_FIELD4_THUNK_OFF, EP_FX_ROTARY_FIELD4_THUNK_SEG, EP_FX_ROTARY_FIELD3_THUNK_OFF, EP_FX_ROTARY_FIELD3_THUNK_SEG, EP_FX_ROTARY_FIELD5_THUNK_OFF, EP_FX_ROTARY_FIELD5_THUNK_SEG ; THUNK  PREV  NEXT
        dw      EP_FX_ROTARY_FIELD2_THUNK_OFF, EP_FX_ROTARY_FIELD2_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      0c7h, 29h, 12h, 02h, 11h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [5] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_ROTARY_FIELD5_THUNK_OFF, EP_FX_ROTARY_FIELD5_THUNK_SEG, EP_FX_ROTARY_FIELD4_THUNK_OFF, EP_FX_ROTARY_FIELD4_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_FX_ROTARY_FIELD2_THUNK_OFF, EP_FX_ROTARY_FIELD2_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
d_c2_w_04e64:
        dw      EP_FAR_53AC2_OFF
d_c2_tbl_04e66:
        dw      EP_FAR_53AC2_SEG
        dw      EP_FAR_53AC6_OFF, EP_FAR_53AC6_SEG
        dw      EP_FAR_53ACA_OFF, EP_FAR_53ACA_SEG
        dw      (C2_BASE+L_53ACE-C2_SEG*16), C2_SEG
TBL_WINKEYS_FX_FMOD_AUTOPAN:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F2, EP_FX_FMOD_AUTOPAN_F2_SEG, EP_FX_FMOD_AUTOPAN_F2_OFF
        WIN_KEY   WIN_K_F3, EP_FX_FMOD_AUTOPAN_F3_SEG, EP_FX_FMOD_AUTOPAN_F3_OFF
        WIN_KEY   WIN_K_F4, EP_COPY_PGM_REFRESH_SEG, EP_COPY_PGM_REFRESH_OFF
        if      FW_VERSION >= 112
        WIN_KEY   WIN_K_F5, C2_SEG, EP_X_53924_OFF
        else
        WIN_KEY   WIN_K_F5, C2_SEG, EP_FX_FMOD_AUTOPAN_F5_OFF
        endif
        WIN_KEY   WIN_K_PAINT, EP_FX_FMOD_AUTOPAN_PAINT_SEG, EP_FX_FMOD_AUTOPAN_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_COPY_PGM_REFRESH_SEG, EP_COPY_PGM_REFRESH_OFF
        WIN_KEY   WIN_K_REFRESH, EP_FX_EDIT_REFRESH_SEG, EP_FX_EDIT_REFRESH_OFF
        WIN_KEY   33h, EP_FX_EDIT_KEY_33_SEG, EP_FX_EDIT_KEY_33_OFF
        WIN_KEY_END
        WIN_LABEL 13h, 0bh, "Type:"
        WIN_LABEL 19h, 15h, "<F-MOD> Speed:___Hz"
        WIN_LABEL 49h, 1fh, "Depth:"
        WIN_LABEL 37h, 29h, "Feedback:"
        WIN_RULE  0fh, 97h, 0bh, 28h
        WIN_LABEL 9dh, 0bh, "<AUTOPAN>"
        WIN_LABEL 9dh, 15h, "Speed:___Hz"
        WIN_LABEL 9dh, 1fh, "Depth:"
        WIN_LABEL 0a3h, 29h, "Mode:"
        WIN_END
        db      00h
d_c2_w_04f12:
        db      31h, 0bh, 60h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 06h, 00h, 00h, 00h
d_c2_w_04f20:
        dw      EP_FX_FMOD_AUTOPAN_FIELD0_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD0_THUNK_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_FX_FMOD_AUTOPAN_FIELD1_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD1_THUNK_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_FX_FMOD_AUTOPAN_FIELD4_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD4_THUNK_SEG
        dw      EP_FAR_53A82_OFF, EP_FAR_53A82_SEG
        db      00h, 00h, 00h, 00h
TBL_FIELDS_4F12:                        ; 7 x FIELD_SIZE; the part of the array this .asm emits itself
        db      6dh, 15h, 12h, 02h, 11h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_FX_FMOD_AUTOPAN_FIELD1_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD1_THUNK_SEG, EP_FX_FMOD_AUTOPAN_FIELD0_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD0_THUNK_SEG, EP_FX_FMOD_AUTOPAN_FIELD2_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD2_THUNK_SEG ; THUNK  PREV  NEXT
        else
        dw      EP_FX_FMOD_AUTOPAN_FIELD1_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD1_THUNK_SEG
        dw      (C2_BASE+fx_fmod_autopan_field0_thunk-C2_SEG*16), C2_SEG, EP_FX_FMOD_AUTOPAN_FIELD2_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD2_THUNK_SEG
        endif
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_FX_FMOD_AUTOPAN_FIELD4_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD4_THUNK_SEG, EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      6dh, 1fh, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_FMOD_AUTOPAN_FIELD2_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD2_THUNK_SEG, EP_FX_FMOD_AUTOPAN_FIELD1_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD1_THUNK_SEG, EP_FX_FMOD_AUTOPAN_FIELD3_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD3_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_FX_FMOD_AUTOPAN_FIELD5_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD5_THUNK_SEG, EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      6dh, 29h, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [3] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_FMOD_AUTOPAN_FIELD3_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD3_THUNK_SEG, EP_FX_FMOD_AUTOPAN_FIELD2_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD2_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_FX_FMOD_AUTOPAN_FIELD6_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD6_THUNK_SEG, EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      0c1h, 15h, 12h, 02h, 11h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [4] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_FX_FMOD_AUTOPAN_FIELD4_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD4_THUNK_SEG, EP_FX_FMOD_AUTOPAN_FIELD0_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD0_THUNK_SEG, EP_FX_FMOD_AUTOPAN_FIELD5_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD5_THUNK_SEG ; THUNK  PREV  NEXT
        dw      EP_FX_FMOD_AUTOPAN_FIELD1_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD1_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        else
        dw      EP_FX_FMOD_AUTOPAN_FIELD4_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD4_THUNK_SEG
        dw      EP_FX_FMOD_AUTOPAN_FIELD0_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD0_THUNK_SEG
        dw      (C2_BASE+fx_fmod_autopan_field5_thunk-C2_SEG*16), C2_SEG, EP_FX_FMOD_AUTOPAN_FIELD1_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD1_THUNK_SEG
        endif
        db      00h, 00h, 00h, 00h
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      0c1h, 1fh, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [5] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_FMOD_AUTOPAN_FIELD5_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD5_THUNK_SEG, EP_FX_FMOD_AUTOPAN_FIELD4_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD4_THUNK_SEG, EP_FX_FMOD_AUTOPAN_FIELD6_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD6_THUNK_SEG ; THUNK  PREV  NEXT
        dw      EP_FX_FMOD_AUTOPAN_FIELD2_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD2_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      0c1h, 29h, 18h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 03h, 00h, 00h, 00h ; [6] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_FMOD_AUTOPAN_FIELD6_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD6_THUNK_SEG, EP_FX_FMOD_AUTOPAN_FIELD5_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD5_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_FX_FMOD_AUTOPAN_FIELD3_THUNK_OFF, EP_FX_FMOD_AUTOPAN_FIELD3_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
TBL_WINKEYS_FX_PITCH_SHIFT:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F2, EP_FX_PITCH_SHIFT_F2_SEG, EP_FX_PITCH_SHIFT_F2_OFF
        WIN_KEY   WIN_K_F3, EP_FX_PITCH_SHIFT_F3_SEG, EP_FX_PITCH_SHIFT_F3_OFF
        WIN_KEY   WIN_K_F4, EP_FX_PITCH_SHIFT_OPEN_SEG, EP_FX_PITCH_SHIFT_OPEN_OFF
        WIN_KEY   WIN_K_F5, EP_FX_PITCH_SHIFT_F5_SEG, EP_FX_PITCH_SHIFT_F5_OFF
        WIN_KEY   WIN_K_PAINT, EP_FX_PITCH_SHIFT_PAINT_SEG, EP_FX_PITCH_SHIFT_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_FX_PITCH_SHIFT_OPEN_SEG, EP_FX_PITCH_SHIFT_OPEN_OFF
        WIN_KEY   WIN_K_REFRESH, EP_FX_EDIT_REFRESH_SEG, EP_FX_EDIT_REFRESH_OFF
        WIN_KEY   33h, EP_FX_EDIT_KEY_33_SEG, EP_FX_EDIT_KEY_33_OFF
        WIN_KEY_END
d_c0_w_0506a:
        db      07h, 13h, 0bh, 54h, 79h, 70h, 65h
        db      3ah, 00h
        WIN_LABEL 97h, 0bh, "Left   Right"
        WIN_LABEL 73h, 15h, "Tune:"
        WIN_END
        db      00h
        WIN_LABEL 6dh, 1fh, "Delay:"
        WIN_LABEL 0a9h, 1fh, "ms"
        WIN_LABEL 0d3h, 1fh, "ms"
        WIN_LABEL 5bh, 29h, "Feedback:"
        WIN_END
d_c2_w_050b2:
        db      31h, 0bh, 60h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 06h, 00h, 00h, 00h
d_c2_tbl_050c0:
        dw      EP_FX_PITCH_SHIFT_FIELD0_THUNK_OFF, EP_FX_PITCH_SHIFT_FIELD0_THUNK_SEG
        db      00h, 00h, 00h, 00h
        dw      (C0_BASE+L_3D06E-C0_SEG*16), C0_SEG
        db      00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h
        dw      EP_FAR_53C64_OFF, EP_FAR_53C64_SEG
        db      00h, 00h, 00h, 00h
TBL_FIELDS_50B2:                        ; 7 x FIELD_SIZE; the part of the array this .asm emits itself
        db      91h, 15h, 24h, 04h, 22h, 80h, 78h, 0ech, 0ffh, 0ffh, 88h, 13h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_L_3D06E_OFF, EP_L_3D06E_SEG, EP_FX_PITCH_SHIFT_FIELD0_THUNK_OFF, EP_FX_PITCH_SHIFT_FIELD0_THUNK_SEG, EP_FX_PITCH_SHIFT_FIELD3_THUNK_OFF, EP_FX_PITCH_SHIFT_FIELD3_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_L_3D0D4_OFF, EP_L_3D0D4_SEG, EP_L_3D0A4_OFF, EP_L_3D0A4_SEG
        db      00h, 00h, 00h, 00h
d_c0_w_05106:
        db      0bbh, 15h, 24h, 04h, 22h, 80h, 78h, 0ech, 0ffh, 0ffh, 88h, 13h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        dw      EP_L_3D0D4_OFF, EP_L_3D0D4_SEG, EP_FX_PITCH_SHIFT_FIELD0_THUNK_OFF, EP_FX_PITCH_SHIFT_FIELD0_THUNK_SEG, EP_FX_PITCH_SHIFT_FIELD4_THUNK_OFF, EP_FX_PITCH_SHIFT_FIELD4_THUNK_SEG ; THUNK  PREV  NEXT
        dw      EP_L_3D06E_OFF, EP_L_3D06E_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_L_3D10A_OFF, EP_L_3D10A_SEG
        db      00h, 00h, 00h, 00h
        db      97h, 1fh, 12h, 03h, 02h, 00h, 00h, 00h, 00h, 00h, 13h, 01h, 00h, 00h ; [3] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_PITCH_SHIFT_FIELD3_THUNK_OFF, EP_FX_PITCH_SHIFT_FIELD3_THUNK_SEG, EP_L_3D06E_OFF, EP_L_3D06E_SEG, EP_FX_PITCH_SHIFT_FIELD5_THUNK_OFF, EP_FX_PITCH_SHIFT_FIELD5_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_FX_PITCH_SHIFT_FIELD4_THUNK_OFF, EP_FX_PITCH_SHIFT_FIELD4_THUNK_SEG, EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      0c1h, 1fh, 12h, 03h, 02h, 00h, 00h, 00h, 00h, 00h, 13h, 01h, 00h, 00h ; [4] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_PITCH_SHIFT_FIELD4_THUNK_OFF, EP_FX_PITCH_SHIFT_FIELD4_THUNK_SEG, EP_L_3D0D4_OFF, EP_L_3D0D4_SEG, EP_FX_PITCH_SHIFT_FIELD6_THUNK_OFF, EP_FX_PITCH_SHIFT_FIELD6_THUNK_SEG ; THUNK  PREV  NEXT
        dw      EP_FX_PITCH_SHIFT_FIELD3_THUNK_OFF, EP_FX_PITCH_SHIFT_FIELD3_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      9dh, 29h, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [5] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_PITCH_SHIFT_FIELD5_THUNK_OFF, EP_FX_PITCH_SHIFT_FIELD5_THUNK_SEG, EP_FX_PITCH_SHIFT_FIELD3_THUNK_OFF, EP_FX_PITCH_SHIFT_FIELD3_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_FX_PITCH_SHIFT_FIELD6_THUNK_OFF, EP_FX_PITCH_SHIFT_FIELD6_THUNK_SEG, EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      0c7h, 29h, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [6] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_PITCH_SHIFT_FIELD6_THUNK_OFF, EP_FX_PITCH_SHIFT_FIELD6_THUNK_SEG, EP_FX_PITCH_SHIFT_FIELD4_THUNK_OFF, EP_FX_PITCH_SHIFT_FIELD4_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_FX_PITCH_SHIFT_FIELD5_THUNK_OFF, EP_FX_PITCH_SHIFT_FIELD5_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
d_c2_w_051d8:
        dw      EP_FAR_54100_OFF
d_c2_tbl_051da:
        dw      EP_FAR_54100_SEG
        dw      EP_FAR_5410A_OFF, EP_FAR_5410A_SEG
        dw      (C2_BASE+L_54114-C2_SEG*16), C2_SEG
        dw      EP_FAR_49A8C_OFF, EP_FAR_49A8C_SEG
TBL_WINKEYS_FX_DELAY:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F2, EP_FX_DELAY_F2_SEG, EP_FX_DELAY_F2_OFF
        WIN_KEY   WIN_K_F3, EP_FX_DELAY_F3_SEG, EP_FX_DELAY_F3_OFF
        WIN_KEY   WIN_K_F4, EP_FX_DELAY_OPEN_SEG, EP_FX_DELAY_OPEN_OFF
        WIN_KEY   WIN_K_F5, EP_FX_DELAY_F5_SEG, EP_FX_DELAY_F5_OFF
        WIN_KEY   WIN_K_PAINT, EP_FX_DELAY_PAINT_SEG, EP_FX_DELAY_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_FX_DELAY_OPEN_SEG, EP_FX_DELAY_OPEN_OFF
        WIN_KEY   WIN_K_REFRESH, EP_FX_EDIT_REFRESH_SEG, EP_FX_EDIT_REFRESH_OFF
        WIN_KEY   33h, EP_FX_EDIT_KEY_33_SEG, EP_FX_EDIT_KEY_33_OFF
        WIN_KEY_END
d_c2_w_0521a:
        db      07h, 8bh, 0bh, 46h, 65h, 65h, 64h
        db      62h, 61h, 63h, 6bh, 3ah, 5fh, 5fh, 25h, 00h
        WIN_LABEL 67h, 15h, "Feedback delay:___ms"
        WIN_LABEL 7fh, 1fh, "HF damping:___Hz"
        WIN_LABEL 5bh, 29h, "L/R delay offset:___%"
        WIN_END
        WIN_LABEL 97h, 0bh, "Left   Right"
        WIN_LABEL 61h, 15h, "Feedback: __%"
        WIN_LABEL 0d3h, 15h, "%"
        WIN_LABEL 3dh, 1fh, "Feedback delay:___ms"
        WIN_LABEL 0d3h, 1fh, "ms"
        WIN_LABEL 55h, 29h, "HF damping:___Hz"
        WIN_LABEL 0d3h, 29h, "Hz"
        WIN_END
        db      00h, 31h
        db      0bh, 36h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 03h, 00h, 00h, 00h
d_c0_tbl_fx_delay_field_thunk:
        dw      EP_FX_DELAY_FIELD0_THUNK_OFF, EP_FX_DELAY_FIELD0_THUNK_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_L_540DC_OFF, EP_L_540DC_SEG
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
TBL_FIELDS_52D0:                        ; 11 x FIELD_SIZE; the part of the array this .asm emits itself
        db      0c1h, 0bh, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_DELAY_FIELD1_THUNK_OFF, EP_FX_DELAY_FIELD1_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        if      FW_VERSION >= 112
        dw      EP_FX_DELAY_FIELD2_THUNK_OFF, C2_SEG
        else
        dw      EP_FAR_53134_OFF, C2_SEG
        endif
        dw      EP_FX_DELAY_FIELD0_THUNK_OFF, EP_FX_DELAY_FIELD0_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
d_c2_w_05324:
        db      0c1h, 15h, 12h, 03h, 02h, 00h, 00h, 00h, 00h, 00h
d_c2_w_0532e:
        db      4fh, 01h
d_c2_w_05330:
        db      00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_FX_DELAY_FIELD2_THUNK_OFF, C2_SEG, EP_FX_DELAY_FIELD1_THUNK_OFF, EP_FX_DELAY_FIELD1_THUNK_SEG, EP_FX_DELAY_FIELD3_THUNK_OFF, EP_FX_DELAY_FIELD3_THUNK_SEG ; THUNK  PREV  NEXT
        else
        dw      EP_FAR_53134_OFF, C2_SEG, EP_FX_DELAY_FIELD1_THUNK_OFF, EP_FX_DELAY_FIELD1_THUNK_SEG, EP_FX_DELAY_FIELD3_THUNK_OFF, EP_FX_DELAY_FIELD3_THUNK_SEG
        endif
        dw      EP_FX_DELAY_FIELD0_THUNK_OFF, EP_FX_DELAY_FIELD0_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      0c1h, 1fh, 12h, 02h, 01h, 40h, 14h, 00h, 00h, 00h, 42h, 00h, 00h, 00h ; [3] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_FX_DELAY_FIELD3_THUNK_OFF, EP_FX_DELAY_FIELD3_THUNK_SEG, EP_FX_DELAY_FIELD2_THUNK_OFF, C2_SEG, EP_FX_DELAY_FIELD4_THUNK_OFF, EP_FX_DELAY_FIELD4_THUNK_SEG ; THUNK  PREV  NEXT
        else
        dw      EP_FX_DELAY_FIELD3_THUNK_OFF, EP_FX_DELAY_FIELD3_THUNK_SEG, EP_FAR_53134_OFF, C2_SEG, EP_FX_DELAY_FIELD4_THUNK_OFF, EP_FX_DELAY_FIELD4_THUNK_SEG
        endif
        dw      EP_FX_DELAY_FIELD0_THUNK_OFF, EP_FX_DELAY_FIELD0_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      0c1h, 29h, 12h, 02h, 01h, 80h, 0ceh, 0ffh, 0ffh, 0ffh, 32h, 00h, 00h, 00h ; [4] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_DELAY_FIELD4_THUNK_OFF, EP_FX_DELAY_FIELD4_THUNK_SEG, EP_FX_DELAY_FIELD3_THUNK_OFF, EP_FX_DELAY_FIELD3_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_FX_DELAY_FIELD0_THUNK_OFF, EP_FX_DELAY_FIELD0_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      9dh, 15h, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [5] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_DELAY_FIELD5_THUNK_OFF, EP_FX_DELAY_FIELD5_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        if      FW_VERSION >= 112
        dw      EP_FX_DELAY_FIELD6_THUNK_OFF, EP_FX_DELAY_FIELD6_THUNK_SEG
        dw      EP_FX_DELAY_FIELD0_THUNK_OFF, EP_FX_DELAY_FIELD0_THUNK_SEG, EP_FX_DELAY_FIELD8_THUNK_OFF, C2_SEG, EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG ; +1Ah..+21h  NOTIFY  ENTER
        else
        dw      EP_FX_DELAY_FIELD6_THUNK_OFF, EP_FX_DELAY_FIELD6_THUNK_SEG, EP_FX_DELAY_FIELD0_THUNK_OFF, EP_FX_DELAY_FIELD0_THUNK_SEG
        dw      EP_FAR_530B0_OFF, C2_SEG
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        endif
        db      00h, 00h, 00h, 00h
        db      97h, 1fh, 12h, 03h, 02h, 00h, 00h, 00h, 00h, 00h, 4fh, 01h, 00h, 00h ; [6] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_FX_DELAY_FIELD6_THUNK_OFF, EP_FX_DELAY_FIELD6_THUNK_SEG, EP_FX_DELAY_FIELD5_THUNK_OFF, EP_FX_DELAY_FIELD5_THUNK_SEG, EP_FX_DELAY_FIELD7_THUNK_OFF, EP_FX_DELAY_FIELD7_THUNK_SEG ; THUNK  PREV  NEXT
        dw      EP_FX_DELAY_FIELD0_THUNK_OFF, EP_FX_DELAY_FIELD0_THUNK_SEG, EP_FX_DELAY_FIELD9_THUNK_OFF, C2_SEG, EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG ; +1Ah..+21h  NOTIFY  ENTER
        else
        dw      EP_FX_DELAY_FIELD6_THUNK_OFF, EP_FX_DELAY_FIELD6_THUNK_SEG, EP_FX_DELAY_FIELD5_THUNK_OFF, EP_FX_DELAY_FIELD5_THUNK_SEG
        dw      (C2_BASE+fx_delay_field7_thunk-C2_SEG*16), C2_SEG, EP_FX_DELAY_FIELD0_THUNK_OFF, EP_FX_DELAY_FIELD0_THUNK_SEG
        dw      EP_FAR_530DC_OFF, C2_SEG
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        endif
        db      00h, 00h, 00h, 00h
        db      97h, 29h, 12h, 02h, 01h, 40h, 14h, 00h, 00h, 00h, 42h, 00h, 00h, 00h ; [7] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_DELAY_FIELD7_THUNK_OFF, EP_FX_DELAY_FIELD7_THUNK_SEG, EP_FX_DELAY_FIELD6_THUNK_OFF, EP_FX_DELAY_FIELD6_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        if      FW_VERSION >= 112
        dw      EP_FX_DELAY_FIELD0_THUNK_OFF, EP_FX_DELAY_FIELD0_THUNK_SEG, EP_FX_DELAY_FIELD10_THUNK_OFF, C2_SEG, EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG ; +1Ah..+21h  NOTIFY  ENTER
        else
        dw      EP_FX_DELAY_FIELD0_THUNK_OFF, EP_FX_DELAY_FIELD0_THUNK_SEG, EP_FAR_53108_OFF, C2_SEG, EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        endif
        db      00h, 00h, 00h, 00h
        db      0c7h, 15h, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [8] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_FX_DELAY_FIELD8_THUNK_OFF, C2_SEG ; THUNK  PREV  NEXT
        else
        dw      EP_FAR_530B0_OFF, C2_SEG
        endif
        db      00h, 00h, 00h, 00h
        if      FW_VERSION >= 112
        dw      EP_FX_DELAY_FIELD9_THUNK_OFF, C2_SEG
        else
        dw      EP_FAR_530DC_OFF, C2_SEG
        endif
        dw      EP_FX_DELAY_FIELD5_THUNK_OFF, EP_FX_DELAY_FIELD5_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      0c1h, 1fh, 12h, 03h, 02h, 00h, 00h, 00h, 00h, 00h, 4fh, 01h, 00h, 00h ; [9] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_FX_DELAY_FIELD9_THUNK_OFF, C2_SEG, EP_FX_DELAY_FIELD8_THUNK_OFF, C2_SEG, EP_FX_DELAY_FIELD10_THUNK_OFF, C2_SEG ; THUNK  PREV  NEXT
        else
        dw      EP_FAR_530DC_OFF, C2_SEG, EP_FAR_530B0_OFF, C2_SEG, EP_FAR_53108_OFF, C2_SEG
        endif
        dw      EP_FX_DELAY_FIELD6_THUNK_OFF, EP_FX_DELAY_FIELD6_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      0c1h, 29h, 12h, 02h, 01h, 40h, 14h, 00h, 00h, 00h, 42h, 00h, 00h, 00h ; [10] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_FX_DELAY_FIELD10_THUNK_OFF, C2_SEG, EP_FX_DELAY_FIELD9_THUNK_OFF, C2_SEG ; THUNK  PREV  NEXT
        else
        dw      EP_FAR_53108_OFF, C2_SEG, EP_FAR_530DC_OFF, C2_SEG
        endif
        db      00h, 00h, 00h, 00h
        dw      EP_FX_DELAY_FIELD7_THUNK_OFF, EP_FX_DELAY_FIELD7_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_SECTION_FIELD_NOTIFY_OFF, EP_FX_SECTION_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
d_c2_w_0549e:
        if      FW_VERSION >= 112
        dw      EP_L_54516_OFF, EP_L_54516_SEG, EP_L_54522_OFF, EP_L_54522_SEG, EP_L_5452E_OFF, EP_L_5452E_SEG, EP_L_5453A_OFF, EP_L_5453A_SEG, EP_L_54546_OFF, EP_L_54546_SEG
        dw      (C2_BASE+L_53BEE-C2_SEG*16), C2_SEG
        else
        dw      EP_L_54516_OFF, EP_L_54516_SEG, EP_L_54522_OFF, EP_L_54522_SEG, EP_L_5452E_OFF, EP_L_5452E_SEG, EP_L_5453A_OFF, EP_L_5453A_SEG
        dw      EP_L_54546_OFF, EP_L_54546_SEG, EP_L_53BEE_OFF, C2_SEG
        endif
        dw      EP_L_53BF6_OFF, EP_L_53BF6_SEG
TBL_WINKEYS_FX_REVERB:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F2, EP_FX_REVERB_F2_SEG, EP_FX_REVERB_F2_OFF
        WIN_KEY   WIN_K_F3, EP_FX_REVERB_F3_SEG, EP_FX_REVERB_F3_OFF
        WIN_KEY   WIN_K_F4, EP_FX_REVERB_OPEN_SEG, EP_FX_REVERB_OPEN_OFF
        WIN_KEY   WIN_K_F5, EP_FX_REVERB_F5_SEG, EP_FX_REVERB_F5_OFF
        WIN_KEY   WIN_K_PAINT, EP_FX_REVERB_PAINT_SEG, EP_FX_REVERB_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_FX_REVERB_OPEN_SEG, EP_FX_REVERB_OPEN_OFF
        WIN_KEY   WIN_K_REFRESH, EP_FX_EDIT_REFRESH_SEG, EP_FX_EDIT_REFRESH_OFF
        WIN_KEY   33h, EP_FX_EDIT_KEY_33_SEG, EP_FX_EDIT_KEY_33_OFF
        WIN_KEY_END
d_c2_w_054ec:
        db      07h, 13h, 0bh, 54h, 79h
        db      70h, 65h, 3ah, 00h
        WIN_LABEL 2bh, 15h, "Predelay:__ms"
        WIN_LABEL 43h, 1fh, "Time:"
        WIN_LABEL 31h, 29h, "Diffuse:"
        WIN_END
        WIN_LABEL 0a9h, 15h, "Near:"
        WIN_LABEL 85h, 1fh, "LF damping:   Hz"
        WIN_LABEL 85h, 29h, "HF damping:   Hz"
        WIN_END
        db      31h, 0bh, 3ch
        db      01h, 01h, 40h, 00h, 00h, 00h, 00h, 06h, 00h, 00h, 00h
d_c2_tbl_0555c:
        dw      EP_FX_REVERB_FIELD0_THUNK_OFF, EP_FX_REVERB_FIELD0_THUNK_SEG
        db      00h
        db      00h, 00h, 00h
        dw      EP_FX_REVERB_FIELD1_THUNK_OFF, EP_FX_REVERB_FIELD1_THUNK_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_FX_REVERB_FIELD_NOTIFY_OFF, EP_FX_REVERB_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
TBL_FIELDS_554E:                        ; 7 x FIELD_SIZE; the part of the array this .asm emits itself
        db      61h, 15h, 0ch, 02h, 02h, 00h, 00h, 00h, 00h, 00h, 5ah, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_REVERB_FIELD1_THUNK_OFF, EP_FX_REVERB_FIELD1_THUNK_SEG, EP_FX_REVERB_FIELD0_THUNK_OFF, EP_FX_REVERB_FIELD0_THUNK_SEG, EP_FX_REVERB_FIELD2_THUNK_OFF, EP_FX_REVERB_FIELD2_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_FX_REVERB_FIELD4_THUNK_OFF, EP_FX_REVERB_FIELD4_THUNK_SEG, EP_FX_REVERB_FIELD_NOTIFY_OFF, EP_FX_REVERB_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
d_c2_w_055a2:
        db      61h, 1fh, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_REVERB_FIELD2_THUNK_OFF, EP_FX_REVERB_FIELD2_THUNK_SEG, EP_FX_REVERB_FIELD1_THUNK_OFF, EP_FX_REVERB_FIELD1_THUNK_SEG, EP_FX_REVERB_FIELD3_THUNK_OFF, EP_FX_REVERB_FIELD3_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_FX_REVERB_FIELD5_THUNK_OFF, EP_FX_REVERB_FIELD5_THUNK_SEG, EP_FX_REVERB_FIELD_NOTIFY_OFF, EP_FX_REVERB_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
        db      61h, 29h, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [3] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_REVERB_FIELD3_THUNK_OFF, EP_FX_REVERB_FIELD3_THUNK_SEG, EP_FX_REVERB_FIELD2_THUNK_OFF, EP_FX_REVERB_FIELD2_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_FX_REVERB_FIELD6_THUNK_OFF, EP_FX_REVERB_FIELD6_THUNK_SEG, EP_FX_REVERB_FIELD_NOTIFY_OFF, EP_FX_REVERB_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
d_c2_w_055f6:
        db      0c7h, 15h, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [4] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_FX_REVERB_FIELD4_THUNK_OFF, EP_FX_REVERB_FIELD4_THUNK_SEG, EP_FX_REVERB_FIELD0_THUNK_OFF, EP_FX_REVERB_FIELD0_THUNK_SEG, EP_FX_REVERB_FIELD5_THUNK_OFF, EP_FX_REVERB_FIELD5_THUNK_SEG ; THUNK  PREV  NEXT
        dw      EP_FX_REVERB_FIELD1_THUNK_OFF, EP_FX_REVERB_FIELD1_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        else
        dw      EP_FX_REVERB_FIELD4_THUNK_OFF, EP_FX_REVERB_FIELD4_THUNK_SEG
        dw      (C2_BASE+fx_reverb_field0_thunk-C2_SEG*16), C2_SEG, EP_FX_REVERB_FIELD5_THUNK_OFF, EP_FX_REVERB_FIELD5_THUNK_SEG, EP_FX_REVERB_FIELD1_THUNK_OFF, EP_FX_REVERB_FIELD1_THUNK_SEG
        endif
        db      00h, 00h, 00h, 00h
        dw      EP_FX_REVERB_FIELD_NOTIFY_OFF, EP_FX_REVERB_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
d_c2_w_05620:
        db      0c7h, 1fh, 12h, 02h, 01h, 40h, 00h, 00h, 00h, 00h, 28h, 00h, 00h, 00h ; [5] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_REVERB_FIELD5_THUNK_OFF, EP_FX_REVERB_FIELD5_THUNK_SEG, EP_FX_REVERB_FIELD4_THUNK_OFF, EP_FX_REVERB_FIELD4_THUNK_SEG, EP_FX_REVERB_FIELD6_THUNK_OFF, EP_FX_REVERB_FIELD6_THUNK_SEG ; THUNK  PREV  NEXT
        dw      EP_FX_REVERB_FIELD2_THUNK_OFF, EP_FX_REVERB_FIELD2_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_REVERB_FIELD_NOTIFY_OFF, EP_FX_REVERB_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
d_c2_w_0564a:
        db      0c7h, 29h, 12h, 02h, 01h, 40h, 28h, 00h, 00h, 00h, 42h, 00h, 00h, 00h ; [6] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_REVERB_FIELD6_THUNK_OFF, EP_FX_REVERB_FIELD6_THUNK_SEG, EP_FX_REVERB_FIELD5_THUNK_OFF, EP_FX_REVERB_FIELD5_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_FX_REVERB_FIELD3_THUNK_OFF, EP_FX_REVERB_FIELD3_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_REVERB_FIELD_NOTIFY_OFF, EP_FX_REVERB_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
d_c2_w_05674:
        dw      EP_L_54058_OFF
d_c2_tbl_05676:
        dw      EP_L_54058_SEG
        dw      EP_FAR_549C6_OFF, EP_FAR_549C6_SEG
        dw      EP_FAR_549D4_OFF, EP_FAR_549D4_SEG
d_c2_w_05680:
        dw      EP_FAR_49A94_OFF
d_c2_tbl_05682:
        dw      EP_FAR_49A94_SEG
        dw      EP_FAR_49A98_OFF, EP_FAR_49A98_SEG
        dw      EP_L_49A9C_OFF, EP_L_49A9C_SEG
        dw      EP_L_49AA0_OFF, EP_L_49AA0_SEG
        dw      EP_FAR_49AA4_OFF, EP_FAR_49AA4_SEG
TBL_WINKEYS_FX_MIXER:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F4, EP_FX_MIXER_CLOSE_SEG, EP_FX_MIXER_CLOSE_OFF
        WIN_KEY   WIN_K_PAINT, EP_FX_MIXER_PAINT_SEG, EP_FX_MIXER_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_FX_MIXER_CLOSE_SEG, EP_FX_MIXER_CLOSE_OFF
        WIN_KEY   WIN_K_REFRESH, EP_FX_MIXER_REFRESH_SEG, EP_FX_MIXER_REFRESH_OFF
        WIN_KEY_END
        WIN_SOFTKEY 4, 2, "CLOSE"
        WIN_LABEL 13h, 0bh, "Direct sig:"
        WIN_LABEL 13h, 15h, "Patch:"
        WIN_LABEL 13h, 29h, "Output:"
        WIN_RULE  0fh, 6dh, 0ah, 28h
        WIN_LABEL 0a7h, 0bh, "Lev^Pan^Wid"
        WIN_LABEL 79h, 15h, "Dist/EQ:"
        WIN_LABEL 73h, 1fh, "Mod/Echo:"
        WIN_LABEL 7fh, 29h, "Reverb:"
        WIN_END
        db      00h, 55h, 0bh, 12h, 01h, 01h, 40h, 00h, 00h, 00h
        db      00h, 01h, 00h, 00h, 00h
d_c2_w_05726:
        dw      EP_FX_MIXER_FIELD0_THUNK_OFF, EP_FX_MIXER_FIELD0_THUNK_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_FX_MIXER_FIELD1_THUNK_OFF, EP_FX_MIXER_FIELD1_THUNK_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_FX_MIXER_FIELD3_THUNK_OFF, EP_FX_MIXER_FIELD3_THUNK_SEG
        dw      EP_FX_MIXER_FIELD_NOTIFY_OFF, EP_FX_MIXER_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h
        db      00h
TBL_FIELDS_5718:                        ; 10 x FIELD_SIZE; the part of the array this .asm emits itself
        db      19h, 1fh, 48h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 02h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_MIXER_FIELD1_THUNK_OFF, EP_FX_MIXER_FIELD1_THUNK_SEG, EP_FX_MIXER_FIELD0_THUNK_OFF, EP_FX_MIXER_FIELD0_THUNK_SEG, EP_FX_MIXER_FIELD2_THUNK_OFF, EP_FX_MIXER_FIELD2_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_FX_MIXER_FIELD4_THUNK_OFF, EP_FX_MIXER_FIELD4_THUNK_SEG, EP_FX_MIXER_FIELD_NOTIFY_OFF, EP_FX_MIXER_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
d_c2_w_0576c:
        db      3dh, 29h, 12h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 04h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_MIXER_FIELD2_THUNK_OFF, EP_FX_MIXER_FIELD2_THUNK_SEG, EP_FX_MIXER_FIELD1_THUNK_OFF, EP_FX_MIXER_FIELD1_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        if      FW_VERSION >= 111
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_FX_MIXER_FIELD5_THUNK_OFF, C2_SEG, EP_FAR_5545E_OFF, EP_FAR_5545E_SEG
        else
        if      FW_VERSION >= 110
        db      00h, 00h, 00h, 00h, 0e6h, 66h, 74h, 4dh
        else
        db      00h, 00h, 00h, 00h
        db      0e6h, 66h
        db      26h
        db      4dh
        endif
        dw      EP_FAR_5545E_OFF, EP_FAR_5545E_SEG
        endif
        db      00h, 00h, 00h, 00h
        db      0a9h, 15h, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [3] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_MIXER_FIELD3_THUNK_OFF, EP_FX_MIXER_FIELD3_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_FX_MIXER_FIELD4_THUNK_OFF, EP_FX_MIXER_FIELD4_THUNK_SEG
        dw      EP_FX_MIXER_FIELD0_THUNK_OFF, EP_FX_MIXER_FIELD0_THUNK_SEG, EP_FX_MIXER_FIELD6_THUNK_OFF, EP_FX_MIXER_FIELD6_THUNK_SEG, EP_FX_MIXER_FIELD_NOTIFY_OFF, EP_FX_MIXER_FIELD_NOTIFY_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        db      0a9h, 1fh, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [4] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_FX_MIXER_FIELD4_THUNK_OFF, EP_FX_MIXER_FIELD4_THUNK_SEG, EP_FX_MIXER_FIELD3_THUNK_OFF, EP_FX_MIXER_FIELD3_THUNK_SEG, EP_FX_MIXER_FIELD5_THUNK_OFF, C2_SEG ; THUNK  PREV  NEXT
        dw      EP_FX_MIXER_FIELD1_THUNK_OFF, EP_FX_MIXER_FIELD1_THUNK_SEG, EP_FX_MIXER_FIELD7_THUNK_OFF, EP_FX_MIXER_FIELD7_THUNK_SEG, EP_FX_MIXER_FIELD_NOTIFY_OFF, EP_FX_MIXER_FIELD_NOTIFY_SEG ; +1Ah..+21h  NOTIFY  ENTER
        else
        dw      EP_FX_MIXER_FIELD4_THUNK_OFF, EP_FX_MIXER_FIELD4_THUNK_SEG
        dw      EP_FX_MIXER_FIELD3_THUNK_OFF, EP_FX_MIXER_FIELD3_THUNK_SEG
        if      FW_VERSION >= 111
        db      0e6h, 66h, 84h, 4dh
        elseif  FW_VERSION >= 110
        db      0e6h, 66h, 74h, 4dh
        else
        db      0e6h, 66h, 26h, 4dh
        endif
        dw      EP_FX_MIXER_FIELD1_THUNK_OFF, EP_FX_MIXER_FIELD1_THUNK_SEG
        dw      EP_FX_MIXER_FIELD7_THUNK_OFF, EP_FX_MIXER_FIELD7_THUNK_SEG
        dw      EP_FX_MIXER_FIELD_NOTIFY_OFF, EP_FX_MIXER_FIELD_NOTIFY_SEG
        endif
        db      00h, 00h, 00h, 00h
        db      0a9h, 29h, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [5] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 111
        dw      EP_FX_MIXER_FIELD5_THUNK_OFF, C2_SEG, EP_FX_MIXER_FIELD4_THUNK_OFF, EP_FX_MIXER_FIELD4_THUNK_SEG ; THUNK  PREV  NEXT
        else
        db      0e6h
        db      66h
        if      FW_VERSION >= 110
        db      74h, 4dh
        else
        db      26h, 4dh
        endif
        dw      EP_FX_MIXER_FIELD4_THUNK_OFF, EP_FX_MIXER_FIELD4_THUNK_SEG
        endif
        db      00h, 00h, 00h, 00h
        dw      (C2_BASE+FX_MIXER_FIELD2_THUNK-C2_SEG*16), C2_SEG, (C2_BASE+FX_MIXER_FIELD8_THUNK-C2_SEG*16), C2_SEG, (C2_BASE+FX_MIXER_FIELD_NOTIFY-C2_SEG*16), C2_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        db      0bbh, 15h, 12h, 02h, 01h, 80h, 0ceh, 0ffh, 0ffh, 0ffh, 32h, 00h, 00h, 00h ; [6] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_MIXER_FIELD6_THUNK_OFF, EP_FX_MIXER_FIELD6_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_FX_MIXER_FIELD7_THUNK_OFF, EP_FX_MIXER_FIELD7_THUNK_SEG
        dw      EP_FX_MIXER_FIELD3_THUNK_OFF, EP_FX_MIXER_FIELD3_THUNK_SEG, EP_FX_MIXER_FIELD9_THUNK_OFF, EP_FX_MIXER_FIELD9_THUNK_SEG, EP_FX_MIXER_FIELD_NOTIFY_OFF, EP_FX_MIXER_FIELD_NOTIFY_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        db      0bbh, 1fh, 12h, 02h, 01h, 80h, 0ceh, 0ffh, 0ffh, 0ffh, 32h, 00h, 00h, 00h ; [7] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_MIXER_FIELD7_THUNK_OFF, EP_FX_MIXER_FIELD7_THUNK_SEG, EP_FX_MIXER_FIELD6_THUNK_OFF, EP_FX_MIXER_FIELD6_THUNK_SEG, EP_FX_MIXER_FIELD8_THUNK_OFF, EP_FX_MIXER_FIELD8_THUNK_SEG ; THUNK  PREV  NEXT
        dw      EP_FX_MIXER_FIELD4_THUNK_OFF, EP_FX_MIXER_FIELD4_THUNK_SEG, EP_FX_MIXER_FIELD9_THUNK_OFF, EP_FX_MIXER_FIELD9_THUNK_SEG, EP_FX_MIXER_FIELD_NOTIFY_OFF, EP_FX_MIXER_FIELD_NOTIFY_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        db      0bbh, 29h, 12h, 02h, 01h, 80h, 0ceh, 0ffh, 0ffh, 0ffh, 32h, 00h, 00h, 00h ; [8] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_MIXER_FIELD8_THUNK_OFF, EP_FX_MIXER_FIELD8_THUNK_SEG, EP_FX_MIXER_FIELD7_THUNK_OFF, EP_FX_MIXER_FIELD7_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        if      FW_VERSION >= 111
        dw      EP_FX_MIXER_FIELD5_THUNK_OFF, C2_SEG, EP_FX_MIXER_FIELD9_THUNK_OFF, EP_FX_MIXER_FIELD9_THUNK_SEG, EP_FX_MIXER_FIELD_NOTIFY_OFF, EP_FX_MIXER_FIELD_NOTIFY_SEG ; +1Ah..+21h  NOTIFY  ENTER
        else
        if      FW_VERSION >= 110
        db      0e6h, 66h, 74h, 4dh
        else
        db      0e6h, 66h
        db      26h
        db      4dh
        endif
        dw      EP_FX_MIXER_FIELD9_THUNK_OFF, EP_FX_MIXER_FIELD9_THUNK_SEG
        dw      EP_FX_MIXER_FIELD_NOTIFY_OFF, EP_FX_MIXER_FIELD_NOTIFY_SEG
        endif
        db      00h, 00h, 00h, 00h
        db      0d3h, 1fh, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [9] x,y,class,digits  STORE  MIN  MAX
        dw      EP_FX_MIXER_FIELD9_THUNK_OFF, EP_FX_MIXER_FIELD9_THUNK_SEG, EP_FX_MIXER_FIELD6_THUNK_OFF, EP_FX_MIXER_FIELD6_THUNK_SEG, EP_FX_MIXER_FIELD8_THUNK_OFF, EP_FX_MIXER_FIELD8_THUNK_SEG ; THUNK  PREV  NEXT
        dw      EP_FX_MIXER_FIELD7_THUNK_OFF, EP_FX_MIXER_FIELD7_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_FX_MIXER_FIELD_NOTIFY_OFF, EP_FX_MIXER_FIELD_NOTIFY_SEG
        db      00h, 00h, 00h, 00h
TBL_WINKEYS_EFFECT_MIXER:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F4, EP_EFFECT_MIXER_CLOSE_SEG, EP_EFFECT_MIXER_CLOSE_OFF
        WIN_KEY   WIN_K_PAINT, EP_EFFECT_MIXER_PAINT_SEG, EP_EFFECT_MIXER_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_EFFECT_MIXER_CLOSE_SEG, EP_EFFECT_MIXER_CLOSE_OFF
        WIN_KEY   WIN_K_REFRESH, EP_EFFECT_MIXER_REFRESH_SEG, EP_EFFECT_MIXER_REFRESH_OFF
        WIN_KEY_END
        WIN_SOFTKEY 4, 2, "CLOSE"
        WIN_LABEL 0a7h, 0bh, "Lev^Pan"
        WIN_LABEL 7fh, 1fh, "Reverb:"
        WIN_END
TBL_FIELDS_58FA:                        ; 2 x FIELD_SIZE
        db      0a9h, 1fh, 0ch, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h ; [0] x,y,class,digits  STORE  MIN  MAX
d_c2_tbl_05908:
        dw      EP_EFFECT_MIXER_FIELD0_THUNK_OFF, EP_EFFECT_MIXER_FIELD0_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_EFFECT_MIXER_FIELD1_THUNK_OFF, EP_EFFECT_MIXER_FIELD1_THUNK_SEG, EP_L_54BD8_OFF, EP_L_54BD8_SEG
        db      00h, 00h, 00h, 00h
        db      0bbh, 1fh, 12h, 02h, 01h, 80h, 0ceh, 0ffh, 0ffh, 0ffh, 32h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_EFFECT_MIXER_FIELD1_THUNK_OFF, EP_EFFECT_MIXER_FIELD1_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_EFFECT_MIXER_FIELD0_THUNK_OFF, EP_EFFECT_MIXER_FIELD0_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h
        dw      EP_L_54BD8_OFF, EP_L_54BD8_SEG
        db      00h, 00h, 00h, 00h
TBL_WINKEYS_BUILD_INFO:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_PAINT, EP_BUILD_INFO_PAINT_SEG, EP_BUILD_INFO_PAINT_OFF
        WIN_KEY   WIN_K_F6, EP_BUILD_INFO_F6_SEG, EP_BUILD_INFO_F6_OFF
        WIN_KEY_END
        WIN_CLEAR
        WIN_END
        db      00h, 00h, 00h, 15h
        dw      EP_FAR_54D0E_OFF, EP_FAR_54D0E_SEG
        db      00h, 00h, 00h, 00h, 00h
        db      00h
d_c2_w_05972:
        db      1fh, 3ch

; ---- credits panel drawing 1 of 2, 01Fh bytes x 03Ch rows
; painted by MIXER, SHIFT+F5, F6: MPC2000XL case outline with the LCD, the pad
; grid and the wordmark.  the two bytes just above are the geometry.
; 1860 bytes from 0x5DC24 = the rows, each byte bit-mirrored, bit 0 leftmost.
; image stored twice, here and at 0x5F236.
; 0x5dc24-0x5dcbf, 155 bytes of 00h -- rows 0..4, blank but part of the drawing.
        if      FW_VERSION >= 110
; nothing written here; the MUTE_GROUPS painter lives in the code arena at
; 0x743F0.
FREE_5DC24:
        db      112 dup (0)
d_c1_w_059e4:
        db      16 dup (0)
d_c1_w_059f4:
        db      12 dup (0)
d_c1_w_05a00:
d_c2_w_05a00:
        db      4 dup (0)
d_c1_w_05a04:
        PAD_TO  DS_SEG*16+05A0Fh-SEGBASE, 000h

        else
FREE_5D624:
FREE_5DC24:
        db      122 dup (0)
d_c1_w_059e4:
        db      16 dup (0)
d_c1_w_059f4:
        db      12 dup (0)
d_c1_w_05a00:
d_c2_w_05a00:
        db      4 dup (0)
d_c1_w_05a04:
        PAD_TO  DS_SEG*16+05A09h-SEGBASE, 000h

        endif
TBL_CREDITS_ROWS_1:                     ; credits drawing 1 rows 5..53 of 60; 31 bytes per LCD row, bit 0 leftmost
        db      0f8h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 03h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [0] row
        db      08h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [1] row
        db      0c8h, 0ffh, 0ffh, 0ffh, 03h, 00h, 00h, 00h, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [2] row
        db      0c8h, 0ffh, 0ffh, 0ffh, 03h, 00h, 00h, 00h, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [3] row
        db      0c8h, 07h, 00h, 0f0h, 03h, 00h, 00h, 00h, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [4] row
        db      0c8h, 07h, 00h, 0f0h, 03h, 00h, 00h, 00h, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [5] row
        db      0c8h, 07h, 00h, 0f0h, 03h, 00h, 00h, 00h, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [6] row
        db      0c8h, 07h, 00h, 0f0h, 03h, 00h, 00h, 00h, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [7] row
        db      0c8h, 07h, 00h, 0f0h, 0e3h, 0ffh, 0ffh, 0ffh, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [8] row
        db      0c8h, 0ffh, 0ffh, 0ffh, 63h, 80h, 9fh, 0e7h, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [9] row
        db      0c8h, 0ffh, 0ffh, 0ffh, 0e3h, 0cch, 0fh, 0c3h, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [10] row
        db      0c8h, 0ffh, 0ffh, 0ffh, 0e3h, 0ffh, 0fh, 0c3h, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [11] row
        db      08h, 00h, 00h, 00h, 0e0h, 0ffh, 9fh, 0e7h, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [12] row
        db      08h, 0d8h, 0b6h, 0dh, 60h, 80h, 0ffh, 0ffh, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [13] row
        db      08h, 00h, 00h, 00h, 0e0h, 0cch, 0cch, 0cch, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [14] row
        db      08h, 00h, 00h, 00h, 0e0h, 0ffh, 0ffh, 0ffh, 02h, 3eh, 80h, 0cfh, 0ffh, 1fh, 0fch, 0ffh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [15] row
        db      08h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 02h, 42h, 40h, 48h, 00h, 20h, 06h, 00h, 0f1h, 0ffh, 07h, 0ffh, 3fh, 0f8h, 0ffh, 0c1h, 0ffh, 0fh, 22h, 80h, 48h, 02h, 00h ; [16] row
        db      08h, 00h, 0e0h, 0e0h, 0e0h, 0ffh, 0ffh, 0ffh, 02h, 42h, 40h, 48h, 00h, 40h, 02h, 00h, 0f2h, 0ffh, 8fh, 0ffh, 7fh, 0fch, 0ffh, 0e3h, 0ffh, 1fh, 44h, 40h, 44h, 02h, 00h ; [17] row
        db      0c8h, 0cch, 00h, 00h, 0e0h, 0ffh, 0ffh, 0ffh, 02h, 82h, 20h, 48h, 0feh, 47h, 0e2h, 3fh, 0f2h, 0ffh, 8fh, 0ffh, 7fh, 0fch, 0ffh, 0e3h, 0ffh, 1fh, 88h, 20h, 42h, 02h, 00h ; [18] row
        db      08h, 00h, 00h, 00h, 60h, 10h, 04h, 0c1h, 02h, 92h, 20h, 49h, 02h, 48h, 12h, 40h, 02h, 00h, 8eh, 03h, 70h, 1ch, 80h, 0e3h, 00h, 1ch, 10h, 11h, 41h, 02h, 00h ; [19] row
        db      0c8h, 0cch, 00h, 1fh, 60h, 10h, 04h, 0c1h, 02h, 32h, 91h, 49h, 02h, 48h, 12h, 00h, 00h, 00h, 8eh, 03h, 70h, 1ch, 80h, 0e3h, 00h, 1ch, 20h, 8ah, 40h, 02h, 00h ; [20] row
        db      08h, 00h, 80h, 3fh, 60h, 10h, 04h, 0c1h, 02h, 32h, 91h, 49h, 0feh, 47h, 12h, 00h, 00h, 00h, 8eh, 03h, 70h, 1ch, 80h, 0e3h, 00h, 1ch, 40h, 44h, 40h, 02h, 00h ; [21] row
        db      0c8h, 0cch, 0c0h, 7fh, 60h, 10h, 04h, 0c1h, 02h, 52h, 4ah, 49h, 00h, 40h, 12h, 00h, 0e0h, 0ffh, 8fh, 03h, 70h, 1ch, 80h, 0e3h, 00h, 1ch, 80h, 20h, 40h, 02h, 00h ; [22] row
        db      08h, 00h, 0c0h, 7fh, 60h, 10h, 04h, 0c1h, 02h, 52h, 4ah, 49h, 00h, 20h, 12h, 00h, 0f0h, 0ffh, 8fh, 03h, 70h, 1ch, 80h, 0e3h, 00h, 1ch, 00h, 11h, 40h, 02h, 00h ; [23] row
        db      0c8h, 0cch, 0c0h, 73h, 0e0h, 0ffh, 0ffh, 0ffh, 02h, 52h, 44h, 49h, 0feh, 1fh, 12h, 00h, 0f0h, 0ffh, 87h, 03h, 70h, 1ch, 80h, 0e3h, 00h, 1ch, 80h, 20h, 40h, 02h, 00h ; [24] row
        db      08h, 00h, 0c0h, 73h, 60h, 10h, 04h, 0c1h, 02h, 92h, 24h, 49h, 02h, 00h, 12h, 00h, 70h, 00h, 80h, 03h, 70h, 1ch, 80h, 0e3h, 00h, 1ch, 40h, 44h, 40h, 02h, 00h ; [25] row
        db      08h, 00h, 0c0h, 7fh, 60h, 10h, 04h, 0c1h, 02h, 92h, 20h, 49h, 02h, 00h, 12h, 40h, 72h, 00h, 80h, 03h, 70h, 1ch, 80h, 0e3h, 00h, 1ch, 20h, 8ah, 40h, 02h, 00h ; [26] row
        db      0e8h, 0fh, 80h, 3fh, 60h, 10h, 04h, 0c1h, 02h, 12h, 11h, 49h, 02h, 00h, 0e2h, 3fh, 72h, 00h, 80h, 03h, 70h, 1ch, 80h, 0e3h, 00h, 1ch, 10h, 11h, 41h, 0feh, 1fh ; [27] row
        db      28h, 08h, 00h, 1fh, 60h, 10h, 04h, 0c1h, 02h, 12h, 11h, 49h, 02h, 00h, 02h, 00h, 0f2h, 0ffh, 8fh, 0ffh, 7fh, 0fch, 0ffh, 0e3h, 0ffh, 1fh, 88h, 20h, 42h, 00h, 00h ; [28] row
        db      28h, 09h, 00h, 00h, 60h, 10h, 04h, 0c1h, 02h, 12h, 0eh, 49h, 02h, 00h, 06h, 00h, 0f1h, 0ffh, 8fh, 0ffh, 7fh, 0fch, 0ffh, 0e3h, 0ffh, 1fh, 44h, 40h, 44h, 00h, 00h ; [29] row
        db      28h, 08h, 00h, 00h, 0e0h, 0ffh, 0ffh, 0ffh, 02h, 12h, 00h, 49h, 02h, 00h, 0fch, 0ffh, 0f0h, 0ffh, 0fh, 0ffh, 3fh, 0f8h, 0ffh, 0c1h, 0ffh, 0fh, 22h, 80h, 0c8h, 0ffh, 1fh ; [30] row
        db      0a8h, 0bh, 87h, 3fh, 60h, 10h, 04h, 0c1h, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [31] row
        db      28h, 08h, 87h, 2ah, 60h, 10h, 04h, 0c1h, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [32] row
        db      28h, 09h, 80h, 2eh, 60h, 10h, 04h, 0c1h, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [33] row
        db      28h, 09h, 80h, 2ah, 60h, 10h, 04h, 0c1h, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [34] row
        db      28h, 0c9h, 9dh, 3fh, 60h, 10h, 04h, 0c1h, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [35] row
        db      0e8h, 0fh, 00h, 00h, 0e0h, 0ffh, 0ffh, 0ffh, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [36] row
        db      68h, 0ch, 00h, 00h, 60h, 10h, 04h, 0c1h, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [37] row
        db      0e8h, 0fh, 00h, 00h, 60h, 10h, 04h, 0c1h, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [38] row
        db      28h, 0c9h, 0ddh, 0ddh, 61h, 10h, 04h, 0c1h, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [39] row
        db      28h, 09h, 00h, 00h, 60h, 10h, 04h, 0c1h, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [40] row
        db      28h, 09h, 00h, 00h, 60h, 10h, 04h, 0c1h, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [41] row
        db      28h, 0c8h, 0ddh, 0ddh, 0e1h, 0ffh, 0ffh, 0ffh, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [42] row
        db      0e8h, 0cfh, 0ddh, 0ddh, 0e1h, 0ffh, 0ffh, 0ffh, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [43] row
        db      08h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [44] row
        db      0f8h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 03h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [45] row
        db      08h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [46] row
        db      70h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 03h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [47] row
        db      80h, 0ffh, 0ffh, 0ffh, 01h, 00h, 00h, 0fch, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; [48] row
        db      00h, 00h, 00h, 00h, 0feh, 0ffh, 0ffh
        db      03h

; 0x5e2b6-0x5e36a, 180 bytes of 00h -- blank tail of drawing 1 (row 54 on, from
; 0x5DC24), not free space.  nothing written here; the MUTE_GROUPS field array
        if      FW_VERSION >= 110
; lives at 0x5F236 (the unreferenced duplicate credits drawing further down
; this file).
FREE_5E2B6:
        db      178 dup (0)
d_c2_b_060b8:
        PAD_TO  DS_SEG*16+060BAh-SEGBASE, 000h
        else
FREE_5DCB6:
FREE_5E2B6:
        db      178 dup (0)
d_c2_b_060b8:
        PAD_TO  DS_SEG*16+060B4h-SEGBASE, 000h
        endif

; ---- credits, 25 records of 20 bytes, text XOR 7Fh
; the MIXER / SHIFT+F5 / F6 / OPEN WINDOW screen.  the 180 zero bytes ending here
; are drawing 1's blank tail rows, not slack -- nothing may go there.

d_c2_tbl_060ba:
        CREDIT  "Product planning"
        CREDIT  "\tYuji Kagei"
        CREDIT  ""
        CREDIT  "Cosmetic design"
        CREDIT  "\tTaichi Kase"
        CREDIT  ""
        CREDIT  "Electric design"
        CREDIT  "\tKazuya Tsuru"
        CREDIT  ""
        CREDIT  "Mechanical design"
        CREDIT  "\tHiroyuki Aoki"
        CREDIT  ""
        CREDIT  "Software design"
        CREDIT  "\tAkihiro Hayashi"
        CREDIT  "\tYoshihiro Ishikawa"
        CREDIT  ""
        CREDIT  "Sound Library"
        CREDIT  "\tMasayuki Hoshi"
        CREDIT  "\t& studio Mix 335"
        CREDIT  ""
        CREDIT  "Testing"
        CREDIT  "\tJunji Mizumura"
        CREDIT  "\tAkira Shigematsu"
        CREDIT  "\tTetsuo Yamada"
        CREDIT  ""
d_c2_b_062ae:
        db      00h, 00h
TBL_WINKEYS_DEV_CREDITS:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_OPEN, EP_BUILD_INFO_F6_SEG, EP_BUILD_INFO_F6_OFF
        WIN_KEY   33h, EP_SHOW_DEV_CREDITS_SCROLL_SEG, EP_SHOW_DEV_CREDITS_SCROLL_OFF
        WIN_KEY_END
TBL_WINKEYS_WAVE_MEM:
        WIN_CLEAR
        WIN_END
        db      00h, 00h, 00h
        WIN_KEY   WIN_K_F1, EP_WAVE_MEM_DETECT_SEG, EP_WAVE_MEM_DETECT_OFF
        WIN_KEY   WIN_K_F2, EP_WAVE_MEM_CHECK_SEG, EP_WAVE_MEM_CHECK_OFF
        WIN_KEY   WIN_K_F5, EP_WAVE_MEM_PADCHK_SEG, EP_WAVE_MEM_PADCHK_OFF
        WIN_KEY   WIN_K_F6, EP_WAVE_MEM_RETURN_SEG, EP_WAVE_MEM_RETURN_OFF
        WIN_KEY   WIN_K_PAINT, EP_WAVE_MEM_PAINT_SEG, EP_WAVE_MEM_PAINT_OFF
        WIN_KEY_END
        db      00h
        WIN_CLEAR
        db      1ah
        db      01h, 01h, 44h, 45h, 54h, 45h, 43h, 54h, 00h
        WIN_SOFTKEY 2, 1, "CHECK"
        WIN_SOFTKEY 5, 1, "PADCHK"
        WIN_SOFTKEY 6, 2, "RETURN"
        WIN_LABEL 03h, 02h, "Wave memory size:  Mwords"
        WIN_RULE  0ch, 02h, 0ah, 0f5h
        WIN_LABEL 03h, 0ch, "Wave memory check:"
        WIN_LABEL 6fh, 0ch, "test 1"
        WIN_LABEL 6fh, 15h, "test 2"
        WIN_LABEL 6fh, 1eh, "test 3"
        WIN_END
TBL_WINKEYS_SND_DEBUG:
        WIN_CLEAR
        WIN_END
        db      00h, 00h, 00h
        WIN_KEY   WIN_K_F1, EP_SND_DEBUG_CREATE_SEG, EP_SND_DEBUG_CREATE_OFF
        WIN_KEY   WIN_K_F2, EP_SND_DEBUG_ID_SORT_SEG, EP_SND_DEBUG_ID_SORT_OFF
        WIN_KEY   WIN_K_F3, EP_SND_DEBUG_RE_ID_SEG, EP_SND_DEBUG_RE_ID_OFF
        WIN_KEY   WIN_K_F4, EP_SND_DEBUG_VER_SEG, EP_SND_DEBUG_VER_OFF
        WIN_KEY   WIN_K_F5, EP_SND_DEBUG_MEMCHK_SEG, EP_SND_DEBUG_MEMCHK_OFF
        WIN_KEY   WIN_K_F6, EP_SND_DEBUG_RETURN_SEG, EP_SND_DEBUG_RETURN_OFF
        WIN_KEY   WIN_K_PAINT, EP_SND_DEBUG_PAINT_SEG, EP_SND_DEBUG_PAINT_OFF
        WIN_KEY   WIN_K_OPEN, EP_SND_DEBUG_OPEN_SEG, EP_SND_DEBUG_OPEN_OFF
        WIN_KEY_END
        WIN_CLEAR
        db      1ah
        db      01h, 01h, 43h, 52h, 45h, 41h, 54h, 45h, 00h
        WIN_SOFTKEY 2, 1, "IDsort"
        WIN_SOFTKEY 3, 1, "RE-ID"
        WIN_SOFTKEY 4, 2, "VER"
        WIN_SOFTKEY 5, 2, "MEMCHK"
        WIN_SOFTKEY 6, 2, "RETURN"
        WIN_RULE  0bh, 00h, 09h, 0f8h
        WIN_LABEL 01h, 0bh, "WPTR:"
        WIN_LABEL 01h, 14h, "SIZE:"
        WIN_LABEL 01h, 1dh, "LOOPX:"
        WIN_LABEL 01h, 26h, "LOOPY:"
        WIN_LABEL 55h, 0bh, "snds:"
        WIN_LABEL 55h, 14h, "free:"
        WIN_LABEL 5bh, 1dh, "max:"
        WIN_LABEL 55h, 26h, "base:"
        WIN_LABEL 0d3h, 01h, "ID:"
        WIN_LABEL 0c1h, 0bh, "THIS:"
        WIN_LABEL 0c1h, 14h, "PREV:"
        WIN_LABEL 0c1h, 1dh, "NEXT:"
        WIN_LABEL 0c1h, 26h, "TAIL:"
        WIN_END
d_c2_w_0644a:
        db      19h, 01h, 78h, 01h, 00h, 42h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_06458:
        dw      EP_FAR_553EE_OFF, EP_FAR_553EE_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_06470:
        dw      EP_FAR_55406_OFF, EP_FAR_55406_SEG
d_c2_b_06474:
        db      01h
d_c1_tbl_06475:
        db      00h
d_c0_b_06476:
        db      00h, 00h
d_c2_b_06478:
        db      20h, 04h
        db      10h, 02h
d_c2_w_0647c:
        db      00h
d_c2_b_0647d:
        db      00h
d_p_647e:
        db      00h, 00h
d_c2_fp_midi_in_block:
        db      00h, 00h
d_c2_w_06482:
        db      00h, 7ch
TBL_WINKEYS_SAMPLE_DUMP:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_PAINT, EP_SAMPLE_DUMP_PAINT_SEG, EP_SAMPLE_DUMP_PAINT_OFF
        WIN_KEY   WIN_K_F1, EP_SAMPLE_DUMP_SYNC_SEG, EP_SAMPLE_DUMP_SYNC_OFF
        WIN_KEY   WIN_K_F3, EP_SAMPLE_DUMP_MIDISW_SEG, EP_SAMPLE_DUMP_MIDISW_OFF
        WIN_KEY   WIN_K_F5, EP_SAMPLE_DUMP_REQUEST_SEG, EP_SAMPLE_DUMP_REQUEST_OFF
        WIN_KEY   WIN_K_F6, EP_SAMPLE_DUMP_SEND_SEG, EP_SAMPLE_DUMP_SEND_OFF
        WIN_KEY   33h, EP_SAMPLE_DUMP_KEY_33_SEG, EP_SAMPLE_DUMP_KEY_33_OFF
        WIN_KEY   WIN_K_PAD, EP_SOUND_PAD_PLAY_SEG, EP_SOUND_PAD_PLAY_OFF
        WIN_KEY   WIN_K_REFRESH, EP_SAMPLE_DUMP_REFRESH_SEG, EP_SAMPLE_DUMP_REFRESH_OFF
        WIN_KEY   WIN_K_OPEN, EP_SAMPLE_DUMP_OPEN_SEG, EP_SAMPLE_DUMP_OPEN_OFF
        WIN_KEY_END
        db      00h
TBL_WINKEYS_5E76C:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_PAINT, EP_SAMPLE_DUMP_PAINT_SEG, EP_SAMPLE_DUMP_PAINT_OFF
        WIN_KEY   WIN_K_F6, EP_SAMPLE_DUMP_CANCEL_SEG, EP_SAMPLE_DUMP_CANCEL_OFF
        WIN_KEY   33h, EP_SAMPLE_DUMP_KEY_33_SEG, EP_SAMPLE_DUMP_KEY_33_OFF
        WIN_KEY   WIN_K_REFRESH, EP_SAMPLE_DUMP_REFRESH_SEG, EP_SAMPLE_DUMP_REFRESH_OFF
        WIN_KEY_END
TBL_WINKEYS_5E78A:
        WIN_CLEAR
        WIN_END
        db      00h, 00h, 00h
        WIN_KEY   WIN_K_PAINT, EP_SAMPLE_DUMP_PAINT_SEG, EP_SAMPLE_DUMP_PAINT_OFF
        WIN_KEY   WIN_K_F6, EP_SAMPLE_DUMP_CANCEL_SEG, EP_SAMPLE_DUMP_CANCEL_OFF
        WIN_KEY   33h, EP_SAMPLE_DUMP_KEY_33_SEG, EP_SAMPLE_DUMP_KEY_33_OFF
        WIN_KEY   WIN_K_REFRESH, EP_SAMPLE_DUMP_REFRESH_SEG, EP_SAMPLE_DUMP_REFRESH_OFF
        WIN_KEY_END
        WIN_CLEAR
        WIN_LABEL 03h, 02h, "RECEIVE"
        WIN_LABEL 51h, 02h, "(In: )"
        WIN_RULE  0ch, 02h, 0ah, 79h
        WIN_LABEL 03h, 0fh, "Receive ready while"
        WIN_LABEL 03h, 18h, "this page is open."
        WIN_LABEL 03h, 25h, "Request No.:"
        WIN_LABEL 80h, 02h, "TRANSMIT"
        WIN_LABEL 0c8h, 02h, "(Out: )"
        WIN_RULE  0ch, 7fh, 0ah, 78h
        WIN_LABEL 80h, 0eh, "Snd:"
        WIN_LABEL 80h, 25h, "device ID:"
        WIN_END
        db      00h
        WIN_SOFTKEY 1, 2, "SYNC"
        WIN_SOFTKEY 2, 0, "DUMP"
        WIN_SOFTKEY 3, 2, "MIDIsw"
        WIN_SOFTKEY 5, 1, "REQUES"
        WIN_END
        db      00h
        WIN_SOFTKEY 6, 1, "CANCEL"
        WIN_END
        db      00h
d_c2_w_065b4:
        db      69h, 02h, 06h, 01h, 01h, 20h
        db      00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h
d_c0_tbl_065c2:
        dw      EP_SAMPLE_DUMP_FIELD0_THUNK_OFF, EP_SAMPLE_DUMP_FIELD0_THUNK_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_SAMPLE_DUMP_FIELD1_THUNK_OFF, EP_SAMPLE_DUMP_FIELD1_THUNK_SEG
        db      00h, 00h, 00h, 00h
        dw      EP_SAMPLE_DUMP_FIELD2_THUNK_OFF, EP_SAMPLE_DUMP_FIELD2_THUNK_SEG
        db      00h, 00h, 00h, 00h
d_c2_tbl_sdump_field_enter:
        db      00h, 00h
d_c2_w_065dc:
        db      00h, 00h
TBL_FIELDS_65B4:                        ; 3 x FIELD_SIZE; the part of the array this .asm emits itself
        db      4bh, 25h, 1eh, 05h, 02h, 00h, 00h, 00h, 00h, 00h, 0ffh, 3fh, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      EP_SAMPLE_DUMP_FIELD1_THUNK_OFF, EP_SAMPLE_DUMP_FIELD1_THUNK_SEG, EP_SAMPLE_DUMP_FIELD0_THUNK_OFF, EP_SAMPLE_DUMP_FIELD0_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_SAMPLE_DUMP_FIELD3_THUNK_OFF, EP_SAMPLE_DUMP_FIELD3_THUNK_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_06608:
        db      0e6h, 02h, 06h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h ; [2] x,y,class,digits  STORE  MIN  MAX
        dw      EP_SAMPLE_DUMP_FIELD2_THUNK_OFF, EP_SAMPLE_DUMP_FIELD2_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_SAMPLE_DUMP_FIELD3_THUNK_OFF, EP_SAMPLE_DUMP_FIELD3_THUNK_SEG
        dw      EP_SAMPLE_DUMP_FIELD0_THUNK_OFF, EP_SAMPLE_DUMP_FIELD0_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_06632:
        db      80h, 17h, 60h, 01h, 00h, 42h, 01h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_SAMPLE_DUMP_FIELD3_THUNK_OFF, EP_SAMPLE_DUMP_FIELD3_THUNK_SEG
        dw      EP_SAMPLE_DUMP_FIELD2_THUNK_OFF, EP_SAMPLE_DUMP_FIELD2_THUNK_SEG
        if      FW_VERSION >= 112
        dw      (C2_BASE+sample_dump_field4_thunk-C2_SEG*16), C2_SEG, EP_SAMPLE_DUMP_FIELD1_THUNK_OFF, EP_SAMPLE_DUMP_FIELD1_THUNK_SEG, EP_SAMPLE_DUMP_FIELD5_THUNK_OFF, C2_SEG, EP_L_55C10_OFF, EP_L_55C10_SEG
        dw      EP_L_55C24_OFF, EP_L_55C24_SEG
        else
        dw      (C2_BASE+sample_dump_field4_thunk-C2_SEG*16), C2_SEG, EP_SAMPLE_DUMP_FIELD1_THUNK_OFF, EP_SAMPLE_DUMP_FIELD1_THUNK_SEG
        dw      (C2_BASE+sample_dump_field5_thunk-C2_SEG*16), C2_SEG, EP_L_55C10_OFF, EP_L_55C10_SEG, EP_L_55C24_OFF, EP_L_55C24_SEG
        endif
TBL_FIELDS_665C:                        ; 2 x FIELD_SIZE
        db      0bch, 25h, 12h, 03h, 01h, 00h, 00h, 00h, 00h, 00h, 7fh, 00h, 00h, 00h ; [0] x,y,class,digits  STORE  MIN  MAX
        dw      EP_SAMPLE_DUMP_FIELD4_THUNK_OFF, EP_SAMPLE_DUMP_FIELD4_THUNK_SEG, EP_SAMPLE_DUMP_FIELD3_THUNK_OFF, EP_SAMPLE_DUMP_FIELD3_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_SAMPLE_DUMP_FIELD1_THUNK_OFF, EP_SAMPLE_DUMP_FIELD1_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c2_w_06686:
        db      0e6h, 17h, 06h, 01h, 01h, 40h, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        if      FW_VERSION >= 112
        dw      EP_SAMPLE_DUMP_FIELD5_THUNK_OFF, C2_SEG ; THUNK  PREV  NEXT
        dw      EP_SAMPLE_DUMP_FIELD2_THUNK_OFF, EP_SAMPLE_DUMP_FIELD2_THUNK_SEG
        dw      EP_SAMPLE_DUMP_FIELD4_THUNK_OFF, EP_SAMPLE_DUMP_FIELD4_THUNK_SEG
        dw      EP_SAMPLE_DUMP_FIELD3_THUNK_OFF, EP_SAMPLE_DUMP_FIELD3_THUNK_SEG ; +1Ah..+21h  NOTIFY  ENTER
        else
        dw      (C2_BASE+sample_dump_field5_thunk-C2_SEG*16), C2_SEG, EP_SAMPLE_DUMP_FIELD2_THUNK_OFF, EP_SAMPLE_DUMP_FIELD2_THUNK_SEG
        dw      (C2_BASE+sample_dump_field4_thunk-C2_SEG*16), C2_SEG, EP_SAMPLE_DUMP_FIELD3_THUNK_OFF, EP_SAMPLE_DUMP_FIELD3_THUNK_SEG
        endif
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        if      FW_VERSION >= 112
ts_preset_name_ptrs:                    ; far32 per preset name, flash 0x5E960
        endif
d_c2_w_066b0:
        dw      (CONSTS_BASE+str_ts_preset_fem_vox_a-C2_SEG*16)
d_c2_tbl_066b2:
        dw      C2_SEG; [0] 4E16h:87DCh
        dw      EP_STR_TS_PRESET_FEM_VOX_B_OFF, EP_STR_TS_PRESET_FEM_VOX_B_SEG ; [1] 4E16h:87ECh
        dw      EP_STR_TS_PRESET_FEM_VOX_C_OFF, EP_STR_TS_PRESET_FEM_VOX_C_SEG ; [2] 4E16h:87FCh
        dw      EP_STR_TS_PRESET_MALE_VOX_A_OFF, EP_STR_TS_PRESET_MALE_VOX_A_SEG ; [3] 4E16h:880Ch
        dw      EP_STR_TS_PRESET_MALE_VOX_B_OFF, EP_STR_TS_PRESET_MALE_VOX_B_SEG ; [4] 4E16h:881Ch
        dw      EP_STR_TS_PRESET_MALE_VOX_C_OFF, EP_STR_TS_PRESET_MALE_VOX_C_SEG ; [5] 4E16h:882Ch
        dw      EP_STR_TS_PRESET_LOW_MALE_VOX_A_OFF, EP_STR_TS_PRESET_LOW_MALE_VOX_A_SEG ; [6] 4E16h:883Ch
        dw      EP_STR_TS_PRESET_LOW_MALE_VOX_B_OFF, EP_STR_TS_PRESET_LOW_MALE_VOX_B_SEG ; [7] 4E16h:884Ch
        dw      EP_STR_TS_PRESET_LOW_MALE_VOX_C_OFF, EP_STR_TS_PRESET_LOW_MALE_VOX_C_SEG ; [8] 4E16h:885Ch
        dw      EP_STR_TS_PRESET_VOCAL_A_OFF, EP_STR_TS_PRESET_VOCAL_A_SEG ; [9] 4E16h:886Ch
        dw      EP_STR_TS_PRESET_VOCAL_B_OFF, EP_STR_TS_PRESET_VOCAL_B_SEG ; [10] 4E16h:887Ch
        dw      EP_STR_TS_PRESET_VOCAL_C_OFF, EP_STR_TS_PRESET_VOCAL_C_SEG ; [11] 4E16h:888Ch
        dw      EP_STR_TS_PRESET_HFREQ_RHYTHM_A_OFF, EP_STR_TS_PRESET_HFREQ_RHYTHM_A_SEG ; [12] 4E16h:889Ch
        if      FW_VERSION < 112
ts_preset_name_ptrs:
        endif
        dw      EP_STR_TS_PRESET_HFREQ_RHYTHM_B_OFF, EP_STR_TS_PRESET_HFREQ_RHYTHM_B_SEG ; [13] 4E16h:88ACh
        dw      EP_STR_TS_PRESET_HFREQ_RHYTHM_C_OFF, EP_STR_TS_PRESET_HFREQ_RHYTHM_C_SEG ; [14] 4E16h:88BCh
        dw      EP_STR_TS_PRESET_MFREQ_RHYTHM_A_OFF, EP_STR_TS_PRESET_MFREQ_RHYTHM_A_SEG ; [15] 4E16h:88CCh
        dw      EP_STR_TS_PRESET_MFREQ_RHYTHM_B_OFF, EP_STR_TS_PRESET_MFREQ_RHYTHM_B_SEG ; [16] 4E16h:88DCh
        dw      EP_STR_TS_PRESET_MFREQ_RHYTHM_C_OFF, EP_STR_TS_PRESET_MFREQ_RHYTHM_C_SEG ; [17] 4E16h:88ECh
        dw      EP_STR_TS_PRESET_LFREQ_RHYTHM_A_OFF, EP_STR_TS_PRESET_LFREQ_RHYTHM_A_SEG ; [18] 4E16h:88FCh
        dw      EP_STR_TS_PRESET_LFREQ_RHYTHM_B_OFF, EP_STR_TS_PRESET_LFREQ_RHYTHM_B_SEG ; [19] 4E16h:890Ch
        dw      EP_STR_TS_PRESET_LFREQ_RHYTHM_C_OFF, EP_STR_TS_PRESET_LFREQ_RHYTHM_C_SEG ; [20] 4E16h:891Ch
        dw      EP_STR_TS_PRESET_PERCUSSION_A_OFF, EP_STR_TS_PRESET_PERCUSSION_A_SEG ; [21] 4E16h:892Ch
        dw      EP_STR_TS_PRESET_PERCUSSION_B_OFF, EP_STR_TS_PRESET_PERCUSSION_B_SEG ; [22] 4E16h:893Ch
        dw      EP_STR_TS_PRESET_PERCUSSION_C_OFF, EP_STR_TS_PRESET_PERCUSSION_C_SEG ; [23] 4E16h:894Ch
        dw      EP_STR_TS_PRESET_LFREQ_PERC_A_OFF, EP_STR_TS_PRESET_LFREQ_PERC_A_SEG ; [24] 4E16h:895Ch
        dw      EP_STR_TS_PRESET_LFREQ_PERC_B_OFF, EP_STR_TS_PRESET_LFREQ_PERC_B_SEG ; [25] 4E16h:896Ch
        dw      EP_STR_TS_PRESET_LFREQ_PERC_C_OFF, EP_STR_TS_PRESET_LFREQ_PERC_C_SEG ; [26] 4E16h:897Ch
        dw      EP_STR_TS_PRESET_STACCATO_A_OFF, EP_STR_TS_PRESET_STACCATO_A_SEG ; [27] 4E16h:898Ch
        dw      EP_STR_TS_PRESET_STACCATO_B_OFF, EP_STR_TS_PRESET_STACCATO_B_SEG ; [28] 4E16h:899Ch
        dw      EP_STR_TS_PRESET_STACCATO_C_OFF, EP_STR_TS_PRESET_STACCATO_C_SEG ; [29] 4E16h:89ACh
        dw      EP_STR_TS_PRESET_LFREQ_SLOW_A_OFF, EP_STR_TS_PRESET_LFREQ_SLOW_A_SEG ; [30] 4E16h:89BCh
        dw      EP_STR_TS_PRESET_LFREQ_SLOW_B_OFF, EP_STR_TS_PRESET_LFREQ_SLOW_B_SEG ; [31] 4E16h:89CCh
        dw      EP_STR_TS_PRESET_LFREQ_SLOW_C_OFF, EP_STR_TS_PRESET_LFREQ_SLOW_C_SEG ; [32] 4E16h:89DCh
        dw      EP_STR_TS_PRESET_MUSIC_1_A_OFF, EP_STR_TS_PRESET_MUSIC_1_A_SEG ; [33] 4E16h:89ECh
        dw      EP_STR_TS_PRESET_MUSIC_1_B_OFF, EP_STR_TS_PRESET_MUSIC_1_B_SEG ; [34] 4E16h:89FCh
        dw      EP_STR_TS_PRESET_MUSIC_1_C_OFF, EP_STR_TS_PRESET_MUSIC_1_C_SEG ; [35] 4E16h:8A0Ch
        dw      EP_STR_TS_PRESET_MUSIC_2_A_OFF, EP_STR_TS_PRESET_MUSIC_2_A_SEG ; [36] 4E16h:8A1Ch
        dw      EP_STR_TS_PRESET_MUSIC_2_B_OFF, EP_STR_TS_PRESET_MUSIC_2_B_SEG ; [37] 4E16h:8A2Ch
        dw      EP_STR_TS_PRESET_MUSIC_2_C_OFF, EP_STR_TS_PRESET_MUSIC_2_C_SEG ; [38] 4E16h:8A3Ch
        dw      EP_STR_TS_PRESET_MUSIC_3_A_OFF, EP_STR_TS_PRESET_MUSIC_3_A_SEG ; [39] 4E16h:8A4Ch
        dw      EP_STR_TS_PRESET_MUSIC_3_B_OFF, EP_STR_TS_PRESET_MUSIC_3_B_SEG ; [40] 4E16h:8A5Ch
        dw      EP_STR_TS_PRESET_MUSIC_3_C_OFF, EP_STR_TS_PRESET_MUSIC_3_C_SEG ; [41] 4E16h:8A6Ch
        dw      EP_STR_TS_PRESET_SOFT_PERC_A_OFF, EP_STR_TS_PRESET_SOFT_PERC_A_SEG ; [42] 4E16h:8A7Ch
        dw      EP_STR_TS_PRESET_SOFT_PERC_B_OFF, EP_STR_TS_PRESET_SOFT_PERC_B_SEG ; [43] 4E16h:8A8Ch
        dw      EP_STR_TS_PRESET_SOFT_PERC_C_OFF, EP_STR_TS_PRESET_SOFT_PERC_C_SEG ; [44] 4E16h:8A9Ch
        dw      EP_STR_TS_PRESET_HFREQ_ORCH_A_OFF, EP_STR_TS_PRESET_HFREQ_ORCH_A_SEG ; [45] 4E16h:8AACh
        dw      EP_STR_TS_PRESET_HFREQ_ORCH_B_OFF, EP_STR_TS_PRESET_HFREQ_ORCH_B_SEG ; [46] 4E16h:8ABCh
        dw      EP_STR_TS_PRESET_HFREQ_ORCH_C_OFF, EP_STR_TS_PRESET_HFREQ_ORCH_C_SEG ; [47] 4E16h:8ACCh
        dw      EP_STR_TS_PRESET_LFREQ_ORCH_A_OFF, EP_STR_TS_PRESET_LFREQ_ORCH_A_SEG ; [48] 4E16h:8ADCh
        dw      EP_STR_TS_PRESET_LFREQ_ORCH_B_OFF, EP_STR_TS_PRESET_LFREQ_ORCH_B_SEG ; [49] 4E16h:8AECh
        dw      EP_STR_TS_PRESET_LFREQ_ORCH_C_OFF, EP_STR_TS_PRESET_LFREQ_ORCH_C_SEG ; [50] 4E16h:8AFCh
        dw      EP_STR_TS_PRESET_SLOW_ORCH_A_OFF, EP_STR_TS_PRESET_SLOW_ORCH_A_SEG ; [51] 4E16h:8B0Ch
        dw      EP_STR_TS_PRESET_SLOW_ORCH_B_OFF, EP_STR_TS_PRESET_SLOW_ORCH_B_SEG ; [52] 4E16h:8B1Ch
        dw      EP_FAR_5668C_OFF, EP_FAR_5668C_SEG ; [53] 4E16h:8B2Ch
ts_preset_params:                       ; per-preset parameter records, flash 0x5EA38
        db      00h, 02h
        db      00h, 00h, 78h, 05h, 58h, 02h, 00h, 02h, 00h, 00h, 08h, 00h, 00h, 04h, 00h, 02h
        db      00h, 00h, 78h, 05h, 58h, 02h, 00h, 02h, 00h, 00h, 04h, 00h, 00h, 04h, 00h, 02h
        db      00h, 00h, 78h, 05h, 58h, 02h, 00h, 02h, 00h, 00h, 01h, 00h, 00h, 02h, 00h, 02h
        db      00h, 00h, 6ch, 02h, 64h, 00h, 0c2h, 01h, 00h, 00h, 08h, 00h, 00h, 04h, 00h, 02h
        db      00h, 00h, 6ch, 02h, 64h, 00h, 0c2h, 01h, 00h, 00h, 04h, 00h, 00h, 04h, 00h, 02h
        db      00h, 00h, 6ch, 02h, 64h, 00h, 0c2h, 01h, 00h, 00h, 01h, 00h, 00h, 02h, 00h, 02h
        db      00h, 00h, 84h, 03h, 0c8h, 00h, 00h, 02h, 00h, 00h, 08h, 00h, 00h, 04h, 00h, 02h
        db      00h, 00h, 84h, 03h, 0c8h, 00h, 00h, 02h, 00h, 00h, 04h, 00h, 00h, 04h, 00h, 02h
        db      00h, 00h, 84h, 03h, 0c8h, 00h, 00h, 02h, 00h, 00h, 01h, 00h, 00h, 02h, 0f4h, 01h
        db      00h, 00h, 40h, 06h, 0f4h, 01h, 0f4h, 01h, 00h, 00h, 08h, 00h, 00h, 04h, 0f4h, 01h
        db      00h, 00h, 40h, 06h, 0f4h, 01h, 0f4h, 01h, 00h, 00h, 04h, 00h, 00h, 04h, 0f4h, 01h
        db      00h, 00h, 40h, 06h, 0f4h, 01h, 0f4h, 01h, 00h, 00h, 01h, 00h, 00h, 02h, 00h, 02h
        db      64h, 00h, 08h, 02h, 64h, 00h, 64h, 00h, 00h, 00h, 08h, 00h, 00h, 04h, 00h, 02h
        db      64h, 00h, 08h, 02h, 64h, 00h, 64h, 00h, 00h, 00h, 04h, 00h, 00h, 04h, 00h, 02h
        db      64h, 00h, 08h, 02h, 64h, 00h, 64h, 00h, 00h, 00h, 01h, 00h, 00h, 02h, 00h, 02h
        db      00h, 00h, 20h, 03h, 64h, 00h, 00h, 02h, 00h, 00h, 08h, 00h, 00h, 04h, 00h, 02h
        db      00h, 00h, 20h, 03h, 64h, 00h, 00h, 02h, 00h, 00h, 04h, 00h, 00h, 04h, 00h, 02h
        db      00h, 00h, 20h, 03h, 64h, 00h, 00h, 02h, 00h, 00h, 01h, 00h, 00h, 02h, 00h, 02h
        db      00h, 00h, 0e8h, 03h, 0c8h, 00h, 00h, 02h, 00h, 00h, 08h, 00h, 00h, 04h, 00h, 02h
        db      00h, 00h, 0e8h, 03h, 0c8h, 00h, 00h, 02h, 00h, 00h, 04h, 00h, 00h, 02h, 00h, 02h
        db      00h, 00h, 0e8h, 03h, 0c8h, 00h, 00h, 02h, 00h, 00h, 01h, 00h, 00h, 02h, 0f4h, 01h
        db      00h, 00h, 58h, 02h, 32h, 00h, 90h, 01h, 64h, 00h, 08h, 00h, 00h, 04h, 0f4h, 01h
        db      00h, 00h, 58h, 02h, 32h, 00h, 90h, 01h, 64h, 00h, 04h, 00h, 00h, 04h, 0f4h, 01h
        db      00h, 00h, 58h, 02h, 32h, 00h, 90h, 01h, 64h, 00h, 01h, 00h, 00h, 02h, 0f4h, 01h
        db      00h, 00h, 0dch, 02h, 64h, 00h, 0f4h, 01h, 00h, 00h, 08h, 00h, 00h, 04h, 0f4h, 01h
        db      00h, 00h, 0dch, 02h, 64h, 00h, 0f4h, 01h, 00h, 00h, 04h, 00h, 00h, 04h, 0f4h, 01h
        db      00h, 00h, 0dch, 02h, 64h, 00h, 0f4h, 01h, 00h, 00h, 01h, 00h, 00h, 02h, 0f4h, 01h
        db      00h, 00h, 09h, 03h, 0c8h, 00h, 0f4h, 01h, 00h, 00h, 08h, 00h, 00h, 04h, 0f4h, 01h
        db      00h, 00h, 09h, 03h, 0c8h, 00h, 0f4h, 01h, 00h, 00h, 04h, 00h, 00h, 04h, 0f4h, 01h
        db      00h, 00h, 09h, 03h, 0c8h, 00h, 0f4h, 01h, 00h, 00h, 01h, 00h, 00h, 02h, 00h, 02h
        db      00h, 00h, 0e8h, 03h, 2ch, 01h, 00h, 02h, 00h, 00h, 08h, 00h, 00h, 04h, 00h, 02h
        db      00h, 00h, 0e8h, 03h, 2ch, 01h, 00h, 02h, 00h, 00h, 04h, 00h, 00h, 04h, 00h, 02h
        db      00h, 00h, 0e8h, 03h, 2ch, 01h, 00h, 02h, 00h, 00h, 01h, 00h, 00h, 02h, 00h, 02h
        db      00h, 00h, 4ch, 04h, 90h, 01h, 00h, 02h, 00h, 00h, 08h, 00h, 00h, 04h, 00h, 02h
        db      00h, 00h, 4ch, 04h, 90h, 01h, 00h, 02h, 00h, 00h, 04h, 00h, 00h, 04h, 00h, 02h
        db      00h, 00h, 4ch, 04h, 90h, 01h, 00h, 02h, 00h, 00h, 01h, 00h, 00h, 02h, 0f4h, 01h
        db      00h, 00h, 0f2h, 05h, 0f4h, 01h, 0f4h, 01h, 00h, 00h, 08h, 00h, 00h, 04h, 0f4h, 01h
        db      00h, 00h, 0f2h, 05h, 0f4h, 01h, 0f4h, 01h, 00h, 00h, 04h, 00h, 00h, 04h, 0f4h, 01h
        db      00h, 00h, 0f2h, 05h, 0f4h, 01h, 0f4h, 01h, 00h, 00h, 01h, 00h, 00h, 02h, 0f4h, 01h
        db      00h, 00h, 84h, 03h, 0c8h, 00h, 0f4h, 01h, 00h, 00h, 08h, 00h, 00h, 04h, 0f4h, 01h
        db      00h, 00h, 84h, 03h, 0c8h, 00h, 0f4h, 01h, 00h, 00h, 04h, 00h, 00h, 04h, 0f4h, 01h
        db      00h, 00h, 84h, 03h, 0c8h, 00h, 0f4h, 01h, 00h, 00h, 01h, 00h, 00h, 02h, 00h, 02h
        db      00h, 00h, 20h, 03h, 0c8h, 00h, 64h, 00h, 00h, 00h, 08h, 00h, 00h, 04h, 00h, 02h
        db      00h, 00h, 20h, 03h, 0c8h, 00h, 64h, 00h, 00h, 00h, 04h, 00h, 00h, 04h, 00h, 02h
        db      00h, 00h, 20h, 03h, 0c8h, 00h, 64h, 00h, 00h, 00h, 01h, 00h, 00h, 02h, 00h, 02h
        db      00h, 00h, 0dch, 05h, 58h, 02h, 0f4h, 01h, 00h, 00h, 08h, 00h, 00h, 04h, 00h, 02h
        db      00h, 00h, 0dch, 05h, 58h, 02h, 0f4h, 01h, 00h, 00h, 04h, 00h, 00h, 04h, 00h, 02h
        db      00h, 00h, 0dch, 05h, 58h, 02h, 0f4h, 01h, 00h, 00h, 01h, 00h, 00h, 02h, 00h, 02h
        db      00h, 00h, 0b5h, 04h, 2ch, 01h, 90h, 01h, 00h, 00h, 08h, 00h, 00h, 04h, 00h, 02h
        db      00h, 00h, 0b5h, 04h, 2ch, 01h, 90h, 01h, 00h, 00h, 04h, 00h, 00h, 04h, 00h, 02h
        db      00h, 00h, 0b5h, 04h, 2ch, 01h, 90h, 01h, 00h, 00h, 01h, 00h, 00h, 02h, 0e8h, 03h
        db      00h, 00h, 0b8h, 0bh, 0e8h, 03h, 0f4h, 01h, 00h, 00h, 08h, 00h, 00h, 04h, 0e8h, 03h
        db      00h, 00h, 0b8h, 0bh, 0e8h, 03h, 0f4h, 01h, 00h, 00h, 04h, 00h, 00h, 04h, 0e8h, 03h
        db      00h, 00h, 0b8h, 0bh, 0e8h, 03h, 0f4h, 01h, 00h, 00h, 01h, 00h, 00h, 02h
d_k0_w_06ae8:
        db      01h, 00h
        db      00h, 00h, 00h, 05h
        dw      EP_L_5706A_OFF, EP_L_5706A_SEG
        db      06h
        dw      EP_L_57078_OFF, EP_L_57078_SEG
        db      32h
        dw      EP_L_57124_OFF, EP_L_57124_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h
TBL_FIELDS_6B02:                        ; 3 x FIELD_SIZE, DS:6B02h = BPM_MATCH_FIELDS
        db      0a9h, 11h, 0ch, 02h, 01h, 00h, 01h, 00h, 00h, 00h, 20h, 00h, 00h, 00h ; [0] x,y,class,digits  STORE  MIN  MAX
d_k0_w_06b10:
        dw      EP_BPM_MATCH_FIELD0_THUNK_OFF, EP_BPM_MATCH_FIELD0_THUNK_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h
        dw      EP_BPM_MATCH_FIELD1_THUNK_OFF, EP_BPM_MATCH_FIELD1_THUNK_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
        dw      EP_L_57260_OFF, EP_L_57260_SEG
        db      00h, 00h, 00h, 00h
d_k0_w_06b2c:
        db      0a9h, 1bh, 1eh, 04h, 12h, 00h, 01h, 00h, 00h, 00h, 0fh, 27h, 00h, 00h ; [1] x,y,class,digits  STORE  MIN  MAX
        dw      (CONSTS_BASE+BPM_MATCH_FIELD1_THUNK-C2_SEG*16), C2_SEG, (CONSTS_BASE+BPM_MATCH_FIELD0_THUNK-C2_SEG*16), C2_SEG, (CONSTS_BASE+BPM_MATCH_FIELD2_THUNK-C2_SEG*16), C2_SEG ; THUNK  PREV  NEXT
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; +1Ah..+21h  NOTIFY  ENTER
d_k0_w_06b56:
        db      0a9h, 25h, 1eh, 04h
        db      12h, 00h, 01h, 00h, 00h, 00h, 0fh, 27h, 00h, 00h
        dw      EP_BPM_MATCH_FIELD2_THUNK_OFF, EP_BPM_MATCH_FIELD2_THUNK_SEG
        dw      EP_BPM_MATCH_FIELD1_THUNK_OFF, EP_BPM_MATCH_FIELD1_THUNK_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h
d_k0_w_06b80:
        db      00h, 00h
d_k0_w_06b82:
        db      00h, 00h
d_k0_w_06b84:
        db      0beh, 2ah
d_k0_w_06b86:
        db      24h, 03h, 7ch, 0d9h
        db      47h, 06h, 49h, 90h, 6ah, 09h, 5dh, 0d3h, 8bh, 0ch, 2bh, 27h, 0abh, 0fh, 6eh, 10h
        db      0c8h, 12h, 44h, 14h, 0e2h, 15h, 3ch, 0b8h, 0f8h, 18h, 6ah, 82h, 0bh, 1ch, 7ah, 0f9h
        db      19h, 1fh, 0c5h, 0a4h, 23h, 22h, 5dh, 0ch, 28h, 25h, 27h, 0b9h, 26h, 28h, 0ebh, 34h ; ....#"].(%'.&(.4
        db      1fh, 2bh, 61h, 0ah, 11h, 2eh, 4ch, 0c5h, 0fbh, 30h, 86h, 0f2h, 0deh, 33h, 13h, 20h
        db      0bah, 36h, 31h, 0ddh, 8ch, 39h, 6fh, 0bah, 56h, 3ch, 0b7h, 49h, 17h, 3fh, 64h, 1eh ; .61..9o.V<.I.?d.
        db      0ceh, 41h, 4fh, 0cdh, 7ah, 44h, 0e6h, 0ech, 1ch, 47h, 32h, 15h, 0b4h, 49h, 0f2h, 0dfh
        db      3fh, 4ch, 0a3h, 0e8h, 0bfh, 4eh, 93h, 0cch, 33h, 51h, 0eeh, 2ah, 9bh, 53h, 0d1h, 0a4h
        db      0f5h, 55h, 53h, 0ddh, 42h, 58h, 99h, 79h, 82h, 5ah, 0dfh, 20h, 0b4h, 5ch, 88h, 7ch ; .US.BX.y.Z. ...|
        db      0d7h, 5eh, 2fh, 38h, 0ech, 60h, 0abh, 01h, 0f2h, 62h, 25h, 89h, 0e8h, 64h, 1fh, 81h
        db      0cfh, 66h, 80h, 9eh, 0a6h, 68h, 0a3h, 98h
        db      "mj_)$l"
        db      13h, 0dh
        db      0cah, 6dh, 0b0h, 02h, 5fh, 6fh, 0c5h, 0cbh, 0e2h, 70h, 83h, 2ch, 55h, 72h, 0d0h, 0ebh
        db      0b5h, 73h, 44h, 0d3h, 04h, 75h, 3bh, 0afh, 41h, 76h, 0dah, 4eh, 6ch, 77h, 12h, 84h ; .sD..u;.Av.Nlw..
        db      84h, 78h, 0b0h, 23h, 8ah, 79h, 5ah, 05h, 7dh, 7ah, 9ch, 03h, 5dh, 7bh, 0edh, 0fbh ; .x.#.yZ.}z..]{..
        db      29h, 7ch, 0b0h, 0ceh, 0e3h, 7ch, 3eh, 5fh, 8ah, 7dh, 0e8h, 93h, 1dh, 7eh, 0fbh, 55h ; )|...|>_.}...~.U
        db      9dh, 7eh, 0c2h, 91h, 09h, 7fh, 8eh, 36h, 62h, 7fh, 0b3h, 36h, 0a7h, 7fh, 8ch, 87h
        db      0d8h, 7fh, 81h, 21h, 0f6h, 7fh, 0ffh, 0ffh, 0ffh, 7fh, 81h, 21h, 0f6h, 7fh, 8ch, 87h
        db      0d8h, 7fh, 0b3h, 36h, 0a7h, 7fh, 8eh, 36h, 62h, 7fh, 0c2h, 91h, 09h, 7fh, 0fbh, 55h
        db      9dh, 7eh, 0e8h, 93h, 1dh, 7eh, 3eh, 5fh, 8ah, 7dh, 0b0h, 0ceh, 0e3h, 7ch, 0edh, 0fbh
        db      29h, 7ch, 9ch, 03h, 5dh, 7bh, 5ah, 05h, 7dh, 7ah, 0b0h, 23h, 8ah, 79h, 12h, 84h
        db      84h, 78h, 0dah
        db      "Nlw;"
        db      0afh, 41h, 76h, 44h, 0d3h, 04h, 75h, 0d0h, 0ebh
        db      0b5h, 73h, 83h, 2ch, 55h, 72h, 0c5h, 0cbh, 0e2h, 70h, 0b0h, 02h, 5fh, 6fh, 13h, 0dh
        db      0cah
        db      "m_)$l"
        db      0a3h, 98h, 6dh, 6ah, 80h, 9eh, 0a6h, 68h, 1fh, 81h, 0cfh, 66h, 25h, 89h, 0e8h, 64h
        db      0abh, 01h, 0f2h, 62h, 2fh, 38h, 0ech, 60h, 88h, 7ch, 0d7h, 5eh, 0dfh, 20h, 0b4h, 5ch
        db      99h, 79h, 82h, 5ah, 53h, 0ddh, 42h, 58h, 0d1h, 0a4h
        db      0f5h, 55h, 0eeh, 2ah, 9bh, 53h, 93h, 0cch, 33h, 51h, 0a3h, 0e8h, 0bfh, 4eh, 0f2h, 0dfh
        db      3fh, 4ch, 32h, 15h, 0b4h, 49h, 0e6h, 0ech, 1ch, 47h, 4fh, 0cdh, 7ah, 44h, 64h, 1eh ; ?L2..I...GO.zDd.
        db      0ceh, 41h, 0b7h, 49h, 17h, 3fh, 6fh, 0bah, 56h, 3ch, 31h, 0ddh, 8ch, 39h, 13h, 20h ; .A.I.?o.V<1..9. 
        db      0bah, 36h, 86h, 0f2h, 0deh, 33h, 4ch, 0c5h, 0fbh, 30h, 61h, 0ah, 11h, 2eh, 0ebh, 34h
        db      1fh, 2bh, 27h, 0b9h, 26h, 28h, 5dh, 0ch, 28h, 25h, 0c5h, 0a4h, 23h, 22h, 7ah, 0f9h ; .+'.&(].(%..#"z.
        db      19h, 1fh, 6ah, 82h, 0bh, 1ch, 3ch, 0b8h, 0f8h, 18h, 44h, 14h, 0e2h, 15h, 6eh, 10h
        db      0c8h, 12h, 2bh, 27h, 0abh, 0fh, 5dh, 0d3h, 8bh, 0ch, 49h, 90h, 6ah, 09h, 7ch, 0d9h
        db      47h, 06h, 0beh, 2ah, 24h, 03h, 00h, 00h, 00h, 00h, 42h, 0d5h, 0dbh, 0fch, 84h, 26h
        db      0b8h, 0f9h, 0b7h, 6fh, 95h, 0f6h, 0a3h, 2ch, 74h, 0f3h, 0d5h, 0d8h, 54h, 0f0h, 92h, 0efh
        db      37h, 0edh, 0bch, 0ebh, 1dh, 0eah, 0c4h, 47h, 07h, 0e7h, 96h, 7dh, 0f4h, 0e3h, 86h, 06h
        db      0e6h, 0e0h, 3bh, 5bh, 0dch, 0ddh, 0a3h, 0f3h, 0d7h, 0dah, 0d9h, 46h, 0d9h, 0d7h, 15h, 0cbh
        db      0e0h, 0d4h, 9fh, 0f5h, 0eeh, 0d1h, 0b4h, 3ah, 04h, 0cfh, 7ah, 0dh, 21h, 0cch, 0edh, 0dfh
        db      45h, 0c9h, 0cfh, 22h, 73h, 0c6h, 91h, 45h, 0a9h, 0c3h, 49h, 0b6h, 0e8h, 0c0h, 9ch, 0e1h
        db      31h, 0beh, 0b1h, 32h, 85h, 0bbh, 1ah, 13h, 0e3h, 0b8h, 0ceh, 0eah, 4bh, 0b6h, 0eh, 20h
        db      0c0h, 0b3h, 5dh, 17h, 40h, 0b1h, 6dh, 33h, 0cch, 0aeh, 12h, 0d5h, 64h, 0ach, 2fh, 5bh
        db      0ah, 0aah, 0adh, 22h, 0bdh, 0a7h, 67h, 86h, 7dh, 0a5h, 21h, 0dfh, 4bh, 0a3h, 78h, 83h
        db      28h, 0a1h, 0d1h, 0c7h, 13h, 9fh, 55h, 0feh, 0dh, 9dh, 0dbh, 76h, 17h, 9bh, 0e1h, 7eh
        db      30h, 99h, 80h, 61h, 59h, 97h, 5dh, 67h, 92h, 95h, 0a1h, 0d6h, 0dbh, 93h, 0edh, 0f2h
        db      35h, 92h, 50h, 0fdh, 0a0h, 90h, 3bh, 34h, 1dh, 8fh, 7dh, 0d3h, 0aah, 8dh, 30h, 14h
        db      4ah, 8ch, 0bch, 2ch, 0fbh, 8ah, 0c5h, 50h, 0beh, 89h, 26h, 0b1h, 93h, 88h, 0eeh, 7bh
        db      7bh, 87h, 50h, 0dch, 75h, 86h, 0a6h, 0fah, 82h, 85h, 64h, 0fch, 0a2h, 84h, 13h, 04h
        db      0d6h, 83h, 50h, 31h, 1ch, 83h, 0c2h, 0a0h, 75h, 82h, 18h, 6ch, 0e2h, 81h, 05h, 0aah
        db      62h, 81h, 3eh, 6eh, 0f6h, 80h, 72h, 0c9h, 9dh, 80h, 4dh, 0c9h, 58h, 80h, 74h, 78h ; b.>n..r...M.X.tx
        db      27h, 80h, 7fh, 0deh, 09h, 80h, 01h, 00h, 00h, 80h, 7fh, 0deh, 09h, 80h, 74h, 78h
        db      27h, 80h, 4dh, 0c9h, 58h, 80h, 72h, 0c9h, 9dh, 80h, 3eh, 6eh, 0f6h, 80h, 05h, 0aah
        db      62h, 81h, 18h, 6ch, 0e2h, 81h, 0c2h, 0a0h, 75h, 82h, 50h, 31h, 1ch, 83h, 13h, 04h
        db      0d6h, 83h, 64h, 0fch, 0a2h, 84h, 0a6h, 0fah, 82h, 85h, 50h, 0dch, 75h, 86h, 0eeh, 7bh
        db      7bh, 87h, 26h, 0b1h, 93h, 88h, 0c5h, 50h, 0beh, 89h, 0bch, 2ch, 0fbh, 8ah, 30h, 14h
        db      4ah, 8ch, 7dh, 0d3h, 0aah, 8dh, 3bh, 34h, 1dh, 8fh, 50h, 0fdh, 0a0h, 90h, 0edh, 0f2h
        db      35h, 92h, 0a1h, 0d6h, 0dbh, 93h, 5dh, 67h, 92h, 95h, 80h, 61h, 59h, 97h, 0e1h, 7eh
        db      30h, 99h, 0dbh, 76h, 17h, 9bh, 55h, 0feh, 0dh, 9dh, 0d1h, 0c7h, 13h, 9fh, 78h, 83h
        db      28h, 0a1h, 21h, 0dfh, 4bh, 0a3h, 67h, 86h, 7dh, 0a5h, 0adh, 22h, 0bdh, 0a7h, 2fh, 5bh ; (.!.K.g.}.."../[
        db      0ah, 0aah, 12h, 0d5h, 64h, 0ach, 6dh, 33h, 0cch, 0aeh, 5dh, 17h, 40h, 0b1h, 0eh, 20h
        db      0c0h, 0b3h, 0ceh, 0eah, 4bh, 0b6h, 1ah, 13h, 0e3h, 0b8h, 0b1h, 32h, 85h, 0bbh, 9ch, 0e1h
        db      31h, 0beh, 49h, 0b6h, 0e8h, 0c0h, 91h, 45h, 0a9h, 0c3h, 0cfh, 22h, 73h, 0c6h, 0edh, 0dfh
        db      45h, 0c9h, 7ah, 0dh, 21h, 0cch, 0b4h, 3ah, 04h, 0cfh, 9fh, 0f5h, 0eeh, 0d1h, 15h, 0cbh
        db      0e0h, 0d4h, 0d9h, 46h, 0d9h, 0d7h, 0a3h, 0f3h, 0d7h, 0dah, 3bh, 5bh, 0dch, 0ddh, 86h, 06h
        db      0e6h, 0e0h, 96h, 7dh, 0f4h, 0e3h, 0c4h, 47h, 07h, 0e7h, 0bch, 0ebh, 1dh, 0eah, 92h, 0efh
        db      37h, 0edh, 0d5h, 0d8h, 54h, 0f0h, 0a3h, 2ch, 74h, 0f3h, 0b7h, 6fh, 95h, 0f6h, 84h, 26h
        db      0b8h, 0f9h, 42h, 0d5h, 0dbh, 0fch, 00h, 00h, 00h, 00h, 1fh, 3ch

; ---- credits panel drawing 2 of 2, 01Fh bytes x 03Ch rows
; painted by MIXER, SHIFT+F5, F6: MPC2000XL case outline with the LCD, the pad
; grid and the wordmark.  the two bytes just above are the geometry.
; 1860 bytes from 0x5F236 = the rows, each byte bit-mirrored, bit 0 leftmost.
; image stored twice, here and at 0x5DC24.  nothing reaches this copy by name
; or by a computed pointer in any version, so MUTE_GROUPS' field array and
; COPY_NOTE_PARAMS' window descriptor sit here: DS-reachable (DS=582Bh), clear
; of the OS's BSS fill and of the program-record array (0x65AE0-0x741B0) that
; real programs overwrite.
FREE_5F236:
        if      FW_VERSION >= 112
        include "../feat/ds_slot.inc"
        else
        include "../common/feat/ds_slot.inc"
        endif

d_c2_b_076cb:
        db      20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 28h, 28h, 28h, 28h, 28h
        db      "                  "
        db      48h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h
        db      84h, 84h, 84h, 84h, 84h, 84h, 84h, 84h, 84h, 84h, 10h, 10h, 10h, 10h, 10h, 10h
        db      10h, 81h, 81h, 81h, 81h, 81h, 81h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h
        db      01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 10h, 10h, 10h, 10h, 10h
        db      10h, 82h, 82h, 82h, 82h, 82h, 82h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h
        db      02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 10h, 10h, 10h, 10h, 20h
        if      FW_VERSION >= 110

; 0x5f9fb-0x5fa84, 137 bytes of 00h: BSS
FREE_5F9FB:
        db      129 dup (0)
d_c0_w_077cc:
        db      2 dup (0)
d_c0_w_077ce:
        db      2 dup (0)
d_c0_w_077d0:
        db      2 dup (0)
d_c0_w_077d2:
        PAD_TO  DS_SEG*16+077D4h-SEGBASE, 000h
        else
FREE_5F3FB:
FREE_5F9FB:
        db      129 dup (0)
d_c0_w_077cc:
        db      2 dup (0)
d_c0_w_077ce:
        db      2 dup (0)
d_c0_w_077d0:
        db      2 dup (0)
d_c0_w_077d2:
        PAD_TO  DS_SEG*16+077CEh-SEGBASE, 000h
        endif

        db      02h, 0bh, 1fh, 00h, 20h, 80h, 40h, 40h, 80h, 20h, 80h, 20h, 84h, 20h, 84h, 20h
        db      88h, 20h, 48h, 40h, 30h, 80h, 1fh, 00h, 02h, 0bh, 1fh, 00h, 20h, 80h, 40h, 40h
        db      80h, 20h, 80h, 20h, 84h, 20h, 88h, 20h, 90h, 20h, 60h, 40h, 20h, 80h, 1fh, 00h ; . . . . . `@ ...
        db      02h, 0bh, 1fh, 00h, 20h, 80h, 40h, 40h, 80h, 20h, 80h, 20h, 8ch, 20h, 0b0h, 20h
        db      0c0h, 20h, 40h, 40h, 20h, 80h, 1fh, 00h, 02h, 0bh, 1fh, 00h, 20h, 80h, 40h, 40h
        db      80h, 20h, 80h, 20h, 0fch, 20h, 80h, 20h, 80h, 20h, 40h, 40h, 20h, 80h, 1fh, 00h ; . . . . . @@ ...
        db      02h, 0bh, 1fh, 00h, 20h, 80h, 40h, 40h, 0c0h, 20h, 0b0h, 20h, 8ch, 20h, 80h, 20h
        db      80h, 20h, 40h, 40h, 20h, 80h, 1fh, 00h, 02h, 0bh, 1fh, 00h, 20h, 80h, 60h, 40h
        db      90h, 20h, 88h, 20h, 84h, 20h, 80h, 20h, 80h, 20h, 40h, 40h, 20h, 80h, 1fh, 00h ; . . . . . @@ ...
        db      02h, 0bh, 1fh, 00h, 30h, 80h, 48h, 40h, 88h, 20h, 84h, 20h, 84h, 20h, 80h, 20h
        db      80h, 20h, 40h, 40h, 20h, 80h, 1fh, 00h, 02h, 0bh, 1fh, 00h, 24h, 80h, 44h, 40h
        db      84h, 20h, 84h, 20h, 84h, 20h, 80h, 20h, 80h, 20h, 40h, 40h, 20h, 80h, 1fh, 00h ; . . . . . @@ ...
        db      02h, 0bh, 1fh, 00h, 21h, 80h, 42h, 40h, 82h, 20h, 84h, 20h, 84h, 20h, 80h, 20h
        db      80h, 20h, 40h, 40h, 20h, 80h, 1fh, 00h, 02h, 0bh, 1fh, 00h, 20h, 80h, 40h, 0c0h
        db      81h, 20h, 82h, 20h, 84h, 20h, 80h, 20h, 80h, 20h, 40h, 40h, 20h, 80h, 1fh, 00h ; . . . . . @@ ...
        db      02h, 0bh, 1fh, 00h, 20h, 80h, 40h, 40h, 80h, 60h, 81h, 0a0h, 86h, 20h, 80h, 20h
        db      80h, 20h, 40h, 40h, 20h, 80h, 1fh, 00h, 02h, 0bh, 1fh, 00h, 20h, 80h, 40h, 40h
        db      80h, 20h, 80h, 20h, 87h, 0e0h, 80h, 20h, 80h, 20h, 40h, 40h, 20h, 80h, 1fh, 00h
        db      02h, 0bh, 1fh, 00h, 20h, 80h, 40h, 40h, 80h, 20h, 80h, 20h, 86h, 20h, 81h, 0a0h
        db      80h, 60h, 40h, 40h, 20h, 80h, 1fh, 00h, 02h, 0bh, 1fh, 00h, 20h, 80h, 40h, 40h
        db      80h, 20h, 80h, 20h, 84h, 20h, 82h, 20h, 81h, 20h, 40h, 0c0h, 20h, 80h, 1fh, 00h
        db      02h, 0bh, 1fh, 00h, 20h, 80h, 40h, 40h, 80h, 20h, 80h, 20h, 84h, 20h, 84h, 20h
        db      82h
        db      " B@!"
        db      80h, 1fh, 00h
far_5F5EC:
        db      01h, 09h, 00h, 00h, 04h, 0ch, 04h, 04h
        db      04h, 04h, 0eh
far_5F5F7:
        db      01h, 09h, 00h, 00h, 0eh, 11h, 01h, 02h, 04h, 08h, 1fh
far_5F602:
        db      01h, 09h
        db      00h, 00h, 1fh, 02h, 04h, 02h, 01h, 11h, 0eh
far_5F60D:
        db      01h, 09h, 00h, 00h, 02h, 06h, 0ah
        db      12h, 1fh, 02h, 02h
far_5F618:
        db      01h, 09h, 00h, 00h, 1fh, 10h, 1eh, 01h, 01h, 11h, 0eh
far_5F623:
        db      01h
        db      09h, 00h, 00h, 06h, 08h, 10h, 1eh, 11h, 11h, 0eh
far_5F62E:
        db      01h, 09h, 00h, 00h, 1fh, 01h
        db      02h, 04h, 08h, 08h, 08h
far_5FC39:
        db      01h, 09h, 00h, 00h, 0eh, 11h, 11h, 0eh, 11h, 11h, 0eh
L_5FC44:
far_5F644:
        db      01h, 09h, 00h, 00h, 00h, 00h, 00h, 1fh, 00h, 00h, 00h, 01h, 09h, 00h, 00h, 1fh
        db      10h, 10h, 1eh, 10h, 10h, 1fh
far_5FC5A:
        db      02h, 0bh, 20h, 00h, 60h, 00h, 20h, 00h, 20h, 00h
        db      20h, 0e0h, 21h, 10h, 70h, 10h, 00h, 20h, 00h, 40h, 00h, 80h, 01h, 0f0h
far_5FC72:
        db      02h, 0bh
        db      0f8h, 00h, 10h, 00h, 20h, 00h, 10h, 00h, 08h, 20h, 88h, 60h, 70h, 0a0h, 01h, 20h
        db      01h, 0f0h, 00h, 20h, 00h, 20h
far_5FC8A:
        db      02h, 0bh, 0f8h, 00h, 80h, 00h, 0f0h, 00h, 08h, 00h
        db      08h, 60h, 88h, 80h, 71h, 00h, 01h, 0e0h, 01h, 10h, 01h, 10h, 00h, 0e0h
far_5FCA2:
        db      02h, 0bh
        db      0f8h, 00h, 08h, 00h, 10h, 00h, 20h, 00h, 40h, 0e0h, 41h, 10h, 41h, 10h, 00h, 0e0h
        db      01h, 10h, 01h, 10h, 00h, 0e0h
d_c2_w_07a0a:
        db      01h, 03h, 0f8h, 70h, 20h, 01h, 03h, 20h, 70h, 0f8h
d_c0_w_07a14:
        db      01h, 07h, 80h, 0c0h, 0e0h, 0f0h, 0e0h, 0c0h, 80h
d_c2_w_07a1d:
        db      03h, 05h, 00h, 0c6h, 00h, 01h, 29h
        db      00h, 0fah, 10h, 80h, 01h, 29h, 00h, 00h, 0c6h, 00h
d_c2_w_07a2e:
        db      0ah, 24h, 00h, 00h, 07h, 0f0h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 1ch, 1ch, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 30h, 06h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 40h, 01h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 0c0h, 01h, 80h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      80h, 00h, 80h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 80h, 00h, 0c0h, 00h, 00h, 00h
        db      00h, 00h, 00h, 01h, 00h, 00h, 40h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 00h, 01h
        db      0f0h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 00h, 3fh, 0fh, 0fch, 00h, 00h, 00h, 00h
        db      00h, 01h, 00h, 20h, 00h, 04h, 00h, 03h, 60h, 00h, 00h, 01h, 00h, 20h, 00h, 04h
        db      00h, 04h, 90h, 00h, 00h, 01h, 80h, 20h, 00h, 02h, 00h, 00h, 00h, 00h, 00h, 00h
        db      80h, 60h, 00h, 02h, 00h, 0d8h, 00h, 00h, 00h, 00h, 0c0h, 40h, 00h, 03h, 01h, 24h
        db      00h, 00h, 00h, 00h, 40h, 0c0h, 00h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 30h, 80h
        db      00h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 1dh, 80h, 00h, 00h, 80h, 00h, 00h, 00h
        db      00h, 00h, 07h, 00h, 08h, 00h, 80h, 00h, 00h, 00h, 00h, 00h, 02h, 06h, 1ch, 00h
        db      0c0h, 00h, 00h, 00h, 00h, 00h, 06h, 0eh, 1ch, 04h, 40h, 00h, 00h, 00h, 00h, 00h
        db      08h, 3eh, 3eh, 0eh, 40h, 00h, 00h, 00h, 00h, 00h, 10h, 0feh, 7eh, 1fh, 20h, 00h
        db      00h, 00h, 00h, 00h, 37h, 0feh, 7fh, 1fh, 0f0h, 00h, 00h, 00h, 00h, 00h, 3fh, 0feh
        db      0ffh, 9fh, 0f0h, 00h, 00h, 00h, 00h, 00h, 0ffh, 0fdh, 0ffh, 9fh, 0fch, 00h, 00h, 00h
        db      00h, 01h, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 00h, 00h, 00h, 00h, 07h, 0ffh, 0ffh, 0ffh, 0ffh
        db      0ffh, 00h, 00h, 00h, 00h, 07h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0c0h, 00h, 00h, 00h, 1fh
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0e0h, 00h, 00h, 00h, 3fh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0f8h
        db      00h, 00h, 00h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 00h, 00h, 07h, 0ffh, 0ffh, 0ffh
        db      0ffh, 0ffh, 0ffh, 0ffh, 0c0h, 00h, 1fh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0fch, 00h
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0c0h, 7fh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        db      0ffh, 0ffh, 0ffh, 00h
d_c2_w_07b98:
        db      03h, 13h, 7fh, 0ffh, 00h, 0a4h, 04h, 80h, 0a4h, 0e4h, 40h, 0a4h
        db      0a4h, 40h, 0a4h, 0a4h, 40h, 0a4h, 0e4h, 40h, 0a4h, 04h, 40h, 9fh, 0f8h, 40h, 80h, 00h
        db      40h, 9fh, 0feh, 40h, 0a0h, 01h, 40h, 0a0h, 01h, 40h, 0a0h, 01h, 40h, 0a0h, 01h, 40h
        db      0a0h, 01h, 40h, 0a0h, 01h, 40h, 0a0h, 01h, 40h, 0a0h, 01h, 40h, 7fh, 0ffh, 80h, 00h
d_c0_w_07bd4:
        db      "HQ[fr"
        db      80h
d_c0_w_07bda:
        db      63h, 1ah, 50h, 14h, 41h, 09h, 32h, 0eh
d_c0_w_07be2:
        db      0cdh, 0ach
        db      0dbh, 49h, 33h, 33h, 00h, 20h, 67h, 0a6h, 00h, 40h, 0cch, 2ch, 99h, 19h, 0e6h, 0b0h
        db      1ah, 4fh, 0e5h, 30h, 0e5h, 30h, 0e5h, 30h, 0e5h, 30h, 1ah, 4fh, 0e6h, 0b0h, 00h, 20h
        db      33h, 33h, 0dbh, 49h, 0cdh, 0ach, 99h, 19h, 0cch, 2ch, 00h, 40h, 67h, 0a6h, 2eh, 00h
        db      34h, 00h, 3ah, 00h, 42h, 00h, 4ah, 00h, 53h, 00h, 5dh, 00h, 68h, 00h, 75h, 00h ; 4.:.B.J.S.].h.u.
        db      84h, 00h, 94h, 00h, 0a6h, 00h, 0bah, 00h, 0d1h, 00h, 0eah, 00h, 07h, 01h, 27h, 01h
        db      4bh, 01h, 74h, 01h, 0a1h, 01h, 0d4h, 01h, 0dh, 02h, 4dh, 02h, 95h, 02h, 0e6h, 02h
        db      41h, 03h, 0a6h, 03h, 18h, 04h, 98h, 04h, 28h, 05h, 0c9h, 05h, 7eh, 06h, 49h, 07h
        db      2ch, 08h, 2bh, 09h, 49h, 0ah, 8bh, 0bh, 0f3h, 0ch, 87h, 0eh, 4bh, 10h, 47h, 12h
        db      81h, 14h, 0ffh, 16h, 0c9h, 19h, 0eah, 1ch, 6ah, 20h, 55h, 24h, 0b4h, 28h, 0a0h, 2dh
        db      0eh, 33h, 26h, 39h, 0e8h, 3fh, 72h, 47h, 0c4h, 4fh, 0f2h, 58h, 06h, 63h, 14h, 6eh ; .3&9.?rG.O.X.c.n
        db      12h, 7ah, 0ffh, 7fh, 0ffh, 7fh, 0ffh, 7fh, 0ffh, 7fh, 0ffh, 7fh, 0ffh, 7fh, 0ffh, 7fh
        db      0ffh, 7fh
d_c0_w_07c96:
        db      2eh, 00h, 34h, 00h, 3ah, 00h, 41h, 00h, 49h, 00h, 53h, 00h, 5dh, 00h
        db      68h, 00h, 75h, 00h, 83h, 00h, 93h, 00h, 0a5h, 00h, 0b9h, 00h, 0d0h, 00h, 0e9h, 00h
        db      06h, 01h, 26h, 01h, 4ah, 01h, 72h, 01h, 0a0h, 01h, 0d2h, 01h, 0bh, 02h, 4bh, 02h
        db      93h, 02h, 0e3h, 02h, 3dh, 03h, 0a2h, 03h, 14h, 04h, 93h, 04h, 22h, 05h, 0c2h, 05h
        db      75h, 06h, 3eh, 07h, 1fh, 08h, 1ah, 09h, 34h, 0ah, 70h, 0bh, 0d0h, 0ch, 59h, 0eh
        db      0fh, 10h, 0f7h, 11h, 15h, 14h, 6dh, 16h, 04h, 19h, 0deh, 1bh, 0fdh, 1eh, 65h, 22h
        db      14h, 26h, 08h, 2ah, 40h, 2eh, 0b4h
        db      "2Z7(<"
        db      0ah, 41h, 0f6h, 45h, 0ceh, 4ah, 9ch, 4fh, 38h, 54h, 0a2h, 58h, 0c6h, 5ch, 0aeh, 60h
        db      50h, 64h, 0ach, 67h
        db      0c2h, 6ah, 88h, 6dh, 45h, 70h, 13h, 73h
d_c0_w_07d1c:
        db      00h, 03h, 05h, 08h, 0ah, 0dh, 0fh, 12h
        db      14h, 17h, 1ah, 1ch, 1fh
        db      "!$&)+.0368;=@BEGJLORTWY\\^acfiknpsuxz}"
        db      7fh, 82h, 85h, 87h, 8ah, 8ch
        db      8fh, 91h, 94h, 96h, 99h, 9ch, 9eh, 0a1h, 0a3h, 0a6h, 0a8h, 0abh, 0adh, 0b0h, 0b2h, 0b5h
        db      0b8h, 0bah, 0bdh, 0bfh, 0c2h, 0c4h, 0c7h, 0c9h, 0cch, 0cfh, 0d1h, 0d4h, 0d6h, 0d9h, 0dbh, 0deh
        db      0e0h, 0e3h, 0e5h, 0e8h, 0ebh, 0edh, 0f0h, 0f2h, 0f5h, 0f7h, 0fah, 0fch, 0ffh, 0ffh, 0ffh, 0ffh
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        db      0ffh, 0ffh, 0ffh, 0ffh, 00h, 03h, 05h, 08h, 0ah, 0dh, 0fh, 12h, 14h, 17h, 1ah, 1ch
        db      1fh
        db      "!$&),.1368;=@CEHJMORTWZ\\_adfiln"
        db      "qsvx{}", 080h, 083h, 085h, 088h, 08ah, 08dh, 08fh, 092h, 094h, 097h
        db      9ah, 9ch, 9fh, 0a1h, 0a4h, 0a6h, 0a9h, 0ach, 0aeh, 0b1h, 0b3h, 0b6h, 0b8h, 0bbh, 0bdh, 0c0h
        db      0c3h, 0c5h, 0c8h, 0cah, 0cdh, 0cfh, 0d2h, 0d4h, 0d7h, 0dah, 0dch, 0dfh, 0e1h, 0e4h, 0e6h, 0e9h
        db      0ech, 0eeh, 0f1h, 0f3h, 0f6h, 0f8h, 0fbh, 0fdh, 00h, 80h, 3bh, 80h, 77h, 80h, 0b2h, 80h
        db      0edh, 80h, 29h, 81h, 65h, 81h, 0a1h, 81h, 0ddh, 81h, 19h, 82h, 55h, 82h, 91h, 82h
        db      0ceh, 82h, 0ah, 83h, 47h, 83h, 83h, 83h, 0c0h, 83h, 0fdh, 83h, 3ah, 84h, 77h, 84h
        db      0b5h, 84h, 0f2h, 84h, 2fh, 85h, 6dh, 85h, 0abh, 85h, 0e9h, 85h, 27h, 86h, 65h, 86h
        db      0a3h, 86h, 0e1h, 86h, 1fh, 87h, 5eh, 87h, 9dh, 87h, 0dbh, 87h, 1ah, 88h, 59h, 88h
        db      98h, 88h, 0d7h, 88h, 17h, 89h, 56h, 89h, 95h, 89h, 0d5h, 89h, 15h, 8ah, 55h, 8ah
        db      95h, 8ah, 0d5h, 8ah, 15h, 8bh, 55h, 8bh, 96h, 8bh, 0d6h, 8bh, 17h, 8ch, 58h, 8ch
        db      99h, 8ch, 0dah, 8ch, 1bh, 8dh, 5ch, 8dh, 9eh, 8dh, 0dfh, 8dh, 21h, 8eh, 62h, 8eh
        db      0a4h, 8eh, 0e6h, 8eh, 28h, 8fh, 6bh, 8fh, 0adh, 8fh, 0efh, 8fh, 32h, 90h, 75h, 90h
        db      0b7h, 90h, 0fah, 90h, 3dh, 91h, 81h, 91h, 0c4h, 91h, 07h, 92h, 4bh, 92h, 8fh, 92h
        db      0d2h, 92h, 16h, 93h, 5ah, 93h, 9eh, 93h, 0e3h, 93h, 27h, 94h, 6ch, 94h, 0b0h, 94h
        db      0f5h, 94h, 3ah, 95h, 7fh, 95h, 0c4h, 95h, 09h, 96h, 4fh, 96h, 94h, 96h, 0dah, 96h
        db      20h, 97h, 66h, 97h, 0ach, 97h, 0f2h, 97h, 38h, 98h, 7eh, 98h, 0c5h, 98h, 0ch, 99h
        db      52h, 99h, 99h, 99h, 0e0h, 99h, 28h, 9ah, 6fh, 9ah, 0b6h, 9ah, 0feh, 9ah, 46h, 9bh
        db      8dh, 9bh, 0d5h, 9bh, 1dh, 9ch, 66h, 9ch, 0aeh, 9ch, 0f6h, 9ch, 3fh, 9dh, 88h, 9dh
        db      0d1h, 9dh, 1ah, 9eh, 63h, 9eh, 0ach, 9eh, 0f5h, 9eh, 3fh, 9fh, 89h, 9fh, 0d2h, 9fh
        db      1ch, 0a0h, 66h, 0a0h, 0b0h, 0a0h, 0fbh, 0a0h, 45h, 0a1h, 90h, 0a1h, 0dbh, 0a1h, 25h, 0a2h
        db      70h, 0a2h, 0bch, 0a2h, 07h, 0a3h, 52h, 0a3h, 9eh, 0a3h, 0e9h, 0a3h, 35h, 0a4h, 81h, 0a4h
        db      0cdh, 0a4h, 1ah, 0a5h, 66h, 0a5h, 0b2h, 0a5h, 0ffh, 0a5h, 4ch, 0a6h, 99h, 0a6h, 0e6h, 0a6h
        db      33h, 0a7h, 80h, 0a7h, 0ceh, 0a7h, 1bh, 0a8h, 69h, 0a8h, 0b7h, 0a8h, 05h, 0a9h, 53h, 0a9h
        db      0a2h, 0a9h, 0f0h, 0a9h, 3fh, 0aah, 8dh, 0aah, 0dch, 0aah, 2bh, 0abh, 7ah, 0abh, 0cah, 0abh
        db      19h, 0ach, 69h, 0ach, 0b9h, 0ach, 08h, 0adh, 58h, 0adh, 0a9h, 0adh, 0f9h, 0adh, 49h, 0aeh
        db      9ah, 0aeh, 0ebh, 0aeh, 3ch, 0afh, 8dh, 0afh, 0deh, 0afh, 2fh, 0b0h, 81h, 0b0h, 0d2h, 0b0h
        db      24h, 0b1h, 76h, 0b1h, 0c8h, 0b1h, 1ah, 0b2h, 6dh, 0b2h, 0bfh, 0b2h, 12h, 0b3h, 65h, 0b3h
        db      0b8h, 0b3h, 0bh, 0b4h, 5eh, 0b4h, 0b2h, 0b4h, 05h, 0b5h, 59h, 0b5h, 0adh, 0b5h, 01h, 0b6h
        db      55h, 0b6h, 0a9h, 0b6h, 0feh, 0b6h, 52h, 0b7h, 0a7h, 0b7h, 0fch, 0b7h, 51h, 0b8h, 0a7h, 0b8h
        db      0fch, 0b8h, 52h, 0b9h, 0a7h, 0b9h, 0fdh, 0b9h, 53h, 0bah, 0a9h, 0bah, 00h, 0bbh, 56h, 0bbh
        db      0adh, 0bbh, 04h, 0bch, 5bh, 0bch, 0b2h, 0bch, 09h, 0bdh, 60h, 0bdh, 0b8h, 0bdh, 10h, 0beh
        db      68h, 0beh, 0c0h, 0beh, 18h, 0bfh, 70h, 0bfh, 0c9h, 0bfh, 22h, 0c0h, 7ah, 0c0h, 0d3h, 0c0h
        db      2dh, 0c1h, 86h, 0c1h, 0dfh, 0c1h, 39h, 0c2h, 93h, 0c2h, 0edh, 0c2h, 47h, 0c3h, 0a1h, 0c3h
        db      0fch, 0c3h, 57h, 0c4h, 0b1h, 0c4h, 0ch, 0c5h, 68h, 0c5h, 0c3h, 0c5h, 1eh, 0c6h, 7ah, 0c6h
        db      0d6h, 0c6h, 32h, 0c7h, 8eh, 0c7h, 0eah, 0c7h, 47h, 0c8h, 0a3h, 0c8h, 00h, 0c9h, 5dh, 0c9h
        db      0bah, 0c9h, 17h, 0cah, 75h, 0cah, 0d3h, 0cah, 30h, 0cbh, 8eh, 0cbh, 0ech, 0cbh, 4bh, 0cch
        db      0a9h, 0cch, 08h, 0cdh, 67h, 0cdh, 0c6h, 0cdh, 25h, 0ceh, 84h, 0ceh, 0e4h, 0ceh, 44h, 0cfh
        db      0a3h, 0cfh, 03h, 0d0h, 64h, 0d0h, 0c4h, 0d0h, 25h, 0d1h, 85h, 0d1h, 0e6h, 0d1h, 47h, 0d2h
        db      0a9h, 0d2h, 0ah, 0d3h, 6ch, 0d3h, 0cdh, 0d3h, 2fh, 0d4h, 91h, 0d4h, 0f4h, 0d4h, 56h, 0d5h
        db      0b9h, 0d5h, 1ch, 0d6h, 7fh, 0d6h, 0e2h, 0d6h, 45h, 0d7h, 0a9h, 0d7h, 0dh, 0d8h, 71h, 0d8h
        db      0d5h, 0d8h, 39h, 0d9h, 9eh, 0d9h, 02h, 0dah, 67h, 0dah, 0cch, 0dah, 31h, 0dbh, 97h, 0dbh
        db      0fch, 0dbh, 62h, 0dch, 0c8h, 0dch, 2eh, 0ddh, 94h, 0ddh, 0fbh, 0ddh, 61h, 0deh, 0c8h, 0deh
        db      2fh, 0dfh, 97h, 0dfh, 0feh, 0dfh, 66h, 0e0h, 0cdh, 0e0h, 35h, 0e1h, 9eh, 0e1h, 06h, 0e2h
        db      6eh, 0e2h, 0d7h, 0e2h, 40h, 0e3h, 0a9h, 0e3h, 12h, 0e4h, 7ch, 0e4h, 0e6h, 0e4h, 50h, 0e5h
        db      0bah, 0e5h, 24h, 0e6h, 8eh, 0e6h, 0f9h, 0e6h, 64h, 0e7h, 0cfh, 0e7h, 3ah, 0e8h, 0a5h, 0e8h
        db      11h, 0e9h, 7dh, 0e9h, 0e9h, 0e9h, 55h, 0eah, 0c1h, 0eah, 2eh, 0ebh, 9bh, 0ebh, 08h, 0ech
        db      75h, 0ech, 0e2h, 0ech, 50h, 0edh, 0beh, 0edh, 2ch, 0eeh, 9ah, 0eeh, 08h, 0efh, 77h, 0efh
        db      0e5h, 0efh, 54h, 0f0h, 0c3h, 0f0h, 33h, 0f1h, 0a2h, 0f1h, 12h, 0f2h, 82h, 0f2h, 0f2h, 0f2h
        db      63h, 0f3h, 0d3h, 0f3h, 44h, 0f4h, 0b5h, 0f4h, 26h, 0f5h, 98h, 0f5h, 09h, 0f6h, 7bh, 0f6h
        db      0edh, 0f6h, 5fh, 0f7h, 0d2h, 0f7h, 44h, 0f8h, 0b7h, 0f8h, 2ah, 0f9h, 9dh, 0f9h, 11h, 0fah
        db      84h, 0fah, 0f8h, 0fah, 6ch, 0fbh, 0e1h, 0fbh, 55h, 0fch, 0cah, 0fch, 3fh, 0fdh, 0b4h, 0fdh
        db      29h, 0feh, 9fh, 0feh, 15h, 0ffh, 8bh, 0ffh, 0ffh, 0ffh
; segment words c0 and c2 load into es (mov es,[...]) to reach C1_SEG data.
C1_SEG_WORDS:
        dw      C1_SEG
d_c2_w_08120:
        dw      C1_SEG
d_c2_w_08122:
        dw      C1_SEG
d_c2_w_08124:
        dw      C1_SEG
d_c0_w_08126:
        dw      C1_SEG

; 0x603d8-0x6111a, 3394 bytes of 00h -- BSS, not free space.  the OS's own init
        if      FW_VERSION >= 110
; zeroes DS:8128h-0D81Fh (this range plus 0x5B96 more, to 0x65ACF) with
; `mov di,8128h / mov cx,0D820h / sub cx,di / rep stosw 0CCCCh` at flash
; 0x35F50, every boot, so anything placed here reads as 0CCh: nothing may be
; added to this range (features use 0x5F236, the unreferenced copy of the
; credits drawing further down).
FREE_603D8:
d_c0_w_08128:
        db      2 dup (0)
d_c0_w_0812a:
        db      24 dup (0)
d_c0_b_08142:
        db      2 dup (0)
d_c0_w_08144:
        db      19 dup (0)
d_c1_tbl_08157:
        db      21 dup (0)
d_c0_w_0816c:
        db      2 dup (0)
d_c0_w_0816e:
        db      2 dup (0)
d_c0_w_08170:
        db      2 dup (0)
d_c0_w_08172:
        db      2 dup (0)
d_c1_w_08174:
        db      2 dup (0)
d_c1_w_08176:
        db      2 dup (0)
d_c1_w_08178:
        db      2 dup (0)
d_c1_tbl_0817a:
d_c1_w_0817a:
        db      64 dup (0)
d_c1_tbl_081ba:
        db      64 dup (0)
d_c0_tbl_081fa:
d_c1_w_081fa:
        db      1 dup (0)
d_c0_tbl_081fb:
        db      1 dup (0)
d_c0_tbl_081fc:
        db      1318 dup (0)
d_c1_w_08722:
        db      984 dup (0)
d_c1_w_08afa:
        db      2 dup (0)
d_c1_w_08afc:
        db      2 dup (0)
d_c1_w_08afe:
        db      2 dup (0)
d_c1_w_08b00:
        db      2 dup (0)
d_c0_b_08b02:
d_c1_b_08b02:
        db      2 dup (0)
d_c1_w_08b04:
        db      2 dup (0)
d_c1_w_08b06:
        db      2 dup (0)
d_c1_w_08b08:
        db      2 dup (0)
d_c1_w_08b0a:
        db      4 dup (0)
d_c1_w_08b0e:
        db      2 dup (0)
d_c1_w_08b10:
        db      6 dup (0)
d_c2_b_conv_mpc60_pad:
        db      2 dup (0)
d_c2_w_conv_table_cursor:
        db      2 dup (0)
d_c2_w_fe_desc_off:
        db      2 dup (0)
d_c0_w_08b1c:
d_c2_w_08b1c:
        db      2 dup (0)
d_c2_w_fe_value_off:
        db      2 dup (0)
d_c0_w_08b20:
d_c2_w_08b20:
        db      2 dup (0)
d_fe_committed:
        db      2 dup (0)
d_c0_w_08b24:
        db      4 dup (0)
d_c0_w_08b28:
        db      2 dup (0)
d_c2_w_fe_pending_lo:
        db      2 dup (0)
d_c2_w_fe_pending_hi:
        db      2 dup (0)
d_c2_b_08b2e:
        db      2 dup (0)
d_c2_b_fe_flags:
        db      2 dup (0)
d_c2_tbl_08b32:
d_c2_w_08b32:
        db      16 dup (0)
d_c2_b_08b42:
        db      2 dup (0)
d_c2_w_autoname_num:
        db      6 dup (0)
d_c2_fp_rec_sound:
        db      4 dup (0)
d_c2_w_08b4e:
        db      2 dup (0)
d_c2_w_08b50:
        db      2 dup (0)
d_c2_w_08b52:
        db      2 dup (0)
d_c2_w_08b54:
        db      4 dup (0)
d_c2_w_08b58:
        db      2 dup (0)
d_c2_w_08b5a:
        db      2 dup (0)
d_c2_w_08b5c:
        db      2 dup (0)
d_c2_w_08b5e:
        db      2 dup (0)
d_c2_w_08b60:
        db      2 dup (0)
d_c2_w_08b62:
        db      2 dup (0)
d_c2_w_08b64:
        db      2 dup (0)
d_c2_w_08b66:
        db      4 dup (0)
d_c2_w_08b6a:
        db      2 dup (0)
d_c2_w_08b6c:
        db      22 dup (0)
d_c2_w_08b82:
        db      2 dup (0)
d_c2_w_08b84:
        db      10 dup (0)
d_c2_w_08b8e:
        db      2 dup (0)
d_c2_w_08b90:
        db      2 dup (0)
d_c2_w_08b92:
        db      4 dup (0)
d_c2_w_08b96:
        db      2 dup (0)
d_c2_w_08b98:
        db      22 dup (0)
d_c2_w_08bae:
        db      2 dup (0)
d_c2_w_08bb0:
        db      10 dup (0)
d_c2_w_08bba:
        db      2 dup (0)
d_c2_w_08bbc:
        db      2 dup (0)
d_c2_w_08bbe:
        db      2 dup (0)
d_c2_w_08bc0:
        db      2 dup (0)
d_c2_w_08bc2:
        db      2 dup (0)
d_c2_w_08bc4:
        db      34 dup (0)
d_c2_w_08be6:
        db      2 dup (0)
d_c2_w_08be8:
        db      2 dup (0)
d_c2_w_08bea:
        db      2 dup (0)
d_c2_w_08bec:
        db      2 dup (0)
d_c2_w_08bee:
        db      2 dup (0)
d_c2_w_08bf0:
        db      40 dup (0)
d_c2_w_fe_saved_desc_off:
        db      4 dup (0)
d_fe_ram_desc:
        db      10 dup (0)
d_c2_w_fe_scratch_max_lo:
        db      2 dup (0)
d_c2_w_fe_scratch_max_hi:
        db      32 dup (0)
d_c2_tbl_08c48:
        db      110 dup (0)
d_c2_tbl_08cb6:
        db      120 dup (0)
d_c2_w_08d2e:
        db      2 dup (0)
d_c2_w_08d30:
        db      8 dup (0)
d_c2_w_08d38:
        db      15 dup (0)
d_c2_b_08d47:
        db      7 dup (0)
d_c2_w_08d4e:
        db      2 dup (0)
d_c2_w_08d50:
        db      6 dup (0)
d_c2_w_ts_cursor:
        db      6 dup (0)
d_c2_w_zone_end_fine_cursor:
        db      2 dup (0)
d_c2_w_pgm_assign_cursor:
        db      2 dup (0)
d_c2_w_08d60:
        PAD_TO  DS_SEG*16+08d61h-SEGBASE, 0
d_c2_b_08d61:
        PAD_TO  d_c2_w_08d60+2, 0
d_c2_w_08d62:
        PAD_TO  DS_SEG*16+08d63h-SEGBASE, 0
d_c2_b_08d63:
        PAD_TO  d_c2_w_08d62+2, 0
d_c2_w_08d64:
        PAD_TO  DS_SEG*16+08d65h-SEGBASE, 0
d_c2_b_08d65:
        PAD_TO  d_c2_w_08d64+2, 0
d_c2_w_params_cursor:
        db      4 dup (0)
d_c2_w_08d6a:
        db      2 dup (0)
d_c2_w_08d6c:
        db      6 dup (0)
d_c2_w_08d72:
        db      2 dup (0)
d_c2_w_08d74:
        db      6 dup (0)
d_c2_w_08d7a:
        db      4 dup (0)
d_c2_w_mute_assign_cursor:
        db      6 dup (0)
d_c2_w_08d84:
        db      2 dup (0)
d_c0_b_08d86:
        db      4 dup (0)
d_c2_w_08d8a:
        db      2 dup (0)
d_c2_w_08d8c:
        db      16 dup (0)
d_c2_w_08d9c:
        db      2 dup (0)
d_c2_w_08d9e:
        db      8 dup (0)
d_c2_w_08da6:
        db      2 dup (0)
d_c2_w_08da8:
        db      8 dup (0)
d_c2_w_08db0:
        db      2 dup (0)
d_c2_w_08db2:
        db      6 dup (0)
d_c2_w_08db8:
        db      2 dup (0)
d_c2_w_08dba:
        db      4 dup (0)
d_c2_w_08dbe:
        db      2 dup (0)
d_c2_w_08dc0:
        db      3 dup (0)
d_p_8dc3:
        db      1 dup (0)
d_c2_w_08dc4:
        db      4 dup (0)
d_c0_w_08dc8:
        db      1 dup (0)
d_c0_b_08dc9:
        db      4 dup (0)
d_c0_w_08dcd:
        db      120 dup (0)
d_c0_b_08e45:
        db      1 dup (0)
d_c0_b_08e46:
        db      2 dup (0)
d_c2_w_08e48:
        db      2 dup (0)
d_c2_w_08e4a:
        db      2 dup (0)
d_c2_w_08e4c:
        db      2 dup (0)
d_c2_w_08e4e:
        db      2 dup (0)
d_c2_w_sample_dump_cursor:
        db      2 dup (0)
d_bpm_match_cursor:
d_k0_w_08e52:
        db      2 dup (0)
d_bpm_match_value1:
d_k0_w_08e54:
        db      2 dup (0)
d_bpm_match_value2:
d_k0_w_08e56:
        db      2 dup (0)
d_k0_w_08e58:
        db      2 dup (0)
d_k0_w_08e5a:
        db      2 dup (0)
d_k0_w_08e5c:
        db      2 dup (0)
d_k0_w_08e5e:
        db      2 dup (0)
d_k0_w_08e60:
        db      2 dup (0)
d_k0_w_08e62:
        db      2 dup (0)
d_k0_w_08e64:
        db      2 dup (0)
d_k0_w_08e66:
        db      1 dup (0)
d_k0_b_08e67:
        db      1 dup (0)
d_k0_w_08e68:
        PAD_TO  DS_SEG*16+08E6Ah-SEGBASE, 000h
        else
FREE_5FDD8:
FREE_603D8:
d_c0_w_08128:
        db      2 dup (0)
d_c0_w_0812a:
        db      24 dup (0)
d_c0_b_08142:
        db      2 dup (0)
d_c0_w_08144:
        db      19 dup (0)
d_c1_tbl_08157:
        db      21 dup (0)
d_c0_w_0816c:
        db      2 dup (0)
d_c0_w_0816e:
        db      2 dup (0)
d_c0_w_08170:
        db      2 dup (0)
d_c0_w_08172:
        db      2 dup (0)
d_c1_w_08174:
        db      2 dup (0)
d_c1_w_08176:
        db      2 dup (0)
d_c1_w_08178:
        db      2 dup (0)
d_c1_tbl_0817a:
d_c1_w_0817a:
        db      64 dup (0)
d_c1_tbl_081ba:
        db      64 dup (0)
d_c0_tbl_081fa:
d_c1_w_081fa:
        db      1 dup (0)
d_c0_tbl_081fb:
        db      1 dup (0)
d_c0_tbl_081fc:
        db      1328 dup (0)
d_c1_w_08722:
        db      974 dup (0)
d_c1_w_08afa:
        db      2 dup (0)
d_c1_w_08afc:
        db      2 dup (0)
d_c1_w_08afe:
        db      2 dup (0)
d_c1_w_08b00:
        db      2 dup (0)
d_c0_b_08b02:
d_c1_b_08b02:
        db      2 dup (0)
d_c1_w_08b04:
        db      2 dup (0)
d_c1_w_08b06:
        db      2 dup (0)
d_c1_w_08b08:
        db      2 dup (0)
d_c1_w_08b0a:
        db      4 dup (0)
d_c1_w_08b0e:
        db      2 dup (0)
d_c1_w_08b10:
        db      6 dup (0)
d_c2_b_conv_mpc60_pad:
        db      2 dup (0)
d_c2_w_conv_table_cursor:
        db      2 dup (0)
d_c2_w_fe_desc_off:
        db      2 dup (0)
d_c0_w_08b1c:
d_c2_w_08b1c:
        db      2 dup (0)
d_c2_w_fe_value_off:
        db      2 dup (0)
d_c0_w_08b20:
d_c2_w_08b20:
        db      2 dup (0)
d_fe_committed:
        db      2 dup (0)
d_c0_w_08b24:
        db      4 dup (0)
d_c0_w_08b28:
        db      2 dup (0)
d_c2_w_fe_pending_lo:
        db      2 dup (0)
d_c2_w_fe_pending_hi:
        db      2 dup (0)
d_c2_b_08b2e:
        db      2 dup (0)
d_c2_b_fe_flags:
        db      2 dup (0)
d_c2_tbl_08b32:
d_c2_w_08b32:
        db      16 dup (0)
d_c2_b_08b42:
        db      2 dup (0)
d_c2_w_autoname_num:
        db      6 dup (0)
d_c2_fp_rec_sound:
        db      4 dup (0)
d_c2_w_08b4e:
        db      2 dup (0)
d_c2_w_08b50:
        db      2 dup (0)
d_c2_w_08b52:
        db      2 dup (0)
d_c2_w_08b54:
        db      4 dup (0)
d_c2_w_08b58:
        db      2 dup (0)
d_c2_w_08b5a:
        db      2 dup (0)
d_c2_w_08b5c:
        db      2 dup (0)
d_c2_w_08b5e:
        db      2 dup (0)
d_c2_w_08b60:
        db      2 dup (0)
d_c2_w_08b62:
        db      2 dup (0)
d_c2_w_08b64:
        db      2 dup (0)
d_c2_w_08b66:
        db      4 dup (0)
d_c2_w_08b6a:
        db      2 dup (0)
d_c2_w_08b6c:
        db      22 dup (0)
d_c2_w_08b82:
        db      2 dup (0)
d_c2_w_08b84:
        db      10 dup (0)
d_c2_w_08b8e:
        db      2 dup (0)
d_c2_w_08b90:
        db      2 dup (0)
d_c2_w_08b92:
        db      4 dup (0)
d_c2_w_08b96:
        db      2 dup (0)
d_c2_w_08b98:
        db      22 dup (0)
d_c2_w_08bae:
        db      2 dup (0)
d_c2_w_08bb0:
        db      10 dup (0)
d_c2_w_08bba:
        db      2 dup (0)
d_c2_w_08bbc:
        db      2 dup (0)
d_c2_w_08bbe:
        db      2 dup (0)
d_c2_w_08bc0:
        db      2 dup (0)
d_c2_w_08bc2:
        db      2 dup (0)
d_c2_w_08bc4:
        db      34 dup (0)
d_c2_w_08be6:
        db      2 dup (0)
d_c2_w_08be8:
        db      2 dup (0)
d_c2_w_08bea:
        db      2 dup (0)
d_c2_w_08bec:
        db      2 dup (0)
d_c2_w_08bee:
        db      2 dup (0)
d_c2_w_08bf0:
        db      40 dup (0)
d_c2_w_fe_saved_desc_off:
        db      4 dup (0)
d_fe_ram_desc:
        db      10 dup (0)
d_c2_w_fe_scratch_max_lo:
        db      2 dup (0)
d_c2_w_fe_scratch_max_hi:
        db      32 dup (0)
d_c2_tbl_08c48:
        db      110 dup (0)
d_c2_tbl_08cb6:
        db      120 dup (0)
d_c2_w_08d2e:
        db      2 dup (0)
d_c2_w_08d30:
        db      8 dup (0)
d_c2_w_08d38:
        db      15 dup (0)
d_c2_b_08d47:
        db      7 dup (0)
d_c2_w_08d4e:
        db      2 dup (0)
d_c2_w_08d50:
        db      6 dup (0)
d_c2_w_ts_cursor:
        db      6 dup (0)
d_c2_w_zone_end_fine_cursor:
        db      2 dup (0)
d_c2_w_pgm_assign_cursor:
        db      2 dup (0)
d_c2_w_08d60:
        db      2 dup (0)
d_c2_w_08d62:
        db      2 dup (0)
d_c2_w_08d64:
        db      2 dup (0)
d_c2_w_params_cursor:
        db      4 dup (0)
d_c2_w_08d6a:
        db      2 dup (0)
d_c2_w_08d6c:
        db      6 dup (0)
d_c2_w_08d72:
        db      2 dup (0)
d_c2_w_08d74:
        db      6 dup (0)
d_c2_w_08d7a:
        db      4 dup (0)
d_c2_w_mute_assign_cursor:
        db      6 dup (0)
d_c2_w_08d84:
        db      2 dup (0)
d_c0_b_08d86:
        db      4 dup (0)
d_c2_w_08d8a:
        db      2 dup (0)
d_c2_w_08d8c:
        db      16 dup (0)
d_c2_w_08d9c:
        db      2 dup (0)
d_c2_w_08d9e:
        db      8 dup (0)
d_c2_w_08da6:
        db      2 dup (0)
d_c2_w_08da8:
        db      8 dup (0)
d_c2_w_08db0:
        db      2 dup (0)
d_c2_w_08db2:
        db      6 dup (0)
d_c2_w_08db8:
        db      2 dup (0)
d_c2_w_08dba:
        db      4 dup (0)
d_c2_w_08dbe:
        db      2 dup (0)
d_c2_w_08dc0:
        db      3 dup (0)
d_p_8dc3:
        db      1 dup (0)
d_c2_w_08dc4:
        db      4 dup (0)
d_c0_w_08dc8:
        db      1 dup (0)
d_c0_b_08dc9:
        db      4 dup (0)
d_c0_w_08dcd:
        db      120 dup (0)
d_c0_b_08e45:
        db      1 dup (0)
d_c0_b_08e46:
        db      2 dup (0)
d_c2_w_08e48:
        db      2 dup (0)
d_c2_w_08e4a:
        db      2 dup (0)
d_c2_w_08e4c:
        db      2 dup (0)
d_c2_w_08e4e:
        db      2 dup (0)
d_c2_w_sample_dump_cursor:
        db      2 dup (0)
d_bpm_match_cursor:
d_k0_w_08e52:
        db      2 dup (0)
d_bpm_match_value1:
d_k0_w_08e54:
        db      2 dup (0)
d_bpm_match_value2:
d_k0_w_08e56:
        db      2 dup (0)
d_k0_w_08e58:
        db      2 dup (0)
d_k0_w_08e5a:
        db      2 dup (0)
d_k0_w_08e5c:
        db      2 dup (0)
d_k0_w_08e5e:
        db      2 dup (0)
d_k0_w_08e60:
        db      2 dup (0)
d_k0_w_08e62:
        db      2 dup (0)
d_k0_w_08e64:
        db      2 dup (0)
d_k0_w_08e66:
        db      1 dup (0)
d_k0_b_08e67:
        db      1 dup (0)
d_k0_w_08e68:
        PAD_TO  DS_SEG*16+08E64h-SEGBASE, 000h
        endif

        if      FW_VERSION >= 120
        db      "1.14"
d_c2_tbl_08e6e:
        db      "c "
d_c0_b_08e70:
        db      "  "
d_c0_tbl_08e72:
        db      "  "
d_c0_tbl_08e74:
        db      "  "
d_c0_tbl_08e76:
        db      " -"
d_c0_tbl_08e78:
        db      "74"
        elseif  FW_VERSION >= 114
        db      31h, 2eh, 31h, 34h
d_c2_tbl_08e6e:
        db      20h, 20h
d_c0_b_08e70:
        db      20h, 20h
d_c0_tbl_08e72:
        db      20h, 20h
d_c0_tbl_08e74:
        db      20h, 20h
d_c0_tbl_08e76:
        db      20h, 2dh
d_c0_tbl_08e78:
        db      37h, 32h
        elseif  FW_VERSION >= 112
        db      31h, 2eh, 31h, 32h
d_c2_tbl_08e6e:
        db      20h, 20h
d_c0_b_08e70:
        db      20h, 20h
d_c0_tbl_08e72:
        db      20h, 20h
d_c0_tbl_08e74:
        db      20h, 20h
d_c0_tbl_08e76:
        db      20h, 2dh
d_c0_tbl_08e78:
        db      36h, 35h
        elseif  FW_VERSION >= 111
        db      31h, 2eh, 31h, 31h
d_c2_tbl_08e6e:
        db      20h, 20h
d_c0_b_08e70:
        db      20h, 20h
d_c0_tbl_08e72:
        db      20h, 20h
d_c0_tbl_08e74:
        db      20h, 20h
d_c0_tbl_08e76:
        db      20h, 2dh
d_c0_tbl_08e78:
        db      36h, 33h
        elseif  FW_VERSION >= 110
        db      31h, 2eh, 31h, 30h
d_c2_tbl_08e6e:
        db      20h, 20h
d_c0_b_08e70:
        db      20h, 20h
d_c0_tbl_08e72:
        db      20h, 20h
d_c0_tbl_08e74:
        db      20h, 20h
d_c0_tbl_08e76:
        db      20h, 2dh
d_c0_tbl_08e78:
        db      36h, 31h
        else
        db      31h, 2eh, 30h, 37h, 20h, 20h, 20h, 20h, 20h, 20h
d_c2_tbl_08e6e:
        db      20h, 20h
d_c0_b_08e70:
        db      20h, 2dh
d_c0_tbl_08e72:
        db      35h, 34h
d_c0_tbl_08e74:
        endif

; erased flash 0x6112a-0x65cd6, 19372 bytes, but none of it free at runtime:
; the boot fill above runs on to DS:PGM_ARRAY_DS-1 (0x65acf), and the program-
; record array starts one paragraph later (feat/pins.inc PGM_ARRAY_LIN) and
; runs on into the free part.  anything assembled here is overwritten, so the
; stamp must end the part's contents where it always has.
        if      $ <> DS_SEG*16+08E6Ah+16-SEGBASE-6*(FW_VERSION < 110)
        error   "consts: bytes after the version stamp, where the OS fills or keeps its program records"
        endif
BSS_6112A:
        if      FW_VERSION < 110
        PAD_TO  DS_SEG*16+08e76h-SEGBASE, 0
d_c0_tbl_08e76:
        endif
        if      FW_VERSION < 110
        PAD_TO  DS_SEG*16+08e78h-SEGBASE, 0
d_c0_tbl_08e78:
        endif
        PAD_TO  DS_SEG*16+08e7ah-SEGBASE, 0
d_c2_tbl_08e7a:
        PAD_TO  (DS_SEG*16+08ebeh-SEGBASE)-042h, 0
d_c2_tbl_08e7c:
        PAD_TO  DS_SEG*16+08ebeh-SEGBASE, 0
d_c2_b_08ebe:
        PAD_TO  DS_SEG*16+08ec0h-SEGBASE, 0
d_c1_w_08ec0:
        PAD_TO  DS_SEG*16+08ec2h-SEGBASE, 0
d_c1_w_08ec2:
        PAD_TO  (DS_SEG*16+08fc4h-SEGBASE)-0100h, 0
d_c0_tbl_08ec4:
        PAD_TO  (DS_SEG*16+08fc4h-SEGBASE)-0c0h, 0
d_c0_tbl_08f04:
        PAD_TO  (DS_SEG*16+08fc4h-SEGBASE)-080h, 0
d_c0_tbl_08f44:
        PAD_TO  (DS_SEG*16+08fc4h-SEGBASE)-040h, 0
d_c0_tbl_08f84:
        PAD_TO  DS_SEG*16+08fc4h-SEGBASE, 0
d_c0_b_08fc4:
        PAD_TO  DS_SEG*16+08fc6h-SEGBASE, 0
d_c0_w_08fc6:
        PAD_TO  DS_SEG*16+08fc8h-SEGBASE, 0
d_c0_w_08fc8:
        PAD_TO  DS_SEG*16+08fcah-SEGBASE, 0
d_c2_b_08fca:
        PAD_TO  DS_SEG*16+08fcbh-SEGBASE, 0
d_c1_w_08fcb:
        PAD_TO  DS_SEG*16+08fd9h-SEGBASE, 0
d_c2_b_08fd9:
        PAD_TO  DS_SEG*16+08fdah-SEGBASE, 0
d_c2_b_08fda:
        PAD_TO  DS_SEG*16+08fdbh-SEGBASE, 0
d_c2_b_08fdb:
        PAD_TO  DS_SEG*16+08fe0h-SEGBASE, 0
d_c0_w_08fe0:
        PAD_TO  (DS_SEG*16+095f0h-SEGBASE)-0490h, 0
d_c0_tbl_09160:
        PAD_TO  (DS_SEG*16+095f0h-SEGBASE)-048fh, 0
d_c0_tbl_09161:
        PAD_TO  (DS_SEG*16+095f0h-SEGBASE)-048dh, 0
d_c0_tbl_09163:
        PAD_TO  DS_SEG*16+095f0h-SEGBASE, 0
d_c1_b_095f0:
        PAD_TO  DS_SEG*16+095f2h-SEGBASE, 0
d_c0_w_095f2:
        PAD_TO  DS_SEG*16+095f4h-SEGBASE, 0
d_c2_w_095f4:
        PAD_TO  DS_SEG*16+095f6h-SEGBASE, 0
d_c2_w_095f6:
        PAD_TO  DS_SEG*16+095f8h-SEGBASE, 0
d_c2_w_095f8:
        PAD_TO  DS_SEG*16+095fah-SEGBASE, 0
d_c2_w_095fa:
        PAD_TO  DS_SEG*16+095fch-SEGBASE, 0
d_c2_w_095fc:
        PAD_TO  DS_SEG*16+095feh-SEGBASE, 0
d_c2_w_095fe:
        PAD_TO  DS_SEG*16+09600h-SEGBASE, 0
d_c0_w_09600:
        PAD_TO  DS_SEG*16+09602h-SEGBASE, 0
d_c0_b_09602:
        PAD_TO  DS_SEG*16+09603h-SEGBASE, 0
d_c0_b_09603:
        PAD_TO  DS_SEG*16+09604h-SEGBASE, 0
d_c0_b_09604:
        PAD_TO  DS_SEG*16+09606h-SEGBASE, 0
d_c0_b_09606:
        PAD_TO  (DS_SEG*16+097b1h-SEGBASE)-01a9h, 0
d_c0_tbl_09608:
        PAD_TO  DS_SEG*16+09609h-SEGBASE, 0
d_c0_tbl_09609:
        PAD_TO  (DS_SEG*16+097b1h-SEGBASE)-019bh, 0
d_c1_tbl_09616:
        PAD_TO  (DS_SEG*16+097b1h-SEGBASE)-0199h, 0
d_c1_tbl_09618:
        PAD_TO  (DS_SEG*16+097b1h-SEGBASE)-0197h, 0
d_c1_tbl_0961a:
        PAD_TO  DS_SEG*16+097b1h-SEGBASE, 0
d_c1_b_097b1:
        PAD_TO  DS_SEG*16+09888h-SEGBASE, 0
d_c2_w_09888:
        PAD_TO  DS_SEG*16+0989ah-SEGBASE, 0
d_c0_w_0989a:
        PAD_TO  DS_SEG*16+0989ch-SEGBASE, 0
d_c0_w_0989c:
        PAD_TO  DS_SEG*16+0989eh-SEGBASE, 0
d_c0_w_0989e:
        PAD_TO  DS_SEG*16+098a0h-SEGBASE, 0
d_c2_w_098a0:
        PAD_TO  DS_SEG*16+098a2h-SEGBASE, 0
d_c2_w_098a2:
        PAD_TO  DS_SEG*16+098a4h-SEGBASE, 0
d_c0_w_098a4:
        PAD_TO  DS_SEG*16+098a6h-SEGBASE, 0
d_c2_w_098a6:
        PAD_TO  DS_SEG*16+098a8h-SEGBASE, 0
d_c2_w_098a8:
        PAD_TO  DS_SEG*16+098aah-SEGBASE, 0
d_c2_w_098aa:
        PAD_TO  DS_SEG*16+098ach-SEGBASE, 0
d_c2_w_098ac:
        PAD_TO  DS_SEG*16+098aeh-SEGBASE, 0
d_c2_w_098ae:
        PAD_TO  DS_SEG*16+098b0h-SEGBASE, 0
d_c2_w_098b0:
        PAD_TO  DS_SEG*16+098b2h-SEGBASE, 0
d_c2_w_098b2:
        PAD_TO  DS_SEG*16+098b4h-SEGBASE, 0
d_c2_w_098b4:
        PAD_TO  DS_SEG*16+098b6h-SEGBASE, 0
d_c0_w_098b6:
        PAD_TO  DS_SEG*16+098b8h-SEGBASE, 0
d_c0_b_098b8:
        PAD_TO  DS_SEG*16+098b9h-SEGBASE, 0
d_c2_b_098b9:
        PAD_TO  DS_SEG*16+098bah-SEGBASE, 0
d_c2_w_098ba:
        PAD_TO  DS_SEG*16+098bbh-SEGBASE, 0
d_c2_w_098bb:
        PAD_TO  DS_SEG*16+098bch-SEGBASE, 0
d_c2_b_098bc:
        PAD_TO  DS_SEG*16+098beh-SEGBASE, 0
d_c0_w_098be:
        PAD_TO  DS_SEG*16+098c0h-SEGBASE, 0
d_c0_w_098c0:
        PAD_TO  DS_SEG*16+098c2h-SEGBASE, 0
d_c0_w_098c2:
        PAD_TO  DS_SEG*16+098d5h-SEGBASE, 0
d_c0_b_098d5:
        PAD_TO  DS_SEG*16+098d8h-SEGBASE, 0
d_c0_w_098d8:
        PAD_TO  DS_SEG*16+098dah-SEGBASE, 0
d_c0_w_098da:
        PAD_TO  DS_SEG*16+098dch-SEGBASE, 0
d_c0_w_098dc:
        PAD_TO  DS_SEG*16+098deh-SEGBASE, 0
d_c0_w_098de:
        PAD_TO  DS_SEG*16+098e0h-SEGBASE, 0
d_c1_w_098e0:
        PAD_TO  DS_SEG*16+098e2h-SEGBASE, 0
d_c1_w_098e2:
        PAD_TO  DS_SEG*16+098e4h-SEGBASE, 0
d_c1_b_098e4:
        PAD_TO  DS_SEG*16+098e6h-SEGBASE, 0
d_c1_w_098e6:
        PAD_TO  DS_SEG*16+098e8h-SEGBASE, 0
d_c1_w_098e8:
        PAD_TO  DS_SEG*16+098eah-SEGBASE, 0
d_c1_w_098ea:
        PAD_TO  DS_SEG*16+098ech-SEGBASE, 0
d_c1_w_098ec:
        PAD_TO  DS_SEG*16+098eeh-SEGBASE, 0
d_c1_b_098ee:
        PAD_TO  BSS_6112A+13277, 0
d_c0_w_0c28f:
        db      2248 dup (0)
d_c2_tbl_0cb1f:
        db      496 dup (0)
d_p_cd33:
        PAD_TO  (10000h-030ah)-02h, 00h
d_c1_w_0d71a:
        PAD_TO  10000h-030ah, 00h
d_c1_w_0d71c:
        PAD_TO  10000h-0308h, 00h
d_c1_w_0d71e:
        PAD_TO  10000h-0306h, 00h
d_c1_w_0d720:
        PAD_TO  10000h-0302h, 00h
d_c1_w_0d724:
        PAD_TO  10000h-0300h, 00h
d_c1_w_0d726:
        PAD_TO  10000h-02feh, 00h
d_c1_w_0d728:
        PAD_TO  10000h-02fch, 00h
d_c1_w_0d72a:
        PAD_TO  10000h-02fah, 00h
d_c1_w_0d72c:
        PAD_TO  10000h-02c6h, 00h
d_c0_b_0d760:
        PAD_TO  (10000h-02c4h)-01h, 00h
d_c2_b_0d761:
        PAD_TO  10000h-02c4h, 00h
d_c1_w_0d762:
        PAD_TO  10000h-02b1h, 00h
d_c1_b_0d775:
        PAD_TO  10000h-02b0h, 00h
d_c0_b_0d776:
        PAD_TO  10000h-02afh, 00h
d_c1_b_0d777:
        PAD_TO  10000h-02aeh, 00h
d_c0_w_0d778:
        PAD_TO  10000h-026eh, 00h
d_c0_b_0d7b8:
        PAD_TO  10000h-026dh, 00h
d_c0_b_0d7b9:
        PAD_TO  10000h-026ch, 00h
d_c1_b_0d7ba:
        PAD_TO  10000h-026bh, 00h
d_c0_b_0d7bb:
        PAD_TO  10000h-026ah, 00h
d_c0_b_0d7bc:
        PAD_TO  10000h-0269h, 00h
d_c1_b_0d7bd:
        PAD_TO  (10000h-0267h)-01h, 00h
d_c0_b_0d7be:
        PAD_TO  10000h-0267h, 00h
d_c1_b_0d7bf:
        PAD_TO  (10000h-0265h)-01h, 00h
d_c1_b_0d7c0:
        PAD_TO  10000h-0265h, 00h
d_c0_b_0d7c1:
        PAD_TO  10000h-0264h, 00h
d_c0_w_0d7c2:
        PAD_TO  10000h-0262h, 00h
d_c2_w_0d7c4:
        PAD_TO  10000h-0260h, 00h
d_c1_b_0d7c6:
        PAD_TO  (10000h-025eh)-01h, 00h
d_c0_b_0d7c7:
        PAD_TO  10000h-025eh, 00h
d_c1_b_0d7c8:
        PAD_TO  10000h-025dh, 00h
d_c0_b_0d7c9:
        PAD_TO  10000h-025ch, 00h
d_c1_b_0d7ca:
        PAD_TO  10000h-025bh, 00h
d_c1_b_0d7cb:
        PAD_TO  (10000h-0259h)-01h, 00h
d_c1_b_0d7cc:
        PAD_TO  10000h-0259h, 00h
d_c1_b_0d7cd:
        PAD_TO  (10000h-0256h)-02h, 00h
d_c1_b_0d7ce:
        PAD_TO  10000h-0256h, 00h
d_c1_w_0d7d0:
        PAD_TO  10000h-0254h, 00h
d_c1_w_0d7d2:
        PAD_TO  10000h-0252h, 00h
d_c1_w_0d7d4:
        PAD_TO  10000h-0250h, 00h
d_c0_b_0d7d6:
        PAD_TO  10000h-024fh, 00h
d_c1_b_0d7d7:
        PAD_TO  10000h-024eh, 00h
d_c1_b_0d7d8:
        PAD_TO  10000h-024dh, 00h
d_c1_b_0d7d9:
        PAD_TO  10000h-024ch, 00h
d_c1_b_0d7da:
        PAD_TO  10000h-024bh, 00h
d_c1_b_0d7db:
        PAD_TO  10000h-024ah, 00h
d_c1_b_0d7dc:
        PAD_TO  10000h-0249h, 00h
d_c0_b_0d7dd:
        PAD_TO  10000h-0248h, 00h
d_c1_w_0d7de:
        PAD_TO  10000h-0246h, 00h
d_c1_b_0d7e0:
        PAD_TO  10000h-0244h, 00h
d_c0_b_0d7e2:
        PAD_TO  10000h-0240h, 00h
d_c0_w_0d7e6:
        PAD_TO  10000h-023eh, 00h
d_c0_w_0d7e8:
        PAD_TO  10000h-022eh, 00h
d_c0_b_0d7f8:
        PAD_TO  10000h-022dh, 00h
d_c0_b_0d7f9:
        PAD_TO  10000h-0228h, 00h
d_c1_tbl_0d7fe:
        PAD_TO  10000h-0218h, 00h
d_c1_b_0d80e:
        PAD_TO  10000h, 00h
CONSTS_END:
