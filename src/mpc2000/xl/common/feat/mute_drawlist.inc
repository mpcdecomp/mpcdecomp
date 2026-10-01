; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; MUTE_GROUPS -- MUTE ASSIGN draw list, 60 bytes in place at 0x5BF6C = DS:3CBCh.
; stock list with "Mutes off:" -> "Mute group:", one byte longer, so the rest
; shifts down one and the trailing pad byte is reclaimed.
        WIN_LABEL 019h, 00bh, "Note:"
        WIN_LABEL 013h, 015h, "Mute group:"            ; stock: "Mutes off:"
        WIN_LABEL 019h, 01eh, "Note:"
        WIN_LABEL 019h, 027h, "Note:"
        WIN_SOFTKEY 4, SK_FILL, "CLOSE"
        WIN_SOFTKEY 5, SK_BOX, "PLAY"
        WIN_END
