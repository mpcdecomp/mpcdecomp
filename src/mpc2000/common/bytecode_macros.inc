; byte-threaded VM; EXE INT 2Bh, ROM near-calls bc_dispatch (define
; BC_ROM_DISPATCH for ROM form); resume addr in BP, step past opcode,
; index by opcode byte; operand count = handler net BP advance; opcodes
; even; EXE 00h-B8h, ROM 00h-96h; 98h-B8h = bare RET (no-op); "ROM ret"
; marks opcodes sent to RET.

            ifdef   BC_ROM_DISPATCH
BC_OPC      macro   op
            call    bc_dispatch
            db      op
            endm
            else
BC_OPC      macro   op
            db      0CDh, 2Bh, op
            endm
            endif

; ---------------------------------------------------------------------------
; 00h-0Ch  panel init, plane select, blit -- no operands
; ---------------------------------------------------------------------------

BC_INIT macro                           ; 00h - panel init + self test
            BC_OPC  000h
            endm

BC_FLUSH macro                          ; 02h - blit the planes to the panel
            BC_OPC  002h
            endm

BC_PLANE_A  macro                       ; 04h - draw to plane A, attr 0
            BC_OPC  004h
            endm

BC_PLANE_B  macro                       ; 06h - draw to plane B
            BC_OPC  006h
            endm

BC_PLANE_C  macro                       ; 08h - draw to plane C
            BC_OPC  008h
            endm

BC_PLANE_E  macro                       ; 0Ah - draw to plane E
            BC_OPC  00Ah
            endm

BC_CLEAR macro                          ; 0Ch - zero planes A, B, C
            BC_OPC  00Ch
            endm

; ---------------------------------------------------------------------------
; 0Eh-2Eh  text
; ---------------------------------------------------------------------------

; 5Eh 3-pixel spacer (not caret), 5Ch quarter note
BC_STATUS   macro   x, y, str           ; 0Eh - text at (x,y)
            BC_OPC  00Eh
            db      x, y
            db      str, 0
            endm

BC_LCD_TEXT macro   x, y, str           ; 10h - 0Eh's text, attr 0FCh round it
            BC_OPC  010h
            db      x, y
            db      str, 0
            endm

BC_LCD_BITMAP macro x, y, chars         ; 12h - box-drawing run at (x,y)
            BC_OPC  012h
            db      x, y
            db      chars, 0
            endm

BC_PUTS_FAR macro                       ; 14h - AH chars from ES:SI
            BC_OPC  014h
            endm

; al = [index], ah entry width [table]; entry al = table+1 (width-prefixed)
BC_STATUS_A macro   x, y, index, table  ; 16h - table[[index]] at (x,y)
            BC_OPC  016h
            db      x, y
            dw      index, table
            endm

BC_STATUS_B macro   x, y, count         ; 18h - count chars of ES:SI at (x,y)
            BC_OPC  018h
            db      x, y, count
            endm

BC_TIME     macro   x, y, str           ; 1Ah - the NUL string at DS:str
            BC_OPC  01Ah
            db      x, y
            dw      str
            endm

; 1Ch and 30h: two-state text fields, pair of 4-byte literals in CS, al
; picks one. operand is pen: bytes packed y:x (e.g. 018CCh = x 0CCh, y 018h).
BC_JUMP     macro   yx                  ; 1Ch - al 0 "OFF " else "^ON^"
            BC_OPC  01Ch                ;       ROM: al 0 "ON " else "OFF"
            dw      yx
            endm

BC_DISPLAY  macro                       ; 1Eh - plane E, nested op, blit  ?
            BC_OPC  01Eh
            endm

BC_PRINT    macro   str                 ; 20h - message
            BC_OPC  020h
            db      str, 0
            endm

BC_SEQ_INIT macro                       ; 22h - clear attr, then blit  ?
            BC_OPC  022h
            endm

BC_SEQ_NAV  macro   str                 ; 24h - bottom-row prompt  ?
            BC_OPC  024h
            db      str, 0
            endm

BC_MODE     macro                       ; 26h - clear both attr flags  ?
            BC_OPC  026h
            endm

BC_OP_28    macro   str                 ; 28h - 20h's message, CANCEL/GO row
            BC_OPC  028h
            db      str, 0
            endm

BC_TEXT_SMALL macro x, y, str           ; 2Ah - text at (x,y), 5-row font
            BC_OPC  02Ah
            db      x, y
            db      str, 0
            endm

BC_TEXT_SHADED macro x, y, str          ; 2Ch - 2Ah with attr 0E0h
            BC_OPC  02Ch
            db      x, y
            db      str, 0
            endm

BC_OP_2E    macro   x, y, index, table  ; 2Eh - 16h's lookup, NUL entry
            BC_OPC  02Eh
            db      x, y
            dw      index, table
            endm

; ---------------------------------------------------------------------------
; 30h-4Eh numeric fields: pen (two operands), value in AX
;
; one decimal formatter, called per digit; blanks leading zero unless handler
; pre-sets [16FEh]; differ in digit count, padding, alignment:
;
;   blanked  32h 1  34h 2  36h 3  38h 4  3Ah 6  48h 7  4Ah 8   (3Ah+ are DX:AX)
;   zeroed   44h 2  46h 3
;   right    3Ch 2  3Eh 3  40h 4                4Ch 3 at the pen, no operands
;
; pen bytes packed y:x; 018CCh = x 0CCh, y 018h (screen coords)
; ---------------------------------------------------------------------------

BC_VALUE    macro   yx                  ; 30h - al 0 "^NO^" else "YES " ROM ret
            BC_OPC  030h
            dw      yx
            endm

BC_OP_32    macro   x, y                ; 32h - ax as 1 digit
            BC_OPC  032h
            db      x, y
            endm

BC_ARITH_EXT macro  yx                  ; 34h - ax as 2 digits, blanked
            BC_OPC  034h
            dw      yx
            endm

BC_FIELD    macro   x, y                ; 36h - ax as 3 digits, blanked
            BC_OPC  036h
            db      x, y
            endm

BC_ARITH    macro   yx                  ; 38h - ax as 4 digits, blanked
            BC_OPC  038h
            dw      yx
            endm

BC_OP_3A    macro   x, y                ; 3Ah - dx:ax as 6 digits, blanked
            BC_OPC  03Ah
            db      x, y
            endm

BC_JUMP_3C  macro   yx                  ; 3Ch - ax as 2 digits, right-aligned
            BC_OPC  03Ch
            dw      yx
            endm

BC_CALL     macro   yx                  ; 3Eh - ax as 3 digits, right-aligned
            BC_OPC  03Eh
            dw      yx
            endm

BC_OP_40    macro   x, y                ; 40h - ax as 4 digits, right-aligned
            BC_OPC  040h
            db      x, y
            endm

BC_OP_42    macro                       ; 42h - 36h's formatter at the pen
            BC_OPC  042h
            endm

BC_UI_MENU  macro   x, y                ; 44h - ax as 2 digits, zero-padded
            BC_OPC  044h
            db      x, y
            endm

BC_UI_DIALOG macro  x, y                ; 46h - ax as 3 digits, zero-padded
            BC_OPC  046h
            db      x, y
            endm

BC_OP_48    macro   x, y                ; 48h - pen, DX:AX 7 digits  ROM ret
            BC_OPC  048h
            db      x, y
            endm

BC_OP_4A    macro   x, y                ; 4Ah - pen, DX:AX 8 digits  ROM ret
            BC_OPC  04Ah
            db      x, y
            endm

BC_OP_4C    macro                       ; 4Ch - AX in 3 cells  ROM ret
            BC_OPC  04Ch
            endm

BC_LINE     macro   x1, y1, x2, y2      ; 4Eh - line (x1,y1)-(x2,y2)  ROM ret
            BC_OPC  04Eh
            db      x1, y1, x2, y2
            endm

; ---------------------------------------------------------------------------
; 50h-66h  boxes, rules and input regions
; ---------------------------------------------------------------------------

BC_MEM_ALLOC macro  p1, p2, p3          ; 50h  ?
            BC_OPC  050h
            db      p1, p2, p3
            endm

BC_MEM_FREE macro   p1, p2, p3          ; 52h  ?
            BC_OPC  052h
            db      p1, p2, p3
            endm

BC_MEM_COPY macro   p1, p2, p3          ; 54h  ?
            BC_OPC  054h
            db      p1, p2, p3
            endm

BC_MEM_FULL macro   p1, p2, p3          ; 56h  ?
            BC_OPC  056h
            db      p1, p2, p3
            endm

BC_ERASE_H  macro   x, y, n             ; 58h - pen, then clear n px right
            BC_OPC  058h
            db      x, y, n
            endm

BC_ERASE_V  macro   x, y, n             ; 5Ah - pen, then clear n px down
            BC_OPC  05Ah
            db      x, y, n
            endm

BC_UI_5C    macro   p1, p2, p3, p4      ; 5Ch  ?
            BC_OPC  05Ch
            db      p1, p2, p3, p4
            endm

BC_UI_5E    macro   p1, p2, p3, p4      ; 5Eh  ?
            BC_OPC  05Eh
            db      p1, p2, p3, p4
            endm

BC_CLEAR_RECT macro x, y, w, h      ; 60h
            BC_OPC  060h
            db      x, y, w, h
            endm

BC_UI_CTRL  macro   p1, p2, p3, p4      ; 62h  ?
            BC_OPC  062h
            db      p1, p2, p3, p4
            endm

BC_OP_64    macro   x,y,w,h,pitch,i     ; 64h - 62h's region, y += i*[pitch] ?
            BC_OPC  064h
            db      x, y, w, h
            dw      pitch
            db      i
            endm

BC_WAIT     macro   x, y, bitmap        ; 66h - rows at DS:bitmap, at (x,y)
            BC_OPC  066h
            db      x, y
            dw      bitmap
            endm

; ---------------------------------------------------------------------------
; 68h-76h  soft keys, pixels, dialog frames
; ---------------------------------------------------------------------------

; 68h: 27h x 9px at y 33h, x from 6-entry table 2Bh apart, label centred
; from 7-entry by length (6+ chars reads past); frame plane C, label plane
; A; fkey 01h-06h; 0 and 7+ return; no six-form here, 6Ch has it.
BC_SK_PLAIN equ     0                   ; label only
BC_SK_BOX   equ     1                   ; outline round the slot, via 98h
BC_SK_FILL  equ     2                   ; slot filled under it, via 9Ah
BC_SOFTKEY  macro   fkey, style, str    ; 68h
            BC_OPC  068h
            db      fkey, style
            db      str, 0
            endm

BC_WAIT_LOAD macro                      ; 6Ah - redraw all six labels, style 0
            BC_OPC  06Ah
            endm

BC_BUFFER   macro   p1,p2,p3,p4,p5,p6   ; 6Ch - one BC_SK_ style per soft key
            BC_OPC  06Ch
            db      p1, p2, p3, p4, p5, p6
            endm

BC_PIXEL1   macro   x, y                ; 6Eh - 1 px
            BC_OPC  06Eh
            db      x, y
            endm

BC_PIXEL2   macro   x, y                ; 70h - 2 px
            BC_OPC  070h
            db      x, y
            endm

BC_PIXEL3   macro   x, y                ; 72h - 3 px
            BC_OPC  072h
            db      x, y
            endm

BC_TEST_MODE macro  x1,y1,x2,y2,title  ; 74h - 76h, other frame  ?
            BC_OPC  074h
            db      x1, y1, x2, y2
            db      title, 0
            endm

BC_FILE_DIALOG macro x1,y1,x2,y2,title ; 76h - framed box, centred title
            BC_OPC  076h
            db      x1, y1, x2, y2
            db      title, 0
            endm

; ---------------------------------------------------------------------------
; 78h-96h  drawing at the current pen, the value in AX
; ---------------------------------------------------------------------------

BC_TEXT_PEN macro   str                 ; 78h - 0Eh's text at the pen  ROM ret
            BC_OPC  078h
            db      str, 0
            endm

BC_OP_7A    macro                       ; 7Ah - 44h's format at pen  ROM ret
            BC_OPC  07Ah
            endm

BC_OP_7C    macro                       ; 7Ch - 34h's formatter at the pen
            BC_OPC  07Ch
            endm

BC_RETURN   macro                       ; 7Eh - 36h's formatter at the pen
            BC_OPC  07Eh
            endm

BC_OP_80    macro                       ; 80h - 38h's format at pen  ROM ret
            BC_OPC  080h
            endm

BC_MIDI_FIELD macro x, y                ; 82h - ax as 3 digits, then its note
            ; name and octave 12h px right: ax/12 octave, ax%12=5-byte entry at DS:1707h
            BC_OPC  082h
            db      x, y
            endm

BC_UI_84    macro                       ; 84h  ?
            BC_OPC  084h
            endm

BC_16_LEVELS_6 macro x, y, index, table ; 86h - a word table's bitmap by [index], at (x,y)  ?
            BC_OPC  086h
            db      x, y
            dw      index, table
            endm

BC_REFRESH  macro                       ; 88h - zero A, B, C, 1632 each  ?
            BC_OPC  088h
            endm

BC_OP_8A    macro                       ; 8Ah - bare RET in both VMs
            BC_OPC  08Ah
            endm

BC_PLANE_PUSH_VIS macro                 ; 8Ch - push the plane, select plane B
            BC_OPC  08Ch
            endm

BC_PLANE_POP macro                      ; 8Eh - pop plane
            BC_OPC  08Eh
            endm

BC_PUT_HEX_HIGH macro                   ; 90h - AH then AL as hex
            BC_OPC  090h
            endm

BC_PUT_HEX  macro                       ; 92h - AL as two hex digits
            BC_OPC  092h
            endm

BC_PUTCHAR  macro                       ; 94h - AL as one glyph
            BC_OPC  094h
            endm

