; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; TUNE_LIMIT -- the base-2K hooks.  the PROGRAM screen's and the Velo>>Pitch
; window's Tune: fields push -TUNE_MAX/TUNE_MAX as their range, which is stock's
; 0FF10h/0F0h with the option off.  the window's sample-time readout keeps its
; +/-240 clamp: it is display only.

; voice tune sum clamps at +/-TUNE_LIMIT instead of +/-240; TL_RATIO from
; tail reaches past two-octave table (br_02EFF)
TL_HOOK_VOICE_RATIO macro {GLOBALSYMBOLS}
        ifdef   TUNE_LIMIT
        mov     ax, TUNE_LIMIT
        cmp     si, ax
        jle     tl_clamp_lo
        mov     si, ax
tl_clamp_lo:
        neg     ax
        cmp     si, ax
        jge     tl_lookup
        mov     si, ax
tl_lookup:
        callf   ZS_DS:TL_RATIO
        mov     word ptr es:[di+0eh], ax
        pop     si
        pop     di
        leave
        ret     0ah
        db      00h, 00h, 00h
        else
        cmp     si, 0f0h
        jle     br_02F08
        mov     si, 0f0h

br_02F08:
        cmp     si, 0ff10h
        jge     br_02F11
        mov     si, 0ff10h
br_02F11:
        add     si, si
        mov     ax, word ptr [si+TBL_PITCH_RATIO]
        mov     word ptr es:[di+0eh], ax
        pop     si
        pop     di
        leave
        ret     0ah
        db      00h
        endif
        endm
