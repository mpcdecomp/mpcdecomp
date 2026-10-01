; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; ZONE_SLICE -- DATA-segment tail: all port code, its strings, its state block.
; TEXT1/TEXT2 carry only in-place, size-preserving hooks.
; every entry path runs CS = DS = DATA, as for the TEXT1/TEXT2 code each hook
; took over.  calls back into TEXT1 go through ZS_T1CALL_PRE/GO; returns into
; TEXT1/TEXT2 paths are far jumps.

SND_LOOPLEN     equ     SND_LOOP
SND_LOOPON      equ     SND_FIELD_24

        PIN0    ZS_TAIL_CODE

; fixed entry table.  must stay first, in this order.
zs_entry_table:
        ASSERT_AT ZS_ENTRY_SLOT_ZONE
        jmp     zs_slot_zone
        PIN     ZS_ENTRY_EXT_DISPATCH   ; ASL picks the 2-byte short form here
        ASSERT_AT ZS_ENTRY_EXT_DISPATCH
        jmp     zs_ext_dispatch
        PIN     ZS_ENTRY_EDIT_TEXT
        ASSERT_AT ZS_ENTRY_EDIT_TEXT
        jmp     zs_edit_text

; hook A tail: znEDIT slot 4 (Zone: index). reads ZONE_COUNT (not
; fixed 16), read-only at registration; engine re-registers on cursor move.
zs_slot_zone:
        mov     al, byte ptr [ZONE_COUNT]
        or      al, al                  ; a never-touched count behaves as 1
        jnz     zsz_have_count
        mov     al, 1
zsz_have_count:
        cmp     al, 16                  ; array-capacity clamp, as elsewhere
        jbe     zsz_count_ok            ; in the tail
        mov     al, 16
zsz_count_ok:
        sub     ah, ah
        cmp     byte ptr [ZONE_INDEX], 1   ; a power-on 0 would display as "0"
        jae     zsz_index_ok               ; until the first wheel click
        mov     byte ptr [ZONE_INDEX], 1
zsz_index_ok:
        push    ds
        push    ZONE_INDEX
        push    ax                      ; MAX = ZONE_COUNT, zones are 1..N
        push    ZS_ZIDX_VAL_X           ; x before y, L_090F4's convention
        push    ZS_ZIDX_ROW_Y
        push    3                       ; cursor box = 2 characters
        push    word ZS_DS
        push    word zone_index_commit
        callf   ZS_T2S:ZS_T2_FIELD_REG
        push    word ZS_DS              ; real OPEN WINDOW handler; stock's
        push    word zs_zwin_open       ; View: arm passes a null
        callf   ZS_T2S:ZS_T2_OPENWIN_REG
        jmpf    ZS_T1S:ZS_TEXT1_RET

; Number of Zones pop-up (OPEN WINDOW on Zone: field), modelled on stock
; Zone edit: same frame, labels, prompts, CLOSE/DO IT, {34h,37h} refresh,
; close jmp to znEDIT entry. format:
; item list:   22h x y w h <title> 00     window frame, centred title
;              1Ah key style <label> 00   soft key, key = raw button code
;              02h                        separator before static text
;              07h x y <text> 00          static text at a pixel position
;              00h                        end
; handler tbl: 01h 0000 0000              clear the live table first
;              code off seg               one handler, code = raw key + 1
;              00h                        end

; OPEN WINDOW handler: far-called (DS undefined); matches stock St:-field at
; TEXT1:07DF4h exactly
zs_zwin_open:
        push    ds
        mov     cx, ZS_DS
        mov     ds, cx
        mov     al, byte ptr [ZONE_COUNT]
        or      al, al                  ; the window must not offer 0
        jnz     zzo_have
        mov     al, 1
        mov     byte ptr [ZONE_COUNT], al
zzo_have:
        mov     byte ptr [ZWIN_SAVE_COUNT], al  ; so CLOSE can abandon the edit
        push    cx                      ; descriptor segment
        push    zs_zwin_desc
        callf   ZS_T1S:ZS_T1_INT30
        mov     byte ptr [ZS_FIELD_INDEX], 0    ; shared window field index
        call    zs_zwin_arm
        pop     ds
        retf

; window's single jog field: bound 16, engine MIN hardcoded 0, documented
; minimum 1 enforced in zone_count_apply. engine fires callback only on real
; change: field never shows 0, dialling below 1 sticks at 1.
zs_zwin_arm:
        push    ds
        push    ZONE_COUNT
        push    16
        push    ZS_ZWIN_VAL_X
        push    ZS_ZWIN_VAL_Y
        push    3
        push    word ZS_DS
        push    word zone_count_commit
        callf   ZS_T2S:ZS_T2_FIELD_REG
        ret

; repaint (table code 32h): draws item list, then count from ZS_NUM_STRINGS.
; can't use display_draw_coord (fixed 8-char field, right-aligned; won't fit).
zs_zwin_paint:
        push    ds
        mov     cx, ZS_DS
        mov     ds, cx
        push    cx
        push    zs_zwin_items
        callf   ZS_T1S:ZS_T1_INT2E
        mov     al, byte ptr [ZONE_COUNT]
        or      al, al
        jnz     zzp_nonzero
        mov     al, 1
zzp_nonzero:
        cmp     al, 16
        jbe     zzp_ok
        mov     al, 16
zzp_ok:
        sub     ah, ah
        mov     cx, ax
        add     ax, ax
        add     ax, cx
        add     ax, ax                  ; value * ZS_NUM_STRIDE
        add     ax, ZS_NUM_STRINGS
        push    ZS_ZWIN_VAL_X
        push    ZS_ZWIN_VAL_Y
        push    ds
        push    ax
        callf   ZS_T2S:ZS_T2_STR_DRAW
        callf   ZS_T2S:ZS_T2_REFRESH
        pop     ds
        retf

