; c0 -- MPC2000XL flash: app tail, then C.
; v1.20 0x3270e-0x3dfdd (47311 bytes): app layer to 0x332fe (its last 3056
; bytes), then 44255 bytes of C.  v1.14 0x32120-0x3d9dd (47293 bytes): app
; layer to 0x32d10 (3056 bytes), then 44237 bytes of C.  v1.12 0x31f30-0x3d7dd
; (47277 bytes): app layer to 0x32b20 (3056 bytes), then 44221 bytes of C.
; v1.11 0x31e2e-0x3d6a3 (47221 bytes), v1.10 0x31e10-0x3d5a3 (46995 bytes),
; v1.07 0x318d2-0x3d0c3 (47089 bytes).
; every version starts at the same soft-key handler (L_32120);
; the app layer before it is app3's tail.

APP3_CSBASE set     APP3_SEG*16-SEGBASE

L_32120:
        call    EP_FN_280BD_OFF+APP3_CSBASE
        je      br_32714
        retf
br_32714:
        if      FW_VERSION >= 110
        call    EP_FN_2B3C5_OFF+APP3_CSBASE
        int     57h
        call    EP_FN_2823E_OFF+APP3_CSBASE
        else
        db      0e8h, 0c3h, 8ch, 0e8h, 54h, 5bh
        endif
        mov     ax, 0
        call    EP_FN_30425_OFF+APP3_CSBASE
        mov     byte ptr [A2_B_00F2E], 0
        mov     ax, word ptr [A2_W_CUR_SEQ]
        mov     word ptr [C0_W_02B50], ax
        mov     ax, word ptr [A3_W_00712]
        mov     byte ptr [P_2B52], al
        push    cs
        call    L_3244A
        callf   [C0_W_02B40]
        retf
        ifdef   GROWTH_PROOF
        db      GROWTH_PROOF dup (90h)
        endif
fn_3273C:
        pop     si
        push    si
        sub     si, 3
        mov     word ptr [C0_W_02B44], si
        int     0a4h
        if      FW_VERSION >= 114
        KEY_SOFT        0000h, 0000h, EP_L_32CC6_OFF, EP_L_32CC6_SEG, EP_FAR_33753_OFF, APP3_SEG, EP_L_33312_OFF, APP3_SEG, 0000h, 0000h, L_33037-APP3_CSBASE, APP3_SEG
        KEY_DOWN        20h, L_31EC1-APP3_CSBASE, APP3_SEG
        elseif  (FW_VERSION >= 110) && (FW_VERSION < 112)
        KEY_SOFT        0000h, 0000h, EP_L_32CC6_OFF, EP_L_32CC6_SEG, EP_FAR_33753_OFF, APP3_SEG, EP_L_33312_OFF, APP3_SEG, 0000h, 0000h, EP_L_32757_OFF, APP3_SEG
        KEY_DOWN        20h, EP_L_31EC1_OFF, APP3_SEG
        else
        KEY_SOFT        0000h, 0000h, EP_L_32CC6_OFF, EP_L_32CC6_SEG, EP_FAR_33753_OFF, APP3_SEG, EP_L_33312_OFF, APP3_SEG, 0000h, 0000h, (C0_BASE+L_33037-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, (C0_BASE+L_31EC1-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        26h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        21h, EP_L_2AAD1_OFF, APP3_SEG
        if      FW_VERSION >= 110
        if      FW_VERSION >= 112
        ret
far_32782:
        mov     ax, word ptr [A2_W_CUR_SEQ]
        call    fn_3404B
        mov     word ptr [A2_W_SEQ_SEG], 8000h
        mov     word ptr [C0_W_02B40], far_32782-APP3_CSBASE
        callf   [C0_W_02B44]
        KEY_DOWN        21h, EP_L_2AAD1_OFF, APP3_SEG
        retf
        else
FAR_32782                       equ     $+1
        db      0c3h
        db      0a1h, 10h, 07h, 0e8h, 0c3h, 18h, 0c7h, 06h, 10h
        db      0fh, 00h, 80h
        mov     word ptr [C0_W_02B30], far_32782-APP3_CSBASE
        db      0ffh, 1eh, 34h, 2bh
        KEY_DOWN        21h, EP_L_2AAD1_OFF, APP3_SEG
        db      0cbh
        endif
        else
        db      0c3h
far_32782:
        mov     ax, word ptr [A2_W_CUR_SEQ]
        call    fn_3404B
        mov     word ptr [A2_W_SEQ_SEG], 8000h
        mov     word ptr [C0_W_02B40], far_32782-APP3_CSBASE
        callf   [C0_W_02B44]
        KEY_DOWN        21h, (APP3_BASE+L_2B3A1-APP3_SEG*16), APP3_SEG
        retf
        endif
L_31EC1:
        DISP_CLEAR
        DISP_FONT       DISP_FONT_7ROW
        DISP_HLINE      00h, 00h, 56h
        DISP_HDOTS      00h, 0ah, 56h
        DISP_HLINE      00h, 30h, 80h
        DISP_HLINE      01h, 31h, 7fh
        DISP_HLINE      57h, 0ah, 28h
        DISP_VLINE      00h, 00h, 30h
        DISP_VLINE      56h, 00h, 0bh
        DISP_VLINE      57h, 01h, 0ah
        DISP_VLINE      7eh, 0ah, 26h
        DISP_VLINE      7fh, 0bh, 25h
        DISP_TEXT       02h, 02h, "Edit:"
        DISP_TEXT       02h, 0ch, "Time:"
        DISP_TEXT       02h, 1eh, "Notes:"
        DISP_TEXT       08h, 15h, "   .  .  -   .  .  "
        DISP_BOX        83h, 00h, 74h, 31h
        DISP_VLINE      0f7h, 01h, 30h
        DISP_HLINE      84h, 31h, 74h
        DISP_SOFTKEY    01h, DISP_SK_PLAIN, "EVENTS"
        DISP_SOFTKEY    02h, DISP_SK_FILL,   "BARS"
        DISP_SOFTKEY    03h, DISP_SK_FILL,   "TrMOVE"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "USER"
        DISP_SOFTKEY    06h, DISP_SK_BOX,    "DO IT"
        db      0b1h, 08h, 0b5h, 15h, 0a1h, 4dh, 15h, 8ah, 16h, 4fh, 15h, 8ah, 36h, 50h, 15h
        if      FW_VERSION >= 120
        db      51h, 0e8h, 61h, 58h, 59h, 0a1h, 51h, 15h, 8ah, 16h, 53h, 15h, 8ah, 36h, 54h, 15h ; Q.aXY.Q...S..6T.
        db      80h, 0c1h, 3ch, 0e8h, 4fh, 58h
        call    L_32899
        call    L_328D8
        db      0ffh, 16h, 48h, 2bh
        db      0cbh
L_32899:
        db      0b1h, 08h, 0b5h, 27h
        call    APP3_BASE+fn_280CB-SEGBASE
        jne     L_328BF
        db      0a0h, 77h, 15h, 0b3h, 1eh, 0b7h
        elseif  FW_VERSION >= 112
        db      51h, 0e8h, 6fh, 58h, 59h, 0a1h, 51h, 15h, 8ah, 16h, 53h, 15h, 8ah, 36h, 54h, 15h ; Q.aXY.Q...S..6T.
        db      80h, 0c1h, 3ch, 0e8h, 5dh, 58h, 0e8h, 08h, 00h, 0e8h, 44h, 00h, 0ffh, 16h, 38h, 2bh
        db      0cbh, 0b1h, 08h, 0b5h, 27h, 0e8h, 39h, 58h, 75h, 1dh, 0a0h, 77h, 15h, 0b3h, 1eh, 0b7h
        elseif  FW_VERSION >= 111
        db      51h, 0e8h, 71h, 58h, 59h, 0a1h, 51h, 15h, 8ah, 16h, 53h, 15h, 8ah, 36h, 54h, 15h ; Q.aXY.Q...S..6T.
        db      80h, 0c1h, 3ch, 0e8h, 5fh, 58h, 0e8h, 08h, 00h, 0e8h, 44h, 00h, 0ffh, 16h, 38h, 2bh
        db      0cbh, 0b1h, 08h, 0b5h, 27h, 0e8h, 3bh, 58h, 75h, 1dh, 0a0h, 77h, 15h, 0b3h, 1eh, 0b7h
        elseif  FW_VERSION >= 110
        db      51h, 0e8h, 72h, 58h, 59h, 0a1h, 51h, 15h, 8ah, 16h, 53h, 15h, 8ah, 36h, 54h, 15h ; Q.aXY.Q...S..6T.
        db      80h, 0c1h, 3ch, 0e8h, 60h, 58h, 0e8h, 08h, 00h, 0e8h, 44h, 00h, 0ffh, 16h, 38h, 2bh
        db      0cbh, 0b1h, 08h, 0b5h, 27h, 0e8h, 3ch, 58h, 75h, 1dh, 0a0h, 77h, 15h, 0b3h, 1eh, 0b7h
        else
        db      51h, 0e8h, 93h, 58h, 59h, 0a1h, 51h, 15h, 8ah, 16h, 53h, 15h, 8ah, 36h, 54h, 15h ; Q.aXY.Q...S..6T.
        db      80h, 0c1h, 3ch, 0e8h, 81h, 58h, 0e8h, 08h, 00h, 0e8h, 44h, 00h, 0ffh, 16h, 38h, 2bh
        db      0cbh, 0b1h, 08h, 0b5h, 27h, 0e8h, 5dh, 58h, 75h, 1dh, 0a0h, 77h, 15h, 0b3h, 1eh, 0b7h
        endif
        db      01h, 0cdh, 90h, 80h, 0c1h, 36h, 0a0h, 78h, 15h, 0b3h, 1eh, 0b7h, 01h, 0cdh, 90h
        DISP_TEXT       38h, 27h, "-"
        db      0c3h
L_328BF:
        db      0b1h, 08h, 0a0h, 7ah, 15h, 8ah, 26h, 79h, 15h
        db      0b3h, 1eh, 0b7h, 02h, 0cdh, 90h, 0c3h
cb_322E1:
        db      0b1h, 20h, 0b5h, 02h, 0b0h, 37h, 0cdh, 0b0h, 0c3h
L_328D8:
        if      FW_VERSION >= 120
        db      8bh, 1eh, 4eh, 2bh, 0d1h, 0e3h
        else
        db      8bh, 1eh, 3eh, 2bh, 0d1h, 0e3h
        endif
        jmp     word ptr cs:[bx+TBL_EDIT_TYPE_DRAW-APP3_CSBASE]
TBL_EDIT_TYPE_DRAW:
        dw      edit_draw_copy-APP3_CSBASE, edit_draw_duration-APP3_CSBASE, edit_draw_velocity-APP3_CSBASE, edit_draw_transpose-APP3_CSBASE
edit_draw_copy:
        DISP_TEXT       20h, 02h, "COPY"
        DISP_TEXT       85h, 02h, "From sq:    Tr:"
        DISP_TEXT       85h, 0ch, "  To sq:    Tr:"
        DISP_TEXT       85h, 15h, "   Mode:"
        DISP_TEXT       85h, 1eh, "  Start:   .  ."
        DISP_TEXT       85h, 27h, " Copies:"
        db      0a1h, 10h, 07h, 0feh, 0c0h
        DISP_NUM        0b5h, 02h, 02h
        db      0a1h, 12h, 07h, 0feh, 0c0h
        DISP_NUM        0dfh, 02h, 02h
        if      FW_VERSION >= 120
        db      0a1h, 50h
        else
        db      0a1h, 40h
        endif
        db      2bh, 0feh, 0c0h
        DISP_NUM        0b5h, 0ch, 02h
        if      FW_VERSION >= 120
        db      0a0h, 52h, 2bh, 0feh, 0c0h
        else
        db      0a0h, 42h, 2bh, 0feh, 0c0h
        endif
        DISP_NUM        0dfh, 0ch, 02h
        db      8ch, 0dah
        DISP_TEXT_IDX   0b5h, 15h, P_2B53, TBL_REPLACE_MERGE_LABELS
        db      0b1h, 0b5h, 0b5h, 1eh, 0a1h, 55h, 15h, 8ah, 16h, 57h, 15h, 8ah, 36h, 58h, 15h, 0e8h
        if      FW_VERSION >= 120
        db      43h, 57h, 0a1h, 54h, 2bh, 40h
        elseif  FW_VERSION >= 112
        db      51h, 57h, 0a1h, 44h, 2bh, 40h
        elseif  FW_VERSION >= 111
        db      53h, 57h, 0a1h, 44h, 2bh, 40h
        elseif  FW_VERSION >= 110
        db      54h, 57h, 0a1h, 44h, 2bh, 40h
        else
        db      75h, 57h, 0a1h, 44h, 2bh, 40h
        endif
        DISP_NUM        0b5h, 27h, 03h
        db      0c3h
cb_323B7:
        db      0b1h, 0b5h, 0b5h
        db      02h, 0b0h, 0dh, 0cdh, 0b0h, 0c3h
cb_323C0:
        db      0b1h, 0dfh, 0b5h, 02h, 0b0h, 0dh, 0cdh, 0b0h, 0c3h
cb_323C9:
        db      0b1h
        db      0b5h, 0b5h, 0ch, 0b0h, 0dh, 0cdh, 0b0h, 0c3h
cb_323D2:
        db      0b1h, 0dfh, 0b5h, 0ch, 0b0h, 0dh, 0cdh, 0b0h
L_329C9                         equ     $+1
        db      0c3h, 0b1h, 0b5h, 0b5h, 15h, 0b0h, 2bh, 0cdh, 0b0h, 0c3h
cb_323E4:
        db      0b1h, 0b5h, 0b5h, 27h, 0b0h, 13h
        db      0cdh, 0b0h, 0c3h
edit_draw_duration:
        DISP_TEXT       20h, 02h, "DURATION"
        DISP_TEXT       85h, 04h, "Edit sq:    Tr:"
        DISP_TEXT       85h, 15h, "   Mode:"
        DISP_TEXT       85h, 22h, "  Value:"
        db      0a1h, 10h, 07h, 0feh, 0c0h
        DISP_NUM        0b5h, 04h, 02h
        db      0a1h, 12h, 07h
        db      0feh, 0c0h
        DISP_NUM        0dfh, 04h, 02h
        db      8ch, 0dah
        DISP_TEXT_IDX   0b5h, 15h, P_2B56, TBL_VALUE_OP_LABELS
        db      0a1h
        dw      C0_W_02B57
        DISP_NUM        0b5h, 22h, 04h
        db      0c3h
cb_32458:
        db      0b1h, 0b5h
        db      0b5h, 04h, 0b0h, 0dh, 0cdh, 0b0h, 0c3h
cb_32461:
        db      0b1h, 0dfh, 0b5h, 04h, 0b0h, 0dh, 0cdh, 0b0h, 0c3h
cb_3246A:
        db      0b1h, 0b5h, 0b5h, 15h, 0b0h, 3dh, 0cdh, 0b0h, 0c3h
cb_32473:
        db      0b1h, 0b5h, 0b5h, 22h, 0b0h, 19h, 0cdh
        db      0b0h, 0c3h
edit_draw_velocity:
        DISP_TEXT       20h, 02h, "VELOCITY"
        DISP_TEXT       85h, 04h, "Edit sq:    Tr:"
        DISP_TEXT       85h, 15h, "   Mode:"
        DISP_TEXT       85h, 22h, "  Value:"
        db      0a1h, 10h, 07h, 0feh, 0c0h
        DISP_NUM        0b5h, 04h, 02h
        db      0a1h, 12h, 07h, 0feh
        db      0c0h
        DISP_NUM        0dfh, 04h, 02h
        db      8ch, 0dah
        DISP_TEXT_IDX   0b5h, 15h, 0184eh, TBL_VALUE_OP_LABELS
        db      0a0h, 4fh, 18h, 0b4h, 00h
        DISP_NUM        0b5h, 22h, 03h
        db      0c3h
cb_324E9:
        db      0b1h
        db      0b5h, 0b5h, 22h, 0b0h, 13h, 0cdh, 0b0h, 0c3h
edit_draw_transpose:
        DISP_TEXT       20h, 02h, "TRANSPOSE"
        DISP_TEXT       85h, 04h, "Edit sq:    Tr:"
        DISP_TEXT       85h, 15h, " Amount:"
        DISP_TEXT       85h, 26h, "(Except drum track)"
        db      0a1h, 10h, 07h, 0feh, 0c0h
        DISP_NUM        0b5h, 04h, 02h
        db      0a1h, 12h
        db      07h, 0feh, 0c0h
        DISP_NUM        0dfh, 04h, 02h
        db      8ch, 0dah
        DISP_TEXT_IDX   0b5h, 15h, P_2B59, P_2B94
        if      FW_VERSION >= 112
        db      0c3h
cb_3226E:
        db      0b1h, 0b5h, 0b5h, 15h, 0b0h, 13h, 0cdh, 0b0h, 0c3h
far_32B57:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_322E1-APP3_CSBASE
        if      FW_VERSION >= 120
        db      8ch, 0d9h, 0beh, 4eh, 2bh, 0b3h, 00h, 0b7h
        db      00h, 0bah, 03h, 00h
        mov     di, (APP3_BASE+field_cb_none-APP3_SEG*16)
        db      0cdh, 7dh
        KEY_CURSOR      0000h, 0000h, (C0_BASE+L_32596-APP3_SEG*16), APP3_SEG, 0000h, 0000h, EP_L_31D63_OFF, APP3_SEG
        db      0cbh
L_32596:
        db      8bh, 1eh, 4eh, 2bh
        db      0c1h, 0e3h, 02h
        callf   [bx+TBL_32B91-APP3_CSBASE]           ; cs: -- ASL prefixes a code label itself
        retf
TBL_32B91:
        dw      (C0_BASE+L_32686-APP3_SEG*16), APP3_SEG
        dw      (C0_BASE+L_32DE8-APP3_SEG*16), APP3_SEG
        dw      EP_L_328E0_OFF, APP3_SEG
        else
        db      8ch, 0d9h, 0beh, 3eh, 2bh, 0b3h, 00h, 0b7h
        db      00h, 0bah, 03h, 00h, 0bfh, 0dch, 18h, 0cdh, 7dh
        KEY_CURSOR      0000h, 0000h, (C0_BASE+L_32596-APP3_SEG*16), APP3_SEG, 0000h, 0000h, EP_L_31D63_OFF, APP3_SEG
        retf
L_32596:
        mov     bx, word ptr [C0_W_02B4E]
        shl     bx, 2
        callf   [bx+TBL_32B91-APP3_CSBASE]           ; cs: -- ASL prefixes a code label itself
        retf
TBL_32B91:
        dw      (C0_BASE+L_32686-APP3_SEG*16), APP3_SEG
        dw      (C0_BASE+L_32DE8-APP3_SEG*16), APP3_SEG
        dw      EP_L_328E0_OFF, APP3_SEG
        endif
        dw      EP_L_32FB0_OFF, APP3_SEG
L_322A3:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_325D6-APP3_CSBASE
        if      FW_VERSION >= 120
        mov     ax, far_32B57-APP3_CSBASE
        db      0bbh, 32h, 0c4h
        mov     bp, far_32B57-APP3_CSBASE
        mov     dx, L_32C0A-APP3_CSBASE
        db      0bfh, 15h, 0c4h
        mov     si, L_31EC1-APP3_CSBASE
        db      0b1h, 08h, 0b5h, 15h
        call    APP3_BASE+L_2AC51-SEGBASE
        db      0cbh
cb_325D6:
        db      0c3h, 8bh, 1eh, 4eh, 2bh, 0c1h, 0e3h, 02h
        else
        db      0b8h, 99h, 0c3h, 0bbh, 24h, 0c4h, 0bdh
        db      99h, 0c3h, 0bah, 4ch, 0c4h, 0bfh, 07h, 0c4h, 0beh, 0e3h, 0bfh, 0b1h, 08h, 0b5h, 15h, 0e8h
        db      9ch, 80h, 0cbh
cb_325D6:
        db      0c3h, 8bh, 1eh, 3eh, 2bh, 0c1h, 0e3h, 02h
        endif
        callf   [bx+TBL_32BD2-APP3_CSBASE]           ; cs: -- ASL prefixes a code label itself
        retf
TBL_32BD2:
        dw      EP_L_32783_OFF, APP3_SEG
        dw      (C0_BASE+L_32E42-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 114
        dw      (C0_BASE+L_320EA-APP3_SEG*16), APP3_SEG
        dw      EP_L_321CC_OFF, APP3_SEG
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_325D6-APP3_CSBASE
        if      FW_VERSION >= 120
        call    APP3_BASE+fn_280CB-SEGBASE
        jne     L_32C32
        mov     ax, L_322A3-APP3_CSBASE
        mov     bx, (APP3_BASE+field_cb_none-APP3_SEG*16)
        mov     bp, L_322A3-APP3_CSBASE
        mov     dx, (APP3_BASE+field_cb_none-APP3_SEG*16)
        mov     di, far_32C57-APP3_CSBASE
        mov     si, L_31EC1-APP3_CSBASE
        db      0b1h, 08h, 0b5h, 27h, 0e8h, 11h
        else
        db      0e8h, 0ebh, 54h, 75h, 42h, 0b8h, 0e3h
        db      0c3h, 0bbh, 0dch, 18h, 0bdh, 0e3h, 0c3h, 0bah, 0dch, 18h, 0bfh, 99h, 0c4h, 0beh, 0e3h, 0bfh
        db      0b1h, 08h, 0b5h, 27h, 0e8h, 1fh
        endif
L_32C0A                         equ     $+2
        db      86h, 0cbh
        if      FW_VERSION >= 120
L_3261C_114:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_325D6-APP3_CSBASE
        call    APP3_BASE+fn_280CB-SEGBASE
        jne     L_32C32
        mov     ax, L_322A3-APP3_CSBASE
        mov     bx, (APP3_BASE+field_cb_none-APP3_SEG*16)
        mov     bp, L_322A3-APP3_CSBASE
        mov     dx, (APP3_BASE+field_cb_none-APP3_SEG*16)
        mov     di, far_32C57-APP3_CSBASE
        mov     si, L_31EC1-APP3_CSBASE
        db      0b1h, 08h, 0b5h, 27h
        call    APP3_BASE+fn_2B27E-SEGBASE
        db      0cbh
L_32C32:
        mov     word ptr [C0_W_02B48], cb_32660-APP3_CSBASE
        KEY_CURSOR      0000h, 0000h, (C0_BASE+far_32C57-APP3_SEG*16), APP3_SEG, EP_L_31D63_OFF, APP3_SEG, 0000h, 0000h
        call    APP3_BASE+fn_2B2E2-SEGBASE
        db      0cbh
cb_32660:
        db      0b1h, 08h, 0b5h, 27h, 0b0h, 25h, 0cdh, 0b0h, 0c3h
far_32C57:
        db      8bh
        db      1eh, 4eh, 2bh, 0c1h, 0e3h, 02h
        callf   [bx+TBL_32C64-APP3_CSBASE]           ; cs: -- ASL prefixes a code label itself
        retf
TBL_32C64:
        dw      EP_L_31F7D_OFF, APP3_SEG
        dw      EP_L_32E82_OFF, APP3_SEG
        else
L_3232A:
L_3261C_114:
        db      0e8h, 2fh, 0fbh
        mov     word ptr [C0_W_02B48], cb_325D6-APP3_CSBASE
        db      0e8h, 0c3h, 54h, 75h, 1ah
        db      0b8h, 0e3h, 0c3h, 0bbh, 0dch, 18h, 0bdh, 0e3h, 0c3h, 0bah, 0dch, 18h, 0bfh, 99h, 0c4h, 0beh
        db      0e3h, 0bfh, 0b1h, 08h, 0b5h, 27h, 0e8h, 5bh, 86h, 0cbh
        mov     word ptr [C0_W_02B48], cb_32660-APP3_CSBASE
        KEY_CURSOR      0000h, 0000h, (C0_BASE+far_32669-APP3_SEG*16), APP3_SEG, EP_L_31D63_OFF, APP3_SEG, 0000h, 0000h
        db      0e8h, 0a3h, 86h, 0cbh
far_32669                       equ     $+9
cb_32660:
        db      0b1h, 08h, 0b5h, 27h, 0b0h, 25h, 0cdh, 0b0h, 0c3h, 8bh
        db      1eh, 3eh, 2bh, 0c1h, 0e3h, 02h
        callf   [bx+TBL_32C64-APP3_CSBASE]           ; cs: -- ASL prefixes a code label itself
        retf
TBL_32C64:
        dw      EP_L_31F7D_OFF, APP3_SEG
        dw      EP_L_32E82_OFF, APP3_SEG
        endif
        dw      (C0_BASE+far_3297A-APP3_SEG*16), APP3_SEG
        else
        dw      (C0_BASE+L_320EA-APP3_SEG*16), APP3_SEG, EP_L_321CC_OFF, APP3_SEG
        db      0e8h, 57h, 0fbh
        mov     word ptr [C0_W_02B48], cb_325D6-APP3_CSBASE
        db      0e8h, 0ebh, 54h, 75h, 42h, 0b8h, 0e3h, 0c3h, 0bbh, 0dch, 18h, 0bdh, 0e3h
        db      0c3h, 0bah, 0dch, 18h, 0bfh, 99h, 0c4h, 0beh, 0e3h, 0bfh, 0b1h, 08h, 0b5h, 27h, 0e8h, 1fh
        db      86h, 0cbh
L_3232A:
L_3261C_114:
        db      0e8h, 2fh, 0fbh
        mov     word ptr [C0_W_02B48], cb_325D6-APP3_CSBASE
        db      0e8h, 0c3h, 54h, 75h, 1ah
        db      0b8h, 0e3h, 0c3h, 0bbh, 0dch, 18h, 0bdh, 0e3h, 0c3h, 0bah, 0dch, 18h, 0bfh, 99h, 0c4h, 0beh
        db      0e3h, 0bfh, 0b1h, 08h, 0b5h, 27h, 0e8h, 5bh, 86h, 0cbh
        mov     word ptr [C0_W_02B48], cb_32660-APP3_CSBASE
        KEY_CURSOR      0000h, 0000h, (C0_BASE+far_32669-APP3_SEG*16), APP3_SEG, EP_L_31D63_OFF, APP3_SEG, 0000h, 0000h
        db      0e8h, 0a3h, 86h, 0cbh
far_32669                       equ     $+9
cb_32660:
        db      0b1h, 08h, 0b5h, 27h, 0b0h, 25h, 0cdh, 0b0h, 0c3h, 8bh
        db      1eh, 3eh, 2bh, 0c1h, 0e3h, 02h
        callf   [bx+TBL_32C64-APP3_CSBASE]           ; cs: -- ASL prefixes a code label itself
        retf
TBL_32C64:
        dw      EP_L_31F7D_OFF, APP3_SEG
        dw      EP_L_32E82_OFF, APP3_SEG
        dw      EP_FAR_3297A_OFF, APP3_SEG
        endif
        dw      EP_L_321CC_OFF, APP3_SEG
L_32686:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_323B7-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 10h, 07h, 0b3h, 01h, 0b7h, 00h, 0bah, 63h
        if      FW_VERSION >= 120
        db      00h, 0bfh, 0f1h, 0c4h, 0cdh, 7eh
        KEY_CURSOR      (C0_BASE+FAR_32B57-APP3_SEG*16), APP3_SEG, EP_L_323F0_OFF, APP3_SEG, 0000h, 0000h, (C0_BASE+far_32CFD-APP3_SEG*16), APP3_SEG
        else
        db      00h, 0bfh, 0e3h, 0c4h, 0cdh, 7eh
        KEY_CURSOR      (C0_BASE+FAR_32B57-APP3_SEG*16), APP3_SEG, EP_L_323F0_OFF, APP3_SEG, 0000h, 0000h, (C0_BASE+far_3270F-APP3_SEG*16), APP3_SEG
        endif
        db      0cbh
intcb_32CA1:
        db      0a1h, 10h, 07h
        call    fn_3404B
        db      0eh
        if      FW_VERSION >= 120
        call    L_335A0
        else
        db      0e8h, 0f5h, 08h
        endif
        db      0eh
        call    far_335ED
        db      0c7h, 06h, 4dh, 15h, 00h, 00h, 0c6h, 06h, 4fh
        db      15h, 00h, 0c6h, 06h, 50h, 15h, 00h, 0c7h, 06h, 51h, 15h, 00h, 00h, 0c6h, 06h, 53h
        db      15h, 00h, 0c6h, 06h, 54h, 15h, 00h, 0cbh
L_323D2:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_323C0-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 12h, 07h, 0b3h, 01h, 0b7h, 00h, 0bah, 40h, 00h
        mov     di, (APP3_BASE+field_cb_none-APP3_SEG*16)
        db      0cdh, 7eh
        KEY_CURSOR      (C0_BASE+L_32686-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, EP_L_32D44_OFF, APP3_SEG
        if      FW_VERSION >= 120
        db      0cbh
far_32CFD:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_323C9-APP3_CSBASE
        db      8ch, 0d9h
        db      0beh, 50h, 2bh, 0b3h, 01h, 0b7h, 00h, 0bah, 63h, 00h
        mov     di, L_3244A-APP3_CSBASE
        db      0cdh, 7eh
        KEY_CURSOR      (C0_BASE+FAR_32B57-APP3_SEG*16), APP3_SEG, EP_L_32D44_OFF, APP3_SEG, (C0_BASE+L_32686-APP3_SEG*16), APP3_SEG, EP_L_32783_OFF, APP3_SEG
        else
far_3270F                       equ     $+1
        db      0cbh
far_32CFD:
        db      0e8h, 3ch, 0fah
        mov     word ptr [C0_W_02B48], cb_323C9-APP3_CSBASE
        db      8ch, 0d9h
        db      0beh, 40h, 2bh, 0b3h, 01h, 0b7h, 00h, 0bah, 63h, 00h, 0bfh, 6ch, 0c5h, 0cdh, 7eh
        if      FW_VERSION >= 114
        KEY_CURSOR      (C0_BASE+FAR_32B57-APP3_SEG*16), APP3_SEG, EP_L_32D44_OFF, APP3_SEG, (C0_BASE+L_32686-APP3_SEG*16), APP3_SEG, EP_APP3_C5C1_OFF, APP3_SEG
        else
        KEY_CURSOR      (C0_BASE+FAR_32B57-APP3_SEG*16), APP3_SEG, EP_L_32D44_OFF, APP3_SEG, (C0_BASE+L_32686-APP3_SEG*16), APP3_SEG, EP_L_32783_OFF, APP3_SEG
        endif
        endif
        else
        if      FW_VERSION >= 110
L_32277                         equ     $+0ah
        ret
cb_3226E:
        mov     cl, 0b5h
        mov     ch, 15h
        mov     al, 13h
        int     0b0h
        ret
FAR_32B57:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_322E1-APP3_CSBASE
        mov     cx, ds
        mov     si, 2b3eh
        mov     bl, 0
        mov     bh, 0
        mov     dx, 3
        mov     di, (APP3_BASE+field_cb_none-APP3_SEG*16)
        int     7dh
        KEY_CURSOR      0000h, 0000h, EP_APP3_C4D2_OFF, APP3_SEG, 0000h, 0000h, EP_L_31D63_OFF, APP3_SEG
        retf
L_32596:
        mov     bx, word ptr [C0_W_02B4E]
        shl     bx, 2
        callf   [bx+TBL_32B91-APP3_CSBASE]           ; cs: -- ASL prefixes a code label itself
        retf
TBL_32B91:
        dw      L_32686-APP3_CSBASE, APP3_SEG
        dw      L_32DE8-APP3_CSBASE, APP3_SEG
        dw      L_328E0-APP3_CSBASE, APP3_SEG
        dw      L_32FB0-APP3_CSBASE, APP3_SEG
L_322A3:
        db      0e8h, 98h, 0fbh
        mov     word ptr [C0_W_02B48], cb_325D6-APP3_CSBASE
        db      0b8h
        if      FW_VERSION >= 111
        db      97h, 0c3h, 0bbh, 22h, 0c4h, 0bdh, 97h, 0c3h, 0bah, 4ah, 0c4h, 0bfh, 05h, 0c4h, 0beh, 0e1h
        db      0bfh, 0b1h, 08h, 0b5h, 15h, 0e8h, 9eh, 80h, 0cbh
cb_325D6:
        db      0c3h, 8bh, 1eh, 3eh, 2bh, 0c1h, 0e3h
        db      02h
        callf   [bx+TBL_32BD2-APP3_CSBASE]           ; cs: -- ASL prefixes a code label itself
        retf
TBL_32BD2:
        dw      far_32D71-APP3_CSBASE, APP3_SEG
        dw      L_32E42-APP3_CSBASE, APP3_SEG
        dw      L_320EA-APP3_CSBASE, APP3_SEG
        dw      L_321CC-APP3_CSBASE, APP3_SEG
        db      0e8h, 57h, 0fbh
        mov     word ptr [C0_W_02B48], cb_325D6-APP3_CSBASE
        db      0e8h, 0edh, 54h, 75h, 42h, 0b8h, 0e1h, 0c3h, 0bbh, 0dch, 18h, 0bdh, 0e1h, 0c3h, 0bah, 0dch
        else
        db      89h, 0c3h, 0bbh, 14h, 0c4h, 0bdh, 89h, 0c3h, 0bah, 3ch, 0c4h, 0bfh, 0f7h, 0c3h, 0beh, 0d3h
        db      0bfh, 0b1h, 08h, 0b5h, 15h, 0e8h, 9fh, 80h, 0cbh
cb_325D6:
        db      0c3h, 8bh, 1eh, 3eh, 2bh, 0c1h, 0e3h
        db      02h
        callf   [bx+TBL_32BD2-APP3_CSBASE]           ; cs: -- ASL prefixes a code label itself
        retf
TBL_32BD2:
        dw      far_32D71-APP3_CSBASE, APP3_SEG
        dw      L_32E42-APP3_CSBASE, APP3_SEG
        dw      L_320EA-APP3_CSBASE, APP3_SEG
        dw      L_321CC-APP3_CSBASE, APP3_SEG
        db      0e8h, 57h, 0fbh
        mov     word ptr [C0_W_02B48], cb_325D6-APP3_CSBASE
        db      0e8h, 0eeh, 54h, 75h, 42h, 0b8h, 0d3h, 0c3h, 0bbh, 0cfh, 18h, 0bdh, 0d3h, 0c3h, 0bah, 0cfh
        endif
L_3232A                         equ     $+0fh
        if      FW_VERSION >= 111
        db      18h, 0bfh, 97h, 0c4h, 0beh, 0e1h, 0bfh, 0b1h, 08h, 0b5h, 27h, 0e8h, 21h, 86h, 0cbh, 0e8h
        db      2fh, 0fbh
        mov     word ptr [C0_W_02B48], cb_325D6-APP3_CSBASE
        db      0e8h, 0c5h, 54h, 75h, 1ah, 0b8h, 0e1h, 0c3h
        db      0bbh, 0dch, 18h, 0bdh, 0e1h, 0c3h, 0bah, 0dch, 18h, 0bfh, 97h, 0c4h, 0beh, 0e1h, 0bfh, 0b1h
        db      08h, 0b5h, 27h, 0e8h, 5dh, 86h, 0cbh
        else
        db      18h, 0bfh, 89h, 0c4h, 0beh, 0d3h, 0bfh, 0b1h, 08h, 0b5h, 27h, 0e8h, 22h, 86h, 0cbh, 0e8h
        db      2fh, 0fbh
        mov     word ptr [C0_W_02B48], cb_325D6-APP3_CSBASE
        db      0e8h, 0c6h, 54h, 75h, 1ah, 0b8h, 0d3h, 0c3h
        db      0bbh, 0cfh, 18h, 0bdh, 0d3h, 0c3h, 0bah, 0cfh, 18h, 0bfh, 89h, 0c4h, 0beh, 0d3h, 0bfh, 0b1h
        db      08h, 0b5h, 27h, 0e8h, 5eh, 86h, 0cbh
        endif
        mov     word ptr [C0_W_02B48], cb_3236E-APP3_CSBASE
        KEY_CURSOR      0000h, 0000h, (C0_BASE+L_32377-APP3_SEG*16), APP3_SEG, EP_L_31D63_OFF, APP3_SEG, 0000h, 0000h
        db      0e8h
L_32377                         equ     $+0ch
        if      FW_VERSION >= 111
        db      0a5h, 86h, 0cbh
        else
        db      0a6h, 86h, 0cbh
        endif
cb_3236E:
        db      0b1h, 08h, 0b5h, 27h, 0b0h, 25h, 0cdh, 0b0h, 0c3h, 8bh, 1eh, 3eh, 2bh
        db      0c1h, 0e3h, 02h
        callf   [bx+TBL_32C64-APP3_CSBASE]           ; cs: -- ASL prefixes a code label itself
        retf
TBL_32C64:
        dw      L_31F7D-APP3_CSBASE, APP3_SEG
        dw      L_32E82-APP3_CSBASE, APP3_SEG
L_32394                         equ     $+8
        dw      far_3297A-APP3_CSBASE, APP3_SEG
        dw      L_321CC-APP3_CSBASE, APP3_SEG
L_32686:
        db      0e8h, 0c5h, 0fah
        mov     word ptr [C0_W_02B48], cb_323B7-APP3_CSBASE
        if      FW_VERSION >= 111
        db      8ch, 0d9h, 0beh, 10h, 07h, 0b3h, 01h, 0b7h, 00h, 0bah, 63h, 00h, 0bfh, 0e1h
        else
        db      8ch, 0d9h, 0beh, 10h, 07h, 0b3h, 01h, 0b7h, 00h, 0bah, 63h, 00h, 0bfh, 0d3h
        endif
        db      0c4h, 0cdh, 7eh
        KEY_CURSOR      (C0_BASE+L_32277-APP3_SEG*16), APP3_SEG, EP_L_323F0_OFF, APP3_SEG, 0000h, 0000h, (C0_BASE+far_32CFD-APP3_SEG*16), APP3_SEG
        db      0cbh
intcb_323A3_110:
        db      0a1h, 10h, 07h, 0e8h, 0a4h, 13h, 0eh, 0e8h, 0f5h, 08h
        db      0eh, 0e8h, 3eh, 09h, 0c7h, 06h, 4dh, 15h, 00h, 00h, 0c6h, 06h, 4fh, 15h, 00h, 0c6h
        db      06h, 50h, 15h, 00h, 0c7h, 06h, 51h, 15h, 00h, 00h, 0c6h, 06h, 53h, 15h, 00h, 0c6h
        db      06h, 54h, 15h, 00h, 0cbh
L_323D2:
        db      0e8h, 69h, 0fah
        mov     word ptr [C0_W_02B48], cb_323C0-APP3_CSBASE
        db      8ch, 0d9h
        if      FW_VERSION >= 111
        db      0beh, 12h, 07h, 0b3h, 01h, 0b7h, 00h, 0bah, 40h, 00h, 0bfh, 0dch, 18h, 0cdh, 7eh
        else
        db      0beh, 12h, 07h, 0b3h, 01h, 0b7h, 00h, 0bah, 40h, 00h, 0bfh, 0cfh, 18h, 0cdh, 7eh
        endif
        KEY_CURSOR      (C0_BASE+L_32394-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, EP_L_32D44_OFF, APP3_SEG
far_32CFD                         equ     $+1
        db      0cbh, 0e8h, 3ch, 0fah
        mov     word ptr [C0_W_02B48], cb_323C9-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 40h, 2bh
        if      FW_VERSION >= 111
        db      0b3h, 01h, 0b7h, 00h, 0bah, 63h, 00h, 0bfh, 6ah, 0c5h, 0cdh, 7eh
        else
        db      0b3h, 01h, 0b7h, 00h, 0bah, 63h, 00h, 0bfh, 5ch, 0c5h, 0cdh, 7eh
        endif
        KEY_CURSOR      (C0_BASE+FAR_32B57-APP3_SEG*16), APP3_SEG, EP_L_32D44_OFF, APP3_SEG, (C0_BASE+L_32686-APP3_SEG*16), APP3_SEG, EP_L_32783_OFF, APP3_SEG
        else
L_32277                       equ     $+0ah
        db      0c3h, 0b1h, 0b5h, 0b5h, 15h, 0b0h, 13h, 0cdh, 0b0h, 0c3h, 0e8h
        db      0e2h, 0fbh, 0c7h, 06h, 38h, 2bh, 0d1h, 0c0h, 8ch, 0d9h, 0beh, 3eh, 2bh, 0b3h, 00h, 0b7h
        db      00h, 0bah, 03h, 00h, 0bfh, 0c0h, 18h, 0cdh, 7dh
        KEY_CURSOR      0000h, 0000h, (C0_BASE+L_32596-APP3_SEG*16), APP3_SEG, 0000h, 0000h, EP_L_31D63_OFF, APP3_SEG
        db      0cbh
L_32596:
        db      8bh, 1eh, 3eh, 2bh
        db      0c1h, 0e3h, 02h
        callf   [bx+TBL_32B91-APP3_CSBASE]           ; cs: -- ASL prefixes a code label itself
        retf
TBL_32B91:
        dw      (C0_BASE+L_32686-APP3_SEG*16), APP3_SEG
        dw      L_32DE8-APP3_CSBASE, APP3_SEG
        dw      EP_L_328E0_OFF, APP3_SEG
        dw      EP_L_32FB0_OFF, APP3_SEG
L_322A3:
        db      0e8h, 98h, 0fbh
        mov     word ptr [C0_W_02B48], cb_325D6-APP3_CSBASE
        db      0b8h, 59h, 0c3h, 0bbh, 0e4h, 0c3h, 0bdh, 59h, 0c3h, 0bah, 0ch, 0c4h, 0bfh, 0c7h
        db      0c3h, 0beh, 0a3h, 0bfh, 0b1h, 08h, 0b5h, 15h, 0e8h, 0a5h, 80h, 0cbh
cb_325D6:
        db      0c3h, 8bh, 1eh, 3eh
        db      2bh, 0c1h, 0e3h, 02h
        callf   [bx+TBL_32BD2-APP3_CSBASE]           ; cs: -- ASL prefixes a code label itself
        retf
TBL_32BD2:
        dw      EP_L_32783_OFF, APP3_SEG
        dw      L_32E42-APP3_CSBASE, APP3_SEG
        dw      L_320EA-APP3_CSBASE, APP3_SEG
        dw      EP_L_321CC_OFF, APP3_SEG
        db      0e8h, 57h, 0fbh, 0c7h, 06h, 38h
        db      2bh, 0c6h, 0c3h, 0e8h, 0fh, 55h, 75h, 42h, 0b8h, 0a3h, 0c3h, 0bbh, 0c0h, 18h, 0bdh, 0a3h
        db      0c3h, 0bah, 0c0h, 18h, 0bfh, 59h, 0c4h, 0beh, 0a3h, 0bfh, 0b1h, 08h, 0b5h, 27h, 0e8h, 28h
        db      86h, 0cbh
L_3232A:
        db      0e8h, 2fh, 0fbh, 0c7h, 06h, 38h, 2bh, 0c6h, 0c3h, 0e8h, 0e7h, 54h, 75h, 1ah
        db      0b8h, 0a3h, 0c3h, 0bbh, 0c0h, 18h, 0bdh, 0a3h, 0c3h, 0bah, 0c0h, 18h, 0bfh, 59h, 0c4h, 0beh
        db      0a3h, 0bfh, 0b1h, 08h, 0b5h, 27h, 0e8h, 64h, 86h, 0cbh, 0c7h, 06h, 38h, 2bh, 50h, 0c4h
        KEY_CURSOR      0000h, 0000h, (C0_BASE+far_32C57-APP3_SEG*16), APP3_SEG, EP_L_31D63_OFF, APP3_SEG, 0000h, 0000h
        db      0e8h, 0ach, 86h, 0cbh, 0b1h, 08h, 0b5h, 27h, 0b0h, 25h, 0cdh, 0b0h, 0c3h
far_32C57:
        db      8bh
        db      1eh, 3eh, 2bh, 0c1h, 0e3h, 02h
        callf   [bx+TBL_32C64-APP3_CSBASE]           ; cs: -- ASL prefixes a code label itself
        retf
TBL_32C64:
        dw      EP_L_31F7D_OFF, APP3_SEG
        dw      EP_L_32E82_OFF, APP3_SEG
        dw      EP_FAR_3297A_OFF, APP3_SEG
        dw      EP_L_321CC_OFF, APP3_SEG
L_32686:
        db      0e8h, 0c5h, 0fah, 0c7h
        db      06h, 38h, 2bh, 0a7h, 0c1h, 8ch, 0d9h, 0beh, 10h, 07h, 0b3h, 01h, 0b7h, 00h, 0bah, 63h
        db      00h, 0bfh, 0a3h, 0c4h, 0cdh, 7eh
        KEY_CURSOR      (C0_BASE+L_32277-APP3_SEG*16), APP3_SEG, EP_L_323F0_OFF, APP3_SEG, 0000h, 0000h, (C0_BASE+far_32CFD-APP3_SEG*16), APP3_SEG
        db      0cbh, 0a1h, 10h, 07h, 0e8h, 0a4h, 13h, 0eh
        db      0e8h, 0f5h, 08h, 0eh, 0e8h, 3eh, 09h, 0c7h, 06h, 4dh, 15h, 00h, 00h, 0c6h, 06h, 4fh
        db      15h, 00h, 0c6h, 06h, 50h, 15h, 00h, 0c7h, 06h, 51h, 15h, 00h, 00h, 0c6h, 06h, 53h
        db      15h, 00h, 0c6h, 06h, 54h, 15h, 00h, 0cbh
L_323D2:
        db      0e8h, 69h, 0fah, 0c7h, 06h, 38h, 2bh, 0b0h
        db      0c1h, 8ch, 0d9h, 0beh, 12h, 07h, 0b3h, 01h, 0b7h, 00h, 0bah, 40h, 00h, 0bfh, 0c0h, 18h
        db      0cdh, 7eh
        KEY_CURSOR      (C0_BASE+L_32686-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, EP_L_32D44_OFF, APP3_SEG
        db      0cbh
far_32CFD:
        db      0e8h, 3ch, 0fah, 0c7h, 06h, 38h, 2bh, 0b9h, 0c1h, 8ch, 0d9h
        db      0beh, 40h, 2bh, 0b3h, 01h, 0b7h, 00h, 0bah, 63h, 00h, 0bfh, 2ch, 0c5h, 0cdh, 7eh
        KEY_CURSOR      (C0_BASE+L_32277-APP3_SEG*16), APP3_SEG, EP_L_32D44_OFF, APP3_SEG, (C0_BASE+L_32686-APP3_SEG*16), APP3_SEG, EP_L_32783_OFF, APP3_SEG
        endif
        endif
        db      0cbh
L_3244A:
        mov     ax, word ptr [C0_W_02B50]
        int     0d9h
        push    cs
        call    far_3363D
        mov     word ptr [A3_W_01555], 0
        mov     byte ptr [A3_B_01557], 0
        mov     byte ptr [A3_B_01558], 0
        retf
L_32D44:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_323D2-APP3_CSBASE
        if      FW_VERSION >= 112
        if      FW_VERSION >= 114
        FIELD_ENTRY     ds, P_2B52, 1, 0, 40h, (APP3_BASE+field_cb_none-APP3_SEG*16)
        if      FW_VERSION >= 120
        KEY_CURSOR      (C0_BASE+far_32CFD-APP3_SEG*16), APP3_SEG, 0000h, 0000h, EP_L_323F0_OFF, APP3_SEG, EP_L_32783_OFF, APP3_SEG
        else
        KEY_CURSOR      EP_APP3_C54D_OFF, APP3_SEG, 0000h, 0000h, EP_APP3_C520_OFF, APP3_SEG, EP_APP3_C5C1_OFF, APP3_SEG
        endif
        else
        mov     cx, ds
        mov     si, 2b42h
        mov     bl, 1
        mov     bh, 0
        mov     dx, 40h
        mov     di, (APP3_BASE+field_cb_none-APP3_SEG*16)
        int     7eh
        KEY_CURSOR      (C0_BASE+far_3270F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, EP_L_323F0_OFF, APP3_SEG, EP_L_32783_OFF, APP3_SEG
        endif
        retf
far_32D71:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], L_329C9-APP3_CSBASE
        if      FW_VERSION >= 114
        FIELD_WHEEL     ds, EP_L_252A3_OFF, 0, 0, 1, (APP3_BASE+field_cb_none-APP3_SEG*16)
        if      FW_VERSION >= 120
        KEY_CURSOR      EP_L_31D63_OFF, APP3_SEG, 0000h, 0000h, (C0_BASE+far_32CFD-APP3_SEG*16), APP3_SEG, (C0_BASE+L_327B0-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      EP_L_31D63_OFF, APP3_SEG, 0000h, 0000h, EP_APP3_C54D_OFF, APP3_SEG, (C0_BASE+L_327B0-APP3_SEG*16), APP3_SEG
        endif
        else
        FIELD_WHEEL     ds, C0_B_02B43, 0, 0, 1, (APP3_BASE+field_cb_none-APP3_SEG*16)
        KEY_CURSOR      EP_APP3_C54D_OFF, APP3_SEG, 0000h, 0000h, EP_APP3_C520_OFF, APP3_SEG, EP_APP3_C5C1_OFF, APP3_SEG
        endif
        else
        mov     cx, ds
        mov     si, 2b42h
        mov     bl, 1
        mov     bh, 0
        mov     dx, 40h
        mov     di, (APP3_BASE+field_cb_none-APP3_SEG*16)
        int     7eh
        if      FW_VERSION >= 110
        KEY_CURSOR      (C0_BASE+far_32CFD-APP3_SEG*16), APP3_SEG, 0000h, 0000h, EP_L_323F0_OFF, APP3_SEG, EP_L_32783_OFF, APP3_SEG
        else
        KEY_CURSOR      (C0_BASE+far_32CFD-APP3_SEG*16), APP3_SEG, 0000h, 0000h, EP_L_323F0_OFF, APP3_SEG, EP_L_32783_OFF, APP3_SEG
        endif
        retf
far_32D71:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], L_329C9-APP3_CSBASE
        FIELD_WHEEL     ds, 2b43h, 0, 0, 1, (APP3_BASE+field_cb_none-APP3_SEG*16)
        KEY_CURSOR      EP_L_31D63_OFF, APP3_SEG, 0000h, 0000h, (C0_BASE+far_32CFD-APP3_SEG*16), APP3_SEG, EP_APP3_C5C1_OFF, APP3_SEG
        endif
        retf
L_327B0:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_325D6-APP3_CSBASE
        mov     ax, P_C5C1
        mov     bx, P_C60B
        mov     di, P_C3F1
        mov     si, P_BFF1
        mov     cl, 0b5h
        mov     ch, 1eh
        call    EP_TGT_2B0A8_OFF+APP3_CSBASE
        retf
L_31F7D:
        if      FW_VERSION = 120
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_323E4-APP3_CSBASE
        mov     cx, ds
        mov     si, C0_W_02B54
        mov     bl, 1
        mov     bh, 0
        mov     dx, 3e7h
        mov     di, (APP3_BASE+field_cb_none-APP3_SEG*16)
        int     7eh
        KEY_CURSOR      (C0_BASE+L_3261C_114-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_327B0-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        retf
L_32DE8:
        endif
        call    fn_3273C
        if      FW_VERSION <> 120
        mov     word ptr [C0_W_02B48], cb_323E4-APP3_CSBASE
        FIELD_ENTRY     ds, C0_W_02B54, 1, 0, 3e7h, (APP3_BASE+field_cb_none-APP3_SEG*16)
        if      FW_VERSION >= 112
        KEY_CURSOR      (C0_BASE+L_3261C_114-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_327B0-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        retf
        else
        if      FW_VERSION >= 110
        KEY_CURSOR      (C0_BASE+L_3232A-APP3_SEG*16), APP3_SEG, 0000h, 0000h, EP_L_324BE_OFF, APP3_SEG, 0000h, 0000h
        else
        KEY_CURSOR      (C0_BASE+L_3232A-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_327B0-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        endif
        retf
        endif
L_32DE8:
        call    fn_3273C
        endif
        mov     word ptr [C0_W_02B48], cb_32458-APP3_CSBASE
        mov     cx, ds
        mov     si, 710h
        mov     bl, 1
        mov     bh, 0
        mov     dx, 63h
        mov     di, (APP3_BASE+field_cb_none-APP3_SEG*16)
        int     7eh
        if      FW_VERSION >= 110
        if      FW_VERSION >= 114
        KEY_CURSOR      (C0_BASE+FAR_32B57-APP3_SEG*16), APP3_SEG, L_32E15-APP3_CSBASE, APP3_SEG, 0000h, 0000h, L_32E42-APP3_CSBASE, APP3_SEG
        else
        if      FW_VERSION >= 112
        KEY_CURSOR      (C0_BASE+FAR_32B57-APP3_SEG*16), APP3_SEG, (C0_BASE+L_32E15-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_32E42-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      (C0_BASE+FAR_32B57-APP3_SEG*16), APP3_SEG, (C0_BASE+L_32535-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_32562-APP3_SEG*16), APP3_SEG
        endif
L_32535                         equ     $+1
        endif
        retf
L_32E15:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_32461-APP3_CSBASE
        else
        KEY_CURSOR      (C0_BASE+L_32277-APP3_SEG*16), APP3_SEG, (C0_BASE+L_32E15-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_32E42-APP3_SEG*16), APP3_SEG
        db      0cbh
L_32E15:
        db      0e8h
        and     al, 0f9h
        mov     word ptr [C0_W_02B48], C0_W_0C28F
        endif
        mov     cx, ds
        mov     si, 712h
        mov     bl, 1
        mov     bh, 0
        mov     dx, 40h
        mov     di, (APP3_BASE+field_cb_none-APP3_SEG*16)
        int     7eh
        if      FW_VERSION >= 112
        if      FW_VERSION >= 120
        KEY_CURSOR      (C0_BASE+L_32DE8-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, (C0_BASE+L_32E42-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      (C0_BASE+L_32DE8-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, (C0_BASE+L_32E42-APP3_SEG*16), APP3_SEG
        endif
        retf
L_32E42:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_3246A-APP3_CSBASE
        if      FW_VERSION >= 120
        db      8ch, 0d9h, 0beh, 56h, 2bh, 0b3h, 00h
        db      0b7h, 00h, 0bah, 03h, 00h
        mov     di, L_32E6F-APP3_CSBASE
        db      0cdh
        db      7dh
        KEY_CURSOR      EP_L_31D63_OFF, APP3_SEG, 0000h, 0000h, (C0_BASE+L_32DE8-APP3_SEG*16), APP3_SEG, EP_L_32E82_OFF, APP3_SEG
        else
        FIELD_WHEEL     ds, 2b46h, 0, 0, 3, L_32E6F-APP3_CSBASE
        KEY_CURSOR      EP_L_31D63_OFF, APP3_SEG, 0000h, 0000h, (C0_BASE+L_32DE8-APP3_SEG*16), APP3_SEG, EP_L_32E82_OFF, APP3_SEG
        endif
        else
        if      FW_VERSION >= 110
        KEY_CURSOR      (C0_BASE+L_32DE8-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, (C0_BASE+L_32562-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      (C0_BASE+L_32DE8-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, (C0_BASE+L_32E42-APP3_SEG*16), APP3_SEG
        endif
        retf
L_32E42:
L_32562:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_3246A-APP3_CSBASE
        FIELD_WHEEL     ds, 2b46h, 0, 0, 3, L_32E6F-APP3_CSBASE
        if      FW_VERSION >= 110
        KEY_CURSOR      EP_L_31D63_OFF, APP3_SEG, 0000h, 0000h, (C0_BASE+L_32DE8-APP3_SEG*16), APP3_SEG, EP_L_32E82_OFF, APP3_SEG
        else
        KEY_CURSOR      EP_L_31D63_OFF, APP3_SEG, 0000h, 0000h, (C0_BASE+L_32DE8-APP3_SEG*16), APP3_SEG, EP_L_32E82_OFF, APP3_SEG
        endif
        endif
        retf
L_32E6F:
        cmp     al, 2
        jne     L_32893
        cmp     word ptr [C0_W_02B57], 0c8h
        jb      L_32893
        mov     word ptr [C0_W_02B57], 0c8h
L_32893:
        retf
L_32E82:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_32473-APP3_CSBASE
        mov     cx, ds
        mov     si, EP_L_252A7_OFF
        mov     bl, 0
        mov     bh, 0
        mov     dx, 270fh
        if      FW_VERSION >= 112
        mov     di, L_32EAF-APP3_CSBASE
        else
        mov     di, C0_W_0C6F1
        endif
        int     7eh
        if      FW_VERSION >= 114
        KEY_CURSOR      L_32C0A-APP3_CSBASE, APP3_SEG, 0000h, 0000h, L_32E42-APP3_CSBASE, APP3_SEG, 0000h, 0000h
        elseif  FW_VERSION >= 112
        KEY_CURSOR      (C0_BASE+L_3232A-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_32E42-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        elseif  FW_VERSION >= 110
        KEY_CURSOR      (C0_BASE+L_3232A-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_32562-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        else
        KEY_CURSOR      (C0_BASE+L_3232A-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_32E42-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        endif
        retf
L_32EAF:
        mov     bx, 0c8h
        cmp     byte ptr [P_2B56], 2
        je      br_32EBC
        mov     bx, 270fh
br_32EBC:
        cmp     ax, bx
        jb      br_32EC2
        mov     ax, bx
br_32EC2:
        cmp     ax, 0
        jne     L_32ECA
        mov     ax, 1
L_32ECA:
        mov     word ptr [C0_W_02B57], ax
        retf
L_328E0:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_32458-APP3_CSBASE
        mov     cx, ds
        mov     si, 710h
        mov     bl, 1
        mov     bh, 0
        mov     dx, 63h
        mov     di, (APP3_BASE+field_cb_none-APP3_SEG*16)
        int     7eh
        if      FW_VERSION >= 112
        if      FW_VERSION >= 120
        KEY_CURSOR      (C0_BASE+far_32B57-APP3_SEG*16), APP3_SEG, (C0_BASE+L_320BD-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_320EA-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      (C0_BASE+FAR_32B57-APP3_SEG*16), APP3_SEG, (C0_BASE+L_320BD-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_320EA-APP3_SEG*16), APP3_SEG
        endif
        else
        if      FW_VERSION >= 110
        KEY_CURSOR      (C0_BASE+FAR_32B57-APP3_SEG*16), APP3_SEG, EP_L_3261B_OFF, APP3_SEG, 0000h, 0000h, (C0_BASE+L_320EA-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      (C0_BASE+L_32277-APP3_SEG*16), APP3_SEG, (C0_BASE+L_320BD-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_320EA-APP3_SEG*16), APP3_SEG
        endif
        endif
        retf
L_320BD:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_32461-APP3_CSBASE
        mov     cx, ds
        mov     si, 712h
        mov     bl, 1
        db      0b7h, 00h, 0bah, 40h, 00h
        mov     di, (APP3_BASE+field_cb_none-APP3_SEG*16)
        int     7eh
        if      FW_VERSION >= 112
        if      FW_VERSION >= 120
        KEY_CURSOR      (C0_BASE+L_328E0-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, (C0_BASE+L_320EA-APP3_SEG*16), APP3_SEG
        retf
L_320EA:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_3246A-APP3_CSBASE
        mov     cx, ds
        mov     si, 184eh
        mov     bl, 0
        mov     bh, 0
        mov     dx, 3
        mov     di, (C0_BASE+L_32F55-APP3_SEG*16)
        int     7dh
        KEY_CURSOR      EP_L_31D63_OFF, APP3_SEG, 0000h, 0000h, (C0_BASE+L_328E0-APP3_SEG*16), APP3_SEG, (C0_BASE+far_3297A-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      EP_L_328E0_OFF, APP3_SEG, 0000h, 0000h, 0000h, 0000h, (C0_BASE+L_320EA-APP3_SEG*16), APP3_SEG
        retf
L_320EA:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_3246A-APP3_CSBASE
        FIELD_WHEEL     ds, 184eh, 0, 0, 3, L_32F55-APP3_CSBASE
        KEY_CURSOR      EP_L_31D63_OFF, APP3_SEG, 0000h, 0000h, EP_L_328E0_OFF, APP3_SEG, EP_FAR_3297A_OFF, APP3_SEG
        endif
        else
        KEY_CURSOR      EP_L_328E0_OFF, APP3_SEG, 0000h, 0000h, 0000h, 0000h, (C0_BASE+L_320EA-APP3_SEG*16), APP3_SEG
        retf
L_320EA:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_3246A-APP3_CSBASE
        FIELD_WHEEL     ds, 184eh, 0, 0, 3, L_32F55-APP3_CSBASE
        KEY_CURSOR      (C0_BASE+L_322A3-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_328E0-APP3_SEG*16), APP3_SEG, (C0_BASE+far_3297A-APP3_SEG*16), APP3_SEG
        endif
        retf
L_32F55:
        cmp     al, 2
        jne     br_32F5A
        retf
br_32F5A:
        mov     al, byte ptr [A3_B_0184F]
        cmp     al, 7fh
        jae     L_32974
        retf
L_32974:
        mov     byte ptr [A3_B_0184F], 7fh
        retf
far_3297A:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_324E9-APP3_CSBASE
        mov     cx, ds
        mov     si, 184fh
        mov     bl, 0
        mov     bh, 0
        mov     dx, 0c8h
        if      FW_VERSION >= 114
        mov     di, d_c0_w_0c7d7-APP3_CSBASE
        int     7eh
        if      FW_VERSION >= 120
        KEY_CURSOR      (C0_BASE+L_3261C_114-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_320EA-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        else
        KEY_CURSOR      (C0_BASE+L_3232A-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_320EA-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        endif
        retf
        else
        mov     di, C0_W_0C7D7
        int     7eh
        KEY_CURSOR      (C0_BASE+L_3232A-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_320EA-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        retf
        endif
d_c0_w_0c7d7:
        mov     bl, 0c8h
        cmp     byte ptr [A3_B_0184E], 2
        je      br_32FA0
        mov     bl, 7fh
br_32FA0:
        cmp     al, bl
        jb      br_32FA6
        mov     al, bl
br_32FA6:
        cmp     al, 0
        jne     L_329BE
        mov     al, 1
L_329BE:
        mov     byte ptr [A3_B_0184F], al
        retf
L_32FB0:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_32458-APP3_CSBASE
        if      FW_VERSION >= 110
        if      FW_VERSION < 120
        FIELD_ENTRY     ds, 710h, 1, 0, 63h, (APP3_BASE+field_cb_none-APP3_SEG*16)
        KEY_CURSOR      (C0_BASE+FAR_32B57-APP3_SEG*16), APP3_SEG, (C0_BASE+L_326FD-APP3_SEG*16), APP3_SEG, 0000h, 0000h, EP_L_321CC_OFF, APP3_SEG
        retf
L_326FD:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_32461-APP3_CSBASE
        endif
        else
        FIELD_ENTRY     ds, 710h, 1, 0, 63h, (APP3_BASE+field_cb_none-APP3_SEG*16)
        KEY_CURSOR      (C0_BASE+L_32277-APP3_SEG*16), APP3_SEG, (C0_BASE+L_326FD-APP3_SEG*16), APP3_SEG, 0000h, 0000h, EP_L_321CC_OFF, APP3_SEG
        retf
L_326FD:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_32461-APP3_CSBASE
        endif
        mov     cx, ds
        if      FW_VERSION >= 120
        mov     si, 710h
        else
        mov     si, 712h
        endif
        mov     bl, 1
        mov     bh, 0
        if      FW_VERSION >= 120
        mov     dx, 63h
        else
        mov     dx, 40h
        endif
        mov     di, (APP3_BASE+field_cb_none-APP3_SEG*16)
        int     7eh
        if      FW_VERSION >= 120
        KEY_CURSOR      (C0_BASE+FAR_32B57-APP3_SEG*16), APP3_SEG, (C0_BASE+L_32FDD-APP3_SEG*16), APP3_SEG, 0000h, 0000h, EP_L_321CC_OFF, APP3_SEG
        retf
L_32FDD:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_32461-APP3_CSBASE
        FIELD_ENTRY     ds, 712h, 1, 0, 40h, (APP3_BASE+field_cb_none-APP3_SEG*16)
        KEY_CURSOR      EP_L_32FB0_OFF, APP3_SEG, 0000h, 0000h, 0000h, 0000h, EP_L_321CC_OFF, APP3_SEG
        elseif  FW_VERSION >= 112
        KEY_CURSOR      EP_L_32FB0_OFF, APP3_SEG, 0000h, 0000h, 0000h, 0000h, EP_L_321CC_OFF, APP3_SEG
        else
        KEY_CURSOR      EP_L_32FB0_OFF, APP3_SEG, 0000h, 0000h, 0000h, 0000h, EP_L_321CC_OFF, APP3_SEG
        endif
        retf
        if      FW_VERSION >= 110
L_321CC:
        endif
        if      FW_VERSION >= 110
        call    fn_3273C
        mov     word ptr [C0_W_02B48], cb_3226E-APP3_CSBASE
        else
L_321CC:
        call    fn_3273C
        mov     word ptr [C0_W_02B48], 0c350h
        endif
        mov     cx, ds
        mov     si, EP_L_252A9_OFF
        mov     bl, 0
        mov     bh, 0
        mov     dx, 18h
        mov     di, (APP3_BASE+field_cb_none-APP3_SEG*16)
        int     7dh
        if      FW_VERSION >= 120
        KEY_CURSOR      EP_L_31D63_OFF, APP3_SEG, 0000h, 0000h, EP_L_32FB0_OFF, APP3_SEG, EP_FIELD_CB_NONE_OFF, APP3_SEG
L_33037                         equ     $+1
        retf
        elseif  FW_VERSION >= 112
        KEY_CURSOR      EP_L_31D63_OFF, APP3_SEG, 0000h, 0000h, EP_L_32FB0_OFF, APP3_SEG, (APP3_BASE+field_cb_none-APP3_SEG*16), APP3_SEG
        db      0cbh
L_33037:
        else
        if      FW_VERSION >= 110
        KEY_CURSOR      EP_L_31D63_OFF, APP3_SEG, 0000h, 0000h, EP_L_32FB0_OFF, APP3_SEG, EP_FIELD_CB_NONE_OFF, APP3_SEG
        else
        KEY_CURSOR      EP_L_31D63_OFF, APP3_SEG, 0000h, 0000h, EP_L_32FB0_OFF, APP3_SEG, (APP3_BASE+field_cb_none-APP3_SEG*16), APP3_SEG
        endif
        retf
L_33037:
        endif
        mov     bx, word ptr [C0_W_02B4E]
        shl     bx, 1
        call    word ptr cs:[bx+TBL_33043-APP3_CSBASE]
        retf
TBL_33043:
        dw      tgt_3304B-APP3_CSBASE, tgt_33139-APP3_CSBASE, tgt_33236-APP3_CSBASE, tgt_33241-APP3_CSBASE
tgt_3304B:
        call    EP_FN_28233_OFF+APP3_CSBASE
        jne     L_32A63
        ret
L_32A63:
        call    EP_FN_280CB_OFF+APP3_CSBASE
        mov     cl, byte ptr [A3_B_01577]
        mov     ch, byte ptr [A3_B_01578]
        je      L_32A7F
        mov     cl, byte ptr [A3_B_0157A]
        mov     ch, cl
        cmp     cl, 23h
        jae     L_32A7F
        mov     cl, 0
        mov     ch, 7fh
L_32A7F:
        mov     bp, word ptr [A3_W_0154D]
        mov     bl, byte ptr [A3_B_0154F]
        mov     bh, byte ptr [A3_B_01550]
        mov     di, word ptr [A3_W_01551]
        mov     dl, byte ptr [A3_B_01553]
        mov     dh, byte ptr [A3_B_01554]
        mov     si, word ptr [EP_L_252A4_OFF]
        inc     si
        push    word ptr [C0_W_00710]
        pusha
        int     0b4h
        push    word ptr [A2_W_CUR_SEQ]
        mov     ax, word ptr [C0_W_02B50]
        mov     word ptr [A2_W_CUR_SEQ], ax
        call    fn_3404B
        if      FW_VERSION >= 120
        call    APP3_BASE+fn_2823E-SEGBASE
        db      0a1h, 55h, 15h, 8ah, 16h, 57h, 15h, 8ah, 0eh, 58h, 15h, 0b6h, 00h
        db      0b5h, 00h, 0b3h, 0bh, 0cdh, 87h, 58h, 0cdh, 0d9h, 0cdh, 0e7h, 61h, 0a1h, 12h, 07h, 8ah
        db      26h, 53h, 2bh, 0d0h, 0cch, 0ah, 0c4h, 8ah, 26h, 52h, 2bh, 0cdh, 0edh, 5bh
        else
        call    EP_FN_2823E_OFF+APP3_CSBASE
        mov     ax, word ptr [A3_W_01555]
        mov     dl, byte ptr [A3_B_01557]
        mov     cl, byte ptr [A3_B_01558]
        mov     dh, 0
        mov     ch, 0
        mov     bl, 0bh
        int     87h
        pop     ax
        int     0d9h
        int     0e7h
        popa
        mov     ax, word ptr [A3_W_00712]
        mov     ah, byte ptr [C0_B_02B43]
        ror     ah, 1
        or      al, ah
        mov     ah, byte ptr [C0_B_02B42]
        int     0edh
        pop     bx
        endif
        jb      L_32B02
        DISP_PLANE0
        int     0e8h
        mov     ax, word ptr [A2_W_CUR_SEQ]
        int     0d8h
        mov     ax, word ptr [A3_W_0071A]
        int     0d9h
        int     0d6h
        mov     byte ptr [A2_B_00F2E], 1
        int     0a5h
        mov     al, 1
        int     0dch
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        ret
L_32B02:
        mov     word ptr [A2_W_CUR_SEQ], bx
        mov     al, 19h
        int     95h
        int     0e8h
        int     0a5h
        mov     al, 1
        int     0dch
        push    cs
        call    L_32120
        mov     byte ptr [A2_B_00F2E], 0
        ret
L_32B1C:
        pusha
        push    es
        mov     ch, 0
        call    L_3311E
        db      0b5h, 01h
        call    L_3311E
        db      0b5h, 02h
        call    L_3311E
        db      07h, 61h, 0c3h
L_3311E:
        mov     ah, 0b0h
        mov     al, 78h
        mov     cl, 7fh
        mov     bh, 0
        mov     dx, 40h
L_32B3B:
        pusha
        mov     bl, 0
        push    ds
        int     35h
        pop     ds
        popa
        inc     ah
        cmp     ah, 0b4h
        jne     L_32B3B
        ret
tgt_33139:
        int     85h
        if      FW_VERSION >= 120
        db      50h, 52h
        call    APP3_BASE+fn_2B32D-SEGBASE
        call    APP3_BASE+fn_2B36F-SEGBASE
        db      8ah, 1eh, 77h, 15h, 8ah, 3eh, 78h, 15h, 53h
        call    APP3_BASE+fn_280CB-SEGBASE
        db      5bh
        else
        push    ax
        push    dx
        if      FW_VERSION >= 112
        db      0e8h, 0fbh, 81h, 0e8h, 3ah, 82h
        elseif  FW_VERSION >= 111
        db      0e8h, 0fdh, 81h, 0e8h, 3ch, 82h
        elseif  FW_VERSION >= 110
        db      0e8h, 0feh, 81h, 0e8h, 3dh, 82h
        else
        db      0e8h, 04h, 82h, 0e8h, 43h, 82h
        endif
        mov     bl, byte ptr [A3_B_01577]
        mov     bh, byte ptr [A3_B_01578]
        push    bx
        call    EP_FN_280CB_OFF+APP3_CSBASE
        pop     bx
        endif
        je      L_32B75
        mov     bl, 0
        mov     bh, 7fh
        cmp     byte ptr [A3_B_01579], 41h
        je      L_32B75
        mov     bl, byte ptr [A3_B_0157A]
        mov     bh, bl
L_32B75:
        push    bx
        int     83h
        mov     bl, byte ptr [EP_L_252A6_OFF]
        mov     bh, 0
        shl     bx, 1
        mov     di, word ptr cs:[bx+TBL_331EB-APP3_CSBASE]
        pop     bx
L_32B86:
        mov     al, byte ptr es:[si+4]
        cmp     al, 0ffh
        je      L_331D8
        mov     cx, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        and     dx, 3f0fh
        sub     cx, word ptr [A3_W_0156F]
        sbb     dl, byte ptr [A3_W_01571]
        jae     L_331D8
        if      FW_VERSION >= 120
        db      3ah, 0c3h
        jb      L_331D3
        db      3ah, 0c7h
        else
        cmp     al, bl
        jb      L_331D3
        cmp     al, bh
        endif
        if      FW_VERSION >= 120
        ja      L_331D3
        else
        db      77h, 3ah
        endif
        db      3ah, 36h
        db      12h, 07h
        if      FW_VERSION >= 120
        jne     L_331D3
        else
        db      75h, 34h
        endif
        db      26h, 8ah, 64h, 02h, 26h, 8ah, 44h, 03h, 0c0h, 0ech, 04h, 0c1h, 0e0h, 02h, 26h
        db      8ah, 44h, 05h, 0ffh, 0d7h, 26h, 88h, 44h, 05h, 26h, 8ah, 44h, 03h, 0c0h, 0e0h, 02h
        shr     ax, 2
        mov     byte ptr es:[si+3], al
        mov     al, byte ptr es:[si+2]
        shl     al, 4
        shr     ax, 4
        mov     byte ptr es:[si+2], al
L_331D3:
        if      FW_VERSION >= 120
        call    APP3_BASE+fn_281FE-SEGBASE
        jmp     SHORT L_32B86
L_331D8:
        db      0cdh, 0d6h, 0c6h, 06h, 2eh, 0fh
        db      01h, 5ah
        else
        call    EP_FN_281FE_OFF+APP3_CSBASE
        jmp     L_32B86
L_331D8:
        int     0d6h
        mov     byte ptr [A2_B_00F2E], 1
        pop     dx
        endif
        pop     ax
        mov     bl, 0ah
        int     87h
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        ret
TBL_331EB:
        dw      tccb_331F3-APP3_CSBASE, tccb_33200-APP3_CSBASE, tccb_33212-APP3_CSBASE, tccb_33232-APP3_CSBASE
tccb_331F3:
        add     ax, word ptr [C0_W_02B57]
        cmp     ax, 270fh
        jb      L_32C11
        mov     ax, 270fh
L_32C11:
        ret
tccb_33200:
        sub     ax, word ptr [C0_W_02B57]
        jae     L_32C1B
        mov     ax, 1
L_32C1B:
        cmp     ax, 0
        jne     L_32C23
        mov     ax, 1
L_32C23:
        ret
tccb_33212:
        mov     cx, word ptr [C0_W_02B57]
        mul     cx
        mov     cx, 64h
        cmp     dx, cx
        jae     L_32C38
        div     cx
        cmp     ax, 270fh
        jb      L_32C3B
L_32C38:
        mov     ax, 270fh
L_32C3B:
        cmp     ax, 0
        jne     L_32C43
        mov     ax, 1
L_32C43:
        ret
tccb_33232:
        mov     ax, word ptr [C0_W_02B57]
        ret
tgt_33236:
        mov     byte ptr [A2_B_00F2E], 1
        if      FW_VERSION >= 120
        db      9ah
        dw      EP_L_2C9D9_OFF, EP_L_2C9D9_SEG
        db      0c3h
        else
        callf   APP3_SEG:(APP3_BASE+L_2C8D7-APP3_SEG*16)
        ret
        endif
tgt_33241:
        call    EP_FN_280CB_OFF+APP3_CSBASE
        je      L_32C59
        ret
L_32C59:
        int     85h
        push    ax
        push    dx
        if      FW_VERSION >= 120
        call    EP_FN_2B32D_OFF+APP3_CSBASE
        call    APP3_BASE+fn_2B36F-SEGBASE
        db      8ah, 1eh, 77h, 15h, 8ah, 3eh, 78h, 15h
        else
        if      FW_VERSION >= 112
        db      0e8h, 0edh, 80h, 0e8h, 2ch, 81h
        elseif  FW_VERSION >= 111
        db      0e8h, 0efh, 80h, 0e8h, 2eh, 81h
        elseif  FW_VERSION >= 110
        db      0e8h, 0f0h, 80h, 0e8h, 2fh, 81h
        else
        db      0e8h, 0f6h, 80h, 0e8h, 35h, 81h
        endif
        mov     bl, byte ptr [A3_B_01577]
        mov     bh, byte ptr [A3_B_01578]
        endif
        push    bx
        int     83h
        pop     bx
L_32C6F:
        mov     al, byte ptr es:[si+4]
        cmp     al, 0ffh
        je      L_332A1
        mov     cx, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        and     dx, 3f0fh
        sub     cx, word ptr [A3_W_0156F]
        sbb     dl, byte ptr [A3_W_01571]
        jae     L_332A1
        if      FW_VERSION >= 120
        db      3ah, 0c3h
        jb      L_3329C
        db      3ah, 0c7h
        else
        cmp     al, bl
        jb      L_3329C
        cmp     al, bh
        endif
        ja      L_3329C
        cmp     dh, byte ptr [A3_W_00712]
        jne     L_3329C
        if      FW_VERSION >= 120
        db      02h, 06h, 59h, 2bh, 2ch, 0ch
        jae     L_33292
        db      04h, 0ch
L_33292:
        db      3ch, 7fh
        jb      L_33298
        db      2ch, 0ch
        else
        add     al, byte ptr [C0_B_02B49]
        sub     al, 0ch
        jae     L_32CA4
        add     al, 0ch
L_32CA4:
        cmp     al, 7fh
        jb      L_32CAA
        sub     al, 0ch
L_32CAA:
        endif
L_33298:
        mov     byte ptr es:[si+4], al
L_3329C:
        if      FW_VERSION >= 120
        call    APP3_BASE+fn_281FE-SEGBASE
        jmp     SHORT L_32C6F
L_332A1:
        db      0cdh, 0d6h, 0c6h, 06h, 2eh, 0fh, 01h, 5ah
        else
        call    EP_FN_281FE_OFF+APP3_CSBASE
        jmp     L_32C6F
L_332A1:
        int     0d6h
        mov     byte ptr [A2_B_00F2E], 1
        pop     dx
        endif
        pop     ax
        mov     bl, 0ah
        int     87h
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        ret
L_32CC6:
        mov     word ptr [A2_W_SEQ_SEG], 8000h
        mov     word ptr [C0_W_02B40], L_32CC6-APP3_CSBASE
        push    cs
        call    far_335ED
        callf   [C0_W_02BE0]
        retf
L_32CDB:
        pop     si
        push    si
        sub     si, 3
        mov     word ptr [C0_W_02BE0], si
        int     0a4h
        if      FW_VERSION >= 114
        KEY_SOFT        EP_FAR_32782_OFF, EP_FAR_32782_SEG, 0000h, 0000h, EP_FAR_33753_OFF, APP3_SEG, EP_L_33312_OFF, APP3_SEG, 0000h, 0000h, L_33037-APP3_CSBASE, APP3_SEG
        elseif  FW_VERSION >= 112
        KEY_SOFT        EP_FAR_32782_OFF, EP_FAR_32782_SEG, 0000h, 0000h, EP_FAR_33753_OFF, APP3_SEG, EP_L_33312_OFF, APP3_SEG, 0000h, 0000h, (C0_BASE+L_33037-APP3_SEG*16), APP3_SEG
        elseif  FW_VERSION >= 110
        KEY_SOFT        EP_FAR_32782_OFF, APP3_SEG, 0000h, 0000h, EP_FAR_33753_OFF, APP3_SEG, EP_L_33312_OFF, APP3_SEG, 0000h, 0000h, EP_L_32757_OFF, APP3_SEG
        else
        KEY_SOFT        EP_FAR_32782_OFF, APP3_SEG, 0000h, 0000h, EP_FAR_33753_OFF, APP3_SEG, EP_L_33312_OFF, APP3_SEG, 0000h, 0000h, (C0_BASE+L_33037-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        if      FW_VERSION >= 112
        KEY_DOWN        20h, L_33317-APP3_CSBASE, APP3_SEG
        if      FW_VERSION >= 114
        KEY_DOWN        15h, L_3368B-APP3_CSBASE, APP3_SEG
        else
        KEY_DOWN        15h, (C0_BASE+L_3368B-APP3_SEG*16), APP3_SEG
        endif
        else
        KEY_DOWN        20h, (C0_BASE+L_33317-APP3_SEG*16), APP3_SEG
        KEY_DOWN        15h, (C0_BASE+L_3368B-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        26h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        ret
L_33317:
        DISP_CLEAR
        DISP_TEXT       04h, 03h, "From  Sq:                To Sq:"
        DISP_TEXT       04h, 0eh, "   First bar:            After bar:"
        DISP_TEXT       04h, 24h, "    Last bar:               Copies:"
        DISP_BOX        00h, 00h, 80h, 31h
        DISP_HLINE      01h, 31h, 7fh
        DISP_VLINE      80h, 01h, 31h
        DISP_BOX        8ah, 00h, 6dh, 31h
        DISP_HLINE      8bh, 31h, 6ch
        DISP_VLINE      0f7h, 01h, 30h
        DISP_ERASE      7fh, 07h, 14h, 09h
        DISP_TEXT       7bh, 08h, "COPY"
        mov     si, 19h
        DISP_BMP        78h, 03h, 19h
        DISP_HDOTS      01h, 0bh, 78h
        DISP_HDOTS      99h, 0bh, 5dh
        DISP_BOX        1fh, 1ah, 0bh, 04h
        DISP_FILL       29h, 1ah, 0bh, 04h
        DISP_FILL       3dh, 1ah, 0bh, 04h
        DISP_BOX        47h, 1ah, 0bh, 04h
        DISP_BOX        51h, 1ah, 0bh, 04h
        mov     si, 14h
        DISP_BMP        2bh, 16h, 14h
        mov     si, 13h
        DISP_BMP        3fh, 1eh, 13h
        mov     si, 15h
        DISP_BMP        33h, 18h, 15h
        mov     si, 16h
        DISP_BMP        33h, 1ch, 16h
        mov     si, 15h
        DISP_BMP        3ch, 18h, 15h
        mov     si, 16h
        DISP_BMP        3ch, 1ch, 16h
        DISP_BOX        0a5h, 1ah, 0bh, 04h
        DISP_BOX        0afh, 1ah, 0bh, 04h
        DISP_BOX        0c3h, 1ah, 0bh, 04h
        DISP_BOX        0cdh, 1ah, 0bh, 04h
        DISP_BOX        0d7h, 1ah, 0bh, 04h
        mov     si, 14h
        DISP_BMP        0b1h, 16h, 14h
        mov     si, 13h
        DISP_BMP        0bbh, 1ch, 13h
        DISP_SOFTKEY    01h, DISP_SK_FILL,   "EVENTS"
        DISP_SOFTKEY    02h, DISP_SK_PLAIN, "BAR"
        DISP_SOFTKEY    03h, DISP_SK_FILL,   "TrMOVE"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "USER"
        DISP_SOFTKEY    06h, DISP_SK_BOX,    "DO IT"
        mov     ax, word ptr [C0_W_00710]
        inc     al
        DISP_NUM        3fh, 03h, 02h
        mov     ax, word ptr [C0_W_02B50]
        inc     al
        DISP_NUM        0beh, 03h, 02h
        mov     ax, word ptr [C0_W_02BE4]
        inc     ax
        DISP_NUMR       52h, 0eh, 03h
        mov     ax, word ptr [C0_W_02BE6]
        inc     ax
        DISP_NUMR       52h, 24h, 03h
        mov     ax, word ptr [C0_W_02BE8]
        DISP_NUMR       0d6h, 0eh, 03h
        if      FW_VERSION < 120
        mov     ax, word ptr [C0_W_02B44_2]
        else
        mov     ax, word ptr [C0_W_02B54]
        endif
        inc     ax
        DISP_NUMR       0d6h, 24h, 03h
        if      FW_VERSION >= 110
        call    word ptr [C0_W_02B48]
        retf
cb_32EF5:
        if      FW_VERSION >= 112
        DISP_CURSOR     3fh, 3, 0dh
        ret
cb_32EFE:
        DISP_CURSOR     0beh, 3, 0dh
        ret
cb_32F07:
        DISP_CURSOR     52h, 0eh, 13h
        ret
cb_32F10:
        DISP_CURSOR     52h, 24h, 13h
        ret
L_33507:
        DISP_CURSOR     0d6h, 0eh, 13h
        ret
cb_32C30:
        DISP_CURSOR     0d6h, 24h, 13h
        ret
far_32F2B:
        call    L_32CDB
        mov     word ptr [C0_W_02B48], cb_32EF5-APP3_CSBASE
        if      FW_VERSION >= 120
        FIELD_ENTRY     ds, 710h, 1, 0, 63h, intcb_32CA1-APP3_CSBASE
        KEY_CURSOR      0000h, 0000h, (C0_BASE+L_32C93-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_32735-APP3_SEG*16), APP3_SEG
        else
        mov     cx, ds
        mov     si, 710h
        mov     bl, 1
        mov     bh, 0
        mov     dx, 63h
        mov     di, (C0_BASE+intcb_32CA1-APP3_SEG*16)
        int     7eh
        KEY_CURSOR      0000h, 0000h, (C0_BASE+L_33546-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_33573-APP3_SEG*16), APP3_SEG
        endif
L_33546                         equ     $+1
        if      FW_VERSION >= 120
        db      0cbh
L_32C93:
        call    L_32CDB
        mov     word ptr [C0_W_02B48], cb_32EFE-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 50h, 2bh
        db      0b3h, 01h, 0b7h, 00h, 0bah, 63h, 00h
        mov     di, L_3244A-APP3_CSBASE
        db      0cdh, 7eh
        KEY_CURSOR      (C0_BASE+far_32F2B-APP3_SEG*16), APP3_SEG, EP_L_32D30_OFF, APP3_SEG, 0000h, 0000h, EP_L_32D30_OFF, APP3_SEG
        else
        db      0cbh, 0e8h, 80h
        db      0fdh
        mov     word ptr [C0_W_02B48], cb_32EFE-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 40h, 2bh, 0b3h, 01h, 0b7h, 00h
        db      0bah, 63h, 00h, 0bfh, 6ch, 0c5h, 0cdh, 7eh
        KEY_CURSOR      EP_FAR_32F2B_OFF, APP3_SEG, (C0_BASE+L_33610-APP3_SEG*16), APP3_SEG, 0000h, 0000h, EP_L_32D30_OFF, APP3_SEG
        endif
L_33573                         equ     $+1
        if      FW_VERSION >= 120
        db      0cbh
L_32735:
        db      0e8h
        db      53h, 0fdh
        mov     word ptr [C0_W_02B48], cb_32F07-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0e4h, 2bh, 0b3h, 01h, 0b7h
        db      00h, 0bah, 0e7h, 03h
        mov     di, L_335A0-APP3_CSBASE
        db      0cdh, 7eh
        KEY_CURSOR      0000h, 0000h, EP_L_32D30_OFF, APP3_SEG, (C0_BASE+far_32F2B-APP3_SEG*16), APP3_SEG, (C0_BASE+far_335C0-APP3_SEG*16), APP3_SEG
        db      0cbh
L_335A0:
        db      0a1h, 0e4h, 2bh, 8eh
        db      06h, 10h, 0fh, 26h, 3bh, 06h, 1ah, 00h
        jb      L_335B3
        db      26h, 0a1h, 1ah, 00h, 48h
L_335B3:
        db      0a3h
        db      0e4h, 2bh, 3bh, 06h, 0e6h, 2bh
        jb      L_335BF
        db      0a3h, 0e6h, 2bh
L_335BF:
        db      0cbh
far_335C0:
        call    L_32CDB
        mov     word ptr [C0_W_02B48], cb_32F10-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0e6h, 2bh, 0b3h, 01h, 0b7h, 00h, 0bah, 0e7h
        db      03h
        mov     di, far_335ED-APP3_CSBASE
        db      0cdh, 7eh
        KEY_CURSOR      0000h, 0000h, (C0_BASE+L_3365E-APP3_SEG*16), APP3_SEG, (C0_BASE+L_32735-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        else
        db      0cbh, 0e8h, 53h, 0fdh
        mov     word ptr [C0_W_02B48], cb_32F07-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0d4h, 2bh, 0b3h, 01h, 0b7h, 00h, 0bah, 0e7h, 03h
        db      0bfh, 0e2h, 0cdh, 0cdh, 7eh
        KEY_CURSOR      0000h, 0000h, EP_L_32D30_OFF, APP3_SEG, (C0_BASE+far_32F2B-APP3_SEG*16), APP3_SEG, (C0_BASE+far_335C0-APP3_SEG*16), APP3_SEG
        db      0cbh, 0a1h, 0d4h, 2bh, 8eh, 06h, 10h, 0fh, 26h
        db      3bh, 06h, 1ah, 00h, 72h, 05h, 26h, 0a1h, 1ah, 00h, 48h, 0a3h, 0d4h, 2bh, 3bh, 06h
far_335C0                       equ     $+8
        db      0d6h, 2bh, 72h, 03h, 0a3h, 0d6h, 2bh, 0cbh, 0e8h, 06h, 0fdh
        mov     word ptr [C0_W_02B48], cb_32F10-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0d6h, 2bh, 0b3h, 01h, 0b7h, 00h, 0bah, 0e7h, 03h, 0bfh, 2fh, 0ceh
        db      0cdh, 7eh
        KEY_CURSOR      0000h, 0000h, EP_L_3365E_OFF, APP3_SEG, (C0_BASE+L_33573-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        endif
        db      0cbh
far_335ED:
        mov     ax, word ptr [C0_W_02BE6]
        else
        db      0b1h, 3fh, 0b5h, 03h, 0b0h, 0dh, 0cdh, 0b0h, 0c3h
cb_32C0C_111:
        db      0b1h, 0beh, 0b5h, 03h, 0b0h, 0dh, 0cdh
        db      0b0h, 0c3h
cb_32C15_111:
        db      0b1h, 52h, 0b5h, 0eh, 0b0h, 13h, 0cdh, 0b0h, 0c3h
cb_32F10:
        db      0b1h, 52h, 0b5h, 24h, 0b0h
        db      13h, 0cdh, 0b0h, 0c3h
cb_32C27_111:
        db      0b1h, 0d6h, 0b5h, 0eh, 0b0h, 13h, 0cdh, 0b0h, 0c3h
cb_32C30:
        db      0b1h, 0d6h, 0b5h
far_32F2B                       equ     $+6
        db      24h, 0b0h, 13h, 0cdh, 0b0h, 0c3h, 0e8h, 0adh, 0fdh
        mov     word ptr [C0_W_02B48], cb_32EF5-APP3_CSBASE
        mov     cx, ds
        mov     si, 710h
        mov     bl, 1
        mov     bh, 0
        mov     dx, 63h
        mov     di, (C0_BASE+intcb_323A3_110-APP3_SEG*16)
        int     7eh
        KEY_CURSOR      0000h, 0000h, (C0_BASE+L_32C66-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_32C93-APP3_SEG*16), APP3_SEG
L_32C66                         equ     $+1
        retf
        call    L_32CDB
        mov     word ptr [C0_W_02B48], cb_32C0C_111-APP3_CSBASE
        mov     cx, ds
        mov     si, 2b40h
        mov     bl, 1
        mov     bh, 0
        mov     dx, 63h
        mov     di, (C0_BASE+L_3244A-APP3_SEG*16)
        int     7eh
        KEY_CURSOR      EP_FAR_32F2B_OFF, APP3_SEG, EP_L_32D30_OFF, APP3_SEG, 0000h, 0000h, EP_L_32D30_OFF, APP3_SEG
        db      0cbh
L_32C93:
        db      0e8h, 53h, 0fdh
        mov     word ptr [C0_W_02B48], cb_32C15_111-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0d4h, 2bh, 0b3h, 01h
        if      FW_VERSION >= 111
        db      0b7h, 00h, 0bah, 0e7h, 03h, 0bfh, 0e0h, 0cdh, 0cdh, 7eh
        else
        db      0b7h, 00h, 0bah, 0e7h, 03h, 0bfh, 0d2h, 0cdh, 0cdh, 7eh
        endif
        KEY_CURSOR      0000h, 0000h, EP_L_32D30_OFF, APP3_SEG, EP_FAR_32F2B_OFF, APP3_SEG, (C0_BASE+L_32CE0-APP3_SEG*16), APP3_SEG
        db      0cbh, 0a1h, 0d4h, 2bh
        db      8eh, 06h, 10h, 0fh, 26h, 3bh, 06h, 1ah, 00h, 72h, 05h, 26h, 0a1h, 1ah, 00h, 48h
L_32CE0                         equ     $+0dh
        db      0a3h, 0d4h, 2bh, 3bh, 06h, 0d6h, 2bh, 72h, 03h, 0a3h, 0d6h, 2bh, 0cbh
far_335C0:
        db      0e8h, 06h, 0fdh
        mov     word ptr [C0_W_02B48], cb_32F10-APP3_CSBASE
        mov     cx, ds
        mov     si, 2bd6h
        mov     bl, 1
        mov     bh, 0
        mov     dx, 3e7h
        mov     di, (C0_BASE+far_335ED-APP3_SEG*16)
        int     7eh
        KEY_CURSOR      0000h, 0000h, EP_L_3365E_OFF, APP3_SEG, (C0_BASE+L_32C93-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        retf
far_335ED:
        mov     ax, word ptr [C0_W_02BD6]
        endif
        else
        db      0ffh, 16h, 38h, 2bh, 0cbh, 0b1h, 3fh, 0b5h, 03h, 0b0h, 0dh, 0cdh, 0b0h, 0c3h
        DISP_CURSOR     0beh, 3, 0dh
        ret
        DISP_CURSOR     52h, 0eh, 13h
        ret
        DISP_CURSOR     52h, 24h, 13h
        ret
        DISP_CURSOR     0d6h, 0eh, 13h
        ret
        DISP_CURSOR     0d6h, 24h, 13h
        ret
far_32F2B:
        call    L_32CDB
        db      0c7h, 06h, 38h, 2bh, 0e5h, 0cch, 8ch, 0d9h, 0beh, 10h, 07h, 0b3h, 01h, 0b7h, 00h, 0bah
        db      63h, 00h, 0bfh, 0a3h, 0c4h, 0cdh, 7eh
        KEY_CURSOR      0000h, 0000h, (C0_BASE+L_32C93-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_32735-APP3_SEG*16), APP3_SEG
        db      0cbh
L_32C93:
        db      0e8h, 80h, 0fdh, 0c7h, 06h, 38h
        db      2bh, 0eeh, 0cch, 8ch, 0d9h, 0beh, 40h, 2bh, 0b3h, 01h, 0b7h, 00h, 0bah, 63h, 00h, 0bfh
        db      2ch, 0c5h, 0cdh, 7eh
        KEY_CURSOR      (C0_BASE+far_32F2B-APP3_SEG*16), APP3_SEG, (C0_BASE+L_33610-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_33610-APP3_SEG*16), APP3_SEG
        db      0cbh
L_32735:
        db      0e8h, 53h, 0fdh, 0c7h, 06h, 38h, 2bh, 0f7h, 0cch
        db      8ch, 0d9h, 0beh, 0d4h, 2bh, 0b3h, 01h, 0b7h, 00h, 0bah, 0e7h, 03h, 0bfh, 0a2h, 0cdh, 0cdh
        db      7eh
        KEY_CURSOR      0000h, 0000h, (C0_BASE+L_33610-APP3_SEG*16), APP3_SEG, (C0_BASE+far_32F2B-APP3_SEG*16), APP3_SEG, (C0_BASE+L_32782-APP3_SEG*16), APP3_SEG
        db      0cbh, 0a1h, 0d4h, 2bh, 8eh, 06h, 10h, 0fh, 26h, 3bh, 06h, 1ah, 00h
        db      72h, 05h, 26h, 0a1h, 1ah, 00h, 48h, 0a3h, 0d4h, 2bh, 3bh, 06h, 0d6h, 2bh, 72h, 03h
        db      0a3h, 0d6h, 2bh, 0cbh
L_32782:
        db      0e8h, 06h, 0fdh, 0c7h, 06h, 38h, 2bh, 00h, 0cdh, 8ch, 0d9h, 0beh
        db      0d6h, 2bh, 0b3h, 01h, 0b7h, 00h, 0bah, 0e7h, 03h, 0bfh, 0efh, 0cdh, 0cdh, 7eh
        KEY_CURSOR      0000h, 0000h, (C0_BASE+L_3365E-APP3_SEG*16), APP3_SEG, (C0_BASE+L_32735-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      0cbh
far_335ED:
        mov     ax, word ptr [C0_W_02BD6]
        endif
        mov     es, word ptr [A2_W_SEQ_SEG]
        cmp     ax, word ptr es:[1ah]
        jb      br_33600
        mov     ax, word ptr es:[1ah]
        dec     ax
br_33600:
        mov     word ptr [C0_W_02BE6], ax
        cmp     ax, word ptr [C0_W_02BE4]
        ja      br_3360C
        mov     word ptr [C0_W_02BE4], ax
br_3360C:
        mov     word ptr [C0_W_02BE6], ax
        retf
L_33610:
        if      FW_VERSION >= 112
        call    L_32CDB
        mov     word ptr [C0_W_02B48], L_33507-APP3_CSBASE
        FIELD_ENTRY     ds, C0_W_02BE8, 0, 0, 3e7h, far_3363D-APP3_CSBASE
        KEY_CURSOR      (C0_BASE+L_33573-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_33546-APP3_SEG*16), APP3_SEG, EP_L_3365E_OFF, APP3_SEG
        retf
far_3363D:
        mov     ax, word ptr [C0_W_02BE8]
        else
        if      FW_VERSION >= 110
        db      0e8h, 0b6h, 0fch
        mov     word ptr [C0_W_02B48], cb_32C27_111-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0d8h, 2bh, 0b3h, 00h
        if      FW_VERSION >= 111
        db      0b7h, 00h, 0bah, 0e7h, 03h, 0bfh, 7dh, 0ceh, 0cdh, 7eh
        else
        db      0b7h, 00h, 0bah, 0e7h, 03h, 0bfh, 6fh, 0ceh, 0cdh, 7eh
        endif
        KEY_CURSOR      (C0_BASE+L_32C93-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_32C66-APP3_SEG*16), APP3_SEG, EP_L_3365E_OFF, APP3_SEG
        db      0cbh
        else
        call    L_32CDB
        mov     word ptr [C0_W_02B48], P_CD33
        FIELD_ENTRY     ds, 2bd8h, 0, 0, 3e7h, far_3363D-APP3_CSBASE
        KEY_CURSOR      (C0_BASE+L_32735-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_32C93-APP3_SEG*16), APP3_SEG, (C0_BASE+L_3365E-APP3_SEG*16), APP3_SEG
        retf
        endif
far_3363D:
        mov     ax, word ptr [C0_W_02BD8]
        endif
        mov     bx, 0f800h
        mov     es, bx
        cmp     ax, word ptr es:[1ah]
        jb      br_33650
        mov     ax, word ptr es:[1ah]
br_33650:
        cmp     byte ptr es:[12h], 0
        jne     br_3365A
        sub     ax, ax
br_3365A:
        mov     word ptr [C0_W_02BE8], ax
        retf
L_3365E:
        if      FW_VERSION >= 111
        if      FW_VERSION >= 114
        call    L_32CDB
        mov     word ptr [C0_W_02B48], cb_32C30-APP3_CSBASE
        FIELD_ENTRY     ds, EP_L_252A4_OFF, 1, 0, 3e7h, (APP3_BASE+field_cb_none-APP3_SEG*16)
        KEY_CURSOR      (C0_BASE+far_335C0-APP3_SEG*16), APP3_SEG, 0000h, 0000h, EP_L_32D30_OFF, APP3_SEG, 0000h, 0000h
        db      0cbh
L_3368B:
        if      FW_VERSION >= 120
        call    APP3_BASE+fn_28233-SEGBASE
        db      75h, 01h, 0cbh, 0a1h, 0e6h, 2bh, 2bh, 06h, 0e4h, 2bh, 40h, 8bh, 1eh, 54h, 2bh
        else
        call    EP_FN_28233_OFF+APP3_CSBASE
        jne     L_330A3
        retf
L_330A3:
        mov     ax, word ptr [C0_W_02BE6]
        sub     ax, word ptr [C0_W_02BE4]
        inc     ax
        mov     bx, word ptr [C0_W_02B44_2]
        endif
        inc     bx
        mul     bx
        mov     bx, 0f800h
        mov     es, bx
        add     ax, word ptr es:[1ah]
        cmp     ax, 3e8h
        jb      L_330C4
        jmp     L_33154
L_330C4:
        int     0b4h
        mov     al, 0
        int     0dch
        call    L_32B1C
        mov     byte ptr [A2_B_00F2E], 1
        push    word ptr [A2_W_CUR_SEQ]
        mov     ax, word ptr [C0_W_02B50]
        mov     word ptr [A2_W_CUR_SEQ], ax
        call    fn_3404B
        if      FW_VERSION >= 120
        call    APP3_BASE+fn_28233-SEGBASE
        jne     L_336FA
        call    APP3_BASE+fn_28260-SEGBASE
        db      8eh, 06h, 10h, 0fh, 26h, 0c7h, 06h, 1ch, 00h
        db      00h, 00h, 26h, 0c7h, 06h, 1eh, 00h, 00h, 00h, 26h, 0c7h, 06h, 1ah, 00h, 00h, 00h
        db      26h, 0c7h, 06h, 14h, 00h, 00h, 00h, 0c6h, 06h, 2eh, 0fh, 00h
L_336FA:
        db      58h, 50h, 0cdh, 0d9h
        db      0a1h, 0e4h, 2bh, 8bh, 1eh, 0e6h, 2bh, 8bh, 0eh, 0e8h, 2bh, 8bh, 16h, 54h, 2bh, 42h
        else
        call    EP_FN_28233_OFF+APP3_CSBASE
        jne     L_3310C
        call    EP_FN_28260_OFF+APP3_CSBASE
        mov     es, word ptr [A2_W_SEQ_SEG]
        mov     word ptr es:[1ch], 0
        mov     word ptr es:[1eh], 0
        mov     word ptr es:[1ah], 0
        mov     word ptr es:[14h], 0
        mov     byte ptr [A2_B_00F2E], 0
L_3310C:
        pop     ax
        push    ax
        int     0d9h
        mov     ax, word ptr [C0_W_02BE4]
        mov     bx, word ptr [C0_W_02BE6]
        mov     cx, word ptr [C0_W_02BE8]
        mov     dx, word ptr [C0_W_02B44_2]
        inc     dx
        endif
        else
        db      0e8h, 68h, 0fch
        mov     word ptr [C0_W_02B48], cb_32C30-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 44h, 2bh, 0b3h, 01h
        db      0b7h, 00h, 0bah, 0e7h, 03h, 0bfh, 0dch, 18h, 0cdh, 7eh
        KEY_CURSOR      (C0_BASE+far_335C0-APP3_SEG*16), APP3_SEG, 0000h, 0000h, EP_L_32D30_OFF, APP3_SEG, 0000h, 0000h
        if      FW_VERSION >= 112
        db      0cbh
L_3368B:
        db      0e8h, 0b3h, 4bh
        else
L_3368B                         equ     $+1
        db      0cbh, 0e8h, 0b5h, 4bh
        endif
        db      75h, 01h, 0cbh, 0a1h, 0d6h, 2bh, 2bh, 06h, 0d4h, 2bh, 40h, 8bh, 1eh, 44h, 2bh, 43h ; u....++..+@..D+C
        db      0f7h, 0e3h, 0bbh, 00h, 0f8h, 8eh, 0c3h, 26h, 03h, 06h, 1ah, 00h, 3dh, 0e8h, 03h, 72h
        db      03h, 0e9h, 90h, 00h, 0cdh, 0b4h, 0b0h, 00h, 0cdh, 0dch, 0e8h, 4fh, 0fah, 0c6h, 06h, 2eh
        db      0fh, 01h, 0ffh, 36h, 10h, 07h, 0a1h, 40h, 2bh, 0a3h, 10h, 07h, 0e8h, 7eh, 09h, 0e8h
        if      FW_VERSION >= 112
        db      "qKu(", 0e8h, 099h, 04bh, 08eh, 006h, 010h, 00fh, 026h, 0c7h, 006h, 01ch, 000h
        else
        db      "sKu(", 0e8h, 09bh, 04bh, 08eh, 006h, 010h, 00fh, 026h, 0c7h, 006h, 01ch, 000h
        endif
        db      00h, 00h, 26h, 0c7h, 06h, 1eh, 00h, 00h, 00h, 26h, 0c7h, 06h, 1ah, 00h, 00h, 00h
        db      26h, 0c7h, 06h, 14h, 00h, 00h, 00h, 0c6h, 06h, 2eh, 0fh, 00h, 58h, 50h, 0cdh, 0d9h
        db      0a1h, 0d4h, 2bh, 8bh, 1eh, 0d6h, 2bh, 8bh, 0eh, 0d8h, 2bh, 8bh, 16h, 44h, 2bh, 42h
        endif
        else
        if      FW_VERSION >= 110
        db      0e8h, 68h, 0fch
        mov     word ptr [C0_W_02B48], cb_32C30-APP3_CSBASE
        mov     cx, ds
        mov     si, 2b44h
        mov     bl, 1
        mov     bh, 0
        mov     dx, 3e7h
        mov     di, 18cfh
        int     7eh
        KEY_CURSOR      (C0_BASE+far_335C0-APP3_SEG*16), APP3_SEG, 0000h, 0000h, EP_L_32D30_OFF, APP3_SEG, 0000h, 0000h
L_3368B                         equ     $+1
        db      0cbh, 0e8h, 0b6h, 4bh
        db      75h, 01h, 0cbh, 0a1h, 0d6h, 2bh, 2bh, 06h, 0d4h, 2bh, 40h, 8bh, 1eh, 44h, 2bh, 43h ; u....++..+@..D+C
        db      0f7h, 0e3h, 0bbh, 00h, 0f8h, 8eh, 0c3h, 26h, 03h, 06h, 1ah, 00h, 3dh, 0e8h, 03h, 72h
        db      03h, 0e9h, 90h, 00h, 0cdh, 0b4h, 0b0h, 00h, 0cdh, 0dch, 0e8h, 4fh, 0fah, 0c6h, 06h, 2eh
        db      0fh, 01h, 0ffh, 36h, 10h, 07h, 0a1h, 40h, 2bh, 0a3h, 10h, 07h, 0e8h, 7eh, 09h, 0e8h
        db      74h, 4bh, 75h, 28h, 0e8h, 9ch, 4bh, 8eh, 06h, 10h, 0fh, 26h, 0c7h, 06h, 1ch, 00h
        db      00h, 00h, 26h, 0c7h, 06h, 1eh, 00h, 00h, 00h, 26h, 0c7h, 06h, 1ah, 00h, 00h, 00h
        db      26h, 0c7h, 06h, 14h, 00h, 00h, 00h, 0c6h, 06h, 2eh, 0fh, 00h, 58h, 50h, 0cdh, 0d9h
        db      0a1h, 0d4h, 2bh, 8bh, 1eh, 0d6h, 2bh, 8bh, 0eh, 0d8h, 2bh, 8bh, 16h, 44h, 2bh, 42h
        else
        call    L_32CDB
        mov     word ptr [C0_W_02B48], 0cd12h
        FIELD_ENTRY     ds, 2b44h, 1, 0, 3e7h, (APP3_BASE+field_cb_none-APP3_SEG*16)
        KEY_CURSOR      (C0_BASE+L_32782-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_33610-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        retf
L_3368B:
        call    EP_FN_28233_OFF+APP3_CSBASE
        jne     L_330A3
        retf
L_330A3:
        mov     ax, word ptr [C0_W_02BE6]
        sub     ax, word ptr [C0_W_02BE4]
        inc     ax
        mov     bx, word ptr [C0_W_02B44_2]
        inc     bx
        mul     bx
        mov     bx, 0f800h
        mov     es, bx
        add     ax, word ptr es:[1ah]
        cmp     ax, 3e8h
        jb      L_330C4
        jmp     L_33154
L_330C4:
        int     0b4h
        mov     al, 0
        int     0dch
        call    L_32B1C
        mov     byte ptr [A2_B_00F2E], 1
        push    word ptr [A2_W_CUR_SEQ]
        mov     ax, word ptr [C0_W_02B50]
        mov     word ptr [A2_W_CUR_SEQ], ax
        call    fn_3404B
        call    EP_FN_28233_OFF+APP3_CSBASE
        jne     L_3310C
        call    EP_FN_28260_OFF+APP3_CSBASE
        mov     es, word ptr [A2_W_SEQ_SEG]
        mov     word ptr es:[1ch], 0
        mov     word ptr es:[1eh], 0
        mov     word ptr es:[1ah], 0
        mov     word ptr es:[14h], 0
        mov     byte ptr [A2_B_00F2E], 0
L_3310C:
        pop     ax
        push    ax
        int     0d9h
        mov     ax, word ptr [C0_W_02BE4]
        mov     bx, word ptr [C0_W_02BE6]
        mov     cx, word ptr [C0_W_02BE8]
        mov     dx, word ptr [C0_W_02B44_2]
        inc     dx
        endif
        endif
        db      0cdh, 0eeh, 5bh
        jb      L_3372E
        db      0a1h, 10h, 07h, 0cdh, 0d8h, 0a1h, 1ah, 07h, 0cdh, 0d9h, 0cdh
        db      0d6h
        DISP_PLANE0
        int     0a5h
        mov     al, 1
        int     0dch
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        db      0cbh
L_3372E:
        mov     word ptr [A2_W_CUR_SEQ], bx
        mov     al, 19h
        int     95h
        int     0a5h
        mov     al, 1
        int     0dch
        mov     byte ptr [A2_B_00F2E], 0
        retf
L_33154:
        mov     ax, 32h
        int     95h
        mov     byte ptr [A2_B_00F2E], 0
        int     0a5h
        mov     al, 1
        int     0dch
        retf
far_33753:
        cmp     word ptr [C0_W_02BEC], 40h
        jb      br_33760
        mov     word ptr [C0_W_02BEC], 3fh
br_33760:
        mov     ax, word ptr [A2_W_CUR_SEQ]
        call    fn_3404B
        mov     word ptr [A2_W_SEQ_SEG], 8000h
        mov     word ptr [C0_W_02B40], far_33753-APP3_CSBASE
        mov     word ptr [P_2BEA], cb_33827-APP3_CSBASE
        int     0a4h
        FIELD_ENTRY     ds, 710h, 1, 0, 63h, (APP3_BASE+L_27146-APP3_SEG*16)
        if      FW_VERSION >= 112
        if      FW_VERSION >= 114
        KEY_CURSOR      0000h, 0000h, L_33105-APP3_CSBASE, APP3_SEG, 0000h, 0000h, L_33105-APP3_CSBASE, APP3_SEG
        else
        KEY_CURSOR      0000h, 0000h, (C0_BASE+L_33105-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_33105-APP3_SEG*16), APP3_SEG
        endif
        KEY_SOFT        EP_FAR_32782_OFF, EP_FAR_32782_SEG, EP_L_32CC6_OFF, EP_L_32CC6_SEG, 0000h, 0000h, EP_L_33312_OFF, APP3_SEG, 0000h, 0000h, 0000h, 0000h
        KEY_DOWN        20h, EP_L_337D0_OFF, APP3_SEG
        else
        KEY_CURSOR      0000h, 0000h, (C0_BASE+L_33105-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_33105-APP3_SEG*16), APP3_SEG
        KEY_SOFT        EP_FAR_32782_OFF, APP3_SEG, EP_L_32CC6_OFF, EP_L_32CC6_SEG, 0000h, 0000h, EP_L_33312_OFF, APP3_SEG, 0000h, 0000h, 0000h, 0000h
        KEY_DOWN        20h, EP_L_337D0_OFF, APP3_SEG
        endif
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        26h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        retf
far_32FF2:
        call    L_33257
        DISP_TEXT       16h, 14h, "Select track"
        DISP_TEXT       16h, 1eh, "to move."
        db      0e8h
        cbw
        db      00h
        if      FW_VERSION < 120
        DISP_SOFTKEY    01h, DISP_SK_FILL,   "EVENTS"
        endif
        if      FW_VERSION >= 120
        DISP_SOFTKEY    01h, DISP_SK_FILL,   "EVENTS"
        endif
        DISP_SOFTKEY    02h, DISP_SK_FILL,   "BARS"
        DISP_SOFTKEY    03h, DISP_SK_PLAIN, "TrMOVE"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "USER"
        call    word ptr [P_2BEA]
        retf
cb_33827:
        DISP_CURSOR     14h, 2, 0dh
        ret
cb_33830:
        mov     cl, 6ch
        mov     ch, 1ah
        mov     al, 72h
        int     0b0h
        DISP_SOFTKEY    06h, DISP_SK_BOX,    "SELECT"
        ret
L_33257:
        DISP_CLEAR
        DISP_HLINE      00h, 00h, 8bh
        if      FW_VERSION >= 114
        DISP_HDOTS      00h, 0ah, 8bh
        endif
        if      FW_VERSION < 114
        DISP_HDOTS      00h, 0ah, 8bh
        endif
        DISP_HLINE      8ah, 0ah, 6dh
        DISP_HLINE      00h, 30h, 0f8h
        DISP_HLINE      01h, 31h, 0f7h
        DISP_VLINE      00h, 00h, 30h
        DISP_VLINE      8bh, 00h, 0bh
        DISP_VLINE      8ch, 01h, 0ah
        DISP_VLINE      0f6h, 0ah, 26h
        DISP_VLINE      0f7h, 0bh, 25h
        DISP_VDOTS      66h, 0ah, 25h
        if      FW_VERSION >= 112
        if      FW_VERSION >= 120
        db      0e8h, 0afh, 31h, 0c3h, 0a1h, 0ech, 2bh, 3ch, 00h, 74h, 18h, 3ch, 3fh, 74h, 20h, 0feh ; ..1...+<.t.<?t .
        else
        if      FW_VERSION >= 114
far_33276                       equ     $+01cah
        endif
        db      0e8h, 0bdh, 31h, 0c3h, 0a1h, 0dch, 2bh, 3ch, 00h, 74h, 18h, 3ch, 3fh, 74h, 20h, 0feh ; ..1...+<.t.<?t .
        endif
        db      0c8h, 0b5h, 10h, 0e8h, 27h, 00h, 0b5h, 1ah, 40h
        call    L_338C7
        db      0b5h, 24h, 40h
        call    L_338C7
        db      0c3h, 0b5h, 1ah
        call    L_338C7
        db      0b5h, 24h, 40h
        call    L_338C7
        db      0c3h, 0feh
        db      0c8h, 0b5h, 10h, 0e8h, 07h, 00h, 0b5h, 1ah, 40h, 0e8h, 01h, 00h, 0c3h
L_338C7:
        db      50h, 51h, 0b1h
        if      FW_VERSION >= 120
        db      6ch, 0beh, 30h, 0d1h, 8ch, 0cah, 0b4h, 03h, 0b3h, 05h, 0cdh, 90h, 0b4h, 00h, 0b1h, 7eh
        else
        db      6ch, 0beh, 22h, 0d1h, 8ch, 0cah, 0b4h, 03h, 0b3h, 05h, 0cdh, 90h, 0b4h, 00h, 0b1h, 7eh
        endif
        db      0e8h
        if      FW_VERSION >= 120
        db      "EGYX"
        else
        db      "SGYX"
        endif
        db      0c3h, 54h, 72h, 3ah
L_33105:
        mov     word ptr [P_2BEA], cb_33830-APP3_CSBASE
        KEY_CURSOR      EP_FAR_33753_OFF, APP3_SEG, 0000h, 0000h, (C0_BASE+FAR_33954-APP3_SEG*16), APP3_SEG, (C0_BASE+L_33947-APP3_SEG*16), APP3_SEG
        KEY_SOFT        EP_FAR_32782_OFF, EP_FAR_32782_SEG, EP_L_32CC6_OFF, EP_L_32CC6_SEG, 0000h, 0000h, EP_L_33312_OFF, APP3_SEG, 0000h, 0000h, 0000h, 0000h
        if      FW_VERSION >= 120
        db      8ch, 0d9h, 0beh, 0ech, 2bh
        db      0b3h, 00h, 0b7h, 00h, 0bah, 3fh, 00h
        mov     di, (APP3_BASE+field_cb_none-APP3_SEG*16)
        db      0cdh, 7eh
        else
        db      8ch, 0d9h, 0beh, 0dch, 2bh
        db      0b3h, 00h, 0b7h, 00h, 0bah, 3fh, 00h, 0bfh, 0dch, 18h, 0cdh, 7eh
        endif
        KEY_DOWN        15h, (C0_BASE+FAR_33961-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, (C0_BASE+FAR_32FF2-APP3_SEG*16), APP3_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        26h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
L_33947                         equ     $+1
        if      FW_VERSION >= 120
        db      0cbh, 83h, 3eh, 0ech
        db      2bh, 3fh, 75h, 01h, 0cbh, 0ffh, 06h, 0ech, 2bh, 0cbh
far_33954:
        db      83h, 3eh, 0ech, 2bh, 00h, 75h
        db      01h, 0cbh, 0ffh, 0eh, 0ech, 2bh, 0cbh
far_33961:
        db      0a1h, 0ech, 2bh, 0a3h, 0eeh, 2bh, 0ffh, 06h, 0ech
        db      2bh, 0cdh, 0a4h
        KEY_WHEEL2      (C0_BASE+L_33133-APP3_SEG*16), APP3_SEG, (C0_BASE+FAR_33A54-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (C0_BASE+L_33133-APP3_SEG*16), APP3_SEG, (C0_BASE+FAR_33A54-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (C0_BASE+L_339A2-APP3_SEG*16), APP3_SEG
        KEY_DOWN        15h, (C0_BASE+L_33A72-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, (C0_BASE+L_339B2-APP3_SEG*16), APP3_SEG
        db      0cbh
L_339A2:
        db      83h, 3eh, 0ech, 2bh, 00h
        je      L_339AD
        db      0ffh
        db      0eh, 0ech, 2bh
L_339AD:
        db      0eh
        call    L_33105
        db      0cbh
L_339B2:
        call    L_33257
        else
        db      0cbh, 83h, 3eh, 0dch
far_33954                       equ     $+0ah
        db      2bh, 3fh, 75h, 01h, 0cbh, 0ffh, 06h, 0dch, 2bh, 0cbh, 83h, 3eh, 0dch, 2bh, 00h, 75h
FAR_33961                       equ     $+7
        db      01h, 0cbh, 0ffh, 0eh, 0dch, 2bh, 0cbh, 0a1h, 0dch, 2bh, 0a3h, 0deh, 2bh, 0ffh, 06h, 0dch
        db      2bh, 0cdh, 0a4h
        KEY_WHEEL2      (C0_BASE+L_33133-APP3_SEG*16), APP3_SEG, (C0_BASE+FAR_33276-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (C0_BASE+L_33133-APP3_SEG*16), APP3_SEG, (C0_BASE+FAR_33276-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (C0_BASE+L_330A4-APP3_SEG*16), APP3_SEG
        KEY_DOWN        15h, (C0_BASE+L_33A72-APP3_SEG*16), APP3_SEG
        if      FW_VERSION < 114
        KEY_DOWN        20h, (C0_BASE+L_331D4-APP3_SEG*16), APP3_SEG
        else
        KEY_DOWN        20h, (C0_BASE+L_330B4-APP3_SEG*16), APP3_SEG
        endif
        db      0cbh
L_330A4:
        db      83h, 3eh, 0dch, 2bh, 00h, 74h, 04h, 0ffh
        if      FW_VERSION < 114
L_331D4                         equ     $+8
        endif
        db      0eh, 0dch, 2bh, 0eh, 0e8h, 32h, 0ffh, 0cbh
L_330B4:
        db      0e8h, 90h, 0feh
        endif
        DISP_TEXT       0ah, 1ah, "Tr:"
        if      FW_VERSION >= 120
        db      0a1h, 0eeh, 2bh, 0b1h, 1ch, 0b5h, 1ah
        call    APP3_BASE+fn_28022-SEGBASE
        db      0e8h, 21h
        else
        db      0a1h, 0deh, 2bh, 0b1h, 1ch, 0b5h, 1ah, 0e8h, 68h, 46h, 0e8h, 21h
        endif
        else
        if      FW_VERSION >= 110
        if      FW_VERSION >= 111
        db      0e8h, 0bfh, 31h, 0c3h
        else
        db      0e8h, 0cdh, 31h, 0c3h
        endif
        db      0a1h, 0dch, 2bh, 3ch, 00h, 74h, 18h, 3ch, 3fh, 74h, 20h, 0feh, 0c8h, 0b5h, 10h, 0e8h
        db      27h, 00h, 0b5h, 1ah, 40h, 0e8h, 21h, 00h, 0b5h, 24h, 40h, 0e8h, 1bh, 00h, 0c3h, 0b5h
        db      1ah, 0e8h, 15h, 00h, 0b5h, 24h, 40h, 0e8h, 0fh, 00h, 0c3h, 0feh, 0c8h, 0b5h, 10h, 0e8h
        if      FW_VERSION >= 111
        db      07h, 00h, 0b5h, 1ah, 40h, 0e8h, 01h, 00h, 0c3h, 50h, 51h, 0b1h, 6ch, 0beh, 20h, 0d1h
        db      8ch, 0cah, 0b4h, 03h, 0b3h, 05h, 0cdh, 90h, 0b4h, 00h, 0b1h, 7eh, 0e8h, 55h, 47h, 59h
        else
        db      07h, 00h, 0b5h, 1ah, 40h, 0e8h, 01h, 00h, 0c3h, 50h, 51h, 0b1h, 6ch, 0beh, 12h, 0d1h
        db      8ch, 0cah, 0b4h, 03h, 0b3h, 05h, 0cdh, 90h, 0b4h, 00h, 0b1h, 7eh, 0e8h, 56h, 47h, 59h
        endif
        db      58h, 0c3h, 54h, 72h, 3ah
L_33105:
        mov     word ptr [P_2BEA], cb_33830-APP3_CSBASE
        KEY_CURSOR      EP_FAR_33753_OFF, APP3_SEG, 0000h, 0000h, (C0_BASE+L_33074-APP3_SEG*16), APP3_SEG, (C0_BASE+L_33067-APP3_SEG*16), APP3_SEG
        KEY_SOFT        EP_FAR_32782_OFF, APP3_SEG, EP_L_32CC6_OFF, EP_L_32CC6_SEG, 0000h, 0000h, EP_L_33312_OFF, APP3_SEG, 0000h, 0000h, 0000h, 0000h
        db      8ch, 0d9h, 0beh, 0dch, 2bh, 0b3h, 00h, 0b7h, 00h
        if      FW_VERSION >= 111
        db      0bah, 3fh, 00h, 0bfh, 0dch, 18h, 0cdh, 7eh
        else
        db      0bah, 3fh, 00h, 0bfh, 0cfh, 18h, 0cdh, 7eh
        endif
        else
        db      0e8h, 0fdh, 31h, 0c3h, 0a1h, 0dch, 2bh, 3ch, 00h, 74h, 18h, 3ch, 3fh, 74h, 20h, 0feh ; ..1...+<.t.<?t .
        db      0c8h, 0b5h, 10h, 0e8h, 27h, 00h, 0b5h, 1ah, 40h, 0e8h, 21h, 00h, 0b5h, 24h, 40h, 0e8h
        db      1bh, 00h, 0c3h, 0b5h, 1ah, 0e8h, 15h, 00h, 0b5h, 24h, 40h, 0e8h, 0fh, 00h, 0c3h, 0feh
        db      0c8h, 0b5h, 10h, 0e8h, 07h, 00h, 0b5h, 1ah, 40h, 0e8h, 01h, 00h, 0c3h, 50h, 51h, 0b1h
        db      6ch, 0beh, 0e2h, 0d0h, 8ch, 0cah, 0b4h, 03h, 0b3h, 05h, 0cdh, 90h, 0b4h, 00h, 0b1h, 7eh
        db      0e8h
        db      "wGYX"
        db      0c3h, 54h, 72h, 3ah
L_33105:
        mov     word ptr [P_2BEA], cb_33830-APP3_CSBASE
        KEY_CURSOR      EP_FAR_33753_OFF, APP3_SEG, 0000h, 0000h, (C0_BASE+FAR_32B16-APP3_SEG*16), APP3_SEG, (C0_BASE+L_32B09-APP3_SEG*16), APP3_SEG
        KEY_SOFT        EP_FAR_32782_OFF, EP_FAR_32782_SEG, EP_L_32CC6_OFF, EP_L_32CC6_SEG, 0000h, 0000h, EP_L_33312_OFF, APP3_SEG, 0000h, 0000h, 0000h, 0000h
        db      8ch, 0d9h, 0beh, 0dch, 2bh
        db      0b3h, 00h, 0b7h, 00h, 0bah, 3fh, 00h, 0bfh, 0c0h, 18h, 0cdh, 7eh
        endif
        KEY_DOWN        15h, (C0_BASE+L_33063-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, EP_L_337D0_OFF, APP3_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        26h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        if      FW_VERSION >= 110
L_33067                         equ     $+1
        db      0cbh, 83h, 3eh, 0dch, 2bh, 3fh, 75h, 01h
L_33074                         equ     $+6
        db      0cbh, 0ffh, 06h, 0dch, 2bh, 0cbh, 83h, 3eh, 0dch, 2bh, 00h, 75h, 01h, 0cbh, 0ffh, 0eh
        db      0dch, 2bh, 0cbh
L_33063:
        db      0a1h, 0dch, 2bh, 0a3h, 0deh, 2bh, 0ffh, 06h, 0dch, 2bh, 0cdh, 0a4h
        KEY_WHEEL2      (C0_BASE+L_33133-APP3_SEG*16), APP3_SEG, (C0_BASE+L_33156-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (C0_BASE+L_33133-APP3_SEG*16), APP3_SEG, (C0_BASE+L_33156-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (C0_BASE+L_330A4-APP3_SEG*16), APP3_SEG
        KEY_DOWN        15h, (C0_BASE+L_33174-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, (C0_BASE+L_330B4-APP3_SEG*16), APP3_SEG
        else
        db      0cbh
L_32B09:
        db      83h, 3eh, 0dch
        db      2bh, 3fh, 75h, 01h, 0cbh, 0ffh, 06h, 0dch, 2bh, 0cbh
far_32B16:
        db      83h, 3eh, 0dch, 2bh, 00h, 75h
        db      01h, 0cbh, 0ffh, 0eh, 0dch, 2bh, 0cbh
L_33063:
        db      0a1h, 0dch, 2bh, 0a3h, 0deh, 2bh, 0ffh, 06h, 0dch
        db      2bh, 0cdh, 0a4h
        KEY_WHEEL2      (C0_BASE+L_33133-APP3_SEG*16), APP3_SEG, (C0_BASE+L_33156-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (C0_BASE+L_33133-APP3_SEG*16), APP3_SEG, (C0_BASE+L_33156-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (C0_BASE+L_330A4-APP3_SEG*16), APP3_SEG
        KEY_DOWN        15h, (C0_BASE+L_33174-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, (C0_BASE+L_32B74-APP3_SEG*16), APP3_SEG
        endif
        db      0cbh
L_330A4:
        db      83h, 3eh, 0dch, 2bh, 00h, 74h, 04h, 0ffh, 0eh, 0dch, 2bh, 0eh
        if      FW_VERSION < 110
L_32B74                         equ     $+4
        endif
        db      0e8h, 32h, 0ffh, 0cbh
L_330B4:
        db      0e8h, 90h, 0feh
        DISP_TEXT       0ah, 1ah, "Tr:"
        if      FW_VERSION >= 111
        db      0a1h, 0deh, 2bh, 0b1h, 1ch, 0b5h, 1ah, 0e8h, 6ah, 46h, 0e8h, 21h
        elseif  FW_VERSION >= 110
        db      0a1h, 0deh, 2bh, 0b1h, 1ch, 0b5h, 1ah, 0e8h, 6bh, 46h, 0e8h, 21h
        else
        db      0a1h, 0deh, 2bh, 0b1h, 1ch, 0b5h, 1ah, 0e8h, 8ch, 46h, 0e8h, 21h
        endif
        endif
        db      00h
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "CANCEL"
        DISP_SOFTKEY    06h, DISP_SK_FILL,   "INSERT"
        if      FW_VERSION >= 110
        if      FW_VERSION >= 112
        db      0b1h, 09h, 0b5h, 1ah, 0b0h, 73h, 0cdh
        if      FW_VERSION >= 120
        db      0b0h, 0cbh, 0a1h, 0ech, 2bh, 3ch, 00h, 74h, 27h, 3ch, 01h, 75h, 07h, 83h, 3eh, 0eeh
        db      2bh, 00h, 74h, 1ch, 3ch, 40h, 74h, 1eh, 0feh, 0c8h, 3bh, 06h, 0eeh, 2bh, 75h, 02h ; +.t.<@t...;..+u.
        db      0feh, 0c8h, 0b5h, 10h
        call    L_338C7
        db      0a1h, 0ech, 2bh, 0b5h, 24h
        call    L_338C7
        db      0c3h
        db      0b5h, 24h
        call    L_338C7
        db      0c3h, 0feh, 0c8h, 83h, 3eh, 0eeh, 2bh, 3fh, 75h, 02h, 0feh
        else
        db      0b0h, 0cbh, 0a1h, 0dch, 2bh, 3ch, 00h, 74h, 27h, 3ch, 01h, 75h, 07h, 83h, 3eh, 0deh
        db      2bh, 00h, 74h, 1ch, 3ch, 40h, 74h, 1eh, 0feh, 0c8h, 3bh, 06h, 0deh, 2bh, 75h, 02h ; +.t.<@t...;..+u.
        db      0feh, 0c8h, 0b5h, 10h, 0e8h, 0b6h, 0feh, 0a1h, 0dch, 2bh, 0b5h, 24h, 0e8h, 0aeh, 0feh, 0c3h
        db      0b5h, 24h, 0e8h, 0a8h, 0feh, 0c3h, 0feh, 0c8h, 83h, 3eh, 0deh, 2bh, 3fh, 75h, 02h, 0feh
        endif
        db      0c8h, 0b5h, 10h, 0e8h, 97h, 0feh, 0c3h
L_33133:
        if      FW_VERSION >= 120
        db      0a1h, 0ech, 2bh, 3dh, 00h, 00h, 75h, 01h, 0cbh, 48h, 74h, 0fh, 0a3h, 0ech, 2bh, 3bh
        db      06h, 0eeh, 2bh, 74h, 01h, 0cbh, 0ffh, 0eh, 0ech, 2bh, 0cbh, 83h, 3eh, 0eeh, 2bh, 00h
        else
        db      0a1h, 0dch, 2bh, 3dh, 00h, 00h, 75h, 01h, 0cbh, 48h, 74h, 0fh, 0a3h, 0dch, 2bh, 3bh
        db      06h, 0deh, 2bh, 74h, 01h, 0cbh, 0ffh, 0eh, 0dch, 2bh, 0cbh, 83h, 3eh, 0deh, 2bh, 00h
        endif
        db      75h, 0eah, 0cbh
far_33A54:
        if      FW_VERSION < 114
far_33276:
        endif
        if      FW_VERSION >= 120
        db      0a1h, 0ech
        else
        db      0a1h, 0dch
        endif
        db      "+<@u"
        if      FW_VERSION >= 120
        db      01h, 0cbh, 0feh, 0c0h, 0a3h, 0ech
        else
        db      01h, 0cbh, 0feh, 0c0h, 0a3h, 0dch
        endif
        db      "+<?u"
        if      FW_VERSION >= 120
        db      01h, 0cbh, 3bh, 06h, 0eeh, 2bh, 74h, 01h, 0cbh, 0ffh, 06h, 0ech, 2bh, 0cbh
        else
        db      01h, 0cbh, 3bh, 06h, 0deh, 2bh, 74h, 01h, 0cbh, 0ffh, 06h, 0dch, 2bh, 0cbh
        endif
L_33A72:
        if      FW_VERSION >= 120
        db      8eh, 06h, 10h, 0fh, 26h, 80h, 3eh, 12h, 00h, 00h, 74h, 2ch, 0a1h, 0ech, 2bh, 2dh
        db      01h, 00h, 73h, 03h, 0b8h, 00h, 00h, 3bh, 06h, 0eeh, 2bh, 74h, 1bh, 0ffh, 36h, 0ech
        else
        db      8eh, 06h, 10h, 0fh, 26h, 80h, 3eh, 12h, 00h, 00h, 74h, 2ch, 0a1h, 0dch, 2bh, 2dh
        db      01h, 00h, 73h, 03h, 0b8h, 00h, 00h, 3bh, 06h, 0deh, 2bh, 74h, 1bh, 0ffh, 36h, 0dch
        endif
        db      2bh, 0e8h, 19h, 00h, 0cdh, 0d6h, 0cdh, 0e6h
        db      0eh
        if      FW_VERSION >= 120
        call    L_339A2
        else
        db      0e8h, 04h, 0ffh
        endif
        db      58h, 3dh, 00h, 00h, 75h, 01h, 0cbh, 0eh
        call    L_33947
        db      0cbh
        if      FW_VERSION >= 120
        db      0eh
        call    L_339A2
        db      0cbh, 8ch, 0d8h, 8eh, 0c0h, 0bfh, 8dh, 34h, 0b0h, 00h, 0b1h, 40h
        db      57h, 0aah, 0feh, 0c0h, 0e2h, 0fbh, 5fh, 83h, 3eh, 0ech, 2bh, 00h, 74h, 2dh, 0ffh, 0eh
        db      0ech, 2bh, 8bh, 1eh, 0eeh, 2bh, 0a1h, 0ech, 2bh, 88h, 01h, 3ah, 0d8h, 72h, 10h, 0feh
        db      0c3h, 0ffh, 06h, 0ech, 2bh, 0feh, 0cbh, 3ah, 0c3h, 74h, 29h, 0feh, 01h, 0ebh, 0f6h, 0feh
        db      0c0h, 0feh, 0c3h, 3ah, 0d8h, 74h, 1dh, 0feh, 09h, 0ebh, 0f6h, 8bh, 1eh, 0eeh, 2bh, 0a1h
        db      0ech, 2bh, 88h, 01h, 3ah, 0d8h, 72h, 0e7h, 0feh, 0c8h, 0feh, 0cbh, 3ah, 0c3h, 74h, 04h
        else
        db      0eh, 0e8h, 0f4h, 0feh, 0cbh, 8ch, 0d8h, 8eh, 0c0h, 0bfh, 7dh, 34h, 0b0h, 00h, 0b1h, 40h
        db      57h, 0aah, 0feh, 0c0h, 0e2h, 0fbh, 5fh, 83h, 3eh, 0dch, 2bh, 00h, 74h, 2dh, 0ffh, 0eh
        db      0dch, 2bh, 8bh, 1eh, 0deh, 2bh, 0a1h, 0dch, 2bh, 88h, 01h, 3ah, 0d8h, 72h, 10h, 0feh
        db      0c3h, 0ffh, 06h, 0dch, 2bh, 0feh, 0cbh, 3ah, 0c3h, 74h, 29h, 0feh, 01h, 0ebh, 0f6h, 0feh
        db      0c0h, 0feh, 0c3h, 3ah, 0d8h, 74h, 1dh, 0feh, 09h, 0ebh, 0f6h, 8bh, 1eh, 0deh, 2bh, 0a1h
        db      0dch, 2bh, 88h, 01h, 3ah, 0d8h, 72h, 0e7h, 0feh, 0c8h, 0feh, 0cbh, 3ah, 0c3h, 74h, 04h
        endif
        db      0feh, 01h, 0ebh, 0f6h, 0cdh, 83h, 2bh, 0dbh
L_33B12:
        db      26h, 8ah, 4ch, 04h, 80h, 0f9h, 0ffh, 75h
        db      02h, 0ebh, 1ah, 26h, 8ah, 44h, 03h, 8ah, 0e0h, 25h, 0c0h, 3fh, 8ah, 0dch, 8ah, 0a7h
        if      FW_VERSION >= 120
        db      8dh, 34h, 0ah, 0c4h, 26h, 88h, 44h, 03h
        call    L_33BCA
        jmp     SHORT L_33B12
        db      0b8h, 0a0h, 0e2h
        else
        db      7dh, 34h, 0ah, 0c4h, 26h, 88h, 44h, 03h, 0e8h, 95h, 00h, 0ebh, 0dbh, 0b8h, 0a0h, 0e2h
        endif
        db      8eh, 0c0h, 0bfh, 00h, 00h, 1eh, 8eh, 1eh, 10h, 0fh, 0beh, 00h, 00h, 0b9h, 00h, 07h
        if      FW_VERSION >= 120
        db      0f3h, 0a4h, 1fh, 8eh, 06h, 10h, 0fh, 2bh, 0dbh, 2bh, 0c0h, 8ah, 87h, 8dh, 34h, 8bh
        else
        db      0f3h, 0a4h, 1fh, 8eh, 06h, 10h, 0fh, 2bh, 0dbh, 2bh, 0c0h, 8ah, 87h, 7dh, 34h, 8bh
        endif
        db      0f8h, 0c1h, 0e7h, 04h, 81h, 0c7h, 80h, 01h, 8bh, 0f3h, 0c1h, 0e6h, 04h, 81h, 0c6h, 80h
        db      01h, 1eh, 0b9h, 0a0h, 0e2h, 8eh, 0d9h, 0b9h, 10h, 00h, 0f3h, 0a4h, 1fh, 0feh, 0c3h, 80h
        db      0fbh, 40h, 75h, 0d7h, 0beh, 00h, 00h, 0bbh, 00h, 00h, 0bdh, 0a0h, 0e2h, 8eh, 0c5h, 26h
        db      8ah, 84h, 80h, 05h, 26h, 8ah, 0a4h, 0c0h, 05h, 26h, 8ah, 8ch, 00h, 06h, 26h, 8ah
        if      FW_VERSION >= 120
        db      0ach, 40h, 06h, 26h, 8ah, 94h, 80h, 06h, 8ah, 9ch, 8dh, 34h, 8eh, 06h, 10h, 0fh
        else
        db      0ach, 40h, 06h, 26h, 8ah, 94h, 80h, 06h, 8ah, 9ch, 7dh, 34h, 8eh, 06h, 10h, 0fh
        endif
        db      26h, 88h, 87h, 80h, 05h, 26h, 88h, 0a7h, 0c0h, 05h, 26h, 88h, 8fh, 00h, 06h, 26h
        db      88h, 0afh, 40h, 06h, 26h, 88h, 97h, 80h, 06h, 46h, 83h, 0feh, 40h, 75h, 0beh, 0c3h
L_33BCA:
        db      83h, 0c6h, 08h, 73h, 07h, 8ch, 0c0h, 05h, 00h, 10h, 8eh, 0c0h, 80h, 0f9h, 0f0h, 74h
        db      01h, 0c3h, 26h, 8ah, 4ch, 04h, 83h, 0c6h, 08h, 73h, 07h, 8ch, 0c0h, 05h, 00h, 10h
        db      8eh, 0c0h, 80h, 0f9h, 0f8h, 75h, 0ebh, 0c3h
L_33BF2:
        mov     word ptr [A3_W_00F10], 8000h
        mov     es, word ptr [A3_W_00F10]
        mov     di, 0
        mov     si, 10h
        mov     cx, 700h
        rep movsb
        mov     word ptr [A3_W_00712], 0
        mov     word ptr [C0_W_02B40], EP_L_33312_OFF
        push    cs
        call    fn_33E45
        retf
        else
        db      0b1h, 09h, 0b5h, 1ah, 0b0h, 73h, 0cdh, 0b0h, 0cbh, 0a1h, 0dch
        db      2bh, 3ch, 00h, 74h, 27h, 3ch, 01h, 75h, 07h, 83h, 3eh, 0deh, 2bh, 00h, 74h, 1ch ; +<.t'<.u..>.+.t.
        db      3ch, 40h, 74h, 1eh, 0feh, 0c8h, 3bh, 06h, 0deh, 2bh, 75h, 02h, 0feh, 0c8h, 0b5h, 10h
        db      0e8h, 0b6h, 0feh, 0a1h, 0dch, 2bh, 0b5h, 24h, 0e8h, 0aeh, 0feh, 0c3h, 0b5h, 24h, 0e8h, 0a8h
        db      0feh, 0c3h, 0feh, 0c8h, 83h, 3eh, 0deh, 2bh, 3fh, 75h, 02h, 0feh, 0c8h, 0b5h, 10h, 0e8h
        db      97h, 0feh, 0c3h
L_33133:
        db      0a1h, 0dch, 2bh, 3dh, 00h, 00h, 75h, 01h, 0cbh, 48h, 74h, 0fh, 0a3h
        db      0dch, 2bh, 3bh, 06h, 0deh, 2bh, 74h, 01h, 0cbh, 0ffh, 0eh, 0dch, 2bh, 0cbh, 83h, 3eh
        db      0deh, 2bh, 00h, 75h, 0eah, 0cbh
L_33156:
        db      0a1h, 0dch, 2bh, 3ch, 40h, 75h, 01h, 0cbh, 0feh, 0c0h
        db      0a3h, 0dch, 2bh, 3ch, 3fh, 75h, 01h, 0cbh, 3bh, 06h, 0deh, 2bh, 74h, 01h, 0cbh, 0ffh
        db      06h, 0dch, 2bh, 0cbh
L_33174:
        db      8eh, 06h, 10h, 0fh, 26h, 80h, 3eh, 12h, 00h, 00h, 74h, 2ch
        db      0a1h, 0dch, 2bh, 2dh, 01h, 00h, 73h, 03h, 0b8h, 00h, 00h, 3bh, 06h, 0deh, 2bh, 74h
        db      1bh, 0ffh, 36h, 0dch, 2bh, 0e8h, 19h, 00h, 0cdh, 0d6h, 0cdh, 0e6h, 0eh, 0e8h, 04h, 0ffh
        db      58h, 3dh, 00h, 00h, 75h, 01h, 0cbh, 0eh, 0e8h, 9eh, 0feh, 0cbh, 0eh, 0e8h, 0f4h, 0feh
        db      0cbh, 8ch, 0d8h, 8eh, 0c0h, 0bfh, 7dh, 34h, 0b0h, 00h, 0b1h, 40h, 57h, 0aah, 0feh, 0c0h
        db      0e2h, 0fbh, 5fh, 83h, 3eh, 0dch, 2bh, 00h, 74h, 2dh, 0ffh, 0eh, 0dch, 2bh, 8bh, 1eh
        db      0deh, 2bh, 0a1h, 0dch, 2bh, 88h, 01h, 3ah, 0d8h, 72h, 10h, 0feh, 0c3h, 0ffh, 06h, 0dch
        db      2bh, 0feh, 0cbh, 3ah, 0c3h, 74h, 29h, 0feh, 01h, 0ebh, 0f6h, 0feh, 0c0h, 0feh, 0c3h, 3ah
        db      0d8h, 74h, 1dh, 0feh, 09h, 0ebh, 0f6h, 8bh, 1eh, 0deh, 2bh, 0a1h, 0dch, 2bh, 88h, 01h
        db      3ah, 0d8h, 72h, 0e7h, 0feh, 0c8h, 0feh, 0cbh, 3ah, 0c3h, 74h, 04h, 0feh, 01h, 0ebh, 0f6h
        db      0cdh, 83h, 2bh, 0dbh, 26h, 8ah, 4ch, 04h, 80h, 0f9h, 0ffh, 75h, 02h, 0ebh, 1ah, 26h
        db      8ah, 44h, 03h, 8ah, 0e0h, 25h, 0c0h, 3fh, 8ah, 0dch, 8ah, 0a7h, 7dh, 34h, 0ah, 0c4h
        db      26h, 88h, 44h, 03h, 0e8h, 95h, 00h, 0ebh, 0dbh, 0b8h, 0a0h, 0e2h, 8eh, 0c0h, 0bfh, 00h
        db      00h, 1eh, 8eh, 1eh, 10h, 0fh, 0beh, 00h, 00h, 0b9h, 00h, 07h, 0f3h, 0a4h, 1fh, 8eh
        db      06h, 10h, 0fh, 2bh, 0dbh, 2bh, 0c0h, 8ah, 87h, 7dh, 34h, 8bh, 0f8h, 0c1h, 0e7h, 04h
        db      81h, 0c7h, 80h, 01h, 8bh, 0f3h, 0c1h, 0e6h, 04h, 81h, 0c6h, 80h, 01h, 1eh, 0b9h, 0a0h
        db      0e2h, 8eh, 0d9h, 0b9h, 10h, 00h, 0f3h, 0a4h, 1fh, 0feh, 0c3h, 80h, 0fbh, 40h, 75h, 0d7h
        db      0beh, 00h, 00h, 0bbh, 00h, 00h, 0bdh, 0a0h, 0e2h, 8eh, 0c5h, 26h, 8ah, 84h, 80h, 05h
        db      26h, 8ah, 0a4h, 0c0h, 05h, 26h, 8ah, 8ch, 00h, 06h, 26h, 8ah, 0ach, 40h, 06h, 26h
        db      8ah, 94h, 80h, 06h, 8ah, 9ch, 7dh, 34h, 8eh, 06h, 10h, 0fh, 26h, 88h, 87h, 80h
        db      05h, 26h, 88h, 0a7h, 0c0h, 05h, 26h, 88h, 8fh, 00h, 06h, 26h, 88h, 0afh, 40h, 06h
        db      26h, 88h, 97h, 80h, 06h, 46h, 83h, 0feh, 40h, 75h, 0beh, 0c3h, 83h, 0c6h, 08h, 73h
        db      07h, 8ch, 0c0h, 05h, 00h, 10h, 8eh, 0c0h, 80h, 0f9h, 0f0h, 74h, 01h, 0c3h, 26h, 8ah
        db      4ch, 04h, 83h, 0c6h, 08h, 73h, 07h, 8ch, 0c0h, 05h, 00h, 10h, 8eh, 0c0h, 80h, 0f9h
        db      0f8h, 75h, 0ebh, 0c3h
L_33BF2:
        db      0c7h, 06h, 10h, 0fh, 00h, 80h, 8eh, 06h, 10h, 0fh, 0bfh, 00h
        db      00h, 0beh, 10h, 00h, 0b9h, 00h, 07h, 0f3h, 0a4h, 0c7h, 06h, 12h, 07h, 00h, 00h
        mov     word ptr [C0_W_02B30], L_33BF2-APP3_CSBASE
        db      0eh, 0e8h, 2eh, 02h, 0cbh
        endif
far_33C18:
        int     0a4h
        if      FW_VERSION >= 114
        KEY_SOFT        L_33DBF-APP3_CSBASE, APP3_SEG, EP_L_33DC8_OFF, APP3_SEG, EP_L_337E3_OFF, APP3_SEG, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        KEY_DOWN        20h, L_33C4D-APP3_CSBASE, APP3_SEG
        elseif  FW_VERSION >= 112
        KEY_SOFT        (C0_BASE+L_33DBF-APP3_SEG*16), APP3_SEG, EP_L_33DC8_OFF, APP3_SEG, EP_L_337E3_OFF, APP3_SEG, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        KEY_DOWN        20h, (C0_BASE+L_33C4D-APP3_SEG*16), APP3_SEG
        else
        KEY_SOFT        (C0_BASE+L_334DF-APP3_SEG*16), APP3_SEG, EP_L_33DC8_OFF, APP3_SEG, EP_L_337E3_OFF, APP3_SEG, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        KEY_DOWN        20h, EP_L_33C4D_OFF, APP3_SEG
        endif
        else
        db      0b1h, 09h, 0b5h, 1ah, 0b0h, 73h, 0cdh
        db      0b0h, 0cbh, 0a1h, 0dch, 2bh, 3ch, 00h, 74h, 27h, 3ch, 01h, 75h, 07h, 83h, 3eh, 0deh
        db      2bh, 00h, 74h, 1ch, 3ch, 40h, 74h, 1eh, 0feh, 0c8h, 3bh, 06h, 0deh, 2bh, 75h, 02h ; +.t.<@t...;..+u.
        db      0feh, 0c8h, 0b5h, 10h, 0e8h, 0b6h, 0feh, 0a1h, 0dch, 2bh, 0b5h, 24h, 0e8h, 0aeh, 0feh, 0c3h
        db      0b5h, 24h, 0e8h, 0a8h, 0feh, 0c3h, 0feh, 0c8h, 83h, 3eh, 0deh, 2bh, 3fh, 75h, 02h, 0feh
        db      0c8h, 0b5h, 10h, 0e8h, 97h, 0feh, 0c3h
L_33133:
        db      0a1h, 0dch, 2bh, 3dh, 00h, 00h, 75h, 01h, 0cbh
        db      48h, 74h, 0fh, 0a3h, 0dch, 2bh, 3bh, 06h, 0deh, 2bh, 74h, 01h, 0cbh, 0ffh, 0eh, 0dch
L_33156                         equ     $+10
        db      2bh, 0cbh, 83h, 3eh, 0deh, 2bh, 00h, 75h, 0eah, 0cbh, 0a1h, 0dch, 2bh, 3ch, 40h, 75h ; +..>.+.u....+<@u
        db      01h, 0cbh, 0feh, 0c0h, 0a3h, 0dch, 2bh, 3ch, 3fh, 75h, 01h, 0cbh, 3bh, 06h, 0deh, 2bh
        db      74h, 01h, 0cbh, 0ffh, 06h, 0dch, 2bh, 0cbh
L_33174:
        db      8eh, 06h, 10h, 0fh, 26h, 80h, 3eh, 12h
        db      00h, 00h, 74h, 2ch, 0a1h, 0dch, 2bh, 2dh, 01h, 00h, 73h, 03h, 0b8h, 00h, 00h, 3bh
        db      06h, 0deh, 2bh, 74h, 1bh, 0ffh, 36h, 0dch, 2bh, 0e8h, 19h, 00h, 0cdh, 0d6h, 0cdh, 0e6h
        db      0eh, 0e8h, 04h, 0ffh, 58h, 3dh, 00h, 00h, 75h, 01h, 0cbh, 0eh, 0e8h, 9eh, 0feh, 0cbh
        db      0eh, 0e8h, 0f4h, 0feh, 0cbh, 8ch, 0d8h, 8eh, 0c0h, 0bfh, 7dh, 34h, 0b0h, 00h, 0b1h, 40h
        db      57h, 0aah, 0feh, 0c0h, 0e2h, 0fbh, 5fh, 83h, 3eh, 0dch, 2bh, 00h, 74h, 2dh, 0ffh, 0eh
        db      0dch, 2bh, 8bh, 1eh, 0deh, 2bh, 0a1h, 0dch, 2bh, 88h, 01h, 3ah, 0d8h, 72h, 10h, 0feh
        db      0c3h, 0ffh, 06h, 0dch, 2bh, 0feh, 0cbh, 3ah, 0c3h, 74h, 29h, 0feh, 01h, 0ebh, 0f6h, 0feh
        db      0c0h, 0feh, 0c3h, 3ah, 0d8h, 74h, 1dh, 0feh, 09h, 0ebh, 0f6h, 8bh, 1eh, 0deh, 2bh, 0a1h
        db      0dch, 2bh, 88h, 01h, 3ah, 0d8h, 72h, 0e7h, 0feh, 0c8h, 0feh, 0cbh, 3ah, 0c3h, 74h, 04h
        db      0feh, 01h, 0ebh, 0f6h, 0cdh, 83h, 2bh, 0dbh, 26h, 8ah, 4ch, 04h, 80h, 0f9h, 0ffh, 75h
        db      02h, 0ebh, 1ah, 26h, 8ah, 44h, 03h, 8ah, 0e0h, 25h, 0c0h, 3fh, 8ah, 0dch, 8ah, 0a7h
        db      7dh, 34h, 0ah, 0c4h, 26h, 88h, 44h, 03h, 0e8h, 95h, 00h, 0ebh, 0dbh, 0b8h, 0a0h, 0e2h
        db      8eh, 0c0h, 0bfh, 00h, 00h, 1eh, 8eh, 1eh, 10h, 0fh, 0beh, 00h, 00h, 0b9h, 00h, 07h
        db      0f3h, 0a4h, 1fh, 8eh, 06h, 10h, 0fh, 2bh, 0dbh, 2bh, 0c0h, 8ah, 87h, 7dh, 34h, 8bh
        db      0f8h, 0c1h, 0e7h, 04h, 81h, 0c7h, 80h, 01h, 8bh, 0f3h, 0c1h, 0e6h, 04h, 81h, 0c6h, 80h
        db      01h, 1eh, 0b9h, 0a0h, 0e2h, 8eh, 0d9h, 0b9h, 10h, 00h, 0f3h, 0a4h, 1fh, 0feh, 0c3h, 80h
        db      0fbh, 40h, 75h, 0d7h, 0beh, 00h, 00h, 0bbh, 00h, 00h, 0bdh, 0a0h, 0e2h, 8eh, 0c5h, 26h
        db      8ah, 84h, 80h, 05h, 26h, 8ah, 0a4h, 0c0h, 05h, 26h, 8ah, 8ch, 00h, 06h, 26h, 8ah
        db      0ach, 40h, 06h, 26h, 8ah, 94h, 80h, 06h, 8ah, 9ch, 7dh, 34h, 8eh, 06h, 10h, 0fh
        db      26h, 88h, 87h, 80h, 05h, 26h, 88h, 0a7h, 0c0h, 05h, 26h, 88h, 8fh, 00h, 06h, 26h
        db      88h, 0afh, 40h, 06h, 26h, 88h, 97h, 80h, 06h, 46h, 83h, 0feh, 40h, 75h, 0beh, 0c3h
        db      83h, 0c6h, 08h, 73h, 07h, 8ch, 0c0h, 05h, 00h, 10h, 8eh, 0c0h, 80h, 0f9h, 0f0h, 74h
        db      01h, 0c3h, 26h, 8ah, 4ch, 04h, 83h, 0c6h, 08h, 73h, 07h, 8ch, 0c0h, 05h, 00h, 10h
        db      8eh, 0c0h, 80h, 0f9h, 0f8h, 75h, 0ebh, 0c3h
L_33BF2:
        mov     word ptr [A3_W_00F10], 8000h
        mov     es, word ptr [A3_W_00F10]
        mov     di, 0
        mov     si, 10h
        mov     cx, 700h
        rep movsb
        mov     word ptr [A3_W_00712], 0
        mov     word ptr [C0_W_02B40], EP_L_33312_OFF
        push    cs
        call    fn_33E45
        retf
far_33C18:
        int     0a4h
        KEY_SOFT        (C0_BASE+L_33DBF-APP3_SEG*16), APP3_SEG, EP_L_33DC8_OFF, APP3_SEG, EP_L_337E3_OFF, APP3_SEG, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        KEY_DOWN        20h, (C0_BASE+L_33C4D-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        27h, EP_L_33DB5_OFF, APP3_SEG
        KEY_DOWN        26h, EP_FAR_33D3A_OFF, EP_FAR_33D3A_SEG
        ret
L_33C4D:
        DISP_CLEAR
        DISP_HLINE      00h, 00h, 9dh
        DISP_VLINE      9dh, 00h, 0bh
        DISP_VLINE      9eh, 01h, 0ah
        DISP_HLINE      9ch, 0ah, 5bh
        DISP_HDOTS      00h, 0ah, 9dh
        DISP_HLINE      00h, 30h, 0f8h
        DISP_HLINE      01h, 31h, 0f7h
        DISP_VLINE      00h, 00h, 30h
        DISP_VLINE      0f6h, 0ah, 26h
        DISP_VLINE      0f7h, 0bh, 25h
        DISP_HDOTS      00h, 1dh, 0f5h
        DISP_TEXT       06h, 02h, "Main screen user defaults"
        DISP_SOFTKEY    01h, DISP_SK_FILL,   "EVENTS"
        DISP_SOFTKEY    02h, DISP_SK_FILL,   "BARS"
        DISP_SOFTKEY    03h, DISP_SK_FILL,   "TrMOVE"
        DISP_SOFTKEY    04h, DISP_SK_PLAIN, "USER"
        if      FW_VERSION >= 120
        db      0e8h, 0fah, 00h
        call    APP3_BASE+fn_26BEB-SEGBASE
        call    APP3_BASE+fn_26C7D-SEGBASE
        call    APP3_BASE+fn_26CB0-SEGBASE
        call    APP3_BASE+fn_26CCD-SEGBASE
        call    APP3_BASE+fn_26CF5-SEGBASE
        call    APP3_BASE+fn_26D5C-SEGBASE
        elseif  FW_VERSION >= 112
        db      0e8h, 0fah, 00h, 0e8h, 16h, 2fh, 0e8h, 0a5h, 2fh, 0e8h, 0d5h, 2fh, 0e8h, 0efh, 2fh, 0e8h
        db      14h, 30h, 0e8h, 78h, 30h
        elseif  FW_VERSION >= 111
        db      0e8h, 0fah, 00h, 0e8h, 18h, 2fh, 0e8h, 0a7h, 2fh, 0e8h, 0d7h, 2fh, 0e8h, 0f1h, 2fh, 0e8h
        db      16h, 30h, 0e8h, 7ah, 30h
        elseif  FW_VERSION >= 110
        db      0e8h, 0fah, 00h, 0e8h, 26h, 2fh, 0e8h, 0b5h, 2fh, 0e8h, 0e5h, 2fh, 0e8h, 0ffh, 2fh, 0e8h
        db      24h, 30h, 0e8h, 88h, 30h
        else
        db      0e8h
        db      0fah, 00h, 0e8h, 56h, 2fh, 0e8h, 0e5h, 2fh, 0e8h, 15h, 30h, 0e8h, 2fh, 30h, 0e8h, 54h
        db      30h, 0e8h, 0b8h, 30h
        endif
        DISP_TEXT       0b9h, 15h, "Bars:"
        db      8eh, 06h, 10h, 0fh, 26h, 0a1h, 1ah, 00h
        DISP_NUMR       0d7h, 15h, 03h
        DISP_TEXT       0b9h, 0ch, "Tsig:  /  "
        db      8eh, 06h
        db      10h, 0fh, 26h, 0a0h, 19h, 00h, 06h
        DISP_NUMR       0e9h, 0ch, 02h
        db      07h, 26h, 0a0h
        db      18h, 00h
        DISP_NUMR       0d7h, 0ch, 02h
        db      0ffh, 16h, 0ch, 0fh, 0cbh
far_33D3A:
        mov     es, word ptr [A3_W_00F10]
        mov     al, byte ptr es:[580h]
        mov     ah, byte ptr es:[5c0h]
        mov     dl, byte ptr es:[600h]
        mov     dh, byte ptr es:[640h]
        mov     cx, 40h
        mov     di, 0
tgt_33D57:
        mov     byte ptr es:[di+580h], al
        mov     byte ptr es:[di+5c0h], ah
        mov     byte ptr es:[di+600h], dl
        mov     byte ptr es:[di+640h], dh
        inc     di
        loop    tgt_33D57
        mov     cx, 380h
        mov     di, 0
        mov     si, 10h
tgt_33D77:
        mov     ax, word ptr es:[di]
        mov     word ptr [si], ax
        add     di, 2
        add     si, 2
        loop    tgt_33D77
        mov     al, byte ptr [A3_B_00737]
        mov     ah, 0
        mov     di, ax
        mov     al, byte ptr es:[580h]
        mov     ah, byte ptr es:[5c0h]
        mov     dl, byte ptr es:[600h]
        mov     dh, byte ptr es:[640h]
        mov     cl, byte ptr es:[18h]
        mov     ch, byte ptr es:[19h]
        mov     bx, word ptr es:[16h]
        mov     si, word ptr es:[1ah]
        int     73h
        retf
L_33DB5:
        if      FW_VERSION >= 110
        if      FW_VERSION >= 112
        push    cs
        call    far_33D3A
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
L_33DBF:
        push    cs
        call    far_33D3A
        push    cs
        call    far_32782
        retf
L_33DC8:
        push    cs
        call    far_33D3A
        push    cs
        call    L_32CC6
        retf
L_337E3:
        push    cs
        call    far_33D3A
        push    cs
        call    far_33753
        retf
        else
        db      0eh, 0e8h, 81h, 0ffh, 9ah
        dw      EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
L_334DF                         equ     $+1
        db      0cbh, 0eh, 0e8h, 77h, 0ffh, 0eh, 0e8h, 0bbh, 0e9h, 0cbh
L_33DC8:
        db      0eh, 0e8h, 6eh, 0ffh, 0eh, 0e8h
        db      0e4h, 0f4h, 0cbh
L_337E3:
        db      0eh, 0e8h, 65h, 0ffh, 0eh, 0e8h, 7ah, 0f9h, 0cbh
        endif
        else
        push    cs
        call    far_33D3A
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
L_33DBF:
        push    cs
        call    far_33D3A
        push    cs
        call    far_32782
        retf
L_33DC8:
        push    cs
        call    far_33D3A
        push    cs
        call    L_32CC6
        retf
L_337E3:
        push    cs
        call    far_33D3A
        push    cs
        call    far_33753
        retf
        endif
        DISP_TEXT       08h, 0ch, "\\:"
        DISP_TEXT       2fh, 0ch, "(SEQ)"
        DISP_TEXT       25h, 0ch, "."
        mov     es, word ptr [A3_W_00F10]
        mov     ax, word ptr es:[16h]
        sub     dx, dx
        mov     bx, 0ah
        div     bx
        push    dx
        DISP_NUM        14h, 0ch, 03h
        pop     ax
        DISP_NUM        29h, 0ch, 01h
        ret
isr_33E12:
        push    ds
        mov     bp, APPDATA_SEG
        mov     ds, bp
        push    di
        mov     di, 10h
        mov     word ptr [di+1ah], si
        mov     word ptr [di+16h], bx
        mov     byte ptr [di+18h], cl
        mov     byte ptr [di+19h], ch
        pop     cx
        mov     byte ptr [A3_B_00737], cl
        mov     cx, 40h
isr_33E30:
        mov     byte ptr [di+A3_TBL_00580], al
        mov     byte ptr [di+A3_TBL_005C0], ah
        mov     byte ptr [di+A3_TBL_00600], dl
        mov     byte ptr [di+A3_TBL_00640], dh
        inc     di
        loop    isr_33E30
        pop     ds
        iret
fn_33E45:
        call    far_33C18
        mov     word ptr [A3_W_PAGE_CURSOR_FN], 323h
        mov     es, word ptr [A2_W_SEQ_SEG]
        mov     ax, word ptr es:[16h]
        mov     bl, 0
        mov     bh, 1
        mov     dx, 0bb8h
        mov     di, P_D6C5
        int     7fh
        if      FW_VERSION >= 110
        if      FW_VERSION >= 120
        KEY_CURSOR      0000h, 0000h, (C0_BASE+far_3389F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+far_339B9-APP3_SEG*16), APP3_SEG
        db      0cbh
d_p_d6c5:
        db      3dh, 2ch, 01h
        jae     L_33E7D
        mov     ax, 12ch
L_33E7D:
        mov     word ptr es:[di], ax
        mov     es, word ptr [A2_W_SEQ_SEG]
        mov     word ptr es:[16h], ax
        mov     bl, 15h
        int     87h
        db      0cbh
far_3389F:
        call    far_33C18
        mov     word ptr [A3_W_PAGE_CURSOR_FN], 456h
        FIELD_WHEEL     word ptr [A2_W_SEQ_SEG], 34h, 0, 0, 1, (APP3_BASE+field_cb_none-APP3_SEG*16)
        KEY_CURSOR      EP_FN_33E45_OFF, EP_FN_33E45_SEG, (C0_BASE+L_33EBC-APP3_SEG*16), APP3_SEG, EP_FN_33E45_OFF, EP_FN_33E45_SEG, (C0_BASE+L_33FD8-APP3_SEG*16), APP3_SEG
        db      0cbh
L_33EBC:
        call    far_33C18
        mov     word ptr [A3_W_PAGE_CURSOR_FN], (APP3_BASE+cb_26BC0-APP3_SEG*16)
        db      8ch, 0d9h, 0beh
        db      5ah, 2bh, 0b3h, 00h, 0b7h, 00h, 0bah, 50h, 00h
        mov     di, L_33EE9-APP3_CSBASE
        db      0cdh, 7dh
        KEY_CURSOR      (C0_BASE+far_3389F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, (C0_BASE+L_33F04-APP3_SEG*16), APP3_SEG
        db      0cbh
L_33EE9:
        db      8bh, 1eh, 5ah, 2bh, 0d1h, 0e3h, 8bh, 87h, 08h, 12h, 8eh, 06h, 10h, 0fh, 26h
        db      0a2h, 18h, 00h
        mov     byte ptr es:[19h], ah
        call    APP3_BASE+fn_27F67-SEGBASE
        db      0cbh
L_33F04:
        call    far_33C18
        mov     word ptr [A3_W_PAGE_CURSOR_FN], (APP3_BASE+cb_26C33-APP3_SEG*16)
        KEY_CURSOR      (C0_BASE+far_3389F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_33EBC-APP3_SEG*16), APP3_SEG, (C0_BASE+L_33F47-APP3_SEG*16), APP3_SEG
        db      8bh, 0eh, 10h, 0fh, 0beh, 1ah, 00h, 0b3h, 00h
        db      0b7h, 00h, 0bah, 0e7h, 03h
        mov     di, L_33F33-APP3_CSBASE
        db      0cdh, 7eh, 0cbh
L_33F33:
        db      3dh, 00h, 00h, 75h, 03h
        db      0b8h, 01h, 00h, 8eh, 06h, 10h, 0fh, 26h, 0a3h, 1ah, 00h, 0e8h, 21h, 40h, 0cbh
L_33F47:
        db      0e8h
        db      0ceh, 0fch, 0c7h, 06h, 0ch, 0fh, 0f7h, 04h
        KEY_CURSOR      (C0_BASE+L_33FD8-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_33F04-APP3_SEG*16), APP3_SEG, (C0_BASE+L_3400C-APP3_SEG*16), APP3_SEG
        db      0b3h, 00h, 8eh, 06h, 10h, 0fh
        db      0beh, 00h, 06h, 8ch, 0c1h, 0b3h, 00h, 0b7h, 01h, 0bah, 80h, 00h
        mov     di, (APP3_BASE+field_cb_none-APP3_SEG*16)
        db      0cdh
        db      7eh, 0cbh
L_33F7A:
        call    far_33C18
        mov     word ptr [A3_W_PAGE_CURSOR_FN], (APP3_BASE+cb_26CC4-APP3_SEG*16)
        KEY_CURSOR      0000h, 0000h, (C0_BASE+far_339B9-APP3_SEG*16), APP3_SEG, EP_FN_33E45_OFF, EP_FN_33E45_SEG, 0000h, 0000h
        db      8ch, 0d9h, 0beh
        db      37h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h
        mov     di, (APP3_BASE+field_cb_none-APP3_SEG*16)
        db      0cdh, 7dh, 0cbh
far_339B9:
        call    far_33C18
        mov     word ptr [A3_W_PAGE_CURSOR_FN], (APP3_BASE+cb_26CEC-APP3_SEG*16)
        KEY_CURSOR      (C0_BASE+L_33F7A-APP3_SEG*16), APP3_SEG, (C0_BASE+L_33FD8-APP3_SEG*16), APP3_SEG, EP_FN_33E45_OFF, EP_FN_33E45_SEG, 0000h, 0000h
        db      8eh, 06h, 10h, 0fh, 0beh, 0c0h
        db      05h, 8ch, 0c1h, 0b3h, 00h, 0b7h, 01h, 0bah, 04h, 00h
        mov     di, (APP3_BASE+field_cb_none-APP3_SEG*16)
        db      0cdh, 7dh, 0cbh
L_33FD8:
        call    far_33C18
        mov     word ptr [A3_W_PAGE_CURSOR_FN], (APP3_BASE+cb_26D53-APP3_SEG*16)
        KEY_CURSOR      (C0_BASE+far_339B9-APP3_SEG*16), APP3_SEG, (C0_BASE+L_3400C-APP3_SEG*16), APP3_SEG, EP_FN_33E45_OFF, EP_FN_33E45_SEG, 0000h, 0000h
        call    APP3_BASE+fn_280C2-SEGBASE
        db      8eh, 06h
        db      10h, 0fh, 0beh, 80h, 05h, 8ch, 0c1h, 0b3h, 00h, 0b7h, 01h, 0bah, 20h, 00h
        mov     di, (APP3_BASE+field_cb_none-APP3_SEG*16)
        db      0cdh, 7dh, 0cbh
L_3400C:
        call    far_33C18
        mov     word ptr [A3_W_PAGE_CURSOR_FN], (APP3_BASE+cb_26D79-APP3_SEG*16)
        KEY_CURSOR      (C0_BASE+L_33FD8-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_33F47-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        elseif  FW_VERSION >= 112
        KEY_CURSOR      0000h, 0000h, (C0_BASE+far_3389F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+FAR_339B9-APP3_SEG*16), APP3_SEG
        db      0cbh
d_p_d6c5:
        db      3dh, 2ch, 01h, 73h
        db      03h, 0b8h, 2ch, 01h, 26h, 89h, 05h, 8eh, 06h, 10h, 0fh, 26h, 0a3h, 16h, 00h, 0b3h
        db      15h, 0cdh, 87h, 0cbh
far_3389F:
        db      0e8h, 88h, 0fdh, 0c7h, 06h, 0ch, 0fh, 56h, 04h, 8bh, 0eh, 10h
        db      0fh, 0beh, 34h, 00h, 0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h, 0bfh, 0dch, 18h, 0cdh, 7dh
        if      FW_VERSION < 114
        KEY_CURSOR      EP_FN_33E45_OFF, EP_FN_33E45_SEG, (C0_BASE+L_336DE-APP3_SEG*16), APP3_SEG, EP_FN_33E45_OFF, EP_FN_33E45_SEG, (C0_BASE+FAR_339EA-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      EP_FN_33E45_OFF, EP_FN_33E45_SEG, (C0_BASE+L_338CE-APP3_SEG*16), APP3_SEG, EP_FN_33E45_OFF, EP_FN_33E45_SEG, (C0_BASE+FAR_339EA-APP3_SEG*16), APP3_SEG
        endif
        if      FW_VERSION < 114
L_336DE                         equ     $+1
        endif
        db      0cbh
L_338CE:
        db      0e8h, 59h, 0fdh, 0c7h, 06h, 0ch, 0fh, 10h, 04h, 8ch, 0d9h, 0beh, 4ah
        db      2bh, 0b3h, 00h, 0b7h, 00h, 0bah, 50h, 00h, 0bfh, 2bh, 0d7h, 0cdh, 7dh
        KEY_CURSOR      (C0_BASE+FAR_3389F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, (C0_BASE+FAR_33916-APP3_SEG*16), APP3_SEG
        db      0cbh
        db      8bh, 1eh, 4ah, 2bh, 0d1h, 0e3h, 8bh, 87h, 08h, 12h, 8eh, 06h, 10h, 0fh, 26h, 0a2h
        db      18h, 00h, 26h, 88h, 26h, 19h, 00h, 0e8h, 72h, 40h, 0cbh
far_33916:
        db      0e8h, 11h, 0fdh, 0c7h, 06h
        db      0ch, 0fh, 83h, 04h
        KEY_CURSOR      (C0_BASE+FAR_3389F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_338CE-APP3_SEG*16), APP3_SEG, (C0_BASE+FAR_33959-APP3_SEG*16), APP3_SEG
        db      8bh, 0eh, 10h, 0fh, 0beh, 1ah, 00h, 0b3h, 00h, 0b7h
        db      00h, 0bah, 0e7h, 03h, 0bfh, 75h, 0d7h, 0cdh, 7eh, 0cbh, 3dh, 00h, 00h, 75h, 03h, 0b8h
        db      01h, 00h, 8eh, 06h, 10h, 0fh, 26h, 0a3h, 1ah, 00h, 0e8h, 2fh, 40h, 0cbh
far_33959:
        db      0e8h, 0ceh
        db      0fch, 0c7h, 06h, 0ch, 0fh, 0f7h, 04h
        if      FW_VERSION < 114
        KEY_CURSOR      (C0_BASE+FAR_339EA-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+FAR_33916-APP3_SEG*16), APP3_SEG, (C0_BASE+L_3382E-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      (C0_BASE+FAR_339EA-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+FAR_33916-APP3_SEG*16), APP3_SEG, (C0_BASE+L_33A1E-APP3_SEG*16), APP3_SEG
        endif
        db      0b3h, 00h, 8eh, 06h, 10h, 0fh, 0beh
        db      00h, 06h, 8ch, 0c1h, 0b3h, 00h, 0b7h, 01h, 0bah, 80h, 00h, 0bfh, 0dch, 18h, 0cdh, 7eh
        db      0cbh
far_3398C:
        call    far_33C18
        mov     word ptr [A3_W_PAGE_CURSOR_FN], 514h
        KEY_CURSOR      0000h, 0000h, (C0_BASE+FAR_339B9-APP3_SEG*16), APP3_SEG, EP_FN_33E45_OFF, EP_FN_33E45_SEG, 0000h, 0000h
        db      8ch, 0d9h, 0beh, 37h
        db      07h, 0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h, 0bfh, 0dch, 18h, 0cdh, 7dh, 0cbh
far_339B9:
        db      0e8h, 6eh
        db      0fch, 0c7h, 06h, 0ch, 0fh, 3ch, 05h
        KEY_CURSOR      (C0_BASE+FAR_3398C-APP3_SEG*16), APP3_SEG, (C0_BASE+FAR_339EA-APP3_SEG*16), APP3_SEG, EP_FN_33E45_OFF, EP_FN_33E45_SEG, 0000h, 0000h
        mov     es, word ptr [A3_W_00F10]
        mov     si, 5c0h
        db      8ch, 0c1h, 0b3h, 00h, 0b7h, 01h, 0bah, 04h, 00h, 0bfh, 0dch, 18h, 0cdh, 7dh, 0cbh
far_339EA:
        else
        KEY_CURSOR      0000h, 0000h, (C0_BASE+far_3389F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+far_339B9-APP3_SEG*16), APP3_SEG
        db      0cbh
d_p_d6c5:
        db      3dh
        sub     al, 1
        jae     L_3359D
        mov     ax, 12ch
L_3359D:
        mov     word ptr es:[di], ax
        mov     es, word ptr [A2_W_SEQ_SEG]
        mov     word ptr es:[16h], ax
        mov     bl, 15h
        int     87h
        retf
far_3389F:
        call    far_33C18
        mov     word ptr [A3_W_PAGE_CURSOR_FN], 456h
        FIELD_WHEEL     word ptr [A2_W_SEQ_SEG], 34h, 0, 0, 1, (APP3_BASE+field_cb_none-APP3_SEG*16)
        KEY_CURSOR      EP_FN_33E45_OFF, APP3_SEG, (C0_BASE+L_335DC-APP3_SEG*16), APP3_SEG, EP_FN_33E45_OFF, APP3_SEG, (C0_BASE+L_336F8-APP3_SEG*16), APP3_SEG
        retf
L_335DC:
        call    far_33C18
        mov     word ptr [A3_W_PAGE_CURSOR_FN], 410h
        FIELD_WHEEL     ds, 2b4ah, 0, 0, 50h, intcb_33609_111-APP3_CSBASE
        KEY_CURSOR      (C0_BASE+far_3389F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, (C0_BASE+L_33624-APP3_SEG*16), APP3_SEG
        retf
intcb_33609_111:
        mov     bx, word ptr [C0_W_02B4A]
        shl     bx, 1
        mov     ax, word ptr [bx+A3_TBL_01208]
        mov     es, word ptr [A3_W_00F10]
        mov     byte ptr es:[18h], al
        mov     byte ptr es:[19h], ah
        call    EP_FN_27F67_OFF+APP3_CSBASE
        retf
L_33624:
        db      0e8h, 11h, 0fdh, 0c7h, 06h, 0ch, 0fh, 83h, 04h
        KEY_CURSOR      (C0_BASE+far_3389F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_335DC-APP3_SEG*16), APP3_SEG, (C0_BASE+L_33667-APP3_SEG*16), APP3_SEG
        db      8bh, 0eh, 10h, 0fh, 0beh
        if      FW_VERSION >= 111
        db      1ah, 00h, 0b3h, 00h, 0b7h, 00h, 0bah, 0e7h, 03h, 0bfh, 73h, 0d7h, 0cdh, 7eh, 0cbh, 3dh
        else
        db      1ah, 00h, 0b3h, 00h, 0b7h, 00h, 0bah, 0e7h, 03h, 0bfh, 65h, 0d7h, 0cdh, 7eh, 0cbh, 3dh
        endif
        db      00h, 00h, 75h, 03h, 0b8h, 01h, 00h, 8eh, 06h, 10h, 0fh, 26h, 0a3h, 1ah, 00h, 0e8h
L_33667                         equ     $+3
        if      FW_VERSION >= 111
        db      31h, 40h, 0cbh, 0e8h, 0ceh, 0fch, 0c7h, 06h, 0ch, 0fh, 0f7h, 04h
        else
        db      32h, 40h, 0cbh, 0e8h, 0ceh, 0fch, 0c7h, 06h, 0ch, 0fh, 0f7h, 04h
        endif
        KEY_CURSOR      (C0_BASE+L_336F8-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_33624-APP3_SEG*16), APP3_SEG, (C0_BASE+L_3372C-APP3_SEG*16), APP3_SEG
        db      0b3h, 00h
        db      8eh, 06h, 10h, 0fh, 0beh, 00h, 06h, 8ch, 0c1h, 0b3h, 00h, 0b7h, 01h, 0bah, 80h, 00h
L_3369A                         equ     $+6
        if      FW_VERSION >= 111
        db      0bfh, 0dch, 18h, 0cdh, 7eh, 0cbh, 0e8h, 9bh, 0fch, 0c7h, 06h, 0ch, 0fh, 14h, 05h
        else
        db      0bfh, 0cfh, 18h, 0cdh, 7eh, 0cbh, 0e8h, 9bh, 0fch, 0c7h, 06h, 0ch, 0fh, 14h, 05h
        endif
        KEY_CURSOR      0000h, 0000h, (C0_BASE+far_339B9-APP3_SEG*16), APP3_SEG, EP_FN_33E45_OFF, APP3_SEG, 0000h, 0000h
        if      FW_VERSION >= 111
        db      8ch, 0d9h, 0beh, 37h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h, 0bfh, 0dch, 18h
        else
        db      8ch, 0d9h, 0beh, 37h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h, 0bfh, 0cfh, 18h
        endif
far_339B9                         equ     $+3
        db      0cdh, 7dh, 0cbh, 0e8h, 6eh, 0fch, 0c7h, 06h, 0ch, 0fh, 3ch, 05h
        KEY_CURSOR      (C0_BASE+L_3369A-APP3_SEG*16), APP3_SEG, (C0_BASE+L_336F8-APP3_SEG*16), APP3_SEG, EP_FN_33E45_OFF, APP3_SEG, 0000h, 0000h
        db      8eh, 06h
        if      FW_VERSION >= 111
        db      10h, 0fh, 0beh, 0c0h, 05h, 8ch, 0c1h, 0b3h, 00h, 0b7h, 01h, 0bah, 04h, 00h, 0bfh, 0dch
        else
        db      10h, 0fh, 0beh, 0c0h, 05h, 8ch, 0c1h, 0b3h, 00h, 0b7h, 01h, 0bah, 04h, 00h, 0bfh, 0cfh
        endif
L_336F8                         equ     $+4
        db      18h, 0cdh, 7dh, 0cbh, 0e8h, 3dh, 0fch, 0c7h, 06h, 0ch, 0fh, 0a3h, 05h
        KEY_CURSOR      (C0_BASE+far_339B9-APP3_SEG*16), APP3_SEG, (C0_BASE+L_3372C-APP3_SEG*16), APP3_SEG, EP_FN_33E45_OFF, APP3_SEG, 0000h, 0000h
        endif
        db      0e8h
        if      FW_VERSION >= 120
        db      98h, 40h, 0beh, 40h, 06h, 8ch, 0c1h, 0b3h, 00h, 0b7h, 01h, 0bah, 0c8h, 00h, 0bfh, 8ch
        db      0d8h, 0cdh, 7eh, 0cbh, 3ch, 00h, 74h, 01h, 0cbh, 0e8h, 7eh, 40h, 26h, 0c6h, 84h, 40h
        db      06h, 01h, 0cbh
        elseif  FW_VERSION >= 112
        db      3dh, 0fch, 0c7h, 06h, 0ch, 0fh, 0a3h, 05h
        KEY_CURSOR      (C0_BASE+FAR_339B9-APP3_SEG*16), APP3_SEG, (C0_BASE+L_33A1E-APP3_SEG*16), APP3_SEG, EP_FN_33E45_OFF, EP_FN_33E45_SEG, 0000h, 0000h
        db      0e8h, 0dah, 40h, 8eh, 06h, 10h
        db      0fh, 0beh, 80h, 05h, 8ch, 0c1h, 0b3h, 00h, 0b7h, 01h, 0bah, 20h, 00h, 0bfh, 0dch, 18h
        if      FW_VERSION < 114
L_3382E                         equ     $+3
        endif
        db      0cdh, 7dh, 0cbh
L_33A1E:
        call    far_33C18
        mov     word ptr [A3_W_PAGE_CURSOR_FN], 5c9h
        KEY_CURSOR      (C0_BASE+FAR_339EA-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+FAR_33959-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      0e8h, 0a6h
        db      40h, 0beh, 40h, 06h, 8ch, 0c1h, 0b3h, 00h, 0b7h, 01h, 0bah, 0c8h, 00h, 0bfh, 7eh, 0d8h
        db      0cdh, 7eh, 0cbh, 3ch, 00h, 74h, 01h, 0cbh, 0e8h, 8ch, 40h, 26h, 0c6h, 84h, 40h, 06h
        db      01h, 0cbh
        else
        if      FW_VERSION >= 111
        db      0dch, 40h, 8eh, 06h, 10h, 0fh, 0beh, 80h, 05h, 8ch, 0c1h, 0b3h, 00h, 0b7h, 01h, 0bah
        else
        db      0ddh, 40h, 8eh, 06h, 10h, 0fh, 0beh, 80h, 05h, 8ch, 0c1h, 0b3h, 00h, 0b7h, 01h, 0bah
        endif
L_3372C                         equ     $+8
        if      FW_VERSION >= 111
        db      20h, 00h, 0bfh, 0dch, 18h, 0cdh, 7dh, 0cbh, 0e8h, 09h, 0fch, 0c7h, 06h, 0ch, 0fh, 0c9h
        else
        db      20h, 00h, 0bfh, 0cfh, 18h, 0cdh, 7dh, 0cbh, 0e8h, 09h, 0fch, 0c7h, 06h, 0ch, 0fh, 0c9h
        endif
        db      05h
        KEY_CURSOR      (C0_BASE+L_336F8-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_33667-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        if      FW_VERSION >= 111
        db      0e8h, 0a8h, 40h, 0beh, 40h, 06h, 8ch, 0c1h, 0b3h, 00h, 0b7h, 01h, 0bah
        db      0c8h, 00h, 0bfh, 7ch, 0d8h, 0cdh, 7eh, 0cbh, 3ch, 00h, 74h, 01h, 0cbh, 0e8h, 8eh, 40h
        else
        db      0e8h, 0a9h, 40h, 0beh, 40h, 06h, 8ch, 0c1h, 0b3h, 00h, 0b7h, 01h, 0bah
        db      0c8h, 00h, 0bfh, 6eh, 0d8h, 0cdh, 7eh, 0cbh, 3ch, 00h, 74h, 01h, 0cbh, 0e8h, 8fh, 40h
        endif
        db      26h, 0c6h, 84h, 40h, 06h, 01h, 0cbh
        endif
        else
        KEY_CURSOR      0000h, 0000h, (C0_BASE+far_3389F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+far_339B9-APP3_SEG*16), APP3_SEG
        db      0cbh
d_p_d6c5:
        db      3dh, 2ch, 01h, 73h
        db      03h, 0b8h, 2ch, 01h, 26h, 89h, 05h, 8eh, 06h, 10h, 0fh, 26h, 0a3h, 16h, 00h, 0b3h
        db      15h, 0cdh, 87h, 0cbh
far_3389F:
        db      0e8h, 88h, 0fdh, 0c7h, 06h, 0ch, 0fh, 56h, 04h, 8bh, 0eh, 10h
        db      0fh, 0beh, 34h, 00h, 0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h, 0bfh, 0c0h, 18h, 0cdh, 7dh
        KEY_CURSOR      EP_FN_33E45_OFF, EP_FN_33E45_SEG, (C0_BASE+L_3307E-APP3_SEG*16), APP3_SEG, EP_FN_33E45_OFF, EP_FN_33E45_SEG, (C0_BASE+L_3319A-APP3_SEG*16), APP3_SEG
        db      0cbh
L_3307E:
        db      0e8h, 59h, 0fdh, 0c7h, 06h, 0ch, 0fh, 10h, 04h, 8ch, 0d9h, 0beh, 4ah
        db      2bh, 0b3h, 00h, 0b7h, 00h, 0bah, 50h, 00h, 0bfh, 0ebh, 0d6h, 0cdh, 7dh
        KEY_CURSOR      (C0_BASE+far_3389F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, (C0_BASE+far_33916-APP3_SEG*16), APP3_SEG
        db      0cbh
        db      8bh, 1eh, 4ah, 2bh, 0d1h, 0e3h, 8bh, 87h, 08h, 12h, 8eh, 06h, 10h, 0fh, 26h, 0a2h
        db      18h, 00h, 26h, 88h, 26h, 19h, 00h, 0e8h, 96h, 40h, 0cbh
far_33916:
        db      0e8h, 11h, 0fdh, 0c7h, 06h
        db      0ch, 0fh, 83h, 04h
        KEY_CURSOR      (C0_BASE+far_3389F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_3307E-APP3_SEG*16), APP3_SEG, (C0_BASE+far_33959-APP3_SEG*16), APP3_SEG
        db      8bh, 0eh, 10h, 0fh, 0beh, 1ah, 00h, 0b3h, 00h, 0b7h
        db      00h, 0bah, 0e7h, 03h, 0bfh, 35h, 0d7h, 0cdh, 7eh, 0cbh, 3dh, 00h, 00h, 75h, 03h, 0b8h
        db      01h, 00h, 8eh, 06h, 10h, 0fh, 26h, 0a3h, 1ah, 00h, 0e8h, 53h, 40h, 0cbh
far_33959:
        db      0e8h, 0ceh
        db      0fch, 0c7h, 06h, 0ch, 0fh, 0f7h, 04h
        KEY_CURSOR      (C0_BASE+L_3319A-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+far_33916-APP3_SEG*16), APP3_SEG, (C0_BASE+L_33A1E-APP3_SEG*16), APP3_SEG
        db      0b3h, 00h, 8eh, 06h, 10h, 0fh, 0beh
        db      00h, 06h, 8ch, 0c1h, 0b3h, 00h, 0b7h, 01h, 0bah, 80h, 00h, 0bfh, 0c0h, 18h, 0cdh, 7eh
        db      0cbh
far_3398C:
        db      0e8h, 9bh, 0fch, 0c7h, 06h, 0ch, 0fh, 14h, 05h
        KEY_CURSOR      0000h, 0000h, (C0_BASE+far_339B9-APP3_SEG*16), APP3_SEG, EP_FN_33E45_OFF, EP_FN_33E45_SEG, 0000h, 0000h
        db      8ch, 0d9h, 0beh, 37h
        db      07h, 0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h, 0bfh, 0c0h, 18h, 0cdh, 7dh, 0cbh
far_339B9:
        db      0e8h, 6eh
        db      0fch, 0c7h, 06h, 0ch, 0fh, 3ch, 05h
        KEY_CURSOR      (C0_BASE+far_3398C-APP3_SEG*16), APP3_SEG, (C0_BASE+L_3319A-APP3_SEG*16), APP3_SEG, EP_FN_33E45_OFF, EP_FN_33E45_SEG, 0000h, 0000h
        db      8eh, 06h, 10h, 0fh, 0beh, 0c0h, 05h
        db      8ch, 0c1h, 0b3h, 00h, 0b7h, 01h, 0bah, 04h, 00h, 0bfh, 0c0h, 18h, 0cdh, 7dh, 0cbh
L_3319A:
        db      0e8h
        db      3dh, 0fch, 0c7h, 06h, 0ch, 0fh, 0a3h, 05h
        KEY_CURSOR      (C0_BASE+far_339B9-APP3_SEG*16), APP3_SEG, (C0_BASE+L_33A1E-APP3_SEG*16), APP3_SEG, EP_FN_33E45_OFF, EP_FN_33E45_SEG, 0000h, 0000h
        db      0e8h, 0feh, 40h, 8eh, 06h, 10h
        db      0fh, 0beh, 80h, 05h, 8ch, 0c1h, 0b3h, 00h, 0b7h, 01h, 0bah, 20h, 00h, 0bfh, 0c0h, 18h
        db      0cdh, 7dh, 0cbh
L_33A1E:
        db      0e8h, 09h, 0fch, 0c7h, 06h, 0ch, 0fh, 0c9h, 05h
        KEY_CURSOR      (C0_BASE+L_3319A-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+far_33959-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      0e8h, 0cah
        db      40h, 0beh, 40h, 06h, 8ch, 0c1h, 0b3h, 00h, 0b7h, 01h, 0bah, 0c8h, 00h, 0bfh, 3eh, 0d8h
        db      0cdh, 7eh, 0cbh, 3ch, 00h, 74h, 01h, 0cbh, 0e8h, 0b0h, 40h, 26h, 0c6h, 84h, 40h, 06h
        db      01h, 0cbh
        endif
fn_3404B:
        push    ax
        int     0d1h
        pop     ax
        int     0d8h
        ret
fn_34052:
        mov     ax, 0e000h
        mov     word ptr [P_2C04], ax
        mov     es, ax
        sub     di, di
        mov     bl, 14h
loop_3405E:
        mov     si, P_2C76
        mov     cx, 210h
        rep movsb
        dec     bl
        jne     loop_3405E
        mov     word ptr [C0_FP_02C1E], di
        mov     word ptr [P_2C20], es
        ret
fn_34073:
        les     di, [C0_FP_02C02]
        cmp     byte ptr es:[di+206h], 0
        je      br_34080
        ret
br_34080:
        mov     byte ptr es:[di+206h], 1
        add     di, 0
        push    di
        mov     si, 777h
        mov     cx, 10h
        rep movsb
        pop     di
        mov     cx, 0eh
tgt_34096:
        mov     ah, byte ptr es:[di]
        cmp     ah, 20h
        je      br_340A1
        inc     di
        loop    tgt_34096
br_340A1:
        mov     ax, word ptr [C0_W_02BFE]
        inc     al
        sub     ah, ah
        mov     bh, 0ah
        div     bh
        or      ax, 3030h
        mov     word ptr es:[di], ax
        ret
far_340B3:
        call    EP_FN_280BD_OFF+APP3_CSBASE
        je      L_340B9
        retf
L_340B9:
        mov     byte ptr [A2_B_00F2E], 0
        mov     al, 3
        mov     byte ptr [C0_B_00F2F], al
        int     0adh
        callf   EP_SEQ_NAMES_FETCH_SEG:EP_SEQ_NAMES_FETCH_OFF
        mov     word ptr [A2_W_SEQ_SEG], 0f000h
        mov     byte ptr [C0_B_02AD7], 0
        mov     bl, 1bh
        int     87h
        callf   [C0_W_02BF0]
        mov     ax, word ptr [C0_W_02BFE]
        push    cs
        call    L_344AE
        retf
fn_340E5:
        pop     si
        push    si
        sub     si, 3
        if      FW_VERSION >= 112
        mov     word ptr [C0_W_02BF0], si
        int     0a4h
        KEY_DOWN        20h, EP_FAR_3412E_OFF, APP3_SEG
        if      FW_VERSION >= 114
        KEY_DOWN        02h, L_33842-APP3_CSBASE, APP3_SEG
        KEY_DOWN        26h, L_33842-APP3_CSBASE, APP3_SEG
        KEY_DOWN        13h, L_3579F-APP3_CSBASE, APP3_SEG
        KEY_DOWN        0dh, EP_L_26957_OFF, APP3_SEG
        call    EP_FN_280BD_OFF+APP3_CSBASE
        else
        KEY_DOWN        02h, (C0_BASE+L_33842-APP3_SEG*16), APP3_SEG
        KEY_DOWN        26h, (C0_BASE+L_33842-APP3_SEG*16), APP3_SEG
        KEY_DOWN        13h, (C0_BASE+L_3579F-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0dh, EP_L_26957_OFF, APP3_SEG
        db      0e8h, 0b0h
        aas
        endif
        je      br_3411E
        ret
br_3411E:
        call    far_353AF
        ret
L_33842:
        call    EP_FN_280BD_OFF+APP3_CSBASE
        je      L_33B3A
        retf
L_33B3A:
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
far_3412E:
        call    fn_34136
        call    word ptr [C0_W_CURSOR_FN]
        else
        mov     word ptr [C0_W_02BE0_2], si
        int     0a4h
        KEY_DOWN        20h, EP_FAR_3412E_OFF, APP3_SEG
        KEY_DOWN        02h, (C0_BASE+L_33842-APP3_SEG*16), APP3_SEG
        KEY_DOWN        26h, (C0_BASE+L_33842-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 110
        KEY_DOWN        13h, EP_L_3579F_OFF, APP3_SEG
        KEY_DOWN        0dh, EP_L_26957_OFF, APP3_SEG
        call    EP_FN_280BD_OFF+APP3_CSBASE
        je      br_3411E
        ret
br_3411E:
        call    far_353AF
        ret
L_33842:
        call    EP_FN_280BD_OFF+APP3_CSBASE
        je      L_33B3A
        retf
L_33B3A:
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
FAR_3412E:
        call    fn_34136
        call    word ptr [C0_W_02BF4]
        else
        KEY_DOWN        13h, (C0_BASE+L_3579F-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0dh, EP_L_26957_OFF, APP3_SEG
        db      0e8h, 0d4h
        aas
        je      br_3411E
        ret
br_3411E:
        call    far_353AF
        ret
L_33842:
        call    EP_FN_280BD_OFF+APP3_CSBASE
        je      L_33B3A
        retf
L_33B3A:
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
far_3412E:
        call    fn_34136
        call    word ptr [C0_W_CURSOR_FN]
        endif
        endif
        retf
fn_34136:
        DISP_CLEAR
        if      FW_VERSION >= 110
        DISP_TEXT       04h, 02h, "Song:  -                "
        DISP_TEXT       0aah, 01h, "Now:         "
        else
        DISP_TEXT       6h, 02h, "Song:  -                "
        DISP_TEXT       0a8h, 01h, "Now:         "
        endif
        DISP_TEXT       06h, 0dh, "TEMPO:      Step      Sequence      Reps"
        DISP_TEXT       06h, 15h, "    \\:     "
        DISP_TEXT       06h, 24h, " LOOP:   "
        if      FW_VERSION >= 110
        DISP_HLINE      00h, 00h, 95h
        DISP_HDOTS      00h, 0ah, 95h
        else
        DISP_HLINE      00h, 00h, 97h
        DISP_HDOTS      00h, 0ah, 97h
        endif
        DISP_HLINE      96h, 0ah, 62h
        DISP_HLINE      00h, 30h, 0f8h
        DISP_HLINE      01h, 31h, 0f7h
        DISP_VLINE      00h, 00h, 30h
        if      FW_VERSION >= 110
        DISP_VLINE      95h, 00h, 0bh
        DISP_VLINE      96h, 01h, 0ah
        else
        DISP_VLINE      97h, 00h, 0bh
        DISP_VLINE      98h, 01h, 0ah
        endif
        DISP_VLINE      0f6h, 0ah, 26h
        DISP_VLINE      0f7h, 0bh, 25h
        DISP_HDOTS      4bh, 15h, 0ach
        DISP_VDOTS      4bh, 0bh, 26h
        DISP_VDOTS      67h, 0bh, 26h
        DISP_VDOTS      0dbh, 0bh, 26h
        DISP_SOFTKEY    04h, DISP_SK_BOX,    "CONVRT"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DELETE"
        DISP_SOFTKEY    06h, DISP_SK_BOX,    "INSERT"
        if      FW_VERSION >= 110
        if      FW_VERSION >= 112
        db      0e8h
        xor     al, 2
        call    fn_342D1
        call    fn_342F0
        call    fn_3436D
        call    fn_343BF
        call    fn_34455
        les     si, [C0_FP_02C02]
        mov     al, byte ptr es:[si+209h]
        mov     cl, 2ah
        mov     ch, 24h
        call    EP_FN_26D9C_OFF+APP3_CSBASE
        ret
cb_33C65:
        DISP_CURSOR     21h, 2, 75h
        ret
cb_3341E:
        DISP_CURSOR     0c2h, 1, 13h
        ret
cb_33C77:
        DISP_CURSOR     0dah, 1, 0dh
        ret
cb_33C80:
        DISP_CURSOR     0ech, 1, 0dh
        ret
cb_33997_111:
        DISP_CURSOR     0c2h, 1, 37h
        ret
cb_33C92:
        DISP_CURSOR     29h, 0dh, 15h
        ret
cb_33C9B:
        DISP_CURSOR     29h, 15h, 1dh
        ret
cb_33CA4:
        DISP_CURSOR     2ah, 24h, 13h
        ret
cb_33CAD:
        DISP_CURSOR     4dh, 1fh, 1bh
        ret
cb_33CB6:
        DISP_CURSOR     69h, 1fh, 73h
        ret
cb_33CBF:
        DISP_CURSOR     0e4h, 1fh, 0dh
        ret
cvt_cur_from:
        DISP_CURSOR     68h, 10h, 73h
        ret
cvt_cur_to:
        DISP_CURSOR     68h, 1ah, 73h
        ret
cvt_cur_status:
        DISP_CURSOR     68h, 28h, 79h
        ret
fn_342D1:
        mov     ax, word ptr [C0_W_02BFE]
        inc     al
        else
        db      0e8h, 34h, 02h, 0e8h, 9bh, 00h, 0e8h, 0b7h, 00h, 0e8h
        db      31h, 01h, 0e8h, 80h, 01h, 0e8h, 13h, 02h, 0c4h, 36h, 0f2h, 2bh, 26h, 8ah, 84h, 09h
        if      FW_VERSION >= 111
        db      02h, 0b1h, 2ah, 0b5h, 24h, 0e8h, 5ah, 2bh, 0c3h
        else
        db      02h, 0b1h, 2ah, 0b5h, 24h, 0e8h, 68h, 2bh, 0c3h
        endif
cb_33973:
        db      0b1h, 21h, 0b5h, 02h, 0b0h, 75h, 0cdh
        db      0b0h, 0c3h
cb_3397C_111:
        db      0b1h, 0c2h, 0b5h, 01h, 0b0h, 13h, 0cdh, 0b0h, 0c3h
cb_33985_111:
        db      0b1h, 0dah, 0b5h, 01h, 0b0h
        db      0dh, 0cdh, 0b0h, 0c3h
cb_3398E_111:
        db      0b1h, 0ech, 0b5h, 01h, 0b0h, 0dh, 0cdh, 0b0h, 0c3h
cb_33997_111:
        db      0b1h, 0c2h, 0b5h
        db      01h, 0b0h, 37h, 0cdh, 0b0h, 0c3h
cb_339A0_111:
        db      0b1h, 29h, 0b5h, 0dh, 0b0h, 15h, 0cdh, 0b0h, 0c3h
cb_339A9_111:
        db      0b1h
        db      29h, 0b5h, 15h, 0b0h, 1dh, 0cdh, 0b0h, 0c3h
cb_33CA4:
        db      0b1h, 2ah, 0b5h, 24h, 0b0h, 13h, 0cdh, 0b0h
        db      0c3h
cb_33CAD:
        db      0b1h, 4dh, 0b5h, 1fh, 0b0h, 1bh, 0cdh, 0b0h, 0c3h
cb_339C4:
        db      0b1h, 69h, 0b5h, 1fh, 0b0h, 73h
        db      0cdh, 0b0h, 0c3h
cb_33CBF:
        db      0b1h, 0e4h, 0b5h, 1fh, 0b0h, 0dh, 0cdh, 0b0h, 0c3h
cvt_cur_from:
        db      0b1h, 68h, 0b5h, 10h
        db      0b0h, 73h, 0cdh, 0b0h, 0c3h
cvt_cur_to:
        db      0b1h, 68h, 0b5h, 1ah, 0b0h, 73h, 0cdh, 0b0h, 0c3h
cvt_cur_status:
        db      0b1h, 68h
        db      0b5h, 28h, 0b0h, 79h, 0cdh, 0b0h, 0c3h, 0a1h, 0eeh, 2bh, 0feh, 0c0h
        endif
        DISP_NUM0       22h, 02h, 02h
        if      FW_VERSION >= 112
        les     si, [C0_FP_02C02]
        add     si, 0
        mov     dx, es
        mov     cl, 34h
        mov     ch, 2
        mov     ah, 10h
        mov     bl, 5
        int     90h
        ret
fn_342F0:
        mov     bx, word ptr [C0_W_02C0A]
        cmp     bl, 0
        je      br_34303
        dec     bl
        mov     ch, 17h
        call    fn_34311
        jae     br_34303
        ret
br_34303:
        mov     ch, 1fh
        call    fn_34311
        jae     br_3430B
        ret
br_3430B:
        mov     ch, 27h
        call    fn_34311
        ret
fn_34311:
        mov     al, bl
        mov     ah, 0
        shl     ax, 1
        add     ax, 10h
        les     si, [C0_FP_02C02]
        add     si, ax
        mov     dx, word ptr es:[si]
        cmp     dl, 0ffh
        je      br_3434E
        push    bx
        mov     al, bl
        inc     al
        mov     ah, 0
        mov     cl, 52h
        mov     bh, 3
        mov     bl, 0ah
        int     90h
        mov     cl, 69h
        mov     al, dl
        pusha
        call    EP_FN_27FF8_OFF+APP3_CSBASE
        popa
        mov     al, dh
        mov     bh, 2
        mov     cl, 0e4h
        mov     bl, 0ah
        int     90h
        pop     bx
        inc     bx
        clc
        ret
br_3434E:
        mov     cl, 69h
        mov     si, (C0_BASE+str_3435D-APP3_SEG*16)
        mov     ah, 10h
        mov     dx, cs
        mov     bl, 5
        int     90h
        stc
        ret
str_3435D:
        db      "   (end of song)"
fn_3436D:
        mov     dx, ds
        DISP_TEXT_IDX   2ah, 0dh, 00716h, TBL_MAS_SEQ_LABELS
        int     88h
        cmp     al, 0
        je      br_34390
        cmp     bh, 0
        je      br_34390
        else
        db      0c4h, 36h, 0f2h, 2bh, 83h, 0c6h, 00h, 8ch, 0c2h, 0b1h, 34h, 0b5h, 02h, 0b4h
        db      10h, 0b3h, 05h, 0cdh, 90h, 0c3h, 8bh, 1eh, 0fah, 2bh, 80h, 0fbh, 00h, 74h, 0ah, 0feh
        db      0cbh, 0b5h, 17h, 0e8h, 11h, 00h, 73h, 01h, 0c3h, 0b5h, 1fh, 0e8h, 09h, 00h, 73h, 01h
        db      0c3h, 0b5h, 27h, 0e8h, 01h, 00h, 0c3h, 8ah, 0c3h, 0b4h, 00h, 0d1h, 0e0h, 05h, 10h, 00h
        db      0c4h, 36h, 0f2h, 2bh, 03h, 0f0h, 26h, 8bh, 14h, 80h, 0fah, 0ffh, 74h, 26h, 53h, 8ah
        db      0c3h, 0feh, 0c0h, 0b4h, 00h, 0b1h, 52h, 0b7h, 03h, 0b3h, 0ah, 0cdh, 90h, 0b1h, 69h, 8ah
        if      FW_VERSION >= 111
        db      0c2h, 60h, 0e8h, 0c9h, 3ch, 61h, 8ah, 0c6h, 0b7h, 02h, 0b1h, 0e4h, 0b3h, 0ah, 0cdh, 90h
        db      5bh, 43h, 0f8h, 0c3h, 0b1h, 69h, 0beh, 9dh, 0dbh, 0b4h, 10h, 8ch, 0cah, 0b3h, 05h, 0cdh
        else
        db      0c2h, 60h, 0e8h, 0cah, 3ch, 61h, 8ah, 0c6h, 0b7h, 02h, 0b1h, 0e4h, 0b3h, 0ah, 0cdh, 90h
        db      5bh, 43h, 0f8h, 0c3h, 0b1h, 69h, 0beh, 8fh, 0dbh, 0b4h, 10h, 8ch, 0cah, 0b3h, 05h, 0cdh
        endif
        db      90h, 0f9h, 0c3h
        db      "   (end of so"
        db      6eh, 67h, 29h, 8ch, 0dah
        DISP_TEXT_IDX   2ah, 0dh, 00716h, 02c22h
        db      0cdh
        db      88h, 3ch, 00h, 74h, 11h, 80h, 0ffh, 00h, 74h, 0ch
        endif
        else
        db      0e8h
        sub     ax, word ptr [bp+si]
        call    fn_342D1
        call    fn_342F0
        call    fn_3436D
        call    fn_343BF
        db      0e8h, 2eh, 02h
        les     si, [C0_FP_02C02]
        mov     al, byte ptr es:[si+209h]
        mov     cl, 2ah
        mov     ch, 24h
        call    EP_FN_26D9C_OFF+APP3_CSBASE
        ret
cb_33C65:
        DISP_CURSOR     23h, 2, 75h
        ret
cb_3341E:
        DISP_CURSOR     0c0h, 1, 13h
        ret
cb_33C77:
        DISP_CURSOR     0d8h, 1, 0dh
        ret
cb_33C80:
        DISP_CURSOR     0eah, 1, 0dh
        ret
cb_33997_111:
        DISP_CURSOR     0c0h, 1, 37h
        ret
cb_33C92:
        DISP_CURSOR     29h, 0dh, 15h
        ret
cb_33C9B:
        DISP_CURSOR     29h, 15h, 1dh
        ret
cb_33CA4:
        DISP_CURSOR     2ah, 24h, 13h
        ret
cb_33CAD:
        mov     cl, 4dh
        mov     ch, 1fh
        mov     al, 1bh
        int     0b0h
        ret
cb_339C4:
        mov     cl, 69h
        mov     ch, 1fh
        mov     al, 73h
        int     0b0h
        ret
cb_33CBF:
        mov     cl, 0e4h
        mov     ch, 1fh
        mov     al, 0dh
        int     0b0h
        ret
cvt_cur_from:
        db      0b1h, 68h, 0b5h, 10h
        db      0b0h, 73h, 0cdh, 0b0h, 0c3h
cvt_cur_to:
        db      0b1h, 68h, 0b5h, 1ah, 0b0h, 73h, 0cdh, 0b0h, 0c3h
cvt_cur_status:
        db      0b1h, 68h
        mov     ch, 28h
        mov     al, 79h
        int     0b0h
        ret
fn_342D1:
        mov     ax, word ptr [C0_W_02BFE]
        inc     al
        DISP_NUM0       24h, 02h, 02h
        les     si, [C0_FP_02C02]
        add     si, 0
        mov     dx, es
        mov     cl, 36h
        mov     ch, 2
        mov     ah, 10h
        mov     bl, 5
        int     90h
        ret
fn_342F0:
        mov     bx, word ptr [C0_W_02C0A]
        cmp     bl, 0
        je      br_34303
        dec     bl
        mov     ch, 17h
        call    fn_34311
        jae     br_34303
        ret
br_34303:
        mov     ch, 1fh
        call    fn_34311
        jae     br_3430B
        ret
br_3430B:
        mov     ch, 27h
        call    fn_34311
        ret
fn_34311:
        mov     al, bl
        mov     ah, 0
        shl     ax, 1
        add     ax, 10h
        les     si, [C0_FP_02C02]
        add     si, ax
        mov     dx, word ptr es:[si]
        cmp     dl, 0ffh
        je      br_3434E
        push    bx
        mov     al, bl
        inc     al
        mov     ah, 0
        mov     cl, 52h
        mov     bh, 3
        mov     bl, 0ah
        int     90h
        mov     cl, 69h
        mov     al, dl
        pusha
        call    EP_FN_27FF8_OFF+APP3_CSBASE
        popa
        mov     al, dh
        mov     bh, 2
        mov     cl, 0e4h
        mov     bl, 0ah
        int     90h
        pop     bx
        inc     bx
        clc
        ret
br_3434E:
        mov     cl, 69h
        mov     si, (C0_BASE+str_3351F_107-APP3_SEG*16)
        mov     ah, 10h
        mov     dx, cs
        mov     bl, 5
        int     90h
        stc
        ret
str_3351F_107:
        db      "   (end of song)"
fn_3436D:
        mov     dx, ds
        DISP_TEXT_IDX   2ah, 0dh, 00716h, 02c22h
        int     88h
        cmp     al, 0
        je      br_34390
        cmp     bh, 0
        je      br_34390
        endif
        DISP_TEXT       28h, 15h, "(Ext)"
        db      0c3h
br_34390:
        DISP_TEXT       3bh, 15h, "."
        db      0a1h, 14h, 07h
        cmp     byte ptr [A3_B_00716], 0
        je      br_343A9
        mov     es, word ptr [A3_W_00F10]
        mov     ax, word ptr es:[16h]
br_343A9:
        sub     dx, dx
        mov     bx, 0ah
        div     bx
        push    dx
        DISP_NUM        2ah, 15h, 03h
        db      58h
        DISP_NUM        3fh, 15h, 01h
        if      FW_VERSION >= 110
        if      FW_VERSION >= 112
        db      0c3h
fn_343BF:
        cmp     byte ptr [A3_B_00718], 0
        jne     br_343F8
        mov     ax, word ptr [C0_W_02C0A]
        mov     bx, 18h
        mul     bx
        les     si, [C0_FP_02C1E]
        add     si, ax
        mov     ax, word ptr es:[si+0eh]
        mul     word ptr [C0_W_02C10]
        add     ax, word ptr es:[si]
        push    ax
        int     86h
        pop     bx
        add     ax, bx
        cmp     ax, 3e7h
        jb      br_343ED
        mov     ax, 3e7h
br_343ED:
        mov     word ptr [P_2C18], ax
        mov     cl, 0c2h
        mov     ch, 1
        call    EP_FN_280DD_OFF+APP3_CSBASE
        ret
br_343F8:
        else
        db      0c3h, 80h, 3eh, 18h, 07h, 00h, 75h, 32h, 0a1h, 0fah, 2bh, 0bbh
        db      18h, 00h, 0f7h, 0e3h, 0c4h, 36h, 0eh, 2ch, 03h, 0f0h, 26h, 8bh, 44h, 0eh, 0f7h, 26h
        db      00h, 2ch, 26h, 03h, 04h, 50h, 0cdh, 86h, 5bh, 03h, 0c3h, 3dh, 0e7h, 03h, 72h, 03h
        if      FW_VERSION >= 111
        db      0b8h, 0e7h, 03h, 0a3h, 08h, 2ch, 0b1h, 0c2h, 0b5h, 01h, 0e8h, 0f6h, 3ch, 0c3h
        else
        db      0b8h, 0e7h, 03h, 0a3h, 08h, 2ch, 0b1h, 0c2h, 0b5h, 01h, 0e8h, 0f7h, 3ch, 0c3h
        endif
        endif
        DISP_TEXT       0aah, 01h, "Now:  H  M  S"
        else
        db      0c3h
fn_343BF:
        cmp     byte ptr [A3_B_00718], 0
        jne     br_343F8
        mov     ax, word ptr [C0_W_02C0A]
        mov     bx, 16h
        mul     bx
        les     si, [C0_FP_02C1E]
        add     si, ax
        mov     ax, word ptr es:[si+0ch]
        mul     word ptr [C0_W_02C10]
        add     ax, word ptr es:[si]
        push    ax
        int     86h
        pop     bx
        add     ax, bx
        cmp     ax, 3e7h
        jb      br_343ED
        mov     ax, 3e7h
br_343ED:
        mov     word ptr [C0_W_02C08], ax
        mov     cl, 0c0h
        mov     ch, 1
        call    EP_FN_280DD_OFF+APP3_CSBASE
        ret
br_343F8:
        DISP_TEXT       0a8h, 01h, "Now:  H  M  S"
        endif
        call    fn_3561B
        push    ax
        push    dx
        int     76h
        mov     di, 3e8h
        mov     si, 0
        int     0b8h
        pop     cx
        pop     bx
        add     ax, bx
        adc     dx, cx
        mov     di, 0ee80h
        mov     si, 36h
        int     0b8h
        push    ax
        mov     ax, di
        mov     dx, si
        mov     di, 0ea60h
        mov     si, 0
        int     0b8h
        push    ax
        mov     ax, di
        mov     dx, 0
        mov     cx, 3e8h
        div     cx
        if      FW_VERSION >= 110
        DISP_NUM0       0e6h, 01h, 02h
        else
        DISP_NUM0       0e4h, 01h, 02h
        endif
        pop     ax
        if      FW_VERSION >= 110
        DISP_NUM0       0d4h, 01h, 02h
        else
        DISP_NUM0       0d2h, 01h, 02h
        endif
        pop     ax
        if      FW_VERSION >= 110
        DISP_NUM0       0c2h, 01h, 02h
        else
        DISP_NUM0       0c0h, 01h, 02h
        endif
        ret
        if      FW_VERSION >= 110
fn_34455:
        cmp     byte ptr [A3_B_0071C], 0ch
        jne     br_3445D
        ret
br_3445D:
        mov     si, 22h
        DISP_BMP        98h, 00h, 22h
        else
        DISP_CURSOR     0c0h, 1, 37h
        endif
        ret
        cmp     byte ptr [A3_B_00719], 0
        jne     br_3446F
        ret
br_3446F:
        mov     si, 23h
        if      FW_VERSION >= 110
        DISP_BMP        0a1h, 00h, 23h
        ret
L_33E8B:
        if      FW_VERSION >= 112
        call    fn_340E5
        mov     word ptr [C0_W_CURSOR_FN], cb_33C65-APP3_CSBASE
        if      FW_VERSION >= 114
        FIELD_ENTRY     ds, C0_W_02BFE, 1, 0, 14h, L_344AE-APP3_CSBASE
        KEY_DOWN        16h, L_34640-APP3_CSBASE, APP3_SEG
        else
        mov     cx, ds
        mov     si, 2beeh
        mov     bl, 1
        mov     bh, 0
        mov     dx, 14h
        mov     di, (C0_BASE+L_344AE-APP3_SEG*16)
        int     7eh
        KEY_DOWN        16h, (C0_BASE+L_34640-APP3_SEG*16), APP3_SEG
        endif
        else
        db      0e8h, 69h, 0fch
        mov     word ptr [C0_W_CURSOR_FN], cb_33973-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0eeh, 2bh, 0b3h, 01h
        if      FW_VERSION >= 111
        db      0b7h, 00h, 0bah, 14h, 00h, 0bfh, 0eeh, 0dch, 0cdh, 7eh
        else
        db      0b7h, 00h, 0bah, 14h, 00h, 0bfh, 0e0h, 0dch, 0cdh, 7eh
        endif
        KEY_DOWN        16h, EP_L_34640_OFF, APP3_SEG
        endif
        KEY_CURSOR      0000h, 0000h, EP_L_34217_OFF, APP3_SEG, 0000h, 0000h, EP_L_3437C_OFF, APP3_SEG
        else
        DISP_BMP        9ah, 00h, 23h
        db      0c3h, 80h
        db      3eh, 1ch, 07h
        or      al, 75h
        db      01h, 0c3h
        mov     si, 22h
        DISP_BMP        9ah, 00h, 22h
        db      0c3h
L_33E8B:
        db      0e8h
        pusha
        cld
        mov     word ptr [C0_W_CURSOR_FN], cb_33C65-APP3_CSBASE
        FIELD_ENTRY     ds, 2beeh, 1, 0, 14h, L_344AE-APP3_CSBASE
        KEY_DOWN        16h, (C0_BASE+L_34640-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      0000h, 0000h, EP_L_34217_OFF, APP3_SEG, 0000h, 0000h, (C0_BASE+L_34C5C-APP3_SEG*16), APP3_SEG
        endif
        retf
L_344AE:
        mov     ah, 0
        mov     bx, 210h
        mul     bx
        mov     word ptr [C0_FP_02C02], ax
        mov     word ptr [C0_W_02C0A], 0
        call    fn_344F5
        call    fn_344C5
        retf
fn_344C5:
        mov     word ptr [C0_W_02C10], 0
        call    fn_344E0
        mov     ah, 0
        mov     word ptr [P_2C0C], ax
        je      br_344D9
        int     0ech
        clc
        ret
br_344D9:
        mov     ax, 63h
        int     0ech
        stc
        ret
fn_344E0:
        les     si, [C0_FP_02C02]
        add     si, 10h
        mov     bx, word ptr [C0_W_02C0A]
        shl     bx, 1
        add     si, bx
        mov     ax, word ptr es:[si]
        cmp     al, 0ffh
        ret
fn_344F5:
        call    fn_3461B
        les     di, [C0_FP_02C1E]
        push    di
        sub     ax, ax
        if      FW_VERSION >= 110
        mov     cx, 0bb8h
        else
        mov     cx, 0abeh
        endif
        rep stosw
        pop     di
        if      FW_VERSION >= 110
        add     di, 18h
        else
        add     di, 16h
        endif
        les     si, [C0_FP_02C02]
        add     si, 10h
loop_3450F:
        mov     ax, word ptr es:[si]
        cmp     al, 0ffh
        jne     br_34519
        jmp     br_345ED
br_34519:
        push    es
        push    ax
        push    si
        push    di
        push    bp
        mov     ah, 0
        int     0deh
        pop     bp
        pop     di
        pop     si
        pop     ax
        pop     es
        mov     bl, ah
        mov     bh, 0
        push    ds
        mov     ds, dx
        cmp     byte ptr [C0_B_00012], 0
        jne     br_34538
        jmp     br_345BC
br_34538:
        mov     ax, word ptr [C0_W_0001A]
        mov     word ptr es:[di-0ah], ax
        mul     bx
        if      FW_VERSION >= 110
        add     ax, word ptr es:[di-18h]
        adc     dx, word ptr es:[di-16h]
        else
        add     ax, word ptr es:[di-16h]
        adc     dx, word ptr es:[di-14h]
        endif
        mov     word ptr es:[di], ax
        mov     word ptr es:[di+2], dx
        mov     ax, word ptr [C0_W_0001C]
        mov     dx, word ptr [C0_W_0001E]
        mov     word ptr es:[di-8], ax
        mov     word ptr es:[di-6], dx
        push    si
        push    di
        push    bx
        push    bp
        mov     cx, bx
        int     8bh
        pop     bp
        pop     bx
        pop     di
        pop     si
        if      FW_VERSION >= 110
        add     ax, word ptr es:[di-14h]
        adc     dx, word ptr es:[di-12h]
        else
        add     ax, word ptr es:[di-12h]
        adc     dx, word ptr es:[di-10h]
        endif
        mov     word ptr es:[di+4], ax
        mov     word ptr es:[di+6], dx
        mov     ax, word ptr ds:[bp]
        mov     dx, word ptr ds:[bp+2]
        mov     word ptr es:[di-4], ax
        mov     word ptr es:[di-2], dx
        push    si
        push    di
        push    bx
        push    bp
        mov     cx, bx
        int     8bh
        pop     bp
        pop     bx
        pop     di
        pop     si
        if      FW_VERSION >= 110
        add     ax, word ptr es:[di-10h]
        adc     dx, word ptr es:[di-0eh]
        mov     cx, 0
        adc     cx, word ptr es:[di-0ch]
        else
        add     ax, word ptr es:[di-0eh]
        adc     dx, word ptr es:[di-0ch]
        endif
        mov     word ptr es:[di+8], ax
        mov     word ptr es:[di+0ah], dx
        if      FW_VERSION >= 110
        mov     word ptr es:[di+0ch], cx
        endif
loop_345B2:
        pop     ds
        if      FW_VERSION >= 110
        add     di, 18h
        else
        add     di, 16h
        endif
        add     si, 2
        jmp     loop_3450F
br_345BC:
        if      FW_VERSION >= 110
        mov     ax, word ptr es:[di-18h]
        mov     dx, word ptr es:[di-16h]
        else
        mov     ax, word ptr es:[di-16h]
        mov     dx, word ptr es:[di-14h]
        endif
        mov     word ptr es:[di], ax
        mov     word ptr es:[di+2], dx
        if      FW_VERSION >= 110
        mov     ax, word ptr es:[di-14h]
        mov     dx, word ptr es:[di-12h]
        else
        mov     ax, word ptr es:[di-12h]
        mov     dx, word ptr es:[di-10h]
        endif
        mov     word ptr es:[di+4], ax
        mov     word ptr es:[di+6], dx
        if      FW_VERSION >= 110
        mov     ax, word ptr es:[di-14h]
        mov     dx, word ptr es:[di-12h]
        else
        mov     ax, word ptr es:[di-12h]
        mov     dx, word ptr es:[di-10h]
        endif
        mov     word ptr es:[di+4], ax
        mov     word ptr es:[di+6], dx
        jmp     loop_345B2
br_345ED:
        mov     ax, word ptr [C0_W_0001A]
        mov     word ptr es:[di-0ah], ax
        mov     ax, word ptr [C0_W_0001C]
        mov     dx, word ptr [C0_W_0001E]
        mov     word ptr es:[di-8], ax
        mov     word ptr es:[di-6], dx
        mov     ax, word ptr ds:[bp]
        mov     dx, word ptr ds:[bp+2]
        mov     word ptr es:[di-4], ax
        mov     word ptr es:[di-2], dx
        sub     ax, ax
        if      FW_VERSION >= 110
        mov     cx, 0ch
        else
        mov     cx, 0bh
        endif
        rep stosw
        ret
fn_3461B:
        cmp     byte ptr [C0_B_00716], 0
        je      br_34631
        cmp     byte ptr [C0_B_00787], 0
        je      br_3462D
        mov     bp, 20h
        ret
br_3462D:
        mov     bp, 24h
        ret
br_34631:
        cmp     byte ptr [C0_B_00787], 0
        je      br_3463C
        mov     bp, 28h
        ret
br_3463C:
        mov     bp, 2ch
        ret
L_34640:
        call    EP_FN_280BD_OFF+APP3_CSBASE
        je      br_34646
        retf
br_34646:
        call    fn_34073
        callf   [P_2BF6]
        retf
L_3464E:
        DISP_WIN_WIDE   "SONG"
        DISP_TEXT       20h, 10h, "    Song name:"
        DISP_TEXT       20h, 1dh, " Default name:"
        DISP_SOFTKEY    02h, DISP_SK_BOX,    "DELETE"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "COPY"
        DISP_HDOTS      1ah, 1ah, 0c4h
        les     si, [C0_FP_02C02]
        add     si, 0
        mov     dx, es
        mov     cl, 74h
        mov     ch, 10h
        mov     ah, 10h
        mov     bl, 5
        int     90h
        mov     si, 777h
        mov     dx, ds
        mov     cl, 74h
        mov     ch, 1dh
        mov     ah, 10h
        mov     bl, 5
        int     90h
        call    word ptr [C0_W_02BFA]
        retf
cb_340DF:
        DISP_CURSOR     74h, 10h, 7
        ret
L_346D6:
        DISP_CURSOR     74h, 1dh, 7
        ret
L_346DF:
        dw      06c7h, P_2BF6
        if      FW_VERSION >= 112
        if      FW_VERSION >= 120
        das
        db      0dfh
        else
        db      21h, 0dfh
        endif
        mov     word ptr [C0_W_02BFA], cb_340DF-APP3_CSBASE
        elseif  FW_VERSION >= 110
        if      FW_VERSION >= 111
        db      1fh
        else
        db      11h
        endif
        db      0dfh
        mov     word ptr [C0_W_02BEA], cb_340DF-APP3_CSBASE
        else
        db      0deh, 0deh
        mov     word ptr [C0_W_02BFA], cb_340DF-APP3_CSBASE
        endif
        int     0a4h
        if      FW_VERSION >= 112
        KEY_DOWN        20h, L_3464E-APP3_CSBASE, APP3_SEG
        KEY_DOWN        1ah, L_3475D-APP3_CSBASE, APP3_SEG
        if      FW_VERSION >= 114
        KEY_DOWN        11h, L_347E3-APP3_CSBASE, APP3_SEG
        else
        KEY_DOWN        11h, (C0_BASE+L_347E3-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        13h, EP_FAR_340B3_OFF, EP_FAR_340B3_SEG
        KEY_DOWN        14h, L_34976-APP3_CSBASE, APP3_SEG
        else
        KEY_DOWN        20h, (C0_BASE+L_3464E-APP3_SEG*16), APP3_SEG
        KEY_DOWN        1ah, (C0_BASE+L_3475D-APP3_SEG*16), APP3_SEG
        KEY_DOWN        11h, (C0_BASE+L_347E3-APP3_SEG*16), APP3_SEG
        KEY_DOWN        13h, EP_FAR_340B3_OFF, EP_FAR_340B3_SEG
        KEY_DOWN        14h, (C0_BASE+L_34976-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        26h, EP_FAR_340B3_OFF, EP_FAR_340B3_SEG
        KEY_DOWN        16h, EP_FAR_340B3_OFF, EP_FAR_340B3_SEG
        if      FW_VERSION >= 110
        if      FW_VERSION >= 114
        KEY_WHEEL       L_33F6C-APP3_CSBASE, APP3_SEG
        KEY_DOWN        22h, L_33F6C-APP3_CSBASE, APP3_SEG
        KEY_DOWN        17h, L_33F6C-APP3_CSBASE, APP3_SEG
        KEY_DIGITS      L_33F6C-APP3_CSBASE, APP3_SEG
        KEY_DOWN        18h, L_33F6C-APP3_CSBASE, APP3_SEG
        if      FW_VERSION >= 120
L_33F6C                         equ     $+1
        retf
        else
        db      0cbh
L_33F6C:
        endif
        les     si, [C0_FP_02C02]
        else
        if      FW_VERSION >= 112
        KEY_WHEEL       (C0_BASE+L_33F6C-APP3_SEG*16), APP3_SEG
        KEY_DOWN        22h, (C0_BASE+L_33F6C-APP3_SEG*16), APP3_SEG
        KEY_DOWN        17h, (C0_BASE+L_33F6C-APP3_SEG*16), APP3_SEG
        KEY_DIGITS      (C0_BASE+L_33F6C-APP3_SEG*16), APP3_SEG
        KEY_DOWN        18h, (C0_BASE+L_33F6C-APP3_SEG*16), APP3_SEG
        else
        KEY_WHEEL       EP_L_33E6A_OFF, APP3_SEG
        KEY_DOWN        22h, EP_L_33E6A_OFF, APP3_SEG
        KEY_DOWN        17h, EP_L_33E6A_OFF, APP3_SEG
        KEY_DIGITS      EP_L_33E6A_OFF, APP3_SEG
        KEY_DOWN        18h, EP_L_33E6A_OFF, APP3_SEG
        endif
        retf
L_33F6C:
        les     si, [C0_W_02BF2]
        endif
        else
        KEY_WHEEL       (C0_BASE+L_33F6C-APP3_SEG*16), APP3_SEG
        KEY_DOWN        22h, (C0_BASE+L_33F6C-APP3_SEG*16), APP3_SEG
        KEY_DOWN        17h, (C0_BASE+L_33F6C-APP3_SEG*16), APP3_SEG
        KEY_DIGITS      (C0_BASE+L_33F6C-APP3_SEG*16), APP3_SEG
        KEY_DOWN        18h, (C0_BASE+L_33F6C-APP3_SEG*16), APP3_SEG
        retf
L_33F6C:
        les     si, [C0_W_02BF2]
        endif
        add     si, 0
        mov     dx, es
        mov     ah, 10h
        if      FW_VERSION >= 111
        mov     bx, 18ddh
        elseif  FW_VERSION >= 110
        mov     bx, 18d0h
        else
        mov     bx, 18c1h
        endif
        mov     cx, cs
        int     0b7h
        retf
L_3475D:
        if      FW_VERSION >= 112
        if      FW_VERSION >= 120
        mov     word ptr [C0_W_02BF6], L_3475D-APP3_CSBASE
        else
        mov     word ptr [C0_W_02BE6_2], L_3475D-APP3_CSBASE
        endif
        mov     word ptr [C0_W_02BFA], L_346D6-APP3_CSBASE
        int     0a4h
        KEY_DOWN        20h, L_3464E-APP3_CSBASE, APP3_SEG
        KEY_DOWN        19h, L_346DF-APP3_CSBASE, APP3_SEG
        if      FW_VERSION >= 114
        KEY_DOWN        11h, L_347E3-APP3_CSBASE, APP3_SEG
        KEY_DOWN        12h, L_347D0-APP3_CSBASE, APP3_SEG
        else
        KEY_DOWN        11h, (C0_BASE+L_347E3-APP3_SEG*16), APP3_SEG
        KEY_DOWN        12h, (C0_BASE+L_33FF2-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        13h, EP_FAR_340B3_OFF, EP_FAR_340B3_SEG
        KEY_DOWN        14h, L_34976-APP3_CSBASE, APP3_SEG
        else
        mov     word ptr [C0_W_02BF6], L_3475D-APP3_CSBASE
        mov     word ptr [C0_W_02BFA], L_346D6-APP3_CSBASE
        int     0a4h
        KEY_DOWN        20h, (C0_BASE+L_3464E-APP3_SEG*16), APP3_SEG
        KEY_DOWN        19h, (C0_BASE+L_346DF-APP3_SEG*16), APP3_SEG
        KEY_DOWN        11h, (C0_BASE+L_347E3-APP3_SEG*16), APP3_SEG
        KEY_DOWN        12h, (C0_BASE+L_33FF2-APP3_SEG*16), APP3_SEG
        KEY_DOWN        13h, EP_FAR_340B3_OFF, EP_FAR_340B3_SEG
        KEY_DOWN        14h, (C0_BASE+L_34976-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        26h, EP_FAR_340B3_OFF, EP_FAR_340B3_SEG
        KEY_DOWN        16h, EP_FAR_340B3_OFF, EP_FAR_340B3_SEG
        if      FW_VERSION >= 112
        if      FW_VERSION >= 114
        KEY_WHEEL       L_347D0-APP3_CSBASE, APP3_SEG
        KEY_DOWN        22h, L_347D0-APP3_CSBASE, APP3_SEG
        KEY_DOWN        17h, L_347D0-APP3_CSBASE, APP3_SEG
        KEY_DIGITS      L_347D0-APP3_CSBASE, APP3_SEG
        KEY_DOWN        18h, L_347D0-APP3_CSBASE, APP3_SEG
L_347D0                         equ     $+1
        else
        KEY_WHEEL       (C0_BASE+L_33FF2-APP3_SEG*16), APP3_SEG
        KEY_DOWN        22h, (C0_BASE+L_33FF2-APP3_SEG*16), APP3_SEG
        KEY_DOWN        17h, (C0_BASE+L_33FF2-APP3_SEG*16), APP3_SEG
        KEY_DIGITS      (C0_BASE+L_33FF2-APP3_SEG*16), APP3_SEG
        KEY_DOWN        18h, (C0_BASE+L_33FF2-APP3_SEG*16), APP3_SEG
        endif
        retf
L_33FF2:
        mov     si, 777h
        mov     dx, ds
        mov     cl, 74h
        mov     ch, 1dh
        mov     ah, 10h
        mov     bx, 18ddh
        mov     cx, cs
        int     0b7h
        retf
L_347E3:
        if      FW_VERSION >= 114
        if      FW_VERSION >= 120
        les     si, [C0_W_02C02]
        cmp     byte ptr es:[si+206h], 0
        else
        db      0c4h, 36h, 0f2h, 2bh, 26h, 80h, 0bch, 06h
        add     al, byte ptr [bx+si]
        endif
        else
        les     si, [C0_FP_02C02]
        cmp     byte ptr es:[si+206h], 0
        endif
        jne     L_34202
        retf
L_34202:
        int     0a4h
        KEY_DOWN        12h, L_348D1-APP3_CSBASE, APP3_SEG
        KEY_DOWN        13h, L_34640-APP3_CSBASE, APP3_SEG
        KEY_DOWN        14h, L_34965-APP3_CSBASE, APP3_SEG
        KEY_DOWN        16h, L_34640-APP3_CSBASE, APP3_SEG
        KEY_DOWN        20h, L_3482C-APP3_CSBASE, APP3_SEG
        mov     cx, ds
        mov     si, C0_W_02BFE
        mov     bl, 1
        mov     bh, 0
        mov     dx, 14h
        mov     di, P_DCFE
        int     7eh
        retf
L_3482C:
        DISP_WIN        32h, 06h, 0beh, 36h, "Delete Song"
        if      FW_VERSION >= 120
        DISP_TEXT       3ah, 11h, "Song:  -"
        endif
        else
        KEY_WHEEL       (C0_BASE+L_33FF2-APP3_SEG*16), APP3_SEG
        KEY_DOWN        22h, (C0_BASE+L_33FF2-APP3_SEG*16), APP3_SEG
        KEY_DOWN        17h, (C0_BASE+L_33FF2-APP3_SEG*16), APP3_SEG
        KEY_DIGITS      (C0_BASE+L_33FF2-APP3_SEG*16), APP3_SEG
        KEY_DOWN        18h, (C0_BASE+L_33FF2-APP3_SEG*16), APP3_SEG
        retf
L_33FF2:
        mov     si, 777h
        mov     dx, ds
        mov     cl, 74h
        mov     ch, 1dh
        mov     ah, 10h
        if      FW_VERSION >= 110
        if      FW_VERSION < 111
        mov     bx, 18d0h
        else
        mov     bx, 18ddh
        endif
        mov     cx, cs
        int     0b7h
        retf
L_347E3:
        les     si, [C0_W_02BF2]
        else
        mov     bx, 18c1h
        mov     cx, cs
        int     0b7h
        retf
L_347E3:
        les     si, [C0_FP_02C02]
        endif
        cmp     byte ptr es:[si+206h], 0
        if      FW_VERSION >= 110
        db      75h, 01h, 0cbh, 0cdh, 0a4h
        KEY_DOWN        12h, EP_L_348D1_OFF, APP3_SEG
        KEY_DOWN        13h, EP_L_34640_OFF, APP3_SEG
        KEY_DOWN        14h, (C0_BASE+L_34085-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, EP_L_34640_OFF, APP3_SEG
        KEY_DOWN        20h, (C0_BASE+L_339EB-APP3_SEG*16), APP3_SEG
        db      8ch, 0d9h, 0beh
        if      FW_VERSION >= 111
        db      0eeh, 2bh, 0b3h, 01h, 0b7h, 00h, 0bah, 14h, 00h, 0bfh, 0eeh, 0dch, 0cdh, 7eh, 0cbh
        else
        db      0eeh, 2bh, 0b3h, 01h, 0b7h, 00h, 0bah, 14h, 00h, 0bfh, 0e0h, 0dch, 0cdh, 7eh, 0cbh
        endif
        else
        jne     L_34202
        retf
L_34202:
        int     0a4h
        KEY_DOWN        12h, (C0_BASE+L_348D1-APP3_SEG*16), APP3_SEG
        KEY_DOWN        13h, (C0_BASE+L_34640-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (C0_BASE+L_34965-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, (C0_BASE+L_34640-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, (C0_BASE+L_339EB-APP3_SEG*16), APP3_SEG
        mov     cx, ds
        mov     si, 2beeh
        mov     bl, 1
        mov     bh, 0
        mov     dx, 14h
        mov     di, (C0_BASE+L_344AE-APP3_SEG*16)
        int     7eh
        retf
        endif
L_339EB:
        DISP_WIN        32h, 06h, 0beh, 36h, "Delete Song"
        endif
        if      FW_VERSION < 120
        DISP_TEXT       3ah, 11h, "Song:  -"
        endif
        DISP_TEXT       46h, 1fh, "Pressing DO^IT will"
        DISP_TEXT       46h, 28h, "erase this song!!"
        mov     si, 11h
        DISP_BMP        0d2h, 18h, 11h
        DISP_SOFTKEY    03h, DISP_SK_BOX,    "ALL SG"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        mov     ax, word ptr [C0_W_02BFE]
        inc     al
        DISP_NUM0       58h, 11h, 02h
        les     si, [C0_FP_02C02]
        mov     dx, es
        add     si, 0
        mov     cl, 6ah
        mov     ch, 11h
        mov     ah, 10h
        mov     bl, 5
        int     90h
        DISP_CURSOR     58h, 11h, 73h
        retf
L_348D1:
        DISP_WIN        32h, 06h, 0beh, 36h, "Delete ALL Song"
        mov     si, 0eh
        DISP_BMP        3ch, 16h, 0eh
        mov     si, 11h
        DISP_BMP        0d9h, 1ch, 11h
        DISP_TEXT       52h, 14h, "Pressing DO^IT will erase"
        DISP_TEXT       52h, 1dh, "ALL songs!!"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        if      FW_VERSION >= 110
        if      FW_VERSION >= 112
        int     0a4h
        if      FW_VERSION < 114
        KEY_DOWN        16h, (C0_BASE+L_347E3-APP3_SEG*16), APP3_SEG
        KEY_DOWN        13h, (C0_BASE+L_347E3-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (C0_BASE+L_3495D-APP3_SEG*16), APP3_SEG
        else
        KEY_DOWN        16h, L_347E3-APP3_CSBASE, APP3_SEG
        KEY_DOWN        13h, L_347E3-APP3_CSBASE, APP3_SEG
        KEY_DOWN        14h, L_3495D-APP3_CSBASE, APP3_SEG
        endif
        retf
L_3495D:
        call    fn_34052
        push    cs
        call    far_340B3
        retf
L_34965:
        if      FW_VERSION >= 120
        db      0c4h, 3eh, 02h
        sub     al, 0beh
        jbe     L_34998
        else
        db      0c4h, 3eh, 0f2h
        sub     di, word ptr [bp+2c66h]
        endif
        mov     cx, 210h
        rep movsb
        push    cs
        call    far_340B3
        retf
L_34976:
        les     si, [C0_FP_02C02]
        cmp     byte ptr es:[si+206h], 0
        jne     br_34983
        retf
br_34983:
        mov     ax, 0e000h
        mov     es, ax
        sub     si, si
        sub     ax, ax
L_3439E:
        cmp     byte ptr es:[si+206h], 0
        je      L_343B3
        add     si, 210h
L_34998:
        inc     al
        cmp     al, 14h
        jne     L_3439E
        mov     ax, 13h
L_343B3:
        mov     word ptr [C0_W_02C06], ax
        push    cs
        call    far_34A5D
        retf
        else
        db      0cdh, 0a4h
        KEY_DOWN        16h, (C0_BASE+L_347E3-APP3_SEG*16), APP3_SEG
        KEY_DOWN        13h, (C0_BASE+L_347E3-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, EP_L_3407D_OFF, APP3_SEG
        db      0cbh
L_3495D:
L_34085                         equ     $+8
        db      0e8h, 0f2h, 0f6h, 0eh, 0e8h, 4fh, 0f7h, 0cbh, 0c4h, 3eh, 0f2h, 2bh, 0beh, 66h, 2ch, 0b9h
L_34976                         equ     $+9
        db      10h, 02h, 0f3h, 0a4h, 0eh, 0e8h, 3eh, 0f7h, 0cbh, 0c4h, 36h, 0f2h, 2bh, 26h, 80h, 0bch
        db      06h, 02h, 00h, 75h, 01h, 0cbh, 0b8h, 00h, 0e0h, 8eh, 0c0h, 2bh, 0f6h, 2bh, 0c0h, 26h
        db      80h, 0bch, 06h, 02h, 00h, 74h, 0dh, 81h, 0c6h, 10h, 02h, 0feh, 0c0h, 3ch, 14h, 75h
        db      0eeh, 0b8h, 13h, 00h, 0a3h, 0f6h, 2bh, 0eh, 0e8h, 0b5h, 00h, 0cbh
        endif
        else
        int     0a4h
        KEY_DOWN        16h, (C0_BASE+L_347E3-APP3_SEG*16), APP3_SEG
        KEY_DOWN        13h, (C0_BASE+L_347E3-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (C0_BASE+L_3495D-APP3_SEG*16), APP3_SEG
        db      0cbh
L_3495D:
        db      0e8h
        cmc
        db      0f6h, 0eh, 0e8h, 52h, 0f7h
        retf
L_34965:
        db      0c4h, 3eh, 0f2h
        sub     di, word ptr [bp+2c66h]
        mov     cx, 210h
        rep movsb
        push    cs
        call    far_340B3
        retf
L_34976:
        les     si, [C0_W_02BF2]
        cmp     byte ptr es:[si+206h], 0
        jne     br_34983
        retf
br_34983:
        mov     ax, 0e000h
        mov     es, ax
        sub     si, si
        sub     ax, ax
L_3439E:
        cmp     byte ptr es:[si+206h], 0
        je      L_343B3
        add     si, 210h
L_34998:
        inc     al
        cmp     al, 14h
        jne     L_3439E
        mov     ax, 13h
L_343B3:
        mov     word ptr [C0_W_02C06], ax
        push    cs
        call    far_34A5D
        retf
        endif
L_33B68:
        DISP_WIN        32h, 06h, 0beh, 36h, "Copy Song"
        DISP_TEXT       46h, 10h, "Song:##-"
        DISP_TEXT       46h, 28h, "Song:##-"
        mov     si, 0dh
        DISP_BMP        82h, 19h, 0dh
        DISP_TEXT       92h, 1bh, "COPY"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        mov     ax, word ptr [C0_W_02BFE]
        inc     al
        DISP_NUM0       64h, 10h, 02h
        les     si, [C0_FP_02C02]
        add     si, 0
        mov     dx, es
        mov     cl, 76h
        mov     ch, 10h
        mov     ah, 10h
        mov     bl, 5
        int     90h
        mov     ax, word ptr [C0_W_02C06]
        push    ax
        inc     al
        DISP_NUM0       64h, 28h, 02h
        pop     ax
        mov     bx, 210h
        mul     bx
        mov     si, ax
        add     si, 0
        mov     word ptr [P_2C08], ax
        mov     dx, 0e000h
        mov     cl, 76h
        mov     ch, 28h
        mov     ah, 10h
        mov     bl, 5
        int     90h
        call    word ptr [C0_W_02BFC]
        retf
cb_3445D:
        DISP_CURSOR     64h, 10h, 76h
        ret
cb_34466:
        DISP_CURSOR     64h, 28h, 76h
        ret
far_34A5D:
        mov     word ptr [C0_W_02BFC], cb_3445D-APP3_CSBASE
        int     0a4h
        FIELD_ENTRY     ds, C0_W_02BFE, 1, 0, 14h, L_344AE-APP3_CSBASE
        if      FW_VERSION >= 112
        if      FW_VERSION >= 114
        KEY_DOWN        1ah, L_341BF-APP3_CSBASE, APP3_SEG
        KEY_DOWN        20h, L_33B68-APP3_CSBASE, APP3_SEG
        KEY_DOWN        13h, L_34640-APP3_CSBASE, APP3_SEG
        KEY_DOWN        14h, L_34AE1-APP3_CSBASE, APP3_SEG
        KEY_DOWN        16h, L_34640-APP3_CSBASE, APP3_SEG
        if      FW_VERSION >= 120
        retf
L_341BF:
        mov     word ptr [C0_W_02BFC], cb_34466-APP3_CSBASE
        int     0a4h
        mov     cx, ds
        mov     si, 2c06h
        mov     bl, 1
        mov     bh, 0
        mov     dx, 14h
        mov     di, (APP3_BASE+field_cb_none-APP3_SEG*16)
        int     7eh
        else
        db      0cbh
L_341BF:
        mov     word ptr [C0_W_02BFC], cb_34466-APP3_CSBASE
        int     0a4h
        FIELD_ENTRY     ds, 2bf6h, 1, 0, 14h, (APP3_BASE+field_cb_none-APP3_SEG*16)
        endif
        else
        KEY_DOWN        1ah, (C0_BASE+L_341BF-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, (C0_BASE+L_33B68-APP3_SEG*16), APP3_SEG
        KEY_DOWN        13h, (C0_BASE+L_34640-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (C0_BASE+L_34303-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, (C0_BASE+L_34640-APP3_SEG*16), APP3_SEG
        retf
L_341BF:
        mov     word ptr [C0_W_02BFC], cb_34466-APP3_CSBASE
        int     0a4h
        FIELD_ENTRY     ds, 2bf6h, 1, 0, 14h, (APP3_BASE+field_cb_none-APP3_SEG*16)
        endif
        KEY_DOWN        19h, EP_L_33C1C_OFF, APP3_SEG
        KEY_DOWN        20h, L_33B68-APP3_CSBASE, APP3_SEG
        KEY_DOWN        13h, L_34640-APP3_CSBASE, APP3_SEG
        if      FW_VERSION >= 114
        KEY_DOWN        14h, L_34AE1-APP3_CSBASE, APP3_SEG
        KEY_DOWN        16h, L_34640-APP3_CSBASE, APP3_SEG
        retf
L_34AE1:
        les     si, [C0_FP_02C02]
        else
        KEY_DOWN        14h, (C0_BASE+L_34303-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, (C0_BASE+L_34640-APP3_SEG*16), APP3_SEG
        retf
L_34303:
        les     si, [C0_W_02BF2]
        endif
        mov     di, word ptr [P_2C08]
        mov     cx, 210h
        push    ds
        push    es
        pop     ds
        rep movsb
        pop     ds
        push    cs
        call    far_340B3
        retf
far_34AF7:
        call    fn_340E5
        cmp     byte ptr [A3_B_00718], 0
        je      L_33CC3
        jmp     NEAR L_3460C
L_33CC3:
        int     86h
        mov     word ptr [C0_W_00F2A], ax
        mov     byte ptr [C0_B_00F2C], dl
        mov     byte ptr [C0_B_00F2D], dh
        mov     word ptr [C0_W_CURSOR_FN], cb_3341E-APP3_CSBASE
        int     0a4h
        KEY_CURSOR      (C0_BASE+L_33E8B-APP3_SEG*16), APP3_SEG, (C0_BASE+FAR_345B8-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+far_34B4B-APP3_SEG*16), APP3_SEG
        mov     cx, ds
        mov     si, P_2C18
        mov     bl, 1
        mov     bh, 0
        mov     dx, 3e7h
        if      FW_VERSION >= 114
        mov     di, L_34B4D-APP3_CSBASE
        else
        mov     di, (C0_BASE+intcb_3436F_112-APP3_SEG*16)
        endif
        int     7eh
        if      FW_VERSION >= 114
        KEY_DOWN        16h, L_34C21-APP3_CSBASE, APP3_SEG
        KEY_DOWN        20h, EP_FAR_3412E_OFF, APP3_SEG
        retf
L_34B4D:
        mov     cx, ax
        les     si, [C0_FP_02C1E]
        mov     word ptr [C0_W_02C0A], 0
        mov     word ptr [C0_W_02C10], 0
        else
        KEY_DOWN        16h, (C0_BASE+L_34341-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, EP_FAR_3412E_OFF, APP3_SEG
        retf
intcb_3436F_112:
        mov     cx, ax
        les     si, [C0_W_02C0E]
        mov     word ptr [C0_W_02BFA_2], 0
        mov     word ptr [C0_W_02C00], 0
        endif
L_34381:
        cmp     word ptr es:[si+18h], 0
        je      br_34BA2
        cmp     ax, word ptr es:[si+18h]
        jb      br_34B75
        add     si, 18h
        inc     word ptr [C0_W_02C0A]
        jmp     SHORT L_34381
br_34B75:
        sub     ax, word ptr es:[si]
loop_34B78:
        sub     ax, word ptr es:[si+0eh]
        jb      br_34B84
        inc     word ptr [C0_W_02C10]
        jmp     loop_34B78
br_34B84:
        add     ax, word ptr es:[si+0eh]
        push    ax
        call    fn_344E0
        mov     ah, 0
        int     0ech
        pop     ax
        mov     word ptr [A3_W_00F2A], ax
        mov     byte ptr [A3_B_00F2C], 0
        mov     byte ptr [A3_B_00F2D], 0
        call    EP_FN_30425_OFF+APP3_CSBASE
        retf
br_34BA2:
        call    fn_344C5
        retf
        if      FW_VERSION >= 120
FAR_345B8:
        mov     word ptr [C0_W_CURSOR_FN], cb_33C77-APP3_CSBASE
        FIELD_ENTRY     ds, 0f2ch, 1, 0, 20h, (APP3_BASE+intcb_27291-APP3_SEG*16)
        KEY_CURSOR      EP_L_34217_OFF, APP3_SEG, (C0_BASE+far_345E2-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+far_34B4B-APP3_SEG*16), APP3_SEG
        retf
far_345E2:
        mov     word ptr [C0_W_CURSOR_FN], cb_33C80-APP3_CSBASE
        mov     cx, ds
        mov     si, 0f2dh
        mov     bl, 0
        mov     bh, 0
        mov     dx, 63h
        mov     di, (APP3_BASE+intcb_272F9-APP3_SEG*16)
        int     7eh
        KEY_CURSOR      (C0_BASE+FAR_345B8-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34C5C-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+far_34B4B-APP3_SEG*16), APP3_SEG
        else
far_345B8:
        mov     word ptr [C0_W_CURSOR_FN], cb_33C77-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 2ch, 0fh, 0b3h, 01h, 0b7h, 00h, 0bah
        db      20h, 00h, 0bfh, 0e1h, 0ah, 0cdh, 7eh
        KEY_CURSOR      EP_L_34217_OFF, APP3_SEG, (C0_BASE+FAR_345E2-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+far_34B4B-APP3_SEG*16), APP3_SEG
        db      0cbh
far_345E2:
        mov     word ptr [C0_W_CURSOR_FN], cb_33C80-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 2dh, 0fh, 0b3h, 00h, 0b7h, 00h, 0bah, 63h, 00h, 0bfh, 49h, 0bh, 0cdh
        db      7eh
        KEY_CURSOR      (C0_BASE+FAR_345B8-APP3_SEG*16), APP3_SEG, EP_L_3437C_OFF, APP3_SEG, 0000h, 0000h, (C0_BASE+far_34B4B-APP3_SEG*16), APP3_SEG
        endif
        retf
L_3460C:
        mov     word ptr [C0_W_CURSOR_FN], cb_33997_111-APP3_CSBASE
        if      FW_VERSION >= 114
        KEY_CURSOR      L_33E8B-APP3_CSBASE, APP3_SEG, 0000h, 0000h, 0000h, 0000h, (C0_BASE+far_34B4B-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      (C0_BASE+L_33E8B-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, (C0_BASE+far_34B4B-APP3_SEG*16), APP3_SEG
        endif
        KEY_WHEEL       0000h, 0000h
        if      FW_VERSION >= 114
        KEY_DOWN        16h, L_34C21-APP3_CSBASE, APP3_SEG
        retf
L_34C21:
        call    EP_FN_280BD_OFF+APP3_CSBASE
        je      br_34C27
        retf
        else
        KEY_DOWN        16h, (C0_BASE+L_34341-APP3_SEG*16), APP3_SEG
        db      0cbh
L_34341:
        db      0e8h
        cmpsw
        xor     al, 74h
        db      01h, 0cbh
        endif
br_34C27:
        les     si, [C0_FP_02C02]
        add     si, 20ah
        if      FW_VERSION >= 114
        call    (APP3_BASE+L_27689-APP3_SEG*16)+APP3_CSBASE
        else
        call    L_37499
        endif
        KEY_DOWN        13h, EP_L_34C53_OFF, APP3_SEG
        KEY_DOWN        16h, EP_L_34C53_OFF, APP3_SEG
        KEY_DOWN        27h, EP_L_34C53_OFF, APP3_SEG
        KEY_DOWN        26h, EP_L_34C53_OFF, APP3_SEG
        retf
L_34355:
        KEY_RESTORE     A3_TBL_01072
        push    cs
        call    far_34AF7
        retf
L_34C5C:
        call    fn_340E5
        mov     word ptr [C0_W_CURSOR_FN], cb_33C92-APP3_CSBASE
        call    fn_34D97
        if      FW_VERSION >= 114
        KEY_CURSOR      EP_L_34217_OFF, APP3_SEG, L_35079-APP3_CSBASE, APP3_SEG, L_33E8B-APP3_CSBASE, APP3_SEG, L_34D45-APP3_CSBASE, APP3_SEG
        KEY_WHEEL2      (C0_BASE+L_34C8D-APP3_SEG*16), APP3_SEG, EP_L_34C9C_OFF, APP3_SEG
        KEY_DOWN        16h, L_343CB-APP3_CSBASE, APP3_SEG
        db      0cbh
L_34C8D:
        if      FW_VERSION >= 120
        call    APP3_BASE+fn_280BD-SEGBASE
        else
        call    EP_FN_280BD_OFF+APP3_CSBASE
        endif
        else
        KEY_CURSOR      EP_L_34217_OFF, APP3_SEG, (C0_BASE+L_35079-APP3_SEG*16), APP3_SEG, (C0_BASE+L_33E8B-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34D45-APP3_SEG*16), APP3_SEG
        KEY_WHEEL2      (C0_BASE+L_343AD-APP3_SEG*16), APP3_SEG, EP_L_34C9C_OFF, APP3_SEG
        KEY_DOWN        16h, (C0_BASE+L_343CB-APP3_SEG*16), APP3_SEG
        db      0cbh
L_343AD:
        db      0e8h
        cmp     si, word ptr [si]
        endif
        je      L_346A5
        retf
L_346A5:
        mov     byte ptr [C0_B_00716], 0
        call    fn_344F5
        retf
L_34C9C:
        call    EP_FN_280BD_OFF+APP3_CSBASE
        je      br_34CA2
        retf
br_34CA2:
        mov     byte ptr [C0_B_00716], 1
        call    fn_344F5
        retf
L_343CB:
        call    EP_FN_280BD_OFF+APP3_CSBASE
        je      br_34CB1
        retf
br_34CB1:
        call    fn_34073
        int     0a4h
        else
        KEY_DOWN        1ah, (C0_BASE+L_341BF-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 110
        KEY_DOWN        20h, EP_L_340C9_OFF, APP3_SEG
        KEY_DOWN        13h, EP_L_34640_OFF, APP3_SEG
        KEY_DOWN        14h, (C0_BASE+L_34201-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, EP_L_34640_OFF, APP3_SEG
L_341BF                         equ     $+1
        retf
        mov     word ptr [C0_W_02BFC], cb_34466-APP3_CSBASE
        int     0a4h
        FIELD_ENTRY     ds, C0_W_02C06, 1, 0, 14h, (APP3_BASE+field_cb_none-APP3_SEG*16)
        KEY_DOWN        19h, EP_L_33C1C_OFF, APP3_SEG
        KEY_DOWN        20h, EP_L_340C9_OFF, APP3_SEG
        KEY_DOWN        13h, EP_L_34640_OFF, APP3_SEG
        KEY_DOWN        14h, (C0_BASE+L_34201-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, EP_L_34640_OFF, APP3_SEG
L_34201                         equ     $+1
        db      0cbh, 0c4h, 36h, 0f2h, 2bh, 8bh, 3eh, 0f8h, 2bh, 0b9h, 10h, 02h, 1eh
        db      06h, 1fh, 0f3h, 0a4h, 1fh, 0eh, 0e8h, 0bdh, 0f5h, 0cbh
FAR_34AF7:
        db      0e8h, 0ebh, 0f5h, 80h, 3eh, 18h
        db      07h, 00h, 74h, 03h, 0e9h, 0f6h, 00h, 0cdh, 86h, 0a3h, 2ah, 0fh, 88h, 16h, 2ch, 0fh
        db      88h, 36h, 2dh, 0fh
        mov     word ptr [C0_W_CURSOR_FN], cb_3397C_111-APP3_CSBASE
        db      0cdh, 0a4h
        KEY_CURSOR      (C0_BASE+L_33E8B-APP3_SEG*16), APP3_SEG, (C0_BASE+L_342C6-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_34859-APP3_SEG*16), APP3_SEG
        db      8ch, 0d9h
        if      FW_VERSION >= 111
        db      0beh, 08h, 2ch, 0b3h, 01h, 0b7h, 00h, 0bah, 0e7h, 03h, 0bfh, 8dh, 0e3h, 0cdh, 7eh
        else
        db      0beh, 08h, 2ch, 0b3h, 01h, 0b7h, 00h, 0bah, 0e7h, 03h, 0bfh, 7fh, 0e3h, 0cdh, 7eh
        endif
        KEY_DOWN        16h, (C0_BASE+L_34341-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, EP_FAR_3412E_OFF, APP3_SEG
        else
        KEY_DOWN        20h, (C0_BASE+L_33B68-APP3_SEG*16), APP3_SEG
        KEY_DOWN        13h, (C0_BASE+L_34640-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (C0_BASE+L_34303-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, (C0_BASE+L_34640-APP3_SEG*16), APP3_SEG
        retf
L_341BF:
        mov     word ptr [C0_W_02BFC], cb_34466-APP3_CSBASE
        int     0a4h
        FIELD_ENTRY     ds, 2bf6h, 1, 0, 14h, (APP3_BASE+field_cb_none-APP3_SEG*16)
        KEY_DOWN        19h, EP_L_33C1C_OFF, APP3_SEG
        KEY_DOWN        20h, (C0_BASE+L_33B68-APP3_SEG*16), APP3_SEG
        KEY_DOWN        13h, (C0_BASE+L_34640-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (C0_BASE+L_34303-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, (C0_BASE+L_34640-APP3_SEG*16), APP3_SEG
        retf
L_34303:
        les     si, [C0_W_02BF2]
        mov     di, word ptr [P_2C08]
        mov     cx, 210h
        push    ds
        push    es
        pop     ds
        rep movsb
        pop     ds
        push    cs
        call    far_340B3
        retf
far_34AF7:
        call    fn_340E5
        cmp     byte ptr [A3_B_00718], 0
        je      L_33CC3
        jmp     NEAR L_3460C
L_33CC3:
        int     86h
        mov     word ptr [C0_W_00F2A], ax
        mov     byte ptr [C0_B_00F2C], dl
        mov     byte ptr [C0_B_00F2D], dh
        mov     word ptr [C0_W_CURSOR_FN], cb_3341E-APP3_CSBASE
        int     0a4h
        KEY_CURSOR      (C0_BASE+L_33E8B-APP3_SEG*16), APP3_SEG, (C0_BASE+FAR_345B8-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_3483B-APP3_SEG*16), APP3_SEG
        mov     cx, ds
        mov     si, 2c08h
        mov     bl, 1
        mov     bh, 0
        mov     dx, 3e7h
        mov     di, (C0_BASE+intcb_33D0C_107-APP3_SEG*16)
        int     7eh
        KEY_DOWN        16h, (C0_BASE+L_34341-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, EP_FAR_3412E_OFF, APP3_SEG
        retf
intcb_33D0C_107:
        mov     cx, ax
        les     si, [C0_W_02C0E]
        mov     word ptr [C0_W_02BFA_2], 0
        mov     word ptr [C0_W_02C00], 0
L_34381:
        cmp     word ptr es:[si+16h], 0
        je      br_34BA2
        cmp     ax, word ptr es:[si+16h]
        jb      br_34B75
        add     si, 16h
        inc     word ptr [C0_W_02C0A]
        jmp     SHORT L_34381
br_34B75:
        sub     ax, word ptr es:[si]
loop_34B78:
        sub     ax, word ptr es:[si+0ch]
        jb      br_34B84
        inc     word ptr [C0_W_02C10]
        jmp     loop_34B78
br_34B84:
        add     ax, word ptr es:[si+0ch]
        push    ax
        call    fn_344E0
        mov     ah, 0
        int     0ech
        pop     ax
        mov     word ptr [C0_W_00F2A], ax
        mov     byte ptr [C0_B_00F2C], 0
        mov     byte ptr [C0_B_00F2D], 0
        call    EP_FN_30425_OFF+APP3_CSBASE
        retf
br_34BA2:
        call    fn_344C5
        retf
FAR_345B8:
        mov     word ptr [C0_W_CURSOR_FN], cb_33C77-APP3_CSBASE
        mov     cx, ds
        mov     si, 0f2ch
        mov     bl, 1
        mov     bh, 0
        mov     dx, 20h
        mov     di, (APP3_BASE+intcb_27291-APP3_SEG*16)
        int     7eh
        KEY_CURSOR      EP_L_34217_OFF, APP3_SEG, (C0_BASE+far_345E2-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_3483B-APP3_SEG*16), APP3_SEG
        retf
far_345E2:
        mov     word ptr [C0_W_CURSOR_FN], cb_33C80-APP3_CSBASE
        mov     cx, ds
        mov     si, 0f2dh
        mov     bl, 1
        mov     bh, 0
        mov     dx, 63h
        mov     di, (APP3_BASE+intcb_272F9-APP3_SEG*16)
        int     7eh
        KEY_CURSOR      (C0_BASE+FAR_345B8-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34C5C-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_3483B-APP3_SEG*16), APP3_SEG
        endif
        db      0cbh
        if      FW_VERSION >= 110
        db      8bh, 0c8h, 0c4h, 36h, 0eh, 2ch, 0c7h, 06h, 0fah, 2bh, 00h, 00h, 0c7h, 06h, 00h, 2ch
        db      00h, 00h, 26h, 83h, 7ch, 18h, 00h
        db      "t<&;D"
        db      18h, 72h, 09h, 83h
        db      0c6h, 18h, 0ffh, 06h, 0fah, 2bh, 0ebh, 0eah, 26h, 2bh, 04h, 26h, 2bh, 44h, 0eh, 72h
        db      06h, 0ffh, 06h, 00h, 2ch, 0ebh, 0f4h, 26h, 03h, 44h, 0eh, 50h, 0e8h, 54h, 0f9h, 0b4h
        db      00h, 0cdh, 0ech, 58h, 0a3h, 2ah, 0fh, 0c6h, 06h, 2ch, 0fh, 00h, 0c6h, 06h, 2dh, 0fh
L_342C6                         equ     $+9
        db      00h, 0e8h, 92h, 0b8h, 0cbh, 0e8h, 20h, 0f9h, 0cbh
        mov     word ptr [C0_W_CURSOR_FN], cb_33985_111-APP3_CSBASE
        mov     cx, ds
        mov     si, 0f2ch
        mov     bl, 1
        mov     bh, 0
        mov     dx, 20h
        mov     di, (APP3_BASE+intcb_27291-APP3_SEG*16)
        int     7eh
        KEY_CURSOR      EP_L_34217_OFF, APP3_SEG, (C0_BASE+L_342F0-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_34859-APP3_SEG*16), APP3_SEG
        retf
L_342F0:
        mov     word ptr [C0_W_CURSOR_FN], cb_3398E_111-APP3_CSBASE
        mov     cx, ds
        mov     si, 0f2dh
        mov     bl, 0
        mov     bh, 0
        mov     dx, 63h
        mov     di, (APP3_BASE+intcb_272F9-APP3_SEG*16)
        int     7eh
        KEY_CURSOR      (C0_BASE+L_342C6-APP3_SEG*16), APP3_SEG, EP_L_3437C_OFF, APP3_SEG, 0000h, 0000h, (C0_BASE+L_34859-APP3_SEG*16), APP3_SEG
        retf
        else
L_3460C:
        endif
        mov     word ptr [C0_W_CURSOR_FN], cb_33997_111-APP3_CSBASE
        KEY_CURSOR      (C0_BASE+L_33E8B-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, (C0_BASE+L_3483B-APP3_SEG*16), APP3_SEG
        KEY_WHEEL       0000h, 0000h
        KEY_DOWN        16h, (C0_BASE+L_34341-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 110
L_34341                         equ     $+1
        if      FW_VERSION >= 111
        db      0cbh, 0e8h, 0a9h, 34h, 74h, 01h, 0cbh, 0c4h, 36h, 0f2h, 2bh, 81h, 0c6h
        db      0ah, 02h, 0e8h, 47h, 30h
        else
        db      0cbh, 0e8h, 0aah, 34h, 74h, 01h, 0cbh, 0c4h, 36h, 0f2h, 2bh, 81h, 0c6h
        db      0ah, 02h, 0e8h, 48h, 30h
        endif
        else
        db      0cbh
L_34341:
        db      0e8h
        db      0ceh, 34h, 74h, 01h, 0cbh, 0c4h, 36h, 0f2h, 2bh, 81h, 0c6h, 0ah, 02h, 0e8h, 6ch, 30h
        endif
        KEY_DOWN        13h, EP_L_34C53_OFF, APP3_SEG
        KEY_DOWN        16h, EP_L_34C53_OFF, APP3_SEG
        KEY_DOWN        27h, EP_L_34C53_OFF, APP3_SEG
        KEY_DOWN        26h, EP_L_34C53_OFF, APP3_SEG
        if      FW_VERSION >= 110
        retf
L_34355:
        KEY_RESTORE     A3_TBL_01072
        push    cs
        call    far_34AF7
        retf
L_34C5C:
        call    fn_340E5
        mov     word ptr [C0_W_CURSOR_FN], cb_339A0_111-APP3_CSBASE
        call    fn_34D97
        else
        db      0cbh
L_34355:
        KEY_RESTORE     A3_TBL_01072
        db      0eh, 0e8h, 9ch, 0feh, 0cbh
L_34C5C:
        db      0e8h, 89h, 0f4h
        mov     word ptr [C0_W_CURSOR_FN], cb_33C92-APP3_CSBASE
        db      0e8h, 2fh, 01h
        endif
        KEY_CURSOR      EP_L_34217_OFF, APP3_SEG, (C0_BASE+L_35079-APP3_SEG*16), APP3_SEG, (C0_BASE+L_33E8B-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34D45-APP3_SEG*16), APP3_SEG
        KEY_WHEEL2      (C0_BASE+L_343AD-APP3_SEG*16), APP3_SEG, EP_L_34C9C_OFF, APP3_SEG
        KEY_DOWN        16h, (C0_BASE+L_343CB-APP3_SEG*16), APP3_SEG
        db      0cbh
L_343AD:
        if      FW_VERSION >= 110
        if      FW_VERSION >= 111
        db      0e8h, 3dh, 34h, 74h, 01h, 0cbh, 0c6h, 06h, 16h, 07h, 00h, 0e8h, 5ah, 0f8h, 0cbh
        else
        db      0e8h, 3eh, 34h, 74h, 01h, 0cbh, 0c6h, 06h, 16h, 07h, 00h, 0e8h, 5ah, 0f8h, 0cbh
        endif
L_34C9C:
        db      0e8h
L_343CB                         equ     $+0eh
        if      FW_VERSION >= 111
        db      2eh, 34h, 74h, 01h, 0cbh, 0c6h, 06h, 16h, 07h, 01h, 0e8h, 4bh, 0f8h, 0cbh, 0e8h, 1fh
        else
        db      2fh, 34h, 74h, 01h, 0cbh, 0c6h, 06h, 16h, 07h, 01h, 0e8h, 4bh, 0f8h, 0cbh, 0e8h, 20h
        endif
        db      34h, 74h, 01h, 0cbh, 0e8h, 0bfh, 0f3h, 0cdh, 0a4h
        else
        db      0e8h, 62h, 34h, 74h, 01h
        db      0cbh, 0c6h, 06h, 16h, 07h, 00h, 0e8h, 66h, 0f8h, 0cbh
L_34C9C:
        db      0e8h, 53h, 34h, 74h, 01h, 0cbh
br_34CA2:
        db      0c6h, 06h, 16h, 07h, 01h, 0e8h, 57h, 0f8h, 0cbh
L_343CB:
        db      0e8h, 44h, 34h, 74h, 01h, 0cbh, 0e8h
        db      0c2h, 0f3h, 0cdh, 0a4h
        endif
        endif
        KEY_DOWN        16h, EP_FAR_340B3_OFF, EP_FAR_340B3_SEG
        KEY_DOWN        13h, EP_FAR_340B3_OFF, EP_FAR_340B3_SEG
        if      FW_VERSION >= 110
        if      FW_VERSION >= 112
        FIELD_WHEEL     ds, 787h, 0, 0, 1, intcb_34CE0-APP3_CSBASE
        else
        mov     cx, ds
        mov     si, 787h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 1
        mov     di, (C0_BASE+intcb_34CE0-APP3_SEG*16)
        int     7dh
        endif
        KEY_DOWN        20h, (C0_BASE+L_34CE4-APP3_SEG*16), APP3_SEG
        db      0cbh
intcb_34CE0:
        call    fn_344F5
        db      0cbh
        else
        db      8ch, 0d9h, 0beh, 87h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h
        db      0bfh, 0dfh, 0e4h, 0cdh, 7dh
        KEY_DOWN        20h, (C0_BASE+L_34CE4-APP3_SEG*16), APP3_SEG
        db      0cbh, 0e8h, 1eh
        db      0f8h, 0cbh
        endif
L_34CE4:
        DISP_WIN_WIDE   "Tempo change"
        DISP_TEXT       2ch, 10h, "Ignore tempo change events"
        DISP_TEXT       2ch, 1ah, "in sequence:"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        if      FW_VERSION >= 110
        if      FW_VERSION >= 112
        mov     al, byte ptr [C0_B_00787]
        mov     cl, 74h
        mov     ch, 1ah
        call    EP_FN_26D9C_OFF+APP3_CSBASE
        DISP_CURSOR     74h, 1ah, 14h
        retf
L_34D45:
        call    fn_340E5
        mov     word ptr [C0_W_CURSOR_FN], cb_33C9B-APP3_CSBASE
        call    fn_34D97
        if      FW_VERSION >= 120
        KEY_CURSOR      (C0_BASE+L_34C5C-APP3_SEG*16), APP3_SEG, (C0_BASE+L_35079-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34C5C-APP3_SEG*16), APP3_SEG, (C0_BASE+L_344E1-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      EP_L_3437C_OFF, APP3_SEG, (C0_BASE+L_34A8B-APP3_SEG*16), APP3_SEG, EP_L_3437C_OFF, APP3_SEG, (C0_BASE+L_344E1-APP3_SEG*16), APP3_SEG
        endif
        if      FW_VERSION >= 114
        KEY_DOWN        16h, L_343CB-APP3_CSBASE, APP3_SEG
        cmp     byte ptr [A3_B_00716], 0
        je      br_34D73
        else
        KEY_DOWN        16h, (C0_BASE+L_343CB-APP3_SEG*16), APP3_SEG
        db      80h, 3eh
        push    ss
        pop     es
        add     byte ptr [si+1], dh
        endif
        retf
        if      FW_VERSION < 114
        db      0a1h, 14h
        endif
br_34D73:
        if      FW_VERSION >= 114
        mov     ax, word ptr [C0_W_00714]
        else
        pop     es
        endif
        mov     bl, 0
        mov     bh, 0
        mov     dx, 0bb8h
        mov     di, P_E5D3
        if      FW_VERSION >= 114
far_345D1                       equ     $+02fh
        endif
        int     7fh
        retf
d_p_e5d3:
        db      3dh, 2ch, 01h, 73h
        add     di, word ptr [bx+si+12ch]
        mov     word ptr es:[di], ax
        mov     word ptr [C0_W_00714], ax
        mov     byte ptr [C0_B_02C1D], 1
        retf
        else
        if      FW_VERSION >= 111
        db      0a0h, 87h, 07h, 0b1h, 74h, 0b5h, 1ah, 0e8h, 70h, 20h, 0b1h
        else
        db      0a0h, 87h, 07h, 0b1h, 74h, 0b5h, 1ah, 0e8h, 7eh, 20h, 0b1h
        endif
L_34D45                         equ     $+8
        db      74h, 0b5h, 1ah, 0b0h, 14h, 0cdh, 0b0h, 0cbh, 0e8h, 9dh, 0f3h
        mov     word ptr [C0_W_CURSOR_FN], cb_339A9_111-APP3_CSBASE
        db      0e8h, 46h, 00h
        KEY_CURSOR      EP_L_3437C_OFF, APP3_SEG, (C0_BASE+L_35079-APP3_SEG*16), APP3_SEG, EP_L_3437C_OFF, APP3_SEG, EP_L_344E1_OFF, APP3_SEG
        KEY_DOWN        16h, (C0_BASE+L_343CB-APP3_SEG*16), APP3_SEG
        db      80h, 3eh
        db      16h, 07h, 00h, 74h, 01h, 0cbh, 0a1h, 14h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 0b8h, 0bh
        if      FW_VERSION >= 111
        db      0bfh, 0c3h, 0e5h, 0cdh, 7fh, 0cbh, 3dh, 2ch, 01h, 73h, 03h, 0b8h, 2ch, 01h, 26h, 89h
        else
        db      0bfh, 0b5h, 0e5h, 0cdh, 7fh, 0cbh, 3dh, 2ch, 01h, 73h, 03h, 0b8h, 2ch, 01h, 26h, 89h
        endif
        db      05h, 0a3h, 14h, 07h, 0c6h, 06h, 0dh, 2ch, 01h, 0cbh
        endif
        else
        db      0a0h, 87h, 07h, 0b1h, 74h, 0b5h, 1ah, 0e8h, 0b1h, 20h, 0b1h, 74h, 0b5h, 1ah, 0b0h, 14h
        db      0cdh, 0b0h, 0cbh
L_34D45:
        db      0e8h, 0a0h, 0f3h
        mov     word ptr [C0_W_CURSOR_FN], cb_33C9B-APP3_CSBASE
        db      0e8h, 46h, 00h
        KEY_CURSOR      (C0_BASE+L_34C5C-APP3_SEG*16), APP3_SEG, (C0_BASE+L_35079-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34C5C-APP3_SEG*16), APP3_SEG, (C0_BASE+L_344E1-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, (C0_BASE+L_343CB-APP3_SEG*16), APP3_SEG
        db      80h, 3eh, 16h, 07h, 00h, 74h, 01h
        db      0cbh, 0a1h, 14h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 0b8h, 0bh, 0bfh, 82h, 0e5h, 0cdh, 7fh
        db      0cbh, 3dh, 2ch, 01h, 73h, 03h, 0b8h, 2ch, 01h, 26h, 89h, 05h, 0a3h, 14h, 07h, 0c6h
        db      06h, 0dh, 2ch, 01h, 0cbh
        endif
fn_34D97:
        cmp     byte ptr [C0_B_02C1D], 0
        jne     br_34D9F
        ret
br_34D9F:
        mov     byte ptr [C0_B_02C1D], 0
        int     0b4h
        int     0ffh
        call    fn_344F5
        DISP_PLANE0
        ret
        if      FW_VERSION < 114
far_345D1:
        endif
L_34DAF:
        push    ds
        mov     bp, APPDATA_SEG
        mov     ds, bp
        cmp     byte ptr [C0_B_00F2F], 3
        jne     br_34DBF
        call    fn_34D97
br_34DBF:
        pop     ds
        retf
L_344E1:
        if      FW_VERSION >= 110
        call    fn_340E5
        mov     word ptr [C0_W_CURSOR_FN], cb_33CA4-APP3_CSBASE
        call    fn_34D97
        if      FW_VERSION >= 114
        KEY_CURSOR      L_34D45-APP3_CSBASE, APP3_SEG, L_35079-APP3_CSBASE, APP3_SEG, L_34D45-APP3_CSBASE, APP3_SEG, 0000h, 0000h
        else
        KEY_CURSOR      (C0_BASE+L_34D45-APP3_SEG*16), APP3_SEG, (C0_BASE+L_35079-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34D45-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        endif
        les     si, [C0_FP_02C02]
        add     si, 209h
        mov     cx, es
        mov     bl, 0
        mov     bh, 0
        mov     dx, 1
        mov     di, (APP3_BASE+field_cb_none-APP3_SEG*16)
        int     7eh
        if      FW_VERSION >= 114
        KEY_DOWN        16h, L_34DFE-APP3_CSBASE, APP3_SEG
L_34DFE                         equ     $+1
        if      FW_VERSION >= 120
        db      0cbh, 0e8h, 0bch, 32h
        else
        db      0cbh, 0e8h, 0cah, 32h
        endif
        je      br_34E04
        retf
br_34E04:
        call    fn_34073
        int     0a4h
        KEY_DOWN        20h, L_34549-APP3_CSBASE, APP3_SEG
        else
        if      FW_VERSION >= 112
        KEY_DOWN        16h, (C0_BASE+L_34620-APP3_SEG*16), APP3_SEG
        else
        KEY_DOWN        16h, (C0_BASE+L_3451E-APP3_SEG*16), APP3_SEG
        endif
L_3451E                         equ     $+1
        db      0cbh
L_34620:
        db      0e8h
        if      FW_VERSION >= 112
        retf    7432h
        db      01h, 0cbh, 0e8h, 6ch, 0f2h, 0cdh, 0a4h
        KEY_DOWN        20h, (C0_BASE+L_34549-APP3_SEG*16), APP3_SEG
        else
        if      FW_VERSION >= 111
        db      0cch
        else
        db      0cdh
        endif
        xor     dh, byte ptr [si+1]
        retf
br_34E04:
        db      0e8h, 6ch, 0f2h, 0cdh, 0a4h
        KEY_DOWN        20h, EP_L_34549_OFF, APP3_SEG
        endif
        endif
        else
        db      0e8h, 24h, 0f3h
        mov     word ptr [C0_W_CURSOR_FN], cb_33CA4-APP3_CSBASE
        db      0e8h, 0cah, 0ffh
        KEY_CURSOR      (C0_BASE+L_34D45-APP3_SEG*16), APP3_SEG, (C0_BASE+L_35079-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34D45-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      0c4h, 36h
        db      0f2h, 2bh, 81h, 0c6h, 09h, 02h, 8ch, 0c1h, 0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h, 0bfh
        db      0c0h, 18h, 0cdh, 7eh
        KEY_DOWN        16h, (C0_BASE+L_34620-APP3_SEG*16), APP3_SEG
        db      0cbh
L_34620:
        db      0e8h, 0f1h, 32h
        db      74h, 01h, 0cbh, 0e8h, 6fh, 0f2h, 0cdh, 0a4h
        KEY_DOWN        20h, (C0_BASE+L_34549-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        13h, EP_FAR_340B3_OFF, EP_FAR_340B3_SEG
        KEY_DOWN        16h, EP_FAR_340B3_OFF, EP_FAR_340B3_SEG
        call    L_35027
        push    cs
        call    far_34F28
        retf
L_34549:
        DISP_WIN_WIDE   "Loop"
        DISP_TEXT       3ch, 0bh, "     First step:##"
        DISP_TEXT       3ch, 21h, "      Last step:##"
        DISP_TEXT       3ch, 2ah, "Number of steps:##"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        DISP_BOX        5ah, 18h, 0bh, 04h
        DISP_FILL       64h, 18h, 0bh, 04h
        DISP_FILL       78h, 18h, 0bh, 04h
        DISP_BOX        82h, 18h, 0bh, 04h
        DISP_BOX        8ch, 18h, 0bh, 04h
        mov     si, 14h
        DISP_BMP        65h, 14h, 14h
        mov     si, 13h
        DISP_BMP        7ah, 1ch, 13h
        mov     si, 15h
        DISP_BMP        6eh, 16h, 15h
        mov     si, 16h
        DISP_BMP        6eh, 1ah, 16h
        mov     si, 15h
        DISP_BMP        77h, 16h, 15h
        mov     si, 16h
        DISP_BMP        77h, 1ah, 16h
        mov     al, byte ptr [C0_B_02C0E]
        inc     al
        mov     ah, 0
        DISP_NUM        9ch, 0bh, 03h
        mov     al, byte ptr [C0_B_02C0F]
        push    ax
        inc     al
        mov     ah, 0
        DISP_NUM        9ch, 21h, 03h
        if      FW_VERSION >= 110
        pop     ax
        sub     al, byte ptr [C0_B_02C0E]
        inc     al
        mov     ah, 0
        DISP_NUM        9ch, 2ah, 03h
        if      FW_VERSION >= 112
        if      FW_VERSION >= 114
        call    word ptr [C0_W_CURSOR_FN]
        retf
cb_3491F:
        DISP_CURSOR     9bh, 0bh, 15h
        ret
cb_34928:
        DISP_CURSOR     9bh, 21h, 15h
        ret
cb_34931:
        DISP_CURSOR     9bh, 2ah, 15h
        ret
far_34F28:
        mov     word ptr [C0_W_CURSOR_FN], cb_3491F-APP3_CSBASE
        mov     cx, ds
        mov     si, C0_B_02C0E
        mov     bl, 0
        mov     bh, 0
        mov     dx, 0f9h
        mov     di, P_E7A2
        int     7eh
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, L_34F7A-APP3_CSBASE, APP3_SEG
        else
        call    word ptr [C0_W_02BF4]
        retf
cb_3491F:
        mov     cl, 9bh
        mov     ch, 0bh
        mov     al, 15h
        int     0b0h
        ret
cb_34636:
        mov     cl, 9bh
        mov     ch, 21h
        mov     al, 15h
        int     0b0h
        ret
cb_34931:
        mov     cl, 9bh
        mov     ch, 2ah
        mov     al, 15h
        int     0b0h
        ret
far_34F28:
        mov     word ptr [C0_W_CURSOR_FN], cb_3491F-APP3_CSBASE
        mov     cx, ds
        mov     si, 2bfeh
        mov     bl, 0
        mov     bh, 0
        mov     dx, 0f9h
        mov     di, (C0_BASE+d_p_e7a2-APP3_SEG*16)
        int     7eh
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, (C0_BASE+L_34F7A-APP3_SEG*16), APP3_SEG
        endif
        db      0cbh
d_p_e7a2:
        if      FW_VERSION >= 114
        cmp     al, byte ptr [C0_B_02C14]
        jbe     br_34F5B
        mov     al, byte ptr [C0_B_02C14]
br_34F5B:
        cmp     al, byte ptr [C0_B_02C0F]
        jb      br_34F6D
        mov     byte ptr [C0_B_02C0F], al
        les     si, [C0_FP_02C02]
        mov     byte ptr es:[si+208h], al
br_34F6D:
        mov     byte ptr [C0_B_02C0E], al
        les     si, [C0_FP_02C02]
        mov     byte ptr es:[si+207h], al
        retf
L_34F7A:
        mov     word ptr [C0_W_CURSOR_FN], cb_34928-APP3_CSBASE
        FIELD_ENTRY     ds, C0_B_02C0F, 0, 0, 0f9h, P_E7F4-APP3_CSBASE
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, EP_FAR_34F28_OFF, APP3_SEG, L_34FCC-APP3_CSBASE, APP3_SEG
        retf
P_E7F4:
        if      FW_VERSION >= 120
        db      3ah, 06h, 14h, 2ch, 76h, 03h, 0a0h, 14h, 2ch, 3ah, 06h, 0eh, 2ch, 73h, 0ch, 0a2h
        db      0eh, 2ch, 0c4h, 36h, 02h, 2ch
        else
        cmp     al, byte ptr [C0_B_02C14]
        jbe     L_349BF
        mov     al, byte ptr [C0_B_02C14]
L_349BF:
        cmp     al, byte ptr [C0_B_02C0E]
        jae     br_34FC5
        mov     byte ptr [C0_B_02C0E], al
        les     si, [C0_FP_02C02]
        endif
        mov     byte ptr es:[si+207h], al
        if      FW_VERSION >= 120
        db      0a2h, 0fh, 2ch, 0c4h, 36h
        db      02h
        endif
br_34FC5:
        if      FW_VERSION >= 120
        sub     al, 26h
        mov     byte ptr [si+208h], al
        else
        mov     byte ptr [C0_B_02C0F], al
        les     si, [C0_FP_02C02]
        mov     byte ptr es:[si+208h], al
        endif
        retf
L_34FCC:
        mov     word ptr [C0_W_CURSOR_FN], cb_34931-APP3_CSBASE
        KEY_WHEEL2      L_35004-APP3_CSBASE, APP3_SEG, L_34FEF-APP3_CSBASE, APP3_SEG
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, L_34F7A-APP3_CSBASE, APP3_SEG, 0000h, 0000h
        retf
L_34FEF:
        add     al, byte ptr [C0_B_02C0F]
        jae     br_34FF7
        mov     al, 0f9h
br_34FF7:
        cmp     al, byte ptr [C0_B_02C14]
        jb      br_35000
        mov     al, byte ptr [C0_B_02C14]
br_35000:
        mov     byte ptr [C0_B_02C0F], al
        retf
L_35004:
        mov     ax, cx
        mov     ah, al
        mov     al, byte ptr [C0_B_02C0F]
        sub     al, ah
        jae     br_35011
        mov     al, 0
br_35011:
        cmp     al, byte ptr [C0_B_02C0E]
        jae     L_34A2C
        mov     al, byte ptr [C0_B_02C0E]
L_34A2C:
        mov     byte ptr [C0_B_02C0F], al
        les     si, [C0_FP_02C02]
        mov     byte ptr es:[si+208h], al
        retf
L_35027:
        les     si, [C0_FP_02C02]
        mov     di, si
        add     si, 0eh
        mov     cl, 0ffh
loop_35032:
        inc     cl
        add     si, 2
        cmp     byte ptr es:[si], 0ffh
        jne     loop_35032
        sub     cl, 1
        jae     br_35044
        mov     cl, 0
br_35044:
        mov     byte ptr [C0_B_02C14], cl
        cmp     cl, byte ptr es:[di+207h]
        ja      br_35058
        mov     byte ptr es:[di+207h], cl
        mov     byte ptr [C0_B_02C0E], cl
br_35058:
        cmp     cl, byte ptr es:[di+208h]
        ja      L_34A7A
        mov     byte ptr es:[di+208h], cl
        mov     byte ptr [C0_B_02C0F], cl
L_34A7A:
        mov     al, byte ptr es:[di+207h]
        mov     byte ptr [C0_B_02C0E], al
        mov     al, byte ptr es:[di+208h]
        mov     byte ptr [C0_B_02C0F], al
        ret
L_35079:
L_34A8B:
        call    fn_340E5
        mov     word ptr [C0_W_CURSOR_FN], cb_33CAD-APP3_CSBASE
        call    fn_34D97
        KEY_WHEEL2      L_350D4-APP3_CSBASE, APP3_SEG, L_3510E-APP3_CSBASE, APP3_SEG
        KEY_CURSOR      L_34D45-APP3_CSBASE, APP3_SEG, (C0_BASE+far_34B4B-APP3_SEG*16), APP3_SEG, L_350B2-APP3_CSBASE, APP3_SEG, L_350F4-APP3_CSBASE, APP3_SEG
        KEY_DOWN        14h, L_3520E-APP3_CSBASE, APP3_SEG
        KEY_DOWN        15h, L_35234-APP3_CSBASE, APP3_SEG
br_350B1:
        retf
L_350B2:
        call    EP_FN_280BD_OFF+APP3_CSBASE
        je      L_34ACA
        retf
L_34ACA:
        mov     word ptr [C0_W_02C10], 0
        cmp     word ptr [C0_W_02C0A], 0
        jne     br_350C6
        retf
br_350C6:
        int     0a3h
        dec     word ptr [C0_W_02C0A]
        call    fn_344C5
        mov     bl, 1eh
        int     87h
        retf
L_350D4:
        call    EP_FN_280BD_OFF+APP3_CSBASE
        je      br_350DA
        retf
br_350DA:
        mov     word ptr [C0_W_02C10], 0
        cmp     word ptr [C0_W_02C0A], 0
        jne     br_350E8
        retf
br_350E8:
        dec     word ptr [C0_W_02C0A]
        call    fn_344C5
        mov     bl, 1eh
        int     87h
        retf
L_350F4:
        call    EP_FN_280BD_OFF+APP3_CSBASE
        je      br_350FA
        retf
br_350FA:
        call    fn_344E0
        jne     br_35100
        retf
br_35100:
        int     0a3h
        inc     word ptr [C0_W_02C0A]
        call    fn_344C5
        mov     bl, 1eh
        int     87h
        retf
L_3510E:
        call    EP_FN_280BD_OFF+APP3_CSBASE
        je      br_35114
        retf
br_35114:
        mov     word ptr [C0_W_02C10], 0
        les     si, [C0_FP_02C02]
        cmp     word ptr es:[si+10h], 0ffh
        jne     br_35127
        retf
br_35127:
        call    fn_344E0
        jne     br_3512D
        retf
br_3512D:
        inc     word ptr [C0_W_02C0A]
        call    fn_344C5
        mov     bl, 1eh
        int     87h
        retf
        else
        db      3ah, 06h, 04h, 2ch, 76h, 03h, 0a0h, 04h, 2ch, 3ah, 06h, 0ffh, 2bh, 72h, 0ch, 0a2h
        db      0ffh, 2bh, 0c4h, 36h, 0f2h, 2bh, 26h, 88h, 84h, 08h, 02h, 0a2h, 0feh, 2bh, 0c4h, 36h
        db      0f2h, 2bh, 26h, 88h, 84h, 07h, 02h, 0cbh
L_34F7A:
        mov     word ptr [C0_W_CURSOR_FN], cb_34636-APP3_CSBASE
        db      8ch, 0d9h
        db      0beh, 0ffh, 2bh, 0b3h, 00h, 0b7h, 00h, 0bah, 0f9h, 00h, 0bfh, 0e6h, 0e7h, 0cdh, 7eh
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (C0_BASE+far_34F28-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34FCC-APP3_SEG*16), APP3_SEG
        db      0cbh, 3ah, 06h, 04h, 2ch, 76h, 03h, 0a0h, 04h, 2ch, 3ah, 06h, 0feh, 2bh, 73h
        db      0ch, 0a2h, 0feh, 2bh, 0c4h, 36h, 0f2h, 2bh, 26h, 88h, 84h, 07h, 02h, 0a2h, 0ffh, 2bh
        db      0c4h, 36h, 0f2h, 2bh, 26h, 88h, 84h, 08h, 02h, 0cbh
L_34FCC:
        mov     word ptr [C0_W_CURSOR_FN], cb_34931-APP3_CSBASE
        KEY_WHEEL2      (C0_BASE+L_34826-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34811-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (C0_BASE+L_34F7A-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      0cbh
L_34811:
        db      02h, 06h, 0ffh
        db      2bh, 73h, 02h, 0b0h, 0f9h, 3ah, 06h, 04h, 2ch, 72h, 03h, 0a0h, 04h, 2ch, 0a2h, 0ffh
        db      2bh, 0cbh
L_34826:
        db      8bh, 0c1h, 8ah, 0e0h, 0a0h, 0ffh, 2bh, 2ah, 0c4h, 73h, 02h, 0b0h, 00h, 3ah
        db      06h, 0feh, 2bh, 73h, 03h, 0a0h, 0feh, 2bh, 0a2h, 0ffh, 2bh, 0c4h, 36h, 0f2h, 2bh, 26h
        db      88h, 84h, 08h, 02h, 0cbh
L_35027:
        db      0c4h, 36h, 0f2h, 2bh, 8bh, 0feh, 83h, 0c6h, 0eh, 0b1h, 0ffh
        db      0feh, 0c1h, 83h, 0c6h, 02h, 26h, 80h, 3ch, 0ffh, 75h, 0f5h, 80h, 0e9h, 01h, 73h, 02h
        db      0b1h, 00h, 88h, 0eh, 04h, 2ch, 26h, 3ah, 8dh, 07h, 02h, 77h, 09h, 26h, 88h, 8dh
        db      07h, 02h, 88h, 0eh, 0feh, 2bh, 26h, 3ah, 8dh, 08h, 02h, 77h, 09h, 26h, 88h, 8dh
        db      08h, 02h, 88h, 0eh, 0ffh, 2bh, 26h, 8ah, 85h, 07h, 02h, 0a2h, 0feh, 2bh, 26h, 8ah
        db      85h, 08h, 02h, 0a2h, 0ffh, 2bh, 0c3h
L_35079:
L_34A8B:
        db      0e8h, 69h, 0f0h
        mov     word ptr [C0_W_CURSOR_FN], cb_33CAD-APP3_CSBASE
        db      0e8h, 12h, 0fdh
        KEY_WHEEL2      (C0_BASE+L_348F6-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34930-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (C0_BASE+L_34D45-APP3_SEG*16), APP3_SEG, (C0_BASE+far_34B4B-APP3_SEG*16), APP3_SEG, (C0_BASE+L_348D4-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34916-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (C0_BASE+L_34A30-APP3_SEG*16), APP3_SEG
        KEY_DOWN        15h, (C0_BASE+L_34A56-APP3_SEG*16), APP3_SEG
        db      0cbh
L_348D4:
        db      0e8h, 16h, 30h, 74h, 01h, 0cbh, 0c7h, 06h, 00h, 2ch, 00h, 00h, 83h, 3eh, 0fah, 2bh
        db      00h, 75h, 01h, 0cbh, 0cdh, 0a3h, 0ffh, 0eh, 0fah, 2bh, 0e8h, 0f6h, 0f3h, 0b3h, 1eh, 0cdh
        db      87h, 0cbh
L_348F6:
        db      0e8h, 0f4h, 2fh, 74h, 01h, 0cbh, 0c7h, 06h, 00h, 2ch, 00h, 00h, 83h, 3eh
        db      0fah, 2bh, 00h, 75h, 01h, 0cbh, 0ffh, 0eh, 0fah, 2bh, 0e8h, 0d6h, 0f3h, 0b3h, 1eh, 0cdh
        db      87h, 0cbh
L_34916:
        db      0e8h, 0d4h, 2fh, 74h, 01h, 0cbh, 0e8h, 0e3h, 0f3h, 75h, 01h, 0cbh, 0cdh, 0a3h
        db      0ffh, 06h, 0fah, 2bh, 0e8h, 0bch, 0f3h, 0b3h, 1eh, 0cdh, 87h, 0cbh
L_34930:
        db      0e8h, 0bah, 2fh, 74h
        db      01h, 0cbh, 0c7h, 06h, 00h, 2ch, 00h, 00h, 0c4h, 36h, 0f2h, 2bh, 26h, 81h, 7ch, 10h
        db      0ffh, 00h, 75h, 01h, 0cbh, 0e8h, 0b6h, 0f3h, 75h, 01h, 0cbh, 0ffh, 06h, 0fah, 2bh, 0e8h
        db      91h, 0f3h, 0b3h, 1eh, 0cdh, 87h, 0cbh
        endif
far_34B4B:
        if      FW_VERSION >= 114
        call    fn_340E5
        mov     word ptr [C0_W_CURSOR_FN], cb_33CB6-APP3_CSBASE
        FIELD_ENTRY     ds, P_2C0C, 1, 0, 63h, intcb_35180-APP3_CSBASE
        KEY_WHEEL2      L_351EE-APP3_CSBASE, APP3_SEG, L_351CE-APP3_CSBASE, APP3_SEG
        KEY_CURSOR      L_351B0-APP3_CSBASE, APP3_SEG, L_351BF-APP3_CSBASE, APP3_SEG, L_35192-APP3_CSBASE, APP3_SEG, L_351A1-APP3_CSBASE, APP3_SEG
        KEY_DOWN        14h, L_3520E-APP3_CSBASE, APP3_SEG
        KEY_DOWN        15h, L_35234-APP3_CSBASE, APP3_SEG
        db      0cbh
intcb_35180:
        db      50h
        call    fn_344E0
        jne     L_3518A
        db      0eh
        call    L_35234
L_3518A:
        call    fn_344E0
        db      58h, 26h
        db      88h, 04h, 0cbh
L_35192:
        if      FW_VERSION >= 120
        db      80h, 3eh, 1ch, 2ch, 00h, 74h, 03h
        call    fn_344F5
        db      0eh
        call    L_350B2
        db      0cbh
        else
        db      80h, 3eh, 0ch, 2ch, 00h, 74h, 03h, 0e8h, 59h, 0f3h, 0eh, 0e8h, 12h, 0ffh, 0cbh
        endif
L_351A1:
        if      FW_VERSION >= 120
        db      80h, 3eh, 1ch, 2ch, 00h, 74h, 03h
        call    fn_344F5
        db      0eh
        call    L_350F4
        db      0cbh
        else
        db      80h, 3eh, 0ch, 2ch, 00h, 74h, 03h, 0e8h, 4ah, 0f3h, 0eh, 0e8h, 45h, 0ffh, 0cbh
        endif
L_351B0:
        if      FW_VERSION >= 120
        db      80h, 3eh, 1ch, 2ch, 00h, 74h, 03h
        call    fn_344F5
        db      0eh
        call    L_35079
        db      0cbh
        else
        db      80h, 3eh, 0ch, 2ch, 00h, 74h, 03h, 0e8h, 3bh, 0f3h, 0eh, 0e8h, 0bbh, 0feh, 0cbh
        endif
L_351BF:
        if      FW_VERSION >= 120
        db      80h, 3eh, 1ch, 2ch, 00h, 74h, 03h
        call    fn_344F5
        db      0eh
        call    L_35282
        db      0cbh
        else
        db      80h, 3eh, 0ch, 2ch, 00h, 74h, 03h, 0e8h, 2ch, 0f3h, 0eh, 0e8h, 0b5h, 00h, 0cbh
        endif
L_351CE:
        if      FW_VERSION >= 120
        db      0e8h, 0ech, 2eh, 74h, 01h, 0cbh
        call    fn_344E0
        jne     L_351DB
        db      0ebh
        else
        db      0e8h, 0fah, 2eh, 74h, 01h, 0cbh, 0e8h, 09h, 0f3h, 75h, 02h, 0ebh
        endif
        db      59h
L_351DB:
        db      3ch, 62h, 75h
        if      FW_VERSION >= 120
        db      01h, 0cbh, 0feh, 0c0h, 26h, 88h, 04h
        call    fn_344C5
        db      0c6h, 06h, 1ch, 2ch, 01h, 0cbh
        else
        db      01h, 0cbh, 0feh, 0c0h, 26h, 88h, 04h, 0e8h, 0ddh, 0f2h, 0c6h, 06h, 0ch, 2ch, 01h, 0cbh
        endif
L_351EE:
        if      FW_VERSION >= 120
        db      0e8h, 0cch, 2eh, 74h, 01h, 0cbh
        call    fn_344E0
        db      75h, 02h
        jmp     SHORT L_35234
        db      3ch, 00h, 75h
        db      01h, 0cbh, 0feh, 0c8h, 26h, 88h, 04h
        call    fn_344C5
        db      0c6h, 06h, 1ch, 2ch, 01h, 0cbh
        else
        db      0e8h, 0dah, 2eh, 74h, 01h, 0cbh, 0e8h, 0e9h, 0f2h, 75h, 02h, 0ebh, 39h, 3ch, 00h, 75h
        db      01h, 0cbh, 0feh, 0c8h, 26h, 88h, 04h, 0e8h, 0bdh, 0f2h, 0c6h, 06h, 0ch, 2ch, 01h, 0cbh
        endif
L_3520E:
        if      FW_VERSION >= 120
        db      0e8h, 0ach, 2eh, 74h, 01h, 0cbh
        call    fn_344E0
        db      75h, 01h, 0cbh, 8bh, 0feh, 83h, 0c6h
        else
        db      0e8h, 0bah, 2eh, 74h, 01h, 0cbh, 0e8h, 0c9h, 0f2h, 75h, 01h, 0cbh, 8bh, 0feh, 83h, 0c6h
        endif
        db      02h, 26h, 8bh, 04h, 83h, 0c6h, 02h, 0abh, 3ch, 0ffh, 75h, 0f5h
        call    fn_344F5
        call    fn_344C5
        call    L_35027
        db      0cbh
L_35234:
        if      FW_VERSION >= 120
        db      0e8h, 86h, 2eh, 74h, 01h, 0cbh
        call    fn_34073
        call    fn_344E0
        db      8bh, 0deh, 0c4h, 36h
        db      02h, 2ch, 81h, 0c6h, 02h, 02h, 26h, 8bh, 04h, 3ch, 0ffh, 74h, 01h, 0cbh, 8bh, 0feh
        else
        db      0e8h, 94h, 2eh, 74h, 01h, 0cbh, 0e8h, 36h, 0eeh, 0e8h, 0a0h, 0f2h, 8bh, 0deh, 0c4h, 36h
        db      0f2h, 2bh, 81h, 0c6h, 02h, 02h, 26h, 8bh, 04h, 3ch, 0ffh, 74h, 01h, 0cbh, 8bh, 0feh
        endif
        db      3bh, 0deh, 74h, 13h, 83h, 0eeh, 02h, 26h, 8bh, 04h, 26h, 89h, 05h, 83h, 0eeh, 02h
        db      83h, 0efh, 02h, 3bh, 0dfh, 75h, 0f0h, 26h, 0c7h, 05h, 00h, 01h
        call    fn_344F5
        db      0eh
        call    L_350F4
        call    fn_344C5
        db      72h, 01h, 0cbh, 0eh
        call    L_350B2
        db      0cbh
L_35282:
        call    fn_340E5
        mov     word ptr [C0_W_CURSOR_FN], cb_33CBF-APP3_CSBASE
        KEY_WHEEL2      L_352CA-APP3_CSBASE, APP3_SEG, L_352A8-APP3_CSBASE, APP3_SEG
        KEY_CURSOR      L_352EC-APP3_CSBASE, APP3_SEG, L_352FC-APP3_CSBASE, APP3_SEG, L_3530C-APP3_CSBASE, APP3_SEG, L_35314-APP3_CSBASE, APP3_SEG
L_352A8                         equ     $+1
        if      FW_VERSION >= 120
        db      0cbh, 0e8h, 12h, 2eh, 74h, 01h, 0cbh, 0c7h, 06h, 10h, 2ch, 00h, 00h
        call    fn_344E0
        else
        db      0cbh, 0e8h, 20h, 2eh, 74h, 01h, 0cbh, 0c7h, 06h, 0h, 2ch, 00h, 00h, 0e8h, 29h, 0f2h
        endif
        db      75h, 01h, 0cbh, 80h, 0fch, 63h, 75h, 01h, 0cbh, 0feh, 0c4h, 26h, 88h, 64h, 01h, 0e8h
        db      2ch, 0f2h, 0cbh
L_352CA:
        if      FW_VERSION >= 120
        db      0e8h, 0f0h, 2dh, 74h, 01h, 0cbh, 0c7h, 06h, 10h, 2ch, 00h, 00h
        call    fn_344E0
        db      75h
        else
        db      0e8h, 0feh, 2dh, 74h, 01h, 0cbh, 0c7h, 06h, 0h, 2ch, 00h, 00h, 0e8h, 07h, 0f2h, 75h
        endif
        db      01h, 0cbh, 80h, 0fch, 00h, 75h, 01h, 0cbh, 0feh, 0cch, 26h, 88h, 64h, 01h, 0e8h, 0ah
        db      0f2h, 0cbh
L_352EC:
        if      FW_VERSION >= 120
        call    fn_344F5
        call    APP3_BASE+fn_280BD-SEGBASE
        jne     L_352F7
        call    fn_344C5
L_352F7:
        db      0eh
        call    far_34B4B
        db      0cbh
        else
        db      0e8h, 06h, 0f2h, 0e8h, 0d9h, 2dh, 75h, 03h, 0e8h, 0ceh, 0f1h, 0eh, 0e8h, 3eh, 0feh, 0cbh
        endif
L_352FC:
        if      FW_VERSION >= 120
        call    fn_344F5
        call    APP3_BASE+fn_280BD-SEGBASE
        jne     L_35307
        call    fn_344C5
L_35307:
        db      0eh
        call    far_34AF7
        db      0cbh
        else
        db      0e8h, 0f6h, 0f1h, 0e8h, 0c9h, 2dh, 75h, 03h, 0e8h, 0beh, 0f1h, 0eh, 0e8h, 0ech, 0f7h, 0cbh
        endif
L_3530C:
        call    fn_344F5
        db      0eh
        call    L_350B2
        db      0cbh
L_35314:
        call    fn_344F5
        db      0eh
        call    L_350F4
        db      0cbh
L_3531C:
        if      FW_VERSION >= 120
        call    fn_34D97
        db      0c7h, 06h, 0ah, 2ch, 00h, 00h
        call    fn_344C5
        db      73h, 01h, 0cbh, 8eh
        db      06h, 10h, 0fh, 26h, 80h, 3eh, 12h, 00h, 00h, 75h, 01h, 0cbh, 0c7h, 06h, 10h, 2ch
        else
        db      0e8h, 78h, 0fah, 0c7h, 06h, 0fah, 2bh, 00h, 00h, 0e8h, 9dh, 0f1h, 73h, 01h, 0cbh, 8eh
        db      06h, 10h, 0fh, 26h, 80h, 3eh, 12h, 00h, 00h, 75h, 01h, 0cbh, 0c7h, 06h, 00h, 2ch
        endif
        db      00h, 00h, 9ah
        else
        db      0e8h, 0a9h, 0efh
        mov     word ptr [C0_W_CURSOR_FN], cb_33CB6-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0fch, 2bh, 0b3h, 01h, 0b7h, 00h, 0bah, 63h, 00h, 0bfh, 0c2h, 0e9h, 0cdh
        db      7eh
        KEY_WHEEL2      (C0_BASE+L_34A10-APP3_SEG*16), APP3_SEG, (C0_BASE+L_349F0-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (C0_BASE+L_349D2-APP3_SEG*16), APP3_SEG, (C0_BASE+L_349E1-APP3_SEG*16), APP3_SEG, (C0_BASE+L_349B4-APP3_SEG*16), APP3_SEG, (C0_BASE+L_349C3-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (C0_BASE+L_34A30-APP3_SEG*16), APP3_SEG
        KEY_DOWN        15h, (C0_BASE+L_34A56-APP3_SEG*16), APP3_SEG
        db      0cbh, 50h, 0e8h
        db      5ch, 0f3h, 75h, 04h, 0eh, 0e8h, 0aah, 00h, 0e8h, 53h, 0f3h, 58h, 26h, 88h, 04h, 0cbh
L_349B4:
        db      80h, 3eh, 0ch, 2ch, 00h, 74h, 03h, 0e8h, 59h, 0f3h, 0eh, 0e8h, 12h, 0ffh, 0cbh
L_349C3:
        db      80h
        db      3eh, 0ch, 2ch, 00h, 74h, 03h, 0e8h, 4ah, 0f3h, 0eh, 0e8h, 45h, 0ffh, 0cbh
L_349D2:
        db      80h, 3eh
        db      0ch, 2ch, 00h, 74h, 03h, 0e8h, 3bh, 0f3h, 0eh, 0e8h, 0bbh, 0feh, 0cbh
L_349E1:
        db      80h, 3eh, 0ch
        db      2ch, 00h, 74h, 03h, 0e8h, 2ch, 0f3h, 0eh, 0e8h, 0b5h, 00h, 0cbh
L_349F0:
        db      0e8h, 0fah, 2eh, 74h
        db      01h, 0cbh, 0e8h, 09h, 0f3h, 75h, 02h, 0ebh, 59h, 3ch, 62h, 75h, 01h, 0cbh, 0feh, 0c0h
        db      26h, 88h, 04h, 0e8h, 0ddh, 0f2h, 0c6h, 06h, 0ch, 2ch, 01h, 0cbh
L_34A10:
        db      0e8h, 0dah, 2eh, 74h
        db      01h, 0cbh, 0e8h, 0e9h, 0f2h, 75h, 02h, 0ebh, 39h, 3ch, 00h, 75h, 01h, 0cbh, 0feh, 0c8h
        db      26h, 88h, 04h, 0e8h, 0bdh, 0f2h, 0c6h, 06h, 0ch, 2ch, 01h, 0cbh
L_34A30:
        db      0e8h, 0bah, 2eh, 74h
        db      01h, 0cbh, 0e8h, 0c9h, 0f2h, 75h, 01h, 0cbh, 8bh, 0feh, 83h, 0c6h, 02h, 26h, 8bh, 04h
        db      83h, 0c6h, 02h, 0abh, 3ch, 0ffh, 75h, 0f5h, 0e8h, 0c8h, 0f2h, 0e8h, 95h, 0f2h, 0e8h, 0f4h
        db      0fdh, 0cbh
L_34A56:
        db      0e8h, 94h, 2eh, 74h, 01h, 0cbh, 0e8h, 36h, 0eeh, 0e8h, 0a0h, 0f2h, 8bh, 0deh
        db      0c4h, 36h, 0f2h, 2bh, 81h, 0c6h, 02h, 02h, 26h, 8bh, 04h, 3ch, 0ffh, 74h, 01h, 0cbh
        db      8bh, 0feh, 3bh, 0deh, 74h, 13h, 83h, 0eeh, 02h, 26h, 8bh, 04h, 26h, 89h, 05h, 83h
        db      0eeh, 02h, 83h, 0efh, 02h, 3bh, 0dfh, 75h, 0f0h, 26h, 0c7h, 05h, 00h, 01h, 0e8h, 82h
        db      0f2h, 0eh, 0e8h, 7dh, 0feh, 0e8h, 4bh, 0f2h, 72h, 01h, 0cbh, 0eh, 0e8h, 31h, 0feh, 0cbh
        db      0e8h, 60h, 0eeh
        mov     word ptr [C0_W_CURSOR_FN], cb_33CBF-APP3_CSBASE
        KEY_WHEEL2      (C0_BASE+L_34AEC-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34467-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (C0_BASE+L_34B0E-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34B1E-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34B2E-APP3_SEG*16), APP3_SEG, (C0_BASE+L_35314-APP3_SEG*16), APP3_SEG
        db      0cbh
L_34467:
        db      0e8h, 20h, 2eh, 74h, 01h, 0cbh, 0c7h, 06h, 00h, 2ch
        db      00h, 00h, 0e8h, 29h, 0f2h, 75h, 01h, 0cbh, 80h, 0fch, 63h, 75h, 01h, 0cbh, 0feh, 0c4h
        db      26h, 88h, 64h, 01h, 0e8h, 2ch, 0f2h, 0cbh
L_34AEC:
        db      0e8h, 0feh, 2dh, 74h, 01h, 0cbh, 0c7h, 06h
        db      00h, 2ch, 00h, 00h, 0e8h, 07h, 0f2h, 75h, 01h, 0cbh, 80h, 0fch, 00h, 75h, 01h, 0cbh
        db      0feh, 0cch, 26h, 88h, 64h, 01h, 0e8h, 0ah, 0f2h, 0cbh
L_34B0E:
        db      0e8h, 06h, 0f2h, 0e8h, 0d9h, 2dh
        db      75h, 03h, 0e8h, 0ceh, 0f1h, 0eh, 0e8h, 3eh, 0feh, 0cbh
L_34B1E:
        db      0e8h, 0f6h, 0f1h, 0e8h, 0c9h, 2dh
        db      75h, 03h, 0e8h, 0beh, 0f1h, 0eh, 0e8h, 0ech, 0f7h, 0cbh
L_34B2E:
        db      0e8h, 0e6h, 0f1h, 0eh, 0e8h, 9fh
        db      0fdh, 0cbh
L_35314:
        db      0e8h, 0deh, 0f1h, 0eh, 0e8h, 0d9h, 0fdh, 0cbh
L_3531C:
        db      0e8h, 78h, 0fah, 0c7h, 06h, 0fah
        db      2bh, 00h, 00h, 0e8h, 9dh, 0f1h, 73h, 01h, 0cbh, 8eh, 06h, 10h, 0fh, 26h, 80h, 3eh
        db      12h, 00h, 00h, 75h, 01h, 0cbh, 0c7h, 06h, 00h, 2ch, 00h, 00h, 9ah
        endif
        dw      EP_L_2F8E1_OFF, EP_L_2F8E1_SEG
        call    far_35349
        db      0cdh, 0a8h, 0cbh
far_35349:
        KEY_LOCATE      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        KEY_TRANSPORT   0000h, 0000h, 0000h, 0000h, (C0_BASE+L_34562-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h
        KEY_DOWN        3ah, L_35544-APP3_CSBASE, APP3_SEG
        else
        call    word ptr [C0_W_02BF4]
        retf
cb_3491F:
        mov     cl, 9bh
        mov     ch, 0bh
        mov     al, 15h
        int     0b0h
        ret
cb_34636:
        mov     cl, 9bh
        mov     ch, 21h
        mov     al, 15h
        int     0b0h
        ret
cb_34931:
        mov     cl, 9bh
        mov     ch, 2ah
        mov     al, 15h
        int     0b0h
        ret
far_34F28:
        mov     word ptr [C0_W_CURSOR_FN], cb_3491F-APP3_CSBASE
        mov     cx, ds
        mov     si, 2bfeh
        mov     bl, 0
        mov     bh, 0
        mov     dx, 0f9h
        mov     di, (C0_BASE+intcb_34654_110-APP3_SEG*16)
        int     7eh
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, (C0_BASE+L_3469A-APP3_SEG*16), APP3_SEG
        db      0cbh
intcb_34654_110:
        db      3ah, 06h
        db      04h, 2ch, 76h, 03h, 0a0h, 04h, 2ch, 3ah, 06h, 0ffh, 2bh, 72h, 0ch, 0a2h, 0ffh, 2bh
        db      0c4h, 36h, 0f2h, 2bh, 26h, 88h, 84h, 08h, 02h, 0a2h, 0feh, 2bh, 0c4h, 36h, 0f2h, 2bh
L_3469A                         equ     $+6
        db      26h, 88h, 84h, 07h, 02h, 0cbh
        mov     word ptr [C0_W_CURSOR_FN], cb_34636-APP3_CSBASE
        mov     cx, ds
        mov     si, 2bffh
        mov     bl, 0
        mov     bh, 0
        mov     dx, 0f9h
        mov     di, (C0_BASE+intcb_346A6_110-APP3_SEG*16)
        int     7eh
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, EP_FAR_34F28_OFF, APP3_SEG, (C0_BASE+L_346EC-APP3_SEG*16), APP3_SEG
        db      0cbh
intcb_346A6_110:
        db      3ah, 06h, 04h, 2ch, 76h, 03h, 0a0h, 04h, 2ch, 3ah, 06h, 0feh, 2bh, 73h, 0ch, 0a2h
        db      0feh, 2bh, 0c4h, 36h, 0f2h, 2bh, 26h, 88h, 84h, 7h, 02h, 0a2h, 0ffh, 2bh, 0c4h, 36h
L_346EC                         equ     $+8
        db      0f2h, 2bh, 26h, 88h, 84h, 08h, 02h, 0cbh
        mov     word ptr [C0_W_CURSOR_FN], cb_34931-APP3_CSBASE
        KEY_WHEEL2      (C0_BASE+L_34724-APP3_SEG*16), APP3_SEG, (C0_BASE+L_3470F-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (C0_BASE+L_3469A-APP3_SEG*16), APP3_SEG, 0000h, 0000h
L_3470F                         equ     $+1
        db      0cbh, 02h, 06h, 0ffh, 2bh, 73h
        db      02h, 0b0h, 0f9h, 3ah, 06h, 04h, 2ch, 72h, 03h, 0a0h, 04h, 2ch, 0a2h, 0ffh, 2bh, 0cbh
L_34724:
        db      8bh, 0c1h, 8ah, 0e0h, 0a0h, 0ffh, 2bh, 2ah, 0c4h, 73h, 02h, 0b0h, 00h, 3ah, 06h, 0feh
        db      2bh, 73h, 03h, 0a0h, 0feh, 2bh, 0a2h, 0ffh, 2bh, 0c4h, 36h, 0f2h, 2bh, 26h, 88h, 84h
        db      08h, 02h, 0cbh
L_35027:
        db      0c4h, 36h, 0f2h, 2bh, 8bh, 0feh, 83h, 0c6h, 0eh, 0b1h, 0ffh, 0feh, 0c1h
        db      83h, 0c6h, 02h, 26h, 80h, 3ch, 0ffh, 75h, 0f5h, 80h, 0e9h, 01h, 73h, 02h, 0b1h, 00h
        db      88h, 0eh, 04h, 2ch, 26h, 3ah, 8dh, 07h, 02h, 77h, 09h, 26h, 88h, 8dh, 07h, 02h
        db      88h, 0eh, 0feh, 2bh, 26h, 3ah, 8dh, 08h, 02h, 77h, 09h, 26h, 88h, 8dh, 08h, 02h
        db      88h, 0eh, 0ffh, 2bh, 26h, 8ah, 85h, 07h, 02h, 0a2h, 0feh, 2bh, 26h, 8ah, 85h, 08h
L_35079                         equ     $+5
        db      02h, 0a2h, 0ffh, 2bh, 0c3h, 0e8h, 69h, 0f0h
        mov     word ptr [C0_W_CURSOR_FN], cb_33CAD-APP3_CSBASE
        db      0e8h, 12h
        db      0fdh
        KEY_WHEEL2      (C0_BASE+L_347F4-APP3_SEG*16), APP3_SEG, (C0_BASE+L_3482E-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (C0_BASE+L_34D45-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34859-APP3_SEG*16), APP3_SEG, (C0_BASE+L_347D2-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34814-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (C0_BASE+L_3492E-APP3_SEG*16), APP3_SEG
        KEY_DOWN        15h, (C0_BASE+L_34954-APP3_SEG*16), APP3_SEG
L_347D2                         equ     $+1
        if      FW_VERSION >= 111
        db      0cbh, 0e8h, 18h
        else
        db      0cbh, 0e8h, 19h
        endif
        db      30h, 74h, 01h, 0cbh, 0c7h, 06h, 00h, 2ch, 00h, 00h, 83h, 3eh, 0fah, 2bh, 00h, 75h
        db      01h, 0cbh, 0cdh, 0a3h, 0ffh, 0eh, 0fah, 2bh, 0e8h, 0f6h, 0f3h, 0b3h, 1eh, 0cdh, 87h, 0cbh
L_347F4:
        if      FW_VERSION >= 111
        db      0e8h, 0f6h, 2fh, 74h, 01h, 0cbh, 0c7h, 06h, 00h, 2ch, 00h, 00h, 83h, 3eh, 0fah, 2bh
        else
        db      0e8h, 0f7h, 2fh, 74h, 01h, 0cbh, 0c7h, 06h, 00h, 2ch, 00h, 00h, 83h, 3eh, 0fah, 2bh
        endif
        db      00h, 75h, 01h, 0cbh, 0ffh, 0eh, 0fah, 2bh, 0e8h, 0d6h, 0f3h, 0b3h, 1eh, 0cdh, 87h, 0cbh
L_34814:
        if      FW_VERSION >= 111
        db      0e8h, 0d6h, 2fh, 74h, 01h, 0cbh, 0e8h, 0e3h, 0f3h, 75h, 01h, 0cbh, 0cdh, 0a3h, 0ffh, 06h
        else
        db      0e8h, 0d7h, 2fh, 74h, 01h, 0cbh, 0e8h, 0e3h, 0f3h, 75h, 01h, 0cbh, 0cdh, 0a3h, 0ffh, 06h
        endif
L_3482E                         equ     $+0ah
        if      FW_VERSION >= 111
        db      0fah, 2bh, 0e8h, 0bch, 0f3h, 0b3h, 1eh, 0cdh, 87h, 0cbh, 0e8h, 0bch, 2fh, 74h, 01h, 0cbh
        else
        db      0fah, 2bh, 0e8h, 0bch, 0f3h, 0b3h, 1eh, 0cdh, 87h, 0cbh, 0e8h, 0bdh, 2fh, 74h, 01h, 0cbh
        endif
        db      0c7h, 06h, 00h, 2ch, 00h, 00h, 0c4h, 36h, 0f2h, 2bh, 26h, 81h, 7ch, 10h, 0ffh, 00h
        db      75h, 01h, 0cbh, 0e8h, 0b6h, 0f3h, 75h, 01h, 0cbh, 0ffh, 06h, 0fah, 2bh, 0e8h, 91h, 0f3h
L_34859                         equ     $+5
        db      0b3h, 1eh, 0cdh, 87h, 0cbh
L_3483B:
        db      0e8h, 0a9h, 0efh
        mov     word ptr [C0_W_CURSOR_FN], cb_339C4-APP3_CSBASE
        db      8ch, 0d9h
        if      FW_VERSION >= 111
        db      0beh, 0fch, 2bh, 0b3h, 01h, 0b7h, 00h, 0bah, 63h, 00h, 0bfh, 0c0h, 0e9h, 0cdh, 7eh
        else
        db      0beh, 0fch, 2bh, 0b3h, 01h, 0b7h, 00h, 0bah, 63h, 00h, 0bfh, 0b2h, 0e9h, 0cdh, 7eh
        endif
        KEY_WHEEL2      (C0_BASE+L_3490E-APP3_SEG*16), APP3_SEG, (C0_BASE+L_348EE-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (C0_BASE+L_348D0-APP3_SEG*16), APP3_SEG, (C0_BASE+L_348DF-APP3_SEG*16), APP3_SEG, (C0_BASE+L_348B2-APP3_SEG*16), APP3_SEG, (C0_BASE+L_348C1-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (C0_BASE+L_3492E-APP3_SEG*16), APP3_SEG
        KEY_DOWN        15h, (C0_BASE+L_34954-APP3_SEG*16), APP3_SEG
        db      0cbh, 50h, 0e8h, 5ch, 0f3h
L_348B2                         equ     $+0eh
        db      75h, 04h, 0eh, 0e8h, 0aah, 00h, 0e8h, 53h, 0f3h, 58h, 26h, 88h, 04h, 0cbh, 80h, 3eh
L_348C1                         equ     $+0dh
        db      0ch, 2ch, 00h, 74h, 03h, 0e8h, 59h, 0f3h, 0eh, 0e8h, 12h, 0ffh, 0cbh, 80h, 3eh, 0ch
L_348D0                         equ     $+0ch
        db      2ch, 00h, 74h, 03h, 0e8h, 4ah, 0f3h, 0eh, 0e8h, 45h, 0ffh, 0cbh, 80h, 3eh, 0ch, 2ch
L_348DF                         equ     $+0bh
        db      00h, 74h, 03h, 0e8h, 3bh, 0f3h, 0eh, 0e8h, 0bbh, 0feh, 0cbh, 80h, 3eh, 0ch, 2ch, 00h
L_348EE                         equ     $+0ah
        if      FW_VERSION >= 111
        db      74h, 03h, 0e8h, 2ch, 0f3h, 0eh, 0e8h, 0b5h, 00h, 0cbh, 0e8h, 0fch, 2eh, 74h, 01h, 0cbh
        else
        db      74h, 03h, 0e8h, 2ch, 0f3h, 0eh, 0e8h, 0b5h, 00h, 0cbh, 0e8h, 0fdh, 2eh, 74h, 01h, 0cbh
        endif
        db      0e8h, 09h, 0f3h, 75h, 02h, 0ebh, 59h, 3ch, 62h, 75h, 01h, 0cbh, 0feh, 0c0h, 26h, 88h
L_3490E                         equ     $+0ah
        if      FW_VERSION >= 111
        db      04h, 0e8h, 0ddh, 0f2h, 0c6h, 06h, 0ch, 2ch, 01h, 0cbh, 0e8h, 0dch, 2eh, 74h, 01h, 0cbh
        else
        db      04h, 0e8h, 0ddh, 0f2h, 0c6h, 06h, 0ch, 2ch, 01h, 0cbh, 0e8h, 0ddh, 2eh, 74h, 01h, 0cbh
        endif
        db      0e8h, 0e9h, 0f2h, 75h, 02h, 0ebh, 39h, 3ch, 00h, 75h, 01h, 0cbh, 0feh, 0c8h, 26h, 88h
L_3492E                         equ     $+0ah
        if      FW_VERSION >= 111
        db      04h, 0e8h, 0bdh, 0f2h, 0c6h, 06h, 0ch, 2ch, 01h, 0cbh, 0e8h, 0bch, 2eh, 74h, 01h, 0cbh
        else
        db      04h, 0e8h, 0bdh, 0f2h, 0c6h, 06h, 0ch, 2ch, 01h, 0cbh, 0e8h, 0bdh, 2eh, 74h, 01h, 0cbh
        endif
        db      0e8h, 0c9h, 0f2h, 75h, 01h, 0cbh, 8bh, 0feh, 83h, 0c6h, 02h, 26h, 8bh, 04h, 83h, 0c6h
        db      02h, 0abh, 3ch, 0ffh, 75h, 0f5h, 0e8h, 0c8h, 0f2h, 0e8h, 95h, 0f2h, 0e8h, 0f4h, 0fdh, 0cbh
L_34954:
        if      FW_VERSION >= 111
        db      0e8h, 96h, 2eh, 74h, 01h, 0cbh, 0e8h, 36h, 0eeh, 0e8h, 0a0h, 0f2h, 8bh, 0deh, 0c4h, 36h
        else
        db      0e8h, 97h, 2eh, 74h, 01h, 0cbh, 0e8h, 36h, 0eeh, 0e8h, 0a0h, 0f2h, 8bh, 0deh, 0c4h, 36h
        endif
        db      0f2h, 2bh, 81h, 0c6h, 02h, 02h, 26h, 8bh, 04h, 3ch, 0ffh, 74h, 01h, 0cbh, 8bh, 0feh
        db      3bh, 0deh, 74h, 13h, 83h, 0eeh, 02h, 26h, 8bh, 04h, 26h, 89h, 05h, 83h, 0eeh, 02h
        db      83h, 0efh, 02h, 3bh, 0dfh, 75h, 0f0h, 26h, 0c7h, 05h, 00h, 01h, 0e8h, 82h, 0f2h, 0eh
        db      0e8h, 7dh, 0feh, 0e8h, 4bh, 0f2h, 72h, 01h, 0cbh, 0eh, 0e8h, 31h, 0feh, 0cbh, 0e8h, 60h
        db      0eeh
        mov     word ptr [C0_W_CURSOR_FN], cb_33CBF-APP3_CSBASE
        KEY_WHEEL2      (C0_BASE+L_349EA-APP3_SEG*16), APP3_SEG, (C0_BASE+L_349C8-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (C0_BASE+L_34A0C-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34A1C-APP3_SEG*16), APP3_SEG, (C0_BASE+L_3530C-APP3_SEG*16), APP3_SEG, EP_L_34A34_OFF, APP3_SEG
L_349C8                         equ     $+1
        if      FW_VERSION >= 111
        db      0cbh, 0e8h, 22h, 2eh, 74h, 01h, 0cbh, 0c7h, 06h, 00h, 2ch, 00h, 00h
        else
        db      0cbh, 0e8h, 23h, 2eh, 74h, 01h, 0cbh, 0c7h, 06h, 00h, 2ch, 00h, 00h
        endif
        db      0e8h, 29h, 0f2h, 75h, 01h, 0cbh, 80h, 0fch, 63h, 75h, 01h, 0cbh, 0feh, 0c4h, 26h, 88h
L_349EA                         equ     $+6
        if      FW_VERSION >= 111
        db      64h, 01h, 0e8h, 2ch, 0f2h, 0cbh, 0e8h, 00h, 2eh, 74h, 01h, 0cbh, 0c7h, 06h, 00h, 2ch
        else
        db      64h, 01h, 0e8h, 2ch, 0f2h, 0cbh, 0e8h, 01h, 2eh, 74h, 01h, 0cbh, 0c7h, 06h, 00h, 2ch
        endif
        db      00h, 00h, 0e8h, 07h, 0f2h, 75h, 01h, 0cbh, 80h, 0fch, 00h, 75h, 01h, 0cbh, 0feh, 0cch
L_34A0C                         equ     $+8
        if      FW_VERSION >= 111
        db      26h, 88h, 64h, 01h, 0e8h, 0ah, 0f2h, 0cbh, 0e8h, 06h, 0f2h, 0e8h, 0dbh, 2dh, 75h, 03h
        else
        db      26h, 88h, 64h, 01h, 0e8h, 0ah, 0f2h, 0cbh, 0e8h, 06h, 0f2h, 0e8h, 0dch, 2dh, 75h, 03h
        endif
L_34A1C                         equ     $+8
        if      FW_VERSION >= 111
        db      0e8h, 0ceh, 0f1h, 0eh, 0e8h, 3eh, 0feh, 0cbh, 0e8h, 0f6h, 0f1h, 0e8h, 0cbh, 2dh, 75h, 03h
        else
        db      0e8h, 0ceh, 0f1h, 0eh, 0e8h, 3eh, 0feh, 0cbh, 0e8h, 0f6h, 0f1h, 0e8h, 0cch, 2dh, 75h, 03h
        endif
        db      0e8h, 0beh, 0f1h, 0eh, 0e8h, 0ech, 0f7h, 0cbh
L_3530C:
        db      0e8h, 0e6h, 0f1h, 0eh, 0e8h, 9fh, 0fdh, 0cbh
L_35314:
L_34A3C                         equ     $+8
        db      0e8h, 0deh, 0f1h, 0eh, 0e8h, 0d9h, 0fdh, 0cbh, 0e8h, 78h, 0fah, 0c7h, 06h, 0fah, 2bh, 00h
        db      00h, 0e8h, 9dh, 0f1h, 73h, 01h, 0cbh, 8eh, 06h, 10h, 0fh, 26h, 80h, 3eh, 12h, 00h
        db      00h, 75h, 01h, 0cbh, 0c7h, 06h, 00h, 2ch, 00h, 00h, 9ah
        dw      EP_L_2F8E1_OFF, EP_L_2F8E1_SEG
        db      0e8h
        db      03h, 00h, 0cdh, 0a8h, 0cbh
        KEY_LOCATE      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        KEY_TRANSPORT   0000h, 0000h, 0000h, 0000h, (C0_BASE+L_34AC3-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h
        KEY_DOWN        3ah, (C0_BASE+L_34C64-APP3_SEG*16), APP3_SEG
L_34A9E                         equ     $+1
        db      0c3h, 0e8h, 16h, 0fah, 0e8h, 5ch, 0f1h
        db      75h, 01h, 0cbh, 80h, 0fch, 00h, 75h, 01h, 0cbh, 8eh, 06h, 10h, 0fh, 26h, 80h, 3eh
        db      12h, 00h, 00h, 75h, 01h, 0cbh, 9ah
        dw      EP_SEQ_PLAY_START_OFF, EP_SEQ_PLAY_START_SEG
L_34AC3                         equ     $+4
        db      0e8h, 0a7h, 0ffh, 0cbh, 0e8h
        db      0f1h, 0f9h, 9ah
        dw      EP_SEQ_PLAY_STOP_OFF, APP3_SEG
        db      0e8h, 01h, 00h, 0cbh
far_353AF:
        KEY_LOCATE      (C0_BASE+L_34C20-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34BE5-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_34B70-APP3_SEG*16), APP3_SEG, (C0_BASE+L_3537E-APP3_SEG*16), APP3_SEG
        KEY_TRANSPORT   0000h, 0000h, 0000h, 0000h, 0000h, 0000h, (C0_BASE+L_34A9E-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34A3C-APP3_SEG*16), APP3_SEG
        KEY_DOWN        3ah, (C0_BASE+L_34C57-APP3_SEG*16), APP3_SEG
        endif
        ret
L_3537E:
        if      FW_VERSION >= 112
        call    fn_34D97
        call    fn_344E0
        jne     br_35387
        retf
br_35387:
        cmp     ah, 0
        jne     br_3538D
        retf
br_3538D:
        mov     es, word ptr [A3_W_00F10]
        cmp     byte ptr es:[12h], 0
        jne     br_3539A
        retf
br_3539A:
        callf   EP_SEQ_PLAY_START_SEG:EP_SEQ_PLAY_START_OFF
        call    far_35349
        retf
L_34562:
        call    fn_34D97
        callf   APP3_SEG:EP_SEQ_PLAY_STOP_OFF
        call    far_353AF
        retf
far_353AF:
        if      FW_VERSION >= 114
        KEY_LOCATE      L_35500-APP3_CSBASE, APP3_SEG, L_354C5-APP3_CSBASE, APP3_SEG, 0000h, 0000h, L_35450-APP3_CSBASE, APP3_SEG, L_353E4-APP3_CSBASE, APP3_SEG
        KEY_TRANSPORT   0000h, 0000h, 0000h, 0000h, 0000h, 0000h, L_3537E-APP3_CSBASE, APP3_SEG, L_3531C-APP3_CSBASE, APP3_SEG
        else
        KEY_LOCATE      (C0_BASE+L_35500-APP3_SEG*16), APP3_SEG, (C0_BASE+L_354C5-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_35450-APP3_SEG*16), APP3_SEG, (C0_BASE+L_353E4-APP3_SEG*16), APP3_SEG
        KEY_TRANSPORT   0000h, 0000h, 0000h, 0000h, 0000h, 0000h, (C0_BASE+L_3537E-APP3_SEG*16), APP3_SEG, (C0_BASE+L_3531C-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        3ah, (C0_BASE+L_35537-APP3_SEG*16), APP3_SEG
        db      0c3h
L_353E4:
        if      FW_VERSION >= 120
        call    APP3_BASE+fn_280BD-SEGBASE
        else
        call    EP_FN_280BD_OFF+APP3_CSBASE
        endif
        je      br_353EA
        retf
br_353EA:
        call    fn_34D97
        mov     bx, 12ch
        int     0a9h
        jb      loop_35422
        int     0a3h
        call    fn_344E0
        jne     br_353FC
        retf
br_353FC:
        mov     es, word ptr [A3_W_00F10]
        cmp     byte ptr es:[12h], 0
        je      br_3541A
        int     86h
        inc     ax
        mov     es, word ptr [A3_W_00F10]
        cmp     ax, word ptr es:[1ah]
        jae     br_3541A
        call    EP_FN_30425_OFF+APP3_CSBASE
        retf
br_3541A:
        call    fn_35435
        mov     bl, 1eh
        int     87h
        retf
loop_35422:
        call    fn_344E0
        je      br_3542D
        inc     word ptr [C0_W_02C0A]
        jmp     loop_35422
br_3542D:
        call    fn_344C5
        mov     bl, 1eh
        int     87h
        retf
fn_35435:
        call    fn_344E0
        inc     word ptr [C0_W_02C10]
        cmp     ah, byte ptr [C0_W_02C10]
        je      br_35448
        mov     ah, 0
        int     0ech
        clc
        ret
br_35448:
        inc     word ptr [C0_W_02C0A]
        call    fn_344C5
        ret
L_35450:
        call    EP_FN_280BD_OFF+APP3_CSBASE
        je      br_35456
        retf
br_35456:
        call    fn_34D97
        mov     bx, 12ch
        int     0a9h
        jb      br_35492
        int     0a3h
        call    fn_344E0
        je      br_3547F
        mov     es, word ptr [A3_W_00F10]
        cmp     byte ptr es:[12h], 0
        je      br_3547F
        int     86h
        cmp     dx, 0
        jne     br_3548E
        sub     ax, 1
        jae     br_3548E
br_3547F:
        call    fn_354A0
        jae     br_35485
        retf
br_35485:
        mov     es, word ptr [A2_W_SEQ_SEG]
        mov     ax, word ptr es:[1ah]
        dec     ax
br_3548E:
        call    EP_FN_30425_OFF+APP3_CSBASE
        retf
br_35492:
        mov     word ptr [C0_W_02C0A], 0
        call    fn_344C5
        mov     bl, 1eh
        int     87h
        retf
fn_354A0:
        cmp     word ptr [C0_W_02C10], 0
        je      br_354B4
        dec     word ptr [C0_W_02C10]
        call    fn_344E0
        mov     ah, 0
        int     0ech
        clc
        ret
br_354B4:
        cmp     word ptr [C0_W_02C0A], 0
        stc
        jne     br_354BD
        ret
br_354BD:
        dec     word ptr [C0_W_02C0A]
        call    fn_344C5
        ret
L_354C5:
        call    EP_FN_280BD_OFF+APP3_CSBASE
        je      br_354CB
        retf
br_354CB:
        call    fn_34D97
        int     0a3h
        call    fn_344E0
        jne     br_354D6
        retf
br_354D6:
        mov     es, word ptr [A2_W_SEQ_SEG]
        cmp     byte ptr es:[12h], 0
        je      br_354FC
        mov     bl, 12h
        int     87h
        int     85h
        mov     es, word ptr [A2_W_SEQ_SEG]
        cmp     ax, word ptr es:[1ch]
        je      br_354F4
        retf
br_354F4:
        cmp     dx, word ptr es:[1eh]
        je      br_354FC
        retf
br_354FC:
        call    fn_35435
        retf
L_35500:
        call    EP_FN_280BD_OFF+APP3_CSBASE
        je      br_35506
        retf
br_35506:
        call    fn_34D97
        int     0a3h
        call    fn_344E0
        je      br_35522
        mov     es, word ptr [A3_W_00F10]
        cmp     byte ptr es:[12h], 0
        je      br_35522
        int     85h
        or      ax, dx
        jne     br_35531
br_35522:
        call    fn_354A0
        jae     br_35528
        retf
br_35528:
        mov     ax, 0ffffh
        mov     dx, ax
        mov     bl, 0ah
        int     87h
br_35531:
        mov     bl, 11h
        int     87h
        retf
        retf
L_35537:
        int     88h
        cmp     al, 0
        jne     L_34F50
        retf
L_34F50:
        call    far_35349
        int     0b2h
        retf
L_35544:
        int     88h
        cmp     al, 0
        jne     L_35555
        call    far_353AF
        push    cs
        call    far_3412E
        else
        if      FW_VERSION >= 111
        db      0e8h, 0e6h, 2ch, 74h, 01h, 0cbh, 0e8h, 0aah, 0f9h, 0bbh, 2ch, 01h, 0cdh, 0a9h, 72h, 2eh
        else
        db      0e8h, 0e7h, 2ch, 74h, 01h, 0cbh, 0e8h, 0aah, 0f9h, 0bbh, 2ch, 01h, 0cdh, 0a9h, 72h, 2eh
        endif
        db      0cdh, 0a3h, 0e8h, 0e7h, 0f0h, 75h, 01h, 0cbh, 8eh, 06h, 10h, 0fh, 26h, 80h, 3eh, 12h
        db      00h, 00h, 74h, 12h, 0cdh, 86h, 40h, 8eh, 06h, 10h, 0fh, 26h, 3bh, 06h, 1ah, 00h
        db      73h, 04h, 0e8h, 1ah, 0b0h, 0cbh, 0e8h, 18h, 00h, 0b3h, 1eh, 0cdh, 87h, 0cbh, 0e8h, 0bbh
        db      0f0h, 74h, 06h, 0ffh, 06h, 0fah, 2bh, 0ebh, 0f5h, 0e8h, 95h, 0f0h, 0b3h, 1eh, 0cdh, 87h
        db      0cbh, 0e8h, 0a8h, 0f0h, 0ffh, 06h, 00h, 2ch, 3ah, 26h, 00h, 2ch, 74h, 06h, 0b4h, 00h
L_34B70                         equ     $+0ch
        if      FW_VERSION >= 111
        db      0cdh, 0ech, 0f8h, 0c3h, 0ffh, 06h, 0fah, 2bh, 0e8h, 76h, 0f0h, 0c3h, 0e8h, 7ah, 2ch, 74h
        else
        db      0cdh, 0ech, 0f8h, 0c3h, 0ffh, 06h, 0fah, 2bh, 0e8h, 76h, 0f0h, 0c3h, 0e8h, 7bh, 2ch, 74h
        endif
        db      01h, 0cbh, 0e8h, 3eh, 0f9h, 0bbh, 2ch, 01h, 0cdh, 0a9h, 72h, 32h, 0cdh, 0a3h, 0e8h, 7bh
        db      0f0h, 74h, 18h, 8eh, 06h, 10h, 0fh, 26h, 80h, 3eh, 12h, 00h, 00h, 74h, 0ch, 0cdh
        db      86h, 83h, 0fah, 00h, 75h, 14h, 2dh, 01h, 00h, 73h, 0fh, 0e8h, 1eh, 00h, 73h, 01h
        db      0cbh, 8eh, 06h, 10h, 0fh, 26h, 0a1h, 1ah, 00h, 48h, 0e8h, 0a2h, 0afh, 0cbh, 0c7h, 06h
        db      0fah, 2bh, 00h, 00h, 0e8h, 2ah, 0f0h, 0b3h, 1eh, 0cdh, 87h, 0cbh, 83h, 3eh, 00h, 2ch
        db      00h, 74h, 0dh, 0ffh, 0eh, 00h, 2ch, 0e8h, 32h, 0f0h, 0b4h, 00h, 0cdh, 0ech, 0f8h, 0c3h
        db      83h, 3eh, 0fah, 2bh, 00h, 0f9h, 75h, 01h, 0c3h, 0ffh, 0eh, 0fah, 2bh, 0e8h, 01h, 0f0h
L_34BE5                         equ     $+1
        if      FW_VERSION >= 111
        db      0c3h, 0e8h, 05h, 2ch, 74h, 01h, 0cbh, 0e8h, 0c9h, 0f8h, 0cdh, 0a3h, 0e8h, 0dh, 0f0h, 75h
        else
        db      0c3h, 0e8h, 6h, 2ch, 74h, 01h, 0cbh, 0e8h, 0c9h, 0f8h, 0cdh, 0a3h, 0e8h, 0dh, 0f0h, 75h
        endif
        db      01h, 0cbh, 8eh, 06h, 10h, 0fh, 26h, 80h, 3eh, 12h, 00h, 00h, 74h, 1ah, 0b3h, 12h
        db      0cdh, 87h, 0cdh, 85h, 8eh, 06h, 10h, 0fh, 26h, 3bh, 06h, 1ch, 00h, 74h, 01h, 0cbh
L_34C20                         equ     $+0ch
        if      FW_VERSION >= 111
        db      26h, 3bh, 16h, 1eh, 00h, 74h, 01h, 0cbh, 0e8h, 36h, 0ffh, 0cbh, 0e8h, 0cah, 2bh, 74h
        else
        db      26h, 3bh, 16h, 1eh, 00h, 74h, 01h, 0cbh, 0e8h, 36h, 0ffh, 0cbh, 0e8h, 0cbh, 2bh, 74h
        endif
        db      01h, 0cbh, 0e8h, 8eh, 0f8h, 0cdh, 0a3h, 0e8h, 0d2h, 0efh, 74h, 12h, 8eh, 06h, 10h, 0fh
        db      26h, 80h, 3eh, 12h, 00h, 00h, 74h, 06h, 0cdh, 85h, 0bh, 0c2h, 75h, 0fh, 0e8h, 7bh
        db      0ffh, 73h, 01h, 0cbh, 0b8h, 0ffh, 0ffh, 8bh, 0d0h, 0b3h, 0ah, 0cdh, 87h, 0b3h, 11h, 0cdh
L_34C57                         equ     $+3
        db      87h, 0cbh, 0cbh, 0cdh, 88h, 3ch, 00h, 75h, 01h, 0cbh, 0e8h, 08h, 0feh, 0cdh, 0b2h, 0cbh
L_34C64:
        db      0cdh, 88h, 3ch, 00h, 75h, 0bh, 0e8h, 62h, 0feh, 0eh, 0e8h, 0ddh, 0ebh
        endif
        DISP_FLUSH
        retf
L_35555:
        call    fn_34136
        int     0a7h
        test    al, 1
        jne     L_3557E
        DISP_ERASE      0e3h, 1eh, 0dh, 09h
        call    fn_344E0
        mov     al, ah
        mov     ah, 0
        sub     ax, word ptr [C0_W_02C10]
        else
        db      58h, 2ah, 06h, 0feh, 2bh, 0feh, 0c0h, 0b4h, 00h
        DISP_NUM        9ch, 2ah, 03h
        db      0ffh, 16h, 0e4h, 2bh, 0cbh
cb_340CC_107:
        db      0b1h, 9bh, 0b5h, 0bh
        mov     al, 15h
        int     0b0h
        ret
cb_34928:
        DISP_CURSOR     9bh, 21h, 15h
        ret
cb_34931:
        mov     cl, 9bh
        db      0b5h, 2ah, 0b0h, 15h, 0cdh, 0b0h, 0c3h
far_34F28:
        mov     word ptr [C0_W_CURSOR_FN], cb_340CC_107-APP3_CSBASE
        db      8ch, 0d9h, 0beh
        db      0feh, 2bh, 0b3h, 00h, 0b7h, 00h, 0bah, 0f9h, 00h, 0bfh, 51h, 0e7h, 0cdh, 7eh
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, (C0_BASE+L_34F7A-APP3_SEG*16), APP3_SEG
        db      0cbh, 3ah, 06h, 04h, 2ch, 76h, 03h, 0a0h, 04h, 2ch, 3ah, 06h, 0ffh, 2bh, 72h, 0ch
        db      0a2h, 0ffh, 2bh, 0c4h, 36h, 0f2h, 2bh, 26h, 88h, 84h, 08h, 02h, 0a2h, 0feh, 2bh, 0c4h
        db      36h, 0f2h, 2bh, 26h, 88h, 84h, 07h, 02h, 0cbh
L_34F7A:
        mov     word ptr [C0_W_CURSOR_FN], cb_34928-APP3_CSBASE
        db      8ch
        db      0d9h, 0beh, 0ffh, 2bh, 0b3h, 00h, 0b7h, 00h, 0bah, 0f9h, 00h, 0bfh, 0a3h, 0e7h, 0cdh, 7eh
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (C0_BASE+far_34F28-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34FCC-APP3_SEG*16), APP3_SEG
        db      0cbh, 3ah, 06h, 04h, 2ch, 76h, 03h, 0a0h, 04h, 2ch, 3ah, 06h, 0feh, 2bh
        db      73h, 0ch, 0a2h, 0feh, 2bh, 0c4h, 36h, 0f2h, 2bh, 26h, 88h, 84h, 07h, 02h, 0a2h, 0ffh
        db      2bh, 0c4h, 36h, 0f2h, 2bh, 26h, 88h, 84h, 08h, 02h, 0cbh
L_34FCC:
        mov     word ptr [C0_W_CURSOR_FN], cb_34931-APP3_CSBASE
        KEY_WHEEL2      (C0_BASE+L_34826-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34811-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (C0_BASE+L_34F7A-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      0cbh
L_34811:
        db      02h, 06h
        db      0ffh, 2bh, 73h, 02h, 0b0h, 0f9h, 3ah, 06h, 04h, 2ch, 72h, 03h, 0a0h, 04h, 2ch, 0a2h
        db      0ffh, 2bh, 0cbh
L_34826:
        db      8bh, 0c1h, 8ah, 0e0h, 0a0h, 0ffh, 2bh, 2ah, 0c4h, 73h, 02h, 0b0h, 00h
        db      3ah, 06h, 0feh, 2bh, 73h, 03h, 0a0h, 0feh, 2bh, 0a2h, 0ffh, 2bh, 0c4h, 36h, 0f2h, 2bh
        db      26h, 88h, 84h, 08h, 02h, 0cbh
L_35027:
        db      0c4h, 36h, 0f2h, 2bh, 8bh, 0feh, 83h, 0c6h, 0eh, 0b1h
        db      0ffh, 0feh, 0c1h, 83h, 0c6h, 02h, 26h, 80h, 3ch, 0ffh, 75h, 0f5h, 80h, 0e9h, 01h, 73h
        db      02h, 0b1h, 00h, 88h, 0eh, 04h, 2ch, 26h, 3ah, 8dh, 07h, 02h, 77h, 09h, 26h, 88h
        db      8dh, 07h, 02h, 88h, 0eh, 0feh, 2bh, 26h, 3ah, 8dh, 08h, 02h, 77h, 09h, 26h, 88h
        db      8dh, 08h, 02h, 88h, 0eh, 0ffh, 2bh, 26h, 8ah, 85h, 07h, 02h, 0a2h, 0feh, 2bh, 26h
        db      8ah, 85h, 08h, 02h, 0a2h, 0ffh, 2bh, 0c3h
L_35079:
        db      0e8h, 6ch, 0f0h
        mov     word ptr [C0_W_CURSOR_FN], cb_33CAD-APP3_CSBASE
        db      0e8h, 12h, 0fdh
        KEY_WHEEL2      (C0_BASE+L_34293-APP3_SEG*16), APP3_SEG, (C0_BASE+L_342CD-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (C0_BASE+L_34D45-APP3_SEG*16), APP3_SEG, (C0_BASE+L_3483B-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34271-APP3_SEG*16), APP3_SEG, (C0_BASE+L_342B3-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (C0_BASE+L_34A30-APP3_SEG*16), APP3_SEG
        KEY_DOWN        15h, (C0_BASE+L_34A56-APP3_SEG*16), APP3_SEG
br_350B1:
        db      0cbh
L_34271:
        db      0e8h, 3dh, 30h, 74h, 01h, 0cbh, 0c7h, 06h, 00h, 2ch, 00h, 00h, 83h, 3eh, 0fah
        db      2bh, 00h, 75h, 01h, 0cbh, 0cdh, 0a3h, 0ffh, 0eh, 0fah, 2bh, 0e8h, 02h, 0f4h, 0b3h, 1eh
        db      0cdh, 87h, 0cbh
L_34293:
        db      0e8h, 1bh, 30h, 74h, 01h, 0cbh, 0c7h, 06h, 00h, 2ch, 00h, 00h, 83h
        db      3eh, 0fah, 2bh, 00h, 75h, 01h, 0cbh, 0ffh, 0eh, 0fah, 2bh, 0e8h, 0e2h, 0f3h, 0b3h, 1eh
        db      0cdh, 87h, 0cbh
L_342B3:
        db      0e8h, 0fbh, 2fh, 74h, 01h, 0cbh, 0e8h, 0efh, 0f3h, 75h, 01h, 0cbh, 0cdh
        db      0a3h, 0ffh, 06h, 0fah, 2bh, 0e8h, 0c8h, 0f3h, 0b3h, 1eh, 0cdh, 87h, 0cbh
L_342CD:
        db      0e8h, 0e1h, 2fh
        db      74h, 01h, 0cbh, 0c7h, 06h, 00h, 2ch, 00h, 00h, 0c4h, 36h, 0f2h, 2bh, 26h, 81h, 7ch
        db      10h, 0ffh, 00h, 75h, 01h, 0cbh, 0e8h, 0c2h, 0f3h, 75h, 01h, 0cbh, 0ffh, 06h, 0fah, 2bh
        db      0e8h, 9dh, 0f3h, 0b3h, 1eh, 0cdh, 87h, 0cbh
L_3483B:
        db      0e8h, 0ach, 0efh
        mov     word ptr [C0_W_CURSOR_FN], cb_339C4-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0fch, 2bh, 0b3h, 01h, 0b7h, 00h, 0bah, 63h, 00h, 0bfh, 7fh, 0e9h
        db      0cdh, 7eh
        KEY_WHEEL2      (C0_BASE+L_343AD_107-APP3_SEG*16), APP3_SEG, (C0_BASE+L_3438D-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (C0_BASE+L_349C3-APP3_SEG*16), APP3_SEG, (C0_BASE+L_349D2-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34351-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34360-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (C0_BASE+L_34A30-APP3_SEG*16), APP3_SEG
        KEY_DOWN        15h, (C0_BASE+L_34A56-APP3_SEG*16), APP3_SEG
        db      0cbh, 50h
        db      0e8h, 68h, 0f3h, 75h, 04h, 0eh, 0e8h, 0aah, 00h, 0e8h, 5fh, 0f3h, 58h, 26h, 88h, 04h
        db      0cbh
L_34351:
        db      80h, 3eh, 0ch, 2ch, 00h, 74h, 03h, 0e8h, 65h, 0f3h, 0eh, 0e8h, 12h, 0ffh, 0cbh
L_34360:
        db      80h, 3eh, 0ch, 2ch, 00h, 74h, 03h, 0e8h, 56h, 0f3h, 0eh, 0e8h, 45h, 0ffh, 0cbh
L_349C3:
        db      80h
        db      3eh, 0ch, 2ch, 00h, 74h, 03h, 0e8h, 47h, 0f3h, 0eh, 0e8h, 0bbh, 0feh, 0cbh
L_349D2:
        db      80h, 3eh
        db      0ch, 2ch, 00h, 74h, 03h, 0e8h, 38h, 0f3h, 0eh, 0e8h, 0b5h, 00h, 0cbh
L_3438D:
        db      0e8h, 21h, 2fh
        db      74h, 01h, 0cbh, 0e8h, 15h, 0f3h, 75h, 02h, 0ebh, 59h, 3ch, 62h, 75h, 01h, 0cbh, 0feh
        db      0c0h, 26h, 88h, 04h, 0e8h, 0e9h, 0f2h, 0c6h, 06h, 0ch, 2ch, 01h, 0cbh
L_343AD_107:
        db      0e8h, 01h, 2fh
        db      74h, 01h, 0cbh, 0e8h, 0f5h, 0f2h, 75h, 02h, 0ebh, 39h, 3ch, 00h, 75h, 01h, 0cbh, 0feh
        db      0c8h, 26h, 88h, 04h, 0e8h, 0c9h, 0f2h, 0c6h, 06h, 0ch, 2ch, 01h, 0cbh
L_34A30:
        db      0e8h, 0e1h, 2eh
        db      74h, 01h, 0cbh, 0e8h, 0d5h, 0f2h, 75h, 01h, 0cbh, 8bh, 0feh, 83h, 0c6h, 02h, 26h, 8bh
        db      04h, 83h, 0c6h, 02h, 0abh, 3ch, 0ffh, 75h, 0f5h, 0e8h, 0d4h, 0f2h, 0e8h, 0a1h, 0f2h, 0e8h
        db      0f4h, 0fdh, 0cbh
L_34A56:
        db      0e8h, 0bbh, 2eh, 74h, 01h, 0cbh, 0e8h, 39h, 0eeh, 0e8h, 0ach, 0f2h, 8bh
        db      0deh, 0c4h, 36h, 0f2h, 2bh, 81h, 0c6h, 02h, 02h, 26h, 8bh, 04h, 3ch, 0ffh, 74h, 01h
        db      0cbh, 8bh, 0feh, 3bh, 0deh, 74h, 13h, 83h, 0eeh, 02h, 26h, 8bh, 04h, 26h, 89h, 05h
        db      83h, 0eeh, 02h, 83h, 0efh, 02h, 3bh, 0dfh, 75h, 0f0h, 26h, 0c7h, 05h, 00h, 01h, 0e8h
        db      8eh, 0f2h, 0eh, 0e8h, 7dh, 0feh, 0e8h, 57h, 0f2h, 72h, 01h, 0cbh, 0eh, 0e8h, 31h, 0feh
        db      0cbh, 0e8h, 63h, 0eeh
        mov     word ptr [C0_W_CURSOR_FN], cb_33CBF-APP3_CSBASE
        KEY_WHEEL2      (C0_BASE+L_34AEC-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34467-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (C0_BASE+L_34B0E-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34B1E-APP3_SEG*16), APP3_SEG, (C0_BASE+L_34B2E-APP3_SEG*16), APP3_SEG, (C0_BASE+L_35314-APP3_SEG*16), APP3_SEG
        db      0cbh
L_34467:
        db      0e8h, 47h, 2eh, 74h, 01h, 0cbh, 0c7h, 06h, 00h
        db      2ch, 00h, 00h, 0e8h, 35h, 0f2h, 75h, 01h, 0cbh, 80h, 0fch, 63h, 75h, 01h, 0cbh, 0feh
        db      0c4h, 26h, 88h, 64h, 01h, 0e8h, 38h, 0f2h, 0cbh
L_34AEC:
        db      0e8h, 25h, 2eh, 74h, 01h, 0cbh, 0c7h
        db      06h, 00h, 2ch, 00h, 00h, 0e8h, 13h, 0f2h, 75h, 01h, 0cbh, 80h, 0fch, 00h, 75h, 01h
        db      0cbh, 0feh, 0cch, 26h, 88h, 64h, 01h, 0e8h, 16h, 0f2h, 0cbh
L_34B0E:
        db      0e8h, 12h, 0f2h, 0e8h, 00h
        db      2eh, 75h, 03h, 0e8h, 0dah, 0f1h, 0eh, 0e8h, 3eh, 0feh, 0cbh
L_34B1E:
        db      0e8h, 02h, 0f2h, 0e8h, 0f0h
        db      2dh, 75h, 03h, 0e8h, 0cah, 0f1h, 0eh, 0e8h, 0ech, 0f7h, 0cbh
L_34B2E:
        db      0e8h, 0f2h, 0f1h, 0eh, 0e8h
        db      9fh, 0fdh, 0cbh
L_35314:
        db      0e8h, 0eah, 0f1h, 0eh, 0e8h, 0d9h, 0fdh, 0cbh
L_3531C:
        db      0e8h, 78h, 0fah, 0c7h, 06h
        db      0fah, 2bh, 00h, 00h, 0e8h, 0a9h, 0f1h, 73h, 01h, 0cbh, 8eh, 06h, 10h, 0fh, 26h, 80h
        db      3eh, 12h, 00h, 00h, 75h, 01h, 0cbh, 0c7h, 06h, 00h, 2ch, 00h, 00h, 9ah
        dw      EP_L_2F8E1_OFF, EP_L_2F8E1_SEG
        db      0e8h, 03h, 00h, 0cdh, 0a8h, 0cbh
far_35349:
        KEY_LOCATE      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        KEY_TRANSPORT   0000h, 0000h, 0000h, 0000h, (C0_BASE+L_34562-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h
        KEY_DOWN        3ah, (C0_BASE+L_35544-APP3_SEG*16), APP3_SEG
        ret
L_3537E:
        call    fn_34D97
        call    fn_344E0
        jne     br_35387
        retf
br_35387:
        cmp     ah, 0
        jne     br_3538D
        retf
br_3538D:
        mov     es, word ptr [A3_W_00F10]
        cmp     byte ptr es:[12h], 0
        jne     br_3539A
        retf
br_3539A:
        callf   EP_SEQ_PLAY_START_SEG:EP_SEQ_PLAY_START_OFF
        call    far_35349
        retf
L_34562:
        call    fn_34D97
        callf   APP3_SEG:EP_SEQ_PLAY_STOP_OFF
        call    far_353AF
        retf
far_353AF:
        KEY_LOCATE      (C0_BASE+L_35500-APP3_SEG*16), APP3_SEG, (C0_BASE+L_354C5-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (C0_BASE+L_35450-APP3_SEG*16), APP3_SEG, (C0_BASE+L_353E4-APP3_SEG*16), APP3_SEG
        KEY_TRANSPORT   0000h, 0000h, 0000h, 0000h, 0000h, 0000h, (C0_BASE+L_3537E-APP3_SEG*16), APP3_SEG, (C0_BASE+L_3531C-APP3_SEG*16), APP3_SEG
        KEY_DOWN        3ah, (C0_BASE+L_35537-APP3_SEG*16), APP3_SEG
        db      0c3h
L_353E4:
        db      0e8h
        or      bp, word ptr [di]
        je      br_353EA
        retf
br_353EA:
        call    fn_34D97
        mov     bx, 12ch
        int     0a9h
        jb      loop_35422
        int     0a3h
        call    fn_344E0
        jne     br_353FC
        retf
br_353FC:
        mov     es, word ptr [A3_W_00F10]
        cmp     byte ptr es:[12h], 0
        je      br_3541A
        int     86h
        inc     ax
        mov     es, word ptr [A3_W_00F10]
        cmp     ax, word ptr es:[1ah]
        jae     br_3541A
        call    EP_FN_30425_OFF+APP3_CSBASE
        retf
br_3541A:
        call    fn_35435
        mov     bl, 1eh
        int     87h
        retf
loop_35422:
        call    fn_344E0
        je      br_3542D
        inc     word ptr [C0_W_02C0A]
        jmp     loop_35422
br_3542D:
        call    fn_344C5
        mov     bl, 1eh
        int     87h
        retf
fn_35435:
        call    fn_344E0
        inc     word ptr [C0_W_02C10]
        cmp     ah, byte ptr [C0_W_02C10]
        je      br_35448
        mov     ah, 0
        int     0ech
        clc
        ret
br_35448:
        inc     word ptr [C0_W_02C0A]
        call    fn_344C5
        ret
L_35450:
        call    EP_FN_280BD_OFF+APP3_CSBASE
        je      br_35456
        retf
br_35456:
        call    fn_34D97
        mov     bx, 12ch
        int     0a9h
        jb      br_35492
        int     0a3h
        call    fn_344E0
        je      br_3547F
        mov     es, word ptr [A3_W_00F10]
        cmp     byte ptr es:[12h], 0
        je      br_3547F
        int     86h
        cmp     dx, 0
        jne     br_3548E
        sub     ax, 1
        jae     br_3548E
br_3547F:
        call    fn_354A0
        jae     br_35485
        retf
br_35485:
        mov     es, word ptr [A2_W_SEQ_SEG]
        mov     ax, word ptr es:[1ah]
        dec     ax
br_3548E:
        call    EP_FN_30425_OFF+APP3_CSBASE
        retf
br_35492:
        mov     word ptr [C0_W_02C0A], 0
        call    fn_344C5
        mov     bl, 1eh
        int     87h
        retf
fn_354A0:
        cmp     word ptr [C0_W_02C10], 0
        je      br_354B4
        dec     word ptr [C0_W_02C10]
        call    fn_344E0
        mov     ah, 0
        int     0ech
        clc
        ret
br_354B4:
        cmp     word ptr [C0_W_02C0A], 0
        stc
        jne     br_354BD
        ret
br_354BD:
        dec     word ptr [C0_W_02C0A]
        call    fn_344C5
        ret
L_354C5:
        call    EP_FN_280BD_OFF+APP3_CSBASE
        je      br_354CB
        retf
br_354CB:
        call    fn_34D97
        int     0a3h
        call    fn_344E0
        jne     br_354D6
        retf
br_354D6:
        mov     es, word ptr [A2_W_SEQ_SEG]
        cmp     byte ptr es:[12h], 0
        je      br_354FC
        mov     bl, 12h
        int     87h
        int     85h
        mov     es, word ptr [A2_W_SEQ_SEG]
        cmp     ax, word ptr es:[1ch]
        je      br_354F4
        retf
br_354F4:
        cmp     dx, word ptr es:[1eh]
        je      br_354FC
        retf
br_354FC:
        call    fn_35435
        retf
L_35500:
        call    EP_FN_280BD_OFF+APP3_CSBASE
        je      br_35506
        retf
br_35506:
        call    fn_34D97
        int     0a3h
        call    fn_344E0
        je      br_35522
        mov     es, word ptr [A3_W_00F10]
        cmp     byte ptr es:[12h], 0
        je      br_35522
        int     85h
        or      ax, dx
        jne     br_35531
br_35522:
        call    fn_354A0
        jae     br_35528
        retf
br_35528:
        mov     ax, 0ffffh
        mov     dx, ax
        mov     bl, 0ah
        int     87h
br_35531:
        mov     bl, 11h
        int     87h
        retf
        retf
L_35537:
        int     88h
        cmp     al, 0
        jne     L_34F50
        retf
L_34F50:
        call    far_35349
        int     0b2h
        retf
L_35544:
        db      0cdh, 88h, 3ch, 00h, 75h, 0bh, 0e8h, 62h, 0feh, 0eh, 0e8h, 0e0h, 0ebh
        DISP_FLUSH
        db      0cbh, 0e8h, 0e1h, 0ebh, 0cdh, 0a7h, 0a8h, 01h, 75h, 20h
        DISP_ERASE      0e3h, 1eh, 0dh, 09h
        db      0e8h, 84h, 0efh, 8ah, 0c4h, 0b4h, 00h, 2bh, 06h, 00h, 2ch
        endif
        DISP_NUMR       0e4h, 1fh, 02h
        if      FW_VERSION >= 120
        db      0ffh
        push    ss
        hlt
        sub     cx, bp
        pop     word ptr [bx+di]
        else
        db      0ffh, 16h, 0e4h, 2bh
        DISP_FLUSH
        endif
        retf
L_3557E:
        DISP_ERASE      68h, 1eh, 73h, 09h
        DISP_ERASE      0e3h, 1eh, 0dh, 09h
        call    word ptr [C0_W_02BF4]
        DISP_FLUSH
        retf
isr_35594:
        push    ds
        mov     bp, APPDATA_SEG
        mov     ds, bp
        call    fn_344E0
        mov     bl, al
        inc     word ptr [C0_W_02C10]
        cmp     ah, byte ptr [C0_W_02C10]
        je      isr_355B5
        call    fn_344E0
        mov     ah, 0
        int     0ech
        call    fn_344E0
        pop     ds
        iret
isr_355B5:
        inc     word ptr [C0_W_02C0A]
        les     si, [C0_FP_02C02]
        cmp     byte ptr es:[si+209h], 0
        je      isr_355DA
        mov     al, byte ptr es:[si+208h]
        cmp     al, byte ptr [C0_W_02C0A]
        jae     isr_355DA
        mov     al, byte ptr es:[si+207h]
        mov     ah, 0
        mov     word ptr [C0_W_02C0A], ax
isr_355DA:
        call    fn_344C5
        call    fn_344E0
        pop     ds
        iret
isr_355E2:
        push    ds
        mov     bp, APPDATA_SEG
        mov     ds, bp
        les     si, [C0_FP_02C1E]
        mov     ax, word ptr [C0_W_02C0A]
        if      FW_VERSION >= 110
        mov     bx, 18h
        else
        mov     bx, 16h
        endif
        mul     bx
        add     si, ax
        if      FW_VERSION >= 110
        mov     ax, word ptr es:[si+10h]
        mov     dx, word ptr es:[si+12h]
        else
        mov     ax, word ptr es:[si+0eh]
        mov     dx, word ptr es:[si+10h]
        endif
        mov     cx, word ptr [C0_W_02C10]
        push    si
        int     8bh
        pop     si
        add     ax, word ptr es:[si+4]
        adc     dx, word ptr es:[si+6]
        pop     ds
        iret
isr_35610:
        push    ds
        mov     bp, APPDATA_SEG
        mov     ds, bp
        call    fn_3561B
        pop     ds
        iret
fn_3561B:
        les     si, [C0_FP_02C1E]
        mov     ax, word ptr [C0_W_02C0A]
        if      FW_VERSION >= 110
        mov     bx, 18h
        else
        mov     bx, 16h
        endif
        mul     bx
        add     si, ax
        if      FW_VERSION >= 110
        mov     ax, word ptr es:[si+14h]
        mov     dx, word ptr es:[si+16h]
        else
        mov     ax, word ptr es:[si+12h]
        mov     dx, word ptr es:[si+14h]
        endif
        mov     cx, word ptr [C0_W_02C10]
        push    si
        int     8bh
        pop     si
        add     ax, word ptr es:[si+8]
        adc     dx, word ptr es:[si+0ah]
        if      FW_VERSION >= 110
        mov     cx, dx
        mov     dx, ax
        mov     bx, 0
        adc     bx, word ptr es:[si+0ch]
        mov     ax, 0
        endif
        mov     di, 3e8h
        mov     si, 0
        if      FW_VERSION >= 110
        mov     bp, 0
        int     56h
        else
        int     0b8h
        endif
        push    ax
        push    dx
        les     si, [C0_FP_02C02]
        add     si, 20ah
        mov     bp, si
        int     0e5h
        pop     dx
        pop     ax
        add     ax, di
        adc     dx, si
        ret
isr_3566F:
        push    ds
        mov     bp, APPDATA_SEG
        mov     ds, bp
        call    fn_3567A
        pop     ds
        iret
fn_3567A:
        les     si, [C0_FP_02C1E]
        mov     word ptr [C0_W_02C0A], 0
        mov     word ptr [C0_W_02C10], 0
loop_3568A:
        if      FW_VERSION >= 110
        cmp     word ptr es:[si+0eh], 0
        else
        cmp     word ptr es:[si+0ch], 0
        endif
        je      isr_356DF
        mov     bx, ax
        mov     cx, dx
        sub     bx, word ptr es:[si+4]
        sbb     cx, word ptr es:[si+6]
        jb      br_356A8
        if      FW_VERSION >= 110
        add     si, 18h
        else
        add     si, 16h
        endif
        inc     word ptr [C0_W_02C0A]
        jmp     loop_3568A
br_356A8:
        if      FW_VERSION >= 110
        sub     si, 18h
        else
        sub     si, 16h
        endif
        dec     word ptr [C0_W_02C0A]
        sub     ax, word ptr es:[si+4]
        sbb     dx, word ptr es:[si+6]
loop_356B7:
        if      FW_VERSION >= 110
        sub     ax, word ptr es:[si+10h]
        sbb     dx, word ptr es:[si+12h]
        else
        sub     ax, word ptr es:[si+0eh]
        sbb     dx, word ptr es:[si+10h]
        endif
        jb      br_356C7
        inc     word ptr [C0_W_02C10]
        jmp     SHORT loop_356B7
br_356C7:
        if      FW_VERSION >= 110
        add     ax, word ptr es:[si+10h]
        adc     dx, word ptr es:[si+12h]
        else
        add     ax, word ptr es:[si+0eh]
        adc     dx, word ptr es:[si+10h]
        endif
loop_356CF:
        push    ax
        push    dx
        push    word ptr [C0_W_02C10]
        call    fn_344C5
        pop     ax
        mov     word ptr [C0_W_02C10], ax
        pop     dx
        pop     ax
        ret
isr_356DF:
        dec     word ptr [C0_W_02C0A]
        sub     ax, ax
        sub     dx, dx
        jmp     loop_356CF
isr_356E9:
        push    ds
        mov     bp, APPDATA_SEG
        mov     ds, bp
        call    fn_356FE
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
fn_356FE:
        if      FW_VERSION >= 110
        mov     di, 3e8h
        mov     si, 0
        int     55h
        else
        mov     cx, 3e8h
        int     8bh
        endif
        les     si, [C0_FP_02C1E]
        mov     word ptr [C0_W_02C0A], 0
        mov     word ptr [C0_W_02C10], 0
loop_35716:
        if      FW_VERSION >= 110
        cmp     word ptr es:[si+0eh], 0
        else
        cmp     word ptr es:[si+0ch], 0
        endif
        je      br_3577E
        mov     bx, ax
        if      FW_VERSION >= 110
        mov     di, dx
        mov     bp, cx
        else
        mov     cx, dx
        endif
        sub     bx, word ptr es:[si+8]
        if      FW_VERSION >= 110
        sbb     di, word ptr es:[si+0ah]
        sbb     bp, word ptr es:[si+0ch]
        else
        sbb     cx, word ptr es:[si+0ah]
        endif
        jb      br_3573A
        if      FW_VERSION >= 110
        add     si, 18h
        else
        add     si, 16h
        endif
        inc     word ptr [C0_W_02C0A]
        jmp     loop_35716
br_3573A:
        if      FW_VERSION >= 110
        sub     si, 18h
        else
        sub     si, 16h
        endif
        dec     word ptr [C0_W_02C0A]
        sub     ax, word ptr es:[si+8]
        sbb     dx, word ptr es:[si+0ah]
        if      FW_VERSION >= 110
        sbb     cx, word ptr es:[si+0ch]
        endif
loop_3574D:
        if      FW_VERSION >= 110
        sub     ax, word ptr es:[si+14h]
        sbb     dx, word ptr es:[si+16h]
        sbb     cx, 0
        else
        sub     ax, word ptr es:[si+12h]
        sbb     dx, word ptr es:[si+14h]
        endif
        jb      br_35760
        inc     word ptr [C0_W_02C10]
        jmp     loop_3574D
br_35760:
        if      FW_VERSION >= 110
        add     ax, word ptr es:[si+14h]
        adc     dx, word ptr es:[si+16h]
        adc     cx, 0
        else
        add     ax, word ptr es:[si+12h]
        adc     dx, word ptr es:[si+14h]
        endif
fn_3576B:
        push    ax
        push    dx
        if      FW_VERSION >= 110
        push    cx
        push    word ptr [C0_W_02C10]
        call    fn_344C5
        pop     ax
        mov     word ptr [C0_W_02C10], ax
        pop     cx
        else
        push    word ptr [C0_W_02C10]
        call    fn_344C5
        pop     ax
        mov     word ptr [C0_W_02C10], ax
        endif
        pop     dx
        pop     ax
        clc
        ret
br_3577E:
        dec     word ptr [C0_W_02C0A]
        sub     ax, ax
        sub     dx, dx
        call    fn_3576B
        stc
        ret
L_3578B:
        push    ds
        mov     bp, APPDATA_SEG
        mov     ds, bp
        les     si, [C0_FP_02C02]
        add     si, 20ah
        mov     bp, si
        int     0e5h
        pop     ds
        retf
L_3579F:
        call    EP_FN_280BD_OFF+APP3_CSBASE
        je      br_357A5
        retf
br_357A5:
        int     0ebh
        mov     word ptr [C0_W_CVT_TO_SEQ], ax
        int     0a4h
        KEY_DOWN        13h, EP_FAR_340B3_OFF, EP_FAR_340B3_SEG
        KEY_DOWN        14h, L_35018-APP3_CSBASE, APP3_SEG
        KEY_DOWN        16h, EP_FAR_340B3_OFF, EP_FAR_340B3_SEG
        KEY_DOWN        20h, L_357D1-APP3_CSBASE, APP3_SEG
        push    cs
        call    cvt_to_field
        retf
L_357D1:
        DISP_WIN_WIDE   "Convert Song to Seq"
        DISP_TEXT       1ah, 10h, "   From song:  -"
        DISP_TEXT       1ah, 1ah, " To sequence:"
        DISP_HDOTS      16h, 24h, 0c4h
        DISP_TEXT       1ah, 28h, "Track status:"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        mov     ax, word ptr [C0_W_02BFE]
        inc     al
        DISP_NUM0       68h, 10h, 02h
        les     si, [C0_FP_02C02]
        add     si, 0
        mov     dx, es
        mov     cl, 7ah
        mov     ch, 10h
        mov     ah, 10h
        mov     bl, 5
        int     90h
        mov     ax, word ptr [C0_W_CVT_TO_SEQ]
        mov     cl, 68h
        mov     ch, 1ah
        call    EP_FN_27FF8_OFF+APP3_CSBASE
        mov     dx, ds
        DISP_TEXT_IDX   68h, 28h, 00788h, TBL_SONG_CONVERT_LABELS
        call    word ptr [C0_W_CURSOR_FN]
        retf
cvt_from_field:
        mov     word ptr [C0_W_CURSOR_FN], cvt_cur_from-APP3_CSBASE
        FIELD_ENTRY     ds, C0_W_02BFE, 1, 0, 14h, L_344AE-APP3_CSBASE
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, cvt_to_field-APP3_CSBASE, APP3_SEG
        retf
cvt_to_field:
        mov     word ptr [C0_W_CURSOR_FN], cvt_cur_to-APP3_CSBASE
        FIELD_ENTRY     ds, C0_W_CVT_TO_SEQ, 1, 0, 63h, (APP3_BASE+field_cb_none-APP3_SEG*16)
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, cvt_from_field-APP3_CSBASE, APP3_SEG, cvt_status_field-APP3_CSBASE, APP3_SEG
        retf
cvt_status_field:
        mov     word ptr [C0_W_CURSOR_FN], cvt_cur_status-APP3_CSBASE
        FIELD_WHEEL     ds, 788h, 0, 0, 2, (APP3_BASE+field_cb_none-APP3_SEG*16)
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, cvt_to_field-APP3_CSBASE, APP3_SEG, 0000h, 0000h
        retf
L_35018:
        mov     word ptr [C0_W_02C0A], 0
        call    fn_344E0
        jne     L_35318
        jmp     far_340B3
L_35318:
        cmp     ah, 0
        jne     L_35320
        jmp     far_340B3
L_35320:
        call    L_353E3
        jae     L_35326
        retf
L_35326:
        mov     word ptr [C0_W_02C0A], 0
        call    fn_344E0
        push    ax
        DISP_MSG        "      Convert........."
        pop     ax
        mov     ah, 0
        mov     word ptr [C0_W_00710], ax
        int     0d1h
        mov     ax, 8000h
        mov     es, ax
        mov     di, 0
        push    ds
        lds     si, [C0_FP_02C02]
        add     si, 0
        mov     cx, 10h
        rep movsb
        pop     ds
        mov     word ptr es:[1ch], 0
        mov     word ptr es:[1eh], 0
        mov     word ptr es:[1ah], 0
        mov     word ptr es:[14h], 0
        if      FW_VERSION >= 110
        mov     byte ptr es:[34h], 0
        mov     word ptr es:[30h], 0
        mov     word ptr es:[32h], 0ffffh
        endif
        mov     si, 190h
        mov     di, 180h
        mov     cx, 580h
        rep movsb
L_353A3:
        call    fn_344E0
        je      L_353C9
        cmp     ah, 0
        je      L_353C9
        mov     cl, ah
        mov     ch, 0
        mov     ah, 0
        if      FW_VERSION >= 120
L_353B3:
        push    ax
        else
        if      FW_VERSION >= 114
L_353B3:
        push    ax
        endif
        endif
        push    cx
        int     0d9h
        if      FW_VERSION >= 114
        db      "YX"
        push    ax
        push    cx
        else
        pop     cx
        endif
        int     0efh
        if      FW_VERSION >= 120
        pop     cx
        pop     ax
        jb      L_353DD
        loop    L_353B3
        else
        if      FW_VERSION >= 114
        pop     cx
        pop     ax
        endif
        jb      L_353DD
        if      FW_VERSION >= 114
        loop    L_353B3
        endif
        endif
        inc     word ptr [C0_W_02C0A]
        jmp     L_353A3
L_353C9:
        mov     ax, word ptr [C0_W_CVT_TO_SEQ]
        mov     word ptr [A2_W_CUR_SEQ], ax
        push    ax
        int     0d3h
        if      FW_VERSION >= 112
        int     0dfh
        endif
        pop     ax
        int     0d2h
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
L_353DD:
        mov     ax, 19h
        int     95h
        retf
L_353E3:
        inc     word ptr [C0_W_02C0A]
        call    fn_344E0
        jne     L_353E3
        mov     ax, word ptr [C0_W_02C0A]
        if      FW_VERSION >= 110
        mov     bx, 18h
        else
        mov     bx, 16h
        endif
        mul     bx
        les     si, [C0_FP_02C1E]
        add     si, ax
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        cmp     dx, 0
        jne     L_3540D
        cmp     ax, 3e8h
        jae     L_3540D
        clc
        ret
L_3540D:
        mov     al, 32h
        int     95h
        stc
        ret

; padding in use 0x35a01-0x35b10, 271 bytes 00h -- MUTE_GROUPS choke tail blob
FREE_35A01:
        if      FW_VERSION >= 120
        MG_C0_PAD 03402h

        elseif  FW_VERSION >= 114
        MG_C0_PAD 033F0h
        elseif  FW_VERSION >= 112
        MG_C0_PAD 033E0h
        elseif  FW_VERSION >= 111
        MG_C0_PAD 033E2h
        elseif  FW_VERSION >= 110
        MG_C0_PAD 03300h

        else
        MG_C0_PAD 0333Eh
        endif
isr_35B10:
        cli
        cld
        nop
        push    cs
        call    far_35F4E
        int     32h
        if      FW_VERSION < 114
__aFuldiv                         equ     $+1
        if      FW_VERSION < 111
        endif
        add     byte ptr [di-75h], dl
        in      al, dx
        push    bx
        push    si
        mov     ax, word ptr [bp+0ch]
        or      ax, ax
        jne     L_3553B
        mov     cx, word ptr [bp+0ah]
        mov     ax, word ptr [bp+8]
        xor     dx, dx
        div     cx
        mov     bx, ax
        mov     ax, word ptr [bp+6]
        div     cx
        mov     dx, bx
        jmp     L_35573
L_3553B:
        mov     cx, ax
        mov     bx, word ptr [bp+0ah]
        mov     dx, word ptr [bp+8]
        mov     ax, word ptr [bp+6]
L_35546:
        shr     cx, 1
        rcr     bx, 1
        shr     dx, 1
        rcr     ax, 1
        or      cx, cx
        jne     L_35546
        div     bx
        mov     si, ax
        mul     word ptr [bp+0ch]
        xchg    cx, ax
        mov     ax, word ptr [bp+0ah]
        mul     si
        add     dx, cx
        jb      L_3556F
        cmp     dx, word ptr [bp+8]
        ja      L_3556F
        jb      L_35570
        cmp     ax, word ptr [bp+6]
        jbe     L_35570
L_3556F:
        dec     si
L_35570:
        xor     dx, dx
        xchg    si, ax
L_35573:
        pop     si
        pop     bx
        pop     bp
        retf    8
        endif
        db      00h
        if      FW_VERSION >= 114
        include "../../../common/crt_int_math.inc"

        else
__aFlmul:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp+8]
        mov     cx, word ptr [bp+0ch]
        or      cx, ax
        mov     cx, word ptr [bp+0ah]
        jne     L_35593
        mov     ax, word ptr [bp+6]
        mul     cx
        pop     bp
        retf    8
L_35593:
        push    bx
        mul     cx
        mov     bx, ax
        mov     ax, word ptr [bp+6]
        mul     word ptr [bp+0ch]
        add     bx, ax
        mov     ax, word ptr [bp+6]
        mul     cx
        add     dx, bx
        pop     bx
        pop     bp
        retf    8
__aFldiv:
        push    bp
        mov     bp, sp
        push    di
        push    si
        push    bx
        xor     di, di
        mov     ax, word ptr [bp+8]
        or      ax, ax
        jge     L_355CC
        inc     di
        mov     dx, word ptr [bp+6]
        neg     ax
        neg     dx
        sbb.r   ax, 0
        mov     word ptr [bp+8], ax
        mov     word ptr [bp+6], dx
L_355CC:
        mov     ax, word ptr [bp+0ch]
        or      ax, ax
        jge     L_355E4
        inc     di
        mov     dx, word ptr [bp+0ah]
        neg     ax
        neg     dx
        sbb.r   ax, 0
        mov     word ptr [bp+0ch], ax
        mov     word ptr [bp+0ah], dx
L_355E4:
        or      ax, ax
        jne     L_355FD
        mov     cx, word ptr [bp+0ah]
        mov     ax, word ptr [bp+8]
        xor     dx, dx
        div     cx
        mov     bx, ax
        mov     ax, word ptr [bp+6]
        div     cx
        mov     dx, bx
        jmp     L_35635
L_355FD:
        mov     bx, ax
        mov     cx, word ptr [bp+0ah]
        mov     dx, word ptr [bp+8]
        mov     ax, word ptr [bp+6]
L_35608:
        shr     bx, 1
        rcr     cx, 1
        shr     dx, 1
        rcr     ax, 1
        or      bx, bx
        jne     L_35608
        div     cx
        mov     si, ax
        mul     word ptr [bp+0ch]
        xchg    cx, ax
        mov     ax, word ptr [bp+0ah]
        mul     si
        add     dx, cx
        jb      L_35631
        cmp     dx, word ptr [bp+8]
        ja      L_35631
        jb      L_35632
        cmp     ax, word ptr [bp+6]
        jbe     L_35632
L_35631:
        dec     si
L_35632:
        xor     dx, dx
        xchg    si, ax
L_35635:
        dec     di
        jne     L_3563F
        neg     dx
        neg     ax
        sbb     dx, 0
L_3563F:
        pop     bx
        pop     si
        pop     di
        pop     bp
        retf    8
__aFlrem:
        push    bp
        mov     bp, sp
        push    bx
        push    di
        xor     di, di
        mov     ax, word ptr [bp+8]
        or      ax, ax
        jge     L_35665
        inc     di
        mov     dx, word ptr [bp+6]
        neg     ax
        neg     dx
        sbb.r   ax, 0
        mov     word ptr [bp+8], ax
        mov     word ptr [bp+6], dx
L_35665:
        mov     ax, word ptr [bp+0ch]
        or      ax, ax
        jge     L_3567C
        mov     dx, word ptr [bp+0ah]
        neg     ax
        neg     dx
        sbb.r   ax, 0
        mov     word ptr [bp+0ch], ax
        mov     word ptr [bp+0ah], dx
L_3567C:
        or      ax, ax
        jne     L_35698
        mov     cx, word ptr [bp+0ah]
        mov     ax, word ptr [bp+8]
        xor     dx, dx
        div     cx
        mov     ax, word ptr [bp+6]
        div     cx
        mov     ax, dx
        xor     dx, dx
        dec     di
        jns     L_356D9
        jmp     L_356E0
L_35698:
        mov     bx, ax
        mov     cx, word ptr [bp+0ah]
        mov     dx, word ptr [bp+8]
        mov     ax, word ptr [bp+6]
L_356A3:
        shr     bx, 1
        rcr     cx, 1
        shr     dx, 1
        rcr     ax, 1
        or      bx, bx
        jne     L_356A3
        div     cx
        mov     cx, ax
        mul     word ptr [bp+0ch]
        xchg    cx, ax
        mul     word ptr [bp+0ah]
        add     dx, cx
        jb      L_356CA
        cmp     dx, word ptr [bp+8]
        ja      L_356CA
        jb      L_356D0
        cmp     ax, word ptr [bp+6]
        jbe     L_356D0
L_356CA:
        sub     ax, word ptr [bp+0ah]
        sbb     dx, word ptr [bp+0ch]
L_356D0:
        sub     ax, word ptr [bp+6]
        sbb     dx, word ptr [bp+8]
        dec     di
        jns     L_356E0
L_356D9:
        neg     dx
        neg     ax
        sbb     dx, 0
L_356E0:
        pop     di
        pop     bx
        pop     bp
        retf    8
        endif
__aFNaldiv:
        push    bp
        mov     bp, sp
        push    bx
        mov     bx, word ptr [bp+6]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bx+2]
        push    word ptr [bx]
        push    cs
        call    __aFldiv
        mov     word ptr [bx+2], dx
        mov     word ptr [bx], ax
        pop     bx
        pop     bp
        retf    6
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
__aFFaldiv:
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
        call    __aFldiv
        mov     word ptr [bx+2], dx
        mov     word ptr [bx], ax
        pop     bx
        pop     ds
        pop     bp
        retf    8
        if      FW_VERSION >= 114
DIVMOD32_STATIC equ 077cch
        include "../../../common/crt_divmod_str.inc"

        else
_div:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp+6]
        cwd
        idiv    word ptr [bp+8]
        pop     bp
        retf
_ldiv:
        push    bp
        mov     bp, sp
        push    bx
        push    di
        push    si
        xor     di, di
        mov     ax, word ptr [bp+8]
        or      ax, ax
        jge     L_35778
        or      di, 3
        mov     dx, word ptr [bp+6]
        neg     ax
        neg     dx
        sbb.r   ax, 0
        mov     word ptr [bp+8], ax
        mov     word ptr [bp+6], dx
L_35778:
        mov     ax, word ptr [bp+0ch]
        or      ax, ax
        jge     L_35592
        xor     di, 2
        mov     dx, word ptr [bp+0ah]
        neg     ax
        neg     dx
        sbb.r   ax, 0
        mov     word ptr [bp+0ch], ax
        mov     word ptr [bp+0ah], dx
L_35592:
        or      ax, ax
        jne     L_357B1
        mov     cx, word ptr [bp+0ah]
        mov     ax, word ptr [bp+8]
        xor     dx, dx
        div     cx
        mov     bx, ax
        mov     ax, word ptr [bp+6]
        div     cx
        mov     cx, bx
        mov     bx, ax
        mov     ax, dx
        xor     dx, dx
        jmp     L_357FA
L_357B1:
        mov     bx, ax
        mov     cx, word ptr [bp+0ah]
        mov     dx, word ptr [bp+8]
        mov     ax, word ptr [bp+6]
L_357BC:
        shr     bx, 1
        rcr     cx, 1
        shr     dx, 1
        rcr     ax, 1
        or      bx, bx
        jne     L_357BC
        div     cx
        mov     si, ax
        xor     dx, dx
        push    dx
        push    ax
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    cs
        call    __aFlmul
        cmp     dx, word ptr [bp+8]
        ja      L_357E6
        jb      L_357ED
        cmp     ax, word ptr [bp+6]
        jbe     L_357ED
L_357E6:
        dec     si
        sub     ax, word ptr [bp+0ah]
        sbb     dx, word ptr [bp+0ch]
L_357ED:
        sub     ax, word ptr [bp+6]
        sbb     dx, word ptr [bp+8]
        xor     di, 1
        xor     cx, cx
        mov     bx, si
L_357FA:
        test    di, 1
        je      L_35807
        neg     dx
        neg     ax
        sbb     dx, 0
L_35807:
        test    di, 2
        je      L_35814
        neg     cx
        neg     bx
        sbb     cx, 0
L_35814:
        mov     word ptr [C0_W_077D2], dx
        mov     word ptr [C0_W_077D0], ax
        mov     word ptr [C0_W_077CE], cx
        mov     word ptr [C0_W_077CC], bx
        mov     ax, C0_W_077CC
        mov     dx, ds
        pop     si
        pop     di
        pop     bx
        mov     sp, bp
        pop     bp
        retf
        db      00h
__setjmp:
        mov     ax, bp
        mov     bp, sp
        mov     dx, ds
        lds     bx, [bp+4]
        mov     word ptr [bx], ax
        mov     word ptr [bx+2], di
        mov     word ptr [bx+4], si
        mov     word ptr [bx+6], sp
        mov     cx, word ptr [bp]
        mov     word ptr [bx+8], cx
        mov     cx, word ptr [bp+2]
        mov     word ptr [bx+0ah], cx
        mov     word ptr [bx+0ch], dx
        mov     ds, dx
        mov     bp, ax
        xor     ax, ax
        retf
_longjmp:
        mov     bp, sp
        mov     ax, word ptr [bp+8]
        or      ax, ax
        jne     L_35864
        inc     ax
L_35864:
        lds     bx, [bp+4]
        mov     di, word ptr [bx+2]
        mov     si, word ptr [bx+4]
        mov     sp, word ptr [bx+6]
        mov     bp, sp
        mov     cx, word ptr [bx+8]
        mov     word ptr [bp], cx
        mov     cx, word ptr [bx+0ah]
        mov     word ptr [bp+2], cx
        mov     bp, word ptr [bx]
        mov     ds, word ptr [bx+0ch]
        retf
__fstricmp:
        push    bp
        mov     bp, sp
        mov     dx, si
        push    ds
        lds     si, [bp+0ah]
        les     bx, [bp+6]
        mov     al, 0ffh
L_35892:
        or      al, al
        je      L_358C3
        lodsb
        mov     ah, byte ptr es:[bx]
        inc     bx
        cmp     ah, al
        je      L_35892
        sub     al, 41h
        cmp     al, 1ah
        sbb     cl, cl
        and     cl, 20h
        add     al, cl
        add     al, 41h
        xchg    ah, al
        sub     al, 41h
        cmp     al, 1ah
        sbb     cl, cl
        and     cl, 20h
        add     al, cl
        add     al, 41h
        cmp     al, ah
        je      L_35892
        sbb     al, al
        sbb     al, 0ffh
L_358C3:
        cbw
        pop     ds
        mov     si, dx
        pop     bp
        retf
        db      00h
__fstrncpy:
        push    bp
        mov     bp, sp
        push    di
        push    si
        push    ds
        les     di, [bp+6]
        lds     si, [bp+0ah]
        mov     bx, di
        mov     cx, word ptr [bp+0eh]
        jcxz    L_358E9
L_358DD:
        lodsb
        or      al, al
        je      L_358E5
        stosb
        loop    L_358DD
L_358E5:
        xor     al, al
        rep stosb
L_358E9:
        mov     ax, bx
        mov     dx, es
        pop     ds
        pop     si
        pop     di
        mov     sp, bp
        pop     bp
        retf
        endif
__fstrupr:
        push    bp
        mov     bp, sp
        mov     cx, ds
        lds     bx, [bp+6]
        mov     dx, bx
        jmp     br_35F0B
loop_35F00:
        sub     al, 61h
        cmp     al, 1ah
        jae     L_3560A
        add     al, 41h
        mov     byte ptr [bx], al
L_3560A:
        inc     bx
br_35F0B:
        mov     al, byte ptr [bx]
        or      al, al
        jne     loop_35F00
        xchg    dx, ax
        mov     dx, ds
        mov     ds, cx
        pop     bp
        retf
        if      FW_VERSION >= 114
        include "../../../common/crt_ivt.inc"
        else
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
        endif
far_35F4E:
        push    di
        push    ds
        mov     ax, DS_SEG
        mov     ds, ax
        mov     ax, 0cccch
        mov     cx, PGM_ARRAY_DS
        mov     di, C0_W_08128
        sub     cx, di
        push    ds
        pop     es
        shr     cx, 1
        rep stosw
        jae     br_35F69
        stosb
br_35F69:
        mov     cx, 2000h
        xor     bx, bx
        mov     dx, 7c00h
        mov     di, bx
        mov     es, dx
        rep stosw
        callf   EP_DMA_0162D_SEG:EP_DMA_0162D_OFF
        nop
        push    cs
        if      FW_VERSION >= 120
        call    EP_L_2D296_OFF+APP3_CSBASE
        else
        call    tgt_3D296
        endif
        mov     ax, 0ah
        out     0c0h, al
        mov     word ptr [C0_W_0989E], ax
        push    C1_SEG
        db      68h, 12h, 00h
        push    C1_SEG
        db      68h, 16h, 00h
        nop
        push    cs
        call    disp_message_window
        add     sp, 8
        nop
        push    cs
        call    wave_mem_size_probe
        callf   EP_VOICE_ENGINE_INIT_SEG:EP_VOICE_ENGINE_INIT_OFF
        callf   EP_PGM_MEMORY_INIT_SEG:EP_PGM_MEMORY_INIT_OFF
        callf   EP_FX_DSP_RELOAD_ALL_SEG:EP_FX_DSP_RELOAD_ALL_OFF
        push    C1_SEG
        push    word 0
        push    41h
        nop
        push    cs
        call    ivt_set_vector
        add     sp, 6
        callf   EP_INSTALL_TEXT2_VECTORS_SEG:EP_INSTALL_TEXT2_VECTORS_OFF
        callf   EP_X_421A4_SEG:EP_X_421A4_OFF
        callf   EP_L_42182_SEG:EP_L_42182_OFF
        push    EP_MIDI_CHANNEL_MSG_DISPATCH_SEG
        push    EP_MIDI_CHANNEL_MSG_DISPATCH_OFF
        nop
        push    cs
        call    event_cb_set_aux
        add     sp, 4
        push    EP_SAMPLE_ERROR_HANDLER_SEG
        push    EP_SAMPLE_ERROR_HANDLER_OFF
        nop
        push    cs
        call    event_cb_set_main
        add     sp, 4
        mov     ax, word ptr [C0_W_0989E]
        XL2K_MON_BIT
        out     0c0h, al
        mov     word ptr [C0_W_0989E], ax
        xor     ax, ax
        pop     ds
        pop     di
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
tgt_3601A:
        shr     ax, 1
        rcr     bx, 1
        rcr     di, 1
        loop    tgt_3601A
        or      ax, ax
        jne     br_36059
        cmp     bx, 3fffh
        ja      br_36059
        jne     br_36033
        cmp     di, 1
        ja      br_36059
br_36033:
        mov     cx, 7fffh
        mov     si, 0ffffh
tgt_36039:
        mov     dx, bx
        mov     ax, di
        div     cx
        or      ax, ax
        je      L_35A57
        cmp     dx, si
        jae     br_36053
        mov     si, dx
        mov     word ptr [bp-2], cx
        mov     word ptr [bp-4], ax
        or      dx, dx
        je      br_36059
br_36053:
        cmp     ax, cx
        jae     br_36059
L_35A57:
        loop    tgt_36039
br_36059:
        mov     dx, word ptr [bp-4]
        mov     ax, word ptr [bp-2]
        pop     di
        pop     si
        mov     sp, bp
        pop     bp
        retf
        db      00h
L_36066:
        mov     bh, 45h
        mov     bl, 6fh
        jmp     br_36072
L_3606C:
        mov     bh, 49h
        mov     bl, 4fh
        jmp     br_36072
br_36072:
        or      cx, cx
        jne     br_36077
        retf
br_36077:
        push    si
        push    cx
        dec     cx
        mov     ax, ds
        add     si, cx
        adc.r   ax, 0
        add     si, cx
        adc.r   ax, 0
        pop     cx
        pop     si
        test    al, 8
        je      br_3608D
        retf
br_3608D:
        push    dx
        mov     dx, ASIC_DMA_C03F
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
        mov     ax, di
        shl     ax, 0ch
        out     82h, ax
        mov     ax, 100h
        out     80h, ax
        mov     ax, 0fh
        out     86h, ax
        mov     ax, 0ffffh
        out     84h, ax
        pop     ax
        out     82h, ax
        mov     ax, 200h
        out     80h, ax
        xor     ax, ax
        out     8ch, ax
        mov     dx, 1eh
loop_360DA:
        mov     ax, dx
        out     80h, ax
        mov     ax, 100h
        out     86h, ax
        sub     dx, 2
        jne     loop_360DA
        mov     ax, 3
        mov     dx, ASIC_DMA_C031
        out     dx, al
        mov     ax, si
        mov     dx, ASIC_DMA_ADDR
        out     dx, ax
        mov     ax, ds
        mov     dx, ASIC_DMA_ADDR_HI
        out     dx, al
        mov     ax, cx
        dec     ax
        mov     dx, ASIC_DMA_COUNT
        out     dx, ax
        mov     al, bh
        mov     dx, ASIC_DMA_C03A
        out     dx, al
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        and     al, 0f7h
        out     dx, al
        mov     al, bl
        xor     ah, ah
        out     88h, ax
loop_36115:
        mov     dx, ASIC_DMA_STATUS
        in      al, dx
        test    al, 8
        je      loop_36115
        cmp     bl, 4fh
        jne     br_36136
        mov     dx, di
        add     dx, cx
        shl     dx, 0ch
loop_36129:
        xor     ax, ax
        out     80h, ax
        in      ax, 82h
        and     ah, 0f0h
        cmp     ah, dh
        jne     loop_36129
br_36136:
        xor     ax, ax
        out     80h, ax
        mov     ah, 1
        out     86h, ax
        xor     ax, ax
        out     88h, ax
loop_36142:
        in      al, 88h
        test    al, 80h
        jne     loop_36142
        retf
        db      00h
L_3614A:
        push    si
        push    di
        push    bp
        cmp     byte ptr [C0_B_DSP_CHAN], 1
        ja      br_36158
        push    cs
        call    far_3615C
br_36158:
        pop     bp
        pop     di
        pop     si
        retf
far_3615C:
        push    es
        callf   EP_L_55584_SEG:EP_L_55584_OFF
        push    cs
        call    far_3741F
        mov     bx, C0_W_07D1C
        push    cs
        call    far_361CB
        test    byte ptr [C0_B_0D7E2], 8
        je      br_3617E
        push    cs
        call    dsp_voice_buf_setup
        push    cs
        call    far_3639B
        jmp     br_361C9
br_3617E:
        mov     si, C0_W_08144
        mov     al, byte ptr [C0_B_DSP_CHAN]
        mov     ah, 14h
        mul     ah
        add     si, ax
        mov     al, byte ptr es:[di+16h]
        mov     byte ptr [si+1], al
        cmp     al, 4
        jne     br_3619F
        push    cs
        call    far_365B4
        push    cs
        call    far_361EB
        jmp     br_361C9
br_3619F:
        cmp     al, 3
        jne     br_361AD
        push    cs
        call    dsp_voice_buf_setup
        push    cs
        call    far_361EB
        jmp     br_361C9
br_361AD:
        push    ax
        push    cs
        call    dsp_voice_buf_setup
        pop     ax
        cmp     al, 0
        jne     br_361BD
        push    cs
        call    far_3639B
        jmp     br_361C9
br_361BD:
        cmp     al, 1
        je      br_361C5
        cmp     al, 2
        jne     br_361C9
br_361C5:
        push    cs
        call    far_36473
br_361C9:
        pop     es
        retf
far_361CB:
        sub     dx, dx
        mov     ax, 224h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     dx, 7fffh
        mov     ax, 226h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        retf
far_361EB:
        sub     dx, dx
        mov     ax, 92h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 94h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 88h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 8ah
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        sub     cx, cx
        sub     dx, dx
        mov     bp, 8000h
        mov     si, bp
        push    cs
        call    far_36435
        sub     dx, dx
        mov     ax, 70h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 74h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 72h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 76h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 8ch
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 8eh
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 90h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     dx, 7fffh
        mov     ax, 78h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 7ah
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        cmp     byte ptr es:[di+16h], 3
        jne     br_362B2
        jmp     br_36347
br_362B2:
        mov     dx, 800h
        mov     ax, 6ch
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 6eh
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        sub     dx, dx
        mov     ax, 64h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, 1
        out     0a0h, ax
        mov     ax, 80h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 68h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, 1
        out     0a0h, ax
        mov     dx, 7fffh
        mov     ax, 84h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        sub     dx, dx
        mov     ax, 66h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, 1
        out     0a0h, ax
        mov     ax, 82h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 6ah
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, 1
        out     0a0h, ax
        mov     dx, 7fffh
        mov     ax, 86h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        jmp     br_3639A
br_36347:
        mov     dx, 400h
        mov     ax, 6ch
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 6eh
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 210h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 212h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        sub     dx, dx
        mov     ax, 7ch
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 7eh
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
br_3639A:
        retf
far_3639B:
        push    cs
        call    far_363E4
        sub     cx, cx
        mov     dx, 7fffh
        mov     bp, 8000h
        sub     si, si
        cmp     byte ptr es:[di+17h], 0
        jne     br_363B6
        mov     bp, 0
        mov     si, 0
br_363B6:
        push    cs
        call    far_36435
        sub     dx, dx
        mov     ax, 8ch
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 8eh
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 90h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        retf
far_363E4:
        sub     dx, dx
        mov     ax, 92h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 94h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 88h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 8ah
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 78h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 7ah
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        retf
far_36435:
        push    cs
        call    far_3643E
        push    cs
        call    far_3643E
        retf
far_3643E:
        mov     ax, 21ch
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, cx
        out     0a0h, ax
        mov     ax, 21eh
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 220h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, bp
        out     0a0h, ax
        mov     ax, 222h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, si
        out     0a0h, ax
        retf
far_36473:
        push    cs
        call    far_363E4
        sub     cx, cx
        mov     dx, 7fffh
        mov     bp, 8000h
        sub     si, si
        push    cs
        call    far_36435
        mov     dx, 7fffh
        mov     ax, 70h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 72h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        sub     dx, dx
        mov     ax, 74h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 76h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        cmp     byte ptr es:[di+16h], 1
        jne     br_364C9
        push    cs
        call    far_364CA
br_364C9:
        retf
far_364CA:
        mov     si, C0_W_08144
        mov     al, byte ptr [C0_B_DSP_CHAN]
        mov     ah, 14h
        mul     ah
        add     si, ax
        mov     ah, byte ptr es:[di+1bh]
        mov     al, 0
        mov     dx, 7784h
        mul     dx
        mov     word ptr [si+0ch], dx
        mov     bp, dx
        mov     ah, byte ptr es:[di+1ch]
        mov     al, 0
        mov     dx, 7784h
        mul     dx
        mov     word ptr [si+0eh], dx
        mov     dx, bp
        mov     word ptr [si+0ah], dx
        mov     ax, 92h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 94h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        inc     dx
        mov     word ptr [si+8], dx
        mov     word ptr [si+6], 0
        retf
dsp_voice_buf_setup:
        mov     ax, 2000h
        mov     dl, byte ptr [C0_B_DSP_CHAN]
        mov     dh, 0
        mul     dx
        mov     bp, 0
        add     bp, ax
        mov     ax, 5ch
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, bp
        out     0a0h, ax
        mov     si, 80h
        cmp     byte ptr es:[di+16h], 3
        jne     br_36549
        mov     si, 200h
        jmp     br_3654B
br_36549:
        add     bp, si
br_3654B:
        mov     ax, 5eh
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, bp
        out     0a0h, ax
        add     bp, si
        mov     ax, 60h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, bp
        out     0a0h, ax
        mov     al, byte ptr es:[di+30h]
        test    byte ptr [C0_B_0D7E2], 4
        je      br_36574
        mov     al, 4
br_36574:
        cmp     al, 0
        je      br_365A6
        cmp     al, 1
        jne     br_3657F
        inc     bp
        jmp     br_365A6
br_3657F:
        cmp     al, 2
        jne     L_35FA2
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
        je      br_3659E
        inc     dx
br_3659E:
        add     bp, dx
        jmp     br_365A6
L_35FA2:
        add     bp, 0f80h
br_365A6:
        mov     ax, 62h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, bp
        out     0a0h, ax
        retf
far_365B4:
        mov     ax, 2000h
        mov     dl, byte ptr [C0_B_DSP_CHAN]
        mov     dh, 0
        mul     dx
        mov     bp, 0
        add     bp, ax
        mov     ax, 5ch
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, bp
        out     0a0h, ax
        add     bp, 0ffch
        mov     ax, 5eh
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, bp
        out     0a0h, ax
        add     bp, 0ffch
        mov     ax, 60h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, bp
        out     0a0h, ax
        add     bp, 4
        mov     ax, 62h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, bp
        out     0a0h, ax
        retf
L_36604:
        push    si
        push    di
        push    bp
        cmp     byte ptr [C0_B_DSP_CHAN], 1
        ja      br_36612
        push    cs
        call    far_36616
br_36612:
        pop     bp
        pop     di
        pop     si
        retf
far_36616:
        push    es
        push    cs
        call    far_3741F
        mov     al, byte ptr es:[di+5]
        mov     ah, byte ptr [C2_B_FX_BOARD_PRESENT]
        not     ah
        and     ah, 1
        or      al, ah
        mov     bl, byte ptr [C0_B_DSP_CHAN]
        mov     bh, 0
        mov     byte ptr [bx+C0_B_06476], al
        mov     bx, C0_W_07D1C
        push    cs
        call    far_36686
        mov     al, byte ptr es:[di+16h]
        test    byte ptr [C0_B_0D7E2], 8
        je      br_36648
        mov     al, 5
br_36648:
        cmp     al, 4
        jne     br_36652
        push    cs
        call    far_369AC
        jmp     br_36680
br_36652:
        cmp     al, 3
        jne     br_3665C
        push    cs
        call    far_369AC
        jmp     br_3667C
br_3665C:
        cmp     al, 5
        je      br_36664
        cmp     al, 0
        jne     br_3666A
br_36664:
        push    cs
        call    far_36AF3
        jmp     br_3667C
br_3666A:
        cmp     al, 1
        jne     br_36674
        push    cs
        call    far_36BF7
        jmp     br_3667C
br_36674:
        cmp     al, 2
        jne     br_3667C
        push    cs
        call    far_36CBF
br_3667C:
        push    cs
        call    far_36DA8
br_36680:
        push    cs
        call    far_370CD
        pop     es
        retf
far_36686:
        test    byte ptr [C0_B_0D7E2], 20h
        je      br_366EA
        mov     ax, 9ah
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, 1d2h
        out     0a0h, ax
        mov     ax, 98h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, 0
        out     0a0h, ax
        mov     dx, 7fffh
        mov     ax, 96h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 9ch
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, 0
        out     0a0h, ax
        mov     dx, 2000h
        mov     ax, 9eh
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        shr     dx, 2
        mov     ax, 0a0h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        jmp     br_36788
br_366EA:
        mov     ax, word ptr es:[di]
        shl     ax, 3
        mov     dx, 9566h
        mul     dx
        mov     ax, 9ah
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     al, byte ptr es:[di+2]
        xlat
        mov     dh, al
        mov     dl, 0
        shr     dx, 2
        mov     bp, 7fffh
        sub     bp, dx
        mov     ax, 98h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 96h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, bp
        out     0a0h, ax
        mov     al, byte ptr es:[di+3]
        xlat
        mov     dh, al
        mov     dl, 0
        shr     dx, 1
        mov     ax, 9ch
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        add     dx, dx
        cmp     dx, 7fffh
        jbe     br_36751
        shr     dx, 1
        jmp     br_36760
br_36751:
        mov     cx, 0ffffh
        sub     cx, dx
        mov     dx, 1fffh
        mov     ax, 0ffffh
        div     cx
        mov     dx, ax
br_36760:
        mov     ax, 9eh
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     al, byte ptr es:[di+4]
        xlat
        mov     ah, al
        mov     al, 0
        mul     dx
        shr     dx, 2
        mov     ax, 0a0h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
br_36788:
        test    byte ptr [C0_B_0D7E2], 10h
        jne     br_36792
        jmp     br_36821
br_36792:
        mov     ax, 0a2h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, 91ah
        out     0a0h, ax
        mov     ax, 0a4h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, 2000h
        out     0a0h, ax
        mov     ax, 238h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, 498h
        out     0a0h, ax
        mov     ax, 0a6h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, 3f80h
        out     0a0h, ax
        mov     ax, 0a8h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, 0
        out     0a0h, ax
        mov     ax, 23ah
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, 2455h
        out     0a0h, ax
        mov     ax, 0aah
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, 3f80h
        out     0a0h, ax
        mov     ax, 0ach
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, 0
        out     0a0h, ax
        mov     ax, 0aeh
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, 91ah
        out     0a0h, ax
        mov     ax, 0b0h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, 2000h
        out     0a0h, ax
        jmp     br_36931
br_36821:
        mov     al, byte ptr es:[di+6]
        mov     ah, 0
        add     ax, ax
        mov     si, C0_W_07C96
        add     si, ax
        mov     dx, word ptr [si]
        mov     ax, 0a2h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     al, byte ptr es:[di+7]
        push    cs
        call    far_3697F
        mov     ax, 0a4h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     si, C0_W_0812A
        mov     al, byte ptr [C0_B_DSP_CHAN]
        mov     ah, 6
        mul     ah
        add     si, ax
        mov     al, byte ptr es:[di+8]
        mov     byte ptr [si+2], al
        mov     al, byte ptr es:[di+10h]
        mov     ah, 0
        mov     dx, 1adh
        mul     dx
        mov     byte ptr [si+1], ah
        mov     al, byte ptr es:[di+11h]
        mov     ah, 0e6h
        mul     ah
        mov     byte ptr [si+3], ah
        mov     dh, byte ptr es:[di+0ah]
        inc     dh
        mov     dl, 0
        mov     ax, 0a6h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     al, byte ptr es:[di+9]
        push    cs
        call    far_3697F
        mov     ax, 0a8h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     si, C0_W_0812A
        mov     al, byte ptr [C0_B_DSP_CHAN]
        add     al, 2
        mov     ah, 6
        mul     ah
        add     si, ax
        mov     al, byte ptr es:[di+0bh]
        mov     byte ptr [si+2], al
        mov     al, byte ptr es:[di+12h]
        mov     ah, 0
        mov     dx, 1adh
        mul     dx
        mov     byte ptr [si+1], ah
        mov     al, byte ptr es:[di+13h]
        mov     ah, 0e6h
        mul     ah
        mov     byte ptr [si+3], ah
        mov     dh, byte ptr es:[di+0dh]
        inc     dh
        mov     dl, 0
        mov     ax, 0aah
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     al, byte ptr es:[di+0ch]
        push    cs
        call    far_3697F
        mov     ax, 0ach
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     al, byte ptr es:[di+0eh]
        mov     ah, 0
        add     ax, ax
        mov     si, C0_W_07C96
        add     si, ax
        mov     dx, word ptr [si]
        mov     ax, 0aeh
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     al, byte ptr es:[di+0fh]
        push    cs
        call    far_3697F
        mov     ax, 0b0h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
br_36931:
        mov     al, byte ptr es:[di+15h]
        xlat
        mov     dx, 8080h
        add     dh, al
        not     al
        add     dl, al
        mov     al, byte ptr es:[di+14h]
        xlat
        mov     cl, al
        mov     al, dl
        mul     cl
        mov     bp, ax
        shr     bp, 1
        xchg    dx, bp
        call    fn_377E4
        xchg    dx, bp
        mov     ax, 0cah
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, bp
        out     0a0h, ax
        mov     al, dh
        mul     cl
        mov     bp, ax
        shr     bp, 1
        xchg    dx, bp
        call    fn_377E4
        xchg    dx, bp
        mov     ax, 0cch
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, bp
        out     0a0h, ax
        retf
far_3697F:
        add     al, 29h
        sub     dx, dx
        cmp     al, 4
        je      br_369AB
        mov     ah, 0
        mov     dl, 6
        div     dl
        mov     dl, ah
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     si, C0_W_07BD4
        add     si, dx
        mov     dh, byte ptr [si]
        mov     dl, 0
        pop     ds
        mov     cl, 8
        sub     cl, al
        shr     dx, cl
        or      dx, dx
        jns     br_369AB
        not     dx
br_369AB:
        retf
far_369AC:
        mov     ax, word ptr es:[di+26h]
        add     ax, 3c00h
        push    di
        push    cs
        call    far_36A8D
        pop     di
        sub     ax, 1000h
        push    ax
        mov     ax, word ptr es:[di+28h]
        add     ax, 3c00h
        push    di
        push    cs
        call    far_36A8D
        pop     di
        sub     ax, 1000h
        push    ax
        cmp     byte ptr es:[di+16h], 3
        jne     br_369D8
        jmp     br_36A70
br_369D8:
        pop     dx
        sar     dx, 1
        mov     ax, 8ah
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        pop     dx
        sar     dx, 1
        mov     ax, 88h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, word ptr es:[di+2ah]
        mov     dx, 2c1ah
        mul     dx
        mov     dh, dl
        mov     dl, ah
        add     dx, 800h
        mov     ax, 210h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, word ptr es:[di+2ch]
        mov     dx, 2c1ah
        mul     dx
        mov     dh, dl
        mov     dl, ah
        add     dx, 800h
        mov     ax, 212h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     al, byte ptr es:[di+2eh]
        xlat
        mov     ah, al
        mov     al, 0
        mov     dx, 7000h
        mul     dx
        neg     dx
        mov     ax, 7ch
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     al, byte ptr es:[di+2fh]
        xlat
        mov     ah, al
        mov     al, 0
        mov     dx, 7000h
        mul     dx
        neg     dx
        mov     ax, 7eh
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        jmp     br_36A8C
br_36A70:
        pop     dx
        mov     ax, 8ah
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        pop     dx
        mov     ax, 88h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
br_36A8C:
        retf
far_36A8D:
        push    cs
        call    far_36A9A
        test    ah, 80h
        je      br_36A99
        mov     ax, 7fffh
br_36A99:
        retf
far_36A9A:
        push    cx
        push    di
        or      ah, ah
        jns     br_36AA2
        sub     ax, ax
br_36AA2:
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
        if      FW_VERSION >= 110
        add     di, 7e1ch
        else
        add     di, 7e16h
        endif
        push    ds
        mov     ax, DS_SEG
        mov     ds, ax
        mov     ax, word ptr [di]
        and     cl, 6
        je      br_36AE5
        mov     dx, word ptr [di+2]
        shr     ax, 1
        shr     dx, 1
        cmp     cl, 4
        je      br_36AE3
        test    cl, 4
        je      br_36ADB
        xchg    dx, ax
br_36ADB:
        mov     di, ax
        shr     ax, 1
        add     ax, di
        shr     dx, 1
br_36AE3:
        add     ax, dx
br_36AE5:
        pop     ds
        mov     cl, 8
        sub     cl, ch
        je      br_36AF0
        jb      br_36AF0
        shr     ax, cl
br_36AF0:
        pop     di
        pop     cx
        retf
far_36AF3:
        mov     al, byte ptr es:[di+17h]
        mov     cl, byte ptr es:[di+18h]
        mov     ch, 0
        cmp     al, 0
        je      br_36B0D
        mov     ch, cl
        cmp     al, 1
        je      br_36B0D
        mov     al, 0d9h
        mul     cl
        mov     ch, ah
br_36B0D:
        mov     al, cl
        xlat
        mul     al
        mov     dx, 7784h
        mul     dx
        mov     ax, 92h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     al, ch
        xlat
        mul     al
        mov     dx, 7784h
        mul     dx
        neg     dx
        mov     ax, 94h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     al, byte ptr es:[di+19h]
        test    byte ptr [C0_B_0D7E2], 8
        je      br_36B4A
        mov     al, 0
br_36B4A:
        xlat
        mov     dl, al
        mov     dh, 0
        mov     ax, 6ch
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 6eh
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 210h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 212h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     al, byte ptr es:[di+1ah]
        xlat
        test    byte ptr [C0_B_0D7E2], 8
        je      br_36B91
        mov     al, 0
br_36B91:
        mov     ah, al
        mov     al, 0
        mov     dx, 7fffh
        imul    dx
        mov     ax, 7ch
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 7eh
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     dx, 7fffh
        mov     ax, 70h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 72h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        test    byte ptr [C0_B_0D7E2], 8
        jne     L_36BDA
        jmp     br_36BDC
L_36BDA:
        sub     dx, dx
br_36BDC:
        mov     ax, 74h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 76h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        retf
far_36BF7:
        mov     si, C0_W_08144
        mov     al, byte ptr [C0_B_DSP_CHAN]
        mov     ah, 14h
        mul     ah
        add     si, ax
        mov     al, byte ptr es:[di+1eh]
        xlat
        mov     dh, al
        mov     dl, 0
        shr     dx, 1
        mov     word ptr [si+10h], dx
        mov     dl, al
        mov     dh, 0
        shr     dx, 2
        mov     ax, 6ch
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 6eh
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 210h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 212h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ah, byte ptr es:[di+1bh]
        mov     al, 0
        mov     dx, 7784h
        mul     dx
        mov     word ptr [si+0ch], dx
        mov     bp, dx
        mov     ah, byte ptr es:[di+1ch]
        mov     al, 0
        mov     dx, 7784h
        mul     dx
        mov     word ptr [si+0eh], dx
        mov     dx, bp
        mov     word ptr [si+0ah], dx
        cmp     word ptr [si+8], dx
        jne     br_36C77
        inc     word ptr [si+8]
br_36C77:
        mov     ah, byte ptr es:[di+1ch]
        sub     ah, byte ptr es:[di+1bh]
        jns     br_36C83
        neg     ah
br_36C83:
        mov     al, 0
        sub     dx, dx
        mov     cl, byte ptr es:[di+1dh]
        mov     ch, 0
        inc     cx
        div     cx
        mov     dx, 9c40h
        mul     dx
        mov     word ptr [si+4], dx
        mov     ax, 8eh
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, 0
        out     0a0h, ax
        mov     al, byte ptr es:[di+1eh]
        xlat
        mov     ah, al
        mov     al, 0
        mov     dx, 4000h
        mul     dx
        mov     word ptr [si+12h], dx
        mov     al, byte ptr es:[di+1fh]
        mov     byte ptr [si+2], al
        retf
far_36CBF:
        mov     al, byte ptr es:[di+24h]
        xlat
        mov     dh, al
        mov     dl, 0
        shr     dx, 1
        mov     cl, byte ptr es:[di+25h]
        sub     bp, bp
        mov     si, dx
        cmp     cl, 3
        je      br_36CE9
        neg     si
        cmp     cl, 0
        je      br_36CE9
        mov     bp, dx
        sub     si, si
        cmp     cl, 2
        je      br_36CE9
        neg     bp
br_36CE9:
        mov     ax, 8ch
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 90h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, bp
        out     0a0h, ax
        mov     ax, 8eh
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, si
        out     0a0h, ax
        mov     ah, byte ptr es:[di+20h]
        mov     al, 0
        mov     dx, 7784h
        mul     dx
        mov     ax, 92h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ah, byte ptr es:[di+23h]
        mov     al, 0
        mov     dx, 7784h
        mul     dx
        mov     ax, 94h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     al, byte ptr es:[di+21h]
        xlat
        mov     dl, al
        mov     dh, 0
        mov     ax, 6ch
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 6eh
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 210h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 212h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     al, byte ptr es:[di+22h]
        xlat
        mov     ah, al
        mov     al, 0
        mov     dx, 4000h
        mul     dx
        neg     dx
        mov     ax, 7ch
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 7eh
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        retf
far_36DA8:
        mov     al, byte ptr es:[di+30h]
        test    byte ptr [C0_B_0D7E2], 4
        je      br_36DB5
        mov     al, 4
br_36DB5:
        cmp     al, 3
        jne     br_36DBC
        jmp     br_36F65
br_36DBC:
        cmp     al, 4
        jne     br_36DC3
        jmp     br_3703D
br_36DC3:
        cmp     al, 2
        je      br_36DD9
        mov     ax, word ptr es:[di+32h]
        mov     dx, 2c1ah
        mul     dx
        mov     dh, dl
        mov     dl, ah
        inc     dx
        mov     bp, dx
        jmp     br_36DEB
br_36DD9:
        mov     ax, word ptr es:[di+34h]
        mov     dx, 2c1ah
        mul     dx
        mov     dh, dl
        mov     dl, ah
        inc     dx
        mov     bp, dx
        add     dx, dx
br_36DEB:
        mov     ax, 64h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     dx, bp
        mov     ah, byte ptr es:[di+31h]
        mov     bp, 1
        mov     si, 1
        test    byte ptr [C0_B_0D7E2], 8
        je      br_36E0F
        mov     bp, dx
        mov     si, dx
br_36E0F:
        or      ah, ah
        je      br_36E33
        pushf
        jns     br_36E18
        neg     ah
br_36E18:
        mov     al, 0
        mul     dx
        mov     cx, 6400h
        div     cx
        test    byte ptr [C0_B_0D7E2], 8
        jne     br_36E2C
        add     bp, ax
        jmp     br_36E2E
br_36E2C:
        sub     si, ax
br_36E2E:
        popf
        jns     br_36E33
        xchg    si, bp
br_36E33:
        cmp     byte ptr es:[di+30h], 1
        jne     br_36E3D
        add     bp, 4
br_36E3D:
        mov     ax, 68h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, bp
        out     0a0h, ax
        mov     ax, 6ah
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, si
        out     0a0h, ax
        mov     al, byte ptr es:[di+30h]
        cmp     al, 1
        je      br_36EB7
        cmp     al, 2
        jne     br_36E66
        jmp     br_36F07
br_36E66:
        push    cs
        call    far_370AE
        neg     dx
        mov     ax, 80h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 82h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, 0
        out     0a0h, ax
        push    cs
        call    far_370BD
        mov     ax, 84h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 86h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, 7fffh
        out     0a0h, ax
        mov     ax, 66h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, 1
        out     0a0h, ax
        jmp     br_370AD
br_36EB7:
        push    cs
        call    far_370AE
        neg     dx
        mov     ax, 80h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 82h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, 7fffh
        out     0a0h, ax
        push    cs
        call    far_370BD
        mov     ax, 84h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 86h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 66h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, 0ffffh
        out     0a0h, ax
        jmp     br_370AD
br_36F07:
        push    cs
        call    dsp_voice_buf_setup
        push    cs
        call    far_370AE
        add     dx, dx
        call    isqrt16
        mov     dh, cl
        mov     dl, 0
        shr     dx, 1
        mov     ax, 80h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        neg     dx
        mov     ax, 82h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        push    cs
        call    far_370BD
        mov     ax, 84h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 86h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 66h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, 0ffffh
        out     0a0h, ax
        jmp     NEAR br_370AD
br_36F65:
        mov     ax, word ptr es:[di+38h]
        mov     dx, 2c1ah
        mul     dx
        mov     dh, dl
        mov     dl, ah
        inc     dx
        mov     ax, 64h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        test    byte ptr [C0_B_0D7E2], 8
        jne     br_36F8A
        mov     dx, 1
br_36F8A:
        mov     ax, 68h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     al, byte ptr es:[di+3ah]
        xlat
        mov     ah, al
        mov     al, 0
        mov     dx, 8080h
        mul     dx
        neg     dx
        mov     ax, 80h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     al, byte ptr es:[di+3bh]
        mov     ah, 0
        add     ax, ax
        mov     si, C0_W_07C96
        add     si, ax
        mov     dx, word ptr [si]
        mov     ax, 84h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, word ptr es:[di+3ch]
        mov     dx, 2c1ah
        mul     dx
        mov     dh, dl
        mov     dl, ah
        inc     dx
        mov     ax, 66h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        test    byte ptr [C0_B_0D7E2], 8
        jne     br_36FF5
        mov     dx, 1
br_36FF5:
        mov     ax, 6ah
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     al, byte ptr es:[di+3eh]
        xlat
        mov     ah, al
        mov     al, 0
        mov     dx, 8080h
        mul     dx
        neg     dx
        mov     ax, 82h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     al, byte ptr es:[di+3fh]
        mov     ah, 0
        add     ax, ax
        mov     si, C0_W_07C96
        add     si, ax
        mov     dx, word ptr [si]
        mov     ax, 86h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        jmp     SHORT br_370AD
br_3703D:
        mov     dx, 1
        mov     ax, 64h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 66h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 68h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 6ah
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        sub     dx, dx
        mov     ax, 80h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 82h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     dx, 7fffh
        mov     ax, 84h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 86h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
br_370AD:
        retf
far_370AE:
        mov     al, byte ptr es:[di+36h]
        xlat
        mov     ah, al
        mov     al, 0
        mov     dx, 8080h
        mul     dx
        retf
far_370BD:
        mov     al, byte ptr es:[di+37h]
        mov     ah, 0
        add     ax, ax
        mov     si, C0_W_07C96
        add     si, ax
        mov     dx, word ptr [si]
        retf
far_370CD:
        mov     al, byte ptr es:[di+41h]
        xlat
        mov     dx, 8080h
        add     dh, al
        not     al
        add     dl, al
        mov     al, byte ptr es:[di+40h]
        xlat
        mov     cl, al
        mov     al, byte ptr [C0_B_0D7E2]
        and     al, 0ch
        cmp     al, 0ch
        jne     br_370ED
        sub     cl, cl
br_370ED:
        mov     al, dl
        mul     cl
        mov     dl, ah
        mov     al, dh
        mul     cl
        mov     al, dl
        mov     bp, ax
        test    byte ptr [C0_B_0D7E2], 8
        je      br_37132
        cmp     byte ptr es:[di+30h], 3
        je      br_37114
        mov     al, byte ptr es:[di+36h]
        xlat
        mov     dh, al
        mov     dl, al
        jmp     br_37122
br_37114:
        mov     al, byte ptr es:[di+3ah]
        xlat
        mov     dl, al
        mov     al, byte ptr es:[di+3eh]
        xlat
        mov     dh, al
br_37122:
        mov     ax, bp
        mov     cl, ah
        mul     dl
        mov     dl, ah
        mov     al, cl
        mul     dh
        mov     al, dl
        mov     bp, ax
br_37132:
        mov     al, byte ptr es:[di+42h]
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
        call    fn_377E4
        mov     ax, 0ceh
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, bp
        mov     al, ah
        mul     ch
        mov     dx, ax
        shr     dx, 1
        shr     dx, 0
        call    fn_377E4
        mov     ax, 0d4h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, bp
        mov     al, ah
        mul     cl
        mov     dx, ax
        shr     dx, 1
        shr     dx, 0
        call    fn_377E4
        mov     ax, 0d0h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, bp
        mul     ch
        mov     dx, ax
        shr     dx, 1
        shr     dx, 0
        call    fn_377E4
        mov     ax, 0d2h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     dx, 7f7fh
        xor     cx, cx
        mov     al, byte ptr es:[di+14h]
        xlat
        shr     al, 1
        mov     ah, al
        mov     al, byte ptr es:[di+46h]
        cmp     al, 0
        jne     br_371D4
        mov     dh, ah
        mov     al, byte ptr es:[di+40h]
        xlat
        shr     al, 1
        mov     cl, al
        jmp     br_371E3
br_371D4:
        cmp     al, 1
        jne     br_371E3
        mov     dl, ah
        mov     al, byte ptr es:[di+43h]
        xlat
        shr     al, 1
        mov     ch, al
br_371E3:
        mov     al, byte ptr [C0_B_0D7E2]
        test    al, 2
        je      br_371EC
        sub     ch, ch
br_371EC:
        and     al, 0ch
        cmp     al, 0ch
        jne     br_371F4
        sub     cl, cl
br_371F4:
        mov     al, dl
        shr     al, 0
        mov     bp, 0b2h
        push    cs
        call    dsp_reg_write_hi
xl_memcpy_4:
        mov     al, dh
        shr     al, 0
        mov     bp, 0b6h
        push    cs
        call    dsp_reg_write_hi
        mov     al, ch
        mov     bp, 0b4h
        push    cs
        call    dsp_reg_write_hi
        mov     al, byte ptr es:[di+41h]
        xlat
        mov     ch, al
        mov     dh, 7fh
        sub     dh, ch
        mov     al, cl
        mul     dh
        mov     dx, ax
        test    byte ptr [C0_B_0D7E2], 8
        je      br_37243
        cmp     byte ptr es:[di+30h], 3
        je      br_3723A
        mov     al, byte ptr es:[di+36h]
        jmp     br_3723E
br_3723A:
        mov     al, byte ptr es:[di+3ah]
br_3723E:
        xlat
        mul     dh
        mov     dx, ax
br_37243:
        shr     dx, 0
        mov     ax, 0b8h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     dh, 80h
        add     dh, ch
        mov     al, cl
        mul     dh
        mov     dx, ax
        test    byte ptr [C0_B_0D7E2], 8
        je      br_3727A
        cmp     byte ptr es:[di+30h], 3
        je      br_37271
        mov     al, byte ptr es:[di+36h]
        jmp     br_37275
br_37271:
        mov     al, byte ptr es:[di+3eh]
br_37275:
        xlat
        mul     dh
        mov     dx, ax
br_3727A:
        shr     dx, 0
        mov     ax, 0bah
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     al, byte ptr es:[di+44h]
        mov     ah, byte ptr es:[di+43h]
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
        call    fn_377E5
        call    fn_377E4
        mov     ax, 54h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        pop     dx
        mov     dl, 0
        shr     dx, 1
        shr     dx, 0
        call    fn_377E5
        call    fn_377E4
        mov     ax, 58h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        sub     dx, dx
        mov     ax, 0c4h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 0bch
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 0beh
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 0c0h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 0c2h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     al, byte ptr es:[di+47h]
        cmp     al, 0
        jne     br_37346
        mov     dx, 7fffh
        shr     dx, 2
        mov     ax, 0c6h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        jmp     br_3740B
br_37346:
        push    ax
        mov     ax, 0c6h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, 0
        out     0a0h, ax
        pop     ax
        mov     dx, 7fffh
        cmp     al, 1
        jne     br_37370
        shr     dx, 2
        mov     ax, 0c4h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        jmp     br_3740B
br_37370:
        cmp     al, 2
        jne     br_37387
        shr     dx, 0
        mov     ax, 0bch
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        jmp     br_3740B
br_37387:
        cmp     al, 3
        jne     br_373FE
        mov     al, byte ptr es:[di+41h]
        xlat
        mov     ch, al
        mov     dh, 7fh
        sub     dh, ch
        mov     dl, 0
        test    byte ptr [C0_B_0D7E2], 8
        je      br_373B5
        cmp     byte ptr es:[di+30h], 3
        je      br_373AC
        mov     al, byte ptr es:[di+36h]
        jmp     br_373B0
br_373AC:
        mov     al, byte ptr es:[di+3ah]
br_373B0:
        xlat
        mul     dh
        mov     dx, ax
br_373B5:
        shr     dx, 1
        shr     dx, 0
        mov     ax, 0beh
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     dh, 80h
        add     dh, ch
        mov     dl, 0
        test    byte ptr [C0_B_0D7E2], 8
        je      br_373EA
        cmp     byte ptr es:[di+30h], 3
        je      br_373E1
        mov     al, byte ptr es:[di+36h]
        jmp     br_373E5
br_373E1:
        mov     al, byte ptr es:[di+3eh]
br_373E5:
        xlat
        mul     dh
        mov     dx, ax
br_373EA:
        shr     dx, 1
        shr     dx, 0
        mov     ax, 0c0h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        jmp     br_3740B
br_373FE:
        mov     ax, 0c2h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
br_3740B:
        retf
dsp_reg_write_hi:
        push    dx
        mov     dh, al
        mov     dl, 0
        mov     ax, bp
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        pop     dx
        retf
far_3741F:
        mov     al, byte ptr [C0_B_DSP_CHAN]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     es, dx
        mov     di, ax
        retf
L_37431:
        push    es
        push    si
        push    di
        push    bp
        callf   EP_L_555A6_SEG:EP_L_555A6_OFF
        push    cs
        call    L_36E4E
        mov     bx, C0_W_07D1C
        push    cs
        call    far_37460
        push    cs
        call    far_3748F
        pop     bp
        pop     di
        pop     si
        pop     es
        retf
L_36E4E:
        mov     al, byte ptr [C0_B_DSP_CHAN]
        cbw
        push    ax
        callf   EP_PGM_FX_REVERB_PTR_SEG:EP_PGM_FX_REVERB_PTR_OFF
        add     sp, 2
        mov     es, dx
        mov     di, ax
        retf
far_37460:
        mov     ax, 1000h
        mov     dl, byte ptr [C0_B_DSP_CHAN]
        mov     dh, 0
        mul     dx
        mov     bp, 4000h
        add     bp, ax
        mov     ax, 0
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, bp
        out     0a0h, ax
        add     bp, 400h
        mov     ax, 4
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, bp
        out     0a0h, ax
        retf
far_3748F:
        mov     al, 10h
        test    byte ptr [C0_B_DSP_CHAN], 1
        je      br_3749B
        shr     al, 3
br_3749B:
        test    byte ptr [C0_B_DSP_CHAN], 2
        je      br_374A4
        shr     al, 1
br_374A4:
        cmp     byte ptr es:[di], 3
        ja      br_374B2
        not     al
        and     byte ptr [C0_B_09602], al
        jmp     br_374B6
br_374B2:
        or      byte ptr [C0_B_09602], al
br_374B6:
        mov     dl, byte ptr [C0_B_09602]
        mov     dh, 0
        mov     ax, 181h
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     al, byte ptr es:[di]
        cmp     al, 3
        jbe     br_374CF
        jmp     br_3759E
br_374CF:
        push    bx
        mov     si, C0_W_07BDA
        mov     ah, 0
        add     ax, ax
        add     si, ax
        push    ds
        mov     ax, DS_SEG
        mov     ds, ax
        mov     ax, word ptr [si]
        pop     ds
        mov     bp, ax
        or      ah, ah
        jns     br_374EA
        neg     ah
br_374EA:
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
tgt_3752F:
        mov     ax, si
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, dx
        mul     bx
        add     si, 4
        loop    tgt_3752F
        mov     cx, 3
        pop     dx
tgt_37548:
        mov     ax, si
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, dx
        mul     bx
        add     si, 4
        loop    tgt_37548
        pop     bx
        jmp     br_37682
        mov     cx, 4
        mov     si, 18h
        mov     dx, bp
tgt_37569:
        mov     ax, si
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, dx
        mul     bx
        sub     si, 4
        loop    tgt_37569
        mov     cx, 3
        mov     si, 24h
        pop     dx
tgt_37585:
        mov     ax, si
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, dx
        mul     bx
        sub     si, 4
        loop    tgt_37585
        pop     bx
        jmp     br_37682
br_3759E:
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
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, si
        mov     cx, 97c8h
        mul     cx
        mov     ax, 10h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     bp, dx
        mov     ax, dx
        mov     cx, 97c8h
        mul     cx
        mov     ax, 14h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        add     bp, dx
        mov     dx, si
        mov     cx, 2
        mov     si, 18h
L_3760B:
        mov     ax, si
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        add     bp, dx
        add     bp, dx
        add     bp, dx
        mov     ax, dx
        mul     bx
        add     si, 4
        loop    L_3760B
        mov     ax, si
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        add     si, 4
        mov     ax, dx
        mov     dx, 3
        mul     dx
        mov     cx, 4
        div     cx
        mov     dx, ax
        neg     dx
        mov     ax, si
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        pop     bx
        mov     al, byte ptr es:[di]
        sub     al, 4
        mov     ah, 10h
        mul     ah
        mov     cx, 8
        mov     si, C0_W_07BE2
        add     si, ax
        push    es
        mov     ax, DS_SEG
        mov     es, ax
        mov     bp, 34h
tgt_3766C:
        mov     ax, bp
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, word ptr es:[si]
        out     0a0h, ax
        add     si, 2
        add     bp, 4
        loop    tgt_3766C
        pop     es
br_37682:
        retf
L_37683:
        push    es
        push    si
        push    di
        push    bp
        push    cs
        call    L_36E4E
        mov     bx, C0_W_07D1C
        push    cs
        call    far_37697
        pop     bp
        pop     di
        pop     si
        pop     es
        retf
far_37697:
        mov     ax, word ptr es:[di+2]
        mov     dx, 2c1ah
        mul     dx
        mov     dh, dl
        mov     dl, ah
        mov     ax, 8
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     al, byte ptr es:[di+4]
        xlat
        mov     ah, al
        mov     al, 0
        mov     dx, 8080h
        mul     dx
        cmp     byte ptr es:[di], 3
        jbe     L_376C7
        sub     dx, dx
L_376C7:
        mov     ax, 28h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        cmp     byte ptr [C0_B_DSP_CHAN], 2
        jb      br_37736
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
        call    fn_377E5
        call    fn_377E4
        mov     ax, 54h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        pop     dx
        mov     dl, 0
        shr     dx, 1
        shr     dx, 0
        call    fn_377E5
        call    fn_377E4
        mov     ax, 58h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
br_37736:
        cmp     byte ptr es:[di], 3
        ja      br_37793
        mov     al, byte ptr es:[di+5]
        mov     ah, 0
        add     ax, ax
        mov     si, C0_W_07C96
        add     si, ax
        mov     dx, word ptr [si]
        mov     ax, 38h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     al, byte ptr es:[di+6]
        mov     ah, 0
        add     ax, ax
        mov     si, C0_W_07C96
        add     si, ax
        mov     dx, word ptr [si]
        mov     ax, 3ch
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     al, byte ptr es:[di+7]
        xlat
        mov     dh, al
        mov     dl, 0
        call    isqrt16
        mov     dh, cl
        mov     dl, 0
        shr     dx, 1
        mov     ax, 34h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
br_37793:
        mov     al, byte ptr es:[di+8]
        xlat
        cmp     byte ptr es:[di], 3
        ja      br_377A4
        shr     al, 1
        add     al, 4dh
        jmp     br_377AA
br_377A4:
        mov     ah, 0ceh
        mul     ah
        mov     al, ah
br_377AA:
        mov     ch, al
        mov     cl, 0
        shr     cx, 1
        mov     ax, 2ch
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, cx
        out     0a0h, ax
        mov     bp, cx
        add     dx, dx
        call    isqrt16
        mov     al, 0c0h
        mul     cl
        add     ax, 4000h
        cmp     byte ptr es:[di], 3
        jbe     br_377D4
        mov     ax, 0b333h
br_377D4:
        mul     bp
        mov     ax, 30h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        retf
fn_377E4:
        ret
fn_377E5:
        test    byte ptr [C0_B_0D7E2], 2
        je      L_371EE
        sub     dx, dx
L_371EE:
        ret
isqrt16:
        sub     cl, cl
        mov     ch, 80h
loop_377F3:
        add     cl, ch
        mov     al, cl
        mul     cl
        cmp     ax, dx
        jbe     br_377FF
        sub     cl, ch
br_377FF:
        shr     ch, 1
        jne     loop_377F3
        ret
L_37804:
        push    si
        mov     si, C0_W_08144
        push    cs
        call    far_37815
        add     si, 14h
        push    cs
        call    far_37815
        pop     si
        retf
far_37815:
        push    ax
        push    dx
        cmp     dl, byte ptr [si+2]
        jne     br_3783F
        mov     dl, dh
        xchg    dl, byte ptr [si+3]
        mov     al, dh
        xor     al, dl
        test    al, 40h
        je      br_3783F
        mov     ax, word ptr [si+0ch]
        test    dh, 40h
        je      br_37834
        mov     ax, word ptr [si+0eh]
br_37834:
        mov     word ptr [si+0ah], ax
        cmp     word ptr [si+8], ax
        jne     br_3783F
        inc     word ptr [si+8]
br_3783F:
        pop     dx
        pop     ax
        retf
far_37842:
        int     33h
        add     ax, ax
        retf
L_37847:
        push    si
        push    di
        push    bp
        call    fn_37854
        call    fn_378D0
        pop     bp
        pop     di
        pop     si
        retf
fn_37854:
        mov     al, byte ptr [C0_W_08128]
        inc     al
        and     al, 3
        mov     byte ptr [C0_W_08128], al
        mov     ah, 6
        mul     ah
        mov     bx, C0_W_0812A
        add     bx, ax
        push    cs
        call    far_37842
        mov     ah, al
        sub     al, byte ptr [bx]
        cmp     al, 14h
        jae     br_37874
        ret
br_37874:
        mov     byte ptr [bx], ah
        add     al, al
        mul     byte ptr [bx+1]
        add     ax, word ptr [bx+4]
        mov     word ptr [bx+4], ax
        shl     ax, 1
        jae     br_37887
        not     ah
br_37887:
        sub     ah, 80h
        mov     al, byte ptr [bx+3]
        imul    ah
        add     ah, byte ptr [bx+2]
        jns     br_37896
        sub     ax, ax
br_37896:
        cmp     ah, 38h
        jbe     br_3789E
        mov     ax, 3800h
br_3789E:
        mov     bl, ah
        mov     bh, 0
        add     bx, bx
        if      FW_VERSION >= 110
        add     bx, 7c12h
        else
        add     bx, 7c0ch
        endif
        push    ds
        mov     dx, DS_SEG
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
        add     al, byte ptr [C0_W_08128]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        ret
fn_378D0:
        mov     al, byte ptr [C0_B_08142]
        inc     al
        and     al, 1
        mov     byte ptr [C0_B_08142], al
        mov     ah, 14h
        mul     ah
        mov     bx, C0_W_08144
        add     bx, ax
        push    cs
        call    far_37842
        mov     ah, al
        sub     al, byte ptr [bx]
        cmp     al, 0ah
        jae     br_378F0
loop_378EF:
        ret
br_378F0:
        mov     byte ptr [bx], ah
        cmp     byte ptr [bx+1], 1
        jne     loop_378EF
        mov     bp, word ptr [bx+8]
        mov     cx, word ptr [bx+6]
        cmp     bp, word ptr [bx+0ah]
        je      loop_378EF
        pushf
        mov     ah, 0
        mul     word ptr [bx+4]
        or      dh, dh
        je      br_37910
        mov     dx, 0ffh
br_37910:
        mov     dh, dl
        mov     dl, ah
        mov     ah, al
        popf
        ja      br_37924
        add     cx, ax
        adc     bp, dx
        cmp     bp, word ptr [bx+0ah]
        jbe     br_37932
        jmp     br_3792F
br_37924:
        sub     cx, ax
        sbb     bp, dx
        jb      br_3792F
        cmp     bp, word ptr [bx+0ah]
        jae     br_37932
br_3792F:
        mov     bp, word ptr [bx+0ah]
br_37932:
        mov     word ptr [bx+8], bp
        mov     word ptr [bx+6], cx
        mov     al, byte ptr [C0_B_08142]
        xchg    al, byte ptr [C0_B_DSP_CHAN]
        push    ax
        mov     ax, 92h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, bp
        out     0a0h, ax
        mov     ax, 94h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, bp
        out     0a0h, ax
        add     cx, cx
        adc     bp, bp
        add     cx, cx
        adc     bp, bp
        mov     cx, 0ffffh
        sub     cx, bp
        mov     ax, word ptr [bx+10h]
        mul     cx
        mov     ax, 8ch
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 90h
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, word ptr [bx+12h]
        mul     cx
        neg     dx
        mov     ax, 7ch
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        mov     ax, 7eh
        add     al, byte ptr [C0_B_DSP_CHAN]
        out     0a2h, ax
        mov     ax, dx
        out     0a0h, ax
        pop     ax
        mov     byte ptr [C0_B_DSP_CHAN], al
        ret
timing_calc_rate:
        push    bp
        mov     bp, sp
        push    si
        push    di
        mov     si, word ptr [C0_W_098D8]
        mov     di, word ptr [C0_W_098DA]
        push    bp
        mov     bx, si
        mov     ax, di
        cwd
        mov     bp, dx
        mov     cx, 2
tgt_379C4:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_379C4
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 4
tgt_379D5:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_379D5
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 4
tgt_379E6:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_379E6
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 4
tgt_379F7:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_379F7
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 2
tgt_37A08:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_37A08
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 3
tgt_37A19:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_37A19
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        pop     bp
        mov     cx, 4
tgt_37A2B:
        sar     dx, 1
        rcr     ax, 1
        loop    tgt_37A2B
        mov     di, word ptr [bp+6]
        mov     cx, 8
tgt_37A37:
        sar     di, 1
        rcr     si, 1
        loop    tgt_37A37
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
tgt_37A5A:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_37A5A
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 3
tgt_37A6B:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_37A6B
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 3
tgt_37A7C:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_37A7C
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 5
tgt_37A8D:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_37A8D
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 3
tgt_37A9E:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_37A9E
        pop     bp
        mov     cx, 4
tgt_37AAA:
        sar     dx, 1
        rcr     ax, 1
        loop    tgt_37AAA
        push    ax
        push    dx
        mov     si, word ptr [C0_W_098D8]
        mov     di, word ptr [C0_W_098DA]
        push    bp
        mov     bx, si
        mov     ax, di
        cwd
        mov     bp, dx
        mov     cx, 2
tgt_37AC5:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_37AC5
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 3
tgt_37AD6:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_37AD6
        add     bx, si
        adc     ax, di
        adc     dx, bp
        mov     cx, 4
tgt_37AE7:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_37AE7
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
tgt_37B04:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_37B04
        sub     bx, si
        sbb     ax, di
        sbb     dx, bp
        mov     cx, 2
tgt_37B15:
        shl     bx, 1
        rcl     ax, 1
        rcl     dx, 1
        loop    tgt_37B15
        add     bx, si
        adc     ax, di
        adc     dx, bp
        pop     bp
        mov     cx, 4
tgt_37B27:
        sar     dx, 1
        rcr     ax, 1
        loop    tgt_37B27
        pop     di
        pop     si
        add     ax, si
        adc     dx, di
        pop     di
        pop     si
        mov     word ptr [C0_W_098D8], si
        mov     word ptr [C0_W_098DA], di
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
        js      br_37B70
        cmp     dh, 0
        jne     br_37B6A
        mov     ch, dl
        mov     cl, ah
        cmp     cx, word ptr [C0_W_0D762]
        jb      br_37B89
br_37B6A:
        mov     ax, word ptr [C0_W_0D762]
        dec     ax
        jmp     br_37B98
br_37B70:
        cmp     dh, 0ffh
        jne     br_37B81
        mov     ch, dl
        mov     cl, ah
        neg     cx
        cmp     cx, word ptr [C0_W_0D762]
        jb      br_37B89
br_37B81:
        mov     ax, word ptr [C0_W_0D762]
        dec     ax
        neg     ax
        jmp     br_37B98
br_37B89:
        mov     cx, 7
tgt_37B8C:
        shl     ax, 1
        rcl     dx, 1
        loop    tgt_37B8C
        mov     cx, word ptr [C0_W_0D762]
        idiv    cx
br_37B98:
        cmp     ax, word ptr [C0_W_0D7E6]
        jle     br_37BA3
        mov     word ptr [C0_W_0D7E6], ax
        jmp     br_37BAC
br_37BA3:
        cmp     ax, word ptr [C0_W_098A4]
        jge     br_37BAC
        mov     word ptr [C0_W_098A4], ax
br_37BAC:
        pop     di
        pop     si
        pop     bp
        retf
event_cb_dispatch:
        sti
        push    DS_SEG
        pop     ds
        cmp     bl, 0
        jne     isr_37BCA
        xchg    dh, dl
        push    dx
        push    cx
        xchg    ah, al
        push    ax
        callf   [C0_W_0816C]
        add     sp, 6
        jmp     isr_37BE8
isr_37BCA:
        cmp     bl, 1
        jne     isr_37BD9
        push    ax
        callf   [C0_W_08170]
        add     sp, 2
        jmp     isr_37BE8
isr_37BD9:
        cmp     bl, 2
        jne     isr_37BE8
        push    cx
        push    ax
        callf   EP_MIDI_NOTE_PROCESS_SEG:EP_MIDI_NOTE_PROCESS_OFF
        add     sp, 4
isr_37BE8:
        iret
event_cb_set_main:
        push    bp
        mov     bp, sp
        mov     bx, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     ax, dx
        or      ax, bx
        jne     br_37BFE
        mov     bx, (C0_BASE+L_37C2D-C0_SEG*16)
        mov     dx, C0_SEG
br_37BFE:
        pushf
        cli
        mov     word ptr [C0_W_08170], bx
        mov     word ptr [C0_W_08172], dx
        popf
        pop     bp
        retf
event_cb_set_aux:
        push    bp
        mov     bp, sp
        mov     bx, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     ax, dx
        or      ax, bx
        jne     br_37C20
        mov     bx, (C0_BASE+L_37C2D-C0_SEG*16)
        mov     dx, C0_SEG
br_37C20:
        pushf
        cli
        mov     word ptr [C0_W_0816C], bx
        mov     word ptr [C0_W_0816E], dx
        popf
        pop     bp
        retf
L_37C2D:
        push    bp
        mov     bp, sp
        pop     bp
        retf
wave_mem_size_probe:
        call    fn_37C3A
        call    fn_37C3A
        retf
        db      00h
fn_37C3A:
        push    di
        xor     ax, ax
        mov     word ptr [C0_W_098B6], ax
        out     0c2h, al
        mov     ax, 1001h
        push    ax
        push    4
        xor     ax, ax
        mov     dx, 10h
        push    dx
        push    ax
        mov     dx, 1
        push    dx
        push    ax
        call    fn_37D26
        add     sp, 0ch
        or      ax, ax
        je      L_37364
        mov     di, 4
        jmp     br_37C88
        nop
L_37364:
        xor     ax, ax
        mov     word ptr [C0_W_098B6], ax
        out     0c2h, al
        push    1001h
        push    1
        push    10h
        push    ax
        push    1
        push    ax
        call    fn_37D26
        add     sp, 0ch
        or      ax, ax
        je      L_37386
        mov     di, 1
        jmp     br_37C88
        nop
L_37386:
        xor     di, di
br_37C88:
        mov     ax, 4
        mov     word ptr [C0_W_098B6], ax
        out     0c2h, al
        push    1001h
        push    10h
        push    10h
        push    0
L_37499:
        push    1
        push    0
        call    fn_37D26
        add     sp, 0ch
        or      ax, ax
        je      br_37CAC
loop_37CA7:
        mov     bx, 10h
        jmp     br_37D17
br_37CAC:
        mov     ax, 7
        mov     word ptr [C0_W_098B6], ax
        out     0c2h, al
        push    1001h
        push    10h
        push    10h
        push    0
        push    1
        push    0
        call    fn_37D26
        add     sp, 0ch
        or      ax, ax
        jne     loop_37CA7
        mov     ax, 5
        mov     word ptr [C0_W_098B6], ax
        out     0c2h, al
        push    1001h
        push    10h
        push    10h
        push    0
        push    1
        push    0
        call    fn_37D26
        add     sp, 0ch
        or      ax, ax
        jne     loop_37CA7
        mov     ax, 6
        mov     word ptr [C0_W_098B6], ax
        out     0c2h, al
        push    1001h
        push    8
        push    10h
        push    0
        push    1
        push    0
        call    fn_37D26
        add     sp, 0ch
        or      ax, ax
        je      br_37D0E
        lea     bx, [di+8]
        jmp     br_37D17
br_37D0E:
        xor     ax, ax
        mov     word ptr [C0_W_098B6], ax
        out     0c2h, al
        mov     bx, di
br_37D17:
        shl     bx, 4
        mov     word ptr [C0_W_SMEM_SIZE], 0
        mov     word ptr [C2_W_SMEM_SIZE_HI], bx
        pop     di
        ret
fn_37D26:
        enter   10h, 0
        push    di
        push    si
        mov     di, word ptr [bp+0eh]
        mov     ax, di
        add     ax, di
        mov     dx, 7800h
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        xor     si, si
        mov     ax, word ptr [bp+0ch]
        mov     word ptr [bp-8], ax
        mov     ax, word ptr [bp+4]
        mov     dx, word ptr [bp+6]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
loop_37D50:
        push    di
        push    si
        push    7800h
        push    0
        call    buffer_init
        add     sp, 8
        mov     si, ax
        push    di
        push    7800h
        push    0
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        callf   EP_SMEM_WRITE_BLOCK_SEG:EP_SMEM_WRITE_BLOCK_OFF
        add     sp, 0ah
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        add     word ptr [bp-4], ax
        adc     word ptr [bp-2], dx
        dec     word ptr [bp-8]
        jne     loop_37D50
        mov     word ptr [bp-6], 0
        mov     ax, word ptr [bp+0ch]
        mov     word ptr [bp-8], ax
        mov     ax, word ptr [bp+4]
        mov     dx, word ptr [bp+6]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
loop_37D9B:
        push    word ptr [bp+0eh]
        push    word ptr [bp-6]
        push    7800h
        push    0
        call    buffer_init
        add     sp, 8
        mov     word ptr [bp-6], ax
        push    1000h
        push    word ptr [bp+0eh]
        push    word ptr [bp-0eh]
        push    word ptr [bp-10h]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        callf   EP_SMEM_BLOCK_COPY_SEG:EP_SMEM_BLOCK_COPY_OFF
        add     sp, 0ch
        xor     ax, ax
        mov     dx, 7800h
        mov     bx, word ptr [bp-10h]
        mov     si, word ptr [bp-0eh]
        mov     cx, word ptr [bp+0eh]
        add     cx, cx
        push    ds
        push    si
        mov     di, bx
        mov     si, ax
        pop     es
        mov     ds, dx
        repe cmpsb
        je      br_37DEB
        sbb     ax, ax
        sbb     ax, 0ffffh
br_37DEB:
        pop     ds
        or      ax, ax
        jne     br_37E04
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        add     word ptr [bp-4], ax
        adc     word ptr [bp-2], dx
        dec     word ptr [bp-8]
        jne     loop_37D9B
        jmp     br_37E0A
        nop
br_37E04:
        xor     ax, ax
        pop     si
        pop     di
        leave
        ret
br_37E0A:
        mov     ax, 1
        pop     si
        pop     di
        leave
        ret
        db      00h
buffer_init:
        enter   4, 0
        push    di
        push    si
        mov     word ptr [bp-4], 1
        mov     cx, word ptr [bp+0ah]
        mov     bx, word ptr [bp+8]
loop_37E23:
        mov     word ptr [bp-2], 0
        mov     di, word ptr [bp+4]
loop_37E2B:
        or      cx, cx
        je      br_37E48
        mov     es, word ptr [bp+6]
        mov     si, di
        add     di, 2
        mov     word ptr es:[si], bx
        add     bx, word ptr [bp-4]
        dec     cx
        inc     word ptr [bp-2]
        cmp     word ptr [bp-2], 81h
        jl      loop_37E2B
br_37E48:
        mov     word ptr [bp+4], di
        not     bx
        inc     word ptr [bp-4]
        or      cx, cx
        jne     loop_37E23
        mov     ax, bx
        pop     si
        pop     di
        leave
        ret
disk_svc_call:
        push    bp
        mov     bp, sp
        push    ax
        push    di
        push    si
        mov     bl, byte ptr [bp-2]
        or      si, di
        push    ds
        push    bp
        int     2fh
        pop     bp
        pop     ds
        pop     si
        pop     di
        leave
        ret
        db      00h
disk_file_close:
        mov     al, 0ah
        call    disk_svc_call
        retf
disk_media_ready_check:
        mov     al, 11h
        call    disk_svc_call
        retf
L_37E7C:
        mov     al, 15h
        call    disk_svc_call
        retf
far_37E82:
        mov     al, 1eh
        call    disk_svc_call
        retf
disk_last_error:
        mov     al, 20h
        call    disk_svc_call
        retf
disp_list_op_xyn:
        enter   6, 0
        push    bx
        push    dx
        push    ax
        mov     byte ptr [bp-6], al
        mov     byte ptr [bp-5], dl
        mov     byte ptr [bp-4], bl
        mov     al, byte ptr [bp+4]
        mov     byte ptr [bp-3], al
        mov     byte ptr [bp-2], 0
        lea     ax, [bp-6]
        push    ss
        push    ax
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        leave
        ret     2
disp_list_op_xy2b:
        enter   6, 0
        push    bx
        push    dx
        push    ax
        mov     byte ptr [bp-6], al
        mov     byte ptr [bp-5], dl
        mov     byte ptr [bp-4], bl
        mov     al, byte ptr [bp+6]
        mov     byte ptr [bp-3], al
        mov     al, byte ptr [bp+4]
        mov     byte ptr [bp-2], al
        mov     byte ptr [bp-1], 0
        lea     ax, [bp-6]
        push    ss
        push    ax
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        leave
        ret     4
disp_list_op_2b_str:
        enter   32h, 0
        push    di
        push    si
        mov     al, byte ptr [bp+4]
        mov     byte ptr [bp-32h], al
        mov     al, byte ptr [bp+6]
        mov     byte ptr [bp-31h], al
        mov     al, byte ptr [bp+8]
        mov     byte ptr [bp-30h], al
        lea     ax, [bp-2fh]
        mov     di, ax
        mov     word ptr [bp-2], ss
        mov     cx, 28h
        mov     si, word ptr [bp+0ah]
loop_37F0A:
        mov     es, word ptr [bp+0ch]
        cmp     byte ptr es:[si], 0
        je      br_37F21
        mov     al, byte ptr es:[si]
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[di], al
        inc     si
        inc     di
        dec     cx
        jne     loop_37F0A
br_37F21:
        mov     es, word ptr [bp-2]
        mov     bx, di
        inc     di
        mov     byte ptr es:[bx], 0
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[di], 0
        lea     ax, [bp-32h]
        push    ss
        push    ax
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        pop     si
        pop     di
        leave
        ret
        db      00h
disp_list_op_2str:
        enter   24h, 0
        push    ax
        push    di
        push    si
        mov     byte ptr [bp-24h], al
        lea     ax, [bp-23h]
        mov     di, ax
        mov     word ptr [bp-2], ss
        mov     cx, 1ch
        mov     si, word ptr [bp+8]
loop_37F5C:
        mov     es, word ptr [bp+0ah]
        cmp     byte ptr es:[si], 0
        je      br_37F75
        mov     al, byte ptr es:[si]
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[di], al
        inc     si
        inc     di
        dec     cx
        or      cx, cx
        jg      loop_37F5C
br_37F75:
        or      cx, cx
        jle     br_37F95
        mov     si, word ptr [bp+4]
loop_37F7C:
        mov     es, word ptr [bp+6]
        cmp     byte ptr es:[si], 0
        je      br_37F95
        mov     al, byte ptr es:[si]
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[di], al
        inc     si
        inc     di
        dec     cx
        or      cx, cx
        jg      loop_37F7C
br_37F95:
        mov     es, word ptr [bp-2]
        mov     bx, di
        inc     di
        mov     byte ptr es:[bx], 0
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[di], 0
        lea     ax, [bp-24h]
        push    ss
        push    ax
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        pop     si
        pop     di
        leave
        ret     8
        db      00h
draw_hline:
        push    bp
        mov     bp, sp
        push    word ptr [bp+0ah]
        mov     ax, 0bh
        mov     dx, word ptr [bp+6]
        mov     bx, word ptr [bp+8]
        call    disp_list_op_xyn
        leave
        retf
draw_vline:
        push    bp
        mov     bp, sp
        push    word ptr [bp+0ah]
        mov     ax, 0eh
        mov     dx, word ptr [bp+6]
        mov     bx, word ptr [bp+8]
        call    disp_list_op_xyn
        leave
        retf
draw_hdots:
        push    bp
        mov     bp, sp
        push    word ptr [bp+0ah]
        mov     ax, 0ch
        mov     dx, word ptr [bp+6]
        mov     bx, word ptr [bp+8]
        call    disp_list_op_xyn
        leave
        retf
draw_fill_rect:
        push    bp
        mov     bp, sp
        push    word ptr [bp+0ah]
        push    word ptr [bp+0ch]
        mov     ax, 12h
        mov     dx, word ptr [bp+6]
        mov     bx, word ptr [bp+8]
        call    disp_list_op_xy2b
        leave
        retf
        if      FW_VERSION < 112
        db      00h
        endif
        if      FW_VERSION >= 114
        db      00h
        endif
draw_erase_rect:
        if      FW_VERSION <> 112
        push    bp
        mov     bp, sp
        else
L_3780E                         equ     $+1
        add     byte ptr [di-75h], dl
        in      al, dx
        endif
        push    word ptr [bp+0ah]
        push    word ptr [bp+0ch]
        mov     ax, 13h
        mov     dx, word ptr [bp+6]
        mov     bx, word ptr [bp+8]
        call    disp_list_op_xy2b
        leave
        retf
        db      00h
draw_char_at:
        push    bp
FAR_38026_V107:
        mov     bp, sp
        push    word ptr [bp+0ah]
        push    0
        mov     ax, 7
        mov     dx, word ptr [bp+6]
        mov     bx, word ptr [bp+8]
        call    disp_list_op_xy2b
        leave
        retf
draw_softkey_label:
        push    bp
        mov     bp, sp
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    1ah
        call    disp_list_op_2b_str
        leave
        retf
disp_alert_wait_key:
        push    bp
        mov     bp, sp
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    C1_SEG
        push    (C1_BASE+L_3EECC-C1_SEG*16)
        mov     al, 23h
        call    disp_list_op_2str
        leave
        retf
disp_message_window:
        push    bp
        mov     bp, sp
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    word ptr [bp+0ch]
        push    word ptr [bp+0ah]
        mov     al, 18h
        call    disp_list_op_2str
        leave
        retf
draw_invert_box:
        push    bp
        mov     bp, sp
        push    3
        callf   EP_DISP_SELECT_PLANE_SEG:EP_DISP_SELECT_PLANE_OFF
        mov     sp, bp
        mov     ax, word ptr [bp+0ah]
        inc     ax
        push    ax
        mov     ax, word ptr [bp+0ch]
        inc     ax
        push    ax
        mov     dx, word ptr [bp+6]
        dec     dx
        mov     bx, word ptr [bp+8]
        dec     bx
        mov     ax, 12h
        call    disp_list_op_xy2b
        push    1
        callf   EP_DISP_SELECT_PLANE_SEG:EP_DISP_SELECT_PLANE_OFF
        leave
        retf
        db      00h
voice_start:
        enter   14h, 0
        push    di
        push    si
        les     bx, [bp+6]
        mov     al, byte ptr es:[bx+7]
        mov     byte ptr [bp-0fh], al
        mov     ax, word ptr es:[bx+3ch]
        mov     cx, 0ah
        sub     dx, dx
        div     cx
        add     ax, 2
        mov     word ptr [bp-8], ax
        mov     ax, word ptr es:[bx+30h]
        mov     word ptr [bp-2], ax
        mov     ax, word ptr es:[bx+32h]
        mov     word ptr [bp-4], ax
        mov     ax, word ptr es:[bx+16h]
        mov     word ptr [bp-6], ax
        mov     al, byte ptr es:[bx+8]
        mov     byte ptr [bp-11h], al
        mov     al, byte ptr es:[bx+9]
        mov     byte ptr [bp-10h], al
        mov     word ptr [bp-0ah], 2
        dec     al
        jne     br_3812A
        mov     ax, word ptr es:[bx+38h]
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
        add     cx, word ptr es:[bx+3ah]
        adc     dx, dx
        add     cx, 5
        adc     dx, 0
        push    dx
        push    cx
        mov     si, ax
        nop
        push    cs
        call    __aFldiv
        jmp     br_38193
br_3812A:
        cmp     byte ptr es:[bx+7], 0
        je      br_38158
        mov     ax, word ptr es:[bx+3ah]
        add     ax, 5
        sub     dx, dx
        div     cx
        mov     word ptr [bp-0ah], ax
        cmp     ax, 1
        ja      br_38149
        mov     word ptr [bp-0ah], 2
br_38149:
        mov     ax, 0ffffh
        mov     word ptr [bp-0eh], ax
        mov     word ptr [bp-0ch], ax
        mov     byte ptr [bp-11h], 2
        jmp     br_381A9
br_38158:
        push    0
        push    cx
        mov     ax, word ptr es:[bx+34h]
        mov     dx, word ptr es:[bx+36h]
        mov     cx, ax
        mov     si, dx
        sub     ax, word ptr es:[bx+3ah]
        sbb     dx, 0
        add     ax, 5
        adc     dx, 0
        push    dx
        push    ax
        mov     di, cx
        nop
        push    cs
        call    __aFuldiv
        mov     word ptr [bp-0ch], ax
        push    0
        push    0ah
        add     di, 5
        adc     si, 0
        push    si
        push    di
        mov     si, ax
        nop
        push    cs
        call    __aFuldiv
br_38193:
        mov     word ptr [bp-0eh], ax
        cmp     si, 1
        ja      br_381A0
        mov     word ptr [bp-0ch], 2
br_381A0:
        or      ax, ax
        jne     br_381A9
        mov     word ptr [bp-0eh], 1
br_381A9:
        cmp     byte ptr [bp-11h], 1
        jne     br_381C2
        les     bx, [bp+6]
        mov     al, byte ptr es:[bx+3]
        push    ax
        mov     al, byte ptr es:[bx+2]
        push    ax
        call    voice_release_by_note
        add     sp, 4
br_381C2:
        ifdef   MUTE_GROUPS
        if      FW_VERSION >= 112
        include "../feat/mute_choke.inc"
        else
        include "../common/feat/mute_choke.inc"
        endif
        else
        cmp     byte ptr [bp+0ah], 23h
        jl      br_381D4
        cmp     byte ptr [bp+0ah], 62h
        jg      br_381D4
        mov     dx, 1
        jmp     br_381D6
        nop
br_381D4:
        xor     dx, dx
br_381D6:
        or      dx, dx
        je      br_381F2
        mov     al, byte ptr [bp+0ah]
        les     bx, [bp+6]
        cmp     byte ptr es:[bx+3], al
        je      br_381F2
        push    ax
        mov     al, byte ptr es:[bx+2]
        push    ax
        call    voice_release_by_note
        add     sp, 4
br_381F2:
        cmp     byte ptr [bp+0ch], 23h
        jl      br_38204
        cmp     byte ptr [bp+0ch], 62h
        jg      br_38204
        mov     dx, 1
        jmp     br_38206
        nop
br_38204:
        xor     dx, dx
br_38206:
        or      dx, dx
        je      br_38222
        mov     al, byte ptr [bp+0ch]
        les     bx, [bp+6]
        cmp     byte ptr es:[bx+3], al
        je      br_38222
        push    ax
        mov     al, byte ptr es:[bx+2]
        push    ax
        call    voice_release_by_note
        add     sp, 4
        endif
br_38222:
        les     bx, [bp+6]
        cmp     byte ptr es:[bx], 20h
        jb      L_37C43
        mov     al, byte ptr es:[bx+3]
        push    ax
        mov     al, byte ptr es:[bx+2]
        push    ax
        callf   EP_L_41680_SEG:EP_L_41680_OFF
        add     sp, 4
        les     bx, [bp+6]
        mov     byte ptr es:[bx], al
L_37C43:
        les     bx, [bp+6]
        mov     bl, byte ptr es:[bx]
        sub     bh, bh
        add     bx, bx
        mov     word ptr [bx+C0_TBL_08F84], 0
        les     bx, [bp+6]
        mov     bl, byte ptr es:[bx]
        sub     bh, bh
        add     bx, bx
        mov     ax, word ptr [bx+C0_TBL_08F84]
        mov     word ptr [bx+C0_TBL_08F44], ax
        les     bx, [bp+6]
        mov     bl, byte ptr es:[bx]
        sub     bh, bh
        add     bx, bx
        mov     ax, word ptr [bx+C0_TBL_08F44]
        mov     word ptr [bx+C0_TBL_VOICE_TIMER], ax
        les     bx, [bp+6]
        mov     bl, byte ptr es:[bx]
        sub     bh, bh
        add     bx, bx
        mov     ax, word ptr [bx+C0_TBL_VOICE_TIMER]
        mov     word ptr [bx+C0_TBL_VOICE_HOLD], ax
        mov     al, byte ptr [bp+0eh]
        push    ax
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   EP_L_41846_SEG:EP_L_41846_OFF
        add     sp, 6
        les     bx, [bp+6]
        sub     ah, ah
        mov     al, byte ptr es:[bx]
        imul    si, ax, 14h
        push    ds
        lea     di, [si-69f8h]
        lea     si, [bp-14h]
        mov     ax, ds
        mov     es, ax
        mov     ax, ss
        mov     ds, ax
        mov     cx, 0ah
        rep movsw
        pop     ds
        les     bx, [bp+6]
        mov     al, byte ptr es:[bx+2]
        mov     cl, byte ptr es:[bx]
        sub     ch, ch
        imul    si, cx, 14h
        mov     byte ptr [si+VOICE_TABLE], al
        mov     al, byte ptr es:[bx+3]
        mov     cl, byte ptr es:[bx]
        imul    si, cx, 14h
        mov     byte ptr [si+VOICE_TABLE+1], al
        mov     al, byte ptr es:[bx+1]
        mov     cl, byte ptr es:[bx]
        imul    si, cx, 14h
        mov     byte ptr [si+C0_TBL_09608], al
        mov     ax, word ptr [bp-0ch]
        mov     bl, byte ptr es:[bx]
        sub     bh, bh
        add     bx, bx
        mov     word ptr [bx+C0_TBL_VOICE_HOLD], ax
        mov     ax, word ptr [bp-0eh]
        les     bx, [bp+6]
        mov     bl, byte ptr es:[bx]
        sub     bh, bh
        add     bx, bx
        mov     word ptr [bx+C0_TBL_VOICE_TIMER], ax
        les     bx, [bp+6]
        cmp     word ptr es:[bx+2eh], 0
        je      br_38322
        mov     ax, word ptr [bp-8]
        mov     bl, byte ptr es:[bx]
        sub     bh, bh
        add     bx, bx
        mov     word ptr [bx+C0_TBL_08F44], ax
br_38322:
        pop     si
        pop     di
        leave
        retf
voice_release_by_note:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     si, 1fh
        mov     di, 9875h
        mov     al, byte ptr [bp+4]
        cbw
loop_38335:
        mov     al, byte ptr [bp+4]
        cbw
        mov     cl, byte ptr [di]
        sub     ch, ch
        cmp     ax, cx
        jne     br_38355
        mov     al, byte ptr [bp+6]
        cbw
        mov     cl, byte ptr [di+1]
        cmp     ax, cx
        jne     br_38355
        push    si
        callf   EP_VOICE_RELEASE_SEG:EP_VOICE_RELEASE_OFF
        add     sp, 2
br_38355:
        mov     cx, si
        sub     di, 14h
        dec     si
        or      cx, cx
        jne     loop_38335
        pop     si
        pop     di
        leave
        ret
        nop
midi_channel_msg_dispatch:
        push    bp
        mov     bp, sp
        cmp     byte ptr [C0_B_0D776], 0
        jne     br_38377
        cmp     byte ptr [bp+9], 1
        je      br_38377
        jmp     br_38404
br_38377:
        mov     cl, byte ptr [bp+6]
        and     cx, 0f0h
        cmp     cx, 80h
        jl      br_383F2
        cmp     cx, 0f0h
        jge     br_383F2
        and     byte ptr [bp+6], 0fh
        cmp     byte ptr [bp+6], 3
        ja      br_38404
        mov     ax, cx
        sub     ax, 80h
        je      br_383C4
        sub     ax, 10h
        je      br_383AC
        sub     ax, 20h
        je      br_383D6
        sub     ax, 10h
        je      br_383E4
        leave
        retf
br_383AC:
        cmp     byte ptr [bp+8], 0
        je      br_383C0
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        call    note_event
        leave
        retf
br_383C0:
        mov     byte ptr [bp+8], 40h
br_383C4:
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        call    note_stop
        add     sp, 6
        leave
        retf
        nop
br_383D6:
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        call    fn_388F6
        leave
        retf
br_383E4:
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        call    fn_3886E
        leave
        retf
br_383F2:
        cmp     byte ptr [bp+6], 3
        ja      br_38404
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        call    fn_38406
br_38404:
        leave
        retf
fn_38406:
        enter   2, 0
        push    si
        cmp     byte ptr [bp+6], 64h
        jbe     br_38415
        mov     byte ptr [bp+6], 64h
br_38415:
        cmp     byte ptr [bp+5], 3fh
        jbe     br_3841E
        jmp     br_384EF
br_3841E:
        mov     al, byte ptr [bp+4]
        sub     ah, ah
        add     ax, 60h
        push    ax
        nop
        push    cs
        call    ivt_get_vector
        add     sp, 2
        mov     es, dx
        mov     si, ax
        mov     bl, byte ptr [bp+5]
        sub     bh, bh
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     word ptr [bp-2], ax
        cmp     ax, 23h
        jl      br_3844E
        cmp     ax, 62h
        jg      br_3844E
        mov     dx, 1
        jmp     br_38450
br_3844E:
        xor     dx, dx
br_38450:
        or      dx, dx
        jne     br_38457
        jmp     br_384EF
br_38457:
        mov     al, byte ptr [bp+8]
        sub     ah, ah
        dec     ax
        je      br_3846C
        dec     ax
        je      br_3848A
        dec     ax
        je      br_384A8
        dec     ax
        dec     ax
        je      br_384C6
        pop     si
        leave
        ret
br_3846C:
        push    word ptr [bp-2]
        mov     al, byte ptr [bp+4]
        sub     ah, ah
        push    ax
        callf   EP_PGM_STEREO_MIX_PTR_SEG:EP_PGM_STEREO_MIX_PTR_OFF
        add     sp, 4
        mov     es, dx
        mov     bx, ax
        mov     al, byte ptr [bp+6]
        mov     byte ptr es:[bx], al
        jmp     br_384E2
        nop
br_3848A:
        push    word ptr [bp-2]
        mov     al, byte ptr [bp+4]
        sub     ah, ah
        push    ax
        callf   EP_PGM_STEREO_MIX_PTR_SEG:EP_PGM_STEREO_MIX_PTR_OFF
        add     sp, 4
        mov     es, dx
        mov     bx, ax
        mov     al, byte ptr [bp+6]
        mov     byte ptr es:[bx+1], al
        jmp     br_384E2
br_384A8:
        push    word ptr [bp-2]
        mov     al, byte ptr [bp+4]
        sub     ah, ah
        push    ax
        callf   EP_PGM_INDIV_FX_MIX_PTR_SEG:EP_PGM_INDIV_FX_MIX_PTR_OFF
        add     sp, 4
        mov     es, dx
        mov     bx, ax
        mov     al, byte ptr [bp+6]
        mov     byte ptr es:[bx+4], al
        jmp     br_384E2
br_384C6:
        push    word ptr [bp-2]
        mov     al, byte ptr [bp+4]
        sub     ah, ah
        push    ax
        callf   EP_PGM_INDIV_FX_MIX_PTR_SEG:EP_PGM_INDIV_FX_MIX_PTR_OFF
        add     sp, 4
        mov     es, dx
        mov     bx, ax
        mov     al, byte ptr [bp+6]
        mov     byte ptr es:[bx+2], al
br_384E2:
        mov     ax, word ptr [C2_W_PARAM_HOOK_SEG]
        or      ax, word ptr [C2_W_PARAM_HOOK_OFF]
        je      br_384EF
        callf   [C2_W_PARAM_HOOK_OFF]
br_384EF:
        pop     si
        leave
        ret
note_stop:                              ; near; w1=idA|note<<8, w2=vel|idB<<8, caller pops 6
        enter   2, 0
        push    si
        mov     al, byte ptr [bp+5]
        cbw
        mov     si, ax
        cmp     si, 23h
        jl      br_3850C
        cmp     si, 62h
        jg      br_3850C
        mov     dx, 1
        jmp     br_3850E
br_3850C:
        xor     dx, dx
br_3850E:
        or      dx, dx
        je      br_3857C
        mov     al, byte ptr [bp+7]
        cbw
        mov     bx, ax
        shl     bx, 2
        mov     al, byte ptr [bp+4]
        cbw
        add     bx, ax
        shl     bx, 6
        sub     si, 23h
        add     bx, si
        mov     ax, bx
        add     bx, bx
        add     bx, ax
        mov     word ptr [bp-2], bx
        cmp     byte ptr [bx+C1_W_081FA], 0
        je      br_3857C
        mov     byte ptr [bx+C1_W_081FA], 0
        mov     al, byte ptr [bp+5]
        push    ax
        mov     al, byte ptr [bp+4]
        push    ax
        mov     cl, byte ptr [bp+7]
        push    cx
        call    fn_3911E
        mov     bx, word ptr [bp-2]
        add     sp, 6
        mov     al, byte ptr [bx+C0_TBL_081FB]
        push    ax
        mov     al, byte ptr [bp+4]
        push    ax
        mov     cl, byte ptr [bp+7]
        push    cx
        call    fn_3911E
        mov     bx, word ptr [bp-2]
        add     sp, 6
        mov     al, byte ptr [bx+C0_TBL_081FC]
        push    ax
        mov     al, byte ptr [bp+4]
        push    ax
        mov     al, byte ptr [bp+7]
        push    ax
        call    fn_3911E
        add     sp, 6
br_3857C:
        pop     si
        leave
        ret
        db      00h
note_event:                             ; [bp+6]==0 velocity = off -> note_stop
        enter   0eh, 0
        push    di
        push    si
        mov     al, byte ptr [bp+5]
        mov     byte ptr [bp-1], al
        cmp     byte ptr [bp+6], 0
        jne     note_on
        mov     byte ptr [bp+6], 40h
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        call    note_stop
        add     sp, 6
        pop     si
        pop     di
        leave
        ret
        nop
note_on:                                ; jne target of note_event, not an entry; 23h-62h
        cmp     byte ptr [bp+5], 23h
        jl      br_385BC
        cmp     byte ptr [bp+5], 62h
        jg      br_385BC
        mov     dx, 1
        jmp     br_385BE
        nop
br_385BC:
        xor     dx, dx
br_385BE:
        or      dx, dx
        if      FW_VERSION >= 112
        jne     br_385C5
        else
        jne     L_37CC5
        endif
        jmp     br_38869
        if      FW_VERSION < 112
L_37CC5:
        mov     al, byte ptr [bp+4]
        endif
br_385C5:
        if      FW_VERSION >= 112
        mov     al, byte ptr [bp+4]
        endif
        cbw
        add     ax, 5ch
        push    ax
        nop
        push    cs
        call    ivt_get_vector
        add     sp, 2
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-4], dx
        mov     al, 18h
        imul    byte ptr [bp+5]
        mov     cx, word ptr [bp-6]
        add     cx, ax
        sub     cx, 32ah
        mov     si, cx
        mov     word ptr [bp-8], dx
        mov     word ptr [bp-0ah], cx
        mov     bx, cx
        mov     es, dx
        mov     al, byte ptr es:[bx]
        sub     ah, ah
        dec     ax
        dec     ax
        jne     br_38601
        jmp     br_386B8
br_38601:
        dec     ax
        jne     loop_38607
        jmp     br_3871E
loop_38607:
        les     bx, [bp-0ah]
        mov     al, byte ptr es:[bx+0ch]
        mov     byte ptr [bp-2], al
loop_38611:
        mov     al, byte ptr [bp-2]
        push    ax
        mov     al, byte ptr [bp-1]
        cbw
        push    ax
        mov     cx, ax
        mov     al, byte ptr [bp+4]
        cbw
        push    ax
        mov     si, ax
        mov     di, cx
        callf   EP_PGM_INDIV_FX_MIX_PTR_SEG:EP_PGM_INDIV_FX_MIX_PTR_OFF
        add     sp, 4
        push    dx
        push    ax
        push    di
        push    si
        callf   EP_PGM_STEREO_MIX_PTR_SEG:EP_PGM_STEREO_MIX_PTR_OFF
        add     sp, 4
        push    dx
        push    ax
        push    word ptr [bp-8]
        push    word ptr [bp-0ah]
        push    word ptr [bp-4]
        push    word ptr [bp-6]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        call    note_voice_prepare
        add     sp, 18h
        sub     byte ptr [bp-1], 23h
        mov     al, byte ptr [bp-1]
        cbw
        mov     word ptr [bp-0ch], ax
        mov     al, byte ptr [bp+7]
        cbw
        mov     bx, ax
        shl     bx, 2
        mov     al, byte ptr [bp+4]
        cbw
        add     bx, ax
        shl     bx, 6
        add     bx, word ptr [bp-0ch]
        mov     ax, bx
        add     bx, bx
        add     bx, ax
        inc     byte ptr [bx+C1_W_081FA]
        mov     al, byte ptr [bp+5]
        if      FW_VERSION >= 110
        add     bx, 81fbh
        else
        add     bx, 81f5h
        endif
        mov     word ptr [bp-0eh], bx
        mov     byte ptr [bx], al
        les     bx, [bp-0ah]
        cmp     byte ptr es:[bx], 1
        je      br_38698
        jmp     br_38869
br_38698:
        mov     al, byte ptr es:[bx+2]
        mov     bx, word ptr [bp-0eh]
        mov     byte ptr [bx], al
        mov     byte ptr [bp+5], al
        cmp     al, 23h
        jge     br_386AB
        jmp     br_38790
br_386AB:
        cmp     al, 62h
        jle     br_386B2
        jmp     br_38790
br_386B2:
        mov     dx, 1
        jmp     br_38792
br_386B8:
        mov     al, byte ptr [bp+6]
        cbw
        mov     cl, byte ptr es:[si+3]
        sub     ch, ch
        cmp     cx, ax
        jge     br_386F6
        mov     al, byte ptr es:[si+4]
        mov     byte ptr [bp+5], al
        cmp     al, 23h
        jl      loop_386D5
        cmp     al, 62h
        jle     br_38719
loop_386D5:
        xor     dx, dx
loop_386D7:
        or      dx, dx
        jne     br_386DE
        jmp     br_38869
br_386DE:
        mov     al, 18h
        imul    byte ptr [bp+5]
        add     ax, word ptr [bp-6]
        mov     dx, word ptr [bp-4]
        sub     ax, 32ah
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-8], dx
        jmp     loop_38607
        nop
br_386F6:
        mov     word ptr [bp-0ah], si
        mov     al, byte ptr [bp+6]
        cbw
        mov     cl, byte ptr es:[si+1]
        sub     ch, ch
        cmp     cx, ax
        jl      br_3870A
        jmp     loop_38607
br_3870A:
        mov     al, byte ptr es:[si+2]
        mov     byte ptr [bp+5], al
        cmp     al, 23h
        jl      loop_386D5
        cmp     al, 62h
        jg      loop_386D5
br_38719:
        mov     dx, 1
        jmp     loop_386D7
br_3871E:
        cmp     byte ptr [bp+8], 1
        jne     br_3872C
        mov     al, byte ptr [bp+9]
        cbw
        mov     cx, ax
        jmp     br_38732
br_3872C:
        mov     cl, byte ptr es:[si+0bh]
        sub     ch, ch
br_38732:
        mov     al, byte ptr es:[si+3]
        sub     ah, ah
        cmp     ax, cx
        jge     br_38750
        mov     al, byte ptr es:[si+4]
        mov     byte ptr [bp+5], al
        cmp     al, 23h
        jl      br_38769
        cmp     al, 62h
        jg      br_38769
loop_3874B:
        mov     dx, 1
        jmp     br_3876B
br_38750:
        mov     al, byte ptr es:[si+1]
        sub     ah, ah
        cmp     ax, cx
        jge     br_38785
        mov     al, byte ptr es:[si+2]
        mov     byte ptr [bp+5], al
        cmp     al, 23h
        jl      br_38769
        cmp     al, 62h
        jle     loop_3874B
br_38769:
        xor     dx, dx
br_3876B:
        or      dx, dx
        jne     br_38772
        jmp     br_38869
br_38772:
        mov     al, 18h
        imul    byte ptr [bp+5]
        add     ax, word ptr [bp-6]
        mov     dx, word ptr [bp-4]
        sub     ax, 32ah
        mov     si, ax
        mov     word ptr [bp-8], dx
br_38785:
        mov     byte ptr [bp-2], 1
        mov     word ptr [bp-0ah], si
        jmp     loop_38611
        nop
br_38790:
        xor     dx, dx
br_38792:
        or      dx, dx
        je      br_387E1
        mov     al, byte ptr [bp-2]
        push    ax
        mov     al, byte ptr [bp+5]
        cbw
        push    ax
        mov     cx, ax
        mov     al, byte ptr [bp+4]
        cbw
        push    ax
        mov     si, ax
        mov     di, cx
        callf   EP_PGM_INDIV_FX_MIX_PTR_SEG:EP_PGM_INDIV_FX_MIX_PTR_OFF
        add     sp, 4
        push    dx
        push    ax
        push    di
        push    si
        callf   EP_PGM_STEREO_MIX_PTR_SEG:EP_PGM_STEREO_MIX_PTR_OFF
        add     sp, 4
        push    dx
        push    ax
        imul    ax, di, 18h
        add     ax, word ptr [bp-6]
        mov     dx, word ptr [bp-4]
        sub     ax, 32ah
        push    dx
        push    ax
        push    dx
        push    word ptr [bp-6]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        call    note_voice_prepare
        add     sp, 18h
br_387E1:
        mov     al, byte ptr [bp+7]
        cbw
        mov     bx, ax
        shl     bx, 2
        mov     al, byte ptr [bp+4]
        cbw
        add     bx, ax
        shl     bx, 6
        add     bx, word ptr [bp-0ch]
        mov     ax, bx
        add     bx, bx
        add     bx, ax
        les     si, [bp-0ah]
        mov     al, byte ptr es:[si+4]
        mov     byte ptr [bx+C0_TBL_081FC], al
        mov     byte ptr [bp+5], al
        cmp     al, 23h
        jl      br_38818
        cmp     al, 62h
        jg      br_38818
        mov     dx, 1
        jmp     br_3881A
        nop
br_38818:
        xor     dx, dx
br_3881A:
        or      dx, dx
        je      br_38869
        mov     al, byte ptr [bp-2]
        push    ax
        mov     al, byte ptr [bp+5]
        cbw
        push    ax
        mov     cx, ax
        mov     al, byte ptr [bp+4]
        cbw
        push    ax
        mov     si, ax
        mov     di, cx
        callf   EP_PGM_INDIV_FX_MIX_PTR_SEG:EP_PGM_INDIV_FX_MIX_PTR_OFF
        add     sp, 4
        push    dx
        push    ax
        push    di
        push    si
        callf   EP_PGM_STEREO_MIX_PTR_SEG:EP_PGM_STEREO_MIX_PTR_OFF
        add     sp, 4
        push    dx
        push    ax
        imul    ax, di, 18h
        add     ax, word ptr [bp-6]
        mov     dx, word ptr [bp-4]
        sub     ax, 32ah
        push    dx
        push    ax
        push    dx
        push    word ptr [bp-6]
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        call    note_voice_prepare
        add     sp, 18h
br_38869:
        pop     si
        pop     di
        leave
        ret
        db      00h
fn_3886E:
        enter   2, 0
        push    di
        push    si
        mov     al, byte ptr [bp+4]
        sub     ah, ah
        imul    bx, ax, 184h
        cmp     byte ptr [bx+C0_TBL_09161], ah
        je      br_388F2
        add     ax, 5ch
        push    ax
        nop
        push    cs
        call    ivt_get_vector
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        mov     al, byte ptr [bp+5]
        cmp     byte ptr es:[bx+1ch], al
        je      br_388F2
        sub     ah, ah
        mov     di, ax
        or      di, ax
        jl      br_388F2
loop_388A4:
        xor     cx, cx
        mov     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        add     ax, 2
        mov     si, ax
        mov     es, dx
loop_388B4:
        cmp     byte ptr es:[si], 0
        je      br_388C4
        mov     al, byte ptr es:[si+1ah]
        sub     ah, ah
        cmp     ax, di
        je      br_388D6
br_388C4:
        add     si, 99eh
        inc     cx
        cmp     cx, 17h
        jle     loop_388B4
        dec     di
        jns     loop_388A4
        pop     si
        pop     di
        leave
        ret
        nop
br_388D6:
        push    cx
        mov     al, byte ptr [bp+4]
        sub     ah, ah
        push    ax
        callf   EP_DRUM_PROGRAM_SELECT_SEG:EP_DRUM_PROGRAM_SELECT_OFF
        add     sp, 4
        mov     ax, word ptr [C2_W_PARAM_HOOK_SEG]
        or      ax, word ptr [C2_W_PARAM_HOOK_OFF]
        je      br_388F2
        callf   [C2_W_PARAM_HOOK_OFF]
br_388F2:
        pop     si
        pop     di
        leave
        ret
fn_388F6:
        enter   4, 0
        push    si
        mov     al, byte ptr [C2_B_MIXER_DRUM]
        cbw
        mov     cl, byte ptr [bp+4]
        sub     ch, ch
        cmp     cx, ax
        jne     br_38918
        mov     al, byte ptr [bp+6]
        push    ax
        mov     al, byte ptr [bp+5]
        push    ax
        callf   EP_X_55916_SEG:EP_X_55916_OFF
        add     sp, 4
br_38918:
        mov     al, byte ptr [bp+5]
        sub     ah, ah
        cmp     ax, 78h
        je      br_38964
        jg      br_3892C
        sub     ax, 7
        je      br_3893E
        pop     si
        leave
        ret
br_3892C:
        sub     ax, 79h
        je      br_38972
        dec     ax
        dec     ax
        jl      br_38999
        sub     ax, 4
        jle     br_3897E
        pop     si
        leave
        ret
        nop
br_3893E:
        mov     al, byte ptr [bp+4]
        sub     ah, ah
        imul    bx, ax, 184h
        add     bx, 8fe0h
        mov     si, bx
        mov     word ptr [bp-2], ds
        cmp     byte ptr [bx+182h], ah
        je      br_3898C
        mov     al, byte ptr [bp+6]
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+183h], al
        jmp     br_3898C
        nop
br_38964:
        mov     al, byte ptr [bp+4]
        push    ax
        mov     al, byte ptr [bp+7]
        push    ax
        call    fn_3899C
        jmp     br_38989
        nop
br_38972:
        mov     al, byte ptr [bp+4]
        push    ax
        call    fn_389FE
        add     sp, 2
        jmp     br_3898C
br_3897E:
        mov     al, byte ptr [bp+4]
        push    ax
        mov     al, byte ptr [bp+7]
        push    ax
        call    note_stop_all
br_38989:
        add     sp, 4
br_3898C:
        mov     ax, word ptr [C2_W_PARAM_HOOK_SEG]
        or      ax, word ptr [C2_W_PARAM_HOOK_OFF]
        je      br_38999
        callf   [C2_W_PARAM_HOOK_OFF]
br_38999:
        pop     si
        leave
        ret
fn_3899C:
        enter   2, 0
        push    di
        push    si
        xor     si, si
        mov     word ptr [bp-2], 8f04h
        mov     di, 9608h
        mov     al, byte ptr [bp+4]
        cbw
loop_389B0:
        mov     al, byte ptr [bp+4]
        cbw
        mov     cl, byte ptr [di]
        sub     ch, ch
        cmp     ax, cx
        jne     br_389D8
        mov     al, byte ptr [bp+6]
        cbw
        mov     cl, byte ptr [di+1]
        cmp     ax, cx
        jne     br_389D8
        mov     bx, word ptr [bp-2]
        cmp     word ptr [bx], 0
        je      br_389D8
        push    si
        callf   EP_VOICE_RELEASE_FULL_SEG:EP_VOICE_RELEASE_FULL_OFF
        add     sp, 2
br_389D8:
        add     word ptr [bp-2], 2
        add     di, 14h
        inc     si
        cmp     si, 20h
        jb      loop_389B0
        mov     al, byte ptr [bp+4]
        cbw
        imul    bx, ax, 300h
        xor     ax, ax
        mov     cx, 180h
        lea     di, [bx+C1_W_081FA]
        push    ds
        pop     es
        rep stosw
        pop     si
        pop     di
        leave
        ret
fn_389FE:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp+4]
        cbw
        imul    bx, ax, 184h
        mov     byte ptr [bx+C0_TBL_09163], 7fh
        leave
        ret
note_stop_all:                          ; note_stop(23h..62h, velocity 40h)
        enter   6, 0
        mov     al, byte ptr [bp+6]
        mov     byte ptr [bp-6], al
        mov     al, byte ptr [bp+4]
        mov     byte ptr [bp-3], al
        mov     byte ptr [bp-4], 40h
        mov     byte ptr [bp-5], 23h
loop_38A28:
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    word ptr [bp-6]
        call    note_stop
        add     sp, 6
        inc     byte ptr [bp-5]
        cmp     byte ptr [bp-5], 62h
        jle     loop_38A28
        leave
        ret
note_voice_prepare:                            ; ES:DI = note record; +6/+7 Mutes-off slots
        enter   52h, 0
        push    di
        push    si
        mov     al, byte ptr [bp+4]
        cbw
        imul    ax, ax, 184h
        add     ax, 8fe0h
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], ds
        mov     al, byte ptr [bp+5]
        cbw
        mov     si, ax
        shl     si, 2
        les     bx, [bp+0ah]
        mov     ax, word ptr es:[bx+si+752h]
        mov     dx, word ptr es:[bx+si+754h]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jne     br_38A7C
        jmp     br_39119
br_38A7C:
        mov     al, byte ptr [bp+7]
        mov     byte ptr [bp-4fh], al
        mov     al, byte ptr [bp+4]
        mov     byte ptr [bp-4eh], al
        mov     al, byte ptr [bp+5]
        mov     byte ptr [bp-4dh], al
        mov     al, byte ptr [bp+6]
        mov     byte ptr [bp-4ch], al
        mov     al, byte ptr [bp+8]
        mov     byte ptr [bp-4bh], al
        mov     al, byte ptr [bp+9]
        mov     byte ptr [bp-4ah], al
        les     bx, [bp-8]
        mov     ax, word ptr es:[bx+2ah]
        mov     dx, word ptr es:[bx+2ch]
        mov     word ptr [bp-34h], ax
        mov     word ptr [bp-32h], dx
        mov     ax, word ptr es:[bx+2ah]
        mov     dx, word ptr es:[bx+2ch]
        sub     ax, word ptr es:[bx+32h]
        sbb     dx, word ptr es:[bx+34h]
        mov     word ptr [bp-30h], ax
        mov     word ptr [bp-2eh], dx
        mov     ax, word ptr es:[bx+3ah]
        mov     dx, word ptr es:[bx+3ch]
        mov     word ptr [bp-2ch], ax
        mov     word ptr [bp-2ah], dx
        mov     ax, word ptr es:[bx+34h]
        or      ax, word ptr es:[bx+32h]
        je      br_38AE8
        mov     al, byte ptr es:[bx+36h]
        mov     byte ptr [bp-49h], al
        jmp     br_38AEC
br_38AE8:
        mov     byte ptr [bp-49h], 0
br_38AEC:
        mov     di, word ptr [bp+0eh]
        mov     ax, word ptr es:[bx+2eh]
        mov     dx, word ptr es:[bx+30h]
        cmp     word ptr es:[bx+2ah], ax
        jne     br_38B08
        cmp     word ptr es:[bx+2ch], dx
        jne     br_38B08
        mov     al, 1
        jmp     br_38B0A
        nop
br_38B08:
        xor     al, al
br_38B0A:
        mov     byte ptr [bp-11h], al
        mov     es, word ptr [bp+10h]
        mov     al, byte ptr es:[di+5]
        mov     byte ptr [bp-48h], al
        mov     es, word ptr [bp-6]
        mov     al, byte ptr es:[bx+24h]
        cbw
        mov     cx, ax
        mov     al, byte ptr [bp-4ch]
        cbw
        mov     bx, ax
        mov     word ptr [bp-52h], ax
        mov     es, word ptr [bp+10h]
        mov     al, byte ptr es:[di+17h]
        cbw
        imul    bx
        mov     dx, 7fh
        mov     bx, dx
        cwd
        idiv    bx
        mov     si, ax
        add     si, cx
        add     si, word ptr es:[di+8]
        cmp     byte ptr [bp-4bh], bh
        jne     br_38B54
        mov     al, byte ptr [bp-4ah]
        cbw
        sub     ax, 40h
        add     ax, ax
        add     si, ax
br_38B54:
        TUNE_RATIO_SI
resume_38B6F:
        mov     word ptr [bp-40h], ax
        push    0
        push    0ah
        mov     cx, 80h
        sub     cx, word ptr [bp-52h]
        mov     al, byte ptr es:[di+14h]
        sub     ah, ah
        imul    cx
        mov     cx, bx
        cwd
        idiv    cx
        mov     bx, ax
        add     bx, ax
        mov     ax, 1b9h
        imul    word ptr [bx+C0_TBL_004DA]
        push    dx
        push    ax
        nop
        push    cs
        call    __aFldiv
        les     bx, [bp-8]
        add     ax, word ptr es:[bx+26h]
        adc     dx, word ptr es:[bx+28h]
        mov     word ptr [bp-38h], ax
        mov     word ptr [bp-36h], dx
        push    0
        push    1b9h
        mov     ax, word ptr es:[bx+2ah]
        mov     dx, word ptr es:[bx+2ch]
        sub     ax, word ptr [bp-38h]
        sbb     dx, word ptr [bp-36h]
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
        cmp     byte ptr [bp-49h], 0
        jne     br_38BEE
        sub     word ptr [bp-4], 1eh
        sbb     word ptr [bp-2], 0
br_38BEE:
        cmp     word ptr [bp-2], 0
        jge     br_38BF7
        jmp     br_39119
br_38BF7:
        jg      br_38C02
        cmp     word ptr [bp-4], 0
        jne     br_38C02
        jmp     br_39119
br_38C02:
        push    0
        push    word ptr [bp-40h]
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
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
        call    __aFldiv
        mov     word ptr [bp-1ch], ax
        mov     word ptr [bp-1ah], dx
        push    0
        push    0c671h
        mov     cx, word ptr [bp-52h]
        sub     cx, 7fh
        mov     es, word ptr [bp+10h]
        mov     al, byte ptr es:[di+12h]
        sub     ah, ah
        imul    cx
        add     ax, 319ch
        mov     cx, 64h
        cwd
        idiv    cx
        les     bx, [bp-8]
        mov     cl, byte ptr es:[bx+23h]
        imul    cx
        push    ax
        push    0
        nop
        push    cs
        call    __aFldiv
        mov     word ptr [bp-3eh], ax
        or      ax, ax
        jne     br_38C6A
        jmp     br_39119
br_38C6A:
        cwd
        push    dx
        push    ax
        push    0
        push    word ptr [bp-40h]
        nop
        push    cs
        call    __aFlmul
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        cmp     byte ptr [bp-4bh], 2
        jne     br_38C8A
        mov     al, byte ptr [bp-4ah]
        cbw
        jmp     br_38C93
        nop
br_38C8A:
        mov     es, word ptr [bp+10h]
        mov     al, byte ptr es:[di+0ah]
        sub     ah, ah
br_38C93:
        mov     si, ax
        mov     cx, 80h
        sub     cx, word ptr [bp-52h]
        mov     es, word ptr [bp+10h]
        mov     al, byte ptr es:[di+13h]
        sub     ah, ah
        imul    cx
        mov     cx, 7fh
        cwd
        idiv    cx
        mov     bx, ax
        add     bx, ax
        add     si, si
        mov     ax, word ptr [bx+C0_TBL_004DA]
        add     ax, word ptr [si+C0_TBL_004DA]
        mov     word ptr [bp-18h], ax
        or      ax, ax
        je      br_38CE9
        mov     ax, 57dbh
        mul     word ptr [bp-18h]
        push    dx
        push    ax
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        call    string_scan_status
        add     sp, 8
        mov     word ptr [bp-3ch], ax
        or      ax, ax
        jne     br_38CE1
        mov     word ptr [bp-3ch], 1
br_38CE1:
        mov     ax, word ptr [bp-3ch]
        cmp     word ptr [bp-3eh], ax
        jge     br_38CEF
br_38CE9:
        mov     ax, word ptr [bp-3eh]
        mov     word ptr [bp-3ch], ax
br_38CEF:
        push    0
        push    0bh
        cwd
        push    dx
        push    ax
        mov     ax, word ptr [bp-3eh]
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
        mov     word ptr [bp-18h], ax
        cmp     byte ptr [bp-4bh], 1
        jne     br_38D22
        mov     al, byte ptr [bp-4ah]
        mov     byte ptr [bp-9], al
        mov     byte ptr [bp-47h], 1
        jmp     br_38D32
        nop
br_38D22:
        mov     es, word ptr [bp+10h]
        mov     al, byte ptr es:[di+0bh]
        mov     byte ptr [bp-9], al
        mov     al, byte ptr [bp+1ah]
        mov     byte ptr [bp-47h], al
br_38D32:
        mov     al, byte ptr [bp-9]
        cbw
        mov     bx, ax
        add     bx, ax
        mov     ax, word ptr [bx+C0_TBL_004DA]
        mov     word ptr [bp-16h], ax
        or      ax, ax
        je      br_38D68
        mov     ax, 57dbh
        mul     word ptr [bp-16h]
        push    dx
        push    ax
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        call    string_scan_status
        add     sp, 8
        mov     word ptr [bp-3ah], ax
        or      ax, ax
        jne     br_38D6D
        mov     word ptr [bp-3ah], 1
        jmp     br_38D6D
        nop
br_38D68:
        mov     word ptr [bp-3ah], 7fffh
br_38D6D:
        push    0
        push    0bh
        mov     ax, word ptr [bp-3ah]
        cwd
        push    dx
        push    ax
        mov     ax, word ptr [bp-3eh]
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
        mov     word ptr [bp-16h], ax
        cmp     byte ptr [bp-49h], 0
        jne     br_38DE7
        sub     dx, dx
        cmp     dx, word ptr [bp-1ah]
        jb      br_38DB6
        ja      br_38DA4
        cmp     ax, word ptr [bp-1ch]
        jbe     br_38DB6
br_38DA4:
        mov     word ptr [bp-18h], dx
        mov     ax, word ptr [bp-3eh]
        mov     word ptr [bp-3ch], ax
        mov     ax, word ptr [bp-1ch]
        mov     word ptr [bp-16h], ax
        jmp     br_38DD1
        nop
br_38DB6:
        mov     ax, word ptr [bp-18h]
        add     ax, word ptr [bp-16h]
        cmp     dx, word ptr [bp-1ah]
        jb      br_38DE7
        ja      br_38DC8
        cmp     ax, word ptr [bp-1ch]
        jbe     br_38DE7
br_38DC8:
        mov     ax, word ptr [bp-1ch]
        sub     ax, word ptr [bp-16h]
        mov     word ptr [bp-18h], ax
br_38DD1:
        mov     cx, 57dbh
        mul     cx
        push    dx
        push    ax
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        call    string_scan_status
        add     sp, 8
        mov     word ptr [bp-3ah], ax
br_38DE7:
        neg     word ptr [bp-3ah]
        mov     es, word ptr [bp+10h]
        mov     al, byte ptr [bp-4ch]
        cbw
        mov     cx, ax
        mov     al, byte ptr es:[di+15h]
        sub     ah, ah
        imul    cx
        mov     cx, 7fh
        cwd
        idiv    cx
        mov     si, ax
        mov     al, byte ptr es:[di+0dh]
        sub     ah, ah
        add     si, ax
        cmp     byte ptr [bp-4bh], 3
        jne     br_38E1A
        mov     al, byte ptr [bp-4ah]
        cbw
        sub     ax, 32h
        add     si, ax
br_38E1A:
        or      si, si
        jge     br_38E22
        xor     si, si
        jmp     br_38E2A
br_38E22:
        cmp     si, 64h
        jle     br_38E2A
        mov     si, 64h
br_38E2A:
        mov     al, byte ptr es:[di+11h]
        sub     ah, ah
        add     ax, si
        mov     word ptr [bp-2], ax
        cmp     ax, 64h
        jle     br_38E3F
        mov     word ptr [bp-2], 64h
br_38E3F:
        mov     bx, si
        mov     ax, word ptr [bx+si+C0_TBL_0066E]
        mov     word ptr [bp-28h], 0
        mov     word ptr [bp-26h], ax
        mov     bx, word ptr [bp-2]
        add     bx, bx
        mov     cx, word ptr [bx+C0_TBL_0066E]
        and     cx, 3ff8h
        add     cx, cx
        mov     dl, byte ptr es:[di+0eh]
        sub     dh, dh
        add     cx, dx
        mov     word ptr [bp-24h], cx
        and     ax, 3ff8h
        add     ax, ax
        mov     cl, byte ptr es:[di+0eh]
        sub     ch, ch
        add     ax, cx
        mov     word ptr [bp-20h], ax
        mov     ax, word ptr [bp-2]
        sub     ax, si
        mov     word ptr [bp-0ah], ax
        or      ax, ax
        jne     br_38E8C
        mov     word ptr [bp-14h], ax
        mov     word ptr [bp-22h], ax
        jmp     br_38F33
br_38E8C:
        push    0
        push    2
        mov     ax, 447h
        imul    word ptr [bp-0ah]
        push    dx
        push    ax
        nop
        push    cs
        call    __aFldiv
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     es, word ptr [bp+10h]
        mov     bl, byte ptr es:[di+0fh]
        sub     bh, bh
        add     bx, bx
        mov     ax, word ptr [bx+C0_TBL_004DA]
        mov     word ptr [bp-14h], ax
        or      ax, ax
        jne     br_38EBE
        mov     word ptr [bp-14h], 1
br_38EBE:
        push    0
        push    word ptr [bp-14h]
        push    dx
        push    word ptr [bp-4]
        nop
        push    cs
        call    __aFldiv
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        or      dx, dx
        jl      br_38EE7
        jg      br_38EDD
        cmp     ax, 7fffh
        jbe     br_38EE7
br_38EDD:
        mov     word ptr [bp-0ch], 7fffh
        mov     word ptr [bp-0ah], 0
br_38EE7:
        mov     ax, word ptr [bp-0ch]
        mov     word ptr [bp-22h], ax
        mov     es, word ptr [bp+10h]
        mov     bl, byte ptr es:[di+10h]
        sub     bh, bh
        add     bx, bx
        mov     ax, word ptr [bx+C0_TBL_004DA]
        mov     si, ax
        or      ax, ax
        jne     br_38F05
        mov     si, 1
br_38F05:
        push    0
        push    si
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    __aFldiv
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        or      dx, dx
        jl      br_38F2E
        jg      br_38F24
        cmp     ax, 7fffh
        jbe     br_38F2E
br_38F24:
        mov     word ptr [bp-0ch], 7fffh
        mov     word ptr [bp-0ah], 0
br_38F2E:
        mov     ax, word ptr [bp-0ch]
        neg     ax
br_38F33:
        mov     word ptr [bp-1eh], ax
        les     bx, [bp-10h]
        mov     al, byte ptr es:[bx+183h]
        les     bx, [bp+12h]
        mul     byte ptr es:[bx]
        mov     cx, 7fh
        cwd
        idiv    cx
        mov     si, ax
        mov     dl, byte ptr es:[bx+1]
        mov     byte ptr [bp-2], dl
        mov     bl, dl
        sub     bh, bh
        add     bx, bx
        imul    word ptr [bx+C0_TBL_005A4]
        mov     byte ptr [bp-46h], ah
        mov     bx, 66ch
        mov     al, byte ptr [bp-2]
        sub     ah, ah
        add     ax, ax
        sub     bx, ax
        mov     ax, word ptr [bx]
        imul    si
        mov     byte ptr [bp-45h], ah
        les     bx, [bp+16h]
        sub     ah, ah
        mov     al, byte ptr es:[bx+2]
        imul    ax, ax, 7fh
        mov     dx, 64h
        mov     si, dx
        cwd
        idiv    si
        mov     si, ax
        test    byte ptr es:[bx+3], 80h
        je      br_38FA4
        les     bx, [bp+12h]
        sub     ah, ah
        mov     al, byte ptr es:[bx]
        imul    si
        cwd
        and     dx, cx
        add     ax, dx
        sar     ax, 7
        mov     si, ax
br_38FA4:
        les     bx, [bp-10h]
        sub     ah, ah
        mov     al, byte ptr es:[bx+183h]
        imul    si
        cwd
        idiv    cx
        mov     byte ptr [bp-43h], al
        les     bx, [bp+16h]
        mov     al, byte ptr es:[bx+3]
        and     al, 0fh
        mov     byte ptr [bp-44h], al
        mov     al, byte ptr es:[bx+4]
        sub     ah, ah
        imul    ax, ax, 7fh
        mov     dx, 64h
        mov     si, dx
        cwd
        idiv    si
        mov     si, ax
        test    byte ptr es:[bx+3], 80h
        je      br_38FF0
        les     bx, [bp+12h]
        sub     ah, ah
        mov     al, byte ptr es:[bx]
        imul    si
        cwd
        and     dx, cx
        add     ax, dx
        sar     ax, 7
        mov     si, ax
br_38FF0:
        les     bx, [bp-10h]
        sub     ah, ah
        mov     al, byte ptr es:[bx+183h]
        imul    si
        cwd
        idiv    cx
        mov     byte ptr [bp-41h], al
        les     bx, [bp+16h]
        mov     al, byte ptr es:[bx+5]
        mov     byte ptr [bp-42h], al
        les     bx, [bp-8]
        mov     ax, word ptr es:[bx+0ah]
        mov     dx, word ptr es:[bx+0ch]
        add     word ptr [bp-38h], ax
        adc     word ptr [bp-36h], dx
        mov     ax, word ptr es:[bx+0ah]
        mov     dx, word ptr es:[bx+0ch]
        add     word ptr [bp-34h], ax
        adc     word ptr [bp-32h], dx
        mov     ax, word ptr es:[bx+0ah]
        mov     dx, word ptr es:[bx+0ch]
        add     word ptr [bp-30h], ax
        adc     word ptr [bp-2eh], dx
        cmp     byte ptr es:[bx+25h], ch
        jne     br_39042
        jmp     br_390F2
br_39042:
        mov     al, byte ptr [bp-44h]
        mov     byte ptr [bp-1], al
        or      al, al
        jle     br_3905E
        cmp     al, 9
        jge     br_3905E
        dec     al
        and     al, 0feh
        inc     al
        mov     byte ptr [bp-44h], al
        inc     al
        mov     byte ptr [bp-1], al
br_3905E:
        mov     al, byte ptr [bp-46h]
        mov     byte ptr [bp-2], al
        mov     byte ptr [bp-46h], 0
        mov     byte ptr [bp-50h], 0ffh
        ifdef   MUTE_GROUPS
        if      FW_VERSION >= 112
        include "../feat/mute_args.inc"
        else
        include "../common/feat/mute_args.inc"
        endif
        else
        mov     al, byte ptr [bp-11h]
        push    ax
        mov     es, word ptr [bp+10h]
        mov     al, byte ptr es:[di+7]
        push    ax
        mov     al, byte ptr es:[di+6]
        push    ax
        lea     ax, [bp-50h]
        push    ss
        push    ax
        endif
        nop
        push    cs
        call    voice_start
        add     sp, 0ah
        mov     al, byte ptr [bp-1]
        mov     byte ptr [bp-44h], al
        mov     al, byte ptr [bp-2]
        mov     byte ptr [bp-46h], al
        mov     byte ptr [bp-45h], 0
        push    0
        push    2
        les     bx, [bp-8]
        push    word ptr es:[bx+10h]
        push    word ptr es:[bx+0eh]
        nop
        push    cs
        call    __aFldiv
        add     word ptr [bp-38h], ax
        adc     word ptr [bp-36h], dx
        push    0
        push    2
        les     bx, [bp-8]
        push    word ptr es:[bx+10h]
        push    word ptr es:[bx+0eh]
        nop
        push    cs
        call    __aFldiv
        add     word ptr [bp-34h], ax
        adc     word ptr [bp-32h], dx
        push    0
        push    2
        les     bx, [bp-8]
        push    word ptr es:[bx+10h]
        push    word ptr es:[bx+0eh]
        nop
        push    cs
        call    __aFldiv
        add     word ptr [bp-30h], ax
        adc     word ptr [bp-2eh], dx
        cmp     byte ptr [bp-48h], 1
        jne     br_390F2
        mov     byte ptr [bp-48h], 0
br_390F2:
        mov     byte ptr [bp-50h], 0ffh
        ifdef   MUTE_GROUPS
        if      FW_VERSION >= 112
        include "../feat/mute_args.inc"
        else
        include "../common/feat/mute_args.inc"
        endif
        else
        mov     al, byte ptr [bp-11h]
        push    ax
        mov     es, word ptr [bp+10h]
        mov     al, byte ptr es:[di+7]
        push    ax
        mov     al, byte ptr es:[di+6]
        push    ax
        lea     ax, [bp-50h]
        push    ss
        push    ax
        endif
        nop
        push    cs
        call    voice_start
        add     sp, 0ah
        callf   EP_DMA_STATUS_REARM_SEG:EP_DMA_STATUS_REARM_OFF
br_39119:
        pop     si
        pop     di
        leave
        ret
        db      00h
fn_3911E:
        enter   2, 0
        push    di
        push    si
        cmp     byte ptr [bp+8], 23h
        jl      br_39136
        cmp     byte ptr [bp+8], 62h
        jg      br_39136
        mov     dx, 1
        jmp     br_39138
        nop
br_39136:
        xor     dx, dx
br_39138:
        or      dx, dx
        je      br_391AC
        mov     word ptr [bp-2], 0
        mov     si, 9608h
        mov     di, 8f04h
loop_39147:
        cmp     word ptr [di], 0
        je      br_3919D
        mov     al, byte ptr [bp+4]
        cbw
        mov     cl, byte ptr [si]
        sub     ch, ch
        cmp     ax, cx
        jne     br_3919D
        mov     al, byte ptr [bp+6]
        cbw
        mov     cl, byte ptr [si+1]
        cmp     ax, cx
        jne     br_3919D
        mov     al, byte ptr [bp+8]
        cbw
        mov     cl, byte ptr [si+2]
        cmp     ax, cx
        jne     br_3919D
        cmp     byte ptr [si+3], 2
        jne     br_3919D
        cmp     byte ptr [si+5], ch
        je      br_39192
        cmp     byte ptr [si+4], ch
        jne     br_39192
        cmp     word ptr [di-40h], -1
        jne     br_3919D
        mov     ax, word ptr [si+0ah]
        mov     word ptr [di], ax
        mov     word ptr [di-40h], 1
        jmp     br_3919D
        nop
        nop
br_39192:
        push    word ptr [bp-2]
        callf   EP_VOICE_RELEASE_SEG:EP_VOICE_RELEASE_OFF
        add     sp, 2
br_3919D:
        add     si, 14h
        add     di, 2
        inc     word ptr [bp-2]
        cmp     word ptr [bp-2], 20h
        jb      loop_39147
br_391AC:
        pop     si
        pop     di
        leave
        ret
string_scan_status:
        enter   4, 0
        push    0
        push    2
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        nop
        push    cs
        call    __aFldiv
        add     ax, word ptr [bp+4]
        adc     dx, word ptr [bp+6]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        cmp     dx, word ptr [bp+6]
        jg      br_391E5
        jl      br_391DB
        cmp     ax, word ptr [bp+4]
        jae     br_391E5
br_391DB:
        mov     word ptr [bp-4], 0ffffh
        mov     word ptr [bp-2], 7fffh
br_391E5:
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    __aFldiv
        leave
        ret
L_391F8:
        enter   0ch, 0
        push    di
        push    si
        mov     ax, 1100h
        mov     dx, 7c00h
        mov     di, ax
        mov     word ptr [bp-2], dx
        xor     ax, ax
        mov     bx, ax
        mov     word ptr [bp-6], dx
        mov     cx, 100h
loop_39213:
        mov     es, word ptr [bp-6]
        mov     byte ptr es:[bx], 0
        mov     es, word ptr [bp-2]
        mov     si, di
        add     di, 4
        mov     word ptr es:[si+2], ax
        mov     word ptr es:[si], ax
        add     bx, 11h
        dec     cx
        jne     loop_39213
        xor     di, di
        mov     cx, 18h
loop_39234:
        xor     bx, bx
        mov     word ptr [bp-4], cx
        mov     word ptr [bp-2], di
loop_3923C:
        mov     si, bx
        add     si, di
        add     si, si
        mov     ax, 1500h
        mov     dx, 7c00h
        add     si, ax
        mov     es, dx
        mov     word ptr es:[si], 0ffffh
        inc     bx
        cmp     bx, 40h
        jl      loop_3923C
        add     di, 40h
        dec     cx
        jne     loop_39234
        cmp     word ptr [bp+6], 0
        je      br_392A2
        callf   EP_PGM_DELETE_ALL_SEG:EP_PGM_DELETE_ALL_OFF
        xor     di, di
        mov     ax, C1_TBL_SOUNDS_END
        mov     cx, ds
        cmp     ax, word ptr [C0_W_098DC]
        jne     L_38C7B
        cmp     cx, word ptr [C0_W_098DE]
        je      br_392A9
L_38C7B:
        mov     word ptr [bp-2], di
loop_3927E:
        push    word ptr [C0_W_098DE]
        push    word ptr [C0_W_098DC]
        callf   EP_SOUND_LIST_UNLINK_SEG:EP_SOUND_LIST_UNLINK_OFF
        add     sp, 4
        mov     ax, C1_TBL_SOUNDS_END
        mov     cx, ds
        cmp     ax, word ptr [C0_W_098DC]
        jne     loop_3927E
        cmp     cx, word ptr [C0_W_098DE]
        jne     loop_3927E
        jmp     br_392A9
        nop
br_392A2:
        callf   EP_PGM_ALLOC_SLOT_SEG:EP_PGM_ALLOC_SLOT_OFF
        mov     di, ax
br_392A9:
        or      di, di
        jge     br_392BA
        mov     ax, (C1_BASE+L_40370-C1_SEG*16)
        mov     cx, C1_SEG
        mov     si, ax
        mov     word ptr [bp-4], cx
        jmp     br_392CF
br_392BA:
        push    ds
        push    C0_W_098C2
        push    7c00h
        push    0
        push    di
        call    fn_39342
        add     sp, 0ah
        mov     si, ax
        mov     word ptr [bp-4], dx
br_392CF:
        mov     ax, word ptr [bp-4]
        or      ax, si
        je      br_392F0
        push    di
        callf   EP_PGM_DELETE_SLOT_SEG:EP_PGM_DELETE_SLOT_OFF
        add     sp, 2
        push    word ptr [bp-4]
        push    si
        nop
        push    cs
        call    disp_alert_wait_key
        add     sp, 4
        callf   EP_FAR_3E99C_SEG:EP_FAR_3E99C_OFF
br_392F0:
        cmp     word ptr [bp+6], 0
        jne     br_3931A
        callf   EP_FAR_3E8D0_SEG:EP_FAR_3E8D0_OFF
        mov     si, ax
        or      si, ax
        jl      br_39309
        cmp     si, 3
        jg      br_39309
        mov     byte ptr [C2_B_PAD_DRUM], al
br_39309:
        push    di
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        push    ax
        callf   EP_DRUM_PROGRAM_SELECT_SEG:EP_DRUM_PROGRAM_SELECT_OFF
        add     sp, 4
        jmp     br_3932F
br_3931A:
        xor     si, si
        mov     word ptr [bp-2], di
loop_3931F:
        push    di
        push    si
        callf   EP_DRUM_PROGRAM_SELECT_SEG:EP_DRUM_PROGRAM_SELECT_OFF
        add     sp, 4
        inc     si
        cmp     si, 3
        jle     loop_3931F
br_3932F:
        push    7c00h
        push    0
        push    di
        callf   EP_FN_4323E_SEG:EP_FN_4323E_OFF
        add     sp, 6
        pop     si
        pop     di
        leave
        retf
        db      00h
fn_39342:
        enter   18h, 0
        push    di
        push    si
        mov     di, word ptr [bp+0ah]
        push    0
        mov     ax, word ptr [bp+0ch]
        push    ax
        push    di
        mov     si, ax
        callf   EP_DISK_PROGRESS_MSG_SEG:EP_DISK_PROGRESS_MSG_OFF
        add     sp, 6
        push    0
        push    0
        lea     ax, [bp-18h]
        push    ss
        push    ax
        push    si
        push    di
        callf   EP_FILENAME_SPLIT_SEG:EP_FILENAME_SPLIT_OFF
        add     sp, 0ch
        push    0
        push    si
        push    di
        callf   EP_FS_OPEN_SEG:EP_FS_OPEN_OFF
        add     sp, 6
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_39387
        jmp     br_39431
br_39387:
        push    1
        push    2
        lea     ax, [bp-6]
        push    ss
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_393A4
        jmp     br_39425
br_393A4:
        cmp     byte ptr [bp-6], 7
        jne     br_3941C
        mov     al, byte ptr [bp-5]
        sub     ah, ah
        or      ax, ax
        je      br_393C8
        dec     ax
        je      br_393D6
        sub     ax, 3
        je      br_393E6
        mov     ax, (C1_BASE+L_43A80-C1_SEG*16)
        mov     cx, C1_SEG
        mov     si, ax
        mov     word ptr [bp-2], cx
        jmp     br_393FA
br_393C8:
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        call    fn_39440
        jmp     br_393F2
br_393D6:
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        callf   EP_L_43644_SEG:EP_L_43644_OFF
        jmp     br_393F2
br_393E6:
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        call    fn_395B6
br_393F2:
        add     sp, 6
        mov     si, ax
        mov     word ptr [bp-2], dx
br_393FA:
        lea     ax, [bp-18h]
        push    ss
        push    ax
        imul    ax, word ptr [bp+4], 99eh
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        add     ax, 2
        push    dx
        push    ax
        callf   EP_NAME_TO_FILENAME_SEG:EP_NAME_TO_FILENAME_OFF
        add     sp, 8
        jmp     SHORT br_39425
        nop
br_3941C:
        if      FW_VERSION >= 112
        mov     si, (C1_BASE+L_43A98-C1_SEG*16)
        else
        mov     ax, STR_WRONG_FILE_FORMAT
        endif
        mov     cx, C1_SEG
        if      FW_VERSION < 112
        mov     si, ax
        endif
        mov     word ptr [bp-2], cx
br_39425:
        if      FW_VERSION >= 112
        mov     ax, word ptr [bp-2]
        or      ax, si
        jne     br_39431
        endif
        nop
        push    cs
        call    disk_file_close
br_39431:
        callf   EP_FIELD_HANDLER_NOP_SEG:EP_FIELD_HANDLER_NOP_OFF
        mov     ax, si
        mov     dx, word ptr [bp-2]
        pop     si
        pop     di
        leave
        ret
        if      FW_VERSION >= 112
        db      00h
        endif
fn_39440:
        enter   14h, 0
        push    di
        push    si
        mov     si, word ptr [bp+4]
        imul    ax, si, 99eh
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        mov     word ptr [bp-14h], ax
        mov     word ptr [bp-12h], dx
        push    80h
        push    11h
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_3947B
        jmp     br_3955E
br_3947B:
        push    1
        push    0
        push    200h
        callf   EP_FS_SEEK_SEG:EP_FS_SEEK_OFF
        add     sp, 6
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_39497
        jmp     br_3955E
br_39497:
        push    1
        push    1ah
        mov     ax, word ptr [bp-14h]
        mov     dx, word ptr [bp-12h]
        add     ax, 2
        push    dx
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_394BB
        jmp     br_3955E
br_394BB:
        push    1
        push    0
        push    24h
        callf   EP_FS_SEEK_SEG:EP_FS_SEEK_OFF
        add     sp, 6
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_394D6
        jmp     br_3955E
br_394D6:
        xor     cx, cx
        mov     ax, word ptr [bp+6]
        mov     dx, word ptr [bp+8]
        mov     bx, si
        shl     bx, 7
        add     ax, bx
        add     ah, 15h
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        mov     ax, word ptr [bp-14h]
        mov     dx, word ptr [bp-12h]
        add     ax, 1eh
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     word ptr [bp-4], cx
        mov     si, cx
        mov     di, ax
loop_39504:
        push    1
        push    1
        lea     ax, [bp-1]
        push    ss
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        jne     br_3955E
        push    1
        push    18h
        push    1
        push    17h
        push    word ptr [bp-6]
        push    di
        callf   EP_FS_READ_RESIZED_SEG:EP_FS_READ_RESIZED_OFF
        add     sp, 0ch
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        jne     br_3955E
        cmp     byte ptr [bp-1], 0
        jge     br_39547
        mov     byte ptr [bp-1], 0ffh
br_39547:
        mov     al, byte ptr [bp-1]
        cbw
        les     bx, [bp-0ch]
        add     word ptr [bp-0ch], 2
        mov     word ptr es:[bx], ax
        add     di, 18h
        inc     si
        cmp     si, 40h
        jl      loop_39504
br_3955E:
        mov     ax, word ptr [bp-0eh]
        or      ax, word ptr [bp-10h]
        je      br_3956C
        mov     si, word ptr [bp-10h]
        jmp     br_395AC
        nop
br_3956C:
        push    40h
        push    6
        push    40h
        push    4
        mov     ax, word ptr [bp-14h]
        mov     dx, word ptr [bp-12h]
        add     ax, 61eh
        push    dx
        push    ax
        callf   EP_FS_READ_RESIZED_SEG:EP_FS_READ_RESIZED_OFF
        add     sp, 0ch
        mov     si, ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        jne     br_395AC
        push    40h
        push    1
        mov     ax, word ptr [bp-14h]
        mov     dx, word ptr [bp-12h]
        add     ax, 79eh
        push    dx
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0eh], dx
br_395AC:
        mov     ax, si
        mov     dx, word ptr [bp-0eh]
        pop     si
        pop     di
        leave
        ret
        db      00h
fn_395B6:
        push    bp
        mov     bp, sp
        push    0
        push    1
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        callf   EP_PGM_FILE_READ_SEG:EP_PGM_FILE_READ_OFF
        leave
        ret
        db      00h
L_395CE:
        push    0
        call    fn_395E2
        add     sp, 2
        retf
        db      00h
L_395D8:
        push    1
        call    fn_395E2
        add     sp, 2
        retf
        db      00h
fn_395E2:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp+4]
        mov     byte ptr [C0_B_08B02], al
        push    ds
        push    C0_W_007CA
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF                    ; = 0x3E8B4 handler_set_install
        mov     sp, bp
        callf   [C0_FP_0087C]
        leave
        ret
L_395FC:
        enter   0ch, 0
        push    di
        push    si
        mov     ax, 1100h
        mov     dx, 7c00h
        mov     di, ax
        mov     word ptr [bp-2], dx
        xor     ax, ax
        mov     bx, ax
        mov     word ptr [bp-6], dx
        mov     cx, 100h
loop_39617:
        mov     es, word ptr [bp-6]
        mov     byte ptr es:[bx], 0
        mov     es, word ptr [bp-2]
        mov     si, di
        add     di, 4
        mov     word ptr es:[si+2], ax
        mov     word ptr es:[si], ax
        add     bx, 11h
        dec     cx
        jne     loop_39617
        xor     di, di
        mov     cx, 18h
loop_39638:
        xor     bx, bx
        mov     word ptr [bp-2], di
loop_3963D:
        mov     si, bx
        add     si, di
        add     si, si
        mov     ax, 1500h
        mov     dx, 7c00h
        add     si, ax
        mov     es, dx
        mov     word ptr es:[si], 0ffffh
        inc     bx
        cmp     bx, 40h
        jl      loop_3963D
        add     di, 40h
        dec     cx
        jne     loop_39638
        xor     si, si
loop_39660:
        push    si
        callf   EP_PGM_DELETE_SLOT_SEG:EP_PGM_DELETE_SLOT_OFF
        add     sp, 2
        inc     si
        cmp     si, 17h
        jle     loop_39660
        xor     si, si
loop_39671:
        push    0
        push    si
        callf   EP_DRUM_PROGRAM_SELECT_SEG:EP_DRUM_PROGRAM_SELECT_OFF
        add     sp, 4
        inc     si
        cmp     si, 3
        jle     loop_39671
loop_39682:
        mov     ax, C1_TBL_SOUNDS_END
        mov     cx, ds
        cmp     ax, word ptr [C0_W_098DC]
        jne     br_39693
        cmp     cx, word ptr [C0_W_098DE]
        je      br_396A6
br_39693:
        push    word ptr [C0_W_098DE]
        push    word ptr [C0_W_098DC]
        callf   EP_SOUND_LIST_UNLINK_SEG:EP_SOUND_LIST_UNLINK_OFF
        add     sp, 4
        jmp     loop_39682
        nop
br_396A6:
        push    ds
        push    C0_W_098C2
        push    7c00h
        push    0
        call    fn_396E0
        add     sp, 8
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_396CD
        push    word ptr [bp-2]
        push    ax
        nop
        push    cs
        call    disp_alert_wait_key
        add     sp, 4
        callf   EP_FAR_3E99C_SEG:EP_FAR_3E99C_OFF
br_396CD:
        push    7c00h
        push    0
        push    -1
        callf   EP_FN_4323E_SEG:EP_FN_4323E_OFF
        add     sp, 6
        pop     si
        pop     di
        leave
        retf
fn_396E0:
        enter   18h, 0
        push    di
        push    si
        mov     di, word ptr [bp+8]
        push    0
        mov     ax, word ptr [bp+0ah]
        push    ax
        push    di
        mov     si, ax
        callf   EP_DISK_PROGRESS_MSG_SEG:EP_DISK_PROGRESS_MSG_OFF
        add     sp, 6
        push    0
        push    0
        lea     ax, [bp-18h]
        push    ss
        push    ax
        push    si
        push    di
        callf   EP_FILENAME_SPLIT_SEG:EP_FILENAME_SPLIT_OFF
        add     sp, 0ch
        push    0
        push    si
        push    di
        callf   EP_FS_OPEN_SEG:EP_FS_OPEN_OFF
        add     sp, 6
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_39725
        jmp     br_397C5
br_39725:
        push    1
        push    2
        lea     ax, [bp-6]
        push    ss
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     br_397B9
        cmp     byte ptr [bp-6], 0ah
        jne     br_397B0
        mov     al, byte ptr [bp-5]
        sub     ah, ah
        or      ax, ax
        je      br_39768
        dec     ax
        je      br_39774
        sub     ax, 3
        je      br_39780
        dec     ax
        je      br_3978C
        mov     ax, STR_DISK_NEEDS_NEWER_OS
        mov     cx, C1_SEG
        mov     si, ax
        mov     word ptr [bp-2], cx
        jmp     br_3979D
        nop
        nop
br_39768:
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        call    fn_397D4
        jmp     br_39795
        nop
br_39774:
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        call    fn_39A1C
        jmp     br_39795
        nop
br_39780:
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        call    fn_39D12
        jmp     br_39795
        nop
br_3978C:
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        call    fn_39FB0
br_39795:
        add     sp, 4
        mov     si, ax
        mov     word ptr [bp-2], dx
br_3979D:
        lea     ax, [bp-18h]
        push    ss
        push    ax
        push    ds
        push    C1_TBL_APS_NAME
        callf   EP_NAME_TO_FILENAME_SEG:EP_NAME_TO_FILENAME_OFF
        add     sp, 8
        jmp     SHORT br_397B9
br_397B0:
        if      FW_VERSION >= 112
        mov     si, (C1_BASE+L_43A98-C1_SEG*16)
        else
        mov     ax, STR_WRONG_FILE_FORMAT
        endif
        mov     cx, C1_SEG
        if      FW_VERSION < 112
        mov     si, ax
        endif
        mov     word ptr [bp-2], cx
br_397B9:
        if      FW_VERSION >= 112
        mov     ax, word ptr [bp-2]
        or      ax, si
        jne     br_397C5
        endif
        nop
        push    cs
        call    disk_file_close
br_397C5:
        callf   EP_FIELD_HANDLER_NOP_SEG:EP_FIELD_HANDLER_NOP_OFF
        mov     ax, si
        mov     dx, word ptr [bp-2]
        pop     si
        pop     di
        leave
        ret
        if      FW_VERSION >= 112
        db      00h
        endif
fn_397D4:
        enter   1eh, 0
        push    di
        push    si
        mov     word ptr [bp-4], 0
        mov     word ptr [bp-2], 7f00h
        xor     si, si
        mov     word ptr [bp-1eh], si
loop_397E9:
        push    si
        callf   EP_PGM_INIT_DEFAULT_SEG:EP_PGM_INIT_DEFAULT_OFF
        add     sp, 2
        inc     si
        cmp     si, 18h
        jl      loop_397E9
        push    1
        push    141h
        push    7f00h
        push    0
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        je      br_39817
        jmp     br_399FC
br_39817:
        mov     bx, 7f00h
        mov     es, bx
        sub     ah, ah
        db      26h, 8ah, 06h, 16h, 00h  ; mov al, byte ptr es:[16h]
        mov     word ptr [bp-1eh], ax
        cmp     byte ptr es:[17h], 2
        jne     br_39832
        xor     al, al
        jmp     br_39834
br_39832:
        mov     al, 1
br_39834:
        mov     byte ptr [C0_B_0D7B8], al
        cmp     byte ptr es:[18h], 2
        jne     br_39844
        xor     al, al
        jmp     br_39846
        nop
br_39844:
        mov     al, 1
br_39846:
        mov     byte ptr [C0_B_0D7B9], al
        db      26h, 8ah, 06h, 1ah, 00h  ; mov al, byte ptr es:[1ah]
        mov     byte ptr [C2_B_RECORD_MIX_CHANGES], al
        mov     word ptr [bp-0eh], 0
        mov     bx, 8fe0h
        mov     word ptr [bp-8], 3
loop_3985E:
        xor     cx, cx
        mov     ax, 41h
        mov     dx, 7f00h
        mov     di, ax
        mov     es, dx
        mov     word ptr [bp-2], bx
        mov     word ptr [bp-6], bx
        jmp     br_39885
loop_39872:
        mov     ax, word ptr es:[di]
        mov     dx, word ptr es:[di+2]
        mov     word ptr [bx], ax
        mov     word ptr [bx+2], dx
        add     di, 4
        add     bx, 6
        inc     cx
br_39885:
        cmp     cx, 40h
        jl      loop_39872
        mov     bx, word ptr [bp-6]
        add     bx, 184h
        dec     word ptr [bp-8]
        jne     loop_3985E
        mov     ax, word ptr [bp+4]
        mov     dx, word ptr [bp+6]
        add     ah, 15h
        mov     word ptr [bp-14h], ax
        mov     word ptr [bp-12h], dx
        xor     ax, ax
        mov     word ptr [bp-0eh], ax
        mov     word ptr [bp-10h], ax
loop_398AD:
        push    1
        push    1ah
        mov     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        add     ax, word ptr [bp-10h]
        mov     word ptr [bp-18h], ax
        mov     word ptr [bp-16h], dx
        add     ax, 2
        push    dx
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        je      br_398DB
        jmp     br_3996E
br_398DB:
        push    1
        push    0
        push    24h
        callf   EP_FS_SEEK_SEG:EP_FS_SEEK_OFF
        add     sp, 6
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        jne     br_3996E
        xor     cx, cx
        mov     ax, word ptr [bp-14h]
        mov     dx, word ptr [bp-12h]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     ax, word ptr [bp-18h]
        mov     dx, word ptr [bp-16h]
        add     ax, 1eh
        mov     di, ax
        mov     word ptr [bp-1ah], dx
        mov     word ptr [bp-4], cx
        mov     si, cx
loop_39914:
        push    1
        push    1
        lea     ax, [bp-1]
        push    ss
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        jne     br_3996E
        push    1
        push    18h
        push    1
        push    17h
        push    word ptr [bp-1ah]
        push    di
        callf   EP_FS_READ_RESIZED_SEG:EP_FS_READ_RESIZED_OFF
        add     sp, 0ch
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        jne     br_3996E
        cmp     byte ptr [bp-1], 0
        jge     br_39957
        mov     byte ptr [bp-1], 0ffh
br_39957:
        mov     al, byte ptr [bp-1]
        cbw
        les     bx, [bp-8]
        add     word ptr [bp-8], 2
        mov     word ptr es:[bx], ax
        add     di, 18h
        inc     si
        cmp     si, 40h
        jl      loop_39914
br_3996E:
        mov     ax, word ptr [bp-0ah]
        or      ax, word ptr [bp-0ch]
        je      br_3997C
        mov     si, word ptr [bp-0ch]
        jmp     br_399BC
        nop
br_3997C:
        push    40h
        push    6
        push    40h
        push    4
        mov     ax, word ptr [bp-18h]
        mov     dx, word ptr [bp-16h]
        add     ax, 61eh
        push    dx
        push    ax
        callf   EP_FS_READ_RESIZED_SEG:EP_FS_READ_RESIZED_OFF
        add     sp, 0ch
        mov     si, ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        jne     br_399BC
        push    40h
        push    1
        mov     ax, word ptr [bp-18h]
        mov     dx, word ptr [bp-16h]
        add     ax, 79eh
        push    dx
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0ah], dx
br_399BC:
        mov     ax, word ptr [bp-0ah]
        or      ax, si
        jne     br_399D9
        add     word ptr [bp-14h], 80h
        add     word ptr [bp-10h], 99eh
        inc     word ptr [bp-0eh]
        cmp     word ptr [bp-0eh], 18h
        jge     br_399D9
        jmp     loop_398AD
br_399D9:
        mov     word ptr [bp-0ch], si
        mov     ax, word ptr [bp-0ah]
        or      ax, si
        jne     br_399FC
        push    80h
        push    11h
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
br_399FC:
        xor     si, si
        mov     di, word ptr [bp-1eh]
loop_39A01:
        push    di
        push    si
        callf   EP_DRUM_PROGRAM_SELECT_SEG:EP_DRUM_PROGRAM_SELECT_OFF
        add     sp, 4
        inc     si
        cmp     si, 3
        jle     loop_39A01
        mov     ax, word ptr [bp-0ch]
        mov     dx, word ptr [bp-0ah]
        pop     si
        pop     di
        leave
        ret
        db      00h
fn_39A1C:
        enter   1ah, 0
        push    di
        push    si
        xor     ax, ax
        mov     word ptr [bp-18h], ax
        mov     word ptr [bp-1ah], ax
        push    1
        push    190h
        mov     dx, 7f00h
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    dx
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     word ptr [bp-14h], ax
        mov     word ptr [bp-12h], dx
        or      dx, ax
        je      br_39A52
        mov     si, ax
        jmp     br_39CBD
        nop
br_39A52:
        mov     bx, 7f00h
        mov     es, bx
        db      26h, 8ah, 06h, 16h, 00h  ; mov al, byte ptr es:[16h]
        cbw
        mov     word ptr [bp-18h], ax
        db      26h, 8ah, 06h, 17h, 00h  ; mov al, byte ptr es:[17h]
        mov     byte ptr [C0_B_0D7B8], al
        db      26h, 8ah, 06h, 18h, 00h  ; mov al, byte ptr es:[18h]
        mov     byte ptr [C0_B_0D7B9], al
        db      26h, 8ah, 06h, 1ah, 00h  ; mov al, byte ptr es:[1ah]
        mov     byte ptr [C2_B_RECORD_MIX_CHANGES], al
        db      26h, 8ah, 06h, 5dh, 01h  ; mov al, byte ptr es:[15dh]
        cbw
        push    ax
        callf   EP_PAD_ASSIGN_MASTER_SET_SEG:EP_PAD_ASSIGN_MASTER_SET_OFF
        add     sp, 2
        mov     ax, 11dh
        mov     dx, 7f00h
        push    ds
        mov     di, 0d778h
        mov     si, ax
        push    ds
        pop     es
        mov     ds, dx
        mov     cx, 20h
        rep movsw
        pop     ds
        mov     es, dx
        db      26h, 8ah, 06h, 6eh, 01h  ; mov al, byte ptr es:[16eh]
        mov     byte ptr [C0_B_0D776], al
        mov     word ptr [bp-0ch], 0
        mov     cx, 8fe0h
        jmp     br_39B33
loop_39AB2:
        mov     word ptr [bp-10h], cx
        mov     word ptr [bp-0eh], ds
        mov     ax, 1dh
        mov     dx, 7f00h
        mov     word ptr [bp-6], dx
        mov     word ptr [bp-4], cx
        mov     word ptr [bp-2], ds
        mov     word ptr [bp-0ah], 40h
        mov     word ptr [bp-16h], cx
        mov     bx, cx
        mov     word ptr [bp-8], ax
        mov     di, ax
        mov     cx, word ptr [bp-0ah]
loop_39AD9:
        mov     es, word ptr [bp-6]
        mov     ax, word ptr es:[di]
        mov     dx, word ptr es:[di+2]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[bx], ax
        mov     word ptr es:[bx+2], dx
        add     di, 4
        add     bx, 6
        dec     cx
        jne     loop_39AD9
        mov     si, word ptr [bp-10h]
        mov     bx, 7f00h
        mov     es, bx
        db      26h, 8ah, 06h, 5eh, 01h  ; mov al, byte ptr es:[15eh]
        mov     es, word ptr [bp-0eh]
        mov     byte ptr es:[si+183h], al
        mov     ax, es
        mov     es, bx
        mov     cl, byte ptr es:[16ch]
        mov     es, ax
        mov     byte ptr es:[si+182h], cl
        mov     es, bx
        mov     cl, byte ptr es:[16dh]
        mov     es, ax
        mov     byte ptr es:[si+181h], cl
        mov     cx, word ptr [bp-16h]
        add     cx, 184h
        inc     word ptr [bp-0ch]
br_39B33:
        cmp     word ptr [bp-0ch], 3
        jge     br_39B3C
        jmp     loop_39AB2
br_39B3C:
        mov     word ptr [bp-0ch], 0
        mov     bx, 7f00h
        mov     es, bx
        xor     bx, bx
        cmp     byte ptr es:[0], bl
        jg      loop_39B56
loop_39B4F:
        mov     si, word ptr [bp-14h]
        jmp     br_39C9E
        nop
loop_39B56:
        push    1
        push    1
        lea     ax, [bp-2]
        push    ss
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-12h], dx
        or      dx, ax
        je      br_39B73
        jmp     br_39C86
br_39B73:
        mov     al, byte ptr [bp-2]
        cbw
        imul    cx, ax, 99eh
        add     cx, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        mov     di, cx
        mov     word ptr [bp-8], dx
        push    ax
        callf   EP_PGM_INIT_DEFAULT_SEG:EP_PGM_INIT_DEFAULT_OFF
        add     sp, 2
        cmp     byte ptr [bp-2], 0
        jne     br_39B9A
        inc     word ptr [bp-1ah]
br_39B9A:
        push    1
        push    1bh
        mov     ax, di
        mov     dx, word ptr [bp-8]
        add     ax, 2
        push    dx
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-12h], dx
        or      dx, ax
        je      br_39BBC
        jmp     br_39C9E
br_39BBC:
        xor     si, si
        lea     cx, [di+1eh]
        mov     dx, word ptr [bp-8]
        mov     word ptr [bp-4], dx
        mov     word ptr [bp-0ah], di
        mov     word ptr [bp-6], cx
        mov     di, cx
loop_39BCF:
        push    1
        push    1
        lea     ax, [bp-1]
        push    ss
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     word ptr [bp-14h], ax
        mov     word ptr [bp-12h], dx
        or      dx, ax
        jne     br_39C37
        push    1
        push    18h
        push    1
        push    18h
        push    word ptr [bp-4]
        push    di
        callf   EP_FS_READ_RESIZED_SEG:EP_FS_READ_RESIZED_OFF
        add     sp, 0ch
        mov     word ptr [bp-14h], ax
        mov     word ptr [bp-12h], dx
        or      dx, ax
        jne     br_39C37
        cmp     byte ptr [bp-1], 0
        jge     br_39C12
        mov     byte ptr [bp-1], 0ffh
br_39C12:
        mov     al, byte ptr [bp-2]
        cbw
        mov     bx, ax
        shl     bx, 6
        add     bx, si
        add     bx, bx
        mov     es, word ptr [bp+6]
        add     bx, word ptr [bp+4]
        mov     al, byte ptr [bp-1]
        cbw
        mov     word ptr es:[bx+1500h], ax
        add     di, 18h
        inc     si
        cmp     si, 40h
        jl      loop_39BCF
br_39C37:
        mov     ax, word ptr [bp-12h]
        or      ax, word ptr [bp-14h]
        je      br_39C42
        jmp     loop_39B4F
br_39C42:
        push    40h
        push    6
        push    40h
        push    4
        mov     ax, word ptr [bp-0ah]
        mov     dx, word ptr [bp-8]
        add     ax, 61eh
        push    dx
        push    ax
        callf   EP_FS_READ_RESIZED_SEG:EP_FS_READ_RESIZED_OFF
        add     sp, 0ch
        mov     si, ax
        mov     word ptr [bp-12h], dx
        or      dx, ax
        jne     br_39C9E
        push    40h
        push    1
        mov     ax, word ptr [bp-0ah]
        mov     dx, word ptr [bp-8]
        add     ax, 79eh
        push    dx
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-12h], dx
        or      dx, ax
        jne     br_39C9E
br_39C86:
        mov     bx, 7f00h
        mov     es, bx
        xor     bx, bx
        db      26h, 8ah, 06h, 00h, 00h  ; mov al, byte ptr es:[0]
        cbw
        inc     word ptr [bp-0ch]
        cmp     word ptr [bp-0ch], ax
        jge     br_39C9E
        jmp     loop_39B56
br_39C9E:
        mov     ax, word ptr [bp-12h]
        or      ax, si
        jne     br_39CBD
        push    80h
        push    11h
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-12h], dx
br_39CBD:
        mov     ax, word ptr [bp-12h]
        or      ax, si
        jne     br_39CE6
        mov     word ptr [bp-14h], si
        mov     bx, 7f00h
        mov     es, bx
        xor     bx, bx
        cmp     byte ptr es:[0], bl
        je      br_39CEE
        cmp     word ptr [bp-1ah], bx
        jne     br_39CEE
        push    bx
        callf   EP_PGM_DELETE_SLOT_SEG:EP_PGM_DELETE_SLOT_OFF
        add     sp, 2
        jmp     br_39CEE
        nop
br_39CE6:
        mov     word ptr [bp-14h], si
        mov     word ptr [bp-18h], 0
br_39CEE:
        xor     cx, cx
        mov     word ptr [bp-0ch], cx
        mov     si, cx
        mov     di, word ptr [bp-18h]
loop_39CF8:
        push    di
        push    si
        callf   EP_DRUM_PROGRAM_SELECT_SEG:EP_DRUM_PROGRAM_SELECT_OFF
        add     sp, 4
        inc     si
        cmp     si, 3
        jle     loop_39CF8
        mov     ax, word ptr [bp-14h]
        mov     dx, word ptr [bp-12h]
        pop     si
        pop     di
        leave
        ret
fn_39D12:
        enter   1ah, 0
        push    di
        push    si
        mov     word ptr [bp-0ch], 0
        mov     word ptr [bp-0ah], 7f00h
        mov     word ptr [bp-8], 8fe0h
        mov     word ptr [bp-6], ds
        xor     ax, ax
        mov     word ptr [bp-12h], ax
        mov     word ptr [bp-4], ax
        push    1
        push    2
        lea     ax, [bp-14h]
        push    ss
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_39D50
        jmp     br_39F6B
br_39D50:
        push    100h
        push    11h
        push    word ptr [bp-14h]
        push    11h
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        callf   EP_FS_READ_RESIZED_SEG:EP_FS_READ_RESIZED_OFF
        add     sp, 0ch
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_39D75
        jmp     br_39F6B
br_39D75:
        push    1
        push    2
        lea     ax, [bp-16h]
        push    ss
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_39D93
        jmp     br_39F6B
br_39D93:
        push    1
        push    33h
        push    1
        push    word ptr [bp-16h]
        push    7f00h
        push    0
        callf   EP_FS_READ_RESIZED_SEG:EP_FS_READ_RESIZED_OFF
        add     sp, 0ch
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_39DB6
        jmp     br_39F6B
br_39DB6:
        push    1
        push    2
        lea     ax, [bp-14h]
        push    ss
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_39DD4
        jmp     br_39F6B
br_39DD4:
        push    1
        push    2
        lea     ax, [bp-16h]
        push    ss
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_39DF2
        jmp     br_39F6B
br_39DF2:
        push    40h
        push    6
        push    word ptr [bp-14h]
        push    word ptr [bp-16h]
        push    ds
        push    C0_W_08FE0
        callf   EP_FS_READ_RESIZED_SEG:EP_FS_READ_RESIZED_OFF
        add     sp, 0ch
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_39E15
        jmp     br_39F6B
br_39E15:
        push    1
        push    2
        lea     ax, [bp-14h]
        push    ss
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_39E33
        jmp     br_39F6B
br_39E33:
        push    40h
        push    1
        push    word ptr [bp-14h]
        push    1
        push    ds
        push    C0_W_0D778
        callf   EP_FS_READ_RESIZED_SEG:EP_FS_READ_RESIZED_OFF
        add     sp, 0ch
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_39E55
        jmp     br_39F6B
br_39E55:
        push    1
        push    2
        lea     ax, [bp-18h]
        push    ss
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        je      br_39E73
        jmp     br_39F6B
br_39E73:
        mov     bx, 7f00h
        mov     es, bx
        db      26h, 8ah, 06h, 16h, 00h  ; mov al, byte ptr es:[16h]
        cbw
        mov     word ptr [bp-12h], ax
        db      26h, 8ah, 06h, 17h, 00h  ; mov al, byte ptr es:[17h]
        mov     byte ptr [C0_B_0D7B8], al
        db      26h, 8ah, 06h, 18h, 00h  ; mov al, byte ptr es:[18h]
        mov     byte ptr [C0_B_0D7B9], al
        db      26h, 8ah, 06h, 1ah, 00h  ; mov al, byte ptr es:[1ah]
        mov     byte ptr [C2_B_RECORD_MIX_CHANGES], al
        db      26h, 8ah, 06h, 1dh, 00h  ; mov al, byte ptr es:[1dh]
        cbw
        push    ax
        callf   EP_PAD_ASSIGN_MASTER_SET_SEG:EP_PAD_ASSIGN_MASTER_SET_OFF
        add     sp, 2
        mov     bx, 7f00h
        mov     es, bx
        db      26h, 8ah, 06h, 2eh, 00h  ; mov al, byte ptr es:[2eh]
        mov     byte ptr [C0_B_0D776], al
        mov     bx, 8fe0h
        db      26h, 8ah, 06h, 1eh, 00h  ; mov al, byte ptr es:[1eh]
        mov     byte ptr [bx+183h], al
        db      26h, 8ah, 06h, 2ch, 00h  ; mov al, byte ptr es:[2ch]
        mov     byte ptr [bx+182h], al
        db      26h, 8ah, 06h, 2dh, 00h  ; mov al, byte ptr es:[2dh]
        mov     byte ptr [bx+181h], al
        mov     word ptr [bp-8], 9164h
        mov     word ptr [bp-6], ds
        mov     ax, 946ch
        mov     di, ax
        mov     si, bx
        push    ds
        pop     es
        mov     cx, 0c2h
        rep movsw
        mov     dx, 92e8h
        push    ds
        mov     di, dx
        mov     si, ax
        mov     cx, 0c2h
        rep movsw
        pop     ds
        push    ds
        mov     di, 9164h
        mov     si, dx
        push    ds
        pop     es
        mov     cx, 0c2h
        rep movsw
        pop     ds
        mov     word ptr [bp-2], 0
        cmp     word ptr [bp-18h], 0
        jle     br_39F6B
        mov     si, word ptr [bp-4]
        mov     di, word ptr [bp-2]
loop_39F16:
        push    1
        push    2
        lea     ax, [bp-1ah]
        push    ss
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        jne     br_39F62
        push    word ptr [bp-1ah]
        callf   EP_PGM_INIT_DEFAULT_SEG:EP_PGM_INIT_DEFAULT_OFF
        add     sp, 2
        cmp     word ptr [bp-1ah], 0
        jne     br_39F43
        inc     si
br_39F43:
        push    0
        push    0
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        push    word ptr [bp-1ah]
        callf   EP_PGM_FILE_READ_SEG:EP_PGM_FILE_READ_OFF
        add     sp, 0ah
        mov     word ptr [bp-10h], ax
        mov     word ptr [bp-0eh], dx
        or      dx, ax
        jne     L_39968
br_39F62:
        inc     di
        cmp     word ptr [bp-18h], di
        jg      loop_39F16
L_39968:
        mov     word ptr [bp-4], si
br_39F6B:
        mov     ax, word ptr [bp-0eh]
        or      ax, word ptr [bp-10h]
        jne     L_3998C
        cmp     word ptr [bp-18h], 0
        je      br_39F91
        cmp     word ptr [bp-4], 0
        jne     br_39F91
        push    0
        callf   EP_PGM_DELETE_SLOT_SEG:EP_PGM_DELETE_SLOT_OFF
        add     sp, 2
        jmp     SHORT br_39F91
        nop
L_3998C:
        mov     word ptr [bp-12h], 0
br_39F91:
        xor     si, si
        mov     di, word ptr [bp-12h]
loop_39F96:
        push    di
        push    si
        callf   EP_DRUM_PROGRAM_SELECT_SEG:EP_DRUM_PROGRAM_SELECT_OFF
        add     sp, 4
        inc     si
        cmp     si, 3
        jle     loop_39F96
        mov     ax, word ptr [bp-10h]
        mov     dx, word ptr [bp-0eh]
        pop     si
        pop     di
        leave
        ret
fn_39FB0:
        enter   12h, 0
        push    di
        push    si
        xor     ax, ax
        mov     word ptr [bp-0ch], ax
        mov     dx, 7f00h
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    dx
        push    ax
        callf   EP_L_43D82_SEG:EP_L_43D82_OFF
        add     sp, 4
        push    1
        push    2
        lea     ax, [bp-12h]
        push    ss
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     di, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jne     br_3A005
        push    100h
        push    11h
        push    word ptr [bp-12h]
        push    11h
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        callf   EP_FS_READ_RESIZED_SEG:EP_FS_READ_RESIZED_OFF
        add     sp, 0ch
        mov     di, ax
        mov     word ptr [bp-6], dx
br_3A005:
        mov     ax, word ptr [bp-6]
        or      ax, di
        jne     br_3A041
        push    1
        push    2
        lea     ax, [bp-10h]
        push    ss
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     di, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jne     br_3A041
        push    1
        push    18h
        push    1
        push    word ptr [bp-10h]
        push    7f00h
        push    0
        callf   EP_FS_READ_RESIZED_SEG:EP_FS_READ_RESIZED_OFF
        add     sp, 0ch
        mov     di, ax
        mov     word ptr [bp-6], dx
br_3A041:
        mov     ax, word ptr [bp-6]
        or      ax, di
        jne     br_3A07F
        push    1
        push    1
        lea     ax, [bp-1]
        push    ss
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     di, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jne     br_3A07F
        push    40h
        push    1
        mov     al, byte ptr [bp-1]
        sub     ah, ah
        push    ax
        push    1
        push    ds
        push    C0_W_0D778
        callf   EP_FS_READ_RESIZED_SEG:EP_FS_READ_RESIZED_OFF
        add     sp, 0ch
        mov     di, ax
        mov     word ptr [bp-6], dx
br_3A07F:
        mov     ax, word ptr [bp-6]
        or      ax, di
        je      br_3A089
        jmp     br_3A15A
br_3A089:
        push    1
        push    4
        lea     ax, [bp-12h]
        push    ss
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     di, ax
        mov     word ptr [bp-6], dx
        mov     word ptr [bp-2], 0
        cmp     word ptr [bp-12h], 0
        jne     br_3A0AD
        jmp     br_3A15A
br_3A0AD:
        xor     si, si
        mov     di, word ptr [bp-2]
loop_3A0B2:
        cmp     di, 3
        jbe     br_3A0CA
        push    1
        push    0
        push    word ptr [bp-10h]
        callf   EP_FS_SEEK_SEG:EP_FS_SEEK_OFF
        add     sp, 6
        jmp     br_3A145
        nop
        nop
br_3A0CA:
        push    1
        push    2
        lea     ax, [bp-4]
        push    ss
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jne     br_3A14B
        push    1
        push    2
        lea     ax, [bp-0ah]
        push    ss
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jne     br_3A14B
        push    40h
        push    6
        push    word ptr [bp-4]
        push    word ptr [bp-0ah]
        mov     ax, si
        add     ax, 8fe0h
        push    ds
        push    ax
        callf   EP_FS_READ_RESIZED_SEG:EP_FS_READ_RESIZED_OFF
        add     sp, 0ch
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jne     br_3A14B
        push    40h
        push    17eh
        push    1
        mov     ax, word ptr [bp-0ah]
        mul     word ptr [bp-4]
        sub     ax, word ptr [bp-10h]
        neg     ax
        push    ax
        mov     ax, si
        add     ax, 9160h
        push    ds
        push    ax
        callf   EP_FS_READ_RESIZED_SEG:EP_FS_READ_RESIZED_OFF
        add     sp, 0ch
br_3A145:
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
br_3A14B:
        add     si, 184h
        inc     di
        cmp     word ptr [bp-12h], di
        jbe     L_3A158
        jmp     loop_3A0B2
L_3A158:
        mov     di, ax
br_3A15A:
        mov     word ptr [bp-8], di
        mov     ax, word ptr [bp-6]
        or      ax, di
        je      L_3A1A2
        mov     si, word ptr [bp-0ch]
loop_3A167:
        mov     ax, word ptr [bp-6]
        or      ax, di
        je      br_3A171
        jmp     NEAR L_3A250
br_3A171:
        or      si, si
        jne     BR_3A17E
        push    si
        callf   EP_PGM_DELETE_SLOT_SEG:EP_PGM_DELETE_SLOT_OFF
        add     sp, 2
BR_3A17E:
        xor     di, di
        mov     si, di
loop_3A182:
        cmp     si, 3
        jbe     br_3A18A
        jmp     br_3A240
br_3A18A:
        mov     al, byte ptr [di+C0_TBL_09160]
        sub     ah, ah
        push    ax
        push    si
        callf   EP_DRUM_PROGRAM_SELECT_SEG:EP_DRUM_PROGRAM_SELECT_OFF
        add     sp, 4
        add     di, 184h
        inc     si
        jmp     loop_3A182
        nop
L_3A1A2:
        mov     si, word ptr [bp-0ch]
loop_3A1A5:
        push    1
        push    2
        lea     ax, [bp-0eh]
        push    ss
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     di, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jne     loop_3A1A5
        mov     word ptr [bp-8], ax
        cmp     word ptr [bp-0eh], 0
        jl      loop_3A167
        cmp     word ptr [bp-0eh], 17h
        jg      loop_3A1A5
        cmp     word ptr [bp-0eh], 0
        jne     br_3A1D7
        mov     si, 1
br_3A1D7:
        push    word ptr [bp-0eh]
        callf   EP_PGM_INIT_DEFAULT_SEG:EP_PGM_INIT_DEFAULT_OFF
        add     sp, 2
        push    1
        push    2
        lea     ax, [bp-2]
        push    ss
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     di, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jne     br_3A22F
        cmp     byte ptr [bp-2], 7
        jne     br_3A224
        cmp     byte ptr [bp-1], 4
        jne     br_3A224
        push    1
        push    0
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        push    word ptr [bp-0eh]
        callf   EP_PGM_FILE_READ_SEG:EP_PGM_FILE_READ_OFF
        add     sp, 0ah
        mov     di, ax
        mov     word ptr [bp-6], dx
        jmp     br_3A22F
br_3A224:
        mov     ax, STR_DISK_NEEDS_NEWER_OS
        mov     cx, C1_SEG
        mov     di, ax
        mov     word ptr [bp-6], cx
br_3A22F:
        mov     ax, word ptr [bp-6]
        or      ax, di
        jne     br_3A239
        jmp     loop_3A1A5
br_3A239:
        mov     word ptr [bp-8], di
        jmp     loop_3A167
        nop
br_3A240:
        push    7f00h
        push    0
        callf   EP_L_43E70_SEG:EP_L_43E70_OFF
        add     sp, 4
        jmp     br_3A263
        nop
L_3A250:
        xor     si, si
loop_3A252:
        push    0
        push    si
        callf   EP_DRUM_PROGRAM_SELECT_SEG:EP_DRUM_PROGRAM_SELECT_OFF
        add     sp, 4
        inc     si
        cmp     si, 3
        jbe     loop_3A252
br_3A263:
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        pop     si
        pop     di
        leave
        ret
        db      00h
L_3A26E:
        enter   0e0h, 0
        push    di
        push    si
        mov     di, word ptr [bp+0ah]
        mov     ax, word ptr [bp+0ch]
        push    ax
        push    di
        lea     cx, [bp-0dch]
        push    ss
        push    cx
        mov     si, ax
        call    fn_3A6A6
        add     sp, 8
        push    1
        push    si
        push    di
        callf   EP_DISK_PROGRESS_MSG_SEG:EP_DISK_PROGRESS_MSG_OFF
        add     sp, 6
        push    1
        push    si
        push    di
        callf   EP_FS_OPEN_SEG:EP_FS_OPEN_OFF
        add     sp, 6
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_3A2AE
        jmp     br_3A697
br_3A2AE:
        mov     word ptr [bp-24h], 4952h
        mov     word ptr [bp-22h], 4646h
        les     bx, [bp+6]
        push    word ptr es:[bx+30h]
        push    word ptr es:[bx+2eh]
        mov     al, byte ptr es:[bx+25h]
        sub     ah, ah
        inc     ax
        cwd
        push    dx
        push    ax
        nop
        push    cs
        call    __aFlmul
        mov     cx, ax
        mov     al, 18h
        les     bx, [bp+6]
        mul     byte ptr es:[bx+36h]
        add     ax, 70h
        add     cx, 2ch
        adc     dx, 0
        add     cx, cx
        adc     dx, dx
        add     cx, ax
        adc     dx, 0
        mov     word ptr [bp-20h], cx
        mov     word ptr [bp-1eh], dx
        mov     word ptr [bp-1ch], 4157h
        mov     word ptr [bp-1ah], 4556h
        push    1
        push    0ch
        lea     ax, [bp-24h]
        push    ss
        push    ax
        callf   EP_FS_WRITE_SEG:EP_FS_WRITE_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_3A31C
        jmp     br_3A68B
br_3A31C:
        mov     word ptr [bp-10h], 6d66h
        mov     word ptr [bp-0eh], 2074h
        mov     word ptr [bp-0ch], 12h
        mov     word ptr [bp-0ah], 0
        mov     word ptr [bp-36h], 1
        les     bx, [bp+6]
        sub     ah, ah
        mov     al, byte ptr es:[bx+25h]
        inc     ax
        mov     word ptr [bp-34h], ax
        mov     ax, word ptr es:[bx+38h]
        mov     word ptr [bp-32h], ax
        mov     word ptr [bp-30h], 0
        mov     word ptr [bp-28h], 10h
        mov     ax, word ptr [bp-34h]
        add     ax, ax
        mov     word ptr [bp-2ah], ax
        push    word ptr [bp-30h]
        push    word ptr [bp-32h]
        push    0
        push    ax
        nop
        push    cs
        call    __aFlmul
        mov     word ptr [bp-2eh], ax
        mov     word ptr [bp-2ch], dx
        mov     word ptr [bp-26h], 0
        push    1
        push    8
        lea     ax, [bp-10h]
        push    ss
        push    ax
        callf   EP_FS_WRITE_SEG:EP_FS_WRITE_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_3A391
        jmp     br_3A68B
br_3A391:
        push    1
        push    12h
        lea     ax, [bp-36h]
        push    ss
        push    ax
        callf   EP_FS_WRITE_SEG:EP_FS_WRITE_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_3A3AE
        jmp     br_3A68B
br_3A3AE:
        mov     word ptr [bp-10h], 6166h
        mov     word ptr [bp-0eh], 7463h
        mov     word ptr [bp-0ch], 4
        mov     word ptr [bp-0ah], 0
        les     bx, [bp+6]
        mov     ax, word ptr es:[bx+2eh]
        mov     dx, word ptr es:[bx+30h]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        push    1
        push    8
        lea     ax, [bp-10h]
        push    ss
        push    ax
        callf   EP_FS_WRITE_SEG:EP_FS_WRITE_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_3A3F0
        jmp     br_3A68B
br_3A3F0:
        push    1
        push    4
        lea     ax, [bp-8]
        push    ss
        push    ax
        callf   EP_FS_WRITE_SEG:EP_FS_WRITE_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_3A40D
        jmp     br_3A68B
br_3A40D:
        xor     ax, ax
        mov     cx, 12h
        lea     di, [bp-84h]
        push    ss
        pop     es
        rep stosw
        les     bx, [bp+6]
        push    ax
        push    word ptr es:[bx+38h]
        push    3b9ah
        push    0ca00h
        nop
        push    cs
        call    _ldiv
        add     sp, 8
        push    ds
        lea     di, [bp-18h]
        mov     si, ax
        push    ss
        pop     es
        mov     ds, dx
        movsw
        movsw
        movsw
        movsw
        pop     ds
        mov     word ptr [bp-10h], 6d73h
        mov     word ptr [bp-0eh], 6c70h
        mov     al, 18h
        les     bx, [bp+6]
        mul     byte ptr es:[bx+36h]
        add     ax, 36h
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], 0
        mov     word ptr [bp-84h], 47h
        mov     word ptr [bp-82h], 100h
        mov     word ptr [bp-80h], 5eh
        mov     word ptr [bp-7eh], 0
        mov     ax, word ptr [bp-18h]
        mov     dx, word ptr [bp-16h]
        mov     word ptr [bp-7ch], ax
        mov     word ptr [bp-7ah], dx
        mov     word ptr [bp-78h], 3ch
        mov     word ptr [bp-76h], 0
        mov     al, byte ptr es:[bx+36h]
        sub     ah, ah
        mov     word ptr [bp-68h], ax
        mov     word ptr [bp-66h], 0
        mov     word ptr [bp-64h], 12h
        xor     ax, ax
        mov     word ptr [bp-62h], ax
        mov     cx, 0ch
        push    es
        lea     di, [bp-60h]
        push    ss
        pop     es
        rep stosw
        pop     es
        mov     word ptr [bp-60h], 6f6ch
        mov     word ptr [bp-5eh], 706fh
        sub     cx, cx
        mov     word ptr [bp-5ah], cx
        mov     word ptr [bp-5ch], cx
        mov     cx, word ptr es:[bx+2ah]
        mov     dx, word ptr es:[bx+2ch]
        sub     cx, word ptr es:[bx+32h]
        sbb     dx, word ptr es:[bx+34h]
        mov     word ptr [bp-58h], cx
        mov     word ptr [bp-56h], dx
        mov     cx, word ptr es:[bx+2ah]
        mov     dx, word ptr es:[bx+2ch]
        mov     word ptr [bp-54h], cx
        mov     word ptr [bp-52h], dx
        mov     cx, 9
        push    es
        lea     di, [bp-48h]
        push    ss
        pop     es
        rep stosw
        pop     es
        mov     byte ptr [bp-48h], 1
        mov     byte ptr [bp-47h], al
        mov     byte ptr [bp-46h], 3ch
        push    ax
        push    word ptr es:[bx+38h]
        callf   EP_MIDI_OUT_IO_SEG:EP_MIDI_OUT_IO_OFF
        add     sp, 4
        cbw
        les     bx, [bp+6]
        mov     cx, ax
        mov     al, byte ptr es:[bx+24h]
        cbw
        sub     ax, cx
        mov     word ptr [bp-2], ax
        mov     cx, 0ah
        cwd
        idiv    cx
        mov     byte ptr [bp-45h], al
        mov     ax, word ptr [bp-2]
        cwd
        idiv    cx
        mov     al, dl
        shl     dl, 2
        add     dl, al
        add     dl, dl
        mov     byte ptr [bp-44h], dl
        cmp     byte ptr es:[bx+36h], 1
        cmc
        sbb     al, al
        and     ax, 2
        mov     word ptr [bp-42h], ax
        mov     ax, word ptr es:[bx+26h]
        mov     dx, word ptr es:[bx+28h]
        mov     word ptr [bp-3eh], ax
        mov     word ptr [bp-3ch], dx
        cmp     byte ptr es:[bx+36h], ch
        je      br_3A55E
        mov     ax, word ptr es:[bx+2eh]
        mov     dx, word ptr es:[bx+30h]
        jmp     br_3A566
br_3A55E:
        mov     ax, word ptr es:[bx+2ah]
        mov     dx, word ptr es:[bx+2ch]
br_3A566:
        mov     word ptr [bp-3ah], ax
        mov     word ptr [bp-38h], dx
        push    1
        push    8
        lea     ax, [bp-10h]
        push    ss
        push    ax
        callf   EP_FS_WRITE_SEG:EP_FS_WRITE_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_3A589
        jmp     br_3A68B
br_3A589:
        push    1
        push    24h
        lea     ax, [bp-84h]
        push    ss
        push    ax
        callf   EP_FS_WRITE_SEG:EP_FS_WRITE_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_3A5A7
        jmp     br_3A68B
br_3A5A7:
        les     bx, [bp+6]
        cmp     byte ptr es:[bx+36h], 0
        je      br_3A5CE
        push    1
        push    18h
        lea     ax, [bp-60h]
        push    ss
        push    ax
        callf   EP_FS_WRITE_SEG:EP_FS_WRITE_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_3A5CE
        jmp     br_3A68B
br_3A5CE:
        push    1
        push    12h
        lea     ax, [bp-48h]
        push    ss
        push    ax
        callf   EP_FS_WRITE_SEG:EP_FS_WRITE_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_3A5EB
        jmp     br_3A68B
br_3A5EB:
        mov     word ptr [bp-10h], 6164h
        mov     word ptr [bp-0eh], 6174h
        les     bx, [bp+6]
        push    word ptr es:[bx+30h]
        push    word ptr es:[bx+2eh]
        mov     al, byte ptr es:[bx+25h]
        sub     ah, ah
        inc     ax
        cwd
        push    dx
        push    ax
        nop
        push    cs
        call    __aFlmul
        add     ax, ax
        adc     dx, dx
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        push    1
        push    8
        lea     ax, [bp-10h]
        push    ss
        push    ax
        callf   EP_FS_WRITE_SEG:EP_FS_WRITE_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     br_3A68B
        les     bx, [bp+6]
        push    word ptr es:[bx+30h]
        push    word ptr es:[bx+2eh]
        push    word ptr es:[bx+0ch]
        push    word ptr es:[bx+0ah]
        cmp     byte ptr es:[bx+25h], 0
        je      br_3A656
        mov     ax, (C1_BASE+L_42EA4-C1_SEG*16)
        mov     dx, C1_SEG
        jmp     br_3A65C
        nop
br_3A656:
        mov     ax, (C1_BASE+far_42E1C-C1_SEG*16)
        mov     dx, C1_SEG
br_3A65C:
        mov     word ptr [bp-0deh], dx
        mov     word ptr [bp-0e0h], ax
        callf   [bp-0e0h]
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     br_3A68B
        push    1
        push    58h
        lea     ax, [bp-0dch]
        push    ss
        push    ax
        callf   EP_FS_WRITE_SEG:EP_FS_WRITE_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-2], dx
br_3A68B:
        if      FW_VERSION >= 112
        mov     ax, word ptr [bp-2]
        or      ax, si
        jne     br_3A697
        endif
        nop
        push    cs
        call    disk_file_close
br_3A697:
        callf   EP_FIELD_HANDLER_NOP_SEG:EP_FIELD_HANDLER_NOP_OFF
        mov     ax, si
        mov     dx, word ptr [bp-2]
        pop     si
        pop     di
        leave
        retf
        if      FW_VERSION >= 112
        db      00h
        endif
fn_3A6A6:
        push    bp
        mov     bp, sp
        push    di
        push    si
        xor     ax, ax
        mov     cx, 2ch
        mov     bx, word ptr [bp+4]
        mov     dx, word ptr [bp+6]
        mov     di, bx
        mov     es, dx
        rep stosw
        mov     word ptr es:[bx], 494ch
        mov     word ptr es:[bx+2], 5453h
        mov     word ptr es:[bx+4], 50h
        mov     word ptr es:[bx+6], ax
        mov     word ptr es:[bx+8], 4e49h
        mov     word ptr es:[bx+0ah], 4f46h
        mov     word ptr es:[bx+0ch], 4e49h
        mov     word ptr es:[bx+0eh], 4d41h
        mov     word ptr es:[bx+10h], 11h
        mov     word ptr es:[bx+12h], ax
        push    10h
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        lea     ax, [bx+14h]
        push    dx
        push    ax
        nop
        push    cs
        call    __fstrncpy
        add     sp, 0ah
        les     bx, [bp+4]
        mov     word ptr es:[bx+26h], 5049h
        mov     word ptr es:[bx+28h], 4452h
        mov     word ptr es:[bx+2ah], 0fh
        mov     word ptr es:[bx+2ch], 0
        mov     ax, C1_SEG
        push    ds
        lea     di, [bx+2eh]
        if      FW_VERSION >= 112
        mov     si, 84eah
        elseif  FW_VERSION >= 110
        mov     si, 84cch
        else
        mov     si, 84d0h
        endif
        mov     ds, ax
        mov     cx, 7
        rep movsw
        movsb
        pop     ds
        les     bx, [bp+4]
        mov     word ptr es:[bx+3eh], 5349h
        mov     word ptr es:[bx+40h], 5446h
        mov     word ptr es:[bx+42h], 11h
        mov     word ptr es:[bx+44h], 0
        push    10h
        push    word ptr [C0_W_0073A]
        push    word ptr [C0_W_00738]
        lea     ax, [bx+46h]
        push    es
        push    ax
        nop
        push    cs
        call    __fstrncpy
        add     sp, 0ah
        pop     si
        pop     di
        leave
        ret
file_exists_f3:
        enter   4, 0
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        nop
        push    cs
        call    far_37E82
        cmp     ax, 2
        jne     br_3A797
        cmp     byte ptr [C0_B_0D7F9], 53h
        jne     br_3A797
        push    ds
        push    C0_W_0D7E8
        callf   EP_L_3E92C_SEG:EP_L_3E92C_OFF
        add     sp, 4
        or      ax, ax
        jne     br_3A7C1
br_3A797:
        push    ds
        push    C0_W_0D7E8
        callf   EP_FAR_42A32_SEG:EP_FAR_42A32_OFF
        add     sp, 4
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     br_3A7B0
        call    fn_3A7FA
        pop     ds
        leave
        retf
br_3A7B0:
        push    word ptr [bp-2]
        push    ax
        nop
        push    cs
        call    disp_alert_wait_key
        add     sp, 4
        callf   EP_FAR_3E99C_SEG:EP_FAR_3E99C_OFF
br_3A7C1:
        pop     ds
        leave
        retf
L_3A7C4:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     byte ptr [C0_B_0D7F8], 2eh
        push    cx
        push    0d7e8h
        callf   EP_FS_FIND_FILE_SEG:EP_FS_FIND_FILE_OFF
        add     sp, 4
        or      ax, ax
        jne     br_3A7F4
        push    C1_SEG
        push    EP_L_46984_OFF
        nop
        push    cs
        call    disp_alert_wait_key
        add     sp, 4
        callf   EP_FAR_468EA_SEG:EP_FAR_468EA_OFF
        pop     ds
        retf
br_3A7F4:
        call    fn_3A7FA
        pop     ds
        retf
        db      00h
fn_3A7FA:
        mov     al, byte ptr [C0_B_0D7F9]
        cbw
        cmp     ax, 57h
        je      L_3A246
        ja      br_3A811
        sub     al, 41h
        je      br_3A822
        sub     al, 0fh
        je      br_3A830
        sub     al, 3
        je      br_3A842
br_3A811:
        push    C1_SEG
        if      FW_VERSION >= 112
        push    (C1_BASE+msg_internal_error-C1_SEG*16)
        else
        push    EP_MSG_INTERNAL_ERROR_OFF
        endif
        nop
        push    cs
        call    disp_alert_wait_key
        add     sp, 4
        jmp     br_3A85C
        nop
br_3A822:
        push    ds
        push    C0_W_0D7E8
        callf   EP_APS_SAVE_TO_DISK_SEG:EP_APS_SAVE_TO_DISK_OFF
        add     sp, 4
        ret
        nop
br_3A830:
        push    ds
        push    C0_W_0D7E8
        mov     al, byte ptr [C0_B_0D7BF]
        push    ax
        callf   EP_PGM_SAVE_TO_DISK_SEG:EP_PGM_SAVE_TO_DISK_OFF
        add     sp, 6
        ret
        nop
br_3A842:
        push    0
        jmp     br_3A848
L_3A246:
        push    1
br_3A848:
        push    ds
        push    C0_W_0D7E8
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        callf   EP_FAR_46478_SEG:EP_FAR_46478_OFF
        add     sp, 0ah
br_3A85C:
        callf   EP_FAR_3E99C_SEG:EP_FAR_3E99C_OFF
        ret
X_3A862:
        enter   4, 0
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   EP_FS_CLOSE_SEG:EP_FS_CLOSE_OFF
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     br_3A87E
        call    fn_3A892
        pop     ds
        leave
        retf
br_3A87E:
        push    word ptr [bp-2]
        push    ax
        nop
        push    cs
        call    disp_alert_wait_key
        add     sp, 4
        callf   EP_FAR_3E99C_SEG:EP_FAR_3E99C_OFF
        pop     ds
        leave
        retf
fn_3A892:
        mov     al, byte ptr [C0_B_0D7F9]
        cbw
        cmp     ax, 57h
        je      L_3A8DE
        ja      br_3A8A9
        sub     al, 41h
        je      br_3A8BA
        sub     al, 0fh
        je      br_3A8C8
        sub     al, 3
        je      br_3A8DA
br_3A8A9:
        push    C1_SEG
        if      FW_VERSION >= 112
        push    (C1_BASE+msg_internal_error-C1_SEG*16)
        else
        push    EP_MSG_INTERNAL_ERROR_OFF
        endif
        nop
        push    cs
        call    disp_alert_wait_key
        add     sp, 4
        jmp     br_3A8F4
        nop
br_3A8BA:
        push    ds
        push    C0_W_0D7E8
        callf   EP_APS_SAVE_TO_DISK_SEG:EP_APS_SAVE_TO_DISK_OFF
        add     sp, 4
        ret
        nop
br_3A8C8:
        push    ds
        push    C0_W_0D7E8
        mov     al, byte ptr [C0_B_0D7BF]
        push    ax
        callf   EP_PGM_SAVE_TO_DISK_SEG:EP_PGM_SAVE_TO_DISK_OFF
        add     sp, 6
        ret
        nop
br_3A8DA:
        push    0
        jmp     SHORT br_3A8E0
L_3A8DE:
        push    1
br_3A8E0:
        push    ds
        push    C0_W_0D7E8
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        callf   EP_FAR_46478_SEG:EP_FAR_46478_OFF
        add     sp, 0ah
br_3A8F4:
        callf   EP_FAR_3E99C_SEG:EP_FAR_3E99C_OFF
        ret
L_3A8FA:
        push    96h
        call    fn_3A90E
        add     sp, 2
        retf
L_3A904:
        push    0c0h
        call    fn_3A90E
        add     sp, 2
        retf
fn_3A90E:
        enter   8, 0
        push    word ptr [bp+4]
        push    ds
        push    C0_W_098C2
        lea     ax, [bp-8]
        push    ss
        push    ax
        call    fn_3A94A
        add     sp, 0ah
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     br_3A93C
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        callf   EP_FAR_46126_SEG:EP_FAR_46126_OFF
        add     sp, 4
        leave
        ret
        nop
br_3A93C:
        push    word ptr [bp-2]
        push    ax
        nop
        push    cs
        call    disp_alert_wait_key
        add     sp, 4
        leave
        ret
fn_3A94A:
        enter   22h, 0
        push    di
        push    si
        mov     word ptr [bp-6], 0
        mov     word ptr [bp-4], 7c00h
        mov     byte ptr [bp-2], 0
        push    0
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        callf   EP_DISK_PROGRESS_MSG_SEG:EP_DISK_PROGRESS_MSG_OFF
        add     sp, 6
        push    ds
        lea     si, [bp-22h]
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
        cmp     byte ptr [bp-18h], 2dh
        jne     br_3A9D7
        cmp     byte ptr [bp-17h], 4ch
        je      br_3A9A5
        cmp     byte ptr [bp-17h], 52h
        jne     br_3A9D7
br_3A9A5:
        mov     al, byte ptr [bp-17h]
        mov     byte ptr [bp-1], al
        mov     byte ptr [bp-2], 1
        cmp     al, 4ch
        jne     L_3A3B8
        mov     al, 52h
        jmp     SHORT br_3A9BA
        nop
L_3A3B8:
        mov     al, 4ch
br_3A9BA:
        mov     byte ptr [bp-17h], al
        lea     ax, [bp-22h]
        push    ss
        push    ax
        callf   EP_FS_FIND_FILE_SEG:EP_FS_FIND_FILE_OFF
        add     sp, 4
        inc     ax
        jne     br_3A9D1
        mov     byte ptr [bp-2], 0
br_3A9D1:
        mov     al, byte ptr [bp-1]
        mov     byte ptr [bp-17h], al
br_3A9D7:
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        callf   EP_SOUND_RECORD_ALLOC_SEG:EP_SOUND_RECORD_ALLOC_OFF
        add     sp, 4
        or      ax, ax
        jne     br_3A9EC
        jmp     br_3AD08
br_3A9EC:
        les     bx, [bp+4]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        add     ax, 12h
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        cmp     byte ptr [bp-2], 0
        jne     br_3AA08
        jmp     br_3ABFE
br_3AA08:
        mov     byte ptr [bp-17h], 4ch
        push    0
        lea     ax, [bp-22h]
        push    ss
        push    ax
        callf   EP_FS_OPEN_SEG:EP_FS_OPEN_OFF
        add     sp, 6
        mov     si, ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        je      br_3AA27
        jmp     br_3ACED
br_3AA27:
        push    1
        push    word ptr [bp+0ch]
        push    7c00h
        push    0
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        je      br_3AA45
        jmp     br_3AB03
br_3AA45:
        mov     al, 0ah
        mov     bx, 7c00h
        mov     es, bx
        db      26h, 88h, 06h, 0eh, 00h  ; mov byte ptr es:[0eh], al
        db      26h, 88h, 06h, 0dh, 00h  ; mov byte ptr es:[0dh], al
        push    bx
        push    0
        les     bx, [bp+4]
        push    word ptr es:[bx+2]
        push    word ptr es:[bx]
        call    lcd_clear_screen
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        je      br_3AA75
        jmp     br_3AB03
br_3AA75:
        les     bx, [bp-8]
        mov     byte ptr es:[bx+13h], 1
        push    2
        push    word ptr es:[bx+1eh]
        push    word ptr es:[bx+1ch]
        callf   EP_SIZE_PARA_ROUND_MUL_SEG:EP_SIZE_PARA_ROUND_MUL_OFF
        add     sp, 6
        les     bx, [bp+4]
        les     bx, es:[bx]
        mov     word ptr es:[bx+0eh], ax
        mov     word ptr es:[bx+10h], dx
        callf   EP_SMEM_FREE_BYTES_SEG:EP_SMEM_FREE_BYTES_OFF
        or      dx, dx
        jge     br_3AAB4
        mov     ax, (C1_BASE+L_415CA-C1_SEG*16)
        mov     cx, C1_SEG
        mov     si, ax
        mov     word ptr [bp-0ah], cx
        jmp     br_3AB03
        nop
br_3AAB4:
        les     bx, [bp+4]
        les     bx, es:[bx]
        mov     ax, word ptr es:[bx+0ah]
        mov     dx, word ptr es:[bx+0ch]
        add     ax, word ptr es:[bx+0eh]
        adc     dx, word ptr es:[bx+10h]
        cmp     dx, word ptr [C2_W_SMEM_SIZE_HI]
        jl      br_3AADD
        jg      br_3AAD8
        cmp     ax, word ptr [C0_W_SMEM_SIZE]
        jbe     br_3AADD
br_3AAD8:
        callf   EP_SMEM_COMPACT_SEG:EP_SMEM_COMPACT_OFF
br_3AADD:
        les     bx, [bp-8]
        push    word ptr es:[bx+1eh]
        push    word ptr es:[bx+1ch]
        les     bx, [bp+4]
        les     bx, es:[bx]
        push    word ptr es:[bx+0ch]
        push    word ptr es:[bx+0ah]
        callf   EP_FS_READ_TO_SMEM_SEG:EP_FS_READ_TO_SMEM_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0ah], dx
br_3AB03:
        if      FW_VERSION >= 112
        mov     ax, word ptr [bp-0ah]
        or      ax, si
        jne     L_3A50F
        endif
        nop
        push    cs
        call    disk_file_close
L_3A50F:
        mov     ax, word ptr [bp-0ah]
        or      ax, si
        je      br_3AB19
        jmp     br_3ACED
br_3AB19:
        mov     byte ptr [bp-17h], 52h
        push    0
        lea     ax, [bp-22h]
        push    ss
        push    ax
        callf   EP_FS_OPEN_SEG:EP_FS_OPEN_OFF
        add     sp, 6
        mov     si, ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        je      br_3AB38
        jmp     br_3ACED
br_3AB38:
        push    1
        push    word ptr [bp+0ch]
        push    7c00h
        push    0
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        je      br_3AB56
        jmp     br_3ACE1
br_3AB56:
        push    0
        push    2
        les     bx, [bp+4]
        les     bx, es:[bx]
        push    word ptr es:[bx+10h]
        push    word ptr es:[bx+0eh]
        mov     si, bx
        mov     di, es
        nop
        push    cs
        call    __aFldiv
        mov     es, di
        add     ax, word ptr es:[si+0ah]
        adc     dx, word ptr es:[si+0ch]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     bx, 7c00h
        mov     es, bx
        push    word ptr es:[1ch]
        push    word ptr es:[1ah]
        push    dx
        push    ax
        callf   EP_FS_READ_TO_SMEM_SEG:EP_FS_READ_TO_SMEM_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        je      br_3ABA6
        jmp     br_3ACE1
br_3ABA6:
        mov     bx, 7c00h
        mov     es, bx
        db      26h, 8bh, 06h, 1ah, 00h  ; mov ax, word ptr es:[1ah]
        mov     dx, word ptr es:[1ch]
        les     bx, [bp-8]
        cmp     word ptr es:[bx+1eh], dx
        jae     br_3ABC1
        jmp     br_3ACE1
br_3ABC1:
        ja      br_3ABCC
        cmp     word ptr es:[bx+1ch], ax
        ja      br_3ABCC
        jmp     br_3ACE1
br_3ABCC:
        mov     ax, word ptr es:[bx+1ch]
        mov     dx, word ptr es:[bx+1eh]
        mov     bx, 7c00h
        mov     es, bx
        mov     cx, word ptr es:[1ah]
        mov     di, word ptr es:[1ch]
        sub     ax, cx
        sbb     dx, di
        push    dx
        push    ax
        push    0
        add     cx, word ptr [bp-4]
        adc     di, word ptr [bp-2]
        push    di
        push    cx
        callf   EP_FAR_3E32A_SEG:EP_FAR_3E32A_OFF
        add     sp, 0ah
        jmp     br_3ACE1
        if      FW_VERSION < 112
        nop
        endif
br_3ABFE:
        push    0
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        callf   EP_FS_OPEN_SEG:EP_FS_OPEN_OFF
        add     sp, 6
        mov     si, ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        je      br_3AC1A
        jmp     br_3ACED
br_3AC1A:
        push    1
        push    word ptr [bp+0ch]
        push    7c00h
        push    0
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        je      br_3AC38
        jmp     br_3ACE1
br_3AC38:
        push    7c00h
        push    0
        les     bx, [bp+4]
        push    word ptr es:[bx+2]
        push    word ptr es:[bx]
        call    lcd_clear_screen
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0ah], dx
        or      dx, ax
        je      br_3AC59
        jmp     br_3ACE1
br_3AC59:
        push    1
        les     bx, [bp-8]
        push    word ptr es:[bx+1eh]
        push    word ptr es:[bx+1ch]
        callf   EP_SIZE_PARA_ROUND_MUL_SEG:EP_SIZE_PARA_ROUND_MUL_OFF
        add     sp, 6
        les     bx, [bp+4]
        les     bx, es:[bx]
        mov     word ptr es:[bx+0eh], ax
        mov     word ptr es:[bx+10h], dx
        callf   EP_SMEM_FREE_BYTES_SEG:EP_SMEM_FREE_BYTES_OFF
        or      dx, dx
        jge     br_3AC92
        mov     ax, (C1_BASE+L_415CA-C1_SEG*16)
        mov     cx, C1_SEG
        mov     si, ax
        mov     word ptr [bp-0ah], cx
        jmp     br_3ACE1
br_3AC92:
        les     bx, [bp+4]
        les     bx, es:[bx]
        mov     ax, word ptr es:[bx+0ah]
        mov     dx, word ptr es:[bx+0ch]
        add     ax, word ptr es:[bx+0eh]
        adc     dx, word ptr es:[bx+10h]
        cmp     dx, word ptr [C2_W_SMEM_SIZE_HI]
        jl      br_3ACBB
        jg      br_3ACB6
        cmp     ax, word ptr [C0_W_SMEM_SIZE]
        jbe     br_3ACBB
br_3ACB6:
        callf   EP_SMEM_COMPACT_SEG:EP_SMEM_COMPACT_OFF
br_3ACBB:
        les     bx, [bp-8]
        push    word ptr es:[bx+1eh]
        push    word ptr es:[bx+1ch]
        les     bx, [bp+4]
        les     bx, es:[bx]
        push    word ptr es:[bx+0ch]
        push    word ptr es:[bx+0ah]
        callf   EP_FS_READ_TO_SMEM_SEG:EP_FS_READ_TO_SMEM_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-0ah], dx
br_3ACE1:
        if      FW_VERSION >= 112
        mov     ax, word ptr [bp-0ah]
        or      ax, si
        jne     br_3ACED
        endif
        nop
        push    cs
        call    disk_file_close
br_3ACED:
        mov     ax, word ptr [bp-0ah]
        or      ax, si
        je      br_3AD13
        les     bx, [bp+4]
        push    word ptr es:[bx+2]
        push    word ptr es:[bx]
        callf   EP_SOUND_LIST_UNLINK_SEG:EP_SOUND_LIST_UNLINK_OFF
        add     sp, 4
        jmp     br_3AD13
        if      FW_VERSION < 112
        nop
        endif
br_3AD08:
        mov     ax, (C1_BASE+msg_sound_dir_full-C1_SEG*16)
        mov     cx, C1_SEG
        mov     si, ax
        mov     word ptr [bp-0ah], cx
br_3AD13:
        callf   EP_FIELD_HANDLER_NOP_SEG:EP_FIELD_HANDLER_NOP_OFF
        mov     ax, si
        mov     dx, word ptr [bp-0ah]
        pop     si
        pop     di
        leave
        ret
        db      00h
lcd_clear_screen:
        enter   6, 0
        push    di
        push    si
        mov     di, word ptr [bp+8]
        sub     ax, ax
        mov     word ptr [bp-2], ax
        mov     word ptr [bp-4], ax
        mov     es, word ptr [bp+0ah]
        cmp     byte ptr es:[di], 3
        je      br_3AD3F
        jmp     br_3AEA2
br_3AD3F:
        mov     si, word ptr [bp+4]
        lea     ax, [di+3]
        push    es
        push    ax
        mov     ax, si
        mov     dx, word ptr [bp+6]
        add     ax, 12h
        push    dx
        push    ax
        call    lcd_screen_helper
        add     sp, 8
        mov     es, word ptr [bp+0ah]
        test    byte ptr es:[di+0fh], 80h
        je      br_3AD68
        mov     ax, word ptr es:[di+8ah]
        jmp     br_3AD75
br_3AD68:
        cmp     byte ptr es:[di+1], 1
        sbb     ax, ax
        and     ax, 0a9deh
        add     ax, 0ac44h
br_3AD75:
        mov     es, word ptr [bp+6]
        mov     word ptr es:[si+38h], ax
        mov     es, word ptr [bp+0ah]
        cmp     byte ptr es:[di+1], 1
        sbb     ax, ax
        and     al, 88h
        mov     word ptr [bp-6], ax
        push    word ptr es:[di+14h]
        call    lcd_ratio_calc
        add     sp, 2
        add     word ptr [bp-6], ax
        cmp     word ptr [bp-6], 0ff10h
        jl      br_3ADA8
        mov     cx, word ptr [bp-6]
        cmp     cx, 0f0h
        jle     br_3ADAB
br_3ADA8:
        mov     cx, 0f0h
br_3ADAB:
        mov     es, word ptr [bp+6]
        mov     byte ptr es:[si+24h], cl
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[di+1ah]
        mov     dx, word ptr es:[di+1ch]
        mov     es, word ptr [bp+6]
        mov     word ptr es:[si+2eh], ax
        mov     word ptr es:[si+30h], dx
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[di+1eh]
        mov     dx, word ptr es:[di+20h]
        mov     es, word ptr [bp+6]
        mov     word ptr es:[si+26h], ax
        mov     word ptr es:[si+28h], dx
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[di+22h]
        mov     dx, word ptr es:[di+24h]
        mov     es, word ptr [bp+6]
        mov     word ptr es:[si+2ah], ax
        mov     word ptr es:[si+2ch], dx
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[di+2ch]
        mov     dx, word ptr es:[di+2eh]
        mov     es, word ptr [bp+6]
        mov     word ptr es:[si+32h], ax
        mov     word ptr es:[si+34h], dx
        mov     es, word ptr [bp+0ah]
        test    byte ptr es:[di+2bh], 80h
        je      br_3AE21
        mov     es, word ptr [bp+6]
        add     word ptr es:[si+32h], 1
        adc     word ptr es:[si+34h], 0
br_3AE21:
        mov     es, word ptr [bp+0ah]
        cmp     word ptr es:[di+30h], 270fh
        jne     br_3AE30
        mov     al, 1
        jmp     br_3AE32
br_3AE30:
        xor     al, al
br_3AE32:
        mov     es, word ptr [bp+6]
        mov     byte ptr es:[si+36h], al
        or      al, al
        je      br_3AE53
        mov     es, word ptr [bp+0ah]
        mov     ax, word ptr es:[di+26h]
        mov     dx, word ptr es:[di+28h]
        mov     es, word ptr [bp+6]
        mov     word ptr es:[si+2ah], ax
        mov     word ptr es:[si+2ch], dx
br_3AE53:
        mov     es, word ptr [bp+6]
        mov     ax, word ptr es:[si+32h]
        mov     dx, word ptr es:[si+34h]
        cmp     word ptr es:[si+2ch], dx
        jg      br_3AE7C
        jl      br_3AE6C
        cmp     word ptr es:[si+2ah], ax
        jae     br_3AE7C
br_3AE6C:
        mov     ax, word ptr es:[si+2ah]
        mov     dx, word ptr es:[si+2ch]
        mov     word ptr es:[si+32h], ax
        mov     word ptr es:[si+34h], dx
br_3AE7C:
        push    0
        mov     es, word ptr [bp+6]
        push    word ptr es:[si+34h]
        push    word ptr es:[si+32h]
        nop
        push    cs
        call    addr_calc_segment
        add     sp, 6
        mov     es, word ptr [bp+6]
        mov     word ptr es:[si+3ah], ax
        mov     word ptr es:[si+3ch], dx
        mov     bx, word ptr [bp-4]
        jmp     br_3AEAB
        nop
br_3AEA2:
        mov     bx, (C1_BASE+L_469FA-C1_SEG*16)
        mov     cx, C1_SEG
        mov     word ptr [bp-2], cx
br_3AEAB:
        mov     ax, bx
        mov     dx, word ptr [bp-2]
        pop     si
        pop     di
        leave
        ret
lcd_screen_helper:
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     di, word ptr [bp+4]
        mov     cx, word ptr [bp+8]
        xor     si, si
        mov     ax, word ptr [bp+0ah]
loop_3AEC4:
        mov     bx, cx
        mov     es, word ptr [bp+0ah]
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx+C0_TBL_00F52]
        mov     bx, di
        mov     es, word ptr [bp+6]
        mov     byte ptr es:[bx+si], al
        inc     si
        cmp     si, 0ch
        jl      loop_3AEC4
        mov     bx, 0bh
loop_3AEE4:
        mov     si, di
        mov     es, word ptr [bp+6]
        cmp     byte ptr es:[bx+si], 20h
        jne     br_3AEF2
        dec     bx
        jns     loop_3AEE4
br_3AEF2:
        or      bx, bx
        jl      br_3AF0A
loop_3AEF6:
        mov     si, di
        mov     es, word ptr [bp+6]
        cmp     byte ptr es:[bx+si], 20h
        jne     br_3AF07
        add     si, bx
        mov     byte ptr es:[si], 5fh
br_3AF07:
        dec     bx
        jns     loop_3AEF6
br_3AF0A:
        mov     si, word ptr [bp+4]
        mov     ax, 2020h
        mov     es, word ptr [bp+6]
        mov     cx, 2
        lea     di, [si+0ch]
        rep stosw
        mov     byte ptr es:[si+10h], 0
        mov     ax, si
        mov     dx, es
        pop     si
        pop     di
        leave
        ret
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
        jle     br_3AF50
        mov     ax, 78h
        pop     di
        leave
        ret
        nop
br_3AF50:
        cmp     di, -0ch
        jge     br_3AF5C
        mov     ax, 0ff88h
        pop     di
        leave
        ret
        nop
br_3AF5C:
        mov     bx, dx
        mov     ax, 64h
        imul    bx
        mov     bx, ax
        or      ax, ax
        jle     br_3AF70
        add     bx, 80h
        jmp     br_3AF74
        nop
br_3AF70:
        sub     bx, 80h
br_3AF74:
        mov     ax, bx
        cwd
        idiv    cx
        mov     bx, ax
        or      ax, bx
        jle     br_3AF84
        add     bx, 5
        jmp     xl_lcd_clear_screen
br_3AF84:
        sub     bx, 5
xl_lcd_clear_screen:
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
        ret
        nop
L_3AF9E:
        enter   8, 0
        push    word ptr [bp+8]
        push    word ptr [bp+6]
        push    ds
        push    C0_W_098C2
        lea     ax, [bp-8]
        push    ss
        push    ax
        call    lcd_clear_line
        add     sp, 0ch
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     br_3AFCE
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        callf   EP_FAR_46126_SEG:EP_FAR_46126_OFF
        add     sp, 4
        leave
        retf
br_3AFCE:
        push    word ptr [bp-2]
        push    ax
        nop
        push    cs
        call    disp_alert_wait_key
        add     sp, 4
        leave
        retf
lcd_clear_line:
        enter   44h, 0
        push    di
        push    si
        mov     word ptr [bp-14h], 0bb80h
        mov     word ptr [bp-12h], 0ac44h
        mov     word ptr [bp-10h], 5dc0h
        mov     word ptr [bp-0eh], 5622h
        mov     byte ptr [bp-0ch], 0fh
        mov     byte ptr [bp-0bh], 0
        mov     byte ptr [bp-0ah], 95h
        mov     byte ptr [bp-9], 88h
        lea     ax, [bp-44h]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], ss
        mov     dx, word ptr [bp+0ch]
        mov     bx, word ptr [bp+0eh]
        push    ds
        mov     di, ax
        mov     si, dx
        push    ss
        pop     es
        mov     ds, bx
        mov     cx, 18h
        rep movsw
        pop     ds
        push    0
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        callf   EP_DISK_PROGRESS_MSG_SEG:EP_DISK_PROGRESS_MSG_OFF
        add     sp, 6
        push    word ptr [bp+6]
        push    word ptr [bp+4]
        callf   EP_SOUND_RECORD_ALLOC_SEG:EP_SOUND_RECORD_ALLOC_OFF
        add     sp, 4
        or      ax, ax
        jne     br_3B049
        jmp     br_3B1DC
br_3B049:
        push    0
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        callf   EP_FS_OPEN_SEG:EP_FS_OPEN_OFF
        add     sp, 6
        mov     si, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      br_3B065
        jmp     br_3B1E5
br_3B065:
        push    10h
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        les     bx, [bp+4]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        add     ax, 12h
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    dx
        push    ax
        nop
        push    cs
        call    __fstrncpy
        add     sp, 0ah
        push    0
        push    2
        callf   EP_L_42AF6_SEG:EP_L_42AF6_OFF
        push    dx
        push    ax
        nop
        push    cs
        call    __aFldiv
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+1ch], ax
        mov     word ptr es:[si+1eh], dx
        lea     bx, [bp-44h]
        mov     ax, word ptr ss:[bx+11h]
        mov     word ptr es:[si+14h], ax
        mov     word ptr es:[si+16h], 0
        mov     al, byte ptr ss:[bx+1bh]
        sub     ah, ah
        mov     dx, ax
        mov     cx, word ptr ss:[bx+19h]
        add     cx, 1
        adc     dx, 0
        mov     word ptr es:[si+18h], cx
        mov     word ptr es:[si+1ah], dx
        cmp     byte ptr ss:[bx+24h], 2
        jb      br_3B0DA
        xor     al, al
        jmp     br_3B0DC
br_3B0DA:
        mov     al, 1
br_3B0DC:
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[si+24h], al
        mov     ax, word ptr es:[si+18h]
        mov     dx, word ptr es:[si+1ah]
        sub     ax, word ptr ss:[bx+15h]
        sbb     dx, 0
        mov     word ptr es:[si+20h], ax
        mov     word ptr es:[si+22h], dx
        push    0
        push    dx
        push    word ptr es:[si+20h]
        nop
        push    cs
        call    addr_calc_segment
        add     sp, 6
        les     bx, [bp+4]
        les     bx, es:[bx]
        mov     word ptr es:[bx+3ah], ax
        mov     word ptr es:[bx+3ch], dx
        lea     bx, [bp-44h]
        cmp     byte ptr ss:[bx+2ch], 3
        ja      br_3B142
        mov     al, byte ptr [bp-18h]
        sub     ah, ah
        mov     di, ax
        add     di, ax
        mov     ax, word ptr [bp+di-14h]
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+26h], ax
        mov     al, byte ptr [bp-18h]
        sub     ah, ah
        mov     di, ax
        mov     al, byte ptr [bp+di-0ch]
        mov     byte ptr es:[si+12h], al
br_3B142:
        push    1
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+1eh]
        push    word ptr es:[si+1ch]
        callf   EP_SIZE_PARA_ROUND_MUL_SEG:EP_SIZE_PARA_ROUND_MUL_OFF
        add     sp, 6
        les     bx, [bp+4]
        les     bx, es:[bx]
        mov     word ptr es:[bx+0eh], ax
        mov     word ptr es:[bx+10h], dx
        callf   EP_SMEM_FREE_BYTES_SEG:EP_SMEM_FREE_BYTES_OFF
        or      dx, dx
        jge     br_3B17C
        mov     ax, (C1_BASE+L_415CA-C1_SEG*16)
        mov     cx, C1_SEG
        mov     si, ax
        mov     word ptr [bp-6], cx
        jmp     br_3B1CE
        nop
br_3B17C:
        mov     word ptr [bp-4], si
        les     bx, [bp+4]
        les     bx, es:[bx]
        mov     ax, word ptr es:[bx+0ah]
        mov     dx, word ptr es:[bx+0ch]
        add     ax, word ptr es:[bx+0eh]
        adc     dx, word ptr es:[bx+10h]
        cmp     dx, word ptr [C2_W_SMEM_SIZE_HI]
        jl      br_3B1A8
        jg      br_3B1A3
        cmp     ax, word ptr [C0_W_SMEM_SIZE]
        jbe     br_3B1A8
br_3B1A3:
        callf   EP_SMEM_COMPACT_SEG:EP_SMEM_COMPACT_OFF
br_3B1A8:
        les     bx, [bp-4]
        push    word ptr es:[bx+1eh]
        push    word ptr es:[bx+1ch]
        les     bx, [bp+4]
        les     bx, es:[bx]
        push    word ptr es:[bx+0ch]
        push    word ptr es:[bx+0ah]
        callf   EP_FS_READ_TO_SMEM_SEG:EP_FS_READ_TO_SMEM_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-6], dx
br_3B1CE:
        if      FW_VERSION >= 112
        mov     ax, word ptr [bp-6]
        or      ax, si
        jne     br_3B1E5
        endif
        nop
        push    cs
        call    disk_file_close
        jmp     br_3B1E5
        if      FW_VERSION < 112
        nop
        endif
br_3B1DC:
        mov     si, (C1_BASE+msg_sound_dir_full-C1_SEG*16)
        mov     cx, C1_SEG
        mov     word ptr [bp-6], cx
br_3B1E5:
        mov     ax, word ptr [bp-6]
        or      ax, si
        je      br_3B1FE
        les     bx, [bp+4]
        push    word ptr es:[bx+2]
        push    word ptr es:[bx]
        callf   EP_SOUND_LIST_UNLINK_SEG:EP_SOUND_LIST_UNLINK_OFF
        add     sp, 4
br_3B1FE:
        callf   EP_FIELD_HANDLER_NOP_SEG:EP_FIELD_HANDLER_NOP_OFF
        mov     ax, si
        mov     dx, word ptr [bp-6]
        pop     si
        pop     di
        leave
        ret
L_3B20C:
        enter   8, 0
        push    ds
        push    C0_W_098C2
        push    7c00h
        push    0c04h
        xor     ax, ax
        mov     dx, 7c00h
        push    dx
        push    ax
        call    fn_3B610
        add     sp, 0ch
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      br_3B23C
        push    word ptr [bp-6]
        push    ax
        nop
        push    cs
        call    disp_alert_wait_key
        add     sp, 4
        leave
        retf
br_3B23C:
        mov     bx, 7c00h
        mov     es, bx
        xor     bx, bx
        cmp     byte ptr es:[0], 2
        jne     br_3B255
        mov     bx, 1
        cmp     byte ptr es:[1], bl
        je      br_3B269
br_3B255:
        xor     bx, bx
        cmp     byte ptr es:[0], 5
        jne     br_3B272
        mov     bx, 1
        cmp     byte ptr es:[1], bh
        jne     br_3B272
br_3B269:
        mov     byte ptr es:[0cc8h], 0
        jmp     br_3B278
        nop
br_3B272:
        mov     byte ptr es:[0cc8h], 1
br_3B278:
        db      26h, 8ah, 06h, 04h, 00h  ; mov al, byte ptr es:[4]
        sub     dx, dx
        mov     ah, al
        sub     al, al
        sub     ch, ch
        mov     cl, byte ptr es:[3]
        add     ax, cx
        adc     dx, dx
        mov     dh, dl
        mov     dl, ah
        mov     ah, al
        sub     al, al
        mov     cl, byte ptr es:[2]
        add     ax, cx
        adc     dx, 0
        db      26h, 89h, 06h, 00h, 0ch
        mov     word ptr es:[0c02h], dx
        and     byte ptr es:[0cc4h], 0f9h
        callf   EP_FAR_46FAA_SEG:EP_FAR_46FAA_OFF
        leave
        retf
        db      00h
L_3B2B8:
        enter   4, 0
        push    di
        push    si
        mov     word ptr [bp-4], 0
        mov     bx, 7c00h
        mov     word ptr [bp-2], bx
        mov     es, bx
        or      byte ptr es:[0cc4h], 1
        mov     word ptr es:[0cb4h], 0ffffh
        mov     word ptr es:[0cb6h], 0ffffh
        mov     byte ptr es:[0cc6h], bl
        mov     al, byte ptr [bp+6]
        shl     al, 3
        xor     al, byte ptr es:[0cc4h]
        and     ax, 8
        xor     word ptr es:[0cc4h], ax
        xor     ax, ax
        mov     cx, 44h
        mov     bx, 0c28h
        mov     si, es
        push    es
        mov     di, bx
        pop     es
        rep stosw
        nop
        push    cs
        call    disk_media_ready_check
        or      ax, ax
        je      br_3B313
        jmp     br_3B3EA
br_3B313:
        mov     es, si
        test    byte ptr es:[0cc4h], 8
        je      br_3B35E
        callf   EP_PGM_DELETE_ALL_SEG:EP_PGM_DELETE_ALL_OFF
        mov     es, si
        mov     byte ptr es:[0cc6h], 0
        mov     ax, C1_TBL_SOUNDS_END
        mov     cx, ds
        cmp     ax, word ptr [C0_W_098DC]
        jne     loop_3B33B
        cmp     cx, word ptr [C0_W_098DE]
        je      br_3B36A
loop_3B33B:
        push    word ptr [C0_W_098DE]
        push    word ptr [C0_W_098DC]
        callf   EP_SOUND_LIST_UNLINK_SEG:EP_SOUND_LIST_UNLINK_OFF
        add     sp, 4
        mov     ax, C1_TBL_SOUNDS_END
        mov     cx, ds
        cmp     ax, word ptr [C0_W_098DC]
        jne     loop_3B33B
        cmp     cx, word ptr [C0_W_098DE]
        jne     loop_3B33B
        jmp     br_3B36A
br_3B35E:
        callf   EP_PGM_ALLOC_SLOT_SEG:EP_PGM_ALLOC_SLOT_OFF
        mov     es, si
        db      26h, 88h, 06h, 0c6h, 0ch  ; mov byte ptr es:[0cc6h], al
br_3B36A:
        mov     bx, 7c00h
        mov     es, bx
        cmp     byte ptr es:[0cc6h], bl
        jl      br_3B3E2
        db      26h, 8ah, 06h, 0c6h, 0ch  ; mov al, byte ptr es:[0cc6h]
        cbw
        mov     si, ax
        push    ds
        push    C0_W_098C2
        imul    ax, si, 99eh
        add     ax, word ptr [C2_FP_PGM_ARRAY]
        mov     dx, word ptr [C2_W_PGM_ARRAY_SEG]
        push    dx
        push    ax
        call    fn_3B4C0
        add     sp, 8
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        je      br_3B3DC
        mov     ax, C1_SEG
        mov     cx, (C1_BASE+L_3E1AA-C1_SEG*16)
        if      FW_VERSION >= 110
        mov     di, 5bc4h
        else
        mov     di, 5bc8h
        endif
        mov     es, ax
        push    ds
        lds     si, [bp-4]
        xor     ax, ax
        repe cmpsb
        je      br_3B3BA
        sbb     ax, ax
        sbb     ax, 0ffffh
br_3B3BA:
        pop     ds
        or      ax, ax
        jne     br_3B3C8
        callf   EP_TGT_47AC4_SEG:EP_TGT_47AC4_OFF
        pop     si
        pop     di
        leave
        retf
br_3B3C8:
        mov     bx, 7c00h
        mov     es, bx
        db      26h, 8ah, 06h, 0c6h, 0ch  ; mov al, byte ptr es:[0cc6h]
        cbw
        push    ax
        callf   EP_PGM_DELETE_SLOT_SEG:EP_PGM_DELETE_SLOT_OFF
        add     sp, 2
br_3B3DC:
        mov     si, word ptr [bp-4]
        jmp     br_3B3F5
        nop
br_3B3E2:
        mov     ax, (C1_BASE+L_40370-C1_SEG*16)
        mov     cx, C1_SEG
        jmp     br_3B3F0
br_3B3EA:
        mov     ax, (C2_BASE+L_46F9A-C1_SEG*16)
        mov     cx, C1_SEG
br_3B3F0:
        mov     si, ax
        mov     word ptr [bp-2], cx
br_3B3F5:
        mov     ax, word ptr [bp-2]
        or      ax, si
        jne     br_3B402
        call    fn_3B462
        jmp     br_3B40E
        nop
br_3B402:
        push    word ptr [bp-2]
        push    si
        nop
        push    cs
        call    disp_alert_wait_key
        add     sp, 4
br_3B40E:
        callf   EP_FAR_3E99C_SEG:EP_FAR_3E99C_OFF
        pop     si
        pop     di
        leave
        retf
        db      00h
L_3B418:
        enter   4, 0
        push    si
        mov     byte ptr [C0_B_098D5], 32h
        push    ds
        push    C0_W_098C2
        call    fn_3B58A
        add     sp, 4
        mov     si, ax
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     br_3B43A
        call    fn_3B462
        jmp     br_3B45A
br_3B43A:
        mov     bx, 7c00h
        mov     es, bx
        db      26h, 8ah, 06h, 0c6h, 0ch  ; mov al, byte ptr es:[0cc6h]
        cbw
        push    ax
        callf   EP_PGM_DELETE_SLOT_SEG:EP_PGM_DELETE_SLOT_OFF
        add     sp, 2
        push    word ptr [bp-2]
        push    si
        nop
        push    cs
        call    disp_alert_wait_key
        add     sp, 4
br_3B45A:
        callf   EP_FAR_3E99C_SEG:EP_FAR_3E99C_OFF
        pop     si
        leave
        retf
fn_3B462:
        push    si
        mov     bx, 7c00h
        mov     es, bx
        test    byte ptr es:[0cc4h], 8
        jne     br_3B4A0
        callf   EP_FAR_3E8D0_SEG:EP_FAR_3E8D0_OFF
        mov     si, ax
        or      si, ax
        jl      br_3B483
        cmp     si, 3
        jg      br_3B483
        mov     byte ptr [C2_B_PAD_DRUM], al
br_3B483:
        mov     bx, 7c00h
        mov     es, bx
        db      26h, 8ah, 06h, 0c6h, 0ch  ; mov al, byte ptr es:[0cc6h]
        cbw
        push    ax
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        push    ax
        callf   EP_DRUM_PROGRAM_SELECT_SEG:EP_DRUM_PROGRAM_SELECT_OFF
        add     sp, 4
        pop     si
        ret
        nop
br_3B4A0:
        xor     si, si
loop_3B4A2:
        mov     bx, 7c00h
        mov     es, bx
        db      26h, 8ah, 06h, 0c6h, 0ch  ; mov al, byte ptr es:[0cc6h]
        cbw
        push    ax
        push    si
        callf   EP_DRUM_PROGRAM_SELECT_SEG:EP_DRUM_PROGRAM_SELECT_OFF
        add     sp, 4
        inc     si
        cmp     si, 3
        jle     loop_3B4A2
        pop     si
        ret
        db      00h
fn_3B4C0:
        enter   8, 0
        push    si
        mov     ax, word ptr [bp+4]
        mov     dx, word ptr [bp+6]
        mov     bx, 7c00h
        mov     es, bx
        db      26h, 89h, 06h, 0bch, 0ch  ; mov word ptr es:[0cbch], ax
        mov     word ptr es:[0cbeh], dx
        push    0
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        callf   EP_DISK_PROGRESS_MSG_SEG:EP_DISK_PROGRESS_MSG_OFF
        add     sp, 6
        push    0
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        callf   EP_FS_OPEN_SEG:EP_FS_OPEN_OFF
        add     sp, 6
        mov     si, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jne     br_3B57C
        mov     ax, word ptr [bp-6]
        or      ax, si
        jne     br_3B570
        push    10h
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        mov     bx, 7c00h
        mov     es, bx
        db      26h, 8bh, 06h, 0bch, 0ch  ; mov ax, word ptr es:[0cbch]
        mov     dx, word ptr es:[0cbeh]
        add     ax, 2
        push    dx
        push    ax
        nop
        push    cs
        call    __fstrncpy
        add     sp, 0ah
        push    7c00h
        push    0c06h
        push    7c00h
        push    0
        call    fn_3B758
        add     sp, 8
        push    1
        call    fn_3BAA6
        add     sp, 2
        mov     si, ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        jne     br_3B570
        push    7c00h
        push    0c28h
        push    7c00h
        push    0
        mov     bx, 7c00h
        mov     es, bx
        push    word ptr es:[0cbeh]
        push    word ptr es:[0cbch]
        call    fn_3B822
        add     sp, 0ch
br_3B570:
        if      FW_VERSION >= 112
        mov     ax, word ptr [bp-6]
        or      ax, si
        jne     br_3B57C
        endif
        nop
        push    cs
        call    disk_file_close
br_3B57C:
        callf   EP_FIELD_HANDLER_NOP_SEG:EP_FIELD_HANDLER_NOP_OFF
        mov     ax, si
        mov     dx, word ptr [bp-6]
        pop     si
        leave
        ret
        if      FW_VERSION >= 112
        db      00h
        endif
fn_3B58A:
        enter   8, 0
        push    di
        push    si
        mov     di, word ptr [bp+4]
        push    0
        mov     ax, word ptr [bp+6]
        push    ax
        push    di
        mov     si, ax
        callf   EP_DISK_PROGRESS_MSG_SEG:EP_DISK_PROGRESS_MSG_OFF
        add     sp, 6
        push    0
        push    si
        push    di
        callf   EP_FS_OPEN_SEG:EP_FS_OPEN_OFF
        add     sp, 6
        mov     si, ax
        if      FW_VERSION >= 112
        mov     word ptr [bp-6], dx
        else
        mov     word ptr [bp-2], dx
        endif
        or      dx, ax
        jne     br_3B602
        call    fn_3B706
        mov     si, ax
        if      FW_VERSION >= 112
        mov     word ptr [bp-6], dx
        else
        mov     word ptr [bp-2], dx
        endif
        or      dx, ax
        jne     br_3B5F6
        push    0
        call    fn_3BAA6
        add     sp, 2
        mov     si, ax
        if      FW_VERSION >= 112
        mov     word ptr [bp-6], dx
        else
        mov     word ptr [bp-2], dx
        endif
        or      dx, ax
        jne     br_3B5F6
        push    7c00h
        push    0c28h
        push    7c00h
        push    0
        mov     bx, 7c00h
        mov     es, bx
        push    word ptr es:[0cbeh]
        push    word ptr es:[0cbch]
        call    fn_3B822
        add     sp, 0ch
br_3B5F6:
        if      FW_VERSION >= 112
        mov     ax, word ptr [bp-6]
        or      ax, si
        jne     br_3B602
        endif
        nop
        push    cs
        call    disk_file_close
br_3B602:
        callf   EP_FIELD_HANDLER_NOP_SEG:EP_FIELD_HANDLER_NOP_OFF
        mov     ax, si
        if      FW_VERSION >= 112
        mov     dx, word ptr [bp-6]
        else
        mov     dx, word ptr [bp-2]
        endif
        pop     si
        pop     di
        leave
        ret
        if      FW_VERSION < 112
        db      00h
        endif
fn_3B610:
        enter   6, 0
        push    di
        push    si
        mov     word ptr [bp-2], 7dbh
        les     bx, [bp+8]
        mov     word ptr es:[bx], 0c00h
        push    0
        push    word ptr [bp+0eh]
        push    word ptr [bp+0ch]
        callf   EP_FS_OPEN_SEG:EP_FS_OPEN_OFF
        add     sp, 6
        mov     si, ax
        mov     word ptr [bp-4], dx
        or      dx, ax
        je      br_3B63F
        jmp     br_3B6FD
br_3B63F:
        mov     di, word ptr [bp+4]
        push    1
        push    7dbh
        push    word ptr [bp+6]
        push    di
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-4], dx
        or      dx, ax
        je      br_3B65F
        jmp     br_3B6F1
br_3B65F:
        mov     es, word ptr [bp+6]
        cmp     byte ptr es:[di], 2
        je      br_3B67C
        cmp     byte ptr es:[di], 5
        je      br_3B67C
        mov     ax, STR_WRONG_FILE_FORMAT
        mov     cx, C1_SEG
        mov     si, ax
        mov     word ptr [bp-4], cx
        jmp     br_3B6F1
        nop
br_3B67C:
        cmp     byte ptr es:[di], 5
        jne     br_3B69A
        push    1
        push    0
        push    1
        callf   EP_FS_SEEK_SEG:EP_FS_SEEK_OFF
        add     sp, 6
        mov     si, ax
        mov     word ptr [bp-4], dx
        mov     word ptr [bp-2], 7dch
br_3B69A:
        mov     ax, word ptr [bp-4]
        or      ax, si
        jne     br_3B6F1
        push    1
        les     bx, [bp+8]
        mov     ax, word ptr es:[bx]
        sub     ax, word ptr [bp-2]
        push    ax
        mov     ax, di
        mov     dx, word ptr [bp+6]
        add     ax, 7dbh
        push    dx
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     si, ax
        mov     word ptr [bp-4], dx
        or      dx, ax
        jne     br_3B6F1
        mov     es, word ptr [bp+6]
        cmp     byte ptr es:[di], 5
        jne     br_3B6F1
        cmp     byte ptr es:[di+1], 0
        jne     br_3B6F1
        push    1
        push    0
        push    1
        callf   EP_FS_SEEK_SEG:EP_FS_SEEK_OFF
        add     sp, 6
        mov     si, ax
        mov     word ptr [bp-4], dx
        les     bx, [bp+8]
        inc     word ptr es:[bx]
br_3B6F1:
        if      FW_VERSION >= 112
        mov     ax, word ptr [bp-4]
        or      ax, si
        jne     br_3B6FD
        endif
        nop
        push    cs
        call    disk_file_close
br_3B6FD:
        mov     ax, si
        mov     dx, word ptr [bp-4]
        pop     si
        pop     di
        leave
        ret
        if      FW_VERSION < 112
        db      00h
        endif
fn_3B706:
        enter   6, 0
        push    1
        push    2
        lea     ax, [bp-6]
        push    ss
        push    ax
        callf   EP_FS_READ_SEG:EP_FS_READ_OFF
        add     sp, 8
        mov     word ptr [bp-2], dx
        or      dx, ax
        jne     br_3B753
        cmp     byte ptr [bp-6], 6
        je      br_3B736
        mov     ax, STR_WRONG_FILE_FORMAT
        mov     cx, C1_SEG
        mov     word ptr [bp-2], cx
        mov     dx, word ptr [bp-2]
        leave
        ret
br_3B736:
        mov     bx, 7c00h
        mov     es, bx
        or      byte ptr es:[0cc4h], 2
        push    0
        push    0
        push    0c00h
        callf   EP_FS_SEEK_SEG:EP_FS_SEEK_OFF
        add     sp, 6
        mov     word ptr [bp-2], dx
br_3B753:
        mov     dx, word ptr [bp-2]
        leave
        ret
fn_3B758:
        enter   0eh, 0
        push    di
        push    si
        mov     di, word ptr [bp+8]
        xor     bx, bx
        mov     es, word ptr [bp+0ah]
loop_3B766:
        mov     si, di
        mov     byte ptr es:[bx+si], bl
        inc     bx
        cmp     bx, 22h
        jl      loop_3B766
        mov     si, 1
        mov     ax, word ptr [bp+0ah]
loop_3B777:
        mov     bx, di
        mov     es, word ptr [bp+0ah]
        mov     al, byte ptr es:[bx+si]
        cbw
        imul    bx, ax, 3bh
        mov     es, word ptr [bp+6]
        add     bx, word ptr [bp+4]
        cmp     byte ptr es:[bx+5], 0
        jne     br_3B793
        jmp     br_3B815
br_3B793:
        or      si, si
        jle     br_3B815
        mov     word ptr [bp-6], si
loop_3B79A:
        mov     bx, di
        mov     es, word ptr [bp+0ah]
        add     bx, si
        dec     bx
        mov     word ptr [bp-0eh], bx
        mov     word ptr [bp-0ch], es
        mov     al, byte ptr es:[bx]
        cbw
        imul    bx, ax, 3bh
        mov     es, word ptr [bp+6]
        add     bx, word ptr [bp+4]
        mov     word ptr [bp-0ah], bx
        mov     word ptr [bp-8], es
        cmp     byte ptr es:[bx+5], 0
        je      br_3B7ED
        mov     bx, di
        mov     es, word ptr [bp+0ah]
        mov     al, byte ptr es:[bx+si]
        cbw
        imul    bx, ax, 3bh
        add     bx, word ptr [bp+4]
        mov     es, word ptr [bp+6]
        mov     ax, word ptr es:[bx+17h]
        mov     dx, word ptr es:[bx+19h]
        les     bx, [bp-0ah]
        cmp     word ptr es:[bx+19h], dx
        jl      br_3B80F
        jg      br_3B7ED
        cmp     word ptr es:[bx+17h], ax
        jbe     br_3B80F
br_3B7ED:
        mov     bx, di
        mov     es, word ptr [bp+0ah]
        mov     al, byte ptr es:[bx+si]
        mov     byte ptr [bp-3], al
        les     bx, [bp-0eh]
        mov     al, byte ptr es:[bx]
        mov     bx, di
        mov     es, word ptr [bp+0ah]
        mov     byte ptr es:[bx+si], al
        mov     al, byte ptr [bp-3]
        les     bx, [bp-0eh]
        mov     byte ptr es:[bx], al
br_3B80F:
        dec     si
        jne     loop_3B79A
        mov     si, word ptr [bp-6]
br_3B815:
        inc     si
        cmp     si, 22h
        jge     br_3B81E
        jmp     loop_3B777
br_3B81E:
        pop     si
        pop     di
        leave
        ret
fn_3B822:
        enter   14h, 0
        push    di
        push    si
        callf   EP_INT4D_SAMPLE_WRAPPER_SEG:EP_INT4D_SAMPLE_WRAPPER_OFF
        mov     si, ax
        mov     word ptr [bp-12h], dx
        xor     di, di
        mov     ax, dx
        mov     word ptr [bp-14h], si
loop_3B839:
        les     bx, [bp+8]
        add     bx, 7dbh
        mov     al, byte ptr es:[bx+di]
        cbw
        mov     word ptr [bp-10h], ax
        les     bx, [bp-14h]
        mov     cx, ax
        mov     al, byte ptr es:[bx+di]
        cbw
        imul    dx, ax, 18h
        add     dx, word ptr [bp+4]
        mov     bx, word ptr [bp+6]
        sub     dx, 32ah
        mov     si, dx
        mov     word ptr [bp-8], bx
        mov     dx, ax
        add     ax, ax
        add     ax, dx
        add     ax, ax
        add     ax, word ptr [bp+4]
        add     ax, 54ch
        mov     word ptr [bp-0eh], ax
        mov     word ptr [bp-0ch], bx
        imul    ax, cx, 3bh
        add     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        add     ax, 5
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        inc     cx
        jne     br_3B88E
        jmp     br_3B99F
br_3B88E:
        les     bx, [bp-4]
        cmp     byte ptr es:[bx], 0
        jne     br_3B89A
        jmp     br_3B99F
br_3B89A:
        mov     bx, word ptr [bp-10h]
        shl     bx, 2
        add     bx, word ptr [bp+0ch]
        mov     es, word ptr [bp+0eh]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx+2]
        les     bx, [bp-14h]
        mov     cx, ax
        mov     al, byte ptr es:[bx+di]
        cbw
        mov     bx, ax
        shl     bx, 2
        add     bx, word ptr [bp+4]
        mov     es, word ptr [bp+6]
        mov     word ptr es:[bx+752h], cx
        mov     word ptr es:[bx+754h], dx
        push    1
        les     bx, [bp-4]
        push    word ptr es:[bx+26h]
        call    midi_io_chain
        add     sp, 4
        mov     es, word ptr [bp-8]
        mov     byte ptr es:[si+0ah], al
        push    1
        les     bx, [bp-4]
        push    word ptr es:[bx+28h]
        call    midi_io_chain
        add     sp, 4
        mov     es, word ptr [bp-8]
        mov     byte ptr es:[si+0bh], al
        mov     al, 19h
        les     bx, [bp-4]
        imul    byte ptr es:[bx+35h]
        cwd
        and     dx, 1fh
        add     ax, dx
        sar     ax, 5
        les     bx, [bp-0eh]
        mov     byte ptr es:[bx], al
        mov     al, 19h
        les     bx, [bp-4]
        imul    byte ptr es:[bx+36h]
        cwd
        and     dx, 1fh
        add     ax, dx
        sar     ax, 5
        les     bx, [bp-0eh]
        mov     byte ptr es:[bx+1], al
        les     bx, [bp+8]
        cmp     byte ptr es:[bx+1], 0
        je      br_3B97C
        les     bx, [bp-4]
        mov     ax, word ptr es:[bx+1ah]
        add     ax, word ptr es:[bx+1ch]
        mov     es, word ptr [bp-8]
        mov     word ptr es:[si+8], ax
        les     bx, [bp-4]
        mov     al, byte ptr es:[bx+2dh]
        mov     es, word ptr [bp-8]
        mov     byte ptr es:[si+12h], al
        push    1
        les     bx, [bp-4]
        push    word ptr es:[bx+30h]
        call    midi_io_chain
        add     sp, 4
        mov     es, word ptr [bp-8]
        mov     byte ptr es:[si+13h], al
        push    1
        les     bx, [bp-4]
        push    word ptr es:[bx+32h]
        call    midi_io_chain
        add     sp, 4
        mov     es, word ptr [bp-8]
        jmp     br_3B99B
br_3B97C:
        les     bx, [bp-4]
        push    word ptr es:[bx+2ah]
        call    midi_out_io2
        add     sp, 2
        mov     es, word ptr [bp-8]
        mov     word ptr es:[si+8], ax
        mov     byte ptr es:[si+12h], 64h
        xor     al, al
        mov     byte ptr es:[si+13h], al
br_3B99B:
        mov     byte ptr es:[si+14h], al
br_3B99F:
        inc     di
        cmp     di, 22h
        jge     br_3B9A8
        jmp     loop_3B839
br_3B9A8:
        mov     si, word ptr [bp-14h]
        mov     es, word ptr [bp-12h]
        mov     al, byte ptr es:[si]
        les     bx, [bp+4]
        mov     byte ptr es:[bx+13h], al
        mov     al, 18h
        mov     es, word ptr [bp-12h]
        imul    byte ptr es:[si]
        add     ax, word ptr [bp+4]
        mov     dx, word ptr [bp+6]
        sub     ax, 32ah
        mov     di, ax
        mov     word ptr [bp-2], dx
        mov     bx, ax
        mov     es, dx
        mov     byte ptr es:[bx], 3
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[di+1], 0eh
        mov     ax, es
        mov     es, word ptr [bp-12h]
        mov     cl, byte ptr es:[si+1]
        mov     es, ax
        mov     byte ptr es:[di+2], cl
        mov     byte ptr es:[di+3], 2ah
        mov     es, word ptr [bp-12h]
        mov     cl, byte ptr es:[si+2]
        mov     es, ax
        mov     byte ptr es:[di+4], cl
        mov     es, word ptr [bp-12h]
        mov     cl, byte ptr es:[si+1]
        mov     es, ax
        mov     byte ptr es:[di+6], cl
        mov     es, word ptr [bp-12h]
        mov     cl, byte ptr es:[si+2]
        mov     es, ax
        mov     byte ptr es:[di+7], cl
        mov     cl, 1
        mov     byte ptr es:[di+0ch], cl
        mov     byte ptr es:[di+16h], cl
        mov     word ptr [bp-6], 1
        mov     si, word ptr [bp-6]
loop_3BA2B:
        les     bx, [bp+8]
        cmp     byte ptr es:[bx+si+89eh], 0
        jle     br_3BA9B
        les     bx, [bp-14h]
        mov     al, 18h
        imul    byte ptr es:[bx+si+2]
        add     ax, word ptr [bp+4]
        mov     dx, word ptr [bp+6]
        sub     ax, 32ah
        mov     di, ax
        mov     word ptr [bp-2], dx
        les     bx, [bp+8]
        add     bx, 8beh
        cmp     byte ptr es:[bx+si], 1
        jne     br_3BA62
        mov     es, dx
        mov     byte ptr es:[di], 2
        jmp     br_3BA69
br_3BA62:
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[di], 1
br_3BA69:
        les     bx, [bp+8]
        mov     al, byte ptr es:[bx+si+89eh]
        cbw
        mov     bx, ax
        add     bx, word ptr [bp-14h]
        mov     es, word ptr [bp-12h]
        mov     al, byte ptr es:[bx+1]
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[di+2], al
        les     bx, [bp+8]
        add     bx, 8deh
        mov     al, byte ptr es:[bx+si]
        mov     es, word ptr [bp-2]
        mov     byte ptr es:[di+1], al
        mov     byte ptr es:[di+3], 7fh
br_3BA9B:
        inc     si
        cmp     si, 20h
        jl      loop_3BA2B
        pop     si
        pop     di
        leave
        ret
        db      00h
fn_3BAA6:
        enter   10h, 0
        push    di
        push    si
        sub     ax, ax
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], 7c00h
        cmp     byte ptr [bp+4], al
        je      br_3BACE
        mov     bx, 7c00h
        mov     es, bx
        db      26h, 88h, 06h, 0c7h, 0ch  ; mov byte ptr es:[0cc7h], al
        jmp     br_3BBB2
br_3BACE:
        mov     bx, 7c00h
        mov     es, bx
        test    byte ptr es:[0cc4h], 4
        jne     br_3BADE
        jmp     br_3BBB2
br_3BADE:
        push    ax
        db      26h, 8bh, 06h, 0c0h, 0ch  ; mov ax, word ptr es:[0cc0h]
        mov     dx, word ptr es:[0cc2h]
        mov     si, ax
        mov     word ptr [bp-0ah], dx
        push    dx
        push    ax
        callf   EP_DISK_PROGRESS_MSG_SEG:EP_DISK_PROGRESS_MSG_OFF
        add     sp, 6
        lea     ax, [bp-4]
        push    ss
        push    ax
        callf   EP_TGT_47916_SEG:EP_TGT_47916_OFF
        add     sp, 4
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      br_3BB12
        jmp     br_3BBA8
br_3BB12:
        mov     bx, 7c00h
        mov     es, bx
        db      26h, 8bh, 06h, 0b2h, 0ch  ; mov ax, word ptr es:[0cb2h]
        or      ax, word ptr es:[0cb0h]
        je      br_3BB52
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        push    word ptr es:[0cb2h]
        push    word ptr es:[0cb0h]
        callf   EP_PGM_REPLACE_SOUND_REF_SEG:EP_PGM_REPLACE_SOUND_REF_OFF
        add     sp, 8
        mov     bx, 7c00h
        mov     es, bx
        push    word ptr es:[0cb2h]
        push    word ptr es:[0cb0h]
        callf   EP_SOUND_LIST_UNLINK_SEG:EP_SOUND_LIST_UNLINK_OFF
        add     sp, 4
br_3BB52:
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        mov     bx, 7c00h
        mov     es, bx
        db      26h, 89h, 06h, 0b0h, 0ch  ; mov word ptr es:[0cb0h], ax
        mov     word ptr es:[0cb2h], dx
        mov     es, word ptr [bp-0ah]
        mov     ax, word ptr es:[si+12h]
        mov     dx, word ptr es:[si+14h]
        mov     es, bx
        db      26h, 89h, 06h, 0b4h, 0ch  ; mov word ptr es:[0cb4h], ax
        mov     word ptr es:[0cb6h], dx
        db      26h, 8bh, 06h, 0b0h, 0ch  ; mov ax, word ptr es:[0cb0h]
        mov     dx, word ptr es:[0cb2h]
        mov     cx, ax
        db      26h, 8ah, 06h, 0c7h, 0ch  ; mov al, byte ptr es:[0cc7h]
        cbw
        mov     bx, ax
        mov     si, 0c06h
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     bx, ax
        shl     bx, 2
        mov     si, 0c28h
        mov     word ptr es:[bx+si], cx
        mov     word ptr es:[bx+si+2], dx
br_3BBA8:
        mov     bx, 7c00h
        mov     es, bx
        inc     byte ptr es:[0cc7h]
br_3BBB2:
        mov     ax, word ptr [bp-6]
        or      ax, word ptr [bp-8]
        je      br_3BBBD
        jmp     br_3BD34
br_3BBBD:
        db      26h, 8ah, 06h, 0c7h, 0ch  ; mov al, byte ptr es:[0cc7h]
        cbw
        mov     si, ax
        mov     word ptr [bp-2], ax
        cmp     si, 22h
        jl      br_3BBD2
        mov     di, ax
        jmp     br_3BD28
br_3BBD2:
        mov     word ptr [bp-2], si
        mov     di, si
loop_3BBD7:
        mov     bx, di
        mov     ax, 0c06h
        mov     dx, 7c00h
        add     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx]
        cbw
        imul    bx, ax, 3bh
        mov     ax, 5
        add     bx, ax
        mov     si, bx
        mov     word ptr [bp-0ah], es
        cmp     byte ptr es:[bx], dl
        jne     br_3BBFC
        jmp     br_3BD1F
br_3BBFC:
        push    0
        push    dx
        push    bx
        callf   EP_DISK_PROGRESS_MSG_SEG:EP_DISK_PROGRESS_MSG_OFF
        add     sp, 6
        push    word ptr [bp-0ah]
        push    si
        push    7c00h
        push    0cb0h
        callf   EP_FAR_3FE9E_SEG:EP_FAR_3FE9E_OFF
        add     sp, 8
        or      ax, ax
        jne     br_3BC2D
        mov     bx, 7c00h
        mov     es, bx
        db      26h, 89h, 06h, 0b2h, 0ch  ; mov word ptr es:[0cb2h], ax
        db      26h, 89h, 06h, 0b0h, 0ch  ; mov word ptr es:[0cb0h], ax
br_3BC2D:
        mov     bx, 7c00h
        mov     es, bx
        db      26h, 8bh, 06h, 0b4h, 0ch  ; mov ax, word ptr es:[0cb4h]
        mov     dx, word ptr es:[0cb6h]
        mov     es, word ptr [bp-0ah]
        cmp     word ptr es:[si+14h], dx
        jge     br_3BC48
        jmp     br_3BCF8
br_3BC48:
        jg      br_3BC53
        cmp     word ptr es:[si+12h], ax
        ja      br_3BC53
        jmp     br_3BCF8
br_3BC53:
        cmp     byte ptr [C0_B_0D7C9], 0
        jne     br_3BC6B
        mov     bx, 7c00h
        mov     es, bx
        db      26h, 8bh, 06h, 0b2h, 0ch  ; mov ax, word ptr es:[0cb2h]
        or      ax, word ptr es:[0cb0h]
        jne     br_3BCDE
br_3BC6B:
        push    word ptr [bp-0ah]
        push    si
        lea     ax, [bp-10h]
        push    ss
        push    ax
        callf   EP_FAR_4756A_SEG:EP_FAR_4756A_OFF
        add     sp, 8
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      br_3BC89
        jmp     br_3BD28
br_3BC89:
        mov     bx, 7c00h
        mov     es, bx
        db      26h, 8bh, 06h, 0b2h, 0ch  ; mov ax, word ptr es:[0cb2h]
        or      ax, word ptr es:[0cb0h]
        je      br_3BCC9
        push    word ptr [bp-0eh]
        push    word ptr [bp-10h]
        push    word ptr es:[0cb2h]
        push    word ptr es:[0cb0h]
        callf   EP_PGM_REPLACE_SOUND_REF_SEG:EP_PGM_REPLACE_SOUND_REF_OFF
        add     sp, 8
        mov     bx, 7c00h
        mov     es, bx
        push    word ptr es:[0cb2h]
        push    word ptr es:[0cb0h]
        callf   EP_SOUND_LIST_UNLINK_SEG:EP_SOUND_LIST_UNLINK_OFF
        add     sp, 4
br_3BCC9:
        mov     ax, word ptr [bp-10h]
        mov     dx, word ptr [bp-0eh]
        mov     bx, 7c00h
        mov     es, bx
        db      26h, 89h, 06h, 0b0h, 0ch  ; mov word ptr es:[0cb0h], ax
        mov     word ptr es:[0cb2h], dx
br_3BCDE:
        mov     es, word ptr [bp-0ah]
        mov     ax, word ptr es:[si+12h]
        mov     dx, word ptr es:[si+14h]
        mov     bx, 7c00h
        mov     es, bx
        db      26h, 89h, 06h, 0b4h, 0ch  ; mov word ptr es:[0cb4h], ax
        mov     word ptr es:[0cb6h], dx
br_3BCF8:
        mov     bx, 7c00h
        mov     es, bx
        db      26h, 8bh, 06h, 0b0h, 0ch  ; mov ax, word ptr es:[0cb0h]
        mov     dx, word ptr es:[0cb2h]
        mov     bx, 0c06h
        mov     cx, ax
        mov     al, byte ptr es:[bx+di]
        cbw
        mov     bx, ax
        shl     bx, 2
        mov     si, 0c28h
        mov     word ptr es:[bx+si], cx
        mov     word ptr es:[bx+si+2], dx
br_3BD1F:
        inc     di
        cmp     di, 22h
        jge     br_3BD28
        jmp     loop_3BBD7
br_3BD28:
        mov     ax, di
        mov     bx, 7c00h
        mov     es, bx
        db      26h, 88h, 06h, 0c7h, 0ch  ; mov byte ptr es:[0cc7h], al
br_3BD34:
        mov     ax, word ptr [bp-8]
        mov     dx, word ptr [bp-6]
        pop     si
        pop     di
        leave
        ret
midi_out_io2:
        push    bp
        mov     bp, sp
        push    di
        mov     di, word ptr [bp+4]
        mov     cx, 0ff88h
        mov     bx, 146h
loop_3BD4B:
        cmp     word ptr [bx], di
        jg      br_3BD54
        cmp     word ptr [bx+2], di
        jg      br_3BD60
br_3BD54:
        add     bx, 2
        inc     cx
        cmp     cx, 3ch
        jl      loop_3BD4B
        jmp     br_3BD66
        db      90h
br_3BD60:
        mov     ax, cx
        pop     di
        leave
        ret
        db      90h
br_3BD66:
        xor     ax, ax
        pop     di
        leave
        ret
        db      00h
midi_io_chain:
        push    bp
        mov     bp, sp
        cmp     word ptr [bp+6], 0
        je      br_3BD82
        mov     ax, word ptr [bp+4]
        add     ax, ax
        push    ax
        call    midi_out_io3
        mov     sp, bp
        leave
        ret
br_3BD82:
        mov     bx, word ptr [bp+4]
        mov     ax, bx
        imul    bx
        inc     ax
        cwd
        sub     ax, dx
        sar     ax, 1
        leave
        ret
        db      00h
midi_out_io3:
        push    bp
        mov     bp, sp
        push    di
        mov     cx, word ptr [bp+4]
        cmp     cx, 1
        ja      br_3BDA4
        mov     ax, cx
        pop     di
        leave
        ret
        nop
br_3BDA4:
        mov     bx, cx
        shr     bx, 1
        mov     di, 9
loop_3BDAB:
        mov     ax, word ptr [bp+4]
        sub     dx, dx
        div     bx
        add     ax, bx
        shr     ax, 1
        mov     bx, ax
        dec     di
        jne     loop_3BDAB
        pop     di
        leave
        ret
ui_field_engine:                        ; ([bp+6] desc, [bp+0Ah] value) -> FE_* + handlers
        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     di, word ptr [bp+0ah]
        mov     si, word ptr [bp+6]
        mov     ax, word ptr [bp+8]
        mov     word ptr [FE_DESC], si
        if      FW_VERSION >= 110
        mov     word ptr [FE_DESC+2], ax
        else
        mov     word ptr [C0_W_08B1C], ax
        endif
        mov     cx, word ptr [bp+0ch]
        mov     word ptr [FE_VALUE], di
        if      FW_VERSION >= 114
        mov     word ptr [FE_VALUE+2], cx
        else
        mov     word ptr [C0_W_08B20], cx
        endif
        and     byte ptr [FE_FLAGS], 0feh
        mov     es, ax
        mov     al, byte ptr es:[si+FIELD_DIGITS]
        sub     ah, ah
        dec     ax
        push    ax
        callf   EP_POW10_LOOKUP_SEG:EP_POW10_LOOKUP_OFF                    ; = 0x3EEB8 pow10_lookup
        add     sp, 2
        mov     word ptr [FE_SCALE], ax
        if      FW_VERSION >= 110
        mov     word ptr [FE_SCALE+2], dx
        else
        mov     word ptr [C0_W_08B28], dx
        endif
        mov     byte ptr [FE_DIGIT], 0
        and     byte ptr [FE_FLAGS], 0fdh
        mov     ax, word ptr [bp+0ch]
        or      ax, di
        je      br_3BE5E
        mov     es, word ptr [bp+8]
        mov     ax, word ptr es:[si+FIELD_STORE]
        sub     ax, 4100h
        je      br_3BE4E
        push    ds
        push    HANDLERS_NUMERIC
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF                    ; = 0x3E8B4 handler_set_install
        add     sp, 4
        mov     es, word ptr [bp+8]
        test    byte ptr es:[si+FIELD_STORE_FLAGS], 10h
        je      br_3BE42
        push    EP_FIELD_SLIDER_SET_SEG
        push    EP_FIELD_SLIDER_SET_OFF
        push    79h
        callf   EP_HANDLER_INSTALL_ONE_SEG:EP_HANDLER_INSTALL_ONE_OFF
        add     sp, 6
        jmp     SHORT L_3BE6A
        nop
br_3BE42:
        push    79h
        callf   EP_L_3E8EC_SEG:EP_L_3E8EC_OFF
        add     sp, 2
        jmp     SHORT L_3BE6A
br_3BE4E:
        push    word ptr [bp+0ch]
        push    di
        push    es
        push    si
        call    ui_field_engine_4100
        add     sp, 8
        pop     si
        pop     di
        leave
        retf
br_3BE5E:
        push    ds
        push    HANDLERS_RDONLY
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF                    ; = 0x3E8B4 handler_set_install
        add     sp, 4
L_3BE6A:
        push    ds
        push    HANDLERS_POST
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF                    ; = 0x3E8B4 handler_set_install
        add     sp, 4
        pop     si
        pop     di
        leave
        retf
; HANDLERS_NUMERIC reaches the four routines below by far32 only.
field_slider_set:                       ; 0..7Fh -> FIELD_MIN..FIELD_MAX; slider ?
        enter   8, 0
        push    ax
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        and     byte ptr [FE_FLAGS], 0feh
        call    field_value_load
        push    0
        push    7fh
        push    0
        push    word ptr [bp-0ah]
        les     bx, [FE_DESC]
        mov     ax, word ptr es:[bx+FIELD_MAX]
        if      FW_VERSION >= 114
        mov     dx, word ptr es:[bx+FIELD_MAX+2]
        sub     ax, word ptr es:[bx+FIELD_MIN]
        sbb     dx, word ptr es:[bx+FIELD_MIN+2]
        else
        mov     dx, word ptr es:[bx+0ch]
        sub     ax, word ptr es:[bx+FIELD_MIN]
        sbb     dx, word ptr es:[bx+8]
        endif
        push    dx
        push    ax
        callf   EP_MULDIV32_SEG:EP_MULDIV32_OFF
        add     sp, 0ch
        les     bx, [FE_DESC]
        add     ax, word ptr es:[bx+FIELD_MIN]
        if      FW_VERSION >= 114
        adc     dx, word ptr es:[bx+FIELD_MIN+2]
        else
        adc     dx, word ptr es:[bx+8]
        endif
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        mov     ax, word ptr [FE_COMMITTED]
        if      FW_VERSION >= 110
        mov     dx, word ptr [FE_COMMITTED+2]
        else
        mov     dx, word ptr [C0_W_08B24]
        endif
        cmp     word ptr [bp-4], ax
        jne     br_3BED9
        cmp     word ptr [bp-2], dx
        je      L_3BF1C
br_3BED9:
        mov     ax, word ptr [FE_VALUE]
        if      FW_VERSION >= 114
        mov     dx, word ptr [FE_VALUE+2]
        else
        mov     dx, word ptr [C0_W_08B20]
        endif
        mov     cl, byte ptr es:[bx+FIELD_STORE]
        and     cx, 0fh
        push    ds
        mov     di, ax
        lea     si, [bp-4]
        mov     es, dx
        push    ss
        pop     ds
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        les     bx, [FE_DESC]
        mov     ax, word ptr es:[bx+FIELD_NOTIFY]
        if      FW_VERSION >= 114
        mov     dx, word ptr es:[bx+FIELD_NOTIFY+2]
        else
        mov     dx, word ptr es:[bx+24h]
        endif
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        or      dx, ax
        je      L_3BF1C
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        callf   [bp-8]
        add     sp, 4
L_3BF1C:
        pop     ds
        pop     si
        pop     di
        leave
        retf
xl_field_clamp_decrement:
        db      00h
field_wheel_down:                       ; wheel: FE_COMMITTED - FE_SCALE*d, clamp FIELD_MIN
        enter   6, 0
        push    ax
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        les     bx, [FE_DESC]
        mov     ax, word ptr es:[bx+FIELD_STORE]
        mov     word ptr [bp-2], ax
        and     byte ptr [FE_FLAGS], 0feh
        sub     ax, 4200h
        jne     br_3BF47
        jmp     br_3C000
br_3BF47:
        mov     al, byte ptr [FE_DIGIT]
        sub     ah, ah
        push    ax
        callf   EP_POW10_LOOKUP_SEG:EP_POW10_LOOKUP_OFF                    ; = 0x3EEB8 pow10_lookup
        add     sp, 2
        push    dx
        push    ax
        push    0
        push    word ptr [bp-8]
        nop
        push    cs
        call    __aFlmul
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-4], dx
        call    field_value_load
        mov     ax, word ptr [FE_COMMITTED]
        if      FW_VERSION >= 110
        mov     dx, word ptr [FE_COMMITTED+2]
        else
        mov     dx, word ptr [C0_W_08B24]
        endif
        sub     ax, word ptr [bp-6]
        sbb     dx, word ptr [bp-4]
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-4], dx
        if      FW_VERSION >= 110
        cmp     dx, word ptr [FE_COMMITTED+2]
        else
        cmp     dx, word ptr [C0_W_08B24]
        endif
        jg      br_3BF9D
        jl      br_3BF8B
        cmp     ax, word ptr [FE_COMMITTED]
        ja      br_3BF9D
br_3BF8B:
        les     bx, [FE_DESC]
        if      FW_VERSION >= 114
        cmp     word ptr es:[bx+FIELD_MIN+2], dx
        else
        cmp     word ptr es:[bx+8], dx
        endif
        jl      br_3BFAF
        jg      br_3BF9D
        cmp     word ptr es:[bx+FIELD_MIN], ax
        jbe     br_3BFAF
br_3BF9D:
        les     bx, [FE_DESC]
        mov     ax, word ptr es:[bx+FIELD_MIN]
        if      FW_VERSION >= 114
        mov     dx, word ptr es:[bx+FIELD_MIN+2]
        else
        mov     dx, word ptr es:[bx+8]
        endif
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-4], dx
br_3BFAF:
        mov     ax, word ptr [FE_COMMITTED]
        if      FW_VERSION >= 110
        mov     dx, word ptr [FE_COMMITTED+2]
        else
        mov     dx, word ptr [C0_W_08B24]
        endif
        cmp     word ptr [bp-6], ax
        jne     br_3BFC0
        cmp     word ptr [bp-4], dx
        je      X_3C00D
br_3BFC0:
        mov     ax, word ptr [FE_VALUE]
        if      FW_VERSION >= 114
        mov     dx, word ptr [FE_VALUE+2]
        else
        mov     dx, word ptr [C0_W_08B20]
        endif
        mov     cl, byte ptr [bp-2]
        and     cx, 0fh
        push    ds
        mov     di, ax
        lea     si, [bp-6]
        mov     es, dx
        push    ss
        pop     ds
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        les     bx, [FE_DESC]
        if      FW_VERSION >= 114
        mov     ax, word ptr es:[bx+FIELD_NOTIFY+2]
        else
        mov     ax, word ptr es:[bx+24h]
        endif
        or      ax, word ptr es:[bx+FIELD_NOTIFY]
        je      X_3C00D
        push    word ptr [bp-4]
        push    word ptr [bp-6]
        db      26h, 0ffh, 5fh, 22h
        add     sp, 4
        pop     ds
        pop     si
        pop     di
        leave
        retf
br_3C000:
        push    word ptr [bp-8]
        push    es
        push    bx
        callf   EP_L_4833C_SEG:EP_L_4833C_OFF
        add     sp, 6
X_3C00D:
        pop     ds
        pop     si
        pop     di
        leave
        retf
field_wheel_up:                         ; wheel: FE_COMMITTED + FE_SCALE*d, clamp FIELD_MAX
        enter   4, 0
        push    ax
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        les     bx, [FE_DESC]
        mov     cx, word ptr es:[bx+FIELD_STORE]
        and     byte ptr [FE_FLAGS], 0feh
        mov     ax, cx
        sub     ax, 4200h
        jne     br_3C036
        jmp     br_3C0EE
br_3C036:
        mov     al, byte ptr [FE_DIGIT]
        sub     ah, ah
        push    ax
        callf   EP_POW10_LOOKUP_SEG:EP_POW10_LOOKUP_OFF                    ; = 0x3EEB8 pow10_lookup
        add     sp, 2
        push    dx
        push    ax
        push    0
        push    word ptr [bp-6]
        nop
        push    cs
        call    __aFlmul
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        call    field_value_load
        mov     ax, word ptr [FE_COMMITTED]
        if      FW_VERSION >= 110
        mov     dx, word ptr [FE_COMMITTED+2]
        else
        mov     dx, word ptr [C0_W_08B24]
        endif
        add     word ptr [bp-4], ax
        adc     word ptr [bp-2], dx
        cmp     word ptr [bp-2], dx
        jl      br_3C08A
        jg      br_3C072
        cmp     word ptr [bp-4], ax
        jb      br_3C08A
br_3C072:
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        les     bx, [FE_DESC]
        if      FW_VERSION >= 114
        cmp     word ptr es:[bx+FIELD_MAX+2], dx
        else
        cmp     word ptr es:[bx+0ch], dx
        endif
        jg      br_3C09C
        jl      br_3C08A
        cmp     word ptr es:[bx+FIELD_MAX], ax
        jae     br_3C09C
br_3C08A:
        les     bx, [FE_DESC]
        mov     ax, word ptr es:[bx+FIELD_MAX]
        if      FW_VERSION >= 114
        mov     dx, word ptr es:[bx+FIELD_MAX+2]
        else
        mov     dx, word ptr es:[bx+0ch]
        endif
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
br_3C09C:
        mov     ax, word ptr [FE_COMMITTED]
        if      FW_VERSION >= 110
        mov     dx, word ptr [FE_COMMITTED+2]
        else
        mov     dx, word ptr [C0_W_08B24]
        endif
        cmp     word ptr [bp-4], ax
        jne     br_3C0AD
        cmp     word ptr [bp-2], dx
        je      X_3C0FB
br_3C0AD:
        mov     ax, word ptr [FE_VALUE]
        if      FW_VERSION >= 114
        mov     dx, word ptr [FE_VALUE+2]
        else
        mov     dx, word ptr [C0_W_08B20]
        endif
        mov     cl, byte ptr es:[bx+FIELD_STORE]
        and     cx, 0fh
        push    ds
        mov     di, ax
        lea     si, [bp-4]
        mov     es, dx
        push    ss
        pop     ds
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        les     bx, [FE_DESC]
        if      FW_VERSION >= 114
        mov     ax, word ptr es:[bx+FIELD_NOTIFY+2]
        else
        mov     ax, word ptr es:[bx+24h]
        endif
        or      ax, word ptr es:[bx+FIELD_NOTIFY]
        je      X_3C0FB
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        db      26h, 0ffh, 5fh, 22h
        add     sp, 4
        pop     ds
        pop     si
        pop     di
        leave
        retf
br_3C0EE:
        push    word ptr [bp-6]
        push    es
        push    bx
        callf   EP_L_482AE_SEG:EP_L_482AE_OFF
        add     sp, 6
X_3C0FB:
        pop     ds
        pop     si
        pop     di
        leave
        retf
field_digit_accumulate:                 ; DIGIT key -> FE_PENDING; FLAGS bit 40h refuses
        push    bp
        mov     bp, sp
        push    ax
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        les     bx, [FE_DESC]
        test    byte ptr es:[bx+FIELD_STORE_FLAGS], 40h
        je      br_3C11E
        and     byte ptr [FE_FLAGS], 0fdh
        pop     ds
        leave
        retf
        nop
br_3C11E:
        call    field_value_load
        test    byte ptr [FE_FLAGS], 1
        jne     br_3C13C
        or      byte ptr [FE_FLAGS], 1
        mov     ax, word ptr [bp-2]
        cwd
        mov     word ptr [C2_W_FE_PENDING_LO], ax
        mov     word ptr [C2_W_FE_PENDING_HI], dx
        pop     ds
        leave
        retf
        nop
br_3C13C:
        if      FW_VERSION >= 110
        push    word ptr [FE_SCALE+2]
        else
        push    word ptr [C0_W_08B28]
        endif
        push    word ptr [FE_SCALE]
        push    word ptr [C2_W_FE_PENDING_HI]
        push    word ptr [C2_W_FE_PENDING_LO]
        nop
        push    cs
        call    __aFlrem
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
        mov     cx, ax
        mov     ax, word ptr [bp-2]
        mov     bx, dx
        cwd
        add     cx, ax
        adc     bx, dx
        mov     word ptr [C2_W_FE_PENDING_LO], cx
        mov     word ptr [C2_W_FE_PENDING_HI], bx
        pop     ds
        leave
        retf
field_value_load:                       ; FE_VALUE -> FE_COMMITTED, low-nibble bytes
        enter   2, 0
        push    di
        push    si
        les     si, [FE_DESC]
        mov     bx, word ptr es:[si+FIELD_STORE]
        or      bx, bx
        jge     br_3C1BC
        mov     al, bl
        and     al, 0fh
        cmp     al, 1
        jne     br_3C1AA
        les     bx, [FE_VALUE]
        mov     al, byte ptr es:[bx]
        cbw
loop_3C19E:
        cwd
        mov     word ptr [FE_COMMITTED], ax
        if      FW_VERSION >= 110
        mov     word ptr [FE_COMMITTED+2], dx
        else
        mov     word ptr [C0_W_08B24], dx
        endif
        pop     si
        pop     di
        leave
        ret
br_3C1AA:
        mov     al, bl
        and     al, 0fh
        cmp     al, 2
        jne     br_3C1E7
        les     bx, [FE_VALUE]
        mov     ax, word ptr es:[bx]
        jmp     SHORT loop_3C19E
        nop
br_3C1BC:
        mov     word ptr [bp-2], bx
        sub     ax, ax
        if      FW_VERSION >= 110
        mov     word ptr [FE_COMMITTED+2], ax
        else
        mov     word ptr [C0_W_08B24], ax
        endif
        mov     word ptr [FE_COMMITTED], ax
        mov     ax, word ptr [FE_VALUE]
        if      FW_VERSION >= 114
        mov     dx, word ptr [FE_VALUE+2]
        else
        mov     dx, word ptr [C0_W_08B20]
        endif
        mov     cl, byte ptr [bp-2]
        and     cx, 0fh
        push    ds
        mov     di, FE_COMMITTED
        mov     si, ax
        push    ds
        pop     es
        mov     ds, dx
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
br_3C1E7:
        pop     si
        pop     di
        leave
        ret
        db      00h
ui_field_engine_4100:                   ; FIELD_STORE 4100h: latch FE_*, install DS:1274h
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp+4]
        mov     dx, word ptr [bp+6]
        mov     word ptr [FE_DESC], ax
        if      FW_VERSION >= 110
        mov     word ptr [FE_DESC+2], dx
        else
        mov     word ptr [C0_W_08B1C], dx
        endif
        mov     ax, word ptr [bp+8]
        mov     dx, word ptr [bp+0ah]
        mov     word ptr [FE_VALUE], ax
        if      FW_VERSION >= 114
        mov     word ptr [FE_VALUE+2], dx
        else
        mov     word ptr [C0_W_08B20], dx
        endif
        push    ds
        push    C0_W_01274
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF                    ; = 0x3E8B4 handler_set_install
        leave
        ret
L_3B8DA:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    7fh
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        call    fn_3C244
        add     sp, 6
        pop     ds
        retf
L_3B8F2:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    0
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        call    fn_3C244
        add     sp, 6
        pop     ds
        retf
fn_3C244:
        enter   0ch, 0
        push    si
        mov     ax, word ptr [bp+4]
        mov     dx, word ptr [bp+6]
        add     ax, 12h
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     al, byte ptr [C0_B_0D7D6]
        cbw
        db      "Ht$HtMHt`Ht{+"
        ror     byte ptr [bx+di+C0_TBL_0FA46], 89h
        inc     si
        clc
        mov     es, dx
        mov     ax, word ptr es:[si+1ch]
        mov     dx, word ptr es:[si+1eh]
loop_3C279:
        mov     word ptr [bp-0ch], ax
        mov     word ptr [bp-0ah], dx
        jmp     br_3C305
        mov     al, byte ptr [C0_B_0D7DD]
        cbw
        mov     bx, ax
        shl     bx, 2
        mov     ax, word ptr [bx+C0_TBL_08E72]
        mov     dx, word ptr [bx+C0_TBL_08E74]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     cx, word ptr [bx+C0_TBL_08E76]
        mov     si, word ptr [bx+C0_TBL_08E78]
        sub     cx, ax
        sbb     si, dx
        mov     word ptr [bp-0ch], cx
        mov     word ptr [bp-0ah], si
        jmp     br_3C305
        nop
        sub     ax, ax
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-8], ax
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+14h]
        mov     dx, word ptr es:[si+16h]
        jmp     loop_3C279
        nop
        sub     ax, ax
        mov     word ptr [bp-6], ax
        mov     word ptr [bp-8], ax
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+18h]
        mov     dx, word ptr es:[si+1ah]
        sub     ax, word ptr es:[si+20h]
        sbb     dx, word ptr es:[si+22h]
        jmp     loop_3C279
        nop
        mov     es, word ptr [bp-2]
        mov     ax, word ptr es:[si+18h]
        mov     dx, word ptr es:[si+1ah]
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     cx, word ptr es:[si+1ch]
        mov     bx, word ptr es:[si+1eh]
        sub     cx, ax
        sbb     bx, dx
        mov     word ptr [bp-0ch], cx
        mov     word ptr [bp-0ah], bx
br_3C305:
        push    word ptr [bp+8]
        push    word ptr [bp-0ah]
        push    word ptr [bp-0ch]
        push    word ptr [bp-6]
        push    word ptr [bp-8]
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        callf   EP_L_41EBC_SEG:EP_L_41EBC_OFF
        add     sp, 0eh
        pop     si
        leave
        ret
        db      00h
sound_spec_paint:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    EP_FS_OPEN_SEG
        push    EP_L_4C162_OFF
        callf   EP_SMEM_PROC_WRAPPER_SEG:EP_SMEM_PROC_WRAPPER_OFF
        add     sp, 4
        push    ds
        push    C0_W_020BE
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        les     bx, [C0_W_0D7C2]
        cmp     byte ptr es:[bx+SND_STEREO], 0
        je      br_3C35C
        mov     ax, (C2_BASE+far_49A8C-C1_SEG*16)
        mov     dx, C1_SEG
        jmp     SHORT br_3C362
        nop
br_3C35C:
        mov     ax, (C2_BASE+L_4C168_120-C1_SEG*16)
        mov     dx, C1_SEG
br_3C362:
        push    dx
        push    ax
        push    27h
        push    43h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        push    5
        les     bx, [C0_W_0D7C2]
        push    0
        push    word ptr es:[bx+SND_RATE]
        push    1eh
        push    0afh
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        push    27h
        push    0a9h
        call    fn_3C3EE
        add     sp, 8
        les     bx, [C0_W_0D7C2]
        test    byte ptr es:[bx+SND_FLAGS_HI], 1
        je      br_3C3BC
        push    EP_FS_OPEN_SEG
        push    EP_L_4C16E_OFF
        push    0dh
        push    25h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        pop     ds
        retf
        nop
br_3C3BC:
        push    C1_SEG
        push    EP_L_4B98A_OFF
        push    0dh
        push    25h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        add     ax, 12h
        push    dx
        push    ax
        push    0dh
        push    67h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        retf
        db      00h
fn_3C3EE:
        enter   4, 0
        push    di
        push    si
        if      FW_VERSION < 110
        mov     si, word ptr [bp+8]
        endif
        push    0
        push    200h
        if      FW_VERSION >= 110
        les     bx, [bp+8]
        push    word ptr es:[bx+10h]
        push    word ptr es:[bx+0eh]
        else
        mov     es, word ptr [bp+0ah]
        push    word ptr es:[si+10h]
        push    word ptr es:[si+0eh]
        mov     di, es
        endif
        nop
        push    cs
        call    __aFldiv
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        if      FW_VERSION >= 110
        or      dx, dx
        else
        mov     es, di
        cmp     byte ptr es:[si+25h], 0
        je      L_3B4E9
        shl     word ptr [bp-4], 1
        rcl     word ptr [bp-2], 1
L_3B4E9:
        cmp     word ptr [bp-2], 0
        endif
        jg      br_3C436
        jl      br_3C41A
        if      FW_VERSION >= 110
        cmp     ax, 2710h
        else
        cmp     word ptr [bp-4], 2710h
        endif
        jae     br_3C436
br_3C41A:
        mov     di, word ptr [bp+6]
        mov     si, word ptr [bp+4]
        push    4
        if      FW_VERSION >= 110
        push    dx
        push    ax
        else
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        endif
        push    di
        push    si
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    EP_FS_OPEN_SEG
        push    EP_L_4C196_OFF
        jmp     br_3C4AC
br_3C436:
        mov     di, word ptr [bp+6]
        mov     si, word ptr [bp+4]
        push    2
        push    0
        push    400h
        if      FW_VERSION >= 110
        push    dx
        push    ax
        else
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        endif
        nop
        push    cs
        call    __aFldiv
        push    dx
        push    ax
        push    di
        push    si
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    2eh
        push    di
        lea     ax, [si+0ch]
        push    ax
        nop
        push    cs
        call    draw_char_at
        add     sp, 6
        push    1
        push    0
        push    400h
        push    0
        push    400h
        push    word ptr [bp-2]
        push    word ptr [bp-4]
        nop
        push    cs
        call    __aFlrem
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
        push    dx
        push    ax
        push    di
        lea     ax, [si+12h]
        push    ax
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    C1_SEG
        if      FW_VERSION >= 114
        push    (C2_BASE+L_4C19E-C1_SEG*16)
        else
        push    (C2_BASE+L_4B99E-C1_SEG*16)
        endif
br_3C4AC:
        push    di
        lea     ax, [si+18h]
        push    ax
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        pop     si
        pop     di
        leave
        ret
        nop
L_3C4BE:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    0
        call    fn_3C4FE
        add     sp, 2
        pop     ds
        retf
L_3C4CE:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    1
        call    fn_3C4FE
        add     sp, 2
        pop     ds
        retf
far_3C4DE:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    2
        call    fn_3C4FE
        add     sp, 2
        pop     ds
        retf
far_3C4EE:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    3
        call    fn_3C4FE
        add     sp, 2
        pop     ds
        retf
fn_3C4FE:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+4]
        push    si
        callf   EP_L_3E900_SEG:EP_L_3E900_OFF
        add     sp, 2
        mov     al, byte ptr [C2_B_CUR_PAD]
        and     al, 0fh
        mov     cx, si
        shl     cl, 4
        add     al, cl
        mov     byte ptr [C2_B_CUR_PAD], al
        callf   [C0_FP_03762]
        pop     si
        leave
        ret
far_3C524:
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     cl, byte ptr [C2_B_CUR_PAD]
        shr     cl, 4
        sub     ch, ch
        mov     al, byte ptr [C2_B_CUR_PAD]
        and     ax, 0fh
        mov     si, ax
        cmp     si, 0fh
        jge     br_3C55F
        shl     cl, 4
        inc     si
        mov     ax, si
        add     cl, al
        mov     byte ptr [C2_B_CUR_PAD], cl
        call    fn_3CA58
        cmp     ax, 1
        jg      br_3C55F
        mov     cx, si
        mov     ax, 1
        shl     ax, cl
        mov     word ptr [C0_W_03EDA], ax
br_3C55F:
        pop     ds
        pop     si
        retf
far_3C562:
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     cl, byte ptr [C2_B_CUR_PAD]
        shr     cl, 4
        sub     ch, ch
        mov     al, byte ptr [C2_B_CUR_PAD]
        and     ax, 0fh
        mov     si, ax
        or      si, ax
        jle     br_3C59C
        shl     cl, 4
        dec     si
        mov     ax, si
        add     cl, al
        mov     byte ptr [C2_B_CUR_PAD], cl
        call    fn_3CA58
        cmp     ax, 1
        jg      br_3C59C
        mov     cx, si
        mov     ax, 1
        shl     ax, cl
        mov     word ptr [C0_W_03EDA], ax
br_3C59C:
        pop     ds
        pop     si
        retf
        db      00h
far_3C5A0:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        call    fn_3CA58
        cmp     ax, 1
        jg      br_3C5B6
        mov     ax, 0ffffh
        mov     word ptr [C0_W_03EDA], ax
        pop     ds
        retf
br_3C5B6:
        mov     ax, 1
        mov     cl, byte ptr [C2_B_CUR_PAD]
        and     cl, 0fh
        shl     ax, cl
        mov     word ptr [C0_W_03EDA], ax
        pop     ds
        retf
        db      00h
L_3C5C8:
        db      56h
        push    ds
        mov     cx, DS_SEG
        db      8eh, 0d9h, 8bh, 0c8h, 0ah, 0c9h
        je      br_3C612
        db      8ah, 0c5h
        db      25h, 0fh, 00h, 8bh, 0f0h, 8ah, 16h, 0c1h, 0d7h, 80h, 0e2h, 0f0h, 02h, 0d0h, 88h, 16h
        if      FW_VERSION >= 110
        db      0c1h, 0d7h, 0f6h, 06h, 86h, 8dh, 02h, 74h, 10h, 8bh
        else
        db      0c1h, 0d7h, 0f6h, 06h, 80h, 8dh, 02h, 74h, 10h, 8bh
        endif
        enter   1b8h, 0
        shl     ax, cl
        xor     word ptr [C0_W_03EDA], ax
        jne     br_3C612
        jmp     br_3C608
        nop
        call    fn_3CA58
        cmp     ax, 1
        jg      br_3C612
br_3C608:
        mov     cx, si
        mov     ax, 1
        shl     ax, cl
        mov     word ptr [C0_W_03EDA], ax
br_3C612:
        pop     ds
        pop     si
        retf
        db      00h
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    0
        call    fn_3C656
        add     sp, 2
        pop     ds
        retf
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    1
        call    fn_3C656
        add     sp, 2
        pop     ds
        retf
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    2
        call    fn_3C656
        add     sp, 2
        pop     ds
        retf
L_3C646:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        push    3
        call    fn_3C656
        add     sp, 2
        pop     ds
        retf
fn_3C656:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+4]
        push    si
        callf   EP_L_3E900_SEG:EP_L_3E900_OFF
        add     sp, 2
        mov     al, byte ptr [C2_B_CUR_PAD]
        and     al, 0fh
        mov     cx, si
        shl     cl, 4
        add     al, cl
        mov     byte ptr [C2_B_CUR_PAD], al
        pop     si
        leave
        ret
L_3C678:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     bl, byte ptr [C0_B_08D86]
        and     bx, 1
        mov     al, byte ptr [C0_B_03EDC]
        sub     ah, ah
        add     ax, ax
        add     bx, ax
        shl     bx, 3
        push    word ptr [bx+C0_TBL_03EE0]
        push    word ptr [bx+C0_TBL_03EDE]
        call    fn_3C6CC
        add     sp, 4
        pop     ds
        retf
        db      00h
X_3C6A2:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     bl, byte ptr [C0_B_08D86]
        and     bx, 1
        mov     al, byte ptr [C0_B_03EDC]
        sub     ah, ah
        add     ax, ax
        add     bx, ax
        shl     bx, 3
        push    word ptr [bx+C0_TBL_03EE4]
        push    word ptr [bx+C0_TBL_03EE2]
        call    fn_3C6CC
        add     sp, 4
        pop     ds
        retf
        db      00h
fn_3C6CC:
        enter   2, 0
        push    di
        push    si
        mov     ax, word ptr [bp+6]
        or      ax, word ptr [bp+4]
        je      br_3C6FF
        mov     al, byte ptr [C2_B_CUR_PAD]
        and     ax, 0f0h
        mov     word ptr [bp-2], ax
        mov     si, 1
        xor     di, di
loop_3C6E8:
        test    word ptr [C0_W_03EDA], si
        je      br_3C6FA
        mov     ax, word ptr [bp-2]
        add     ax, di
        push    ax
        callf   [bp+4]
        add     sp, 2
br_3C6FA:
        inc     di
        add     si, si
        jne     loop_3C6E8
br_3C6FF:
        pop     si
        pop     di
        leave
        ret
        db      00h
far_3C704:
        enter   14h, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C2_B_CUR_PAD]
        shr     al, 4
        sub     ah, ah
        mov     si, ax
        callf   EP_DISP_CLEAR_ALL_SEG:EP_DISP_CLEAR_ALL_OFF
        mov     word ptr [bp-12h], 0
        mov     word ptr [bp-10h], 5
        mov     word ptr [bp-14h], si
loop_3C72C:
        push    32h
        push    0
        mov     ax, word ptr [bp-10h]
        mov     word ptr [bp-0ah], ax
        sub     ax, 2
        push    ax
        nop
        push    cs
        call    draw_vline
        add     sp, 6
        mov     ax, word ptr [bp-14h]
        add     ax, 41h
        push    ax
        push    10h
        push    word ptr [bp-10h]
        nop
        push    cs
        call    draw_char_at
        add     sp, 6
        mov     ax, word ptr [bp-12h]
        inc     ax
        mov     cx, 0ah
        mov     bx, ax
        cwd
        idiv    cx
        add     ax, 30h
        push    ax
        push    1dh
        push    word ptr [bp-10h]
        mov     si, bx
        nop
        push    cs
        call    draw_char_at
        add     sp, 6
        mov     ax, si
        mov     cx, 0ah
        cwd
        idiv    cx
        add     dx, 30h
        push    dx
        push    2ah
        push    word ptr [bp-10h]
        nop
        push    cs
        call    draw_char_at
        add     sp, 6
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        mov     word ptr [bp-2], ax
        add     ax, 60h
        push    ax
        nop
        push    cs
        call    ivt_get_vector
        add     sp, 2
        mov     bx, word ptr [bp-14h]
        shl     bx, 4
        mov     es, dx
        add     bx, ax
        mov     si, word ptr [bp-12h]
        mov     al, byte ptr es:[bx+si]
        cbw
        mov     di, ax
        cmp     di, 23h
        jl      br_3C7C4
        cmp     di, 62h
        jg      br_3C7C4
        mov     dx, 1
        jmp     br_3C7C6
br_3C7C4:
        xor     dx, dx
br_3C7C6:
        or      dx, dx
        jne     br_3C7CD
        jmp     br_3C924
br_3C7CD:
        mov     al, byte ptr [C0_B_03EDC]
        sub     ah, ah
        dec     ax
        je      br_3C826
        dec     ax
        jne     br_3C7DB
        jmp     br_3C8BC
br_3C7DB:
        push    di
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        push    ax
        callf   EP_PGM_STEREO_MIX_PTR_SEG:EP_PGM_STEREO_MIX_PTR_OFF
        add     sp, 4
        mov     es, dx
        mov     bx, ax
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], es
        mov     al, byte ptr es:[bx+1]
        sub     ah, ah
        sub     ax, 32h
        mov     cx, 7
        cwd
        idiv    cx
        imul    ax, ax, 18h
        if      FW_VERSION >= 110
        add     ax, 787ch
        else
        add     ax, 7876h
        endif
        push    ds
        push    ax
        push    1
        push    word ptr [bp-0ah]
        callf   EP_DRAW_BITMAP_PTR_SEG:EP_DRAW_BITMAP_PTR_OFF
        add     sp, 8
        les     bx, [bp-8]
        sub     ah, ah
        mov     al, byte ptr es:[bx]
        mov     word ptr [bp-2], ax
        jmp     br_3C8FF
br_3C826:
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        mov     bx, di
        shl     bx, 2
        add     ax, 5ch
        push    ax
        mov     si, bx
        nop
        push    cs
        call    ivt_get_vector
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx+si+752h]
        mov     dx, word ptr es:[bx+si+754h]
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    di
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        push    ax
        callf   EP_PGM_INDIV_FX_MIX_PTR_SEG:EP_PGM_INDIV_FX_MIX_PTR_OFF
        add     sp, 4
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     ax, word ptr [bp-2]
        or      ax, word ptr [bp-4]
        je      br_3C87E
        les     bx, [bp-4]
        sub     ah, ah
        mov     al, byte ptr es:[bx+25h]
        mov     word ptr [bp-0ch], ax
        jmp     br_3C883
        nop
br_3C87E:
        mov     word ptr [bp-0ch], 1
br_3C883:
        les     bx, [bp-8]
        mov     bl, byte ptr es:[bx+3]
        and     bx, 0fh
        mov     ax, word ptr [bp-0ch]
        mov     cx, ax
        shl     ax, 2
        add     ax, cx
        add     ax, ax
        add     bx, ax
        shl     bx, 2
        push    word ptr [bx+C0_TBL_03E7C]
        push    word ptr [bx+C0_TBL_03E7A]
        push    1
        push    word ptr [bp-0ah]
        callf   EP_DRAW_BITMAP_PTR_SEG:EP_DRAW_BITMAP_PTR_OFF
        add     sp, 8
        les     bx, [bp-8]
        mov     al, byte ptr es:[bx+2]
        jmp     br_3C8FD
br_3C8BC:
        mov     word ptr [bp-0ch], di
        push    di
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        push    ax
        callf   EP_PGM_INDIV_FX_MIX_PTR_SEG:EP_PGM_INDIV_FX_MIX_PTR_OFF
        add     sp, 4
        mov     es, dx
        mov     bx, ax
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], es
        mov     al, byte ptr es:[bx+5]
        sub     ah, ah
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        add     ax, 3ecah
        push    ds
        push    ax
        push    3
        push    word ptr [bp-0ah]
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        les     bx, [bp-8]
        mov     al, byte ptr es:[bx+4]
br_3C8FD:
        sub     ah, ah
br_3C8FF:
        mov     si, ax
        lea     ax, [si+2]
        mov     cx, 3
        cwd
        idiv    cx
        mov     si, ax
        push    ax
        push    4
        sub     si, 31h
        neg     si
        push    si
        mov     ax, word ptr [bp-0ah]
        add     ax, 7
        push    ax
        nop
        push    cs
        call    draw_fill_rect
        add     sp, 8
br_3C924:
        add     word ptr [bp-10h], 0fh
        mov     ax, word ptr [bp-12h]
        inc     ax
        mov     word ptr [bp-12h], ax
        cmp     ax, 10h
        jge     br_3C937
        jmp     loop_3C72C
br_3C937:
        push    32h
        push    0
        mov     cx, ax
        shl     ax, 4
        sub     ax, cx
        add     ax, 3
        push    ax
        nop
        push    cs
        call    draw_vline
        add     sp, 6
        push    EP_FS_OPEN_SEG
        push    EP_FAR_49A8C_OFF
        cmp     byte ptr [C0_B_03EDC], 1
        cmc
        sbb     ax, ax
        and     ax, 2
        push    ax
        push    1
        nop
        push    cs
        call    draw_softkey_label
        add     sp, 8
        push    EP_MIXER_F1_SEG
        push    EP_L_51080_OFF
        cmp     byte ptr [C0_B_03EDC], 1
        je      br_3C97C
        mov     ax, 2
        jmp     br_3C97E
br_3C97C:
        xor     ax, ax
br_3C97E:
        push    ax
        push    2
        nop
        push    cs
        call    draw_softkey_label
        add     sp, 8
        push    C2_SEG
        push    (C2_BASE+far_50D26-C2_SEG*16)
        cmp     byte ptr [C0_B_03EDC], 2
        je      br_3C99C
        mov     ax, 2
        jmp     br_3C99E
        nop
br_3C99C:
        xor     ax, ax
br_3C99E:
        push    ax
        push    3
        nop
        push    cs
        call    draw_softkey_label
        add     sp, 8
        push    C1_SEG
        push    EP_L_4D772_OFF
        push    2
        push    4
        nop
        push    cs
        call    draw_softkey_label
        add     sp, 8
        push    EP_FS_OPEN_SEG
        push    EP_L_4DD78_OFF
        push    2
        push    5
        nop
        push    cs
        call    draw_softkey_label
        add     sp, 8
        call    fn_3CA58
        cmp     ax, 1
        jle     br_3C9DE
        mov     ax, (C2_BASE+L_5168E-C2_SEG*16)
        mov     dx, C2_SEG
        jmp     br_3C9E4
        nop
br_3C9DE:
        mov     ax, (C2_BASE+L_51694-C2_SEG*16)
        mov     dx, C2_SEG
br_3C9E4:
        mov     word ptr [bp-2], dx
        push    dx
        push    ax
        push    1
        push    6
        nop
        push    cs
        call    draw_softkey_label
        add     sp, 8
        push    3
        callf   EP_DISP_SELECT_PLANE_SEG:EP_DISP_SELECT_PLANE_OFF
        add     sp, 2
        test    byte ptr [C0_B_08D86], 1
        je      br_3CA0E
        xor     bx, bx
        mov     cx, 0dh
        jmp     br_3CA14
        nop
br_3CA0E:
        mov     bx, 0eh
        mov     cx, 24h
br_3CA14:
        mov     di, 1
        mov     word ptr [bp-4], 4
        mov     word ptr [bp-6], cx
        mov     word ptr [bp-8], bx
        mov     word ptr [bp-2], di
        mov     si, di
        mov     di, word ptr [bp-4]
loop_3CA2A:
        test    word ptr [C0_W_03EDA], si
        je      br_3CA41
        push    word ptr [bp-6]
        push    0eh
        push    word ptr [bp-8]
        push    di
        nop
        push    cs
        call    draw_fill_rect
        add     sp, 8
br_3CA41:
        add     di, 0fh
        add     si, si
        jne     loop_3CA2A
        push    1
        callf   EP_DISP_SELECT_PLANE_SEG:EP_DISP_SELECT_PLANE_OFF
        add     sp, 2
        pop     ds
        pop     si
        pop     di
        leave
        retf
        db      00h
fn_3CA58:
        push    di
        push    si
        xor     di, di
        mov     si, 1
loop_3CA5F:
        test    word ptr [C0_W_03EDA], si
        je      br_3CA66
        inc     di
br_3CA66:
        add     si, si
        jne     loop_3CA5F
        mov     ax, di
        pop     si
        pop     di
        ret
        db      00h
mixer_paint:
        enter   0ah, 0
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C2_B_MIXER_DRUM]
        cbw
        mov     cx, ax
        add     cx, 5ch
        push    cx
        nop
        push    cs
        call    ivt_get_vector
        add     sp, 2
        mov     word ptr [bp-0ah], ax
        mov     word ptr [bp-8], dx
        cmp     byte ptr [C0_B_0D7C7], 2
        jge     br_3CAB2
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+45h]
        jmp     br_3CAC7
br_3CAB2:
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_REVERB_PTR_SEG:EP_PGM_FX_REVERB_PTR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+1]
br_3CAC7:
        mov     byte ptr [bp-1], al
        cmp     byte ptr [C0_B_0D7C7], 2
        jl      br_3CAD8
        mov     byte ptr [bp-2], 3
        jmp     br_3CAF0
        nop
br_3CAD8:
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+46h]
        mov     byte ptr [bp-2], al
br_3CAF0:
        mov     word ptr [bp-6], C2_W_0FB86
        mov     word ptr [bp-4], C1_SEG
        push    ds
        push    C0_W_04462
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        xor     si, si
loop_3CB08:
        lea     ax, [si+31h]
        mov     bx, C2_W_0FB86
        mov     es, word ptr [C0_W_08126]
        mov     byte ptr es:[bx+5], al
        push    es
        push    bx
        mov     al, byte ptr [C2_B_PAD_DRUM]
        sub     ah, ah
        cmp     ax, si
        jne     br_3CB26
        mov     ax, 2
        jmp     br_3CB29
br_3CB26:
        mov     ax, 1
br_3CB29:
        push    ax
        lea     ax, [si+1]
        push    ax
        nop
        push    cs
        call    draw_softkey_label
        add     sp, 8
        lea     ax, [si+1]
        mov     si, ax
        cmp     si, 4
        jl      loop_3CB08
        push    1
        mov     al, byte ptr [C0_B_098B8]
        cbw
        inc     ax
        cwd
        push    dx
        push    ax
        push    2
        push    20h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        mov     al, byte ptr [C2_B_MIXER_DRUM]
        cbw
        mov     si, ax
        push    2
        imul    bx, si, 184h
        mov     al, byte ptr [bx+C0_TBL_09160]
        sub     ah, ah
        inc     ax
        cwd
        push    dx
        push    ax
        push    2
        push    86h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        mov     ax, word ptr [bp-0ah]
        mov     dx, word ptr [bp-8]
        add     ax, 2
        push    dx
        push    ax
        push    2
        push    98h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C0_TBL_043F4]
        push    word ptr [bx+C0_TBL_043F2]
        push    0ch
        push    20h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        cmp     byte ptr [C0_B_0D7C7], 2
        jl      br_3CC24
        push    EP_MIXER_F1_SEG
        push    EP_L_52424_OFF
        push    1ah
        push    3
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        mov     cx, ax
        sub     ax, 2
        push    ax
        mov     di, cx
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx+47h]
        cbw
        mov     bx, ax
        mov     ax, di
        shl     di, 2
        add     di, ax
        add     bx, di
        shl     bx, 2
        mov     ax, word ptr [bx+C0_TBL_043F2-18h]
        mov     dx, word ptr [bx+C0_TBL_043F2-16h]
        mov     si, ax
        mov     word ptr [bp-6], dx
        mov     di, ax
        mov     es, dx
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        dec     cx
        mov     ax, cx
        add     cx, cx
        add     cx, ax
        add     cx, cx
        add     cx, 25h
        mov     word ptr [bp-4], cx
        push    dx
        push    si
        push    1ah
        push    28h
        jmp     br_3CC60
        nop
br_3CC24:
        cmp     byte ptr [C0_B_0D7C7], 0
        je      L_3C2FA
        mov     ax, (C2_BASE+far_514B8-C2_SEG*16)
        mov     cx, C2_SEG
        jmp     br_3CC3A
        nop
L_3C2FA:
        mov     ax, (C2_BASE+far_51488-C2_SEG*16)
        mov     cx, C2_SEG
br_3CC3A:
        mov     si, ax
        mov     word ptr [bp-6], cx
        mov     dx, cx
        mov     di, ax
        mov     es, cx
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        dec     cx
        mov     ax, cx
        add     cx, cx
        add     cx, ax
        add     cx, cx
        mov     word ptr [bp-4], cx
        push    dx
        push    si
        push    1ah
        push    3
br_3CC60:
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        push    ds
        push    C0_W_07A14
        push    1ah
        mov     ax, word ptr [bp-4]
        add     ax, 3
        push    ax
        callf   EP_DRAW_BITMAP_PTR_SEG:EP_DRAW_BITMAP_PTR_OFF
        add     sp, 8
        push    3
        mov     ax, 0e2h
        sub     ax, word ptr [bp-4]
        push    ax
        push    1ch
        mov     ax, word ptr [bp-4]
        add     ax, 9
        push    ax
        nop
        push    cs
        call    draw_fill_rect
        add     sp, 8
        cmp     byte ptr [bp-2], 3
        je      br_3CCD7
        push    C2_SEG
        push    (C2_BASE+far_51ACC-C2_SEG*16)
        mov     al, byte ptr [bp-1]
        and     al, 20h
        cmp     al, 1
        sbb     ax, ax
        and     al, 0f4h
        add     ax, 23h
        push    ax
        push    2ah
        call    fn_3CED6
        add     sp, 8
        push    C2_SEG
        if      FW_VERSION >= 112
        push    EP_L_51E32_OFF
        else
        push    EP_L_51E32_OFF
        endif
        mov     al, byte ptr [bp-1]
        and     al, 10h
        cmp     al, 1
        sbb     ax, ax
        and     al, 0f4h
        add     ax, 23h
        push    ax
        push    4dh
        call    fn_3CED6
        add     sp, 8
br_3CCD7:
        mov     al, byte ptr [bp-2]
        cbw
        or      ax, ax
        je      br_3CCF0
        dec     ax
        jne     br_3CCE5
        jmp     br_3CDBC
br_3CCE5:
        dec     ax
        jne     br_3CCEB
        jmp     br_3CE06
br_3CCEB:
        dec     ax
        je      br_3CD2B
        jmp     br_3CD49
br_3CCF0:
        push    EP_MIXER_F1_SEG
        push    EP_L_51AD8_OFF
        mov     al, byte ptr [bp-1]
        and     al, 8
        cmp     al, 1
        sbb     ax, ax
        and     al, 0f4h
        add     ax, 23h
        push    ax
        push    70h
        call    fn_3CED6
        add     sp, 8
        push    EP_MIXER_F1_SEG
        push    EP_L_51C3E_OFF
        mov     al, byte ptr [bp-1]
        and     al, 4
        cmp     al, 1
        sbb     ax, ax
        and     al, 0f4h
loop_3CD1E:
        add     ax, 23h
        push    ax
        push    93h
        call    fn_3CED6
        add     sp, 8
br_3CD2B:
        push    EP_MIXER_F1_SEG
        push    EP_L_51AE4_OFF
        mov     al, byte ptr [bp-1]
        and     al, 2
loop_3CD36:
        cmp     al, 1
        sbb     ax, ax
        and     al, 0f4h
        add     ax, 23h
        push    ax
        push    0b6h
        call    fn_3CED6
        add     sp, 8
br_3CD49:
        push    EP_MIXER_F1_SEG
        push    EP_L_51AEA_OFF
        mov     al, byte ptr [bp-1]
        and     al, 1
        cmp     al, 1
        sbb     ax, ax
        and     al, 0f4h
        add     ax, 23h
        push    ax
        push    0d9h
        call    fn_3CED6
        add     sp, 8
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        cmp     word ptr [C2_W_MIXER_CURSOR], 2
        je      br_3CD76
        jmp     br_3CE44
br_3CD76:
        push    3
        callf   EP_DISP_SELECT_PLANE_SEG:EP_DISP_SELECT_PLANE_OFF
        add     sp, 2
        push    3ch
        push    0f8h
        push    0
        push    0
        nop
        push    cs
        if      FW_VERSION <> 112
        call    draw_erase_rect
        else
        call    EP_L_2780E_OFF+APP3_CSBASE
        endif
        add     sp, 8
        push    8
        mov     ax, word ptr [bp-6]
        mov     di, si
        mov     es, ax
        mov     cx, 0ffffh
        xor     ax, ax
        repne scasb
        not     cx
        dec     cx
        mov     ax, cx
        add     cx, cx
        add     cx, ax
        add     cx, cx
        push    cx
        imul    bx, word ptr [C2_W_MIXER_CURSOR], 2ah
        mov     al, byte ptr [bx+C0_B_044C9]
        sub     ah, ah
        push    ax
        jmp     br_3CEC2
br_3CDBC:
        push    EP_MIXER_F1_SEG
        push    EP_L_51AE4_OFF
        mov     al, byte ptr [bp-1]
        and     al, 2
        cmp     al, 1
        sbb     ax, ax
        and     al, 0f4h
        add     ax, 23h
        push    ax
        push    70h
        call    fn_3CED6
        add     sp, 8
        push    EP_MIXER_F1_SEG
        push    EP_L_51AD8_OFF
        mov     al, byte ptr [bp-1]
        and     al, 8
        cmp     al, 1
        sbb     ax, ax
        and     al, 0f4h
        add     ax, 23h
        push    ax
        push    93h
        call    fn_3CED6
        add     sp, 8
        push    EP_MIXER_F1_SEG
        push    EP_L_51C3E_OFF
        mov     al, byte ptr [bp-1]
        and     al, 4
        jmp     loop_3CD36
        nop
br_3CE06:
        push    ds
        push    C0_W_044A0
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        push    EP_MIXER_F1_SEG
        push    EP_L_51AD8_OFF
        mov     al, byte ptr [bp-1]
        and     al, 8
        cmp     al, 1
        sbb     ax, ax
        and     al, 0e9h
        add     ax, 23h
        push    ax
        push    70h
        call    fn_3CED6
        add     sp, 8
        push    EP_MIXER_F1_SEG
        push    EP_L_51C3E_OFF
        mov     al, byte ptr [bp-1]
        and     al, 4
        cmp     al, 1
        sbb     ax, ax
        and     al, 0e9h
        jmp     loop_3CD1E
        nop
br_3CE44:
        cmp     word ptr [C2_W_MIXER_CURSOR], 2
        jg      br_3CE4E
        jmp     br_3CED1
br_3CE4E:
        cmp     word ptr [C2_W_MIXER_CURSOR], 9
        jge     br_3CED1
        push    3
        callf   EP_DISP_SELECT_PLANE_SEG:EP_DISP_SELECT_PLANE_OFF
        add     sp, 2
        push    3ch
        push    0f8h
        push    0
        push    0
        nop
        push    cs
        if      FW_VERSION <> 112
        call    draw_erase_rect
        else
        call    EP_L_2780E_OFF+APP3_CSBASE
        endif
        add     sp, 8
        cmp     byte ptr [bp-2], 1
        jne     br_3CE7C
        mov     si, 1
        jmp     br_3CE7E
        nop
br_3CE7C:
        xor     si, si
br_3CE7E:
        mov     ax, si
        add     si, si
        add     si, ax
        add     si, si
        mov     bx, word ptr [C2_W_MIXER_CURSOR]
        mov     al, byte ptr [bp-1]
        test    byte ptr [bx+si+C0_B_044AD], al
        je      br_3CE98
        mov     si, 25h
        jmp     br_3CEB5
br_3CE98:
        cmp     byte ptr [bp-2], 2
        jne     br_3CEA4
        mov     si, 1
        jmp     br_3CEA6
        nop
br_3CEA4:
        xor     si, si
br_3CEA6:
        mov     ax, si
        add     si, si
        add     si, ax
        add     si, si
        mov     al, byte ptr [bx+si+C0_B_044B9]
        cbw
        mov     si, ax
br_3CEB5:
        push    0ah
        imul    bx, bx, 2ah
        sub     ah, ah
        mov     al, byte ptr [bx+C0_B_044CA]
        push    ax
        push    si
br_3CEC2:
        mov     al, byte ptr [bx+C0_B_044C8]
        sub     ah, ah
        push    ax
        nop
        push    cs
        call    draw_invert_box
        add     sp, 8
br_3CED1:
        pop     ds
        pop     si
        pop     di
        leave
        retf
fn_3CED6:
        enter   4, 0
        push    di
        push    si
        mov     di, word ptr [bp+4]
        mov     si, word ptr [bp+6]
        push    0eh
        push    1eh
        push    si
        push    di
        nop
        push    cs
        if      FW_VERSION <> 112
        call    draw_erase_rect
        else
        call    EP_L_2780E_OFF+APP3_CSBASE
        endif
        add     sp, 8
        push    1bh
        push    si
        lea     ax, [di+1]
        push    ax
        mov     word ptr [bp-2], ax
        nop
        push    cs
        call    draw_hline
        add     sp, 6
        push    1ch
        lea     ax, [si+0ch]
        push    ax
        push    word ptr [bp-2]
        nop
        push    cs
        call    draw_hline
        add     sp, 6
        push    1bh
        lea     ax, [si+0dh]
        push    ax
        lea     ax, [di+2]
        push    ax
        nop
        push    cs
        call    draw_hline
        add     sp, 6
        push    0bh
        lea     ax, [si+1]
        push    ax
        push    di
        mov     word ptr [bp-4], ax
        nop
        push    cs
        call    draw_vline
        add     sp, 6
        push    0bh
        push    word ptr [bp-4]
        lea     ax, [di+1ch]
        push    ax
        nop
        push    cs
        call    draw_vline
        add     sp, 6
        push    0bh
        lea     ax, [si+2]
        push    ax
        lea     ax, [di+1dh]
        push    ax
        nop
        push    cs
        call    draw_vline
        add     sp, 6
        push    word ptr [bp+0ah]
        push    word ptr [bp+8]
        lea     ax, [si+3]
        push    ax
        lea     ax, [di+3]
        push    ax
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        pop     si
        pop     di
        leave
        ret
fx_pitch_shift_paint:
        enter   4, 0
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    C2_SEG
        if      FW_VERSION >= 112
        push    EP_C2_5364_OFF
        else
        push    EP_C2_5364_OFF
        endif
        callf   EP_FAR_529AC_SEG:EP_FAR_529AC_OFF
        add     sp, 4
        push    ds
        push    C0_W_0506A
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        mov     al, byte ptr [C2_B_FX_MOD_TYPE]
        cbw
        mov     bx, ax
        shl     bx, 2
        push    word ptr [bx+C0_TBL_04BB2]
        push    word ptr [bx+C0_TBL_04BB0]
        push    0bh
        push    31h
        callf   EP_DRAW_STRING_AT_SEG:EP_DRAW_STRING_AT_OFF
        add     sp, 8
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+26h]
        push    15h
        push    91h
        call    fn_3D198
        add     sp, 6
        mov     es, word ptr [bp-2]
        push    word ptr es:[si+28h]
        push    15h
        push    0bbh
        call    fn_3D198
        add     sp, 6
        cmp     byte ptr [C2_B_FX_MOD_TYPE], 6
        jne     br_3D065
        push    ds
        push    C0_W_0508E
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
        push    3
        mov     es, word ptr [bp-2]
        push    0
        push    word ptr es:[si+2ah]
        push    1fh
        push    97h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    3
        mov     es, word ptr [bp-2]
        push    0
        push    word ptr es:[si+2ch]
        push    1fh
        push    0c1h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    2
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+2eh]
        sub     ah, ah
        push    0
        push    ax
        push    29h
        push    9dh
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        push    2
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+2fh]
        sub     ah, ah
        push    0
        push    ax
        push    29h
        push    0c7h
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
br_3D065:
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        pop     ds
        pop     si
        leave
        retf
L_3D06E:
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        push    word ptr es:[bx+26h]
        call    lcd_init_setup
        add     sp, 2
        mov     word ptr [C0_B_098B8], ax
        mov     word ptr [C2_W_FX_MOD_CURSOR], 1
        push    ds
        push    C0_B_098B8
        push    ds
        push    C0_W_050DC
        nop
        push    cs
        call    ui_field_engine
        add     sp, 8
        retf
        db      00h
L_3D0A4:
        enter   4, 0
        push    si
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    word ptr [bp+6]
        call    voice_ratio_calc
        add     sp, 2
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+26h], ax
        callf   EP_FX_SECTION_FIELD_NOTIFY_SEG:EP_FX_SECTION_FIELD_NOTIFY_OFF
        pop     si
        leave
        retf
        db      00h
L_3D0D4:
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        push    word ptr es:[bx+28h]
        call    lcd_init_setup
        add     sp, 2
        mov     word ptr [C0_B_098B8], ax
        mov     word ptr [C2_W_FX_MOD_CURSOR], 2
        push    ds
        push    C0_B_098B8
        push    ds
        push    C0_W_05106
        nop
        push    cs
        call    ui_field_engine
        add     sp, 8
        retf
        db      00h
L_3D10A:
        enter   4, 0
        push    si
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     si, ax
        mov     word ptr [bp-2], dx
        push    word ptr [bp+6]
        call    voice_ratio_calc
        add     sp, 2
        mov     es, word ptr [bp-2]
        mov     word ptr es:[si+28h], ax
        callf   EP_FX_SECTION_FIELD_NOTIFY_SEG:EP_FX_SECTION_FIELD_NOTIFY_OFF
        pop     si
        leave
        retf
        db      00h
lcd_init_setup:
        push    bp
        mov     bp, sp
        push    di
        mov     bx, word ptr [bp+4]
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
        ret
        db      00h
voice_ratio_calc:
        enter   4, 0
        push    64h
        push    word ptr [bp+4]
        nop
        push    cs
        call    _div
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
        ret
fn_3D198:
        enter   4, 0
        push    di
        push    si
        mov     di, word ptr [bp+6]
        mov     si, word ptr [bp+8]
        mov     word ptr [bp-2], si
        mov     word ptr [bp-4], di
        or      si, si
        jl      br_3D1B2
        mov     al, 20h
        jmp     br_3D1B4
br_3D1B2:
        mov     al, 2dh
br_3D1B4:
        cbw
        push    ax
        push    word ptr [bp-4]
        push    word ptr [bp+4]
        nop
        push    cs
        call    draw_char_at
        add     sp, 6
        push    2
        push    2
        mov     ax, word ptr [bp-2]
        cwd
        xor     ax, dx
        sub     ax, dx
        push    ax
        call    lcd_init_setup
        add     sp, 2
        cwd
        push    dx
        push    ax
        push    word ptr [bp-4]
        mov     ax, word ptr [bp+4]
        add     ax, 6
        push    ax
        callf   EP_DRAW_FIXED_DECIMAL_SEG:EP_DRAW_FIXED_DECIMAL_OFF
        add     sp, 0ch
        pop     si
        pop     di
        leave
        ret
L_3D1F0:
        test    byte ptr [C0_B_09604], 1
        jne     br_3D1FE
        test    byte ptr [C0_B_09604], 2
        je      br_3D213
br_3D1FE:
        mov     al, byte ptr [C0_B_09606]
        push    ax
        mov     cl, byte ptr [C0_B_0D7C7]
        mov     al, 1
        shl     al, cl
        push    ax
        callf   EP_FX_DSP_UPDATE_REQUEST_SEG:EP_FX_DSP_UPDATE_REQUEST_OFF
        add     sp, 4
br_3D213:
        push    ds
        push    C0_W_051E8
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF                    ; = 0x3E8B4 handler_set_install
        add     sp, 4
        mov     word ptr [C2_W_PARAM_HOOK_OFF], (C0_BASE+L_3D23E-C0_SEG*16)
        mov     word ptr [C2_W_PARAM_HOOK_SEG], C0_SEG
        push    word ptr [C2_W_FX_DELAY_CURSOR]
        call    fn_3D256
        add     sp, 2
        imul    bx, ax, 2ah
        callf   [bx+C0_TBL_FX_DELAY_FIELD_THUNK]
        retf
        db      00h
L_3D23E:
        push    word ptr [C2_W_FX_DELAY_CURSOR]
        call    fn_3D256
        add     sp, 2
        imul    bx, ax, 2ah
        callf   [bx+C0_TBL_FX_DELAY_FIELD_THUNK]
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
        retf
        db      00h
fn_3D256:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp+4]
        or      si, si
        je      br_3D290
        mov     al, byte ptr [C0_B_0D7C7]
        cbw
        push    ax
        callf   EP_PGM_FX_SECTION_PTR_SEG:EP_PGM_FX_SECTION_PTR_OFF
        add     sp, 2
        mov     es, dx
        mov     bx, ax
        cmp     byte ptr es:[bx+30h], 3
        jge     br_3D284
        or      si, si
        jl      br_3D28E
        cmp     si, 4
        jle     br_3D290
        jmp     br_3D28E
br_3D284:
        cmp     si, 5
        jl      br_3D28E
        cmp     si, 0bh
        jb      br_3D290
br_3D28E:
        xor     si, si
br_3D290:
        mov     ax, si
        pop     si
        leave
        ret
        nop
tgt_3D296:
        call    fn_3D356
        mov     byte ptr [C2_B_FX_BOARD_PRESENT], al
        or      al, al
        jne     br_3D2A3
        jmp     br_3D34A
br_3D2A3:
        mov     byte ptr [C0_B_08FC4], 2
        mov     ax, 180h
        out     0a2h, ax
        mov     ax, 2
        out     0a0h, ax
        mov     ax, 181h
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        mov     cx, ax
        mov     byte ptr [C0_B_09602], cl
        mov     ax, 182h
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        xor     bx, bx
loop_3D2CC:
        mov     ax, bx
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        inc     bx
        cmp     bx, 120h
        jb      loop_3D2CC
        mov     bx, 200h
loop_3D2DE:
        mov     ax, bx
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        inc     bx
        cmp     bx, 280h
        jb      loop_3D2DE
        mov     ax, 0c8h
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        mov     ax, 0c9h
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        mov     ax, 26eh
        out     0a2h, ax
        xor     ax, ax
        out     0a0h, ax
        mov     ax, 0f6h
        out     0a2h, ax
        mov     ax, 4000h
        out     0a0h, ax
        mov     ax, 0f2h
        out     0a2h, ax
        mov     ax, 7fffh
        out     0a0h, ax
        mov     ax, 0f0h
        out     0a2h, ax
        mov     ax, 64h
        out     0a0h, ax
        mov     ax, 27eh
        out     0a2h, ax
        mov     ax, 100h
        out     0a0h, ax
        mov     ax, 264h
        out     0a2h, ax
        mov     ax, 100h
        out     0a0h, ax
        push    EP_FX_DSP_UPDATE_ISR_SEG
        push    EP_FX_DSP_UPDATE_ISR_OFF
        push    49h
        nop
        push    cs
        call    ivt_set_vector
        add     sp, 6
br_3D34A:
        callf   EP_L_3E7EC_SEG:EP_L_3E7EC_OFF
        mov     al, byte ptr [C2_B_FX_BOARD_PRESENT]
        sub     ah, ah
        retf
        db      00h
fn_3D356:
        mov     cx, 100h
        xor     bx, bx
loop_3D35B:
        mov     ax, cx
        out     0a2h, ax
        mov     ax, bx
        out     0a0h, ax
        add     bx, 3333h
        inc     cx
        cmp     cx, 120h
        jb      loop_3D35B
        mov     cx, 100h
        xor     bx, bx
loop_3D373:
        mov     ax, cx
        out     0a2h, ax
        in      ax, 0a0h
        cmp     ax, bx
        jne     br_3D38A
        add     bx, 3333h
        inc     cx
        cmp     cx, 120h
        jb      loop_3D373
        jmp     br_3D38E
br_3D38A:
        xor     ax, ax
        ret
        nop
br_3D38E:
        mov     ax, 1
        ret
int4A_sysex_wrapper:
        push    bp
        mov     bp, sp
        push    si
        mov     ah, byte ptr [C0_B_0647D]
        les     si, [bp+4]
        mov     cx, word ptr [bp+8]
        jcxz    br_3D3AA
tgt_3D3A2:
        mov     al, byte ptr es:[si]
        int     4ah
        inc     si
        loop    tgt_3D3A2
br_3D3AA:
        pop     si
        leave
        ret
        db      00h
fn_3D3AE:
        push    di
        xor     ax, ax
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     cx, 81h
        lea     di, [bx+R6480_BUF]
        rep stosw
        mov     bx, word ptr [C2_FP_MIDI_IN_BLOCK]
        mov     cx, 41h
        lea     di, [bx+164h]
        rep stosw
        push    EP_MIXER_F1_SEG
        push    EP_L_55928_OFF
        push    4fh
        nop
        push    cs
        call    ivt_set_vector
        add     sp, 6
        pop     di
        ret
fn_3D3DC:
        push    di
        xor     ax, ax
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     cx, 81h
        lea     di, [bx+R6480_BUF]
        rep stosw
        mov     bx, word ptr [C2_FP_MIDI_IN_BLOCK]
        mov     cx, 41h
        lea     di, [bx+164h]
        rep stosw
        push    C1_SEG
        push    word 0
        push    4fh
        nop
        push    cs
        call    ivt_set_vector
        add     sp, 6
        pop     di
        ret
fn_3D40A:
        enter   2, 0
        push    si
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     al, byte ptr es:[bx+R6480_B_163]
        cmp     byte ptr es:[bx+R6480_IDX], al
        jne     loop_3D422
        jmp     br_3D50A
loop_3D422:
        sub     ah, ah
        mov     al, byte ptr es:[bx+163h]
        mov     si, ax
        mov     al, byte ptr es:[bx+si+62h]
        mov     byte ptr [bp-1], al
        inc     byte ptr es:[bx+163h]
        test    byte ptr [bp-1], 80h
        je      br_3D47A
        cmp     byte ptr [bp-1], 0f0h
        je      br_3D446
        jmp     br_3D4D0
br_3D446:
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     byte ptr es:[bx+R6480_FLAG2], 1
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     byte ptr es:[bx+R6480_CNT2], ah
        mov     al, byte ptr [bp-1]
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        sub     ch, ch
        mov     cl, byte ptr es:[bx+R6480_CNT2]
        mov     si, cx
        mov     byte ptr es:[bx+si+164h], al
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        inc     byte ptr es:[bx+R6480_CNT2]
        jmp     br_3D4BA
        nop
br_3D47A:
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        cmp     byte ptr es:[bx+R6480_FLAG2], 0
        je      br_3D4BA
        mov     al, byte ptr [bp-1]
        sub     ch, ch
        mov     cl, byte ptr es:[bx+R6480_CNT2]
        mov     si, cx
        mov     byte ptr es:[bx+si+164h], al
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        inc     byte ptr es:[bx+R6480_CNT2]
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        cmp     byte ptr es:[bx+R6480_CNT2], 80h
        jb      br_3D4BA
        mov     byte ptr es:[bx+R6480_FLAG2], ch
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     byte ptr es:[bx+R6480_CNT2], ch
br_3D4BA:
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     al, byte ptr es:[bx+R6480_B_163]
        cmp     byte ptr es:[bx+R6480_IDX], al
        je      br_3D4CD
        jmp     loop_3D422
br_3D4CD:
        jmp     br_3D50A
        nop
br_3D4D0:
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        cmp     byte ptr es:[bx+R6480_FLAG2], 0
        je      br_3D50A
        mov     byte ptr es:[bx+R6480_FLAG2], 0
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        sub     ah, ah
        mov     al, byte ptr es:[bx+R6480_CNT2]
        mov     si, ax
        mov     byte ptr es:[bx+si+164h], 0f7h
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        inc     byte ptr es:[bx+R6480_CNT2]
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     al, byte ptr es:[bx+R6480_CNT2]
        pop     si
        leave
        ret
br_3D50A:
        xor     ax, ax
        pop     si
        leave
        ret
        db      00h
seq_io_control:
        enter   1eh, 0
        push    si
        mov     si, word ptr [bp+4]
        mov     byte ptr [bp-1eh], 0f0h
        mov     byte ptr [bp-1dh], 7eh
        mov     byte ptr [bp-1bh], 1
        mov     al, byte ptr [P_SDS_EXCL_CH]
        mov     byte ptr [bp-1ch], al
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     al, byte ptr es:[bx+R6480_W_02]
        and     al, 7fh
        mov     byte ptr [bp-1ah], al
        mov     ax, word ptr es:[bx+R6480_W_02]
        add     ax, ax
        mov     byte ptr [bp-19h], ah
        mov     byte ptr [bp-18h], 10h
        mov     es, word ptr [bp+6]
        push    0
        push    word ptr es:[si+38h]
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
        mov     al, byte ptr es:[si+2eh]
        and     al, 7fh
        mov     byte ptr [bp-14h], al
        mov     ax, word ptr es:[si+2eh]
        add     ax, ax
        mov     al, ah
        and     al, 7fh
        mov     byte ptr [bp-13h], al
        mov     ax, word ptr es:[si+2eh]
        mov     dx, word ptr es:[si+30h]
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        and     dl, 7fh
        mov     byte ptr [bp-12h], dl
        mov     ax, word ptr es:[si+2ah]
        mov     dx, word ptr es:[si+2ch]
        sub     ax, word ptr es:[si+32h]
        sbb     dx, word ptr es:[si+34h]
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
        mov     al, byte ptr es:[si+2ah]
        and     al, 7fh
        mov     byte ptr [bp-0eh], al
        mov     ax, word ptr es:[si+2ah]
        add     ax, ax
        mov     al, ah
        and     al, 7fh
        mov     byte ptr [bp-0dh], al
        mov     ax, word ptr es:[si+2ah]
        mov     dx, word ptr es:[si+2ch]
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        and     dl, 7fh
        mov     byte ptr [bp-0ch], dl
        cmp     byte ptr es:[si+36h], 1
        sbb     al, al
        and     al, 7fh
        mov     byte ptr [bp-0bh], al
        mov     byte ptr [bp-0ah], 0f7h
        push    15h
        lea     ax, [bp-1eh]
        push    ss
        push    ax
        call    int4A_sysex_wrapper
        add     sp, 6
        pop     si
        leave
        ret
        db      00h
string_scan_sysex:
        enter   8, 0
        mov     cx, word ptr [bp+6]
        mov     byte ptr [bp-8], 0f0h
        mov     byte ptr [bp-7], 7eh
        mov     byte ptr [bp-5], 3
        mov     al, byte ptr [bp+4]
        mov     byte ptr [bp-6], al
        mov     ax, cx
        and     cl, 7fh
        mov     byte ptr [bp-4], cl
        add     ax, ax
        mov     al, ah
        mov     byte ptr [bp-3], ah
        mov     byte ptr [bp-2], 0f7h
        push    7
        lea     ax, [bp-8]
        push    ss
        push    ax
        call    int4A_sysex_wrapper
        leave
        ret
audio_event_handler:
        enter   4, 0
        push    di
        push    si
        mov     cx, word ptr [bp+4]
        mov     byte ptr [C0_W_08DC8], 0f0h
        mov     byte ptr [C0_B_08DC9], 7eh
        mov     al, byte ptr [P_SDS_EXCL_CH]
        mov     byte ptr [C0_W_08DC8+2], al
        mov     byte ptr [C0_W_08DC8+3], 2
        and     cl, 7fh
        mov     byte ptr [C0_W_08DC8+4], cl
        xor     cl, al
        xor     cl, 7ch
        mov     byte ptr [bp-3], cl
        mov     si, C0_W_08DCD
        les     di, [bp+6]
        mov     word ptr [bp-2], 28h
loop_3D6A4:
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
        jne     loop_3D6A4
        mov     al, byte ptr [bp-3]
        mov     byte ptr [C0_B_08E45], al
        mov     byte ptr [C0_B_08E46], 0f7h
        push    7fh
        push    ds
        push    C0_W_08DC8
        call    int4A_sysex_wrapper
        add     sp, 6
        pop     si
        pop     di
        leave
        ret
        db      00h
fn_3D6F4:
        enter   6, 0
        mov     byte ptr [bp-6], 0f0h
        mov     byte ptr [bp-5], 7eh
        mov     al, byte ptr [P_SDS_EXCL_CH]
        mov     byte ptr [bp-4], al
        mov     al, byte ptr [bp+4]
        mov     byte ptr [bp-3], al
        mov     al, byte ptr [bp+6]
        and     al, 7fh
        mov     byte ptr [bp-2], al
        mov     byte ptr [bp-1], 0f7h
        push    6
        lea     ax, [bp-6]
        push    ss
        push    ax
        call    int4A_sysex_wrapper
        leave
        ret
L_3D724:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        callf   EP_SOUND_LIST_RENUMBER_SEG:EP_SOUND_LIST_RENUMBER_OFF
        xor     ax, ax
        mov     word ptr [C0_W_08DC6], ax
        mov     word ptr [C0_W_08DC4], ax
        call    fn_3D91E
        call    fn_3D3AE
        pop     ds
        retf
        db      00h
sample_dump_refresh:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        cmp     word ptr [C0_W_08DC4], 2
        je      br_3D754
        cmp     word ptr [C0_W_08DC4], 3
        jne     br_3D759
br_3D754:
        nop
        push    cs
        call    sample_dump_cancel
br_3D759:
        call    fn_3D3DC
        callf   EP_VOICE_RELEASE_ALL_SEG:EP_VOICE_RELEASE_ALL_OFF
        pop     ds
        retf
        db      00h
sample_dump_request:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        cmp     word ptr [C0_W_08DC4], 0
        jne     br_3D784
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        push    word ptr es:[bx+R6480_W_02]
        mov     al, byte ptr [P_SDS_EXCL_CH]
        cbw
        push    ax
        call    string_scan_sysex
        add     sp, 4
br_3D784:
        pop     ds
        retf
sample_dump_cancel:
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        mov     ax, word ptr [C0_W_08DC4]
        dec     ax
        je      br_3D7B8
        dec     ax
        je      br_3D7A8
        dec     ax
        jne     br_3D7BE
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        callf   EP_SOUND_LIST_UNLINK_SEG:EP_SOUND_LIST_UNLINK_OFF
        add     sp, 4
br_3D7A8:
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        push    word ptr es:[bx+R6480_W_04]
        push    7dh
        call    fn_3D6F4
        add     sp, 4
br_3D7B8:
        mov     word ptr [C0_W_08DC4], 0
br_3D7BE:
        pop     ds
        retf
sample_dump_key_33:
        push    bp
        mov     bp, sp
        push    ax
        push    di
        push    si
        push    ds
        mov     cx, DS_SEG
        mov     ds, cx
        call    fn_3D40A
        mov     si, ax
        or      si, ax
        je      br_3D7E8
        push    si
        mov     ax, word ptr [C2_FP_MIDI_IN_BLOCK]
        mov     dx, word ptr [C0_W_06482]
        add     ax, 164h
        push    dx
        push    ax
        call    fn_3DA40
        add     sp, 6
br_3D7E8:
        call    fn_3D8E2
        or      ax, ax
        je      br_3D7FA
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
        pop     ds
        pop     si
        pop     di
        leave
        retf
        nop
br_3D7FA:
        cmp     word ptr [C0_W_08DC4], 2
        je      br_3D804
        jmp     br_3D8DD
br_3D804:
        mov     ax, word ptr [bp-2]
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        sub     ax, word ptr es:[bx+R6480_W_0E]
        cmp     ax, word ptr es:[bx+R6480_W_10]
        ja      br_3D818
        jmp     br_3D8DD
br_3D818:
        mov     ax, word ptr es:[bx+R6480_W_0A]
        cmp     word ptr es:[bx+R6480_W_04], ax
        jb      br_3D825
        jmp     br_3D8D2
br_3D825:
        push    1000h
        push    28h
        lea     ax, [bx+12h]
        push    es
        push    ax
        push    word ptr es:[bx+8]
        push    word ptr es:[bx+6]
        callf   EP_SMEM_BLOCK_COPY_SEG:EP_SMEM_BLOCK_COPY_OFF
        add     sp, 0ch
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     ax, word ptr es:[bx+R6480_W_04]
        sub     ax, word ptr es:[bx+R6480_W_0A]
        cmp     ax, 0ffffh
        jne     br_3D888
        push    0
        push    28h
        les     bx, [C0_W_0D7C2]
        push    word ptr es:[bx+SND_LENGTH+2]
        push    word ptr es:[bx+SND_LENGTH]
        nop
        push    cs
        call    __aFlrem
        mov     si, ax
        or      ax, ax
        je      br_3D888
        xor     ax, ax
        mov     cx, si
        add     si, si
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     dx, cx
        mov     cx, 28h
        sub     cx, dx
        add     cx, cx
        lea     di, [bx+si+12h]
        shr     cx, 1
        rep stosw
        jae     br_3D888
        stosb
br_3D888:
        mov     ax, word ptr [C2_FP_MIDI_IN_BLOCK]
        mov     dx, word ptr [C0_W_06482]
        add     ax, 12h
        push    dx
        push    ax
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        push    word ptr es:[bx+R6480_W_04]
        call    audio_event_handler
        add     sp, 6
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        add     word ptr es:[bx+R6480_DD_06], 28h
        adc     word ptr es:[bx+R6480_DD_06+2], 0
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        inc     word ptr es:[bx+R6480_W_04]
        mov     ax, word ptr [bp-2]
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     word ptr es:[bx+R6480_W_0E], ax
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     word ptr es:[bx+R6480_W_10], 28h
        pop     ds
        pop     si
        pop     di
        leave
        retf
br_3D8D2:
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
        mov     word ptr [C0_W_08DC4], 0
br_3D8DD:
        pop     ds
        pop     si
        pop     di
        leave
        retf
fn_3D8E2:
        push    si
        mov     si, word ptr [C0_W_08DC4]
        cmp     si, word ptr [C0_W_08DC6]
        je      br_3D91A
        callf   EP_VOICE_RELEASE_ALL_SEG:EP_VOICE_RELEASE_ALL_OFF
        mov     ax, si
        mov     word ptr [C0_W_08DC6], si
        dec     ax
        je      br_3D906
        dec     ax
        je      br_3D90C
        dec     ax
        je      br_3D912
        call    fn_3D91E
        jmp     br_3D915
br_3D906:
        call    fn_3D96E
        jmp     br_3D915
        nop
br_3D90C:
        call    fn_3DA24
        jmp     br_3D915
        nop
br_3D912:
        call    fn_3DA32
br_3D915:
        mov     ax, 1
        pop     si
        ret
br_3D91A:
        xor     ax, ax
        pop     si
        ret
fn_3D91E:
        push    ds
        push    C0_W_06484
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF
        add     sp, 4
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        callf   EP_SOUND_LIST_CONTAINS_SEG:EP_SOUND_LIST_CONTAINS_OFF
        add     sp, 4
        or      ax, ax
        je      br_3D950
        les     bx, [C0_W_0D7C2]
        sub     ah, ah
        mov     al, byte ptr es:[bx+SND_B_08]
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     word ptr es:[bx+R6480_W_02], ax
br_3D950:
        cmp     word ptr [C2_W_SAMPLE_DUMP_CURSOR], 0
        jl      br_3D95E
        cmp     word ptr [C2_W_SAMPLE_DUMP_CURSOR], 6
        jb      br_3D964
br_3D95E:
        mov     word ptr [C2_W_SAMPLE_DUMP_CURSOR], 0
br_3D964:
        imul    bx, word ptr [C2_W_SAMPLE_DUMP_CURSOR], 2ah
        callf   [bx+C0_TBL_065C2]
        ret
fn_3D96E:
        les     bx, [C0_W_0D7C2]
        cmp     word ptr es:[bx+SND_LENGTH+2], 1fh
        jle     br_3D97C
        jmp     NEAR L_3D423
br_3D97C:
        mov     ax, word ptr es:[bx+0ah]
        mov     dx, word ptr es:[bx+0ch]
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     word ptr es:[bx+R6480_DD_06], ax
        mov     word ptr es:[bx+R6480_DD_06+2], dx
        les     bx, [C0_W_0D7C2]
        cmp     byte ptr es:[bx+SND_STEREO], 0
        je      br_3D9C6
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        cmp     byte ptr es:[bx], 0
        je      br_3D9C6
        push    0
        push    2
        les     bx, [C0_W_0D7C2]
        push    word ptr es:[bx+SND_DD_0E+2]
        push    word ptr es:[bx+SND_DD_0E]
        nop
        push    cs
        call    __aFldiv
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        add     word ptr es:[bx+R6480_DD_06], ax
        adc     word ptr es:[bx+R6480_DD_06+2], dx
br_3D9C6:
        push    0
        push    28h
        les     bx, [C0_W_0D7C2]
        mov     ax, word ptr es:[bx+SND_LENGTH]
        mov     dx, word ptr es:[bx+SND_LENGTH+2]
        add     ax, 27h
        adc     dx, 0
        push    dx
        push    ax
        nop
        push    cs
        call    __aFldiv
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     word ptr es:[bx+R6480_W_0A], ax
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        call    seq_io_control
        add     sp, 4
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     word ptr es:[bx+R6480_W_04], 0
        callf   EP_FAR_3E8C8_SEG:EP_FAR_3E8C8_OFF
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     word ptr es:[bx+R6480_W_0E], ax
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     word ptr es:[bx+R6480_W_10], 7d0h
        mov     word ptr [C0_W_08DC4], 2
        call    fn_3DA24
L_3D423:
        ret
fn_3DA24:
        push    ds
        push    P_64BC
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF                    ; = 0x3E8B4 handler_set_install
        add     sp, 4
        ret
        db      00h
fn_3DA32:
        push    ds
        push    P_64DA
        callf   EP_HANDLER_SET_INSTALL_SEG:EP_HANDLER_SET_INSTALL_OFF                    ; = 0x3E8B4 handler_set_install
        add     sp, 4
        ret
        db      00h
fn_3DA40:
        enter   0eh, 0
        push    di
        push    si
        mov     si, word ptr [bp+4]
        mov     es, word ptr [bp+6]
        cmp     byte ptr es:[si+1], 7eh
        je      br_3DA56
        jmp     br_3DD57
br_3DA56:
        mov     al, byte ptr [P_SDS_EXCL_CH]
        cbw
        mov     cl, byte ptr es:[si+2]
        sub     ch, ch
        cmp     cx, ax
        je      br_3DA6C
        cmp     cl, 7fh
        je      br_3DA6C
        jmp     br_3DD57
br_3DA6C:
        mov     al, byte ptr es:[si+3]
        sub     ah, ah
        cmp     ax, 7fh
        jne     br_3DA7A
        jmp     br_3DD24
br_3DA7A:
        jbe     br_3DA7F
        jmp     br_3DD57
br_3DA7F:
        cmp     al, 3
        jne     br_3DA86
        jmp     br_3DC0E
br_3DA86:
        jg      br_3DA96
        dec     al
        je      br_3DAAE
        dec     al
        jne     br_3DA93
        jmp     br_3DB1C
br_3DA93:
        jmp     br_3DD57
br_3DA96:
        sub     al, 7ch
        jne     br_3DA9D
        jmp     br_3DCA2
br_3DA9D:
        dec     al
        jne     br_3DAA4
        jmp     br_3DCBA
br_3DAA4:
        dec     al
        jne     L_3D4AB
        jmp     br_3DCEA
L_3D4AB:
        jmp     br_3DD57
br_3DAAE:
        cmp     word ptr [C0_W_08DC4], 0
        je      br_3DAB8
        jmp     br_3DD57
br_3DAB8:
        cmp     word ptr [bp+8], 15h
        je      br_3DAC1
        jmp     br_3DD57
br_3DAC1:
        cmp     byte ptr es:[si+6], 8
        jae     br_3DACB
        jmp     br_3DD57
br_3DACB:
        cmp     byte ptr es:[si+6], 15h
        jbe     br_3DAD5
        jmp     br_3DD57
br_3DAD5:
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     word ptr es:[bx+R6480_W_04], 0
        mov     es, word ptr [bp+6]
        mov     al, byte ptr es:[si+5]
        sub     ah, ah
        shl     ax, 7
        mov     cl, byte ptr es:[si+4]
        sub     ch, ch
        or      ax, cx
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     word ptr es:[bx+R6480_W_02], ax
        push    word ptr [bp+6]
        push    si
        call    fn_3DD5C
        add     sp, 4
        or      ax, ax
        jne     L_3D50C
        jmp     br_3DD57
L_3D50C:
        mov     word ptr [C0_W_08DC4], 3
loop_3DB12:
        callf   EP_DISP_REQUEST_FLUSH_SEG:EP_DISP_REQUEST_FLUSH_OFF
        pop     si
        pop     di
        leave
        ret
        nop
br_3DB1C:
        cmp     word ptr [bp+8], 7fh
        je      br_3DB25
        jmp     br_3DD57
br_3DB25:
        cmp     word ptr [C0_W_08DC4], 3
        je      br_3DB2F
        jmp     br_3DD57
br_3DB2F:
        xor     cx, cx
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        cmp     word ptr es:[bx+R6480_W_0C], cx
        je      br_3DBAF
        mov     word ptr [bp-0ch], cx
        lea     ax, [si+6]
        mov     dx, word ptr [bp+6]
        mov     di, ax
        mov     word ptr [bp-6], dx
        mov     word ptr [bp-2], dx
        mov     si, ax
loop_3DB4E:
        cmp     word ptr es:[bx+0ch], 28h
        jne     br_3DB74
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[di+1]
        shr     al, 5
        sub     ah, ah
        lea     bx, [di-1]
        sub     dh, dh
        mov     dl, byte ptr es:[bx]
        shl     dx, 9
        or      ax, dx
        mov     dl, byte ptr es:[di]
        jmp     br_3DB85
        nop
br_3DB74:
        mov     es, word ptr [bp-6]
        lea     bx, [si-1]
        sub     ah, ah
        mov     al, byte ptr es:[bx]
        shl     ax, 9
        mov     dl, byte ptr es:[si]
br_3DB85:
        sub     dh, dh
        shl     dx, 2
        or      ax, dx
        add     ah, 80h
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        add     bx, word ptr [bp-0ch]
        mov     word ptr es:[bx+12h], ax
        add     word ptr [bp-0ch], 2
        add     si, 2
        add     di, 3
        inc     cx
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        cmp     word ptr es:[bx+R6480_W_0C], cx
        ja      loop_3DB4E
br_3DBAF:
        push    word ptr es:[bx+0ch]
        lea     ax, [bx+12h]
        push    es
        push    ax
        push    word ptr es:[bx+8]
        push    word ptr es:[bx+6]
        callf   EP_SMEM_WRITE_BLOCK_SEG:EP_SMEM_WRITE_BLOCK_OFF
        add     sp, 0ah
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        sub     dx, dx
        mov     ax, word ptr es:[bx+R6480_W_0C]
        add     word ptr es:[bx+R6480_DD_06], ax
        adc     word ptr es:[bx+R6480_DD_06+2], dx
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        push    word ptr es:[bx+R6480_W_04]
        push    7fh
        call    fn_3D6F4
        add     sp, 4
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        inc     word ptr es:[bx+R6480_W_04]
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     ax, word ptr es:[bx+R6480_W_0A]
        cmp     word ptr es:[bx+R6480_W_04], ax
        jae     br_3DC03
        jmp     br_3DD57
br_3DC03:
        mov     word ptr [C0_W_08DC4], 0
        pop     si
        pop     di
        leave
        ret
        nop
br_3DC0E:
        mov     di, si
        cmp     word ptr [C0_W_08DC4], 0
        je      br_3DC1A
        jmp     br_3DD57
br_3DC1A:
        cmp     word ptr [bp+8], 7
        je      br_3DC23
        jmp     br_3DD57
br_3DC23:
        mov     al, byte ptr es:[di+5]
        sub     ah, ah
        shl     ax, 7
        mov     cl, byte ptr es:[di+4]
        sub     ch, ch
        or      ax, cx
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     word ptr es:[bx+R6480_W_02], ax
        mov     ax, word ptr [C0_W_098DC]
        mov     dx, word ptr [C0_W_098DE]
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     ax, dx
        mov     cx, ds
        cmp     si, C1_TBL_SOUNDS_END
        jne     br_3DC59
        cmp     ax, cx
        jne     br_3DC59
        jmp     br_3DD57
br_3DC59:
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     ax, word ptr es:[bx+R6480_W_02]
        mov     word ptr [bp-0eh], ax
loop_3DC64:
        mov     es, word ptr [bp-2]
        mov     al, byte ptr es:[si+8]
        sub     ah, ah
        cmp     ax, word ptr [bp-0eh]
        je      br_3DC8E
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     si, ax
        mov     word ptr [bp-2], dx
        mov     cx, ds
        cmp     ax, C1_TBL_SOUNDS_END
        jne     loop_3DC64
        cmp     dx, cx
        jne     loop_3DC64
        pop     si
        pop     di
        leave
        ret
        nop
br_3DC8E:
        mov     ax, es
        mov     word ptr [C0_W_0D7C2], si
        mov     word ptr [C0_W_0D7C4], es
        mov     word ptr [C0_W_08DC4], 1
        pop     si
        pop     di
        leave
        ret
br_3DCA2:
        cmp     word ptr [bp+8], 6
        je      br_3DCAB
        jmp     br_3DD57
br_3DCAB:
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     word ptr es:[bx+10h], 0ffffh
        pop     si
        pop     di
        leave
        ret
        nop
br_3DCBA:
        cmp     word ptr [bp+8], 6
        je      br_3DCC3
        jmp     br_3DD57
br_3DCC3:
        cmp     word ptr [C0_W_08DC4], 3
        jne     br_3DCE0
        mov     word ptr [C0_W_08DC4], 0
        push    word ptr [C0_W_0D7C4]
        push    word ptr [C0_W_0D7C2]
        callf   EP_SOUND_LIST_UNLINK_SEG:EP_SOUND_LIST_UNLINK_OFF
        add     sp, 4
br_3DCE0:
        mov     word ptr [C0_W_08DC4], 0
        jmp     loop_3DB12
        nop
br_3DCEA:
        cmp     word ptr [C0_W_08DC4], 2
        jne     br_3DD57
        cmp     word ptr [bp+8], 6
        jne     br_3DD57
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     al, byte ptr es:[bx+R6480_W_04]
        dec     al
        and     al, 7fh
        mov     es, word ptr [bp+6]
        cmp     al, byte ptr es:[si+4]
        jne     br_3DD57
        mov     es, word ptr [C0_W_06482]
        sub     word ptr es:[bx+R6480_DD_06], 28h
        sbb     word ptr es:[bx+R6480_DD_06+2], 0
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        dec     word ptr es:[bx+R6480_W_04]
        jmp     br_3DD4D
br_3DD24:
        cmp     word ptr [C0_W_08DC4], 2
        jne     br_3DD57
        cmp     word ptr [bp+8], 6
        jne     br_3DD57
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        cmp     word ptr es:[bx+R6480_W_04], 0
        je      br_3DD4D
        mov     al, byte ptr es:[bx+R6480_W_04]
        dec     al
        and     al, 7fh
        mov     es, word ptr [bp+6]
        cmp     al, byte ptr es:[si+4]
        jne     br_3DD57
br_3DD4D:
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     word ptr es:[bx+R6480_W_10], 0
br_3DD57:
        pop     si
        pop     di
        leave
        ret
        db      00h
fn_3DD5C:
        enter   0ch, 0
        push    si
        mov     si, word ptr [bp+4]
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        push    word ptr es:[bx+R6480_W_04]
        push    7ch
        call    fn_3D6F4
        add     sp, 4
        push    1
        mov     es, word ptr [bp+6]
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
        sub     bh, bh
        or      cx, bx
        or      ax, cx
        mov     word ptr [bp-4], ax
        mov     word ptr [bp-2], dx
        push    dx
        push    ax
        callf   EP_SIZE_PARA_ROUND_MUL_SEG:EP_SIZE_PARA_ROUND_MUL_OFF
        add     sp, 6
        push    dx
        push    ax
        lea     ax, [bp-0ch]
        push    ss
        push    ax
        callf   EP_FAR_41518_SEG:EP_FAR_41518_OFF
        add     sp, 8
        or      dx, ax
        je      br_3DDC8
        jmp     br_3DF9C
br_3DDC8:
        mov     ax, word ptr [bp-4]
        mov     dx, word ptr [bp-2]
        les     bx, [bp-0ch]
        mov     word ptr es:[bx+2eh], ax
        mov     word ptr es:[bx+30h], dx
        les     bx, [bp-0ch]
        sub     ax, ax
        mov     word ptr es:[bx+28h], ax
        mov     word ptr es:[bx+26h], ax
        mov     es, word ptr [bp+6]
        cmp     byte ptr es:[si+13h], 7fh
        je      br_3DDF2
        mov     al, 1
br_3DDF2:
        les     bx, [bp-0ch]
        mov     byte ptr es:[bx+36h], al
        mov     es, word ptr [bp+6]
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
        sub     bh, bh
        or      cx, bx
        sub     bx, bx
        or      ax, cx
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        mov     al, byte ptr es:[si+12h]
        sub     ah, ah
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
        or      ax, cx
        les     bx, [bp-0ch]
        mov     word ptr es:[bx+2ah], ax
        mov     word ptr es:[bx+2ch], dx
        les     bx, [bp-0ch]
        mov     ax, word ptr es:[bx+2ah]
        mov     dx, word ptr es:[bx+2ch]
        sub     ax, word ptr [bp-8]
        sbb     dx, word ptr [bp-6]
        mov     word ptr es:[bx+32h], ax
        mov     word ptr es:[bx+34h], dx
        les     bx, [bp-0ch]
        cmp     word ptr es:[bx+34h], 0
        jge     br_3DE8C
        sub     ax, ax
        mov     word ptr es:[bx+34h], ax
        mov     word ptr es:[bx+32h], ax
br_3DE8C:
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
        mov     word ptr [bp-8], ax
        mov     word ptr [bp-6], dx
        cmp     ax, 5893h
        jne     br_3DED4
        or      dx, dx
        jne     br_3DED4
        les     bx, [bp-0ch]
        mov     word ptr es:[bx+38h], 0ac44h
        jmp     br_3DEE8
        GROW_PAD c0_grown, C0_END, SEG_C1 ; growth in c0 keeps C1_SEG on a paragraph
br_3DED4:
        push    dx
        push    ax
        push    3b9ah
        push    0ca00h
        nop
        push    cs
        if      FW_VERSION >= 112
        call    __aFuldiv
        elseif  FW_VERSION >= 110
        db      0e8h, 73h, 7ch
        else
        db      0e8h, 53h, 7ch
        endif
        les     bx, [bp-0ch]
        mov     word ptr es:[bx+38h], ax
br_3DEE8:
        push    0
        push    0
        mov     ax, word ptr [bp-0ch]
        mov     dx, word ptr [bp-0ah]
        add     ax, 12h
        push    dx
        push    ax
        callf   EP_FAR_484D6_SEG:EP_FAR_484D6_OFF
        add     sp, 8
        push    0
        les     bx, [bp-0ch]
        push    word ptr es:[bx+34h]
        push    word ptr es:[bx+32h]
        nop
        push    cs
        call    addr_calc_segment
        add     sp, 6
        les     bx, [bp-0ch]
        mov     word ptr es:[bx+3ah], ax
        mov     word ptr es:[bx+3ch], dx
        mov     ax, word ptr [bp-0ch]
        mov     dx, word ptr [bp-0ah]
        mov     word ptr [C0_W_0D7C2], ax
        mov     word ptr [C0_W_0D7C4], dx
        mov     es, word ptr [bp+6]
        cmp     byte ptr es:[si+6], 0fh
        jb      L_3D602
        mov     ax, 28h
        jmp     br_3DF3F
        nop
L_3D602:
        mov     ax, 3ch
br_3DF3F:
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     word ptr es:[bx+R6480_W_0C], ax
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        sub     dx, dx
        mov     ax, word ptr es:[bx+R6480_W_0C]
        push    dx
        push    ax
        add     ax, word ptr [bp-4]
        adc     dx, word ptr [bp-2]
        sub     ax, 1
        sbb     dx, 0
        push    dx
        push    ax
        nop
        push    cs
        if      FW_VERSION >= 112
        call    C1_BASE+tgt_45BAC-SEGBASE
        elseif  FW_VERSION >= 110
        db      0e8h, 80h, 7ch
        else
        db      0e8h, 60h, 7ch
        endif
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     word ptr es:[bx+R6480_W_0A], ax
        les     bx, [bp-0ch]
        mov     ax, word ptr es:[bx+0ah]
        mov     dx, word ptr es:[bx+0ch]
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        mov     word ptr es:[bx+R6480_DD_06], ax
        mov     word ptr es:[bx+R6480_DD_06+2], dx
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        push    word ptr es:[bx+R6480_W_04]
        push    7fh
        call    fn_3D6F4
        add     sp, 4
        mov     ax, 1
        pop     si
        leave
        ret
        nop
br_3DF9C:
        les     bx, [C2_FP_MIDI_IN_BLOCK]
        push    word ptr es:[bx+R6480_W_04]
        push    7dh
        call    fn_3D6F4
        add     sp, 4
        xor     ax, ax
        pop     si
        leave
        ret
        db      00h
sound_wave_overview_build:
        enter   8, 0
        push    di
        push    si
        mov     ax, word ptr [C0_W_0D7C2]
        mov     dx, word ptr [C0_W_0D7C4]
        mov     si, ax
        mov     word ptr [bp-2], dx
        xor     ax, ax
        mov     cx, 11efh
        xor     bx, bx
        mov     dx, 7c00h
        mov     di, bx
        mov     es, dx
        rep stosw
        mov     ax, word ptr [bp-2]
        mov     cx, ds
        cmp     si, C1_TBL_SOUNDS_END
C0_END:
