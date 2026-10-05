; ram -- MPC2000XL flash: the RAM_SEG frame.
; the version stamp, then data and zero runs at fixed RAM_SEG offsets, then the
; entry of the INT 8Fh display service (APP2_SEG; v1.07 carries the service whole
; up to its dispatch tables).  a part of its own, phased at 0: its offsets are
; RAM_SEG offsets, and app1 growth moves it whole.
; v1.20 0x0fe70-0x1a9b6 (43846 bytes), v1.14 0x0fb80-0x1a4b6 (43318 bytes),
; v1.12 0x0f9e0-0x1a2f6, v1.11 0x0f980-0x1a296, v1.10 0x0f970-0x1a286 (43286 bytes),
; v1.07 0x0f720-0x1a0d6 (43446 bytes).

        if      FW_VERSION < 110
APP2_CSBASE set     APP2_SEG*16-SEGBASE
; the same CS base for an app2 label (app2 is phased at its own base)
APP2_CSBASE_A2 set  APP2_SEG*16-APP2_BASE
        endif

; RAM_SEG:0000: the version stamp -- version, build and date as text, then year,
; month, day, major, minor -- and the name of the system file it loads from.
ram_stamp:
d_a1_b_00010 equ     $+10h
d_a1_w_0001a equ     $+1ah
        if      FW_VERSION >= 120
        db      "1.14c        -74Jul. 15,2004"
d_a0_w_0001c:
        dw      2004
d_a0_b_0001e:
        db      7
d_a0_b_0001f:
        db      15
d_a0_b_00020:
        db      1
d_a0_b_00021:
        db      20
        elseif  FW_VERSION >= 114
        db      "1.14         -72May. 15,2001"
d_a0_w_0001c:
        dw      2001
d_a0_b_0001e:
        db      5
d_a0_b_0001f:
        db      15
d_a0_b_00020:
        db      1
d_a0_b_00021:
        db      14
        elseif  FW_VERSION >= 112
        db      "1.12         -65Dec. 04,2000"
d_a0_w_0001c:
        dw      2000
d_a0_b_0001e:
        db      12
d_a0_b_0001f:
        db      4
d_a0_b_00020:
        db      1
d_a0_b_00021:
        db      12
        elseif  FW_VERSION >= 111
        db      "1.11         -63Mar. 06,2000"
d_a0_w_0001c:
        dw      2000
d_a0_b_0001e:
        db      3
d_a0_b_0001f:
        db      6
d_a0_b_00020:
        db      1
d_a0_b_00021:
        db      11
        elseif  FW_VERSION >= 110
        db      "1.10         -61Feb. 23,2000"
d_a0_w_0001c:
        dw      2000
d_a0_b_0001e:
        db      2
d_a0_b_0001f:
        db      23
d_a0_b_00020:
        db      1
d_a0_b_00021:
        db      10
        else
        db      "1.07         -54Oct. 27,1999"
d_a0_w_0001c:
        dw      1999
d_a0_b_0001e:
        db      10
d_a0_b_0001f:
        db      27
d_a0_b_00020:
        db      1
d_a0_b_00021:
        db      7
        endif
d_a1_w_0003a equ     $+18h
        db      "-------------------------", 00h
xl_ata_system_filename:
        db      "MPC2KXL         .BIN"
d_a0_w_00050:
        db      00h
        db      00h
d_a0_w_00052:
        db      00h, 00h
d_a0_w_00054:
        db      00h, 00h
d_a0_w_00056:
        db      00h, 00h
d_a0_w_00058:
        db      00h, 00h
d_a0_w_0005a:
        db      00h, 0e8h
d_a0_w_0005c:
        db      00h, 0eah
d_a0_w_0005e:
        db      00h, 00h, 00h
d_a0_b_00061:
        db      00h
d_a0_b_00062:
        db      00h
d_a2_b_00063:
        db      00h
d_a0_b_00064:
        db      00h
d_a0_b_00065:
        db      00h
d_a0_b_00066:
        db      00h
d_a0_b_00067:
        db      01h
d_a0_b_00068:
        db      00h
d_a0_b_00069:
        db      00h
d_a0_b_0006a:
        db      00h
d_a0_b_0006b:
        db      00h
d_a0_b_0006c:
        db      00h, 00h, 00h, 00h, 00h
d_a0_w_00071:
        db      00h, 00h
d_a0_w_00073:
        db      00h, 00h, 00h, 20h, 00h
d_a0_b_00078:
        db      14h
d_a0_b_00079:
        db      00h
d_a0_w_0007a:
        db      0b0h, 04h
d_a0_w_0007c:
        db      02h, 00h
d_a0_b_0007e:
        db      04h
d_a0_b_0007f:
        db      04h
d_a0_b_00080:
        db      00h
d_a0_b_00081:
        db      01h
d_a0_b_00082:
        db      00h
d_a0_b_00083:
        db      64h
d_a0_b_00084:
        db      00h
d_a0_b_00085:
        db      03h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 20h, 00h, 14h, 00h, 0b0h, 04h, 02h, 00h, 04h, 04h, 00h
        db      01h, 00h, 64h, 00h, 03h
        if      FW_VERSION >= 120
        db      00h
        endif
; 0x0ff17-0x10034, 285 bytes of 00h -- unverified, do not assume free
FREE_0FF17:
        PAD_TO  001C4h-0eh, 000h
d_a0_b_001b6:
        PAD_TO  001C4h-0dh, 000h
d_a0_b_001b7:
        PAD_TO  001C4h-0ch, 000h
d_a0_b_001b8:
        PAD_TO  001C4h-0bh, 000h
d_a0_b_001b9:
        PAD_TO  001C4h-0ah, 000h
d_a0_w_001ba:
        PAD_TO  001C4h-08h, 000h
d_a0_w_001bc:
        PAD_TO  001C4h-06h, 000h
d_a0_w_001be:
        PAD_TO  001C4h-04h, 000h
d_a0_w_001c0:
        PAD_TO  001C4h-02h, 000h
d_a0_w_001c2:
        PAD_TO  001C4h, 000h

        db      0ffh, 0ffh

; 0x10036-0x104b3, 1149 bytes of 00h -- unverified, do not assume free
        if      FW_VERSION < 114
FREE_0FD46:
; 0x1005d-0x10460, 1027 bytes of 00h -- unverified, do not assume free
        endif
FREE_10036:
        PAD_TO  00643h-047bh, 000h
d_a0_b_001c8:
        PAD_TO  00643h-047ah, 000h
d_a0_b_001c9:
        PAD_TO  00643h-0479h, 000h
d_a0_b_001ca:
        PAD_TO  00643h-0377h, 000h
d_a0_w_002cc:
        PAD_TO  00643h-0375h, 000h
d_a0_w_002ce:
        PAD_TO  00643h-0373h, 000h
d_a0_w_002d0:
        PAD_TO  00643h-0371h, 000h
d_a0_w_002d2:
        PAD_TO  00643h-016eh, 000h
d_a0_b_004d5:
        PAD_TO  00643h-016ch, 000h
d_a0_b_004d7:
        PAD_TO  00643h-016bh, 000h
d_a0_b_004d8:
        PAD_TO  00643h-016ah, 000h
d_a0_b_004d9:
        PAD_TO  00643h-0169h, 000h
d_a0_b_004da:
        PAD_TO  00643h-0168h, 000h
d_a0_b_004db:
        PAD_TO  00643h-0165h, 000h
d_a0_tbl_004de:
        PAD_TO  00643h-0155h, 000h
d_a0_tbl_004ee:
        PAD_TO  00643h-0145h, 000h
d_a0_tbl_004fe:
        PAD_TO  00643h-0135h, 000h
d_a0_tbl_0050e:
        PAD_TO  00643h-0125h, 000h
d_a0_tbl_0051e:
        PAD_TO  00643h-0115h, 000h
d_a0_tbl_0052e:
        PAD_TO  00643h, 000h

d_a0_w_00643:
        db      22h, 00h, "This is MPC2000XL System program file $"
ram_066C:
        db      "----TEST--------", 00h
        if      FW_VERSION < 114
FREE_101FD:
; 0x10565-0x10b91, 1580 bytes of 00h -- unverified, do not assume free
        endif
FREE_104ED:
        PAD_TO  00A80h-02h, 000h
d_a0_tbl_00a7e:
        PAD_TO  00A80h, 000h

        db      60h, 00h, 66h, 00h, 6ch, 00h, 72h, 00h, 78h, 00h, 7eh, 00h, 48h, 00h, 54h, 00h ; `.f.l.r.x.~.H.T.
        db      24h, 00h, 36h, 00h, 0ch, 00h, 84h, 00h, 42h, 00h, 1eh, 00h, 18h, 00h, 30h, 00h
        db      2ah, 00h, 3ch, 00h, 5ah, 00h, 12h, 00h, 4eh, 00h, 0a2h, 00h, 0a8h, 00h, 0aeh, 00h
        db      20h, 01h, 26h, 01h, 2ch, 01h, 3eh, 01h, 44h, 01h, 4ah, 01h, 50h, 01h, 32h, 01h ;  .&.,.>.D.J.P.2.
        db      9ch, 00h, 90h, 00h, 8ah, 00h, 96h, 00h, 0fch, 00h, 0f0h, 00h, 0f6h, 00h, 38h, 01h
        db      56h, 01h, 1ah, 01h, 14h, 01h, 02h, 01h, 08h, 01h, 0eh, 01h
ram_0ADC:
        db      "%$*R(&.,0/-+17356EQPABLM8>?@IJG'49:;<=CDFHKNO#)2STUVWXYZ[", 5ch, "]^_`ab"
ram_0B1C:
        db      31 dup (00h)
        db      00h, 04h, 09h, 0eh, 13h, 18h, 1dh
        db      "\"',16;@EJOTY^chmrw|"
        db      07h, 0dh, 13h, 19h, 16h, 1ch
        db      "\"29?EKRX^d"
d_a0_tbl_00b65:
        db      07h, 0fh, 19h, 1fh
        db      "'/7?GOW_gow"
        db      7fh, 00h, 07h, 0eh, 14h, 1bh
        db      "\"(/6<MJPW^d"

        if      FW_VERSION < 114
FREE_10705:
        endif
FREE_109F5:
        PAD_TO  011B1h-062bh, 000h
d_a0_w_00b86:
        PAD_TO  011B1h-0629h, 000h
d_a0_w_00b88:
        PAD_TO  011B1h-0627h, 000h
d_a0_w_00b8a:
        PAD_TO  011B1h-0625h, 000h
d_a0_w_00b8c:
        PAD_TO  011B1h-0623h, 000h
d_a0_w_00b8e:
        PAD_TO  011B1h-0621h, 000h
d_a0_w_00b90:
        PAD_TO  011B1h-061fh, 000h
d_a0_w_00b92:
        PAD_TO  011B1h-061dh, 000h
d_a0_w_00b94:
        PAD_TO  011B1h-061bh, 000h
d_a0_w_00b96:
        PAD_TO  011B1h-0619h, 000h
d_a0_w_00b98:
        PAD_TO  011B1h-0617h, 000h
d_a0_b_00b9a:
        PAD_TO  011B1h-0616h, 000h
d_a0_b_00b9b:
        PAD_TO  011B1h-0615h, 000h
d_a0_tbl_00b9c:
        PAD_TO  011B1h-0415h, 000h
d_a0_w_00d9c:
        PAD_TO  011B1h-0413h, 000h
d_a0_w_00d9e:
        PAD_TO  011B1h-0411h, 000h
d_a0_w_00da0:
        PAD_TO  011B1h-040fh, 000h
d_a0_tbl_00da2:
        PAD_TO  011B1h-030fh, 000h
d_a0_b_00ea2:
        PAD_TO  011B1h-030eh, 000h
d_a0_b_00ea3:
        PAD_TO  011B1h-030dh, 000h
d_a0_b_00ea4:
        PAD_TO  011B1h-030bh, 000h
d_a0_tbl_00ea6:
        PAD_TO  011B1h-02a1h, 000h
d_a2_w_00f10:
        PAD_TO  011B1h-0283h, 000h
d_a2_b_00f2e_2:
        PAD_TO  011B1h-010bh, 000h
d_a0_w_010a6:
        PAD_TO  011B1h-0109h, 000h
d_a0_w_010a8:
        PAD_TO  011B1h-0107h, 000h
d_a0_w_010aa:
        PAD_TO  011B1h-0105h, 000h
d_a0_tbl_010ac:
        PAD_TO  011B1h-05h, 000h
d_a0_b_011ac:
        PAD_TO  011B1h-04h, 000h
d_a0_b_011ad:
        PAD_TO  011B1h-03h, 000h
d_a0_b_011ae:
        PAD_TO  011B1h-02h, 000h
d_a0_b_011af:
        PAD_TO  011B1h-01h, 000h
d_a0_b_011b0:
        PAD_TO  011B1h, 000h

        db      "                            "
        db      00h
        db      "      Write protect !!      "
        db      00h
        db      "     Too many files  !!     "
        db      00h
        db      "      Disk is full  !!      "
        db      00h
        db      "        Wrong disk !!       "
        db      00h
        db      "     Disk Write error !!    "
        db      00h
        db      "       End of file !!       "
        db      00h
        db      "         No disk !!         "
        db      00h
        db      "      File not found !!     "
        db      00h
        db      "     Disk read error !!     "
        db      00h
        db      "        Wrong file !!       "
        db      00h
        db      "    Format is Invalid !!    "
        db      00h
        db      "      No system file !!     "
        db      00h
        db      "    File name exists !!     "
        db      00h
        db      "      No SCSI device !!     "
        db      00h
        db      "      SCSI Not ready !!     "
        db      00h
        db      "   SCSI conflict on ID#6 !  "
        db      00h
        db      "       SCSI error !!        "
        db      00h
        db      "        No F-ROM !!         "
        db      00h
        db      "       F-ROM full  !!       "
        db      00h
        db      "       F-ROM error !!       "
        db      00h
        db      "    F-ROM erase error !!    "
        db      00h
        db      "    F-ROM write error !!    "
        db      00h
        db      "    F-ROM data error !!     "
        db      00h
        db      "      Format error !!       "
        db      00h
        db      "    Insufficient Memory !!  "
        db      00h
        db      "   Folder name exists  !!   "
        db      00h
        db      "          ERROR             "
        db      00h
        db      "  SCSI Block size error !!  "
        db      00h
        db      "        Disk change !!      "
        db      00h
        db      "      FDC SEEK error !!     "
        db      00h
        db      "   Sequnece data error !!   "
        db      00h
        db      "     MIDI Out full !!       "
        db      00h
        db      "File too big:Can't execute!!"
        db      00h
        db      "    Relocation error !!     "
        db      00h
        db      "        DOS ERROR !!        "
        db      00h
        db      "   Boot ROM Not found !!    "
        db      00h
        db      "  Boot ROM  erase error !!  "
        db      00h
        db      "  Boot ROM  write error !!  "
        db      00h
        db      "   Boot ROM  VPP error !!   "
        db      00h
        db      " Boot ROM command error !!  "
        db      00h
        db      "     No floppy device !!    "
        db      00h
        db      "    Device not ready !!     "
        db      00h
        db      "      FAT error !!          "
        db      00h
        db      "     No ATAPI device !!     "
        db      00h
        db      "     Time out error !!      "
        db      00h
        db      "      ATAPI error !!        "
        db      00h
        db      "        Not ready !!        "
        db      00h
        db      "   ATAPI hardware error !!  "
        db      00h
        db      "    SCSI status error !!    "
        db      00h
        db      "  Too many bars! (999max)   "
        db      00h
        db      "    Sequence too big !!     "
        db      00h
        db      "       FDC error !!         "
        if      FW_VERSION >= 110
        db      00h
        db      "     Medium error !!        "
        endif
        if      FW_VERSION >= 114
        db      00h
        db      "   OS version too old !!    "
        endif

; 0x1165b-0x11ef4, 2201 bytes of 00h: BSS
        if      FW_VERSION >= 114
        db      1 dup (0)
d_a0_w_017ec:
        db      2 dup (0)
d_a0_w_017ee:
        db      2 dup (0)
d_a0_w_017f0:
        db      2 dup (0)
d_a0_w_017f2:
        db      2 dup (0)
d_a0_w_017f4:
        db      2 dup (0)
d_a0_w_017f6:
        db      2 dup (0)
d_a0_w_017f8:
        db      2 dup (0)
d_a0_w_017fa:
        db      2 dup (0)
d_a0_w_017fc:
        db      2 dup (0)
d_a0_w_017fe:
        db      2 dup (0)
d_a0_w_01800:
        db      2 dup (0)
d_a0_w_01802:
        db      2 dup (0)
d_a0_w_01804:
        db      64 dup (0)
d_a0_w_01844:
        db      54 dup (0)
d_a0_w_0187a:
        db      10 dup (0)
d_a0_tbl_01884:
        db      28 dup (0)
d_a0_w_018a0:
        db      36 dup (0)
d_a0_w_018c4:
        db      56 dup (0)
d_a0_w_018fc:
        db      24 dup (0)
d_a0_w_01914:
        PAD_TO  02084h, 000h
        elseif  FW_VERSION >= 110
        db      2 dup (0)
d_a0_w_017ec:
        db      2 dup (0)
d_a0_w_017ee:
        db      2 dup (0)
d_a0_w_017f0:
        db      2 dup (0)
d_a0_w_017f2:
        db      2 dup (0)
d_a0_w_017f4:
        db      2 dup (0)
d_a0_w_017f6:
        db      2 dup (0)
d_a0_w_017f8:
        db      2 dup (0)
d_a0_w_017fa:
        db      2 dup (0)
d_a0_w_017fc:
        db      2 dup (0)
d_a0_w_017fe:
        db      2 dup (0)
d_a0_w_01800:
        db      2 dup (0)
d_a0_w_01802:
        db      2 dup (0)
d_a0_w_01804:
        db      64 dup (0)
d_a0_w_01844:
        db      54 dup (0)
d_a0_w_0187a:
        db      10 dup (0)
d_a0_tbl_01884:
        db      28 dup (0)
d_a0_w_018a0:
        db      36 dup (0)
d_a0_w_018c4:
        db      56 dup (0)
d_a0_w_018fc:
        db      8 dup (0)
d_a0_w_018e8:
        db      8 dup (0)
d_a0_w_018f0:
        db      8 dup (0)
d_a0_w_01914:
        PAD_TO  02068h, 000h
        else
        db      1 dup (0)
d_a0_w_017ec:
        db      2 dup (0)
d_a0_w_017ee:
        db      2 dup (0)
