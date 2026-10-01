; S900 OS v2.1 boot disk ("AKAI S900 VERSION 2.1  X-fade looping-Filter
; ADSR-Pretrig rec."): ../common/image.inc, 800 KB total

        cpu     V30

MODEL                           equ     900
FW_VERSION                      equ     210
OS_NAME                         equ     "S900 2.1  "
FIXUPS_BLOCK                    equ     9
OS_BLOCK                        equ     10
OS_BLOCKS                       equ     35

        include "../common/image.inc"

        end
