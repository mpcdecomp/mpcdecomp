; DATA segment (DATA_SEG), ends with 16-byte version stamp (set by FW_VERSION).
; Tables, strings, BSS; 5707 bytes v1.72 (79/606/5530 v1.50).
;
; Window display lists via bytecode VM, INT 2Eh with ES:BP at list.
; Wrapper at TEXT1 1E0Eh. Dispatcher (EXE 0x1547B): fetch byte, 00 stops,
; call CS:[4D8Dh+2*op]. 39 handlers (opcodes 00h-26h). INT 2Bh remaps
; (30/39 same handler, same VM):
;
;   00/01 = 2b 0c   02 = 2b 04   03 = 2b 06   04 = 2b 08   05 = 2b 02
;   07 = 2b 0e   08 = 2b 10   09 = 2b 2a   0a = 2b 2c
;   0b = 2b 50   0c = 2b 54   0d = 2b 58   0e = 2b 52   0f = 2b 56   10 = 2b 5a
;   11 = 2b 5c   12 = 2b 5e   13 = 2b 60   14 = 2b 62
;   18 = 2b 20   19 = 2b 22   1a = 2b 68   1b = 2b 6e   1c = 2b 70   1d = 2b 72
;   20 = 2b 6a   21 = 2b 6c   22 = 2b 76   24 = 2b 4e
;
; Nine unique opcodes at CS 4DBDh-4EB8h:
;
;   06                        set flag, no operands
;   15 x,y,byte               byte as two hex digits
;   16 x,y,word               word as four hex digits
;   17 sel,...                numeric field; sel picks digit count and value
;                             width: 0-2 byte, 3-4 word, 5-8 dword
;                             (record: 4/5/7 bytes)
;   1e x,y,off,seg            asciiz at far pointer
;   1f x,y,off,seg            1e with attr 0FCh
;   23 "text",0               message, wait for key
;   25 x,y,sel                one of five built-in bitmaps  ; ?
;   26 x,y,off,seg            nested list at far pointer
;
; Records:
;
;   22h x,y,w,h,"title",0     framed window, title centred in the top edge
;   1ah fkey,style,"label",0  soft key, fkey 1-6; style 0 plain 1 box 2 filled,
;                             the same three the EXE's 68h takes
;   07h x,y,"text",0          text at a pixel position
;   0bh-10h x,y,len           ; ?  pixel runs -- rules and separators
;   01h / 02h                 clear the three planes / reset the pen
;
; 82 lists, 618 records: 233 07h text, 149 soft keys, 40 windows, 11 bitmaps.
;
; Title leading byte is geometry: ':' h=58, '6' h=54. Prologue clamps x to
; 0F8h, y to 3Ch (248x60). Coordinates as numbers; text quoted.

; the PGM record's FX defaults (common/pgm_record.inc): FXS 48h, then FXR 0Ch
FXS_DEFAULT:
        db      0d0h, 07h, 00h, 00h, 63h, 01h
        db      14h, 08h, 1dh, 0fch, 32h, 33h, 02h, 32h, 3ch, 08h, 05h, 0ah, 14h, 14h, 32h, 00h
        db      00h, 02h, 0fh, 19h, 00h, 05h, 41h, 14h, 1eh, 01h, 05h, 00h, 00h, 05h, 63h, 00h
        db      0f4h, 0ffh, 0ch, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 02h, 00h, 4fh, 01h, 4fh, 01h
        db      00h, 42h, 4fh, 01h, 00h, 42h, 4fh, 01h, 00h, 42h, 32h, 00h, 63h, 28h, 00h, 3ch
        db      00h, 00h
FXR_DEFAULT:
        db      00h, 00h, 32h, 00h, 23h, 00h, 3eh, 33h, 5ah, 32h, 14h, 00h
W_005E:
        db      00h, 00h
P_0060:
        WIN_RULE  0bh, 00h, 00h, 23h
        WIN_OP4   12h, 23h, 01h, 02h, 0ah
        WIN_RULE  0ch, 00h, 0ah, 23h
        WIN_RULE  0bh, 23h, 0ah, 23h
        WIN_OP4   12h, 0f6h, 0bh, 02h, 27h
        WIN_RULE  0eh, 00h, 01h, 30h
        WIN_OP4   12h, 01h, 30h, 0f7h, 02h
        WIN_END
        ifdef   GROWTH_PROOF
GROWTH_DATA:
        db      GROWTH_PROOF dup (00h)
        endif
TBL_WINKEYS_00080:                      ; 13 records + WIN_KEY_END
        WIN_KEY_CLEAR
        WIN_KEY   14h, TEXT1_SEG, win_key_nop_stub
        WIN_KEY   48h, TEXT1_SEG, win_key_nop_stub
        WIN_KEY   49h, TEXT1_SEG, win_key_nop_stub
        WIN_KEY   4ah, TEXT1_SEG, win_key_nop_stub
        WIN_KEY   4bh, TEXT1_SEG, win_key_nop_stub
        WIN_KEY   4ch, TEXT1_SEG, win_key_nop_stub
        WIN_KEY   4dh, TEXT1_SEG, win_key_nop_stub
        WIN_KEY   4eh, TEXT1_SEG, win_key_nop_stub
        WIN_KEY   4fh, TEXT1_SEG, win_key_nop_stub
        WIN_KEY   50h, TEXT1_SEG, win_key_nop_stub
        WIN_KEY   51h, TEXT1_SEG, win_key_nop_stub
        WIN_KEY   5ah, TEXT1_SEG, win_key_nop_stub
        WIN_KEY_END
STR_00C6:
        db      53h, 33h, 20h, 00h
STR_00CA:
        db      53h, 31h, 20h, 00h
STR_00CE:
        db      53h, 4eh, 44h
        db      00h
STR_00D2:
        db      57h, 41h, 56h, 00h
STR_00D6:
        db      50h, 47h, 4dh, 00h
STR_00DA:
        db      41h, 50h, 53h, 00h
STR_00DE:
        db      52h, 4ch, 44h
        db      00h
STR_00E2:
        db      45h, 4dh, 55h, 00h
STR_00E6:
        db      53h, 45h, 54h, 00h
STR_00EA:
        db      53h, 54h, 31h, 00h
TBL_00EE:
        dw      STR_00C6, DATA_SEG
        dw      lcd_area_wrapper_2, TEXT1_SEG
        dw      STR_00CA, DATA_SEG
        dw      lcd_area_wrapper_1, TEXT1_SEG
        dw      STR_00CE, DATA_SEG
        dw      sample_ptr_caller, TEXT2_SEG
        dw      STR_00D2, DATA_SEG
        dw      status_read_multi, TEXT1_SEG
        dw      STR_00D6, DATA_SEG
        dw      midi_realtime_stop, TEXT2_SEG
        dw      STR_00DA, DATA_SEG
        dw      midi_realtime_stop2, TEXT2_SEG
        dw      STR_00DE, DATA_SEG
        dw      seq_event_handler, TEXT1_SEG
TBL_NAME_CHARSET:
        dw      STR_00E2, DATA_SEG
        dw      smem_access_handler_1, TEXT1_SEG
        dw      STR_00E6, DATA_SEG
        dw      midi_string_handler, TEXT2_SEG
        dw      STR_00EA
        db      DATA_SEG & 0ffh
TBL_WINKEYS_00139:                      ; 1 records + WIN_KEY_END
        WIN_KEY   DATA_SEG >> 8, TEXT2_SEG, midi_string_handler
        WIN_KEY_END
        db      00h, 00h, 00h, 20h, 21h, 2ah, 23h, 24h, 25h, 26h, 27h
        db      "()***-**01234567"
        db      "89******@ABCDEFG"
        db      "HIJKLMNOPQRSTUVW"
        db      "XYZ****_*abcdefg"
        db      "hijklmnopqrstuvw"
        db      "xyz{*}**", 000h, 000h
STR_01A8:
        if      FW_VERSION = 172
        db      "Unknow"
        db      "n error", 000h
        else
        db      55h, 6eh, 6bh
        db      6fh, 77h
        db      6eh, 20h, 65h, 72h, 72h, 6fh, 72h
        db      00h
        db      00h
        endif
STR_01B6:
        db      "not enou"
        db      "gh memory", 000h
STR_01C8:
        db      "disk r"
        db      "ead error", 000h
STR_01D8:
        db      "disk w"
        db      "rite error", 000h, 000h
STR_01EA:
        db      "File"
        db      " is damaged", 000h
STR_01FA:
        db      "Inte"
        db      "rnal error", 000h, 000h
STR_020A:
        db      "Disk"
        db      " requires newer "
        db      04fh, 053h, 021h, 000h
STR_0222:
        db      "Unknown file"
        db      " type", 000h
STR_0234:
        db      "Name alrea"
        db      "dy used", 000h
STR_0246:
        db      "Sound di"
        db      "rectory full(128"
        db      "max)", 000h, 000h
STR_0264:
        db      "Prog. dire"
        db      "ctory full(24 ma"
        db      078h, 029h, 000h, 000h
STR_0282:
        db      "No digital s"
        db      "ignal carrier", 000h
STR_029C:
        db      043h, 061h
        db      "n't open file", 000h
STR_02AC:
        db      046h, 069h
        db      "le already exist"
        db      073h, 000h
STR_02C0:
        db      "Can't remove f"
        db      069h, 06ch, 065h, 000h
STR_02D2:
        db      "Disk is writ"
        db      "e protected", 000h
STR_02EA:
        db      "Insu"
        db      "fficient disk sp"
        db      061h, 063h, 065h, 000h
STR_0302:
        db      "Wrong disk f"
        db      "ormat", 000h
STR_0314:
        if      FW_VERSION = 172
        db      "Unknown fi"
        db      "le format", 000h, "Unexpe"
        db      "cted end-of-file"
        db      000h, 000h
        else
        db      55h, 6eh, 6bh
        db      6fh, 77h, 6eh, 20h, 66h, 69h
        db      6ch, 65h, 20h, 66h, 6fh, 72h, 6dh, 61h, 74h, 00h
        db      00h
        endif
STR_0340:
        if      FW_VERSION = 172
        db      "Unknown error", 000h
        else
        db      55h, 6eh, 6bh
        db      6fh, 77h, 6eh, 20h, 65h, 72h, 72h, 6fh, 72h, 00h
        db      00h
        endif
ERR_MSG_TABLE:
        dw      STR_01A8, DATA_SEG
        dw      STR_01B6, DATA_SEG
        dw      STR_01C8, DATA_SEG
        dw      STR_01D8, DATA_SEG
        dw      STR_01EA, DATA_SEG
        dw      STR_01FA, DATA_SEG
        dw      STR_020A, DATA_SEG
        dw      STR_0222, DATA_SEG
        dw      STR_0234, DATA_SEG
        dw      STR_0246, DATA_SEG
        dw      STR_0264, DATA_SEG
        dw      STR_0282, DATA_SEG
        dw      STR_029C, DATA_SEG
        dw      STR_02AC, DATA_SEG
        dw      STR_02C0, DATA_SEG
        dw      STR_02D2, DATA_SEG
        dw      STR_02EA, DATA_SEG
        dw      STR_0302, DATA_SEG
        dw      STR_0314, DATA_SEG
        dw      STR_0340, DATA_SEG
G_ERRNO:
        db      00h, 00h
SYS_BUILD_DATE:
        if      FW_VERSION = 172
        db      "May 14 1999 18"
        db      3ah, 34h, 36h, 3ah, 33h, 30h, 00h, 00h
        else
        db      53h, 65h, 70h, 20h, 31h, 39h, 20h, 31h, 39h, 39h, 37h, 20h
        db      32h, 30h, 3ah
        db      31h, 32h
        db      3ah
        db      35h, 31h
        db      00h, 00h
        endif
SYS_PRODUCT_NAME:
        db      "MPC2000 "
        db      20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 00h
P_03C7:
        db      00h
P_03C8:
        WIN_CLEAR
        WIN_RESET_PEN
        WIN_SOFTKEY 1, 2, "MEM"
        WIN_SOFTKEY 2, 2, "PAD"
        WIN_SOFTKEY 3, 2, "FLASH"
        WIN_SOFTKEY 4, 2, "8PARA"
        WIN_SOFTKEY 5, 2, "SMPTE"
        WIN_SOFTKEY 6, 2, "DATE"
        WIN_END
TBL_WINKEYS_003FC:                      ; 7 records + WIN_KEY_END
P_03FC:
        WIN_CLEAR
        WIN_END
        db      00h, 00h, 00h
        WIN_KEY   WIN_K_F1, TEXT2_SEG, L_00DA6
        WIN_KEY   WIN_K_F2, TEXT2_SEG, int45_wrapper
        WIN_KEY   WIN_K_F3, TEXT2_SEG, disk_media_check
        WIN_KEY   WIN_K_F4, TEXT2_SEG, X_00B3E
        WIN_KEY   WIN_K_F5, TEXT2_SEG, t2_int46_wrapper
        WIN_KEY   WIN_K_F6, TEXT2_SEG, X_00AF2
        WIN_KEY_END
DL_REC_OUT_8PARA:
        WIN_OP4   11h, 00h, 00h, 56h, 09h
        WIN_LABEL_FC 01h, 01h, "REC OUT(8PARA)"
        WIN_SOFTKEY 4, 0, "8PARA"
        WIN_LABEL 1fh, 13h, "out to individual:"
        WIN_END
        db      00h
STR_FLASH_TEST_STATUS:
        db      25h, 20h, 4dh
        db      3ah, 25h, 25h, 25h, 25h, 20h, 44h, 3ah, 00h
DL_FLASH_MEMORY_TEST:
        WIN_OP4   11h, 00h, 00h, 86h, 09h
        WIN_LABEL_FC 01h, 01h, "FLASH FILE MEMORY TEST"
        WIN_SOFTKEY 3, 0, "FLASH"
        WIN_SOFTKEY 6, 1, "GO"
        WIN_END
STR_NOW_TESTING:
        db      6eh, 6fh, 77h, 20h, 74h, 65h, 73h, 74h
        db      069h, 06eh, 067h, 000h
STR_BLOCK:
        db      "block:", 000h
STR_FLASH_WRITE_ERROR:
        db      "flash"
        db      " write error", 000h
STR_FLASH_VERIFY_ERROR:
        db      066h, 06ch, 061h
        db      "sh verify error", 000h
STR_FLASH_MEMORY_OK:
        db      "flash memory OK", 000h
STR_FLASH_CARD_NOT_FOUND:
        db      "flash card is NO"
        db      54h, 20h, 66h, 6fh, 75h, 6eh, 64h, 00h, 00h
TBL_WINKEYS_004F8:                      ; 2 records + WIN_KEY_END
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, cmd_dispatch_handler_1
        WIN_KEY   WIN_K_F6, TEXT2_SEG, flash_test_go_handler
        WIN_KEY_END
STR_TESTING_MEMORY:
        db      54h, 65h, 73h, 74h, 69h, 6eh, 67h, 20h, 4dh, 65h, 6dh
        db      "ory...", 000h
STR_OKAY:
        db      "okay", 000h
STR_FAIL:
        db      "fail"
        db      000h, 000h
DL_WAVE_MEMORY_TEST:
        db      002h, 011h, 000h, 000h, 062h, 009h, 008h, 001h, 001h, "WAVE "
        db      "MEMORY TEST", 000h, 007h, 013h, 00ah, 04dh
        db      "word  recognized"
        db      2eh, 00h, 1ah, 01h, 00h, 4dh, 45h, 4dh, 00h, 1ah, 06h, 01h, 47h, 4fh, 00h, 00h
TBL_WINKEYS_00562:                      ; 2 records + WIN_KEY_END
        WIN_KEY   WIN_K_F6, TEXT1_SEG, L_02420
        WIN_KEY   WIN_K_PAINT, TEXT1_SEG, system_setup_2
        WIN_KEY_END
        db      00h
        if      FW_VERSION = 172
P_0572:
        WIN_RESET_PEN
        WIN_OP4   11h, 00h, 00h, 62h, 09h
        WIN_LABEL_FC 01h, 01h, "WAVE MEMORY TEST"
        WIN_SOFTKEY 1, 0, "MEM"
        WIN_LABEL 07h, 0ah, "Detecting Wave Memory..."
        WIN_SOFTKEY 6, 1, "GO"
        WIN_END
STR_05B6:
        db      6eh, 6fh, 20h, 77h, 61h, 76h
        db      65h, 20h, 72h, 61h, 6dh, 21h, 00h, 00h
        endif
TBL_WINKEYS_005C4:                      ; 5 records + WIN_KEY_END
        WIN_KEY_CLEAR
        WIN_KEY   4ch, TEXT1_SEG, X_06A62
        WIN_KEY   4dh, TEXT2_SEG, X_085E6
        WIN_KEY   4eh, TEXT2_SEG, pgm_assign_key
        WIN_KEY   4fh, TEXT2_SEG, L_0684A
        WIN_KEY_END
G_PORT_C2_SHADOW:
        db      00h, 00h
P_05E4:
        db      00h, 00h, 00h, 00h, 00h, 01h, 00h, 10h, 00h
        db      10h, 00h, 00h, 00h, 0c0h, 00h, 40h, 00h, 00h, 00h, 00h, 24h, 0fah, 00h, 00h, 00h
        db      00h, 00h, 00h, 24h, 0fah, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h
P_0610:
        db      01h
TBL_0611:
        db      00h
TBL_0612:
        db      00h, 00h
FP_POLL_HOOK:
        db      00h, 00h
FP_POLL_HOOK_SEG:
        db      00h, 00h
        dw      0400h, 0406h, 040ch, 0412h, 0418h, 041eh, 0424h, 042ah
        dw      0430h, 0437h, 043dh, 0443h, 0449h, 0450h, 0456h, 045dh
        dw      0463h, 046ah, 0470h, 0477h, 047dh, 0484h, 048bh, 0491h
        dw      0498h, 049fh, 04a6h, 04adh, 04b4h, 04bbh, 04c2h, 04c9h
        dw      04d0h, 04d7h, 04deh, 04e5h, 04edh, 04f4h, 04fbh, 0503h
        dw      050ah, 0512h, 0519h, 0521h, 0528h, 0530h, 0538h, 053fh
        dw      0547h, 054fh, 0557h, 055fh, 0567h, 056fh, 0577h, 057fh
        dw      0587h, 058fh, 0598h, 05a0h, 05a8h, 05b1h, 05b9h, 05c1h
        dw      05cah, 05d3h, 05dbh, 05e4h, 05edh, 05f5h, 05feh, 0607h
        dw      0610h, 0619h, 0622h, 062bh, 0634h, 063eh, 0647h, 0650h
        dw      0659h, 0663h, 066ch, 0676h, 067fh, 0689h, 0693h, 069dh
        dw      06a6h, 06b0h, 06bah, 06c4h, 06ceh, 06d8h, 06e2h, 06edh
        dw      06f7h, 0701h, 070ch, 0716h, 0721h, 072bh, 0736h, 0740h
        dw      074bh, 0756h, 0761h, 076ch, 0777h, 0782h, 078dh, 0798h
        dw      07a4h, 07afh, 07bah, 07c6h, 07d1h, 07ddh, 07e8h, 07f4h
P_0708:
        dw      0800h, 080ch, 0818h, 0824h, 0830h, 083ch, 0848h, 0855h
        dw      0861h, 086dh, 087ah, 0886h, 0893h, 08a0h, 08ach, 08b9h
        dw      08c6h, 08d3h, 08e0h, 08eeh, 08fbh, 0908h, 0916h, 0923h
        dw      0931h, 093eh, 094ch, 095ah, 0968h, 0975h, 0983h, 0992h
        dw      09a0h, 09aeh, 09bch, 09cbh, 09d9h, 09e8h, 09f7h, 0a05h
        dw      0a14h, 0a23h, 0a32h, 0a41h, 0a51h, 0a60h, 0a6fh, 0a7fh
        dw      0a8eh, 0a9eh, 0aaeh, 0abeh, 0aceh, 0adeh, 0aeeh, 0afeh
        dw      0b0eh, 0b1fh, 0b2fh, 0b40h, 0b50h, 0b61h, 0b72h, 0b83h
        dw      0b94h, 0ba5h, 0bb6h, 0bc8h, 0bd9h, 0bebh, 0bfdh, 0c0eh
        dw      0c20h, 0c32h, 0c44h, 0c56h, 0c69h, 0c7bh, 0c8eh, 0ca0h
        dw      0cb3h, 0cc6h, 0cd9h, 0cech, 0cffh, 0d12h, 0d26h, 0d39h
        dw      0d4dh, 0d60h, 0d74h, 0d88h, 0d9ch, 0db1h, 0dc5h, 0dd9h
        dw      0deeh, 0e02h, 0e17h, 0e2ch, 0e41h, 0e56h, 0e6ch, 0e81h
        dw      0e96h, 0each, 0ec2h, 0ed8h, 0eeeh, 0f04h, 0f1ah, 0f31h
        dw      0f47h, 0f5eh, 0f74h, 0f8bh, 0fa2h, 0fbah, 0fd1h, 0fe8h
TBL_PITCH_RATIO:
        dw      1000h, 1018h, 1030h, 1048h, 1060h, 1078h, 1090h, 10a9h
        dw      10c2h, 10dbh, 10f4h, 110dh, 1126h, 113fh, 1159h, 1173h
        dw      118dh, 11a7h, 11c1h, 11dbh, 11f6h, 1210h, 122bh, 1246h
        dw      1261h, 127ch, 1298h, 12b3h, 12cfh, 12ebh, 1307h, 1323h
        dw      1340h, 135ch, 1379h, 1396h, 13b3h, 13d0h, 13edh, 140bh
        dw      1429h, 1447h, 1465h, 1483h, 14a1h, 14c0h, 14dfh, 14feh
        dw      151dh, 153ch, 155ch, 157bh, 159bh, 15bbh, 15dbh, 15fch
        dw      161ch, 163dh, 165eh, 167fh, 16a1h, 16c2h, 16e4h, 1706h
        dw      1728h, 174ah, 176dh, 1790h, 17b3h, 17d6h, 17f9h, 181dh
        dw      1840h, 1864h, 1889h, 18adh, 18d1h, 18f6h, 191bh, 1941h
        dw      1966h, 198ch, 19b2h, 19d8h, 19feh, 1a25h, 1a4bh, 1a72h
        dw      1a9ah, 1ac1h, 1ae9h, 1b11h, 1b39h, 1b61h, 1b8ah, 1bb2h
        dw      1bdch, 1c05h, 1c2eh, 1c58h, 1c82h, 1cadh, 1cd7h, 1d02h
        dw      1d2dh, 1d58h, 1d84h, 1dafh, 1ddbh, 1e08h, 1e34h, 1e61h
        dw      1e8eh, 1ebbh, 1ee9h, 1f17h, 1f45h, 1f73h, 1fa2h, 1fd1h
        dw      2000h, 202fh, 205fh, 208fh, 20bfh, 20f0h, 2121h, 2152h
        dw      2183h, 21b5h, 21e7h, 2219h, 224ch, 227fh, 22b2h, 22e5h
        dw      2319h, 234dh, 2382h, 23b6h, 23ebh, 2420h, 2456h, 248ch
        dw      24c2h, 24f9h, 252fh, 2567h, 259eh, 25d6h, 260eh, 2646h
        dw      267fh, 26b8h, 26f2h, 272bh, 2766h, 27a0h, 27dbh, 2816h
        dw      2851h, 288dh, 28c9h, 2906h, 2943h, 2980h, 29bdh, 29fbh
        dw      2a39h, 2a78h, 2ab7h, 2af6h, 2b36h, 2b76h, 2bb7h, 2bf7h
        dw      2c39h, 2c7ah, 2cbch, 2cffh, 2d41h, 2d84h, 2dc8h, 2e0ch
        dw      2e50h, 2e95h, 2edah, 2f1fh, 2f65h, 2fabh, 2ff2h, 3039h
        dw      3081h, 30c9h, 3111h, 315ah, 31a3h, 31edh, 3237h, 3281h
        dw      32cch, 3317h, 3363h, 33afh, 33fch, 3449h, 3497h, 34e5h
        dw      3533h, 3582h, 35d1h, 3621h, 3671h, 36c2h, 3713h, 3765h
        dw      37b7h, 380ah, 385dh, 38b0h, 3904h, 3959h, 39aeh, 3a04h
        dw      3a5ah, 3ab0h, 3b07h, 3b5fh, 3bb7h, 3c0fh, 3c68h, 3cc2h
        dw      3d1ch, 3d77h, 3dd2h, 3e2eh, 3e8ah, 3ee7h, 3f44h, 3fa2h
        dw      4000h
TBL_09DA:
        dw      0000h, 0001h, 0002h, 0005h, 0008h, 000dh, 0012h, 0019h
        dw      0020h, 0029h, 0032h, 003dh, 0048h, 0055h, 0062h, 0071h
        dw      0080h, 0091h, 00a2h, 00b5h, 00c8h, 00ddh, 00f2h, 0109h
        dw      0120h, 0139h, 0152h, 016dh, 0188h, 01a5h, 01c2h, 01e1h
        dw      0200h, 0221h, 0242h, 0265h, 0288h, 02adh, 02d2h, 02f9h
        dw      0320h, 0349h, 0372h, 039dh, 03c8h, 03f5h, 0422h, 0451h
        dw      0480h, 04b1h, 04e2h, 0515h, 0548h, 057dh, 05b2h, 05e9h
        dw      0620h, 0659h, 0692h, 06cdh, 0708h, 0745h, 0782h, 07c1h
        dw      0800h, 0841h, 0882h, 08c5h, 0908h, 094dh, 0992h, 09d9h
        dw      0a20h, 0a69h, 0ab2h, 0afdh, 0b48h, 0b95h, 0be2h, 0c31h
        dw      0c80h, 0cd1h, 0d22h, 0d75h, 0dc8h, 0e1dh, 0e72h, 0ec9h
        dw      0f20h, 0f79h, 0fd2h, 102dh, 1088h, 10e5h, 1142h, 11a1h
        dw      1200h, 1261h, 12c2h, 1325h, 1388h
