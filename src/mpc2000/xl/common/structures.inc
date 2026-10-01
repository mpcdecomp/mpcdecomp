; runs of source shared byte-for-byte by every version.  one macro per run,
; invoked where the run sits.  {GLOBALSYMBOLS} exports the body's labels
; (no comma before the brace).

SND_DD_00        equ    000h            ; dd  0 at runtime
SND_FP_04        equ    004h            ; dd  far ptr, pushed hi-then-lo as one
                                        ;   arg.  runtime 0582Bh:098DCh;
                                        ;   DS:098DCh points back here --
                                        ;   back-link ?
SND_B_08         equ    008h            ; db  read to al at 3 sites
SND_DD_0A        equ    00ah            ; dd  pushed as a pair with +0Ch.  runtime
                                        ;   low word 02280h
SND_FLAGS_0C     equ    00ch            ; dw  runtime 0001h
SND_FLAGS_HI     equ    00dh            ; db  == SND_FLAGS_0C high byte.
                                        ;   `test byte ptr es:[bx+0dh],1` at 18
                                        ;   sites; hottest field
SND_DD_0E        equ    00eh            ; dd  runtime 00000400h = 1024.
                                        ;   `lea ax,[bx+SND_NAME]`; passed with
                                        ;   the record ptr to the TRIM painter;
                                        ;   `sub ax,[+32h] / sbb dx,[+34h]`
SIZEOF_SND       equ    03eh            ; floor, not a measured size: >= 3Eh, no
                                        ;   stride multiply found ?


; ---- generic UI field descriptor, 42 bytes
FIELD_SIZE       equ    02ah
FIELD_X          equ    000h            ; db  value column, pixels
FIELD_Y          equ    001h            ; db  value row, pixels
FIELD_CLASS      equ    002h            ; db  widget/format class; 0A2h = pad/note
FIELD_DIGITS     equ    003h            ; db  digit count; 10^(n-1) lookup
FIELD_STORE      equ    004h            ; dw  flags:8 | width:8, not a step
FIELD_STORE_FLAGS equ   005h            ; db  == FIELD_STORE's high byte
FIELD_MIN        equ    006h            ; dd
FIELD_MAX        equ    00ah            ; dd
FIELD_THUNK      equ    00eh            ; dd  far ptr, the field's own thunk
; two of the four cursor links (FIELD_UP.. below):
; +12h/+16h/+1Ah/+1Eh = up/down/left/right, each holding the neighbour's
; FIELD_THUNK value, not the neighbour descriptor's address.  a chain walk over
; all 229 descriptors resolves and no two share a thunk.  kept as aliases.
FIELD_PREV       equ    012h            ; dd  == FIELD_UP
FIELD_NEXT       equ    016h            ; dd  == FIELD_DOWN
FIELD_NOTIFY     equ    022h            ; dd  far ptr, change notify, may be 0
FIELD_ENTER      equ    026h            ; dd  far ptr, screen-enter

; FIELD_STORE: one word read three ways.  0x3BDBE special-cases 4100h, the wheel
; handlers 4200h, the loader at 0x3C17C takes `and cx,0Fh` of the low byte as a
; byte count, 0x3BE28 tests FIELD_STORE_FLAGS bit 10h.  0001h (every mute field)
; = one unsigned byte; 4001h (Voice Overlap) = sign-extended.
FIELD_STORE_ALT_4100 equ   04100h        ; word: -> ui_field_engine_4100 (DS:1274h)
FIELD_STORE_ALT_4200 equ   04200h        ; word: wheel -> far 3E19:0A1AC


; ---- generic UI field descriptor: four CURSOR links
; FIELD_SIZE 02Ah (above); FIELD_PREV +12h, FIELD_NEXT +16h,
; +1Ah/+1Eh.
; consts.asm `handler_ids_post` = {18h -> 0x480F2, 19h -> 0x48118,
;   16h -> 0x4813E, 17h -> 0x48164} = src/common/window_macros.inc's
;   WIN_K_UP / WIN_K_DOWN / WIN_K_LEFT / WIN_K_RIGHT.
; those four addresses are byte-identical 38-byte (26h) routines; each only does
;   `les bx,[FE_DESC] / callf` the far ptr at +12h, +16h, +1Ah, +1Eh, in order.
; names below = the key that reaches each link.  FIELD_PREV/FIELD_NEXT stay as
; aliases.
FIELD_UP         equ    012h            ; dd  far ptr to the thunk of the CURSOR UP
                                        ;   target (= FIELD_PREV)
