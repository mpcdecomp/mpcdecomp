; Each part assembles at own segment offset; base = size of prior parts,
; segment = its paragraph. Layout (both versions): cs0 word-aligned (00h),
; cs1 starts after cs0 (unaligned), ends paragraph-aligned (00h), data
; starts DS:0 on same paragraph. Sizes from parts' end labels (public.inc).

        include "public.inc"
        include "aliases.inc"

CS0_BASE                        equ     0
CS1_BASE                        equ     CS0_BASE+CS0_SIZE
DATA_BASE                       equ     CS1_BASE+CS1_SIZE

CS0_SEG                         equ     CS0_BASE/16
CS1_SEG                         equ     CS1_BASE/16
CS1_ORG                         equ     CS1_BASE#16
DATA_SEG                        equ     DATA_BASE/16

; WORD_END -- close cs0: word-align with 00h.
WORD_END macro
        if      $ # 2
         db     0
        endif
        endm

; PARA_END -- close cs1: pad to its paragraph's end with 00h.  $ is an offset
; from a paragraph, so $#16 is the linear address's.
PARA_END macro
        db      (16-$#16)#16 dup (0)
        endm

; offsets are 16-bit; image must end below MPC2000.SYS at linear 30000h.
; validated after each part's end label is known.
SYS_LINEAR                      equ     30000h

        if      DATA_BASE#16 <> 0
        fatal   "DATA_SEG: data no longer starts on a paragraph"
        endif

        if      CS0_SIZE > 10000h
        fatal   "cs0 no longer fits its 64 KB segment"
        endif
        if      CS1_ORG+CS1_SIZE > 10000h
        fatal   "cs1 no longer fits its 64 KB segment"
        endif
        if      DATA_SIZE > 10000h
        fatal   "data no longer fits its 64 KB segment"
        endif
        if      DATA_BASE+DATA_SIZE > SYS_LINEAR
        fatal   "the image now runs into MPC2000.SYS at linear 30000h"
        endif
