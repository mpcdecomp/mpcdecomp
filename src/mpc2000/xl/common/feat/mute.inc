; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; MUTE_GROUPS -- the hook sites every version shares.  each macro is the stock
; bytes without MUTE_GROUPS and the feature's with it, the same size either way.
; the rest of the feature: feat/mute_*.inc, placed by these, by
; RUN_VOICE_START_1_S1 and RUN_DRAW_VLINE_4 (common/c0.inc), by
; feat/ds_slot.inc and by feat/arena.inc.

; c0's segment anchor.  every version pads up to C0_SEG:0010h, the 16 bytes
; before it are C0_SEG:0000h, and the choke hook's tail lives there (a near JMP
; away from it).  END = the pad's end, C0_SEG:0010h; C0_ORIGIN is C0_SEG:0000h.
; code grown past END-10h moves the anchor to the next paragraph instead.
MG_C0_PAD       macro   end,{GLOBALSYMBOLS}
        if      $ > (end)-010h
        PAD_TO  $+((10h-((SEGBASE+$)&0fh))&0fh), 000h
        else
        PAD_TO  (end)-010h, 000h
        endif
C0_ORIGIN:
        ifdef   MUTE_GROUPS
        include "../common/feat/mute_tail.inc"
        endif
        PAD_TO  C0_ORIGIN+010h, 000h
        endm

; MUTE ASSIGN pad handler: a pad hit with the cursor on no stock field skips
; to WALKER; with the new 4th field it still writes Note:.
MG_PAD_SKIP     macro   walker
        ifdef   MUTE_GROUPS
        jmp     br_50732                ; a pad hit on the new field still writes Note:
        else
        jmp     SHORT walker
        endif
        endm

; MUTE ASSIGN repaint tail: the field engine's redraw, the extra field first.
MG_REDRAW       macro
        ifdef   MUTE_GROUPS
        callf   MG_PAINT_SEG:MG_PAINT_OFF ; extra field first
        else
        callf   EP_FIELD_ENGINE_REDRAW_SEG:EP_FIELD_ENGINE_REDRAW_OFF
        endif
        endm

; MUTE ASSIGN draw list, 60 bytes in place at DS:3CBCh, and its pad byte.
MG_DRAWLIST     macro
        ifdef   MUTE_GROUPS
        include "../common/feat/mute_drawlist.inc"
        else
        db      07h, 19h, 0bh, 4eh, 6fh
        db      74h, 65h, 3ah, 00h
        WIN_LABEL 13h, 15h, "Mutes off:"
        WIN_LABEL 19h, 1eh, "Note:"
        WIN_LABEL 19h, 27h, "Note:"
        WIN_SOFTKEY 4, 2, "CLOSE"
        db      1ah, 05h, 01h
        db      50h, 4ch, 41h, 59h, 00h
        WIN_END
        db      00h
        endif
        endm
