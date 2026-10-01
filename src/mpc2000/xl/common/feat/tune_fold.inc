; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; TUNE_LIMIT -- the pitch-ratio fold routine at ARENA_TL_RATIO (feat/pins.inc;
; v1.20 flash 0x74430); pads forward to that pinned offset.

        if      FREE_ARENA+ARENA_TL_RATIO-$ < 0
        fatal   "include out of order: ARENA_TL_RATIO already passed"
        endif
        PAD_TO  FREE_ARENA+ARENA_TL_RATIO, 000h      ; pad forward to the pinned offset

; TBL_PITCH_RATIO (DS:0236h) holds round(4096 * 2^(t/120)) for t = -240..+240
; only, with live data on both sides.  two octaves are a factor of four, so a
; tune past either end folds back into the table and shifts: t > 240 reads
; t-240 and multiplies by 4, t < -240 reads t+240 and divides by 4.  inside
; +/-240 it is the stock lookup.  the ratio is unsigned 4.12, so t = 480 would
; wrap to 0 -- hence TUNE_LIMIT <= 479 (src/common/feat/tune.inc).  same table,
; same format as the 2K's TL_PITCH_RATIO; this is the 2K's TL_RATIO ported.
;
; far-called from br_38B54 (common/c0.inc) and loop_50E27 (common/c2.inc) with
; SI = the clamped tune sum and DS = DS_SEG.  returns AX = the ratio; clobbers
; CX and SI.  ASSERT_AT proves TL_RATIO_SEG:TL_RATIO_OFF names this address.
        ASSERT_AT TL_RATIO_SEG*16+TL_RATIO_OFF-SEGBASE
tl_ratio:
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
        mov     ax, word ptr [si+TBL_PITCH_RATIO]
        jcxz    tlr_done
        shl     ax, 2                   ; x4 above
        or      ch, ch
        jns     tlr_done
        shr     ax, 4                   ; /4 below: the x4 undone, then /4
tlr_done:
        retf
