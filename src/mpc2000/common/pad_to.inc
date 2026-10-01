; PAD_TO <offset>, <fill> -- fill from here up to <offset> in the part.
;
; rept assembles a negative count to nothing, so a pad whose part has grown
; past its end would vanish and everything after it would slide down, pinned
; addresses and all.  This fails the build instead.  error, not fatal: on
; pass 1 an offset built on a forward reference is not yet its final value.

        ifndef  PAD_TO_INC
PAD_TO_INC equ          1

PAD_TO  macro   upto, fill
        if      (upto) < $
         error  "PAD_TO: the part runs past the offset this pad fills to"
        endif
        rept    (upto)-$
        db      fill
        endm
        endm
        endif