BC_OP_96    macro                       ; 96h - bare RET in both VMs
            BC_OPC  096h
            endm

; ---------------------------------------------------------------------------
; 98h-B8h
; ---------------------------------------------------------------------------

BC_SEQ_OP   macro                       ; 98h  ?
            BC_OPC  098h
            endm

BC_YIELD    macro                       ; 9Ah  ?
            BC_OPC  09Ah
            endm

BC_RANGE    macro   x, y                ; 9Ch  ?
            BC_OPC  09Ch
            db      x, y
            endm

BC_SEQ_EDIT macro                       ; 9Eh - draw base = plane A + 32*AX  ?
            BC_OPC  09Eh
            endm

BC_UI_A0    macro                       ; A0h  ?
            BC_OPC  0A0h
            endm

BC_UI_A2    macro   x, y                ; A2h  ?
            BC_OPC  0A2h
            db      x, y
            endm

BC_UI_A4    macro   x, y                ; A4h - pen, then a CS literal  ?
            BC_OPC  0A4h
            db      x, y
            endm

BC_BARRIER  macro                       ; A6h  ?
            BC_OPC  0A6h
            endm

BC_A8       macro   x, y                ; A8h  ?
            BC_OPC  0A8h
            db      x, y
            endm

BC_LCD_ATTR_FC macro                    ; AAh - LCD_ATTR = 0FCh
            BC_OPC  0AAh
            endm

BC_LCD_ATTR_0 macro                     ; ACh - LCD_ATTR = 0
            BC_OPC  0ACh
            endm

BC_CLEAR_PLANE_C macro                  ; AEh - zero plane C, clear 16ECh pair
            BC_OPC  0AEh
            endm

BC_PART_DISP macro                      ; B0h  ?
            BC_OPC  0B0h
            endm

BC_B2       macro                       ; B2h  ?
            BC_OPC  0B2h
            endm

; B4h note/channel field: al as 2 digits (23h-62h) or "--", '/'; ah = port
; letter 'A'+(ah>>4), channel (ah&0Fh)+1; ah: 040h="OFF", 041h="ALL"
BC_MEM_STATUS macro x, y                ; B4h
            BC_OPC  0B4h
            db      x, y
            endm

BC_ADDR_OP  macro                       ; B6h  ?
            BC_OPC  0B6h
            endm

BC_CTRL_FIELD macro x, y                ; B8h - last table entry  ?
            BC_OPC  0B8h
            db      x, y
            endm

; ---------------------------------------------------------------------------
; other INT vectors EXE dispatches; operand lengths from call sites; ?
; ---------------------------------------------------------------------------

INT_2A  macro   msg                     ; error message, inline literal
        int     2ah
        db      msg, 0
        endm

INT_5A  macro   h
        int     5ah
        dw      h
        endm

INT_5B  macro   h
        int     5bh
        dw      h
        endm

INT_5C  macro   h
        int     5ch
        dw      h
        endm

INT_5D  macro   h
        int     5dh
        dw      h
        endm

INT_5E  macro   h
        int     5eh
        dw      h
        endm

INT_5F  macro   h
        int     5fh
        dw      h
        endm

INT_60  macro   h
        int     60h
        dw      h
        endm

INT_61  macro   h
        int     61h
        dw      h
        endm

INT_62  macro   h
        int     62h
        dw      h
        endm

INT_63  macro   h
        int     63h
        dw      h
        endm

INT_64  macro   h
        int     64h
        dw      h
        endm

INT_65  macro   h
        int     65h
        dw      h
        endm

INT_66  macro   h
        int     66h
        dw      h
        endm

INT_67  macro   h
        int     67h
        dw      h
        endm

INT_68  macro   h
        int     68h
        dw      h
        endm

INT_69  macro   h
        int     69h
        dw      h
        endm

INT_6A  macro   h1, h2
        int     6ah
        dw      h1, h2
        endm

INT_6B  macro   h1, h2, h3, h4, h5, h6
        int     6bh
        dw      h1, h2, h3, h4, h5, h6
        endm

INT_6C  macro   h1, h2, h3, h4
        int     6ch
        dw      h1, h2, h3, h4
        endm

INT_6D  macro   h1, h2, h3, h4, h5
        int     6dh
        dw      h1, h2, h3, h4, h5
        endm

INT_6E  macro   h1, h2, h3, h4, h5
        int     6eh
        dw      h1, h2, h3, h4, h5
        endm

INT_6F  macro   h
        int     6fh
        dw      h
        endm

; ---------------------------------------------------------------------------
; far pointers: segment first (original format)
; ---------------------------------------------------------------------------

FAR_PTR macro   seg, off
        dw      seg, off
        endm

FAR_LOCAL macro off
        dw      0, off
        endm
