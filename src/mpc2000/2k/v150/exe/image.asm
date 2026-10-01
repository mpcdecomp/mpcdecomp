; MPC2000.EXE v1.50: ../../common/exe/image.inc, with this version's own tables.

        cpu     v53

FW_VERSION                      equ     150
RELOC_N                         equ     643             ; reloc.inc's entries
STOCK_PARAS                     equ     192             ; the original's e_cparhdr

        include "../../common/exe/image.inc"

        end
