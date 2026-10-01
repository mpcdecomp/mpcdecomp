; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; the DS slot: consts's second copy of the credits drawing, 1861 bytes -- 155
; blank bytes, the 1527-byte rows, 179 blank bytes.  nothing reaches this copy
; by name or by a computed pointer in any version, it is
; DS-reachable and clear of the OS's own BSS fill, so the DS-relative feature
; blobs live here, each at a DS_SLOT_* offset (feat/defs.inc).  either feature
; drops the drawing; the slot's end is fixed either way, so nothing after it
; moves.

FEAT_DS_SLOT:
        ifdef   MUTE_GROUPS
        include "mute_fields.inc"
        endif
        ifdef   COPY_NOTE_PARAMS
        include "copy_window.inc"
        endif
        ifndef  MUTE_GROUPS
        ifndef  COPY_NOTE_PARAMS
        PAD_TO  FEAT_DS_SLOT+09bh, 000h

TBL_CREDITS_ROWS_2:                     ; credits drawing 2 rows 5..53, byte-identical to drawing 1
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

        endif
        endif
        if      FEAT_DS_SLOT+0745h-$ < 0
        fatal   "the DS slot's blobs run past its 1861 bytes"
        endif
        PAD_TO  FEAT_DS_SLOT+0745h, 000h
