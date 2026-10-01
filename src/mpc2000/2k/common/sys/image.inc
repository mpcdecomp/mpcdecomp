; MZ header, TEXT1, TEXT2, data in single run, each phased
; to its segment's offsets. image.asm: FW_VERSION,
; version-specific header. version tables (reloc.inc,
; bss_check.inc, data_layout_check.inc) on include path.
; labels typed CODE; TEXT1/TEXT2 assume all registers CODE
; (no CS: overrides via DS); data.asm keeps default, tail
; gets CS: for its labels.

        include "defs.inc"

        org     0
        include "header.asm"

        assume  ds:code, es:code, ss:code
        phase   0
        include "text1.asm"
        dephase

        phase   0
        include "text2.asm"
        dephase

        assume  ds:data, es:nothing, ss:nothing
        phase   DATA_ORG
        include "data.asm"
        include "bss.inc"
        include "../feat/tail.inc"

        include "data_layout_check.inc"
        dephase

IMAGE_BYTES                     equ     $-HEADER_BYTES
