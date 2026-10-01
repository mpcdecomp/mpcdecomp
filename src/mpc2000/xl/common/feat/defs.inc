; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; ---- FEATURE SYMBOLS, the same five versions over, named the same on both
; machines.  MUTE_GROUPS and COPY_NOTE_PARAMS exist on both by different
; mechanisms -- the XL relocates its field descriptor array and window
; descriptor, the 2K hooks a repaint and registers one key -- but they address
; the same objects, so the names match.  2K side: src/2k/common/sys/data.asm's
; labels, feat/{mute,copy}_defs.inc.
; what differs stays differently named: MUTE_FIELDS and friends are the XL's
; 42-byte linked descriptors, which base 2K has no equivalent of.
; every value is a DS offset unless noted.

        ifndef  FEAT_DEFS_INC
FEAT_DEFS_INC   equ     1

        include "../../../common/window_macros.inc"
        include "../../../common/assert_at.inc"
        include "pins.inc"

; ---- the DS slot: consts's unreferenced duplicate credits drawing
; (feat/ds_slot.inc), DS-reachable, clear of the OS's own BSS fill.  its DS
; offset comes from consts's label; v1.20: DS:6F86h, flash 0x5F236.
FEAT_DS_SLOT_DS  equ    FC_FEAT_DS_SLOT-SEG_DS
DS_SLOT_MG_FIELDS equ   0000h           ; MUTE_GROUPS       mute_fields
DS_SLOT_CP_WIN   equ    00a8h           ; COPY_NOTE_PARAMS  copy_window

; ---- MUTE ASSIGN window
; entry N is MUTE_FIELDS + N*MUTE_FIELD_SIZE; the engine at 0x3BDBE walks them.
MUTE_FIELD_SIZE  equ    02ah
MUTE_FIELD_THUNK equ    00eh            ; far ptr to the field's own thunk
MUTE_CURSOR      equ    C2_W_MUTE_ASSIGN_CURSOR ; index of the field the cursor is on

        ifdef   MUTE_GROUPS
MUTE_FIELDS      equ    FEAT_DS_SLOT_DS+DS_SLOT_MG_FIELDS ; relocated 4-entry array
MUTE_FIELD_COUNT equ    4               ; Note:, Mute group:, Note:, Note:
        else
MUTE_FIELDS      equ    03cf8h          ; stock 3-entry array, flash 0x5BFA8
MUTE_FIELD_COUNT equ    3               ; Note:, Note:, Note:
        endif

MG_DRUM          equ    C2_B_PAD_DRUM   ; drum 0..3 the pad UI is showing
MG_NOTE          equ    C2_B_PAD_NOTE   ; selected pad note, 23h..62h
MG_CURSOR        equ    MUTE_CURSOR
MG_MAX           equ    15              ; group 0 = ungrouped
MG_VAL_X         equ    058h            ; value, on the relabelled caption's
MG_ROW_Y         equ    015h            ;   row; same two numbers on the 2K

; ---- COPY window (PROGRAM, pad copy), pushed by c2 as DS offsets
CP_ITEMS_AT      equ    023h            ; the relocated draw list, past its key records
        ifdef   COPY_NOTE_PARAMS
CP_WIN           equ    FEAT_DS_SLOT_DS+DS_SLOT_CP_WIN ; relocated descriptor
CP_WIN_ITEMS     equ    CP_WIN+CP_ITEMS_AT ; its draw list
        else
CP_WIN           equ    0377eh          ; stock descriptor, flash 0x5BA2E
CP_WIN_ITEMS     equ    0379ch          ; its draw list
        endif

G_COPY_SRC_PGM   equ    098b8h
G_COPY_DST_PGM   equ    098b9h
G_COPY_DST_NOTE  equ    098bah
G_COPY_SRC_NOTE  equ    MG_NOTE         ; pad UI's note = the copy source
CP_KEY_PARAMS    equ    WIN_K_F2        ; 03h on both; raw panel code + 1
CP_FKEY          equ    002h            ; F2 = the 1Ah draw item's fkey number
CP_NOTICE_X      equ    07fh            ; right of the destination "Note:" field
CP_NOTICE_Y      equ    029h            ;   (2K x differs: its row holds a live
                                        ;   field with a wider cursor box)

        endif