d_a0_w_017f0:
        db      2 dup (0)
d_a0_w_017f2:
        db      2 dup (0)
d_a0_w_017f4:
        db      2 dup (0)
d_a0_w_017f6:
        db      2 dup (0)
d_a0_w_017f8:
        db      2 dup (0)
d_a0_w_017fa:
        db      2 dup (0)
d_a0_w_017fc:
        db      2 dup (0)
d_a0_w_017fe:
        db      2 dup (0)
d_a0_w_01800:
        db      2 dup (0)
d_a0_w_01802:
        db      2 dup (0)
d_a0_w_01804:
        db      64 dup (0)
d_a0_w_01844:
        db      54 dup (0)
d_a0_w_0187a:
        db      10 dup (0)
d_a0_tbl_01884:
        db      28 dup (0)
d_a0_w_018a0:
        db      36 dup (0)
d_a0_w_018c4:
        db      56 dup (0)
d_a0_w_018fc:
        db      8 dup (0)
d_a0_w_018e8:
        db      8 dup (0)
d_a0_w_018f0:
        db      8 dup (0)
d_a0_w_01914:
        PAD_TO  0204Ah, 000h
        endif

d_a0_b_undo_seq_mark:
        db      5ah
d_a0_b_02069:
        db      5ah

; 0x11ef6-0x12062, 364 bytes of 00h: BSS
        if      FW_VERSION >= 114
FREE_11EF6:
d_a0_w_0206a:
        db      4 dup (0)
d_a0_w_0208a:
        db      2 dup (0)
d_a0_w_02070:
        db      92 dup (0)
d_a0_b_020e8:
        db      1 dup (0)
d_a0_w_020e9:
        PAD_TO  021F2h, 000h
        else
FREE_11C06:
FREE_11EF6:
d_a0_w_0206a:
        db      4 dup (0)
d_a0_w_0208a:
        db      2 dup (0)
d_a0_w_02070:
        db      92 dup (0)
d_a0_b_020e8:
        db      1 dup (0)
d_a0_w_020e9:
        if      FW_VERSION >= 110
        PAD_TO  021D6h, 000h
        else
        PAD_TO  021B8h, 000h
        endif
        endif

d_a0_w_021f2:
        db      06h

; 0x12063-0x1250a, 1191 bytes of 00h: BSS
        if      FW_VERSION >= 114
FREE_12063:
        db      1 dup (0)
d_a0_w_021f4:
        db      2 dup (0)
d_a0_w_021f6:
        db      3 dup (0)
d_a0_b_021f9:
        db      1 dup (0)
d_a0_b_021fa:
        db      256 dup (0)
d_a0_w_022fa:
        db      2 dup (0)
d_a0_w_022fc:
        db      2 dup (0)
d_a0_w_022fe:
        db      2 dup (0)
d_a0_w_02300:
        db      254 dup (0)
d_a0_w_023fe:
        db      2 dup (0)
d_a0_w_02400:
        db      4 dup (0)
d_a0_w_02404:
        db      2 dup (0)
d_a0_w_02406:
        db      254 dup (0)
d_a0_w_02504:
        db      2 dup (0)
d_a0_w_02506:
        db      4 dup (0)
d_a0_w_0250a:
        db      256 dup (0)
d_a0_w_0260a:
        db      2 dup (0)
d_a0_w_0260c:
        db      4 dup (0)
d_a0_w_02610:
        db      32 dup (0)
d_a0_w_02614:
        db      32 dup (0)
d_a0_w_02650:
        db      2 dup (0)
d_a0_w_02652:
        db      2 dup (0)
d_p_2654:
        db      64 dup (0)
d_a0_w_midi1_sysex_ptr:
        db      2 dup (0)
d_a0_w_0267a:
        db      2 dup (0)
d_a0_b_0267c:
        db      1 dup (0)
d_a0_b_0267d:
        PAD_TO  0269Ah, 000h
        else
FREE_11D73:
FREE_12063:
        db      1 dup (0)
d_a0_w_021f4:
        db      2 dup (0)
d_a0_w_021f6:
        db      4 dup (0)
d_a0_b_021fa:
        db      256 dup (0)
d_a0_w_022fa:
        db      2 dup (0)
d_a0_w_022fc:
        db      2 dup (0)
d_a0_w_022fe:
        db      2 dup (0)
d_a0_w_02300:
        db      254 dup (0)
d_a0_w_023fe:
        db      2 dup (0)
d_a0_w_02400:
        db      4 dup (0)
d_a0_w_02404:
        db      2 dup (0)
d_a0_w_02406:
        db      254 dup (0)
d_a0_w_02504:
        db      2 dup (0)
d_a0_w_02506:
        db      4 dup (0)
d_a0_w_0250a:
        db      256 dup (0)
d_a0_w_0260a:
        db      2 dup (0)
d_a0_w_0260c:
        db      4 dup (0)
d_a0_w_02610:
        db      32 dup (0)
d_a0_w_02614:
        db      32 dup (0)
d_a0_w_02650:
        db      2 dup (0)
d_a0_w_02652:
        db      2 dup (0)
d_p_2654:
        db      64 dup (0)
d_a0_w_midi1_sysex_ptr:
        db      2 dup (0)
d_a0_w_0267a:
        db      2 dup (0)
d_a0_b_0267c:
        db      1 dup (0)
d_a0_b_0267d:
        if      FW_VERSION >= 110
        PAD_TO  0267Eh, 000h
        else
        PAD_TO  02660h, 000h
        endif
        endif

        if      FW_VERSION >= 114
d_a0_w_0269a:
        dw      P_279A
d_a0_w_0269c:
        dw      P_279A
        elseif  FW_VERSION >= 110
d_a0_w_0267e:
        db      5dh, 26h
d_a0_w_0269c:
        db      5dh, 26h
        else
d_a0_w_02660:
        db      30h, 26h
d_a0_w_0269c:
        db      30h, 26h
        endif
d_a0_b_0269e:
        db      00h, 00h, 00h
d_p_26a1:
        db      00h, 00h, 00h
d_a0_b_midi1_rx_track:
        db      00h, 00h
d_p_26a6:
        db      00h
d_a0_b_026a7:
        db      00h
d_a0_w_026a8:
        db      00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_a0_b_026b8:
        db      01h, 02h
        db      04h, 08h, 10h, 20h, 40h, 80h

; 0x12530-0x1274d, 541 bytes of 00h: BSS
        if      FW_VERSION >= 114
FREE_12530:
d_a0_tbl_026c0:
        db      2 dup (0)
d_a0_w_026c2:
        db      254 dup (0)
d_a0_w_027c0:
        db      2 dup (0)
d_a0_w_027c2:
        db      2 dup (0)
d_a0_b_027c4:
        db      256 dup (0)
d_a0_w_028c4:
        db      2 dup (0)
d_a0_w_028c6:
        db      4 dup (0)
d_p_28ca:
        db      2 dup (0)
d_p_28cc:
        db      2 dup (0)
d_a0_w_028ce:
        db      4 dup (0)
d_a0_w_028b6:
        db      1 dup (0)
d_a0_b_028d3:
        db      1 dup (0)
d_a0_b_028d4:
        db      1 dup (0)
d_a0_b_028d5:
        db      1 dup (0)
d_a0_b_028d6:
        db      1 dup (0)
d_a0_b_028d7:
        db      1 dup (0)
d_a0_w_028bc:
        PAD_TO  028DDh, 000h
        else
FREE_12240:
FREE_12530:
d_a0_tbl_026c0:
        db      2 dup (0)
d_a0_w_026c2:
        db      254 dup (0)
d_a0_w_027c0:
        db      2 dup (0)
d_a0_w_027c2:
        db      2 dup (0)
d_a0_b_027c4:
        db      256 dup (0)
d_a0_w_028c4:
        db      2 dup (0)
d_a0_w_028c6:
        db      4 dup (0)
d_p_28ca:
        db      2 dup (0)
d_p_28cc:
        db      2 dup (0)
d_a0_w_028ce:
        db      4 dup (0)
d_a0_w_028b6:
        db      1 dup (0)
d_a0_b_028d3:
        db      1 dup (0)
d_a0_b_028d4:
        db      1 dup (0)
d_a0_b_028d5:
        db      1 dup (0)
d_a0_b_028d6:
        db      1 dup (0)
d_a0_b_028d7:
        db      1 dup (0)
d_a0_w_028bc:
        if      FW_VERSION >= 110
        PAD_TO  028C1h, 000h
        else
        PAD_TO  028A3h, 000h
        endif
        endif

d_a0_b_028c1:
        db      18h, 19h, 1eh, 1eh
d_a0_b_028c5:
        db      29h, 28h, 21h, 21h
