; entry stub: 0C000h -> 0000h; runtime 0000h/1000h/2000h, DS=SS=DATA_SEG.
; linear addresses below = post-copy runtime.

; =============================================================================
; INT 2Bh BYTECODE DISPATCH
; =============================================================================
; IVT[2Bh] = 0FE8h:38FAh -> linear 0x1377A, which is cs1 + 0x38FA:
;
;   sti / pushaw / push ds / push es / mov bp,sp
;   mov es,[bp+16h]              ; caller CS
;   mov bp,[bp+14h]              ; caller IP  (points at the opcode byte)
;   sub bh,bh
;   mov bl,es:[bp]               ; opcode
;   inc bp
;   call cs:[bx+391Dh]           ; <- the handler table
;   mov ax,bp / mov bp,sp / mov [bp+14h],ax   ; resume past opcode+operands
;   pop es / pop ds / popaw / iret
;
; BX is raw opcode (not opcode/2) -- table has one entry per even opcode.
; location: CS:391Dh (0FE8h); linear 0x1379D-0x13856 (186 bytes).
; opcodes 00h-B8h; 0x13857 onwards unreachable (code starts with RET).

MIDI_CLOCK_RELOAD               equ     01388h

; handlers at offsets within CS1_SEG:
;   0Eh BC_STATUS -> 4233h: call 4B98h (consume x,y); string loop
;   78h -> 4245h: 5Eh soft-break; pixel advance in handler, not renderer
;   AAh -> 4219h: mov byte [LCD_ATTR],0FCh / ret    (not a NOP)
;   ACh -> 421Fh: mov byte [LCD_ATTR],000h / ret    (complement)

; =============================================================================
; LCD TEXT ENGINE (labels in data.asm)
; =============================================================================
; font_draw_char (0FE8h:432Eh): substitutes '*' (2Ah) for bit 7 set; falls into 4334h:
;   mov ch,7 / mul ch / mov si,LCD_FONT / add si,ax      <- 7 bytes per glyph
;   mov bl,cl / sub bh,bh / shl bx,1 / mov dx,cs:[bx+450Dh]
; glyph bitmaps (1 byte/row, low 5 bits, bit 0 rightmost):
;   41h 'A' = 0E 11 11 11 1F 11 11      42h 'B' = 0F 11 11 0F 11 11 0F
;   5Fh '_' = 00 00 00 00 00 00 1F
;   5Ch = 08 08 08 08 08 0E 07    (quarter note); tempo BC_STATUS "<5C>:120.0"
;   5Eh = 00 00 00 00 00 00 00    (spacer 3px)


; ============================================================================
; SHARED SCREEN DATA (labels in data.asm)
; ============================================================================
; data reached by exe_screens.inc; v1.50: bitmaps -14 bytes, STATUS_A -26.
; bitmap structure: width (bytes), height (rows), then row data.


; ============================================================================
; SONG RECORDS (TBL_SONGS, a label in data.asm)
; ============================================================================
        include "../../../common/song_slots.inc"

; ============================================================================
; BC_SOFTKEY (68h) POSITION TABLES (labels in cs1.asm, exported)
; ============================================================================
; handler CS:3EB8h, byte-identical to v1.50 3ED6h: 6 slots at pitch 29h,
; frame 27h x 9px (y 33h); 7 label offsets (0-6, drop 3 per char).
; labels > 6 chars read past table end.


; paired DATA addresses, generated.
        include "../../common/exe_positional.inc"
