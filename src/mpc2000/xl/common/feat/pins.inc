; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; where the features' blobs sit, for the parts that reach them.  every address
; here is derived from the version's own DS_SEG, so one source serves all five.

        ifndef  FEAT_PINS_INC
FEAT_PINS_INC   equ     1

; a flash address as the normalized far pointer (paragraph, offset 0..0Fh) --
; how the blobs in the arena address their own entries
LSEG             function lin,(lin)>>4
LOFF             function lin,(lin)&0Fh
FARPTR_N macro   lin                    ; the same, as a stored dd
        dw      LOFF(lin), LSEG(lin)
        endm

; the feature arena (feat/arena.inc) starts at the first byte the OS's
; program-record array cannot reach: pgm_memory_init rounds DS:PGM_ARRAY_DS up
; to a paragraph, adds 10h, and lays out PGM_COUNT records of SIZEOF_PGM bytes
; from there (structures.inc).  v1.20: 0x582B0+0D820h+10h+24*099Eh = 0x741B0.
; growth ahead of consts' DS_ORIGIN moves the array with DS_SEG, and this with it.
PGM_ARRAY_LIN    equ    DS_SEG*16+PGM_ARRAY_DS+010h
FEAT_ARENA_LIN   equ    PGM_ARRAY_LIN+PGM_COUNT*SIZEOF_PGM

; pinned offsets into the arena, one per far entry another part names
ARENA_CP_REPAINT equ    0000h           ; COPY_NOTE_PARAMS  cp_repaint
ARENA_CP_PARAMS  equ    002ah           ;                   cp_params
ARENA_CP_NOTICE  equ    0180h           ;                   cp_notice
ARENA_MG_THUNK   equ    0200h           ; MUTE_GROUPS       mg_field_thunk
ARENA_MG_DRAW    equ    0240h           ;                   mg_draw
ARENA_MG_PAINT   equ    026fh           ;                   mg_paint
ARENA_TL_RATIO   equ    0280h           ; TUNE_LIMIT        tl_ratio

MG_GROUP_SEG     equ    LSEG(FEAT_ARENA_LIN)-099h ; mute-group table, one byte
                                        ;   per pad (the 2K packs nibbles; its
                                        ;   DATA tail is 96 bytes from its ceiling)
MG_NEW_THUNK     equ    FEAT_ARENA_LIN+ARENA_MG_THUNK
MG_NOTIFY        equ    FEAT_ARENA_LIN+ARENA_MG_DRAW
MG_PAINT_SEG     equ    LSEG(FEAT_ARENA_LIN+ARENA_MG_DRAW) ; mg_paint, spliced into
MG_PAINT_OFF     equ    LOFF(FEAT_ARENA_LIN+ARENA_MG_DRAW)+ARENA_MG_PAINT-ARENA_MG_DRAW
                                        ;   the MUTE ASSIGN repaint
TL_RATIO_SEG     equ    LSEG(FEAT_ARENA_LIN+ARENA_TL_RATIO)
TL_RATIO_OFF     equ    LOFF(FEAT_ARENA_LIN+ARENA_TL_RATIO)
CP_REPAINT_LIN   equ    FEAT_ARENA_LIN+ARENA_CP_REPAINT
CP_PARAMS_LIN    equ    FEAT_ARENA_LIN+ARENA_CP_PARAMS

        endif
