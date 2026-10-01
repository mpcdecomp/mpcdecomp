; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; ZONE_SLICE -- addresses and layout for the XL ZONE SLICE port.  included by
; defs.inc, so text1/text2/data all see it.

; fixed entry points: text1/text2 cannot reference data.asm labels directly,
; so they far-jump here. append only.
ZS_ENTRY_SLOT_ZONE              equ ZS_TAIL_CODE+000h     ; hook A: znEDIT jog slot 4
ZS_ENTRY_EXT_DISPATCH           equ ZS_TAIL_CODE+003h     ; hook C: EDIT-mode zone actions
ZS_ENTRY_EDIT_TEXT              equ ZS_TAIL_CODE+006h     ; hook D: Edit: window prompt

ZS_T1_REVERSE                   equ     br_088B8          ; REVERSE ZONE action body
ZS_T1_ACT_BAD                   equ     L_08833          ; unrecognised action -> jmp L_088D5
ZS_T1_ACT_DONE2                 equ     BR_088D5          ; action epilogue, si already set
ZS_T1_NEW_SAMPLE                equ    ZONE_ACTION_NEW_SAMPLE          ; ZONE->NEW SAMPLE primitive, ret 10h
ZS_T1_DELETE                    equ     ZONE_ACTION_DELETE          ; DELETE ZONE primitive, ret 0ch
ZS_T1_ZNEDIT_ENTRY              equ  zone_screen_enter          ; znEDIT screen entry; stock's own fine
                                        ; far returns; windows use for close
