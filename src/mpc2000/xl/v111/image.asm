; MPC2000XL v1.11 flash: ../common/flash/image.inc, with this version's own tables.

        cpu     v53

FW_VERSION                      equ     111
XL_CHECKSUM                     equ     0B364h          ; as stored (stale: the loader refuses the image)

        include "../common/flash/image.inc"

        end
