; Akai S950 main ROM, v1.0a and v1.2a: the S900 program's text
; (../../common/os.inc) under MODEL 950.  The two differ in 24
; bytes: the version digits, two constants, and v1.2a's fn_004a_s950 hook.
;
; ADDRESSING.  reset_stub (FFF0h) far-jumps to F000:FF80h, which copies the
; whole 64 KB to linear 0 and far-jumps to 0000:0040h, so a ROM offset is its
; runtime address and org 0 is literal.  The image is also the initial RAM:
; 0000h-003Fh is the live IVT (INT 00h-0Fh), the zero runs are variables, and
; 0A400h-0FE01h is erased EPROM (0FFh) that the OS uses as RAM.

        include "ram.inc"                       ; the S950's RAM variables
        include "../../common/os.inc"
