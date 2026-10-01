; program record skeleton, both 2K SYS revisions & XL
; share same structure: 01Eh header, 4 consecutive
; arrays (notes, mix, pad map, FX, reverbs). note
; stride differs; XL has extra gap. includer
; sets both first.

        ifndef  SIZEOF_PGM_NOTE
         fatal  "set SIZEOF_PGM_NOTE first: 01Dh on the 2K, 018h on the XL"
        endif
        ifndef  PGM_FX_GAP
         fatal  "set PGM_FX_GAP first: 0 on the 2K, 0100h on the XL"
        endif

PGM_HDR_LEN             equ     01eh    ; blk-size word + 16-char name + NUL +
                                        ; 12 more header bytes, same 2K/XL
PGM_NOTE_COUNT          equ     64      ; MIDI note 23h..62h
PGM_NOTES               equ     PGM_HDR_LEN
PGM_MIX                 equ     PGM_NOTES + PGM_NOTE_COUNT*SIZEOF_PGM_NOTE
SIZEOF_PGM_MIX          equ     6
PGM_PADMAP              equ     PGM_MIX + PGM_NOTE_COUNT*SIZEOF_PGM_MIX
PGM_PADMAP_LEN          equ     64
PGM_FX_SECTIONS         equ     PGM_PADMAP + PGM_PADMAP_LEN + PGM_FX_GAP
PGM_FX_SECTION_COUNT    equ     2       ; FXS[2]
PGM_FX_REVERBS          equ     PGM_FX_SECTIONS + PGM_FX_SECTION_COUNT*SIZEOF_FXS
PGM_FX_REVERB_COUNT     equ     4       ; FXR[4]
SIZEOF_PGM              equ     PGM_FX_REVERBS + PGM_FX_REVERB_COUNT*SIZEOF_FXR

; PGM_FX_REVERBS = 96Eh (XL). c1's RUN_X_3F71A,
; c2's reverb routines: `si*3 shl 2` then `add ax,96Eh`;
; same index pattern as channel_get_ptr on 2K.
