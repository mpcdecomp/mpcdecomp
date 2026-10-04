; MPC2000.SYS text2, v1.50 and v1.72 -- the second code segment, opening on
; mpc_config_rate at TEXT2_SEG; ends where DATA_SEG begins.  one text for both:
; what differs is under FW_VERSION, set by each version's image.asm.
; CLI-protected MPC-ASIC access: OUT 0C031h=2, then IN from 0C034h.
mpc_config_rate:
        push    bp
        mov     bp, sp
        push    si
        pushf
        cli
        mov     ax, 2
        mov     dx, 0c031h
        out     dx, al
        mov     dx, 0c034h
        in      ax, dx
        mov     si, ax
        popf
        mov     ax, si
        mov     cx, ds
        shl     cx, 4
        sub     ax, cx
        sub     ax, BUF_XFER
        shr     ax, 1
        pop     si
        leave
        retf
        db      00h

        ifdef   GROWTH_PROOF
        db      GROWTH_PROOF dup (90h)
        endif
L_00026:
        push    di
        xor     ax, ax
        mov     cx, 5
        mov     di, REC_PEAK_L
        push    ds
        pop     es
        rep stosw
        pop     di
        retf
        db      00h

; mpc_config_rate for a base index, then scans a word table.
mpc_rate_caller:
        enter   4, 0
        push    si
        mov     si, word ptr [REC_RING_POS]
        nop
        push    cs
        call    mpc_config_rate
        and     al, 0feh
        mov     word ptr [REC_RING_POS], ax
        xor     ax, ax

L_0004B:
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], ax

loop_00051:
        mov     bx, si
        inc     si
        add     bx, bx
        mov     cx, word ptr [bx+BUF_XFER]
        or      cx, cx
        jge     br_00060
        neg     cx

br_00060:
        cmp     word ptr [bp-2], cx
        jae     br_00068
        mov     word ptr [bp-2], cx

br_00068:
        mov     bx, si
        inc     si
        add     bx, bx
        mov     cx, word ptr [bx+BUF_XFER]
        or      cx, cx
        jge     br_00077
        neg     cx

br_00077:
        cmp     word ptr [bp-4], cx
        jae     br_0007F
        mov     word ptr [bp-4], cx

br_0007F:
        mov     ax, si
        sub     ax, word ptr [REC_RING_POS]
        cmp     ax, 2
        je      br_00096
        cmp     si, 400h
        jb      loop_00051
        sub     si, 400h
        jmp     loop_00051

br_00096:
        mov     bx, word ptr [bp-2]
        cmp     word ptr [REC_PEAK_L], bx
        jae     br_000A3
        mov     word ptr [REC_PEAK_L], bx

br_000A3:
        mov     cx, word ptr [bp-4]
        cmp     word ptr [REC_PEAK_R], cx
        jae     br_000B0
        mov     word ptr [REC_PEAK_R], cx

br_000B0:
        cmp     cx, bx
        jbe     br_000B6
        mov     bx, cx

br_000B6:
        cmp     word ptr [REC_TRIG_PEAK], bx
        jae     br_000C0
        mov     word ptr [REC_TRIG_PEAK], bx

br_000C0:
        cmp     word ptr [REC_PEAK_MONO], bx
        jae     br_000CA
        mov     word ptr [REC_PEAK_MONO], bx

br_000CA:
        pop     si
        leave
        retf
        db      00h

port_c0_write:
        out     0c0h, al
        mov     word ptr [W_005E], ax
        retf

port_c0_read:
        mov     ax, word ptr [W_005E]
        retf

L_000D8:
        in      al, 0c0h
        sub     ah, ah
        retf
        db      00h

far_000DE:
        push    si
        nop
        push    cs
        call    port_c0_read
        mov     si, ax
        and     si, 0ffe7h
        or      si, 20h
        mov     ax, si
        nop
        push    cs
        call    port_c0_write
        mov     ax, si
        and     al, 0dfh
        nop
        push    cs
        call    port_c0_write
        mov     ax, 5dh
        nop
        push    cs
        call    delay_ticks
        pop     si
        retf
L_00106:
        callf   TEXT1_SEG:smem_word_wrapper
        and     ax, 80h
        cmp     ax, 1
        sbb     ax, ax
        neg     ax
        retf

L_00116:
        nop
        push    cs
        call    L_000D8
        and     ax, 1
        cmp     ax, 1
        sbb     ax, ax
        neg     ax
        retf

; INT 4Bh, no params (sequence control).
int4B_wrapper:
        push    bp
        mov     bp, sp
        push    di
        push    si
        push    bp
        push    ds
        push    di
        push    si
        int     4bh
        pop     si
        pop     di
        pop     ds
        pop     bp
        pop     si
        pop     di
        leave
        retf
        db      00h

; AX=[bp+6], then INT 43h (hardware control).
int43_wrapper:
        push    bp
        mov     bp, sp
        push    di
        push    si
        push    bp
        push    ds
        push    di
        push    si
        mov     ax, word ptr [bp+6]
        int     43h
        pop     si
        pop     di
        pop     ds
        pop     bp
        pop     si
        pop     di
        leave
        retf    2
int44_wrapper:
        push    bp
        mov     bp, sp
        push    di
        push    si
        push    bp
        push    ds
        push    di
        push    si
        mov     ax, word ptr [bp+6]
; AX=[bp+6], then INT 44h (audio control).

T2_L_0015E:
        int     44h                       ; Audio control
        pop     si
        pop     di
        pop     ds
        pop     bp
        pop     si
        pop     di
        leave
        retf    2
cmd_dispatch_1E:
        enter   8, 0
        mov     byte ptr [bp-8], 1eh
        mov     al, byte ptr [bp+0ch]
        mov     byte ptr [bp-7], al
        mov     al, byte ptr [bp+0ah]
        mov     byte ptr [bp-6], al
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr [bp-5], ax
        mov     word ptr [bp-3], dx
        mov     byte ptr [bp-1], 0
        lea     ax, [bp-8]
        push    ss
        push    ax
        callf   TEXT1_SEG:disp_list_run
        leave
        retf    8
cmd_ratio_setup:
        enter   6, 0
        mov     byte ptr [bp-6], 7
        mov     al, byte ptr [bp+0ah]
        mov     byte ptr [bp-5], al
        mov     al, byte ptr [bp+8]
        mov     byte ptr [bp-4], al
        mov     al, byte ptr [bp+6]
        mov     byte ptr [bp-3], al
        mov     word ptr [bp-2], 0
        lea     ax, [bp-6]
        push    ss
        push    ax
        callf   TEXT1_SEG:disp_list_run
        leave
        retf    6
        db      00h
cmd_far_stub:
        enter   2, 0
        mov     word ptr [bp-2], 5
        lea     ax, [bp-2]
        push    ss
        push    ax
        callf   TEXT1_SEG:disp_list_run
        leave
        retf
        db      00h

; a value right-aligned in n digits at pixel (x, y).
draw_unsigned_value:
        enter   0ah, 0
        mov     byte ptr [bp-0ah], 17h
        mov     al, byte ptr [bp+0eh]
        mov     byte ptr [bp-9], al
        mov     al, byte ptr [bp+0ch]
        mov     byte ptr [bp-8], al
        mov     al, byte ptr [bp+6]
        mov     byte ptr [bp-7], al
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-4], dx
        mov     byte ptr [bp-2], 0
        lea     ax, [bp-0ah]
        push    ss
        push    ax
        callf   TEXT1_SEG:disp_list_run
        leave
        retf    0ah
draw_signed_value:
        push    bp
        mov     bp, sp
        mov     ax, 20h
        cmp     word ptr [bp+0ah], 0
        jge     br_00230
        neg     word ptr [bp+8]
        adc     word ptr [bp+0ah], 0
        neg     word ptr [bp+0ah]
        mov     al, 2dh
br_00230:
        push    word ptr [bp+0eh]
        push    word ptr [bp+0ch]
        push    ax
        nop
        push    cs
        call    cmd_ratio_setup
        mov     ax, word ptr [bp+0eh]
        add     ax, 6
        push    ax
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    draw_unsigned_value
        leave
        retf    0ah
; v tenths as n-1 digits, a point and one digit.
ratio_calc_divide:
        enter   6, 0
        push    di
        push    si
        mov     di, word ptr [bp+0ah]
        mov     si, word ptr [bp+0ch]
        push    0ah
        push    word ptr [bp+8]
        callf   TEXT1_SEG:_div
        add     sp, 4
        mov     word ptr [bp-2], dx
        push    si
        push    di
        cwd
        push    dx
        push    ax
        mov     ax, word ptr [bp+6]
        dec     ax
        push    ax
        mov     word ptr [bp-6], ax
        nop
        push    cs
        call    draw_unsigned_value
        mov     ax, word ptr [bp-6]
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        add     ax, ax
        mov     cx, si
        add     si, ax
        push    si
        push    di
        push    2eh
        mov     si, cx
        nop
        push    cs

; [bp+8] / 10 via _div, then scales by the quotient.
L_0029D:
        call    cmd_ratio_setup
        mov     ax, word ptr [bp+6]
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        add     ax, ax
        add     si, ax
        push    si
        push    di
        mov     ax, word ptr [bp-2]
        cwd
        push    dx
        push    ax
        push    1
        nop
        push    cs
        call    draw_unsigned_value
        pop     si
        pop     di
        leave
        retf    8
cmd_dispatch_setup:
        enter   6, 0
        mov     byte ptr [bp-6], 16h
        mov     al, byte ptr [bp+0ah]
        mov     byte ptr [bp-5], al
        mov     al, byte ptr [bp+8]
        mov     byte ptr [bp-4], al
        mov     ax, word ptr [bp+6]
        mov     word ptr [bp-3], ax
        mov     byte ptr [bp-1], 0
        lea     ax, [bp-6]
        push    ss
        push    ax
        callf   TEXT1_SEG:disp_list_run
        leave
        retf    6
cmd_param_setup:
        enter   6, 0
        mov     byte ptr [bp-6], 14h
        mov     al, byte ptr [bp+0ch]
        dec     al
        mov     byte ptr [bp-5], al
        mov     al, byte ptr [bp+0ah]
        dec     al
        mov     byte ptr [bp-4], al
        mov     al, byte ptr [bp+8]
        inc     al
        mov     byte ptr [bp-3], al
        mov     al, byte ptr [bp+6]
        inc     al
        mov     byte ptr [bp-2], al
        mov     byte ptr [bp-1], 0
        lea     ax, [bp-6]
        push    ss
        push    ax
        callf   TEXT1_SEG:disp_list_run
        leave
        retf    8
string_copy_scan:
        enter   0ch, 0
        push    di
        push    si
        mov     byte ptr [bp-0ch], 1ah
        mov     al, byte ptr [bp+0ch]
        mov     byte ptr [bp-0bh], al
        mov     al, byte ptr [bp+0ah]
        mov     byte ptr [bp-0ah], al
        push    ds
        lea     si, [bp-9]
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
        les     di, [bp+6]
        mov     cx, 0ffffh
        repne scasb
        not     cx
        dec     cx
        mov     si, cx
        mov     byte ptr [bp+si-8], al
        lea     ax, [bp-0ch]
        push    ss
        push    ax
        callf   TEXT1_SEG:disp_list_run
        pop     si
        pop     di
        leave
        retf    8
        db      00h
cmd_build_params:
        enter   6, 0
        mov     al, byte ptr [bp+0eh]
        mov     byte ptr [bp-6], al
        mov     al, byte ptr [bp+0ch]
        mov     byte ptr [bp-5], al
        mov     al, byte ptr [bp+0ah]
        mov     byte ptr [bp-4], al
        mov     al, byte ptr [bp+8]
        mov     byte ptr [bp-3], al
        mov     al, byte ptr [bp+6]
        mov     byte ptr [bp-2], al
        mov     byte ptr [bp-1], 0
        lea     ax, [bp-6]
        push    ss
        push    ax
        callf   TEXT1_SEG:disp_list_run
        leave
        retf    0ah
display_coord_setup:
        enter   4, 0
        mov     byte ptr [bp-4], 1bh
        mov     ax, word ptr [bp+6]
        mov     word ptr [bp-3], ax
        mov     byte ptr [bp-1], 0
        lea     ax, [bp-4]
        push    ss
        push    ax
        callf   TEXT1_SEG:disp_list_run
        leave
        retf    2

; ?
cmd_far_stub2:
        enter   2, 0
        mov     word ptr [bp-2], 6
        lea     ax, [bp-2]
        push    ss
        push    ax
        callf   TEXT1_SEG:disp_list_run
        leave
        retf
        db      00h
string_copy_setup:
        enter   8, 0
        mov     al, byte ptr [bp+0ah]
        add     al, 2
        mov     byte ptr [bp-8], al
        mov     byte ptr [bp-7], 13h
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-4], dx
        mov     byte ptr [bp-2], 0
        lea     ax, [bp-8]
        push    ss
        push    ax
        callf   TEXT1_SEG:disp_list_run
        leave
        retf    6
string_copy_movsb:
        enter   4, 0
        mov     byte ptr [bp-4], 0
        mov     byte ptr [bp-3], 33h
        mov     byte ptr [bp-2], 0f8h
        mov     byte ptr [bp-1], 9
        push    0
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    string_copy_setup
        push    1
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    string_copy_setup
        push    2
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    string_copy_setup
        leave
        retf
        db      00h
cmd_exec_0E_wrapper:
        push    bp
        mov     bp, sp
        add     word ptr [bp+6], 2
        lea     ax, [bp+6]
        push    ss
        push    ax
        callf   TEXT1_SEG:disp_list_run
        leave
        retf    2
        db      00h
cmd_track_setup:
        enter   6, 0
        mov     byte ptr [bp-6], 0bh
        mov     al, byte ptr [bp+0ah]
        mov     byte ptr [bp-5], al
        mov     al, byte ptr [bp+8]
        mov     byte ptr [bp-4], al
        mov     al, byte ptr [bp+6]
        mov     byte ptr [bp-3], al
        mov     byte ptr [bp-2], 0
        lea     ax, [bp-6]
        push    ss
        push    ax
        callf   TEXT1_SEG:disp_list_run
        leave
        retf    6
cmd_dispatch_0E:
        enter   6, 0
        mov     byte ptr [bp-6], 0eh
        mov     al, byte ptr [bp+0ah]
        mov     byte ptr [bp-5], al
        mov     al, byte ptr [bp+8]
        mov     byte ptr [bp-4], al
        mov     al, byte ptr [bp+6]
        mov     byte ptr [bp-3], al
        mov     byte ptr [bp-2], 0
        lea     ax, [bp-6]
        push    ss
        push    ax
        callf   TEXT1_SEG:disp_list_run
        leave
        retf    6

string_fill_stosb:
        enter   20h, 0
        push    di
        xor     ax, ax
        mov     cx, 0fh
        lea     di, [bp-20h]
        push    ss
        pop     es
        rep stosw
        stosb
        push    1ch
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        lea     ax, [bp-1fh]
        push    ss
        push    ax
        callf   TEXT1_SEG:__fstrncpy
        add     sp, 0ah
        mov     byte ptr [bp-20h], 23h
        lea     ax, [bp-20h]
        push    ss
        push    ax
        callf   TEXT1_SEG:disp_list_run
        pop     di
        leave
        retf    4

cmd_build_dispatch:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     di, word ptr [bp+0ah]
        mov     si, word ptr [bp+0ch]
        push    11h
        push    si
        push    di
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    cmd_build_params
        lea     ax, [si+1]
        push    ax
        mov     ax, di
        add     di, word ptr [bp+6]
        push    di
        push    word ptr [bp+8]
        mov     di, ax
        nop
        push    cs
        call    cmd_track_setup
        add     si, word ptr [bp+8]
        push    si
        lea     ax, [di+1]
        push    ax
        push    word ptr [bp+6]
        nop
        push    cs
        call    cmd_dispatch_0E
        pop     si
        pop     di
        leave
        retf    8
; ? fills the DS:60h block from argument*6 and 0F7h, then INT 2Eh.
ui_row_request:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+6]
        inc     si
        mov     ax, si
        mov     cl, al
        add     al, al
        add     al, cl
        add     al, al
        mov     cx, ax
        inc     al

        mov     byte ptr [P_0060+3], al
        mov     byte ptr [P_0060+5], cl
        mov     byte ptr [P_0060+0ch], cl
        mov     byte ptr [P_0060+0eh], cl
        sub     cl, 0f7h
        neg     cl
        mov     byte ptr [P_0060+10h], cl
        push    ds
        push    word P_0060
        callf   TEXT1_SEG:disp_list_run
        pop     si
        leave
        retf    2
cmd_caller_setup:
        enter   8, 0
        mov     byte ptr [bp-8], 26h
        mov     al, byte ptr [bp+0ch]
        mov     byte ptr [bp-7], al
        mov     al, byte ptr [bp+0ah]
        mov     byte ptr [bp-6], al
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr [bp-5], ax
        mov     word ptr [bp-3], dx
        mov     byte ptr [bp-1], 0
        lea     ax, [bp-8]
        push    ss
        push    ax
        callf   TEXT1_SEG:disp_list_run
        leave
        retf    8
; builds a one-entry {db id, dd far32} set, zero-terminated, for INT 30h.
        if      FW_VERSION = 172
L_005B4:
        push    0ffh
        push    0
        push    0
        nop
        push    cs
        call    install_handler
        retf
        db      00h

; builds a one-entry {db id, dd far32} set, zero-terminated, for INT 30h.
        endif
install_handler:
        enter   0ah, 0
        mov     al, byte ptr [bp+0ah]
        mov     byte ptr [bp-0ah], al
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr [bp-9], ax
        mov     word ptr [bp-7], dx
        mov     byte ptr [bp-5], 0
        lea     ax, [bp-0ah]
        push    ss
        push    ax
        callf   TEXT1_SEG:win_keys_merge
        leave
        retf    6

; install_handler with id 15h, substituting win_key_nop_stub for a null pointer.
install_handler_15:
        push    bp
        mov     bp, sp
        mov     cx, word ptr [bp+6]
        mov     ax, word ptr [bp+8]
        or      ax, cx
        jne     br_00600
        mov     cx, win_key_nop_stub
        mov     dx, TEXT1_SEG
        mov     word ptr [bp+8], dx
br_00600:
        push    15h
        push    word ptr [bp+8]
        push    cx
        nop
        push    cs
        call    install_handler
        leave
        retf    4

        db      00h

X_00610:
        push    ds
        push    word TBL_WINKEYS_00080
        callf   TEXT1_SEG:win_keys_merge
        retf

; spins on the INT 33h tick until AX minus the start exceeds the AX argument.
delay_ticks:
        enter   2, 0
        push    di
        push    si
        mov     si, ax
        callf   TEXT1_SEG:int38_wrapper
        mov     di, ax
loop_00629:
        callf   TEXT1_SEG:int38_wrapper
        sub     ax, di
        cmp     ax, si
        jb      loop_00629
        pop     si
        pop     di
        leave
        retf

install_text2_vectors:
        push    TEXT2_SEG
        push    L_00848
        push    31h
        callf   TEXT1_SEG:ivt_set_vector
        add     sp, 6
        push    TEXT2_SEG
        push    L_00946
        push    3bh
        callf   TEXT1_SEG:ivt_set_vector
        add     sp, 6
        push    TEXT2_SEG
        push    L_0CDD8
        push    47h
        callf   TEXT1_SEG:ivt_set_vector
        add     sp, 6
        retf
        db      00h

; INT 2Fh BL=1Eh, no params.
int2F_bcd_wrapper:
        push    bp
        mov     bp, sp
        push    bp
        push    ds
        mov     bl, 1eh
        int     2fh                       ; Dispatch table call
        pop     ds
        pop     bp
        leave
        retf
        db      00h

; INT 2Fh BL=1Fh: AX=[bp+6], DX=[bp+8].
int2F_bcd_wrapper2:
        push    bp
        mov     bp, sp
        push    bp
        push    ds
        mov     bl, 1fh
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        int     2fh                       ; Dispatch table call
; code, not data: int2F_bcd_arithmetic @0x0be4a
        pop     ds
        pop     bp
        leave
        retf
        db      00h

; ?
mem_block_process:
        push    bp
        mov     bp, sp
        cmp     word ptr [bp+6], 1
        jne     br_006B4
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
; INT 2Fh BL=1Fh: BCD formatting

int2F_bcd_format:
        callf   TEXT1_SEG:int2F_call_fn4
        mov     sp, bp
        inc     ax
        je      br_006AC

loop_006A5:
        mov     ax, 1
        leave
        retf    6

br_006AC:
        mov     word ptr [G_ERRNO], ERR_CANT_OPEN
        jmp     br_006EC

br_006B4:
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        callf   TEXT1_SEG:int2F_call_fn7
        mov     sp, bp
        or      ax, ax
        je      loop_006A5
        dec     ax
        je      br_006D6
        dec     ax
        jl      br_006EC
        jo      br_006EC
        dec     ax
        jle     br_006DE
        dec     ax
        je      L_006E6
        jmp     br_006EC
        db      90h

br_006D6:
        mov     word ptr [G_ERRNO], ERR_WRITE_PROTECTED
        jmp     br_006EC

br_006DE:
        mov     word ptr [G_ERRNO], ERR_NO_DISK_SPACE
        jmp     br_006EC

L_006E6:
        mov     word ptr [G_ERRNO], ERR_WRONG_DISK_FORMAT

br_006EC:
        xor     ax, ax
        leave
        retf    6

bcd_display_calc:
        push    bp
        mov     bp, sp
        push    word ptr [bp+6]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        callf   TEXT1_SEG:int2F_call_fn9
        mov     sp, bp
        or      ax, ax
        je      br_0071C
        dec     ax
        je      br_00724
        dec     ax
        jl      br_00714
        jo      br_00714
        dec     ax
        jle     L_0072C

br_00714:
        mov     word ptr [G_ERRNO], ERR_INTERNAL
        jmp     br_00732

br_0071C:
        mov     ax, 1
        leave
        retf    6
        db      90h

br_00724:
        mov     word ptr [G_ERRNO], ERR_WRITE_PROTECTED
        jmp     br_00732

L_0072C:
        mov     word ptr [G_ERRNO], ERR_NO_DISK_SPACE

br_00732:
        xor     ax, ax
        leave
        retf    6

far_memop_caller:
        enter   4, 0
        push    di
        push    si
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     ax, word ptr [bp+8]
        or      ax, word ptr [bp+6]
        je      br_007BA

loop_00752:
        cmp     word ptr [bp+8], 0
        jl      br_00766
        jg      br_00761
        cmp     word ptr [bp+6], 400h
        jbe     br_00766

br_00761:
        mov     si, 400h
        jmp     br_00769

br_00766:
        mov     si, word ptr [bp+6]

br_00769:
        mov     ax, si
        add     ax, si
        push    ax
        push    ds
        push    BUF_XFER
        mov     di, ax
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, di
        jne     br_007AA
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    ds
        push    BUF_XFER
        push    si
        nop
        push    cs
        call    flash_write_words
        mov     ax, si
        cwd
        add     word ptr [bp-4], ax
        adc     word ptr [bp-2], dx
        sub     word ptr [bp+6], si
        sbb     word ptr [bp+8], dx
        mov     ax, word ptr [bp+8]
        or      ax, word ptr [bp+6]
        jne     loop_00752
        jmp     br_007BA
        db      90h
br_007AA:
        mov     word ptr [G_ERRNO], ERR_DISK_READ
        mov     ax, 0ffffh
        cwd
        pop     si
        pop     di
        leave
        retf    8
br_007BA:
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        sub     ax, word ptr [bp+0ah]
        sbb     dx, word ptr [bp+0ch]
        pop     si
        pop     di
        leave
        retf    8
bcd_time_format:
        enter   4, 0
        push    si
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     ax, word ptr [bp+8]
        or      ax, word ptr [bp+6]

        je      L_00840

loop_007E5:
        cmp     word ptr [bp+8], 0
        jl      br_007FA
        jg      br_007F4
        cmp     word ptr [bp+6], 400h
        jbe     br_007FA

br_007F4:
        mov     si, 400h
        jmp     br_007FD
        db      90h

br_007FA:
        mov     si, word ptr [bp+6]

br_007FD:
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    ds
        push    BUF_XFER
        push    si
        nop
        push    cs
        call    smem_read_words
        push    ds
        push    BUF_XFER
        mov     ax, si
        add     ax, si
        push    ax
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        je      br_00838
        mov     ax, si
        cwd
        add     word ptr [bp-4], ax
        adc     word ptr [bp-2], dx
        sub     word ptr [bp+6], si
        sbb     word ptr [bp+8], dx
        mov     ax, word ptr [bp+8]
        or      ax, word ptr [bp+6]
        jne     loop_007E5
        jmp     L_00840

br_00838:
        xor     ax, ax
        pop     si
        leave
        retf    8
        db      90h

L_00840:
        mov     ax, 1
        pop     si
        leave
        retf    8

L_00848:
        pusha
        push    ds
        push    es
        mov     bp, sp
        sub     sp, 20h
        push    ds
        mov     ax, DATA_SEG
        mov     ds, ax
        cld
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp]
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-8], dx
        mov     cx, word ptr [bp+0eh]
        mov     bx, word ptr [bp+12h]
        mov     word ptr [bp-6], bx
        mov     word ptr [bp-4], cx
        sti
        add     ax, 11h
        push    ds
        mov     di, ax
        lea     si, [bp-0eh]
        mov     es, dx
        mov     cx, ss
        mov     ds, cx
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        xchg    di, si
        push    ds
        push    dx
        pop     ds
        pop     es
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        mov     word ptr [bp-2], ax
        mov     ax, word ptr [TBL_00EE+2]
        or      ax, word ptr [TBL_00EE]
        jne     X_008A8
        jmp     NEAR X_00934

X_008A8:
        mov     si, TBL_00EE
        mov     di, word ptr [bp-2]

X_008AE:
        lea     ax, [bp-0eh]
        push    ss
        push    ax
        push    word ptr [si+2]
        push    word ptr [si]
        callf   TEXT1_SEG:__fstricmp
        add     sp, 8
        or      ax, ax
        je      X_008D2
        inc     di
        add     si, 8
        mov     ax, word ptr [si+2]
        or      ax, word ptr [si]
        jne     X_008AE
        jmp     SHORT X_00934
        db      90h

X_008D2:
        cmp     di, 2
        jge     X_008F4
        mov     si, word ptr [bp-0ah]
        push    10h
        push    word ptr [bp-8]
        push    si
        lea     ax, [bp-20h]
        push    ss
        push    ax
        callf   TEXT1_SEG:__fstrncpy
        add     sp, 0ah
        mov     byte ptr [bp-10h], 0
        jmp     SHORT X_00905
        db      90h

X_008F4:
        mov     si, word ptr [bp-0ah]
        lea     ax, [bp-20h]
        push    ss
        push    ax
        push    word ptr [bp-8]
        push    si
        nop
        push    cs
        call    bcd_arithmetic_1

X_00905:
        mov     dx, word ptr [bp+8]
        mov     ax, word ptr [bp+4]
        push    dx
        push    ax
        mov     cx, word ptr [bp+0ch]
        mov     si, cx
        push    cx
        push    ax
        push    word ptr [bp+10h]
        push    cx
        push    word ptr [bp-4]
        push    word ptr [bp-6]
        lea     ax, [bp-20h]
        push    ss
        push    ax
        mov     bx, di
        shl     bx, 3
        callf   [bx+TBL_00EE+4]
        add     sp, 14h
        mov     word ptr [bp+12h], ax
        jmp     SHORT L_0093F

X_00934:
        mov     word ptr [G_ERRNO], ERR_UNKNOWN_FILE_TYPE
        nop
        push    cs
        call    err_msg_report

L_0093F:
        mov     sp, bp
        pop     es
        pop     ds
        popa
        iret
        db      00h

L_00946:
        pusha
        push    ds
        push    es
        mov     bp, sp
        push    ds
        mov     ax, DATA_SEG
        mov     ds, ax
        cld
        sti
        mov     al, byte ptr [bp+12h]
        sub     ah, ah
        cmp     ax, 5
        ja      X_009AD
        add     ax, ax
        xchg    bx, ax
        jmp     word ptr cs:[bx+X_00966]
        db      90h

X_00966:
        dw      X_00972, X_0097E, X_00988, X_00992
        dw      X_0099C, X_009A6

X_00972:
        push    ss
        push    bp
        callf   TEXT1_SEG:midi_realtime_continue

X_00979:
        mov     word ptr [bp+12h], ax
        jmp     SHORT X_009AD

X_0097E:
        push    ss
        push    bp
        callf   TEXT1_SEG:midi_realtime_start
        jmp     SHORT X_00979
        db      90h

X_00988:
        push    ss
        push    bp
        nop
        push    cs
        call    ctrl_port_48_read2
        jmp     SHORT X_009AD
        db      90h

X_00992:
        push    ss
        push    bp
        callf   TEXT1_SEG:seq_init_navigation
        jmp     SHORT X_009AD
        db      90h

X_0099C:
        push    ss
        push    bp
        callf   TEXT1_SEG:seq_prev_track
        jmp     SHORT X_009AD
        db      90h

X_009A6:
        push    ss
        push    bp
        callf   TEXT1_SEG:seq_next_track

X_009AD:
        mov     sp, bp
        pop     es
        pop     ds
        popa
        iret
        db      00h

bcd_convert:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     di, word ptr [bp+6]
        mov     si, word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    di
        push    word ptr [bp+0ch]
        push    si
        callf   TEXT1_SEG:__fstricmp
        add     sp, 8
        or      ax, ax
        je      br_009E0
        push    word ptr [bp+0ch]
        push    si
        push    word ptr [bp+8]
        push    di
        nop
        push    cs
        call    bcd_arithmetic_1

br_009E0:
        pop     si
        pop     di
        leave
        retf    8

; ?
bcd_arithmetic_1:
        enter   2, 0
        push    di
        push    si
        mov     di, word ptr [bp+0ah]
        push    10h
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    word ptr [bp+0ch]
        push    di
        callf   TEXT1_SEG:__fstrncpy
        add     sp, 0ah
        mov     es, word ptr [bp+0ch]
        mov     byte ptr es:[di+10h], 0
        mov     word ptr [bp-2], 0
        cmp     byte ptr es:[di], 0
        je      br_00A32
        mov     si, word ptr [bp-2]
loop_00A19:
        mov     bx, di
        mov     es, word ptr [bp+0ch]
        and     byte ptr es:[bx+si], 7fh
        cmp     byte ptr es:[bx+si], 20h
        jge     br_00A38
        mov     es, word ptr [bp+0ch]
        mov     byte ptr es:[bx+si], 2ah
        jmp     br_00A4A
        db      90h

br_00A32:
        mov     si, word ptr [bp-2]
        jmp     br_00A54
        db      90h

br_00A38:
        mov     es, word ptr [bp+0ch]
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+TBL_NAME_CHARSET]
        mov     bx, di
        mov     byte ptr es:[bx+si], al

br_00A4A:
        mov     es, word ptr [bp+0ch]
        inc     si
        cmp     byte ptr es:[bx+si], 0
        jne     loop_00A19

br_00A54:
        cmp     si, 10h
        jge     br_00A6D
        mov     ax, 2020h
        les     bx, [bp+0ah]
        mov     cx, 10h
        sub     cx, si
        lea     di, [bx+si]
        shr     cx, 1
        rep stosw
        jae     br_00A6D
        stosb

br_00A6D:
        mov     si, 0fh
        les     bx, [bp+0ah]
        cmp     byte ptr es:[bx+0fh], 20h
        je      L_00A7E
        mov     di, bx
        jmp     br_00A89

L_00A7E:
        mov     di, bx

loop_00A80:
        mov     bx, di
        dec     si
        cmp     byte ptr es:[bx+si], 20h
        je      loop_00A80

br_00A89:
        or      si, si
        jl      br_00AA5

loop_00A8D:
        mov     bx, di
        mov     es, word ptr [bp+0ch]
        cmp     byte ptr es:[bx+si], 2ah
        je      L_00A9E
        cmp     byte ptr es:[bx+si], 20h
        jne     br_00AA2

L_00A9E:
        mov     byte ptr es:[bx+si], 5fh

br_00AA2:
        dec     si
        jns     loop_00A8D

br_00AA5:
        mov     ax, di
        mov     dx, word ptr [bp+0ch]
        pop     si
        pop     di
        leave
        retf    8

err_msg_report:
        if      FW_VERSION = 172
        cmp     word ptr [G_ERRNO], ERR_MSG_COUNT
        else
        cmp     word ptr [G_ERRNO], ERR_MSG_LAST
        endif
        jle     br_00ABD
        if      FW_VERSION = 172
        mov     word ptr [G_ERRNO], ERR_MSG_COUNT

        else
        mov     word ptr [G_ERRNO], ERR_MSG_LAST
        endif
br_00ABD:
        mov     bx, word ptr [G_ERRNO]
        shl     bx, 2
        push    word ptr [bx+ERR_MSG_TABLE+2]
        push    word ptr [bx+ERR_MSG_TABLE]
        nop
        push    cs
        call    string_fill_stosb
        retf

; DS = DATA_SEG, then INT 45h (display control).
int45_wrapper:
        push    bp
        mov     bp, sp
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    bp
        int     45h                       ; Display control
        pop     bp
        pop     ds
        leave
        retf

; DS = DATA_SEG, then INT 46h (input control).
t2_int46_wrapper:
        push    bp
        mov     bp, sp
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    bp
        int     46h                       ; Input control
        pop     bp
        pop     ds
        leave
        retf

X_00AF2:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_03FC
        callf   TEXT1_SEG:win_keys_merge
        push    ds
        push    P_03C8
        callf   TEXT1_SEG:disp_list_run
        push    0
        push    0
        push    ds
        push    SYS_BUILD_DATE
        nop
        push    cs
        call    cmd_dispatch_1E
        pop     ds
        retf
        db      00h

L_00B1A:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    0a9h
        push    13h
        mov     al, byte ptr [P_03C7]
        cbw
        shl     ax, 2
        add     ax, TBL_OFF_ON_LABELS
        push    cx
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        nop
        push    cs
        call    field_redraw
        pop     ds
        retf
        db      00h
X_00B3E:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_03FC
        callf   TEXT1_SEG:win_keys_merge
        push    32h
        push    TEXT2_SEG
        push    L_00B1A
        nop
        push    cs
        call    install_handler
        push    ds
        push    P_03C8
        callf   TEXT1_SEG:disp_list_run
        push    ds
        push    DL_REC_OUT_8PARA
        callf   TEXT1_SEG:disp_list_run
        push    ds
        push    P_03C7
        push    1
        push    0a9h
        push    13h
        push    4
        push    0
        push    0
        nop
        push    cs
        call    voice_trigger_full
        pop     ds
        retf

; each of the four flash banks' two result words, a row apiece.
cmd_dispatch_handler_1:
        enter   2, 0
        push    di

L_00B89:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_03C8
        callf   TEXT1_SEG:disp_list_run
        push    ds
        push    DL_FLASH_MEMORY_TEST
        callf   TEXT1_SEG:disp_list_run
        mov     word ptr [bp-2], 0
        mov     di, P_4EFE
        mov     si, 0ah

L_00BAD:
        mov     al, byte ptr [bp-2]
        add     al, 30h
        mov     byte ptr [STR_FLASH_TEST_STATUS], al
        push    1

L_00BB7:
        push    si
        push    ds
        push    STR_FLASH_TEST_STATUS
        nop
        push    cs
        call    cmd_dispatch_1E
        push    19h
        push    si
        push    word ptr [di]
        nop
        push    cs
        call    cmd_dispatch_setup
        push    43h
        push    si
        push    word ptr [di+2]
        nop
        push    cs
        call    cmd_dispatch_setup
        add     di, 4
        add     si, 9
        inc     word ptr [bp-2]
        cmp     word ptr [bp-2], 4
        jl      L_00BAD
        pop     ds
        pop     si
        pop     di
        leave
        retf

; FLASH FILE MEMORY TEST, GO: CMP WORD [4EFCh],0 / JE -> print no-board.
flash_test_go_handler:
        enter   10h, 0
        push    di

L_00BEF:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     word ptr [W_4EFC], 0
        jne     br_00C00
        jmp     br_00D0C

br_00C00:
        mov     word ptr [bp-4], 0
        mov     word ptr [bp-2], 100h
        mov     ax, BUF_XFER
        push    cx
        mov     di, SYS_BUILD_DATE
        mov     si, ax
        mov     es, cx
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
        push    79h
        push    0ah
        push    ds
        push    STR_NOW_TESTING
        nop
        push    cs
        call    cmd_dispatch_1E
        push    79h
        push    13h
        push    ds
        push    STR_BLOCK
        nop
        push    cs
        call    cmd_dispatch_1E
        mov     word ptr [bp-8], 0
loop_00C4E:
        push    9dh
        push    13h
        mov     ax, word ptr [bp-8]
        cwd
        push    dx
        push    ax
        push    4
        nop
        push    cs
        call    draw_unsigned_value
        nop
        push    cs
        call    cmd_far_stub
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    string_memop_setup
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    ds
        mov     ax, BUF_XFER
        push    ax
        mov     di, ax
        mov     ax, ds
        mov     es, ax
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        dec     cx
        shr     cx, 1
        push    cx
        nop
        push    cs
        call    system_call_handler
        or      ax, ax
        je      br_00D00
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    ds
        push    P_A124
        mov     ax, BUF_XFER
        mov     di, ax
        mov     ax, ds
        mov     es, ax
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        dec     cx
        shr     cx, 1
        push    cx
        nop
        push    cs
        call    smem_read_words
        mov     ax, BUF_XFER
        mov     dx, ax
        mov     di, ax
        mov     ax, ds
        mov     es, ax
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        dec     cx
        and     cl, 0feh
        mov     di, P_A124
        mov     si, dx
        repe cmpsb
        je      br_00CE2
        sbb     ax, ax
        sbb     ax, 0ffffh
br_00CE2:
        or      ax, ax
        jne     br_00D06
        add     byte ptr [bp-3], 80h
        adc     word ptr [bp-2], ax
        inc     word ptr [bp-8]
        cmp     word ptr [bp-8], 80h
        jge     br_00CFA
        jmp     loop_00C4E

br_00CFA:
        push    ds
        push    STR_FLASH_MEMORY_OK
        jmp     br_00D10

br_00D00:
        push    ds
        push    STR_FLASH_WRITE_ERROR
        jmp     br_00D10

br_00D06:
        push    ds
        push    STR_FLASH_VERIFY_ERROR
        jmp     br_00D10

br_00D0C:
        push    ds
        push    STR_FLASH_CARD_NOT_FOUND

br_00D10:
        nop
        push    cs
        call    string_fill_stosb
        pop     ds
        pop     si
        pop     di
        leave
        retf

; win_keys_merge twice (3FCh/4F8h), a near helper, then a 4-pass loop.
disk_media_check:
        enter   4, 0
        push    di

L_00D1F:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_03FC
        callf   TEXT1_SEG:win_keys_merge
        push    ds
        push    TBL_WINKEYS_004F8
        callf   TEXT1_SEG:win_keys_merge
        nop
        push    cs
        call    far_012F0
        xor     si, si
        mov     di, P_4EFE
loop_00D42:
        lea     ax, [si+10h]
        shl     ax, 4
        push    ax
        push    0
        lea     ax, [bp-4]
        push    ax
        nop
        push    cs
        call    flash_read_identifier
        mov     bx, ax
        mov     ax, word ptr ss:[bx]
        mov     dx, word ptr ss:[bx+2]
        mov     word ptr [di], ax
        mov     word ptr [di+2], dx
        add     di, 4
        inc     si
        cmp     si, 4
        jl      loop_00D42
        nop
        push    cs
        call    far_012F0
        xor     di, di
        mov     si, P_4EFE
loop_00D75:
        cmp     word ptr [si], 89h
        jne     br_00D8E
        cmp     word ptr [si+2], 66a0h
        jne     br_00D8E
        add     si, 4
        inc     di
        cmp     di, 4
        jl      loop_00D75
        jmp     X_00D9A
        db      90h
br_00D8E:
        mov     word ptr [W_4EFC], 0
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      90h

X_00D9A:
        mov     word ptr [W_4EFC], 1
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h

L_00DA6:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        if      FW_VERSION = 172
        push    P_03C8
        callf   TEXT1_SEG:disp_list_run
        push    ds
        push    P_0572
        callf   TEXT1_SEG:disp_list_run
        push    ds
        endif
        push    P_03FC
        callf   TEXT1_SEG:win_keys_merge
        push    ds
        push    TBL_WINKEYS_00562
        callf   TEXT1_SEG:win_keys_merge
        mov     word ptr [W_4EFC], 0ffffh
        if      FW_VERSION = 150
        callf   TEXT1_SEG:system_setup_2
        endif
        nop
        push    cs
        call    cmd_far_stub
        if      FW_VERSION = 172
        callf   TEXT1_SEG:L_02720
        nop
        push    cs
        call    L_005B4
        else
        callf   TEXT1_SEG:X_025D8
        endif
        pop     ds
        retf
        db      00h

L_00DE8:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    disk_media_check
        pop     ds
        retf
        db      00h

X_00DF6:
        push    di
        push    TEXT2_SEG
        push    L_03ADC
        push    42h
        callf   TEXT1_SEG:ivt_set_vector
        add     sp, 6
        push    word TEXT1_SEG
        push    L_0ACFE
        push    4ch
        callf   TEXT1_SEG:ivt_set_vector
        add     sp, 6
        push    ds
        push    TBL_WINKEYS_005C4
        callf   TEXT1_SEG:win_keys_merge
        xor     ax, ax
        mov     cx, 3
        mov     di, G_PAD_NOTE_BASE
        push    ds
        pop     es
        rep stosw
        stosb
        mov     byte ptr [G_PAD_NOTE_BASE], 23h
        mov     byte ptr [G_PAD_INDEX], al
        pop     di
        retf
        db      90h

string_copy_cmd:
        enter   2, 0
        push    di
        mov     word ptr [SMEM_POOL_USED], 82h
        xor     ax, ax
        mov     cx, 28fh
        mov     di, SMEM_POOL

L_00E4B:
        push    ds
        pop     es
        rep stosw
        xor     bx, bx
        mov     word ptr [SMEM_POOL_FREE], bx
        mov     word ptr [bp-2], SMEM_POOL_NEXT
        mov     di, word ptr [bp-2]

loop_00E5D:
        lea     ax, [bx+1]
        mov     word ptr [di], ax
        add     di, 0ah
        mov     bx, ax
        cmp     bx, 82h
        jl      loop_00E5D
        mov     word ptr [SMEM_POOL_TAIL_NEXT], 82h
        pop     di
        leave
        retf
X_00E76:
        nop
        push    cs
        call    smem_alloc_top
        mov     cx, ax
        mov     bx, dx
        mov     ax, word ptr [SMEM_SIZE]
        mov     dx, word ptr [SMEM_SIZE_HI]
        sub     ax, cx
        sbb     dx, bx
        retf
        db      00h

; walks the 130-entry stride-10 sample-memory block list and returns the
; largest base+length.
smem_alloc_top:
        enter   6, 0
        push    si
        sub     ax, ax
        mov     word ptr [bp-2], ax
        mov     word ptr [bp-4], ax
        mov     bx, word ptr [SMEM_POOL_USED]
        cmp     bx, 82h
        je      br_00EF2

L_00EA3:
        mov     si, bx
        shl     si, 2
        add     si, bx
        add     si, si
        test    word ptr [si+SMEM_POOL_BASE_HI], 100h
        jne     br_00EE6
        mov     ax, word ptr [si+SMEM_POOL_LEN]
        mov     dx, word ptr [si+SMEM_POOL_LEN_HI]
        add     ax, word ptr [si+SMEM_POOL]
        adc     dx, word ptr [si+SMEM_POOL_BASE_HI]
        cmp     dx, word ptr [bp-2]
        jl      br_00EE6
        jg      L_00ED0

L_00ECB:
        cmp     ax, word ptr [bp-4]
        jbe     br_00EE6

L_00ED0:
        mov     ax, word ptr [si+SMEM_POOL_LEN]
        mov     dx, word ptr [si+SMEM_POOL_LEN_HI]
        add     ax, word ptr [si+SMEM_POOL]
        adc     dx, word ptr [si+SMEM_POOL_BASE_HI]

L_00EE0:
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx

br_00EE6:
        mov     bx, si
        mov     bx, word ptr [bx+SMEM_POOL_NEXT]
        cmp     bx, 82h
        jne     L_00EA3

br_00EF2:
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        pop     si
        leave
        retf
        db      00h
; same block list; moves each live block down to a running cursor and
; rewrites its base.

smem_compact:
        if      FW_VERSION = 150

L_00F69:                                ; wrapped near-call target
        endif
        enter   8ah, 0
        push    di
        push    si
        mov     bx, word ptr [SMEM_POOL_USED]
        xor     di, di
        cmp     bx, 82h
        je      br_00F3A

loop_00F0E:
        mov     si, bx
        shl     si, 2
        add     si, bx
        add     si, si
        mov     word ptr [bp-88h], si
        test    word ptr [si+SMEM_POOL_BASE_HI], 100h
        jne     br_00F2C
        lea     si, [bp-4]
        inc     di
        sub     si, di
        mov     byte ptr ss:[si], bl

br_00F2C:
        mov     bx, word ptr [bp-88h]
        mov     bx, word ptr [bx+SMEM_POOL_NEXT]
        cmp     bx, 82h
        jne     loop_00F0E
br_00F3A:
        mov     si, 82h
        sub     si, di
        mov     bl, byte ptr [bp+si-86h]
        sub     bh, bh
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL_LEN]
        mov     dx, word ptr [bx+SMEM_POOL_LEN_HI]
        add     ax, word ptr [bx+SMEM_POOL]
        adc     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        inc     si
        cmp     si, 82h
        if      FW_VERSION = 172
L_00F69:
        endif
        jge     br_00FD2

loop_00F6B:
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        mov     bl, byte ptr [bp+si-86h]
        sub     bh, bh
        mov     cx, bx
        shl     bx, 2
        add     bx, cx
        add     bx, bx
        mov     word ptr [bp-8ah], bx
        cmp     word ptr [bx+SMEM_POOL], ax
        jne     br_00F90
        cmp     word ptr [bx+SMEM_POOL_BASE_HI], dx
        je      br_00FB9
br_00F90:
        push    word ptr [bx+SMEM_POOL_BASE_HI]
        push    word ptr [bx+SMEM_POOL]
        push    dx
        push    ax
        push    word ptr [bx+SMEM_POOL_LEN_HI]
        push    word ptr [bx+SMEM_POOL_LEN]
        nop
        push    cs
        call    input_handler
        mov     ax, word ptr [bp-4]
        mov     bx, word ptr [bp-8ah]
        mov     dx, word ptr [bp-2]
        mov     word ptr [bx+SMEM_POOL], ax
        mov     word ptr [bx+SMEM_POOL_BASE_HI], dx
br_00FB9:
        mov     bx, word ptr [bp-8ah]
        mov     ax, word ptr [bx+SMEM_POOL_LEN]
        mov     dx, word ptr [bx+SMEM_POOL_LEN_HI]
        add     word ptr [bp-4], ax
        adc     word ptr [bp-2], dx
        inc     si
        cmp     si, 82h
        jl      loop_00F6B

br_00FD2:
        pop     si
        pop     di
        leave
        retf

port_c2_write:
        out     0c2h, al
        mov     word ptr [G_PORT_C2_SHADOW], ax
        retf

; write N 16-bit words to the flash board via 0:04C8h, the RAM->device DMA.
flash_write_words:
        push    bp
        mov     bp, sp
        push    di

L_00FE0:
        push    si
        push    ds
        les     di, [bp+0ch]
        lds     si, [bp+8]
        mov     cx, word ptr [bp+6]
        mov     dx, 1000h
        if      FW_VERSION = 172
L_00FEF                         equ     $+1
        endif
        callf   TEXT1_SEG:L_004C8
        pop     ds
        pop     si
        pop     di
        leave
        retf    0ah

smem_read_words:
        push    bp
        mov     bp, sp
        push    word ptr [bp+0eh]
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    1000h
        nop
        push    cs
        call    smem_dma_copy
        leave
        retf    0ah

; far-calls TEXT1 004C2h with ES:DI destination, DS:SI source, CX/DX count.
smem_dma_copy:
        push    bp
        mov     bp, sp
        push    di

L_0101C:
        push    si
        push    ds
        les     di, [bp+0eh]
        lds     si, [bp+0ah]
        mov     cx, word ptr [bp+8]
        mov     dx, word ptr [bp+6]
        callf   TEXT1_SEG:X_004C2           ; -> text1 +0x004c2 (no label)
        pop     ds
        pop     si
        pop     di
        leave
        retf    0ch

; copies in 400h-word chunks through the shared word buffer:
; smem_read_words in, flash_write_words out.
smem_copy_buffered:
        push    bp
        mov     bp, sp
        push    si
        mov     si, 400h
        mov     ax, word ptr [bp+8]
        or      ax, word ptr [bp+6]
        je      br_01094

loop_01045:
        sub     ax, ax
        cmp     word ptr [bp+8], ax
        ja      br_01056
        jb      X_01053
        cmp     word ptr [bp+6], si
        jae     br_01056

X_01053:
        mov     si, word ptr [bp+6]

br_01056:
        push    word ptr [bp+10h]
        push    word ptr [bp+0eh]
        push    ds
        push    BUF_XFER
        push    si
        nop
        push    cs
        call    smem_read_words
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    ds
        push    BUF_XFER
        push    si
        nop
        push    cs
        call    flash_write_words
        mov     ax, si
        sub     dx, dx
        add     word ptr [bp+0eh], ax
        adc     word ptr [bp+10h], dx
        add     word ptr [bp+0ah], ax
        adc     word ptr [bp+0ch], dx
        sub     word ptr [bp+6], si
        sbb     word ptr [bp+8], dx
        mov     ax, word ptr [bp+8]
        or      ax, word ptr [bp+6]
        jne     loop_01045
br_01094:
        pop     si
        leave
        retf    0ch
        db      00h

; range-overlap check over [bp+0Ch]/[bp+0Eh]/[bp+10h], then clamps.
input_handler:
        enter   10h, 0
        push    si
        mov     ax, word ptr [bp+8]
        or      ax, word ptr [bp+6]
        jne     br_010AA
        jmp     br_011D4

br_010AA:
        mov     ax, word ptr [bp+0eh]
        mov     dx, word ptr [bp+10h]
        cmp     word ptr [bp+0ch], dx
        jle     br_010B8
        jmp     br_0113A

br_010B8:
        jl      br_010BF
        cmp     word ptr [bp+0ah], ax
        jae     br_0113A

br_010BF:
        mov     si, 400h
        mov     ax, word ptr [bp+8]
        or      ax, word ptr [bp+6]
        jne     loop_010CD
        jmp     br_011D4

loop_010CD:
        sub     ax, ax
        cmp     word ptr [bp+8], ax
        ja      br_010DE
        jb      L_010DB
        cmp     word ptr [bp+6], si
        jae     br_010DE

L_010DB:
        mov     si, word ptr [bp+6]

br_010DE:
        push    word ptr [bp+10h]
        push    word ptr [bp+0eh]
        push    ds
        push    BUF_XFER
        push    si
        nop
        push    cs
        call    smem_read_words
        mov     ax, si
        sub     dx, dx
        add     word ptr [bp+0eh], ax
        adc     word ptr [bp+10h], dx
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    ds
        push    BUF_XFER
        push    si
        mov     word ptr [bp-4], si
        mov     word ptr [bp-2], dx
        mov     word ptr [bp-8], si
        mov     word ptr [bp-6], dx
        nop
        push    cs
        call    flash_write_words
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        add     word ptr [bp+0ah], ax
        adc     word ptr [bp+0ch], dx
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        sub     word ptr [bp+6], ax
        sbb     word ptr [bp+8], dx
        mov     ax, word ptr [bp+8]
        or      ax, word ptr [bp+6]
        jne     loop_010CD
        pop     si
        leave
        retf    0ch
        db      90h
br_0113A:
        cmp     word ptr [bp+0ch], dx
        jge     br_01142
        jmp     br_011D4

br_01142:
        jg      br_0114C
        cmp     word ptr [bp+0ah], ax
        ja      br_0114C
        jmp     br_011D4

br_0114C:
; ? isr_midi @0x0c90e is mid-instruction
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        or      dx, dx
        jne     L_0115B
        cmp     ax, 400h
        jbe     br_0115E

L_0115B:
        mov     ax, 400h

br_0115E:
        mov     si, ax
        mov     ax, word ptr [bp+6]
        add     word ptr [bp+0eh], ax
        adc     word ptr [bp+10h], dx
        add     word ptr [bp+0ah], ax
        adc     word ptr [bp+0ch], dx

loop_0116F:
        sub     ax, ax
        cmp     word ptr [bp+8], ax
        ja      br_01180
        jb      L_0117D
        cmp     word ptr [bp+6], si
        jae     br_01180

L_0117D:
        mov     si, word ptr [bp+6]

br_01180:
        sub     dx, dx
        sub     word ptr [bp+0eh], si
        sbb     word ptr [bp+10h], dx
        push    word ptr [bp+10h]
        push    word ptr [bp+0eh]
        push    ds
        push    BUF_XFER
        push    si
        mov     word ptr [bp-0ch], si
        mov     word ptr [bp-0ah], dx
        mov     word ptr [bp-10h], si
        mov     word ptr [bp-0eh], dx
        nop
        push    cs
        call    smem_read_words
        mov     ax, word ptr [bp-10h]
        mov     dx, word ptr [bp-0eh]
        sub     word ptr [bp+0ah], ax
        sbb     word ptr [bp+0ch], dx
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    ds
        push    BUF_XFER
        push    si
        nop
        push    cs
        call    flash_write_words
        mov     ax, word ptr [bp-0ch]
        mov     dx, word ptr [bp-0ah]
        sub     word ptr [bp+6], ax
        sbb     word ptr [bp+8], dx
        mov     ax, word ptr [bp+8]
        or      ax, word ptr [bp+6]
        jne     loop_0116F

br_011D4:
        pop     si
        leave
        retf    0ch
        db      00h
; fills the shared word buffer with a repeated byte and flash_write_words it
; out in 400h-word chunks.

smem_fill:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     al, byte ptr [bp+0ah]
        mov     bx, BUF_XFER
        mov     cx, 400h
        mov     di, bx
        push    ds
        pop     es
        mov     ah, al
        rep stosw

loop_011F0:
        cmp     word ptr [bp+8], 0
        jl      br_01204
        jg      br_011FF
        cmp     word ptr [bp+6], 400h
        jbe     br_01204

br_011FF:
        mov     si, 400h
        jmp     br_01207

br_01204:
        mov     si, word ptr [bp+6]

br_01207:
        sub     cx, cx
        sub     word ptr [bp+6], si
        sbb     word ptr [bp+8], cx
        mov     cx, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     cx, word ptr [bp+0ch]
        adc     dx, word ptr [bp+0eh]
        push    dx
        push    cx
        push    ds
        push    BUF_XFER
        push    si
        nop
        push    cs
        call    flash_write_words
        mov     ax, word ptr [bp+8]
        or      ax, word ptr [bp+6]
        jne     loop_011F0
        pop     si
        pop     di
        leave
        retf    0ah
        db      00h
; ? 32-bit divide by 113Ah = 4410 = 44100/10.
samples_to_tenths:
        push    bp
        mov     bp, sp
        push    0
        push    113ah
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   TEXT1_SEG:__aFldiv
        leave
        retf    4
        db      00h
X_0124E:
        pusha
        push    ds
        push    es
        mov     bp, sp
        sub     sp, 4
        push    ds
        mov     ax, DATA_SEG
        mov     ds, ax
        cld
        sti
        nop
        push    cs
        call    X_00E76
        add     ax, ax
        adc     dx, dx
        mov     cx, ax
        mov     bx, dx
        mov     word ptr [bp+0eh], dx
        mov     word ptr [bp+12h], ax
        mov     sp, bp
        pop     es
        pop     ds
        popa
        iret
        db      00h

; ? misnomer: rounds a 32-bit address up to a paragraph boundary.
mem_io_handler:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        add     ax, 0fh
        adc     dx, 0
        and     al, 0f0h
        mov     word ptr [bp+8], ax
        mov     word ptr [bp+0ah], dx
        cmp     word ptr [bp+6], 0
        je      br_0129B
        shl     word ptr [bp+8], 1
        if      FW_VERSION = 150
sample_playback_start:
        endif
        rcl     word ptr [bp+0ah], 1

br_0129B:
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        callf   TEXT1_SEG:smem_alloc
        les     bx, [bp+0ch]
        mov     word ptr es:[bx], ax
        cmp     ax, 0ffffh
        jne     br_012BE
        mov     word ptr [G_ERRNO], ERR_NO_MEMORY
        xor     ax, ax
        leave
        retf    0ah
        db      90h

br_012BE:
        mov     ax, 1
        leave
        retf    0ah
        db      90h

; AND AL,0FCh on the port-0C0h shadow: Vpp and board enable both off.
flash_board_idle:
        nop
        push    cs
        call    port_c0_read
        and     al, 0fch
        nop
        push    cs
        call    port_c0_write
        retf
        db      00h
flash_vpp_on:
        nop
        push    cs
        call    port_c0_read
        or      al, 3
        nop
        push    cs
        call    port_c0_write
        retf
        db      00h
far_012E2:
        nop
        push    cs
        call    port_c0_read
        or      al, 2
        nop
        push    cs
        call    port_c0_write
        retf
        db      00h
far_012F0:
        nop
        push    cs
        call    flash_board_idle
        nop
        push    cs
        call    far_012E2
        retf
        db      00h

; Vpp on before erase or program: OR AL,3 on the port-0C0h shadow.
; ? one bank's JEDEC identifier pair; four calls from flash_board_detect.
flash_read_identifier:
        enter   6, 0
        push    si
        mov     si, word ptr [bp+6]
        mov     word ptr [bp-2], 90h
        push    word ptr [bp+0ah]
        if      FW_VERSION = 172
; far-called from the EXE
sample_playback_start:
        endif
        push    word ptr [bp+8]
        lea     ax, [bp-2]
        push    ss
        push    ax
        push    1
        nop
        push    cs
        call    flash_write_words
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        lea     ax, [bp-6]
        push    ss
        push    ax
        push    2
        nop
        push    cs
        call    smem_read_words
        mov     ax, word ptr [bp-6]
        mov     dx, word ptr [bp-4]
        mov     word ptr ss:[si], ax
        mov     word ptr ss:[si+2], dx
        mov     ax, si
        mov     dx, ss
        pop     si
        leave
        retf    6
        db      00h
mem_op_wrapper_2:
        enter   4, 0
        push    si
        mov     si, word ptr [bp+6]
        mov     word ptr [bp-2], 70h
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        lea     ax, [bp-2]
        push    ss
        push    ax
        push    1
        nop
; ?
L_0135F:
        push    cs
        call    flash_write_words
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        lea     ax, [bp-4]
        push    ss
        push    ax
        push    1
        nop
        push    cs
        call    smem_read_words
        mov     ax, word ptr [bp-4]
        mov     word ptr ss:[si], ax
        mov     ax, si
        mov     dx, ss
        pop     si
        leave
        retf    6
mem_op_wrapper_3:
        enter   8, 0
        push    si
        mov     si, word ptr [bp+6]
        and     word ptr [bp+8], 8000h
        mov     word ptr [bp-2], 71h
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        or      al, 2
        push    dx
        push    ax
        lea     cx, [bp-2]
        push    ss
        push    cx
        push    1
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        nop
        push    cs
        call    flash_write_words
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        lea     ax, [bp-4]
        push    ss
        push    ax
        push    1
        nop
        push    cs
        call    smem_read_words
        mov     ax, word ptr [bp-4]
        mov     word ptr ss:[si], ax
        mov     ax, si
        mov     dx, ss
        pop     si
        leave
        retf    6
        db      00h
io_delay_wait:
        enter   2, 0
        mov     word ptr [bp-2], 0ffh
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        lea     ax, [bp-2]
        push    ss
        push    ax
        push    1
        nop
        push    cs
        call    flash_write_words
        leave
        retf    4
        db      00h

mem_op_wrapper_4:
        enter   6, 0
        push    si
        mov     si, word ptr [bp+6]
; flash command E0h (Page Buffer Write) then two count cycles.
flash_page_buffer_write:
        mov     word ptr [bp-6], 0e0h
        lea     ax, [si-1]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], 0
        push    word ptr [bp+0eh]
        push    word ptr [bp+0ch]
        lea     ax, [bp-6]
        push    ss
        push    ax
        push    3
        nop
        push    cs
        call    flash_write_words
        push    word ptr [bp+0eh]
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    si
        nop
        push    cs
        call    flash_write_words
        pop     si
        leave
        retf    0ah
        db      00h

mem_op_wrapper_5:
; ? sample_loop_handler @0x0cbf8 is mid-instruction
        enter   6, 0
; flash command 0Ch (Page Buffer Write to Flash) then two count cycles.
flash_page_buffer_commit:
        mov     word ptr [bp-6], 0ch
        mov     ax, word ptr [bp+6]
        dec     ax
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], 0
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        lea     ax, [bp-6]
        push    ss
        push    ax
        push    2
        nop
        push    cs
        call    flash_write_words
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        lea     ax, [bp-2]
        push    ss
        push    ax
        push    1
        nop
        push    cs
        call    flash_write_words
        leave
        retf    6
        db      00h

mem_op_handler:
        enter   4, 0
        push    si

L_01479:
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        lea     ax, [bp-2]
        push    ax
        nop
        push    cs
        call    mem_op_wrapper_3
        mov     bx, ax
        mov     ax, word ptr ss:[bx]
        mov     word ptr [bp-4], ax
; spins on XSR bit 3 clear (TEST 8 / JNE retry).  bit name inferred.  ?
flash_wait_pagebuf_free:
        test    byte ptr [bp-4], 8
        jne     L_01479
        mov     si, word ptr [bp+6]
        nop
        push    cs
        call    flash_vpp_on
        mov     ax, word ptr [bp-4]
        mov     word ptr ss:[si], ax
        mov     ax, si
        mov     dx, ss
        pop     si
        leave
        retf    6
; code, not data: sample_end_handler @0x0cc6d
        db      00h

io_delay_wait2:
        enter   6, 0

L_014B2:
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        lea     ax, [bp-4]
        push    ax
        nop
        push    cs
        call    mem_op_wrapper_2
        mov     bx, ax
        mov     ax, word ptr ss:[bx]
        mov     word ptr [bp-2], ax
; spins on SR bit 7 (WSMS) set: TEST [bp-2],80h / JE retry.
flash_wait_wsms:
        test    byte ptr [bp-2], 80h
        je      L_014B2
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    io_delay_wait
        nop
        push    cs
        call    port_c0_read
; Vpp off: AND AL,0FEh / OR AL,2 on the port-0C0h shadow.
flash_vpp_off:
        and     al, 0feh
        or      al, 2
        nop
        push    cs
        call    port_c0_write
; tests the SR error mask 78h (bits 6..3).  The EXE uses 38h after erase.
flash_check_errors:
        test    byte ptr [bp-2], 78h
        jne     br_014F6
        mov     ax, 1
        leave
        retf    4
        db      90h

br_014F6:
        test    byte ptr [bp-2], 20h
        je      far_t2_01519
        test    byte ptr [bp-2], 10h
        je      far_t2_01519
        mov     word ptr [bp-6], 50h
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        lea     ax, [bp-6]
        push    ss
        push    ax
        push    1
        nop
        push    cs
        call    flash_write_words

far_t2_01519:
        xor     ax, ax
        leave
        retf    4
        db      00h

system_call_handler:
        enter   4, 0
        push    si

L_01525:
        push    word ptr [bp+0eh]
        push    word ptr [bp+0ch]
        lea     ax, [bp-2]
        push    ax
; far-called from the EXE
sample_pitch_calc:
        nop
        push    cs
        call    mem_op_handler
        mov     bx, ax
        mov     ax, word ptr ss:[bx]
        mov     word ptr [bp-4], ax
; spins on XSR bits 1 and 2 set; companion test at 0CD02h.  ?
flash_wait_pagebuf_avail:
        test    byte ptr [bp-4], 2
        je      L_01525
; second half of the XSR bits-1-and-2 test.  ?
flash_wait_pagebuf_avail_2:
        test    byte ptr [bp-4], 4
        je      L_01525
        mov     si, word ptr [bp+6]
        push    word ptr [bp+0eh]
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    si
        nop
        push    cs
        call    mem_op_wrapper_4
        push    word ptr [bp+0eh]
        push    word ptr [bp+0ch]
        push    si
        nop
        push    cs
        call    mem_op_wrapper_5
        push    word ptr [bp+0eh]
        push    word ptr [bp+0ch]
        nop
        push    cs
        call    io_delay_wait2
        pop     si
        leave
        retf    0ah
        db      00h

string_memop_setup:
        enter   6, 0
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        lea     ax, [bp-2]
        push    ax
        nop
        push    cs
        call    mem_op_handler
; block erase: command 20h (setup) then D0h (confirm).
flash_block_erase:
        mov     word ptr [bp-6], 20h
        mov     word ptr [bp-4], 0d0h
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        lea     ax, [bp-6]
        push    ss
        push    ax
        push    2
        nop
; called from EXE
stack_frame_fn_cd65:
        push    cs
        call    flash_write_words
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    io_delay_wait2
        leave
        retf    4
memcpy_far_seg:
        enter   6, 0
        push    di
        push    si
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
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
        mov     ax, word ptr [bp+8]
        shl     ax, 0ch
        mov     word ptr [bp-6], ax
        mov     bx, word ptr [bp+6]
        push    ds
        mov     di, bx
        lea     si, [bp-6]
        mov     ax, ss
        mov     es, ax
        mov     ds, ax
        movsw
        movsw
        movsw
        pop     ds
        mov     ax, bx
        mov     dx, ss
        pop     si
        pop     di
        leave
        retf    6
dma_01600:
        mov     word ptr [G_DMA_STATUS2_SHADOW], ax
        out     DMA_STATUS2, ax
        retf

; ? DMA_STATUS: clear bit 7, set bit 8, write the word back.
dma_status_rearm:
        in      ax, DMA_STATUS
        and     al, 7fh
        or      ah, 1
        out     DMA_STATUS, ax
        retf

L_01610:
        xor     bx, bx

X_01612:
        mov     ax, bx
        or      ah, 0ah
        out     DMA_CTRL, ax
        mov     ax, 3
        out     DMA_DATA_LO, ax
        xor     ax, ax
        out     DMA_DATA_HI, ax
        inc     bx
        cmp     bx, 20h
        jl      X_01612
        retf
        db      00h

L_0162A:
        push    si
        xor     si, si

dma_0162D:
        push    si
        push    ds
        push    P_05E4
        push    7fffh
        nop
        push    cs
        call    dma_field_write
        inc     si
        cmp     si, 20h
        jl      dma_0162D
        xor     ax, ax
        out     DMA_STATUS, ax

lcd_write_cmd_CE04:
        in      al, DMA_STATUS
        test    al, 80h
        jne     lcd_write_cmd_CE04
        nop
        push    cs
        call    L_01610
        pop     si
        retf
        db      00h

DMA_FIELD_FLAGS_OFS             equ 6
DMA_FIELD_CTRL_OFS              equ 0ch
        include "../../../common/dma_field_write.inc"
        retf    8
        ifndef  DFW_GUARD_SEG           ; the guard's popf took it
        db      00h
        endif
        push    ax
        push    ds
        push    P_05E4
        push    1e7eh
        nop
        push    cs
        call    dma_field_write
        retf

X_01806:
        push    ax
        push    ds
        push    P_05E4
        push    18h
        nop
        push    cs
        call    dma_field_write
        retf
        db      00h

; CLI-protected MPC-ASIC access: OUT 0C031h=3, then polls.
mpc_poll_status:
        push    bp
        mov     bp, sp
        push    si
        mov     si, ds
        shl     si, 4
        add     si, BUF_XFER
        mov     ax, 3
        mov     dx, 0c031h
        out     dx, al
        pushf
        cli

loop_0182A:
        mov     dx, 0c034h
        in      ax, dx
        mov     cx, si
        sub     al, cl
        test    al, 2
        je      loop_0182A

loop_01836:
        in      ax, dx
        sub     al, cl
        test    al, 2
        jne     loop_01836
        mov     dx, 0c03fh
        in      al, dx
        or      al, 8
        sub     ah, ah
        out     dx, al
        popf
        pop     si
        leave
        retf
X_0184A:
        out     DMA_CTRL, ax
        in      ax, DMA_DATA_LO
        shr     ax, 0ch
        mov     cx, ax
        in      ax, DMA_DATA_HI
        mov     dx, ax
        in      ax, DMA_ADDR_HI
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

L_01872:
        xor     bx, bx
        if      FW_VERSION = 172

L_01874:
        else
L_0188C:
        endif
        mov     ax, bx
        or      ah, 0ah
        out     DMA_CTRL, ax
        xor     ax, ax
        if      FW_VERSION = 172
        out     84h, ax
        out     82h, ax
        add     bx, 2
        cmp     bx, 20h
        jb      L_01874
        mov     bx, 1

L_0188C:
        mov     ax, bx
        or      ah, 0ah
        out     80h, ax
        mov     ax, 8000h
        out     84h, ax
        xor     ax, ax
        out     82h, ax
        add     bx, 2
        else
        out     DMA_DATA_LO, ax
        inc     bx
        endif
        cmp     bx, 20h
        jb      L_0188C
        retf
        if      FW_VERSION = 172
        db      90h
; ASIC_REG group 1, index from the low byte of arg2; ASIC_DATA gets
        endif
; (arg1 and 0FCh) or (arg2 shr 8 and 3), gated on [610h].
asic_reg1_write:
        push    bp
; ? ctrl_io_setup_matrix @0x0d068 is mid-instruction
        mov     bp, sp
        cmp     byte ptr [P_0610], 0
        je      L_018CC
        mov     bx, word ptr [bp+8]
        mov     ax, bx
        mov     al, bl
        mov     ah, 1
        out     ASIC_REG, ax
        mov     ax, bx
        mov     al, ah
        and     ax, 3
        mov     cx, word ptr [bp+6]
        and     cl, 0fch
        or      ax, cx
        out     ASIC_DATA, ax

L_018CC:
        leave
        retf    4

asic_reg1_bank_clear:
        xor     bx, bx

L_018D2:
        mov     ax, bx
        or      ah, 1
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        inc     bx
        cmp     bx, 20h
        jl      L_018D2
        retf

dma_018ee:
        cmp     byte ptr [B_87E6], 0
        if      FW_VERSION = 172
        jne     DMA_018EE_V172
        jmp     lcd_write_data_D13C

DMA_018EE_V172:
        else
        je      lcd_write_data_D13C
        endif
        mov     ax, 600h
        out     DMA_CTRL, ax
        mov     ax, 8000h
        out     DMA_DATA_HI, ax
        xor     ax, ax
        out     DMA_CTRL, ax
        out     DMA_ADDR_HI, ax
        mov     ax, 610h
        out     DMA_CTRL, ax
        mov     ax, 8000h
        out     DMA_DATA_HI, ax
; ? no entry point at 0x0d0c9 -- mid-instruction
        mov     ax, 10h
        out     DMA_CTRL, ax
        xor     ax, ax
        out     DMA_ADDR_HI, ax
        cmp     byte ptr [P_0610], al
        je      L_0196A
        if      FW_VERSION = 172
        cmp     byte ptr [B_9D8C], al
        jne     L_0193A
        endif
        mov     ax, 700h
        out     DMA_CTRL, ax
        mov     ax, 0ff00h
        out     DMA_DATA_LO, ax
        xor     ax, ax
        out     DMA_DATA_HI, ax
        mov     ax, 710h
        out     DMA_CTRL, ax
        mov     ax, 0ffh
        out     DMA_DATA_LO, ax
        xor     ax, ax

L_01937:
        out     DMA_DATA_HI, ax
        retf
        if      FW_VERSION = 172

L_0193A:
        mov     ax, 700h
        out     DMA_CTRL, ax
        xor     ax, ax
        out     DMA_DATA_LO, ax
        mov     al, byte ptr [B_9D8C]
        add     al, al
        dec     al
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+TBL_0C38]
        cbw
        add     ah, 80h
        out     DMA_DATA_HI, ax
        mov     ax, 710h
        out     DMA_CTRL, ax
        xor     ax, ax
        out     DMA_DATA_LO, ax
        mov     al, byte ptr [bx+TBL_0C39]
        cbw
        add     ah, 80h
        jmp     L_01937

        else
        db      90h
        endif
L_0196A:
        mov     ax, 700h
        out     DMA_CTRL, ax
        xor     ax, ax
        out     8ch, ax                   ; DMA channel select
        mov     ax, 710h
; ? mid-routine: the last DMA_CTRL write of the output-level pass.

dac_out_write_d136:
        out     DMA_CTRL, ax
        xor     ax, ax
        out     8ch, ax                   ; DMA channel select

; ?
lcd_write_data_D13C:
        retf
        db      00h

; ?
lcd_write_data:
        push    bp
        mov     bp, sp
        push    di
        push    si
        if      FW_VERSION = 172
        cmp     byte ptr [B_87E6], 0
        je      L_01A05
        else
        mov     di, word ptr [bp+8]
        endif
        mov     si, word ptr [bp+6]
        shl     si, 2
        dec     si
        if      FW_VERSION = 172
        mov     di, word ptr [bp+8]
        endif
        mov     word ptr [bp+6], si
        mov     si, word ptr [bp+0ah]
dsp_0199A:
        mov     ax, 182h
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        mov     ax, 185h
        out     ASIC_REG, ax
        mov     ax, di
        out     ASIC_DATA, ax
        mov     ax, 186h
        out     ASIC_REG, ax
        mov     ax, word ptr [bp+6]
        out     ASIC_DATA, ax
        mov     ax, 182h
        out     ASIC_REG, ax
        mov     ax, si
        out     ASIC_DATA, ax
dsp_019BF:
        mov     al, byte ptr [G_PENDING_DMA_MASK]
        cbw
        mov     cl, byte ptr [G_DSP_CHAN]
        mov     dx, 1
        shl     dx, cl
        test    ax, dx
        je      L_019E7
        mov     ax, 182h
        out     ASIC_REG, ax
        xor     ax, ax
        out     ASIC_DATA, ax
        push    1
        push    ds
        push    P_89F8
        callf   TEXT1_SEG:_longjmp
        add     sp, 6

L_019E7:
        mov     ax, 180h
        out     ASIC_REG, ax
        in      ax, ASIC_DATA
        test    al, 1
        jne     dsp_019BF
        mov     ax, 182h
        out     ASIC_REG, ax
        xor     ax, ax
; ? misc_d1ba @0x0d1ba is mid-instruction
        out     ASIC_DATA, ax
        shr     word ptr [bp+6], 4
        cmp     word ptr [bp+6], 4
        ja      dsp_0199A

L_01A05:
        pop     si
        pop     di
        leave
        retf    6
        if      FW_VERSION = 172
        db      00h

        endif
L_01A0C:
        cmp     byte ptr [G_DSP_CHAN], 1
        sbb     ax, ax
        and     al, 0f9h
        add     ax, 8
        push    ax
        mov     al, byte ptr [G_DSP_CHAN]
        sub     ah, ah
        shl     ax, 0dh
        push    ax
        push    2000h
        nop
        push    cs
        call    lcd_write_data
        retf
        db      00h
timer_system:
        enter   4, 0
        push    si
        mov     byte ptr [bp-4], 20h
        mov     byte ptr [bp-3], 4
        mov     byte ptr [bp-2], 10h
        mov     byte ptr [bp-1], 2
        mov     si, word ptr [G_DSP_CHAN]
        and     si, 0ffh
        mov     al, byte ptr [bp+si-4]
        sub     ah, ah
        push    ax
        lea     ax, [si+4]
        shl     ax, 0ch
        push    ax
        push    1000h
        nop
        push    cs
        call    lcd_write_data
        pop     si
        leave
        retf
        db      00h
; stores its byte argument into the pending-operation bitmask the ISR
; dispatches on.  No port I/O.
pending_ops_set:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp+6]
        mov     byte ptr [G_PENDING_DMA_MASK], al
        leave
        retf    2
; code, not data: misc_d231 @0x0d231
        db      00h
; the pending-operation interrupt: each set bit of G_PENDING_DMA_MASK is a
; channel's DMA.
L_01A70:
        pusha
        push    ds
        push    es
        mov     bp, sp
        push    ds
        mov     ax, DATA_SEG
        mov     ds, ax
        cld
        sti
        cmp     byte ptr [G_PENDING_DMA_MASK], 0
        je      L_01ACD
        cmp     byte ptr [P_0610], 0
        je      L_01ACD
        nop
        push    cs
        call    dma_018ee
        test    byte ptr [G_PENDING_DMA_MASK], 1
        je      L_01A9E
        push    0
        nop
        push    cs
        call    smem_dma_channel_01

L_01A9E:
        test    byte ptr [G_PENDING_DMA_MASK], 2
        je      L_01AAC
        push    1
        nop
        push    cs
        call    smem_dma_channel_01
; code, not data: voice_dispatch_indirect @0x0d272

L_01AAC:
        test    byte ptr [G_PENDING_DMA_MASK], 4
        je      L_01ABA
        push    2
        nop
        push    cs
        call    smem_dma_channel_23

L_01ABA:
        test    byte ptr [G_PENDING_DMA_MASK], 8
        if      FW_VERSION = 172
; code, not data: voice_config_handler @0x0d282
        je      L_01AC8
        else
        je      L_01ACD
        endif
        push    3
        nop
        push    cs
        call    smem_dma_channel_23
        if      FW_VERSION = 172

L_01AC8:
        mov     byte ptr [G_PENDING_DMA_MASK], 0

        endif
L_01ACD:
        mov     sp, bp
        pop     es
        pop     ds
        popa
        iret
        if      FW_VERSION = 172
        db      00h

        endif
fx_dsp_reload_all:
        nop
        push    cs
        call    dma_018ee
        push    0
        nop
        push    cs
        call    smem_dma_channel_01
        push    1
        nop
        push    cs
        call    smem_dma_channel_01
        push    2
        nop
        push    cs
        call    smem_dma_channel_23
        push    3
        nop
        push    cs
        call    smem_dma_channel_23
        retf
smem_dma_channel_01:
        push    bp
        mov     bp, sp
        cmp     byte ptr [bp+6], 2
        jae     lcd_clear_region_impl_D2DC
        mov     al, byte ptr [bp+6]
        push    ax
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    channel_validate
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+FXS_FIELD_45]
        push    ax
        nop
        push    cs
        call    lcd_clear_region_impl
lcd_clear_region_impl_D2DC:
        leave
        retf    2
lcd_clear_region_impl:
        push    bp
        mov     bp, sp
        cmp     byte ptr [bp+8], 2
        jae     br_01B68
        mov     cl, byte ptr [bp+8]
        mov     al, 1
        shl     al, cl
        not     al
        and     byte ptr [G_PENDING_DMA_MASK], al
        push    ds
        push    P_89F8
        callf   TEXT1_SEG:__setjmp
        mov     sp, bp
        or      ax, ax
        jne     br_01B68
        mov     al, byte ptr [bp+8]
        mov     byte ptr [G_DSP_CHAN], al
        mov     al, byte ptr [bp+6]
        mov     byte ptr [B_8972], al
        test    al, 1
        je      br_01B5E
        nop
        push    cs
        call    dsp_chan_reg_clear
        leave
        retf    4

br_01B5E:
        nop
        push    cs
        call    far_01B6C
        nop
        push    cs
        call    lcd_write_block_D3B2

br_01B68:
        leave
        retf    4

far_01B6C:
        callf   TEXT1_SEG:far_005A2
        callf   TEXT1_SEG:X_00A5E
        retf
        db      00h

smem_dma_channel_23:
        push    bp
        mov     bp, sp
; called from EXE
misc_d33b:
        cmp     byte ptr [bp+6], 4
        jae     lcd_clear_rect_D35E
        mov     al, byte ptr [bp+6]
        push    ax
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    channel_get_ptr
        add     sp, 2
        mov     bx, ax
        mov     es, dx
; ? voice_string_access @0x0d356 is mid-instruction
        mov     al, byte ptr es:[bx+FXR_FIELD_01]
        push    ax
        nop
        push    cs
        call    lcd_clear_rect

lcd_clear_rect_D35E:
        leave
        retf    2

lcd_clear_rect:
        push    bp
        mov     bp, sp
        cmp     byte ptr [bp+8], 4
        jae     br_01BED
        mov     cl, byte ptr [bp+8]
        mov     al, 1
        shl     al, cl
        not     al
        and     byte ptr [G_PENDING_DMA_MASK], al
        push    ds
        push    P_89F8
        callf   TEXT1_SEG:__setjmp
        mov     sp, bp

L_01BC3:
        or      ax, ax
        jne     br_01BED
        mov     al, byte ptr [bp+8]
        mov     byte ptr [G_DSP_CHAN], al
        mov     al, byte ptr [bp+6]
        mov     byte ptr [B_8972], al
        test    al, 2
        jne     br_01BE8
        test    byte ptr [B_8972], 1
; character translation inside the copy loop
string_char_translate:
        jne     br_01BE8
        nop
        push    cs
        call    lcd_write_block_D3B2
        leave
        retf    4
        db      90h

br_01BE8:
        nop
        push    cs
        call    L_01D18

br_01BED:
        leave
        retf    4
        db      00h

lcd_write_block_D3B2:
        callf   TEXT1_SEG:X_0188D
        callf   TEXT1_SEG:far_01AE1
        retf
        db      00h

DSP_CHAN_ADDR                   equ G_DSP_CHAN
        include "../../../common/dsp_chan_clear.inc"
        nop
        push    cs
        call    channel_validate
        include "../../../common/dsp_chan_clear2.inc"
; ? far-calls TEXT1 01C64h: matches DL against +2 of both T_DSP_CHAN blocks
; AL is 0; DH/DL are two byte arguments
dsp_chan_update:
        push    bp
        mov     bp, sp
        mov     al, 0
        mov     dl, byte ptr [bp+8]
        mov     dh, byte ptr [bp+6]
        callf   TEXT1_SEG:X_01C64
        leave
        retf    4

; CLI-protected MPC-ASIC access: IN/OUT 0C038h.
mpc_poll_data:
        enter   2, 0
        pushf
        cli
        mov     dx, 0c038h
        in      ax, dx
; called from EXE
stack_frame_fn_d512:
        mov     word ptr [bp-2], ax
        or      al, 4
        out     dx, ax
        mov     dx, 0c03fh
        in      al, dx
        sub     ah, ah
        or      ax, word ptr [bp+6]
        out     dx, al
        mov     ax, word ptr [bp-2]
        mov     dx, 0c038h
        out     dx, ax
        popf
        leave
        retf    2
mpc_poll_data2:
        enter   2, 0
        not     word ptr [bp+6]
        pushf
        cli
        mov     dx, 0c038h
        in      ax, dx
        mov     word ptr [bp-2], ax
        or      al, 4
        out     dx, ax
        mov     dx, 0c03fh
        in      al, dx
        and     al, byte ptr [bp+6]
        sub     ah, ah
        out     dx, al
        mov     ax, word ptr [bp-2]
        mov     dx, 0c038h
        out     dx, ax
        popf
        leave
        retf    2
        db      00h
; as mpc_poll_data on 0C038h/0C03Fh, but ANDs the inverted caller mask.
far_01D98:
        push    di
        xor     ax, ax
        mov     cx, 0c0h
        mov     di, NOTE_HELD
        push    ds
        pop     es
        rep stosw
        pop     di
        retf
        db      00h

; ? misnomer: dispatches on a MIDI status byte's high nibble, AL & 0F0h.
sound_event_dispatch:
        push    bp
        mov     bp, sp
; ? misc_d56d @0x0d56d is mid-instruction
        mov     al, byte ptr [bp+6]
        and     ax, MS_STATUS_MASK
        je      L_01DCA
        sub     ax, MS_NOTE_OFF
        je      br_01E30
        sub     ax, MS_NOTE_ON-MS_NOTE_OFF
        je      br_01DEC
        sub     ax, MS_CONTROL-MS_NOTE_ON
        je      br_01DFE
        sub     ax, MS_PROGRAM-MS_CONTROL
        je      br_01E0E
        leave
        retf
        db      90h

L_01DCA:
        cmp     byte ptr [MIDI_LOCAL_MODE], 0
        je      br_01E3A
        mov     al, byte ptr [bp+6]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [bp+7]
        push    ax
        mov     al, byte ptr [bp+8]
        push    ax
; range check with conditional adjustment
sample_range_check:
        nop
        push    cs
        call    voice_param_proc
        nop
        push    cs
        call    cmd_far_stub2
        leave
        retf
        db      90h
br_01DEC:
        cmp     byte ptr [bp+8], 0
        je      br_01E30
        lea     ax, [bp+6]
        push    ss
        push    ax
        nop
        push    cs
        call    pad_event_dispatch
        leave
        retf
br_01DFE:
        mov     al, byte ptr [bp+7]
        push    ax
        mov     al, byte ptr [bp+8]
        push    ax
        nop
        push    cs
        call    smem_addr_data_ctrl2
        leave
        retf
        db      90h
br_01E0E:
        test    byte ptr [B_9D1C], 1
        jne     br_01E3A
        cmp     byte ptr [MIDI_LOCAL_MODE], 0
        je      br_01E3A
        cmp     byte ptr [PGM_CHANGE_RX], 0
        je      br_01E3A
        mov     al, byte ptr [bp+7]
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    smem_addr_data_ctrl
        leave
        retf

br_01E30:
        lea     ax, [bp+6]
        push    ss
        push    ax
        nop
        push    cs
        call    smem_addr_data_status

br_01E3A:
        leave
        retf

; MIDI program change: selects the program whose PGM_MIDI_PGM matches.
smem_addr_data_ctrl:
        push    bp
        mov     bp, sp
        push    di
        push    si
        xor     cx, cx
        mov     si, PGM_TABLE
        mov     di, word ptr [bp+6]

loop_01E49:
        les     bx, [si]
        cmp     word ptr es:[bx], PGM_BLK_FREE
        jbe     L_01E5A
        mov     al, byte ptr es:[bx+PGM_MIDI_PGM]
        cbw
        cmp     ax, di
        je      br_01E6A

L_01E5A:
        add     si, 4
; called from EXE
misc_d61d:
        inc     cx
        cmp     cx, 18h
        jl      loop_01E49
        pop     si
        pop     di
        leave
        retf    2
        db      90h

br_01E6A:
        mov     al, byte ptr [PGM_SLOT]
        cbw
        cmp     ax, cx
        je      br_01E8A
        push    cx
        nop
        push    cs
        call    program_select
        mov     ax, word ptr [FP_POLL_HOOK_SEG]
        or      ax, word ptr [FP_POLL_HOOK]
        je      br_01E85
        callf   [FP_POLL_HOOK]

br_01E85:
        nop
        push    cs
        call    cmd_far_stub2

br_01E8A:
        pop     si
        pop     di
        leave
        retf    2
; MIDI control change: ctrl, value.  Only with MIDI_LOCAL_MODE on.
smem_addr_data_ctrl2:
        push    bp
        mov     bp, sp
        cmp     byte ptr [MIDI_LOCAL_MODE], 0
        je      br_01EFB
        mov     al, byte ptr [bp+8]
        push    ax
        mov     cl, byte ptr [bp+6]
        push    cx
        nop
        push    cs
        call    dsp_chan_update
        mov     al, byte ptr [bp+8]
        sub     ah, ah
        cmp     ax, MCC_ALL_SOUND_OFF
        je      tgt_01EE0
        jg      tgt_01EBC
        sub     ax, MCC_VOLUME
        je      tgt_01ECE
        leave
        retf    4
tgt_01EBC:
        sub     ax, MCC_RESET_CTRLS
        je      br_01EEC
        dec     ax
        dec     ax
        jl      br_01EFB
        sub     ax, MCC_POLY_ON-MCC_ALL_NOTES_OFF
        jle     br_01EF6
        leave
        retf    4
tgt_01ECE:
        cmp     byte ptr [MIDI_VOLUME_RX], 0
        je      br_01EFB
        mov     al, byte ptr [bp+6]
        mov     byte ptr [MIDI_VOLUME_VAL], al
        leave
        retf    4
        db      90h
tgt_01EE0:
        push    0
        nop
        push    cs
        call    far_01F00
        leave
        retf    4
        db      90h

br_01EEC:
        mov     byte ptr [MIDI_VOLUME_VAL], 7fh
        leave
        retf    4
        db      90h

br_01EF6:
        nop
        push    cs
        call    sample_dma_setup_large

br_01EFB:
        leave
        retf    4
        db      00h

; all sound off: release every voice, clear NOTE_HELD.
far_01F00:
        push    di
        push    si
        xor     si, si
        mov     di, VOICE_TIMER

loop_01F07:
        cmp     word ptr [di], 0
        je      br_01F12
        push    si
        nop
        push    cs
        call    voice_release

br_01F12:
        add     di, 2
        inc     si
        cmp     si, 20h
        jb      loop_01F07
        nop
        push    cs
        call    far_01D98
        pop     si
        pop     di
        retf    2
        db      90h
; MIDI note off, and note on at velocity 0.
smem_addr_data_status:
        push    bp
        mov     bp, sp
        les     bx, [bp+6]
        sub     ah, ah
        mov     al, byte ptr es:[bx+1]
        push    ax
        nop
        push    cs
        call    pad_note_release
        leave
        retf    4

; note-off for the note and the two variation notes that pad_note_trigger
; recorded in its stride-3 table.
pad_note_release:
        enter   2, 0
        push    si
        mov     si, word ptr [bp+6]
        mov     bx, si
; called from EXE
misc_d706:
        add     bx, si
; formats via far call 03594h
string_format_data:
        add     bx, si
        mov     word ptr [bp-2], bx
        cmp     byte ptr [bx+NOTE_HELD], 0
        je      br_01F7D
        mov     byte ptr [bx+NOTE_HELD], 0
        push    si
        nop
        push    cs
        call    note_off_voices
        mov     bx, word ptr [bp-2]
        sub     ah, ah
        mov     al, byte ptr [bx+NOTE_HELD_ALT1]
        push    ax
        nop
        push    cs
        call    note_off_voices
; called from EXE
stack_frame_fn_d72e:
        mov     bx, word ptr [bp-2]
        sub     ah, ah
        mov     al, byte ptr [bx+NOTE_HELD_ALT2]
        push    ax
        nop
        push    cs
        call    note_off_voices

br_01F7D:
        pop     si
        leave
        retf    2

note_off_voices:
        enter   2, 0
        push    di
        push    si
        mov     ax, word ptr [bp+6]
        sub     ax, 23h
; ? sample_ptr_validate @0x0d750 is mid-instruction
        cmp     ax, 3fh
        ja      br_01FE5
        mov     word ptr [bp-2], 0
        mov     si, VOICE_TABLE
        mov     di, VOICE_TIMER
loop_01F9E:
        cmp     word ptr [di], 0
        je      br_01FD6
        mov     al, byte ptr [si]
        sub     ah, ah
        cmp     word ptr [bp+6], ax
        jne     br_01FD6
        cmp     byte ptr [si+1], 2
        jne     br_01FD6
        cmp     byte ptr [si+3], ah
        je      br_01FCE
        cmp     byte ptr [si+2], ah
        jne     br_01FCE
        cmp     word ptr [di-40h], -1
        jne     br_01FD6
        mov     ax, word ptr [si+8]
        mov     word ptr [di], ax
        mov     word ptr [di-40h], 1
        jmp     br_01FD6
br_01FCE:
        push    word ptr [bp-2]
        nop
        push    cs
        call    voice_release

br_01FD6:
        add     si, 12h
        add     di, 2
        inc     word ptr [bp-2]
        cmp     word ptr [bp-2], 20h
        jb      loop_01F9E

br_01FE5:
        pop     si
        pop     di
        leave
        retf    2
        db      00h

; multi-block DMA configuration with loop state
sample_dma_setup_large:
        push    si
        xor     si, si

L_01FEF:
        push    si
        nop
        push    cs
        call    pad_note_release
        inc     si
; called from EXE
far_dispatch_d7b6:
        cmp     si, 80h
        jl      L_01FEF
        pop     si
        retf

string_scan_status:
        enter   4, 0
        push    0
        push    2
; ? no entry point at 0x0d7c7 -- mid-instruction
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   TEXT1_SEG:__aFldiv
        add     ax, word ptr [bp+0ah]
        adc     dx, word ptr [bp+0ch]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        cmp     dx, word ptr [bp+0ch]
        jg      br_02033
        jl      br_02029
        cmp     ax, word ptr [bp+0ah]
        jae     br_02033

br_02029:
        mov     word ptr [bp-4], 0ffffh
        mov     word ptr [bp-2], 7fffh

br_02033:
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        callf   TEXT1_SEG:__aFldiv
        leave
        retf    8
; accepts notes 23h..62h, latches note and velocity in the two
; last-event bytes, then pad_note_trigger.
pad_event_dispatch:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+6]
        mov     es, word ptr [bp+8]
        mov     al, byte ptr es:[si+1]
        sub     ah, ah
        sub     ax, 23h
        cmp     ax, 3fh
        ja      T2_br_020A9
        cmp     byte ptr es:[si+3], 0
        jne     br_02094
        cmp     byte ptr [G_NOTE_CAPTURE], 0
        je      br_0207C
        mov     al, byte ptr es:[si+1]
        mov     byte ptr [G_NOTE_IN], al
        mov     al, byte ptr es:[si+2]
        mov     byte ptr [G_VELOCITY_IN], al
br_0207C:
        cmp     byte ptr [PAD_INPUT_MODE], 1
        je      br_020A2
        cmp     byte ptr [PAD_INPUT_MODE], 2
        jne     T2_br_020A9
        cmp     byte ptr [MIDI_LOCAL_MODE], 0
        je      T2_br_020A9
        jmp     br_020A2
        db      90h

; ? misc_d81c @0x0d81c is mid-instruction

br_02094:
        mov     al, byte ptr es:[si+1]
        mov     byte ptr [G_NOTE_IN], al
        mov     al, byte ptr es:[si+2]
        mov     byte ptr [G_VELOCITY_IN], al

br_020A2:
        push    es
        push    si
        callf   TEXT1_SEG:pad_note_trigger

T2_br_020A9:
        pop     si
        leave
        retf    4

X_020AE:
        push    di
        mov     bx, VOICE_TABLE
        mov     cx, 20h

L_020B5:
        mov     byte ptr [bx], 0ffh
        add     bx, 12h
        dec     cx
        jne     L_020B5
        xor     ax, ax
        mov     cx, 80h
        if      FW_VERSION = 172
tgt_020C5                       equ     $+2
        endif
        mov     di, VOICE_HOLD
        push    ds
        pop     es
        rep stosw
        mov     cx, 10h
        mov     di, P_9A4E
        rep stosw
        cmp     byte ptr [B_87E6], al
        je      br_020E2
        or      byte ptr [P_9A4E], 1
        or      byte ptr [P_9A5E], 1

br_020E2:
        pop     di
        retf

voice_buf_helper_1:
        push    bp
        mov     bp, sp
        push    si
        cmp     word ptr [bp+6], 10h
        jne     br_02103
        xor     si, si

loop_020F0:
        push    si
        nop
        push    cs
        call    voice_release_full
        or      byte ptr [si+P_9A4E], 2
        add     si, 2
        cmp     si, 20h
        jl      loop_020F0

br_02103:
        pop     si
        leave
; ? no entry point at 0x0d8c6 -- mid-instruction
        retf    2

voice_buf_helper_2:
        push    bp
        mov     bp, sp
        cmp     word ptr [bp+6], 10h
        jne     X_02120
        xor     bx, bx

loop_02113:
        and     byte ptr [bx+P_9A4E], 0fdh
        add     bx, 2
        cmp     bx, 20h
        jl      loop_02113

X_02120:
        leave
        retf    2
; code, not data: isr_sequencer @0x0d8e4
X_02124:
        pusha
        push    ds
        push    es
        mov     bp, sp
        push    ds
        mov     ax, DATA_SEG
        mov     ds, ax
        cld
        cmp     byte ptr [bp+0ch], 0
        jne     X_02140
        push    10h
        nop
        push    cs
        call    voice_buf_helper_2
        jmp     SHORT X_02147
        db      90h

X_02140:
        push    10h
        nop
        push    cs
        call    voice_buf_helper_1

X_02147:
        mov     sp, bp
        pop     es
        pop     ds
        popa
        iret
        db      00h

; index 0..7Fh in four 20h ranges: register group 4, voice_release,
; register group 6, voice_release_full.
voice_timer_expire:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+6]
        cmp     si, 20h
        jge     br_02174
        mov     ax, si
        or      ah, 4
        out     DMA_CTRL, ax
        imul    bx, si, 12h
        mov     ax, word ptr [bx+P_9A7A]
; ? retf_stub_d929 @0x0d929 is mid-instruction
        out     DMA_DATA_LO, ax
        mov     ax, 8000h

dma_0216D:
        out     DMA_DATA_HI, ax
        pop     si
        leave
        retf    2

br_02174:
        cmp     si, 40h
        jge     dma_02188
        lea     ax, [si-20h]
        push    ax
        nop
        push    cs
        call    voice_release
        pop     si
        leave
        retf    2
        db      90h
dma_02188:
        cmp     si, 60h
        jge     br_021A6
        sub     si, 40h
        mov     ax, si
        or      ah, 6
        out     DMA_CTRL, ax
        imul    bx, si, 12h
        mov     ax, word ptr [bx+P_9A7C]
        out     DMA_DATA_LO, ax
        mov     ax, word ptr [bx+P_9A7E]
        jmp     dma_0216D
br_021A6:
        lea     ax, [si-60h]
        push    ax
        nop
        push    cs
        call    voice_release_full
        pop     si
        leave
        retf    2

; counts the 128-entry timer word table down by the argument and calls
; voice_timer_expire on every entry that reaches zero.
voice_timer_tick:
        push    bp
; called from EXE
misc_d975:
        mov     bp, sp
        push    di
        push    si
        xor     di, di
        mov     si, VOICE_HOLD

loop_021BE:
        mov     ax, word ptr [si]
        cmp     ax, 0
        je      L_021D9
        cmp     ax, 0ffffh
        je      L_021D9
        sub     ax, word ptr [bp+6]
        ja      L_021D7
        push    di
        nop
        push    cs
        call    voice_timer_expire
        xor     ax, ax

L_021D7:
        mov     word ptr [si], ax

L_021D9:
        add     si, 2
        inc     di
        cmp     di, 80h
        jl      loop_021BE
        pop     si
        pop     di
        leave
        retf    2
        db      00h

sample_error_handler:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp+6]
        if      FW_VERSION = 172
L_021F1                         equ     $+1
        endif
        mov     cx, ax
        mov     bx, 0ah
        sub     ax, word ptr [W_0C44]
        xor     dx, dx
        div     bx
; ? sample_process_exit @0x0d9be is mid-instruction
        or      ax, ax
        je      br_0220D
        sub     cx, dx
        mov     word ptr [W_0C44], cx
        push    ax
        nop
        push    cs
        call    voice_timer_tick

br_0220D:
; ? voice_state_update @0x0d9ce is mid-instruction
        callf   TEXT1_SEG:L_01CA7
        leave
        retf

; round-robin over the 32 voices from a rotating index; with none free it
; steals from the note id holding the most, counted into a 32-byte tally.
voice_alloc:
        enter   0ah, 0
        push    di
        push    si
        inc     byte ptr [G_VOICE_ALLOC_NEXT]
        xor     ax, ax
        mov     cx, 40h
        mov     di, TBL_4F10
        push    ds
        pop     es
        rep stosw
        mov     byte ptr [bp-2], al
        mov     si, 0ffh
        mov     byte ptr [bp-1], al
        mov     word ptr [bp-4], si
; called from EXE
misc_d9f6:
        mov     di, si

loop_02238:
        inc     byte ptr [G_VOICE_ALLOC_NEXT]
        cmp     byte ptr [G_VOICE_ALLOC_NEXT], 20h
        jl      br_02248
        mov     byte ptr [G_VOICE_ALLOC_NEXT], 0

br_02248:
        mov     al, byte ptr [G_VOICE_ALLOC_NEXT]
        cbw
        mov     bx, ax
        mov     word ptr [bp-6], ax
        cmp     byte ptr [bx+P_9A4E], 0
        jne     br_0228B
        add     bx, ax
        mov     ax, word ptr [bx+VOICE_TIMER]
        mov     word ptr [bx+TBL_VOICE_AGE_SNAP], ax
        or      ax, ax
        jne     br_02269
        jmp     L_023A4

br_02269:
        imul    bx, word ptr [bp-6], 12h
        mov     al, byte ptr [bx+VOICE_TABLE]
        sub     ah, ah
        mov     si, ax
        mov     al, byte ptr [bp-2]
        inc     byte ptr [si+TBL_4F10]
        cmp     byte ptr [si+TBL_4F10], al
        jle     br_0228B
        mov     al, byte ptr [si+TBL_4F10]
        mov     byte ptr [bp-2], al
        mov     di, si

br_0228B:
        inc     byte ptr [bp-1]
        cmp     byte ptr [bp-1], 20h
        jb      loop_02238
        mov     word ptr [bp-4], di
        mov     byte ptr [bp-1], 0

loop_0229B:
        mov     al, byte ptr [G_VOICE_ALLOC_NEXT]
        cbw
        mov     bx, ax
        cmp     byte ptr [bx+P_9A4E], 0
        je      br_022C1
        inc     byte ptr [G_VOICE_ALLOC_NEXT]
        cmp     byte ptr [G_VOICE_ALLOC_NEXT], 20h
        jl      br_022B8
        mov     byte ptr [G_VOICE_ALLOC_NEXT], 0

br_022B8:
        inc     byte ptr [bp-1]
        cmp     byte ptr [bp-1], 20h
        jb      loop_0229B

br_022C1:
        mov     bx, word ptr [bp+6]
        if      FW_VERSION = 172
        cmp     byte ptr [bx+TBL_4F10], 1
        jle     br_02316
        else
        cmp     byte ptr [bx+TBL_4F10], 0
        je      br_02316
        endif
        mov     si, 0ffffh
        mov     al, byte ptr [G_VOICE_ALLOC_NEXT]
        mov     byte ptr [bp-2], al
        mov     byte ptr [bp-1], 0
        mov     di, bx

loop_022DA:
        mov     bl, byte ptr [bp-1]
        sub     bh, bh
        mov     word ptr [bp-8], bx
        cmp     byte ptr [bx+P_9A4E], bh
        jne     br_0230A
        imul    bx, bx, 12h
        sub     ah, ah
        mov     al, byte ptr [bx+VOICE_TABLE]
        cmp     ax, di
        jne     br_0230A
        mov     bx, word ptr [bp-8]
        add     bx, bx
        mov     ax, word ptr [bx+TBL_VOICE_AGE_SNAP]
        cmp     ax, si
        jae     br_0230A
        mov     si, ax
        mov     al, byte ptr [bp-1]
        mov     byte ptr [bp-2], al

br_0230A:
        inc     byte ptr [bp-1]
        cmp     byte ptr [bp-1], 20h
        jb      loop_022DA
        jmp     br_0239E

br_02316:
        cmp     byte ptr [bp-2], 3
        jl      br_02368
        mov     si, 0ffffh
        mov     al, byte ptr [G_VOICE_ALLOC_NEXT]
        mov     byte ptr [bp-2], al
        mov     byte ptr [bp-1], 0
        mov     di, word ptr [bp-4]

L_0232C:
        mov     bl, byte ptr [bp-1]
        sub     bh, bh
        mov     word ptr [bp-8], bx
        cmp     byte ptr [bx+P_9A4E], bh
        jne     br_0235C
; called from EXE
misc_dafa:
        imul    bx, bx, 12h
        sub     ah, ah
        mov     al, byte ptr [bx+VOICE_TABLE]
        cmp     ax, di
        jne     br_0235C
        mov     bx, word ptr [bp-8]
        add     bx, bx
        mov     ax, word ptr [bx+TBL_VOICE_AGE_SNAP]
        cmp     ax, si
        jae     br_0235C
        mov     si, ax
        mov     al, byte ptr [bp-1]
        mov     byte ptr [bp-2], al

br_0235C:
        inc     byte ptr [bp-1]
        cmp     byte ptr [bp-1], 20h
        jb      L_0232C
        jmp     br_0239E
        db      90h

br_02368:
        mov     cx, 0ffffh
        mov     al, byte ptr [G_VOICE_ALLOC_NEXT]
        mov     byte ptr [bp-2], al
        mov     byte ptr [bp-1], 0

loop_02375:
        mov     bl, byte ptr [bp-1]
        sub     bh, bh
        mov     word ptr [bp-8], bx
        cmp     byte ptr [bx+P_9A4E], bh
        jne     br_02395
        add     bx, bx
        mov     ax, word ptr [bx+TBL_VOICE_AGE_SNAP]
        cmp     ax, cx
        jae     br_02395
        mov     cx, ax
        mov     al, byte ptr [bp-1]
        mov     byte ptr [bp-2], al

br_02395:
        inc     byte ptr [bp-1]
        cmp     byte ptr [bp-1], 20h
        jb      loop_02375

br_0239E:
        mov     al, byte ptr [bp-2]
        mov     byte ptr [G_VOICE_ALLOC_NEXT], al

L_023A4:
        mov     al, byte ptr [G_VOICE_ALLOC_NEXT]
        cbw
        pop     si
        pop     di
; called from EXE
retf_stub_db6a:
        leave
        retf    2

; writes voice register groups 0..7 from a 40h-byte descriptor:
; start/end/loop >>4, level, pan, then asic_reg1_write.
voice_regs_program:
        enter   8, 0
        push    si
        les     bx, [bp+6]
        mov     ax, word ptr es:[bx+VREQ_START]
        mov     dx, word ptr es:[bx+VREQ_START_HI]
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
        out     DMA_CTRL, ax
        mov     ax, dx
        or      ah, 1
        out     DMA_ADDR_HI, ax
        mov     ax, cx
        out     DMA_DATA_HI, ax
        mov     ax, si
        out     DMA_DATA_LO, ax
        mov     ax, word ptr [bp-8]
        or      ah, 1
        out     DMA_CTRL, ax
        mov     ax, word ptr es:[bx+VREQ_RATIO]
        out     DMA_DATA_LO, ax
        cmp     byte ptr es:[bx+VREQ_LOOPON], 0
        jne     dma_0240B
        jmp     dma_0248E
dma_0240B:
        mov     ax, word ptr es:[bx+VREQ_END]
        mov     dx, word ptr es:[bx+VREQ_END_HI]
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
        out     DMA_DATA_HI, ax
        cmp     word ptr es:[bx+VREQ_FIELD_22], 0
        je      L_02450
        mov     ax, dx
        out     DMA_ADDR_HI, ax
        mov     ax, word ptr [bp-8]
        or      ah, 2
        out     DMA_CTRL, ax
        mov     ax, word ptr es:[bx+VREQ_FIELD_22]
        out     DMA_DATA_HI, ax
        mov     ax, word ptr es:[bx+VREQ_FIELD_22_HI]
        neg     ax
        jmp     dma_024A4
        db      90h

L_02450:
        mov     ax, dx
        or      ah, 1
        out     DMA_ADDR_HI, ax
        mov     ax, word ptr es:[bx+VREQ_LOOP]
        mov     dx, word ptr es:[bx+VREQ_LOOP_HI]
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
; ? inside voice_regs_program, groups 2..6 of the register write.
voice_regs_program_dc3b:
        mov     ax, word ptr [bp-8]
        or      ah, 2
        out     DMA_CTRL, ax
        mov     ax, cx
        out     DMA_DATA_HI, ax
        mov     ax, dx
        or      ax, bx
        jmp     dma_024A4
        db      90h
dma_0248E:
        mov     ax, 0ffffh
        out     DMA_DATA_HI, ax
        mov     ax, 0fh
        out     DMA_ADDR_HI, ax
        mov     ax, word ptr [bp-8]
        or      ah, 2
        out     DMA_CTRL, ax
        xor     ax, ax
        out     DMA_DATA_HI, ax

dma_024A4:
        out     DMA_DATA_LO, ax
        mov     ax, word ptr [bp-8]
        or      ah, 3
        out     DMA_CTRL, ax
        xor     ax, ax
        out     8ch, ax                   ; DMA channel select
        mov     ax, word ptr [bp-8]
        or      ah, 4
        out     DMA_CTRL, ax
        mov     bx, word ptr [bp+6]
        mov     ax, word ptr es:[bx+VREQ_FIELD_12]
        out     DMA_DATA_LO, ax
        mov     ax, word ptr es:[bx+VREQ_FIELD_10]
        or      ah, 80h
        out     DMA_DATA_HI, ax
        mov     ax, word ptr [bp-8]
        or      ah, 5
        out     DMA_CTRL, ax
        mov     ax, word ptr es:[bx+VREQ_FIELD_26]
        out     DMA_DATA_LO, ax
        mov     ax, word ptr es:[bx+VREQ_FIELD_26_HI]
        out     DMA_DATA_HI, ax
        mov     ax, word ptr [bp-8]
        or      ah, 6
        out     DMA_CTRL, ax
        mov     ax, word ptr es:[bx+VREQ_FIELD_2C]
        out     DMA_DATA_LO, ax
        mov     ax, word ptr es:[bx+VREQ_FIELD_2A]
        out     DMA_DATA_HI, ax
        cmp     byte ptr es:[bx+VREQ_FIELD_09], 1
        jl      dma_0250C
        cmp     byte ptr es:[bx+VREQ_FIELD_09], 8
        jg      dma_0250C
        sub     cl, cl
; ? inside voice_regs_program, the group 7 write and the tail.
voice_regs_program_dcc4:
        mov     ch, byte ptr es:[bx+VREQ_FIELD_0A]
        neg     cx
        jmp     dma_0250E

dma_0250C:
        xor     cx, cx
dma_0250E:
        mov     ax, word ptr [bp-8]
        or      ah, 7
        out     DMA_CTRL, ax
        mov     al, byte ptr es:[bx+VREQ_FIELD_09]
        cbw
        mov     si, ax
        mov     al, byte ptr [si+TBL_0C38]
        cbw
        or      ax, cx
        out     DMA_DATA_HI, ax
        cmp     byte ptr es:[bx+VREQ_FIELD_0B], 1
        je      dma_02534
        cmp     byte ptr es:[bx+VREQ_FIELD_0B], 2
        jne     dma_0254F
dma_02534:
        mov     al, byte ptr es:[bx+VREQ_FIELD_0B]
        cbw
        mov     bx, ax
        cmp     byte ptr [bx+TBL_0611], 0
        jne     dma_0254F
        mov     bx, word ptr [bp+6]
        xor     al, al
        mov     byte ptr es:[bx+VREQ_FIELD_08], al
        mov     byte ptr es:[bx+VREQ_FIELD_07], al
dma_0254F:
        les     bx, [bp+6]
        sub     al, al
        mov     ah, byte ptr es:[bx+VREQ_FIELD_08]
        mov     cl, byte ptr es:[bx+VREQ_FIELD_07]
        sub     ch, ch
        or      ax, cx
        out     DMA_DATA_LO, ax
        cmp     byte ptr es:[bx+VREQ_FIELD_0B], 1
        jl      br_02582
        cmp     byte ptr es:[bx+VREQ_FIELD_0B], 4
        jg      br_02582
        mov     ah, byte ptr es:[bx+VREQ_FIELD_0B]
        dec     ah
        sub     al, al
        mov     si, ax
        mov     ah, byte ptr es:[bx+VREQ_FIELD_0C]
        mov     cx, ax
        jmp     br_02587

; ? misc_dd25 @0x0dd25 is mid-instruction

br_02582:
        mov     si, 200h
        xor     cx, cx

br_02587:
        sub     ah, ah
        mov     al, byte ptr es:[bx]
        or      ax, si
        push    ax
        push    cx
        nop
        push    cs
        call    asic_reg1_write
        pop     si
        leave
        retf    4
; voice_release for every one of the 32 stride-12h voice slots whose
; first byte equals the argument.
voice_release_by_note:
        push    bp
        mov     bp, sp
        push    di
        push    si
        xor     si, si
        mov     di, VOICE_TABLE
loop_025A4:
        mov     al, byte ptr [di]
        sub     ah, ah
        cmp     word ptr [bp+6], ax
        jne     br_025B3
        push    si
        nop
        push    cs
        call    voice_release
br_025B3:
        add     di, 12h
        inc     si
        cmp     si, 20h
        jl      loop_025A4
        pop     si
        pop     di
        leave
        retf    2
; programs one voice: envelope rates by division, then voice_regs_program.
voice_start:
        enter   12h, 0
        push    di
        push    si
        les     bx, [bp+0ch]
        mov     al, byte ptr es:[bx+VREQ_LOOPON]
        mov     byte ptr [bp-0fh], al
        mov     ax, word ptr es:[bx+VREQ_FIELD_3A]
        mov     cx, 0ah
        sub     dx, dx
        div     cx
        add     ax, 2
        mov     word ptr [bp-8], ax

        mov     ax, word ptr es:[bx+VREQ_FIELD_2E]
        mov     word ptr [bp-2], ax
        mov     ax, word ptr es:[bx+VREQ_FIELD_30]
        mov     word ptr [bp-4], ax
        mov     ax, word ptr es:[bx+VREQ_FIELD_14]
        mov     word ptr [bp-6], ax
        mov     al, byte ptr es:[bx+VREQ_OVERLAP]
        mov     byte ptr [bp-11h], al
        mov     al, byte ptr es:[bx+VREQ_DCY_MODE]
        mov     byte ptr [bp-10h], al
; ? misc_ddc7 @0x0ddc7 is mid-instruction
        mov     word ptr [bp-0ah], 2
        dec     al
        jne     br_02640
        mov     ax, word ptr es:[bx+VREQ_FIELD_36]
        if      FW_VERSION = 172
L_02614                         equ     $+1
        endif
        mov     cx, ax
        add     ax, 5
        mov     dx, 0ah
        mov     si, dx
        sub     dx, dx
        div     si
        mov     word ptr [bp-0ch], ax
        push    0
        push    si
        sub     dx, dx
        add     cx, word ptr es:[bx+VREQ_FIELD_38]
        adc     dx, dx
        add     cx, 5
        adc     dx, 0
        push    dx
        push    cx
        mov     si, ax
        callf   TEXT1_SEG:__aFldiv
        jmp     br_026A9
br_02640:
        cmp     byte ptr es:[bx+VREQ_LOOPON], 0
        je      br_0266E
        mov     ax, word ptr es:[bx+VREQ_FIELD_38]
        add     ax, 5
        sub     dx, dx
        div     cx
        mov     word ptr [bp-0ah], ax
        cmp     ax, 1
        ja      L_0265F
        mov     word ptr [bp-0ah], 2

L_0265F:
        mov     ax, 0ffffh
        mov     word ptr [bp-0eh], ax
; called from EXE
misc_de25:
        mov     word ptr [bp-0ch], ax
        mov     byte ptr [bp-11h], 2
        jmp     br_026BF

br_0266E:
        push    0
        push    cx
        mov     ax, word ptr es:[bx+VREQ_FIELD_32]
        mov     dx, word ptr es:[bx+VREQ_FIELD_32_HI]
        mov     cx, ax
        mov     si, dx
        sub     ax, word ptr es:[bx+VREQ_FIELD_38]
        sbb     dx, 0
        add     ax, 5
        adc     dx, 0
        push    dx
        push    ax
        mov     di, cx
        callf   TEXT1_SEG:__aFuldiv
        mov     word ptr [bp-0ch], ax
        push    0
        push    0ah
        add     di, 5
        adc     si, 0
        push    si
        push    di
        mov     si, ax
        callf   TEXT1_SEG:__aFuldiv

br_026A9:
        mov     word ptr [bp-0eh], ax
        cmp     si, 1
        ja      br_026B6
        mov     word ptr [bp-0ch], 2

br_026B6:
        or      ax, ax
        jne     br_026BF
        mov     word ptr [bp-0eh], 1

br_026BF:
        cmp     byte ptr [bp-11h], 1
        jne     br_026CD
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    voice_release_by_note

br_026CD:
        mov     ax, word ptr [bp+8]
        sub     ax, 23h
        cmp     ax, 3fh
        ja      br_026E0
        push    word ptr [bp+8]
        nop
        push    cs
        call    voice_release_by_note

br_026E0:
        MG_HOOK_CHOKE

br_026F3:
        les     bx, [bp+0ch]
        cmp     byte ptr es:[bx], 20h
        jb      br_0270A
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    voice_alloc
        les     bx, [bp+0ch]
        mov     byte ptr es:[bx], al
br_0270A:
        les     bx, [bp+0ch]
        mov     bl, byte ptr es:[bx]
        sub     bh, bh
        add     bx, bx
        mov     word ptr [bx+TBL_578E], 0
        les     bx, [bp+0ch]
        mov     bl, byte ptr es:[bx]
        sub     bh, bh
        add     bx, bx
        mov     ax, word ptr [bx+TBL_578E]
        mov     word ptr [bx+TBL_574E], ax
        les     bx, [bp+0ch]
        mov     bl, byte ptr es:[bx]
        sub     bh, bh
        add     bx, bx
        mov     ax, word ptr [bx+TBL_574E]
        mov     word ptr [bx+VOICE_TIMER], ax
        les     bx, [bp+0ch]
        mov     bl, byte ptr es:[bx]
        sub     bh, bh
        add     bx, bx
        mov     ax, word ptr [bx+VOICE_TIMER]
        mov     word ptr [bx+VOICE_HOLD], ax
        push    word ptr [bp+0eh]
        push    word ptr [bp+0ch]
        nop
        push    cs
        call    voice_regs_program
        les     bx, [bp+0ch]
        sub     ah, ah
        mov     al, byte ptr es:[bx]
        imul    si, ax, 12h
        push    ds
        lea     di, [si+VOICE_TABLE]
        lea     si, [bp-12h]
        mov     ax, ds
        mov     es, ax
        mov     ax, ss
        mov     ds, ax
        mov     cx, 9
        rep movsw
        pop     ds
        mov     al, byte ptr [bp+0ah]
        les     bx, [bp+0ch]
        sub     ch, ch
        mov     cl, byte ptr es:[bx]
        imul    si, cx, 12h
        mov     byte ptr [si+VOICE_TABLE], al
        mov     ax, word ptr [bp-0ch]
        mov     bl, byte ptr es:[bx]
        sub     bh, bh
        add     bx, bx
        mov     word ptr [bx+VOICE_HOLD], ax
        mov     ax, word ptr [bp-0eh]
        les     bx, [bp+0ch]
        mov     bl, byte ptr es:[bx]
        sub     bh, bh
        add     bx, bx
        mov     word ptr [bx+VOICE_TIMER], ax
        les     bx, [bp+0ch]
        cmp     word ptr es:[bx+VREQ_FIELD_2C], 0
        je      br_027C5
        mov     ax, word ptr [bp-8]
        mov     bl, byte ptr es:[bx]
        sub     bh, bh
        add     bx, bx
        mov     word ptr [bx+TBL_574E], ax

br_027C5:
        pop     si
        pop     di
        leave
        retf    0ah
        db      00h

voice_release_all:
        push    si
        xor     si, si

loop_027CF:
        push    si
        nop
        push    cs
        call    voice_release_full
        inc     si
        cmp     si, 20h
        jb      loop_027CF
        pop     si
        retf
        db      00h
; voice_release, then register group 6 gets 0BB8h/7FF0h.
voice_release_full:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+6]
        push    si
        nop
        push    cs
        call    voice_release

        cmp     byte ptr [si+P_9A4E], 0
        jne     br_0280B
        mov     bx, si
        mov     word ptr [bx+si+TBL_578E], 0
        mov     ax, si
        or      ah, 6
        out     DMA_CTRL, ax
        mov     ax, 0bb8h
        out     DMA_DATA_LO, ax
        mov     ax, 7ff0h
        out     DMA_DATA_HI, ax

br_0280B:
        pop     si
        leave
        retf    2

; zeroes voice N's three timer words and its release delay, frees its slot
; in the 32-entry stride-12h voice table, and writes register group 4.
voice_release:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+6]
        cmp     byte ptr [si+P_9A4E], 0
        jne     lcd_set_cursor_E00E
; ? no entry point at 0x0dfdf -- mid-instruction
        xor     ax, ax
        mov     bx, si
        add     bx, si
        mov     word ptr [bx+TBL_574E], ax
        mov     word ptr [bx+VOICE_TIMER], ax
        mov     word ptr [bx+VOICE_HOLD], ax
        mov     word ptr [bx+TBL_578E], 3
        imul    bx, si, 12h
        mov     byte ptr [bx+VOICE_TABLE], 0ffh
        mov     ax, si
        or      ah, 4
        out     DMA_CTRL, ax
        mov     ax, 0f448h
        out     DMA_DATA_LO, ax
        xor     ax, ax
        out     DMA_DATA_HI, ax

lcd_set_cursor_E00E:
        pop     si
        leave
        retf    2
        db      00h

lcd_set_cursor:
        enter   40h, 0
        push    di
        push    si
        mov     si, word ptr [bp+6]
        mov     ax, word ptr [bp+8]
        or      ax, si
        jne     br_02867
        jmp     br_02A77

br_02867:
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[si+SND_LOOP_HI]
        or      ax, word ptr es:[si+SND_LOOP]
        jne     br_0287A
        mov     byte ptr [bp-3ch], 0
        jmp     L_02881

br_0287A:
        mov     al, byte ptr es:[si+SND_LOOPON]
        mov     byte ptr [bp-3ch], al

L_02881:
        push    0
        push    1b9h
        mov     ax, word ptr es:[si+SND_END]
        mov     dx, word ptr es:[si+SND_END_HI]
        sub     ax, word ptr es:[si+SND_START]
        sbb     dx, word ptr es:[si+SND_START_HI]
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
        callf   TEXT1_SEG:__aFldiv
misc_e071:
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        cmp     byte ptr [bp-3ch], 0
        jne     br_028C5
        sub     word ptr [bp-4], 1eh
        sbb     word ptr [bp-2], 0

br_028C5:
        cmp     word ptr [bp-2], 0
        jge     br_028CE
        jmp     br_02A77

br_028CE:
        jg      br_028D9
        cmp     word ptr [bp-4], 0
        jne     br_028D9
        jmp     br_02A77

br_028D9:
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[si+SND_END]
        mov     dx, word ptr es:[si+SND_END_HI]
        cmp     word ptr es:[si+SND_START_HI], dx
        jle     br_028ED
        jmp     br_02A77

br_028ED:
        jl      br_028F8
        cmp     word ptr es:[si+SND_START], ax
        jbe     br_028F8
        jmp     br_02A77

br_028F8:
        mov     al, byte ptr es:[si+SND_LEVEL]
        sub     ah, ah
        imul    di, ax, 0e6h
        or      di, di
        jne     br_02909
        jmp     br_02A77

br_02909:
        push    0
        push    0c671h
        push    di
        push    0
        callf   TEXT1_SEG:__aFldiv
        mov     di, ax
; ? misc_e0d9 @0x0e0d9 is mid-instruction
        cmp     di, 7fffh
        jbe     br_02921
        mov     di, 7fffh
br_02921:
        mov     es, word ptr [bp+8]
        mov     bx, word ptr es:[si+SND_POOL_IDX]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL]
        mov     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        add     ax, word ptr es:[si+SND_START]
        adc     dx, word ptr es:[si+SND_START_HI]
        mov     word ptr [bp-2ah], ax
        mov     word ptr [bp-28h], dx
        mov     al, byte ptr es:[si+SND_TUNE]
        cbw
        mov     bx, ax
        add     bx, ax
        mov     ax, word ptr [bx+TBL_PITCH_RATIO]
        mov     word ptr [bp-32h], ax
        mov     bx, word ptr es:[si+SND_POOL_IDX]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL]
        mov     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        add     ax, word ptr es:[si+SND_END]
        adc     dx, word ptr es:[si+SND_END_HI]
        mov     word ptr [bp-26h], ax
        mov     word ptr [bp-24h], dx
        sub     ax, word ptr es:[si+SND_LOOP]
        sbb     dx, word ptr es:[si+SND_LOOP_HI]
        mov     word ptr [bp-22h], ax
        mov     word ptr [bp-20h], dx
        mov     ax, word ptr es:[si+SND_FIELD_32]
        mov     dx, word ptr es:[si+SND_FIELD_32_HI]
        mov     word ptr [bp-1eh], ax
        mov     word ptr [bp-1ch], dx
        mov     word ptr [bp-30h], di
        mov     word ptr [bp-2eh], di
        mov     word ptr [bp-1ah], 0ffffh
        mov     word ptr [bp-18h], 3fffh
        mov     ax, 7ff0h
        mov     word ptr [bp-16h], ax
        mov     word ptr [bp-12h], ax
        xor     ax, ax
        mov     word ptr [bp-14h], ax
        mov     word ptr [bp-10h], ax
        mov     al, 80h
        mov     byte ptr [bp-39h], al
        mov     byte ptr [bp-38h], al
        mov     byte ptr [bp-3bh], 2
        xor     al, al
        mov     byte ptr [bp-37h], al
        mov     byte ptr [bp-35h], al
        mov     byte ptr [bp-3ah], al
        push    0
        push    word ptr [bp-32h]
        mov     dx, word ptr [bp-4]
        mov     bx, word ptr [bp-2]
        shr     bx, 1
        rcr     dx, 1
        rcr     bx, 1
        rcr     dx, 1
        rcr     bx, 1
        rcr     dx, 1
        rcr     bx, 1
        rcr     dx, 1
        rcr     bx, 1
        xchg    bx, dx
        and     dx, 0f000h
        push    bx
        push    dx
        callf   TEXT1_SEG:__aFldiv
        mov     word ptr [bp-0eh], ax
        mov     word ptr [bp-0ch], dx
        xor     ax, ax
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-2ch], 0ff00h
        mov     byte ptr [bp-40h], 15h
        mov     es, word ptr [bp+8]
        cmp     byte ptr es:[si+SND_STEREO], al
        je      br_02A62
        mov     byte ptr [bp-39h], al
        lea     ax, [bp-40h]
        push    ss
        push    ax
        push    63h
        push    0
        push    0
        nop
        push    cs
        call    voice_start
        mov     byte ptr [bp-39h], 80h
        mov     byte ptr [bp-38h], 0
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[si+SND_LENGTH]
        mov     dx, word ptr es:[si+SND_LENGTH_HI]
        add     ax, 0fh
        adc     dx, 0
        and     al, 0f0h
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        add     word ptr [bp-2ah], ax
        adc     word ptr [bp-28h], dx
        add     word ptr [bp-26h], ax
        adc     word ptr [bp-24h], dx
        add     word ptr [bp-22h], ax
        adc     word ptr [bp-20h], dx
        mov     byte ptr [bp-40h], 17h
br_02A62:
        lea     ax, [bp-40h]
        push    ss
        push    ax
        push    63h
        push    0
        push    0
        nop
        push    cs
        call    voice_start
        nop
        push    cs
; ? misc_e141 @0x0e141 is mid-instruction
; ? misc_e1c4 @0x0e1c4 is mid-instruction
; ? misc_e235 @0x0e235 is mid-instruction
        call    dma_status_rearm

br_02A77:
        pop     si
        pop     di
        leave
        retf    4
        db      00h

; releases all 32 voices when the 32-bit argument is nonzero.
voice_release_all_if:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp+8]
        or      ax, word ptr [bp+6]
        je      br_02A8E
        nop
        push    cs
        call    voice_release_all

br_02A8E:
        leave
        retf    4

; builds a 40h voice descriptor from a sample descriptor and a
; 32-bit range, then voice_start for register sets 15h and 17h.
voice_start_sample:
        enter   40h, 0
        push    di
        push    si
        mov     si, word ptr [bp+0eh]
        mov     ax, word ptr [bp+10h]
        or      ax, si
        jne     L_02AA5
        jmp     br_02C4C

L_02AA5:
        push    0
        push    1b9h
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        sub     ax, word ptr [bp+0ah]
        sbb     dx, word ptr [bp+0ch]
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
        callf   TEXT1_SEG:__aFldiv
        sub     ax, 1eh
misc_e294:
        sbb     dx, 0
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        or      dx, dx
        jge     br_02AE4
        jmp     br_02C4C

br_02AE4:
        jg      br_02AED
        or      ax, ax
        jne     br_02AED
        jmp     br_02C4C

br_02AED:
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        cmp     word ptr [bp+8], dx
        jge     br_02AFB
        jmp     br_02C4C

br_02AFB:
        jg      br_02B05
        cmp     word ptr [bp+6], ax
        jae     br_02B05
        jmp     br_02C4C

br_02B05:
        mov     es, word ptr [bp+10h]
        mov     al, byte ptr es:[si+SND_LEVEL]
        sub     ah, ah
        imul    di, ax, 0e6h
        or      di, di
        jne     br_02B19
        jmp     br_02C4C
br_02B19:
        push    0
        push    0c671h
        push    di
        push    0
        callf   TEXT1_SEG:__aFldiv
        mov     di, ax
        cmp     di, 7fffh

        jbe     L_02B31
        mov     di, 7fffh

L_02B31:
        mov     byte ptr [bp-40h], 15h
        mov     es, word ptr [bp+10h]
        mov     bx, word ptr es:[si+SND_POOL_IDX]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL]
        mov     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        add     ax, word ptr [bp+0ah]
        adc     dx, word ptr [bp+0ch]
        mov     word ptr [bp-2ah], ax
        mov     word ptr [bp-28h], dx
        mov     al, byte ptr es:[si+SND_TUNE]
        cbw
        mov     bx, ax
        add     bx, ax
misc_e322:
        mov     ax, word ptr [bx+TBL_PITCH_RATIO]
        mov     word ptr [bp-32h], ax
        mov     word ptr [bp-30h], di
        mov     word ptr [bp-2eh], di
        mov     word ptr [bp-1ah], 0ffffh
        mov     word ptr [bp-18h], 3fffh
        mov     ax, 7ff0h
        mov     word ptr [bp-16h], ax
        mov     word ptr [bp-12h], ax
        xor     ax, ax
        mov     word ptr [bp-14h], ax
        mov     word ptr [bp-10h], ax
        mov     al, 80h
        mov     byte ptr [bp-39h], al
        mov     byte ptr [bp-38h], al
        mov     byte ptr [bp-3bh], 2
        xor     al, al
        mov     byte ptr [bp-3ch], al
        mov     byte ptr [bp-37h], al
        mov     byte ptr [bp-35h], al
        mov     byte ptr [bp-3ah], al
        push    0
        push    word ptr [bp-32h]
        mov     dx, word ptr [bp-4]
        mov     bx, word ptr [bp-2]
        shr     bx, 1
        rcr     dx, 1
        rcr     bx, 1
        rcr     dx, 1
        rcr     bx, 1
        rcr     dx, 1
        rcr     bx, 1
        rcr     dx, 1
        rcr     bx, 1
        xchg    bx, dx
        and     dx, 0f000h
        push    bx
        push    dx
        callf   TEXT1_SEG:__aFldiv
        mov     word ptr [bp-0eh], ax
        mov     word ptr [bp-0ch], dx
        xor     ax, ax
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-2ch], 0ff00h
        mov     es, word ptr [bp+10h]
        cmp     byte ptr es:[si+SND_STEREO], al
        je      L_02C37
        mov     byte ptr [bp-39h], al
        lea     ax, [bp-40h]
        push    ss
        push    ax
        push    63h
        push    0
        push    0
        nop
        push    cs
        call    voice_start
        mov     byte ptr [bp-40h], 17h
        mov     byte ptr [bp-39h], 80h
        mov     byte ptr [bp-38h], 0
        mov     es, word ptr [bp+10h]
        mov     ax, word ptr es:[si+SND_LENGTH]
        mov     dx, word ptr es:[si+SND_LENGTH_HI]
        add     ax, 0fh
        adc     dx, 0
        and     al, 0f0h
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        add     word ptr [bp-2ah], ax
        adc     word ptr [bp-28h], dx
        add     word ptr [bp-26h], ax
        adc     word ptr [bp-24h], dx
        add     word ptr [bp-22h], ax
        adc     word ptr [bp-20h], dx
L_02C37:
        lea     ax, [bp-40h]
        push    ss
        push    ax
        push    63h
        push    0
        push    0
        nop
        push    cs
        call    voice_start
        nop
; ? voice_start_sample's tail call to dma_status_rearm.
voice_start_sample_rearm:
        push    cs
        call    dma_status_rearm

br_02C4C:
        pop     si
        pop     di
        leave
        retf    0ch

; ? dispatcher (not MIDI I/O) branches on 32-bit param
midi_note_io:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp+8]
        or      ax, word ptr [bp+6]
        je      br_02C62
        nop
        push    cs
        call    voice_release_all

br_02C62:
        leave
        retf    4

X_02C66:
        push    di
        xor     ax, ax
        mov     bx, BUF_XFER
        mov     cx, 400h
        mov     di, bx
        push    ds
        pop     es
        rep stosw
; stack_frame_fn_e43a @0x0e43a is code
        mov     ax, 7fffh
        mov     cx, 32h
        mov     di, bx
        rep stosw
        push    1
        push    2280h
        push    ds
        push    BUF_XFER
        push    400h
        nop
        push    cs
        call    flash_write_words
        pop     di
        retf

midi_note_process:
        enter   3ch, 0
        push    si
        mov     al, byte ptr [bp+8]
        mul     byte ptr [bp+9]
        mov     si, ax
        add     si, ax
        jne     br_02CA6
        jmp     br_02D47
br_02CA6:
        push    0
        push    0c671h
        push    si
        push    0
        callf   TEXT1_SEG:__aFldiv
        mov     si, ax
        cmp     si, 7fffh

        jbe     L_02CBE
        mov     si, 7fffh

L_02CBE:
        mov     word ptr [bp-2ch], si
        mov     word ptr [bp-2ah], si
; ? misc_e485 @0x0e485 is mid-instruction
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
        mov     byte ptr [bp-38h], al
        mov     byte ptr [bp-31h], al
        mov     byte ptr [bp-37h], al
misc_e4b7:
        mov     byte ptr [bp-36h], al
        mov     word ptr [bp-0ah], 0ah
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-28h], 0ff00h
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], ax
        cmp     byte ptr [bp+7], al
        jne     br_02D1C
        mov     byte ptr [bp-33h], al
        mov     al, 80h
        jmp     br_02D28
br_02D1C:
        mov     al, byte ptr [bp+7]
        mov     byte ptr [bp-33h], al
        mov     byte ptr [bp-32h], 7fh
        xor     al, al
br_02D28:
        mov     byte ptr [bp-34h], al
        mov     byte ptr [bp-35h], al
        mov     byte ptr [bp-3ch], 0ffh
        lea     ax, [bp-3ch]
        push    ss
        push    ax
        push    64h
        push    0
        push    0
        nop
        push    cs
        call    voice_start
        nop
        push    cs
        call    dma_status_rearm
br_02D47:
        pop     si
        leave
        retf

X_02D4A:
        push    ds
        push    TBL_WINKEYS_00C66
; ? retf_stub_e511 @0x0e511 is mid-instruction
        callf   TEXT1_SEG:win_keys_merge
        retf

X_02D54:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        or      dx, dx
        je      X_02D73
        cmp     ax, 2
        jne     X_02D73
        cmp     byte ptr [G_SEQ_MODE], 0
        jle     L_02D6E
        dec     byte ptr [G_SEQ_MODE]

L_02D6E:
        mov     byte ptr [G_FLAG_8CA8], 0

X_02D73:
        pop     ds
        retf
        db      00h

X_02D76:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        or      dx, dx
        je      T2_X_02D9D
        cmp     ax, 2
        jne     T2_X_02D9D
        mov     al, byte ptr [G_SEQ_MODE]
        cbw
        inc     ax
        mov     cx, ax
        mov     al, byte ptr [WIN_FIELD_DIGITS]
        cbw
        cmp     cx, ax
        jge     L_02D98
        inc     byte ptr [G_SEQ_MODE]

L_02D98:
        mov     byte ptr [G_FLAG_8CA8], 0

T2_X_02D9D:
        pop     ds
        retf
        db      00h

X_02DA0:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     byte ptr [G_FLAG_8CA8], 0
        pop     ds
        retf
        db      00h

field_edit_disable:
        push    ds
        push    TBL_WINKEYS_00C76
        callf   TEXT1_SEG:win_keys_merge
        nop
        push    cs
        call    far_02DC8
        nop
        push    cs
        call    far_02DD2
        nop
        push    cs
        call    win_keys_merge_disable
        retf
        db      00h

far_02DC8:
        push    ds
        push    P_0C86
        callf   TEXT1_SEG:win_keys_merge
        retf

far_02DD2:
        push    ds
        push    TBL_WINKEYS_00C96
        callf   TEXT1_SEG:win_keys_merge
        push    28h
        callf   TEXT1_SEG:int3A_wrapper
        add     sp, 2
        retf

win_keys_merge_disable:
        push    ds
        push    TBL_WINKEYS_00CA6
        callf   TEXT1_SEG:win_keys_merge
        retf

field_redraw:
        callf   [WIN_FIELD_DRAW_FN]
        retf
        db      00h
        if      FW_VERSION = 172
; far_dispatch_e587 @0x0e587 is code
        endif

field_draw_default:
        xor     cx, cx
        cmp     word ptr [NUM_ENTRY_MIN_HI], cx
        jge     br_02E01
        mov     cx, 1

br_02E01:
        cmp     byte ptr [G_FLAG_8CA8], 0
        je      br_02E36
        mov     al, byte ptr [WIN_FIELD_X]
; ? midi_port_read_e5cc @0x0e5cc is mid-instruction
        sub     ah, ah
        push    ax
        mov     al, byte ptr [EDIT_FIELD_Y]
        push    ax
        push    word ptr [NUM_ENTRY_VALUE_HI]
        push    word ptr [NUM_ENTRY_VALUE]
        mov     al, byte ptr [WIN_FIELD_DIGITS]
        cbw
        add     ax, cx
        push    ax
        nop
        push    cs
        call    draw_unsigned_value
        mov     al, byte ptr [WIN_FIELD_BOX_R]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [WIN_FIELD_BOX_B]
        push    ax
        push    6
        push    0
        jmp     br_02E5B
br_02E36:
        mov     al, byte ptr [EDIT_CURSOR_X]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [EDIT_CURSOR_Y]
        push    ax
        mov     al, byte ptr [G_SEQ_MODE]
        cbw
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        add     ax, ax
        mov     cl, byte ptr [WIN_FIELD_BOX_W]
        sub     ch, ch
        sub     cx, ax
        push    cx
        mov     al, byte ptr [EDIT_CURSOR_H]
        sub     ah, ah
        push    ax

br_02E5B:
        nop
        push    cs
        call    cmd_param_setup
        retf
        db      00h

; stores the value into [WIN_FIELD_VAR] as byte, word or dword per the
; width code.
field_value_store:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [WIN_FIELD_MODE]
        sub     ah, ah
        or      ax, ax
        je      br_02E7E
        dec     ax
        je      br_02E7E
        dec     ax
        je      L_02E92
        dec     ax
        je      L_02E92
        dec     ax
        je      br_02EA6
        leave
        retf    4
br_02E7E:
        les     bx, [WIN_FIELD_VAR]
        mov     al, byte ptr es:[bx]
        cmp     byte ptr [bp+6], al
        je      br_02ECC
        mov     al, byte ptr [bp+6]
        mov     byte ptr es:[bx], al
        jmp     br_02EC8

L_02E92:
        les     bx, [WIN_FIELD_VAR]
        mov     ax, word ptr es:[bx]
        cmp     word ptr [bp+6], ax
        je      br_02ECC
far_dispatch_e65e:
        mov     ax, word ptr [bp+6]
        mov     word ptr es:[bx], ax
        jmp     br_02EC8

br_02EA6:
        les     bx, [WIN_FIELD_VAR]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        cmp     word ptr [bp+6], ax
        jne     br_02EBB
        cmp     word ptr [bp+8], dx
        je      br_02ECC

br_02EBB:
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr es:[bx], ax
        mov     word ptr es:[bx+2], dx

br_02EC8:
        callf   [WIN_FIELD_CHANGE_FN]

br_02ECC:
        leave
        retf    4

; reads the value at that width, scales by 10^G_SEQ_MODE, clamps to the
; screen's bounds, then field_value_store.
field_value_scale:
        enter   12h, 0
        push    di

L_02ED5:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_SEQ_MODE]
        mov     byte ptr [bp-1], al
        mov     al, byte ptr [WIN_FIELD_MODE]
        sub     ah, ah
        or      ax, ax
        je      br_02EFC
        dec     ax
        je      br_02F10
misc_e6ae:
        dec     ax
        je      br_02F1A
        dec     ax
        je      br_02F24
        dec     ax
        je      br_02F2E
        pop     ds
        pop     si
        pop     di
        leave
        retf

br_02EFC:
        les     bx, [WIN_FIELD_VAR]
        sub     ah, ah
        mov     al, byte ptr es:[bx]

loop_02F05:
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-8], 0
        jmp     br_02F3F
        db      90h

br_02F10:
        les     bx, [WIN_FIELD_VAR]
        mov     al, byte ptr es:[bx]
        cbw
        jmp     br_02F2B

br_02F1A:
        les     bx, [WIN_FIELD_VAR]
        mov     ax, word ptr es:[bx]
        jmp     loop_02F05
        db      90h

br_02F24:
        les     bx, [WIN_FIELD_VAR]
        mov     ax, word ptr es:[bx]

br_02F2B:
        cwd
        jmp     br_02F39

br_02F2E:
        les     bx, [WIN_FIELD_VAR]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]

br_02F39:
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-8], dx

br_02F3F:
        mov     byte ptr [G_FLAG_8CA8], 0
        mov     word ptr [bp-6], 1
        mov     word ptr [bp-4], 0
        cmp     byte ptr [bp-1], 0
        je      br_02F67

L_02F54:
        push    0
        push    0ah
        lea     ax, [bp-6]
        push    ss
        push    ax
        callf   TEXT1_SEG:__aFFalmul
        dec     byte ptr [bp-1]
far_dispatch_e725:
        jne     L_02F54

br_02F67:
        push    word ptr [bp-4]
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    word ptr [bp-0ah]
        callf   TEXT1_SEG:_ldiv
        add     sp, 8
        push    ds
        lea     di, [bp-12h]
        mov     si, ax
        push    ss
        pop     es
        mov     ds, dx
        movsw
        movsw
        movsw
        movsw
        pop     ds
        push    word ptr [bp-4]
        push    word ptr [bp-6]
        push    word ptr [NUM_ENTRY_MAX_HI]
        push    word ptr [NUM_ENTRY_MAX]
        callf   TEXT1_SEG:__aFldiv
        cmp     dx, word ptr [bp-10h]
        jl      br_02FB1
        jg      br_02FA9
        cmp     ax, word ptr [bp-12h]
        jbe     br_02FB1

br_02FA9:
        add     word ptr [bp-12h], 1
        adc     word ptr [bp-10h], 0

br_02FB1:
; ? misc_e773 @0x0e773 is mid-instruction
        push    word ptr [bp-10h]
        push    word ptr [bp-12h]
        push    word ptr [bp-4]
        push    word ptr [bp-6]
        callf   TEXT1_SEG:__aFlmul
        add     ax, word ptr [bp-0eh]
        adc     dx, word ptr [bp-0ch]
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-8], dx
        cmp     dx, word ptr [NUM_ENTRY_MIN_HI]
        jg      br_02FEF
        jl      br_02FDC
        cmp     ax, word ptr [NUM_ENTRY_MIN]
        jae     br_02FEF

br_02FDC:
        mov     ax, word ptr [NUM_ENTRY_MIN]
        mov     dx, word ptr [NUM_ENTRY_MIN_HI]
        add     ax, 1
        adc     dx, 0
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-8], dx

br_02FEF:
        mov     ax, word ptr [NUM_ENTRY_MAX]
        mov     dx, word ptr [NUM_ENTRY_MAX_HI]
        cmp     word ptr [bp-8], dx
        jl      br_03008
        jg      br_03002
        cmp     word ptr [bp-0ah], ax
        jbe     br_03008

br_03002:
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-8], dx

br_03008:
        push    word ptr [bp-8]
        push    word ptr [bp-0ah]
        nop
        push    cs
        call    field_value_store
        pop     ds
        pop     si
        pop     di
        leave
        retf

; as field_value_scale, five width cases instead of three.
field_value_scale_2:
        enter   12h, 0
        push    di

L_0301D:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_SEQ_MODE]
        mov     byte ptr [bp-1], al
        mov     al, byte ptr [WIN_FIELD_MODE]
        sub     ah, ah
        or      ax, ax
        je      br_03044
        dec     ax
        je      br_03058
        dec     ax
        je      br_03062
        dec     ax
        je      L_0306C
        dec     ax
        je      br_03076
        pop     ds
        pop     si
        pop     di
        leave
        retf

br_03044:
        les     bx, [WIN_FIELD_VAR]
        sub     ah, ah
        mov     al, byte ptr es:[bx]

loop_0304D:
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-8], 0
        jmp     br_03087
        db      90h

br_03058:
        les     bx, [WIN_FIELD_VAR]
        mov     al, byte ptr es:[bx]
        cbw
        jmp     br_03073

br_03062:
        les     bx, [WIN_FIELD_VAR]
        mov     ax, word ptr es:[bx]
        jmp     loop_0304D
        db      90h

L_0306C:
        les     bx, [WIN_FIELD_VAR]

L_03070:
        mov     ax, word ptr es:[bx]

br_03073:
        cwd
        jmp     br_03081

br_03076:
        les     bx, [WIN_FIELD_VAR]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]

br_03081:
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-8], dx

br_03087:
        mov     byte ptr [G_FLAG_8CA8], 0
        mov     word ptr [bp-6], 1
        mov     word ptr [bp-4], 0
        cmp     byte ptr [bp-1], 0
        je      br_030AF

loop_0309C:
        push    0
        push    0ah
        lea     ax, [bp-6]
        push    ss
        push    ax
        callf   TEXT1_SEG:__aFFalmul
        dec     byte ptr [bp-1]
        jne     loop_0309C

br_030AF:
; ? far_dispatch_e870 @0x0e870 is mid-instruction
        push    word ptr [bp-4]
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    word ptr [bp-0ah]
        callf   TEXT1_SEG:_ldiv
        add     sp, 8
        push    ds
        lea     di, [bp-12h]
        mov     si, ax
        push    ss
        pop     es
        mov     ds, dx
        movsw
        movsw
        movsw
        movsw
        pop     ds
        push    word ptr [bp-4]
        push    word ptr [bp-6]
        push    word ptr [NUM_ENTRY_MIN_HI]
        push    word ptr [NUM_ENTRY_MIN]
        callf   TEXT1_SEG:__aFldiv
        cmp     dx, word ptr [bp-10h]
        jg      br_030F9
        jl      br_030F1
        cmp     ax, word ptr [bp-12h]
        jae     br_030F9

br_030F1:
        sub     word ptr [bp-12h], 1
        sbb     word ptr [bp-10h], 0

br_030F9:
        push    word ptr [bp-10h]
        push    word ptr [bp-12h]
        push    word ptr [bp-4]
        push    word ptr [bp-6]
        callf   TEXT1_SEG:__aFlmul
        add     ax, word ptr [bp-0eh]
        adc     dx, word ptr [bp-0ch]
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-8], dx
        cmp     dx, word ptr [NUM_ENTRY_MAX_HI]
        jl      br_03137
        jg      br_03124
        cmp     ax, word ptr [NUM_ENTRY_MAX]
        jbe     br_03137

br_03124:
        mov     ax, word ptr [NUM_ENTRY_MAX]
        mov     dx, word ptr [NUM_ENTRY_MAX_HI]
        sub     ax, 1
        sbb     dx, 0
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-8], dx

br_03137:
        mov     ax, word ptr [NUM_ENTRY_MIN]
        mov     dx, word ptr [NUM_ENTRY_MIN_HI]
        cmp     word ptr [bp-8], dx
        jg      br_03150
        jl      L_0314A
        cmp     word ptr [bp-0ah], ax
        jae     br_03150

L_0314A:
        mov     word ptr [bp-0ah], ax

L_0314D:
        mov     word ptr [bp-8], dx

br_03150:
        push    word ptr [bp-8]
        push    word ptr [bp-0ah]
        nop
        push    cs
        call    field_value_store
        pop     ds
        pop     si
        pop     di
        leave
        retf
seq_read_data:
        enter   6, 0
        push    ax
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_FLAG_8CA8], 0
        jne     tgt_03186
        mov     byte ptr [G_FLAG_8CA8], 1
        sub     ah, ah
        mov     word ptr [NUM_ENTRY_VALUE], ax
        mov     word ptr [NUM_ENTRY_VALUE_HI], 0
        pop     ds
        leave
        retf
        db      90h
tgt_03186:
        mov     byte ptr [bp-2], 1
        mov     word ptr [bp-6], 1
        mov     word ptr [bp-4], 0
        cmp     byte ptr [WIN_FIELD_DIGITS], 1
        jle     br_031B6
        mov     al, byte ptr [WIN_FIELD_DIGITS]
        dec     al
        mov     byte ptr [bp-1], al
loop_031A3:
        push    0
        push    0ah
        lea     ax, [bp-6]
        push    ss
        push    ax
        callf   TEXT1_SEG:__aFFalmul
        dec     byte ptr [bp-1]
        jne     loop_031A3
br_031B6:
        push    word ptr [bp-4]
        push    word ptr [bp-6]
        push    word ptr [NUM_ENTRY_VALUE_HI]
        push    word ptr [NUM_ENTRY_VALUE]
        callf   TEXT1_SEG:__aFlrem
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
        mov     cl, byte ptr [bp-8]
        sub     ch, ch
        add     ax, cx
        adc     dx, 0
        mov     word ptr [NUM_ENTRY_VALUE], ax
        mov     word ptr [NUM_ENTRY_VALUE_HI], dx
        pop     ds
        leave
        retf
        db      00h
; clamps the pending value to the screen's bounds, clears G_FLAG_8CA8 and
; G_SEQ_MODE, then field_value_store.
field_value_commit:
        enter   4, 0
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [WIN_FIELD_MODE]
        sub     ah, ah
        or      ax, ax
        je      br_03214
        dec     ax
        je      br_t2_03224
        dec     ax
        je      br_0322E
        dec     ax
        je      br_03238
        dec     ax
        je      br_03242
        pop     ds
        leave
        retf

br_03214:
        les     bx, [WIN_FIELD_VAR]
        sub     ah, ah
        mov     al, byte ptr es:[bx]

loop_0321D:
        mov     word ptr [bp-2], 0
        jmp     br_03250

br_t2_03224:
        les     bx, [WIN_FIELD_VAR]
        mov     al, byte ptr es:[bx]
        cbw
        jmp     br_0323F

br_0322E:
        les     bx, [WIN_FIELD_VAR]
        mov     ax, word ptr es:[bx]
        jmp     loop_0321D
        db      90h

br_03238:
        les     bx, [WIN_FIELD_VAR]
        mov     ax, word ptr es:[bx]

br_0323F:
        cwd
        jmp     L_0324D

br_03242:
        les     bx, [WIN_FIELD_VAR]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]

L_0324D:
        mov     word ptr [bp-2], dx

br_03250:
        cmp     byte ptr [G_FLAG_8CA8], 0
        je      br_032C4
        cmp     word ptr [NUM_ENTRY_MIN_HI], 0
        jge     L_03277
        cmp     word ptr [bp-2], 0
        jg      L_03277
        jl      br_0326A
        or      ax, ax
        jne     L_03277

br_0326A:
        neg     word ptr [NUM_ENTRY_VALUE]
        adc     word ptr [NUM_ENTRY_VALUE_HI], 0
        neg     word ptr [NUM_ENTRY_VALUE_HI]

L_03277:
        mov     ax, word ptr [NUM_ENTRY_VALUE]
        mov     dx, word ptr [NUM_ENTRY_VALUE_HI]
        cmp     word ptr [NUM_ENTRY_MAX_HI], dx
        jg      br_03296
        jl      br_0328C
        if      FW_VERSION = 150
L_03341:
        endif
        cmp     word ptr [NUM_ENTRY_MAX], ax
        jae     br_03296

br_0328C:
        mov     ax, word ptr [NUM_ENTRY_MAX]
        mov     dx, word ptr [NUM_ENTRY_MAX_HI]
        jmp     br_032AB
        db      90h

br_03296:
        cmp     word ptr [NUM_ENTRY_MIN_HI], dx
        jl      br_032B2
        jg      br_032A4
        cmp     word ptr [NUM_ENTRY_MIN], ax
        jbe     br_032B2

br_032A4:
        mov     ax, word ptr [NUM_ENTRY_MIN]
        mov     dx, word ptr [NUM_ENTRY_MIN_HI]

br_032AB:
        mov     word ptr [NUM_ENTRY_VALUE], ax
        mov     word ptr [NUM_ENTRY_VALUE_HI], dx

br_032B2:
        xor     al, al
        mov     byte ptr [G_FLAG_8CA8], al
        mov     byte ptr [G_SEQ_MODE], al
        push    dx
        push    word ptr [NUM_ENTRY_VALUE]
        nop
        push    cs
        call    field_value_store

br_032C4:
        pop     ds
        leave
        retf
        db      00h

status_read_6A:
        push    bp
        mov     bp, sp
        push    word ptr [bp+1ah]
        push    word ptr [bp+18h]
        push    0
        push    word ptr [bp+16h]
        push    0
        push    word ptr [bp+14h]
        mov     al, byte ptr [bp+12h]
        push    ax
        mov     al, byte ptr [bp+10h]
        push    ax
        mov     al, byte ptr [bp+0eh]
        push    ax
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   TEXT1_SEG:field_register          ; -> text1 +0x03582 (no label)
        mov     byte ptr [WIN_FIELD_MODE], 2
        leave
        retf    16h
        db      00h
status_read_6A_2:
        push    bp
        mov     bp, sp
        push    word ptr [bp+1ah]
        push    word ptr [bp+18h]
        mov     ax, word ptr [bp+16h]
        cwd
        push    dx
        push    ax
        mov     ax, word ptr [bp+14h]
        cwd
        push    dx
        push    ax
        mov     al, byte ptr [bp+12h]
        push    ax
        mov     al, byte ptr [bp+10h]
        push    ax
        mov     al, byte ptr [bp+0eh]
        push    ax
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   TEXT1_SEG:field_register
        mov     byte ptr [WIN_FIELD_MODE], 3
        leave
        retf    16h
        db      00h

status_read_6A_3:
        push    bp
        mov     bp, sp
        if      FW_VERSION = 172

L_03341:
        endif
        push    word ptr [bp+1ah]
        push    word ptr [bp+18h]
        mov     al, byte ptr [bp+16h]
        sub     ah, ah
        push    0
        push    ax
        mov     al, byte ptr [bp+14h]
        push    0
        push    ax
        mov     al, byte ptr [bp+12h]
        push    ax
        mov     al, byte ptr [bp+10h]
        push    ax
        mov     al, byte ptr [bp+0eh]
        push    ax

L_03361:
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   TEXT1_SEG:field_register
        mov     byte ptr [WIN_FIELD_MODE], 0
        leave
        retf    16h
        db      00h

field_register_s8:
        push    bp
        mov     bp, sp
        push    word ptr [bp+1ah]
        push    word ptr [bp+18h]
        mov     al, byte ptr [bp+16h]
        cbw
        cwd
        push    dx
        push    ax
        mov     al, byte ptr [bp+14h]
        cbw
        cwd
        push    dx
        push    ax
        mov     al, byte ptr [bp+12h]
        push    ax
        mov     al, byte ptr [bp+10h]
        push    ax
        mov     al, byte ptr [bp+0eh]
        push    ax
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   TEXT1_SEG:field_register
        mov     byte ptr [WIN_FIELD_MODE], 1
        leave
        retf    16h
        db      00h

; ? misnomer: trims trailing spaces from a fixed-position text buffer.
name_edit_commit:
        enter   8, 0

L_033BE:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
; ? misc_eb87 @0x0eb87 is mid-instruction
        mov     si, BUF_NAME_EDIT_LAST
        mov     bx, si
        mov     word ptr [bp-6], cx
        cmp     byte ptr [si], 20h
        jne     br_033DC
        mov     es, word ptr [bp-6]

loop_033D5:
        dec     bx
        cmp     byte ptr es:[bx], 20h
        je      loop_033D5

br_033DC:
        cmp     bx, BUF_NAME_EDIT
        jae     loop_033F2
        push    10h
        push    word ptr [WIN_FIELD_VAR+2]
        push    word ptr [WIN_FIELD_VAR]
        push    ds
        push    BUF_NAME_EDIT
        jmp     br_0341D

loop_033F2:
        mov     es, word ptr [bp-6]
        cmp     byte ptr es:[bx], 20h
        jne     br_033FF
        mov     byte ptr es:[bx], 5fh

br_033FF:
        mov     ax, word ptr [bp-6]
        mov     cx, bx
        dec     bx
        mov     dx, ds
; ? far_dispatch_ebc9 @0x0ebc9 is mid-instruction
        cmp     cx, BUF_NAME_EDIT
        jne     loop_033F2
        cmp     ax, dx
        jne     loop_033F2
        push    10h
        push    ds
        push    cx
        push    word ptr [WIN_FIELD_VAR+2]
        push    word ptr [WIN_FIELD_VAR]
br_0341D:
        callf   TEXT1_SEG:__fstrncpy
        add     sp, 0ah
        mov     byte ptr [G_FLAG_8CA8], 0
        callf   [NAME_EDIT_CHANGE_FN]
        pop     ds
        pop     si
        leave
        retf
X_03432:
        mov     al, byte ptr [G_SEQ_MODE]
        mov     cl, al
        add     al, al
        add     al, cl
        add     al, al
        add     al, byte ptr [WIN_FIELD_X]
        mov     byte ptr [EDIT_CURSOR_X], al
        mov     byte ptr [WIN_FIELD_BOX_R], al
        cmp     byte ptr [G_FLAG_8CA8], 0
        je      X_03472
        mov     al, byte ptr [WIN_FIELD_X]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [EDIT_FIELD_Y]
        push    ax
        push    ds
        push    BUF_NAME_EDIT
        nop
        push    cs
        call    cmd_dispatch_1E
        mov     al, byte ptr [WIN_FIELD_BOX_R]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [WIN_FIELD_BOX_B]
        push    ax
        push    6
        push    0
        jmp     SHORT X_03484
        db      90h

X_03472:
        mov     al, byte ptr [EDIT_CURSOR_X]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [EDIT_CURSOR_Y]
        push    ax
        mov     al, byte ptr [WIN_FIELD_BOX_W]
        push    ax
        mov     al, byte ptr [EDIT_CURSOR_H]
        push    ax

X_03484:
        nop
        push    cs
        call    cmd_param_setup
        retf

; ? misnomer: cycles forward through the menu/preset table at [bx+126h].
voice_port_read:
        enter   4, 0
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
; ? misc_ec55 @0x0ec55 is mid-instruction
        mov     byte ptr [G_FLAG_8CA8], 1
        mov     al, byte ptr [G_SEQ_MODE]
        cbw
        mov     bx, ax
        add     bx, BUF_NAME_EDIT
        mov     word ptr [bp-4], bx
        mov     al, byte ptr [bx]
        mov     byte ptr [bp-1], al

loop_034AB:
        inc     byte ptr [bp-1]
        cmp     byte ptr [bp-1], 20h
        jge     br_034B8
        mov     byte ptr [bp-1], 20h

br_034B8:
        mov     al, byte ptr [bp-1]
        cbw
        mov     bx, ax
        cmp     byte ptr [bx+TBL_NAME_CHARSET], 2ah
        je      loop_034AB
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+TBL_NAME_CHARSET]
        mov     bx, word ptr [bp-4]
        mov     byte ptr [bx], al
        callf   [NAME_EDIT_CHANGE_FN]
        pop     ds
        leave
        retf

; ? as voice_port_read, but cycles backward.
voice_port_read2:
        enter   4, 0
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     byte ptr [G_FLAG_8CA8], 1
misc_eca7:
        mov     al, byte ptr [G_SEQ_MODE]
        cbw
        mov     bx, ax
        add     bx, BUF_NAME_EDIT
        mov     word ptr [bp-4], bx
        mov     al, byte ptr [bx]
        mov     byte ptr [bp-1], al

loop_034F9:
        dec     byte ptr [bp-1]
        cmp     byte ptr [bp-1], 20h
        jge     br_03506
        mov     byte ptr [bp-1], 7fh

br_03506:
        mov     al, byte ptr [bp-1]
        cbw
        mov     bx, ax
        cmp     byte ptr [bx+TBL_NAME_CHARSET], 2ah
        je      loop_034F9
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+TBL_NAME_CHARSET]
        mov     bx, word ptr [bp-4]
        mov     byte ptr [bx], al
        callf   [NAME_EDIT_CHANGE_FN]
        pop     ds
        leave
        retf

midi_channel_handler:
        enter   2, 0

L_0352A:
        push    si

L_0352B:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     cx, ax
        or      cl, cl
        jne     br_0353A
        jmp     br_035C2

br_0353A:
        mov     byte ptr [G_FLAG_8CA8], 1
        mov     al, ch
        and     al, 0fh
        mov     byte ptr [bp-1], al
        cmp     al, byte ptr [NAME_EDIT_LAST_PAD]
        jne     br_0357A
        mov     al, byte ptr [G_SEQ_MODE]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+BUF_NAME_EDIT]
        mov     cx, ax
        mov     al, byte ptr [NAME_EDIT_CASE]
        cbw
        mov     bx, ax
        shl     bx, 5
        mov     al, byte ptr [bp-1]
        cbw
        mov     si, ax
        cmp     byte ptr [bx+si+P_0D24], cl
        jne     br_03574
        mov     byte ptr [bp-2], 1
        jmp     L_03595
        db      90h

br_03574:
        mov     byte ptr [bp-2], 0
        jmp     L_03595

br_0357A:
        mov     byte ptr [bp-2], 0
        cmp     byte ptr [B_8CAB], 0
        je      br_0358A
        nop
        push    cs
        call    far_0369C

br_0358A:
        mov     byte ptr [B_8CAB], 1
        mov     al, byte ptr [bp-1]
        mov     byte ptr [NAME_EDIT_LAST_PAD], al

L_03595:
        mov     al, byte ptr [bp-1]
        cbw
        mov     bx, ax
        mov     al, byte ptr [NAME_EDIT_CASE]
        cbw
        add     ax, ax
        mov     cx, ax
        mov     al, byte ptr [bp-2]
far_dispatch_ed66:
        cbw
        mov     si, ax
        add     si, cx
        shl     si, 4
        mov     al, byte ptr [bx+si+P_0D24]
        mov     cx, ax
        mov     al, byte ptr [G_SEQ_MODE]
        cbw
        mov     bx, ax
        mov     byte ptr [bx+BUF_NAME_EDIT], cl
        callf   [NAME_EDIT_CHANGE_FN]

br_035C2:
        pop     ds
        pop     si
        leave
        retf

; sets G_FLAG_8CA8 = 1, the active-channel flag, then writes a byte.
midi_msg_io:
        push    bp
        mov     bp, sp
        push    ax
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     byte ptr [G_FLAG_8CA8], 1
        mov     al, byte ptr [G_SEQ_MODE]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bp-2]
        add     al, 30h
        mov     byte ptr [bx+BUF_NAME_EDIT], al
        nop
        push    cs
        call    far_0369C
        pop     ds
        leave
        retf

X_035EC:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     byte ptr [G_FLAG_8CA8], 1
        mov     al, byte ptr [G_SEQ_MODE]
        cbw
        mov     bx, ax
        cmp     byte ptr [NAME_EDIT_CASE], 1
        sbb     al, al
        and     al, 0c1h
        add     al, 5fh
        mov     byte ptr [bx+BUF_NAME_EDIT], al
        nop
        push    cs
        call    far_0369C
        pop     ds
        retf
        db      00h

L_03614:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [NAME_EDIT_CASE], 1
        sbb     al, al
        neg     al
        mov     byte ptr [NAME_EDIT_CASE], al
        callf   [NAME_EDIT_CHANGE_FN]
        pop     ds
        retf
X_0362C:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        or      dx, dx
        je      X_03650
        cmp     ax, 2
        jne     X_03650
        cmp     byte ptr [G_SEQ_MODE], 0
        jle     br_03646
        dec     byte ptr [G_SEQ_MODE]

br_03646:
        mov     byte ptr [B_8CAB], 0
        mov     byte ptr [NAME_EDIT_LAST_PAD], 0ffh

X_03650:
        callf   [NAME_EDIT_CHANGE_FN]
        pop     ds
        retf

T2_X_03656:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        or      dx, dx
        je      X_03674
        cmp     ax, 2
        jne     X_03674
        nop
        push    cs
        call    far_0369C
        mov     byte ptr [B_8CAB], 0
        mov     byte ptr [NAME_EDIT_LAST_PAD], 0ffh

X_03674:
        callf   [NAME_EDIT_CHANGE_FN]
        pop     ds
        retf

X_0367A:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_SEQ_MODE], 0
        jle     br_0368B
        dec     byte ptr [G_SEQ_MODE]

br_0368B:
        mov     byte ptr [B_8CAB], 0
        mov     byte ptr [NAME_EDIT_LAST_PAD], 0ffh
        callf   [NAME_EDIT_CHANGE_FN]
        pop     ds
        retf
        db      00h

far_0369C:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_SEQ_MODE]
        cbw
        inc     ax
        cmp     ax, 10h
        jge     br_036B0
        inc     byte ptr [G_SEQ_MODE]

br_036B0:
        mov     byte ptr [B_8CAB], 0
        mov     byte ptr [NAME_EDIT_LAST_PAD], 0ffh
        callf   [NAME_EDIT_CHANGE_FN]
        pop     ds
        retf

X_036C0:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    10h
        push    word ptr [WIN_FIELD_VAR+2]
        push    word ptr [WIN_FIELD_VAR]
        push    cx
        push    BUF_NAME_EDIT
        callf   TEXT1_SEG:__fstrncpy
        add     sp, 0ah
        xor     al, al
        mov     byte ptr [G_FLAG_8CA8], al
        if      FW_VERSION = 150
L_1115D                         equ     $+2
        endif
        mov     byte ptr [B_8CAB], al
        mov     byte ptr [NAME_EDIT_LAST_PAD], 0ffh
        callf   [NAME_EDIT_CHANGE_FN]
        pop     ds
        retf
        db      00h

X_036F0:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_078E4
        or      dx, ax
        je      T2_X_03743
        les     bx, [WIN_FIELD_VAR]
        mov     ax, word ptr es:[bx+2]
        or      ax, word ptr es:[bx]
        jne     br_03714
        nop
        push    cs
        call    far_078E4
        jmp     br_03734
        db      90h

br_03714:
        les     bx, es:[bx]
        les     bx, es:[bx+SND_NEXT]
        mov     ax, word ptr es:[bx+SND_NEXT_SEG]
        or      ax, word ptr es:[bx+SND_NEXT]
        je      T2_X_03743
        les     bx, [WIN_FIELD_VAR]
        les     bx, es:[bx]
        mov     ax, word ptr es:[bx+SND_NEXT]
        mov     dx, word ptr es:[bx+SND_NEXT_SEG]

br_03734:
        les     bx, [WIN_FIELD_VAR]
        mov     word ptr es:[bx], ax
        mov     word ptr es:[bx+2], dx
        callf   [WIN_FIELD_CHANGE_FN]

T2_X_03743:
        pop     ds
        retf
        db      00h

L_03746:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_078E4
        or      dx, ax
        je      L_037A8
        les     bx, [WIN_FIELD_VAR]
        mov     ax, word ptr es:[bx+2]
        or      ax, word ptr es:[bx]
        je      L_037A8
        les     bx, es:[bx]
        les     bx, es:[bx+SND_PREV]
        mov     ax, word ptr es:[bx+SND_PREV_SEG]
        or      ax, word ptr es:[bx+SND_PREV]
        je      br_03790
        les     bx, [WIN_FIELD_VAR]
        les     bx, es:[bx]
        mov     ax, word ptr es:[bx+SND_PREV]
        mov     dx, word ptr es:[bx+SND_PREV_SEG]
        les     bx, [WIN_FIELD_VAR]
        mov     word ptr es:[bx], ax
        mov     word ptr es:[bx+2], dx
        jmp     L_037A4
        db      90h

br_03790:
        cmp     byte ptr [B_8CAB], 0
        je      L_037A8
        les     bx, [WIN_FIELD_VAR]
        sub     ax, ax
        mov     word ptr es:[bx+2], ax
        mov     word ptr es:[bx], ax

L_037A4:
        callf   [WIN_FIELD_CHANGE_FN]

L_037A8:
        pop     ds
        retf

T2_L_037AA:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_FLAG_8CA8], 0
        je      L_037C1
        sub     word ptr [NUM_ENTRY_VALUE], 1
        sbb     word ptr [NUM_ENTRY_VALUE_HI], 0

L_037C1:
        nop
        push    cs
        call    field_value_commit
        pop     ds
        retf

timer_dma_ch2:
        push    bp
        mov     bp, sp
        push    word ptr [bp+1ah]
        push    word ptr [bp+18h]
        mov     al, byte ptr [bp+16h]
        push    ax
        mov     al, byte ptr [bp+14h]
        push    ax
        mov     al, byte ptr [bp+12h]
        push    ax
        mov     al, byte ptr [bp+10h]
        push    ax
        mov     al, byte ptr [bp+0eh]
        push    ax
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    status_read_6A_3
        push    12h
        push    TEXT2_SEG
        push    T2_L_037AA
        nop
        push    cs
        call    install_handler
        leave
        retf    16h
        db      00h

L_03808:
        cmp     byte ptr [G_FLAG_8CA8], 0
        je      X_03840
        mov     al, byte ptr [WIN_FIELD_BOX_R]
        sub     ah, ah
        add     ax, 6
        push    ax
        mov     al, byte ptr [WIN_FIELD_BOX_B]
        sub     ah, ah
        push    ax
        push    6
        push    0
        nop
        push    cs
        call    cmd_param_setup
        mov     al, byte ptr [WIN_FIELD_X]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [EDIT_FIELD_Y]
        push    ax
        push    word ptr [NUM_ENTRY_VALUE]
        mov     al, byte ptr [WIN_FIELD_DIGITS]
        cbw
        push    ax
        nop
        push    cs
        call    ratio_calc_divide
        retf

X_03840:
        cmp     byte ptr [G_SEQ_MODE], 0
        jne     L_0384E
        mov     al, byte ptr [WIN_FIELD_DIGITS]
        inc     al
        jmp     SHORT X_03855

L_0384E:
        mov     al, byte ptr [WIN_FIELD_DIGITS]
        sub     al, byte ptr [G_SEQ_MODE]

X_03855:
        mov     cl, al
        add     al, al
        add     al, cl
        add     al, al
        mov     byte ptr [WIN_FIELD_BOX_W], al
        mov     al, byte ptr [EDIT_CURSOR_X]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [EDIT_CURSOR_Y]
        push    ax
        mov     al, byte ptr [WIN_FIELD_BOX_W]
        push    ax
        mov     al, byte ptr [EDIT_CURSOR_H]
        push    ax
        nop
        push    cs
        call    cmd_param_setup
        retf
voice_trigger_full:
        push    bp
        mov     bp, sp
        push    word ptr [bp+14h]
        push    word ptr [bp+12h]
        push    0
        mov     al, byte ptr [bp+10h]
        push    ax
        push    1
        mov     al, byte ptr [bp+0eh]
        push    ax
        mov     al, byte ptr [bp+0ch]
        push    ax
        push    0
        push    0
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    status_read_6A_3
        mov     al, byte ptr [bp+0ah]
        mov     cl, al
        add     al, al
        add     al, cl
        add     al, al
        sub     al, 6
        mov     byte ptr [WIN_FIELD_BOX_W], al
        nop
        push    cs
        call    win_keys_merge_disable
        leave
        retf    10h
        db      00h

timer_value_read_1:
        push    bp
        mov     bp, sp
        push    word ptr [bp+0eh]
        push    word ptr [bp+0ch]
        cmp     word ptr [bp+6], 1
        sbb     al, al
        and     al, 1
        add     al, 22h
        push    ax
        push    62h
        push    2
        mov     al, byte ptr [bp+0ah]
        push    ax
        mov     al, byte ptr [bp+8]
        push    ax
        push    0
        push    0
        push    0
        push    0
        nop
        push    cs
        call    status_read_6A_3
        mov     byte ptr [WIN_FIELD_BOX_W], 24h
        nop
        push    cs
        call    far_02DC8
        leave
        retf    0ah
        db      00h

; ? range-checks a note against 23h-62h (35-98), then draw_unsigned_value.
timer_value_read_2:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp+0ah]
        cbw
        sub     ax, 23h
        cmp     ax, 3fh
        ja      L_0391E
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        mov     al, byte ptr [bp+0ah]
        cbw
        cwd
        push    dx
        push    ax
        push    2
        nop
        push    cs
        call    draw_unsigned_value
        leave
        retf    6
        db      90h

L_0391E:
        push    word ptr [bp+8]

tgt_03921:
        push    word ptr [bp+6]
        push    ds
        push    STR_DOUBLE_DASH
        nop
        push    cs
        call    cmd_dispatch_1E
        leave
        retf    6
        db      00h

cmd_dispatch_wrapper:
        enter   4, 0
        mov     al, byte ptr [bp+0ah]
        cbw
        cmp     ax, 40h
        jae     br_0397E
        mov     cl, 10h
        cbw
        idiv    cl
        add     al, 41h
        mov     byte ptr [bp-4], al
        mov     al, byte ptr [bp+0ah]
        cbw
        idiv    cl
        mov     byte ptr [bp+0ah], ah
        mov     al, ah
        inc     al
        mov     cl, 0ah
        mov     dx, ax
        cbw
        idiv    cl
        add     al, 30h
        mov     byte ptr [bp-3], al
        mov     al, dl
        cbw
        idiv    cl
        add     ah, 30h
        mov     byte ptr [bp-2], ah
        mov     byte ptr [bp-1], 0
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        lea     ax, [bp-4]
        push    ss
        push    ax
        jmp     br_03988

br_0397E:
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    ds
        push    TBL_OFF_ON_LABELS

br_03988:
        nop
        push    cs
        call    cmd_dispatch_1E
        leave
        retf    6
        db      00h
; ? calls timer_value_read_2, cmd_ratio_setup and timer_io_setup.
timer_value_read_3:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     di, word ptr [bp+8]
        mov     si, word ptr [bp+6]
        mov     al, byte ptr [bp+0ah]
        push    ax
        push    di
        push    si
        nop
        push    cs
        call    timer_value_read_2
        lea     ax, [di+0ch]
        push    ax
        push    si
        push    2fh
        nop
        push    cs
        call    cmd_ratio_setup
        mov     al, byte ptr [bp+0ah]
        cbw
        push    ax
        nop
        push    cs
        call    timer_io_setup
        push    ax
        lea     ax, [di+12h]
        push    ax
        push    si
        nop
        push    cs
        call    cmd_dispatch_wrapper
        pop     si
        pop     di
        leave
        retf    6
        db      00h
; ? calls L_078E4 and branches on its 32-bit result.
timer_value_read_4:
        push    bp
        mov     bp, sp
        push    di
        push    si
        nop
        push    cs
        call    far_078E4
        or      dx, ax
        je      br_03A22
        mov     si, word ptr [bp+0ah]
        mov     ax, word ptr [bp+0ch]
        or      ax, si
        je      br_03A16
        mov     di, word ptr [bp+8]
        push    di
        push    word ptr [bp+6]
        push    word ptr [bp+0ch]
        push    si
        nop
        push    cs
        call    cmd_dispatch_1E
        lea     ax, [di+60h]
        push    ax
        push    word ptr [bp+6]
        mov     es, word ptr [bp+0ch]
        cmp     byte ptr es:[si+SND_STEREO], 0
        je      L_03A0E
        mov     ax, STR_ST_SUFFIX
        jmp     br_03A11

L_03A0E:
        mov     ax, STR_ST_SUFFIX_BLANK

br_03A11:
        push    ds
        push    ax
        jmp     br_03A2C
        db      90h

br_03A16:
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    ds
        push    STR_OFF_PADDED
        jmp     br_03A2C

br_03A22:
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    ds
        push    STR_NO_SOUND_PADDED

br_03A2C:
        nop
        push    cs
        call    cmd_dispatch_1E
        pop     si
        pop     di
        leave
        retf    8
        db      00h
display_draw_coord:
        enter   4, 0
        push    di
        push    si
        mov     di, word ptr [bp+6]
        mov     si, word ptr [bp+8]
        push    si
        push    di
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    8
        nop
        push    cs
        call    draw_unsigned_value
        mov     ax, si
        add     al, 0bh
        mov     byte ptr [bp-2], al
        mov     cx, di
        add     cl, 7
        mov     byte ptr [bp-1], cl
        push    word ptr [bp-2]
        mov     word ptr [bp-4], ax
        nop
        push    cs
        call    display_coord_setup
        mov     al, byte ptr [bp-4]
        add     al, 12h
        mov     byte ptr [bp-2], al
        push    word ptr [bp-2]
        nop
        push    cs
        call    display_coord_setup
        pop     si
        pop     di
        leave
        retf    8
        db      00h
timer_value_read_5:
        push    bp
        mov     bp, sp
        cmp     word ptr [bp+6], 0
        jle     br_03AA8
        cmp     word ptr [bp+6], 2710h
        jge     br_03AA8
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    4
        nop
        push    cs
        call    ratio_calc_divide
        leave
        retf    6
br_03AA8:
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    ds
        push    STR_BLANK_VALUE
        nop
        push    cs
        call    cmd_dispatch_1E
        leave
        retf    6
        db      00h
name_edit_change_default:
        nop
        push    cs
        call    X_03432
        cmp     byte ptr [G_FLAG_8CA8], 0
        jne     X_03ADB
        mov     al, byte ptr [WIN_FIELD_X]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [EDIT_FIELD_Y]
        push    ax
        push    ds

; ? range-checks a param against (0, 2710h] then ratio_calc_divide.
        push    BUF_NAME_EDIT
        nop
        push    cs
        call    cmd_dispatch_1E

X_03ADB:
        retf
L_03ADC:
        pusha
        push    ds
        push    es
        mov     bp, sp
        sub     sp, 4
        push    ds
        mov     ax, DATA_SEG
        mov     ds, ax
        cld
        sti
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp]
        push    dx
        push    ax
        mov     al, byte ptr [bp+10h]
        push    ax
        mov     al, byte ptr [bp+11h]
        push    ax
        callf   TEXT1_SEG:far_call_wrapper_1
        mov     ax, name_edit_change_default
        mov     dx, TEXT2_SEG
        mov     word ptr [NAME_EDIT_CHANGE_FN], ax
        mov     word ptr [NAME_EDIT_CHANGE_FN+2], dx
        mov     word ptr [bp-2], dx
        mov     word ptr [bp-4], ax
        callf   [bp-4]
        push    0
        nop
        push    cs
        call    int44_wrapper
        mov     sp, bp
        pop     es
        pop     ds
        popa
        iret

X_03B24:
        push    di
        push    si
        mov     di, ax
        cmp     di, 8000h
        jne     X_03B34
        xor     ax, ax
        pop     si
        pop     di
        retf
        db      90h

X_03B34:
        xor     si, si
        test    di, 4000h
        jne     X_03B4A

X_03B3C:
        cmp     si, 8
        jge     X_03B4A
        inc     si
        add     di, di
        test    di, 4000h
        je      X_03B3C

X_03B4A:
        mov     bx, di
        mov     bl, bh
        sub     bh, bh
        mov     al, byte ptr [bx+TBL_0DB0]
        cbw
        mov     cx, si
        add     si, si
        add     si, cx
        add     si, si
        sub     ax, si
        pop     si
        pop     di
        retf

; ? misnomer: a bare LOOP busy-wait, no timer hardware.
timer_loop_io:
        push    bp
        mov     bp, sp
        mov     cx, 7d0h

tgt_03B68:
        loop    tgt_03B68
        leave
        retf

; credits-screen auto-scroll tick.
show_dev_credits_scroll:
        enter   2, 0
        push    ax
        push    di

L_03B72:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     bx, ax
        mov     word ptr [bp-2], 1
        sub     ax, word ptr [CREDITS_SCROLL_TICK]
        cmp     ax, 1f4h
        ja      br_03B8C
        jmp     L_03C2B
br_03B8C:
        mov     word ptr [CREDITS_SCROLL_TICK], bx
        dec     word ptr [CREDITS_SCROLL_PHASE]
        jne     br_03BAD
        mov     word ptr [CREDITS_SCROLL_PHASE], 9
        inc     word ptr [CREDITS_SCROLL_LINE]
        cmp     word ptr [CREDITS_SCROLL_LINE], 1dh
        jbe     br_03BAD
        mov     word ptr [CREDITS_SCROLL_LINE], 0

br_03BAD:
        lea     ax, [bp-2]
        push    ss
        push    ax
        callf   TEXT1_SEG:disp_list_run
        xor     di, di
        cmp     word ptr [CREDITS_SCROLL_PHASE], 6
        jbe     L_03BC6
        mov     ax, 5
        jmp     br_03BC9
        db      90h

L_03BC6:
        mov     ax, 6

br_03BC9:
        or      ax, ax
        jle     br_03C06
        xor     si, si

loop_03BCF:
        push    1
        mov     ax, word ptr [CREDITS_SCROLL_PHASE]
        add     ax, si
        inc     ax
        push    ax
        mov     bx, word ptr [CREDITS_SCROLL_LINE]
        add     bx, di
        shl     bx, 2
        push    word ptr [bx+CREDITS_TABLE+2]
        push    word ptr [bx+CREDITS_TABLE]
        nop
        push    cs
        call    cmd_dispatch_1E
        add     si, 9
        cmp     word ptr [CREDITS_SCROLL_PHASE], 6
        jbe     L_03BFE
        mov     ax, 5
        jmp     br_03C01
        db      90h

L_03BFE:
        mov     ax, 6

br_03C01:
        inc     di
        cmp     ax, di
        jg      loop_03BCF
br_03C06:
        push    13h
        push    0
        push    0
        push    0f8h
        push    8
        nop
        push    cs
        call    cmd_build_params
        push    13h
        push    0
        push    34h
        push    0f8h
        push    8
        nop
        push    cs
        call    cmd_build_params
        nop
        push    cs
        call    cmd_far_stub2
L_03C2B:
        pop     ds
        pop     si
        pop     di
        leave
        retf

L_03C30:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    TBL_WINKEYS_DEV_CREDITS
        callf   TEXT1_SEG:win_keys_merge
        callf   TEXT1_SEG:int38_wrapper
        mov     word ptr [CREDITS_SCROLL_TICK], ax
        mov     word ptr [CREDITS_SCROLL_LINE], 0
        mov     word ptr [CREDITS_SCROLL_PHASE], 9
        pop     ds
        retf
        db      00h

L_03C56:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    48h
        push    TEXT2_SEG
        push    L_03C30
        nop
        push    cs
        call    install_handler
        pop     ds
        retf
        db      90h
        if      FW_VERSION = 172

L_03C6C:
        push    di
        push    si
        xor     di, di
        mov     si, 1

L_03C73:
        test    word ptr [W_9A4A], si
        je      L_03C7A
        inc     di

L_03C7A:
        add     si, si
        jne     L_03C73
        mov     ax, di
        pop     si
        pop     di
        retf
        db      00h

        endif
voice_block_copy:
        push    bp
        mov     bp, sp
        push    di
        push    si
        sub     ax, ax
        mov     word ptr [FP_POLL_HOOK_SEG], ax
        mov     word ptr [FP_POLL_HOOK], ax
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        push    ds
        mov     di, W_64BE
        mov     si, ax
        push    ds
        pop     es
        mov     ds, dx
        mov     cx, 0ch
        rep movsw
        pop     ds
        and     byte ptr [G_PAD_INDEX], 0fh
        if      FW_VERSION = 172
        and     byte ptr [B_9A4C], 0fdh
        cmp     word ptr [W_9A4A], 0
        jne     L_03CC4
        mov     cl, byte ptr [G_PAD_INDEX]
        mov     ax, 1
        shl     ax, cl
        mov     word ptr [W_9A4A], ax

L_03CC4:
        test    byte ptr [B_9A4C], 1
        else
        cmp     byte ptr [B_980B_V150], 0
        endif
        je      br_03CD2
        nop
        push    cs
        call    far_03DAA
        jmp     L_03CD7

br_03CD2:
        nop
        push    cs
        call    L_03DD4

L_03CD7:
        callf   TEXT1_SEG:pad_bank_get
        mov     byte ptr [G_PAD_BANK], al
        push    ds
        push    TBL_WINKEYS_0100E
        callf   TEXT1_SEG:win_keys_merge
        push    ds
        push    P_10CC
        callf   TEXT1_SEG:disp_list_run
        pop     si
        pop     di
        leave
        retf    4
        db      00h

L_03CF8:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    word ptr [W_9A44]
        push    word ptr [W_9A42]
        nop
        push    cs
        call    mpc_port_C1_5E
        pop     ds
        retf
        db      00h

X_03D0E:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    word ptr [W_9A48]
        push    word ptr [W_9A46]
        nop
        push    cs
        call    mpc_port_C1_5E
        pop     ds
        retf
        db      00h

mpc_port_C1_5E:
        push    bp
        mov     bp, sp
        if      FW_VERSION = 172
        push    di
        endif
        push    si
        mov     ax, word ptr [bp+8]
        or      ax, word ptr [bp+6]
        je      L_03D4F
        if      FW_VERSION = 172
        mov     si, 1
        xor     di, di

L_03D36:
        test    word ptr [W_9A4A], si
        je      L_03D4A
        else
        cmp     byte ptr [B_980A_V150], 0
        jne     L_03D36
        endif
        mov     al, byte ptr [G_PAD_BANK]
        sub     ah, ah
        shl     ax, 4
        if      FW_VERSION = 172
        add     ax, di
        else
        mov     cl, byte ptr [G_PAD_INDEX]
        sub     ch, ch
        add     ax, cx
        endif
        push    ax
        callf   [bp+6]
        if      FW_VERSION = 172

L_03D4A:
        inc     di
        add     si, si
        jne     L_03D36

        else
        pop     si
        leave
        retf    4
L_03D36:
        xor     si, si
L_1179C:
        mov     al, byte ptr [G_PAD_BANK]
        sub     ah, ah
        shl     ax, 4
        add     ax, si
        push    ax
        callf   [bp+6]
        inc     si
        cmp     si, 10h
        jl      L_1179C
        endif
L_03D4F:
        pop     si
        if      FW_VERSION = 172
        pop     di
        endif
        leave
        retf    4
        db      00h

L_03D56:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_PAD_INDEX], 0fh
        jae     L_03D67
        inc     byte ptr [G_PAD_INDEX]

L_03D67:
        if      FW_VERSION = 172
        nop
        push    cs
        call    L_03C6C
        cmp     ax, 1
        jg      L_03D7D
        mov     cl, byte ptr [G_PAD_INDEX]
        mov     ax, 1
        shl     ax, cl
        mov     word ptr [W_9A4A], ax

L_03D7D:
        endif
        pop     ds
        retf
        db      00h

tgt_03D80:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_PAD_INDEX], 0
        if      FW_VERSION = 172
        je      L_03D91
        else
        je      br_03DA7
        endif
        dec     byte ptr [G_PAD_INDEX]
        if      FW_VERSION = 172

L_03D91:
        nop
        push    cs
        call    L_03C6C
        cmp     ax, 1
        jg      br_03DA7
        mov     cl, byte ptr [G_PAD_INDEX]
        mov     ax, 1
        shl     ax, cl
        mov     word ptr [W_9A4A], ax

        endif
br_03DA7:
        pop     ds
        retf
        db      00h

far_03DAA:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        if      FW_VERSION = 172
        or      byte ptr [B_9A4C], 1
        else
        mov     byte ptr [B_980B_V150], 1
        endif
        mov     ax, word ptr [W_64C6]
        mov     dx, word ptr [W_64C8]
        mov     word ptr [W_9A42], ax
        mov     word ptr [W_9A44], dx
        mov     ax, word ptr [W_64CA]
        mov     dx, word ptr [W_64CC]
        mov     word ptr [W_9A46], ax
        mov     word ptr [W_9A48], dx
        pop     ds
        retf
        db      00h

L_03DD4:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        if      FW_VERSION = 172
        and     byte ptr [B_9A4C], 0feh
        else
        mov     byte ptr [B_980B_V150], 0
        endif
        mov     ax, word ptr [W_64BE]
        mov     dx, word ptr [W_64C0]
        mov     word ptr [W_9A42], ax
        mov     word ptr [W_9A44], dx
        mov     ax, word ptr [W_64C2]
        mov     dx, word ptr [W_64C4]
        mov     word ptr [W_9A46], ax
        mov     word ptr [W_9A48], dx
        pop     ds
        retf
        db      00h

L_03DFE:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        if      FW_VERSION = 172
        nop
        push    cs
        call    L_03C6C
        cmp     ax, 1
        jg      L_03E16
        mov     ax, 0ffffh
        mov     word ptr [W_9A4A], ax
        pop     ds
        retf

L_03E16:
        mov     ax, 1
        mov     cl, byte ptr [G_PAD_INDEX]
        shl     ax, cl
        mov     word ptr [W_9A4A], ax
        else
        cmp     byte ptr [B_980A_V150], 1
        sbb     al, al
        neg     al
        mov     byte ptr [B_980A_V150], al
        endif
        pop     ds
        retf

L_03E24:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     bx, ax
        or      bl, bl
        je      T2_L_03E62
        if      FW_VERSION = 172
        mov     al, bh
        endif
        mov     byte ptr [G_PAD_INDEX], bh
        if      FW_VERSION = 172
        test    byte ptr [B_9A4C], 2
        je      L_03E4C
        mov     cl, bh
        mov     ax, 1
        shl     ax, cl
        xor     word ptr [W_9A4A], ax
        jne     T2_L_03E62
        jmp     L_03E56

L_03E4C:
        nop
        push    cs
        call    L_03C6C
        cmp     ax, 1
        jg      T2_L_03E62

L_03E56:
        mov     cl, byte ptr [G_PAD_INDEX]
        mov     ax, 1
        shl     ax, cl
        mov     word ptr [W_9A4A], ax

        endif
T2_L_03E62:
        pop     ds
        retf

L_03D58:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_PAD_BANK]
        inc     al
        and     al, 3
        mov     byte ptr [G_PAD_BANK], al
        sub     ah, ah
        push    ax
        callf   TEXT1_SEG:int3F_wrapper
        add     sp, 2
        pop     ds
        retf
        db      00h

cmd_exec_quad:
        enter   8, 0
        push    di

L_03E87:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        if      FW_VERSION = 172
        push    2
        nop
        push    cs
        call    cmd_exec_0E_wrapper
        push    13h
        push    0
        push    0
        push    0f8h
        push    33h
        nop
        push    cs
        call    cmd_build_params
        test    byte ptr [B_9A4C], 1
        je      L_03EB4
        xor     bx, bx
        mov     cx, 0dh
        jmp     L_03EBA
        db      90h

L_03EB4:
        mov     bx, 0eh
        mov     cx, 24h

L_03EBA:
        mov     di, 1
        mov     word ptr [bp-4], 4
        mov     word ptr [bp-6], cx
        mov     word ptr [bp-8], bx
        mov     si, di
        mov     di, word ptr [bp-4]

L_03ECD:
        test    word ptr [W_9A4A], si
        je      L_03EE3
        push    12h
        push    di
        push    word ptr [bp-8]
        push    0eh
        push    word ptr [bp-6]
        nop
        push    cs
        call    cmd_build_params

L_03EE3:
        add     di, 0fh
        add     si, si
        jne     L_03ECD
        endif
        push    0
        nop
        push    cs
        call    cmd_exec_0E_wrapper
        if      FW_VERSION = 150
        cmp     byte ptr [B_980B_V150], 0
        je      L_1189C
        mov     word ptr [bp-2], 1
        mov     word ptr [bp-4], 0ch
        jmp     L_118A6
L_1189C:
        mov     word ptr [bp-2], 0fh
        mov     word ptr [bp-4], 23h
L_118A6:
        cmp     byte ptr [B_980A_V150], 0
        je      L_03EB4
        mov     word ptr [bp-6], 5
        mov     word ptr [bp-8], 0eeh
        jmp     L_03EBA
        db      90h

L_03EB4:
        mov     al, byte ptr [G_PAD_INDEX]
        sub     ah, ah
        mov     cx, ax
        shl     ax, 4
        sub     ax, cx
        add     ax, 5
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-8], 0dh
L_03EBA:
        push    word ptr [bp-6]
        push    word ptr [bp-2]
        push    word ptr [bp-8]
        push    word ptr [bp-4]
        nop
        push    cs
        call    cmd_param_setup
        endif
        mov     ax, word ptr [W_64D0]
        or      ax, word ptr [W_64CE]
        je      L_03F45
        xor     di, di
        mov     si, 5
loop_03EFF:
        push    si
        push    10h
        mov     al, byte ptr [G_PAD_BANK]
        add     al, 41h
        push    ax
        nop
        push    cs
        call    cmd_ratio_setup
        push    13h
        push    si
        push    1
        push    0eh
        push    0eh
        nop
        push    cs
        call    cmd_build_params
        push    13h
        lea     ax, [si+7]
        push    ax
        push    0fh
        push    4
        push    22h
        nop
        push    cs
        call    cmd_build_params
        push    si
        mov     al, byte ptr [G_PAD_BANK]
        sub     ah, ah
        shl     ax, 4
        add     ax, di
        push    ax
        callf   [W_64CE]
        add     si, 0fh
        inc     di
        cmp     di, 10h
        jl      loop_03EFF
L_03F45:
        if      FW_VERSION = 172
        push    6
        push    1
        nop
        push    cs
        call    L_03C6C
        cmp     ax, 1
        jle     L_03F58
        mov     ax, STR_CLEAR
        jmp     L_03F5B

L_03F58:
        mov     ax, STR_ALL_CH

L_03F5B:
        push    ds
        push    ax
        nop
        push    cs
        call    string_copy_scan
        endif
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h

L_03F68:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     ax, word ptr [W_64D4]
        or      ax, word ptr [W_64D2]
        je      L_03F82
        if      FW_VERSION = 172
        mov     al, byte ptr [B_9A4C]
        and     ax, 1
        else
        mov     al, byte ptr [B_980B_V150]
        cbw
        endif
        push    ax
        callf   [W_64D2]

L_03F82:
        pop     ds
        retf
; on the flag [9D74h]: AH/AL/CL = [bp+0Ah]/[bp+8]/[bp+6], then an INT.
        if      FW_VERSION = 172
L_03F84:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        or      byte ptr [B_9A4C], 2
        pop     ds
        retf
        db      00h

L_03F92:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        and     byte ptr [B_9A4C], 0fdh
        pop     ds
        retf
        db      00h
        endif
note_clamp_multi:
        push    bp
        mov     bp, sp
        push    di
        push    si
        cmp     byte ptr [RECORD_MIX_CHANGES], 0
        je      br_03FBF
        push    ds
        push    si
        push    di
        push    bp
        mov     ah, byte ptr [bp+0ah]
        mov     al, byte ptr [bp+8]
        mov     cl, byte ptr [bp+6]
        int     48h
        pop     bp
        pop     di
        pop     si
        pop     ds
br_03FBF:
        pop     si
        pop     di
        leave
        retf    6
        db      00h

voice_param_proc:
        enter   2, 0
        push    di
        push    si
        mov     si, word ptr [bp+6]
        cmp     si, 64h
        jle     br_03FD7
        mov     si, 64h
br_03FD7:
        cmp     word ptr [bp+8], 3fh
        jle     br_03FE0
        jmp     br_04066
br_03FE0:
        mov     bx, word ptr [bp+8]
        les     di, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+di]
        cbw
        mov     word ptr [bp-2], ax
        sub     ax, 23h
        cmp     ax, 3fh
        ja      br_04066
        mov     ax, word ptr [bp+0ah]
        dec     ax
        je      tgt_0400C
        dec     ax
        je      tgt_04024
        dec     ax
        je      tgt_0403C
        dec     ax
        dec     ax
        je      tgt_04054
        pop     si
        pop     di
        leave
        retf    6
tgt_0400C:
        push    word ptr [bp-2]
        nop
        push    cs
        call    note_clamp_flag
        mov     es, dx
        mov     bx, ax
        mov     ax, si
        mov     byte ptr es:[bx], al
        pop     si
        pop     di
        leave
        retf    6
        db      90h
tgt_04024:
        push    word ptr [bp-2]
        nop
        push    cs
        call    note_clamp_flag
        mov     es, dx
        mov     bx, ax
        mov     ax, si
        mov     byte ptr es:[bx+PGM_MIX_PAN], al
        pop     si
        pop     di
        leave
        retf    6
tgt_0403C:
        push    word ptr [bp-2]
        nop
        push    cs
        call    note_range_clamp
        mov     es, dx
        mov     bx, ax
        mov     ax, si
        mov     byte ptr es:[bx+PGM_MIX_FX_LEVEL], al
        pop     si
        pop     di
        leave
        retf    6
tgt_04054:
        push    word ptr [bp-2]
        nop
        push    cs
        call    note_range_clamp
        mov     es, dx
        mov     bx, ax
        mov     ax, si

        mov     byte ptr es:[bx+PGM_MIX_IVOL], al

br_04066:
        pop     si
        pop     di
        leave
        retf    6

note_clamp_flag:
        enter   4, 0
        mov     cx, word ptr [bp+6]
        cmp     cx, 23h
        jge     br_0407B
        mov     cx, 23h

br_0407B:
        cmp     cx, 62h
        jle     br_04083
        mov     cx, 62h

br_04083:
        cmp     byte ptr [MIX_STEREO_SOURCE], 0
        je      br_04092
        mov     ax, P_9DA0
        mov     dx, ds
        jmp     br_0409C
        db      90h

br_04092:
        mov     ax, word ptr [PGM_CURRENT]
        mov     dx, word ptr [PGM_CURRENT+2]
        add     ax, PGM_MIX

br_0409C:
        mov     bx, ax
        mov     ax, cx
        add     ax, cx
        add     ax, cx
        add     ax, ax
        add     ax, bx
        sub     ax, PGM_MIX_BIAS
        leave
        retf    2
        db      00h
note_range_clamp:
        enter   4, 0
        mov     cx, word ptr [bp+6]
        cmp     cx, 23h
        jge     br_040BF
        mov     cx, 23h

br_040BF:
        cmp     cx, 62h
        jle     br_040C7
        mov     cx, 62h

br_040C7:
        cmp     byte ptr [MIX_INDIV_SOURCE], 0
        je      br_040D6
        mov     ax, P_9DA0
        mov     dx, ds
        jmp     br_040E0
        db      90h

br_040D6:
        mov     ax, word ptr [PGM_CURRENT]
        mov     dx, word ptr [PGM_CURRENT+2]

        add     ax, PGM_MIX

br_040E0:
        mov     bx, ax
        mov     ax, cx
        add     ax, cx
        add     ax, cx
        add     ax, ax
        add     ax, bx
        sub     ax, PGM_MIX_BIAS
        leave
        retf    2
        db      90h
L_040F4                         equ     $+00h
        mov     al, byte ptr [P_9D89]
        cbw
        push    ax
        nop
        push    cs
        call    cmd_exec_1E_ext
        retf
        db      00h

; marshals params for field_register_s8, including the far target TEXT2 40F4h.
read_io_chain:
        push    bp
        mov     bp, sp
        push    ds
        push    P_9D89
        push    -0dh
        push    2
        push    2
        mov     al, byte ptr [bp+8]
        push    ax
        mov     al, byte ptr [bp+6]
        push    ax
        push    0
        push    0
        push    TEXT2_SEG
        push    L_040F4
        nop
        push    cs
        call    field_register_s8
        mov     byte ptr [WIN_FIELD_BOX_W], 1eh
        nop
        push    cs
        call    win_keys_merge_disable
        nop
        push    cs
        call    far_02DC8
        leave
        retf    4
        db      00h

X_04138:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_MIXER_SETUP
        callf   TEXT1_SEG:disp_list_run
        push    0
        push    0
        push    7bh
        push    31h
        nop
        push    cs
        call    cmd_build_dispatch
        push    4bh
        push    16h
        mov     al, byte ptr [MIX_STEREO_SOURCE]
        cbw
        shl     ax, 3
        add     ax, TBL_PGM_MASTER_LABELS
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        push    4bh
        push    20h
        mov     al, byte ptr [MIX_INDIV_SOURCE]
        cbw
        shl     ax, 3
        add     ax, TBL_PGM_MASTER_LABELS
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        push    7dh
        push    0
        push    7ah
        push    18h
        nop
        push    cs
        call    cmd_build_dispatch
        push    0b7h
        push    0eh
        nop
        push    cs
        call    cmd_dispatch_handler_3
        push    7dh
        push    1ah
        push    7ah
        push    17h
        nop
        push    cs
        call    cmd_build_dispatch
        push    0b1h
        push    27h
        mov     al, byte ptr [RECORD_MIX_CHANGES]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+P_2A94]
        push    word ptr [bx+P_2A92]
        nop
        push    cs
        call    cmd_dispatch_1E
        nop
        push    cs
        call    field_redraw
        pop     ds
        retf

channel_validate:
        push    bp
        mov     bp, sp
        mov     bx, word ptr [bp+6]
        cmp     bx, 2
        jl      br_041D1
        xor     bx, bx
br_041D1:
        imul    ax, bx, 48h
        add     ax, word ptr [PGM_CURRENT]
        mov     dx, word ptr [PGM_CURRENT+2]
        add     ax, PGM_FX_SECTIONS
        leave
        retf
        db      00h

channel_get_ptr:
        push    bp
        mov     bp, sp
        mov     bx, word ptr [bp+6]
        cmp     bx, 4
        jl      br_041EF
        xor     bx, bx

br_041EF:
        mov     ax, bx
        add     ax, bx
        add     ax, bx
        shl     ax, 2
        add     ax, word ptr [PGM_CURRENT]
        mov     dx, word ptr [PGM_CURRENT+2]
        add     ax, PGM_FX_REVERBS
        leave
        retf
        db      00h

far_04206:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    TBL_WINKEYS_MIXER
        callf   TEXT1_SEG:win_keys_merge
        and     byte ptr [G_STATE_9D8B], 3
        cmp     byte ptr [B_87E6], 0
        je      X_04252
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        or      ax, ax
        jl      br_04243
        jo      br_04243
        dec     ax
        jle     br_04236
        dec     ax
        jl      br_04243
        dec     ax
        jle     L_0423E
        jmp     br_04243

br_04236:
        callf   TEXT1_SEG:X_037FE
        jmp     br_04243
        db      90h

L_0423E:
        callf   TEXT1_SEG:X_03716

br_04243:
        mov     word ptr [FP_POLL_HOOK], L_0426A
        mov     word ptr [FP_POLL_HOOK_SEG], TEXT2_SEG
        pop     ds
        retf
        db      90h

X_04252:
        nop
        push    cs
        call    X_0449E
        pop     ds
        retf
        db      00h

X_0425A:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        sub     ax, ax
        mov     word ptr [FP_POLL_HOOK_SEG], ax
        mov     word ptr [FP_POLL_HOOK], ax
        pop     ds
        retf
L_0426A:
        nop
        push    cs
        call    far_04206
        retf

L_04270:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_STATE_9D8B], 2
        jge     br_04288
        push    0
        push    0
        callf   TEXT1_SEG:audio_dispatch_table
        pop     ds
        retf

br_04288:
        push    0
        push    0
        callf   TEXT1_SEG:ui_screen_enter_edit
        pop     ds
        retf
        db      00h
track_select_setup:
        enter   4, 0
        push    di
        push    si
        mov     di, word ptr [bp+0ah]
        mov     si, word ptr [bp+0ch]
        push    13h
        push    si
        push    di
        push    1eh
        push    0eh
        nop
        push    cs
        call    cmd_build_params
        lea     ax, [si+1]
        push    ax
        push    di
        push    1bh
        mov     word ptr [bp-2], ax
        nop
        push    cs
        call    cmd_track_setup
        push    word ptr [bp-2]
        lea     ax, [di+0ch]
        push    ax
        push    1ch
        nop
        push    cs
        call    cmd_track_setup
        lea     ax, [si+2]
        push    ax
        lea     ax, [di+0dh]
        push    ax
        push    1bh
        nop
        push    cs
        call    cmd_track_setup
        push    si
        lea     ax, [di+1]
        push    ax
        push    0bh
        mov     word ptr [bp-4], ax
        nop
        push    cs
        call    cmd_dispatch_0E
        lea     ax, [si+1ch]
        push    ax
        push    word ptr [bp-4]
        push    0bh
        nop
        push    cs
        call    cmd_dispatch_0E
        lea     ax, [si+1dh]
        push    ax
        lea     ax, [di+2]
        push    ax
        push    0bh
        nop
        push    cs
        call    cmd_dispatch_0E
        lea     ax, [si+3]
        push    ax
        lea     ax, [di+3]
        push    ax
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    cmd_dispatch_1E
        pop     si
        pop     di
        leave
        retf    8

cmd_sequence_handler:
        push    bp
        mov     bp, sp
        push    di

L_04322:
        push    si
        push    ds
        push    P_1390
        callf   TEXT1_SEG:disp_list_run
        mov     al, byte ptr [PGM_SLOT]
        cbw
        push    ax
        mov     al, byte ptr [TBL_1360]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [TBL_1361]
        push    ax
        nop
        push    cs
        call    sequence_get_info
        mov     al, byte ptr [B_1362]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [B_1363]
        push    ax
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+FX_TYPE_LABELS+2]
        push    word ptr [bx+FX_TYPE_LABELS]
        nop
        push    cs
        call    cmd_dispatch_1E
        les     di, [bp+6]
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        dec     cx
        mov     si, cx
        mov     ax, cx
        add     si, cx
        add     si, cx
        add     si, si
        mov     al, byte ptr [B_1364]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [B_1365]
        push    ax
        push    es
        push    word ptr [bp+6]
        nop
        push    cs
        call    cmd_dispatch_1E
        mov     al, byte ptr [B_1364]
        sub     ah, ah
        add     ax, si
        push    ax
        mov     al, byte ptr [B_1365]
        sub     ah, ah
        push    ax
        push    ds
        push    P_4CF0
        nop
        push    cs
        call    cmd_caller_setup
        push    12h
        lea     ax, [si+9]
        push    ax
        push    1ch
        sub     si, 0e2h
        neg     si
        push    si
        push    3
        nop
        push    cs
        call    cmd_build_params
        push    0ech
        push    1ch
        push    3
        nop
        push    cs
        call    cmd_dispatch_0E
        push    0eeh
        push    1ch
        push    3
        nop
        push    cs
        call    cmd_dispatch_0E
        push    0f0h
        push    1ch
        push    3
        nop
        push    cs
        call    cmd_dispatch_0E
        pop     si
        pop     di
        leave
        retf    4
        db      00h
L_043E2:
        mov     al, byte ptr [PGM_SLOT]
        cbw
        push    ax
        nop
        push    cs
        call    program_select
        retf
        db      00h

L_043EE:
        push    ds
        push    PGM_SLOT
        push    1
        mov     al, byte ptr [TBL_1360]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [TBL_1361]
        push    ax
        push    TEXT2_SEG
        push    L_043E2
        cmp     byte ptr [G_STATE_9D8B], 2
        jl      disk_error_report
        mov     ax, L_04588
        mov     dx, TEXT2_SEG
        jmp     X_0441A
        db      90h

disk_error_report:
        mov     ax, X_04888
        mov     dx, TEXT2_SEG

X_0441A:
        push    dx
        push    ax
        nop
        push    cs
        call    seq_write_data
        retf
L_04422:
        nop
        push    cs
        call    far_04206
        retf

X_04428:
        push    ds
        push    G_STATE_9D8B
        push    3
        mov     al, byte ptr [B_1362]
        push    ax
        mov     al, byte ptr [B_1363]
        push    ax
        push    0ah
        push    TEXT2_SEG
        push    L_04422
        nop
        push    cs
        call    voice_trigger_full
        retf

voice_process_setup:
        enter   4, 0
        push    si
        cmp     byte ptr [G_STATE_9D8B], 2
        jge     br_04462
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        nop
        push    cs
        call    channel_validate
        add     sp, 2
        add     ax, 45h
        jmp     L_04470
br_04462:
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        nop
        push    cs
        call    channel_get_ptr
        add     sp, 2
        inc     ax

L_04470:
        mov     si, ax
        mov     al, byte ptr [bp+6]
        mov     es, dx
        xor     byte ptr es:[si], al
        cmp     byte ptr [G_STATE_9D8B], 2
        jl      T2_br_04490
        mov     al, byte ptr [G_STATE_9D8B]
        push    ax
        nop

L_04486:
        push    cs
        call    smem_dma_channel_23
        pop     si
        leave
        retf    2
        db      90h

T2_br_04490:
        mov     al, byte ptr [G_STATE_9D8B]
        push    ax
        nop
        push    cs
        call    smem_dma_channel_01
        pop     si
        leave
        retf    2

X_0449E:
        push    ds
        push    P_13DE
        callf   TEXT1_SEG:disp_list_run
        push    0a9h
        push    0ah
        push    ds
        push    P_4D0A
        nop
        push    cs
        call    cmd_caller_setup
        retf

L_044B6:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        if      FW_VERSION = 172
voice_process_full              equ     $+1
        endif
        mov     cx, ax
        sub     ax, 2
        push    ax
        mov     si, cx
        nop
        push    cs
        call    channel_validate
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+FXS_FIELD_47]
        cbw
        mov     bx, ax
        mov     ax, si
        shl     si, 2
        add     si, ax
        add     bx, si
        shl     bx, 2
        push    word ptr [bx+P_1302]
        push    word ptr [bx+P_1300]
        nop
        push    cs
        call    cmd_sequence_handler
        mov     al, byte ptr [B_1364]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [B_1365]
        sub     ax, 9
        push    ax
        push    ds
        push    STR_FX_INPUT
        nop
        push    cs
        call    cmd_dispatch_1E
        push    0b6h
        push    17h
        push    ds
        push    STR_FX_REV_1
        nop
        push    cs
        call    track_select_setup
        push    0d9h
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        nop
        push    cs
        call    channel_get_ptr
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+FXR_FIELD_01]
        and     al, 1
        cmp     al, 1
        sbb     ax, ax
        and     al, 0f4h
        add     ax, 23h
        push    ax
        push    ds
        push    STR_FX_MIX_1
        nop
        push    cs
        call    track_select_setup
        nop
        push    cs
        call    field_redraw
        pop     ds
        pop     si
        retf
L_0454E:
        mov     al, byte ptr [G_STATE_9D8B]
        sub     al, 2
        push    ax
        nop
        push    cs
        call    smem_dma_channel_01
        retf

X_0455A:
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        sub     ax, 2
        push    ax
        nop
        push    cs
        call    channel_validate
        add     sp, 2
        add     ax, 47h
        push    dx
        push    ax
        push    4
        mov     al, byte ptr [B_1364]
        push    ax
        mov     al, byte ptr [B_1365]
        push    ax
        push    0eh
        push    TEXT2_SEG
        push    L_0454E
        nop
        push    cs
        call    voice_trigger_full
        retf
        db      00h

L_04588:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     bx, word ptr [FXEDIT_CURSOR]
        mov     al, byte ptr [bx+TBL_1474]
        cbw
        mov     si, ax
        nop
        push    cs
        call    fx_type_load
        shl     si, 2
        callf   [si+TBL_147A]
        pop     ds
        pop     si
        retf
        db      00h
L_045AA:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    1
        nop
        push    cs
        call    voice_process_setup
        pop     ds
        retf
        db      00h

; render loop unrolled x6, bit-testing G_STATE_9D8B
track_flags_render_6rows:
        enter   2, 0
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        nop
        push    cs
        call    channel_validate
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+FXS_FIELD_45]
        mov     byte ptr [bp-1], al
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+P_1358]
        push    word ptr [bx+P_1356]
        nop
        push    cs
        call    cmd_sequence_handler
        push    2ah
        mov     al, byte ptr [bp-1]
        and     al, 20h
        cmp     al, 1
        sbb     ax, ax
        and     al, 0f4h
        add     ax, 23h
        push    ax
        push    ds
        push    STR_FX_DIST_1
        nop
        push    cs
        call    track_select_setup
        push    4dh
        mov     al, byte ptr [bp-1]
        and     al, 10h
        cmp     al, 1
        sbb     ax, ax
        and     al, 0f4h
        add     ax, 23h
        push    ax
        push    ds
        push    STR_FX_FILT_1
        nop
        push    cs
        call    track_select_setup
        push    70h
        mov     al, byte ptr [bp-1]
        and     al, 8
        cmp     al, 1
        sbb     ax, ax
        and     al, 0f4h
        add     ax, 23h
        push    ax
        push    ds
        push    STR_FX_MOD_1
        nop
        push    cs
        call    track_select_setup
        push    93h
        mov     al, byte ptr [bp-1]
        and     al, 4
        cmp     al, 1
        sbb     ax, ax
        and     al, 0f4h
        add     ax, 23h
        push    ax
        push    ds
        push    STR_FX_ECHO_1
        nop
        push    cs
        call    track_select_setup
        push    0b6h
        mov     al, byte ptr [bp-1]
        and     al, 2
        cmp     al, 1
        sbb     ax, ax
        and     al, 0f4h
        add     ax, 23h
        push    ax
        push    ds
        push    STR_FX_REV_2
        nop
        push    cs
        call    track_select_setup
        push    0d9h
        mov     al, byte ptr [bp-1]
        and     al, 1
        cmp     al, 1
        sbb     ax, ax
        and     al, 0f4h
        add     ax, 23h
        push    ax
        push    ds
        push    STR_FX_MIX_2
        nop
        push    cs
        call    track_select_setup
        nop
        push    cs
        call    field_redraw
        pop     ds
        leave
        retf
        db      00h

track_process_full:
        enter   2, 0

L_0469E:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        nop
        push    cs
        call    channel_validate
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+FXS_FIELD_45]
        mov     byte ptr [bp-1], al
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+P_1358]
        push    word ptr [bx+P_1356]
        nop
        push    cs
        call    cmd_sequence_handler
        push    2ah
        mov     al, byte ptr [bp-1]
        and     al, 20h
        cmp     al, 1
        sbb     ax, ax
        and     al, 0f4h
        add     ax, 23h
        push    ax
        push    ds
        push    STR_FX_DIST_2
        nop
        push    cs
        call    track_select_setup
        push    4dh
        mov     al, byte ptr [bp-1]
        and     al, 10h
        cmp     al, 1
        sbb     ax, ax
        and     al, 0f4h
        add     ax, 23h
        push    ax
        push    ds
        push    STR_FX_FILT_2
        nop
        push    cs
        call    track_select_setup
        push    70h
        mov     al, byte ptr [bp-1]
        and     al, 2
        cmp     al, 1
        sbb     ax, ax
        and     al, 0f4h
        add     ax, 23h
        push    ax
        push    ds
        push    STR_FX_REV_3
        nop
        push    cs
        call    track_select_setup
        push    93h
        mov     al, byte ptr [bp-1]
        and     al, 8
        cmp     al, 1
        sbb     ax, ax
        and     al, 0f4h
        add     ax, 23h
        push    ax
        push    ds
        push    STR_FX_MOD_2
        nop
        push    cs
        call    track_select_setup
        push    0b6h
        mov     al, byte ptr [bp-1]
        and     al, 4
        cmp     al, 1
        sbb     ax, ax
        and     al, 0f4h
        add     ax, 23h
        push    ax
        push    ds
        push    STR_FX_ECHO_2
        nop
        push    cs

L_04753:
        call    track_select_setup
        push    0d9h
        mov     al, byte ptr [bp-1]
        and     al, 1
        cmp     al, 1
        sbb     ax, ax
        and     al, 0f4h
        add     ax, 23h
        push    ax
        push    ds
        push    STR_FX_MIX_3
        nop
        push    cs
        call    track_select_setup
        nop
        push    cs
        call    field_redraw
        pop     ds
        leave
        retf
        db      00h
track_process_ext:
        enter   2, 0
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        nop
        push    cs
        call    channel_validate
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+FXS_FIELD_45]
        mov     byte ptr [bp-1], al
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+P_1358]
        push    word ptr [bx+P_1356]
        nop
        push    cs
        call    cmd_sequence_handler
        push    12h
        push    6ch
        push    11h
        push    7ch
        push    3
        nop
        push    cs
        call    cmd_build_params
        push    12h
        push    6ch
        push    14h
        push    3
        push    8
        nop
        push    cs
        call    cmd_build_params
        push    12h
        push    0e5h
        push    14h
        push    3
        push    8
        nop
        push    cs
        call    cmd_build_params
        push    2ah
        mov     al, byte ptr [bp-1]
        and     al, 20h
        cmp     al, 1
        sbb     ax, ax
        and     al, 0f4h
        add     ax, 23h
        push    ax
        push    ds
        push    STR_FX_DIST_3
        nop
        push    cs
        call    track_select_setup
        push    4dh
        mov     al, byte ptr [bp-1]
        and     al, 10h
        cmp     al, 1
        sbb     ax, ax
        and     al, 0f4h
        add     ax, 23h
        push    ax
        push    ds
        push    STR_FX_FILT_3
        nop
        push    cs
        call    track_select_setup
        push    70h
        mov     al, byte ptr [bp-1]
        and     al, 8
        cmp     al, 1
        sbb     ax, ax
        and     al, 0e9h
        add     ax, 23h
        push    ax
        push    ds
        push    STR_FX_MOD_3
        nop
        push    cs
        call    track_select_setup
        push    93h
        mov     al, byte ptr [bp-1]

L_04834:
        and     al, 4
        cmp     al, 1
        sbb     ax, ax
        and     al, 0e9h
        add     ax, 23h
        push    ax
        push    ds
        push    STR_FX_ECHO_3
        nop
        push    cs
        call    track_select_setup
        push    0b6h
        mov     al, byte ptr [bp-1]
        and     al, 2
        cmp     al, 1
        sbb     ax, ax
        and     al, 0f4h
        add     ax, 23h
        push    ax
        push    ds

L_0485C:
        push    STR_FX_REV_4
        nop
        push    cs
        call    track_select_setup
        push    0d9h
        mov     al, byte ptr [bp-1]
        and     al, 1
        cmp     al, 1
        sbb     ax, ax
        and     al, 0f4h
        add     ax, 23h
        push    ax
        push    ds
        push    STR_FX_MIX_4
        nop
        push    cs
        call    track_select_setup
        nop
        push    cs
        call    field_redraw
        pop     ds
        leave
        retf
        db      00h

X_04888:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     bx, word ptr [FXEDIT_CURSOR]
        mov     al, byte ptr [bx+TBL_151E]
        cbw
        mov     si, ax
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        nop
        push    cs
        call    channel_validate
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        cmp     byte ptr es:[bx+FXS_FIELD_46], 1
        jne     X_048B9
        mov     al, byte ptr [si+TBL_1526]
        cbw
        mov     si, ax

X_048B9:
        nop
        push    cs
        if      FW_VERSION = 172
L_048BC                         equ     $+1
        endif
        call    fx_type_load
        shl     si, 2
        callf   [si+TBL_152E]
        pop     ds
        pop     si
        retf

L_048C8:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     word ptr [FXEDIT_CURSOR], 2
        jl      br_04908
        cmp     word ptr [FXEDIT_CURSOR], 6
        jg      br_04908
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        nop
        push    cs
        call    channel_validate
        add     sp, 2
        mov     es, dx
        mov     bx, ax

L_048EE:
        cmp     byte ptr es:[bx+FXS_FIELD_46], 1
        je      L_048FA
        mov     bx, P_154A
        jmp     br_048FD

L_048FA:
        mov     bx, P_1550

br_048FD:
        mov     si, word ptr [FXEDIT_CURSOR]
        mov     al, byte ptr [bx+si-2]
        push    ax
        jmp     br_0490A
        db      90h

br_04908:
        push    1

br_0490A:
        nop
        push    cs
        call    voice_process_setup
        pop     ds
        pop     si
        retf

cmd_exec_pair:
        enter   8, 0
        push    di
        push    si
        mov     di, word ptr [bp+0ah]
        mov     si, word ptr [bp+0ch]
        push    64h
        push    word ptr [bp+8]
        callf   TEXT1_SEG:_div
        add     sp, 4
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        push    si
        push    di
        cwd
        push    dx
        push    ax
        mov     ax, word ptr [bp+6]
        sub     ax, 2
        push    ax
        nop
        push    cs
        call    draw_unsigned_value
        mov     byte ptr [bp-1], 0
        mov     ax, word ptr [bp-6]
        mov     cx, 0ah
        cwd
        idiv    cx
        add     dl, 30h
        mov     byte ptr [bp-2], dl
        mov     ax, word ptr [bp-6]
        cwd
        idiv    cx
        add     al, 30h
        mov     byte ptr [bp-3], al
        mov     byte ptr [bp-4], 2eh
        lea     ax, [si+0ch]
        push    ax
        push    di
        lea     ax, [bp-4]
        push    ss
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        pop     si
        pop     di
        leave
        retf    8
        db      00h
num_entry_draw:
        cmp     byte ptr [G_FLAG_8CA8], 0
        je      X_049C8
        mov     al, byte ptr [WIN_FIELD_BOX_R]
        sub     ah, ah
        if      FW_VERSION = 172
L_04988                         equ     $+2
        endif
        add     ax, 6
        push    ax
        mov     al, byte ptr [WIN_FIELD_BOX_B]
        sub     ah, ah
        push    ax
        push    6
        push    0
        nop
        push    cs
        call    cmd_param_setup
        mov     al, byte ptr [WIN_FIELD_X]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [EDIT_FIELD_Y]
        push    ax
        push    20h
        nop
        push    cs
        call    cmd_ratio_setup
        mov     al, byte ptr [WIN_FIELD_X]
        sub     ah, ah
        add     ax, 6
        push    ax
        mov     al, byte ptr [EDIT_FIELD_Y]
        sub     ah, ah
        push    ax
        push    word ptr [NUM_ENTRY_VALUE]
        mov     al, byte ptr [WIN_FIELD_DIGITS]
        cbw
        push    ax
        nop
        push    cs
        call    cmd_exec_pair
        retf
X_049C8:
        cmp     byte ptr [G_SEQ_MODE], 2
        jge     X_049DA
        mov     al, byte ptr [WIN_FIELD_DIGITS]
        sub     al, byte ptr [G_SEQ_MODE]
        add     al, 2
        jmp     SHORT X_049E3

X_049DA:
        mov     al, byte ptr [WIN_FIELD_DIGITS]
        sub     al, byte ptr [G_SEQ_MODE]
        inc     al

X_049E3:
        mov     cl, al
        add     al, al
        add     al, cl
        add     al, al
        mov     byte ptr [WIN_FIELD_BOX_W], al
        mov     al, byte ptr [EDIT_CURSOR_X]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [EDIT_CURSOR_Y]
        push    ax
        mov     al, byte ptr [WIN_FIELD_BOX_W]
        push    ax
        mov     al, byte ptr [EDIT_CURSOR_H]
        push    ax
        nop
        push    cs
        call    cmd_param_setup
        retf
cmd_exec_1E:
        enter   4, 0
        push    si
        mov     si, word ptr [bp+6]
        or      si, si
        jne     br_04A22
        mov     ax, word ptr [W_1556]
        mov     dx, word ptr [W_1558]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        jmp     br_04A51
        db      90h

br_04A22:
        or      si, si
        jl      br_04A2A
        mov     al, 52h
        jmp     br_04A2C

br_04A2A:
        mov     al, 4ch
br_04A2C:
        mov     byte ptr [bp-4], al
        mov     ax, si
        cwd
        xor     ax, dx
        sub     ax, dx
        mov     si, ax
        mov     cx, 0ah
        cwd
        idiv    cx
        add     al, 30h
        mov     byte ptr [bp-3], al
        mov     ax, si
        cwd
        idiv    cx
        add     dl, 30h
        mov     byte ptr [bp-2], dl
        mov     byte ptr [bp-1], ch
br_04A51:
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        lea     ax, [bp-4]
        push    ss
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        pop     si
        leave
        retf    6
cmd_dispatch_caller2:
        enter   8, 0
        mov     ax, word ptr [W_1582]
        mov     dx, word ptr [W_1584]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    14h
        mov     al, byte ptr [bp+6]
        cbw
        push    ax
        callf   TEXT1_SEG:_div
        add     sp, 4
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        or      ax, ax
        je      br_04A9C
        dec     ax
        je      br_04AC2
        dec     ax
        je      br_04AAA
        dec     ax

        je      L_04ABE
        jmp     br_04ACD
        db      90h

br_04A9C:
        mov     bx, dx
        add     bx, dx
        mov     ax, word ptr [bx+TBL_155A]
        mov     word ptr [bp-3], ax
        jmp     br_04ACD
        db      90h

br_04AAA:
        mov     bx, dx
        add     bx, dx
        mov     al, byte ptr [bx+TBL_155A]
        mov     byte ptr [bp-4], al
        mov     al, byte ptr [bx+TBL_155B]
        mov     byte ptr [bp-2], al
        jmp     br_04ACD

L_04ABE:
        mov     byte ptr [bp-2], 6bh

br_04AC2:
        mov     bx, dx
        add     bx, dx
        mov     ax, word ptr [bx+TBL_155A]
        mov     word ptr [bp-4], ax

br_04ACD:
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        lea     ax, [bp-4]
        push    ss
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        leave
        retf    6
        db      00h
cmd_dispatch_handler_2:
        push    bp
        mov     bp, sp
        push    di
        push    si
        cmp     byte ptr [bp+6], 0dbh
        jle     br_04B06
        mov     di, word ptr [bp+0ah]
        mov     si, word ptr [bp+8]
        push    di
        push    si
        mov     al, byte ptr [bp+6]
        cbw
        cwd
        push    dx
        push    ax
        push    2
        nop
        push    cs
        call    draw_signed_value
        jmp     L_04B1A
        db      90h

br_04B06:
        mov     di, word ptr [bp+0ah]
        mov     si, word ptr [bp+8]
        push    di
        lea     ax, [si+1]
        push    ax
        push    ds
        push    P_4CF9
        nop
        push    cs
        call    cmd_caller_setup

L_04B1A:
        lea     ax, [di+12h]
        push    ax

L_04B1E:
        push    si
        push    ds
        push    STR_DB
        nop
        push    cs
        call    cmd_dispatch_1E
        pop     si
        pop     di
        leave
        retf    6
        if      FW_VERSION = 172

L_04B2E_1:
        nop
        push    cs

L_04B30:
        call    dma_018ee
        retf

        endif
fx_redraw:
        mov     al, byte ptr [G_STATE_9D8B]
        push    ax
        mov     al, byte ptr [B_4FE1]
        push    ax
        nop
        push    cs
        call    lcd_clear_region_impl
        retf
far_04B42:
        mov     al, byte ptr [G_STATE_9D8B]
        push    ax
        mov     al, byte ptr [B_4FE1]
        push    ax
        nop
        push    cs
        call    lcd_clear_rect
        retf

voice_process_triple:
        push    bp
        mov     bp, sp
        and     byte ptr [B_4FE2], 0fdh
        if      FW_VERSION = 172
L_04B5A                         equ     $+2
L_04B5C                         equ     $+4
        endif
        xor     byte ptr [B_4FE2], 1
        test    byte ptr [B_4FE2], 1
        je      tgt_04B6E
        mov     al, byte ptr [bp+6]
        not     al
        and     al, 0feh
        jmp     L_04BA0
        db      90h

tgt_04B6E:
        cmp     byte ptr [G_STATE_9D8B], 2
        jge     br_04B8C
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        nop
        push    cs
        call    channel_validate
        mov     sp, bp
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+FXS_FIELD_45]
        jmp     L_04BA0
        db      90h
br_04B8C:
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        nop
        push    cs
        call    channel_get_ptr
        mov     sp, bp
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+FXR_FIELD_01]

L_04BA0:
        mov     byte ptr [B_4FE1], al
        cmp     byte ptr [G_STATE_9D8B], 2
        jge     br_04BB4
        nop

L_04BAB:
        push    cs
        call    fx_redraw
        leave

L_04BB0:
        retf    2
        db      90h

br_04BB4:
        nop
        push    cs
        call    far_04B42
        leave
        retf    2
        db      00h

voice_dispatch_table:
        push    bp
        mov     bp, sp
        and     byte ptr [B_4FE2], 0feh
        xor     byte ptr [B_4FE2], 2
        cmp     byte ptr [G_STATE_9D8B], 2
        jge     L_04BE8
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        nop
        push    cs
        call    channel_validate
        mov     sp, bp
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+FXS_FIELD_45]
        jmp     br_04BFC

L_04BE8:
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        nop
        push    cs
        call    channel_get_ptr
        mov     sp, bp

L_04BF4:
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+1]

br_04BFC:
        mov     byte ptr [B_4FE1], al
        test    byte ptr [B_4FE2], 2
        je      br_04C0D
        mov     al, byte ptr [bp+6]
        if      FW_VERSION = 172
L_04C0A                         equ     $+1
        endif
        or      byte ptr [B_4FE1], al

br_04C0D:
        cmp     byte ptr [G_STATE_9D8B], 2
        jge     br_04C1E
        nop
        push    cs
        call    fx_redraw
        leave
        retf    2
        db      90h

br_04C1E:
        nop
        push    cs
        call    far_04B42
        leave
        retf    2
        db      00h

fx_type_load:
        mov     byte ptr [B_4FE2], 0
        cmp     byte ptr [G_STATE_9D8B], 2
        jge     X_04C4E
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        nop
        push    cs
        call    channel_validate
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+FXS_FIELD_45]
        mov     byte ptr [B_4FE1], al
        retf
        db      90h

X_04C4E:
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        nop
        push    cs
        call    channel_get_ptr
        add     sp, 2
        if      FW_VERSION = 172
L_04C5C                         equ     $+1
        endif
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+FXR_FIELD_01]
        mov     byte ptr [B_4FE1], al
        retf
        db      00h

tgt_04C68:
        push    ds
        mov     cx, DATA_SEG
TGT_04C68_V150:
        mov     ds, cx
        mov     cx, ax
        sub     ax, word ptr [G_FX_BLINK_TICK]
        cmp     ax, 1f4h
        jbe     br_04C87
        mov     word ptr [G_FX_BLINK_TICK], cx
        xor     byte ptr [B_4FE2], 80h
        nop
        push    cs
        call    cmd_far_stub2

br_04C87:
        pop     ds
        retf
        db      00h

far_04C8A:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        test    byte ptr [B_4FE2], 3
        je      br_04CA0
        mov     al, byte ptr [G_STATE_9D8B]
        push    ax
        nop
        push    cs
        call    smem_dma_channel_01
br_04CA0:
        nop
        push    cs
        call    fx_type_load
        sub     ax, ax
        mov     word ptr [FP_POLL_HOOK_SEG], ax
        mov     word ptr [FP_POLL_HOOK], ax
        pop     ds
        retf
        db      00h

L_04CB0:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_04C8A
        nop
        push    cs
        call    far_04206
        pop     ds
        retf

X_04CC2:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        if      FW_VERSION = 150
L_1267C                         equ     $+4
        endif
        cmp     byte ptr [G_STATE_9D8B], 2
        jge     L_04CDE
        push    word ptr [FP_UI_RETURN_SCREEN_SEG]
        push    word ptr [FP_UI_RETURN_SCREEN]
        callf   TEXT1_SEG:audio_dispatch_table
        pop     ds
        retf

L_04CDE:
        push    word ptr [FP_UI_RETURN_SCREEN_SEG]
        push    word ptr [FP_UI_RETURN_SCREEN]
        callf   TEXT1_SEG:ui_screen_enter_edit
        pop     ds
        retf
        db      00h

L_04CEE:
        nop
        push    cs
        call    fx_type_load
        callf   TEXT1_SEG:X_039A8
        retf
        db      00h

L_04CFA:
        push    ds
        mov     cx, DATA_SEG
L_126AE:
        mov     ds, cx
        push    20h
        nop
        push    cs
        call    voice_process_triple
        pop     ds
        retf
        db      00h

L_04BBA:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    20h
        nop
        push    cs
        call    voice_dispatch_table
        pop     ds
        retf
        db      00h

L_04D1A:
        nop
        push    cs
        call    fx_type_load
        callf   TEXT1_SEG:X_03B46
        retf
        db      00h

filter4_f2:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    10h
        nop
        push    cs
        call    voice_process_triple
        pop     ds
        retf
        db      00h

filter4_f3:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    10h
        nop
        push    cs
        call    voice_dispatch_table
        pop     ds
        retf
        db      00h

far_04D46:
        mov     al, byte ptr [G_FX_EFFECT_SEL]
        cbw
        cmp     ax, 6
        ja      L_04D7D
        add     ax, ax
        xchg    bx, ax
        jmp     word ptr cs:[bx+P_4D58]
        db      90h

P_4D58:
        dw      X_04D66, X_04D66, X_04D66, X_04D6C
        dw      L_04D72, L_04D78_1, L_04D78_1

X_04D66:
        callf   TEXT1_SEG:X_03F3E
        retf

X_04D6C:
        callf   TEXT1_SEG:X_04058
        retf

L_04D72:
        callf   TEXT1_SEG:X_041CE
        retf

L_04D78_1:
        callf   TEXT1_SEG:X_04352

L_04D7D:
        retf

L_04D7E:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        nop
        push    cs
        call    channel_validate
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, ax
        if      FW_VERSION = 150
L_04DB8:
        endif
        cmp     byte ptr es:[bx+FXS_MOD_TYPE], 0
        jne     br_04DA6
        mov     al, byte ptr es:[si+FXS_FIELD_17]
        jmp     L_04DAC
        db      90h

br_04DA6:
        mov     al, byte ptr es:[si+FXS_MOD_TYPE]
        add     al, 2

L_04DAC:
        mov     byte ptr [G_FX_EFFECT_SEL], al
        nop
        push    cs
        call    far_04D46
        pop     ds
        pop     si
        retf
        db      00h
fx_type_load_select:
        nop
        push    cs
        call    fx_type_load
        nop
        push    cs
        call    L_04D7E
        retf
        db      00h

L_04DC4:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    8
        nop
        push    cs
        call    voice_process_triple
        pop     ds
        retf
        db      00h

L_04C84:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    8
        nop
        push    cs
        call    voice_dispatch_table
        pop     ds
        retf
        db      00h

L_04DE4:
        push    si
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        nop
        push    cs
        call    channel_validate
        add     sp, 2
        mov     si, ax
        cmp     byte ptr [G_FX_EFFECT_SEL], 2
        jg      br_04E0C
        mov     es, dx
        mov     byte ptr es:[si+FXS_MOD_TYPE], 0
        mov     al, byte ptr [G_FX_EFFECT_SEL]
        mov     byte ptr es:[si+FXS_FIELD_17], al
        jmp     L_04E17
        db      90h

br_04E0C:
        mov     al, byte ptr [G_FX_EFFECT_SEL]
        sub     al, 2
        mov     es, dx
        mov     byte ptr es:[si+FXS_MOD_TYPE], al

L_04E17:
        nop
        push    cs
        call    far_04D46
        nop
        push    cs
        call    fx_redraw
        pop     si
        retf
        db      00h

X_04E24:
        push    ds
        push    G_FX_EFFECT_SEL
        push    6
        push    31h
        push    0bh
        push    10h
        push    TEXT2_SEG
        push    L_04DE4
        nop
        push    cs
        call    voice_trigger_full
        retf

fx_chorus_paint:
        push    di

L_04E3D:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_17B4
        callf   TEXT1_SEG:ctrl_change_table_dispatch
        push    0bbh
        push    15h
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        nop
        push    cs
        call    channel_validate
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+FXS_MOD_SPEED]
        sub     ah, ah
        push    ax
        push    2
        mov     si, bx
        mov     di, dx
        nop
        push    cs
        call    ratio_calc_divide
        push    0bbh
        push    1fh
        mov     es, di
        mov     al, byte ptr es:[si+19h]
        sub     ah, ah
        push    0
        push    ax
        push    2
        nop
        push    cs
        call    draw_unsigned_value
        push    0bbh
        push    29h
        mov     es, di
        mov     al, byte ptr es:[si+1ah]
        cbw
        cwd
        push    dx
        push    ax
        push    2
        nop
        push    cs
        call    draw_signed_value
        nop
        push    cs
        call    field_redraw
        pop     ds
        pop     si
        pop     di
        retf
        db      00h

fx_rotary_paint:
        push    di
        if      FW_VERSION = 172

tgt_04EAD:
        endif
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_1804
        callf   TEXT1_SEG:ctrl_change_table_dispatch
        push    43h
        push    19h
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        nop
        push    cs
        call    channel_validate
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+FXS_FIELD_1B]
        sub     ah, ah
        push    ax
        push    2
        mov     si, bx
        mov     di, dx
        nop
        push    cs
        call    ratio_calc_divide
        push    43h
        push    24h
        mov     es, di
        mov     al, byte ptr es:[si+1eh]
        sub     ah, ah
        push    0
        push    ax
        push    2
        nop
        push    cs
        call    draw_unsigned_value
        push    0c7h
        push    15h
        mov     es, di
        mov     al, byte ptr es:[si+1fh]
        sub     ah, ah
        push    0
        push    ax
        push    3
        nop
        push    cs
        call    draw_unsigned_value
        push    0c7h
        push    1fh
        mov     es, di
        mov     al, byte ptr es:[si+1dh]
        sub     ah, ah
        push    ax
        push    2
        nop
        push    cs
        call    ratio_calc_divide
        push    0c7h
        push    29h
        mov     es, di
        mov     al, byte ptr es:[si+1ch]
        sub     ah, ah
        push    ax
        push    2
        nop
        push    cs
        call    ratio_calc_divide
        nop
        push    cs
        call    field_redraw
        if      FW_VERSION = 150

tgt_04EAD:
        endif
        pop     ds
        pop     si
        pop     di
        retf

L_04F44:
        push    di
        if      FW_VERSION = 172

tgt_04F45:
        endif
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_18A6
        callf   TEXT1_SEG:ctrl_change_table_dispatch
        push    6dh
        push    15h
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        nop
        push    cs
        call    channel_validate
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        if      FW_VERSION = 150

tgt_04F45:
        endif
        mov     al, byte ptr es:[bx+FXS_FIELD_20]
        sub     ah, ah
        push    ax
        push    2
        mov     si, bx
        mov     di, dx
        nop
        push    cs
        call    ratio_calc_divide
        push    6dh
        push    1fh
        mov     es, di
        mov     al, byte ptr es:[si+21h]
        sub     ah, ah
        push    0
        push    ax
        push    2
        nop
        push    cs
        call    draw_unsigned_value
        push    6dh
        push    29h
        mov     es, di
        mov     al, byte ptr es:[si+22h]
        sub     ah, ah
        push    0
        push    ax
        push    2
        nop
        push    cs
        call    draw_unsigned_value
        push    0c1h
        push    15h
        mov     es, di
        mov     al, byte ptr es:[si+23h]
        sub     ah, ah
        push    ax
        push    2
        nop
        push    cs
        call    ratio_calc_divide
        push    0c1h
        push    1fh
        mov     es, di
        mov     al, byte ptr es:[si+24h]
        sub     ah, ah
        push    0
        push    ax
        push    2
        nop
        push    cs
        call    draw_unsigned_value
        push    0c1h
        push    29h
        mov     es, di
        mov     al, byte ptr es:[si+25h]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+FX_PAN_LABELS+2]
        push    word ptr [bx+FX_PAN_LABELS]
        nop
        push    cs
        call    cmd_dispatch_1E
        nop
        push    cs
        call    field_redraw
        pop     ds
        pop     si
        pop     di
        retf
        db      00h
lcd_init_setup:
        push    bp
        mov     bp, sp
        push    di
        mov     bx, word ptr [bp+6]
        mov     ax, bx
        mov     cx, bx
        cwd
        sub     dh, dh
        add     ax, dx
        sar     ax, 8
        imul    ax, ax, 64h
        mov     bx, ax
        mov     dx, 100h
        mov     di, dx
        mov     ax, cx
        cwd
        idiv    di
        imul    ax, dx, 64h
        add     ax, 80h
        cwd
        sub     dh, dh
        add     ax, dx
        sar     ax, 8
        add     ax, bx
        pop     di
        leave
        retf    2
        db      00h
voice_ratio_calc:
        enter   4, 0
        push    64h
        push    word ptr [bp+6]
        callf   TEXT1_SEG:_div
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     ah, byte ptr [bp-2]
        sub     al, al
        mov     cx, 64h
        cwd
        idiv    cx
        mov     ch, byte ptr [bp-4]
        sub     cl, cl
        add     ax, cx
        leave
        retf    2
lcd_init_display:
        enter   4, 0
        push    di
        push    si
        mov     di, word ptr [bp+8]
        mov     si, word ptr [bp+0ah]
        push    si
        push    di
        mov     word ptr [bp-2], si
        mov     word ptr [bp-4], di
        cmp     word ptr [bp+6], 0

        jl      br_0507C
        mov     al, 20h
        jmp     br_0507E

br_0507C:
        mov     al, 2dh

br_0507E:
        push    ax
        nop
        push    cs
        call    cmd_ratio_setup
        mov     ax, word ptr [bp-2]
        add     ax, 6
        push    ax
        push    word ptr [bp-4]
        mov     ax, word ptr [bp+6]
        cwd
        xor     ax, dx
        sub     ax, dx
        push    ax
        nop
        push    cs
        call    lcd_init_setup
        push    ax
        push    4
        nop
        push    cs
        call    cmd_exec_pair
        pop     si
        pop     di
        leave
        retf    6
L_050AA:
        les     bx, [WIN_FIELD_VAR]
        push    word ptr es:[bx]
        nop
        push    cs
        call    voice_ratio_calc
        les     bx, [P_A724]
        mov     word ptr es:[bx], ax
        nop
        push    cs
        call    fx_redraw
        retf
        db      00h

cmd_exec_multi:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+0ah]
        mov     ax, word ptr [bp+0ch]
        mov     word ptr [P_A724], si
        mov     word ptr [P_A726], ax
        mov     es, ax
        push    word ptr es:[si]
        nop
        push    cs
        call    lcd_init_setup
        mov     word ptr [G_EDIT_FIELD_VAL], ax
        push    ds
        push    G_EDIT_FIELD_VAL
        push    0ec78h
        push    1388h
        push    4
        mov     al, byte ptr [bp+8]
        push    ax
        mov     al, byte ptr [bp+6]
        push    ax
        push    TEXT2_SEG
        push    num_entry_draw
        push    TEXT2_SEG
        push    L_050AA
        nop
        push    cs
        call    status_read_6A_2
        pop     si
        leave
        retf    8

status_read_6A_4:
        enter   4, 0

L_05110:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_1930
        callf   TEXT1_SEG:ctrl_change_table_dispatch
        push    91h
        push    15h
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        nop
        push    cs
        call    channel_validate
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, ax
        mov     word ptr [bp-2], es
        push    word ptr es:[bx+FXS_FIELD_26]
        nop
        push    cs
        call    lcd_init_display
        push    0bbh
        push    15h
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+FXS_FIELD_28]
        nop
        push    cs
        call    lcd_init_display
        cmp     byte ptr [G_FX_EFFECT_SEL], 6
        jne     br_051D0
        push    6dh
        push    1fh
        push    ds
        push    STR_FX_DELAY_MS
        nop
        push    cs
        call    cmd_dispatch_1E
        push    5bh
        push    29h
        push    ds
        push    STR_FX_FEEDBACK
        nop
        push    cs
        call    cmd_dispatch_1E
        push    97h
        push    1fh
        mov     es, word ptr [bp-2]
        push    0
        push    word ptr es:[si+FXS_FIELD_2A]
        push    3
        nop
        push    cs
        call    draw_unsigned_value
        push    0c1h
        push    1fh
        mov     es, word ptr [bp-2]
        push    0
        push    word ptr es:[si+FXS_FIELD_2C]
        push    3
        nop
        push    cs
        call    draw_unsigned_value
        push    9dh
        push    29h
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+FXS_FIELD_2E]
        sub     ah, ah
        push    0
        push    ax
        push    2
        nop
        push    cs
        call    draw_unsigned_value
        push    0c7h
        push    29h
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+FXS_FIELD_2F]
        sub     ah, ah
        push    0
        push    ax
        push    2
        nop
        push    cs
        call    draw_unsigned_value
br_051D0:
        nop
        push    cs
        call    field_redraw
        pop     ds
        pop     si
        leave
        retf
        db      00h

L_051DA:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    TEXT2_SEG
        push    L_051DA
        callf   TEXT1_SEG:ui_screen_enter_chan
        pop     ds
        retf
        db      00h

L_051EE:
        nop
        push    cs
        call    fx_type_load
        nop
        push    cs
        call    L_051DA
        retf
        db      00h

L_051FA:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    4
        nop
        push    cs
        call    voice_process_triple
        pop     ds
        retf
        db      00h

L_0520A:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    4
        nop
        push    cs
        call    voice_dispatch_table
        pop     ds
        retf
        db      00h

L_0521A:
        push    TEXT2_SEG
        push    L_051DA
        callf   TEXT1_SEG:ui_screen_enter_chan
        nop
        push    cs
        call    fx_redraw
        retf
        db      00h

L_050DC:
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        nop
        push    cs
        call    channel_validate
        add     sp, 2
        add     ax, 30h
        push    dx
        push    ax
        push    3
        push    31h
        push    0bh
        push    0ah
        push    TEXT2_SEG
        push    L_0521A
        nop
        push    cs
        call    voice_trigger_full
        retf

cmd_exec_2:
        enter   4, 0

L_05256:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_1A08
        callf   TEXT1_SEG:midi_dispatch_table
        push    0c1h
        push    0bh
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        nop
        push    cs
        call    channel_validate
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     si, ax
        mov     word ptr [bp-2], es
        mov     al, byte ptr es:[bx+FXS_ECHO_FEEDBACK]
        sub     ah, ah
        push    0
        push    ax
        push    2
        nop
        push    cs
        call    draw_unsigned_value
        mov     es, word ptr [bp-2]
        cmp     byte ptr es:[si+FXS_ECHO_TYPE], 2
        jne     L_052A2
        mov     cx, word ptr es:[si+FXS_ECHO_DELAY2]
        jmp     X_052A6
        db      90h

L_052A2:
        mov     cx, word ptr es:[si+FXS_ECHO_DELAY]

X_052A6:
        push    0c1h
        push    15h
        push    0
        push    cx
        push    3
        nop
        push    cs
        call    draw_unsigned_value
        push    0c1h
        push    1fh
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+FXS_ECHO_HFDAMP]
        push    ax
        nop
        push    cs
        call    cmd_dispatch_caller2
        push    0c1h
        push    29h
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+FXS_ECHO_LR_OFS]
        cbw
        cwd
        push    dx
        push    ax
        push    2
        nop
        push    cs
        call    draw_signed_value
        nop
        push    cs
        call    field_redraw
        pop     ds
        pop     si
        leave
        retf
        db      00h

L_052E8:
        push    di

L_052E9:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_1A5E
        callf   TEXT1_SEG:midi_dispatch_table
        push    9dh
        push    15h
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        nop
        push    cs
        call    channel_validate
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+FXS_FIELD_3A]
        sub     ah, ah
        push    0
        push    ax
        push    2
        mov     si, bx
        mov     di, dx
        nop
        push    cs
        call    draw_unsigned_value
        push    97h
        push    1fh
        mov     es, di
        push    0
        push    word ptr es:[si+38h]
        push    3
        nop
        push    cs
        call    draw_unsigned_value
        push    97h
        push    29h
        mov     es, di
        mov     al, byte ptr es:[si+3bh]
        push    ax
        nop
        push    cs
        call    cmd_dispatch_caller2
        push    0c7h
        push    15h
        mov     es, di
        mov     al, byte ptr es:[si+3eh]
        sub     ah, ah
        push    0
        push    ax
        push    2
        nop
        push    cs
        call    draw_unsigned_value
        push    0c1h
        push    1fh
        mov     es, di
        push    0
        push    word ptr es:[si+3ch]
        push    3
        nop
        push    cs
        call    draw_unsigned_value
        push    0c1h
        push    29h
        mov     es, di
        mov     al, byte ptr es:[si+3fh]
        push    ax
        nop
        push    cs
        call    cmd_dispatch_caller2
        nop
        push    cs
        call    field_redraw
        pop     ds
        pop     si
        pop     di
        retf
        db      00h

L_0538E:
        nop
        push    cs
        call    fx_type_load
        callf   TEXT1_SEG:X_04876
        retf
        db      00h

L_0539A:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    2
        nop
        push    cs
        call    voice_process_triple
        pop     ds
        retf
        db      00h

L_0525A:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    2
        nop
        push    cs
        call    voice_dispatch_table
        pop     ds
        retf
        db      00h

L_053BA:
        nop
        push    cs
        call    fx_type_load
        push    word ptr [FP_UI_RETURN_SCREEN_SEG]
        push    word ptr [FP_UI_RETURN_SCREEN]
        callf   TEXT1_SEG:audio_dispatch_table
        retf
        db      00h

cmd_exec_7:
        enter   4, 0
        push    di

L_053D3:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        nop
        push    cs
        call    channel_validate
        add     sp, 2
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    ds
        push    P_1C36
        callf   TEXT1_SEG:disp_list_run
        push    55h
        if      FW_VERSION = 172
        push    0bh
        else
        push    0eh
        endif
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+5]
        cbw
        shl     ax, 2
        add     ax, TBL_OFF_ON_LABELS
        push    ds
        push    ax
        mov     di, es
        nop
        push    cs
        call    cmd_dispatch_1E
        push    19h
        if      FW_VERSION = 172
        push    1fh
        else
        push    24h
        endif
        mov     es, di
        mov     al, byte ptr es:[si+FXS_FIELD_46]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+FX_ROUTE_LABELS+2]
        push    word ptr [bx+FX_ROUTE_LABELS]
        if      FW_VERSION = 172
        nop
        push    cs
        call    cmd_dispatch_1E
        push    3dh
        push    29h
        mov     al, byte ptr [B_9D8C]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+FX_OUT_PAIR_LABELS+2]
        push    word ptr [bx+FX_OUT_PAIR_LABELS]
        endif
        nop
        push    cs
        call    cmd_dispatch_1E
        push    0a9h
        push    15h
        mov     es, di
        mov     al, byte ptr es:[si+FXS_FIELD_14]
        sub     ah, ah
        push    0
        push    ax
        push    2
        nop
        push    cs
        call    draw_unsigned_value
        push    0a9h
        push    1fh
        mov     es, di
        mov     al, byte ptr es:[si+FXS_FIELD_40]
        sub     ah, ah
        push    0
        push    ax
        push    2
        nop
        push    cs
        call    draw_unsigned_value
        push    0a9h
        push    29h
        mov     es, di
        mov     al, byte ptr es:[si+FXS_FIELD_43]
        sub     ah, ah
        push    0
        push    ax
        push    2
        nop
        push    cs
        call    draw_unsigned_value
        push    0bbh
        push    15h
        mov     es, di
        mov     al, byte ptr es:[si+FXS_FIELD_15]
        cbw
        push    ax
        nop
        push    cs
        call    cmd_exec_1E
        push    0bbh
        push    1fh
        mov     es, di
        mov     al, byte ptr es:[si+FXS_FIELD_41]
        cbw
        push    ax
        nop
        push    cs
        call    cmd_exec_1E
        push    0bbh
        push    29h
        mov     es, di
        mov     al, byte ptr es:[si+FXS_FIELD_44]
        cbw
        push    ax
        nop
        push    cs
        call    cmd_exec_1E
        push    0d3h
        push    1fh
        mov     es, di
        mov     al, byte ptr es:[si+FXS_FIELD_42]
        sub     ah, ah
        push    0
        push    ax
        push    2
        nop
        push    cs
        call    draw_unsigned_value
        nop
        push    cs
        call    field_redraw
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h

L_054E4:
        nop
        push    cs
        call    fx_type_load
        push    word ptr [FP_UI_RETURN_SCREEN_SEG]
        push    word ptr [FP_UI_RETURN_SCREEN]
        callf   TEXT1_SEG:ui_screen_enter_edit
        retf
        db      00h

fx_mixer_lr_paint:
        push    di

L_054F9:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_EFFECT_MIXER
        callf   TEXT1_SEG:disp_list_run
        push    0a7h
        push    0bh
        push    ds
        push    STR_LEV_PAN_HDR
        nop
        push    cs
        call    cmd_dispatch_1E
        push    7fh
        push    1fh
        push    ds
        push    STR_REVERB_LBL
        nop
        push    cs
        call    cmd_dispatch_1E
        push    0a9h
        push    1fh
        mov     al, byte ptr [G_STATE_9D8B]
        cbw
        push    ax
        nop
        push    cs
        call    channel_get_ptr
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+FXR_FIELD_0A]
        sub     ah, ah
        push    0
        push    ax
        push    2
        mov     si, bx
        mov     di, dx
        nop
        push    cs
        call    draw_unsigned_value
        push    0bbh
        push    1fh
        mov     es, di
        mov     al, byte ptr es:[si+0bh]
        cbw
        push    ax
        nop
        push    cs
        call    cmd_exec_1E
        nop
        push    cs
        call    field_redraw
        pop     ds
        pop     si
        pop     di
        retf
        db      00h

cmd_block_copy:
        enter   12h, 0
        push    di

L_0556F:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_COPY_SRC_PGM]
        cbw
        mov     bx, ax
        shl     bx, 2
        mov     ax, word ptr [bx+PGM_TABLE]
        mov     dx, word ptr [bx+PGM_TABLE+2]
        mov     cl, byte ptr [G_COPY_SRC_NOTE]
        sub     ch, ch
        imul    bx, cx, 48h
        mov     si, ax
        add     ax, bx
        add     ax, PGM_FX_SECTIONS
        mov     word ptr [bp-0eh], ax
        mov     word ptr [bp-0ch], dx
        mov     ax, cx
        add     cx, cx
        add     cx, ax
        shl     cx, 2
        add     si, cx
        add     si, PGM_FX_REVERBS
        mov     word ptr [bp-12h], si
        mov     word ptr [bp-10h], dx
        mov     al, byte ptr [G_COPY_DST_PGM]
        cbw
        mov     bx, ax
        shl     bx, 2
        mov     ax, word ptr [bx+PGM_TABLE]
        mov     dx, word ptr [bx+PGM_TABLE+2]
        mov     cl, byte ptr [G_COPY_DST_NOTE]
        sub     ch, ch
        imul    bx, cx, 48h
        mov     si, ax
        add     ax, bx
        add     ax, PGM_FX_SECTIONS
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     ax, cx
        add     cx, cx
        add     cx, ax
        shl     cx, 2
        add     si, cx
        add     si, PGM_FX_REVERBS
        mov     word ptr [bp-4], si
        mov     word ptr [bp-2], dx
        mov     al, byte ptr [G_COPY_SRC_PGM]
        cmp     byte ptr [G_COPY_DST_PGM], al
        jne     br_05603
        mov     al, byte ptr [G_COPY_DST_NOTE]
        cmp     byte ptr [G_COPY_SRC_NOTE], al
        jne     br_05603
        jmp     br_05687

br_05603:
        cmp     byte ptr [G_COPY_SRC_NOTE], 2
        jae     br_05638
        cmp     byte ptr [G_COPY_DST_NOTE], 2
        jae     br_05638
        les     bx, [bp-8]
        mov     al, byte ptr es:[bx+47h]
        mov     byte ptr [bp-9], al
        mov     ax, word ptr [bp-0eh]
        mov     dx, word ptr [bp-0ch]
        push    ds
        mov     di, bx
        mov     si, ax
        mov     ds, dx
        mov     cx, 24h
        rep movsw
        pop     ds
        mov     bx, word ptr [bp-8]
        mov     al, byte ptr [bp-9]
        mov     byte ptr es:[bx+47h], al
br_05638:
        les     bx, [bp-4]
        mov     al, byte ptr es:[bx+0ah]
        mov     byte ptr [bp-5], al
        mov     al, byte ptr es:[bx+0bh]
        mov     byte ptr [bp-6], al
        mov     ax, word ptr [bp-12h]
        mov     dx, word ptr [bp-10h]
        push    ds
        mov     di, bx
        mov     si, ax
        mov     ds, dx
        mov     cx, 6
        rep movsw
        pop     ds
        cmp     byte ptr [G_COPY_SRC_NOTE], 2
        jae     br_0567B
        cmp     byte ptr [G_COPY_DST_NOTE], 2
        jb      br_0567B
        mov     bx, word ptr [bp-4]
        mov     al, byte ptr [bp-5]
        mov     byte ptr es:[bx+0ah], al
        mov     al, byte ptr [bp-6]
        mov     byte ptr es:[bx+0bh], al

br_0567B:
        push    0fh
        nop
        push    cs
        call    pending_ops_set
        nop
        push    cs
        call    copy_fx_close

br_05687:
        pop     ds
        pop     si
        pop     di
        leave
        retf

copy_fx_close:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_04206
        pop     ds
        retf
        db      00h

copy_fx_paint:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_COPY_FX_SETTINGS
        callf   TEXT1_SEG:disp_list_run
        mov     al, byte ptr [G_COPY_SRC_PGM]
        cbw
        push    ax
        push    55h
        push    0bh
        nop
        push    cs
        call    sequence_get_info
        push    55h
        push    14h
        mov     bl, byte ptr [G_COPY_SRC_NOTE]
        sub     bh, bh
        shl     bx, 2
        push    word ptr [bx+FX_TYPE_LABELS+2]
        push    word ptr [bx+FX_TYPE_LABELS]
        nop
        push    cs
        call    cmd_dispatch_1E
        mov     al, byte ptr [G_COPY_DST_PGM]
        cbw
        push    ax
        push    55h
        push    20h
        nop
        push    cs
        call    sequence_get_info
        push    55h
        push    29h
        mov     bl, byte ptr [G_COPY_DST_NOTE]
        sub     bh, bh
        shl     bx, 2
        push    word ptr [bx+FX_TYPE_LABELS+2]
        push    word ptr [bx+FX_TYPE_LABELS]
        nop
        push    cs
        call    cmd_dispatch_1E
        nop
        push    cs
        call    field_redraw
        pop     ds
        retf

far_05700:
        push    0
        push    0
        push    0
        callf   TEXT1_SEG:int38_wrapper_2
        retf

; ? INT 38h with AX=1, BX=argument, CX=9Eh.
int38_call_9e:
        push    bp
        mov     bp, sp
        push    1
        push    word ptr [bp+6]
        push    9eh
        callf   TEXT1_SEG:int38_wrapper_2
        leave
        retf    2
int38_call_02:
        push    bp
        mov     bp, sp
        push    1
        push    word ptr [bp+6]
        push    2
        callf   TEXT1_SEG:int38_wrapper_2
        leave
        retf    2
        db      00h
int38_call_pair:
        push    bp
        mov     bp, sp
        push    2
        push    word ptr [bp+6]
        push    word ptr [bp+8]
        callf   TEXT1_SEG:int38_wrapper_2
        leave
        retf    4

; ? INT 38h with AX=1, BX=argument, CX=2.

; ? INT 38h with AX=2, BX and CX from the two arguments.
; isr_dma_audio @0x10f08 is code
L_05748:
        pusha
        push    ds
        push    es
        mov     bp, sp
        push    ds
        mov     ax, DATA_SEG
        mov     ds, ax
        cld
        nop
        push    cs
        call    L_05844
        mov     sp, bp
        pop     es
        pop     ds
        popa
        iret
        db      00h

L_05760:
        push    di
        xor     ax, ax
        mov     cx, 19h
        mov     di, B_9D5A
        push    ds
        pop     es
        rep stosw
        if      FW_VERSION = 172
        stosb
        endif
        mov     cx, 38h
        mov     di, SND_CURRENT
        rep stosw
        nop
        push    cs
        call    smem_io_helper
        mov     byte ptr [PAD_INPUT_MODE], 2
        nop
        push    cs
        call    L_05844
        pop     di
        retf
        if      FW_VERSION = 172
        db      00h

        endif
smem_io_helper:
        enter   4, 0
        push    si
        nop
        push    cs
        call    far_05700
        mov     word ptr [bp-2], ax
        mov     word ptr [PGM_TABLE], 0
        mov     word ptr [PGM_TABLE+2], ax
        mov     si, PGM_TABLE
        mov     word ptr [bp-4], 17h

loop_057A6:
        les     bx, [si]
        mov     ax, word ptr es:[bx]
        add     word ptr [bp-2], ax
        mov     ax, word ptr [bp-2]
        mov     word ptr [si+4], 0
        mov     word ptr [si+6], ax
        add     si, 4
        dec     word ptr [bp-4]
        jne     loop_057A6
        pop     si
        leave
        retf

cmd_exec_1E_ext:
        push    bp
        mov     bp, sp
        mov     cx, word ptr [bp+6]
        cmp     cx, -0dh
        jge     br_057D2
        mov     cx, 0fff3h

br_057D2:
        cmp     cx, 2
        jle     br_057DA
        mov     cx, 2

br_057DA:
        mov     ax, cx
        mov     byte ptr [P_9D89], cl
        add     ax, 0dh
        nop
        push    cs
        call    dma_01600
        leave
        retf    2

cmd_dispatch_handler_3:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     al, byte ptr [P_9D89]
        cbw
        add     ax, 0dh
        or      ax, ax
        jg      br_05812
        mov     di, word ptr [bp+8]
        mov     si, word ptr [bp+6]
        push    di
        lea     ax, [si+1]
        push    ax
        push    ds
        push    P_4CF9
        nop
        push    cs
        call    cmd_caller_setup
        jmp     L_05830

br_05812:
        mov     di, word ptr [bp+8]
        mov     si, word ptr [bp+6]
        push    di
        push    si
        mov     al, byte ptr [P_9D89]
        cbw
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        add     ax, ax
        cwd
        push    dx
        push    ax
        push    2
        nop
        push    cs
        call    draw_signed_value

L_05830:
        lea     ax, [di+12h]
        push    ax

L_05834:
        push    si
        push    ds
        push    STR_DB_2
        nop
        push    cs
        call    cmd_dispatch_1E
        pop     si
        pop     di
        leave
        retf    4

L_05844:
        push    di

tgt_05845:
        push    si
        push    ds
        push    P_9DA0
        nop
        push    cs
        call    far_memop_str_1
        mov     di, P_8F78
        mov     si, P_1D76
        mov     ax, ds
        mov     es, ax
        mov     cx, 20h
        rep movsw
        mov     byte ptr [MIDI_VOLUME_VAL], 7fh
        mov     word ptr [SAMPLE_TIME], 0ah
        mov     byte ptr [SAMPLE_THRESHOLD], 0ech
        mov     byte ptr [SAMPLE_PREREC], 0ah
        xor     al, al
        mov     byte ptr [B_9D77], al
        mov     byte ptr [SAMPLE_INPUT], al
        mov     byte ptr [G_REC_MODE], al
        mov     byte ptr [PLAY_X_MODE], al
        mov     byte ptr [ZONE_EDIT_ACTION], al
        mov     byte ptr [TRIM_LEN_FIX], al
        mov     byte ptr [LOOP_LEN_FIX], al
        mov     byte ptr [ZONE_LEN_FIX], al
        mov     byte ptr [SND_EDIT_VIEW], al
        mov     al, 1
        mov     byte ptr [SAMPLE_MONITOR], al
        mov     byte ptr [MIDI_VOLUME_RX], al
        mov     byte ptr [PGM_CHANGE_RX], al
        mov     byte ptr [MIDI_LOCAL_MODE], al
        push    0
        nop
        push    cs
        call    cmd_exec_1E_ext
        pop     si
        pop     di
        retf
program_select:
        enter   4, 0
        push    si
        cmp     byte ptr [P_1DBF], 0
        jne     br_0592A
        mov     byte ptr [P_1DBF], 1
        mov     si, word ptr [bp+6]
        mov     bx, si
        shl     bx, 2
        les     bx, [bx+PGM_TABLE]
        cmp     word ptr es:[bx], 2
        jbe     br_0591A
        mov     ax, si
        mov     byte ptr [PGM_SLOT], al
        mov     word ptr [PGM_CURRENT], bx
        mov     word ptr [PGM_CURRENT+2], es
        cmp     byte ptr [B_9D77], 0
        je      br_058E6
        mov     ax, P_8F78
        mov     dx, ds
        jmp     br_058F0

br_058E6:
        mov     ax, word ptr [PGM_CURRENT]
        mov     dx, word ptr [PGM_CURRENT+2]
        add     ax, PGM_PADMAP

br_058F0:
        mov     word ptr [PTR_TRACK_DATA], ax
        mov     word ptr [PTR_TRACK_DATA+2], dx
        push    dx
        push    ax
        nop
        push    cs
        call    seq_select_setup_1
        push    word ptr [PGM_CURRENT+2]
        push    word ptr [PGM_CURRENT]
        nop
        push    cs
        call    seq_select_setup_2
        nop
        push    cs
        call    cmd_far_stub2
        push    0fh
        nop
        push    cs
        call    pending_ops_set
        jmp     br_05925
        db      90h

br_0591A:
        mov     word ptr [G_ERRNO], ERR_INTERNAL
        nop
        push    cs
        call    err_msg_report

br_05925:
        mov     byte ptr [P_1DBF], 0

br_0592A:
        pop     si
        leave
        retf    2
        db      00h
program_select_wrapper:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+6]
        push    si
        nop
        push    cs
        call    int38_call_9e
        cmp     ax, 0ffffh
        jne     tgt_0594A
        xor     ax, ax
        pop     si
        leave
        retf    2
        db      90h
tgt_0594A:
        nop
        push    cs
        call    smem_io_helper
        push    si
        nop
        push    cs
        call    far_memop_handler_1
        mov     ax, 1
        pop     si
        leave
        retf    2
        db      00h
smem_dma_init:
        push    bp
        mov     bp, sp
        push    word ptr [bp+6]
        nop
        push    cs
        call    int38_call_02
        nop
        push    cs
        call    smem_io_helper
        leave
        retf    2

X_05972:
        push    si
        xor     si, si
loop_05975:
        push    si
        nop
        push    cs
        call    smem_dma_init
        inc     si
        cmp     si, 18h
        jl      loop_05975
        push    0
        nop
        push    cs
        call    program_select_wrapper
        push    0
        nop
        push    cs
        call    program_select
        pop     si
        retf
        db      00h
smem_access_handler_2:
        enter   2, 0
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    int38_call_pair
        mov     word ptr [bp-2], ax
        nop
        push    cs
        call    smem_io_helper
        cmp     word ptr [bp-2], -1
        je      br_059B6
        mov     ax, 1
        leave
        retf    4

br_059B6:
        xor     ax, ax
        leave
        retf    4

far_059BC:
        push    si
        xor     cx, cx
        mov     bx, PGM_TABLE

loop_059C2:
        les     si, [bx]
        cmp     word ptr es:[si], 2
        jbe     br_059D6
        add     bx, 4
        inc     cx
        cmp     cx, 18h
        jl      loop_059C2
        jmp     br_059DA
        db      90h

br_059D6:
        mov     ax, cx
        pop     si
        retf

br_059DA:
        mov     ax, 0ffffh
        pop     si
        retf
        db      00h

_memcpy_2:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     si, STR_NEW_PROGRAM_NAME
        les     di, [bp+8]
        mov     cx, 8
        rep movsw
        movsb
        mov     ax, word ptr [bp+6]
        inc     ax
        mov     cx, 0ah
        mov     bx, ax
        cwd
        idiv    cx
        mov     si, word ptr [bp+8]
        add     al, 30h
        mov     byte ptr es:[si+0ch], al
        mov     ax, bx
        cwd
        idiv    cx
        add     dl, 30h
        mov     byte ptr es:[si+0dh], dl
        mov     ax, si
        mov     dx, es
        pop     si
        pop     di
        leave
        retf    6
far_memop_handler_1:
        enter   6, 0
        push    di
        push    si
        mov     bx, word ptr [bp+6]
        shl     bx, 2
        mov     ax, word ptr [bx+PGM_TABLE]
        mov     dx, word ptr [bx+PGM_TABLE+2]
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-4], dx
        add     ax, 2
        push    dx
        push    ax
        push    word ptr [bp+6]
        nop
        push    cs
        call    _memcpy_2
        les     bx, [bp-6]
        mov     byte ptr es:[bx+PGM_HDR_NOTE], 0
        mov     byte ptr es:[bx+PGM_HDR_14], 88h
        mov     byte ptr es:[bx+PGM_HDR_15], 78h
        mov     byte ptr es:[bx+PGM_HDR_16], 0ch
        mov     byte ptr es:[bx+PGM_HDR_17], 2dh
        mov     byte ptr es:[bx+PGM_HDR_18], 0
        mov     byte ptr es:[bx+PGM_HDR_19], 14h
        mov     byte ptr es:[bx+PGM_HDR_1A], 0ceh
        mov     byte ptr es:[bx+PGM_HDR_1B], 32h
        mov     al, byte ptr [bp+6]
        mov     byte ptr es:[bx+PGM_MIDI_PGM], al
        mov     byte ptr es:[bx+PGM_HDR_1D], 23h
        lea     di, [bx+PGM_PADMAP]
        mov     si, P_8F78
        mov     cx, 20h
        rep movsw
        mov     ax, word ptr [bp-6]
        mov     dx, word ptr [bp-4]
        add     ax, PGM_PADS
        push    dx
        push    ax
        nop
        push    cs
        call    _memset_2
        mov     byte ptr [bp-1], 1
        mov     es, word ptr [bp-4]
loop_05AA2:
        mov     al, byte ptr [bp-1]
        cbw
        imul    si, ax, PGM_PAD_STRIDE
        mov     bx, word ptr [bp-6]
        push    ds
        lea     di, [bx+si+PGM_PADS]
        lea     si, [bx+PGM_PADS]
        push    es
        pop     ds
        mov     cx, 0eh
        rep movsw
        movsb
        pop     ds
        inc     byte ptr [bp-1]
        cmp     byte ptr [bp-1], 40h
        jl      loop_05AA2
        mov     si, word ptr [bp-6]
        lea     ax, [si+PGM_MIX]
        push    es
        push    ax
        nop
        push    cs
        call    far_memop_str_1
        mov     ax, si
        mov     dx, word ptr [bp-4]
        add     ax, PGM_FX_SECTIONS
        push    dx
        push    ax
        nop
        push    cs
        call    _memcpy_3
        mov     ax, si
        mov     dx, word ptr [bp-4]
        add     ax, PGM_FX_REVERBS
        push    dx
        push    ax
        nop
        push    cs
        call    far_memop_str_2
        pop     si
        pop     di
        leave
        retf    2
        db      00h
_memset_2:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     si, word ptr [bp+6]
        xor     ax, ax
        mov     dx, word ptr [bp+8]
        mov     cx, 0eh
        mov     di, si
        mov     es, dx
        rep stosw
        stosb
        mov     byte ptr es:[si+5], al
        mov     byte ptr es:[si+6], 2ch
        mov     byte ptr es:[si+8], 58h
        mov     al, 64h
        mov     byte ptr es:[si+12h], al
        mov     byte ptr es:[si+17h], al
        xor     al, al
        mov     byte ptr es:[si+0ah], al
        mov     byte ptr es:[si+11h], al
        mov     byte ptr es:[si+1bh], al
        pop     si
        pop     di
        leave
        retf    4
        db      00h
far_memop_str_1:
        enter   6, 0
        push    di
        push    si
        mov     word ptr [bp-6], 40h

loop_05B47:
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     word ptr [bp+6], 6
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     si, P_1DB6
        les     di, [bp-4]
        movsw
        movsw
        movsw
        dec     word ptr [bp-6]
        jne     loop_05B47
        pop     si
        pop     di
        leave
        retf    4
        db      00h
_memcpy_3:
        enter   4, 0
        push    di
        push    si
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     word ptr [bp+6], 48h
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
; ?
        mov     si, FXS_DEFAULT
        les     di, [bp-4]
        mov     cx, 24h
        rep movsw
        mov     si, FXS_DEFAULT
        les     di, [bp+6]
        mov     cx, 24h
        rep movsw
        pop     si
        pop     di
        leave
        retf    4
FAR_MEMOP_STR_LEN               equ FXR_DEFAULT
        include "../../../common/far_memop_str.inc"
        retf    4

; ? misnomer: range-checks a note (23h-62h) then linear-searches a table.
timer_io_setup:
        push    bp
        mov     bp, sp
        push    si
        mov     cx, word ptr [bp+6]
        mov     ax, cx
        sub     ax, 23h
        cmp     ax, 3fh
        ja      br_05C30
        xor     si, si
loop_05C13:
        les     bx, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+si]
        cbw
        cmp     ax, cx
        je      br_05C28
        inc     si
        cmp     si, 40h
        jl      loop_05C13
        jmp     br_05C30
        db      90h
br_05C28:
        mov     ax, si
        pop     si
        leave
        retf    2
        db      90h

br_05C30:
        mov     ax, 0ffffh
        pop     si
        leave
        retf    2

rep_memcpy_handler:
        enter   0eh, 0
        push    di
        push    si
        mov     di, PGM_TABLE
        mov     word ptr [bp-8], 18h
loop_05C46:
        les     bx, [di]
        cmp     word ptr es:[bx], 2
        jbe     br_05C96
        xor     bx, bx
        mov     word ptr [bp-4], 40h
        mov     cx, word ptr [bp-4]
        mov     word ptr [bp-6], di
loop_05C5B:
        les     si, [di]
        add     si, bx
        add     si, 1eh
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        cmp     word ptr es:[si], ax
        jne     br_05C80
        cmp     word ptr es:[si+2], dx
        jne     br_05C80
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr es:[si], ax
        mov     word ptr es:[si+2], dx

br_05C80:
        add     bx, 1dh
        dec     cx
        jne     loop_05C5B

loop_05C86:
        add     word ptr [bp-6], 4
        dec     word ptr [bp-8]
        jne     br_05C9C
        pop     si
        pop     di
        leave
        retf    8
        db      90h

br_05C96:
        mov     word ptr [bp-6], di
        jmp     loop_05C86
        db      90h

br_05C9C:
        mov     di, word ptr [bp-6]
        jmp     loop_05C46
        db      00h

smem_proc_wrapper:
        push    bp
        mov     bp, sp
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    0
        push    0
        nop
        push    cs
        call    rep_memcpy_handler
        leave
        retf    4

; ? misnomer: the sample_gc walk over 24 PROGRAM slots.
smem_transfer_io:
        enter   8, 0
        push    di
        push    si
        mov     di, PGM_TABLE
        mov     word ptr [bp-6], 18h

loop_05CC6:
        les     bx, [di]
        cmp     word ptr es:[bx], 2
        jbe     br_05CEA
        xor     bx, bx
        mov     word ptr [bp-2], 40h
        mov     cx, word ptr [bp-2]

loop_05CD8:
        les     si, [di]
        sub     ax, ax
        mov     word ptr es:[bx+si+20h], ax
        mov     word ptr es:[bx+si+1eh], ax
        add     bx, 1dh
        dec     cx
        jne     loop_05CD8
br_05CEA:
        add     di, 4
        dec     word ptr [bp-6]
        jne     loop_05CC6
        pop     si
        pop     di
        leave
        retf
seq_select_setup_1:
        push    bp
        mov     bp, sp
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    3ch
        callf   TEXT1_SEG:ivt_set_vector
        leave
        retf    4
seq_select_setup_2:
        push    bp
        mov     bp, sp
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    3dh
        callf   TEXT1_SEG:ivt_set_vector
        leave
        retf    4



L_05D1E:
        mov     al, byte ptr [PGM_SLOT]
        cbw
        push    ax
        nop
        push    cs
        call    program_select
        retf
        db      00h

loop_seq_handler:
        enter   2, 0
        push    si
        mov     bl, byte ptr [G_PAD_INDEX]
        sub     bh, bh
        les     si, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+si]
        mov     byte ptr [bp-1], al
        cbw
        sub     ax, 23h
        cmp     ax, 3fh
        ja      br_05D4E
        mov     al, byte ptr [bp-1]
        mov     byte ptr [G_PAD_NOTE_BASE], al

br_05D4E:
        pop     si
        leave
        retf
        db      00h

smem_loop_proc:
        enter   2, 0
        push    si
        mov     bl, byte ptr [G_PAD_INDEX]
        sub     bh, bh
        les     si, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+si]
        mov     byte ptr [bp-1], al
        cbw
        sub     ax, 23h
        cmp     ax, 3fh
        ja      L_05D76
        mov     al, byte ptr [bp-1]
        mov     byte ptr [G_PAD_NOTE_BASE], al

L_05D76:
        pop     si
        leave
        retf
        db      00h

L_05C0E:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    note_release_latched
        nop
        push    cs
        call    voice_release_all
        mov     byte ptr [PAD_INPUT_MODE], 2
        and     byte ptr [B_9D1C], 0feh
        pop     ds
        retf

smem_rep_str:
        enter   4, 0
        push    di

L_05D9B:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [P_1DD3], 0
        je      br_05DB0
        mov     ax, P_8F78
        mov     dx, cx
        jmp     L_05DBA

br_05DB0:
        mov     ax, word ptr [PGM_CURRENT]
        mov     dx, word ptr [PGM_CURRENT+2]
        add     ax, PGM_PADMAP

L_05DBA:
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     si, P_1D76
        les     di, [bp-4]
        mov     cx, 20h
        rep movsw
        callf   TEXT1_SEG:pgm_assign_enter
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h

L_05DD6:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_INIT_PAD_ASSIGN
        callf   TEXT1_SEG:disp_list_run
        push    0a9h
        push    17h
        mov     al, byte ptr [P_1DD3]
        cbw
        shl     ax, 3
        add     ax, TBL_PGM_MASTER_LABELS
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        nop
        push    cs
        call    field_redraw
        pop     ds
        retf

L_05E02:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    note_release_latched
        push    ds
        push    TBL_WINKEYS_INIT_PAD_ASSIGN
        callf   TEXT1_SEG:win_keys_merge
        mov     al, byte ptr [B_9D77]
        mov     byte ptr [P_1DD3], al
        push    ds
        push    P_1DD3
        push    1
        push    0a9h
        push    17h
        push    8
        push    0
        push    0
        nop
        push    cs
        call    voice_trigger_full
        pop     ds
        retf

L_05E34:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        pop     ds
        retf
; divides two params by 5, writes the results into a fixed table.
seq_transfer_io:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     di, word ptr [bp+0eh]
        mov     si, word ptr [bp+8]
        mov     cx, 5
        mov     ax, si
        cwd
        idiv    cx
        mov     si, ax
        mov     ax, di
        mov     byte ptr [B_2111], al
        mov     dl, byte ptr [bp+0ch]
        mov     byte ptr [B_2112], dl
        mov     byte ptr [B_2116], al
        add     dl, 1ch
        mov     byte ptr [B_2117], dl
        mov     ax, word ptr [bp+0ah]
        cwd
        idiv    cx
        mov     word ptr [bp+0ah], ax
        add     al, byte ptr [B_2111]
        mov     byte ptr [B_2118], al
        mov     al, byte ptr [B_2112]
        add     al, 9
        mov     byte ptr [B_2119], al
        cmp     word ptr [bp+6], 0
        jne     br_05EBE
        mov     bx, di
        lea     ax, [bx+32h]
        mov     byte ptr [B_211D], al
        mov     cl, byte ptr [B_2117]
        mov     byte ptr [B_211E], cl
        mov     cx, si
        sub     al, cl
        mov     byte ptr [B_211B], al
        mov     al, byte ptr [B_2119]
        mov     byte ptr [B_211C], al
        mov     byte ptr [B_211F], 0bh
        mov     dl, byte ptr [B_2118]
        mov     byte ptr [B_2120], dl
        mov     byte ptr [B_2121], al
        mov     al, 32h
        sub     al, byte ptr [bp+0ah]
        sub     al, cl
        mov     byte ptr [B_2122], al
        jmp     X_05EDE
br_05EBE:
        mov     al, byte ptr [B_2118]
        mov     byte ptr [B_211B], al
        mov     cl, byte ptr [B_2119]
        mov     byte ptr [B_211C], cl
        mov     cx, si
        add     al, cl
        mov     byte ptr [B_211D], al
        mov     al, byte ptr [B_2117]
        mov     byte ptr [B_211E], al
        mov     byte ptr [B_211F], 0
X_05EDE:
        push    ds
        push    P_2110
        callf   TEXT1_SEG:disp_list_run
        pop     si
        pop     di
        leave
        retf    0ah
        db      00h
L_05EEE:
        mov     al, byte ptr [PGM_SLOT]
        cbw
        push    ax
        nop
        push    cs
        call    program_select
        retf
        db      00h

L_05D8E:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    note_release_latched
        nop
        push    cs
        call    voice_release_all
        mov     byte ptr [PAD_INPUT_MODE], 2
        and     byte ptr [B_9D1C], 0feh
        pop     ds
        retf

pgm_midi_key_33:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [MIDI_VOLUME_VAL]
        cmp     byte ptr [B_4FE4], al
        je      L_05F2D
        mov     byte ptr [B_4FE4], al
        nop
        push    cs
        call    cmd_far_stub2

L_05F2D:
        pop     ds
        retf
        db      00h

pgm_midi_refresh:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    voice_release_all
        mov     byte ptr [PAD_INPUT_MODE], 2
        and     byte ptr [B_9D1C], 0feh
        pop     ds
        retf
        db      00h
pgm_midi_paint:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_2534
        callf   TEXT1_SEG:disp_list_run
        push    62h
        push    0fh
        mov     al, byte ptr [MIDI_VOLUME_RX]
        cbw
        shl     ax, 3
        add     ax, TBL_IGNORE_RECEIVE_LABELS
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        push    62h
        push    19h
        mov     al, byte ptr [PGM_CHANGE_RX]
        cbw
        shl     ax, 3
        add     ax, TBL_IGNORE_RECEIVE_LABELS
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        push    62h
        push    23h
        mov     al, byte ptr [MIDI_LOCAL_MODE]
        cbw
        shl     ax, 2
        add     ax, TBL_OFF_ON_LABELS
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        push    0e0h
        push    0fh
        mov     al, byte ptr [MIDI_VOLUME_VAL]
        cbw
        cwd
        push    dx
        push    ax
        push    3
        nop
        push    cs
        call    draw_unsigned_value
        nop
        push    cs
        call    field_redraw
        pop     ds
        retf
        if      FW_VERSION = 172


smem_addr_dma_read:
        push    bp
        mov     bp, sp
        push    si
        mov     bx, word ptr [bp+6]
        les     si, [PTR_SAMPLE_DATA]
        mov     ax, word ptr es:[si+SND_NEXT]
        mov     dx, word ptr es:[si+SND_NEXT_SEG]
        mov     word ptr [FP_2602], ax
        mov     word ptr [FP_2602_SEG], dx
        mov     es, word ptr [bp+8]
        mov     word ptr es:[bx], ax
        mov     word ptr es:[bx+2], dx
        mov     ax, word ptr [PTR_DMA_STATE]
        mov     dx, word ptr [PTR_DMA_STATE+2]
        cmp     word ptr es:[bx], ax
        jne     L_05FEE
        cmp     word ptr es:[bx+2], dx
        jne     L_05FEE
        xor     ax, ax
        pop     si
        leave
        retf    4
        db      90h

L_05FEE:
        mov     ax, 1
        pop     si
        leave
        retf    4

smem_addr_dma_read2:
        push    bp
        mov     bp, sp
        les     bx, [FP_2602]
        mov     ax, word ptr es:[bx+SND_NEXT]
        mov     dx, word ptr es:[bx+SND_NEXT_SEG]
        les     bx, [bp+6]
        mov     word ptr es:[bx], ax
        mov     word ptr es:[bx+2], dx
        mov     word ptr [FP_2602], ax
        mov     word ptr [FP_2602_SEG], dx
        mov     ax, word ptr [PTR_DMA_STATE]
        mov     dx, word ptr [PTR_DMA_STATE+2]
        cmp     word ptr [FP_2602], ax
        jne     L_06030
        cmp     word ptr [FP_2602_SEG], dx
        jne     L_06030
        xor     ax, ax
        leave
        retf    4
        db      90h

L_06030:
        mov     ax, 1
        leave
        retf    4
        db      00h

smem_addr_dma_read3:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+6]
        mov     ax, word ptr [bp+8]
        cmp     si, word ptr [FP_2602]
        jne     L_0605F
        cmp     ax, word ptr [FP_2602_SEG]
        jne     L_0605F
        mov     es, ax
        mov     ax, word ptr es:[si+2ch]
        mov     dx, word ptr es:[si+2eh]
        mov     word ptr [FP_2602], ax
        mov     word ptr [FP_2602_SEG], dx

L_0605F:
        push    word ptr [bp+8]
        push    si
        nop
        push    cs
        call    sample_validate_ptr
        mov     ax, 1
        pop     si
        leave
        retf    4
; marks every 1Dh-stride slot of the 18h tables under 9CB2h, then frees every
; pool entry no slot referenced.

sample_gc:
        enter   1ah, 0
        push    di
        push    si
        mov     bx, PGM_TABLE
        mov     word ptr [bp-0ch], 18h

T2_L_0607E:
        les     si, [bx]
        mov     di, si
        mov     word ptr [bp-0eh], es
        cmp     word ptr es:[si], 2
        jbe     L_060C8
        mov     word ptr [bp-0ah], bx
        lea     ax, [di+1eh]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], es
        mov     word ptr [bp-8], 40h
        mov     word ptr [bp-10h], si
        mov     bx, ax
        mov     cx, word ptr [bp-8]

L_060A4:
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        mov     word ptr [bp-1ah], ax
        mov     word ptr [bp-18h], dx
        or      dx, ax
        je      L_060BF
        les     si, [bp-1ah]
        or      byte ptr es:[si], 80h

L_060BF:
        add     bx, 1dh
        dec     cx
        jne     L_060A4
        mov     bx, word ptr [bp-0ah]

L_060C8:
        add     bx, 4
        dec     word ptr [bp-0ch]
        jne     T2_L_0607E
        lea     ax, [bp-16h]
        push    ss
        push    ax
        nop
        push    cs
        call    smem_addr_dma_read
        or      ax, ax
        je      L_06103

L_060DE:
        les     bx, [bp-16h]
        test    byte ptr es:[bx], 80h
        je      L_060EE
        and     byte ptr es:[bx], 7fh
        jmp     L_060F5
        db      90h

L_060EE:
        push    es
        push    bx
        nop
        push    cs
        call    smem_addr_dma_read3

L_060F5:
        lea     ax, [bp-16h]
        push    ss
        push    ax
        nop
        push    cs
        call    smem_addr_dma_read2
        or      ax, ax
        jne     L_060DE

L_06103:
        pop     si
        pop     di
        leave
        retf
        db      00h
; the sample_gc walk, counting the unreferenced pool entries instead of
; freeing them.

sample_unused_count:
        enter   1ch, 0
        push    si
        mov     word ptr [bp-0eh], 0
        mov     bx, PGM_TABLE
        mov     word ptr [bp-0ch], 18h

L_0611A:
        les     si, [bx]
        mov     word ptr [bp-10h], es
        cmp     word ptr es:[si], 2
        jbe     L_06162
        mov     word ptr [bp-0ah], bx
        lea     ax, [si+1eh]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], es
        mov     word ptr [bp-8], 40h
        mov     word ptr [bp-12h], si
        mov     bx, ax
        mov     cx, word ptr [bp-8]

L_0613E:
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        mov     word ptr [bp-1ch], ax
        mov     word ptr [bp-1ah], dx
        or      dx, ax
        je      L_06159
        les     si, [bp-1ch]
        or      byte ptr es:[si], 80h

L_06159:
        add     bx, 1dh
        dec     cx
        jne     L_0613E
        mov     bx, word ptr [bp-0ah]

L_06162:
        add     bx, 4
        dec     word ptr [bp-0ch]
        jne     L_0611A
        mov     si, word ptr [bp-0eh]
        lea     ax, [bp-18h]
        push    ss
        push    ax
        nop
        push    cs
        call    smem_addr_dma_read
        or      ax, ax
        je      L_06199

L_0617B:
        les     bx, [bp-18h]
        test    byte ptr es:[bx], 80h
        je      L_0618A
        and     byte ptr es:[bx], 7fh
        jmp     L_0618B

L_0618A:
        inc     si

L_0618B:
        lea     ax, [bp-18h]
        push    ss
        push    ax
        nop
        push    cs
        call    smem_addr_dma_read2
        or      ax, ax
        jne     L_0617B

L_06199:
        mov     ax, si
        pop     si
        leave
        retf

        endif
L_0619E:
        if      FW_VERSION = 172
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    voice_release_all
        mov     byte ptr [PAD_INPUT_MODE], 2
        and     byte ptr [B_9D1C], 0feh
        pop     ds
        retf
        db      00h

purge_do_it:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    word ptr [PTR_DL_PROCESSING_SEG]
        push    word ptr [PTR_DL_PROCESSING]
        callf   TEXT1_SEG:disp_list_run
        nop
        push    cs
        call    sample_gc
        mov     ax, 64h
        nop
        push    cs
        call    delay_ticks
        push    ds
        push    P_2606
        callf   TEXT1_SEG:disp_list_run
        pop     ds
        retf
        db      00h

purge_paint:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_2608
        callf   TEXT1_SEG:disp_list_run
        push    19h
        push    25h
        nop
        push    cs
        call    sample_unused_count
        cwd
        push    dx
        push    ax
        push    3
        nop
        push    cs
        call    draw_unsigned_value
        pop     ds
        retf

L_06206:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    note_release_latched
        mov     byte ptr [PAD_INPUT_MODE], 2
        push    ds
        push    TBL_WINKEYS_PURGE
        callf   TEXT1_SEG:win_keys_merge
        pop     ds
        retf
        db      90h

        endif
pgm_assign_key:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     ax, word ptr [PGM_CURRENT+2]
        or      ax, word ptr [PGM_CURRENT]
        je      X_0624C
        mov     al, byte ptr [PGM_SLOT]
        cbw
        mov     bx, ax
        shl     bx, 2
        les     bx, [bx+PGM_TABLE]
        cmp     word ptr es:[bx], 2
        jbe     X_0624C
        callf   TEXT1_SEG:pgm_assign_enter
        pop     ds
        retf
        db      90h

X_0624C:
        mov     word ptr [G_ERRNO], ERR_INTERNAL
        nop
        push    cs
        call    err_msg_report
        pop     ds
        retf
        db      00h

; builds a 6-byte record: 90h (MIDI Note On) then velocity.
seq_port_io:
        enter   6, 0
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     byte ptr [bp-6], 90h
        if      FW_VERSION = 172
        mov     al, byte ptr [G_VELOCITY_MAX]
        else
        mov     al, byte ptr [G_VELOCITY_IN]
        endif
        mov     byte ptr [bp-4], al
        mov     byte ptr [bp-3], 1
        mov     byte ptr [bp-2], 0
        mov     byte ptr [bp-1], 40h
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        mov     byte ptr [bp-5], al
        mov     byte ptr [G_LATCHED_PLAY_NOTE], al
        lea     ax, [bp-6]
        push    ss
        push    ax
        callf   TEXT1_SEG:pad_note_trigger
        pop     ds
        leave
        retf
seq_port_io2:
        enter   6, 0
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     byte ptr [bp-6], 90h
        mov     byte ptr [bp-4], 7fh
        mov     byte ptr [bp-3], 1
        mov     byte ptr [bp-2], 0
        mov     byte ptr [bp-1], 40h
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        mov     byte ptr [bp-5], al
        mov     byte ptr [G_LATCHED_PLAY_NOTE], al
        lea     ax, [bp-6]
        push    ss
        push    ax
        callf   TEXT1_SEG:pad_note_trigger
        pop     ds
        leave
        retf
note_release_latched:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_LATCHED_PLAY_NOTE]
        cbw
        sub     ax, 23h
        cmp     ax, 3fh
        ja      br_062E5
        mov     al, byte ptr [G_LATCHED_PLAY_NOTE]
        cbw
        push    ax
        nop
        push    cs
        call    pad_note_release
        mov     byte ptr [G_LATCHED_PLAY_NOTE], 0
br_062E5:
        pop     ds
        retf
        db      00h

; as seq_port_io, but a fixed velocity of 7Fh instead of G_VELOCITY_MAX.
sequence_get_info:
        enter   8, 0
        push    si
        mov     bx, word ptr [bp+0ah]
        shl     bx, 2
        mov     si, word ptr [bx+PGM_TABLE]
        mov     dx, word ptr [bx+PGM_TABLE+2]
        mov     word ptr [bp-6], dx
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        mov     ax, word ptr [bp+0ah]
        inc     ax
        cwd
        push    dx
        push    ax
        push    2
        nop
        push    cs
        call    draw_unsigned_value
        mov     ax, word ptr [bp+8]
        add     ax, 0ch
        push    ax
        push    word ptr [bp+6]
        push    2dh
        nop
        push    cs
        call    cmd_ratio_setup
        mov     es, word ptr [bp-6]
        cmp     word ptr es:[si], 2
        je      br_06336
        lea     ax, [si+PGM_NAME]
        mov     cx, ax
        mov     word ptr [bp-2], es
        jmp     L_0633C

br_06336:
        mov     cx, STR_NO_PROGRAM
        mov     word ptr [bp-2], ds

L_0633C:
        mov     ax, word ptr [bp+8]
        add     ax, 12h
        push    ax
        push    word ptr [bp+6]
        push    word ptr [bp-2]
        push    cx
        nop
        push    cs
        call    cmd_dispatch_1E
        pop     si
        leave
        retf    6

L_05F76:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        les     bx, [WIN_FIELD_VAR]
        sub     ah, ah
        mov     al, byte ptr es:[bx]
        inc     ax
        if      FW_VERSION = 172
L_06366                         equ     $+1
        endif
        mov     cx, ax
        cmp     ax, 18h
        jge     L_06395
        mov     bx, ax
        shl     bx, 2
        add     bx, PGM_TABLE

loop_06375:
        les     si, [bx]
        cmp     word ptr es:[si], 2
        jne     br_0638A
        add     bx, 4
        inc     cx
        cmp     cx, 18h
        jl      loop_06375
        pop     ds
        pop     si
        retf
        db      90h

br_0638A:
        les     bx, [WIN_FIELD_VAR]
        mov     byte ptr es:[bx], cl
        callf   [WIN_FIELD_CHANGE_FN]

L_06395:
        pop     ds
        pop     si
        retf

L_05FBA:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        les     bx, [WIN_FIELD_VAR]
        sub     ah, ah
        mov     al, byte ptr es:[bx]
        dec     ax
        mov     cx, ax
        or      ax, ax
        jl      br_063D5
        mov     bx, ax
        shl     bx, 2
        add     bx, PGM_TABLE
loop_063B8:
        les     si, [bx]
        cmp     word ptr es:[si], 2
        jne     br_063CA
        sub     bx, 4
        dec     cx
        jns     loop_063B8
        pop     ds
        pop     si
        retf
        db      90h

br_063CA:
        les     bx, [WIN_FIELD_VAR]
        mov     byte ptr es:[bx], cl
        callf   [WIN_FIELD_CHANGE_FN]

br_063D5:
        pop     ds
        pop     si
        retf

seq_write_data:
        push    bp
        mov     bp, sp
        push    word ptr [bp+16h]
        push    word ptr [bp+14h]
        push    17h
        mov     al, byte ptr [bp+10h]
        push    ax
        mov     al, byte ptr [bp+0eh]
        push    ax
        push    14h
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    voice_trigger_full
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    install_handler_15
        cmp     word ptr [bp+12h], 0
        je      br_06412
        push    ds
        push    TBL_WINKEYS_026FE
        callf   TEXT1_SEG:win_keys_merge

br_06412:
        leave
        retf    12h

program_close:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_PGM_RETURN_PARAMS], 0
        jne     L_0642A
        callf   TEXT1_SEG:pgm_assign_enter
        jmp     X_0642F

L_0642A:
        callf   TEXT1_SEG:pgm_params_enter

X_0642F:
        push    1
        nop
        push    cs
        call    int44_wrapper
        pop     ds
        retf

copy_pgm_refresh:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    note_release_latched
        nop
        push    cs
        call    voice_release_all
        mov     byte ptr [PAD_INPUT_MODE], 2
        and     byte ptr [B_9D1C], 0feh
        push    1
        nop
        push    cs
        call    int44_wrapper
        pop     ds
        retf
        db      00h

program_paint:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_PROGRAM
        callf   TEXT1_SEG:disp_list_run
        push    73h
        push    13h
        mov     ax, word ptr [PGM_CURRENT]
        mov     dx, word ptr [PGM_CURRENT+2]
        add     ax, 2
        push    dx
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        push    0a9h
        push    25h
        les     bx, [PGM_CURRENT]
        mov     al, byte ptr es:[bx+PGM_MIDI_PGM]
        cbw
        inc     ax
        cwd
        push    dx
        push    ax
        push    3
        nop
        push    cs
        call    draw_unsigned_value
        cmp     byte ptr [PROGRAM_CURSOR], 0
        jne     X_064B1
        push    3dh
        push    1ch
        push    word ptr [PTR_STR_PRESS_ENTER_SEG]
        push    word ptr [PTR_STR_PRESS_ENTER]
        nop
        push    cs
        call    cmd_dispatch_1E

X_064B1:
        nop
        push    cs
        call    field_redraw
        pop     ds
        retf

t2_copy_pgm_cancel:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    program_close
        push    15h
        nop
        push    cs
        call    int43_wrapper
        pop     ds
        retf
X_064CC:
        mov     al, byte ptr [PGM_SLOT]
        cbw
        push    ax
        nop
        push    cs
        call    program_select
        retf
        db      00h

delete_pgm_do_it:
        push    di

L_064D9:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [PGM_SLOT]
        cbw
        push    ax
        nop
        push    cs
        call    smem_dma_init
        xor     di, di
        mov     si, PGM_TABLE

loop_064EF:
        les     bx, [si]
        cmp     word ptr es:[bx], 2
        jne     br_06502
        add     si, 4
        inc     di
        cmp     di, 18h
        jl      loop_064EF
        jmp     br_06506

br_06502:
        push    di
        jmp     L_0650F
        db      90h

br_06506:
        push    0
        nop
        push    cs
        call    program_select_wrapper
        push    0

L_0650F:
        nop
        push    cs
        call    program_select
        nop
        push    cs
        call    program_close
        pop     ds
        pop     si
        pop     di
        retf
        db      00h

delete_pgm_paint:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_DELETE_PROGRAM
        callf   TEXT1_SEG:disp_list_run
        mov     al, byte ptr [PGM_SLOT]
        cbw
        push    ax
        push    61h
        push    11h
        nop
        push    cs
        call    sequence_get_info
        nop
        push    cs
        call    field_redraw
        pop     ds
        retf
program_delete:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    int4B_wrapper
        or      ax, ax
        je      X_0655C
        push    ds
        push    STR_CANT_DELETE_PLAYING
        nop
        push    cs
        call    string_fill_stosb
        pop     ds
        retf
X_0655C:
        push    ds
        push    TBL_WINKEYS_DELETE_PGM
        callf   TEXT1_SEG:win_keys_merge
        push    ds
        push    PGM_SLOT
        push    1
        push    61h
        push    11h
        push    TEXT2_SEG
        push    X_064CC
        push    0
        push    0
        nop
        push    cs
        call    seq_write_data
        pop     ds
        retf


delete_all_pgms_cancel:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    program_close
        push    15h
        nop
        push    cs
        call    int43_wrapper
        push    3
        nop
        push    cs
        call    int43_wrapper
        pop     ds
        retf
        db      00h
delete_all_pgms_do_it:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    X_05972
        nop
        push    cs
        call    program_close
        pop     ds
        retf

delete_all_pgms_paint:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_DELETE_ALL_PROGRAMS
        callf   TEXT1_SEG:disp_list_run
        pop     ds
        retf
        db      00h

delete_pgm_allpgm:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    TBL_WINKEYS_DELETE_ALL_PGMS
        callf   TEXT1_SEG:win_keys_merge
        pop     ds
        retf
        db      00h

seq_select_caller:
        enter   2, 0
        push    di

L_065D7:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     word ptr [G_ERRNO], ERR_UNKNOWN
        nop
        push    cs
        call    far_059BC
        mov     word ptr [bp-2], ax
        or      ax, ax
        jl      t2_program_copy
        push    ax
        nop
        push    cs
        call    program_select_wrapper
        or      ax, ax
        je      br_06646
        mov     bx, word ptr [bp-2]
        shl     bx, 2
        mov     si, word ptr [bx+PGM_TABLE]
        mov     cx, word ptr [bx+PGM_TABLE+2]
        add     si, 2
        mov     dx, cx
        push    ds
        mov     di, TBL_SOUND_NAMES
        mov     cx, ds
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
        mov     al, byte ptr [COPY_PGM_TO]
        les     bx, [bx+PGM_TABLE]
        mov     byte ptr es:[bx+PGM_MIDI_PGM], al
        push    word ptr [bp-2]
        nop
        push    cs
        call    program_select
        jmp     br_06654

br_06646:
        mov     word ptr [G_ERRNO], ERR_NO_MEMORY
        jmp     br_06654

t2_program_copy:
        mov     word ptr [G_ERRNO], ERR_PROG_DIR_FULL

br_06654:
        cmp     word ptr [G_ERRNO], ERR_UNKNOWN
        je      L_06660
        nop
        push    cs
        call    err_msg_report

L_06660:
        nop
        push    cs

L_06662:
        call    program_close
        pop     ds
        pop     si
        pop     di
        leave
        retf

L_0666A:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_CREATE_NEW_PROGRAM

L_06674:
        callf   TEXT1_SEG:disp_list_run
        push    7fh
        push    13h
        push    ds
        push    TBL_SOUND_NAMES
        nop
        push    cs
        call    cmd_dispatch_1E
        push    0c1h
        push    25h
        if      FW_VERSION = 172
L_0668C                         equ     $+1
        endif
        mov     al, byte ptr [COPY_PGM_TO]
        cbw
        inc     ax
        cwd
        push    dx
        push    ax
        push    3
        nop
        push    cs
        call    draw_unsigned_value
        cmp     byte ptr [COPY_PGM_CURSOR], 0
        jne     L_066B2
        push    49h
        push    1ch
        push    word ptr [PTR_STR_PRESS_ENTER_SEG]
        push    word ptr [PTR_STR_PRESS_ENTER]
        nop
        push    cs
        call    cmd_dispatch_1E

L_066B2:
        nop
        push    cs

L_066B4:
        call    field_redraw
        pop     ds
        retf
        db      00h

copy_pgm_do_it:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_COPY_SRC_PGM]
        cmp     byte ptr [G_COPY_DST_PGM], al
        je      X_066F9
        mov     al, byte ptr [G_COPY_DST_PGM]

L_066CC:
        cbw
        push    ax
        mov     al, byte ptr [G_COPY_SRC_PGM]
        cbw
        push    ax
        nop
        push    cs
        call    smem_access_handler_2
        or      ax, ax

L_066DA:
        je      br_066EE
        mov     al, byte ptr [G_COPY_DST_PGM]
        cbw
        push    ax
        nop
        push    cs
        call    program_select
        nop
        push    cs
        call    program_close
        pop     ds
        retf
        db      90h

br_066EE:
        mov     word ptr [G_ERRNO], ERR_NO_MEMORY
        nop
        push    cs
        call    err_msg_report

X_066F9:
        pop     ds
        retf
        db      00h

copy_pgm_paint:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx

T2_L_06702:
        push    cx
        push    DL_COPY_PROGRAM
        callf   TEXT1_SEG:disp_list_run
        mov     al, byte ptr [G_COPY_SRC_PGM]
        cbw
        push    ax

L_06710:
        push    61h
        push    10h
        nop
        push    cs
        call    sequence_get_info
        mov     al, byte ptr [G_COPY_DST_PGM]
        cbw
        push    ax

L_0671E:
        push    61h
        push    28h
        nop
        push    cs
        call    sequence_get_info
        nop
        push    cs
        call    field_redraw
        pop     ds
        retf

L_0672E:
        push    di

L_0672F:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_COPY_SRC_PGM]
        cmp     byte ptr [G_COPY_DST_PGM], al
        jne     br_0674B
        mov     al, byte ptr [G_COPY_DST_NOTE]
        cmp     byte ptr [G_COPY_SRC_NOTE], al
        jne     br_0674B
        jmp     X_067E4

br_0674B:
        mov     al, byte ptr [G_COPY_SRC_PGM]
        cbw
        mov     bx, ax
        shl     bx, 2
        mov     ax, word ptr [bx+PGM_TABLE]
        mov     dx, word ptr [bx+PGM_TABLE+2]
        mov     cx, ax
        mov     al, PGM_PAD_STRIDE
        mul     byte ptr [G_COPY_SRC_NOTE]
        add     cx, ax
        sub     cx, PGM_PAD_BIAS
        mov     al, byte ptr [G_COPY_DST_NOTE]
        sub     ah, ah
        imul    bx, ax, PGM_PAD_STRIDE
        mov     al, byte ptr [G_COPY_DST_PGM]
        cbw
        mov     si, ax
        shl     si, 2
        les     si, [si+PGM_TABLE]
        push    ds
        lea     di, [bx+si+PGM_PAD_NOTE0]
        mov     si, cx
        mov     ds, dx
        mov     cx, 0eh
        rep movsw
        movsb
        pop     ds
        mov     al, byte ptr [G_COPY_SRC_PGM]
        cbw
        mov     bx, ax
        shl     bx, 2
        mov     ax, word ptr [bx+PGM_TABLE]
        mov     dx, word ptr [bx+PGM_TABLE+2]
        mov     cl, byte ptr [G_COPY_SRC_NOTE]
        sub     ch, ch
        mov     bx, cx
        add     cx, cx
        add     cx, bx
        add     cx, cx
        add     ax, cx
        add     ax, PGM_NOTE6
        mov     bl, byte ptr [G_COPY_DST_NOTE]
        mov     cx, bx
        add     bx, bx
        add     bx, cx
        add     bx, bx
        mov     cx, ax
        mov     al, byte ptr [G_COPY_DST_PGM]
        cbw
        mov     si, ax
        shl     si, 2
        mov     ax, bx
        les     bx, [si+PGM_TABLE]
        mov     si, ax
        push    ds
        lea     di, [bx+si+PGM_NOTE6]
        mov     si, cx
        mov     ds, dx
        movsw
        movsw
        movsw
        pop     ds
        nop
        push    cs
        call    program_close

X_067E4:
        pop     ds
        pop     si
        pop     di
        retf

X_067E8:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_COPY_NOTE_PARAMS
        if      FW_VERSION = 172
L_067F4                         equ     $+2
        endif
        callf   TEXT1_SEG:disp_list_run
        mov     al, byte ptr [G_COPY_SRC_PGM]
        cbw
        push    ax
        push    55h
        push    0bh
        nop
        push    cs
        call    sequence_get_info
        mov     al, byte ptr [G_COPY_SRC_NOTE]
        push    ax
        push    55h
        push    14h
        nop
        push    cs
        call    timer_value_read_3
        mov     al, byte ptr [G_COPY_DST_PGM]
        cbw
        push    ax
        push    55h
        push    20h
        nop
        push    cs
        call    sequence_get_info
        mov     al, byte ptr [G_COPY_DST_NOTE]
        push    ax
        push    55h
        push    29h
        nop
        push    cs
        call    timer_value_read_3
        nop
        push    cs
        call    field_redraw
        pop     ds
        retf

far_06834:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    48h
        push    TEXT2_SEG
        push    L_00DE8
        nop
        push    cs
        call    install_handler
        pop     ds
        retf
        db      00h

L_0646C:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    mixer_stereo_page
        pop     ds
        retf
        db      00h

mixer_stereo_page:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_2AEA
        nop
        push    cs
        call    voice_block_copy
        push    ds
        push    P_2B02
        callf   TEXT1_SEG:win_keys_merge
        push    ds
        push    P_2B1C
        callf   TEXT1_SEG:disp_list_run
        pop     ds
        retf
        db      00h
note_pitch_calc_1:
        enter   6, 0
        push    di
        push    si
        mov     bx, word ptr [bp+6]
        les     di, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+di]
        cbw
        mov     si, ax
        sub     ax, 23h
        cmp     ax, 3fh
        ja      br_068D0
        push    si
        nop
        push    cs
        call    note_clamp_flag
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx]
        cbw
        add     ax, 2
        mov     cx, 3
        cwd
        idiv    cx
        mov     word ptr [bp-6], ax
        cmp     ax, 22h
        jge     br_068D0
        mov     al, byte ptr [bp-6]
        mov     cl, al
        add     al, al
        add     al, cl
        inc     al
        mov     byte ptr es:[bx], al
        push    1
        push    word ptr [bp+6]
        cbw
        push    ax
        nop
        push    cs
        call    note_clamp_multi
br_068D0:
        pop     si
        pop     di
        leave
        retf    2
note_pitch_calc_2:
        enter   6, 0
        push    di
        push    si
        mov     bx, word ptr [bp+6]
        les     di, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+di]
        cbw
        mov     si, ax
        sub     ax, 23h
        cmp     ax, 3fh
        ja      tgt_0693B
        push    si
        nop
        push    cs
        call    note_clamp_flag
        mov     es, dx
        mov     bx, ax
        mov     word ptr [bp-6], ax
        mov     al, byte ptr es:[bx]
        cbw
        add     ax, 2
        mov     cx, 3
        cwd
        idiv    cx
        mov     word ptr [bp-2], ax
        or      ax, ax
        jle     tgt_0693B
        dec     word ptr [bp-2]
        je      tgt_06926
        mov     ax, word ptr [bp-2]
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        sub     ax, 2
        mov     word ptr [bp-2], ax
tgt_06926:
        push    1
        push    word ptr [bp+6]
        mov     bx, word ptr [bp-6]
        mov     al, byte ptr [bp-2]
        mov     byte ptr es:[bx], al
        cbw
        push    ax
        nop
        push    cs
        call    note_clamp_multi
tgt_0693B:
        pop     si
        pop     di
        leave
        retf    2
        db      00h
note_pitch_calc_3:
        enter   4, 0
        push    di
        push    si
        mov     bx, word ptr [bp+6]
        les     si, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     di, ax
        sub     ax, 23h
        cmp     ax, 3fh
        ja      tgt_0699D
        push    di
        nop
        push    cs
        call    note_clamp_flag
        mov     es, dx
        mov     bx, ax
        inc     bx
        mov     al, byte ptr es:[bx]
        cbw
        sub     ax, 32h
        cmp     ax, 32h
        jge     tgt_0699D
        mov     cx, 3
        cwd
        idiv    cx
        inc     ax
        mov     dx, ax
        add     ax, ax
        add     ax, dx
        mov     si, ax
        cmp     si, 32h
        jle     tgt_0698B
        mov     si, 32h
tgt_0698B:
        push    2
        push    word ptr [bp+6]
        lea     ax, [si+32h]
        mov     byte ptr es:[bx], al
        cbw
        push    ax
        nop
        push    cs
        call    note_clamp_multi
tgt_0699D:
        pop     si
        pop     di
        leave
        retf    2
        db      00h
note_str_handler:
        enter   4, 0
        push    di
        push    si
        mov     bx, word ptr [bp+6]
        les     si, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     di, ax
        sub     ax, 23h
        cmp     ax, 3fh
        ja      tgt_069FF
        push    di
        nop
        push    cs
        call    note_clamp_flag
        mov     es, dx
        mov     bx, ax
        inc     bx
        mov     al, byte ptr es:[bx]
        cbw
        sub     ax, 32h
        cmp     ax, 0ffceh
        jle     tgt_069FF
        mov     cx, 3
        cwd
        idiv    cx
        dec     ax
        mov     dx, ax
        add     ax, ax
        add     ax, dx
        mov     si, ax
        cmp     si, -32h
        jge     tgt_069ED
        mov     si, 0ffceh
tgt_069ED:
        push    2
        push    word ptr [bp+6]
        lea     ax, [si+32h]
        mov     byte ptr es:[bx], al
        cbw
        push    ax
        nop
        push    cs
        call    note_clamp_multi

tgt_069FF:
        pop     si
        pop     di
        leave
        retf    2
        db      00h

note_pitch_calc_cmd:
        enter   6, 0
        push    di
        push    si
        mov     si, word ptr [bp+6]
        les     bx, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     word ptr [bp-6], ax
        sub     ax, 23h
        cmp     ax, 3fh
        ja      br_06A7D
        mov     di, word ptr [bp+8]
        push    word ptr [bp-6]
        nop
        push    cs
        call    note_clamp_flag
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    12h
        lea     ax, [di+7]
        push    ax
        mov     es, dx
        mov     al, byte ptr es:[si]
        cbw
        add     ax, 2
        mov     cx, 3
        cwd
        idiv    cx
        if      FW_VERSION = 172
; dispatch through the 7-entry far-pointer table at 2B6Ah
L_06A48                         equ     $+1
cmd_dispatch_table_2b6a         equ     $+1
        endif
        mov     cx, ax
        sub     ax, 31h
        neg     ax
        push    ax
        push    4
        push    cx
        nop
        push    cs
        call    cmd_build_params
        push    di
        push    1
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+1]
        cbw
        sub     ax, 32h
        mov     cx, 7
        cwd
        idiv    cx
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+P_2B6C]
        push    word ptr [bx+P_2B6A]
        nop
        push    cs
        call    cmd_caller_setup

br_06A7D:
        pop     si
        pop     di
        leave
        retf    4
        db      00h

dispatch_handler_2:
        push    bp
        mov     bp, sp
        cmp     word ptr [bp+6], 1
        sbb     ax, ax
        add     ax, 2
        push    ax
        nop
        push    cs
        call    sample_dispatch_table
        nop
        push    cs
        call    far_06834
        leave
        retf    2
        db      00h

mixer_indiv_page:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_2B8A
        nop
        push    cs
        call    voice_block_copy
        push    ds
        push    P_2BA2
        callf   TEXT1_SEG:win_keys_merge
        push    ds
        push    P_2BBC
        callf   TEXT1_SEG:disp_list_run
        pop     ds
        retf
        db      00h
note_range_calc_1:
        enter   6, 0
        push    di
        push    si
        mov     bx, word ptr [bp+6]
        les     di, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+di]
        cbw
        mov     si, ax
        sub     ax, 23h
        cmp     ax, 3fh
        ja      br_06B1B
        push    si
        nop
        push    cs
        call    note_range_clamp
        mov     es, dx
        mov     bx, ax
        add     bx, 2
        mov     al, byte ptr es:[bx]
        cbw
        add     ax, 2
        mov     cx, 3
        cwd
        idiv    cx
        mov     word ptr [bp-6], ax
        cmp     ax, 22h
        jge     br_06B1B
        mov     al, byte ptr [bp-6]
        mov     cl, al
        add     al, al
        add     al, cl
        inc     al
        mov     byte ptr es:[bx], al
        push    5
        push    word ptr [bp+6]
        cbw
        push    ax
        nop
        push    cs
        call    note_clamp_multi
br_06B1B:
        pop     si
        pop     di
        leave
        retf    2
        db      00h
note_range_calc_2:
        enter   6, 0
        push    di
        push    si
        mov     bx, word ptr [bp+6]
        les     di, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+di]
        cbw
        mov     si, ax
        sub     ax, 23h
        cmp     ax, 3fh
        ja      tgt_06B84
        push    si
        nop
        push    cs
        call    note_range_clamp
        mov     es, dx
        mov     bx, ax
        add     bx, 2
        mov     al, byte ptr es:[bx]
        cbw
        add     ax, 2
        mov     cx, 3
        cwd
        idiv    cx
        mov     word ptr [bp-2], ax
        or      ax, ax
        jle     tgt_06B84
        dec     word ptr [bp-2]
        je      tgt_06B72
        mov     ax, word ptr [bp-2]
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        sub     ax, 2
        mov     word ptr [bp-2], ax
tgt_06B72:
        push    5
        push    word ptr [bp+6]
        mov     al, byte ptr [bp-2]
        mov     byte ptr es:[bx], al
        cbw
        push    ax
        nop
        push    cs
        call    note_clamp_multi

tgt_06B84:
        pop     si
        pop     di
        leave
        retf    2

bcd_arithmetic_2:
        enter   6, 0
        push    di
        push    si
        mov     si, word ptr [bp+6]
        les     bx, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     word ptr [bp-6], ax
        sub     ax, 23h
        cmp     ax, 3fh
        ja      br_06BD1
        push    word ptr [bp-6]
        nop
        push    cs
        call    note_range_clamp
        mov     es, dx
        mov     bx, ax
        mov     si, ax
        mov     al, byte ptr es:[bx+PGM_MIX_IOUT]
        and     ax, 0fh
        mov     di, ax
        cmp     ax, 8
        jae     br_06BD1
        mov     al, byte ptr es:[si+PGM_MIX_IOUT]
        and     al, 80h
        lea     cx, [di+1]
        or      al, cl
        mov     byte ptr es:[si+PGM_MIX_IOUT], al

br_06BD1:
        pop     si
        pop     di
        leave
        retf    2
        db      00h

bcd_arithmetic_3:
        enter   6, 0
        push    di
        push    si
        mov     si, word ptr [bp+6]
        les     bx, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     word ptr [bp-6], ax
        sub     ax, 23h
        cmp     ax, 3fh
        ja      br_06C1E
        push    word ptr [bp-6]
        nop
        push    cs
        call    note_range_clamp
        mov     es, dx
        mov     bx, ax
        mov     si, ax
        mov     al, byte ptr es:[bx+PGM_MIX_IOUT]
        and     ax, 0fh
        mov     di, ax
        or      ax, ax
        je      br_06C1E
        mov     al, byte ptr es:[si+PGM_MIX_IOUT]
        and     al, 80h
        lea     cx, [di-1]
        or      al, cl
        mov     byte ptr es:[si+PGM_MIX_IOUT], al

br_06C1E:
        pop     si
        pop     di
        leave
        retf    2

note_cmd_helper:
        enter   0ah, 0
        push    di
        push    si
        mov     si, word ptr [bp+6]
        les     bx, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     di, ax
        sub     ax, 23h
        cmp     ax, 3fh
        jbe     X_06C42
        jmp     br_06CD6

X_06C42:
        push    di
        nop
        push    cs
        call    note_range_clamp
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        imul    di, di, PGM_PAD_STRIDE
        les     bx, [PGM_CURRENT]
        mov     ax, word ptr es:[bx+di+PGM_PAD_NOTE0]
        mov     dx, word ptr es:[bx+di+PGM_PAD_NOTE0+PGM_PAD_SND_SEG]
        mov     si, ax
        mov     word ptr [bp-8], dx
        push    12h
        mov     ax, word ptr [bp+8]
        add     ax, 7
        push    ax
        les     bx, [bp-4]
        mov     al, byte ptr es:[bx+PGM_MIX_IVOL]
        cbw
        add     ax, 2
        mov     cx, 3
        cwd
        idiv    cx
        if      FW_VERSION = 172
L_06C7F                         equ     $+1
cmd_dispatch_table_2bee         equ     $+1
        endif
        mov     cx, ax
        sub     ax, 31h
        neg     ax
        push    ax
        push    4
        push    cx
        nop
        push    cs
        call    cmd_build_params
        mov     ax, word ptr [bp-8]
        or      ax, si
        je      L_06CA2
        mov     es, word ptr [bp-8]
        mov     al, byte ptr es:[si+13h]
        cbw
        mov     word ptr [bp-6], ax
        jmp     br_06CA7

L_06CA2:
        mov     word ptr [bp-6], 1

br_06CA7:
        push    word ptr [bp+8]
        push    1
        les     bx, [bp-4]
        mov     al, byte ptr es:[bx+PGM_MIX_IOUT]
        and     ax, 0fh
        mov     bx, ax
        mov     ax, word ptr [bp-6]
        mov     cx, ax
        shl     ax, 2
        add     ax, cx
        add     ax, ax
        add     bx, ax
        shl     bx, 2
        push    word ptr [bx+TBL_NOTE_GLYPHS+2]
        push    word ptr [bx+TBL_NOTE_GLYPHS]
        nop
        push    cs
        call    cmd_caller_setup

br_06CD6:
        pop     si
        pop     di
        leave
        retf    4

dispatch_handler_1:
        push    bp
        mov     bp, sp
        cmp     word ptr [bp+6], 1
        sbb     ax, ax
        add     ax, 6
        push    ax
        nop
        push    cs
        call    sample_dispatch_table
        leave
        retf    2

mixer_fxsend_page:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_2C3E
        nop
        push    cs
        call    voice_block_copy
        push    ds
        push    P_2C56
        callf   TEXT1_SEG:win_keys_merge
        push    ds
        push    P_2C70
        callf   TEXT1_SEG:disp_list_run
        pop     ds
        retf
        db      00h
note_range_calc_3:
        enter   6, 0
        push    di
        push    si
        mov     bx, word ptr [bp+6]
        les     di, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+di]
        cbw
        mov     si, ax
        sub     ax, 23h
        cmp     ax, 3fh
        ja      br_06D6D
        push    si
        nop
        push    cs
        call    note_range_clamp
        mov     es, dx
        mov     bx, ax
        add     bx, 4
        mov     al, byte ptr es:[bx]
        cbw
        add     ax, 2
        mov     cx, 3
        cwd
        idiv    cx
        mov     word ptr [bp-6], ax
        cmp     ax, 22h
        jge     br_06D6D
        mov     al, byte ptr [bp-6]
        mov     cl, al
        add     al, al
        add     al, cl
        inc     al
        mov     byte ptr es:[bx], al
        push    3
        push    word ptr [bp+6]
        cbw
        push    ax
        nop
        push    cs
        if      FW_VERSION = 150
L_06E0A:
        endif
        call    note_clamp_multi

br_06D6D:
        pop     si
        pop     di
        leave
        retf    2
        db      00h
note_range_calc_4:
        enter   6, 0
        push    di
        push    si
        mov     bx, word ptr [bp+6]
        les     di, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+di]
        cbw
        mov     si, ax
        sub     ax, 23h
        cmp     ax, 3fh
        ja      br_06DD6
        push    si
        nop
        push    cs
        call    note_range_clamp
        mov     es, dx
        mov     bx, ax
        add     bx, 4
        mov     al, byte ptr es:[bx]
        cbw
        add     ax, 2
        mov     cx, 3
        cwd
        idiv    cx
        mov     word ptr [bp-2], ax
        or      ax, ax
        jle     br_06DD6
        dec     word ptr [bp-2]
        je      br_06DC4
        mov     ax, word ptr [bp-2]
        mov     cx, ax
        add     ax, ax
L_144DE:
        add     ax, cx
        sub     ax, 2
        mov     word ptr [bp-2], ax

br_06DC4:
        push    3
        push    word ptr [bp+6]
        mov     al, byte ptr [bp-2]
        mov     byte ptr es:[bx], al
        cbw
        push    ax
        nop
        push    cs
        call    note_clamp_multi

br_06DD6:
        pop     si
        pop     di
        leave
        retf    2
; ? misnomer: a track's note byte via PTR_TRACK_DATA, then range-checked.
timer_dma_setup:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     di, word ptr [bp+6]
        les     bx, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+di]
        cbw
        mov     si, ax
        sub     ax, 23h
        cmp     ax, 3fh
        ja      br_06E15
        push    si
        nop
        push    cs
        call    note_range_clamp
        mov     es, dx
        mov     bx, ax
        cmp     byte ptr es:[bx+PGM_MIX_FX_BUS], 4
        jge     br_06E15
        push    si
        nop
        push    cs
        if      FW_VERSION = 172

L_06E0A:
        endif
        call    note_range_clamp
        mov     bx, ax
        mov     es, dx
        inc     byte ptr es:[bx+PGM_MIX_FX_BUS]

br_06E15:
        pop     si
        pop     di
        leave
        retf    2
        db      00h
; ? misnomer: as timer_dma_setup, but decrements.
timer_dma_setup2:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     di, word ptr [bp+6]
        les     bx, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+di]
        cbw
        mov     si, ax
        sub     ax, 23h
        cmp     ax, 3fh
        ja      br_06E55
        push    si
        nop
        push    cs
        call    note_range_clamp
        mov     es, dx
        mov     bx, ax
        cmp     byte ptr es:[bx+PGM_MIX_FX_BUS], 0
        jle     br_06E55
        push    si
        nop
        push    cs
        call    note_range_clamp
        mov     bx, ax
        mov     es, dx
        dec     byte ptr es:[bx+PGM_MIX_FX_BUS]

br_06E55:
        pop     si
        pop     di
        leave
        retf    2
        db      00h

note_range_calc_cmd:
        enter   0ah, 0
        push    di
        push    si
        mov     si, word ptr [bp+6]
        les     bx, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     word ptr [bp-6], ax
        sub     ax, 23h
        cmp     ax, 3fh
        ja      br_06ECC
        mov     di, word ptr [bp+8]
        push    word ptr [bp-6]
        nop
        push    cs
        call    note_range_clamp
        mov     si, ax
        push    12h
        lea     ax, [di+7]
        push    ax
        mov     es, dx
        mov     al, byte ptr es:[si+PGM_MIX_FX_LEVEL]
        cbw
L_145B4:
        add     ax, 2
        mov     cx, 3
        cwd
        idiv    cx
        mov     dx, ax
        sub     ax, 31h
        neg     ax
        push    ax
        push    4
        push    dx
        mov     word ptr [bp-0ah], si
        mov     word ptr [bp-8], es
        nop
        push    cs
        call    cmd_build_params
        push    di
        push    3
        les     bx, [bp-0ah]
        mov     al, byte ptr es:[bx+PGM_MIX_FX_BUS]
        cbw
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        add     ax, TBL_FX_BUS_LABELS
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E

br_06ECC:
        pop     si
        pop     di
        leave
        retf    4

; ? misnomer: selects index 1 or 4 from a comparison.
timer_dma_setup3:
        push    bp
        mov     bp, sp
        cmp     word ptr [bp+6], 1
        sbb     ax, ax
        add     ax, 4
        push    ax
        nop
        push    cs
        call    sample_dispatch_table
        leave
        retf    2
sample_dispatch_table:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     si, word ptr [bp+6]
        mov     bl, byte ptr [G_PAD_BANK]
        sub     bh, bh
        shl     bx, 4
        mov     al, byte ptr [G_PAD_INDEX]
        sub     ah, ah
        add     bx, ax
        les     di, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+di]
        cbw
        mov     cx, ax
        mov     ax, si
        mov     byte ptr [B_8D42], al
        dec     ax
        cmp     ax, 5
        ja      br_06F57
        add     ax, ax
        xchg    bx, ax
        jmp     word ptr cs:[bx+X_06F1E]
        db      90h

X_06F1E:
        dw      X_06F2A, L_06F32, L_06F3A, L_06F42
        dw      X_06F4A, L_06F52

X_06F2A:
        mov     byte ptr [B_8D43], 1
        jmp     SHORT br_06F57
        db      90h

L_06F32:
        mov     byte ptr [B_8D43], 2
        jmp     SHORT br_06F57
        db      90h

L_06F3A:
        mov     byte ptr [B_8D43], 5
        jmp     SHORT br_06F57
        db      90h

L_06F42:
        mov     byte ptr [B_8D43], 6
        jmp     SHORT br_06F57
        db      90h

X_06F4A:
        mov     byte ptr [B_8D43], 3
        jmp     SHORT br_06F57
        db      90h

L_06F52:
        mov     byte ptr [B_8D43], 4

br_06F57:
        mov     ax, cx
        sub     ax, 23h
        cmp     ax, 3fh
        ja      br_06F73
        mov     byte ptr [G_PAD_NOTE_BASE], cl
        push    ds
        push    TBL_WINKEYS_CHANNEL_SETTINGS
        callf   TEXT1_SEG:win_keys_merge
        nop
        push    cs
        call    timer_str_handler

br_06F73:
        pop     si
        pop     di
        leave
        retf    2
        db      00h

; track record via PGM_CURRENT, index * 1Dh (the 29-byte TRACK stride).
timer_read_caller:
        enter   0ch, 0
        push    di

L_06F7F:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_CHANNEL_SETTINGS
        callf   TEXT1_SEG:disp_list_run
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        imul    di, ax, PGM_PAD_STRIDE
        les     bx, [PGM_CURRENT]
        mov     ax, word ptr es:[bx+di+PGM_PAD_NOTE0]
        mov     dx, word ptr es:[bx+di+PGM_PAD_NOTE0+PGM_PAD_SND_SEG]
        mov     si, ax
        mov     word ptr [bp-6], dx
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        push    ax
        mov     al, byte ptr [TBL_CHANSET_FIELD_X]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [TBL_CHANSET_FIELD_Y]
        push    ax
        nop
        push    cs
        call    timer_value_read_3
        push    word ptr [bp-6]
        push    si
        mov     al, byte ptr [TBL_CHANSET_FIELD_X]
        sub     ah, ah
        add     ax, 2ah
        push    ax
        mov     al, byte ptr [TBL_CHANSET_FIELD_Y]
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    timer_value_read_4
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    note_clamp_flag
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     al, byte ptr [CHANSET_VOL_X]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [CHANSET_VOL_Y]
        push    ax
        les     bx, [bp-4]
        mov     al, byte ptr es:[bx]
        cbw
        cwd
        push    dx
        push    ax
        push    3
        nop
        push    cs
        call    draw_unsigned_value
        mov     al, byte ptr [CHANSET_PAN_X]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [CHANSET_PAN_Y]
        push    ax
        les     bx, [bp-4]
        mov     al, byte ptr es:[bx+PGM_MIX_PAN]
        cbw
        sub     ax, 32h
        push    ax
        nop
        push    cs
        call    cmd_exec_1E
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    note_range_clamp
        mov     di, ax
        mov     word ptr [bp-0ah], dx
        mov     al, byte ptr [CHANSET_IVOL_X]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [CHANSET_IVOL_Y]
        push    ax
        mov     es, dx
        mov     al, byte ptr es:[di+PGM_MIX_IVOL]
        cbw
        cwd
        push    dx
        push    ax
        push    3
        nop
        push    cs
        call    draw_unsigned_value
        mov     ax, word ptr [bp-6]
        or      ax, si
        je      L_0705A
        mov     es, word ptr [bp-6]
        mov     al, byte ptr es:[si+13h]
        cbw
        mov     si, ax
        jmp     L_0705D

L_0705A:
        mov     si, 1

L_0705D:
        mov     al, byte ptr [CHANSET_IOUT_X]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [CHANSET_IOUT_Y]
        push    ax
        mov     es, word ptr [bp-0ah]
        mov     al, byte ptr es:[di+PGM_MIX_IOUT]
        and     ax, 0fh
        mov     cx, si
        shl     si, 2
        add     si, cx
        add     si, si
        add     ax, si
        shl     ax, 2
        add     ax, P_2A9A
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        mov     al, byte ptr [CHANSET_FOLLOW_X]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [CHANSET_FOLLOW_Y]
        push    ax
        mov     es, word ptr [bp-0ah]
        mov     al, byte ptr es:[di+PGM_MIX_IOUT]
        and     al, 80h
        cmp     al, 1
        sbb     bx, bx
        inc     bx
        shl     bx, 2
        push    word ptr [bx+P_2A94]
        push    word ptr [bx+P_2A92]
        nop
        push    cs
        call    cmd_dispatch_1E
        mov     al, byte ptr [CHANSET_FXLVL_X]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [CHANSET_FXLVL_Y]
        push    ax
        mov     es, word ptr [bp-0ah]
        mov     al, byte ptr es:[di+PGM_MIX_FX_LEVEL]
        cbw
        cwd
        push    dx
        push    ax
        push    3
        nop
        push    cs
        call    draw_unsigned_value
        mov     al, byte ptr [CHANSET_FXBUS_X]
        sub     ah, ah
        push    ax
        mov     al, byte ptr [CHANSET_FXBUS_Y]
        push    ax
        mov     es, word ptr [bp-0ah]
        mov     al, byte ptr es:[di+PGM_MIX_FX_BUS]
        cbw
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        add     ax, TBL_FX_BUS_LABELS
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        nop
        push    cs
        call    field_redraw
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h

L_070FA:
        push    si
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    note_clamp_flag
        mov     si, ax
        les     bx, [WIN_FIELD_VAR]
        mov     al, byte ptr es:[bx]
        mov     es, dx
        mov     byte ptr es:[si], al
        pop     si
        retf
mix_pan_store:
        push    si
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    note_clamp_flag
        mov     si, ax
        les     bx, [WIN_FIELD_VAR]
        mov     al, byte ptr es:[bx]
        add     al, 32h
        mov     es, dx
        mov     byte ptr es:[si+PGM_MIX_PAN], al
        pop     si
        retf
        db      00h
L_07136:
        push    si
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    note_range_clamp
        mov     si, ax
        les     bx, [WIN_FIELD_VAR]
        mov     al, byte ptr es:[bx]
        mov     es, dx
        mov     byte ptr es:[si+PGM_MIX_IVOL], al
        pop     si
        retf
        db      00h
L_07154:
        push    si
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    note_range_clamp
        add     ax, 3
        mov     si, ax
        mov     es, dx
        mov     al, byte ptr es:[si]
        and     al, 80h
        les     bx, [WIN_FIELD_VAR]
        or      al, byte ptr es:[bx]
        mov     es, dx
        mov     byte ptr es:[si], al
        pop     si
        retf
timer_poll_wait_5:
        enter   4, 0
        push    si
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    note_range_clamp
        mov     es, dx
        mov     bx, ax
        add     bx, 3
        mov     si, bx
        mov     word ptr [bp-2], es
        and     byte ptr es:[bx], 7fh
        les     bx, [WIN_FIELD_VAR]
        cmp     byte ptr es:[bx], 0
; ? misnomer: note_range_clamp for the current track [8CE0h], then toggles.
        je      L_071AB
        mov     es, word ptr [bp-2]
        or      byte ptr es:[si], 80h

L_071AB:
        pop     si
        leave
        retf

L_071AE:
        push    si
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    note_range_clamp
        mov     si, ax
        les     bx, [WIN_FIELD_VAR]
        mov     al, byte ptr es:[bx]
        mov     es, dx
        mov     byte ptr es:[si+PGM_MIX_FX_LEVEL], al
        pop     si
        retf
        db      00h
L_071CC:
        push    si
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    note_range_clamp
        mov     si, ax
        les     bx, [WIN_FIELD_VAR]
        mov     al, byte ptr es:[bx]
        mov     es, dx
        mov     byte ptr es:[si+PGM_MIX_FX_BUS], al
        pop     si
        retf
        db      00h
; mode-indexed jump table, 0-7 wrapping at [8D43h], renders LCD fields.
timer_str_handler:
        enter   2, 0
        cmp     byte ptr [B_8D43], 7
        jle     br_071FA
        mov     byte ptr [B_8D43], 0

br_071FA:
        mov     al, byte ptr [B_8D43]
        cbw
        mov     bx, ax
        add     bx, ax
        mov     cl, byte ptr [bx+TBL_CHANSET_FIELD_X]
        mov     byte ptr [bp-1], cl
        mov     cl, byte ptr [bx+TBL_CHANSET_FIELD_Y]
        mov     byte ptr [bp-2], cl
        cmp     ax, 7
        jbe     X_07218
        jmp     X_073C1

X_07218:
        add     ax, ax
        xchg    bx, ax
        jmp     word ptr cs:[bx+X_07220]

X_07220:
        dw      X_07230, X_0724A, X_07282, X_072BE
        dw      X_072F2, X_07324, X_0735A, X_07388

X_07230:
        push    ds
        push    G_PAD_NOTE_BASE
        mov     al, byte ptr [bp-1]
        push    ax
        mov     al, byte ptr [bp-2]
        push    ax
        push    0
        nop
        push    cs
        call    timer_value_read_1
        add     byte ptr [WIN_FIELD_BOX_W], 66h
        leave
        retf

X_0724A:
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    note_clamp_flag
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx]
        mov     byte ptr [G_EDIT_FIELD_VAL], al
        push    ds
        push    G_EDIT_FIELD_VAL
        push    0
        push    64h
        push    3
        mov     al, byte ptr [bp-1]
        push    ax
        mov     al, byte ptr [bp-2]
        push    ax
        push    0
        push    0
        push    TEXT2_SEG
        push    L_070FA

X_0727B:
        nop
        push    cs
        call    status_read_6A_3
        leave
        retf

X_07282:
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    note_clamp_flag
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+1]
        sub     al, 32h
        mov     byte ptr [G_EDIT_FIELD_VAL], al
        push    ds
        push    G_EDIT_FIELD_VAL
        push    -32h
        push    32h
        push    2
        mov     al, byte ptr [bp-1]
        push    ax
        mov     al, byte ptr [bp-2]
        push    ax
        push    0
        push    0
        push    TEXT2_SEG
        push    mix_pan_store
        nop
        push    cs
        call    field_register_s8
        leave
        retf
        db      90h

X_072BE:
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    note_range_clamp
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+2]
        mov     byte ptr [G_EDIT_FIELD_VAL], al
        push    ds
        push    G_EDIT_FIELD_VAL
        push    0
        push    64h
        push    3
        mov     al, byte ptr [bp-1]
        push    ax
        mov     al, byte ptr [bp-2]
        push    ax
        push    0
        push    0
        push    TEXT2_SEG
        push    L_07136
        jmp     SHORT X_0727B

X_072F2:
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    note_range_clamp
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+3]
        and     al, 7
        mov     byte ptr [G_EDIT_FIELD_VAL], al
        push    ds
        push    G_EDIT_FIELD_VAL
        push    8
        mov     al, byte ptr [bp-1]
        push    ax
        mov     al, byte ptr [bp-2]
        push    ax
        push    4
        push    TEXT2_SEG
        push    L_07154
        jmp     NEAR X_073BC
        db      90h

X_07324:
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    note_range_clamp
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+4]
        mov     byte ptr [G_EDIT_FIELD_VAL], al
        push    ds
        push    G_EDIT_FIELD_VAL
        push    0
        push    64h
        push    3
        mov     al, byte ptr [bp-1]
        push    ax
        mov     al, byte ptr [bp-2]
        push    ax
        push    0
        push    0
        push    TEXT2_SEG
        push    L_071AE
        jmp     NEAR X_0727B
        db      90h

X_0735A:
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    note_range_clamp
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+5]
        mov     byte ptr [G_EDIT_FIELD_VAL], al
        push    ds
        push    G_EDIT_FIELD_VAL
        push    4
        mov     al, byte ptr [bp-1]
        push    ax
        mov     al, byte ptr [bp-2]
        push    ax
        push    3
        push    TEXT2_SEG
        push    L_071CC
        jmp     SHORT X_073BC

X_07388:
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    note_range_clamp
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+3]
        and     al, 80h
        cmp     al, 1
        sbb     al, al
        inc     al
        mov     byte ptr [G_EDIT_FIELD_VAL], al
        push    ds
        push    G_EDIT_FIELD_VAL
        push    1
        mov     al, byte ptr [bp-1]
        push    ax
        mov     al, byte ptr [bp-2]
        push    ax
        push    4
        push    TEXT2_SEG
        push    timer_poll_wait_5

X_073BC:
        nop
        push    cs
        call    voice_trigger_full

X_073C1:
        leave
        retf
        db      00h

channel_settings_up:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [B_8D43]
        cbw
        or      ax, ax
        je      X_073EF
        dec     ax
        dec     ax
        je      br_073E6
        dec     ax
        dec     ax
        je      br_073E6
        dec     ax
        dec     ax
        je      br_073E6
        mov     byte ptr [B_8D43], 0
        jmp     br_073EA
        db      90h

br_073E6:
        dec     byte ptr [B_8D43]

br_073EA:
        nop
        push    cs
        call    timer_str_handler

X_073EF:
        pop     ds
        retf
        db      00h

channel_settings_down:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [B_8D43]
        cbw
        dec     ax
        dec     ax
        je      X_07416
        dec     ax
        dec     ax
        je      X_07416
        dec     ax
        dec     ax
        jl      br_0740D
        jo      br_0740D
        dec     ax
        jle     X_07416

br_0740D:
        inc     byte ptr [B_8D43]
        nop
        push    cs
        call    timer_str_handler

X_07416:
        pop     ds
        retf

channel_settings_left:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [B_8D43]
        cbw
        sub     ax, 3
        jl      L_07441
        jo      L_07441
        sub     ax, 3
        jle     L_07434
        dec     ax
        je      br_07438
        pop     ds
        retf
        db      90h

L_07434:
        dec     byte ptr [B_8D43]

br_07438:
        dec     byte ptr [B_8D43]
        nop
        push    cs
        call    timer_str_handler

L_07441:
        pop     ds
        retf
        db      00h

L_07444:
channel_settings_right:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [B_8D43]
        cbw
        dec     ax
        jl      br_0746B
        jo      br_0746B
        sub     ax, 4
        jle     L_0745E
        dec     ax
        je      br_07462
        pop     ds
        retf
        db      90h

L_0745E:
        inc     byte ptr [B_8D43]

br_07462:
        inc     byte ptr [B_8D43]
        nop
        push    cs
        call    timer_str_handler

br_0746B:
        pop     ds
        retf
        db      00h

; as pad_note_select, from a key word: the pad number in the low byte, its
; index in the bank in the high.
pad_note_select_5:
        enter   2, 0

L_07472:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     cx, ax
        or      cl, cl
        je      L_074B7
        mov     byte ptr [G_PAD_INDEX], ch
        callf   TEXT1_SEG:pad_bank_get
        mov     byte ptr [G_PAD_BANK], al
        mov     bl, al
        sub     bh, bh
        shl     bx, 4
        mov     al, byte ptr [G_PAD_INDEX]
        sub     ah, ah
        add     bx, ax
        les     si, [PTR_TRACK_DATA]
        mov     al, byte ptr es:[bx+si]
        mov     byte ptr [bp-1], al
        cbw
        sub     ax, 23h
        cmp     ax, 3fh
        ja      L_074B7
        mov     al, byte ptr [bp-1]
        mov     byte ptr [G_PAD_NOTE_BASE], al
        nop
        push    cs
        call    timer_str_handler

L_074B7:
        pop     ds
        pop     si
        leave
        retf
        db      00h

channel_settings_close:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [B_8D42]
        cbw
        sub     ax, 3
        jl      br_074D6
        jo      br_074D6
        dec     ax
        jle     br_074DE
        dec     ax
        jl      br_074D6
        dec     ax
        jle     br_074E6

br_074D6:
        nop
        push    cs
        call    mixer_stereo_page
        pop     ds
        retf
        db      90h

br_074DE:
        nop
        push    cs
        call    mixer_fxsend_page
        pop     ds
        retf
        db      90h

br_074E6:
        nop
        push    cs
        call    mixer_indiv_page
        pop     ds
        retf
        db      90h

far_074EE:
        push    di
        mov     word ptr [PTR_SAMPLE_BUF], P_6C7A
        mov     word ptr [PTR_SAMPLE_BUF+2], ds
        mov     bx, TBL_6CA2
        mov     di, 7fh
        mov     cx, di

loop_07501:
        lea     ax, [bx+0eh]
        mov     word ptr [bx], ax
        mov     word ptr [bx+2], ds
        add     bx, 36h
        dec     cx
        jne     loop_07501
        imul    bx, di, 36h
        sub     ax, ax
        mov     word ptr [bx+TBL_6CA4], ax
        mov     word ptr [bx+TBL_6CA2], ax
        mov     word ptr [PTR_SAMPLE_DATA], P_877A
        mov     word ptr [PTR_SAMPLE_DATA+2], ds
        mov     ax, P_87B0
        mov     word ptr [PTR_DMA_STATE], ax
        mov     word ptr [PTR_DMA_STATE+2], ds
        mov     word ptr [W_87A2], ax
        mov     word ptr [W_87A4], ds
        les     bx, [PTR_SAMPLE_DATA]
        sub     ax, ax
        mov     word ptr es:[bx+SND_PREV_SEG], ax
        mov     word ptr es:[bx+SND_PREV], ax
        les     bx, [PTR_DMA_STATE]
        mov     word ptr es:[bx+SND_NEXT_SEG], ax
        mov     word ptr es:[bx+SND_NEXT], ax
        mov     ax, word ptr [PTR_SAMPLE_DATA]
        mov     dx, word ptr [PTR_SAMPLE_DATA+2]
        les     bx, [PTR_DMA_STATE]
        mov     word ptr es:[bx+SND_PREV], ax
        mov     word ptr es:[bx+SND_PREV_SEG], dx
        pop     di
        retf

; takes the 36h-byte sample descriptor by value, fills the head of the
; PTR_SAMPLE_BUF free list with it, links it in and returns its far pointer.
sample_pool_add:
        enter   4, 0
        push    di
        push    si
        mov     ax, word ptr [PTR_SAMPLE_BUF+2]
        or      ax, word ptr [PTR_SAMPLE_BUF]
        jne     br_07578
        jmp     br_0761A

br_07578:
        les     bx, [PTR_SAMPLE_DATA]
        mov     ax, word ptr es:[bx+SND_NEXT]
        mov     dx, word ptr es:[bx+SND_NEXT_SEG]
        mov     word ptr [bp-4], ax
        push    ds
        mov     di, bx
        lea     si, [bp+6]
        mov     ax, ss
        mov     ds, ax
        mov     cx, 1bh
        rep movsw
        pop     ds
        mov     bx, word ptr [PTR_SAMPLE_DATA]
        mov     ax, word ptr [bp-4]
        mov     word ptr es:[bx+SND_NEXT], ax
        mov     word ptr es:[bx+SND_NEXT_SEG], dx
        les     bx, [PTR_SAMPLE_BUF]
        mov     word ptr [bp-4], bx
        mov     word ptr [bp-2], es
        mov     ax, word ptr es:[bx+SND_NEXT]
        mov     dx, word ptr es:[bx+SND_NEXT_SEG]
        mov     word ptr [PTR_SAMPLE_BUF], ax
        mov     word ptr [PTR_SAMPLE_BUF+2], dx
        mov     ax, word ptr [PTR_SAMPLE_DATA]
        mov     dx, word ptr [PTR_SAMPLE_DATA+2]
        mov     word ptr es:[bx+SND_NEXT], ax
        mov     word ptr es:[bx+SND_NEXT_SEG], dx
        sub     ax, ax
        mov     word ptr es:[bx+SND_PREV_SEG], ax
        mov     word ptr es:[bx+SND_PREV], ax
        les     bx, [PTR_SAMPLE_DATA]
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        mov     word ptr es:[bx+SND_PREV], ax
        mov     word ptr es:[bx+SND_PREV_SEG], dx
        mov     word ptr [PTR_SAMPLE_DATA], ax
        mov     word ptr [PTR_SAMPLE_DATA+2], dx
        mov     bx, ax
        mov     es, dx
        mov     byte ptr es:[bx], 0
        les     bx, [PTR_SAMPLE_DATA]
        sub     ax, ax
        mov     word ptr es:[bx+SND_LENGTH_HI], ax
        mov     word ptr es:[bx+SND_LENGTH], ax
        les     bx, [PTR_SAMPLE_DATA]
        mov     ax, word ptr es:[bx+SND_NEXT]
        mov     dx, word ptr es:[bx+SND_NEXT_SEG]
        pop     si
        pop     di
        leave
        retf    36h
        db      90h

br_0761A:
        xor     ax, ax
        cwd
        pop     si
        pop     di
        leave
        retf    36h
        db      00h
sample_validate_ptr:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+6]
        push    word ptr [bp+8]
        push    si
        nop
        push    cs
        call    sample_ptr_helper
        or      ax, ax
        je      br_07699
        mov     es, word ptr [bp+8]
        cmp     word ptr es:[si+SND_POOL_IDX], 82h
        jae     br_0764C
        push    word ptr es:[si+SND_POOL_IDX]

; ?
        callf   TEXT1_SEG:smem_free

br_0764C:
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[si+SND_NEXT]
        mov     dx, word ptr es:[si+SND_NEXT_SEG]
        les     bx, es:[si+SND_PREV]
        mov     word ptr es:[bx+SND_NEXT], ax
        mov     word ptr es:[bx+SND_NEXT_SEG], dx
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[si+SND_PREV]
        mov     dx, word ptr es:[si+SND_PREV_SEG]
        les     bx, es:[si+SND_NEXT]
        mov     word ptr es:[bx+SND_PREV], ax
        mov     word ptr es:[bx+SND_PREV_SEG], dx
        mov     ax, word ptr [PTR_SAMPLE_BUF]
        mov     dx, word ptr [PTR_SAMPLE_BUF+2]
        mov     es, word ptr [bp+8]
        mov     word ptr es:[si+SND_NEXT], ax
        mov     word ptr es:[si+SND_NEXT_SEG], dx
        mov     word ptr [PTR_SAMPLE_BUF], si
        mov     word ptr [PTR_SAMPLE_BUF+2], es
        nop
        push    cs
        call    smem_compact

br_07699:
        pop     si
        leave
        retf    4

sample_data_load_1:
        enter   4, 0
        push    si
        les     bx, [PTR_SAMPLE_DATA]
        mov     ax, word ptr es:[bx+SND_NEXT]
        mov     dx, word ptr es:[bx+SND_NEXT_SEG]
        mov     si, ax
        mov     word ptr [bp-2], dx
        cmp     ax, word ptr [PTR_DMA_STATE]
        jne     loop_076C0
        cmp     dx, word ptr [PTR_DMA_STATE+2]
        je      br_076F1

loop_076C0:
        mov     es, dx
        cmp     word ptr es:[si+SND_POOL_IDX], 82h
        jae     br_076D3
        push    word ptr es:[si+SND_POOL_IDX]
        callf   TEXT1_SEG:smem_free

br_076D3:
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+28h]
        mov     dx, word ptr es:[si+2ah]
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     ax, dx
        cmp     si, word ptr [PTR_DMA_STATE]
        jne     loop_076C0
        cmp     ax, word ptr [PTR_DMA_STATE+2]
        jne     loop_076C0

br_076F1:
        nop
        push    cs
        call    far_074EE
        pop     si
        leave
        retf
        db      00h
; for each pool entry sample_check_active accepts: smem_free its
; block, unlink it and push it back on the PTR_SAMPLE_BUF free list.

sample_delete_flagged:
        enter   8, 0
        push    di
        push    si
        les     bx, [PTR_SAMPLE_DATA]
        mov     ax, word ptr es:[bx+SND_NEXT]
        mov     dx, word ptr es:[bx+SND_NEXT_SEG]
        mov     si, ax
        mov     word ptr [bp-2], dx
        cmp     ax, word ptr [PTR_DMA_STATE]
        jne     loop_07720
        cmp     dx, word ptr [PTR_DMA_STATE+2]
        jne     loop_07720
        jmp     br_077CB

loop_07720:
        mov     es, dx
        mov     ax, word ptr es:[si+SND_PREV]
        mov     dx, word ptr es:[si+SND_PREV_SEG]
        mov     di, ax
        mov     word ptr [bp-6], dx
        push    es
        push    si
        nop
        push    cs
        call    sample_check_active
        or      ax, ax
        je      br_077A7
        push    word ptr [bp-2]
        push    si
        nop
        push    cs
        call    smem_proc_wrapper
        mov     es, word ptr [bp-2]
        cmp     word ptr es:[si+SND_POOL_IDX], 82h
        jae     br_07757
        push    word ptr es:[si+SND_POOL_IDX]
        callf   TEXT1_SEG:smem_free

br_07757:
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+SND_NEXT]
        mov     dx, word ptr es:[si+SND_NEXT_SEG]
        les     bx, es:[si+SND_PREV]
        mov     word ptr es:[bx+SND_NEXT], ax
        mov     word ptr es:[bx+SND_NEXT_SEG], dx
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+SND_PREV]
        mov     dx, word ptr es:[si+SND_PREV_SEG]
        les     bx, es:[si+SND_NEXT]
        mov     word ptr es:[bx+SND_PREV], ax
        mov     word ptr es:[bx+SND_PREV_SEG], dx
        mov     ax, word ptr [PTR_SAMPLE_BUF]
        mov     dx, word ptr [PTR_SAMPLE_BUF+2]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+SND_NEXT], ax
        mov     word ptr es:[si+SND_NEXT_SEG], dx
        mov     word ptr [PTR_SAMPLE_BUF], si
        mov     word ptr [PTR_SAMPLE_BUF+2], es
        mov     ax, word ptr [bp-6]
        mov     si, di
        mov     word ptr [bp-2], ax
br_077A7:
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+SND_NEXT]
        mov     dx, word ptr es:[si+SND_NEXT_SEG]
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     ax, dx
        cmp     si, word ptr [PTR_DMA_STATE]
        je      br_077C2
        jmp     loop_07720

br_077C2:
        cmp     ax, word ptr [PTR_DMA_STATE+2]
        je      br_077CB
        jmp     loop_07720

br_077CB:
        pop     si
        pop     di
        leave
        retf
        db      00h
; ? for each flagged pool entry: name plus a suffix into
; int40_disk_wrapper, then smem_block_skip into the block base.

sample_addr_from_disk:
        enter   1ah, 0
        push    di
        push    si
        les     bx, [PTR_SAMPLE_DATA]
        mov     ax, word ptr es:[bx+SND_NEXT]
        mov     dx, word ptr es:[bx+SND_NEXT_SEG]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        cmp     ax, word ptr [PTR_DMA_STATE]
        jne     loop_077F7
        cmp     dx, word ptr [PTR_DMA_STATE+2]
        jne     loop_077F7
        jmp     br_078AD

loop_077F7:
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    sample_check_active
        or      ax, ax
        je      br_07885
        push    ds
        lea     si, [bp-1ah]
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
        push    ds
        mov     di, STR_EXT_SND
        lea     si, [bp-1ah]
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
        lea     ax, [bp-1ah]
        push    ss
        push    ax
        nop
        push    cs
        call    int40_disk_wrapper
        push    dx
        push    ax
        nop
        push    cs
        call    smem_block_skip
        les     bx, [bp-4]
        mov     bx, word ptr es:[bx+SND_POOL_IDX]
        mov     cx, bx
        shl     bx, 2
        add     bx, cx
        add     bx, bx
        mov     word ptr [bx+SMEM_POOL], ax
        mov     word ptr [bx+SMEM_POOL_BASE_HI], dx

br_07885:
        les     bx, [bp-4]
        mov     ax, word ptr es:[bx+SND_NEXT]
        mov     dx, word ptr es:[bx+SND_NEXT_SEG]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     ax, word ptr [PTR_DMA_STATE]
        mov     dx, word ptr [PTR_DMA_STATE+2]
        cmp     word ptr [bp-4], ax
        je      br_078A5
        jmp     loop_077F7

br_078A5:
        cmp     word ptr [bp-2], dx
        je      br_078AD
        jmp     loop_077F7

br_078AD:
        pop     si
        pop     di
        leave
        retf
        db      00h
; zeroes a 36h sample descriptor and defaults +11h to 64h, +25h to 1,
; +26h to 0AC44h and +30h to 7FFFh.
sample_desc_init:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     si, word ptr [bp+6]
        xor     ax, ax
        mov     dx, word ptr [bp+8]
        mov     cx, 1bh
        mov     di, si
        mov     es, dx
        rep stosw

        mov     byte ptr es:[si+SND_LEVEL], 64h
        mov     word ptr es:[si+SND_POOL_IDX], 7fffh
        mov     byte ptr es:[si+SND_FIELD_25], 1
        mov     word ptr es:[si+SND_RATE], 0ac44h
        pop     si
        pop     di
        leave
        retf    4

far_078E4:
        les     bx, [PTR_SAMPLE_DATA]
        mov     ax, word ptr es:[bx+SND_NEXT]
        mov     dx, word ptr es:[bx+SND_NEXT_SEG]
        cmp     ax, word ptr [PTR_DMA_STATE]
        jne     br_078FF
        cmp     dx, word ptr [PTR_DMA_STATE+2]
        jne     br_078FF
        xor     ax, ax
        cwd

br_078FF:
        retf

far_07900:
        push    si
        xor     cx, cx
        les     si, [PTR_SAMPLE_DATA]
        mov     ax, word ptr es:[si+SND_NEXT]
        mov     dx, word ptr es:[si+SND_NEXT_SEG]
        mov     bx, ax
        cmp     ax, word ptr [PTR_DMA_STATE]
        jne     loop_0791D
        cmp     dx, word ptr [PTR_DMA_STATE+2]
        je      br_07938

loop_0791D:
        inc     cx
        mov     es, dx
        mov     ax, word ptr es:[bx+SND_NEXT]
        mov     dx, word ptr es:[bx+SND_NEXT_SEG]
        mov     bx, ax
        mov     ax, dx
        cmp     bx, word ptr [PTR_DMA_STATE]
        jne     loop_0791D
        cmp     ax, word ptr [PTR_DMA_STATE+2]
        jne     loop_0791D

br_07938:
        mov     ax, cx
        pop     si
        retf

sample_caller_setup:
        enter   4, 0
        xor     cx, cx
        mov     ax, word ptr [PTR_SAMPLE_BUF]
        mov     dx, word ptr [PTR_SAMPLE_BUF+2]
        mov     bx, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_07967

loop_07952:
        inc     cx
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[bx+SND_NEXT]
        mov     dx, word ptr es:[bx+SND_NEXT_SEG]
        mov     bx, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     loop_07952

br_07967:
        mov     ax, cx
        leave
        retf
        db      00h

; ?
sample_ptr_access:
        enter   4, 0
        push    di
        push    si
        les     bx, [PTR_SAMPLE_DATA]
        mov     ax, word ptr es:[bx+SND_NEXT]
        mov     dx, word ptr es:[bx+SND_NEXT_SEG]
        mov     si, ax
        mov     word ptr [bp-2], dx
        cmp     ax, word ptr [PTR_DMA_STATE]
        jne     br_0798F
        cmp     dx, word ptr [PTR_DMA_STATE+2]
        je      br_079D0

br_0798F:
        mov     di, word ptr [bp+6]

loop_07992:
        push    word ptr [bp+8]
        push    di
        push    dx
        push    si
        callf   TEXT1_SEG:__fstricmp
        add     sp, 8
        or      ax, ax
        je      br_079C4
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+28h]
        mov     dx, word ptr es:[si+2ah]
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     ax, dx
        cmp     si, word ptr [PTR_DMA_STATE]
        jne     loop_07992
        cmp     ax, word ptr [PTR_DMA_STATE+2]
        jne     loop_07992
        jmp     br_079D0
br_079C4:
        mov     ax, si
        mov     dx, word ptr [bp-2]
        pop     si
        pop     di
        leave
        retf    4
        db      90h
br_079D0:
        xor     ax, ax
        cwd
        pop     si
        pop     di
        leave
        retf    4
        db      00h

; ?
sample_data_load_2:
        enter   4, 0
        push    di
        push    si
        les     bx, [PTR_SAMPLE_DATA]
        mov     ax, word ptr es:[bx+SND_NEXT]
        mov     dx, word ptr es:[bx+SND_NEXT_SEG]
        mov     si, ax
        mov     word ptr [bp-2], dx
        cmp     ax, word ptr [PTR_DMA_STATE]
        jne     L_079FD
        cmp     dx, word ptr [PTR_DMA_STATE+2]
        je      br_07A4A

L_079FD:
        mov     di, word ptr [bp+6]

loop_07A00:
        mov     ax, dx
        cmp     si, di
        jne     br_07A0B
        cmp     ax, word ptr [bp+8]
        je      br_07A1D

br_07A0B:
        push    word ptr [bp+8]
        push    di
        push    ax
        push    si
        callf   TEXT1_SEG:__fstricmp
        add     sp, 8
        or      ax, ax
        je      br_07A3E
br_07A1D:
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+28h]
        mov     dx, word ptr es:[si+2ah]
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     ax, dx
        cmp     si, word ptr [PTR_DMA_STATE]
        jne     loop_07A00
        cmp     ax, word ptr [PTR_DMA_STATE+2]
        jne     loop_07A00
        jmp     br_07A4A
        db      90h
br_07A3E:
        mov     ax, si
        mov     dx, word ptr [bp-2]
        pop     si
        pop     di
        leave
        retf    4
        db      90h
br_07A4A:
        xor     ax, ax
        cwd
        pop     si
        pop     di
        leave
        retf    4
        db      00h
sample_ptr_helper:
        enter   4, 0
        push    si
        les     si, [PTR_SAMPLE_DATA]
        mov     ax, word ptr es:[si+SND_NEXT]
        mov     dx, word ptr es:[si+SND_NEXT_SEG]
        mov     bx, ax
        cmp     ax, word ptr [PTR_DMA_STATE]

        jne     L_07A73
        cmp     dx, word ptr [PTR_DMA_STATE+2]
        je      br_t2_07AA6

L_07A73:
        mov     cx, word ptr [bp+6]

loop_07A76:
        mov     ax, dx
        cmp     bx, cx
        jne     br_07A81
        cmp     ax, word ptr [bp+8]
        je      br_07A9E

br_07A81:
        mov     es, ax
        mov     ax, word ptr es:[bx+SND_NEXT]
        mov     dx, word ptr es:[bx+SND_NEXT_SEG]
        mov     bx, ax
        mov     ax, dx
        cmp     bx, word ptr [PTR_DMA_STATE]
        jne     loop_07A76
        cmp     ax, word ptr [PTR_DMA_STATE+2]
        jne     loop_07A76
        jmp     br_t2_07AA6
        db      90h

br_07A9E:
        mov     ax, 1
        pop     si
        leave
        retf    4

br_t2_07AA6:
        xor     ax, ax
        pop     si
        leave
        retf    4
        db      00h

sample_check_active:
        push    bp
        mov     bp, sp
        push    si
        mov     bx, word ptr [bp+6]
        mov     ax, word ptr [bp+8]
        or      ax, bx
        je      br_07ADC
        mov     es, word ptr [bp+8]
        mov     si, word ptr es:[bx+SND_POOL_IDX]
        mov     ax, si
        shl     si, 2
        add     si, ax
        add     si, si
        test    word ptr [si+SMEM_POOL_BASE_HI], 100h
        je      br_07ADC
        mov     ax, 1
        pop     si
        leave
        retf    4

br_07ADC:
        xor     ax, ax
        pop     si
        leave
        retf    4
        db      00h

; ?
sample_data_load_3:
        enter   0ch, 0
        push    di
        push    si
        les     bx, [PTR_SAMPLE_DATA]
        mov     ax, word ptr es:[bx+SND_NEXT]
        mov     dx, word ptr es:[bx+SND_NEXT_SEG]
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        cmp     ax, word ptr [PTR_DMA_STATE]
        jne     br_07B0B
        cmp     dx, word ptr [PTR_DMA_STATE+2]
        jne     br_07B0B
        jmp     L_07BF4

br_07B0B:
        les     bx, [bp-0ch]
        mov     ax, word ptr es:[bx+SND_NEXT]
        mov     dx, word ptr es:[bx+SND_NEXT_SEG]
        mov     si, ax
        mov     word ptr [bp-2], dx
        cmp     ax, word ptr [PTR_DMA_STATE]
        jne     loop_07B2A
        cmp     dx, word ptr [PTR_DMA_STATE+2]
        jne     loop_07B2A
        jmp     L_07BF4

loop_07B2A:
        mov     es, dx
        mov     ax, word ptr es:[si+SND_NEXT]
        mov     dx, word ptr es:[si+SND_NEXT_SEG]
        les     bx, es:[si+SND_PREV]
        mov     word ptr es:[bx+SND_NEXT], ax
        mov     word ptr es:[bx+SND_NEXT_SEG], dx
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+SND_PREV]
        mov     dx, word ptr es:[si+SND_PREV_SEG]
        les     bx, es:[si+SND_NEXT]
        mov     word ptr es:[bx+SND_PREV], ax
        mov     word ptr es:[bx+SND_PREV_SEG], dx
        push    word ptr [bp-2]
        push    si
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+SND_PREV]
        mov     dx, word ptr es:[si+SND_PREV_SEG]
        mov     di, ax
        mov     word ptr [bp-6], dx
        push    dx
        push    ax
        callf   [bp+6]
        or      ax, ax
        jge     br_07B91
T2_loop_07B74:
        push    word ptr [bp-2]
        push    si
        mov     es, word ptr [bp-6]
        mov     ax, word ptr es:[di+2ch]
        mov     dx, word ptr es:[di+2eh]
        mov     di, ax
        mov     word ptr [bp-6], dx
        push    dx
        push    ax
        callf   [bp+6]
        or      ax, ax
        jl      T2_loop_07B74
br_07B91:
        mov     ax, word ptr [bp-6]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+SND_PREV], di
        mov     word ptr es:[si+SND_PREV_SEG], ax
        mov     es, ax
        mov     ax, word ptr es:[di+28h]
        mov     dx, word ptr es:[di+2ah]
        mov     cx, es
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+SND_NEXT], ax
        mov     word ptr es:[si+SND_NEXT_SEG], dx
        mov     es, cx
        mov     ax, word ptr [bp-2]
        mov     word ptr es:[di+28h], si
        mov     word ptr es:[di+2ah], ax
        mov     es, ax
        les     bx, es:[si+SND_NEXT]

        mov     word ptr es:[bx+SND_PREV], si
        mov     word ptr es:[bx+SND_PREV_SEG], ax
        mov     es, ax
        mov     ax, word ptr es:[si+SND_NEXT]
        mov     dx, word ptr es:[si+SND_NEXT_SEG]
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     ax, dx
        cmp     si, word ptr [PTR_DMA_STATE]
        je      br_07BEB
        jmp     loop_07B2A

br_07BEB:
        cmp     ax, word ptr [PTR_DMA_STATE+2]
        je      L_07BF4
        jmp     loop_07B2A

L_07BF4:
        pop     si
        pop     di
        leave
        retf    4

fdc_port_90_access:
        push    bp
        mov     bp, sp
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        callf   TEXT1_SEG:__fstricmp
        leave
        retf    8
X_07C12:
        push    TEXT2_SEG
        push    fdc_port_90_access
        nop
        push    cs
        call    sample_data_load_3
        retf

; ? misnomer: copies an 8.5-word template into the caller's buffer.
timer_fdc_sync:
        enter   4, 0
        push    di
        push    si
        mov     si, STR_DEFAULT_SOUND_NAME
        les     di, [bp+6]
        mov     cx, 8
        rep movsw
        movsb
        mov     si, word ptr [bp+6]

tgt_07C33:
        push    64h
        mov     al, byte ptr [B_2D7F]
        sub     ah, ah
        push    ax
        callf   TEXT1_SEG:_div
        add     sp, 4
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     al, byte ptr [bp-4]
        add     al, 30h
        mov     es, word ptr [bp+8]
        mov     byte ptr es:[si+5], al
        push    0ah
        push    word ptr [bp-2]
        callf   TEXT1_SEG:_div
        add     sp, 4
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     al, byte ptr [bp-4]
        add     al, 30h
        mov     es, word ptr [bp+8]
        mov     byte ptr es:[si+6], al
        mov     al, byte ptr [bp-2]
        add     al, 30h
        mov     byte ptr es:[si+7], al
        push    es
        push    si
        nop
        push    cs
        call    sample_ptr_access
        or      dx, ax
        je      tgt_07C8E
        inc     byte ptr [B_2D7F]
        jmp     tgt_07C33
tgt_07C8E:
        pop     si
        pop     di
        leave
        retf    4
sample_ptr_accessor:
        enter   38h, 0
        push    di
        push    si
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    sample_ptr_access
        or      dx, ax
        je      T2_br_07CB8
        mov     word ptr [G_ERRNO], ERR_NAME_IN_USE

loop_07CAF:
        xor     ax, ax
        cwd
        pop     si
        pop     di
        leave
        retf    8

T2_br_07CB8:
        nop
        push    cs
        call    sample_caller_setup
        or      ax, ax
        jne     br_07CCA
        mov     word ptr [G_ERRNO], ERR_SOUND_DIR_FULL
        jmp     loop_07CAF
        db      90h

br_07CCA:
        les     bx, [bp+6]
        mov     bx, word ptr es:[bx+SND_POOL_IDX]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        push    word ptr [bx+SMEM_POOL_LEN_HI]
        push    word ptr [bx+SMEM_POOL_LEN]
        callf   TEXT1_SEG:smem_alloc
        mov     word ptr [bp-2], ax
        inc     ax
        jne     br_t2_07CF6
        mov     word ptr [G_ERRNO], ERR_NO_MEMORY
        jmp     loop_07CAF
        db      90h

br_t2_07CF6:
        les     bx, [bp+6]
        mov     si, word ptr es:[bx+SND_POOL_IDX]
        mov     ax, si
        shl     si, 2
        add     si, ax
        add     si, si
        push    word ptr [si+SMEM_POOL_BASE_HI]
        push    word ptr [si+SMEM_POOL]
        mov     di, word ptr [bp-2]
        mov     ax, di
        shl     di, 2
        add     di, ax
        add     di, di
        push    word ptr [di+SMEM_POOL_BASE_HI]
        push    word ptr [di+SMEM_POOL]
        push    word ptr [si+SMEM_POOL_LEN_HI]
        push    word ptr [si+SMEM_POOL_LEN]
        nop
        push    cs
        call    smem_copy_buffered
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        push    ds
        lea     di, [bp-38h]
        mov     si, ax
        push    ss
        pop     es
        mov     ds, dx
        mov     cx, 1bh
        rep movsw
        pop     ds
        push    ds
        lea     si, [bp-38h]
        mov     cx, ss
        mov     ds, cx
        les     di, [bp+0ah]
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
        mov     ax, word ptr [bp-2]
        mov     word ptr [bp-8], ax
        sub     sp, 36h
        push    ds
        lea     si, [bp-38h]
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
        call    sample_pool_add
        pop     si
        pop     di
        leave
        retf    8
        db      90h

X_07D92:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     byte ptr [G_SAMPLE_MODE], 1
        jne     L_07DB0
        push    0
        push    0
        callf   TEXT1_SEG:callback_set_main
        add     sp, 4
        mov     byte ptr [G_SAMPLE_MODE], 0

L_07DB0:
        pop     ds
        retf

tgt_07DB2:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    TBL_WINKEYS_03030
        callf   TEXT1_SEG:win_keys_merge
        pop     ds
        retf
        db      90h

sample_calc_offset:
        enter   0eh, 0
        push    si
        mov     si, word ptr [bp+8]
        mov     ax, word ptr [bp+0ah]
        or      ax, si
        je      br_07E2A
        if      FW_VERSION = 172
L_07DD4                         equ     $+1
        endif
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[si+20h]
        mov     dx, word ptr es:[si+22h]
        mov     word ptr [bp-2], dx
        mov     cl, byte ptr es:[si+25h]
        mov     byte ptr [bp-5], cl
        mov     bx, word ptr [bp+6]
        add     bx, bx
        mov     cx, ax
        mov     ax, word ptr [bx+TBL_PITCH_RATIO]
        mov     bx, dx
        cwd
        or      bx, cx
        je      br_07E2A
        push    word ptr [bp-2]
        push    cx
        push    0
        push    193ch
        push    dx
        push    ax
        mov     al, byte ptr [bp-5]
        cbw
        cwd
        push    dx
        if      FW_VERSION = 150
L_08421:
        endif
        push    ax
        callf   TEXT1_SEG:__aFlmul
        push    dx
        push    ax
        callf   TEXT1_SEG:__aFlmul
        push    dx
        push    ax
        callf   TEXT1_SEG:__aFldiv
        or      dx, dx
        jg      br_07E2A
L_15545:
        jl      br_07E2C
        cmp     ax, 2710h
        jb      br_07E2C

br_07E2A:
        xor     ax, ax

br_07E2C:
        pop     si
        leave
        retf    6
        db      00h
; ? six-way jump table on a mode byte; each arm loads a 32-bit pair from the
; zone bounds or PTR_TRACK_DATA and calls out.

edit_range_select:
        enter   8, 0
        push    ds
L_15559:
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     ax, word ptr [SND_CURRENT+2]
        or      ax, word ptr [SND_CURRENT]
        jne     br_07E48
        jmp     X_07F11

br_07E48:
        mov     ax, word ptr [W_3066]
        or      ax, word ptr [W_3064]
        je      br_07E54
        jmp     X_07F11

br_07E54:
        mov     al, byte ptr [PLAY_X_MODE]
        cbw
        cmp     ax, 5
        jbe     X_07E60
        jmp     X_07F11

X_07E60:
        add     ax, ax
        xchg    bx, ax
        jmp     word ptr cs:[bx+X_07E68]

X_07E68:
        dw      X_07E74, X_07E7E, X_07E94, X_07EA6
        dw      X_07EBA, X_07ED0

X_07E74:
        sub     ax, ax
        mov     word ptr [bp-2], ax
        mov     word ptr [bp-4], ax
        jmp     SHORT L_07EB3

X_07E7E:
        mov     ax, word ptr [G_ZONE_START]
        mov     dx, word ptr [G_ZONE_START_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     ax, word ptr [G_ZONE_END]
        mov     dx, word ptr [ZONE_END_HI]
        jmp     SHORT X_07EEA

X_07E94:
        sub     ax, ax
        mov     word ptr [bp-2], ax
        mov     word ptr [bp-4], ax
        mov     ax, word ptr [G_ZONE_START]
        if      FW_VERSION = 150
L_155C2                         equ     $+1
        endif
        mov     dx, word ptr [G_ZONE_START_HI]
        jmp     SHORT X_07EEA
        db      90h

X_07EA6:
        mov     ax, word ptr [G_ZONE_END]
        mov     dx, word ptr [ZONE_END_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx

L_07EB3:
        les     bx, [SND_CURRENT]
        jmp     SHORT L_07EE2
        db      90h

X_07EBA:
        sub     ax, ax
        mov     word ptr [bp-2], ax
        mov     word ptr [bp-4], ax
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_START]
        mov     dx, word ptr es:[bx+SND_START_HI]
        jmp     SHORT X_07EEA

X_07ED0:
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_END]
        mov     dx, word ptr es:[bx+SND_END_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx

L_07EE2:
        mov     ax, word ptr es:[bx+1ch]
        mov     dx, word ptr es:[bx+1eh]

X_07EEA:
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     ax, word ptr [SND_CURRENT]
        mov     dx, word ptr [SND_CURRENT+2]
        mov     word ptr [W_3064], ax
        mov     word ptr [W_3066], dx
        push    dx
        push    ax
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        nop
        push    cs
        call    voice_start_sample

X_07F11:
        pop     ds
        leave
        retf

X_07F14:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    word ptr [W_3066]
        push    word ptr [W_3064]
        nop
        push    cs
        call    midi_note_io
        sub     ax, ax
        mov     word ptr [W_3066], ax
        mov     word ptr [W_3064], ax
        pop     ds
        retf
        db      00h
mode_dispatch_index:
        push    bp
        mov     bp, sp
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        mov     al, byte ptr [PLAY_X_MODE]
        cbw
        mov     cx, ax
        shl     ax, 3
        add     ax, cx
        add     ax, TBL_EDIT_RANGE_LABELS
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        leave
        retf    4
voice_trigger_caller:
        push    bp
        mov     bp, sp
        mov     cx, word ptr [bp+6]
        mov     ax, word ptr [bp+8]
        or      ax, cx
        je      br_07F6B
        mov     ax, word ptr [bp+8]
        push    ax
        push    cx
        nop
        push    cs
        call    install_handler_15

br_07F6B:
        push    ds
        push    PLAY_X_MODE
        push    5
        mov     al, byte ptr [bp+0ch]
        push    ax
        mov     al, byte ptr [bp+0ah]
        push    ax
        push    9
        push    0
        push    0
        nop
        push    cs
        call    voice_trigger_full
        leave
        retf    8
; optional install_handler_15, then the 14-argument field-engine call
; (value pointer, thunk, 32-bit min and max).
ui_field_edit:
        push    bp
        mov     bp, sp
        mov     cx, word ptr [bp+6]
        mov     ax, word ptr [bp+8]
        or      ax, cx
        je      X_07F9F
        mov     ax, word ptr [bp+8]
        push    ax
        push    cx
        nop
        push    cs
        call    install_handler_15

X_07F9F:
        push    word ptr [bp+1ch]
        push    word ptr [bp+1ah]
        push    word ptr [bp+14h]
        push    word ptr [bp+12h]
        push    word ptr [bp+10h]
        push    word ptr [bp+0eh]
        push    8
        mov     al, byte ptr [bp+18h]
        push    ax
        mov     al, byte ptr [bp+16h]
        push    ax
        push    0
        push    0
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        callf   TEXT1_SEG:field_register
        leave
        retf    18h

snd_window_refresh_key:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    voice_release_all
        push    1
        nop
        push    cs
        call    int44_wrapper
        pop     ds
        retf

snd_window_pad_key:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        or      al, al
        jne     br_08000
        les     bx, [SND_CURRENT]
        cmp     byte ptr es:[bx+SND_LOOPON], al
        je      br_0800D
        push    es
        push    bx
        nop
        push    cs
        call    voice_release_all_if
        pop     ds
        retf
        db      90h

br_08000:
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    lcd_set_cursor

br_0800D:
        pop     ds
        retf
        db      00h

far_08010:
        push    ds
        push    P_30CC
        callf   TEXT1_SEG:disp_list_run
        push    18h
        nop
        push    cs
        call    ui_row_request
        retf
        db      00h

cmd_exec_caller:
        enter   2, 0
        push    di
        push    si
        mov     ax, word ptr [SND_CURRENT+2]
        or      ax, word ptr [SND_CURRENT]
        jne     br_08034
        jmp     br_080C6

br_08034:
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_LENGTH_HI]
        or      ax, word ptr es:[bx+SND_LENGTH]
        jne     br_08045
        jmp     br_080C6

br_08045:
        push    word ptr es:[bx+SND_LENGTH_HI]
        push    word ptr es:[bx+SND_LENGTH]
        push    0
        push    0f5h
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        callf   TEXT1_SEG:__aFlmul
        push    dx
        push    ax
        callf   TEXT1_SEG:__aFldiv
        mov     di, ax
        les     bx, [SND_CURRENT]
        push    word ptr es:[bx+SND_LENGTH_HI]
        push    word ptr es:[bx+SND_LENGTH]
        push    0
        push    0f5h
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        mov     word ptr [bp-2], ax
        callf   TEXT1_SEG:__aFlmul
        push    dx
        push    ax
        callf   TEXT1_SEG:__aFldiv
        sub     ax, word ptr [bp-2]
        mov     si, ax
        or      ax, ax
        jne     br_08098
        mov     si, 1
br_08098:
        push    2
        nop
        push    cs
        call    cmd_exec_0E_wrapper
        push    13h
        push    1
        push    15h
        push    0f5h
        push    1bh
        nop
        push    cs
        call    cmd_build_params
        push    12h
        lea     ax, [di+1]
        push    ax
        push    15h
        push    si
        push    1bh
        nop
        push    cs
        call    cmd_build_params
        push    0
        nop
        push    cs
        call    cmd_exec_0E_wrapper

br_080C6:
        pop     si
        pop     di
        leave
        retf    8
voice_buffer_init:
        enter   8, 0
        push    di
        push    si
        push    10h
        nop
        push    cs
        call    voice_buf_helper_1
        xor     ax, ax
        mov     cx, 1f0h
        mov     di, G_WAVE_VALID
        push    ds
        pop     es
        rep stosw
        mov     ax, word ptr [bp+8]
        or      ax, word ptr [bp+6]
        jne     br_080F0
        jmp     br_081FC

br_080F0:
        les     bx, [bp+6]
        mov     ax, word ptr es:[bx+SND_LENGTH_HI]
        or      ax, word ptr es:[bx+SND_LENGTH]
        jne     br_08100
        jmp     br_081FC

br_08100:
        mov     si, word ptr es:[bx+SND_POOL_IDX]
        mov     ax, si
        shl     si, 2
        add     si, ax
        add     si, si
        mov     ax, word ptr [si+SMEM_POOL]
        mov     dx, word ptr [si+SMEM_POOL_BASE_HI]
        mov     word ptr [G_WAVE_SMEM_START], ax
        mov     word ptr [G_WAVE_SMEM_START_HI], dx
        cmp     byte ptr es:[bx+SND_STEREO], 0
        je      br_08150
        cmp     byte ptr [SND_EDIT_VIEW], 0
        je      br_08150
        push    0
        push    2
        mov     bx, word ptr es:[bx+SND_POOL_IDX]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        push    word ptr [bx+SMEM_POOL_LEN_HI]
        push    word ptr [bx+SMEM_POOL_LEN]
        callf   TEXT1_SEG:__aFldiv
        add     word ptr [G_WAVE_SMEM_START], ax
        adc     word ptr [G_WAVE_SMEM_START_HI], dx

br_08150:
        les     bx, [bp+6]
        mov     ax, word ptr es:[bx+SND_LENGTH]
        mov     dx, word ptr es:[bx+SND_LENGTH_HI]
        add     ax, word ptr [G_WAVE_SMEM_START]
        adc     dx, word ptr [G_WAVE_SMEM_START_HI]
        mov     word ptr [G_WAVE_SMEM_END], ax
        mov     word ptr [G_WAVE_SMEM_END_HI], dx
        push    0
        push    0f5h
        push    word ptr es:[bx+SND_LENGTH_HI]
        push    word ptr es:[bx+SND_LENGTH]
        callf   TEXT1_SEG:__aFldiv
        or      dx, ax
        jne     L_081F6
        push    word ptr [G_WAVE_SMEM_START_HI]
        push    word ptr [G_WAVE_SMEM_START]
        mov     ax, BUF_XFER
        push    ds
        push    ax
        push    0f5h
        push    0
        push    0f5h
        les     bx, [bp+6]
        mov     ax, word ptr es:[bx+SND_LENGTH]
        mov     dx, word ptr es:[bx+SND_LENGTH_HI]
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
        callf   TEXT1_SEG:__aFldiv
        push    ax
        nop
        push    cs
        call    smem_dma_copy
        mov     di, BUF_XFER
        mov     si, TBL_WAVE_POS_PEAK
        mov     word ptr [bp-4], 0f5h
        mov     cx, word ptr [bp-4]
loop_081D1:
        xor     ax, ax
        mov     word ptr [si], ax
        mov     word ptr [si-2], ax
        cmp     word ptr [di], ax
        jl      br_081E2
        mov     ax, word ptr [di]
        mov     word ptr [si], ax
        jmp     br_081E7

br_081E2:
        mov     ax, word ptr [di]
        mov     word ptr [si-2], ax

br_081E7:
        add     di, 2
        add     si, 4
        dec     cx
        jne     loop_081D1
        mov     word ptr [G_WAVE_COLS_DONE], 0f5h

L_081F6:
        mov     word ptr [G_WAVE_VALID], 1

br_081FC:
        push    10h
        nop
        push    cs
        call    voice_buf_helper_2
        pop     si
        pop     di
        leave
        retf    4
        db      00h

cmd_ratio_calc:
        enter   4, 0
        push    di
        push    si
        push    1
        nop
        push    cs
        call    cmd_exec_0E_wrapper
        push    13h
        push    1
        push    15h
        push    0f5h
        push    1bh
        nop
        push    cs
        call    cmd_build_params
        cmp     word ptr [G_WAVE_VALID], 0
        je      br_08273
        xor     si, si
        mov     di, TBL_WAVE_NEG_PEAK
loop_08233:
        mov     ax, word ptr [di+2]
        mov     cx, 97bh
        cwd
        idiv    cx
        mov     word ptr [bp-4], ax
        mov     ax, word ptr [di]
        cwd
        idiv    cx
        mov     word ptr [bp-2], ax
        or      ax, ax
        je      br_0824E
        dec     word ptr [bp-2]
br_0824E:
        lea     ax, [si+1]
        push    ax
        mov     cx, 22h
        sub     cx, word ptr [bp-4]
        push    cx
        mov     cx, word ptr [bp-4]
        sub     cx, word ptr [bp-2]
        push    cx
        nop
        push    cs
        call    cmd_dispatch_0E
        add     di, 4
        lea     ax, [si+1]
        mov     si, ax
        cmp     si, 0f5h
        jl      loop_08233

br_08273:
        push    0
        nop
        push    cs
        call    cmd_exec_0E_wrapper
        pop     si
        pop     di
        leave
        retf
words_minmax:
        push    bp
        mov     bp, sp
        push    di
        push    si
        les     bx, [bp+0ah]
        mov     si, word ptr es:[bx]
        les     bx, [bp+6]
        mov     di, word ptr es:[bx]
        les     bx, [bp+10h]
        mov     cx, word ptr [bp+0eh]

tgt_08295:
        mov     ax, word ptr es:[bx]
        cmp     ax, di
        jle     br_082A0
        mov     di, ax
        jmp     br_082A6

br_082A0:
        cmp     ax, si
        jge     br_082A6
        mov     si, ax

br_082A6:
        add     bx, 2
        loop    tgt_08295
        les     bx, [bp+0ah]
        mov     word ptr es:[bx], si
        les     bx, [bp+6]
        mov     word ptr es:[bx], di
        pop     si
        pop     di
        leave
        retf    0eh
        db      00h
string_op_setup:
        enter   8, 0
        push    di
        push    si
        mov     ax, 0f5h
        sub     ax, word ptr [G_WAVE_COLS_DONE]
        cwd
        push    dx
        push    ax
        mov     ax, word ptr [G_WAVE_SMEM_END]
        mov     dx, word ptr [G_WAVE_SMEM_END_HI]
        sub     ax, word ptr [G_WAVE_SMEM_START]
        sbb     dx, word ptr [G_WAVE_SMEM_START_HI]
        push    dx
        push    ax
        callf   TEXT1_SEG:_ldiv
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
        mov     ax, 0f5h
        sub     ax, word ptr [G_WAVE_COLS_DONE]
        cwd
        sub     ax, dx
        sar     ax, 1
        cwd
        cmp     dx, word ptr [bp-2]
        jg      br_08317
        jl      br_0830F
        cmp     ax, word ptr [bp-4]
        jae     br_08317

br_0830F:
        add     word ptr [bp-8], 1
        adc     word ptr [bp-6], 0

br_08317:
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        pop     si
        pop     di
        leave
        retf
        db      00h

string_func_handler:
        enter   4, 0
        push    si
        cmp     word ptr [G_WAVE_COLS_DONE], 0f5h
        jl      br_08332
        jmp     br_083B9

br_08332:
        mov     bx, word ptr [G_WAVE_COLS_DONE]
        shl     bx, 2
        mov     word ptr [bx+TBL_WAVE_POS_PEAK], 0
        mov     bx, word ptr [G_WAVE_COLS_DONE]
        shl     bx, 2
        mov     word ptr [bx+TBL_WAVE_NEG_PEAK], 0
        nop
        push    cs
        call    string_op_setup
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx

loop_08357:
        push    word ptr [G_WAVE_SMEM_START_HI]
        push    word ptr [G_WAVE_SMEM_START]
        push    ds
        push    BUF_XFER
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        or      dx, dx
        jl      br_08377
        jg      L_08374
        cmp     ax, 400h
        jbe     br_08377

L_08374:
        mov     ax, 400h

br_08377:
        mov     si, ax
        push    ax
        nop
        push    cs
        call    smem_read_words
        mov     ax, si
        cwd
        add     word ptr [G_WAVE_SMEM_START], ax
        adc     word ptr [G_WAVE_SMEM_START_HI], dx
        sub     word ptr [bp-4], si
        sbb     word ptr [bp-2], dx
        push    ds
        push    BUF_XFER
        push    ax
        mov     ax, word ptr [G_WAVE_COLS_DONE]
        shl     ax, 2
        mov     cx, ax
        add     ax, TBL_WAVE_NEG_PEAK
        push    ds
        push    ax
        add     cx, TBL_WAVE_POS_PEAK
        push    ds
        push    cx
        nop
        push    cs
        call    words_minmax
        mov     ax, word ptr [bp-2]
        or      ax, word ptr [bp-4]
        jne     loop_08357
        inc     word ptr [G_WAVE_COLS_DONE]
br_083B9:
        pop     si
        leave
        retf
sample_name_search:
        enter   4, 0
        push    si
        cmp     word ptr [G_WAVE_VALID], 0
        je      br_08419
        cmp     word ptr [G_WAVE_COLS_DONE], 0f5h
        jge     br_08419
        mov     ax, 0f5h
        sub     ax, word ptr [G_WAVE_COLS_DONE]
        cwd
        push    dx
        push    ax
        mov     ax, word ptr [G_WAVE_SMEM_END]
        mov     dx, word ptr [G_WAVE_SMEM_END_HI]
        sub     ax, word ptr [G_WAVE_SMEM_START]
        sbb     dx, word ptr [G_WAVE_SMEM_START_HI]
        push    dx
        push    ax
        callf   TEXT1_SEG:__aFldiv
        or      dx, dx
        jl      br_08400
        jg      br_083FB
        cmp     ax, 0f5h
        jb      br_08400

br_083FB:
        mov     si, 1
        jmp     br_0840D

br_08400:
        mov     si, 0f5h
        sub     si, ax
        jmp     br_0840D
        db      90h

loop_08408:
        nop
        push    cs
        call    string_func_handler

br_0840D:
        mov     ax, si
        dec     si
        or      ax, ax
        jne     loop_08408
        nop
        push    cs
        call    cmd_far_stub2

br_08419:
        pop     si
        leave
        retf

; ?
cmd_write_caller:
        enter   14h, 0
        push    di
        if      FW_VERSION = 172

L_08421:
        endif
        push    si
        push    ds
        push    P_30FC
        callf   TEXT1_SEG:disp_list_run
        push    4ch
        push    0ch
        push    ds
        push    P_4CE6
        nop
        push    cs
        call    cmd_caller_setup
        push    1
        nop
        push    cs
        call    cmd_exec_0E_wrapper
        mov     ax, word ptr [SND_CURRENT+2]
        or      ax, word ptr [SND_CURRENT]
        jne     br_0844B
        jmp     br_085D9

br_0844B:
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_LENGTH_HI]
        or      ax, word ptr es:[bx+SND_LENGTH]
        jne     br_0845C
        jmp     br_085D9
br_0845C:
        mov     si, word ptr [G_WAVE_ZOOM]
        imul    ax, si, 37h
        cwd
        mov     cx, word ptr [bp+6]
        mov     bx, word ptr [bp+8]
        sub     cx, ax
        sbb     bx, dx
        or      bx, bx
        jge     br_08492
        sub     ax, ax
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-0ah], ax
        mov     ax, si
        cwd
        push    dx
        push    si
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   TEXT1_SEG:__aFldiv
        mov     di, 37h
        sub     di, ax
        jmp     br_084A8
        db      90h
br_08492:
        imul    ax, si, 37h
        cwd
        mov     cx, word ptr [bp+6]
        mov     bx, word ptr [bp+8]
        sub     cx, ax
        sbb     bx, dx
        mov     word ptr [bp-0ah], cx
        mov     word ptr [bp-8], bx
        xor     di, di

br_084A8:
        imul    ax, si, 37h
        cwd
        add     ax, word ptr [bp+6]
        adc     dx, word ptr [bp+8]
        les     bx, [SND_CURRENT]
        cmp     dx, word ptr es:[bx+SND_LENGTH_HI]
        jle     br_084BF
        jmp     br_08564

br_084BF:
        jl      br_084CA
        cmp     ax, word ptr es:[bx+SND_LENGTH]
        jbe     br_084CA
        jmp     br_08564

br_084CA:
        mov     word ptr [bp-0eh], 6eh

loop_084CF:
        mov     word ptr [bp-12h], si
        les     bx, [SND_CURRENT]
        mov     si, word ptr es:[bx+SND_POOL_IDX]
        mov     ax, si
        shl     si, 2
        add     si, ax
        add     si, si
        mov     ax, word ptr [si+SMEM_POOL]
        mov     dx, word ptr [si+SMEM_POOL_BASE_HI]
        add     word ptr [bp-0ah], ax
        adc     word ptr [bp-8], dx
        cmp     byte ptr es:[bx+SND_STEREO], 0
        je      br_08518
        cmp     byte ptr [SND_EDIT_VIEW], 0
        je      br_08518
        push    0
        push    2
        mov     bx, si
        push    word ptr [bx+SMEM_POOL_LEN_HI]
        push    word ptr [bx+SMEM_POOL_LEN]
        callf   TEXT1_SEG:__aFldiv
        add     word ptr [bp-0ah], ax
        adc     word ptr [bp-8], dx

br_08518:
        mov     word ptr [bp-10h], di
        cmp     di, word ptr [bp-0eh]
        jb      L_08523
        jmp     br_085D9

L_08523:
        mov     word ptr [bp-2], ds

loop_08526:
        push    word ptr [bp-8]
        push    word ptr [bp-0ah]
        push    ds
        push    BUF_XFER
        push    word ptr [bp-12h]
        nop
        push    cs
        call    smem_read_words
        mov     ax, word ptr [bp-12h]
        cwd
        add     word ptr [bp-0ah], ax
        adc     word ptr [bp-8], dx
        xor     ax, ax
        mov     word ptr [bp-2], ax
        mov     word ptr [bp-0ch], ax
        cmp     word ptr [bp-12h], ax
        jle     br_08596
        mov     bx, BUF_XFER
        mov     ax, word ptr [bp-12h]
        mov     cx, ax

loop_08557:
        mov     ax, word ptr [bx]
        cmp     word ptr [bp-0ch], ax
        jge     br_08588
        mov     word ptr [bp-0ch], ax
        jmp     br_08590
        db      90h

br_08564:
        mov     ax, si
        cwd
        push    dx
        push    si
        mov     ax, word ptr es:[bx+MPC_STATE_range_lo]
        mov     dx, word ptr es:[bx+MPC_STATE_range_hi]
        sub     ax, word ptr [bp+6]
        sbb     dx, word ptr [bp+8]
        push    dx
        push    ax
        callf   TEXT1_SEG:__aFldiv
        add     ax, 37h
        mov     word ptr [bp-0eh], ax
        jmp     loop_084CF
        db      90h

br_08588:
        cmp     word ptr [bp-2], ax
        jle     br_08590
        mov     word ptr [bp-2], ax

br_08590:
        add     bx, 2
        dec     cx
        jne     loop_08557

br_08596:
        mov     si, word ptr [bp-0ch]
        mov     cx, 97bh
        mov     ax, si
        cwd
        idiv    cx
        mov     si, ax
        mov     ax, word ptr [bp-2]
        cwd
        idiv    cx
        mov     word ptr [bp-2], ax
        or      ax, ax
        je      br_085B3
        dec     word ptr [bp-2]
br_085B3:
        mov     ax, word ptr [bp-10h]
        add     ax, 17h
        push    ax
        mov     ax, si
        sub     si, 1dh
        neg     si
        push    si
        sub     ax, word ptr [bp-2]
        push    ax
        nop
        push    cs
        call    cmd_dispatch_0E
        mov     ax, word ptr [bp-0eh]
        inc     word ptr [bp-10h]
        cmp     word ptr [bp-10h], ax
        jae     br_085D9
        jmp     loop_08526

br_085D9:
        push    0
        nop
        push    cs
        call    cmd_exec_0E_wrapper
        pop     si
        pop     di
        leave
        retf    4

X_085E6:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    voice_release_all

        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    sample_ptr_helper
        or      ax, ax
        jne     X_0860E
        nop
        push    cs
        call    far_078E4
        mov     word ptr [SND_CURRENT], ax
        mov     word ptr [SND_CURRENT+2], dx

X_0860E:
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    voice_buffer_init
        nop
        push    cs
        call    zone_range_clamp
        nop
        push    cs
        call    X_07C12
        push    0
        nop
        push    cs
        call    int44_wrapper
        callf   TEXT1_SEG:trim_screen_enter
        pop     ds
        retf
        db      00h
sample_load_wrapper:
        push    bp
        mov     bp, sp
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    sample_data_load_2
        or      dx, ax
        jne     br_0864E
        mov     ax, 1
        leave
        retf    4
        db      90h

br_0864E:
        mov     word ptr [G_ERRNO], ERR_NAME_IN_USE
        nop
        push    cs
        call    err_msg_report
        xor     ax, ax
        leave
        retf    4
        db      00h

sample_calc_length:
        enter   4, 0
        push    di
        push    si
        mov     si, word ptr [bp+6]
        push    0
        push    200h
        mov     es, word ptr [bp+8]
        mov     bx, word ptr es:[si+SND_POOL_IDX]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        push    word ptr [bx+SMEM_POOL_LEN_HI]
        push    word ptr [bx+SMEM_POOL_LEN]
        callf   TEXT1_SEG:__aFldiv
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        or      dx, dx
        jg      L_086B8
        jl      L_0869C
        cmp     ax, 2710h
        jae     L_086B8

L_0869C:
        mov     di, word ptr [bp+0ch]
        mov     si, word ptr [bp+0ah]
        push    di
        push    si
        push    dx
        push    ax
        push    4
        nop
        push    cs
        call    draw_unsigned_value
        lea     ax, [di+18h]
        push    ax

L_086B1:
        push    si
        push    ds
        push    STR_KBYTES
        jmp     br_0872A

L_086B8:
        mov     di, word ptr [bp+0ch]
        mov     si, word ptr [bp+0ah]
        push    di
        push    si
        push    0
        push    400h
        push    dx
        push    ax
        callf   TEXT1_SEG:__aFldiv
        push    dx
        push    ax
        push    2
        nop
        push    cs
        call    draw_unsigned_value
        lea     ax, [di+0ch]
        push    ax

L_086D9:
        push    si
        push    ds
        push    P_3122
        nop
        push    cs
        call    cmd_dispatch_1E
        lea     ax, [di+12h]
        push    ax
        push    si
        push    0
        push    400h
        push    0
        push    400h
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        callf   TEXT1_SEG:__aFlrem
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
        callf   TEXT1_SEG:__aFldiv
        push    dx
        push    ax
        push    1
        nop
        push    cs
        call    draw_unsigned_value
        lea     ax, [di+18h]
        push    ax

L_08725:
        push    si
        push    ds
        push    STR_MBYTES

br_0872A:
        nop
        push    cs
        call    cmd_dispatch_1E
        pop     si
        pop     di
        leave
        retf    8
        db      00h

X_08736:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_SOUND_INFO
        callf   TEXT1_SEG:disp_list_run
        push    67h
        push    0dh
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    cmd_dispatch_1E
        push    43h
        push    27h
        les     bx, [SND_CURRENT]
        mov     al, byte ptr es:[bx+SND_STEREO]
        cbw
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        add     ax, ax
        add     ax, cx
        add     ax, TBL_MONO_STEREO_LABELS
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        push    0afh
        push    1eh
        les     bx, [SND_CURRENT]
        push    0
        push    word ptr es:[bx+SND_RATE]
        push    5
        nop
        push    cs
        call    draw_unsigned_value
        push    0a9h
        push    27h
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    sample_calc_length
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    sample_check_active
        or      ax, ax
        je      L_087C0
        push    25h
        push    0dh
        push    ds
        push    STR_EDIT_COPY_TO_RAM
        nop
        push    cs
        call    cmd_dispatch_1E
        pop     ds
        retf
        db      90h

L_087C0:
        push    25h
        push    0dh
        push    ds
        push    STR_SOUND_NAME_LBL
        nop
        push    cs
        call    cmd_dispatch_1E
        nop
        push    cs
        call    field_redraw
        pop     ds
        retf
tgt_087D4:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     ax, word ptr [SND_CURRENT+2]
        or      ax, word ptr [SND_CURRENT]
        je      br_0881B
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    voice_release_all_if
        push    ds
        push    TBL_WINKEYS_031BE
        callf   TEXT1_SEG:win_keys_merge
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    sample_check_active
        or      ax, ax
        jne     br_0881B
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        push    67h
        push    0dh
        callf   TEXT1_SEG:far_call_wrapper_1

br_0881B:
        pop     ds
        retf
        db      00h

snd_edit_page_return:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    sample_load_wrapper
        or      ax, ax
        je      br_0885F
        mov     al, byte ptr [G_SND_EDIT_PAGE]
        cbw
        dec     ax
        je      br_0884A
        dec     ax
        je      br_08852
        dec     ax
        je      L_0885A
        callf   TEXT1_SEG:trim_screen_enter
        pop     ds
        retf
        db      90h

br_0884A:
        callf   TEXT1_SEG:fit_to_length_cancel
        pop     ds
        retf
        db      90h

br_08852:
        callf   TEXT1_SEG:zone_screen_enter
        pop     ds
        retf
        db      90h

L_0885A:
        callf   TEXT1_SEG:snd_params_screen_enter

br_0885F:
        pop     ds
        retf
        db      00h

; ?
sample_voice_init:
        enter   4, 0

L_08866:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    voice_release_all_if
        push    word ptr [PTR_DL_PROCESSING_SEG]
        push    word ptr [PTR_DL_PROCESSING]
        callf   TEXT1_SEG:disp_list_run
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_NEXT]
        mov     dx, word ptr es:[bx+SND_NEXT_SEG]
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    es
        push    bx
        nop
        push    cs
        call    smem_proc_wrapper
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    sample_validate_ptr
        push    word ptr [bp-2]
        push    si
        nop
        push    cs
        call    sample_ptr_helper
        or      ax, ax
        je      br_088C6
        mov     ax, word ptr [bp-2]
        mov     word ptr [SND_CURRENT], si
        mov     word ptr [SND_CURRENT+2], ax
        jmp     X_088D2
        db      90h

br_088C6:
        nop
        push    cs
        call    far_078E4
        mov     word ptr [SND_CURRENT], ax
        mov     word ptr [SND_CURRENT+2], dx

X_088D2:
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    voice_buffer_init
        push    ds
        push    P_31EB
        callf   TEXT1_SEG:disp_list_run
        nop
        push    cs
        call    snd_edit_page_return
        pop     ds
        pop     si
        leave
        retf
        db      00h
delete_sound_paint:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_DELETE_SOUND
        callf   TEXT1_SEG:disp_list_run
        push    49h
        push    11h
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    sample_check_active
        or      ax, ax
        je      L_0891C
        mov     ax, STR_ROM_1
        jmp     L_0891F
        db      90h

L_0891C:
        mov     ax, STR_SND_1

L_0891F:
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        push    61h
        push    11h
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    cmd_dispatch_1E
        pop     ds
        retf
        db      00h


L_0855C:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    sample_load_wrapper
        or      ax, ax
        je      X_0895A
        push    ds
        push    TBL_WINKEYS_DELETE_SOUND
        callf   TEXT1_SEG:win_keys_merge

X_0895A:
        pop     ds
        retf

delete_all_sounds_do_it:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    voice_release_all_if
        push    word ptr [PTR_DL_PROCESSING_SEG]
        push    word ptr [PTR_DL_PROCESSING]
        callf   TEXT1_SEG:disp_list_run
        nop
        push    cs
        call    sample_data_load_1
        nop
        push    cs
        call    smem_transfer_io
        nop
        push    cs
        call    far_078E4
        mov     word ptr [SND_CURRENT], ax
        mov     word ptr [SND_CURRENT+2], dx
        push    dx
        push    ax
        nop
        push    cs
        call    voice_buffer_init
        push    ds
        push    P_327B
        callf   TEXT1_SEG:disp_list_run
        nop
        push    cs
        call    snd_edit_page_return
        pop     ds
        retf
        db      00h

delete_all_sounds_paint:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_DELETE_ALL_SOUNDS
        callf   TEXT1_SEG:disp_list_run
        pop     ds
        retf
        db      00h

delete_sound_all:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    sample_load_wrapper
        or      ax, ax
        je      br_089DC
        push    ds
        push    TBL_WINKEYS_DELETE_ALL_SOUNDS
        callf   TEXT1_SEG:win_keys_merge

br_089DC:
        pop     ds
        retf

; COPY SOUND's DO IT: the copy becomes SND_CURRENT.
voice_init_caller:
        enter   4, 0

L_089E2:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    word ptr [PTR_DL_PROCESSING_SEG]
        push    word ptr [PTR_DL_PROCESSING]
        callf   TEXT1_SEG:disp_list_run
        push    ds
        push    TBL_SOUND_NAMES
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    sample_ptr_accessor
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     br_08A18
        nop
        push    cs
        call    err_msg_report
        jmp     L_08A29
        db      90h
br_08A18:
        mov     ax, word ptr [bp-2]
        mov     word ptr [SND_CURRENT], si
        mov     word ptr [SND_CURRENT+2], ax
        push    ax
        push    si
        nop
        push    cs
        call    voice_buffer_init

L_08A29:
        push    ds
        push    P_32FE
        callf   TEXT1_SEG:disp_list_run
        nop
        push    cs
        call    snd_edit_page_return
        pop     ds
        pop     si
        leave
        retf
        db      00h

L_0865E:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    73h
        push    10h
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    cmd_dispatch_1E
        push    73h
        push    28h
        push    ds
        push    TBL_SOUND_NAMES
        nop
        push    cs
        call    cmd_dispatch_1E
        nop
        push    cs
        call    field_redraw
        pop     ds
        retf
        db      00h

L_0868A:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    sample_load_wrapper
        or      ax, ax
        je      br_08AC8
        push    ds
        push    TBL_WINKEYS_0338E
        callf   TEXT1_SEG:win_keys_merge
        push    ds
        push    TBL_SOUND_NAMES
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        push    63h
        nop
        push    cs
        call    track_block_copy
        push    ds
        push    TBL_SOUND_NAMES
        push    73h
        push    28h
        callf   TEXT1_SEG:far_call_wrapper_1
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    sample_check_active
        or      ax, ax
        je      L_08ABE
        mov     ax, DL_COPY_TO_RAM
        jmp     br_08AC1

L_08ABE:
        mov     ax, DL_COPY_SOUND

br_08AC1:
        push    ds
        push    ax
        callf   TEXT1_SEG:disp_list_run

br_08AC8:
        pop     ds
        retf

; ?
sample_data_far_1:
        enter   8, 0
        push    si
        mov     ax, word ptr [G_EDIT_FIELD_VAL]
        mov     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        les     bx, [SND_CURRENT]
        cmp     word ptr es:[bx+SND_END_HI], dx
        jg      br_08B48
        jl      br_08AE8
        cmp     word ptr es:[bx+SND_END], ax
        jae     br_08B48

br_08AE8:
        mov     ax, word ptr es:[bx+SND_LOOP]
        mov     dx, word ptr es:[bx+SND_LOOP_HI]
        sub     ax, word ptr es:[bx+SND_END]
        sbb     dx, word ptr es:[bx+SND_END_HI]
        add     ax, word ptr [G_EDIT_FIELD_VAL]
        adc     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     word ptr es:[bx+SND_LOOP], ax
        mov     word ptr es:[bx+SND_LOOP_HI], dx
        mov     ax, word ptr [SND_CURRENT]
        mov     dx, word ptr [SND_CURRENT+2]
        mov     si, ax
        mov     word ptr [bp-6], dx
        push    0
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        callf   TEXT1_SEG:addr_calc_segment
        add     sp, 6
        mov     es, word ptr [bp-6]
        mov     word ptr es:[si+32h], ax
        mov     word ptr es:[si+34h], dx
        mov     ax, word ptr [G_EDIT_FIELD_VAL]
        mov     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        les     bx, [SND_CURRENT]
        mov     word ptr es:[bx+SND_END], ax
        mov     word ptr es:[bx+SND_END_HI], dx

br_08B48:
        mov     ax, word ptr [G_EDIT_FIELD_VAL]
        mov     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        les     bx, [SND_CURRENT]
        mov     word ptr es:[bx+SND_START], ax
        mov     word ptr es:[bx+SND_START_HI], dx
        pop     si
        leave
        retf
L_08B5E:
        mov     ax, word ptr [G_EDIT_FIELD_VAL]
        mov     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        les     bx, [SND_CURRENT]
        cmp     word ptr es:[bx+SND_END_HI], dx
        jg      L_08B7F
        jl      X_08B77
        cmp     word ptr es:[bx+SND_END], ax
        jae     L_08B7F

X_08B77:
        mov     word ptr es:[bx+18h], ax
        mov     word ptr es:[bx+1ah], dx

L_08B7F:
        mov     ax, word ptr [G_EDIT_FIELD_VAL]
        mov     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        les     bx, [SND_CURRENT]
        mov     word ptr es:[bx+SND_START], ax
        mov     word ptr es:[bx+SND_START_HI], dx
        retf
        db      00h

sample_data_far_2:
        enter   0ch, 0
        push    si
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_END]
        mov     dx, word ptr es:[bx+SND_END_HI]
        if      FW_VERSION = 172
        mov     cx, ax
        mov     si, dx
        endif
        sub     ax, word ptr es:[bx+SND_START]
        sbb     dx, word ptr es:[bx+SND_START_HI]
        add     ax, word ptr [G_EDIT_FIELD_VAL]
        adc     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        if      FW_VERSION = 172
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        sub     ax, cx
        sbb     dx, si
        add     ax, word ptr es:[bx+SND_LOOP]
        adc     dx, word ptr es:[bx+SND_LOOP_HI]
        endif
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        if      FW_VERSION = 172
        or      dx, dx
        jge     L_08BDD
        sub     ax, ax
        mov     word ptr [bp-2], ax
        mov     word ptr [bp-4], ax

L_08BDD:
        mov     dx, word ptr [bp-2]
        else
        mov     ax, word ptr es:[bx+20h]
        mov     dx, word ptr es:[bx+22h]
        sub     ax, word ptr es:[bx+18h]
        sbb     dx, word ptr es:[bx+1ah]
        add     ax, word ptr [bp-4]
        adc     dx, word ptr [bp-2]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        endif
        mov     word ptr es:[bx+SND_LOOP], ax
        mov     word ptr es:[bx+SND_LOOP_HI], dx
        mov     ax, word ptr [SND_CURRENT]
        mov     dx, word ptr [SND_CURRENT+2]
        mov     si, ax
        if      FW_VERSION = 172
        mov     word ptr [bp-6], dx
        else
        mov     word ptr [bp-0ah], dx
        endif
        push    0
        if      FW_VERSION = 172
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        else
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        endif
        callf   TEXT1_SEG:addr_calc_segment
        add     sp, 6
        if      FW_VERSION = 172
        mov     es, word ptr [bp-6]
        else
        mov     es, word ptr [bp-0ah]
        endif
        mov     word ptr es:[si+32h], ax
        mov     word ptr es:[si+34h], dx
        if      FW_VERSION = 172
        mov     ax, word ptr [bp-0ch]
        mov     dx, word ptr [bp-0ah]
        else
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        endif
        les     bx, [SND_CURRENT]
        mov     word ptr es:[bx+SND_END], ax
        mov     word ptr es:[bx+SND_END_HI], dx
        mov     ax, word ptr [G_EDIT_FIELD_VAL]
        mov     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        les     bx, [SND_CURRENT]
        mov     word ptr es:[bx+SND_START], ax
        mov     word ptr es:[bx+SND_START_HI], dx
        pop     si
        leave
        retf
        if      FW_VERSION = 172
        db      00h

sample_str_scan_1:
        else
SAMPLE_STR_SCAN_1               equ     $+00h
        endif
        enter   4, 0
        push    si
        mov     ax, word ptr [SND_CURRENT]
        mov     dx, word ptr [SND_CURRENT+2]
        mov     bx, ax
        mov     word ptr [bp-2], dx
        les     si, [SND_CURRENT]
        mov     ax, word ptr es:[si+SND_END]
        mov     dx, word ptr es:[si+SND_END_HI]
        sub     ax, word ptr es:[si+SND_START]
        sbb     dx, word ptr es:[si+SND_START_HI]
        add     ax, word ptr [G_EDIT_FIELD_VAL]
        adc     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[bx+SND_END], ax
        mov     word ptr es:[bx+SND_END_HI], dx
        mov     ax, word ptr [G_EDIT_FIELD_VAL]
        mov     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        les     bx, [SND_CURRENT]
        mov     word ptr es:[bx+SND_START], ax
        mov     word ptr es:[bx+SND_START_HI], dx
        pop     si
        leave
        retf

sample_active_check_1:
        enter   10h, 0
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    sample_check_active
        or      ax, ax
        je      br_08C9E
        jmp     br_08D4E

br_08C9E:
        cmp     byte ptr [TRIM_LEN_FIX], 0
        je      br_08D16
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_START]
        mov     dx, word ptr es:[bx+SND_START_HI]
        sub     ax, word ptr es:[bx+SND_END]
        sbb     dx, word ptr es:[bx+SND_END_HI]
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        add     ax, word ptr es:[bx+SND_LENGTH]
        adc     dx, word ptr es:[bx+SND_LENGTH_HI]
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        cmp     byte ptr [LOOP_LEN_FIX], 0
        jne     br_08CEA
        sub     ax, ax
        mov     word ptr [bp-2], ax
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-8], sample_data_far_2
        mov     word ptr [bp-6], TEXT2_SEG
        jmp     L_08D6E
        db      90h

br_08CEA:
        mov     ax, word ptr [bp-10h]
        mov     dx, word ptr [bp-0eh]
        add     ax, word ptr es:[bx+SND_LOOP]
        adc     dx, word ptr es:[bx+SND_LOOP_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        or      dx, dx
        jge     br_08D0A
        sub     ax, ax
        mov     word ptr [bp-2], ax
        mov     word ptr [bp-4], ax

br_08D0A:
        mov     word ptr [bp-8], SAMPLE_STR_SCAN_1
        mov     word ptr [bp-6], TEXT2_SEG
        jmp     L_08D6E

br_08D16:
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_LENGTH]
        mov     dx, word ptr es:[bx+SND_LENGTH_HI]
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        sub     ax, ax
        mov     word ptr [bp-2], ax
        mov     word ptr [bp-4], ax
        cmp     byte ptr [LOOP_LEN_FIX], al
        jne     br_08D42
        mov     word ptr [bp-8], SAMPLE_DATA_FAR_1
        mov     word ptr [bp-6], TEXT2_SEG
        jmp     L_08D6E

br_08D42:
        mov     word ptr [bp-8], L_08B5E
        mov     word ptr [bp-6], TEXT2_SEG
        jmp     L_08D6E

br_08D4E:
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_START]
        mov     dx, word ptr es:[bx+SND_START_HI]
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        sub     ax, ax
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-8], ax

L_08D6E:
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_START]
        mov     dx, word ptr es:[bx+SND_START_HI]
        mov     word ptr [G_EDIT_FIELD_VAL], ax
        mov     word ptr [G_EDIT_FIELD_VAL_HI], dx
        push    ds
        push    G_EDIT_FIELD_VAL
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    ui_field_edit
        leave
        retf    8

sample_data_far_3:
        enter   8, 0
        push    si
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_LOOP]
        mov     dx, word ptr es:[bx+SND_LOOP_HI]
        sub     ax, word ptr es:[bx+SND_END]
        sbb     dx, word ptr es:[bx+SND_END_HI]
        add     ax, word ptr [G_EDIT_FIELD_VAL]
        adc     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        or      dx, dx
        jge     br_08DDF
        sub     ax, ax
        mov     word ptr [bp-2], ax
        mov     word ptr [bp-4], ax

br_08DDF:
        mov     dx, word ptr [bp-2]
        mov     word ptr es:[bx+SND_LOOP], ax
        mov     word ptr es:[bx+SND_LOOP_HI], dx
        mov     ax, word ptr [SND_CURRENT]
        mov     dx, word ptr [SND_CURRENT+2]
        mov     si, ax
        mov     word ptr [bp-6], dx
        push    0
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        callf   TEXT1_SEG:addr_calc_segment
        add     sp, 6
        mov     es, word ptr [bp-6]
        mov     word ptr es:[si+32h], ax
        mov     word ptr es:[si+34h], dx
        mov     ax, word ptr [G_EDIT_FIELD_VAL]
        mov     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        les     bx, [SND_CURRENT]
        cmp     word ptr es:[bx+SND_START_HI], dx
        jl      br_08E32
        jg      L_08E2A
        cmp     word ptr es:[bx+SND_START], ax
        jbe     br_08E32

L_08E2A:
        mov     word ptr es:[bx+SND_START], ax
        mov     word ptr es:[bx+SND_START_HI], dx

br_08E32:
        mov     ax, word ptr [G_EDIT_FIELD_VAL]
        mov     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        les     bx, [SND_CURRENT]
        mov     word ptr es:[bx+SND_END], ax
        mov     word ptr es:[bx+SND_END_HI], dx
        pop     si
        leave
        retf
L_08E48:
        mov     ax, word ptr [G_EDIT_FIELD_VAL]
        mov     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        les     bx, [SND_CURRENT]
        cmp     word ptr es:[bx+SND_START_HI], dx
        jl      L_08E69
        jg      X_08E61
        cmp     word ptr es:[bx+SND_START], ax
        jbe     L_08E69

X_08E61:
        mov     word ptr es:[bx+14h], ax
        mov     word ptr es:[bx+16h], dx

L_08E69:
        mov     ax, word ptr [G_EDIT_FIELD_VAL]
        mov     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        les     bx, [SND_CURRENT]
        mov     word ptr es:[bx+SND_END], ax
        mov     word ptr es:[bx+SND_END_HI], dx
        retf
        db      00h

sample_data_far_4:
        enter   8, 0
        push    si
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_LOOP]
        mov     dx, word ptr es:[bx+SND_LOOP_HI]
        sub     ax, word ptr es:[bx+SND_END]
        sbb     dx, word ptr es:[bx+SND_END_HI]
        add     ax, word ptr [G_EDIT_FIELD_VAL]
        adc     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        or      dx, dx
        jge     L_08EB1
        sub     ax, ax
        mov     word ptr [bp-2], ax
        mov     word ptr [bp-4], ax

L_08EB1:
        mov     dx, word ptr [bp-2]
        mov     word ptr es:[bx+SND_LOOP], ax
        mov     word ptr es:[bx+SND_LOOP_HI], dx
        mov     ax, word ptr [SND_CURRENT]
        mov     dx, word ptr [SND_CURRENT+2]
        mov     si, ax
        mov     word ptr [bp-6], dx
        push    0
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        callf   TEXT1_SEG:addr_calc_segment
        add     sp, 6
        mov     es, word ptr [bp-6]
        mov     word ptr es:[si+32h], ax
        mov     word ptr es:[si+34h], dx
        mov     ax, word ptr [SND_CURRENT]
        mov     dx, word ptr [SND_CURRENT+2]
        mov     bx, ax
        mov     word ptr [bp-2], dx
        les     si, [SND_CURRENT]
        mov     ax, word ptr es:[si+SND_START]
        mov     dx, word ptr es:[si+SND_START_HI]
        sub     ax, word ptr es:[si+SND_END]
        sbb     dx, word ptr es:[si+SND_END_HI]
        add     ax, word ptr [G_EDIT_FIELD_VAL]
        adc     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[bx+SND_START], ax
        mov     word ptr es:[bx+SND_START_HI], dx
        mov     ax, word ptr [G_EDIT_FIELD_VAL]
        mov     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        les     bx, [SND_CURRENT]
        mov     word ptr es:[bx+SND_END], ax
        mov     word ptr es:[bx+SND_END_HI], dx
        pop     si
        leave
        retf

sample_str_scan_2:
        enter   4, 0
        push    si
        mov     ax, word ptr [SND_CURRENT]
        mov     dx, word ptr [SND_CURRENT+2]
        mov     bx, ax
        mov     word ptr [bp-2], dx
        les     si, [SND_CURRENT]
        mov     ax, word ptr es:[si+SND_START]
        mov     dx, word ptr es:[si+SND_START_HI]
        sub     ax, word ptr es:[si+SND_END]
        sbb     dx, word ptr es:[si+SND_END_HI]
        add     ax, word ptr [G_EDIT_FIELD_VAL]
        adc     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[bx+SND_START], ax
        mov     word ptr es:[bx+SND_START_HI], dx
        mov     ax, word ptr [G_EDIT_FIELD_VAL]
        mov     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        les     bx, [SND_CURRENT]
        mov     word ptr es:[bx+SND_END], ax
        mov     word ptr es:[bx+SND_END_HI], dx
        pop     si
        leave
        retf

sample_active_check_2:
        enter   10h, 0
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    sample_check_active
        or      ax, ax
        je      br_08F92
        jmp     br_09034

br_08F92:
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_LENGTH]
        mov     dx, word ptr es:[bx+SND_LENGTH_HI]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        cmp     byte ptr [TRIM_LEN_FIX], 0
        jne     br_08FE2
        cmp     byte ptr [LOOP_LEN_FIX], 0
        jne     br_08FC8
        sub     ax, ax
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-10h], sample_data_far_3
        mov     word ptr [bp-0eh], TEXT2_SEG
        jmp     X_09054
        db      90h

br_08FC8:
        mov     ax, word ptr es:[bx+SND_LOOP]
        mov     dx, word ptr es:[bx+SND_LOOP_HI]
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        mov     word ptr [bp-10h], L_08E48
        mov     word ptr [bp-0eh], TEXT2_SEG
        jmp     X_09054

br_08FE2:
        mov     ax, word ptr es:[bx+SND_END]
        mov     dx, word ptr es:[bx+SND_END_HI]
        sub     ax, word ptr es:[bx+SND_START]
        sbb     dx, word ptr es:[bx+SND_START_HI]
        cmp     byte ptr [LOOP_LEN_FIX], 0
        jne     br_0900C
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        mov     word ptr [bp-10h], sample_data_far_4
        mov     word ptr [bp-0eh], TEXT2_SEG
        jmp     X_09054
        db      90h

br_0900C:
        cmp     word ptr es:[bx+SND_LOOP_HI], dx
        jg      L_0901A
        jl      br_09022
        cmp     word ptr es:[bx+SND_LOOP], ax
        jb      br_09022

L_0901A:
        mov     ax, word ptr es:[bx+SND_LOOP]
        mov     dx, word ptr es:[bx+SND_LOOP_HI]

br_09022:
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        mov     word ptr [bp-10h], sample_str_scan_2
        mov     word ptr [bp-0eh], TEXT2_SEG
        jmp     X_09054

br_09034:
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_END]
        mov     dx, word ptr es:[bx+SND_END_HI]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        sub     ax, ax
        mov     word ptr [bp-0eh], ax
        mov     word ptr [bp-10h], ax

X_09054:
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_END]
        mov     dx, word ptr es:[bx+SND_END_HI]
        mov     word ptr [G_EDIT_FIELD_VAL], ax
        mov     word ptr [G_EDIT_FIELD_VAL_HI], dx
        push    ds
        push    G_EDIT_FIELD_VAL
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    word ptr [bp-0eh]
        push    word ptr [bp-10h]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    ui_field_edit
        leave
        retf    8
L_09092:
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    voice_release_all_if
        nop
        push    cs
        call    zone_range_clamp
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    voice_buffer_init
        retf

X_090B2:
        push    ds
        push    SND_CURRENT
        push    0
        push    1ah
        push    2
        push    TEXT2_SEG
        push    L_09092
        callf   TEXT1_SEG:far_035F2
        push    TEXT2_SEG
        push    TGT_087D4
        nop
        push    cs
        call    install_handler_15
        retf
        db      00h

L_090D4:
        push    0c7h
        push    1
        push    word TEXT1_SEG
        push    win_key_nop_stub
        nop
        push    cs
        call    voice_trigger_caller
        retf
        db      00h

L_090E6:
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    voice_buffer_init
        retf

X_090F4:
        push    ds
; View: field arm shared by TRIM/LOOP (text1 L_0789C) and znEDIT
; (text1 L_07CD8). ZONE_SLICE retargets znEDIT's slot at hook A
; (its own call site); View works on the other two screens.
        push    SND_EDIT_VIEW
        push    1
        push    0d4h
        push    0ch
        push    6
        push    TEXT2_SEG
        push    L_090E6
        nop
        push    cs
        call    voice_trigger_full
        push    0
        push    0
        nop
        push    cs
        call    install_handler_15
        retf

L_09116:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    sample_name_search
        pop     ds
        retf
        db      00h

X_09124:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        push    1ah
        push    2
        nop
        push    cs
        call    timer_value_read_4
        push    0c7h
        push    1
        nop
        push    cs
        call    mode_dispatch_index
        push    0d4h
        push    0ch
        mov     al, byte ptr [SND_EDIT_VIEW]
        cbw
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        add     ax, ax
        add     ax, TBL_LEFT_RIGHT_LABELS
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        mov     ax, word ptr [SND_CURRENT+2]
        or      ax, word ptr [SND_CURRENT]
        je      X_091D1
        push    2
        push    2
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    sample_check_active
        or      ax, ax
        je      L_09184
        mov     ax, STR_ROM_2
        jmp     br_09187
        db      90h

L_09184:
        mov     ax, STR_SND_2

br_09187:
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        les     bx, [SND_CURRENT]
        push    word ptr es:[bx+SND_START_HI]
        push    word ptr es:[bx+SND_START]
        push    1ah
        push    0ch
        nop
        push    cs
        call    display_draw_coord
        les     bx, [SND_CURRENT]
        push    word ptr es:[bx+SND_END_HI]
        push    word ptr es:[bx+SND_END]
        push    7ah
        push    0ch
        nop
        push    cs
        call    display_draw_coord
        les     bx, [SND_CURRENT]
        push    word ptr es:[bx+SND_START_HI]
        push    word ptr es:[bx+SND_START]
        push    word ptr es:[bx+SND_END_HI]
        push    word ptr es:[bx+SND_END]
        nop
        push    cs
        call    cmd_exec_caller

X_091D1:
        nop
        push    cs
        call    field_redraw
        nop
        push    cs
        call    cmd_ratio_calc
        pop     ds
        retf
        db      00h

wave_zoom_double:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        cmp     word ptr [G_WAVE_ZOOM], 40h
        jge     X_091EF
        shl     word ptr [G_WAVE_ZOOM], 1

X_091EF:
        pop     ds
        retf
        db      00h

wave_zoom_halve:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     cx, 2
        mov     ax, word ptr [G_WAVE_ZOOM]
        cwd
        idiv    cx
        mov     word ptr [G_WAVE_ZOOM], ax
        or      ax, ax
        jne     X_0920E
        mov     word ptr [G_WAVE_ZOOM], 1

X_0920E:
        pop     ds
        retf

L_09210:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_START_FINE
        callf   TEXT1_SEG:disp_list_run
        les     bx, [SND_CURRENT]
        push    word ptr es:[bx+SND_START_HI]
        push    word ptr es:[bx+SND_START]
        nop
        push    cs
        call    cmd_write_caller
        les     bx, [SND_CURRENT]
        push    word ptr es:[bx+SND_START_HI]
        push    word ptr es:[bx+SND_START]
        push    0b5h
        push    0ch
        nop
        push    cs
        call    display_draw_coord
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_END]
        mov     dx, word ptr es:[bx+SND_END_HI]
        sub     ax, word ptr es:[bx+SND_START]
        sbb     dx, word ptr es:[bx+SND_START_HI]
        push    dx
        push    ax
        push    0b5h
        push    15h
        nop
        push    cs
        call    display_draw_coord
        push    0cdh
        push    1fh
        mov     al, byte ptr [TRIM_LEN_FIX]
        cbw
        mov     cx, ax
        shl     ax, 2
        add     ax, cx
        add     ax, TBL_LOOP_LEN_MODE_LABELS
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        push    0b5h
        push    28h
        nop
        push    cs
        call    mode_dispatch_index
        nop
        push    cs
        call    field_redraw
        pop     ds
        retf
        db      00h

L_09292:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    32h
        push    TEXT2_SEG
        push    L_09210
        nop
        push    cs
        call    install_handler
        pop     ds
        retf
        db      00h

X_092A8:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    32h
        push    TEXT2_SEG
        push    L_09292
        nop
        push    cs
        call    install_handler
        nop
        push    cs
        call    edit_range_select
        pop     ds
        retf
L_092C2:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_END_FINE
        callf   TEXT1_SEG:disp_list_run
        les     bx, [SND_CURRENT]
        push    word ptr es:[bx+SND_END_HI]
        push    word ptr es:[bx+SND_END]
        nop
        push    cs
        call    cmd_write_caller
        les     bx, [SND_CURRENT]
        push    word ptr es:[bx+SND_END_HI]
        push    word ptr es:[bx+SND_END]
        push    0b5h
        push    0ch
        nop
        push    cs
        call    display_draw_coord
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_END]
        mov     dx, word ptr es:[bx+SND_END_HI]
        sub     ax, word ptr es:[bx+SND_START]
        sbb     dx, word ptr es:[bx+SND_START_HI]
        push    dx
        push    ax
        push    0b5h
        push    15h
        nop
        push    cs
        call    display_draw_coord
        push    0cdh
        push    1fh
        mov     al, byte ptr [TRIM_LEN_FIX]
        cbw
        mov     cx, ax
        shl     ax, 2
        add     ax, cx
        add     ax, TBL_LOOP_LEN_MODE_LABELS
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        push    0b5h
        push    28h
        nop
        push    cs
        call    mode_dispatch_index
        nop
        push    cs
        call    field_redraw
        pop     ds
        retf
        db      00h

L_09344:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    32h
        push    TEXT2_SEG
        push    L_092C2
        nop
        push    cs
        call    install_handler
        pop     ds
        retf
        db      00h

X_0935A:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    32h
        push    TEXT2_SEG
        push    L_09344
        nop
        push    cs
        call    install_handler
        nop
        push    cs
        call    edit_range_select
        pop     ds
        retf

; ? MPC_STATE_pos minus a param, then indexes the per-voice state array.
sample_event_handler:
        enter   1ah, 0
        push    di
        push    si
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_END]
        mov     dx, word ptr es:[bx+SND_END_HI]
        sub     ax, word ptr es:[bx+SND_LOOP]
        sbb     dx, word ptr es:[bx+SND_LOOP_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     bx, word ptr es:[bx+SND_POOL_IDX]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL]
        mov     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        if      FW_VERSION = 172
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        else
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        endif
        push    0
        push    2
        push    word ptr [bx+SMEM_POOL_LEN_HI]
        push    word ptr [bx+SMEM_POOL_LEN]
        callf   TEXT1_SEG:__aFldiv
        mov     word ptr [bp-18h], ax
        mov     word ptr [bp-16h], dx
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        les     bx, [SND_CURRENT]
        cmp     word ptr es:[bx+SND_START_HI], dx
        jl      L_093DE
        jg      br_093E6
        cmp     word ptr es:[bx+SND_START], ax
        jae     br_093E6

L_093DE:
        mov     ax, word ptr es:[bx+SND_START]
        mov     dx, word ptr es:[bx+SND_START_HI]

br_093E6:
        if      FW_VERSION = 172
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        else
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        endif
        mov     ax, word ptr es:[bx+SND_END]
        mov     dx, word ptr es:[bx+SND_END_HI]
        if      FW_VERSION = 172
        sub     ax, word ptr [bp-8]
        sbb     dx, word ptr [bp-6]
        else
        sub     ax, word ptr [bp-0ch]
        sbb     dx, word ptr [bp-0ah]
        endif
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        mov     cx, ax
        mov     bx, dx
        add     ax, 0fh
        adc     dx, 0
        and     al, 0f0h
        mov     word ptr [bp-14h], ax
        mov     word ptr [bp-12h], dx
        if      FW_VERSION = 172
        mov     ax, word ptr [bp-0ch]
        mov     dx, word ptr [bp-0ah]
        add     ax, word ptr [bp-8]
        adc     dx, word ptr [bp-6]
        else
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        add     ax, word ptr [bp-0ch]
        adc     dx, word ptr [bp-0ah]
        endif
        push    dx
        push    ax
        if      FW_VERSION = 172
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        else
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        endif
        push    bx
        push    cx
        nop
        push    cs
        call    input_handler
        les     bx, [SND_CURRENT]
        cmp     byte ptr es:[bx+SND_STEREO], 0
        je      X_09465
        mov     ax, word ptr [bp-18h]
        mov     dx, word ptr [bp-16h]
        if      FW_VERSION = 172
        add     ax, word ptr [bp-0ch]
        adc     dx, word ptr [bp-0ah]
        endif
        add     ax, word ptr [bp-8]
        adc     dx, word ptr [bp-6]
        if      FW_VERSION = 150
        add     ax, word ptr [bp-0ch]
        adc     dx, word ptr [bp-0ah]
        endif
        push    dx
        push    ax
        mov     ax, word ptr [bp-14h]
        mov     dx, word ptr [bp-12h]
        if      FW_VERSION = 172
        add     ax, word ptr [bp-0ch]
        adc     dx, word ptr [bp-0ah]
        else
        add     ax, word ptr [bp-8]
        adc     dx, word ptr [bp-6]
        endif
        push    dx
        push    ax
        push    word ptr [bp-0eh]
        push    word ptr [bp-10h]
        nop
        push    cs
        call    input_handler

X_09465:
        if      FW_VERSION = 172
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        endif
        les     bx, [SND_CURRENT]
        if      FW_VERSION = 172
        sub     word ptr es:[bx+SND_START], ax
        sbb     word ptr es:[bx+SND_START_HI], dx
        else
        sub     ax, ax
        mov     word ptr es:[bx+SND_START_HI], ax
        mov     word ptr es:[bx+SND_START], ax
        endif
        mov     ax, word ptr [SND_CURRENT]
        mov     dx, word ptr [SND_CURRENT+2]
        mov     di, ax
        mov     word ptr [bp-2], dx
        mov     bx, ax
        mov     word ptr [bp-6], dx
        mov     es, dx
        mov     si, ax
        mov     ax, word ptr [bp-10h]
        mov     dx, word ptr [bp-0eh]
        mov     word ptr es:[si+SND_LENGTH], ax
        mov     word ptr es:[si+SND_LENGTH_HI], dx
        mov     es, word ptr [bp-6]
        mov     ax, word ptr es:[bx+SND_LENGTH]
        mov     dx, word ptr es:[bx+SND_LENGTH_HI]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[di+18h], ax
        mov     word ptr es:[di+1ah], dx
        push    word ptr [bp-12h]
        push    word ptr [bp-14h]
        les     bx, [SND_CURRENT]
        cmp     byte ptr es:[bx+SND_STEREO], 1
        sbb     ax, ax
        add     ax, 2
        cwd
        push    dx
        push    ax
        callf   TEXT1_SEG:__aFlmul
        les     bx, [SND_CURRENT]
        mov     bx, word ptr es:[bx+SND_POOL_IDX]
        mov     cx, bx
        shl     bx, 2
        add     bx, cx
        add     bx, bx
        mov     word ptr [bx+SMEM_POOL_LEN], ax
        mov     word ptr [bx+SMEM_POOL_LEN_HI], dx
        pop     si
        pop     di
        leave
        retf
        db      00h
discard_do_it:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    voice_release_all_if
        push    word ptr [PTR_DL_PROCESSING_SEG]
        push    word ptr [PTR_DL_PROCESSING]
        callf   TEXT1_SEG:disp_list_run
        nop
        push    cs
        call    sample_event_handler
        nop
        push    cs

        call    smem_compact
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    voice_buffer_init
        push    ds
        push    P_358B
        callf   TEXT1_SEG:disp_list_run
        callf   TEXT1_SEG:trim_screen_enter
        pop     ds
        retf
        db      00h

discard_paint:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_DISCARD
        callf   TEXT1_SEG:disp_list_run
        pop     ds
        retf
        db      00h
; DISCARD only while the sound is not playing.
L_09544:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     ax, word ptr [SND_CURRENT+2]
        or      ax, word ptr [SND_CURRENT]
        je      L_0956D
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    sample_check_active
        or      ax, ax
        jne     L_0956D
        push    ds
        push    TBL_WINKEYS_DISCARD
        callf   TEXT1_SEG:win_keys_merge

L_0956D:
        pop     ds
        retf
        db      90h

sample_str_scan_3:
        enter   4, 0
        push    si
        mov     ax, word ptr [SND_CURRENT]
        mov     dx, word ptr [SND_CURRENT+2]
        mov     bx, ax
        mov     word ptr [bp-2], dx
        les     si, [SND_CURRENT]
        mov     ax, word ptr es:[si+SND_END]
        mov     dx, word ptr es:[si+SND_END_HI]
        sub     ax, word ptr [G_EDIT_FIELD_VAL]
        sbb     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[bx+SND_LOOP], ax
        mov     word ptr es:[bx+SND_LOOP_HI], dx
        mov     ax, word ptr [SND_CURRENT]
        mov     dx, word ptr [SND_CURRENT+2]
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    0
        les     bx, [SND_CURRENT]
        push    word ptr es:[bx+SND_LOOP_HI]
        push    word ptr es:[bx+SND_LOOP]
        callf   TEXT1_SEG:addr_calc_segment
        add     sp, 6
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+32h], ax
        mov     word ptr es:[si+34h], dx
        pop     si
        leave
        retf

sample_str_scan_4:
        enter   4, 0
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_LOOP]
        mov     dx, word ptr es:[bx+SND_LOOP_HI]
        add     ax, word ptr [G_EDIT_FIELD_VAL]
        adc     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        cmp     dx, word ptr es:[bx+SND_START_HI]
        jg      L_09604
        jl      L_095FC
        cmp     ax, word ptr es:[bx+SND_START]
        jae     L_09604

L_095FC:
        mov     word ptr es:[bx+SND_START], ax
        mov     word ptr es:[bx+SND_START_HI], dx

L_09604:
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        les     bx, [SND_CURRENT]
        mov     word ptr es:[bx+SND_END], ax
        mov     word ptr es:[bx+SND_END_HI], dx
        leave
        retf

sample_str_scan_5:
        enter   8, 0
        push    si
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_LOOP]
        mov     dx, word ptr es:[bx+SND_LOOP_HI]
        add     ax, word ptr [G_EDIT_FIELD_VAL]
        adc     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        mov     word ptr [bp-4], ax
        mov     si, bx
        mov     word ptr [bp-2], dx
        mov     ax, word ptr es:[si+14h]
        mov     dx, word ptr es:[si+16h]
        sub     ax, word ptr es:[si+18h]
        sbb     dx, word ptr es:[si+1ah]
        add     ax, word ptr [bp-4]
        adc     dx, word ptr [bp-2]
        mov     word ptr es:[bx+SND_START], ax
        mov     word ptr es:[bx+SND_START_HI], dx
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        les     bx, [SND_CURRENT]
        mov     word ptr es:[bx+SND_END], ax
        mov     word ptr es:[bx+SND_END_HI], dx
        pop     si
        leave
        retf

; ? position minus start into [64D6h], picks one of three thunks on
; [9D82h]/[9D83h], then ui_field_edit.
ui_edit_position:
        enter   0ch, 0
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_END]
        mov     dx, word ptr es:[bx+SND_END_HI]
        sub     ax, word ptr es:[bx+SND_LOOP]
        sbb     dx, word ptr es:[bx+SND_LOOP_HI]
        mov     word ptr [G_EDIT_FIELD_VAL], ax
        mov     word ptr [G_EDIT_FIELD_VAL_HI], dx
        push    es
        push    bx
        nop
        push    cs
        call    sample_check_active
        or      ax, ax
        je      br_096B4
        mov     ax, word ptr [G_EDIT_FIELD_VAL]
        mov     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        sub     ax, ax
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-8], ax
        jmp     L_0973C

br_096B4:
        sub     ax, ax
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-0ch], ax
        cmp     byte ptr [LOOP_LEN_FIX], al
        je      br_09720
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_LENGTH]
        mov     dx, word ptr es:[bx+SND_LENGTH_HI]
        sub     ax, word ptr es:[bx+SND_LOOP]
        sbb     dx, word ptr es:[bx+SND_LOOP_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        cmp     byte ptr [TRIM_LEN_FIX], 0
        jne     br_096F0
        mov     word ptr [bp-8], sample_str_scan_4
        mov     word ptr [bp-6], TEXT2_SEG
        jmp     L_0973C
        db      90h

br_096F0:
        mov     ax, word ptr [G_EDIT_FIELD_VAL]
        mov     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        cmp     word ptr es:[bx+SND_START_HI], dx
        jg      br_09713
        jl      br_09705
        cmp     word ptr es:[bx+SND_START], ax
        jae     br_09713

br_09705:
        sub     ax, word ptr es:[bx+SND_START]
        sbb     dx, word ptr es:[bx+SND_START_HI]
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx

br_09713:
        mov     word ptr [bp-8], sample_str_scan_5
        mov     word ptr [bp-6], TEXT2_SEG
        jmp     L_0973C
        db      90h

br_09720:
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_END]
        mov     dx, word ptr es:[bx+SND_END_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     word ptr [bp-8], sample_str_scan_3
        mov     word ptr [bp-6], TEXT2_SEG

L_0973C:
        push    ds
        push    G_EDIT_FIELD_VAL
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    ui_field_edit
        leave
        retf    8
        db      00h

sample_data_far_5:
        enter   4, 0
        push    si
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_END]
        mov     dx, word ptr es:[bx+SND_END_HI]
        sub     ax, word ptr es:[bx+SND_LOOP]
        sbb     dx, word ptr es:[bx+SND_LOOP_HI]
        add     ax, word ptr [G_EDIT_FIELD_VAL]
        adc     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        cmp     dx, word ptr es:[bx+SND_START_HI]
        jg      br_097A5
        jl      L_0979D
        cmp     ax, word ptr es:[bx+SND_START]
        jae     br_097A5

L_0979D:
        mov     word ptr es:[bx+SND_START], ax
        mov     word ptr es:[bx+SND_START_HI], dx

br_097A5:
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        les     bx, [SND_CURRENT]
        mov     word ptr es:[bx+SND_END], ax
        mov     word ptr es:[bx+SND_END_HI], dx
        mov     ax, word ptr [G_EDIT_FIELD_VAL]
        mov     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        les     bx, [SND_CURRENT]
        mov     word ptr es:[bx+SND_LOOP], ax
        mov     word ptr es:[bx+SND_LOOP_HI], dx
        mov     ax, word ptr [SND_CURRENT]
        mov     dx, word ptr [SND_CURRENT+2]
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    0
        push    word ptr [G_EDIT_FIELD_VAL_HI]
        push    word ptr [G_EDIT_FIELD_VAL]
        callf   TEXT1_SEG:addr_calc_segment
        add     sp, 6
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+32h], ax
        mov     word ptr es:[si+34h], dx
        pop     si
        leave
        retf

; ?
sample_str_scan_6:
        enter   4, 0
        push    si
        mov     ax, word ptr [G_EDIT_FIELD_VAL]
        mov     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        les     bx, [SND_CURRENT]
        mov     word ptr es:[bx+SND_LOOP], ax
        mov     word ptr es:[bx+SND_LOOP_HI], dx
        mov     ax, word ptr [SND_CURRENT]
        mov     dx, word ptr [SND_CURRENT+2]
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    0
        push    word ptr [G_EDIT_FIELD_VAL_HI]
        push    word ptr [G_EDIT_FIELD_VAL]
        callf   TEXT1_SEG:addr_calc_segment
        add     sp, 6
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+32h], ax
        mov     word ptr es:[si+34h], dx
        pop     si
        leave
        retf

sample_active_check_3:
        enter   0ch, 0
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_LOOP]
        mov     dx, word ptr es:[bx+SND_LOOP_HI]
        mov     word ptr [G_EDIT_FIELD_VAL], ax
        mov     word ptr [G_EDIT_FIELD_VAL_HI], dx
        push    es
        push    bx
        nop
        push    cs
        call    sample_check_active
        or      ax, ax
        jne     br_098BE
        cmp     byte ptr [TRIM_LEN_FIX], 0
        jne     br_09894
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-8], ax
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_LENGTH]
        mov     dx, word ptr es:[bx+SND_LENGTH_HI]
        sub     ax, word ptr es:[bx+SND_END]
        sbb     dx, word ptr es:[bx+SND_END_HI]
        add     ax, word ptr es:[bx+SND_LOOP]
        adc     dx, word ptr es:[bx+SND_LOOP_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-0ch], sample_data_far_5
        mov     word ptr [bp-0ah], TEXT2_SEG
        jmp     X_098D6

br_09894:
        cmp     byte ptr [LOOP_LEN_FIX], 0
        jne     br_098BE
        sub     ax, ax
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-8], ax
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_END]
        mov     dx, word ptr es:[bx+SND_END_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-0ch], SAMPLE_STR_SCAN_6
        mov     word ptr [bp-0ah], TEXT2_SEG
        jmp     X_098D6

br_098BE:
        mov     ax, word ptr [G_EDIT_FIELD_VAL]
        mov     dx, word ptr [G_EDIT_FIELD_VAL_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        sub     ax, ax
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-0ch], ax

X_098D6:
        push    ds
        push    G_EDIT_FIELD_VAL
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    dx
        push    word ptr [bp-4]
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    ui_field_edit
        leave
        retf    8
        db      00h
L_09900:
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    voice_release_all_if
        retf

L_09522:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    sample_name_search
        pop     ds
        retf
        db      00h

X_0991C:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        push    1ah
        push    2
        nop
        push    cs
        call    timer_value_read_4
        push    0c7h
        push    1
        nop
        push    cs
        call    mode_dispatch_index
        mov     ax, word ptr [SND_CURRENT+2]
        or      ax, word ptr [SND_CURRENT]
        jne     br_0994A
        jmp     br_099DE
br_0994A:
        push    2
        push    2
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    sample_check_active
        or      ax, ax

        je      L_09964
        mov     ax, STR_ROM_3
        jmp     br_09967

L_09964:
        mov     ax, STR_SND_3

br_09967:
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_END]
        mov     dx, word ptr es:[bx+SND_END_HI]
        sub     ax, word ptr es:[bx+SND_LOOP]
        sbb     dx, word ptr es:[bx+SND_LOOP_HI]
        push    dx
        push    ax
        push    14h
        push    0ch
        nop
        push    cs
        call    display_draw_coord
        les     bx, [SND_CURRENT]
        push    word ptr es:[bx+SND_LOOP_HI]
        push    word ptr es:[bx+SND_LOOP]
        push    7ah
        push    0ch
        nop
        push    cs
        call    display_draw_coord
        push    0dah
        push    0ch
        les     bx, [SND_CURRENT]
        mov     al, byte ptr es:[bx+SND_LOOPON]
        cbw
        shl     ax, 2
        add     ax, TBL_OFF_ON_LABELS
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_END]
        mov     dx, word ptr es:[bx+SND_END_HI]
        mov     cx, ax
        mov     si, dx
        sub     ax, word ptr es:[bx+SND_LOOP]
        sbb     dx, word ptr es:[bx+SND_LOOP_HI]
        push    dx
        push    ax
        push    si
        push    cx
        nop
        push    cs
        call    cmd_exec_caller

br_099DE:
        nop
        push    cs
        call    field_redraw
        nop
        push    cs
        call    cmd_ratio_calc
        pop     ds
        pop     si
        retf
        db      00h

display_draw_pair:
        enter   4, 0
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_LOOP_FINE
        callf   TEXT1_SEG:disp_list_run
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_END]
        mov     dx, word ptr es:[bx+SND_END_HI]
        sub     ax, word ptr es:[bx+SND_LOOP]
        sbb     dx, word ptr es:[bx+SND_LOOP_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    dx
        push    ax
        nop
        push    cs
        call    cmd_write_caller
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    0b5h
        push    0ch
        nop
        push    cs
        call    display_draw_coord
        les     bx, [SND_CURRENT]
        push    word ptr es:[bx+SND_LOOP_HI]
        push    word ptr es:[bx+SND_LOOP]
        push    0b5h
        push    15h
        nop
        push    cs
        call    display_draw_coord
        push    0cdh
        push    1fh
        mov     al, byte ptr [LOOP_LEN_FIX]
        cbw
        mov     cx, ax
        shl     ax, 2
        add     ax, cx
        add     ax, TBL_LOOP_LEN_MODE_LABELS
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        push    0b5h
        push    28h
        nop
        push    cs
        call    mode_dispatch_index
        nop
        push    cs
        call    field_redraw
        pop     ds
        leave
        retf

L_09A72:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    32h
        push    TEXT2_SEG
        push    DISPLAY_DRAW_PAIR
        nop
        push    cs
        call    install_handler
        pop     ds
        retf
        db      00h

X_09A88:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    32h
        push    TEXT2_SEG
        push    L_09A72
        nop
        push    cs
        call    install_handler
        nop
        push    cs
        call    edit_range_select
        pop     ds
        retf

fit_to_length_paint:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_FIT_TO_LENGTH
        callf   TEXT1_SEG:disp_list_run
        pop     ds
        retf
        db      00h

track_data_far:
        enter   4, 0

L_09AB8:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     ax, word ptr [SND_CURRENT]
        mov     dx, word ptr [SND_CURRENT+2]
        mov     bx, ax
        mov     word ptr [bp-2], dx
        les     si, [SND_CURRENT]
        mov     ax, word ptr es:[si+SND_END]
        mov     dx, word ptr es:[si+SND_END_HI]
        sub     ax, word ptr es:[si+SND_START]
        sbb     dx, word ptr es:[si+SND_START_HI]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[bx+SND_LOOP], ax
        mov     word ptr es:[bx+SND_LOOP_HI], dx
        mov     ax, word ptr [SND_CURRENT]
        mov     dx, word ptr [SND_CURRENT+2]
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    0
        les     bx, [SND_CURRENT]
        push    word ptr es:[bx+SND_LOOP_HI]
        push    word ptr es:[bx+SND_LOOP]
        callf   TEXT1_SEG:addr_calc_segment
        add     sp, 6
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+32h], ax
        mov     word ptr es:[si+34h], dx
        callf   TEXT1_SEG:fit_to_length_cancel
        pop     ds
        pop     si
        leave
        retf

X_09B20:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     ax, word ptr [SND_CURRENT+2]
        or      ax, word ptr [SND_CURRENT]
        je      br_09B49
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    sample_check_active
        or      ax, ax
        jne     br_09B49
        push    ds
        push    TBL_WINKEYS_FIT_TO_LENGTH
        callf   TEXT1_SEG:win_keys_merge
br_09B49:
        pop     ds
        retf
        db      90h
track_block_copy:
        enter   2, 0
        push    di
        push    si
        les     di, [bp+8]
        push    ds
        lds     si, [bp+0ch]
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
        mov     si, ax
        mov     bx, word ptr [bp+0ch]
loop_09B78:
        mov     di, bx
        mov     es, word ptr [bp+0eh]
        add     di, si
        cmp     byte ptr es:[di], 20h
        je      br_09B8B
        inc     si
        cmp     si, 0fh
        jl      loop_09B78
br_09B8B:
        mov     bx, word ptr [bp+0ch]
        mov     al, byte ptr [bp+6]
        mov     byte ptr es:[bx+si], al
        inc     si
        cmp     si, 10h
        jge     tgt_09BB2
        mov     ax, 2020h
        les     bx, [bp+0ch]
        mov     cx, 10h
        sub     cx, si
        mov     dx, cx
        lea     di, [bx+si]
        shr     cx, 1
        rep stosw
        jae     L_09BB0
        stosb

L_09BB0:
        add     si, dx

tgt_09BB2:
        les     bx, [bp+0ch]
        mov     byte ptr es:[bx+si], 0
        pop     si
        pop     di
        leave
        retf    0ah
        db      00h

zone_range_clamp:
        mov     ax, word ptr [SND_CURRENT+2]
        or      ax, word ptr [SND_CURRENT]
        jne     X_09BDE
        sub     ax, ax
        mov     word ptr [ZONE_END_HI], ax
        mov     word ptr [G_ZONE_END], ax
        mov     word ptr [G_ZONE_START_HI], ax
        mov     word ptr [G_ZONE_START], ax
        mov     word ptr [G_ZONE_LEN_HI], ax
        mov     word ptr [G_ZONE_LEN], ax
        retf

X_09BDE:
        mov     ax, word ptr [G_ZONE_END]
        mov     dx, word ptr [ZONE_END_HI]
        les     bx, [SND_CURRENT]
        cmp     word ptr es:[bx+SND_LENGTH_HI], dx
        jg      X_09C06
        jl      X_09BF7
        cmp     word ptr es:[bx+SND_LENGTH], ax
        jae     X_09C06

X_09BF7:
        mov     ax, word ptr es:[bx+1ch]
        mov     dx, word ptr es:[bx+1eh]
        mov     word ptr [G_ZONE_END], ax
        mov     word ptr [ZONE_END_HI], dx

X_09C06:
        mov     ax, word ptr [G_ZONE_START]
        mov     dx, word ptr [G_ZONE_START_HI]
        cmp     word ptr es:[bx+1eh], dx
        jg      L_09C2A
        jl      X_09C1B
        cmp     word ptr es:[bx+1ch], ax
        jae     L_09C2A

X_09C1B:
        mov     ax, word ptr es:[bx+1ch]
        mov     dx, word ptr es:[bx+1eh]
        mov     word ptr [G_ZONE_START], ax
        mov     word ptr [G_ZONE_START_HI], dx

L_09C2A:
        mov     ax, word ptr [G_ZONE_END]
        mov     dx, word ptr [ZONE_END_HI]
        sub     ax, word ptr [G_ZONE_START]
        sbb     dx, word ptr [G_ZONE_START_HI]
        mov     word ptr [G_ZONE_LEN], ax
        mov     word ptr [G_ZONE_LEN_HI], dx
        retf
        db      00h

tgt_09C42:
        cmp     byte ptr [ZONE_LEN_FIX], 0
        je      br_09C60
        mov     ax, word ptr [G_ZONE_START]
        mov     dx, word ptr [G_ZONE_START_HI]
        add     ax, word ptr [G_ZONE_LEN]
        adc     dx, word ptr [G_ZONE_LEN_HI]
        mov     word ptr [G_ZONE_END], ax
        mov     word ptr [ZONE_END_HI], dx
        retf

br_09C60:
        mov     ax, word ptr [G_ZONE_START]
        mov     dx, word ptr [G_ZONE_START_HI]
        cmp     word ptr [ZONE_END_HI], dx
        jg      br_09C7C
        jl      br_09C75
        cmp     word ptr [G_ZONE_END], ax
        jae     br_09C7C

br_09C75:
        mov     word ptr [G_ZONE_END], ax
        mov     word ptr [ZONE_END_HI], dx

br_09C7C:
        mov     ax, word ptr [G_ZONE_END]
        mov     dx, word ptr [ZONE_END_HI]
        sub     ax, word ptr [G_ZONE_START]
        sbb     dx, word ptr [G_ZONE_START_HI]
        mov     word ptr [G_ZONE_LEN], ax
        mov     word ptr [G_ZONE_LEN_HI], dx
        retf
        db      00h
; the ZONE START field editor: range and thunk into ui_field_edit.

ui_edit_zone_start:
        enter   4, 0
        cmp     byte ptr [ZONE_LEN_FIX], 0
        jne     br_09CAE
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_LENGTH]
        mov     dx, word ptr es:[bx+SND_LENGTH_HI]
        jmp     br_09CC2
        db      90h

br_09CAE:
        les     bx, [SND_CURRENT]
        mov     ax, word ptr es:[bx+SND_LENGTH]
        mov     dx, word ptr es:[bx+SND_LENGTH_HI]
        sub     ax, word ptr [G_ZONE_LEN]
        sbb     dx, word ptr [G_ZONE_LEN_HI]

br_09CC2:
        push    ds
        push    G_ZONE_START
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    0
        push    0
        push    dx
        push    ax
        push    TEXT2_SEG
        push    tgt_09C42
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    ui_field_edit
        leave
        retf    8
        db      00h
L_09CE8:
        cmp     byte ptr [ZONE_LEN_FIX], 0
        je      X_09D06
        mov     ax, word ptr [G_ZONE_END]
        mov     dx, word ptr [ZONE_END_HI]
        sub     ax, word ptr [G_ZONE_LEN]
        sbb     dx, word ptr [G_ZONE_LEN_HI]
        mov     word ptr [G_ZONE_START], ax
        mov     word ptr [G_ZONE_START_HI], dx
        retf

X_09D06:
        mov     ax, word ptr [G_ZONE_START]
        mov     dx, word ptr [G_ZONE_START_HI]
        cmp     word ptr [ZONE_END_HI], dx
        jg      X_09D29
        jl      X_09D1B
        cmp     word ptr [G_ZONE_END], ax
        jae     X_09D29

X_09D1B:
        mov     ax, word ptr [G_ZONE_END]
        mov     dx, word ptr [ZONE_END_HI]
        mov     word ptr [G_ZONE_START], ax
        mov     word ptr [G_ZONE_START_HI], dx

X_09D29:
        mov     ax, word ptr [G_ZONE_END]
        mov     dx, word ptr [ZONE_END_HI]
        sub     ax, word ptr [G_ZONE_START]
        sbb     dx, word ptr [G_ZONE_START_HI]
        mov     word ptr [G_ZONE_LEN], ax
        mov     word ptr [G_ZONE_LEN_HI], dx
        retf
; the ZONE END field editor: range and thunk into ui_field_edit.
ui_edit_zone_end:
        enter   4, 0
        cmp     byte ptr [ZONE_LEN_FIX], 0
        je      br_09D60
        mov     ax, word ptr [G_ZONE_END]
        mov     dx, word ptr [ZONE_END_HI]
        sub     ax, word ptr [G_ZONE_START]
        sbb     dx, word ptr [G_ZONE_START_HI]
        mov     word ptr [bp-2], dx
        jmp     X_09D65
        db      90h

br_09D60:
        sub     ax, ax
        mov     word ptr [bp-2], ax

X_09D65:
        push    ds
        push    G_ZONE_END
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp-2]
        push    ax
        les     bx, [SND_CURRENT]
        push    word ptr es:[bx+SND_LENGTH_HI]
        push    word ptr es:[bx+SND_LENGTH]
        push    TEXT2_SEG
        push    L_09CE8
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    ui_field_edit
        leave
        retf    8

zone_start_fine_key_33:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    sample_name_search
        pop     ds
        retf
        db      00h

zone_start_fine_paint:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        push    1ah
        push    2
        nop
        push    cs
        call    timer_value_read_4
        push    0c7h
        push    1
        nop
        push    cs
        call    mode_dispatch_index
        mov     ax, word ptr [SND_CURRENT+2]
        or      ax, word ptr [SND_CURRENT]
        je      X_09E27
        push    2
        push    2
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    sample_check_active
        or      ax, ax
        je      L_09DE6
        mov     ax, STR_ROM_4
        jmp     br_09DE9

L_09DE6:
        mov     ax, STR_SND_4

br_09DE9:
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        push    word ptr [G_ZONE_START_HI]
        push    word ptr [G_ZONE_START]
        push    1ah
        push    0ch
        nop
        push    cs
        call    display_draw_coord
        push    word ptr [ZONE_END_HI]
        push    word ptr [G_ZONE_END]
        push    7ah
        push    0ch
        nop
        push    cs
        call    display_draw_coord
        push    word ptr [G_ZONE_START_HI]
        push    word ptr [G_ZONE_START]
        push    word ptr [ZONE_END_HI]
        push    word ptr [G_ZONE_END]
        nop
        push    cs
        call    cmd_exec_caller

X_09E27:
        push    0d4h
        push    0ch
        ZS_HOOK_VIEW_VALUE
        cbw
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        add     ax, ax
        ZS_HOOK_VIEW_TABLE
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        nop
        push    cs
        call    field_redraw
        nop
        push    cs
        call    cmd_ratio_calc
        pop     ds
        retf

L_09E4E:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_ZONE_START_FINE
        callf   TEXT1_SEG:disp_list_run
        push    word ptr [G_ZONE_START_HI]
        push    word ptr [G_ZONE_START]
        nop
        push    cs
        call    cmd_write_caller
        push    word ptr [G_ZONE_START_HI]
        push    word ptr [G_ZONE_START]
        push    0b5h
        push    0ch
        nop
        push    cs
        call    display_draw_coord
        push    word ptr [G_ZONE_LEN_HI]
        push    word ptr [G_ZONE_LEN]
        push    0b5h
        push    15h
        nop
        push    cs
        call    display_draw_coord
        push    0cdh
        push    1fh
        mov     al, byte ptr [ZONE_LEN_FIX]
        cbw
        mov     cx, ax
        shl     ax, 2
        add     ax, cx
        add     ax, TBL_LOOP_LEN_MODE_LABELS
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        push    0b5h
        push    28h
        nop
        push    cs
        call    mode_dispatch_index
        nop
        push    cs
        call    field_redraw
        pop     ds
        retf
        db      00h

L_09EBA:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    32h
        push    TEXT2_SEG
        push    L_09E4E
        nop
        push    cs
        call    install_handler
        pop     ds
        retf
        db      00h

X_09ED0:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    32h
        push    TEXT2_SEG
        push    L_09EBA
        nop
        push    cs
        call    install_handler
        nop
        push    cs
        call    edit_range_select
        pop     ds
        retf

X_09EEA:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_ZONE_END_FINE
        callf   TEXT1_SEG:disp_list_run
        push    word ptr [ZONE_END_HI]
        push    word ptr [G_ZONE_END]
        nop
        push    cs
        call    cmd_write_caller
        push    word ptr [ZONE_END_HI]
        push    word ptr [G_ZONE_END]
        push    0b5h
        push    0ch
        nop
        push    cs
        call    display_draw_coord
        push    word ptr [G_ZONE_LEN_HI]
        push    word ptr [G_ZONE_LEN]
        push    0b5h
        push    15h
        nop
        push    cs
        call    display_draw_coord
        push    0cdh
        push    1fh
        mov     al, byte ptr [ZONE_LEN_FIX]
        cbw
        mov     cx, ax
        shl     ax, 2
        add     ax, cx
        add     ax, TBL_LOOP_LEN_MODE_LABELS
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        push    0b5h
        push    28h
        nop
        push    cs
        call    mode_dispatch_index
        nop
        push    cs
        call    field_redraw
        pop     ds
        retf
        db      00h

X_09F56:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    32h
        push    TEXT2_SEG
        push    X_09EEA
        nop
        push    cs
        call    install_handler
        pop     ds
        retf
        db      00h

X_09F6C:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    32h
        push    TEXT2_SEG
        push    X_09F56
        nop
        push    cs
        call    install_handler
        nop
        push    cs
        call    edit_range_select
        pop     ds
        retf

zone_edit_paint:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_ZONE_EDIT
        callf   TEXT1_SEG:disp_list_run
        push    5bh
        push    11h
        mov     al, 19h
        imul    byte ptr [ZONE_EDIT_ACTION]
        ZS_HOOK_ACTION_LABELS
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        mov     al, byte ptr [ZONE_EDIT_ACTION]
        cbw
        or      ax, ax
        je      br_09FC0
        dec     ax
        je      br_09FF0
        dec     ax
        jl      br_0A026
        jo      br_0A026
        ZS_HOOK_EDIT_TEXT

br_09FC0:
        push    43h
        push    1eh
        push    ds
        push    STR_NEW_NAME
        nop
        push    cs
        call    cmd_dispatch_1E
        push    79h
        push    1eh
        push    ds
        push    TBL_SOUND_NAMES
        nop
        push    cs
        call    cmd_dispatch_1E
        cmp     byte ptr [G_PLAY_MODE], 0
        je      br_0A026
        push    43h
        push    27h
        push    word ptr [PTR_STR_PRESS_ENTER_SEG]
        push    word ptr [PTR_STR_PRESS_ENTER]
        jmp     br_0A021
        db      90h

br_09FF0:
        push    37h
        push    23h
        push    ds
        push    STR_INSERT_SND
        nop
        push    cs
        call    cmd_dispatch_1E
        push    79h
        push    23h
        push    word ptr [FP_SND_SECONDARY_SEG]
        push    word ptr [FP_SND_SECONDARY]
        jmp     br_0A021
        db      90h

br_0A00C:
        push    49h
        push    1ch
        push    ds
        push    STR_PRESSING_DO_IT
        nop
        push    cs
        call    cmd_dispatch_1E
        push    49h
        push    25h
        push    ds
        push    STR_SELECTED_EDIT

br_0A021:
        nop
        push    cs
        call    cmd_dispatch_1E

br_0A026:
        nop
        push    cs
        call    field_redraw
        pop     ds
        retf
        db      00h

zone_edit_up:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     byte ptr [G_PLAY_MODE], 0
        nop
        push    cs
        call    field_edit_disable
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    sample_check_active
        or      ax, ax
        je      br_0A05E
        push    ds
        push    G_EDIT_FIELD_VAL
        xor     al, al
        mov     byte ptr [ZONE_EDIT_ACTION], al
        mov     byte ptr [G_EDIT_FIELD_VAL], al
        push    ax
        jmp     L_0A064

br_0A05E:
        push    ds
        push    ZONE_EDIT_ACTION
        ZS_HOOK_ACTION_MAX

L_0A064:
        push    5bh
        push    11h
        push    19h
        push    0
        push    0
        nop
        push    cs
        call    voice_trigger_full
        nop
        push    cs
        call    X_02D4A
        pop     ds
        retf

zone_edit_down:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [ZONE_EDIT_ACTION]
        cbw
        or      ax, ax
        je      br_0A08E
        dec     ax
        je      X_0A0A2
        pop     ds
        retf
        db      90h

br_0A08E:
        mov     byte ptr [G_PLAY_MODE], 1
        push    ds
        push    TBL_SOUND_NAMES
        push    79h
        push    1eh
        callf   TEXT1_SEG:far_call_wrapper_1
        pop     ds
        retf

X_0A0A2:
        mov     byte ptr [G_PLAY_MODE], 1
        push    ds
        push    FP_SND_SECONDARY
        push    0
        push    79h
        push    23h
        push    0
        push    0
        callf   TEXT1_SEG:far_035F2
        pop     ds
        retf

zone_edit_cancel:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        callf   TEXT1_SEG:zone_screen_enter
        pop     ds
        retf
        db      00h

X_0A0CA:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     ax, word ptr [SND_CURRENT+2]
        or      ax, word ptr [SND_CURRENT]
        je      X_0A115
        push    cx
        push    P_3AE4+2
        callf   TEXT1_SEG:win_keys_merge
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    voice_release_all_if
        push    ds
        push    TBL_SOUND_NAMES
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        push    7ah
        nop
        push    cs
        call    track_block_copy
        mov     ax, word ptr [SND_CURRENT]
        mov     dx, word ptr [SND_CURRENT+2]
        mov     word ptr [FP_SND_SECONDARY], ax
        mov     word ptr [FP_SND_SECONDARY_SEG], dx
        nop
        push    cs
        call    zone_edit_up

X_0A115:
        pop     ds
        retf
        db      90h

X_0A118:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_08010
        push    ds
        push    DL_SOUND_PARAMS
        callf   TEXT1_SEG:disp_list_run
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        push    1ah
        push    2
        nop
        push    cs
        call    timer_value_read_4
        push    0c7h
        push    1
        nop
        push    cs
        call    mode_dispatch_index
        mov     ax, word ptr [SND_CURRENT+2]
        or      ax, word ptr [SND_CURRENT]
        jne     X_0A153
        jmp     NEAR X_0A1F5

X_0A153:
        push    2
        push    2
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    sample_check_active
        or      ax, ax
        je      L_0A16E
        mov     ax, STR_ZONE_ROM_LBL
        jmp     SHORT X_0A171
        db      90h

L_0A16E:
        mov     ax, STR_ZONE_SND_LBL

X_0A171:
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        push    31h
        push    13h
        les     bx, [SND_CURRENT]
        sub     ah, ah
        mov     al, byte ptr es:[bx+SND_LEVEL]
        push    0
        push    ax
        push    3
        nop
        push    cs
        call    draw_unsigned_value
        push    2bh
        push    23h
        les     bx, [SND_CURRENT]
        mov     al, byte ptr es:[bx+SND_TUNE]
        cbw
        cwd
        push    dx
        push    ax
        push    3
        nop
        push    cs
        call    draw_signed_value
        push    0d3h
        push    11h
        les     bx, [SND_CURRENT]
        mov     al, byte ptr es:[bx+SND_FIELD_25]
        cbw
        cwd
        push    dx
        push    ax
        push    2
        nop
        push    cs
        call    draw_unsigned_value
        push    0d3h
        push    1ah
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        push    0
        nop
        push    cs
        call    sample_calc_offset
        push    ax
        nop
        push    cs
        call    timer_value_read_5
        push    0d3h
        push    23h
        les     bx, [SND_CURRENT]
        push    es
        push    bx
        mov     al, byte ptr es:[bx+SND_TUNE]
        cbw
        push    ax
        nop
        push    cs
        call    sample_calc_offset
        push    ax
        nop
        push    cs
        call    timer_value_read_5

X_0A1F5:
        nop
        push    cs
        call    field_redraw
        pop     ds
        retf

midi_realtime_stop:
        enter   4, 0
        push    di
        push    si
        xor     ax, ax
        mov     cx, 0fh
        mov     di, PTR_MIDI_STATE
        push    ds
        pop     es
        rep stosw
        mov     cx, 100h
        mov     di, P_8D44
        rep stosw
        push    10h
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    ds
        push    P_8F4E
        callf   TEXT1_SEG:__fstrncpy
        add     sp, 0ah
        nop
        push    cs
        call    far_059BC
        mov     byte ptr [B_8F5F], al
        mov     al, byte ptr [bp+0eh]
        mov     byte ptr [B_8F60], al
        mov     si, TBL_SOUND_NAMES
        mov     word ptr [bp-2], 80h
        mov     dx, word ptr [bp-2]
loop_0A243:
        mov     byte ptr [si], 0
        add     si, 11h
        dec     dx
        jne     loop_0A243
        cmp     word ptr [bp+10h], 0
        je      br_0A261
        nop
        push    cs
        call    X_05972
        nop
        push    cs
        call    sample_data_load_1
        mov     byte ptr [B_8F5F], 0

br_0A261:
        cmp     byte ptr [B_8F5F], 0
        jge     br_0A272
        mov     word ptr [G_ERRNO], ERR_PROG_DIR_FULL
        jmp     br_0A312
        db      90h

br_0A272:
        mov     al, byte ptr [B_8F5F]
        cbw
        push    ax
        nop
        push    cs
        call    program_select_wrapper
        or      ax, ax
        jne     br_0A28A
        mov     word ptr [G_ERRNO], ERR_NO_MEMORY
        jmp     br_0A312
        db      90h

br_0A28A:
        mov     al, byte ptr [B_8F5F]
        cbw
        mov     bx, ax
        shl     bx, 2
        mov     ax, word ptr [bx+PGM_TABLE]
        mov     dx, word ptr [bx+PGM_TABLE+2]
        mov     word ptr [PTR_MIDI_STATE], ax
        mov     word ptr [PTR_MIDI_STATE+2], dx
        mov     word ptr [G_ERRNO], ERR_FILE_DAMAGED
        push    2
        lea     ax, [bp-4]
        push    ss
        push    ax
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 2
        jne     br_0A312
        cmp     byte ptr [bp-4], 7
        jne     br_0A312
        mov     al, byte ptr [bp-3]
        sub     ah, ah
        or      ax, ax
        je      T2_br_0A2DC
        dec     ax
        je      tgt_0A2F2
        sub     ax, 3
        je      tgt_0A308
        mov     word ptr [G_ERRNO], ERR_NEWER_OS
        jmp     br_0A312
        db      90h
T2_br_0A2DC:
        cmp     word ptr [bp+0ah], 1200h
        jne     br_0A312
        cmp     word ptr [bp+0ch], 0
        jne     br_0A312
        nop
        push    cs
        call    far_0A6FA
        pop     si
        pop     di
        leave
        retf
tgt_0A2F2:
        cmp     word ptr [bp+0ah], 101dh
        jne     br_0A312
        cmp     word ptr [bp+0ch], 0
        jne     br_0A312
        nop
        push    cs
        call    far_0A682
        pop     si
        pop     di
        leave
        retf
tgt_0A308:
        nop
        push    cs
        call    range_seq_caller
        pop     si
        pop     di
        leave
        retf
        db      90h

br_0A312:
        callf   TEXT1_SEG:int2F_dispatch_10
        nop
        push    cs
        call    err_msg_report
        xor     ax, ax
        pop     si
        pop     di
        leave
        retf

range_seq_caller:
        enter   6, 0
        push    si
        mov     si, word ptr [PTR_MIDI_STATE]
        mov     dx, word ptr [PTR_MIDI_STATE+2]
        mov     word ptr [bp-2], dx
        push    2
        lea     ax, [bp-6]
        push    ss
        push    ax
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 2
        jne     br_0A396
        push    ds
        push    TBL_SOUND_NAMES
        push    1
        imul    ax, word ptr [bp-6], 11h
        push    ax
        push    1
        push    880h
        nop
        push    cs
        call    range_process
        or      ax, ax
        je      br_0A396
        push    word ptr [bp-2]
        push    si
        nop
        push    cs
        call    range_smem_setup
        or      ax, ax
        je      br_0A396
        callf   TEXT1_SEG:int2F_dispatch_10
        mov     ax, si
        mov     dx, word ptr [bp-2]
        add     ax, 2
        push    dx
        push    ax
        push    ds
        push    P_8F4E
        nop
        push    cs
        call    bcd_convert
        mov     al, byte ptr [B_8F5F]
        cbw
        push    ax
        nop
        push    cs
        call    program_select
        nop
        push    cs
        call    sample_process_1
        pop     si
        leave
        retf

br_0A396:
        callf   TEXT1_SEG:int2F_dispatch_10
        mov     word ptr [G_ERRNO], ERR_FILE_DAMAGED
        nop
        push    cs
        call    err_msg_report
        xor     ax, ax
        pop     si
        leave
        retf
        db      00h

range_smem_setup:
        enter   4, 0
        push    si
        push    2
        lea     ax, [bp-2]
        push    ss
        push    ax
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 2
        je      br_0A3CC
loop_0A3C5:
        xor     ax, ax
        pop     si
        leave
        retf    4
br_0A3CC:
        cmp     word ptr [bp-2], 2
        jb      loop_0A3C5
        mov     si, word ptr [bp+6]
        mov     ax, si
        mov     dx, word ptr [bp+8]
        add     ax, 2
        push    dx
        push    ax
        push    1
        mov     ax, word ptr [bp-2]
        sub     ax, 2
        push    ax
        push    1
        push    1ch
        nop
        push    cs
        call    range_process
        or      ax, ax
        je      loop_0A3C5
        push    2
        lea     ax, [bp-4]
        push    ss
        push    ax
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 2
        jne     loop_0A3C5
        push    ax
        lea     ax, [bp-2]
        push    ss
        push    ax
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 2
        jne     loop_0A3C5
        mov     ax, si
        mov     dx, word ptr [bp+8]
        add     ax, 1eh
        push    dx
        push    ax
        push    word ptr [bp-4]
        push    word ptr [bp-2]
        nop
        push    cs
        call    range_io_handler
        or      ax, ax
        je      loop_0A3C5
        push    2
        lea     ax, [bp-2]
        push    ss
        push    ax
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 2
        je      br_0A44C
        jmp     loop_0A3C5
br_0A44C:
        mov     ax, si
        mov     dx, word ptr [bp+8]
        add     ax, 75eh
        push    dx
        push    ax
        push    word ptr [bp-4]
        push    word ptr [bp-2]
        push    40h
        push    6
        nop
        push    cs
        call    range_process
        or      ax, ax
        jne     br_0A46C
        jmp     loop_0A3C5
br_0A46C:
        push    2
        lea     ax, [bp-2]
        push    ss
        push    ax
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 2
        je      br_0A483
        jmp     loop_0A3C5
br_0A483:
        mov     ax, si
        mov     dx, word ptr [bp+8]
        add     ax, 8deh
        push    dx
        push    ax
        push    1
        push    word ptr [bp-2]
        push    1
        push    40h
        nop
        push    cs
        call    range_process
        or      ax, ax
        jne     br_0A4A2
        jmp     loop_0A3C5
br_0A4A2:
        push    2
        lea     ax, [bp-4]
        push    ss
        push    ax
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 2
        je      br_0A4B9
        jmp     loop_0A3C5
br_0A4B9:
        push    ax
        lea     ax, [bp-2]
        push    ss
        push    ax
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 2
        je      br_0A4CF
        jmp     loop_0A3C5
br_0A4CF:
        mov     ax, si
        mov     dx, word ptr [bp+8]
        add     ax, 91eh
        push    dx
        push    ax
        push    word ptr [bp-4]
        push    word ptr [bp-2]
        push    2
        push    48h
        nop
        push    cs
        call    range_process
        or      ax, ax
        jne     br_0A4EF
        jmp     loop_0A3C5
br_0A4EF:
        push    2
        lea     ax, [bp-4]
        push    ss
        push    ax
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 2
        je      br_0A506
        jmp     loop_0A3C5
br_0A506:
        push    ax
        lea     ax, [bp-2]
        push    ss
        push    ax
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 2
        je      br_0A51C
        jmp     loop_0A3C5
br_0A51C:
        mov     ax, si
        mov     dx, word ptr [bp+8]
        add     ax, 9aeh
        push    dx
        push    ax
        push    word ptr [bp-4]
        push    word ptr [bp-2]
        push    4
        push    0ch
        nop
        push    cs
        call    range_process
        cmp     ax, 1
        sbb     ax, ax
        inc     ax
        pop     si
        leave
        retf    4

range_proc_setup:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+6]
        or      si, si
        je      br_0A557

loop_0A54B:
        callf   TEXT1_SEG:int2F_call_fn5
        or      ax, ax
        jl      br_0A557
        dec     si
        jne     loop_0A54B

br_0A557:
        pop     si
        leave
        retf    2

range_process:
        enter   0eh, 0
        push    di
        push    si
        mov     bx, word ptr [bp+0ah]
        mov     ax, word ptr [bp+0eh]
        mov     dx, word ptr [bp+10h]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     cx, word ptr [bp+8]
        cmp     cx, word ptr [bp+0ch]
        jle     br_0A57C
        mov     cx, word ptr [bp+0ch]
br_0A57C:
        mov     ax, word ptr [bp+0ch]
        sub     ax, cx
        mov     word ptr [bp-0eh], ax
        mov     di, word ptr [bp+6]
        cmp     di, bx
        jle     br_0A58D
        mov     di, bx
br_0A58D:
        mov     ax, bx
        sub     ax, di
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-8], 0
        or      cx, cx
        jle     br_0A5D6
        mov     word ptr [bp-0ch], cx
        mov     si, word ptr [bp-4]
loop_0A5A3:
        push    di
        push    word ptr [bp-2]
        push    si
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, di
        jne     br_0A5CE
        push    word ptr [bp-0ah]
        nop
        push    cs
        call    range_proc_setup
        mov     ax, word ptr [bp+6]
        add     si, ax
        mov     ax, word ptr [bp-0ch]
        inc     word ptr [bp-8]
        cmp     word ptr [bp-8], ax
        jl      loop_0A5A3
        jmp     br_0A5D6

br_0A5CE:
        xor     ax, ax
        pop     si
        pop     di
        leave
        retf    0ch

br_0A5D6:
        mov     ax, word ptr [bp-0eh]
        imul    word ptr [bp+0ah]
        push    ax
        nop
        push    cs
        call    range_proc_setup
        mov     ax, 1
        pop     si
        pop     di
        leave
        retf    0ch
        db      00h
range_io_handler:
        enter   0eh, 0
        push    di
        push    si
        mov     bx, word ptr [bp+6]
        mov     cx, word ptr [bp+8]
        mov     di, cx
        mov     ax, cx
        cmp     di, 40h
        jle     br_0A604
        mov     di, 40h
br_0A604:
        sub     ax, di
        mov     word ptr [bp-0eh], ax
        mov     ax, bx
        sub     ax, 19h
        sbb     cx, cx
        and     ax, cx
        add     ax, 19h
        mov     word ptr [bp-8], ax
        mov     cx, bx
        sub     cx, ax
        mov     word ptr [bp-0ah], cx
        mov     word ptr [bp-6], 0
        or      di, di
        jle     br_0A66C
        mov     word ptr [bp-0ch], di
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        add     ax, 4
        mov     word ptr [bp-2], dx
        mov     si, word ptr [bp-6]
        mov     di, ax
loop_0A63C:
        push    word ptr [bp-8]
        push    word ptr [bp-2]
        push    di
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, word ptr [bp-8]
        jne     br_0A664
        push    word ptr [bp-0ah]
        nop
        push    cs
        call    range_proc_setup
        add     di, 1dh
        inc     si
        cmp     word ptr [bp-0ch], si
        jg      loop_0A63C
        jmp     br_0A66C
        db      90h

; clamps a count to <= 0x40 and a start offset to >= 0x19, then loops.
br_0A664:
        xor     ax, ax
        pop     si
        pop     di
        leave
        retf    8

br_0A66C:
        mov     ax, word ptr [bp-0eh]
        imul    word ptr [bp+6]
        push    ax
        nop
        push    cs
        call    range_proc_setup
        mov     ax, 1
        pop     si
        pop     di
        leave
        retf    8
        db      00h
far_0A682:
        push    880h
        push    ds
        push    TBL_SOUND_NAMES
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 880h
        jne     br_0A6E6
        push    79bh
        push    ds
        push    P_64DA
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 79bh
        jne     br_0A6E6
        callf   TEXT1_SEG:int2F_dispatch_10
        push    word ptr [PTR_MIDI_STATE+2]
        push    word ptr [PTR_MIDI_STATE]
        push    ds
        push    P_64DA
        nop
        push    cs
        call    lcd_region_copy
        mov     ax, word ptr [PTR_MIDI_STATE]
        mov     dx, word ptr [PTR_MIDI_STATE+2]
        add     ax, 2
        push    dx
        push    ax
        push    ds
        push    P_8F4E
        nop
        push    cs

        call    bcd_convert
        mov     al, byte ptr [B_8F5F]
        cbw
        push    ax
        nop
        push    cs
        call    program_select
        nop
        push    cs
        call    sample_process_1
        retf
        db      90h

br_0A6E6:
        callf   TEXT1_SEG:int2F_dispatch_10
        mov     word ptr [G_ERRNO], ERR_FILE_DAMAGED
        nop
        push    cs
        call    err_msg_report
        xor     ax, ax
        retf
        db      00h

far_0A6FA:
        push    880h
        push    ds
        push    TBL_SOUND_NAMES
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 880h
        jne     br_0A772
        push    200h
        push    ds
        push    P_9842
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 200h
        jne     br_0A772
        push    77eh
        push    ds
        push    P_64DA
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 77eh
        jne     br_0A772
        callf   TEXT1_SEG:int2F_dispatch_10
        push    word ptr [PTR_MIDI_STATE+2]
        push    word ptr [PTR_MIDI_STATE]
        push    ds
        push    P_64DA
        nop
        push    cs
        call    lcd_buffer_copy
        mov     ax, word ptr [PTR_MIDI_STATE]
        mov     dx, word ptr [PTR_MIDI_STATE+2]
        add     ax, 2
        push    dx
        push    ax
        push    ds
        push    P_8F4E
        nop
        push    cs
        call    bcd_convert
        mov     al, byte ptr [B_8F5F]
        cbw
        push    ax
        nop
        push    cs
        call    program_select
        nop
        push    cs
        call    sample_process_1
        retf
        db      90h

br_0A772:
        callf   TEXT1_SEG:int2F_dispatch_10
        mov     word ptr [G_ERRNO], ERR_FILE_DAMAGED
        nop
        push    cs
        call    err_msg_report
        xor     ax, ax
        retf
        db      00h

sample_process_setup:
        enter   1ah, 0
        push    di
        push    si
        cmp     word ptr [bp+6], 0
        jne     L_0A795
        jmp     br_0A84E

L_0A795:
        push    word ptr [bp+0eh]
        push    word ptr [bp+0ch]
        callf   TEXT1_SEG:sample_name_lookup
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     L_0A7BA
        if      FW_VERSION = 172
        cmp     word ptr [G_ERRNO], ERR_NO_MEMORY
        jne     L_0A7BA
        xor     ax, ax
        cwd
        pop     si
        pop     di
        leave
        retf    0ah
        db      90h

L_0A7BA:
        mov     ax, word ptr [bp-2]
        or      ax, si
        jne     br_0A7CA
        endif
        mov     si, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        mov     word ptr [bp-2], dx
        if      FW_VERSION = 172

br_0A7CA:
        else
L_0A7BA:
        endif
        mov     ax, word ptr [bp-2]
        or      ax, si
        je      br_0A7D4
        jmp     br_0A8E9

br_0A7D4:
        nop
        push    cs
        call    int2F_bcd_wrapper
        cmp     ax, 2
        jne     t2_br_0A7E1
        jmp     br_0A8E9
T2_br_0A7E1:
        push    ds
        lea     si, [bp-1ah]
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
        push    ds
        mov     di, STR_EXT_SND_2
        lea     si, [bp-1ah]
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
        lea     ax, [bp-1ah]
        push    ss
        push    ax
        nop
        push    cs
        call    memcpy_far_handler
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
loop_0A847:
        mov     si, word ptr [bp-4]
        jmp     br_0A8E9
        db      90h

br_0A84E:
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     br_0A8CE
        nop
        push    cs
        call    int2F_bcd_wrapper
        cmp     ax, 2
        je      br_0A8CE
        push    ds
        lea     si, [bp-1ah]
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
        push    ds
        mov     di, STR_EXT_SND_3
        lea     si, [bp-1ah]
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
        lea     ax, [bp-1ah]
        push    ss
        push    ax
        nop
        push    cs
        call    memcpy_far_handler
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
br_0A8CE:
        mov     ax, word ptr [bp-2]
        or      ax, word ptr [bp-4]
        je      br_0A8D9
        jmp     loop_0A847

br_0A8D9:
        push    word ptr [bp+0eh]
        push    word ptr [bp+0ch]
        callf   TEXT1_SEG:sample_name_lookup
        mov     si, ax
        mov     word ptr [bp-2], dx

br_0A8E9:
        mov     ax, si
        mov     dx, word ptr [bp-2]
        pop     si
        pop     di
        leave
        retf    0ah

sample_process_1:
        enter   12h, 0
        push    di
        push    si
        cmp     word ptr [W_8F4C], 80h
        jl      loop_0A905
        jmp     br_0A9CF

loop_0A905:
        imul    bx, word ptr [W_8F4C], 11h
        add     bx, TBL_SOUND_NAMES
        cmp     byte ptr [bx], 0
        jne     br_0A916
        jmp     br_0A99E

br_0A916:
        push    ds
        push    bx
        mov     word ptr [bp-12h], bx
        mov     word ptr [bp-10h], ds
        nop
        push    cs
        call    sample_ptr_access
        mov     si, ax
        mov     word ptr [bp-0ch], dx
        push    word ptr [bp-10h]
        push    word ptr [bp-12h]
        push    dx
        push    ax
        mov     al, byte ptr [B_8F60]
        cbw
        push    ax
        nop
        push    cs
        call    sample_process_setup
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-4], dx
        or      dx, ax
        je      tgt_0A9B0
        mov     ax, word ptr [bp-0ch]
        or      ax, si
        je      tgt_0A96E
        mov     ax, word ptr [bp-0ch]
        cmp     word ptr [bp-6], si
        jne     tgt_0A958
        cmp     word ptr [bp-4], ax
        je      tgt_0A96E
tgt_0A958:
        push    ax
        push    si
        push    word ptr [bp-4]
        push    word ptr [bp-6]
        nop
        push    cs
        call    rep_memcpy_handler
        push    word ptr [bp-0ch]
        push    si
        nop
        push    cs
        call    sample_validate_ptr

tgt_0A96E:
        xor     si, si
        mov     cx, 40h
        mov     di, word ptr [bp-6]

loop_0A976:
        les     bx, [PTR_MIDI_STATE]
        add     bx, si
        mov     al, byte ptr es:[bx+MPC_STATE_param_hi]
        cbw
        cmp     ax, word ptr [W_8F4C]
        jne     br_0A998
        mov     ax, word ptr [bp-4]
        mov     bx, word ptr [PTR_MIDI_STATE]
        add     bx, si
        mov     word ptr es:[bx+MPC_STATE_range_hi], di
        mov     word ptr es:[bx+MPC_STATE_param_lo], ax

br_0A998:
        add     si, 1dh
        dec     cx
        jne     loop_0A976

br_0A99E:
        inc     word ptr [W_8F4C]
        cmp     word ptr [W_8F4C], 80h
        jge     br_0A9AD
        jmp     loop_0A905

br_0A9AD:
        jmp     br_0A9CF
        db      90h

tgt_0A9B0:
        cmp     word ptr [G_ERRNO], ERR_CANT_OPEN
        jne     br_0A9CA
        push    TEXT2_SEG
        push    sample_process_1
        nop
        push    cs
        call    sample_proc_helper
        mov     ax, 1
        pop     si
        pop     di
        leave
        retf
        db      90h

br_0A9CA:
        nop
        push    cs
        call    err_msg_report

br_0A9CF:
        xor     ax, ax
        pop     si
        pop     di
        leave
        retf
        db      00h

midi_realtime_stop2:
        enter   4, 0
        push    di
        mov     word ptr [G_ERRNO], ERR_FILE_DAMAGED
        xor     ax, ax
        mov     cx, 0fh
        mov     di, PTR_MIDI_STATE
        push    ds
        pop     es
        rep stosw
        mov     cx, 100h
        mov     di, P_8D44
        rep stosw
        mov     bx, TBL_SOUND_NAMES
        mov     word ptr [bp-2], 80h
        mov     dx, word ptr [bp-2]
loop_0AA00:
        mov     byte ptr [bx], 0
        add     bx, 11h
        dec     dx
        jne     loop_0AA00
        push    2
        lea     ax, [bp-4]
        push    ss
        push    ax
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 2
        jne     loop_t2_0AA68
        cmp     byte ptr [bp-4], 0ah
        jne     loop_t2_0AA68
        nop
        push    cs
        call    sample_data_load_1
        mov     al, byte ptr [bp-3]
        sub     ah, ah
        or      ax, ax
        je      tgt_0AA42
        dec     ax
        je      tgt_0AA58
        sub     ax, 3
        je      tgt_0AA60
        mov     word ptr [G_ERRNO], ERR_NEWER_OS
        jmp     loop_t2_0AA68
        db      90h
tgt_0AA42:
        cmp     word ptr [bp+0ah], 0bd93h
        jne     loop_t2_0AA68
        cmp     word ptr [bp+0ch], 0
        jne     loop_t2_0AA68
; ? int40_bios_wrapper @0x16211 is mid-instruction
        callf   TEXT1_SEG:X_08B84
        pop     di
        leave
        retf
        db      90h

tgt_0AA58:
        callf   TEXT1_SEG:X_08A86
        pop     di
        leave
        retf

tgt_0AA60:
        nop
        push    cs
        call    smem_init_handler
        pop     di
        leave
        retf

loop_t2_0AA68:
        callf   TEXT1_SEG:int2F_dispatch_10
        nop
        push    cs
        call    err_msg_report
        xor     ax, ax
        pop     di
        leave
        retf
        db      00h

smem_init_handler:
        if      FW_VERSION = 172
        enter   8, 0
        else
        enter   6, 0
        endif
        push    di
        push    si
        if      FW_VERSION = 172
; ? no entry point at 0x16242 -- mid-instruction
        mov     word ptr [bp-2], 0
        else
        xor     di, di
        endif
        mov     word ptr [G_ERRNO], ERR_FILE_DAMAGED
        if      FW_VERSION = 172
        mov     ax, B_8A0E
        mov     di, ax
        mov     si, B_9D5A
        push    ds
        pop     es
        mov     cx, 19h
        rep movsw
        movsb
        endif
        push    2
        if      FW_VERSION = 172
        lea     ax, [bp-6]
        else
        lea     ax, [bp-4]
        endif
        push    ss
        push    ax
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 2
        je      L_0AAB0
        jmp     br_0AC3E

L_0AAB0:
        push    ds
        push    TBL_SOUND_NAMES
        push    1
        if      FW_VERSION = 172
        imul    ax, word ptr [bp-6], 11h
        else
        imul    ax, word ptr [bp-4], 11h
        endif
        push    ax
        push    1
        push    880h
        nop
        push    cs
        call    range_process
        or      ax, ax
        jne     L_0AACC
        jmp     br_0AC3E

L_0AACC:
        push    2
        if      FW_VERSION = 172
        lea     ax, [bp-8]
        else
        lea     ax, [bp-6]
        endif
        push    ss
        push    ax
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 2
        je      L_0AAE3
        jmp     br_0AC3E

L_0AAE3:
        if      FW_VERSION = 172
        cmp     word ptr [bp-8], ax
        else
        cmp     word ptr [bp-6], ax
        endif
        jae     L_0AAEB
        jmp     br_0AC3E

L_0AAEB:
        push    ds
        push    B_8A0E
        push    1
        if      FW_VERSION = 172
        push    word ptr [bp-8]
        else
        push    word ptr [bp-6]
        endif
        push    1
        if      FW_VERSION = 172
        push    33h
        else
        push    32h
        endif
        nop
        push    cs
        call    range_process
        or      ax, ax
        jne     br_0AB04
        jmp     br_0AC3E

br_0AB04:
        push    2
        if      FW_VERSION = 172
        lea     ax, [bp-6]
        else
        lea     ax, [bp-4]
        endif
        push    ss
        push    ax
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 2
        je      L_0AB1B
        jmp     br_0AC3E

L_0AB1B:
        push    ax
        if      FW_VERSION = 172
        lea     ax, [bp-8]
        else
        lea     ax, [bp-6]
        endif
        push    ss
        push    ax
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 2
        je      br_0AB31
        jmp     br_0AC3E

br_0AB31:
        push    ds
        push    P_9DA0
        if      FW_VERSION = 150
        push    word ptr [bp-4]
        endif
        push    word ptr [bp-6]
        if      FW_VERSION = 172
        push    word ptr [bp-8]
        endif
        push    40h
        push    6
        nop
        push    cs
        call    range_process
        or      ax, ax
        jne     L_0AB4B
        jmp     br_0AC3E

L_0AB4B:
        push    2
        if      FW_VERSION = 172
        lea     ax, [bp-8]
        else
        lea     ax, [bp-6]
        endif
        push    ss
        push    ax
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 2
        je      br_0AB62
        jmp     br_0AC3E

br_0AB62:
        push    ds
        push    P_8F78
        push    1
        if      FW_VERSION = 172
        push    word ptr [bp-8]
        else
        push    word ptr [bp-6]
        endif
        push    1
        push    40h
        nop
        push    cs
        call    range_process
        or      ax, ax
        jne     L_0AB7B
        jmp     br_0AC3E

L_0AB7B:
        push    2
        if      FW_VERSION = 172
        lea     ax, [bp-6]
        else
        lea     ax, [bp-4]
        endif
        push    ss
        push    ax
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 2
        je      br_0AB92
        jmp     br_0AC3E

br_0AB92:
        nop
        push    cs
        call    X_05972
        xor     si, si
        if      FW_VERSION = 172
        cmp     word ptr [bp-6], si
        else
        cmp     word ptr [bp-4], si
        endif
        jle     L_0ABF8
        if      FW_VERSION = 172
        mov     di, word ptr [bp-2]

        endif
L_0ABA1:
        push    2
        if      FW_VERSION = 172
        lea     ax, [bp-4]
        else
        lea     ax, [bp-2]
        endif
        push    ss
        push    ax
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 2
        if      FW_VERSION = 172
        je      L_0ABB8
        jmp     br_0AC3E

L_0ABB8:
        cmp     word ptr [bp-4], 18h
        else
        jne     br_0AC3E
        cmp     word ptr [bp-2], 18h
        endif
        jl      br_0ABC3
        if      FW_VERSION = 172
        mov     word ptr [bp-4], 17h

        else
        mov     word ptr [bp-2], 17h
        endif
br_0ABC3:
        if      FW_VERSION = 172
        push    word ptr [bp-4]
        else
        push    word ptr [bp-2]
        endif
        nop
        push    cs
        call    program_select_wrapper
        or      ax, ax
        je      L_0AC38
        if      FW_VERSION = 172
        mov     bx, word ptr [bp-4]
        else
        mov     bx, word ptr [bp-2]
        endif
        shl     bx, 2
        push    word ptr [bx+PGM_TABLE+2]
        push    word ptr [bx+PGM_TABLE]
        nop
        push    cs
        call    range_smem_setup
        or      ax, ax
        je      br_0AC3E
        if      FW_VERSION = 172
        cmp     word ptr [bp-4], 0
        else
        cmp     word ptr [bp-2], 0
        endif
        jne     L_0ABEF
        mov     di, 1

L_0ABEF:
        inc     si
        if      FW_VERSION = 172
        cmp     word ptr [bp-6], si
        jg      L_0ABA1
        jmp     br_0ABFB
        db      90h

        else
        cmp     word ptr [bp-4], si
        jg      L_0ABA1
        endif
L_0ABF8:
        if      FW_VERSION = 172
        mov     di, word ptr [bp-2]
        endif
br_0ABFB:
        callf   TEXT1_SEG:int2F_dispatch_10
        or      di, di
        jne     br_0AC0A
        push    di
        nop
        push    cs
        call    smem_dma_init

br_0AC0A:
        if      FW_VERSION = 172
        mov     ax, B_9D5A
        mov     di, ax
        else
        mov     di, B_9D5A
        endif
        mov     si, B_8A0E
        if      FW_VERSION = 172
        push    ds
        pop     es
        else
        mov     ax, ds
        mov     es, ax
        endif
        mov     cx, 19h
        rep movsw
        if      FW_VERSION = 172
        movsb
        mov     al, byte ptr [P_9D89]
        cbw
        push    ax
        nop
        push    cs
        call    cmd_exec_1E_ext
        endif
        mov     al, byte ptr [PGM_SLOT]
        cbw
        push    ax
        nop
        push    cs
        call    program_select
        nop
        push    cs
        call    sample_proc_wrapper
        pop     si
        pop     di
        leave
        retf
        db      90h

L_0AC38:
        mov     word ptr [G_ERRNO], ERR_NO_MEMORY

br_0AC3E:
        callf   TEXT1_SEG:int2F_dispatch_10
        nop
        push    cs
        call    err_msg_report
        xor     ax, ax
        pop     si
        pop     di
        leave
        retf

sample_proc_wrapper:
        enter   10h, 0
        push    di
        push    si
        cmp     word ptr [W_8F4C], 80h
        jl      loop_0AC5F
        jmp     lcd_line_copy_164D3

loop_0AC5F:
        imul    bx, word ptr [W_8F4C], 11h
        add     bx, TBL_SOUND_NAMES
        cmp     byte ptr [bx], 0
        je      br_0ACE1
        push    ds
        push    bx
        push    0
        push    0
        push    0
        nop
        push    cs
        call    sample_process_setup
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        je      br_0ACF4
        mov     bx, PGM_TABLE
        mov     word ptr [bp-0eh], 18h
loop_0AC8C:
        les     si, [bx]
        mov     word ptr [PTR_MIDI_STATE], si
        mov     word ptr [PTR_MIDI_STATE+2], es
        cmp     word ptr es:[si], 2
        jbe     br_0ACD9
        mov     word ptr [bp-8], bx
        xor     cx, cx
        mov     word ptr [bp-6], 40h
        mov     si, cx
        mov     cx, word ptr [bp-6]
        mov     di, word ptr [bp-0ch]

loop_0ACAE:
        les     bx, [PTR_MIDI_STATE]
        add     bx, si
        mov     al, byte ptr es:[bx+MPC_STATE_param_hi]
        cbw
        cmp     ax, word ptr [W_8F4C]
        jne     br_0ACD0
        mov     ax, word ptr [bp-0ah]
        mov     bx, word ptr [PTR_MIDI_STATE]
        add     bx, si
        mov     word ptr es:[bx+MPC_STATE_range_hi], di
        mov     word ptr es:[bx+MPC_STATE_param_lo], ax

br_0ACD0:
        add     si, 1dh
        dec     cx
        jne     loop_0ACAE
        mov     bx, word ptr [bp-8]

br_0ACD9:
        add     bx, 4
        dec     word ptr [bp-0eh]
        jne     loop_0AC8C

br_0ACE1:
        inc     word ptr [W_8F4C]
        cmp     word ptr [W_8F4C], 80h
        jge     br_0ACF0
        jmp     loop_0AC5F

br_0ACF0:
        jmp     lcd_line_copy_164D3
        db      90h, 90h

br_0ACF4:
        cmp     word ptr [G_ERRNO], ERR_CANT_OPEN
        jne     br_0AD0E
        push    TEXT2_SEG
        push    sample_proc_wrapper
        nop
        push    cs
        call    sample_proc_helper
        mov     ax, 1
        pop     si
        pop     di
        leave
        retf
        db      90h

br_0AD0E:
        nop
        push    cs
        call    err_msg_report

lcd_line_copy_164D3:
        xor     ax, ax
        pop     si
        pop     di
        leave
        retf
        db      00h
lcd_line_copy:
        push    bp
        mov     bp, sp
        push    di
        push    si
        les     bx, [bp+0ah]
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        push    ds
        lea     di, [bx+4]
        mov     si, ax
        mov     ds, dx
        mov     cx, 0ch
        rep movsw
        pop     ds
        mov     bx, word ptr [bp+0ah]
        sub     ax, ax
        mov     byte ptr es:[bx+MPC_STATE_range_lo], al
        mov     word ptr es:[bx+2], ax
        mov     word ptr es:[bx], ax
        pop     si
        pop     di
        leave
        retf    8

_memcpy_4:
        push    bp
        mov     bp, sp
        push    di
        push    si
        les     bx, [bp+0ah]
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        push    ds
        lea     di, [bx+4]
        mov     si, ax
        mov     ds, dx
        mov     cx, 0ch
        rep movsw
        movsb
        pop     ds
        mov     bx, word ptr [bp+0ah]
        sub     ax, ax
        mov     word ptr es:[bx+2], ax
        mov     word ptr es:[bx], ax
        pop     si
        pop     di
        leave
        retf    8
        db      00h

lcd_region_helper:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+0ah]
        les     bx, [bp+6]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        mov     es, word ptr [bp+0ch]
        mov     word ptr es:[si], ax
        mov     word ptr es:[si+2], dx
        mov     byte ptr es:[si+4], 64h
        mov     byte ptr es:[si+5], 0
        pop     si
        leave
        retf    8
lcd_buffer_copy:
        enter   12h, 0
        push    di
        push    si
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        add     ax, 2
        mov     bx, word ptr [bp+6]
        mov     si, word ptr [bp+8]
        push    ds
        push    si
        mov     di, ax
        mov     si, bx
        mov     es, dx
        pop     ds
        mov     cx, 0dh
        rep movsw
        pop     ds
        mov     di, ax
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        dec     cx
        mov     word ptr [bp-2], cx
        cmp     cx, 10h
        jge     br_0ADF5
        mov     ax, 2020h
        mov     bx, word ptr [bp+0ah]
        mov     si, cx
        mov     cx, 10h
        sub     cx, si
        lea     di, [bx+si+2]
        shr     cx, 1
        rep stosw
        jae     br_0ADF5
        stosb
br_0ADF5:
        mov     bx, word ptr [bp+0ah]
        mov     byte ptr es:[bx+MPC_STATE_flag_12], 0
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     ax, 73eh
        push    ds
        lea     di, [bx+8deh]
        mov     si, ax
        mov     ds, dx
        mov     cx, 20h
        rep movsw
        pop     ds
        mov     ax, word ptr [bp+6]
        add     ax, 63eh
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        add     ax, 75eh
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     ax, 3eh
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     ax, word ptr [bp+0ah]
        mov     dx, word ptr [bp+0ch]
        add     ax, 1eh
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     word ptr [bp-12h], 40h
        mov     si, word ptr [bp-0ch]
        mov     di, word ptr [bp-10h]
lcd_region_copy_16619:
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    lcd_line_copy
        push    word ptr [bp-0eh]
        push    di
        push    word ptr [bp-0ah]
        push    si
        nop
        push    cs
        call    lcd_region_helper
        add     si, 4
        add     di, 6
        add     word ptr [bp-4], 18h
        add     word ptr [bp-8], 1dh
        dec     word ptr [bp-12h]
        jne     lcd_region_copy_16619
        pop     si
        pop     di
        leave
        retf    8
lcd_region_copy:
        enter   12h, 0
        push    di
        push    si
        les     bx, [bp+0ah]
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        push    ds
        lea     di, [bx+2]
        mov     si, ax
        mov     ds, dx
        mov     cx, 0dh
        rep movsw
        movsb
        pop     ds
        add     ax, 75bh
        mov     bx, word ptr [bp+0ah]
        push    ds
        lea     di, [bx+8deh]
        mov     si, ax
        mov     ds, dx
        mov     cx, 20h
        rep movsw
        pop     ds
        mov     ax, word ptr [bp+6]
        add     ax, 65bh
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        mov     ax, word ptr [bp+0ah]
        add     ax, 75eh
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], es
        mov     ax, word ptr [bp+6]
        add     ax, 1bh
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     ax, word ptr [bp+0ah]
        add     ax, 1eh
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], es
        mov     word ptr [bp-12h], 40h
        mov     si, word ptr [bp-0ch]
        mov     di, word ptr [bp-10h]
lcd_line_clear_166BE:
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    _memcpy_4
        push    word ptr [bp-0eh]
        push    di
        push    word ptr [bp-0ah]
        push    si
        nop
        push    cs
        call    lcd_region_helper
        add     si, 4
        add     di, 6
        add     word ptr [bp-4], 19h
        add     word ptr [bp-8], 1dh
        dec     word ptr [bp-12h]
        jne     lcd_line_clear_166BE
        pop     si
        pop     di
        leave
        retf    8
        db      00h
lcd_line_clear:
        enter   0ch, 0
        push    di
        push    si
        mov     di, word ptr [bp+0ah]
        mov     cx, word ptr [bp+6]
        mov     bx, cx
        mov     es, word ptr [bp+8]
        mov     al, byte ptr es:[bx+MPC_STATE_time_hi]
        mov     es, word ptr [bp+0ch]
        mov     byte ptr es:[di+16h], al
        mov     ax, es
        mov     es, word ptr [bp+8]
        mov     word ptr [bp-0ch], di
        mov     word ptr [bp-0ah], ax
        cmp     byte ptr es:[bx+17h], 2
        jne     L_0AF68
        mov     al, 1
        jmp     br_0AF6A

L_0AF68:
        xor     al, al

br_0AF6A:
        les     bx, [bp-0ch]
        mov     si, cx
        mov     byte ptr es:[bx+17h], al
        mov     es, word ptr [bp+8]
        cmp     byte ptr es:[si+18h], 2
        jne     L_0AF82
        mov     al, 1
        jmp     br_0AF84
        db      90h

L_0AF82:
        xor     al, al

br_0AF84:
        les     bx, [bp-0ch]
        mov     byte ptr es:[bx+MPC_STATE_pos_lo], al
        mov     es, word ptr [bp+8]
        cmp     byte ptr es:[si+19h], 2
        jne     L_0AF9A
        mov     al, 1
        jmp     br_0AF9C
        db      90h

L_0AF9A:
        xor     al, al

br_0AF9C:
        les     bx, [bp-0ch]
        mov     byte ptr es:[bx+19h], al
        mov     es, word ptr [bp+8]
        mov     al, byte ptr es:[si+1ah]
        les     bx, [bp-0ch]
        mov     byte ptr es:[bx+MPC_STATE_pos_hi], al
        mov     es, word ptr [bp+8]
        mov     al, byte ptr es:[si+1bh]
        les     bx, [bp-0ch]
        mov     byte ptr es:[bx+1bh], al
        mov     es, word ptr [bp+8]
        mov     al, byte ptr es:[si+1ch]
        les     bx, [bp-0ch]
        mov     byte ptr es:[bx+MPC_STATE_range_lo], al
        mov     ax, cx
        mov     dx, word ptr [bp+8]
        add     ax, 41h
        mov     si, ax
        mov     word ptr [bp-6], dx
        mov     word ptr [bp-2], P_9DA0
        mov     word ptr [bp-4], 40h
        mov     di, word ptr [bp-2]

lcd_cmd_wrapper_167A7:
        push    ds
        push    di
        push    word ptr [bp-6]
        push    si
        nop
        push    cs
        call    lcd_region_helper
        add     si, 4
        add     di, 6
        dec     word ptr [bp-4]
        jne     lcd_cmd_wrapper_167A7
        pop     si
        pop     di
        leave
        retf    8
        db      00h
lcd_cmd_wrapper:
        enter   8, 0
        push    di
        push    si
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     ax, 16h
        push    ds
        mov     di, PGM_SLOT
        mov     si, ax
        push    ds
        pop     es
        mov     ds, dx
        movsw
        movsw
        movsw
        movsb
        pop     ds
        mov     ax, word ptr [bp+6]
        add     ax, 15dh
        push    ds
        mov     di, B_9D77
        mov     si, ax
        push    ds
        pop     es
        mov     ds, dx
        mov     cx, 9
        rep movsw
        movsb
        pop     ds
        mov     ax, word ptr [bp+6]
        add     ax, 1dh
        mov     word ptr [bp-2], dx
        mov     word ptr [bp-6], P_9DA0
        mov     word ptr [bp-8], 40h
        mov     si, ax
        mov     di, word ptr [bp-6]

loop_0B051:
        push    ds
        push    di
        push    word ptr [bp-2]
        push    si
        nop
        push    cs
        call    lcd_region_helper
        add     si, 4
        add     di, 6
        dec     word ptr [bp-8]
        jne     loop_0B051
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     ax, 11dh
        push    ds
        mov     di, P_8F78
        mov     si, ax
        push    ds
        pop     es
        mov     ds, dx
        mov     cx, 20h
        rep movsw
        pop     ds
        if      FW_VERSION = 172
        mov     al, byte ptr [P_9D89]
        cbw
        push    ax
        nop
        push    cs
        call    cmd_exec_1E_ext
        endif
        pop     si
        pop     di
        leave
        retf    4

X_0B090:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        inc     word ptr [W_8F4C]
        push    cx
        push    DL_LOADING
        callf   TEXT1_SEG:disp_list_run
        callf   [W_8F48]
        or      ax, ax
        jne     L_0B0BB
        push    ds
        push    DL_CHANGE_DISK_MSG
        callf   TEXT1_SEG:disp_list_run
        push    3
        nop
        push    cs
        call    int43_wrapper

L_0B0BB:
        pop     ds
        retf
        db      00h

L_0B0BE:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        callf   TEXT1_SEG:int2F_dispatch_17
        or      ax, ax
        jne     br_0B0D8
        push    ds
        push    STR_CHANGE_DISK
        nop
        push    cs
        call    string_fill_stosb
        pop     ds
        retf

br_0B0D8:
        push    ds
        push    DL_LOADING
        callf   TEXT1_SEG:disp_list_run
        callf   [W_8F48]
        or      ax, ax
        jne     br_0B0F9
        push    ds
        push    P_3C0A
        callf   TEXT1_SEG:disp_list_run
        push    3
        nop
        push    cs
        call    int43_wrapper

br_0B0F9:
        pop     ds
        retf
        db      00h

; ?
sample_proc_helper:
        push    bp
        mov     bp, sp
        push    ds
        push    DL_CANT_FIND_FILE
        callf   TEXT1_SEG:disp_list_run
        mov     al, byte ptr [B_8F61]
        cbw
        mov     cx, ax
        shl     ax, 2
        add     ax, cx
        add     ax, P_3C0C
        push    ds
        push    ax
        callf   TEXT1_SEG:win_keys_merge
        nop
        push    cs
        call    int2F_bcd_wrapper
        or      ax, ax
        jne     br_0B13C
        push    ds
        push    P_3C5E
        callf   TEXT1_SEG:disp_list_run
        push    6
        push    TEXT2_SEG
        push    L_0B0BE
        nop
        push    cs
        call    install_handler

br_0B13C:
        push    79h
        push    0dh
        imul    ax, word ptr [W_8F4C], 11h
        add     ax, TBL_SOUND_NAMES
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        push    ds
        push    P_3CD1
        callf   TEXT1_SEG:disp_list_run
        mov     byte ptr [B_8F61], 1
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr [W_8F48], ax
        mov     word ptr [W_8F4A], dx
        leave
        retf    4
sample_data_copy:
        push    bp
        mov     bp, sp
        push    di
        push    si
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    sample_desc_init
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        push    ds
        mov     si, ax
        mov     ds, dx
        les     di, [bp+0ah]
        mov     cx, 10h
        rep movsw
        pop     ds
        mov     bx, word ptr [bp+0ah]
        sub     ax, ax

; ?
        mov     word ptr es:[bx+SND_LOOP_HI], ax
        mov     word ptr es:[bx+SND_LOOP], ax
        mov     word ptr es:[bx+SND_FIELD_32_HI], ax
        mov     word ptr es:[bx+SND_FIELD_32], ax
        mov     byte ptr es:[bx+SND_FIELD_25], 1
        pop     si
        pop     di
        leave
        retf    8

; ?
_memcpy_5:
        push    bp
        mov     bp, sp
        push    di
        push    si
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    sample_desc_init
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        push    ds
        mov     si, ax
        mov     ds, dx
        les     di, [bp+0ah]
        mov     cx, 14h
        rep movsw
        pop     ds
        push    0
        mov     es, dx
        mov     bx, ax
        push    word ptr es:[bx+SND_LOOP_HI]
        push    word ptr es:[bx+SND_LOOP]
        callf   TEXT1_SEG:addr_calc_segment
        add     sp, 6
        les     bx, [bp+0ah]
        mov     word ptr es:[bx+SND_FIELD_32], ax
        mov     word ptr es:[bx+SND_FIELD_32_HI], dx
        pop     si
        pop     di
        leave
        retf    8
        db      00h

; ?
sample_access_caller:
        push    bp
        mov     bp, sp
        mov     word ptr [G_ERRNO], ERR_UNKNOWN
        cmp     word ptr [bp+6], 0
        je      br_0B224
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        nop
        push    cs
        call    sample_ptr_access
        or      dx, ax
        je      br_0B224
        mov     word ptr [G_ERRNO], ERR_NAME_IN_USE
        jmp     br_0B233
br_0B224:
        nop
        push    cs
        call    sample_caller_setup
        or      ax, ax
        jne     X_0B23A
        mov     word ptr [G_ERRNO], ERR_SOUND_DIR_FULL

br_0B233:
        xor     ax, ax
        leave
        retf    6
        db      90h

X_0B23A:
        mov     ax, 1
        leave
        retf    6
        db      00h

file_exists_paint:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_RENAME_FILE
        callf   TEXT1_SEG:disp_list_run
        push    71h
        push    13h
        push    word ptr [FP_LOADED_SND_SEG]
        push    word ptr [FP_LOADED_SND]
        nop
        push    cs
        call    cmd_dispatch_1E
        push    2fh
        push    1ch
        push    word ptr [PTR_STR_PRESS_ENTER_SEG]
        push    word ptr [PTR_STR_PRESS_ENTER]
        nop
        push    cs
        call    cmd_dispatch_1E
        nop
        push    cs
        call    field_redraw
        pop     ds
        retf

X_0B27A:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    word ptr [FP_LOADED_SND_SEG]
        push    word ptr [FP_LOADED_SND]
        nop
        push    cs
        call    lcd_set_cursor
        pop     ds
        retf
        db      00h

X_0B290:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    word ptr [FP_LOADED_SND_SEG]
        push    word ptr [FP_LOADED_SND]
        nop
        push    cs
        call    voice_release_all_if
        pop     ds
        retf
        db      00h

X_0B2A6:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        mov     al, byte ptr [G_NOTE_IN]
        cmp     al, byte ptr [G_PAD_NOTE_BASE]
        je      X_0B2BD
        mov     byte ptr [G_PAD_NOTE_BASE], al
        nop
        push    cs

        call    cmd_far_stub2

X_0B2BD:
        pop     ds
        retf
        db      00h

X_0B2C0:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_LOAD_A_SOUND
        callf   TEXT1_SEG:disp_list_run
        push    47h
        push    15h
        push    word ptr [FP_LOADED_SND_SEG]
        push    word ptr [FP_LOADED_SND]
        nop
        push    cs
        call    cmd_dispatch_1E
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        push    ax
        push    83h
        push    27h
        nop
        push    cs
        call    timer_value_read_3
        nop
        push    cs
        call    field_redraw
        pop     ds
        retf
        db      00h
; ? two handler sets through INT 2Eh and INT 30h, the 32-bit argument
; latched, then the last pad note at (83h,27h).
ui_enter_pad_assign:
        push    bp
        mov     bp, sp
        push    ds
        push    P_3E48
        callf   TEXT1_SEG:disp_list_run
        mov     byte ptr [G_NOTE_CAPTURE], 1
        mov     byte ptr [PAD_INPUT_MODE], 1
        push    ds
        push    P_3E20
        callf   TEXT1_SEG:win_keys_merge
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     word ptr [FP_LOADED_SND], ax
        mov     word ptr [FP_LOADED_SND_SEG], dx
        push    ds
        push    G_NOTE_IN
        push    83h
        push    27h
        push    1
        nop
        push    cs
        call    timer_value_read_1
        leave
        retf    4
sample_ptr_caller:
        enter   0ch, 0
        push    di
        push    si
        mov     di, word ptr [bp+6]
        callf   TEXT1_SEG:int2F_dispatch_10
        mov     ax, word ptr [bp+8]
        push    ax
        push    di
        mov     word ptr [bp-0ch], di
        mov     word ptr [bp-0ah], ax
        nop
        push    cs
        call    sample_ptr_access
        mov     si, ax
        mov     word ptr [bp-6], dx
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        callf   TEXT1_SEG:sample_name_lookup
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     br_0B376
        nop
        push    cs
        call    err_msg_report

loop_0B370:
        xor     ax, ax
        pop     si
        pop     di
        leave
        retf

br_0B376:
        mov     cx, ax
        mov     ax, word ptr [bp-6]
        cmp     si, cx
        jne     br_0B390
        cmp     ax, word ptr [bp-2]
        jne     br_0B390
        push    ds
        push    STR_NAME_IN_USE
        nop
        push    cs
        call    string_fill_stosb
        jmp     loop_0B370
        db      90h

br_0B390:
        mov     ax, word ptr [bp-2]
        push    ax
        push    cx
        nop
        push    cs
        call    ui_enter_pad_assign
        mov     ax, 1
        pop     si
        pop     di
        leave
        retf
        db      00h
midi_calc_timing:
        enter   6, 0
        push    si
        mov     si, word ptr [bp+6]
        lea     ax, [bp-6]
        push    ss
        push    ax
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    si
        nop
        push    cs

        call    mem_io_handler
        or      ax, ax
        jne     br_0B3C2
        jmp     br_0B496

br_0B3C2:
        push    word ptr [bp-6]
        callf   TEXT1_SEG:smem_free
        mov     bx, word ptr [bp-6]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL]
        mov     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    dx
        push    ax
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        nop
        push    cs
        call    far_memop_caller
        cmp     ax, word ptr [bp+8]
        jne     br_0B439
        cmp     dx, word ptr [bp+0ah]
        jne     br_0B439
        or      si, si
        je      br_0B442
        push    0
        push    2
        mov     bx, word ptr [bp-6]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        push    word ptr [bx+SMEM_POOL_LEN_HI]
        push    word ptr [bx+SMEM_POOL_LEN]
        callf   TEXT1_SEG:__aFldiv
        add     ax, word ptr [bp-4]
        adc     dx, word ptr [bp-2]
        push    dx
        push    ax
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        nop
        push    cs
        call    far_memop_caller
        cmp     ax, word ptr [bp+8]
        jne     br_0B439
        cmp     dx, word ptr [bp+0ah]
        je      br_0B442

br_0B439:
        mov     word ptr [G_ERRNO], ERR_FILE_DAMAGED
        jmp     br_0B496
        db      90h
br_0B442:
        mov     bx, word ptr [bp-6]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        push    word ptr [bx+SMEM_POOL_LEN_HI]
        push    word ptr [bx+SMEM_POOL_LEN]
        callf   TEXT1_SEG:smem_alloc
        mov     word ptr [bp-6], ax
        cmp     ax, 0ffffh
        je      br_0B488
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        mov     bx, word ptr [bp-6]
        mov     cx, bx
        shl     bx, 2
        add     bx, cx
        add     bx, bx
        cmp     word ptr [bx+SMEM_POOL], ax
        jne     br_0B488
        cmp     word ptr [bx+SMEM_POOL_BASE_HI], dx
        jne     br_0B488
        mov     ax, cx
        pop     si
        leave
        retf    6

br_0B488:
        mov     word ptr [G_ERRNO], ERR_INTERNAL
        push    word ptr [bp-6]
        callf   TEXT1_SEG:smem_free

br_0B496:
        mov     ax, 0ffffh
        pop     si
        leave
        retf    6

; clamps a 32-bit param against 1:5888h; AL=78h (120) at or above.
midi_out_io:
        push    bp
        mov     bp, sp
        cmp     word ptr [bp+8], 1
        jb      br_0B4B6
        ja      br_0B4B0
        cmp     word ptr [bp+6], 5888h
        jb      br_0B4B6

br_0B4B0:
        mov     al, 78h
        leave
        retf    4

br_0B4B6:
        cmp     word ptr [bp+8], 0
        jne     br_0B4CA
        cmp     word ptr [bp+6], 5622h
        ja      br_0B4CA
        mov     al, 88h
        leave
        retf    4
        db      90h
br_0B4CA:
        push    0
        push    0ac44h
        push    0
        push    64h
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   TEXT1_SEG:__aFlmul
        add     ax, 5622h
        adc     dx, 0
        push    dx
        push    ax
        callf   TEXT1_SEG:__aFuldiv
        mov     bx, ax

        mov     al, byte ptr [bx+P_3E48]
        leave
        retf    4
        db      00h

; INT 4Dh (sample control).
int4D_sample_wrapper:
        push    bp
        mov     bp, sp
        push    si
        push    bp
        push    ds
        int     4dh                       ; Sample control
        pop     ds
        pop     bp
        mov     ax, si
        mov     dx, es
        pop     si
        leave
        retf
        db      00h

; ? searches 60-entry word-pair table at DS:0708h (not port I/O)
midi_out_io2:
        push    bp
        mov     bp, sp
        push    di
        mov     di, word ptr [bp+6]
        mov     cx, 0ff88h
        mov     bx, P_0708

loop_0B515:
        cmp     word ptr [bx], di
        jg      br_0B51E
        cmp     word ptr [bx+2], di
        jg      br_0B52A

br_0B51E:
        add     bx, 2
        inc     cx
        cmp     cx, 3ch
        jl      loop_0B515
        jmp     br_0B532
        db      90h

br_0B52A:
        mov     ax, cx
        pop     di
        leave
        retf    2
        db      90h

br_0B532:
        xor     ax, ax
        pop     di
        leave
        retf    2
        db      00h

; clamp: returns the param unchanged if <= 1.
midi_out_io3:
        push    bp
        mov     bp, sp
        push    di
        mov     cx, word ptr [bp+6]
        cmp     cx, 1
        ja      br_0B54E
        mov     ax, cx
        pop     di
        leave
        retf    2
        db      90h

br_0B54E:
        mov     bx, cx
        shr     bx, 1
        mov     di, 9

loop_0B555:
        mov     ax, word ptr [bp+6]
        sub     dx, dx
        div     bx
        add     ax, bx
        shr     ax, 1
        mov     bx, ax
        dec     di
        jne     loop_0B555
        pop     di
        leave
        retf    2
midi_io_chain:
        push    bp
        mov     bp, sp
        cmp     word ptr [bp+6], 0
        je      br_0B582
        mov     ax, word ptr [bp+8]
        add     ax, ax
        push    ax
        nop
        push    cs
        call    midi_out_io3
        leave
        retf    4
br_0B582:
        mov     bx, word ptr [bp+8]
        mov     ax, bx
        imul    bx
        inc     ax
        cwd
        sub     ax, dx
        sar     ax, 1
        leave
        retf    4
        db      00h
midi_string_handler:
        enter   12h, 0
        push    di
        push    si
        mov     al, byte ptr [bp+0eh]
        mov     byte ptr [B_56AA], al
        mov     ax, word ptr [bp+16h]
        mov     dx, word ptr [bp+18h]
        mov     word ptr [W_56A6], ax
        mov     word ptr [W_56A8], dx
        mov     byte ptr [B_56C0], 0
; on a non-zero first param, doubles the second and calls midi_out_io3.
        if      FW_VERSION = 172


L_0B5B4                         equ     $+2
        endif
        mov     si, P_56AB
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
        nop
        push    cs
        call    int4D_sample_wrapper
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        nop
        push    cs
        call    midi_string_setup
        or      ax, ax
        jne     br_0B5EE
loop_0B5E7:
        xor     ax, ax
        pop     si
        pop     di
        leave
        retf
        db      90h

br_0B5EE:
        cmp     byte ptr [G_SMEM_STATE_A], 2
        jne     T2_L_0B5FA
        mov     ax, STR_EXT_SET
        jmp     br_0B5FD

T2_L_0B5FA:
        mov     ax, STR_EXT_ST1

br_0B5FD:
        mov     cx, ds
        mov     di, ax
        mov     si, P_56AB
        mov     es, cx
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
        cmp     word ptr [bp+10h], 2
        jne     tgt_0B638
        nop
        push    cs
        call    tgt_0BC26
        pop     si
        pop     di
        leave
        retf
tgt_0B638:
        push    word ptr [bp+10h]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    midi_stop_helper
        mov     di, ax
        mov     word ptr [bp-6], dx
        mov     word ptr [FP_56C2], ax
        mov     word ptr [W_56C4], dx
        or      dx, ax
        je      loop_0B5E7
        mov     word ptr [bp-4], 0
        mov     word ptr [bp-8], ax
loop_0B65E:
        mov     bx, word ptr [bp-4]
        mov     al, byte ptr [bx+TBL_MPC60_PAD_SND]
        cbw
        mov     word ptr [bp-2], ax
        add     bx, word ptr [bp-0ch]
        mov     es, word ptr [bp-0ah]
        mov     cx, ax
        mov     al, byte ptr es:[bx]
        cbw
        mov     si, ax
        sub     si, 23h
        inc     cx
        jne     tgt_0B680
        jmp     br_0B795
tgt_0B680:
        imul    bx, word ptr [bp-2], 3bh
        mov     word ptr [bp-0eh], bx
        cmp     byte ptr [bx+TBL_MPC60_SND_HDR], 0
        jne     br_0B691
        jmp     br_0B795

br_0B691:
        cmp     byte ptr [G_SMEM_STATE_B], 0
        je      br_0B6A2
        mov     ax, word ptr [bx+TBL_5BDA]
        add     ax, word ptr [bx+TBL_5BDC]
        jmp     br_0B6AB

br_0B6A2:
        push    word ptr [bx+P_5BEA]
        nop
        push    cs
        call    midi_out_io2

br_0B6AB:
        mov     bx, di
        mov     es, word ptr [bp-6]
        imul    cx, si, PGM_PAD_STRIDE
        add     bx, cx
        mov     word ptr [bp-12h], bx
        mov     word ptr [bp-10h], es
        mov     word ptr es:[bx+PGM_PADS+PGM_PAD_TUNE], ax
        mov     bx, word ptr [bp-0eh]
        push    word ptr [bx+P_5BE6]
        push    1
        nop
        push    cs
        call    midi_io_chain
        les     bx, [bp-12h]
        if      FW_VERSION = 172
        mov     byte ptr es:[bx+PGM_PADS+PGM_PAD_ATTACK], al
        else
        mov     byte ptr es:[bx+2dh], al
        endif
        mov     bx, word ptr [bp-0eh]
        push    word ptr [bx+P_5BE8]
        push    1
        nop
        push    cs
        call    midi_io_chain
        les     bx, [bp-12h]
        if      FW_VERSION = 172
        mov     byte ptr es:[bx+PGM_PADS+PGM_PAD_DECAY], al
        else
        mov     byte ptr es:[bx+2eh], al
        endif
        cmp     byte ptr [G_SMEM_STATE_B], 0
        je      br_0B700
        mov     bx, word ptr [bp-0eh]
        mov     al, byte ptr [bx+TBL_5BED]
        les     bx, [bp-12h]
        if      FW_VERSION = 172
        mov     byte ptr es:[bx+PGM_PADS+PGM_PAD_V_LEVEL], al
        else
        mov     byte ptr es:[bx+35h], al
        endif
        jmp     br_0B708

br_0B700:
        les     bx, [bp-12h]
        if      FW_VERSION = 172
        mov     byte ptr es:[bx+PGM_PADS+PGM_PAD_V_LEVEL], 64h

        else
        mov     byte ptr es:[bx+35h], 64h
        endif
br_0B708:
        cmp     byte ptr [G_SMEM_STATE_B], 0
        je      br_0B726
        mov     bx, word ptr [bp-0eh]
        push    word ptr [bx+P_5BF0]
        push    1
        nop
        push    cs
        call    midi_io_chain
        les     bx, [bp-12h]
        if      FW_VERSION = 172
        mov     byte ptr es:[bx+PGM_PADS+PGM_PAD_V_ATTACK], al
        else
        mov     byte ptr es:[bx+36h], al
        endif
        jmp     br_0B72E

br_0B726:
        les     bx, [bp-12h]
        if      FW_VERSION = 172
        mov     byte ptr es:[bx+PGM_PADS+PGM_PAD_V_ATTACK], 0

        else
        mov     byte ptr es:[bx+36h], 0
        endif
br_0B72E:
        cmp     byte ptr [G_SMEM_STATE_B], 0
        je      br_0B74C
        mov     bx, word ptr [bp-0eh]
        push    word ptr [bx+P_5BF2]
        push    1
        nop
        push    cs
        call    midi_io_chain
        les     bx, [bp-12h]
        if      FW_VERSION = 172
        mov     byte ptr es:[bx+PGM_PADS+PGM_PAD_V_START], al
        else
        mov     byte ptr es:[bx+37h], al
        endif
        jmp     br_0B754

br_0B74C:
        les     bx, [bp-12h]
        mov     byte ptr es:[bx+PGM_PADS+PGM_PAD_V_START], 0
br_0B754:
        mov     al, 19h
        mov     bx, word ptr [bp-0eh]
        imul    byte ptr [bx+TBL_5BF5]
        cwd
        and     dx, 1fh
        add     ax, dx
        sar     ax, 5
        mov     bx, di
        mov     es, word ptr [bp-6]
        mov     cx, si
        add     cx, si
        add     cx, si
        add     cx, cx
        add     bx, cx
        mov     byte ptr es:[bx+PGM_MIX], al
        mov     al, 19h
        mov     cx, bx
        mov     bx, word ptr [bp-0eh]
        imul    byte ptr [bx+TBL_5BF6]
        cwd
        and     dx, 1fh
        add     ax, dx
        sar     ax, 5
        mov     bx, cx
        mov     byte ptr es:[bx+PGM_MIX+PGM_MIX_PAN], al
br_0B795:
        inc     word ptr [bp-4]
        cmp     word ptr [bp-4], 22h
        jge     br_0B7A1
        jmp     loop_0B65E
br_0B7A1:
        mov     si, word ptr [bp-8]
        les     bx, [bp-0ch]
        mov     al, byte ptr es:[bx]
        cbw
        mov     di, ax
        sub     di, 23h
        imul    bx, di, PGM_PAD_STRIDE
        mov     ax, word ptr [bp-6]
        add     bx, si
        mov     es, ax
        mov     byte ptr es:[bx+PGM_PADS+PGM_PAD_MODE], 3
        mov     bx, si
        imul    cx, di, PGM_PAD_STRIDE
        add     bx, cx
        mov     cx, ax
        if      FW_VERSION = 172
        mov     byte ptr es:[bx+PGM_PADS+PGM_PAD_SW1], 0eh
        else
        mov     byte ptr es:[bx+24h], 0eh
        endif
        mov     dx, bx
        les     bx, [bp-0ch]
        mov     al, byte ptr es:[bx+1]
        mov     bx, dx
        mov     es, cx
        if      FW_VERSION = 172
        mov     byte ptr es:[bx+PGM_PADS+PGM_PAD_ALT1], al
        mov     byte ptr es:[bx+PGM_PADS+PGM_PAD_SW2], 2ah
        else
        mov     byte ptr es:[bx+25h], al
        mov     byte ptr es:[bx+26h], 2ah
        endif
        les     bx, [bp-0ch]
        mov     al, byte ptr es:[bx+2]
        mov     bx, dx
        mov     es, cx
        mov     byte ptr es:[bx+PGM_PADS+PGM_PAD_ALT2], al
        les     bx, [bp-0ch]
        mov     al, byte ptr es:[bx+1]
        mov     bx, dx
        mov     es, cx
        mov     byte ptr es:[bx+PGM_PADS+PGM_PAD_MUTE1], al
        les     bx, [bp-0ch]
        mov     al, byte ptr es:[bx+2]
        mov     bx, dx
        mov     es, cx
        if      FW_VERSION = 172
        mov     byte ptr es:[bx+PGM_PADS+PGM_PAD_MUTE2], al
        else
        mov     byte ptr es:[bx+2ah], al
        endif
        mov     byte ptr es:[bx+PGM_PADS+PGM_PAD_DCY_MODE], 1
        lea     ax, [di+23h]
        mov     es, word ptr [bp-6]
        mov     byte ptr es:[si+PGM_HDR_NOTE], al
        mov     es, cx
        mov     byte ptr es:[bx+PGM_PADS+PGM_PAD_FIELD_1B], 1
        mov     word ptr [bp-4], 1
        mov     si, word ptr [bp-4]
loop_0B82E:
        cmp     byte ptr [si+TBL_6459], 0
        jle     tgt_0B89B
        les     bx, [bp-0ch]
        mov     al, byte ptr es:[bx+si+2]
        cbw
        mov     di, ax
        cmp     byte ptr [si+TBL_6479], 1
        jne     tgt_0B85E
        imul    bx, di, PGM_PAD_STRIDE
        add     bx, word ptr [bp-8]
        mov     es, word ptr [bp-6]
        mov     word ptr [bp-12h], bx
        mov     word ptr [bp-10h], es
        mov     byte ptr es:[bx+PGM_PAD_NOTE0+PGM_PAD_MODE], 2
        jmp     tgt_0B873
        db      90h
tgt_0B85E:
        imul    bx, di, PGM_PAD_STRIDE
        add     bx, word ptr [bp-8]
        mov     es, word ptr [bp-6]
        mov     word ptr [bp-12h], bx
        mov     word ptr [bp-10h], es
        mov     byte ptr es:[bx+PGM_PAD_NOTE0+PGM_PAD_MODE], 1
tgt_0B873:
        mov     al, byte ptr [si+TBL_6459]
        cbw
        mov     bx, ax
        add     bx, word ptr [bp-0ch]
        mov     es, word ptr [bp-0ah]
        mov     al, byte ptr es:[bx+1]
        les     bx, [bp-12h]
        mov     byte ptr es:[bx+PGM_PAD_NOTE0+PGM_PAD_ALT1], al
        mov     al, byte ptr [si+TBL_6499]
        mov     byte ptr es:[bx+PGM_PAD_NOTE0+PGM_PAD_SW1], al
        mov     byte ptr es:[bx+PGM_PAD_NOTE0+PGM_PAD_SW2], 7fh
tgt_0B89B:
        inc     si
        cmp     si, 20h
        jl      loop_0B82E
        nop
        push    cs
        call    sample_process_2
        pop     si
        pop     di
        leave
        retf
sample_process_2:
        enter   6, 0
        push    di
        push    si
        nop
        push    cs
        call    int4D_sample_wrapper
        mov     di, ax
        mov     word ptr [bp-2], dx
        mov     byte ptr [G_MPC60_PAD_IDX], 0
loop_0B8BF:
        mov     al, byte ptr [G_MPC60_PAD_IDX]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+TBL_MPC60_PAD_SND]
        cbw
        mov     si, ax
        cmp     si, -1
        jne     br_0B8D4
        jmp     br_0B96D

br_0B8D4:
        imul    bx, si, 3bh
        add     bx, TBL_MPC60_SND_HDR
        cmp     byte ptr [bx], 0
        jne     br_0B8E3
        jmp     br_0B96D

br_0B8E3:
        push    ds
        push    bx
        nop
        push    cs
        call    sample_ptr_access
        mov     word ptr [W_56CA], ax
        mov     word ptr [W_56CC], dx
        mov     word ptr [W_56C6], ax
        mov     word ptr [W_56C8], dx
        or      dx, ax
        je      br_0B903
        cmp     byte ptr [B_56AA], 0
        je      br_0B914

br_0B903:
        push    ds
        push    W_56C6
        push    si
        nop
        push    cs
        call    sample_load_entry
        or      ax, ax
        je      br_0B98A
        dec     ax
        je      br_0B97E
br_0B914:
        mov     ax, word ptr [W_56CC]
        or      ax, word ptr [W_56CA]
        je      br_0B946
        cmp     byte ptr [B_56AA], 0
        je      br_0B946
        push    word ptr [W_56CC]
        push    word ptr [W_56CA]
        push    word ptr [W_56C8]
        push    word ptr [W_56C6]
        nop
        push    cs
        call    rep_memcpy_handler
        push    word ptr [W_56CC]
        push    word ptr [W_56CA]
        nop
        push    cs
        call    sample_validate_ptr
br_0B946:
        mov     al, byte ptr [G_MPC60_PAD_IDX]
        cbw
        mov     bx, ax
        add     bx, di
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[bx]
        cbw
        imul    si, ax, PGM_PAD_STRIDE
        les     bx, [FP_56C2]
        mov     ax, word ptr [W_56C6]
        mov     dx, word ptr [W_56C8]
        mov     word ptr es:[bx+si+PGM_PAD_NOTE0], ax
        mov     word ptr es:[bx+si+PGM_PAD_NOTE0+PGM_PAD_SND_SEG], dx

br_0B96D:
        inc     byte ptr [G_MPC60_PAD_IDX]
        cmp     byte ptr [G_MPC60_PAD_IDX], 22h
        jge     br_0B97B
        jmp     loop_0B8BF

br_0B97B:
        jmp     br_0B98A
        db      90h

br_0B97E:
        nop
        push    cs
        call    X_0C236
        mov     ax, 1
        pop     si
        pop     di
        leave
        retf

br_0B98A:
        xor     ax, ax
        pop     si
        pop     di
        leave
        retf

midi_prog_change:
        enter   4, 0
        push    di
        push    si
        nop
        push    cs
        call    int4D_sample_wrapper
        mov     di, ax
        mov     word ptr [bp-2], dx
loop_0B9A0:
        mov     ax, word ptr [W_56CC]
        or      ax, word ptr [W_56CA]
        je      br_0B9D2
        cmp     byte ptr [B_56AA], 0
        je      br_0B9D2
        push    word ptr [W_56CC]
        push    word ptr [W_56CA]
        push    word ptr [W_56C8]
        push    word ptr [W_56C6]
        nop
        push    cs
        call    rep_memcpy_handler
        push    word ptr [W_56CC]
        push    word ptr [W_56CA]
        nop
        push    cs
        call    sample_validate_ptr
br_0B9D2:
        mov     al, byte ptr [G_MPC60_PAD_IDX]
        cbw
        mov     bx, ax
        add     bx, di
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[bx]
        cbw
        imul    si, ax, PGM_PAD_STRIDE
        les     bx, [FP_56C2]
        mov     ax, word ptr [W_56C6]
        mov     dx, word ptr [W_56C8]
        mov     word ptr es:[bx+si+PGM_PAD_NOTE0], ax
        mov     word ptr es:[bx+si+PGM_PAD_NOTE0+PGM_PAD_SND_SEG], dx
loop_0B9F9:
        inc     byte ptr [G_MPC60_PAD_IDX]
        cmp     byte ptr [G_MPC60_PAD_IDX], 22h
        jge     tgt_0BA6F
        mov     al, byte ptr [G_MPC60_PAD_IDX]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+TBL_MPC60_PAD_SND]
        cbw
        mov     si, ax
        cmp     si, -1
        je      loop_0B9F9
        imul    bx, si, 3bh
        cmp     byte ptr [bx+TBL_MPC60_SND_HDR], 0
        je      loop_0B9F9
        imul    ax, si, 3bh
        add     ax, TBL_MPC60_SND_HDR
        push    ds
        push    ax
        nop
        push    cs
        call    sample_ptr_access
        mov     word ptr [W_56CA], ax
        mov     word ptr [W_56CC], dx
        mov     word ptr [W_56C6], ax
        mov     word ptr [W_56C8], dx
        or      dx, ax
        je      br_0BA49
        cmp     byte ptr [B_56AA], 0
        jne     br_0BA49
        jmp     loop_0B9A0

br_0BA49:
        push    ds
        push    W_56C6
        push    si
        nop
        push    cs
        call    sample_load_entry
        or      ax, ax
        je      br_0BA5E
        dec     ax
        je      br_0BA6A
        jmp     loop_0B9A0
        db      90h

br_0BA5E:
        push    5
        nop
        push    cs
        call    int43_wrapper
        pop     si
        pop     di
        leave
        retf
        db      90h

br_0BA6A:
        nop
        push    cs
        call    X_0C236

tgt_0BA6F:
        pop     si
        pop     di
        leave
        retf
        db      00h

; ? int2F_call_fn6 (buffer copy), then compares the result.
sample_io_handler:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+6]
        push    si
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, si
        je      br_0BA9E
        push    4
        push    word ptr [bp+0eh]
        push    word ptr [bp+0ch]
        callf   TEXT1_SEG:_longjmp
        add     sp, 6

br_0BA9E:
        pop     si
        leave
        retf    0ah
        db      00h

; ?
midi_string_setup:
        enter   12h, 0
        push    di
        lea     ax, [bp-12h]
        push    ss
        push    ax
        callf   TEXT1_SEG:__setjmp
        add     sp, 4
        mov     word ptr [G_ERRNO], ax
        or      ax, ax
        je      br_0BACC
        callf   TEXT1_SEG:int2F_dispatch_10
        nop
        push    cs
        call    err_msg_report
        xor     ax, ax
        pop     di
        leave
        retf

br_0BACC:
        xor     ax, ax
        mov     bx, G_SMEM_STATE_A
        mov     cx, 47fh
        mov     di, bx
        push    ds
        pop     es
        rep stosw
        stosb
        lea     ax, [bp-12h]
        push    ss
        push    ax
        push    ds
        push    G_SMEM_STATE_A
        push    2
        nop
        push    cs
        call    sample_io_handler
        cmp     byte ptr [G_SMEM_STATE_A], 2
        je      br_0BB08
        cmp     byte ptr [G_SMEM_STATE_A], 5
        je      br_0BB08
        push    4
        lea     ax, [bp-12h]
        push    ss
        push    ax
        callf   TEXT1_SEG:_longjmp
        add     sp, 6
br_0BB08:
        sub     ax, ax
        mov     word ptr [W_5BBE], ax
        mov     word ptr [W_5BBC], ax
        lea     ax, [bp-12h]
        push    ss
        push    ax
        push    ds
        push    W_5BBC
        push    3
        nop
        push    cs
        call    sample_io_handler
        lea     ax, [bp-12h]
        push    ss
        push    ax
        push    ds
        push    TBL_MPC60_SND_HDR
        push    7d6h
        nop
        push    cs
        call    sample_io_handler
        cmp     byte ptr [G_SMEM_STATE_A], 5
        jne     br_0BB48
        lea     ax, [bp-12h]
        push    ss
        push    ax
        push    ds
        push    P_6396
        push    1
        nop
        push    cs
        call    sample_io_handler

br_0BB48:
        lea     ax, [bp-12h]
        push    ss
        push    ax
        push    ds
        push    TBL_MPC60_PAD_SND
        push    22h
        nop
        push    cs
        call    sample_io_handler
        cmp     byte ptr [G_SMEM_STATE_A], 2
        je      L_0BB66
        cmp     byte ptr [G_SMEM_STATE_B], 0
        jne     br_0BB6B

L_0BB66:
        callf   TEXT1_SEG:int2F_call_fn5

br_0BB6B:
        lea     ax, [bp-12h]
        push    ss
        push    ax
        push    ds
        push    P_63B9
        push    0a0h
        nop
        push    cs
        call    sample_io_handler
        cmp     byte ptr [G_SMEM_STATE_B], 0
        je      br_0BB93
        lea     ax, [bp-12h]
        push    ss
        push    ax
        push    ds
        push    TBL_6459
        push    60h
        nop
        push    cs
        call    sample_io_handler

br_0BB93:
        callf   TEXT1_SEG:int2F_dispatch_10
        mov     ax, 1
        pop     di
        leave
        retf

midi_stop_helper:
        enter   8, 0
        push    si
        cmp     word ptr [bp+0ah], 1
        jne     br_0BBD0
        mov     byte ptr [bp-1], 0
        nop
        push    cs
        call    X_05972
        nop
        push    cs
        call    sample_data_load_1

loop_0BBB7:
        mov     al, byte ptr [bp-1]
        cbw
        mov     word ptr [bp-8], ax
        push    ax
        nop
        push    cs
        call    program_select_wrapper
        or      ax, ax
        jne     br_0BBF0
        mov     word ptr [G_ERRNO], ERR_NO_MEMORY
        jmp     br_0BBE2

br_0BBD0:
        nop
        push    cs
        call    far_059BC
        mov     byte ptr [bp-1], al
        or      al, al
        jge     loop_0BBB7
        mov     word ptr [G_ERRNO], ERR_PROG_DIR_FULL

br_0BBE2:
        nop
        push    cs
        call    err_msg_report
        xor     ax, ax
        cwd
        pop     si
        leave
        retf    6
        db      90h

br_0BBF0:
        mov     bx, word ptr [bp-8]
        shl     bx, 2
        mov     ax, word ptr [bx+PGM_TABLE]
        mov     dx, word ptr [bx+PGM_TABLE+2]
        mov     si, ax
        mov     word ptr [bp-4], dx
        add     ax, 2
        push    dx
        push    ax
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    bcd_convert
        push    word ptr [bp-8]
        nop
        push    cs
        call    program_select
        mov     ax, si
        mov     dx, word ptr [bp-4]
        pop     si
        leave
        retf    6
        db      00h

tgt_0BC26:
        nop
        push    cs
        call    far_0BC30
        mov     ax, 1
        retf
        db      00h

far_0BC30:
        push    ds
        push    TBL_WINKEYS_LOAD_SOUND
        callf   TEXT1_SEG:win_keys_merge
        push    5
        push    word ptr [W_56A8]
        push    word ptr [W_56A6]
        nop
        push    cs
        call    install_handler
        mov     byte ptr [G_MPC60_PAD_SEL], 0
        nop
        push    cs
        call    load_sound_up
        retf
        db      00h

sample_calc_position:
        enter   4, 0
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_LOAD_A_SOUND_CONFIRM
        callf   TEXT1_SEG:disp_list_run
        push    7dh
        push    14h
        mov     al, byte ptr [G_MPC60_PAD_SEL]
        cbw
        mov     cx, ax
        shl     ax, 2
        add     ax, cx
        add     ax, ax
        add     ax, TBL_MPC60_SOUND_NAMES
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        mov     al, byte ptr [G_MPC60_PAD_SEL]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+TBL_MPC60_PAD_SND]
        mov     byte ptr [bp-1], al
        inc     al
        je      br_0BCAC
        mov     al, byte ptr [bp-1]
        cbw
        imul    bx, ax, 3bh
        add     bx, TBL_MPC60_SND_HDR
        cmp     byte ptr [bx], 0
        je      br_0BCAC
        push    7dh
        push    24h
        push    ds
        push    bx
        jmp     br_0BCB4
        db      90h
br_0BCAC:
        push    7dh
        push    24h
        push    ds
        push    STR_NO_ASSIGN

br_0BCB4:
        nop
        push    cs
        call    cmd_dispatch_1E
        nop
        push    cs
        call    field_redraw
        pop     ds
        leave
        retf
        db      00h

load_sound_up:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    G_MPC60_PAD_SEL
        push    21h
        push    7dh
        push    14h
        push    0ah
        push    0
        push    0
        nop
        push    cs
        call    voice_trigger_full
        pop     ds
        retf
        db      00h

load_sound_down:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    G_MPC60_PAD_SEL
        push    21h
        push    7dh
        push    24h
        push    11h
        push    0
        push    0
        nop
        push    cs
        call    voice_trigger_full
        pop     ds
        retf
        db      00h

load_sound_refresh:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        pop     ds
        retf

smem_read_handler:
        enter   4, 0


L_0BD0A:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_LOADING
        callf   TEXT1_SEG:disp_list_run
        mov     byte ptr [B_56C0], 1
        mov     al, byte ptr [G_MPC60_PAD_SEL]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+TBL_MPC60_PAD_SND]
        cbw
        mov     si, ax
        cmp     si, -1
        je      br_0BD82
        imul    bx, si, 3bh
        cmp     byte ptr [bx+TBL_MPC60_SND_HDR], 0
        je      br_0BD82
        lea     ax, [bp-4]
        push    ss
        push    ax
        push    si
        nop
        push    cs
        call    sample_load_entry
        or      ax, ax
        je      br_0BD6C
        dec     ax
        je      br_0BD78
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    ui_enter_pad_assign
        push    5
        push    word ptr [W_56A8]
        push    word ptr [W_56A6]
        nop
        push    cs
        call    install_handler
        pop     ds
        pop     si
        leave
        retf
        db      90h

br_0BD6C:
        push    5
        nop
        push    cs
        call    int43_wrapper
        pop     ds
        pop     si
        leave
        retf
        db      90h

br_0BD78:
        nop
        push    cs
        call    load_sound_refresh
        nop
        push    cs
        call    X_0C236

br_0BD82:
        pop     ds
        pop     si
        leave
        retf
; ? loads entry N of the 3Bh-stride sample directory: descriptor,
; smem_block_alloc, sample_pool_add, then sample_load_step.
sample_load_entry:
        enter   4eh, 0
        push    di
        push    si
        mov     bx, word ptr [bp+6]
        cmp     bx, -1
        jne     br_0BD97
        jmp     br_0C15C

br_0BD97:
        imul    si, bx, 3bh
        mov     word ptr [bp-4eh], si
        cmp     byte ptr [si+TBL_MPC60_SND_HDR], 0
        jne     br_0BDA7
        jmp     br_0C15C

br_0BDA7:
        mov     ax, word ptr [si+TBL_MPC60_SND_OFS]
        mov     dx, word ptr [si+TBL_MPC60_SND_OFS_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        lea     ax, [bp-4ch]
        push    ss
        push    ax
        nop
        push    cs
        call    sample_desc_init
        mov     bx, word ptr [bp-4eh]
        add     bx, TBL_MPC60_SND_HDR
        mov     dx, ds
        push    ds
        mov     di, bx
        lea     si, [bp-4ch]
        mov     es, dx
        mov     cx, ss
        mov     ds, cx
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        xchg    di, si
        push    ds
        push    dx
        pop     ds
        pop     es
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        mov     bx, word ptr [bp-4eh]
        mov     ax, word ptr [bx+TBL_MPC60_SND_LEN]
        mov     dx, word ptr [bx+TBL_MPC60_SND_LEN_HI]
        mov     word ptr [bp-30h], ax
        mov     word ptr [bp-2eh], dx
        mov     ax, 28h
        imul    word ptr [bx+TBL_MPC60_SND_START]
        mov     word ptr [bp-38h], ax
        mov     word ptr [bp-36h], dx
        mov     ax, 28h
        imul    word ptr [bx+TBL_MPC60_SND_END]
        mov     word ptr [bp-34h], ax
        mov     word ptr [bp-32h], dx
        mov     byte ptr [bp-3ah], 0efh
        cmp     byte ptr [G_SMEM_STATE_B], 1
        jne     br_0BE2E
        mov     al, byte ptr [bx+TBL_MPC60_SND_LEVEL]
        mov     byte ptr [bp-3bh], al
        jmp     br_0BE32
        db      90h

br_0BE2E:
        mov     byte ptr [bp-3bh], 64h

br_0BE32:
        mov     byte ptr [bp-39h], 0
        mov     ax, word ptr [bp-30h]
        mov     dx, word ptr [bp-2eh]
        cmp     word ptr [bp-36h], dx
        jl      br_0BE4E
        jg      br_0BE48
        cmp     word ptr [bp-38h], ax
        jbe     br_0BE4E

br_0BE48:
        mov     word ptr [bp-38h], ax
        mov     word ptr [bp-36h], dx

br_0BE4E:
        cmp     word ptr [bp-32h], dx
        jl      br_0BE60
        jg      br_0BE5A
        cmp     word ptr [bp-34h], ax
        jbe     br_0BE60

br_0BE5A:
        mov     word ptr [bp-34h], ax
        mov     word ptr [bp-32h], dx

br_0BE60:
        lea     ax, [bp-16h]
        push    ss
        push    ax
        callf   TEXT1_SEG:__setjmp
        add     sp, 4
        mov     word ptr [G_ERRNO], ax
        or      ax, ax
        je      br_0BEAC
        cmp     ax, 0ch
        je      br_0BE8B
        ja      loop_0BE9A
        sub     al, 4
        je      L_0BE86
        sub     al, 5
        je      br_0BEA2
        jmp     loop_0BE9A
        db      90h

L_0BE86:
        callf   TEXT1_SEG:int2F_dispatch_10

br_0BE8B:
        les     bx, [bp+8]
        push    word ptr es:[bx+2]
        push    word ptr es:[bx]
        nop
        push    cs
        call    sample_validate_ptr

loop_0BE9A:
        nop
        push    cs
        call    err_msg_report
        jmp     br_0C15C

br_0BEA2:
        push    word ptr [bp-1ch]
        callf   TEXT1_SEG:smem_free
        jmp     loop_0BE9A

br_0BEAC:
        lea     ax, [bp-1ch]
        push    ss
        push    ax
        push    word ptr [bp-2eh]
        push    word ptr [bp-30h]
        push    0
        nop
        push    cs
        call    mem_io_handler
        or      ax, ax
        jne     br_0BED3
        push    word ptr [G_ERRNO]
        lea     ax, [bp-16h]
        push    ss
        push    ax
        callf   TEXT1_SEG:_longjmp
        add     sp, 6
br_0BED3:
        sub     sp, 36h
        push    ds
        lea     si, [bp-4ch]
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
        call    sample_pool_add
        les     bx, [bp+8]
        mov     word ptr es:[bx], ax
        mov     word ptr es:[bx+2], dx
        mov     si, word ptr [bp+8]
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[si+2]
        or      ax, word ptr es:[si]
        jne     br_0BF16
        push    9
        lea     ax, [bp-16h]
        push    ss
        push    ax
        callf   TEXT1_SEG:_longjmp
        add     sp, 6
br_0BF16:
        push    1
        nop
        push    cs
        call    fn_0D9CE
        add     sp, 2
        cmp     byte ptr [G_SMEM_STATE_A], 2
        jne     br_0BF2A
        jmp     br_0C0DA

br_0BF2A:
        cmp     byte ptr [G_SMEM_STATE_A], 5
        je      br_0BF34
        jmp     loop_0C0C2

br_0BF34:
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        add     ax, word ptr [bp-30h]
        adc     dx, word ptr [bp-2eh]
        cmp     dx, word ptr [W_5BBE]
        jge     br_0BF49
        jmp     br_0C0DA

br_0BF49:
        jg      br_0BF54
        cmp     ax, word ptr [W_5BBC]
        jae     br_0BF54
        jmp     br_0C0DA

br_0BF54:
        mov     ax, word ptr [W_5BBC]
        mov     dx, word ptr [W_5BBE]
        cmp     word ptr [bp-2], dx
        jl      br_0BFC8
        jg      br_0BF67
        cmp     word ptr [bp-4], ax
        jbe     br_0BFC8
br_0BF67:
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     word ptr [W_50A0], ax
        mov     word ptr [W_50A2], dx
        push    0
        push    2
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        sub     ax, word ptr [W_5BBC]
        sbb     dx, word ptr [W_5BBE]
        mov     cx, ax
        mov     bx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, cx
        adc     dx, bx
        push    dx
        push    ax
        callf   TEXT1_SEG:__aFldiv
        mov     word ptr [W_50A4], ax
        mov     word ptr [W_50A6], dx
        mov     bx, word ptr [bp-1ch]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL]
        mov     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        mov     word ptr [W_50A8], ax
        mov     word ptr [W_50AA], dx
        mov     ax, word ptr [bp-30h]
        mov     dx, word ptr [bp-2eh]
        jmp     br_0C0A7

br_0BFC8:
        push    ds
        push    P_56AB
        callf   TEXT1_SEG:int2F_call_fn4
        add     sp, 4
        inc     ax
        jne     br_0BFE6
        push    0ch
        lea     ax, [bp-16h]
        push    ss
        push    ax
        callf   TEXT1_SEG:_longjmp
        add     sp, 6
br_0BFE6:
        push    0
        push    2
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        callf   TEXT1_SEG:__aFldiv
        add     ah, 4
        adc     dx, 0
        mov     cx, ax
        mov     bx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, cx
        adc     dx, bx
        push    dx
        push    ax
        nop
        push    cs
        call    int2F_bcd_wrapper2
        add     sp, 4
        mov     bx, word ptr [bp-1ch]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        push    word ptr [bx+SMEM_POOL_BASE_HI]
        push    word ptr [bx+SMEM_POOL]
        mov     ax, word ptr [W_5BBC]
        mov     dx, word ptr [W_5BBE]
        sub     ax, word ptr [bp-4]
        sbb     dx, word ptr [bp-2]
        push    dx
        push    ax
        nop
        push    cs
        call    sample_data_load_12bit
        or      ax, ax
        jne     br_0C04C
        push    4
        lea     ax, [bp-16h]
        push    ss
        push    ax
        callf   TEXT1_SEG:_longjmp
        add     sp, 6

br_0C04C:
        callf   TEXT1_SEG:int2F_dispatch_10
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     word ptr [W_50A0], ax
        mov     word ptr [W_50A2], dx
        sub     ax, ax
        mov     word ptr [W_50A6], ax
        mov     word ptr [W_50A4], ax
        mov     bx, word ptr [bp-1ch]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL]
        mov     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        sub     ax, word ptr [bp-4]
        sbb     dx, word ptr [bp-2]
        add     ax, word ptr [W_5BBC]
        adc     dx, word ptr [W_5BBE]
        mov     word ptr [W_50A8], ax
        mov     word ptr [W_50AA], dx
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        add     ax, word ptr [bp-30h]
        adc     dx, word ptr [bp-2eh]
        sub     ax, word ptr [W_5BBC]
        sbb     dx, word ptr [W_5BBE]

br_0C0A7:
        mov     word ptr [G_MPC60_LOAD_LEN], ax
        mov     word ptr [G_MPC60_LOAD_LEN_HI], dx
        mov     byte ptr [B_56BE], 32h
        nop
        push    cs
        call    sample_load_step
        or      ax, ax
        jne     br_0C0BF
        jmp     br_0C15C

br_0C0BF:
        dec     ax
        je      br_0C0CC

loop_0C0C2:
        mov     ax, 2
        pop     si
        pop     di
        leave
        retf    6
        db      90h

br_0C0CC:
        nop
        push    cs
        call    X_0C236
        mov     ax, 1
        pop     si
        pop     di
        leave
        retf    6

br_0C0DA:
        push    ds
        push    P_56AB
        callf   TEXT1_SEG:int2F_call_fn4
        add     sp, 4
        inc     ax
        jne     br_0C0F8
        push    0ch
        lea     ax, [bp-16h]
        push    ss
        push    ax
        callf   TEXT1_SEG:_longjmp
        add     sp, 6
br_0C0F8:
        push    0
        push    2
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        callf   TEXT1_SEG:__aFldiv
        add     ah, 4
        adc     dx, 0
        mov     cx, ax
        mov     bx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, cx
        adc     dx, bx
        push    dx
        push    ax
        nop
        push    cs
        call    int2F_bcd_wrapper2
        add     sp, 4
        mov     bx, word ptr [bp-1ch]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        push    word ptr [bx+SMEM_POOL_BASE_HI]
        push    word ptr [bx+SMEM_POOL]
        push    word ptr [bp-2eh]
        push    word ptr [bp-30h]
        nop
        push    cs
        call    sample_data_load_12bit
        or      ax, ax
        je      br_0C149
        jmp     loop_0C0C2
br_0C149:
        push    4
        lea     ax, [bp-16h]
        push    ss
        push    ax
        callf   TEXT1_SEG:_longjmp
        add     sp, 6
        jmp     loop_0C0C2
        db      90h

br_0C15C:
        xor     ax, ax
        pop     si
        pop     di
        leave
        retf    6

; ? the second stage of sample_load_entry: reopens the file and loads the
; data through sample_data_load_12bit.
sample_load_step:
        enter   14h, 0
        push    ds
        push    DL_LOADING
        callf   TEXT1_SEG:disp_list_run
        push    ds
        push    P_56AB
        callf   TEXT1_SEG:int2F_call_fn4
        add     sp, 4
        inc     ax
        jne     br_0C186
        mov     ax, 1
        leave
        retf
        db      90h
br_0C186:
        lea     ax, [bp-14h]
        push    ss
        push    ax
        callf   TEXT1_SEG:__setjmp
        add     sp, 4
        or      ax, ax
        je      br_0C1B8
        push    word ptr [W_50A2]
        push    word ptr [W_50A0]
        nop
        push    cs
        call    sample_validate_ptr
        callf   TEXT1_SEG:int2F_dispatch_10
        mov     word ptr [G_ERRNO], ERR_FILE_DAMAGED
        nop
        push    cs
        call    err_msg_report
        xor     ax, ax
        leave
        retf
br_0C1B8:
        lea     ax, [bp-14h]
        push    ss
        push    ax
        lea     ax, [bp-2]
        push    ss
        push    ax
        push    2
        nop
        push    cs
        call    sample_io_handler
        cmp     byte ptr [bp-2], 6
        je      br_0C1DE
        push    4
        lea     ax, [bp-14h]
        push    ss
        push    ax
        callf   TEXT1_SEG:_longjmp
        add     sp, 6

br_0C1DE:
        mov     ax, word ptr [W_50A4]
        mov     dx, word ptr [W_50A6]
        add     ax, 0bfeh
        adc     dx, 0
        push    dx
        push    ax
        nop
        push    cs
        call    int2F_bcd_wrapper2
        add     sp, 4
        push    word ptr [W_50AA]
        push    word ptr [W_50A8]
        push    word ptr [G_MPC60_LOAD_LEN_HI]
        push    word ptr [G_MPC60_LOAD_LEN]
        nop
        push    cs
        call    sample_data_load_12bit
        or      ax, ax
        jne     br_0C21D
        push    4
        lea     ax, [bp-14h]
        push    ss
        push    ax
        callf   TEXT1_SEG:_longjmp
        add     sp, 6
br_0C21D:
        callf   TEXT1_SEG:int2F_dispatch_10
        mov     ax, 2
        leave
        retf
        db      00h

far_0C228:
        push    word ptr [W_50A2]
        push    word ptr [W_50A0]
        nop
        push    cs
        call    sample_validate_ptr
        retf

X_0C236:
        push    ds
        push    P_40F7
        callf   TEXT1_SEG:disp_list_run
        push    ds
        push    TBL_WINKEYS_CHANGE_DISK
        callf   TEXT1_SEG:win_keys_merge
        push    5
        push    word ptr [W_56A8]
        push    word ptr [W_56A6]
        nop
        push    cs
        call    install_handler
        retf

change_disk_refresh:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_0C228
        pop     ds
        retf
        db      00h
change_disk_paint:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_CHANGE_DISK
        callf   TEXT1_SEG:disp_list_run
        push    48h
        push    14h
        push    ds
        push    P_4E74
        nop
        push    cs
        call    cmd_caller_setup
        pop     ds
        retf

change_disk_do_it:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    sample_load_step
        or      ax, ax
        je      br_0C2DC
        dec     ax
        je      br_0C29C
        dec     ax
        je      br_0C2A4
        pop     ds
        retf
        db      90h
br_0C29C:
        nop
        push    cs
        call    X_0C236
        pop     ds
        retf
        db      90h

br_0C2A4:
        cmp     byte ptr [B_56C0], 0
        je      br_0C2CA
        push    word ptr [W_50A2]
        push    word ptr [W_50A0]
        nop
        push    cs
        call    ui_enter_pad_assign
        push    5
        push    word ptr [W_56A8]
        push    word ptr [W_56A6]
        nop
        push    cs
        call    install_handler
        pop     ds
        retf
        db      90h

br_0C2CA:
        nop
        push    cs
        call    midi_prog_change
        push    34h
        push    word TEXT1_SEG
        push    win_key_nop_stub
        nop
        push    cs
        call    install_handler

br_0C2DC:
        push    5
        nop
        push    cs
        call    int43_wrapper
        pop     ds
        retf
        db      90h

; ? reads a 1Dh-byte request, sample_desc_init, name copy, 28h per unit,
; smem_block_alloc, then sample_pool_add.
sample_create:
        enter   72h, 0
        push    di
        push    si
        lea     ax, [bp-1eh]
        push    ss
        push    ax
        callf   TEXT1_SEG:__setjmp
        add     sp, 4
        mov     word ptr [G_ERRNO], ax
        or      ax, ax
        je      br_0C303
        jmp     br_0C452
br_0C303:
        push    1dh
        lea     ax, [bp-3ch]
        push    ss
        push    ax
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 1dh
        je      br_0C326
        push    4
        lea     ax, [bp-1eh]
        push    ss
        push    ax
        callf   TEXT1_SEG:_longjmp
        add     sp, 6
br_0C326:
        cmp     word ptr [bp+6], 1
        jne     br_0C34F
        push    8
        lea     ax, [bp-0ch]
        push    ss
        push    ax
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 8
        je      br_0C34F
        push    4
        lea     ax, [bp-1eh]
        push    ss
        push    ax
        callf   TEXT1_SEG:_longjmp
        add     sp, 6
br_0C34F:
        lea     ax, [bp-72h]
        push    ss
        push    ax
        nop
        push    cs
        call    sample_desc_init
        push    ds
        lea     di, [bp-3ch]
        lea     si, [bp-72h]
        mov     cx, ss
        mov     es, cx
        mov     ds, cx
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        xchg    di, si
        push    ds
        pop     es
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        mov     ax, 28h
        mul     word ptr [bp-27h]
        mov     word ptr [bp-5eh], ax
        mov     word ptr [bp-5ch], dx
        mov     ax, 28h
        mul     word ptr [bp-25h]
        mov     word ptr [bp-5ah], ax
        mov     word ptr [bp-58h], dx
        mov     byte ptr [bp-60h], 0efh
        mov     ax, word ptr [bp-2bh]
        mov     dx, word ptr [bp-29h]
        mov     word ptr [bp-56h], ax
        mov     word ptr [bp-54h], dx
        cmp     word ptr [bp-5ch], dx
        jl      tgt_0C3BE
        jg      tgt_0C3B2
        cmp     word ptr [bp-5eh], ax
        jbe     tgt_0C3BE
tgt_0C3B2:
        mov     ax, word ptr [bp-56h]
        mov     dx, word ptr [bp-54h]
        mov     word ptr [bp-5eh], ax
        mov     word ptr [bp-5ch], dx
tgt_0C3BE:
        mov     ax, word ptr [bp-56h]
        mov     dx, word ptr [bp-54h]
        cmp     word ptr [bp-58h], dx
        jl      br_0C3D6
        jg      br_0C3D0
        cmp     word ptr [bp-5ah], ax
        jbe     br_0C3D6

br_0C3D0:
        mov     word ptr [bp-5ah], ax
        mov     word ptr [bp-58h], dx

br_0C3D6:
        cmp     word ptr [bp+6], 1
        jne     br_0C3EA
        mov     al, byte ptr [bp-0bh]
        sub     al, 11h
        mov     byte ptr [bp-60h], al
        mov     al, byte ptr [bp-0ch]
        mov     byte ptr [bp-61h], al
br_0C3EA:
        lea     ax, [bp-42h]
        push    ss
        push    ax
        push    word ptr [bp-29h]
        push    word ptr [bp-2bh]
        nop
        push    cs
        call    smem_block_alloc
        or      ax, ax
        jne     br_0C40F
        push    word ptr [G_ERRNO]
        lea     ax, [bp-1eh]
        push    ss
        push    ax

        callf   TEXT1_SEG:_longjmp
        add     sp, 6
br_0C40F:
        sub     sp, 36h
        push    ds
        lea     si, [bp-72h]
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
        call    sample_pool_add
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     si, ax
        mov     ax, dx
        or      ax, si
        jne     br_0C447
        push    9
        lea     ax, [bp-1eh]
        push    ss
        push    ax
        callf   TEXT1_SEG:_longjmp
        add     sp, 6

br_0C447:
        mov     ax, si
        mov     dx, word ptr [bp-2]
        pop     si
        pop     di
        leave
        retf    2

br_0C452:
        nop
        push    cs
        call    err_msg_report
        xor     ax, ax
        cwd
        pop     si
        pop     di
        leave
        retf    2

; allocates a sample-memory block for the 32-bit length and writes its
; index through the caller's pointer; 0 on failure.
smem_block_alloc:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+0ah]
        mov     es, word ptr [bp+0ch]
        mov     word ptr es:[si], 0ffffh
        push    es
        push    si
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    0
        nop
        push    cs
        call    mem_io_handler
        or      ax, ax
        jne     br_0C48A

loop_0C482:
        xor     ax, ax
        pop     si
        leave
        retf    8
        db      90h

br_0C48A:
        push    1
        nop
        push    cs
        call    fn_0D9CE
        add     sp, 2
        mov     es, word ptr [bp+0ch]
        mov     bx, word ptr es:[si]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        push    word ptr [bx+SMEM_POOL_BASE_HI]
        push    word ptr [bx+SMEM_POOL]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    sample_data_load_12bit
        or      ax, ax
        jne     br_0C4C8
        mov     es, word ptr [bp+0ch]
        push    word ptr es:[si]
        callf   TEXT1_SEG:smem_free
        jmp     loop_0C482
        db      90h

br_0C4C8:
        mov     ax, 1
        pop     si
        leave
        retf    8

; ? 3 bytes in, 2 words out through timing_calc_rate, buffered
; 400h words at a time, into sample memory.
sample_data_load_12bit:
        enter   0ch, 0
        push    si
        push    0
        push    2
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   TEXT1_SEG:__aFldiv
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     cx, word ptr [bp+0ah]
        mov     bx, word ptr [bp+0ch]
        mov     word ptr [bp-8], cx
        mov     word ptr [bp-6], bx
        xor     si, si
        or      dx, dx
        jge     br_0C4FF
        jmp     br_0C5AE

br_0C4FF:
        jg      loop_0C508
        or      ax, ax
        jne     loop_0C508
        jmp     br_0C5AE

loop_0C508:
        push    3
        lea     ax, [bp-0ch]
        push    ss
        push    ax
        callf   TEXT1_SEG:int2F_call_fn6
        add     sp, 6
        cmp     ax, 3
        je      br_0C51F
        jmp     br_0C5A0
br_0C51F:
        mov     al, byte ptr [bp-0bh]
        and     ax, 0fh
        shl     ax, 4
        mov     ch, byte ptr [bp-0ch]
        sub     cl, cl
        or      ax, cx
        push    ax
        callf   TEXT1_SEG:timing_calc_rate
        mov     bx, si
        add     sp, 2
        mov     word ptr [bx+si+BUF_XFER], ax
        mov     al, byte ptr [bp-0bh]
        shr     al, 4
        sub     ah, ah
        shl     ax, 4
        mov     ch, byte ptr [bp-0ah]
        sub     cl, cl
        or      ax, cx
        push    ax
        callf   TEXT1_SEG:timing_calc_rate
        add     sp, 2
        inc     si
        mov     bx, si
        mov     word ptr [bx+si+BUF_XFER], ax
        inc     si
        cmp     si, 400h
        jle     br_0C582
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    ds
        push    BUF_XFER
        push    si
        nop
        push    cs
        call    flash_write_words
        mov     ax, si
        cwd
        add     word ptr [bp-8], ax
        adc     word ptr [bp-6], dx
        xor     si, si

br_0C582:
        sub     word ptr [bp-4], 1
        sbb     word ptr [bp-2], 0
        cmp     word ptr [bp-2], 0
        jle     br_0C593
        jmp     loop_0C508

br_0C593:
        jl      br_0C5AE
        cmp     word ptr [bp-4], 0
        je      L_0C59E
        jmp     loop_0C508

L_0C59E:
        jmp     br_0C5AE

br_0C5A0:
        mov     word ptr [G_ERRNO], ERR_FILE_DAMAGED
        xor     ax, ax
        pop     si
        leave
        retf    8
        db      90h

br_0C5AE:
        or      si, si

        je      L_0C5C2
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    ds
        push    BUF_XFER
        push    si
        nop
        push    cs
        call    flash_write_words

L_0C5C2:
        mov     ax, 1
        pop     si
        leave
        retf    8

ctrl_port_caller:
        enter   4, 0
        mov     byte ptr [bp-4], 7
        mov     byte ptr [bp-3], 4
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    ctrl_io_access
        mov     word ptr [bp-2], ax
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    0
        nop
        push    cs
        call    mem_block_process
        or      ax, ax
        je      br_0C631
        lea     ax, [bp-4]
        push    ss
        push    ax
        push    2
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        je      br_0C62C
        push    word ptr [bp-2]
        nop
        push    cs
        call    ctrl_port_48_B8
        or      ax, ax
        je      br_0C62C
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        nop
        push    cs
        call    pgm_file_write
        or      ax, ax
        je      br_0C62C
        callf   TEXT1_SEG:int2F_dispatch_10
        mov     ax, 1
        leave
        retf    8

br_0C62C:
        callf   TEXT1_SEG:int2F_dispatch_10

br_0C631:
        xor     ax, ax
        leave
        retf    8
        db      00h

; ? no port I/O: zero-fills two shared scratch buffers.
ctrl_io_access:
        enter   10h, 0
        push    di
        push    si
        xor     ax, ax
        mov     word ptr [bp-2], ax
        mov     cx, 440h
        mov     di, TBL_SOUND_NAMES
        push    ds
        pop     es
        rep stosw
        mov     cx, 100h
        mov     di, P_8D44
        rep stosw
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     ax, 1eh
        mov     si, ax
        mov     word ptr [bp-4], dx
        mov     word ptr [bp-0ah], 40h
        mov     word ptr [bp-6], ax

loop_0C66B:
        mov     cx, word ptr [bp-6]
        mov     bx, cx
        mov     es, word ptr [bp-4]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        jne     br_0C68C
        mov     byte ptr es:[bx+4], 0ffh
        jmp     br_0C71B

br_0C68C:
        xor     bx, bx
        mov     word ptr [bp-8], bx
        cmp     word ptr [bp-2], bx
        jle     br_0C6C3
        mov     di, P_8D44

loop_0C699:
        mov     ax, word ptr [di]
        mov     dx, word ptr [di+2]
        cmp     word ptr [bp-10h], ax
        jne     br_0C6A8
        cmp     word ptr [bp-0eh], dx
        je      br_0C6B6

br_0C6A8:
        add     di, 4
        inc     bx
        cmp     word ptr [bp-2], bx
        jg      loop_0C699
        mov     word ptr [bp-8], bx
        jmp     br_0C6C3

br_0C6B6:
        mov     word ptr [bp-8], bx
        mov     al, byte ptr [bp-8]
        les     bx, [bp-6]
        mov     byte ptr es:[bx+4], al

br_0C6C3:
        mov     ax, word ptr [bp-8]
        cmp     word ptr [bp-2], ax
        jne     br_0C71B
        mov     al, byte ptr [bp-8]
        les     bx, [bp-6]
        mov     byte ptr es:[bx+4], al
        les     bx, [bp-6]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        mov     bx, word ptr [bp-8]
        shl     bx, 2
        mov     word ptr [bx+P_8D44], ax
        mov     word ptr [bx+P_8D46], dx
        imul    si, word ptr [bp-8], 11h
        add     si, TBL_SOUND_NAMES
        mov     di, word ptr [bx+P_8D44]
        mov     cx, dx
        push    ds
        mov     es, cx
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
        inc     word ptr [bp-2]
br_0C71B:
        add     word ptr [bp-6], 1dh
        dec     word ptr [bp-0ah]
        je      br_0C727
        jmp     loop_0C66B

br_0C727:
        mov     ax, word ptr [bp-2]
        pop     si
        pop     di
        leave
        retf    4

smem_access_handler_3:
        enter   0ah, 0
        push    di
        push    si
        mov     di, word ptr [bp+6]
        mov     byte ptr [bp-2], 0ah
        mov     byte ptr [bp-1], 4
        nop
        push    cs
        call    sample_index_rebuild
        mov     si, ax
        if      FW_VERSION = 172
        mov     word ptr [bp-6], 33h
        else
        mov     word ptr [bp-6], 32h
        endif
        mov     word ptr [bp-4], 40h
        push    10h
        mov     ax, word ptr [bp+8]
        push    ax
        push    di
        push    ds
        push    P_9D5F
        mov     word ptr [bp-0ah], di
        mov     word ptr [bp-8], ax
        callf   TEXT1_SEG:__fstrncpy
        add     sp, 0ah
        mov     byte ptr [B_9D6F], 0
        push    word ptr [bp-8]
        push    word ptr [bp-0ah]
        push    0
        nop
        push    cs
        call    mem_block_process
        or      ax, ax
        jne     X_0C784
        jmp     br_0C809

X_0C784:
        lea     ax, [bp-2]
        push    ss
        push    ax
        push    2
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        je      br_0C804
        push    si
        nop
        push    cs
        call    ctrl_port_48_B8
        or      ax, ax
        je      br_0C804
        lea     ax, [bp-6]
        push    ss
        push    ax
        push    2
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        if      FW_VERSION = 172
L_0C7AD                         equ     $+1
        endif
        je      br_0C804
        push    ds
        push    B_9D5A
        if      FW_VERSION = 172
        push    33h
        else
        push    32h
        endif
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        je      br_0C804
        lea     ax, [bp-4]
        push    ss
        push    ax
        push    2
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        je      br_0C804
        push    ds
        push    P_9DA0
        push    word ptr [bp-4]
        nop
        push    cs
        call    smem_ctrl_setup_2
        or      ax, ax
        je      br_0C804
        push    ds
        push    P_8F78
        push    40h
        nop
        push    cs
        call    ctrl_port_48_read
        or      ax, ax
        je      br_0C804
        nop
        push    cs
        call    smem_ctrl_setup_1
        or      ax, ax
        je      br_0C804
        callf   TEXT1_SEG:int2F_dispatch_10
        mov     ax, 1
        pop     si
        pop     di
        leave
        retf    4
        db      90h

br_0C804:
        callf   TEXT1_SEG:int2F_dispatch_10

br_0C809:
        xor     ax, ax
        pop     si
        pop     di
        leave
        retf    4
        db      00h

; ? zeroes the name and pointer tables, then rebuilds the pool pointer
; table and the per-slot indices, summing block lengths.
sample_index_rebuild:
        enter   18h, 0
        push    di
        push    si
        xor     ax, ax
        mov     cx, 440h
        mov     di, TBL_SOUND_NAMES
        push    ds
        pop     es
        rep stosw
        mov     cx, 100h
        mov     di, P_8D44
        rep stosw
        nop
        push    cs
        call    far_07900
        mov     si, ax
        nop
        push    cs
        call    far_078E4
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        sub     ax, ax
        mov     word ptr [W_9D5D], ax
        mov     word ptr [W_9D5B], ax
        mov     word ptr [bp-0ch], si
        or      si, si
        jle     br_0C8C7
        mov     word ptr [bp-6], P_8D44
        mov     word ptr [bp-8], TBL_SOUND_NAMES
        mov     word ptr [bp-0ah], si
loop_0C85A:
        mov     bx, word ptr [bp-8]
        push    ds
        mov     si, bx
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
        mov     ax, word ptr [bp-4]
        mov     bx, word ptr [bp-6]
        mov     dx, word ptr [bp-2]
        mov     word ptr [bx], ax
        mov     word ptr [bx+2], dx
        mov     bx, ax
        mov     es, dx
        mov     si, word ptr es:[bx+SND_POOL_IDX]
        mov     cx, si
        shl     si, 2
        add     si, cx
        add     si, si
        mov     cx, word ptr [si+SMEM_POOL_LEN]
        mov     di, word ptr [si+SMEM_POOL_LEN_HI]
        add     word ptr [W_9D5B], cx
        adc     word ptr [W_9D5D], di
        add     word ptr [bp-6], 4
        add     word ptr [bp-8], 11h
        mov     cx, word ptr es:[bx+SND_NEXT]
        mov     si, word ptr es:[bx+SND_NEXT_SEG]
        mov     word ptr [bp-4], cx
        mov     word ptr [bp-2], si
        dec     word ptr [bp-0ah]
        jne     loop_0C85A

br_0C8C7:
        mov     byte ptr [B_9D5A], 0
        mov     bx, PGM_TABLE
        mov     word ptr [bp-0ah], 18h

loop_0C8D4:
        les     si, [bx]
        mov     di, si
        cmp     word ptr es:[si], 2
        jbe     br_0C94D
        mov     word ptr [bp-8], bx
        inc     byte ptr [B_9D5A]
        lea     ax, [di+22h]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], es
        mov     word ptr [bp-6], 40h
        mov     di, ax

loop_0C8F5:
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[di], 0ffh
        mov     es, word ptr [bp-2]
        lea     bx, [di-4]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        mov     word ptr [bp-18h], ax
        mov     word ptr [bp-16h], dx
        or      dx, ax
        je      br_0C942
        xor     cx, cx
        cmp     word ptr [bp-0ch], cx
        jle     br_0C942
        mov     bx, P_8D44
        mov     word ptr [bp-4], di

loop_0C920:
        mov     ax, word ptr [bx]
        mov     dx, word ptr [bx+2]
        cmp     word ptr [bp-18h], ax
        jne     br_0C92F
        cmp     word ptr [bp-16h], dx
        je      br_0C93C

br_0C92F:
        add     bx, 4
        inc     cx
        cmp     word ptr [bp-0ch], cx
        jg      loop_0C920
        jmp     br_0C942
        db      90h, 90h

br_0C93C:
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[di], cl

br_0C942:
        add     di, 1dh
        dec     word ptr [bp-6]
        jne     loop_0C8F5
        mov     bx, word ptr [bp-8]

br_0C94D:
        add     bx, 4
        dec     word ptr [bp-0ah]
        je      br_0C958
        jmp     loop_0C8D4

br_0C958:
        mov     ax, word ptr [bp-0ch]
        pop     si
        pop     di
        leave
        retf
        db      00h

smem_ctrl_setup_1:
        enter   8, 0
        push    si
        mov     al, byte ptr [B_9D5A]
        cbw
        mov     word ptr [bp-8], ax
        lea     ax, [bp-8]
        push    ss
        push    ax
        push    2
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        jne     L_0C982

loop_0C97C:
        xor     ax, ax
        pop     si
        leave
        retf
        db      90h

L_0C982:
        mov     word ptr [bp-6], 0

loop_0C987:
        mov     bx, word ptr [bp-6]
        shl     bx, 2
        les     bx, [bx+PGM_TABLE]
        mov     si, bx
        mov     word ptr [bp-2], es
        cmp     word ptr es:[bx], 2
        jbe     br_0C9B9
        lea     ax, [bp-6]
        push    ss
        push    ax
        push    2
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        je      loop_0C97C
        push    word ptr [bp-2]
        push    si
        nop
        push    cs
        call    pgm_file_write
        or      ax, ax
        je      loop_0C97C
br_0C9B9:
        inc     word ptr [bp-6]
        cmp     word ptr [bp-6], 18h
        jl      loop_0C987
        mov     ax, 1
        pop     si
        leave
        retf
ctrl_port_48_B8:
        push    bp
        mov     bp, sp
        lea     ax, [bp+6]
        push    ss
        push    ax
        push    2
        nop
        push    cs

; ? no port 0x48/0xB8 access: calls two near helpers.
        call    bcd_display_calc
        or      ax, ax
        je      br_0C9F4
        push    ds
        push    TBL_SOUND_NAMES
        imul    ax, word ptr [bp+6], 11h
        push    ax
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        je      br_0C9F4
        mov     ax, 1
        leave
        retf    2

br_0C9F4:
        xor     ax, ax
        leave
        retf    2
; ? no port I/O: copies a 15-word caller struct into a local buffer.
pgm_file_write:
        enter   1eh, 0
        push    di
        push    si
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        push    ds
        lea     di, [bp-1eh]
        mov     si, ax
        push    ss
        pop     es
        mov     ds, dx
        mov     cx, 0fh
        rep movsw
        pop     ds
        mov     byte ptr [bp-1], 23h
        lea     ax, [bp-1eh]
        push    ss
        push    ax
        mov     ax, 1eh
        mov     word ptr [bp-1eh], ax
        push    ax
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        je      br_0CA82
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    ctrl_port_48_B8_3
        or      ax, ax
        je      br_0CA82
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     ax, 75eh
        push    dx
        push    ax
        push    40h
        nop
        push    cs
        call    smem_ctrl_setup_2
        or      ax, ax
        je      br_0CA82
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     ax, 8deh
        push    dx
        push    ax
        push    40h
        nop
        push    cs
        call    ctrl_port_48_read
        or      ax, ax
        je      br_0CA82
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    envelope_process_2
        or      ax, ax
        je      br_0CA82
        mov     ax, 1
        pop     si
        pop     di
        leave
        retf    4

br_0CA82:
        xor     ax, ax
        pop     si
        pop     di
        leave
        retf    4

; ? no port I/O: validates the fixed values 0x40 and 0x19.
ctrl_port_48_B8_3:
        enter   8, 0
        push    di
        push    si
        mov     word ptr [bp-4], 40h
        mov     word ptr [bp-2], 19h
        lea     ax, [bp-4]
        push    ss
        push    ax
        push    2
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        je      br_0CAEC
        lea     ax, [bp-2]
        push    ss
        push    ax
        push    2
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        je      br_0CAEC
        xor     di, di
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     ax, 22h
        mov     si, ax
        mov     word ptr [bp-6], dx

loop_0CACA:
        push    word ptr [bp-6]
        push    si
        push    word ptr [bp-2]
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        je      br_0CAEC
        add     si, 1dh
        inc     di
        cmp     di, 40h
        jb      loop_0CACA
        mov     ax, 1
        pop     si
        pop     di
        leave
        retf    4

br_0CAEC:
        xor     ax, ax
        pop     si
        pop     di
        leave
        retf    4

smem_ctrl_setup_2:
        enter   2, 0
        mov     word ptr [bp-2], 6
        lea     ax, [bp-2]
        push    ss
        push    ax
        push    2
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        je      br_0CB2A
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        mov     ax, word ptr [bp-2]
        mul     word ptr [bp+6]
        push    ax
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        je      br_0CB2A
        mov     ax, 1
        leave
        retf    6

br_0CB2A:
        xor     ax, ax
        leave
        retf    6

; ? no port 0x48 read: calls two near helpers.
ctrl_port_48_read:
        push    bp
        mov     bp, sp
        lea     ax, [bp+6]
        push    ss
        push    ax
        push    2
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        je      br_0CB5C
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        je      br_0CB5C
        mov     ax, 1
        leave
        retf    6

br_0CB5C:
        xor     ax, ax
        leave
        retf    6

envelope_process_2:
        enter   8, 0
        push    si
        mov     word ptr [bp-2], 48h
        mov     word ptr [bp-4], 4
        mov     word ptr [bp-6], 0ch
        lea     ax, [bp-8]
        push    ss
        push    ax
        mov     ax, 2
        mov     word ptr [bp-8], ax
        push    ax
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        je      br_0CBFA
        lea     ax, [bp-2]
        push    ss
        push    ax
        push    2
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        je      br_0CBFA
        mov     si, word ptr [bp+6]
        mov     ax, si
        mov     dx, word ptr [bp+8]
        add     ax, 91eh
        push    dx
        push    ax
        mov     ax, word ptr [bp-2]
        mul     word ptr [bp-8]
        push    ax
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        je      br_0CBFA
        lea     ax, [bp-4]
        push    ss
        push    ax
        push    2
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        je      br_0CBFA
        lea     ax, [bp-6]
        push    ss
        push    ax
        push    2
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        je      br_0CBFA
        mov     ax, si
        mov     dx, word ptr [bp+8]
        add     ax, 9aeh
        push    dx
        push    ax
        mov     ax, word ptr [bp-6]
        mul     word ptr [bp-4]
        push    ax
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        je      br_0CBFA
        mov     ax, 1
        pop     si
        leave
        retf    4

br_0CBFA:
        xor     ax, ax
        pop     si
        leave
        retf    4
        db      00h
_memcpy_6:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        push    ds
        mov     si, ax
        mov     ds, dx
        les     di, [bp+0ah]
        mov     cx, 14h
        rep movsw
        pop     ds
        pop     si
        pop     di
        leave
        retf    8
        db      00h
ctrl_port_48_read2:
        enter   0ah, 0
        push    si
        mov     si, word ptr [bp+6]
        mov     word ptr [G_ERRNO], ERR_UNKNOWN
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[si+6]
        mov     cx, word ptr es:[si]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], cx
        mov     al, byte ptr es:[si+13h]
        mov     byte ptr [bp-9], al
        if      FW_VERSION = 172
        mov     al, byte ptr es:[si+0ch]
        mov     byte ptr [bp-0ah], al
        endif
        nop
        push    cs
        call    far_0CDBA
        if      FW_VERSION = 172
        mov     word ptr [bp-8], ax
        endif
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      L_0CCA6
        if      FW_VERSION = 172
        mov     al, byte ptr [bp-0ah]
        sub     ah, ah
        dec     ax
        je      L_0CC92
        endif
        cmp     byte ptr [bp-9], 0
        je      L_0CC7E
        push    word ptr [bp-6]
        if      FW_VERSION = 172
        push    word ptr [bp-8]
        else
        push    ax
        endif
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    ctrl_io_setup
        jmp     br_0CCAC

L_0CC7E:
        push    word ptr [bp-6]
        if      FW_VERSION = 172
        push    word ptr [bp-8]
        else
        push    ax
        endif
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    far_memop_handler_2
        jmp     br_0CCAC
        db      90h
        if      FW_VERSION = 172

L_0CC92:
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        callf   TEXT1_SEG:int2F_fn14_caller
        jmp     br_0CCAC
        db      90h

        endif
L_0CCA6:
        mov     word ptr [G_ERRNO], ERR_INTERNAL

br_0CCAC:
        cmp     word ptr [G_ERRNO], ERR_UNKNOWN
        je      br_0CCB8
        nop
        push    cs
        call    err_msg_report

br_0CCB8:
        pop     si
        leave
        retf    4
        db      00h

far_memop_handler_2:
        enter   32h, 0
        push    di
        push    si
        mov     si, word ptr [bp+0ah]
        mov     di, word ptr [bp+6]
        mov     byte ptr [bp-0ah], 1
        mov     byte ptr [bp-9], 4
        lea     ax, [bp-32h]
        push    ss
        push    ax
        push    word ptr [bp+0ch]
        push    si
        nop
        push    cs
        call    _memcpy_6
        push    word ptr [bp+8]
        push    di
        callf   TEXT1_SEG:int2F_call_fn14
        add     sp, 4
        or      ax, ax
        jne     br_0CCFA
        mov     word ptr [G_ERRNO], ERR_FILE_EXISTS
        jmp     br_0CDB2
        db      90h

br_0CCFA:
        push    word ptr [bp+8]
        push    di
        push    0
        nop
        push    cs
        call    mem_block_process
        or      ax, ax
        jne     br_0CD0C
        jmp     br_0CDB2

br_0CD0C:
        lea     ax, [bp-0ah]
        push    ss
        push    ax
        push    2
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        jne     br_0CD1F
        jmp     br_0CDB2

br_0CD1F:
        lea     ax, [bp-32h]
        push    ss
        push    ax
        push    28h
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        jne     br_0CD32
        jmp     br_0CDB2
br_0CD32:
        mov     es, word ptr [bp+0ch]
        mov     bx, word ptr es:[si+SND_POOL_IDX]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL]
        mov     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    dx
        push    ax
        mov     ax, word ptr es:[si+SND_LENGTH]
        mov     dx, word ptr es:[si+SND_LENGTH_HI]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        push    dx
        push    ax
        nop
        push    cs
        call    bcd_time_format
        or      ax, ax
        je      br_0CD9C
        mov     es, word ptr [bp+0ch]
        cmp     byte ptr es:[si+SND_STEREO], 0
        je      br_0CDA4
        mov     ax, word ptr es:[si+SND_LENGTH]
        mov     dx, word ptr es:[si+SND_LENGTH_HI]
        add     ax, 0fh
        adc     dx, 0
        and     al, 0f0h
        add     ax, word ptr [bp-4]
        adc     dx, word ptr [bp-2]
        push    dx
        push    ax
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        nop
        push    cs
        call    bcd_time_format
        or      ax, ax
        jne     br_0CDA4

br_0CD9C:
        callf   TEXT1_SEG:int2F_dispatch_10
        jmp     br_0CDB2
        db      90h

br_0CDA4:
        callf   TEXT1_SEG:int2F_dispatch_10
        mov     ax, 1
        pop     si
        pop     di
        leave
        retf    8

br_0CDB2:
        xor     ax, ax
        pop     si
        pop     di
        leave
        retf    8
far_0CDBA:
        push    word ptr [PTR_SEQ_LIST_HEAD+2]
        push    word ptr [PTR_SEQ_LIST_HEAD]
        nop
        push    cs
        call    sample_ptr_helper
        or      ax, ax
        je      br_0CDD4
        mov     ax, word ptr [PTR_SEQ_LIST_HEAD]
        mov     dx, word ptr [PTR_SEQ_LIST_HEAD+2]
        retf
        db      90h

br_0CDD4:
        xor     ax, ax
        cwd
        retf

L_0CDD8:
        pusha
        push    ds
        push    es
        mov     bp, sp
        sub     sp, 4
        push    ds
        mov     ax, DATA_SEG
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
        je      X_0CE08
        dec     ax
        je      X_0CE10
        dec     ax
        je      X_0CE18
        dec     ax
        je      X_0CE26
        jmp     SHORT X_0CE2F
        db      90h

X_0CE08:
        nop
        push    cs
        call    sample_delete_flagged
        jmp     SHORT X_0CE2F
        db      90h

X_0CE10:
        nop
        push    cs
        call    sample_addr_from_disk
        jmp     SHORT X_0CE2F
        db      90h

X_0CE18:
        push    word ptr [bp-2]
        push    si
        nop
        push    cs
        call    sample_access_short
        mov     word ptr [bp+12h], ax
        jmp     SHORT X_0CE2F

X_0CE26:
        push    word ptr [bp-2]
        push    si
        nop
        push    cs
        call    sample_access_triple

X_0CE2F:
        mov     sp, bp
        pop     es
        pop     ds
        popa
        iret
        db      00h

sample_access_short:
        enter   12h, 0
        push    10h
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        lea     ax, [bp-12h]
        push    ss
        push    ax
        callf   TEXT1_SEG:__fstrncpy
        add     sp, 0ah
        mov     byte ptr [bp-2], 0
        lea     ax, [bp-12h]
        push    ss
        push    ax
        nop
        push    cs
        call    sample_ptr_access
        push    dx
        push    ax
        nop
        push    cs
        call    sample_check_active
        leave
        retf    4
sample_access_triple:
        enter   16h, 0
        push    si
        push    10h
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        lea     ax, [bp-16h]
        push    ss
        push    ax
        callf   TEXT1_SEG:__fstrncpy
        add     sp, 0ah
        mov     byte ptr [bp-6], 0
        lea     ax, [bp-16h]
        push    ss
        push    ax
        nop
        push    cs
        call    sample_ptr_access
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    dx
        push    ax
        nop
        push    cs
        call    sample_check_active
        or      ax, ax
        je      tgt_0CEB2
        push    word ptr [bp-2]
        push    si
        nop
        push    cs
        call    smem_proc_wrapper
        push    word ptr [bp-2]
        push    si
        nop
        push    cs
        call    sample_validate_ptr

tgt_0CEB2:
        pop     si
        leave
        retf    4
        db      00h

; far disk-parameter-block ptr [bp+6] -> ES:SI, then INT 40h.
int40_disk_wrapper:
        push    bp
        mov     bp, sp
        push    di

L_0CEBC:
        push    si
        push    ds
        push    bp
        les     si, [bp+6]
        mov     bl, 0eh
        int     40h                       ; Disk I/O
        or      ax, ax
        je      br_0CECE
        sub     si, si
        sub     di, di

br_0CECE:
        mov     dx, si
        mov     ax, di
        pop     bp
        pop     ds
        pop     si
        pop     di
        leave
        retf    4
; ? reads a word at argument+1 and returns argument + (word+8)/2.
smem_block_skip:
        enter   2, 0
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        add     ax, 1
        adc     dx, 0
        push    dx
        push    ax
        lea     ax, [bp-2]
        push    ss
        push    ax
        push    1
        nop
        push    cs
        call    smem_read_words
        mov     ax, word ptr [bp-2]
        add     ax, 8
        shr     ax, 1
        sub     dx, dx
        add     ax, word ptr [bp+6]
        adc     dx, word ptr [bp+8]
        leave
        retf    4
memcpy_far_handler:
        enter   6ah, 0
        push    di
        push    si
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        nop
        push    cs
        call    int40_disk_wrapper
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     br_0CF30
        mov     word ptr [G_ERRNO], ERR_CANT_OPEN
        jmp     br_0CFEE
br_0CF30:
        push    word ptr [bp-2]
        push    ax
        lea     ax, [bp-8]
        push    ss
        push    ax
        push    1
        nop
        push    cs

        call    smem_read_words
        cmp     byte ptr [bp-8], 81h
        je      br_0CF49
        jmp     br_0CFE8

br_0CF49:
        cmp     byte ptr [bp-7], 4
        je      br_0CF52
        jmp     br_0CFE8

br_0CF52:
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        add     ax, 2
        adc     dx, 0
        push    dx
        push    ax
        lea     ax, [bp-34h]
        push    ss
        push    ax
        push    14h
        nop
        push    cs
        call    smem_read_words
        lea     ax, [bp-6ah]
        push    ss
        push    ax
        lea     ax, [bp-34h]
        push    ss
        push    ax
        nop
        push    cs
        call    _memcpy_5
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    smem_block_skip
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        sub     ax, 2
        sbb     dx, 0
        push    dx
        push    ax
        lea     ax, [bp-0ch]
        push    ss
        push    ax
        push    2
        nop
        push    cs
        call    smem_read_words
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        callf   TEXT1_SEG:midi_status_process
        mov     word ptr [bp-6], ax
        inc     ax
        jne     br_0CFC0
        mov     word ptr [G_ERRNO], ERR_INTERNAL
        jmp     br_0CFEE
        db      90h
br_0CFC0:
        mov     ax, word ptr [bp-6]
        mov     word ptr [bp-3ah], ax
        sub     sp, 36h
        push    ds
        lea     si, [bp-6ah]
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
        call    sample_pool_add
        pop     si
        pop     di
        leave
        retf    4
        db      90h
br_0CFE8:
        mov     word ptr [G_ERRNO], ERR_UNKNOWN_FILE_TYPE

br_0CFEE:
        xor     ax, ax
        cwd
        pop     si
        pop     di
        leave
        retf    4
        db      00h
ctrl_io_setup:
        enter   40h, 0
        push    di
        push    si
        mov     si, word ptr [bp+0ah]
        lea     ax, [bp-3ch]
        push    ss
        push    ax
        push    word ptr [bp+0ch]
        push    si
        nop
        push    cs
        call    _memcpy_6
        mov     byte ptr [bp-40h], 81h
        mov     byte ptr [bp-3fh], 4
        mov     word ptr [bp-3eh], 38h
        mov     es, word ptr [bp+0ch]
        mov     bx, word ptr es:[si+SND_POOL_IDX]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL_LEN]
        mov     dx, word ptr [bx+SMEM_POOL_LEN_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        xor     ax, ax
        mov     cx, 8
        lea     di, [bp-14h]
        push    ss
        pop     es
        rep stosw
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   TEXT1_SEG:int2F_call_fn14
        add     sp, 4
        or      ax, ax
        jne     br_0D068
        mov     word ptr [G_ERRNO], ERR_FILE_EXISTS

; ? no port I/O: copies 6 words via _memcpy_6 from a caller struct.
loop_0D05E:
        mov     ax, 1
        pop     si
        pop     di
        leave
        retf    8
        db      90h

br_0D068:
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    0
        nop
        push    cs
        call    mem_block_process
        or      ax, ax
        je      br_0D0BF
        lea     ax, [bp-40h]
        push    ss
        push    ax
        push    40h
        nop
        push    cs
        call    bcd_display_calc
        or      ax, ax
        je      br_0D0BA
        mov     es, word ptr [bp+0ch]
        mov     bx, word ptr es:[si+SND_POOL_IDX]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        push    word ptr [bx+SMEM_POOL_BASE_HI]
        push    word ptr [bx+SMEM_POOL]
        push    word ptr [bx+SMEM_POOL_LEN_HI]
        push    word ptr [bx+SMEM_POOL_LEN]
        nop
        push    cs
        call    bcd_time_format
        or      ax, ax
        je      br_0D0BA
        callf   TEXT1_SEG:int2F_dispatch_10
        jmp     loop_0D05E
        db      90h

br_0D0BA:
        callf   TEXT1_SEG:int2F_dispatch_10

br_0D0BF:
        xor     ax, ax
        pop     si
        pop     di
        leave
        retf    8
        db      90h
L_0D0C8                         equ     $+00h
        pusha
        push    ds
        push    es
        mov     bp, sp
        push    ds
        mov     ax, DATA_SEG
        mov     ds, ax
        cld
        mov     al, byte ptr [SDS_RX_PORT]
        cbw
        mov     cl, byte ptr [bp+13h]
        sub     ch, ch
        cmp     cx, ax
        jne     X_0D0F8
        cmp     byte ptr [bp+12h], 0f8h
        jae     X_0D0F8
        mov     al, byte ptr [bp+12h]
        mov     bl, byte ptr [G_MIDI_IN_RING_WR]
        sub     bh, bh
        mov     byte ptr [bx+P_8B9E], al
        inc     byte ptr [G_MIDI_IN_RING_WR]

X_0D0F8:
        mov     sp, bp
        pop     es
        pop     ds
        popa
        iret

data_far_write:
        enter   4, 0
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_4280
        callf   TEXT1_SEG:disp_list_run
        push    0
        push    0
        push    7bh
        push    31h
        nop
        push    cs
        call    cmd_build_dispatch
        push    7dh
        push    0
        push    7ah
        push    31h
        nop
        push    cs
        call    cmd_build_dispatch
        push    3
        push    0fh
        push    ds
        push    STR_RECEIVE_READY
        nop
        push    cs
        call    cmd_dispatch_1E
        push    3
        push    18h
        push    ds
        push    STR_THIS_PAGE_OPEN
        nop
        push    cs
        call    cmd_dispatch_1E
        push    3
        push    25h
        push    ds
        push    STR_REQUEST_NO
        nop
        push    cs
        call    cmd_dispatch_1E
        push    80h
        push    0eh
        push    ds
        push    STR_SND_5
        nop
        push    cs
        call    cmd_dispatch_1E
        push    80h
        push    25h
        push    ds
        push    STR_EXCLUSIVE_CH
        nop
        push    cs
        call    cmd_dispatch_1E
        push    69h
        push    2
        mov     al, byte ptr [SDS_RX_PORT]
        cbw
        inc     ax
        cwd
        push    dx
        push    ax
        push    1
        nop
        push    cs
        call    draw_unsigned_value
        push    4bh
        push    25h
        mov     al, byte ptr [SDS_REQUEST_NUM]
        sub     ah, ah
        push    0
        push    ax
        push    3
        nop
        push    cs
        call    draw_unsigned_value
        push    0e6h
        push    2
        mov     al, byte ptr [SDS_TX_PORT]
        add     al, 41h
        push    ax
        nop
        push    cs
        call    cmd_ratio_setup
        mov     ax, word ptr [PTR_LCD_STATE+2]
        or      ax, word ptr [PTR_LCD_STATE]
        je      br_0D1EE
        push    80h
        push    17h
        push    word ptr [PTR_LCD_STATE+2]
        push    word ptr [PTR_LCD_STATE]
        nop
        push    cs
        call    cmd_dispatch_1E
        les     bx, [PTR_LCD_STATE]
        cmp     byte ptr es:[bx+SND_STEREO], 0
        je      br_0D1FC
        mov     byte ptr [bp-4], 3ah
        mov     byte ptr [bp-3], 4ch
        mov     byte ptr [bp-2], 0
        cmp     byte ptr [SDS_STEREO_SIDE], 0
        je      br_0D1E1
        mov     byte ptr [bp-3], 52h

br_0D1E1:
        push    0e0h
        push    17h
        lea     ax, [bp-4]
        push    ss
        push    ax
        jmp     br_0D1F7
        db      90h

br_0D1EE:
        push    80h
        push    17h
        push    ds
        push    STR_NO_SOUND

br_0D1F7:
        nop
        push    cs
        call    cmd_dispatch_1E

br_0D1FC:
        push    0ceh
        push    25h
        mov     al, byte ptr [SDS_EXCL_CH]
        sub     ah, ah
        push    0
        push    ax
        push    3
        nop
        push    cs
        call    draw_unsigned_value
        nop
        push    cs
        call    field_redraw
        test    byte ptr [SDS_STATE], SDS_ST_SEND|SDS_ST_TX
        jne     br_0D234
        test    byte ptr [SDS_STATE], SDS_ST_RX
        je      br_0D22E
        push    1
        push    34h
        push    ds
        push    STR_RECEIVING
        jmp     br_0D23C
        db      90h

br_0D22E:
        push    ds
        push    DL_SOFTKEYS_MIDI_DUMP
        jmp     L_0D245

br_0D234:
        push    1
        push    34h
        push    ds
        push    STR_SENDING

br_0D23C:
        nop
        push    cs
        call    cmd_dispatch_1E
        push    ds
        push    P_42E6

L_0D245:
        callf   TEXT1_SEG:disp_list_run
        pop     ds
        leave
        retf
        db      00h

; closes the window, then calls the far pointer L_0ACFE stored at W_5138
; (W_513C for L_0CDFE).
L_0CDEC:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        callf   TEXT1_SEG:far_0AD74
        callf   [W_5138]
        pop     ds
        retf
        db      00h

L_0CDFE:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        callf   TEXT1_SEG:far_0AD74
        callf   [W_513C]
        pop     ds
        retf
        db      00h

L_0D272:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    3
        nop
        push    cs
        call    int43_wrapper
        pop     ds
        retf
        if      FW_VERSION = 172
        db      00h

L_0D282:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        callf   TEXT1_SEG:far_0AD74
        push    ds
        push    TBL_WINKEYS_RECEIVE_MODE
        callf   TEXT1_SEG:win_keys_merge
        push    ds
        push    B_8CED
        push    1
        push    73h
        push    1ch
        push    7
        push    0
        push    0
        endif
        nop
        if      FW_VERSION = 172
        push    cs
        call    voice_trigger_full
        pop     ds
        retf
        db      00h

receive_mode_paint:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_438C
        callf   TEXT1_SEG:disp_list_run
        push    73h
        push    1ch
        mov     al, byte ptr [B_8CED]
        cbw
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        add     ax, ax
        add     ax, cx
        add     ax, P_4360
        push    ds
        push    ax
        nop
        push    cs
        call    cmd_dispatch_1E
        nop
        push    cs
        call    field_redraw
        pop     ds
        retf

receive_mode_refresh:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        pop     ds
        retf
        endif

keep_or_retry_paint:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_KEEP_OR_RETRY
        callf   TEXT1_SEG:disp_list_run
        push    85h
        push    13h
        push    ds
        push    P_5140
        nop
        push    cs
        call    cmd_dispatch_1E
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        push    ax
        push    85h
        push    25h
        nop
        push    cs
        call    timer_value_read_3
        cmp     byte ptr [G_KEEP_RETRY_FOCUS], 0
        jne     X_0D32B
        push    49h
        push    1ch
        push    word ptr [PTR_STR_PRESS_ENTER_SEG]
        push    word ptr [PTR_STR_PRESS_ENTER]
        nop
        push    cs
        call    cmd_dispatch_1E

X_0D32B:
        nop
        push    cs
        call    field_redraw
        pop     ds
        retf

X_0D332:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_5140
        nop
        push    cs
        call    lcd_set_cursor
        pop     ds
        retf
        db      00h

X_0D344:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_5140
        nop
        push    cs
        call    voice_release_all_if
        pop     ds
        retf
        db      00h

X_0D356:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        les     bx, [SND_CURRENT]
        cmp     byte ptr es:[bx+SND_STEREO], 0
        je      br_0D36E
        nop
        push    cs
        call    string_int_access
        pop     ds
        retf

br_0D36E:
        nop
        push    cs
        call    string_far_access
        pop     ds
        retf
        db      00h

; ?
string_far_access:
        enter   2, 0

L_0D37A:
        push    si
        push    ds
        push    TBL_WINKEYS_MONO_TO_STEREO
        callf   TEXT1_SEG:win_keys_merge
        xor     si, si

loop_0D386:
        les     bx, [SND_CURRENT]
        mov     al, byte ptr es:[bx+si]
        mov     byte ptr [bp-2], al
        cmp     al, 20h
        jne     br_0D39C
        mov     byte ptr [si+TBL_SOUND_NAMES], 5fh
        jmp     X_0D3A3
        db      90h

br_0D39C:
        mov     al, byte ptr [bp-2]
        mov     byte ptr [si+TBL_SOUND_NAMES], al
X_0D3A3:
        inc     si
        cmp     si, 0eh
        jl      loop_0D386
        mov     byte ptr [B_8FCA], 2dh
        mov     byte ptr [B_8FCB], 53h
        mov     byte ptr [B_8FCC], 0
        mov     ax, word ptr [SND_CURRENT]
        mov     dx, word ptr [SND_CURRENT+2]
        mov     word ptr [FP_SND_SECONDARY], ax
        mov     word ptr [FP_SND_SECONDARY_SEG], dx
        nop
        push    cs
        call    mono_to_stereo_up
        pop     si
        leave
        retf

mono_to_stereo_paint:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_MONO_TO_STEREO
        callf   TEXT1_SEG:disp_list_run
        push    8bh
        push    0fh
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    cmd_dispatch_1E
        push    8bh
        push    1eh
        push    word ptr [FP_SND_SECONDARY_SEG]
        push    word ptr [FP_SND_SECONDARY]
        nop
        push    cs
        call    cmd_dispatch_1E
        push    8bh
        push    28h
        push    ds
        push    TBL_SOUND_NAMES
        nop
        push    cs
        call    cmd_dispatch_1E
        nop
        push    cs
        call    field_redraw
        pop     ds
        retf

mono_to_stereo_up:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        nop
        push    cs
        call    X_02D4A
        nop
        push    cs
        call    field_edit_disable
        push    ds
        push    FP_SND_SECONDARY
        push    0
        push    8bh
        push    1eh
        push    0
        push    0
        callf   TEXT1_SEG:far_035F2
        pop     ds
        retf

mono_to_stereo_down:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    TBL_SOUND_NAMES
        push    8bh
        push    28h
        callf   TEXT1_SEG:far_call_wrapper_1
        pop     ds
        retf

sample_string_access:
        enter   50h, 0
        push    di

L_0D457:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    TBL_SOUND_NAMES
        nop
        push    cs
        call    sample_ptr_access
        or      dx, ax
        je      br_0D47C
        mov     word ptr [G_ERRNO], ERR_NAME_IN_USE
        nop
        push    cs
        call    err_msg_report
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      90h

br_0D47C:
        push    word ptr [PTR_DL_PROCESSING_SEG]
        push    word ptr [PTR_DL_PROCESSING]
        callf   TEXT1_SEG:disp_list_run
        lea     ax, [bp-16h]
        push    ss
        push    ax
        callf   TEXT1_SEG:__setjmp
        add     sp, 4
        or      ax, ax
        je      br_0D4A2
        nop
        push    cs
        call    err_msg_report
        jmp     br_0D65B
br_0D4A2:
        mov     ax, word ptr [SND_CURRENT]
        mov     dx, word ptr [SND_CURRENT+2]
        push    ds
        lea     di, [bp-4ch]
        mov     si, ax
        push    ss
        pop     es
        mov     ds, dx
        mov     cx, 1bh
        rep movsw
        pop     ds
        mov     byte ptr [bp-39h], 1
        les     bx, [SND_CURRENT]
        mov     bx, word ptr es:[bx+SND_POOL_IDX]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL_LEN]
        mov     dx, word ptr [bx+SMEM_POOL_LEN_HI]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        lea     ax, [bp-1ch]
        push    ss
        push    ax
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        add     ax, ax
        adc     dx, dx
        push    dx
        push    ax
        push    0
        nop
        push    cs
        call    mem_io_handler
        or      ax, ax
        jne     br_0D509
        push    word ptr [G_ERRNO]
        lea     ax, [bp-16h]
        push    ss
        push    ax
        callf   TEXT1_SEG:_longjmp
        add     sp, 6

br_0D509:
        les     bx, [SND_CURRENT]
        mov     bx, word ptr es:[bx+SND_POOL_IDX]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        push    word ptr [bx+SMEM_POOL_BASE_HI]
        push    word ptr [bx+SMEM_POOL]
        mov     bx, word ptr [bp-1ch]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        push    word ptr [bx+SMEM_POOL_BASE_HI]
        push    word ptr [bx+SMEM_POOL]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    smem_copy_buffered
        les     bx, [FP_SND_SECONDARY]
        mov     bx, word ptr es:[bx+SND_POOL_IDX]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        push    word ptr [bx+SMEM_POOL_BASE_HI]
        push    word ptr [bx+SMEM_POOL]
        mov     bx, word ptr [bp-1ch]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL]
        mov     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        add     ax, word ptr [bp-4]
        adc     dx, word ptr [bp-2]
        push    dx
        push    ax
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    smem_copy_buffered
        les     bx, [FP_SND_SECONDARY]
        mov     ax, word ptr es:[bx+SND_LENGTH]
        mov     dx, word ptr es:[bx+SND_LENGTH_HI]
        mov     word ptr [bp-50h], ax
        mov     word ptr [bp-4eh], dx
        cmp     dx, word ptr [bp-2]
        jg      br_0D5D6
        jl      br_0D59F
        cmp     ax, word ptr [bp-4]
        jae     br_0D5D6
br_0D59F:
        mov     bx, word ptr [bp-1ch]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL]
        mov     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        add     ax, word ptr [bp-50h]
        adc     dx, word ptr [bp-4eh]
        add     ax, word ptr [bp-4]
        adc     dx, word ptr [bp-2]
        push    dx
        push    ax
        push    0
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        sub     ax, word ptr [bp-50h]
        sbb     dx, word ptr [bp-4eh]
        push    dx
        push    ax
        nop
        push    cs
        call    smem_fill

br_0D5D6:
        push    ds
        mov     di, TBL_SOUND_NAMES
        lea     si, [bp-4ch]
        mov     cx, ds
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
        sub     sp, 36h
        push    ds
        lea     si, [bp-4ch]
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
        call    sample_pool_add
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     si, ax
        mov     ax, dx
        or      ax, si
        jne     br_0D647
        push    word ptr [bp-1ch]
        callf   TEXT1_SEG:smem_free
        mov     word ptr [G_ERRNO], ERR_SOUND_DIR_FULL
        push    word ptr [G_ERRNO]
        lea     ax, [bp-16h]
        push    ss
        push    ax
        callf   TEXT1_SEG:_longjmp
        add     sp, 6

br_0D647:
        mov     ax, word ptr [bp-2]
        mov     word ptr [SND_CURRENT], si
        mov     word ptr [SND_CURRENT+2], ax
        mov     word ptr [bp-4], si
        push    ax
        push    si
        nop
        push    cs
        call    voice_buffer_init

br_0D65B:
        push    ds
        push    P_44CD
        callf   TEXT1_SEG:disp_list_run
        nop
        push    cs
        call    snd_edit_page_return
        pop     ds
        pop     si
        pop     di
        leave
        retf

; ?
string_int_access:
        enter   2, 0

L_0D672:
        push    si
        push    ds
        push    TBL_WINKEYS_STEREO_TO_MONO
        callf   TEXT1_SEG:win_keys_merge
        xor     si, si

loop_0D67E:
        les     bx, [SND_CURRENT]
        mov     al, byte ptr es:[bx+si]
        mov     byte ptr [bp-2], al
        cmp     al, 20h
        jne     L_0D690
        mov     al, 5fh
        jmp     X_0D693

L_0D690:
        mov     al, byte ptr [bp-2]

X_0D693:
        mov     byte ptr [si+P_8FCD], al
        mov     byte ptr [si+TBL_SOUND_NAMES], al
        inc     si
        cmp     si, 0eh
        jl      loop_0D67E
        mov     al, 2dh
        mov     byte ptr [B_8FDB], al
        mov     byte ptr [B_8FCA], al
        xor     al, al
        mov     byte ptr [B_8FDD], al
        mov     byte ptr [B_8FCC], al
        mov     byte ptr [B_8FCB], 4ch
        mov     byte ptr [B_8FDC], 52h
        nop
        push    cs
        call    stereo_to_mono_up
        pop     si
        leave
        retf
        db      00h

stereo_to_mono_paint:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    DL_STEREO_TO_MONO
        callf   TEXT1_SEG:disp_list_run
        push    8bh
        push    0fh
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        nop
        push    cs
        call    cmd_dispatch_1E
        push    8bh
        push    1eh
        push    ds
        push    TBL_SOUND_NAMES
        nop
        push    cs
        call    cmd_dispatch_1E
        push    8bh
        push    28h
        push    ds
        push    P_8FCD
        nop
        push    cs
        call    cmd_dispatch_1E
        nop
        push    cs
        call    field_redraw
        pop     ds
        retf

stereo_to_mono_up:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    TBL_SOUND_NAMES
        push    8bh
        push    1eh
        callf   TEXT1_SEG:far_call_wrapper_1
        pop     ds
        retf

stereo_to_mono_down:
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    P_8FCD
        push    8bh
        push    28h
        callf   TEXT1_SEG:far_call_wrapper_1
        pop     ds
        retf

sample_process_large:
        enter   50h, 0
        push    di

L_0D739:
        push    si
        push    ds
        mov     cx, DATA_SEG
        mov     ds, cx
        push    cx
        push    TBL_SOUND_NAMES
        nop
        push    cs
        call    sample_ptr_access
        or      dx, ax
        je      br_0D750
        jmp     br_0D9BE

br_0D750:
        push    ds
        push    P_8FCD
        nop
        push    cs
        call    sample_ptr_access
        or      dx, ax
        je      br_0D760
        jmp     br_0D9BE

br_0D760:
        mov     di, P_8FCD
        mov     si, TBL_SOUND_NAMES
        mov     cx, ds
        mov     es, cx
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        sub     di, cx
        repe cmpsb
        je      br_0D77E
        sbb     ax, ax
        sbb     ax, 0ffffh

br_0D77E:
        or      ax, ax
        jne     br_0D785
        jmp     br_0D9BE

br_0D785:
        push    word ptr [PTR_DL_PROCESSING_SEG]
        push    word ptr [PTR_DL_PROCESSING]
        callf   TEXT1_SEG:disp_list_run
        lea     ax, [bp-1ah]
        push    ss
        push    ax
        callf   TEXT1_SEG:__setjmp
        add     sp, 4
        or      ax, ax
        je      L_0D7AC
        nop
        push    cs
        call    err_msg_report
        jmp     br_0D9AA
        db      90h

L_0D7AC:
        mov     ax, word ptr [SND_CURRENT]
        mov     dx, word ptr [SND_CURRENT+2]
        push    ds
        lea     di, [bp-50h]
        mov     si, ax
        push    ss
        pop     es
        mov     ds, dx
        mov     cx, 1bh
        rep movsw
        pop     ds
        mov     byte ptr [bp-3dh], 0

L_0D7C7:
        push    0
        push    2
        les     bx, [SND_CURRENT]
        mov     bx, word ptr es:[bx+SND_POOL_IDX]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        push    word ptr [bx+SMEM_POOL_LEN_HI]
        push    word ptr [bx+SMEM_POOL_LEN]
        callf   TEXT1_SEG:__aFldiv
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        lea     ax, [bp-20h]
        push    ss
        push    ax
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    0
        nop
        push    cs
        call    mem_io_handler
        or      ax, ax
        jne     br_0D816
        push    word ptr [G_ERRNO]
        lea     ax, [bp-1ah]
        push    ss
        push    ax
        callf   TEXT1_SEG:_longjmp
        add     sp, 6

br_0D816:
        les     bx, [SND_CURRENT]
        mov     bx, word ptr es:[bx+SND_POOL_IDX]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        mov     ax, word ptr [bx+SMEM_POOL]
        mov     dx, word ptr [bx+SMEM_POOL_BASE_HI]
        add     ax, word ptr [bp-4]
        adc     dx, word ptr [bp-2]
        push    dx
        push    ax
        mov     bx, word ptr [bp-20h]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        push    word ptr [bx+SMEM_POOL_BASE_HI]
        push    word ptr [bx+SMEM_POOL]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    smem_copy_buffered
        push    ds
        mov     di, P_8FCD
        lea     si, [bp-50h]
        mov     cx, ds
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
        sub     sp, 36h
        push    ds
        lea     si, [bp-50h]
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
        call    sample_pool_add
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     ax, dx
        or      ax, word ptr [bp-8]
        jne     br_0D8C6
        push    word ptr [bp-20h]
        callf   TEXT1_SEG:smem_free
        mov     word ptr [G_ERRNO], ERR_SOUND_DIR_FULL
        push    word ptr [G_ERRNO]
        lea     ax, [bp-1ah]
        push    ss
        push    ax
        callf   TEXT1_SEG:_longjmp
        add     sp, 6

br_0D8C6:
        lea     ax, [bp-20h]
        push    ss
        push    ax
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    0
        nop
        push    cs
        call    mem_io_handler
        or      ax, ax
        jne     br_0D8ED
        push    word ptr [G_ERRNO]
        lea     ax, [bp-1ah]
        push    ss
        push    ax
        callf   TEXT1_SEG:_longjmp
        add     sp, 6

br_0D8ED:
        les     bx, [SND_CURRENT]
        mov     bx, word ptr es:[bx+SND_POOL_IDX]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        push    word ptr [bx+SMEM_POOL_BASE_HI]
        push    word ptr [bx+SMEM_POOL]
        mov     bx, word ptr [bp-20h]
        mov     ax, bx
        shl     bx, 2
        add     bx, ax
        add     bx, bx
        push    word ptr [bx+SMEM_POOL_BASE_HI]
        push    word ptr [bx+SMEM_POOL]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    smem_copy_buffered
        push    ds
        mov     di, TBL_SOUND_NAMES
        lea     si, [bp-50h]
        mov     cx, ds
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
        sub     sp, 36h
        push    ds
        lea     si, [bp-50h]
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
        call    sample_pool_add
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     si, ax
        mov     ax, dx
        or      ax, si
        jne     br_0D996
        push    word ptr [bp-20h]
        callf   TEXT1_SEG:smem_free
        mov     word ptr [G_ERRNO], ERR_SOUND_DIR_FULL
        push    word ptr [G_ERRNO]
        lea     ax, [bp-1ah]
        push    ss
        push    ax
        callf   TEXT1_SEG:_longjmp
        add     sp, 6

br_0D996:
        mov     ax, word ptr [bp-6]
        mov     word ptr [SND_CURRENT], si
        mov     word ptr [SND_CURRENT+2], ax
        mov     word ptr [bp-8], si
        push    ax
        push    si
        nop
        push    cs
        call    voice_buffer_init

br_0D9AA:
        push    ds
        push    TBL_WINKEYS_0455B
        callf   TEXT1_SEG:disp_list_run
        nop
        push    cs
        call    snd_edit_page_return
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      90h

br_0D9BE:
        mov     word ptr [G_ERRNO], ERR_NAME_IN_USE
        nop
        push    cs
        call    err_msg_report
        pop     ds
        pop     si
        pop     di
        leave
        retf

fn_0D9CE:
        mov     word ptr [W_9D58], 7fffh
        sub     ax, ax
        mov     word ptr [W_983E], ax
        mov     word ptr [W_983C], ax
        mov     word ptr [W_64BC], ax
        mov     word ptr [W_64BA], ax
        mov     word ptr [W_8FB8], ax
        mov     word ptr [P_9F22], ax
        retf
        CODE_END
T2_END:
