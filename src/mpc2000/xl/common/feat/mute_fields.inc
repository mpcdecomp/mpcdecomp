; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; MUTE_GROUPS -- relocated, extended MUTE ASSIGN field-descriptor array at the
; DS slot's DS_SLOT_MG_FIELDS (feat/ds_slot.inc; v1.20 DS:6F86h, flash 0x5F236).

        ASSERT_AT FEAT_DS_SLOT+DS_SLOT_MG_FIELDS

; 168 bytes = 4 x 42.  not the consts pad at 0x603D8-0x65ACF (v1.20): that range
; is BSS -- the OS's own init zeroes it with `mov di,8128h / mov cx,0D820h /
; sub cx,di / rep stosw 0CCCCh` at flash 0x35F50, every boot, before this array
; is read.
; the stock 3-entry array at DS:3CF8h (0x5BFA8) cannot grow in place, so it is
; copied here with a 4th entry and the cursor chain re-linked 0 -> 3 -> 1 -> 2.
; PINNED: base is a literal immediate in the walker (`imul bx,[08D7Eh],02Ah` /
; `callf [bx+8136h]`), retargeted by the byte patches at 0x506B6, 0x5076D,
; 0x508CD, 0x508E2, 0x5091D, 0x50959.
; 42-byte (02Ah) descriptor, consumed by the engine at 0x3BDBE; symbols.inc names:
;   +00 FIELD_X      +01 FIELD_Y      +02 FIELD_CLASS   +03 FIELD_DIGITS
;   +04 FIELD_STORE  dw, flags:8 | width:8 -- one word, not a step
;   +06 FIELD_MIN dd   +0A FIELD_MAX dd   +0E FIELD_THUNK dd, far -> own thunk
;   +12 FIELD_PREV dd  +16 FIELD_NEXT dd  +22 FIELD_NOTIFY dd  +26 FIELD_ENTER dd
;   +1A/+1E dd -- zero in the stock note fields; entry 3 points both at its own
;        thunk.  roles ?


; each stock thunk is stored twice over: as FIELD_THUNK in the farcalls.inc
; pair, as a cursor link normalized.
MG_THUNK0        equ     EP_MUTE_ASSIGN_FIELD0_THUNK_SEG*16+EP_MUTE_ASSIGN_FIELD0_THUNK_OFF
MG_THUNK1        equ     EP_MUTE_ASSIGN_FIELD1_THUNK_SEG*16+EP_MUTE_ASSIGN_FIELD1_THUNK_OFF
MG_THUNK2        equ     EP_MUTE_ASSIGN_FIELD2_THUNK_SEG*16+EP_MUTE_ASSIGN_FIELD2_THUNK_OFF

; ---- entry 0
; "Note:" -- pad being edited; cursor-down goes to the new field.
        db      037h, 00bh              ; x, y
        db      0a2h, 002h              ; FIELD_CLASS, FIELD_DIGITS
        dw      1                       ; FIELD_STORE: one unsigned byte
        dd      023h                    ; min  (note 35)
        dd      062h                    ; max  (note 98)
        dw      EP_MUTE_ASSIGN_FIELD0_THUNK_OFF, EP_MUTE_ASSIGN_FIELD0_THUNK_SEG
        dw      0, 0                    ; prev -> none
        FARPTR_N MG_NEW_THUNK           ; next -> the new field
        dw      0, 0
        dw      0, 0
        dw      0, 0
        dw      0, 0

; ---- entry 1
; "Note:" -- first "Mutes off:" note; cursor-up goes to the new field.
        db      037h, 01eh
        db      0a2h, 002h
        dw      1
        dd      022h
        dd      062h
        dw      EP_MUTE_ASSIGN_FIELD1_THUNK_OFF, EP_MUTE_ASSIGN_FIELD1_THUNK_SEG
        FARPTR_N MG_NEW_THUNK           ; prev -> the new field
        FARPTR_N MG_THUNK2              ; next
        dw      0, 0
        dw      0, 0
        dw      0, 0
        dw      0, 0

; ---- entry 2
; "Note:" -- second "Mutes off:" note; stock entry, unchanged.
        db      037h, 027h
        db      0a2h, 002h
        dw      1
        dd      022h
        dd      062h
        dw      EP_MUTE_ASSIGN_FIELD2_THUNK_OFF, EP_MUTE_ASSIGN_FIELD2_THUNK_SEG
        FARPTR_N MG_THUNK1              ; prev
        dw      0, 0                    ; next -> none
        dw      0, 0
        dw      0, 0
        dw      0, 0
        dw      0, 0

; ---- entry 3 (new)
; "Mute group:" -- 0..15, on the relabelled caption's row.
        db      MG_VAL_X, MG_ROW_Y      ; the relabelled caption's row
        db      00ch, 002h              ; FIELD_CLASS 0Ch plain integer ?
        dw      1
        dd      0                       ; min  (0 = no group)
        dd      MG_MAX                  ; max
        FARPTR_N MG_NEW_THUNK           ; own
        FARPTR_N MG_THUNK0              ; prev -> entry 0
        FARPTR_N MG_THUNK1              ; next -> entry 1
        FARPTR_N MG_NEW_THUNK
        FARPTR_N MG_NEW_THUNK
        FARPTR_N MG_NOTIFY              ; FIELD_NOTIFY -> the painter
        dw      0, 0

; 4 x 42 = 168 bytes.  the COPY window descriptor follows at DS_SLOT_CP_WIN.
