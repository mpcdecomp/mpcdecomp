; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; the tail's fixed slices, from BSS_END (map in defs.inc), and each feature's
; addresses in its own.  tail.inc includes this past bss.inc, where BSS_END is
; laid out, so every address the tail pins itself to is known by then; text1
; and text2 name them ahead of it.
FEAT_TAIL                       equ     BSS_END
ZS_TAIL_CODE                    equ     FEAT_TAIL
ZONE_TABLE_BASE                 equ     FEAT_TAIL+0890h
MG_CODE                         equ     FEAT_TAIL+0a70h
TL_RATIO                        equ     FEAT_TAIL+0ee4h

        ifdef   ZONE_SLICE
        include "zone_defs.inc"
        endif
        ifdef   MUTE_GROUPS
        include "mute_defs.inc"
        endif
        ifdef   COPY_NOTE_PARAMS
        include "copy_defs.inc"
        endif
