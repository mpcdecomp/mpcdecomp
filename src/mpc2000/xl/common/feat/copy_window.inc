; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; COPY_NOTE_PARAMS -- relocated COPY window descriptor + draw list at the DS
; slot's DS_SLOT_CP_WIN (feat/ds_slot.inc; v1.20 DS:702Eh, flash 0x5F2DE); pads
; forward to that pinned offset.

        PAD_TO  FEAT_DS_SLOT+DS_SLOT_CP_WIN, 000h      ; pad forward to the pinned offset
        ASSERT_AT FEAT_DS_SLOT+DS_SLOT_CP_WIN

; 127 bytes: the stock COPY window at DS:377Eh (v1.20 flash 0x5BA2E, 122 bytes)
; plus one key/handler pair and one soft-key draw item.  DS-relative, so not the
; code-only arena.
; PINNED by c2's two pushes of CP_WIN and CP_WIN_ITEMS, in place of stock's
; `push 0377Eh` and `push 0379Ch`.
; descriptor: WIN_KEY_CLEAR header record, WIN_KEY records, WIN_KEY_END -- the
; same 5-byte {key, dw offset, dw segment} shape as the 2K, from
; src/common/window_macros.inc.  key = raw panel button code + 1.


        WIN_KEY_CLEAR                   ; header, unchanged from stock

        WIN_KEY CP_KEY_PARAMS, LSEG(CP_PARAMS_LIN), LOFF(CP_PARAMS_LIN) ; NEW
        WIN_KEY WIN_K_F4,    EP_COPY_NOTE_CLOSE_SEG, EP_COPY_NOTE_CLOSE_OFF
        WIN_KEY WIN_K_F5,    EP_COPY_NOTE_F5_SEG, EP_COPY_NOTE_F5_OFF ; single-pad DO IT
        WIN_KEY WIN_K_PAINT, LSEG(CP_REPAINT_LIN), LOFF(CP_REPAINT_LIN)
        WIN_KEY WIN_K_OPEN,  EP_COPY_NOTE_CLOSE_SEG, EP_COPY_NOTE_CLOSE_OFF
        WIN_KEY_END

        ASSERT_AT FEAT_DS_SLOT+DS_SLOT_CP_WIN+CP_ITEMS_AT

; ---- draw list: the stock list at DS:379Ch plus the extra soft key
        WIN_LABEL 019h, 010h, "COPY"
        WIN_BITMAP 01fh, 019h, 002h
        WIN_LABEL 037h, 00bh, "Prog:__-"
        WIN_LABEL 037h, 014h, "Note:__/___-"
        WIN_RULE 00ch, 037h, 01dh, 0b0h
        WIN_LABEL 037h, 020h, "Prog:__-"
        WIN_LABEL 037h, 029h, "Note:__/___-"
        WIN_SOFTKEY CP_FKEY, SK_BOX, "PARAMS"          ; NEW
        WIN_SOFTKEY 4, SK_FILL, "CLOSE"
        WIN_END
