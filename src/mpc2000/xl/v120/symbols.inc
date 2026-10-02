; data addresses the UI reaches through, named so a feature can move them.
; every value is a DS:582Bh offset unless noted.

; same two-object model as the 2K: draw list + key/handler table, 5-byte
; records, key = raw panel code + 1.  dispatcher is INT 8Fh (2K: 2Eh/30h).
        include "../../common/window_macros.inc"
        include "../../common/assert_at.inc"

; ---- field-engine state block, latched by 0x3BDBE
FE_SCALE         equ    08b26h          ; dd 10^(FIELD_DIGITS-1), from POW10_TABLE
FE_PENDING       equ    08b2ah          ; dd value being typed, pre-commit

; handler-id sets, installed through far 3E19:0724 (= 0x3E8B4, `les bp,[bp+6] /
; int 30h`).  a set is {db id, dd far32} entries ended by a zero entry.
HANDLERS_NUMERIC equ    01224h          ; flash 0x594D4, installed when editable
HANDLERS_POST    equ    0120ah          ; flash 0x594BA, always installed
HANDLERS_RDONLY  equ    0124ch          ; flash 0x594FC, null value ptr -> no-ops
POW10_TABLE      equ    00464h          ; dd[9], 1..10^8, flash 0x58714

; ---- per-screen field arrays
; each screen owns an array of FIELD_SIZE descriptors, a cursor word, and a
; dispatcher that far-calls descriptor[cursor]+FIELD_THUNK.  adding a field means
; growing the array, impossible in place -- hence MUTE_FIELDS.
PARAMS_FIELDS    equ    02f6ah          ; flash 0x5B21A, 9 fields (note PARAMS)
PARAMS_CURSOR    equ    08d66h
PARAMS_FIELD_COUNT equ  9
PGM_ASSIGN_FIELDS equ   02c8eh          ; flash 0x5AF3E, 8 fields (PROGRAM mode)
PGM_ASSIGN_CURSOR equ   08d5eh
MAIN_PGM_FIELDS  equ    02d8ah          ; flash 0x5B03A, MAIN screen Pgm field ?
FILTER_FIELDS    equ    03a78h          ; flash 0x5BD28, 6 fields
FILTER_CURSOR    equ    08d7ah
TS_SCREEN_FIELDS equ    0268ch          ; flash 0x5A93C, 8 fields
TS_CURSOR        equ    08d56h
TS_FIELD_RATIO   equ    TS_SCREEN_FIELDS+5*FIELD_SIZE   ; 0275Eh, flash 0x5AA0E
TS_FIELD_PRESET  equ    TS_SCREEN_FIELDS+6*FIELD_SIZE   ; 02788h, flash 0x5AA38
TS_FIELD_ADJUST  equ    TS_SCREEN_FIELDS+7*FIELD_SIZE   ; 027B2h, flash 0x5AA62
SAVE_PGM_FIELDS  equ    00a82h          ; flash 0x58D32, cursor 08B0Ch
SAVE_APS_FIELDS  equ    00bd8h          ; flash 0x58E88, cursor 08B12h
SAVE_SND_FIELDS  equ    00e38h          ; flash 0x590E8, cursor 08B14h
BPM_MATCH_FIELDS equ    06b02h          ; flash 0x5EDB2, cursor 08E52h

; all 42 (cursor, array base) pairs in the OS.  every field's activation thunk
; has one shape, at 246 sites: `mov word [<cursor>],<index> / push <val far> /
; push <desc far> / callf 35B0:62BE / add sp,8 / retf`.
;   cursor base    cursor base    cursor base    cursor base    cursor base
;   05330h 5324h  08B0Ch 0A82h  08B12h 0BD8h  08B14h 0E38h  08B18h 10DCh
;   08B56h 1438h  08C14h 1712h  08C16h 1802h  08C46h 1998h  08D24h 1AA0h
;   08D26h 1BA8h  08D28h 1CDAh  08D2Ah 1E16h  08D2Ch 1FC4h  08D32h 2294h
;   08D34h 23A8h  08D36h 2484h  08D4Ah 2534h  08D56h 268Ch  08D58h 2878h
;   08D5Ah 29C8h  08D5Ch 2A98h  08D5Eh 2C8Eh  08D66h 2F6Ah  08D68h 319Ch
;   08D6Eh 33D2h  08D70h 3592h  08D76h 37EEh  08D78h 391Eh  08D7Ah 3A78h
;   08D7Ch 3BE6h  08D80h 3DA8h  08D88h 4066h  08D8Eh 4240h  08D92h 46CAh
;   08D9Ah 554Eh  08DA4h 5718h  08DBCh 644Ah  08E50h 65B4h  08E52h 6B02h
;   095F2h 44C8h  09600h 4C2Eh
; 09600h shared by four screens (4C2Eh 4D68h 4F12h 50B2h); 05330h sits inside
; its own array's range -- probably a bad read.

        include "../common/feat/defs.inc"
