; data tables shared byte-for-byte between 2K EXE &
; XL OS; each is a macro for use in shared bundles,
; label stays at the site.

TBL_XS_637D_DATA macro
        db      04h, 09h, 0eh, 13h, 18h, 1dh
        db      "\"',16;@EJOTY^chmrw|"
        db      07h, 0dh, 13h, 19h, 16h, 1ch
        db      "\"29?EKRX^d"
        db      07h, 0fh, 19h, 1fh
        db      "'/7?GOW_gow"
        db      7fh, 00h, 07h, 0eh, 14h, 1bh
        db      "\"(/6<MJPW^d"
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h
        endm

TBL_BITS_NOTE_NAMES_DATA macro
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 80h, 40h, 20h
        db      10h, 08h, 04h, 02h, 01h
        db      "(C. )(C# )(D. )(D# )(E. )(F. )(F"
        db      "# )(G. )(G# )(A. )(A# )(B. )"
        db      11h, 10h
        db      "0123456789ALL   "
        db      00h
        endm

BMP_XS_6CB5_DATA macro
        db      7fh, 0ffh, 0f0h, 03h, 15h, 7fh, 0ffh, 0e0h, 0a2h, 00h, 90h, 0a2h, 1ch, 88h, 0a2h, 14h
        db      88h, 0a2h, 14h, 88h, 0a2h, 1ch, 88h, 0a2h, 00h, 88h, 9fh, 0ffh, 08h, 80h, 00h, 08h
        db      9fh, 0ffh, 0c8h, 0a0h, 00h, 28h, 0a0h, 00h, 28h, 0a0h, 00h, 28h, 0a0h, 00h, 28h, 0a0h
        db      00h, 28h, 0a0h, 00h, 28h, 0a0h, 00h, 28h, 0a0h, 00h, 28h, 0a0h, 00h, 28h, 0a0h, 00h
        db      28h, 7fh, 0ffh, 0f0h, 03h, 15h, 7fh, 0ffh, 0e0h, 0a2h, 00h, 90h, 0a2h, 1ch, 88h, 0a2h
        db      14h, 88h, 0a2h, 14h, 88h, 0a2h, 1ch, 88h, 0a2h, 00h, 88h, 9fh, 0ffh, 08h, 80h, 00h
        db      08h, 9fh, 0ffh, 0c8h, 0a0h, 00h, 28h, 0a0h, 00h, 28h, 0a4h, 5ch, 28h, 0a4h, 52h, 28h
        db      0a4h, 51h, 28h, 0a7h, 0d1h, 28h, 0a4h, 51h, 28h, 0a4h, 52h, 28h, 0a4h, 5ch, 28h, 0a0h
        db      00h, 28h, 7fh, 0ffh, 0f0h, 03h, 15h, 7fh, 0ffh, 0e0h, 0a2h, 00h, 90h, 0a2h, 1ch, 88h
        db      0a2h, 14h, 88h, 0a2h, 14h, 88h, 0a2h, 1ch, 88h, 0a2h, 00h, 88h, 9fh, 0ffh, 08h, 80h
        db      00h, 08h, 9fh, 0ffh, 0c8h, 0a0h, 00h, 28h, 0a0h, 00h, 28h, 0a7h, 1ch, 28h, 0a4h, 92h
        db      28h, 0a4h, 51h, 28h, 0a4h, 51h, 28h, 0a4h, 51h, 28h, 0a4h, 92h, 28h, 0a7h, 1ch, 28h
        db      0a0h, 00h, 28h, 7fh, 0ffh, 0f0h, 03h, 11h, 04h, 5ch, 00h, 04h, 52h, 00h, 04h, 51h
        db      00h, 07h, 0d1h, 00h, 04h, 51h, 00h, 04h, 52h, 00h, 04h, 5ch, 00h, 00h, 00h, 00h
        db      7fh, 0ffh, 0f0h, 80h, 00h, 08h, 9fh, 0ffh, 0c8h, 80h, 00h, 08h, 9fh, 0ffh, 0c8h, 80h
        db      00h, 08h, 80h, 00h, 0c8h, 80h, 00h, 08h, 7fh, 0ffh, 0f0h, 03h, 10h, 4ch, 31h, 28h
        db      0aah, 2ah, 0b8h, 8ah, 0b2h, 0a8h, 0aah, 2ah, 0a8h, 4ch, 29h, 28h, 00h, 00h, 00h, 03h
        db      0feh, 00h, 1ch, 01h, 0c0h, 60h, 00h, 30h, 0c0h, 0f8h, 18h, 81h, 04h, 08h, 80h, 0f8h
        db      08h, 0c0h, 00h, 18h, 60h, 00h, 30h, 1ch, 01h, 0c0h, 03h, 0feh, 00h, 03h, 11h, 04h
        db      4eh, 00h, 06h, 0d1h, 00h, 05h, 51h, 00h, 04h, 51h, 00h, 04h, 51h, 00h, 04h, 51h
        db      00h, 04h, 4eh, 00h, 00h, 00h, 00h, 7fh, 0ffh, 0f0h, 80h, 00h, 08h, 9fh, 0ffh, 0c8h
        db      0a0h, 00h, 28h, 9fh, 0ffh, 0c8h, 80h, 00h, 08h, 80h, 00h, 0c8h, 80h, 00h, 08h, 7fh
        db      0ffh, 0f0h, 03h, 14h
        db      "t#PDTPtrpDQPGVP"
        db      00h, 00h, 00h, 06h, 25h, 00h, 05h, 57h, 00h, 06h, 55h, 00h, 05h, 55h, 00h, 05h
        db      25h, 00h, 00h, 00h, 00h, 0ffh, 0ffh, 0f8h, 80h, 00h, 08h, 9dh, 0ddh, 0c8h, 95h, 55h
        db      48h, 0f7h, 77h, 78h, 15h, 55h, 40h, 08h, 88h, 80h, 08h, 88h, 80h, 04h, 0fh, 00h
        db      00h, 00h, 80h, 00h, 00h, 00h, 0c0h, 0ffh, 0ffh, 0ffh, 0e0h, 0ffh, 0ffh, 0ffh, 0f0h, 0ffh
        db      0ffh, 0ffh, 0f8h, 0ffh, 0ffh, 0ffh, 0fch, 0ffh, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        db      0ffh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0fch, 0ffh, 0ffh, 0ffh, 0f8h, 0ffh, 0ffh, 0ffh, 0f0h, 0ffh
        db      0ffh, 0ffh, 0e0h, 00h, 00h, 00h, 0c0h, 00h, 00h, 00h, 80h, 04h, 0fh, 01h, 00h, 00h
        db      00h, 03h, 00h, 00h, 00h, 07h, 00h, 00h, 00h, 0fh, 0ffh, 0ffh, 0ffh, 1fh, 0ffh, 0ffh
        db      0ffh, 3fh, 0ffh, 0ffh, 0ffh, 7fh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 7fh, 0ffh, 0ffh
        db      0ffh, 3fh, 0ffh, 0ffh, 0ffh, 1fh, 0ffh, 0ffh, 0ffh, 0fh, 0f0h, 00h, 00h, 07h, 00h, 00h
        db      00h, 03h, 00h, 00h, 00h, 01h, 00h, 00h, 00h, 02h, 0fh, 00h, 80h, 00h, 0c0h, 00h
        db      0a0h, 0ffh, 90h, 80h, 08h, 80h, 04h, 80h, 02h, 80h, 01h, 80h, 02h, 80h, 04h, 80h
        db      08h, 0ffh, 90h, 00h, 0a0h, 00h, 0c0h, 00h, 80h, 02h, 0fh, 01h, 00h, 03h, 00h, 05h
        db      00h, 09h, 0ffh, 10h, 01h, 30h, 01h, 70h, 01h, 0f0h, 01h, 70h, 01h, 30h, 01h, 10h
        db      01h, 09h, 0ffh, 05h, 00h, 03h, 00h, 01h, 00h, 02h, 0dh, 3fh, 80h, 20h, 0c0h, 20h
        db      0c0h, 20h, 0c0h, 20h, 0c0h, 20h, 0c0h, 20h, 0c0h, 0e0h, 0f0h, 40h, 60h, 20h, 0c0h, 11h
        db      80h, 0bh, 00h, 06h, 00h, 04h, 12h, 00h, 00h, 01h, 00h, 00h, 00h, 01h, 80h, 00h
        db      00h, 01h, 40h, 0ffh, 0ffh, 0ffh, 20h, 80h, 00h, 00h, 10h, 80h, 00h, 00h, 08h, 80h
        db      00h, 00h, 04h, 80h, 00h, 00h, 02h, 80h, 00h, 00h, 01h, 80h, 00h, 00h, 03h, 80h
        db      00h, 00h, 06h, 80h, 00h, 00h, 0ch, 80h, 00h, 00h, 18h, 0ffh, 0ffh, 0ffh, 30h, 7fh
        db      0ffh, 0ffh, 60h, 00h, 00h, 01h, 0c0h, 00h, 00h, 01h, 80h, 00h, 00h, 01h, 00h, 03h
        db      13h, 00h, 60h, 00h, 00h, 0f0h, 00h, 00h, 0f0h, 00h, 01h, 0f8h, 00h, 01h, 0f8h, 00h
        db      03h, 9ch, 00h, 03h, 9ch, 00h, 07h, 9eh, 00h, 07h, 9eh, 00h, 0fh, 9fh, 00h, 0fh
        db      9fh, 00h, 1fh, 9fh, 80h, 1fh, 9fh, 80h, 3fh, 0ffh, 0c0h, 3fh, 0ffh, 0c0h, 7fh, 9fh
        db      0e0h, 7fh, 9fh, 0e0h, 0ffh, 0ffh, 0f0h, 0ffh, 0ffh, 0f0h, 02h, 18h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 03h, 00h, 7fh, 0f8h, 80h, 04h, 0ffh, 0fch, 40h, 08h
        db      "[hRHRHRHRHRHRHRHRHRHRHRH[h?"
        db      0f0h, 03h, 18h, 00h, 01h, 80h, 00h, 01h, 40h, 00h, 01h, 40h, 00h, 01h, 40h, 00h
        db      01h, 40h, 00h, 01h, 60h, 00h, 01h, 60h, 00h, 01h, 40h, 7fh, 0f9h, 40h, 40h, 09h
        db      "@[i@RI"
        db      80h, 52h, 48h, 00h, 52h, 48h, 00h, 52h, 48h, 00h, 52h, 48h, 00h, 52h, 48h, 00h
        db      52h, 48h, 00h, 52h, 48h, 00h, 52h, 48h, 00h, 52h, 48h, 00h, 52h, 48h, 00h, 5bh
        db      68h, 00h, 3fh, 0f0h, 00h, 02h, 19h, 0eh, 00h, 05h, 00h, 02h, 80h, 01h, 60h, 00h
        db      0a0h, 00h, 50h, 00h, 38h, 00h, 1ch, 00h, 0ch, 0ffh, 0fch, 40h, 08h
        db      "[hRHRHRHRHRHRHRHRHRHRHRH[h?"
        db      0f0h, 01h, 04h, 10h, 38h, 7ch, 0feh, 01h, 04h, 0feh, 7ch, 38h, 10h, 01h, 04h, 80h
        db      40h, 40h, 40h, 01h, 04h, 80h, 80h, 80h, 40h, 02h, 13h, 03h, 80h, 04h, 40h, 04h
        db      40h, 88h, 20h, 68h, 20h, 98h, 20h, 98h, 20h, 70h, 10h, 18h, 10h, 18h, 10h, 14h
        db      10h, 22h, 08h, 22h, 08h, 21h, 08h, 3fh, 0f8h, 40h, 04h, 40h, 04h, 40h, 04h, 3fh
        db      0f8h, 02h, 17h, 07h, 00h, 07h, 00h, 07h, 00h, 07h, 00h, 07h, 00h, 07h, 00h, 07h
        db      00h, 07h, 00h, 0ffh, 0f8h, 80h, 08h, 80h, 08h, 7fh, 0f0h, 80h, 08h, 80h, 08h, 0ffh
        db      0f8h, 07h, 00h, 07h, 00h, 07h, 00h, 07h, 00h, 07h, 00h, 07h, 00h, 07h, 00h, 07h
        db      00h, 00h, 00h, 01h, 10h, 20h, 40h, 80h, 80h, 80h, 80h, 80h, 80h, 80h, 80h, 80h
        db      80h, 80h, 80h, 40h, 20h, 01h, 10h, 04h, 02h, 01h, 01h, 01h, 01h, 01h, 01h, 01h
        db      01h, 01h, 01h, 01h, 01h, 02h, 04h
        endm

