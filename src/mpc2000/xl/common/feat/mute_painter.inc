; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; MUTE_GROUPS -- "Mute group:" value painter and repaint trampoline at
; ARENA_MG_DRAW (feat/pins.inc; v1.20 flash 0x743F0); pads forward to that pinned
; offset.

        if      FREE_ARENA+ARENA_MG_DRAW-$ < 0
        fatal   "include out of order: ARENA_MG_DRAW already passed"
        endif
        PAD_TO  FREE_ARENA+ARENA_MG_DRAW, 000h      ; pad forward to the pinned offset

; flash 0x743F0, 58 bytes, past the OS program-record array (0x65AE0-0x741B0),
; just above the 0x743B0 field thunk.  code only.  two far entries,
; both pinned by far pointers elsewhere; no near branches:
;   mg_draw  (0x743F0) -- field descriptor entry 3's FIELD_NOTIFY slot
;   mg_paint (0x7441F, MG_PAINT_SEG:MG_PAINT_OFF) -- MUTE ASSIGN repaint tail, c2's far call


; draw the selected pad's mute group number at (MG_VAL_X, MG_ROW_Y) -- the row
; whose caption mute_drawlist.inc rewrote to "Mute group:".  same two numbers on
; the 2K, where the same rewrite is made in data.asm.
mg_draw:
        mov     al, [MG_DRUM]            ; drum index
        mov     ah, 040h
        mul     ah                      ; AX = program * 64
        add     al, [MG_NOTE]            ; + selected pad note
        adc     ah, 0
        sub     ax, 023h
        mov     bx, ax
        mov     ax, MG_GROUP_SEG
        mov     es, ax                  ; ES:BX -> this pad's group byte
        mov     al, es:[bx]
        sub     ah, ah
        push    2                       ; field width  (digits)
        push    0                       ; flags
        push    ax                      ; value
        push    MG_ROW_Y                ; y
        push    MG_VAL_X                ; x
        callf   EP_DRAW_UNSIGNED_VALUE_SEG:EP_DRAW_UNSIGNED_VALUE_OFF
        add     sp, 0ah
        retf

; spliced into the MUTE ASSIGN repaint at 0x5088C: extra field, then the
; displaced stock tail call.
mg_paint:
        ASSERT_AT MG_PAINT_SEG*16+MG_PAINT_OFF-SEGBASE
        callf   LSEG(SEGBASE+mg_draw):LOFF(SEGBASE+mg_draw)
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF ; the call the patch replaced
        retf
