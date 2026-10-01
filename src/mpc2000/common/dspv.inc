; DSPV -- the DSP/DMA voice parameter block, 02Ch bytes.
; ============================================================================
; struct from dma_field_write.inc writes one field per 15-bit flag bit;
; names = register-group (ASIC register group and 32-bit half each field
; lands in), not musical; group meaning not claimed here;
;
; port 080h DMA_CTRL<-(group<<8)|voice, 082h DMA_DATA_LO, 084h DMA_DATA_HI,
; 086h DMA_ADDR_HI <- DSPV_ADDR/DSPV_ADDR2
;
; size 02Ch, highest field +2Ah, template at DS:00418h (v1.20 flash 0x586C8),
; changes at +2Ch
;
; 32-voice loop (c1 far_3E59A): si=0..1Fh (voice index, fills DMA_CTRL
; low byte); push 7FFFh/ds/418h/si, call dma_field_write; xor ax,ax,
; out 88h,ax; spin in al,88h until bit 80h clear; one DSPV per voice
;
; byte-identical v1.72 and v1.20; see dma_field_write.inc header
;
; flag bit -> field, from writer:
;   0001h +04(ADDR)            0002h +04,+02,+00          0004h +06
;   0008h +14                  0010h +16                  0020h +1C
;   0040h +1E                  0080h +1A,+18              0100h +12,+10
;   0200h +20                  0400h +22                  0800h +0C,+0E
;   1000h +0A(ADDR2),+08       2000h +26,+24              4000h +2Ah,+28

DSPV_G0_LO       equ    000h            ; dw  -> DATA_LO, group 0 (flag 0002h)
DSPV_G0_HI       equ    002h            ; dw  -> DATA_HI, group 0 (flag 0002h)
DSPV_ADDR        equ    004h            ; dw->ADDR_HI grp 0 (flags 1-2) 0100h
DSPV_G1_LO       equ    006h            ; dw->DATA_LO, g1 (flag 0004h), 1000h
DSPV_G1_HI       equ    008h            ; dw->DATA_HI, g1 (flag 1000h), 1000h
DSPV_ADDR2       equ    00ah            ; dw  -> ADDR_HI,  group 1 (flag 1000h)
DSPV_G2_HI       equ    00ch            ; dw->DATA_HI g2 (flag 0800h) 0C000h
                                        ; HI @lower; LO @lower elsewhere
DSPV_G2_LO       equ    00eh            ; dw  -> DATA_LO, group 2.  Template 4000h
DSPV_G3_LO       equ    010h            ; dw  -> DATA_LO, group 3 (flag 0100h)
DSPV_G3_HI       equ    012h            ; dw  -> DATA_HI, group 3
DSPV_G4_LO       equ    014h            ; dw->DATA_LO, g4 (flag 0008h), 0FA24h
DSPV_G4_HI       equ    016h            ; dw->DATA_HI g4 (0010h) indep +14h
DSPV_G5_LO       equ    018h            ; dw  -> DATA_LO, group 5 (flag 0080h)
DSPV_G5_HI       equ    01ah            ; dw  -> DATA_HI, group 5
DSPV_G6_LO       equ    01ch            ; dw->DATA_LO g6 (0020h) 0FA24h=+14h
DSPV_G6_HI       equ    01eh            ; dw  -> DATA_HI, group 6 (flag 0040h)
DSPV_G7_LO       equ    020h            ; dw  -> DATA_LO, group 7 (flag 0200h)
DSPV_G7_HI       equ    022h            ; dw  -> DATA_HI, group 7 (flag 0400h)
DSPV_G8_LO       equ    024h            ; dw  -> DATA_LO, group 8 (flag 2000h)
DSPV_G8_HI       equ    026h            ; dw  -> DATA_HI, group 8
DSPV_G9_LO       equ    028h            ; dw  -> DATA_LO, group 9 (flag 4000h)
DSPV_G9_HI       equ    02ah            ; dw  -> DATA_HI, group 9
SIZEOF_DSPV      equ    02ch

DSPV_VOICES      equ    32              ; `inc si / cmp si,20h / jl` in the init
DSPV_ALL_FIELDS  equ    07fffh          ; the flags word the init loop pushes
