; boot -- MPC2000XL flash BOOT_BASE-0x80000: checksum, boot block.
; v1.20 0x75cd6 (41770 bytes), v1.14 0x756d6 (43306 bytes),
; v1.12 0x754d6 (43818 bytes).
; v1.11 0x752e6-0x80000 (44314 bytes), v1.10 0x751e6-0x80000 (44570 bytes),
; v1.07 0x74d06-0x80000 (45818 bytes).
; erased flash, image checksum word at 0x77ffe, 16KB boot block from 0x7c000.
; boot block is byte-identical across versions with the same boot ROM, so it
; lives in ../bootblock.asm; here: fill, checksum.  the version's image.asm
; sets XL_CHECKSUM, the word the boot loader at 0x7c7d9 compares its own
; 16-bit sum of flash 0x00000-0x77ffd against (the build recomputes it), and
; BOOT_V101 for the Feb. 15,2001 boot ROM.

; free space BOOT_BASE-0x77ffe, 00h -- add features here
        PAD_TO  077FFEh-SEGBASE, 000h

        dw      XL_CHECKSUM

        include "../bootblock.asm"
BOOT_END:
