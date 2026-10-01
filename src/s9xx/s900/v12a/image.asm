; Akai S900 main ROM v1.2a ("AKAI S900 VERSION 1,2"): ../../common/os.inc,
; the program the OS disks also carry.
;
; ADDRESSING.  The 32 KB sit at 0F8000h.  reset_stub (7FF0h) far-jumps to
; 0FFF8h:0, which copies the ROM to linear 0 and far-jumps to 0000:0000h, so a
; ROM offset is its runtime address and org 0 is literal.  The image is also
; the initial RAM: 0004h-003Fh is the live IVT (INT 01h-0Fh; INT 00h's slot
; holds the entry jump) and the zero run from 005Ah is variables.

        cpu     V30

MODEL                           equ     900
FW_VERSION                      equ     120

        include "ram.inc"                       ; this version's RAM variables
        org     0
        include "../../common/os.inc"

        end
