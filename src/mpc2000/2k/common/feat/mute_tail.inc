; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; MUTE_GROUPS -- DATA-segment tail: a fourth MUTE ASSIGN field, and a note-on
; choke that silences every pad sharing the triggering pad's group.
;
; the group is NOT a byte of the pad entry: it lives in mg_table, one nibble per
; (program slot, note).  so nothing in the 29-byte entry has to be free and both
; stock "Mutes off:" notes keep working untouched.  groups are RAM-only -- a .PGM
; saved by this build carries no group.
;
; four in-place hooks, all size-neutral, in mute_hooks.inc: the cursor's compare
; chain, renumbered so the group is field 1 and reached in screen order; the
; repaint's closing display flush; the DOWN/RIGHT clamp, one byte; and
; voice_start's second mute-off slot.

        PIN0_MIN MG_CODE

; fixed entry table.  must stay first, in this order.
mg_entry_table:
        ASSERT_AT MG_ENTRY_DISPATCH
        jmp     mg_dispatch
        PIN     MG_ENTRY_PAINT
        ASSERT_AT MG_ENTRY_PAINT
        jmp     mg_paint
        PIN     MG_ENTRY_CHOKE
        ASSERT_AT MG_ENTRY_CHOKE
        jmp     mg_choke

; group field, slot 1, from dispatcher compare chain tail at text1 0624Fh.
; ax = [210Eh] - 3, index 1 -> -2. out of range: stock fallback "Mutes off:"
; (index 2 after renumbering). si/dx: pad entry, unused.
mg_dispatch:
        add     ax, 2
        je      mgd_arm
        mov     byte ptr [MG_FIELD], 2
        jmpf    ZS_T1S:MG_T1_SLOT1
mgd_arm:
        call    mg_own
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        call    mg_fetch
        mov     byte ptr [mg_edit], al
        call    mg_draw                 ; arming redraws value; stock fields do; see mg_draw
        push    word ZS_DS
        push    mg_edit
        push    MG_MAX
        push    MG_VAL_X
        push    MG_ROW_Y
        push    MG_VAL_CHARS+1
        push    word ZS_DS
        push    word mg_commit
        callf   ZS_T2S:ZS_T2_FIELD_REG
        jmpf    ZS_T1S:MG_T1_ARM_RET

; jog engine wrote mg_edit; fold into table. far-called via callback
; pointer, no operand to pop.
mg_commit:
        push    ax
        push    bx
        push    cx
        push    dx
        call    mg_own
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        mov     cl, byte ptr [mg_edit]
        call    mg_store
        pop     dx
        pop     cx
        pop     bx
        pop     ax
        retf

; replaces repaint's closing `callf TEXT2_SEG:02DF0h` at text1 063BAh.
; draws 4th field, flushes. LABEL: window caption (data.asm), not drawn
; here. es reload from [bp-6]; si/bp continue in use, preserved.
mg_paint:
        call    mg_draw
        callf   ZS_T2S:ZS_T2_REFRESH    ; the flush this hook displaced
        retf

; draw current pad's group at (MG_VAL_X, MG_ROW_Y). near, DS = CS = ZS_DS,
; saves all regs (callers reuse). two callers: repaint, pad_note_select_4
; (key 37h, text1 062B2h). stock redraw on arm (mg_draw); group must too or
; digits stay on prior pad.
mg_draw:
        push    ax
        push    bx
        push    cx
        push    dx
        push    si
        push    di
        push    es
        call    mg_own
        mov     al, byte ptr [G_PAD_NOTE_BASE]
        call    mg_fetch
        call    mg_format
        push    MG_VAL_X
        push    MG_ROW_Y
        push    ds
        push    mg_buf
        callf   ZS_T2S:ZS_T2_STR_DRAW
        pop     es
        pop     di
        pop     si
        pop     dx
        pop     cx
        pop     bx
        pop     ax
        ret

; note-on choke. replaces 19 bytes at text2 026E0h (voice_start's 2nd
; "Mutes off:" block), same entry conditions, reproduces, kills other pads
; in group. SS:BP = voice_start frame, DS = DATA, [bp+6] = mute-off note 2,
; [bp+0Ah] = triggering note.
mg_choke:
        mov     ax, word ptr [bp+6]     ; stock: choke mute-off note 2
        sub     ax, 023h
        cmp     ax, 03fh
        ja      mgc_group
        mov     ax, word ptr [bp+6]
        call    mg_kill