; DO IT [F5] (code 06h): re-applies division (jog callback re-divides per
; click), returns to ZONE screen.
zs_zwin_doit:
        push    ds
        mov     cx, ZS_DS
        mov     ds, cx
        call    zone_count_apply
        pop     ds
        jmpf    ZS_T1S:ZS_T1_ZNEDIT_ENTRY

; CLOSE [F4] (code 05h) and OPEN WINDOW again (15h): restores count window
; opened with. jog field commits live; restore distinguishes CLOSE from DO IT.
zs_zwin_close:
        push    ds
        mov     cx, ZS_DS
        mov     ds, cx
        mov     al, byte ptr [ZWIN_SAVE_COUNT]
        cmp     al, byte ptr [ZONE_COUNT]
        je      zzc_unchanged
        mov     byte ptr [ZONE_COUNT], al
        call    zone_count_apply
zzc_unchanged:
        pop     ds
        jmpf    ZS_T1S:ZS_T1_ZNEDIT_ENTRY

zs_zwin_items:
        WIN_CONFIRM "Number of Zones"
        WIN_SOFTKEY 4, SK_FILL, "CLOSE" ; stock "escape" style
        WIN_SOFTKEY 5, SK_BOX, "DO IT"  ; as stock's Zone edit window
        WIN_RESET_PEN
        WIN_LABEL ZS_ZWIN_LBL_X, ZS_ZWIN_LBL_Y, "Number of zones:"
        WIN_LABEL ZS_ZWIN_TXT_X, ZS_ZWIN_TXT_Y1, "Pressing DO IT will reset"
        WIN_LABEL ZS_ZWIN_TXT_X, ZS_ZWIN_TXT_Y2, "St/End values."
        WIN_END

; leading 01h/null entry clears znEDIT's table: no key leakage into pop-up.
; segment words here are post-relocation (new pointers), not listed in
; relocation table.
zs_zwin_desc:
        WIN_KEY_CLEAR
        WIN_KEY WIN_K_PAINT, ZS_DS, zs_zwin_paint
        WIN_KEY WIN_K_F4, ZS_DS, zs_zwin_close
        WIN_KEY WIN_K_F5, ZS_DS, zs_zwin_doit
        WIN_KEY WIN_K_OPEN, ZS_DS, zs_zwin_close        ; OPEN WINDOW again = close
        WIN_KEY WIN_K_REFRESH, ZS_T2S, ZS_T2_SND_REFRESH1 ; sound-change refresh pair, as
        WIN_KEY WIN_K_PAD, ZS_T2S, ZS_T2_SND_REFRESH2     ; every stock descriptor carries
        db      000h                    ; a zero key ends the scan

; hook C tail: EDIT-mode zone action dispatcher.
; ax = action index - 4.  stock tail plus actions 5/6/7.
zs_ext_dispatch:
        or      ax, ax
        jne     zsx_not4
        jmpf    ZS_T1S:ZS_T1_REVERSE    ; 4: REVERSE ZONE, stock body
zsx_not4:
        dec     ax
        je      zs_slice_case           ; 5: SOUND->ZONE SLICE
        dec     ax
        je      zsx_discard_stub        ; 6: DISCARD
        dec     ax
        je      zsx_loop_stub           ; 7: LOOP FROM ST TO END
        jmpf    ZS_T1S:ZS_T1_ACT_BAD    ; anything else: stock error path

; Jcc range is +/-127 bytes and both bodies sit further down, so bounce through
; near jumps.
zsx_discard_stub:
        jmp     zone_action_discard_case
zsx_loop_stub:
        jmp     zone_action_loop_case

zs_slice_case:
        call    zone_action_slice_impl  ; ax = 1 ok / 0 failed
        mov     si, ax                  ; the epilogue shows an error dialog when
        jmpf    ZS_T1S:ZS_T1_ACT_DONE2  ; si == 0

; SOUND->ZONE SLICE: divides [G_ZONE_START,G_ZONE_END) into ZONE_COUNT
; zones, creates sample per zone through stock ZONE->NEW SAMPLE primitive.
; end of each copy extended by ZAS_END_MARGIN (clamped to outer End)
; preserves pad envelope decay. names each "<basename><n>", restores outer
; Start/End and name buffer.
;
; slices current ZONE_BOUNDARY (last count change's equal division plus
; manual Zone:/St:/End: edits), not live scalars. equal re-division tied
; to zone count change, not slicing. never-touched count: ZONE_BOUNDARY may
; be empty, falls back to live scalars.
zone_action_slice_impl:
        push    ax
        push    bx
        push    cx
        push    dx

        mov     ax, word ptr [SND_CURRENT]         ; no sound: nothing to
        or      ax, word ptr [SND_CURRENT+2]       ; slice, and both the
        jne     zas_have_sound                          ; name copy and the
        pop     dx                                      ; primitive would
        pop     cx                                      ; dereference a null
        pop     bx
        pop     ax
        xor     ax, ax                  ; 0 -> the epilogue's error dialog
        ret
zas_have_sound:
        ; ZAS_PGM_SLOT set early so all paths (including error) can derive return
        ; value from it, skipping program_select.
        mov     byte ptr [ZAS_PGM_SLOT], 0ffh

        push    si
        push    di
        mov     ax, ds
        mov     es, ax
        mov     si, ZONE_NAME_BUF
        mov     di, ZAS_NAMESAVE
        mov     cx, 29
        rep movsw
        pop     di
        pop     si

        ; base name from SOUND, not pre-filled ZONE_NAME_BUF (which adds 'z',
        ; default). snapshotted once to prevent compound suffixes when primitive
        ; repoints [SND_CURRENT].
        push    si
        push    di
        push    es
        les     si, [SND_CURRENT]  ; name field is at +0
        mov     di, ZAS_BASENAME
        mov     cx, 16
zas_bn_copy:
        mov     al, byte ptr es:[si]
        or      al, al
        jz      zas_bn_copied
        mov     byte ptr [di], al
        inc     si
        inc     di
        dec     cx
        jnz     zas_bn_copy
zas_bn_copied:
        ; Akai names are space-padded to 16; trim before suffixing.
