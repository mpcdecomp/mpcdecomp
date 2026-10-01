; code parts word-aligned to 90h, next part at next paragraph (00h fill).
; DATA starts after TEXT2's last byte; its segment frame holds that byte
; (v1.50 offset 2, v1.72 0Ah), not DS:0. far pointers store segment
; relative to load segment; MZ table makes them absolute.

TEXT1_SEG                       equ     0
TEXT2_SEG                       equ     T1_END/16
DATA_START                      equ     TEXT2_SEG*16+T2_END
DATA_SEG                        equ     DATA_START/16
DATA_ORG                        equ     DATA_START#16

; close code part by word-aligning with 90h
CODE_END macro
        if      $ # 2
         db     90h
        endif
        endm

; close code part and pad to paragraph boundary
PARA_END macro
        CODE_END
        db      (16-$#16)#16 dup (0)
        endm