TBL_NOTE_VALUE_NAMES_DATA macro
        db      07h
        db      "OFF    1/8    1/8(3) 1/16   1/16"
        db      "(3)1/32   1/32(3)"
        endm

TBL_XS_15B8_DATA macro
        db      01h, 04h, 02h, 04h, 03h, 04h, 04h, 04h, 05h, 04h, 06h, 04h, 07h, 04h, 08h, 04h
        db      09h, 04h, 0ah, 04h, 0bh, 04h, 0ch, 04h, 0dh, 04h, 0eh, 04h, 0fh, 04h, 10h, 04h
        db      01h, 08h, 02h, 08h, 03h, 08h, 04h, 08h, 05h, 08h, 06h, 08h, 07h, 08h, 08h, 08h
        db      08h, 08h, 09h, 08h, 0ah, 08h, 0bh, 08h, 0ch, 08h, 0dh, 08h, 0eh, 08h, 0fh, 08h
        db      10h, 08h, 01h, 10h, 02h, 10h, 03h, 10h, 04h, 10h, 05h, 10h, 06h, 10h, 07h, 10h
        db      08h, 10h, 09h, 10h, 0ah, 10h, 0bh, 10h, 0ch, 10h, 0dh, 10h, 0eh, 10h, 0fh, 10h
        db      10h, 10h, 01h, 20h, 02h, 20h, 03h, 20h, 04h, 20h, 05h, 20h, 06h, 20h, 07h, 20h
        db      08h, 20h, 09h, 20h, 0ah, 20h, 0bh, 20h, 0ch, 20h, 0dh, 20h, 0eh, 20h, 0fh, 20h
        db      10h, 20h, 11h, 20h, 12h, 20h, 13h, 20h, 14h, 20h, 15h, 20h, 16h, 20h, 17h, 20h
        db      18h, 20h, 19h, 20h, 1ah, 20h, 1bh, 20h, 1ch, 20h, 1dh, 20h, 1eh, 20h, 1fh, 20h
        db      20h, 20h
        endm

TBL_REC_MODE_NAMES_DATA macro
        db      08h
        db      "OFF     REC ONLYREC+PLAY"
        db      07h
        db      "1/4    1/4(3) 1/8    1/8(3) 1/16"
        db      "   1/16(3)1/32   1/32(3)"
        db      06h
        db      "STEREOOUT 1 OUT 2 OUT 3 OUT 4 OU"
        db      "T 5 OUT 6 OUT 7 OUT 8 "
        endm

TBL_SYNC_MODE_NAMES_DATA macro
        db      00h, 0eh
        db      "OFF           MIDI CLOCK    MIDI"
        db      " TIME CODESMPTE         "
        endm

TBL_EVENT_TYPE_NAMES_DATA macro
        db      0ch
        db      "NOTES       PITCH BEND  PROG CHA"
        db      "NGE CH PRESSURE POLY PRESS  EXCL"
        db      "USIVE   "
        endm

TBL_EDIT_OP_NAMES_DATA macro
        db      0ah
        db      "ADD VALUE SUB VALUE MULT VAL% SE"
        db      "T TO VAL"
        db      00h
        endm

TBL_ERASE_MODE_NAMES_DATA macro
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 0ch
        db      "ALL EVENTS  ALL EXCEPT  ONLY ERA"
        db      "SE  "
        db      0ch
        db      "NOTES       PITCH BEND  CONTROL:"
        db      "    PROG CHANGE CH PRESSURE POLY"
        db      " PRESS  EXCLUSIVE   "
        db      00h, 00h, 00h
        endm