FIELD_DOWN       equ    016h            ; dd  CURSOR DOWN  (= FIELD_NEXT)
FIELD_LEFT       equ    01ah            ; dd  CURSOR LEFT
FIELD_RIGHT      equ    01eh            ; dd  CURSOR RIGHT
; FIELD_STORE (+4) low byte is two nibbles.  the loader reads `and cx,0Fh` as a
; byte count; the repainter at 0x47FEA does
; `mov di,es:[bx+4] / and di,0F0h / sar di,4` on the same byte.  high nibble is
; subtracted from the digit position when painted = digits after the point ?
FIELD_STORE_LOW_MASK  equ 00fh          ; byte count, per the loader at 0x3C17C
FIELD_STORE_FRAC_MASK equ 0f0h          ; >> 4; fractional digits  ?


; ---- 42-byte-stride FIELD_THUNK dispatch
; 64 sites: `imul <reg>,<cursor>,2Ah / callf [<reg>+<array>+0Eh]`
;   = `callf descriptor[cursor].FIELD_THUNK`.  displacement = array base +
;   FIELD_THUNK, record index in the register; inside the 752 references whose
;   displacement is >= 100h.
; the 47 distinct array bases agree with symbols.inc's 42 (cursor, array base)
; pairs on every one it has.  seven more -- DS:180Ch 1E20h 1FCEh 2882h 2C98h
; 44D2h 58ECh, spelt base+18h against a known base -- are unexplained; no name
; here depends on them.


; ---- PGM: program record, 099Eh bytes
; 38 sites `imul <reg>,<idx>,99Eh`.  array base = far ptr at DS:0989Ah, index =
; byte at DS:0D7BFh.  element 0 holds the default name "NewPgm-A        " at +2;
; slot-used test is `cmp byte ptr es:[bx+si+2],0`.
; the array itself: pgm_memory_init pushes DS:PGM_ARRAY_DS, rounds its linear
; address up to a paragraph and stores that paragraph:0010h at DS:0989Ah, then
; lays out PGM_COUNT records.  DS is DS_SEG, so the array moves with consts.
PGM_ARRAY_DS     equ    0d820h          ; also the end of c0's boot fill of the DS
                                        ;   variables (`mov cx,PGM_ARRAY_DS`)
PGM_COUNT        equ    24              ; `cmp di,17h / jle`
PGM_NOTES_OFS    equ    000h            ; dw  runtime 001Eh == PGM_NOTES, so
                                        ;   header size  ?
PGM_NAME         equ    002h            ; 16 chars, space padded; ==0 means the
                                        ;   slot is unused
PGM_NAME_LEN     equ    16
SIZEOF_PGM_NOTE  equ    018h            ; 24.  `imul ..,18h` at 10 sites; runtime
                                        ;   defaults repeat every 24 bytes from
                                        ;   +1Eh to +61Eh

; PGM_NOTES/PGM_MIX/PGM_PAD_NOTE/PGM_FX_SECTIONS/SIZEOF_PGM: see below, where
; fx_record.inc (SIZEOF_FXS/SIZEOF_FXR) and the shared skeleton run.

; ---- PGMMIX: per-program pad mix block, 0184h bytes
; 22 sites `imul <reg>,<idx>,184h` over the array at DS:09160h, indexed by the
; byte at DS:0D7BEh (symbols.inc MG_DRUM = drum 0..3 the pad UI is showing).
; 384 + 4 = 388 = 0184h.  runtime: four header bytes 00 01 01 7Fh then 64 copies
; of `64h 32h 64h 00 00 00`.
PGMMIX_ARRAY     equ    09160h          ; v1.20 address; moves between versions
PGMMIX_HDR       equ    000h            ; 4 bytes, 00 01 01 7Fh at runtime
PGMMIX_PADS      equ    004h            ; 64 x SIZEOF_PGMMIX_PAD
SIZEOF_PGMMIX_PAD equ   6               ; default 64h 32h 64h 00 00 00 = 100 50 100
SIZEOF_PGMMIX    equ    184h            ; == 4 + 64*6


