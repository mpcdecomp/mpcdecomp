; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; COPY_NOTE_PARAMS -- addresses for the base-2K PARAMS soft key.

; display list DL_COPY_NOTE_PARAMS, handlers TBL_COPY_NOTE_PARAMS_KEYS
; F4=CLOSE, F5=DO IT; F2 free
CP_T2_REPAINT                   equ     X_067E8          ; the window's stock 32h repaint handler
CP_T2_DOIT                      equ     L_0672E          ; its F5 DO IT: the copy this one reuses,
CP_KEY_PARAMS                   equ     WIN_K_F2        ; 03h; raw front-panel code + 1

; voice_trigger_full ds, 8A0Dh, 3, 55h, 29h, 0Ah, 0, 0
; cursor box 55h..8Bh stored at 8CB0h (54px); notice 8Ch..0E6h (15 chars)
; "Note:" at 37h, TEXT2 3992h draws; rule row 1Dh safe
; avoid SOURCE rows 0Bh, 14h glyphs (overlap y=10h), COPY 10h
CP_FKEY                         equ     002h            ; F2, so WIN_SOFTKEY's fkey number
CP_NOTICE_X                     equ     08ch
CP_NOTICE_Y                     equ     029h
