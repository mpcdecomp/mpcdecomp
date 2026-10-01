; MPC2000.EXE in one run: MZ header, cs0, cs1, data phased to own
; segment offsets. Each version's image.asm sets FW_VERSION and header
; numbers (includes this). Version-specific tables (symbols.inc, reloc.inc,
; aliases.inc) on include path. Memory operands naming CODE labels get
; CS: override unless segment register assumed CODE. cs0/cs1 assume all
; registers hold CODE (no overrides). data.asm tail keeps CS: for own
; labels.

        include "../../../common/shared_tables.inc"
        include "../../../common/bytecode_macros.inc"
        include "../../common/exe_screens.inc"
        include "symbols.inc"
        include "../../common/memory_map.inc"
        include "segments.inc"
        include "../../common/feat/banner.inc"

        org     0
        include "header.asm"

        assume  ds:code, es:code, ss:code
        phase   0
        include "cs0.asm"
        dephase

        phase   CS1_ORG
        include "cs1.asm"
        dephase

        assume  ds:data, es:nothing, ss:nothing
        phase   0
        include "data.asm"
        dephase

IMAGE_BYTES                     equ     $-HEADER_BYTES

