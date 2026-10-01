; fatal unless assembler at <addr>; proves fixed-block equates match bytes.
; checked every pass: $ final pass 1 (forward jmps could shift later offsets).

        ifndef  ASSERT_AT_INC
ASSERT_AT_INC equ      1

ASSERT_AT macro want
        if      $ <> want
         fatal  "ASSERT_AT: the bytes here are not at the address that names them"
        endif
        endm
        endif
