; free -- MPC2000XL flash FREE_BASE-BOOT_BASE (65536 bytes): erased, feature
; arena.  v1.20 0x65cd6, v1.14 0x656d6, v1.12 0x654d6.
; v1.11 0x652e6-0x752e6 (65536 bytes), v1.10 0x651e6-0x751e6 (65536 bytes),
; v1.07 0x64d06-0x74d06.

; erased in flash, but not all free at runtime: on v1.20 the OS's own
; program-record array (PGM_COUNT slots of SIZEOF_PGM bytes, from `push
; PGM_ARRAY_DS` in pgm_memory_init) runs 0x65AE0-0x741B0, live once its slot's
; program exists.  its address is DS-relative, so it moves with DS_SEG: growth
; in consts ahead of DS_ORIGIN moves it further into this part than the stock
; 58586 bytes.  feat/arena.inc starts the arena's code past it.
        include "../feat/arena.inc"
        PAD_TO  10000h, 000h
FREE_END:
