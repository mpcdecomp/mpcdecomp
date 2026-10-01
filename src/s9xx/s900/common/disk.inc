; S900 floppy: 80 tracks × 2 sides × 5 sectors of 1 KB, 800 blocks total.
; Dir: blocks 0-3 with 64 entries (24 bytes each) from 0000h and one FAT
; word per block from 0600h. File is FAT chain: word = next block, 8000h
; ends, 0 free.
; Image > 64 KB: ASL allows only under phase, so past first 64 KB needs
; FILL0 or phased assembly.

; name: 10 characters, space-padded.  start/end: the file's image offsets.
CATENT  macro   name, type, start, end
        db      name
        db      (16-strlen(name)) dup (0)
        db      type
        db      (end-start)&0ffh, ((end-start)>>8)&0ffh, (end-start)>>16
        dw      (start)/400h, 0
        endm

; the FAT words of one file: n blocks from first
CHAIN   macro   first, n
        db      (0600h+2*(first)-$) dup (0)
CHAIN_B set     first
        rept    (n)-1
CHAIN_B set     CHAIN_B+1
        dw      CHAIN_B
        endm
        dw      8000h
        endm

; zeros up to block b, which must lie in the first 64 KB
TOBLOCK macro   b
        db      ((b)*400h-$) dup (0)
        endm

; after a file: it starts on a block and fills the n its chain gives it
BLOCKS  macro   start, end, n
        if      (((start)#400h) <> 0) || ((((end)-(start)+3ffh)/400h) <> (n))
        error   "a file's FAT chain disagrees with its size"
        endif
        endm

; n zeros, in phased 32 KB pieces
FILL0   macro   n
FILL_LEFT set   n
        while   FILL_LEFT > 0
FILL_PART set   FILL_LEFT
        if      FILL_PART > 8000h
FILL_PART set   8000h
        endif
        phase   0
        db      FILL_PART dup (0)
        dephase
FILL_LEFT set   FILL_LEFT-FILL_PART
        endm
        endm

DISK_SIZE equ   800*400h
