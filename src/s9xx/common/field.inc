; UI field record, read through BP by field_edit and menu_navigation_loop:
; its screen (80 chars, the LCD's two 40-column rows), the offset of its
; label's '*' (bit 7: flag menu_navigation_loop tests on SPACE), the value's
; start/end columns, FT_ flags, a type byte, the handler (called with the new
; value in [bp+9]), then the value and its limits.  FT_KEYS: lo = address of
; the accepted keys, hi = their count.  FT_NAME stops after the handler; its
; type byte is the letter of what it names.
FIELD   macro   text, label, col, endcol, flags, type, handler, value, lo, hi
        dw      text
        db      label, col, endcol, flags, type
        dw      handler, value, lo, hi
        endm

TEXTFIELD macro text, label, col, endcol, flags, type, handler
        dw      text
        db      label, col, endcol, flags, type
        dw      handler
        endm

FT_NAME         equ     01h             ; letters and digits, stepped by the knob
FT_NOTE         equ     02h             ; a MIDI note, shown as its name
FT_NUM          equ     04h             ; a decimal number
FT_YESNO        equ     08h             ; NO / YES
FT_SIGNED       equ     10h             ; shown with its sign; + and - keys set it
FT_KEYS         equ     20h             ; set by one of the keys at lo
FT_ONOFF        equ     40h             ; OFF / ON
FT_UNSIGNED     equ     80h             ; limits compared unsigned
