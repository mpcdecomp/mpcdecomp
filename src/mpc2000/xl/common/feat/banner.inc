; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; FEATURE_BUILD -- the busy banner, the one string the OS paints while it loads
; (v1.20 flash 0x0166A).  exactly 20 chars either way, so nothing moves.  2K
; copy is in its EXE, src/2k/v172/exe/code1.asm.
; another patcher stamps this same slot at 0x0166a,20; ours is not its bytes,
; so its blob matches neither the expected string nor its own and skips -- with
; the banner stamped the xl42k loader writes nothing to this image.

BUSY_BANNER     macro
        ifdef   FEATURE_BUILD
        DISP_MSG        "     by brockrockman"
        else
        DISP_MSG        "         Wait......."
        endif
        endm
