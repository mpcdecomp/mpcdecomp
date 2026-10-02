; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; SKIP_DRUM_SELECT -- the drum-select handler-set install every version makes
; at the same point, 9 bytes either way.  TARGET is the version's own spelling
; of the near call to handler_set_install.

SKIP_DRUM_HOOK  macro   target
        ifdef   SKIP_DRUM_SELECT
        callf   [bp+6]                  ; straight to the caller's continuation
        nop
        nop
        nop
        nop
        nop
        nop
        else
        push    ds
        push    C2_TBL_WINKEYS_MIXER_SELECT_PGM
        nop
        push    cs
        call    target
        endif
        endm