zas_bn_trim:
        cmp     di, ZAS_BASENAME
        jbe     zas_bn_trimmed
        cmp     byte ptr [di-1], 20h
        jne     zas_bn_trimmed
        dec     di
        jmp     zas_bn_trim
zas_bn_trimmed:
        mov     byte ptr [di], 0
        pop     es
        pop     di
        pop     si

        mov     cl, byte ptr [ZONE_COUNT]
        cmp     cl, 16                  ; a raw count > 16 would read
        jbe     zas_cl_ok               ; ZONE_BOUNDARY past its 17 entries and
        mov     cl, 16                  ; hand adjacent DATA to the primitive
zas_cl_ok:
        cmp     cl, 2
        jae     zas_from_table
        ; count < 2: no-op, save live scalars directly. ZONE_BOUNDARY may never have
        ; been populated.
        mov     ax, word ptr [G_ZONE_START]
        mov     dx, word ptr [G_ZONE_START+2]
        mov     word ptr [ZAS_STARTSAVE], ax
        mov     word ptr [ZAS_STARTSAVE+2], dx
        mov     ax, word ptr [G_ZONE_END]
        mov     dx, word ptr [G_ZONE_END+2]
        mov     word ptr [ZAS_ENDSAVE], ax
        mov     word ptr [ZAS_ENDSAVE+2], dx
        jmp     zas_restore

zas_from_table:
        ; flush live scalars to selected zone: zone_index_commit only flushes on
        ; index change, so St:/End: edits without Zone: change would be lost.
        call    zone_store_current_zone
        ; outer bounds for the end-margin clamp are ZONE_BOUNDARY[0] and [cl],
        ; not the live scalars, which may hold a sub-zone.
        mov     ax, word ptr [ZONE_BOUNDARY]
        mov     dx, word ptr [ZONE_BOUNDARY+2]
        mov     word ptr [ZAS_STARTSAVE], ax
        mov     word ptr [ZAS_STARTSAVE+2], dx
        xor     bh, bh
        mov     bl, cl
        shl     bx, 2
        mov     ax, word ptr [bx+ZONE_BOUNDARY]
        mov     dx, word ptr [bx+ZONE_BOUNDARY+2]
        mov     word ptr [ZAS_ENDSAVE], ax
        mov     word ptr [ZAS_ENDSAVE+2], dx
zas_have2plus:
        ; one sample per zone INCLUDING last: cl = ZONE_COUNT (not -1).
        ; ZONE_BOUNDARY holds 17 points, final [bx+4] in range. zone suffix can
        ; be two digits.
        mov     byte ptr [ZAS_LOOPCNT], cl
        mov     byte ptr [ZAS_ZONEIDX], 0

        ; early failure is clean no-op: stock error dialog one line, can't report
        ; partial result.
        cmp     byte ptr [ZAS_MAKE_PGM], 0
        je      zas_loop2
        call    zone_program_create     ; sets ZAS_PGM_SLOT, 0FEh on failure
        cmp     byte ptr [ZAS_PGM_SLOT], 0feh
        jne     zas_loop2
        jmp     zas_restore             ; 0FEh -> 0; ZS_SYS_ERRNO set

zas_loop2:
        mov     al, byte ptr [ZAS_ZONEIDX]
        cmp     al, byte ptr [ZAS_LOOPCNT]
        jb      zas_notdone
        jmp     zas_restore
zas_notdone:
        xor     bh, bh
        mov     bl, al
        shl     bx, 2
        mov     ax, word ptr [bx+ZONE_BOUNDARY]
        mov     dx, word ptr [bx+ZONE_BOUNDARY+2]
        mov     word ptr [G_ZONE_START], ax
        mov     word ptr [G_ZONE_START+2], dx
        mov     ax, word ptr [bx+4+ZONE_BOUNDARY]
        mov     dx, word ptr [bx+4+ZONE_BOUNDARY+2]
        mov     cl, byte ptr [ZAS_END_MARGIN]
        xor     ch, ch                  ; cx is free: it last held ZONE_COUNT,
        add     ax, cx                  ; now in ZAS_LOOPCNT
        adc     dx, 0
        cmp     dx, word ptr [ZAS_ENDSAVE+2]
        jb      zas_nc
        ja      zas_clamp
        cmp     ax, word ptr [ZAS_ENDSAVE]
        jbe     zas_nc
zas_clamp:
        mov     ax, word ptr [ZAS_ENDSAVE]
        mov     dx, word ptr [ZAS_ENDSAVE+2]
zas_nc:
        mov     word ptr [G_ZONE_END], ax
        mov     word ptr [G_ZONE_END+2], dx

        ; this slice's name: snapshot + 1-based number. capped to fit 16 (buffer
        ; is 17-byte slot of stride-11h table; name + 2-digit suffix would
        ; overflow into next slot).
        push    si
        push    di
        mov     bl, 15                  ; longest base for a 1-digit suffix
        mov     al, byte ptr [ZAS_ZONEIDX]
        inc     al                      ; 1-based, 1..16
        cmp     al, 10
        jb      zas_maxbase_ok
        dec     bl                      ; two digits -> one fewer base char
zas_maxbase_ok:
        xor     bh, bh
        push    ax                      ; zas_byte_to_ascii wants it in al
        mov     si, ZAS_BASENAME
        mov     di, ZONE_NAME_BUF
        mov     cx, bx
zas_nm_copy:
        mov     al, byte ptr [si]
        or      al, al
        jz      zas_nm_copied
        mov     byte ptr [di], al
        inc     si
        inc     di
        dec     cx
        jnz     zas_nm_copy
zas_nm_copied:
        pop     ax
        call    zas_byte_to_ascii
        mov     byte ptr [di], 0
        pop     di
        pop     si

        ZS_T1CALL_PRE zas_after_new_sample
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        push    word ptr [G_ZONE_START+2]
        push    word ptr [G_ZONE_START]
        push    word ptr [G_ZONE_END+2]
        push    word ptr [G_ZONE_END]
        push    ds
        push    ZONE_NAME_BUF
        ZS_T1CALL_GO ZS_T1_NEW_SAMPLE
zas_after_new_sample:
        ; return 1 = sample created, 0 = failed (no memory or directory entry).
        ; assign pad only on success; failure keeps previous slice as current.
        or      ax, ax
        je      zas_next_zone
        cmp     byte ptr [ZAS_PGM_SLOT], PGM_TABLE_N
        jae     zas_next_zone           ; covers "not asked for" and "failed"
        mov     al, byte ptr [ZAS_ZONEIDX]
        cmp     al, PGM_PADS_PER_BANK
        jae     zas_next_zone           ; zones > pads: slices 17..N created but unassigned (no wrap onto bank B)
        call    zone_program_assign_pad ; al = pad index within bank A

zas_next_zone:
        inc     byte ptr [ZAS_ZONEIDX]
        jmp     zas_loop2

zas_restore:
        mov     ax, word ptr [ZAS_STARTSAVE]
        mov     dx, word ptr [ZAS_STARTSAVE+2]
        mov     word ptr [G_ZONE_START], ax
        mov     word ptr [G_ZONE_START+2], dx
        mov     ax, word ptr [ZAS_ENDSAVE]
        mov     dx, word ptr [ZAS_ENDSAVE+2]
        mov     word ptr [G_ZONE_END], ax
        mov     word ptr [G_ZONE_END+2], dx

        push    si
        push    di
        mov     ax, ds
        mov     es, ax
        mov     si, ZAS_NAMESAVE
        mov     di, ZONE_NAME_BUF
        mov     cx, 29
        rep movsw
        pop     di
        pop     si

        ; make new program current (like Create New Program DO IT does). pads
        ; invisible without it; program_alloc arena compaction may invalidate
        ; PGM_CURRENT pointer.
        cmp     byte ptr [ZAS_PGM_SLOT], PGM_TABLE_N
        jae     zas_no_select
        mov     al, byte ptr [ZAS_PGM_SLOT]
        xor     ah, ah
        push    ax
        callf   ZS_T2S:ZS_T2_PGM_SELECT
zas_no_select:

        pop     dx
        pop     cx
        pop     bx
        pop     ax

        ; count < 2 also lands here, reports success (one zone is no-op). one real
        ; failure: ZAS_PGM_SLOT == 0FEh returns 0 so epilogue shows ZS_SYS_ERRNO.
        mov     ax, 1
        cmp     byte ptr [ZAS_PGM_SLOT], 0feh
        jne     zas_ret
        xor     ax, ax
zas_ret:
        ret

; DX:AX / CX (nonzero) -> DX:AX.  clobbers BX.  both quotient halves fit CX: the
; dividend's high half is itself <= 0FFFFh.
zone_udiv32:
        push    bx
        push    ax
        mov     ax, dx
        xor     dx, dx
        div     cx
        mov     bx, ax
        pop     ax
        div     cx
        mov     dx, bx
        pop     bx
        ret

; AL = 0..99, DI = dest.  writes 1-2 ASCII digits, no leading zero, no
; terminator, advances DI.  clobbers AX, BX, DX.
zas_byte_to_ascii:
        xor     ah, ah
        mov     bl, 10
        div     bl
        or      al, al
        jz      zbta_onedigit
        add     al, 30h
        mov     byte ptr [di], al
        inc     di
zbta_onedigit:
        mov     al, ah
        add     al, 30h
        mov     byte ptr [di], al
        inc     di
        ret

; SLICE SOUND's Create new program wrapper. no args, sets ZAS_PGM_SLOT to
; slot created or 0FEh on error (ZS_SYS_ERRNO). preserves all registers.
; same three primitives, same order, as NEW [F3].
zone_program_create:
        push    ax
        push    bx
        push    cx
        push    dx
        push    si
        push    di
        push    es

        callf   ZS_T2S:ZS_T2_PGM_FREE_SLOT      ; ax = slot, or 0FFFFh
        cmp     ax, PGM_TABLE_N                 ; unsigned, so 0FFFFh fails too
        jae     zpc_full
        mov     byte ptr [ZAS_PGM_SLOT], al     ; stash before INT 38h compacts
        push    ax
        callf   ZS_T2S:ZS_T2_PGM_ALLOC          ; ax = 1 ok, 0 = no heap room
        or      ax, ax
        je      zpc_nomem

        ; rename after sliced sound: 16+NUL space-padded
        ; not strcpy; program_alloc default tail behind NUL
        ; .PGM would save uncovered portion
        mov     bl, byte ptr [ZAS_PGM_SLOT]
        xor     bh, bh
        shl     bx, 2
        les     di, [bx+PGM_TABLE]
        add     di, PGM_NAME
        mov     si, ZAS_BASENAME
        mov     cx, 16
zpc_name:
        mov     al, byte ptr [si]
        or      al, al
        jz      zpc_pad
        inc     si                      ; source stops at the NUL, so the rest
        jmp     zpc_put                 ; of the field is spaces
zpc_pad:
        mov     al, 20h
zpc_put:
        mov     byte ptr es:[di], al
        inc     di
        dec     cx
        jnz     zpc_name
        mov     byte ptr es:[di], 0
        jmp     zpc_done

zpc_full:
        mov     word ptr [ZS_SYS_ERRNO], ZS_ERR_PGM_FULL
        mov     byte ptr [ZAS_PGM_SLOT], 0feh
        jmp     zpc_done
zpc_nomem:
        mov     word ptr [ZS_SYS_ERRNO], ZS_ERR_NOMEM
        mov     byte ptr [ZAS_PGM_SLOT], 0feh

zpc_done:
        pop     es
        pop     di
        pop     si
        pop     dx
        pop     cx
        pop     bx
        pop     ax
        ret

