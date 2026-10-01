; v1.50: symbolic constants. EXE copies from load 0C000h to 0000h.
; Runtime: CS at 0000h/1000h/2000h, DS=ES=SS=DATA_SEG.
; Linear addresses in comments = post-copy runtime.

; =============================================================================
; INT 2Bh BYTECODE DISPATCH
; =============================================================================
; Dispatcher: image 0x14028 = linear 0x13428, CS=0FB1h, IP=3918h.
; Loads opcode to BL (BH=0), calls cs:[bx+393Bh].
; Table indexed by raw even opcode, at dispatcher IRET.
; Linear 0x1344B/image 0x1404B: 186 bytes = 93 words.
; Opcodes 00h..B8h; next 2 bytes C3 (RET) are code.

MIDI_CLOCK_RELOAD               equ     003E8h

; Handlers, offsets within CS1_SEG:
;   0Eh BC_STATUS  -> 4251h   x,y then a NUL-terminated glyph loop
;   78h            -> 4263h   same loop plus the 5Eh soft-break arithmetic
;                             (cmp al,5Eh / add [LCD_PEN_X],3 / je / add ..,3)
;   AAh            -> 4237h   mov byte [LCD_ATTR],0FCh / ret   -- not a NOP
;   ACh            -> 423Dh   mov byte [LCD_ATTR],000h / ret

; =============================================================================
; LCD TEXT ENGINE (labels in data.asm)
; =============================================================================
; font_char_lookup at linear 0x13FE2:
; mov ch,7 / mul ch / mov si,LCD_FONT / add si,ax;
; per-pen-column word table at CS:452Bh.
; Glyphs: 7 bytes, low 5 bits per row, bit 0 rightmost:
;   41h 'A' = 0E 11 11 11 1F 11 11      42h 'B' = 0F 11 11 0F 11 11 0F
;   5Fh '_' = 00 x6 then 1F             5Ch = 08 08 08 08 08 0E 07
;   5Eh = all zeros
; 5Ch = QUARTER NOTE, not backslash; tempo strings use it.
; 5Eh = blank: 3-pixel spacer, not caret.


; ============================================================================
; SHARED SCREEN DATA (labels in data.asm)
; ============================================================================
; Data exe_screens.inc accesses: v1.72 has bitmaps +14 bytes,
; two STATUS_A words +26.
; Bitmap format: width in bytes, height in rows, then rows.


; ============================================================================
; SONG RECORDS (TBL_SONGS, a label in data.asm)
; ============================================================================
        include "../../../common/song_slots.inc"

; ============================================================================
; BC_SOFTKEY (68h) POSITION TABLES (labels in cs1.asm, exported)
; ============================================================================
; Handler CS:3ED6h. Byte-identical to v1.72 (CS:3EB8h), different offset.
; 6 slot x-positions: pitch 29h, frame 27h x 9 px, y 33h. 7 label-centering
; offsets indexed 0-6 (drops 3/char); >6 char labels read past entry.


; paired DATA addresses, generated.
        include "../../common/exe_positional.inc"