d_a0_w_028e5:
        db      49h, 00h, 47h, 00h, 3bh, 00h, 3bh ; ....)(!!I.G.;.;

; 0x1275c-0x12c96, 1338 bytes of 00h: BSS
        if      FW_VERSION >= 114
FREE_1275C:
        db      1 dup (0)
d_a0_w_028ed:
        db      16 dup (0)
d_a0_w_028fd:
        db      16 dup (0)
d_a0_w_0290d:
        db      16 dup (0)
d_a0_w_0291d:
        db      16 dup (0)
d_a0_w_0292d:
        db      32 dup (0)
d_a0_b_0294d:
        db      1 dup (0)
d_a0_w_02932:
        db      128 dup (0)
d_a0_b_029ce:
        db      256 dup (0)
d_a0_w_02ace:
        db      2 dup (0)
d_a0_w_02ad0:
        db      2 dup (0)
d_a0_w_02ad2:
        db      2 dup (0)
d_a0_w_02ad4:
        db      254 dup (0)
d_a0_w_02bd2:
        db      2 dup (0)
d_a0_w_02bd4:
        db      260 dup (0)
d_a0_w_02cd8:
        db      2 dup (0)
d_a0_w_02cda:
        db      4 dup (0)
d_a0_w_02cde:
        db      256 dup (0)
d_a0_w_02dde:
        db      2 dup (0)
d_a0_w_02de0:
        db      4 dup (0)
d_p_2de4:
        db      64 dup (0)
d_a0_w_midi2_sysex_ptr:
        PAD_TO  02E26h, 000h
        else
FREE_1246C:
FREE_1275C:
        db      1 dup (0)
d_a0_w_028ed:
        db      16 dup (0)
d_a0_w_028fd:
        db      16 dup (0)
d_a0_w_0290d:
        db      16 dup (0)
d_a0_w_0291d:
        db      16 dup (0)
d_a0_w_0292d:
        db      32 dup (0)
d_a0_b_0294d:
        db      1 dup (0)
d_a0_w_02932:
        db      128 dup (0)
d_a0_b_029ce:
        db      256 dup (0)
d_a0_w_02ace:
        db      2 dup (0)
d_a0_w_02ad0:
        db      2 dup (0)
d_a0_w_02ad2:
        db      2 dup (0)
d_a0_w_02ad4:
        db      254 dup (0)
d_a0_w_02bd2:
        db      2 dup (0)
d_a0_w_02bd4:
        db      260 dup (0)
d_a0_w_02cd8:
        db      2 dup (0)
d_a0_w_02cda:
        db      4 dup (0)
d_a0_w_02cde:
        db      256 dup (0)
d_a0_w_02dde:
        db      2 dup (0)
d_a0_w_02de0:
        db      4 dup (0)
d_p_2de4:
        db      64 dup (0)
d_a0_w_midi2_sysex_ptr:
        if      FW_VERSION >= 110
        PAD_TO  02E0Ah, 000h
        else
        PAD_TO  02DECh, 000h
        endif
        endif

d_a0_w_02e0a:
        if      FW_VERSION >= 114
d_a0_w_02e26:
        dw      P_3071, P_3071
        elseif  FW_VERSION >= 112
        db      34h, 2fh, 34h, 2fh
        elseif  FW_VERSION >= 110
        db      32h, 2fh, 32h, 2fh
        else
d_a0_w_02dec:
        db      0f4h, 2eh, 0f4h, 2eh
        endif
d_a0_b_02e0e:
        db      00h, 00h, 00h, 00h
d_p_2e2e:
        db      00h, 00h
d_a0_b_midi2_rx_track:
        db      00h, 00h
d_a0_b_02e32:
        db      00h
d_a0_b_02e33:
        db      00h
d_a0_w_02e34:
        db      00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0ah, 0ah
        db      0bh, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0ah, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah
        db      0bh, 0bh, 0ah, 0ah, 0ah, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah
        db      0ah, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0ah, 0bh, 0ah, 0ah
        db      0bh, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0ah, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah
        db      0bh, 0bh, 0ah, 0ah, 0ah, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah
        db      0ah, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0ah, 0bh, 0ah, 0ah
        db      0bh, 0bh

; 0x12d18-0x12d80, 104 x 0ah -- tail of the preceding 0ah/0bh table
        if      FW_VERSION >= 114
FREE_12D18:
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
        PAD_TO  02F10h-03eh, 00ah
d_a2_b_02ee2:
        endif
        PAD_TO  02F10h-03bh, 00ah
d_a2_b_02ed5:
        if      FW_VERSION >= 120
        PAD_TO  02F10h-02eh, 00ah
d_a2_b_02ee2:
        endif
        PAD_TO  02F10h-02bh, 00ah
d_a2_b_02ee5:
        PAD_TO  02F10h, 00ah
        else
FREE_12A28:
FREE_12D18:
        if      FW_VERSION >= 110
        PAD_TO  02EF4h-022h, 00ah
d_a2_b_02ee2:
        PAD_TO  02EF4h-01fh, 00ah
d_a2_b_02ed5:
        PAD_TO  02EF4h, 00ah
        else
        PAD_TO  02ED6h-04h, 00ah
d_a2_b_02ee2:
        PAD_TO  02ED6h-01h, 00ah
d_a2_b_02ed5:
        PAD_TO  02ED6h, 00ah
        endif
        endif

        db      08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h
        db      08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h
        db      08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h
        db      08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h
        db      08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h
        db      08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h
        db      08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h
        db      08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h
        db      08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h
        db      08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h
        db      08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h
        db      08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h
        db      08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h
        db      08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h
        db      08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h
        db      08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h
d_a0_w_03008:
        db      00h
d_a0_b_03009:
        db      00h
d_a0_b_0300a:
        db      00h
d_a0_b_0300b:
        db      00h, 00h, 00h
d_a0_b_02ff2:
        db      00h
d_a0_b_02ff3:
        db      00h
d_a0_w_03010:
        if      FW_VERSION >= 112
        if      FW_VERSION >= 114
        db      44h, 2eh, 0a8h, 2eh, 8ch, 2fh, 10h, 2fh
        else
        db      28h, 2eh, 8ch, 2eh, 70h, 2fh, 0f4h, 2eh
        endif
d_a0_w_03018:
        db      00h, 00h
d_a0_w_0301a:
        db      00h, 00h
d_a0_w_0301c:
        db      0f0h, 7fh, 7fh, 06h
        db      03h, 0f7h
d_a0_w_03022:
        db      0f0h, 7fh, 7fh, 06h, 01h, 0f7h
d_a0_w_03028:
        db      0f0h, 7fh, 7fh, 06h, 44h, 06h, 01h
d_a0_b_0302f:
        db      00h
d_a0_b_mtc_gen_minutes:
        db      00h
d_a0_b_mtc_gen_seconds:
        db      00h
d_a0_b_mtc_gen_frames:
        db      00h
d_a0_b_03017:
        db      00h, 0f7h
        else
        if      FW_VERSION >= 110
        db      28h, 2eh, 8ch, 2eh, 70h, 2fh, 0f4h, 2eh
        else
        db      0ah, 2eh, 6eh, 2eh, 52h, 2fh, 0d6h, 2eh
        endif
d_a0_w_0301c:
        db      0f0h, 7fh, 7fh, 06h, 03h, 0f7h
d_a0_w_03022:
        db      0f0h, 7fh
        db      7fh, 06h, 01h, 0f7h
d_a0_w_03028:
        db      0f0h, 7fh, 7fh, 06h, 44h, 06h, 01h
d_a0_b_0302f:
        db      00h
d_a0_b_mtc_gen_minutes:
        db      00h
d_a0_b_mtc_gen_seconds:
        db      00h
d_a0_b_mtc_gen_frames:
        db      00h
d_a0_b_03017:
        db      00h
        db      0f7h
        endif

; 0x12ea5-0x12fb0, 267 bytes of 00h: BSS
        if      FW_VERSION >= 114
FREE_12EA5:
        db      3 dup (0)
d_a0_w_03038:
        db      10 dup (0)
d_a0_w_03042:
        db      4 dup (0)
d_a0_w_0302a:
d_a1_w_0302a:
        db      2 dup (0)
d_a0_w_0302c:
        db      2 dup (0)
d_a0_w_0302e:
        db      8 dup (0)
d_a1_w_03036:
        db      2 dup (0)
d_a1_w_03038:
        db      2 dup (0)
d_a1_w_0303a:
        db      2 dup (0)
d_a0_w_03058:
        db      60 dup (0)
d_a1_w_03078:
        db      2 dup (0)
d_a1_w_0307a:
        db      2 dup (0)
d_a1_w_0307c:
        db      2 dup (0)
d_a0_w_0309a:
        db      6 dup (0)
d_a0_w_030a0:
        db      6 dup (0)
d_a0_w_0308a:
        db      42 dup (0)
d_a0_w_030b4:
        db      6 dup (0)
d_a0_w_030d6:
        db      6 dup (0)
d_a0_w_030dc:
        db      6 dup (0)
d_a0_w_030e2:
        db      6 dup (0)
d_a1_w_030e8:
        db      2 dup (0)
d_a1_w_030ea:
        db      2 dup (0)
d_a1_w_030ec:
        db      14 dup (0)
d_a0_w_030de:
        db      2 dup (0)
d_a0_w_030fc:
        db      4 dup (0)
d_a0_w_030e4:
        db      6 dup (0)
d_p_3106:
        db      6 dup (0)
d_p_310c:
        db      6 dup (0)
d_a0_w_03112:
        db      12 dup (0)
d_a0_w_0311e:
d_a1_w_030fe:
        db      2 dup (0)
d_a1_w_03100:
        db      2 dup (0)
d_a1_w_03102:
        db      2 dup (0)
d_a0_w_03124:
        db      6 dup (0)
d_a0_w_0312a:
        db      6 dup (0)
d_a1_w_03114:
d_a1_w_03130:
        db      2 dup (0)
d_a1_w_03116:
        db      2 dup (0)
d_a1_w_03118:
        db      8 dup (0)
d_p_313c:
        db      2 dup (0)
d_p_313e:
        PAD_TO  03140h, 000h
        else
FREE_12BB5:
FREE_12EA5:
        db      3 dup (0)
        if      FW_VERSION >= 112
d_a0_w_03038:
        db      10 dup (0)
d_a0_w_03042:
        db      4 dup (0)
d_a0_w_0302a:
d_a1_w_0302a:
        db      2 dup (0)
d_a0_w_0302c:
        db      2 dup (0)
d_a0_w_0302e:
        db      8 dup (0)
d_a1_w_03036:
        db      2 dup (0)
d_a1_w_03038:
        db      2 dup (0)
d_a1_w_0303a:
        db      2 dup (0)
d_a0_w_03058:
        db      60 dup (0)
d_a1_w_03078:
        db      2 dup (0)
d_a1_w_0307a:
        db      2 dup (0)
d_a1_w_0307c:
        db      2 dup (0)
d_a0_w_0309a:
        db      6 dup (0)
d_a0_w_030a0:
        db      6 dup (0)
d_a0_w_0308a:
        db      42 dup (0)
d_a0_w_030b4:
        db      6 dup (0)
d_a0_w_030d6:
        db      6 dup (0)
d_a0_w_030dc:
        db      6 dup (0)
d_a0_w_030e2:
        db      6 dup (0)
d_a1_w_030e8:
        db      2 dup (0)
d_a1_w_030ea:
        db      2 dup (0)
d_a1_w_030ec:
        db      14 dup (0)
d_a0_w_030de:
        db      2 dup (0)
d_a0_w_030fc:
        db      4 dup (0)
d_a0_w_030e4:
        db      6 dup (0)
d_p_3106:
        db      6 dup (0)
d_p_310c:
        db      6 dup (0)
d_a0_w_03112:
        db      12 dup (0)
d_a0_w_0311e:
d_a1_w_030fe:
        db      2 dup (0)
d_a1_w_03100:
        db      2 dup (0)
d_a1_w_03102:
        db      2 dup (0)
d_a0_w_03124:
        db      6 dup (0)
d_a0_w_0312a:
        db      6 dup (0)
d_a1_w_03114:
d_a1_w_03130:
        db      2 dup (0)
d_a1_w_03116:
        db      2 dup (0)
d_a1_w_03118:
        db      8 dup (0)
d_p_313c:
        db      2 dup (0)
d_p_313e:
        PAD_TO  03124h, 000h
        elseif  FW_VERSION >= 110
d_a0_w_03018:
        db      10 dup (0)
d_a0_w_03042:
        db      4 dup (0)
d_a0_w_0302a:
d_a1_w_0302a:
        db      2 dup (0)
d_a0_w_0302c:
        db      2 dup (0)
d_a0_w_0302e:
        db      8 dup (0)
d_a1_w_03036:
        db      2 dup (0)
d_a1_w_03038:
        db      2 dup (0)
d_a1_w_0303a:
        db      2 dup (0)
d_a0_w_03038:
d_a0_w_03058:
        db      60 dup (0)
d_a1_w_03078:
        db      2 dup (0)
d_a1_w_0307a:
        db      2 dup (0)
d_a1_w_0307c:
        db      2 dup (0)
d_a0_w_0309a:
        db      6 dup (0)
d_a0_w_030a0:
        db      6 dup (0)
d_a0_w_0308a:
        db      42 dup (0)
d_a0_w_030b4:
        db      6 dup (0)
d_a0_w_030d6:
        db      6 dup (0)
d_a0_w_030dc:
        db      6 dup (0)
d_a0_w_030e2:
        db      6 dup (0)
d_a1_w_030e8:
        db      2 dup (0)
d_a1_w_030ea:
        db      2 dup (0)
d_a1_w_030ec:
        db      14 dup (0)
d_a0_w_030de:
        db      2 dup (0)
d_a0_w_030fc:
        db      4 dup (0)
d_a0_w_030e4:
        db      6 dup (0)
d_p_3106:
        db      6 dup (0)
d_p_310c:
        db      6 dup (0)
d_a0_w_03112:
        db      12 dup (0)
d_a0_w_0311e:
d_a1_w_030fe:
        db      2 dup (0)
d_a1_w_03100:
        db      2 dup (0)
d_a1_w_03102:
        db      2 dup (0)
d_a0_w_03124:
        db      6 dup (0)
d_a0_w_0312a:
        db      6 dup (0)
d_a1_w_03114:
d_a1_w_03130:
        db      2 dup (0)
d_a1_w_03116:
        db      2 dup (0)
d_a1_w_03118:
        db      8 dup (0)
d_p_313c:
        db      2 dup (0)
d_p_313e:
        PAD_TO  03120h, 000h
        else
d_a0_w_03018:
        db      10 dup (0)
d_a0_w_03042:
        db      4 dup (0)
d_a0_w_0302a:
d_a1_w_0302a:
        db      2 dup (0)
d_a0_w_0302c:
        db      2 dup (0)
d_a0_w_0302e:
        db      8 dup (0)
d_a1_w_03036:
        db      2 dup (0)
d_a1_w_03038:
        db      2 dup (0)
d_a1_w_0303a:
        db      2 dup (0)
d_a0_w_03038:
d_a0_w_03058:
        db      60 dup (0)
d_a1_w_03078:
        db      2 dup (0)
d_a1_w_0307a:
        db      2 dup (0)
d_a1_w_0307c:
        db      2 dup (0)
d_a0_w_0309a:
        db      6 dup (0)
d_a0_w_030a0:
        db      6 dup (0)
d_a0_w_0308a:
        db      42 dup (0)
d_a0_w_030b4:
        db      6 dup (0)
d_a0_w_030d6:
        db      6 dup (0)
d_a0_w_030dc:
        db      6 dup (0)
d_a0_w_030e2:
        db      6 dup (0)
d_a1_w_030e8:
        db      2 dup (0)
d_a1_w_030ea:
        db      2 dup (0)
d_a1_w_030ec:
        db      14 dup (0)
d_a0_w_030de:
        db      2 dup (0)
d_a0_w_030fc:
        db      4 dup (0)
d_a0_w_030e4:
        db      6 dup (0)
d_p_3106:
        db      6 dup (0)
d_p_310c:
        db      6 dup (0)
d_a0_w_03112:
        db      12 dup (0)
d_a0_w_0311e:
d_a1_w_030fe:
        db      2 dup (0)
d_a1_w_03100:
        db      2 dup (0)
d_a1_w_03102:
        db      2 dup (0)
d_a0_w_03124:
        db      6 dup (0)
d_a0_w_0312a:
        db      6 dup (0)
d_a1_w_03114:
d_a1_w_03130:
        db      2 dup (0)
d_a1_w_03116:
        db      2 dup (0)
d_a1_w_03118:
        db      8 dup (0)
d_p_313c:
        db      2 dup (0)
d_p_313e:
        PAD_TO  03102h, 000h
        endif
        endif

        db      27h

; 0x12fb1-0x13112, 353 bytes of 00h: BSS
        if      FW_VERSION >= 114
FREE_12FB1:
        db      37 dup (0)
d_a0_w_0314a:
        db      30 dup (0)
d_a0_w_03168:
        db      12 dup (0)
d_a0_w_03190:
        db      18 dup (0)
d_a0_w_031a2:
        db      6 dup (0)
d_a1_w_0318c:
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
        PAD_TO  032A2h-080h, 000h
d_a2_w_03232:
        endif
        if      FW_VERSION >= 120
        PAD_TO  032A2h-070h, 000h
d_a2_w_03232:
        endif
        PAD_TO  032A2h, 000h
        else
FREE_12CC1:
FREE_12FB1:
        db      37 dup (0)
d_a0_w_0314a:
        db      30 dup (0)
d_a0_w_03168:
        db      12 dup (0)
d_a0_w_03190:
        db      18 dup (0)
d_a0_w_031a2:
        db      6 dup (0)
d_a1_w_0318c:
        if      FW_VERSION >= 112
        PAD_TO  03286h-064h, 000h
d_a2_w_03232:
        PAD_TO  03286h, 000h
        elseif  FW_VERSION >= 110
        PAD_TO  03282h-060h, 000h
d_a2_w_03232:
        PAD_TO  03282h, 000h
        else
        PAD_TO  03264h-042h, 000h
d_a2_w_03232:
        PAD_TO  03264h, 000h
        endif
        endif

        db      27h

; 0x13113-0x13274, 353 bytes of 00h: BSS
        if      FW_VERSION >= 114
FREE_13113:
        db      37 dup (0)
d_a0_w_032c8:
        db      66 dup (0)
d_a1_w_032ee:
        db      24 dup (0)
d_a1_w_03306:
        db      2 dup (0)
d_a1_w_03308:
        db      2 dup (0)
d_a1_w_0330a:
        db      8 dup (0)
d_a1_w_0332e:
        db      2 dup (0)
d_a1_w_03330:
        db      2 dup (0)
d_a1_w_03332:
        db      44 dup (0)
d_p_335e:
        db      2 dup (0)
d_p_3360:
        db      2 dup (0)
d_p_3362:
        db      2 dup (0)
d_a0_w_03364:
        db      126 dup (0)
d_a0_w_033e2:
        PAD_TO  03404h, 000h
        else
FREE_12E23:
FREE_13113:
        db      37 dup (0)
d_a0_w_032c8:
        db      66 dup (0)
d_a1_w_032ee:
        db      24 dup (0)
d_a1_w_03306:
        db      2 dup (0)
d_a1_w_03308:
        db      2 dup (0)
d_a1_w_0330a:
        db      8 dup (0)
d_a1_w_03312:
        db      2 dup (0)
d_a1_w_03314:
        db      2 dup (0)
d_a1_w_03316:
        db      44 dup (0)
        if      FW_VERSION >= 112
d_a1_w_0332e:
d_p_335e:
        db      2 dup (0)
d_a1_w_03330:
d_p_3360:
        db      2 dup (0)
d_a1_w_03332:
d_p_3362:
        db      2 dup (0)
d_a0_w_03364:
        db      126 dup (0)
d_a0_w_033e2:
        PAD_TO  033E8h, 000h
        elseif  FW_VERSION >= 110
d_p_335e:
        db      2 dup (0)
d_p_3360:
        db      2 dup (0)
d_p_3362:
        db      2 dup (0)
d_a0_w_03364:
        db      126 dup (0)
d_a0_w_033e2:
        PAD_TO  033E4h, 000h
        else
d_p_335e:
        db      2 dup (0)
d_p_3360:
        db      2 dup (0)
d_p_3362:
        db      2 dup (0)
d_a0_w_03364:
        db      126 dup (0)
d_a0_w_033e2:
        PAD_TO  033C6h, 000h
        endif
        endif

        db      27h

; 0x13275-0x133d6, 353 bytes of 00h: BSS
        if      FW_VERSION >= 114
FREE_13275:
        db      37 dup (0)
d_a0_w_0342a:
        db      27 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03455:
        endif
        db      16 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03455:
        endif
        db      23 dup (0)
d_a0_tbl_0346c:
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
        PAD_TO  03566h-0e2h, 000h
d_a2_w_03494:
        PAD_TO  03566h-0e0h, 000h
d_a2_w_03496:
        endif
        PAD_TO  03566h-0d5h, 000h
d_a2_b_03491:
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
        PAD_TO  03566h-0d3h, 000h
d_a2_b_034a3:
        endif
        if      FW_VERSION >= 120
        PAD_TO  03566h-0d2h, 000h
d_a2_w_03494:
        endif
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
        PAD_TO  03566h-0d0h, 000h
d_a2_b_034a6:
        endif
        if      FW_VERSION >= 120
        PAD_TO  03566h-0d0h, 000h
d_a2_w_03496:
        endif
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
        PAD_TO  03566h-0cdh, 000h
d_a2_b_034a9:
        PAD_TO  03566h-0c7h, 000h
d_a2_w_034af:
        endif
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
        PAD_TO  03566h-0c4h, 000h
d_a2_w_034b2:
        endif
        if      FW_VERSION >= 120
        PAD_TO  03566h-0c3h, 000h
d_a2_b_034a3:
        PAD_TO  03566h-0c0h, 000h
d_a2_b_034a6:
        endif
        if      FW_VERSION >= 120
        PAD_TO  03566h-0bdh, 000h
d_a2_b_034a9:
        PAD_TO  03566h-0b7h, 000h
d_a2_w_034af:
        endif
        if      FW_VERSION >= 120
        PAD_TO  03566h-0b4h, 000h
d_a2_w_034b2:
        endif
        PAD_TO  03566h, 000h
        else
FREE_12F85:
FREE_13275:
        db      37 dup (0)
d_a0_w_0342a:
        db      55 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03455:
        endif
        db      11 dup (0)
d_a0_tbl_0346c:
        if      FW_VERSION >= 112
        PAD_TO  0354Ah-0c6h, 000h
d_a2_w_03494:
        PAD_TO  0354Ah-0c4h, 000h
d_a2_w_03496:
        PAD_TO  0354Ah-0b7h, 000h
d_a2_b_034a3:
        PAD_TO  0354Ah-0b4h, 000h
d_a2_b_034a6:
        PAD_TO  0354Ah-0b1h, 000h
d_a2_b_034a9:
        PAD_TO  0354Ah-0abh, 000h
d_a2_w_034af:
        PAD_TO  0354Ah-0a8h, 000h
d_a2_w_034b2:
        PAD_TO  0354Ah, 000h
        elseif  FW_VERSION >= 110
        PAD_TO  03546h-0c2h, 000h
d_a2_w_03494:
        PAD_TO  03546h-0c0h, 000h
d_a2_w_03496:
        PAD_TO  03546h-0b3h, 000h
d_a2_b_034a3:
        PAD_TO  03546h-0b0h, 000h
d_a2_b_034a6:
        PAD_TO  03546h-0adh, 000h
d_a2_b_034a9:
        PAD_TO  03546h-0a7h, 000h
d_a2_w_034af:
        PAD_TO  03546h-0a4h, 000h
d_a2_w_034b2:
        PAD_TO  03546h, 000h
        else
        PAD_TO  03528h-0a4h, 000h
d_a2_w_03494:
        PAD_TO  03528h-0a2h, 000h
d_a2_w_03496:
        PAD_TO  03528h-095h, 000h
d_a2_b_034a3:
        PAD_TO  03528h-092h, 000h
d_a2_b_034a6:
        PAD_TO  03528h-08fh, 000h
d_a2_b_034a9:
        PAD_TO  03528h-089h, 000h
d_a2_w_034af:
        PAD_TO  03528h-086h, 000h
d_a2_w_034b2:
        PAD_TO  03528h, 000h
        endif
        endif

        db      27h

; 0x133d7-0x13538, 353 bytes of 00h: BSS
        if      FW_VERSION >= 114
FREE_133D7:
        db      37 dup (0)
d_a0_w_0358c:
        PAD_TO  036C8h, 000h
        else
FREE_130E7:
FREE_133D7:
        db      37 dup (0)
d_a0_w_0358c:
        if      FW_VERSION >= 112
        PAD_TO  036ACh, 000h
        elseif  FW_VERSION >= 110
        PAD_TO  036A8h-01ch, 000h
d_a2_w_0368c:
        PAD_TO  036A8h, 000h
        else
        PAD_TO  0368Ah, 000h
        endif
        endif

        db      27h

; 0x13539-0x13619, 224 bytes of 00h: BSS
        if      FW_VERSION >= 114
FREE_13539:
        db      103 dup (0)
d_a0_w_03714:
d_a0_w_03730:
        db      2 dup (0)
d_a0_w_03716:
        db      2 dup (0)
d_a0_w_03718:
        db      2 dup (0)
d_a0_w_0371a:
d_a0_w_03736:
        db      2 dup (0)
d_a0_w_0371c:
        db      2 dup (0)
d_a0_w_0371e:
        db      2 dup (0)
d_a0_w_03720:
d_a0_w_0373c:
        db      4 dup (0)
d_a0_w_03740:
        db      2 dup (0)
d_a0_w_03742:
        db      6 dup (0)
d_a0_w_03748:
        db      6 dup (0)
d_a0_w_0374e:
        db      6 dup (0)
d_a0_w_03754:
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_w_03764:
        endif
        db      6 dup (0)
d_a0_w_0375a:
        db      5 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_0376f:
        endif
        db      5 dup (0)
        if      FW_VERSION >= 120
d_a2_w_03764:
        endif
        db      11 dup (0)
        if      FW_VERSION >= 120
d_a2_b_0376f:
        endif
        db      3 dup (0)
d_a0_w_03756:
        db      2 dup (0)
d_a0_b_03758:
        db      1 dup (0)
d_a0_b_03759:
        db      1 dup (0)
d_a0_b_0375a:
        db      1 dup (0)
d_a0_b_0375b:
        db      1 dup (0)
d_a0_b_0375c:
        db      2 dup (0)
d_a0_w_0375e:
        db      6 dup (0)
d_a0_w_03764:
        db      6 dup (0)
d_a0_w_03766:
        db      2 dup (0)
d_a0_w_03768:
        db      2 dup (0)
d_a0_w_0376e:
        db      2 dup (0)
d_a0_w_03770:
        db      2 dup (0)
d_a0_w_0378e:
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_w_0379f:
        endif
        db      1 dup (0)
d_a0_w_03790:
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_w_037a1:
        endif
        db      14 dup (0)
        if      FW_VERSION >= 120
d_a2_w_0379f:
        endif
        db      2 dup (0)
d_a0_b_037a1:
        if      FW_VERSION >= 120
d_a2_w_037a1:
        endif
        db      1 dup (0)
d_a0_b_03782:
        db      1 dup (0)
d_a0_b_03783:
        db      1 dup (0)
d_a0_b_03784:
        db      1 dup (0)
d_a0_b_037a5:
        db      1 dup (0)
d_a0_b_03786:
        db      1 dup (0)
d_a0_b_0378b:
        db      1 dup (0)
d_p_37a8:
        PAD_TO  037A9h, 000h
        else
FREE_13249:
FREE_13539:
        db      103 dup (0)
d_a0_w_03714:
d_a0_w_03730:
        db      2 dup (0)
d_a0_w_03716:
        db      2 dup (0)
d_a0_w_03718:
        db      2 dup (0)
d_a0_w_0371a:
d_a0_w_03736:
        db      2 dup (0)
d_a0_w_0371c:
        db      2 dup (0)
d_a0_w_0371e:
        db      2 dup (0)
d_a0_w_03720:
d_a0_w_0373c:
        db      4 dup (0)
d_a0_w_03740:
        db      2 dup (0)
d_a0_w_03742:
        db      6 dup (0)
d_a0_w_03748:
        db      6 dup (0)
d_a0_w_0374e:
        db      6 dup (0)
d_a0_w_03754:
        db      6 dup (0)
d_a0_w_0375a:
        db      22 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_w_03764:
        endif
        db      2 dup (0)
d_a0_w_03756:
        db      2 dup (0)
d_a0_b_03758:
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_w_03764:
        endif
        db      1 dup (0)
d_a0_b_03759:
        db      1 dup (0)
d_a0_b_0375a:
        db      1 dup (0)
d_a0_b_0375b:
        db      1 dup (0)
d_a0_b_0375c:
        db      2 dup (0)
d_a0_w_0375e:
        db      1 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_0376f:
        endif
        db      4 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_0376f:
        endif
        db      1 dup (0)
d_a0_w_03764:
        db      6 dup (0)
d_a0_w_03766:
        db      2 dup (0)
d_a0_w_03768:
        db      2 dup (0)
d_a0_w_0376e:
        db      2 dup (0)
d_a0_w_03770:
        db      2 dup (0)
d_a0_w_0378e:
        db      2 dup (0)
d_a0_w_03790:
        db      2 dup (0)
        if      FW_VERSION < 110
d_a2_w_03764:
        endif
        db      11 dup (0)
        if      FW_VERSION < 110
d_a2_b_0376f:
        endif
        db      4 dup (0)
d_a0_b_037a1:
        db      1 dup (0)
d_a0_b_03782:
        db      1 dup (0)
d_a0_b_03783:
        db      1 dup (0)
d_a0_b_03784:
        db      1 dup (0)
d_a0_b_037a5:
        db      1 dup (0)
d_a0_b_03786:
        db      1 dup (0)
d_a0_b_0378b:
        db      1 dup (0)
d_p_37a8:
        if      FW_VERSION >= 112
        PAD_TO  0378Dh, 000h
        elseif  FW_VERSION >= 110
        PAD_TO  03789h, 000h
        else
        PAD_TO  0376Bh, 000h
        endif
        endif

        db      "  "
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_w_0379f:
        endif
        db      "  "
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_w_037a1:
        endif
        db      "  "
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_w_0379f:
        endif
        db      "  "
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_w_037a1:
        endif
        db      "        ABC"
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_037cc:
        endif
        db      "DEFGHIJKLMNOPQRS"
        if      FW_VERSION >= 120
d_a2_b_037cc:
        endif
        db      "T"
        if      FW_VERSION < 110
d_a2_w_0379f:
        endif
        db      "UV"
        if      FW_VERSION < 110
d_a2_w_037a1:
        endif
        db      "WXYZ&#-!("
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_037cc:
        endif
        db      ")abc"
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_037cc:
        endif
        db      "defghijklmnopqrstuvw"
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_w_03800:
        endif
        db      "xyz@'$%{} "
        if      FW_VERSION < 110
d_a2_b_037cc:
        endif
        db      "!#$%&'"
        if      FW_VERSION >= 120
d_a2_w_03800:
        endif
        db      "()-012345678"
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_w_03800:
        endif
        db      "9@AB"
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_w_03800:
        endif
        db      "CDEFGHIJKLMNOPQRSTUVWXYZ_abcde"
        if      FW_VERSION < 110
d_a2_w_03800:
        endif
        db      "fghijklmnopqrstuvwxyz{}"

; 0x136b5-0x137b0, 251 bytes of 00h: BSS
        if      FW_VERSION >= 114
FREE_136B5:
        db      1 dup (0)
d_a0_w_03846:
        PAD_TO  03940h, 000h
        else
FREE_133C5:
FREE_136B5:
        db      1 dup (0)
d_a0_w_03846:
        if      FW_VERSION >= 112
        PAD_TO  03924h, 000h
        elseif  FW_VERSION >= 110
        PAD_TO  03920h, 000h
        else
        PAD_TO  03902h-024h, 000h
d_a2_w_03b5e:
        PAD_TO  03902h-012h, 000h
d_a2_b_03b70:
        PAD_TO  03902h-010h, 000h
d_a2_tbl_03b72:
        PAD_TO  03902h, 000h
        endif
        endif

        db      27h

; 0x137b1-0x13912, 353 bytes of 00h -- unverified, do not assume free
        if      FW_VERSION >= 114
FREE_137B1:
        PAD_TO  03AA2h, 000h
        else
FREE_134C1:
FREE_137B1:
        if      FW_VERSION >= 112
        PAD_TO  03A86h, 000h
        elseif  FW_VERSION >= 110
        PAD_TO  03A82h, 000h
        else
        PAD_TO  03A64h, 000h
        endif
        endif

        db      27h

; 0x13913-0x1417b, 2152 bytes of 00h: BSS
        if      FW_VERSION >= 114
FREE_13913:
        db      93 dup (0)
d_a0_w_03ae4:
        db      10 dup (0)
d_a0_w_03b0a:
        db      8 dup (0)
d_a0_w_03af6:
        db      60 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_w_03b5e:
        endif
        db      16 dup (0)
        if      FW_VERSION >= 120
d_a2_w_03b5e:
        endif
        db      2 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03b70:
        endif
        db      2 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_tbl_03b72:
        endif
        db      14 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03b70:
        endif
        db      2 dup (0)
        if      FW_VERSION >= 120
d_a2_tbl_03b72:
        endif
        db      860 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03ede:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03edf:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03ee0:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03ee1:
        endif
        db      13 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03ede:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03edf:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03ee0:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03ee1:
        endif
        db      31 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_w_03f10:
        endif
        db      9 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f19:
        endif
        db      1 dup (0)
d_a0_w_03f0a:
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f1a:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f1b:
        endif
        db      5 dup (0)
        if      FW_VERSION >= 120
d_a2_w_03f10:
        endif
        db      9 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f19:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f1a:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f1b:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_w_03f2c:
        endif
        db      13 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f39:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f3a:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f3b:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f3c:
        endif
        if      FW_VERSION >= 120
d_a2_w_03f2c:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f3d:
        endif
        db      6 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f43:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f44:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f45:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f46:
        endif
        db      3 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f39:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f3a:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f3b:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f3c:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f3d:
        endif
        db      6 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f43:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f44:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f45:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f46:
        endif
        db      20 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f6a:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f6b:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f6c:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f6d:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f6e:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f6f:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f70:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f71:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f72:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f73:
        endif
        db      3 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f76:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f77:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f78:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f79:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f6a:
        endif
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f7a:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f6b:
        endif
        if      (FW_VERSION >= 114) && (FW_VERSION < 120)
d_a2_b_03f7b:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f6c:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f6d:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f6e:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f6f:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f70:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f71:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f72:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f73:
        endif
        db      3 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f76:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f77:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f78:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f79:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f7a:
        endif
        db      1 dup (0)
        if      FW_VERSION >= 120
d_a2_b_03f7b:
        endif
        db      911 dup (0)
d_a0_w_seq_segment:
        PAD_TO  0430Bh, 000h
        else
FREE_13623:
FREE_13913:
        db      93 dup (0)
d_a0_w_03ae4:
        db      10 dup (0)
d_a0_w_03b0a:
        db      8 dup (0)
d_a0_w_03af6:
        db      88 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_w_03b5e:
        endif
        db      4 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_w_03b5e:
        endif
        db      14 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03b70:
        endif
        db      2 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_tbl_03b72:
        endif
        db      2 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03b70:
        endif
        db      2 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_tbl_03b72:
        endif
        db      282 dup (0)
        if      FW_VERSION < 110
d_a2_b_03ede:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03edf:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03ee0:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03ee1:
        endif
        db      47 dup (0)
        if      FW_VERSION < 110
d_a2_w_03f10:
        endif
        db      9 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f19:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f1a:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f1b:
        endif
        db      17 dup (0)
        if      FW_VERSION < 110
d_a2_w_03f2c:
        endif
        db      13 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f39:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f3a:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f3b:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f3c:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f3d:
        endif
        db      6 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f43:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f44:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f45:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f46:
        endif
        db      36 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f6a:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f6b:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f6c:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f6d:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f6e:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f6f:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f70:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f71:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f72:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f73:
        endif
        db      3 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f76:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f77:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f78:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f79:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f7a:
        endif
        db      1 dup (0)
        if      FW_VERSION < 110
d_a2_b_03f7b:
        endif
        db      433 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03ede:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03edf:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03ee0:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03ee1:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03ede:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03edf:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03ee0:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03ee1:
        endif
        db      25 dup (0)
d_a0_w_03f0a:
        db      18 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_w_03f10:
        endif
        db      4 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_w_03f10:
        endif
        db      5 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f19:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f1a:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f1b:
        endif
        db      2 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f19:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f1a:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f1b:
        endif
        db      13 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_w_03f2c:
        endif
        db      4 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_w_03f2c:
        endif
        db      9 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f39:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f3a:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f3b:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f3c:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f39:
        endif
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f3d:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f3a:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f3b:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f3c:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f3d:
        endif
        db      2 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f43:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f44:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f45:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f46:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f43:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f44:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f45:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f46:
        endif
        db      32 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f6a:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f6b:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f6c:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f6d:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f6a:
        endif
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f6e:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f6b:
        endif
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f6f:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f6c:
        endif
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f70:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f6d:
        endif
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f71:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f6e:
        endif
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f72:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f6f:
        endif
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f73:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f70:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f71:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f72:
        endif
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f76:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f73:
        endif
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f77:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f78:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f79:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f76:
        endif
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f7a:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f77:
        endif
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_03f7b:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f78:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f79:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f7a:
        endif
        db      1 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_03f7b:
        endif
        db      895 dup (0)
d_a0_w_seq_segment:
        if      FW_VERSION >= 112
; 0x13cf1-0x141f7, 1286 bytes of 00h -- unverified, do not assume free
        PAD_TO  042EFh, 000h
        elseif  FW_VERSION >= 110
; 0x13c8d-0x14193, 1286 bytes of 00h -- unverified, do not assume free
        PAD_TO  042EBh, 000h
        else
; 0x13a0f-0x13f15, 1286 bytes of 00h -- unverified, do not assume free
        PAD_TO  042CDh, 000h
        endif
        endif

        db      80h
d_a0_w_0430c:
        db      00h, 0f0h
d_a0_w_042f2:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h
d_a0_w_04300:
        db      00h, 00h
d_a0_w_04302:
        db      00h, 00h, 00h, 00h, 00h, 00h
d_a0_w_04308:
        db      00h, 00h
d_a0_w_04306:
        db      00h, 00h, 00h, 00h
d_a0_w_0430e:
        db      20h
        db      0a1h
d_p_432c:
        db      07h
        if      FW_VERSION >= 114

; 0x1419d-0x146a3, 1286 bytes of 00h: BSS
FREE_1419D:
        db      1 dup (0)
d_a0_w_04312:
        db      2 dup (0)
d_a0_w_04310:
        db      6 dup (0)
d_a0_w_04336:
        db      4 dup (0)
d_p_433a:
        db      6 dup (0)
d_a0_w_04324:
        db      2 dup (0)
d_a0_w_04326:
        db      2 dup (0)
d_a0_w_04344:
        db      2 dup (0)
d_a0_w_0432a:
        db      2 dup (0)
d_a0_w_0432c:
        db      2 dup (0)
d_a0_w_0432e:
        db      2 dup (0)
d_a0_w_04330:
        db      2 dup (0)
d_p_434e:
        db      2 dup (0)
d_a0_w_04350:
        db      2 dup (0)
d_a0_w_04352:
        db      2 dup (0)
d_a0_w_04354:
        db      2 dup (0)
d_a0_w_04356:
        db      6 dup (0)
d_a0_w_04340:
        db      2 dup (0)
d_a0_w_04342:
        db      4 dup (0)
d_a0_w_04362:
        db      2 dup (0)
d_a0_w_04348:
        db      2 dup (0)
d_a0_w_0434a:
        db      2 dup (0)
d_a0_w_04368:
        db      2 dup (0)
d_p_436a:
        db      2 dup (0)
d_p_436c:
        db      4 dup (0)
d_a0_b_04354:
        db      3 dup (0)
d_a0_b_rec_replace:
d_a0_b_rec_replace_v11x:
        db      5 dup (0)
d_a0_b_16_levels:
d_a0_b_16_levels_v11x:
        db      5 dup (0)
d_p_437d:
        db      1 dup (0)
d_a0_b_0437e:
        db      2 dup (0)
d_p_4380:
        db      1 dup (0)
d_a0_b_04365:
        db      1 dup (0)
d_a0_b_04366:
        db      1 dup (0)
d_a0_b_04367:
        db      1 dup (0)
d_a0_b_04368:
d_a0_b_04384:
        db      12 dup (0)
d_a0_w_04374:
        db      2 dup (0)
d_a0_w_04376:
        db      2 dup (0)
d_a0_w_04394:
        db      34 dup (0)
d_a0_w_0439a:
        db      32 dup (0)
d_a0_w_043ba:
        db      38 dup (0)
d_a0_w_043fc:
        db      2 dup (0)
d_a0_w_043fe:
        db      2 dup (0)
d_a0_w_04400:
        db      4 dup (0)
d_a0_w_04404:
        db      2 dup (0)
d_a0_w_04406:
        db      2 dup (0)
d_a0_w_04408:
        db      2 dup (0)
d_a0_w_0440a:
        db      1018 dup (0)
d_a0_w_04804:
        db      4 dup (0)
d_p_4808:
        db      2 dup (0)
d_p_480a:
        db      1 dup (0)
d_a0_w_0480b:
        db      32 dup (0)
d_a0_b_0480f:
        db      1 dup (0)
d_a0_b_04810:
        db      1 dup (0)
d_a0_b_04811:
d_a0_b_0482d:
        db      1 dup (0)
d_a0_w_0482e:
        db      2 dup (0)
d_a0_b_04830:
        db      1 dup (0)
d_a0_b_04815:
        db      1 dup (0)
d_a0_b_04812:
d_a0_b_04816:
        PAD_TO  04833h, 000h
        else
FREE_13EAD:
FREE_1419D:
        db      1 dup (0)
d_a0_w_04312:
        db      2 dup (0)
d_a0_w_04310:
        db      6 dup (0)
d_a0_w_0431a:
        db      4 dup (0)
d_p_433a:
        db      6 dup (0)
d_a0_w_04324:
        db      2 dup (0)
d_a0_w_04326:
        db      2 dup (0)
d_a0_w_04344:
        db      2 dup (0)
d_a0_w_0432a:
        db      2 dup (0)
d_a0_w_0432c:
        db      2 dup (0)
d_a0_w_0432e:
        db      2 dup (0)
d_a0_w_04330:
        db      2 dup (0)
d_p_434e:
        db      2 dup (0)
d_a0_w_04350:
        db      2 dup (0)
d_a0_w_04352:
        db      2 dup (0)
d_a0_w_04354:
        db      2 dup (0)
d_a0_w_04356:
        db      6 dup (0)
d_a0_w_04340:
        db      2 dup (0)
d_a0_w_04342:
        db      4 dup (0)
d_a0_w_04362:
        db      2 dup (0)
d_a0_w_04348:
        db      2 dup (0)
d_a0_w_0434a:
        db      2 dup (0)
d_a0_w_04368:
        db      2 dup (0)
d_p_436a:
        db      2 dup (0)
d_p_436c:
        db      4 dup (0)
d_a0_b_04354:
        db      3 dup (0)
d_a0_b_rec_replace:
d_a0_b_rec_replace_v11x:
        db      5 dup (0)
d_a0_b_16_levels:
d_a0_b_16_levels_v11x:
        db      5 dup (0)
d_p_437d:
        db      1 dup (0)
d_a0_b_0437e:
        db      2 dup (0)
d_p_4380:
        db      1 dup (0)
d_a0_b_04365:
        db      1 dup (0)
d_a0_b_04366:
        db      1 dup (0)
d_a0_b_04367:
        db      1 dup (0)
d_a0_b_04368:
d_a0_b_04384:
        db      12 dup (0)
d_a0_w_04374:
        db      2 dup (0)
d_a0_w_04376:
        db      2 dup (0)
d_a0_w_04394:
        db      34 dup (0)
d_a0_w_0439a:
        db      32 dup (0)
d_a0_w_043ba:
        db      38 dup (0)
d_a0_w_043fc:
        db      2 dup (0)
d_a0_w_043fe:
        db      2 dup (0)
d_a0_w_04400:
        db      4 dup (0)
d_a0_w_04404:
        db      2 dup (0)
d_a0_w_04406:
        db      2 dup (0)
d_a0_w_04408:
        db      2 dup (0)
d_a0_w_0440a:
        db      1018 dup (0)
d_a0_w_04804:
        db      4 dup (0)
d_p_4808:
        db      2 dup (0)
d_p_480a:
        db      1 dup (0)
d_a0_w_0480b:
        db      32 dup (0)
d_a0_b_0480f:
        db      1 dup (0)
d_a0_b_04810:
        db      1 dup (0)
d_a0_b_04811:
d_a0_b_0482d:
        db      1 dup (0)
d_a0_w_0482e:
        db      2 dup (0)
d_a0_b_04830:
        db      1 dup (0)
d_a0_b_04815:
        db      1 dup (0)
d_a0_b_04812:
d_a0_b_04816:
        if      FW_VERSION >= 112
; 0x14214-0x14272, 94 bytes of 00h -- unverified, do not assume free
        PAD_TO  04817h, 000h
        elseif  FW_VERSION >= 110
; 0x141b0-0x1420e, 94 bytes of 00h -- unverified, do not assume free
        PAD_TO  04813h, 000h
        else
; 0x13f32-0x13f90, 94 bytes of 00h -- unverified, do not assume free
        PAD_TO  047F5h, 000h
        endif
        endif

d_a0_w_04813:
        db      01h, 30h, 20h, 18h, 10h, 0ch, 08h
d_a0_b_0483a:
        db      00h, 18h, 00h, 0ch, 00h, 00h, 00h, 00h
d_a0_b_04842:
        db      00h
d_a0_b_04843:
        db      00h, 00h, 00h, 00h
d_a0_b_04847:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h
d_a0_b_0484e:
        db      00h
d_a0_b_0484f:
        db      0ch
        if      FW_VERSION >= 114

; 0x146c0-0x1471e, 94 bytes of 00h: BSS
FREE_146C0:
d_a0_w_04850:
        db      2 dup (0)
d_a0_w_04852:
        db      2 dup (0)
d_a1_w_04854:
        db      4 dup (0)
d_a0_w_04858:
        db      4 dup (0)
d_a0_w_0485c:
        db      6 dup (0)
d_a0_w_04846:
        db      2 dup (0)
d_a0_w_04844:
        db      2 dup (0)
d_a0_w_04866:
        db      2 dup (0)
d_a0_w_04848:
        db      2 dup (0)
d_a0_w_0486a:
        db      64 dup (0)
d_p_48aa:
        PAD_TO  048AEh, 000h
        else
FREE_143D0:
FREE_146C0:
d_a0_w_04850:
        db      2 dup (0)
d_a0_w_04852:
        db      2 dup (0)
d_a1_w_04838:
        db      4 dup (0)
d_a0_w_04858:
        db      4 dup (0)
d_a0_w_0485c:
        db      6 dup (0)
d_a0_w_04846:
        db      2 dup (0)
d_a0_w_04844:
        db      2 dup (0)
d_a0_w_04866:
        db      2 dup (0)
d_a0_w_04848:
        db      2 dup (0)
d_a0_w_0486a:
        db      64 dup (0)
d_p_48aa:
        if      FW_VERSION >= 112
; 0x1428b-0x150b3, 3624 bytes of 00h -- unverified, do not assume free
        PAD_TO  04892h, 000h
        elseif  FW_VERSION >= 110
; 0x14227-0x1504f, 3624 bytes of 00h -- unverified, do not assume free
        PAD_TO  0488Eh, 000h
        else
; 0x13fa9-0x14dd1, 3624 bytes of 00h -- unverified, do not assume free
        PAD_TO  04870h, 000h
        endif
        endif

        db      0f0h, 09h, 00h, 00h
d_p_48b2:
        db      0f0h, 47h, 00h, 44h, 45h, 01h, 00h, 00h
d_p_48ba:
        db      0f7h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h
d_a0_w_048c2:
        db      00h, 00h, 00h, 00h, 0f8h
        if      FW_VERSION >= 114

; 0x14737-0x1555f, 3624 bytes of 00h: BSS
FREE_14737:
        db      4 dup (0)
d_p_48cb:
        db      5 dup (0)
d_a0_w_048b4:
        db      2 dup (0)
d_a0_w_048b6:
        db      112 dup (0)
d_a2_b_04942:
        db      3478 dup (0)
d_a0_w_056d8:
        db      2 dup (0)
d_a0_w_056da:
        db      2 dup (0)
d_a0_b_056dc:
        db      2 dup (0)
d_a0_w_056de:
        db      8 dup (0)
d_a0_w_056e6:
        db      2 dup (0)
d_a0_b_056cc:
        db      1 dup (0)
d_a0_b_056e9:
        db      1 dup (0)
d_a0_w_056ea:
        PAD_TO  056EFh, 000h
        else
FREE_14447:
FREE_14737:
        db      4 dup (0)
d_p_48cb:
        db      5 dup (0)
d_a0_w_048b4:
        db      2 dup (0)
d_a0_w_048b6:
        db      140 dup (0)
        if      (FW_VERSION >= 112) && (FW_VERSION < 114)
d_a2_b_04942:
        endif
        db      4 dup (0)
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
d_a2_b_04942:
        endif
        db      30 dup (0)
        if      FW_VERSION < 110
d_a2_b_04942:
        endif
        db      678 dup (0)
d_a0_tbl_04c06:
        db      2738 dup (0)
d_a0_w_056d8:
        db      2 dup (0)
d_a0_w_056da:
        db      2 dup (0)
d_a0_b_056dc:
        db      2 dup (0)
d_a0_w_056de:
        db      8 dup (0)
d_a0_w_056e6:
        db      2 dup (0)
d_a0_b_056cc:
        db      1 dup (0)
d_a0_b_056e9:
        db      1 dup (0)
d_a0_w_056ea:
        if      FW_VERSION >= 112
; 0x15102-0x16f66, 7780 bytes of 00h -- unverified, do not assume free
        PAD_TO  056D3h, 000h
        elseif  FW_VERSION >= 110
; 0x1509e-0x16f02, 7780 bytes of 00h -- unverified, do not assume free
        PAD_TO  056CFh, 000h
        else
; 0x14e20-0x16c84, 7780 bytes of 00h -- unverified, do not assume free
        PAD_TO  056B1h, 000h
        endif
        endif

d_a0_b_056ef:
        db      44h
d_a0_b_056f0:
        db      08h
d_a0_w_056d5:
        db      40h, 9ch
d_a0_w_056f3:
        db      00h, 00h, 9ch, 08h, 0c2h, 0a2h, 10h, 00h, 44h, 08h, 40h, 9ch
        db      00h, 00h, 0e5h, 06h, 56h, 82h, 14h, 00h, 0e3h, 06h, 35h, 82h, 0ah, 00h
d_a0_w_056f1:
        db      00h, 00h
        db      00h, 0f0h, 00h, 0f4h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_a0_w_0571c:
        db      00h, 00h, 00h, 0f8h, 00h, 0fch
        if      FW_VERSION >= 114

; 0x155ae-0x17412, 7780 bytes of 00h: BSS
FREE_155AE:
        db      41 dup (0)
d_a0_w_0574b:
        db      2 dup (0)
d_a0_w_0574d:
        db      2 dup (0)
d_a0_w_0574f:
        db      2 dup (0)
d_a0_w_05751:
        db      2 dup (0)
d_a0_w_05753:
        db      2 dup (0)
d_a0_w_edit_range_start_lo:
        db      2 dup (0)
d_a0_w_edit_range_start_hi:
        db      2 dup (0)
d_a0_w_05759:
        db      2 dup (0)
d_a0_w_0575b:
        db      2 dup (0)
d_a0_w_0575d:
        db      2 dup (0)
d_a0_w_0575f:
        db      2 dup (0)
d_a0_w_05761:
        db      2 dup (0)
d_a0_w_0577f:
        db      2 dup (0)
d_a0_w_05781:
        db      2 dup (0)
d_a0_w_05767:
        db      2 dup (0)
d_a0_w_edit_copies:
        db      4 dup (0)
d_a0_w_0576d:
        db      2 dup (0)
d_a0_w_0576f:
        db      2 dup (0)
d_p_578d:
        db      2 dup (0)
d_a0_w_05773:
        db      2 dup (0)
d_a0_w_05775:
        db      2 dup (0)
d_p_5793:
        db      2 dup (0)
d_a0_w_05795:
        db      2 dup (0)
d_a0_w_05797:
        db      2 dup (0)
d_p_5799:
        db      2 dup (0)
d_p_579b:
        db      2 dup (0)
d_a0_b_05781:
        db      1 dup (0)
d_a0_b_05782:
        db      1 dup (0)
d_a0_b_05783:
        db      2 dup (0)
d_p_57a1:
        db      1 dup (0)
d_a0_w_057a2:
        PAD_TO  075A2h-01680h, 000h
d_a2_tbl_05f22:
        PAD_TO  075A2h-0f00h, 000h
d_a2_tbl_066a2:
        PAD_TO  075A2h, 000h

d_a2_w_075a2:
        db      0a2h, 57h
d_a2_w_075a4:
        db      0dah, 07h
d_a2_b_075a6:
        db      00h
d_a2_b_075a7:
        db      00h
d_a2_b_075a8:
        db      00h
d_a2_b_075a9:
        db      00h
        else
FREE_152BE:
FREE_155AE:
        db      41 dup (0)
d_a0_w_0574b:
        db      2 dup (0)
d_a0_w_0574d:
        db      2 dup (0)
d_a0_w_0574f:
        db      2 dup (0)
d_a0_w_05751:
        db      2 dup (0)
d_a0_w_05753:
        db      2 dup (0)
d_a0_w_edit_range_start_lo:
        db      2 dup (0)
d_a0_w_edit_range_start_hi:
        db      2 dup (0)
d_a0_w_05759:
        db      2 dup (0)
d_a0_w_0575b:
        db      2 dup (0)
d_a0_w_0575d:
        db      2 dup (0)
d_a0_w_0575f:
        db      2 dup (0)
d_a0_w_05761:
        db      2 dup (0)
d_a0_w_05763:
        db      2 dup (0)
d_a0_w_05781:
        db      2 dup (0)
d_a0_w_05767:
        db      2 dup (0)
d_a0_w_edit_copies:
        db      4 dup (0)
d_a0_w_0576d:
        db      2 dup (0)
d_a0_w_0576f:
        db      2 dup (0)
d_p_578d:
        db      2 dup (0)
d_a0_w_05773:
        db      2 dup (0)
d_a0_w_05775:
        db      2 dup (0)
d_p_5793:
        db      2 dup (0)
d_a0_w_05795:
        db      2 dup (0)
d_a0_w_05797:
        db      2 dup (0)
d_p_5799:
        db      2 dup (0)
d_p_579b:
        db      2 dup (0)
d_a0_b_05781:
        db      1 dup (0)
d_a0_b_05782:
        db      1 dup (0)
d_a0_b_05783:
        db      2 dup (0)
d_p_57a1:
        db      1 dup (0)
d_a0_w_057a2:
        if      FW_VERSION >= 112
        PAD_TO  07586h-01680h, 000h
d_a2_tbl_05f22:
        PAD_TO  07586h-0f00h, 000h
d_a2_tbl_066a2:
        PAD_TO  07586h, 000h
        elseif  FW_VERSION >= 110
        PAD_TO  07582h-01680h, 000h
d_a2_tbl_05f22:
        PAD_TO  07582h-0f00h, 000h
d_a2_tbl_066a2:
        PAD_TO  07582h, 000h
        else
        PAD_TO  07564h-01680h, 000h
d_a2_tbl_05f22:
        PAD_TO  07564h-0f00h, 000h
d_a2_tbl_066a2:
        PAD_TO  07564h, 000h
        endif
d_a2_w_075a2:
        dw      A0_W_057A2
d_a2_w_075a4:
        db      0dah, 07h
d_a2_b_075a6:
        db      00h
d_a2_b_075a7:
        db      00h
d_a2_b_075a8:
        db      00h
d_a2_b_075a9:
        db      00h
        endif
d_a2_b_075aa:
        TBL_BITS_NOTE_NAMES_DATA
d_a2_b_0760e:
        db      00h, 0bch, 0a4h, 0a4h
        db      0a4h, 0a4h, 0a4h, 0bch, 88h, 88h, 88h, 88h, 88h, 88h, 88h, 0bch, 84h, 84h, 0bch, 0a0h
        db      0a0h, 0bch, 0bch, 84h, 84h, 0bch, 84h, 84h, 0bch, 0a0h, 0a8h, 0a8h, 0bch, 88h, 88h, 88h
        db      0bch, 0a0h, 0a0h, 0bch, 84h, 84h, 0bch, 0bch, 0a0h, 0a0h, 0bch, 0a4h, 0a4h, 0bch, 04h, 0ch
        db      0f8h, 0fch, 0f8h, 0ch, 04h, 10h, 0ch, 7ch, 0fch, 7ch, 0ch, 10h, 0f8h, 88h, 88h, 88h
        db      88h, 88h, 0f8h, 0f8h, 0f8h, 0f8h, 0f8h, 0f8h, 0f8h, 0f8h, 0a8h, 50h, 0a8h, 50h, 0a8h, 50h
        db      0a8h, 80h, 0c0h, 0e0h, 0f0h, 0e0h, 0c0h, 80h, 10h, 30h, 70h, 0f0h, 70h, 30h, 10h, 38h
        db      "888|8"
        db      10h, 10h
        db      "8|8888"
        db      08h, 18h, 08h
        call    L_17CFD
        db      1ch, 1ch, 04h, 04h, 0dch, 10h, 10h, 1ch, 0fch, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0ch, 04h, 04h, 04h, 04h, 04h, 0ch
        db      80h, 00h, 00h, 00h, 00h, 00h, 80h, 1ch, 08h, 08h, 08h, 08h, 08h, 1ch, 0e0h, 40h
        db      40h, 40h, 40h, 40h, 0e0h, 3ch, 14h, 14h, 14h, 14h, 14h, 3ch, 0e0h, 40h, 40h, 40h ; @@@@.<.....<.@@@
        db      40h, 40h, 0e0h, 3ch, 10h, 10h, 10h, 10h, 10h, 38h, 0f0h, 0a0h, 0a0h, 0a0h, 40h, 40h
        db      40h, 00h, 60h, 0a0h, 04h, 24h, 28h, 0ch, 00h, 0ch, 50h, 90h, 10h, 10h, 10h, 00h
        db      7ch, 7ch, 7ch, 7ch, 7ch, 00h, 04h, 0ch, 38h, 3ch, 38h, 0ch, 04h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 20h, 20h, 20h, 20h, 00h, 00h
        db      " PPP"
        db      00h, 00h, 00h, 00h, 50h, 50h, 0f8h, 50h, 0f8h
        db      "PP x"
        db      0a0h, 70h, 28h, 0f0h, 20h
        db      0c0h, 0c8h, 10h, 20h, 40h, 98h, 18h, 60h, 90h, 0a0h, 40h, 0a8h, 90h, 68h, 60h, 20h
        db      40h, 00h, 00h, 00h, 00h, 10h, 20h, 40h, 40h, 40h, 20h, 10h, 40h, 20h, 10h, 10h ; @..... @@@ .@ ..
        db      10h, 20h, 40h, 00h, 20h, 0a8h, 70h, 0a8h, 20h, 00h, 00h, 20h, 20h, 0f8h, 20h, 20h ; . @. .p. ..  .  
        db      00h, 00h, 00h, 00h, 00h, 60h, 20h, 40h, 00h, 00h, 00h, 0f8h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 60h, 60h, 00h, 08h, 10h, 20h, 40h, 80h, 00h, 70h, 88h, 98h
        db      0a8h, 0c8h, 88h
        db      "p `    pp"
        db      88h, 08h, 10h, 20h
        db      40h, 0f8h, 0f8h, 10h, 20h, 10h, 08h, 88h, 70h, 10h, 30h, 50h, 90h, 0f8h, 10h, 10h
        db      0f8h, 80h, 0f0h, 08h, 08h, 88h, 70h, 30h, 40h, 80h, 0f0h, 88h, 88h, 70h, 0f8h, 08h
        db      10h, 20h, 40h, 40h, 40h, 70h, 88h, 88h, 70h, 88h, 88h, 70h, 70h, 88h, 88h, 70h ; . @@@p..p..pp..p
        db      08h, 10h, 60h, 00h, 60h, 60h, 00h, 60h, 60h, 00h, 00h, 60h, 60h, 00h, 60h, 20h ; ..`.``.``..``.` 
        db      40h, 10h, 20h, 40h, 80h, 40h, 20h, 10h, 00h, 00h, 0f8h, 00h, 0f8h, 00h, 00h, 40h
        db      20h, 10h, 08h, 10h, 20h, 40h, 70h, 88h, 08h, 10h, 20h, 00h, 20h, 70h, 88h, 08h
        db      68h, 0a8h, 0a8h, 70h, 70h, 88h, 88h, 88h, 0f8h, 88h, 88h, 0f0h, 88h, 88h, 0f0h, 88h
        db      88h, 0f0h, 70h, 88h, 80h, 80h, 80h, 88h, 70h, 0e0h, 90h, 88h, 88h, 88h, 90h, 0e0h
        db      0f8h, 80h, 80h, 0f0h, 80h, 80h, 0f8h, 0f8h, 80h, 80h, 0f0h, 80h, 80h, 80h, 70h, 88h
        db      80h, 0b8h, 88h, 88h, 78h, 88h, 88h, 88h, 0f8h, 88h, 88h, 88h, 70h, 20h, 20h, 20h
        db      20h, 20h, 70h, 38h, 10h, 10h, 10h, 10h, 90h, 60h, 88h, 90h, 0a0h, 0c0h, 0a0h, 90h
        db      88h, 80h, 80h, 80h, 80h, 80h, 80h, 0f8h, 88h, 0d8h, 0a8h, 0a8h, 88h, 88h, 88h, 88h
        db      88h, 0c8h, 0a8h, 98h, 88h, 88h, 70h, 88h, 88h, 88h, 88h, 88h, 70h, 0f0h, 88h, 88h
        db      0f0h, 80h, 80h, 80h, 70h, 88h, 88h, 88h, 0a8h, 90h, 68h, 0f0h, 88h, 88h, 0f0h, 0a0h
        db      90h, 88h, 78h, 80h, 80h, 70h, 08h, 08h, 0f0h, 0f8h
        db      "      "
        db      88h, 88h, 88h, 88h, 88h, 88h, 70h, 88h, 88h, 88h, 88h, 88h, 50h, 20h, 88h, 88h
        db      88h, 0a8h, 0a8h, 0a8h, 50h, 88h, 88h, 50h, 20h, 50h, 88h, 88h, 88h, 88h, 88h, 50h
        db      20h, 20h, 20h, 0f8h, 08h, 10h, 20h, 40h, 80h, 0f8h, 70h, 40h, 40h, 40h, 40h, 40h ;    ... @..p@@@@@
        db      70h, 10h, 10h, 10h, 10h, 10h, 70h, 0e0h, 38h, 08h, 08h, 08h, 08h, 08h, 38h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0f8h, 40h, 20h, 10h
        db      00h, 00h, 00h, 00h, 00h, 00h, 70h, 08h, 78h, 88h, 78h, 80h, 80h, 0b0h, 0c8h, 88h
        db      88h, 0f0h, 00h, 00h, 70h, 80h, 80h, 88h, 70h, 08h, 08h, 68h, 98h, 88h, 88h, 78h
        db      00h, 00h, 70h, 88h, 0f8h, 80h
        db      "p0H@"
        db      0e0h, 40h, 40h, 40h, 00h, 78h
        db      88h, 88h, 78h, 08h, 70h, 80h, 80h, 0b0h, 0c8h, 88h, 88h, 88h, 20h, 00h, 60h, 20h
        db      20h, 20h, 70h, 10h, 00h, 30h, 10h, 10h, 90h, 60h, 80h, 80h, 90h, 0a0h, 0c0h, 0a0h
        db      90h, 60h, 20h, 20h, 20h, 20h, 20h, 70h, 00h, 00h, 0d0h, 0a8h, 0a8h, 88h, 88h, 00h
        db      00h, 0b0h, 0c8h, 88h, 88h, 88h, 00h, 00h, 70h, 88h, 88h, 88h, 70h, 00h, 00h, 0f0h
        db      88h, 0f0h, 80h, 80h, 00h, 00h, 68h, 98h, 78h, 08h, 08h, 00h, 00h, 0b0h, 0c8h, 80h
        db      80h, 80h, 00h, 00h, 70h, 80h, 70h, 08h, 0f0h, 40h, 40h, 0e0h
        db      "@@H0"
        db      00h, 00h, 88h, 88h, 88h, 98h, 68h, 00h, 00h, 88h, 88h, 88h, 50h, 20h, 00h, 00h
        db      88h, 88h, 0a8h, 0a8h, 50h, 00h, 00h, 88h, 50h, 20h, 50h, 88h, 00h, 00h, 88h, 88h
        db      78h, 08h, 70h, 00h, 00h, 0f8h, 10h, 20h, 40h, 0f8h, 10h, 20h, 20h, 40h, 20h, 20h ; x.p.... @..  @  
        db      10h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 40h, 20h, 20h, 10h, 20h, 20h, 40h, 68h ; .       @  .  @h
        db      0b0h, 00h, 00h, 00h, 00h, 00h, 00h, 20h, 40h, 0f8h, 40h, 20h, 00h, 00h, 00h, 00h
        db      00h, 03h, 15h, 00h, 00h, 00h, 00h, 00h, 00h, 7fh, 0ffh, 0f0h, 0bfh, 0e0h, 0ch, 0a0h
        db      20h, 0ch, 0bfh, 0e0h, 0ch, 80h, 08h, 0ach, 83h, 00h, 0ch, 0d4h, 8ah, 0ach, 84h, 80h
        db      0ch, 0d3h, 1bh, 6ch, 80h, 1bh, 6ch, 83h, 00h, 0ch, 83h, 1bh, 6ch, 0a0h, 1bh, 6ch
        db      0aah, 80h, 0ch, 0a0h, 1bh, 6ch, 0aah, 9bh, 6ch, 80h, 00h, 0ch, 7fh, 0ffh, 0fch
        BMP_XS_6CB5_DATA
        db      01h, 07h, 70h, 0ffh, 81h, 81h, 81h, 81h, 0ffh, 04h, 07h, 07h, 00h, 00h
        db      00h, 0fh, 0f0h, 00h, 00h, 0fh, 0f0h, 00h, 00h, 0ffh, 0ffh, 0ffh, 0ffh, 0fh, 0f0h, 00h
        db      00h, 0fh, 0f0h, 00h, 00h, 0fh, 0f0h, 00h, 00h, 01h, 07h, 70h, 0ffh, 0ffh, 0ffh, 0ffh
        db      0ffh, 0ffh, 03h, 07h, 08h, 00h, 10h, 1fh, 0ffh, 0f8h, 3fh, 0ffh, 0fch, 7fh, 0ffh, 0feh
        db      3fh, 0ffh, 0fch, 1fh, 0ffh, 0f8h, 08h, 00h, 10h, 03h, 18h, 00h, 7eh, 00h, 01h, 0ffh
        db      80h, 07h, 0ffh, 0e0h, 0fh, 0ffh, 0f0h, 1fh, 0ffh, 0f8h, 3fh, 0ffh, 0fch, 3fh, 0ffh, 0fch
        db      7fh, 0ffh, 0feh, 7fh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 7fh, 0ffh, 0feh
L_17CFD:
        db      7fh, 0ffh, 0feh, 3fh, 0ffh
        db      0fch, 3fh, 0ffh, 0fch, 1fh, 0ffh, 0f8h, 0fh, 0ffh, 0f0h, 07h, 0ffh, 0e0h, 01h, 0ffh, 80h
        db      00h, 7eh, 00h, 02h, 12h, 03h, 0c0h, 04h, 20h, 0ah, 20h, 09h, 0a0h, 10h, 40h, 10h
        db      40h, 20h, 80h, 20h, 80h, 41h, 00h, 41h, 00h, 82h, 00h, 82h, 00h, 0c4h, 00h, 0fch
        db      00h, 0f8h, 00h, 0f0h, 00h, 0e0h, 00h, 0c0h, 00h, 01h, 09h, 50h, 0f8h, 50h, 0fch, 54h
        db      06h, 05h, 05h, 06h, 01h, 09h, 0e0h, 10h, 60h, 80h, 0f0h, 01h, 0b3h, 0d5h, 93h, 00h
d_a0_w_07ee2:
        db      00h, 80h
d_a0_w_07ee4:
        db      35h, 00h
d_a0_w_07ee6:
        db      00h, 00h
d_a0_w_07ee8:
        db      00h, 00h
d_a0_w_07eea:
        db      00h, 00h
d_a0_w_07eec:
        db      00h, 00h
d_a0_w_07eee:
        db      00h, 00h
d_p_7ef0:
        db      01h
d_a0_b_07ef1:
        db      01h
d_a0_b_07ef2:
        db      08h
; 0x17d63-0x17e5e, 251 bytes of 00h -- unverified, do not assume free
        if      FW_VERSION >= 114
FREE_17D63:
        PAD_TO  07FEEh, 000h
        else
FREE_17A73:
FREE_17D63:
        if      FW_VERSION >= 112
; 0x179b3-0x19f45, 9618 bytes of 00h -- unverified, do not assume free
        PAD_TO  07FD2h, 000h
        elseif  FW_VERSION >= 110
; 0x1794f-0x19eef, 9632 bytes of 00h -- unverified, do not assume free
        PAD_TO  07FCEh, 000h
        else
        PAD_TO  07FB0h, 000h
        endif
        endif

        db      27h

        if      FW_VERSION >= 110
; 0x17e5f-0x1a4b5, 9814 bytes of 00h: BSS
        if      FW_VERSION >= 120
FREE_17E5F:
d_a1_b_08000 equ     $+11h
d_a1_w_0800b equ     $+1ch
d_a1_b_0800d equ     $+1eh
d_a1_w_0800e equ     $+1fh
d_a1_b_08010 equ     $+21h
d_a1_w_08011 equ     $+22h
d_a1_w_08013 equ     $+24h
d_a1_w_08016 equ     $+27h
d_a1_w_08020 equ     $+31h
d_a1_w_08022 equ     $+33h
        db      103 dup (0)
d_a0_w_0803a:
        db      2 dup (0)
d_a0_w_0803c:
        db      2 dup (0)
d_a0_w_0803e:
        db      2 dup (0)
d_a0_b_scsi_cdb:
d_a1_w_scsi_cdb:
        db      2 dup (0)
d_a1_w_0805e:
        db      10 dup (0)
d_a1_b_08068:
        db      2 dup (0)
d_a0_fp_scsi_data_ptr:
        db      2 dup (0)
d_a0_w_scsi_data_seg:
        db      2 dup (0)
d_a0_w_scsi_xfer_len:
        db      2 dup (0)
d_a0_w_scsi_block_size:
        db      2 dup (0)
d_a0_w_08072:
        db      2 dup (0)
d_a0_b_scsi_target_bit:
        db      1 dup (0)
d_a0_b_scsi_own_id_bit:
        db      1 dup (0)
d_a0_b_scsi_status:
        db      1 dup (0)
d_a1_b_08077:
        db      10 dup (0)
d_a0_b_scsi_msg_in_count:
        db      1 dup (0)
d_a1_w_08082:
        db      20 dup (0)
d_a1_w_08096:
        db      2 dup (0)
d_a1_b_08098:
d_a1_w_0809e equ     $+6
d_a1_w_080a0 equ     $+8
d_a1_w_080a6 equ     $+0eh
d_a1_w_080a8 equ     $+10h
        db      18 dup (0)
d_a1_w_scsi_blocks_left:
        db      2 dup (0)
d_a1_w_080ac:
d_a1_b_081c2 equ     $+116h
d_a1_w_081c6 equ     $+11ah
d_a1_w_081ca equ     $+11eh
d_a1_w_081cc equ     $+120h
d_a1_w_081fe equ     $+152h
d_a1_w_083fe equ     $+352h
        db      2048 dup (0)
d_a1_w_088ac:
        db      2 dup (0)
d_a1_w_088ae:
        db      2 dup (0)
d_a1_w_08894:
        db      2 dup (0)
d_a1_w_08896:
        db      2 dup (0)
d_a1_w_088b4:
        db      2 dup (0)
d_a1_w_flashfs_data_addr_lo:
        db      2 dup (0)
d_a1_w_flashfs_data_addr_hi:
        db      2 dup (0)
d_a1_w_088ba:
        db      2 dup (0)
d_a1_w_088bc:
        db      1742 dup (0)
d_a0_b_08f8a:
d_a1_b_0a092 equ     $+1108h
d_a1_b_0a093 equ     $+1109h
d_a1_b_0a095 equ     $+110bh
d_a1_b_0a096 equ     $+110ch
d_a1_w_0a098 equ     $+110eh
d_a1_w_0a09a equ     $+1110h
d_a1_w_0a09c equ     $+1112h
d_a1_w_0a09e equ     $+1114h
d_a1_w_0a0a0 equ     $+1116h
d_a1_w_0a0a2 equ     $+1118h
d_a1_w_0a0a4 equ     $+111ah
d_a1_w_0a0a6 equ     $+111ch
d_a1_w_0a0a8 equ     $+111eh
d_a1_w_0a0aa equ     $+1120h
d_a1_w_0a0ac equ     $+1122h
d_a1_w_0a0ae equ     $+1124h
d_a1_w_0a0b0 equ     $+1126h
d_a1_w_0a0b2 equ     $+1128h
d_a1_w_0a0b4 equ     $+112ah
d_a1_w_0a0b6 equ     $+112ch
d_a1_w_0a0b8 equ     $+112eh
d_a1_w_0a0ba equ     $+1130h
d_a1_w_0a0bc equ     $+1132h
d_a1_w_0a0be equ     $+1134h
d_a1_w_0a0c0 equ     $+1136h
d_a1_w_0a0c2 equ     $+1138h
d_a1_w_0a0c4 equ     $+113ah
d_a1_w_0a0c6 equ     $+113ch
d_a1_w_0a0cc equ     $+1142h
d_a1_w_0a0ce equ     $+1144h
d_a1_b_0a10d equ     $+1183h
d_a1_b_0a10e equ     $+1184h
d_a1_b_0a10f equ     $+1185h
d_a1_b_0a110 equ     $+1186h
d_a1_b_0a111 equ     $+1187h
d_a1_b_0a112 equ     $+1188h
d_a1_b_0a113 equ     $+1189h
d_a1_b_0a114 equ     $+118ah
d_a1_b_0a115 equ     $+118bh
d_a1_b_0a116 equ     $+118ch
d_a1_b_0a117 equ     $+118dh
d_a1_b_0a118 equ     $+118eh
d_a1_b_0a119 equ     $+118fh
d_a1_b_0a11a equ     $+1190h
d_a1_b_0a11b equ     $+1191h
d_a1_b_0a11c equ     $+1192h
d_a1_b_0a11d equ     $+1193h
d_a1_b_0a11e equ     $+1194h
d_a1_b_0a11f equ     $+1195h
        db      5458 dup (0)
d_a1_w_flashfs_dir_entry:
        db      2 dup (0)
d_a1_w_flashfs_remain_lo:
        db      2 dup (0)
d_a1_w_flashfs_remain_hi:
        db      2 dup (0)
d_a1_w_flashfs_addr_lo:
        db      2 dup (0)
d_a1_w_flashfs_addr_hi:
        db      2 dup (0)
d_a1_b_0a4ca:
        db      1 dup (0)
d_a1_b_flashfs_device:
        db      1 dup (0)
d_a1_b_0a4e8:
        db      2 dup (0)
d_a1_w_flashfs_buf_ptr:
        db      2 dup (0)
d_a1_w_flashfs_buf_count:
        db      2 dup (0)
d_a1_w_0a4d2:
        db      2 dup (0)
d_a1_w_0a4d4:
        db      2 dup (0)
d_a1_w_0a4d6:
d_a1_w_0a4f2:
        db      2 dup (0)
d_a1_w_0a4f4:
        db      254 dup (0)
d_a1_w_0a5d6:
        db      32 dup (0)
d_a1_w_flashfs_name_buf:
        db      24 dup (0)
d_a1_w_0a60a:
        db      2 dup (0)
d_a1_w_0a60c:
        db      2 dup (0)
d_p_a62e:
        db      2 dup (0)
d_a1_w_0a614:
        db      2 dup (0)
d_a1_w_0a616:
        db      2 dup (0)
d_a1_w_0a618:
        db      2 dup (0)
d_a1_w_0a61a:
        db      2 dup (0)
d_a1_w_0a61c:
        db      2 dup (0)
d_a1_w_0a61e:
        db      2 dup (0)
d_a1_b_0a620:
d_a1_b_0a63c:
        db      1 dup (0)
d_a1_b_0a621:
        db      1 dup (0)
d_a1_b_0a622:
d_a1_b_0a63e:
        db      1 dup (0)
d_a1_w_0a623:
        db      2 dup (0)
d_a1_w_0a625:
        db      2 dup (0)
d_a1_w_0a627:
        PAD_TO  0A645h, 000h

d_a1_w_0a629:
        db      "                                        "
        db      00h
d_a1_tbl_0a66e:
        db      00h, 00h, 00h, 00h, 60h, 00h, 66h
        db      00h, 6ch, 00h, 72h, 00h, 78h, 00h, 7eh, 00h, 12h, 00h, 18h, 00h, 1eh, 00h, 24h
        db      00h, 2ah, 00h, 30h, 00h, 36h, 00h, 3ch, 00h, 42h, 00h, 48h, 00h, 54h, 00h, 5ah ; .*.0.6.<.B.H.T.Z
        db      00h, 0ch, 00h, 84h, 00h, 8ah, 00h, 90h, 00h, 96h, 00h, 9ch, 00h, 4eh, 00h, 0a2h
        db      00h, 0a8h, 00h, 0aeh, 00h, 20h, 01h, 26h, 01h, 2ch, 01h, 32h, 01h, 38h, 01h, 3eh
        db      01h, 44h, 01h, 4ah, 01h, 50h, 01h, 56h, 01h, 0fch, 00h, 0f0h, 00h, 0f6h, 00h, 0bah
        db      00h, 0b4h, 00h, 0bah, 00h, 0b4h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0c0h, 00h, 0c6h
        db      00h, 0e4h, 00h, 00h, 00h, 00h, 00h, 0cch, 00h, 00h, 00h, 0d8h, 00h, 1ah, 01h, 14h
        db      01h, 0fch, 00h, 02h, 01h, 08h, 01h, 0eh, 01h

; 0x1a55e-0x1a65a, 252 bytes of 00h: BSS
FREE_1A55E:
d_a1_w_0a6ee:
        PAD_TO  0A7EAh, 000h
        else
FREE_17B6F:
        if      FW_VERSION >= 114
d_a1_b_08000 equ     $+11h
d_a1_w_0800b equ     $+1ch
d_a1_b_0800d equ     $+1eh
d_a1_w_0800e equ     $+1fh
d_a1_b_08010 equ     $+21h
d_a1_w_08011 equ     $+22h
d_a1_w_08013 equ     $+24h
d_a1_w_08016 equ     $+27h
d_a1_w_08020 equ     $+31h
d_a1_w_08022 equ     $+33h
        db      103 dup (0)
d_a0_w_0803a:
        db      2 dup (0)
d_a0_w_0803c:
        db      2 dup (0)
d_a0_w_0803e:
        db      2 dup (0)
d_a0_b_scsi_cdb:
d_a1_w_scsi_cdb:
        db      2 dup (0)
d_a1_w_0805e:
        db      10 dup (0)
d_a1_b_08068:
        db      2 dup (0)
d_a0_fp_scsi_data_ptr:
        db      2 dup (0)
d_a0_w_scsi_data_seg:
        db      2 dup (0)
d_a0_w_scsi_xfer_len:
        db      2 dup (0)
d_a0_w_scsi_block_size:
        db      2 dup (0)
d_a0_w_08072:
        db      2 dup (0)
d_a0_b_scsi_target_bit:
        db      1 dup (0)
d_a0_b_scsi_own_id_bit:
        db      1 dup (0)
d_a0_b_scsi_status:
        db      1 dup (0)
d_a1_b_08077:
        db      10 dup (0)
d_a0_b_scsi_msg_in_count:
        db      1 dup (0)
d_a1_w_08082:
        db      20 dup (0)
d_a1_w_08096:
        db      2 dup (0)
d_a1_b_08098:
d_a1_w_0809e equ     $+6
d_a1_w_080a0 equ     $+8
d_a1_w_080a6 equ     $+0eh
d_a1_w_080a8 equ     $+10h
        db      18 dup (0)
d_a1_w_scsi_blocks_left:
        db      2 dup (0)
d_a1_w_080ac:
d_a1_b_081c2 equ     $+116h
d_a1_w_081c6 equ     $+11ah
d_a1_w_081ca equ     $+11eh
d_a1_w_081cc equ     $+120h
d_a1_w_081fe equ     $+152h
d_a1_w_083fe equ     $+352h
        db      2048 dup (0)
d_a1_w_088ac:
        db      2 dup (0)
d_a1_w_088ae:
        db      2 dup (0)
d_a1_w_08894:
        db      2 dup (0)
d_a1_w_08896:
        db      2 dup (0)
d_a1_w_088b4:
        db      2 dup (0)
d_a1_w_flashfs_data_addr_lo:
        db      2 dup (0)
d_a1_w_flashfs_data_addr_hi:
        db      2 dup (0)
d_a1_w_088ba:
        db      2 dup (0)
d_a1_w_088bc:
        db      1742 dup (0)
d_a0_b_08f8a:
d_a1_b_0a092 equ     $+1108h
d_a1_b_0a093 equ     $+1109h
d_a1_b_0a095 equ     $+110bh
d_a1_b_0a096 equ     $+110ch
d_a1_w_0a098 equ     $+110eh
d_a1_w_0a09a equ     $+1110h
d_a1_w_0a09c equ     $+1112h
d_a1_w_0a09e equ     $+1114h
d_a1_w_0a0a0 equ     $+1116h
d_a1_w_0a0a2 equ     $+1118h
d_a1_w_0a0a4 equ     $+111ah
d_a1_w_0a0a6 equ     $+111ch
d_a1_w_0a0a8 equ     $+111eh
d_a1_w_0a0aa equ     $+1120h
d_a1_w_0a0ac equ     $+1122h
d_a1_w_0a0ae equ     $+1124h
d_a1_w_0a0b0 equ     $+1126h
d_a1_w_0a0b2 equ     $+1128h
d_a1_w_0a0b4 equ     $+112ah
d_a1_w_0a0b6 equ     $+112ch
d_a1_w_0a0b8 equ     $+112eh
d_a1_w_0a0ba equ     $+1130h
d_a1_w_0a0bc equ     $+1132h
d_a1_w_0a0be equ     $+1134h
d_a1_w_0a0c0 equ     $+1136h
d_a1_w_0a0c2 equ     $+1138h
d_a1_w_0a0c4 equ     $+113ah
d_a1_w_0a0c6 equ     $+113ch
d_a1_w_0a0cc equ     $+1142h
d_a1_w_0a0ce equ     $+1144h
d_a1_b_0a10d equ     $+1183h
d_a1_b_0a10e equ     $+1184h
d_a1_b_0a10f equ     $+1185h
d_a1_b_0a110 equ     $+1186h
d_a1_b_0a111 equ     $+1187h
d_a1_b_0a112 equ     $+1188h
d_a1_b_0a113 equ     $+1189h
d_a1_b_0a114 equ     $+118ah
d_a1_b_0a115 equ     $+118bh
d_a1_b_0a116 equ     $+118ch
d_a1_b_0a117 equ     $+118dh
d_a1_b_0a118 equ     $+118eh
d_a1_b_0a119 equ     $+118fh
d_a1_b_0a11a equ     $+1190h
d_a1_b_0a11b equ     $+1191h
d_a1_b_0a11c equ     $+1192h
d_a1_b_0a11d equ     $+1193h
d_a1_b_0a11e equ     $+1194h
d_a1_b_0a11f equ     $+1195h
        db      5458 dup (0)
d_a1_w_flashfs_dir_entry:
        db      2 dup (0)
d_a1_w_flashfs_remain_lo:
        db      2 dup (0)
d_a1_w_flashfs_remain_hi:
        db      2 dup (0)
d_a1_w_flashfs_addr_lo:
        db      2 dup (0)
d_a1_w_flashfs_addr_hi:
        db      2 dup (0)
d_a1_b_0a4ca:
        db      1 dup (0)
d_a1_b_flashfs_device:
        db      1 dup (0)
d_a1_b_0a4e8:
        db      2 dup (0)
d_a1_w_flashfs_buf_ptr:
        db      2 dup (0)
d_a1_w_flashfs_buf_count:
        db      2 dup (0)
d_a1_w_0a4d2:
        db      2 dup (0)
d_a1_w_0a4d4:
        db      2 dup (0)
d_a1_w_0a4d6:
d_a1_w_0a4f2:
        db      2 dup (0)
d_a1_w_0a4f4:
        PAD_TO  0A503h, 000h
        elseif  FW_VERSION >= 112
FREE_17E5F:
d_a1_b_08000 equ     $+2dh
d_a1_w_0800b equ     $+38h
d_a1_b_0800d equ     $+3ah
d_a1_w_0800e equ     $+3bh
d_a1_b_08010 equ     $+3dh
d_a1_w_08011 equ     $+3eh
d_a1_w_08013 equ     $+40h
d_a1_w_08016 equ     $+43h
d_a1_w_08020 equ     $+4dh
d_a1_w_08022 equ     $+4fh
        db      103 dup (0)
d_a0_w_0803a:
        db      2 dup (0)
d_a0_w_0803c:
        db      2 dup (0)
d_a0_w_0803e:
        db      2 dup (0)
d_a0_b_scsi_cdb:
d_a1_w_scsi_cdb:
        db      2 dup (0)
d_a1_w_0805e:
        db      10 dup (0)
d_a1_b_08068:
        db      2 dup (0)
d_a0_fp_scsi_data_ptr:
        db      2 dup (0)
d_a0_w_scsi_data_seg:
        db      2 dup (0)
d_a0_w_scsi_xfer_len:
        db      2 dup (0)
d_a0_w_scsi_block_size:
        db      2 dup (0)
d_a0_w_08072:
        db      2 dup (0)
d_a0_b_scsi_target_bit:
        db      1 dup (0)
d_a0_b_scsi_own_id_bit:
        db      1 dup (0)
d_a0_b_scsi_status:
        db      1 dup (0)
d_a1_b_08077:
        db      10 dup (0)
d_a0_b_scsi_msg_in_count:
        db      1 dup (0)
d_a1_w_08082:
        db      20 dup (0)
d_a1_w_08096:
        db      2 dup (0)
d_a1_b_08098:
        db      18 dup (0)
d_a1_w_scsi_blocks_left:
        db      2 dup (0)
d_a1_w_080ac:
d_a1_w_0809e equ     $+0eh
d_a1_w_080a0 equ     $+10h
d_a1_w_080a6 equ     $+16h
d_a1_w_080a8 equ     $+18h
d_a1_b_081c2 equ     $+132h
d_a1_w_081c6 equ     $+136h
d_a1_w_081ca equ     $+13ah
d_a1_w_081cc equ     $+13ch
d_a1_w_081fe equ     $+16eh
d_a1_w_083fe equ     $+36eh
        db      2048 dup (0)
d_a1_w_088ac:
        db      2 dup (0)
d_a1_w_088ae:
        db      2 dup (0)
d_a1_w_08894:
        db      2 dup (0)
d_a1_w_08896:
        db      2 dup (0)
d_a1_w_088b4:
        db      2 dup (0)
d_a1_w_flashfs_data_addr_lo:
        db      2 dup (0)
d_a1_w_flashfs_data_addr_hi:
        db      2 dup (0)
d_a1_w_088ba:
        db      2 dup (0)
d_a1_w_088bc:
        db      1770 dup (0)
d_a0_b_08f8a:
d_a1_b_0a092 equ     $+1108h
d_a1_b_0a093 equ     $+1109h
d_a1_b_0a095 equ     $+110bh
d_a1_b_0a096 equ     $+110ch
d_a1_w_0a098 equ     $+110eh
d_a1_w_0a09a equ     $+1110h
d_a1_w_0a09c equ     $+1112h
d_a1_w_0a09e equ     $+1114h
d_a1_w_0a0a0 equ     $+1116h
d_a1_w_0a0a2 equ     $+1118h
d_a1_w_0a0a4 equ     $+111ah
d_a1_w_0a0a6 equ     $+111ch
d_a1_w_0a0a8 equ     $+111eh
d_a1_w_0a0aa equ     $+1120h
d_a1_w_0a0ac equ     $+1122h
d_a1_w_0a0ae equ     $+1124h
d_a1_w_0a0b0 equ     $+1126h
d_a1_w_0a0b2 equ     $+1128h
d_a1_w_0a0b4 equ     $+112ah
d_a1_w_0a0b6 equ     $+112ch
d_a1_w_0a0b8 equ     $+112eh
d_a1_w_0a0ba equ     $+1130h
d_a1_w_0a0bc equ     $+1132h
d_a1_w_0a0be equ     $+1134h
d_a1_w_0a0c0 equ     $+1136h
d_a1_w_0a0c2 equ     $+1138h
d_a1_w_0a0c4 equ     $+113ah
d_a1_w_0a0c6 equ     $+113ch
d_a1_w_0a0cc equ     $+1142h
d_a1_w_0a0ce equ     $+1144h
d_a1_b_0a10d equ     $+1183h
d_a1_b_0a10e equ     $+1184h
d_a1_b_0a10f equ     $+1185h
d_a1_b_0a110 equ     $+1186h
d_a1_b_0a111 equ     $+1187h
d_a1_b_0a112 equ     $+1188h
d_a1_b_0a113 equ     $+1189h
d_a1_b_0a114 equ     $+118ah
d_a1_b_0a115 equ     $+118bh
d_a1_b_0a116 equ     $+118ch
d_a1_b_0a117 equ     $+118dh
d_a1_b_0a118 equ     $+118eh
d_a1_b_0a119 equ     $+118fh
d_a1_b_0a11a equ     $+1190h
d_a1_b_0a11b equ     $+1191h
d_a1_b_0a11c equ     $+1192h
d_a1_b_0a11d equ     $+1193h
d_a1_b_0a11e equ     $+1194h
d_a1_b_0a11f equ     $+1195h
        db      5430 dup (0)
d_a1_w_flashfs_dir_entry:
        db      2 dup (0)
d_a1_w_flashfs_remain_lo:
        db      2 dup (0)
d_a1_w_flashfs_remain_hi:
        db      2 dup (0)
d_a1_w_flashfs_addr_lo:
        db      2 dup (0)
d_a1_w_flashfs_addr_hi:
        db      2 dup (0)
d_a1_b_0a4ca:
        db      1 dup (0)
d_a1_b_flashfs_device:
        db      1 dup (0)
d_a1_b_0a4e8:
        db      2 dup (0)
d_a1_w_flashfs_buf_ptr:
        db      2 dup (0)
d_a1_w_flashfs_buf_count:
        db      2 dup (0)
d_a1_w_0a4d2:
        db      2 dup (0)
d_a1_w_0a4d4:
        db      2 dup (0)
d_a1_w_0a4d6:
d_a1_w_0a4f2:
        db      2 dup (0)
d_a1_w_0a4f4:
        PAD_TO  0A565h, 000h
        else
FREE_17E5F:
d_a1_b_08000 equ     $+31h
d_a1_w_0800b equ     $+3ch
d_a1_b_0800d equ     $+3eh
d_a1_w_0800e equ     $+3fh
d_a1_b_08010 equ     $+41h
d_a1_w_08011 equ     $+42h
d_a1_w_08013 equ     $+44h
d_a1_w_08016 equ     $+47h
d_a1_w_08020 equ     $+51h
d_a1_w_08022 equ     $+53h
        db      103 dup (0)
d_a0_w_0803a:
        db      2 dup (0)
d_a0_w_0803c:
        db      2 dup (0)
d_a0_w_0803e:
        db      2 dup (0)
d_a0_b_scsi_cdb:
d_a1_w_scsi_cdb:
        db      2 dup (0)
d_a1_w_0805e:
        db      10 dup (0)
d_a1_b_08068:
        db      2 dup (0)
d_a0_fp_scsi_data_ptr:
        db      2 dup (0)
d_a0_w_scsi_data_seg:
        db      2 dup (0)
d_a0_w_scsi_xfer_len:
        db      2 dup (0)
d_a0_w_scsi_block_size:
        db      2 dup (0)
d_a0_w_08072:
        db      2 dup (0)
d_a0_b_scsi_target_bit:
        db      1 dup (0)
d_a0_b_scsi_own_id_bit:
        db      1 dup (0)
d_a0_b_scsi_status:
        db      1 dup (0)
d_a1_b_08077:
        db      10 dup (0)
d_a0_b_scsi_msg_in_count:
        db      1 dup (0)
d_a1_w_08082:
        db      20 dup (0)
d_a1_w_08096:
        db      2 dup (0)
d_a1_b_08098:
        db      18 dup (0)
d_a1_w_scsi_blocks_left:
        db      2 dup (0)
d_a1_w_080ac:
d_a1_w_0809e equ     $+12h
d_a1_w_080a0 equ     $+14h
d_a1_w_080a6 equ     $+1ah
d_a1_w_080a8 equ     $+1ch
d_a1_b_081c2 equ     $+136h
d_a1_w_081c6 equ     $+13ah
d_a1_w_081ca equ     $+13eh
d_a1_w_081cc equ     $+140h
d_a1_w_081fe equ     $+172h
d_a1_w_083fe equ     $+372h
        db      2048 dup (0)
d_a1_w_088ac:
        db      2 dup (0)
d_a1_w_088ae:
        db      2 dup (0)
d_a1_w_08894:
        db      2 dup (0)
d_a1_w_08896:
        db      2 dup (0)
d_a1_w_088b4:
        db      2 dup (0)
d_a1_w_flashfs_data_addr_lo:
        db      2 dup (0)
d_a1_w_flashfs_data_addr_hi:
        db      2 dup (0)
d_a1_w_088ba:
        db      2 dup (0)
d_a1_w_088bc:
        db      1774 dup (0)
d_a0_b_08f8a:
d_a1_b_0a092 equ     $+1108h
d_a1_b_0a093 equ     $+1109h
d_a1_b_0a095 equ     $+110bh
d_a1_b_0a096 equ     $+110ch
d_a1_w_0a098 equ     $+110eh
d_a1_w_0a09a equ     $+1110h
d_a1_w_0a09c equ     $+1112h
d_a1_w_0a09e equ     $+1114h
d_a1_w_0a0a0 equ     $+1116h
d_a1_w_0a0a2 equ     $+1118h
d_a1_w_0a0a4 equ     $+111ah
d_a1_w_0a0a6 equ     $+111ch
d_a1_w_0a0a8 equ     $+111eh
d_a1_w_0a0aa equ     $+1120h
d_a1_w_0a0ac equ     $+1122h
d_a1_w_0a0ae equ     $+1124h
d_a1_w_0a0b0 equ     $+1126h
d_a1_w_0a0b2 equ     $+1128h
d_a1_w_0a0b4 equ     $+112ah
d_a1_w_0a0b6 equ     $+112ch
d_a1_w_0a0b8 equ     $+112eh
d_a1_w_0a0ba equ     $+1130h
d_a1_w_0a0bc equ     $+1132h
d_a1_w_0a0be equ     $+1134h
d_a1_w_0a0c0 equ     $+1136h
d_a1_w_0a0c2 equ     $+1138h
d_a1_w_0a0c4 equ     $+113ah
d_a1_w_0a0c6 equ     $+113ch
d_a1_w_0a0cc equ     $+1142h
d_a1_w_0a0ce equ     $+1144h
d_a1_b_0a10d equ     $+1183h
d_a1_b_0a10e equ     $+1184h
d_a1_b_0a10f equ     $+1185h
d_a1_b_0a110 equ     $+1186h
d_a1_b_0a111 equ     $+1187h
d_a1_b_0a112 equ     $+1188h
d_a1_b_0a113 equ     $+1189h
d_a1_b_0a114 equ     $+118ah
d_a1_b_0a115 equ     $+118bh
d_a1_b_0a116 equ     $+118ch
d_a1_b_0a117 equ     $+118dh
d_a1_b_0a118 equ     $+118eh
d_a1_b_0a119 equ     $+118fh
d_a1_b_0a11a equ     $+1190h
d_a1_b_0a11b equ     $+1191h
d_a1_b_0a11c equ     $+1192h
d_a1_b_0a11d equ     $+1193h
d_a1_b_0a11e equ     $+1194h
d_a1_b_0a11f equ     $+1195h
        db      5426 dup (0)
d_a1_w_flashfs_dir_entry:
        db      2 dup (0)
d_a1_w_flashfs_remain_lo:
        db      2 dup (0)
d_a1_w_flashfs_remain_hi:
        db      2 dup (0)
d_a1_w_flashfs_addr_lo:
        db      2 dup (0)
d_a1_w_flashfs_addr_hi:
        db      2 dup (0)
d_a1_b_0a4ca:
        db      1 dup (0)
d_a1_b_flashfs_device:
        db      1 dup (0)
d_a1_b_0a4e8:
        db      2 dup (0)
d_a1_w_flashfs_buf_ptr:
        db      2 dup (0)
d_a1_w_flashfs_buf_count:
        db      2 dup (0)
d_a1_w_0a4d2:
        db      2 dup (0)
d_a1_w_0a4d4:
        db      2 dup (0)
d_a1_w_0a4d6:
d_a1_w_0a4f2:
        db      2 dup (0)
d_a1_w_0a4f4:
        PAD_TO  0A56Fh, 000h
        endif

; 0x1a083-0x1a1c5, 322 bytes of 00h: BSS
        if      FW_VERSION >= 114
        db      239 dup (0)
d_a1_w_0a5d6:
        db      32 dup (0)
d_a1_w_flashfs_name_buf:
        db      24 dup (0)
d_a1_w_0a60a:
        db      2 dup (0)
d_a1_w_0a60c:
        db      2 dup (0)
d_p_a62e:
        db      2 dup (0)
d_a1_w_0a614:
        db      2 dup (0)
d_a1_w_0a616:
        db      2 dup (0)
d_a1_w_0a618:
        db      2 dup (0)
d_a1_w_0a61a:
        db      2 dup (0)
d_a1_w_0a61c:
        db      2 dup (0)
d_a1_w_0a61e:
        db      2 dup (0)
d_a1_b_0a620:
d_a1_b_0a63c:
        db      1 dup (0)
d_a1_b_0a621:
        db      1 dup (0)
d_a1_b_0a622:
d_a1_b_0a63e:
        db      1 dup (0)
d_a1_w_0a623:
        db      2 dup (0)
d_a1_w_0a625:
        db      2 dup (0)
d_a1_w_0a627:
        PAD_TO  0A645h, 000h
        elseif  FW_VERSION >= 112
; 0x1a0b2-0x1a1ae, 252 bytes of 00h: BSS
        db      113 dup (0)
d_a1_w_0a5d6:
        db      32 dup (0)
d_a1_w_flashfs_name_buf:
        db      24 dup (0)
d_a1_w_0a60a:
        db      2 dup (0)
d_a1_w_0a60c:
        db      2 dup (0)
d_p_a62e:
        db      2 dup (0)
d_a1_w_0a614:
        db      2 dup (0)
d_a1_w_0a616:
        db      2 dup (0)
d_a1_w_0a618:
        db      2 dup (0)
d_a1_w_0a61a:
        db      2 dup (0)
d_a1_w_0a61c:
        db      2 dup (0)
d_a1_w_0a61e:
        db      2 dup (0)
d_a1_b_0a620:
d_a1_b_0a63c:
        db      1 dup (0)
d_a1_b_0a621:
        db      1 dup (0)
d_a1_b_0a622:
d_a1_b_0a63e:
        db      1 dup (0)
d_a1_w_0a623:
        db      2 dup (0)
d_a1_w_0a625:
        db      2 dup (0)
d_a1_w_0a627:
        PAD_TO  0A629h, 000h
        else
; 0x1a04e-0x1a14a, 252 bytes of 00h: BSS
        db      99 dup (0)
d_a1_w_0a5d6:
        db      32 dup (0)
d_a1_w_flashfs_name_buf:
        db      24 dup (0)
d_a1_w_0a60a:
        db      2 dup (0)
d_a1_w_0a60c:
        db      2 dup (0)
d_p_a62e:
        db      2 dup (0)
d_a1_w_0a614:
        db      2 dup (0)
d_a1_w_0a616:
        db      2 dup (0)
d_a1_w_0a618:
        db      2 dup (0)
d_a1_w_0a61a:
        db      2 dup (0)
d_a1_w_0a61c:
        db      2 dup (0)
d_a1_w_0a61e:
        db      2 dup (0)
d_a1_b_0a620:
d_a1_b_0a63c:
        db      1 dup (0)
d_a1_b_0a621:
        db      1 dup (0)
d_a1_b_0a622:
d_a1_b_0a63e:
        db      1 dup (0)
d_a1_w_0a623:
        db      2 dup (0)
d_a1_w_0a625:
        db      2 dup (0)
d_a1_w_0a627:
        PAD_TO  0A625h, 000h
        endif

d_a1_w_0a629:
        db      "                                        "
        db      00h
d_a1_tbl_0a66e:
        db      00h, 00h, 00h, 00h, 60h, 00h, 66h
        db      00h, 6ch, 00h, 72h, 00h, 78h, 00h, 7eh, 00h, 12h, 00h, 18h, 00h, 1eh, 00h, 24h
        db      00h, 2ah, 00h, 30h, 00h, 36h, 00h, 3ch, 00h, 42h, 00h, 48h, 00h, 54h, 00h, 5ah ; .*.0.6.<.B.H.T.Z
        db      00h, 0ch, 00h, 84h, 00h, 8ah, 00h, 90h, 00h, 96h, 00h, 9ch, 00h, 4eh, 00h, 0a2h
        db      00h, 0a8h, 00h, 0aeh, 00h, 20h, 01h, 26h, 01h, 2ch, 01h, 32h, 01h, 38h, 01h, 3eh
        db      01h, 44h, 01h, 4ah, 01h, 50h, 01h, 56h, 01h, 0fch, 00h, 0f0h, 00h, 0f6h, 00h, 0bah
        db      00h, 0b4h, 00h, 0bah, 00h, 0b4h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0c0h, 00h, 0c6h
        db      00h, 0e4h, 00h, 00h, 00h, 00h, 00h, 0cch, 00h, 00h, 00h, 0d8h, 00h, 1ah, 01h, 14h
        db      01h, 0fch, 00h, 02h, 01h, 08h, 01h, 0eh, 01h

; 0x1a26e-0x1a36a, 252 bytes of 00h: BSS
FREE_1A55E:
d_a1_w_0a6ee:
        if      FW_VERSION >= 114
        PAD_TO  0A7EAh, 000h
        elseif  FW_VERSION >= 112
        PAD_TO  0A7CEh, 000h
        else
        PAD_TO  0A7CAh, 000h
        endif
        endif

        else
; 0x176d1-0x19d25, 9812 bytes of 00h: BSS
FREE_17B6F:
FREE_17E5F:
d_a1_b_08000 equ     $+4fh
d_a1_w_0800b equ     $+5ah
d_a1_b_0800d equ     $+5ch
d_a1_w_0800e equ     $+5dh
d_a1_b_08010 equ     $+5fh
d_a1_w_08011 equ     $+60h
d_a1_w_08013 equ     $+62h
d_a1_w_08016 equ     $+65h
        db      103 dup (0)
d_a0_w_0803a:
        db      2 dup (0)
d_a0_w_0803c:
        db      2 dup (0)
d_a0_w_0803e:
        db      2 dup (0)
d_a0_b_scsi_cdb:
d_a1_w_scsi_cdb:
        db      2 dup (0)
d_a1_w_0805e:
d_a1_w_08022 equ     $+2
d_a1_w_08020:
        db      10 dup (0)
d_a0_fp_scsi_data_ptr:
        db      2 dup (0)
d_a0_w_scsi_data_seg:
        db      2 dup (0)
d_a0_w_scsi_xfer_len:
        db      2 dup (0)
d_a0_w_scsi_block_size:
        db      2 dup (0)
d_a0_w_08072:
        db      2 dup (0)
d_a0_b_scsi_target_bit:
        db      1 dup (0)
d_a0_b_scsi_own_id_bit:
        db      1 dup (0)
d_a0_b_scsi_status:
        db      1 dup (0)
d_a1_b_08077:
        db      10 dup (0)
d_a0_b_scsi_msg_in_count:
        db      1 dup (0)
d_a1_w_08082:
        db      20 dup (0)
d_a1_w_08096:
        db      2 dup (0)
d_a1_b_08098:
        db      18 dup (0)
d_a1_w_scsi_blocks_left:
        db      2 dup (0)
d_a1_w_080ac:
d_a1_w_0809e equ     $+32h
d_a1_w_080a0 equ     $+34h
d_a1_w_080a6 equ     $+3ah
d_a1_w_080a8 equ     $+3ch
d_a1_b_081c2 equ     $+156h
d_a1_w_081c6 equ     $+15ah
d_a1_w_081ca equ     $+15eh
d_a1_w_081cc equ     $+160h
d_a1_w_081fe equ     $+192h
d_a1_w_083fe equ     $+392h
        db      2048 dup (0)
d_a1_w_088ac:
        db      2 dup (0)
d_a1_w_088ae:
        db      2 dup (0)
d_a1_w_08894:
        db      2 dup (0)
d_a1_w_08896:
        db      2 dup (0)
d_a1_w_088b4:
        db      2 dup (0)
d_a1_w_flashfs_data_addr_lo:
        db      2 dup (0)
d_a1_w_flashfs_data_addr_hi:
        db      2 dup (0)
d_a1_w_088ba:
        db      2 dup (0)
d_a1_w_088bc:
        db      1806 dup (0)
d_a0_b_08f8a:
d_a1_b_0a092 equ     $+1108h
d_a1_b_0a093 equ     $+1109h
d_a1_b_0a095 equ     $+110bh
d_a1_b_0a096 equ     $+110ch
d_a1_w_0a098 equ     $+110eh
d_a1_w_0a09a equ     $+1110h
d_a1_w_0a09c equ     $+1112h
d_a1_w_0a09e equ     $+1114h
d_a1_w_0a0a0 equ     $+1116h
d_a1_w_0a0a2 equ     $+1118h
d_a1_w_0a0a4 equ     $+111ah
d_a1_w_0a0a6 equ     $+111ch
d_a1_w_0a0a8 equ     $+111eh
d_a1_w_0a0aa equ     $+1120h
d_a1_w_0a0ac equ     $+1122h
d_a1_w_0a0ae equ     $+1124h
d_a1_w_0a0b0 equ     $+1126h
d_a1_w_0a0b2 equ     $+1128h
d_a1_w_0a0b4 equ     $+112ah
d_a1_w_0a0b6 equ     $+112ch
d_a1_w_0a0b8 equ     $+112eh
d_a1_w_0a0ba equ     $+1130h
d_a1_w_0a0bc equ     $+1132h
d_a1_w_0a0be equ     $+1134h
d_a1_w_0a0c0 equ     $+1136h
d_a1_w_0a0c2 equ     $+1138h
d_a1_w_0a0c4 equ     $+113ah
d_a1_w_0a0c6 equ     $+113ch
d_a1_w_0a0cc equ     $+1142h
d_a1_w_0a0ce equ     $+1144h
d_a1_b_0a10d equ     $+1183h
d_a1_b_0a10e equ     $+1184h
d_a1_b_0a10f equ     $+1185h
d_a1_b_0a110 equ     $+1186h
d_a1_b_0a111 equ     $+1187h
d_a1_b_0a112 equ     $+1188h
d_a1_b_0a113 equ     $+1189h
d_a1_b_0a114 equ     $+118ah
d_a1_b_0a115 equ     $+118bh
d_a1_b_0a116 equ     $+118ch
d_a1_b_0a117 equ     $+118dh
d_a1_b_0a118 equ     $+118eh
d_a1_b_0a119 equ     $+118fh
d_a1_b_0a11a equ     $+1190h
d_a1_b_0a11b equ     $+1191h
d_a1_b_0a11c equ     $+1192h
d_a1_b_0a11d equ     $+1193h
d_a1_b_0a11e equ     $+1194h
d_a1_b_0a11f equ     $+1195h
        db      5394 dup (0)
d_a1_w_flashfs_dir_entry:
        db      2 dup (0)
d_a1_w_flashfs_remain_lo:
        db      2 dup (0)
d_a1_w_flashfs_remain_hi:
        db      2 dup (0)
d_a1_w_flashfs_addr_lo:
        db      2 dup (0)
d_a1_w_flashfs_addr_hi:
        db      2 dup (0)
d_a1_b_0a4ca:
        db      1 dup (0)
d_a1_b_flashfs_device:
        db      1 dup (0)
d_a1_b_0a4e8:
        db      2 dup (0)
d_a1_w_flashfs_buf_ptr:
        db      2 dup (0)
d_a1_w_flashfs_buf_count:
        db      2 dup (0)
d_a1_w_0a4d2:
        db      2 dup (0)
d_a1_w_0a4d4:
        db      2 dup (0)
d_a1_w_0a4d6:
d_a1_w_0a4f2:
        db      2 dup (0)
d_a1_w_0a4f4:
        db      254 dup (0)
d_a1_w_0a5d6:
        db      32 dup (0)
d_a1_w_flashfs_name_buf:
        db      24 dup (0)
d_a1_w_0a60a:
        db      2 dup (0)
d_a1_w_0a60c:
        db      2 dup (0)
d_p_a62e:
        db      2 dup (0)
d_a1_w_0a614:
        db      2 dup (0)
d_a1_w_0a616:
        db      2 dup (0)
d_a1_w_0a618:
        db      2 dup (0)
d_a1_w_0a61a:
        db      2 dup (0)
d_a1_w_0a61c:
        db      2 dup (0)
d_a1_w_0a61e:
        db      2 dup (0)
d_a1_b_0a620:
d_a1_b_0a63c:
        db      1 dup (0)
d_a1_b_0a621:
        db      1 dup (0)
d_a1_b_0a622:
d_a1_b_0a63e:
        db      1 dup (0)
d_a1_w_0a623:
        db      2 dup (0)
d_a1_w_0a625:
        db      2 dup (0)
d_a1_w_0a627:
        PAD_TO  0A605h, 000h

d_a1_w_0a629:
        db      "                                        "
        db      00h
d_a1_tbl_0a62e:
        db      00h, 00h, 00h, 00h, 60h, 00h, 66h
        db      00h, 6ch, 00h, 72h, 00h, 78h, 00h, 7eh, 00h, 12h, 00h, 18h, 00h, 1eh, 00h, 24h
        db      00h, 2ah, 00h, 30h, 00h, 36h, 00h, 3ch, 00h, 42h, 00h, 48h, 00h, 54h, 00h, 5ah ; .*.0.6.<.B.H.T.Z
        db      00h, 0ch, 00h, 84h, 00h, 8ah, 00h, 90h, 00h, 96h, 00h, 9ch, 00h, 4eh, 00h, 0a2h
        db      00h, 0a8h, 00h, 0aeh, 00h, 20h, 01h, 26h, 01h, 2ch, 01h, 32h, 01h, 38h, 01h, 3eh
        db      01h, 44h, 01h, 4ah, 01h, 50h, 01h, 56h, 01h, 0fch, 00h, 0f0h, 00h, 0f6h, 00h, 0bah
        db      00h, 0b4h, 00h, 0bah, 00h, 0b4h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0c0h, 00h, 0c6h
        db      00h, 0e4h, 00h, 00h, 00h, 00h, 00h, 0cch, 00h, 00h, 00h, 0d8h, 00h, 1ah, 01h, 14h
        db      01h, 0fch, 00h, 02h, 01h, 08h, 01h, 0eh, 01h

; 0x19dce-0x19eca, 252 bytes of 00h: BSS
FREE_1A55E:
d_a1_w_0a6ee:
        PAD_TO  0A7AAh, 000h

        endif
        db      27h

; 0x1a65b-0x1a9b0, 853 bytes of 00h: BSS
FREE_1A65B:
        if      FW_VERSION >= 110
        if      FW_VERSION >= 120
RAM_TAIL        equ     0AB40h
RAM_TAIL_LEN    equ     355h
        elseif  FW_VERSION >= 114
RAM_TAIL        equ     0A930h
RAM_TAIL_LEN    equ     145h
        else
RAM_TAIL        equ     0A910h
        if      FW_VERSION >= 112
RAM_TAIL_LEN    equ     141h
        else
RAM_TAIL_LEN    equ     145h
        endif
        endif

        else
RAM_TAIL        equ     0A8F0h
RAM_TAIL_LEN    equ     145h

        endif
; the tail keeps its length and its place in the frame: frame data that grows
; into it fails here rather than eat it.
        if      RAM_TAIL-$ < RAM_TAIL_LEN
        error   "ram: the frame runs into its zero tail -- the tail is not free"
        endif
        db      103 dup (0)
d_a1_w_0a836:
        db      2 dup (0)
d_a1_w_0a838:
        db      2 dup (0)
d_a1_w_0a83a:
        db      9 dup (0)
d_at_b_0a85f:
        db      5 dup (0)
d_a1_w_0a844:
        db      2 dup (0)
d_p_a866:
        db      2 dup (0)
d_a1_w_0a84c:
d_a1_w_0a868:
        db      2 dup (0)
d_p_a86a:
        db      62 dup (0)
d_a1_w_0a888:
        db      2 dup (0)
d_a1_b_0a88a:
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
        PAD_TO  RAM_SEG*16+0a88bh-SEGBASE, 000h
d_at_b_0a88b:
        endif
        PAD_TO  RAM_SEG*16+0a8abh-SEGBASE, 000h
d_at_b_0a8ab:
        PAD_TO  RAM_SEG*16+0a8ach-SEGBASE, 000h
d_at_b_0a8ac:
        PAD_TO  RAM_SEG*16+0a8aeh-SEGBASE, 000h
d_at_w_0a8ae:
        PAD_TO  RAM_SEG*16+0a8b0h-SEGBASE, 000h
d_at_w_0a8b0:
        PAD_TO  RAM_SEG*16+0a8b2h-SEGBASE, 000h
d_at_w_0a8b2:
        PAD_TO  RAM_TAIL, 000h
        ifdef   GROWTH_PROOF
        db      GROWTH_PROOF dup (90h)
        endif
xl_display_service:
        sti
        push    ds
        mov     bp, RAM_SEG
        if      FW_VERSION >= 110
        db      8eh
        else
        mov     ds, bp
        mov     bp, sp
        mov     es, word ptr [bp+4]
        mov     bp, word ptr [bp+2]
        sub     bh, bh
        mov     bl, byte ptr es:[bp]
        shl     bx, 1
        inc     bp
        db      2eh, 0ffh, 97h                  ; call word ptr cs:[bx+disp16]: the table is under 80h into CS
        dw      TBL_INT8F_DISPATCH-APP2_CSBASE
        mov     ax, bp
        mov     bp, sp
        mov     word ptr [bp+2], ax
        pop     ds
        iret
TBL_INT8F_DISPATCH:
        dw      disp_svc_init-APP2_CSBASE, disp_svc8f_flush-APP2_CSBASE_A2, disp_svc8f_clear-APP2_CSBASE_A2, disp_svc8f_font-APP2_CSBASE_A2
        dw      disp_svc8f_char-APP2_CSBASE_A2, disp_svc8f_text-APP2_CSBASE_A2, disp_svc8f_msg-APP2_CSBASE_A2, disp_svc_plane0-APP2_CSBASE_A2
        dw      disp_svc8f_num-APP2_CSBASE_A2, disp_svc8f_num0-APP2_CSBASE_A2, disp_svc8f_numr-APP2_CSBASE_A2, disp_svc8f_hex8-APP2_CSBASE_A2
        dw      disp_svc8f_hex16-APP2_CSBASE_A2, disp_svc8f_clip-APP2_CSBASE_A2, disp_svc8f_hline-APP2_CSBASE_A2, disp_svc8f_vline-APP2_CSBASE_A2
        dw      disp_svc8f_hdots-APP2_CSBASE_A2, disp_svc8f_vdots-APP2_CSBASE_A2, disp_svc8f_box-APP2_CSBASE_A2, disp_svc8f_fill-APP2_CSBASE_A2
        dw      disp_svc8f_erase-APP2_CSBASE_A2, disp_svc8f_invert-APP2_CSBASE_A2, disp_svc8f_bmp-APP2_CSBASE_A2, disp_svc8f_bmp_erase-APP2_CSBASE_A2
        dw      disp_svc8f_bmp_invert-APP2_CSBASE_A2, disp_svc8f_softkey-APP2_CSBASE_A2, disp_svc8f_pixel-APP2_CSBASE_A2, disp_svc_nop-APP2_CSBASE
        dw      disp_svc8f_win-APP2_CSBASE_A2, disp_svc_nop-APP2_CSBASE, disp_svc8f_text_idx-APP2_CSBASE_A2, disp_svc8f_plane-APP2_CSBASE_A2
isr_1AA16:
        sti
        pusha
        push    es
        push    ds
        and     bl, 1fh
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     byte ptr [A2_B_LCD_NUM_WIDTH], bh
        sub     bh, bh
        shl     bx, 1
        call    word ptr cs:[bx+TBL_INT90_DISPATCH-APP2_CSBASE]
        pop     ds
        pop     es
        popa
        iret
TBL_INT90_DISPATCH:
        dw      disp_svc_init-APP2_CSBASE, disp_svc_flush-APP2_CSBASE_A2, disp_svc_clear-APP2_CSBASE_A2, disp_svc_font-APP2_CSBASE_A2
        dw      disp_svc_char-APP2_CSBASE_A2, disp_svc_text-APP2_CSBASE_A2, disp_svc_msg-APP2_CSBASE_A2, disp_svc_plane0-APP2_CSBASE_A2
        dw      disp_svc_num-APP2_CSBASE_A2, disp_svc_num0-APP2_CSBASE_A2, disp_svc_numr-APP2_CSBASE_A2, disp_svc_hex8-APP2_CSBASE_A2
        dw      disp_svc_hex16-APP2_CSBASE_A2, disp_svc_clip-APP2_CSBASE_A2, disp_svc_hline-APP2_CSBASE_A2, disp_svc_vline-APP2_CSBASE_A2
        dw      disp_svc_hdots-APP2_CSBASE_A2, disp_svc_vdots-APP2_CSBASE_A2, disp_svc_box-APP2_CSBASE_A2, disp_svc_fill-APP2_CSBASE_A2
        dw      disp_svc_erase-APP2_CSBASE_A2, disp_svc_invert-APP2_CSBASE_A2, disp_svc_bmp-APP2_CSBASE_A2, disp_svc_bmp_erase-APP2_CSBASE_A2
        dw      disp_svc_bmp_invert-APP2_CSBASE_A2, disp_svc_softkey-APP2_CSBASE_A2, disp_svc_nop-APP2_CSBASE, disp_svc_nop-APP2_CSBASE
        dw      disp_svc_win-APP2_CSBASE_A2, disp_svc_nop-APP2_CSBASE, disp_svc_text_idx-APP2_CSBASE_A2, disp_svc_plane-APP2_CSBASE_A2
disp_svc_nop:
        ret
disp_svc_init:
        mov     al, 23h
        endif