; assign slice to pad in bank A (al = 0..15)
; far-pointer store; preserves all registers
zone_program_assign_pad:
        push    ax
        push    bx
        push    cx
        push    dx
        push    si
        push    di
        push    es

        mov     bl, byte ptr [ZAS_PGM_SLOT]
        xor     bh, bh
        shl     bx, 2
        les     bx, [bx+PGM_TABLE]      ; re-read per call: the arena compacts
        xor     ah, ah
        mov     si, ax
        add     si, PGM_PADMAP
        mov     al, byte ptr es:[bx+si] ; the note this pad plays
        cmp     al, PGM_NOTE_BASE
        jb      zpa_done                ; the map is user-editable, so this is a
        cmp     al, PGM_NOTE_MAX        ; real bound
        ja      zpa_done
        sub     al, PGM_NOTE_BASE
        xor     ah, ah
        imul    di, ax, PGM_PAD_STRIDE
        add     di, PGM_PADS
        add     di, bx                  ; es:di = that note's pad entry

        ; returns ax = 1/0; allocator writes new record
        ; to head sentinel, prepends fresh; newest = old head.next
        mov     si, word ptr [PTR_SAMPLE_DATA]
        mov     ax, word ptr [si+SND_NEXT]
        mov     dx, word ptr [si+SND_NEXT+2]
        mov     word ptr es:[di], ax    ; PGM_PAD_SND is +0
        mov     word ptr es:[di+2], dx

zpa_done:
        pop     es
        pop     di
        pop     si
        pop     dx
        pop     cx
        pop     bx
        pop     ax
        ret

; fills ZONE_BOUNDARY[0..ZONE_COUNT] equally spaced
; [ZAS_STARTSAVE,ZAS_ENDSAVE]: [0],[n] exact
; rest = start+(i/n)*range, rounded down
zone_recompute_boundaries:
        push    ax
        push    bx
        push    cx
        push    dx
        push    si
        mov     ax, word ptr [ZAS_ENDSAVE]
        mov     dx, word ptr [ZAS_ENDSAVE+2]
        sub     ax, word ptr [ZAS_STARTSAVE]
        sbb     dx, word ptr [ZAS_STARTSAVE+2]
        mov     word ptr [ZAS_RANGE], ax
        mov     word ptr [ZAS_RANGE+2], dx
        mov     cl, byte ptr [ZONE_COUNT]
        xor     ch, ch
        or      cl, cl
        jnz     zrb_nonzero
        mov     cl, 1
        jmp     zrb_haven
zrb_nonzero:
        cmp     cl, 16                  ; clamp to the array's 17 entries: a raw
        jbe     zrb_haven               ; count > 16 would write past it into
        mov     cl, 16                  ; ZONE_INDEX and the ZAS_ scratch
zrb_haven:
        mov     byte ptr [ZAS_ZONEIDX], 0

zrb_loop:
        mov     al, byte ptr [ZAS_ZONEIDX]
        cbw
        cmp     ax, cx
        ja      zrb_done
        mov     si, ax
        mov     bx, si
        shl     bx, 2
        or      si, si
        jnz     zrb_notfirst
        mov     ax, word ptr [ZAS_STARTSAVE]
        mov     dx, word ptr [ZAS_STARTSAVE+2]
        jmp     zrb_store

zrb_notfirst:
        cmp     si, cx
        jne     zrb_mid
        mov     ax, word ptr [ZAS_ENDSAVE]
        mov     dx, word ptr [ZAS_ENDSAVE+2]
        jmp     zrb_store

zrb_mid:
        mov     ax, word ptr [ZAS_RANGE]
        mul     si
        mov     word ptr [ZAS_PROD], ax
        mov     word ptr [ZAS_PROD+2], dx
        mov     ax, word ptr [ZAS_RANGE+2]
        mul     si
        add     word ptr [ZAS_PROD+2], ax
        mov     ax, word ptr [ZAS_PROD]
        mov     dx, word ptr [ZAS_PROD+2]
        call    zone_udiv32
        add     ax, word ptr [ZAS_STARTSAVE]
        adc     dx, word ptr [ZAS_STARTSAVE+2]

zrb_store:
        mov     word ptr [bx+ZONE_BOUNDARY], ax
        mov     word ptr [bx+ZONE_BOUNDARY+2], dx
        inc     byte ptr [ZAS_ZONEIDX]
        jmp     zrb_loop

zrb_done:
        pop     si
        pop     dx
        pop     cx
        pop     bx
        pop     ax
        ret

; DISCARD: two DELETE calls - tail [G_ZONE_END,len)
; first; head [0,G_ZONE_START); scalars preserved
zone_action_discard_case:
        les     si, [SND_CURRENT]
        mov     ax, word ptr es:[si+SND_LENGTH]
        mov     dx, word ptr es:[si+SND_LENGTH+2]
        ZS_T1CALL_PRE zs_disc_after_tail
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        push    word ptr [G_ZONE_END+2]   ; region start = the zone's End
        push    word ptr [G_ZONE_END]
        push    dx                      ; region end   = the sound's length
        push    ax
        ZS_T1CALL_GO ZS_T1_DELETE
zs_disc_after_tail:
        ZS_T1CALL_PRE zs_disc_after_head
        push    word ptr [SND_CURRENT+2]
        push    word ptr [SND_CURRENT]
        push    0                       ; region start = 0
        push    0
        push    word ptr [G_ZONE_START+2] ; region end   = the zone's Start
        push    word ptr [G_ZONE_START]
        ZS_T1CALL_GO ZS_T1_DELETE
zs_disc_after_head:
        mov     si, ax                  ; nonzero = success
        callf   ZS_T2S:ZS_T2_CLAMP_ZONE ; re-clamp St:/End: to the new length
        jmpf    ZS_T1S:ZS_T1_ACT_DONE2

