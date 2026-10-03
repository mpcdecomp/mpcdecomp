; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; the base-2K features' shared vocabulary -- the DATA-segment tail they live in,
; the far segments they reach, and the stock entry points they call.  included
; by every SYS part of every version, after seg_layout.inc; nothing here names
; an address, only the version's own labels and BSS_END.

; pad with 90h up to <addr>, fatal if code overran
; preserves inherited TEXT1 label at stock offset
PIN     macro   target
        if      $ > target
         fatal  "PIN: code overran its stock address - move new code into a slack run"
        endif
        db      (target-$) dup (90h)
        endm

; pad with 00h to <addr>, fatal if overran; in data.asm materializes BSS gap
; zone state block at ZONE_TABLE_BASE, independent of tail code size
PIN0    macro   target
        if      $ > target
         fatal  "PIN0: data overran its fixed address"
        endif
        db      (target-$) dup (00h)
        endm

; pad with 00h to <addr>, no-op if already past
; each feature include opens with one: any subset in any order stays above zero-fill sweep
PIN0_MIN macro   target
        if      $ < target
        db      (target-$) dup (00h)
        endif
        endm

; DATA segment tail: feature code/state at/above BSS_END (first DATA byte past
; zero-fill sweep and SILENCE/REVERSE buffers). Fixed slice per feature,
; layout independent of which enabled. text1/text2 hooks reference fixed
; constants only; feature code uses plain labels.
;
;   +0000h  ZONE_SLICE   code and strings          (ends +0883h)
;   +0890h  ZONE_SLICE   state block               (ends +0A66h)
;   +0A70h  MUTE_GROUPS  code, group table, scratch
;   +0EE4h  TUNE_LIMIT   tl_ratio, 36 bytes
;   after   COPY_NOTE_PARAMS -- hooked from DATA only, no fixed address
;
; ceiling: SYS stack, top at SYS_RAM_TOP (05A000h). INT 38h heap at SYS_RAM_TOP
; program arena segment stable when SYS grows. DATA caps 0B7C0h (v1.72),
; 0BF40h (v1.50); all four features +108Ch combined. Addresses in tail_defs.inc.

; MARGIN is zero-fill BSS from stock image end to DATA:FEAT_TAIL
; if tail goes past FEAT_TAIL, set TAIL_PAST_SWEEP; stack one para above image
FEAT_MARGIN macro stock
        ifdef   TAIL_PAST_SWEEP
        if      (IMAGE_BYTES+15)/16 < DATA_SEG+FEAT_TAIL/16
         fatal  "the image ends below the zero-fill sweep's end"
        endif
MARGIN                          equ     1
        else
MARGIN                          equ     stock
        endif
        endm

; post-relocation segments
; MZ relocation table fixed stock, no new entries.
; far pointer CREATE: stores final para (preserved)
; far pointer OVERWRITE: keeps pre-reloc form (TEXT1/TEXT2/DATA_SEG)
; per replaced instruction's segment operand
; SYS loads at 03000h (LOAD_PARA)
ZS_LOAD_PARA                    equ     03000h
ZS_T1S                          equ     ZS_LOAD_PARA+TEXT1_SEG
ZS_T2S                          equ     ZS_LOAD_PARA+TEXT2_SEG
ZS_DS                           equ     ZS_LOAD_PARA+DATA_SEG

WIN_FIELD_KEYS                  equ     TBL_WINKEYS_00CBA ; the handler table field_register merges

PGM_TABLE_N                     equ     24

; stock entry points: arguments in PUSH order (first=highest frame, last=[bp+6])
; all far pointers; all clean own stack
ZS_T1_INT2E                     equ     disp_list_run          ; disp_list_run(seg, off), retf 4: run a
                                        ; terminator: single 00h byte (not whole record). stock DATA:2606h: `19 00`
                                        ; live list at 2608h
ZS_T1_INT30                     equ     win_keys_merge          ; win_keys_merge(seg, off), retf 4: MERGE a
                                        ; merge handler table into live screen (no free slot needed). {01h, null} clears
                                        ; live set first; 29 sites omit and merge, 5 use for key disable (1E0Ch stub).
                                        ; prefer ZS_T2_INSTALL_KEY for one key.
ZS_T2_INSTALL_KEY               equ     install_handler          ; install_handler(key, seg, off), retf 6:
                                        ; register ONE {key, handler} on live screen. builds 2-slot table on own stack:
                                        ; slot 0 = {key, handler}, slot 1 = 00h KEY byte terminator (not a record)
ZS_T2_FIELD_REG                 equ     voice_trigger_full          ; voice_trigger_full(var_seg, var_off, max,
                                        ; MIN/digit_count hardcoded 0/1; overrides WIN_FIELD_BOX_W with (box_chars-1)*6 px
                                        ; (2-char box: box_chars=3)
ZS_T2_NOTE_FIELD                equ     timer_value_read_1          ; timer_value_read_1(var_seg, var_off, x,
                                        ; MIN 23h/22h(off when allow_off=1), MAX 62h, 2 digits. draws value during arming
ZS_T2_NOTE_DRAW                 equ     timer_value_read_3          ; timer_value_read_3(note, x, y), retf 6:
                                        ; output: number at x, '/' at x+0Ch, note name at x+12h (6 chars total)
ZS_T2_SOUND_DRAW                equ     timer_value_read_4          ; timer_value_read_4(snd_seg, snd_off, x,
                                        ; y), retf 8: the 16-character sound name.
ZS_T2_STR_DRAW                  equ     cmd_dispatch_1E          ; cmd_dispatch_1E(x, y, str_seg, str_off),
                                        ; retf 8: one static string, built as a
                                        ; {1Eh,x,y,far,00h} list on the stack and
                                        ; run through disp_list_run.
ZS_T2_REFRESH                   equ     field_redraw          ; the display flush every paint tail calls

        include "../../../common/feat/tune.inc"
        include "tune_hooks.inc"
        include "zone_hooks.inc"
        include "mute_hooks.inc"
        include "copy_hooks.inc"
