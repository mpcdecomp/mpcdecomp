; MZ relocation table.  Each entry is a (segment, offset) naming an image word
; the loader adds the load paragraph to.  Write entries as expressions on the
; object they point into so they follow it when it moves:
;
;       RELOC   DATA_SEG, TBL_WINKEYS_MUTE_ASSIGN+008h
;
; Bare-number entries point into objects that don't move.  Stock: 9,760 bytes.

RELOC_COUNT     set     0

RELOC   macro   seg,off
        dw      off, seg
RELOC_COUNT     set     RELOC_COUNT+1
        endm
