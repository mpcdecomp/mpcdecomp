; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; TUNE_LIMIT -- DATA-segment tail: the pitch ratio past +/-240.
;
; TBL_PITCH_RATIO holds round(4096 * 2^(t/120)) for t = -240..+240 only, with
; live data on both sides.  two octaves are a factor of four, so a tune past
; either end folds back into the table and shifts: t > 240 reads t-240 and
; multiplies by 4, t < -240 reads t+240 and divides by 4.  inside +/-240 it is
; the stock lookup.  the ratio is unsigned 4.12, so t = 480 would wrap to 0 --
; hence TUNE_LIMIT <= 479 (src/mpc2000/common/feat/tune.inc).
;
; far-called from voice_pitch_ratio (text1 br_02EFF) with SI = the clamped tune
; sum and DS = DATA.  returns AX = the ratio; clobbers CX and SI.

; data.asm label is CS-typed to ASL; equate carries value to avoid CS override
TL_PITCH_RATIO                  equ     TBL_PITCH_RATIO

        PIN0_MIN TL_RATIO

        ASSERT_AT TL_RATIO
        mov     cx, 0f0h
        cmp     si, cx
        jg      tlr_fold                ; above the table: fold down 240
        neg     cx
        cmp     si, cx
        jl      tlr_fold                ; below it: fold up 240
        xor     cx, cx
tlr_fold:
        sub     si, cx
        add     si, si
        mov     ax, word ptr [si+TL_PITCH_RATIO]
        jcxz    tlr_done
        shl     ax, 2                   ; x4 above
        or      ch, ch
        jns     tlr_done
        shr     ax, 4                   ; /4 below: the x4 undone, then /4
tlr_done:
        retf
