; MPC2000XL v1.10 flash: ../common/flash/image.inc, with this version's own tables.

        cpu     v53

FW_VERSION                      equ     110
XL_CHECKSUM                     equ     01A98h          ; as stored (stale: the loader refuses the image)

        include "../common/flash/image.inc"

        end