TBL_0AA4:
        dw      0000h, 000ah, 0015h, 001fh, 0029h, 0033h, 003dh, 0048h
        dw      0052h, 005ch, 0066h, 0070h, 007ah, 0084h, 008eh, 0098h
        dw      00a2h, 00ach, 00b6h, 00c0h, 00cah, 00d3h, 00ddh, 00e7h
        dw      00f0h, 00fah, 0103h, 010dh, 0116h, 011fh, 0128h, 0131h
        dw      013ah, 0143h, 014ch, 0155h, 015eh, 0166h, 016fh, 0177h
        dw      0180h, 0188h, 0190h, 0198h, 01a0h, 01a8h, 01b0h, 01b7h
        dw      01bfh, 01c6h, 01ceh, 01d5h, 01dch, 01e3h, 01eah, 01f0h
        dw      01f7h, 01fdh, 0204h, 020ah, 0210h, 0216h, 021ch, 0222h
        dw      0227h, 022dh, 0232h, 0237h, 023ch, 0241h, 0246h, 024ah
        dw      024fh, 0253h, 0257h, 025bh, 025fh, 0263h, 0266h, 026ah
        dw      026dh, 0270h, 0273h, 0276h, 0278h, 027bh, 027dh, 027fh
        dw      0281h, 0283h, 0285h, 0286h, 0288h, 0289h, 028ah, 028bh
        dw      028ch, 028ch, 028ch, 028dh
P_0B6C:
        dw      028dh
TBL_0B6E:
        dw      00a4h, 00ach, 00b4h, 00bch, 00c5h, 00ceh, 00d8h, 00e2h
        dw      00edh, 00f8h, 0104h, 0110h, 011dh, 012ah, 0138h, 0147h
        dw      0156h, 0166h, 0177h, 0189h, 019ch, 01afh, 01c3h, 01d8h
        dw      01efh, 0206h, 021eh, 0238h, 0253h, 026fh, 028ch, 02abh
        dw      02cbh, 02edh, 0310h, 0335h, 035ch, 0384h, 03afh, 03dbh
        dw      040ah, 043ah, 046dh, 04a3h, 04dbh, 0515h, 0553h, 0593h
        dw      05d6h, 061dh, 0666h, 06b4h, 0704h, 0759h, 07b2h, 080eh
        dw      0870h, 08d5h, 0940h, 09b0h, 0a25h, 0a9fh, 0b1fh, 0ba5h
        dw      0c32h, 0cc5h, 0d5fh, 0e00h, 0ea9h, 0f5ah, 1013h, 10d5h
        dw      11a0h, 1275h, 1354h, 143dh, 1531h, 1631h, 173ch, 1855h
        dw      197ah, 1aaeh, 1befh, 1d40h, 1ea1h, 2013h, 2196h, 232bh
        dw      24d3h, 2690h, 2861h, 2a48h, 2c46h, 2e5ch, 308ch, 32d5h
        dw      353bh, 37bdh, 3a5dh, 3d1eh, 3fffh
TBL_0C38:
        db      00h
TBL_0C39:
        db      07h, 06h, 03h, 02h, 05h, 04h, 01h, 00h, 00h
        db      000h, 000h
W_0C44:
        db      000h, 000h
G_VOICE_ALLOC_NEXT:
        db      000h, 000h
STR_0C48:
        db      "(Press ENT"
        db      "ER to commit.)", 000h, 000h
PTR_STR_PRESS_ENTER:
        dw      STR_0C48
PTR_STR_PRESS_ENTER_SEG:
        dw      DATA_SEG
TBL_WINKEYS_00C66:                      ; 2 records + WIN_KEY_END
        WIN_KEY   WIN_K_LEFT, TEXT1_SEG, win_key_nop_stub
        WIN_KEY   WIN_K_RIGHT, TEXT1_SEG, win_key_nop_stub
        WIN_KEY_END
        db      00h
TBL_WINKEYS_00C76:
        WIN_KEY   2bh, TEXT1_SEG, win_key_nop_stub
        WIN_KEY   2ch, TEXT1_SEG, win_key_nop_stub
        WIN_KEY_END
        db      00h
TBL_WINKEYS_00C86:                      ; 2 records + WIN_KEY_END
P_0C86:
        WIN_KEY   2eh, TEXT1_SEG, win_key_nop_stub
        WIN_KEY   2dh, TEXT1_SEG, win_key_nop_stub
        WIN_KEY_END
        db      00h
TBL_WINKEYS_00C96:
        WIN_KEY   WIN_K_PAD, TEXT1_SEG, win_key_nop_stub
        WIN_KEY   2ah, TEXT1_SEG, win_key_nop_stub
        WIN_KEY_END
        db      00h
TBL_WINKEYS_00CA6:                      ; 3 records + WIN_KEY_END
        WIN_KEY   12h, TEXT1_SEG, win_key_nop_stub
        WIN_KEY   13h, TEXT1_SEG, win_key_nop_stub
        WIN_KEY   35h, TEXT1_SEG, win_key_nop_stub
        WIN_KEY_END
TBL_WINKEYS_00CBA:
        WIN_KEY   2eh, TEXT2_SEG, X_02D76
        WIN_KEY   2dh, TEXT2_SEG, X_02D54
        WIN_KEY   2bh, TEXT2_SEG, field_value_scale
        WIN_KEY   2ch, TEXT2_SEG, field_value_scale_2
        WIN_KEY   35h, TEXT2_SEG, seq_read_data
        WIN_KEY   12h, TEXT2_SEG, field_value_commit
        WIN_KEY   13h, TEXT2_SEG, X_02DA0
        WIN_KEY_END
TBL_WINKEYS_00CE2:                      ; 12 records + WIN_KEY_END
P_0CE2:
        WIN_KEY   2eh, TEXT2_SEG, X_0362C
        WIN_KEY   2dh, TEXT2_SEG, T2_X_03656
        WIN_KEY   2bh, TEXT2_SEG, voice_port_read
        WIN_KEY   2ch, TEXT2_SEG, voice_port_read2
        WIN_KEY   35h, TEXT2_SEG, midi_msg_io
        WIN_KEY   12h, TEXT2_SEG, name_edit_commit
        WIN_KEY   13h, TEXT2_SEG, X_036C0
        WIN_KEY   WIN_K_LEFT, TEXT2_SEG, X_0367A
        WIN_KEY   WIN_K_RIGHT, TEXT2_SEG, far_0369C
        WIN_KEY   WIN_K_PAD, TEXT2_SEG, midi_channel_handler
        WIN_KEY   28h, TEXT2_SEG, L_03614
        WIN_KEY   2ah, TEXT2_SEG, X_035EC
        WIN_KEY_END
        db      00h
P_0D24:
        db      41h, 43h, 45h, 47h, 49h, 4bh, 4dh, 4fh, 51h, 53h
        db      "UWY&-(BDFHJLNPRT"
        db      "VXZ#!)acegikmoqs"
        db      "uwy'${bdfhjlnprt"
        db      76h, 78h, 7ah, 40h, 25h, 7dh
TBL_WINKEYS_00D64:                      ; 2 records + WIN_KEY_END
        WIN_KEY   2bh, TEXT2_SEG, X_036F0
        WIN_KEY   2ch, TEXT2_SEG, L_03746
        WIN_KEY_END
STR_DOUBLE_DASH:
        db      2dh, 2dh, 00h
STR_ST_SUFFIX:
        db      "(ST)", 00h
STR_ST_SUFFIX_BLANK:
        db      "    ", 00h
STR_OFF_PADDED:
        db      "OFF                 ", 00h
STR_NO_SOUND_PADDED:
        db      "(no sound)          ", 00h
STR_BLANK_VALUE:
        db      "---.-", 00h
TBL_0DB0:
        db      0d0h, 0d6h, 0dch, 0dfh, 0e2h, 0e4h, 0e5h, 0e7h, 0e8h, 0e9h, 0eah, 0ebh, 0ebh, 0ech, 0edh, 0edh
        db      0eeh, 0eeh, 0efh, 0efh
        db      0f0h, 0f0h, 0f1h, 0f1h, 0f1h, 0f2h
        db      0f2h, 0f2h, 0f3h, 0f3h, 0f3h, 0f4h, 0f4h, 0f4h, 0f4h, 0f5h, 0f5h, 0f5h, 0f5h, 0f6h, 0f6h, 0f6h
        db      0f6h, 0f7h, 0f7h, 0f7h, 0f7h, 0f7h, 0f7h, 0f8h, 0f8h, 0f8h, 0f8h, 0f8h, 0f9h, 0f9h, 0f9h, 0f9h
        db      0f9h, 0f9h, 0f9h, 0fah, 0fah, 0fah, 0fah, 0fah, 0fah, 0fah
        db      9 dup (0fbh)
        db      9 dup (0fch)
        db      10 dup (0fdh)
        db      12 dup (0feh)
        db      13 dup (0ffh)
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h
STR_CREDITS_BLANK:
        db      00h
STR_0E31:
        db      "        MPC2000 development Team!", 00h
STR_0E53:
        db      "Product planning", 00h
STR_0E64:
        db      "                Yuji Kagei", 00h
STR_0E7F:
        db      "Cosmetic design", 00h
STR_0E8F:
        db      "            Kazusato Kawanoguchi", 00h
STR_0EB0:
        db      "Electric design", 00h
STR_0EC0:
        db      "            Yasuyuki Hayashi", 00h
STR_0EDD:
        db      "            Hideyuki Oimatsu", 00h
STR_0EFA:
        db      "Mechanical design", 00h
STR_0F0C:
        db      "             Takeshi Sugiyama", 00h
STR_0F2A:
        db      "Software design", 00h
STR_0F3A:
        db      "             Akihiro Hayashi", 00h
STR_0F57:
        db      "           Yoshihiro Ishikawa", 00h
STR_0F75:
        db      "Sound design", 00h
STR_0F82:
        db      "            Masayuki Hoshi", 00h
STR_0F9D:
        db      "         and studio Mix 335 stuff", 00h
STR_0FBF:
        db      "Thanks to        all AKAI EMI stuff.", 00h
CREDITS_TABLE:
        dw      STR_CREDITS_BLANK, DATA_SEG
        dw      STR_CREDITS_BLANK, DATA_SEG
        dw      STR_CREDITS_BLANK, DATA_SEG
        dw      STR_CREDITS_BLANK, DATA_SEG
        dw      STR_CREDITS_BLANK, DATA_SEG
        dw      STR_0E31, DATA_SEG
        dw      STR_CREDITS_BLANK, DATA_SEG
        dw      STR_CREDITS_BLANK, DATA_SEG
        dw      STR_0E53, DATA_SEG
        dw      STR_0E64, DATA_SEG
        dw      STR_CREDITS_BLANK, DATA_SEG
        dw      STR_0E7F, DATA_SEG
        dw      STR_0E8F, DATA_SEG
        dw      STR_CREDITS_BLANK, DATA_SEG
        dw      STR_0EB0, DATA_SEG
        dw      STR_0EC0, DATA_SEG
        dw      STR_0EDD, DATA_SEG
        dw      STR_CREDITS_BLANK, DATA_SEG
        dw      STR_0EFA, DATA_SEG
        dw      STR_0F0C, DATA_SEG
        dw      STR_CREDITS_BLANK, DATA_SEG
        dw      STR_0F2A, DATA_SEG
        dw      STR_0F3A, DATA_SEG
        dw      STR_0F57, DATA_SEG
        dw      STR_CREDITS_BLANK, DATA_SEG
        dw      STR_0F75, DATA_SEG
        dw      STR_0F82, DATA_SEG
        dw      STR_0F9D, DATA_SEG
        dw      STR_CREDITS_BLANK, DATA_SEG
        dw      STR_0FBF, DATA_SEG
        dw      STR_CREDITS_BLANK, DATA_SEG
        dw      STR_CREDITS_BLANK, DATA_SEG
        dw      STR_CREDITS_BLANK, DATA_SEG
        dw      STR_CREDITS_BLANK, DATA_SEG
        dw      STR_CREDITS_BLANK, DATA_SEG
TBL_WINKEYS_DEV_CREDITS:
        WIN_KEY_CLEAR
        WIN_KEY   33h, TEXT2_SEG, show_dev_credits_scroll
        WIN_KEY_END
        db      00h
TBL_WINKEYS_0100E:
        WIN_KEY_CLEAR
        WIN_KEY   2bh, TEXT2_SEG, L_03CF8
        WIN_KEY   2ch, TEXT2_SEG, X_03D0E
        WIN_KEY   WIN_K_RIGHT, TEXT2_SEG, L_03D56
        WIN_KEY   WIN_K_LEFT, TEXT2_SEG, tgt_03D80
        WIN_KEY   WIN_K_UP, TEXT2_SEG, far_03DAA
        WIN_KEY   WIN_K_DOWN, TEXT2_SEG, L_03DD4
        WIN_KEY   WIN_K_F6, TEXT2_SEG, L_03DFE
        WIN_KEY   WIN_K_PAD, TEXT2_SEG, L_03E24
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, cmd_exec_quad
        WIN_KEY   28h, TEXT2_SEG, L_03E64
        WIN_KEY   WIN_K_OPEN, TEXT2_SEG, L_03F68
        if      FW_VERSION = 172
        WIN_KEY   13h, TEXT2_SEG, L_03F84
        WIN_KEY   93h, TEXT2_SEG, L_03F92
        endif
        WIN_KEY_END
        db      00h
P_10CC:
        WIN_CLEAR
        if      FW_VERSION = 150
        WIN_SOFTKEY 6, 1, "ALL CH"
        endif
        WIN_PLANE_B
        WIN_RULE  0eh, 03h, 00h, 32h
        WIN_LABEL 05h, 1dh, "0"
        WIN_LABEL 05h, 2ah, "1"
        WIN_RULE  0eh, 12h, 00h, 32h
        WIN_LABEL 14h, 1dh, "0"
        WIN_LABEL 14h, 2ah, "2"
        WIN_RULE  0eh, 21h, 00h, 32h
        WIN_LABEL 23h, 1dh, "0"
        WIN_LABEL 23h, 2ah, "3"
        WIN_RULE  0eh, 30h, 00h, 32h
        WIN_LABEL 32h, 1dh, "0"
        WIN_LABEL 32h, 2ah, "4"
        WIN_RULE  0eh, 3fh, 00h, 32h
        WIN_LABEL 41h, 1dh, "0"
        WIN_LABEL 41h, 2ah, "5"
        WIN_RULE  0eh, 4eh, 00h, 32h
        WIN_LABEL 50h, 1dh, "0"
        WIN_LABEL 50h, 2ah, "6"
        WIN_RULE  0eh, 5dh, 00h, 32h
        WIN_LABEL 5fh, 1dh, "0"
        WIN_LABEL 5fh, 2ah, "7"
        WIN_RULE  0eh, 6ch, 00h, 32h
        WIN_LABEL 6eh, 1dh, "0"
        WIN_LABEL 6eh, 2ah, "8"
        WIN_RULE  0eh, 7bh, 00h, 32h
        WIN_LABEL 7dh, 1dh, "0"
        WIN_LABEL 7dh, 2ah, "9"
        WIN_RULE  0eh, 8ah, 00h, 32h
        WIN_LABEL 8ch, 1dh, "1"
        WIN_LABEL 8ch, 2ah, "0"
        WIN_RULE  0eh, 99h, 00h, 32h
        WIN_LABEL 9bh, 1dh, "1"
        WIN_LABEL 9bh, 2ah, "1"
        WIN_RULE  0eh, 0a8h, 00h, 32h
        WIN_LABEL 0aah, 1dh, "1"
        WIN_LABEL 0aah, 2ah, "2"
        WIN_RULE  0eh, 0b7h, 00h, 32h
        WIN_LABEL 0b9h, 1dh, "1"
        WIN_LABEL 0b9h, 2ah, "3"
        WIN_RULE  0eh, 0c6h, 00h, 32h
        WIN_LABEL 0c8h, 1dh, "1"
        WIN_LABEL 0c8h, 2ah, "4"
        WIN_RULE  0eh, 0d5h, 00h, 32h
        WIN_LABEL 0d7h, 1dh, "1"
        WIN_LABEL 0d7h, 2ah, "5"
        WIN_RULE  0eh, 0e4h, 00h, 32h
        WIN_LABEL 0e6h, 1dh, "1"
        WIN_LABEL 0e6h, 2ah, "6"
        WIN_RULE  0eh, 0f3h, 00h, 32h
        WIN_END
        if      FW_VERSION = 172
STR_11B3:
        db      41h, 4ch, 4ch, 20h, 43h, 48h, 00h
STR_11BA:
        db      43h, 4ch, 45h, 41h
        db      052h, 000h
        else
        db      00h
        endif
MIXSRC_CURSOR:
        db      000h, 000h
DL_MIXER_SETUP:
        if      FW_VERSION = 172
        db      001h, 01ah, 001h, 002h, "STEREO", 000h, 01ah
        db      002h, 002h, "INDIV", 000h, 01ah, 004h, 000h, "SETUP"
        db      000h, 01ah, 003h, 002h, "FXsend", 000h, 01ah, 005h, 002h, 046h, 058h
        db      "edit", 000h, 002h, 007h, 003h, 003h, "Mixer s"
        db      "ource select", 000h, 00ch, 002h, 00dh
        db      079h, 007h, 009h, 016h, "Stereo mix:", 000h
        db      007h, 015h, " INDIV/FX:", 000h, 007h, 080h, 002h
        db      "Master Level", 000h, 00ch, 07fh, 00bh
        db      078h, 007h, 093h, 00eh, "Level:", 000h, 007h, 081h

        db      01ch, "Record mix chan"
        db      67h, 65h, 73h, 00h, 0ch, 7fh, 24h, 78h, 00h
        else
        WIN_CLEAR
        WIN_SOFTKEY 1, 2, "STEREO"
        WIN_SOFTKEY 2, 2, "INDIV"
        WIN_SOFTKEY 4, 0, "SETUP"
        WIN_SOFTKEY 3, 2, "FXsend"
        WIN_SOFTKEY 5, 2, "FXedit"
        WIN_RESET_PEN
        WIN_LABEL 03h, 03h, "Mixer source select"
        WIN_RULE  0ch, 02h, 0dh, 79h
        WIN_LABEL 09h, 16h, "Stereo mix:"
        WIN_LABEL 15h, 20h, "INDIV/FX:"
        WIN_LABEL 80h, 02h, "Master Level"
        WIN_RULE  0ch, 7fh, 0bh, 78h
        WIN_LABEL 93h, 0eh, "Level:"
        WIN_LABEL 81h, 1ch, "Record mix changes"
        WIN_RULE  0ch, 7fh, 24h, 78h
        WIN_END
        endif
TBL_WINKEYS_01264:                      ; 10 records + WIN_KEY_END
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F1, TEXT2_SEG, mixer_stereo_page
        WIN_KEY   WIN_K_F2, TEXT2_SEG, mixer_indiv_page
        WIN_KEY   WIN_K_F3, TEXT2_SEG, mixer_fxsend_page
        WIN_KEY   WIN_K_F5, TEXT2_SEG, far_04206
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, X_04138
        WIN_KEY   WIN_K_UP, TEXT1_SEG, L_03698
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, X_036AE
        WIN_KEY   WIN_K_LEFT, TEXT1_SEG, X_036C4
        WIN_KEY   WIN_K_RIGHT, TEXT1_SEG, X_036DC
        WIN_KEY_END
        db      00h
STR_129C:
        db      4dh, 55h, 4ch, 54h, 49h, 20h, 46h, 58h, 31h, 00h
STR_12A6:
        db      "MULTI FX2", 000h
STR_12B0:
        db      "REVERB"
        db      020h, 031h, 000h
STR_12B9:
        db      "REVERB 2", 000h
FX_TYPE_LABELS:
        dw      STR_129C, DATA_SEG
        dw      STR_12A6, DATA_SEG
        dw      STR_12B0, DATA_SEG
        dw      STR_12B9, DATA_SEG
STR_12D2:
        db      052h, 031h, 000h
STR_12D5:
        db      04dh, 031h, 000h
STR_12D8:
        db      "FX1 DIST/F"
        db      04ch, 054h, 000h
STR_12E5:
        db      "FX1 MOD/ECHO", 000h
STR_12F2:
        db      "FX1 REVERB", 000h
STR_12FD:
        db      052h, 032h, 000h
P_1300:
        db      04dh, 032h
P_1302:
        db      000h
STR_1303:
        db      "FX2 DIST/FLT", 000h
STR_1310:
        db      046h, 058h
        db      "2 MOD/ECHO", 000h
STR_131D:
        db      046h, 058h, 032h, 020h, 052h
        db      "EVERB", 000h
FX_SECTION_LABELS:
        dw      STR_12D2, DATA_SEG
        dw      STR_12D5, DATA_SEG
        dw      STR_12D8, DATA_SEG
        dw      STR_12E5, DATA_SEG
        dw      STR_12F2, DATA_SEG
        dw      STR_12FD, DATA_SEG
        dw      P_1300, DATA_SEG
        dw      STR_1303, DATA_SEG
        dw      STR_1310, DATA_SEG
        dw      STR_131D, DATA_SEG
STR_1350:
        db      4dh, 31h, 00h
STR_1353:
        db      4dh, 32h, 00h
P_1356:
        dw      STR_1350
P_1358:
        dw      DATA_SEG
        dw      STR_1353, DATA_SEG
FXEDIT_CURSOR:
        db      01h, 00h
TBL_1360:
        db      1ah
TBL_1361:
        db      02h
B_1362:
        db      0c2h
B_1363:
        db      02h
B_1364:
        db      03h
B_1365:
        db      1ah, 2ah, 0ch, 4dh, 0ch, 70h, 0ch, 93h, 0ch
        db      0b6h, 0ch, 0d9h, 0ch
TBL_WINKEYS_MIXER:                      ; 5 records + WIN_KEY_END
P_1372:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F1, TEXT2_SEG, mixer_stereo_page
        WIN_KEY   WIN_K_F2, TEXT2_SEG, mixer_indiv_page
        WIN_KEY   WIN_K_F3, TEXT2_SEG, mixer_fxsend_page
        WIN_KEY   WIN_K_F4, TEXT1_SEG, mixer_setup
        WIN_KEY_END
P_1390:
        WIN_CLEAR
        WIN_SOFTKEY 1, 2, "STEREO"
        WIN_SOFTKEY 2, 2, "INDIV"
        WIN_SOFTKEY 3, 2, "FXsend"
        WIN_SOFTKEY 4, 2, "SETUP"
        WIN_SOFTKEY 5, 0, "FXedit"
        WIN_SOFTKEY 6, 1, "ON/OFF"
        WIN_RESET_PEN
        WIN_LABEL 02h, 02h, "Pgm:"
        WIN_LABEL 0a4h, 02h, "Edit:"
        WIN_END
P_13DE:
        WIN_CLEAR
        WIN_SOFTKEY 1, 2, "STEREO"
        WIN_SOFTKEY 2, 2, "INDIV"
        WIN_SOFTKEY 3, 2, "FXsend"
        WIN_SOFTKEY 4, 2, "SETUP"
        WIN_SOFTKEY 5, 0, "FXedit"
        WIN_LABEL 13h, 0ah, "Effect board is"
        WIN_LABEL 19h, 13h, "not installed."
        WIN_END
        db      00h
TBL_WINKEYS_01436:                      ; 8 records + WIN_KEY_END
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, L_044B6
        WIN_KEY   WIN_K_OPEN, TEXT2_SEG, L_04588
        WIN_KEY   WIN_K_UP, TEXT1_SEG, X_03796
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, X_037B6
        WIN_KEY   WIN_K_LEFT, TEXT1_SEG, X_037D2
        WIN_KEY   WIN_K_RIGHT, TEXT1_SEG, X_037E8
        WIN_KEY   WIN_K_F6, TEXT2_SEG, L_045AA
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, X_0425A
        WIN_KEY_END
STR_FX_INPUT:
        db      49h, 6eh, 70h, 75h, 74h, 3ah, 00h
STR_FX_REV_1:
        db      5eh, 52h, 45h, 56h
        db      00h
STR_FX_MIX_1:
        db      "^MIX", 00h
TBL_1474:
        db      03h, 03h, 00h, 01h, 02h, 00h
TBL_147A:
        dw      win_key_nop_stub, TEXT1_SEG
        dw      X_04876, TEXT1_SEG
        dw      L_04270
        db      TEXT2_SEG & 0ffh
TBL_WINKEYS_01485:                      ; 9 records + WIN_KEY_END
        WIN_KEY   TEXT2_SEG >> 8, TEXT1_SEG, L_04E88
P_148A:
        WIN_KEY   WIN_K_PAINT, TEXT1_SEG, win_key_nop_stub
        WIN_KEY   WIN_K_OPEN, TEXT2_SEG, X_04888
        WIN_KEY   WIN_K_UP, TEXT1_SEG, X_03896
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, X_038BA
        WIN_KEY   WIN_K_LEFT, TEXT1_SEG, X_038D6
        WIN_KEY   WIN_K_RIGHT, TEXT1_SEG, X_038EC
        WIN_KEY   WIN_K_F6, TEXT2_SEG, L_048C8
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, X_0425A
        WIN_KEY_END
        db      00h
TBL_14B8:
        dw      track_flags_render_6rows, TEXT2_SEG
        dw      track_process_full, TEXT2_SEG
        dw      track_process_ext, TEXT2_SEG
STR_FX_DIST_1:
        db      "DIST", 000h
STR_FX_FILT_1:
        db      "FILT", 000h
STR_FX_MOD_1:
        db      "^MOD", 000h
STR_FX_ECHO_1:
        db      045h
        db      043h, 048h, 04fh, 000h
STR_FX_REV_2:
        db      "^REV", 000h
STR_FX_MIX_2:
        db      "^MIX", 000h
STR_FX_DIST_2:
        db      044h, 049h
        db      053h, 054h, 000h
STR_FX_FILT_2:
        db      "FILT", 000h
STR_FX_REV_3:
        db      "^REV", 000h
STR_FX_MOD_2:
        db      05eh, 04dh, 04fh
        db      044h, 000h
STR_FX_ECHO_2:
        db      "ECHO", 000h
STR_FX_MIX_3:
        db      "^MIX", 000h
STR_FX_DIST_3:
        db      "DIST"
        db      000h
STR_FX_FILT_3:
        db      "FILT", 000h
STR_FX_MOD_3:
        db      "^MOD", 000h
STR_FX_ECHO_3:
        db      "ECHO", 000h
STR_FX_REV_4:
        db      "^REV", 000h
STR_FX_MIX_4:
        db      "^MIX", 000h
