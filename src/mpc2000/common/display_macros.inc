; INT 8Fh display service: handler reads operands inline at call site
; (ES:BP stacked return), adjusts IP by operand length before IRET. Each
; sub-function consumes fixed bytes (wrong count shifts all following); the
; counts here are handler's own consumption. x column 0..0F7h, y row 0..03Bh
; on 248x60 panel; clips out-of-range to 0. Sub-functions read registers at
; call site as ordinary instructions: al=char (004h), ax=value/note/time
; (008h/009h/00Ah/00Ch/01Eh), dx=segment for ptrs (01Eh form 00h).
; Labels: \ = 05Ch (quarter note), " = 022h (ASL escapes).
; INT 90h: same handlers, operands in registers; table points past inline
; fetch (no macros). Unused: 00Bh (loads cl twice not ch), 00Dh (clip rect),
; 017h/018h (erase/invert), 01Ah (pixel), 01Bh/01Dh (bare RET), 019h form 00h
; (6 labels), 019h form 07h (6 styles), 01Ch form 00h, 3 of 003h fonts.

DISP_INIT       macro                   ; 000h  LCD controller init sequence
        int     8fh
        db      000h
        endm

DISP_FLUSH      macro                   ; 001h  composite the planes, push out
        int     8fh
        db      001h
        endm

DISP_CLEAR      macro                   ; 002h  zero the planes, font 0
        int     8fh
        db      002h
        endm

; 003h ANDs operand with 3, selects plotter from 4-entry table (all later
; chars use selected). First font via 5 call sites and 5 vector stores only;
; others ROM-resident.
DISP_FONT_7ROW  equ     0               ; 7 rows, 6 px advance, 05Eh 3 px
DISP_FONT_5ROW  equ     1               ; 5 rows, 4 px, glyph 0 is 020h
DISP_FONT_13ROW equ     2               ; 13 rows, 8 px advance, 05Eh 4 px
DISP_FONT_15ROW equ     3               ; 15 rows, 2 bytes wide, advance per
                                        ;   glyph, byte 30 of its 32
DISP_FONT       macro   f               ; 003h  select a glyph plotter
        int     8fh
        db      003h, f
        endm

DISP_CHAR       macro   x,y             ; 004h  plot al with the current font
        int     8fh
        db      004h, x, y
        endm

DISP_TEXT       macro   x,y,s           ; 005h
        int     8fh
        db      005h, x, y
        db      s, 000h
        endm

DISP_MSG        macro   s               ; 006h  full-screen message window
        int     8fh
        db      006h
        db      s, 000h
        endm

DISP_PLANE0     macro                   ; 007h  draw to plane 0
        int     8fh
        db      007h
        endm

DISP_NUM        macro   x,y,f           ; 008h  ax in decimal, blank-padded
        int     8fh
        db      008h, x, y, f
        endm

DISP_NUM0       macro   x,y,f           ; 009h  ax in decimal, zero-padded
        int     8fh
        db      009h, x, y, f
        endm

DISP_NUMR       macro   x,y,f           ; 00Ah  ax in decimal, right-aligned
        int     8fh
        db      00ah, x, y, f
        endm

DISP_HEX16      macro   x,y             ; 00Ch  ax as four hex digits
        int     8fh
        db      00ch, x, y
        endm

DISP_HLINE      macro   x,y,n           ; 00Eh  n pixels wide
        int     8fh
        db      00eh, x, y, n
        endm

DISP_VLINE      macro   x,y,n           ; 00Fh  n pixels tall
        int     8fh
        db      00fh, x, y, n
        endm

DISP_HDOTS      macro   x,y,n           ; 010h  every other pixel
        int     8fh
        db      010h, x, y, n
        endm

DISP_VDOTS      macro   x,y,n           ; 011h  every other row
        int     8fh
        db      011h, x, y, n
        endm

DISP_BOX        macro   x,y,w,h         ; 012h  rectangle outline
        int     8fh
        db      012h, x, y, w, h
        endm

DISP_FILL       macro   x,y,w,h         ; 013h  rectangle, OR
        int     8fh
        db      013h, x, y, w, h
        endm

DISP_ERASE      macro   x,y,w,h         ; 014h  rectangle, AND NOT
        int     8fh
        db      014h, x, y, w, h
        endm

DISP_INVERT     macro   x,y,w,h         ; 015h  rectangle, XOR
        int     8fh
        db      015h, x, y, w, h
        endm

DISP_BMP        macro   x,y,id          ; 016h  built-in bitmap, id from 1
        int     8fh
        db      016h, x, y, id
        endm

; 019h: 027h x 9 px @ y 033h, x from 6-entry spaced 041h. Label centered,
; 7-entry indexed by length; >6 overflow. Cleared first. Style byte:
; PLAIN/BOX/FILL/nothing; BLANK=XL 4th, not emitted by 2K.
DISP_SK_PLAIN   equ     0               ; label only
DISP_SK_BOX     equ     1               ; outline round the slot, via 012h
DISP_SK_FILL    equ     2               ; slot inverted under it, via 015h
DISP_SK_BLANK   equ     3               ; slot cleared again, via 014h  ; ?
DISP_SOFTKEY    macro   k,st,s          ; 019h  k is 1..6
        int     8fh
        db      019h, k, st
        db      s, 000h
        endm

; 01Ch form byte selects window type. Form 01h: rect inline. Forms 02h/03h:
; different fixed rects, title-only. Form 00h: nested boxes, corner marks,
; 4-byte rect (unreachable: no INT 8Fh call, INT 90h 01Ch entry=form body,
; never bl=01Ch). Form 03h = SYS WIN_ALERT: 010h,002h 0D8h x 3Ah.
DISP_WIN        macro   x,y,w,h,s       ; 01Ch form 01h
        int     8fh
        db      01ch, 001h, x, y, w, h
        db      s, 000h
        endm

DISP_WIN_NARROW macro   s               ; 01Ch form 02h  01Dh,002h 0BEh x 3Ah
        int     8fh
        db      01ch, 002h
        db      s, 000h
        endm

DISP_WIN_WIDE   macro   s               ; 01Ch form 03h  010h,002h 0D8h x 3Ah
        int     8fh
        db      01ch, 003h
        db      s, 000h
        endm

; 01Eh: form byte indexes 3-entry CS table (nested), each form gets
; different operands/macro. Form 00h: index iptr via fixed-stride table
; (tptr dx) as text.
DISP_TEXT_IDX   macro   x,y,iptr,tptr
        int     8fh
        db      01eh, 000h, x, y
        dw      iptr, tptr
        endm

DISP_NOTE       macro   x,y             ; 01Eh form 01h  ax as octave + name
        int     8fh
        db      01eh, 001h, x, y
        endm

; 01Eh form 02h: al decimal note 023h-062h or "--", then '/', then ah
; port letter 'A' + (ah >> 4) and channel (ah & 0Fh) + 1.  ah 040h "OFF",
; 041h "ALL".
DISP_NOTE_CHAN  macro   x,y
        int     8fh
        db      01eh, 002h, x, y
        endm

; 01Fh picks plane: 0 = DS:057A2h, else DS:05F22h (780h = 32 x 60 bytes
; apart).
DISP_PLANE      macro   n               ; 01Fh
        int     8fh
        db      01fh, n
        endm

; INT 0B0h field cursor: records x, y, w at DS(0FE7h):3774h..3776h, inverts
; w x 9 rect at x-1, y-1 via INT 90h 015h.  caller loads registers.
; if load order varies or mid-sequence entry label, keep plain instructions.
DISP_CURSOR     macro   x,y,w           ; INT 0B0h
        mov     cl, x
        mov     ch, y
        mov     al, w
        int     0b0h
        endm

; One 20-byte record of the credits screen (MIXER, SHIFT+F5, F6, OPEN WINDOW):
; text XOR 7Fh, 7Fh terminator (00h decoded), 00h padding.  empty text =
; blank line.  leading tab indents name under heading.  07Fh - c = c^7Fh
; for 7-bit c; ASL folds.
CREDIT  macro   text
CREDIT_I set    0
        rept    STRLEN(text)
        db      07fh-CHARFROMSTR(text,CREDIT_I)
CREDIT_I set    CREDIT_I+1
        endm
        db      07fh
        rept    19-STRLEN(text)
        db      000h
        endm
        endm
