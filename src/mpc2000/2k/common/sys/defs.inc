; MPC2000.SYS -- ports, macros, the shapes of shared tables and records, and the
; segment layout: everything every part needs before its first byte.

        include "../../../common/ports.inc"
        include "../../../common/assert_at.inc"

; window/field vocabulary: display-item opcodes, handler-table records, key
; numbering; macros and equates used by TEXT1, TEXT2, here.
        include "../../../common/window_macros.inc"

; error-code numbering, message counts, objects after table; table data
; in data.asm.
        include "../../../common/sys_data.inc"

T_DSP_CHAN_STRIDE               equ     014h

        include "../seg_layout.inc"
        include "../feat/defs.inc"

; BSS laid out from image end; image.asm includes bss.inc.
        include "../sys_bss.inc"

; [SND_CURRENT] points to MPC_STATE (94 LES/LDS refs); four structs via
; DATA-segment far ptrs.
        include "../state.inc"
        include "../structures.inc"
; pgm_record.inc depends on SIZEOF_FXS/SIZEOF_FXR defined in sys_records.inc.
        include "../../../common/sys_records.inc"
        include "../../../common/pgm_record.inc"