TBL_151E:
        db      000h, 000h, 001h, 002h, 003h, 004h
        db      05h, 06h
TBL_1526:
        if      FW_VERSION = 172
        db      00h, 01h, 02h, 05h, 03h, 04h, 06h, 00h
        else
        db      00h, 01h, 02h, 05h
        db      04h
        db      03h
        db      06h, 00h
        endif
TBL_152E:
        dw      L_04E88, TEXT1_SEG
        dw      X_039A8, TEXT1_SEG
        dw      X_03B46, TEXT1_SEG
        dw      L_04D7E, TEXT2_SEG
        dw      L_051DA, TEXT2_SEG
        dw      X_04876, TEXT1_SEG
        dw      L_04270, TEXT2_SEG
P_154A:
        db      20h, 10h, 08h, 04h, 02h, 00h
P_1550:
        db      20h, 10h, 02h, 08h, 04h, 00h
W_1556:
        db      4dh, 49h
W_1558:
        db      44h, 00h
TBL_155A:
        db      "1"
TBL_155B:
        db      "011131416182022"
        db      "2528323640455056"
        db      "63708090"
W_1582:
        db      " k"
W_1584:
        db      "0", 000h
STR_DB:
        db      064h, 042h, 000h
G_FLAG_1589:
        db      000h
P_158A:
        db      000h
STR_SOLO:
        db      "SOLO", 000h
P_1590:
        db      000h
STR_BYPASS:
        db      "BYPASS", 000h
STR_SK_CLOSE_MIXER:
        db      043h, 04ch
        db      4fh, 53h, 45h, 00h
STR_SK_MIXER:
        db      4dh, 49h, 58h, 45h, 52h, 00h
G_FX_BLINK_TICK:
        db      00h, 00h
TBL_WINKEYS_015A6:                      ; 6 records + WIN_KEY_END
P_15A6:
        WIN_KEY_CLEAR
        WIN_KEY   33h, TEXT2_SEG, tgt_04C68
        WIN_KEY   WIN_K_OPEN, TEXT2_SEG, L_04CB0
        WIN_KEY   WIN_K_F4, TEXT2_SEG, L_04CB0
        WIN_KEY   WIN_K_F5, TEXT2_SEG, X_04CC2
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, far_04C8A
        WIN_KEY_END
        db      00h
TBL_WINKEYS_015CA:
        WIN_KEY   WIN_K_PAINT, TEXT1_SEG, L_039C6
        WIN_KEY   WIN_K_UP, TEXT1_SEG, X_03AEA
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, X_03B00
        WIN_KEY   WIN_K_LEFT, TEXT1_SEG, X_03B16
        WIN_KEY   WIN_K_RIGHT, TEXT1_SEG, X_03B2E
        WIN_KEY   WIN_K_F2, TEXT2_SEG, L_04CFA
        WIN_KEY   WIN_K_F3, TEXT2_SEG, L_04BBA
        WIN_KEY_END
DL_FX_DISTORTION:
        WIN_DIALOG "DISTORTION/RINGMOD"
        WIN_RESET_PEN
        WIN_RULE  0fh, 79h, 0eh, 1eh
        WIN_LABEL 25h, 0eh, "<DISTORTION>"
        WIN_LABEL 31h, 19h, "Gain:"
        WIN_LABEL 2bh, 24h, "Level:"
        WIN_LABEL 8bh, 0eh, "<RINGMOD>"
        WIN_LABEL 91h, 19h, "Freq:"
        WIN_LABEL 0c7h, 19h, "Hz"
        WIN_LABEL 8bh, 24h, "Depth:  %"
        WIN_END
TBL_WINKEYS_4BAND_FILTER:                      ; 7 records + WIN_KEY_END
        WIN_KEY   WIN_K_F2, TEXT2_SEG, filter4_f2
        WIN_KEY   WIN_K_F3, TEXT2_SEG, filter4_f3
        WIN_KEY   WIN_K_PAINT, TEXT1_SEG, filter4_paint
        WIN_KEY   WIN_K_UP, TEXT1_SEG, filter4_up
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, filter4_down
        WIN_KEY   WIN_K_LEFT, TEXT1_SEG, filter4_left
        WIN_KEY   WIN_K_RIGHT, TEXT1_SEG, filter4_right
        WIN_KEY_END
DL_4BAND_FILTER:
        WIN_DIALOG "4-BAND FILTER"
        WIN_RESET_PEN
        WIN_RULE  0ch, 13h, 13h, 0d2h
        WIN_RULE  0ch, 13h, 1dh, 0d2h
        WIN_RULE  0ch, 13h, 27h, 0d2h
        WIN_RULE  0fh, 91h, 13h, 15h
        WIN_LABEL 13h, 0bh, "HIGH:   Hz"
        WIN_LABEL 13h, 15h, "MID1:   Hz"
        WIN_LABEL 13h, 1fh, "MID2:   Hz"
        WIN_LABEL 19h, 29h, "LOW:   Hz"
        WIN_LABEL 82h, 0bh, "Q ^ <F-MOD> depth"
        WIN_LABEL 0afh, 15h, "Hz"
        WIN_LABEL 0afh, 1fh, "Hz"
        WIN_END
