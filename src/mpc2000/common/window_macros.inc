; INT 2Eh bytecode VM in DATA; ES:BP at SYS TEXT1 wrapper disp_list_run
; (v1.72: les bp,[ptr] / int 2eh). EXE dispatcher 0x1547B: fetch byte,
; loop until 00h, call CS:[4D8Dh+2*op]. 39 handlers, opcodes 00h-26h;
; 30 share INT 2Bh handler (same VM, denser re-numbering). Remap:
; src/mpc2000/2k/common/sys/data.asm header. Verified: MUTE ASSIGN 2480h, ZONE
; EDIT/TRIM 389ch. Same v1.50 shape, offset per window. 21h (znEDIT):
; single v1.72 instance, not in v1.50 remap; raw db, not macro.

        ifndef  WINDOW_MACROS_INC
WINDOW_MACROS_INC equ    1

; opcodes, for the code that builds a list on its stack
WOP_END         equ     000h
WOP_CLEAR       equ     001h
WOP_PLANE_A     equ     002h            ; WIN_RESET_PEN
WOP_PLANE_B     equ     003h
WOP_PLANE_C     equ     004h
WOP_FLUSH       equ     005h
WOP_SET_FLAG    equ     006h
WOP_LABEL       equ     007h
WOP_LABEL_FC    equ     008h
WOP_RULE_0B     equ     00bh            ; 0Bh-10h WIN_RULE
WOP_RULE_0E     equ     00eh
WOP_OP4_11      equ     011h            ; 11h-14h WIN_OP4
WOP_OP4_12      equ     012h
WOP_OP4_13      equ     013h
WOP_OP4_14      equ     014h
WOP_HEX8        equ     015h
WOP_HEX16       equ     016h
WOP_NUMBER      equ     017h
WOP_PRINT       equ     018h
WOP_SOFTKEY     equ     01ah
WOP_PIXEL1      equ     01bh
WOP_TEXT_FAR    equ     01eh
WOP_TEXT_FAR_FC equ     01fh
WOP_SOFTKEYS_REDRAW equ 020h
WOP_SOFTKEY_STYLES equ  021h
WOP_FRAME       equ     022h
WOP_MESSAGE     equ     023h
WOP_LINE        equ     024h
WOP_BITMAP      equ     025h
WOP_SUBLIST     equ     026h

WIN_END         macro                   ; 00h  end of display list, 0 operands
        db      000h
        endm

WIN_CLEAR       macro                   ; 01h  clear the three planes, 0 operands
        db      001h
        endm

WIN_RESET_PEN   macro                   ; 02h  reset the pen, 0 operands
        db      002h
        endm

WIN_PLANE_B     macro                   ; 03h = 2Bh 06h
        db      003h
        endm

WIN_PLANE_C     macro                   ; 04h = 2Bh 08h
        db      004h
        endm

WIN_FLUSH       macro                   ; 05h = 2Bh 02h
        db      005h
        endm

WIN_LABEL_FC    macro   x,y,s           ; 08h = 2Bh 10h, 07h's text with attr 0FCh
        db      008h, x, y
        db      s, 000h
        endm

WIN_OP4         macro   op,a,b,c,d      ; op 11h-14h = 2Bh 5Ch-62h  ?
        db      op, a, b, c, d
        endm

WIN_PRINT       macro   s               ; 18h = 2Bh 20h
        db      018h
        db      s, 000h
        endm

WIN_OP_19       macro                   ; 19h = 2Bh 22h  ?
        db      019h
        endm

WIN_PIXEL1      macro   x,y             ; 1Bh = 2Bh 6Eh
        db      01bh, x, y
        endm

WIN_SOFTKEYS_REDRAW macro               ; 20h = 2Bh 6Ah, all six labels, style 0
        db      020h
        endm

WIN_SOFTKEY_STYLES macro a,b,c,d,e,f    ; 21h = 2Bh 6Ch, one SK_ style per soft key
        db      021h, a, b, c, d, e, f
        endm

WIN_LINE        macro   x1,y1,x2,y2     ; 24h = 2Bh 4Eh
        db      024h, x1, y1, x2, y2
        endm

WIN_BITMAP      macro   x,y,sel         ; 25h, a built-in bitmap  ?
        db      025h, x, y, sel
        endm

; opcodes 0Bh-10h (x,y,len): pixel runs, rules, separators. opcode-to-
; style mapping not confirmed (?); takes opcode as parameter. verified
; 4 sites: 0Ch in MUTE ASSIGN, 4-BAND FILTER 3x (cutoff-frequency).
WIN_RULE        macro   op,x,y,len      ; op 0Bh-10h
        db      op, x, y, len
        endm

; 07h: label at (x,y), NUL-terminated. y constant per row (MUTE Note:/- pairs,
; znEDIT St:/End:/View y=0Ch); x varies. v1.50 remap: 07h x,y,"text",0.
; verified 9 sites, 2 windows.
WIN_LABEL       macro   x,y,s
        db      007h, x, y
        db      s, 000h
        endm

; 1Ah: fkey (1-6), style (0=plain, 1=box, 2=filled), NUL-terminated label.
; v1.50 remap and EXE 68h confirm. SK_* = EXE BC_SK_*. XL DISP_SOFTKEY:
; same shape, style values 0-2 + BLANK (4), 2K omits BLANK.
SK_PLAIN        equ     0
SK_BOX          equ     1
SK_FILL         equ     2
SK_BLANK        equ     3               ; XL only: DISP_SK_BLANK
WIN_SK_PLAIN    equ     SK_PLAIN
WIN_SK_BOX      equ     SK_BOX
WIN_SK_FILL     equ     SK_FILL
WIN_SOFTKEY     macro   fkey,style,s
        db      01ah, fkey, style
        db      s, 000h
        endm

; 22h: framed window, title centered in top edge; x,y,w,h,"title",0.
; v1.50 remap defines shape. 2K three macros fix bytes that repeat in v1.72
; (reused window sizes). same convention as XL DISP_WIN_NARROW/DISP_WIN_WIDE
; (display_macros.inc). WIN_ALERT 10h,02h,0D8h,3Ah = DISP_WIN_WIDE.
WIN_DIALOG      macro   title           ; 0Ch,02h,0E0h,3Ah -- 22 sites, full window
        db      022h, 00ch, 002h, 0e0h, 03ah
        db      title, 000h
        endm

WIN_CONFIRM     macro   title           ; 30h,06h,0C3h,36h -- 14 sites, action-confirm dialogs
        db      022h, 030h, 006h, 0c3h, 036h
        db      title, 000h
        endm

WIN_ALERT       macro   title           ; 10h,02h,0D8h,3Ah -- 3 message boxes
                                        ; = XL DISP_WIN_WIDE exactly
        db      022h, 010h, 002h, 0d8h, 03ah
        db      title, 000h
        endm

WIN_FRAME       macro   x,y,w,h,title   ; 22h at any other rectangle
        db      022h, x, y, w, h
        db      title, 000h
        endm



; =============================================================================
; HANDLER TABLES -- the INT 30h side of the same window
; =============================================================================
; window = display list (INT 2Eh) + handler table (INT 30h) at separate
; addresses. handler record: db key (raw front-panel code + 1), dw offset,
; dw segment (unaligned from byte 1). scan stops at key=0. install_handler
; at 2K TEXT2 05C2h (enter 0Ah,0). trailing zeros v1.72: {5:44, 6:34, 7:1,
; 8:2, 9:3, 12:1}; WIN_KEY_END emits five (matches stock). handlers
; merge (additive). WIN_KEY_CLEAR drops live set (44 use, 29 don't).
; ui_screen_enter (2K TEXT1 3962h): installs shared (DATA:15A6h) with clear,
; merges caller's without, adds key. 5 stock tables disable on 1E0Ch stub.
; XL: same two-object model, record shape, key numbering; src/mpc2000/xl/common/
; feat/copy_window.inc relocated COPY: 5 header bytes + records.

WIN_KEY_FN      equ     1               ; a record: db key, dd handler
WIN_KEY_FN_SEG  equ     3
SIZEOF_WIN_KEY  equ     5

WIN_KEY         macro   key,seg,off
        db      key
        dw      off
        dw      seg
        endm

WIN_KEY_CLEAR   macro                   ; leading record: drop the live set first
        db      001h, 000h, 000h, 000h, 000h
        endm

WIN_KEY_END     macro                   ; one zero KEY ends it; five match stock
        db      000h, 000h, 000h, 000h, 000h
        endm

; key code = raw front-panel button code + 1. F1-F6 soft keys = 02h-07h.
WIN_K_F1        equ     002h
WIN_K_F2        equ     003h
WIN_K_F3        equ     004h
WIN_K_F4        equ     005h
WIN_K_F5        equ     006h
WIN_K_F6        equ     007h
WIN_K_OPEN      equ     015h            ; OPEN WINDOW (raw 0Ch)
WIN_K_LEFT      equ     016h
WIN_K_RIGHT     equ     017h
WIN_K_UP        equ     018h
WIN_K_DOWN      equ     019h
WIN_K_PAD       equ     037h            ; pad pressed; re-arm current field
                                        ; (2K TEXT1 62B2h)
WIN_K_PAINT     equ     032h            ; window enter / repaint pseudo-key
WIN_K_REFRESH   equ     034h            ; display flush pseudo-key
WIN_K_FLUSH     equ     0ffh            ; INT 30h drops queued panel events and
                                        ; wheel/repeat state; no handler
        endif