TBL_EVENT_FILTER_NAMES_DATA macro
        db      0ch
        db      "ALL EVENTS  NOTES       PITCH BE"
        db      "ND  CTRL:   -   PROG CHANGE CH P"
        db      "RESSURE POLY PRESS  "
        endm

TBL_MIDI_CC_NAMES_DATA macro
        db      "BANK SEL MSBMOD WHEEL   BREATH C"
        db      "ONT     03      FOOT CONTROLPORT"
        db      "A TIME  DATA ENTRY  MAIN VOLUME "
        db      "BALANCE          09     PAN     "
        db      "    EXPRESSION  EFFECT 1    EFFE"
        db      "CT 2         14          15     "
        db      "GEN.PUR. 1  GEN.PUR. 2  GEN.PUR."
        db      " 3  GEN.PUR. 4       20         "
        db      " 21          22          23     "
        db      "     24          25          26 "
        db      "         27          28         "
        db      " 29          30          31     "
        db      "BANK SEL LSBMOD WHEL LSBBREATH L"
        db      "SB       35     FOOT CNT LSBPORT"
        db      " TIME LSDATA ENT LSBMAIN VOL LSB"
        db      "BALANCE LSB      41     PAN LSB "
        db      "    EXPRESS LSB EFFECT 1 LSBEFFE"
        db      "CT 2 MSB     46          47     "
        db      "GEN.PUR.1 LSGEN.PUR.2 LSGEN.PUR."
        db      "3 LSGEN.PUR.4 LS     52         "
        db      " 53          54          55     "
        db      "     56          57          58 "
        db      "         59          60         "
        db      " 61          62          63     "
        db      "SUSTAIN PEDLPORTA PEDAL SOSTENUT"
        db      "O   SOFT PEDAL  LEGATO FT SWHOLD"
        db      " 2      SOUND VARI  TIMBER/HARMO"
        db      "RELEASE TIMEATTACK TIME BRIGHTNE"
        db      "SS  SOUND CONT 6SOUND CONT 7SOUN"
        db      "D CONT 8SOUND CONT 9SOUND CONT10"
        db      "GEN.PUR. 5  GEN.PUR. 6  GEN.PUR."
        db      " 7  GEN.PUR. 8  PORTA CNTRL     "
        db      " 85          86          87     "
        db      "     88          89          90 "
        db      "    EXT EFF DPTHTREMOLO DPTHCHOR"
        db      "US DEPTHDETUNE DEPTHPHASER DEPTH"
        db      "DATA INCRE  DATA DECRE  NRPN LSB"
        db      "    NRPN MSB    RPN LSB     RPN "
        db      "MSB         102         103     "
        db      "    104         105         106 "
        db      "        107         108         "
        db      "109         110         111     "
        db      "    112         113         114 "
        db      "        115         116         "
        db      "117         118         119     "
        db      "ALL SND OFF RESET CONTRLLOCAL ON"
        db      "/OFFALL NOTE OFFOMNI OFF    OMNI"
        db      " ON     MONO MODE ONPOLY MODE ON"
        db      0dh
        db      "AS PLAYED    TC VALUE:   %"
        endm

