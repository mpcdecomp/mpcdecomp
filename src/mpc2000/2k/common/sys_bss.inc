; BSS: data past image, zeroed by boot, not loaded.
; Size-sequence layout shared both versions.
; Each name = sum of prior sizes from BSS_BASE.
; Growing object shifts BSS_END and stack.
; BSS(name,size) names next bytes; BSS_GAP skips unnamed.
; W_/B_/FP_ names sized by access; rest of span is gap.

BSS     macro   lname, lsize
lname   equ     _bss
_bss    set     _bss+lsize
        endm

BSS_GAP macro   lsize
_bss    set     _bss+lsize
        endm

; BSSCHK(name, stock address): verifies layout = stock, relative to BSS_BASE.
; bss_check.inc runs it only while BSS has stock size.
BSSCHK  macro   lname, laddr
        if      lname-BSS_BASE <> laddr-BSS_STOCK_BASE
         fatal  "BSS layout drifted"
        endif
        endm




