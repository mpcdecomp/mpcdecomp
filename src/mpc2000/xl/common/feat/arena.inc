; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; the feature arena, the rest of the free part from where it starts.  erased in
; flash, all of it, but not all free at runtime: the OS's own program-record
; array runs up to FEAT_ARENA_LIN (feat/pins.inc) and every byte below it is
; live once its slot's program exists.  so the arena starts there, and every
; blob in it is pinned at an ARENA_* offset from it.

FREE_ARENA equ  FEAT_ARENA_LIN-SEGBASE
        if      PGM_ARRAY_DS#16 <> 0
        error   "free: PGM_ARRAY_DS is not a paragraph; PGM_ARRAY_LIN rounds it"
        endif
        if      FREE_ARENA > 10000h
        error   "free: the OS's program-record array runs past the free part"
        endif
        PAD_TO  FREE_ARENA-0d6f2h, 000h
d_c2_tbl_0e80e:
        PAD_TO  FREE_ARENA-0c4bah, 000h
d_c0_tbl_0fa46:
        PAD_TO  FREE_ARENA, 000h
        ASSERT_AT FREE_ARENA

        ifdef   COPY_NOTE_PARAMS
        include "copy_params.inc"
        endif
        ifdef   MUTE_GROUPS
        include "mute_thunk.inc"
        include "mute_painter.inc"
        endif
        ifdef   TUNE_LIMIT
        include "tune_fold.inc"
        endif
