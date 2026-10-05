; CS1_SEG: native x86, INT 2Bh bytecode, dispatcher with 93-word handler table
; one source for v1.50/v1.72; FW_VERSION controls differences

        if      FW_VERSION = 172
isr_2c                          equ     L_1053A+4
        endif
P_1B56                          equ     fdc_119CB+11
P_1B72                          equ     fdc_119CB+39
P_1B8E                          equ     fdc_119CB+67
P_1BAA                          equ     fdc_119CB+95
P_3F9F                          equ     str_off_on+8
P_40EE                          equ     L_13F6D+1
P_450D                          equ     br_1438C+1
P_451D                          equ     br_1438C+17
P_F24F                          equ     L_1F0CE+1
P_F25F                          equ     L_1F0CE+17
P_F26F                          equ     L_1F0CE+33
P_F27F                          equ     L_1F0CE+49
P_F28F                          equ     L_1F0CE+65
P_F29F                          equ     L_1F0CE+81
P_F2AF                          equ     L_1F0CE+97
SOFTKEY_CENTER_TABLE            equ     L_13DBF+7

        ifdef   GROWTH_PROOF
        db      GROWTH_PROOF dup (90h)
        endif

timer_isr_panel_decay:
        pusha
        push    ds
        push    es
        push    dx
        mov     dx, 0c022h
        in      al, dx
        pop     dx
        push    ax
        or      al, 22h
        mov     dx, 0c022h
        out     dx, al
        sti
        mov     ax, DATA_SEG
        mov     ds, ax
        nop
        push    cs
L_0FEA4:
        call    L_15BF0
        nop
        push    cs
timer_tick:
        if      FW_VERSION = 172
        call    L_14EA5
        else
        db      0e8h
        db      15h, 50h
        endif
        nop
        push    cs
timer_tick_pad_scan:
        call    error_insufficient_memory_17029
        inc     word ptr [G_TICK_COUNT]
        sub     ax, ax
        cmp     ax, word ptr [G_KEY_REPEAT_DELAY]
        je      L_0FEC1
        dec     word ptr [G_KEY_REPEAT_DELAY]
L_0FEC1:
        cmp     ax, word ptr [G_KEY_REPEAT_TIMER]
        je      L_0FECB
        dec     word ptr [G_KEY_REPEAT_TIMER]
L_0FECB:
        cmp     ax, word ptr [W_1078]
        je      L_0FED5
        dec     word ptr [W_1078]
L_0FED5:
        cmp     ax, word ptr [G_TAP_TIMER]
        je      L_0FEDF
        dec     word ptr [G_TAP_TIMER]
L_0FEDF:
        cmp     al, byte ptr [D_107E]
        je      L_0FEE9
        dec     byte ptr [D_107E]
L_0FEE9:
        cmp     al, byte ptr [D_107F]
        je      L_0FEF3
        dec     byte ptr [D_107F]
L_0FEF3:
        cmp     ax, word ptr [G_TIMEOUT_TICKS]
        je      L_0FEFD
        dec     word ptr [G_TIMEOUT_TICKS]
L_0FEFD:
        cmp     ax, word ptr [G_BLINK_TIMER]
        je      L_0FF07
        dec     word ptr [G_BLINK_TIMER]
L_0FF07:
        push    dx
        mov     dx, 0c022h
        in      al, dx
        pop     dx
        and     al, 0ddh
        pop     bx
        and     bl, 20h
        or      al, bl
L_0FF15:
        mov     dx, 0c022h
        out     dx, al
        pop     es
        pop     ds
        popa
        iret
isr_int25:
        pusha
        push    es
        push    ds
        mov     ax, DATA_SEG
        mov     ds, ax
        push    dx
        mov     dx, 0c022h
        in      al, dx
        pop     dx
        or      al, 20h
        mov     dx, 0c022h
        out     dx, al
        mov     dx, 0c012h
        mov     al, 0ffh
        out     dx, al
        mov     dx, 0c012h
        mov     al, 0ffh
        out     dx, al
        sti
        sub     al, al
        xchg    byte ptr [METRO_CLICK_VEL], al
        cmp     al, 0
        je      L_0FF5D
        mov     cl, al
        mov     al, 7fh
        mov     ah, byte ptr [D_0B34]
        mov     ch, byte ptr [D_0B30]
        mov     dx, 40h
        push    ds
        mov     bl, 2
        int     35h
        pop     ds
L_0FF5D:
        mov     al, 30h
L_0FF5F:
        mov     bl, byte ptr [SND_EVENT_RD]
        cmp     bl, byte ptr [SND_EVENT_WR]
        je      L_0FFBA
        push    ax
        sub     bh, bh
        mov     ax, word ptr [bx+SND_EVENT_RING]
        mov     cx, word ptr [bx+P_CEDA]
        add     byte ptr [SND_EVENT_RD], 4
        mov     dh, ah
        and     ah, 0f0h
        mov     dl, ch
        mov     ch, dh
        and     dh, 3
        and     ch, 8
        shr     ch, 3
        cmp     ah, 80h
        jae     L_0FF93
        shr     ah, 4
L_0FF93:
        push    ds
        mov     bl, 0
        int     35h
        pop     ds
        cli
        mov     dx, 0c012h
        mov     al, 0ffh
        out     dx, al
        mov     dx, 0c012h
        mov     al, 0ffh
        out     dx, al
        sti
        pop     ax
        dec     al
        jne     L_0FF5F
        cli
        mov     al, 0
        mov     byte ptr [SND_EVENT_RD], 0
        cmp     byte ptr [SND_EVENT_WR], 0
        sti
L_0FFBA:
        mov     ax, word ptr [G_TICK_COUNT]
        push    ds
        mov     bl, 1
        int     35h
        pop     ds
        mov     dx, 0c012h
        mov     al, 0e8h
        out     dx, al
        mov     dx, 0c012h
        mov     al, 3
        out     dx, al
        push    dx
        mov     dx, 0c022h
        in      al, dx
        pop     dx
        and     al, 0dfh
        mov     dx, 0c022h
        out     dx, al
        pop     ds
        pop     es
        popa
        iret
serial_rx_isr:
        pusha
        push    ds
        push    es
        mov     ax, DATA_SEG
        mov     ds, ax
        sub     bh, bh
L_0FFE9:
        call    serial_rx_poll_panel
L_0FFEC:
        call    serial_rx_poll_midi
L_0FFEF:
        call    serial_rx_poll_panel
L_0FFF2:
        call    serial_rx_poll_midi
        pop     es
        pop     ds
        popa
        iret
serial_rx_poll_panel:
        push    dx
        mov     dx, 0c002h
        in      al, dx
        pop     dx
        test    al, 2

L_10001:
        jne     L_10006
        jmp     serial_rx_poll_midi
L_10006:
        push    dx
        mov     dx, 0c000h
        in      al, dx
        pop     dx
        test    al, 80h
L_1000E:
        je      panel_demux_pad_strike
        mov     byte ptr [D_0D22], al
        ret
panel_demux_pad_strike:
        mov     ah, byte ptr [D_0D22]
        cmp     ah, 90h
L_1001B:
        jb      L_10049
        cmp     ah, 0a0h
L_10020:
        jae     L_10049
        and     ah, 0fh
        mov     bl, ah
        mov     cl, 76h
        cmp     al, cl
        jb      L_1002F
        mov     al, cl
L_1002F:
        mov     ah, 7fh
        mul     ah
        div     cl
        mov     byte ptr [bx+TBL_PAD_VELOCITY], al
        mov     ah, bl
        mov     bl, byte ptr [PAD_RING_WR]
        mov     word ptr [bx+BUF_PAD_EVENT_RING], ax
L_10043:
        add     byte ptr [PAD_RING_WR], 2
        ret
L_10049:
        cmp     ah, 0a0h
L_1004C:
        jb      panel_demux_wheel
        cmp     ah, 0b0h
L_10051:
        jae     panel_demux_wheel
        and     ah, 0fh
        mov     bl, ah
        mov     byte ptr [bx+TBL_PAD_VELOCITY], al
        ret
panel_demux_wheel:
        cmp     ah, 81h
L_10060:
        jne     panel_demux_wheel_ccw
        sub     ah, ah
        cmp     ah, byte ptr [D_107F]
L_10068:
        je      L_1006B
        ret
L_1006B:
        mov     bl, 64h
        mov     bh, bl
        xchg    byte ptr [D_107E], bh
        sub     bl, bh
        cmp     bl, 28h
        jae     L_10095
        mov     bx, word ptr [D_0D28]
        mov     ax, 8010h
        mul     bx
        shl     dx, 1
        mov     word ptr [D_0D28], dx
        sub     dx, 1000h
        shr     dx, 1
        inc     dx
        add     word ptr [G_WHEEL_INC_PENDING], dx
        ret
L_10095:
        add     word ptr [G_WHEEL_INC_PENDING], ax
        mov     word ptr [D_0D28], 1000h
        ret
panel_demux_wheel_ccw:
        cmp     ah, 80h
L_100A3:
        jne     L_100E3
        sub     ah, ah
        cmp     ah, byte ptr [D_107E]
L_100AB:
        je      L_100AE
        ret
L_100AE:
        mov     bl, 64h
        mov     bh, bl
        xchg    byte ptr [D_107F], bh
        sub     bl, bh
        cmp     bl, 32h
        jae     L_100D8
        mov     bx, word ptr [D_0D28]
        mov     ax, 8010h
        mul     bx
        shl     dx, 1
        mov     word ptr [D_0D28], dx
        sub     dx, 1000h
        shr     dx, 1
        inc     dx
        add     word ptr [G_WHEEL_DEC_PENDING], dx
        ret
L_100D8:
        add     word ptr [G_WHEEL_DEC_PENDING], ax
        mov     word ptr [D_0D28], 1000h
        ret
L_100E3:
        cmp     ah, 86h
L_100E6:
        jne     L_100EC
        mov     byte ptr [G_SLIDER_POS], al
        ret
L_100EC:
        cmp     ah, 0ffh
L_100EF:
        je      L_10101
        mov     bl, byte ptr [PANEL_RING_WR]
        sub     bh, bh
        mov     word ptr [bx+BUF_PANEL_EVENT_RING], ax
        add     byte ptr [PANEL_RING_WR], 2
        ret
L_10101:
        mov     si, word ptr [D_1098]
        cmp     byte ptr [si], 0
        je      L_10110
        mov     byte ptr [si], al
        inc     word ptr [D_1098]
L_10110:
        ret
serial_rx_poll_midi:
        push    dx
        mov     dx, 1a2h
        in      al, dx
        pop     dx
        test    al, 2
        je      L_10126
        push    dx
        mov     dx, 1a0h
        in      al, dx
        pop     dx
        nop
        push    cs
L_10123:
        call    midi_parse_port_1a0
L_10126:
        push    dx
        mov     dx, 182h
        in      al, dx
        pop     dx
        test    al, 2
        je      L_1013B
        push    dx
        mov     dx, 180h
        in      al, dx
        pop     dx
        nop
        push    cs
L_10138:
        call    midi_parse_port_180
L_1013B:
        ret
midi_tx_isr_1a0:
        pusha
        push    ds
        mov     ax, DATA_SEG
        mov     ds, ax
        mov     bx, word ptr [MIDI_OUT1_RD]
        mov     dx, 1a0h
        mov     al, byte ptr [bx+BUF_MIDI_OUT1_RING]
        out     dx, al
        inc     bx
        and     bh, 1
        cmp     bx, word ptr [MIDI_OUT1_WR]
        jne     L_1015F
        mov     dx, 1a6h
        mov     al, 0d7h
        out     dx, al
L_1015F:
        mov     word ptr [MIDI_OUT1_RD], bx
        pop     ds
        popa
        iret
midi_tx_isr_180:
        pusha
        push    ds
        mov     ax, DATA_SEG
        mov     ds, ax
        mov     bx, word ptr [MIDI_OUT2_RD]
        mov     dx, 180h
        mov     al, byte ptr [bx+BUF_MIDI_OUT2_RING]
        out     dx, al
        inc     bx
L_1017A:
        and     bh, 1
        cmp     bx, word ptr [MIDI_OUT2_WR]
        jne     L_10189
        mov     dx, 186h
        mov     al, 0d7h
        out     dx, al
L_10189:
        mov     word ptr [MIDI_OUT2_RD], bx
        pop     ds
        popa
        iret
isr_int23:
        pusha
        push    ds
        push    es
        mov     bl, 12h
        mov     bh, 0
L_10197:
        int     2ch
        db      07h, 1fh, 61h, 0cfh
L_1019D:
        mov     al, byte ptr [SEQ_REC_ARMED]
        or      al, byte ptr [SEQ_ODUB_ARMED]
L_101A4:
        je      L_101A7
        retf
L_101A7:
        if      FW_VERSION = 172
        cmp     word ptr [UI_SLOT_IDLE], 161bh
L_101AD:
        else
        cmp     word ptr [UI_SLOT_IDLE], 15d2h
        endif
        je      L_101B0
        retf
L_101B0:
        mov     ax, ds
        mov     es, ax
        mov     di, D_109A
        mov     si, di
        mov     bx, di
        add     si, 2
        mov     cx, 4
        rep movsw
        mov     si, bx
        mov     di, bx
        mov     bx, 0bb8h
        xchg    word ptr [G_TAP_TIMER], bx
        or      bx, bx
L_101D0:
        jne     L_101DA
        sub     ax, ax
        mov     cx, 4
        rep stosw
        retf
L_101DA:
        mov     ax, 0bb8h
        sub     ax, bx
        cmp     ax, 7d0h
        jb      L_101E7
        mov     ax, 7d0h
L_101E7:
        cmp     ax, 0c8h
        jae     L_101EF
        mov     ax, 0c8h
L_101EF:
        mov     cl, byte ptr [G_TAP_AVERAGING]
        add     cl, 1
        mov     ch, 0
        add     di, cx
        add     di, cx
        mov     word ptr [di], ax
        mov     bx, cx
        cmp     word ptr [si], 0
L_10203:
        jne     L_10206
        retf
L_10206:
        add     ax, word ptr [si]
        add     si, 2
        dec     cl
L_1020D:
        jne     L_10206
        sub     dx, dx
        inc     bx
        div     bx
        mov     di, ax
        sub     si, si
        mov     ax, 27c0h
        mov     dx, 9
        push    cs
calls_state_check_104_1021f:
        call    state_check_104FB
        cmp     ax, 12ch
        jae     L_1022A
        mov     ax, 12ch
L_1022A:
        cmp     ax, 0bb8h
        jb      L_10232
        mov     ax, 0bb8h
L_10232:
        cmp     byte ptr [G_TEMPO_SOURCE_SEQ], 0
L_10237:
        jne     L_1023E
        mov     word ptr [G_MASTER_TEMPO], ax
        jmp     L_10253
L_1023E:
        cmp     byte ptr [G_SONG_MODE], 0
L_10243:
        je      L_10246
        retf
L_10246:
        callf   CS0_SEG:calls_call_with_check_01c7c
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     word ptr es:[TBL_0014], ax
L_10253:
        nop
        push    cs
L_10255:
        call    seq_tempo_rate_update_far
        retf
isr_int5a:
        mov     di, D_0DCC
        jmp     ui_bind_inline
L_1025E:
        mov     di, UI_SLOT_OPEN_WINDOW
        jmp     ui_bind_inline
isr_int5c:
        mov     di, UI_SLOT_IDLE
        jmp     ui_bind_inline
isr_int5d:
        mov     di, UI_SLOT_REFRESH
        jmp     ui_bind_inline
isr_int5e:
        mov     di, UI_SLOT_WHEEL_DEC
        jmp     ui_bind_inline
isr_int5f:
        mov     di, UI_SLOT_WHEEL_INC
        jmp     ui_bind_inline
isr_int60:
        mov     di, D_0DD4
        jmp     ui_bind_inline
isr_int61:
        mov     di, D_0DD8
        jmp     ui_bind_inline
isr_int62:
        mov     di, D_0DDC
        jmp     ui_bind_inline
isr_int63:
        mov     di, D_0DE0
        jmp     ui_bind_inline
isr_int64:
        mov     di, D_0D84
        jmp     ui_bind_inline
isr_int65:
        mov     di, UI_SLOT_F2
        jmp     ui_bind_inline
isr_int66:
        mov     di, D_0D8C
        jmp     ui_bind_inline
isr_int67:
        mov     di, D_0D90
        jmp     ui_bind_inline
isr_int68:
        mov     di, D_0D94
        jmp     ui_bind_inline
isr_int69:
        mov     di, D_0D98
        jmp     ui_bind_inline
isr_int6f:
        mov     di, D_0EB8
        jmp     ui_bind_inline
ui_bind_inline:
        mov     bp, sp
        mov     si, word ptr [bp]
        mov     es, word ptr [bp+2]
        mov     ax, word ptr es:[si]
        mov     word ptr [di], ax
        mov     word ptr [di+2], es
        add     word ptr [bp], 2
        iret
isr_int6a:
        mov     cx, 2
        mov     di, UI_SLOT_WHEEL_INC
        jmp     ui_bind_inline_n
isr_int6c:
        mov     cx, 4
        mov     di, D_0DD4
        jmp     ui_bind_inline_n
isr_int6b:
        mov     cx, 6
        mov     di, D_0D84
        jmp     ui_bind_inline_n
isr_int6d:
        mov     cx, 5
        mov     di, D_0DF4
        jmp     ui_bind_inline_n
isr_int6e:
        mov     cx, 5
        mov     di, D_0E08
        jmp     ui_bind_inline_n
ui_bind_inline_n:
        mov     bx, ds
        mov     es, bx
L_102EF:
        mov     bp, sp
        mov     si, word ptr [bp]
        mov     ax, word ptr [bp+2]
        mov     ds, ax
L_102F9:
        movsw
        stosw
        loop    L_102F9
        mov     word ptr [bp], si
        mov     ds, bx
        iret
        if      FW_VERSION = 150
        mov     cx, 2
        mov     word ptr [G_BLINK_PERIOD], ax
        mov     byte ptr [G_BLINK_ENABLE], 1
        mov     di, D_0E38
        jmp     L_10B97
L_10B97:
        pop     si
        mov     dx, ds
        mov     ax, cs
        mov     bx, ds
        mov     es, bx
        mov     ds, ax
L_10BA2:
        movsw
        stosw
        loop    L_10BA2
        mov     ds, dx
        jmp     si
        endif
isr_int44:
        push    bx
        push    ds
        mov     bx, DATA_SEG
        mov     ds, bx
        mov     byte ptr [B_0B1C], al
        pop     ds
        pop     bx
        iret
isr_int2f:
        push    ax
        mov     ax, DATA_SEG
        mov     ds, ax
        pop     ax
        cmp     bl, 7
        jne     L_10324
        mov     cx, word ptr [G_CREATE_SIZE]
        mov     dx, word ptr [G_CREATE_SIZE_HI]
L_10324:
        mov     bh, byte ptr [G_DISK_DEVICE]
L_10328:
        int     2ch
        iret
isr_int30:
        sti
        push    ds
        mov     ax, DATA_SEG
        mov     ds, ax
L_10332:
        mov     al, byte ptr es:[bp]
        mov     bx, word ptr es:[bp+1]
        mov     cx, word ptr es:[bp+3]
        cmp     al, 0
        je      L_1034E
        add     bp, 5
        push    es
        push    bp
        call    L_10350
        pop     bp
        pop     es
        jmp     L_10332
L_1034E:
        pop     ds
        iret
L_10350:
        cmp     al, 1
L_10352:
        je      L_10377
        cmp     al, 0ffh
L_10356:
        je      L_1037D
        mov     si, D_0E64
        test    al, 80h
        jne     br_10369
        mov     si, D_0F4C
        test    al, 40h
        jne     br_10369
        mov     si, D_0D7C
br_10369:
        and     ax, 3fh
        shl     ax, 2
        add     si, ax
        mov     word ptr [si], bx
        mov     word ptr [si+2], cx
        ret
L_10377:
        callf   CS0_SEG:dispatch_table_init_far
        ret
L_1037D:
        callf   CS0_SEG:calls_reset_state_vars_004ba
        ret
isr_int43:
        sti
        push    ds
        push    bx
        mov     bx, DATA_SEG
        mov     ds, bx
        mov     bx, D_0E64
        test    al, 80h
        jne     isr_1039C
        mov     bx, D_0F4C
        test    al, 40h
        jne     isr_1039C
        mov     bx, D_0D7C
isr_1039C:
        and     ax, 3fh
        cmp     al, 2
        jb      L_103B1
        cmp     al, 3ah
        jae     L_103B1
        shl     ax, 2
        add     bx, ax
        callf   CS0_SEG:calls_setup_handler_00623
L_103B1:
        pop     bx
        pop     ds
        iret
isr_int33:
        sti
        push    ds
        mov     ax, DATA_SEG
        mov     ds, ax
        mov     ax, word ptr [G_TICK_COUNT]
        pop     ds
        iret
exe_v53_peripheral_init:
        mov     dx, 0fffeh
        mov     al, 10h
        out     dx, al
        mov     dx, 0fff1h
        mov     al, 0
        out     dx, al
        mov     dx, 0fffdh
        mov     al, 0fh
        out     dx, al
        mov     dx, 0fff2h
        mov     al, 90h
        out     dx, al
        mov     dx, 0ffeah
        mov     al, 0
        out     dx, al
        mov     dx, 0ffedh
        mov     al, 0
        out     dx, al
        mov     dx, 0fff3h
        mov     al, 75h
        out     dx, al
        mov     dx, 0ffech
        mov     al, 1
        out     dx, al
        mov     dx, 0ffebh
L_103F3:
        mov     al, 11h
        out     dx, al
        mov     dx, 0fff4h
        mov     al, 11h
        out     dx, al
        mov     dx, 0fff5h
        mov     al, 31h
        out     dx, al
        mov     dx, 0fff6h
        mov     al, 11h
        out     dx, al
        mov     dx, 0fffch
        mov     al, 0c0h
        out     dx, al
        mov     dx, 0fff8h
        mov     al, 0
        out     dx, al
        mov     dx, 0fff9h
        mov     al, 10h
        out     dx, al
        mov     dx, 0fffah
        mov     al, 20h
        out     dx, al
        mov     dx, 0fffbh
        mov     al, 30h
        out     dx, al
        mov     dx, 0fff0h
        mov     al, 3
        out     dx, al
        mov     dx, 0c016h
        mov     al, 36h
        out     dx, al
        mov     dx, 0c010h
        mov     al, 0e8h
        out     dx, al
        mov     dx, 0c010h
        mov     al, 3
        out     dx, al
        mov     dx, 0c016h
        mov     al, 78h
        out     dx, al
        mov     dx, 0c012h
        mov     al, 0e8h
        out     dx, al
        mov     dx, 0c012h
        mov     al, 3
        out     dx, al
        mov     dx, 0c004h
        mov     al, 4fh
        out     dx, al
        mov     dx, 0c002h
        mov     al, 35h
        out     dx, al
        mov     dx, 0c006h
        mov     al, 2
        out     dx, al
        mov     al, 8
        mov     dx, 0ffe9h
        mov     al, al
        out     dx, al
        mov     dx, 0c020h
        mov     al, 13h
        out     dx, al
        mov     dx, 0c022h
        mov     al, 20h
        out     dx, al
        mov     dx, 0c022h
        mov     al, 3
        out     dx, al
        mov     dx, 0c022h
        mov     al, 4
        out     dx, al
        mov     dx, 0c020h
        mov     al, 2bh
        out     dx, al
        mov     dx, 0c030h
        mov     al, 1
        out     dx, al
        mov     dx, 0c038h
        mov     al, 10h
        out     dx, al
        mov     dx, 0c039h
        mov     al, 0
        out     dx, al
        mov     dx, 1a2h
        mov     al, 0
        out     dx, al
        mov     dx, 1a2h
        mov     al, 0
        out     dx, al
        mov     dx, 1a2h
        mov     al, 0
        out     dx, al
        mov     dx, 1a2h
        mov     al, 40h
        out     dx, al
        mov     dx, 1a6h
        mov     al, 0d7h
        out     dx, al
        mov     dx, 1a4h
        mov     al, 1
        out     dx, al
        mov     dx, 1a2h
        mov     al, 4fh
        out     dx, al
        mov     dx, 1a2h
        mov     al, 15h
        out     dx, al
        mov     dx, 182h
        mov     al, 0
        out     dx, al
        mov     dx, 182h
        mov     al, 0
        out     dx, al
        mov     dx, 182h
        mov     al, 0
        out     dx, al
        mov     dx, 182h
        mov     al, 40h
        out     dx, al
        mov     dx, 186h
        mov     al, 0d7h
        out     dx, al
        mov     dx, 184h
        mov     al, 1
        out     dx, al
        mov     dx, 182h
        mov     al, 4fh
        out     dx, al
        mov     dx, 182h
        mov     al, 15h
        out     dx, al
        retf
state_check_104FB:
        mov     bp, 1
loop_104FE:
        shl     di, 1
        rcl     si, 1
        jb      br_1050F
        inc     bp
        cmp     bp, 20h
        jne     loop_104FE
        sub     di, di
        sub     si, si
        retf
br_1050F:
        rcr     si, 1
        rcr     di, 1
        sub     cx, cx
        sub     bx, bx
L_10517:
        push    bp
        push    dx
        push    ax
        sub     ax, di
        sbb     dx, si
L_1051E:
        jb      br_10525
        pop     bp
        pop     bp
        stc
        jmp     SHORT L_10528
br_10525:
        pop     ax
        pop     dx
        clc
L_10528:
        rcl     bx, 1
        rcl     cx, 1
        shr     si, 1
        rcr     di, 1
        pop     bp
        dec     bp
        jne     L_10517
        mov     di, ax
        mov     si, dx
        mov     ax, bx
L_1053A:
        mov     dx, cx
        retf
        if      FW_VERSION = 172

        db      00h, 0fbh, 80h, 0fbh, 0fh
        else
isr_2c:
        sti
        cmp     bl, 0fh
        endif
L_10542:
        je      L_10551
        cmp     bl, 10h
L_10547:
        je      L_10551
        cmp     bh, 9
L_1054C:
        jne     L_10551
        jmp     error_disk_full_1b7c6
L_10551:
        push    ds
        mov     bp, 0f000h
        mov     ds, bp
        cmp     bh, 0
L_1055A:
        je      isr_1057D
        mov     bh, byte ptr [HD_MOUNT_STATUS]
        mov     bp, int2c_hd_akai_table
        cmp     bh, 1
        je      calls_word_1058a
        mov     bp, int2c_hd_roland_table
        cmp     bh, 2
        je      calls_word_1058a
        mov     bp, int2c_hd_emu_table
        cmp     bh, 3
        je      calls_word_1058a
        mov     bp, int2c_hd_dos_table
        jmp     SHORT calls_word_1058a
isr_1057D:
        mov     bp, int2c_fd_akai_table
        cmp     byte ptr [FD_AKAI_FORMAT], 0
        jne     calls_word_1058a
        mov     bp, int2c_fd_dos_table
calls_word_1058a:
        sub     bh, bh
        shl     bx, 1
        add     bx, bp
        call    word ptr cs:[bx]
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
int2c_fd_dos_table:
        dw      exe_fdc_reset_specify, exe_fd_reset, fd_dir_first, fd_dir_next
        dw      int2c_fd_dos_f04, int2c_fd_dos_f05, int2c_fd_dos_f06, int2c_fd_dos_f07
        dw      int2c_fd_dos_f08, int2c_fd_dos_f09, int2c_fd_dos_f0a, int2c_fd_dos_f0b
        dw      int2c_fd_dos_f0c, int2c_fd_dos_f0d, fd_dir_find_by_name, int2c_fd_dos_f0f
        dw      int2c_fd_dos_f10, int2c_fd_dos_f11, fdc_irq_done, int2c_fd_dos_f13
        dw      int2c_fd_dos_f14, int2c_fd_dos_f15, int2c_fd_dos_f16, int2c_fd_dos_nop
        dw      int2c_fd_dos_f18, int2c_fd_dos_f19, int2c_fd_dos_nop, int2c_fd_dos_nop
        dw      int2c_fd_dos_nop, int2c_fd_dos_nop, int2c_fd_f1e, int2c_fd_dos_f1f
int2c_fd_dos_nop:
        sub     ax, ax
        mov     dx, ax
        ret
int2c_fd_f1e:
        mov     ax, 0
        ret
int2c_fd_akai_table:
        dw      exe_fdc_reset_specify, exe_fd_reset, int2c_fd_akai_f02, int2c_fd_akai_f03
        dw      int2c_fd_akai_f04, int2c_fd_akai_f05, int2c_fd_akai_f06, int2c_fd_akai_nop
        dw      int2c_fd_akai_nop, int2c_fd_akai_nop, int2c_fd_akai_nop, int2c_fd_akai_nop
        dw      int2c_fd_dos_f0c, int2c_fd_akai_nop, int2c_fd_akai_f0e, int2c_fd_dos_f0f
        dw      int2c_fd_dos_f10, int2c_fd_dos_f11, fdc_irq_done, int2c_fd_akai_nop
        dw      int2c_fd_akai_nop, int2c_fd_akai_nop, int2c_fd_akai_f16, int2c_fd_akai_nop
        dw      int2c_fd_dos_f18, int2c_fd_dos_f19, int2c_fd_akai_nop, int2c_fd_akai_nop
        dw      int2c_fd_akai_nop, int2c_fd_akai_nop, int2c_fd_f1e, int2c_fd_dos_f1f
int2c_fd_akai_nop:
        sub     ax, ax
        mov     dx, ax
        ret
int2c_hd_dos_table:
        dw      disk_init_4, int2c_hd_dos_f01, int2c_hd_dos_f02, int2c_hd_dos_f03
        dw      int2c_hd_dos_f04, int2c_hd_dos_f05, int2c_hd_dos_f06, int2c_hd_dos_f07
        dw      int2c_hd_dos_f08, int2c_hd_dos_f09, int2c_hd_dos_f0a, int2c_hd_dos_f0b
        dw      int2c_hd_dos_f0c, int2c_hd_dos_f0d, int2c_hd_dos_f0e, int2c_fd_dos_f0f
        dw      int2c_fd_dos_f10, int2c_hd_dos_f11, fdc_irq_done, int2c_hd_dos_f13
        dw      int2c_hd_dos_f14, int2c_hd_dos_f15, int2c_hd_dos_f16, int2c_hd_dos_f17
        dw      int2c_hd_nop, int2c_hd_nop, int2c_hd_dos_f1a, int2c_hd_nop
        dw      int2c_hd_nop, int2c_hd_nop, int2c_hd_f1e, int2c_hd_dos_f1f
int2c_hd_nop:
        sub     ax, ax
        mov     dx, ax
        ret
int2c_hd_f1e:
        mov     ax, 1
        ret
int2c_hd_akai_table:
        dw      exe_fdc_reset_specify, int2c_hd_dos_f01, int2c_hd_akai_f02, int2c_hd_akai_f03
        dw      int2c_fd_akai_f04, int2c_hd_akai_f05, int2c_hd_akai_f06, int2c_fd_akai_nop
        dw      int2c_fd_akai_nop, int2c_fd_akai_nop, int2c_fd_akai_nop, int2c_fd_akai_nop
        dw      int2c_hd_dos_f0c, int2c_fd_akai_nop, int2c_fd_akai_f0e, int2c_fd_dos_f0f
        dw      int2c_fd_dos_f10, int2c_hd_dos_f11, int2c_fd_akai_nop, int2c_fd_akai_nop
        dw      int2c_fd_akai_nop, int2c_fd_akai_nop, int2c_hd_akai_f16, int2c_hd_akai_f17
        dw      int2c_fd_akai_nop, int2c_fd_akai_nop, int2c_hd_akai_f1a, int2c_hd_nop
        dw      int2c_hd_nop, int2c_hd_nop, int2c_hd_f1e, int2c_hd_dos_f1f
int2c_hd_roland_table:
        dw      exe_fdc_reset_specify, int2c_hd_dos_f01, int2c_hd_roland_f02, int2c_hd_roland_f03
        dw      int2c_hd_roland_f04, int2c_hd_roland_f05, int2c_hd_roland_f06, int2c_fd_akai_nop
        dw      int2c_fd_akai_nop, int2c_fd_akai_nop, int2c_fd_akai_nop, int2c_fd_akai_nop
        dw      int2c_fd_akai_nop, int2c_fd_akai_nop, int2c_fd_akai_nop, int2c_fd_dos_f0f
        dw      int2c_fd_dos_f10, int2c_hd_dos_f11, int2c_fd_akai_nop, int2c_fd_akai_nop
        dw      int2c_fd_akai_nop, int2c_fd_akai_nop, int2c_hd_roland_f16, int2c_fd_akai_nop
        dw      int2c_fd_akai_nop, int2c_fd_akai_nop, int2c_fd_akai_nop, int2c_hd_nop
        dw      int2c_hd_nop, int2c_hd_nop, int2c_hd_f1e, int2c_hd_dos_f1f
int2c_hd_emu_table:
        dw      exe_fdc_reset_specify, int2c_hd_dos_f01, int2c_hd_emu_f02, int2c_hd_emu_f03
        dw      int2c_hd_emu_f04, int2c_hd_emu_f05, int2c_hd_emu_f06, int2c_fd_akai_nop
        dw      int2c_fd_akai_nop, int2c_fd_akai_nop, int2c_hd_emu_f0a, int2c_fd_akai_nop
        dw      int2c_fd_akai_nop, int2c_fd_akai_nop, int2c_fd_akai_f0e, int2c_fd_dos_f0f
        dw      int2c_fd_dos_f10, int2c_hd_dos_f11, int2c_fd_akai_nop, int2c_fd_akai_nop
        dw      int2c_fd_akai_nop, int2c_fd_akai_nop, int2c_hd_emu_f16, int2c_fd_akai_nop
        dw      int2c_fd_akai_nop, int2c_fd_akai_nop, int2c_hd_emu_f1a, int2c_hd_nop
        dw      int2c_hd_nop, int2c_hd_nop, int2c_hd_f1e, int2c_hd_dos_f1f
fn_10736:
        pop     bp
        mov     dx, si
loop_10739:
        mov     al, byte ptr cs:[bp]
        inc     bp
        or      al, al
        je      jmp_bp_10757
        mov     ah, byte ptr [si]
        inc     si
        cmp     ah, al
        je      loop_10739

loop_10749:
        mov     al, byte ptr cs:[bp]
        inc     bp
        or      al, al
        jne     loop_10749
        mov     si, dx
        stc
        jmp     bp
jmp_bp_10757:
        mov     si, dx
        clc
        jmp     bp
p_08dc:
        db      "0123456789 ABCDE"
        db      "FGHIJKLMNOPQRSTU"
        db      "VWXYZ#+-."
int2c_fd_akai_f02:
        call    state_update_10ABB
        mov     ax, word ptr [FD_ROOT_START]
        sub     ax, 18h
        mov     word ptr [FD_DIRENT_PTR], ax
int2c_fd_akai_f03:
        call    state_update_10ABB
        mov     si, word ptr [FD_DIRENT_PTR]
L_10798:
        add     si, 18h
        cmp     si, word ptr [FD_ROOT_END]
L_1079F:
        je      L_107F4
        mov     al, byte ptr [si+10h]
        cmp     al, 0
L_107A6:
        je      L_107F4
        and     al, 7fh
        cmp     al, 73h
        jne     L_10798
akai_dirent_name_decode:
        mov     word ptr [FD_DIRENT_PTR], si
        push    si
        mov     cx, 0ch
        sub     bx, bx
L_107B8:
        mov     bl, byte ptr [si]
        mov     al, byte ptr cs:[bx+p_08dc]
        mov     byte ptr es:[di], al
        inc     si
        inc     di
        loop    L_107B8
        add     di, 4
        mov     byte ptr es:[di], 2eh
L_11073:
        mov     byte ptr es:[di+1], 53h
        mov     byte ptr es:[di+2], 33h
        cmp     word ptr [FD_ROOT_START], 0
        jne     br_107E3
        mov     byte ptr es:[di+2], 31h

br_107E3:
        pop     si
        mov     bl, byte ptr [si+11h]
        mov     bh, byte ptr [si+12h]
        mov     dl, byte ptr [si+TBL_0013]
        sub     dh, dh
        mov     si, 0f8cch
        clc
        ret
L_107F4:
        sub     bx, bx
        sub     dx, dx
        mov     si, word ptr [FD_DIRENT_PTR]
        cmp     si, word ptr [FD_ROOT_START]
L_10800:
        jb      L_10807
        call    akai_dirent_name_decode
        stc
        ret
L_10807:
        mov     ax, word ptr [FD_ROOT_START]
        mov     word ptr [FD_DIRENT_PTR], ax
        stc
        ret
int2c_fd_akai_f16:
        call    state_update_10ABB
        mov     si, word ptr [FD_DIRENT_PTR]
L_10816:
        cmp     si, word ptr [FD_ROOT_START]
L_1081A:
        je      L_107F4
        sub     si, 18h
        mov     al, byte ptr [si+10h]
        and     al, 7fh
L_110CA:
        cmp     al, 73h
        jne     L_10816
        jmp     SHORT akai_dirent_name_decode
int2c_fd_akai_f0e:
        push    si
        push    es
        call    int2c_fd_akai_f02
        pop     es
        pop     di
L_10831:
        pusha
        mov     si, 0f8cch
        mov     cx, 0ch
        repe cmpsb
        popa
        mov     ax, 0
L_1083E:
        jne     L_10841
        ret
L_10841:
        push    es
        push    di
        call    int2c_fd_akai_f03
        pop     di
        pop     es
        jae     L_10831
        mov     ax, 0ffffh
        stc
        ret
int2c_fd_akai_f04:
        call    int2c_fd_akai_f0e
        mov     ax, 0ffffh
L_10855:
        jae     L_10858
        ret
L_10858:
        mov     si, word ptr [FD_DIRENT_PTR]
        mov     al, byte ptr [si+11h]
        mov     ah, byte ptr [si+12h]
        mov     dl, byte ptr [si+TBL_0013]
        sub     dh, dh
        mov     word ptr [FD_FILE_REMAIN_LO], ax
        mov     word ptr [FD_FILE_REMAIN_HI], dx
        push    ax
        push    dx
        mov     ax, word ptr [si+TBL_0014]
        mov     word ptr [FD_CUR_SECTOR], ax
        mov     byte ptr [FD_FILE_MODE], 1
        mov     word ptr [FD_BUF_BYTES_LEFT], 0
        pop     dx
        pop     bx
        mov     ax, 0
        clc
        ret
int2c_fd_akai_f05:
        mov     ax, word ptr [FD_FILE_REMAIN_LO]
        or      ax, word ptr [FD_FILE_REMAIN_HI]
L_1088F:
        je      L_108B7
        sub     word ptr [FD_FILE_REMAIN_LO], 1
        sbb     word ptr [FD_FILE_REMAIN_HI], 0
        cmp     word ptr [FD_BUF_BYTES_LEFT], 0
        jne     br_108A5
L_108A2:
        call    fn_10910
br_108A5:
        mov     si, word ptr [FD_BUF_PTR]
        mov     al, byte ptr [si]
        inc     word ptr [FD_BUF_PTR]
        dec     word ptr [FD_BUF_BYTES_LEFT]
        mov     ah, 0
        clc
        ret
L_108B7:
        mov     ax, 0ffffh
        stc
        ret
int2c_fd_akai_f06:
        mov     ax, word ptr [FD_FILE_REMAIN_LO]
        or      ax, word ptr [FD_FILE_REMAIN_HI]
        jne     br_108C6
        ret
br_108C6:
        sub     word ptr [FD_FILE_REMAIN_LO], cx
        sbb     word ptr [FD_FILE_REMAIN_HI], 0
        jae     br_108D5
        add     cx, word ptr [FD_FILE_REMAIN_LO]
br_108D5:
        push    cx
        call    L_108DC
        pop     ax
        clc
        ret
L_108DC:
        cmp     cx, word ptr [FD_BUF_BYTES_LEFT]
        jbe     br_10901
        sub     cx, word ptr [FD_BUF_BYTES_LEFT]
        push    cx
        mov     cx, word ptr [FD_BUF_BYTES_LEFT]
        mov     si, word ptr [FD_BUF_PTR]
        rep movsb
        push    di
        push    es
L_108F3:
        call    fn_10910
        pop     es
        pop     di
        pop     cx
        cmp     word ptr [FD_BUF_BYTES_LEFT], 0
        jne     L_108DC
        ret
br_10901:
        sub     word ptr [FD_BUF_BYTES_LEFT], cx
        mov     si, word ptr [FD_BUF_PTR]
        rep movsb
        mov     word ptr [FD_BUF_PTR], si
        ret
fn_10910:
        mov     word ptr [FD_BUF_BYTES_LEFT], 0
        mov     ax, word ptr [FD_CUR_SECTOR]
        cmp     ax, 8000h
        jne     L_1091F
        ret
L_1091F:
        cmp     ax, word ptr [FD_CACHE_LBA_START]
L_10923:
        jb      L_10950
        cmp     ax, word ptr [FD_CACHE_LBA_END]
L_10929:
        jae     L_10950
        sub     ax, word ptr [FD_CACHE_LBA_START]
        mov     ah, al
        sub     al, al
        shl     ax, 2
        add     ax, 5000h
        mov     word ptr [FD_BUF_PTR], ax
        mov     word ptr [FD_BUF_BYTES_LEFT], 400h
        mov     bx, word ptr [FD_CUR_SECTOR]
        shl     bx, 1
        mov     ax, word ptr [bx+TBL_0600]
        mov     word ptr [FD_CUR_SECTOR], ax
        ret
L_10950:
        call    floppy_read_lba
        test    byte ptr [FDC_RESULT], 0c0h
L_10958:
        je      fn_10910
        jmp     NEAR br_11B6F
int2c_hd_akai_f1a:
        mov     bl, al
        mov     ah, 0
        shl     ax, 4
        add     ax, 0cah
        mov     si, ax
        test    byte ptr [si+0ch], 1
        je      L_10992
        mov     byte ptr [HD_AKAI_PART], bl
        mov     cx, 0ch
        sub     bx, bx
        mov     di, 0f967h
        push    di
L_1097C:
        mov     bl, byte ptr [si]

        mov     al, byte ptr cs:[bx+p_08dc]
        mov     byte ptr [di], al
        inc     si
        inc     di
        loop    L_1097C
        pop     si
        mov     bx, ds
        mov     es, bx
L_1098E:
        mov     al, byte ptr [si]
        clc
L_11237:
        ret
L_10992:
        stc
        ret
int2c_hd_akai_f17:
        mov     cl, al
        mov     ch, 0
        sub     ax, ax
        sub     dx, dx
        jcxz    L_109AD
        mov     si, BUF_DISK_FAT
L_109A1:
        add     ax, word ptr [si]
        adc     dx, 0
        add     si, 2
        loop    L_109A1
        mov     si, ax
L_109AD:
        mov     word ptr [HD_PART_LBA], ax
        mov     word ptr [HD_PART_LBA_HI], dx
        sub     ax, ax
        sub     dx, dx
        mov     cx, 3
        mov     di, 0
        push    di
L_109BF:
        call    fn_1274F
        pop     di
L_109C3:
        call    fn_11FD0
L_109C6:
        jae     br_109C9
        ret
br_109C9:
        mov     al, byte ptr [HD_HDR_BUF+0d6h]
        test    al, 1
        stc
        jne     L_109D2
        ret
L_109D2:
        clc
        ret
int2c_hd_akai_f02:
        mov     al, byte ptr [HD_AKAI_PART]
        mov     ah, 0
        shl     ax, 4
        add     ax, 0cah
        mov     si, ax
        mov     al, byte ptr [si+0ch]
        push    ax
        mov     ax, word ptr [si+0eh]
        mov     cx, 1
        mov     di, 5000h
        push    di
L_109EF:
        call    fn_1274F
        pop     di
        mov     word ptr [FD_ROOT_START], di
        mov     word ptr [FD_DIRENT_PTR], di
        pop     ax
        mov     word ptr [FD_ROOT_END], 5bd0h
        test    al, 2
        je      calls_state_update_10_10a0c
        mov     word ptr [FD_ROOT_END], 7fd0h
calls_state_update_10_10a0c:
        call    state_update_10ABB
        mov     ax, word ptr [FD_ROOT_START]
        sub     ax, 18h
        mov     word ptr [FD_DIRENT_PTR], ax
int2c_hd_akai_f03:
        call    state_update_10ABB
        mov     si, word ptr [FD_DIRENT_PTR]
L_10A1F:
        add     si, 18h
        cmp     si, word ptr [FD_ROOT_END]
L_10A26:
        je      L_10A85
        mov     al, byte ptr [si+10h]
        cmp     al, 0
        je      L_10A1F
        and     al, 7fh
        cmp     al, 73h
        jne     L_10A1F
        mov     al, byte ptr [si+11h]
        or      al, byte ptr [si+12h]
        or      al, byte ptr [si+TBL_0013]
        je      L_10A1F
fn_10A40:
        mov     word ptr [FD_DIRENT_PTR], si
        push    si
        mov     cx, 0ch
        sub     bx, bx
tgt_10A4A:
        mov     bl, byte ptr [si]
        mov     al, byte ptr cs:[bx+p_08dc]
        mov     byte ptr es:[di], al
        inc     si
        inc     di
        loop    tgt_10A4A
        add     di, 4
        pop     si
        mov     byte ptr es:[di], 2eh
        mov     byte ptr es:[di+1], 53h
        mov     byte ptr es:[di+2], 31h
        cmp     byte ptr [si+0ch], 20h
        je      br_10A75
        mov     byte ptr es:[di+2], 33h
br_10A75:
        mov     bl, byte ptr [si+11h]
        mov     bh, byte ptr [si+12h]
        mov     dl, byte ptr [si+TBL_0013]
        sub     dh, dh
        mov     si, 0f8cch
        clc
        ret
L_10A85:
        sub     bx, bx
        sub     dx, dx
        mov     si, word ptr [FD_DIRENT_PTR]
        cmp     si, word ptr [FD_ROOT_START]
L_10A91:
        jb      L_10A98
        call    fn_10A40
        stc
        ret
L_10A98:
        mov     ax, word ptr [FD_ROOT_START]
        mov     word ptr [FD_DIRENT_PTR], ax
        stc
        ret
int2c_hd_akai_f16:
        call    state_update_10ABB
        mov     si, word ptr [FD_DIRENT_PTR]
L_10AA7:
        cmp     si, word ptr [FD_ROOT_START]
L_10AAB:
        je      L_10A85
        sub     si, 18h
        mov     al, byte ptr [si+10h]
        and     al, 7fh
        cmp     al, 73h
        jne     L_10AA7
        jmp     SHORT fn_10A40
state_update_10ABB:
        mov     ax, ds
        mov     es, ax
        mov     di, 0f8cch
        push    di
        mov     al, 20h
        mov     cx, 14h
        rep stosb
        pop     di
        ret
int2c_hd_akai_f05:
        mov     ax, word ptr [FD_FILE_REMAIN_LO]
        or      ax, word ptr [FD_FILE_REMAIN_HI]
L_10AD3:
        je      L_10AFB
        sub     word ptr [FD_FILE_REMAIN_LO], 1
        sbb     word ptr [FD_FILE_REMAIN_HI], 0
        cmp     word ptr [FD_BUF_BYTES_LEFT], 0
        jne     br_10AE9
L_10AE6:
        call    L_10B54
br_10AE9:
        mov     si, word ptr [FD_BUF_PTR]
        mov     al, byte ptr [si]
        inc     word ptr [FD_BUF_PTR]
        dec     word ptr [FD_BUF_BYTES_LEFT]
        mov     ah, 0
        clc
        ret
L_10AFB:
        mov     ax, 0ffffh
        stc
        ret
int2c_hd_akai_f06:
        mov     ax, word ptr [FD_FILE_REMAIN_LO]
        or      ax, word ptr [FD_FILE_REMAIN_HI]
        jne     br_10B0A
        ret
br_10B0A:
        sub     word ptr [FD_FILE_REMAIN_LO], cx
        sbb     word ptr [FD_FILE_REMAIN_HI], 0
        jae     br_10B19
        add     cx, word ptr [FD_FILE_REMAIN_LO]
br_10B19:
        push    cx
        call    L_10B20
        pop     ax
        clc
        ret
L_10B20:
        cmp     cx, word ptr [FD_BUF_BYTES_LEFT]
        jbe     br_10B45
        sub     cx, word ptr [FD_BUF_BYTES_LEFT]
        push    cx
        mov     cx, word ptr [FD_BUF_BYTES_LEFT]
        mov     si, word ptr [FD_BUF_PTR]
        rep movsb
        push    di
        push    es
L_10B37:
        call    L_10B54
        pop     es
        pop     di
        pop     cx
        cmp     word ptr [FD_BUF_BYTES_LEFT], 0
        jne     L_10B20
        ret
br_10B45:
        sub     word ptr [FD_BUF_BYTES_LEFT], cx
        mov     si, word ptr [FD_BUF_PTR]
        rep movsb
        mov     word ptr [FD_BUF_PTR], si
        ret
L_10B54:
        mov     ax, word ptr [FD_CUR_SECTOR]
        cmp     ax, 8000h
L_10B5A:
        jne     L_10B5D
        ret
L_10B5D:
        mov     cx, 1
        mov     di, BUF_DISK_SECTOR
        mov     word ptr [FD_BUF_PTR], di
L_10B67:
        call    fn_1274F
        mov     word ptr [FD_BUF_BYTES_LEFT], 2000h
        mov     si, word ptr [FD_CUR_SECTOR]
        add     si, si
        add     si, 70ah
        mov     ax, word ptr [si]
        mov     word ptr [FD_CUR_SECTOR], ax
        ret
fdc_irq_done:
        mov     byte ptr [FDC_IRQ_FLAG], 1
        ret
exe_fdc_reset_specify:
        mov     al, 36h
        out     20h, al
        mov     ax, ds
        mov     es, ax
        mov     di, 0f800h
        mov     cx, 7eh
        sub     ax, ax
        rep stosw
        mov     byte ptr [FDC_CMD_LEN], 3
        mov     byte ptr [FDC_CMD], 3
        mov     byte ptr [FDC_CMD_HD_US], 0c4h
        mov     byte ptr [FDC_CMD_CYL], 14h
L_10BAC:
        call    exe_fdc_send_command
        mov     ah, 4bh
L_10BB1:
        call    check_disk_status
        mov     byte ptr [FD_FILE_MODE], 0
        mov     byte ptr [FDC_IRQ_FLAG], 0
        ret
exe_fd_reset:
        call    exe_fdc_reset_specify
L_10BC2:
        call    L_10BC9
        mov     dx, 0
        ret
L_10BC9:
        call    int2c_fd_dos_f0f
L_10BCC:
        call    exe_fdc_recalibrate
        mov     ax, 0
L_10BD2:
        jae     L_10BD5
        ret
L_10BD5:
        mov     al, 3
L_10BD7:
        call    exe_fdc_seek
        mov     ax, 0
L_10BDD:
        jae     L_10BE0
        ret
L_10BE0:
        call    int2c_fd_dos_f11
        mov     ax, 0
L_10BE6:
        jae     L_10BE9
        ret
L_10BE9:
        call    fd_geom_set_1440k
L_10BEC:
        jne     L_10BEF
        ret
L_10BEF:
        call    fd_geom_set_720k
L_10BF2:
        jne     L_10BF5
        ret
L_10BF5:
        call    fd_geom_set_1600k_1kb
L_10BF8:
        jne     L_10BFB
        ret
L_10BFB:
        call    fd_geom_set_800k_1kb
L_10BFE:
        jne     L_10C01
        ret
L_10C01:
        call    fd_geom_set_640k
L_10C04:
        jne     L_10C07
        ret
L_10C07:
        call    fd_geom_set_800k_512b
L_10C0A:
        jne     br_10C0D
        ret
br_10C0D:
        mov     ax, 1
        stc
        ret
fd_geom_set_1440k:
        mov     byte ptr [FDC_CMD_N], 2
        mov     byte ptr [FD_TRACK_SECTORS], 12h
        mov     byte ptr [FDC_CMD_GPL], 1bh
L_10C21:
        mov     byte ptr [FDC_CMD_DTL], 0ffh
        mov     word ptr [FD_FAT_OFFSET], 200h
        mov     word ptr [FD_FAT_BYTES], 1200h
        mov     word ptr [FD_DATA_CLUSTERS], 0b1fh
        mov     word ptr [FD_DATA_SECTOR], 21h
        mov     word ptr [FD_CLUSTER_SECTORS], 1
        mov     word ptr [FD_SECTOR_BYTES], 200h
        mov     word ptr [FD_ROOT_START], 2600h
        mov     word ptr [FD_ROOT_END], 4200h
        mov     byte ptr [FD_HIGH_DENSITY], 1
        mov     byte ptr [FD_AKAI_FORMAT], 0
        mov     byte ptr [FDC_FMT_N], 2
        mov     byte ptr [FDC_FMT_SC], 12h
        mov     byte ptr [FDC_FMT_GAP], 54h
        mov     byte ptr [FDC_FMT_FILL], 0f6h
        mov     ah, 4fh
L_10C76:
        call    check_disk_status
        mov     ah, 4bh
L_10C7B:
        call    check_disk_status
L_10C7E:
        call    L_10F6F
L_10C81:
        je      L_10C84
        ret
L_10C84:
        mov     di, P_1B4B
        mov     si, 0
        mov     bx, cs
L_10C8C:
        mov     es, bx
L_10C8E:
        mov     cx, 1ch
        repe cmpsb
        mov     al, 6
        mov     ah, 1
L_10C97:
        jne     L_10C9A
        ret
L_10C9A:
        mov     di, P_1B56
L_10C9D:
        call    fd_bpb_match
L_10CA0:
        je      br_10CA3
        ret
br_10CA3:
        mov     si, 20h
        mov     cx, 0f0h
        sub     bx, bx
L_10CAB:
        lodsw
        or      bx, ax
        loop    L_10CAB
        or      bx, bx
        mov     al, 4
        mov     ah, 1
L_10CB6:
        jne     br_10CB9
        ret
br_10CB9:
        mov     al, 2
        mov     ah, 1
        sub     bx, bx
        ret
fd_geom_set_720k:
        mov     byte ptr [FDC_CMD_N], 2
        mov     byte ptr [FD_TRACK_SECTORS], 9
        mov     byte ptr [FDC_CMD_GPL], 1bh
L_10CCF:
        mov     byte ptr [FDC_CMD_DTL], 0ffh
        mov     word ptr [FD_FAT_OFFSET], 200h
        mov     word ptr [FD_FAT_BYTES], 600h
        mov     word ptr [FD_DATA_CLUSTERS], 2c9h
        mov     word ptr [FD_DATA_SECTOR], 0eh
        mov     word ptr [FD_CLUSTER_SECTORS], 2
        mov     word ptr [FD_SECTOR_BYTES], 200h
        mov     word ptr [FD_ROOT_START], 0e00h
        mov     word ptr [FD_ROOT_END], 1c00h
        mov     byte ptr [FD_HIGH_DENSITY], 0
        mov     byte ptr [FD_AKAI_FORMAT], 0
        mov     byte ptr [FDC_FMT_N], 2
        mov     byte ptr [FDC_FMT_SC], 9
        mov     byte ptr [FDC_FMT_GAP], 54h
        mov     byte ptr [FDC_FMT_FILL], 0e5h
        mov     ah, 4fh
L_10D24:
        call    check_disk_status
        mov     ah, 0bh
L_10D29:
        call    check_disk_status
L_10D2C:
        call    L_10F6F
L_10D2F:
        je      L_10D32
        ret
L_10D32:
        mov     di, P_1B67
        mov     si, 0
        mov     bx, cs
L_10D3A:
        mov     es, bx
L_10D3C:
        mov     cx, 1ch
        repe cmpsb
        mov     al, 7
        mov     ah, 1
L_10D45:
        jne     L_10D48
        ret
L_10D48:
        mov     di, P_1B72
L_10D4B:
        call    fd_bpb_match
        mov     al, 3
        mov     ah, 1
        ret
fd_geom_set_1600k_1kb:
        mov     byte ptr [FDC_CMD_N], 3
        mov     byte ptr [FD_TRACK_SECTORS], 0ah
        mov     byte ptr [FDC_CMD_GPL], 35h
L_10D62:
        mov     byte ptr [FDC_CMD_DTL], 0ffh
        mov     word ptr [FD_FAT_OFFSET], 600h
        mov     word ptr [FD_FAT_BYTES], 0c80h
        mov     word ptr [FD_DATA_CLUSTERS], 62fh
        mov     word ptr [FD_DATA_SECTOR], 11h
        mov     word ptr [FD_CLUSTER_SECTORS], 1
        mov     word ptr [FD_SECTOR_BYTES], 400h
        mov     word ptr [FD_ROOT_START], 1400h
        mov     word ptr [FD_ROOT_END], 3000h
        mov     byte ptr [FD_HIGH_DENSITY], 1
        mov     byte ptr [FD_AKAI_FORMAT], 1
        mov     byte ptr [FDC_FMT_N], 3
        mov     byte ptr [FDC_FMT_SC], 0ah
        mov     byte ptr [FDC_FMT_GAP], 90h
        mov     byte ptr [FDC_FMT_FILL], 0f6h
        mov     ah, 5fh
L_10DB7:
        call    check_disk_status
        mov     ah, 4bh
L_10DBC:
        call    check_disk_status
L_10DBF:
        call    L_10F6F
L_10DC2:
        je      L_10DC5
        ret
L_10DC5:
        cmp     byte ptr [HD_HDR_BUF+10h], 0ffh
        mov     al, 8
        mov     ah, 3
L_10DCE:
        jne     br_10DD1
        ret
br_10DD1:
        mov     word ptr [FD_ROOT_START], 0
        mov     word ptr [FD_ROOT_END], 600h
        mov     al, 0ah
        mov     ah, 4
        sub     bx, bx
        ret
fd_geom_set_800k_1kb:
        mov     byte ptr [FDC_CMD_N], 3
        mov     byte ptr [FD_TRACK_SECTORS], 5
        mov     byte ptr [FDC_CMD_GPL], 35h
L_10DF3:
        mov     byte ptr [FDC_CMD_DTL], 0ffh
        mov     word ptr [FD_FAT_OFFSET], 600h
        mov     word ptr [FD_FAT_BYTES], 640h
        mov     word ptr [FD_DATA_CLUSTERS], 30fh
        mov     word ptr [FD_DATA_SECTOR], 11h
        mov     word ptr [FD_CLUSTER_SECTORS], 1
        mov     word ptr [FD_SECTOR_BYTES], 400h
        mov     word ptr [FD_ROOT_START], 1400h
        mov     word ptr [FD_ROOT_END], 4400h
        mov     byte ptr [FD_HIGH_DENSITY], 0
        mov     byte ptr [FD_AKAI_FORMAT], 1
        mov     byte ptr [FDC_FMT_N], 3
        mov     byte ptr [FDC_FMT_SC], 5
        mov     byte ptr [FDC_FMT_GAP], 90h
        mov     byte ptr [FDC_FMT_FILL], 0e5h
        mov     ah, 4fh
L_10E48:
        call    check_disk_status
        mov     ah, 0bh
L_10E4D:
        call    check_disk_status
L_10E50:
        call    L_10F6F
L_10E53:
        je      L_10E56
        ret
L_10E56:
        cmp     byte ptr [HD_HDR_BUF+10h], 0ffh
        mov     al, 9
        mov     ah, 3
L_10E5F:
        jne     br_10E62
        ret
br_10E62:
        mov     word ptr [FD_ROOT_START], 0
        mov     word ptr [FD_ROOT_END], 600h
        mov     al, 0bh
        mov     ah, 4
        sub     bx, bx
        ret
fd_geom_set_640k:
        mov     byte ptr [FDC_CMD_N], 2
        mov     byte ptr [FD_TRACK_SECTORS], 8
        mov     byte ptr [FDC_CMD_GPL], 1bh


L_10E84:
        mov     byte ptr [FDC_CMD_DTL], 0ffh
        mov     word ptr [FD_FAT_OFFSET], 200h
        mov     word ptr [FD_FAT_BYTES], 600h
        mov     word ptr [FD_DATA_CLUSTERS], 27ah
        mov     word ptr [FD_DATA_SECTOR], 0ch
        mov     word ptr [FD_CLUSTER_SECTORS], 2
        mov     word ptr [FD_SECTOR_BYTES], 200h
        mov     word ptr [FD_ROOT_START], 0a00h
        mov     word ptr [FD_ROOT_END], 1800h
        mov     byte ptr [FD_HIGH_DENSITY], 0
        mov     byte ptr [FD_AKAI_FORMAT], 0
        mov     byte ptr [FDC_FMT_N], 2
        mov     byte ptr [FDC_FMT_SC], 8
        mov     byte ptr [FDC_FMT_GAP], 54h
        mov     byte ptr [FDC_FMT_FILL], 0e5h
        mov     ah, 4fh
L_10ED9:
        call    check_disk_status
        mov     ah, 0bh
        call    check_disk_status
L_10EE1:
        call    L_10F6F
L_10EE4:
        je      L_10EE7
        ret
L_10EE7:
        mov     di, P_1B8E
L_10EEA:
        call    fd_bpb_match
        mov     al, 0ch
        mov     ah, 1
        ret
fd_geom_set_800k_512b:
        mov     byte ptr [FDC_CMD_N], 2
        mov     byte ptr [FD_TRACK_SECTORS], 0ah
        mov     byte ptr [FDC_CMD_GPL], 1bh
L_10F01:
        mov     byte ptr [FDC_CMD_DTL], 0ffh
        mov     word ptr [FD_FAT_OFFSET], 200h
        mov     word ptr [FD_FAT_BYTES], 600h
        mov     word ptr [FD_DATA_CLUSTERS], 319h
        mov     word ptr [FD_DATA_SECTOR], 0eh
        mov     word ptr [FD_CLUSTER_SECTORS], 2
        mov     word ptr [FD_SECTOR_BYTES], 200h
        mov     word ptr [FD_ROOT_START], 0e00h
        mov     word ptr [FD_ROOT_END], 1c00h
        mov     byte ptr [FD_HIGH_DENSITY], 0
        mov     byte ptr [FD_AKAI_FORMAT], 0
        mov     byte ptr [FDC_FMT_N], 2
        mov     byte ptr [FDC_FMT_SC], 0ah
        mov     byte ptr [FDC_FMT_GAP], 54h
        mov     byte ptr [FDC_FMT_FILL], 0e5h
        mov     ah, 4fh
L_10F56:
        call    check_disk_status
        mov     ah, 0bh
L_10F5B:
        call    check_disk_status
L_10F5E:
        call    L_10F6F
L_10F61:
        je      L_10F64
        ret
L_10F64:
        mov     di, P_1BAA
L_10F67:
        call    fd_bpb_match
        mov     al, 5
        mov     ah, 1
        ret
L_10F6F:
        mov     ax, 0
L_10F72:
        call    floppy_read_lba
        mov     ch, byte ptr [FD_TRACK_SECTORS]
        add     ch, ch
        cmp     byte ptr [FDC_CMD_N], 3
        jne     br_10F84
        shl     ch, 1
br_10F84:
        sub     cl, cl
        mov     ax, ds
        mov     es, ax
        mov     di, 0
        mov     si, 5000h
        rep movsw
        and     byte ptr [FDC_RESULT], 0c0h
        ret
fd_bpb_match:
        mov     si, 0bh
        mov     bx, cs
L_10F9D:
        mov     es, bx
L_10F9F:
        mov     cx, 11h
        repe cmpsb
        ret
fd_dir_first:
        mov     si, word ptr [FD_ROOT_START]
        mov     word ptr [FD_DIRENT_PTR], si
        jmp     SHORT L_10FC1
fd_dir_next:
        mov     si, word ptr [FD_DIRENT_PTR]
L_10FB3:
        cmp     si, word ptr [FD_ROOT_END]
L_10FB7:
        je      L_10FD4
        cmp     byte ptr [si], 0
L_10FBC:
        je      L_10FD4
        add     si, 20h
L_10FC1:
        cmp     byte ptr [si], 0
L_10FC4:
        je      L_10FD4
L_10FC6:
        call    fat_dirent_is_skipped
        jb      L_10FB3
        mov     word ptr [FD_DIRENT_PTR], si
L_10FCF:
        call    dirent_name_to_field
        clc
        ret
L_10FD4:
        mov     si, word ptr [FD_DIRENT_PTR]
L_10FD8:
        call    dirent_name_to_field
        stc
        ret
int2c_fd_dos_f16:
        mov     si, word ptr [FD_DIRENT_PTR]
L_10FE1:
        cmp     si, word ptr [FD_ROOT_START]
L_10FE5:
        je      br_10FF8
        sub     si, 20h
L_10FEA:
        call    fat_dirent_is_skipped
        jb      L_10FE1
        mov     word ptr [FD_DIRENT_PTR], si
L_10FF3:
        call    dirent_name_to_field
        clc
        ret
br_10FF8:
        call    dirent_name_to_field
        stc
        ret
fat_dirent_is_skipped:
        mov     al, byte ptr [si]
        cmp     al, 0
        je      br_11017
        cmp     al, 0e5h
        je      br_11017
        cmp     al, 5
        je      br_11017
        cmp     al, 2eh
        je      br_11017
        test    byte ptr [si+0bh], 0eh
        jne     br_11017
        clc
        ret


br_11017:
        stc
        ret
dirent_name_to_field:
        mov     di, 0f8cch
hd_dirent_name_to_field:
        mov     ax, ds
        mov     es, ax
        push    di
        push    di
        mov     cx, 14h
        mov     al, 20h
        rep stosb
        pop     di
        mov     dx, si
        mov     bx, di
        mov     cx, 8
        rep movsb
        add     si, 4
L_11036:
        call    dirent_name_is_valid
        jb      br_11040
        mov     cx, 8
        rep movsb

br_11040:
        mov     si, dx
        mov     di, bx
        add     si, 8
        add     di, 10h
        mov     al, 2eh
        stosb
        mov     cx, 3
        rep movsb
        mov     si, dx
        mov     bx, word ptr [si+1ch]
        mov     dx, word ptr [si+1eh]
        pop     si
        ret
dirent_name_is_valid:
        push    si
        push    cx
        mov     cx, 8
L_11061:
        cmp     byte ptr [si], 20h
L_11064:
        jb      br_11072
        cmp     byte ptr [si], 7bh
L_11069:
        jae     br_11072
        inc     si
        loop    L_11061
        pop     cx
        pop     si
        clc
        ret
br_11072:
        pop     cx
        pop     si
        stc
        ret
fd_dir_find_free_entry:
        call    fd_dir_first
        mov     si, word ptr [FD_ROOT_START]
        sub     si, 20h
loop_11080:
        add     si, 20h
        cmp     si, word ptr [FD_ROOT_END]
        je      br_110A0
        cmp     byte ptr [si], 0
        je      br_11098
        cmp     byte ptr [si], 5
        je      br_11098
        cmp     byte ptr [si], 0e5h
        jne     loop_11080
br_11098:
        mov     word ptr [FD_DIRENT_PTR], si
        mov     di, si
        clc
        ret
br_110A0:
        stc
        ret
fd_dir_find_by_name:
        push    si
        push    es
L_110A4:
        call    fd_dir_first
        pop     es
        pop     di
        jb      L_110D8
loop_110AB:
        mov     cx, 14h
        mov     bp, di
        mov     si, 0f8cch
tgt_110B3:
        mov     al, byte ptr es:[di]
        cmp     al, 61h
        jb      L_110C0
        cmp     al, 7bh
        jae     L_110C0
        sub     al, 20h
L_110C0:
        cmp     al, byte ptr [si]
L_110C2:
        db      75h, 0bh
        inc     si
        inc     di
        loop    tgt_110B3
        mov     si, word ptr [FD_DIRENT_PTR]
        sub     ax, ax
        ret
        if      FW_VERSION = 172

        db      06h, 55h
        endif
tgt_110D1:
        if      FW_VERSION = 150
        db      06h, 55h
        endif
        call    fd_dir_next
        pop     di
        pop     es
        jae     loop_110AB
L_110D8:
        sub     dx, dx
        sub     bx, bx
        mov     ax, 0ffffh
        stc
        ret
int2c_fd_dos_f14:
        call    fd_dir_find_by_name
L_110E4:
        jae     L_110E7
        ret
L_110E7:
        mov     si, word ptr [FD_DIRENT_PTR]
        mov     byte ptr [si], 0e5h
        mov     ax, word ptr [si+1ah]
L_110F1:
        call    L_116A2
L_110F4:
        call    fd_write_system_area
        clc
        ret
int2c_fd_dos_f04:
        push    es
        pusha
L_110FB:
        call    int2c_fd_dos_f11
        popa
        pop     es
L_11100:
        jae     L_11104
        jmp     SHORT L_1113C
L_11104:
        call    fd_dir_find_by_name
        mov     ax, 0ffffh
L_1110A:
        jae     br_1110D
        ret
br_1110D:
        mov     si, word ptr [FD_DIRENT_PTR]
        mov     ax, word ptr [si+1ah]
        mov     word ptr [FD_CUR_CLUSTER], ax
        sub     ax, ax
        mov     word ptr [FD_BUF_BYTES_LEFT], ax
        mov     word ptr [FD_CUR_SECTOR], ax
        mov     word ptr [FD_CLUSTER_SECT_LEFT], ax
        mov     word ptr [FD_CACHE_LBA_START], ax
        mov     word ptr [FD_CACHE_LBA_END], ax
        mov     bx, word ptr [si+1ch]
        mov     dx, word ptr [si+1eh]
        mov     word ptr [FD_FILE_REMAIN_LO], bx
        mov     word ptr [FD_FILE_REMAIN_HI], dx
        push    ds
        pop     es
        sub     ax, ax
        clc
        ret
L_1113C:
        push    es
        pusha
L_1113E:
        call    exe_fd_reset
        push    ax
L_11142:
        call    int2c_fd_dos_f11
        pop     ax
L_11146:
        jb      br_11151
        cmp     ah, 1
L_1114B:
        jne     br_11151
        popa
        pop     es
        jmp     SHORT L_11104
br_11151:
        popa
        pop     es
        mov     ax, 0ffffh
        stc
        ret
int2c_fd_dos_f05:
        mov     ax, word ptr [FD_FILE_REMAIN_LO]
        if      FW_VERSION = 150
L_11158                         equ     $+1
        endif
        or      ax, word ptr [FD_FILE_REMAIN_HI]
L_1115F:
        je      L_11187
        sub     word ptr [FD_FILE_REMAIN_LO], 1
        sbb     word ptr [FD_FILE_REMAIN_HI], 0
        cmp     word ptr [FD_BUF_BYTES_LEFT], 0
        jne     br_11175
L_11172:
        call    L_11271

br_11175:
        mov     si, word ptr [FD_BUF_PTR]
        mov     al, byte ptr [si]
        inc     word ptr [FD_BUF_PTR]
        dec     word ptr [FD_BUF_BYTES_LEFT]
        mov     ah, 0
        clc
        ret
L_11187:
        mov     ax, 0ffffh
        stc
        ret
int2c_fd_dos_f06:
        mov     ax, word ptr [FD_FILE_REMAIN_LO]
        or      ax, word ptr [FD_FILE_REMAIN_HI]
        jne     br_11196
        ret
br_11196:
        sub     word ptr [FD_FILE_REMAIN_LO], cx
        sbb     word ptr [FD_FILE_REMAIN_HI], 0
        jae     br_111B1
        add     cx, word ptr [FD_FILE_REMAIN_LO]
        mov     word ptr [FD_FILE_REMAIN_LO], 0
        mov     word ptr [FD_FILE_REMAIN_HI], 0
br_111B1:
        push    cx
        call    L_111B8
        pop     ax
        clc
        ret
L_111B8:
        cmp     cx, word ptr [FD_BUF_BYTES_LEFT]
        jbe     br_111E3
        sub     cx, word ptr [FD_BUF_BYTES_LEFT]
        push    cx
        mov     cx, word ptr [FD_BUF_BYTES_LEFT]
        mov     word ptr [FD_BUF_BYTES_LEFT], 0
        mov     si, word ptr [FD_BUF_PTR]
        rep movsb
        push    di
        push    es
L_111D5:
        call    L_11271
        pop     es
        pop     di
        pop     cx
        cmp     word ptr [FD_BUF_BYTES_LEFT], 0
        jne     L_111B8
        ret
br_111E3:
        sub     word ptr [FD_BUF_BYTES_LEFT], cx
        mov     si, word ptr [FD_BUF_PTR]
        rep movsb
        mov     word ptr [FD_BUF_PTR], si
        ret
int2c_fd_dos_f13:
        mov     ax, word ptr [FD_FILE_REMAIN_LO]
        or      ax, word ptr [FD_FILE_REMAIN_HI]
        jne     br_111FC
        ret
br_111FC:
        sub     word ptr [FD_FILE_REMAIN_LO], cx
        sbb     word ptr [FD_FILE_REMAIN_HI], 0
        jae     br_11217
        add     cx, word ptr [FD_FILE_REMAIN_LO]
        mov     word ptr [FD_FILE_REMAIN_LO], 0
        mov     word ptr [FD_FILE_REMAIN_HI], 0
br_11217:
        push    cx
        call    L_1121E
        pop     ax
        clc
        ret
L_1121E:
        cmp     cx, word ptr [FD_BUF_BYTES_LEFT]
        jbe     br_11249
        sub     cx, word ptr [FD_BUF_BYTES_LEFT]
        push    cx
        mov     cx, word ptr [FD_BUF_BYTES_LEFT]
        mov     word ptr [FD_BUF_BYTES_LEFT], 0
        mov     si, word ptr [FD_BUF_PTR]
        rep lodsb
        push    di
        push    es
L_1123B:
        call    L_11271
        pop     es
        pop     di
        pop     cx
        cmp     word ptr [FD_BUF_BYTES_LEFT], 0
        jne     L_1121E
        ret
br_11249:
        sub     word ptr [FD_BUF_BYTES_LEFT], cx
        mov     si, word ptr [FD_BUF_PTR]
        rep lodsb
        mov     word ptr [FD_BUF_PTR], si
        ret
int2c_fd_dos_f1f:
        sub     ax, 8000h
        sbb     dx, 0
        jb      br_1126A
        pusha
        mov     cx, 8000h
L_11264:
        call    int2c_fd_dos_f13
        popa
        jmp     SHORT int2c_fd_dos_f1f
br_1126A:
        add     ax, 8000h
        mov     cx, ax
        jmp     SHORT int2c_fd_dos_f13
L_11271:
        mov     ax, word ptr [FD_CUR_SECTOR]
        cmp     word ptr [FD_CLUSTER_SECT_LEFT], 0
        jne     L_11289
        mov     ax, word ptr [FD_CUR_CLUSTER]
        mov     bx, 0ff6h
        sub     bx, ax
L_11283:
        jae     L_11286
        ret
L_11286:
        call    fd_cluster_to_sector
L_11289:
        cmp     ax, word ptr [FD_CACHE_LBA_START]
L_1128D:
        jb      L_112BA
        cmp     ax, word ptr [FD_CACHE_LBA_END]
L_11293:
        jae     L_112BA
        sub     ax, word ptr [FD_CACHE_LBA_START]
        mov     ah, al
        sub     al, al
        shl     ax, 1
        add     ax, 5000h
        mov     word ptr [FD_BUF_PTR], ax
        mov     word ptr [FD_BUF_BYTES_LEFT], 200h
        inc     word ptr [FD_CUR_SECTOR]
        dec     word ptr [FD_CLUSTER_SECT_LEFT]
L_112B3:
        je      br_112B6
        ret
br_112B6:
        call    fd_fat12_next_cluster
        ret
L_112BA:
        call    floppy_read_lba
        test    byte ptr [FDC_RESULT], 0c0h
L_112C2:
        je      L_11271
        mov     al, byte ptr [FDC_RESULT]
        jmp     NEAR br_11B6F
fd_fat12_next_cluster:
        mov     ax, word ptr [FD_CUR_CLUSTER]
        mov     bx, ax
        shr     bx, 1
        pushf
L_112D2:
        add     bx, ax
        add     bx, word ptr [FD_FAT_OFFSET]
        mov     ax, word ptr [bx]
        popf
        jae     L_11B86
        shr     ax, 4
L_11B86:
        and     ah, 0fh
        mov     word ptr [FD_CUR_CLUSTER], ax
        ret

fd_cluster_to_sector:
        sub     ax, 2
        mov     bx, word ptr [FD_CLUSTER_SECTORS]
        mul     bx
        add     ax, word ptr [FD_DATA_SECTOR]
        mov     word ptr [FD_CUR_SECTOR], ax
        mov     word ptr [FD_CLUSTER_SECT_LEFT], bx
        ret
floppy_read_lba:
        push    ax
        mov     bh, byte ptr [FD_TRACK_SECTORS]
        div     bh
        mov     bl, ah
        sub     ah, ah
        shr     al, 1
        rcl     ah, 1
        sub     bh, bl
        cmp     ah, 0

        jne     L_11316
        add     bh, byte ptr [FD_TRACK_SECTORS]
L_11316:
        inc     bl
L_11318:
        push    bx
L_11319:
        call    fdc_read_chs
        pop     bx
        mov     bl, bh
        sub     bh, bh
        pop     ax
        mov     word ptr [FD_CACHE_LBA_START], ax
        add     ax, bx
L_11327:
        mov     word ptr [FD_CACHE_LBA_END], ax
        ret
int2c_fd_dos_f07:
        push    es
        pusha
L_1132D:
        call    int2c_fd_dos_f11
        popa
        pop     es
L_11332:
        jae     L_11336
        jmp     SHORT L_1138B
L_11336:
        cmp     byte ptr [FD_WRITE_PROTECT], 0
L_1133B:
        jne     br_113A4
        push    es
        push    si
        push    cx
        push    dx
L_11341:
        call    fd_dir_find_free_entry
        pop     dx
        pop     cx
        pop     si
        pop     es
L_11348:
        jb      br_113A9
        mov     word ptr [FD_WRITE_DIRENT], di
        mov     word ptr [di+16h], cx
        mov     word ptr [di+18h], dx
        push    es
        push    si
        push    di
L_11357:
        call    fd_fat12_alloc_cluster
        pop     di
        pop     si
        pop     es
L_1135D:
        jb      loop_113AE
        mov     word ptr [FD_CUR_CLUSTER], ax
        mov     word ptr [di+1ah], ax
L_11365:
        call    fat_encode_name
        sub     ax, ax
        mov     word ptr [di+1ch], ax
        mov     word ptr [di+1eh], ax
        mov     byte ptr [di+0bh], al
L_11373:
        call    fn_114EC
        mov     ax, word ptr [FD_WBUF_PTR]
        mov     word ptr [FD_WBUF_START], ax
        mov     ax, word ptr [FD_WRITE_LBA]
        mov     word ptr [FD_CACHE_LBA_START], ax
        mov     byte ptr [FD_FILE_MODE], 2
        sub     ax, ax
        clc
        ret
L_1138B:
        push    es
        pusha
L_1138D:
        call    exe_fd_reset
        push    ax
L_11391:
        call    int2c_fd_dos_f11
        pop     ax
L_11395:
        jb      br_113A0
        cmp     ah, 1
L_1139A:
        jne     br_113A0
        popa
        pop     es
        jmp     SHORT L_11336
br_113A0:
        popa
        pop     es
        jmp     SHORT br_113B3
br_113A4:
        mov     ax, 1
        stc
        ret
br_113A9:
        mov     ax, 2
        stc
        ret
loop_113AE:
        mov     ax, 3
        stc
        ret
br_113B3:
        mov     ax, 4
        stc
        ret
fat_encode_name:
        push    di
        push    ds
        mov     ax, ds
        mov     bx, es
L_113BE:
        mov     es, ax
        mov     ds, bx
        mov     cx, 8
tgt_113C5:
        lodsb
        cmp     al, 61h
        jb      L_113D0
        cmp     al, 7bh
        jae     L_113D0
        sub     al, 20h
L_113D0:
        stosb
        loop    tgt_113C5
        push    di
L_113D4:
        call    fn_113E1
        pop     di
        inc     si
        mov     cx, 3
        rep movsb
        pop     ds
        pop     di
        ret
fn_113E1:
        push    si
        mov     cx, 8
        mov     al, 0
L_113E7:
        or      al, byte ptr [si]
        inc     si
        loop    L_113E7
        pop     si
        add     di, 4
        cmp     al, 20h
L_113F2:
        je      L_11406
        mov     cx, 8
L_113F7:
        lodsb
L_11C9E:
        cmp     al, 61h
        jb      br_11402
        cmp     al, 7bh
        jae     br_11402
        sub     al, 20h
br_11402:
        stosb
        loop    L_113F7
        ret
L_11406:
        mov     al, 0
        mov     cx, 8
        rep stosb
        add     si, 8
        ret
int2c_fd_dos_f08:
        mov     di, word ptr [FD_WRITE_DIRENT]
        add     word ptr [di+1ch], 1
        adc     word ptr [di+1eh], 0
        mov     di, word ptr [FD_WBUF_PTR]
        mov     byte ptr [di], al
        inc     word ptr [FD_WBUF_PTR]
        dec     word ptr [FD_WBUF_BYTES_LEFT]
L_1142B:
        je      L_1142E
        ret
L_1142E:
        call    L_114B2
L_11431:
        jb      L_11434
        ret
L_11434:
        jmp     NEAR loop_113AE
int2c_fd_dos_f09:
        mov     di, word ptr [FD_WRITE_DIRENT]
        add     word ptr [di+1ch], cx
        adc     word ptr [di+1eh], 0
        mov     di, word ptr [FD_WRITE_DIRENT]
L_11446:
        cmp     cx, 0
L_11449:
        je      L_114A5
        cmp     cx, word ptr [FD_WBUF_BYTES_LEFT]
        jbe     L_1147F
        sub     cx, word ptr [FD_WBUF_BYTES_LEFT]
        push    cx
        mov     cx, word ptr [FD_WBUF_BYTES_LEFT]
        mov     di, word ptr [FD_WBUF_PTR]
        add     word ptr [FD_WBUF_PTR], cx
        mov     word ptr [FD_WBUF_BYTES_LEFT], 0
        mov     ax, ds
        mov     bx, es
L_1146C:
        mov     es, ax
        mov     ds, bx
        rep movsb
        mov     es, bx
L_11474:
        mov     ds, ax
L_11476:
        call    L_114B2
        pop     cx
        jae     L_11446
        jmp     NEAR loop_113AE
L_1147F:
        sub     word ptr [FD_WBUF_BYTES_LEFT], cx
        pushf
        mov     di, word ptr [FD_WBUF_PTR]
        add     word ptr [FD_WBUF_PTR], cx
        mov     ax, ds
        mov     bx, es
L_11490:
        mov     es, ax
        mov     ds, bx
        rep movsb
        mov     es, bx
L_11498:
        mov     ds, ax
        popf
L_1149B:
        jne     L_114A5
L_1149D:
        call    L_114B2
L_114A0:
        jae     L_114A5
        jmp     NEAR loop_113AE
L_114A5:
        sub     ax, ax
        ret
int2c_fd_dos_f0b:
        mov     di, word ptr [FD_DIRENT_PTR]
L_114AC:
        call    fat_encode_name
        jmp     NEAR fd_write_system_area
L_114B2:
        push    si
L_114B3:
        call    L_11568
        pop     si
L_114B7:
        jae     L_114BB
        jmp     SHORT L_114D8
L_114BB:
        call    fn_114EC
L_114BE:
        jb      L_114C1
        ret
L_114C1:
        push    cx
        push    si
        push    es
L_114C4:
        call    fn_1153B
        mov     ax, word ptr [FD_WBUF_PTR]
        mov     word ptr [FD_WBUF_START], ax
        mov     ax, word ptr [FD_WRITE_LBA]
        mov     word ptr [FD_CACHE_LBA_START], ax
        pop     es
        pop     si
        pop     cx
        clc
        ret
L_114D8:
        mov     byte ptr [FD_FILE_MODE], 0
        mov     di, word ptr [FD_WRITE_DIRENT]
        mov     byte ptr [di], 0
        mov     ax, word ptr [di+1ah]
L_114E7:
        call    L_116A2
        stc
        ret
fn_114EC:
        mov     ax, word ptr [FD_WBUF_PTR]
        mov     word ptr [W_F8C2], ax
        push    word ptr [FD_WBUF_PTR]
        push    word ptr [W_F8CA]
        mov     ax, word ptr [FD_CUR_CLUSTER]
        call    fd_cluster_to_sector
        mov     word ptr [FD_WRITE_LBA], ax
        mov     bl, byte ptr [FD_TRACK_SECTORS]
        add     bl, bl
        div     bl
        mov     bl, ah
        sub     bh, bh
        sub     ah, ah
        mov     word ptr [W_F8CA], ax
        mov     ax, word ptr [FD_SECTOR_BYTES]
        push    ax
        mul     bx
        add     ax, 5000h
        mov     word ptr [FD_WBUF_PTR], ax
        mov     ax, word ptr [FD_CLUSTER_SECTORS]
        pop     dx
        mul     dx
        mov     word ptr [FD_WBUF_BYTES_LEFT], ax
        pop     bx
        pop     ax
        cmp     bx, word ptr [W_F8CA]
        jne     br_11539
        cmp     ax, word ptr [FD_WBUF_PTR]
        jne     br_11539
        clc
        ret
br_11539:
        stc
        ret
fn_1153B:
        mov     ax, word ptr [W_F8C2]
        sub     ax, word ptr [FD_WBUF_START]
        jne     L_11545
        ret
L_11545:
        mov     bx, word ptr [FD_SECTOR_BYTES]
        div     bx
        mov     bh, al
        mov     ax, word ptr [FD_CACHE_LBA_START]
        mov     bl, byte ptr [FD_TRACK_SECTORS]
        div     bl
        mov     bl, ah
        sub     ah, ah
        shr     al, 1
        rcl     ah, 1
        inc     bl
L_11560:
        mov     si, word ptr [FD_WBUF_START]
L_11564:
        call    fdc_write_chs
        ret
L_11568:
        mov     cx, word ptr [FD_CUR_CLUSTER]
        call    fd_fat12_alloc_cluster_from
L_1156F:
        jae     L_11572
        ret
L_11572:
        mov     cx, ax
        xchg    word ptr [FD_CUR_CLUSTER], ax
        mov     bx, ax
        shr     bx, 1
        pushf
L_1157D:
        add     bx, ax
        add     bx, word ptr [FD_FAT_OFFSET]
        mov     ax, word ptr [bx]
        popf
        jae     L_11593
        shl     cx, 4
        and     ax, 0fh
        or      ax, cx
        mov     word ptr [bx], ax
        ret
L_11593:
        and     ax, 0f000h
        or      ax, cx
        mov     word ptr [bx], ax
        ret
int2c_fd_dos_f0a:
        sub     ax, ax
        xchg    byte ptr [FD_FILE_MODE], al
        cmp     al, 2
        jne     br_115CA
        mov     di, word ptr [FD_WBUF_PTR]
        mov     cx, word ptr [FD_WBUF_BYTES_LEFT]
        mov     ax, ds
        mov     es, ax
        mov     al, 0
        rep stosb
        mov     word ptr [FD_WBUF_PTR], di
L_115B9:
        call    fn_114EC
L_115BC:
        call    fn_1153B
        mov     si, word ptr [FD_WRITE_DIRENT]
        mov     byte ptr [si+0bh], 20h
L_115C7:
        call    fd_write_system_area
br_115CA:
        clc
        ret
fd_fat_copy_to_fat2:
        mov     ax, ds
        mov     es, ax
        mov     cx, word ptr [FD_FAT_BYTES]
        mov     si, word ptr [FD_FAT_OFFSET]
        mov     di, si
        add     di, cx
        shr     cx, 1
        rep movsw
L_115E0:
        ret
fd_write_system_area:
        call    fd_fat_copy_to_fat2
        mov     ax, 0
        mov     bl, 1
        mov     bh, byte ptr [FD_DATA_SECTOR]
        mov     si, 0
L_115F0:
        call    fdc_write_chs
        test    byte ptr [FDC_RESULT], 0c0h
        je      L_115FD
        jmp     NEAR error_disk_read_error_11b8c
L_115FD:
        clc
        ret
int2c_fd_dos_f15:
        mov     ax, ds
        mov     es, ax
        mov     di, word ptr [FD_ROOT_START]
        mov     cx, word ptr [FD_ROOT_END]
        sub     cx, di
L_1160D:
        sub     ax, ax
        rep stosb
        mov     di, word ptr [FD_FAT_OFFSET]
        add     di, 3
        mov     cx, word ptr [FD_FAT_BYTES]
        sub     cx, 3
        sub     ax, ax
        rep stosb
L_11623:
        call    fd_write_system_area
        clc
        ret
fd_fat12_alloc_cluster:
        mov     cx, 2
fd_fat12_alloc_cluster_from:
        mov     si, word ptr [FD_FAT_OFFSET]
L_1162F:
        mov     bx, cx
        shr     bx, 1
        pushf
L_11634:
        add     bx, cx
        mov     ax, word ptr [bx+si]
        popf
        jb      L_11654
        and     ax, 0fffh
        cmp     ax, 0
        jne     loop_1164B
        or      word ptr [bx+si], 0fffh
        mov     ax, cx
        clc
        ret
loop_1164B:
        inc     cx
        cmp     cx, word ptr [FD_DATA_CLUSTERS]
        jne     L_1162F
        stc
        ret
L_11654:
        and     ax, 0fff0h
        cmp     ax, 0
        jne     loop_1164B
        or      word ptr [bx+si], 0fff0h
        mov     ax, cx
        clc
        ret
int2c_fd_dos_f0d:
        mov     si, word ptr [FD_FAT_OFFSET]
        mov     cx, 2
        mov     dx, 0
L_1166D:
        inc     cx
        cmp     cx, word ptr [FD_DATA_CLUSTERS]
L_11672:
        je      br_11696
        mov     bx, cx
        shr     bx, 1
        pushf
L_11679:
        add     bx, cx
        mov     ax, word ptr [bx+si]
        popf
        jb      br_1168B
        and     ax, 0fffh
        cmp     ax, 0
        jne     L_1166D
        inc     dx
        jmp     SHORT L_1166D
br_1168B:
        and     ax, 0fff0h
        cmp     ax, 0
        jne     L_1166D
        inc     dx
        jmp     SHORT L_1166D
br_11696:
        mov     ax, word ptr [FD_CLUSTER_SECTORS]
        mul     dx
        shr     ax, 1
        mov     di, ax
        sub     si, si
        ret
L_116A2:
        or      ax, ax
L_116A4:
        jne     L_116A7
        ret
L_116A7:
        mov     si, word ptr [FD_FAT_OFFSET]
L_116AB:
        mov     bx, ax
        shr     bx, 1
        pushf
L_116B0:
        add     bx, ax
        mov     cx, word ptr [bx+si]
        popf
L_116B5:
        jb      br_116C7
        and     word ptr [bx+si], 0f000h
loop_116BB:
        and     cx, 0fffh
        mov     ax, cx
        cmp     ax, 0fffh
        jne     L_116AB
        ret
br_116C7:
        and     word ptr [bx+si], 0fh
        shr     cx, 4
        jmp     SHORT loop_116BB
int2c_fd_dos_f11:
        mov     byte ptr [FDC_CMD_LEN], 2
        mov     byte ptr [FDC_CMD], 4
        mov     byte ptr [FDC_CMD_HD_US], 0
calls_hw_init_port_22_116de:
        call    exe_fdc_send_command
L_116E1:
        call    exe_fdc_read_result
        xor     al, 38h
        mov     ah, al
        mov     bl, al
        and     bl, 40h
        mov     byte ptr [FD_WRITE_PROTECT], bl
        mov     bh, 0
        and     ah, 8
        sub     ah, 8
L_116F9:
        jb      br_116FE
        sub     ax, ax
        ret
br_116FE:
        mov     ax, 0ffffh
        ret
exe_fdc_recalibrate:
        mov     byte ptr [FDC_CMD_LEN], 2
        mov     byte ptr [FDC_CMD], 7
        mov     byte ptr [FDC_CMD_HD_US], 0
        cli
calls_hw_init_port_22_11712:
        call    exe_fdc_send_command
        sti
L_11716:
        call    disk_wait_complete
L_11719:
        call    exe_fdc_sense_interrupt
        cmp     al, 80h
        jne     br_11721
        ret
br_11721:
        cmp     al, 20h
        jne     br_11726
        ret
br_11726:
        stc
        ret
exe_fdc_seek:
        mov     byte ptr [FDC_CMD_LEN], 3
        mov     byte ptr [FDC_CMD], 0fh
        mov     byte ptr [FDC_CMD_HD_US], 0
        mov     byte ptr [FDC_CMD_CYL], al
        cli
calls_hw_init_port_22_1173b:
        call    exe_fdc_send_command
        sti
L_1173F:
        call    disk_wait_complete
L_11742:
        call    exe_fdc_sense_interrupt
        cmp     al, 20h
bc_int2a_11747:
        jne     bc_int2a_1174a
        ret


bc_int2a_1174a:
        INT_2A "   FDC SEEK error !!      "
fdc_read_chs:
        push    ax
        push    bx
L_11769:
        call    exe_fdc_seek
        pop     bx
        pop     ax
        mov     byte ptr [FDC_CMD_LEN], 9
        mov     cl, ah
        xor     cl, 1
        ror     cl, 1
        or      cl, 46h
        mov     byte ptr [FDC_CMD], cl
        mov     cl, ah
        rol     cl, 2
        mov     byte ptr [FDC_CMD_HD_US], cl
        mov     byte ptr [FDC_CMD_CYL], al
        mov     byte ptr [FDC_CMD_HEAD], ah
        mov     byte ptr [FDC_CMD_SECTOR], bl
L_11795:
        call    exe_fdc_density_select
        mov     dx, 0c031h
        mov     al, 1
        out     dx, al
        push    dx
        mov     dx, 0c03fh
        in      al, dx
        pop     dx
        or      al, 2
        mov     dx, 0c03fh
        out     dx, al
        mov     ax, ds
        mov     cx, 4
        sub     bl, bl
L_117B1:
        shl     ax, 1
        rcl     bl, 1
        loop    L_117B1
        add     ax, 5000h
        adc     bl, 0
        mov     dx, 0c034h
        out     dx, ax
        mov     al, bl
        if      FW_VERSION = 172
L_117C3:
        int     53h
        else
        or      al, 10h
        endif
        mov     dx, 0c036h
        out     dx, al
        mov     ah, bh
        if      FW_VERSION = 150
L_117C3:
        endif
        shl     ah, 1
        sub     al, al
        cmp     byte ptr [FDC_CMD_N], 3
        jne     L_117D8
        shl     ax, 1
L_117D8:
        dec     ax
        mov     dx, 0c032h
        out     dx, ax
        mov     dx, 0c03ah
        mov     al, 4
        out     dx, al
        push    dx
        mov     dx, 0c03bh
        in      al, dx
        pop     dx
        push    dx
        mov     dx, 0c03fh
        in      al, dx
        pop     dx
        and     al, 0fdh
        mov     dx, 0c03fh
        out     dx, al
calls_hw_init_port_22_117f5:
        call    exe_fdc_send_command
        call    L_11A3B
L_117FB:
        call    fn_11B22
        ret
fdc_write_chs:
        push    ax
        push    bx
        push    si
L_11802:
        call    exe_fdc_seek
        pop     si
        pop     bx
        pop     ax
        mov     byte ptr [FDC_CMD_LEN], 9
        mov     cl, ah
        xor     cl, 1
        ror     cl, 1
        or      cl, 45h
        mov     byte ptr [FDC_CMD], cl
        mov     cl, ah
        rol     cl, 2
        mov     byte ptr [FDC_CMD_HD_US], cl
        mov     byte ptr [FDC_CMD_CYL], al
        mov     byte ptr [FDC_CMD_HEAD], ah
        mov     byte ptr [FDC_CMD_SECTOR], bl
L_1182F:
        call    exe_fdc_density_select
        mov     dx, 0c031h
        mov     al, 1
        out     dx, al
        push    dx
        mov     dx, 0c03fh
        in      al, dx
        pop     dx
        or      al, 2
        mov     dx, 0c03fh
        out     dx, al
        mov     ax, ds
        mov     cx, 4
        sub     bl, bl
L_1184B:
        shl     ax, 1
        rcl     bl, 1
        loop    L_1184B
        add     ax, si
        adc     bl, 0
        mov     dx, 0c034h
        out     dx, ax
        mov     al, bl
        if      FW_VERSION = 172
L_1185C:
        int     53h
        else
        or      al, 10h
        endif
        mov     dx, 0c036h
        out     dx, al
        mov     ah, bh
        shl     ah, 1
        sub     al, al
        cmp     byte ptr [FDC_CMD_N], 3
        jne     L_11871
        shl     ax, 1
L_11871:
        dec     ax
        mov     dx, 0c032h
        out     dx, ax
        mov     dx, 0c03ah
        mov     al, 8
        out     dx, al
        push    dx
        mov     dx, 0c03bh
        in      al, dx
        pop     dx
        push    dx
        mov     dx, 0c03fh
        in      al, dx
        pop     dx
        and     al, 0fdh
        mov     dx, 0c03fh
        out     dx, al
calls_hw_init_port_22_1188e:
        call    exe_fdc_send_command
L_11891:
        call    L_11A3B
L_11894:
        call    fn_11B22
        test    byte ptr [FDC_RESULT], 0c0h
L_1189C:
        je      L_118A1
        jmp     NEAR error_disk_read_error_11b8c
L_118A1:
        ret
int2c_fd_dos_f18:
        mov     byte ptr [FD_FMT_720K], al
L_118A5:
        mov     byte ptr [FD_FMT_TRACK], 0
        mov     byte ptr [FD_AKAI_FORMAT], 0
        cmp     al, 0
L_118B1:
        jne     L_118B6
        jmp     NEAR fd_geom_set_1440k
L_118B6:
        jmp     NEAR fd_geom_set_720k
int2c_fd_dos_f0c:
        mov     al, byte ptr [FD_FMT_TRACK]
        push    ax
        shr     al, 1
L_118BF:
        call    exe_fdc_seek
        pop     ax
        mov     ah, al
        shr     al, 1
        and     ah, 1
        push    ax
        shl     ah, 2
        mov     byte ptr [FDC_FMT_HD_US], ah
        mov     bl, 1
        mov     bh, byte ptr [FDC_FMT_N]
        mov     cl, byte ptr [FDC_FMT_SC]
        sub     ch, ch
        mov     di, 0f800h
        pop     ax
L_118E2:
        mov     byte ptr [di], al
        inc     di
        mov     byte ptr [di], ah
        inc     di
        mov     byte ptr [di], bl
        inc     di
        mov     byte ptr [di], bh
        inc     di
        inc     bl
        loop    L_118E2
L_118F2:
        call    exe_fdc_density_select
        mov     dx, 0c031h
        mov     al, 1
        out     dx, al
        push    dx
        mov     dx, 0c03fh
        in      al, dx
        pop     dx
        or      al, 2
        mov     dx, 0c03fh
        out     dx, al
        mov     ax, ds
        mov     cx, 4
        sub     bl, bl
L_1190E:
        shl     ax, 1
        rcl     bl, 1
        loop    L_1190E
        add     ax, 0f800h
        adc     bl, 0
        mov     dx, 0c034h
        out     dx, ax
        mov     al, bl
        if      FW_VERSION = 172
L_11920:
        int     53h
        else
        or      al, 10h
        endif
        mov     dx, 0c036h
        out     dx, al
        mov     al, byte ptr [FDC_FMT_SC]
        mov     ah, 4
        dec     ax
        mov     dx, 0c032h
        out     dx, ax
        mov     dx, 0c03ah
        mov     al, 8
        out     dx, al
        push    dx
        mov     dx, 0c03bh
        in      al, dx
        pop     dx
        push    dx
        mov     dx, 0c03fh
        in      al, dx
        pop     dx
        and     al, 0fdh
        mov     dx, 0c03fh
        out     dx, al
        mov     byte ptr [FDC_FMT_CMD_LEN], 6
        mov     byte ptr [FDC_FMT_CMD], 4dh
L_11952:
        call    calls_hw_wait_ready_11a91
        call    L_11A3B
L_11958:
        call    fn_11B22
        test    al, 0c0h
        je      L_11962
        jmp     NEAR error_disk_write_error_11ba9
L_11962:
        inc     byte ptr [FD_FMT_TRACK]
        mov     al, byte ptr [FD_FMT_TRACK]
        shr     al, 1
        ret
int2c_fd_dos_f19:
        sub     ax, ax
        mov     es, ax
        mov.l   word ptr es:[0f8h], error_floppy_disk_format_11bc6
        mov     word ptr es:[0fah], cs
L_1197C:
        call    exe_fdc_recalibrate
        mov     ax, ds
        mov     es, ax
        mov     di, 0
        push    di
        mov     cx, 2100h
        sub     ax, ax
        rep stosw
        pop     di
        mov     si, P_1B4B
        mov     al, 0f0h
        cmp     byte ptr [FD_FMT_720K], 0
        je      L_119A0
        mov     si, P_1B67
        mov     al, 0f9h
L_119A0:
        mov     byte ptr [di+TBL_0200], al
        mov     word ptr [di+TBL_0201], 0ffffh
        mov     cx, 1ch
        push    ds
        mov     ax, cs
        mov     ds, ax
        rep movsb
        pop     ds
L_119B5:
        call    fd_fat_copy_to_fat2
        mov     si, 0
        mov     al, 0
        mov     ah, 0
        mov     bl, 1
        mov     bh, byte ptr [FD_DATA_SECTOR]
L_119C5:
        call    fdc_write_chs
        mov     al, 50h
        ret
fdc_119CB:
        jmp     SHORT fdc_119CB
        db      090h, "MPC2000 ", 000h, 002h, 001h, 001h, 000h, 002h, 0e0h
        db      00h, 40h, 0bh, 0f0h, 09h, 00h, 12h, 00h, 02h, 00h, 0ebh, 0feh, 90h, 4dh, 50h, 43h
        db      32h, 30h, 30h, 30h, 20h, 00h, 02h, 02h, 01h, 00h, 02h, 70h, 00h, 0a0h, 05h, 0f9h
        db      003h, 000h, 009h, 000h, 002h, 000h, 0ebh, 0feh, 090h, "XXXXXXX"
        db      20h, 00h, 02h, 02h, 01h, 00h, 02h, 70h, 00h, 00h, 05h, 0fbh, 02h, 00h, 08h, 00h
        db      002h, 000h, 0ebh, 0feh, 090h, "MPC2000 ", 000h, 002h, 002h
        db      01h, 00h, 02h, 70h, 00h, 40h, 06h, 0f9h, 03h, 00h, 0ah, 00h, 02h, 00h
L_11A3B:
        call    disk_wait_complete
        in      al, 20h
        test    al, 40h
L_11A42:
        je      exe_fdc_sense_interrupt
        jmp     SHORT exe_fdc_read_result
exe_fdc_sense_interrupt:
        mov     byte ptr [FDC_CMD_LEN], 1
        mov     byte ptr [FDC_CMD], 8
calls_hw_init_port_22_11a50:
        call    exe_fdc_send_command
L_11A53:
        call    exe_fdc_read_result
        and     al, 0f8h
        ret
exe_fdc_read_result:
        call    fdc_11AC4
        mov     si, 0f8f4h
L_11A5F:
        call    disk_retry_counters_reset
L_11A62:
        call    disk_retry_delay_and_count
        in      al, 20h
        and     al, 0c0h
        cmp     al, 80h
L_11A6B:
        je      br_11A78
        cmp     al, 0c0h
        jne     L_11A62
        in      al, 22h
        mov     byte ptr [si], al
        inc     si
        jmp     SHORT L_11A62
br_11A78:
        mov     al, byte ptr [FDC_RESULT]
        ret
exe_fdc_send_command:
        mov     si, 0f8e2h
        mov     byte ptr [FDC_IRQ_FLAG], 0
calls_hw_wait_ready_11a84:
        call    hw_wait_ready
        lodsb
        out     22h, al
        dec     byte ptr [FDC_CMD_LEN]
        jne     calls_hw_wait_ready_11a84
        ret
calls_hw_wait_ready_11a91:
        mov     si, 0f8edh
        mov     byte ptr [FDC_IRQ_FLAG], 0
calls_hw_wait_ready_11a99:
        call    hw_wait_ready
        lodsb
        out     22h, al
        dec     byte ptr [FDC_FMT_CMD_LEN]
        jne     calls_hw_wait_ready_11a99
        ret
check_disk_status:
        push    ax
calls_hw_wait_ready_11aa7:
        call    hw_wait_ready
        pop     ax
        mov     al, ah
        out     20h, al
L_11AAF:
        call    fdc_11AC4
        in      al, 22h
        ret
hw_wait_ready:
        call    disk_retry_counters_reset
fdc_11AB8:
        call    disk_retry_delay_and_count
        in      al, 20h
        and     al, 0c0h
        cmp     al, 80h
        jne     fdc_11AB8
        ret
fdc_11AC4:
        call    disk_retry_counters_reset
fdc_11AC7:
        call    disk_retry_delay_and_count
        in      al, 20h
        and     al, 0c0h
        cmp     al, 0c0h
        jne     fdc_11AC7
        ret
int2c_fd_dos_f0f:
        mov     ah, 1eh
L_11AD5:
        call    check_disk_status
        cmp     byte ptr [FD_MOTOR_ON], 0
L_11ADD:
        je      br_11AE0
        ret
br_11AE0:
        mov     byte ptr [FD_MOTOR_ON], 1
        mov     bl, 7
L_11AE7:
        mov     cx, 0ffffh
L_11AEA:
        mul     ax
        loop    L_11AEA
        dec     bl
L_11AF0:
        jne     L_11AE7
        ret
int2c_fd_dos_f10:
        mov     ah, 0eh
L_11AF5:
        call    check_disk_status
        mov     byte ptr [FD_MOTOR_ON], 0
        ret
exe_fdc_density_select:
        pusha
        mov     dx, 0c030h
        mov     al, 1
        out     dx, al
        mov     dx, 0c038h
        mov     al, 10h
        out     dx, al
        mov     dx, 0c039h
        mov     al, 1
        out     dx, al
        mov     al, 31h
        cmp     byte ptr [FD_HIGH_DENSITY], 0
        jne     br_11B1C
        mov     al, 71h
br_11B1C:
        mov     dx, 0fff6h
        out     dx, al
        popa
        ret
fn_11B22:
        pusha
        mov     dx, 0c030h
        mov     al, 1
        out     dx, al
        mov     dx, 0c038h
        mov     al, 10h
        out     dx, al
        mov     dx, 0c039h
        mov     al, 0
        out     dx, al
        mov     dx, 0fff6h
        mov     al, 11h
        out     dx, al
        popa
        ret
disk_wait_complete:
        call    disk_retry_counters_reset
loop_11B40:
        call    disk_retry_delay_and_count
        cmp     byte ptr [FDC_IRQ_FLAG], 0
        je      loop_11B40
        ret
disk_retry_counters_reset:
        mov     word ptr [W_F896], 0
        mov     word ptr [FD_RETRY_COUNT], 14h
        ret
disk_retry_delay_and_count:
        push    ax
        push    dx
        mov     ax, 0ffffh
        mul     ax
        pop     dx
        pop     ax
        dec     word ptr [W_F896]

        je      L_11B68
        ret
L_11B68:
        dec     word ptr [FD_RETRY_COUNT]
L_11B6C:
        je      br_11B6F
        ret
br_11B6F:
        INT_2A "     Disk read error  !!  "
error_disk_read_error_11b8c:
        INT_2A "    Disk write error  !!  "
error_disk_write_error_11ba9:
        INT_2A "Floppy disk format error!!"
error_floppy_disk_format_11bc6:
        sti
floppy_disk_format_error_msg:
        if      FW_VERSION = 150
L_12478_V150                         equ     $+11
        endif
        BC_PRINT "Floppy disk format error!!"
L_1248B:
        db      0cfh
print_floppy_disk_format_11be6:
        cmp     al, 4
bc_int2a_11be8:
        jne     error_write_protect_11c07
L_11BEA:
        if      FW_VERSION = 150
L_12499                         equ     $+9
L_124A3                         equ     $+19
L_124A7                         equ     $+23
L_124A9                         equ     $+25
        endif
        INT_2A "     Write protect !!     "
error_write_protect_11c07:
        call    error_scsi_read_error_11c8b
L_11C0A:
        if      FW_VERSION = 150
L_124B2                         equ     $+2
L_124B6                         equ     $+6
L_124C5                         equ     $+21
        endif
        INT_2A "    SCSI Write error !!   "
error_scsi_write_error_11c27:
        call    error_scsi_read_error_11c8b
        cmp     al, 2
        jne     error_scsi_not_ready_11c4b
L_11C2E:
        if      FW_VERSION = 150
L_124E5                         equ     $+17
L_124E7                         equ     $+19
L_124ED                         equ     $+25
        endif
        INT_2A "      SCSI Not ready  !!  "
error_scsi_not_ready_11c4b:
        cmp     al, 3
        jne     error_scsi_disk_change_11c6c
L_11C4F:
        if      FW_VERSION = 150
L_12503                         equ     $+14
L_12505                         equ     $+16
L_1250B                         equ     $+22
        endif
        INT_2A "     SCSI Disk change !!  "
error_scsi_disk_change_11c6c:
        cmp     al, 2
L_11C6E:
        INT_2A "      SCSI Read error !!  "
error_scsi_read_error_11c8b:
        push    ax
        mov     ax, ds
        mov     es, ax
        if      FW_VERSION = 150
L_12536:
        endif
        mov     di, 0f901h
        mov     cx, 362h
        sub     ax, ax
        rep stosw
        mov     bx, DATA_SEG
        mov     es, bx
L_11C9F:
        mov     byte ptr es:[B_78B2], 0
        mov     byte ptr es:[G_DISK_PART_COUNT], 0
        mov     byte ptr es:[G_DISK_PARTITION], 0
        pop     ax
        ret
disk_init_4:
        mov     ah, 0
        int     2dh
        ret
        if      FW_VERSION = 172
disk_format_1:
        endif
int2c_hd_dos_f01:
        mov     ax, ds
        mov     es, ax
        mov     di, 0f901h
        mov     cx, 362h
        sub     ax, ax
        rep stosw
        if      FW_VERSION = 150
disk_format_1                   equ     $+4
        endif
        mov     word ptr [HD_PART_LBA], 0
        mov     word ptr [HD_PART_LBA_HI], 0
        mov     byte ptr [HD_MOUNT_STATUS], 0
        mov     ah, 5
        int     2dh
        mov     ah, 3
        mov     dx, ds
        mov     di, 0f905h
        mov     cx, 2ch
        mov     cx, 24h
        int     2dh
L_11CEA:
        jae     L_12594
        jmp     br_11D60
L_12594:
        db      8ah, 26h, 05h, 0f9h, 80h, 0fch, 00h, 74h, 0ch, 80h, 0fch, 05h
L_11CFA:
        je      disk_verify_2
        cmp     ah, 7
L_11CFF:
        je      disk_verify_2
        jmp     br_11D6E
disk_verify_2:
        mov     byte ptr [HD_SCSI_DEV_TYPE], ah
        mov     ah, 6
        int     2dh
L_11D0B:
        jae     L_11D10
        jmp     L_11F31
L_11D10:
        mov     word ptr [HD_CAPACITY_LO], di
        mov     word ptr [HD_CAPACITY_HI], dx
L_11D18:
        call    hd_read_boot_sector
        cmp     al, 11h
        clc
L_11D1E:
        je      L_11D21
        ret
L_11D21:
        if      FW_VERSION = 172
        cmp     byte ptr [BUF_DISK_SECTOR+1eeh], 0
L_11D26:
        jne     L_11D29
        ret
        endif
L_11D29:
        if      FW_VERSION = 172
        mov     ax, word ptr [BUF_DISK_SECTOR+1f6h]
        mov     dx, word ptr [BUF_DISK_SECTOR+1f8h]
        else
        mov     ax, word ptr [BUF_DISK_SECTOR+1c6h]
        mov     dx, word ptr [BUF_DISK_SECTOR+1c8h]
        endif
        mov     word ptr [HD_PART_LBA], ax
        mov     word ptr [HD_PART_LBA_HI], dx
L_11D37:
        call    hd_read_boot_sector
        mov     dh, byte ptr [HD_SCSI_DEV_TYPE]
        mov     dl, 0
        mov     ah, 1
        cmp     al, 12h
L_11D44:
        jne     br_11D47
        ret

br_11D47:
        sub     ax, ax
        mov     word ptr [HD_PART_LBA], ax
        mov     word ptr [HD_PART_LBA_HI], dx
        mov     dh, byte ptr [HD_SCSI_DEV_TYPE]
        mov     dl, 0
        mov     al, 11h
        mov     ah, 0
        sub     si, si
        sub     di, di
        stc
        ret
br_11D60:
        mov     al, 10h
        mov     ah, 0
        mov     dl, 0
        mov     dh, 9
        sub     si, si
        sub     di, di
        stc
        ret
br_11D6E:
        mov     al, 11h
        mov     ah, 0
        mov     dl, 0
        mov     dh, 9
        sub     si, si
        sub     di, di
        stc
        ret


hd_read_boot_sector:
        sub     ax, ax
        sub     dx, dx
        mov     cx, 1
        mov     di, BUF_DISK_SECTOR
L_11D86:
        call    disk_io_int2d
        mov     ax, word ptr [HD_PART_LBA]
        mov     dx, word ptr [HD_PART_LBA_HI]
        cmp     byte ptr [BUF_DISK_SECTOR], 0ebh
L_11D95:
        je      L_11DA1
        cmp     byte ptr [BUF_DISK_SECTOR], 0e9h
L_11D9C:
        je      L_11DA1
L_11D9E:
        jmp     NEAR L_11F31
L_11DA1:
        cmp     word ptr [BUF_DISK_SECTOR+1feh], 0aa55h
L_11DA7:
        je      L_11DAC
        jmp     NEAR L_11F31
L_11DAC:
        mov     si, P_A036
        call    fn_10736                ; the string to match follows the call
        db      "FAT12", 0
        mov     ah, 0ch
        jae     L_11DD9
        call    fn_10736
        db      "FAT16", 0
        mov     ah, 10h
        jae     L_11DD9
        cmp     byte ptr [MBR_PART1_TYPE], 4
L_11DCE:
        je      L_11DD9
        cmp     word ptr [BPB_TOTAL_SECTORS16], 0
        je      L_11DD9
        mov     ah, 0ch
L_11DD9:
        mov     byte ptr [HD_FAT_BITS], ah
        cmp     word ptr [BPB_BYTES_PER_SECTOR], 200h
L_11DE3:
        je      L_11DE8
        jmp     NEAR L_11F31
L_11DE8:
        mov     bl, byte ptr [BPB_FAT_COUNT]
        cmp     bl, 2
L_11DEF:
        je      br_11DF4
        jmp     NEAR L_11F31
br_11DF4:
        mov     ax, word ptr [BPB_RESERVED_SECTORS]
        mov     word ptr [HD_FAT_START], ax
        mov     cx, word ptr [BPB_SECTORS_PER_FAT]
        mov     word ptr [HD_FAT_SECTORS], cx
        add     ax, cx
        mov     word ptr [HD_FAT2_START], ax
        add     ax, cx
        mov     word ptr [HD_ROOT_START], ax
        mov     ax, word ptr [BPB_ROOT_ENTRIES]
        mov     word ptr [HD_ROOT_ENTRIES], ax
        mov     ax, word ptr [BPB_ROOT_ENTRIES]
        mov     dx, 20h
        mul     dx
        mov     bx, 200h
        div     bx
        or      dx, dx
        je      br_11E24
        inc     ax
br_11E24:
        add     ax, word ptr [HD_ROOT_START]
        mov     word ptr [HD_DATA_START], ax
        mov     di, ax
        mov     al, byte ptr [BPB_SECTORS_PER_CLUSTER]
        or      al, al
        jne     br_11E37
        jmp     NEAR L_11F31
br_11E37:
        cmp     al, 21h
        jb      br_11E3E
        jmp     NEAR L_11F31
br_11E3E:
        sub     ah, ah
        mov     word ptr [HD_CLUSTER_SECTORS], ax
        mov     bx, 200h
        mul     bx
        mov     word ptr [HD_CLUSTER_BYTES], ax
        sub     dx, dx
        mov     ax, word ptr [BPB_TOTAL_SECTORS16]
        or      ax, ax
        jne     br_11E5B
        mov     ax, word ptr [BPB_TOTAL_SECTORS32]
        mov     dx, word ptr [BPB_TOTAL_SECTORS32_HI]
br_11E5B:
        sub     ax, di
        sbb     dx, 0
        mov     bx, word ptr [HD_CLUSTER_SECTORS]
        cmp     dx, bx
        jb      L_11E6B
        jmp     NEAR L_11F31
L_11E6B:
        div     bx
        mov     word ptr [HD_CLUSTERS], ax
        mov     ax, 0
L_11E73:
        call    disk_format_sector
        mov     ax, 0
L_11E79:
        call    hd_fat_cache_load
        cmp     byte ptr [HD_FAT_BITS], 0ch
        jne     br_11E92
        mov     ax, word ptr [HD_FAT_START]
        sub     dx, dx
        mov     cx, word ptr [HD_FAT_SECTORS]
        mov     di, BUF_DISK_FAT
L_11E8F:
        call    disk_io_int2d
br_11E92:
        mov     si, P_A003
        call    fn_10736
        db      "MPC2000", 0
        jb      L_11EC4
        mov     si, P_A044
        mov     cx, 1ah
        mov     dl, 0ffh
L_11EAA:
        inc     dl
        lodsw
        mov     bx, ax
        lodsw
        or      ax, bx
L_11EB2:
        je      L_11EB6
        loop    L_11EAA
L_11EB6:
        mov     byte ptr [HD_PART_COUNT], dl
        mov     dh, byte ptr [HD_SCSI_DEV_TYPE]
        mov     al, 13h
        mov     ah, 1
        clc
        ret
L_11EC4:
        mov     si, BPB_TOTAL_SECTORS32
        mov     cx, 20h
        mov     al, 0
L_11ECC:
        or      al, byte ptr [si]
        inc     si
        loop    L_11ECC
        cmp     al, 0
L_11ED3:
        je      br_11ED7
        jmp     SHORT br_11F25
br_11ED7:
        mov     si, P_A040
        mov     cx, 70h
        mov     al, 0
L_11EDF:
        or      al, byte ptr [si]
        inc     si
        loop    L_11EDF
        cmp     al, 0
L_11EE6:
        jne     br_11EEA
        jmp     SHORT br_11F25
br_11EEA:
        mov     si, P_A0B0
        mov     cx, 14ch
        mov     al, 0
L_11EF2:
        or      al, byte ptr [si]
        inc     si
        loop    L_11EF2
        cmp     al, 0
L_11EF9:
        jne     br_11F25
        if      FW_VERSION = 172
        cmp     word ptr [BUF_DISK_SECTOR+1feh], 0aa55h
        else
        cmp     word ptr [BUF_DISK_SECTOR+1fch], 0aa55h
        endif
L_11F01:
        jne     br_11F25
        mov     si, P_A044
        mov     cx, 19h
        mov     dl, 0ffh
L_11F0B:
        inc     dl
        lodsw
        mov     bx, ax
        lodsw
        or      ax, bx
L_11F13:
        je      br_11F17
        loop    L_11F0B
br_11F17:
        mov     byte ptr [HD_PART_COUNT], dl
        mov     dh, byte ptr [HD_SCSI_DEV_TYPE]
        mov     al, 14h
        mov     ah, 1
        clc
        ret
br_11F25:
        mov     al, 12h
        mov     ah, 1
        mov     dh, byte ptr [HD_SCSI_DEV_TYPE]
        mov     dl, 0
        clc
        ret
L_11F31:
        sub     ax, ax
        sub     dx, dx
        mov     cx, 3
        mov     di, 0
        push    di
L_11F3C:
        call    fn_1274F
        pop     di
L_11F40:
        call    fn_11FD0
L_11F43:
        jae     br_11F48
        jmp     NEAR calls_string_compare_cs_11ffa
br_11F48:
        mov     cl, byte ptr [HD_HDR_BUF+4500h]
        mov     dl, cl
        dec     dl
        mov     si, HD_HDR_BUF+4502h
        mov     ch, 0
        sub     ax, ax
tgt_11F57:
        add     ax, word ptr [si]
        add     si, 2
        loop    tgt_11F57
        cmp     ax, word ptr [si]
        je      L_11F66
        jmp     SHORT br_11F8D
L_11F64:
        mov     dl, 0
L_11F66:
        mov     si, HD_HDR_BUF+4502h
        mov     di, BUF_DISK_FAT
        mov     cx, 12h
        mov     ax, ds
        mov     es, ax
        rep movsw
        mov     byte ptr [HD_MOUNT_STATUS], 1
        mov     al, 15h
        test    byte ptr [HD_HDR_BUF+0cah], 2
L_11F81:
        jne     br_11F85
        mov     al, 16h
br_11F85:
        mov     ah, 3
        mov     dh, byte ptr [HD_SCSI_DEV_TYPE]
        clc
        ret
br_11F8D:
        mov     cl, byte ptr [HD_HDR_BUF+4900h]
        mov     dl, cl
        dec     dl
        mov     si, HD_HDR_BUF+4902h
        mov     ch, 0
        sub     ax, ax
tgt_11F9C:
        add     ax, word ptr [si]
        add     si, 2
        loop    tgt_11F9C
        cmp     ax, word ptr [si]
        je      L_11FA9
        mov     dl, 0
L_11FA9:
        mov     si, HD_HDR_BUF+4902h
        mov     di, BUF_DISK_FAT
        mov     cx, 12h
        mov     ax, ds
        mov     es, ax
        rep movsw
        mov     byte ptr [HD_MOUNT_STATUS], 1
        mov     al, 15h
        test    byte ptr [HD_HDR_BUF+0cah], 2
L_11FC4:
        jne     br_11FC8
        mov     al, 16h
br_11FC8:
        mov     ah, 3
        mov     dh, byte ptr [HD_SCSI_DEV_TYPE]
        clc
        ret
fn_11FD0:
        mov     cx, 63h
        sub     ax, ax
        sub     dx, dx
        sub     bx, bx
        cmp     ax, word ptr [di]
        je      br_11FF8
tgt_11FDD:
        add     ax, word ptr [di]
        adc     dx, 0
        or      bx, word ptr [di]
        add     di, 2
        loop    tgt_11FDD
        cmp     ax, word ptr [di]
        jne     br_11FF8
        cmp     dx, word ptr [di+2]
        jne     br_11FF8
        or      bx, bx
        je      br_11FF8
        clc
        ret

br_11FF8:
        stc
        ret
calls_string_compare_cs_11ffa:
        mov     ax, ds
        mov     es, ax
        mov     si, 0
calls_string_compare_cs_12001:
        call    string_compare_cs
        db      "EMU", 0
        jb      calls_string_compare_cs_12023
L_1200A:
        call    L_12DEB
        mov     al, 1
        call    int2c_hd_emu_f1a
        mov     al, 1ah
        mov     ah, 6
        mov     dh, byte ptr [HD_SCSI_DEV_TYPE]
        mov     dl, 0
        mov     byte ptr [HD_MOUNT_STATUS], 3
        clc
        ret
calls_string_compare_cs_12023:
        mov     ax, ds
        mov     es, ax
        mov     si, 4
calls_string_compare_cs_1202a:
        call    string_compare_cs
        db      "S770 MR25A", 0
        jb      L_1204B
        mov     al, 1bh
        mov     ah, 7
        mov     dh, byte ptr [HD_SCSI_DEV_TYPE]
        mov     dl, 0
        mov     byte ptr [HD_MOUNT_STATUS], 2
        clc
        ret
L_1204B:
        mov     al, 11h
        mov     ah, 0
        mov     dh, byte ptr [HD_SCSI_DEV_TYPE]
        mov     dl, 0
        sub     si, si
        sub     di, di
        stc
        ret
int2c_hd_dos_f17:
        push    ax
        sub     ax, ax
        sub     dx, dx
        mov     word ptr [HD_PART_LBA], ax
        mov     word ptr [HD_PART_LBA_HI], ax
        mov     cx, 1
        mov     di, BUF_DISK_SECTOR
L_1206C:
        call    disk_io_int2d
        pop     ax
        sub     ah, ah
        shl     ax, 2
        add     ax, P_A040
        mov     si, ax
        lodsw
        mov     word ptr [HD_PART_LBA], ax
        lodsw
        mov     word ptr [HD_PART_LBA_HI], ax
L_12082:
        call    hd_read_boot_sector
        ret
int2c_hd_dos_f02:
        mov     ah, 5
        int     2dh
L_1208A:
        jb      loop_120E2
        sub     ax, ax
        mov     word ptr [HD_DIR_BUF_SECT], ax
        mov     word ptr [HD_DIR_INDEX], ax
L_12094:
        call    disk_format_sector
        mov     word ptr [HD_DIRENT_PTR], 0fda5h
        sub     ax, ax
        call    L_120AD
        ret
int2c_hd_dos_f03:
        mov     ax, word ptr [HD_DIR_INDEX]
L_120A6:
        inc     ax
        cmp     ax, word ptr [HD_ROOT_ENTRIES]
L_120AB:
        jae     loop_120E2
L_120AD:
        push    ax
        push    ax
        shr     ax, 4
        cmp     ax, word ptr [HD_DIR_BUF_SECT]
        je      L_120BB
L_120B8:
        call    disk_format_sector
L_120BB:
        pop     si
        and     si, 0fh
        shl     si, 5
        add     si, 0fda5h
        pop     ax
        cmp     byte ptr [si], 0
L_120CA:
        je      loop_120E2
        push    ax
L_120CD:
        call    fat_dirent_is_skipped
        pop     ax
        jb      L_120A6
        mov     word ptr [HD_DIR_INDEX], ax
        mov     word ptr [HD_DIRENT_PTR], si
        mov     di, 0f967h
        call    hd_dirent_name_to_field
        clc
        ret
loop_120E2:
        mov     ax, word ptr [HD_DIR_INDEX]
        push    ax
        shr     ax, 4
        cmp     ax, word ptr [HD_DIR_BUF_SECT]
        je      br_120F2
L_120EF:
        call    disk_format_sector
br_120F2:
        pop     si
        and     si, 0fh
        shl     si, 5
        add     si, 0fda5h
        mov     word ptr [HD_DIRENT_PTR], si
        mov     di, 0f967h
        call    hd_dirent_name_to_field
        stc
        ret
int2c_hd_dos_f16:
        mov     ax, word ptr [HD_DIR_INDEX]
L_1210C:
        or      ax, ax
L_1210E:
        je      br_1213F
        dec     ax
        push    ax
        push    ax
        shr     ax, 4
        cmp     ax, word ptr [HD_DIR_BUF_SECT]
        je      L_1211F
L_1211C:
        call    disk_format_sector
L_1211F:
        pop     si
        and     si, 0fh
        shl     si, 5
        add     si, 0fda5h
L_1212A:
        call    fat_dirent_is_skipped
        pop     ax
        jb      L_1210C
        mov     word ptr [HD_DIR_INDEX], ax
        mov     word ptr [HD_DIRENT_PTR], si
        mov     di, 0f967h
        call    hd_dirent_name_to_field
        clc
        ret
br_1213F:
        mov     word ptr [HD_DIR_INDEX], ax
        jmp     SHORT loop_120E2
disk_format_sector:
        mov     word ptr [HD_DIR_BUF_SECT], ax
        add     ax, word ptr [HD_ROOT_START]
        mov     dx, 0
        mov     cx, 1
        mov     di, HD_DIR_BUF
L_12154:
        call    disk_io_int2d
        ret
L_12158:
        sub     ax, ax
        mov     word ptr [HD_DIR_BUF_SECT], ax
        mov     word ptr [HD_DIR_INDEX], ax
L_12160:
        call    disk_format_sector
        mov     word ptr [HD_DIRENT_PTR], 0fda5h
L_12169:
        mov     si, word ptr [HD_DIRENT_PTR]
        cmp     byte ptr [si], 0
L_12170:
        jne     L_12173
        ret
L_12173:
        cmp     byte ptr [si], 5
L_12176:
        jne     L_12179
        ret
L_12179:
        cmp     byte ptr [si], 0e5h
L_1217C:
        jne     br_1217F
        ret
br_1217F:
        mov     ax, word ptr [HD_DIR_INDEX]
        inc     ax
        cmp     ax, word ptr [HD_ROOT_ENTRIES]
        jae     br_121AC
        mov     word ptr [HD_DIR_INDEX], ax
        push    ax
        push    ax
        shr     ax, 4
        cmp     ax, word ptr [HD_DIR_BUF_SECT]
        je      br_1219A
L_12197:
        call    disk_format_sector
br_1219A:
        pop     si
        and     si, 0fh
        shl     si, 5
        add     si, 0fda5h
        mov     word ptr [HD_DIRENT_PTR], si
        pop     ax
        jmp     SHORT L_12169
br_121AC:
        stc
        ret
int2c_hd_dos_f0e:
        push    si
        push    es
L_121B0:
        call    int2c_hd_dos_f02
        pop     es
        pop     di
        jb      L_121E0
loop_121B7:
        mov     cx, 14h
        mov     bp, di
        mov     si, 0f967h
tgt_121BF:
        mov     al, byte ptr es:[di]
        cmp     al, 61h
        jb      L_121CC
        cmp     al, 7bh
        jae     L_121CC
        sub     al, 20h
L_121CC:
        cmp     al, byte ptr [si]
L_121CE:
        jne     L_121D7
        inc     si
        inc     di
        loop    tgt_121BF
        sub     ax, ax
        ret
L_121D7:
        push    es
        push    bp
L_121D9:
        call    int2c_hd_dos_f03
        pop     di
        pop     es
        jae     loop_121B7
L_121E0:
        sub     dx, dx
        sub     bx, bx
        mov     ax, 0ffffh
        stc
        ret
int2c_hd_dos_f04:
        call    int2c_hd_dos_f0e
        mov     ax, 0ffffh
L_121EF:
        jae     br_121F2
        ret
br_121F2:
        mov     si, word ptr [HD_DIRENT_PTR]
        mov     ax, word ptr [si+1ah]
        mov     word ptr [HD_CUR_CLUSTER], ax
        mov     word ptr [HD_BUF_BYTES_LEFT], 0
        mov     bx, word ptr [si+1ch]
        mov     dx, word ptr [si+1eh]
        mov     word ptr [HD_FILE_REMAIN_LO], bx
        mov     word ptr [HD_FILE_REMAIN_HI], dx
        push    ds
        pop     es
        sub     ax, ax
        clc
        ret


int2c_hd_dos_f05:
        mov     ax, word ptr [HD_FILE_REMAIN_LO]
        or      ax, word ptr [HD_FILE_REMAIN_HI]
L_1221D:
        je      L_12245
        sub     word ptr [HD_FILE_REMAIN_LO], 1
        sbb     word ptr [HD_FILE_REMAIN_HI], 0
L_12AC7:
        cmp     word ptr [HD_BUF_BYTES_LEFT], 0
        jne     L_12233
L_12230:
        call    L_1231B
L_12233:
        mov     si, word ptr [HD_BUF_PTR]
        mov     al, byte ptr [si]
        inc     word ptr [HD_BUF_PTR]
        dec     word ptr [HD_BUF_BYTES_LEFT]
        mov     ah, 0
        clc
        ret
L_12245:
        mov     ax, 0ffffh
        stc
        ret
int2c_hd_dos_f06:
        mov     ax, word ptr [HD_FILE_REMAIN_LO]
        or      ax, word ptr [HD_FILE_REMAIN_HI]
        jne     br_12254
        ret
br_12254:
        sub     word ptr [HD_FILE_REMAIN_LO], cx
        sbb     word ptr [HD_FILE_REMAIN_HI], 0
        jae     br_1226F
        add     cx, word ptr [HD_FILE_REMAIN_LO]
        mov     word ptr [HD_FILE_REMAIN_LO], 0
        mov     word ptr [HD_FILE_REMAIN_HI], 0
br_1226F:
        push    cx
        call    L_12276
        pop     ax
        clc
        ret
L_12276:
        cmp     cx, word ptr [HD_BUF_BYTES_LEFT]
        jbe     L_122A1
        sub     cx, word ptr [HD_BUF_BYTES_LEFT]
        push    cx
        mov     cx, word ptr [HD_BUF_BYTES_LEFT]
        mov     word ptr [HD_BUF_BYTES_LEFT], 0
        mov     si, word ptr [HD_BUF_PTR]
        rep movsb
        push    di
        push    es
L_12293:
        call    L_1231B
        pop     es
        pop     di
        pop     cx
        cmp     word ptr [HD_BUF_BYTES_LEFT], 0
        jne     L_12276
        ret
L_122A1:
        sub     word ptr [HD_BUF_BYTES_LEFT], cx
        mov     si, word ptr [HD_BUF_PTR]
        rep movsb
        mov     word ptr [HD_BUF_PTR], si
        ret
int2c_hd_dos_f13:
        mov     ax, word ptr [HD_FILE_REMAIN_LO]
        or      ax, word ptr [HD_FILE_REMAIN_HI]
        jne     br_122BA
        ret
br_122BA:
        sub     word ptr [HD_FILE_REMAIN_LO], cx
        sbb     word ptr [HD_FILE_REMAIN_HI], 0
        jae     br_122D5
        add     cx, word ptr [HD_FILE_REMAIN_LO]
        mov     word ptr [HD_FILE_REMAIN_LO], 0
        mov     word ptr [HD_FILE_REMAIN_HI], 0
br_122D5:
        push    cx
        call    L_122DC
        pop     ax
        clc
        ret
L_122DC:
        cmp     cx, word ptr [HD_BUF_BYTES_LEFT]
        jbe     br_12307
        sub     cx, word ptr [HD_BUF_BYTES_LEFT]
        push    cx
        mov     cx, word ptr [HD_BUF_BYTES_LEFT]
        mov     word ptr [HD_BUF_BYTES_LEFT], 0
        mov     si, word ptr [HD_BUF_PTR]
        rep lodsb
        push    di
        push    es
L_122F9:
        call    L_1231B
        pop     es
        pop     di
        pop     cx
        cmp     word ptr [HD_BUF_BYTES_LEFT], 0
        jne     L_122DC
        ret
br_12307:
        sub     word ptr [HD_BUF_BYTES_LEFT], cx
        mov     si, word ptr [HD_BUF_PTR]
        rep lodsb
        mov     word ptr [HD_BUF_PTR], si
        ret
int2c_hd_dos_f1f:
        sub     ax, ax
        sub     dx, dx
        ret
L_1231B:
        mov     ax, word ptr [HD_CUR_CLUSTER]
        cmp     ax, 0ffffh
L_12321:
        jne     L_12324
        ret
L_12324:
        call    L_12711
        mov     cx, word ptr [HD_CLUSTER_SECTORS]
        mov     di, BUF_DISK_SECTOR
        mov     word ptr [HD_BUF_PTR], di
L_12332:
        call    disk_io_int2d
        mov     ax, word ptr [HD_CLUSTER_BYTES]
        mov     word ptr [HD_BUF_BYTES_LEFT], ax
L_1233B:
        call    L_1233F
        ret
L_1233F:
        cmp     byte ptr [HD_FAT_BITS], 0ch
L_12344:
        jne     L_12349
        jmp     NEAR L_12920
L_12349:
        mov     ax, word ptr [HD_CUR_CLUSTER]
        cmp     ah, byte ptr [HD_FAT_CACHE_SECT]
        je      br_12355
L_12352:
        call    hd_fat_cache_load
br_12355:
        sub     ah, ah
        shl     ax, 1
        add     ax, 0f99bh
        mov     si, ax
        mov     ax, word ptr [si]
        cmp     ax, 0fff8h
        jb      br_12368
        mov     ax, 0ffffh
br_12368:
        mov     word ptr [HD_CUR_CLUSTER], ax
        ret
hd_fat_cache_load:
        push    ax
        mov     byte ptr [HD_FAT_CACHE_SECT], ah
        mov     al, ah
        sub     ah, ah
        add     ax, word ptr [HD_FAT_START]
        sub     dx, dx
        mov     cx, 2
        mov     di, HD_FAT_CACHE
L_12381:
        call    disk_io_int2d
        pop     ax
        ret
int2c_hd_dos_f07:
        push    es
        push    si
        push    cx
        push    dx
L_1238A:
        call    L_12158
        mov     di, si
        pop     dx
        pop     cx
        pop     si
        pop     es
L_12393:
        jb      br_123C9
        mov     word ptr [di+16h], cx
        mov     word ptr [di+18h], dx
        push    es
        push    si
        push    di
L_1239E:
        call    L_123D3
        pop     di
        pop     si
        pop     es
L_123A4:
        jb      br_123CE
        mov     word ptr [HD_CUR_CLUSTER], ax
        mov     word ptr [di+1ah], ax
L_123AC:
        call    fat_encode_name
        sub     ax, ax
        mov     word ptr [di+1ch], ax
        mov     word ptr [di+1eh], ax
        mov     byte ptr [di+0bh], al
        mov     word ptr [HD_WBUF_OFS], 0
        mov     byte ptr [HD_FILE_MODE], 2
        sub     ax, ax
        clc
        ret
br_123C9:
        mov     ax, 2
        stc
        ret
br_123CE:
        mov     ax, 3
        stc
        ret
L_123D3:
        cmp     byte ptr [HD_FAT_BITS], 10h
L_123D8:
        je      L_123DD
        jmp     NEAR L_1293D
L_123DD:
        sub     ax, ax
L_123DF:
        call    hd_fat_cache_load
        mov     ax, 2
        mov     si, HD_FAT_CACHE
loop_123E8:
        mov     bx, ax
        sub     bh, bh
        shl     bx, 1
        cmp     word ptr [bx+si], 0
        jne     L_123F8
        mov     word ptr [bx+si], 0ffffh
        ret
L_123F8:
        inc     ax
        cmp     ax, word ptr [HD_CLUSTERS]
        je      L_1240A
        cmp     al, 0
        jne     loop_123E8
        push    si
L_12404:
        call    hd_fat_cache_load
        pop     si
        jmp     SHORT loop_123E8
L_1240A:
        stc
        ret
int2c_hd_dos_f0d:
        cmp     byte ptr [HD_FAT_BITS], 10h
L_12411:
        jne     br_1246F
        sub     dx, dx
        sub     cx, cx
        mov     di, 1
        mov     bp, word ptr [HD_CLUSTERS]
        mov     ax, word ptr [HD_FAT_START]
        mov     word ptr [W_F999], ax
loop_12424:
        mov     bx, 4000h
        sub     bp, bx
        jae     L_1242F
        add     bx, bp
        sub     bp, bp
L_1242F:
        pusha
        mov     ax, word ptr [W_F999]
        sub     dx, dx
        mov     cx, 40h
        mov     di, 0
L_1243B:
        call    disk_io_int2d
        add     word ptr [W_F999], 40h
        popa
        mov     si, 0
L_12447:
        lodsw
        sub     ax, di
        adc     dx, cx
        dec     bx
        jne     L_12447
        cmp     bp, cx
        jne     loop_12424
L_12453:
        mov     ax, word ptr [HD_CLUSTER_SECTORS]
        mul     dx
        shr     dx, 1
        rcr     ax, 1
L_1245C:
        mov     bx, 64h
        cmp     dx, bx
L_12461:
        jae     br_1246B
        div     bx
        mov     di, ax
        mov     si, 0
        ret
br_1246B:
        mov     ax, 0ea60h
        ret
br_1246F:
        mov     si, BUF_DISK_FAT
        mov     cx, 2
        mov     dx, 0
L_12478:
        inc     cx
        cmp     cx, word ptr [HD_CLUSTERS]
L_1247D:
        je      L_124A1
        mov     bx, cx
        shr     bx, 1
        pushf
L_12484:
        add     bx, cx
        mov     ax, word ptr [bx+si]
        popf
        jb      br_12496
        and     ax, 0fffh
        cmp     ax, 0
        jne     L_12478
        inc     dx
        jmp     SHORT L_12478
br_12496:
        and     ax, 0fff0h
        cmp     ax, 0
        jne     L_12478
        inc     dx
        jmp     SHORT L_12478
L_124A1:
        mov     ax, word ptr [HD_CLUSTER_SECTORS]
        mul     dx
        shr     ax, 1
        sub     dx, dx
        jmp     SHORT L_1245C
int2c_hd_dos_f08:
        mov     di, word ptr [HD_DIRENT_PTR]
        add     word ptr [di+1ch], 1
        adc     word ptr [di+1eh], 0
        mov     di, word ptr [HD_WBUF_OFS]
        mov     byte ptr [di+BUF_DISK_SECTOR], al
        inc     di
        cmp     di, word ptr [HD_CLUSTER_BYTES]
        jne     br_124D1
L_124C7:
        call    hd_cluster_write
L_124CA:
        call    L_1262A
        jb      L_124D8
        sub     di, di
br_124D1:
        mov     word ptr [HD_WBUF_OFS], di
        sub     ax, ax
        ret
L_124D8:
        INT_2A "        Disk full  !!     "
int2c_hd_dos_f09:
        mov     di, word ptr [HD_DIRENT_PTR]
        add     word ptr [di+1ch], cx
        adc     word ptr [di+1eh], 0
L_12500:
        mov     di, BUF_DISK_SECTOR
        mov     bx, word ptr [HD_WBUF_OFS]
        add     di, bx
        mov     ax, word ptr [HD_CLUSTER_BYTES]
        sub     ax, bx
        cmp     cx, ax
        jb      br_1253C
        sub     cx, ax
        mov     word ptr [HD_WBUF_OFS], 0
        push    cx
        mov     cx, ax
        mov     ax, ds
        mov     bx, es
L_12521:
        mov     es, ax
        mov     ds, bx
        rep movsb
        mov     es, bx
L_12529:
        mov     ds, ax
        push    si
        push    es
L_1252D:
        call    hd_cluster_write
L_12530:
        call    L_1262A
        pop     es
        pop     si
        pop     cx
        if      FW_VERSION = 172
L_12536:
        endif
        jae     L_1253A
        jmp     SHORT L_124D8
L_1253A:
        jmp     SHORT L_12500
br_1253C:
        add     word ptr [HD_WBUF_OFS], cx
        mov     ax, ds
        mov     bx, es
L_12544:
        mov     es, ax
        mov     ds, bx
        rep movsb
        mov     es, bx
L_1254C:
        mov     ds, ax
        sub     ax, ax
        ret
int2c_hd_dos_f0a:
        sub     ax, ax
        xchg    byte ptr [HD_FILE_MODE], al
        cmp     al, 2
        jne     br_1258B
        mov     ax, ds
        mov     es, ax
        mov     cx, word ptr [HD_CLUSTER_BYTES]
        mov     di, word ptr [HD_WBUF_OFS]
        sub     cx, di
L_12569:
        add     di, BUF_DISK_SECTOR
        mov     al, 0
        rep stosb
L_12571:
        call    hd_cluster_write
        mov     si, word ptr [HD_DIRENT_PTR]
        mov     byte ptr [si+0bh], 20h
        cmp     byte ptr [HD_FAT_BITS], 10h
L_12581:
        je      L_12585
        jmp     SHORT hd_fat_flush_all
L_12585:
        call    hd_fat_cache_flush
L_12588:
        call    hd_root_dir_sector_write
br_1258B:
        clc
        ret
hd_fat_flush_all:
        mov     ax, word ptr [HD_FAT_START]
        sub     dx, dx
        mov     cx, word ptr [HD_FAT_SECTORS]
        mov     di, BUF_DISK_FAT
L_12599:
        call    disk_seek
        mov     ax, word ptr [HD_FAT2_START]
L_1259F:
        call    disk_seek
L_125A2:
        call    hd_root_dir_sector_write
        ret
hd_root_dir_sector_write:
        mov     ax, word ptr [HD_DIR_BUF_SECT]
        add     ax, word ptr [HD_ROOT_START]
        sub     dx, dx
        mov     di, HD_DIR_BUF
        mov     cx, 1
L_125B5:
        call    disk_seek
        ret
hd_fat_cache_flush:
        mov     al, byte ptr [HD_FAT_CACHE_SECT]
        mov     ah, 0
        push    ax
        add     ax, word ptr [HD_FAT_START]
        sub     dx, dx
        mov     cx, 1
        mov     di, HD_FAT_CACHE
L_125CB:
        call    disk_seek
        pop     ax
        add     ax, word ptr [HD_FAT2_START]
        sub     dx, dx
        mov     cx, 1
        mov     di, HD_FAT_CACHE
L_125DB:
        call    disk_seek
        ret
int2c_hd_dos_f15:
        cmp     byte ptr [HD_FAT_BITS], 10h
L_125E4:
        je      L_12619
        mov     ax, ds
        mov     es, ax
        mov     di, BUF_DISK_FAT
        sub     ax, ax
        mov     cx, word ptr [HD_FAT_SECTORS]
        mov     ch, cl
        shl     ch, 1
        sub     cl, cl
        rep stosb
L_125FB:
        call    hd_fat_flush_all
        mov     ax, word ptr [HD_ROOT_START]
        sub     dx, dx
        mov     cx, word ptr [HD_ROOT_ENTRIES]
        shr     cx, 4
L_1260A:
        push    cx
L_1260B:
        mov     cx, 1
        mov     di, BUF_DISK_FAT
L_12611:
        call    disk_seek
        pop     cx
        inc     ax
        loop    L_1260A
        ret
L_12619:
        sub     ax, ax
        sub     dx, dx
        mov     cx, 1
        mov     di, BUF_DISK_SECTOR
L_12623:
        call    disk_io_int2d
L_12626:
        call    hd_fat16_format_write
        ret
L_1262A:
        cmp     byte ptr [HD_FAT_BITS], 10h
L_1262F:
        je      L_12634
        jmp     NEAR L_12977
L_12634:
        call    fn_12665
L_12637:
        jae     L_1263A
        ret
L_1263A:
        mov     bx, ax
        xchg    word ptr [HD_CUR_CLUSTER], bx
        mov     cx, bx
        sub     bh, bh
        shl     bx, 1
        mov     word ptr [bx+HD_FAT_CACHE], ax
        cmp     ah, ch
        je      br_12658
        push    ax
L_1264F:
        call    hd_fat_cache_flush
        pop     ax
        push    ax
L_12654:
        call    hd_fat_cache_load
        pop     ax
br_12658:
        sub     ah, ah
        shl     ax, 1
        mov     bx, ax
        mov     word ptr [bx+HD_FAT_CACHE], 0ffffh
        ret
fn_12665:
        mov     ax, word ptr [HD_CUR_CLUSTER]
        mov     si, HD_FAT_CACHE
loop_1266B:
        mov     bx, ax
        sub     bh, bh
        shl     bx, 1
        cmp     word ptr [bx+si], 0
        jne     br_12677
        ret
br_12677:
        inc     ax
        cmp     ax, word ptr [HD_CLUSTERS]
        stc
        jne     L_12680
        ret
L_12680:
        cmp     al, 0
        jne     loop_1266B
        push    ax
        mov     al, ah
        sub     ah, ah
        add     ax, word ptr [HD_FAT_START]
        sub     dx, dx
        mov     cx, 1
        mov     di, 0fb9bh
        push    di
L_12696:
        call    disk_io_int2d
        pop     si
L_12F38:
        pop     ax
        jmp     SHORT loop_1266B
int2c_hd_dos_f0b:
        mov     di, word ptr [HD_DIRENT_PTR]
L_126A1:
        call    fat_encode_name
        jmp     NEAR hd_root_dir_sector_write
int2c_hd_dos_f14:
        call    int2c_hd_dos_f0e
L_126AA:
        jae     L_126AD
        ret
L_126AD:
        mov     si, word ptr [HD_DIRENT_PTR]
        mov     byte ptr [si], 0e5h
        mov     ax, word ptr [si+1ah]
        cmp     byte ptr [HD_FAT_BITS], 10h
L_126BC:
        je      loop_126C0
        jmp     SHORT L_126E7
loop_126C0:
        call    hd_fat_cache_load
L_126C3:
        mov     bl, al
        sub     bh, bh
        shl     bx, 1
        sub     cx, cx
        xchg    word ptr [bx+HD_FAT_CACHE], cx
        cmp     cx, -1
L_126D2:
        je      br_126E1
        cmp     ah, ch
        mov     ax, cx
        je      L_126C3
        push    ax
L_126DB:
        call    hd_fat_cache_flush
        pop     ax
        jmp     SHORT loop_126C0
br_126E1:
        call    hd_fat_cache_flush
        jmp     NEAR hd_root_dir_sector_write
L_126E7:
        mov     si, BUF_DISK_FAT
L_126EA:
        mov     bx, ax
        shr     bx, 1
        pushf
L_126EF:
        add     bx, ax
        mov     cx, word ptr [bx+si]
        popf
L_126F4:
        jb      br_12709
        and     word ptr [bx+si], 0f000h
L_126FA:
        and     cx, 0fffh
        mov     ax, cx
        cmp     ax, 0fffh
        jne     L_126EA
L_12705:
        call    hd_fat_flush_all
        ret
br_12709:
        and     word ptr [bx+si], 0fh
        shr     cx, 4
        jmp     SHORT L_126FA
L_12711:
        sub     ax, 2
        mov     bx, word ptr [HD_CLUSTER_SECTORS]
        mul     bx
        add     ax, word ptr [HD_DATA_START]
        adc     dx, 0
        ret
hd_cluster_write:
        mov     ax, word ptr [HD_CUR_CLUSTER]
        call    L_12711
        mov     cx, word ptr [HD_CLUSTER_SECTORS]
        mov     di, BUF_DISK_SECTOR
disk_read:
        call    disk_seek
        ret

disk_io_int2d:
        pusha
        add     ax, word ptr [HD_PART_LBA]
        adc     dx, word ptr [HD_PART_LBA_HI]
        mov     bx, dx
        mov     dx, ax
        mov     ax, ds
        mov     es, ax
        if      FW_VERSION = 150
        jae     L_12FE7
        jmp     error_scsi_write_error_11c27
L_12FE7:
        endif
        mov     ah, 1
        int     2dh
        if      FW_VERSION = 172
L_12748:
        jae     L_1274D
        jmp     error_scsi_write_error_11c27
        endif
L_1274D:
        popa
        ret

fn_1274F:
        pusha
        shl     cx, 4
        sub     dx, dx
        add     ax, word ptr [HD_PART_LBA]
        adc     dx, word ptr [HD_PART_LBA_HI]
        push    cx
        mov     cx, 4
disk_read_1:
        shl     ax, 1
        rcl     dx, 1
        loop    disk_read_1
        pop     cx
        mov     bx, dx
        mov     dx, ax
        mov     ax, ds
        mov     es, ax
        mov     ah, 1
        int     2dh

L_12774:
        jae     disk_write
        jmp     error_scsi_write_error_11c27
disk_write:
        popa
        ret

disk_seek:
        pusha
        add     ax, word ptr [HD_PART_LBA]
        adc     dx, word ptr [HD_PART_LBA_HI]
        mov     bx, dx
        mov     dx, ax
        mov     ax, ds
        mov     es, ax
        mov     ah, 2
        int     2dh
L_12790:
        jae     L_12795
        jmp     print_floppy_disk_format_11be6
L_12795:
        popa
        ret
int2c_hd_dos_f0c:
        push    ax
        mov     ah, 0
        mov     di, ax
        sub     si, si
        mov     ax, word ptr [HD_CAPACITY_LO]
        mov     dx, word ptr [HD_CAPACITY_HI]
        nop
        push    cs
calls_state_check_104_127a7:
        call    state_check_104FB
        mov     word ptr [HD_PART_SIZE_LO], ax
        mov     word ptr [HD_PART_SIZE_HI], dx
        pop     cx
        sub     ax, ax
        mov     word ptr [HD_PART_LBA], ax
        mov     word ptr [HD_PART_LBA_HI], ax
L_127BA:
        push    cx
        push    cx
        mov     bx, ds
        mov     es, bx
L_127C0:
        mov     di, BUF_DISK_SECTOR
        if      FW_VERSION = 172
        mov     cx, 2c00h
        else
        mov     cx, 2000h
        endif
        sub     ax, ax
        rep stosw
        sub     ax, ax
        sub     dx, dx
        pop     cx
        mov     si, P_A040
L_127D2:
        mov     word ptr [si], ax
        mov     word ptr [si+2], dx
        add     ax, word ptr [HD_PART_SIZE_LO]
        adc     dx, word ptr [HD_PART_SIZE_HI]
        add     si, 4
        dec     cl
        jne     L_127D2
        pop     cx
        pusha
L_127E8:
        call    hd_boot_sector_build
L_127EB:
        call    hd_fat16_format_write
        popa
        mov     ax, word ptr [HD_PART_SIZE_LO]
        mov     dx, word ptr [HD_PART_SIZE_HI]
        add     word ptr [HD_PART_LBA], ax
        adc     word ptr [HD_PART_LBA_HI], dx
        dec     cl
        jne     L_127BA
        ret
hd_boot_sector_build:
        mov     si, L_128D8
        mov     di, BUF_DISK_SECTOR
        push    ds
        mov     bx, cs
L_1280C:
        mov     ds, bx
        mov     cx, 34h
        rep movsb
        pop     ds
        mov     di, BUF_DISK_SECTOR
        mov     byte ptr [di+BOOT_SIG_55], 55h
        mov     byte ptr [di+BOOT_SIG_AA], 0aah
        mov     ax, word ptr [HD_PART_SIZE_LO]
        mov     dx, word ptr [HD_PART_SIZE_HI]
        push    ax
        push    dx
        mov     bx, 0
        mov     cx, 20h
        sub     ax, bx
        sbb     dx, cx
        pop     dx
        pop     ax
        jb      L_1283E
        mov     ax, 0ffffh
        mov     dx, 1fh
L_1283E:
        mov     word ptr [di+20h], ax
        mov     word ptr [di+TBL_0022], dx
        mov     word ptr [di+MBR_PART_SECTORS], ax
        mov     word ptr [di+MBR_PART_SECTORS_HI], dx
        mov     byte ptr [di+MBR_PART_TYPE], 4
L_12851:
        mov     cl, 10h
L_12853:
        test    dx, 0fff0h
L_12857:
        je      L_12861
        shr     dx, 1
        rcr     ax, 1
        shl     cl, 1
        jmp     SHORT L_12853
L_12861:
        mov     byte ptr [di+0dh], cl
        mov     ax, 0
        mov     dx, 0
        mov     cx, 1
        mov     di, BUF_DISK_SECTOR
L_12870:
        call    disk_seek
        ret
hd_fat16_format_write:
        mov     ax, ds
        mov     es, ax
        if      FW_VERSION = 172
        mov     cx, 2c00h
        else
        mov     cx, 2000h
        endif
        mov     di, BUF_DISK_SECTOR
        push    di
        sub     ax, ax
        rep stosw
        pop     di
        mov     word ptr [di], 0fff8h
        mov     word ptr [di+2], 0ffffh
        mov     ax, 1
        mov     dx, 0
        mov     cx, 20h
L_12896:
        call    disk_seek
        mov     word ptr [di], 0
        mov     word ptr [di+2], 0
        mov     bl, 7
L_128A4:
        add     ax, cx
L_128A6:
        call    disk_seek
        dec     bl
L_128AB:
        jne     L_128A4
        mov     word ptr [di], 0fff8h
        mov     word ptr [di+2], 0ffffh
        add     ax, cx
L_128B8:
        call    disk_seek
        mov     word ptr [di], 0
        mov     word ptr [di+2], 0
        mov     bl, 7
L_128C6:
        add     ax, cx
L_128C8:
        call    disk_seek
        dec     bl
L_128CD:
        jne     L_128C6
        add     ax, cx
        mov     cx, 20h
L_128D4:
        call    disk_seek
        ret
L_128D8:
        jmp     SHORT L_128D8
        db      090h, "MPC2000 ", 000h, 002h, 020h, 001h, 000h, 002h, 000h
        db      02h, 00h, 00h, 0f8h, 00h, 01h, 10h, 00h, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      000h, 000h, 080h, 000h, 029h, 000h, 000h, 000h, 000h, "MPC-200"
        db      30h, 00h
int2c_hd_dos_f11:
        db      0b4h, 05h, 0cdh, 2dh, 73h, 0ah, 3ch, 00h, 74h, 06h, 3ch, 04h, 74h, 02h
        stc
        ret
L_131BA:
        clc
        ret
int2c_hd_dos_f1a:
        db      0f9h, 0c3h
L_12920:
        mov     ax, word ptr [HD_CUR_CLUSTER]
        mov     bx, ax
        shr     bx, 1
        pushf
L_12928:
        add     bx, ax
        add     bx, BUF_DISK_FAT
        mov     ax, word ptr [bx]
        popf
        jae     L_12936
        shr     ax, 4
L_12936:
        and     ah, 0fh
        mov     word ptr [HD_CUR_CLUSTER], ax
        ret
L_1293D:
        mov     cx, 2
hd_fat12_alloc_cluster:
        mov     si, BUF_DISK_FAT
L_12943:
        mov     bx, cx
        shr     bx, 1
        pushf
L_12948:
        add     bx, cx
        mov     ax, word ptr [bx+si]
        popf
        jb      br_12968
        and     ax, 0fffh
        cmp     ax, 0
        jne     loop_1295F
        or      word ptr [bx+si], 0fffh
        mov     ax, cx
        clc
        ret
loop_1295F:
        inc     cx
        cmp     cx, word ptr [HD_CLUSTERS]
        jne     L_12943
        stc
        ret
br_12968:
        and     ax, 0fff0h
        cmp     ax, 0
        jne     loop_1295F
        or      word ptr [bx+si], 0fff0h
        mov     ax, cx
        clc
        ret
L_12977:
        mov     cx, word ptr [HD_CUR_CLUSTER]
        call    hd_fat12_alloc_cluster
L_1297E:
        jae     L_12981
        ret
L_12981:
        mov     cx, ax
        xchg    word ptr [HD_CUR_CLUSTER], ax
        mov     bx, ax
        shr     bx, 1
        pushf
L_1298C:
        add     bx, ax
        add     bx, BUF_DISK_FAT
        mov     ax, word ptr [bx]
        popf
        jae     L_129A2
        shl     cx, 4
        and     ax, 0fh
        or      ax, cx
        mov     word ptr [bx], ax
        ret
L_129A2:
        and     ax, 0f000h
        or      ax, cx
        mov     word ptr [bx], ax
        ret
int2c_hd_roland_f02:
        mov     word ptr [HD_DIR_INDEX], 0
L_129B0:
        call    L_12AA4
        mov     di, 0
        mov     word ptr [FD_ROOT_START], di
        sub     di, 20h
        mov     word ptr [FD_DIRENT_PTR], di
        mov     word ptr [FD_ROOT_END], 3400h
        mov     word ptr [HD_DIR_INDEX], 0ffffh
        mov     word ptr [HD_DIRENT_PTR], 4fd0h
int2c_hd_roland_f03:
        call    state_update_10ABB
        mov     si, word ptr [FD_DIRENT_PTR]
        mov     di, word ptr [HD_DIRENT_PTR]
L_129DE:
        cmp     word ptr [HD_DIR_INDEX], 1fffh
L_129E4:
        je      L_12A5A
        add     si, 20h
        add     di, 30h
        inc     word ptr [HD_DIR_INDEX]
        cmp     si, word ptr [FD_ROOT_END]
        jne     L_129F9
L_129F6:
        call    L_12AA4
L_129F9:
        cmp     byte ptr [si], 0
L_129FC:
        je      L_12A5A
        cmp     byte ptr [si], 0feh
        je      L_129DE
fn_12A03:
        mov     word ptr [FD_DIRENT_PTR], si
        mov     word ptr [HD_DIRENT_PTR], di
        mov     si, di
        mov     ax, word ptr [HD_DIR_INDEX]
        mov     word ptr [HD_DIR_BUF_SECT], ax
        mov     di, 0f8cch
        push    si
        push    di
        mov     cx, 10h
        rep movsb
        pop     di
        pop     si
        mov     byte ptr [di+3], 5fh
        cmp     byte ptr [di+0eh], 7fh
        jne     br_12A2D
        mov     byte ptr [di+0eh], 2dh
br_12A2D:
        mov     byte ptr [di+10h], 2eh
        mov     byte ptr [di+11h], 52h
        mov     byte ptr [di+12h], 4ch
        mov     byte ptr [di+TBL_0013], 44h
        mov     si, word ptr [HD_DIRENT_PTR]
        mov     bx, word ptr [si+19h]
        mov     dl, byte ptr [si+1bh]
        add     bx, 1
        adc     dx, 1
        and     dx, 0fh
        shl     bx, 1
        rcl     dx, 1
        mov     si, di
        sub     ax, ax
        clc
        ret
L_12A5A:
        mov     ax, word ptr [HD_DIR_BUF_SECT]
        mov     word ptr [HD_DIR_INDEX], ax
L_12A60:
        call    L_12AA4
        mov     si, word ptr [FD_DIRENT_PTR]
        call    fn_12A03
        sub     bx, bx
        sub     dx, dx
        stc
        ret
int2c_hd_roland_f16:
        call    state_update_10ABB
        mov     si, word ptr [FD_DIRENT_PTR]
        mov     di, word ptr [HD_DIRENT_PTR]
L_12A7B:
        cmp     si, word ptr [FD_ROOT_START]
L_12A7F:
        db      74h, 12h
        dec     word ptr [HD_DIR_INDEX]
        sub     si, 20h
        sub     di, 30h
        cmp     byte ptr [si], 0feh
        je      L_12A7B
        jmp     fn_12A03
        if      FW_VERSION = 172

        db      83h, 3eh, 9fh, 0fdh, 00h, 74h, 0c0h, 0ffh, 0eh, 9fh, 0fdh
        endif
L_12A9E:
        if      FW_VERSION = 150
        db      83h, 3eh, 9fh, 0fdh, 00h, 74h, 0c0h, 0ffh, 0eh, 9fh, 0fdh
        endif
        call    L_12AA4
        jmp     fn_12A03
L_12AA4:
        mov     ax, word ptr [HD_DIR_INDEX]
        sub     dx, dx
        mov     bx, 1a0h
        div     bx
        push    dx
        mov     bx, 1ah
        mul     bx
        add     ax, 66ch
        sub     dx, dx
        mov     di, 0
        mov     cx, 1ah
L_12ABF:
        call    disk_io_int2d
        pop     dx
        mov     ax, 20h
        mul     dx
        add     ax, 0
        mov     word ptr [FD_DIRENT_PTR], ax
        push    ax
        mov     ax, word ptr [HD_DIR_INDEX]
        sub     dx, dx
        mov     bx, 1a0h
        div     bx
        push    dx
        mov     bx, 27h
        mul     bx
        add     ax, 12ach
        sub     dx, dx
        mov     di, 5000h
        mov     cx, 27h
L_12AEA:
        call    disk_io_int2d
        pop     dx
        mov     ax, 30h
        mul     dx
        add     ax, 5000h
        mov     word ptr [HD_DIRENT_PTR], ax
        mov     di, ax
        pop     si
        ret
int2c_hd_roland_f04:
        mov     si, word ptr [FD_DIRENT_PTR]
        mov     ax, word ptr [si+1ch]
        mov     word ptr [FD_CUR_SECTOR], ax
        mov     si, word ptr [HD_DIRENT_PTR]
        mov     ax, ds
        mov     es, ax
        mov     bx, word ptr [si+19h]
        mov     dl, byte ptr [si+1bh]
        add     bx, 1
        adc     dl, 0
        and     dx, 0fh
        shl     bx, 1
        rcl     dx, 1
        mov     word ptr [FD_FILE_REMAIN_LO], bx
        mov     word ptr [FD_FILE_REMAIN_HI], dx
        mov     word ptr [FD_BUF_BYTES_LEFT], 0
        mov     ax, 0
        clc
        ret
int2c_hd_roland_f05:
        mov     ax, word ptr [FD_FILE_REMAIN_LO]
        or      ax, word ptr [FD_FILE_REMAIN_HI]
L_12B3C:
        je      L_12B64
        sub     word ptr [FD_FILE_REMAIN_LO], 1
        sbb     word ptr [FD_FILE_REMAIN_HI], 0
        cmp     word ptr [FD_BUF_BYTES_LEFT], 0
        jne     br_12B52
L_12B4F:
        call    fn_12BBD
br_12B52:
        mov     si, word ptr [FD_BUF_PTR]
        mov     al, byte ptr [si]
        inc     word ptr [FD_BUF_PTR]
        dec     word ptr [FD_BUF_BYTES_LEFT]
        mov     ah, 0
        clc
        ret
L_12B64:
        mov     ax, 0ffffh
        stc
        ret
int2c_hd_roland_f06:
        mov     ax, word ptr [FD_FILE_REMAIN_LO]
        or      ax, word ptr [FD_FILE_REMAIN_HI]
        jne     br_12B73
        ret
br_12B73:
        sub     word ptr [FD_FILE_REMAIN_LO], cx
        sbb     word ptr [FD_FILE_REMAIN_HI], 0
        jae     br_12B82
        add     cx, word ptr [FD_FILE_REMAIN_LO]
br_12B82:
        push    cx
        call    L_12B89
        pop     ax
        clc
        ret
L_12B89:
        cmp     cx, word ptr [FD_BUF_BYTES_LEFT]
        jbe     br_12BAE
        sub     cx, word ptr [FD_BUF_BYTES_LEFT]
        push    cx
        mov     cx, word ptr [FD_BUF_BYTES_LEFT]
L_13436:

        mov     si, word ptr [FD_BUF_PTR]
        rep movsb
        push    di
        push    es
L_12BA0:
        call    fn_12BBD
        pop     es
        pop     di
        pop     cx
        cmp     word ptr [FD_BUF_BYTES_LEFT], 0
        jne     L_12B89
        ret
br_12BAE:
        sub     word ptr [FD_BUF_BYTES_LEFT], cx
        mov     si, word ptr [FD_BUF_PTR]
        rep movsb
        mov     word ptr [FD_BUF_PTR], si
        ret
fn_12BBD:
        mov     ax, word ptr [FD_CUR_SECTOR]
        cmp     ax, 0fff8h
        jne     L_12BC6
        ret
L_12BC6:
        sub     ax, 2
        mov     dx, 12h
        mul     dx
        add     ax, 15ach
        adc     dx, 0
        mov     cx, 12h
        mov     di, BUF_DISK_SECTOR
        mov     word ptr [FD_BUF_PTR], di
L_12BDE:
        call    disk_io_int2d
        mov     word ptr [FD_BUF_BYTES_LEFT], 2400h
        mov     ax, word ptr [FD_CUR_SECTOR]
        push    ax
        mov     al, ah
        mov     ah, 0
        sub     dx, dx
        add     ax, 404h
        mov     di, BUF_DISK_FAT
        push    di
        mov     cx, 1
L_12BFB:
        call    disk_io_int2d
        pop     di
        pop     ax
        mov     ah, 0
        shl     ax, 1
        add     di, ax
        mov     ax, word ptr [di]
        mov     word ptr [FD_CUR_SECTOR], ax
        ret
int2c_hd_emu_f02:
        mov     word ptr [FD_DIRENT_PTR], 0ffffh
int2c_hd_emu_f03:
        call    state_update_10ABB
        mov     di, word ptr [FD_DIRENT_PTR]
loop_12C19:
        cmp     di, word ptr [W_FFB1]
        jne     L_12C22
        jmp     NEAR loop_12CD4
L_12C22:
        inc     di
L_12C23:
        mov     bx, di
        shl     bx, 2
        mov     si, word ptr [W_FFB3]
        mov     ax, word ptr [bx+si]
        mov     dx, word ptr [bx+si+2]
        sub     dx, 40h
        jb      loop_12C19
        push    di
        add     ax, word ptr [HD_HDR_BUF+5030h]
        adc     dx, word ptr [HD_HDR_BUF+5032h]
        add     ax, 4ch
        adc     dx, 0
        mov     bx, ax
        and     bx, 1ffh
        mov     word ptr [W_FFC3], bx
        push    bx
        mov     al, ah
        mov     ah, dl
        mov     dl, dh
        sub     dh, dh
        shr     dx, 1
        rcr     ax, 1
        add     ax, word ptr [W_FFBB]
        adc     dx, word ptr [W_FFBD]
        mov     word ptr [HD_EMU_LBA_LO], ax
        mov     word ptr [HD_EMU_LBA_HI], dx
        mov     di, BUF_DISK_SECTOR
        mov     cx, 3
L_12C71:
        call    disk_io_int2d
        pop     si
        add     si, BUF_DISK_SECTOR
        mov     ax, ds
        mov     es, ax
        push    si
        push    di
        mov     cx, 10h
        rep movsb
        pop     di
        pop     si
        mov     byte ptr [di+10h], 2eh
        mov     byte ptr [di+11h], 45h
        mov     byte ptr [di+12h], 4dh
        mov     byte ptr [di+TBL_0013], 55h
        sub     bx, bx
        sub     dx, dx
        test    byte ptr [si+3ah], 20h
        je      br_12CAC
        mov     bx, word ptr [si+1ch]
        mov     dx, word ptr [si+1eh]
        sub     bx, word ptr [si+TBL_0014]
        sbb     dx, word ptr [si+16h]
br_12CAC:
        test    byte ptr [si+3ah], 40h
        je      L_12CBE
        add     bx, word ptr [si+20h]
        adc     dx, word ptr [si+TBL_0022]
        sub     bx, word ptr [si+18h]
        sbb     dx, word ptr [si+1ah]
L_12CBE:
        mov     word ptr [FD_FILE_REMAIN_LO], bx
        mov     word ptr [FD_FILE_REMAIN_HI], dx
        pop     ax
        or      bx, dx
L_12CC9:
        je      loop_12CD4
        mov     word ptr [FD_DIRENT_PTR], ax
        mov     si, di
        sub     ax, ax
        clc
        ret
loop_12CD4:
        cmp     word ptr [FD_DIRENT_PTR], -1
        je      loop_12CE2
        mov     di, word ptr [FD_DIRENT_PTR]
        call    L_12C23
loop_12CE2:
        sub     bx, bx
        sub     dx, dx
        mov     word ptr [FD_FILE_REMAIN_LO], bx
        mov     word ptr [FD_FILE_REMAIN_HI], dx
        stc
        ret
int2c_hd_emu_f16:
        mov     di, word ptr [FD_DIRENT_PTR]
        cmp     di, -1
        je      loop_12CE2
        mov     si, word ptr [W_FFB3]
L_12CFD:
        or      di, di
L_12CFF:
        je      loop_12CD4
        dec     di
        mov     bx, di
        shl     bx, 2
        mov     ax, word ptr [bx+si]
        mov     dx, word ptr [bx+si+2]
        sub     dx, 40h
        jb      L_12CFD
        jmp     NEAR L_12C23
int2c_hd_emu_f04:
        mov     byte ptr [FD_FILE_MODE], 1
        mov     ax, 600h
        mov     si, word ptr [W_FFC3]
        sub     ax, word ptr [W_FFC3]
        mov     word ptr [FD_BUF_BYTES_LEFT], ax
        add     si, BUF_DISK_SECTOR
        mov     word ptr [FD_BUF_PTR], si
        add     word ptr [HD_EMU_LBA_LO], 3
        adc     word ptr [HD_EMU_LBA_HI], 0
        push    ds
        pop     es
        mov     di, 9000h
        push    di
        mov     cx, 100h
        rep movsb
        pop     si
        sub     ax, ax
        sub     di, di
        mov     bx, word ptr [FD_FILE_REMAIN_LO]
        mov     dx, word ptr [FD_FILE_REMAIN_HI]
        clc
        ret
int2c_hd_emu_f05:
        cmp     word ptr [FD_BUF_BYTES_LEFT], 0
        jne     L_12D5D
L_12D5A:
        call    L_12DAF
L_12D5D:
        mov     si, word ptr [FD_BUF_PTR]
        mov     al, byte ptr [si]
        inc     word ptr [FD_BUF_PTR]
        dec     word ptr [FD_BUF_BYTES_LEFT]
        mov     ah, 0
        clc
        ret
L_12D6F:
        mov     ax, 0ffffh
        stc
        ret
int2c_hd_emu_f06:
        push    cx
        call    L_12D7B
        pop     ax
        clc
        ret
L_12D7B:
        cmp     cx, word ptr [FD_BUF_BYTES_LEFT]
        jbe     br_12DA0
        sub     cx, word ptr [FD_BUF_BYTES_LEFT]
        push    cx
        mov     cx, word ptr [FD_BUF_BYTES_LEFT]
        mov     si, word ptr [FD_BUF_PTR]
        rep movsb
        push    di
        push    es
L_12D92:
        call    L_12DAF
        pop     es
        pop     di
        pop     cx
        cmp     word ptr [FD_BUF_BYTES_LEFT], 0
        jne     L_12D7B
        ret
br_12DA0:
        sub     word ptr [FD_BUF_BYTES_LEFT], cx
        mov     si, word ptr [FD_BUF_PTR]
        rep movsb
        mov     word ptr [FD_BUF_PTR], si
        ret
L_12DAF:
        mov     ax, word ptr [HD_EMU_LBA_LO]
        mov     dx, word ptr [HD_EMU_LBA_HI]
        mov     cx, 20h
        mov     di, BUF_DISK_SECTOR
        mov     word ptr [FD_BUF_PTR], di
L_12DC0:
        call    disk_io_int2d
        add     word ptr [HD_EMU_LBA_LO], 20h
        adc     word ptr [HD_EMU_LBA_HI], 0
        mov     word ptr [FD_BUF_BYTES_LEFT], 4000h
        ret
int2c_hd_emu_f0a:
        db      0ffh, 36h, 0a0h, 0f8h, 0e8h, 37h, 0feh
L_12DDB:
        call    int2c_hd_emu_f16
        pop     ax
        cmp     ax, word ptr [FD_DIRENT_PTR]
        je      br_12DE8
        call    int2c_hd_emu_f03
br_12DE8:
        sub     ax, ax
        ret
L_12DEB:
        sub     ax, ax
        sub     dx, dx
        mov     cx, 2
        mov     di, BUF_DISK_FAT
L_12DF5:
        call    disk_io_int2d
        mov     al, byte ptr [P_E028]
        sub     ah, ah
        shl     ax, 1
        add     ax, L_12E40
        mov     bx, ax
        mov     ax, word ptr cs:[bx]
        mov     word ptr [W_FFB7], ax
        mov     ax, word ptr [P_E010]
        sub     dx, dx
        mov     cx, 8
        mov     di, 0
L_12E15:
        call    disk_io_int2d
        mov     bx, 0
        mov     si, 0
L_12E1E:
        mov     ax, word ptr [si]
        add     si, 20h
        cmp     ax, 0
L_12E26:
        je      br_12E37
        cmp     byte ptr [si+11h], 0
        je      L_12E1E
        cmp     byte ptr [si+11h], 64h
        jae     L_12E1E
        inc     bx
        jmp     SHORT L_12E1E
br_12E37:
        mov     ax, ds
        mov     es, ax
        mov     word ptr [W_FFB5], bx
        ret
L_12E40:
        db      40h, 00h, 80h, 00h, 00h, 01h, 00h, 02h, 00h, 04h, 00h, 08h, 00h, 10h, 00h, 20h
        db      00h, 40h, 00h, 80h
int2c_hd_emu_f1a:
        mov     cl, al
        sub     ch, ch
        cmp     cx, word ptr [W_FFB5]
L_12E5C:
        jb      L_12E60
        jmp     SHORT L_12EDE
L_12E60:
        mov     si, 0ffe0h
loop_12E63:
        add     si, 20h
        cmp     byte ptr [si+11h], 1
        jne     loop_12E63
        inc     cl
tgt_12E6E:
        cmp     byte ptr [si+11h], 0
        jne     L_12E77
        add     si, 20h
L_12E77:
        add     si, 20h
        loop    tgt_12E6E
        sub     si, 20h
        mov     word ptr [W_FFB9], si
        mov     ax, word ptr [si+12h]
        dec     ax
        mov     bx, word ptr [W_FFB7]
        mul     bx
        add     ax, word ptr [P_E020]
        adc     dx, 0
        mov     word ptr [W_FFBB], ax
        mov     word ptr [W_FFBD], dx
        mov     cx, 1eh
        mov     di, 5000h
        push    di
L_12EA2:
        call    disk_io_int2d
        pop     si
        mov     ax, ds
        mov     es, ax
        mov     word ptr [W_FFB1], 62h
        mov     word ptr [W_FFB3], 5204h
calls_string_compare_cs_12eb6:
        call    string_compare_cs
        db      "EMULATOR 3X ", 0
        jb      br_12ED4
        mov     word ptr [W_FFB1], 3e6h
        mov     word ptr [W_FFB3], 6bd2h
br_12ED4:
        mov     si, word ptr [W_FFB9]
        mov     ax, ds
        mov     es, ax
        clc
        ret
L_12EDE:
        stc
        ret
isr_int2d_disk_io:
        sti
        push    ds
        push    es
        push    ax
        mov     ax, DATA_SEG
        mov     ds, ax
        pop     ax
L_12EEA:
        call    int2d_scsi_func_dispatch
        mov     ah, 0
        pop     es
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
int2d_scsi_func_dispatch:
        mov     byte ptr [SCSI_FUNC_CODE], ah
        mov     bp, SCSI_CDB
        cmp     ah, 0
L_12F06:
        jne     L_12F0A
        jmp     SHORT br_12F4D
L_12F0A:
        cmp     ah, 1
L_12F0D:
        jne     L_12F12
        jmp     NEAR L_130FC
L_12F12:
        cmp     ah, 2
L_12F15:
        jne     L_12F1A
        jmp     NEAR L_131E3
L_12F1A:
        cmp     ah, 3
L_12F1D:
        jne     L_12F22
        jmp     NEAR L_12FAC
L_12F22:
        cmp     ah, 4
L_12F25:
        jne     L_12F2A
        jmp     NEAR L_130E3
L_12F2A:
        cmp     ah, 5
L_12F2D:
        jne     L_12F32
        jmp     NEAR L_1331A
L_12F32:
        cmp     ah, 6
L_12F35:
        jne     L_12F3A
        jmp     NEAR L_12FD1
L_12F3A:
        cmp     ah, 7
L_12F3D:
        jne     L_12F42
        jmp     br_13355
L_12F42:
        cmp     ah, 8
L_12F45:
        jne     br_12F4A
        jmp     NEAR L_13336
br_12F4A:
        sub     ax, ax
        ret
br_12F4D:
        mov     si, L_12FA4
        mov     bh, 0
        mov     bl, byte ptr [D_0B13]
        mov     al, byte ptr cs:[bx+si]
        mov     byte ptr [SCSI_HOST_ID_BIT], al
        mov     bl, dl
        mov     al, byte ptr cs:[bx+si]
        mov     byte ptr [SCSI_TARGET_ID_BIT], al
        mov     al, byte ptr [D_0B13]
        mov     dx, 0
        out     dx, al
        mov     dx, 2
        mov     al, 80h
        out     dx, al
        mov     dx, 10h
        mov     al, 0
        out     dx, al
        mov     dx, 8
        mov     al, 0ffh
        out     dx, al
        mov     dx, 18h
        mov     al, 0
        out     dx, al
        mov     dx, 1ah
        mov     al, 0
        out     dx, al
        mov     dx, 1ch
        mov     al, 0
        out     dx, al
        mov     dx, 16h
        mov     al, 0
        out     dx, al
        mov     dx, 2
        mov     al, 1eh
        out     dx, al
        mov     word ptr [SCSI_SECTORS_PER_BLOCK], 1
        sub     ax, ax
        ret
L_12FA4:
        db      01h, 02h, 04h, 08h, 10h, 20h, 40h, 80h
L_12FAC:
        mov     byte ptr [bp], 12h
        mov     al, 0
        mov     byte ptr [bp+1], al
        mov     byte ptr [bp+2], al
        mov     byte ptr [bp+3], al
        mov     byte ptr [bp+4], cl
        mov     byte ptr [bp+5], al
        mov     word ptr [SCSI_XFER_LEN], cx
        mov     word ptr [FP_SCSI_XFER_BUF], di
        mov     word ptr [SCSI_XFER_BUF_SEG], dx
L_12FCD:
        call    display_refresh
        ret
L_12FD1:
        call    scsi_cdb_read_capacity
L_12FD4:
        jae     L_12FD7
        ret
L_12FD7:
        cmp     si, 200h
        je      L_12FE3
L_12FDD:
        call    scsi_cdb_mode_select
L_12FE0:
        call    scsi_cdb_read_capacity
L_12FE3:
        mov     dh, byte ptr [bp]
        mov     dl, byte ptr [bp+1]
        mov     ah, byte ptr [bp+2]
        mov     al, byte ptr [bp+3]
        mov     di, ax
        add     di, 1
        adc     dx, 0
        mov     bh, byte ptr [bp+4]
        mov     bl, byte ptr [bp+5]
        mov     ah, byte ptr [bp+6]
        mov     al, byte ptr [bp+7]
        mov     si, ax
        mov     word ptr [SCSI_BLOCK_SIZE], si
        cmp     si, 200h
        je      br_1304A
        cmp     si, 801h
L_13013:
        jae     br_1304D
        cmp     si, 801h
L_13019:
        jae     br_1304D
        sub     dx, dx
        mov     bx, 200h
        div     bx
        mov     word ptr [SCSI_SECTORS_PER_BLOCK], ax
        mov     cx, ax
        mov     dh, byte ptr [bp]
        mov     dl, byte ptr [bp+1]
        mov     ah, byte ptr [bp+2]
        mov     al, byte ptr [bp+3]
        add     ax, 1
        adc     dx, 0
        sub     di, di
        sub     si, si
tgt_1303D:
        add     di, ax
        adc     si, dx
        loop    tgt_1303D
        mov     dx, si
        mov     si, 200h
        sub     bx, bx
br_1304A:
        sub     ax, ax
        ret
br_1304D:
        mov     al, 6
        stc
        ret
scsi_cdb_read_capacity:
        mov     bp, SCSI_CDB
        mov     byte ptr [bp], 25h
        mov     al, 0
        mov     byte ptr [bp+1], al
        mov     byte ptr [bp+2], al
        mov     byte ptr [bp+3], al
        mov     byte ptr [bp+4], al
        mov     byte ptr [bp+5], al
        mov     byte ptr [bp+6], al
        mov     byte ptr [bp+7], al
        mov     byte ptr [bp+8], al
        mov     byte ptr [bp+9], al
        mov     word ptr [SCSI_XFER_LEN], 8
        mov     bp, D_16B6
        mov     word ptr [FP_SCSI_XFER_BUF], bp
        mov     word ptr [SCSI_XFER_BUF_SEG], ds
        push    bp
L_13087:
        call    display_refresh
        pop     bp
        ret
scsi_cdb_mode_select:
        mov     bp, SCSI_CDB
        mov     byte ptr [bp], 15h
        mov     al, 0
        mov     byte ptr [bp+1], 10h
        mov     byte ptr [bp+2], al
        mov     byte ptr [bp+3], al
        mov     byte ptr [bp+4], 0ch
        mov     byte ptr [bp+5], al
        mov     bp, D_16B6
        mov     byte ptr [bp], al
        mov     byte ptr [bp+1], al
        mov     byte ptr [bp+2], al
        mov     byte ptr [bp+3], 8
        mov     byte ptr [bp+4], al
        mov     byte ptr [bp+5], al
        mov     byte ptr [bp+6], al
        mov     byte ptr [bp+7], al
        mov     byte ptr [bp+8], al
        mov     byte ptr [bp+9], al
        mov     byte ptr [bp+0ah], 2
        mov     byte ptr [bp+0bh], al
        mov     word ptr [SCSI_XFER_LEN], 0ch
        mov     word ptr [FP_SCSI_XFER_BUF], D_16B6
        mov     word ptr [SCSI_XFER_BUF_SEG], ds
L_130DF:
        call    display_refresh
        ret
L_130E3:
        mov     byte ptr [bp], 4
        mov     al, 0
        mov     byte ptr [bp+1], al
        mov     byte ptr [bp+2], al
        mov     byte ptr [bp+3], al
        mov     byte ptr [bp+4], al
        mov     byte ptr [bp+5], al
L_130F8:
        call    display_refresh
        ret
L_130FC:
        mov     byte ptr [bp], 28h
        mov     al, 0
        mov     byte ptr [bp+1], al
        mov     byte ptr [bp+2], bh
        mov     byte ptr [bp+3], bl
        mov     byte ptr [bp+4], dh
        mov     byte ptr [bp+5], dl
        mov     byte ptr [bp+6], al
        mov     byte ptr [bp+7], ch
        mov     byte ptr [bp+8], cl
        mov     byte ptr [bp+9], al
        mov     word ptr [FP_SCSI_XFER_BUF], di
        mov     word ptr [SCSI_XFER_BUF_SEG], es
        cmp     word ptr [SCSI_BLOCK_SIZE], 200h
L_1312B:
        je      L_1312F
        jmp     SHORT L_1313B
L_1312F:
        mov     ax, word ptr [SCSI_BLOCK_SIZE]
        mul     cx
        mov     word ptr [SCSI_XFER_LEN], ax
L_13137:
        call    display_refresh
        ret
L_1313B:
        mov     word ptr [SCSI_SECTORS_LEFT], cx
        mov     ax, dx
        mov     dx, bx
L_13143:
        mov     di, word ptr [SCSI_SECTORS_PER_BLOCK]
        sub     si, si
        push    bp
        nop
        push    cs
calls_state_check_104_1314c:
        call    state_check_104FB
        pop     bp
        mov     byte ptr [bp+2], dh
        mov     byte ptr [bp+3], dl
        mov     byte ptr [bp+4], ah
        mov     byte ptr [bp+5], al
        mov     byte ptr [bp+7], 0
        mov     byte ptr [bp+8], 1
        mov     bx, di
        les     di, [FP_SCSI_XFER_BUF]
        or      bx, bx
        je      L_1318F
L_1316E:
        call    L_131B2
L_13171:
        jae     br_13174
        ret
br_13174:
        mov     ax, 200h
        mul     bx
        add     si, ax
loop_1317B:
        mov     cx, 100h
        rep movsw
        sub     word ptr [SCSI_SECTORS_LEFT], 1
        jne     br_13188
        ret
br_13188:
        inc     bx
        cmp     bx, word ptr [SCSI_SECTORS_PER_BLOCK]
        jne     loop_1317B
L_1318F:
        call    L_131B2
L_13192:
        jae     br_13195
        ret
br_13195:
        mov     cx, word ptr [SCSI_SECTORS_PER_BLOCK]
        cmp     word ptr [SCSI_SECTORS_LEFT], cx
        jae     br_131A3
        mov     cx, word ptr [SCSI_SECTORS_LEFT]
br_131A3:
        sub     word ptr [SCSI_SECTORS_LEFT], cx
        pushf
        mov     ch, cl
        mov     cl, 0
        rep movsw
        popf
        jne     L_1318F
        ret
L_131B2:
        pusha
        push    es
        mov     word ptr [FP_SCSI_XFER_BUF], P_BDD8
        mov     word ptr [SCSI_XFER_BUF_SEG], ds
        mov     ax, word ptr [SCSI_BLOCK_SIZE]
        mov     word ptr [SCSI_XFER_LEN], ax
L_131C4:
        call    display_refresh
        pop     es
        popa
        mov     si, P_BDD8
        jb      L_131E2
        mov     bp, D_1694
        add     byte ptr [bp+3], 1
        adc     byte ptr [bp+2], 0
        adc     byte ptr [bp+1], 0
        adc     byte ptr [bp], 0
        clc
L_131E2:
        ret
L_131E3:
        mov     byte ptr [bp], 2ah
        mov     al, 0
        mov     byte ptr [bp+1], al
        mov     byte ptr [bp+2], bh
        mov     byte ptr [bp+3], bl
        mov     byte ptr [bp+4], dh
        mov     byte ptr [bp+5], dl
        mov     byte ptr [bp+6], al
        mov     byte ptr [bp+7], ch
        mov     byte ptr [bp+8], cl
        mov     byte ptr [bp+9], al
        mov     word ptr [FP_SCSI_XFER_BUF], di
        mov     word ptr [SCSI_XFER_BUF_SEG], es
        cmp     word ptr [SCSI_BLOCK_SIZE], 200h
L_13212:
        jne     L_13220
        mov     ax, word ptr [SCSI_BLOCK_SIZE]
        mul     cx
        mov     word ptr [SCSI_XFER_LEN], ax
L_1321C:
        call    display_refresh
        ret
L_13220:
        mov     word ptr [SCSI_SECTORS_LEFT], cx
        mov     ax, dx
        mov     dx, bx
L_13228:
        mov     di, word ptr [SCSI_SECTORS_PER_BLOCK]
        sub     si, si
        push    bp
        nop
        push    cs
calls_state_check_104_13231:
        call    state_check_104FB
        pop     bp
        mov     byte ptr [bp+2], dh
        mov     byte ptr [bp+3], dl
        mov     byte ptr [bp+4], ah
        mov     byte ptr [bp+5], al
        mov     byte ptr [bp+7], 0
        mov     byte ptr [bp+8], 1
        mov     bx, di
        les     di, [FP_SCSI_XFER_BUF]
        or      bx, bx
        je      L_13274
L_13253:
        call    scsi_read10_issue
L_13256:
        jae     br_13259
        ret
br_13259:
        mov     ax, 200h
        mul     bx
        add     si, ax
L_13260:
        call    sector_copy_512
        sub     word ptr [SCSI_SECTORS_LEFT], 1
        je      br_1328E
        inc     bx
        cmp     bx, word ptr [SCSI_SECTORS_PER_BLOCK]
        jne     L_13260
L_13271:
        call    scsi_write10_issue
L_13274:
        mov     cx, word ptr [SCSI_SECTORS_PER_BLOCK]
        cmp     word ptr [SCSI_SECTORS_LEFT], cx
        jae     br_13294
L_1327E:
        call    scsi_read10_issue
L_13281:
        jae     L_13284
        ret
L_13284:
        call    sector_copy_512
        sub     word ptr [SCSI_SECTORS_LEFT], 1
L_1328C:
        jne     L_13284
br_1328E:
        call    scsi_write10_issue
        sub     ax, ax
        ret
br_13294:
        sub     word ptr [SCSI_SECTORS_LEFT], cx
        pushf
        mov     si, P_BDD8
L_1329C:
        call    sector_copy_512
        loop    L_1329C
L_132A1:
        call    scsi_write10_issue
        popf
        jne     L_13274
        sub     ax, ax
L_132A9:
        ret
sector_copy_512:
        push    es
        push    ds
        push    cx
        push    bx
        xchg    di, si
        mov     ax, ds
        mov     dx, es
        mov     ds, dx
L_132B6:
        mov     es, ax
        mov     cx, 100h
        rep movsw
        xchg    di, si
        pop     bx
        pop     cx
        pop     ds
        pop     es
        ret
scsi_write10_issue:
        pusha
        push    es
        mov     byte ptr [SCSI_CDB], 2ah
        mov     word ptr [FP_SCSI_XFER_BUF], P_BDD8
        mov     word ptr [SCSI_XFER_BUF_SEG], ds
        mov     ax, word ptr [SCSI_BLOCK_SIZE]
        mov     word ptr [SCSI_XFER_LEN], ax
L_132DB:
        call    display_refresh
        pop     es
        popa
        mov     si, P_BDD8
        jb      L_132F9
        mov     bp, D_1694
        add     byte ptr [bp+3], 1
        adc     byte ptr [bp+2], 0
        adc     byte ptr [bp+1], 0
        adc     byte ptr [bp], 0
        clc
L_132F9:
        ret
scsi_read10_issue:
        pusha
        push    es
        mov     byte ptr [SCSI_CDB], 28h
        mov     word ptr [FP_SCSI_XFER_BUF], P_BDD8
        mov     word ptr [SCSI_XFER_BUF_SEG], ds
        mov     ax, word ptr [SCSI_BLOCK_SIZE]
        mov     word ptr [SCSI_XFER_LEN], ax
L_13311:
        call    display_refresh
        pop     es
        popa
        mov     si, P_BDD8
        ret
L_1331A:
        mov     byte ptr [bp], 0
        sub     ax, ax
        mov     byte ptr [bp+1], al
        mov     byte ptr [bp+2], al
        mov     byte ptr [bp+3], al
        mov     byte ptr [bp+4], al
        mov     byte ptr [bp+5], al
        mov     word ptr [SCSI_XFER_LEN], ax
L_13332:
        call    display_refresh
        ret
L_13336:
        mov     byte ptr [bp], 0
        sub     ax, ax
        mov     byte ptr [bp+1], al
        mov     byte ptr [bp+2], al
        mov     byte ptr [bp+3], al
        mov     byte ptr [bp+4], al
        mov     byte ptr [bp+5], al
        mov     word ptr [SCSI_XFER_LEN], ax
L_13BEC:
        mov     cx, 1f4h
        call    L_1337D
        ret

br_13355:
        mov     al, byte ptr [SCSI_HOST_ID_BIT]
        mov     byte ptr [SCSI_TARGET_ID_BIT], al
        mov     byte ptr [bp], 0
        sub     ax, ax
        mov     byte ptr [bp+1], al
        mov     byte ptr [bp+2], al
        mov     byte ptr [bp+3], al
        mov     byte ptr [bp+4], al
        mov     byte ptr [bp+5], al
        mov     word ptr [SCSI_XFER_LEN], ax
        mov     cx, 1f4h
        call    L_1337D
        ret
display_refresh:
        mov     cx, 3000h
L_1337D:
        call    scsi_spc_program
        if      FW_VERSION = 172
L_13380:
        endif
        jae     L_13383
        if      FW_VERSION = 150
L_13380:
        endif
        ret
L_13383:
        call    fn_1347A
L_13386:
        jae     L_13389
        ret
L_13389:
        mov     bl, byte ptr [SCSI_STATUS_BYTE]
        and     bl, 3eh
        je      br_133A1
        cmp     bl, 8
L_13395:
        je      br_133A5
        cmp     bl, 18h
L_1339A:
        je      br_133A5
        cmp     bl, 2
L_1339F:
        je      L_133A9
br_133A1:
        sub     ax, ax
        clc
        ret
br_133A5:
        mov     al, 2
        stc
        ret
L_133A9:
        mov     bp, SCSI_CDB
        mov     byte ptr [bp], 3
        sub     ax, ax
        mov     byte ptr [bp+1], al
        mov     byte ptr [bp+2], al
        mov     byte ptr [bp+3], al
        mov     byte ptr [bp+4], 12h
        mov     byte ptr [bp+5], al
        mov     word ptr [SCSI_XFER_LEN], 12h
        mov     di, D_16CA
        mov     word ptr [FP_SCSI_XFER_BUF], di
        mov     word ptr [SCSI_XFER_BUF_SEG], ds
        mov     cx, 3000h
L_133D6:
        call    scsi_spc_program
L_133D9:
        jae     L_133DC
        ret
L_133DC:
        call    fn_1347A
L_133DF:
        jae     L_133E2
        ret
L_133E2:
        and     byte ptr [SCSI_STATUS_BYTE], 3eh
        jne     L_1340A
        mov     bl, byte ptr [SCSI_SENSE_KEY]
        and     bl, 0fh
        cmp     bl, 5
L_133F3:
        je      br_1340E
        mov     al, 2
        cmp     bl, 2
        je      br_1340C
        mov     al, 3
        cmp     bl, 6
        je      br_1340C
        mov     al, 4
        cmp     bl, 7
        je      br_1340C
L_1340A:
        mov     al, 5
br_1340C:
        stc
        ret
br_1340E:
        sub     ax, ax
        clc
        ret
scsi_spc_program:
        mov     dx, 8
        mov     al, 0ffh
        out     dx, al
        mov     dx, 2
        mov     al, 18h
        out     dx, al
        mov     dx, 10h
        mov     al, 0
        out     dx, al
        mov     al, byte ptr [SCSI_HOST_ID_BIT]
        or      al, byte ptr [SCSI_TARGET_ID_BIT]
        mov     dx, 16h
        out     dx, al
        mov     ax, cx
        mov     dx, 1ah
        out     dx, al
        mov     al, ah
        mov     dx, 18h
        out     dx, al
        mov     dx, 1ch
        mov     al, 4
        out     dx, al
        mov     dx, 4
        mov     al, 25h
        out     dx, al
        mov     word ptr [G_TIMEOUT_TICKS], 2
loop_1344D:
        cmp     word ptr [G_TIMEOUT_TICKS], 0
        jne     loop_1344D
        mov     word ptr [G_TIMEOUT_TICKS], 0bb8h
L_1345A:
        cmp     word ptr [G_TIMEOUT_TICKS], 0
L_1345F:
        je      br_13472
        in      al, 8
        test    al, 1
L_13465:
        jne     scsi_spc_program
        test    al, 4
L_13469:
        jne     br_13476
        test    al, 10h
        je      L_1345A
        sub     ax, ax
        ret
br_13472:
        mov     al, 2
        stc
        ret
br_13476:
        mov     al, 1
        stc
        ret
fn_1347A:
        mov     byte ptr [SCSI_STATUS_BYTE], 0
        mov     byte ptr [SCSI_MSG_IN_BUF], 0
        mov     byte ptr [SCSI_MSG_IN_IDX], 0
L_13489:

        if      FW_VERSION = 172
        mov     word ptr [G_TIMEOUT_TICKS], 7530h
        else
        mov     word ptr [G_TIMEOUT_TICKS], 1388h
        endif
L_1348F:
        cmp     word ptr [G_TIMEOUT_TICKS], 0
tgt_13494:
        je      br_134BB
        push    dx
        mov     dx, 0ah
        in      al, dx
        pop     dx
        mov     ah, al
        and     ah, 88h
        jne     br_134A4
        ret
br_134A4:
        test    ah, 80h
        je      L_1348F
        and     ax, 7
        shl     ax, 1
        mov     bx, ax
        call    word ptr cs:[bx+scsi_phase_table]
        jae     L_13489
        mov     al, 5
        stc
        ret
br_134BB:
        mov     al, 5
        stc
        ret
scsi_phase_table:
        dw      scsi_phase_data_out, scsi_phase_data_in, scsi_phase_command, scsi_phase_status
        dw      scsi_phase_reserved, scsi_phase_reserved, scsi_phase_msg_out, scsi_phase_msg_in
scsi_phase_reserved:
        ret
scsi_phase_data_out:
        mov     dx, 10h
        mov     al, 0
        out     dx, al
        mov     cx, word ptr [SCSI_XFER_LEN]
        les     si, [FP_SCSI_XFER_BUF]
        mov     al, cl
        mov     dx, 1ch
        out     dx, al
        mov     al, ch
        mov     dx, 1ah
        out     dx, al
        mov     dx, 18h
        mov     al, 0
        out     dx, al
        mov     dx, 8
        mov     al, 0ffh
        out     dx, al
        mov     dx, 4
        mov     al, 80h
        out     dx, al
        mov     dx, 0c030h
        mov     al, 1
        out     dx, al
        mov     dx, 0c038h
        mov     al, 10h
        out     dx, al
        mov     dx, 0c039h
        mov     al, 1
        out     dx, al
        mov     dx, 0c031h
        mov     al, 0
        out     dx, al
        push    dx
        mov     dx, 0c03fh
        in      al, dx
        pop     dx
        or      al, 1
        mov     dx, 0c03fh
        out     dx, al
        mov     ax, es
        push    cx
L_13DC1:
        mov     cx, 4
        sub     bl, bl

tgt_13528:
        shl     ax, 1
        rcl     bl, 1
        loop    tgt_13528
        pop     cx
        add     ax, si
        adc     bl, 0
        mov     dx, 0c034h
        out     dx, ax
        mov     al, bl
        if      FW_VERSION = 172
L_1353A:
        int     53h
        else
        mov     di, es
        cmp     di, 8000h
        jb      L_13DE2
        or      al, 10h
L_13DE2:
        endif
        mov     dx, 0c036h
        out     dx, al
        mov     ax, cx
        dec     ax
        mov     dx, 0c032h
        out     dx, ax
        mov     dx, 0c03ah
        mov     al, 8
        out     dx, al
        push    dx
        mov     dx, 0c03bh
        in      al, dx
        pop     dx
        push    dx
        mov     dx, 0c03fh
        in      al, dx
        pop     dx
        and     al, 0feh
        mov     dx, 0c03fh
        out     dx, al
        mov     word ptr [G_TIMEOUT_TICKS], 3e8h
L_13E0B:
        cmp     word ptr [G_TIMEOUT_TICKS], 0
        je      L_13580
        in      al, 8
        test    al, 10h
        je      L_13E0B
        mov     dx, 8
        mov     al, 10h
        out     dx, al
        mov     dx, 0c030h
        mov     al, 1
        out     dx, al
        clc
        ret
L_13580:
        mov     dx, 0c030h
        mov     al, 1
        out     dx, al
        stc
        ret
scsi_phase_data_in:
        mov     dx, 10h
        mov     al, 1
        out     dx, al
        mov     cx, word ptr [SCSI_XFER_LEN]
        les     di, [FP_SCSI_XFER_BUF]
        or      cx, cx
L_13598:
        jne     br_1359D
        jmp     L_13647
br_1359D:
        mov     al, cl
        mov     dx, 1ch
        out     dx, al
        mov     al, ch
        mov     dx, 1ah
        out     dx, al
        mov     dx, 18h
        mov     al, 0
        out     dx, al
        mov     dx, 8
        mov     al, 0ffh
        out     dx, al
        mov     dx, 4
        mov     al, 81h
        out     dx, al
        mov     dx, 0c030h
        mov     al, 1
        out     dx, al
        mov     dx, 0c038h
        mov     al, 10h
        out     dx, al
        mov     dx, 0c039h
        mov     al, 1
        out     dx, al
        mov     dx, 0c031h
        mov     al, 0
        out     dx, al
        push    dx
        mov     dx, 0c03fh
        in      al, dx
        pop     dx
        or      al, 1
        mov     dx, 0c03fh
        out     dx, al
        mov     ax, es
        push    cx
        mov     cx, 4
        sub     bl, bl
tgt_135E7:
        shl     ax, 1
        rcl     bl, 1
        loop    tgt_135E7
        pop     cx
        add     ax, di
        adc     bl, 0
        mov     dx, 0c034h
        out     dx, ax
        mov     al, bl
        if      FW_VERSION = 150
        mov     di, es
        cmp     di, 8000h
        jb      L_135F9
        or      al, 10h
        endif
L_135F9:
        if      FW_VERSION = 172
        int     53h
        endif
        mov     dx, 0c036h
        out     dx, al
        mov     ax, cx
        dec     ax
        mov     dx, 0c032h
        out     dx, ax
        mov     dx, 0c03ah
        mov     al, 4
        out     dx, al
        push    dx
        mov     dx, 0c03bh
        in      al, dx
        pop     dx
        push    dx
        mov     dx, 0c03fh
        in      al, dx
        pop     dx
        and     al, 0feh
        mov     dx, 0c03fh
        out     dx, al
        mov     word ptr [G_TIMEOUT_TICKS], 3e8h
L_13ED2:
        cmp     word ptr [G_TIMEOUT_TICKS], 0
        je      L_13647
        in      al, 0ah
        and     al, 7
        cmp     al, 1
        jne     br_1363F
        in      al, 8
        test    al, 10h
        je      L_13ED2
        mov     dx, 8
        mov     al, 10h
        out     dx, al
br_1363F:
        mov     dx, 0c030h
        mov     al, 1
        out     dx, al
        clc
        ret
L_13647:
        mov     dx, 0c030h
        mov     al, 1
        out     dx, al
        stc
        ret
scsi_phase_command:
        mov     dx, 10h
        mov     al, 2
        out     dx, al
        mov     si, SCSI_CDB
        mov     ah, byte ptr [si]
        shr     ah, 5
        mov     al, 6
        cmp     ah, 0
        je      br_1366D
        mov     al, 0ah
        cmp     ah, 3
        jb      br_1366D
        mov     al, 0ch
br_1366D:
        mov     cl, al
        mov     ch, 0
        mov     dx, 1ch
        out     dx, al
        mov     dx, 1ah
        mov     al, 0
        out     dx, al
        mov     dx, 18h
        mov     al, 0
        out     dx, al
        mov     dx, 8
        mov     al, 0ffh
        out     dx, al
        mov     dx, 4
        mov     al, 84h
        out     dx, al
L_1368D:
        mov     bx, 3e8h
loop_13690:
        dec     bx
        je      L_136C4
        in      al, 0ch
        test    al, 2
        jne     loop_13690
        lodsb
        out     14h, al
        loop    L_1368D
        sub     bx, bx
loop_136A0:
        dec     bx
        je      L_136C4
        in      al, 0ch
        test    al, 4
        je      loop_136A0
        mov     word ptr [G_TIMEOUT_TICKS], 3e8h
loop_136AF:
        cmp     word ptr [G_TIMEOUT_TICKS], 0
        je      L_136C4
        in      al, 8
        test    al, 10h
        je      loop_136AF
        mov     dx, 8
        mov     al, 10h
        out     dx, al
        clc
        ret
L_136C4:
        stc
        ret
scsi_phase_status:
        mov     dx, 10h
        mov     al, 3
        out     dx, al
        mov     dx, 8
        mov     al, 0ffh
        out     dx, al
        mov     dx, 4
        mov     al, 0e4h
        out     dx, al
        mov     word ptr [G_TIMEOUT_TICKS], 3e8h
loop_136DE:
        cmp     word ptr [G_TIMEOUT_TICKS], 0
        je      L_13700
        push    dx
        mov     dx, 0ah
        in      al, dx
        pop     dx
        test    al, 80h
        jne     loop_136DE
        push    dx
        mov     dx, 16h
        in      al, dx
        pop     dx
        mov     byte ptr [SCSI_STATUS_BYTE], al
        mov     dx, 4
        mov     al, 0c4h
        out     dx, al
        clc
        ret
L_13700:
        stc
        ret
scsi_phase_msg_in:
        mov     dx, 10h
        mov     al, 7
        out     dx, al
        mov     dx, 8
        mov     al, 0ffh
        out     dx, al
        mov     dx, 4
        mov     al, 0e4h
        out     dx, al
        mov     word ptr [G_TIMEOUT_TICKS], 3e8h
L_13FC8:
        cmp     word ptr [G_TIMEOUT_TICKS], 0
        je      L_1374E
        push    dx
        mov     dx, 0ah
        in      al, dx
        pop     dx
        test    al, 80h
        jne     L_13FC8
        push    dx
        mov     dx, 16h
        in      al, dx
        pop     dx
        mov     bl, byte ptr [SCSI_MSG_IN_IDX]
        mov     bh, 0
        mov     byte ptr [bx+SCSI_MSG_IN_BUF], al
        inc     bl
L_1373D:
        cmp     bl, 0ah
        je      br_13746
        mov     byte ptr [SCSI_MSG_IN_IDX], bl
br_13746:
        mov     dx, 4
        mov     al, 0c4h
        out     dx, al
        clc
        ret
L_1374E:
        stc
        ret
scsi_phase_msg_out:
        db      0f9h, 0c3h
L_13752:
        push    ax
        in      al, 8
        mov     dl, al
        in      al, 0ah
        mov     bl, al
        in      al, 0ch
        mov     cl, al
        in      al, 0eh
        mov     ch, al
        in      al, 10h
        mov     bh, al
        mov     al, byte ptr [SCSI_STATUS_BYTE]
        mov     ah, byte ptr [SCSI_MSG_IN_BUF]
        mov     si, ax
        mov     bp, 0ffffh
        pop     ax
        mov     ah, byte ptr [SCSI_FUNC_CODE]
        ret
        db      00h
int2b_bytecode_dispatch:
        sti
        pusha
        push    ds
        push    es
        mov     bp, sp
        mov     es, word ptr [bp+16h]
        mov     bp, word ptr [bp+TBL_0014]
        sub     bh, bh
        mov     bl, byte ptr es:[bp]
        inc     bp
        call    word ptr cs:[bx+bc_handler_table]
        mov     ax, bp
        mov     bp, sp
        mov     word ptr [bp+TBL_0014], ax
        pop     es
        pop     ds
        popa
        iret
bc_handler_table:
        dw      lcd_controller_init
        dw      lcd_refresh_dispatch
        dw      bc_op04_plane_a
        dw      bc_op06_plane_b
        dw      bc_op08_plane_c
        dw      bc_op0a_plane_e
        dw      bc_op0c_clear_planes
        dw      bc_op0e_text
        dw      bc_op10_text_inverse
        dw      bc_op12_box_chars
        dw      bc_op14_puts_far
        dw      bc_op16_text_from_table
        dw      bc_op18_puts_counted
        dw      bc_op1a_text_from_ds_ptr
        dw      bc_op1c_off_or_on
        dw      bc_op1e_display
        dw      bc_op20_print
        dw      bc_op22_message_close
        dw      bc_op24_prompt_row
        dw      bc_op26_clear_prompt_flags
        dw      bc_op28_message_cancel_go
        dw      bc_op2a_text_small
        dw      bc_op2c_text_shaded
        dw      bc_op2e_text_from_table_nul
        dw      bc_op30_no_or_yes
        dw      bc_op32_num1
        dw      bc_op34_num2
        dw      bc_op36_num3
        dw      bc_op38_num4
        dw      bc_op3a_num6
        dw      bc_op3c_num2_right
        dw      bc_op3e_num3_right
        dw      bc_op40_num4_right
        dw      bc_op42_num3_at_pen
        dw      bc_op44_num2_padded
        dw      bc_op46_num3_padded
        dw      bc_op48_num7
        dw      bc_op4a_num8
        dw      bc_op4c_num3_cells
        dw      bc_op4e_line
        dw      bc_op50_hline
        dw      bc_op52_vline
        dw      bc_op54_hline_dotted
        dw      bc_op56_vline_dotted
        dw      bc_op58_hline_clear
        dw      bc_op5a_vline_clear
        dw      bc_op5c_rect_outline
        dw      bc_op5e_rect_fill
        dw      bc_op60_rect_clear
        dw      bc_op62_highlight_move
        dw      bc_op64_highlight_move_indexed
        dw      bc_op66_blit_bitmap
        dw      bc_op68_soft_keys
        dw      bc_op6a_soft_keys_redraw_all
        dw      bc_op6c_soft_keys_styled
        dw      bc_op6e_pixel1
        dw      bc_op70_pixel2
        dw      bc_op72_pixel3
        dw      bc_op74_window_frame_double
        dw      bc_op76_window_frame_rounded
        dw      bc_op78_text_at_pen
        dw      bc_op7a_num2_padded_at_pen
        dw      bc_op7c_num2_at_pen
        dw      bc_op7e_num3_at_pen
        dw      bc_op80_num4_at_pen
        dw      bc_op82_midi_field
        dw      bc_op84_highlight_move_reg
        dw      bc_op86_blit_bitmap_indexed
        dw      bc_op88_clear_planes_660
        dw      bc_op_ret
        dw      bc_op8c_plane_push_visible
        dw      bc_op8e_plane_pop
        dw      bc_op90_put_hex_high
        dw      bc_op92_put_hex
        dw      bc_op94_putchar
        dw      bc_op_ret
        dw      bc_op98_rect_outline_reg
        dw      bc_op9a_rect_fill_reg
        dw      bc_op9c_bar_beat_tick
        dw      bc_op9e_plane_a_row_base
        dw      bc_opa0_status_line_far_string
        dw      bc_opa2_num_tenths
        dw      bc_opa4_cs_literal
        dw      bc_opa6_plane_f_and_flag
        dw      bc_opa8_num_tenths_alt
        dw      bc_opaa_lcd_attr_fc
        dw      bc_opac_lcd_attr_0
        dw      bc_opae_clear_plane_c
        dw      bc_opb0_num6_at_pen
        dw      bc_opb2_rect_clear_reg
        dw      bc_opb4_note_and_pad
        dw      lcd_refresh_band_overlay
        dw      bc_opb8_field_3cell
bc_op_ret:
        ret
lcd_controller_init:
        mov     al, 23h
        call    lcd_write_cmd_left
        mov     al, 85h
calls_io_wait_port_60_1385f:
        if      FW_VERSION = 150
L_1410F                         equ     $+2
        endif
        call    lcd_wait_ready_left
calls_io_out_port_62_13862:
        call    lcd_write_data_left
        mov     al, 24h
        call    lcd_write_cmd_left
        if      FW_VERSION = 150
L_14119                         equ     $+1
        endif
        mov     al, 1
calls_io_wait_port_60_1386c:
        call    lcd_wait_ready_left
calls_io_out_port_62_1386f:
        call    lcd_write_data_left
        mov     al, 23h
calls_io_out_port_100_13874:
        call    lcd_write_cmd_right
        mov     al, 8dh
calls_io_wait_port_100_13879:
        call    lcd_wait_ready_right
calls_io_out_port_102_1387c:
        call    lcd_write_data_right
        mov     al, 24h
calls_io_out_port_100_13881:
        call    lcd_write_cmd_right
        mov     al, 1
calls_io_wait_port_100_13886:
        call    lcd_wait_ready_right
calls_io_out_port_102_13889:
        call    lcd_write_data_right
L_1388C:
        call    delay_busy_10000
        mov     bl, 0
calls_io_out_port_100_13891:
        mov     al, 22h
calls_io_out_port_100_13893:
        call    lcd_write_cmd_right
        mov     al, bl
calls_io_wait_port_100_13898:
        call    lcd_wait_ready_right
calls_io_out_port_102_1389b:
        call    lcd_write_data_right
        mov     al, 21h
calls_io_out_port_100_138a0:
        call    lcd_write_cmd_right
        mov     al, 0
calls_io_wait_port_100_138a5:
        call    lcd_wait_ready_right
calls_io_out_port_102_138a8:
        call    lcd_write_data_right
        mov     al, 20h
calls_io_out_port_100_138ad:
        call    lcd_write_cmd_right
        mov     cx, 14h
calls_io_wait_port_100_138b3:
        mov     al, 0
calls_io_wait_port_100_138b5:
        call    lcd_wait_ready_right
calls_io_out_port_102_138b8:
        call    lcd_write_data_right
        loop    calls_io_wait_port_100_138b3
        inc     bl
L_138BF:
        cmp     bl, 41h
        jne     calls_io_out_port_100_13891
L_138C4:
        call    delay_busy_10000
        mov     cx, 0
        mov     bl, 64h
calls_io_out_port_100_138cc:
        push    cx
        push    bx
        mov     al, 22h
calls_io_out_port_100_138d0:
        call    lcd_write_cmd_right
        mov     al, cl
calls_io_wait_port_100_138d5:
        call    lcd_wait_ready_right
calls_io_out_port_102_138d8:
        call    lcd_write_data_right
        mov     al, 21h
calls_io_out_port_100_138dd:
        call    lcd_write_cmd_right
        mov     al, bl
        sub     ah, ah
        mov     cl, 8
        div     cl
        mov     bl, ah
        sub     bh, bh
calls_io_wait_port_100_138ec:
        call    lcd_wait_ready_right
calls_io_out_port_102_138ef:
        call    lcd_write_data_right
        mov     al, 20h
calls_io_out_port_100_138f4:
        call    lcd_write_cmd_right
        add     bx, L_1394A
        mov     al, byte ptr cs:[bx]
calls_io_wait_port_100_138fe:
        call    lcd_wait_ready_right
calls_io_out_port_102_13901:
        call    lcd_write_data_right
        pop     bx
        pop     cx
        inc     bl
        inc     cl
        cmp     cl, 3ch
        jne     calls_io_out_port_100_138cc
        mov     al, 23h
        call    lcd_write_cmd_left
        mov     al, 5
calls_io_wait_port_60_13916:
        call    lcd_wait_ready_left
calls_io_out_port_62_13919:
        call    lcd_write_data_left
        mov     al, 24h
        call    lcd_write_cmd_left
        mov     al, 1
calls_io_wait_port_60_13923:
        call    lcd_wait_ready_left
calls_io_out_port_62_13926:
        call    lcd_write_data_left
        mov     al, 23h
calls_io_out_port_100_1392b:
        call    lcd_write_cmd_right
        mov     al, 2dh
calls_io_wait_port_100_13930:
        call    lcd_wait_ready_right
calls_io_out_port_102_13933:
        call    lcd_write_data_right
        mov     al, 24h
calls_io_out_port_100_13938:
        call    lcd_write_cmd_right
        mov     al, 1
calls_io_wait_port_100_1393d:
        call    lcd_wait_ready_right
calls_io_out_port_102_13940:
        call    lcd_write_data_right
L_13943:
        call    delay_busy_10000
L_13946:
        call    L_13EAE
        ret
L_1394A:
        add     byte ptr [bx+si+20h], 10h
        or      byte ptr [si], al
        add     al, byte ptr [bx+di]
lcd_write_cmd_left:
        mov     dx, 60h
        out     dx, al
        ret
lcd_write_data_left:
        mov     dx, 62h
        out     dx, al
        ret
lcd_wait_ready_left:
        push    ax
        push    cx
        mov     cx, 0ffffh
tgt_13961:
        mov     dx, 60h
        in      al, dx
        test    al, 80h
        je      br_1396B
        loop    tgt_13961
br_1396B:
        pop     cx
        pop     ax
        ret
lcd_write_cmd_right:
        mov     dx, 100h
        out     dx, al
        ret
lcd_write_data_right:
        mov     dx, 102h
        out     dx, al
        ret
lcd_wait_ready_right:
        push    ax
        push    cx
        mov     cx, 0ffffh
tgt_1397D:
        mov     dx, 100h
        in      al, dx
        test    al, 80h
        je      br_13987
        loop    tgt_1397D
br_13987:
        pop     cx
        pop     ax
        ret
delay_busy_10000:
        push    cx
        mov     cx, 2710h
loop_1398E:
        dec     cx
        jne     loop_1398E
        pop     cx
        ret
lcd_refresh_dispatch:
        cmp     byte ptr [LCD_PLANE_PUSHED], 1
L_13998:
        jne     L_1399D
        jmp     NEAR br_13A91
L_1399D:
        sub     bx, bx
        mov     cx, 3ch
        cmp     byte ptr [LCD_PROMPT_ROW], 0
L_139A7:
        je      L_139AC
        mov     cx, 33h
L_139AC:
        call    lcd_refresh_band_full
        cmp     byte ptr [SEQ_LOOP_JUMP_STATE], 0
L_139B4:
        jne     br_139F4
        cmp     byte ptr [G_STEP_EDIT_ACTIVE], 0
        je      L_139D8
        mov     al, byte ptr [NOTE_RING_RD]
        cmp     al, byte ptr [NOTE_RING_WR]
L_139C4:
        jne     br_139F4
        mov     al, byte ptr [MIDI_IN1_RING_PEEK]
        cmp     al, byte ptr [MIDI_IN1_RING_WR]
L_139CD:
        jne     br_139F4
        mov     al, byte ptr [MIDI_IN2_RING_PEEK]
        cmp     al, byte ptr [MIDI_IN2_RING_WR]
L_139D6:
        jne     br_139F4
L_139D8:
        inc     bl
L_139DA:
        cmp     bl, 20h
        jne     L_139AC
        cmp     byte ptr [LCD_MSG_OVERLAY], 0
L_139E4:
        je      L_139E9
        jmp     NEAR lcd_refresh_band_overlay
L_139E9:
        cmp     byte ptr [LCD_PROMPT_ROW], 0
L_139EE:
        je      L_139F3
        jmp     NEAR lcd_refresh_band_bottom
L_139F3:
        ret
br_139F4:
        mov     byte ptr [UI_REDRAW_REQ], 1
        ret
lcd_refresh_band_full:
        cmp     bl, 14h
calls_io_out_port_60_139fd:
        jae     calls_io_out_port_100_13a47
        push    bx
        push    cx
        mov     al, 22h
        call    lcd_write_cmd_left
        mov     al, 0
calls_io_wait_port_60_13a08:
        call    lcd_wait_ready_left
calls_io_out_port_62_13a0b:
        call    lcd_write_data_left
        mov     al, 21h
        call    lcd_write_cmd_left
        mov     al, bl
calls_io_wait_port_60_13a15:
        call    lcd_wait_ready_left
calls_io_out_port_62_13a18:
        call    lcd_write_data_left
        mov     al, 20h
        call    lcd_write_cmd_left
        sub     bh, bh
L_13A22:
        mov     ah, byte ptr [bx+LCD_PLANE_A]
        or      ah, byte ptr [bx+LCD_PLANE_B]
        xor     ah, byte ptr [bx+LCD_PLANE_C]
        mov     dx, 60h
        in      al, dx
        shl     al, 1
        je      br_13A39
calls_io_wait_port_60_13a36:
        call    lcd_wait_ready_left
br_13A39:
        mov     al, ah
        mov     dx, 62h
        out     dx, al
        add     bx, 20h
        loop    L_13A22
        pop     cx
        pop     bx
        ret
calls_io_out_port_100_13a47:
        push    bx
        push    cx
        mov     al, 22h
calls_io_out_port_100_13a4b:
        call    lcd_write_cmd_right
        mov     al, 0
calls_io_wait_port_100_13a50:
        call    lcd_wait_ready_right
calls_io_out_port_102_13a53:
        call    lcd_write_data_right
        mov     al, 21h
calls_io_out_port_100_13a58:
        call    lcd_write_cmd_right
        mov     al, bl
        sub     al, 14h
calls_io_wait_port_100_13a5f:
        call    lcd_wait_ready_right
calls_io_out_port_102_13a62:
        call    lcd_write_data_right
        mov     al, 20h
calls_io_out_port_100_13a67:
        call    lcd_write_cmd_right
        sub     bh, bh
L_13A6C:
        mov     ah, byte ptr [bx+LCD_PLANE_A]
        or      ah, byte ptr [bx+LCD_PLANE_B]
        xor     ah, byte ptr [bx+LCD_PLANE_C]
        mov     dx, 100h
        in      al, dx
        shl     al, 1
        je      br_13A83
calls_io_wait_port_100_13a80:
        call    lcd_wait_ready_right
br_13A83:
        mov     al, ah
        mov     dx, 102h
        out     dx, al
        add     bx, 20h
        loop    L_13A6C
        pop     cx
        pop     bx
        ret
br_13A91:
        mov     bh, 0
        mov     bl, 0
        mov     cx, 3ch
L_13A98:
        call    L_13AA3
        inc     bl
L_13A9D:
        cmp     bl, 20h
        jne     L_13A98
        ret
L_13AA3:
        cmp     bl, 14h
calls_io_out_port_60_13aa6:
        jae     calls_io_out_port_100_13aea
        push    bx
        push    cx
        mov     al, 22h
        call    lcd_write_cmd_left
        mov     al, 0
calls_io_wait_port_60_13ab1:
        call    lcd_wait_ready_left
calls_io_out_port_62_13ab4:
        call    lcd_write_data_left
        mov     al, 21h
        call    lcd_write_cmd_left
        mov     al, bl
calls_io_wait_port_60_13abe:
        call    lcd_wait_ready_left
calls_io_out_port_62_13ac1:
        call    lcd_write_data_left
        mov     al, 20h
        call    lcd_write_cmd_left
        sub     bh, bh
        add     bx, LCD_PLANE_B
L_13ACF:
        mov     ah, byte ptr [bx]
        mov     dx, 60h
        in      al, dx
        shl     al, 1
        je      br_13ADC
calls_io_wait_port_60_13ad9:
        call    lcd_wait_ready_left
br_13ADC:
        mov     al, ah
        mov     dx, 62h
        out     dx, al
        add     bx, 20h
        loop    L_13ACF
        pop     cx
        pop     bx
        ret
calls_io_out_port_100_13aea:
        push    bx
        push    cx
        mov     al, 22h
calls_io_out_port_100_13aee:
        call    lcd_write_cmd_right
        mov     al, 0
calls_io_wait_port_100_13af3:
        call    lcd_wait_ready_right
calls_io_out_port_102_13af6:
        call    lcd_write_data_right
        mov     al, 21h
calls_io_out_port_100_13afb:
        call    lcd_write_cmd_right
        mov     al, bl
        sub     al, 14h
calls_io_wait_port_100_13b02:
        call    lcd_wait_ready_right
calls_io_out_port_102_13b05:
        call    lcd_write_data_right
        mov     al, 20h
calls_io_out_port_100_13b0a:
        call    lcd_write_cmd_right
        sub     bh, bh
        add     bx, LCD_PLANE_B
L_13B13:
        mov     ah, byte ptr [bx]
        mov     dx, 100h
        in      al, dx
        shl     al, 1
        je      br_13B20
calls_io_wait_port_100_13b1d:
        call    lcd_wait_ready_right
br_13B20:
        mov     al, ah
        mov     dx, 102h
        out     dx, al
        add     bx, 20h
        loop    L_13B13
        pop     cx
        pop     bx
        ret
lcd_refresh_band_overlay:
        mov     bh, 14h
        mov     bl, 0
        mov     cx, 11h
L_13B35:
        call    L_13B4A
        inc     bl
L_13B3A:
        cmp     bl, 20h
        jne     L_13B35
        cmp     byte ptr [LCD_PROMPT_ROW], 0
L_13B44:
        je      L_13B49
        jmp     NEAR lcd_refresh_band_bottom
L_13B49:
        ret
L_13B4A:
        cmp     bl, 14h
calls_io_out_port_60_13b4d:
        jae     calls_io_out_port_100_13b9a
        push    bx
        push    cx
        mov     al, 22h
        call    lcd_write_cmd_left
        mov     al, bh
calls_io_wait_port_60_13b58:
        call    lcd_wait_ready_left
calls_io_out_port_62_13b5b:
        call    lcd_write_data_left
        mov     al, 21h
        call    lcd_write_cmd_left
        mov     al, bl
calls_io_wait_port_60_13b65:
        call    lcd_wait_ready_left
calls_io_out_port_62_13b68:
        call    lcd_write_data_left
        mov     al, 20h
        call    lcd_write_cmd_left
        mov     al, 20h
        mul     bh
        sub     bh, bh
        add     bx, ax
L_13B78:
        mov     al, byte ptr [bx+LCD_PLANE_A]
        or      al, byte ptr [bx+LCD_PLANE_B]
        xor     al, byte ptr [bx+LCD_PLANE_C]
        or      al, byte ptr [bx+P_F190]
        xor     al, byte ptr [bx+P_F58C]
calls_io_wait_port_60_13b8c:
        call    lcd_wait_ready_left
calls_io_out_port_62_13b8f:
        call    lcd_write_data_left
        add     bx, 20h
        loop    L_13B78
        pop     cx
        pop     bx
        ret
calls_io_out_port_100_13b9a:
        push    bx
        push    cx
        mov     al, 22h
calls_io_out_port_100_13b9e:
        call    lcd_write_cmd_right
        mov     al, bh
calls_io_wait_port_100_13ba3:
        call    lcd_wait_ready_right
calls_io_out_port_102_13ba6:
        call    lcd_write_data_right
        mov     al, 21h
calls_io_out_port_100_13bab:
        call    lcd_write_cmd_right
        mov     al, bl
        sub     al, 14h
calls_io_wait_port_100_13bb2:
        call    lcd_wait_ready_right
calls_io_out_port_102_13bb5:
        call    lcd_write_data_right
        mov     al, 20h
calls_io_out_port_100_13bba:
        call    lcd_write_cmd_right
        mov     al, 20h
        mul     bh
        sub     bh, bh
        add     bx, ax
L_13BC5:
        mov     al, byte ptr [bx+LCD_PLANE_A]
        or      al, byte ptr [bx+LCD_PLANE_B]
        xor     al, byte ptr [bx+LCD_PLANE_C]
        or      al, byte ptr [bx+P_F190]
        xor     al, byte ptr [bx+P_F58C]
calls_io_wait_port_100_13bd9:
        call    lcd_wait_ready_right
calls_io_out_port_102_13bdc:
        call    lcd_write_data_right
        add     bx, 20h
        loop    L_13BC5
        pop     cx
        pop     bx
        ret
lcd_refresh_band_bottom:
        mov     bh, 33h
        mov     bl, 0
        mov     cx, 9
L_13BEE:
        call    L_13BF9
        inc     bl
L_13BF3:
        cmp     bl, 20h
        jne     L_13BEE
        ret
L_13BF9:
        cmp     bl, 14h
calls_io_out_port_60_13bfc:
        jae     calls_io_out_port_100_13c39
        push    bx
        push    cx
        mov     al, 22h
        call    lcd_write_cmd_left
        mov     al, bh
calls_io_wait_port_60_13c07:
        call    lcd_wait_ready_left
calls_io_out_port_62_13c0a:
        call    lcd_write_data_left
        mov     al, 21h
        call    lcd_write_cmd_left
        mov     al, bl
calls_io_wait_port_60_13c14:
        call    lcd_wait_ready_left
calls_io_out_port_62_13c17:
        call    lcd_write_data_left
        mov     al, 20h
        call    lcd_write_cmd_left
        mov     al, 20h
        mul     bh
        sub     bh, bh
        add     bx, ax
calls_io_wait_port_60_13c27:
        mov     al, byte ptr [bx+P_F5A8]
calls_io_wait_port_60_13c2b:
        call    lcd_wait_ready_left
calls_io_out_port_62_13c2e:
        call    lcd_write_data_left
        add     bx, 20h
        loop    calls_io_wait_port_60_13c27
        pop     cx
        pop     bx
        ret
calls_io_out_port_100_13c39:
        push    bx
        push    cx
        mov     al, 22h
calls_io_out_port_100_13c3d:
        call    lcd_write_cmd_right
        mov     al, bh
calls_io_wait_port_100_13c42:
        call    lcd_wait_ready_right
calls_io_out_port_102_13c45:
        call    lcd_write_data_right
        mov     al, 21h
calls_io_out_port_100_13c4a:
        call    lcd_write_cmd_right
        mov     al, bl
        sub     al, 14h
calls_io_wait_port_100_13c51:
        call    lcd_wait_ready_right
calls_io_out_port_102_13c54:
        call    lcd_write_data_right
        mov     al, 20h
calls_io_out_port_100_13c59:
        call    lcd_write_cmd_right
        mov     al, 20h
        mul     bh
        sub     bh, bh
        add     bx, ax
calls_io_wait_port_100_13c64:
        mov     al, byte ptr [bx+P_F5A8]
calls_io_wait_port_100_13c68:
        call    lcd_wait_ready_right
calls_io_out_port_102_13c6b:
        call    lcd_write_data_right
        add     bx, 20h
        loop    calls_io_wait_port_100_13c64
        pop     cx
        pop     bx
        ret
bc_op04_plane_a:
        mov     word ptr [LCD_FB_BASE], LCD_PLANE_A
        mov     byte ptr [LCD_ATTR], 0
        ret
bc_op06_plane_b:
        mov     word ptr [LCD_FB_BASE], LCD_PLANE_B
        ret
bc_op08_plane_c:
        mov     word ptr [LCD_FB_BASE], LCD_PLANE_C
        ret
lcd_select_plane_d:
        mov     word ptr [LCD_FB_BASE], LCD_PLANE_D
        ret
bc_op0a_plane_e:
        mov     word ptr [LCD_FB_BASE], LCD_PLANE_E
        ret
lcd_select_plane_f:
        mov     word ptr [LCD_FB_BASE], LCD_PLANE_F
        ret
bc_op8c_plane_push_visible:
        mov     ax, word ptr [LCD_FB_BASE]
        mov     word ptr [LCD_FB_BASE_SAVED], ax
        mov     word ptr [LCD_FB_BASE], LCD_PLANE_B
        mov     byte ptr [LCD_PLANE_PUSHED], 1
        ret
bc_opa6_plane_f_and_flag:
        call    lcd_select_plane_f
        mov     byte ptr [LCD_PROMPT_ROW], 1
L_13CBF:
        ret
bc_op9e_plane_a_row_base:
        mov     ah, 20h
        mul     ah
        add     ax, LCD_PLANE_A
        mov     word ptr [LCD_FB_BASE], ax
        ret
lcd_command:
        mov     ax, word ptr [LCD_FB_BASE]
        mov     word ptr [LCD_FB_BASE_SAVED], ax
        ret
bc_op8e_plane_pop:
        mov     ax, word ptr [LCD_FB_BASE_SAVED]
        mov     word ptr [LCD_FB_BASE], ax
        mov     byte ptr [LCD_PLANE_PUSHED], 0
        ret
bc_op0c_clear_planes:
        mov     ax, ds
        mov     es, ax
        mov     di, LCD_PLANE_A
        call    L_13CF1
        mov     di, LCD_PLANE_B
        call    L_13CF1
        mov     di, LCD_PLANE_C
L_13CF1:
        mov     cx, 3c0h
        sub     ax, ax
        rep stosw
        mov     word ptr [LCD_HILITE_POS], ax
        mov     word ptr [LCD_HILITE_SIZE], ax
L_13CFE:
        call    bc_op04_plane_a
        ret
bc_opae_clear_plane_c:
        mov     ax, ds
        mov     es, ax
        mov     di, LCD_PLANE_C
        mov     cx, 3c0h
        sub     ax, ax
        rep stosw
        mov     word ptr [LCD_HILITE_POS], ax
        mov     word ptr [LCD_HILITE_SIZE], ax
        ret
bc_op88_clear_planes_660:
        mov     ax, ds
        mov     es, ax
        mov     di, LCD_PLANE_A
        call    L_13D2A
        mov     di, LCD_PLANE_B
        call    L_13D2A
        mov     di, LCD_PLANE_C
L_13D2A:
        mov     cx, 330h
        sub     ax, ax
        rep stosw
        mov     word ptr [LCD_HILITE_POS], ax
        mov     word ptr [LCD_HILITE_SIZE], ax
        ret
bc_op68_soft_keys:
        call    lcd_command
        mov     al, byte ptr es:[bp]
        inc     bp
        or      al, al
        jne     br_13D45
        ret
br_13D45:
        cmp     al, 7
        jb      L_13D4A
        ret
L_13D4A:
        dec     al
        mov     ah, byte ptr es:[bp]
        inc     bp
L_13D51:
        call    fn_13D8A
L_13D54:
        call    L_13D5B
L_13D57:
        call    bc_op8e_plane_pop
        ret
L_13D5B:
        push    ax
L_13D5C:
        call    bc_op04_plane_a
        mov     ah, 0
        call    L_13D8D
        mov     si, bp
        sub     bx, bx
        dec     bl
        dec     si
L_13D6B:
        inc     si
        inc     bl
L_13D6E:
        cmp     byte ptr es:[si], 0
        jne     L_13D6B
        mov     cl, byte ptr cs:[bx+SOFTKEY_CENTER_TABLE]
        mov     bl, al
        add     cl, byte ptr cs:[bx+softkey_x_table]
        mov     ch, 34h
        call    lcd_validate_coords
        call    bc_puts_stream
        pop     ax
        ret
fn_13D8A:
        call    bc_op08_plane_c
L_13D8D:
        push    ax
        push    bp
        push    es
L_13D90:
        call    softkey_draw_slot
        pop     es
        pop     bp
        pop     ax
        ret
softkey_draw_slot:
        mov     bl, al
        sub     bh, bh
        mov     cl, byte ptr cs:[bx+softkey_x_table]
        mov     ch, 33h
        mov     bl, 27h
        mov     bh, 9
        push    ax
        push    bx
        push    cx
        call    lcd_clear_rect
        pop     cx
        pop     bx
        pop     ax
        cmp     ah, 1
L_13DB2:
        jne     L_13DB7
        jmp     lcd_rect_outline
L_13DB7:
        cmp     ah, 2
L_13DBA:
        jne     L_13DBF
        jmp     NEAR lcd_fill_rect_checked
L_13DBF:
        ret
softkey_x_table:
; SOFTKEY_X_TABLE (6 bytes) then SOFTKEY_CENTER_TABLE (7 bytes), CS:3F40h --
; byte-identical to v1.50's copy at CS:3F5Eh.
        db      02h, 2bh, 54h, 7dh, 0a6h, 0cfh, 14h, 11h, 0eh, 0bh, 08h, 05h, 02h
bc_op6a_soft_keys_redraw_all:
        call    lcd_command
        mov     al, 0
L_13DD2:
        call    L_13D5B
        inc     al
        cmp     al, 6
        jne     L_13DD2
L_13DDB:
        call    bc_op8e_plane_pop
        ret
bc_op6c_soft_keys_styled:
        call    lcd_command
        mov     al, 0
L_13DE4:
        mov     ah, byte ptr es:[bp]
        inc     bp
L_13DE9:
        call    fn_13D8A
        inc     al
        cmp     al, 6
        jne     L_13DE4
L_13DF2:
        call    bc_op8e_plane_pop
        ret
bc_op30_no_or_yes:
        mov     si, P_3F9F
        jmp     SHORT L_13DFE
bc_op1c_off_or_on:
        mov     si, str_off_on
L_13DFE:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        add     bp, 2
        mov     ah, 4
        mov     dx, cs
        or      al, al
L_13E0F:
        je      L_13E14
        add     si, 4
L_13E14:
        jmp     NEAR bc_op14_puts_far
str_off_on:
        db      "OFF ^ON^^NO^YES "
bc_op1e_display:
        push    bp
        push    es
L_13E29:
        call    lcd_command
        push    dx
        push    si
        mov     word ptr [LCD_FB_BASE], LCD_PLANE_E
L_13E34:
        BC_CLEAR_RECT 38, 5, 174, 7
L_13E3B:
        pop     si
        pop     dx
        mov     cl, 26h
        mov     ch, 5
        mov     ah, 1ah
L_13E43:
        call    bc_op14_puts_far
L_13E46:
        call    bc_op8e_plane_pop
        mov     byte ptr [LCD_MSG_OVERLAY], 1
L_13E4E:
        call    lcd_refresh_dispatch
        pop     es
        pop     bp
        ret
bc_op20_print:
        call    lcd_command
        push    es
        push    bp
        mov     word ptr [LCD_FB_BASE], LCD_PLANE_E
L_13E5F:
        BC_CLEAR_RECT 38, 5, 174, 7
L_13E66:
        mov     cl, 26h
        mov     ch, 5
        call    lcd_validate_coords
        pop     bp
        pop     es
        call    bc_puts_stream
L_13E72:
        call    bc_op8e_plane_pop
        mov     byte ptr [LCD_MSG_OVERLAY], 1
L_13E7A:
        call    lcd_refresh_dispatch
        ret
bc_opa0_status_line_far_string:
        call    lcd_command
        push    bp
        push    si
        push    dx
        mov     word ptr [LCD_FB_BASE], LCD_PLANE_E
L_13E8A:
        BC_CLEAR_RECT 38, 5, 174, 7
L_13E91:
        mov     cl, 26h
        mov     ch, 5
        call    lcd_validate_coords
        pop     dx
        pop     si
        pop     bp
        mov     ah, 1dh
        mov     es, dx
        call    L_13FB9
L_13EA2:
        call    bc_op8e_plane_pop
        mov     byte ptr [LCD_MSG_OVERLAY], 1
L_13EAA:
        call    lcd_refresh_dispatch
        ret
L_13EAE:
        push    bp
L_13EAF:
        call    lcd_select_plane_d
L_13EB2:
        BC_LCD_BITMAP 28, 0, "ABBBBBBBBBBC" ; dialog top border
L_13EC4:
        call    bc_op0a_plane_e
L_13EC7:
        BC_LCD_BITMAP 28, 0, "DEEEEEEEEEEF" ; dialog middle
L_13ED9:
        pop     bp
        ret
bc_op22_message_close:
        mov     byte ptr [LCD_MSG_OVERLAY], 0
L_13EE0:
        call    lcd_refresh_dispatch
        ret
bc_op28_message_cancel_go:
        call    bc_op20_print
        mov     byte ptr [LCD_PROMPT_ROW], 1
L_13EEC:
        call    lcd_command
L_13EEF:
        call    lcd_select_plane_f
L_13EF2:
        PANE_CANCEL_GO_BAR
status_go_13f1b:
        call    bc_op8e_plane_pop
        ret
bc_op24_prompt_row:
        mov     byte ptr [LCD_PROMPT_ROW], 1
L_13F24:
        call    lcd_command
L_13F27:
        call    lcd_select_plane_f
L_13F2A:
        BC_CLEAR_RECT 0, 0, 248, 9
L_13F31:
        mov     cl, 0
        mov     ch, 1
        call    lcd_validate_coords
        call    bc_puts_stream
L_13F3B:
        call    bc_op8e_plane_pop
        ret
bc_op26_clear_prompt_flags:
        mov     byte ptr [LCD_PROMPT_ROW], 0
L_13F44:
        mov     byte ptr [LCD_MSG_OVERLAY], 0
        ret
bc_op92_put_hex:
        push    ax
        push    cx
        mov     si, P_40EE
        mov     bl, al
        sub     bh, bh
        shr     bl, 4
L_13F56:
        mov     al, byte ptr cs:[bx+si]
L_13F59:
        call    bc_op94_putchar
        pop     cx
        pop     ax
        add     cl, 6
        mov     bl, al
        and     bl, 0fh
        sub     bh, bh
        mov     al, byte ptr cs:[bx+si]
        jmp     SHORT bc_op94_putchar
L_13F6D:
        ret
        db      "0123456789ABCDEF"
bc_op90_put_hex_high:
        push    ax
        push    cx
        mov     al, ah
L_13F82:
        call    bc_op92_put_hex
        pop     cx
        pop     ax
        add     cl, 0ch
        jmp     SHORT bc_op92_put_hex
bc_op94_putchar:
        call    lcd_validate_coords
        jmp     NEAR font_draw_char
bc_op16_text_from_table:
        call    lcd_read_coords
        mov     si, word ptr es:[bp]
        add     bp, 2
        mov     al, byte ptr [si]
        mov     si, word ptr es:[bp]
        add     bp, 2
        mov     ah, byte ptr [si]
        inc     si
        push    ax
        mul     ah
        add     si, ax
        mov     ax, ds
        mov     es, ax
        pop     ax
        jmp     L_13FB9
bc_op14_puts_far:
        mov     es, dx
        call    lcd_validate_coords
L_13FB9:
        mov     al, byte ptr es:[si]
        inc     si
        or      al, al
L_13FBF:
        jne     calls_font_char_lookup_13fc2
        ret
calls_font_char_lookup_13fc2:
        push    ax
        push    es
        call    font_draw_char
        pop     es
        pop     ax
        dec     ah
        jne     L_13FB9
        ret
bc_op18_puts_counted:
        push    dx
L_13FCF:
        call    lcd_read_coords
        mov     ah, byte ptr es:[bp]
        inc     bp
        pop     es
        jmp     L_13FB9
bc_op1a_text_from_ds_ptr:
        call    lcd_read_coords
        mov     si, word ptr es:[bp]
        inc     bp
        inc     bp
L_13FE3:
        lodsb
        or      al, al
calls_font_char_lookup_13fe6:
        jne     L_13FE9
        ret
L_13FE9:
        call    font_draw_char
        jmp     SHORT L_13FE3
bc_op2e_text_from_table_nul:
        call    lcd_read_coords
        mov     si, word ptr es:[bp]
        add     bp, 2
        mov     al, byte ptr [si]
        mov     si, word ptr es:[bp]
        add     bp, 2
        mov     ah, byte ptr [si]
        inc     si
        push    ax
        mul     ah
        add     si, ax
        pop     ax
L_1400A:
        mov     al, byte ptr [si]
        inc     si
        or      al, al
L_1400F:
        jne     L_14012
        ret
L_14012:
        push    ax
        push    es
        push    si
        call    font_draw_char_small
        pop     si
        pop     es
        pop     ax
        dec     ah
        jne     L_1400A
        ret
bc_op2c_text_shaded:
        mov     byte ptr [LCD_ATTR], 0e0h
L_14025:
        call    bc_op2a_text_small
        mov     byte ptr [LCD_ATTR], 0
        ret
bc_op2a_text_small:
        call    lcd_read_coords
L_14031:
        mov     al, byte ptr es:[bp]
        inc     bp
        cmp     al, 0
L_14038:
        jne     br_1403B
        ret
br_1403B:
        call    font_draw_char_small
        jmp     SHORT L_14031
font_draw_char_small:
        sub     al, 20h
        push    cx
        push    di
        push    si
        mov     ch, 5
        mul     ch
        mov     si, P_6A62
        add     si, ax
        mov     bl, cl
        sub     bh, bh
        shl     bx, 1
        mov     dx, word ptr cs:[bx+p_4209]
L_14059:
        mov     ah, byte ptr [di]
        mov     al, byte ptr [di+1]
        and     ax, dx
        mov     bh, byte ptr [si]
        xor     bh, byte ptr [LCD_ATTR]
        sub     bl, bl
        shr     bx, cl
        or      ax, bx
L_1406C:
        mov     byte ptr [di], ah
        mov     byte ptr [di+1], al
        inc     si
        add     di, 20h
        dec     ch
        jne     L_14059
        pop     si
        pop     di
        pop     cx
        add     cl, 4
        cmp     cl, 8
L_14082:
        jb      L_14088
        sub     cl, 8
        inc     di
L_14088:
        ret
p_4209:
        db      0ffh, 1fh, 0ffh, 8fh, 0ffh, 0c7h, 0ffh, 0e3h, 0ffh, 0f1h, 0ffh, 0f8h, 7fh, 0fch, 3fh, 0feh
bc_opaa_lcd_attr_fc:
        mov     byte ptr [LCD_ATTR], 0fch
        ret
bc_opac_lcd_attr_0:
        mov     byte ptr [LCD_ATTR], 0
        ret
bc_op10_text_inverse:
        mov     byte ptr [LCD_ATTR], 0fch
L_140AA:
        call    bc_op0e_text
        mov     byte ptr [LCD_ATTR], 0
        ret
bc_op0e_text:
        call    lcd_read_coords
bc_puts_stream:
        mov     al, byte ptr es:[bp]
        inc     bp
        or      al, al
calls_font_char_lookup_140bd:
        jne     calls_font_char_lookup_140c0
        ret
calls_font_char_lookup_140c0:
        call    font_draw_char
        jmp     SHORT bc_puts_stream
bc_op78_text_at_pen:
        mov     cl, byte ptr [LCD_PEN_X]
        mov     ch, byte ptr [LCD_PEN_Y]
        call    lcd_validate_coords
L_140D0:
        mov     al, byte ptr es:[bp]
        inc     bp
        or      al, al
calls_font_char_lookup_140d7:
        jne     calls_font_char_lookup_140da
        ret
calls_font_char_lookup_140da:
        call    font_draw_char
        cmp     al, 5eh
        add     byte ptr [LCD_PEN_X], 3
        je      L_140D0
        add     byte ptr [LCD_PEN_X], 3
        jmp     SHORT L_140D0
bc_op32_num1:
        sub     ah, ah
L_140EF:
        call    lcd_read_coords
put_digit_last:
        mov     byte ptr [LCD_NUM_NONBLANK], 1
        jmp     NEAR put_digit_blanked
bc_op34_num2:
        sub     ah, ah
L_140FC:
        call    lcd_read_coords
put_digits_2:
        mov     byte ptr [LCD_NUM_NONBLANK], 0
        sub     ah, ah
L_14106:
        call    put_digit_tens
        jmp     SHORT put_digit_last
bc_op36_num3:
        call    lcd_read_coords
put_digits_3:
        mov     byte ptr [LCD_NUM_NONBLANK], 0
L_14113:
        call    put_digit_hundreds
L_14116:
        call    put_digit_tens
        jmp     SHORT put_digit_last
bc_op38_num4:
        call    lcd_read_coords
put_digits_4:
        mov     byte ptr [LCD_NUM_NONBLANK], 0
L_14123:
        call    put_digit_thousands
        jmp     SHORT L_14113
L_14128:
        push    dx
L_14129:
        call    lcd_read_coords
        pop     dx
put_digits_5:
        mov     byte ptr [LCD_NUM_NONBLANK], 0
        mov     bx, ax
        mov     si, dx
        sub     bx, 86a0h
        sbb     si, 1
        jb      L_14145
        mov     ax, 869fh
        mov     dx, 1
L_14145:
        mov     bx, 2710h
        call    put_digit_radix
        jmp     SHORT L_14123
bc_op3a_num6:
        push    dx
L_1414E:
        call    lcd_read_coords
        pop     dx
put_digits_6:
        mov     byte ptr [LCD_NUM_NONBLANK], 0
loop_14157:
        mov     bx, ax
        mov     si, dx
        sub     bx, 4240h
        sbb     si, 0fh
        jb      br_1416A
        mov     ax, 423fh
        mov     dx, 0fh
br_1416A:
        push    di
        push    si
        mov     si, 86a0h
        mov     di, 1
        mov     bl, 0ffh
L_14174:
        inc     bl
L_14176:
        sub     ax, si
        sbb     dx, di
        jae     L_14174
        add     ax, si
        adc     dx, di
        pop     si
        pop     di
        push    ax
        push    dx
        mov     al, bl
L_14186:
        call    put_digit_blanked
        pop     dx
        pop     ax
        jmp     SHORT L_14145

bc_op48_num7:
        push    dx
L_1418E:
        call    lcd_read_coords
        pop     dx
put_digits_7:
        mov     byte ptr [LCD_NUM_NONBLANK], 0

loop_14197:
        mov     bx, ax
        mov     si, dx
        sub     bx, 9680h
        sbb     si, 98h
        jb      br_141AB
        mov     ax, 967fh
        mov     dx, 98h
br_141AB:
        push    di
        push    si
        mov     si, 4240h
        mov     di, 0fh
        mov     bl, 0ffh
L_141B5:
        inc     bl
L_141B7:
        sub     ax, si
        sbb     dx, di
        jae     L_141B5
        add     ax, si
        adc     dx, di
        pop     si
        pop     di
        push    ax
        push    dx
        mov     al, bl
L_141C7:
        call    put_digit_blanked
        pop     dx
        pop     ax
        jmp     loop_14157
bc_op4a_num8:
        push    dx
L_141CF:
        call    lcd_read_coords
        pop     dx
put_digits_8:
        mov     byte ptr [LCD_NUM_NONBLANK], 0
        mov     bx, ax
        mov     si, dx
        sub     bx, 0e100h
        sbb     si, 5f5h
        jb      br_141EC
        mov     ax, 0e0ffh
        mov     dx, 5f5h
br_141EC:
        push    di
        push    si
        mov     si, 9680h
        mov     di, 98h
        mov     bl, 0ffh
L_141F6:
        inc     bl
L_141F8:
        sub     ax, si
        sbb     dx, di
        jae     L_141F6
        add     ax, si
        adc     dx, di
        pop     si
        pop     di
        push    ax
        push    dx
        mov     al, bl
L_14208:
        call    put_digit_blanked
        pop     dx
        pop     ax
        jmp     loop_14197
bc_op44_num2_padded:
        call    lcd_read_coords
put_number_2digit:
        mov     byte ptr [LCD_NUM_NONBLANK], 1
        sub     ah, ah
L_14219:
        call    put_digit_tens
        jmp     NEAR put_digit_last
bc_op46_num3_padded:
        call    lcd_read_coords
        mov     byte ptr [LCD_NUM_NONBLANK], 1
L_14227:
        call    put_digit_hundreds
L_1422A:
        call    put_digit_tens
        jmp     NEAR put_digit_last
bc_op42_num3_at_pen:
        call    lcd_validate_coords
        jmp     NEAR put_digits_3
bc_op3c_num2_right:
        sub     ah, ah
L_14238:
        call    lcd_read_coords
L_1423B:
        sub     ah, ah
        cmp     al, 0ah
L_1423F:
        jb      L_14244
        jmp     NEAR put_digits_2
L_14244:
        add     cl, 3
        cmp     cl, 8
L_1424A:
        jae     L_1424F
        jmp     NEAR put_digit_last
L_1424F:
        sub     cl, 8
        inc     di
L_14253:
        jmp     NEAR put_digit_last
bc_op3e_num3_right:
        call    lcd_read_coords
L_14259:
        cmp     ax, 64h
L_1425C:
        jb      L_14261
        jmp     NEAR put_digits_3
L_14261:
        add     cl, 3
        cmp     cl, 8
        jb      L_1423B
        sub     cl, 8
        inc     di
L_1426D:
        jmp     SHORT L_1423B
bc_op40_num4_right:
        call    lcd_read_coords
        cmp     ax, 3e8h
L_14275:
        jb      L_1427A
        jmp     NEAR put_digits_4
L_1427A:
        add     cl, 3
        cmp     cl, 8
        jb      L_14259
        sub     cl, 8
        inc     di
L_14286:
        jmp     SHORT L_14259
bc_op4c_num3_cells:
        db      3dh, 64h, 00h
L_1428B:
        jae     br_142A4
        add     cl, 3
        cmp     ax, 0ah
L_14293:
        jae     br_1429E
        add     cl, 3
        call    lcd_validate_coords
        jmp     NEAR put_digit_last
br_1429E:
        call    lcd_validate_coords
        jmp     NEAR put_digits_2
br_142A4:
        call    lcd_validate_coords
        jmp     NEAR put_digits_3
put_digit_thousands:
        mov     bx, 3e8h
        jmp     SHORT br_142B7
put_digit_hundreds:
        mov     bx, 64h
        jmp     SHORT br_142B7
put_digit_tens:
        mov     bx, 0ah
br_142B7:
        sub     dx, dx
put_digit_radix:
        div     bx
        push    dx
        call    put_digit_blanked
        pop     ax
        ret
put_digit_blanked:
        or      byte ptr [LCD_NUM_NONBLANK], al
        cmp     byte ptr [LCD_NUM_NONBLANK], 0
        jne     jmp_font_char_lookup_142d0
        mov     al, 20h
        jmp     SHORT font_draw_char
jmp_font_char_lookup_142d0:
        or      al, 30h
        jmp     SHORT font_draw_char
bc_op7a_num2_padded_at_pen:
        call    lcd_pen_to_di
        jmp     NEAR put_digit_last
bc_op7c_num2_at_pen:
        call    lcd_pen_to_di
        jmp     NEAR put_digits_2
bc_op7e_num3_at_pen:
        call    lcd_pen_to_di
        jmp     NEAR put_digits_3
bc_op80_num4_at_pen:
        call    lcd_pen_to_di
        jmp     NEAR put_digits_4
bc_opb0_num6_at_pen:
        push    dx
L_142ED:
        call    lcd_pen_to_di
        pop     dx
        jmp     NEAR put_digits_5
lcd_pen_to_di:
        mov     cl, byte ptr [LCD_PEN_X]
        mov     ch, byte ptr [LCD_PEN_Y]
        jmp     NEAR lcd_validate_coords
bc_opb8_field_3cell:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     bl, 12h
        mov     bh, 7
        pusha
        push    es
        call    lcd_clear_rect
        pop     es
        popa
        mov     ah, 0
        sub     al, 1
L_14316:
        jb      br_1431B
        jmp     NEAR bc_op3e_num3_right
br_1431B:
        call    lcd_read_coords
        mov     al, 4fh
        call    font_draw_char
        mov     al, 46h
        call    font_draw_char
        mov     al, 46h
        call    font_draw_char
        ret

font_draw_char:
        or      al, al
        jns     font_char_lookup
        mov     al, 2ah

font_char_lookup:
        mov     ch, 7
        push    ax
        push    es
        push    si
        push    cx
        push    di
        mul     ch
        mov     si, LCD_FONT
        add     si, ax
        mov     bl, cl
        sub     bh, bh
        shl     bx, 1
        mov     dx, word ptr cs:[bx+P_450D]
L_1434D:
        mov     ah, byte ptr [di]
        mov     al, byte ptr [di+1]
        and     ax, dx
        mov     bl, byte ptr [si]
        sub     bh, bh
        mov     bh, byte ptr cs:[bx+P_451D]
        xor     bh, byte ptr [LCD_ATTR]
        sub     bl, bl
        shr     bx, cl
        or      ax, bx
L_14367:
        mov     byte ptr [di], ah
        mov     byte ptr [di+1], al
        inc     si
        add     di, 20h
        dec     ch
        jne     L_1434D
        pop     di
        pop     cx
        pop     si
        pop     es
        pop     ax
        add     cl, 3
        cmp     al, 5eh
        je      L_14383
        add     cl, 3
L_14383:
        cmp     cl, 8
L_14386:
        jb      br_1438C
        sub     cl, 8
        inc     di
br_1438C:
        ret
        db      0ffh, 03h, 0ffh, 81h, 0ffh, 0c0h, 7fh, 0e0h, 3fh, 0f0h, 1fh, 0f8h, 0fh, 0fch, 07h, 0feh
        db      00h, 80h, 40h, 0c0h, 20h, 0a0h, 60h, 0e0h, 10h, 90h, 50h, 0d0h, 30h, 0b0h, 70h, 0f0h
        db      08h, 88h, 48h, 0c8h, 28h, 0a8h, 68h, 0e8h, 18h, 98h, 58h, 0d8h, 38h, 0b8h, 78h, 0f8h
        db      04h, 84h, 44h, 0c4h, 24h, 0a4h, 64h, 0e4h, 14h, 94h, 54h, 0d4h, 34h, 0b4h, 74h, 0f4h
        db      0ch, 8ch, 4ch, 0cch, 2ch, 0ach, 6ch, 0ech, 1ch, 9ch, 5ch, 0dch, 3ch, 0bch, 7ch, 0fch
        db      02h, 82h, 42h, 0c2h, 22h, 0a2h, 62h, 0e2h, 12h, 92h, 52h, 0d2h, 32h, 0b2h, 72h, 0f2h
        db      0ah, 8ah, 4ah, 0cah, 2ah, 0aah, 6ah, 0eah, 1ah, 9ah, 5ah, 0dah, 3ah, 0bah, 7ah, 0fah
        db      06h, 86h, 46h, 0c6h, 26h, 0a6h, 66h, 0e6h, 16h, 96h, 56h, 0d6h, 36h, 0b6h, 76h, 0f6h
        db      0eh, 8eh, 4eh, 0ceh, 2eh, 0aeh, 6eh, 0eeh, 1eh, 9eh, 5eh, 0deh, 3eh, 0beh, 7eh, 0feh
        db      01h, 81h, 41h, 0c1h, 21h, 0a1h, 61h, 0e1h, 11h, 91h, 51h, 0d1h, 31h, 0b1h, 71h, 0f1h
        db      09h, 89h, 49h, 0c9h, 29h, 0a9h, 69h, 0e9h, 19h, 99h, 59h, 0d9h, 39h, 0b9h, 79h, 0f9h
        db      05h, 85h, 45h, 0c5h, 25h, 0a5h, 65h, 0e5h, 15h, 95h, 55h, 0d5h, 35h, 0b5h, 75h, 0f5h
        db      0dh, 8dh, 4dh, 0cdh, 2dh, 0adh, 6dh, 0edh, 1dh, 9dh, 5dh, 0ddh, 3dh, 0bdh, 7dh, 0fdh
        db      03h, 83h, 43h, 0c3h, 23h, 0a3h, 63h, 0e3h, 13h, 93h, 53h, 0d3h, 33h, 0b3h, 73h, 0f3h
        db      0bh, 8bh, 4bh, 0cbh, 2bh, 0abh, 6bh, 0ebh, 1bh, 9bh, 5bh, 0dbh, 3bh, 0bbh, 7bh, 0fbh
        db      07h, 87h, 47h, 0c7h, 27h, 0a7h, 67h, 0e7h, 17h, 97h, 57h, 0d7h, 37h, 0b7h, 77h, 0f7h
        db      0fh, 8fh, 4fh, 0cfh, 2fh, 0afh, 6fh, 0efh, 1fh, 9fh, 5fh, 0dfh, 3fh, 0bfh, 7fh, 0ffh
bc_op12_box_chars:
        call    lcd_read_coords
L_144A0:
        mov     al, byte ptr es:[bp]
        inc     bp
        cmp     al, 0
        jne     L_144AA
        ret
L_144AA:
        sub     al, 41h
L_144AC:
        call    L_144B1
        jmp     SHORT L_144A0
L_144B1:
        push    di
        mov     ah, 22h
        mul     ah
        mov     si, D_6B89
        add     si, ax
        mov     ch, 11h
L_144BD:
        push    cx
        mov     bl, cl
        shl     bl, 1
        add     bl, cl
        sub     bh, bh
        add     bx, L_14515
        mov     ch, byte ptr cs:[bx]
        mov     cl, byte ptr cs:[bx+1]
        mov     dl, byte ptr cs:[bx+2]
        mov     ah, byte ptr [di]
        mov     al, byte ptr [di+1]
        mov     dh, byte ptr [di+2]
        and     ax, cx
        and     dh, dl
        pop     cx
        mov     bx, word ptr [si]
        mov     dl, bl
        shr     bx, cl
        or      ax, bx
L_144EA:
        mov     byte ptr [di], ah
        mov     byte ptr [di+1], al
        mov     bh, dl
        mov     bl, 0
        shr     bx, cl
        or      dh, bl
        mov     byte ptr [di+2], dh
        add     di, 20h
        add     si, 2
        dec     ch
        jne     L_144BD
        pop     di
        add     cl, 10h
        mov     al, cl
        and     cl, 7
        shr     al, 3
        sub     ah, ah
        add     di, ax
        ret
L_14515:
        db      00h, 00h, 0ffh, 80h, 00h, 7fh, 0c0h, 00h, 3fh, 0e0h, 00h, 1fh, 0f0h, 00h, 0fh, 0f8h
        db      00h, 07h, 0fch, 00h, 03h, 0feh, 00h, 01h
bc_op50_hline:
        call    lcd_read_coords
        mov     bl, byte ptr es:[bp]
        inc     bp
lcd_hline_set:
        mov     ax, ds
        mov     es, ax
        or      bl, bl
        je      L_14565
        cmp     bl, 9
        jb      L_14566
        mov     al, 0ffh
        shr     al, cl
        or      byte ptr [di], al
        inc     di
        xor     cl, 7
        inc     cl
        sub     bl, cl
        mov     cl, bl
        shr     cl, 3
        je      br_1455B
        mov     al, 0ffh
        rep stosb
br_1455B:
        and     bx, 7
        mov     al, byte ptr cs:[bx+p_46f7]
        or      byte ptr [di], al
L_14565:
        ret
L_14566:
        sub     bh, bh
        mov     ah, byte ptr cs:[bx+p_46f7]
        sub     al, al
        shr     ax, cl
        or      byte ptr [di], ah
        inc     di
        or      byte ptr [di], al
        ret
p_46f7:
        db      00h, 80h, 0c0h, 0e0h, 0f0h, 0f8h, 0fch, 0feh, 0ffh
lcd_hline_set_at:
        push    bx
        call    lcd_validate_coords
        pop     bx
        jmp     SHORT lcd_hline_set
bc_op54_hline_dotted:
        call    lcd_read_coords
        mov     bl, byte ptr es:[bp]
        inc     bp
lcd_hline_dotted:
        mov     ax, ds
        mov     es, ax
        or      bl, bl
        je      L_145BE
        cmp     bl, 9
        jb      br_145BF
        mov     ax, 0aaaah
        shr     ax, cl
        or      byte ptr [di], ah
        inc     di
        xor     cl, 7
        inc     cl
        sub     bl, cl
        mov     cl, bl
        shr     cl, 3
        je      br_145B4
        rep stosb
br_145B4:
        and     bx, 7
        and     al, byte ptr cs:[bx+p_46f7]
        or      byte ptr [di], al
L_145BE:
        ret
br_145BF:
        sub     bh, bh
        mov     ah, 0aah
        and     ah, byte ptr cs:[bx+p_46f7]
        sub     al, al
        shr     ax, cl
        or      byte ptr [di], ah
        inc     di
        or      byte ptr [di], al
        ret
lcd_hline_dotted_at:
        push    bx
        call    lcd_validate_coords
        pop     bx
        jmp     SHORT lcd_hline_dotted
bc_op58_hline_clear:
        call    lcd_read_coords
        mov     bl, byte ptr es:[bp]
        inc     bp
lcd_hline_clear:
        mov     ax, ds
        mov     es, ax
        or      bl, bl
        je      L_14615
        cmp     bl, 9
        jb      L_14616
        mov     al, 0ffh
        shr     al, cl
        not     al
        and     byte ptr [di], al
        inc     di
        xor     cl, 7
        inc     cl
        sub     bl, cl
        mov     cl, bl
        shr     cl, 3
        je      br_14609
        sub     al, al
        rep stosb
br_14609:
        and     bx, 7
        mov     al, byte ptr cs:[bx+p_46f7]
        not     al
        and     byte ptr [di], al
L_14615:
        ret
L_14616:
        sub     bh, bh
        mov     ah, byte ptr cs:[bx+p_46f7]
        sub     al, al
        shr     ax, cl
        not     ax
        and     byte ptr [di], ah
        inc     di
        and     byte ptr [di], al
        ret
bc_op52_vline:
        call    lcd_read_coords
        mov     bl, byte ptr es:[bp]
        inc     bp
lcd_vline_set:
        mov     al, 80h
        shr     al, cl
        mov     cl, bl
        jcxz    L_14640
tgt_14639:
        or      byte ptr [di], al
        add     di, 20h
        loop    tgt_14639
L_14640:
        ret
lcd_vline_set_at:
        push    bx
        call    lcd_validate_coords
        pop     bx
        jmp     SHORT lcd_vline_set
bc_op56_vline_dotted:
        call    lcd_read_coords
        mov     bl, byte ptr es:[bp]
        inc     bp
lcd_vline_dotted:
        mov     al, 80h
        shr     al, cl
        sub     ah, ah
        mov     cl, bl
        jcxz    L_14663
        shr     cl, 1
L_1465C:
        or      byte ptr [di], al
L_1465E:
        add     di, 40h
        loop    L_1465C
L_14663:
        ret
lcd_vline_dotted_at:
        push    bx
        call    lcd_validate_coords
        pop     bx
        jmp     SHORT lcd_vline_dotted
bc_op5a_vline_clear:
        call    lcd_read_coords
        mov     bl, byte ptr es:[bp]
        inc     bp
        mov     al, 80h
        shr     al, cl
        not     al
        mov     cl, bl
        jcxz    br_14684
tgt_1467D:
        and     byte ptr [di], al
        add     di, 20h
        loop    tgt_1467D
br_14684:
        ret
bc_op4e_line:
        db      2ah, 0e4h, 26h, 8ah, 46h, 00h, 0a3h, 0f6h, 16h, 26h, 8ah, 46h, 01h, 3ch, 3ch, 72h
        db      02h, 0b0h, 3bh, 0a3h, 0f8h, 16h, 26h, 8ah, 46h, 02h, 0a3h, 0fah, 16h, 26h, 8ah, 46h
        db      03h, 3ch, 3ch, 72h, 02h, 0b0h, 3bh, 0a3h, 0fch, 16h
        if      FW_VERSION = 150
        db      0e8h
        endif
L_146AF:
        if      FW_VERSION = 172
        call    lcd_read_coords
        else
        out     4, al
        endif
        add     bp, 2
        push    bp
L_146B6:
        call    lcd_draw_line
        pop     bp
        ret
lcd_draw_line:
        mov     ax, word ptr [LCD_LINE_X1]
        sub     ax, word ptr [LCD_LINE_X0]
        jae     br_146C9
        or      ch, 1
        neg     ax
br_146C9:
        mov     dx, 20h
        mov     bx, word ptr [LCD_LINE_Y1]
        sub     bx, word ptr [LCD_LINE_Y0]
        jae     L_146DD
        neg     dx
        neg     bx
        or      ch, 2
L_146DD:
        mov     word ptr [LCD_LINE_Y0], dx
        cmp     ax, bx
L_146E3:
        jb      L_14728
        mov     si, ax
        shl     bx, 1
        mov     bp, bx
        sub     bx, ax
        mov     dx, bx
        sub     bx, ax
L_146F1:
        push    bx
        mov     bx, D_16FF
        mov     al, cl
        xlat
        pop     bx
        or      byte ptr [di], al
        test    ch, 1
L_146FE:
        jne     br_1470C
        inc     cl
        cmp     cl, 8
        jne     L_14714
        sub     cl, cl
        inc     di
        jmp     SHORT L_14714
br_1470C:
        sub     cl, 1
        jae     L_14714
        mov     cl, 7
        dec     di
L_14714:
        or      dx, dx
L_14716:
        jns     br_1471E
        add     dx, bp
        dec     si
        jne     L_146F1
        ret
br_1471E:
        add     di, word ptr [LCD_LINE_Y0]
        add     dx, bx
        dec     si
        jne     L_146F1
        ret
L_14728:
        mov     si, bx
        shl     ax, 1
        mov     bp, ax
        sub     ax, bx
L_14730:
        mov     dx, ax
        sub     ax, bx
L_14734:
        mov     bx, ax
loop_14736:
        push    bx
        mov     bx, D_16FF
        mov     al, cl
        xlat
        pop     bx
        or      byte ptr [di], al
        add     di, word ptr [LCD_LINE_Y0]
        or      dx, dx
        jns     L_1474E
        add     dx, bp
        dec     si
        jne     loop_14736
        ret
L_1474E:
        test    ch, 0ch
L_14751:
        jne     br_1475F
        inc     cl
        cmp     cl, 8
        jne     L_14767
        sub     cl, cl
        inc     di
        jmp     SHORT L_14767
br_1475F:
        sub     cl, 1
        jae     L_14767
        mov     cl, 7
        dec     di
L_14767:
        add     dx, bx
        dec     si
        jne     loop_14736
        ret
bc_op5c_rect_outline:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        call    lcd_validate_coords
        mov     bl, byte ptr es:[bp+2]
        push    es
        call    lcd_hline_set
        pop     es
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        add     ch, byte ptr es:[bp+3]
        dec     ch
        and     ch, 3fh
        call    lcd_validate_coords
        mov     bl, byte ptr es:[bp+2]
        push    es
        call    lcd_hline_set
        pop     es
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        call    lcd_validate_coords
        mov     bl, byte ptr es:[bp+3]
        push    es
        call    lcd_vline_set
        pop     es
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        add     cl, byte ptr es:[bp+2]
        dec     cl
        call    lcd_validate_coords
        mov     bl, byte ptr es:[bp+3]
        call    lcd_vline_set
        add     bp, 4
        ret
bc_op98_rect_outline_reg:
        mov     bx, dx
lcd_rect_outline:
        mov     byte ptr [LCD_PEN_X], cl
        mov     byte ptr [LCD_PEN_Y], ch
        mov     byte ptr [LCD_RECT_W], bl
        mov     byte ptr [LCD_RECT_H], bh
        call    lcd_validate_coords
        mov     bl, byte ptr [LCD_RECT_W]
        call    lcd_hline_set
        mov     cl, byte ptr [LCD_PEN_X]
        mov     ch, byte ptr [LCD_PEN_Y]
        add     ch, byte ptr [LCD_RECT_H]
        dec     ch
        and     ch, 3fh
        call    lcd_validate_coords
        mov     bl, byte ptr [LCD_RECT_W]
        call    lcd_hline_set
        mov     cl, byte ptr [LCD_PEN_X]
        mov     ch, byte ptr [LCD_PEN_Y]
        call    lcd_validate_coords
        mov     bl, byte ptr [LCD_RECT_H]
        call    lcd_vline_set
        mov     cl, byte ptr [LCD_PEN_X]
        mov     ch, byte ptr [LCD_PEN_Y]
        add     cl, byte ptr [LCD_RECT_W]
        dec     cl
        call    lcd_validate_coords
        mov     bl, byte ptr [LCD_RECT_H]
        call    lcd_vline_set
        ret
bc_op5e_rect_fill:
        call    lcd_read_coords
        mov     bl, byte ptr es:[bp]
        inc     bp
        mov     bh, byte ptr es:[bp]
        inc     bp
        cmp     bl, 0
L_14840:
        jne     L_14843
        ret
L_14843:
        cmp     bh, 0
L_14846:
        jne     lcd_fill_rect_rows
        ret
lcd_fill_rect_rows:
        push    bx
        push    cx
        push    di
        push    es
        call    lcd_hline_set
        pop     es
        pop     di
        pop     cx
        pop     bx
        add     di, 20h
        dec     bh
L_14859:
        jne     lcd_fill_rect_rows
        ret
bc_op9a_rect_fill_reg:
        mov     bx, dx
lcd_fill_rect_checked:
        push    bx
        call    lcd_validate_coords
        pop     bx
L_14863:
        call    lcd_fill_rect_rows
        ret
bc_op60_rect_clear:
        call    lcd_read_coords
        mov     bl, byte ptr es:[bp]
        inc     bp
        mov     bh, byte ptr es:[bp]
        inc     bp
lcd_clear_rect_rows:
        push    bx
        push    cx
        push    di
        push    es
        call    lcd_hline_clear
        pop     es
        pop     di
        pop     cx
        pop     bx
        add     di, 20h
        dec     bh
L_14884:
        jne     lcd_clear_rect_rows
        ret
bc_opb2_rect_clear_reg:
        mov     bx, dx
lcd_clear_rect:
        push    bx
        call    lcd_validate_coords
        pop     bx
        call    lcd_clear_rect_rows
        ret
bc_op62_highlight_move:
        call    lcd_command
L_14895:
        call    bc_op08_plane_c
        mov     cx, word ptr [LCD_HILITE_POS]
        mov     bx, word ptr [LCD_HILITE_SIZE]
        call    lcd_clear_rect
        mov     cx, word ptr es:[bp]
        mov     bx, word ptr es:[bp+2]
        mov     word ptr [LCD_HILITE_POS], cx
        mov     word ptr [LCD_HILITE_SIZE], bx
L_148B3:
        call    bc_op5e_rect_fill
L_148B6:
        call    bc_op8e_plane_pop
        ret
bc_op84_highlight_move_reg:
        push    dx
        push    cx
L_148BC:
        call    lcd_command
L_148BF:
        call    bc_op08_plane_c
        mov     cx, word ptr [LCD_HILITE_POS]
        mov     bx, word ptr [LCD_HILITE_SIZE]
        call    lcd_clear_rect
        pop     cx
        pop     bx
        mov     word ptr [LCD_HILITE_POS], cx
        mov     word ptr [LCD_HILITE_SIZE], bx
        call    lcd_fill_rect_checked
L_148DA:
        call    bc_op8e_plane_pop
        ret
bc_op64_highlight_move_indexed:
        call    lcd_command
L_148E1:
        call    bc_op08_plane_c
        mov     cx, word ptr [LCD_HILITE_POS]
        mov     bx, word ptr [LCD_HILITE_SIZE]
        call    lcd_clear_rect
        mov     cx, word ptr es:[bp]
        mov     bx, word ptr es:[bp+2]
        mov     di, word ptr es:[bp+4]
        mov     al, byte ptr es:[bp+6]
        add     bp, 7
        mov     ah, byte ptr [di]
        mul     ah
        add     ch, al
        mov     word ptr [LCD_HILITE_POS], cx
        mov     word ptr [LCD_HILITE_SIZE], bx
        push    bx
        call    lcd_validate_coords
        pop     bx
L_14915:
        call    lcd_fill_rect_rows
L_14918:
        call    bc_op8e_plane_pop
        ret
bc_op6e_pixel1:
        call    lcd_read_coords
        mov     al, 80h
        shr     al, cl
        or      byte ptr [di], al
        ret
bc_op70_pixel2:
        call    lcd_read_coords
        mov     ah, 0c0h
        sub     al, al
        shr     ax, cl
        xchg    ah, al
        or      word ptr [di], ax
        or      word ptr [di+20h], ax
        ret
bc_op72_pixel3:
        call    lcd_read_coords
        mov     ah, 0e0h
        sub     al, al
        shr     ax, cl
        xchg    ah, al
        or      word ptr [di], ax
        or      word ptr [di+20h], ax
        or      word ptr [di+40h], ax
        ret
bc_op74_window_frame_double:
        call    lcd_command
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     bl, byte ptr es:[bp+2]
        mov     bh, byte ptr es:[bp+3]
        push    es
L_1495F:
        call    bc_op08_plane_c
        pusha
L_14963:
        call    bc_op60_rect_clear
        popa
L_14967:
        call    bc_op06_plane_b
        pusha
L_1496B:
        call    bc_op60_rect_clear
        popa
L_1496F:
        call    bc_op04_plane_a
        pusha
L_14973:
        call    bc_op60_rect_clear
        popa
        pusha
        add     cl, 1
        add     ch, 1
        sub     bl, 2
L_14981:
        sub     bh, 2
        call    lcd_rect_outline
        popa
        pusha
        add     cl, 3
        add     ch, 3
        sub     bl, 6
L_14992:
        sub     bh, 6
        call    lcd_rect_outline
        popa
        pusha
        add     cl, 3
        add     ch, 0dh
        push    bx
        call    lcd_validate_coords
        pop     bx
        sub     bl, 6
L_149A8:
        call    lcd_hline_set
        popa
        pop     es
        add     bp, 4
        mov     si, bp
        mov     al, 0fdh
        dec     si
L_149B5:
        inc     si
        add     al, 3
        cmp     byte ptr es:[si], 0
        jne     L_149B5
        cmp     al, 0
        je      L_149D8
        sub     bl, 6
        shr     bl, 1
        sub     bl, al
        add     cl, bl
L_149CB:
        add     ch, 5
        call    lcd_validate_coords
        call    bc_puts_stream
L_149D4:
        call    bc_op8e_plane_pop
        ret
L_149D8:
        inc     bp
        inc     bp
L_149DA:
        call    bc_op8e_plane_pop
        ret
bc_op76_window_frame_rounded:
        call    lcd_command
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     bl, byte ptr es:[bp+2]
        mov     bh, byte ptr es:[bp+3]
        add     bp, 4
        push    es
L_149F5:
        call    bc_op08_plane_c
        pusha
        call    lcd_clear_rect
        popa
L_149FD:
        call    bc_op06_plane_b
        pusha
        call    lcd_clear_rect
        popa
L_14A05:
        call    bc_op04_plane_a
        pusha
        call    lcd_clear_rect
        popa
        pusha
        add     cl, 2
        sub     bl, 4
L_14A14:

        call    lcd_hline_set_at
        popa
        pusha
        add     cl, 2
        add     ch, bh
        sub     ch, 1
        sub     bl, 4
L_14A24:
        call    lcd_hline_set_at
        popa
        pusha
        add     ch, 2
        mov     bl, bh
        sub     bl, 4
L_14A31:
        call    lcd_vline_set_at
        popa
        pusha
        add     ch, 2
        add     cl, bl
L_14A3B:
        sub     cl, 1
        mov     bl, bh
        sub     bl, 4
L_14A43:
        call    lcd_vline_set_at
        popa
        pusha
        add     cl, 1
        add     ch, 1
        call    lcd_validate_coords
        mov     al, 80h
        shr     al, cl
        or      byte ptr [di], al
        popa
        pusha
        add     cl, bl
L_14A5B:
        sub     cl, 2
        add     ch, 1
        call    lcd_validate_coords
        mov     al, 80h
        shr     al, cl
        or      byte ptr [di], al
        popa
        pusha
        add     cl, 1
        add     ch, bh
        sub     ch, 2
        call    lcd_validate_coords
        mov     al, 80h
        shr     al, cl
        or      byte ptr [di], al
        popa
        pusha
        add     cl, bl
L_14A81:
        sub     cl, 2
        add     ch, bh
        sub     ch, 2
        call    lcd_validate_coords
        mov     al, 80h
        shr     al, cl
        or      byte ptr [di], al
        popa
        pusha
        add     cl, 4
        add     ch, 4
        sub     bl, 8
L_14A9D:
        sub     bh, 8
        call    lcd_rect_outline
        popa
        pusha
        add     cl, 4
        add     ch, 3
        sub     bl, 8
L_14AAE:
        call    lcd_hline_dotted_at
        popa
        pusha
        add     cl, 3
        add     ch, bh
        sub     ch, 2
        sub     bl, 5
L_14ABE:
        call    lcd_hline_dotted_at
        popa
        pusha
        add     cl, 3
        add     ch, 4
        mov     bl, bh
        sub     bl, 7
L_14ACE:
        call    lcd_vline_dotted_at
        popa
        pusha
        add     cl, bl
L_14AD5:
        sub     cl, 2
        add     ch, 3
        mov     bl, bh
        sub     bl, 5
L_14AE0:
        call    lcd_vline_dotted_at
        popa
        pop     es
        mov     si, bp
        mov     dl, 0fdh
        dec     si
L_14AEA:
        inc     si
        add     dl, 3
        cmp     byte ptr es:[si], 0
        jne     L_14AEA
        cmp     dl, 0
        je      L_14B30
        pusha
        push    es
L_14AFB:
        call    bc_op08_plane_c
L_14AFE:
        call    L_14B36
L_14B01:
        call    bc_op06_plane_b
L_14B04:
        call    L_14B36
L_14B07:
        call    bc_op04_plane_a
L_14B0A:
        call    L_14B36
        add     cl, 1ch
        sub     ch, 2
        sub     bl, 39h
L_14B16:
        mov     bh, 9
        call    lcd_rect_outline
        pop     es
        popa
        shr     bl, 1
        add     cl, bl
        sub     cl, dl
        sub     ch, 1
        call    lcd_validate_coords
        call    bc_puts_stream
L_14B2C:
        call    bc_op8e_plane_pop
        ret
L_14B30:
        inc     bp
        inc     bp
L_14B32:
        call    bc_op8e_plane_pop
        ret
L_14B36:
        pusha
        add     cl, 1ch
        sub     ch, 2
        sub     bl, 39h
L_14B40:
        mov     bh, 9
        call    lcd_clear_rect
        popa
        ret
bc_op66_blit_bitmap:
        call    lcd_read_coords
        mov     si, word ptr es:[bp]
        add     bp, 2
L_14B51:
        lodsb
        or      al, al
L_14B54:
        jne     br_14B57
        ret
br_14B57:
        mov     bl, al
        sub     bh, bh
        lodsb
        mov     ch, al
L_14B5E:
        push    bx
L_14B5F:
        lodsb
        mov     ah, al
        sub     al, al
        shr     ax, cl
L_15414:
        or      byte ptr [di], ah
        or      byte ptr [di+1], al
        inc     di
        dec     bl
L_14B6E:
        jne     L_14B5F
        pop     bx
        add     di, 20h
        sub     di, bx
        dec     ch
        jne     L_14B5E
        ret
bc_op86_blit_bitmap_indexed:
        call    lcd_read_coords
        mov     si, word ptr es:[bp]
        add     bp, 2
        mov     al, byte ptr [si]
        mov     si, word ptr es:[bp]
        add     bp, 2
        sub     ah, ah
        shl     ax, 1
        add     si, ax
        mov     si, word ptr [si]
        jmp     SHORT L_14B51
lcd_read_coords:
        mov     cl, byte ptr es:[bp]
        inc     bp
        mov     ch, byte ptr es:[bp]
        inc     bp
lcd_validate_coords:
        mov     dx, ax
        cmp     cl, 0f8h
        jb      br_14BAB
        mov     cl, 0
br_14BAB:
        cmp     ch, 3ch
        jb      L_14BB2
        mov     ch, 0
L_14BB2:
        mov     bl, cl
        and     cl, 7
        shr     bl, 3
        sub     bh, bh
        mov     al, 20h
        mul     ch
        add     ax, bx
L_14BC2:
        add     ax, word ptr [LCD_FB_BASE]
        mov     di, ax
        sub     ch, ch
        mov     ax, dx
        ret
isr_int2e:
        sti
L_14BCE:
        push    ds
        mov     ax, DATA_SEG
        mov     ds, ax
int2e_subop_dispatch:
        sub     ah, ah
        mov     al, byte ptr es:[bp]
        cmp     al, 0
        je      L_14BED
        shl     ax, 1
        inc     bp
        mov     di, TBL_INT2E_RESOURCE_CMD
        add     di, ax
        push    es
        call    word ptr cs:[di]
        pop     es
        jmp     SHORT int2e_subop_dispatch
        if      FW_VERSION = 150
L_1549B:
        endif
L_14BED:
        pop     ds
        iret
TBL_INT2E_RESOURCE_CMD:
        dw      bc_op0c_clear_planes, bc_op0c_clear_planes, bc_op04_plane_a, bc_op06_plane_b
        dw      bc_op08_plane_c, lcd_refresh_dispatch, L_14C61, bc_op0e_text
        dw      bc_op10_text_inverse, bc_op2a_text_small, bc_op2c_text_shaded, bc_op50_hline
        dw      bc_op54_hline_dotted, bc_op58_hline_clear, bc_op52_vline, bc_op56_vline_dotted
        dw      bc_op5a_vline_clear, bc_op5c_rect_outline, bc_op5e_rect_fill, bc_op60_rect_clear
        dw      bc_op62_highlight_move, L_14C67, L_14C79, L_14C8D
        dw      bc_op20_print, bc_op22_message_close, bc_op68_soft_keys, bc_op6e_pixel1
        dw      bc_op70_pixel2, bc_op72_pixel3, bc_puts_far_operand, tgt_14C3D
        dw      bc_op6a_soft_keys_redraw_all, bc_op6c_soft_keys_styled, bc_op76_window_frame_rounded, L_14CD1
        dw      bc_op4e_line, L_14CF9, tgt_14D17
tgt_14C3D:
        mov     byte ptr [LCD_ATTR], 0fch
L_14C42:
        call    bc_puts_far_operand
        mov     byte ptr [LCD_ATTR], 0
L_14C4A:
        ret
bc_puts_far_operand:
        call    lcd_read_coords
        mov     dx, word ptr es:[bp]
        mov     es, word ptr es:[bp+2]
        add     bp, 4
        push    bp
        mov     bp, dx
        call    bc_puts_stream
        pop     bp
        ret
L_14C61:
        mov     byte ptr [UI_REDRAW_REQ], 1
        ret
L_14C67:
        mov     cl, byte ptr es:[bp]
        inc     bp
        mov     ch, byte ptr es:[bp]
        inc     bp
        mov     al, byte ptr es:[bp]
        inc     bp
        jmp     NEAR bc_op92_put_hex
L_14C79:
        mov     cl, byte ptr es:[bp]
        inc     bp
        mov     ch, byte ptr es:[bp]
        inc     bp
        mov     ax, word ptr es:[bp]
        add     bp, 2
        jmp     NEAR bc_op90_put_hex_high
L_14C8D:
        call    lcd_read_coords
        mov     bl, byte ptr es:[bp]
        inc     bp
        mov     ax, word ptr es:[bp]
        mov     dx, word ptr es:[bp+2]
        cmp     bl, 8
        jb      L_14CA4
        mov     bl, 8
L_14CA4:
        inc     bp
        cmp     bl, 3
        jb      jmp_word_14cb3
        inc     bp
        cmp     bl, 5
        jb      jmp_word_14cb3
        add     bp, 2
jmp_word_14cb3:
        shl     bl, 1
        sub     bh, bh
        add     bx, TBL_DIGIT_WIDTH
        jmp     word ptr cs:[bx]
TBL_DIGIT_WIDTH:
        dw      put_digits_none, put_digit_last, put_digits_2, put_digits_3, put_digits_4
        dw      put_digits_5, put_digits_6, put_digits_7, put_digits_8
put_digits_none:
        ret
L_14CD1:
        call    bc_op20_print
        pusha
L_14CD5:
        callf   CS0_SEG:calls_compare_bytes_d20_00468
        cmp     bh, 84h
        je      L_14CF4
        mov     ax, word ptr [G_WHEEL_INC_PENDING]
        or      ax, word ptr [G_WHEEL_DEC_PENDING]
        mov     word ptr [G_WHEEL_INC_PENDING], 0
        mov     word ptr [G_WHEEL_DEC_PENDING], 0
        je      L_14CD5
L_14CF4:
        call    bc_op22_message_close
        popa
        ret
L_14CF9:
        call    lcd_read_coords
        mov     bl, byte ptr es:[bp]
        inc     bp
        sub     bh, bh
        shl     bx, 1
        mov     si, word ptr cs:[bx+TBL_INT2E_BITMAPS]
        jmp     NEAR L_14B51
TBL_INT2E_BITMAPS:
        dw      BMP_WARNING, BMP_PEN_KEYS, BMP_ARROW_DOWN, BMP_ARROW_LEFT, BMP_ARROW_RIGHT
tgt_14D17:
        call    lcd_read_coords
        mov     si, word ptr es:[bp]
        mov     ax, word ptr es:[bp+2]
        mov     es, ax
        add     bp, 4
        mov     bl, byte ptr es:[si]
        inc     si
        or      bl, bl
        jne     br_14D30
        ret
br_14D30:
        sub     bh, bh
        mov     ch, byte ptr es:[si]
        inc     si
L_14D36:
        push    bx
L_14D37:
        mov     al, byte ptr es:[si]
        inc     si
        mov     ah, al
        sub     al, al
        shr     ax, cl
        or      byte ptr [di], ah
        or      byte ptr [di+1], al
        inc     di
        dec     bl
L_14D49:
        jne     L_14D37
        pop     bx
        add     di, 20h
        sub     di, bx
        dec     ch
        jne     L_14D36
        ret
bc_op82_midi_field:
        db      2ah, 0e4h, 26h, 0ffh, 76h, 00h, 50h
L_14D5D:
        call    bc_op36_num3
        pop     ax
        pop     cx
        add     cl, 12h
        mov     bl, 0ch
        div     bl
        mov     bl, al
        mov     al, 5
        mul     ah
        add     ax, D_1707
        mov     si, ax
        mov     dx, ds
        push    bx
        push    cx
        mov     ah, 5
L_14D7A:
        call    bc_op14_puts_far
        pop     cx
L_14D7E:
        pop     bx
        sub     bh, bh
        mov     al, byte ptr [bx+TBL_OCTAVE_CHARS]
        add     cl, 12h
        call    lcd_validate_coords
        call    font_draw_char
        ret
bc_opb4_note_and_pad:
        cmp     ah, 41h
L_14D92:
        je      L_14DE4
        cmp     al, 23h
L_14D96:
        jb      L_14DA8
        cmp     al, 63h
calls_font_char_lookup_14d9a:
        jae     L_14DA8
        push    ax
        call    bc_op34_num2
        mov     al, 2fh
        call    font_draw_char
        pop     ax
        jmp     SHORT L_14DBC
L_14DA8:
        push    ax
L_14DA9:
        call    lcd_read_coords
        mov     al, 2dh
        call    font_draw_char
        mov     al, 2dh
        call    font_draw_char
        mov     al, 2fh
        call    font_draw_char
        pop     ax
L_14DBC:
        mov     al, ah
        cmp     al, 40h
calls_font_char_lookup_14dc0:
        je      calls_font_char_lookup_14dd4
        push    ax
        shr     al, 4
        add     al, 41h
        call    font_draw_char
        pop     ax
        and     al, 0fh
        inc     al
        call    put_number_2digit
        ret
calls_font_char_lookup_14dd4:
        mov     al, 4fh
        call    font_draw_char
        mov     al, 46h
        call    font_draw_char
        mov     al, 46h
        call    font_draw_char
        ret
L_14DE4:
        call    lcd_read_coords
        mov     si, D_174F
        mov     ax, ds
        mov     es, ax
        call    L_13FB9
        ret
bc_op9c_bar_beat_tick:
        push    dx
        push    cx
        inc     ax
        cmp     ax, 3e8h
        jb      calls_font_char_lookup_14dfc
        sub     ax, ax
calls_font_char_lookup_14dfc:
        call    bc_op46_num3_padded
        mov     al, 2eh
        call    font_draw_char
        pop     ax
        if      FW_VERSION = 172

        pop     bx
        cmp     bl, 0ch
        else
        pop     dx
        cmp     dl, 0ch
        endif
        jae     L_14E0D
        if      FW_VERSION = 172
        mov     bl, 0ch
        else
        mov     dl, 0ch
        endif
L_14E0D:
        if      FW_VERSION = 172
        sub     dx, dx
        mov     bh, 0
        div     bx
        push    dx
        else
        div     dl
        push    ax
        endif
        inc     al
        call    put_number_2digit
        mov     al, 2eh
        call    font_draw_char
        pop     ax
        if      FW_VERSION = 150
        mov     al, ah
        endif
        call    put_number_2digit
        ret
bc_opa2_num_tenths:
        sub     dx, dx
        mov     bx, 0ah
        div     bx
        push    dx
calls_font_char_lookup_14e2b:
        call    bc_op36_num3
        mov     al, 2eh
        call    font_draw_char
        pop     ax
        call    put_digit_last
        ret
bc_opa4_cs_literal:
        call    lcd_read_coords
        mov     dx, cs
        mov     es, dx
L_14E3F:
        mov     ah, 10h
L_14E41:
        mov     si, str_cs_unused
        jmp     NEAR L_13FB9
str_cs_unused:
        db      "(Unused)        ", 0
bc_opa8_num_tenths_alt:
        sub     dx, dx
        mov     bx, 0ah
        div     bx
        push    dx
calls_font_char_lookup_14e60:
        call    bc_op36_num3
        mov     al, 2eh
        call    font_draw_char
        pop     ax
        call    put_digit_last
        ret
        db      00h
event_queues_reset_far:
        call    event_queues_reset
        retf
event_queues_reset:
        sub     ax, ax
        cli
        if      FW_VERSION = 172
        mov     byte ptr [NOTE_RING_RD], al
        mov     byte ptr [NOTE_RING_WR], al
        mov     byte ptr [MIDI_REC_RING_RD], al
        mov     byte ptr [MIDI_REC_RING_WR], al
        endif
        mov     byte ptr [MIDI_IN1_RING_PEEK], al
        mov     byte ptr [MIDI_IN1_RING_WR], al
        mov     byte ptr [MIDI_IN1_EVT_BYTE], al
        mov     byte ptr [MIDI_IN1_RING_RD], al
        mov     byte ptr [MIDI_OUT1_RUNNING_STATUS], 0ffh
        mov     byte ptr [MIDI_IN2_RING_PEEK], al
        mov     byte ptr [MIDI_IN2_RING_WR], al
        mov     byte ptr [MIDI_IN2_EVT_BYTE], al
        mov     byte ptr [MIDI_IN2_RING_RD], al
        mov     byte ptr [MIDI_OUT2_RUNNING_STATUS], 0ffh
        sti
        ret
L_14EA5:
        call    midi_in1_events_drain
L_14EA8:
        call    midi_in2_events_drain
L_14EAB:
        call    fn_14EB2
L_14EAE:
        call    sync_out_mtc_tick
L_14EB1:
        retf
fn_14EB2:
        or      ax, ax
        cmp     ax, word ptr [MIDI_OUT1_RS_TIMEOUT]
        je      L_14EC5
        dec     word ptr [MIDI_OUT1_RS_TIMEOUT]
        jne     L_14EC5
        mov     byte ptr [MIDI_OUT1_RUNNING_STATUS], 0ffh
L_14EC5:
        cmp     ax, word ptr [D_1A24]
        je      br_14ED6
        if      FW_VERSION = 150
L_1576B:
        endif
        dec     word ptr [D_1A24]
        jne     br_14ED6
        mov     byte ptr [MIDI_OUT2_RUNNING_STATUS], 0ffh
br_14ED6:
        ret
midi_parse_port_1a0:
        call    fn_14EDB
        retf
fn_14EDB:
        cmp     byte ptr [G_MIDI_IN_RAW_MODE], 0
        je      br_14EE4
        jmp     SHORT br_14F22
br_14EE4:
        cmp     al, 0f0h
        jb      br_14EEB
        jmp     NEAR L_14FD8
br_14EEB:
        test    al, 80h
        je      jmp_word_14f1e
        mov     byte ptr [MIDI_IN1_STATUS], al
        mov     bl, al
        and     al, 0fh
        mov     ah, byte ptr [G_MIDI_RECEIVE_CH]
        sub     ah, 1
        jb      L_14F03
        cmp     al, ah
        jne     midi_in1_parser_reset
L_14F03:
        and     bl, 70h
        shr     bl, 3
L_14F09:
        mov     bh, 0
        mov     ax, word ptr cs:[bx+midi_in1_chan_table]
        mov     word ptr [PTR_MIDI_IN1_STATE], ax
        mov     si, word ptr cs:[bx+midi_chan_filter_ptrs]
        mov     al, byte ptr [si]
        mov     byte ptr [MIDI_IN1_CHAN_FILTER], al
jmp_word_14f1d:
        ret
jmp_word_14f1e:
        jmp     word ptr [PTR_MIDI_IN1_STATE]
br_14F22:
        push    ds
        mov     ah, 0
        int     4eh
        pop     ds
        ret
midi_in1_chan_table:
        dw      midi_in1_note_off_key, midi_in1_data1, midi_in1_data1, midi_in1_data1
        dw      midi_in1_data1_only, midi_in1_data1_only, midi_in1_data1
midi_chan_filter_ptrs:
        dw      0b3dh, 0b3dh, 0b41h, 0b43h, 0b3fh, 0b40h, 0b3eh
midi_in1_parser_reset:
        mov     word ptr [PTR_MIDI_IN1_STATE], midi_in1_parser_reset
        mov     byte ptr [MIDI_IN1_IN_SYSEX], 0
midi_in1_sys_ignore:
        ret
midi_in1_data1_only:
        mov     byte ptr [MIDI_IN1_BYTE1], al
        mov     byte ptr [MIDI_IN1_BYTE2], 0
        jmp     SHORT L_14F6E
midi_in1_data1:
        mov     byte ptr [MIDI_IN1_BYTE1], al
        mov     word ptr [PTR_MIDI_IN1_STATE], midi_in1_data2
        ret
midi_in1_data2:
        mov     byte ptr [MIDI_IN1_BYTE2], al
        mov     word ptr [PTR_MIDI_IN1_STATE], midi_in1_data1
L_14F6E:
        call    L_14FB1
L_14F71:
        jae     L_14F74
        ret
L_14F74:
        mov     ah, byte ptr [MIDI_IN1_STATUS]
        mov     al, byte ptr [MIDI_IN1_BYTE1]
        mov     cl, byte ptr [MIDI_IN1_BYTE2]
L_1581F:
        sub     ch, ch
L_15821:
        mov     bl, byte ptr [MIDI_IN1_RING_WR]
L_15825:
        mov     bh, 0
L_15827:
        mov     word ptr [bx+BUF_MIDI_IN1_EVENTS], ax
        mov     word ptr [bx+P_C5DA], cx
        add     byte ptr [MIDI_IN1_RING_WR], 4
        ret
midi_in1_note_off_key:
        mov     byte ptr [MIDI_IN1_BYTE1], al
        or      byte ptr [MIDI_IN1_STATUS], 10h
        mov     word ptr [PTR_MIDI_IN1_STATE], midi_in1_note_off_vel
        ret
midi_in1_note_off_vel:
        mov     byte ptr [MIDI_IN1_BYTE2], 0
        mov     word ptr [PTR_MIDI_IN1_STATE], midi_in1_note_off_key
        jmp     SHORT L_14F6E
L_14FB1:
        cmp     byte ptr [G_MIDI_FILTER_ON], 0
        je      br_14FD4
        mov     ah, byte ptr [MIDI_IN1_CHAN_FILTER]
L_14FBC:
        mov     al, byte ptr [MIDI_IN1_STATUS]
        and     al, 0f0h
        cmp     al, 0b0h
        jne     br_14FCF
        mov     bl, byte ptr [MIDI_IN1_BYTE1]
        sub     bh, bh
        mov     ah, byte ptr [bx+TBL_MIDI_FILTER_CC_PASS]
br_14FCF:
        cmp     ah, 0
        je      br_14FD6
br_14FD4:
        clc
        ret
br_14FD6:
        stc
        ret
L_14FD8:
        mov     bl, al
        and     bx, 0fh
        shl     bx, 1
        cmp     al, 0f8h
L_14FE1:
        jb      midi_in1_sys_dispatch
        cmp     byte ptr [G_SYNC_IN_MODE], 1
L_14FE8:
        je      L_14FEB
        ret
L_14FEB:
        cmp     byte ptr [G_SYNC_IN_PORT], 0
jmp_word_14ff0:
        je      midi_in1_sys_dispatch
        ret
midi_in1_sys_dispatch:
        jmp     word ptr cs:[bx+midi_in1_sys_table]
midi_in1_sys_table:
        dw      midi_in1_sysex_start, midi_in1_mtc_qf, midi_in1_song_pos, midi_in1_parser_reset
        dw      midi_in1_parser_reset, midi_in1_parser_reset, midi_in1_parser_reset, midi_in1_eox
        dw      midi_sys_clock, midi_in1_parser_reset, midi_sys_start, midi_sys_continue
        dw      midi_sys_stop, midi_in1_sys_ignore, midi_in1_sys_ignore, midi_in1_parser_reset
midi_sys_clock:
        mov     word ptr [MIDI_CLOCK_WATCHDOG], MIDI_CLOCK_RELOAD
        mov     al, 0
        xchg    byte ptr [MIDI_CLOCK_TICK_CNT], al
        mov     byte ptr [MIDI_CLOCK_INTERVAL], al
        cmp     byte ptr [B_1A2A], 0fch
        jne     midi_sys_clock_count
        ret
midi_sys_clock_count:
        inc     byte ptr [B_1A2B]
        ret
midi_sys_start:
        mov     byte ptr [B_1A2A], al
        mov     byte ptr [B_1A2B], 0
calls_cursor_position_1503c:
        call    cursor_position
        ret
midi_sys_continue:
        mov     byte ptr [B_1A2A], al
        mov     byte ptr [B_1A2B], 0
calls_cursor_position_15048:
        call    cursor_position
        ret
midi_sys_stop:
        mov     byte ptr [B_1A2A], al
calls_cursor_position_1504f:
        call    cursor_position
        ret
midi_in1_song_pos:
        mov     word ptr [PTR_MIDI_IN1_STATE], midi_in1_song_pos_lsb
        ret
midi_in1_song_pos_lsb:
        mov     byte ptr [MIDI_IN1_SPP_LSB], al
        mov     word ptr [PTR_MIDI_IN1_STATE], midi_in1_song_pos_msb
        ret
midi_in1_song_pos_msb:
        mov     word ptr [PTR_MIDI_IN1_STATE], midi_in1_parser_reset
        cmp     byte ptr [G_SYNC_IN_MODE], 1
L_1506F:
        je      L_15072
        ret
L_15072:
        cmp     byte ptr [G_SYNC_IN_PORT], 0
L_15077:
        je      calls_cursor_position_1507a
        ret
calls_cursor_position_1507a:
        push    ax
        mov     al, 0f2h
calls_cursor_position_1507d:
        call    cursor_position
        mov     al, byte ptr [MIDI_IN1_SPP_LSB]
calls_cursor_position_15083:
        call    cursor_position
        pop     ax
calls_cursor_position_15087:
        call    cursor_position
        ret
cursor_position:
        mov     bl, byte ptr [SYNC_IN_RING_WR]
        mov     bh, 0
        mov     byte ptr [bx+TBL_SYNC_IN_RING], al
        inc     bl
L_15097:
        and     bl, 3fh
        mov     byte ptr [SYNC_IN_RING_WR], bl
        ret
midi_in1_mtc_qf:
        cmp     byte ptr [G_SYNC_IN_MODE], 2
L_150A4:
        je      L_150A9
        jmp     NEAR midi_in1_parser_reset
L_150A9:
        cmp     byte ptr [G_SYNC_IN_PORT], 0
L_150AE:
        je      L_150B3
        jmp     NEAR midi_in1_parser_reset
L_150B3:
        mov     ax, P_523E
        xchg    word ptr [PTR_MIDI_IN1_STATE], ax
        mov     word ptr [MIDI_IN1_SAVED_STATE], ax
        ret
L_150BE:
        mov     bl, al
        and     al, 0fh
        and     bl, 0f0h
        sub     bh, bh
        shr     bl, 3
calls_word_150ca:
        call    word ptr cs:[bx+mtc_qf_piece_table]
        mov     ax, word ptr [MIDI_IN1_SAVED_STATE]
        mov     word ptr [PTR_MIDI_IN1_STATE], ax
        ret
mtc_qf_piece_table:
        dw      mtc_qf_frame_lo, mtc_qf_frame_hi, mtc_qf_sec_lo, mtc_qf_sec_hi
        dw      mtc_qf_min_lo, mtc_qf_min_hi, mtc_qf_hour_lo, mtc_qf_hour_hi
mtc_qf_frame_lo:
        mov     byte ptr [MTC_QF_FRAME], al
        ret
mtc_qf_frame_hi:
        shl     al, 4
        or      byte ptr [MTC_QF_FRAME], al
        ret
mtc_qf_sec_lo:
        mov     byte ptr [MTC_QF_SEC], al
        ret
mtc_qf_sec_hi:
        shl     al, 4
        or      byte ptr [MTC_QF_SEC], al
        ret
mtc_qf_min_lo:
        mov     byte ptr [MTC_QF_MIN], al
        ret
mtc_qf_min_hi:
        shl     al, 4
        or      byte ptr [MTC_QF_MIN], al
        ret
mtc_qf_hour_lo:
        mov     byte ptr [MTC_QF_HOUR], al
        ret
mtc_qf_hour_hi:
        mov     ah, al
        and     al, 1
        shl     al, 4
        or      byte ptr [MTC_QF_HOUR], al
        shr     ah, 1
        and     ah, 3
        mov     byte ptr [D_1A37], ah
        mov     byte ptr [D_1A36], 0
        if      FW_VERSION = 150
L_159CA                         equ     $+3
        endif
        cmp     ah, byte ptr [G_FRAME_RATE]
L_1512B:
        je      L_1512E
        ret
L_1512E:
        mov     ah, byte ptr [MTC_QF_HOUR]
L_15132:
        mov     al, byte ptr [MTC_QF_MIN]
        mov     bh, byte ptr [MTC_QF_SEC]
        mov     bl, byte ptr [MTC_QF_FRAME]
        mov     byte ptr [MTC_RX_HOUR], ah
        mov     byte ptr [MTC_RX_MIN], al
        mov     byte ptr [MTC_RX_SEC], bh
        mov     byte ptr [MTC_RX_FRAME], bl
        mov     byte ptr [MTC_RX_TIME_VALID], 1
        mov     byte ptr [P_1A38], 0c8h
        ret
far_15157:
        call    mtc_qf_time_take
        retf
mtc_qf_time_take:
        mov     al, 0
        xchg    byte ptr [MTC_RX_TIME_VALID], al
        cmp     al, 0
L_15163:
        jne     L_15166
        ret
L_15166:
        mov     bp, P_1A39
L_15169:
        call    time_accum_hours
        mov     bl, byte ptr [G_FRAME_RATE]
        mov     bh, 0
        mov     bl, byte ptr [bx+TBL_1A7A]
        inc     bl
L_15178:
        add     di, bx
        adc     si, 0
        stc
        ret
midi_in1_sysex_start:
        mov     al, 0f7h
L_15181:
        call    midi_in1_eox
        mov     word ptr [PTR_MIDI_IN1_STATE], L_15195
        mov     byte ptr [MIDI_IN1_EVT_BYTE], 0
        mov     byte ptr [MIDI_IN1_IN_SYSEX], 1
        ret
L_15195:
        mov     si, P_CCD8
        mov     word ptr [PTR_MIDI_IN1_SYSEX_WR], si
        cmp     al, 7eh
L_1519E:
        jb      L_151A2
        jmp     SHORT br_15205
L_151A2:
        cmp     byte ptr [G_MIDI_FILTER_ON], 0
L_151A7:
        je      br_151B3
        cmp     byte ptr [G_MIDI_FILTER_SYSEX_PASS], 0
L_151AE:
        jne     br_151B3
        jmp     NEAR midi_in1_parser_reset
br_151B3:
        push    ax
        mov     al, 0f0h
        call    midi_in1_event_put
        pop     ax
        mov     word ptr [PTR_MIDI_IN1_STATE], midi_in1_event_put
midi_in1_event_put:
        sub     bh, bh
        mov     bl, byte ptr [MIDI_IN1_RING_WR]
        add     bl, byte ptr [MIDI_IN1_EVT_BYTE]
        mov     byte ptr [bx+BUF_MIDI_IN1_EVENTS], al
        inc     byte ptr [MIDI_IN1_EVT_BYTE]
        cmp     byte ptr [MIDI_IN1_EVT_BYTE], 3
L_151D7:
        je      br_151DA
        ret
br_151DA:
        add     byte ptr [MIDI_IN1_RING_WR], 4
        mov     byte ptr [MIDI_IN1_EVT_BYTE], 0
        ret
midi_in1_eox:
        cmp     byte ptr [MIDI_IN1_IN_SYSEX], 0
L_151EA:
        jne     L_151EF
        jmp     NEAR midi_in1_parser_reset
L_151EF:
        cmp     byte ptr [MIDI_IN1_SYSEX_BUFFERING], 0
L_151F4:
        jne     br_1521C
loop_151F6:
        call    midi_in1_event_put
        cmp     byte ptr [MIDI_IN1_EVT_BYTE], 0
        mov     al, 0ffh
        jne     loop_151F6
        jmp     NEAR midi_in1_parser_reset
br_15205:
        mov     byte ptr [MIDI_IN1_SYSEX_BUFFERING], 1
        mov     word ptr [PTR_MIDI_IN1_STATE], br_15205
        mov     si, word ptr [PTR_MIDI_IN1_SYSEX_WR]
        mov     byte ptr [si], al
        inc     si
        mov     word ptr [PTR_MIDI_IN1_SYSEX_WR], si
        ret
br_1521C:
        mov     byte ptr [MIDI_IN1_SYSEX_BUFFERING], 0
        call    midi_in1_parser_reset
        mov     si, P_CCD8
L_15227:
        lodsw
        cmp     ax, 7f7fh
        jne     L_1526A
        lodsw
        cmp     ax, 101h
L_15231:
        je      L_1529F
        cmp     byte ptr [B_0C0C], 0
        jne     L_1523B
        ret
L_1523B:
        cmp     ax, 206h
L_1523E:
        je      br_1526B
        cmp     ax, 306h
L_15243:
        je      br_1526B
        cmp     ax, 106h
L_15248:
        je      br_1526B
        cmp     ax, 606h
L_1524D:
        je      br_1526B
        cmp     ax, 4406h
        je      L_15270
        ret
        if      FW_VERSION = 172
        db      0adh, 0a2h, 32h, 1ah, 88h, 26h, 33h, 1ah, 0adh, 0a2h, 34h, 1ah, 88h, 26h, 35h, 1ah
        db      0c6h, 06h, 49h, 1ah, 01h
        else
        db      0adh, 0a2h, 28h, 1ah, 88h, 26h, 29h, 1ah, 0adh, 0a2h, 2ah, 1ah, 88h, 26h, 2bh, 1ah
        db      0c6h, 06h, 3fh, 1ah, 01h
        endif
L_1526A:
        ret
br_1526B:
        mov     byte ptr [B_1A58], ah
        ret
L_15270:
        lodsw
        cmp     ax, 106h
        je      L_15277
L_15276:
        ret
L_15277:
        lodsb
        mov     ah, al
        and     al, 1fh
        mov     byte ptr [MMC_LOC_HOUR], al
        lodsb
        mov     byte ptr [MMC_LOC_MIN], al
        lodsb
        mov     byte ptr [MMC_LOC_SEC], al
        lodsb
        mov     byte ptr [MMC_LOC_FRAME], al
        lodsb
        mov     byte ptr [MMC_LOC_SUBFRAME], al
        shr     ah, 5
        cmp     ah, byte ptr [G_FRAME_RATE]
L_15296:
        je      br_15299
        ret
br_15299:
        mov     byte ptr [SYNC_LOCATE_RCVD], 1
        ret
L_1529F:
        cmp     byte ptr [G_SYNC_IN_MODE], 2
L_152A4:
        je      L_152A7
        ret
L_152A7:
        ret
        lodsb
        mov     ah, al
        and     al, 1fh
        mov     byte ptr [MMC_LOC_HOUR], al
        lodsb
        mov     byte ptr [MMC_LOC_MIN], al
        lodsb
        mov     byte ptr [MMC_LOC_SEC], al
        lodsb
        mov     byte ptr [MMC_LOC_FRAME], al
        mov     byte ptr [MMC_LOC_SUBFRAME], 0
        shr     ah, 5
        cmp     ah, byte ptr [G_FRAME_RATE]
L_152C8:
        je      br_152CB
        ret
br_152CB:
        mov     byte ptr [SYNC_LOCATE_RCVD], 1
        ret
mtc_full_frame_take:
        mov     al, 0
        xchg    byte ptr [SYNC_LOCATE_RCVD], al
        cmp     al, 0
        je      L_152E2
        mov     bp, P_1A52
L_152DE:
        call    time_accum_hours
        stc
L_152E2:
        retf
midi_parse_port_180:
        call    midi_in2_parse_byte
        retf
midi_in2_parse_byte:
        cmp     byte ptr [G_MIDI_IN_RAW_MODE], 0
        je      br_152F0
        jmp     SHORT L_1532E
br_152F0:
        cmp     al, 0f0h
        jb      br_152F7
        jmp     NEAR L_153D6
br_152F7:
        test    al, 80h
        je      jmp_word_1532a
        mov     byte ptr [MIDI_IN2_STATUS], al
        mov     bl, al
        and     al, 0fh
        mov     ah, byte ptr [G_MIDI_RECEIVE_CH]
        sub     ah, 1
        jb      L_1530F
        cmp     al, ah
        jne     midi_in2_parser_reset
L_1530F:
        and     bl, 70h
        shr     bl, 3
L_15315:
        mov     bh, 0
        mov     ax, word ptr cs:[bx+midi_in2_chan_table]
        mov     word ptr [PTR_MIDI_IN2_STATE], ax
        mov     si, word ptr cs:[bx+midi_chan_filter_ptrs]
        mov     al, byte ptr [si]
        mov     byte ptr [MIDI_IN2_CHAN_FILTER], al
        ret
jmp_word_1532a:
        jmp     word ptr [PTR_MIDI_IN2_STATE]
L_1532E:
        push    ds
        mov     ah, 1
        int     4eh
        pop     ds
        ret
midi_in2_chan_table:
        dw      midi_in2_note_off_key, midi_in2_data1, midi_in2_data1, midi_in2_data1
        dw      midi_in2_data1_only, midi_in2_data1_only, midi_in2_data1
midi_in2_parser_reset:
        mov     word ptr [PTR_MIDI_IN2_STATE], midi_in2_parser_reset
        mov     byte ptr [MIDI_IN2_IN_SYSEX], 0
midi_in2_sys_ignore:
        ret
midi_in2_data1_only:
        mov     byte ptr [MIDI_IN2_BYTE1], al
        mov     byte ptr [MIDI_IN2_BYTE2], 0
        jmp     SHORT L_1536C
midi_in2_data1:
        mov     byte ptr [MIDI_IN2_BYTE1], al
        mov     word ptr [PTR_MIDI_IN2_STATE], midi_in2_data2
        ret
midi_in2_data2:
        mov     byte ptr [MIDI_IN2_BYTE2], al
        mov     word ptr [PTR_MIDI_IN2_STATE], midi_in2_data1
L_1536C:
        call    midi_in_filter_check
L_1536F:
        jae     L_15372
        ret
L_15372:
        mov     ah, byte ptr [MIDI_IN2_STATUS]
        mov     al, byte ptr [MIDI_IN2_BYTE1]
        mov     cl, byte ptr [MIDI_IN2_BYTE2]
        sub     ch, ch
        mov     bl, byte ptr [MIDI_IN2_RING_WR]
        mov     bh, 0
        mov     word ptr [bx+BUF_MIDI_IN2_EVENTS], ax
        mov     word ptr [bx+P_C6DA], cx
        add     byte ptr [MIDI_IN2_RING_WR], 4
        ret
midi_in2_note_off_key:
        mov     byte ptr [MIDI_IN2_BYTE1], al
        or      byte ptr [MIDI_IN2_STATUS], 10h
        mov     word ptr [PTR_MIDI_IN2_STATE], midi_in2_note_off_vel
        ret
midi_in2_note_off_vel:
        mov     byte ptr [MIDI_IN2_BYTE2], 0
        mov     word ptr [PTR_MIDI_IN2_STATE], midi_in2_note_off_key
        jmp     SHORT L_1536C
midi_in_filter_check:
        cmp     byte ptr [G_MIDI_FILTER_ON], 0
        je      br_153D2
        mov     ah, byte ptr [MIDI_IN2_CHAN_FILTER]
        mov     al, byte ptr [MIDI_IN2_STATUS]
        and     al, 0f0h
        cmp     al, 0b0h
        jne     br_153CD
        mov     bl, byte ptr [MIDI_IN2_BYTE1]
        sub     bh, bh
        mov     ah, byte ptr [bx+TBL_MIDI_FILTER_CC_PASS]
br_153CD:
        cmp     ah, 0
        je      br_153D4
br_153D2:
        clc
        ret
br_153D4:
        stc
        ret
L_153D6:
        mov     bl, al
        and     bx, 0fh
        shl     bx, 1
        cmp     al, 0f8h
L_153DF:
        jb      midi_in2_sys_dispatch
        cmp     byte ptr [G_SYNC_IN_MODE], 1
L_153E6:
        je      L_153E9
        ret
L_153E9:
        cmp     byte ptr [G_SYNC_IN_PORT], 1

jmp_word_153ee:
        je      midi_in2_sys_dispatch
        ret
midi_in2_sys_dispatch:
        jmp     word ptr cs:[bx+midi_in2_sys_table]
midi_in2_sys_table:
        dw      midi_in2_sysex_start, midi_in2_mtc_qf, midi_in2_song_pos, midi_in2_parser_reset
        dw      midi_in2_parser_reset, midi_in2_parser_reset, midi_in2_parser_reset, midi_in2_eox
        dw      midi_sys_clock, midi_in2_parser_reset, midi_sys_start, midi_sys_continue
        dw      midi_sys_stop, midi_in2_sys_ignore, midi_in2_sys_ignore, midi_in2_parser_reset
midi_in2_song_pos:
        mov     word ptr [PTR_MIDI_IN2_STATE], midi_in2_song_pos_lsb
        ret
midi_in2_song_pos_lsb:
        mov     byte ptr [MIDI_IN2_SPP_LSB], al
        mov     word ptr [PTR_MIDI_IN2_STATE], midi_in2_song_pos_msb
        ret
midi_in2_song_pos_msb:
        mov     word ptr [PTR_MIDI_IN1_STATE], midi_in2_parser_reset
        cmp     byte ptr [G_SYNC_IN_MODE], 1
L_15432:
        je      L_15435
        ret
L_15435:
        cmp     byte ptr [G_SYNC_IN_PORT], 1
L_1543A:
        je      calls_cursor_position_1543d
        ret
calls_cursor_position_1543d:
        push    ax
        mov     al, 0f2h
calls_cursor_position_15440:
        call    cursor_position
        mov     al, byte ptr [MIDI_IN2_SPP_LSB]
calls_cursor_position_15446:
        call    cursor_position
        pop     ax
calls_cursor_position_1544a:
        call    cursor_position
        ret
midi_in2_mtc_qf:
        cmp     byte ptr [G_SYNC_IN_MODE], 2
L_15453:
        je      L_15458
        jmp     NEAR midi_in2_parser_reset
L_15458:
        cmp     byte ptr [G_SYNC_IN_PORT], 1
L_1545D:
        je      L_15462
        jmp     NEAR midi_in2_parser_reset
L_15462:
        mov     ax, P_55ED
        xchg    word ptr [PTR_MIDI_IN2_STATE], ax
        mov     word ptr [MIDI_IN2_SAVED_STATE], ax
        ret
L_1546D:
        mov     bl, al
        and     al, 0fh
        and     bl, 0f0h
        sub     bh, bh
        shr     bl, 3
calls_word_15479:
        call    word ptr cs:[bx+mtc_qf_piece_table]
        mov     ax, word ptr [MIDI_IN2_SAVED_STATE]
        mov     word ptr [PTR_MIDI_IN2_STATE], ax
        ret
midi_in2_sysex_start:
        mov     al, 0f7h
L_15487:
        call    midi_in2_eox
        mov     word ptr [PTR_MIDI_IN2_STATE], P_561B
        mov     byte ptr [MIDI_IN2_EVT_BYTE], 0
        mov     byte ptr [MIDI_IN2_IN_SYSEX], 1
        ret
        if      FW_VERSION = 172
L_1549B:
        endif
        mov     si, P_CD58
        mov     word ptr [PTR_MIDI_IN2_SYSEX_WR], si
        cmp     al, 7eh
L_154A4:
        jb      L_154A8
        jmp     SHORT br_1550B
L_154A8:
        cmp     byte ptr [G_MIDI_FILTER_ON], 0
L_154AD:
        je      br_154B9
        cmp     byte ptr [G_MIDI_FILTER_SYSEX_PASS], 0
L_154B4:
        jne     br_154B9
        jmp     NEAR midi_in2_parser_reset
br_154B9:
        push    ax
        mov     al, 0f0h
        call    midi_in2_event_put
        pop     ax
        mov     word ptr [PTR_MIDI_IN2_STATE], midi_in2_event_put
midi_in2_event_put:
        sub     bh, bh
        mov     bl, byte ptr [MIDI_IN2_RING_WR]
        add     bl, byte ptr [MIDI_IN2_EVT_BYTE]
        mov     byte ptr [bx+BUF_MIDI_IN2_EVENTS], al
        inc     byte ptr [MIDI_IN2_EVT_BYTE]
        cmp     byte ptr [MIDI_IN2_EVT_BYTE], 3
L_154DD:
        je      br_154E0
        ret
br_154E0:
        add     byte ptr [MIDI_IN2_RING_WR], 4
        mov     byte ptr [MIDI_IN2_EVT_BYTE], 0
        ret
midi_in2_eox:
        cmp     byte ptr [MIDI_IN2_IN_SYSEX], 0
L_154F0:
        jne     L_154F5
        jmp     NEAR midi_in2_parser_reset
L_154F5:
        cmp     byte ptr [MIDI_IN2_SYSEX_BUFFERING], 0
L_154FA:
        jne     br_15522
loop_154FC:
        call    midi_in2_event_put
        cmp     byte ptr [MIDI_IN2_EVT_BYTE], 0
        mov     al, 0ffh
        jne     loop_154FC
        jmp     NEAR midi_in2_parser_reset
br_1550B:
        mov     byte ptr [MIDI_IN2_SYSEX_BUFFERING], 1
        mov     word ptr [PTR_MIDI_IN2_STATE], br_1550B
        mov     si, word ptr [PTR_MIDI_IN2_SYSEX_WR]
        mov     byte ptr [si], al
        inc     si
        mov     word ptr [PTR_MIDI_IN2_SYSEX_WR], si
        ret
br_15522:
        mov     byte ptr [MIDI_IN2_SYSEX_BUFFERING], 0
        call    midi_in2_parser_reset
        mov     si, P_CD58
        jmp     NEAR L_15227
midi_in1_events_drain:
        mov     bl, byte ptr [MIDI_IN1_RING_RD]
        cmp     bl, byte ptr [MIDI_IN1_RING_WR]
        jne     L_1553B
        ret
L_1553B:
        sub     bh, bh
        mov     ax, word ptr [bx+BUF_MIDI_IN1_EVENTS]
        mov     cx, word ptr [bx+P_C5DA]
        add     byte ptr [MIDI_IN1_RING_RD], 4
L_1554A:
        call    midi_switch_dispatch
L_1554D:
        jb      midi_in1_events_drain
L_1554F:
        call    midi_in_event_process
        jmp     SHORT midi_in1_events_drain
midi_in_event_process:
        cmp     byte ptr [B_0B1C], 0
L_15559:
        jne     L_1555C
        ret
L_1555C:
        cmp     byte ptr [B_63C8], 0
L_15561:
        je      br_15566
        jmp     L_156D2
br_15566:
        cmp     byte ptr [MIDI_SYSEX_THRU_ACTIVE], 0
        je      L_15570
        jmp     br_1565E
L_15570:
        cmp     al, 0f0h
L_15572:
        jne     br_15577
        jmp     br_1565E
br_15577:
        and     ah, 0f0h
        cmp     ah, 0b0h
        jne     L_1558D
        mov     dl, al
        inc     dl
        cmp     dl, byte ptr [G_SLIDER_CTRL]
        jne     L_1558D
        mov     byte ptr [G_SLIDER_POS], cl
L_1558D:
        cmp     ah, 90h
L_15590:
        jne     br_155B5
        cmp     byte ptr [B_1D88], 0
L_15597:
        je      L_1559F
        mov     byte ptr [B_1D88], 0
        ret
L_1559F:
        push    ax
        push    cx
L_155A1:
        call    midi_in_held_note_track
        pop     cx
        pop     ax
        cmp     cl, 0
L_155A9:
        je      br_155B5
        push    ax
        push    cx
L_155AD:
        call    fn_15D97
        pop     cx
        pop     ax
L_155B2:
        jae     br_155B5
        ret
br_155B5:
        mov     ch, 0
        mov     bl, byte ptr [MIDI_REC_RING_WR]
        mov     bh, 0
        mov     word ptr [bx+P_C7D8], ax
        mov     word ptr [bx+P_C7DA], cx
        add     byte ptr [MIDI_REC_RING_WR], 4
fn_155CA:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bl, byte ptr [SEL_TRACK]
        sub     bh, bh
        mov     ch, byte ptr es:[bx+TRK_CHANNEL]
        cmp     byte ptr [SEQ_ODUB_ARMED], 0
        jne     L_155EB
        cmp     word ptr [UI_SLOT_IDLE], main_screen_idle
        je      L_155EB
        or      ch, 40h
L_155EB:
        cmp     ah, 90h
        jne     br_1560C
        mov     bl, al
        and     bl, 7fh
        mov     bh, 0
        cmp     cl, 0
L_155FA:
        jne     L_15608
        if      FW_VERSION = 172
        mov     ch, 0
        xchg    byte ptr [bx+TBL_MIDI_IN_NOTE_ON], ch
        cmp     ch, 0
        jne     br_1560C
        ret
        else
        mov     ch, byte ptr [bx+TBL_MIDI_IN_NOTE_ON]
        endif
L_15608:
        mov     byte ptr [bx+TBL_MIDI_IN_NOTE_ON], ch
br_1560C:
        call    midi_in_sustain_channel_latch
        test    ch, 40h
        je      L_1563E
        push    cx
        call    midi_in_sustain_defer_note_off
        jb      L_1563D
        mov     dh, byte ptr [G_NOTE_VAR_TYPE]
        mov     dl, byte ptr [NOTE_VAR_VALUE]
        push    es
        push    si
        sub     si, si
        mov     es, si
        les     si, es:[0f4h]
        cmp     al, byte ptr es:[si+TBL_0013]
        pop     si
        pop     es
        je      L_15638
        mov     dx, 40h
L_15638:
        mov     ch, 1
L_1563A:
        call    sound_event_enqueue
L_1563D:
        pop     cx
L_1563E:
        test    ch, 20h
L_15641:
        jne     br_15644
        ret
br_15644:
        mov     bh, ch
        and     bh, 0fh
        or      ah, bh
        cmp     byte ptr [G_SOFT_THRU], 0
        jne     jmp_field_edit_init_15653
        ret
jmp_field_edit_init_15653:
        test    ch, 10h
jmp_field_edit_init_15656:
        jne     L_1565B
        jmp     midi_out_enqueue
L_1565B:
        jmp     NEAR error_midi_out_full_159b3
br_1565E:
        mov     bl, byte ptr [MIDI_REC_RING_WR]
        mov     bh, 0
        mov     word ptr [bx+P_C7D8], ax
        mov     word ptr [bx+P_C7DA], cx
        add     byte ptr [MIDI_REC_RING_WR], 4
        mov     byte ptr [MIDI_SYSEX_THRU_ACTIVE], 1
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bl, byte ptr [SEL_TRACK]
        sub     bh, bh
        mov     ch, byte ptr es:[bx+TRK_CHANNEL]
        push    ax
        call    midi_in_sysex_thru
        pop     ax
        mov     al, ah
        call    midi_in_sysex_thru
        mov     al, cl
midi_in_sysex_thru:
        cmp     byte ptr [MIDI_SYSEX_THRU_ACTIVE], 0
L_15696:
        jne     br_15699
        ret
br_15699:
        cmp     byte ptr [G_SOFT_THRU], 0
        je      L_156A3
        call    midi_out_ring_put
L_156A3:
        cmp     al, 0f7h
L_156A5:
        je      br_156A8
        ret
br_156A8:
        mov     byte ptr [MIDI_SYSEX_THRU_ACTIVE], 0
        ret
midi_in2_events_drain:
        mov     bl, byte ptr [MIDI_IN2_RING_RD]
        cmp     bl, byte ptr [MIDI_IN2_RING_WR]
        jne     L_156B9
        ret
L_156B9:
        sub     bh, bh
        mov     ax, word ptr [bx+BUF_MIDI_IN2_EVENTS]
        mov     cx, word ptr [bx+P_C6DA]
        add     byte ptr [MIDI_IN2_RING_RD], 4
L_156C8:
        call    midi_switch_dispatch
L_156CB:
        jb      midi_in2_events_drain
L_156CD:
        call    midi_in_event_process
        jmp     SHORT midi_in2_events_drain
L_156D2:
        mov     bl, ah
        and     bl, 0f0h
        cmp     bl, 90h
L_156DA:
        jne     L_156E9
        cmp     byte ptr [B_1D88], 0
L_156E1:
        je      L_156E9
        mov     byte ptr [B_1D88], 0
        ret
L_156E9:
        mov     bl, byte ptr [MIDI_REC_RING_WR]
        mov     bh, 0
        mov     word ptr [bx+P_C7D8], ax
        mov     word ptr [bx+P_C7DA], cx
        add     byte ptr [MIDI_REC_RING_WR], 4
        cmp     byte ptr [MIDI_THRU_IN_SYSEX], 0
L_15701:
        jne     L_15715
        cmp     ah, 0f7h
L_15706:
        je      L_15715
        cmp     ah, 80h
        jae     calls_field_edit_init_15711
        cmp     al, 0f0h
calls_field_edit_init_1570f:
        je      L_15715
calls_field_edit_init_15711:
        call    midi_out_enqueue
        ret
L_15715:
        mov     byte ptr [MIDI_THRU_IN_SYSEX], 1
        call    midi_out1_ring_put
        cmp     al, 0f7h
L_1571F:
        je      br_15734
        mov     al, ah
        call    midi_out1_ring_put
        cmp     al, 0f7h
L_15728:
        je      br_15734
        mov     al, cl
        call    midi_out1_ring_put
        cmp     al, 0f7h
L_15731:
        je      br_15734
        ret
br_15734:
        mov     byte ptr [MIDI_THRU_IN_SYSEX], 0
        ret
midi_in_sustain_defer_note_off:
        cmp     ax, 0b040h
L_1573D:
        je      L_15765
        cmp     byte ptr [MIDI_IN_SUSTAIN], 0
L_15744:
        jne     L_15747
        ret
L_15747:
        cmp     ah, 90h
        clc
L_1574B:
        je      L_1574E
        ret
L_1574E:
        cmp     cl, 0
        clc
L_15752:
        je      br_15755
        ret
br_15755:
        push    ax
        sub     al, 23h
        and     ax, 3fh
        add     ax, P_19D8
        mov     si, ax
        pop     ax
        mov     byte ptr [si], al
        stc
        ret
L_15765:
        mov     byte ptr [MIDI_IN_SUSTAIN], cl
        cmp     cl, 0
        stc
L_1576D:
        je      br_15770
        ret
br_15770:
        push    ax
        push    cx
        mov     si, P_19D8
        mov     ah, 40h
L_15777:
        mov     al, byte ptr [si]
        cmp     al, 0
        je      br_15789
        mov     byte ptr [si], 0
        push    ax
        mov     ah, 90h
        mov     cl, 0
L_15785:
        call    sound_event_enqueue
        pop     ax
br_15789:
        inc     si
        dec     ah
        jne     L_15777
        pop     cx
        pop     ax
        stc
        ret
midi_in_sustain_channel_latch:
        cmp     ax, 0b040h
L_15795:
        je      L_15798
        ret
L_15798:
        cmp     cl, 0
L_1579B:
        je      br_157A2
        mov     byte ptr [B_19D7], ch
        ret
br_157A2:
        mov     ch, byte ptr [B_19D7]
        ret
midi_switch_dispatch:
        mov     dx, ax
        and     dh, 0f0h
        cmp     dh, 0b0h
        jne     br_157CC
        inc     dl
        mov     si, D_0C0D
        call    midi_switch_compare_and_fire
L_157B9:
        jae     L_157BC
        ret
L_157BC:
        call    midi_switch_compare_and_fire
L_157BF:
        jae     L_157C2
        ret
L_157C2:
        call    midi_switch_compare_and_fire
L_157C5:
        jae     br_157C8
        ret
br_157C8:
        call    midi_switch_compare_and_fire
        ret
br_157CC:
        clc
        ret
midi_switch_compare_and_fire:
        cmp     dl, byte ptr [si]
L_157D0:
        jne     midi_switch_next
        mov     bl, byte ptr [si+1]
        mov     bh, 0
        shl     bx, 1
        cmp     cl, 40h
        call    word ptr cs:[bx+TBL_MIDISW_HANDLER]
        mov     byte ptr [G_POS_REDRAW_REQ], 1
        stc
        ret
midi_switch_next:
        add     si, 2
        clc
        ret
TBL_MIDISW_HANDLER:
        dw      midisw_play_start, midisw_play, midisw_stop, midisw_rec_play
        dw      midisw_odub_play, midisw_rec_punch, midisw_odub_punch, midisw_tap
        dw      midisw_pad_bank, midisw_pad, midisw_pad, midisw_pad
        dw      midisw_pad, midisw_pad, midisw_pad, midisw_pad
        dw      midisw_pad, midisw_pad, midisw_pad, midisw_pad
        dw      midisw_pad, midisw_pad, midisw_pad, midisw_pad
        dw      midisw_pad, midisw_f1, midisw_f2, midisw_f3
        dw      midisw_f4, midisw_f5, midisw_f6
midisw_play_start:
        jae     calls_field_highlight_1582e
        ret
calls_field_highlight_1582e:
        mov     al, 29h
calls_field_highlight_15830:
        call    field_highlight
calls_field_normal_15833:
        call    field_normal
        ret
midisw_play:
        jae     calls_field_highlight_1583a
        ret
calls_field_highlight_1583a:
        mov     al, 1fh
        if      FW_VERSION = 172
calls_field_highlight_1583c:
        endif
        call    field_highlight
calls_field_normal_1583f:
        call    field_normal
        ret
midisw_stop:
        jae     calls_field_highlight_15846
        ret
calls_field_highlight_15846:
        mov     al, 1eh
calls_field_highlight_15848:
        call    field_highlight
        if      FW_VERSION = 172
calls_field_normal_1584b:
        endif
        call    field_normal
        ret
midisw_rec_play:
        jae     calls_field_highlight_15852
        ret
calls_field_highlight_15852:
        mov     al, 1ch
calls_field_highlight_15854:
        call    field_highlight
calls_field_normal_15857:
        call    midisw_play
        mov     al, 1ch
calls_field_normal_1585c:
        call    field_normal
        ret
midisw_odub_play:
        jae     calls_field_highlight_15863
        ret
calls_field_highlight_15863:
        mov     al, 1dh
calls_field_highlight_15865:
        call    field_highlight
calls_field_normal_15868:
        call    midisw_play
        mov     al, 1dh
calls_field_normal_1586d:
        call    field_normal
        ret
midisw_rec_punch:
        jae     L_15874
        ret
L_15874:
        cmp     byte ptr [SEQ_RUNNING], 0
L_15879:
        je      midisw_play
        cmp     byte ptr [SEQ_REC_ARMED], 0
calls_field_highlight_15880:
        je      midisw_rec_play
        mov     al, 1ch
calls_field_highlight_15884:
        call    field_highlight
        if      FW_VERSION = 150
calls_field_normal_1584b:
        endif
calls_field_normal_15887:
        call    field_normal
        ret
midisw_odub_punch:
        jae     L_1588E
        ret
L_1588E:
        cmp     byte ptr [SEQ_RUNNING], 0
L_15893:
        je      midisw_play
        cmp     byte ptr [SEQ_ODUB_ARMED], 0
calls_field_highlight_1589a:
        je      midisw_odub_play
        mov     al, 1dh
calls_field_highlight_1589e:
        call    field_highlight
calls_field_normal_158a1:
        call    field_normal
        ret
midisw_tap:
        mov     al, 16h
jmp_field_normal_158a7:
        jae     jmp_field_highlight_158ab
        jmp     SHORT field_normal
jmp_field_highlight_158ab:
        jmp     SHORT field_highlight
midisw_pad_bank:
        jae     calls_field_highlight_158b0
        ret
        if      FW_VERSION = 150
calls_field_highlight_1583c:
        endif
calls_field_highlight_158b0:
        mov     al, 25h
calls_field_highlight_158b2:
        call    field_highlight
calls_field_normal_158b5:
        call    field_normal
        ret
midisw_pad:
        mov     al, 7fh
        jae     L_158BF
        mov     al, 0
L_158BF:
        shr     bl, 1
        sub     bl, 9
L_158C4:
        mov     bh, 0
        mov     ah, bl
        mov     byte ptr [bx+TBL_PAD_VELOCITY], al
        cli
L_158CD:
        mov     bl, byte ptr [PAD_RING_WR]
        mov     word ptr [bx+BUF_PAD_EVENT_RING], ax
L_158D5:
        add     byte ptr [PAD_RING_WR], 2
        sti
        ret
midisw_f1:
        mov     al, 1
        jmp     SHORT calls_field_highlight_158f2
midisw_f2:
        mov     al, 2
        jmp     SHORT calls_field_highlight_158f2
midisw_f3:
        mov     al, 3
        jmp     SHORT calls_field_highlight_158f2
midisw_f4:
        mov     al, 4
        jmp     SHORT calls_field_highlight_158f2
midisw_f5:
        mov     al, 5
        jmp     SHORT calls_field_highlight_158f2
midisw_f6:
        mov     al, 6
calls_field_highlight_158f2:
        jae     calls_field_highlight_158f5
        ret
calls_field_highlight_158f5:
        call    field_highlight
calls_field_normal_158f8:
        call    field_normal
        ret
field_normal:
        mov     ah, 85h
        jmp     SHORT br_15902
field_highlight:
        mov     ah, 84h
br_15902:
        cli
        mov     bl, byte ptr [PANEL_RING_WR]
        sub     bh, bh
        mov     word ptr [bx+BUF_PANEL_EVENT_RING], ax
        add     byte ptr [PANEL_RING_WR], 2
        sti
        ret
midi_event_route:
        test    ch, 80h
        je      L_1591C
        call    L_1591D
L_1591C:
        retf
L_1591D:
        test    ch, 40h
        je      L_15927
        push    cx
L_15923:
        call    sound_event_enqueue
        pop     cx
L_15927:
        test    ch, 20h
L_1592A:
        jne     L_1592D
        ret
L_1592D:
        mov     bh, ch
        and     bh, 0fh
        or      ah, bh
        test    ch, 10h
jmp_field_edit_init_15937:
        jne     br_1593B
        jmp     midi_out_enqueue
br_1593B:
        jmp     SHORT error_midi_out_full_159b3
midi_out_enqueue:
        push    si
        push    dx
        push    bx
        push    ax
        mov     word ptr [MIDI_OUT1_RS_TIMEOUT], 1f4h
        mov     dx, word ptr [MIDI_OUT1_WR]
        mov     bx, dx
        sub     dx, word ptr [MIDI_OUT1_RD]
        and     dh, 1
        cmp     dx, 1f0h
        jb      br_1595E
        mov     word ptr [MIDI_OUT1_RD], bx

br_1595E:
        mov     si, BUF_MIDI_OUT1_RING
        cmp     ah, 0f0h
        jae     br_1596C
        cmp     ah, byte ptr [MIDI_OUT1_RUNNING_STATUS]
        je      br_15976
br_1596C:
        mov     byte ptr [MIDI_OUT1_RUNNING_STATUS], ah
        mov     byte ptr [bx+si], ah
        inc     bx
        and     bh, 1

br_15976:
        mov     byte ptr [bx+si], al
        inc     bx
        and     bh, 1
        cmp     ah, 0c0h
        jb      br_15986
        cmp     ah, 0e0h
        jb      br_1598C
br_15986:
        mov     byte ptr [bx+si], cl
        inc     bx
        and     bh, 1

br_1598C:
        cli
        mov     word ptr [MIDI_OUT1_WR], bx
        mov     dx, 1a6h
        mov     al, 0f7h
        out     dx, al
        sti
        pop     ax
        pop     bx
        pop     dx
        pop     si
        ret
L_1599D:
        INT_2A "   MIDI Out full !!"
error_midi_out_full_159b3:
        push    si
        push    dx
        push    bx
        push    ax
        mov     word ptr [D_1A24], 1f4h
        mov     dx, word ptr [MIDI_OUT2_WR]
        mov     bx, dx
        sub     dx, word ptr [MIDI_OUT2_RD]
        and     dh, 1
        cmp     dx, 1f0h
        jb      br_159D4
        mov     word ptr [MIDI_OUT2_RD], bx
br_159D4:
        mov     si, BUF_MIDI_OUT2_RING
        cmp     ah, 0f0h
        jae     br_159E2
        cmp     ah, byte ptr [MIDI_OUT2_RUNNING_STATUS]
        je      br_159EC
br_159E2:
        mov     byte ptr [MIDI_OUT2_RUNNING_STATUS], ah
        mov     byte ptr [bx+si], ah
        inc     bx
        and     bh, 1
br_159EC:
        mov     byte ptr [bx+si], al
        inc     bx
        and     bh, 1
        cmp     ah, 0c0h
        jb      br_159FC
        cmp     ah, 0e0h
        jb      br_15A02

br_159FC:
        mov     byte ptr [bx+si], cl
        inc     bx
        and     bh, 1

br_15A02:
        cli
        mov     word ptr [MIDI_OUT2_WR], bx
        mov     dx, 186h
        mov     al, 0f7h
        out     dx, al
        sti
        pop     ax
        pop     bx
        pop     dx
        pop     si
        ret
        if      FW_VERSION = 172
midi_out_rings_drain_wait:
        mov     word ptr [G_TIMEOUT_TICKS], 64h
L_15A19:
        cmp     word ptr [G_TIMEOUT_TICKS], 0
L_15A1E:
        jne     L_15A21
        ret
L_15A21:
        mov     ax, word ptr [MIDI_OUT1_RD]
        cmp     ax, word ptr [MIDI_OUT1_WR]
        jne     L_15A19
L_15A2A:
        cmp     word ptr [G_TIMEOUT_TICKS], 0
L_15A2F:
        jne     L_15A32
        ret
L_15A32:
        mov     ax, word ptr [MIDI_OUT2_RD]
        cmp     ax, word ptr [MIDI_OUT2_WR]
        jne     L_15A2A
        ret
        endif
L_15A3C:
        call    L_15A40
        retf
L_15A40:
        test    ch, 80h
        if      FW_VERSION = 172
        jne     br_15A46
        ret
br_15A46:
        test    ch, 20h
        endif
        jne     midi_out_ring_put
        ret
midi_out_ring_put:
        test    ch, 10h
L_15A4F:
        jne     midi_out2_ring_put
midi_out1_ring_put:
        push    ax
loop_15A52:
        mov     dx, word ptr [MIDI_OUT1_WR]
        mov     bx, dx
        sub     dx, word ptr [MIDI_OUT1_RD]
        and     dh, 1
        cmp     dx, 1f0h
        jae     loop_15A52
        mov     byte ptr [bx+BUF_MIDI_OUT1_RING], al
        inc     bx
        and     bh, 1
        cli
        mov     word ptr [MIDI_OUT1_WR], bx
        mov     dx, 1a6h
        mov     al, 0f7h
        out     dx, al
        sti
        mov     byte ptr [MIDI_OUT1_RUNNING_STATUS], 0ffh
        pop     ax
        ret
midi_out2_ring_put:
        push    ax
loop_15A81:
        mov     dx, word ptr [MIDI_OUT2_WR]
        mov     bx, dx
        sub     dx, word ptr [MIDI_OUT2_RD]
        and     dh, 1
        cmp     dx, 1f0h
        jae     loop_15A81
        mov     byte ptr [bx+BUF_MIDI_OUT2_RING], al
        inc     bx
        and     bh, 1
        cli
        mov     word ptr [MIDI_OUT2_WR], bx
        mov     dx, 186h
        mov     al, 0f7h
        out     dx, al
        mov     byte ptr [MIDI_OUT2_RUNNING_STATUS], 0ffh
        sti
        pop     ax
        ret
display_value:
        cmp     byte ptr [G_SYNC_OUT_MODE], 1
        je      L_15AB7
        retf
L_15AB7:
        if      FW_VERSION = 172
        cmp     al, 0fbh
L_15AB9:
        jne     L_15AC3
        cmp     byte ptr [D_1A1F], 0fah
L_15AC0:
        jne     L_15AC3
        retf
L_15AC3:
        mov     byte ptr [D_1A1F], al
        endif
L_15AC6:
        call    sync_out_send_realtime
        retf
sync_out_send_realtime:
        cmp     byte ptr [G_SYNC_OUT_MODE], 1
L_15ACF:
        if      FW_VERSION = 172
        je      L_15AD2
        ret
L_15AD2:
        push    ax
        inc     byte ptr [D_0BCE]
        test    byte ptr [D_0BCE], 1
        je      L_15AE1
L_15ADE:
        call    midi_out1_ring_put_realtime
L_15AE1:
        pop     ax
        test    byte ptr [D_0BCE], 2
        je      L_15AEC
L_15AE9:
        call    midi_out2_ring_put_realtime
L_15AEC:
        dec     byte ptr [D_0BCE]
        else
        je      midi_out1_ring_put_realtime
        endif
        ret
midi_out1_ring_put_realtime:
        if      FW_VERSION = 150
        cmp     byte ptr [D_0BCE], 0
        jne     midi_out2_ring_put_realtime
        endif
        cli
        mov     bx, word ptr [MIDI_OUT1_RD]
        cmp     bx, word ptr [MIDI_OUT1_WR]
        je      br_15B15
        cmp     byte ptr [bx+BUF_MIDI_OUT1_RING], 0f8h
        jb      br_15B15
        mov     bx, word ptr [MIDI_OUT1_WR]
        mov     byte ptr [bx+BUF_MIDI_OUT1_RING], al
        inc     bx
        and     bh, 1
        mov     word ptr [MIDI_OUT1_WR], bx
        jmp     SHORT br_15B21
br_15B15:
        dec     bx
        and     bh, 1
        mov     byte ptr [bx+BUF_MIDI_OUT1_RING], al
        mov     word ptr [MIDI_OUT1_RD], bx
br_15B21:
        mov     dx, 1a6h
        mov     al, 0f7h
        out     dx, al
        sti
        mov     byte ptr [MIDI_OUT1_RUNNING_STATUS], 0ffh
        ret
midi_out2_ring_put_realtime:
        cli
        mov     bx, word ptr [MIDI_OUT2_RD]
        cmp     bx, word ptr [MIDI_OUT2_WR]
        je      br_15B52
        cmp     byte ptr [bx+BUF_MIDI_OUT2_RING], 0f8h
        jb      br_15B52
        mov     bx, word ptr [MIDI_OUT2_WR]
        mov     byte ptr [bx+BUF_MIDI_OUT2_RING], al
        inc     bx
        and     bh, 1
        mov     word ptr [MIDI_OUT2_WR], bx
        jmp     SHORT L_15B5E
br_15B52:
        dec     bx
        and     bh, 1
        mov     byte ptr [bx+BUF_MIDI_OUT2_RING], al
        mov     word ptr [MIDI_OUT2_RD], bx
L_15B5E:
        mov     dx, 186h
        mov     al, 0f7h
        out     dx, al
        sti
        mov     byte ptr [MIDI_OUT2_RUNNING_STATUS], 0ffh
        ret
isr_int4a:
        pusha
        push    ds
        push    es
        mov     bx, DATA_SEG
        mov     ds, bx
        mov     bx, P_5D04
        test    ah, 1
        je      calls_bx_15b7e
        mov     bx, P_5D3A
calls_bx_15b7e:
        call    bx
        pop     es
        pop     ds
        popa
        iret
L_15B84:
        cli
        mov     bx, word ptr [MIDI_OUT1_RD]
        cmp     bx, word ptr [MIDI_OUT1_WR]
        je      br_15BA1
        mov     bx, word ptr [MIDI_OUT1_WR]
        mov     byte ptr [bx+BUF_MIDI_OUT1_RING], al
        inc     bx
        and     bh, 1
        mov     word ptr [MIDI_OUT1_WR], bx
        jmp     SHORT L_15BAD
br_15BA1:
        dec     bx
        and     bh, 1
        mov     byte ptr [bx+BUF_MIDI_OUT1_RING], al
        mov     word ptr [MIDI_OUT1_RD], bx
L_15BAD:
        mov     dx, 1a6h
        mov     al, 0f7h
        out     dx, al
        sti
        mov     byte ptr [MIDI_OUT1_RUNNING_STATUS], 0ffh
        ret
L_15BBA:
        cli
        mov     bx, word ptr [MIDI_OUT2_RD]
        cmp     bx, word ptr [MIDI_OUT2_WR]
        je      br_15BD7
        mov     bx, word ptr [MIDI_OUT2_WR]
        mov     byte ptr [bx+BUF_MIDI_OUT2_RING], al
        inc     bx
        and     bh, 1
        mov     word ptr [MIDI_OUT2_WR], bx
        jmp     SHORT L_15BE3
br_15BD7:
        dec     bx
        and     bh, 1
        mov     byte ptr [bx+BUF_MIDI_OUT2_RING], al
        mov     word ptr [MIDI_OUT2_RD], bx
L_15BE3:
        mov     dx, 186h
        mov     al, 0f7h
        out     dx, al
        sti
        mov     byte ptr [MIDI_OUT2_RUNNING_STATUS], 0ffh
        ret
L_15BF0:
        call    pad_event_ring_poll
        retf
pad_event_ring_poll:
        mov     bl, byte ptr [PAD_RING_RD]
        cmp     bl, byte ptr [PAD_RING_WR]
        jne     L_15BFF
        ret
L_15BFF:
        sub     bh, bh
        mov     ax, word ptr [bx+BUF_PAD_EVENT_RING]
L_15C05:
        add     byte ptr [PAD_RING_RD], 2
        cmp     al, 0
L_15C0C:
        jne     pad_hit_entry
pad_held_note_release:
        push    ax
L_15C0F:
        call    held_note_slot_free
        pop     ax
pad_note_off_publish:
        mov     bl, ah
        mov     bh, 0
        mov     ah, 0ffh
        xchg    byte ptr [bx+TBL_PAD_HELD_NOTE], ah
        cmp     ah, 0ffh
L_15C20:
        je      L_15C25
        jmp     NEAR note_event_publish
L_15C25:
        ret
pad_hit_entry:
        cmp     byte ptr [B_0B1C], 0
L_15C2B:
        jne     sixteen_levels_pad_hit_dispatch
        ret
sixteen_levels_pad_hit_dispatch:
        mov     bl, ah
        mov     bh, 0
        or      bl, byte ptr [G_PAD_BANK_OFS]
        mov     dx, CS0_SEG
        mov     es, dx
        les     si, es:[0f0h]
        mov     ah, byte ptr es:[bx+si]
        or      al, byte ptr [G_FULL_LEVEL]
        cmp     byte ptr [SIXTEEN_LEVELS_ON], 0
        je      L_15CAA
        push    ax
        mov     ah, 0
        mov     al, 0
L_15C53:
        pusha
        call    pad_note_off_publish
        popa
        inc     ah
        cmp     ah, 10h
        jne     L_15C53
        pop     ax
        mov     ah, byte ptr [SL_NOTE]
        and     bl, 0fh
        cmp     byte ptr [SL_PARAM], 0
L_15C6C:
        jne     br_15C74
        mov     al, byte ptr [bx+TBL_SL_VELOCITY]
        jmp     SHORT L_15CAA
br_15C74:
        mov     si, P_6396
        cmp     byte ptr [G_SL_TYPE], 1
        jae     br_15C9C
        cmp     byte ptr [G_SL_TYPE], 2
        jae     br_15C9C
        mov     si, P_63B6
        cmp     byte ptr [G_SL_TYPE], 3
        je      br_15C9C
        mov     si, P_637D
        mov     cl, 9
        sub     cl, byte ptr [G_SL_ORIG_KEY_PAD]
        sub     ch, ch
        add     si, cx
br_15C9C:
        mov     cl, byte ptr [bx+si]
        mov     byte ptr [NOTE_VAR_VALUE], cl
        mov     cl, byte ptr [G_SL_TYPE]
        mov     byte ptr [G_NOTE_VAR_TYPE], cl
L_15CAA:
        cmp     byte ptr [B_1D88], 0
L_15CAF:
        je      L_15CB7
        mov     byte ptr [B_1D88], 0
        ret
L_15CB7:
        cmp     ah, 23h
L_15CBA:
        jae     L_15CBD
        ret
L_15CBD:
        cmp     ah, 63h
L_15CC0:
        jb      L_15CC3
        ret
L_15CC3:
        push    ax
        push    bx
L_15CC5:
        call    held_note_slot_alloc
L_15CC8:
        call    fn_15D97
        pop     bx
        pop     ax
L_15CCD:
        jae     br_15CD0
        ret
br_15CD0:
        and     bl, 0fh
        mov     bh, 0
        mov     byte ptr [bx+TBL_PAD_HELD_NOTE], ah
note_event_publish:
        mov     bl, byte ptr [NOTE_RING_WR]
        mov     bh, 0
        mov     word ptr [bx+NOTE_EVENT_RING], ax
        add     byte ptr [NOTE_RING_WR], 2
        mov     cl, al
        mov     al, ah
        mov     ah, 90h
        mov     dx, 40h
        push    es
        push    si
        sub     si, si
        mov     es, si
        les     si, es:[0f4h]
        cmp     al, byte ptr es:[si+TBL_0013]
        pop     si
        pop     es
        jne     br_15D0C
        or      dh, byte ptr [G_NOTE_VAR_TYPE]
        mov     dl, byte ptr [NOTE_VAR_VALUE]
br_15D0C:
        mov     ch, 0
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bl, byte ptr [SEL_TRACK]
        mov     bh, 0
        mov     ch, byte ptr es:[bx+TRK_CHANNEL]
        cmp     byte ptr [SEQ_ODUB_ARMED], 0
        jne     L_15D2F
        cmp     word ptr [UI_SLOT_IDLE], main_screen_idle
        je      L_15D2F
        or      ch, 40h
L_15D2F:
        mov     bl, al
        sub     bl, 23h
L_15D34:
        cmp     bl, 40h
        jb      br_15D3B
        mov     bl, 3fh
br_15D3B:
        mov     bh, 0
        cmp     cl, 0
        jne     L_15D46
        mov     ch, byte ptr [bx+TBL_1916]
L_15D46:
        mov     byte ptr [bx+TBL_1916], ch
        test    ch, 40h
        je      br_15D56
        push    cx
        mov     ch, 0
L_15D52:
        call    sound_event_enqueue
        pop     cx
br_15D56:
        and     ch, 0bfh
        or      ch, 80h
        push    cs
        call    midi_event_route
        ret
held_note_slot_alloc:
        mov     cx, 4
        mov     dx, 0ffffh
        mov     si, P_18FE
L_15D6A:
        cmp     dx, word ptr [si]
L_15D6C:
        je      L_15D74
        add     si, 2
        loop    L_15D6A
        ret
L_15D74:
        mov     ch, ah
        mov     cl, bl
L_15D78:
        and     cl, 0fh
        mov     word ptr [si], cx
        ret
held_note_slot_free:
        mov     cx, 4
        mov     dx, 0ffffh
        mov     si, P_18FE
tgt_15D87:
        cmp     dx, word ptr [si]
        je      br_15D91
        cmp     byte ptr [si], ah
        jne     br_15D91
        mov     word ptr [si], dx
br_15D91:
        add     si, 2
        loop    tgt_15D87
        ret
fn_15D97:
        mov     cl, byte ptr [SEQ_ODUB_ARMED]
        and     cl, byte ptr [G_TAP_HELD]
        jne     br_15DB4
        cmp     byte ptr [G_TC_NOTE_VALUE], 0
        je      br_15DB2
        mov     cl, byte ptr [B_14CF]
        and     cl, byte ptr [SEQ_RUNNING]
        jne     br_15DB4

br_15DB2:
        clc
        ret
br_15DB4:
        stc
        ret
sound_event_enqueue_far:
        call    sound_event_enqueue
        retf

sound_event_enqueue:
        cmp     ah, 0a0h
        je      br_15E00
        cmp     ah, 0d0h
        jae     br_15E00
        push    ax
        push    bx
        push    cx
        cmp     ah, 80h
        jae     br_15DCF
        shl     ah, 4
br_15DCF:
        mov     bl, byte ptr [SND_EVENT_WR]
        mov     bh, bl
        sub     bh, byte ptr [SND_EVENT_RD]
        cmp     bh, 0c0h
        jb      br_15DE2
        mov     byte ptr [SND_EVENT_RD], bl
br_15DE2:
        or      ah, dh
        cmp     ch, 0
        je      br_15DEC
        or      ah, 8
br_15DEC:
        mov     ch, dl
        sub     bh, bh
        mov     word ptr [bx+SND_EVENT_RING], ax
        mov     word ptr [bx+P_CEDA], cx
        add     byte ptr [SND_EVENT_WR], 4
        pop     cx
        pop     bx
        pop     ax
br_15E00:
        ret
held_notes_release_all:
        mov     ax, 0ffffh
        mov     word ptr [W_18FE], ax
        mov     word ptr [W_1900], ax
        mov     word ptr [W_1902], ax
        mov     word ptr [W_1904], ax
        mov     si, P_1906
        mov     cx, 10h
        sub     ax, ax
tgt_15E18:
        cmp     byte ptr [si], 0ffh
        je      br_15E22
        pusha
        call    pad_held_note_release
        popa
br_15E22:
        inc     si
        inc     ah
        loop    tgt_15E18
        retf
far_15E28:
        call    L_15E2C
        retf
L_15E2C:
        cmp     byte ptr [G_TC_NOTE_VALUE], 0
L_15E31:
        jne     L_15E34
        ret
L_15E34:
        cmp     byte ptr [B_14CF], 0
L_15E39:
        jne     br_15E3C
        ret
br_15E3C:
        mov     al, byte ptr [G_TC_NOTE_VALUE]
        mov     bx, P_1E36
        xlat
        mov     byte ptr [B_18F2], al
        sub     ah, ah
        mov     bx, ax
        mov     ax, word ptr [SEQ_BAR_TICK]
        div     bl
        cmp     bl, 30h
        je      br_15E59
        cmp     bl, 18h
        jne     L_15E63
br_15E59:
        shr     al, 1
        jae     L_15E63
        mov     bx, word ptr [G_SWING_OFFSET]
        sub     ah, bl
L_15E63:
        cmp     ah, 0
L_15E66:
        je      br_15E69
        ret
br_15E69:
        mov     byte ptr [B_14CF], 0
        mov     cx, 4
        mov     si, P_18FE
tgt_15E74:
        lodsw
        cmp     ax, 0ffffh
        je      br_15E81
        push    cx
        push    si
        call    L_15E89
        pop     si
        pop     cx
br_15E81:
        loop    tgt_15E74
        mov     byte ptr [B_14CF], 1
        ret
L_15E89:
        cmp     al, 80h
L_15E8B:
        jae     L_15EAE
        mov     ah, al
        mov     al, 0
        push    ax
        call    pad_held_note_release
L_15E95:
        call    fn_19F0B
        pop     ax
        mov     bl, ah
        mov     bh, 0
        mov     al, byte ptr [bx+TBL_PAD_VELOCITY]
L_15EA1:
        call    pad_hit_entry
        mov     dl, byte ptr [B_18F2]
        mov     dh, 0
        call    note_ring_drain
        ret
L_15EAE:
        mov     cl, al
        and     cl, 7fh
        mov     al, ah
        mov     ah, 90h
        push    ax
        push    cx
        push    cx
        sub     cx, cx
        call    fn_155CA
        pop     cx
        call    fn_155CA
L_15EC3:
        call    rec_punch_window_check
        pop     cx
        pop     dx
L_15EC8:
        jae     br_15ECB
        ret
br_15ECB:
        mov     ch, dl
        mov     al, 5
        mul     ch
        mov     bx, ax
        add     bx, REC_HELD_NOTES
        or      cl, 80h
        mov     byte ptr [bx], cl
        sub     ax, ax
        mov     word ptr [bx+1], ax
        mov     al, byte ptr [B_18F2]
        mov     ah, 0
        mov     word ptr [bx+3], ax
        or      byte ptr [G_REC_EVENTS_ADDED], 1
        ret
midi_in_held_note_track:
        cmp     ah, 90h
L_15EF2:
        je      L_15EF5
        ret
L_15EF5:
        mov     ah, al
        mov     al, cl
        cmp     cl, 0
L_15EFC:
        je      br_15F16
        or      al, 80h
        mov     cx, 4
        mov     dx, 0ffffh
        mov     si, P_18FE
L_15F09:
        cmp     dx, word ptr [si]
L_15F0B:
        je      br_15F13
        add     si, 2
        loop    L_15F09
        ret
br_15F13:
        mov     word ptr [si], ax
        ret
br_15F16:
        mov     cx, 4
        mov     dx, 0ffffh
        mov     si, P_18FE
tgt_15F1F:
        cmp     dx, word ptr [si]
        je      br_15F2A
        cmp     byte ptr [si+1], ah
        jne     br_15F2A
        mov     word ptr [si], dx
br_15F2A:
        add     si, 2
        loop    tgt_15F1F
        ret
sync_out_send_song_position:
        cmp     byte ptr [G_SYNC_OUT_MODE], 1
        if      FW_VERSION = 172
L_15F35:
        endif
        jne     L_15F89
        if      FW_VERSION = 150
L_15F35:
        endif
        mov     ax, word ptr [SEQ_ABS_TICK_LO]
        mov     dx, word ptr [SEQ_ABS_TICK_HI]
        cmp     byte ptr [G_SONG_MODE], 0
        je      br_15F4D
        add     ax, word ptr [W_582E]
        adc     dx, word ptr [W_5830]
br_15F4D:
        mov     bx, 18h
        cmp     dx, bx
        jae     L_15F8D
        div     bx
        or      dx, dx
        je      L_15F5B
        inc     ax
        if      FW_VERSION = 150
        cmp     ax, word ptr [W_1A3D]
        je      L_15F8D
        endif
L_15F5B:
        mov     word ptr [W_1A3D], ax
        shl     ax, 1
        shr     al, 1
        mov     cl, ah
        mov     ah, 0f2h
        if      FW_VERSION = 150
        mov     bx, midi_out_enqueue
        cmp     byte ptr [D_0BCE], 0
        je      L_167BB
        mov     bx, error_midi_out_full_159b3
L_167BB:
        endif
        cli
        if      FW_VERSION = 172
        push    ax
        push    cx
        inc     byte ptr [D_0BCE]
        test    byte ptr [D_0BCE], 1
        je      L_15F77
calls_field_edit_init_15f74:
        call    midi_out_enqueue
L_15F77:
        pop     cx
        pop     ax
        test    byte ptr [D_0BCE], 2
        je      L_15F83
L_15F80:
        call    error_midi_out_full_159b3
L_15F83:
        dec     byte ptr [D_0BCE]
        else
        call    bx
        endif
        sti
        retf
L_15F89:
        push    cs
L_15F8A:
        call    mmc_send_locate
L_15F8D:
        retf
sync_out_mtc_restart:
        mov     byte ptr [MTC_TX_QF_PIECE], 0ffh
        mov     byte ptr [MTC_TX_QF_DELAY], 1
L_15F98:
        call    sync_out_mtc_tick
        retf
sync_out_mtc_tick:
        cmp     byte ptr [B_1D84], 0
L_15FA1:
        jne     L_15FA4
        ret
L_15FA4:
        cmp     byte ptr [G_SYNC_OUT_MODE], 2
L_15FA9:
        je      L_15FAC
        ret
L_15FAC:
        cmp     byte ptr [MTC_TX_QF_PIECE], 0ffh
        jne     L_15FC1
L_15FB3:
        call    fn_16099
        jb      L_15FB9
        ret
L_15FB9:
        mov     byte ptr [MTC_TX_QF_PIECE], 0
L_15FBE:
        call    smpte_time_from_position
L_15FC1:
        dec     byte ptr [MTC_TX_QF_DELAY]
L_15FC5:
        je      L_15FC8
        ret
L_15FC8:
        mov     bl, byte ptr [MTC_TX_QF_PIECE]
        mov     ah, bl
        shl     ah, 4
        sub     bh, bh
        shl     bx, 1
        call    word ptr cs:[bx+mtc_tx_piece_table]
        push    ax
        mov     al, 0f1h
L_15FDD:
        call    sync_out_send_mtc_qf
        pop     ax
        or      al, ah
L_15FE3:
        call    sync_out_send_mtc_qf
        inc     byte ptr [MTC_TX_QF_PIECE]
        cmp     byte ptr [MTC_TX_QF_PIECE], 8
        jne     L_15FF6
        mov     byte ptr [MTC_TX_QF_PIECE], 0
L_15FF6:
        call    sync_out_mtc_qf_interval_set
        ret
sync_out_send_mtc_qf:
        mov     ah, 0f1h
        if      FW_VERSION = 172
        push    ax
        inc     byte ptr [D_0BCE]
        test    byte ptr [D_0BCE], 1
        je      L_1600B
        call    midi_out1_ring_put
L_1600B:
        pop     ax
        test    byte ptr [D_0BCE], 2
        je      L_16016
L_16013:
        call    midi_out2_ring_put
L_16016:
        dec     byte ptr [D_0BCE]
        ret
        else
        mov     cl, 0ffh
        cmp     byte ptr [D_0BCE], 0
        jne     L_1683F
        jmp     midi_out1_ring_put
L_1683F:
        jmp     midi_out2_ring_put
        endif
mtc_tx_piece_table:
        dw      mtc_tx_frame_lo, mtc_tx_frame_hi, mtc_tx_sec_lo, mtc_tx_sec_hi
        dw      mtc_tx_min_lo, mtc_tx_min_hi, mtc_tx_hour_lo, mtc_tx_hour_hi
mtc_tx_frame_lo:
        mov     si, P_1A6C
        mov     di, mtc_tx_hour
        mov     ax, ds
        mov     es, ax
        mov     cx, 5
        rep movsb
        mov     ah, 0
        mov     al, byte ptr [MTC_TX_FRAME]
        and     al, 0fh
        ret
mtc_tx_frame_hi:
        mov     al, byte ptr [MTC_TX_FRAME]
        shr     al, 4
        ret
mtc_tx_sec_lo:
        mov     al, byte ptr [MTC_TX_SEC]
        and     al, 0fh
        ret
mtc_tx_sec_hi:
        mov     al, byte ptr [MTC_TX_SEC]
        shr     al, 4
        ret
mtc_tx_min_lo:
        mov     al, byte ptr [MTC_TX_MIN]
        and     al, 0fh
        ret
mtc_tx_min_hi:
        mov     al, byte ptr [MTC_TX_MIN]
        shr     al, 4
        ret
mtc_tx_hour_lo:
        mov     al, byte ptr [MTC_TX_HOUR]
        and     al, 0fh
        ret
mtc_tx_hour_hi:
        mov     al, byte ptr [MTC_TX_HOUR]
        shr     al, 4
        push    ax
        push    cs
        call    smpte_time_frame_advance
        push    cs
        call    smpte_time_frame_advance
        pop     ax
        ret
sync_out_mtc_qf_interval_set:
        mov     bl, byte ptr [G_FRAME_RATE]
        sub     bh, bh
        shl     bx, 1
        mov     si, word ptr [bx+TBL_MTC_QF_INTERVALS]
        mov     bl, byte ptr [MTC_TX_FRAME]
L_168B1:
        sub     bh, bh
        shl     bx, 2
        add     bl, byte ptr [MTC_TX_QF_PIECE]
        mov     al, byte ptr [bx+si]
        mov     byte ptr [MTC_TX_QF_DELAY], al
        ret
fn_16099:
        mov     ax, word ptr [SEQ_ELAPSED_MS_LO]
        mov     dx, word ptr [SEQ_ELAPSED_MS_HI]
        mov     bx, word ptr [SEQ_START_TIME_LO]
        mov     cx, word ptr [SEQ_START_TIME_HI]
        cmp     byte ptr [G_SONG_MODE], 0
        je      L_160B7
        add     bx, word ptr [G_SONG_STEP_START_LO]
        adc     cx, word ptr [G_SONG_STEP_START_HI]
L_160B7:
        add     ax, bx
        adc     dx, cx
        mov     di, 27c0h
        mov     si, 9
        nop
        push    cs
calls_state_check_104_160c3:
        call    state_check_104FB
        mov     ax, di
        mov     dx, si
        mov     di, 3e8h
        cmp     byte ptr [G_FRAME_RATE], 2
        jne     calls_state_check_104_160d5
        inc     di
calls_state_check_104_160d5:
        sub     si, si
        nop
        push    cs
calls_state_check_104_160d9:
        call    state_check_104FB
        mov     ax, di
        mov     bl, byte ptr [G_FRAME_RATE]
        mov     bh, 0
        mov     bl, byte ptr [bx+TBL_SMPTE_FPS]
        mul     bx
        mov     cx, 3e8h
        div     cx
        cmp     dx, bx
        ret
smpte_time_frame_advance:
        inc     byte ptr [SMPTE_FRAME]
        mov     al, byte ptr [SMPTE_FRAME]
        mov     bl, byte ptr [G_FRAME_RATE]
        mov     bh, 0
        cmp     al, byte ptr [bx+TBL_SMPTE_FPS]
        jne     br_1613A
        mov     byte ptr [SMPTE_FRAME], 0
        inc     byte ptr [SMPTE_SEC]
        cmp     byte ptr [SMPTE_SEC], 3ch
        jne     br_1613A
        mov     byte ptr [SMPTE_SEC], 0
        inc     byte ptr [SMPTE_MIN]
        cmp     byte ptr [SMPTE_MIN], 3ch
        jne     br_1613A
        mov     byte ptr [SMPTE_MIN], 0
        inc     byte ptr [SMPTE_HOUR]
        cmp     byte ptr [SMPTE_HOUR], 18h
        jne     br_1613A
        mov     byte ptr [SMPTE_HOUR], 0
br_1613A:
        cmp     byte ptr [G_FRAME_RATE], 2
        jne     L_16162
        cmp     byte ptr [SMPTE_FRAME], 0
        jne     L_16162
        mov     al, byte ptr [SMPTE_MIN]
        mov     ah, 0
        mov     bl, 0ah
        div     bl
        cmp     ah, 0
        je      L_16162
        cmp     byte ptr [SMPTE_SEC], 0
        jne     L_16162
        mov     byte ptr [SMPTE_FRAME], 2
L_16162:
        retf
midi_send_start:
        mov     si, P_1A59
L_16166:
        call    sync_out_send_msg
        mov     byte ptr [SYNC_OUT_STARTED], 1
        retf
midi_send_stop:
        mov     si, P_1A5F
L_16172:
        call    sync_out_send_msg
        mov     byte ptr [SYNC_OUT_STARTED], 0
        retf
mmc_send_locate:
        call    smpte_time_from_position
        mov     si, P_1A65
L_16181:
        call    sync_out_send_msg
        mov     word ptr [G_TIMEOUT_TICKS], 0ah
loop_1618A:
        cmp     word ptr [G_TIMEOUT_TICKS], 0
        jne     loop_1618A
        retf
sync_out_send_msg:
        cmp     byte ptr [G_SEND_MMC], 0
        jne     L_1619A
        ret
L_1619A:
        lodsb
L_1619B:
        call    sync_out_put_byte
        cmp     al, 0f7h
        jne     L_1619A
        ret
sync_out_put_byte:
        if      FW_VERSION = 172
        push    ax
        inc     byte ptr [D_0BCE]
        test    byte ptr [D_0BCE], 1
        je      L_161B2
        call    midi_out1_ring_put
L_161B2:
        pop     ax
        test    byte ptr [D_0BCE], 2
        je      L_161BD
        else
        cmp     byte ptr [D_0BCE], 0
        jne     L_169D4
        jmp     midi_out1_ring_put
L_169D4:
        jmp     midi_out2_ring_put
        endif
L_161BA:
        if      FW_VERSION = 172
        call    midi_out2_ring_put
L_161BD:
        dec     byte ptr [D_0BCE]
        ret
        endif
time_accum_hours_far:
        call    time_accum_hours
        retf

time_accum_hours:
        mov     ax, 0e10h
        mov     bx, 3e8h
        mul     bx
        mov     cl, byte ptr [bp]
        mov     ch, 0
        sub     si, si
        sub     di, di
        jcxz    br_161DF
tgt_161D9:
        add     di, ax
        adc     si, dx
        loop    tgt_161D9
br_161DF:
        mov     al, byte ptr [bp+1]
        mov     ah, 3ch
        mul     ah
        mov     bx, 3e8h
        mul     bx
        add     di, ax
        adc     si, dx
        mov     al, byte ptr [bp+2]
        mov     ah, 0
        mov     bx, 3e8h
        mul     bx
        add     di, ax
        adc     si, dx
        mov     al, byte ptr [bp+3]
        mov     ah, 0
        mov     bx, 3e8h
        mul     bx
        sub     bh, bh
        mov     bl, byte ptr [G_FRAME_RATE]
        mov     bl, byte ptr [bx+TBL_SMPTE_FPS]
        div     bx
        or      ax, ax
        je      L_16218
        inc     ax
L_16218:
        add     di, ax
        adc     si, 0
        mov     al, byte ptr [bp+4]
        mov     ah, 0ah
        mul     ah
        div     bl
        mov     ah, 0
        add     di, ax
        adc     si, 0
        cmp     byte ptr [G_FRAME_RATE], 2
L_16232:
        je      L_16235
        ret
L_16235:
        mov     al, byte ptr [bp+1]
        mov     ah, 0
        mov     bl, 0ah
        div     bl
        mov     cl, byte ptr [bp+2]
        mov     ch, 0
        cmp     ah, 0
L_16246:
        jne     br_16254
        cmp     cl, 0
L_1624B:
        jne     br_1624E
        ret
br_1624E:
        add     di, cx
        adc     si, 0
        ret
br_16254:
        mov     al, 43h
        mul     ah
        mov     bl, 0ah
        div     bl
        mov     ah, 0
        add     di, cx
        adc     si, 0
        sub     di, ax
        sbb     si, 0
        ret

smpte_time_from_position_far:
        call    smpte_time_from_position
        retf

smpte_time_from_position:
        mov     ax, word ptr [SEQ_ELAPSED_MS_LO]
        mov     dx, word ptr [SEQ_ELAPSED_MS_HI]
        mov     bx, word ptr [SEQ_START_TIME_LO]
        mov     cx, word ptr [SEQ_START_TIME_HI]
        cmp     byte ptr [G_SONG_MODE], 0
        je      br_1628B
        add     bx, word ptr [G_SONG_STEP_START_LO]
        adc     cx, word ptr [G_SONG_STEP_START_HI]
br_1628B:
        add     ax, bx
        adc     dx, cx
smpte_time_from_ms:
        cmp     byte ptr [G_FRAME_RATE], 2
L_16294:
        jne     L_16298
        jmp     SHORT smpte_time_from_ms_drop_frame
L_16298:
        mov     byte ptr [B_1A3F], 0
        mov     di, 3e8h
        sub     si, si
        nop
        push    cs
calls_state_check_104_162a4:
        call    state_check_104FB
        cmp     dx, 1
        ja      br_162B6
        cmp     dx, 0
        je      L_162BC
        cmp     ax, 5180h
        jb      L_162BC
br_162B6:
        sub     ax, 5180h
        sbb     dx, 1
L_162BC:
        push    di
        mov     di, W_0E10
        sub     si, si
        nop
        push    cs
calls_state_check_104_162c4:
        call    state_check_104FB
        cmp     al, 18h
        jb      br_162CD
        sub     al, 18h
br_162CD:
        and     al, 1fh
        mov     ah, byte ptr [G_FRAME_RATE]
        shl     ah, 5
        or      al, ah
        mov     byte ptr [SMPTE_HOUR], al
        mov     ax, di
        mov     bl, 3ch
        div     bl
        mov     byte ptr [SMPTE_MIN], al
        mov     byte ptr [SMPTE_SEC], ah
        pop     ax
        mov     bl, byte ptr [G_FRAME_RATE]
        mov     bh, 0
        mov     dl, byte ptr [bx+TBL_SMPTE_FPS]
        mov     bl, dl
        mov     dh, 0
        mul     dx
        mov     cx, 3e8h
        div     cx
        mov     byte ptr [SMPTE_FRAME], al
        mov     ax, dx
        mov     bl, 0ah
        div     bl
        mov     byte ptr [SMPTE_SUBFRAME], al
        ret
smpte_time_from_ms_drop_frame:
        mov     di, 27c0h
        mov     si, 9
        nop
        push    cs
calls_state_check_104_16313:
        call    state_check_104FB
        push    di
        push    si
        mov     bx, 6
        div     bx
        cmp     al, 18h
        jb      br_16323
        sub     al, 18h
br_16323:
        and     al, 1fh
        or      al, 40h
        mov     byte ptr [SMPTE_HOUR], al
        mov     al, 0ah
        mul     dl
        mov     byte ptr [SMPTE_MIN], al
        pop     dx
        pop     ax
        mov     bx, 3e9h
        div     bx
        push    dx
        mov     bl, 3ch
        div     bl
        mov     cl, al
        add     byte ptr [SMPTE_MIN], al
        mov     byte ptr [SMPTE_SEC], ah
        pop     ax
        mov     bx, 1eh
        mul     bx
        mov     bx, 3e8h
        div     bx
        mov     byte ptr [SMPTE_FRAME], al
        mov     ax, dx
        mov     bl, 0ah
        div     bl
        mov     byte ptr [SMPTE_SUBFRAME], al
        mov     al, 2
        mul     cl
        add     al, byte ptr [SMPTE_FRAME]
        cmp     al, 1eh
        jb      L_16382
        sub     al, 1eh
        inc     byte ptr [SMPTE_SEC]
        cmp     byte ptr [SMPTE_SEC], 3ch
        jne     L_16382
L_16B8C:
        mov     byte ptr [SMPTE_SEC], 0
        inc     byte ptr [SMPTE_MIN]
        add     al, 2
L_16382:
        mov     byte ptr [SMPTE_FRAME], al
        ret
midi_all_notes_off_far:
        call    midi_all_notes_off
        retf
midi_all_notes_off:
        push    es
        pusha
        mov     bl, 0
L_1638E:
        mov     ah, bl
        or      ah, 0b0h
        mov     al, 7bh
        mov     cl, 0
calls_field_edit_init_16397:
        call    midi_out_enqueue
        mov     ah, bl
        or      ah, 0b0h
        mov     al, 79h
        mov     cl, 0
calls_field_edit_init_163a3:
        call    midi_out_enqueue
        mov     ah, bl
        or      ah, 0b0h
        mov     al, 40h
        mov     cl, 0
calls_field_edit_init_163af:
        call    midi_out_enqueue
        mov     ah, bl
        or      ah, 0b0h
        mov     al, 7
        mov     cl, 64h
calls_field_edit_init_163bb:
        call    midi_out_enqueue
        mov     ah, bl
        or      ah, 0e0h
        mov     al, 0
        mov     cl, 40h
calls_field_edit_init_163c7:
        call    midi_out_enqueue
        inc     bl
L_163CC:
        cmp     bl, 10h
        jne     L_1638E
        popa
        pop     es
        ret
midi_all_notes_off_alt_far:
        call    midi_all_notes_off_alt
        retf
midi_all_notes_off_alt:
        push    es
        pusha
        mov     bl, 0
L_163DC:
        mov     ah, bl
        or      ah, 0b0h
        mov     al, 7bh
        mov     cl, 0
L_163E5:
        call    error_midi_out_full_159b3
        mov     ah, bl
        or      ah, 0b0h
        mov     al, 79h
        mov     cl, 0
L_163F1:
        call    error_midi_out_full_159b3
        mov     ah, bl
        or      ah, 0b0h
        mov     al, 40h
        mov     cl, 0
L_163FD:
        call    error_midi_out_full_159b3
        mov     ah, bl
        or      ah, 0b0h
        mov     al, 7
        mov     cl, 64h
L_16409:
        call    error_midi_out_full_159b3
        mov     ah, bl
        or      ah, 0e0h
        mov     al, 0
        mov     cl, 40h
L_16415:
        call    error_midi_out_full_159b3
        inc     bl
L_1641A:
        cmp     bl, 10h
        jne     L_163DC
        popa
        pop     es
        ret
midi_track_channel_reset_controllers_far:
        call    midi_track_channel_reset_controllers
        retf
midi_track_channel_reset_controllers:
        cmp     byte ptr [SEQ_RUNNING], 0
L_1642B:
        je      br_1642E
        ret
br_1642E:
        push    es
        pusha
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bl, byte ptr [SEL_TRACK]
        mov     bh, 0
        mov     ch, byte ptr es:[bx+TRK_CHANNEL]
        mov     ah, 0b0h
        mov     al, 7bh
        mov     cl, 0
        call    L_1591D
        mov     ah, bl
        or      ah, 0b0h
        mov     al, 79h
        mov     cl, 0
        call    L_1591D
        mov     ah, 0b0h
        mov     al, 78h
        mov     cl, 0
        mov     ah, 0b0h
        mov     al, 40h
        mov     cl, 0
        call    L_1591D
        mov     ah, 0b0h
        mov     al, 7
        mov     cl, 7fh
        call    L_1591D
        mov     ah, 0e0h
        mov     al, 0
        mov     cl, 40h
        call    L_1591D
        popa
        pop     es
        ret
        if      FW_VERSION = 150
        db      00h
        endif
midi_file_import_far:
        call    midi_file_import
        retf
midi_file_import:
        mov     word ptr [MIDIIMP_SAVED_SP], sp
        mov     word ptr [MIDIIMP_SEQ_SEG], ax
        mov     word ptr [MIDIIMP_SRC_END_SEG], bx
        mov     word ptr [W_1C8E], dx
        mov     word ptr [MIDIIMP_DEST_END_SEG], bp
        mov     es, ax
        mov     byte ptr es:[1ah], 4
        mov     byte ptr es:[1bh], 4
        mov     byte ptr es:[16h], 1
        mov     word ptr [MIDIIMP_BAR_TICKS], 180h
        mov     word ptr [W_1C96], 60h
        mov     word ptr [W_1C98], 4b0h
        mov     byte ptr [MIDIIMP_TSIG_NUM], 4
        mov     byte ptr [MIDIIMP_TSIG_DEN], 4
        mov     word ptr [MIDIIMP_BAR_POS], 0
        mov     word ptr [W_1C9E], 0
        mov     word ptr [MIDIIMP_BAR_COUNT], 0
        mov     byte ptr [SMF_TEMPO_SEEN], 0
        if      FW_VERSION = 172
        mov     byte ptr [SMF_TSIG_SEEN], 0
        endif
        mov     word ptr [SMF_TICK_REM], 0
        mov     byte ptr [SMF_FROM_MPC2000], 0
        if      FW_VERSION = 172
        mov     ax, 0f500h
        mov     word ptr [D_1C92], ax
        else
        mov     ax, ds
        endif
        mov     es, ax
        if      FW_VERSION = 172
        sub     di, di
        mov     cx, 4100h
        else
        mov     di, P_9DD8
        mov     cx, 1000h
        endif
        sub     ax, ax
        rep stosw
        sub     di, di
        sub     si, si
L_164FB:
        call    calls_buffer_read_byte_16fc7
        cmp     bx, 4d54h
        je      L_16507
        jmp     NEAR loop_167D2
L_16507:
        cmp     ax, 6864h
L_1650A:
        je      L_1650F
        jmp     NEAR loop_167D2
L_1650F:
        call    calls_buffer_read_byte_16fc7
L_16512:
        call    calls_buffer_read_byte_16fc0
        cmp     ax, 2
L_16518:
        jb      L_1651D
        jmp     NEAR loop_167D2
L_1651D:
        mov     byte ptr [SMF_FORMAT], al
L_16520:
        call    calls_buffer_read_byte_16fc0
        if      FW_VERSION = 172
        cmp     ax, 41h
        else
        cmp     ax, 40h
        endif
        jb      L_1652B
        if      FW_VERSION = 172
        mov     ax, 41h
        else
        mov     ax, 40h
        endif
L_1652B:
        mov     byte ptr [SMF_NTRKS], al
L_1652E:
        call    calls_buffer_read_byte_16fc0
        test    ah, 80h
        je      br_16539
        mov     ax, 60h
br_16539:
        mov     word ptr [SMF_DIVISION], ax
        mov     di, P_7DD8
        sub     cl, cl
loop_16541:
        call    calls_buffer_read_byte_16fc7
        cmp     bx, 4d54h
        je      L_1654D
        jmp     NEAR loop_167D2
L_1654D:
        cmp     ax, 726bh
L_16550:
        je      br_16555
        jmp     NEAR loop_167D2
br_16555:
        call    calls_buffer_read_byte_16fc7
        mov     byte ptr [di+4], 0
        mov     byte ptr [di+5], 0
        mov     byte ptr [di+0bh], 0ffh
        mov     byte ptr [di+0ch], 0
        mov     word ptr [di+6], si
        mov     word ptr [di+8], bp
        mov     ch, cl
        sub     ch, 1
        jae     br_1657B
        mov     ch, byte ptr [SMF_NTRKS]
        dec     ch
br_1657B:
        mov     byte ptr [di+0ah], ch
        add     di, 0dh
        push    cx
        sub     dx, dx
        mov     cx, 4
L_16587:
        shl     bp, 1
        rcl     dx, 1
        loop    L_16587
        add     bp, si
        adc     dx, 0
        add     ax, bp
        adc     bx, dx
        mov     si, ax
        and     si, 0fh
        shr     ax, 4
        shl     bl, 4
        or      ah, bl
        mov     bp, ax
        pop     cx
        inc     cl
        cmp     cl, byte ptr [SMF_NTRKS]
        jne     loop_16541
        mov     dx, word ptr [W_1C8E]
        sub     di, di
L_165B4:
        call    midi_import_bar_marker_write
        mov     cl, byte ptr [SMF_NTRKS]
        mov     bx, P_7DD8
L_165BE:
        mov     si, word ptr [bx+6]
        mov     bp, word ptr [bx+8]
        push    cx
        push    bx
L_165C6:
        call    midi_file_read_varlen
        pop     bx
        mov     word ptr [bx], ax
        mov     word ptr [bx+2], cx
        mov     word ptr [bx+6], si
        mov     word ptr [bx+8], bp
        add     bx, 0dh
        pop     cx
        dec     cl
        jne     L_165BE
        mov     word ptr [SMF_MIN_DELTA_LO], 0
        mov     word ptr [SMF_MIN_DELTA_HI], 0
L_165E9:
        mov     byte ptr [SMF_TRKS_ENDED], 0
        push    dx
        mov     ax, word ptr [SMF_MIN_DELTA_LO]
        mov     dx, word ptr [SMF_MIN_DELTA_HI]
        mov     word ptr [SMF_STEP_DELTA_LO], ax
        mov     word ptr [SMF_STEP_DELTA_HI], dx
        mov     word ptr [SMF_MIN_DELTA_LO], 0ffffh
        mov     word ptr [SMF_MIN_DELTA_HI], 0ffffh
L_16609:
        call    midi_import_ticks_rescale
        add     word ptr [W_1C9E], ax
        add     ax, word ptr [MIDIIMP_BAR_POS]
        adc     dx, 0
        mov     cx, word ptr [MIDIIMP_BAR_TICKS]
        div     cx
        mov     word ptr [MIDIIMP_BAR_POS], dx
        or      ax, ax
        pop     dx
        je      br_1662E
L_16626:
        push    ax
L_16627:
        call    midi_import_bar_marker_write
        pop     ax
        dec     ax
        jne     L_16626
br_1662E:
        mov     byte ptr [SMF_TRK_IDX], 0
        mov     bx, P_7DD8
L_16636:
        mov     word ptr [PTR_SMF_CUR_TRK], bx
        cmp     byte ptr [bx+5], 0
L_1663E:
        je      br_1664F
        inc     byte ptr [SMF_TRKS_ENDED]
        mov     al, byte ptr [SMF_TRKS_ENDED]
        cmp     al, byte ptr [SMF_NTRKS]
        jne     L_166AD
        jmp     SHORT L_166C7
br_1664F:
        mov     ax, word ptr [bx]
        mov     cx, word ptr [bx+2]
        sub     ax, word ptr [SMF_STEP_DELTA_LO]
        sbb     cx, word ptr [SMF_STEP_DELTA_HI]
        mov     word ptr [bx], ax
        mov     word ptr [bx+2], cx
        mov     si, ax
        or      si, cx
        jne     br_16696
        mov     si, word ptr [bx+6]
        mov     bp, word ptr [bx+8]
L_1666D:
        call    calls_buffer_read_byte_16858
        sub     ax, ax
        sub     cx, cx
        mov     bx, word ptr [PTR_SMF_CUR_TRK]
        cmp     byte ptr [bx+5], 0
        jne     br_1668B
L_1667E:
        call    midi_file_read_varlen
        mov     bx, ax
        or      bx, cx
        je      L_1666D
        mov     bx, word ptr [PTR_SMF_CUR_TRK]
br_1668B:
        mov     word ptr [bx], ax
        mov     word ptr [bx+2], cx
        mov     word ptr [bx+6], si
        mov     word ptr [bx+8], bp
br_16696:
        push    dx
        mov     bx, ax
        mov     dx, cx
        sub     bx, word ptr [SMF_MIN_DELTA_LO]
        sbb     dx, word ptr [SMF_MIN_DELTA_HI]
        jae     L_166AC
        mov     word ptr [SMF_MIN_DELTA_LO], ax
        mov     word ptr [SMF_MIN_DELTA_HI], cx
L_166AC:
        pop     dx
L_166AD:
        mov     bx, word ptr [PTR_SMF_CUR_TRK]
        add     bx, 0dh
        inc     byte ptr [SMF_TRK_IDX]
        mov     al, byte ptr [SMF_TRK_IDX]
        cmp     al, byte ptr [SMF_NTRKS]
L_166BF:
        je      L_166C4
        jmp     NEAR L_16636
L_166C4:
        jmp     NEAR L_165E9
L_166C7:
        mov     sp, word ptr [MIDIIMP_SAVED_SP]
        push    dx
        push    di
        mov     di, word ptr [MIDIIMP_LAST_BAR_OFS]
        mov     dx, word ptr [MIDIIMP_LAST_BAR_SEG]
L_166D5:
        call    L_16FF4
        mov     ax, di
        mov     bx, dx
        pop     di
        pop     dx
        cmp     di, ax
        jne     br_166E6
        cmp     dx, bx
        je      br_166EB
br_166E6:
        mov     al, 0c0h
        call    midi_import_bar_event_write
br_166EB:
        mov     es, word ptr [MIDIIMP_SEQ_SEG]
        mov     ax, word ptr [MIDIIMP_BAR_COUNT]
        dec     ax
        mov     word ptr es:[18h], ax
        mov     es, dx
        mov     al, 0ffh
        stosb
        sub     ax, ax
loop_166FE:
        stosb
        test    di, 0fh
        jne     loop_166FE
        shr     di, 4
        mov     ax, es
        add     di, ax
        mov     dx, di
        mov     es, word ptr [MIDIIMP_SEQ_SEG]
        mov     di, 4f0h
        mov     bx, P_1CB9
        mov     cx, 40h
tgt_1671B:
        cmp     byte ptr [bx], 0
        je      L_16724
        or      byte ptr es:[di], 1
L_16724:
        inc     di
        inc     bx
        loop    tgt_1671B
        cmp     byte ptr [SMF_FORMAT], 0
L_1672D:
        jne     L_1675E
        mov     es, word ptr [MIDIIMP_SEQ_SEG]
        mov     ax, 0ffffh
        mov     word ptr es:[1eh], ax
        sub     ax, ax
        mov     word ptr es:[1ch], ax
        mov     byte ptr es:[20h], al
        mov     di, 430h
        mov     cl, 0
loop_16749:
        mov     al, 0a0h
        cmp     cl, 9
        jne     br_16752
        or      al, 40h
br_16752:
        or      al, cl
        stosb
        inc     cl
        cmp     cl, 10h
        jne     loop_16749
        clc
        ret





L_1675E:
        cmp     byte ptr [SMF_FROM_MPC2000], 0
L_16763:
        jne     br_167A1
        mov     si, P_7DD8
        sub     bx, bx
        sub     cx, cx
        mov     cl, byte ptr [SMF_NTRKS]
tgt_16770:
        mov     al, byte ptr [si+4]
        and     al, 0fh
        cmp     al, 9
        jne     br_1677B
        or      al, 40h

br_1677B:
        or      al, 0a0h
        mov     bl, byte ptr [si+0ah]
        mov     es, word ptr [MIDIIMP_SEQ_SEG]
        mov     byte ptr es:[bx+TRK_CHANNEL], al
        add     si, 0dh
        loop    tgt_16770
        mov     ax, 0ffffh
        mov     word ptr es:[1eh], ax
        sub     ax, ax
        mov     word ptr es:[1ch], ax
        mov     byte ptr es:[20h], al
        clc
        ret
br_167A1:
        mov     ax, word ptr es:[18h]
        dec     ax
        cmp     ax, word ptr es:[1ch]
        jae     br_167B1
        mov     word ptr es:[1ch], ax
br_167B1:
        mov     bx, 0ffffh
        cmp     bx, word ptr es:[1eh]
        je      br_167C7
        cmp     ax, word ptr es:[1eh]
        jae     br_167C7
        mov     word ptr es:[1eh], bx
br_167C7:
        clc
        ret
loop_167C9:
        mov     sp, word ptr [MIDIIMP_SAVED_SP]
        mov     ax, 1
        stc
        ret
loop_167D2:
        mov     sp, word ptr [MIDIIMP_SAVED_SP]
        mov     ax, 2
        stc
        ret
loop_167DB:
        mov     sp, word ptr [MIDIIMP_SAVED_SP]
        mov     ax, 3
        stc
        ret
midi_file_read_varlen:
        sub     bx, bx
        sub     cx, cx
calls_buffer_read_byte_167e8:
        mov     cl, bh
        shr     cl, 1
        shl     bx, 7
        call    buffer_read_byte
        mov     ah, al
        and     al, 7fh
        or      bl, al
        test    ah, 80h
        jne     calls_buffer_read_byte_167e8
        mov     ax, bx
L_167FF:
        ret
midi_import_ticks_rescale:
        cmp     word ptr [SMF_DIVISION], 60h
        je      L_16827
        or      dx, dx
L_16809:
        jne     br_16838
        mov     dx, 60h
        mul     dx
        add     ax, word ptr [SMF_TICK_REM]
        adc     dx, 0
        mov     bx, word ptr [SMF_DIVISION]
        cmp     dx, bx
L_1681D:
        jae     L_16828
        div     bx
        mov     word ptr [SMF_TICK_REM], dx
        sub     dx, dx
L_16827:
        ret
L_16828:
        push    di
        mov     di, bx
        sub     si, si
        nop
        push    cs
calls_state_check_104_1682f:
        call    state_check_104FB
        mov     word ptr [SMF_TICK_REM], di
        pop     di
        ret
br_16838:
        push    di
        sub     di, di
        sub     si, si
        mov     cx, 60h
L_16840:
        add     di, ax
        adc     si, dx
        loop    L_16840
        mov     ax, di
        mov     dx, si
        add     ax, word ptr [SMF_TICK_REM]
L_1705C:

        adc     dx, 0
        mov     bx, word ptr [SMF_DIVISION]
        pop     di
        jmp     SHORT L_16828
calls_buffer_read_byte_16858:
        call    buffer_read_byte
        cmp     al, 0ffh
        jne     br_16862
        jmp     L_16BD1
br_16862:
        cmp     al, 0f0h
        jne     L_16869
        jmp     L_16A60
L_16869:
        cmp     al, 0f7h
        jne     calls_buffer_read_byte_16870
        jmp     calls_buffer_read_byte_16b34
calls_buffer_read_byte_16870:
        cmp     al, 80h
        if      FW_VERSION = 172
        jb      br_1687E
        else
        jae     L_17084
        jmp     br_1687E
L_17084:
        endif
        mov     bx, word ptr [PTR_SMF_CUR_TRK]
        mov     byte ptr [bx+4], al
        call    buffer_read_byte
        if      FW_VERSION = 150
        jmp     br_1687E
        endif
br_1687E:
        mov     bx, word ptr [PTR_SMF_CUR_TRK]
        mov     cl, byte ptr [bx+0ah]
        mov     ah, byte ptr [bx+4]
        cmp     byte ptr [SMF_FORMAT], 1
        je      L_16894
        mov     cl, ah
        and     cl, 0fh
L_16894:
        mov     byte ptr [SMF_EVT_TRACK], cl
        sub     bh, bh
        mov     bl, cl
        mov     byte ptr [bx+TBL_SMF_TRK_USED], 1
        mov     bl, ah
        shr     bl, 3
jmp_word_168a6:
        and     bl, 0eh
        jmp     word ptr cs:[bx+smf_evt_status_table]
smf_evt_status_table:
        dw      smf_evt_note_off, smf_evt_note_on, smf_evt_2data, smf_evt_2data
        dw      smf_evt_1data, smf_evt_1data, smf_evt_2data, smf_evt_system
smf_evt_note_off:
        if      FW_VERSION = 172
        db      8ah, 0d8h, 8ah, 0c8h, 0e8h, 0e1h, 06h, 8ah, 3eh, 0b8h, 1ch, 0d0h, 0e3h, 0d1h, 0e3h, 8eh
        db      06h, 92h, 1ch, 56h, 8bh, 0f3h, 8ah, 0f9h, 8ah, 0d8h, 26h, 8bh, 04h, 26h, 8bh, 4ch
        db      02h, 26h, 0c7h, 04h, 00h, 00h, 26h, 0c7h, 44h, 02h, 00h, 00h, 5eh, 83h, 0f9h, 00h
        else
        mov     cx, ax
        call    buffer_read_byte
        mov     bx, cx
        and     bh, 0fh
        shl     bl, 1
        shl     bx, 1
        add     bx, P_9DD8
        push    si
        mov     si, bx
        mov     bh, cl
        mov     bl, al
        mov     ax, word ptr [si]
        mov     cx, word ptr [si+2]
        mov     word ptr [si], 0
        mov     word ptr [si+2], 0
        pop     si
        cmp     cx, 0
        endif
L_168EE:
        je      L_16932
fn_168F0:
        mov     es, cx
        mov     bx, ax
        push    dx
        mov     ch, byte ptr es:[bx+2]
        mov     cl, byte ptr es:[bx+3]
        mov     dl, byte ptr es:[bx+4]
        mov     dh, ch
        shl     dl, 1
        rcr     ch, 1
        shr     ch, 2
        mov     ax, word ptr [W_1C9E]
        sub     ax, cx
        and     ah, 3fh
        cmp     ax, 2710h
        jb      br_1691A
        mov     ax, 270fh
br_1691A:
        shl     ah, 3
        rcr     dl, 1
        and     dh, 7
        or      ah, dh
        mov     byte ptr es:[bx+2], ah
        mov     byte ptr es:[bx+3], al
        mov     byte ptr es:[bx+4], dl
        pop     dx
        ret
L_16932:
        cmp     byte ptr [SMF_FROM_MPC2000], 0
L_16937:
        jne     L_1693A
        ret
L_1693A:
        mov     ax, bx
L_1693C:
        and     ah, 3
        mov     bx, word ptr [PTR_SMF_CUR_TRK]
        mov     byte ptr [bx+0bh], ah
        mov     byte ptr [bx+0ch], al
        ret
smf_evt_note_on:
        mov     cx, ax
        if      FW_VERSION = 172
        mov     ch, byte ptr [SMF_EVT_TRACK]
        endif
        call    buffer_read_byte
        or      al, al
L_16955:
        jne     L_1695A
        jmp     L_169E8
L_1695A:
        mov     bx, word ptr [PTR_SMF_CUR_TRK]
        cmp     byte ptr [bx+0bh], 0ffh
        je      br_16994
        push    ax
        push    cx
        mov     es, dx
        mov     al, byte ptr [SMF_EVT_TRACK]
        or      al, 40h
        mov     byte ptr es:[di], al
        mov     ax, word ptr [MIDIIMP_BAR_POS]
        mov     word ptr es:[di+1], ax
        mov     al, byte ptr [bx+0bh]
        or      al, 80h
        mov     byte ptr es:[di+3], al
        mov     byte ptr es:[di+4], cl
        mov     al, byte ptr [bx+0ch]
        mov     byte ptr es:[di+5], al
        mov     byte ptr [bx+0bh], 0ffh
L_1698F:
        call    L_16FF4
        pop     cx
        pop     ax
br_16994:
        push    cx
        if      FW_VERSION = 150
        mov     ch, byte ptr [SMF_EVT_TRACK]
        endif
        mov     es, dx
        mov     byte ptr es:[di+5], al
        or      ch, 0
        mov     byte ptr es:[di], ch
        mov     ax, word ptr [MIDIIMP_BAR_POS]
        mov     bx, word ptr [W_1C9E]
        shl     cl, 1
        shl     bh, 3
        rcr     cl, 1
        or      ah, bh
        mov     byte ptr es:[di+1], al
        mov     byte ptr es:[di+2], ah
        mov     byte ptr es:[di+3], bl
        mov     byte ptr es:[di+4], cl
        pop     bx
        if      FW_VERSION = 150
        and     bh, 0fh
        endif
        shl     bl, 1
        shl     bx, 1
        if      FW_VERSION = 150
        add     bx, P_9DD8
        endif
        pusha
        if      FW_VERSION = 172
        mov     es, word ptr [D_1C92]
        mov     ax, word ptr es:[bx]
        mov     cx, word ptr es:[bx+2]
        else
        mov     ax, word ptr [bx]
        mov     cx, word ptr [bx+2]
        endif
        or      cx, cx
        je      br_169D9
        call    fn_168F0
br_169D9:
        popa
        if      FW_VERSION = 172
        mov     es, word ptr [D_1C92]
        mov     word ptr es:[bx], di
        mov     word ptr es:[bx+2], dx
        else
        mov     word ptr [bx], di
        mov     word ptr [bx+2], dx
        endif
        jmp     L_16FF4
L_169E8:
        mov     bx, cx
        if      FW_VERSION = 150
        and     bh, 0fh
        endif
        shl     bl, 1
        shl     bx, 1
        if      FW_VERSION = 172
        mov     es, word ptr [D_1C92]
        mov     ax, word ptr es:[bx]
        mov     cx, word ptr es:[bx+2]
        mov.l   word ptr es:[bx], 0
        mov.l   word ptr es:[bx+2], 0
        else
        add     bx, P_9DD8
        mov     ax, word ptr [bx]
        mov     cx, word ptr [bx+2]
        mov     word ptr [bx], 0
        mov     word ptr [bx+2], 0
        endif
        or      cx, cx
L_16A06:
        je      L_16A0B
        jmp     fn_168F0
L_16A0B:
        ret
smf_evt_2data:
        mov     es, dx
        mov     cl, ah
L_16A10:
        mov     ah, byte ptr [SMF_EVT_TRACK]
        or      ah, 40h
        mov     byte ptr es:[di], ah
        mov     byte ptr es:[di+4], al
        and     cl, 0f0h
        mov     byte ptr es:[di+3], cl
        mov     ax, word ptr [MIDIIMP_BAR_POS]
        mov     word ptr es:[di+1], ax
        call    buffer_read_byte
        mov     es, dx
        mov     byte ptr es:[di+5], al
        jmp     L_16FF4
smf_evt_1data:
        mov     es, dx
        mov     cl, ah
L_16A3C:
        mov     ah, byte ptr [SMF_EVT_TRACK]
        or      ah, 40h
        mov     byte ptr es:[di], ah
        mov     byte ptr es:[di+4], al
        and     cl, 0f0h
        mov     byte ptr es:[di+3], cl
        mov     ax, word ptr [MIDIIMP_BAR_POS]
        mov     word ptr es:[di+1], ax
        mov     byte ptr es:[di+5], 0
        jmp     L_16FF4
L_16A60:
        call    midi_file_read_varlen
        mov     es, dx
        mov     word ptr [SMF_SYSEX_LEFT_LO], ax
        mov     byte ptr [SMF_SYSEX_LEFT_HI], cl
        add     ax, 1
        adc     cl, 0
        mov     word ptr es:[di+3], ax
        mov     byte ptr es:[di+5], cl
L_16A7A:
        call    L_16B14
        or      al, 80h
        mov     byte ptr es:[di], al
        mov     ax, word ptr [MIDIIMP_BAR_POS]
        mov     word ptr es:[di+1], ax
calls_buffer_decrement_16a89:
        call    L_16FF4
        mov     es, dx
        mov     byte ptr es:[di], 0f0h
        inc     di
        call    buffer_decrement
        call    buffer_decrement
        call    buffer_decrement
        call    buffer_decrement
        call    buffer_decrement
        mov     cx, word ptr [SMF_SYSEX_LEFT_LO]
        or      cl, byte ptr [SMF_SYSEX_LEFT_HI]
        or      cx, cx
        je      br_16ACC
calls_buffer_decrement_16aae:
        call    buffer_decrement
        call    buffer_decrement
        call    buffer_decrement
        call    buffer_decrement
        call    buffer_decrement
        call    buffer_decrement
        mov     cx, word ptr [SMF_SYSEX_LEFT_LO]
        or      cl, byte ptr [SMF_SYSEX_LEFT_HI]
        or      cx, cx
        jne     calls_buffer_decrement_16aae
br_16ACC:
        mov     es, dx
        mov     byte ptr es:[di], 0c2h
        mov     ax, word ptr [MIDIIMP_BAR_POS]
        mov     word ptr es:[di+1], ax
        sub     ax, ax
        mov     word ptr es:[di+3], ax
        mov     byte ptr es:[di+5], al
        jmp     L_16FF4
buffer_decrement:
        sub     al, al
        mov     cx, word ptr [SMF_SYSEX_LEFT_LO]
        or      cl, byte ptr [SMF_SYSEX_LEFT_HI]
        or      cx, cx
        je      L_16B03
        push    es
        call    buffer_read_byte
        pop     es
        sub     word ptr [SMF_SYSEX_LEFT_LO], 1
        sbb     byte ptr [SMF_SYSEX_LEFT_HI], 0
L_16B03:
        mov     es, dx
        mov     byte ptr es:[di], al
        inc     di
        cmp     di, 10h
L_16B0C:
        jae     br_16B0F
        ret
br_16B0F:
        sub     di, 10h
        inc     dx
        ret
L_16B14:
        cmp     byte ptr [SMF_FORMAT], 0
L_16B19:
        jne     br_16B23
        mov     al, 10h
        mov     byte ptr [B_1CC9], 1
        ret
br_16B23:
        mov     bx, word ptr [PTR_SMF_CUR_TRK]
        mov     al, byte ptr [bx+0ah]
        mov     bl, al
        sub     bh, bh
        mov     byte ptr [bx+TBL_SMF_TRK_USED], 1
        ret
calls_buffer_read_byte_16b34:
        call    buffer_read_byte
        mov     cl, al
        mov     es, dx
L_16B3B:
        call    L_16B14
        or      al, 80h
        mov     byte ptr es:[di], al
        mov     ax, word ptr [MIDIIMP_BAR_POS]
        mov     word ptr es:[di+1], ax
        sub     ax, ax
        mov     word ptr es:[di+3], ax
        mov     byte ptr es:[di+5], al
calls_buffer_decrement_16b54:
        call    L_16FF4
calls_buffer_decrement_16b57:
        mov     es, dx
        call    buffer_decrement
        call    buffer_decrement
        call    buffer_decrement
        call    buffer_decrement
        call    buffer_decrement
        call    buffer_decrement
L_16B6B:
        call    L_16FF4
        cmp     cl, 0
        jne     calls_buffer_decrement_16b57
        mov     es, dx
        mov     byte ptr es:[di], 0c2h
        mov     ax, word ptr [MIDIIMP_BAR_POS]
        mov     word ptr es:[di+1], ax
        sub     ax, ax
        mov     word ptr es:[di+3], ax
        mov     byte ptr es:[di+5], al
        jmp     L_16FF4
midi_import_bar_marker_write:
        mov     al, 0c0h
midi_import_bar_event_write:
        mov     es, dx
        mov     byte ptr es:[di], al
        mov     cx, word ptr [MIDIIMP_BAR_COUNT]
        mov     word ptr es:[di+1], cx
        mov     bl, byte ptr [MIDIIMP_TSIG_NUM]
        mov     byte ptr es:[di+3], bl
        mov     bh, byte ptr [MIDIIMP_TSIG_DEN]
        mov     byte ptr es:[di+4], bh
        mov     byte ptr es:[di+5], 0
        cmp     word ptr [MIDIIMP_BAR_COUNT], 3e8h
        jne     br_16BBA
        ret
br_16BBA:
        inc     word ptr [MIDIIMP_BAR_COUNT]
        mov     word ptr [MIDIIMP_LAST_BAR_OFS], di
        mov     word ptr [MIDIIMP_LAST_BAR_SEG], dx
        mov     word ptr [FP_SMF_BAR_EVT], di
        mov     word ptr [SMF_BAR_EVT_SEG], dx
        jmp     L_16FF4
L_16BD1:
        call    calls_buffer_read_byte_16fce
        cmp     ah, 51h
L_16BD7:
        jne     L_16BDB
        jmp     SHORT calls_buffer_read_byte_16c16
L_16BDB:
        cmp     ah, 58h
L_16BDE:
        jne     L_16BE3
        jmp     NEAR calls_buffer_read_byte_16c8c
L_16BE3:
        pusha
L_16BE4:
        call    L_16BF5
        popa
        add     si, cx
        mov     cx, si
        shr     cx, 4
        add     bp, cx
        and     si, 0fh
        ret
L_16BF5:
        cmp     ah, 1
L_16BF8:
        jne     L_16BFD
        jmp     L_16E28
L_16BFD:
        cmp     ah, 3
L_16C00:
        jne     L_16C05
        jmp     NEAR L_16D6C
L_16C05:
        cmp     ah, 2fh
L_16C08:
        jne     L_16C0D
        jmp     smf_evt_system
L_16C0D:
        cmp     ah, 54h
L_16C10:
        jne     calls_buffer_read_byte_16c15
        jmp     br_16F4D
calls_buffer_read_byte_16c15:
        ret
calls_buffer_read_byte_16c16:
        call    buffer_read_byte
        sub     ah, ah
        mov     bx, ax
L_16C1D:
        call    calls_buffer_read_byte_16fc0
        push    dx
        push    si
        push    di
        push    bp
        push    cx
        mov     si, bx
        mov     di, ax
        mov     dx, 23c3h
        mov     ax, 4600h
        nop
        push    cs
calls_state_check_104_16c31:
        call    state_check_104FB
        pop     cx
        pop     bp
        pop     di
        pop     si
        pop     dx
        cmp     ax, 12ch
        jae     br_16C41
        mov     ax, 12ch
br_16C41:
        cmp     ax, 0bb8h
        jb      L_16C49
        mov     ax, 0bb8h
L_16C49:
        cmp     byte ptr [SMF_TEMPO_SEEN], 0
L_16C4E:
        jne     br_16C5E
        mov     byte ptr [SMF_TEMPO_SEEN], 1
        mov     es, word ptr [MIDIIMP_SEQ_SEG]
        mov     word ptr es:[TBL_0014], ax
        ret
br_16C5E:
        push    dx
        push    cx
        mov     bx, 3e8h
        mul     bx
        mov     es, word ptr [MIDIIMP_SEQ_SEG]
        mov     bx, word ptr es:[TBL_0014]
        div     bx
        pop     cx
        pop     dx
        mov     es, dx
        mov     byte ptr es:[di], 0c1h
        mov     cx, word ptr [MIDIIMP_BAR_POS]
        mov     word ptr es:[di+1], cx
        mov     word ptr es:[di+3], ax
        mov     byte ptr es:[di+5], 0
        jmp     L_16FF4
calls_buffer_read_byte_16c8c:
        call    buffer_read_byte
        cmp     al, 20h
        jb      br_16C95
        mov     al, 20h
br_16C95:
        cmp     al, 0
        jne     calls_buffer_read_byte_16c9b
        mov     al, 1
calls_buffer_read_byte_16c9b:
        mov     byte ptr [MIDIIMP_TSIG_NUM], al
        mov     bh, al
        call    buffer_read_byte
        mov     ah, 4
        cmp     al, 2
        je      br_16CBD
        mov     ah, 8
        cmp     al, 3
        je      br_16CBD
        mov     ah, 10h
        cmp     al, 4
        je      br_16CBD
        mov     ah, 20h
        cmp     al, 5
        je      br_16CBD
        mov     ah, 4
br_16CBD:
        mov     byte ptr [MIDIIMP_TSIG_DEN], ah
        cmp     byte ptr [SMF_TSIG_SEEN], 0
        jne     L_16CE1
        push    es
        push    ax
        mov     es, word ptr [MIDIIMP_SEQ_SEG]
        mov     byte ptr es:[1bh], ah
        mov     al, byte ptr [MIDIIMP_TSIG_NUM]
        mov     byte ptr es:[1ah], al
        mov     byte ptr [SMF_TSIG_SEEN], 1
        pop     ax
        pop     es
L_16CE1:
        mov     bl, ah
        mov     ax, 180h
        div     bl
        mul     bh
        mov     word ptr [MIDIIMP_BAR_TICKS], ax
        call    buffer_read_byte
        call    buffer_read_byte
        sub     ax, ax
        xchg    word ptr [MIDIIMP_BAR_POS], ax
        or      ax, ax
L_16CFB:
        jne     br_16D15
        push    es
        push    si
        mov     es, word ptr [MIDIIMP_LAST_BAR_SEG]
        mov     si, word ptr [MIDIIMP_LAST_BAR_OFS]
        mov     al, byte ptr [MIDIIMP_TSIG_NUM]
        mov     ah, byte ptr [MIDIIMP_TSIG_DEN]
        mov     word ptr es:[si+3], ax
        pop     si
        pop     es
        ret
br_16D15:
        push    es
        push    si
        mov     cx, ax
        mov     bl, 60h
        mov     bh, 4
        div     bl
        cmp     ah, 0
        je      L_16D5A
        mov     bl, 30h
        mov     bh, 8
        mov     ax, cx
        div     bl
        cmp     ah, 0
        je      L_16D5A
        mov     bl, 18h
        mov     bh, 10h
        mov     ax, cx
        div     bl
        cmp     ah, 0
        je      L_16D5A
        mov     bl, 0ch
        mov     bh, 20h
        mov     ax, cx
        div     bl
        cmp     ah, 0
        je      L_16D5A
        mov     bl, 6
        mov     bh, 40h
        mov     ax, cx
        div     bl
        cmp     ah, 0
        je      L_16D5A
        inc     al
L_16D5A:
        les     si, [FP_SMF_BAR_EVT]
        mov     byte ptr es:[si+3], al
        mov     byte ptr es:[si+4], bh
L_16D66:
        call    midi_import_bar_marker_write
        pop     si
        pop     es
        ret
L_16D6C:
        cmp     byte ptr [SMF_FORMAT], 1
L_16D71:
        je      L_16D74
        ret
L_16D74:
        cmp     byte ptr [SMF_TRK_IDX], 0
L_16D79:

        je      calls_string_compare_cs_16dcf
        cmp     cx, 10h
        jb      L_16D83
        mov     cx, 10h
        if      FW_VERSION = 150
br_16D9F:
        endif
L_16D83:
        mov     bx, word ptr [PTR_SMF_CUR_TRK]
        if      FW_VERSION = 172
        cmp     byte ptr [SMF_FROM_MPC2000], 0
        je      br_16D9F
        push    es
        pusha
        add     si, 1fh
L_16D93:
        call    parse_hex_byte
        mov     bx, word ptr [PTR_SMF_CUR_TRK]
        mov     byte ptr [bx+0ah], al
        popa
        pop     es
br_16D9F:
        endif
        mov     al, byte ptr [bx+0ah]
        mov     es, word ptr [MIDIIMP_SEQ_SEG]
        mov     ah, 10h
        mul     ah
        add     ax, 30h
        mov     di, ax
        push    cx
        push    di
        mov     al, 20h
        mov     cx, 10h
        rep stosb
        pop     di
        pop     cx
        push    ds
        mov     ds, bp
tgt_16DBD:
        lodsb
        cmp     al, 20h
        jae     br_16DC4
        mov     al, 2ah
br_16DC4:
        cmp     al, 7ah
        jbe     br_16DCA
        mov     al, 2ah
br_16DCA:
        stosb
        loop    tgt_16DBD
        pop     ds
        ret
calls_string_compare_cs_16dcf:
        push    cx
calls_string_compare_cs_16dd0:
        call    string_compare_cs
        db      "MPC2000", 0
        pop     cx
        jb      L_16E27
        mov     byte ptr [SMF_FROM_MPC2000], 1
        cmp     cx, 20h
        jb      L_16E27
        add     si, 10h
        push    es
        push    ds
        mov     ax, es
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     di, 2
        mov     ds, ax
        mov     cx, 10h
tgt_16DFB:
        lodsb
        cmp     al, 61h
        jb      br_16E06
        cmp     al, 7ah
        ja      br_16E06
        sub     al, 20h
br_16E06:
        cmp     al, byte ptr es:[di]
        jne     br_16E25
        inc     di
        loop    tgt_16DFB
        mov     cx, 10h
        sub     di, cx
        sub     si, cx
tgt_16E15:
        lodsb
        cmp     al, 20h
        jae     br_16E1C
        mov     al, 20h
br_16E1C:
        cmp     al, 7ah
        jbe     br_16E22
        mov     al, 20h
br_16E22:
        stosb
        loop    tgt_16E15
br_16E25:
        pop     ds
        pop     es
L_16E27:
        ret
L_16E28:
        cmp     byte ptr [SMF_FROM_MPC2000], 0
calls_string_compare_cs_16e2d:
        jne     calls_string_compare_cs_16e30
        ret
calls_string_compare_cs_16e30:
        call    string_compare_cs
        db      "LOOP=", 0
        jae     L_16E93
calls_string_compare_cs_16e3b:
        call    string_compare_cs
        db      "TRACK DATA:", 0
L_16E4A:
        jae     L_16E4D
        ret
L_16E4D:
        add     si, 0bh
        mov     bx, word ptr [PTR_SMF_CUR_TRK]
L_16E54:
        call    parse_hex_byte
        mov     byte ptr [bx+0ah], al
        mov     bl, al
        sub     bh, bh
        push    bx
L_16E5F:
        call    parse_hex_byte
        push    ax
L_16E63:
        call    parse_hex_byte
        push    ax
L_16E67:
        call    parse_hex_byte
        push    ax
L_16E6B:
        call    parse_hex_byte
        mov     cl, al
        pop     ax
        mov     ch, al
        pop     ax
        mov     dl, al
        pop     ax
        mov     dh, al
        pop     bx
        mov     es, word ptr [MIDIIMP_SEQ_SEG]
        mov     byte ptr es:[bx+TRK_CHANNEL], dh
        mov     byte ptr es:[bx+470h], dl
        mov     byte ptr es:[bx+TRK_VELOCITY], ch
        mov     byte ptr es:[bx+TRK_STATUS], cl
        ret
L_16E93:
        push    es
        push    si
        mov     al, 0
        cmp     word ptr es:[si+6], 204eh
        jne     L_16EA1
        mov     al, 1
L_16EA1:
        push    ax
        add     si, 0fh
calls_string_compare_cs_16ea5:
        call    parse_decimal3
        push    ax
        add     si, 8
calls_string_compare_cs_16eac:
        call    string_compare_cs
        db      "END", 0
        jb      L_16EBA
        mov     ax, 0ffffh
        jmp     br_16EBD
L_16EBA:

        call    parse_decimal3

br_16EBD:
        mov     es, word ptr [MIDIIMP_SEQ_SEG]
        mov     word ptr es:[1eh], ax
        pop     ax
        mov     word ptr es:[1ch], ax
        pop     ax
        mov     byte ptr es:[20h], al
        pop     si
        pop     es
        mov     al, 0
        cmp     word ptr es:[si+TBL_0022], 204eh
        jne     br_16EDD
        mov     al, 1
br_16EDD:
        mov     es, word ptr [MIDIIMP_SEQ_SEG]
        mov     byte ptr es:[16h], al
        ret

parse_decimal3:
        mov     al, byte ptr es:[si]
        and     al, 0fh
        mov     ah, 64h
        mul     ah
        mov     bx, ax
        mov     al, byte ptr es:[si+1]
        and     al, 0fh
        mov     ah, 0ah
        mul     ah
        add     bx, ax
        mov     al, byte ptr es:[si+2]
        and     ax, 0fh
        add     ax, bx
L_16F06:
        ret
parse_hex_byte:
        call    parse_hex_digit
        mov     ah, al
L_16F0C:
        call    parse_hex_digit
        shl     ah, 4
        or      al, ah
        ret
parse_hex_digit:
        mov     al, byte ptr es:[si]
        inc     si
        if      FW_VERSION = 172
        jne     L_16F24
        push    ax
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
        pop     ax
        endif
L_16F24:
        sub     al, 30h
L_16F26:
        jb      br_16F37
        cmp     al, 0ah
        jb      L_16F36
        sub     al, 11h
L_16F2E:
        jb      br_16F37
        add     al, 0ah
        cmp     al, 10h
L_16F34:
        jae     br_16F37
L_16F36:
        ret
br_16F37:
        mov     al, 0
        ret
smf_evt_system:
        cmp     byte ptr [SMF_FORMAT], 0
L_16F3F:
        jne     br_16F44
        jmp     L_166C7
br_16F44:
        mov     bx, word ptr [PTR_SMF_CUR_TRK]
        mov     byte ptr [bx+5], 1
        ret
br_16F4D:
        mov     al, byte ptr es:[si]
        mov     ah, byte ptr es:[si+1]
        mov     bl, byte ptr es:[si+2]
        mov     bh, byte ptr es:[si+3]
        mov     cl, byte ptr es:[si+4]
        push    es
        mov     es, word ptr [MIDIIMP_SEQ_SEG]
        mov     byte ptr es:[21h], al
        mov     byte ptr es:[TBL_0022], ah
        mov     byte ptr es:[23h], bl
        mov     byte ptr es:[24h], bh
        mov     byte ptr es:[25h], cl
        pop     es
        ret
string_compare_cs:
        pop     bp
        mov     dx, si
loop_16F82:
        mov     al, byte ptr cs:[bp]
        inc     bp
        or      al, al
        je      jmp_bp_16fa1
        mov     ah, byte ptr es:[si]
        inc     si
        cmp     ah, al
        je      loop_16F82
loop_16F93:
        mov     al, byte ptr cs:[bp]
        inc     bp
        or      al, al
        jne     loop_16F93
        mov     si, dx
        stc
        jmp     bp
jmp_bp_16fa1:
        mov     si, dx
        clc
        jmp     bp
buffer_read_byte:
        mov     es, bp
        mov     al, byte ptr es:[si]
        inc     si
        cmp     si, 10h
L_16FAF:
        jne     calls_buffer_read_byte_16fbf
        inc     bp
        sub     si, si
        mov     es, bp
        cmp     bp, word ptr [MIDIIMP_SRC_END_SEG]
L_16FBA:
        jne     calls_buffer_read_byte_16fbf
        jmp     loop_167D2



calls_buffer_read_byte_16fbf:
        ret
calls_buffer_read_byte_16fc0:
        call    buffer_read_byte
        mov     ah, al
        jmp     SHORT buffer_read_byte
calls_buffer_read_byte_16fc7:
        call    calls_buffer_read_byte_16fc0
        mov     bx, ax
        jmp     SHORT calls_buffer_read_byte_16fc0

calls_buffer_read_byte_16fce:
        call    buffer_read_byte
        mov     bh, al
        mov     ah, 0
        call    buffer_read_byte
        cmp     al, 80h
        jb      br_16FEF
        mov     ah, al
        and     ah, 7fh
        call    buffer_read_byte
        cmp     al, 80h
        jb      br_16FEB
        jmp     loop_167DB
br_16FEB:
        shl     al, 1
        shr     ax, 1
br_16FEF:
        mov     cx, ax
        mov     ah, bh
        ret
L_16FF4:
        add     di, 6
        cmp     di, 10h
L_16FFA:
        jb      bc_int2a_1700b
        sub     di, 10h
        inc     dx
        mov     es, dx
        cmp     dx, word ptr [MIDIIMP_DEST_END_SEG]
L_17006:
        jb      bc_int2a_1700b
        jmp     loop_167C9
bc_int2a_1700b:
        ret
bc_int2a_1700c:
        INT_2A "  Insufficient Memory !!  "
error_insufficient_memory_17029:
        call    seq_tick_state_dispatch
        retf
midi_process_far:
        call    midi_process
        retf
L_17031:
        call    L_18B9C
        retf
seq_position_reset_far:
        call    seq_position_reset
        retf
calls_sequence_data_read_17039:
        call    seq_gap_seek_forward
        retf
sequence_data_read_far:
        call    sequence_data_read
        retf
scsi_status_check_far:
        call    scsi_status_check
        retf
L_17045:
        call    fn_17703
        retf
seq_position_set_far:
        call    seq_position_set
        retf
calls_locate_dialog_18556_1704d:
        call    seq_position_set_bar
        retf
calls_locate_dialog_18556_17051:
        call    locate_dialog_18556
        retf
seq_rewind_to_start_far:
        call    seq_rewind_to_start
        retf
calls_timer_check_17059:
        call    locate_to_end
        retf
calls_timer_check_1705d:
        call    timer_check
        retf
rec_note_is_unset_far:
        call    rec_note_is_unset
        retf
locate_bar_fwd_far:
        call    locate_bar_fwd
        retf
locate_bar_back_far:
        if      FW_VERSION = 172
        db      0e8h, 0bh, 0ch
        else
        call    L_183E5
        endif
        retf
locate_step_fwd_far:
        call    locate_step_fwd
        retf
locate_step_fwd_event_far:
        call    locate_step_fwd_event
        retf
locate_step_back_event_far:
        call    locate_step_back_event
        retf
locate_step_back_far:
        call    locate_step_back
        retf
locate_next_event_far:
        call    locate_next_event
        retf
locate_prev_event_far:
        call    locate_prev_event
        retf
        if      FW_VERSION = 150
L_17869_V150:
        db      0e8h, 02h, 0bh, 0cbh
        endif
locate_bar_fwd_to_end_far:
        if      FW_VERSION = 172
        call    locate_bar_fwd_to_end
        else
        call    locate_to_start
        endif
        retf
        if      FW_VERSION = 172
locate_to_start_far:
        call    locate_to_start
        retf
        endif
metronome_rate_update_far:
        call    metronome_rate_update
        retf
note_value_ticks_get_far:
        call    note_value_ticks_get
        retf
sequencer_stop_far:
        call    sequencer_stop
        retf
sequencer_start_keep_position_far:
        if      FW_VERSION = 172
        call    sequencer_start_keep_position
        else
        call    over_dub_arm_toggle+16
L_17880:
        endif
        retf
sequencer_start_from_top_far:
        call    sequencer_start_from_top
        retf
L_170A1:
        call    sequencer_start_from_top
        retf
transport_far_thunk_table:
        call    rec_arm_toggle
        retf
over_dub_arm_toggle_far:
        call    over_dub_arm_toggle
        retf
timing_swing_offset_calc_far:
        call    timing_swing_offset_calc
        retf
seq_tempo_rate_update_far:
        call    seq_tempo_rate_update
        retf
L_170B5:
        call    rec_disarm_when_stopped
        retf
L_170B9:
        call    seq_gap_move_event_fwd
        retf
L_170BD:
        call    calls_sequence_data_read_19255
        retf
L_170C1:
        call    seq_build_timing_map
        retf
scsi_operation_far:
        call    scsi_operation
        retf
seq_pos_recalc_and_send_spp_far:
        call    seq_pos_recalc_and_send_spp
        retf
L_170CD:
        call    seq_tsig_apply
        retf
L_170D1:
        call    seq_apply_current_bar_tsig
        retf
L_170D5:
        call    note_value_ticks_get
        retf
seq_pos_recalc_bar_beat_far:
        call    seq_pos_recalc_bar_beat
        retf
sequencer_run_by_sync_mode_far:
        call    sequencer_run_by_sync_mode
        retf
sequencer_clear_running_far:
        mov     byte ptr [SEQ_RUNNING], 0
        mov     word ptr [PTR_SEQ_TICK_STATE], P_7342
        retf
L_170ED:
        call    L_19476
        retf
L_170F1:
        call    seq_position_reset
        mov     word ptr [PTR_SEQ_TICK_STATE], P_728F
        retf
seq_tick_state_dispatch:
        call    fn_17217
L_170FE:
        call    fn_17240
L_17101:
        call    fn_17228
calls_word_17104:
        call    fn_17234
calls_word_17107:
        call    L_17294
        call    word ptr [PTR_SEQ_TICK_STATE]
        ret
L_1710F:
        mov     ax, word ptr [SEQ_BAR_TICK]
        and     al, 3
        mov     byte ptr [B_1D81], al
        jne     L_1711C
L_17119:
        call    L_1724C
L_1711C:
        call    rec_punch_window_check
        call    L_171B0
        cmp     byte ptr [G_SYNC_OUT_MODE], 2
        jne     L_1712E
        nop
        push    cs
L_1712B:
        call    sync_out_mtc_restart
L_1712E:
        cmp     byte ptr [G_SYNC_OUT_MODE], 3
        jne     L_17138
L_17135:
        call    fn_17289
L_17138:
        sub     ax, ax
        mov     word ptr [SEQ_USEC_ACCUM], ax
        mov     word ptr [PTR_SEQ_TICK_STATE], P_72C4
        ret
L_17144:
        mov     byte ptr [B_1D84], 1
L_17149:
        call    L_172D2
        cmp     al, 1
L_1714E:
        jne     br_17151
        ret
br_17151:
        jb      seq_timer_ms_tick
        call    seq_timer_ms_tick
seq_timer_ms_tick:
        add     word ptr [SEQ_ELAPSED_MS_LO], 1
        adc     word ptr [SEQ_ELAPSED_MS_HI], 0
        mov     ax, word ptr [SEQ_USEC_ACCUM]
        add     ax, 3e8h
        mov     word ptr [SEQ_USEC_ACCUM], ax
        cmp     ax, word ptr [SEQ_USEC_PER_TICK]
L_1716D:
        jae     br_17170
        ret
br_17170:
        sub     ax, word ptr [SEQ_USEC_PER_TICK]
        mov     word ptr [SEQ_USEC_ACCUM], ax
        mov     bx, ax
        mov     al, byte ptr [B_1D81]
        inc     al
        cmp     al, 60h
        jne     L_1718C
        mov     al, 0
        sub     bx, word ptr [SEQ_USEC_TICK_REM]
        mov     word ptr [SEQ_USEC_ACCUM], bx
L_1718C:
        mov     byte ptr [B_1D81], al
L_1718F:
        call    note_off_queue_tick
seq_tick_process:
        call    rec_midi_in_drain
L_17195:
        call    rec_flush_pending_mixer_events
L_17198:
        call    midi_process
L_1719B:
        call    rec_punch_window_check
        test    word ptr [SEQ_BAR_TICK], 3
        jne     br_171A9
L_171A6:
        call    L_1724C
br_171A9:
        call    rec_calc_quantized_pos
        inc     word ptr [SEQ_NOW_TICK]
L_171B0:
        call    seq_send_start_program_changes
        nop
        push    cs
calls_timer_check_171b5:
        call    far_15E28
calls_timer_check_171b8:
        call    fn_19F0B
calls_timer_check_171bb:
        call    timer_check
L_171BE:
        call    metronome_click_check
        ret
L_171C2:
        mov     byte ptr [B_1D84], 0
        cmp     byte ptr [SEQ_RUNNING], 0
L_171CC:
        je      L_171CF
        ret
L_171CF:
        mov     ax, word ptr [W_1D32]
        add     ax, 3e8h
        mov     word ptr [W_1D32], ax
        cmp     ax, word ptr [SEQ_USEC_PER_TICK]
L_171DC:
        jae     br_171DF
        ret
br_171DF:
        sub     ax, word ptr [SEQ_USEC_PER_TICK]
        mov     word ptr [W_1D32], ax
        mov     bx, ax
        mov     al, byte ptr [B_1D80]
        inc     al
        cmp     al, 60h
        jne     br_171FB
        mov     al, 0
        sub     bx, word ptr [SEQ_USEC_TICK_REM]
        mov     word ptr [W_1D32], bx

br_171FB:
        mov     byte ptr [B_1D80], al
        inc     word ptr [SEQ_NOW_TICK]
        test    byte ptr [B_1D80], 3
        mov     al, 0f8h
        jne     L_17210
        nop
        push    cs
L_1720D:
        call    display_value
L_17210:
        call    note_off_queue_tick
L_17213:
        call    fn_195A3
        ret
fn_17217:
        inc     byte ptr [MIDI_CLOCK_TICK_CNT]
        sub     ax, ax
        cmp     ax, word ptr [MIDI_CLOCK_WATCHDOG]
        je      L_17227
        dec     word ptr [MIDI_CLOCK_WATCHDOG]
L_17227:
        ret
fn_17228:
        cmp     byte ptr [P_208C], 0
        je      L_17233
        dec     byte ptr [P_208C]
L_17233:
        ret
fn_17234:
        cmp     byte ptr [P_1A38], 0
        je      L_1723F
        dec     byte ptr [P_1A38]
L_1723F:
        ret
fn_17240:
        cmp     byte ptr [MIDI_CLOCK_INTERVAL], 0
        je      L_1724B
        dec     byte ptr [MIDI_CLOCK_INTERVAL]
L_1724B:
        ret
L_1724C:
        mov     al, byte ptr [B_1D84]
        or      byte ptr [G_POS_REDRAW_REQ], al
        cmp     byte ptr [G_SYNC_OUT_MODE], 1
L_17258:
        je      br_1725B
        ret
br_1725B:
        mov     ax, word ptr [SEQ_ABS_TICK_LO]
        mov     dx, word ptr [SEQ_ABS_TICK_HI]
        cmp     byte ptr [G_SONG_MODE], 0
        je      L_17271
        add     ax, word ptr [W_582E]
        adc     dx, word ptr [W_5830]
L_17271:
        mov     bx, 18h
        cmp     dx, bx
L_17276:
        jae     L_17281
        div     bx
        cmp     ax, word ptr [W_1A3D]
L_1727E:
        jae     L_17281
        ret
L_17281:
        mov     al, 0f8h
        nop
        push    cs
L_17285:
        call    display_value
        ret
fn_17289:
        callf   CS0_SEG:smpte_test_stop_far
        mov     byte ptr [B_1D79], 0
        ret
L_17294:
        cmp     byte ptr [B_1D79], 0
L_17299:
        je      L_1729C
        ret
L_1729C:
        call    fn_16099
L_1729F:
        je      br_172A2
        ret

br_172A2:
        mov     ax, word ptr [SEQ_ELAPSED_MS_LO]
        mov     dx, word ptr [SEQ_ELAPSED_MS_HI]
        mov     bx, word ptr [SEQ_START_TIME_LO]
        mov     cx, word ptr [SEQ_START_TIME_HI]
        cmp     byte ptr [G_SONG_MODE], 0
        je      br_172C0
        add     bx, word ptr [G_SONG_STEP_START_LO]
        adc     cx, word ptr [G_SONG_STEP_START_HI]
br_172C0:
        add     ax, bx
        adc     dx, cx
        call    smpte_time_from_ms
        callf   CS0_SEG:smpte_hw_start_far
        mov     byte ptr [B_1D79], 1
        ret
L_172D2:
        cmp     byte ptr [B_1D84], 0
L_172D7:
        jne     L_172DA
        ret
L_172DA:
        cmp     byte ptr [G_SYNC_IN_MODE], 2
L_172DF:
        jne     L_17325
        nop
        push    cs
L_172E3:
        call    far_15157
        jae     loop_17333
        mov     ax, 0bh
        cmp     byte ptr [G_FRAME_RATE], 2
        jb      br_172F5
        mov     ax, 9
br_172F5:
        sub     di, ax
        sbb     si, 0
loop_172FA:
        call    L_17FC4
        mov     di, word ptr [W_1D60]
        mov     si, word ptr [W_1D62]
        sub     di, word ptr [G_SONG_STEP_START_LO]
        sbb     si, word ptr [G_SONG_STEP_START_HI]
        sub     di, word ptr [SEQ_ELAPSED_MS_LO]
        sbb     si, word ptr [SEQ_ELAPSED_MS_HI]
        jb      br_17336
        cmp     di, 2
        jb      loop_17333
        cmp     di, 3e8h
        jae     br_17346
        mov     al, 2
        ret
L_17325:
        cmp     byte ptr [G_SYNC_IN_MODE], 3
L_1732A:
        jne     L_1734C
        callf   CS0_SEG:L_04D90
        jb      loop_172FA
loop_17333:
        mov     al, 0
        ret

br_17336:
        neg     di
        cmp     di, 2
        jb      loop_17333
        cmp     di, 3e8h
        jae     br_17346
        mov     al, 1
        ret
br_17346:
        mov     byte ptr [B_1D89], 1
        ret
L_1734C:
        cmp     byte ptr [G_SYNC_OUT_MODE], 3
        jne     loop_17333
        callf   CS0_SEG:L_04CD1
        jae     loop_17333
        mov     bp, P_1A6C
L_1735D:
        call    time_accum_hours
L_17360:
        call    L_17FC4
        mov     di, word ptr [W_1D60]
        mov     si, word ptr [W_1D62]
        mov     bl, byte ptr [G_FRAME_RATE]
        mov     bh, 0
        mov     bl, byte ptr [bx+TBL_1A76]
        sub     di, bx
        sbb     si, 0
        jmp     loop_17333
        if      FW_VERSION = 150
        jmp     loop_172FA
        endif
L_1737C:
        cmp     word ptr [MIDI_CLOCK_WATCHDOG], 0
L_17381:
        jne     L_17386
        jmp     L_1740A
L_17386:
        cmp     byte ptr [B_1A2B], 0
L_1738B:
        jne     L_1738E
        ret
L_1738E:
        mov     byte ptr [B_1D85], 1
        mov     byte ptr [B_1D84], 1
        mov     byte ptr [B_1D83], 1
L_1739D:
        call    L_1724C
        cmp     byte ptr [G_SYNC_OUT_MODE], 2
        jne     L_173AC
        nop
        push    cs
L_173A9:
        call    sync_out_mtc_restart
L_173AC:
        cmp     byte ptr [G_SYNC_OUT_MODE], 3
        jne     L_173B6
L_173B3:
        call    fn_17289
L_173B6:
        mov     ax, word ptr [SEQ_BAR_TICK]
        dec     byte ptr [B_1A2B]
L_173BD:
        call    rec_punch_window_check
        call    L_171B0
L_173C3:
        call    midi_process
L_173C6:
        call    timer_check
L_173C9:
        call    midi_process
L_173CC:
        call    timer_check
L_173CF:
        call    midi_process
calls_timer_check_173d2:
        call    timer_check
        add     word ptr [SEQ_NOW_TICK], 4
        mov     word ptr [PTR_SEQ_TICK_STATE], L_173E1
        ret
L_173E1:
        add     word ptr [SEQ_ELAPSED_MS_LO], 1
        adc     word ptr [SEQ_ELAPSED_MS_HI], 0
        cmp     byte ptr [G_SYNC_SHIFT_EARLY], 0
L_173F0:
        jne     L_17411
L_173F2:
        cmp     byte ptr [B_1A2B], 0
L_173F7:
        je      L_17402
        dec     byte ptr [B_1A2B]
        if      FW_VERSION = 150
        call    L_1724C
        endif
L_173FD:
        call    L_17441
        jmp     L_173F2
L_17402:
        cmp     word ptr [MIDI_CLOCK_WATCHDOG], 0
L_17407:
        je      L_1740A
        ret
L_1740A:
        call    L_18908
L_1740D:
        call    midi_process
        ret
L_17411:
        cmp     byte ptr [B_1A2B], 0
        jne     L_173F2
        mov     al, byte ptr [MIDI_CLOCK_INTERVAL]
        cmp     al, byte ptr [G_SYNC_SHIFT_EARLY]
        ja      L_17440
L_17421:
        call    L_1724C
L_17424:
        call    L_17441
        mov     word ptr [PTR_SEQ_TICK_STATE], L_1742E
        ret
L_1742E:
        cmp     byte ptr [B_1A2B], 0
        jne     L_17436
        ret
L_17436:
        dec     byte ptr [B_1A2B]
        mov     word ptr [PTR_SEQ_TICK_STATE], L_173E1
L_17440:
        ret
L_17441:
        call    note_off_queue_tick4
        call    seq_tick_process
L_17447:
        call    midi_process
L_1744A:
        call    timer_check
L_1744D:
        call    midi_process
L_17450:
        call    timer_check
L_17453:
        call    midi_process
calls_timer_check_17456:
        call    timer_check
        add     word ptr [SEQ_NOW_TICK], 3
L_1745E:
        call    rec_punch_window_check
        ret
L_17462:
        call    fn_18A14
L_17465:
        call    L_180B5
        cmp     byte ptr [G_SONG_MODE], 0
L_1746D:
        je      L_17470
        retf
L_17470:
        sub     ax, ax
        xchg    byte ptr [B_1D87], al
        cmp     al, 0
L_17478:
        jne     L_1747B
        retf
L_1747B:
        cmp     byte ptr [B_63C8], 0
L_17480:
        jne     L_17486
L_17482:
        call    sequencer_stop
        retf
L_17486:
        callf   CS0_SEG:L_06F45
        retf
rec_arm_toggle:
        xor     byte ptr [SEQ_REC_ARMED], 1
        callf   CS0_SEG:L_02FE6
        mov     byte ptr [SEQ_ODUB_ARMED], 0
        ret
rec_disarm_when_stopped:
        cmp     byte ptr [SEQ_RUNNING], 0
L_174A1:
        je      br_174A4
        ret
br_174A4:
        mov     byte ptr [SEQ_REC_ARMED], 0
        mov     byte ptr [SEQ_ODUB_ARMED], 0
        ret
over_dub_arm_toggle:
        xor     byte ptr [SEQ_ODUB_ARMED], 1
        callf   CS0_SEG:L_02FED
        mov     byte ptr [SEQ_REC_ARMED], 0
        ret
        if      FW_VERSION = 172
sequencer_start_keep_position:
        cmp     byte ptr [P_1D95], 0
        else
        mov     al, 0
        xchg    byte ptr [P_1D95], al
        cmp     al, 0
        endif
L_174C4:
        jne     L_174EE
        mov     byte ptr [B_1A2B], 0
        cmp     byte ptr [G_SEND_MMC], 0
L_174D0:
        je      L_174EE
        nop
        push    cs
L_174D4:
        call    midi_send_start
        cmp     byte ptr [G_SYNC_IN_MODE], 1
L_174DC:
        jne     L_174EE
        if      FW_VERSION = 172
        cmp     byte ptr [D_204A], 0
L_174E3:
        jne     L_174EE
        endif
L_174E5:
        call    waiting_for_midi_play_msg
        if      FW_VERSION = 172
        mov     byte ptr [D_204A], 1
        endif
        ret
L_174EE:
        call    midi_note_send
        jne     L_17511
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[20h], 0
L_174FD:
        je      L_17502
        jmp     sequencer_start_from_top
L_17502:
        mov     al, byte ptr [SEQ_REC_ARMED]
        or      al, byte ptr [SEQ_ODUB_ARMED]
L_17509:
        jne     L_1750E
        jmp     sequencer_start_from_top
L_1750E:
        call    seq_bars_extend_one
L_17511:
        if      FW_VERSION = 150
        nop
        push    cs
        call    midi_send_start
        endif
rec_odub_keys_clear:
        mov     al, 0
        mov     byte ptr [G_REC_KEY_HELD], al
        mov     byte ptr [G_ODUB_KEY_HELD], al
        mov     byte ptr [UI_REDRAW_REQ], 1
L_1751E:
        call    fn_17703
        cmp     byte ptr [B_1A2A], 0
L_17526:
        jne     L_17538
L_17528:
        call    transport_related_175e4
L_1752B:
        jae     L_17530
        jmp     sequencer_stop
L_17530:
        call    L_17624
L_17533:
        jae     L_17538
        jmp     sequencer_stop
L_17538:
        mov     byte ptr [SEQ_RUNNING], 1
        mov     byte ptr [B_1A2A], 0
        if      FW_VERSION = 172
L_17542:
        call    sequencer_run_by_sync_mode
        ret
sequencer_run_by_sync_mode:
        cmp     byte ptr [G_SYNC_IN_MODE], 1
L_1754B:
        je      L_17563
L_1754D:
        jae     L_1757E
L_1754F:
        call    midi_out_rings_drain_wait
        endif
        mov     al, 0fbh
        nop
        push    cs
L_17556:
        call    display_value
        if      FW_VERSION = 150
L_17542:
        call    sequencer_run_by_sync_mode
        ret
sequencer_run_by_sync_mode:
        cmp     byte ptr [G_SYNC_IN_MODE], 1
L_1754B:
        je      L_17563
L_1754D:
        jae     L_1757E
L_1754F:
        endif
        mov     word ptr [PTR_SEQ_TICK_STATE], P_728F
L_1755F:
        BC_MODE
        db      0c3h
L_17563:
        cmp     word ptr [MIDI_CLOCK_WATCHDOG], 0
        je      L_1754F
        if      FW_VERSION = 172
L_1756A:
        call    midi_out_rings_drain_wait
        mov     al, 0fbh
        nop
        push    cs
L_17571:
        call    display_value
        endif
        mov     word ptr [PTR_SEQ_TICK_STATE], L_1737C
L_1757A:
        BC_MODE
        db      0c3h
L_1757E:
        cmp     byte ptr [B_63C8], 0
        jne     L_1754F
L_17585:
        call    wait_for_time_code
        if      FW_VERSION = 172
        mov     byte ptr [G_SEQ_OUTPUT_MUTE], 0
L_1758D:
        jb      L_175C5
        else
        jb      L_175C5
        mov     byte ptr [B_1D93], 1
        endif
        cmp     byte ptr [G_SYNC_OUT_MODE], 1
        jne     L_1759B
        nop
        push    cs
L_17598:
        call    sync_out_send_song_position
L_1759B:
        cmp     byte ptr [G_SYNC_OUT_MODE], 2
        jne     L_175A7
        nop
        push    cs
L_175A4:
        call    sync_out_mtc_restart
L_175A7:
        cmp     byte ptr [G_SYNC_OUT_MODE], 3
        jne     L_175B1
L_175AE:
        call    fn_17289
L_175B1:
        if      FW_VERSION = 172
        call    midi_out_rings_drain_wait
        mov     al, 0fbh
        nop
        push    cs
L_175B8:
        call    display_value
        endif
        mov     word ptr [PTR_SEQ_TICK_STATE], P_72C4
L_175C1:
        BC_MODE
        db      0c3h
L_175C5:
        BC_MODE
        db      80h
L_175C9:
        if      FW_VERSION = 172
        adc.d8  word ptr ds:[si], cx
        else
        db      3eh
        db      03h
        db      4ch, 00h
        endif
        je      L_175D5
        callf   CS0_SEG:calls_mode_05_05f2c
        ret
L_175D5:
        nop
        push    cs
L_175D7:
        call    midi_send_stop
        mov     al, 0fch
        nop
        push    cs
L_175DE:
        call    display_value
        jmp     L_178DD
transport_related_175e4:
        cmp     byte ptr [B_1D88], 0
L_175E9:
        jne     L_175EC
        ret
L_175EC:
        cmp     byte ptr [B_63C8], 0
L_175F1:
        jne     L_17604
        mov     al, byte ptr [B_14D1]
        or      al, byte ptr [B_14D2]
L_175FA:
        jne     L_17601
        callf   CS0_SEG:calls_cursor_handler_0178b
L_17601:
        BC_FLUSH
L_17604:
        cmp     byte ptr [B_1D88], 0
        jne     L_1760C
        ret
L_1760C:
        callf   CS0_SEG:calls_compare_bytes_d20_00468
        callf   CS0_SEG:panel_key_release_clear_held_far
        cmp     bh, 84h
L_17619:
        jne     L_17604
        cmp     bl, 1eh
        je      L_17622
        jmp     SHORT L_17604
L_17622:
        stc
        ret
L_17624:
        cmp     byte ptr [G_COUNT_ENABLE], 0
        if      FW_VERSION = 172
L_17629:
        endif
        jne     L_1762C
        ret
L_1762C:
        cmp     byte ptr [G_COUNT_IN_MODE], 0
L_17631:
        jne     L_17634
        ret
L_17634:
        cmp     byte ptr [G_COUNT_IN_MODE], 1
L_17639:
        jne     L_17645
        mov     al, byte ptr [SEQ_REC_ARMED]
        or      al, byte ptr [SEQ_ODUB_ARMED]
L_17642:
        jne     L_17645
        ret
        if      FW_VERSION = 150
L_17629:
        endif
L_17645:
        cmp     byte ptr [B_63C8], 0
L_1764A:
        jne     L_1765D
        mov     al, byte ptr [B_14D1]
        or      al, byte ptr [B_14D2]
L_17653:
        jne     L_1765A
        callf   CS0_SEG:calls_cursor_handler_0178b
L_1765A:
        BC_FLUSH
L_1765D:
        cmp     word ptr [SEQ_BAR_TICK], 0
        je      L_1767B
        mov     ax, word ptr [SEQ_CUR_BAR]
L_17667:
        call    seq_position_set_bar
        mov     al, byte ptr [B_14D1]
        or      al, byte ptr [B_14D2]
L_17671:
        jne     L_17678
        callf   CS0_SEG:calls_cursor_handler_0178b
L_17678:
        BC_FLUSH
L_1767B:
        test    byte ptr [B_1D80], 3
        jne     L_1767B
L_17682:
        call    metronome_set_accent_click
        mov     ax, word ptr [SEQ_BAR_LEN_TICKS]
        mov     bl, byte ptr [METRO_INTERVAL_TICKS]
        div     bl
        cmp     al, 0
        jne     br_17693
        ret
br_17693:
        dec     al
        je      br_176E8
L_17697:
        mov     ah, byte ptr [METRO_INTERVAL_TICKS]
L_1769B:
        mov     cl, byte ptr [B_1D80]
L_1769F:
        push    ax
        push    cx
        callf   CS0_SEG:calls_compare_bytes_d20_00468
        callf   CS0_SEG:panel_key_release_clear_held_far
        pop     cx
        pop     ax
        cmp     bh, 84h
        jne     br_176C4
        cmp     bl, 1eh
L_176B5:
        jne     br_176BA
        jmp     NEAR L_17622
br_176BA:
        cmp     bl, 16h
        jne     br_176C4
        mov     byte ptr [B_14CF], 1
br_176C4:
        cmp     bl, 18h
        jne     L_176CE
        mov     byte ptr [G_TAP_HELD], 1
L_176CE:
        pusha
        callf   CS0_SEG:panel_key_release_clear_held_far
        popa
        cmp     cl, byte ptr [B_1D80]
        je      L_1769F
        dec     ah
        jne     L_1769B
        push    ax
L_176E0:
        call    metronome_set_normal_click
        pop     ax
        dec     al
        jne     L_17697
br_176E8:
        nop
        push    cs
        call    event_queues_reset_far
        if      FW_VERSION = 150
        cli
        mov     al, 0
        mov     byte ptr [NOTE_RING_RD], al
        mov     byte ptr [NOTE_RING_WR], al
        mov     byte ptr [MIDI_REC_RING_RD], al
        mov     byte ptr [MIDI_REC_RING_WR], al
        sti
        endif
        mov     ah, byte ptr [METRO_INTERVAL_TICKS]
L_176F1:
        mov     al, byte ptr [B_1D80]
loop_176F4:
        cmp     al, byte ptr [B_1D80]
        je      loop_176F4
        dec     ah
        cmp     ah, 4
        jne     L_176F1
        clc
        ret

fn_17703:
        mov     byte ptr [B_1A29], 0
        mov     byte ptr [G_REC_EVENTS_ADDED], 0
        mov     byte ptr [B_1D88], 0
        mov     byte ptr [B_1D92], 0
        mov     byte ptr [G_REC_UNDO_PENDING], 0
        mov     byte ptr [B_1D89], 0
        sub     si, si
        mov     es, si
        les     si, es:[0f4h]
        mov     al, byte ptr es:[si+TBL_0013]
        mov     byte ptr [G_NOTE_VAR_NOTE], al
        cmp     byte ptr [G_COUNT_ENABLE], 0
        je      L_1773E
        mov     al, byte ptr [D_0B35]
        mov     byte ptr [B_1D88], al
L_1773E:
        mov     byte ptr [MIDI_OUT1_RUNNING_STATUS], 0ffh
        mov     byte ptr [MIDI_OUT2_RUNNING_STATUS], 0ffh
        mov     dx, 40h
        mov     byte ptr [G_LAST_NOTE_VAR_TYPE], dh
        mov     byte ptr [G_LAST_NOTE_VAR_VALUE], dl
        callf   CS0_SEG:main_screen_install_play_handlers_far
        mov     word ptr [UI_REL_SLOT_REC], NULL_HANDLER_OFS
        mov     word ptr [UI_REL_SLOT_ODUB], NULL_HANDLER_OFS
L_17764:
        call    metronome_rate_update
L_17767:
        call    timing_swing_offset_calc
        nop
        push    cs
L_1776C:
        call    held_notes_release_all
        callf   CS0_SEG:smpte_frame_rate_params_load
        mov     al, byte ptr [SEL_SEQ]
        mov     byte ptr [G_PLAY_START_SEQ], al
        mov     byte ptr [G_NEXTSEQ_CHAINED], 0
        mov     al, byte ptr [SEQ_REC_ARMED]
        or      al, byte ptr [SEQ_ODUB_ARMED]
L_17786:
        jne     br_17789
        ret
br_17789:
        mov     byte ptr [G_REC_UNDO_PENDING], 1
        ret
seq_send_start_program_changes:
        mov     ax, word ptr [SEQ_CUR_BAR]
        or      ax, word ptr [SEQ_BAR_TICK]
L_17796:
        je      br_17799
        ret
br_17799:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bx, 0
loop_177A0:
        push    bx
        test    byte ptr es:[bx+TRK_STATUS], 1
        je      L_177C8
        mov     ch, byte ptr es:[bx+TRK_CHANNEL]
        test    ch, 80h
        je      L_177C8
        mov     al, byte ptr es:[bx+470h]
        sub     al, 1
        jb      L_177C8
        mov     ah, 0c0h
        mov     dx, 40h
        cli
        nop
        push    cs
        call    midi_event_route
        sti
L_177C8:
        pop     bx
        inc     bl
L_177CB:
        cmp     bl, 40h
        jne     loop_177A0
        ret
waiting_for_midi_play_msg:
        BC_SEQ_NAV "         Waiting for MIDI 'Play'"
L_177F5:
        BC_PLANE_A
L_177F8:
        BC_FLUSH
L_177FB:
        ret
sequencer_start_from_top:
        call    seq_rewind_to_start
        if      FW_VERSION = 172
        cmp     byte ptr [P_1D95], 0
L_17804:
        else
        mov     al, 0
        xchg    byte ptr [P_1D95], al
        cmp     al, 0
        endif
        jne     L_1782E
        if      FW_VERSION = 150
L_17804:
        endif
        cmp     byte ptr [G_SEND_MMC], 0
L_1780B:
        je      L_1782E
        nop
        push    cs
L_1780F:
        call    mmc_send_locate
        nop
        push    cs
L_17814:
        call    midi_send_start
        cmp     byte ptr [G_SYNC_IN_MODE], 1
L_1781C:
        jne     L_1782E
        if      FW_VERSION = 172
        cmp     byte ptr [D_204A], 0
L_17823:
        jne     L_1782E
        endif
L_17825:
        call    waiting_for_midi_play_msg
        if      FW_VERSION = 172
        mov     byte ptr [D_204A], 1
        endif
        ret
L_1782E:
        mov     word ptr [W_1A3D], 0
        mov     al, 0
        mov     byte ptr [G_REC_KEY_HELD], al
        mov     byte ptr [G_ODUB_KEY_HELD], al
        mov     byte ptr [UI_REDRAW_REQ], 1
L_17841:
        call    fn_17703
        cmp     byte ptr [B_1A2A], 0
        jne     L_1785E
L_1784B:
        call    transport_related_175e4
L_1784E:
        jae     L_17852
        jmp     SHORT sequencer_stop
L_17852:
        call    L_17624
L_17855:
        jae     L_17859
        jmp     SHORT sequencer_stop
L_17859:
        mov     byte ptr [B_1A2B], 0
L_1785E:
        mov     byte ptr [SEQ_RUNNING], 1
        mov     byte ptr [B_1A2A], 0
        mov     al, 0fah
        nop
        push    cs
L_1786C:
        call    display_value
L_1786F:
        call    sequencer_run_by_sync_mode
        ret
sequencer_stop:
        if      FW_VERSION = 172
        mov     byte ptr [B_14CF], 0
        endif
        mov     byte ptr [P_1A38], 0
        mov     byte ptr [P_208C], 0
        if      FW_VERSION = 172
        mov     word ptr [MIDI_CLOCK_WATCHDOG], 0
        endif
        mov     byte ptr [G_NEXT_SEQ], 0ffh
        if      FW_VERSION = 172
        mov     byte ptr [D_1A1F], 0
        endif
L_17892:
        BC_MODE
        db      80h
L_17896:
        if      FW_VERSION = 172
        test    byte ptr ds:[di], bl
        else
        db      3eh
        db      78h
        db      1dh
        endif
        add     byte ptr [si+41h], dh
        cli
        mov     word ptr [PTR_SEQ_TICK_STATE], P_7342
        mov     ax, word ptr [SEQ_USEC_ACCUM]
        mov     word ptr [W_1D32], ax
        mov     al, byte ptr [B_1D81]
        mov     byte ptr [B_1D80], al
        sti
        cmp     byte ptr [B_1D85], 0
L_178B5:
        jne     br_178C9
L_178B7:
        call    midi_note_send
L_178BA:
        je      br_178C9
        test    word ptr [SEQ_BAR_TICK], 3
L_178C2:
        jne     br_178C9
        call    seq_timer_ms_tick
        jmp     SHORT L_178B7
br_178C9:
        mov     al, 0fch
        nop
        push    cs
L_178CD:
        call    display_value
L_178D0:
        test    word ptr [SEQ_BAR_TICK], 3
L_178D6:
        je      L_178DD
        call    seq_timer_ms_tick
        jmp     SHORT L_178D0
L_178DD:
        mov     word ptr [PTR_SEQ_TICK_STATE], P_7342
        cmp     byte ptr [SEQ_LOOP_JUMP_STATE], 0
        je      L_17908
L_178EA:
        call    fn_18A14
        mov     byte ptr [SEQ_LOOP_JUMP_STATE], 0
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ax, word ptr es:[1ch]
        mov     word ptr [SEQ_CUR_BAR], ax
        mov     word ptr [W_63E0], ax
        sub     ax, ax
        mov     word ptr [SEQ_BAR_TICK], ax
        mov     word ptr [W_63E2], ax
L_17908:
        call    note_off_queue_tick
        callf   CS0_SEG:smpte_test_stop_far
        if      FW_VERSION = 172
        mov     ax, word ptr [SEQ_CUR_BAR]
        inc     ax
        cmp     ax, word ptr [SEQ_BAR_COUNT]
        jne     L_17936
        mov     bx, ax
        callf   CS0_SEG:calls_state_update_0ddd4
        mov     ah, 0
        cmp     ax, word ptr [SEQ_BAR_TICK]
        jae     L_17936
        cmp     word ptr [W_63E2], 0
        jne     L_17936
        mul     bl
        dec     ax
        mov     word ptr [W_63E2], ax
        endif
L_17936:
        call    record_flush_held
L_17939:
        call    midi_release_sustain_all
L_1793C:
        call    fn_1A32D
        cmp     byte ptr [G_SYNC_IN_MODE], 2
        jb      L_1794E
        mov     cx, 64h
        callf   CS0_SEG:delay_ticks_far
L_1794E:
        mov     al, byte ptr [SEQ_REC_ARMED]
        or      al, byte ptr [SEQ_ODUB_ARMED]
        je      L_17991
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[20h], 0
        jne     L_17991
        mov     ax, word ptr [SEQ_BAR_COUNT]
        sub     ax, word ptr [SEQ_CUR_BAR]
        cmp     ax, 2
        jae     L_17991
        push    word ptr [SEQ_CUR_BAR]
        push    word ptr [SEQ_BAR_TICK]
        nop
        push    cs
L_17979:
        call    seq_edit_end_far
        mov     al, byte ptr [SEL_SEQ]
        callf   CS0_SEG:calls_process_input_00fea
        callf   CS0_SEG:calls_check_and_call_01c45
L_17989:
        call    seq_build_timing_map
        pop     cx
        pop     ax
        call    seq_position_set
L_17991:
        sub     ax, ax
        mov     byte ptr [B_1D84], al
        mov     byte ptr [SEQ_RUNNING], al
        mov     byte ptr [B_1D85], al
        mov     byte ptr [SEQ_REC_ARMED], al
        mov     byte ptr [SEQ_ODUB_ARMED], al
        mov     byte ptr [P_1A38], al
        mov     byte ptr [P_208C], al
        mov     byte ptr [B_1D93], al
        if      FW_VERSION = 172
        mov     byte ptr [D_204A], al
        mov     byte ptr [P_1D95], al
        endif
L_179B1:
        call    fn_17A29
        callf   CS0_SEG:calls_calc_bar_beat_00fee
        callf   CS0_SEG:main_screen_install_transport_handlers_far
        mov     byte ptr [UI_REDRAW_REQ], 1
        cmp     byte ptr [G_NEXTSEQ_CHAINED], 0
L_179C8:
        jne     L_179CB
        ret
L_179CB:
        mov     byte ptr [G_NEXTSEQ_CHAINED], 0
        mov     al, byte ptr [G_PLAY_START_SEQ]
        push    ax
        nop
        push    cs
calls_far_wrapper_19743_179d6:
        call    far_wrapper_19743
        mov     word ptr [CUR_SEQ_SEG], es
        pop     ax
        xchg    byte ptr [SEL_SEQ], al
        push    ax
L_179E3:
        call    seq_position_reset
        nop
        push    cs
L_179E8:
        call    seq_edit_end_far
        nop
        push    cs
L_179ED:
        call    undo_seq_discard_far
        pop     ax
        mov     byte ptr [SEL_SEQ], al
        callf   CS0_SEG:calls_process_input_00fea
L_179F9:
        call    seq_build_timing_map
        cmp     byte ptr [G_SYNC_IN_MODE], 0
        je      L_17A08
        callf   CS0_SEG:calls_check_and_call_01c45
L_17A08:
        ret
midi_release_sustain_all:
        mov     si, P_1DB6
        mov     ax, 0b040h
        mov     bl, 40h
loop_17A11:
        sub     cx, cx
        xchg    word ptr [si], cx
        add     si, 2
        cmp     cl, 0
        mov     cl, 0
        je      L_17A24
        nop
        push    cs
        call    midi_event_route
L_17A24:
        dec     bl
L_17A26:
        jne     loop_17A11
        ret
fn_17A29:
        cmp     byte ptr [G_REC_UNDO_PENDING], 0
        je      L_17A3B
        nop
        push    cs
        call    undo_seq_flag_latch_far
        mov     byte ptr [G_REC_UNDO_PENDING], 0
        ret
L_17A3B:
        cmp     byte ptr [B_1D92], 0
L_17A40:
        jne     L_17A43
        ret
L_17A43:
        cmp     byte ptr [G_NEXTSEQ_CHAINED], 0
L_17A48:
        je      L_17A4B
        ret
L_17A4B:
        mov     byte ptr [B_1D92], 0
        mov     ax, 64h
        nop
        push    cs
calls_far_wrapper_19743_17a55:
        call    far_wrapper_19743
        jae     L_17A5B
        ret
L_17A5B:
        push    word ptr [SEQ_CUR_BAR]
        push    word ptr [SEQ_BAR_TICK]
        nop
        push    cs
L_17A65:
        call    seq_edit_end_far
        nop
        push    cs
L_17A6A:
        call    undo_seq_discard_far
        mov     al, byte ptr [SEL_SEQ]
        callf   CS0_SEG:calls_process_input_00fea
        callf   CS0_SEG:calls_check_and_call_01c45
        pop     cx
        pop     ax
        call    seq_position_set
        ret
locate_step_fwd:
        cmp     byte ptr [G_SHIFT_HELD], 0
L_17A85:
        jne     locate_step_fwd_event
        mov     ax, word ptr [SEQ_CUR_BAR]
        cmp     ax, word ptr [SEQ_BAR_COUNT]
L_17A8E:
        jne     br_17A91
        ret
br_17A91:
        if      FW_VERSION = 172
        call    timing_swing_offset_calc
        mov     cx, word ptr [SEQ_TC_NOTE_TICKS]
        else
        call    note_value_ticks_get
        mov     cx, ax
        endif
        mov     ax, word ptr [SEQ_BAR_TICK]
        sub     dx, dx
        div     cx
        or      dx, dx
        je      L_17AA5
        sub     cx, dx
L_17AA5:
        if      FW_VERSION = 172
        call    locate_swing_adjust_fwd
        endif
        jcxz    L_17AD5
L_17AAA:
        push    cx
        if      FW_VERSION = 172
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     al, byte ptr es:[20h]
        push    ax
        mov     byte ptr es:[20h], 0
        endif
L_17ABA:
        call    midi_process
L_17ABD:
        call    seq_gap_seek_forward
        if      FW_VERSION = 172
        pop     ax
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     byte ptr es:[20h], al
        endif
        pop     cx
        mov     ax, word ptr [SEQ_CUR_BAR]
        cmp     ax, word ptr [SEQ_BAR_COUNT]
        je      L_17AD5
        loop    L_17AAA
L_17AD5:
        call    seq_pos_recalc_and_send_spp
L_17AD8:
        call    L_17C2E
        callf   CS0_SEG:calls_calc_bar_beat_00fee
        ret
locate_step_fwd_event:
        call    locate_next_event
L_17AE4:
        call    seq_pos_recalc_and_send_spp
L_17AE7:
        call    L_17C2E
        callf   CS0_SEG:calls_calc_bar_beat_00fee
        ret
locate_next_event:
        call    seq_gap_move_event_fwd
        les     si, [FP_SEQ_AFTER_GAP]
        cmp     byte ptr es:[si], 0ffh
L_17AFB:
        je      br_17B31
L_17AFD:
        call    scsi_status_check
        cmp     bx, word ptr [SEQ_CUR_BAR]
        jne     L_17B0C
        cmp     cx, word ptr [SEQ_BAR_TICK]
L_17B0A:
        je      locate_next_event
L_17B0C:
        mov     word ptr [SEQ_CUR_BAR], bx
        mov     word ptr [SEQ_BAR_TICK], cx
        cmp     al, 0c0h
        jne     br_17B2F
        mov     al, byte ptr es:[si+6]
        cmp     al, 0c0h
L_17B1E:
        je      locate_next_event
L_17B20:
        call    scsi_operation
        mov     ax, word ptr es:[si+7]
        and     ax, 7ffh
L_17B2A:
        jne     locate_next_event
L_17B2C:
        call    seq_apply_current_bar_tsig
br_17B2F:
        clc
        ret
br_17B31:
        call    seq_gap_move_event_back
        stc
        ret
sequence_data_read:
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
        jne     L_17B3E
        ret
L_17B3E:
        and     al, 0c0h
        cmp     al, 80h
L_17B42:
        jne     fn_17B4E
loop_17B44:
        call    fn_17B4E
        mov     al, byte ptr es:[si]
        cmp     al, 0c2h
        jne     loop_17B44
fn_17B4E:
        mov     cx, es
        add     si, 6
        cmp     si, 10h
        jb      L_17B5E
        sub     si, 10h
        inc     cx
        mov     es, cx
L_17B5E:
        ret
locate_step_back:
        cmp     byte ptr [G_SHIFT_HELD], 0
L_17B64:
        jne     locate_step_back_event
        if      FW_VERSION = 172
        mov     ax, word ptr [SEQ_CUR_BAR]
        or      ax, word ptr [SEQ_BAR_TICK]
L_17B6D:
        jne     L_17B70
        ret
        endif
L_17B70:
        if      FW_VERSION = 172
        call    timing_swing_offset_calc
        mov     cx, word ptr [SEQ_TC_NOTE_TICKS]
        else
        call    note_value_ticks_get
        mov     cx, ax
        endif
        mov     ax, word ptr [SEQ_BAR_TICK]
        sub     dx, dx
        div     cx
        or      dx, dx
        je      L_17B84
        mov     cx, dx
L_17B84:
        if      FW_VERSION = 172
        call    locate_swing_adjust_back
        endif
        push    cx
L_17B88:
        call    seq_pos_dec_tick
L_17B8B:
        call    L_19476
        pop     cx
        loop    L_17B84
L_17B91:
        call    seq_apply_current_bar_tsig
L_17B94:
        call    seq_pos_recalc_and_send_spp
L_17B97:
        call    L_17C2E
        callf   CS0_SEG:calls_calc_bar_beat_00fee
        ret
locate_step_back_event:
        call    locate_prev_event
L_17BA3:
        call    seq_apply_current_bar_tsig
L_17BA6:
        call    seq_pos_recalc_and_send_spp
L_17BA9:
        call    L_17C2E
        callf   CS0_SEG:calls_calc_bar_beat_00fee
        ret
locate_prev_event:
        call    seq_gap_move_event_back
L_17BB5:
        jb      br_17BD9
        les     si, [FP_SEQ_AFTER_GAP]
        cmp     byte ptr es:[si], 0c0h
L_17BBF:
        je      locate_prev_event
        mov     cx, word ptr es:[si+1]
        and     ch, 7
        mov     word ptr [SEQ_BAR_TICK], cx
        mov     bx, word ptr [SEQ_CURSOR_BAR]
        mov     word ptr [SEQ_CUR_BAR], bx
L_17BD4:
        call    L_19476
        clc
        ret
br_17BD9:
        call    seq_rewind_to_start
        stc
        ret
locate_bar_fwd:
        cmp     byte ptr [G_SHIFT_HELD], 0
L_17BE3:
        jne     locate_bar_fwd_to_end
        mov     ax, word ptr [SEQ_CUR_BAR]
        cmp     ax, word ptr [SEQ_BAR_COUNT]
        jne     L_17BEF
        ret
L_17BEF:
        inc     ax
L_17BF0:
        call    seq_position_set_bar
        les     si, [FP_SEQ_AFTER_GAP]
L_17BF7:
        call    scsi_operation
        nop
        push    cs
L_17BFC:
        call    sync_out_send_song_position
        ret
locate_bar_fwd_to_end:
        call    locate_to_end
        nop
        push    cs
L_17C05:
        call    sync_out_send_song_position
        ret
locate_to_end:
        mov     ax, word ptr [SEQ_BAR_COUNT]
L_17C0C:
        call    seq_position_set_bar
        ret
seq_position_set_bar:
        sub     cx, cx
seq_position_set:
        cmp     word ptr [SEQ_BAR_COUNT], ax
        jae     L_17C1D
        mov     ax, word ptr [SEQ_BAR_COUNT]
        sub     cx, cx
L_17C1D:
        mov     word ptr [SEQ_CUR_BAR], ax
        mov     word ptr [SEQ_BAR_TICK], cx
L_17C24:
        call    L_19476
L_17C27:
        call    seq_pos_recalc_bar_beat
L_17C2A:
        call    L_17C2E
        ret
L_17C2E:
        mov     ax, word ptr [SEQ_CUR_BAR]
        or      ax, word ptr [SEQ_BAR_TICK]
        jne     L_17C3A
L_17C37:
        call    seq_position_reset
L_17C3A:
        les     si, [FP_SEQ_AFTER_GAP]
L_17C3E:
        mov     bx, word ptr [SEQ_CURSOR_BAR]
        mov     cx, word ptr es:[si+1]
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
L_17C4B:
        je      L_183E4
        cmp     al, 0c0h
        jne     L_17C55
        mov     bx, cx
        sub     cx, cx
L_17C55:
        cmp     bx, word ptr [SEQ_CUR_BAR]
L_17C59:
        jne     L_183E4
        cmp     cx, word ptr [SEQ_BAR_TICK]
L_17C5F:
        jne     L_183E4
        push    ax
        cmp     al, 0c0h
        jne     L_17C69
L_17C66:
        call    scsi_operation
L_17C69:
        pop     ax
        cmp     al, 0c1h
        jne     calls_sequence_data_read_17c71
calls_sequence_data_read_17c6e:
        call    seq_apply_tempo_change_event
calls_sequence_data_read_17c71:
        call    sequence_data_read
        jmp     SHORT L_17C3E
L_183E4:
        ret
L_183E5:
        cmp     byte ptr [G_SHIFT_HELD], 0
        jne     locate_to_start
        mov     ax, word ptr [SEQ_CUR_BAR]
        or      ax, ax
        je      L_17C8D
        cmp     word ptr [SEQ_BAR_TICK], 0
        jne     L_17C8D
        dec     ax
L_17C8D:
        call    seq_position_set_bar
L_17C90:
        call    seq_apply_current_bar_tsig
        nop
        push    cs
L_17C95:
        call    sync_out_send_song_position
        ret
locate_to_start:
        call    seq_rewind_to_start
L_17C9C:
        call    seq_pos_recalc_and_send_spp
        ret
seq_rewind_to_start:
        cmp     byte ptr [G_SONG_MODE], 0
L_17CA5:
        jne     br_17CB7
L_17CA7:
        call    seq_gap_move_event_back
L_17CAA:
        jae     seq_rewind_to_start
L_17CAC:
        call    seq_position_reset
        les     si, [FP_SEQ_AFTER_GAP]
L_17CB3:
        call    scsi_operation
        ret
br_17CB7:
        mov     ax, word ptr [SEQ_EVENTS_SEG]
        mov     word ptr [SEQ_READ_PTR_SEG], ax
        sub     ax, ax
        mov     word ptr [FP_SEQ_READ_PTR], ax
        ret
seq_pos_recalc_and_send_spp:
        call    seq_pos_recalc_bar_beat
        nop
        push    cs
L_17CC8:
        call    sync_out_send_song_position
        ret
seq_pos_recalc_bar_beat:
        sub     ax, ax
        mov     word ptr [SEQ_ELAPSED_MS_LO], ax
        mov     word ptr [SEQ_ELAPSED_MS_HI], ax
        mov     word ptr [W_1D28], ax
        mov     cx, word ptr [SEQ_CUR_BAR]
        mov     si, P_D1D8
        sub     ax, ax
        sub     dx, dx
        jcxz    br_17CEE
tgt_17CE4:
        add     ax, word ptr [si]
        adc     dx, 0
        add     si, 2
        loop    tgt_17CE4
br_17CEE:
        add     ax, word ptr [SEQ_BAR_TICK]
        adc     dx, 0
        mov     word ptr [SEQ_ABS_TICK_LO], ax
        mov     word ptr [SEQ_ABS_TICK_HI], dx
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[16h], 0
        mov     di, 3e8h
        je      br_17D38
        mov     si, P_7DD8
L_17D0E:
        mov     di, word ptr [si]
        sub     ax, word ptr [si+2]
        sbb     dx, word ptr [si+4]
L_17D16:
        jb      L_17D28
        pusha
        mov     ax, word ptr [si+2]
        mov     dx, word ptr [si+4]
L_17D1F:
        call    L_17D3C
        popa
        add     si, 0ah
        jmp     SHORT L_17D0E
L_17D28:
        pusha
        mov     ax, word ptr [si]
        mov     word ptr [SEQ_TEMPO_CHG_RATIO], ax
L_17D2E:
        call    seq_tempo_rate_update
        popa
        add     ax, word ptr [si+2]
        adc     dx, word ptr [si+4]
br_17D38:
        call    L_17D3C
        ret
L_17D3C:
        cmp     dx, 60h
L_17D3F:
        jb      L_17D42
        ret
L_17D42:
        mov     bx, ax
        or      bx, dx
        jne     L_17D49
        ret
L_17D49:
        mov     bx, 60h
        div     bx
        push    dx
        push    ax
        mov     ax, word ptr [W_1D72]
        mul     di
        mov     bx, 3e8h
        div     bx
        mov     di, ax
        sub     si, si
        mov     dx, 23c3h
        mov     ax, 4600h
        nop
        push    cs
calls_state_check_104_17d66:
        call    state_check_104FB
        mov     word ptr [SEQ_USEC_PER_QTR_LO], ax
        mov     word ptr [SEQ_USEC_PER_QTR_HI], dx
        pop     cx
L_17D71:
        call    mul32x16
        pop     cx
        push    ax
        push    dx
        mov     ax, word ptr [SEQ_USEC_PER_QTR_LO]
        mov     dx, word ptr [SEQ_USEC_PER_QTR_HI]
L_17D7E:
        call    mul32x16
        mov     di, 60h
        sub     si, si
        nop
        push    cs
calls_state_check_104_17d88:
        call    state_check_104FB
        pop     bx
        pop     cx
        add     ax, cx
        adc     dx, bx
        push    ax
        push    dx
        add     ax, word ptr [W_1D28]
        adc     dx, 0
        mov     di, 3e8h
        sub     si, si
        nop
        push    cs
calls_state_check_104_17da1:
        call    state_check_104FB
        add     word ptr [SEQ_ELAPSED_MS_LO], ax
        adc     word ptr [SEQ_ELAPSED_MS_HI], dx
        mov     word ptr [W_1D28], di
        pop     dx
        pop     ax
        ret
mul32x16:
        mov     bp, dx
        mul     cx
        mov     di, ax
        mov     si, dx
        mov     ax, bp
        mul     cx
        add     si, ax
        mov     dx, si
        mov     ax, di
        ret

midi_note_send:
        push    ax
        mov     ax, word ptr [SEQ_CUR_BAR]
        cmp     ax, word ptr [SEQ_BAR_COUNT]
        pop     ax
        ret

timing_swing_offset_calc:
        call    note_value_ticks_get
        mov     bl, al
        mov     bh, byte ptr [G_SWING_PCT]
        mul     bh
        mov     bh, 32h
        div     bh
        sub     ah, ah
        cmp     bl, 30h
        je      br_17DED
        cmp     bl, 18h
        je      br_17DED
        sub     ax, ax
br_17DED:
        mov     word ptr [G_SWING_OFFSET], ax
        ret
note_value_ticks_get:
        mov     al, byte ptr [G_TC_NOTE_VALUE]
        mov     bx, P_1E36
        xlat
        sub     ah, ah
        mov     word ptr [SEQ_TC_NOTE_TICKS], ax
        if      FW_VERSION = 172
        ret
locate_swing_adjust_fwd:
        cmp     byte ptr [G_TC_NOTE_VALUE], 1
        je      L_17E0D
        cmp     byte ptr [G_TC_NOTE_VALUE], 3
        je      L_17E0D
        ret
L_17E0D:
        shr     al, 1
        jb      L_17E16
        add     cx, word ptr [G_SWING_OFFSET]
        ret
L_17E16:
        cmp     dx, word ptr [G_SWING_OFFSET]
L_17E1A:
        jb      L_17E1D
        ret
L_17E1D:
        mov     cx, word ptr [G_SWING_OFFSET]
        sub     cx, dx
        ret
locate_swing_adjust_back:
        cmp     byte ptr [G_TC_NOTE_VALUE], 1
        je      L_17E33
        cmp     byte ptr [G_TC_NOTE_VALUE], 3
        je      L_17E33
        ret
L_17E33:
        shr     al, 1
        jae     L_17E47
        cmp     cx, word ptr [G_SWING_OFFSET]
L_17E3B:
        jbe     L_17E42
L_17E3D:
        sub     cx, word ptr [G_SWING_OFFSET]
        ret
L_17E42:
        add     cx, word ptr [SEQ_TC_NOTE_TICKS]
        ret
L_17E47:
        or      dx, dx
        je      L_17E3D
        endif
        ret
wait_for_time_code:
        BC_SEQ_NAV "         Waiting for time code."
L_17E6F:
        mov     dx, 146h
        out     dx, al
L_17E73:
        BC_PLANE_A
L_17E76:
        mov     al, byte ptr [B_14D1]
        or      al, byte ptr [B_14D2]
L_17E7D:
        jne     L_17E97
        cmp     byte ptr [G_SONG_MODE], 0
L_185A4:
        jne     L_17E8B
        callf   CS0_SEG:calls_cursor_handler_0178b
L_17E8B:
        cmp     byte ptr [G_SONG_MODE], 0
L_17E90:
        je      L_17E97
        callf   CS0_SEG:handler_BC_BUFFER
L_17E97:
        BC_FLUSH
L_17E9A:
        call    L_17F8D
        jb      L_17EC3
        callf   CS0_SEG:calls_compare_bytes_d20_00468
        callf   CS0_SEG:panel_key_release_clear_held_far
        cmp     bh, 84h
L_17EAC:
        jne     L_17E9A
        cmp     bl, 1eh
        if      FW_VERSION = 172
        je      L_17EBF
        cmp     bl, 1fh
        je      L_17EC1
        cmp     bl, 29h
        je      L_17EC1
        jmp     L_17E9A
        else
        jne     L_17E9A
        endif
L_17EBF:
        stc
        if      FW_VERSION = 172
        ret
L_17EC1:
        clc
        endif
        ret
L_17EC3:
        cmp     al, 0
        jne     loop_17F1B
L_17EC7:
        call    L_182FF
L_17ECA:
        call    midi_note_send
L_17ECD:
        je      br_17F29
L_17ECF:
        call    L_17F8D
L_17ED2:
        jae     L_17E9A
        cmp     al, 0
        jne     loop_17F1B
loop_17ED8:
        mov     ax, word ptr [SEQ_ELAPSED_MS_LO]
        mov     dx, word ptr [SEQ_ELAPSED_MS_HI]
        cmp     byte ptr [G_SONG_MODE], 0
        je      L_17EEE
        add     ax, word ptr [G_SONG_STEP_START_LO]
        adc     dx, word ptr [G_SONG_STEP_START_HI]
L_17EEE:
        sub     ax, word ptr [W_1D60]
        sbb     dx, word ptr [W_1D62]
L_17EF6:
        jae     L_17F42
        cmp     dx, -1
L_17EFB:
        jne     L_17E9A
        neg     ax
        cmp     ax, 0bb8h
L_17F02:
        jae     L_17E9A
        mov     byte ptr [G_SEQ_OUTPUT_MUTE], 1
        call    seq_timer_ms_tick
        mov     byte ptr [G_SEQ_OUTPUT_MUTE], 0
L_17F11:
        call    midi_note_send
        jne     loop_17ED8
        if      FW_VERSION = 172
        mov     byte ptr [G_SEQ_OUTPUT_MUTE], 1
        endif
loop_17F1B:
        call    L_17F8D
        jb      L_17F23
        jmp     wait_for_time_code
L_17F23:
        cmp     al, 0
L_17F25:
        jne     br_17F29
        jmp     L_17EC7
br_17F29:
        call    time_code_status_draw
        callf   CS0_SEG:calls_compare_bytes_d20_00468
        callf   CS0_SEG:panel_key_release_clear_held_far
        cmp     bh, 84h
        jne     loop_17F1B
        cmp     bl, 1eh
        jne     loop_17F1B
        stc
        ret
L_17F42:
        if      FW_VERSION = 172
        mov     byte ptr [B_1D93], 1
        endif
        clc
        ret
L_17F49:
        cmp     byte ptr [G_SONG_MODE], 0
        jne     loop_17F1B
L_17F50:
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[20h], 0
        je      loop_17F1B
L_17F5C:
        call    seq_rewind_to_start
L_17F5F:
        call    L_17F8D
L_17F62:
        jb      L_17F67
        jmp     wait_for_time_code
L_17F67:
        sub     di, word ptr [SEQ_START_TIME_LO]
        sbb     si, word ptr [SEQ_START_TIME_HI]
L_17F6F:
        jb      br_17F74
        jmp     L_17EC7
br_17F74:
        call    time_code_status_draw
        callf   CS0_SEG:calls_compare_bytes_d20_00468
        callf   CS0_SEG:panel_key_release_clear_held_far
        cmp     bh, 84h
        jne     L_17F5F
        cmp     bl, 1eh
        jne     L_17F5F
        stc
        ret
L_17F8D:
        mov     byte ptr [P_208D], 0
        mov     byte ptr [MTC_RX_TIME_VALID], 0
        cmp     byte ptr [G_SYNC_IN_MODE], 2
L_17F9C:
        jne     L_17FB1
loop_17F9E:
        cmp     byte ptr [P_1A38], 0
        jne     L_17FA6
        ret
L_17FA6:
        nop
        push    cs
L_17FA8:
        call    far_15157
        jae     loop_17F9E
L_17FAD:
        call    L_17FC4
        ret
L_17FB1:
        cmp     byte ptr [P_208C], 0
L_17FB6:
        jne     L_17FB9
        ret
L_17FB9:
        callf   CS0_SEG:L_04D90
L_17FBE:
        jae     L_17FB1
L_17FC0:
        call    L_17FC4
        ret
L_17FC4:
        mov     word ptr [W_1D5C], di
        mov     word ptr [P_1D5E], si
        mov     ax, word ptr [SEQ_START_TIME_LO]
        mov     dx, word ptr [SEQ_START_TIME_HI]
        sub     di, ax
        sbb     si, dx
L_17FD7:
        jb      br_17FE5
        mov     word ptr [W_1D60], di
        mov     word ptr [W_1D62], si
        mov     al, 0
        stc
        ret
br_17FE5:
        sub     ax, ax
        mov     word ptr [W_1D60], ax
        mov     word ptr [W_1D62], ax
        mov     al, 1
        stc
        ret
time_code_status_draw:
        BC_BARRIER
time_code_h_m_s_f_status_17FF4:
        BC_CLEAR_RECT 0, 0, 248, 9
time_code_h_m_s_f_status:
        BC_STATUS 0, 1, "        time code:   H  M  S  F"
status_time_code___h__m__s__f_18020:
        mov     si, mtc_rx_hour
        cmp     byte ptr [G_SYNC_IN_MODE], 2
        je      L_1802D
        mov     si, P_208F
L_1802D:
        lodsb
        if      FW_VERSION = 172
L_1802E:
        endif
        BC_UI_MENU 114, 1
        db      0ach
        if      FW_VERSION = 150
L_1802E:
        endif
L_18034:
        BC_UI_MENU 132, 1
        db      0ach
L_1803A:
        BC_UI_MENU 150, 1
        db      0ach
L_18040:
        if      FW_VERSION = 172
L_18046                         equ     $+6
        endif
        BC_UI_MENU 168, 1
        BC_FLUSH
        ret
L_18049:
        cmp     byte ptr [G_SYNC_IN_MODE], 2
L_1804E:
        je      L_18051
        ret
L_18051:
        cmp     byte ptr [B_1D93], 0
L_18056:
        jne     L_18067
        ret
L_18059:
        cmp     byte ptr [P_1A38], 0
L_1805E:
        jne     loop_18061
        ret
loop_18061:
        mov     bx, W_0E14
        jmp     midi_channel_setup
L_18067:
        cmp     byte ptr [B_1D89], 0
L_1806C:
        jne     L_18076
        cmp     byte ptr [P_1A38], 0
L_18073:
        je      L_18076
        ret
L_18076:
        mov     byte ptr [B_1D93], 0
        mov     byte ptr [B_1D89], 0
        mov     bx, W_0E10
L_18083:
        call    midi_channel_setup
        jmp     SHORT loop_18061
L_18088:
        cmp     byte ptr [G_SYNC_IN_MODE], 3
L_1808D:
        je      L_18090
        ret
L_18090:
        cmp     byte ptr [B_1D93], 0
L_18095:
        jne     L_180A6
        ret
L_18098:
        cmp     byte ptr [P_208C], 0
L_1809D:
        jne     L_180A0
        ret
L_180A0:
        mov     bx, W_0E14
        jmp     midi_channel_setup
L_180A6:
        cmp     byte ptr [B_1D89], 0
L_180AB:
        jne     L_18076
        cmp     byte ptr [P_208C], 0
L_180B2:
        je      L_18076
        ret
L_180B5:
        call    rec_note_is_unset
L_180B8:
        jae     L_180BB
        ret
L_180BB:
        cmp     word ptr [W_0E14], P_315C
L_180C1:
        je      L_180EC
        cmp     word ptr [W_0E14], calls_get_table_entry_05e9f
L_180C9:
        je      L_180EC
        cmp     word ptr [W_0E14], P_3233
L_180D1:
        je      L_180EC
        cmp     word ptr [W_0E14], P_6ECE
L_180D9:
        je      L_180EC
        cmp     word ptr [W_0E10], mode_05F30
L_180E1:
        je      L_180EC
        cmp     word ptr [W_0E10], P_6F30
L_180E9:
        je      L_180EC
        ret
L_180EC:
        call    L_1828B
L_180EF:
        call    L_1824A
L_180F2:
        call    L_18049
L_180F5:
        call    L_18088
L_180F8:
        mov     bl, byte ptr [SYNC_IN_RING_RD]
        cmp     bl, byte ptr [SYNC_IN_RING_WR]
L_18100:
        jne     L_18103
        ret
L_18103:
        mov     bh, 0
        mov     al, byte ptr [bx+TBL_SYNC_IN_RING]
        inc     bl
L_1810B:
        and     bl, 3fh
        mov     byte ptr [SYNC_IN_RING_RD], bl
        call    midi_sync_rt_dispatch
        jmp     SHORT L_180F8
midi_sync_rt_dispatch:
        cmp     al, 0fah
L_18119:
        je      br_18128
        cmp     al, 0fbh
L_1811D:
        je      L_18152
        cmp     al, 0fch
L_18121:
        je      L_18177
        cmp     al, 0f2h
L_18125:
        je      L_18191
        ret
br_18128:
        cmp     byte ptr [SEQ_RUNNING], 0
        je      br_18135
        mov     bx, W_0E10
L_18132:
        call    midi_channel_setup
br_18135:
        cmp     byte ptr [G_SONG_MODE], 0
        jne     br_18141
        callf   CS0_SEG:calls_check_and_call_01c45
br_18141:
        mov     bx, D_0E18
        if      FW_VERSION = 172
        mov     byte ptr [P_1D95], 0fah
        mov     word ptr [MIDI_CLOCK_WATCHDOG], 0ea60h
        else
        mov     byte ptr [P_1D95], 1
        mov     word ptr [MIDI_CLOCK_WATCHDOG], 3e8h
        endif
        jmp     midi_channel_setup
L_18152:
        cmp     byte ptr [SEQ_RUNNING], 0
L_18157:
        je      br_1815A
        ret
br_1815A:
        cmp     byte ptr [G_SONG_MODE], 0
        jne     br_18166
        callf   CS0_SEG:calls_check_and_call_01c45
br_18166:
        mov     bx, W_0E14
        if      FW_VERSION = 172
        mov     byte ptr [P_1D95], 0fbh
        mov     word ptr [MIDI_CLOCK_WATCHDOG], 0ea60h
        else
        mov     byte ptr [P_1D95], 1
        mov     word ptr [MIDI_CLOCK_WATCHDOG], 3e8h
        endif
        jmp     midi_channel_setup
L_18177:
        cmp     byte ptr [SEQ_RUNNING], 0
L_1817C:
        jne     L_1817F
        ret
L_1817F:
        mov     bx, W_0E10
        if      FW_VERSION = 172
        mov     byte ptr [P_1D95], 0fch
        else
        mov     byte ptr [P_1D95], 1
        endif
L_18187:
        call    midi_channel_setup
        if      FW_VERSION = 172
        mov     word ptr [MIDI_CLOCK_WATCHDOG], 0
        endif
        ret
L_18191:
        mov     al, byte ptr [bx+TBL_SYNC_IN_RING]
        inc     bl
L_18197:
        and     bl, 3fh
        mov     ah, byte ptr [bx+TBL_SYNC_IN_RING]
        inc     bl
L_181A0:
        and     bl, 3fh
        mov     byte ptr [SYNC_IN_RING_RD], bl
        shl     al, 1
        shr     ax, 1
        cmp     byte ptr [B_63C8], 0
        je      L_181B3
        ret
L_181B3:
        cmp     byte ptr [G_SONG_MODE], 0
L_181B8:
        jne     L_18214
        mov     bl, byte ptr [SEQ_RUNNING]
        push    bx
        push    ax
        callf   CS0_SEG:calls_check_and_call_01c45
        cmp     byte ptr [SEQ_RUNNING], 0
        je      L_181CF
L_181CC:
        call    sequencer_stop
L_181CF:
        pop     ax
        mov     dx, 18h
        mul     dx
        if      FW_VERSION = 172
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[20h], 0
        je      L_181F7
L_181E1:
        sub     ax, word ptr es:[26h]
        sbb     dx, word ptr es:[28h]
        jae     L_181E1
        add     ax, word ptr es:[26h]
        adc     dx, word ptr es:[28h]
        endif
L_181F7:
        call    seq_position_set_from_ticks
        cmp     byte ptr [G_SYNC_OUT_MODE], 1
        jne     br_18206
        nop
        push    cs
L_18203:
        call    sync_out_send_song_position
br_18206:
        pop     ax
        cmp     al, 0
        je      br_1820E
        call    rec_odub_keys_clear
br_1820E:
        mov     byte ptr [G_POS_REDRAW_REQ], 1
        ret
L_18214:
        cmp     byte ptr [SEQ_RUNNING], 0
L_18219:
        je      L_18244
        push    ax
        mov     bx, W_0E10
        if      FW_VERSION = 172
        mov     byte ptr [P_1D95], 0fbh
        else
        mov     byte ptr [P_1D95], 1
        endif
L_18224:
        call    midi_channel_setup
        mov     byte ptr [B_1A2A], 0fbh
        pop     ax
        callf   CS0_SEG:L_0620B
        mov     word ptr [MIDI_CLOCK_WATCHDOG], 3e8h
        mov     bx, W_0E14
        if      FW_VERSION = 172
        mov     byte ptr [P_1D95], 0fbh
        else
        mov     byte ptr [P_1D95], 1
        endif
L_18240:
        call    midi_channel_setup
        ret
L_18244:
        callf   CS0_SEG:L_0620B
        ret
L_1824A:
        mov     al, 0
        xchg    byte ptr [B_1A58], al
        cmp     word ptr [MIDI_CLOCK_WATCHDOG], 0
L_18255:
        je      L_18258
        ret
L_18258:
        mov     bx, W_0E10
        cmp     al, 1
L_1825D:
        jne     L_18261
        jmp     SHORT midi_channel_setup
        if      FW_VERSION = 150
br_1826A:
        endif
L_18261:
        mov     bx, D_0E18
        cmp     al, 2
L_18266:
        if      FW_VERSION = 172
        jne     br_1826A
        jmp     SHORT midi_channel_setup
br_1826A:
        mov     bx, W_0E14
        cmp     al, 3
        endif
        jne     L_18273
        jmp     SHORT midi_channel_setup
L_18273:
        if      FW_VERSION = 172
        cmp     al, 6
        else
        mov     bx, W_0E14
        cmp     al, 3
        jne     L_18275
        jmp     SHORT midi_channel_setup
        endif
L_18275:
        if      FW_VERSION = 150
        cmp     al, 6
        endif
        je      L_18278
        ret
L_18278:
        mov     bx, D_0E08
L_1827B:
        call    midi_channel_setup
        mov     bx, W_0E14
L_18281:
        call    midi_channel_setup
        ret
midi_channel_setup:
        callf   CS0_SEG:calls_setup_handler_00623
        ret
L_1828B:
        nop
        push    cs
L_1828D:
        call    mtc_full_frame_take
L_18290:
        jb      L_18293
        ret
L_18293:
        cmp     byte ptr [SEQ_RUNNING], 0
L_18298:
        je      L_1829B
        ret
L_1829B:
        cmp     word ptr [MIDI_CLOCK_WATCHDOG], 0
L_182A0:
        je      L_182A3
        ret
L_182A3:
        call    L_17FC4
L_182A6:
        call    rec_note_is_unset
L_182A9:
        jae     br_182AC
        ret
br_182AC:
        cmp     byte ptr [G_SONG_MODE], 0
        jne     br_182B8
        callf   CS0_SEG:calls_check_and_call_01c45
br_182B8:
        call    L_182FF
        mov     byte ptr [G_POS_REDRAW_REQ], 1
        mov     byte ptr [B_1D83], 1
        ret
seq_position_set_from_ticks_far:
        call    seq_position_set_from_ticks
        retf
seq_position_set_from_ticks:
        mov     si, P_D1D6
        sub     bp, bp
L_182CF:
        add     si, 2
        cmp     bp, word ptr [si]
L_182D4:
        je      br_182F6
        sub     ax, word ptr [si]
        sbb     dx, 0
        jae     L_182CF
        add     ax, word ptr [si]
        sub     si, P_D1D8
        shr     si, 1
        mov     cx, ax
        mov     ax, si
        cmp     byte ptr [G_SONG_MODE], 0
L_182EE:
        je      br_182F2
        jmp     SHORT L_182FA
br_182F2:
        call    seq_position_set
        ret
br_182F6:
        call    locate_to_end
        ret
L_182FA:
        push    cs
L_182FB:
        call    seq_set_position_far
        ret
L_182FF:
        if      FW_VERSION = 172
        sub     ax, ax
        mov     word ptr [W_1D2A], ax
        mov     word ptr [W_1D2C], ax
        mov     word ptr [SEQ_ABS_TICK_LO], ax
        mov     word ptr [SEQ_ABS_TICK_HI], ax
        else
        mov     word ptr [W_1D2A], 0
        mov     word ptr [W_1D2C], 0
        endif
        cmp     byte ptr [G_SONG_MODE], 0
L_18312:
        je      br_1832A
        callf   CS0_SEG:L_0634B
        mov     ax, word ptr [W_1D60]
        mov     dx, word ptr [W_1D62]
        sub     ax, word ptr [G_SONG_STEP_START_LO]
        sbb     dx, word ptr [G_SONG_STEP_START_HI]
        jmp     SHORT L_18373
br_1832A:
        mov     ax, word ptr [W_1D60]
        mov     dx, word ptr [W_1D62]
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[20h], 0
        je      L_18373
        sub     bx, bx
        sub     cx, cx

loop_18341:
        add     bx, word ptr es:[2ah]
        adc     cx, word ptr es:[TBL_002C]
        sub     ax, word ptr es:[2ah]
        sbb     dx, word ptr es:[TBL_002C]
        jae     loop_18341
        add     ax, word ptr es:[2ah]
        adc     dx, word ptr es:[TBL_002C]
        sub     bx, word ptr es:[2ah]
        sbb     cx, word ptr es:[TBL_002C]
        mov     word ptr [W_1D2A], bx
        mov     word ptr [W_1D2C], cx
L_18373:
        mov     cx, 3e8h
L_18376:
        call    mul32x16
        mov     bp, P_7DD8
        sub     di, di
        sub     si, si
L_18380:
        pusha
        mov     ax, word ptr [bp]
        mov     word ptr [SEQ_TEMPO_CHG_RATIO], ax
L_18387:
        call    seq_tempo_rate_update
        popa
        sub     ax, word ptr [bp+6]
        sbb     dx, word ptr [bp+8]
L_18391:
        jb      L_1839E
        add     di, word ptr [bp+2]
        adc     si, word ptr [bp+4]
        add     bp, 0ah
        jmp     SHORT L_18380
L_1839E:
        add     ax, word ptr [bp+6]
        adc     dx, word ptr [bp+8]
        push    di
        push    si
        mov     bx, ax
        mov     ax, dx
        mov     si, word ptr [bp+2]
        mov     di, word ptr [bp+4]
        push    bp
L_183B1:
        call    mul32x32_64
        pop     bx
        mov     di, word ptr [bx+6]
        mov     si, word ptr [bx+8]
        mov     bp, 0
        mov     ax, word ptr [G_MUL64_ACC_W3]
        mov     bx, word ptr [G_MUL64_ACC_W2]
        mov     cx, word ptr [G_MUL64_ACC_W1]
        mov     dx, word ptr [G_MUL64_ACC_W0]
L_183CD:
        call    div64_64
        pop     dx
        pop     ax
        add     ax, word ptr [G_DIV64_QUOT_W0]
        adc     dx, word ptr [G_DIV64_QUOT_W1]
        if      FW_VERSION = 172
        add     word ptr [SEQ_ABS_TICK_LO], ax
        adc     word ptr [SEQ_ABS_TICK_HI], dx
        endif
L_183E2:
        call    seq_position_set_from_ticks
        cmp     byte ptr [G_SONG_MODE], 0
        jne     br_183EF
L_183EC:
        call    seq_apply_current_bar_tsig
br_183EF:
        mov     ax, word ptr [SEQ_ELAPSED_MS_LO]
        mov     dx, word ptr [SEQ_ELAPSED_MS_HI]
        cmp     byte ptr [G_SONG_MODE], 0
        je      L_18405
        add     ax, word ptr [G_SONG_STEP_START_LO]
        adc     dx, word ptr [G_SONG_STEP_START_HI]
L_18405:
        sub     ax, word ptr [W_1D60]
        sbb     dx, word ptr [W_1D62]
        or      ax, dx
        je      br_1845E
L_18411:
        mov     byte ptr [G_SEQ_OUTPUT_MUTE], 1
        call    L_171B0
        mov     word ptr [SEQ_USEC_ACCUM], 0
        mov     ax, word ptr [SEQ_BAR_TICK]
        and     al, 3
        mov     byte ptr [B_1D81], al
        mov     ax, word ptr [W_1D2A]
        mov     dx, word ptr [W_1D2C]
        add     word ptr [SEQ_ELAPSED_MS_LO], ax
        adc     word ptr [SEQ_ELAPSED_MS_HI], dx
loop_18436:
        mov     ax, word ptr [SEQ_ELAPSED_MS_LO]
        mov     dx, word ptr [SEQ_ELAPSED_MS_HI]
        cmp     byte ptr [G_SONG_MODE], 0
        je      L_1844C
        add     ax, word ptr [G_SONG_STEP_START_LO]
        adc     dx, word ptr [G_SONG_STEP_START_HI]
L_1844C:
        sub     ax, word ptr [W_1D60]
        sbb     dx, word ptr [W_1D62]
        jae     br_1845E
        call    seq_timer_ms_tick
L_18459:
        call    midi_note_send
        jne     loop_18436
br_1845E:
        mov     byte ptr [G_SEQ_OUTPUT_MUTE], 0
        ret
mul32x32_64:
        sub     cx, cx
        sub     dx, dx
        mov     word ptr [G_MUL64_ACC_W0], cx
        mov     word ptr [G_MUL64_ACC_W1], cx
        mov     word ptr [G_MUL64_ACC_W2], cx
        mov     word ptr [G_MUL64_ACC_W3], cx
        shr     ax, 1
        rcr     bx, 1
        rcr     cx, 1
        mov     bp, 20h

loop_18481:
        shl     si, 1
        rcl     di, 1
        jae     br_1848A
        call    mul32x32_64_accum

br_1848A:
        shr     ax, 1
        rcr     bx, 1
        rcr     cx, 1
        rcr     dx, 1
        dec     bp
        jne     loop_18481
        ret
mul32x32_64_accum:
        add     word ptr [G_MUL64_ACC_W0], dx
        adc     word ptr [G_MUL64_ACC_W1], cx
        adc     word ptr [G_MUL64_ACC_W2], bx
        adc     word ptr [G_MUL64_ACC_W3], ax
        ret
div64_64:
        mov     word ptr [G_DIV64_DIVISOR_W3], 0
        mov     word ptr [G_DIV64_DIVISOR_W2], bp
        mov     word ptr [G_DIV64_DIVISOR_W1], si
        mov     word ptr [G_DIV64_DIVISOR_W0], di
        mov     bp, 1

loop_184BC:
        shl     word ptr [G_DIV64_DIVISOR_W0], 1
        rcl     word ptr [G_DIV64_DIVISOR_W1], 1
        rcl     word ptr [G_DIV64_DIVISOR_W2], 1
        rcl     word ptr [G_DIV64_DIVISOR_W3], 1
        jae     br_18528
        rcr     word ptr [G_DIV64_DIVISOR_W3], 1
        rcr     word ptr [G_DIV64_DIVISOR_W2], 1
        rcr     word ptr [G_DIV64_DIVISOR_W1], 1
        rcr     word ptr [G_DIV64_DIVISOR_W0], 1
        mov     word ptr [G_DIV64_QUOT_W3], 0
        mov     word ptr [G_DIV64_QUOT_W2], 0
        mov     word ptr [G_DIV64_QUOT_W1], 0
        mov     word ptr [G_DIV64_QUOT_W0], 0
L_184F6:
        push    ax
        push    bx
        push    cx
        push    dx
calls_pressing_1_9_key_will_loc_stat_184fa:
        call    pressing_1_9_key_will_loc_status_18545
L_184FD:
        jae     br_1853E
        pop     dx
        pop     cx
        pop     bx
        pop     ax
        clc

loop_18504:
        rcl     word ptr [G_DIV64_QUOT_W0], 1
        rcl     word ptr [G_DIV64_QUOT_W1], 1
        rcl     word ptr [G_DIV64_QUOT_W2], 1
        rcl     word ptr [G_DIV64_QUOT_W3], 1
        shr     word ptr [G_DIV64_DIVISOR_W3], 1
        rcr     word ptr [G_DIV64_DIVISOR_W2], 1
        rcr     word ptr [G_DIV64_DIVISOR_W1], 1
        rcr     word ptr [G_DIV64_DIVISOR_W0], 1
        dec     bp
        jne     L_184F6
L_18527:
        ret

br_18528:
        inc     bp
        cmp     bp, 40h
        jne     loop_184BC
        mov     word ptr [G_DIV64_QUOT_W3], ax
        mov     word ptr [G_DIV64_QUOT_W2], bx
        mov     word ptr [G_DIV64_QUOT_W1], cx
        mov     word ptr [G_DIV64_QUOT_W0], dx
        ret
br_1853E:
        pop     si
        pop     si
        pop     si
        pop     si
        stc
        jmp     loop_18504
pressing_1_9_key_will_loc_status_18545:
        sub     dx, word ptr [G_DIV64_DIVISOR_W0]
        sbb     cx, word ptr [G_DIV64_DIVISOR_W1]
        sbb     bx, word ptr [G_DIV64_DIVISOR_W2]
        sbb     ax, word ptr [G_DIV64_DIVISOR_W3]
        ret
locate_dialog_18556:
        DLG_LOCATE
status_3_185d5:
        mov     ax, word ptr [LOCATE_PT7]
        if      FW_VERSION = 172
        push    ax
        mov     bx, ax
        callf   CS0_SEG:calls_state_update_0ddd4
        mov     dl, al
        pop     ax
        endif
        mov     cx, word ptr [LOCATE_PT7_HI]
        if      FW_VERSION = 150
        mov     dl, byte ptr [SEQ_BEAT_TICKS]
        endif
L_185E7:
        BC_RANGE 32, 22
L_185EC:
        mov     ax, word ptr [D_0BEB]
        if      FW_VERSION = 172
L_185EF:
        push    ax
        mov     bx, ax
        callf   CS0_SEG:calls_state_update_0ddd4
        mov     dl, al
        pop     ax
        mov     cx, word ptr [P_0BED]
        else
        mov     cx, word ptr [P_0BED]
        mov     dl, byte ptr [SEQ_BEAT_TICKS]
        endif
L_185FE:
        BC_RANGE 32, 32
L_18603:
        mov     ax, word ptr [LOCATE_PT1]
        if      FW_VERSION = 172
        push    ax
        mov     bx, ax
        callf   CS0_SEG:calls_state_update_0ddd4
        mov     dl, al
        pop     ax
        endif
        mov     cx, word ptr [LOCATE_PT1_HI]
        if      FW_VERSION = 150
        mov     dl, byte ptr [SEQ_BEAT_TICKS]
        endif
L_18615:
        BC_RANGE 32, 42
L_1861A:
        mov     ax, word ptr [LOCATE_PT8]
        if      FW_VERSION = 172
        push    ax
        mov     bx, ax
        callf   CS0_SEG:calls_state_update_0ddd4
        mov     dl, al
        pop     ax
        endif
        mov     cx, word ptr [LOCATE_PT8_HI]
        if      FW_VERSION = 150
        mov     dl, byte ptr [SEQ_BEAT_TICKS]
        endif
L_1862C:
        BC_RANGE 104, 22
L_18631:
        if      FW_VERSION = 172
        mov     ax, word ptr [D_0BEF]
        push    ax
        mov     bx, ax
        callf   CS0_SEG:calls_state_update_0ddd4
        mov     dl, al
        pop     ax
        mov     cx, word ptr [D_0BF1]
        else
        db      0a1h
        out     dx, ax
        or      cx, word ptr [bp+di-0ef2h]
        or      cx, word ptr [bp+si+3c16h]
        db      1dh
        endif
L_18643:
        BC_RANGE 104, 32
L_18648:
        mov     ax, word ptr [D_0BE3]
        if      FW_VERSION = 172
        push    ax
        mov     bx, ax
        callf   CS0_SEG:calls_state_update_0ddd4
        mov     dl, al
        pop     ax
        endif
        mov     cx, word ptr [D_0BE5]
        if      FW_VERSION = 150
        mov     dl, byte ptr [SEQ_BEAT_TICKS]
L_18D09                         equ     $+3
        endif
L_1865A:
        BC_RANGE 104, 42
L_1865F:
        mov     ax, word ptr [D_0BFF]
        if      FW_VERSION = 172
        push    ax
        mov     bx, ax
        callf   CS0_SEG:calls_state_update_0ddd4
        mov     dl, al
        pop     ax
        endif
        mov     cx, word ptr [D_0C01]
        if      FW_VERSION = 150
        mov     dl, byte ptr [SEQ_BEAT_TICKS]
        endif
L_18671:
        BC_RANGE 176, 22
L_18676:
        mov     ax, word ptr [LOCATE_PT6]
        if      FW_VERSION = 172
        push    ax
        mov     bx, ax
        callf   CS0_SEG:calls_state_update_0ddd4
        mov     dl, al
        pop     ax
        endif
        mov     cx, word ptr [LOCATE_PT6_HI]
        if      FW_VERSION = 150
        mov     dl, byte ptr [SEQ_BEAT_TICKS]
        endif
L_18688:
        BC_RANGE 176, 32
L_1868D:
        mov     ax, word ptr [LOCATE_PT3]
        if      FW_VERSION = 172
        push    ax
        mov     bx, ax
        callf   CS0_SEG:calls_state_update_0ddd4
        mov     dl, al
        pop     ax
        endif
        mov     cx, word ptr [LOCATE_PT3_HI]
        if      FW_VERSION = 150
        mov     dl, byte ptr [SEQ_BEAT_TICKS]
        endif
L_1869F:
        BC_RANGE 176, 42
L_186A4:
        BC_SOFTKEY 4, BC_SK_FILL,  "CLOSE"
softkey_close_186af:
        BC_SOFTKEY 5, BC_SK_BOX,   "STORE"
softkey_store_186ba:
        ret
seq_position_reset:
        sub     ax, ax
        mov     word ptr [SEQ_CUR_BAR], ax
        mov     word ptr [SEQ_BAR_TICK], ax
        mov     word ptr [SEQ_CURSOR_BAR], ax
        mov     word ptr [SEQ_ELAPSED_MS_LO], ax
        mov     word ptr [SEQ_ELAPSED_MS_HI], ax
        mov     word ptr [SEQ_ABS_TICK_LO], ax
        mov     word ptr [SEQ_ABS_TICK_HI], ax
        mov     word ptr [W_1D32], ax
        mov     byte ptr [B_1D80], al
        mov     word ptr [SEQ_TEMPO_CHG_RATIO], 3e8h
        mov     byte ptr [G_NEXT_SEQ], 0ffh
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ax, word ptr es:[18h]
        mov     word ptr [SEQ_BAR_COUNT], ax
        mov     ax, es
        add     ax, 53h
        mov     word ptr [SEQ_EVENTS_SEG], ax
        mov     word ptr [FP_SEQ_READ_PTR], 0
        mov     word ptr [SEQ_READ_PTR_SEG], ax
        mov     es, ax
        sub     si, si
L_18703:
        call    scsi_operation
L_18706:
        call    L_18720
L_18709:
        call    seq_tempo_rate_update
        call    rec_state_reset
        ret
rec_note_is_unset:
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[TBL_0013], 0
        stc
        jne     br_1871E
        ret
br_1871E:
        clc
        ret
L_18720:
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[TBL_0013], 0
L_1872A:
        je      br_1876F
        les     si, [FP_SEQ_READ_PTR]
        cmp     byte ptr [P_2081], 0
        je      L_1873B
        les     si, [FP_SEQ_AFTER_GAP]
L_1873B:
        add     si, 6
L_1873E:
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
L_18743:
        je      br_1876F
        cmp     al, 0c1h
L_18747:
        je      L_1875F
        cmp     al, 0c0h
L_1874B:
        je      br_1876F
        add     si, 6
        cmp     si, 10h
        jb      L_1873E
        sub     si, 10h
        mov     ax, es
        inc     ax
        mov     es, ax
        jmp     SHORT L_1873E
L_1875F:
        mov     ax, word ptr es:[si+1]
        or      ax, ax
L_18765:
        jne     br_1876F
        mov     ax, word ptr es:[si+3]
        mov     word ptr [SEQ_TEMPO_CHG_RATIO], ax
        ret
br_1876F:
        mov     ax, 3e8h
        mov     word ptr [SEQ_TEMPO_CHG_RATIO], ax
        ret
seq_tempo_rate_update:
        pusha
        push    es
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ax, word ptr es:[TBL_0014]
        mov     bl, byte ptr es:[16h]
        cmp     byte ptr [G_TEMPO_SOURCE_SEQ], 0
        jne     br_1878F
        mov     ax, word ptr [G_MASTER_TEMPO]
br_1878F:
        cmp     bl, 0
        je      br_187B4
        cmp     byte ptr [G_SONG_MODE], 0
        je      br_187A2
        cmp     byte ptr [G_SONG_IGNORE_TEMPO], 0
        jne     br_187B4
br_187A2:
        mov     bx, word ptr [SEQ_TEMPO_CHG_RATIO]
        mul     bx
        mov     bx, 3e8h
        cmp     dx, bx
        jb      L_187B2
        mov     dx, 3e7h
L_187B2:
        div     bx
br_187B4:
        mov     di, ax
        sub     si, si
        mov     dx, 23c3h
        mov     ax, 4600h
        nop
        push    cs
        if      FW_VERSION = 172

        db      0e8h, 38h, 7dh
        else
        db      0e8h
        db      48h, 7fh
        endif
        mov     word ptr [SEQ_USEC_PER_QTR_LO], ax
        mov     word ptr [SEQ_USEC_PER_QTR_HI], dx
        mov     bx, 60h
        cmp     dx, bx
        jb      br_187D4
        mov     dx, 5fh

br_187D4:
        mov     cx, ax
        div     bx
        mov     word ptr [SEQ_USEC_PER_TICK], ax
        mov     dx, 60h
        mul     dx
        sub     cx, ax
        mov     word ptr [SEQ_USEC_TICK_REM], cx
        pop     es
        popa
        ret
midi_process:
        mov     al, byte ptr [SEQ_REC_ARMED]
        or      al, byte ptr [SEQ_ODUB_ARMED]
        and     al, byte ptr [G_REC_SYSEX_ACTIVE]
L_187F4:
        je      L_187F7
        ret
L_187F7:
        call    L_187FE
L_187FA:
        call    L_1892A
        ret
L_187FE:
        call    midi_note_send
L_18801:
        jne     L_1880E
        cmp     byte ptr [SEQ_RUNNING], 0
L_18808:
        je      L_1880D
        jmp     L_18908
L_1880D:
        ret
L_1880E:
        add     word ptr [SEQ_ABS_TICK_LO], 1
        adc     word ptr [SEQ_ABS_TICK_HI], 0
        mov     ax, word ptr [SEQ_BAR_LEN_TICKS]
        inc     word ptr [SEQ_BAR_TICK]
        cmp     ax, word ptr [SEQ_BAR_TICK]
L_18823:
        je      L_18826
        ret
L_18826:
        mov     word ptr [SEQ_BAR_TICK], 0
        inc     word ptr [SEQ_CUR_BAR]
L_18830:
        call    midi_note_send
L_18833:
        je      L_18836
        ret
L_18836:
        cmp     byte ptr [TC_IN_PROGRESS], 0
L_1883B:
        je      L_1883E
        ret
L_1883E:
        cmp     byte ptr [G_COPY_EVENTS_BUSY], 0
L_18843:
        je      L_18847
        jmp     br_188AD
L_18847:
        cmp     byte ptr [G_SONG_MODE], 0
L_1884C:
        je      rec_to_over_dub_autoconvert
        callf   CS0_SEG:song_advance_step_far
L_18853:
        jae     L_18858
        jmp     L_18908
L_18858:
        ret
rec_to_over_dub_autoconvert:
        cmp     byte ptr [SEQ_REC_ARMED], 0
        je      L_18876
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[20h], 0
        je      L_18876
        mov     byte ptr [SEQ_REC_ARMED], 0
        mov     byte ptr [SEQ_ODUB_ARMED], 1
L_18876:
        mov     al, byte ptr [SEQ_REC_ARMED]
        or      al, byte ptr [SEQ_ODUB_ARMED]
L_1887D:
        jne     L_18880
        ret
L_18880:
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[20h], 0
L_1888A:
        je      L_1888D
        ret
L_1888D:
        if      FW_VERSION = 172
        cmp     byte ptr [G_STEP_EDIT_ACTIVE], 0
L_18892:
        je      L_18895
        ret
        endif
L_18895:
        cmp     word ptr [SEQ_CUR_BAR], 3e7h
L_1889B:
        jne     L_1889E
        ret
L_1889E:
        call    L_19061
L_188A1:
        jae     seq_bars_extend_one
        ret
seq_bars_extend_one:
        cmp     word ptr [SEQ_CUR_BAR], 3e7h
L_188AA:
        jne     br_188AD
        ret
br_188AD:
        les     di, [FP_SEQ_GAP_WRITE]
        mov     ax, word ptr [SEQ_CUR_BAR]
        inc     ax
        mov     word ptr [SEQ_BAR_COUNT], ax
        push    es
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     word ptr es:[18h], ax
        les     si, [FP_SEQ_AFTER_GAP]
        mov     word ptr es:[si+1], ax
        pop     es
        dec     ax
        mov     byte ptr es:[di], 0c0h
        mov     word ptr es:[di+1], ax
        mov     bl, byte ptr ss:[SEQ_TSIG_NUM]
        mov     byte ptr es:[di+3], bl
        mov     bh, byte ptr ss:[SEQ_TSIG_DEN]
        mov     byte ptr es:[di+4], bh
        mov     byte ptr es:[di+5], 0
        add     di, 6
        jae     br_188F7
        sub     di, 10h
        mov     ax, es
        inc     ax
        mov     es, ax
br_188F7:
        mov     byte ptr es:[di], 0ffh
        mov     word ptr [FP_SEQ_GAP_WRITE], di
        mov     word ptr [SEQ_GAP_WRITE_SEG], es
        ret
seq_bars_extend_one_far:
        call    seq_bars_extend_one
        retf
L_18908:
        mov     byte ptr [UI_REDRAW_REQ], 1
        mov     byte ptr [G_POS_REDRAW_REQ], 1
        mov     word ptr [PTR_SEQ_TICK_STATE], P_7342
        mov     byte ptr [B_1D87], 1
        mov     byte ptr [B_1D84], 0
        mov     al, 0fch
        nop
        push    cs
L_18926:
        call    display_value
        ret
L_1892A:
        mov     al, byte ptr [G_SONG_MODE]
        or      al, byte ptr [G_STEP_EDIT_ACTIVE]
        or      al, byte ptr [TC_IN_PROGRESS]
L_18935:
        je      br_18938
        ret
br_18938:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ax, word ptr es:[1eh]
        inc     ax
        jne     L_18947
        mov     ax, word ptr es:[18h]
L_18947:
        cmp     ax, word ptr [SEQ_CUR_BAR]
tgt_1894B:
        jne     L_189B9
        cmp     byte ptr es:[20h], 0
        je      L_1897D
        mov     ax, word ptr es:[1ch]
        mov     word ptr [SEQ_CUR_BAR], ax
        mov     word ptr [W_63E0], ax
        sub     ax, ax
        mov     word ptr [SEQ_BAR_TICK], ax
        mov     word ptr [W_63E2], ax
        mov     al, 0
        xchg    byte ptr [SEQ_REC_ARMED], al
        or      byte ptr [SEQ_ODUB_ARMED], al
        test    byte ptr [SEQ_LOOP_JUMP_STATE], 1
        je      L_1897D
        or      byte ptr [SEQ_LOOP_JUMP_STATE], 4
L_1897D:
        mov     al, byte ptr [SEQ_REC_ARMED]
        or      al, byte ptr [SEQ_ODUB_ARMED]
        jne     br_189B8
        mov     al, byte ptr [G_NEXT_SEQ]
        cmp     al, 0ffh
        je      br_189B8
        cmp     al, byte ptr [SEL_SEQ]
        je      br_189B8
        push    ax
        nop
        push    cs
calls_far_wrapper_19743_18996:
        call    far_wrapper_19743
        pop     ax
        jb      br_189B8
        mov     byte ptr [SEL_SEQ], al
        mov     byte ptr [B_14CE], 1
        mov     word ptr [CUR_SEQ_SEG], es
L_189A8:
        call    seq_position_reset
L_189AB:
        call    seq_send_start_program_changes
        mov     byte ptr [UI_REDRAW_REQ], 1
        mov     byte ptr [G_NEXTSEQ_CHAINED], 1
br_189B8:
        ret
L_189B9:
        cmp     byte ptr [B_1D84], 0
        je      L_18A13
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[20h], 0
        je      L_18A13
        cmp     byte ptr [SEQ_LOOP_JUMP_STATE], 0
        jne     L_18A13
        mov     bx, word ptr [SEQ_BAR_TICK]
        add     bx, 4
        cmp     bx, word ptr [SEQ_BAR_LEN_TICKS]
        jb      L_18A13
        mov     bx, word ptr [SEQ_CUR_BAR]
        inc     bx
        cmp     ax, bx
calls_timer_check_189e7:
        jne     L_18A13
calls_timer_check_189e9:
        call    timer_check
        inc     word ptr [SEQ_BAR_TICK]
calls_timer_check_189f0:
        call    timer_check
calls_timer_check_189f3:
        call    rec_calc_quantized_pos
        inc     word ptr [SEQ_BAR_TICK]
calls_timer_check_189fa:
        call    timer_check
        inc     word ptr [SEQ_BAR_TICK]
calls_timer_check_18a01:
        call    timer_check
        sub     word ptr [SEQ_BAR_TICK], 3
        mov     byte ptr [SEQ_LOOP_JUMP_STATE], 1
        mov     byte ptr [G_POS_REDRAW_REQ], 0
L_18A13:
        ret
fn_18A14:
        mov     al, byte ptr [SEQ_LOOP_JUMP_STATE]
        test    al, 1
        jne     L_18A1C
        ret
L_18A1C:
        test    al, 2
L_18A1E:
        je      L_18A2B
        if      FW_VERSION = 172
        cmp     al, 7
L_18A22:
        je      L_18A25
        ret
L_18A25:
        mov     byte ptr [SEQ_LOOP_JUMP_STATE], 0
        endif
        ret
L_18A2B:
        call    fn_1A32D
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ax, word ptr es:[1ch]
        mov     word ptr [SEQ_LOOP_TO_BAR], ax
        cmp     byte ptr [P_2081], 0
L_18A3E:
        jne     L_18A43
        jmp     NEAR br_18AC2
L_18A43:
        cmp     byte ptr [G_NEXTSEQ_CHAINED], 0
L_18A48:
        je      br_18A4C
        jmp     SHORT br_18AC2

br_18A4C:
        push    ds
        les     di, [FP_SEQ_AFTER_GAP]
        lds     si, [FP_SEQ_GAP_WRITE]
        mov     bp, ds
        cmp     bp, word ptr ss:[SEQ_EVENTS_SEG]
        jne     br_18A62
        or      si, si
        je      br_18ABB
br_18A62:
        mov     bp, 0fh
        mov     bx, ds
        mov     dx, es
        mov     ax, 6
loop_18A6C:
        sub     si, ax
        jae     br_18A75
        and     si, bp
        dec     bx
        mov     ds, bx
br_18A75:
        sub     di, ax
        jae     L_18A7E
        and     di, bp
        dec     dx
        mov     es, dx
L_18A7E:
        mov     cx, 3
        rep movsw
        sub     si, 6
        sub     di, 6
        cmp     byte ptr es:[di], 0c0h
        jne     loop_18A6C
        mov     cx, word ptr es:[di+1]
        and     ch, 7
        cmp     word ptr ss:[SEQ_LOOP_TO_BAR], cx
        jb      loop_18A6C
L_18A9D:
        mov     word ptr ss:[FP_SEQ_AFTER_GAP], di
        mov     word ptr ss:[SEQ_AFTER_GAP_SEG], es
        mov     word ptr ss:[FP_SEQ_GAP_WRITE], si
        mov     word ptr ss:[SEQ_GAP_WRITE_SEG], ds
        mov     word ptr ss:[FP_1D1E], si
        mov     word ptr ss:[W_1D20], ds
br_18ABB:
        pop     ds
        or      byte ptr [SEQ_LOOP_JUMP_STATE], 2
        ret
br_18AC2:
        les     si, [FP_SEQ_READ_PTR]
        mov     bp, es
        cmp     bp, word ptr [SEQ_EVENTS_SEG]
        jne     br_18AD2
        or      si, si
        je      br_18AFC
br_18AD2:
        mov     bx, 0fh
        mov     ax, 6
loop_18AD8:
        sub     si, ax
        jae     br_18AE1
        and     si, bx
        dec     bp
        mov     es, bp
br_18AE1:
        cmp     byte ptr es:[si], 0c0h
        jne     loop_18AD8
        mov     cx, word ptr es:[si+1]
        and     ch, 7
        cmp     word ptr [SEQ_LOOP_TO_BAR], cx
        jb      loop_18AD8
        mov     word ptr [FP_SEQ_READ_PTR], si
        mov     word ptr [SEQ_READ_PTR_SEG], es
br_18AFC:
        or      byte ptr [SEQ_LOOP_JUMP_STATE], 2
        cmp     byte ptr [SEQ_LOOP_JUMP_STATE], 7
        jne     L_18B0D
        mov     byte ptr [SEQ_LOOP_JUMP_STATE], 0
L_18B0D:
        ret
timer_check:
        cmp     byte ptr [B_1D87], 0
L_18B13:
        je      L_18B16
        ret
L_18B16:
        cmp     byte ptr [SEQ_LOOP_JUMP_STATE], 0
        je      L_18B2A
        cmp     byte ptr [SEQ_LOOP_JUMP_STATE], 7
L_18B22:
        je      L_18B25
        ret
L_18B25:
        mov     byte ptr [SEQ_LOOP_JUMP_STATE], 0
L_18B2A:
        cmp     byte ptr [P_2081], 0
L_18B2F:
        je      br_18B74
        cmp     byte ptr [G_NEXTSEQ_CHAINED], 0
L_18B36:
        jne     br_18B74
L_18B38:
        les     si, [FP_SEQ_AFTER_GAP]
        mov     bp, es
L_18B3E:
        call    scsi_status_check
L_18B41:
        jb      br_18B5E
        cmp     bx, word ptr [SEQ_CUR_BAR]
L_18B47:
        jne     br_18B5E
        cmp     cx, word ptr [SEQ_BAR_TICK]
L_18B4D:
        ja      br_18B5E
L_18B4F:
        call    L_18B9C
L_18B52:
        jb      L_18B59
L_18B54:
        call    seq_gap_move_event_fwd
        jmp     SHORT L_18B38
L_18B59:
        call    calls_sequence_data_read_19255
        jmp     SHORT L_18B38
br_18B5E:
        mov     ax, word ptr [SEQ_BAR_TICK]
        cmp     ax, word ptr [W_63E2]
        jne     L_18B73
        les     si, [FP_SEQ_GAP_WRITE]
        mov     word ptr [FP_1D1E], si
        mov     word ptr [W_1D20], es
L_18B73:
        ret
br_18B74:
        les     si, [FP_SEQ_READ_PTR]
L_18B78:
        mov     bp, es
L_18B7A:
        call    scsi_status_check
L_18B7D:
        jb      br_18B93
        cmp     bx, word ptr [SEQ_CUR_BAR]
L_18B83:
        jne     br_18B93
        cmp     cx, word ptr [SEQ_BAR_TICK]
calls_sequence_data_read_18b89:
        ja      br_18B93
calls_sequence_data_read_18b8b:
        call    L_18B9C
calls_sequence_data_read_18b8e:
        call    sequence_data_read
        jmp     SHORT L_18B78
br_18B93:
        mov     word ptr [FP_SEQ_READ_PTR], si
        mov     word ptr [SEQ_READ_PTR_SEG], es
        ret
L_18B9C:
        cmp     byte ptr [TC_IN_PROGRESS], 0
L_18BA1:
        jne     L_18BA6
        jmp     NEAR L_18C4B
L_18BA6:
        call    position_in_edit_range
L_18BA9:
        jb      L_18BB7
        mov     al, byte ptr es:[si]
        cmp     al, 0c0h
        jne     br_18BB5
L_18BB2:
        call    scsi_operation
br_18BB5:
        clc
        ret
L_18BB7:
        mov     al, byte ptr es:[si]
        cmp     al, 40h
tgt_18BBC:
        jae     L_18C09
        cmp     al, byte ptr [G_REC_TRACK]
        jne     loop_18C07
        mov     al, byte ptr es:[si+4]
        and     al, 7fh
        cmp     al, byte ptr [TC_NOTE_LO]
        jb      loop_18C07
        cmp     byte ptr [TC_NOTE_HI], al
        jb      loop_18C07
        mov     ah, 5
        mul     ah
        add     ax, REC_HELD_NOTES
        mov     bx, ax
        mov     al, byte ptr es:[si+5]
        or      al, 80h
        mov     byte ptr [bx], al
        mov     al, byte ptr es:[si+3]
        mov     ah, byte ptr es:[si+2]
        and     ah, 0f8h
        mov     cl, byte ptr es:[si+4]
        shl     cl, 1
        rcr     ah, 1
        shr     ah, 2
        or      ax, ax
        jne     br_18C02
        inc     ax
br_18C02:
        mov     word ptr [bx+3], ax
        stc
        ret
loop_18C07:
        clc
        ret
L_18C09:
        mov     cl, al
        and     cl, 3fh
        mov     ah, byte ptr es:[si+3]
        and     ax, 0f0c0h
        cmp     ax, 8040h
L_18C18:
        jne     L_18C4B
        cmp     cl, byte ptr [G_REC_TRACK]
        jne     loop_18C07
        mov     al, byte ptr es:[si+4]
        and     al, 7fh
        cmp     al, byte ptr [TC_NOTE_LO]
        jb      loop_18C07
        cmp     byte ptr [TC_NOTE_HI], al
        jb      loop_18C07
        mov     ah, 5
        mul     ah
        add     ax, REC_HELD_NOTES
        mov     bx, ax
        mov     al, byte ptr es:[si+5]
        mov     ah, byte ptr es:[si+3]
        and     ah, 3
        mov     word ptr [bx+1], ax
        stc
        ret
L_18C4B:
        mov     al, byte ptr es:[si]
        cmp     al, 0c0h
        jne     L_18C7F
L_18C52:
        call    scsi_operation
        cmp     byte ptr [G_TC_NOTE_VALUE], 0
        je      br_18C6A
        cmp     byte ptr [G_SHIFT_TIMING_LATER], 0
        jne     br_18C6A
        cmp     byte ptr [G_SHIFT_TIMING_AMOUNT], 0
        jne     br_18C7D
br_18C6A:
        push    es
        push    si
        les     si, [FP_SEQ_GAP_WRITE]
        add     si, 6
        mov     word ptr [FP_1D1E], si
        mov     word ptr [W_1D20], es
        pop     si
        pop     es
br_18C7D:
        clc
        ret
L_18C7F:
        cmp     al, 0c1h
L_18C81:
        jne     L_18C8D
L_18C83:
        call    seq_apply_tempo_change_event
        mov     byte ptr [B_1D83], 1
        clc
        ret
L_18C8D:
        mov     bl, al
        and     bl, 3fh
        sub     bh, bh
        cmp     byte ptr [G_SONG_MODE], 0
L_18C99:
        jne     L_18CAA
        cmp     byte ptr [G_TRACK_SOLO], 0
L_18CA0:
        je      L_18CAA
        cmp     bl, byte ptr [SEL_TRACK]
L_18CA6:
        je      L_18CAA
        clc
        ret
L_18CAA:
        push    es
        mov     bp, cx
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ch, byte ptr es:[bx+TRK_CHANNEL]
        mov     cl, byte ptr es:[bx+TRK_VELOCITY]
        pop     es
        cmp     bl, byte ptr [G_REC_TRACK]
        jne     br_18CD2
        cmp     byte ptr [SEQ_REC_ARMED], 0
        je      br_18CD2
        cmp     byte ptr [G_PUNCH_ACTIVE], 0
L_18CCE:
        je      br_18CD2
        stc
        ret
br_18CD2:
        test    ch, 80h
        jne     L_18CD9
        clc
        ret
L_18CD9:
        and     al, 0c0h
        cmp     al, 0
L_18CDD:
        je      L_18CE2
        jmp     L_18EA3
L_18CE2:
        mov     dx, 40h
        xchg    byte ptr [G_LAST_NOTE_VAR_TYPE], dh
        xchg    byte ptr [G_LAST_NOTE_VAR_VALUE], dl
        call    fn_18FFD
L_18CF0:
        jae     br_18CF3
        ret
br_18CF3:
        cmp     byte ptr [G_STEP_EDIT_ACTIVE], 0
        je      L_18CFD
        jmp     NEAR L_18DA0
L_18CFD:
        cmp     bl, byte ptr [G_REC_TRACK]
L_18D01:
        je      br_18D06
        jmp     NEAR L_18DA0
br_18D06:
        cmp     byte ptr [SEQ_ODUB_ARMED], 0
        jne     L_18D10
        jmp     NEAR L_18DA0
L_18D10:
        cmp     bp, word ptr [W_63E2]
L_18D14:
        je      br_18D19
        jmp     NEAR L_18DA0
br_18D19:
        mov     al, byte ptr es:[si+4]
        and     al, 7fh
        cmp     al, byte ptr [G_NOTE_VAR_NOTE]
        jne     L_18D37
        cmp     byte ptr [NOTE_VAR_AFTER], 0
        je      L_18D37
        mov     dh, byte ptr [G_NOTE_VAR_TYPE]
        mov     dl, byte ptr [NOTE_VAR_VALUE]
        or      dh, 80h
L_18D37:
        mov     ah, 5
        mul     ah
        add     ax, REC_HELD_NOTES
        mov     bx, ax
        test    byte ptr [bx], 7fh
L_18D43:
        jne     br_18D8B
        push    cx
        mov     cl, byte ptr es:[si+5]
        or      cl, 80h
        mov     byte ptr [bx], cl
        mov     al, byte ptr es:[si+3]
        mov     ah, byte ptr es:[si+2]
        and     ah, 0f8h
        mov     cl, byte ptr es:[si+4]
        shl     cl, 1
        rcr     ah, 1
        shr     ah, 2
        pop     cx
        or      ax, ax
        jne     br_18D6B
        inc     ax
br_18D6B:
        mov     word ptr [bx+3], ax
        push    dx
        test    dh, 80h
        jne     br_18D76
        sub     dx, dx
br_18D76:
        mov     byte ptr [bx+1], dl
        mov     byte ptr [bx+2], dh
        pop     dx
        mov     bl, byte ptr es:[si]
        and     bx, 3fh
        and     dh, 7fh
        call    seq_note_trigger
        stc
        ret
br_18D8B:
        cmp     byte ptr [B_14CF], 0
        jne     br_18D9E
        mov     bl, byte ptr es:[si]
        and     bx, 3fh
        and     dh, 7fh
        call    seq_note_trigger
br_18D9E:
        stc
        ret
L_18DA0:
        mov     bl, byte ptr es:[si]
        and     bx, 3fh
        mov     al, byte ptr es:[si+4]
        and     al, 7fh
        test    dh, 80h
        jne     seq_note_trigger
        cmp     bl, byte ptr [G_REC_TRACK]
        jne     seq_note_trigger
        cmp     al, byte ptr [G_NOTE_VAR_NOTE]
        jne     seq_note_trigger
        cmp     byte ptr [SEQ_ODUB_ARMED], 0
        je      seq_note_trigger
        cmp     byte ptr [NOTE_VAR_AFTER], 0
        je      seq_note_trigger
        cmp     byte ptr [G_STEP_PLAY_ACTIVE], 0
        jne     seq_note_trigger
L_18DD2:
        call    L_19061
        jb      seq_note_trigger
        mov     dh, byte ptr [G_NOTE_VAR_TYPE]
        mov     dl, byte ptr [NOTE_VAR_VALUE]
        push    es
        les     di, [FP_SEQ_GAP_WRITE]
        or      dh, 80h
        or      bl, 40h
        mov     byte ptr es:[di], bl
        mov     bx, word ptr [SEQ_BAR_TICK]
        mov     word ptr es:[di+1], bx
        mov     byte ptr es:[di+3], dh
        mov     byte ptr es:[di+4], al
        mov     byte ptr es:[di+5], dl
        add     di, 6
        mov     word ptr [FP_SEQ_GAP_WRITE], di
        pop     es
seq_note_trigger:
        mov     al, byte ptr es:[si+5]
        and     al, 7fh
        mul     cl
        mov     cl, 64h
        div     cl
        cmp     al, 7fh
        jb      br_18E1B
        mov     al, 7fh
br_18E1B:
        cmp     al, 0
        jne     br_18E21
        mov     al, 1
br_18E21:
        mov     cl, al
        push    dx
        mov     al, byte ptr es:[si+4]
        mov     dh, byte ptr es:[si+2]
        shl     al, 1
        rcr     dh, 1
        shr     dh, 2
        shr     al, 1
        mov     dl, byte ptr es:[si+3]
        mov     bp, dx
        if      FW_VERSION = 172


        mov     dx, word ptr [SEQ_CUR_BAR]
        cmp     dx, word ptr [D_0C15]
        jb      br_18E71
        cmp     dx, word ptr [D_0C17]
        jae     br_18E71
        else
        pop     dx
        endif
        mov     bh, byte ptr [G_TRANSPOSE_TRACK]
        cmp     bh, 0
        je      br_18E5A
        dec     bh
        cmp     bl, bh
        jne     br_18E71
br_18E5A:
        test    ch, 40h
        jne     br_18E71
        add     al, byte ptr [G_TRANSPOSE_AMOUNT]
        sub     al, 0ch
        jb      L_18E6F
        cmp     al, 80h
        jb      br_18E71
        sub     al, 0ch
        jmp     br_18E71
L_18E6F:
        add     al, 0ch
br_18E71:
        if      FW_VERSION = 172
        pop     dx
        endif
        and     dh, 3
        mov     ah, 90h
        cmp     byte ptr [G_SEQ_OUTPUT_MUTE], 0
        jne     br_18E83
        nop
        push    cs
        call    midi_event_route
br_18E83:
        mov     di, NOTE_OFF_QUEUE
        mov     bx, word ptr [NOTE_OFF_Q_WR]
        or      bp, bp
        jne     br_18E8F
        inc     bp

br_18E8F:
        mov     word ptr [bx+di], bp
        inc     bx
        inc     bx
        mov     ah, ch
        mov     word ptr [bx+di], ax
        inc     bx
        inc     bx
        and     bx, 1ffh
        mov     word ptr [NOTE_OFF_Q_WR], bx
        clc
        ret
L_18EA3:
        cmp     al, 40h
L_18EA5:
        je      L_18EAA
        jmp     NEAR br_18FA1
L_18EAA:
        mov     ah, byte ptr es:[si+3]
        mov     dh, ah
        mov     al, byte ptr es:[si+4]
        mov     cl, byte ptr es:[si+5]
        and     ax, 0f07fh
        and     cl, 7fh
        cmp     ah, 80h
L_18EC1:
        je      L_18EC6
        jmp     NEAR L_18F6D
L_18EC6:
        call    fn_18FFD
L_18EC9:
        jae     br_18ECC
        ret
br_18ECC:
        mov     dh, byte ptr es:[si+3]
        mov     cl, byte ptr es:[si+5]
        cmp     byte ptr [G_STEP_EDIT_ACTIVE], 0
        jne     br_18F2C
        cmp     bl, byte ptr [G_REC_TRACK]
        jne     br_18F2C
        cmp     byte ptr [SEQ_ODUB_ARMED], 0
        je      br_18F2C
        cmp     bp, word ptr [W_63E2]
        jne     br_18F2C
        mov     al, byte ptr es:[si+4]
        and     al, 7fh
        push    ax
        mov     ah, 5
        mul     ah
        add     ax, REC_HELD_NOTES
        mov     bx, ax
        pop     ax
        test    byte ptr [bx], 7fh
        jne     br_18F2A
        cmp     al, byte ptr [G_NOTE_VAR_NOTE]
        jne     br_18F19
        cmp     byte ptr [NOTE_VAR_AFTER], 0
        je      br_18F19
        mov     dh, byte ptr [G_NOTE_VAR_TYPE]
        mov     cl, byte ptr [NOTE_VAR_VALUE]
br_18F19:
        or      dh, 80h
        mov     byte ptr [G_LAST_NOTE_VAR_TYPE], dh
        mov     byte ptr [G_LAST_NOTE_VAR_VALUE], cl
        mov     byte ptr [bx+1], cl
        mov     byte ptr [bx+2], dh
br_18F2A:
        stc
        ret
br_18F2C:
        cmp     al, byte ptr [G_NOTE_VAR_NOTE]
        jne     br_18F60
        cmp     byte ptr [NOTE_VAR_AFTER], 0
        je      br_18F60
        cmp     byte ptr [G_STEP_PLAY_ACTIVE], 0
        jne     br_18F60
        mov     dh, byte ptr [G_NOTE_VAR_TYPE]
        mov     cl, byte ptr [NOTE_VAR_VALUE]
        or      dh, 80h
        cmp     byte ptr [SEQ_ODUB_ARMED], 0
        je      br_18F60
        cmp     bl, byte ptr [G_REC_TRACK]
        jne     br_18F60
        mov     byte ptr es:[si+3], dh
        mov     byte ptr es:[si+5], cl
br_18F60:
        or      dh, 80h
        mov     byte ptr [G_LAST_NOTE_VAR_TYPE], dh
        mov     byte ptr [G_LAST_NOTE_VAR_VALUE], cl
        clc
        ret
L_18F6D:
        cmp     ah, 0b0h
L_18F70:
        jne     L_18F7E
        cmp     al, 40h
L_18F74:
        jne     br_18F93
        shl     bx, 1
        mov     word ptr [bx+TBL_SUSTAIN_STATE], cx
        jmp     SHORT br_18F93
L_18F7E:
        cmp     ah, 0c0h
L_18F81:
        jne     br_18F93
        push    es
        mov     es, word ptr [CUR_SEQ_SEG]
        test    byte ptr es:[bx+TRK_STATUS], 2
        pop     es
L_18F8F:
        jne     br_18F93
        clc
        ret
br_18F93:
        cmp     byte ptr [G_SEQ_OUTPUT_MUTE], 0
        jne     br_18F9F
        nop
        push    cs
        call    midi_event_route
br_18F9F:
        clc
        ret
br_18FA1:
        push    si
        push    es
        call    L_18FA9
        pop     es
        pop     si
        ret
L_18FA9:
        test    ch, 80h
        je      loop_18FDF
        add     si, 6
        test    ch, 40h
L_18FB4:

        if      FW_VERSION = 172
        je      L_18FE1
        else
        je      L_18FE1_V150
        endif
        mov     ax, word ptr es:[si+1]
        cmp     ax, 47h
L_18FBD:
        if      FW_VERSION = 172
        jne     L_18FE1
        else
        jne     L_18FE1_V150
        endif
        mov     ax, word ptr es:[si+3]
        cmp     ax, 4544h
L_18FC6:
        if      FW_VERSION = 172
        jne     L_18FE1
        else
        jne     L_18FE1_V150
        endif
        mov     ah, byte ptr es:[si+5]
        mov     al, byte ptr es:[si+6]
        mov     cl, byte ptr es:[si+7]
        mov     dl, 40h
        mov     dh, 0
        mov     ch, 0
        nop
        push    cs
L_18FDC:
        call    sound_event_enqueue_far
loop_18FDF:
        clc
        ret
        if      FW_VERSION = 150
L_18FE1_V150:
        test    ch, 20h
        je      loop_18FDF
        endif
L_18FE1:
        mov     al, byte ptr es:[si]
        cmp     al, 0c2h
        je      loop_18FDF
        nop
        push    cs
L_18FEA:
        call    L_15A3C
        cmp     al, 0f7h
L_18FEF:
        je      loop_18FDF
        inc     si
L_18FF2:
        jne     L_18FE1
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
        jmp     SHORT L_18FE1
fn_18FFD:
        cmp     bl, byte ptr [G_REC_TRACK]
        jne     br_19036
        cmp     byte ptr [G_TAP_HELD], 0
        je      br_19036
        cmp     byte ptr [SEQ_ODUB_ARMED], 0
        je      br_19036
        cmp     byte ptr [G_PUNCH_ACTIVE], 0

L_19016:
        je      br_19036
        mov     al, byte ptr es:[si+4]
        and     al, 7fh
        cmp     al, byte ptr [B_18FF]
        je      br_19038
        cmp     al, byte ptr [B_1901]
        je      br_19038
        cmp     al, byte ptr [B_1903]
        je      br_19038
        cmp     al, byte ptr [B_1905]
        je      br_19038
br_19036:
        clc
        ret
br_19038:
        stc
        ret

position_in_edit_range:
        mov     ax, word ptr [SEQ_CUR_BAR]
        mov     cx, word ptr [SEQ_BAR_TICK]
        cmp     ax, word ptr [G_RANGE_START_BAR]
        jb      br_1905F
        jne     br_1904F
        cmp     cx, word ptr [G_RANGE_START_TICK]
        jb      br_1905F
br_1904F:
        cmp     ax, word ptr [G_RANGE_END_BAR]
        ja      br_1905F
        jne     br_1905D
        cmp     cx, word ptr [G_RANGE_END_TICK]
        jae     br_1905F
br_1905D:
        stc
        ret
br_1905F:
        clc
        ret
L_19061:
        cmp     byte ptr [G_SEQ_MEM_FULL], 0
        stc
L_19067:
        je      br_1906A
        ret
br_1906A:
        push    ax
        mov     ax, word ptr [SEQ_AFTER_GAP_SEG]
        sub     ax, word ptr [SEQ_GAP_WRITE_SEG]
        cmp     ax, word ptr [G_SEQ_MEM_RESERVE]
        jae     br_1907D
        mov     byte ptr [G_SEQ_MEM_FULL], 1
br_1907D:
        pop     ax
        ret
L_1907F:
        les     si, [FP_SEQ_AFTER_GAP]
L_19083:
        call    scsi_status_check
L_19086:
        jb      br_190B8
        cmp     bx, word ptr [SEQ_CUR_BAR]
L_1908C:
        jne     br_190B8
        cmp     cx, word ptr [SEQ_BAR_TICK]
L_19092:
        ja      br_190B8
        cmp     al, 0c0h
L_19096:
        je      L_190B0
        cmp     al, 0c1h
        je      br_190B3
        cmp     byte ptr [G_REPLACE_MERGE], 0
        jne     br_190B3
        and     al, 3fh
        cmp     al, byte ptr [G_EDIT_TO_TRACK]
        jne     br_190B3
L_190AB:
        call    calls_sequence_data_read_19255
        jmp     SHORT L_1907F
L_190B0:
        call    scsi_operation
br_190B3:
        call    seq_gap_move_event_fwd
        jmp     SHORT L_1907F
br_190B8:
        ret
seq_gap_seek_forward:
        cmp     byte ptr [SEQ_LOOP_JUMP_STATE], 0
L_190BE:
        je      L_190C1
        ret
L_190C1:
        les     si, [FP_SEQ_AFTER_GAP]
L_190C5:
        call    scsi_status_check
        jb      br_190F4
        cmp     word ptr [SEQ_CUR_BAR], bx
        jb      br_190F4
        jne     L_190D8
        cmp     cx, word ptr [SEQ_BAR_TICK]
        jae     L_190ED
L_190D8:
        cmp     al, 0c0h
        push    ax
        jne     L_190E0
L_190DD:
        call    scsi_operation
L_190E0:
        pop     ax
        cmp     al, 0c1h
        jne     br_190E8
L_190E5:
        call    seq_apply_tempo_change_event
br_190E8:
        call    seq_gap_move_event_fwd
        jmp     SHORT L_190C1
L_190ED:
        cmp     al, 0c0h
        jne     br_190F4
L_190F1:
        call    scsi_operation
br_190F4:
        ret
scsi_status_check:
        mov     bx, word ptr [SEQ_CURSOR_BAR]
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
L_190FE:
        je      br_19118
        cmp     al, 0c0h
L_19102:
        jne     br_1910F
        mov     bx, word ptr es:[si+1]
        mov     word ptr [SEQ_CURSOR_BAR], bx
        sub     cx, cx
        ret
br_1910F:
        mov     cx, word ptr es:[si+1]
        and     ch, 7
        clc
        ret
br_19118:
        sub     cx, cx
        stc
        ret
seq_gap_move_event_fwd:
        mov     bx, ds
        les     di, [FP_SEQ_GAP_WRITE]
        lds     si, ss:[FP_SEQ_AFTER_GAP]
        call    seq_event_copy_unless_deleted
        mov     dx, ds
        mov     ds, bx
        mov     word ptr [FP_SEQ_AFTER_GAP], si
        mov     word ptr [SEQ_AFTER_GAP_SEG], dx
        mov     word ptr [FP_SEQ_GAP_WRITE], di
        mov     word ptr [SEQ_GAP_WRITE_SEG], es
        mov     byte ptr es:[di], 0ffh
        ret
seq_event_copy_unless_deleted:
        test    byte ptr [si+5], 80h
L_19147:
        jne     L_1917A
        mov     al, byte ptr [si]
        and     al, 0c0h
        cmp     al, 80h
L_1914F:
        jne     seq_event_record_copy
loop_19151:
        call    seq_event_record_copy
        mov     al, byte ptr [si]
        cmp     al, 0c2h
        jne     loop_19151
seq_event_record_copy:
        mov     cx, 3
        rep movsw
        cmp     si, 10h
        jb      br_1916C
        sub     si, 10h
        mov     bp, ds
        inc     bp
        mov     ds, bp
br_1916C:
        cmp     di, 10h
        jb      L_19179
        sub     di, 10h
        mov     dx, es
        inc     dx
        mov     es, dx
L_19179:
        ret
L_1917A:
        mov     al, byte ptr [si]
        and     al, 0c0h
        cmp     al, 80h
L_19180:
        jne     seq_event_record_skip
loop_19182:
        call    seq_event_record_skip
        mov     al, byte ptr [si]
        cmp     al, 0c2h
        jne     loop_19182
seq_event_record_skip:
        add     si, 6
        cmp     si, 10h
        jb      L_1919B
        sub     si, 10h
        mov     bp, ds
        inc     bp
        mov     ds, bp
L_1919B:
        ret
seq_gap_copy_event_from_src:
        mov     bx, ds
        les     di, [FP_SEQ_GAP_WRITE]
        lds     si, ss:[FP_SEQ_READ_PTR]
        call    seq_event_copy_unless_deleted
        mov     dx, ds
        mov     ds, bx
        mov     word ptr [FP_SEQ_READ_PTR], si
        mov     word ptr [SEQ_READ_PTR_SEG], dx
        mov     word ptr [FP_SEQ_GAP_WRITE], di
        mov     word ptr [SEQ_GAP_WRITE_SEG], es
        mov     byte ptr es:[di], 0ffh
        ret
seq_set_position_far:
        mov     word ptr [SEQ_CUR_BAR], ax
        mov     word ptr [SEQ_BAR_TICK], cx
        mov     word ptr [SEQ_CURSOR_BAR], ax
L_191CD:
        call    rec_note_is_unset
L_191D0:
        jne     L_191D3
        retf
L_191D3:
        mov     bp, ax
        mov     es, word ptr [SEQ_EVENTS_SEG]
        sub     si, si
        call    L_191EE
        mov     ax, word ptr [G_TSIG_BAR_TICKS]
        mov     word ptr [SEQ_BAR_LEN_TICKS], ax
L_191E4:
        call    seq_pos_recalc_bar_beat
        retf
seq_events_seek_bar_tick:
        mov     bp, ax
        les     si, [FP_SEQ_READ_PTR]
L_191EE:
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
L_191F3:
        je      L_198A9
        cmp     al, 0c0h
L_191F7:
        jne     calls_sequence_data_read_19228
        cmp     bp, word ptr es:[si+1]
L_191FD:
        jne     calls_sequence_data_read_19228
L_191FF:
        call    event_tsig_bar_ticks
        or      cx, cx
calls_sequence_data_read_19204:
        je      L_198A9
        push    cx
calls_sequence_data_read_19207:
        call    sequence_data_read
        pop     cx
L_1920B:
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
L_19210:
        je      L_198A9
        cmp     al, 0c0h
L_19214:
        je      L_198A9
        mov     ax, word ptr es:[si+1]
        and     ah, 7
        cmp     ax, cx
calls_sequence_data_read_1921f:
        jae     L_198A9
        push    cx
calls_sequence_data_read_19222:
        call    sequence_data_read
        pop     cx
        jmp     SHORT L_1920B
calls_sequence_data_read_19228:
        push    cx
calls_sequence_data_read_19229:
        call    sequence_data_read
        pop     cx
        jmp     SHORT L_191EE
L_198A9:
        mov     word ptr [FP_SEQ_READ_PTR], si
        mov     word ptr [SEQ_READ_PTR_SEG], es
        ret
event_tsig_bar_ticks:
        mov     bx, word ptr es:[si+3]
        cmp     bh, 4
        jae     br_19243
        mov     bh, 4
br_19243:
        cmp     bl, 0
        jne     br_1924A
        mov     bl, 4
br_1924A:
        mov     ax, 180h
        div     bh
        mul     bl
        mov     word ptr [G_TSIG_BAR_TICKS], ax
        ret
calls_sequence_data_read_19255:
        les     si, [FP_SEQ_AFTER_GAP]
calls_sequence_data_read_19259:
        call    sequence_data_read
        mov     word ptr [FP_SEQ_AFTER_GAP], si
        mov     word ptr [SEQ_AFTER_GAP_SEG], es
        ret
seq_build_timing_map:
        call    rec_note_is_unset
L_19268:
        jae     br_1926B
        ret
br_1926B:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ax, word ptr es:[18h]
        mov     word ptr [SEQ_BAR_COUNT], ax
        callf   CS0_SEG:calls_timer_handler_02363
        les     si, [FP_SEQ_READ_PTR]
        cmp     byte ptr [P_2081], 0
        je      br_1928A
        les     si, [FP_SEQ_AFTER_GAP]
br_1928A:
        mov     di, P_D1D8
        mov     bp, P_7DD8
        mov     cx, P_D9A8
        sub     ax, ax
        mov     word ptr [W_1D54], ax
        mov     word ptr [W_1D56], ax
        mov     word ptr [W_1D58], ax
        mov     word ptr [W_1D5A], ax
        mov     word ptr [SEQ_TOTAL_TIME_LO], ax
        mov     word ptr [SEQ_TOTAL_TIME_HI], ax
        mov     word ptr [SEQ_TOTAL_TICKS_LO], ax
        mov     word ptr [SEQ_TOTAL_TICKS_HI], ax
        mov     word ptr [bp], 3e8h
loop_192B2:
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
        jne     L_192BC
        jmp     NEAR L_19351
L_192BC:
        cmp     al, 0c0h
        jne     L_1932A
        mov     ax, word ptr es:[si+1]
        cmp     ax, word ptr [SEQ_BAR_COUNT]
L_192C8:
        jne     br_192CD
        jmp     NEAR L_19351
br_192CD:
        mov     bx, word ptr es:[si+3]
        cmp     bh, 4
        jae     br_192D8
        mov     bh, 4
br_192D8:
        cmp     bl, 0
        jne     L_192DF
        mov     bl, 4
L_192DF:
        mov     ax, 180h
        div     bh
        mul     bl
        mov     word ptr [di], ax
        add     word ptr [SEQ_TOTAL_TICKS_LO], ax
        adc     word ptr [SEQ_TOTAL_TICKS_HI], 0
        add     word ptr [W_1D54], ax
        adc     word ptr [W_1D56], 0
        mov     al, bl
L_192FC:
        cmp     bh, 4
        je      br_19311
        or      al, 40h
        cmp     bh, 8
        je      br_19311
        add     al, 40h
        cmp     bh, 10h
        je      br_19311
        add     al, 40h
br_19311:
        mov     bx, cx
        mov     byte ptr [bx], al
        inc     cx
        add     di, 2
        sub     ax, ax
        xchg    word ptr [W_1D58], ax
        sub     word ptr [W_1D54], ax
        sbb     word ptr [W_1D56], 0
        jmp     SHORT calls_sequence_data_read_19349
L_1932A:
        cmp     al, 0c1h
        jne     calls_sequence_data_read_19349
        cmp     bp, P_9DB8
        jae     calls_sequence_data_read_19349
        mov     ax, word ptr es:[si+3]
        mov     word ptr [bp+0ah], ax
L_1933B:
        call    L_193BA
        mov     ax, word ptr [di-2]
        mov     word ptr [W_1D54], ax
        sub     ax, ax
        mov     word ptr [W_1D56], ax
calls_sequence_data_read_19349:
        push    cx
calls_sequence_data_read_1934a:
        call    sequence_data_read
        pop     cx
L_1934E:
        jmp     NEAR loop_192B2
L_19351:
        sub     ax, ax
        mov     word ptr [di], ax
        mov     ax, word ptr [W_1D54]
        mov     dx, word ptr [W_1D56]
        mov     word ptr [bp+2], ax
        mov     word ptr [bp+4], dx
        push    bp
        mov     di, word ptr [bp]
L_19366:
        call    L_17D3C
        pop     bp
        mov     word ptr [bp+6], ax
        mov     word ptr [bp+8], dx
        add     ax, word ptr [SEQ_TOTAL_TIME_LO]
        adc     dx, word ptr [SEQ_TOTAL_TIME_HI]
        mov     di, 3e8h
        mov     si, 0
        push    bp
        nop
        push    cs
        if      FW_VERSION = 172
        db      0e8h, 77h, 71h
        else
        db      0e8h
        db      0a4h, 73h
        endif
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     word ptr es:[2ah], ax
        mov     word ptr es:[TBL_002C], dx
        mov     ax, word ptr [SEQ_TOTAL_TICKS_LO]
        mov     dx, word ptr [SEQ_TOTAL_TICKS_HI]
        mov     word ptr es:[26h], ax
        mov     word ptr es:[28h], dx
        pop     bp
        add     bp, 0ah
        mov     word ptr [bp], 3e8h
        sub     ax, ax
        mov     word ptr [bp+6], ax
        mov     word ptr [bp+8], ax
        dec     ax
        mov     word ptr [bp+2], ax
        mov     word ptr [bp+4], ax
        ret
L_193BA:
        mov     ax, word ptr [W_1D54]
        mov     dx, word ptr [W_1D56]
        sub     ax, word ptr [di-2]
        sbb     dx, 0
        mov     bx, word ptr es:[si+1]
        add     ax, bx
L_193CD:
        adc     dx, 0
        xchg    word ptr [W_1D58], bx
        sub     ax, bx
L_193D6:
        sbb     dx, 0
        mov     word ptr [bp+2], ax
        mov     word ptr [bp+4], dx
        push    bp
        push    si
        push    di
        push    cx
        push    es
        mov     di, word ptr [bp]
L_193E7:
        call    L_17D3C
        pop     es
        pop     cx
L_193EC:
        pop     di
        pop     si
        pop     bp
        mov     word ptr [bp+6], ax
        mov     word ptr [bp+8], dx
        add     word ptr [SEQ_TOTAL_TIME_LO], ax
        adc     word ptr [SEQ_TOTAL_TIME_HI], dx
        add     bp, 0ah
        ret
scsi_operation:
        mov     bx, word ptr es:[si+3]
seq_tsig_apply:
        cmp     bh, 4
        jae     br_1940C
        mov     bh, 4
br_1940C:
        cmp     bh, 21h
        jb      br_19413
        mov     bh, 4
br_19413:
        cmp     bl, 0
        jne     br_1941A
        mov     bl, 4
br_1941A:
        cmp     bl, 21h
        jb      br_19421
        mov     bl, 4
br_19421:
        mov     byte ptr [SEQ_TSIG_DEN], bh
        mov     byte ptr [SEQ_TSIG_NUM], bl
        mov     ax, 180h
        div     bh
        mov     byte ptr [SEQ_BEAT_TICKS], al
        mul     bl
        mov     word ptr [SEQ_BAR_LEN_TICKS], ax
        ret

seq_apply_tempo_change_event:
        mov     ax, word ptr es:[si+3]
        mov     word ptr [SEQ_TEMPO_CHG_RATIO], ax
L_1943E:
        call    seq_tempo_rate_update
        ret
seq_pos_dec_tick:
        mov     bx, word ptr [SEQ_CUR_BAR]
        mov     cx, word ptr [SEQ_BAR_TICK]
        mov     ax, bx
L_1944C:
        or      ax, cx
        je      L_19AEF
        sub     word ptr [SEQ_ABS_TICK_LO], 1
        sbb     word ptr [SEQ_ABS_TICK_HI], 0
        sub     cx, 1
        jae     L_1946D
        dec     bx
        shl     bx, 1
        mov     cx, word ptr [bx+P_D1D8]
        mov     word ptr [SEQ_BAR_LEN_TICKS], cx
        dec     cx
        shr     bx, 1
L_1946D:
        mov     word ptr [SEQ_CUR_BAR], bx
        mov     word ptr [SEQ_BAR_TICK], cx
L_19AEF:
        ret
L_19476:
        call    seq_gap_move_event_back
L_19479:
        jae     L_1947E
        jmp     NEAR seq_gap_seek_forward
L_1947E:
        les     si, [FP_SEQ_AFTER_GAP]
L_19482:
        call    scsi_status_check
        cmp     bx, word ptr [SEQ_CUR_BAR]
L_19489:
        jae     L_1948E
        jmp     NEAR seq_gap_seek_forward
L_1948E:
        jne     L_19476
        cmp     cx, word ptr [SEQ_BAR_TICK]
L_19494:
        jae     L_19476
        jmp     NEAR seq_gap_seek_forward
seq_gap_move_event_back:
        mov     bx, ds
        les     di, [FP_SEQ_AFTER_GAP]
        lds     si, [FP_SEQ_GAP_WRITE]
        or      si, si
L_194A5:
        jne     br_194B4
        mov     bp, ds
        cmp     bp, word ptr ss:[SEQ_EVENTS_SEG]
L_194AE:
        jne     br_194B4
        mov     ds, bx
        stc
        ret
br_194B4:
        mov     al, byte ptr es:[di]
        cmp     al, 0c0h
        jne     br_194C4
        mov     ax, word ptr es:[di+1]
        dec     ax
        mov     word ptr ss:[SEQ_CURSOR_BAR], ax
br_194C4:
        call    seq_gap_ptrs_step_back
        mov     al, byte ptr es:[di]
        cmp     al, 0c2h
        jne     br_194DA
L_194CE:
        call    seq_gap_ptrs_step_back
        mov     al, byte ptr es:[di]
        and     al, 0c0h
        cmp     al, 80h
L_194D8:
        jne     L_194CE
br_194DA:
        mov     dx, ds
        mov     ds, bx
        mov     word ptr [FP_SEQ_AFTER_GAP], di
        mov     word ptr [SEQ_AFTER_GAP_SEG], es
        mov     word ptr [FP_SEQ_GAP_WRITE], si
        mov     word ptr [SEQ_GAP_WRITE_SEG], dx
        clc
        ret

seq_gap_ptrs_step_back:
        sub     si, 6
        jae     br_194FD
        mov     bp, ds
        dec     bp
        mov     ds, bp
        and     si, 0fh
br_194FD:
        sub     di, 6
        jae     br_1950A
        mov     dx, es
        dec     dx
        mov     es, dx
        and     di, 0fh

br_1950A:
        push    di
        push    si
        mov     cx, 3
        rep movsw
        pop     si
        pop     di
        ret
seq_apply_current_bar_tsig:
        les     si, [FP_SEQ_AFTER_GAP]
        cmp     byte ptr es:[si], 0c0h
        jne     L_19525
        cmp     word ptr [SEQ_BAR_TICK], 0
        je      L_19543
L_19525:
        les     si, [FP_SEQ_GAP_WRITE]
L_19529:
        mov     bp, es
        cmp     bp, word ptr [SEQ_EVENTS_SEG]
L_1952F:
        jne     br_19536
        or      si, si
L_19533:
        jne     br_19536
        ret
br_19536:
        sub     si, 6
        jae     L_19543
        and     si, 0fh
        mov     ax, es
        dec     ax
        mov     es, ax
L_19543:
        cmp     byte ptr es:[si], 0c0h
        jne     L_19529
L_19549:
        call    scsi_operation
        ret
metronome_rate_update:
        mov     bl, byte ptr [G_METRO_RATE]
        sub     bh, bh
        mov     al, byte ptr [bx+TBL_METRO_RATE_TICKS]
        mov     byte ptr [METRO_INTERVAL_TICKS], al
        ret
metronome_click_check:
        cmp     byte ptr [G_SEQ_OUTPUT_MUTE], 0
L_19560:
        je      L_19563
        ret
L_19563:
        cmp     byte ptr [G_COUNT_ENABLE], 0
L_19568:
        jne     L_1956B
        ret
L_1956B:
        mov     al, byte ptr [SEQ_REC_ARMED]
        or      al, byte ptr [SEQ_ODUB_ARMED]
L_19572:
        jne     L_1957C
        cmp     byte ptr [G_METRO_IN_PLAY], 0
L_19579:
        jne     L_19584
        ret
L_1957C:
        cmp     byte ptr [G_METRO_IN_REC], 0
L_19581:
        jne     L_19584
        ret
L_19584:
        mov     ax, word ptr [SEQ_BAR_TICK]
        or      ax, ax
L_19589:
        je      metronome_set_accent_click
        mov     bl, byte ptr [METRO_INTERVAL_TICKS]
        div     bl
        cmp     ah, 0
L_19594:
        je      metronome_set_normal_click
        ret
metronome_set_accent_click:
        mov     byte ptr [METRO_CLICK_VEL], 7fh
        ret
metronome_set_normal_click:
        mov     byte ptr [METRO_CLICK_VEL], 20h
        ret
fn_195A3:
        cmp     byte ptr [G_STEP_NOTES_HELD], 0
        je      L_195BB
        mov     ax, word ptr [SEQ_NOW_TICK]
        sub     dx, dx
        sub     bh, bh
        mov     bl, byte ptr [METRO_INTERVAL_TICKS]
        div     bx
        or      dx, dx
L_195B9:
        je      metronome_set_normal_click
L_195BB:
        ret
note_off_queue_tick4:
        mov     dx, 4
        jmp     SHORT br_195C4
note_off_queue_tick:
        mov     dx, 1
br_195C4:
        mov     si, word ptr [NOTE_OFF_Q_RD]
        mov     di, word ptr [NOTE_OFF_Q_WR]
        cmp     si, di
        je      L_1963D
        mov     bp, di
        mov     bx, NOTE_OFF_QUEUE
L_195D5:
        and     si, 1ffh
        and     di, 1ffh
        cmp     si, bp
L_195DF:
        je      br_19635
        mov     ax, word ptr [bx+si]
        cmp     byte ptr [G_STEP_PLAY_ACTIVE], 0
        jne     L_19605
        cmp     byte ptr [G_STEP_EDIT_ACTIVE], 0
L_195EF:
        je      br_195FB
        cmp     ax, 0c0h
        jb      L_19605
        mov     ax, 0c0h
        jmp     SHORT L_19605
br_195FB:
        cmp     byte ptr [B_1D84], 0
        jne     L_19605
        mov     ax, 1
L_19605:
        sub     ax, dx
        jae     br_1960B
L_19609:
        sub     ax, ax
br_1960B:
        pushf
        mov     word ptr [bx+di], ax
        inc     si
        inc     si
        inc     di
        inc     di
        mov     ax, word ptr [bx+si]
        mov     word ptr [bx+di], ax
        inc     si
        inc     si
        inc     di
        inc     di
        popf
        jne     L_195D5
        sub     di, 4
        push    dx
        push    bx
        mov     cl, 0
        mov     ch, ah
        mov     ah, 90h
        mov     dl, 40h
        mov     dh, 0
        nop
        push    cs
        call    midi_event_route
        pop     bx
        pop     dx
L_19633:
        jmp     SHORT L_195D5
br_19635:
        mov     word ptr [NOTE_OFF_Q_RD], si
        mov     word ptr [NOTE_OFF_Q_WR], di
L_1963D:
        ret
        if      FW_VERSION = 172
note_off_queue_expire_all:
        cli
        mov     si, word ptr [NOTE_OFF_Q_RD]
L_19643:
        cmp     si, word ptr [NOTE_OFF_Q_WR]
L_19647:
        je      L_19658
        mov     word ptr [si+NOTE_OFF_QUEUE], 1
        add     si, 4
        and     si, 1ffh
        jmp     L_19643
L_19658:
        sti
L_19659:
        retf
        endif
L_1965A:
        call    mem_copy_paragraphs
        retf
arena_first_seq_far:
        call    arena_seek_after_programs
        retf
arena_record_seek_far:
        call    arena_record_seek
        retf
arena_init_far:
        call    arena_init_programs
        retf
seq_delete_all_far:
        call    seq_delete_all
        retf
seq_create_new_far:
        call    seq_create_new
        retf
seq_find_free_slot_far:
        call    seq_find_free_slot
        retf
arena_find_end_far:
        call    arena_find_end
        retf
seq_events_terminate_far:
        call    seq_events_terminate
        retf
seq_copy_far:
        call    seq_copy
        retf
seq_delete_far:
        call    seq_delete
        retf
seq_edit_begin_far:
        call    seq_edit_begin
        retf
seq_edit_end_far:
        call    seq_edit_end
        retf
far_wrapper_19743:
        call    scsi_list_op
        retf
undo_seq_save_far:
        call    undo_seq_save
        retf
undo_seq_swap_far:
        call    undo_seq_swap
        retf
undo_seq_flag_latch_far:
        call    undo_seq_flag_latch
        retf
arena_free_paras_far:
        call    arena_free_paras
        retf
undo_seq_discard_far:
        call    undo_seq_discard
        retf
seq_undo_checkpoint_far:
        call    seq_undo_checkpoint
        retf
seq_copy_params_far:
        call    seq_copy_params
        retf
arena_init_programs:
        mov     ax, PROGRAM_ARENA_SEG
        mov     es, ax
        sub     di, di
        mov     bl, 0
L_196B7:
        mov     si, EMPTY_PGM_RECORD
        mov     cx, 10h
        rep movsw
        inc     bl
L_196C1:
        cmp     bl, 18h
        jne     L_196B7
        sub     ax, ax
        mov     word ptr es:[di], ax
        mov     di, 532h
        mov     si, STR_UNUSED_PRG_FILENAME
        mov     ax, ds
        mov     es, ax
        mov     cx, 10h
        rep movsb
        mov     byte ptr [B_0548], 0
        ret
seq_delete_all:
        call    arena_seek_after_programs
        sub     bx, bx
        mov     word ptr es:[bx], bx
        ret
arena_seek_after_programs:
        mov     al, 18h
L_196EB:
        call    arena_record_seek
        ret
seq_find_free_slot:
        mov     al, 0
loop_196F1:
        push    ax
        call    scsi_list_op
        pop     ax
        jae     br_196F9
        ret
br_196F9:
        inc     al
        cmp     al, 63h
        jne     loop_196F1
        mov     al, 62h
        clc
        ret
arena_find_end:
        pusha
L_19704:
        call    arena_seek_after_programs
L_19707:
        mov     cx, word ptr es:[0]
        or      cx, cx
L_1970E:
        je      br_19718
        mov     bx, es
L_19712:
        add     bx, cx
        mov     es, bx
L_19716:
        jmp     SHORT L_19707
br_19718:
        popa
        ret
seq_events_terminate:
        mov     al, 0ffh
        stosb
        mov     al, 0
L_1971F:
        stosb
        test    di, 0fh
        jne     L_1971F
        shr     di, 4
        mov     ax, es
        add     di, ax
        mov     ax, di
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bx, es
L_19735:
        sub     ax, bx
L_19737:
        mov     word ptr es:[0], ax
        mov     es, di
        sub     bx, bx
        mov     word ptr es:[bx], bx
        ret
scsi_list_op:
        inc     al
        push    ax
        mov     al, 18h
L_19748:
        call    arena_record_seek
        pop     ax
L_1974C:
        mov     cx, word ptr es:[0]
        or      cx, cx
L_19753:
        je      L_19765
        cmp     al, byte ptr es:[TBL_0013]
L_1975A:
        jne     L_1975D
        ret
L_1975D:
        mov     bx, es
L_1975F:
        add     bx, cx
        mov     es, bx
L_19763:
        jmp     SHORT L_1974C
L_19765:
        mov     ax, ds
        mov     bx, 530h
        shr     bx, 4
L_1976D:
        add     bx, ax
        mov     es, bx
        stc
        ret
seq_create_new:
        call    arena_free_paras
        push    ax
        mov     ax, word ptr [SEQ_TEMPLATE+18h]
        mov     dx, 6
        mul     dx
        add     ax, 53h
        pop     bx
        cmp     bx, ax
L_19785:
        jae     br_1978A
        jmp     bc_int2a_1700c
br_1978A:
        call    arena_find_end
        mov     word ptr [CUR_SEQ_SEG], es
        mov     ax, es
        add     ax, 53h
        mov     word ptr [SEQ_EVENTS_SEG], ax
        sub     di, di
        mov     si, 0
        mov     cx, 298h
        rep movsw
        mov     al, byte ptr [SEL_SEQ]
        inc     al
        mov     byte ptr es:[TBL_0013], al
        mov     si, 2
        mov     cx, 0eh
tgt_197B2:
        mov     ah, byte ptr es:[si]
        cmp     ah, 20h
        je      br_197BD
        inc     si
        loop    tgt_197B2

br_197BD:
        sub     ah, ah
        mov     bh, 0ah
        div     bh
        or      ax, 3030h
        mov     word ptr es:[si], ax
        mov     cx, word ptr es:[18h]
        inc     cx
        mov     dl, byte ptr es:[1ah]
        mov     dh, byte ptr es:[1bh]
        mov     ax, 180h
        div     dh
        mul     dl
        mov     bp, ax
        mov     si, P_D1D8
        sub     bx, bx
L_197E7:
        mov     al, 0c0h
        stosb
        mov     ax, bx
        stosw
        mov     ax, dx
        stosw
        mov     al, 0
        stosb
        inc     bx
        mov     word ptr [si], bp
        add     si, 2
        loop    L_197E7
L_197FB:
        call    seq_events_terminate
        mov     es, word ptr [CUR_SEQ_SEG]
        ret
arena_tail_move_to_top:
        call    arena_find_end
        mov     dx, es
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     si, es
        add     si, word ptr es:[0]
        sub     dx, si
        mov     word ptr [P_204E], dx
        mov     di, 0ff70h
        sub     di, dx
        mov     word ptr [P_204C], di
        push    es
        mov     es, di
        sub     ax, ax
        mov     word ptr es:[0], ax
        pop     es
        mov     ax, di
        mov     bx, es
L_19830:
        sub     ax, bx
L_19832:
        mov     word ptr es:[0], ax
L_19836:
        call    mem_copy_paragraphs_backward
        mov     byte ptr [P_2081], 1
        ret
mem_copy_paragraphs_backward:
        push    di
        push    ds
        add     si, dx
        add     di, dx
        mov     ax, si
        mov     bx, di
        cli
L_1984A:
        or      dx, dx
        je      br_19860
        mov     cx, 8
        dec     ax
        dec     bx
        mov     ds, ax
        mov     es, bx
L_19857:
        sub     di, di
        sub     si, si
        rep movsw
        dec     dx
        jne     L_1984A
br_19860:
        sti
        pop     ds
        pop     di
        ret

seq_edit_begin:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ax, es
        add     ax, 53h
        mov     word ptr [SEQ_EVENTS_SEG], ax
        mov     word ptr [SEQ_GAP_WRITE_SEG], ax
        mov     word ptr [FP_SEQ_GAP_WRITE], 0
        mov     bx, es
L_1987B:
        add     bx, word ptr es:[0]
        push    bx
L_19881:
        call    arena_tail_move_to_top
        pop     bx
        mov     ax, word ptr [P_204C]
        mov     dx, word ptr [SEQ_EVENTS_SEG]
        push    ds
loop_1988D:
        cmp     dx, bx
        je      L_198A2
        dec     ax
        dec     bx
        mov     es, ax
        mov     ds, bx
        mov     cx, 8
        sub     di, di
        sub     si, si
        rep movsw
        jmp     loop_1988D
L_198A2:
        pop     ds
L_198A3:
        mov     word ptr [SEQ_AFTER_GAP_SEG], ax
        mov     word ptr [FP_SEQ_AFTER_GAP], 0
        nop
        push    cs
L_198AE:
        call    seq_position_reset_far
        les     si, [FP_SEQ_AFTER_GAP]
        mov     bx, word ptr es:[si+3]
        nop
        push    cs
L_198BB:
        call    L_170CD
        ret
seq_edit_end:
        cmp     byte ptr [P_2081], 0
        jne     L_198C7
        ret
L_198C7:
        nop
        push    cs
L_198C9:
        call    calls_timer_check_17059
        nop
        push    cs
L_198CE:
        call    L_170B9
        les     di, [FP_SEQ_GAP_WRITE]
        mov     al, 0ffh
        stosb
        mov     al, 0
L_198DA:
        stosb
        test    di, 0fh
        jne     L_198DA
        shr     di, 4
        mov     ax, es
        add     ax, di
        inc     ax
        mov     di, ax
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bx, es
L_198F1:
        sub     ax, bx
L_198F3:
        mov     word ptr es:[0], ax
        mov     si, word ptr [P_204C]
        mov     dx, word ptr [P_204E]
L_198FF:
        call    mem_copy_paragraphs
        mov     byte ptr [P_2081], 0
        ret
mem_copy_paragraphs:
        push    ds
        mov     es, di
        mov     ds, si
        cli
L_1990E:
        cmp     dx, 1001h
tgt_19912:
        jb      br_19931
        sub     dx, 1000h
        mov     cx, 8000h
        sub     di, di
        sub     si, si
        rep movsw
        mov     ax, ds
        add     ax, 1000h
        mov     ds, ax
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
        jmp     SHORT L_1990E
br_19931:
        mov     cx, dx
        shl     cx, 3
        sub     di, di
        sub     si, si
        or      dx, dx
        je      br_19940
        rep movsw
br_19940:
        sub     ax, ax
        mov     word ptr es:[di], ax
        sti
        pop     ds
        ret
seq_delete:
        call    scsi_list_op
L_1994B:
        jae     L_1994E
        ret
L_1994E:
        cmp     byte ptr es:[TBL_0013], 0
L_19954:
        jne     L_19957
        ret
L_19957:
        push    es
L_19958:
        call    arena_find_end
        mov     dx, es
        pop     es
        mov     si, es
        mov     di, es
        add     si, word ptr es:[0]
        sub     dx, si
L_19969:
        call    mem_copy_paragraphs
        mov     al, byte ptr [SEL_SEQ]

        callf   CS0_SEG:calls_process_input_00fea
        ret
undo_seq_swap:
        cmp     byte ptr [SEQ_RUNNING], 0
L_1997A:
        je      L_1997D
        ret
L_1997D:
        mov     al, 64h
        call    scsi_list_op
L_19982:
        jae     br_19985
        ret

br_19985:
        call    seq_edit_end
        mov     al, 64h
        call    scsi_list_op
        xor     byte ptr [G_UNDO_SEQ_LED], 1
        mov     al, byte ptr [SEL_SEQ]
        push    ax
        inc     al
        mov     byte ptr es:[TBL_0013], al
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     byte ptr es:[TBL_0013], 65h
        pop     ax
        callf   CS0_SEG:calls_process_input_00fea
        ret
undo_seq_save:
        mov     word ptr [G_SEQ_MEM_RESERVE], 0f78h
L_199B3:
        call    undo_seq_discard
        nop
        push    cs
L_199B8:
        call    rec_note_is_unset_far
L_199BB:
        jae     br_199BE
        ret
br_199BE:
        call    arena_free_paras
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     dx, word ptr es:[0]
        sub     dx, 0ff7h
        jb      L_199D9
        sub     ax, dx
        jb      L_199FE
        cmp     ax, 100h
        jb      L_199FE
        if      FW_VERSION = 150
        add     word ptr [G_SEQ_MEM_RESERVE], dx
        endif
L_199D9:
        mov     dx, word ptr es:[0]
        push    dx
        push    es
        push    dx
L_199E1:
        call    arena_find_end
        mov     di, es
        pop     dx
        pop     si
        push    di
L_199E9:
        call    mem_copy_paragraphs
        pop     es
        pop     dx
        mov     word ptr es:[0], dx
        mov     byte ptr es:[TBL_0013], 65h
        mov     byte ptr [B_0D3B], 1
L_199FE:
        clc
        ret
undo_seq_flag_latch:
        mov     al, 0
        xchg    byte ptr [B_0D3B], al
        or      byte ptr [G_UNDO_SEQ_LED], al
        ret
undo_seq_discard:
        mov     byte ptr [B_0D3B], 0
        mov     byte ptr [G_UNDO_SEQ_LED], 0
        mov     al, 64h
L_19A17:
        call    seq_delete
        ret
seq_copy:
        cmp     al, ah
L_19A1D:
        jne     L_19A20
        ret
L_19A20:
        push    ax
        mov     al, ah
L_19A23:
        call    seq_delete
        pop     ax
        push    ax
        call    scsi_list_op
        push    es
L_19A2C:
        call    arena_free_paras
        pop     es
        pop     bx
        mov     dx, word ptr es:[0]
        cmp     ax, dx
L_19A38:
        jae     L_19A3D
L_19A3A:
        jmp     bc_int2a_1700c
L_19A3D:
        push    bx
        push    es
        push    dx
L_19A40:
        call    arena_find_end
        mov     di, es
        pop     dx
        pop     si
        push    di
L_19A48:
        call    mem_copy_paragraphs
        pop     es
        pop     ax
        inc     ah
        mov     byte ptr es:[TBL_0013], ah
        ret
seq_copy_params:
        push    ax
        mov     al, ah
L_19A58:
        call    seq_delete
        pop     ax
        mov     byte ptr [SEL_SEQ], ah
        push    ax
L_19A61:
        call    seq_create_new
        pop     ax
        push    es
        call    scsi_list_op
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        pop     es
        push    word ptr es:[18h]
        if      FW_VERSION = 172
        push    word ptr es:[0]
        endif
        mov     cx, 530h
        sub     di, di
        sub     si, si
        rep movsb
        mov     ds, bx
        if      FW_VERSION = 172
        pop     bx
        endif
        pop     ax
        if      FW_VERSION = 172
        mov     word ptr es:[0], bx
        endif
        mov     word ptr es:[18h], ax
        mov     al, byte ptr [SEL_SEQ]
        inc     al
        mov     byte ptr es:[TBL_0013], al
        mov     di, 21h
        mov     cx, 5
        mov     al, 0
        rep stosb
        ret
arena_free_paras:
        call    arena_find_end
        mov     bx, es
L_19AA9:
        mov     ax, 0eff8h
        sub     ax, bx
L_19AAE:
        jae     L_19AB2
        sub     ax, ax
L_19AB2:
        ret
isr_int38:
        sti
        pusha
        mov     ax, DATA_SEG
        mov     ds, ax
        cmp     byte ptr [SEQ_RUNNING], 0
        je      L_19AC9
        mov     bx, W_0E10
        callf   CS0_SEG:calls_setup_handler_00623
L_19AC9:
        call    seq_edit_end
L_19ACC:
        call    undo_seq_discard
        popa
        call    int38_dispatch
        pusha
        mov     al, byte ptr [SEL_SEQ]
        callf   CS0_SEG:calls_process_input_00fea
        popa
        iret
int38_dispatch:
        cmp     ax, 0
L_19AE1:
        je      L_19AEE
        cmp     ax, 1
L_19AE6:
        je      int38_arena_resize_record
        cmp     ax, 2
        je      L_19B61
        ret
L_19AEE:
        mov     ax, PROGRAM_ARENA_SEG
        ret
int38_arena_resize_record:
        push    cx
        push    bx
L_19AF4:
        call    arena_free_paras
        pop     bx
        pop     cx
        cmp     ax, cx
        mov     ax, 0ffffh
L_19AFE:
        jae     L_19B01
        ret
L_19B01:
        mov     al, bl
L_19B03:
        call    arena_record_seek
        mov     dx, word ptr es:[0]
        cmp     dx, cx
        je      L_19B5E
L_19B0F:
        jae     L_19B3E
        push    es
        push    cx
        mov     si, es
        add     si, dx
        mov     di, si
        sub     cx, dx
        add     di, cx
L_19B1D:
        call    arena_find_end
        mov     dx, es
        sub     dx, si
L_19B24:
        push    di
        push    dx
L_19B26:
        call    mem_copy_paragraphs_backward
        pop     dx
        pop     di
        add     di, dx
        mov     es, di
        sub     bx, bx
        mov     word ptr es:[bx], bx
        pop     cx
        pop     es
        mov     word ptr es:[0], cx
        sub     ax, ax
        ret
L_19B3E:
        mov     si, es
        add     si, word ptr es:[0]
        mov     di, si
        sub     dx, cx
        sub     di, dx
        push    es
        push    cx
L_19B4D:
        call    arena_find_end
        mov     dx, es
        sub     dx, si
L_19B54:
        call    mem_copy_paragraphs
        pop     cx
        pop     es
        mov     word ptr es:[0], cx
L_19B5E:
        sub     ax, ax
        ret
L_19B61:
        cmp     bl, cl
L_19B63:
        jne     L_19B66
        ret
L_19B66:
        push    bx
        push    cx
        mov     al, bl
L_19B6A:
        call    arena_record_seek
        mov     cx, word ptr es:[0]
        push    cx
L_19B73:
        call    arena_free_paras
        pop     cx
        cmp     cx, ax
        mov     ax, 0ffffh
        pop     bx
        pop     dx
L_19B7E:
        jb      L_19B81
        ret
L_19B81:
        push    dx
L_19B82:
        call    int38_arena_resize_record
        pop     ax
        push    es
L_19B87:
        call    arena_record_seek
        mov     cx, word ptr es:[0]
        mov     si, es
        pop     es
        push    ds
        mov     ds, si
        mov     si, 0
        mov     di, 0
        shl     cx, 3
        rep movsw
        sub     ax, ax
        pop     ds
        ret
arena_record_seek:
        mov     bx, PROGRAM_ARENA_SEG
L_19BA7:
        mov     es, bx
        sub     al, 1
L_19BAB:
        jae     L_19BAE
        ret
L_19BAE:
        add     bx, word ptr es:[0]
        jmp     SHORT L_19BA7
seq_undo_checkpoint:
        callf   CS0_SEG:wait_msg
        push    cs
L_19BBB:
        call    seq_edit_end_far
        push    cs
L_19BBF:
        call    undo_seq_save_far
        push    cs
L_19BC3:
        call    undo_seq_flag_latch_far
        push    cs
calls_convert_msg_19bc7:
        call    seq_edit_begin_far
        ret
        if      FW_VERSION = 172
        db      00h
        endif
calls_convert_msg_19bcc:
        call    convert_msg
        retf
convert_msg:
CONVERT_MSG_V150:
        BC_PRINT "      Convert........."
print_convert_19bea:
        mov     al, byte ptr [SEL_SEQ]
        nop
        push    cs
calls_far_wrapper_19743_19bef:
        call    far_wrapper_19743
        pushf
        nop
        push    cs
L_19BF5:
        call    seq_create_new_far
        mov     byte ptr es:[TBL_0013], 0
        mov     si, word ptr [PTR_CUR_SONG]
        add     si, 10h
        mov     ax, word ptr [si]
        nop
        push    cs
calls_far_wrapper_19743_19c09:
        call    far_wrapper_19743
        push    ds
        mov     ax, es
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ds, ax
        mov     cx, 530h
        sub     si, si
        sub     di, di
        rep movsb
        pop     ds
        mov.l   word ptr es:[0], 0
        mov     ax, word ptr es:[TBL_0014]
        cmp     ax, 64h
        jae     L_19C32
        mov     ax, 3e8h
L_19C32:
        cmp     ax, 0bb8h
        jb      L_19C3A
        mov     ax, 0bb8h
L_19C3A:
        mov     word ptr [G_SONGCONV_BASE_TEMPO], ax
        mov     word ptr [G_SONGCONV_TEMPO_RATIO], 3e8h
L_1A299:
        mov     di, 2
        mov     si, word ptr [PTR_CUR_SONG]
        add     si, 0
        mov     cx, 10h
        rep movsb
        mov     dx, es
L_1A2AA:
        add     dx, 53h
        sub     di, di
        mov     byte ptr [B_4C13], 0
        mov     si, word ptr [PTR_CUR_SONG]
        add     si, 10h
        mov     dx, word ptr [CUR_SEQ_SEG]
        add     dx, 53h
        push    dx
L_19C6D:
        sub     di, di
L_19C6F:
        mov     ax, word ptr [si]
        cmp     al, 0ffh
L_19C73:
        je      L_19C90
        cmp     ah, 0
L_19C78:
        je      L_19C90
        mov     cl, ah
        mov     ch, 0
L_19C7E:
        push    ax
        push    cx
        push    si
L_19C81:
        call    L_19CCE
        pop     si
        pop     cx
        pop     ax
L_19C87:
        jb      L_19C90
        loop    L_19C7E
        add     si, 2
        jmp     SHORT L_19C6F
L_19C90:
        mov     es, dx
        mov     al, 0c0h
        stosb
        sub     ax, ax
        stosw
        mov     ax, word ptr [W_4C28]
        stosw
        mov     al, 0
        stosb
        nop
        push    cs
L_19CA1:
        call    seq_events_terminate_far
        pop     es
        sub     si, si
        callf   CS0_SEG:seq_renumber_bar_markers_far
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     al, byte ptr [SEL_SEQ]
        inc     al
        mov     byte ptr es:[TBL_0013], al
        callf   CS0_SEG:calls_reset_state_vars_004ba
L_19CBE:
        BC_SEQ_INIT
L_19CC1:
        popf
L_19CC2:
        jae     L_19CC5
        ret
L_19CC5:
        mov     al, byte ptr [SEL_SEQ]
        nop
        push    cs
L_19CCA:
        call    seq_delete_far
        ret
L_19CCE:
        push    dx
        push    di
        push    cx
        nop
        push    cs
calls_far_wrapper_19743_19cd3:
        call    far_wrapper_19743
        mov     bp, es
        mov     ax, word ptr es:[0]
        pop     cx
        pop     di
        pop     es
L_19CDF:
        jae     L_19CE2
        ret
L_19CE2:
        add     ax, dx
L_19CE4:
        jae     L_19CE9
L_19CE6:
        jmp     bc_int2a_1700c
L_19CE9:
        mov     bx, di
        shr     bx, 4
L_19CEE:
        add     ax, bx
L_19CF0:
        jae     L_19CF5
        jmp     bc_int2a_1700c
L_19CF5:
        cmp     ax, 0eff8h
L_19CF8:
        jb      br_19CFD
        jmp     bc_int2a_1700c

br_19CFD:
        mov     ax, bp
        add     ax, 53h
        sub     si, si
        push    ds
        mov     ds, ax
        cmp     byte ptr [si], 0ffh
        je      br_19D61
        cmp     byte ptr ss:[B_4C13], 0
        je      L_19D17
L_19D14:
        call    fn_19D93
L_19D17:
        mov     byte ptr ss:[B_4C13], 1
loop_19D1D:
        mov     al, byte ptr [si]
        cmp     al, 0ffh
        je      br_19D61
        cmp     al, 0c0h
        jne     L_19D35
        mov     ax, word ptr [si+3]
        mov     word ptr ss:[W_4C28], ax
        mov     al, byte ptr [si+6]
        cmp     al, 0ffh
        je      br_19D61
L_19D35:
        mov     al, byte ptr [si]
        mov     bx, di
        mov     cx, 3
        rep movsw
        cmp     al, 0c1h
        jne     br_19D45
L_19D42:
        call    song_convert_scale_tempo_event
br_19D45:
        cmp     si, 10h
        jb      br_19D52
        sub     si, 10h
        mov     ax, ds
        inc     ax
        mov     ds, ax
br_19D52:
        cmp     di, 10h
        jb      loop_19D1D
        sub     di, 10h
        mov     dx, es
        inc     dx
        mov     es, dx
        jmp     loop_19D1D

br_19D61:
        pop     ds
        mov     dx, es
        clc
        ret
song_convert_scale_tempo_event:
        push    es
        mov     es, word ptr ss:[CUR_SEQ_SEG]
        cmp     byte ptr es:[16h], 0
        pop     es
L_19D73:
        jne     br_19D76
        ret

br_19D76:
        push    dx
        mov     ax, word ptr [si-3]
        mov     dx, word ptr ss:[G_SONGCONV_TEMPO_RATIO]
        mul     dx
        mov     cx, 3e8h
        cmp     dx, cx
        jb      br_19D8B
        mov     dx, cx
        dec     dx
br_19D8B:
        div     cx
        mov     word ptr es:[bx+3], ax
        pop     dx
        ret

fn_19D93:
        mov     es, dx
        mov     cx, 3
        rep movsw
        mov     es, bp
        mov     ax, word ptr es:[TBL_0014]
        mov     bx, word ptr ss:[G_SONGCONV_BASE_TEMPO]
        push    dx
        mov     cx, 3e8h
        mul     cx
        cmp     dx, bx
        jb      L_19DB8
        mov     dx, bx
        sub     dx, 1
        jae     L_19DB8
        sub     dx, dx
        if      FW_VERSION = 150
br_19DC8:
        endif
L_19DB8:
        div     bx
        if      FW_VERSION = 172
        push    ax
        mul     bx
        div     cx
        cmp     ax, word ptr es:[TBL_0014]
        pop     ax
        je      br_19DC8
        inc     ax
br_19DC8:
        endif
        pop     dx
        mov     es, dx
        cmp     ax, word ptr ss:[G_SONGCONV_TEMPO_RATIO]
        je      L_19DEC
        mov     word ptr ss:[G_SONGCONV_TEMPO_RATIO], ax
        mov     byte ptr es:[di], 0c1h
        mov.l   word ptr es:[di+1], 0
        mov     word ptr es:[di+3], ax
        mov     byte ptr es:[di+5], 0
        add     di, 6
L_19DEC:
        mov     bx, 0
loop_19DEF:
        mov     es, bp
        test    byte ptr es:[bx+TRK_STATUS], 1
        je      L_19E70
        test    byte ptr es:[bx+TRK_CHANNEL], 80h
        je      L_19E70
        mov     es, word ptr ss:[CUR_SEQ_SEG]
        test    byte ptr es:[bx+TRK_STATUS], 1
        jne     br_19E44
        pusha
        push    ds
        mov     ds, bp
        mov     si, bx
        shl     si, 4
        add     si, 30h
        mov     di, si
        mov     cx, 10h
        rep movsb
        mov     al, byte ptr [bx+TRK_CHANNEL]
        mov     ah, byte ptr [bx+TRK_VELOCITY]
        mov     cl, byte ptr [bx+TRK_STATUS]
        mov     byte ptr es:[bx+TRK_CHANNEL], al
        mov     byte ptr es:[bx+TRK_VELOCITY], ah
        mov     byte ptr es:[bx+TRK_STATUS], cl
        mov     byte ptr es:[bx+470h], 0
        pop     ds
        popa
br_19E44:
        mov     es, bp
        mov     ah, byte ptr es:[bx+470h]
        sub     ah, 1
        jb      L_19E70
        mov     es, dx
        mov     al, bl
        or      al, 40h
        mov     byte ptr es:[di], al
        mov.l   word ptr es:[di+1], 0
        mov     byte ptr es:[di+3], 0c0h
        mov     byte ptr es:[di+4], ah
        mov     byte ptr es:[di+5], 0
        add     di, 6
L_19E70:
        inc     bl
L_19E72:
        cmp     bl, 40h
L_19E75:
        je      L_19E7A
        jmp     NEAR loop_19DEF
L_19E7A:
        mov     es, dx
L_19E7C:
        cmp     di, 10h
L_19E7F:
        jae     br_19E82
        ret
br_19E82:
        sub     di, 10h
        inc     dx
        mov     es, dx
        jmp     SHORT L_19E7C
bc_int2a_19e8a:
        INT_2A "  Insufficient Memory !!  "
error_insufficient_memory_19ea7:
        call    rec_state_reset
        retf
rec_state_reset:
        nop
        push    cs
        call    event_queues_reset_far
        mov     ax, ds
        mov     es, ax
        cmp     byte ptr [G_STEP_EDIT_ACTIVE], 0
        jne     br_19ECC
L_1A503:
        cmp     byte ptr [G_SONG_MODE], 0
        jne     br_19ECC
        mov     di, P_9DD8
        sub     ax, ax
        mov     cx, 1000h
        rep stosw
br_19ECC:
        mov     di, P_63CC
        mov     cx, 10h
        mov     al, 0
        rep stosb
        mov     di, P_640A
        mov     cx, 20h
        sub     ax, ax
        rep stosw
        mov     di, REC_HELD_NOTES
        mov     cx, 280h
        mov     al, 0
        rep stosb
        sub     ax, ax
        mov     word ptr [W_63E2], ax
        mov     word ptr [W_63E0], ax
        mov     word ptr [W_63E8], ax
        mov     byte ptr [G_SEQ_MEM_FULL], al
        mov     byte ptr [G_REC_EVENTS_ADDED], al
        mov     byte ptr [TBL_63CC], al
        mov     word ptr [G_SHIFT_TIMING_TICKS], ax
        mov     byte ptr [G_REC_SYSEX_ACTIVE], al
        mov     al, byte ptr [SEL_TRACK]
L_1A54F:
        mov     byte ptr [G_REC_TRACK], al
        ret
fn_19F0B:
        sub     dx, dx
note_ring_drain:
        cmp     byte ptr [SEQ_LOOP_JUMP_STATE], 0
L_19F12:
        je      L_19F15
        ret
L_19F15:
        mov     bl, byte ptr [NOTE_RING_RD]
        cmp     bl, byte ptr [NOTE_RING_WR]
L_19F1D:
        jne     br_19F20
        ret
br_19F20:
        push    dx
        call    record_note_event
        pop     dx
        jmp     SHORT note_ring_drain
record_note_event:
        sub     bh, bh
        mov     cx, word ptr [bx+NOTE_EVENT_RING]
        add     byte ptr [NOTE_RING_RD], 2
        mov     bl, byte ptr [B_63C8]
        or      bl, byte ptr [G_TAP_HELD]
L_19F3A:
        je      L_19F3D
        ret
L_19F3D:
        cmp     byte ptr [G_PUNCH_ACTIVE], 0
L_19F42:
        jne     L_19F45
        ret
L_19F45:
        mov     al, 5
        mul     ch
        mov     bx, ax
        add     bx, REC_HELD_NOTES
        cmp     cl, 0
L_19F52:
        je      br_19F8C
        mov     byte ptr [bx], cl
        mov     ah, byte ptr [G_NOTE_VAR_TYPE]
        mov     al, byte ptr [NOTE_VAR_VALUE]
        push    es
        push    si
        sub     si, si
        mov     es, si
        les     si, es:[0f4h]
        cmp     ch, byte ptr es:[si+TBL_0013]
        pop     si
        pop     es
        je      L_19F72
        sub     ax, ax
L_19F72:
        mov     word ptr [bx+1], ax
        mov     ax, word ptr [SEQ_NOW_TICK]
        mov     word ptr [bx+3], ax
        or      byte ptr [G_REC_EVENTS_ADDED], 1
        or      dx, dx
L_19F82:
        jne     br_19F85
        ret
br_19F85:
        or      byte ptr [bx], 80h
        mov     word ptr [bx+3], dx
        ret
br_19F8C:
        mov     ah, ch
        cmp     byte ptr [bx], 0
        jne     L_19F96
        jmp     L_1A293
L_19F96:
        test    byte ptr [bx], 80h
L_19F99:
        je      br_19F9C
        ret
br_19F9C:
        mov     ax, word ptr [SEQ_NOW_TICK]
        sub     ax, word ptr [bx+3]
        jne     br_19FA5
        inc     ax
br_19FA5:
        mov     word ptr [bx+3], ax
        or      byte ptr [bx], 80h
        ret
rec_midi_in_drain:
        cmp     byte ptr [SEQ_LOOP_JUMP_STATE], 0
L_19FB1:
        je      br_19FB4
        ret
br_19FB4:
        mov     bl, byte ptr [MIDI_REC_RING_RD]
        cmp     bl, byte ptr [MIDI_REC_RING_WR]
        jne     L_19FBF
        ret
L_19FBF:
        sub     bh, bh
        mov     ax, word ptr [bx+P_C7D8]
        mov     cx, word ptr [bx+P_C7DA]
        add     byte ptr [MIDI_REC_RING_RD], 4
        cmp     byte ptr [G_PUNCH_ACTIVE], 0
L_19FD3:
        jne     L_19FD6
        ret
        if      FW_VERSION = 172
L_19FD6:
        cmp     byte ptr [G_SEQ_OUTPUT_MUTE], 0
L_19FDB:
        je      br_19FDE
        ret
        endif
br_19FDE:
        if      FW_VERSION = 150
L_19FD6:
        endif
        or      byte ptr [G_REC_EVENTS_ADDED], 1
        push    rec_midi_in_drain
        cmp     al, 0f0h
        jne     br_19FED
        jmp     rec_sysex_feed_msg
br_19FED:
        cmp     al, 0f7h
        jne     L_19FF4
        jmp     rec_sysex_feed_msg
L_19FF4:
        cmp     al, 80h
L_19FF6:
        jae     L_1A002
        cmp     byte ptr [G_REC_SYSEX_ACTIVE], 0
L_19FFD:
        je      L_1A002
        jmp     rec_sysex_feed_msg
L_1A002:
        cmp     byte ptr [G_REC_SYSEX_ACTIVE], 0
        je      br_1A010
        pusha
        mov     ah, 0f7h
L_1A00C:
        call    rec_sysex_feed_msg
        popa
br_1A010:
        cmp     byte ptr [B_63C8], 0
        je      L_1A02E
        mov     bl, ah
        and     bl, 0fh
        mov     byte ptr [G_REC_TRACK], bl
        sub     bh, bh
        push    es
        mov     es, word ptr [CUR_SEQ_SEG]
        or      byte ptr es:[bx+TRK_STATUS], 1
        pop     es
L_1A02E:
        and     ah, 0f0h
        cmp     ah, 0a0h
L_1A034:
        jb      L_1A039
        jmp     L_1A3FF
L_1A039:
        cmp     byte ptr [B_63C8], 0
L_1A03E:
        jne     br_1A0B0
        push    ax
        mov     ah, 5
        mul     ah
        mov     bx, ax
        add     bx, REC_HELD_NOTES
        pop     ax
        cmp     ah, 80h
L_1A04F:
        je      br_1A07F
        cmp     cl, 0
L_1A054:
        je      br_1A07F
        mov     byte ptr [bx], cl
        mov     dh, byte ptr [G_NOTE_VAR_TYPE]
        mov     dl, byte ptr [NOTE_VAR_VALUE]
        push    es
        push    si
        sub     si, si
        mov     es, si
        les     si, es:[0f4h]
        cmp     al, byte ptr es:[si+TBL_0013]
        pop     si
        pop     es
        je      br_1A075
        sub     dx, dx
br_1A075:
        mov     word ptr [bx+1], dx
        mov     ax, word ptr [SEQ_NOW_TICK]
        mov     word ptr [bx+3], ax
        ret
br_1A07F:
        mov     ah, al
        cmp     byte ptr [bx], 0
        jne     L_1A089
        jmp     L_1A293
L_1A089:
        test    byte ptr [bx], 80h
L_1A08C:
        je      L_1A08F
        ret
L_1A08F:
        push    bx
        mov     bl, byte ptr [G_REC_TRACK]
        and     bx, 0fh
        cmp     byte ptr [bx+TBL_63CC], 0
        pop     bx
L_1A09D:
        je      br_1A0A0
        ret
br_1A0A0:
        mov     ax, word ptr [SEQ_NOW_TICK]
        sub     ax, word ptr [bx+3]
        jne     br_1A0A9
        inc     ax
br_1A0A9:
        mov     word ptr [bx+3], ax
        or      byte ptr [bx], 80h
        ret
br_1A0B0:
        cmp     ah, 80h
        mov     ah, al
        mov     al, cl
        jne     L_1A0BC
        jmp     L_1A293
L_1A0BC:
        cmp     al, 0
L_1A0BE:
        jne     L_1A0C3
        jmp     L_1A293
L_1A0C3:
        mov     cx, word ptr [SEQ_NOW_TICK]
        jmp     rec_write_note_event
rec_calc_quantized_pos_far:
        call    rec_calc_quantized_pos
        retf
rec_calc_quantized_pos:
        cmp     byte ptr [SEQ_LOOP_JUMP_STATE], 0
L_1A0D3:
        je      L_1A0D6
        ret
L_1A0D6:
        cmp     byte ptr [P_2081], 0
L_1A0DB:
        jne     L_1A0DE
        ret
L_1A0DE:
        cmp     byte ptr [G_NEXTSEQ_CHAINED], 0
L_1A0E3:
        je      L_1A0E6
        ret
L_1A0E6:
        cmp     byte ptr [B_63C8], 0
L_1A0EB:
        je      L_1A0F0
        jmp     br_1A1EB
L_1A0F0:
        cmp     byte ptr [G_TC_NOTE_VALUE], 0
L_1A0F5:
        jne     br_1A0FA
        jmp     br_1A19D
br_1A0FA:
        mov     ax, word ptr [SEQ_BAR_TICK]
        mov     cx, word ptr [SEQ_CUR_BAR]
        mov     bx, word ptr [SEQ_TC_NOTE_TICKS]
        mov     dx, bx
        shr     dx, 1
        or      dx, dx
        je      br_1A10E
        dec     dx
br_1A10E:
        add     ax, dx
        sub     dx, dx
        div     bx
        mov     bp, ax
        mul     bx
        cmp     ax, word ptr [SEQ_BAR_LEN_TICKS]
        jne     br_1A121
        sub     ax, ax
        if      FW_VERSION = 172


        inc     cx
        endif
br_1A121:
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[20h], 0
        je      L_1A14A
        cmp     byte ptr [TC_IN_PROGRESS], 0
        jne     L_1A14A
        mov     bx, word ptr es:[1eh]
        inc     bx
        jne     L_1A141
        mov     bx, word ptr es:[18h]
L_1A141:
        cmp     cx, bx
L_1A143:
        jne     L_1A14A
        mov     cx, word ptr es:[1ch]
L_1A14A:
        cmp     ax, word ptr [W_63E8]
        je      br_1A15E
        mov     word ptr [W_63E8], ax
L_1A153:
        call    record_flush_held
        mov     bl, byte ptr [SEL_TRACK]
        mov     byte ptr [G_REC_TRACK], bl
br_1A15E:
        shr     bp, 1
        jae     L_1A166
        add     ax, word ptr [G_SWING_OFFSET]
L_1A166:
        add     ax, word ptr [G_SHIFT_TIMING_TICKS]
L_1A16A:
        js      br_1A179
        cmp     ax, word ptr [SEQ_BAR_LEN_TICKS]
        jb      br_1A186
        sub     ax, word ptr [SEQ_BAR_LEN_TICKS]
        inc     cx
        jmp     SHORT br_1A186
br_1A179:
        add     ax, word ptr [SEQ_BAR_LEN_TICKS]
        sub     cx, 1
        jae     br_1A186
        sub     ax, ax
        sub     cx, cx
br_1A186:
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     cx, word ptr es:[18h]
        jb      br_1A195
        mov     ax, word ptr [SEQ_BAR_LEN_TICKS]
        dec     ax
br_1A195:
        mov     word ptr [W_63E2], ax
        mov     word ptr [W_63E0], cx
        ret
br_1A19D:
        call    record_flush_held
        mov     ax, word ptr [SEQ_BAR_TICK]
        mov     bx, word ptr [SEQ_CUR_BAR]
        mov     word ptr [W_63E2], ax
        mov     word ptr [W_63E0], bx
        mov     al, byte ptr [SEL_TRACK]
        mov     byte ptr [G_REC_TRACK], al
        ret
record_flush_held_far:
        call    record_flush_held
        retf
record_flush_held:
        pusha
        mov     ah, 0
        mov     si, REC_HELD_NOTES
loop_1A1BF:
        mov     al, 0
        xchg    byte ptr [si], al
        or      al, al
        je      br_1A1DF
        push    si
        push    ax
        sub     cx, cx
        xchg    word ptr [si+1], cx
        or      cx, cx
        je      L_1A1D5
L_1A1D2:
        call    L_1A1FA
L_1A1D5:
        sub     cx, cx
        xchg    word ptr [si+3], cx
L_1A1DA:
        call    rec_write_note_event
        pop     ax
        pop     si
br_1A1DF:
        add     si, 5
        inc     ah
        cmp     ah, 80h
        jne     loop_1A1BF
        popa
        ret
br_1A1EB:
        mov     ax, word ptr [SEQ_BAR_TICK]
        mov     bx, word ptr [SEQ_CUR_BAR]
        mov     word ptr [W_63E2], ax
        mov     word ptr [W_63E0], bx
        ret
L_1A1FA:
        push    ax
        push    si
L_1A1FC:
        call    fn_1A3A1
        or      ch, 80h
        mov     bl, byte ptr [G_REC_TRACK]
        or      bl, 40h
        mov     byte ptr es:[di], bl
        mov     bx, word ptr [W_63E2]
        mov     word ptr es:[di+1], bx
        mov     byte ptr es:[di+3], ch
        mov     byte ptr es:[di+4], ah
        mov     byte ptr es:[di+5], cl
        pop     si
        pop     ax
        ret
rec_write_note_event:
        push    ax
        and     al, 7fh

tgt_1A226:
        call    fn_1A3A1
        mov     bx, cx
        mov     byte ptr es:[di+5], al
        mov     ch, byte ptr [G_REC_TRACK]
        or      ch, 0
        mov     byte ptr es:[di], ch
        mov     cx, word ptr [W_63E2]
        mov     al, ah
        shl     al, 1
        shl     bh, 3
        rcr     al, 1
        or      ch, bh
        mov     byte ptr es:[di+1], cl
        mov     byte ptr es:[di+2], ch
        mov     byte ptr es:[di+3], bl
        mov     byte ptr es:[di+4], al
        mov     ah, byte ptr [G_REC_TRACK]
        mov     bx, ax
        and     bh, 0fh
        shl     bl, 1
        shl     bx, 1
        add     bx, P_9DD8
        push    es
        push    bx
        mov     si, word ptr [bx]
        mov     ax, word ptr [bx+2]
        sub     cx, cx
        cmp     ax, cx
        je      L_1A280
        mov     es, ax
        mov     byte ptr [B_63DD], 1
L_1A27D:
        call    seq_event_unpack
L_1A280:
        pop     bx
        pop     es
        pop     ax
        mov     byte ptr [B_63DD], 0
        test    al, 80h
L_1A28A:
        je      br_1A28D
        ret
br_1A28D:
        mov     word ptr [bx], di
        mov     word ptr [bx+2], es
        ret
L_1A293:
        mov     al, ah
        mov     ah, byte ptr [G_REC_TRACK]
        mov     bx, ax
        and     bh, 0fh
        shl     bl, 1
        shl     bx, 1
        add     bx, P_9DD8
        mov     si, word ptr [bx]
        mov     ax, word ptr [bx+2]
        sub     cx, cx
        cmp     ax, cx
L_1A2AF:
        jne     L_1A2B2
        ret
L_1A2B2:
        mov     es, ax
        cmp     byte ptr [G_SUSTAIN_TO_DURATION], 0
L_1A2B9:
        je      seq_event_unpack
        push    bx
        mov     bl, byte ptr [G_REC_TRACK]
        and     bx, 0fh
        cmp     byte ptr [bx+TBL_63CC], 0
        pop     bx
L_1A2C9:
        je      seq_event_unpack
        or      byte ptr es:[si+5], 80h
        ret
seq_event_unpack:
        sub     cx, cx
        mov     word ptr [bx], cx
        mov     word ptr [bx+2], cx
        and     byte ptr es:[si+5], 7fh
        mov     ch, byte ptr es:[si+2]
        mov     cl, byte ptr es:[si+3]
        mov     dl, byte ptr es:[si+4]
        mov     dh, ch
        shl     dl, 1
        rcr     ch, 1
        shr     ch, 2
        mov     ax, word ptr [SEQ_NOW_TICK]
        sub     ax, cx
        and     ah, 3fh
        cmp     ax, 2710h
        jb      br_1A302
        mov     ax, 270fh
br_1A302:
        cmp     byte ptr [B_63DD], 0
        je      br_1A311
        sub     ax, word ptr [SEQ_TC_NOTE_TICKS]
        jae     br_1A311
        sub     ax, ax
br_1A311:
        or      ax, ax
        jne     br_1A316
        inc     ax
br_1A316:
        shl     ah, 3
        rcr     dl, 1
        and     dh, 7
        or      ah, dh
        mov     byte ptr es:[si+2], ah
        mov     byte ptr es:[si+3], al
        mov     byte ptr es:[si+4], dl
        ret

fn_1A32D:
        mov     ax, ds
        mov     es, ax
        mov     di, P_63CC
        mov     cx, 10h
        mov     al, 0
        rep stosb
        mov     bx, P_9DD8
        mov     cx, 800h
        cmp     byte ptr [B_63C8], 0
        jne     br_1A358
        mov     ah, byte ptr [G_REC_TRACK]
        and     ah, 0fh
        mov     al, 0
        shl     ax, 1
        add     bx, ax
        mov     cx, 80h
br_1A358:
        push    bx
        push    cx
        mov     si, word ptr [bx]
        mov     ax, word ptr [bx+2]
        sub     cx, cx
        cmp     ax, cx
        je      br_1A36A
        mov     es, ax
L_1A367:
        call    seq_event_unpack
br_1A36A:
        pop     cx
        pop     bx
        add     bx, 4
        loop    br_1A358
        ret
loop_1A372:
        mov     bh, byte ptr [G_REC_TRACK]
        and     bx, 0f00h
        shl     bx, 1
        add     bx, P_9DD8
        mov     cx, 80h
        sub     ax, ax
L_1A385:
        cmp     ax, word ptr [bx+2]
        je      br_1A39B
        mov     si, word ptr [bx]
        mov     es, word ptr [bx+2]
        test    byte ptr es:[si+5], 80h
        je      br_1A39B
        pusha
L_1A397:
        call    seq_event_unpack
        popa
br_1A39B:
        add     bx, 4
        loop    L_1A385
        ret
fn_1A3A1:
        push    ax
        push    cx
        les     di, [FP_1D1E]
        mov     si, di
        cmp     byte ptr es:[si], 0ffh
        je      br_1A3CC
        sub     cx, cx


loop_1A3B1:
        add     si, 6
        add     cx, 3
        cmp     byte ptr es:[si], 0ffh
        jne     loop_1A3B1
        inc     cx
        push    si

tgt_1A3BF:
        mov     ax, word ptr es:[si]
        mov     word ptr es:[si+6], ax
        sub     si, 2
        loop    tgt_1A3BF
        pop     si
br_1A3CC:
        add     si, 6
        mov     byte ptr es:[si], 0ffh
        mov     ax, es
        mov     cx, si
        shr     cx, 4
        add     ax, cx
        and     si, 0fh
        mov     word ptr [FP_SEQ_GAP_WRITE], si
        mov     word ptr [SEQ_GAP_WRITE_SEG], ax
        add     word ptr [FP_1D1E], 6
        mov     cx, word ptr [SEQ_AFTER_GAP_SEG]
        sub     cx, ax
        cmp     cx, word ptr [G_SEQ_MEM_RESERVE]
        jae     br_1A3FC
        mov     byte ptr [G_SEQ_MEM_FULL], 1
br_1A3FC:
        pop     cx
        pop     ax
        ret
L_1A3FF:
        les     di, [FP_SEQ_GAP_WRITE]
        cmp     ax, 0b040h
L_1A406:
        jne     br_1A423
        cmp     byte ptr [G_SUSTAIN_TO_DURATION], 0
L_1A40D:
        je      br_1A423
        mov     bl, byte ptr [G_REC_TRACK]
        and     bx, 0fh
        mov     byte ptr [bx+TBL_63CC], cl
        cmp     cl, 0
L_1A41D:
        jne     br_1A422
        jmp     NEAR loop_1A372
br_1A422:
        ret
br_1A423:
        mov     bl, byte ptr [G_REC_TRACK]
        or      bl, 40h
        mov     byte ptr es:[di], bl
        mov     bx, word ptr [SEQ_BAR_TICK]
        mov     word ptr es:[di+1], bx
        mov     byte ptr es:[di+3], ah
        mov     byte ptr es:[di+4], al
        mov     byte ptr es:[di+5], cl
        or      byte ptr [G_REC_EVENTS_ADDED], 1
        jmp     seq_event_ptr_next_limit
rec_sysex_feed_msg:
        mov     byte ptr [G_REC_SYSEX_ACTIVE], 1
        call    rec_sysex_feed_byte
L_1A451:
        jne     L_1A454
        ret
L_1A454:
        mov     al, ah
        call    rec_sysex_feed_byte
L_1A459:
        jne     L_1A45C
        ret
L_1A45C:
        mov     al, cl
rec_sysex_feed_byte:
        push    ax
        push    cx
L_1A460:
        call    rec_sysex_store_byte
        pop     cx
        pop     ax
        cmp     al, 0f7h
L_1A467:
        je      br_1A46A
        ret
br_1A46A:
        mov     byte ptr [G_REC_SYSEX_ACTIVE], 0
        ret
rec_sysex_store_byte:
        les     di, [FP_SEQ_GAP_WRITE]
        cmp     al, 0f0h
L_1A476:
        jne     L_1A4E9
        mov     word ptr [FP_REC_SYSEX_HDR], di
        mov     word ptr [G_REC_SYSEX_HDR_SEG], es
        mov     word ptr [G_REC_SYSEX_LEN_LO], 1
        mov     byte ptr [G_REC_SYSEX_LEN_HI], 0
        mov     cl, 10h
        cmp     byte ptr [B_63C8], 0
        jne     L_1A498
        mov     cl, byte ptr [G_REC_TRACK]
L_1A498:
        or      cl, 80h
        mov     byte ptr es:[di], cl
        mov     cx, word ptr [SEQ_BAR_TICK]
        mov     word ptr es:[di+1], cx
        mov     cl, 0
        mov     byte ptr es:[di+3], cl
        mov     byte ptr es:[di+4], cl
        mov     byte ptr es:[di+5], cl
L_1A4B4:
        call    seq_event_ptr_next_limit
        mov     byte ptr es:[di], 0f0h
        mov     byte ptr es:[di+1], cl
        mov     byte ptr es:[di+2], cl
        mov     byte ptr es:[di+3], cl
        mov     byte ptr es:[di+4], cl
        mov     byte ptr es:[di+5], cl
        mov     byte ptr [G_REC_SYSEX_IDX], 1
        cmp     byte ptr [B_63C8], 0
L_1A4D9:
        jne     br_1A4DC
        ret
br_1A4DC:
        push    es
        mov     es, word ptr [CUR_SEQ_SEG]
        or      byte ptr es:[500h], 1
        pop     es
        ret
L_1A4E9:
        add     word ptr [G_REC_SYSEX_LEN_LO], 1
        adc     byte ptr [G_REC_SYSEX_LEN_HI], 0
        mov     bl, byte ptr [G_REC_SYSEX_IDX]
        sub     bh, bh
        mov     byte ptr es:[bx+di], al
        inc     bl
L_1A4FE:
        mov     byte ptr [G_REC_SYSEX_IDX], bl
        cmp     bl, 6
        jne     L_1A529
        cmp     al, 0f7h
        je      L_1A529
L_1A50B:
        call    seq_event_ptr_next_limit
        mov     bl, 0
        mov     byte ptr es:[di+1], bl
        mov     byte ptr es:[di+2], bl
        mov     byte ptr es:[di+3], bl
        mov     byte ptr es:[di+4], bl
        mov     byte ptr es:[di+5], bl
        mov     byte ptr [G_REC_SYSEX_IDX], bl
        ret
L_1A529:
        cmp     al, 0f7h
L_1A52B:
        je      L_1A52E
        ret
L_1A52E:
        mov     byte ptr [G_REC_SYSEX_ACTIVE], 0
L_1A533:
        call    seq_event_ptr_next_limit
        mov     al, 0c2h
        mov     byte ptr es:[di], al
        mov     al, 0
        mov     byte ptr es:[di+1], al
        mov     byte ptr es:[di+2], al
        mov     byte ptr es:[di+3], al
        mov     byte ptr es:[di+4], al
        mov     byte ptr es:[di+5], al
L_1A551:
        call    seq_event_ptr_next_limit
        les     di, [FP_REC_SYSEX_HDR]
        mov     ax, word ptr [G_REC_SYSEX_LEN_LO]
        mov     bl, byte ptr [G_REC_SYSEX_LEN_HI]
        mov     word ptr es:[di+3], ax
        mov     byte ptr es:[di+5], bl
        ret
seq_event_ptr_next_limit:
        add     di, 6
        cmp     di, 10h
        jb      br_1A588
        sub     di, 10h
        mov     dx, es
        inc     dx
        mov     es, dx
        mov     ax, word ptr [SEQ_AFTER_GAP_SEG]
        sub     ax, dx
        cmp     ax, word ptr [G_SEQ_MEM_RESERVE]
        jae     br_1A588
        mov     byte ptr [G_SEQ_MEM_FULL], 1
br_1A588:
        mov     word ptr [FP_SEQ_GAP_WRITE], di
        mov     word ptr [SEQ_GAP_WRITE_SEG], es
        mov     byte ptr es:[di], 0ffh
        ret
rec_punch_window_check:
        mov     al, byte ptr [SEQ_REC_ARMED]
        or      al, byte ptr [SEQ_ODUB_ARMED]
        mov     ah, byte ptr [G_SEQ_MEM_FULL]
        xor     ah, 1
        and     al, ah
L_1A5A5:
        je      br_1A5D8
        cmp     byte ptr [P_70F9], 0
        je      br_1A5D1
        mov     ax, word ptr [SEQ_CUR_BAR]
        mov     cx, word ptr [SEQ_BAR_TICK]
        cmp     ax, word ptr [PUNCH_IN_BAR]
L_1A5B9:
        jb      br_1A5D8
        jne     L_1A5C3
        cmp     cx, word ptr [PUNCH_IN_TICK]
L_1A5C1:
        jb      br_1A5D8
L_1A5C3:
        cmp     ax, word ptr [PUNCH_OUT_BAR]
L_1A5C7:
        ja      br_1A5D8
        jne     br_1A5D1
        cmp     cx, word ptr [PUNCH_OUT_TICK]
L_1A5CF:
        jae     br_1A5D8
br_1A5D1:
        mov     byte ptr [G_PUNCH_ACTIVE], 0ffh
        clc
        ret
br_1A5D8:
        mov     byte ptr [G_PUNCH_ACTIVE], 0
        stc
        ret
rec_flush_pending_mixer_events:
        cmp     byte ptr [SEQ_LOOP_JUMP_STATE], 0
L_1A5E4:
        je      L_1A5E7
        ret
L_1A5E7:
        cmp     byte ptr [G_PUNCH_ACTIVE], 0
L_1A5EC:
        jne     L_1A5EF
        ret
L_1A5EF:
        mov     bx, P_640A
L_1A5F2:
        mov     ah, byte ptr [bx]
        cmp     ah, 0
        je      br_1A607
        mov     byte ptr [bx], 0
        mov     al, byte ptr [bx+1]
        mov     cl, byte ptr [bx+2]
        push    bx
L_1A603:
        call    rec_write_mixer_sysex_event
        pop     bx
br_1A607:
        add     bx, 4
        cmp     bx, P_644A
        jne     L_1A5F2
        ret
rec_write_mixer_sysex_event:
        push    ax
        push    cx
        mov     si, P_644A
        les     di, [FP_SEQ_GAP_WRITE]
        push    di
        mov     cx, 18h
        rep movsb
        pop     di
        mov     al, byte ptr [G_REC_TRACK]
        or      byte ptr es:[di], al
        mov     ax, word ptr [SEQ_BAR_TICK]
        mov     word ptr es:[di+1], ax
        pop     cx
        pop     ax
        mov     byte ptr es:[di+0bh], ah
        mov     byte ptr es:[di+0ch], al
        mov     byte ptr es:[di+0dh], cl
        add     di, 18h
        mov     bx, di
        shr     bx, 4
L_1A644:
        mov     ax, es
        add     ax, bx
L_1A648:
        and     di, 0fh
        mov     es, ax
        mov     cx, word ptr [SEQ_AFTER_GAP_SEG]
        sub     cx, ax
        cmp     cx, word ptr [G_SEQ_MEM_RESERVE]
        jae     L_1A65E
        mov     byte ptr [G_SEQ_MEM_FULL], 1
L_1A65E:
        mov     word ptr [FP_SEQ_GAP_WRITE], di
        mov     word ptr [SEQ_GAP_WRITE_SEG], es
        mov     byte ptr es:[di], 0ffh
        or      byte ptr [G_REC_EVENTS_ADDED], 1
        ret


isr_int48:
        push    ds
        mov     bx, DATA_SEG
        mov     ds, bx
        mov     bl, al
        and     bx, 0fh
        shl     bx, 2
        add     bx, P_640A
        mov     byte ptr [bx], ah
        mov     byte ptr [bx+1], al
        mov     byte ptr [bx+2], cl
        pop     ds
        iret
copy_events_exec_far:
        call    copy_events_exec
        mov     byte ptr [SEQ_LOOP_JUMP_STATE], 0
        retf
copy_events_exec:
        mov     ax, word ptr [G_EDIT_COPIES_M1]
        inc     ax
        mov     word ptr [G_COPY_PASSES_LEFT], ax
        mov     al, byte ptr [G_EDIT_TO_TRACK]
        mov     byte ptr [SEL_TRACK], al
        mov     al, byte ptr [G_EDIT_TO_SEQ]
        mov     byte ptr [SEL_SEQ], al

        callf   CS0_SEG:calls_process_input_00fea
        mov     es, word ptr [CUR_SEQ_SEG]
        cmp     byte ptr es:[TBL_0013], 0
        jne     L_1A6BE
        nop
        push    cs
L_1A6BB:
        call    seq_create_new_far
L_1A6BE:
        nop
        push    cs
L_1A6C0:
        call    seq_undo_checkpoint_far
        mov     ax, word ptr [G_EDIT_TO_BAR]
        mov     cx, word ptr [G_EDIT_TO_TICK]
        nop
        push    cs
L_1A6CC:
        call    seq_position_set_far
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bl, byte ptr [G_EDIT_TO_TRACK]
        mov     bh, 0
        or      byte ptr es:[bx+TRK_STATUS], 1
        mov     ax, word ptr es:[18h]
        cmp     ax, word ptr [G_EDIT_TO_BAR]
        jne     L_1A6EE
        nop
        push    cs
L_1A6EB:
        call    seq_bars_extend_one_far
L_1A6EE:
        mov     al, byte ptr [G_EDIT_FROM_SEQ]
        cmp     al, byte ptr [G_EDIT_TO_SEQ]
        jne     calls_far_wrapper_19743_1a703
        mov     al, 64h
        nop
        push    cs
calls_far_wrapper_19743_1a6fb:
        call    far_wrapper_19743
        jae     L_1A708
        jmp     bc_int2a_19e8a
calls_far_wrapper_19743_1a703:
        nop
        push    cs
calls_far_wrapper_19743_1a705:
        call    far_wrapper_19743
L_1A708:
        mov     ax, es
        add     ax, 53h
        mov     es, ax
        mov     word ptr [SEQ_READ_PTR_SEG], ax
        sub     ax, ax
        mov     word ptr [FP_SEQ_READ_PTR], ax
        mov     ax, word ptr [G_RANGE_START_BAR]
        mov     cx, word ptr [G_RANGE_START_TICK]
L_1A71E:
        call    seq_events_seek_bar_tick
        mov     word ptr [FP_COPY_SRC_START], si
        mov     word ptr [W_63EC], es

loop_1A729:
        les     si, [FP_COPY_SRC_START]
        mov     word ptr [FP_SEQ_READ_PTR], si
        mov     word ptr [SEQ_READ_PTR_SEG], es
        mov     ax, word ptr [G_RANGE_START_BAR]
        mov     cx, word ptr [G_RANGE_START_TICK]
        mov     word ptr [G_COPY_SRC_BAR], ax
        mov     word ptr [G_COPY_SRC_TICK], cx
        mov     word ptr [G_COPY_SCAN_BAR], ax
L_1A746:
        call    L_1907F
L_1A749:
        call    copy_events_scan_pos
L_1A74C:
        call    copy_events_src_tick_advance
        mov     ax, word ptr [G_COPY_SRC_BAR]
        mov     cx, word ptr [G_COPY_SRC_TICK]
        cmp     ax, word ptr [G_RANGE_END_BAR]
L_1A75A:
        jne     L_1A784
        cmp     cx, word ptr [G_RANGE_END_TICK]
L_1A760:
        jne     L_1A784
        dec     word ptr [G_COPY_PASSES_LEFT]
L_1A766:
        jne     L_1A769
        ret
L_1A769:
        call    midi_process
        cmp     word ptr [SEQ_CUR_BAR], 3e6h
L_1A772:
        jne     L_1A775
        ret
L_1A775:
        mov     ax, word ptr [SEQ_AFTER_GAP_SEG]
        sub     ax, word ptr [SEQ_GAP_WRITE_SEG]
        cmp     ax, word ptr [G_SEQ_MEM_RESERVE]
L_1A780:
        jb      br_1A79F
        jmp     loop_1A729
L_1A784:
        call    midi_process
        cmp     word ptr [SEQ_CUR_BAR], 3e6h
L_1A78D:
        jne     L_1A790
        ret
L_1A790:
        mov     ax, word ptr [SEQ_AFTER_GAP_SEG]
        sub     ax, word ptr [SEQ_GAP_WRITE_SEG]
        cmp     ax, word ptr [G_SEQ_MEM_RESERVE]
L_1A79B:
        jb      br_1A79F
        jmp     SHORT L_1A746
br_1A79F:
        mov     byte ptr [G_SEQ_MEM_FULL], 1
        ret

copy_events_scan_pos:
        les     si, [FP_SEQ_READ_PTR]
        mov     cx, word ptr es:[si+1]
        and     ch, 7
        mov     bx, word ptr [G_COPY_SCAN_BAR]
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
        jne     br_1A7BC
        ret
br_1A7BC:
        cmp     al, 0c0h
        jne     br_1A7CA
        mov     bx, word ptr es:[si+1]
        mov     word ptr [G_COPY_SCAN_BAR], bx
        sub     cx, cx
br_1A7CA:
        cmp     bx, word ptr [G_COPY_SRC_BAR]
        je      br_1A7D1
        ret
br_1A7D1:
        cmp     cx, word ptr [G_COPY_SRC_TICK]
        je      L_1A7D8
        ret
L_1A7D8:
        cmp     al, 0c0h
        jne     L_1A7E1
L_1A7DC:

        call    event_tsig_bar_ticks
        jmp     SHORT calls_sequence_data_read_1a843
L_1A7E1:
        cmp     al, 0c1h
        je      L_1A814
        mov     ah, al
        and     ax, 3fc0h
        cmp     ah, byte ptr [G_EDIT_FROM_TRACK]
L_1A7EE:
        jne     calls_sequence_data_read_1a843
        cmp     al, 80h
        je      L_1A814
        cmp     al, 0
        je      br_1A802
        mov     al, byte ptr es:[si+3]
        and     al, 0f0h
        cmp     al, 80h
        jne     L_1A814
br_1A802:
        mov     al, byte ptr es:[si+4]
        and     al, 7fh
        cmp     al, byte ptr [G_EDIT_NOTE_LO]
        jb      calls_sequence_data_read_1a843
        cmp     byte ptr [G_EDIT_NOTE_HI], al
        jb      calls_sequence_data_read_1a843
L_1A814:
        push    word ptr [FP_SEQ_GAP_WRITE]
        push    word ptr [SEQ_GAP_WRITE_SEG]
L_1A81C:
        call    seq_gap_copy_event_from_src
        pop     es
        pop     si
L_1A821:
        mov     al, byte ptr es:[si]
        cmp     al, 0c1h
        je      br_1A831
        and     al, 0c0h
        or      al, byte ptr [G_EDIT_TO_TRACK]
        mov     byte ptr es:[si], al
br_1A831:
        mov     ax, word ptr es:[si+1]
        and     ax, 0f800h
        or      ax, word ptr [SEQ_BAR_TICK]
        mov     word ptr es:[si+1], ax
        jmp     copy_events_scan_pos
calls_sequence_data_read_1a843:
        call    sequence_data_read
        mov     word ptr [FP_SEQ_READ_PTR], si
        mov     word ptr [SEQ_READ_PTR_SEG], es
        jmp     copy_events_scan_pos
copy_events_src_tick_advance:
        mov     ax, word ptr [G_TSIG_BAR_TICKS]
        inc     word ptr [G_COPY_SRC_TICK]
        cmp     ax, word ptr [G_COPY_SRC_TICK]
L_1A85C:
        je      L_1A85F
        ret
L_1A85F:
        mov     word ptr [G_COPY_SRC_TICK], 0
        inc     word ptr [G_COPY_SRC_BAR]
        ret
        if      FW_VERSION = 150
        db      00h
        endif
mpc_seq_import_by_version_far:
        call    mpc_seq_import_by_version
        retf
mpc3000_seq_import_far:
        call    mpc3000_seq_import
        retf
mpc60_seq_import_far:
        call    mpc60_seq_import
        retf
mpc_seq_import_by_version:
        cmp     word ptr [BUF_FILE_HEADER], 303h
L_1A87C:
        je      mpc3000_seq_import
        jmp     NEAR L_1AE73
mpc3000_seq_import:
        mov     byte ptr [G_IMPORT_IS_MPC60], 0
        mov     word ptr [G_IMPORT_SAVED_SP], sp
        mov     word ptr [G_IMPORT_SEQ_SEG], ax
        mov     word ptr [G_IMPORT_MEM_END_SEG], bx
        mov     word ptr [G_IMPORT_EVT_SEG], dx
        mov     word ptr [G_IMPORT_BAR_TICK], 0
        sub     ax, ax
        mov     word ptr [G_IMPORT_ABS_TICK_LO], ax
        mov     word ptr [G_IMPORT_ABS_TICK_HI], ax
        mov     bl, 5
        mov     bh, byte ptr [G_DISK_DEVICE]
L_1A8A9:
        int     2ch
        cmp     al, 0ffh
L_1A8AD:
        jne     L_1A8B2
        jmp     NEAR loop_1AD56
L_1A8B2:
        mov     byte ptr [G_IMPORT_FILE_HANDLE], al
        mov     ax, ds
        mov     es, ax
        mov     di, P_7DDB
        mov     cx, 150h
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_1A8C5:
        int     2ch
L_1A8C7:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     di, 2
        mov     si, P_7DE3
        mov     cx, 10h
        rep movsb
        mov     al, byte ptr [B_7DF4]
        and     al, 1
        mov     byte ptr es:[20h], al
        mov     si, P_7DFF
        mov     di, 21h
        lodsb
        mov     byte ptr es:[di+4], al
        lodsb
        mov     byte ptr es:[di+3], al
        lodsb
        mov     byte ptr es:[di+2], al
        lodsb
        mov     byte ptr es:[di+1], al
        lodsb
        mov     byte ptr es:[di], al
        mov     ax, word ptr [W_7DDB]
        mov     dx, word ptr [W_7DDD]
        mov     word ptr [G_IMPORT_DATA_LEN_LO], ax
        mov     word ptr [G_IMPORT_DATA_LEN_HI], dx
        mov     bx, word ptr [W_7DDF]
        mov     cx, word ptr [W_7DE1]
        mov     word ptr [G_IMPORT_WRAP_LEFT_LO], bx
        mov     word ptr [G_IMPORT_WRAP_LEFT_HI], cx
        pusha
        mov     cx, 4
L_1A91F:
        shr     dx, 1
        rcr     ax, 1
        loop    L_1A91F
        inc     ax
        push    ax
        add     ax, word ptr [G_IMPORT_EVT_SEG]
        cmp     ax, word ptr [G_IMPORT_MEM_END_SEG]
        pop     ax
L_1A930:
        jb      br_1A935
        jmp     NEAR loop_1ADA4
br_1A935:
        mov     bx, word ptr [G_IMPORT_MEM_END_SEG]
        sub     bx, ax
        mov     word ptr [G_IMPORT_BUF_SEG], bx
        popa
        sub     ax, bx
        sbb     dx, cx
        mov     word ptr [G_IMPORT_READ_LEFT_LO], ax
        mov     word ptr [G_IMPORT_READ_LEFT_HI], dx
        mov     ax, word ptr [W_7DFD]
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     word ptr es:[TBL_0014], ax
        mov     al, byte ptr [B_7F29]
        mov     byte ptr [G_IMPORT_TEMPO_LEFT], al
        mov     cl, byte ptr [B_7F2A]
        sub     ch, ch
L_1A962:
        push    cx
        mov     cx, 18h
        mov     ax, ds
        mov     es, ax
        mov     di, P_7DD8
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_1A973:
        int     2ch
L_1A975:
        mov     al, byte ptr [BUF_FILE_HEADER]
        dec     al
        cmp     al, 40h
        jae     L_1A9C0
        mov     bl, al
        sub     bh, bh
        mov     cx, 10h
        mul     cl
        add     ax, 30h
        mov     di, ax
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     si, P_7DDD
        rep movsb
        mov     al, byte ptr [W_7DDB]
        inc     al
        je      br_1A9A2
        dec     al
        and     al, 1fh
        or      al, 20h
br_1A9A2:
        or      al, 80h
        test    byte ptr [B_7DDA], 4
        je      br_1A9AD
        or      al, 40h
br_1A9AD:
        mov     byte ptr es:[bx+TRK_CHANNEL], al
        mov     byte ptr es:[bx+TRK_STATUS], 3
        mov     al, byte ptr [MZ_ENTRY_CS]
        mov     byte ptr es:[bx+470h], al
L_1A9C0:
        pop     cx
        loop    L_1A962
        mov     ax, ds
        mov     es, ax
        mov     di, P_9DD8
        mov     al, byte ptr [G_IMPORT_TEMPO_LEFT]
        mov     ah, 6
        mul     ah
        mov     cx, ax
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_1A9D9:
        int     2ch
L_1A9DB:
        mov     word ptr [PTR_IMPORT_TEMPO_NEXT], P_9DDE
        dec     byte ptr [G_IMPORT_TEMPO_LEFT]
loop_1A9E5:
        mov     ax, word ptr [G_IMPORT_DATA_LEN_LO]
        mov     dx, word ptr [G_IMPORT_DATA_LEN_HI]
        mov     es, word ptr [G_IMPORT_BUF_SEG]
L_1A9F0:
        mov     bx, ax
        or      bx, dx
L_1A9F4:
        je      br_1AA26
        sub     ax, 8000h
        sbb     dx, 0
        jb      L_1AA17
        mov     cx, 8000h
        pusha
        sub     di, di
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_1AA0A:
        int     2ch
L_1AA0C:
        popa
        mov     bx, es
L_1AA0F:
        add     bx, 800h
        mov     es, bx
L_1AA15:
        jmp     SHORT L_1A9F0
L_1AA17:
        add     ax, 8000h
        mov     cx, ax
        sub     di, di
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_1AA24:
        int     2ch
br_1AA26:
        mov     ax, word ptr [G_IMPORT_BUF_SEG]
        sub     dx, dx
        mov     cx, 4
tgt_1AA2E:
        shl     ax, 1
        rcl     dx, 1
        loop    tgt_1AA2E
        add     ax, word ptr [G_IMPORT_WRAP_LEFT_LO]
        adc     dx, word ptr [G_IMPORT_WRAP_LEFT_HI]
        mov     di, ax
        mov     cx, 4
tgt_1AA41:
        shr     dx, 1
        rcr     ax, 1
        loop    tgt_1AA41
        and     di, 0fh
        mov     word ptr [FP_IMPORT_READ], di
        mov     word ptr [G_IMPORT_READ_SEG], ax
calls_buffer_process_1aa51:
        call    buffer_process
        cmp     al, 0a8h
        jne     calls_buffer_process_1aa51
        sub     word ptr [FP_IMPORT_READ], 1
        sbb     word ptr [G_IMPORT_READ_SEG], 0
        add     word ptr [G_IMPORT_READ_LEFT_LO], 1
        adc     word ptr [G_IMPORT_READ_LEFT_HI], 0
        mov     es, word ptr [G_IMPORT_EVT_SEG]
        sub     di, di
import_evt_loop:
        mov     ax, import_evt_loop
        push    ax
calls_buffer_process_1aa76:
        call    buffer_process
        cmp     al, 0ffh
        jne     L_1AA80
        jmp     NEAR loop_1AD5B
L_1AA80:
        test    al, 80h
L_1AA82:
        jne     L_1AA87
        jmp     NEAR L_1AC92
L_1AA87:
        cmp     byte ptr [G_IMPORT_SYSEX_OPEN], 0
        push    ax
L_1AA8D:
        call    L_1ACAF
        pop     ax
        mov     bl, al
        and     al, 0f8h
        cmp     al, 88h
        jne     br_1AA9B
        jmp     SHORT L_1AAE3
br_1AA9B:
        cmp     al, 0a8h
        jne     br_1AAA1
        jmp     SHORT L_1AAF7
br_1AAA1:
        cmp     al, 98h
        jne     br_1AAA8
        jmp     NEAR calls_buffer_process_1ab44
br_1AAA8:
        cmp     al, 0a0h
        jne     br_1AAAF
        jmp     NEAR calls_buffer_process_1abfe
br_1AAAF:
        cmp     al, 0b0h
        jne     br_1AAB6
        jmp     NEAR calls_buffer_process_1abfe
br_1AAB6:
        cmp     al, 0e0h
        jne     br_1AABD
        jmp     NEAR calls_buffer_process_1abfe
br_1AABD:
        cmp     al, 0c0h
        jne     br_1AAC4
        jmp     NEAR calls_buffer_process_1ac31
br_1AAC4:
        cmp     al, 0d0h
        jne     br_1AACB
        jmp     NEAR calls_buffer_process_1ac31
br_1AACB:
        cmp     al, 0f0h
        jne     br_1AAD2
        jmp     NEAR calls_buffer_process_1ac61
br_1AAD2:
        cmp     al, 0e8h
        jne     L_1AAD9
        jmp     NEAR calls_buffer_process_1acf4
L_1AAD9:
        cmp     al, 0b8h
L_1AADB:
        jne     L_1AAE0
        jmp     NEAR calls_buffer_process_1acf8
L_1AAE0:
        jmp     NEAR loop_1ADAD
L_1AAE3:
        call    calls_buffer_process_1ae48
        add     word ptr [G_IMPORT_BAR_TICK], ax
        add     word ptr [G_IMPORT_ABS_TICK_LO], ax
        adc     word ptr [G_IMPORT_ABS_TICK_HI], 0
L_1AAF3:
        call    mpc_import_emit_tempo_event
        ret
L_1AAF7:
        call    calls_buffer_process_1ae48
        mov     word ptr [G_IMPORT_BAR], ax
        dec     ax
        mov     cx, ax
calls_buffer_process_1ab00:
        call    buffer_process
        mov     bl, al
calls_buffer_process_1ab05:
        call    buffer_process
        mov     byte ptr es:[di], 0c0h
        mov     word ptr es:[di+1], cx
        mov     byte ptr es:[di+3], bl
        mov     byte ptr es:[di+4], al
        mov     byte ptr es:[di+5], 0
        mov     word ptr [G_IMPORT_BAR_TICK], 0
        mov     bh, al
        cmp     bh, 4
        jae     br_1AB2C
        mov     bh, 4
br_1AB2C:
        cmp     bl, 0
        jne     L_1AB33
        mov     bl, 4
L_1AB33:
        mov     ax, 180h
        div     bh
        mul     bl
        mov     word ptr [G_IMPORT_BAR_LEN], ax
L_1AB3D:
        call    seq_event_ptr_next
calls_buffer_process_1ab40:
        call    mpc_import_emit_tempo_event
        ret
calls_buffer_process_1ab44:
        call    buffer_process
        dec     al
        cmp     al, 40h
calls_buffer_process_1ab4b:
        jb      calls_buffer_process_1ab56
        mov     cx, 6
calls_buffer_process_1ab50:
        call    buffer_process
        loop    calls_buffer_process_1ab50
        ret
calls_buffer_process_1ab56:
        mov     dh, al
calls_buffer_process_1ab58:
        call    buffer_process
        mov     dl, al
calls_buffer_process_1ab5d:
        call    buffer_process
        mov     cl, al
calls_buffer_process_1ab62:
        call    buffer_process
        mov     bh, al
        push    bx
L_1AB68:
        call    calls_buffer_process_1ae48
        pop     bx
        push    es
        push    bx
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bl, dh
        sub     bh, bh
        test    byte ptr es:[bx+TRK_CHANNEL], 40h
        pop     bx
        pop     es
        je      br_1ABCC
        cmp     byte ptr [G_IMPORT_IS_MPC60], 0
        je      L_1AB99
        push    bx
        mov     bl, dl
        cmp     bl, 0
        je      br_1AB92
        add     bl, 2
br_1AB92:
        mov     bh, 0
        mov     dl, byte ptr [bx+TBL_NOTE_CONVERSION]
        pop     bx
L_1AB99:
        and     bl, 3
        cmp     bx, 4000h
        je      br_1ABCC
        push    ax
        push    dx
        push    cx
        push    bx
        or      dh, 40h
        mov     byte ptr es:[di], dh
        mov     ax, word ptr [G_IMPORT_BAR_TICK]
        mov     word ptr es:[di+1], ax
        and     bl, 3
        or      bl, 80h
        mov     byte ptr es:[di+3], bl
        mov     byte ptr es:[di+4], dl
        mov     byte ptr es:[di+5], bh
L_1ABC5:
        call    seq_event_ptr_next
        pop     bx
        pop     cx
        pop     dx
        pop     ax
br_1ABCC:
        shl     dl, 1
        cmp     ax, 2710h
        jb      br_1ABD6
        mov     ax, 270fh
br_1ABD6:
        shl     ah, 3
        rcr     dl, 1
        mov     bx, word ptr [G_IMPORT_BAR_TICK]
        and     bh, 7
        or      ah, bh
        mov     byte ptr es:[di], dh
        mov     byte ptr es:[di+1], bl
        mov     byte ptr es:[di+2], ah
        mov     byte ptr es:[di+3], al
        mov     byte ptr es:[di+4], dl
        mov     byte ptr es:[di+5], cl
        jmp     seq_event_ptr_next


calls_buffer_process_1abfe:
        mov     cl, al
calls_buffer_process_1ac00:
        call    buffer_process
        dec     al
        mov     bh, al
calls_buffer_process_1ac07:
        call    buffer_process
        mov     bl, al
calls_buffer_process_1ac0c:
        call    buffer_process
        cmp     bh, 40h
L_1AC12:
        jb      br_1AC15
        ret

br_1AC15:
        or      bh, 40h
        mov     byte ptr es:[di], bh
        mov     byte ptr es:[di+3], cl
        mov     byte ptr es:[di+4], bl
        mov     byte ptr es:[di+5], al
        mov     ax, word ptr [G_IMPORT_BAR_TICK]
        mov     word ptr es:[di+1], ax
        jmp     seq_event_ptr_next
calls_buffer_process_1ac31:
        mov     cl, al
calls_buffer_process_1ac33:
        call    buffer_process
        dec     al
        mov     bh, al
calls_buffer_process_1ac3a:
        call    buffer_process
        cmp     bh, 40h
L_1AC40:
        jb      br_1AC43
        ret

br_1AC43:
        or      bh, 40h
        mov     byte ptr es:[di], bh
        mov     dx, word ptr [G_IMPORT_BAR_TICK]
        mov     word ptr es:[di+1], dx
        mov     byte ptr es:[di+3], cl
        mov     byte ptr es:[di+4], al
        mov     byte ptr es:[di+5], 0
        jmp     seq_event_ptr_next
calls_buffer_process_1ac61:
        call    buffer_process
        dec     al
        or      al, 80h
        mov     byte ptr es:[di], al
        mov     ax, word ptr [G_IMPORT_BAR_TICK]
        mov     word ptr es:[di+1], ax
        mov     al, 0
        mov     byte ptr es:[di+3], al
        mov     byte ptr es:[di+4], al
        mov     byte ptr es:[di+5], al
L_1AC80:
        call    seq_event_ptr_next
        mov     byte ptr es:[di], 0f0h
        mov     byte ptr [G_IMPORT_SYSEX_IDX], 1
        mov     byte ptr [G_IMPORT_SYSEX_OPEN], 1
        ret
L_1AC92:
        mov     bl, byte ptr [G_IMPORT_SYSEX_IDX]
        sub     bh, bh
        mov     byte ptr es:[bx+di], al
        inc     bl
L_1AC9D:
        mov     byte ptr [G_IMPORT_SYSEX_IDX], bl
        cmp     bl, 6
L_1ACA4:
        je      br_1ACA7
        ret
br_1ACA7:
        mov     byte ptr [G_IMPORT_SYSEX_IDX], 0
        jmp     NEAR seq_event_ptr_next
L_1ACAF:
        cmp     byte ptr [G_IMPORT_SYSEX_OPEN], 0
L_1ACB4:
        jne     L_1ACB7
        ret
L_1ACB7:
        mov     byte ptr [G_IMPORT_SYSEX_OPEN], 0
        mov     al, 0f7h
L_1ACBE:
        call    L_1AC92
L_1ACC1:
        mov     al, 0
        cmp     al, byte ptr [G_IMPORT_SYSEX_IDX]
L_1ACC7:
        je      br_1ACCE
L_1ACC9:
        call    L_1AC92
        jmp     SHORT L_1ACC1
br_1ACCE:
        mov     byte ptr [G_IMPORT_SYSEX_OPEN], 0
        mov     byte ptr es:[di], 0c2h
        mov     ax, word ptr [G_IMPORT_BAR_TICK]
        mov     word ptr es:[di+1], ax
        mov     al, 0
        mov     byte ptr es:[di+3], al
        mov     byte ptr es:[di+4], al
        mov     byte ptr es:[di+5], al
        mov     byte ptr [G_IMPORT_SYSEX_OPEN], 0
        jmp     seq_event_ptr_next

calls_buffer_process_1acf4:
        call    buffer_process
        ret
calls_buffer_process_1acf8:
        call    buffer_process
calls_buffer_process_1acfb:
        call    buffer_process
calls_buffer_process_1acfe:
        call    buffer_process
L_1AD01:
        ret

mpc_import_emit_tempo_event:
        cmp     byte ptr [G_IMPORT_TEMPO_LEFT], 0
        je      br_1AD55
        mov     ax, word ptr [G_IMPORT_ABS_TICK_LO]
        mov     dx, word ptr [G_IMPORT_ABS_TICK_HI]
        mov     si, word ptr [PTR_IMPORT_TEMPO_NEXT]
        sub     ax, word ptr [si]
        sbb     dx, word ptr [si+2]
        jb      br_1AD55
        mov     dx, word ptr [G_IMPORT_BAR_TICK]
        sub     dx, ax
        jae     br_1AD25
        sub     dx, dx
br_1AD25:
        cmp     dx, word ptr [G_IMPORT_BAR_LEN]
        je      br_1AD55
        mov     word ptr es:[di+1], dx
        add     word ptr [PTR_IMPORT_TEMPO_NEXT], 6
        dec     byte ptr [G_IMPORT_TEMPO_LEFT]
        mov     ax, word ptr [si+4]
        mov     bx, 3e8h
        mul     bx
        mov     bx, 1000h
        div     bx
        mov     byte ptr es:[di], 0c1h
        mov     word ptr es:[di+3], ax
        mov     byte ptr es:[di+5], 0
L_1AD52:
        call    seq_event_ptr_next
br_1AD55:
        ret
loop_1AD56:
        mov     ax, 0ffh
        jmp     SHORT L_1AD60
loop_1AD5B:
        mov     al, byte ptr [G_IMPORT_FILE_HANDLE]
        mov     ah, 0
L_1AD60:
        mov     sp, word ptr [G_IMPORT_SAVED_SP]
        push    ax
        mov     byte ptr es:[di], 0c0h
        mov     cx, word ptr [G_IMPORT_BAR]
        mov     word ptr es:[di+1], cx
        mov     byte ptr es:[di+3], 4
        mov     byte ptr es:[di+4], 4
        mov     byte ptr es:[di+5], 0
        push    es
        mov     es, word ptr [G_IMPORT_SEQ_SEG]
        mov     word ptr es:[18h], cx
        pop     es
L_1AD8B:
        call    seq_event_ptr_next
        sub     ax, ax
        mov     byte ptr es:[di], 0ffh
        inc     di
        mov     al, 0
loop_1AD97:
        stosb
        test    di, 0fh
        jne     loop_1AD97
        mov     dx, es
        inc     dx
        pop     ax
        clc
        ret


loop_1ADA4:
        mov     sp, word ptr [G_IMPORT_SAVED_SP]
        mov     ax, 1
        stc
        ret
loop_1ADAD:
        mov     sp, word ptr [G_IMPORT_SAVED_SP]
        mov     ax, 2
        stc
        ret

buffer_process:
        push    bx
        push    cx
        push    dx
        push    es
        push    si
        mov     bx, word ptr [G_IMPORT_READ_LEFT_LO]
        mov     cx, word ptr [G_IMPORT_READ_LEFT_HI]
        mov     dx, bx
        or      dx, cx
L_1ADC7:
        je      L_1AE0B
        les     si, [FP_IMPORT_READ]
        mov     al, byte ptr es:[si]
        add     si, 1
        jae     L_1ADDD
        mov     dx, es
        add     dx, 1000h
L_1ADDB:
        mov     es, dx
L_1ADDD:
        mov     word ptr [FP_IMPORT_READ], si
        mov     word ptr [G_IMPORT_READ_SEG], es
        sub     bx, 1
L_1ADE8:
        sbb     cx, 0
        mov     word ptr [G_IMPORT_READ_LEFT_LO], bx
        mov     word ptr [G_IMPORT_READ_LEFT_HI], cx
        or      bx, cx
        jne     loop_1AE05
        mov     word ptr [FP_IMPORT_READ], 0
        mov     bx, word ptr [G_IMPORT_BUF_SEG]
        mov     word ptr [G_IMPORT_READ_SEG], bx
loop_1AE05:
        pop     si
        pop     es
        pop     dx
        pop     cx
        pop     bx
        ret
L_1AE0B:
        mov     bx, word ptr [G_IMPORT_WRAP_LEFT_LO]
        mov     cx, word ptr [G_IMPORT_WRAP_LEFT_HI]
        mov     dx, bx
        or      dx, cx
L_1AE17:
        jne     L_1AE1C
        jmp     NEAR loop_1AD5B
L_1AE1C:
        les     si, [FP_IMPORT_READ]
        mov     al, byte ptr es:[si]
        add     si, 1
        jae     L_1AE30
        mov     dx, es
        add     dx, 1000h
L_1AE2E:
        mov     es, dx
L_1AE30:
        mov     word ptr [FP_IMPORT_READ], si
        mov     word ptr [G_IMPORT_READ_SEG], es
        sub     bx, 1
L_1AE3B:
        sbb     cx, 0
        mov     word ptr [G_IMPORT_WRAP_LEFT_LO], bx
        mov     word ptr [G_IMPORT_WRAP_LEFT_HI], cx
        jmp     SHORT loop_1AE05
calls_buffer_process_1ae48:
        call    buffer_process
        mov     bl, al
calls_buffer_process_1ae4d:
        call    buffer_process
        mov     ah, al
        mov     al, bl
        shl     al, 1
        shr     ax, 1
        ret
seq_event_ptr_next:
        add     di, 6
        cmp     di, 10h
        jb      L_1AE69
        sub     di, 10h
        mov     ax, es
        inc     ax
        mov     es, ax
L_1AE69:
        cmp     ax, word ptr [G_IMPORT_MEM_END_SEG]
L_1AE6D:
        jne     L_1AE72
        jmp     NEAR loop_1ADA4
L_1AE72:
        ret
L_1AE73:
        cmp     word ptr [BUF_FILE_HEADER], 103h
L_1AE79:
        je      mpc60_seq_import
        cmp     word ptr [BUF_FILE_HEADER], 203h
L_1AE81:
        je      mpc60_seq_import
        jmp     NEAR loop_1ADAD
mpc60_seq_import:
        mov     byte ptr [G_IMPORT_IS_MPC60], 1
        mov     word ptr [G_IMPORT_SAVED_SP], sp
        mov     word ptr [G_IMPORT_SEQ_SEG], ax
        mov     word ptr [G_IMPORT_MEM_END_SEG], bx
        mov     word ptr [G_IMPORT_EVT_SEG], dx
        mov     word ptr [G_IMPORT_BAR_TICK], 0
        sub     ax, ax
        mov     word ptr [G_IMPORT_ABS_TICK_LO], ax
        mov     word ptr [G_IMPORT_ABS_TICK_HI], ax
        mov     bl, 5
        mov     bh, byte ptr [G_DISK_DEVICE]
L_1AEAE:
        int     2ch
        cmp     al, 0ffh
L_1AEB2:
        jne     L_1AEB7
        jmp     NEAR loop_1AD56
L_1AEB7:
        mov     byte ptr [B_7DDA], al
        mov     byte ptr [G_IMPORT_FILE_HANDLE], al
        mov     ax, ds
        mov     es, ax
        mov     di, P_7DDB
        mov     cx, 0c9h
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_1AECD:
        int     2ch
L_1AECF:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     di, 2
        mov     si, P_7DE1
        mov     cx, 10h
        rep movsb
        mov     al, byte ptr [B_7DF1]
        and     al, 1
        mov     byte ptr es:[20h], al
        mov     si, P_7DFC
        mov     di, 21h
        lodsb
        mov     byte ptr es:[di+4], al
        lodsb
        mov     byte ptr es:[di+3], al
        lodsb
        mov     byte ptr es:[di+2], al
        lodsb
        mov     byte ptr es:[di+1], al
        lodsb
        mov     byte ptr es:[di], al
        mov     ax, word ptr [W_7DDB]
        mov     dl, byte ptr [W_7DDD]
        mov     dh, 0
        mov     word ptr [G_IMPORT_DATA_LEN_LO], ax
        mov     word ptr [G_IMPORT_DATA_LEN_HI], dx
        mov     bx, word ptr [MZ_RELOC_COUNT]
        mov     cl, byte ptr [P_7DE0]
        mov     ch, 0
        mov     word ptr [G_IMPORT_WRAP_LEFT_LO], bx
        mov     word ptr [G_IMPORT_WRAP_LEFT_HI], cx
        pusha
        mov     cx, 4
L_1AF2B:
        shr     dx, 1
        rcr     ax, 1
        loop    L_1AF2B
        inc     ax
        push    ax
        add     ax, word ptr [G_IMPORT_EVT_SEG]
        cmp     ax, word ptr [G_IMPORT_MEM_END_SEG]
        pop     ax
L_1AF3C:
        jb      br_1AF41
        jmp     NEAR loop_1ADA4
br_1AF41:
        mov     bx, word ptr [G_IMPORT_MEM_END_SEG]
        sub     bx, ax
        mov     word ptr [G_IMPORT_BUF_SEG], bx
        popa
        sub     ax, bx
        sbb     dx, cx
        mov     word ptr [G_IMPORT_READ_LEFT_LO], ax
        mov     word ptr [G_IMPORT_READ_LEFT_HI], dx
        mov     ax, word ptr [W_7DFA]
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     word ptr es:[TBL_0014], ax
        mov     cl, byte ptr [B_7EA3]
        sub     ch, ch
loop_1AF68:
        push    cx
        mov     cx, 15h
        cmp     byte ptr [B_7DD9], 1
        je      L_1AF76
        mov     cx, 18h
L_1AF76:
        mov     ax, ds
        mov     es, ax
        mov     di, P_7ED8
        push    di
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_1AF84:
        int     2ch
L_1AF86:
        pop     bp
L_1AF87:
        mov     al, byte ptr [bp]
        dec     al
        cmp     al, 40h
        jae     L_1AFE2
        mov     bl, al
        sub     bh, bh
        mov     cx, 10h
        mul     cl
        add     ax, 30h
        mov     di, ax
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     si, bp
        add     si, 5
        rep movsb
        mov     al, byte ptr [bp+3]
        cmp     byte ptr [B_7DD9], 2
        je      br_1AFB6
L_1AFB3:
        call    word_count_trailing_zeros
br_1AFB6:
        and     al, 1fh
        or      al, 20h
        or      al, 80h
        test    byte ptr [bp+2], 4
        je      br_1AFC8
        or      al, 40h
        and     al, 0f0h
        and     al, 0dfh
br_1AFC8:
        mov     byte ptr es:[bx+TRK_CHANNEL], al
        mov     byte ptr es:[bx+TRK_STATUS], 3
        cmp     byte ptr [B_7DD9], 1
        je      L_1AFE2
        mov     al, byte ptr [bp+16h]
        mov     byte ptr es:[bx+470h], al
L_1AFE2:
        pop     cx
        dec     cx
L_1AFE4:
        je      L_1AFE8
        jmp     SHORT loop_1AF68
L_1AFE8:
        mov     ax, ds
        mov     es, ax
        mov     di, P_9DD8
        mov     al, byte ptr [B_7EA2]
        mov     byte ptr [G_IMPORT_TEMPO_LEFT], al
        dec     byte ptr [G_IMPORT_TEMPO_LEFT]
        mov     ah, 6
        mul     ah
        mov     cx, ax
        mov     bl, 6
        mov     bh, byte ptr [G_DISK_DEVICE]
L_1B005:
        int     2ch
L_1B007:
        mov     word ptr [PTR_IMPORT_TEMPO_NEXT], P_9DDE
        jmp     NEAR loop_1A9E5
word_count_trailing_zeros:
        mov     dx, word ptr [bp+3]
        mov     cx, 10h
        mov     al, 0
tgt_1B018:
        shr     dx, 1
        jb      L_1B020
        inc     al
        loop    tgt_1B018
L_1B020:
        ret
        db      00h
midi_file_save_far:
        call    midi_file_save
        retf
midi_file_save:
        mov     bx, ds
        mov     es, bx
L_1B02A:
        mov     di, P_7514
        mov     cx, 10h
        rep movsb
        mov     byte ptr [P_74F3], al
        dec     al
        mov     byte ptr [G_MIDI_FORMAT_DEC], al
L_1B03A:
        je      br_1B05B
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     si, 430h
        mov     cx, 40h
        mov     di, P_74AA
L_1B049:
        mov     al, byte ptr es:[si]
        and     al, 0fh
        mov     byte ptr [di], al
L_1B050:
        inc     si
        inc     di
        loop    L_1B049
        mov     byte ptr [P_74F5], 1
        jmp     SHORT L_1B077
br_1B05B:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     si, 4f0h
        mov     al, 0
        mov     cx, 40h
tgt_1B067:
        test    byte ptr es:[si], 1
        je      br_1B06F
        inc     al
br_1B06F:
        inc     si
        loop    tgt_1B067
        inc     al
        mov     byte ptr [P_74F5], al
L_1B077:
        call    midi_file_fill_conductor_meta
        sub     ax, ax


        if      FW_VERSION = 172
        mov     word ptr [D_74A6], ax
        mov     word ptr [D_74A8], ax
        mov     word ptr [P_7292], ax
        mov     word ptr [P_7294], ax
L_1B08D                         equ     $+5
        else
        mov     word ptr [P_7292], ax
        mov     word ptr [P_7294], ax
        endif
        mov     word ptr [G_MIDI_TRK_LEN_LO], 0
        if      FW_VERSION = 172
L_1B093                         equ     $+5
        endif
        mov     word ptr [G_MIDI_TRK_LEN_HI], 0
        mov     byte ptr [G_MIDI_EXPORT_TRK], 0ffh
        mov     word ptr [PTR_MIDI_FLUSH_FN], L_1B3A3
        call    midi_file_track_state_reset
        mov     ax, word ptr [G_MIDI_TRK_LEN_LO]
        mov     bx, word ptr [G_MIDI_TRK_LEN_HI]
        sub     ax, 16h
        sbb     bx, 0
        mov     byte ptr [P_74FC], bh
        mov     byte ptr [P_74FD], bl
        mov     byte ptr [P_74FE], ah
        mov     byte ptr [P_74FF], al
L_1B0BE:
        call    midi_file_fill_conductor_meta
        sub     ax, ax
        mov     word ptr [P_7292], ax
        mov     word ptr [P_7294], ax
        mov     word ptr [PTR_MIDI_FLUSH_FN], L_1B3B5
        call    midi_file_track_state_reset
        cmp     byte ptr [G_MIDI_FORMAT_DEC], 0ffh
        if      FW_VERSION = 172
        mov     ax, word ptr [D_74A6]
        mov     dx, word ptr [D_74A8]
        endif
L_1B0DE:
        jne     L_1B0E1
        ret
L_1B0E1:
        mov     byte ptr [G_MIDI_EXPORT_TRK], 0
L_1B0E6:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bl, byte ptr [G_MIDI_EXPORT_TRK]
        sub     bh, bh
        mov     al, byte ptr es:[bx+TRK_CHANNEL]
        and     al, 0fh
        mov     byte ptr [G_MIDI_EXPORT_CHAN], al
        test    byte ptr es:[bx+TRK_STATUS], 1
        je      br_1B11C
        sub     ax, ax
        mov     word ptr [G_MIDI_TRK_LEN_LO], ax
        mov     word ptr [G_MIDI_TRK_LEN_HI], ax
        mov     word ptr [PTR_MIDI_FLUSH_FN], L_1B3A3
L_1B110:
        call    midi_file_write_track_header
        mov     word ptr [PTR_MIDI_FLUSH_FN], L_1B3B5
L_1B119:
        call    midi_file_write_track_header
br_1B11C:
        inc     byte ptr [G_MIDI_EXPORT_TRK]
        cmp     byte ptr [G_MIDI_EXPORT_TRK], 40h
        jne     L_1B0E6
        if      FW_VERSION = 172
        mov     ax, word ptr [D_74A6]
        mov     dx, word ptr [D_74A8]
        endif
        ret
midi_file_fill_conductor_meta:
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     ax, word ptr es:[TBL_0014]
        sub     dx, dx
L_1B139:
        call    midi_tempo_to_usec_per_qn
        mov     byte ptr [P_7550], dl
        mov     byte ptr [P_7551], ah
        mov     byte ptr [P_7552], al
        if      FW_VERSION = 172
        push    es
        mov     es, word ptr [SEQ_EVENTS_SEG]
        mov     ax, word ptr es:[3]
        pop     es
        else
        mov     al, byte ptr es:[1ah]
        endif
        mov     byte ptr [P_7557], al
        if      FW_VERSION = 172
        mov     al, ah
        else
        mov     al, byte ptr es:[1bh]
        endif
        mov     ah, 2
        cmp     al, 4
        je      br_1B16A
        mov     ah, 3
        cmp     al, 8
        je      br_1B16A
        mov     ah, 4
        cmp     al, 10h
        je      br_1B16A
        mov     ah, 5
br_1B16A:
        mov     byte ptr [P_7558], ah
        mov     ax, 4646h
        cmp     byte ptr es:[20h], 0
        je      br_1B17C
        mov     ax, 204eh
br_1B17C:
        mov     word ptr [P_752E], ax
        mov     ax, word ptr es:[1ch]
        call    format_decimal3_ascii
        mov     byte ptr [P_7537], bh
        mov     byte ptr [P_7538], al
        mov     byte ptr [P_7539], ah
        mov     ax, word ptr es:[1eh]
        mov     byte ptr [P_753F], 45h
        mov     byte ptr [P_7540], 4eh
        mov     byte ptr [P_7541], 44h
        cmp     ax, 0ffffh
        je      br_1B1B7
        call    format_decimal3_ascii
        mov     byte ptr [P_753F], bh
        mov     byte ptr [P_7540], al
        mov     byte ptr [P_7541], ah
br_1B1B7:
        mov     ax, 4646h
        cmp     byte ptr es:[16h], 0
        je      br_1B1C5
        mov     ax, 204eh
br_1B1C5:
        mov     word ptr [P_754A], ax
        mov     al, byte ptr es:[21h]
        mov     byte ptr [P_755F], al
        mov     al, byte ptr es:[TBL_0022]
        mov     byte ptr [P_7560], al
        mov     al, byte ptr es:[23h]
        mov     byte ptr [D_7561], al
        mov     al, byte ptr es:[24h]
        mov     byte ptr [P_7562], al
        mov     al, byte ptr es:[25h]
        mov     byte ptr [P_7563], al
        mov     si, STR_MIDI_MTHD
        mov     ax, ds
        mov     es, ax
        mov     di, P_7DD8
        mov     cx, 7ah
        rep movsb
        ret
format_decimal3_ascii:
        cmp     ax, 3e7h
        jb      br_1B203
        mov     ax, 3e7h

br_1B203:
        mov     bl, 64h
        div     bl
        mov     bh, al
        mov     al, ah
        mov     ah, 0
        mov     bl, 0ah
        div     bl
        or      ax, 3030h
        or      bh, 30h
        ret
midi_tempo_to_usec_per_qn:
        push    di
        push    si
        push    bp
        mov     di, ax
        mov     si, dx
        mov     dx, 23c3h
        mov     ax, 4600h
        nop
        push    cs
        call    state_check_104FB
        pop     bp
        pop     si
        pop     di
        ret
midi_file_write_track_header:
        mov     ax, word ptr [G_MIDI_TRK_LEN_LO]
        mov     cx, word ptr [G_MIDI_TRK_LEN_HI]
        sub     ax, 8
        sbb     cx, 0
        mov     byte ptr [P_7569], ch
        mov     byte ptr [P_756A], cl
        mov     byte ptr [P_756B], ah
        mov     byte ptr [P_756C], al
        mov     es, word ptr [CUR_SEQ_SEG]
        mov     bl, byte ptr [G_MIDI_EXPORT_TRK]
        mov     bh, 0
        push    bx
        shl     bx, 4
        mov     si, 30h
        add     si, bx
        mov     di, P_7571
        mov     cx, 10h
L_1B263:
        mov     al, byte ptr es:[si]
        inc     si
        mov     byte ptr [di], al
        inc     di
        loop    L_1B263
        pop     bx
        mov     al, bl
L_1B26F:
        call    byte_to_hex_ascii
        mov     byte ptr [P_7590], ah
        mov     byte ptr [P_7591], al
        mov     al, byte ptr es:[bx+TRK_CHANNEL]
L_1B27E:
        call    byte_to_hex_ascii
        mov     byte ptr [P_7592], ah
        mov     byte ptr [P_7593], al
        mov     al, byte ptr es:[bx+470h]
L_1B28D:
        call    byte_to_hex_ascii
        mov     byte ptr [P_7594], ah
        mov     byte ptr [P_7595], al
        mov     al, byte ptr es:[bx+TRK_VELOCITY]
L_1B29C:
        call    byte_to_hex_ascii
        mov     byte ptr [P_7596], ah
        mov     byte ptr [P_7597], al
        mov     al, byte ptr es:[bx+TRK_STATUS]
L_1B2AB:
        call    byte_to_hex_ascii
        mov     byte ptr [P_7598], ah
        mov     byte ptr [P_7599], al
        mov     ax, ds
        mov     es, ax
        mov     si, STR_MIDI_MTRK
        mov     di, P_7DD8
        mov     cx, 40h
        rep movsb
midi_file_track_state_reset:
        push    di
        mov     ax, ds
        mov     es, ax
        mov     di, P_729E
        mov     cx, 80h
        sub     ax, ax
        rep stosw
        mov     word ptr [G_MIDI_NEXT_NOTEOFF], 0ffffh
        sub     ax, ax
        mov     word ptr [G_MIDI_TIMESIG], ax
        mov     word ptr [P_7292], ax
        mov     word ptr [P_7294], ax
        mov     byte ptr [G_MIDI_RUNNING_STATUS], al
        mov     word ptr [G_MIDI_TRK_LEN_LO], ax
        mov     word ptr [G_MIDI_TRK_LEN_HI], ax
        mov     dh, 0
        mov     es, word ptr [SEQ_EVENTS_SEG]
        sub     si, si
        mov     bx, word ptr es:[si+3]
        mov     word ptr [G_MIDI_TIMESIG], bx
        cmp     bh, 4
        jae     br_1B304
        mov     bh, 4
br_1B304:
        cmp     bl, 0
        jne     br_1B30B
        mov     bl, 4
br_1B30B:
        mov     ax, 180h
        div     bh
        mul     bl
        mov     word ptr [G_MIDI_BAR_TICKS], ax
        add     si, 6
        pop     di
        sub     bp, bp
L_1B31B:
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
L_1B320:
        je      br_1B366
        test    byte ptr es:[si+5], 80h
        jne     L_1B347
        mov     ah, al
        cmp     byte ptr [G_MIDI_FORMAT_DEC], 0
        je      br_1B33D
        and     al, 3fh
        mov     bx, P_74AA
        xlat
        mov     byte ptr [G_MIDI_EXPORT_CHAN], al
        mov     al, ah
br_1B33D:
        and     ah, 3fh
        or      ah, byte ptr [G_MIDI_FORMAT_DEC]
        call    L_1B409
L_1B347:
        add     si, 6
        if      FW_VERSION = 150
L_1B972:
        endif
        cmp     si, 10h
L_1B34D:
        jb      calls_word_1b359
        sub     si, 10h
        mov     ax, es
        inc     ax
        mov     es, ax
        db      0ebh, 0f1h
calls_word_1b359:
        cmp     di, P_9CD8
        jb      L_1B31B
        call    word ptr [PTR_MIDI_FLUSH_FN]
        jae     L_1B31B
        ret
br_1B366:
        call    midi_file_flush_note_offs
        mov     ax, word ptr [P_7292]
        mov     bx, word ptr [P_7294]
        call    midi_file_write_varlen
        mov     bx, P_729E
        cmp     word ptr [bx], 0
        je      L_1B392
        call    L_1B71D
L_1B37E:
        mov     bx, P_729E
        cmp     word ptr [bx], 0
L_1B384:
        je      br_1B38E
        mov     cx, 0
L_1B389:
        call    fn_1B712
        jmp     SHORT L_1B37E
br_1B38E:
        mov     byte ptr [di], 0
        inc     di
L_1B392:
        mov     byte ptr [di], 0ffh
        inc     di
        mov     byte ptr [di], 2fh
        inc     di
        mov     byte ptr [di], 0
        inc     di
        call    word ptr [PTR_MIDI_FLUSH_FN]
        ret
L_1B3A3:
        sub     di, P_7DD8
        add     word ptr [G_MIDI_TRK_LEN_LO], di
        adc     word ptr [G_MIDI_TRK_LEN_HI], 0
        mov     di, P_7DD8
        clc
        ret
L_1B3B5:
        sub     di, P_7DD8
        mov     cx, di
        if      FW_VERSION = 172
        add     word ptr [D_74A6], cx
        adc     word ptr [D_74A8], 0
        endif
        pusha
        push    es
        mov     ax, ds
        mov     es, ax
        mov     si, P_7DD8
        mov     bl, 9
        mov     bh, byte ptr [G_DISK_DEVICE]
L_1B3D3:
        int     2ch
L_1B3D5:
        jae     br_1B3DA
        jmp     NEAR bc_int2a_1b764
br_1B3DA:
        pop     es
        popa
        mov     di, P_7DD8
        ret
byte_to_hex_ascii:
        push    bx
        sub     bx, bx
        mov     bl, al
        shr     bl, 4
L_1B3E8:
        mov     ah, byte ptr cs:[bx+L_1B3F9]
        mov     bl, al
        and     bl, 0fh
        mov     al, byte ptr cs:[bx+L_1B3F9]
        pop     bx
        ret
L_1B3F9:
        db      "0123456789ABCDEF"
L_1B409:
        cmp     al, 0c0h
L_1B40B:
        je      L_1B40F
        jmp     SHORT L_1B48A
L_1B40F:
        mov     ax, word ptr [G_MIDI_BAR_TICKS]
        sub     ax, bp
        sub     bp, bp
        add     word ptr [P_7292], ax
        adc     word ptr [P_7294], 0
        mov     ax, word ptr es:[si+3]
        mov     bx, ax
        xchg    word ptr [G_MIDI_TIMESIG], ax
        cmp     ax, bx
L_1B42B:
        jne     br_1B42E
        ret
br_1B42E:
        cmp     bh, 4
        jae     br_1B435
        mov     bh, 4
br_1B435:
        cmp     bl, 0
        jne     L_1B43C
        mov     bl, 4
L_1B43C:
        mov     ax, 180h
        div     bh
        mul     bl
        mov     word ptr [G_MIDI_BAR_TICKS], ax
        cmp     byte ptr [G_MIDI_EXPORT_TRK], 0ffh
L_1B44B:
        je      br_1B44E
        ret
br_1B44E:
        sub     ax, ax
        call    L_1B65A
        mov     byte ptr [di], 0ffh
        inc     di
        mov     byte ptr [di], 58h
        inc     di
        mov     byte ptr [di], 4
        inc     di
        mov     al, byte ptr es:[si+3]
        mov     byte ptr [di], al
        inc     di
        mov     al, byte ptr es:[si+4]
        mov     ah, 2
        cmp     al, 4
        je      br_1B47E
        mov     ah, 3
        cmp     al, 8
        je      br_1B47E
        mov     ah, 4
        cmp     al, 10h
        je      br_1B47E
        mov     ah, 5
br_1B47E:
        mov     byte ptr [di], ah
        inc     di
        mov     byte ptr [di], 18h
        inc     di
        mov     byte ptr [di], 8
        inc     di
        ret
L_1B48A:
        cmp     al, 0c1h
        jne     L_1B4F4
        cmp     byte ptr [G_MIDI_EXPORT_TRK], 0ffh
L_1B493:
        je      L_1B496
        ret
L_1B496:
        call    midi_file_emit_delta
        push    dx
        push    bx
        push    es
        mov     bx, word ptr es:[si+3]
        mov     dh, 0
        mov     dl, byte ptr [P_7550]
        mov     ah, byte ptr [P_7551]
        mov     al, byte ptr [P_7552]
        push    di
        push    si
        push    bp
        mov     cx, 3e8h
L_1B4B3:
        call    midi_file_mul32x16
        mov     di, bx
        sub     si, si
        nop
        push    cs
        call    state_check_104FB
        sub     ax, 64h
        sbb     dx, 0
        pop     bp
        pop     si
        pop     di
        mov     byte ptr [di], 0ffh
        inc     di
        mov     byte ptr [di], 51h
        inc     di
        mov     byte ptr [di], 3
        inc     di
        mov     byte ptr [di], dl
        inc     di
        mov     byte ptr [di], ah
        inc     di
        mov     byte ptr [di], al
        inc     di
        pop     es
        pop     bx
        pop     dx
        ret
midi_file_mul32x16:
        mov     bp, dx
        mul     cx
        mov     di, ax
        mov     si, dx
        mov     ax, bp
        mul     cx
        add     si, ax
        mov     dx, si
        mov     ax, di
        ret
L_1B4F4:
        and     al, 0c0h
        cmp     al, 0
        jne     L_1B561
        cmp     ah, byte ptr [G_MIDI_EXPORT_TRK]
        jne     L_1B560
L_1B500:
        call    midi_file_emit_delta
        mov     al, 90h
        or      al, byte ptr [G_MIDI_EXPORT_CHAN]
        mov     dl, al
        cmp     al, byte ptr [G_MIDI_RUNNING_STATUS]
        je      br_1B517
        mov     byte ptr [G_MIDI_RUNNING_STATUS], al
        mov     byte ptr [di], al
        inc     di
br_1B517:
        mov     al, byte ptr es:[si+4]
        mov     dh, al
        and     al, 7fh
        mov     byte ptr [di], al
        inc     di
        mov     al, byte ptr es:[si+5]
        mov     byte ptr [di], al
        inc     di
        mov     ah, byte ptr es:[si+2]
        shl     dh, 1
        rcr     ah, 1
        shr     ah, 2
        mov     al, byte ptr es:[si+3]
        mov     bx, P_729E
        mov     cx, 80h
tgt_1B53E:
        cmp     word ptr [bx], 0
        je      br_1B549
        add     bx, 4
        loop    tgt_1B53E
        ret
br_1B549:
        cmp     ax, word ptr [G_MIDI_NEXT_NOTEOFF]
        jae     br_1B552
        mov     word ptr [G_MIDI_NEXT_NOTEOFF], ax
br_1B552:
        mov     word ptr [bx], ax
        mov     al, dh
        shr     al, 1
        and     dl, 8fh
        mov     ah, dl
        mov     word ptr [bx+2], ax
L_1B560:
        ret
L_1B561:
        cmp     al, 40h
        jne     L_1B5C5
        cmp     ah, byte ptr [G_MIDI_EXPORT_TRK]
        jne     br_1B599
L_1B56B:
        call    midi_file_emit_delta
        mov     al, byte ptr es:[si+3]
        mov     ah, al
        and     ax, 3f0h
        cmp     al, 80h
L_1B579:
        jne     br_1B59A
        mov     byte ptr [G_MIDI_RUNNING_STATUS], 0
        mov     al, 80h
        or      al, byte ptr [G_MIDI_EXPORT_CHAN]
        mov     byte ptr [di], al
        inc     di
        mov     al, byte ptr es:[si+3]
        and     al, 3
        mov     byte ptr [di], al
        inc     di
        mov     al, byte ptr es:[si+5]
        mov     byte ptr [di], al
        inc     di
br_1B599:
        ret
br_1B59A:
        mov     ah, al
        or      al, byte ptr [G_MIDI_EXPORT_CHAN]
        cmp     al, byte ptr [G_MIDI_RUNNING_STATUS]
        je      br_1B5AC
        mov     byte ptr [G_MIDI_RUNNING_STATUS], al
        mov     byte ptr [di], al
        inc     di
br_1B5AC:
        mov     al, byte ptr es:[si+4]
        mov     byte ptr [di], al
        inc     di
        cmp     ah, 0c0h
        je      br_1B5C4
        cmp     ah, 0d0h
        je      br_1B5C4
        mov     al, byte ptr es:[si+5]
        mov     byte ptr [di], al
        inc     di
br_1B5C4:
        ret
L_1B5C5:
        cmp     ah, byte ptr [G_MIDI_EXPORT_TRK]
L_1B5C9:
        je      L_1B5CE
        jmp     NEAR br_1B651
L_1B5CE:
        call    midi_file_emit_delta
        mov     byte ptr [G_MIDI_RUNNING_STATUS], 0
        mov     bx, word ptr es:[si+3]
        mov     cl, byte ptr es:[si+5]
        sub     bx, 1
L_1B5E1:
        sbb     cl, 0
        add     si, 6
        mov     al, byte ptr es:[si]
        mov     byte ptr [di], al
        inc     si
        inc     di
        shl     bx, 1
        rcl     cl, 1
        shr     bl, 1
        shl     bh, 1
        rcl     cl, 1
        shr     bh, 1
        cmp     cl, 0
        je      L_1BC24
        or      cl, 80h
        or      bh, 80h
L_1BC24:



        cmp     bh, 0
        je      L_1B60D
        or      bh, 80h
L_1B60D:
        test    cl, 80h
        je      L_1B615
        mov     byte ptr [di], cl
        inc     di
L_1B615:
        test    bh, 80h
        je      br_1B61D
        mov     byte ptr [di], bh
        inc     di
br_1B61D:
        mov     byte ptr [di], bl
        inc     di
loop_1B620:
        mov     al, byte ptr es:[si]
        mov     byte ptr [di], al
        inc     si
        inc     di
        cmp     di, P_9CD8
        jb      br_1B634
        call    word ptr [PTR_MIDI_FLUSH_FN]
        jae     br_1B634
        ret
br_1B634:
        cmp     al, 0f7h
        jne     loop_1B620
L_1B638:
        mov     al, byte ptr es:[si]
        cmp     al, 0c2h
L_1B63D:
        je      L_1B642
        inc     si
        jmp     SHORT L_1B638
L_1B642:
        mov     bx, si
        shr     bx, 4
L_1B647:
        mov     ax, es
        add     ax, bx
L_1B64B:
        mov     es, ax
        and     si, 0fh
        ret
br_1B651:
        add     si, 6
        jmp     SHORT L_1B638
midi_file_emit_delta:
        mov     ax, word ptr es:[si+1]
L_1B65A:
        and     ah, 7
        mov     bx, ax
        xchg    bx, bp
        sub     ax, bx
        add     word ptr [P_7292], ax
        adc     word ptr [P_7294], 0
L_1B66C:
        call    midi_file_flush_note_offs
        mov     ax, word ptr [P_7292]
        mov     bx, word ptr [P_7294]
        call    midi_file_write_varlen
        mov     word ptr [P_7292], 0
        mov     word ptr [P_7294], 0
        ret
midi_file_write_varlen:
        test    bx, 0fe0h
        jne     L_1B69D
        mov     bh, bl
        mov     bl, ah
        test    bx, 1fc0h
        jne     L_1B6AD
        test    ax, 3f80h
        jne     L_1BCD5
        jmp     L_1BCDF
L_1B69D:
        shl     bx, 3
        or      bh, 80h
        mov     byte ptr [di], bh
        inc     di
        shr     bx, 3
L_1B6A9:
        mov     bh, bl
        mov     bl, ah
L_1B6AD:
        shl     bx, 2
        or      bh, 80h
        mov     byte ptr [di], bh
        inc     di
L_1BCD5:
        shl     ax, 1
        or      ah, 80h
        mov     byte ptr [di], ah
        inc     di
        shr     ax, 1
L_1BCDF:
        and     al, 7fh
        mov     byte ptr [di], al
        inc     di
        ret
midi_file_flush_note_offs:
        mov     bx, P_729E
        mov     dx, 0ffffh
        mov     ax, word ptr [bx]
        or      ax, ax
L_1B6D0:
        je      L_1BD2C
        cmp     word ptr [P_7294], 0
L_1B6D7:
        jne     br_1B6E3
        mov     cx, word ptr [P_7292]
        cmp     cx, word ptr [G_MIDI_NEXT_NOTEOFF]
L_1B6E1:
        jb      L_1B74A
br_1B6E3:
        mov     cx, word ptr [G_MIDI_NEXT_NOTEOFF]
        sub     word ptr [P_7292], cx
        sbb     word ptr [P_7294], 0
L_1B6F0:
        sub     ax, word ptr [G_MIDI_NEXT_NOTEOFF]
        je      fn_1B712
        mov     word ptr [bx], ax
        cmp     ax, dx
        jae     L_1B6FE
L_1B6FC:
        mov     dx, ax
L_1B6FE:
        add     bx, 4
loop_1B701:
        mov     ax, word ptr [bx]
        or      ax, ax
        jne     L_1B6F0
        mov     word ptr [G_MIDI_NEXT_NOTEOFF], dx
        jmp     SHORT midi_file_flush_note_offs
L_1BD2C:
        mov     word ptr [G_MIDI_NEXT_NOTEOFF], dx
        ret
fn_1B712:
        push    bx
        mov     ax, cx
        sub     bx, bx
        call    midi_file_write_varlen
        pop     bx
        sub     cx, cx
L_1B71D:
        mov     ax, word ptr [bx+2]
        cmp     ah, byte ptr [G_MIDI_RUNNING_STATUS]
        je      L_1B72C
        mov     byte ptr [G_MIDI_RUNNING_STATUS], al
        mov     byte ptr [di], ah
        inc     di
L_1B72C:
        mov     byte ptr [di], al
        inc     di
        mov     al, 40h
        mov     byte ptr [di], al
        inc     di
        push    bx

loop_1B735:
        mov     ax, word ptr [bx+4]
        mov     word ptr [bx], ax
        mov     ax, word ptr [bx+6]
        mov     word ptr [bx+2], ax
        add     bx, 4
        or      ax, ax
        jne     loop_1B735
        pop     bx
        jmp     loop_1B701
L_1B74A:
        mov     ax, word ptr [bx]
        or      ax, ax
L_1B74E:
        je      br_1B75F
        sub     ax, cx
        mov     word ptr [bx], ax
        cmp     ax, dx
        jae     br_1B75A
L_1B758:
        mov     dx, ax
br_1B75A:
        add     bx, 4
        jmp     SHORT L_1B74A
br_1B75F:
        mov     word ptr [G_MIDI_NEXT_NOTEOFF], dx
        ret
bc_int2a_1b764:
        cmp     al, 3
bc_int2a_1b766:
        je      error_write_error_1b785
bc_int2a_1b768:
        INT_2A "       Write error !!     "
error_write_error_1b785:
        cmp     byte ptr [G_DISK_DEVICE], 9
L_1B78A:
        jne     error_f_rom_full_1b7a9
L_1B78C:
        if      FW_VERSION = 150
L_1BDBC                         equ     $+17
        endif
        INT_2A "       F-ROM full  !!     "
        if      FW_VERSION = 150
isr_1B7C7:
        endif
error_f_rom_full_1b7a9:
        INT_2A "        Disk full  !!     "
        if      FW_VERSION = 150
        db      00h
        endif
error_disk_full_1b7c6:
        sti
        if      FW_VERSION = 172
isr_1B7C7:
        endif
        mov     bp, DATA_SEG
        mov     ds, bp
        sub     bh, bh
        shl     bx, 1
        add     bx, TBL_FROM_SERVICE
        call    word ptr cs:[bx]
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
TBL_FROM_SERVICE:
        if      FW_VERSION = 172
        dw      from_svc_invalid, from_detect, from_svc_02, from_svc_03
        else
        dw      from_svc_invalid, L_1B85B, from_file_find_first, from_file_find_next
        endif
        dw      from_svc_04, from_svc_05, from_svc_06, from_svc_07
        dw      from_svc_08, from_stream_write, from_svc_0a, from_svc_invalid
        dw      from_svc_0c, from_free_bytes, from_svc_0e, from_svc_invalid
        dw      from_svc_invalid, from_svc_11, from_svc_invalid, from_svc_13
        dw      from_svc_14, from_svc_15, from_svc_16, from_svc_invalid
        dw      from_svc_invalid, from_svc_19, from_svc_invalid, error_f_rom_write_1be18
        dw      from_svc_1c, from_svc_1d, bc_int2a_1b827
from_svc_invalid:
        mov     ax, 20h
        sub     dx, dx
        stc
L_1BE46:
        ret
bc_int2a_1b827:
        mov     al, 2
        ret
L_1BE4A:
        INT_2A "     F-ROM data error !!  "
error_f_rom_data_1b847:
        db      0e8h
        add     word ptr [bx+si], ax
        retf
        if      FW_VERSION = 172
from_detect:
        mov     ax, 0f000h
        mov     es, ax
        mov     di, 0
        mov     ax, 0
        mov     cx, 20h
        rep stosw
        endif
L_1B85B:
        call    from_read_chip_id
        cmp     al, 89h
L_1B860:
        jne     br_1B89A
        cmp     bx, 66a0h
L_1B866:
        jne     br_1B89A
        mov     ax, 100h
        mov     es, ax
        mov     di, 0
        mov     si, P_75C4
        mov     cx, 8
        push    ds
        pusha
calls_dma_transfer_init_1b878:
        call    dma_transfer_init
        popa
        pop     ds
        mov     si, P_75CC
        call    fn_10736
        db      "MPC2000", 0
        if      FW_VERSION = 172
        jb      L_1B894
L_1B88D:
        call    from_build_directory
        mov     al, 22h
        clc
        ret
L_1B894:
        mov     al, 21h
        else
        mov     al, 22h
        jae     L_1B894
        mov     al, 21h
L_1B894:
        endif
        mov     bl, 0
        clc
        ret
br_1B89A:
        mov     al, 20h
        mov     bl, 0
        stc
        if      FW_VERSION = 172
        ret
from_build_directory:
        mov     ax, 0f000h
        mov     es, ax
        mov     di, 0
        push    di
        push    es
L_1B8AA:
        call    from_file_find_first
        pop     es
        pop     di
L_1B8AF:
        jb      L_1B8C4
L_1B8B1:
        mov     si, P_76C4
        mov     cx, 20h
        rep movsb
        push    di
        push    es
L_1B8BB:
        call    from_file_find_next
        pop     es
        pop     di
L_1B8C0:
        jb      L_1B8C4
        jmp     L_1B8B1
L_1B8C4:
        mov     al, 0
        mov     cx, 20h
        rep stosb
        endif
        ret
from_file_find_first:
        cmp     byte ptr [G_FROM_CARD_STATE], 22h
L_1B8D1:
        jne     br_1B90D
L_1B8D3:
        call    from_file_read_first_header
        jmp     L_1B8E4
from_file_find_next:
        if      FW_VERSION = 172
        cmp     byte ptr [G_FROM_CARD_STATE], 22h
L_1B8DD:
        jne     br_1B90D
        else
        call    L_1B85B
        jae     L_1B8DF
from_file_find_next_V150:
        ret
        endif
L_1B8DF:
        call    from_file_advance_header
L_1B8E2:
        jb      br_1B90D
L_1B8E4:
        mov     si, P_76C4
        cmp     byte ptr [si], 0ffh
L_1B8EA:
        je      br_1B90D
        cmp     byte ptr [si], 0
        if      FW_VERSION = 172
L_1B8EF:
        endif
        je      from_file_find_next
        if      FW_VERSION = 150
L_1B8EF:
        endif
        mov     di, P_76E4
        if      FW_VERSION = 172
        db      0e8h, 25h, 57h
        else
        db      0e8h
        db      0edh, 59h
        endif
        sub     bx, 20h
L_1B8FA:
        sbb     dx, 0
        mov     cx, word ptr [G_FROM_FILE_ADDR_LO]
        mov     bp, word ptr [G_FROM_FILE_ADDR_HI]
        inc     byte ptr [G_FROM_FILE_INDEX]
        sub     ax, ax
        clc
        ret
br_1B90D:
        mov     di, P_76E4
        mov     si, di
        mov     ax, ds
        mov     es, ax
        push    di
        mov     cx, 14h
        mov     al, 20h
        rep stosb
        pop     di
        sub     dx, dx
        sub     bx, bx
        mov     ax, 0ffffh
        stc
        ret
from_file_advance_header:
        cmp     byte ptr [W_76C4], 0ffh
        stc
L_1B92E:
        jne     L_1B931
        ret
L_1B931:
        mov     ax, word ptr [G_FROM_DIRENT_LEN_LO]
        mov     dx, word ptr [G_FROM_DIRENT_LEN_HI]
        mov     bx, ax
        or      bx, dx
L_1B93C:
        jne     L_1B941
        jmp     L_1BE4A
L_1B941:
        mov     bx, ax
L_1B943:
        and     bx, dx
        inc     bx
L_1B946:
        jne     L_1B94B
        jmp     L_1BE4A
L_1B94B:
        cmp     byte ptr [G_FROM_DIRENT_ATTR], 20h
        je      br_1B955
        jmp     L_1BE4A
br_1B955:
        cmp     al, 0
        je      br_1B95F
        add     ax, 100h
        adc     dx, 0
br_1B95F:
        mov     al, 0
        shr     dx, 1
        rcr     ax, 1
        add     ax, word ptr [G_FROM_FILE_ADDR_LO]
        adc     dx, word ptr [G_FROM_FILE_ADDR_HI]
        if      FW_VERSION = 150
        jae     L_1B96D
        jmp     L_1BE4A
        endif
L_1B96D:
        if      FW_VERSION = 172
        jae     L_1B972
        jmp     L_1BE4A
L_1B972:
        endif
        cmp     dx, 140h
        jb      L_1B97B
        jmp     L_1BE4A
L_1B97B:
        mov     word ptr [G_FROM_FILE_ADDR_LO], ax
        mov     word ptr [G_FROM_FILE_ADDR_HI], dx
        mov     di, ax
        mov     es, dx
        mov     si, P_76C4
        mov     cx, 10h
calls_dma_transfer_init_1b98c:
        call    dma_transfer_init
        clc
        ret
from_file_read_first_header:
        mov     ax, 0
        mov     dx, 103h
        mov     word ptr [G_FROM_FILE_ADDR_LO], ax
        mov     word ptr [G_FROM_FILE_ADDR_HI], dx
        mov     byte ptr [G_FROM_FILE_INDEX], 0
        mov     di, ax
        mov     es, dx
        mov     si, P_76C4
        mov     cx, 10h
calls_dma_transfer_init_1b9ad:
        call    dma_transfer_init
        ret
        if      FW_VERSION = 172
L_1B9B1:
        cmp     byte ptr [G_FROM_CARD_STATE], 22h
        stc
L_1B9B7:
        je      L_1B9BA
        else
from_svc_16:
        call    L_1B85B
        jae     L_1B9B1
        endif
        ret
        if      FW_VERSION = 150
L_1B9B1:
        endif
L_1B9BA:
        cmp     byte ptr [G_FROM_FILE_INDEX], 2
L_1B9BF:
        jae     L_1B9C2
        ret
L_1B9C2:
        mov     al, byte ptr [G_FROM_FILE_INDEX]
        dec     al
        push    ax
L_1B9C8:
        call    from_file_find_first
        pop     ax
        jae     L_1B9CF
        ret
L_1B9CF:
        cmp     al, byte ptr [G_FROM_FILE_INDEX]
L_1B9D3:
        jne     L_1B9D6
        ret
L_1B9D6:
        push    ax
L_1B9D7:
        call    from_file_find_next
        pop     ax
        jae     L_1B9CF
        if      FW_VERSION = 172
        ret
from_svc_02:
        mov     ax, 0f000h
        mov     es, ax
        mov     si, 0
        mov     word ptr [D_75AE], si
        jmp     L_1BA04
from_svc_03:
        db      0b8h, 00h, 0f0h, 8eh, 0c0h, 8bh, 36h, 0aeh, 75h, 81h, 0feh, 00h, 40h
L_1B9F9:
        je      L_1BA26
        cmp     byte ptr es:[si], 0
L_1B9FF:
        je      L_1BA26
        add     si, 20h
L_1BA04:
        cmp     byte ptr es:[si], 0
L_1BA08:
        je      L_1BA26
        mov     word ptr [D_75AE], si
L_1BA0E:
        mov     di, P_76E4
L_1BA11:
        call    from_dir_entry_format_name
        sub     bx, 20h
L_1BA17:
        sbb     dx, 0
        mov     cx, word ptr [G_FROM_FILE_ADDR_LO]
        mov     bp, word ptr [G_FROM_FILE_ADDR_HI]
        sub     ax, ax
        clc
        ret
L_1BA26:
        mov     di, P_76E4
        mov     si, di
        mov     ax, ds
        mov     es, ax
        push    di
        mov     cx, 14h
        mov     al, 20h
        rep stosb
        pop     di
        sub     dx, dx
        sub     bx, bx
        mov     ax, 0ffffh
        stc
        ret
from_svc_16:
        mov     ax, 0f000h
        mov     es, ax
        mov     si, word ptr [D_75AE]
        cmp     si, 0
        je      L_1BA58
        sub     si, 20h
        mov     word ptr [D_75AE], si
        jmp     L_1BA0E
L_1BA58:
        stc
        ret
from_dir_entry_format_name:
        push    ds
        mov     ax, ds
        mov     es, ax
        push    di
        push    di
        mov     cx, 14h
        mov     al, 20h
        rep stosb
        pop     di
        mov     dx, si
        mov     bx, di
        mov     ax, 0f000h
        mov     ds, ax
        mov     cx, 8
        rep movsb
        add     si, 4
L_1BA7A:
        call    filename8_is_printable
        jb      L_1BA84
        mov     cx, 8
        rep movsb
L_1BA84:
        mov     si, dx
        mov     di, bx
        add     si, 8
        add     di, 10h
        mov     al, 2eh
        stosb
        mov     cx, 3
        rep movsb
        mov     si, dx
        mov     bx, word ptr [si+1ch]
        mov     dx, word ptr [si+1eh]
        pop     si
        pop     ds
        clc
        ret
filename8_is_printable:
        push    si
        push    cx
        mov     cx, 8
L_1BAA7:
        cmp     byte ptr [si], 20h
L_1BAAA:
        jb      L_1BAB8
        cmp     byte ptr [si], 7bh
L_1BAAF:
        jae     L_1BAB8
        inc     si
        loop    L_1BAA7
        pop     cx
        pop     si
        clc
        ret
L_1BAB8:
        pop     cx
        pop     si
        stc
        endif
        ret
from_svc_04:
        cmp     byte ptr [G_FROM_CARD_STATE], 22h
L_1BAC1:
        jne     L_1BB09
L_1BAC3:
        call    from_svc_0e
        mov     ax, 0ffffh
L_1BAC9:
        jae     L_1BACC
        ret
L_1BACC:
        mov     ax, word ptr [G_FROM_FILE_ADDR_LO]
        mov     dx, word ptr [G_FROM_FILE_ADDR_HI]
        add     ax, 10h
        adc     dx, 0
        mov     cx, ax
        mov     bp, dx
        mov     word ptr [P_75AA], ax
        mov     word ptr [P_75AC], dx
        mov     bx, word ptr [G_FROM_DIRENT_LEN_LO]
        mov     dx, word ptr [G_FROM_DIRENT_LEN_HI]
        sub     bx, 20h
L_1BAEF:
        sbb     dx, 0
        mov     word ptr [P_75A6], bx
        mov     word ptr [P_75A8], dx
        mov     word ptr [G_FROM_BUF_AVAIL], 0
        mov     byte ptr [G_FROM_STREAM_MODE], 1
        sub     ax, ax
        clc
        ret
L_1BB09:
        mov     ax, 0ffffh
        stc
        ret
L_1BB0E:
        mov     ax, 0f000h
        mov     es, ax
        sub     ax, ax
        sub     di, di
        mov     cx, 8000h
        rep stosw
        mov     di, word ptr [G_FROM_FILE_ADDR_LO]
        mov     ax, word ptr [G_FROM_FILE_ADDR_HI]
        mov     es, ax
        push    ds
        mov     ax, 0f000h
        mov     ds, ax
        mov     si, 0
        mov     cx, 7fffh
calls_dma_transfer_init_1bb31:
        call    dma_transfer_init
        pop     ds
        mov     bx, 0f000h
        mov     si, 0
        int     4
        ret
from_svc_05:
        mov     ax, word ptr [P_75A6]
        or      ax, word ptr [P_75A8]
L_1BB45:
        je      L_1BB6D
        sub     word ptr [P_75A6], 1
        sbb     word ptr [P_75A8], 0
        cmp     word ptr [G_FROM_BUF_AVAIL], 0
        jne     L_1BB5B
L_1BB58:
        call    from_read_chunk
L_1BB5B:
        mov     si, word ptr [PTR_FROM_BUF_RD]
        mov     al, byte ptr [si]
        inc     word ptr [PTR_FROM_BUF_RD]
        dec     word ptr [G_FROM_BUF_AVAIL]
        mov     ah, 0
        clc
        ret
L_1BB6D:
        mov     ax, 0ffffh
        stc
        ret
from_svc_06:
        mov     ax, word ptr [P_75A6]
        or      ax, word ptr [P_75A8]
        jne     br_1BB7C
        ret
br_1BB7C:
        sub     word ptr [P_75A6], cx
        sbb     word ptr [P_75A8], 0
        jae     br_1BB97
        add     cx, word ptr [P_75A6]
        mov     word ptr [P_75A6], 0
        mov     word ptr [P_75A8], 0
br_1BB97:
        push    cx
        call    from_stream_read
        pop     ax
        clc
        ret
from_stream_read:
        cmp     cx, word ptr [G_FROM_BUF_AVAIL]
        jbe     br_1BBC9
        sub     cx, word ptr [G_FROM_BUF_AVAIL]
        push    cx
        mov     cx, word ptr [G_FROM_BUF_AVAIL]
        mov     word ptr [G_FROM_BUF_AVAIL], 0
        mov     si, word ptr [PTR_FROM_BUF_RD]
        rep movsb
        push    di
L_1C0B7:

        push    es
L_1BBBB:
        call    from_read_chunk
        pop     es
        pop     di
        pop     cx
        cmp     word ptr [G_FROM_BUF_AVAIL], 0
        jne     from_stream_read
        ret
br_1BBC9:
        sub     word ptr [G_FROM_BUF_AVAIL], cx
        mov     si, word ptr [PTR_FROM_BUF_RD]
        rep movsb
        mov     word ptr [PTR_FROM_BUF_RD], si
        ret
from_read_chunk:
        mov     si, P_75C4
        mov     word ptr [PTR_FROM_BUF_RD], si
        mov     cx, 80h
        les     di, [P_75AA]
        add     word ptr [P_75AA], cx
        adc     word ptr [P_75AC], 0
        push    cx
calls_dma_transfer_init_1bbf0:
        call    dma_transfer_init
        pop     cx
        shl     cx, 1
        mov     word ptr [G_FROM_BUF_AVAIL], cx
        ret
from_svc_13:
        mov     ax, word ptr [P_75A6]
        or      ax, word ptr [P_75A8]
        jne     br_1BC05
        ret
br_1BC05:
        sub     word ptr [P_75A6], cx
        sbb     word ptr [P_75A8], 0
        jae     br_1BC20
        add     cx, word ptr [P_75A6]
        mov     word ptr [P_75A6], 0
        mov     word ptr [P_75A8], 0
br_1BC20:
        push    cx
        call    from_stream_skip
        pop     ax
        clc
        ret
from_stream_skip:
        cmp     cx, word ptr [G_FROM_BUF_AVAIL]
        jbe     br_1BC4E
        sub     cx, word ptr [G_FROM_BUF_AVAIL]
        push    cx
        mov     cx, word ptr [G_FROM_BUF_AVAIL]
        mov     word ptr [G_FROM_BUF_AVAIL], 0
        mov     si, word ptr [PTR_FROM_BUF_RD]
        add     si, cx
L_1BC42:
        call    from_read_chunk
        pop     cx
        cmp     word ptr [G_FROM_BUF_AVAIL], 0
        jne     from_stream_skip
        ret
br_1BC4E:
        sub     word ptr [G_FROM_BUF_AVAIL], cx
        mov     si, word ptr [PTR_FROM_BUF_RD]
        add     si, cx
        mov     word ptr [PTR_FROM_BUF_RD], si
        ret
from_svc_07:
        cmp     byte ptr [G_FROM_CARD_STATE], 22h
L_1BC62:
        jne     L_1BCC5
        push    es
        pusha
L_1BC66:
        call    from_file_find_first
        jb      L_1BC70
L_1BC6B:
        call    from_file_find_next
        jae     L_1BC6B
L_1BC70:
        popa
        pop     es
L_1BC72:
        mov     di, P_75C4
        mov     word ptr [di+16h], cx
        mov     word ptr [di+18h], dx
        if      FW_VERSION = 172
        db      0e8h, 3ah, 57h
        else
        db      0e8h
        db      0e3h, 5ah
        endif
        mov     ax, 0ffffh
        mov     word ptr [di+1ch], ax
        mov     word ptr [di+1eh], ax
        mov     ax, word ptr [G_FROM_FILE_ADDR_LO]
        mov     dx, word ptr [G_FROM_FILE_ADDR_HI]
        mov     word ptr [P_75AA], ax
        mov     word ptr [P_75AC], dx
        sub     ax, ax
        mov     byte ptr [di+TBL_0014], al
        mov     byte ptr [di+15h], al
        mov     word ptr [di+1ah], ax
        mov     byte ptr [di+0bh], 20h
        mov     word ptr [P_75A6], 20h
        mov     word ptr [P_75A8], 0
        mov     word ptr [G_FROM_PAGE_POS], 20h
        mov     word ptr [G_FROM_PAGE_FREE], 0e0h
        mov     byte ptr [G_FROM_STREAM_MODE], 2
        sub     ax, ax
        clc
        ret
L_1BCC5:
        mov     ax, 0ffffh
        stc
        ret
from_svc_08:
        mov     ax, word ptr [P_75A6]
        or      ax, word ptr [P_75A8]
        ret
from_stream_write:
        add     word ptr [P_75A6], cx
        adc     word ptr [P_75A8], 0
L_1BCDB:
        cmp     cx, 0
        je      br_1BD39
        cmp     cx, word ptr [G_FROM_PAGE_FREE]
        jb      L_1BD1C
        sub     cx, word ptr [G_FROM_PAGE_FREE]
        push    cx
        mov     cx, word ptr [G_FROM_PAGE_FREE]
        mov     di, P_75C4
        add     di, word ptr [G_FROM_PAGE_POS]
        mov     word ptr [G_FROM_PAGE_FREE], 100h
        mov     word ptr [G_FROM_PAGE_POS], 0
        mov     ax, ds
        mov     bx, es
L_1BD06:
        mov     es, ax
        mov     ds, bx
        rep movsb
        mov     es, bx
L_1BD0E:
        mov     ds, ax
        push    es
        push    si
L_1BD12:
        call    from_write_page_checked
        pop     si
        pop     es
        pop     cx
        jae     L_1BCDB
        jmp     SHORT L_1BD3C
L_1BD1C:
        sub     word ptr [G_FROM_PAGE_FREE], cx
        mov     di, P_75C4
        add     di, word ptr [G_FROM_PAGE_POS]
        add     word ptr [G_FROM_PAGE_POS], cx
        mov     ax, ds
        mov     bx, es
L_1BD2F:
        mov     es, ax
        mov     ds, bx
        rep movsb
        mov     es, bx
L_1BD37:
        mov     ds, ax
br_1BD39:
        sub     ax, ax
        ret
L_1BD3C:
        mov     di, word ptr [G_FROM_FILE_ADDR_LO]
        mov     es, word ptr [G_FROM_FILE_ADDR_HI]
        mov     cx, di
L_1BD46:
        and     cx, 7fffh
        je      br_1BD5C
        and     di, 8000h
        push    ds
        mov     ax, 0f000h
        mov     ds, ax
        sub     si, si
calls_dma_transfer_init_1bd58:
        call    dma_transfer_init
        pop     ds
br_1BD5C:
        mov     ax, word ptr [G_FROM_FILE_ADDR_LO]
        mov     bx, word ptr [G_FROM_FILE_ADDR_HI]
        shl     ax, 1
        rcl     bx, 1
        and     bx, 7fh
L_1BD6A:
        call    from_erase_block
        inc     bl
L_1BD6F:
        cmp     bl, 80h
        jne     L_1BD6A
        mov     word ptr [G_FROM_PAGE_POS], 0
        mov     word ptr [G_FROM_PAGE_FREE], 100h
        mov     cx, word ptr [G_FROM_FILE_ADDR_LO]
        and     cx, 7fffh
        shl     cx, 1
        je      L_1BDAA
        and     word ptr [G_FROM_FILE_ADDR_LO], 8000h
        mov     ax, 0f000h
        mov     es, ax
        sub     si, si
        mov     ax, word ptr [G_FROM_FILE_ADDR_LO]
        mov     dx, word ptr [G_FROM_FILE_ADDR_HI]
        mov     word ptr [P_75AA], ax
        mov     word ptr [P_75AC], dx
        call    from_stream_write
L_1BDAA:
        mov     ax, 3
        stc
        ret
from_svc_0a:
        sub     ax, ax
        xchg    byte ptr [G_FROM_STREAM_MODE], al
        cmp     al, 2
L_1BDB7:
        je      br_1BDBA
        ret
br_1BDBA:
        cmp     word ptr [G_FROM_PAGE_FREE], 100h
        je      L_1BDD8
        mov     di, P_75C4
        add     di, word ptr [G_FROM_PAGE_POS]
        mov     cx, word ptr [G_FROM_PAGE_FREE]
        mov     ax, ds
        mov     es, ax
        mov     al, 0
        rep stosb
L_1BDD5:
        call    from_write_page_checked
L_1BDD8:
        mov     ax, word ptr [P_75A6]
        mov     di, word ptr [G_FROM_FILE_ADDR_LO]
        mov     es, word ptr [G_FROM_FILE_ADDR_HI]
        add     di, 0eh
L_1BDE6:
        call    from_program_word
        mov     ax, word ptr [P_75A8]
        mov     di, word ptr [G_FROM_FILE_ADDR_LO]
        mov     es, word ptr [G_FROM_FILE_ADDR_HI]
        add     di, 0fh
L_1BDF7:
        call    from_program_word
L_1BDFA:
        call    calls_sample_buffer_op_1c615
        if      FW_VERSION = 172
bc_int2a_1bdfd:
        call    from_build_directory
        endif
        ret
bc_int2a_1be01:
        INT_2A "F-ROM Write error !!"
error_f_rom_write_1be18:
        pusha
        sub     bx, bx
L_1BE1B:
        call    from_erase_block
        inc     bx
        cmp     bl, 6
        jne     L_1BE1B
        popa
        mov     ax, 0
        mov     dx, 100h
        mov     word ptr [G_FROM_FILE_ADDR_LO], ax
        mov     word ptr [G_FROM_FILE_ADDR_HI], dx
        mov     word ptr [P_75AA], ax
        mov     word ptr [P_75AC], dx
        mov     word ptr [P_75A6], 10h
        mov     word ptr [P_75A8], 0
        mov     word ptr [G_FROM_PAGE_POS], 10h
        mov     word ptr [G_FROM_PAGE_FREE], 0f0h
        mov     ax, ds
        mov     es, ax
        mov     di, P_75C4
        mov     si, P_76FC
        mov     cx, 10h
        rep movsb
        mov     byte ptr [G_FROM_STREAM_MODE], 2
        ret
from_svc_1c:
        mov     word ptr [G_FROM_FILE_ADDR_LO], 8000h
        mov     word ptr [G_FROM_FILE_ADDR_HI], 101h
        call    L_1BC72
        ret
from_svc_1d:
        sub     ax, ax
        xchg    byte ptr [G_FROM_STREAM_MODE], al
        cmp     al, 2
L_1BE7E:
        je      L_1BE81
        ret
L_1BE81:
        cmp     word ptr [G_FROM_PAGE_FREE], 0
L_1BE86:
        jne     L_1BE89
        ret
L_1BE89:
        mov     di, P_75C4
        add     di, word ptr [G_FROM_PAGE_POS]
        mov     cx, word ptr [G_FROM_PAGE_FREE]
        mov     ax, ds
        mov     es, ax
        mov     al, 0
        rep stosb
calls_string_compare_cs_1be9c:
        call    from_write_page_checked
        ret
from_svc_0e:
        call    string_compare_cs
        db      "MPC2000         .SYS", 0
        jae     L_1BF16
        push    si
        push    es
L_1BEBC:
        call    from_file_find_first
        pop     es
        pop     di
        jb      L_1BF09
loop_1BEC3:
        mov     cx, 14h
        mov     bp, di
        mov     si, P_76E4
tgt_1BECB:
        mov     al, byte ptr es:[di]
        cmp     al, 61h
        jb      L_1BED8
        cmp     al, 7bh
        jae     L_1BED8
        sub     al, 20h
L_1BED8:
        cmp     al, byte ptr [si]
L_1BEDA:
        jne     L_1BF00
        inc     si
        inc     di
        loop    tgt_1BECB
        mov     si, P_76C4
        mov     bx, word ptr [si+1ch]
        mov     dx, word ptr [si+1eh]
        sub     bx, 20h
L_1BEEC:
        sbb     dx, 0
        mov     di, word ptr [G_FROM_FILE_ADDR_LO]
        mov     si, word ptr [G_FROM_FILE_ADDR_HI]
        add     di, 10h
        if      FW_VERSION = 172
        add     si, 0
        else
        sub     si, 0
        endif
        sub     ax, ax
        ret
L_1BF00:
        push    es
        push    bp
L_1BF02:
        call    from_file_find_next
        pop     di
        pop     es
        jae     loop_1BEC3
L_1BF09:
        sub     dx, dx
        sub     bx, bx
        sub     di, di
        sub     si, si
        mov     ax, 0ffffh
        stc
        ret
L_1BF16:
        push    si
        push    es
        mov     di, 8000h
        mov     ax, 101h
        mov     es, ax
        mov     word ptr [G_FROM_FILE_ADDR_LO], di
        mov     word ptr [G_FROM_FILE_ADDR_HI], es
        mov     byte ptr [G_FROM_FILE_INDEX], 0
        mov     si, P_76C4
        mov     cx, 10h
calls_dma_transfer_init_1bf33:
        call    dma_transfer_init
        mov     di, P_76E4
        if      FW_VERSION = 172
        db      0e8h, 0e0h, 50h
        else
        db      0e8h
        db      8ch, 54h
        endif
        pop     es
        pop     di
        mov     si, P_76E4
        mov     cx, 14h
        repe cmpsb
        jne     br_1BF4C
        sub     ax, ax
        clc
        ret
br_1BF4C:
        stc
        ret
from_free_bytes:
        cmp     byte ptr [G_FROM_CARD_STATE], 22h
L_1BF53:
        jne     br_1BF8A
L_1BF55:
        call    from_file_find_first
        jb      br_1BF5F
loop_1BF5A:
        call    from_file_find_next
        jae     loop_1BF5A
br_1BF5F:
        sub     ax, ax
        mov     dx, 140h
        sub     ax, word ptr [G_FROM_FILE_ADDR_LO]
        sbb     dx, word ptr [G_FROM_FILE_ADDR_HI]
        mov     cx, 9
L_1BF6F:
        shr     dx, 1
        rcr     ax, 1
        loop    L_1BF6F
        mov     di, ax
        mov     si, dx
        push    di
L_1BF7A:
        call    from_find_chain_end
        mov     cx, 9
tgt_1BF80:
        shr     dx, 1
        rcr     ax, 1
        loop    tgt_1BF80
        mov     si, ax
        pop     di
        ret
br_1BF8A:
        sub     si, si
        sub     di, di
        ret
from_find_chain_end:
        sub     ax, ax
        sub     dx, dx
        mov     di, 0
        mov     si, 103h
        mov     word ptr [G_FROM_SCAN_ADDR_LO], di
        mov     word ptr [G_FROM_SCAN_ADDR_HI], si
L_1BFA1:
        mov     di, word ptr [G_FROM_SCAN_ADDR_LO]
        mov     es, word ptr [G_FROM_SCAN_ADDR_HI]
        mov     cx, 10h
        mov     si, P_75C4
calls_dma_transfer_init_1bfaf:
        call    dma_transfer_init
        cmp     byte ptr [W_75C4], 0ffh
L_1BFB7:
        jne     L_1BFBA
        ret
L_1BFBA:
        mov     di, word ptr [G_FROM_HDR_LEN_LO]
        mov     si, word ptr [G_FROM_HDR_LEN_HI]
        mov     cx, di
L_1BFC4:
        or      cx, si
L_1BFC6:
        jne     br_1BFCB
        jmp     L_1BE4A
br_1BFCB:
        cmp     di, -1
        jne     br_1BFD8
        cmp     si, -1
        jne     br_1BFD8
        jmp     L_1BE4A
br_1BFD8:
        test    di, 0ffh
        je      br_1BFE9
        add     di, 100h
        adc     si, 0
        and     di, 0ff00h
br_1BFE9:
        shr     si, 1
        rcr     di, 1
        cmp     byte ptr [W_75C4], 0
        jne     L_1BFF8
        add     ax, di
        adc     dx, si
L_1BFF8:
        add     di, word ptr [G_FROM_SCAN_ADDR_LO]
        adc     si, word ptr [G_FROM_SCAN_ADDR_HI]
        cmp     si, 140h
L_1C004:
        jb      L_1C009
        jmp     L_1BE4A
L_1C009:
        mov     word ptr [G_FROM_SCAN_ADDR_LO], di
        mov     word ptr [G_FROM_SCAN_ADDR_HI], si
        jmp     SHORT L_1BFA1
L_1C013:
        mov     ax, 0
        mov     dx, 103h
        mov     word ptr [G_FROM_FILE_ADDR_LO], ax
        mov     word ptr [G_FROM_FILE_ADDR_HI], dx
        mov     byte ptr [G_FROM_FILE_INDEX], 0
        jmp     SHORT L_1C061
        if      FW_VERSION = 172
        db      0a1h, 0e0h, 76h, 8bh, 16h, 0e2h, 76h, 8bh, 0d8h, 0bh, 0c2h
        else
        db      0a1h, 0c6h, 76h, 8bh, 16h, 0c8h, 76h, 8bh, 0d8h, 0bh, 0c2h
        endif
L_1C032:
        je      L_1C08E
L_1C034:
        mov     bx, ax
        mov     cx, dx
        add     bx, 1
        adc     cx, 0
        or      bx, cx
L_1C040:
        je      L_1C08E
        cmp     al, 0
        je      L_1C04C
        add     ax, 100h
        adc     dx, 0
L_1C04C:
        mov     al, 0
        shr     dx, 1
        rcr     ax, 1
        add     ax, word ptr [G_FROM_FILE_ADDR_LO]
        adc     dx, word ptr [G_FROM_FILE_ADDR_HI]
        mov     word ptr [G_FROM_FILE_ADDR_LO], ax
        mov     word ptr [G_FROM_FILE_ADDR_HI], dx
L_1C061:
        mov     di, ax
        mov     es, dx
        mov     si, P_76C4
        mov     cx, 10h
calls_dma_transfer_init_1c06b:
        call    dma_transfer_init
        cmp     byte ptr [si], 0ffh
L_1C071:
        je      L_1C08E
        cmp     byte ptr [si], 0
L_1C076:
        je      L_1C08E
        mov     di, P_76E4
        if      FW_VERSION = 172
        db      0e8h, 9eh, 4fh
        else
        db      0e8h
        db      4ah, 53h
        endif
        mov     cx, word ptr [G_FROM_FILE_ADDR_LO]
        mov     bp, word ptr [G_FROM_FILE_ADDR_HI]
        inc     byte ptr [G_FROM_FILE_INDEX]
        sub     ax, ax
        clc
        ret
L_1C08E:
        ret
from_svc_15:
        push    ds
        mov     ax, DATA_SEG
        mov     ds, ax
wipe_f_rom_msg:
        BC_PRINT "      WIPE F-ROM...   %"
print_wipe_f_rom_1c0b0:
        BC_PLANE_E
        db      1fh
L_1C0B4:
        call    from_free_bytes
        mov     ax, word ptr [G_FROM_FILE_ADDR_LO]
        mov     dx, word ptr [G_FROM_FILE_ADDR_HI]
        shl     ax, 1
        rcl     dx, 1
        inc     dl
        cmp     dl, 81h
        jb      br_1C0CB
        mov     dl, 80h
br_1C0CB:
        mov     byte ptr [G_FROM_END_BLOCK], dl
        mov     bx, 6
L_1C0D2:
        call    from_wipe_show_percent
L_1C0D5:
        call    from_erase_block
        inc     bx
        cmp     bl, byte ptr [G_FROM_END_BLOCK]
        jne     L_1C0D2
L_1C0DF:
        call    from_file_read_first_header
        ret
from_wipe_show_percent:
        push    bx
        sub     bl, 6
L_1C0E7:
        mov     al, 64h
        mul     bl
        mov     cl, 7ah
        div     cl
        mov     ah, 0
        push    ds
        mov     bx, DATA_SEG
        mov     ds, bx
L_1C0F7:
        BC_FIELD 151, 5
L_1C0FC:
        BC_ADDR_OP
        db      1fh, 5bh, 0c3h
from_svc_0c:
        mov     bx, ax
L_1C104:
        call    from_erase_block
        ret
from_svc_19:
        mov     si, L_1C129
        mov     cx, 4
        mov     ax, 100h
        mov     es, ax
        mov     di, 4
L_1C116:
        mov     ax, word ptr cs:[si]
        pusha
        push    es
L_1C11B:
        call    from_program_word
        pop     es
        popa
        add     si, 2
        add     di, 1
        loop    L_1C116
        ret
L_1C129:
        dec     bp
        push    ax
        inc     bx
        xor     dh, byte ptr [bx+si]
        xor     byte ptr [bx+si], dh
        db      20h
from_svc_11:
        if      FW_VERSION = 172
        cmp     byte ptr [P_78AE], 22h
L_1C136:
        jne     L_1C13E
        else
        pusha
        push    es
        call    L_1B85B
        pop     es
        popa
        jb      L_1C13E
        endif
        sub     ax, ax
        sub     bx, bx
        clc
        ret
L_1C13E:
        mov     ax, 0ffffh
        sub     bx, bx
        stc
        ret
from_svc_14:
        call    from_svc_0e
        jb      L_1C161
        mov     si, P_76C4
        mov     di, word ptr [G_FROM_FILE_ADDR_LO]
        mov     es, word ptr [G_FROM_FILE_ADDR_HI]
        mov     ax, 0
L_1C158:
        call    from_program_word
L_1C15B:
        call    calls_sample_buffer_op_1c615
L_1C15E:
        call    L_1C164
L_1C161:
        sub     ax, ax
        ret
L_1C164:
        call    from_file_read_first_header
        mov     di, word ptr [G_FROM_FILE_ADDR_LO]
        mov     si, word ptr [G_FROM_FILE_ADDR_HI]
        mov     ax, word ptr [W_76C4]
        cmp     ax, 0ffffh
L_1C175:
        jne     L_1C178
        ret
L_1C178:
        or      ax, ax
        je      L_1C180
L_1C17C:
        sub     si, si
        sub     di, di
L_1C180:
        push    di
        push    si
L_1C182:
        call    from_file_advance_header
        pop     si
        pop     di
L_1C187:
        jae     L_1C18A
        ret
L_1C18A:
        mov     ax, word ptr [W_76C4]
        cmp     ax, 0ffffh
L_1C190:
        je      L_1C1A6
        or      ax, ax
        jne     L_1C17C
        mov     ax, si
        or      ax, di
        jne     L_1C180
        mov     di, word ptr [G_FROM_FILE_ADDR_LO]
        mov     si, word ptr [G_FROM_FILE_ADDR_HI]
        jmp     SHORT L_1C180
L_1C1A6:
        mov     ax, si
        or      ax, di
L_1C1AA:
        jne     L_1C1AD
        ret
L_1C1AD:
        mov     ax, word ptr [G_FROM_FILE_ADDR_LO]
        mov     dx, word ptr [G_FROM_FILE_ADDR_HI]
        shl     ax, 1
        rcl     dx, 1
        and     dl, 7fh
        mov     word ptr [G_FROM_FILE_ADDR_LO], di
        mov     word ptr [G_FROM_FILE_ADDR_HI], si
        mov     cx, di
L_1C1C5:
        and     cx, 7fffh
        je      br_1C1DD
        and     di, 8000h
        mov     es, si
        push    ds
        mov     ax, 0f000h
        mov     ds, ax
        sub     si, si
calls_dma_transfer_init_1c1d9:
        call    dma_transfer_init
        pop     ds
br_1C1DD:
        mov     ax, word ptr [G_FROM_FILE_ADDR_LO]
        mov     bx, word ptr [G_FROM_FILE_ADDR_HI]
        shl     ax, 1
        rcl     bx, 1
        and     bx, 7fh
L_1C1EB:
        push    dx
L_1C1EC:
        call    from_erase_block
        pop     dx
        cmp     bl, dl
L_1C1F2:
        je      br_1C1F8
        inc     bl
L_1C1F6:
        jmp     SHORT L_1C1EB
br_1C1F8:
        mov     word ptr [G_FROM_PAGE_POS], 0
        mov     word ptr [G_FROM_PAGE_FREE], 100h
        mov     cx, word ptr [G_FROM_FILE_ADDR_LO]
        and     cx, 7fffh
        shl     cx, 1
        je      L_1C22E
        and     word ptr [G_FROM_FILE_ADDR_LO], 8000h
        mov     ax, 0f000h
        mov     es, ax
        sub     si, si
        mov     ax, word ptr [G_FROM_FILE_ADDR_LO]
        mov     dx, word ptr [G_FROM_FILE_ADDR_HI]
        mov     word ptr [P_75AA], ax
        mov     word ptr [P_75AC], dx
        call    from_stream_write
L_1C22E:
        if      FW_VERSION = 172
        call    from_build_directory
        endif
        sub     ax, ax
        stc
        ret
from_arrange_far:
        mov     byte ptr [B_771F], 0
L_1C23A:
        call    from_arrange_run
        mov     ax, 1
        int     47h
        retf
from_arrange_run:
        push    cs
processing_status_1C244:
        call    calls_f_rom_fragmentation_dialog_1c6d0
processing_status:
        BC_STATUS 86, 41, "Processing....."
status_processing_1c25c:
        BC_FLUSH
L_1C25F:
        call    from_arrange_compact
L_1C262:
        jae     L_1C265
        ret
L_1C265:
        call    L_1C32C
L_1C268:
        call    fn_1C41D
L_1C26B:
        call    L_1C3BD
        cmp     word ptr [G_FROM_ARR_DST_HI], 140h
calls_f_rom_fragmentation_dialog_1c274:
        jb      processing_1_status_1C277
        ret
processing_1_status_1C277:
        call    f_rom_fragmentation_dialog
        if      FW_VERSION = 150
L_1C77A                         equ     $+7
        endif
processing_1_status:
        BC_STATUS 86, 41, "Processing....."
status_processing_1c28f:
        BC_FLUSH
L_1C292:
        cmp     byte ptr [G_FROM_END_BLOCK], 0
L_1C297:
        je      L_1C265
        cmp     byte ptr [G_FROM_END_BLOCK], 80h
L_1C29E:
        jb      L_1C2A1
        ret
L_1C2A1:
        call    fn_1C41D
        add     word ptr [G_FROM_ARR_DST_LO], 8000h
        adc     word ptr [G_FROM_ARR_DST_HI], 0
        cmp     bl, byte ptr [G_FROM_END_BLOCK]
L_1C2B3:
        jbe     L_1C2A1
L_1C2B5:
        call    from_free_bytes
        mov     word ptr [G_FREE_SPACE], di
        mov     word ptr [G_FRAG_SPACE], si
        ret
from_arrange_compact:
        mov     byte ptr [G_FROM_END_BLOCK], 0
L_1C7BF:
        sub     ax, ax
        mov     word ptr [G_FROM_ARR_BUF_FILL], ax
        mov     word ptr [G_FROM_ARR_LEFT_LO], ax
        mov     word ptr [G_FROM_ARR_LEFT_HI], ax
L_1C2D1:
        call    from_buffer_fill_ff
L_1C2D4:
        call    from_file_read_first_header
L_1C2D7:
        mov     al, byte ptr [W_76C4]
        cmp     al, 0
L_1C2DC:
        je      br_1C2EC
        cmp     al, 0ffh
L_1C2E0:
        je      br_1C2E7
L_1C2E2:
        call    from_file_advance_header
        jmp     SHORT L_1C2D7
br_1C2E7:
        call    fn_1C31C
        stc
        ret
br_1C2EC:
        mov     ax, word ptr [G_FROM_FILE_ADDR_LO]
        mov     dx, word ptr [G_FROM_FILE_ADDR_HI]
        mov     cx, ax
        and     ax, 8000h
        mov     word ptr [G_FROM_ARR_DST_LO], ax
        mov     word ptr [G_FROM_ARR_DST_HI], dx
        and     cx, 7fffh
        jne     L_1C306
        ret
L_1C306:
        mov     word ptr [G_FROM_ARR_BUF_FILL], cx
        sub     si, si
        mov     di, ax
        mov     es, dx
        push    ds
        mov     ax, 0f000h
        mov     ds, ax
calls_dma_transfer_init_1c316:
        call    dma_transfer_init
        pop     ds
        clc
        ret
fn_1C31C:
        mov     ax, word ptr [G_FROM_FILE_ADDR_LO]
        mov     bx, word ptr [G_FROM_FILE_ADDR_HI]
        shl     ax, 1
        rcl     bx, 1
        mov     byte ptr [G_FROM_END_BLOCK], bl
        ret
L_1C32C:
        cmp     byte ptr [G_FROM_END_BLOCK], 0
L_1C331:
        je      br_1C334
        ret
br_1C334:
        mov     ax, word ptr [G_FROM_ARR_LEFT_LO]
        mov     dx, word ptr [G_FROM_ARR_LEFT_HI]
        mov     bx, ax
        or      bx, dx
        jne     L_1C86B
L_1C341:
        call    from_file_find_next
tgt_1C344:
        jb      fn_1C31C
        mov     ax, word ptr [G_FROM_FILE_ADDR_LO]
        mov     dx, word ptr [G_FROM_FILE_ADDR_HI]
        mov     word ptr [G_FROM_ARR_SRC_LO], ax
        mov     word ptr [G_FROM_ARR_SRC_HI], dx
        mov     ax, word ptr [G_FROM_DIRENT_LEN_LO]
        mov     dx, word ptr [G_FROM_DIRENT_LEN_HI]
        test    al, 0ffh
        je      L_1C367
        add     ax, 100h
        adc     dx, 0
        mov     al, 0
L_1C367:
        shr     dx, 1
        rcr     ax, 1
        mov     word ptr [G_FROM_ARR_LEFT_LO], ax
        mov     word ptr [G_FROM_ARR_LEFT_HI], dx
L_1C86B:
        mov     cx, 8000h
        mov     si, word ptr [G_FROM_ARR_BUF_FILL]
tgt_1C379:
        sub     cx, si
        sub     ax, cx
        sbb     dx, 0
        jae     L_1C388
        add     cx, ax
        sub     ax, ax
        sub     dx, dx
L_1C388:
        sub     word ptr [G_FROM_ARR_LEFT_LO], cx
        sbb     word ptr [G_FROM_ARR_LEFT_HI], 0
        shl     si, 1
        mov     di, word ptr [G_FROM_ARR_SRC_LO]
        mov     es, word ptr [G_FROM_ARR_SRC_HI]
        push    ds
        mov     ax, 0f000h
        mov     ds, ax
calls_dma_transfer_init_1c3a1:
        call    dma_transfer_init
        pop     ds
        add     word ptr [G_FROM_ARR_SRC_LO], cx
        adc     word ptr [G_FROM_ARR_SRC_HI], 0
L_1C8A7:
        add     word ptr [G_FROM_ARR_BUF_FILL], cx
        cmp     word ptr [G_FROM_ARR_BUF_FILL], 8000h
        je      L_1C3BC
        jmp     SHORT L_1C341
L_1C3BC:
        ret
L_1C3BD:
        cmp     word ptr [G_FROM_ARR_BUF_FILL], 0
L_1C3C2:
        jne     L_1C3C5
        ret
L_1C3C5:
        mov     word ptr [G_FROM_PAGE_POS], 0
        mov     word ptr [G_FROM_PAGE_FREE], 100h
        mov     ax, 0f000h
        mov     es, ax
        sub     si, si
        mov     ax, word ptr [G_FROM_ARR_DST_LO]
        mov     dx, word ptr [G_FROM_ARR_DST_HI]
        mov     word ptr [P_75AA], ax
        mov     word ptr [P_75AC], dx
        mov     cx, 8000h
        pusha
        call    from_stream_write
        popa
        mov     ax, word ptr [G_FROM_ARR_DST_LO]
        mov     dx, word ptr [G_FROM_ARR_DST_HI]
        add     ax, 4000h
        adc     dx, 0
        mov     word ptr [P_75AA], ax
        mov     word ptr [P_75AC], dx
        mov     si, 8000h
        call    from_stream_write
L_1C408:
        call    from_buffer_fill_ff
        add     word ptr [G_FROM_ARR_DST_LO], 8000h
        adc     word ptr [G_FROM_ARR_DST_HI], 0
        mov     word ptr [G_FROM_ARR_BUF_FILL], 0
        ret
fn_1C41D:
        mov     ax, word ptr [G_FROM_ARR_DST_LO]
        mov     bx, word ptr [G_FROM_ARR_DST_HI]
        cmp     bx, 140h
        jb      L_1C42B
        ret
L_1C42B:
        shl     ax, 1
        rcl     bx, 1
        and     bl, 7fh
L_1C432:
        call    from_erase_block
        ret
from_buffer_fill_ff:
        mov     ax, 0f000h
        mov     es, ax
        sub     di, di
        mov     ax, 0ffffh
        mov     cx, 8000h
        rep stosw
        ret

from_read_chip_id:
        sub     ax, ax
        mov     word ptr [FP_FROM_CMD_ADDR], ax
        mov     ax, 100h
        mov     word ptr [G_FROM_CMD_ADDR_SEG], ax
        mov     al, 90h
calls_sample_buffer_op_1c453:
        call    sample_buffer_op
        mov     si, P_75C4
        sub     di, di
        mov     ax, 100h
        mov     es, ax
        mov     cx, 2
calls_dma_transfer_init_1c463:
        call    dma_transfer_init
L_1C466:
        call    calls_sample_buffer_op_1c615
        mov     ax, word ptr [W_75C4]
        mov     bx, word ptr [W_75C6]
        ret
from_write_page_checked:
        call    from_write_page
        jae     L_1C477
        ret
L_1C477:
        test    al, 20h
L_1C479:
        je      error_f_rom_write_1c49c
L_1C47B:
        call    from_write_page
        test    al, 20h
bc_int2a_1c480:
        je      error_f_rom_write_1c49c
bc_int2a_1c482:
        INT_2A "   F-ROM Write error !!"
error_f_rom_write_1c49c:
        add     word ptr [P_75AA], 80h
        adc     word ptr [P_75AC], 0
        ret
from_write_page:
        mov     ax, word ptr [P_75AA]
        mov     dx, word ptr [P_75AC]
        mov     word ptr [FP_FROM_CMD_ADDR], ax
        mov     word ptr [G_FROM_CMD_ADDR_SEG], dx
        add     ax, 80h
L_1C9B2:
        adc     dx, 0
        if      FW_VERSION = 172
        cmp     dx, 140h
        endif
L_1C4C0:
        if      FW_VERSION = 150
        cmp     dx, 140h
        endif
        jb      L_1C4C5
        jmp     NEAR br_1C56B
L_1C4C5:
        call    calls_sample_buffer_op_1c61b
        mov     word ptr [G_TIMEOUT_TICKS], 1388h
loop_1C4CE:
        call    calls_sample_buffer_op_1c640
        test    al, 80h
        je      bc_int2a_1c4d9
        test    al, 4
L_1C4D7:
        jne     error_f_rom_buffer_1c4fc
bc_int2a_1c4d9:
        cmp     word ptr [G_TIMEOUT_TICKS], 0
        jne     loop_1C4CE
calls_sample_buffer_op_1c4e0:
        if      FW_VERSION = 150
L_1C9E5                         equ     $+12
        endif
        INT_2A "F-ROM buffer not ready !!"
error_f_rom_buffer_1c4fc:
        mov     al, 0e0h
calls_sample_buffer_op_1c4fe:
        call    sample_buffer_op
        mov     al, 7fh
        call    sample_buffer_op
        mov     al, 0
L_1CA01:
        call    sample_buffer_op
        mov     cx, 80h
        mov     si, P_75C4
        les     di, [P_75AA]
        call    L_1C861
        call    from_write_enable
        mov     word ptr [G_TIMEOUT_TICKS], 1388h
loop_1C521:
        call    calls_sample_buffer_op_1c640
        test    al, 80h
        je      bc_int2a_1c52c
        test    al, 4
L_1C52A:
        jne     error_f_rom_buffer_1c54f
bc_int2a_1c52c:
        cmp     word ptr [G_TIMEOUT_TICKS], 0
        jne     loop_1C521
calls_sample_buffer_op_1c533:
        INT_2A "F-ROM buffer not ready !!"
error_f_rom_buffer_1c54f:
        mov     al, 0ch
calls_sample_buffer_op_1c551:
        call    sample_buffer_op
        mov     al, 7fh
        call    sample_buffer_op
        mov     al, 0
L_1C55B:
        call    SAMPLE_BUFFER_OP_V150
L_1C55E:
        call    from_wait_ready
        push    ax
L_1C562:
        call    from_write_disable
L_1C565:
        call    calls_sample_buffer_op_1c615
        pop     ax
        clc
        ret
br_1C56B:
        sub     ax, ax
        stc
        ret
from_program_word:
        push    ax
        mov     word ptr [FP_FROM_CMD_ADDR], di
        mov     word ptr [G_FROM_CMD_ADDR_SEG], es
L_1C578:
        call    calls_sample_buffer_op_1c61b
calls_sample_buffer_op_1c57b:
        call    from_write_enable
        mov     al, 40h
calls_sample_buffer_op_1c580:
        call    sample_buffer_op
        pop     ax
        mov     si, P_75BA
        mov     word ptr [si], ax
        mov     cx, 1
L_1C58C:
        call    L_1C861
L_1C58F:
        call    wait_sample_buffer_ready
L_1C592:
        call    from_write_disable
        ret
from_erase_block:
        push    bx
        sub     ax, ax
        shr     bx, 1
        rcr     ax, 1
        or      bx, 100h
        mov     word ptr [FP_FROM_CMD_ADDR], ax
        mov     word ptr [G_FROM_CMD_ADDR_SEG], bx
L_1C5A8:
        call    wait_sample_buffer_ready
        if      FW_VERSION = 172
calls_sample_buffer_op_1c5ab:
        endif
        call    calls_sample_buffer_op_1c61b
        mov     al, 20h
calls_sample_buffer_op_1c5b0:
        call    sample_buffer_op
        if      FW_VERSION = 150
calls_sample_buffer_op_1c5ab:
        endif
calls_sample_buffer_op_1c5b3:
        call    from_write_enable
        mov     al, 0d0h
calls_sample_buffer_op_1c5b8:
        call    sample_buffer_op
L_1C5BB:
        call    wait_sample_buffer_ready
        push    ax
L_1C5BF:
        call    from_write_disable
L_1C5C2:
        call    calls_sample_buffer_op_1c61b
L_1C5C5:
        call    calls_sample_buffer_op_1c615
        pop     ax
        test    al, 38h
bc_int2a_1c5cb:
        je      error_f_rom_erase_1c5e7
bc_int2a_1c5cd:
        INT_2A "   F-ROM erase error !!"
error_f_rom_erase_1c5e7:
        pop     bx
        ret
wait_sample_buffer_ready:
        mov     word ptr [G_TIMEOUT_TICKS], 1388h
L_1C5EF:
        call    calls_sample_buffer_op_1c624
L_1CAEB:
        test    al, 80h
L_1C5F4:
        je      br_1C5F7
        ret
br_1C5F7:
        cmp     word ptr [G_TIMEOUT_TICKS], 0
        jne     L_1C5EF
        ret
from_wait_ready:
        mov     word ptr [G_TIMEOUT_TICKS], 1388h
L_1C605:
        call    calls_sample_buffer_op_1c640
        test    al, 80h
L_1C60A:
        je      br_1C60D
        ret
br_1C60D:
        cmp     word ptr [G_TIMEOUT_TICKS], 0
        jne     L_1C605
        ret
calls_sample_buffer_op_1c615:
        mov     al, 0ffh
calls_sample_buffer_op_1c617:
        call    sample_buffer_op
        ret
calls_sample_buffer_op_1c61b:
        call    wait_sample_buffer_ready
        mov     al, 50h
calls_sample_buffer_op_1c620:
        call    sample_buffer_op
        ret
calls_sample_buffer_op_1c624:
        pusha
        mov     al, 70h
calls_sample_buffer_op_1c627:
        call    sample_buffer_op
        mov     si, P_75BA
        les     di, [FP_FROM_CMD_ADDR]
        and     di, 8000h
        mov     cx, 1
calls_dma_transfer_init_1c638:
        call    dma_transfer_init
        popa
        mov     al, byte ptr [G_FROM_CHIP_STATUS]
        ret
calls_sample_buffer_op_1c640:
        pusha
        mov     al, 71h
calls_sample_buffer_op_1c643:
        call    sample_buffer_op
        mov     si, P_75BA
        les     di, [FP_FROM_CMD_ADDR]
        and     di, 8000h
L_1CB4A:
        add     di, 2
        mov     cx, 1
calls_dma_transfer_init_1c657:
        call    dma_transfer_init
        popa
        mov     al, byte ptr [G_FROM_CHIP_STATUS]
        ret
calls_sample_buffer_op_1c65f:
        pusha
        mov     al, 71h
calls_sample_buffer_op_1c662:
        call    sample_buffer_op
        mov     si, P_75BA
        les     di, [FP_FROM_CMD_ADDR]
        and     di, 8000h
        inc     di
        mov     cx, 1
calls_dma_transfer_init_1c674:
        call    dma_transfer_init
        popa
        mov     al, byte ptr [G_FROM_CHIP_STATUS]
        ret
sample_buffer_op:
        pusha
        mov     si, P_75BA
        mov     ah, 0
        mov     word ptr [si], ax
        les     di, [FP_FROM_CMD_ADDR]
        and     di, 8000h
        mov     cx, 1
L_1C68F:
        call    L_1C861
        popa
        ret
SAMPLE_BUFFER_OP_V150:
        pusha
        mov     si, P_75BA
        mov     ah, 0
        mov     word ptr [si], ax
        les     di, [FP_FROM_CMD_ADDR]
        and     di, 0ff80h
        mov     cx, 1
L_1C6A6:
        call    L_1C861
        and     word ptr [FP_FROM_CMD_ADDR], 8000h
        popa
        ret

from_write_enable:
        push    ax
        push    dx
        mov     dx, 0c0h
        mov     al, 83h
        out     dx, al
        pop     dx
        pop     ax
        ret
from_write_disable:
        push    ax
        push    dx
        mov     dx, 0c0h
        mov     al, 82h
        out     dx, al
        pop     dx
        pop     ax
        ret
L_1C6C7:
        push    ax
        mov     dx, 0c0h
        mov     al, 82h
        out     dx, al
        pop     ax
        ret
calls_f_rom_fragmentation_dialog_1c6d0:
        mov     byte ptr [B_771F], 1
calls_f_rom_fragmentation_dialog_1c6d5:
        call    f_rom_fragmentation_dialog
        mov     byte ptr [B_771F], 0
        retf
f_rom_fragmentation_dialog:
        if      FW_VERSION = 150
F_ROM_FRAGMENTATION_DIALOG_V150:
L_1CBEB                         equ     $+20
        endif
        BC_FILE_DIALOG 16, 2, 216, 58, "F-ROM  Fragmentation"
L_1C6FA:
        mov     cl, 34h
        mov     ch, 0bh
        mov     dl, 91h
        mov     dh, 1
L_1C702:
        BC_SEQ_OP
L_1C705:
        add     ch, 3
        cmp     ch, 26h
L_1C70B:
        jne     L_1C702
        mov     cl, 34h
        mov     ch, 0bh
        mov     dl, 1
        mov     dh, 18h
L_1C715:
        BC_SEQ_OP
        add     cl, 9
        cmp     cl, 0cdh
L_1C71E:
        jne     L_1C715
L_1C720:
        BC_MEM_COPY 24, 39, 200
L_1C726:
        mov     ax, 0
        mov     dx, 100h
        mov     di, 0
        mov     si, 103h
        mov     word ptr [G_FROM_SCAN_ADDR_LO], di
L_1C736:
        mov     word ptr [G_FROM_SCAN_ADDR_HI], si
        call    fn_1C803
        cmp     byte ptr [B_771F], 0
L_1C742:
        db      75h, 30h
        mov     ax, 0
        mov     dx, 103h
        mov     di, word ptr [G_FROM_ARR_DST_LO]
        mov     si, word ptr [G_FROM_ARR_DST_HI]
        call    fn_1C803
        mov     si, P_76C4
        mov     di, P_75C4
        mov     cx, 10h
        if      FW_VERSION = 172
L_1C75E:
        endif
        mov     ax, ds
        if      FW_VERSION = 150
L_1C75E:
        endif
        mov     es, ax
        rep movsw
        mov     ax, word ptr [G_FROM_FILE_ADDR_LO]
        mov     dx, word ptr [G_FROM_FILE_ADDR_HI]
        mov     word ptr [G_FROM_SCAN_ADDR_LO], ax
        mov     word ptr [G_FROM_SCAN_ADDR_HI], dx
        jmp     SHORT L_1C785
        if      FW_VERSION = 172
        db      8bh, 3eh, 0ch, 77h, 8eh, 06h, 0eh, 77h, 0b9h, 10h, 00h, 0beh, 0c4h, 75h
        endif
calls_dma_transfer_init_1c782:
        if      FW_VERSION = 150
        mov     di, word ptr [G_FROM_SCAN_ADDR_LO]
        mov     es, word ptr [G_FROM_SCAN_ADDR_HI]
        mov     cx, 10h
        mov     si, P_75C4
        endif
        call    dma_transfer_init
L_1C785:
        cmp     byte ptr [W_75C4], 0ffh
L_1C78A:
        jne     L_1C78D
        ret
L_1C78D:
        mov     di, word ptr [G_FROM_HDR_LEN_LO]
        mov     si, word ptr [G_FROM_HDR_LEN_HI]
        mov     ax, di
        or      ax, si
L_1C799:
        jne     L_1C79E
        jmp     L_1BE4A
L_1C79E:
        cmp     di, -1
L_1C7A1:
        jne     br_1C7AB
        cmp     si, -1
L_1C7A6:
        jne     br_1C7AB
        jmp     L_1BE4A
br_1C7AB:
        mov     ax, word ptr [G_FROM_SCAN_ADDR_LO]
        mov     dx, word ptr [G_FROM_SCAN_ADDR_HI]
        test    di, 0ffh
        je      L_1C7C3
        add     di, 100h
        adc     si, 0
        and     di, 0ff00h
L_1C7C3:
        shr     si, 1
        rcr     di, 1
        add     di, ax
        adc     si, dx
        cmp     si, 140h
L_1C7CF:
        jb      L_1C7D4
        jmp     L_1BE4A
L_1C7D4:
        mov     word ptr [G_FROM_SCAN_ADDR_LO], di
        mov     word ptr [G_FROM_SCAN_ADDR_HI], si
        cmp     byte ptr [W_75C4], 0
L_1C7E1:
        db      74h, 91h
        cmp     byte ptr [B_771F], 0
        jne     br_1C7FD
        cmp     ax, word ptr [G_FROM_FILE_ADDR_LO]
        jne     br_1C7FD
        cmp     dx, word ptr [G_FROM_FILE_ADDR_HI]
        jne     br_1C7FD
        mov     ax, word ptr [G_FROM_ARR_SRC_LO]
        mov     dx, word ptr [G_FROM_ARR_SRC_HI]
br_1C7FD:
        call    fn_1C803
        db      0e9h, 71h, 0ffh
fn_1C803:
        and     ax, 0f000h
        and     di, 0f000h
L_1C80A:
        cmp     dx, si
L_1C80C:
        jne     br_1C813
        cmp     ax, di
L_1C810:
        jne     br_1C813
        ret
br_1C813:
        call    L_1C81E
        add     ax, 1000h
        adc     dx, 0
        jmp     SHORT L_1C80A
L_1C81E:
        pusha
        sub     dx, 100h
        mov     bx, 1000h
        div     bx
        mov     bl, 80h
        div     bl
        mov     ch, al
        shl     ch, 1
        add     ch, al
        add     ch, 0ch
        mov     al, ah
        mov     ah, 0
        mov     bl, 8
        div     bl
        mov     cl, ah
        mov     ah, 9
        mul     ah
        add     al, 35h
        add     cl, al
        mov     dl, 1
        mov     dh, 3
L_1C84B:
        BC_SEQ_OP
L_1C84E:
        popa
        ret
dma_transfer_init:
        or      cx, cx
L_1C852:
        jne     L_1C855
        ret
L_1C855:
        cli
        pusha
        mov     bh, 45h
        mov     bl, 6fh
calls_dma_setup_transfer_1c85b:
        call    dma_setup_transfer
        popa
        sti
        ret
L_1C861:
        or      cx, cx
L_1C863:
        jne     L_1C866
        ret
L_1C866:
        cli
        pusha
        mov     bh, 49h
L_1CD63:
        mov     bl, 4fh
calls_dma_setup_transfer_1c86c:
        call    dma_setup_transfer
        popa
        sti
        ret
dma_setup_transfer:
        mov     dx, 0c03fh
        in      al, dx
        or      al, 8
        out     dx, al
        xor     ax, ax
        out     80h, ax
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
        out     86h, ax
        mov     ax, dx
        out     84h, ax
L_1C899:
        mov     ax, di
        shl     ax, 0ch
        out     82h, ax
        mov     ax, 100h
        out     80h, ax
        mov     ax, 0fh
        out     86h, ax
        mov     ax, 0ffffh
        out     84h, ax
        mov     ax, 1000h
        out     82h, ax
        mov     ax, 200h
        out     80h, ax
        xor     ax, ax
        out     8ch, ax
        mov     dx, 1eh
L_1C8C0:
        mov     ax, dx
        out     80h, ax
tgt_1C8C4:
        mov     ax, 100h
        out     86h, ax
        sub     dx, 2
        jne     L_1C8C0
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
        cmp     al, 8
        jb      br_1C8FD
        or      al, 10h
br_1C8FD:
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
        out     88h, ax
L_1C918:
        mov     dx, 0c03bh
        in      al, dx
        test    al, 8
        je      L_1C918
        cmp     bl, 4fh
L_1C923:
        jne     br_1C939
        mov     dx, di
        add     dx, cx
        shl     dx, 0ch
loop_1C92C:
        xor     ax, ax
        out     80h, ax
        in      ax, 82h
        and     ax, 0f000h
        cmp     ax, dx
        jne     loop_1C92C
br_1C939:
        xor     ax, ax
        out     80h, ax
        mov     ah, 1
        out     86h, ax
        xor     ax, ax
        out     88h, ax
L_1C945:
        in      al, 88h
        test    al, 80h
        jne     L_1C945
        ret
        if      FW_VERSION = 150
        db      00h
        endif
main_screen_draw:
        BC_SEQ_INIT
L_1C94F:
        mov     byte ptr [B_0B1C], 1
L_1C954:
        BC_MODE
        db      0eh
L_1C958:
        call    main_screen_draw_frame
L_1C95B:
        SCR_MAIN_SEQUENCE
status_count_1ca12:
        retf
main_screen_draw_frame:
        PANE_MAIN_SEQUENCE_FRAME
L_1CA77:
        retf
sequence_dialog_1CA78:
        BC_FILE_DIALOG 16, 2, 216, 58, "Sequence"
sequence_name_status_1CA88:
        BC_PLANE_A
sequence_name_status:
        BC_STATUS 32, 16, "Sequence name:"
default_name_status:
        BC_STATUS 32, 29, " Default name:"
status_default_name_1cab3:
        mov     si, D_1679
        mov     dx, ds
L_1CAB8:
        BC_STATUS_B 54, 40, 24
        db      0beh, 02h, 00h, 8ch, 0dah
        if      FW_VERSION = 150
L_1CFC7                         equ     $+10
        endif
L_1CAC3:
        BC_STATUS_B 116, 29, 16
L_1CAC9:
        BC_SOFTKEY 2, BC_SK_BOX,   "DELETE"
softkey_delete_1cad5:
        BC_SOFTKEY 4, BC_SK_FILL,  "CLOSE"
softkey_close_1cae0:
        BC_SOFTKEY 5, BC_SK_BOX,   " COPY "
sq_1_status_1CAEC:
        retf
        if      FW_VERSION = 150
L_1CFF2                         equ     $+11
L_1D003                         equ     $+28
L_1D059                         equ     $+114
L_1D061                         equ     $+122
        endif
delete_sequence_dialog_1CAED:
        DLG_DELETE_SEQUENCE
softkey_do_it_1cb6e:
        retf
        if      FW_VERSION = 150
L_1D06E                         equ     $+5
        endif
delete_all_sequences_dialog_1CB6F:
        DLG_DELETE_ALL_SEQUENCES
sq_2_status_1CBE4:
        retf
        if      FW_VERSION = 150
L_1D110                         equ     $+49
        endif
copy_sequence_dialog_1CBE5:
        DLG_COPY_SEQUENCE
display_style_status_1CC45:
        retf
        if      FW_VERSION = 150
L_1D142                         equ     $+2
        endif
time_display_dialog_1CC46:
        DLG_TIME_DISPLAY
softkey_close_1ccb2:
        retf
timing_correct_dialog:
        if      FW_VERSION = 150
L_1D1C0                         equ     $+19
L_1D1C1                         equ     $+20
        endif
        BC_FILE_DIALOG 16, 2, 216, 58, "Timing Correct"
L_1CCC9:
        BC_MEM_COPY 21, 20, 206
note_value_status_1CCCF:
        BC_MEM_COPY 21, 30, 206
note_value_status:
        if      FW_VERSION = 150
L_1D1D2                         equ     $+3
L_1D1D6                         equ     $+7
L_1D1D8                         equ     $+9
L_1D1DE                         equ     $+15
L_1D204                         equ     $+53
L_1D231                         equ     $+98
L_1D23D                         equ     $+110
        endif
        BC_STATUS 26, 12, "Note value:             "
shift_timing_amount_status:
        BC_STATUS 26, 22, "Shift timing:           amount:  "
time_status:
        if      FW_VERSION = 172
        BC_STATUS 26, 32, " Time:###.##.## - ###.##.##"
        else
        BC_STATUS 26, 32, "Times:###.##.## - ###.##.##"
        endif
status_time___1cd3b:
        BC_SOFTKEY 4, BC_SK_FILL,  "CLOSE"
softkey_close_1cd46:
        BC_SOFTKEY 5, BC_SK_BOX,   "DO IT"
bar_new_tsig_status_1CD51:
        retf
bar_new_tsig_status:
        if      FW_VERSION = 150
L_1D259                         equ     $+13
        endif
        DLG_CHANGE_TSIG_CONFIRM
current_eq_new_bars_status:
        retf
        if      FW_VERSION = 150
L_1D2D2                         equ     $+2
L_1D2E4                         equ     $+20
L_1D2F4                         equ     $+36
L_1D2FD                         equ     $+45
        endif
change_bars_dialog_1CDD6:
        DLG_CHANGE_BARS
L_1CE3C:
        retf
        if      FW_VERSION = 150
L_1D352                         equ     $+27
        endif
after_bar_first_bar_status_1CE3D:
        DLG_CHANGE_BARS_INSDEL
        retf
track_dialog:
        BC_FILE_DIALOG 16, 2, 216, 58, "Track"
track_name_status_1CF56:
        BC_PLANE_A
track_name_status:
        BC_STATUS 32, 15, "   Track name:"
default_status:
        BC_STATUS 32, 30, "      Default:"
status_default_1cf81:
        mov     si, D_1679
        mov     dx, ds
L_1CF86:
        KEYS_TRACK_DELETE_COPY
tr_2_status_1CFB5:
        retf
delete_track_dialog:
        DLG_DELETE_TRACK
L_1D039:
        retf
delete_all_tracks_dialog_1D03A:
        if      FW_VERSION = 172
        BC_FILE_DIALOG 50, 6, 190, 54, "Delete ALL Tracks"
        else
        BC_FILE_DIALOG 50, 6, 190, 54, "Delete AL,L Tracks"
        endif
L_1D053:
        if      FW_VERSION = 172
L_1D058                         equ     $+5
        endif
        BC_WAIT 60, 22, BMP_WARNING
L_1D05A:
        if      FW_VERSION = 172
pressing_do_it_will_status_1D060 equ     $+6
        endif
        BC_WAIT 217, 26, BMP_PEN_KEYS
pressing_do_it_will_status:
        BC_STATUS 86, 25, "Pressing DO IT will   "
erase_all_track_data_status:
        BC_STATUS 86, 34, "erase ALL track data!!"
status_erase_all_track_data_1d099:
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
softkey_cancel_1d0a5:
        BC_SOFTKEY 5, BC_SK_BOX,   "DO IT"
tr_3_status_1D0B0:
        retf
copy_track_dialog:
        DLG_COPY_TRACK
soft_thru_receive_ch_status_1D10A:
        retf
midi_input_dialog_1D10B:
        DLG_MIDI_INPUT
sq_eq_status:
        retf
        if      FW_VERSION = 150
L_1D6BD                         equ     $+7
        endif
record_all_16_channels_dialog:
        DLG_REC_ALL_16_WARN
        db      0cbh
record_all_16_channels_1_dialog:
        DLG_REC_ALL_16_ACTIVE
        db      0cbh
edit_velocity_dialog_1D31B:
        DLG_EDIT_VELOCITY
        if      FW_VERSION = 172
softkey_do_it_1d391:
        endif
        retf
program_change_dialog:
        if      FW_VERSION = 150
L_1D8A1                         equ     $+20
L_1D8AB                         equ     $+30
L_1D8BF                         equ     $+50
        endif
        DLG_PROGRAM_CHANGE
first_bar_status_1D3EC:
        retf
loop_1_dialog:
        DLG_LOOP_BARS
        retf
countmetronome_dialog:
        if      FW_VERSION = 150
L_1D9AC                         equ     $+20
        endif
        DLG_COUNT_METRONOME
        db      0cbh
        if      FW_VERSION = 172
edit_copy_frame_draw:
        else
L_1DA38                         equ     $+2
        endif
        PANE_COPY_ARROW
L_1D585:
        retf
edit_seq_screen_draw:
        BC_WAIT_LOAD
        db      45h
        push    si
        inc     bp
        dec     si
        push    sp
        push    bx
        add     byte ptr [bp+si+41h], al
        push    dx
        push    bx
        add     byte ptr [si+72h], dh
        dec     bp
        dec     di
        push    si
        inc     bp
        add     byte ptr [si+52h], dl
        inc     cx
        dec     si
        push    bx
        add     byte ptr [di+53h], dl
        inc     bp
        push    dx
        add     byte ptr [si+4fh], al
        and     byte ptr [bx+di+54h], cl
        add.d0  bl, cl
from_sq_tr_to_sq_tr_status_1D5AE:
        SCR_COPY_EVENTS_FIELDS
status_copies_1d624:
        push    cs
L_1D625:
        if      FW_VERSION = 172
        call    edit_copy_frame_draw
L_1D628:
        else
        call    L_1D9AC+138
        endif
        BC_BUFFER 0, 2, 2, 2, 2, 1
L_1D631:
        push    cs
copy_3_status_1D632:
        call    edit_seq_screen_draw
        retf
copy_events_dialog_1D636:
        if      FW_VERSION = 150
L_1DB45                         equ     $+20
        endif
        DLG_COPY_EVENTS
softkey_close_1d69b:
        retf
copy_bars_screen_draw:
        if      FW_VERSION = 150
L_1DBA9                         equ     $+18
L_1DBB5                         equ     $+30
L_1DBC1                         equ     $+42
        endif
        SCR_COPY_BARS_FIELDS
status_last_bar____________copies_1d722:
        push    cs
L_1D723:
        if      FW_VERSION = 172
        call    edit_copy_frame_draw
L_1D726:
        else
L_1DC20                         equ     $+2
        call    L_1D9AC+138
        endif
        PANE_COPY_BARS_RANGES
        db      0eh
L_1D7A5:
        call    edit_seq_screen_draw
        retf
copy_bars_dialog_1D7A9:
        if      FW_VERSION = 150
L_1DCAE                         equ     $+10
        endif
        DLG_COPY_BARS
softkey_close_1d7f4:
        retf
L_1D7F5:
        SCR_SELECT_TRACK_TO_MOVE
L_1D875:
        retf
L_1D876:
        BC_PLANE_A
L_1D879:
        BC_CLEAR
L_1D87C:
        BC_MEM_ALLOC 0, 0, 216
L_1D882:
        BC_MEM_COPY 0, 10, 216
L_1D888:
        BC_MEM_COPY 0, 23, 246
L_1D88E:
        BC_MEM_ALLOC 216, 10, 33
L_1D894:
        BC_MEM_ALLOC 0, 48, 248
L_1D89A:
        BC_MEM_ALLOC 1, 49, 247
L_1D8A0:
        BC_MEM_FREE 0, 0, 48
L_1D8A6:
        BC_MEM_FREE 216, 0, 11
L_1D8AC:
        BC_MEM_FREE 217, 1, 10
L_1D8B2:
        BC_MEM_FREE 246, 10, 38
        if      FW_VERSION = 172
L_1D8B8:
        else
L_1DDCA                         equ     $+23
L_1DE26                         equ     $+115
L_1DE3F                         equ     $+140
        endif
        BC_MEM_FREE 247, 11, 37
tr_4_status_1D8BE:
        BC_STATUS 2, 2, "Tr:##-"
tr00_eq_all_status:
        BC_STATUS 146, 2, "<Tr:00=ALL>"
transpose_amount_except_d_status:
        BC_STATUS 4, 13, "Transpose amount:###    <except drum tr>"
pressing_fix_will_change__status:
        BC_STATUS 4, 25, " Pressing FIX will change the note data"
        if      FW_VERSION = 172
permanently_bar_status:
        BC_STATUS 4, 36, " permanently!!            Bar:    -    "
status_permanently____________bar_____1d963:
        else
        BC_STATUS 4, 34, " permanently!!"
        endif
        push    cs
L_1D964:
        call    edit_seq_screen_draw
L_1D967:
        if      FW_VERSION = 172
        else
L_1DE51                         equ     $+8
L_1DE58                         equ     $+15
L_1DE5A                         equ     $+17
        endif
        BC_SOFTKEY 6, BC_SK_BOX,   "FIX"
softkey_fix_1d970:
        BC_BUFFER 2, 2, 2, 0, 2, 1
L_1D979:
        retf
transpose_permanent_dialog:
        if      FW_VERSION = 150
L_1DE6C                         equ     $+16
L_1DE72                         equ     $+22
L_1DE73                         equ     $+23
        endif
        DLG_TRANSPOSE_PERMANENT
softkey_do_it_1d9e9:
        retf
user_defaults_screen_draw:
        BC_CLEAR
L_1D9ED:
        push    cs
L_1D9EE:
        call    main_screen_draw_frame
L_1D9F1:
        SCR_MAIN_SCREEN_DEFAULTS
L_1DAAF:
        push    cs
L_1DAB0:
        call    edit_seq_screen_draw
ui_ctrl_1dab3:
        BC_SOFTKEY 6, BC_SK_PLAIN, " "
ui_ctrl_1daba:
        retf
disk_load_view_draw:
        if      FW_VERSION = 150
L_1DFAC                         equ     $+15
        endif
        SCR_DISK_LOAD_VIEW
status_seq______k_1db43:
        retf
load_sequence_dialog_draw:
        if      FW_VERSION = 150
L_1E038                         equ     $+18
        endif
        DLG_LOAD_A_SEQUENCE
        db      0cbh
L_1E087_V150:
L_1E0B0                         equ     $+41
L_1E126                         equ     $+159
        DLG_LOAD_ALL_FILE
softkey_load_1dc46:
        retf
load_a_sequence_1_dialog:
        if      FW_VERSION = 150
L_1E133                         equ     $+10
L_1E141                         equ     $+24
L_1E15C                         equ     $+51
        endif
        DLG_LOAD_A_SEQUENCE_NUM
softkey_keep_1dca4:
        retf
mpc_all_file_load_warning_draw:
        if      FW_VERSION = 150
L_1E19E                         equ     $+23
L_1E211                         equ     $+138
        endif
        SCR_LOAD_ALL_FILE_BODY
softkey_load_1dd31:
        retf
load_a_sequence_2_dialog:
        if      FW_VERSION = 150
L_1E21E                         equ     $+10
L_1E22C                         equ     $+24
L_1E24F                         equ     $+59
L_1E261                         equ     $+77
        endif
        DLG_LOAD_A_SEQUENCE_NAME
softkey_keep_1dd94:
        retf
load_a_program_dialog:
        if      FW_VERSION = 150
L_1E289                         equ     $+18
        endif
        BC_FILE_DIALOG 29, 2, 190, 58, "Load a Program"
L_1DDAB:
        call    load_pgm_options_draw
        retf
load_a_set_dialog:
        if      FW_VERSION = 150
L_1E29B                         equ     $+10
        endif
        BC_FILE_DIALOG 29, 2, 190, 58, "Load a SET"
        db      0e8h
        add     word ptr [bx+si], ax
        retf
load_pgm_options_draw:
        SCR_LOAD_PROGRAM_REPLACE
L_1DE5E:
        ret
load_a_set_1_dialog:
        if      FW_VERSION = 150
L_1E34C                         equ     $+11
L_1E362                         equ     $+33
L_1E368                         equ     $+39
L_1E371                         equ     $+48
L_1E396                         equ     $+85
L_1E398                         equ     $+87
        endif
        DLG_LOAD_A_SET
L_1DEF0:
        retf
load_aps_file_dialog:
        if      FW_VERSION = 150
L_1E418                         equ     $+69
        endif
        DLG_LOAD_APS_FILE
        if      FW_VERSION = 150
softkey_do_it_1d391:
        endif
status_programs__samples_1df58:
        retf
        if      FW_VERSION = 150
L_1E450                         equ     $+21
L_1E473                         equ     $+56
        endif
delete_file_dialog_1DF59:
        DLG_DELETE_FILE
softkey_do_it_1dfc0:
        retf
delete_f_rom_sound_dialog:
        if      FW_VERSION = 150
L_1E4C2                         equ     $+31
L_1E4D2                         equ     $+47
        endif
        DLG_DELETE_FROM_SOUND
softkey_do_it_1e043:
        retf
format_disk_screen_draw:
        SCR_WIPE_DISK_WARN
        db      "LOAD", 000h, "SAVE", 000h, "FORMAT"
        db      000h, "DELETE", 000h, 020h, 000h, 044h, 04fh, 020h, 049h, 054h, 000h
ui_ctrl_1e0a4:
        BC_BUFFER 2, 2, 0, 2, 0, 1
        if      FW_VERSION = 172
ui_ctrl_1e0ad:
        endif
        BC_UI_CTRL 46, 0, 38, 9
L_1E0B4:
        retf
conversion_table_dialog:
        DLG_CONVERSION_TABLE
softkey_load_1e113:
        retf
ui_ctrl_1e114:
        SCR_DISK_SAVE_VIEW
        db      "LOAD", 000h, "SAVE", 000h, "FORMAT"
        db      000h, "DELETE", 000h, 020h, 000h, 044h, 04fh, 020h, 049h, 054h, 000h
L_1E198:
        BC_BUFFER 2, 0, 2, 2, 0, 1
ui_ctrl_1e1a1:
        retf
save_all_sequences_songs_status:
        if      FW_VERSION = 150
L_1E688                         equ     $+4
L_1E6A4                         equ     $+32
        endif
        BC_STATUS 30, 1, "Save All Sequences & Songs          "
        if      FW_VERSION = 172
status_save_all_sequences__songs_1e1cc:
        else
L_1E6BC                         equ     $+14
        endif
        BC_UI_CTRL 28, 0, 160, 9
ui_ctrl_1e1d3:
        retf
save_a_sequence_status:
        BC_STATUS 30, 1, "Save a Sequence                     "
        if      FW_VERSION = 172
status_save_a_sequence_1e1fe:
        else
L_1E6F2                         equ     $+18
        endif
        BC_UI_CTRL 28, 0, 160, 9
ui_ctrl_1e205:
        retf
save_all_programs_sounds_status:
        BC_STATUS 30, 1, "Save All Programs & Sounds          "
status_save_all_programs__sounds_1e230:
        BC_UI_CTRL 28, 0, 160, 9
L_1E237:
        retf
save_aps_files_dialog:
        if      FW_VERSION = 150
L_1E728                         equ     $+14
        endif
        BC_FILE_DIALOG 16, 2, 216, 58, "Save APS files"
save_1_status:
        if      FW_VERSION = 172
        else
L_1E73B                         equ     $+11
        endif
        BC_STATUS 54, 13, "    Save:"
replace_same_sounds_status:
        BC_STATUS 54, 23, "Replace same sounds:"
file_name_1_status:
        BC_STATUS 36, 40, "File^name:"
status_filename_1e287:
        retf
save_a_program_sounds_status:
        if      FW_VERSION = 150
L_1E773                         equ     $+9
        endif
        BC_STATUS 30, 1, "Save a Program & Sounds             "
status_save_a_program__sounds_1e2b2:
        BC_UI_CTRL 28, 0, 160, 9
L_1E2B9:
        retf
save_a_program_dialog:
        if      FW_VERSION = 150
L_1E7A7                         equ     $+11
L_1E7BD                         equ     $+33
        endif
        BC_FILE_DIALOG 29, 2, 190, 58, "Save a Program"
save_2_status:
        BC_STATUS 54, 13, "    Save:"
        if      FW_VERSION = 172
replace_same_sounds_1_status:
        else
L_1E7C3                         equ     $+2
        endif
        BC_STATUS 54, 23, "Replace same sounds:"
file_5_status:
        BC_STATUS 54, 40, "File:"
status_file_1e304:
        retf
save_a_sound_status:
        if      FW_VERSION = 150
L_1E7E8                         equ     $+1
L_1E80C                         equ     $+37
        endif
        BC_STATUS 30, 1, "Save a Sound                        "
status_save_a_sound_1e32f:
        BC_UI_CTRL 28, 0, 160, 9
        retf
wipe_disk_dialog_1E337:
        DLG_WIPE_DISK
softkey_wipe_1e390:
        retf
file_exists_dialog_1E391:
        DLG_FILE_EXISTS
softkey_rename_1e3da:
        cmp     byte ptr [G_DISK_DEVICE], 9
L_1E3DF:
        jne     replace_or_rename_status
        retf
replace_or_rename_status:
        if      FW_VERSION = 150
L_1E8CA                         equ     $+6
        endif
        BC_STATUS 70, 30, "Replace or rename?"
status_replace_or_rename_1e3fa:
        BC_SOFTKEY 3, BC_SK_BOX,   "REPLAC"
softkey_replac_1e406:
        retf
        if      FW_VERSION = 150
L_1E8EB                         equ     $+2
        endif
rename_file_1_dialog:
        BC_FILE_DIALOG 29, 2, 190, 58, "Rename file"
new_name_2_status:
        BC_STATUS 36, 24, "New name:"
status_new_name_1e429:
        mov     si, D_1679
        mov     dx, ds
L_1E42E:
        BC_STATUS_B 54, 40, 24
L_1E434:
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
softkey_cancel_1e440:
        BC_SOFTKEY 5, BC_SK_BOX,   "DO IT"
softkey_do_it_1e44b:
        retf
        if      FW_VERSION = 150
L_1E939                         equ     $+11
        endif
ui_ctrl_1e44c:
        SCR_COPY_OS
status_insert_os_disk_and_press_do_it_1e4dd:
        retf
        if      FW_VERSION = 150
L_1E9C4                         equ     $+4
L_1E9CE                         equ     $+14
L_1E9EE                         equ     $+46
L_1E9FA                         equ     $+58
        endif
select_destination_dialog_1E4DE:
        DLG_SELECT_DESTINATION
status_size000k_1e52d:
        retf
        if      FW_VERSION = 150
L_1EA18                         equ     $+8
L_1EA19                         equ     $+9
L_1EA26                         equ     $+22
L_1EA2A                         equ     $+26
L_1EA2C                         equ     $+28
L_1EA31                         equ     $+33
        endif
not_enough_memory_dialog_1E52E:
        DLG_NOT_ENOUGH_MEMORY
softkey_ok_1e5a4:
        retf
change_disk_dialog_1E5A5:
        BC_FILE_DIALOG 29, 2, 190, 58, "Change Disk"
L_1E5B8:
        if      FW_VERSION = 172
L_1E5BB                         equ     $+3
        endif
        BC_WAIT 38, 20, BMP_FLOPPY
insert_destination_disk_status:
        if      FW_VERSION = 150
L_1EAA8                         equ     $+7
L_1EAB6                         equ     $+21
L_1EAB8                         equ     $+23
L_1EACF                         equ     $+46
        endif
        BC_STATUS 66, 22, "Insert destination disk"
and_press_do_it_status:
        BC_STATUS 66, 31, "and press DO IT."
status_and_press_do_it_1e5f2:
        retf
        if      FW_VERSION = 150
ui_ctrl_1e0ad:
        endif
auto_punch_graphic_draw:
        BC_CLEAR_RECT 30, 14, 188, 28
L_1E5FA:
        BC_UI_5C 30, 36, 188, 6
L_1E601:
        BC_MEM_FREE 76, 37, 4
L_1E607:
        BC_MEM_FREE 172, 37, 4
L_1E60D:
        cmp     byte ptr [G_PUNCH_MODE], 1
L_1E612:
        jb      L_1E671
L_1E614:
        jne     L_1E619
        jmp     NEAR L_1E6B0
L_1E619:
        PANE_COPY_IN_OUT
status_in_out_1e63f:
        mov     dx, word ptr [G_RANGE_START_BEAT_TICKS]
        mov     ax, word ptr [G_RANGE_START_BAR]
        mov     cx, word ptr [G_RANGE_START_TICK]
L_1E64A:
        BC_RANGE 50, 23
L_1E64F:
        mov     dx, word ptr [G_RANGE_END_BEAT_TICKS]
        mov     ax, word ptr [G_RANGE_END_BAR]
        mov     cx, word ptr [G_RANGE_END_TICK]
        if      FW_VERSION = 150
L_1EB3F                         equ     $+3
        endif
L_1E65A:
        BC_RANGE 146, 23
L_1E65F:
        BC_STATUS 72, 14, "IN"
out_2_status:
        BC_STATUS 164, 14, "OUT"
        if      FW_VERSION = 172
status_out_1e670:
        endif
        retf
        if      FW_VERSION = 150
L_1EB5E                         equ     $+11
        endif
L_1E671:
        PANE_COPY_IN_ONLY
status_in_only_1e697:
        mov     dx, word ptr [G_RANGE_START_BEAT_TICKS]
        mov     ax, word ptr [G_RANGE_START_BAR]
        mov     cx, word ptr [G_RANGE_START_TICK]
L_1E6A2:
        BC_RANGE 50, 23
L_1E6A7:
        BC_STATUS 72, 14, "IN"
status_in_1e6af:
        retf
        if      FW_VERSION = 150
status_out_1e670:
        endif
L_1E6B0:
        PANE_COPY_OUT_ONLY
status_out_only_1e6d6:
        mov     dx, word ptr [G_RANGE_END_BEAT_TICKS]
        mov     ax, word ptr [G_RANGE_END_BAR]
        mov     cx, word ptr [G_RANGE_END_TICK]
L_1E6E1:
        BC_RANGE 146, 23
out_3_status:
        BC_STATUS 164, 14, "OUT"
status_out_1e6ef:
        retf
song_screen_draw:
        SCR_SONG
softkey_insert_1e7f7:
        retf
ferr_disk_read_error:
        INT_2A "     Disk read error !!     "
ferr_no_system_file:
        INT_2A "      No system file !!     "
ferr_unreadable_format:
        INT_2A "     Unreadable format !!   "
ferr_insufficient_memory:
        INT_2A "    Insufficient Memory !!  "
ferr_wrong_file:
        INT_2A "        Wrong file !!       "
ferr_file_not_found:
        INT_2A "      File not found !!     "
ferr_scsi_conflict_id6:
        INT_2A "   SCSI conflict on ID#6 !  "
ferr_relocation_error:
        INT_2A "    Relocation error !!     "
ferr_too_many_files:
        if      FW_VERSION = 172
        INT_2A "     Too many files  !!     "
        else
        INT_2A "     To match files  !!     "
        endif
ferr_write_protect:
        INT_2A "      Write protect !!      "
ferr_no_disk:
        INT_2A "         No disk !!         "
ferr_format_invalid:
        INT_2A "    Format is Invalid !!    "
ferr_scsi_not_ready:
        INT_2A "      SCSI Not ready !!     "
ferr_no_scsi_device:
        INT_2A "      No SCSI device !!     "
ferr_write_error:
        INT_2A "       Write error !!       "
ferr_wrong_disk:
        INT_2A "        Wrong disk !!       "
ferr_no_f_rom:
        INT_2A "        No F-ROM !!         "
all_sequence_and_songs_dialog:
        BC_FILE_DIALOG 29, 2, 190, 58, "All Sequence & Songs"
new_name_3_status:
        if      FW_VERSION = 150
L_1EF0E                         equ     $+9
        endif
        BC_STATUS 36, 24, "New name:"
status_new_name_1ea32:
        mov     si, D_1679
        mov     dx, ds
L_1EA37:
        BC_STATUS_B 54, 40, 24
        if      FW_VERSION = 150
L_1EF27                         equ     $+8
        endif
L_1EA3D:
        BC_SOFTKEY 4, BC_SK_FILL,  "CLOSE"
softkey_close_1ea48:
        retf
arrange_f_rom_dialog:
        DLG_ARRANGE_FROM
softkey_do_it_1ead4:
        retf
track_mute_screen_draw:
        push    cs
L_1EAD6:
        call    main_screen_draw_frame
L_1EAD9:
        SCR_PAD_BANK
status_now______1eb26:
        retf
        if      FW_VERSION = 172
caution_dialog_1EB27:
        BC_FILE_DIALOG 16, 2, 216, 58, "CAUTION!!"
file_size_is_over_250k_by_status:
        BC_STATUS 30, 11, "File^size^is^over^250k^byte."
mpc_cant_load_a_single_se_status:
        BC_STATUS 30, 20, "MPC can't^load^a^single^sequence"
of_over_250k_byte_saving__status:
        BC_STATUS 30, 29, "of^over^250K^byte.^Saving^in ALL"
file_enables_the_file_to__status:
        BC_STATUS 30, 38, "file^enables^the^file^to^be^loaded."
status_fileenablesthefiletobeloaded_1ebcf:
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
softkey_cancel_1ebdb:
        BC_SOFTKEY 5, BC_SK_BOX,   "SAVE"
softkey_save_1ebe5:
        retf
caution_1_dialog:
        BC_FILE_DIALOG 29, 2, 190, 58, "CAUTION!!"
cant_load_this_file_not_status:
        BC_STATUS 46, 11, "Can't load this file! (Not"
enough_sequence_memory_status:
        BC_STATUS 46, 20, "enough sequence memory)"
mpc_needs_memory_space_of_status:
        BC_STATUS 46, 29, "MPC needs memory space of"
double_the_file_size_status:
        BC_STATUS 46, 38, "double the file size."
status_double_the_file_size_1ec6e:
        BC_SOFTKEY 4, BC_SK_FILL,  "CLOSE"
softkey_close_1ec79:
        retf
        else
        db      00h
        endif
isr_int01_int03:
        sti
        pusha
        push    ds
        push    es
L_1EC7E:
        call    debug_dump_registers
L_1EC81:
        mov     byte ptr [B_14CF], 0
        mov     byte ptr [G_SHIFT_HELD], 0
L_1EC8B:
        KEYS_STEP_DUMP_RUN
L_1ECB5:
        callf   CS0_SEG:calls_compare_bytes_d20_00468
        cmp     bh, 84h
        jne     L_1ECCE
        cmp     bl, 1
L_1ECC2:
        je      isr_1ECE6
        cmp     bl, 2
L_1ECC7:
        je      L_1ED00
        cmp     bl, 3
L_1ECCC:
        je      isr_1ECF2
L_1ECCE:
        mov     ax, 0
        xchg    word ptr [G_WHEEL_DEC_PENDING], ax
        or      ax, ax
L_1ECD7:
        jne     isr_1ECE6
        mov     ax, 0
        xchg    word ptr [G_WHEEL_INC_PENDING], ax
        or      ax, ax
L_1ECE2:
        jne     isr_1ECF2
        jmp     SHORT L_1ECB5
isr_1ECE6:
        mov     bp, sp
        mov     al, byte ptr [bp+19h]
        or      al, 1
        mov     byte ptr [bp+19h], al
        jmp     SHORT isr_1ECFC
isr_1ECF2:
        mov     bp, sp
        mov     al, byte ptr [bp+19h]
        and     al, 0feh
        mov     byte ptr [bp+19h], al
isr_1ECFC:
        pop     es
        pop     ds
        popa
        iret
L_1ED00:
        mov     bx, 0
        int     4
        jmp     NEAR L_1EC81
isr_int06:
        sti
        pusha
        push    ds
        push    es
L_1ED0C:
        BC_PLANE_PUSH_VIS
L_1ED0F:
        call    debug_dump_registers
L_1ED12:
        BC_FLUSH
        db      07h, 1fh, 61h, 0cfh
debug_dump_registers:
        sti
        push    sp
        push    ss
        push    es
        push    ds
        push    di
        push    si
        push    bp
        push    dx
        push    cx
        push    bx
        push    ax
        mov     ax, DATA_SEG
        mov     ds, ax
L_1ED2A:
        BC_PLANE_PUSH_VIS
L_1ED2D:
        BC_CLEAR_RECT 0, 0, 248, 60
L_1ED34:
        BC_STATUS 0, 0, "AX:"
status_ax_1ed3d:
        pop     ax
        mov     cl, 12h
        mov     ch, 0
calls_memory_block_op_1ed42:
        call    memory_block_op
L_1ED45:
        BC_STATUS 0, 8, "BX:"
status_bx_1ed4e:
        pop     ax
        mov     cl, 12h
        mov     ch, 8
calls_memory_block_op_1ed53:
        call    memory_block_op
L_1ED56:
        BC_STATUS 0, 16, "CX:"
status_cx_1ed5f:
        pop     ax
        mov     cl, 12h
        mov     ch, 10h
calls_memory_block_op_1ed64:
        call    memory_block_op
L_1ED67:
        BC_STATUS 0, 24, "DX:"
status_dx_1ed70:
        pop     ax
        mov     cl, 12h
        mov     ch, 18h
calls_memory_block_op_1ed75:
        call    memory_block_op
L_1ED78:
        BC_STATUS 0, 32, "BP:"
status_bp_1ed81:
        pop     ax
        mov     cl, 12h
        mov     ch, 20h
calls_memory_block_op_1ed86:
        call    memory_block_op
L_1ED89:
        BC_STATUS 60, 0, "SI:"
status_si_1ed92:
        pop     ax
        mov     cl, 4eh
        mov     ch, 0
calls_memory_block_op_1ed97:
        call    memory_block_op
L_1ED9A:
        BC_STATUS 60, 8, "DI:"
status_di_1eda3:
        pop     ax
        mov     cl, 4eh
        mov     ch, 8
calls_memory_block_op_1eda8:
        call    memory_block_op
L_1EDAB:
        BC_STATUS 60, 16, "DS:"
status_ds_1edb4:
        pop     ax
        mov     cl, 4eh
        mov     ch, 10h
calls_memory_block_op_1edb9:
        call    memory_block_op
L_1EDBC:
        BC_STATUS 60, 24, "ES:"
status_es_1edc5:
        pop     ax
        mov     cl, 4eh
        mov     ch, 18h
calls_memory_block_op_1edca:
        call    memory_block_op
L_1EDCD:
        BC_STATUS 60, 40, "SS:"
status_ss_1edd6:
        pop     ax
        mov     cl, 4eh
        mov     ch, 28h
calls_memory_block_op_1eddb:
        call    memory_block_op
L_1EDDE:
        BC_STATUS 108, 40, "SP:"
status_sp_1ede7:
        pop     ax
        mov     cl, 7eh
        mov     ch, 28h
        call    memory_block_op
L_1EDEF:
        BC_STATUS 0, 40, "PC:"
status_pc_1edf8:
        mov     bp, sp
        mov     ax, word ptr [bp+16h]
        mov     cl, 12h
        mov     ch, 28h
calls_memory_block_op_1ee01:
        call    memory_block_op
        if      FW_VERSION = 150
L_1F197                         equ     $+3
        endif
L_1EE04:
        BC_STATUS 60, 32, "CS:"
status_cs_1ee0d:
        mov     bp, sp
        mov     ax, word ptr [bp+18h]
        mov     cl, 4eh
        mov     ch, 20h
calls_memory_block_op_1ee16:
        call    memory_block_op
        ret
isr_int04_overflow:
        sti
        pusha
        push    es
        push    ds
        mov     ax, DATA_SEG
        mov     ds, ax
        mov     byte ptr [B_14CF], 0
        mov     byte ptr [G_SHIFT_HELD], 0
        or      bx, bx
L_1EE2F:
        je      L_1EE39
        mov     word ptr [DBG_DUMP_SEG], bx
        mov     word ptr [DBG_DUMP_OFS], si
L_1EE39:
        BC_PLANE_PUSH_VIS
L_1EE3C:
        BC_CLEAR_RECT 0, 0, 248, 60
L_1EE43:
        mov     word ptr [DBG_DUMP_OFS_STEP], 6
        mov     word ptr [DBG_DUMP_SEG_STEP], 0
L_1EE4F:
        KEYS_SEG_DIVISORS
L_1EE90:
        call    debug_hexdump_draw
L_1EE93:
        BC_FLUSH
L_1EE96:
        callf   CS0_SEG:calls_compare_bytes_d20_00468
        cmp     bh, 84h
L_1EE9E:
        je      L_1EEB5
L_1EEA0:
        call    L_1EED3
L_1EEA3:
        call    L_1EEF6
        cmp     word ptr [DBG_DUMP_LIVE], 0
L_1EEAB:
        je      L_1EE96
L_1EEAD:
        call    debug_hexdump_draw
L_1EEB0:
        BC_FLUSH
L_1EEB3:
        jmp     SHORT L_1EE96
L_1EEB5:
        cmp     bl, 0bh
L_1EEB8:
        je      L_1EEC5
L_1EEBA:
        call    L_1EF19
L_1EEBD:
        call    debug_hexdump_draw
L_1EEC0:
        BC_FLUSH
L_1EEC3:
        jmp     SHORT L_1EE96
L_1EEC5:
        BC_CLEAR_RECT 0, 0, 240, 60
L_1EECC:
        BC_PLANE_POP
        db      1fh, 07h, 61h, 0cfh
L_1EED3:
        sub     ax, ax
        xchg    word ptr [G_WHEEL_INC_PENDING], ax
        or      ax, ax
L_1EEDB:
        jne     L_1EEDE
        ret
L_1EEDE:
        mov     dx, word ptr [DBG_DUMP_OFS_STEP]
        mul     dx
        add     word ptr [DBG_DUMP_OFS], ax
        mov     ax, word ptr [DBG_DUMP_SEG_STEP]
        add     word ptr [DBG_DUMP_SEG], ax
        call    debug_hexdump_draw
L_1EEF2:
        BC_FLUSH
L_1EEF5:
        ret
L_1EEF6:
        sub     ax, ax
        xchg    word ptr [G_WHEEL_DEC_PENDING], ax
        or      ax, ax
L_1EEFE:
        jne     L_1EF01
        ret
L_1EF01:
        mov     dx, word ptr [DBG_DUMP_OFS_STEP]
        mul     dx
        sub     word ptr [DBG_DUMP_OFS], ax
        mov     ax, word ptr [DBG_DUMP_SEG_STEP]
        sub     word ptr [DBG_DUMP_SEG], ax
L_1EF12:
        call    debug_hexdump_draw
L_1EF15:
        BC_FLUSH
L_1EF18:
        ret
L_1EF19:
        cmp     bl, 1
L_1EF1C:
        jne     L_1EF21
        jmp     NEAR L_1EFA3
L_1EF21:
        cmp     bl, 2
L_1EF24:
        jne     L_1EF28
        jmp     L_1EF8F
L_1EF28:
        cmp     bl, 3
L_1EF2B:
        jne     L_1EF2F
        jmp     L_1EF7B
L_1EF2F:
        cmp     bl, 4
L_1EF32:
        jne     L_1EF36
        jmp     SHORT L_1EF67
L_1EF36:
        cmp     bl, 5
L_1EF39:
        jne     L_1EF3D
        jmp     SHORT L_1EF4E
L_1EF3D:
        cmp     bl, 6
L_1EF40:
        jne     L_1EF45
        jmp     NEAR L_1EFCB
L_1EF45:
        cmp     bl, 0ch
L_1EF48:
        jne     L_1EF4D
        jmp     NEAR L_1EFDF
L_1EF4D:
        ret
L_1EF4E:
        mov     word ptr [DBG_DUMP_OFS_STEP], 1
        mov     word ptr [DBG_DUMP_SEG_STEP], 0
        and     word ptr [DBG_DUMP_OFS], 0fff8h
        if      FW_VERSION = 150
L_1F2F4                         equ     $+5
        endif
L_1EF5F:
        BC_CLEAR_RECT 120, 0, 128, 50
        if      FW_VERSION = 150
L_1EF7A:
        endif
L_1EF66:
        ret
L_1EF67:
        mov     word ptr [DBG_DUMP_OFS_STEP], 8
        if      FW_VERSION = 172
L_1EF72                         equ     $+5
        endif
        mov     word ptr [DBG_DUMP_SEG_STEP], 0
        if      FW_VERSION = 150
L_1F308                         equ     $+5
        endif
L_1EF73:
        if      FW_VERSION = 172
        BC_CLEAR_RECT 120, 0, 128, 50
L_1EF7A:
        ret
L_1EF7B:
        mov     word ptr [DBG_DUMP_OFS_STEP], 100h
        mov     word ptr [DBG_DUMP_SEG_STEP], 0
L_1EF87:
        endif
        BC_CLEAR_RECT 120, 0, 128, 50
L_1EF8E:
        ret
        if      FW_VERSION = 150
L_1EF7B:
        mov     word ptr [DBG_DUMP_OFS_STEP], 100h
        mov     word ptr [DBG_DUMP_SEG_STEP], 0
L_1F31C                         equ     $+5
L_1EF87:
        BC_CLEAR_RECT 120, 0, 128, 50
L_1EF9B:
        ret
        endif
L_1EF8F:
        mov     word ptr [DBG_DUMP_OFS_STEP], 1000h
        mov     word ptr [DBG_DUMP_SEG_STEP], 0
        if      FW_VERSION = 172
L_1EF9B:
        else
L_1F330                         equ     $+5
        endif
        BC_CLEAR_RECT 120, 0, 128, 50
L_1EFA2:
        ret
L_1EFA3:
        mov     word ptr [DBG_DUMP_OFS_STEP], 0
        mov     word ptr [DBG_DUMP_SEG_STEP], 1000h
        and     word ptr [DBG_DUMP_SEG], 0f000h
        if      FW_VERSION = 150
L_1F34A                         equ     $+5
        endif
L_1EFB5:
        BC_CLEAR_RECT 120, 0, 128, 50
L_1EFBC:
        ret
L_1EFBD:
        and     word ptr [DBG_DUMP_SEG], 8000h
        if      FW_VERSION = 150
L_1F358                         equ     $+5
        endif
L_1EFC3:
        BC_CLEAR_RECT 120, 0, 128, 50
L_1EFCA:
        ret
L_1EFCB:
        mov     word ptr [DBG_DUMP_OFS_STEP], 6
        mov     word ptr [DBG_DUMP_SEG_STEP], 0
        if      FW_VERSION = 150
L_1F36C                         equ     $+5
        endif
L_1EFD7:
        BC_CLEAR_RECT 120, 0, 128, 50
L_1EFDE:
        ret
L_1EFDF:
        xor     word ptr [DBG_DUMP_LIVE], 1
        cmp     word ptr [DBG_DUMP_LIVE], 0
L_1EFE9:
        jne     L_1EFF6
L_1EFEB:
        BC_LCD_TEXT 209, 034h, "SEQ "
L_1EFF5:
        ret
L_1EFF6:
        BC_LCD_TEXT 209, 034h, "REAL"
L_1F000:
        ret
debug_hexdump_draw:
        mov     es, word ptr [DBG_DUMP_SEG]
        mov     si, word ptr [DBG_DUMP_OFS]
        mov     bl, 6
        mov     ch, 0
loop_1F00D:
        push    bx
        mov     cl, 0
        mov     bl, 8
        cmp     word ptr [DBG_DUMP_OFS_STEP], 6
        jne     calls_memory_block_op_1f01b
        mov     bl, 6
calls_memory_block_op_1f01b:
        mov     ax, es
calls_memory_block_op_1f01d:
        call    memory_block_op
        add     cl, 1ah
        mov     ax, si
calls_memory_block_op_1f025:
        call    memory_block_op
        add     cl, 18h
        mov     al, 3ah
L_1F02D:
        call    debug_putchar
        add     cl, 6
        mov     di, si
L_1F035:
        mov     al, byte ptr es:[si]
L_1F038:
        call    debug_put_hex_byte
        inc     si
        add     cl, 0fh
        dec     bl
L_1F041:
        jne     L_1F035
        push    es
        push    si
        push    cx
L_1F046:
        call    debug_hexdump_ascii
        pop     cx
        pop     si
        pop     es
        pop     bx
        add     ch, 8
        dec     bl
L_1F052:
        jne     loop_1F00D
        ret
debug_hexdump_ascii:
        add     cl, 1
        cmp     word ptr [DBG_DUMP_OFS_STEP], 6
L_1F05D:
        je      debug_seq_event_draw
        mov     bl, 8
loop_1F061:
        mov     al, byte ptr es:[di]
        cmp     al, 20h
        jae     br_1F06A
        mov     al, 2ah
br_1F06A:
        cmp     al, 7bh
        jb      L_1F070
        mov     al, 2ah
L_1F070:
        call    debug_putchar
        inc     di
        add     cl, 8
        dec     bl
L_1F079:
        jne     loop_1F061
        ret
debug_seq_event_draw:
        mov     al, byte ptr es:[di]
        mov     dx, word ptr es:[di+1]
        mov     si, P_F24F
        cmp     al, 0ffh
L_1F088:
        je      L_1F0BA
        mov     si, P_F25F
        cmp     al, 0c2h
L_1F08F:
        je      L_1F0BA
L_1F091:
        mov     si, P_F26F
        cmp     al, 0c0h
L_1F096:
        je      L_1F0BA
        mov     si, P_F29F
        cmp     al, 0c1h
L_1F09D:
        je      L_1F0BA
        and     al, 0c0h
        mov     si, P_F27F
        cmp     al, 0
L_1F0A6:
        je      L_1F0BA
        mov     si, P_F2AF
        cmp     al, 40h
L_1F0AD:
        jne     L_1F0B2
        jmp     NEAR L_1F0CE+225
L_1F0B2:
        mov     si, P_F28F
        cmp     al, 80h
L_1F0B7:
        je      L_1F0BA
        ret
L_1F0BA:
        push    dx
        push    cx
        mov     dx, cs
        mov     ah, 10h
L_1F0C0:
        BC_PUTS_FAR
        db      59h, 58h
L_1F0C5:
        add     cl, 48h
        and     ah, 7
L_1F0CB:
        BC_OP_42
L_1F0CE:
        ret
        db      ":END       [123]"
        db      ":EOX            "
        db      ":BAR       [123]"
        db      ":NOTE           "
        db      ":EXC            "
        db      ":TEMPO          "
        db      ":-----VARI      "
        db      ":EVNT_90        "
        db      ":EVNT_A0        "
        db      ":EVNT_B0        "
        db      ":EVNT_C0        "
        db      ":EVNT_D0        "
        db      ":EVNT_E0        "
        db      ":EVNT_F0        "
        if      FW_VERSION = 172
L_1F1AF:
        endif
        mov     al, byte ptr es:[di+3]
        and     ax, 70h
        if      FW_VERSION = 150
L_1F1AF:
        endif
        add     si, ax
        jmp     NEAR L_1F0BA
debug_putchar:
        pusha
        push    es
L_1F1BD:
        BC_PUTCHAR
        db      07h
L_1F1C1:
        popa
        ret
debug_put_hex_byte:
        pusha
        push    es
L_1F1C5:
        BC_PUT_HEX
        db      07h, 61h, 0c3h
memory_block_op:
        pusha
        push    es
        if      FW_VERSION = 172
L_1F1CD:
        endif
        BC_PUT_HEX_HIGH
        db      07h, 61h, 0c3h, 0e8h, 01h
        db      00h, 0cbh
        if      FW_VERSION = 150
L_1F1CD:
        endif
L_1F1D7:
        BC_PLANE_PUSH_VIS
L_1F1DA:
        BC_CLEAR_RECT 0, 0, 240, 60
L_1F1E1:
        mov     ax, word ptr [UI_SLOT_REFRESH]
        mov     word ptr [W_78A5], ax
        mov     word ptr [UI_SLOT_REFRESH], NULL_HANDLER_OFS
        mov     word ptr [W_0F68], P_F484
        jmp     SHORT L_1F24D
L_1F1F5:
        mov     word ptr [UI_SLOT_REFRESH], P_F3CD
sqophed_status:
        BC_STATUS 0, 12, "SQOPHED:"
sqfrend_status:
        BC_STATUS 0, 20, "SQFREND:"
seq_end_status:
        BC_STATUS 0, 28, "SEQ_END:"
status_seq_end_1f225:
        mov     ax, word ptr [CUR_SEQ_SEG]
        mov     cl, 30h
        mov     ch, 0ch
L_1F22C:
        BC_PUT_HEX_HIGH
        mov     ax, word ptr [P_204C]
        mov     cl, 30h
L_1F234:
        mov     ch, 14h
L_1F236:
        BC_PUT_HEX_HIGH
        mov     ax, es
        mov     cl, 30h
        mov     ch, 1ch
L_1F23F:
        BC_PUT_HEX_HIGH
        mov     word ptr [W_0F54], P_F3CD
        mov     word ptr [W_0F56], cs
        ret
L_1F24D:
        mov     word ptr [UI_SLOT_REFRESH], P_F3CD
p_sqhed0000000_sqclend_status:
        BC_STATUS 0, 2, "P_SQHED:000#:0000 SQCLEND:"
p_sqstr0000000_status:
        BC_STATUS 0, 10, "P_SQSTR:000#:0000"
p_read_000000_status:
        BC_STATUS 0, 42, "P_READ :000#:#000"
status_p_read_000000_1f2a1:
        mov     word ptr [W_0F54], P_F375
        mov     word ptr [W_0F56], cs
        mov     ax, word ptr [CUR_SEQ_SEG]
        mov     cl, 30h
        mov     ch, 2
L_1F2B2:
        BC_PUT_HEX_HIGH
        mov     ax, word ptr [SEQ_EVENTS_SEG]
        mov     cl, 30h
L_1F2BA:
        mov     ch, 0ah
L_1F2BC:
        BC_PUT_HEX_HIGH
        mov     ax, word ptr [SEQ_AFTER_GAP_SEG]
        mov     cl, 30h
L_1F2C4:
        mov     ch, 2ah
L_1F2C6:
        BC_PUT_HEX_HIGH
        mov     ax, word ptr [FP_SEQ_AFTER_GAP]
        mov     cl, 4eh
L_1F2CE:
        mov     ch, 2ah
L_1F2D0:
        BC_PUT_HEX_HIGH
        les     si, [FP_SEQ_AFTER_GAP]
        mov     di, si
        mov     cl, 6ch
        mov     ch, 2ah
        mov     bl, 6
L_1F2DF:
        call    L_1F67C
        mov     ax, es
        mov     cl, 9ch
        mov     ch, 2
L_1F2E8:
        BC_PUT_HEX_HIGH
        ret
L_1F67C:
        mov     al, byte ptr es:[si]
        call    debug_put_hex_byte
        inc     si
        add     cl, 0fh
        dec     bl
L_1F2F8:
        jne     L_1F67C
        push    es
        push    si
        push    cx
L_1F2FD:
        call    debug_seq_event_draw
        pop     cx
        pop     si
        pop     es
        ret
L_1F304:
        BC_PLANE_POP
L_1F307:
        ret
        PARA_END
CS1_END:
