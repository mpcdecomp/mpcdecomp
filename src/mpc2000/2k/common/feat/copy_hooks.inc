; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; COPY_NOTE_PARAMS -- the base-2K hook, the stock entry with the option off.

; TBL_COPY_NOTE_PARAMS_KEYS: window's handler table
; 32h repaint: repoint to tail, cp_repaint wraps stock handler
; adds F2 label + handler; 5 bytes; segment from TEXT2_SEG
CP_HOOK_PAINT_KEY macro
        ifdef   COPY_NOTE_PARAMS
        WIN_KEY   WIN_K_PAINT, DATA_SEG, cp_repaint
        else
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, X_067E8
        endif
        endm