; loop=(End,LoopLen); To=End-[+20h] (no separate end field)
; set End=G_ZONE_END, Len=END-START, LoopOn=1
zone_action_loop_case:
        les     si, [SND_CURRENT]
        mov     ax, word ptr [G_ZONE_END]
        mov     dx, word ptr [G_ZONE_END+2]
        mov     word ptr es:[si+SND_END], ax
        mov     word ptr es:[si+SND_END+2], dx
        sub     ax, word ptr [G_ZONE_START]
        sbb     dx, word ptr [G_ZONE_START+2]
        mov     word ptr es:[si+SND_LOOPLEN], ax
        mov     word ptr es:[si+SND_LOOPLEN+2], dx
        mov     byte ptr es:[si+SND_LOOPON], 1
        mov     si, 1                   ; the epilogue reads si == 0 as failure
        jmpf    ZS_T1S:ZS_T1_ACT_DONE2

; swap G_ZONE_START/END <-> ZONE_BOUNDARY[i]/[i+1]
; on zone change so editors/renderers work selected zone
; linked boundaries as side effect
zone_load_current_zone:
        push    ax
        push    bx
        push    dx
        call    zone_index_slot         ; bl = ZONE_INDEX - 1, clamped 0..15
        xor     bh, bh
        shl     bx, 2
        mov     ax, word ptr [bx+ZONE_BOUNDARY]
        mov     dx, word ptr [bx+ZONE_BOUNDARY+2]
        mov     word ptr [G_ZONE_START], ax
        mov     word ptr [G_ZONE_START+2], dx
        mov     ax, word ptr [bx+4+ZONE_BOUNDARY]
        mov     dx, word ptr [bx+4+ZONE_BOUNDARY+2]
        mov     word ptr [G_ZONE_END], ax
        mov     word ptr [G_ZONE_END+2], dx
        pop     dx
        pop     bx
        pop     ax
        ret

zone_store_current_zone:
        push    ax
        push    bx
        push    dx
        call    zone_index_slot
        xor     bh, bh
        shl     bx, 2
        mov     ax, word ptr [G_ZONE_START]
        mov     dx, word ptr [G_ZONE_START+2]
        mov     word ptr [bx+ZONE_BOUNDARY], ax
        mov     word ptr [bx+ZONE_BOUNDARY+2], dx
        mov     ax, word ptr [G_ZONE_END]
        mov     dx, word ptr [G_ZONE_END+2]
        mov     word ptr [bx+4+ZONE_BOUNDARY], ax
        mov     word ptr [bx+4+ZONE_BOUNDARY+2], dx
        pop     dx
        pop     bx
        pop     ax
        ret

; ZONE_INDEX 1-based -> bl (array slot, 0-based)
; subtract once; 0->1 (engine MIN 0; field reads 0)
zone_index_slot:
        mov     bl, byte ptr [ZONE_INDEX]
        or      bl, bl
        jnz     zis_nonzero
        mov     bl, 1
zis_nonzero:
        dec     bl
        cmp     bl, 15                  ; callers read [slot] and [slot+1], so
        jbe     zis_done                ; slot must be <= 15
        mov     bl, 15
zis_done:
        ret

; callback: ZONE_COUNT jog field (far-call on change)
; divides SAMPLE TRIM [+14h,+18h], not sub-zones
zone_count_commit:
        call    zone_count_apply
        retf                            ; far-called indirectly via [8CA0h]; no operand to pop

; zone_count_apply as near routine for pop-up
; CLOSE/DO IT without engine indirect call
zone_count_apply:
        push    ax
        push    dx
        push    si
        push    es
        cmp     byte ptr [ZONE_COUNT], 1        ; the engine's MIN is 0; the
        jae     zcc_count_ok                    ; documented minimum is 1
        mov     byte ptr [ZONE_COUNT], 1
zcc_count_ok:
        mov     ax, word ptr [SND_CURRENT]
        or      ax, word ptr [SND_CURRENT+2]
        je      zcc_no_sound
        les     si, [SND_CURRENT]
        mov     ax, word ptr es:[si+SND_START]
        mov     dx, word ptr es:[si+SND_START+2]
        mov     word ptr [ZAS_STARTSAVE], ax
        mov     word ptr [ZAS_STARTSAVE+2], dx
        mov     ax, word ptr es:[si+SND_END]
        mov     dx, word ptr es:[si+SND_END+2]
        mov     word ptr [ZAS_ENDSAVE], ax
        mov     word ptr [ZAS_ENDSAVE+2], dx
        jmp     zcc_have_region

zcc_no_sound:
        mov     ax, word ptr [G_ZONE_START]
        mov     dx, word ptr [G_ZONE_START+2]
        mov     word ptr [ZAS_STARTSAVE], ax
        mov     word ptr [ZAS_STARTSAVE+2], dx
        mov     ax, word ptr [G_ZONE_END]
        mov     dx, word ptr [G_ZONE_END+2]
        mov     word ptr [ZAS_ENDSAVE], ax
        mov     word ptr [ZAS_ENDSAVE+2], dx

zcc_have_region:
        call    zone_recompute_boundaries
        mov     byte ptr [ZONE_INDEX], 1
        mov     byte ptr [ZONE_INDEX_PREV], 1   ; Zone: nav flushes scalars to pre-reset slot
        call    zone_load_current_zone
        pop     es
        pop     si
        pop     dx
        pop     ax
        ret

; callback: Zone: index jog; engine writes index first
; swaps ZONE_INDEX_PREV, flushes old, restores new
; self-contained (TEXT2 has zero slack)
zone_index_commit:
        push    ax
        cmp     byte ptr [ZONE_COUNT], 2        ; with count < 2 ZONE_BOUNDARY may
        jae     zic_active                      ; ZONE_COUNT < 2: never populated
                                                ; field inert (loading would corrupt SILENCE/DELETE/etc)
        mov     byte ptr [ZONE_INDEX], 1
        mov     byte ptr [ZONE_INDEX_PREV], 1
        pop     ax
        retf
zic_active:
        cmp     byte ptr [ZONE_INDEX], 1        ; the engine's MIN is 0, so
        jae     zic_in_range                    ; dialling below 1 sticks at 1
        mov     byte ptr [ZONE_INDEX], 1
