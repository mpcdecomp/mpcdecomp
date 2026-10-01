; MPC2000XL v1.07 flash: ../common/flash/image.inc, with this version's own tables.

        cpu     v53

FW_VERSION                      equ     107
XL_CHECKSUM                     equ     0A1A8h          ; as stored (stale: the loader refuses the image)

        include "../common/flash/image.inc"

        end
