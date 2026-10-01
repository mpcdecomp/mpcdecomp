; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; MUTE_GROUPS -- note-choke hook, 95 bytes in place over 0x381C2-0x38220,
; overwriting the stock "choke the two Mutes-off notes" block of the note-on
; handler at 0x380AC.  chokes mute-off note 1, then every pad in the same mute
; group.
; stock (0x381C2-0x38221, 96 bytes) is the same block twice, once per mute-off
; note: range-check [bp+0Ah] against 23h..62h, skip if it equals es:[bx+3] (the
; triggering note), else call 038326h voice-scan-and-kill(prog, note); then the
; identical block for [bp+0Ch]; falls through to 0x38222.

; [bp+6]   far ptr to the note event record; ES:BX+2 = program, +3 = note
; [bp+0Ah] a 16-bit scratch (stock: mute-off note 1)
; [bp+0Ch] the triggering pad's group (stock: mute-off note 2)
; [bp+0Dh] mute-off note 1, from the 0x3906C / 0x390F6 caller patches
mg_choke:
        mov     al, [bp+0dh]            ; the one explicit "Mutes off:" note
        call    mg_kill
        les     bx, [bp+6]
        mov     ax, es:[bx+2]           ; AL = program, AH = triggering note
        db      088h, 0e2h              ; mov dl, ah  (88 E2, d=0 form)
        mov     ah, 040h
        mul     ah                      ; AX = program * 64
        sub     ax, 023h
        mov     [bp+0ah], ax            ; group-table row base for this program
        mov     ax, MG_GROUP_SEG
        mov     es, ax                  ; ES = mute-group table segment
        mov     bx, [bp+0ah]
        xor.d0  dh, dh
        add.d0  bx, dx                  ; + triggering note
        mov     al, es:[bx]
        or      al, al
        je      mgc_done                 ; group 0 = ungrouped, nothing to do
        mov     [bp+0ch], al            ; the triggering pad's group
        mov     di, 023h
mgc_scan:
        mov     bx, [bp+0ah]
        add.d0  bx, di
        mov     al, es:[bx]
        cmp     al, [bp+0ch]
        jne     mgc_next
        mov     ax, di
        call    mg_kill
mgc_next:
        inc     di
        cmp     di, 062h
        jbe     mgc_scan
mgc_done:
        jmp     br_38222                ; rejoin the stock handler

; choke note AL unless out of pad range or the triggering note.  tail-jumps to
; mg_kill_tail, which does the push/call/pop and returns to the caller.
mg_kill:
        cmp     al, 023h
        jb      mgk_out
        push    es
        les     bx, [bp+6]
        cmp     es:[bx+3], al
        je      mgk_pop
        jmp     mg_kill_tail            ; does the ret
mgk_pop:
        pop     es
mgk_out:
        ret

; 95 bytes of code, but the stock `add sp,4` at 0x3821F runs one byte further,
; so the span is 96 and its tail byte is re-emitted.
        db      004h
