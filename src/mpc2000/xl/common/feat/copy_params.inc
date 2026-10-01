; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; COPY_NOTE_PARAMS -- feature body at ARENA_CP_REPAINT, notice draw list at
; ARENA_CP_NOTICE (feat/pins.inc; v1.20 flash 0x741B0, 0x74330); pads forward
; to each pinned offset.

        if      FREE_ARENA+ARENA_CP_REPAINT-$ < 0
        fatal   "include out of order: ARENA_CP_REPAINT already passed"
        endif
        PAD_TO  FREE_ARENA+ARENA_CP_REPAINT, 000h      ; pad forward to the pinned offset

; body: three routines, 247 bytes, from the first byte past the OS
; program-record array.  cp_repaint (window-enter/repaint, key 32h) and
; cp_params (F2 "PARAMS", key 03h) are reached through the relocated COPY
; window's far pointers; cp_one_pad is a near CALL from here.  DS = DS_SEG,
; data named in feat/defs.inc; [0989Ah]/[0989Ch] is the far base of the program
; table, stride 099Eh; MG_GROUP_SEG:0 the mute-group table (0 unless
; MUTE_GROUPS).

; window-enter/repaint hook (descriptor key 32h): stock repaint, then a notice
; when src and dst are the same pad -- the case F2 reads as "copy to ALL pads".
cp_repaint:
        push    ds
        push    DS_SEG
        pop     ds
        callf   EP_COPY_NOTE_PAINT_SEG:EP_COPY_NOTE_PAINT_OFF ; stock repaint
        mov     al, [G_COPY_DST_NOTE]   ; destination note
        cmp     al, [MG_NOTE]            ; == source note?
        jne     cpr_done
        mov     ax, [G_COPY_SRC_PGM]    ; AL = src program, AH = dst program
        cmp     al, ah
        jne     cpr_done
        push    word LSEG(SEGBASE+cp_notice)
        push    word LOFF(SEGBASE+cp_notice)
        callf   EP_DISP_LIST_RUN_SEG:EP_DISP_LIST_RUN_OFF
        add     sp, 4
cpr_done:
        pop     ds
        retf

; F2 "PARAMS" handler: copy note parameters src pad -> one dst pad, or, when src
; and dst are the same pad, -> every pad 23h..62h of the dst program.
cp_params:
        ASSERT_AT FREE_ARENA+ARENA_CP_PARAMS
        enter   2, 0                    ; [bp-2] = dst program's pad-param base
        push    ds
        push    si
        push    di
        push    DS_SEG
        pop     ds
        mov     al, [G_COPY_DST_PGM]    ; dst program
        cmp     al, [G_COPY_SRC_PGM]    ; == src program?
        jne     cpp_single
        mov     al, [G_COPY_DST_NOTE]   ; dst note
        cmp     al, [MG_NOTE]            ; == src note?
        jne     cpp_single
        xor     cx, cx                  ; same pad selected -> "all pads"
        jmp     cpp_mode
cpp_single:
        mov     cx, 1
cpp_mode:
        mov     al, [G_COPY_DST_PGM]    ; dst program
        sub     ah, ah
        imul    ax, ax, 099eh           ; * program record stride
        add     ax, [C2_FP_PGM_ARRAY]
        add     ax, 0752h               ; + per-pad 4-byte array offset
        mov     [bp-2], ax
        or      cx, cx
        je      cpp_all
        mov     al, [G_COPY_DST_NOTE]   ; single: BL = BH = dst note
        mov     bl, al
        mov     bh, bl
        jmp     cpp_loop
cpp_all:
        mov     bl, 023h                ; all: notes 23h..62h
        mov     bh, 062h
cpp_loop:
        push    bx
        call    cp_one_pad
        pop     bx
        inc     bl
        cmp     bl, bh
        jbe     cpp_loop
        callf   [C2_W_08D72]            ; the caller's screen refresh
        pop     di
        pop     si
        pop     ds
        leave
        retf

; copy every parameter of the src pad onto dst note BL, preserving the dst's own
; 4-byte per-pad entry (its sound assignment) across the stock worker's copy.
cp_one_pad:
        mov     al, [MG_DRUM]            ; drum the pad UI is showing
        mov     ah, 040h
        mul     ah                      ; AX = program * 64
        sub     ax, 023h                ; bias: notes start at 23h
        mov     cx, ax                  ; CX = mute-group table row base
        mov     ax, MG_GROUP_SEG
        mov     es, ax
        mov     al, [MG_NOTE]            ; source note
        sub     ah, ah
        add     ax, cx
        mov     si, ax
        mov     dl, es:[si]             ; source pad's mute group
        mov     al, bl                  ; destination note
        sub     ah, ah
        add     ax, cx
        mov     si, ax
        mov     es:[si], dl             ; carry the mute group over

        mov     al, bl
        sub     ah, ah
        shl     ax, 1
        shl     ax, 1                   ; dst note * 4
        add     ax, [bp-2]
        mov     si, ax
        mov     es, [C2_W_PGM_ARRAY_SEG]
        mov     ax, es:[si]             ; save the dst pad's own 4-byte entry
        push    ax
        mov     ax, es:[si+2]
        push    ax
        push    si

        mov     al, [MG_NOTE]            ; src note
        sub     ah, ah
        push    ax
        mov     al, [G_COPY_SRC_PGM]    ; src program
        sub     ah, ah
        push    ax
        mov     al, bl                  ; dst note
        sub     ah, ah
        push    ax
        mov     al, [G_COPY_DST_PGM]    ; dst program
        sub     ah, ah
        push    ax
        callf   EP_COPY_NOTE_PARAMS_BODY_SEG:EP_COPY_NOTE_PARAMS_BODY_OFF ; the stock
        add     sp, 8                   ;   worker F6/DO IT uses

        mov     es, [C2_W_PGM_ARRAY_SEG]
        pop     si
        pop     ax
        mov     es:[si+2], ax           ; put the sound assignment back
        pop     ax
        mov     es:[si], ax
        ret

        if      FREE_ARENA+ARENA_CP_NOTICE-$ < 0
        fatal   "include out of order: ARENA_CP_NOTICE already passed"
        endif
        PAD_TO  FREE_ARENA+ARENA_CP_NOTICE, 000h      ; pad forward to the pinned offset

; the "no dest=ALL pads" notice draw list, 21 bytes.
cp_notice:
        WIN_LABEL CP_NOTICE_X, CP_NOTICE_Y, "no dest=ALL pads"
        WIN_END
