; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; TUNE_LIMIT -- the tune-sum clamp: +/-240 tenths of a semitone, the span of
; TBL_PITCH_RATIO.  TUNE_LIMIT widens the clamp; the lookup past +/-240 folds
; back into the same table through tl_ratio
; (src/mpc2000/xl/common/feat/tune_fold.inc, src/mpc2000/2k/common/feat/tune_tail.inc)
; instead of a second, wider table.

        ifdef   TUNE_LIMIT
        if      (TUNE_LIMIT < 1) || (TUNE_LIMIT > 479)
         fatal  "TUNE_LIMIT must be 1..479"
        endif
TUNE_MAX        equ     TUNE_LIMIT
        else
TUNE_MAX        equ     240
        endif
