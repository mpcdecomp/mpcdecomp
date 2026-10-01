; sound record; SND_HDR: 0 on 2K, 012h on XL; XL = 2K with 012h header
; prepended; offsets identical; anchors: 16-char name, RATE value 0AC44h

        ifndef  SND_HDR
         fatal  "set SND_HDR first: 0 on the 2K, 012h on the XL"
        endif

SND_NAME        equ     SND_HDR+000h    ; 16 chars
SND_NAME_LEN    equ     16
SND_NAME_NUL    equ     SND_HDR+010h
SND_LEVEL       equ     SND_HDR+011h    ; byte, init 64h = 100
SND_TUNE        equ     SND_HDR+012h    ; byte, signed; import sets it per sample rate
SND_STEREO      equ     SND_HDR+013h    ; byte, 0 = mono.  prints "(ST)" when set

; four dwords, same both versions; LENGTH rounded to paragraph by allocator
SND_START       equ     SND_HDR+014h    ; dd  ?
SND_START_HI    equ     SND_HDR+016h
SND_END         equ     SND_HDR+018h    ; dd  ?
SND_END_HI      equ     SND_HDR+01ah
SND_LENGTH      equ     SND_HDR+01ch    ; dd
SND_LENGTH_HI   equ     SND_HDR+01eh
SND_LOOP        equ     SND_HDR+020h    ; dd  ?
SND_LOOP_HI     equ     SND_HDR+022h

SND_FIELD_24    equ     SND_HDR+024h    ; word, 400h = 1024  ?
SND_FIELD_25    equ     SND_HDR+025h    ; byte, init 1  ?
SND_RATE        equ     SND_HDR+026h    ; word, 0AC44h = 44100

; 2K: 128 nodes, stride 36h at DS:6C7Ah, doubly linked; head/tail
; sentinels PTR_SAMPLE_DATA, PTR_DMA_STATE. XL: only NEXT offset
; confirmed ?
SND_NEXT        equ     SND_HDR+028h    ; dd far
SND_NEXT_SEG    equ     SND_HDR+02ah
SND_PREV        equ     SND_HDR+02ch    ; dd far
SND_PREV_SEG    equ     SND_HDR+02eh
SND_POOL_IDX    equ     SND_HDR+030h    ; word, x10 into SMEM_POOL, default 7FFFh
SND_FIELD_32    equ     SND_HDR+032h    ; word  ?
SND_FIELD_34    equ     SND_HDR+034h    ; word  ?

; XL stride 048h ?, PREV 03Eh ?, DIR_IDX 042h ?; nothing above 03Ah
; referenced, no stride multiply. SIZEOF_SND per-platform
