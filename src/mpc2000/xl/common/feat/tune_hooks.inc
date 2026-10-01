; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; TUNE_LIMIT -- the XL hook sites every version shares, on the clamp in
; src/common/feat/tune.inc.

; the voice-start clamp and ratio lookup, SI = tune sum -> AX = pitch ratio.
; TUNE_LIMIT's far call is the table read's size plus a NOP, so nothing moves.
TUNE_RATIO_SI   macro {GLOBALSYMBOLS}
        cmp.w   si, TUNE_MAX
        jle     br_38B60
        mov     si, TUNE_MAX
        jmp     br_38B69
        db      90h
br_38B60:
        cmp.w   si, -TUNE_MAX
        jge     br_38B69
        mov     si, -TUNE_MAX
br_38B69:
        ifdef   TUNE_LIMIT
        callf   TL_RATIO_SEG:TL_RATIO_OFF   ; folds past +/-240 into TBL_PITCH_RATIO
        nop
        else
        add     si, si
        mov     ax, word ptr [si+TBL_PITCH_RATIO]
        endif
        endm

; a Tune: field's range, 0.1-semitone steps (stock +/-240)
TUNE_RANGE      macro
        dd      -TUNE_MAX, TUNE_MAX
        endm
