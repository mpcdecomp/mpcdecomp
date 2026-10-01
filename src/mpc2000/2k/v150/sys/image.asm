; MPC2000.SYS v1.50: ../../common/sys/image.inc, with this version's own tables.

        cpu     v53

FW_VERSION                      equ     150
RELOC_N                         equ     2387            ; reloc.inc's entries
STOCK_PARAS                     equ     608             ; the original's e_cparhdr
E_MINALLOC                      equ     056bh

        include "../../common/sys/image.inc"

        end
