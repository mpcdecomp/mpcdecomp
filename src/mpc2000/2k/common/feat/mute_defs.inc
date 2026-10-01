; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; MUTE_GROUPS -- addresses for the base-2K mute-group field and choke.

; fixed entry offsets; text1/text2 can only name constants, so hooks branch
; here. append only.
MG_ENTRY_DISPATCH               equ   MG_CODE+000h    ; text1 0624Fh, MUTE ASSIGN cursor slot 1
MG_ENTRY_PAINT                  equ   MG_CODE+003h    ; text1 063BAh, the repaint's closing flush
MG_ENTRY_CHOKE                  equ   MG_CODE+006h    ; text2 026E0h, voice_start's mute-off pair

; MUTE ASSIGN window at DATA:2480h; paint handler in text1 track_calc_multi_2.
; Two objects: item list at 2480h, handler table at 24E0h.
; XL caption 11 chars vs stock 10: one byte growth. Eleven relocation entries
; (24E8h, 24EDh...251Ah) point to label TBL_WINKEYS_MUTE_ASSIGN; table and
; entries move together. If separated, loader patches wrong pointer halves.
; Byte absorbed from table's trailing padding (MG_HOOK_KEYS_PAD). Table
; shifts up one, last byte stays, DATA past 251Ch untouched.
; Only other edit: text1 L_063EA pushes table.
;
; Handler table contents:
;   32h paint -> text1 62F8h    15h/05h -> 5B40h (OPEN WINDOW / F4 CLOSE)
;   18h/16h  -> 6286h (UP/LEFT) 19h/17h -> 629Ch (DOWN/RIGHT)
;   37h      -> 62B2h pad_note_select_4   06h -> 6290h (F5 PLAY)
;   34h      -> TEXT2 5EFAh (refresh)
;
; G_MUTE_ASSIGN_FIELD: cursor/field index. Stock has three at x=37h: pad
; (y=0Bh), two mute-off notes (y=1Eh, y=27h) at entry +0Bh/+0Ch. Group
; adds FOURTH field at y=15h. Field order matches screen top-to-bottom:
; 0=pad, 1=group, 2=first mute-off, 3=second. Text1 compare chain
; renumbered to match.
;
; Equate avoids CS override (data.asm label is CS-typed to ASL).
MG_FIELD                        equ     G_MUTE_ASSIGN_FIELD
MG_FIELD_MAX                    equ     3               ; stock's DOWN/RIGHT clamp is 2
MG_MAX                          equ     15              ; the engine's MIN is a hardcoded 0
MG_T1_ARM_RET                   equ     X_06279+0ah          ; `pop si / ret` past the 0A2h cursor width
MG_T1_SLOT1                     equ     L_0626E          ; arm "Mutes off:" one -- stock's field 1,
MG_T2_CHOKE_RET                 equ     br_026F3          ; where the displaced mute-off block fell
MG_T2_RELEASE                   equ     voice_release_by_note          ; voice_release_by_note(note), retf 2: kills

; Layout: XL's as far as 2K's frozen item list allows.
; Row y=15h: group label "Mute group:", eleven chars from x=13h to 55h.
; Stock item list carries label; value drawn at x=58h (MG_VAL_X) by paint handler,
; leaving half-cell air. Two "Mutes off:" notes below show only "Note:" labels
; (as on XL). Same label, same value position in both machines.
MG_VAL_X                        equ     058h            ; two digits, 88..99
MG_ROW_Y                        equ     015h
MG_VAL_CHARS                    equ     2               ; ZS_T2_FIELD_REG stores (n+1-1)*6 px at
                                        ; WIN_FIELD_BOX_W, so pass MG_VAL_CHARS+1
