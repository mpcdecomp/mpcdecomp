; MPC2000XL flash -- the whole 512 KB in one assembler run, for every version
; whose image.asm includes this (v1.07-v1.20).  each part is phased to offset
; 0, so its labels are offsets in the part, and its base is the image position
; it starts at; the parts name each other's labels directly.  what differs
; between versions sits under FW_VERSION; a version's own tables are found by
; bare name in its directory, which the Makefile puts on the include path.
; addresses written in comments are v1.20's unless a comment says otherwise.

        include "segments.inc"
        include "public.inc"
        include "aliases.inc"
        if      FW_VERSION >= 120
        include "symbols.inc"
        endif
        include "../feat/defs.inc"
        include "defs.inc"

        org     0

APP0_BASE                       equ     $
SEGBASE                         set     APP0_BASE
        phase   0
        include "app0.asm"
        dephase
APP1_BASE                       equ     $
SEGBASE                         set     APP1_BASE
        phase   0
        include "app1.asm"
        dephase
ATA_BASE                        equ     $
SEGBASE                         set     ATA_BASE
        phase   0
        include "ata.asm"
        dephase
RAM_BASE                        equ     $
SEGBASE                         set     RAM_BASE
        phase   0
        include "ram.asm"
        dephase
APP2_BASE                       equ     $
SEGBASE                         set     APP2_BASE
        phase   0
        include "app2.asm"
        dephase
APP3_BASE                       equ     $
SEGBASE                         set     APP3_BASE
        phase   0
        include "app3.asm"
        dephase
C0_BASE                         equ     $
SEGBASE                         set     C0_BASE
        phase   0
        include "c0.asm"
        dephase
C1_BASE                         equ     $
SEGBASE                         set     C1_BASE
        phase   0
        include "c1.asm"
        dephase
C2_BASE                         equ     $
SEGBASE                         set     C2_BASE
        phase   0
        include "c2.asm"
        dephase
CONSTS_BASE                     equ     $
SEGBASE                         set     CONSTS_BASE
        phase   0
        include "consts.asm"
        dephase
FREE_BASE                       equ     $
SEGBASE                         set     FREE_BASE
        phase   0
        include "free.asm"
        dephase
BOOT_BASE                       equ     $
SEGBASE                         set     BOOT_BASE
        phase   0
        include "boot.asm"
        dephase

; the flash is 512 KB and the reset vector is its last 16 bytes.
        if      $ <> 80000h
        error   "the image is not 512 KB: a part outgrew the flash"
        endif

; after the parts, so every anchor is known on the pass that tests it: a
; pass-1 fatal fires on a forward reference before the passes converge.
        if      (C0_BASE+SEG_C0)#16 <> 0
        error   "C0_SEG: its anchor moved by other than whole paragraphs"
        endif
        if      (C2_BASE+SEG_C2)#16 <> 0
        error   "C2_SEG: its anchor moved by other than whole paragraphs"
        endif
        if      (C1_BASE+SEG_C1)#16 <> 0
        error   "C1_SEG: its anchor moved by other than whole paragraphs"
        endif
; c1 past its anchor and c2 up to C2_SEG's run under C1_SEG: nothing reaches
; a byte of it beyond 64K, and near calls into it would wrap without a word.
        if      C2_BASE+SEG_C2 > C1_SEG*16+10000h
        error   "C1_SEG: c1 and c2's head run past 64K of C1_SEG"
        endif
        if      (APP3_BASE+SEG_APP3)#16 <> 0
        error   "APP3_SEG: its anchor moved by other than whole paragraphs"
        endif
        if      (RAM_BASE+SEG_APP2)#16 <> 0
        error   "APP2_SEG: its anchor moved by other than whole paragraphs"
        endif
        if      (CONSTS_BASE+SEG_DS)#16 <> 0
        error   "DS_SEG: its anchor moved by other than whole paragraphs"
        endif
        if      (APP2_BASE+APPDATA_ORIGIN)#16 <> 0
        error   "APPDATA_SEG: its anchor moved by other than whole paragraphs"
        endif
        if      (APP1_BASE+SEG_APP1)#16 <> 0
        error   "APP1_SEG: its anchor moved by other than whole paragraphs"
        endif
        if      (APP1_FAR = 0) && (APP1_SEG <> 0)
        error   "APP1_FAR: near forms chosen, but app1 is not in segment 0"
        endif
        if      (ATA_FAR = 0) && (ATA_SEG <> 0)
        error   "ATA_FAR: near forms chosen, but ata is not in segment 0"
        endif
        if      (ATA_BASE+SEG_ATA)#16 <> 0
        error   "ATA_SEG: its anchor moved by other than whole paragraphs"
        endif
        if      (RAM_BASE+SEG_RAM)#16 <> 0
        error   "RAM_SEG: its anchor moved by other than whole paragraphs"
        endif
