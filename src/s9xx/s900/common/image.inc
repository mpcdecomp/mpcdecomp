; S900 OS boot disk: 800 KB (disk.inc format). v2.1: one-sample program,
; settings, sample (files.asm), FIXUPS, OS. v4.0: FIXUPS, OS.
; image.asm per version sets MODEL, FW_VERSION, OS_NAME, blocks.

        include "disk.inc"
        include "ram.inc"                       ; this version's RAM variables

        org     0
        if      FW_VERSION < 400
        CATENT  "TONE PRGRM", 'P', tone_prgrm, tone_prgrm_end
        CATENT  "OVERALL SE", 'O', overall_se, overall_se_end
        CATENT  "TONE      ", 'S', tone_sample, tone_sample_end
        endif
        CATENT  "FIXUPS    ", 'F', FIXUPS_START, FIXUPS_END
        CATENT  OS_NAME, 'F', OS_START, OS_END

        if      FW_VERSION < 400
        CHAIN   4, 1
        CHAIN   5, 1
        CHAIN   6, 3
        endif
        CHAIN   FIXUPS_BLOCK, 1
        CHAIN   OS_BLOCK, OS_BLOCKS

        if      FW_VERSION < 400
        TOBLOCK 4
        include "files.asm"
        BLOCKS  tone_prgrm, tone_prgrm_end, 1
        BLOCKS  overall_se, overall_se_end, 1
        BLOCKS  tone_sample, tone_sample_end, 3
        endif

        TOBLOCK FIXUPS_BLOCK
FIXUPS_START equ $
        phase   83b4h
        include "../../common/fixups.inc"
        dephase
FIXUPS_END equ  $
        BLOCKS  FIXUPS_START, FIXUPS_END, 1

        TOBLOCK OS_BLOCK
OS_START equ    $
        phase   0
        include "../../common/os.inc"
        dephase
OS_END  equ     $
        BLOCKS  OS_START, OS_END, OS_BLOCKS

        FILL0   DISK_SIZE-$