zic_in_range:
        mov     al, byte ptr [ZONE_INDEX]       ; the new index
        push    ax
        mov     al, byte ptr [ZONE_INDEX_PREV]
        mov     byte ptr [ZONE_INDEX], al       ; briefly restore the old one
        call    zone_store_current_zone         ; flush live edits into its slot
        pop     ax
        mov     byte ptr [ZONE_INDEX], al
        mov     byte ptr [ZONE_INDEX_PREV], al
        call    zone_load_current_zone
        pop     ax
        retf

; Hook D tail: Edit: per-action body (ax = action-2)
; 0=DELETE ZONE, 1=SILENCE ZONE, 2=REVERSE ZONE
; 3=SLICE SOUND, 4=DISCARD, 5=LOOP FROM ST TO END
zs_edit_text:
        cmp     ax, 3
        jb      zset_generic            ; 2,3,4: stock two-line prompt
        je      zset_slice
        cmp     ax, 4
        je      zset_discard
        cmp     ax, 5
        je      zset_loop
zset_generic:
        jmpf    ZS_T2S:ZS_T2_EDIT_GENERIC

; SLICE SOUND: no caption on XL, just fields
; both prompt rows become editable fields
zset_slice:
        push    ZS_SLICE_LBL1_X
        push    ZS_SLICE_Y1
        push    ds
        push    zs_str_endmargin
        callf   ZS_T2S:ZS_T2_STR_DRAW
        call    zs_format_margin
        push    ZS_SLICE_VAL_X
        push    ZS_SLICE_Y1
        push    ds
        push    zs_margin_buf
        callf   ZS_T2S:ZS_T2_STR_DRAW
        push    ZS_SLICE_LBL2_X
        push    ZS_SLICE_Y2
        push    ds
        push    zs_str_mkpgm
        callf   ZS_T2S:ZS_T2_STR_DRAW
        mov     ax, zs_str_no           ; after the draws above, which clobber ax
        cmp     byte ptr [ZAS_MAKE_PGM], 0
        je      zset_pgm_draw
        mov     ax, zs_str_yes
zset_pgm_draw:
        push    ZS_SLICE_VAL_X
        push    ZS_SLICE_Y2
        push    ds
        push    ax
        callf   ZS_T2S:ZS_T2_STR_DRAW
        jmpf    ZS_T2S:ZS_T2_EDIT_TAIL

zset_discard:
        push    ZS_EDIT_TXT_X
        push    ZS_EDIT_TXT_Y1
        push    ds
        push    zs_str_discard1
        callf   ZS_T2S:ZS_T2_STR_DRAW
        push    ZS_EDIT_TXT_X
        push    ZS_EDIT_TXT_Y2
        push    ds
        push    zs_str_discard2
        callf   ZS_T2S:ZS_T2_STR_DRAW
        jmpf    ZS_T2S:ZS_T2_EDIT_TAIL

zset_loop:
        push    ZS_EDIT_TXT_X
        push    ZS_EDIT_TXT_Y1
        push    ds
        push    zs_str_loop1
        callf   ZS_T2S:ZS_T2_STR_DRAW
        push    ZS_EDIT_TXT_X
        push    ZS_EDIT_TXT_Y2
        push    ds
        push    zs_str_loop2
        callf   ZS_T2S:ZS_T2_STR_DRAW
        jmpf    ZS_T2S:ZS_T2_EDIT_TAIL

; SLICE SOUND fields: 0=combo, 1=margin, 2=mkpgm
; inherited handlers (far-called, DS undefined)
; fall back to stock for all but SLICE SOUND
; stay installed for window lifetime; fallback mandatory

; UP (18h): only 2->1 handled
; stock L_0A02E resets to 0 unconditionally
zs_edit_up:
        push    ds
        mov     cx, ZS_DS
        mov     ds, cx
        cmp     byte ptr [ZONE_EDIT_ACTION], 5 ; 5 = SLICE SOUND
        jne     zeu_stock
        cmp     byte ptr [ZS_FIELD_INDEX], 2
        jne     zeu_stock
        mov     byte ptr [ZS_FIELD_INDEX], 1
        call    zs_arm_margin
        pop     ds
        retf
zeu_stock:
        pop     ds                      ; L_0A02E pushes DS itself
        jmpf    ZS_T2S:ZS_T2_EDIT_UP

; DOWN (19h): 0 -> 1 -> 2, stops when no field below
zs_edit_down:
        push    ds
        mov     cx, ZS_DS
        mov     ds, cx
        cmp     byte ptr [ZONE_EDIT_ACTION], 5
        jne     zed_stock
        mov     al, byte ptr [ZS_FIELD_INDEX]
        or      al, al
        jne     zed_from1
        mov     byte ptr [ZS_FIELD_INDEX], 1
        call    zs_arm_margin
        pop     ds
        retf
zed_from1:
        cmp     al, 1
        jne     zed_done                ; already on the last field
        mov     byte ptr [ZS_FIELD_INDEX], 2
        call    zs_arm_mkpgm
zed_done:
        pop     ds
        retf
zed_stock:
        pop     ds                      ; L_0A07A pushes DS itself
        jmpf    ZS_T2S:ZS_T2_EDIT_DOWN

; null: stock Edit: combo (engine write repaints)
zs_arm_margin:
        push    ds
        push    ZAS_END_MARGIN
        push    ZS_SLICE_MARGIN_MAX
        push    ZS_SLICE_VAL_X
        push    ZS_SLICE_Y1
        push    3                       ; cursor box = 2 characters
        push    word 0
        push    word 0
        callf   ZS_T2S:ZS_T2_FIELD_REG
        ret

zs_arm_mkpgm:
        push    ds
        push    ZAS_MAKE_PGM
        push    1                       ; YES / NO
        push    ZS_SLICE_VAL_X
        push    ZS_SLICE_Y2
        push    4                       ; cursor box = 3 characters
        push    word 0
        push    word 0
        callf   ZS_T2S:ZS_T2_FIELD_REG
        ret