; ---- R6480: object behind the far ptr at DS:06480h
; 79 refs in c0 and c2 (35 soundly scoped).  runtime the ptr is 07C00h:00000h =
; linear 07C000h, fixed RAM c1 also reaches with `mov bx,7c00h / mov es,bx`.
; shape only, purpose unknown: 256-byte buffer at `lea di,[bx+62h]`, write index
; right after it at +162h, 32-bit accumulator at +6/+8 (`add [+6],ax /
; adc [+8],dx`), second counter pair +1E4h/+1E5h touched by one routine.
R6480_B_00       equ    000h            ; db  `cmp ...,0`
R6480_W_02       equ    002h            ; dw  4R/4W
R6480_W_04       equ    004h            ; dw  `inc word ptr [+4]` -- a counter
R6480_DD_06      equ    006h            ; dd  32-bit accumulator, 0W-only at 6
                                        ;   sites: `add [+6],ax / adc [+8],dx`
R6480_W_0A       equ    00ah            ; dw
R6480_W_0C       equ    00ch            ; dw
R6480_W_0E       equ    00eh            ; dw
R6480_W_10       equ    010h            ; dw  written 28h and 0
R6480_BUF        equ    062h            ; 256 bytes; `lea di,[bx+R6480_BUF]`
R6480_BUF_LEN    equ    256             ; = R6480_IDX - R6480_BUF
R6480_IDX        equ    162h            ; db  `inc byte ptr [+162h]`, compared to al
R6480_B_163      equ    163h            ; db
R6480_CNT2       equ    1e4h            ; db  `inc byte ptr [+1e4h]`
R6480_FLAG2      equ    1e5h            ; db  written 0/1


; ---- R8B4A: record behind the far ptr at DS:08B4Ah (c2)
; 39 refs.  offsets +0/+2, +0Ah/+0Ch, +0Eh/+10h, +25h, +26h/+28h, +2Ah/+2Ch,
; +2Eh/+30h are a subset of SND's, including SND's +25h byte flag and its four
; 32-bit slots: a second pointer to a SND record, a source or previously
; selected sample  ?  DS:08B4Ah is still 0CCh fill at 188M instructions, so no
; runtime value to check; left as its own names rather than SND_*.
R8B4A_DD_00      equ    000h            ; dd  compared against a 32-bit value
R8B4A_DD_0A      equ    00ah            ; dd  8 refs, `mov`/`add` pairs
R8B4A_DD_0E      equ    00eh            ; dd  7 refs
R8B4A_B_25       equ    025h            ; db  written 1
R8B4A_DD_26      equ    026h            ; dd
R8B4A_DD_2A      equ    02ah            ; dd
R8B4A_DD_2E      equ    02eh            ; dd


; ---- saved-descriptor pointer at DS:08C18h
; all 26 refs are `mov ax,es:[bx+22h] / mov dx,es:[bx+24h]`.  0x4AC96 sets it
; with `mov cx,15h / rep movsw` -- 15h words = 2Ah bytes = FIELD_SIZE -- copying
; a descriptor to the scratch at DS:08C1Ch and saving the source far ptr at
; DS:08C18h.  so a second FIELD descriptor pointer, and those 26 refs are
; FIELD_NOTIFY (+22h) reads.  use FIELD_NOTIFY.

; ---- sound record, shared with MPC2000.SYS
; fields above this line are the XL's own 012h-byte header, which the 2K has no
; counterpart for.  from the name onward the record is the same.
SND_HDR         equ     012h
        include "../../common/sound_record.inc"

; ---- EB-16 records, shared with MPC2000.SYS
        include "../../common/fx_record.inc"

; the program record's own layout -- shared skeleton with MPC2000.SYS
; (program_record.inc): a 01Eh header, then notes/mix/padmap/FX-sections/
; FX-reverbs back to back.  kept inside the program record: `imul cx,ax,48h`
; (FX section stride) beside `imul dx,si,99eh` (SIZEOF_PGM), both added to the
; same far base plus 08deh -- confirms PGM_FX_SECTIONS without the skeleton.
;
; PGM_FX_REVERBS (96Eh): the 2K's record has a reverb array right after its
; FX sections, and so does this one -- c1's RUN_X_3F71A and c2's reverb-field
; routines compute `si*3 shl 2` (= si*0Ch) then `add ax,96Eh`, the 2K
; channel_get_ptr's index shape for the same array.
PGM_FX_GAP       equ    0100h            ; the 2K has none; +7DEh..+8DEh here
        include "../../common/program_record.inc"
PGM_PAD_NOTE     equ    PGM_PADMAP       ; alias: this file's established name
