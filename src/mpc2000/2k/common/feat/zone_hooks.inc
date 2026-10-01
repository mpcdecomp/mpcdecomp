; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; ZONE_SLICE -- the base-2K hooks.  each is the stock run with the option off.

; hook A at text1 br_07CC8: replaces SND_EDIT_VIEW handler (max
; 1) with ZONE_INDEX pop-up (max ZONE_COUNT) at 0D4h; 5-byte
; far jump + 1 PIN filler; PIN holds zone_start_fine_up
ZS_HOOK_SLOT_ZONE macro {GLOBALSYMBOLS}
        ifdef   ZONE_SLICE
zs_hook_slot_zone:
        jmpf    DATA_SEG:ZS_ENTRY_SLOT_ZONE
        PIN     zs_hook_slot_zone+6
        else
        callf   TEXT2_SEG:X_090F4
        ret
        endif
        endm

; hook C: replaces 5-byte tail (jne L_08833 / jmp br_088B8);
; zs_ext_dispatch reproduces: ax==0 -> br_088B8 REVERSE, else
; L_08833; adds actions 5/6/7; ZS_DS no relocation entry,
; carries final paragraph
ZS_HOOK_EXT_DISPATCH macro {GLOBALSYMBOLS}
        ifdef   ZONE_SLICE
zs_hook_ext_dispatch:
        jmpf    ZS_DS:ZS_ENTRY_EXT_DISPATCH
        PIN     zs_hook_ext_dispatch+5
        else
        jne     L_08833
        jmp     br_088B8
        endif
        endm

; hook B at text2 zone_start_fine_paint: replaces St:/End: row
; third field table (SND_EDIT_VIEW*6 + TBL_LEFT_RIGHT_LABELS)
; stride-6 with two 3-byte immediates; no code moves, no paint
; hook; paired with ZS_HOOK_VIEW_LABEL
ZS_HOOK_VIEW_VALUE macro
        ifdef   ZONE_SLICE
        mov     al, byte ptr [ZONE_INDEX]
        else
        mov     al, byte ptr [SND_EDIT_VIEW]
        endif
        endm

ZS_HOOK_VIEW_TABLE macro
        ifdef   ZONE_SLICE
        add     ax, ZS_NUM_STRINGS
        else
        add     ax, TBL_LEFT_RIGHT_LABELS
        endif
        endm

; Edit action-name renderer: 25-byte stride; replaces
; TBL_ZONE_ACTION_LABELS (5 entries) with zt_action_labels (8
; entries); indexes 5-7 drew fragments (overlapped another
; screen's labels); same-size 3-byte immediate
ZS_HOOK_ACTION_LABELS macro
        ifdef   ZONE_SLICE
        add     ax, ZS_ACTION_LABELS
        else
        add     ax, TBL_ZONE_ACTION_LABELS
        endif
        endm

; hook D at text2 zone_edit_paint: 7 bytes up to br_09FC0 ->
; 5-byte far jump + 2 PIN fillers (dec ax/dec ax/jle br_0A00C/
; jmp br_0A026/db 90h); ax = action index - 2; zs_edit_text
; renders 2-4 generic two-line prompt, 5-7 real bodies (stock
; blank); ZS_DS run: no relocation entry
ZS_HOOK_EDIT_TEXT macro {GLOBALSYMBOLS}
        ifdef   ZONE_SLICE
zs_hook_edit_text:
        jmpf    ZS_DS:ZS_ENTRY_EDIT_TEXT
        PIN     zs_hook_edit_text+7
        else
        dec     ax
        dec     ax
        jle     br_0A00C
        jmp     br_0A026
        db      90h
        endif
        endm

; Edit action combo jog MAX (inclusive): 4 covers stock 5
; (ZONE->NEW SAMPLE..REVERSE); 7 adds SLICE SOUND/DISCARD/
; LOOP FROM ST TO END; becomes dword WIN_FIELD_MAX via
; voice_trigger_full -> status_read_6A_3 -> field_register;
; jbe clamp accepts MAX
ZS_HOOK_ACTION_MAX macro
        ifdef   ZONE_SLICE
        push    7
        else
        push    4
        endif
        endm

; softkey label 'znEDIT' -> ' ZONE ' (6 bytes exact); padding
; symmetric: renderer centers by (cell_width - len*6)/2; ' ZONE '
; lands where centered 4-char 'ZONE' would; every DATA byte
; after at stock address
ZS_HOOK_SOFTKEY macro
        ifdef   ZONE_SLICE
        db      " ZONE "
        else
        db      "znEDIT"
        endif
        endm

; znEDIT "View:" -> "Zone:", paired with ZS_HOOK_VIEW_VALUE.  same length
; ("iew"/"one" swap), nothing after it moves.
ZS_HOOK_VIEW_LABEL macro
        ifdef   ZONE_SLICE
        WIN_LABEL 0b6h, 0ch, "Zone:"
        else
        WIN_LABEL 0b6h, 0ch, "View:"
        endif
        endm

; hook E: handler table installed by TEXT2 L_0A0CA via
; win_keys_merge; repoint UP (18h)/DOWN (19h) from
; zone_edit_up/zone_edit_down to tail (5-byte entries);
; SLICE SOUND owns second/third field; 32h paint, 05h
; CANCEL, 06h DO IT, 15h OPEN WINDOW, 34h refresh stay stock;
; both segment words have relocation entries, retain
; pre-relocation DATA_SEG form; UP/DOWN stack one field per row;
; znEDIT all 4 keys: 16h/17h step slots, 18h/19h between two
; text rows; Edit window 18h/19h only
ZS_HOOK_EDIT_KEYS macro
        ifdef   ZONE_SLICE
        WIN_KEY   WIN_K_UP, DATA_SEG, zs_edit_up
        WIN_KEY   WIN_K_DOWN, DATA_SEG, zs_edit_down
        else
        WIN_KEY   WIN_K_UP, TEXT2_SEG, zone_edit_up
        WIN_KEY   WIN_K_DOWN, TEXT2_SEG, zone_edit_down
        endif
        endm
