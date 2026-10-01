; key-handler registrars.  Each INT reads its operands inline and steps the
; stacked IP past them.  A handler is a far procedure; the OS keeps one
; {offset, segment, DS} record per slot in four 59-slot tables in RAM_SEG
; (key down, key up, shifted key down, down flags).  slot is the table index,
; stored as a byte offset.

KEY_DOWN        macro   slot,off,seg    ; 96h  one key-down handler
        int     96h
        dw      (slot)*6, off, seg
        endm

KEY_UP          macro   slot,off,seg    ; 97h  one key-up handler
        int     97h
        dw      (slot)*6, off, seg
        endm

KEY_SHIFTED     macro   slot,off,seg    ; 98h  one shifted key-down handler
        int     98h
        dw      (slot)*6, off, seg
        endm

KEY_WHEEL       macro   off,seg         ; 99h  one handler for both DATA wheel slots, 1Eh and 1Fh
        int     99h
        dw      off, seg
        endm

KEY_WHEEL2      macro   o1,s1,o2,s2     ; 9Ah  slots 1Eh and 1Fh, one handler each
        int     9ah
        dw      o1, s1, o2, s2
        endm

KEY_SOFT        macro   o1,s1,o2,s2,o3,s3,o4,s4,o5,s5,o6,s6 ; 9Ch  F1-F6, slots 10h-15h
        int     9ch
        dw      o1, s1, o2, s2, o3, s3, o4, s4, o5, s5, o6, s6
        endm

KEY_CURSOR      macro   lo,ls,ro,rs,uo,us,dno,dns ; 9Dh  LEFT, RIGHT, UP, DOWN, slots 17h-1Ah
        int     9dh
        dw      lo, ls, ro, rs, uo, us, dno, dns
        endm

KEY_LOCATE      macro   o1,s1,o2,s2,o3,s3,o4,s4,o5,s5 ; 9Eh  the five locate keys, slots 30h-34h
        int     9eh
        dw      o1, s1, o2, s2, o3, s3, o4, s4, o5, s5
        endm

KEY_TRANSPORT   macro   o1,s1,o2,s2,o3,s3,o4,s4,o5,s5 ; 9Fh  REC, OVER DUB, STOP, PLAY, PLAY START, slots 35h-39h
        int     9fh
        dw      o1, s1, o2, s2, o3, s3, o4, s4, o5, s5
        endm

KEY_DIGITS      macro   off,seg         ; 0A0h  one handler for the ten digit keys, slots 03h-0Ch
        int     0a0h
        dw      off, seg
        endm

KEY_SAVE        macro   buf             ; 0A1h  copy the key-down table to DS:buf
        int     0a1h
        dw      buf
        endm

KEY_RESTORE     macro   buf             ; 0A2h  copy the key-down table back from DS:buf
        int     0a2h
        dw      buf
        endm

; INT 7Dh / 7Eh -- register the current field with the data wheel: cx:si is the
; variable, bl its minimum, dx its maximum, di the caller-CS routine that
; redraws it, bh kept at DS(0FE7h):3778h.  Both install the wheel handler
; (an inline 99h record in the handler); 7Eh installs the digit keys (0A0h) as
; well, so the value can also be typed.  Register operands; sites that load them
; in another order or with a label between keep the plain instructions.
FIELD_WHEEL     macro   vseg,var,lo,mode,hi,draw        ; 7Dh  wheel only
        mov     cx, vseg
        mov     si, var
        mov     bl, lo
        mov     bh, mode
        mov     dx, hi
        mov     di, draw
        int     7dh
        endm

FIELD_ENTRY     macro   vseg,var,lo,mode,hi,draw        ; 7Eh  wheel and digit keys
        mov     cx, vseg
        mov     si, var
        mov     bl, lo
        mov     bh, mode
        mov     dx, hi
        mov     di, draw
        int     7eh
        endm
