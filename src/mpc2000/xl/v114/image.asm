; MPC2000XL v1.14 flash: ../common/flash/image.inc, with this version's own tables.

        cpu     v53

FW_VERSION                      equ     114
XL_CHECKSUM                     equ     035B0h          ; as stored; the build recomputes it
BOOT_V101                       equ     1               ; the Feb. 15,2001 boot ROM

        include "../common/flash/image.inc"

        end
