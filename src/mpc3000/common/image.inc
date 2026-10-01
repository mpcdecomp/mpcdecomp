; whole ROM; image.asm includes this, sets FW_VERSION; symbols.inc
; per-version; labels via re-phase

        org     0

        include "symbols.inc"

        include "p_00000.asm"
        include "p_10000.asm"
        include "p_20000.asm"
        include "p_30000.asm"
        include "p_40000.asm"
        include "p_50000.asm"
        include "p_60000.asm"
        include "p_70000.asm"
