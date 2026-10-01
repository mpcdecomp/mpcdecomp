; S900 OS v4.0 boot disk ("AKAI S900 VERSION 4.0", January 14, 1988):
; ../common/image.inc, 800 KB total

        cpu     V30

MODEL                           equ     900
FW_VERSION                      equ     400
OS_NAME                         equ     "S900 4.0  "
FIXUPS_BLOCK                    equ     4
OS_BLOCK                        equ     5
OS_BLOCKS                       equ     45

        include "../common/image.inc"

        end