TBL_FXSEND_LEVEL_TEXT_DATA macro
        db      "FXsend LEVEL   N:64/A01   L:    "
        db      "                        "
        endm

TBL_EVENT_TYPE_NAMES_LONG_DATA macro
        db      "  PITCH BEND  CONTROL CHANGEPROG"
        db      "RAM CHANGE CH PRESSURE  POLY PRE"
        db      "SSURE  "
        endm

TBL_TRANSPOSE_NAMES_DATA macro
        db      03h
        db      "-12-11-10- 9- 8- 7- 6- 5- 4- 3- "
        db      "2- 1  0+ 1+ 2+ 3+ 4+ 5+ 6+ 7+ 8+"
        db      " 9+10+11+12"
        endm

TBL_DEVICE_FILETYPE_NAMES_DATA macro
        db      06h
        db      "FloppySCSI-0SCSI-1SCSI-2SCSI-3SC"
        db      "SI-4SCSI-5SCSI-6SCSI-7F-ROM "
        db      09h
        db      "All Files.SND     .PGM     .APS "
        db      "    .MID     .ALL     .WAV     ."
        db      "SEQ     .SET        SNDPGMAPSMID"
        db      "ALLWAVSEQSET"
        endm

TBL_DRUM_NOTE_NAMES_DATA macro
        db      0fh
        db      "HIHT CLSD (A01)HIHT MEDM (A01)HI"
        db      "HT OPEN (A01)SNR1      (A02)SNR2"
        db      "      (A03)BASS      (A04)TOM1  "
        db      "    (A05)TOM2      (A06)TOM3    "
        db      "  (A07)TOM4      (A08)RID1      "
        db      "(A09)RID2      (A10)CRS1      (A"
        db      "11)CRS2      (A12)PRC1      (A13"
        db      ")PRC2      (A14)PRC3      (A15)P"
        db      "RC4      (A16)DR01      (B01)DR0"
        db      "2      (B02)DR03      (B03)DR04 "
        db      "     (B04)DR05      (B05)DR06   "
        db      "   (B06)DR07      (B07)DR08     "
        db      " (B08)DR09      (B09)DR10      ("
        db      "B10)DR11      (B11)DR12      (B1"
        db      "2)DR13      (B13)DR14      (B14)"
        db      "DR15      (B15)DR16      (B16)"
        db      00h
        db      "*R.&%$0/-+3517E68'9:;<=>?@ABCDFG"
        db      48h, 49h, 0ah
        db      "NO(FASTER)YES       "
        db      00h
        endm

