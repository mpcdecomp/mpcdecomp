; MPC2000.EXE v1.72: ../../common/exe/image.inc, with this version's own tables.

        cpu     v53

FW_VERSION                      equ     172
RELOC_N                         equ     662             ; reloc.inc's entries
STOCK_PARAS                     equ     224             ; the original's e_cparhdr

        include "../../common/exe/image.inc"

        end