mgc_group:
        call    mg_own
        mov     al, byte ptr [bp+0ah]
        mov     byte ptr [mg_note], al
        call    mg_fetch
        or      al, al
        jz      mgc_done                ; group 0 = ungrouped
        mov     byte ptr [mg_grp], al
        mov     byte ptr [mg_scan], PGM_NOTE_BASE
mgc_scan:
        mov     al, byte ptr [mg_scan]
        cmp     al, byte ptr [mg_note]
        je      mgc_next
        call    mg_fetch
        cmp     al, byte ptr [mg_grp]
        jne     mgc_next
        mov     al, byte ptr [mg_scan]
        sub     ah, ah
        call    mg_kill
mgc_next:
        inc     byte ptr [mg_scan]
        cmp     byte ptr [mg_scan], PGM_NOTE_MAX
        jbe     mgc_scan
mgc_done:
        jmpf    ZS_T2S:MG_T2_CHOKE_RET

; ax = note. synthesized far call to voice_release_by_note: stock pattern
; `push arg / push cs / call near`, ends `retf 2`; segment push builds same
; frame.
mg_kill:
        push    ax
        push    word ZS_DS
        push    word mg_kill_back
        jmpf    ZS_T2S:MG_T2_RELEASE
mg_kill_back:
        ret

; mg_table: 24 program slots x 64 pads, 4 bits each = 300h bytes. group
; 0..15 in nibble; byte each = 600h (not in DATA tail; ceiling in defs.inc).
; all-zero at power-on: every pad ungrouped.

; point mg_fetch/mg_store at the current program.  clobbers cl.
mg_own:
        mov     cl, byte ptr [PGM_SLOT]
        mov     byte ptr [mg_pgm], cl
        ret

; al = note 23h..62h -> bx = table byte, cl = 0 (low nibble) or 1 (high).
; reads mg_pgm (every caller sets first). clobbers ax, bx, cl.
mg_slot:
        sub     al, PGM_NOTE_BASE
        sub     ah, ah
        mov     bl, byte ptr [mg_pgm]
        sub     bh, bh
        mov     cl, 6
        shl     bx, cl                  ; * 64 pads per program
        add     bx, ax
        mov     cl, bl
        and     cl, 1
        shr     bx, 1
        add     bx, mg_table
        ret

; al = note -> al = group 0..15. reads mg_pgm; caller picks program (mg_own
; -> current). clobbers ax, bx, cl.
mg_fetch:
        call    mg_slot
        mov     al, byte ptr [bx]
        or      cl, cl
        jz      mgf_low
        mov     cl, 4
        shr     al, cl
        ret
mgf_low:
        and     al, 00fh
        ret

; al = note, cl = group -> stored.  same mg_pgm contract as mg_fetch.
; clobbers ax, bx, cx, dl.
mg_store:
        mov     dl, cl
        and     dl, 00fh
        call    mg_slot
        mov     al, byte ptr [bx]
        or      cl, cl
        jz      mgs_low
        and     al, 00fh
        mov     cl, 4
        shl     dl, cl
        or      al, dl
        mov     byte ptr [bx], al
        ret
mgs_low:
        and     al, 0f0h
        or      al, dl
        mov     byte ptr [bx], al
        ret

; al = group 0..15 -> mg_buf, 2 chars, right-aligned like every two-digit
; field, string. not note-number renderer (formats MIDI note, not plain
; integer).
mg_format:
        sub     ah, ah
        mov     cl, 10
        div     cl                      ; al = tens, ah = units
        add     ah, 030h
        mov     byte ptr [mg_buf+1], ah
        or      al, al
        jz      mgfm_blank
        add     al, 030h
        jmp     mgfm_put
mgfm_blank:
        mov     al, 020h                ; blank, so 15 -> 9 leaves no stale digit
mgfm_put:
        mov     byte ptr [mg_buf], al
        ret

mg_buf:
        db      "  ", 0

mg_table:
        db      300h dup (00h)
mg_pgm:
        db      000h                    ; whose groups mg_slot is looking at
mg_edit:
        db      000h                    ; the jog field's own byte
mg_grp:
        db      000h                    ; the triggering pad's group, across the
mg_note:
        db      000h                    ; kill calls, which clobber freely
mg_scan:
        db      000h
