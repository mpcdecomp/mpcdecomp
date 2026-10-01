; MZ header, relocation table. e_cblp/e_cp/e_ss from assembled size via
; mz_stack.inc. e_minalloc: paragraphs past image for stack.
; e_crlc: RELOC entry count. e_ip: exe_entry_point (cs0's label).
; e_cparhdr: table end rounded up, floored at STOCK_PARAS; keeps
; trailing slack.
; linker fields past e_ovno: 01h 00h FBh 50h 'jr'.
; RELOC_N and STOCK_PARAS are version-specific (image.asm).

MARGIN                          equ     0
ADJUST                          equ     0
STACK_BYTES                     equ     00080h          ; e_sp, the stack above e_ss
        include "../../../common/mz_reloc.inc"

RELOC_AT                        equ     03eh
RELOC_END                       equ     RELOC_AT + 4*RELOC_N
        if      (RELOC_END+15)/16 > STOCK_PARAS
HEADER_PARAS                    equ     (RELOC_END+15)/16
        elseif
HEADER_PARAS                    equ     STOCK_PARAS
        endif
HEADER_BYTES                    equ     HEADER_PARAS*16
        include "../../../common/mz_stack.inc"
MINALLOC                        equ     (E_SS*16+STACK_BYTES-IMAGE_BYTES+15)/16

        if      IMAGE_BYTES <> DATA_BASE+DATA_SIZE
         fatal  "the parts' sizes do not add up to the image"
        endif

        db      4dh, 5ah                ; e_magic  "MZ"
        dw      CBLP, CP                ; e_cblp, e_cp
        dw      RELOC_N                 ; e_crlc
        dw      HEADER_PARAS            ; e_cparhdr
        dw      MINALLOC, 0ffffh        ; e_minalloc, e_maxalloc
        dw      E_SS                    ; e_ss
        dw      STACK_BYTES             ; e_sp
        dw      0                       ; e_csum
        dw      exe_entry_point, CS0_SEG ; e_ip, e_cs
        dw      RELOC_AT                ; e_lfarlc
        dw      0                       ; e_ovno
        db      01h, 00h, 0fbh, 50h, 6ah, 72h
        db      (RELOC_AT-$) dup (00h)

        if      $ <> RELOC_AT
         fatal  "MZ header fields no longer end where e_lfarlc says they do"
        endif
        include "reloc.inc"
        if      RELOC_COUNT <> RELOC_N
         fatal  "reloc.inc emitted a different entry count than e_crlc declares"
        endif

        db      (HEADER_BYTES-$) dup (00h)
