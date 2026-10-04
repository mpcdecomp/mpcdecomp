; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; MUTE_GROUPS -- choke-helper tail at c0's segment anchor, C0_SEG:0000h (v1.20
; flash 0x35B00), placed there by MG_C0_PAD (feat/mute.inc).

; 13 bytes in the 16 bytes of inter-function padding every version has at
; C0_SEG:0000.  reached by a near JMP from the choke hook (v1.20 0x3821C), so
; PINNED to the same 64KB code segment as the hook.  on entry the hook has
; pushed ES; ES:BX -> note event record, AL = note to silence.  returns to the hook's caller, not the hook.

mg_kill_tail:
        push    ax                      ; arg2 = note to kill
        mov     al, es:[bx+2]           ; arg1 = the event's program/track byte
        push    ax
        call    voice_release_by_note   ; stock voice-scan-and-kill(prog, note)
        pop     cx
        pop     cx
        pop     es                      ; the ES the hook pushed at 0x38212
        ret
