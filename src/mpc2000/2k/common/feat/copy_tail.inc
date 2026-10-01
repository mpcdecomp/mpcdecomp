; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; COPY_NOTE_PARAMS -- DATA-segment tail: an F2 PARAMS soft key on the Copy Note
; Parameters window.  copies the source pad's note parameters onto the destination
; pad but leaves that pad's sound assignment alone (stock's DO IT copies the whole
; 29-byte entry, sound pointer included).  when source and destination select the
; same pad, copies onto every pad of the destination program instead.
;
; hooked entirely from DATA: the window's 32h repaint entry in its inherited
; handler table is repointed here, and cp_paint registers the F2 handler with
; install_handler, which merges onto the live screen.  no free slot needed in that
; table, nothing in TEXT1/TEXT2 touched, no fixed address -- this block just
; follows whatever else the tail holds.

        PIN0_MIN FEAT_TAIL

; handler 32h: stock repaint, soft key, label, notice
; runs item list (disp_list_run) + four value fields (TEXT2 62E8h/3992h)
; ZS_DS immed (not cx): non-leaf clobbers cx; runtime-built, not in MZ table
cp_repaint:
        push    ds
        mov     cx, ZS_DS
        mov     ds, cx
        call    cp_paint
        pop     ds
        retf

; the repaint proper (near), DS = CS = ZS_DS
; tail entered far DATA; separate from cp_repaint (F2 repaints through too)
; stock handler redraws from item list (clears PARAMS key, notice)
; install_handler (TEXT2 05C2h) takes ONE {key, far handler}
; builds two-slot table on stack, merges; no terminator/slot at DATA:2A5Ch
; ten stock sites, L_06834 among them
cp_paint:
        callf   ZS_T2S:CP_T2_REPAINT
        push    CP_KEY_PARAMS
        push    word ZS_DS
        push    cp_params
        callf   ZS_T2S:ZS_T2_INSTALL_KEY
        push    word ZS_DS
        push    cp_items
        callf   ZS_T1S:ZS_T1_INT2E
        mov     al, byte ptr [G_COPY_SRC_PGM]
        cmp     al, byte ptr [G_COPY_DST_PGM]
        jne     cpr_done
        mov     al, byte ptr [G_COPY_SRC_NOTE]
        cmp     al, byte ptr [G_COPY_DST_NOTE]
        jne     cpr_done
        push    word ZS_DS
        push    cp_notice
        callf   ZS_T1S:ZS_T1_INT2E
cpr_done:
        callf   ZS_T2S:ZS_T2_REFRESH
        ret

; table code 03h = F2.  one pad, or all 64 when the same pad is selected twice.
cp_params:
        push    ds
        push    si
        push    di
        push    es
        mov     cx, ZS_DS
        mov     ds, cx
        mov     al, byte ptr [G_COPY_DST_NOTE]
        mov     byte ptr [cp_note], al
        mov     byte ptr [cp_last], al
        mov     al, byte ptr [G_COPY_SRC_PGM]
        cmp     al, byte ptr [G_COPY_DST_PGM]
        jne     cpp_loop
        mov     al, byte ptr [G_COPY_SRC_NOTE]
        cmp     al, byte ptr [G_COPY_DST_NOTE]
        jne     cpp_loop
        mov     byte ptr [cp_note], PGM_NOTE_BASE
        mov     byte ptr [cp_last], PGM_NOTE_MAX
cpp_loop:
        call    cp_one_pad
        inc     byte ptr [cp_note]
        mov     al, byte ptr [cp_note]
        cmp     al, byte ptr [cp_last]
        jbe     cpp_loop
        call    cp_paint                ; not the stock repaint: that would drop
        pop     es                      ;   the PARAMS key and the notice
        pop     di
        pop     si
        pop     ds
        retf

; copy source pad note parameters to destination program note [cp_note]
; byte-for-byte TEXT2 0674Bh: 29-byte pad + second per-note array 6 bytes
; omit window close (unlike DO IT); preserve destination sound pointer (+0..3)
cp_one_pad:
        call    cp_dst_entry            ; es:di = the destination pad entry
        mov     ax, word ptr es:[di+PGM_PAD_SND]
        mov     word ptr [cp_save], ax
        mov     ax, word ptr es:[di+PGM_PAD_SND+2]
        mov     word ptr [cp_save+2], ax

        mov     al, byte ptr [G_COPY_SRC_PGM]
        call    cp_prog_ptr             ; dx:si = the source program record
        mov     al, PGM_PAD_STRIDE
        mul     byte ptr [G_COPY_SRC_NOTE]
        add     si, ax
        sub     si, PGM_PAD_BIAS
        push    ds
        mov     cx, 00eh
        mov     ds, dx
        rep     movsw
        movsb                           ; 1Dh bytes, as DO IT copies
        pop     ds

        call    cp_dst_entry
        mov     ax, word ptr [cp_save]
        mov     word ptr es:[di+PGM_PAD_SND], ax
        mov     ax, word ptr [cp_save+2]
        mov     word ptr es:[di+PGM_PAD_SND+2], ax

; the second per-note array DO IT also copies, six bytes at +068Ch.
        mov     al, byte ptr [G_COPY_DST_PGM]
        call    cp_prog_ptr
        mov     es, dx
        mov     al, 6
        mul     byte ptr [cp_note]
        add     si, ax
        lea     di, [si+PGM_NOTE6]
        mov     al, byte ptr [G_COPY_SRC_PGM]
        call    cp_prog_ptr
        mov     al, 6
        mul     byte ptr [G_COPY_SRC_NOTE]
        add     si, ax
        add     si, PGM_NOTE6
        push    ds
        mov     cx, 3
        mov     ds, dx
        rep     movsw
        pop     ds

; mute group not in pad entry; handled separately via mg_pgm
; mg_fetch/mg_store use mg_pgm to select source/dest programs
; works even if neither is the current program
        ifdef   MUTE_GROUPS
        mov     al, byte ptr [G_COPY_SRC_PGM]
        mov     byte ptr [mg_pgm], al
        mov     al, byte ptr [G_COPY_SRC_NOTE]
        call    mg_fetch
        mov     cl, al
        mov     al, byte ptr [G_COPY_DST_PGM]
        mov     byte ptr [mg_pgm], al
        mov     al, byte ptr [cp_note]
        call    mg_store
        endif
        ret

; al = program slot -> dx:si = its record.  clobbers ax, bx.
cp_prog_ptr:
        sub     ah, ah
        add     ax, ax
        add     ax, ax
        mov     bx, ax
        mov     si, word ptr [bx+PGM_TABLE]
        mov     dx, word ptr [bx+PGM_TABLE+2]
        ret

; es:di = the destination program's pad entry for note [cp_note].
cp_dst_entry:
        mov     al, byte ptr [G_COPY_DST_PGM]
        call    cp_prog_ptr
        mov     es, dx
        mov     di, si
        mov     al, PGM_PAD_STRIDE
        mul     byte ptr [cp_note]
        add     di, ax
        sub     di, PGM_PAD_BIAS
        ret

; draw lists (disp_list_run): 'all pads' notice and F2 soft key
; each: one WIN_* item + 00h terminator
cp_notice:
        WIN_LABEL CP_NOTICE_X, CP_NOTICE_Y, "PARAMS=ALL pads"
        WIN_END

cp_items:
        WIN_SOFTKEY CP_FKEY, SK_BOX, "PARAMS"
        WIN_END

cp_note:
        db      000h                    ; the destination note being written
cp_last:
        db      000h                    ; the last one to write
cp_save:
        db      004h dup (00h)          ; the destination pad's own sound pointer
