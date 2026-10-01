; MPC2000.SYS v1.72: image.inc with v1.72's tables

        cpu     v53

FW_VERSION                      equ     172
RELOC_N                         equ     2440            ; reloc.inc's entries
STOCK_PARAS                     equ     640             ; the original's e_cparhdr
E_MINALLOC                      equ     056ch

        include "../../common/sys/image.inc"

        end
