; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; the feature tail, included at the end of data.asm.  every feature's code and
; state live here, above the boot zero-fill sweep over DS 04EB0h-BSS_END (text1.asm
; L_003EA), which is cleared on every power-up.  arena map in defs.inc; each
; include pads itself forward to its own base.
        include "tail_defs.inc"

        ifdef   ZONE_SLICE
        include "zone_tail.inc"
        endif
        ifdef   MUTE_GROUPS
        include "mute_tail.inc"
        endif
        ifdef   TUNE_LIMIT
        include "tune_tail.inc"
        endif
        ifdef   COPY_NOTE_PARAMS
        include "copy_tail.inc"
        endif
; OTHER->VERSIONS reads OS version from image tail, not fixed offset.
; feature tail appended showed " ST TO END     " (last 16 bytes of
; ZONE_SLICE's action-label table). repeat same 16 bytes at any new image
; end.
        if      $ > SYS_STAMP_END
        SYS_STAMP
        endif
