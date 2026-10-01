; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; MUTE_GROUPS -- the base-2K hooks.  each is the stock run with the option off.

; text1 L_0620E: cursor dispatch by field. Group row y=15h between pad
; (y=0Bh) and first mute-off (y=1Eh). Field order (top to bottom): 0=pad,
; 1=group, 2=first mute-off, 3=second. Field 0 falls through; far jump at
; field 1 goes to END. 22 bytes either way. ZS_DS (no relocation).
MG_HOOK_ROW_DISPATCH macro {GLOBALSYMBOLS}
        ifdef   MUTE_GROUPS
mg_hook_row_dispatch:
        mov     al, byte ptr [G_MUTE_ASSIGN_FIELD]
        cbw
        or      ax, ax
        je      br_06256                ; 0 -- the pad itself,   y=0Bh
        dec     ax
        dec     ax
        je      L_0626E                 ; 2 -- "Mutes off:" one, y=1Eh
        dec     ax
        je      br_06262                ; 3 -- "Mutes off:" two, y=27h
        jmpf    ZS_DS:MG_ENTRY_DISPATCH ; 1 -- the group,        y=15h
        PIN     mg_hook_row_dispatch+22
        else
        mov     al, byte ptr [G_MUTE_ASSIGN_FIELD]
        cbw
        or      ax, ax
        je      br_06256
        dec     ax
        je      L_0626E
        dec     ax
        je      br_06262
        mov     byte ptr [G_MUTE_ASSIGN_FIELD], 1
        jmp     L_0626E
        db      90h
        endif
        endm

; DOWN/RIGHT clamp: one immediate byte; 2 for stock (three fields), 3 with
; group. UP/LEFT clamps at 0 (unchanged).
MG_HOOK_FIELD_CLAMP macro
        ifdef   MUTE_GROUPS
        cmp     byte ptr [G_MUTE_ASSIGN_FIELD], MG_FIELD_MAX
        else
        cmp     byte ptr [G_MUTE_ASSIGN_FIELD], 2
        endif
        endm

; Group field painter: draws label and value, then flush. Five bytes
; either way. DATA_SEG: segment word carries relocation from replaced
; TEXT2_SEG.
MG_HOOK_REPAINT_FLUSH macro
        ifdef   MUTE_GROUPS
        callf   DATA_SEG:MG_ENTRY_PAINT
        else
        callf   TEXT2_SEG:field_redraw
        endif
        endm

; text2 br_026E0: voice_start's second "Mutes off:" note block (19 bytes).
; Far jump to mg_choke, which reproduces block then kills every other pad in
; triggering pad's mute group. ZS_DS (no relocation).
MG_HOOK_CHOKE macro {GLOBALSYMBOLS}
        ifdef   MUTE_GROUPS
mg_hook_choke:
        jmpf    ZS_DS:MG_ENTRY_CHOKE
        PIN     mg_hook_choke+19
        else
        mov     ax, word ptr [bp+6]
        sub     ax, 23h
        cmp     ax, 3fh
        ja      br_026F3
        push    word ptr [bp+6]
        nop
        push    cs
; ? misc_deb2 @0x0deb2 is mid-instruction
        call    voice_release_by_note
        endif
        endm

; G_MUTE_ASSIGN_FIELD power-on value. Outside zero-fill sweep; not reset on
; window entry, so window opens on the field it names. Stock opens on field 1
; (first mute-off note), renumbered to field 2, so value 2 preserves stock behavior.
MG_HOOK_FIELD_INIT macro
        ifdef   MUTE_GROUPS
        db      02h
        else
        db      01h
        endif
        endm

; Row-15h caption "Mute group:", eleven chars vs stock's "Mutes off:" (ten).
; No list slack: handler table TBL_WINKEYS_MUTE_ASSIGN follows immediately.
; Byte absorbed from table's trailing padding (MG_HOOK_KEYS_PAD): table
; shifts up one, nothing past it moves. Eleven relocation entries point to
; table label, move with it. XL also rewrites same row to "Mute group:"
; in src/mpc2000/2kxl/v120/feat/mute_drawlist.inc.
MG_HOOK_CAPTION macro
        ifdef   MUTE_GROUPS
        WIN_LABEL 13h, 15h, "Mute group:"
        else
        WIN_LABEL 13h, 15h, "Mutes off:"
        endif
        endm

; Trailing padding for item list's byte. Stock ends handler table with eight
; zeros; scan stops at first zero KEY (install_handler writes one). Seven zeros
; still terminate table. Hook provides six of the eight.
MG_HOOK_KEYS_PAD macro
        ifdef   MUTE_GROUPS
        db      00h, 00h, 00h, 00h, 00h
        else
        db      00h, 00h, 00h, 00h, 00h, 00h
        endif
        endm