; ZAS_END_MARGIN -> zs_margin_buf: 2 chars
; right-aligned string (display_draw_coord 8 chars
; won't fit); ax/cx only; preserves si/di/bx
zs_format_margin:
        mov     al, byte ptr [ZAS_END_MARGIN]
        cmp     al, ZS_SLICE_MARGIN_MAX ; an out-of-range power-on value would
        jbe     zfm_ok                  ; otherwise render three digits
        mov     al, ZS_SLICE_MARGIN_MAX
zfm_ok:
        sub     ah, ah
        mov     cl, 10
        div     cl                      ; al = tens, ah = units
        add     ah, 30h
        mov     byte ptr [zs_margin_buf+1], ah
        or      al, al
        jz      zfm_blank
        add     al, 30h
        jmp     zfm_put
zfm_blank:
        mov     al, 20h                 ; blank, so 30 -> 9 leaves no stale digit
zfm_put:
        mov     byte ptr [zs_margin_buf], al
        ret

; hook D strings right-aligned to ZS_SLICE_VAL_X:
; string lengths control positions: x=121 (11 chars), x=73 (19 chars)
zs_str_endmargin:
        db      "End margin:", 0
zs_str_mkpgm:
        db      "Create new program:", 0
zs_str_yes:
        db      "YES", 0
zs_str_no:
        db      "NO ", 0                ; padded to 3: YES -> NO leaves no "S"
zs_margin_buf:
        db      "30", 0                 ; rewritten by zs_format_margin per paint
                                        ; matches zt_end_margin value
zs_str_discard1:
        db      "DO IT will discard the", 0
zs_str_discard2:
        db      "sound outside St - End.", 0
zs_str_loop1:
        db      "Pressing DO IT will set", 0
zs_str_loop2:
        db      "loop from St to End.", 0

; ZONE state at ZONE_TABLE_BASE, held by PIN0 to keep addresses stable.
; used by zone_defs.inc, text2.asm. above boot zero-fill sweep;
; image values are power-on defaults
        PIN0    ZONE_TABLE_BASE

zt_boundary:
        ASSERT_AT ZONE_BOUNDARY
        db      44h dup (00h)           ; 17 shared boundary points
zt_index:
        ASSERT_AT ZONE_INDEX
        db      01h                     ; zone 1; znEDIT's repaint reads from image on first
                                        ; paint before any field is armed
zt_count:
        ASSERT_AT ZONE_COUNT
        db      00h
zt_startsave:
        ASSERT_AT ZAS_STARTSAVE
        db      04h dup (00h)
zt_endsave:
        ASSERT_AT ZAS_ENDSAVE
        db      04h dup (00h)
zt_range:
        ASSERT_AT ZAS_RANGE
        db      04h dup (00h)
zt_prod:
        ASSERT_AT ZAS_PROD
        db      04h dup (00h)
zt_zoneidx:
        ASSERT_AT ZAS_ZONEIDX
        db      00h
zt_loopcnt:
        ASSERT_AT ZAS_LOOPCNT
        db      00h
zt_namesave:
        ASSERT_AT ZAS_NAMESAVE
        db      3ah dup (00h)           ; 58 bytes
zt_index_prev:
        ASSERT_AT ZONE_INDEX_PREV
        db      01h                     ; must match zt_index or first Zone navigation
                                        ; flushes into wrong slot

; 8-entry table at DATA:3814h replaces stock 5-entry EDIT action labels.
; 25 bytes per entry (24 chars + NUL). text2.asm repoints
; renderer `add ax, 3814h` here.
zt_action_labels:
        ASSERT_AT ZS_ACTION_LABELS
        db      "ZONE->NEW SAMPLE        ", 0
        db      "INSERT Sound->ZONE START", 0
        db      "DELETE ZONE             ", 0
        db      "SILENCE ZONE            ", 0
        db      "REVERSE ZONE            ", 0
        db      "SLICE SOUND             ", 0
        db      "DISCARD                 ", 0
        db      "LOOP FROM ST TO END     ", 0

zt_basename:
        ASSERT_AT ZAS_BASENAME
        db      11h dup (00h)
zt_zwin_save_count:
        ASSERT_AT ZWIN_SAVE_COUNT
        db      00h

; "0".."16" (17 entries), stride-6 NUL-terminated format (like DATA:30B2h).
; read by text2 hook B (ZONE_INDEX), zs_zwin_paint (ZONE_COUNT).
; right-aligned 2 chars; Zone:"1" inks x=219..221 from x=212.
zt_num_strings:
        ASSERT_AT ZS_NUM_STRINGS
        db      " 0", 0, 0, 0, 0
        db      " 1", 0, 0, 0, 0
        db      " 2", 0, 0, 0, 0
        db      " 3", 0, 0, 0, 0
        db      " 4", 0, 0, 0, 0
        db      " 5", 0, 0, 0, 0
        db      " 6", 0, 0, 0, 0
        db      " 7", 0, 0, 0, 0
        db      " 8", 0, 0, 0, 0
        db      " 9", 0, 0, 0, 0
        db      "10", 0, 0, 0, 0
        db      "11", 0, 0, 0, 0
        db      "12", 0, 0, 0, 0
        db      "13", 0, 0, 0, 0
        db      "14", 0, 0, 0, 0
        db      "15", 0, 0, 0, 0
        db      "16", 0, 0, 0, 0
        ASSERT_AT ZS_NUM_STRINGS+ZS_NUM_STRINGS_N*ZS_NUM_STRIDE

zt_end_margin:
        ASSERT_AT ZAS_END_MARGIN
        db      SLICE_END_MARGIN        ; 30, the XL's documented default
zt_make_pgm:
        ASSERT_AT ZAS_MAKE_PGM
        db      01h                     ; YES, as the XL's own mock-up
zt_pgm_slot:
        ASSERT_AT ZAS_PGM_SLOT
        db      0ffh                    ; scratch, not a setting: no slot yet