ZS_TEXT1_RET                    equ     L_07CAC+5          ; a bare ret  (L_07CAC's tail)
ZS_TEXT1_RETF                   equ     _div+0bh                ; a bare retf

ZS_T2_OPENWIN_REG               equ   install_handler_15          ; (seg, off), retf 4: give the CURRENT field
                                        ; OPEN WINDOW handler, stock View: arm calls
                                        ; with null default
ZS_T2_SND_REFRESH1              equ  snd_window_refresh_key          ; the {34h, 37h} sound-change refresh pair
ZS_T2_SND_REFRESH2              equ  snd_window_pad_key          ; every stock screen descriptor carries
ZS_T2_EDIT_GENERIC              equ  br_0A00C          ; Edit: window's stock two-line prompt
ZS_T2_EDIT_TAIL                 equ     br_0A026          ; Edit: window paint common tail
ZS_T2_EDIT_UP                   equ     zone_edit_up          ; Edit: cursor UP (code 18h): index := 0, arm
                                        ; field 0; near-called from window
                                        ; open handler: absolute address
ZS_T2_EDIT_DOWN                 equ     zone_edit_down          ; Edit: cursor DOWN (code 19h): index := 1,
ZS_T2_CLAMP_ZONE                equ    zone_range_clamp          ; retf: re-clamp G_ZONE_START/G_ZONE_END against
                                        ; sound's length; zero if none
ZS_T2_PGM_FREE_SLOT             equ far_059BC          ; retf.  ax = first slot whose size word is
                                        ; <= 2, or 0FFFFh if all 24 in use
ZS_T2_PGM_ALLOC                 equ     program_select_wrapper          ; (slot), retf 2: grows the slot's arena
                                        ; allocate to 9Eh paragraphs, fill
                                        ; record; ax: 1=ok, 0=no heap room
ZS_T2_PGM_SELECT                equ    program_select         ; (slot), retf 2: makes it current; refuses
                                        ; error 5 if slot empty

ZS_SYS_ERRNO                    equ     G_ERRNO          ; SYS error code, shown by the action
                                        ; epilogue when si == 0
; field index is CS-typed in data.asm; equate carries value to avoid override
ZS_FIELD_INDEX                  equ     G_PLAY_MODE
ZS_ERR_NOMEM                    equ     001h
ZS_ERR_PGM_FULL                 equ     00ah            ; "Prog. directory full(24 max)"

; 128 x 36h-byte sound records: doubly-linked list with sentinel head at
; PTR_SAMPLE_DATA. new into old sentinel, fresh prepended; next is newest.

; znEDIT y=12: 24 pixels, wave 20..49. Zone: reuses View: slot (only fit).
; [9D85h] untouched; View: survives TRIM/LOOP.
ZS_ZIDX_VAL_X                   equ     0d4h            ; the stock View: value x
ZS_ZIDX_ROW_Y                   equ     00ch            ; the St:/End: row

; Number-of-Zones: XL descriptors for label/value/keys. FRAME = "Zone edit"
; WIN_CONFIRM at DATA:3A72h. format: 22h x y w h vs 0Ch 12 19 d5.
ZS_ZWIN_LBL_X                   equ     03dh            ; "Number of zones:", 16 chars
ZS_ZWIN_LBL_Y                   equ     00dh
ZS_ZWIN_VAL_X                   equ     09dh            ; immediately after the label
ZS_ZWIN_VAL_Y                   equ     00dh
ZS_ZWIN_TXT_X                   equ     03dh            ; captions; NOT the XL's 031h -- the
                                        ; caption: 25 chars = 150px, ends 211
                                        ; inside border 238
ZS_ZWIN_TXT_Y1                  equ     01eh
ZS_ZWIN_TXT_Y2                  equ     027h

; Edit:-window: column and rows for stock two-line prompt
ZS_EDIT_TXT_X                   equ     049h
ZS_EDIT_TXT_Y1                  equ     01ch
ZS_EDIT_TXT_Y2                  equ     025h

; SLICE SOUND Edit: End margin (0..99, kind 0Ch), Create program (0..1).
; Bounds from XL v1.20 (0x5A9BA, 0x5A9E4). x=187 vs base 121 because
; "Create new program:" = 19 chars, 121 outside frame.
ZS_SLICE_VAL_X                  equ     0bbh            ; 187
ZS_SLICE_Y1                     equ     ZS_EDIT_TXT_Y1  ; End margin row
ZS_SLICE_Y2                     equ     ZS_EDIT_TXT_Y2  ; Create new program row
ZS_SLICE_LBL1_X                 equ     079h            ; 187 - 11*6, "End margin:"
ZS_SLICE_LBL2_X                 equ     049h            ; 187 - 19*6, "Create new program:"
ZS_SLICE_MARGIN_MAX             equ 99
SLICE_END_MARGIN                equ    1eh             ; 30, the XL's default for ZAS_END_MARGIN

; ZONE mode: sample divided into ZONE_COUNT equal parts, linked boundaries.
; N zones = N+1 shared points, not independent pairs. storing Start also
; moves previous End, as on XL.
ZONE_BOUNDARY                   equ     ZONE_TABLE_BASE+000h    ; 17 dwords
ZONE_INDEX                      equ     ZONE_TABLE_BASE+044h    ; selected zone, 1-based 1..COUNT
ZONE_COUNT                      equ     ZONE_TABLE_BASE+045h    ; zones in use, 1..16

; G_ZONE_START/END dwords: pre-existing single-zone scalars all stock code
; reads/writes. zone_load/store_current_zone sync with ZONE_BOUNDARY on
; index change; rest unaware of zones.

ZAS_STARTSAVE                   equ     ZONE_TABLE_BASE+046h    ; dword, outer Start
ZAS_ENDSAVE                     equ     ZONE_TABLE_BASE+04ah    ; dword, outer End
ZAS_RANGE                       equ     ZONE_TABLE_BASE+04eh    ; dword, ENDSAVE - STARTSAVE
ZAS_PROD                        equ     ZONE_TABLE_BASE+052h    ; dword, boundary-recompute scratch
ZAS_ZONEIDX                     equ     ZONE_TABLE_BASE+056h    ; byte, loop index
ZAS_LOOPCNT                     equ     ZONE_TABLE_BASE+057h    ; byte, samples SLICE will create
ZAS_NAMESAVE                    equ     ZONE_TABLE_BASE+058h    ; 58 bytes, ZONE_NAME_BUF saved
ZONE_INDEX_PREV                 equ     ZONE_TABLE_BASE+092h    ; byte, last index loaded
ZS_ACTION_LABELS                equ    ZONE_TABLE_BASE+093h    ; 8 x 25, EDIT-mode action names
ZAS_BASENAME                    equ     ZONE_TABLE_BASE+15bh    ; 17 bytes, the sliced sound's name
ZWIN_SAVE_COUNT                 equ     ZONE_TABLE_BASE+16ch    ; byte, ZONE_COUNT on pop-up open
ZS_NUM_STRINGS                  equ     ZONE_TABLE_BASE+16dh    ; 17 x 6, "0".."16", same shape as
                                                ; the stock View: table at 30B2h
ZS_NUM_STRINGS_N                equ    17
ZS_NUM_STRIDE                   equ     6
ZAS_END_MARGIN                  equ     ZONE_TABLE_BASE+1d3h    ; byte, frames, 0..99
ZAS_MAKE_PGM                    equ     ZONE_TABLE_BASE+1d4h    ; byte, 0 = NO, 1 = YES
ZAS_PGM_SLOT                    equ     ZONE_TABLE_BASE+1d5h    ; byte, the slot SLICE created.
                                                ; 0FFh: none, 0FEh: failed
                                                ; >= 24 = no program
ZONE_NAME_BUF                   equ     TBL_SOUND_NAMES ; "New name:" text-entry scratch, one 17-byte
                                        ; one slot of 128-entry
                                        ; stride-11h table

; calling TEXT1 from tail: tail runs CS=DATA. TEXT1 routine with ret <n> is
; reached via fake near-return (bare retf in TEXT1). stack=[ZS_TEXT1_RETF]
; [args][back][ZS_DS]; ret <n> pops retf, far-returns. args/clobbering match
; near-call convention.
;
;         ZS_T1CALL_PRE  back_label
;         push ...                       ; routine's <n> bytes arguments
;         ZS_T1CALL_GO   ZS_T1_NEW_SAMPLE
;       back_label:
ZS_T1CALL_PRE macro back
        push    word ZS_DS
        push    word back
        endm

ZS_T1CALL_GO macro target
        push    word ZS_TEXT1_RETF
        jmpf    ZS_T1S:target
        endm
