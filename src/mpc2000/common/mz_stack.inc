; MZ header e_cp/e_cblp/e_ss computed from the assembled image.  Shared by the
; v1.50/v1.72 SYS/EXE headers; the includer sets HEADER_BYTES, MARGIN, ADJUST
; (SYS also LOAD_PARA/RAM_TOP).  IMAGE_BYTES is image.asm's `$-HEADER_BYTES`.
;
; e_cp/e_cblp: EXE = file size; SYS reads 16 bytes short (?).
; e_ss: pre-relocation paragraphs.  EXE: right after the paragraph-rounded
; image.  SYS: plus MARGIN paragraphs of BSS (1370 = 21,920 bytes, stock).

TOTAL   equ     IMAGE_BYTES + HEADER_BYTES
REM512  equ     TOTAL # 512
        if      REM512 = 0
CP0     equ     TOTAL / 512
CBLP0   equ     0
        elseif
CP0     equ     TOTAL / 512 + 1
CBLP0   equ     REM512
        endif
        if      CBLP0 + ADJUST < 0
CBLP    equ     CBLP0 + ADJUST + 512
CP      equ     CP0 - 1
        elseif
CBLP    equ     CBLP0 + ADJUST
CP      equ     CP0
        endif

E_SS    equ     (IMAGE_BYTES + 15) / 16 + MARGIN

; SYS only: the stack follows e_ss, so a growing image moves it up.  Its top
; (e_ss + STACK_BYTES) must stay below SYS_RAM_TOP (seg 5A00h, the INT 38h
; program arena, fixed) or program_alloc's 64-pad fill overwrites the stack.
        if      MARGIN <> 0
STACK_TOP equ   ((LOAD_PARA + E_SS) * 16) + STACK_BYTES
        if      STACK_TOP > RAM_TOP
        fatal   "stack top would reach SYS_RAM_TOP -- image too large"
        endif
        endif
