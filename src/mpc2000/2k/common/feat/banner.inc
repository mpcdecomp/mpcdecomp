; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; FEATURE_BUILD -- the busy banner, the 2K's copy of the string the XL carries at
; flash 0x0166A (src/mpc2000/xl/common/flash/app0.asm).  A non-stock image says so here, before
; it has finished booting.  Exactly 20 characters either way, so nothing moves.
; The string is in the EXE and the 2K's features are in the SYS, so the build
; stamps this image when its SYS took an option -- BANNER in its target.mk.
FEAT_BANNER macro
        ifdef   FEATURE_BUILD
        BC_PRINT "     by brockrockman"
        else
        BC_PRINT "         Wait......."
        endif
        endm
