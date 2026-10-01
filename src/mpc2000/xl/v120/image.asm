; MPC2000XL v1.20 flash: ../common/flash/image.inc, with this version's own tables.

        cpu     v53

FW_VERSION                      equ     120
XL_CHECKSUM                     equ     05ACBh          ; as stored; the build recomputes it
BOOT_V101                       equ     1               ; the Feb. 15,2001 boot ROM

        include "../common/flash/image.inc"

        end