; plain NUL-separated string table (<F-MOD> selector's 7 options), indexed from
; elsewhere; not part of the display list.  raw.
STR_1701:
        db      "PHASE SHIFT", 000h
STR_170D:
        db      046h, 04ch
        db      "ANGE", 000h
STR_1714:
        db      "CHORUS", 000h
STR_171B:
        db      "ROTA"
        db      "RY SPEAKERS", 000h
STR_172B:
        db      "FMOD"
        db      "/AUTOPAN", 000h
STR_1738:
        db      "PITCH S"
        db      "HIFT", 000h
STR_1744:
        db      "PITCH+FEEDB"
        db      41h, 43h, 4bh, 00h, 00h
FX_MOD_TYPE_LABELS:
        dw      STR_1701, DATA_SEG
        dw      STR_170D, DATA_SEG
        dw      STR_1714, DATA_SEG
        dw      STR_171B, DATA_SEG
        dw      STR_172B, DATA_SEG
        dw      STR_1738, DATA_SEG
        dw      STR_1744, DATA_SEG
DL_FX_MODULATION:
        WIN_DIALOG "MODULATION"
; 02h WIN_RESET_PEN (0 operands), then opcode. Tail past label raw.
; Terminator position unconfirmed, raw db.
        db      02h
        WIN_LABEL 13h, 0bh, "Type:"
        db      00h, 00h
TBL_WINKEYS_FX_CHORUS:                      ; 7 records + WIN_KEY_END
        WIN_KEY   WIN_K_F2, TEXT2_SEG, L_04DC4
        WIN_KEY   WIN_K_F3, TEXT2_SEG, L_04DD4
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, fx_chorus_paint
        WIN_KEY   WIN_K_UP, TEXT1_SEG, fx_chorus_up
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, fx_chorus_down
        WIN_KEY   WIN_K_LEFT, TEXT1_SEG, fx_chorus_left
        WIN_KEY   WIN_K_RIGHT, TEXT1_SEG, fx_chorus_right
        WIN_KEY_END
P_17B4:
        WIN_LABEL 97h, 15h, "Speed:   Hz"
        WIN_LABEL 97h, 1fh, "Depth:"
        WIN_LABEL 85h, 29h, "Feedback:"
        WIN_END
        db      00h
TBL_WINKEYS_FX_ROTARY:                      ; 7 records + WIN_KEY_END
P_17DC:
        WIN_KEY   WIN_K_F2, TEXT2_SEG, L_04DC4
        WIN_KEY   WIN_K_F3, TEXT2_SEG, L_04DD4
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, fx_rotary_paint
        WIN_KEY   WIN_K_UP, TEXT1_SEG, fx_rotary_up
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, fx_rotary_down
        WIN_KEY   WIN_K_LEFT, TEXT1_SEG, fx_rotary_left
        WIN_KEY   WIN_K_RIGHT, TEXT1_SEG, fx_rotary_right
        WIN_KEY_END
P_1804:
        WIN_RULE  0fh, 67h, 15h, 1ch
        WIN_LABEL 19h, 19h, "Speed1:   Hz"
        WIN_LABEL 1fh, 24h, "Depth:"
        WIN_LABEL 6dh, 15h, "MIDI control #:"
        WIN_LABEL 79h, 1fh, "Acceleration:   s"
        WIN_LABEL 9dh, 29h, "Speed2:   Hz"
        WIN_END
        db      00h
TBL_WINKEYS_0185C:                      ; 7 records + WIN_KEY_END
        WIN_KEY   WIN_K_F2, TEXT2_SEG, L_04DC4
        WIN_KEY   WIN_K_F3, TEXT2_SEG, L_04DD4
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, L_04F44
        WIN_KEY   WIN_K_UP, TEXT1_SEG, X_042C4
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, X_042E8
        WIN_KEY   WIN_K_LEFT, TEXT1_SEG, X_04306
        WIN_KEY   WIN_K_RIGHT, TEXT1_SEG, L_04326
        WIN_KEY_END
STR_1884:
        db      50h, 41h, 4eh, 00h
STR_1888:
        db      4ch, 3eh, 52h, 00h
STR_188C:
        db      52h, 3eh, 4ch
        db      000h
STR_1890:
        db      "TERM", 000h, 000h
FX_PAN_LABELS:
        dw      STR_1884, DATA_SEG
        dw      STR_1888, DATA_SEG
        dw      STR_188C, DATA_SEG
        dw      STR_1890, DATA_SEG
P_18A6:
        db      007h, 019h, 015h, "<F-MOD> Speed"
        db      03ah, 020h, 020h, 020h, 048h, 07ah, 000h, 007h, 049h, 01fh, "Depth:"
        db      000h, 007h, "7)Feedback:", 000h, 007h, 09dh
        db      00bh, "<AUTOPAN>", 000h, 007h, 09dh, 015h, 053h, 070h
        db      "eed:   Hz", 000h, 007h, 09dh, 01fh, 044h, 065h, 070h
        db      074h, 068h, 03ah, 000h, 007h, 0a3h, ")Mode:", 000h, 00fh, 097h, 00bh
        db      28h, 00h
TBL_WINKEYS_FX_PITCH_SHIFT:                      ; 7 records + WIN_KEY_END
        WIN_KEY   WIN_K_F2, TEXT2_SEG, L_04DC4
        WIN_KEY   WIN_K_F3, TEXT2_SEG, L_04DD4
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, status_read_6A_4
        WIN_KEY   WIN_K_UP, TEXT1_SEG, fx_pitch_shift_up
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, fx_pitch_shift_down
        WIN_KEY   WIN_K_LEFT, TEXT1_SEG, fx_pitch_shift_left
        WIN_KEY   WIN_K_RIGHT, TEXT1_SEG, fx_pitch_shift_right
        WIN_KEY_END
P_1930:
        WIN_LABEL 97h, 0bh, "Left   Right"
        WIN_LABEL 73h, 15h, "Tune:"
        WIN_END
STR_FX_DELAY_MS:
        db      44h
        db      "elay:    ms     "
        db      6dh, 73h, 00h
STR_FX_FEEDBACK:
        db      46h, 65h, 65h, 64h, 62h, 61h, 63h, 6bh, 3ah, 00h
TBL_WINKEYS_01968:                      ; 7 records + WIN_KEY_END
        WIN_KEY   WIN_K_F2, TEXT2_SEG, L_051FA
        WIN_KEY   WIN_K_F3, TEXT2_SEG, L_0520A
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, cmd_exec_2
        WIN_KEY   WIN_K_UP, TEXT1_SEG, X_04680
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, X_04696
        WIN_KEY   WIN_K_LEFT, TEXT1_SEG, X_046BA
        WIN_KEY   WIN_K_RIGHT, TEXT1_SEG, X_046D2
        WIN_KEY_END
TBL_WINKEYS_01990:
        WIN_KEY   WIN_K_F2, TEXT2_SEG, L_051FA
        WIN_KEY   WIN_K_F3, TEXT2_SEG, L_0520A
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, L_052E8
        WIN_KEY   WIN_K_UP, TEXT1_SEG, X_047DE
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, X_04802
        WIN_KEY   WIN_K_LEFT, TEXT1_SEG, X_04820
        WIN_KEY   WIN_K_RIGHT, TEXT1_SEG, X_0484C
        WIN_KEY_END
STR_19B8:
        db      4dh, 4fh, 4eh, 4fh, 20h, 4ch, 45h, 46h, 54h, 00h
STR_19C2:
        db      4dh
        db      "ONO L+R", 000h
STR_19CB:
        db      "XOVER L&"
        db      052h, 000h
STR_19D5:
        db      "STEREO", 000h
FX_OUT_MODE_LABELS:
        dw      STR_19B8, DATA_SEG
        dw      STR_19C2, DATA_SEG
        dw      STR_19CB, DATA_SEG
        dw      STR_19D5, DATA_SEG
DL_FX_DELAY_ECHO:
        WIN_DIALOG "DELAY/ECHO"
        db      02h
        WIN_LABEL 13h, 0bh, "Type:"
        WIN_END
        WIN_END
P_1A08:
        WIN_LABEL 8bh, 0bh, "Feedback:  %"
        WIN_LABEL 67h, 15h, "Feedback delay:   ms"
        WIN_LABEL 7fh, 1fh, "HF damping:   Hz"
        WIN_LABEL 5bh, 29h, "L/R delay offset:   %"
        WIN_END
P_1A5E:
        WIN_LABEL 97h, 0bh, "Left   Right"
        WIN_LABEL 61h, 15h, "Feedback:   %      %"
        WIN_LABEL 3dh, 1fh, "Feedback delay:   ms     ms"
        WIN_LABEL 55h, 29h, "HF damping:   Hz     Hz"
        WIN_END
        db      00h
TBL_WINKEYS_01AC2:                      ; 7 records + WIN_KEY_END
        WIN_KEY   WIN_K_F2, TEXT2_SEG, L_0539A
        WIN_KEY   WIN_K_F3, TEXT2_SEG, L_053AA
        WIN_KEY   WIN_K_PAINT, TEXT1_SEG, int2E_read_caller
        WIN_KEY   WIN_K_UP, TEXT1_SEG, X_04AE8
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, X_04B0C
        WIN_KEY   WIN_K_LEFT, TEXT1_SEG, L_04B2A
        WIN_KEY   WIN_K_RIGHT, TEXT1_SEG, L_04B42
        WIN_KEY_END
STR_1AEA:
        db      4ch, 41h, 52h, 47h, 45h, 20h, 48h, 41h, 4ch, 4ch, 00h
STR_1AF5:
        db      "SMALL HALL", 000h
STR_1B00:
        db      "LARGE"
        db      " ROOM", 000h
STR_1B0B:
        db      "SMALL ROOM"
        db      000h
STR_1B16:
        db      "GATED 1", 000h
STR_1B1E:
        db      "GATED 2"
        db      000h
STR_1B26:
        db      "REVERSE", 000h
FX_REVERB_LABELS:
        dw      STR_1AEA, DATA_SEG
        dw      STR_1AF5, DATA_SEG
        dw      STR_1B00, DATA_SEG
        dw      STR_1B0B, DATA_SEG
        dw      STR_1B16, DATA_SEG
        dw      STR_1B1E, DATA_SEG
        dw      STR_1B26, DATA_SEG
DL_FX_REVERB:
        WIN_DIALOG "REVERB"
        db      02h
        WIN_LABEL 13h, 0bh, "Type:"
        WIN_LABEL 2bh, 15h, "Predelay:  ms"
        WIN_LABEL 43h, 1fh, "Time:"
        WIN_LABEL 31h, 29h, "Diffuse:"
        WIN_END
STR_FX_NEAR:
        db      4eh, 65h, 61h, 72h, 3ah, 00h
STR_FX_LF_DAMPING:
        db      4ch, 46h, 20h, 64h, 61h, 6dh, 70h, 69h, 6eh, 67h, 3ah, 20h, 20h, 20h, 48h, 7ah, 00h
STR_FX_HF_DAMPING:
        db      48h, 46h, 20h, 64h, 61h, 6dh, 70h, 69h, 6eh, 67h, 3ah, 20h, 20h, 20h, 48h, 7ah, 00h, 00h
TBL_WINKEYS_FX_MIXER:                      ; 5 records + WIN_KEY_END
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, cmd_exec_7
        WIN_KEY   WIN_K_UP, TEXT1_SEG, fx_mixer_up
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, fx_mixer_down
        WIN_KEY   WIN_K_LEFT, TEXT1_SEG, fx_mixer_left
        WIN_KEY   WIN_K_RIGHT, TEXT1_SEG, fx_mixer_right
        WIN_KEY_END
STR_1BCE:
        db      4dh, 4fh, 44h, 2fh, 45h, 43h, 48h, 4fh, 3eh, 52h, 45h
        db      056h, 000h
STR_1BDB:
        db      "REV>MOD/ECHO", 000h
STR_1BE8:
        db      04dh
        db      "OD/ECHO+REV", 000h, 000h
FX_ROUTE_LABELS:
        dw      STR_1BCE, DATA_SEG
        dw      STR_1BDB, DATA_SEG
        dw      STR_1BE8, DATA_SEG
        if      FW_VERSION = 172
STR_1C02:
        db      "MASTER", 000h
STR_1C09:
        db      031h, 02fh, 032h, 020h, 020h, 000h
STR_1C0F:
        db      033h, 02fh, 034h
        db      20h, 20h, 00h
STR_1C15:
        db      35h, 2fh, 36h, 20h, 20h, 00h
STR_1C1B:
        db      37h, 2fh, 38h, 20h, 20h, 00h, 00h
FX_OUT_PAIR_LABELS:
        dw      STR_1C02, DATA_SEG
        dw      STR_1C09, DATA_SEG
        dw      STR_1C0F, DATA_SEG
        dw      STR_1C15, DATA_SEG
        dw      STR_1C1B, DATA_SEG
        endif
P_1C36:
        WIN_DIALOG "Effect Mixer"
        WIN_SOFTKEY 4, 2, "CLOSE"
        WIN_RESET_PEN
        if      FW_VERSION = 172
        WIN_LABEL 13h, 0bh, "Direct sig:"
        WIN_LABEL 13h, 15h, "Patch:"
        WIN_LABEL 13h, 29h, "Output:"
        else
        WIN_LABEL 13h, 0eh, "Direct sig:"
        WIN_LABEL 13h, 19h, "Patch:"
        endif
        WIN_RULE  0fh, 6dh, 0ah, 28h
        WIN_LABEL 0a7h, 0bh, "Lev^Pan^Wid"
        WIN_LABEL 79h, 15h, "Dist/EQ:"
        WIN_LABEL 73h, 1fh, "Mod/Echo:"
        WIN_LABEL 7fh, 29h, "Reverb:"
        WIN_END
        if      FW_VERSION = 150
        db      00h
        endif
TBL_WINKEYS_FX_MIXER_LR:                      ; 3 records + WIN_KEY_END
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, fx_mixer_lr_paint
        WIN_KEY   WIN_K_LEFT, TEXT1_SEG, fx_mixer_lr_left
        WIN_KEY   WIN_K_RIGHT, TEXT1_SEG, fx_mixer_lr_right
        WIN_KEY_END
DL_EFFECT_MIXER:
        WIN_DIALOG "Effect Mixer"
        WIN_SOFTKEY 4, 2, "CLOSE"
        WIN_RESET_PEN
        WIN_END
STR_LEV_PAN_HDR:
        db      4ch, 65h, 76h, 5eh, 50h, 61h, 6eh, 00h
STR_REVERB_LBL:
        db      52h, 65h, 76h, 65h, 72h, 62h, 3ah, 00h
        db      00h
TBL_WINKEYS_COPY_FX:                      ; 7 records + WIN_KEY_END
P_1CF0:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, copy_fx_paint
        WIN_KEY   WIN_K_OPEN, TEXT2_SEG, copy_fx_close
        WIN_KEY   WIN_K_F4, TEXT2_SEG, copy_fx_close
        WIN_KEY   WIN_K_F5, TEXT2_SEG, cmd_block_copy
        WIN_KEY   WIN_K_UP, TEXT1_SEG, copy_fx_up
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, copy_fx_down
        WIN_KEY_END
DL_COPY_FX_SETTINGS:
        WIN_DIALOG "Copy Effect Settings"
        WIN_SOFTKEY 4, 2, "CLOSE"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_RESET_PEN
        WIN_LABEL 19h, 10h, "COPY"
        WIN_BITMAP 1fh, 19h, 02h
        WIN_LABEL 3dh, 0bh, "Pgm:"
        WIN_LABEL 3dh, 14h, "Set:"
        WIN_RULE  0ch, 37h, 1dh, 0b0h
        WIN_LABEL 3dh, 20h, "Pgm:"
        WIN_LABEL 3dh, 29h, "Set:"
        WIN_END
P_1D76:
        db      25h, 24h, 2ah, 52h, 28h, 26h, 2eh, 2ch, 30h, 2fh, 2dh, 2bh, 31h, 37h, 33h, 35h
        db      "6EQPABLM8>?@IJG'"
        db      "49:;<=CDFHKNO#)2"
        db      "STUVWXYZ[", 05ch, 05dh, 05eh, 05fh, 060h, 061h, 062h
P_1DB6:
        db      064h, 032h, 064h, 000h, 000h, 000h
STR_DB_2:
        db      064h, 042h, 000h
P_1DBF:
        db      000h
STR_NEW_PROGRAM_NAME:
        db      "NEW_PR"
        db      "OGRAM_    ", 000h, 000h
G_ASSIGN_VIEW_FIELD:
        db      000h
P_1DD3:
        db      000h
TBL_PGM_MASTER_LABELS:
        db      050h, 052h
        db      "OGRAM", 000h, "^MASTER", 000h
TBL_PAD_MODE_LABELS:
        db      04eh, 04fh
        db      "RMAL", 000h, "SIMULT", 000h, "VEL "
        db      53h, 57h, 00h, "DCY SW", 00h
TBL_ASSIGN_VIEW_ARM:
        dw      X_04F5A, X_04F76, X_04F9A, X_04FCE
        dw      X_04FF2, L_05012, L_05074, L_050BA_1
        dw      X_050E4, X_05116, X_05140, X_05172
        dw      L_0518E
TBL_ASSIGN_VIEW_FIELD_FIX:
        db      00h, 01h, 02h, 03h, 04h, 05h, 06h, 06h, 06h, 06h, 06h, 06h
        db      06h, 00h, 01h, 02h, 03h, 04h, 05h, 06h, 06h, 06h, 06h, 06h, 0bh, 0ch, 00h, 01h
        db      02h, 03h, 04h, 05h, 06h, 07h, 08h, 07h, 08h, 0bh, 0ch, 00h, 01h, 02h, 03h, 04h
        db      05h, 06h, 09h, 0ah, 09h, 0ah, 0bh, 0ch, 00h, 00h, 00h, 00h, 01h, 02h, 04h, 05h
        db      05h, 05h, 05h, 03h, 03h, 00h, 00h, 00h, 00h, 01h, 02h, 04h, 05h, 05h, 05h, 05h
        db      03h, 0bh, 00h, 00h, 00h, 00h, 01h, 02h, 04h, 05h, 07h, 05h, 05h, 03h, 0bh, 00h
        db      00h, 00h, 00h, 01h, 02h, 04h, 05h, 05h, 05h, 09h, 03h, 0bh, 01h, 04h, 05h, 05h
        db      06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 01h, 04h, 05h, 0bh, 06h, 06h, 06h
        db      06h, 06h, 06h, 06h, 0ch, 0ch, 01h, 04h, 05h, 0bh, 06h, 07h, 06h, 08h, 08h, 08h
        db      08h, 0ch, 0ch, 01h, 04h, 05h, 0bh, 06h, 09h, 06h, 0ah, 0ah, 0ah, 0ah, 0ch, 0ch
        db      00h, 00h, 01h, 02h, 03h, 04h, 05h, 06h, 06h, 06h, 06h, 06h, 06h, 00h, 00h, 01h
        db      02h, 03h, 04h, 05h, 06h, 06h, 06h, 06h, 06h, 0bh, 00h, 00h, 01h, 02h, 03h, 04h
        db      05h, 06h, 0bh, 06h, 06h, 07h, 08h, 00h, 00h, 01h, 02h, 03h, 04h, 05h, 06h, 06h
        db      06h, 0bh, 09h, 0ah, 01h, 02h, 03h, 04h, 05h, 06h, 06h, 06h, 06h, 06h, 06h, 06h
        db      06h, 01h, 02h, 03h, 04h, 05h, 06h, 0bh, 0bh, 0ch, 0bh, 0ch, 0ch, 0ch, 01h, 02h
        db      03h, 04h, 05h, 06h, 07h, 0bh, 0ch, 0bh, 0ch, 08h, 0ch, 01h, 02h, 03h, 04h, 05h
        db      006h, 009h, 00bh, 00ch, 00bh, 00ch, 00ah, 00ch
DL_PGM_ASSIGN:
        db      001h, 01ah, 001h, 000h, "ASSI"
        db      047h, 04eh, 000h, 01ah, 002h, 002h, "PARAMS", 000h, 01ah, 003h, 002h
        if      FW_VERSION = 172
        db      "MIDI", 000h, 01ah, 004h, 002h, "PURGE", 000h, 01ah, 006h
        else
        db      4dh, 49h, 44h, 49h, 00h, 1ah
        db      06h
        endif
        db      001h, "PLAY", 000h, 002h, 00ch, 000h, 014h, 0f6h, 007h, 002h, 002h, 050h, 067h
        db      06dh, 03ah, 000h, 007h, 008h, 00ch, "Pad:   =No"
        db      074h, 065h, 03ah, 000h, 007h, 080h, 00ch, "Pad assig"
        db      06eh, 03ah, 000h, 007h, 008h, 016h, "Note:  =Sn"
        if      FW_VERSION = 172
        db      064h, 03ah, 000h, 007h, 008h, "'Mode:", 000h, 000h, 000h
        else
        db      64h, 3ah, 00h, 07h, 08h, 27h, 4dh, 6fh, 64h, 65h, 3ah, 00h, 00h
        endif
STR_ALSO_PLAY_NOTE:
        db      020h, 020h
        db      "Also play note:", 000h
STR_IF_OVER_USE:
        db      "If over:   , use"
        db      3ah, 00h
TBL_WINKEYS_PGM_ASSIGN:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F2, TEXT1_SEG, pgm_params_enter
        WIN_KEY   WIN_K_F3, TEXT1_SEG, purge_midi
        if      FW_VERSION = 172
        WIN_KEY   WIN_K_F4, TEXT2_SEG, L_06206
        endif
        WIN_KEY   WIN_K_PAINT, TEXT1_SEG, track_read_caller
        WIN_KEY   WIN_K_PAD, TEXT1_SEG, L_052D6
        WIN_KEY   WIN_K_UP, TEXT1_SEG, assign_view_key_up
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, assign_view_key_down
        WIN_KEY   WIN_K_LEFT, TEXT1_SEG, assign_view_key_left
        WIN_KEY   WIN_K_RIGHT, TEXT1_SEG, assign_view_key_right
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, L_05C0E
        WIN_KEY   WIN_K_F6, TEXT2_SEG, seq_port_io2
        WIN_KEY   87h, TEXT2_SEG, note_release_latched
        WIN_KEY_END
        if      FW_VERSION = 150
        db      00h
        endif
DL_ASSIGNMENT_VIEW:
        WIN_DIALOG "Assignment View"
        WIN_SOFTKEY 04h, 02h, "CLOSE"
        db      02h
        WIN_LABEL 3dh, 0ah, "Note:  ="
        WIN_LABEL 13h, 0ah, "Bank:"
        WIN_END
P_2033:
        db      20h, 00h
P_2035:
        db      2dh, 2dh, 00h
TBL_WINKEYS_02038:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_PAINT, TEXT1_SEG, track_calc_multi_1
        WIN_KEY   WIN_K_OPEN, TEXT1_SEG, pgm_assign_enter
        WIN_KEY   WIN_K_F4, TEXT1_SEG, pgm_assign_enter
        WIN_KEY   WIN_K_UP, TEXT1_SEG, L_05534
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, L_0555A
        WIN_KEY   WIN_K_LEFT, TEXT1_SEG, X_05580
        WIN_KEY   WIN_K_RIGHT, TEXT1_SEG, L_055A2
        WIN_KEY   WIN_K_PAD, TEXT1_SEG, L_0560A
        WIN_KEY   28h, TEXT1_SEG, timer_poll_wait_2
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, L_05C0E
        WIN_KEY_END
DL_INIT_PAD_ASSIGN:
        WIN_DIALOG "Initialize Pad Assign"
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_RESET_PEN
        WIN_LABEL 25h, 17h, "Initialize pad assign:"
        WIN_END
TBL_WINKEYS_INIT_PAD_ASSIGN:                      ; 6 records + WIN_KEY_END
        WIN_CLEAR
        WIN_END
        db      00h, 00h, 00h
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, L_05DD6
        WIN_KEY   WIN_K_OPEN, TEXT1_SEG, pgm_assign_enter
        WIN_KEY   WIN_K_F4, TEXT1_SEG, pgm_assign_enter
        WIN_KEY   WIN_K_F5, TEXT2_SEG, smem_rep_str
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, L_05C0E
        WIN_KEY_END
        db      00h
TBL_DECAY_MODE_LABELS:
        db      45h, 4eh, 44h, 20h, 20h, 00h, 53h, 54h, 41h, 52h
        db      054h, 000h
TBL_VOICE_OVERLAP_LABELS:
        db      "POLY    ", 000h, "MONO "
        db      020h, 020h, 020h, 000h, "NOTE OFF", 000h, 000h
PARAMS_CURSOR:
        db      000h
VELO_MOD_CURSOR:
        db      001h
VELO_FILTER_CURSOR:
        db      01h
VELO_PITCH_CURSOR:
        db      01h
G_MUTE_ASSIGN_FIELD:
        MG_HOOK_FIELD_INIT
        db      00h
P_2110:
        db      11h
B_2111:
        db      23h
B_2112:
        db      23h, 33h, 1dh, 24h
B_2116:
        db      23h
B_2117:
        db      23h
B_2118:
        db      23h
B_2119:
        db      23h, 24h
B_211B:
        db      23h
B_211C:
        db      23h
B_211D:
        db      23h
B_211E:
        db      23h
B_211F:
        db      0bh
B_2120:
        db      23h
B_2121:
        db      23h
B_2122:
        db      23h
        WIN_END
P_2124:
        db      00h, 00h, 01h, 02h, 04h, 04h, 05h, 04h
        db      07h, 00h
TBL_PARAMS_NAV_DOWN:
        db      01h, 02h, 03h, 03h, 05h, 06h, 06h, 08h, 08h, 00h
TBL_PARAMS_NAV_LEFT:
        db      00h, 01h, 02h, 03h
        db      00h, 01h, 03h, 05h, 06h, 00h
TBL_PARAMS_NAV_RIGHT:
        db      04h, 05h, 06h, 06h, 07h, 07h, 08h, 07h, 08h, 00h
DL_PGM_PARAMS:
        db      001h, 01ah, 001h, 002h, "ASSIGN", 000h, 01ah, 002h, 000h, 050h, 041h
        if      FW_VERSION = 172
        db      "RAMS", 000h, 01ah, 003h, 002h, "MIDI", 000h, 01ah, 004h, 002h
        db      "PURGE", 000h, 01ah, 006h, 001h, "PLAY", 000h, 002h, 007h
        else
        db      52h, 41h, 4dh, 53h, 00h, 1ah, 03h, 02h, 4dh, 49h, 44h, 49h
        db      00h, 1ah, 06h, 01h, 50h, 4ch, 41h, 59h, 00h, 02h, 07h
        endif
        db      002h, 002h, "Pgm:   Note:", 000h, 007h
        db      06eh, 002h, 02dh, 000h, 007h, 002h, 00ch, "<Envelope"
        db      03eh, 000h, 007h, 002h, 016h, "Attack:", 000h, 007h, 008h, 01fh
        db      "Decay:", 000h, 007h, 002h, "(Dcy md"
        db      03ah, 000h, 00fh, 081h, 00ah, 028h, 007h, 086h, 00eh, "<Filter"
        db      03eh, 000h, 007h, 086h, 019h, "Freq:", 000h, 007h, 086h, 024h, 052h, 065h
        db      "son:", 000h, 00fh, 0bah, 00ah, 028h, 007h, 0beh, 00ch, "Tune"
        db      03ah, 000h, 00ch, 0bah, 014h, 03ch, 007h, 0beh, 016h, "Voice", 000h, 007h
        if      FW_VERSION = 172
        db      0beh, 1fh, "Overlap:", 00h, 00h
        else
        db      0beh, 1fh, 4fh, 76h, 65h, 72h, 6ch, 61h, 70h, 3ah, 00h, 00h
        db      00h
        endif
P_2208:
        WIN_KEY_CLEAR
        if      FW_VERSION = 172
        WIN_KEY   WIN_K_F1, TEXT1_SEG, pgm_assign_enter
        else
        db      02h
        dw      pgm_assign_enter
        dw      TEXT1_SEG
        endif
        WIN_KEY   WIN_K_F3, TEXT1_SEG, purge_midi
        if      FW_VERSION = 172
        WIN_KEY   WIN_K_F4, TEXT2_SEG, L_06206
        endif
        WIN_KEY   WIN_K_PAINT, TEXT1_SEG, timer_poll_wait_3
        WIN_KEY   WIN_K_UP, TEXT1_SEG, X_05950
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, L_05968
        WIN_KEY   WIN_K_LEFT, TEXT1_SEG, L_05980
        WIN_KEY   WIN_K_RIGHT, TEXT1_SEG, L_05998
        WIN_KEY   WIN_K_PAD, TEXT1_SEG, pad_note_select
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, L_05EFA
        WIN_KEY   WIN_K_F6, TEXT2_SEG, seq_port_io2
        WIN_KEY   87h, TEXT2_SEG, note_release_latched
        WIN_KEY_END
        if      FW_VERSION = 150
        db      00h
        endif
DL_VELOCITY_MODULATION:
        WIN_DIALOG "Velocity Modulation"
        WIN_SOFTKEY 04h, 02h, "CLOSE"
        WIN_SOFTKEY 05h, 01h, "PLAY"
        db      02h
        WIN_LABEL 19h, 0bh, "Note:"
        WIN_LABEL 5bh, 0bh, "-"
        WIN_RULE 0ch, 13h, 13h, 0d6h
        WIN_LABEL 1fh, 17h, "Velo>Attack:"
        WIN_LABEL 1fh, 21h, "Velo> Start:"
        WIN_LABEL 1fh, 2bh, "Velo> Level:"
        WIN_LABEL 0a9h, 28h, "Velo:"
        WIN_END
        db      00h
P_22C6:
        db      01h, 00h, 00h, 00h, 00h, 32h
        dw      timer_status_check_1, TEXT1_SEG
        db      15h
        dw      pgm_params_enter, TEXT1_SEG
        db      05h
        dw      pgm_params_enter, TEXT1_SEG
        db      18h
        dw      X_05BF6, TEXT1_SEG
        db      19h
        dw      X_05C0C, TEXT1_SEG
        db      17h
L_1D22F:
        dw      X_05C0C, TEXT1_SEG
        db      16h
        dw      X_05BF6, TEXT1_SEG
        db      37h
        dw      timer_status_handler, TEXT1_SEG
        db      34h
        dw      L_05EFA, TEXT2_SEG
        db      06h
        dw      seq_port_io, TEXT2_SEG
        db      86h
        dw      note_release_latched
        dw      TEXT2_SEG  ; reloc
        db      00h, 00h, 00h, 00h, 00h, 00h
DL_VELO_ENV_FILTER:
        WIN_DIALOG "Velo/Env >> filter"
        WIN_SOFTKEY 04h, 02h, "CLOSE"
        WIN_SOFTKEY 05h, 01h, "PLAY"
        db      02h
        WIN_LABEL 19h, 0bh, "Note:"
        WIN_LABEL 5bh, 0bh, "-"
        WIN_RULE 0ch, 13h, 13h, 0d6h
        WIN_LABEL 13h, 17h, "Attack:"
        WIN_LABEL 19h, 21h, "Decay:"
        WIN_LABEL 13h, 2bh, "Amount:"
        db      0fh, 93h, 13h, 20h
        WIN_LABEL 97h, 1ch, "Velo>Freq:"
        WIN_LABEL 0b5h, 28h, "Velo:"
        WIN_END
P_2380:
        db      01h, 00h, 00h, 00h, 00h, 32h
        dw      timer_status_check_2, TEXT1_SEG
        db      15h
        dw      pgm_params_enter, TEXT1_SEG
        db      05h
        dw      pgm_params_enter, TEXT1_SEG
        db      18h
        dw      X_05E0A, TEXT1_SEG
        db      16h
        dw      X_05E44, TEXT1_SEG
        db      19h
        dw      X_05E2E, TEXT1_SEG
        db      17h
        dw      X_05E5C, TEXT1_SEG
        db      37h
        dw      pad_note_select_2, TEXT1_SEG
        db      34h
        dw      L_05EFA, TEXT2_SEG
        db      06h
        dw      seq_port_io, TEXT2_SEG
        db      86h
        dw      note_release_latched
        db      TEXT2_SEG & 0ffh
TBL_WINKEYS_023BB:                      ; 1 records + WIN_KEY_END
        db      TEXT2_SEG >> 8, 00h, 00h, 00h, 00h
        db      00h, 00h
P_23C2:
        db      00h, 00h, 00h
        db      02h, 01h, 02h, 03h, 03h, 00h, 00h, 01h, 02h
P_23CE:
        db      01h, 02h, 03h, 03h
DL_VELO_PITCH:
        WIN_DIALOG "Velo >> Pitch"
        WIN_SOFTKEY 04h, 02h, "CLOSE"
        WIN_SOFTKEY 05h, 01h, "PLAY"
        db      02h
        WIN_LABEL 19h, 0bh, "Note:"
        WIN_LABEL 5bh, 0bh, "-"
        WIN_RULE 0ch, 13h, 13h, 0d6h
        WIN_LABEL 43h, 1ch, "Tune:"
        WIN_LABEL 1fh, 28h, "Prog tempo="
        db      0fh, 87h, 13h, 20h
        WIN_LABEL 8bh, 1ch, "Velo>Pitch:"
        WIN_LABEL 0afh, 28h, "Velo:"
        WIN_END
P_243E:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_PAINT, TEXT1_SEG, timer_status_check_3
        WIN_KEY   WIN_K_OPEN, TEXT1_SEG, pgm_params_enter
        WIN_KEY   WIN_K_F4, TEXT1_SEG, pgm_params_enter
        WIN_KEY   WIN_K_UP, TEXT1_SEG, T1_L_0607E
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, L_06096
        WIN_KEY   WIN_K_LEFT, TEXT1_SEG, L_060AE
        WIN_KEY   WIN_K_RIGHT, TEXT1_SEG, L_060C6
        WIN_KEY   WIN_K_PAD, TEXT1_SEG, pad_note_select_3
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, L_05EFA
        WIN_KEY   WIN_K_F5, TEXT2_SEG, seq_port_io
        WIN_KEY   86h, TEXT2_SEG, note_release_latched
        WIN_KEY_END
        db      00h
; MUTE ASSIGN window, DS:2480h -- call site text1.asm track_calc_multi_2
; (`push 2480h` / disp_list_run).
DL_MUTE_ASSIGN:
        WIN_DIALOG "Mute Assign"
        WIN_SOFTKEY 04h, 02h, "CLOSE"
        WIN_SOFTKEY 05h, 01h, "PLAY"
; 02h before this section (same byte in znEDIT L_038A6); structure unconfirmed,
; raw db.
        db      002h, 007h, 019h, 00bh, "Note:", 000h
        WIN_LABEL 5bh, 0bh, "-"
        WIN_RULE 0ch, 13h, 13h, 0d6h
        MG_HOOK_CAPTION
        WIN_LABEL 19h, 1eh, "Note:"
        WIN_LABEL 5bh, 1eh, "-"
        WIN_LABEL 19h, 27h, "Note:"
        WIN_LABEL 5bh, 27h, "-"
        WIN_END
TBL_WINKEYS_MUTE_ASSIGN:
        if      FW_VERSION = 172
        db      01h, 00h, 00h, 00h, 00h, 32h
        dw      track_calc_multi_2, TEXT1_SEG
        db      15h
        dw      pgm_params_enter, TEXT1_SEG
        db      05h
        dw      pgm_params_enter, TEXT1_SEG
        db      18h
        dw      X_06286, TEXT1_SEG
        db      16h
        dw      X_06286, TEXT1_SEG
        db      19h
        dw      L_0629C, TEXT1_SEG
        db      17h
        dw      L_0629C, TEXT1_SEG
        db      37h
        dw      pad_note_select_4, TEXT1_SEG
        db      34h
        dw      L_05EFA, TEXT2_SEG
        db      06h
        dw      seq_port_io2, TEXT2_SEG
        db      86h
        dw      note_release_latched, TEXT2_SEG
        else
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_PAINT, TEXT1_SEG, track_calc_multi_2
        WIN_KEY   WIN_K_OPEN, TEXT1_SEG, pgm_params_enter
        WIN_KEY   WIN_K_F4, TEXT1_SEG, pgm_params_enter
        WIN_KEY   WIN_K_UP, TEXT1_SEG, X_06286
        WIN_KEY   WIN_K_LEFT, TEXT1_SEG, X_06286
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, L_0629C
        WIN_KEY   WIN_K_RIGHT, TEXT1_SEG, L_0629C
        WIN_KEY   WIN_K_PAD, TEXT1_SEG, pad_note_select_4
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, L_05EFA
        WIN_KEY   WIN_K_F5, TEXT2_SEG, seq_port_io2
        WIN_KEY   86h, TEXT2_SEG, note_release_latched
        endif
        MG_HOOK_KEYS_PAD
P_2522:
        db      00h, 00h
TBL_IGNORE_RECEIVE_LABELS:
        db      "IGNORE ", 000h
        db      52h, 45h, 43h, 45h, 49h, 56h, 45h, 00h
P_2534:
        WIN_CLEAR
        WIN_SOFTKEY 1, 2, "ASSIGN"
        WIN_SOFTKEY 2, 2, "PARAMS"
        WIN_SOFTKEY 3, 0, "MIDI"
        if      FW_VERSION = 172
        WIN_SOFTKEY 4, 2, "PURGE"
        endif
        WIN_RESET_PEN
        WIN_OP4   11h, 00h, 00h, 0f7h, 31h
        WIN_RULE  0bh, 01h, 31h, 0f7h
        WIN_RULE  0eh, 0f7h, 01h, 31h
        WIN_LABEL 02h, 02h, "Sampler MIDI setup"
        WIN_RULE  0ch, 01h, 0ah, 0f6h
        WIN_LABEL 1ah, 0fh, "MIDI volume:"
        WIN_LABEL 08h, 19h, "Program Change:"
        WIN_LABEL 20h, 23h, "Local mode:"
        WIN_LABEL 92h, 0fh, "Current val.:"
        WIN_END
        if      FW_VERSION = 150
        db      00h
        endif
TBL_WINKEYS_PGM_MIDI:                      ; 11 records + WIN_KEY_END
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F1, TEXT1_SEG, pgm_assign_enter
        WIN_KEY   WIN_K_F2, TEXT1_SEG, pgm_params_enter
        if      FW_VERSION = 172
        WIN_KEY   WIN_K_F4, TEXT2_SEG, L_06206
        endif
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, pgm_midi_paint
        WIN_KEY   WIN_K_UP, TEXT1_SEG, pgm_midi_up
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, pgm_midi_down
        WIN_KEY   WIN_K_LEFT, TEXT1_SEG, pgm_midi_left
        WIN_KEY   WIN_K_RIGHT, TEXT1_SEG, t1_copy_pgm_cancel
        WIN_KEY   33h, TEXT2_SEG, pgm_midi_key_33
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, pgm_midi_refresh
        WIN_KEY_END
        if      FW_VERSION = 172
FP_2602:
        db      00h, 00h
FP_2602_SEG:
        db      00h, 00h
P_2606:
        WIN_OP_19
        WIN_END
P_2608:
        WIN_CLEAR
        WIN_SOFTKEY 1, 2, "ASSIGN"
        WIN_SOFTKEY 2, 2, "PARAMS"
        WIN_SOFTKEY 3, 2, "MIDI"
        WIN_SOFTKEY 4, 0, "PURGE"
        WIN_SOFTKEY 6, 1, "DO IT"
        WIN_RESET_PEN
        WIN_OP4   11h, 00h, 00h, 0f7h, 31h
        WIN_RULE  0bh, 01h, 31h, 0f7h
        WIN_RULE  0eh, 0f7h, 01h, 31h
        WIN_BITMAP 19h, 0dh, 00h
        WIN_LABEL 40h, 08h, "Pressing DO IT will erase"
        WIN_LABEL 40h, 11h, "all sounds not used in"
        WIN_LABEL 40h, 1ah, "any programs in memory."
        WIN_LABEL 31h, 25h, "sounds not used in any programs."
        WIN_END
TBL_WINKEYS_PURGE:                      ; 7 records + WIN_KEY_END
        WIN_CLEAR
        WIN_END
        db      00h, 00h, 00h
        WIN_KEY   WIN_K_F1, TEXT1_SEG, pgm_assign_enter
        WIN_KEY   WIN_K_F2, TEXT1_SEG, pgm_params_enter
        WIN_KEY   WIN_K_F3, TEXT1_SEG, purge_midi
        WIN_KEY   WIN_K_F6, TEXT2_SEG, purge_do_it
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, purge_paint
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, L_0619E
        WIN_KEY_END
        else
        db      00h
        endif
PROGRAM_CURSOR:
        WIN_CLEAR
COPY_PGM_CURSOR:
        WIN_CLEAR
G_COPY_NOTE_CURSOR:
        WIN_PLANE_B
COPY_PGM_TO:
        WIN_END
G_LATCHED_PLAY_NOTE:
        db      00h
STR_NO_PROGRAM:
        db      28h, 6eh, 6fh, 20h, 70h, 72h
        db      6fh, 67h, 72h, 61h, 6dh, 29h, 20h, 20h, 20h, 20h, 00h
TBL_WINKEYS_026FE:                      ; 2 records + WIN_KEY_END
        WIN_KEY   2bh, TEXT2_SEG, L_06354
        WIN_KEY   2ch, TEXT2_SEG, L_06398
        WIN_KEY_END
        db      00h
DL_PROGRAM:
        WIN_DIALOG "Program"
        WIN_SOFTKEY 2, 1, "DELETE"
        WIN_SOFTKEY 3, 1, "NEW"
        WIN_SOFTKEY 4, 2, "CLOSE"
        WIN_SOFTKEY 5, 1, "COPY"
        WIN_RESET_PEN
        WIN_LABEL 25h, 13h, "Program name:"
        WIN_LABEL 31h, 25h, "MIDI program change:"
        WIN_END
TBL_WINKEYS_PROGRAM:                      ; 10 records + WIN_KEY_END
P_2768:
        WIN_CLEAR
        WIN_END
        db      00h, 00h, 00h
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, program_paint
        WIN_KEY   WIN_K_OPEN, TEXT2_SEG, program_close
        WIN_KEY   WIN_K_F2, TEXT2_SEG, program_delete
        WIN_KEY   WIN_K_F3, TEXT1_SEG, program_new
        WIN_KEY   WIN_K_F4, TEXT2_SEG, program_close
        WIN_KEY   WIN_K_F5, TEXT1_SEG, t1_program_copy
        WIN_KEY   WIN_K_UP, TEXT1_SEG, X_06540
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, program_down
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, copy_pgm_refresh
        WIN_KEY_END
        db      00h
DL_DELETE_PROGRAM:
        WIN_CONFIRM "Delete Program"
        WIN_SOFTKEY 3, 1, "ALLpgm"
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_RESET_PEN
        WIN_BITMAP 0d9h, 1ch, 01h
        WIN_LABEL 49h, 11h, "Pgm:"
        WIN_LABEL 37h, 1eh, "Pressing DO IT will erase"
        WIN_LABEL 37h, 27h, "this program!!"
        WIN_END
TBL_WINKEYS_DELETE_PGM:                      ; 7 records + WIN_KEY_END
        WIN_CLEAR
        WIN_END
        db      00h, 00h, 00h
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, delete_pgm_paint
        WIN_KEY   WIN_K_OPEN, TEXT2_SEG, t2_copy_pgm_cancel
        WIN_KEY   WIN_K_F3, TEXT2_SEG, delete_pgm_allpgm
        WIN_KEY   WIN_K_F4, TEXT2_SEG, t2_copy_pgm_cancel
        WIN_KEY   WIN_K_F5, TEXT2_SEG, delete_pgm_do_it
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, copy_pgm_refresh
        WIN_KEY_END
; NUL-terminated string in free space. Reached by pointer from elsewhere;
; not bytecode, raw. ?
STR_CANT_DELETE_PLAYING:
        db      "can't delet"
        db      "e while "
        db      "playing!", 000h
DL_DELETE_ALL_PROGRAMS:
        WIN_CONFIRM "Delete ALL Programs"
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_RESET_PEN
        WIN_BITMAP 0d9h, 1ch, 01h
        WIN_BITMAP 3ah, 13h, 00h
        WIN_LABEL 50h, 13h, "Pressing DO IT will erase"
        WIN_LABEL 50h, 1ch, "ALL programs!!"
        WIN_END

L_028B7:
        db      00h
TBL_WINKEYS_DELETE_ALL_PGMS:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, delete_all_pgms_paint
L_028C2:
        WIN_KEY   WIN_K_OPEN, TEXT2_SEG, L_06580
        WIN_KEY   WIN_K_F4, TEXT2_SEG, L_06580
        WIN_KEY   WIN_K_F5, TEXT2_SEG, delete_all_pgms_do_it
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, copy_pgm_refresh
        WIN_KEY_END
        db      00h
DL_CREATE_NEW_PROGRAM:
        WIN_CONFIRM "Create New Program"
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_RESET_PEN
        WIN_LABEL 49h, 13h, "New name:"
        WIN_LABEL 49h, 25h, "MIDI program change:"
        WIN_END
TBL_WINKEYS_0292E:
        if      FW_VERSION = 172
        WIN_CLEAR
        WIN_END
        db      00h, 00h, 00h
        else
        WIN_KEY_CLEAR
        endif
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, L_0666A
        WIN_KEY   WIN_K_OPEN, TEXT2_SEG, t2_copy_pgm_cancel
        WIN_KEY   WIN_K_F4, TEXT2_SEG, t2_copy_pgm_cancel
        WIN_KEY   WIN_K_F5, TEXT2_SEG, seq_select_caller
        WIN_KEY   WIN_K_UP, TEXT1_SEG, X_065CE
X_0294C:
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, L_065E6
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, copy_pgm_refresh
        WIN_KEY_END
; NUL-terminated string; raw. Same shape as above, L_02849's old span.
STR_CANT_CREATE_PLAYING:
        db      "can't "
        db      "create while pla"
        db      "ying!", 000h
        WIN_END
DL_COPY_PROGRAM:
        WIN_CONFIRM "Copy Program"
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_RESET_PEN
        WIN_LABEL 49h, 10h, "Pgm:"
        WIN_BITMAP 85h, 19h, 02h
        WIN_LABEL 97h, 1ch, "COPY"
        WIN_LABEL 49h, 28h, "Pgm:"
        WIN_END
        db      00h
TBL_WINKEYS_COPY_PGM:                      ; 6 records + WIN_KEY_END
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, copy_pgm_paint
        WIN_KEY   WIN_K_OPEN, TEXT2_SEG, t2_copy_pgm_cancel
        WIN_KEY   WIN_K_F4, TEXT2_SEG, t2_copy_pgm_cancel
        WIN_KEY   WIN_K_F5, TEXT2_SEG, copy_pgm_do_it
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, copy_pgm_refresh
        WIN_KEY_END
STR_CANT_COPY_PLAYING:
        db      63h, 61h, 6eh, 27h, 74h, 20h, 63h, 6fh, 70h, 79h, 20h
        db      "while playing!"

L_029F8:
        db      00h, 00h
DL_COPY_NOTE_PARAMS:
        WIN_DIALOG "Copy Note Parameters"
        WIN_SOFTKEY 4, 2, "CLOSE"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_RESET_PEN
        WIN_LABEL 19h, 10h, "COPY"
        WIN_BITMAP 1fh, 19h, 02h
        WIN_LABEL 37h, 0bh, "Prog:"
        WIN_LABEL 37h, 14h, "Note:"
        WIN_RULE 0ch, 37h, 1dh, 0b0h
        WIN_LABEL 37h, 20h, "Prog:"
        WIN_LABEL 37h, 29h, "Note:"
        WIN_END
TBL_COPY_NOTE_PARAMS_KEYS:
        WIN_KEY_CLEAR
        CP_HOOK_PAINT_KEY
        WIN_KEY   WIN_K_OPEN, TEXT2_SEG, program_close
        WIN_KEY   WIN_K_F4, TEXT2_SEG, program_close
        WIN_KEY   WIN_K_F5, TEXT2_SEG, L_0672E
        WIN_KEY   WIN_K_UP, TEXT1_SEG, X_066D6
X_02A7A:
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, X_066EC
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, L_05EFA
        WIN_KEY_END
        db      00h
STR_2A8A:
        db      5eh, 4eh, 4fh, 00h
STR_2A8E:
        db      59h

L_02A8F:
        db      45h, 53h, 00h
P_2A92:
        dw      STR_2A8A
P_2A94:
        dw      DATA_SEG
        dw      STR_2A8E, DATA_SEG
P_2A9A:
        db      20h, 2dh, 20h, 00h, 20h, 31h, 20h, 00h, 20h, 32h, 20h, 00h, 20h, 33h
        db      20h, 00h, 20h, 34h, 20h, 00h, 20h, 35h, 20h, 00h, 20h, 36h, 20h, 00h, 20h, 37h
        db      20h, 00h, 20h, 38h
X_02ABC:
        db      20h, 00h
        db      20h, 2dh, 20h, 00h, 20h, 2dh, 20h, 00h, 31h, 2bh, 32h, 00h, 31h, 2bh, 32h, 00h
        db      33h, 2bh, 34h, 00h, 33h, 2bh, 34h, 00h, 35h, 2bh, 36h, 00h, 35h, 2bh, 36h, 00h
        db      37h, 2bh, 38h, 00h, 37h, 2bh, 38h, 00h, 20h, 2dh
L_02AE8:
        db      20h, 00h
P_2AEA:
        dw      note_pitch_calc_1, TEXT2_SEG
        dw      note_pitch_calc_2, TEXT2_SEG
        dw      note_pitch_calc_3, TEXT2_SEG
        dw      note_str_handler, TEXT2_SEG
        dw      note_pitch_calc_cmd
        db      TEXT2_SEG & 0ffh
TBL_WINKEYS_02AFD:
        WIN_KEY   TEXT2_SEG >> 8, TEXT2_SEG, dispatch_handler_2
P_2B02:
        WIN_KEY   WIN_K_F2, TEXT2_SEG, mixer_indiv_page
        WIN_KEY   WIN_K_F3, TEXT2_SEG, mixer_fxsend_page
        WIN_KEY   WIN_K_F4, TEXT1_SEG, mixer_setup
        WIN_KEY   WIN_K_F5, TEXT2_SEG, far_04206
        WIN_KEY_END
        db      00h
P_2B1C:
        WIN_SOFTKEY 1, 0, "STEREO"
        WIN_SOFTKEY 2, 2, "INDIV"
        WIN_SOFTKEY 4, 2, "SETUP"
        WIN_SOFTKEY 3, 2, "FXsend"
        WIN_SOFTKEY 5, 2, "FXedit"
        WIN_END
        db      00h
TBL_BAR_GLYPHS:
        dw      P_4AB0, DATA_SEG
        dw      P_4AC8, DATA_SEG
        dw      P_4AE0, DATA_SEG
        dw      P_4AF8, DATA_SEG
        dw      P_4B10, DATA_SEG
        dw      P_4B28, DATA_SEG
        dw      P_4B40, DATA_SEG
P_2B6A:
        dw      GLYPH_KNOB_05
P_2B6C:
        dw      DATA_SEG
        dw      GLYPH_KNOB_06, DATA_SEG
        dw      GLYPH_KNOB_07, DATA_SEG
        dw      GLYPH_KNOB_08, DATA_SEG
        dw      GLYPH_KNOB_09, DATA_SEG
        dw      GLYPH_KNOB_10, DATA_SEG
        dw      GLYPH_KNOB_11, DATA_SEG
        dw      GLYPH_KNOB_12, DATA_SEG
P_2B8A:
        dw      note_range_calc_1, TEXT2_SEG
        dw      note_range_calc_2, TEXT2_SEG
        dw      bcd_arithmetic_2, TEXT2_SEG
        dw      bcd_arithmetic_3, TEXT2_SEG
        dw      note_cmd_helper
        db      TEXT2_SEG & 0ffh
TBL_WINKEYS_02B9D:
        WIN_KEY   TEXT2_SEG >> 8, TEXT2_SEG, dispatch_handler_1
P_2BA2:
        if      FW_VERSION = 172
        WIN_KEY   WIN_K_F1, TEXT2_SEG, mixer_stereo_page
        else
        db      02h
        dw      mixer_stereo_page
        dw      TEXT2_SEG
        endif
        WIN_KEY   WIN_K_F3, TEXT2_SEG, mixer_fxsend_page
        WIN_KEY   WIN_K_F4, TEXT1_SEG, mixer_setup
        WIN_KEY   WIN_K_F5, TEXT2_SEG, far_04206
X_02BB7:
        WIN_KEY_END

X_02BBB:
        db      00h
P_2BBC:
        WIN_SOFTKEY 1, 2, "STEREO"
        WIN_SOFTKEY 2, 0, "INDIV"
        WIN_SOFTKEY 4, 2, "SETUP"
        WIN_SOFTKEY 3, 2, "FXsend"
L_02BE2:
        WIN_SOFTKEY 5, 2, "FXedit"
        WIN_END
        db      00h
TBL_NOTE_GLYPHS:
        dw      GLYPH_SMALL_DASH, DATA_SEG
        dw      GLYPH_SMALL_1, DATA_SEG
        dw      GLYPH_SMALL_2, DATA_SEG
        dw      P_4C2E, DATA_SEG
        dw      GLYPH_SMALL_4, DATA_SEG
        dw      GLYPH_SMALL_5, DATA_SEG
        dw      GLYPH_SMALL_6, DATA_SEG

L_02C0A:
        dw      GLYPH_SMALL_7, DATA_SEG
        dw      GLYPH_SMALL_8, DATA_SEG
        dw      GLYPH_SMALL_DASH, DATA_SEG
        dw      GLYPH_SMALL_DASH, DATA_SEG
        dw      GLYPH_PAIR_12, DATA_SEG
        dw      GLYPH_PAIR_12, DATA_SEG
        dw      GLYPH_PAIR_34, DATA_SEG
        dw      GLYPH_PAIR_34, DATA_SEG
        dw      GLYPH_PAIR_56, DATA_SEG
        dw      GLYPH_PAIR_56, DATA_SEG
        dw      GLYPH_PAIR_78, DATA_SEG
        dw      GLYPH_PAIR_78, DATA_SEG
        dw      GLYPH_SMALL_DASH, DATA_SEG
P_2C3E:
        dw      note_range_calc_3, TEXT2_SEG
        dw      note_range_calc_4

L_02C44:
        dw      TEXT2_SEG
        dw      timer_dma_setup, TEXT2_SEG
        dw      timer_dma_setup2, TEXT2_SEG
        dw      note_range_calc_cmd
        db      TEXT2_SEG & 0ffh
TBL_WINKEYS_02C51:
        WIN_KEY   TEXT2_SEG >> 8, TEXT2_SEG, timer_dma_setup3
P_2C56:
        WIN_KEY   WIN_K_F1, TEXT2_SEG, mixer_stereo_page
        WIN_KEY   WIN_K_F2, TEXT2_SEG, mixer_indiv_page
X_02C60:
        WIN_KEY   WIN_K_F4, TEXT1_SEG, mixer_setup
        WIN_KEY   WIN_K_F5, TEXT2_SEG, far_04206
        WIN_KEY_END
        db      00h
P_2C70:
        WIN_SOFTKEY 1, 2, "STEREO"
        WIN_SOFTKEY 2, 2, "INDIV"
        WIN_SOFTKEY 3, 0, "FXsend"
        WIN_SOFTKEY 4, 2, "SETUP"
        WIN_SOFTKEY 5, 2, "FXedit"
        WIN_END
        db      00h
TBL_FX_BUS_LABELS:
        db      2dh, 2dh, 00h, 4dh, 31h, 00h
        db      4dh, 32h, 00h, 52h

X_02CAC:
        db      31h, 00h, 52h, 32h, 00h

L_02CB1:
        db      00h
TBL_WINKEYS_CHANNEL_SETTINGS:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, timer_read_caller
        WIN_KEY   WIN_K_UP, TEXT2_SEG, channel_settings_up
        WIN_KEY   WIN_K_DOWN, TEXT2_SEG, channel_settings_down
        WIN_KEY   WIN_K_LEFT, TEXT2_SEG, channel_settings_left
        WIN_KEY   WIN_K_RIGHT, TEXT2_SEG, channel_settings_right
        WIN_KEY   WIN_K_PAD, TEXT2_SEG, pad_note_select_5
        WIN_KEY   WIN_K_F4, TEXT2_SEG, channel_settings_close
        WIN_KEY   WIN_K_OPEN, TEXT2_SEG, channel_settings_close
        WIN_KEY_END
DL_CHANNEL_SETTINGS:
        WIN_DIALOG "Channel Settings"
        WIN_SOFTKEY 4, 2, "CLOSE"
        WIN_RESET_PEN
        WIN_LABEL 19h, 0bh, "Note:"
        WIN_LABEL 5bh, 0bh, "-"
X_02D12:
        WIN_RULE  0ch, 13h, 13h, 0d6h
        WIN_LABEL 25h, 16h, "STEREO"
        WIN_LABEL 25h, 20h, "Vol:"
        WIN_LABEL 25h, 29h, "Pan:"
        WIN_RULE  0fh, 55h, 13h, 24h
        WIN_LABEL 5bh, 20h, "Vol:"
X_02D3C:
        WIN_LABEL 5bh, 29h, "Out:"
        WIN_LABEL 73h, 16h, "INDIV"
        WIN_LABEL 9dh, 16h, "FX"
        WIN_LABEL 0bbh, 16h, "Follow"
X_02D5D:
        WIN_LABEL 0bbh, 1fh, "stereo:"
        WIN_END

X_02D69:
        db      00h
TBL_CHANSET_FIELD_X:
        db      37h
TBL_CHANSET_FIELD_Y:
        db      0bh
CHANSET_VOL_X:
        db      3dh
CHANSET_VOL_Y:
        db      20h
CHANSET_PAN_X:
        db      3dh
CHANSET_PAN_Y:
        db      29h

CHANSET_IVOL_X:
        db      79h
CHANSET_IVOL_Y:
        db      20h
CHANSET_IOUT_X:
        db      79h
CHANSET_IOUT_Y:
        db      29h
CHANSET_FXLVL_X:
        db      9ah
CHANSET_FXLVL_Y:
        db      20h
CHANSET_FXBUS_X:
        db      9dh
CHANSET_FXBUS_Y:
        db      29h
CHANSET_FOLLOW_X:
        db      0c7h
CHANSET_FOLLOW_Y:
        db      29h
STR_EXT_SND:
        db      2eh, 53h, 4eh

X_02D7D:
        db      044h, 000h
B_2D7F:
        db      000h
STR_DEFAULT_SOUND_NAME:
        db      "sound000     "
        db      20h, 20h, 20h, 00h, 00h

TBL_OFF_ON_LABELS:
        db      4fh, 46h, 46h, 00h, 4fh, 4eh, 20h, 00h
TBL_REC_INPUT_LABELS:
        db      41h, 4eh, 41h

DA_X_02D9D:
        db      "LOG ", 000h, "DIGITAL", 000h
TBL_REC_MODE_LABELS:
        db      04dh, 04fh, 04eh
        db      04fh, 020h, 04ch, 000h, "MONO R", 000h, "STERE"
        db      04fh, 000h, 000h
STR_TIME_TOO_SHORT:
        db      "Time:too"

X_02DC8:
        db      20h, 73h

X_02DCA:
        db      "hort to record", 000h, 000h
REC_CURSOR:
        db      00h, 00h
P_2DDC:
        db      00h, 00h, 00h, 10h, 00h, 01h, 00h, 10h, 0ffh, 0ffh, 1fh, 00h, 00h, 0f0h
        db      40h, 11h

X_02DEC:
        db      00h, 00h, 00h

X_02DEF:
        db      00h, 0e1h

X_02DF1:
        db      02h

X_02DF2:
        db      1ah, 74h

X_02DF4:
        db      0ffh, 0ffh, 0ffh, 3fh, 47h, 01h, 0f0h, 7fh, 80h
TBL_WINKEYS_02DFD:                      ; 1 records + WIN_KEY_END
        db      80h, 00h, 00h, 00h, 00h                           ; [0] key 80h         -> 0000h:0000h
        db      00h, 00h, 00h, 00h, 00h                           ; WIN_KEY_END
        db      00h
BUF_REC_METER_BAR:
        db      0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah
        db      0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah
        db      0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 00h
W_2E2C:
        db      00h, 00h, 00h, 00h
TBL_2E30:
        db      08h, 10h, 18h
P_2E33:
        db      19h
        db      00h, 00h
REC_INPUT_X:
        db      25h
REC_INPUT_Y:
        db      01h
REC_MODE_X:
        db      79h
REC_MODE_Y:
        db      01h
B_2E3A:
        db      0d9h
B_2E3B:
        db      01h
REC_THRESH_X:
        db      3dh
REC_THRESH_Y:
        db      0ah
REC_TIME_X:
        db      79h
REC_TIME_Y:
        db      0ah

B_2E40:
        db      0d9h
B_2E41:
        db      0ah

TBL_WINKEYS_02E42:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_F1, TEXT1_SEG, X_07332
        WIN_KEY   WIN_K_F2, TEXT1_SEG, X_07332
        WIN_KEY   WIN_K_F6, TEXT1_SEG, L_0733E
        WIN_KEY   WIN_K_OPEN, TEXT2_SEG, tgt_07DB2
        WIN_KEY   WIN_K_LEFT, TEXT1_SEG, X_074B8
        WIN_KEY   WIN_K_RIGHT, TEXT1_SEG, X_074CE
        WIN_KEY   WIN_K_UP, TEXT1_SEG, X_07488
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, X_074A0
        WIN_KEY   WIN_K_PAINT, TEXT1_SEG, L_0754E
        WIN_KEY   33h, TEXT1_SEG, lcd_port_handler
        WIN_KEY   WIN_K_REFRESH, TEXT1_SEG, L_07524
        WIN_KEY_END
        db      00h
P_2E84:
        db      01h, 02h, 07h, 01h, 01h, 49h, 6eh, 70h, 75h, 74h
        db      03ah, 000h, 007h, 05bh, 001h, "Mode:", 000h, 007h, 0a9h, 001h, 04dh, 06fh
        db      "nitor:", 000h, 007h, 001h, 00ah, "Thresh"
        db      "old:", 000h, 007h, 05bh, 00ah, "Time:", 000h, 007h, 097h
        db      00ah, 073h, 000h, 007h, 0a9h, 00ah, "Pre-r"

X_02EC9:
        db      065h, 063h, 03ah, 020h, 020h, 020h, 06dh, 073h, 000h, 007h, 055h, 015h, "LEVE"
        db      "L METER", 000h, 007h, 004h, 01eh, "LEFT "
        db      03ah, 000h, 007h, 004h, "'RIGHT:", 000h, 011h, 002h, 033h, 049h
        db      009h, 007h, 009h, "4RESET"

L_02F02:
        db      " PEAK", 000h, 01ah, 006h, 001h, "RECORD", 000h
        db      00h, 00h
TBL_WINKEYS_02F14:
        WIN_KEY   WIN_K_F5, TEXT2_SEG, X_07D92
        WIN_KEY   WIN_K_F6, TEXT1_SEG, X_0765E
        WIN_KEY   WIN_K_PAINT, TEXT1_SEG, X_07692
        WIN_KEY   33h, TEXT1_SEG, ctrl_stub_init
        WIN_KEY_END
        db      00h
DL_WAITING_FOR_INPUT:
        db      02h, 07h, 01h, 34h, 57h, 61h, 69h, 74h, 69h, 6eh
        db      "g for input sign"
        db      061h, 06ch, 02eh, 02eh, 02eh, 000h, 01ah, 005h, 001h, "CANCEL", 000h
        db      1ah, 06h, 01h, 53h, 54h, 41h

X_02F5E:
        db      52h, 54h, 00h, 00h
TBL_WINKEYS_02F62:                      ; 4 records + WIN_KEY_END
        WIN_KEY   WIN_K_F5, TEXT1_SEG, X_076BE
        WIN_KEY   WIN_K_F6, TEXT1_SEG, X_076D0
        WIN_KEY   WIN_K_PAINT, TEXT1_SEG, X_07692
        WIN_KEY   33h, TEXT1_SEG, ctrl_stub_init
        WIN_KEY_END
        db      00h
DL_RECORDING:
        db      02h, 07h, 01h, 34h, 52h, 65h, 63h, 6fh, 72h, 64h, 69h, 6eh, 67h, 2eh, 2eh, 2eh, 00h, 1ah, 05h, 01h, 43h, 41h, 4eh, 43h, 45h, 4ch, 00h, 1ah, 06h, 01h, 53h, 54h, 4fh, 50h, 00h, 00h
DL_SOUND_MEMORY:
        WIN_DIALOG "Sound memory"
        WIN_SOFTKEY 04h, 02h, "CLOSE"
        db      02h
        WIN_LABEL 31h, 0ch, "Free memory(time):"
        db      07h, 0bbh

X_02FD4:
        db      00ch, 073h, 065h, 063h, 000h, 007h, "O(Megabyte"
        db      "s installed", 000h, 011h, 017h, 019h, 0c8h
        db      0ah, 0bh, 16h, 17h, 0cah, 0bh, 16h, 24h, 0cah, 0eh, 15h, 18h, 0ch, 0eh, 0e0h, 18h
        db      0dh, 0bh, 17h, 25h, 0cah, 0eh, 0e1h, 19h, 0ch, 00h
P_300E:
        db      0ch, 17h, 1ah
B_3011:
        db      0c8h, 0ch, 18h
        db      1bh
B_3015:
        db      0c7h, 0ch, 17h, 1ch
B_3019:
        db      0c8h, 0ch, 18h, 1dh
B_301D:
        db      0c7h, 0ch, 17h, 1eh
B_3021:
        db      0c8h, 0ch, 18h
        db      1fh
B_3025:
        db      0c7h, 0ch, 17h, 20h
B_3029:
        db      0c8h, 0ch, 18h, 21h
B_302D:
        db      0c7h, 00h, 00h
TBL_WINKEYS_03030:                      ; 5 records + WIN_KEY_END
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_PAINT, TEXT1_SEG, math_calc_handler
        WIN_KEY   WIN_K_OPEN, TEXT1_SEG, X_0776E
        WIN_KEY   WIN_K_F4, TEXT1_SEG, X_0776E
        WIN_KEY   WIN_K_REFRESH, TEXT1_SEG, L_07524
        WIN_KEY_END
P_304E:
        WIN_PRINT "processing..."
        WIN_END
PTR_DL_PROCESSING:
        dw      P_304E
PTR_DL_PROCESSING_SEG:
        dw      DATA_SEG
G_WAVE_ZOOM:
        db      04h, 00h
W_3064:
        db      00h, 00h
W_3066:
        db      00h, 00h
G_SND_EDIT_PAGE:                      ; 1 records + WIN_KEY_END
        db      04h
G_PLAY_MODE:
        db      00h
FP_SND_SECONDARY:
        db      00h, 00h
FP_SND_SECONDARY_SEG:
        db      00h
        db      00h, 00h, 00h, 00h, 00h                           ; WIN_KEY_END
TBL_LOOP_LEN_MODE_LABELS:
        db      "VARI", 000h, "^FIX", 000h
TBL_EDIT_RANGE_LABELS:
        db      "ALL   "
        db      020h, 020h, 000h, "ZONE    ", 000h, "BEFO"
        db      052h, 020h, 05ah, 06eh, 000h, "AFTER Zn", 000h, 042h, 045h
        db      "FOR ST", 000h, "AFTR END", 000h
TBL_LEFT_RIGHT_LABELS:
        db      "LEFT ", 000h, "RIGHT", 000h
TBL_MONO_STEREO_LABELS:
        db      "MONO"
        db      000h, 000h, 000h, "STEREO", 000h
P_30CC:
        db      001h, 020h, 054h, 052h

X_030D0:
; F1-F6 labels for TRIM/LOOP/znEDIT/PARAMS: type 01h (line above, spans blob
; boundary): "TRIM", "LOOP", "znEDIT", "PARAMS", "", "PLAY X".
        db      049h, 04dh, 000h, "LOOP", 000h
        ZS_HOOK_SOFTKEY
        db      00h, 50h
        db      "ARAMS", 000h, 000h, "PLAY X", 000h, 002h, 007h
        db      9dh, 01h, 50h, 4ch, 41h, 59h, 20h, 58h, 3ah, 00h, 00h, 00h
P_30FC:
        WIN_PLANE_B
        WIN_OP4   13h, 17h, 10h, 6eh, 1bh
        WIN_RESET_PEN
        WIN_OP4   11h, 16h, 0fh, 70h, 1dh
        WIN_RULE  0bh, 16h, 2ch, 70h
        WIN_RULE  0eh, 86h, 10h, 1dh
        WIN_RULE  0bh, 17h, 1dh, 6eh
        WIN_PLANE_C
        WIN_RULE  0eh, 4eh, 10h, 1bh
        WIN_RESET_PEN
        WIN_END
STR_KBYTES:
        db      6bh, 62h, 79h, 74h, 65h
        db      73h, 00h

P_3122:
        db      02eh, 000h
STR_MBYTES:
        db      "Mbytes", 000h

X_0312B:
        db      00h
DL_SOUND_INFO:
        WIN_DIALOG "Sound"
        WIN_SOFTKEY 2, 1, "DELETE"
        WIN_SOFTKEY 3, 1, "CONVRT"
        WIN_SOFTKEY 4, 2, "CLOSE"
        WIN_SOFTKEY 5, 1, "COPY"
        WIN_RESET_PEN
        WIN_RULE 0ch, 12h, 19h, 0d5h
        if      FW_VERSION = 172
        db      007h, 019h, 01eh, "<Sound "

        db      "spec.>", 000h, 007h, "%'Type:", 000h
        db      007h, 08bh, 01eh, "Rate:      Hz"
        db      000h, 007h, 08bh, "'Size:", 000h, 000h
        else
        WIN_LABEL 19h, 1eh, "<Sound spec.>"
        WIN_LABEL 25h, 27h, "Type:"
        WIN_LABEL 8bh, 1eh, "Rate:      Hz"
        WIN_LABEL 8bh, 27h, "Size:"
        WIN_END
        endif
STR_EDIT_COPY_TO_RAM:
        db      054h, 06fh, 020h, 065h, 064h
        db      69h

X_0319C:
        db      "t, copy"

L_031A3:
        db      " to RAM first.", 000h
STR_SOUND_NAME_LBL:
        db      053h
        db      6fh, 75h, 6eh, 64h, 20h, 6eh, 61h, 6dh, 65h, 3ah, 00h
TBL_WINKEYS_031BE:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, X_08736
        WIN_KEY   WIN_K_F2, TEXT2_SEG, L_0855C
        WIN_KEY   WIN_K_F3, TEXT2_SEG, X_0D356
        WIN_KEY   WIN_K_F4, TEXT2_SEG, snd_edit_page_return
        WIN_KEY   WIN_K_F5, TEXT2_SEG, L_0868A
        WIN_KEY   WIN_K_OPEN, TEXT2_SEG, snd_edit_page_return
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, snd_window_refresh_key
        WIN_KEY_END
P_31EB:
        WIN_OP_19
X_031EC:
        WIN_END
        db      00h
DL_DELETE_SOUND:
        WIN_CONFIRM "Delete Sound"
        WIN_SOFTKEY 3, 1, "ALL"
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_RESET_PEN
        WIN_BITMAP 0d9h, 1ch, 01h
        WIN_LABEL 37h, 1eh, "Pressing DO IT will erase"
        WIN_LABEL 37h, 27h, "this sound !!"
        WIN_END
STR_ROM_1:
        db      52h, 6fh, 6dh, 3ah, 00h
STR_SND_1:
        db      53h
        db      6eh, 64h, 3ah, 00h
TBL_WINKEYS_DELETE_SOUND:
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, delete_sound_paint
        WIN_KEY   WIN_K_OPEN, TEXT2_SEG, snd_edit_page_return
        WIN_KEY   WIN_K_F3, TEXT2_SEG, delete_sound_all
        WIN_KEY   WIN_K_F4, TEXT2_SEG, snd_edit_page_return
L_0326C:
        WIN_KEY   WIN_K_F5, TEXT2_SEG, sample_voice_init
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, snd_window_refresh_key
        WIN_KEY_END
P_327B:
        WIN_OP_19
        WIN_END
        WIN_END
DL_DELETE_ALL_SOUNDS:
        WIN_CONFIRM "Delete ALL Sounds"
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_RESET_PEN
        WIN_BITMAP 0d9h, 1ch, 01h
        WIN_BITMAP 3ah, 13h, 00h
        WIN_LABEL 50h, 13h, "Pressing DO IT will erase"
        WIN_LABEL 50h, 1ch, "ALL sounds!!"
        WIN_END
        WIN_END
TBL_WINKEYS_DELETE_ALL_SOUNDS:
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, delete_all_sounds_paint
        WIN_KEY   WIN_K_OPEN, TEXT2_SEG, snd_edit_page_return
        WIN_KEY   WIN_K_F4, TEXT2_SEG, snd_edit_page_return
        WIN_KEY   WIN_K_F5, TEXT2_SEG, delete_all_sounds_do_it
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, snd_window_refresh_key
X_032FA:
        WIN_KEY_END
P_32FE:
        WIN_OP_19
L_032FF:
        WIN_END

DL_COPY_SOUND:
        WIN_CONFIRM "Copy Sound"
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_RESET_PEN
        WIN_LABEL 5bh, 10h, "Snd:"
X_0332C:
        WIN_BITMAP 85h, 19h, 02h
        WIN_LABEL 97h, 1ch, "COPY"
        WIN_LABEL 3dh, 28h, "New Name:"
        WIN_END
DL_COPY_TO_RAM:
        WIN_CONFIRM "Copy to RAM"
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_RESET_PEN
        WIN_LABEL 5bh, 10h, "Rom:"
        WIN_BITMAP 85h, 19h, 02h
        WIN_LABEL 97h, 1ch, "COPY"
        WIN_LABEL 3dh, 28h, "New Name:"
        WIN_END
        db      00h
TBL_WINKEYS_0338E:                      ; 6 records + WIN_KEY_END
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, L_08A3C
        WIN_KEY   WIN_K_OPEN, TEXT2_SEG, snd_edit_page_return
        WIN_KEY   WIN_K_F4, TEXT2_SEG, snd_edit_page_return
        WIN_KEY   WIN_K_F5, TEXT2_SEG, voice_init_caller
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, snd_window_refresh_key
        WIN_KEY_END
        db      00h
TRIM_CURSOR:
        db      00h
START_FINE_CURSOR:
        db      00h
END_FINE_CURSOR:
        db      00h
STR_ROM_2:
        db      52h, 6fh, 6dh, 3ah, 00h
STR_SND_2:
        db      53h, 6eh
        db      64h, 3ah, 00h, 00h
DL_TRIM:
        db      21h, 00h, 02h, 02h, 02h, 00h, 01h, 1ah

L_033C8:
        db      05h, 01h, 43h, 55h, 54h, 00h, 02h, 0bh, 01h, 14h, 0f6h, 07h, 08h, 0ch, 53h, 74h
        db      03ah, 000h, 007h, 062h, 00ch, "End:", 000h, 007h, 0b6h, 00ch, 056h, 069h, 065h
        db      77h, 3ah, 00h, 0bh, 01h, 22h, 0f5h, 00h
TBL_WINKEYS_TRIM:
        db      01h, 00h, 00h, 00h, 00h, 03h
        dw      fit_to_length_cancel, TEXT1_SEG
        db      04h
        dw      zone_screen_enter, TEXT1_SEG
        db      05h
        dw      snd_params_screen_enter, TEXT1_SEG
        db      06h
        dw      L_09544, TEXT2_SEG
        db      32h
        dw      X_09124, TEXT2_SEG
        db      18h
        dw      X_078A8, TEXT1_SEG

L_03413:
        db      19h
        dw      X_078D2, TEXT1_SEG
        db      16h
        dw      X_0790E, TEXT1_SEG
        db      17h
        dw      X_078F8, TEXT1_SEG
        db      33h
        dw      L_09116, TEXT2_SEG
        db      07h
        dw      edit_range_select, TEXT2_SEG
        db      87h
        dw      X_07F14, TEXT2_SEG
TBL_WINKEYS_03431:
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, snd_window_refresh_key
        WIN_KEY   WIN_K_PAD, TEXT2_SEG, snd_window_pad_key
        WIN_KEY_END
DL_START_FINE:
        WIN_DIALOG "Start fine"
        WIN_SOFTKEY 2, 1, "ZOOM-"
        WIN_SOFTKEY 3, 1, "ZOOM+"
        WIN_SOFTKEY 4, 2, "CLOSE"
        WIN_SOFTKEY 5, 1, "PLAY X"
        WIN_RESET_PEN
        WIN_LABEL 91h, 0ch, "Start:"
        WIN_LABEL 91h, 15h, "Lngth="
        WIN_LABEL 8bh, 1fh, "Smpl Lngth:"
L_1E2F1:
        WIN_LABEL 8bh, 28h, "PLAY X:"
        WIN_END
        db      00h
P_34A6:
        db      01h, 00h, 00h

L_034A9:
        db      00h, 00h, 32h
        dw      L_09210, TEXT2_SEG
        db      18h

L_034B1:
        dw      X_0799E, TEXT1_SEG
        db      19h
        dw      X_079B4

X_034B8:
        dw      TEXT1_SEG
        db      15h

L_034BB:
        dw      trim_screen_enter, TEXT1_SEG
        db      03h
        dw      wave_zoom_double, TEXT2_SEG
        db      04h
        dw      wave_zoom_halve, TEXT2_SEG
        db      05h
        dw      trim_screen_enter, TEXT1_SEG
        db      06h

L_034CF:
        dw      X_092A8, TEXT2_SEG
        db      86h

L_034D4:
        dw      X_07F14
        dw      TEXT2_SEG  ; reloc
TBL_WINKEYS_034D8:
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, snd_window_refresh_key
        WIN_KEY   WIN_K_PAD, TEXT2_SEG, snd_window_pad_key
        WIN_KEY_END
        db      00h
DL_END_FINE:
        WIN_DIALOG "End fine"
        WIN_SOFTKEY 2, 1, "ZOOM-"
        WIN_SOFTKEY 3, 1, "ZOOM+"
        WIN_SOFTKEY 4, 2, "CLOSE"
        WIN_SOFTKEY 5, 1, "PLAY X"
        WIN_RESET_PEN
X_0351C:
        WIN_LABEL 9dh, 0ch, "End:"
        WIN_LABEL 91h, 15h, "Lngth="
        WIN_LABEL 8bh, 1fh, "Smpl Lngth:"
        WIN_LABEL 8bh, 28h, "PLAY X:"
        WIN_END
        db      00h
P_354A:
        db      01h, 00h, 00h, 00h, 00h, 32h
        dw      L_092C2, TEXT2_SEG
        db      18h
        dw      X_07A2C, TEXT1_SEG
        db      19h
        dw      X_07A42, TEXT1_SEG
        db      15h

L_0355F:
        dw      trim_screen_enter, TEXT1_SEG
        db      03h
        dw      wave_zoom_double, TEXT2_SEG
        db      04h
        dw      wave_zoom_halve, TEXT2_SEG
        db      05h
        dw      trim_screen_enter, TEXT1_SEG
        db      06h

L_03573:
        dw      X_0935A, TEXT2_SEG
        db      86h

L_03578:
        dw      X_07F14
        dw      TEXT2_SEG  ; reloc
TBL_WINKEYS_0357C:
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, snd_window_refresh_key
        WIN_KEY   WIN_K_PAD, TEXT2_SEG, snd_window_pad_key
        WIN_KEY_END
P_358B:
        WIN_OP_19
        WIN_END
        db      00h
DL_DISCARD:
        WIN_CONFIRM "Discard"
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_RESET_PEN
        WIN_LABEL 55h, 0eh, "st"
        WIN_LABEL 97h, 0eh, "end"
        WIN_LABEL 0d3h, 1ch, ">"
        WIN_RULE  0bh, 59h, 16h, 05h
        WIN_RULE  0bh, 5ah, 17h, 03h
        WIN_RULE  0bh, 5bh, 18h, 01h
        WIN_RULE  0bh, 9dh, 16h, 05h
        WIN_RULE  0bh, 9eh, 17h, 03h
        WIN_RULE  0bh, 9fh, 18h, 01h
        WIN_OP4   12h, 49h, 19h, 0fh, 06h
        WIN_OP4   11h, 5bh, 19h, 45h, 06h
        WIN_OP4   12h, 0a3h, 19h, 0fh, 06h
        WIN_RULE  0fh, 4fh, 1fh, 08h
        WIN_RULE  0fh, 0abh, 1fh, 08h
        WIN_RULE  0ch, 0c7h, 1fh, 12h
        WIN_RULE  0fh, 0c7h, 1fh, 08h
        WIN_RULE  0ch, 4fh, 25h, 78h
L_035FC:
        WIN_BITMAP 0d9h, 1ch, 01h
        WIN_LABEL 49h, 2ah, "DO IT will discard!!"
        WIN_END
        db      00h

TBL_WINKEYS_DISCARD:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, discard_paint
        WIN_KEY   WIN_K_F4, TEXT1_SEG, trim_screen_enter
        WIN_KEY   WIN_K_F5, TEXT2_SEG, discard_do_it
        WIN_KEY   WIN_K_OPEN, TEXT1_SEG, trim_screen_enter
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, snd_window_refresh_key
        WIN_KEY   WIN_K_PAD, TEXT2_SEG, snd_window_pad_key
        WIN_KEY_END
LOOP_CURSOR:
        db      00h
LOOP_FINE_CURSOR:
        db      00h
STR_ROM_3:
        db      52h, 6fh, 6dh, 3ah

X_03648:
        db      000h
STR_SND_3:
        db      "Snd:", 000h
P_364E:
        db      021h, 002h, 000h, 002h, 002h, 000h, 001h, 01ah

DA_X_03656:
        db      05h, 01h, 46h, 49h, 54h, 00h, 02h, 0bh, 01h, 14h, 0f6h, 07h, 02h, 0ch, 54h, 6fh
        db      03ah, 000h, 007h, 056h, 00ch, "Lngth:", 000h, 007h, 0bch, 00ch

X_03675:
        db      "Loop"

L_03679:
        db      3ah, 00h, 0bh, 01h, 22h, 0f5h, 00h
P_3680:
        db      01h, 00h, 00h, 00h, 00h, 02h
        dw      trim_screen_enter, TEXT1_SEG
        db      04h
        dw      zone_screen_enter, TEXT1_SEG
        db      05h
        dw      snd_params_screen_enter, TEXT1_SEG
        db      06h
        dw      X_09B20, TEXT2_SEG
        db      32h
        dw      X_0991C, TEXT2_SEG
        db      18h
        dw      X_07B36, TEXT1_SEG
        db      19h

L_036A4:
        dw      X_07B60, TEXT1_SEG
        db      16h

L_036A9:
        dw      X_07B86, TEXT1_SEG
        db      17h
        dw      X_07B9C, TEXT1_SEG
        db      07h
        if      FW_VERSION = 172

L_036B3:
        dw      edit_range_select
        dw      TEXT2_SEG
        else
        dw      edit_range_select, TEXT2_SEG
        endif
        db      87h
        dw      X_07F14

L_036BA:
        dw      TEXT2_SEG  ; reloc
TBL_WINKEYS_036BC:
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, snd_window_refresh_key
        WIN_KEY   WIN_K_PAD, TEXT2_SEG, snd_window_pad_key
        WIN_KEY   33h, TEXT2_SEG, L_09522
        WIN_KEY_END
DL_LOOP_FINE:
        WIN_DIALOG "Loop fine"
        WIN_SOFTKEY 2, 1, "ZOOM-"
        WIN_SOFTKEY 3, 1, "ZOOM+"
        WIN_SOFTKEY 4, 2, "CLOSE"
X_036FA:
        WIN_SOFTKEY 5, 1, "PLAY X"
        WIN_RESET_PEN
        WIN_LABEL 0a3h, 0ch, "To:"
        WIN_LABEL 91h, 15h, "Lngth:"
        WIN_LABEL 8bh, 1fh, "Loop Lngth:"
        WIN_LABEL 8bh, 28h, "PLAY X:"
        WIN_END
        db      00h

P_3732:
        db      01h, 00h, 00h, 00h, 00h, 32h
        dw      DISPLAY_DRAW_PAIR, TEXT2_SEG

L_0373C:
        db      18h
        dw      L_07C32, TEXT1_SEG
        db      19h
        dw      X_07C48
        dw      TEXT1_SEG
        db      15h

L_03747:
        dw      fit_to_length_cancel, TEXT1_SEG
        db      03h
        dw      wave_zoom_double, TEXT2_SEG
        db      04h
        dw      wave_zoom_halve, TEXT2_SEG
        db      05h
        dw      fit_to_length_cancel, TEXT1_SEG
        db      06h

L_0375B:
        dw      X_09A88, TEXT2_SEG
        db      86h

L_03760:
        dw      X_07F14, TEXT2_SEG
TBL_WINKEYS_03764:
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, snd_window_refresh_key
        WIN_KEY   WIN_K_PAD, TEXT2_SEG, snd_window_pad_key
        WIN_KEY_END
        db      00h
DL_FIT_TO_LENGTH:
        WIN_CONFIRM "Fit to length"
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_RESET_PEN
        WIN_LABEL 49h, 13h, "When DO IT is pressed,"
        WIN_LABEL 49h, 1ch, "loop length will be fitted"
        WIN_LABEL 49h, 25h, "to sample length !!"
        WIN_END

L_037EB:
        db      00h
TBL_WINKEYS_FIT_TO_LENGTH:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, fit_to_length_paint
        WIN_KEY   WIN_K_OPEN, TEXT1_SEG, fit_to_length_cancel
        WIN_KEY   WIN_K_F4, TEXT1_SEG, fit_to_length_cancel
        WIN_KEY   WIN_K_F5, TEXT2_SEG, track_data_far
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, snd_window_refresh_key
        WIN_KEY   WIN_K_PAD, TEXT2_SEG, snd_window_pad_key
        WIN_KEY_END
TBL_ZONE_ACTION_LABELS:
        db      5ah, 4fh, 4eh, 45h, 2dh, 3eh

X_0381A:
        db      "NEW SAMPLE      "
        db      020h, 020h, 000h, "INSERT Sound-"
        db      ">ZONE START", 000h, "DELE"
        db      54h, 45h, 20h, 5ah

X_0384E:
        db      "ONE             "
        db      000h, "SILENCE ZONE   "
        db      020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 000h, "REVERS"
        db      "E ZONE "

L_03885:
        db      20h, 20h, 20h, 20h, 20h, 20h, 20h

X_0388C:
        db      020h, 020h, 020h, 020h, 000h
STR_ROM_4:
        db      "Rom:", 000h
STR_SND_4:
        db      053h, 06eh

X_03898:
        db      64h, 3ah, 00h, 00h

; ZONE EDIT/TRIM window, no title, text1.asm L_07D5A (push 389ch /
; disp_list_run). Opcode 21h unrepeated (unlike WIN_DIALOG 22h
; byte-identical twice), raw db.
P_389C:
        db      21h, 02h, 02h, 00h, 02h, 00h, 01h
        WIN_SOFTKEY 05h, 01h, "EDIT"

L_038A6:
; 02h mid-record. MUTE ASSIGN 02h shows different operand count, shape
; contradicted, raw db.
        db      02h, 0bh, 01h, 14h, 0f6h
        WIN_LABEL 08h, 0ch, "St:"
        WIN_LABEL 62h, 0ch, "End:"
        ZS_HOOK_VIEW_LABEL
; trailing bytes before WIN_END terminator (position confirmed). Next:
; win_keys_merge array for this window, text1.asm L_07D5A (push 38ceh).
; Opcode/operand split unconfirmed, raw db.
        db      0bh, 01h, 22h, 0f5h, 00h
        WIN_END
P_38CE:
        db      01h, 00h, 00h, 00h, 00h, 02h
        dw      trim_screen_enter, TEXT1_SEG
        db      03h
        dw      fit_to_length_cancel, TEXT1_SEG
        db      05h
        dw      snd_params_screen_enter, TEXT1_SEG
        db      06h
        dw      X_0A0CA, TEXT2_SEG
        db      07h
        dw      edit_range_select, TEXT2_SEG
        db      87h
        dw      X_07F14, TEXT2_SEG
TBL_WINKEYS_ZONE_START_FINE:                      ; 8 records + WIN_KEY_END
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, zone_start_fine_paint
        WIN_KEY   WIN_K_UP, TEXT1_SEG, zone_start_fine_up
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, zone_start_fine_down
        WIN_KEY   WIN_K_LEFT, TEXT1_SEG, zone_start_fine_left
        WIN_KEY   WIN_K_RIGHT, TEXT1_SEG, zone_start_fine_right
        WIN_KEY   33h, TEXT2_SEG, zone_start_fine_key_33
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, snd_window_refresh_key
        WIN_KEY   WIN_K_PAD, TEXT2_SEG, snd_window_pad_key
        WIN_KEY_END
DL_ZONE_START_FINE:
        WIN_DIALOG "Zone start fine"
        WIN_SOFTKEY 2, 1, "ZOOM-"
        WIN_SOFTKEY 3, 1, "ZOOM+"
        WIN_SOFTKEY 4, 2, "CLOSE"
        WIN_SOFTKEY 5, 1, "PLAY X"
        WIN_RESET_PEN
        WIN_LABEL 91h, 0ch, "Start:"
L_1E7BB:
        WIN_LABEL 91h, 15h, "Lngth="
        WIN_LABEL 8bh, 1fh, "Zone Lngth:"
        WIN_LABEL 8bh, 28h, "PLAY X:"
        WIN_END
TBL_WINKEYS_ZONE_END_FINE:
        WIN_CLEAR
        WIN_END
        db      00h, 00h, 00h, 32h
        dw      L_09E4E, TEXT2_SEG
        db      18h
        if      FW_VERSION = 172

tgt_03993:
        endif
        dw      X_07DC8, TEXT1_SEG
        db      19h
        dw      X_07DDE, TEXT1_SEG
        db      15h
        dw      zone_screen_enter, TEXT1_SEG
        db      03h
        dw      wave_zoom_double, TEXT2_SEG
        db      04h
        dw      wave_zoom_halve, TEXT2_SEG
        db      05h
        dw      zone_screen_enter, TEXT1_SEG
        db      06h
        dw      X_09ED0, TEXT2_SEG
        db      86h
        dw      X_07F14, TEXT2_SEG
TBL_WINKEYS_039BA:                      ; 2 records + WIN_KEY_END
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, snd_window_refresh_key
        WIN_KEY   WIN_K_PAD, TEXT2_SEG, snd_window_pad_key
        WIN_KEY_END
        db      00h
DL_ZONE_END_FINE:
        WIN_DIALOG "Zone End fine"
        WIN_SOFTKEY 2, 1, "ZOOM-"
        WIN_SOFTKEY 3, 1, "ZOOM+"
        WIN_SOFTKEY 4, 2, "CLOSE"
        WIN_SOFTKEY 5, 1, "PLAY X"
        WIN_RESET_PEN
        WIN_LABEL 9dh, 0ch, "End:"
        WIN_LABEL 91h, 15h, "Lngth="
        WIN_LABEL 8bh, 1fh, "Zone Lngth:"
        WIN_LABEL 8bh, 28h, "PLAY X:"
        WIN_END
P_3A30:
        WIN_CLEAR
        WIN_END
        db      00h, 00h, 00h, 32h
        dw      X_09EEA, TEXT2_SEG
        db      18h
        dw      X_07E50, TEXT1_SEG
        db      19h
        dw      X_07E66, TEXT1_SEG
        db      15h
        dw      zone_screen_enter, TEXT1_SEG
        db      03h
        dw      wave_zoom_double, TEXT2_SEG
        db      04h
        dw      wave_zoom_halve, TEXT2_SEG
        db      05h
        dw      zone_screen_enter, TEXT1_SEG
        db      06h
        dw      X_09F6C, TEXT2_SEG
        db      86h
        dw      X_07F14, TEXT2_SEG
TBL_WINKEYS_03A62:                      ; 2 records + WIN_KEY_END
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, snd_window_refresh_key
        WIN_KEY   WIN_K_PAD, TEXT2_SEG, snd_window_pad_key
        WIN_KEY_END
        db      00h
DL_ZONE_EDIT:
        WIN_CONFIRM "Zone edit"
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_RESET_PEN
        WIN_LABEL 3dh, 11h, "Edit:"
        WIN_END
STR_NEW_NAME:
        db      4eh, 65h, 77h, 20h, 6eh, 61h, 6dh, 65h, 3ah, 00h
STR_INSERT_SND:
        db      49h, 6eh, 73h, 65h, 72h, 74h
        db      20h, 53h, 6eh, 64h, 3ah, 00h
STR_PRESSING_DO_IT:
        db      50h, 72h, 65h, 73h, 73h, 69h, 6eh, 67h, 20h, 44h
        db      4fh, 20h, 49h, 54h, 20h, 77h, 69h, 6ch, 6ch, 20h, 65h, 78h, 63h, 75h, 74h, 65h
        db      00h
STR_SELECTED_EDIT:
        db      74h, 68h, 65h, 20h, 73h, 65h, 6ch, 65h, 63h, 74h, 65h, 64h, 20h, 65h, 64h
        db      69h, 74h, 21h, 21h, 00h
P_3AE4:
        db      19h, 00h
TBL_WINKEYS_ZONE_EDIT:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, zone_edit_paint
        ZS_HOOK_EDIT_KEYS
        WIN_KEY   WIN_K_F4, TEXT2_SEG, zone_edit_cancel
        WIN_KEY   WIN_K_F5, TEXT1_SEG, L_087F8
        WIN_KEY   WIN_K_OPEN, TEXT2_SEG, zone_edit_cancel
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, snd_window_refresh_key
        WIN_KEY_END
        db      00h
G_TRACK_MODE:
        db      00h, 00h
DL_SOUND_PARAMS:
        WIN_SOFTKEY_STYLES 2, 2, 2, 0, 0, 1
        WIN_RESET_PEN
        WIN_RULE  0eh, 4fh, 0ch, 22h
        WIN_LABEL 0dh, 13h, "Level:"
        WIN_LABEL 0dh, 23h, "Tune:"
        WIN_LABEL 55h, 11h, "BEAT"
        WIN_LABEL 55h, 1ah, "LOOP"
        WIN_LABEL 55h, 23h, "FUNCTION"
        WIN_LABEL 0b5h, 11h, "Beat:"
        WIN_LABEL 85h, 1ah, "Sample tempo="
        WIN_LABEL 97h, 23h, "New tempo="
        WIN_END
STR_ZONE_ROM_LBL:
        db      "Rom:"
        db      00h
STR_ZONE_SND_LBL:
        db      "Snd:", 00h
P_3B84:
        db      01h, 00h, 00h, 00h, 00h, 02h
        dw      trim_screen_enter, TEXT1_SEG
        db      03h
        dw      fit_to_length_cancel, TEXT1_SEG
        db      04h
        dw      zone_screen_enter, TEXT1_SEG
        db      07h
        dw      edit_range_select, TEXT2_SEG
        db      87h
        dw      X_07F14, TEXT2_SEG
TBL_WINKEYS_03BA2:                      ; 7 records + WIN_KEY_END
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, X_0A118
        WIN_KEY   WIN_K_UP, TEXT1_SEG, X_08A0C
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, X_08A24
        WIN_KEY   WIN_K_LEFT, TEXT1_SEG, X_08A3C
        WIN_KEY   WIN_K_RIGHT, TEXT1_SEG, X_08A52
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, snd_window_refresh_key
        WIN_KEY   WIN_K_PAD, TEXT2_SEG, snd_window_pad_key
        WIN_KEY_END
DL_LOADING:
        WIN_PRINT "       Loading....."
        WIN_END
        db      00h, 00h, 00h, 00h
STR_EXT_SND_2:
        db      2eh
        db      053h, 04eh, 044h, 000h
STR_EXT_SND_3:
        db      ".SND", 000h
DL_CHANGE_DISK_MSG:
        WIN_OP_19
        WIN_END
STR_CHANGE_DISK:
        db      "Chang"
        db      "e disk to contin"
        db      75h, 65h, 21h, 21h, 00h
P_3C0A:
        WIN_OP_19
        WIN_END
TBL_WINKEYS_03C0C:                      ; 2 records + WIN_KEY_END
P_3C0C:
        WIN_CLEAR
        WIN_END
        db      00h, 00h, 00h
        WIN_KEY   WIN_K_F3, TEXT2_SEG, X_0B090
        WIN_KEY_END
        db      00h
DL_CANT_FIND_FILE:
        WIN_OP_19
        WIN_DIALOG "Can't find file !!"
        WIN_SOFTKEY 3, 1, "SKIP"
        WIN_SOFTKEY 2, 1, "AL SKP"
        WIN_RESET_PEN
        WIN_LABEL 19h, 0dh, "Can't find file:"
        WIN_END
        WIN_END
P_3C5E:
        WIN_SOFTKEY 5, 1, "LOAD"
        WIN_LABEL 19h, 16h, "Insert disk with this file and"
        WIN_LABEL 19h, 1fh, "press LOAD. To skip, press SKIP"
        WIN_LABEL 19h, 28h, "(this file) or AL SKP(all files)."
        WIN_END
P_3CD1:
        WIN_FLUSH
        WIN_END
        WIN_END
STR_NAME_IN_USE:
        db      "Name is in use..Can't load."
        WIN_END
DL_RENAME_FILE:
        WIN_ALERT "Rename file"
        WIN_SOFTKEY 04h, 02h, "CANCEL"
        WIN_SOFTKEY 05h, 01h, "DO IT"
        WIN_LABEL 3bh, 13h, "New name:"
        WIN_END
TBL_WINKEYS_FILE_EXISTS:                      ; 3 records + WIN_KEY_END
TBL_WINKEYS_RENAME_FILE:
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, file_exists_paint
        WIN_KEY   WIN_K_REFRESH, TEXT1_SEG, file_exists_refresh
        WIN_KEY   WIN_K_F5, TEXT1_SEG, file_exists_rename
        WIN_KEY_END
DL_FILE_EXISTS:
        WIN_ALERT "File Already Exists"
        WIN_SOFTKEY 3, 1, "REPLAC"
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "RENAME"
        WIN_BITMAP 1dh, 13h, 00h
        WIN_LABEL 4dh, 13h, "File name exists!"
        WIN_LABEL 4dh, 1ch, "Replace or rename?"
        WIN_END
        db      00h
P_3D9E:
        db      32h
        dw      win_key_nop_stub, TEXT1_SEG
        db      34h
        dw      X_08D3C, TEXT1_SEG
        db      33h
        dw      win_key_nop_stub, TEXT1_SEG
        db      04h
        dw      L_08D0E, TEXT1_SEG
        db      84h
        dw      win_key_nop_stub, TEXT1_SEG
TBL_WINKEYS_03DB7:                      ; 5 records + WIN_KEY_END
        WIN_KEY   WIN_K_F5, TEXT1_SEG, X_08D02
        WIN_KEY   2bh, TEXT1_SEG, win_key_nop_stub
        WIN_KEY   2ch, TEXT1_SEG, win_key_nop_stub
        WIN_KEY   2dh, TEXT1_SEG, win_key_nop_stub
        WIN_KEY   2eh, TEXT1_SEG, win_key_nop_stub
        WIN_KEY_END
        db      00h
DL_LOAD_A_SOUND:
        WIN_ALERT "Load a Sound"
        WIN_SOFTKEY 3, 1, "PLAY"
        WIN_SOFTKEY 4, 2, "DSCARD"
        WIN_SOFTKEY 5, 1, "KEEP"
        WIN_LABEL 29h, 15h, "File:"
        WIN_LABEL 29h, 27h, "Assign to note:"
        WIN_END
        db      00h
P_3E20:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, X_0B2C0
        WIN_KEY   WIN_K_REFRESH, TEXT1_SEG, L_08D7E
        WIN_KEY   33h, TEXT2_SEG, X_0B2A6
        WIN_KEY   WIN_K_F3, TEXT2_SEG, X_0B27A
        WIN_KEY   84h, TEXT2_SEG, X_0B290
        WIN_KEY   WIN_K_F5, TEXT1_SEG, L_08D60
        WIN_KEY_END
P_3E48:
        WIN_OP_19
        WIN_END
STR_EXT_SND_4:
        db      2eh, 53h, 4eh, 44h, 00h, 00h
TBL_FILENAME_CHARSET:
        db      30h, 31h, 32h
        db      "3456789 ABCDEFGH"
        db      "IJKLMNOPQRSTUVWX"
        db      59h, 5ah, 23h, 26h, 2dh, 21h, 00h, 88h, 8bh, 8fh, 92h, 95h, 99h, 9ch, 9fh, 0a2h
        db      0a5h, 0a8h, 0aah, 0adh, 0b0h, 0b3h, 0b5h, 0b8h, 0bbh, 0bdh, 0c0h, 0c2h, 0c5h, 0c7h, 0cah, 0cch
        db      0ceh, 0d0h, 0d3h, 0d5h, 0d7h, 0d9h, 0dch, 0deh, 0e0h, 0e2h, 0e4h, 0e6h, 0e8h, 0eah, 0ech, 0eeh
        db      0f0h, 0f2h, 0f3h, 0f5h, 0f7h, 0f9h, 0fbh, 0fdh, 0feh, 00h, 02h, 03h, 05h, 07h, 08h, 0ah
        db      0ch, 0dh, 0fh, 11h, 12h, 14h, 15h, 17h, 18h, 1ah, 1bh, 1dh, 1eh, 20h, 21h, 22h
        db      "$%'()+,-/0134578"
        db      "9:;=>?@BCDEFGHJK"
        db      "LMNOPQRTUVWXYZ[", 05ch
        if      FW_VERSION = 172
        db      "]^_`abcdefghijkk"
        else
        db      5dh, 5eh, 5fh, 60h, 61h, 62h, 63h, 64h, 65h, 66h, 67h, 68h, 69h
        db      6ah, 6bh, 6bh
        endif
        db      "lmnopqrstuuvwx", 000h
STR_EXT_SET:
        db      02eh
        db      053h, 045h, 054h, 000h
STR_EXT_ST1:
        db      02eh, 053h, 054h, 031h, 000h
TBL_MPC60_SOUND_NAMES:
        db      "HIHT CL"
        db      053h, 044h, 000h, "HIHT MEDM", 000h, 048h, 049h, 048h
        db      "T OPEN", 000h, "SNR1", 000h, 000h, 000h, 000h, 000h
        db      000h, "SNR2", 000h, 000h, 000h, 000h, 000h, 000h, "BASS", 000h
        db      000h, 000h, 000h, 000h, 000h, "TOM1", 000h, 000h, 000h, 000h, 000h, 000h, 054h
        db      04fh, 04dh, 032h, 000h, 000h, 000h, 000h, 000h, 000h, "TOM3", 000h, 000h, 000h
        db      000h, 000h, 000h, "TOM4", 000h, 000h, 000h, 000h, 000h, 000h, 052h, 049h, 044h
        db      031h, 000h, 000h, 000h, 000h, 000h, 000h, "RID2", 000h, 000h, 000h, 000h, 000h
        db      000h, "CRS1", 000h, 000h, 000h, 000h, 000h, 000h, "CRS2", 000h
        db      000h, 000h, 000h, 000h, 000h, "PRC1", 000h, 000h, 000h, 000h, 000h, 000h, 050h
        db      052h, 043h, 032h, 000h, 000h, 000h, 000h, 000h, 000h, "PRC3", 000h, 000h, 000h
        db      000h, 000h, 000h, "PRC4", 000h, 000h, 000h, 000h, 000h, 000h, 044h, 052h, 030h
        db      31h, 00h, 00h, 00h, 00h, 00h, 00h, 44h, 52h, 30h, 32h, 00h, 00h, 00h, 00h, 00h
        db      00h, 44h, 52h, 30h, 33h, 00h, 00h, 00h, 00h, 00h, 00h, 44h, 52h, 30h, 34h, 00h
        db      00h, 00h, 00h, 00h, 00h, 44h, 52h, 30h, 35h, 00h, 00h, 00h, 00h, 00h, 00h, 44h
        db      52h, 30h, 36h, 00h, 00h, 00h, 00h, 00h, 00h, 44h, 52h, 30h, 37h, 00h, 00h, 00h
        db      00h, 00h, 00h, 44h, 52h, 30h, 38h, 00h, 00h, 00h, 00h, 00h, 00h, 44h, 52h, 30h
        db      39h, 00h, 00h, 00h, 00h, 00h, 00h, 44h, 52h, 31h, 30h, 00h, 00h, 00h, 00h, 00h
        db      00h, 44h, 52h, 31h, 31h, 00h, 00h, 00h, 00h, 00h, 00h, 44h, 52h, 31h, 32h, 00h
        db      00h, 00h, 00h, 00h, 00h, 44h, 52h, 31h, 33h, 00h, 00h, 00h, 00h, 00h, 00h, 44h
        db      52h, 31h, 34h, 00h, 00h, 00h, 00h, 00h, 00h, 44h, 52h, 31h, 35h, 00h, 00h, 00h
        db      00h, 00h, 00h, 44h, 52h, 31h, 36h, 00h, 00h, 00h, 00h, 00h, 00h
TBL_WINKEYS_LOAD_SOUND:                      ; 6 records + WIN_KEY_END
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, load_sound_refresh
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, sample_calc_position
        WIN_KEY   WIN_K_F5, TEXT2_SEG, smem_read_handler
        WIN_KEY   WIN_K_UP, TEXT2_SEG, load_sound_up
        WIN_KEY   WIN_K_DOWN, TEXT2_SEG, load_sound_down
        WIN_KEY_END
        db      00h
DL_LOAD_A_SOUND_CONFIRM:
        WIN_CONFIRM "Load a Sound"
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_LABEL 3fh, 14h, "MPC60 pad:"
        WIN_LABEL 5dh, 24h, "File:"
        WIN_END
STR_NO_ASSIGN:
        db      28h, 6eh, 6fh, 20h, 61h, 73h, 73h, 69h, 67h, 6eh, 29h, 00h, 00h
TBL_WINKEYS_CHANGE_DISK:                      ; 4 records + WIN_KEY_END
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, change_disk_refresh
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, change_disk_paint
        WIN_KEY   WIN_K_F5, TEXT2_SEG, change_disk_do_it
        WIN_KEY_END
P_40F7:
        WIN_OP_19
        WIN_END
        db      00h
DL_CHANGE_DISK:
        WIN_CONFIRM "Change Disk"
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_LABEL 6eh, 14h, "Insert next disk"
        WIN_LABEL 6eh, 20h, "and press DO IT."
        WIN_END
        db      00h
STR_EXT_SND_5:
        db      2eh, 53h, 4eh, 44h, 00h, 00h
DL_SAVING:
        db      18h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 53h, 61h, 76h, 69h, 6eh, 67h, 2eh, 2eh, 2eh, 2eh, 2eh, 00h, 00h
STR_CHANGE_DISK_2:
        db      43h, 68h, 61h, 6eh, 67h, 65h, 20h, 64h, 69h, 73h, 6bh, 20h, 74h, 6fh, 20h, 63h, 6fh, 6eh, 74h, 69h, 6eh, 75h, 65h, 21h, 21h, 00h
P_417E:
        db      00h, 00h
TBL_WINKEYS_04180:                      ; 5 records + WIN_KEY_END
        if      FW_VERSION = 172
        WIN_KEY   WIN_K_F1, TEXT1_SEG, win_key_nop_stub
        WIN_KEY   WIN_K_F2, TEXT1_SEG, win_key_nop_stub
        endif
        WIN_KEY   WIN_K_F3, TEXT1_SEG, X_09FE0
        WIN_KEY   WIN_K_F5, TEXT1_SEG, X_0A02A
        if      FW_VERSION = 172
        WIN_KEY   WIN_K_F6, TEXT1_SEG, win_key_nop_stub
        endif
        WIN_KEY_END
        if      FW_VERSION = 150
        db      00h
        endif
P_419E:
        WIN_OP_19
        WIN_CONFIRM "Disk is full!!"
        if      FW_VERSION = 172
        WIN_SOFTKEY 3, 1, "WIPE"
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "SAVE"
        WIN_RESET_PEN
P_41CE:
        WIN_BITMAP 37h, 13h, 00h
        else
        WIN_SOFTKEY 03h, 01h, "WIPE"
        WIN_SOFTKEY 04h, 02h, "CANCEL"
        WIN_SOFTKEY 05h, 01h, "SAVE"
        db      02h, 25h, 37h, 13h
        WIN_END
        endif
        WIN_LABEL 4fh, 0fh, "There is not enough space"
        WIN_LABEL 4fh, 18h, "on this disk!!"
        WIN_LABEL 4fh, 21h, "Please insert a different"
        WIN_LABEL 4fh, 2ah, "disk, then press SAVE."
        WIN_FLUSH
        WIN_END
TBL_WINKEYS_0423A:                      ; 13 records + WIN_KEY_END
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, data_far_write
        WIN_KEY   WIN_K_F1, TEXT2_SEG, L_0D24E
        WIN_KEY   WIN_K_F3, TEXT2_SEG, L_0D260
        WIN_KEY   WIN_K_F5, TEXT1_SEG, X_0AF30
        WIN_KEY   WIN_K_F6, TEXT1_SEG, X_0AF4C
        WIN_KEY   WIN_K_UP, TEXT1_SEG, X_0AE58
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, L_0AE8C
        WIN_KEY   WIN_K_LEFT, TEXT1_SEG, tgt_0AEBA
        WIN_KEY   WIN_K_RIGHT, TEXT1_SEG, X_0AEF0
        WIN_KEY   33h, TEXT1_SEG, lcd_draw_data
        WIN_KEY   WIN_K_REFRESH, TEXT1_SEG, far_0AD74
        if      FW_VERSION = 172
        WIN_KEY   WIN_K_OPEN, TEXT2_SEG, L_0D282
        endif
        WIN_KEY_END
        if      FW_VERSION = 150
        db      00h
        endif
P_4280:
        WIN_CLEAR
        WIN_RESET_PEN
        WIN_LABEL 03h, 02h, "RECEIVE"
        WIN_LABEL 51h, 02h, "(In: )"
        WIN_RULE  0ch, 02h, 0ah, 79h
        WIN_LABEL 80h, 02h, "TRANSMIT"
        WIN_LABEL 0c8h, 02h, "(Out: )"
        WIN_RULE  0ch, 7fh, 0ah, 78h
        WIN_END
        db      00h
DL_SOFTKEYS_MIDI_DUMP:
        db      1ah, 01h, 02h
        db      "SYNC", 000h, 01ah, 002h, 000h, "DUMP", 000h, 01ah, 003h, 002h
        db      "MIDIsw", 000h, 01ah, 005h, 001h, "REQUES"
        db      00h, 1ah, 06h, 01h, 53h, 45h, 4eh, 44h, 00h, 00h, 00h
P_42E6:
        WIN_SOFTKEY 6, 1, "CANCEL"
        WIN_END
STR_RECEIVE_READY:
        db      52h, 65h, 63h, 65h, 69h, 76h, 65h, 20h, 72h
P_42FA:
        db      65h
        db      "ady while", 000h
STR_THIS_PAGE_OPEN:
        db      "this p"
        db      "age is open.", 000h
STR_REQUEST_NO:
        db      052h, 065h, 071h
        db      "uest No.:", 000h
STR_SND_5:
        db      "Snd:", 000h
STR_EXCLUSIVE_CH:
        db      045h
        db      "xclusive ch:", 000h
STR_NO_SOUND:
        db      028h, 06eh, 06fh
        db      " sound)", 000h
STR_SENDING:
        db      "Sending."
        db      02eh, 02eh, 02eh, 02eh, 000h
STR_RECEIVING:
        db      "Re"
P_4352:
        db      "ceiving.."
        if      FW_VERSION = 172
        db      02eh, 02eh, 02eh, 000h, 000h
P_4360:
        db      "MULTI ", 000h, "SING"
        db      4ch, 45h, 00h
TBL_WINKEYS_RECEIVE_MODE:                      ; 5 records + WIN_KEY_END
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, receive_mode_paint
        WIN_KEY   WIN_K_OPEN, TEXT1_SEG, receive_mode_close
        WIN_KEY   WIN_K_F4, TEXT1_SEG, receive_mode_close
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, receive_mode_refresh
        WIN_KEY_END
P_438C:
        WIN_DIALOG "Receive Mode Select"
        WIN_SOFTKEY 4, 2, "CLOSE"
        WIN_RESET_PEN
        WIN_LABEL 25h, 1ch, "Receive Mode:"
        WIN_END
        db      00h
        else
        db      2eh, 2eh, 2eh, 00h, 00h
        endif
P_43C2:
        db      03h
        dw      tgt_0B650, TEXT1_SEG
        db      05h
        dw      X_0D332, TEXT2_SEG
        db      85h
        dw      X_0D344, TEXT2_SEG
TBL_WINKEYS_KEEP_OR_RETRY:                      ; 5 records + WIN_KEY_END
        WIN_KEY   WIN_K_F5, TEXT1_SEG, smem_data_read_handler
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, keep_or_retry_paint
        WIN_KEY   WIN_K_UP, TEXT1_SEG, keep_or_retry_up
        WIN_KEY   WIN_K_DOWN, TEXT1_SEG, keep_or_retry_down
        WIN_KEY   33h, TEXT1_SEG, keep_or_retry_key_33
        WIN_KEY_END
        db      00h
DL_KEEP_OR_RETRY:
        WIN_DIALOG "KEEP or RETRY"
        WIN_RESET_PEN
        WIN_LABEL 13h, 13h, "Name for new sound:"
        WIN_LABEL 2bh, 25h, "Assign to note:"
        WIN_SOFTKEY 2, 1, "RETRY"
        WIN_SOFTKEY 4, 1, "PLAY"
        WIN_SOFTKEY 5, 1, "KEEP"
        WIN_END
TBL_WINKEYS_MONO_TO_STEREO:                      ; 8 records + WIN_KEY_END
P_4448:
        WIN_CLEAR
        WIN_END
        db      00h, 00h, 00h
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, mono_to_stereo_paint
        WIN_KEY   WIN_K_OPEN, TEXT2_SEG, snd_edit_page_return
        WIN_KEY   WIN_K_F4, TEXT2_SEG, snd_edit_page_return
        WIN_KEY   WIN_K_F5, TEXT2_SEG, sample_string_access
        WIN_KEY   WIN_K_UP, TEXT2_SEG, mono_to_stereo_up
        WIN_KEY   WIN_K_DOWN, TEXT2_SEG, mono_to_stereo_down
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, snd_window_refresh_key
        WIN_KEY_END
        db      00h
DL_MONO_TO_STEREO:
        WIN_CONFIRM "MONO to STEREO"
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_RESET_PEN
        WIN_RULE  0ch, 35h, 19h, 0b9h
        WIN_LABEL 55h, 0fh, "L source="
        WIN_LABEL 55h, 1eh, "R source:"
        WIN_LABEL 43h, 28h, "New ST name:"
        WIN_END
P_44CD:
        WIN_OP_19
        WIN_END
        db      00h
TBL_WINKEYS_STEREO_TO_MONO:                      ; 8 records + WIN_KEY_END
P_44D0:
        WIN_KEY_CLEAR
        WIN_KEY   WIN_K_PAINT, TEXT2_SEG, stereo_to_mono_paint
        WIN_KEY   WIN_K_OPEN, TEXT2_SEG, snd_edit_page_return
        WIN_KEY   WIN_K_F4, TEXT2_SEG, snd_edit_page_return
        WIN_KEY   WIN_K_F5, TEXT2_SEG, sample_process_large
        WIN_KEY   WIN_K_UP, TEXT2_SEG, stereo_to_mono_up
        WIN_KEY   WIN_K_DOWN, TEXT2_SEG, stereo_to_mono_down
        WIN_KEY   WIN_K_REFRESH, TEXT2_SEG, snd_window_refresh_key
        WIN_KEY_END
        db      00h
DL_STEREO_TO_MONO:
        WIN_CONFIRM "STEREO to MONO"
        WIN_SOFTKEY 4, 2, "CANCEL"
        WIN_SOFTKEY 5, 1, "DO IT"
        WIN_RESET_PEN
        WIN_RULE  0ch, 35h, 19h, 0b9h
        WIN_LABEL 37h, 0fh, "Stereo source="
        WIN_LABEL 49h, 1eh, "New L name:"
        WIN_LABEL 49h, 28h, "New R name:"
        WIN_END
TBL_WINKEYS_0455B:                      ; 1 records + WIN_KEY_END
        WIN_OP_19
        WIN_END
        db      00h
DIVMOD32_STATIC:
        db      00h, 00h
        db      00h, 00h, 00h, 00h, 00h                           ; WIN_KEY_END
        db      00h
P_4566:
        db      48h, 51h, 5bh, 66h, 72h, 80h
P_456C:
        db      63h, 1ah, 50h, 14h, 41h, 09h, 32h, 0eh
P_4574:
        db      0cdh, 0ach, 0dbh, 49h, 33h, 33h, 00h, 20h, 67h, 0a6h, 00h, 40h, 0cch, 2ch, 99h, 19h, 0e6h, 0b0h, 1ah, 4fh, 0e5h, 30h, 0e5h, 30h, 0e5h, 30h, 0e5h, 30h, 1ah, 4fh, 0e6h, 0b0h, 00h, 20h, 33h, 33h, 0dbh, 49h, 0cdh, 0ach, 99h, 19h, 0cch, 2ch, 00h, 40h, 67h, 0a6h
P_45A4:
        db      2eh, 00h, 34h, 00h, 3ah, 00h, 42h, 00h, 4ah, 00h, 53h, 00h, 5dh, 00h, 68h, 00h, 75h, 00h, 84h, 00h, 94h, 00h, 0a6h, 00h, 0bah, 00h, 0d1h, 00h, 0eah, 00h, 07h, 01h, 27h, 01h, 4bh, 01h, 74h, 01h, 0a1h, 01h, 0d4h, 01h, 0dh, 02h

L_045D0:
        db      4dh, 02h, 95h, 02h, 0e6h, 02h, 41h, 03h, 0a6h, 03h, 18h, 04h, 98h, 04h, 28h, 05h
        db      0c9h, 05h, 7eh, 06h, 49h, 07h, 2ch, 08h, 2bh, 09h

L_045EA:
        db      49h, 0ah, 8bh, 0bh, 0f3h, 0ch, 87h, 0eh, 4bh, 10h, 47h, 12h, 81h, 14h, 0ffh, 16h
        db      0c9h, 19h, 0eah, 1ch, 6ah, 20h, 55h, 24h, 0b4h, 28h, 0a0h, 2dh, 0eh, 33h, 26h, 39h
        db      0e8h, 3fh, 72h, 47h, 0c4h, 4fh, 0f2h, 58h, 06h, 63h, 14h, 6eh, 12h, 7ah, 0ffh, 7fh
        db      0ffh, 7fh, 0ffh, 7fh, 0ffh, 7fh, 0ffh, 7fh, 0ffh, 7fh, 0ffh, 7fh, 0ffh, 7fh
P_4628:
        db      2eh, 00h
        db      34h, 00h, 3ah, 00h, 41h, 00h, 49h, 00h, 53h, 00h, 5dh, 00h, 68h, 00h, 75h, 00h
L_1F41E:
        db      83h, 00h, 93h, 00h, 0a5h, 00h, 0b9h, 00h, 0d0h, 00h, 0e9h, 00h, 06h, 01h, 26h, 01h
        db      4ah, 01h, 72h, 01h, 0a0h, 01h, 0d2h, 01h, 0bh, 02h, 4bh

L_04655:
        db      02h, 93h, 02h, 0e3h, 02h, 3dh, 03h, 0a2h, 03h, 14h, 04h, 93h, 04h, 22h, 05h, 0c2h
        db      05h, 75h, 06h, 3eh, 07h, 1fh, 08h, 1ah, 09h

L_0466E:
        db      34h, 0ah, 70h, 0bh, 0d0h, 0ch, 59h, 0eh, 0fh, 10h, 0f7h, 11h, 15h, 14h, 6dh

L_0467D:
        db      16h, 04h, 19h, 0deh, 1bh, 0fdh, 1eh, 65h, 22h, 14h, 26h, 08h, 2ah, 40h, 2eh, 0b4h
        db      32h, 5ah, 37h, 28h, 3ch, 0ah, 41h, 0f6h, 45h, 0ceh, 4ah, 9ch, 4fh, 38h, 54h, 0a2h
        db      58h, 0c6h, 5ch, 0aeh, 60h, 50h, 64h, 0ach, 67h, 0c2h, 6ah, 88h, 6dh, 45h, 70h, 13h
        db      73h
P_46AE:
        db      00h, 03h, 05h, 08h, 0ah, 0dh, 0fh, 12h, 14h, 17h, 1ah, 1ch, 1fh, 21h, 24h
        db      "&)+.0368;=@BEGJL"
        db      "ORTWY", 05ch, "^acfiknpsu"
        db      78h, 7ah, 7dh, 7fh, 82h, 85h, 87h, 8ah, 8ch, 8fh, 91h, 94h, 96h, 99h, 9ch, 9eh
        db      0a1h, 0a3h, 0a6h, 0a8h, 0abh, 0adh, 0b0h, 0b2h, 0b5h, 0b8h, 0bah, 0bdh, 0bfh, 0c2h, 0c4h, 0c7h
        db      0c9h, 0cch, 0cfh, 0d1h, 0d4h, 0d6h, 0d9h, 0dbh, 0deh, 0e0h, 0e3h, 0e5h, 0e8h, 0ebh, 0edh, 0f0h
        db      0f2h, 0f5h, 0f7h, 0fah, 0fch, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 00h, 03h, 05h
        db      08h, 0ah, 0dh, 0fh, 12h, 14h, 17h, 1ah, 1ch, 1fh, 21h, 24h, 26h, 29h, 2ch, 2eh
        db      "1368;=@CEHJMORTW"
        db      05ah, 05ch, "_adfilnqsvx{}", 080h
        db      83h, 85h, 88h, 8ah, 8dh, 8fh, 92h, 94h, 97h, 9ah, 9ch, 9fh, 0a1h, 0a4h, 0a6h, 0a9h
        db      0ach, 0aeh, 0b1h, 0b3h, 0b6h, 0b8h, 0bbh, 0bdh, 0c0h, 0c3h, 0c5h, 0c8h, 0cah, 0cdh, 0cfh, 0d2h
        db      0d4h, 0d7h, 0dah, 0dch, 0dfh, 0e1h, 0e4h, 0e6h, 0e9h, 0ech, 0eeh, 0f1h, 0f3h, 0f6h, 0f8h, 0fbh
        db      0fdh
P_47AE:
        db      00h, 80h, 3bh, 80h, 77h, 80h, 0b2h, 80h, 0edh, 80h, 29h, 81h, 65h, 81h, 0a1h
        db      81h, 0ddh, 81h, 19h, 82h, 55h, 82h, 91h, 82h, 0ceh, 82h, 0ah, 83h, 47h, 83h, 83h
        db      83h, 0c0h, 83h, 0fdh, 83h, 3ah, 84h, 77h, 84h, 0b5h, 84h, 0f2h, 84h, 2fh, 85h, 6dh
        db      85h, 0abh, 85h, 0e9h, 85h, 27h, 86h, 65h, 86h, 0a3h, 86h, 0e1h, 86h, 1fh, 87h, 5eh
        db      87h, 9dh, 87h, 0dbh, 87h, 1ah, 88h, 59h, 88h, 98h, 88h, 0d7h, 88h, 17h, 89h, 56h
        db      89h, 95h, 89h, 0d5h, 89h, 15h, 8ah, 55h, 8ah, 95h, 8ah, 0d5h, 8ah, 15h, 8bh, 55h
        db      8bh, 96h, 8bh, 0d6h, 8bh, 17h, 8ch, 58h, 8ch, 99h, 8ch, 0dah, 8ch, 1bh, 8dh, 5ch
        db      8dh, 9eh, 8dh, 0dfh, 8dh, 21h, 8eh, 62h, 8eh, 0a4h, 8eh, 0e6h, 8eh, 28h, 8fh, 6bh
        db      8fh, 0adh, 8fh, 0efh, 8fh, 32h, 90h, 75h, 90h, 0b7h, 90h, 0fah, 90h, 3dh, 91h, 81h
        db      91h, 0c4h, 91h, 07h, 92h, 4bh, 92h, 8fh, 92h, 0d2h, 92h, 16h, 93h, 5ah, 93h, 9eh
        db      93h, 0e3h, 93h, 27h, 94h, 6ch, 94h, 0b0h, 94h, 0f5h, 94h, 3ah, 95h, 7fh, 95h, 0c4h
        db      95h, 09h, 96h, 4fh, 96h, 94h, 96h, 0dah, 96h, 20h, 97h, 66h, 97h, 0ach, 97h, 0f2h
        db      97h, 38h, 98h, 7eh, 98h, 0c5h, 98h, 0ch, 99h, 52h, 99h, 99h, 99h, 0e0h, 99h, 28h
        db      9ah, 6fh, 9ah, 0b6h, 9ah, 0feh, 9ah, 46h, 9bh, 8dh, 9bh, 0d5h, 9bh, 1dh, 9ch, 66h
        db      9ch, 0aeh, 9ch, 0f6h, 9ch, 3fh, 9dh, 88h, 9dh, 0d1h, 9dh, 1ah, 9eh, 63h, 9eh, 0ach
        db      9eh, 0f5h, 9eh, 3fh, 9fh, 89h, 9fh, 0d2h, 9fh, 1ch, 0a0h, 66h, 0a0h, 0b0h, 0a0h, 0fbh
        db      0a0h, 45h, 0a1h, 90h, 0a1h, 0dbh, 0a1h, 25h, 0a2h, 70h, 0a2h, 0bch, 0a2h, 07h, 0a3h, 52h
        db      0a3h, 9eh, 0a3h, 0e9h, 0a3h, 35h, 0a4h, 81h, 0a4h, 0cdh, 0a4h, 1ah, 0a5h, 66h, 0a5h, 0b2h
        db      0a5h, 0ffh, 0a5h, 4ch, 0a6h, 99h, 0a6h, 0e6h, 0a6h, 33h, 0a7h, 80h, 0a7h, 0ceh, 0a7h, 1bh
        db      0a8h, 69h, 0a8h, 0b7h, 0a8h, 05h, 0a9h, 53h, 0a9h, 0a2h, 0a9h, 0f0h, 0a9h, 3fh, 0aah, 8dh
        db      0aah, 0dch, 0aah, 2bh, 0abh, 7ah, 0abh, 0cah, 0abh, 19h, 0ach, 69h, 0ach, 0b9h, 0ach, 08h
        db      0adh, 58h, 0adh, 0a9h, 0adh, 0f9h, 0adh, 49h, 0aeh, 9ah, 0aeh, 0ebh, 0aeh, 3ch, 0afh, 8dh
        db      0afh, 0deh, 0afh, 2fh, 0b0h, 81h, 0b0h, 0d2h, 0b0h, 24h, 0b1h, 76h, 0b1h, 0c8h, 0b1h, 1ah
        db      0b2h, 6dh, 0b2h, 0bfh, 0b2h, 12h, 0b3h, 65h, 0b3h, 0b8h, 0b3h, 0bh, 0b4h, 5eh, 0b4h, 0b2h
        db      0b4h, 05h, 0b5h, 59h, 0b5h, 0adh, 0b5h, 01h, 0b6h, 55h, 0b6h, 0a9h, 0b6h, 0feh, 0b6h, 52h
        db      0b7h, 0a7h, 0b7h, 0fch, 0b7h, 51h, 0b8h, 0a7h, 0b8h, 0fch, 0b8h, 52h, 0b9h, 0a7h, 0b9h, 0fdh
        db      0b9h, 53h, 0bah, 0a9h, 0bah, 00h, 0bbh, 56h, 0bbh, 0adh, 0bbh, 04h, 0bch, 5bh, 0bch, 0b2h
        db      0bch, 09h, 0bdh, 60h, 0bdh, 0b8h, 0bdh, 10h, 0beh, 68h, 0beh, 0c0h, 0beh, 18h, 0bfh, 70h
        db      0bfh, 0c9h, 0bfh, 22h, 0c0h, 7ah, 0c0h, 0d3h, 0c0h, 2dh, 0c1h, 86h, 0c1h, 0dfh, 0c1h, 39h
        db      0c2h, 93h, 0c2h, 0edh, 0c2h, 47h, 0c3h, 0a1h, 0c3h, 0fch, 0c3h

X_04988:
        db      57h, 0c4h, 0b1h, 0c4h, 0ch, 0c5h, 68h, 0c5h, 0c3h, 0c5h, 1eh, 0c6h, 7ah, 0c6h, 0d6h, 0c6h
        db      32h, 0c7h, 8eh, 0c7h, 0eah, 0c7h, 47h

X_0499F:
        db      0c8h, 0a3h, 0c8h, 00h, 0c9h, 5dh, 0c9h, 0bah, 0c9h, 17h, 0cah, 75h, 0cah, 0d3h, 0cah, 30h
        db      0cbh, 8eh, 0cbh, 0ech, 0cbh, 4bh, 0cch, 0a9h, 0cch, 08h, 0cdh, 67h, 0cdh, 0c6h, 0cdh, 25h
        db      0ceh, 84h, 0ceh, 0e4h, 0ceh, 44h, 0cfh, 0a3h, 0cfh, 03h, 0d0h, 64h, 0d0h, 0c4h, 0d0h, 25h
        db      0d1h, 85h, 0d1h, 0e6h, 0d1h, 47h, 0d2h, 0a9h, 0d2h, 0ah, 0d3h, 6ch, 0d3h, 0cdh, 0d3h, 2fh
        db      0d4h, 91h, 0d4h, 0f4h, 0d4h, 56h, 0d5h, 0b9h, 0d5h, 1ch, 0d6h, 7fh, 0d6h, 0e2h, 0d6h, 45h
        db      0d7h, 0a9h, 0d7h, 0dh, 0d8h, 71h, 0d8h, 0d5h, 0d8h, 39h, 0d9h, 9eh, 0d9h, 02h, 0dah, 67h
        db      0dah, 0cch, 0dah, 31h, 0dbh, 97h, 0dbh, 0fch, 0dbh, 62h, 0dch, 0c8h, 0dch, 2eh, 0ddh, 94h
        db      0ddh, 0fbh, 0ddh, 61h, 0deh, 0c8h, 0deh, 2fh, 0dfh, 97h, 0dfh, 0feh, 0dfh, 66h, 0e0h, 0cdh
        db      0e0h, 35h, 0e1h, 9eh, 0e1h, 06h, 0e2h, 6eh, 0e2h, 0d7h, 0e2h, 40h, 0e3h, 0a9h, 0e3h, 12h
        db      0e4h, 7ch, 0e4h, 0e6h, 0e4h, 50h, 0e5h, 0bah, 0e5h, 24h, 0e6h, 8eh, 0e6h, 0f9h, 0e6h, 64h
        db      0e7h, 0cfh, 0e7h, 3ah, 0e8h, 0a5h, 0e8h, 11h, 0e9h, 7dh, 0e9h, 0e9h, 0e9h, 55h, 0eah, 0c1h
        db      0eah, 2eh, 0ebh, 9bh, 0ebh, 08h, 0ech, 75h, 0ech, 0e2h, 0ech, 50h, 0edh, 0beh, 0edh, 2ch
        db      0eeh, 9ah, 0eeh, 08h, 0efh, 77h, 0efh, 0e5h, 0efh, 54h, 0f0h, 0c3h, 0f0h, 33h, 0f1h, 0a2h
        db      0f1h, 12h, 0f2h, 82h, 0f2h, 0f2h, 0f2h, 63h, 0f3h, 0d3h, 0f3h, 44h, 0f4h, 0b5h, 0f4h, 26h
        db      0f5h, 98h, 0f5h, 09h, 0f6h, 7bh, 0f6h, 0edh, 0f6h, 5fh, 0f7h, 0d2h, 0f7h, 44h, 0f8h, 0b7h
        db      0f8h, 2ah, 0f9h, 9dh, 0f9h, 11h, 0fah, 84h, 0fah, 0f8h, 0fah, 6ch, 0fbh, 0e1h, 0fbh, 55h
        db      0fch, 0cah, 0fch, 3fh, 0fdh, 0b4h, 0fdh, 29h, 0feh, 9fh, 0feh, 15h, 0ffh, 8bh, 0ffh, 0ffh
        db      0ffh
P_4AB0:
        db      02h, 0bh, 1fh, 00h, 20h, 80h, 40h, 40h, 80h, 20h, 80h, 20h, 84h, 20h, 84h
        db      20h, 88h, 20h, 48h, 40h, 30h, 80h, 1fh, 00h
P_4AC8:
        db      02h, 0bh, 1fh, 00h, 20h, 80h, 40h
        db      40h, 80h, 20h, 80h, 20h, 84h, 20h, 88h, 20h, 90h, 20h, 60h, 40h, 20h, 80h, 1fh
        db      00h
P_4AE0:
        db      02h, 0bh, 1fh, 00h, 20h, 80h, 40h, 40h, 80h, 20h, 80h, 20h, 8ch, 20h, 0b0h
        db      20h, 0c0h, 20h, 40h, 40h, 20h, 80h, 1fh, 00h
P_4AF8:
        db      02h, 0bh, 1fh, 00h, 20h, 80h, 40h
        db      40h, 80h, 20h, 80h, 20h, 0fch, 20h, 80h, 20h, 80h, 20h, 40h, 40h, 20h, 80h, 1fh
        db      00h
P_4B10:
        db      02h, 0bh, 1fh, 00h, 20h, 80h, 40h, 40h, 0c0h, 20h, 0b0h, 20h, 8ch, 20h, 80h
        db      20h, 80h, 20h, 40h, 40h, 20h, 80h, 1fh, 00h
P_4B28:
        db      02h, 0bh, 1fh, 00h, 20h, 80h, 60h
        db      40h, 90h, 20h, 88h, 20h, 84h, 20h, 80h, 20h, 80h, 20h, 40h, 40h, 20h, 80h, 1fh
        db      00h
P_4B40:
        db      02h, 0bh, 1fh, 00h, 30h, 80h, 48h, 40h, 88h, 20h, 84h, 20h, 84h, 20h, 80h
        db      20h, 80h, 20h, 40h, 40h, 20h, 80h, 1fh, 00h
GLYPH_KNOB_05:
        db      02h, 0bh, 1fh, 00h, 24h, 80h, 44h
        db      40h, 84h, 20h, 84h, 20h, 84h, 20h, 80h, 20h, 80h, 20h, 40h, 40h, 20h, 80h, 1fh
        db      00h
GLYPH_KNOB_06:
        db      02h, 0bh, 1fh, 00h, 21h, 80h, 42h, 40h, 82h, 20h, 84h, 20h, 84h, 20h, 80h
        db      20h, 80h, 20h, 40h, 40h, 20h, 80h, 1fh, 00h
GLYPH_KNOB_07:
        db      02h, 0bh, 1fh, 00h, 20h, 80h, 40h
        db      0c0h, 81h, 20h, 82h, 20h, 84h, 20h, 80h, 20h, 80h, 20h, 40h, 40h, 20h, 80h, 1fh
        db      00h
GLYPH_KNOB_08:
        db      02h, 0bh, 1fh, 00h, 20h, 80h, 40h, 40h, 80h, 60h, 81h, 0a0h, 86h, 20h, 80h
        db      20h, 80h, 20h, 40h, 40h, 20h, 80h, 1fh, 00h
GLYPH_KNOB_09:
        db      02h, 0bh, 1fh, 00h, 20h, 80h, 40h
        db      40h, 80h, 20h, 80h, 20h, 87h, 0e0h, 80h, 20h, 80h, 20h, 40h, 40h, 20h, 80h, 1fh
        db      00h
GLYPH_KNOB_10:
        db      02h, 0bh, 1fh, 00h, 20h, 80h, 40h, 40h, 80h, 20h, 80h, 20h, 86h, 20h, 81h
        db      0a0h, 80h, 60h, 40h, 40h, 20h, 80h, 1fh, 00h
GLYPH_KNOB_11:
        db      02h, 0bh, 1fh, 00h, 20h, 80h, 40h
        db      40h, 80h, 20h, 80h, 20h, 84h, 20h, 82h, 20h, 81h, 20h, 40h, 0c0h, 20h, 80h, 1fh
        db      00h
GLYPH_KNOB_12:
        db      02h, 0bh, 1fh, 00h, 20h, 80h, 40h, 40h, 80h, 20h, 80h, 20h, 84h, 20h, 84h
        db      20h, 82h, 20h, 42h, 40h, 21h, 80h, 1fh, 00h
GLYPH_SMALL_1:
        db      01h, 09h, 00h, 00h, 04h, 0ch, 04h
        db      04h, 04h, 04h, 0eh
GLYPH_SMALL_2:
        db      01h, 09h, 00h, 00h, 0eh, 11h, 01h, 02h, 04h, 08h, 1fh
P_4C2E:
        db      01h
        db      09h, 00h, 00h, 1fh, 02h, 04h, 02h, 01h, 11h, 0eh
GLYPH_SMALL_4:
        db      01h, 09h, 00h, 00h, 02h, 06h
        db      0ah, 12h, 1fh, 02h, 02h
GLYPH_SMALL_5:
        db      01h, 09h, 00h, 00h, 1fh, 10h, 1eh, 01h, 01h, 11h, 0eh
GLYPH_SMALL_6:
        db      01h, 09h, 00h, 00h, 06h, 08h, 10h, 1eh, 11h, 11h, 0eh
GLYPH_SMALL_7:
        db      01h, 09h, 00h, 00h, 1fh
        db      01h, 02h, 04h, 08h, 08h, 08h
GLYPH_SMALL_8:
        db      01h, 09h, 00h, 00h, 0eh, 11h, 11h, 0eh, 11h, 11h
        db      0eh
GLYPH_SMALL_DASH:
        db      01h, 09h, 00h, 00h, 00h, 00h, 00h, 1fh, 00h, 00h, 00h, 01h, 09h, 00h, 00h
        db      1fh, 10h, 10h, 1eh, 10h, 10h, 1fh
GLYPH_PAIR_12:
        db      02h, 0bh, 20h, 00h, 60h, 00h, 20h, 00h, 20h
        db      00h, 20h, 0e0h, 21h, 10h, 70h, 10h, 00h, 20h, 00h, 40h, 00h, 80h, 01h, 0f0h
GLYPH_PAIR_34:
        db      02h
        db      0bh, 0f8h, 00h, 10h, 00h, 20h, 00h, 10h, 00h, 08h, 20h, 88h, 60h, 70h, 0a0h, 01h
        db      20h, 01h, 0f0h, 00h, 20h, 00h, 20h
GLYPH_PAIR_56:
        db      02h, 0bh, 0f8h, 00h, 80h, 00h, 0f0h, 00h, 08h
        db      00h, 08h, 60h, 88h, 80h, 71h, 00h, 01h, 0e0h, 01h, 10h, 01h, 10h, 00h, 0e0h
GLYPH_PAIR_78:
        db      02h
        db      0bh, 0f8h, 00h, 08h, 00h, 10h, 00h, 20h, 00h, 40h, 0e0h, 41h, 10h, 41h, 10h, 00h
        db      0e0h, 01h, 10h, 01h, 10h, 00h, 0e0h
P_4CE6:
        db      01h, 03h, 0f8h, 70h, 20h, 01h, 03h, 20h, 70h
        db      0f8h
P_4CF0:
        db      01h, 07h, 80h, 0c0h, 0e0h, 0f0h, 0e0h, 0c0h, 80h
P_4CF9:
        db      03h, 05h, 00h, 0c6h, 00h, 01h
        db      29h, 00h, 0fah, 10h, 80h, 01h, 29h, 00h, 00h, 0c6h, 00h
P_4D0A:
        if      FW_VERSION = 172
        db      0ah, 24h, 00h, 00h, 07h
        else
        db      0ah
tgt_03993:
        db      24h, 00h, 00h, 07h
        endif
        db      0f0h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 1ch, 1ch, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 30h, 06h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 40h, 01h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 0c0h, 01h, 80h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 80h, 00h, 80h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 80h, 00h, 0c0h, 00h, 00h
        db      00h, 00h, 00h, 00h, 01h, 00h, 00h, 40h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 00h
        db      01h, 0f0h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 00h, 3fh, 0fh, 0fch, 00h, 00h, 00h
        db      00h, 00h, 01h, 00h, 20h, 00h, 04h, 00h, 03h, 60h, 00h, 00h, 01h, 00h, 20h, 00h
        db      04h, 00h, 04h, 90h, 00h, 00h, 01h, 80h, 20h, 00h, 02h, 00h, 00h, 00h, 00h, 00h
        db      00h, 80h, 60h, 00h, 02h, 00h, 0d8h, 00h, 00h, 00h, 00h, 0c0h, 40h, 00h, 03h, 01h
        db      24h, 00h, 00h, 00h, 00h, 40h, 0c0h, 00h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 30h
        db      80h, 00h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 1dh, 80h, 00h, 00h, 80h, 00h, 00h
        db      00h, 00h, 00h, 07h, 00h, 08h, 00h, 80h, 00h, 00h, 00h, 00h, 00h, 02h, 06h, 1ch
        db      00h, 0c0h, 00h, 00h, 00h, 00h, 00h, 06h, 0eh, 1ch, 04h, 40h, 00h, 00h, 00h, 00h
        db      00h, 08h, 3eh, 3eh, 0eh, 40h, 00h, 00h, 00h, 00h, 00h, 10h, 0feh, 7eh, 1fh, 20h
        db      00h, 00h, 00h, 00h, 00h, 37h, 0feh, 7fh, 1fh, 0f0h, 00h, 00h, 00h, 00h, 00h, 3fh
        db      0feh, 0ffh, 9fh, 0f0h, 00h, 00h, 00h, 00h, 00h, 0ffh, 0fdh, 0ffh, 9fh, 0fch, 00h, 00h
        db      00h, 00h, 01h, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 00h, 00h, 00h, 00h, 07h, 0ffh, 0ffh, 0ffh
        db      0ffh, 0ffh, 00h, 00h, 00h, 00h, 07h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0c0h, 00h, 00h, 00h
        db      1fh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0e0h, 00h, 00h, 00h, 3fh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        db      0f8h, 00h, 00h, 00h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 00h, 00h, 07h, 0ffh, 0ffh
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0c0h, 00h, 1fh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0fch
        db      00h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0c0h, 7fh, 0ffh, 0ffh, 0ffh, 0ffh
        db      0ffh, 0ffh, 0ffh, 0ffh, 00h

P_4E74:
        db      03h, 13h, 7fh

X_04E77:
        db      0ffh, 00h, 0a4h, 04h, 80h, 0a4h, 0e4h, 40h, 0a4h, 0a4h, 40h, 0a4h, 0a4h, 40h, 0a4h, 0e4h
        db      40h, 0a4h, 04h, 40h, 9fh, 0f8h, 40h, 80h, 00h, 40h, 9fh, 0feh, 40h, 0a0h, 01h, 40h
        db      0a0h, 01h, 40h, 0a0h, 01h, 40h, 0a0h, 01h, 40h, 0a0h, 01h, 40h, 0a0h, 01h, 40h, 0a0h
        db      01h, 40h, 0a0h, 01h, 40h, 7fh, 0ffh
TBL_WINKEYS_04EAE:                      ; 1 records + WIN_KEY_END
        if      FW_VERSION = 172
        db      80h, 00h
B_4EB0:
        db      00h, 00h
P_4EB2:
        db      00h
        db      00h, 00h, 00h, 00h, 00h                           ; WIN_KEY_END
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h
B_4ECA:
        db      00h, 00h
T_DSP_CHAN:                             ; per-channel control block, stride T_DSP_CHAN_STRIDE
        db      40 dup (00h)
SOUND_EVENT_HANDLER:
        db      00h, 00h
SOUND_EVENT_HANDLER_SEG:
        db      00h
        db      00h
FP_MAIN_CALLBACK:
        db      00h, 00h
FP_MAIN_CALLBACK_SEG:
        db      00h, 00h
W_4EFC:
        db      00h, 00h
P_4EFE:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h
G_DMA_STATUS2_SHADOW:
        db      00h, 00h
TBL_4F10:
        db      128 dup (00h)
TBL_VOICE_AGE_SNAP:
        db      64 dup (00h)
CREDITS_SCROLL_TICK:
        db      00h, 00h
CREDITS_SCROLL_LINE:
        db      00h, 00h
CREDITS_SCROLL_PHASE:
        db      00h, 00h
FP_UI_RETURN_SCREEN:
        db      00h
        db      00h
FP_UI_RETURN_SCREEN_SEG:
        db      00h, 00h
FX_DIST_CURSOR:
        db      00h
FILTER4_CURSOR:
        db      00h
G_UI_MODE:                              ; 0,2,3,5
        db      00h
G_UI_FLAG:
        db      00h
G_UI_SUBMODE:
        db      00h
FX_MIXER_CURSOR:
        db      00h
COPY_FX_CURSOR:
        db      00h
B_4FE1:
        db      00h
B_4FE2:
        db      00h, 00h
B_4FE4:
        db      00h, 00h
W_4FE6:
        db      00h
        db      00h
W_4FE8:
        db      00h, 00h
W_4FEA:
        db      00h, 00h, 00h, 00h
W_4FEE:
        db      00h, 00h
W_4FF0:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
W_5006:
        db      00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
W_5012:
        db      00h, 00h
W_5014:
        db      00h, 00h
W_5016:
        db      00h
        db      00h, 00h, 00h
W_501A:
        db      00h, 00h
W_501C:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
W_5032:
        db      00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h
W_503E:
        db      00h, 00h
W_5040:
        db      00h, 00h
W_5042:
        db      00h, 00h
W_5044:
        db      00h, 00h
W_5046:
        db      00h
        db      00h
W_5048:
        db      34 dup (00h)
W_506A:
        db      00h, 00h
W_506C:
        db      00h, 00h
W_506E:
        db      00h, 00h
W_5070:
        db      00h, 00h
W_5072:
        db      00h, 00h
W_5074:
        db      34 dup (00h)
ZONE_START_FINE_CURSOR:
        db      00h
        db      00h
FP_LOADED_SND:
        db      00h, 00h
FP_LOADED_SND_SEG:
        db      00h, 00h
W_509C:
        db      00h, 00h
        else
        db      80h
        endif

        if      FW_VERSION = 150
; 0x1fc93-0x1ff60: 717 00h bytes (DS:7273h-753Fh), DATA zero tail between
; 24-pixel bitmap (ends 0x1fc93) and 16-byte version string (image end).
; No code references. ? Loader zero-fills; code here may not survive
; start-up.
        db      1 dup (000h)
B_4EB0:
        db      2 dup (000h)
P_4EB2:
        db      24 dup (000h)
B_4ECA:
        db      2 dup (000h)
T_DSP_CHAN:                             ; per-channel control block, stride T_DSP_CHAN_STRIDE
        db      40 dup (000h)
SOUND_EVENT_HANDLER:
        db      2 dup (000h)
SOUND_EVENT_HANDLER_SEG:
        db      2 dup (000h)
FP_MAIN_CALLBACK:
        db      2 dup (000h)
FP_MAIN_CALLBACK_SEG:
        db      2 dup (000h)
W_4EFC:
        db      2 dup (000h)
P_4EFE:
        db      16 dup (000h)
G_DMA_STATUS2_SHADOW:
        db      2 dup (000h)
TBL_4F10:
        db      128 dup (000h)
TBL_VOICE_AGE_SNAP:
        db      64 dup (000h)
CREDITS_SCROLL_TICK:
        db      2 dup (000h)
CREDITS_SCROLL_LINE:
        db      2 dup (000h)
CREDITS_SCROLL_PHASE:
        db      2 dup (000h)
FP_UI_RETURN_SCREEN:
        db      2 dup (000h)
FP_UI_RETURN_SCREEN_SEG:
        db      2 dup (000h)
FX_DIST_CURSOR:
        db      1 dup (000h)
FILTER4_CURSOR:
        db      000h
G_UI_MODE:                              ; 0,2,3,5
        db      000h
G_UI_FLAG:
        db      000h
G_UI_SUBMODE:
        db      000h
FX_MIXER_CURSOR:
        db      1 dup (000h)
COPY_FX_CURSOR:
        db      1 dup (000h)
B_4FE1:
        db      1 dup (000h)
B_4FE2:
        db      2 dup (000h)
B_4FE4:
        db      2 dup (000h)
W_4FE6:
        db      2 dup (000h)
W_4FE8:
        db      2 dup (000h)
W_4FEA:
        db      4 dup (000h)
W_4FEE:
        db      2 dup (000h)
W_4FF0:
        db      22 dup (000h)
W_5006:
        db      12 dup (000h)
W_5012:
        db      2 dup (000h)
W_5014:
        db      2 dup (000h)
W_5016:
        db      4 dup (000h)
W_501A:
        db      2 dup (000h)
W_501C:
        db      22 dup (000h)
W_5032:
        db      12 dup (000h)
W_503E:
        db      2 dup (000h)
W_5040:
        db      2 dup (000h)
W_5042:
        db      2 dup (000h)
W_5044:
        db      2 dup (000h)
W_5046:
        db      2 dup (000h)
W_5048:
        db      34 dup (000h)
W_506A:
        db      2 dup (000h)
W_506C:
        db      2 dup (000h)
W_506E:
        db      2 dup (000h)
W_5070:
        db      2 dup (000h)
W_5072:
        db      2 dup (000h)
W_5074:
        db      34 dup (000h)
ZONE_START_FINE_CURSOR:
        db      2 dup (000h)
FP_LOADED_SND:
        db      2 dup (000h)
FP_LOADED_SND_SEG:
        db      2 dup (000h)
W_509C:
        db      2 dup (000h)
        endif
W_509E:
        db      2 dup (000h)
W_50A0:
        db      2 dup (000h)
W_50A2:
        db      2 dup (000h)
W_50A4:
        db      2 dup (000h)
W_50A6:
        db      2 dup (000h)
W_50A8:
        db      2 dup (000h)
W_50AA:
        db      2 dup (000h)
G_MPC60_LOAD_LEN:
        db      2 dup (000h)
G_MPC60_LOAD_LEN_HI:
        db      2 dup (000h)
PTR_SEQ_LIST_HEAD:                      ; far ptr, the sequence list head
        db      4 dup (000h)
G_OLD_INT4E_OFF:
        db      2 dup (000h)
G_OLD_INT4E_SEG:
        db      2 dup (000h)
BUF_SDS_PACKET:
        db      00h
B_50B9:
        db      00h
B_50BA:
        db      00h
B_50BB:
        db      00h
SDS_PKT_NUM:
        db      00h
P_50BD:
        db      120 dup (000h)
SDS_PKT_CHECKSUM:
        db      00h
B_5136:
        db      2 dup (000h)
W_5138:
        db      2 dup (000h)
W_513A:
        db      2 dup (000h)
W_513C:
        db      2 dup (000h)
W_513E:
        db      2 dup (000h)
P_5140:
        db      48 dup (000h)
P_5170:
        db      6 dup (000h)
FP_SOUND_DLG_CALLBACK:
        db      2 dup (000h)
FP_SOUND_DLG_CALLBACK_SEG:
        db      2 dup (000h)
G_KEEP_RETRY_FOCUS:
        db      2 dup (000h)

; Version stamp, DATA:0517Ch (standard location).
SYS_STAMP macro
        if      FW_VERSION = 172
        db      56h, 31h
        db      2eh, 37h, 32h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 2eh, 31h, 32h, 33h
        else
        db      31h, 2eh, 35h, 30h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 2eh, 31h, 30h, 33h
        endif
        endm
        SYS_STAMP
SYS_STAMP_END                   equ     $
