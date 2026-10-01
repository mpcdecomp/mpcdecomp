; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; MUTE_GROUPS -- pass mute-off note 1 in [bp+0Dh].  22 bytes, in place of
; RUN_VOICE_START_1_S1 (common/c0.inc), at both call sites of the note-on
; handler (v1.20 0x380AC: 0x3906C and 0x390F6).  stock pushes es:[di+7] then
; es:[di+6] as two byte-wide word pushes, to [bp+0Ch] and [bp+0Ah]; the rewritten
; 0x381C2 hook reuses [bp+0Ah..0Bh] as scratch, so the pair goes as one word --
; es:[di+5] to [bp+0Ch], es:[di+6] to [bp+0Dh].
; stock: mov al,[bp-011h] / push ax / mov es,[bp+010h] / mov al,es:[di+7] /
;        push ax / mov al,es:[di+6] / push ax / lea ax,[bp-050h] / push ss /
;        push ax
        mov     al, byte ptr [bp-011h]
        push    ax
        mov     es, word ptr [bp+010h]
        mov     ax, es:[di+5]           ; AL = [di+5], AH = mute-off note 1
        push    ax                      ;   -> [bp+0Ch], [bp+0Dh]
        mov     al, es:[di+7]           ; mute-off note 2 (unused)
        push    ax                      ;   -> [bp+0Ah]
        lea     ax, [bp-050h]
        push    ss
        push    ax
