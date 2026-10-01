; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; MUTE_GROUPS -- "Mute group:" field activation thunk at ARENA_MG_THUNK
; (feat/pins.inc; v1.20 flash 0x743B0); pads forward to that pinned offset.

        if      FREE_ARENA+ARENA_MG_THUNK-$ < 0
        fatal   "include out of order: ARENA_MG_THUNK already passed"
        endif
        PAD_TO  FREE_ARENA+ARENA_MG_THUNK, 000h      ; pad forward to the pinned offset

; cursor slot 3.  flash 0x743B0, 40 bytes, past the OS program-record array
; (0x65AE0-0x741B0), in the erased region 0x6112A-0x77FFE.
; entered far through the FIELD_THUNK slot of the relocated array's 4th entry
; (MUTE_FIELDS+3*MUTE_FIELD_SIZE).
; DS = 582Bh.  [0D7BEh] program index  [0D7C0h] selected pad note
;   [08D7Eh] MUTE ASSIGN cursor/field index
;   7382h:0  mute-group table, one byte per (program, note)


mg_field_thunk:
        mov     word ptr [MG_CURSOR], 3    ; cursor on the 4th field
        mov     al, [MG_DRUM]            ; drum index
        mov     ah, 040h
        mul     ah                      ; AX = program * 64
        add     al, [MG_NOTE]            ; + selected pad note
        adc     ah, 0
        sub     ax, 023h                ; notes are 23h..62h, so bias by 23h
        push    MG_GROUP_SEG                  ; far ptr to this pad's group byte:
        push    ax                      ;   7382h:(prog*40h + note - 23h)
        push    ds
        push    MUTE_FIELDS+3*MUTE_FIELD_SIZE  ; far ptr to field descriptor entry 3
        callf   EP_UI_FIELD_ENGINE_SEG:EP_UI_FIELD_ENGINE_OFF
        add     sp, 8
        retf
