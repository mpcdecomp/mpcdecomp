; MZ header: loader-only metadata. e_cblp/e_cp/e_ss from
; assembled size (mz_stack.inc); e_crlc from RELOC count
; (reloc.inc); e_lfarlc/e_cparhdr from reloc table
; address and end (rounded to STOCK_PARAS). entries
; label-relative (src/mpc2000/common/mz_reloc.inc): growing a part
; shifts later entries.


ADJUST                          equ     -16
LOAD_PARA                       equ   03000h
        include "../memory_map.inc"
RAM_TOP                         equ     PROGRAM_ARENA_SEG*16
STACK_BYTES                     equ 00100h          ; e_sp, the bytes above e_ss the loader hands SYS

        include "../../../common/mz_reloc.inc"
; the BSS past the image, in paragraphs: e_ss sits that far past its end.
        FEAT_MARGIN (BSS_END-SYS_STAMP_END)/16

; header is whole number of paragraphs, covers reloc table;
; rounded to STOCK_PARAS, maintain unless table grows.
; RELOC_AT, RELOC_N declared by image.asm (required for
; first-pass `if`; known after table is emitted).
; assertions validate at assembly time.
RELOC_AT                        equ    01eh            ; the fields above the table are all fixed-size
RELOC_END                       equ   RELOC_AT + 4*RELOC_N
        if      (RELOC_END+15)/16 > STOCK_PARAS
HEADER_PARAS                    equ (RELOC_END+15)/16
        elseif
HEADER_PARAS                    equ STOCK_PARAS
        endif
HEADER_BYTES                    equ HEADER_PARAS*16
        include "../../../common/mz_stack.inc"

        db      4dh, 5ah                ; e_magic  "MZ"
        dw      CBLP, CP                ; e_cblp, e_cp
        dw      RELOC_N                 ; e_crlc
        dw      HEADER_PARAS            ; e_cparhdr
        dw      E_MINALLOC, 0ffffh      ; e_minalloc, e_maxalloc
        dw      E_SS                    ; e_ss
        dw      STACK_BYTES             ; e_sp
        db      00h, 00h                ; e_csum
        db      10h, 00h, 00h, 00h      ; e_ip, e_cs
        dw      RELOC_AT                ; e_lfarlc
        db      00h, 00h                ; e_ovno
        db      01h, 00h                ; the original's filler ahead of the table

        if      $ <> RELOC_AT
         fatal  "MZ header fields no longer end where e_lfarlc says they do"
        endif
        include "reloc.inc"
        if      RELOC_COUNT <> RELOC_N
         fatal  "reloc.inc emitted a different entry count than e_crlc declares"
        endif

        db      (HEADER_BYTES-$) dup (00h)