TBL_MIDI_FILE_TYPE_NAMES_DATA macro
        db      10h
        db      "MIDI FILE TYPE 0MIDI FILE TYPE 1"
        endm

TBL_DISK_TYPE_NAMES_DATA macro
        db      00h, 00h, 08h
        db      "Type:2HDType:2DD"
        db      07h
        db      "FORMAT ARRANGE"
        db      00h, 00h, 00h, 00h, 00h, 00h
        endm

TBL_SMF_HEADER_DATA macro
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      "MThd"
        db      00h, 00h, 00h, 06h, 00h, 00h, 00h, 00h, 00h
        db      "`MTrk"
        db      00h, 00h, 00h, 40h, 00h, 0ffh, 03h
        db      " MPC2000"
        endm

TBL_SEQ_LOOP_TEXT_DATA macro
        db      "             "
        db      00h, 0ffh, 01h
        db      "$LOOP=OFF START=000 END=END TEMP"
        db      "O=ON "
        db      00h, 0ffh, 51h, 03h, 00h, 00h, 00h, 00h, 0ffh
        endm

TBL_SMF_TRACK_HEADER_DATA macro
        db      54h, 05h, 00h, 00h, 00h, 00h, 00h, 00h
        db      "MTrk"
        db      00h, 00h, 00h, 00h, 00h, 0ffh, 03h, 10h
        db      "                "
        db      00h, 0ffh, 01h
        db      " TRACK DATA:00E9006401  "
        endm
